<!--tauceti-status:v1 {"roadmap":"PDE","to_sha":"3a0189695d62134a412200ef4237d0bbb2e95d75","ts":"2026-11-07T02:52:26+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"interval W1p API, Bessel norm equivalence, Sobolev-Poincare on balls, Hoelder and Campanato spaces on open sets, p = infinity trace and Rellich","state":"partial"},{"id":"Layer 2","remaining":"off-diagonal Marcinkiewicz, vector-valued Fefferman-Stein, Gehring, BMO and VMO spaces, Coifman-Rochberg-Weiss and Sarason","state":"partial"},{"id":"Layer 3","remaining":"Aleksandrov-Bakelman-Pucci, variable-coefficient Hopf lemmas and strong maximum principle, sharp n-dimensional Harnack, barriers and regular points","state":"partial"},{"id":"Layer 4","remaining":"H^-1 forcing with liftings, the Fredholm compatibility condition against the adjoint kernel, the Dirichlet spectrum of the Laplacian on general domains","state":"partial"},{"id":"Layer 5","remaining":"W^{1,p} gradient estimates, C^{1,beta} for Hoelder coefficients, Krylov-Safonov, VMO coefficients, boundary and global estimates, Dirichlet solvability","state":"partial"},{"id":"Layer 6","remaining":"Duhamel map into C^{2+alpha}, heat and constant-coefficient isomorphisms, variable coefficients, BUC traces, every order, weights","state":"partial"},{"id":"Layer 7","remaining":"Bernstein and Littlewood-Paley square-function estimates, Besov spaces, paraproducts","state":"partial"},{"id":"Layer 8","state":"untouched"},{"id":"Layer 9","state":"untouched"}],"readme_sha":"566f1f7248a031ea483ba206711dbd72e4a9827a3ce04b54eb7ed52650d25d0e","roadmap":"PDE","to_sha":"3a0189695d62134a412200ef4237d0bbb2e95d75"}-->
# Status: PDE

This file documents the status of the PDE roadmap up until `3a01896` (2026-11-07T02:52:26+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The roadmap is now organised into nine layers, with a wider target list in each. Against that list no layer is finished. Layers 1–6 are each substantially built but have named gaps, Layer 7 has only its Littlewood-Paley blocks, and the Strichartz and quasilinear layers (8 and 9) have not begun.

### Named results

- **Existence and uniqueness for the Dirichlet problem** — on a bounded open set, `-∂ⱼ(aⁱʲ∂ᵢu) + b·∇u + cu = f` with measurable, uniformly elliptic `a`, bounded drift and `c ≥ 0` has exactly one weak solution in `H¹₀(Ω)` ([`existsUnique_isWeakSolutionDirichlet_of_mass_nonneg`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/MaximumPrinciple/Drift.html#TauCeti.PDE.UniformlyEllipticOn.existsUnique_isWeakSolutionDirichlet_of_mass_nonneg)).
- **De Giorgi's theorem** — weak solutions of divergence-form equations with merely measurable, uniformly elliptic coefficients are locally Hölder continuous in every dimension ([`exists_holderOnWith_preciseRepresentative`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Regularity/HolderContinuity.html#TauCeti.PDE.exists_holderOnWith_preciseRepresentative)), and Moser's [Harnack inequality](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Regularity/Harnack.html#TauCeti.PDE.exists_ae_ae_value_le_mul_value) holds in the same generality.
- **The Mihlin-Hörmander multiplier theorem** — a symbol with `‖Dᵏm(ξ)‖ ≤ A‖ξ‖⁻ᵏ` for `k ≤ N`, `2N > n`, gives a Fourier multiplier bounded on `Lᵖ` for `1 < p < ∞` ([`exists_fourierMultiplierCLM_eq_and_norm_le_of_norm_iteratedFDeriv_le`](https://taucetiproject.org/docs/TauCeti/Analysis/Fourier/MihlinHormander.html#TauCeti.exists_fourierMultiplierCLM_eq_and_norm_le_of_norm_iteratedFDeriv_le)).
- **The interior Calderón-Zygmund estimate** — `‖D²u‖_p ≤ C‖Δu‖_p` ([`exists_eLpNorm_iteratedFDeriv_two_le_eLpNorm_laplacian`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Regularity/Hessian/Lp.html#TauCeti.exists_eLpNorm_iteratedFDeriv_two_le_eLpNorm_laplacian)) extends to [continuous coefficients on compact subsets](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Regularity/Hessian/ContinuousCoefficient.html#TauCeti.PDE.exists_lpNorm_iteratedGradient_le_of_sum_mul_inner_eq_of_continuousAt), and its Schauder counterpart to [Hölder coefficients](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Regularity/Hessian/Schauder/HolderCoefficient.html#TauCeti.PDE.exists_holderOnWith_iteratedFDeriv_two_of_sum_smul_fderiv_fderiv_of_holderOnWith).
- **Existence for linear parabolic equations** — in a Gelfand triple, `u' + A(t)u = f`, `u(a) = u₀` has a weak solution whenever `A(t)` satisfies Gårding's inequality ([`exists_hasWeakLineDerivOn_gelfandDual`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Parabolic/Existence.html#TauCeti.exists_hasWeakLineDerivOn_gelfandDual)).

### Notable definitions and infrastructure

- [`Wkp`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Sobolev/Wkp/Basic.html#TauCeti.Wkp) is `W^{k,p}(Ω)` built from weak derivatives. It is complete at every order, satisfies Meyers-Serrin, agrees as a set with the Bessel-potential scale and is invariant under diffeomorphisms. The energy method and all the regularity theory rest on it.
- The [trace operator](https://taucetiproject.org/docs/TauCeti/Analysis/Sobolev/LipschitzDomain/Trace/Frontier.html#TauCeti.W1p.frontierTrace) of a bounded Lipschitz domain maps `W^{1,p}(Ω)` to `Lᵖ(∂Ω)` for `1 ≤ p < ∞`, and its [kernel is exactly `W^{1,p}_0(Ω)`](https://taucetiproject.org/docs/TauCeti/Analysis/Sobolev/LipschitzDomain/Trace/Frontier.html#TauCeti.W1p.ker_frontierTrace). With extension and Rellich-Kondrachov it lets boundary data be posed on genuine domains.
- [`ParabolicC2HolderSpace`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Parabolic/Holder/Two.html#TauCeti.ParabolicC2HolderSpace) is `C_b^{2+α,1+α/2}` on a slab. It has interpolation and absorption inequalities, products and an initial trace. The [Cauchy heat potential](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Parabolic/Holder/CauchyPotential.html#TauCeti.heatCauchyPotentialL) maps into it, which makes the parabolic Schauder isomorphisms statable.

### Roadmap coverage

The README now has nine layers with a wider scope than the old six lanes, so layers once reported as done are partial against the new targets.

- **Layer 1** has density, the embeddings including Trudinger, Lipschitz-domain trace, extension and Rellich. It lacks the interval `W1p` API, Bessel norm equivalence, Sobolev-Poincaré on balls, and Hölder and Campanato spaces on open sets.
- **Layer 2** has Calderón-Zygmund decomposition and bounds, Mihlin-Hörmander, Riesz-Thorin, scalar Fefferman-Stein and John-Nirenberg. It lacks off-diagonal Marcinkiewicz, vector-valued Fefferman-Stein, Gehring, BMO and VMO as spaces, and the commutator theorems.
- **Layer 3** lacks the Aleksandrov-Bakelman-Pucci estimate, the variable-coefficient Hopf lemmas, the `n`-dimensional sharp Harnack inequality and barriers at regular points.
- **Layer 4** has Gårding and coercive existence. It lacks `H⁻¹` data, the Fredholm compatibility condition and the general Dirichlet spectrum.
- **Layer 5** has De Giorgi-Nash-Moser and interior `C^{2,α}` and `W^{2,p}` estimates. Gradient `Lᵖ` estimates, Krylov-Safonov, VMO coefficients, boundary estimates and solvability are missing.
- **Layer 6** has the weak theory and the parabolic Hölder spaces of orders one and two, but no isomorphism theorem.
- **Layer 7** has only dyadic blocks, with no Bernstein inequalities, Besov spaces or paraproducts.
- **Layers 8 and 9** are untouched.

## The frontier

- **The heat isomorphism** — package the Duhamel potential as a map into `C_b^{2+α,1+α/2}`, then prove that `u ↦ (∂ₜu − Δu, u(·,0))` is an isomorphism onto `C_b^{α,α/2} × C_b^{2,α}`. The linear change of coordinates already in place transfers it to every constant-coefficient operator.
- **Variable-coefficient parabolic Schauder theory** — prove the global a priori estimate from the freezing and localisation lemmas, then apply the [method of continuity](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Operator/MethodOfContinuity.html#IsPreconnected.surjective_iff_of_forall_norm_le). Uniformly continuous traces, higher orders and weights all depend on this step.
- **Global elliptic estimates and solvability** — flatten the boundary for variable coefficients, prove global `W^{2,p}` and `C^{2,α}` estimates, and solve the Dirichlet problem in those classes. Layer 9 depends on this.
- **Aleksandrov-Bakelman-Pucci and Krylov-Safonov** — not started. The convex envelope, the contact set and the determinant-trace inequality are the entry point.
- **BMO, VMO and Gehring** — define the spaces and prove the commutator estimates and Gehring's lemma. These feed the VMO-coefficient theory of §5.2 and §5.7 and Meyers' gradient estimate.

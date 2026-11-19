<!--tauceti-status:v1 {"roadmap":"PDE","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3","ts":"2026-11-13T23:20:12Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"Hölder spaces C^{k,α}(Ω) and C^{k,α}_loc(Ω) on an open set","state":"partial"},{"id":"Layer 2","remaining":"the Coifman-Rochberg-Weiss Lp commutator bound and its small-radius VMO form","state":"partial"},{"id":"Layer 3","remaining":"the divergence-form Hopf lemma for weak solutions with Hölder coefficients, n ≥ 2","state":"partial"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","remaining":"Krylov-Safonov weak Harnack and Hölder for strong solutions, W^{1,p} below p = 2, global boundary estimates, C^{2,α} solvability","state":"partial"},{"id":"Layer 6","remaining":"F27.4 BUC traces, F27.5 higher orders, F27.6 weighted solvability","state":"partial"},{"id":"Layer 7","remaining":"the paraproduct and resonant estimates on Hölder-Zygmund spaces and the product map","state":"partial"},{"id":"Layer 8","remaining":"Strichartz in every dimension, the endpoint and inhomogeneous estimates, wave Strichartz","state":"partial"},{"id":"Layer 9","remaining":"the global C^β estimate on C^{1,1} domains, the compact-map existence in dimension d ≥ 2, and the regularity bootstrap","state":"partial"}],"readme_sha":"566f1f7248a031ea483ba206711dbd72e4a9827a3ce04b54eb7ed52650d25d0e","roadmap":"PDE","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3"}-->
# Status: PDE

This file documents the status of the PDE roadmap up until `aa6e43e` (2026-11-13T23:20:12Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The energy method (Layer 4) is done, and the variable-coefficient parabolic Cauchy problem now is too. Every other layer is partial, each with named gaps; quasilinear existence (Layer 9) has only its one-dimensional case.

### Named results

- **The parabolic Cauchy problem with variable coefficients** — for uniformly elliptic coefficients in `C_b^{α,α/2}`, `u ↦ (Pu, u(·,0))` is an isomorphism from `C_b^{2+α,1+α/2}` onto `C_b^{α,α/2} × C_b^{2,α}`, with the backward terminal-value problem and continuous dependence on the coefficients beside it ([`isInvertible_euclideanParabolicOperatorL_prod_spatialTraceL`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Parabolic/Holder/CauchyProblem.html#TauCeti.ParabolicC2HolderSpace.isInvertible_euclideanParabolicOperatorL_prod_spatialTraceL)).
- **The Fredholm alternative** — with no sign condition on `c` and no smallness of the drift, `L u = ℓ` is solvable in `H¹₀(Ω)` exactly when `ℓ` vanishes on the adjoint kernel, and the two kernels have the same finite dimension ([`exists_forall_energyFormH1_eq_iff`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/FredholmAlternative.html#TauCeti.PDE.UniformlyEllipticOn.exists_forall_energyFormH1_eq_iff)).
- **De Giorgi's theorem** — weak solutions of divergence-form equations with measurable, uniformly elliptic coefficients are locally Hölder continuous in every dimension ([`exists_holderOnWith_preciseRepresentative`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Regularity/HolderContinuity.html#TauCeti.PDE.exists_holderOnWith_preciseRepresentative)), now also with right-hand sides and [up to a flat boundary](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Regularity/BoundaryHolder.html#TauCeti.PDE.exists_holderOnWith_preciseRepresentative_sub_compHyperplaneReflectionL).
- **The Aleksandrov-Bakelman-Pucci estimate** — a `W^{2,n}` subsolution of `aⁱʲ∂ᵢⱼu ≥ f` is bounded by its boundary values plus a multiple of `‖f⁻/(det a)^{1/n}‖_{Lⁿ}` ([`le_add_mul_eLpNorm_negPart_div_det_rpow_of_wkp`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/MaximumPrinciple/AleksandrovBakelmanPucci/Sobolev.html#TauCeti.PDE.le_add_mul_eLpNorm_negPart_div_det_rpow_of_wkp)).
- **The Mihlin-Hörmander multiplier theorem** — a symbol with `‖Dᵏm(ξ)‖ ≤ A‖ξ‖⁻ᵏ` for `k ≤ N`, `2N > n`, is bounded on `Lᵖ` for `1 < p < ∞` ([`exists_fourierMultiplierCLM_eq_and_norm_le_of_norm_iteratedFDeriv_le`](https://taucetiproject.org/docs/TauCeti/Analysis/Fourier/MihlinHormander.html#TauCeti.exists_fourierMultiplierCLM_eq_and_norm_le_of_norm_iteratedFDeriv_le)).

### Notable definitions and infrastructure

- The [trace operator](https://taucetiproject.org/docs/TauCeti/Analysis/Sobolev/LipschitzDomain/Trace/Frontier.html#TauCeti.W1p.frontierTrace) of a bounded Lipschitz domain, whose zero set is exactly `W^{1,p}_0`, lets the Dirichlet problem take boundary data as a trace condition.
- The [Dirichlet realization](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Spectrum/Operator.html#TauCeti.PDE.dirichletOperator) of a coercive divergence-form operator as an unbounded operator on `L²(Ω)`. Its spectrum is the Dirichlet spectrum, and for symmetric forms it is self-adjoint with compact resolvent, which turns the weak spectral theory into operator theory.
- The Besov spaces `B^s_{p,q}`, now [complete](https://taucetiproject.org/docs/TauCeti/Analysis/FunctionalSpaces/BesovSpace.html#TauCeti.BesovSpace.instCompleteSpace), equal to `H^{s,2}` at `p = q = 2`, embedded in `C_b^{k,α}` at `𝒞^{k+α}`, and carrying [Bony's decomposition](https://taucetiproject.org/docs/TauCeti/Analysis/FunctionalSpaces/BesovSpace/Paraproduct.html#TauCeti.BesovSpace.lowPass_smul_lowPass) of a product.

### Roadmap coverage

- **Layer 4 (energy method)** is done, now with the Dirichlet realization and the Courant-Fischer principle with domain monotonicity.
- **Layer 6 (parabolic)** is partial: the weak theory, the heat semigroup, F27.1-F27.2 and now F27.3 are done. F27.4 and F27.5 lack their existence theorems, and F27.6 has only the conjugation identities.
- **Layers 1, 2 and 3** each have one gap. Layer 1 lacks Hölder spaces `C^{k,α}(Ω)` on an open set (only the whole-space scale exists). Layer 2 lacks the Coifman-Rochberg-Weiss `Lᵖ` commutator bound. Layer 3, which now solves Laplace's Dirichlet problem on bounded Lipschitz domains, lacks the divergence-form Hopf lemma for Hölder coefficients.
- **Layer 5 (regularity)** is partial. It has De Giorgi-Nash-Moser, interior `Hᵏ`, `W^{2,p}` and Schauder estimates, Meyers' upper range and `W^{1,p}` for `p > 2` under small mean oscillation. Missing are the Krylov-Safonov weak Harnack and Hölder estimates, the range below `p = 2`, global boundary estimates and `C^{2,α}` solvability.
- **Layers 7, 8 and 9** are partial. Layer 7 has Bony's decomposition but not the paraproduct estimates. Layer 8 has the [one-dimensional `(4, ∞)` Strichartz estimate](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Schrodinger/Strichartz.html#TauCeti.exists_enorm_integral_inner_schrodingerPropagator_le) and the dyadic wave dispersive bound. Layer 9 has only the interval problem.

## The frontier

- **Paraproduct estimates**: the decomposition, the spectral localization of each term and the reconstruction from annuli are in place. What remains is `‖T_f g‖_{𝒞^{α+β}}`, the resonant bound for `α + β > 0`, and the product map `𝒞^α × 𝒞^β → 𝒞^α`.
- **Krylov-Safonov**: `L^ε` decay now holds for `W^{2,p}` strong supersolutions. Assemble it with the covering lemma into the weak Harnack inequality, then the Harnack inequality and the Hölder estimate.
- **Global elliptic estimates**: De Giorgi and Calderón-Zygmund work near a flat boundary. Carrying them through Lipschitz or `C^{1,1}` charts gives the global `C^β` estimate, which is also §9.1's input.
- **Quasilinear existence in every dimension**: after §9.1, the compact map `T` of §9.2 needs the Schauder fixed-point theorem for compact maps, an external prerequisite from BanachAlgebras A8.
- **Parabolic F27.4-F27.6**: `BUC` initial traces, higher derivative orders and weighted solvability, all building on the F27.3 isomorphism.

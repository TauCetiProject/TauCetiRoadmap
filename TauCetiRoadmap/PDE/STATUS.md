<!--tauceti-status:v1 {"roadmap":"PDE","to_sha":"bf5b062a82c430e6c3f39b8852bf98ffdcef428f","ts":"2026-11-18T04:36:49Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"C^{k,α}_loc(Ω) with its compact-exhaustion topology, and the product estimates on C^{k,α}(Ω)","state":"partial"},{"id":"Layer 2","remaining":"the Coifman-Rochberg-Weiss Lp commutator bound and its small-radius VMO form","state":"partial"},{"id":"Layer 3","remaining":"the divergence-form Hopf lemma for weak solutions with Hölder coefficients, n ≥ 2","state":"partial"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","remaining":"Krylov-Safonov Harnack and Hölder for strong solutions, W^{1,p} below p = 2, global boundary estimates, C^{2,α} solvability","state":"partial"},{"id":"Layer 6","remaining":"F27.4 uniqueness for BUC data, F27.5 higher-order isomorphisms, F27.6 at higher orders","state":"partial"},{"id":"Layer 7","remaining":"the product map on Hölder-Zygmund spaces and its local-in-time weighted versions","state":"partial"},{"id":"Layer 8","remaining":"the Schrödinger endpoint estimate in d ≥ 3 and the wave Strichartz estimates","state":"partial"},{"id":"Layer 9","remaining":"the global C^β estimate on C^{1,1} domains, the compact-map existence in dimension d ≥ 2, and the regularity bootstrap","state":"partial"}],"readme_sha":"566f1f7248a031ea483ba206711dbd72e4a9827a3ce04b54eb7ed52650d25d0e","roadmap":"PDE","to_sha":"bf5b062a82c430e6c3f39b8852bf98ffdcef428f"}-->
# Status: PDE

This file documents the status of the PDE roadmap up until `bf5b062` (2026-11-18T04:36:49Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The energy method (Layer 4) is done, and so is the variable-coefficient parabolic Cauchy problem in Hölder spaces. Every other layer is partial, each with named gaps. Quasilinear existence (Layer 9) is still only one-dimensional.

### Named results

- **The parabolic Cauchy problem with variable coefficients**: for uniformly elliptic coefficients in `C_b^{α,α/2}`, `u ↦ (Pu, u(·,0))` is an isomorphism from `C_b^{2+α,1+α/2}` onto `C_b^{α,α/2} × C_b^{2,α}`. It now extends continuously to bounded uniformly continuous initial data ([`isInvertible_euclideanParabolicOperatorL_prod_spatialTraceL`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Parabolic/Holder/CauchyProblem.html#TauCeti.ParabolicC2HolderSpace.isInvertible_euclideanParabolicOperatorL_prod_spatialTraceL)).
- **The Fredholm alternative**: with no sign condition on `c` and no smallness of the drift, `L u = ℓ` is solvable in `H¹₀(Ω)` exactly when `ℓ` vanishes on the adjoint kernel ([`exists_forall_energyFormH1_eq_iff`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/FredholmAlternative.html#TauCeti.PDE.UniformlyEllipticOn.exists_forall_energyFormH1_eq_iff)).
- **De Giorgi's theorem**: weak solutions of divergence-form equations with measurable, uniformly elliptic coefficients are locally Hölder continuous in every dimension ([`exists_holderOnWith_preciseRepresentative`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Regularity/HolderContinuity.html#TauCeti.PDE.exists_holderOnWith_preciseRepresentative)), with right-hand sides and up to a flat boundary.
- **The Strichartz estimate for the Schrödinger equation**: in every dimension and at every non-endpoint admissible pair, `‖e^{itΔ}f‖_{L^q_t L^r_x} ≲ ‖f‖₂` in weak form ([`exists_enorm_integral_inner_schrodingerPropagator_le`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Schrodinger/Strichartz.html#TauCeti.exists_enorm_integral_inner_schrodingerPropagator_le)), with the dual, retarded and [inhomogeneous](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Schrodinger/Strichartz.html#TauCeti.exists_enorm_integral_setIntegral_Iio_inner_schrodingerPropagator_sub_le_of_integrable) forms.
- **The weak Harnack inequality of Krylov and Safonov**: a nonnegative `W^{2,n}` strong supersolution with bounded measurable coefficients has a small `Lᵖ` average controlled by its infimum ([`exists_eLpNorm_le_mul_rpow_mul_add_eLpNorm_posPart_of_wkp`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Regularity/KrylovSafonov/WeakHarnack.html#TauCeti.PDE.exists_eLpNorm_le_mul_rpow_mul_add_eLpNorm_posPart_of_wkp)).

### Notable definitions and infrastructure

- The [trace operator](https://taucetiproject.org/docs/TauCeti/Analysis/Sobolev/LipschitzDomain/Trace/Frontier.html#TauCeti.W1p.frontierTrace) of a bounded Lipschitz domain, whose zero set is exactly `W^{1,p}_0`, lets the Dirichlet problem take boundary data as a trace condition.
- The Banach spaces [`C^{k,α}(Ω)`](https://taucetiproject.org/docs/TauCeti/Analysis/Holder/OpenSet.html#TauCeti.CkHolderSpaceOn) on an open set, and the parabolic Hölder spaces [`C_{par,b}^{k+α}`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Parabolic/Holder/Iterated/Basic.html#TauCeti.ParabolicCkHolderSpace) of every order. They are the data spaces for global Schauder theory on domains and for the higher-order parabolic isomorphisms.
- The Besov spaces `B^s_{p,q}`, [complete](https://taucetiproject.org/docs/TauCeti/Analysis/FunctionalSpaces/BesovSpace.html#TauCeti.BesovSpace.instCompleteSpace), carrying the heat semigroup with its smoothing estimate, Bony's decomposition and the [paraproduct estimates](https://taucetiproject.org/docs/TauCeti/Analysis/FunctionalSpaces/BesovSpace/Paraproduct.html#TauCeti.BesovSpace.exists_hasSum_lowPass_smul_block_and_norm_le_of_toDistr_eq).

### Roadmap coverage

- **Layer 4 (energy method)** is done.
- **Layer 6 (parabolic)** is partial. The weak theory, the heat semigroup and F27.1-F27.3 are done. F27.4 has the `BUC` solution operator with uniform attainment of the data, comparison and the positive-time Schauder estimate; uniqueness among bounded solutions and the common-modulus estimate are not established here. F27.5 has its spaces but no isomorphism. F27.6 is done at the base order only.
- **Layers 1, 2 and 3** each have a remaining gap. Layer 1 now has `C^{k,α}(Ω)` but lacks `C^{k,α}_loc(Ω)` and the product estimates on `Ω`. Layer 2 lacks the Coifman-Rochberg-Weiss commutator bound. Layer 3 lacks the divergence-form Hopf lemma for Hölder coefficients.
- **Layer 5 (regularity)** is partial. It has De Giorgi-Nash-Moser, interior `Hᵏ`, `W^{2,p}` and Schauder estimates, `W^{1,p}` and `W^{2,p}` for `p > 2` under small mean oscillation, `H²` up to a `C²` boundary, and Krylov-Safonov up to the weak Harnack inequality. It lacks the Harnack and Hölder estimates for strong solutions (the Hölder estimate exists for classical ones), `W^{1,p}` below `p = 2`, the remaining global boundary estimates and `C^{2,α}` solvability.
- **Layers 7, 8 and 9** are partial. Layer 7 has the paraproduct and resonant estimates but not the product map. Layer 8 has non-endpoint Schrödinger Strichartz in every dimension but neither the endpoint nor the wave estimates. Layer 9 has only the interval problem, now with stability and a compact solution set.

## The frontier

- **Krylov-Safonov for strong solutions**: the weak Harnack inequality and the local maximum principle both hold for `W^{2,n}` functions. Combining them gives the Harnack inequality and the interior Hölder estimate for strong solutions, which the classical case already proves.
- **The product map on Hölder-Zygmund spaces**: with the paraproduct and resonant estimates in place, the remaining step is assembling `𝒞^α × 𝒞^β → 𝒞^α` for `α < 0 < β`, `α + β > 0`, together with the local-in-time weighted versions.
- **Parabolic F27.4-F27.6**: uniqueness and positive-time regularity for `BUC` data, the order-`k` isomorphisms on `C_{par,b}^{k+2+α}`, and the weighted theory at those orders.
- **Endpoint and wave Strichartz**: the `d ≥ 3` endpoint `(2, 2d/(d−2))` needs a Keel-Tao argument beyond the non-endpoint `TT*` engine. The wave estimates can build on the dyadic dispersive bound already proved.
- **Global elliptic estimates and quasilinear existence**: carrying De Giorgi and Calderón-Zygmund through `C^{1,1}` charts gives the global `C^β` estimate that §9.1 needs. §9.2 then needs the Schauder fixed-point theorem for compact maps, an external prerequisite from BanachAlgebras A8.

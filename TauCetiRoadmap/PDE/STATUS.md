<!--tauceti-status:v1 {"roadmap":"PDE","to_sha":"5b5d5152e4ad63b4ce6da9c1ba84c74226026aa4","ts":"2026-11-24T09:13:42Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"§1.8: admissible boundary parts, W^{1,p}_Γ, its trace characterization and Poincaré-Friedrichs","state":"partial"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","remaining":"the divergence-form Hopf lemma for weak supersolutions with Hölder coefficients, n ≥ 2","state":"partial"},{"id":"Layer 4","remaining":"§4.5 mixed and Neumann problems and §4.6 mixed and Neumann spectra","state":"partial"},{"id":"Layer 5","remaining":"VMO estimates for p between 1 and 2, global C^{2,α} estimate and solvability, W^{2,p} existence on domains for n ≥ 2","state":"partial"},{"id":"Layer 6","remaining":"F27.5 order-k variable-coefficient isomorphism and estimate, F27.6 above order 0","state":"partial"},{"id":"Layer 7","remaining":"the periodic Besov spaces on the torus","state":"partial"},{"id":"Layer 8","remaining":"full wave endpoint (cos/sin and retarded), q = ∞ wave pairs, mixed endpoint retarded Schrödinger estimates","state":"partial"},{"id":"Layer 9","remaining":"global C^{2,α} regularity on C^{2,α} domains (§9.3 bootstrap)","state":"partial"}],"readme_sha":"cb832c194e024b3b0d2af2b8005f552b8afbabfd5b8c10fc23ece9046045d93a","roadmap":"PDE","to_sha":"5b5d5152e4ad63b4ce6da9c1ba84c74226026aa4"}-->
# Status: PDE

This file documents the status of the PDE roadmap up until `5b5d515` (2026-11-24T09:13:42Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The harmonic-analysis engine (Layer 2) is done. Every other layer is partial, most with one or two named gaps. The rewritten README added a whole programme that has not begun: boundary parts, `W^{1,p}_Γ`, and the mixed and Neumann problems and their spectra (§1.8, §4.5, §4.6).

### Named results

- **The endpoint Strichartz estimate of Keel and Tao** — in dimension `n ≥ 3`, `‖e^{itΔ}f‖_{L²_t L^{2n/(n−2)}_x} ≲ ‖f‖₂`, with dual and retarded forms, deduced from an abstract endpoint theorem for dispersive operator families ([`exists_eLpNorm_eLpNorm_schrodingerPropagator_le_of_endpoint`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Schrodinger/Endpoint.html#TauCeti.exists_eLpNorm_eLpNorm_schrodingerPropagator_le_of_endpoint)).
- **Existence for the quasilinear Dirichlet problem** — on every bounded open set, `−div(A(x, u)∇u) = ℓ` with a uniformly elliptic Carathéodory coefficient has a weak solution in `g + H¹₀(Ω)`, by Schauder's fixed-point theorem applied to the frozen-coefficient map ([`exists_sub_mem_w1p0Submodule_forall_energyFormH1_quasilinear_eq`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Quasilinear/Existence.html#TauCeti.PDE.exists_sub_mem_w1p0Submodule_forall_energyFormH1_quasilinear_eq)).
- **The Krylov-Safonov Harnack inequality** — nonnegative `W^{2,n}` strong solutions of `aⁱʲ∂ᵢⱼu = f` with bounded measurable, uniformly elliptic coefficients satisfy `sup u ≤ C(inf u + r‖f‖_n)` on half the ball, and the interior Hölder estimate holds for them too ([`exists_preciseRepresentative_le_mul_add_of_sum_mul_iteratedGradient_eq`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Regularity/KrylovSafonov/Sobolev.html#TauCeti.PDE.exists_preciseRepresentative_le_mul_add_of_sum_mul_iteratedGradient_eq)).
- **De Giorgi's theorem** — weak solutions of divergence-form equations with measurable, uniformly elliptic coefficients are locally Hölder continuous in every dimension ([`exists_holderOnWith_preciseRepresentative`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Regularity/HolderContinuity.html#TauCeti.PDE.exists_holderOnWith_preciseRepresentative)).
- **The parabolic Cauchy problem with variable coefficients** — for coefficients in `C_b^{α,α/2}`, `u ↦ (Pu, u(·,0))` is an isomorphism from `C_b^{2+α,1+α/2}` onto `C_b^{α,α/2} × C_b^{2,α}` ([`isInvertible_euclideanParabolicOperatorL_prod_spatialTraceL`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Parabolic/Holder/CauchyProblem.html#TauCeti.ParabolicC2HolderSpace.isInvertible_euclideanParabolicOperatorL_prod_spatialTraceL)). The solution is unique among bounded solutions for uniformly continuous data, and more regular data give a more regular solution.

### Notable definitions and infrastructure

- The [product of Besov distributions](https://taucetiproject.org/docs/TauCeti/Analysis/FunctionalSpaces/BesovSpace/Product.html#TauCeti.BesovSpace.smulL) `B^α × B^β → B^α` for `α < 0 < α + β`, with its time-weighted version, is the multiplication that singular parabolic models need.
- The [trace operator](https://taucetiproject.org/docs/TauCeti/Analysis/Sobolev/LipschitzDomain/Trace/Frontier.html#TauCeti.W1p.frontierTrace) of a bounded Lipschitz domain, whose zero set is `W^{1,p}_0`, is the input that §1.8's boundary-part spaces and trace characterization will build on.
- The Fréchet space [`C^{k,α}_loc(Ω)`](https://taucetiproject.org/docs/TauCeti/Analysis/Holder/LocalSpace.html#TauCeti.CkHolderSpaceLoc), alongside `C^{k,α}(Ω)` and its product estimates, completes the Hölder scale on domains.

### Roadmap coverage

- **Layer 2** is done. The last gap, the Coifman-Rochberg-Weiss commutator bound with its [small-radius VMO form](https://taucetiproject.org/docs/TauCeti/MeasureTheory/Integral/CalderonZygmund/Commutator.html#TauCeti.exists_eLpNorm_restrict_ball_smul_sub_le_of_vmoModulus_le), is now proved.
- **Layers 1 and 4** are done up to the new boundary-part programme. §1.1-1.7 and §4.1-4.4 are proved, but nothing exists for §1.8 or for the mixed and Neumann problems and spectra of §4.5-4.6.
- **Layer 3** lacks only the divergence-form Hopf lemma for Hölder coefficients in dimension `n ≥ 2`.
- **Layer 5** now has Krylov-Safonov for strong solutions. It still lacks:
  - the VMO estimates for `1 < p < 2`;
  - the global `C^{2,α}` estimate and `C^{2,α}` solvability;
  - `W^{2,p}` existence on domains for `n ≥ 2`.
- **Layer 6** has F27.1-F27.4 complete. F27.5 lacks the order-`k` isomorphism, and F27.6 exists only at the base order.
- **Layer 7** has the paraproducts, the product map and the commutator estimate. The periodic Besov spaces on the torus were not found.
- **Layer 8** has Schrödinger Strichartz at every admissible pair, endpoint included, and [wave Strichartz with Besov data](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Wave/HomogeneousStrichartz.html#ContDiffBump.exists_eLpNorm_eLpNorm_waveCosPropagator_add_waveSinPropagator_le_tsum). It lacks:
  - the full wave endpoint;
  - the `q = ∞` wave pairs;
  - Schrödinger retarded estimates that mix the endpoint pair with another pair.
- **Layer 9** has the global Hölder estimate (on Lipschitz domains, more general than the `C^{1,1}` asked for), existence in every dimension, and stability. It lacks the global `C^{2,α}` bootstrap; regularity is so far interior only.

## The frontier

- **Boundary parts and the mixed problem**: build `W^{1,p}_Γ`, its trace characterization and Poincaré-Friedrichs (§1.8). Then the coercive mixed problem, the Fredholm alternative and the pure Neumann problem (§4.5) and the mixed eigenbasis with min-max (§4.6) follow the Dirichlet route already in place.
- **Global Schauder theory**: assemble the local flat and curved-boundary `C^{2,α}` estimates into the global estimate on a `C^{2,α}` domain, then solvability by the method of continuity. Layer 9's global regularity bootstrap waits on this.
- **Parabolic F27.5-F27.6**: the order-`k` variable-coefficient isomorphism with its estimate, built on the higher-regularity theorem, and then the weighted theory at those orders.
- **The divergence-form Hopf lemma**: for weak supersolutions with Hölder coefficients, `n ≥ 2`. Its Morrey-space inputs exist, and the measurable-coefficient case is already refuted.
- **Below `p = 2`**: the VMO gradient and Hessian estimates for `1 < p < 2`, likely by duality from the `p > 2` range.

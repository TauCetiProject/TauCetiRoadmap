<!--tauceti-status:v1 {"roadmap":"PDE","to_sha":"d395922ff828cf4f882727fb92c05161ac48f521","ts":"2026-11-27T04:57:41Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"§1.8: admissible boundary parts, the trace characterization of W^{1,p}_Γ, Sobolev composition with Lipschitz shears","state":"partial"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","remaining":"the pure Neumann problem beyond one dimension (§4.5) and the mixed and Neumann spectra (§4.6)","state":"partial"},{"id":"Layer 5","remaining":"VMO estimates for p between 1 and 2, global C^{2,α} estimate and solvability, W^{2,p} existence on domains for n ≥ 2","state":"partial"},{"id":"Layer 6","remaining":"F27.5 order-k variable-coefficient isomorphism and estimate, F27.6 above order 0","state":"partial"},{"id":"Layer 7","state":"done"},{"id":"Layer 8","remaining":"full wave endpoint (cos/sin and retarded), q = ∞ wave pairs, mixed endpoint retarded Schrödinger estimates","state":"partial"},{"id":"Layer 9","remaining":"global C^{2,α} regularity on C^{2,α} domains (§9.3 bootstrap)","state":"partial"}],"readme_sha":"cb832c194e024b3b0d2af2b8005f552b8afbabfd5b8c10fc23ece9046045d93a","roadmap":"PDE","to_sha":"d395922ff828cf4f882727fb92c05161ac48f521"}-->
# Status: PDE

This file documents the status of the PDE roadmap up until `d395922` (2026-11-27T04:57:41Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Three layers are done: the harmonic-analysis estimates (Layer 2), maximum principles and potential theory (Layer 3), and the dyadic and Besov theory (Layer 7). The rest are partial, most with one or two named gaps. The mixed and Neumann spectra (§4.6) and the admissible boundary parts with their trace characterization (§1.8) have not begun.

### Named results

- **The endpoint Strichartz estimate of Keel and Tao** — in dimension `n ≥ 3`, `‖e^{itΔ}f‖_{L²_t L^{2n/(n−2)}_x} ≲ ‖f‖₂`, with dual and retarded forms, from an abstract endpoint theorem for dispersive operator families ([`exists_eLpNorm_eLpNorm_schrodingerPropagator_le_of_endpoint`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Schrodinger/Endpoint.html#TauCeti.exists_eLpNorm_eLpNorm_schrodingerPropagator_le_of_endpoint)).
- **De Giorgi's theorem** — weak solutions of divergence-form equations with measurable, uniformly elliptic coefficients are locally Hölder continuous in every dimension ([`exists_holderOnWith_preciseRepresentative`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Regularity/HolderContinuity.html#TauCeti.PDE.exists_holderOnWith_preciseRepresentative)).
- **The Krylov-Safonov Harnack inequality** — nonnegative `W^{2,n}` strong solutions of `aⁱʲ∂ᵢⱼu = f` with bounded measurable, uniformly elliptic coefficients satisfy `sup u ≤ C(inf u + r‖f‖_n)` on half the ball ([`exists_preciseRepresentative_le_mul_add_of_sum_mul_iteratedGradient_eq`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Regularity/KrylovSafonov/Sobolev.html#TauCeti.PDE.exists_preciseRepresentative_le_mul_add_of_sum_mul_iteratedGradient_eq)).
- **The parabolic Cauchy problem with variable coefficients** — for coefficients in `C_b^{α,α/2}`, `u ↦ (Pu, u(·,0))` is an isomorphism from `C_b^{2+α,1+α/2}` onto `C_b^{α,α/2} × C_b^{2,α}` ([`isInvertible_euclideanParabolicOperatorL_prod_spatialTraceL`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Parabolic/Holder/CauchyProblem.html#TauCeti.ParabolicC2HolderSpace.isInvertible_euclideanParabolicOperatorL_prod_spatialTraceL)).
- **The mixed boundary-value problem** — on a bounded connected Lipschitz domain whose Dirichlet part has positive surface measure, a uniformly elliptic divergence-form equation with interior and conormal data has exactly one weak solution ([`existsUnique_sub_mem_w1pVanishingOnSubmodule_forall_energyFormH1_eq_setIntegral_add_setIntegral`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/MixedProblem.html#TauCeti.PDE.IsUniformlyEllipticAE.existsUnique_sub_mem_w1pVanishingOnSubmodule_forall_energyFormH1_eq_setIntegral_add_setIntegral)), and the [Fredholm alternative](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/FredholmAlternative/Mixed.html#TauCeti.PDE.UniformlyEllipticOn.exists_sub_mem_w1pVanishingOnSubmodule_forall_energyFormH1_eq_iff_of_isLipschitzDomainWith) holds for every boundary part.

### Notable definitions and infrastructure

- The [periodic Besov spaces `B^s_{p,q}(𝕋ᵈ)`](https://taucetiproject.org/docs/TauCeti/Analysis/FunctionalSpaces/BesovSpace/Torus.html#TauCeti.UnitAddTorus.BesovSpace), with duality, the identification `𝒞^{k+α} = C^{k,α}` and a smoothing heat semigroup, give periodic singular models the same carrier the Euclidean theory has.
- The [product of Besov distributions](https://taucetiproject.org/docs/TauCeti/Analysis/FunctionalSpaces/BesovSpace/Product.html#TauCeti.BesovSpace.smulL) `B^α × B^β → B^α` for `α < 0 < α + β` is the multiplication that singular parabolic models need.
- [Domains with `C^{2,α}` boundary](https://taucetiproject.org/docs/TauCeti/Analysis/Holder/C2HolderBoundary/Basic.html#Set.HasC2HolderBoundary), with extension of `C^{2,α}(Ω)` functions to the whole space, are the setting the global Schauder estimate will be stated in.

### Roadmap coverage

- **Layers 2, 3 and 7** are done. Layer 3's last item, the [divergence-form Hopf lemma with Hölder coefficients](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/MaximumPrinciple/DivergenceFormHopf.html#TauCeti.PDE.exists_pos_mul_le_sub_of_forall_energyFormH1_nonneg), and Layer 7's, the periodic Besov spaces, both landed. The declaration summaries do not show whether the Hopf lemma's lower-order terms match the full generality of Rosales's contract, with `L^q` drift and a Morrey-class potential.
- **Layer 1** has §1.1-1.7. In §1.8, `W^{1,p}_Γ` is in use, Poincaré-Friedrichs is proved on an interval, and the mixed problem's coercivity on connected Lipschitz domains is proved. Admissible boundary parts, the trace characterization and Sobolev composition with Lipschitz shears were not found.
- **Layer 4** has §4.1-4.4 and §4.5 except the pure Neumann problem beyond one dimension. §4.6 is untouched apart from abstract variational eigenvalue lemmas.
- **Layer 5** lacks the VMO estimates for `1 < p < 2`, the global `C^{2,α}` estimate with `C^{2,α}` solvability, and `W^{2,p}` existence on domains for `n ≥ 2`.
- **Layer 6** has F27.1-F27.4. F27.5 lacks the order-`k` isomorphism, and F27.6 exists only at the base order.
- **Layer 8** lacks the full wave endpoint, the `q = ∞` wave pairs, and Schrödinger retarded estimates mixing the endpoint pair with another pair.
- **Layer 9** has existence in every dimension ([`exists_sub_mem_w1p0Submodule_forall_energyFormH1_quasilinear_eq`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Quasilinear/Existence.html#TauCeti.PDE.exists_sub_mem_w1p0Submodule_forall_energyFormH1_quasilinear_eq)), the global Hölder estimate and stability. It lacks the global `C^{2,α}` bootstrap.

## The frontier

- **Mixed and Neumann spectra**: the eigenbasis on `H¹_Γ(Ω)`, min-max, the Neumann kernel and the second Neumann eigenvalue (§4.6), through the abstract eigenbasis already pinned and Rellich compactness on `H¹(Ω)`. The pure Neumann problem in every dimension (§4.5) belongs with it, by Poincaré-Wirtinger on the mean-zero subspace.
- **Boundary parts**: admissible `Γ`, the trace characterization `W^{1,p}_Γ = {T u = 0 on Γ}` and Sobolev composition with Lipschitz shears (§1.8). The geometric shears, with Jacobian one and volume preservation, now exist.
- **Global Schauder theory**: the global `C^{2,α}` estimate on a `C^{2,α}` domain and solvability by the method of continuity. The boundary class, extension and uniform a priori bounds over compact parameter sets are in place; Layer 9's global bootstrap waits on this.
- **Parabolic F27.5-F27.6**: the order-`k` variable-coefficient isomorphism with its estimate, then the weighted theory at those orders.
- **Below `p = 2`**: the VMO gradient and Hessian estimates for `1 < p < 2`, likely by duality from the `p > 2` range.

<!--tauceti-status:v1 {"roadmap":"TaubesGromov","to_sha":"1b19ebb4ca6fab1281fb00c21dee68df6ff21243","ts":"2026-11-11T12:36:39Z"}-->
# Status: TaubesGromov

This file documents the status of the TaubesGromov roadmap up until `1b19ebb` (2026-11-11T12:36:39Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Plane vortices (TG4) are the most advanced part. Uniqueness is complete and every step of existence is proved, but the steps are not joined and the Fredholm theory is missing. The large-parameter estimates (TG5, TG6.1) and the counting and orbit-torus algebra (TG2, TG3, TG11) are partial. They are proved for local models or abstract candidates, with a first theorem about actual curves in mapping tori. Nothing yet produces a large-r Seiberg–Witten solution, the count Gr_J, or SW = Gr.

### Named results

- **Plane vortices are classified up to gauge by their zeros.** Two smooth framed vortices are related by a smooth framed gauge transformation exactly when their zero divisors agree ([`exists_framedGaugeGroup_smul_eq_iff`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Vortex/Divisor.html#TauCeti.Vortex.exists_framedGaugeGroup_smul_eq_iff)). The flux is the [degree of the divisor](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Vortex/Flux.html#TauCeti.Vortex.integral_curvature_eq_neg_mul_card).
- **Taubes's functional has a minimizer.** For each polynomial of degree m ≥ 1 the reduced functional attains its minimum on H¹(ℂ) ([`exists_forall_sobolevReducedFunctional_le`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Vortex/Minimizer.html#TauCeti.Vortex.exists_forall_sobolevReducedFunctional_le)). Weak solutions of its Euler–Lagrange equation are [classical vortices](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Vortex/Regularity.html#TauCeti.Vortex.exists_contDiff_two_ae_eq_and_equation_amplitudeField_eq_zero).
- **The curvature current has r-independent mass.** In a flat chart, the fields satisfying Taubes's coarse bounds have curvature currents (2π)⁻¹iF_a whose mass is bounded independently of r ([`exists_mass_integral_wedge_le_of_add_hodgeStar_eq`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/SeibergWitten/CurrentMass.html#TauCeti.SeibergWitten.exists_mass_integral_wedge_le_of_add_hodgeStar_eq)).
- **Horizontal curves cover orbit tori.** A nonconstant pseudoholomorphic horizontal curve in S¹ × Y_φ lies over a closed orbit of φ and maps onto its orbit torus ([`exists_surjective_orbitTorus_comp_eq_of_isPseudoholomorphicAt`](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Manifold/Suspension/Leaf.html#TauCeti.SmoothMappingTorus.exists_surjective_orbitTorus_comp_eq_of_isPseudoholomorphicAt)).
- **The closed orbits give the orbit zeta function.** For a diffeomorphism nondegenerate in every period, the labelled orbit-torus series of its closed orbits multiply to exp(Σ sgn det(1 − Pⁿ) e^(nγ)/n) ([`orbitZeta_closedOrbitHomologyClass_eq_mapRingHom_tprod`](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/JHolomorphic/OrbitTorus/ClosedOrbit.html#TauCeti.SmoothMappingTorus.orbitZeta_closedOrbitHomologyClass_eq_mapRingHom_tprod)). The labels are still inputs.

### Notable definitions and infrastructure

- **Taubes's functional** [`taubesFunctional`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Vortex/Variational.html#TauCeti.Vortex.taubesFunctional). Vortex amplitudes are exactly its critical points, and they strictly minimize it.
- **The framed field space and its Sobolev gauge group.** [`framedFieldSpace`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Vortex/FieldSpace.html#TauCeti.Vortex.framedFieldSpace) A_m^k carries a free action of [`sobolevGaugeGroup`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Vortex/FramedGauge/Sobolev.html#TauCeti.Vortex.sobolevGaugeGroup) G_(k+1), whose elements near the identity are [exponentials](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Vortex/FramedGauge/Exponential.html#TauCeti.Vortex.exists_continuous_mem_realSobolevFunctions_eq_exp). The equation and the gauge-fixed operator act on the Sobolev scale.
- **The weighted counts** [`configurationCount`](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/JHolomorphic/ConfigurationCount.html#TauCeti.configurationCount) and [`pointConfigurationCount`](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/JHolomorphic/PointConfigurationCount.html#TauCeti.pointConfigurationCount). These are the finite sums Gr_J will be, with cutoff independence, vanishing in bad classes and for too many points. Their candidates and weights are still inputs.

### Roadmap coverage

TG4 is partial. It has the vacuum normalization, the field space with its gauge action, flux, decay, uniqueness, and the unchained steps of existence. On the linear side it has Gårding, the spectral gap, exterior coercivity and a weak right inverse. Fredholmness with index 2m, the smooth moduli and the compact-window families are missing. TG5 is partial: it has the projector algebra and, with the coarse bounds as hypotheses in a flat chart, the curvature, L², mass, positive-cone and zero-defect estimates. The coarse bounds themselves, A₀ and the exponential comparison with the canonical connection are not proved. TG6.1 is partial: it has integer disc charges and their stabilization, support convergence and lower density. The reconstruction and line-bundle identification are not. TG2, TG3 and TG6.2 have the weights, the ray and point counts and the good-cycle and bad-class algebra. TG3 also has area bounds for actual curves, but there is no compactness and no Gr_J. TG11.1 has the zeta assembly over actual closed orbits and the horizontal-curve covering theorem. TG11.2 has the Wang torsion order and determinant-line orientation signs for twisted ODEs, but no transport. TG11.4 has only local Hamiltonian twist maps. TG0.1, TG0.2, TG10.2 and TG10.4 have pointwise or label algebra only. TG1, TG6.3, TG7–TG9, TG10.1, TG10.3 and TG11.3 are untouched.

## The frontier

- **Vortex existence (TG4).** Chain the minimizer, the weak Euler–Lagrange equation, regularity and the L² end-framing theorem into one statement for every effective divisor. Together with uniqueness, this identifies the moduli space with Sym^mℂ.
- **Fredholm index 2m (TG4).** Combine the vacuum parametrix, exterior coercivity and the weak right inverse into Fredholmness on A_m^k. Then identify the kernel with the translations of the divisor. The Banach gauge charts are still needed.
- **Coarse bounds from the equations (TG5).** Derive |α|² + |β|² ≤ 1 + C/r and its companions from the projected Weitzenböck system on a compact almost-Kähler manifold, so that the conditional mass and cone estimates apply to actual solutions. This needs A₀ and the SeibergWittenTheory supplier.
- **Four-twist labels from geometry (TG2, TG11.1–TG11.2).** Use the twisted-ODE orientation sign to define σ and i for actual orbit tori, so that the zeta assembly stops taking labels as inputs. This needs the comparison with the embedded normal operator.
- **Weighted count at fixed J (TG3).** Instantiate the configuration candidates from actual curves. This needs bounded-window compactness and AnalyticStableMaps.

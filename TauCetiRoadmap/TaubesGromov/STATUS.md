<!--tauceti-status:v1 {"roadmap":"TaubesGromov","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
# Status: TaubesGromov

This file documents the status of the TaubesGromov roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Two results about plane vortices are proved: Taubes's classification, with moduli Sym^mℂ, and the Fredholm property of the deformation operator with index 2m. TG4 still lacks the smooth quotient and the compact-window families. Taubes's large-parameter estimates are proved, but only with the projected Weitzenböck inequalities as hypotheses. Nothing yet produces a large-r Seiberg–Witten solution, the count Gr_J, or SW = Gr.

### Named results

- **Taubes's classification of plane vortices.** Every effective divisor of degree m is the zero divisor of a smooth framed vortex ([`framedVortexDivisor_surjective`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Vortex/Existence.html#TauCeti.Vortex.framedVortexDivisor_surjective)), and the divisor determines the vortex up to framed gauge. The moduli space is therefore [Sym^mℂ as a set](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Vortex/Existence.html#TauCeti.Vortex.framedVortexModuliEquiv), and the same holds [on the Sobolev scale](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Vortex/FramedGauge/Moduli.html#TauCeti.Vortex.sobolevVortexModuliEquiv).
- **Taubes's index theorem for plane vortices.** At a smooth framed degree-m vortex the gauge-fixed operator H¹ → L² is Fredholm and onto, and its kernel has dimension exactly 2m. Its [index is 2m](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Vortex/Index.html#TauCeti.Vortex.index_sobolevGaugeFixedOperator_eq_two_mul).
- **Taubes's coarse pointwise bounds.** On a closed manifold, the projected Weitzenböck inequalities give [|α|² + |β|² ≤ 1 + O(1/r)](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/SeibergWitten/PointwiseBounds.html#TauCeti.SeibergWitten.norm_sq_add_norm_sq_le_one_add_div), |β|² ≤ (C/r)(1 − |α|²) + O(r⁻²) and the [gradient bound](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/SeibergWitten/GradientBound.html#TauCeti.SeibergWitten.norm_sq_add_mul_norm_sq_le). Those inequalities are still hypotheses.
- **Horizontal curves cover orbit tori.** A nonconstant pseudoholomorphic horizontal curve in S¹ × Y_φ lies over a closed orbit of φ and maps onto its orbit torus ([`exists_surjective_orbitTorus_comp_eq_of_isPseudoholomorphicAt`](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Manifold/Suspension/Leaf.html#TauCeti.SmoothMappingTorus.exists_surjective_orbitTorus_comp_eq_of_isPseudoholomorphicAt)).
- **The closed orbits give the orbit zeta function.** For an area-preserving surface diffeomorphism nondegenerate in every period, the orbit-torus series labelled by the return maps multiply to the [orbit zeta function](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/JHolomorphic/OrbitTorus/ClosedOrbit.html#TauCeti.SmoothMappingTorus.orbitZeta_closedOrbitHomologyClass_eq_mapRingHom_tprod_fixedPointDerivative). The labels come from dynamics, not yet from determinant signs.

### Notable definitions and infrastructure

- **The Sobolev gauge group as a manifold.** Through its [exponential charts](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Vortex/FramedGauge/Chart.html#TauCeti.Vortex.gaugeChart), G_s is an analytic Banach manifold, and the vortex equation is an [analytic map](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Vortex/EquationMap.html#TauCeti.Vortex.sobolevEquation) between Sobolev spaces. With the index theorem, they make slice charts possible.
- **Taubes's complex-linear deformation operator** [`complexDeformationOperator`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/SeibergWitten/ComplexDeformation.html#TauCeti.SeibergWitten.complexDeformationOperator) δ_ω. It is homotopic to δ₀ through operators with one elliptic symbol. The [naturality of orientation transport](https://taucetiproject.org/docs/TauCeti/Analysis/Fredholm/DeterminantLine/Naturality.html#TauCeti.detLineOrientationTransport_map_detLineCongr) for Fredholm families is the tool for carrying its complex orientation along that homotopy.
- **The weighted counts** [`configurationCount`](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/JHolomorphic/ConfigurationCount.html#TauCeti.configurationCount) and [`pointConfigurationCount`](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/JHolomorphic/PointConfigurationCount.html#TauCeti.pointConfigurationCount). These are the finite sums Gr_J will be. Their candidates and weights are still inputs.

### Roadmap coverage

**TG4 is partial.** Done:

- existence, uniqueness and the set-level and Sobolev moduli;
- decay, the bootstrap and Fredholmness with index 2m;
- gauge-group charts and the analytic equation map;
- the translation and rotation laws, uniform decay over compact windows, and the weighted right inverse at one vortex.

Missing: the smooth quotient, smooth compact-window families of kernel projections and right inverses, and the full cluster estimates.

**TG5 is partial.** The pointwise, gradient, L², L¹-defect, mass, cone and monotonicity estimates are all conditional on the projected Weitzenböck inequalities. Only a pointwise identity D_{A₀}u₀ = 0 exists, and there is no global A₀.

**Other started layers:**

- TG6.1 has disc charges and density bounds, but no reconstruction.
- TG0.1 has δ₀, δ_ω and general orientation transport, but no transport along the actual homotopy.
- TG0.2 has only conjugate-linear sign laws.
- TG1 has only the normal linearization.
- TG2, TG3 and TG6.2 have the weight and count algebra, area bounds and fold and pitchfork models, but no compactness and no Gr_J.
- TG7 and TG8 have only generic tools: a parametrised contraction lemma, the flat-limit identification with vortices, and homological local degree.
- TG10.1 and TG10.4 have cohomological algebra and a large-r wall gap, and TG10.2 has energy identities.
- TG11.1, TG11.2 and TG11.4 have the zeta assembly, normal-operator kernels, Wang torsion, twisted-ODE signs and Hamiltonian twists.

**Untouched:** TG6.3, TG9, TG10.3 and TG11.3.

## The frontier

- **Smooth vortex moduli (TG4).** Use the index theorem and the gauge-group charts to build slice charts. That makes the quotient a smooth 2m-manifold over Sym^mℂ. Then make kernel projections and right inverses smooth over compact divisor windows, collisions included.
- **Coarse bounds from the equations (TG5).** Build A₀ globally and derive the projected Weitzenböck inequalities for actual solutions. This makes the conditional estimates unconditional, and needs the SeibergWittenTheory supplier.
- **Canonical orientation (TG0.1).** Apply the new orientation-transport naturality to the homotopy from δ_ω to δ₀ and to the rescaling,.
- **Four-twist labels from normal operators (TG2, TG11.1–TG11.2).** Show that the return-map labels in the zeta assembly agree with the determinant signs of the actual orbit-torus normal operators.
- **Weighted count at fixed J (TG3).** Instantiate the configuration candidates from actual curves. This needs bounded-window compactness, AnalyticStableMaps and the TG1 normal operators.

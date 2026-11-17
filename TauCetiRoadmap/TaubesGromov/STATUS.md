<!--tauceti-status:v1 {"roadmap":"TaubesGromov","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3","ts":"2026-11-13T23:20:12Z"}-->
# Status: TaubesGromov

This file documents the status of the TaubesGromov roadmap up until `aa6e43e` (2026-11-13T23:20:12Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Taubes's classification of plane vortices is proved: the moduli space is Sym^mℂ as a set. TG4 still lacks Fredholmness with index 2m and the compact-window families. The other started layers are partial, mostly proved for local models or with Taubes's inequalities as hypotheses. Nothing yet produces a large-r Seiberg–Witten solution, the count Gr_J, or SW = Gr.

### Named results

- **Taubes's classification of plane vortices.** Every effective divisor of degree m is the zero divisor of a smooth framed vortex ([`framedVortexDivisor_surjective`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Vortex/Existence.html#TauCeti.Vortex.framedVortexDivisor_surjective)), and two vortices with the same divisor differ by a framed gauge. Together these identify the [quotient with Sym^mℂ](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Vortex/Existence.html#TauCeti.Vortex.framedVortexModuliEquiv).
- **The vortex deformation kernel has dimension at most 2m.** At a framed degree-m field satisfying the holomorphicity equations, square-integrable kernel elements of the gauge-fixed operator inject into principal-part data of total real dimension 2m ([`finrank_le_two_mul_of_tendsto_sectionValue_mul_inv_pow`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Vortex/KernelDimension.html#TauCeti.Vortex.finrank_le_two_mul_of_tendsto_sectionValue_mul_inv_pow)).
- **The curvature current has r-independent mass.** In a flat chart, under Taubes's coarse bounds, the cutoff current of a large-parameter solution has mass bounded independently of r ([`exists_mass_integral_wedge_le_of_inner_ιMulti_eq`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/SeibergWitten/CurrentMass.html#TauCeti.SeibergWitten.exists_mass_integral_wedge_le_of_inner_ιMulti_eq)).
- **Horizontal curves cover orbit tori.** A nonconstant pseudoholomorphic horizontal curve in S¹ × Y_φ lies over a closed orbit of φ and maps onto its orbit torus ([`exists_surjective_orbitTorus_comp_eq_of_isPseudoholomorphicAt`](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Manifold/Suspension/Leaf.html#TauCeti.SmoothMappingTorus.exists_surjective_orbitTorus_comp_eq_of_isPseudoholomorphicAt)).
- **The closed orbits give the orbit zeta function.** For an area-preserving surface diffeomorphism that is nondegenerate in every period, the orbit-torus series labelled by the linearized return maps multiply to the orbit zeta function ([`orbitZeta_closedOrbitHomologyClass_eq_mapRingHom_tprod_fixedPointDerivative`](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/JHolomorphic/OrbitTorus/ClosedOrbit.html#TauCeti.SmoothMappingTorus.orbitZeta_closedOrbitHomologyClass_eq_mapRingHom_tprod_fixedPointDerivative)). The labels come from dynamics, not yet from normal-operator determinant signs.

### Notable definitions and infrastructure

- **Taubes's complex-linear deformation operator** [`complexDeformationOperator`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/SeibergWitten/ComplexDeformation.html#TauCeti.SeibergWitten.complexDeformationOperator) δ_ω. It is complex linear, and the linear homotopy to δ₀ = (−d*, √2d⁺) keeps one elliptic principal symbol. This is the operator from which TG0.1 will fix the canonical homology orientation.
- **Complex-positive determinant lines** [`IsComplexPositiveDetLine`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/Determinant/Complex/LinearMap.html#LinearMap.IsComplexPositiveDetLine). They orient the determinant line of a complex-linear map, and [conjugate-linear transport](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/Determinant/Complex/LinearMap.html#LinearMap.IsComplexPositiveDetLine.neg_one_pow_smul_detLineCongr) changes that orientation by an explicit power of −1. These are the sign laws that charge conjugation in TG0.2 needs.
- **The weighted counts** [`configurationCount`](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/JHolomorphic/ConfigurationCount.html#TauCeti.configurationCount) and [`pointConfigurationCount`](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/JHolomorphic/PointConfigurationCount.html#TauCeti.pointConfigurationCount). These are the finite sums Gr_J will be. Their candidates and weights are still inputs.

### Roadmap coverage

TG4 is partial. Existence, uniqueness, the set-level moduli, decay, the bootstrap, the kernel bound, a weak H¹ right inverse and weighted estimates at one vortex are done. Fredholmness, Banach charts, the smooth quotient and compact-window families are missing. TG5 is partial. Its gradient, L², mass, cone and L¹ defect estimates are conditional on the projected Weitzenböck inequalities. There is no A₀ and no coarse bound for actual solutions. TG6.1 has integer disc charges and density bounds, but no reconstruction or line-bundle identification. TG0.1 has δ₀, δ_ω, the common symbol and the target rescaling, but no determinant transport along the homotopy. TG0.2 has only conjugate-linear sign laws. TG1 has only the normal linearization of J along a holomorphic section. TG2, TG3 and TG6.2 have the weight, count and good-cycle algebra and area bounds, but no compactness and no Gr_J. TG11.1 has the zeta assembly and the kernels of orbit-torus normal operators on finite covers. TG11.2 has the Wang torsion order and twisted-ODE signs. TG11.4 has local Hamiltonian twists. TG10.2 has the pointwise and Chern–Weil energy identities. TG10.1 and TG10.4 have only cohomological algebra. TG6.3, TG7–TG9, TG10.3 and TG11.3 are untouched.

## The frontier

- **Fredholm index 2m (TG4).** Show the principal-part map is onto, so the kernel has dimension exactly 2m. Then use the weak H¹ right inverse to get Fredholmness with zero cokernel. The smooth quotient also needs Banach charts on the gauge group.
- **Coarse bounds from the equations (TG5).** Build A₀ and derive the projected Weitzenböck inequalities for actual solutions on a compact almost-Kähler manifold. The maximum principle and gradient bound then give |α|² ≤ 1 + C/r and its companions. This needs the SeibergWittenTheory supplier.
- **Canonical orientation (TG0.1).** Orient det δ_ω complexly and transport the orientation along the homotopy to δ₀ and the rescaling to T. This needs determinant-line transport for Fredholm families.
- **Four-twist labels from normal operators (TG2, TG11.1–TG11.2).** Compare the return-map labels in the zeta assembly with the determinant signs of the actual orbit-torus normal operators. The kernels already agree.
- **Weighted count at fixed J (TG3).** Instantiate the configuration candidates from actual curves. This needs bounded-window compactness, AnalyticStableMaps and the TG1 normal operators.

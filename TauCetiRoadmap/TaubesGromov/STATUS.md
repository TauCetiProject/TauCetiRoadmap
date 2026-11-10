<!--tauceti-status:v1 {"roadmap":"TaubesGromov","to_sha":"7ca783d4c8d324c9c74efaacd641c8a40f69f284","ts":"2026-11-09T03:33:42Z"}-->
# Status: TaubesGromov

This file documents the status of the TaubesGromov roadmap up until `7ca783d` (2026-11-09T03:33:42Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The model analysis and the counting algebra have moved well ahead of the geometry. Degree-m plane vortices now have uniqueness, flux, decay and the first linear estimates. The ray count and the orbit zeta product are proved for abstract candidates. Nothing yet uses an actual pseudoholomorphic curve or a large-r Seiberg–Witten solution. Vortex existence, the Fredholm index and the SW = Gr equality are not yet proved.

### Named results

- **Uniqueness of framed plane vortices with prescribed zeros.** Two smooth vortices with the same end framing whose sections have the same zeros differ by a unique framed gauge transformation ([`existsUnique_framedGaugeGroup_smul_eq`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Vortex/Uniqueness.html#TauCeti.Vortex.existsUnique_framedGaugeGroup_smul_eq)). This is half of Taubes's classification by Sym^mℂ. Existence is the missing half.
- **The flux of a framed vortex is its degree.** A C² vortex with end framing α(z)(z/|z|)⁻ᵐ → 1 has (2π)⁻¹∫iF_a = m ([`integral_curvature_eq_of_tendsto_sectionValue_mul_inv_pow`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Vortex/Flux.html#TauCeti.Vortex.integral_curvature_eq_of_tendsto_sectionValue_mul_inv_pow)). The energy density, curvature and modulus defect all [decay like exp(−c|z|)](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Vortex/DerivativeDecay.html#TauCeti.Vortex.exists_energyDensity_le_mul_exp) for every c < 1/2.
- **The ray count is the ray series.** For pairwise compatible tori on the ray of a non-torsion class A₀, the weighted count in class jA₀ is the j-th coefficient of ∏ f_(σ,i)(t^m) ([`configurationCount_eq_coeff_rayTorusWeightSeries`](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/JHolomorphic/ConfigurationCount.html#TauCeti.configurationCount_eq_coeff_rayTorusWeightSeries)). [Disjointness on a square-zero ray](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/JHolomorphic/ConfigurationCount.html#LinearMap.BilinForm.pairwise_of_apply_self_eq_zero) supplies the compatibility.
- **Orbit-torus weights assemble into the orbit zeta function.** For orbits whose return maps have determinant one and nondegenerate iterates, the product of the labelled local series at t = e^γ is exp(Σ sgn det(1 − Pⁿ) e^(nγ)/n) ([`orbitZeta_eq_mapRingHom_tprod_ofPowerSeries_torusWeightSeries`](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/JHolomorphic/OrbitTorus/Zeta.html#TauCeti.orbitZeta_eq_mapRingHom_tprod_ofPowerSeries_torusWeightSeries)).
- **The structure of a good cycle through generic points.** On an abstract integral form, Σ mᵢ d(Cᵢ) ≤ d(e) ([`sum_mul_apply_self_sub_apply_canonical_le`](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/JHolomorphic/GoodCycle.html#TauCeti.sum_mul_apply_self_sub_apply_canonical_le)). So the images are disjoint and only square-zero images repeat.

### Notable definitions and infrastructure

- **The framed field space and Sobolev gauge group.** These are [`framedFieldSpace`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Vortex/FieldSpace.html#TauCeti.Vortex.framedFieldSpace) A_m^s and [`sobolevGaugeGroup`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Vortex/FramedGauge/Sobolev.html#TauCeti.Vortex.sobolevGaugeGroup) G_s. They carry the flux identity and the bound |α| ≤ 1, and they are where the slice and Fredholm theory will live.
- **The linear estimates at a vortex.** L_x L_x* has a [spectral gap](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Vortex/SpectralGap.html#TauCeti.Vortex.exists_pos_mul_integral_norm_sq_le_integral_norm_sq_gaugeFixedAdjoint), and L_x is [coercive outside a disc](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Vortex/ExteriorEstimate.html#TauCeti.Vortex.exists_exterior_integral_norm_sq_gaugeFixedOperator_ge) for every rate below 1/2. Covariant translations lie in its kernel. Together these are the inputs for cokernel vanishing and the index computation.
- **The weighted configuration count** [`configurationCount`](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/JHolomorphic/ConfigurationCount.html#TauCeti.configurationCount). This is the finite sum Gr_(J,ω) will be, built with a finite cutoff and a conditional comparison. For now its candidates and weights are inputs.

### Roadmap coverage

TG4 is partial. The vacuum normalization is complete. At degree m the following are in place: the field space, the gauge group without charts, flux, exponential decay, uniqueness modulo framed gauge, the scalar-equation reconstruction, the 1/8 dilation scaling and the linear estimates above. The library also has coercivity of Taubes's reduced functional, but no minimizer. Existence, Fredholmness with index 2m, the smooth moduli and the compact-window families are missing. TG2 has the weights, the ray expansion, the configuration count and ray disjointness, but no sign lines or determinant labels. TG3 and TG6.2 have the good-cycle and canonical-cycle lattice algebra and Gromov's finiteness of classes under a comass bound, but no actual curves, compactness or Gr_J. TG11.1 has the zeta assembly, finiteness of orbit tori below a period and the model normal-operator kernel criterion, but not the limiting-cycle classification. TG11.2 has the Wang torsion order and b₁ of the mapping torus, but not the determinant transport. TG10.2 and TG10.4 have pointwise identities and label arithmetic only. TG0.1, TG0.2 and TG5 now have pointwise algebra: the ellipticity of δ₀ and its complex-linear part, q(jψ) = −q(ψ), Taubes's projector splitting of q and zero localization. TG1, TG6.1, TG6.3, TG7–TG9, TG10.1, TG10.3, TG11.3 and TG11.4 are untouched.

## The frontier

- **Vortex existence (TG4).** Minimize Taubes's reduced functional to solve the scalar equation for each effective divisor. With uniqueness, this would identify the moduli space with Sym^mℂ.
- **Fredholm index 2m (TG4).** Combine the vacuum parametrix with exterior coercivity to get Fredholmness, use the spectral gap for cokernel vanishing, and identify the kernel with the translations of the divisor. The Banach gauge charts are still needed.
- **Four-twist labels from geometry (TG2, TG11.1).** Define σ and i by determinant transport from the twisted normal operators, so that the ray count and the zeta assembly apply to actual orbit tori. This needs TG1's embedded normal operator.
- **Weighted count at fixed J (TG3).** Instantiate `IsGoodCycle` and the configuration candidates from actual curves. This needs bounded-window compactness and AnalyticStableMaps.
- **The integrated product energy identity (TG10.2).** Integrate the pointwise identity against the product Dirac splitting.

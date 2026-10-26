<!--tauceti-status:v1 {"roadmap":"TaubesGromov","to_sha":"93d1fe508e122e53ce5538a8a3994c290753f127","ts":"2026-10-26T01:30:01Z"}-->
# Status: TaubesGromov

This file documents the status of the TaubesGromov roadmap up until `93d1fe5` (2026-10-26T01:30:01Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Algebra and the first model analysis are in place, and nothing geometric is. That covers the four-twist weights and the ray expansion (TG2), the intersection-lattice algebra of good cycles (TG3, TG6.2), the vacuum operator of the plane vortex model (TG4), and several normalization identities for the product application (TG10.2, TG11.1, TG11.2). Embedded normal operators, compactness, degree-m vortices, large-r estimates, gluing and the SW = Gr point equality have not begun.

### Named results

- **The structure of a good cycle through generic points.** If e = Σ mᵢCᵢ meets the good-class hypotheses, then Σ mᵢ d(Cᵢ) ≤ d(e) ([`sum_mul_apply_self_sub_apply_canonical_le`](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/JHolomorphic/GoodCycle.html#TauCeti.sum_mul_apply_self_sub_apply_canonical_le)). Consequently the images are disjoint, exceptional spheres occur once, and a repeated image [has square zero](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/JHolomorphic/GoodCycle.html#TauCeti.IsGoodCycle.apply_self_eq_zero_of_one_lt_mult). All of this is proved on an abstract integral form.
- **The independent-component expansion on a ray.** The coefficients of the product of local torus factors along the ray of A₀ are sums over configurations of products of local weights ([`coeff_rayTorusWeightSeries`](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/JHolomorphic/TorusWeight.html#TauCeti.coeff_rayTorusWeightSeries)).
- **The Weitzenböck identity at the vortex vacuum.** The gauge-fixed vacuum operator satisfies L₀*L₀ = −Δ + 1/4 ([`temperedVacuumAdjoint_temperedVacuumOperator`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Vortex/VacuumOperator/Sobolev.html#TauCeti.Vortex.temperedVacuumAdjoint_temperedVacuumOperator)). It is therefore [invertible on tempered fields](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Vortex/VacuumOperator/Sobolev.html#TauCeti.Vortex.temperedVacuumOperatorEquiv), restricts to a [bijection H^s → H^(s−1)](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Vortex/VacuumOperator/Sobolev.html#TauCeti.Vortex.memSobolev_temperedVacuumOperator_iff), and has gap 1/2.
- **The integral Wang torsion order.** If H₁ of the fibre is free and det(1 − φ_*) ≠ 0, the torsion of H₁ of the mapping torus has order |det(1 − φ_*)| ([`card_torsion_homology_one_eq_natAbs_det`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Singular/MappingTorus/Torsion.html#TauCeti.MappingTorus.card_torsion_homology_one_eq_natAbs_det)).
- **Orbit-torus weights are local zeta factors.** For a 2 × 2 return map P of determinant one with all iterates nondegenerate, the weight series labelled by the signs of det(1 ∓ P) has logarithmic derivative Σ sgn det(1 − Pᵏ) tᵏ ([`X_mul_derivative_torusWeightSeries_of_det_eq_one`](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/JHolomorphic/OrbitTorusWeight.html#TauCeti.X_mul_derivative_torusWeightSeries_of_det_eq_one)).

### Notable definitions and infrastructure

- **The local multiplicity series** [`torusWeightSeries`](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/JHolomorphic/TorusWeight.html#TauCeti.torusWeightSeries). These are the eight factors f_(±,i) as units of ℤ⟦t⟧. Every torus-count statement so far is phrased through them.
- **The resolvent of the Laplacian on tempered distributions,** [`laplacianResolvent`](https://taucetiproject.org/docs/TauCeti/Analysis/Distribution/TemperedDistribution/LaplacianResolvent.html#TemperedDistribution.laplacianResolvent), with [elliptic regularity for −Δ + c](https://taucetiproject.org/docs/TauCeti/Analysis/Distribution/TemperedDistribution/LaplacianResolvent.html#TemperedDistribution.memSobolev_add_two_iff_neg_laplacian_add_smul). This is the Fourier-side parametrix that the exterior vortex estimates will build on.
- **[`IsGoodCycle`](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/JHolomorphic/GoodCycle.html#TauCeti.IsGoodCycle)**, the numerical shadow of a positive J-curve cycle. Its hypotheses are what the geometry must supply.

### Roadmap coverage

TG2 is partial. The weights, the ray expansion and the finite cutoff are done, but the labels are free parameters, and the configuration carrier, Gr_(J,ω) and ray disjointness are absent. TG3 and TG6.2 have their lattice algebra only. TG4 has the vacuum normalization required by the README: the adjoint, both Weitzenböck identities, the energy identity, invertibility on H^s and the gap. It has nothing at degree m, so no framed field spaces, gauge groups, existence, moduli, Fredholm theory or decay. TG10.2 has the pointwise exterior-algebra energy identity, but not the Dirac splitting or the integrated identity. TG11.1 has the algebraic match between the three rank-two local factors and the sign series, but not the orbit classification or the normal-operator determinant comparison. TG11.2 has the Wang torsion order, the reciprocal-polynomial identity p′(1) = g·p(1) and its coarse coefficients, and the cat-map test series. The determinant-line transport and the sign comparison h_can = sgn det(I − P)·h_prod are missing. Nothing can be credited to TG0, TG1, TG5, TG6.1, TG6.3, TG7–TG9, TG10.1, TG10.3, TG10.4, TG11.3 or TG11.4.

## The frontier

- **Degree-m vortex operator (TG4).** Use the vacuum inverse as an exterior parametrix at a vortex in its winding-m end trivialization, and prove Fredholmness, cokernel vanishing and real index 2m. This first needs the affine field space A_m^k, the Banach gauge group G_(k+1) and the deformation complex.
- **Four-twist labels from geometry (TG2, TG11.1).** Define σ and i by determinant transport from the twisted normal operators, so that the local-zeta-factor identity applies to actual orbit tori. This needs TG1's embedded normal operator and the HF determinant conventions.
- **Disjointness on a square-zero ray.** Prove that distinct relevant torus images on the ray of A₀ are disjoint, so that the ray expansion becomes the count.
- **Weighted count at fixed J (TG3).** Instantiate `IsGoodCycle` from actual curves (positivity, singular adjunction, generic-point bounds), then build the finite configuration carrier and Gr_(J,ω)(A). This needs bounded-window compactness and AnalyticStableMaps.
- **The integrated product energy identity (TG10.2).** Integrate the pointwise identity against the product Dirac splitting to get 0 = ‖∇_Tψ‖² + ‖B_A⁺ψ‖² + ‖ι_T F_A‖² + 2π²⟨l², [X]⟩, first for smooth solutions and then for Sobolev ones.

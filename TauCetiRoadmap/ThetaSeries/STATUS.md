<!--tauceti-status:v1 {"roadmap":"ThetaSeries","to_sha":"e8ea0d187d0e20fa24ab5f68cfc27b2d40b876bd","ts":"2026-10-25T17:19:50Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"the Gaussian transforms of 1F, in cpow and even-rank integer-power form","state":"partial"},{"id":"Layer 2","remaining":"orthogonal sums in 2A, scaling (2B), the bridge (2D), level (2E), Fricke partner (2F), shell convolution (2G), Kronecker symbol (2H)","state":"partial"},{"id":"Layer 3","remaining":"functoriality (3D) and the rank-one comparison with jacobiTheta (3E)","state":"partial"},{"id":"Layer 4","remaining":"the inversion laws 4B and 4C and the consistency checks 4D","state":"partial"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","state":"untouched"}],"readme_sha":"b57483b2741b1dc916f6a0566debb3839f2c2697c451306112e045c7b30934db","roadmap":"ThetaSeries","to_sha":"e8ea0d187d0e20fa24ab5f68cfc27b2d40b876bd"}-->
# Status: ThetaSeries

This file documents the status of the ThetaSeries roadmap up until `e8ea0d1` (2026-10-25T17:19:50Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer 1's analytic engine works: Poisson summation over a full lattice is proved in all three sign forms. Only the Gaussian transforms are missing. The theta series exist with convergence, holomorphy, q-expansions and the translation law. The inversion law, the level, the bridge to the rational model and everything modular have not begun.

### Named results

- **Poisson summation for a lattice** — for a Schwartz function f and a full lattice L in a finite-dimensional real inner product space, the sum of f over v + L is the inverse covolume times the sum over L^∨ of 𝓕f(m)·e(⟪v, m⟫) ([`SchwartzMap.tsum_eq_tsum_dual_fourier`](https://taucetiproject.org/docs/TauCeti/Analysis/Fourier/PoissonSummation.html#SchwartzMap.tsum_eq_tsum_dual_fourier)). The reflected form and the minus-phase form for even f, which the roadmap asks for, are proved alongside it.
- **The q-expansion of a theta series** — for an even lattice, the m-th coefficient of Θ_L in q = e^{2πiτ} is the number of lattice vectors of half-norm m ([`ZLattice.IsEven.qExpansion_thetaSeries_coeff`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/ThetaSeries/QExpansion.html#ZLattice.IsEven.qExpansion_thetaSeries_coeff)). The analogues for integral lattices in period 2, and for coset series in q_N together with their support condition, are also proved.
- **The translation law** — the theta series of an even lattice is invariant under T in every weight ([`ZLattice.IsEven.thetaSeries_slash_T`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/ThetaSeries/Translation.html#ZLattice.IsEven.thetaSeries_slash_T)), and a coset series is multiplied by e(q_L(γ)) ([`ZLattice.IsEven.thetaCoset_one_vadd`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/ThetaSeries/Translation.html#ZLattice.IsEven.thetaCoset_one_vadd)), so it is invariant under T^N once N‖γ‖²/2 is an integer.
- **The determinant–index identity** — for an integral lattice the squared covolume is the order of the discriminant group L^∨/L ([`ZLattice.IsIntegral.det_eq_card_discriminantGroup`](https://taucetiproject.org/docs/TauCeti/Algebra/Module/ZLattice/Determinant.html#ZLattice.IsIntegral.det_eq_card_discriminantGroup)). The unimodularity criteria (self-dual iff covolume one iff determinant one iff trivial discriminant group) follow from it.
- **The dual's theta series as a sum of coset series** — for integral L, Θ_{L^∨} is the finite sum of θ_γ over the discriminant group ([`ZLattice.IsIntegral.thetaSeries_dual_eq_sum`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/ThetaSeries/DiscriminantGroup.html#ZLattice.IsIntegral.thetaSeries_dual_eq_sum)).

### Notable definitions and infrastructure

- **The theta series** [`ZLattice.thetaSeries`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/ThetaSeries/Basic.html#ZLattice.thetaSeries) and the coset series [`ZLattice.thetaCoset`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/ThetaSeries/Basic.html#ZLattice.thetaCoset) are holomorphic in both the `DifferentiableOn` and the chart sense, bounded at i∞ with value 1 there, and real and nonzero on the imaginary axis. That is everything the bundled modular form and the rank-8 argument will need from Layer 3.
- **Shells and representation numbers** ([`ZLattice.representationNumber`](https://taucetiproject.org/docs/TauCeti/Algebra/Module/ZLattice/Shell.html#ZLattice.representationNumber)) are defined as sets with finiteness theorems, as the roadmap asks. They come with r_L(0) = 1, isometry invariance, the growth bound O(t^{n/2}), and the parity constraints for even and integral lattices and their cosets.
- **The dual lattice and the integral, even and unimodular predicates** ([`ZLattice.dual`](https://taucetiproject.org/docs/TauCeti/Algebra/Module/ZLattice/Dual.html#ZLattice.dual), [`ZLattice.IsEven`](https://taucetiproject.org/docs/TauCeti/Algebra/Module/ZLattice/Integral.html#ZLattice.IsEven)), with biduality, the inverse covolume of the dual, and isometry invariance. Every later hypothesis is phrased in these.

### Roadmap coverage

Layer 1 is done except for the Gaussians (1F). The general theorem (1A), the orthonormal-basis case standing in for ℤⁿ (1B), the change of variables (1C), dual and covolume transport (1D) and standalone summability (1E) are all proved. Layer 2 is partial. 2C is done. 2A lacks preservation under orthogonal sums. 2G lacks the convolution identity and the identification with `vectorsOfNorm`, and its coset congruence uses an arbitrary N in place of the level. Scaling (2B), the bridge (2D), the level (2E), the Fricke partner (2F) and the Kronecker symbol (2H) have not started. Layer 3 is done for 3A–3C, but functoriality (3D: isometry, orthogonal sums, scaling) and the rank-one comparison with `jacobiTheta` (3E) are missing. Layer 4 is partial: the translation law (4A) is done, while inversion (4B, 4C) and the consistency checks (4D) are not. Layers 5 to 8 are untouched.

## The frontier

- **Gaussians (1F).** Prove that the Gaussian and its translates are Schwartz and compute the Fourier transform, in both the `cpow` and the even-rank integer-power forms. Poisson summation is ready, so this is the only thing between it and inversion.
- **Inversion (4B, 4C).** Apply Poisson summation to the Gaussian to get the scalar S-law and the general-translate form, then split the dual sum into cosets to get the vector-valued law over the discriminant group.
- **Functoriality and the rank-one test (3D, 3E).** Prove isometry invariance, the product formula for orthogonal sums and the scaling identity, then check Θ_ℤ against `jacobiTheta`. 3D waits on orthogonal sums from 2A.
- **Finishing 2A and 2B.** Orthogonal sums in `WithLp 2 (E × F)`, then scaling with its √m criteria under `Nontrivial E`. These also unlock Layer 5's reduction to rank ≡ 4 mod 8.
- **The bridge and the level (2D, 2E).** Without the level, the coset results carry N as a hypothesis, and Layers 6 and 7 cannot be stated. The Kronecker symbol (2H) is independent and can proceed in parallel.

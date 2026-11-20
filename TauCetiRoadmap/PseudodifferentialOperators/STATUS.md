<!--tauceti-status:v1 {"roadmap":"PseudodifferentialOperators","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"higher jets, formal adjoints, Bochner connection and Dirac-type D*D","state":"partial"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","remaining":"bundle and density Schwartz kernel theorem, transpose extension of properly supported operators","state":"partial"},{"id":"Layer 4","remaining":"nonlinear coordinate and frame changes, global bundle quantization and the patched principal-symbol sequence","state":"partial"},{"id":"Layer 5","remaining":"order-zero Lp bounds, bundle H^(s,p) and W^(k,p), Zygmund mapping, averaging","state":"partial"},{"id":"Layer 6","remaining":"distributional regularity for pseudodifferential operators, patched parametrix, Fredholm theory on compact bases","state":"partial"},{"id":"Layer 7","remaining":"elliptic powers, equivariant product index, elliptic complexes","state":"partial"},{"id":"Layer 8","remaining":"scalar Laplacian H^2 realization, normalized pullback on H^2, isospectrality","state":"partial"},{"id":"Layer 9","remaining":"diffeomorphism invariance, pseudolocality, nonlinear pullback and products","state":"partial"}],"readme_sha":"a861e210dbd32b04ceec16d3350b76963ffb340ae85b909228f7b56efc8d87ec","roadmap":"PseudodifferentialOperators","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: PseudodifferentialOperators

This file documents the status of the PseudodifferentialOperators roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The Euclidean calculus is substantial and Layer 2 is complete. Proper support modulo smoothing, a uniform all-x calculus with Sobolev mapping of every order, and distributional elliptic regularity for differential operators are all in place. Nothing global has begun: diffeomorphism coordinate changes, bundle quantization, patched parametrices and Fredholm theory on compact manifolds are missing.

### Named results

- **Distributional elliptic regularity for differential operators**: if P has smooth coefficients and is elliptic of order M at x, then a distribution T is H^(s+M) near x exactly when PT is H^s there ([`isLocallySobolevAt_sum_smul_smulLeftCLM_iteratedLineDerivOp_iff`](https://taucetiproject.org/docs/TauCeti/Analysis/Pseudodifferential/DistributionalRegularity.html#Distribution.isLocallySobolevAt_sum_smul_smulLeftCLM_iteratedLineDerivOp_iff)). For general elliptic symbols it needs u already in a Sobolev space ([`memSobolev_smulLeftCLM`](https://taucetiproject.org/docs/TauCeti/Analysis/Pseudodifferential/EllipticRegularity.html#TauCeti.Symbol.IsEllipticAbove.memSobolev_smulLeftCLM)).
- **Microlocal elliptic regularity** (Hörmander I, Theorem 8.3.1): WF(T) ⊆ WF(PT) ∪ Char(P) for differential operators with smooth coefficients ([`waveFrontSet_subset_waveFrontSet_sum_smul_smulLeftCLM_iteratedLineDerivOp_union`](https://taucetiproject.org/docs/TauCeti/Analysis/Distribution/WaveFrontSet/EllipticRegularity.html#Distribution.waveFrontSet_subset_waveFrontSet_sum_smul_smulLeftCLM_iteratedLineDerivOp_union)).
- **The composition expansion**: the symbol of Op(a)∘Op(b) is Σ_(k<N) (−i)^k/k! ∂_ξ^α a ∂_x^α b plus a remainder of order m′+m−N. This is now proved whenever the left factor is properly supported, not only under compact spatial support ([`isAsymptoticSum_properSharp`](https://taucetiproject.org/docs/TauCeti/Analysis/Pseudodifferential/Composition/ProperSupport.html#TauCeti.Symbol.isAsymptoticSum_properSharp)).
- **Sobolev mapping of uniform symbols**: a symbol of order m with estimates uniform in x maps H^s → H^(s−m) for every real s ([`exists_quantizeUniformSobolev`](https://taucetiproject.org/docs/TauCeti/Analysis/Pseudodifferential/UniformSobolev.html#TauCeti.Symbol.exists_quantizeUniformSobolev)). It is built on the Calderón–Vaillancourt theorem ([`exists_quantizeUniformOrderZero`](https://taucetiproject.org/docs/TauCeti/Analysis/Pseudodifferential/CalderonVaillancourt.html#TauCeti.Symbol.exists_quantizeUniformOrderZero)).
- **The Schwartz kernel theorem on open sets**: a bilinear form on test functions on open Ω ⊆ ℝ^a and O ⊆ ℝ^b with local seminorm bounds has a unique distributional kernel on Ω × O ([`existsUnique_schwartzKernel_distribution`](https://taucetiproject.org/docs/TauCeti/Analysis/Distribution/SchwartzKernel.html#LinearMap.existsUnique_schwartzKernel_distribution)).

### Notable definitions and infrastructure

- **Classical symbols, on ℝⁿ and on open sets** ([`ClassicalSymbol`](https://taucetiproject.org/docs/TauCeti/Analysis/Pseudodifferential/Symbol/Classical.html#TauCeti.ClassicalSymbol), [`LocalClassicalSymbol`](https://taucetiproject.org/docs/TauCeti/Analysis/Pseudodifferential/LocalSymbol/Classical.html#TauCeti.LocalClassicalSymbol)): these are closed under composition and adjoints and have principal symbols and Borel summation. They are what chart-by-chart quantization will glue.
- **The kernel cutoff** ([`kernelCutoff`](https://taucetiproject.org/docs/TauCeti/Analysis/Pseudodifferential/ProperSupport.html#TauCeti.Symbol.kernelCutoff)): it multiplies the kernel by χ(x − y) and keeps the order, making every operator properly supported modulo smoothing.
- **Interpolation of the Bessel scale** ([`besselPotentialSpaceComplexMethodEquiv`](https://taucetiproject.org/docs/TauCeti/Analysis/Sobolev/BesselPotential/ComplexMethod.html#TauCeti.CompatibleCouple.besselPotentialSpaceComplexMethodEquiv)): complex interpolation of H^(s₀) and H^(s₁) gives H^(s_θ) with equal norms. Real interpolation of H^(s,p) gives Besov spaces, which settles the Euclidean interpolation identities.

### Roadmap coverage

Layer 2 is done. The other eight layers are partial.

- **Layer 1** has Peetre's theorem on sections and in coefficient form, the Laplace-type predicate, and differential operators as classical symbols. It lacks higher jets, formal adjoints, and the Bochner and Dirac-type theory.
- **Layers 3 and 4** have Euclidean quantization, amplitude reduction, the kernel theorem on Euclidean open sets, and proper support modulo smoothing. Composition with a properly supported factor, the uniform calculus and linear changes of variables are also in place. They lack the bundle and density kernel theorem, nonlinear coordinate and frame changes, and global bundle quantization.
- **Layer 5** has H^s mapping for compactly supported and uniform symbols, H^(s,p) mapping under compact support, the interpolation identities, Besov multipliers and pullbacks, and Sobolev embeddings. Operator L^p bounds hold only below order −n. Bundle H^(s,p) and W^(k,p), Zygmund mapping and averaging are missing.
- **Layer 6** has parametrix symbols, including uniform and microlocal ones, interior regularity on H^s and H^(s,p), and distributional regularity for differential operators. Index independence of the regularity level exists in abstract form. Distributional regularity for pseudodifferential operators, the patched parametrix and Fredholm theory on compact bases are missing.
- **Layers 7 and 8** are preparatory. Layer 7 has parameter-dependent symbols with formal parametrices and Sobolev bounds, and positivity of principal symbols. Layer 8 has Sunada's theorem for smooth functions and isometry pullback on H¹.
- **Layer 9** has the wave front set and its Sobolev version, the projection theorem, and elliptic regularity for differential operators. It also has pushforward along linear maps, and invariance under linear coordinate changes and frames. It lacks diffeomorphism invariance, pseudolocality, nonlinear pullbacks and products.

## The frontier

- **Distributional regularity for elliptic pseudodifferential operators**: proper support modulo smoothing, parametrix symbols and finite local Sobolev order are all in place. What remains is Pu ∈ H^s_loc ⇒ u ∈ H^(s+m)_loc for an arbitrary distribution u.
- **Patched parametrix and Fredholm theory**: assemble Q = Σ ψ_j Q_j φ_j from the local parametrices with properly supported pieces. Fredholmness on compact manifolds then also needs bundle quantization.
- **Diffeomorphism changes of coordinates**: only linear changes are done. Layer 4.2's transformation formulas block bundle quantization and the invariance of WF.
- **L^p boundedness of order-zero operators**: the Calderón–Zygmund kernel estimates for uniform symbols and the Mihlin–Hörmander theorem are proved. The operator bound is not assembled.
- **Higher jets and formal adjoints**: these block ∇*∇, the Bochner connection, and Layer 7's L = 1 + ∇*∇.

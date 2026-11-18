<!--tauceti-status:v1 {"roadmap":"PseudodifferentialOperators","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3","ts":"2026-11-13T23:20:12Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"higher jets, formal adjoints, Bochner connection and Dirac-type D*D","state":"partial"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","remaining":"patched and bundle Schwartz kernel theorem, proper support","state":"partial"},{"id":"Layer 4","remaining":"composition without compact spatial support, coordinate and frame changes, global bundle quantization","state":"partial"},{"id":"Layer 5","remaining":"uniform all-order H^s mapping, bundle H^(s,p), interpolation identities, Zygmund mapping, embeddings, averaging","state":"partial"},{"id":"Layer 6","remaining":"regularity for arbitrary distributions, patched global parametrix, Fredholm theory on compact bases","state":"partial"},{"id":"Layer 7","remaining":"elliptic powers, equivariant product index, elliptic complexes","state":"partial"},{"id":"Layer 8","remaining":"scalar Laplacian H^2 realization, normalized pullback on H^2, isospectrality","state":"partial"},{"id":"Layer 9","remaining":"diffeomorphism and frame invariance, pseudolocality, microlocal elliptic regularity, pullback and products","state":"partial"}],"readme_sha":"a861e210dbd32b04ceec16d3350b76963ffb340ae85b909228f7b56efc8d87ec","roadmap":"PseudodifferentialOperators","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3"}-->
# Status: PseudodifferentialOperators

This file documents the status of the PseudodifferentialOperators roadmap up until `aa6e43e` (2026-11-13T23:20:12Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The Euclidean symbol calculus is in place, and Layer 2 is now complete. On top of it sit L² and Sobolev boundedness, composition and adjoint expansions, parametrix symbols and interior elliptic regularity for localized operators. Everything global is still missing: bundle quantization, coordinate changes, proper support, patched parametrices and Fredholm theory.

### Named results

- **Interior elliptic regularity**: if p is elliptic of order m and Op(p)u is H^s near the support of a cutoff φ, then φu ∈ H^(s+m), for u already in a Sobolev space and p localized to compact spatial support ([`memSobolev_smulLeftCLM`](https://taucetiproject.org/docs/TauCeti/Analysis/Pseudodifferential/EllipticRegularity.html#TauCeti.Symbol.IsEllipticAbove.memSobolev_smulLeftCLM)). It uses a two-sided parametrix symbol, which exists for any symbol elliptic at large frequencies ([`exists_isAsymptoticSum_sharpTerm`](https://taucetiproject.org/docs/TauCeti/Analysis/Pseudodifferential/Composition/Parametrix.html#TauCeti.Symbol.IsEllipticAbove.exists_isAsymptoticSum_sharpTerm)).
- **The Calderón–Vaillancourt theorem**: an order-zero symbol with estimates uniform in x quantizes to a bounded operator on L², with no support condition in x ([`exists_quantizeUniformOrderZero`](https://taucetiproject.org/docs/TauCeti/Analysis/Pseudodifferential/CalderonVaillancourt.html#TauCeti.Symbol.exists_quantizeUniformOrderZero)).
- **The composition expansion**: when b has compact spatial support, the symbol of Op(a)∘Op(b) is Σ_(k<N) (−i)^k/k! ∂_ξ^α a ∂_x^α b plus a remainder of order m′+m−N ([`sharp_eq_sum_sharpTerm_add_sharpRemainder`](https://taucetiproject.org/docs/TauCeti/Analysis/Pseudodifferential/Composition/Expansion.html#TauCeti.Symbol.sharp_eq_sum_sharpTerm_add_sharpRemainder)). Classical symbols compose to classical symbols, and composition is associative.
- **Peetre's theorem for sections**: a linear local operator between smooth sections of vector bundles has finite jet order over each compact set, with no continuity assumed ([`exists_apply_eq_apply_of_sub_mem_smoothVanishingIdeal_pow_smul_top`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/DifferentialOperator/Peetre/Section.html#LinearMap.exists_apply_eq_apply_of_sub_mem_smoothVanishingIdeal_pow_smul_top)).
- **The wave front set projects onto the singular support** (Hörmander I, Proposition 8.1.3): a distribution is smooth near x exactly when it is microlocally smooth in every direction there ([`fst_image_waveFrontSet`](https://taucetiproject.org/docs/TauCeti/Analysis/Distribution/WaveFrontSet/SingularSupport.html#Distribution.fst_image_waveFrontSet)). The H^s version holds too.

### Notable definitions and infrastructure

- **Classical symbols, on ℝⁿ and on open sets** ([`ClassicalSymbol`](https://taucetiproject.org/docs/TauCeti/Analysis/Pseudodifferential/Symbol/Classical.html#TauCeti.ClassicalSymbol), [`LocalClassicalSymbol`](https://taucetiproject.org/docs/TauCeti/Analysis/Pseudodifferential/LocalSymbol/Classical.html#TauCeti.LocalClassicalSymbol)): these carry actual remainders, unique homogeneous terms, Borel summation, restriction and cut-off extension. They are what chart-by-chart quantization will glue.
- **The complex interpolation method** ([`ComplexMethodSpace`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Interpolation/ComplexMethod.html#TauCeti.CompatibleCouple.ComplexMethodSpace)): this now includes Stein's theorem for bounded analytic families and the Lebesgue couples. It is the base for the Bessel and Besov interpolation identities.
- **The H^s singular support** ([`sobolevSingularSupport`](https://taucetiproject.org/docs/TauCeti/Analysis/Distribution/WaveFrontSet/Sobolev/SingularSupport.html#Distribution.sobolevSingularSupport)): with the Sobolev wave front set and finite local Sobolev order, this is what extends regularity from Sobolev data to arbitrary distributions.

### Roadmap coverage

Layer 2 is done. The other eight layers are partial.

- **Layer 1** now has Peetre on section spaces, the Laplace-type predicate with −Δ as its model, and differential operators as classical symbols. It lacks higher jets, formal adjoints, and the Bochner and Dirac-type theory.
- **Layers 3 and 4** have Euclidean quantization, amplitude reduction with its full asymptotic expansion, and a Schwartz kernel theorem on small compact sets. They also have composition, adjoints and partition-of-unity compression under compact spatial support. They lack the patched kernel theorem, proper support, composition without compact support, coordinate and frame changes, and bundle quantization.
- **Layer 5** has Sobolev and L² mapping, both interpolation methods with Stein's theorem, Besov inclusions and smooth multipliers, and the cubic-shear counterexample. It lacks uniform all-order H^s mapping, bundle H^(s,p), the interpolation identities, Zygmund mapping, embeddings and averaging.
- **Layer 6** has ellipticity, parametrix symbols, and interior regularity and estimates for localized operators on Sobolev data. Abstract Green operators for self-adjoint operators with compact resolvent exist. Regularity for arbitrary distributions, patched parametrices and Fredholm theory are missing.
- **Layers 7 and 8** are preparatory. Layer 7 has polar decomposition and normalization of elliptic symbols, homotopy invariance of equivariant Fredholm multiplicities, and strongly parameter-dependent symbols ([`ParameterSymbol`](https://taucetiproject.org/docs/TauCeti/Analysis/Pseudodifferential/Symbol/Parameter.html#TauCeti.ParameterSymbol)). Layer 8 has Sunada's theorem for smooth functions, volume under finite coverings and isometry pullback on H¹.
- **Layer 9** has the Euclidean wave front set and its Sobolev version, the projection theorem, differential operators with their order shifts, and tensor products. It lacks invariance under diffeomorphisms and frames, pseudolocality, the microlocal parametrix, and pullbacks and products.

## The frontier

- **Distributional elliptic regularity**: combine the interior regularity theorem with finite local Sobolev order to get Pu ∈ H^s_loc ⇒ u ∈ H^(s+m)_loc for arbitrary distributions.
- **Composition without compact spatial support**: the uniform estimates for a # b still need b compactly supported in x. Removing that, or replacing it with proper support, blocks the patched parametrix and the uniform H^s calculus.
- **Proper support and coordinate changes**: amplitude reduction and its expansion exist for compact input support. Layer 3.2's near-diagonal localization and Layer 4.2's transformation formulas are next.
- **Fredholm theory on compact manifolds**: this needs bundle quantization and a patched parametrix.
- **Higher jets and formal adjoints**: these block ∇*∇ as a composition and the Bochner connection, and with them Layer 7's L = 1 + ∇*∇.

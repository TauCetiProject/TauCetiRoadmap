<!--tauceti-status:v1 {"roadmap":"PseudodifferentialOperators","to_sha":"d92acc5c0393646e14960dfd4972fc836aad3ebe","ts":"2026-11-09T11:59:37+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"complex derivation dictionary, global jet bundles, formal adjoints, Laplace-type and Bochner operators, Peetre's theorem","state":"partial"},{"id":"Layer 2","remaining":"Symbol.IsUniform, ClassicalSymbol, Borel summation exists_asymptoticSum, principal-symbol quotient","state":"partial"},{"id":"Layer 3","remaining":"Schwartz kernel theorem, amplitude reduction, proper support","state":"partial"},{"id":"Layer 4","remaining":"composition and adjoint expansions, coordinate changes, global bundle quantization","state":"partial"},{"id":"Layer 5","remaining":"Calderon-Vaillancourt, bundle H^(s,p), complex interpolation, Holder-Zygmund mapping, smoothing compactness","state":"partial"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","remaining":"elliptic powers, equivariant index in SplitK0, elliptic complexes","state":"partial"},{"id":"Layer 8","state":"untouched"},{"id":"Layer 9","remaining":"coordinate and frame invariance, pseudolocality, microlocal elliptic regularity, pullback and products","state":"partial"}],"readme_sha":"a861e210dbd32b04ceec16d3350b76963ffb340ae85b909228f7b56efc8d87ec","roadmap":"PseudodifferentialOperators","to_sha":"d92acc5c0393646e14960dfd4972fc836aad3ebe"}-->
# Status: PseudodifferentialOperators

This file documents the status of the PseudodifferentialOperators roadmap up until `d92acc5` (2026-11-09T11:59:37+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The Euclidean groundwork is underway. There are symbols of order m with their topology, quantization of Schwartz input, and the H^s mapping theorem for symbols with compact spatial support. The algebraic side of differential operators has also started. No layer is complete. Classical symbols, composition, ellipticity, parametrices and the finite-deck transplantation have not begun.

### Named results

- **Sobolev mapping with compact spatial support**: a symbol of order m with compact position support quantizes to a bounded operator H^s → H^(s−m) for every real s, between finite-dimensional coefficient spaces ([`exists_quantizeSobolev`](https://taucetiproject.org/docs/TauCeti/Analysis/Pseudodifferential/Sobolev.html#TauCeti.Symbol.exists_quantizeSobolev)).
- **Output support of a quantization**: Op(a) sends every compactly supported test function into a closed set K exactly when the symbol vanishes at every position outside K ([`tsupport_quantizeSchwartzValue_subset_iff`](https://taucetiproject.org/docs/TauCeti/Analysis/Pseudodifferential/OutputSupport.html#TauCeti.tsupport_quantizeSchwartzValue_subset_iff)).
- **Quantization as an oscillatory integral**: the single-Fourier-integral definition equals the limit of the cutoff-regularized Kohn–Nirenberg double integral, which ties the absolutely convergent formula to the textbook one ([`tendsto_integral_cutoff_smul_quantizeSchwartzValue`](https://taucetiproject.org/docs/TauCeti/Analysis/Pseudodifferential/OscillatoryIntegral.html#TauCeti.tendsto_integral_cutoff_smul_quantizeSchwartzValue)).
- **Derivations are vector fields**: every algebraic derivation of C^∞(M, ℝ), with no continuity assumed, is differentiation along a unique smooth vector field ([`exists_derivationEquivSmoothVectorField`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/VectorField/Derivation.html#TauCeti.exists_derivationEquivSmoothVectorField)).
- **The conormal wave front set**: the surface measure of a linear subspace V is singular exactly over V, in exactly the nonzero directions orthogonal to V ([`waveFrontSet_ofFun_one_map_subtype`](https://taucetiproject.org/docs/TauCeti/Analysis/Distribution/WaveFrontSet.html#Distribution.waveFrontSet_ofFun_one_map_subtype)). The point mass case is [`waveFrontSet_delta`](https://taucetiproject.org/docs/TauCeti/Analysis/Distribution/WaveFrontSet.html#Distribution.waveFrontSet_delta).

### Notable definitions and infrastructure

- **The symbol topology**: the locally convex topology of the seminorms p_(K,α,β) ([`Symbol.instTopologicalSpace`](https://taucetiproject.org/docs/TauCeti/Analysis/Pseudodifferential/Symbol/Topology.html#TauCeti.Symbol.instTopologicalSpace)). Continuity statements for parameter families and asymptotic sums are stated in it.
- **Algebraic differential operators and their symbol**: Grothendieck's order filtration by iterated commutators ([`mem_differentialOperators_iff_forall_list_prod`](https://taucetiproject.org/docs/TauCeti/RingTheory/Derivation/DifferentialOperator.html#TauCeti.mem_differentialOperators_iff_forall_list_prod)) and the commutator principal symbol ([`commutatorSymbol`](https://taucetiproject.org/docs/TauCeti/RingTheory/Derivation/PrincipalSymbol.html#TauCeti.commutatorSymbol)). With the identification I_x/I_x² ≅ T_x*M already in place, this symbol descends to the cotangent space.
- **The real interpolation method**: the K-method space of a compatible couple, which is a Banach space and satisfies the exact bound M₀^(1−θ) M₁^θ ([`KMethodSpace`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Interpolation/RealMethod.html#TauCeti.CompatibleCouple.KMethodSpace)).

### Roadmap coverage

Layers 1–5 and 9 are partial. Layers 6 and 8 are untouched, and Layer 7 has only one preparatory step.

- **Layer 1** has the vanishing-ideal square identity, the cotangent equivalence, the real derivation dictionary, the smooth section modules, first-jet coordinate changes and the algebraic differential operators with their symbol. It still lacks the complex derivation dictionary, the global jet bundles, formal adjoints, Laplace-type and Bochner operators, and Peetre's theorem.
- **Layer 2** has symbols, their topology, homogeneous symbols, frequency cutoffs and restriction and extension between open sets. It lacks `Symbol.IsUniform`, `ClassicalSymbol` and Borel summation.
- **Layer 3** has the Schwartz-input quantization with its continuity and smoothness, regularized oscillatory integrals, the kernel for orders below −n, and test-function Fourier expansions on small compact sets. It lacks the Schwartz kernel theorem, amplitudes and proper support.
- **Layer 4** has output support, injectivity of quantization, the exact quantization of polynomial differential symbols, and square partitions of unity. It lacks composition, adjoints and global patching.
- **Layer 5** has compact-support H^s mapping, bundle W^(k,p), the closed weak gradient and the K-method. It lacks Calderón–Vaillancourt, bundle H^(s,p), complex interpolation, Hölder–Zygmund mapping and smoothing compactness.
- **Layer 7** has only the continuous kernel and cokernel representations of an equivariant Fredholm operator ([`continuous_kerRepresentation_of_isFredholm`](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/Continuous/KernelCokernel.html#ContIntertwiningMap.continuous_kerRepresentation_of_isFredholm)).
- **Layer 9** has the scalar Euclidean wave front set, its closed conic structure, and the two examples above. It lacks invariance, pseudolocality, microlocal elliptic regularity, pullbacks and products.

## The frontier

- **Classical symbols and Borel summation**: `ClassicalSymbol` and `exists_asymptoticSum` are next. Homogeneous symbols, frequency cutoffs and the uniqueness of homogeneous terms ([`eq_zero_of_coefficient_toSymbol_eq`](https://taucetiproject.org/docs/TauCeti/Analysis/Pseudodifferential/CutoffSymbol.html#TauCeti.HomogeneousSymbol.eq_zero_of_coefficient_toSymbol_eq)) are already in place.
- **Calderón–Vaillancourt**: L² boundedness for order-zero symbols with x-uniform bounds (`exists_quantizeUniformOrderZero`). This first needs the `Symbol.IsUniform` predicate and the almost-orthogonality lemma. The compact-support theorem does not cover it.
- **The Schwartz kernel theorem**: the periodic Fourier expansion of test functions on small compact sets ([`hasSum_fourier_smul_modulate`](https://taucetiproject.org/docs/TauCeti/Analysis/Distribution/TestFunction/FourierSeries.html#ContDiffMapSupportedIn.hasSum_fourier_smul_modulate)) is the first step of the planned proof. What remains is the kernel construction, tensor density, uniqueness and patching.
- **Composition and adjoint expansions**: Layer 4.1 is untouched. It needs the amplitude-to-symbol reduction of Layer 3.2.
- **Ellipticity and the parametrix**: `ClassicalSymbol.IsElliptic` and `exists_inversePrincipalSymbol` wait on classical symbols. Everything in Layers 6–8 waits on these.

<!--tauceti-status:v1 {"roadmap":"OrthogonalL2Bases","to_sha":"e440f4eb3fccf5479ede3f5d6a671b4be37c9dde","ts":"2026-09-30T05:46:25Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Part A","state":"done"},{"id":"Part B","state":"done"},{"id":"Part C","state":"done"},{"id":"Part D","state":"done"}],"readme_sha":"1321cca3f2bad0a69afe200c8561c67aa9d2d641368824982fbbb7ebd3395202","roadmap":"OrthogonalL2Bases","to_sha":"e440f4eb3fccf5479ede3f5d6a671b4be37c9dde"}-->
# Status: OrthogonalL2Bases

This file documents the status of the OrthogonalL2Bases roadmap up until `e440f4e` (2026-09-30T05:46:25Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Every part of the roadmap is done. The Hermite functions and the Chebyshev polynomials are complete orthonormal bases of their `L²` spaces, built from one family-agnostic layer that also gives the weighted-measure and multidimensional bases. Each basis now carries an explicit expansion and Parseval API, and the Hermite basis has its two main structural consequences: it diagonalizes the `L²` Fourier transform, and on Schwartz space it carries the ladder operators. What is left lies outside the roadmap's own targets.

### Named results

- **The Hermite basis of `L²(ℝ)`**: [`hermiteHilbertBasis`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/SpecialFunctions/Hermite/Function/HilbertBasis.html#TauCeti.hermiteHilbertBasis) is a Hilbert basis for every `RCLike` scalar field, and its vectors are provably the Hermite functions `ψₙ`. Parseval and the expansion of an arbitrary `L²` function ([`hasSum_hermiteFunctionLp_expansion`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/SpecialFunctions/Hermite/Function/Parseval.html#TauCeti.hasSum_hermiteFunctionLp_expansion)) sit on top of it.
- **The Chebyshev basis**: [`chebyshevTHilbertBasis`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/SpecialFunctions/Trigonometric/Chebyshev/HilbertBasis.html#TauCeti.chebyshevTHilbertBasis) makes the normalized `Tₙ` a Hilbert basis of `L²(measureT)`, and every function there equals its Chebyshev series ([`hasSum_chebyshevT_expansion`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/SpecialFunctions/Trigonometric/Chebyshev/Parseval.html#TauCeti.hasSum_chebyshevT_expansion)).
- **Moment determinacy**: by [`Measure.ext_of_forall_integral_pow_eq_of_exists_integrable_exp`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Moments/Determinacy.html#TauCeti.Measure.ext_of_forall_integral_pow_eq_of_exists_integrable_exp), a finite measure on `ℝ` with a single finite exponential moment is determined by its polynomial moments. This is the one completeness mechanism behind every basis here. The proof goes through characteristic functions and strip-analyticity, not the roadmap's entire Fourier integral.
- **Hermite diagonalization of the Fourier transform**: the rescaled Hermite functions are eigenvectors of the unitary Fourier transform of `L²(ℝ; ℂ)` with eigenvalue `(-i)ⁿ` ([`fourier_twoPiHermiteFunctionLp`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/SpecialFunctions/Hermite/Function/Fourier/HilbertBasis.html#TauCeti.fourier_twoPiHermiteFunctionLp)). As a result, the transform of any `f` is its rotated Hermite series ([`hasSum_fourier_twoPiHermiteFunctionLp`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/SpecialFunctions/Hermite/Function/Fourier/HilbertBasis.html#TauCeti.hasSum_fourier_twoPiHermiteFunctionLp)).
- **The canonical commutation relation**: the creation and annihilation operators are continuous linear maps on `𝒮(ℝ, ℝ)` with `[a, a†] = 1` ([`hermiteAnnihilationCLM_comp_hermiteCreationCLM_sub_hermiteCreationCLM_comp_hermiteAnnihilationCLM`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/SpecialFunctions/Hermite/Function/Operator.html#TauCeti.hermiteAnnihilationCLM_comp_hermiteCreationCLM_sub_hermiteCreationCLM_comp_hermiteAnnihilationCLM)). The Hermite functions are eigenvectors of the oscillator ([`hermiteOscillatorCLM`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/SpecialFunctions/Hermite/Function/Operator.html#TauCeti.hermiteOscillatorCLM)) with eigenvalue `n + 1/2`.

### Notable definitions and infrastructure

- [`weightL2Isometry`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/MeasureTheory/Function/WeightL2Isometry.html#TauCeti.weightL2Isometry) is multiplication by `√w`, an isometry `L²(w·μ) ≃ₗᵢ L²(μ)`. Combined with transport of Hilbert bases along isometries (`HilbertBasis.mapₗᵢ`), it gives every family in both normalizations. For Chebyshev, this is how the envelope basis of `L²((-1,1]; dx)` ([`chebyshevTEnvelopeHilbertBasis`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/SpecialFunctions/Trigonometric/Chebyshev/Envelope.html#TauCeti.chebyshevTEnvelopeHilbertBasis)) is obtained.
- [`hilbertBasisOfWeightedMeasure`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/InnerProductSpace/WeightedOrthogonalBasis.html#TauCeti.hilbertBasisOfWeightedMeasure) turns an orthogonality relation plus completeness into a Hilbert basis. For polynomial families, the completeness input comes from moment determinacy, so a new family costs only its orthogonality relation and one exponential moment.
- [`piHilbertBasis`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/InnerProductSpace/L2/Pi.html#TauCeti.piHilbertBasis) and [`prodHilbertBasis`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/InnerProductSpace/L2/Product.html#TauCeti.prodHilbertBasis) build bases of finite and binary product measures from bases of the factors. Completeness of elementary tensors is proved by a Dynkin argument, and on product functions the coordinates factor.

### Roadmap coverage

All four parts are done.

- **Part A**: the Hermite polynomial calculus and orthogonality (A1) are done. The pointwise Hermite-function API of A2 is there in the source: parity, the ladder identities and the oscillator eigen-equation, which an earlier snapshot could not confirm. The basis with Parseval and the Fourier eigenrelation (A3) and the Gaussian-measure basis (A3′) are done, and both now have expansion API.
- **Part B**: B1 through B3 are complete in both normalizations.
- **Part C**: the basis is done, along with its envelope form and the cosine transfer under `x = cos θ` that its acceptance criterion names. Coefficients agree on both sides of that transfer.
- **Part D**: the bases for `L²(ℝ^ι)` and for the Gaussian product measure are done for finite `ι`, each with multi-index Parseval.

## The frontier

- **Ladder operators on `L²`**: `a` and `a†` exist only on Schwartz space. On `L²` they are unbounded, so extending them there needs unbounded or closed-operator packaging rather than continuous linear maps. The README calls this a downstream target, not a milestone.
- **Multidimensional Fourier diagonalization**: the one-dimensional eigenrelation and the product basis are both in place. Their combination on `L²(ℝ^ι)` has not been stated.
- **Laguerre and Jacobi**: these are out of scope by design. The roadmap assigns them a future roadmap, and those families would have to be defined before any `L²` basis statement about them.

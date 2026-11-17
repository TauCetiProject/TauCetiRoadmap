<!--tauceti-status:v1 {"roadmap":"ArithmeticDirichletSeries","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3","ts":"2026-11-13T23:20:12Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","state":"done"},{"id":"Layer 7","state":"done"},{"id":"Layer 8","state":"done"},{"id":"Layer 9","state":"done"},{"id":"Layer 10","state":"done"}],"readme_sha":"657ebdac3a533b7eeec408176e8c8aa98e52ef062843ff3b0169074935b959b9","roadmap":"ArithmeticDirichletSeries","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3"}-->
# Status: ArithmeticDirichletSeries

This file documents the status of the ArithmeticDirichletSeries roadmap up until `aa6e43e` (2026-11-13T23:20:12Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The roadmap is complete and archived. Every layer is proved, from the ideal carriers through Wiener–Ikehara to the generic prime-number-theorem transfer, and the prime ideal theorem holds unconditionally. What remains is a few edge cases that the README assigns to other roadmaps or makes optional.

### Named results

- **The prime ideal theorem** — for every number field, `ψ_K(x) ~ x`, `ϑ_K(x) ~ x` and `π_K(x) ~ Li(x)`, with no hypotheses left to supply ([`TauCeti.primeIdealTheorem`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ArithmeticDirichletSeries/Prime/PrimeIdealTheorem.html#TauCeti.primeIdealTheorem)).
- **The Wiener–Ikehara theorem** — if nonnegative coefficients have a Dirichlet series `F` on `Re s > 1` and `F(s) - κ/(s-1)` extends continuously to `Re s ≥ 1`, then `x⁻¹ ∑_{n≤x} a n → κ`; variants cover natural cutoffs, a positive abscissa, and coefficients in a finite-dimensional ordered vector space ([`TauCeti.LSeries.wienerIkehara`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LSeries/WienerIkehara/SharpCutoff.html#TauCeti.LSeries.wienerIkehara)).
- **Prime-number-theorem transfer** — boundary data with residue `δ` for the von Mangoldt series of a prime set gives `ψ ~ δx`, `ϑ ~ δx` and `π ~ δ Li(x)` ([`TauCeti.primeNumberTheoremTransfer`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ArithmeticDirichletSeries/Prime/Boundary.html#TauCeti.primeNumberTheoremTransfer)).
- **Nonvanishing on the line `Re s = 1`** — `ζ_K` has no zeros there away from its pole, by the 3-4-1 argument, which also covers the continued L-function of a unitary weight whose pointwise square has cancellation ([`TauCeti.ne_zero_of_eqOn_dedekindZeta`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/DedekindZeta.html#TauCeti.ne_zero_of_eqOn_dedekindZeta)).
- **The analytic Euler product** — where the ideal-indexed series converges absolutely, the local factors over the height-one primes have an unrestricted product equal to the `LSeries` of the norm coefficients ([`TauCeti.EulerProductData.hasProd_eulerFactor`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ArithmeticDirichletSeries/EulerProduct/Analytic.html#TauCeti.EulerProductData.hasProd_eulerFactor)).

### Notable definitions and infrastructure

- **Prime boundary data** — a von Mangoldt series with a continuous boundary remainder and a residue: the package every prime-counting consumer supplies and the transfer theorem consumes ([`TauCeti.PrimeBoundaryRemainder`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ArithmeticDirichletSeries/Prime/Boundary.html#TauCeti.PrimeBoundaryRemainder)).
- **The continued L-function of a weight** — defined by partial summation, equal to the `L`-series on `Re s > 1`, and holomorphic on `Re s > 1 - 1/[K:ℚ]` when the weight has cancellation; this lets character-family consumers leave the half-plane of convergence ([`TauCeti.continuedLFunctionOfWeight`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ArithmeticDirichletSeries/Cancellation.html#TauCeti.continuedLFunctionOfWeight)).
- **The logarithm of an Euler product** — for `Re s > σ`, with `σ` a point of absolute convergence and every local power series zero-free on the disc of radius `N(𝔭)^(-σ)`, the logarithmic derivative is the von Mangoldt series of the data. This is what turns any Euler product into input for the transfer theorem ([`TauCeti.EulerProductData.hasSum_idealTerm_vonMangoldt_of_zeroFree`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ArithmeticDirichletSeries/EulerProduct/Logarithm/VonMangoldtCoeff.html#TauCeti.EulerProductData.hasSum_idealTerm_vonMangoldt_of_zeroFree)).

### Roadmap coverage

All eleven layers, 0 through 10, are done, and the README records that its suggested file closes every milestone with no `sorry`. Layers 0 through 5 (carriers, regrouping, convolution, Euler products, counting and estimates) are complete. The weight carriers also have monoid structure, transport along field isomorphisms and a uniform `star`, and convolution and conjugation are compatible with Euler products. Layers 2.3 and 3.4 hold in the corrected form the README's errata require, with zero-free local factors rather than absolute convergence alone. Layer 6 is complete through cancellation and the named continuation, and Abel summation now covers general norm-indexed summatory functions. Layer 7 covers Dirichlet density together with a parallel natural-density calculus. Layers 8 and 9 are done, including the finite-dimensional ordered variant of Wiener–Ikehara. Layer 10 is done through 10.4, with the unconditional prime ideal theorem.

## The frontier

- **Quadratic characters at `s = 1`** — when `χ²` is a norm twist, nonvanishing is proved everywhere on `Re s = 1` except the single point where `L(χ², ·)` has its pole. For a quadratic character that point is `s = 1`, which needs a different argument from the 3-4-1 inequality; it belongs with character-specific input from `LFunctions`.
- **Ownership of the boundary export (10.4)** — the boundary data for all primes sits in an `LFunctions` file under the namespace the README names. The `LFunctions` roadmap should adopt it rather than rebuild it.
- **Wiener–Ikehara beyond finite dimension (9.2)** — the ordered variant covers finite-dimensional spaces with a closed positive cone. The README asks for more only "when the proof permits it", and the proof uses finite dimensionality.

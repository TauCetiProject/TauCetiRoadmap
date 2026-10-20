<!--tauceti-status:v1 {"roadmap":"ArithmeticDirichletSeries","to_sha":"c7ae9d762d2bc9436e7c2ed5006e64ac24822b2d","ts":"2026-10-13T09:39:50+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","state":"done"},{"id":"Layer 7","state":"done"},{"id":"Layer 8","state":"done"},{"id":"Layer 9","state":"done"},{"id":"Layer 10","state":"done"}],"readme_sha":"f375fdc7ee7cfda441216b12da86773f5b94f3aea10bf94400a50562f422ea8a","roadmap":"ArithmeticDirichletSeries","to_sha":"c7ae9d762d2bc9436e7c2ed5006e64ac24822b2d"}-->
# Status: ArithmeticDirichletSeries

This file documents the status of the ArithmeticDirichletSeries roadmap up until `c7ae9d7` (2026-10-13T09:39:50+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Every layer is done. The summit is in place, from Wiener–Ikehara through the generic prime-number-theorem transfer, and the prime ideal theorem is stated unconditionally. What remains is a few edge cases that the README marks as downstream or optional, plus polishing of the weight carriers.

### Named results

- **The prime ideal theorem** — for every number field, `ψ_K(x) ~ x`, `ϑ_K(x) ~ x` and `π_K(x) ~ Li(x)`, with no hypotheses left to supply ([`TauCeti.primeIdealTheorem`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ArithmeticDirichletSeries/Prime/PrimeIdealTheorem.html#TauCeti.primeIdealTheorem)).
- **The Wiener–Ikehara theorem** — suppose nonnegative coefficients have a Dirichlet series `F` on `Re s > 1`, and `F(s) - κ/(s-1)` extends continuously to `Re s ≥ 1`. Then `x⁻¹ ∑_{n≤x} a n → κ`. Variants cover natural cutoffs, a positive abscissa, and coefficients in a finite-dimensional ordered vector space ([`TauCeti.LSeries.wienerIkehara`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LSeries/WienerIkehara/SharpCutoff.html#TauCeti.LSeries.wienerIkehara)).
- **Prime-number-theorem transfer** — boundary data with residue `δ` for the von Mangoldt series of a prime set gives `ψ ~ δx`, `ϑ ~ δx` and `π ~ δ Li(x)` ([`TauCeti.primeNumberTheoremTransfer`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ArithmeticDirichletSeries/Prime/Boundary.html#TauCeti.primeNumberTheoremTransfer)).
- **Nonvanishing on the line `Re s = 1`** — `ζ_K` has no zeros there away from its pole, by the 3-4-1 argument ([`TauCeti.ne_zero_of_eqOn_dedekindZeta`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/DedekindZeta.html#TauCeti.ne_zero_of_eqOn_dedekindZeta)). The same argument covers the continued L-function of a unitary weight whose pointwise square also has cancellation ([`TauCeti.continuedLFunctionOfWeight_ne_zero_of_hasCancellation_sq`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ArithmeticDirichletSeries/Cancellation/Nonvanishing.html#TauCeti.continuedLFunctionOfWeight_ne_zero_of_hasCancellation_sq)).
- **The analytic Euler product** — on the half-plane of absolute convergence, the product of the local factors over the height-one primes equals the `LSeries` of the norm coefficients ([`TauCeti.EulerProductData.hasProd_eulerFactor`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ArithmeticDirichletSeries/EulerProduct/Analytic.html#TauCeti.EulerProductData.hasProd_eulerFactor)).

### Notable definitions and infrastructure

- **Prime boundary data** — a von Mangoldt series together with a continuous boundary remainder and a residue. Every prime-counting consumer supplies this package, and the transfer theorem consumes it ([`TauCeti.PrimeBoundaryRemainder`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ArithmeticDirichletSeries/Prime/Boundary.html#TauCeti.PrimeBoundaryRemainder)). The instance for all primes lives in an `LFunctions` file ([`TauCeti.LFunctions.primeIdealVonMangoldtBoundary`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LFunctions/PrimeIdealBoundary.html#TauCeti.LFunctions.primeIdealVonMangoldtBoundary)).
- **The continued L-function of a weight** — it is defined by partial summation and agrees with the `L`-series on `Re s > 1`. When the weight has cancellation it is holomorphic on `Re s > 1 - 1/[K:ℚ]`. This is what lets character-family consumers leave the half-plane of convergence ([`TauCeti.continuedLFunctionOfWeight`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ArithmeticDirichletSeries/Cancellation.html#TauCeti.continuedLFunctionOfWeight)).
- **Ideal weights as a monoid** — completely multiplicative ideal weights form a commutative monoid under pointwise product ([`TauCeti.MultiplicativeIdealWeight.instCommMonoid`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ArithmeticDirichletSeries/Weight.html#TauCeti.MultiplicativeIdealWeight.instCommMonoid)), and a field isomorphism transports them by a multiplicative equivalence ([`TauCeti.MultiplicativeIdealWeight.mapEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ArithmeticDirichletSeries/Weight.html#TauCeti.MultiplicativeIdealWeight.mapEquiv)). Character-family consumers can therefore form products, powers and conjugates and move them between isomorphic fields without bookkeeping.

### Roadmap coverage

All eleven layers, 0 through 10, are done. Layers 0–5 (carriers, regrouping, convolution, Euler products, counting and estimates) are complete, and Layer 0's weight carriers have since gained monoid structure and transport by equivalence. Layer 6 is complete through cancellation and the named continuation. Layer 7 covers Dirichlet density and a parallel natural-density calculus. Layers 8 and 9 are done, including the finite-dimensional ordered-coefficient variant of Wiener–Ikehara. Layer 10 is done through 10.4, with the unconditional prime ideal theorem.

## The frontier

- **Quadratic characters at `s = 1`** — when `χ²` is a norm twist, nonvanishing is proved everywhere on `Re s = 1` except at the single point where `L(χ², ·)` has its pole. For a quadratic character that point is `s = 1`, and it needs a different argument, not the 3-4-1 inequality. That argument belongs with character-specific input from `LFunctions` rather than here.
- **Ownership of the boundary export (10.4)** — the boundary data for all primes sits in an `LFunctions` file under the namespace the README names. The `LFunctions` roadmap should adopt it rather than rebuild it.
- **Wiener–Ikehara beyond finite dimension (9.2)** — the ordered variant covers finite-dimensional spaces with a closed positive cone, which includes finite-dimensional ordered algebras. The README asks for this only "when the proof permits it", and finite dimensionality is what the proof uses.

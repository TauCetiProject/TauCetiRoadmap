<!--tauceti-status:v1 {"roadmap":"ArithmeticDirichletSeries","to_sha":"1d095894ac25298eb2a23398826c0f867b6d3164","ts":"2026-10-05T01:07:53Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","state":"done"},{"id":"Layer 7","state":"done"},{"id":"Layer 8","state":"done"},{"id":"Layer 9","state":"done"},{"id":"Layer 10","state":"done"}],"readme_sha":"f375fdc7ee7cfda441216b12da86773f5b94f3aea10bf94400a50562f422ea8a","roadmap":"ArithmeticDirichletSeries","to_sha":"1d095894ac25298eb2a23398826c0f867b6d3164"}-->
# Status: ArithmeticDirichletSeries

This file documents the status of the ArithmeticDirichletSeries roadmap up until `1d09589` (2026-10-05T01:07:53Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Every layer is done. The summit is in place, from Wiener–Ikehara through the generic prime-number-theorem transfer, and the prime ideal theorem is now stated unconditionally. What remains is a few edge cases that the README marks as downstream or optional.

### Named results

- **The prime ideal theorem** — for every number field, `ψ_K(x) ~ x`, `ϑ_K(x) ~ x` and `π_K(x) ~ Li(x)`, with no hypotheses left to supply ([`TauCeti.primeIdealTheorem`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ArithmeticDirichletSeries/Prime/PrimeIdealTheorem.html#TauCeti.primeIdealTheorem)).
- **The Wiener–Ikehara theorem** — suppose nonnegative coefficients have a Dirichlet series `F` on `Re s > 1`, and `F(s) - κ/(s-1)` extends continuously to `Re s ≥ 1`. Then `x⁻¹ ∑_{n≤x} a n → κ`. Variants cover natural cutoffs, a positive abscissa, and coefficients in a finite-dimensional ordered vector space ([`TauCeti.LSeries.wienerIkehara`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LSeries/WienerIkehara/SharpCutoff.html#TauCeti.LSeries.wienerIkehara)).
- **Prime-number-theorem transfer** — boundary data with residue `δ` for the von Mangoldt series of a prime set gives `ψ ~ δx`, `ϑ ~ δx` and `π ~ δ Li(x)` ([`TauCeti.primeNumberTheoremTransfer`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ArithmeticDirichletSeries/Prime/Boundary.html#TauCeti.primeNumberTheoremTransfer)).
- **Nonvanishing on the line `Re s = 1`** — `ζ_K` has no zeros there away from its pole, by the 3-4-1 argument ([`TauCeti.ne_zero_of_eqOn_dedekindZeta`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/DedekindZeta.html#TauCeti.ne_zero_of_eqOn_dedekindZeta)). The same argument covers the continued L-function of a unitary weight whose pointwise square also has cancellation ([`TauCeti.continuedLFunctionOfWeight_ne_zero_of_hasCancellation_sq`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ArithmeticDirichletSeries/Cancellation/Nonvanishing.html#TauCeti.continuedLFunctionOfWeight_ne_zero_of_hasCancellation_sq)).
- **The analytic Euler product** — on the half-plane of absolute convergence, the product of the local factors over the height-one primes equals the `LSeries` of the norm coefficients ([`TauCeti.EulerProductData.hasProd_eulerFactor`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ArithmeticDirichletSeries/EulerProduct/Analytic.html#TauCeti.EulerProductData.hasProd_eulerFactor)).

### Notable definitions and infrastructure

- **Prime boundary data** — a von Mangoldt series together with a continuous boundary remainder and a residue. Every prime-counting consumer supplies this package, and the transfer theorem consumes it ([`TauCeti.PrimeBoundaryRemainder`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ArithmeticDirichletSeries/Prime/Boundary.html#TauCeti.PrimeBoundaryRemainder)). The instance for all primes now lives in an `LFunctions` file ([`TauCeti.LFunctions.primeIdealVonMangoldtBoundary`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LFunctions/PrimeIdealBoundary.html#TauCeti.LFunctions.primeIdealVonMangoldtBoundary)).
- **The continued L-function of a weight** — it is defined by partial summation and agrees with the `L`-series on `Re s > 1`. When the weight has cancellation it is holomorphic on `Re s > 1 - 1/[K:ℚ]`. This is what lets character-family consumers leave the half-plane of convergence ([`TauCeti.continuedLFunctionOfWeight`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ArithmeticDirichletSeries/Cancellation.html#TauCeti.continuedLFunctionOfWeight)).
- **One-sided Dirichlet-density bounds** — the epsilon inequalities that squeeze arguments use; matching bounds force a density ([`NumberField.Set.IsLowerDirichletDensityBound`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/DirichletDensityBounds.html#NumberField.Set.IsLowerDirichletDensityBound)). Natural density has a parallel calculus: finite and density-zero changes, readings against `Li(x)` and `x / log x`, and fibre counts along contraction.

### Roadmap coverage

All eleven layers, 0 through 10, are done.

- **Layers 0–5** (carriers, regrouping, convolution, Euler products, counting and estimates) were already complete.
- **Layer 6** closed its last gap in 6.5. Weights now have pointwise powers that are compatible with conjugation, restriction and norm twists, and the square `χ²` is used directly in the nonvanishing theorems.
- **Layer 7** is done, and natural density now has the same finite-error and fibre-count calculus as Dirichlet density, including density one for primes of residue degree one.
- **Layers 8 and 9** are done, including the ordered-coefficient variant of Wiener–Ikehara in finite dimension.
- **Layer 10** is done through 10.4, with the unconditional prime ideal theorem.

## The frontier

- **Quadratic characters at `s = 1`** — when `χ²` is a norm twist, nonvanishing is proved everywhere on `Re s = 1` except at the single point where `L(χ², ·)` has its pole. For a quadratic character that point is `s = 1`, and it needs a different argument, not the 3-4-1 inequality. That argument belongs with character-specific input from `LFunctions` rather than here.
- **Ownership of the boundary export (10.4)** — the boundary data for all primes now sits in an `LFunctions` file under the namespace the README names. The `LFunctions` roadmap should adopt it rather than rebuild it.
- **Wiener–Ikehara beyond finite dimension (9.2)** — the ordered variant covers finite-dimensional spaces with a closed positive cone, which includes finite-dimensional ordered algebras. The README asks for this only "when the proof permits it", and finite dimensionality is what the proof uses.

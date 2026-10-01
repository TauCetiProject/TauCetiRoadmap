<!--tauceti-status:v1 {"roadmap":"ArithmeticDirichletSeries","to_sha":"e440f4eb3fccf5479ede3f5d6a671b4be37c9dde","ts":"2026-09-30T05:46:25Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","remaining":"6.5: the pointwise-square operation on cancelling unitary weights and their continued L-functions","state":"partial"},{"id":"Layer 7","state":"done"},{"id":"Layer 8","state":"done"},{"id":"Layer 9","state":"done"},{"id":"Layer 10","state":"done"}],"readme_sha":"f375fdc7ee7cfda441216b12da86773f5b94f3aea10bf94400a50562f422ea8a","roadmap":"ArithmeticDirichletSeries","to_sha":"e440f4eb3fccf5479ede3f5d6a671b4be37c9dde"}-->
# Status: ArithmeticDirichletSeries

This file documents the status of the ArithmeticDirichletSeries roadmap up until `e440f4e` (2026-09-30T05:46:25Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The summit is proved: Wiener–Ikehara and `primeNumberTheoremTransfer` exist, and the boundary data for all primes of a number field has been constructed, so the prime ideal theorem follows. Every layer is done except Layer 6, which lacks only the pointwise-square operation of 6.5.

### Named results

- **The Wiener–Ikehara theorem** — if nonnegative coefficients have Dirichlet series `F` on `Re s > 1` and `F(s) - κ/(s-1)` extends continuously to `Re s ≥ 1`, then `x⁻¹ ∑_{n≤x} a n → κ`; the zero-residue case is exported separately ([`TauCeti.LSeries.wienerIkehara`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LSeries/WienerIkehara/SharpCutoff.html#TauCeti.LSeries.wienerIkehara)).
- **Prime-number-theorem transfer** — boundary data with residue `δ` for the von Mangoldt series of a prime set gives `ψ ~ δx`, `ϑ ~ δx` and `π ~ δ x/log x` ([`TauCeti.primeNumberTheoremTransfer`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ArithmeticDirichletSeries/Prime/Boundary.html#TauCeti.primeNumberTheoremTransfer)).
- **Nonvanishing of `ζ_K` on the line `Re s = 1`** — the continuation of the Dedekind zeta function has no zeros there away from its pole, by the 3-4-1 argument ([`TauCeti.ne_zero_of_eqOn_dedekindZeta`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/DedekindZeta.html#TauCeti.ne_zero_of_eqOn_dedekindZeta)). As a result, `-ζ_K'/ζ_K - 1/(s-1)` extends continuously to `Re s ≥ 1`, which is exactly the input Wiener–Ikehara needs.
- **The all-prime normalization** — `∑_𝔭 N(𝔭)^{-s} = log(1/(s-1)) + O(1)` as `s → 1⁺`, which makes the ratio definition of Dirichlet density equivalent to the logarithmic one ([`TauCeti.primeIdealZetaSum_univ_sub_log_one_div_sub_one_isBigO`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ArithmeticDirichletSeries/Prime/IdealZetaSum.html#TauCeti.primeIdealZetaSum_univ_sub_log_one_div_sub_one_isBigO)).
- **The analytic Euler product** — on the half-plane of absolute convergence, the local factors of Euler-product data have an unconditional product over the height-one primes, and it equals the `LSeries` of the norm coefficients ([`TauCeti.EulerProductData.hasProd_eulerFactor`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ArithmeticDirichletSeries/EulerProduct/Analytic.html#TauCeti.EulerProductData.hasProd_eulerFactor)). Its logarithmic derivative is now the von Mangoldt series for general data on a zero-free region, not only for completely multiplicative weights.

### Notable definitions and infrastructure

- **Prime boundary data** — the package of a von Mangoldt series, a continuous boundary remainder and a residue. Every prime-counting consumer supplies this package, and the transfer theorem consumes it ([`TauCeti.PrimeBoundaryRemainder`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ArithmeticDirichletSeries/Prime/Boundary.html#TauCeti.PrimeBoundaryRemainder)). The all-prime instance is [`TauCeti.LFunctions.primeIdealVonMangoldtBoundary`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ArithmeticDirichletSeries/Prime/DedekindZeta.html#TauCeti.LFunctions.primeIdealVonMangoldtBoundary).
- **The continued L-function of a weight** — defined by partial summation. It agrees with the `L`-series on `Re s > 1`, and it is holomorphic on `Re s > 1 - 1/[K:ℚ]` when the weight has cancellation. Character-family consumers use it to leave the half-plane of convergence ([`TauCeti.continuedLFunctionOfWeight`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ArithmeticDirichletSeries/Cancellation.html#TauCeti.continuedLFunctionOfWeight)).
- **One-sided Dirichlet-density bounds** — the epsilon inequalities that squeeze arguments use, with matching bounds forcing a density ([`NumberField.Set.IsLowerDirichletDensityBound`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/DirichletDensityBounds.html#NumberField.Set.IsLowerDirichletDensityBound)).

### Roadmap coverage

Layers 0 through 5 are done. That includes the `ℚ(i)` worked example refuting a pointwise-product rule and, in Layer 5.3, density zero for primes of residue degree above one. Layer 3 now also carries the holomorphic logarithm and the von Mangoldt identity for general Euler-product data. Layer 6 is done except for one operation in 6.5. Cancellation, the continued L-function and its compatibility with conjugation, imaginary norm twists and restriction all exist, but no pointwise-square operation does. Layer 7 is done: Mathlib's density API is adopted, and the one-sided bounds, natural density and the all-prime normalization are proved. So are the finite-error, complement, union and squeeze calculus, the natural-to-Dirichlet implication, and fibre counts along contraction. Layer 8 is done, now including the equality of ordinary and absolute abscissae for nonnegative coefficients. Layer 9 is done, including the variants for natural cutoffs, eventually nonnegative coefficients and a positive abscissa. Layer 10 is done through 10.4. The external boundary input was built inside this roadmap under the `LFunctions` namespace instead of arriving from `LFunctions`.

## The frontier

- **Pointwise squares under cancellation (6.5)** — the README asks for a pointwise-square operation on cancelling weights and their continued L-functions for character-family consumers. It is the one contract item still absent.
- **An unconditional prime ideal theorem** — the result is `primeIdealTheorem_of_boundary` applied to `primeIdealVonMangoldtBoundary`, but no declaration states it without hypotheses. A one-line corollary would give downstream roadmaps a name to cite.
- **Ownership of the boundary export (10.4)** — `TauCeti.LFunctions.primeIdealVonMangoldtBoundary` now lives in this roadmap's files. The `LFunctions` roadmap should adopt it rather than build a second copy.
- **Wiener–Ikehara in an ordered normed algebra (9.2)** — the README asks for this variant only "when the proof permits it", and nothing for it exists.

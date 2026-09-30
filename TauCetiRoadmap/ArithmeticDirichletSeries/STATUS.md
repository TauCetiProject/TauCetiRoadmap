<!--tauceti-status:v1 {"roadmap":"ArithmeticDirichletSeries","to_sha":"b1ab119fa96ae6d2d8f43e2aa8159a148ba67f57","ts":"2026-09-27T20:34:44+00:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","state":"done"},{"id":"Layer 7","state":"done"},{"id":"Layer 8","state":"done"},{"id":"Layer 9","state":"done"},{"id":"Layer 10","remaining":"the external LFunctions boundary theorem for the unconditional prime ideal specialization","state":"partial"}],"readme_sha":"f375fdc7ee7cfda441216b12da86773f5b94f3aea10bf94400a50562f422ea8a","roadmap":"ArithmeticDirichletSeries","to_sha":"b1ab119fa96ae6d2d8f43e2aa8159a148ba67f57"}-->
# Status: ArithmeticDirichletSeries

This file documents the status of the ArithmeticDirichletSeries roadmap up until `b1ab119` (2026-09-27T20:34:44+00:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The arithmetic, Euler-product, density, and Tauberian layers now reach the generic prime-number-theorem transfer. The prime ideal specialization remains conditional: the continuous Dedekind-zeta boundary remainder required from `LFunctions` has not been established in the supplied record.

### Named results

- **[The Wiener–Ikehara theorem](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LSeries/WienerIkehara/SharpCutoff.html#TauCeti.LSeries.wienerIkehara)** — a nonnegative Dirichlet series with the stated continuous boundary remainder has partial sums asymptotic to its residue times the cutoff.
- **[The prime-number-theorem transfer](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ArithmeticDirichletSeries/Prime/Boundary.html#TauCeti.primeNumberTheoremTransfer)** — exact prime boundary data give the ψ, ϑ and π asymptotics, with higher prime powers removed between the first two.
- **[The all-prime normalization](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ArithmeticDirichletSeries/Prime/IdealZetaSum.html#TauCeti.primeIdealZetaSum_univ_sub_log_one_div_sub_one_isBigO)** — the reciprocal-norm sum over all prime ideals is `log(1/(s-1)) + O(1)` as `s → 1⁺`.
- **[Continuation from cancellation](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ArithmeticDirichletSeries/Cancellation.html#TauCeti.differentiableOn_continuedLFunctionOfWeight)** — a unitary weight with the required ideal-sum bound has a holomorphic continuation to `Re s > 1 - 1/[K:ℚ]`.
- **[The Euler-product logarithmic-derivative identity](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ArithmeticDirichletSeries/EulerProduct/Logarithm/VonMangoldtCoeff.html#TauCeti.EulerProductData.logDeriv_LSeries_eq_neg_LSeries_normCoeff_vonMangoldt_of_zeroFree)** — for zero-free local power series, the logarithmic derivative is the negative L-series of the prime-power von Mangoldt coefficients.

### Notable definitions and infrastructure

- **[Prime boundary data](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ArithmeticDirichletSeries/Prime/Boundary.html#TauCeti.PrimeBoundaryRemainder)** — packages the exact series and continuous remainder consumed by the transfer theorem.
- **[Natural density of prime ideals](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ArithmeticDirichletSeries/NaturalDensity.html#NumberField.Set.HasNaturalDensity)** — supplies the counting-side predicate for the proved implication to Dirichlet density.
- **[Ray class characters as unitary ideal weights](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/Global/RayClass/Character/Weight.html#TauCeti.GlobalNumberFields.RayClassCharacter.toUnitaryIdealWeight)** — gives character constructions a zero extension at bad primes compatible with this roadmap's analytic carrier.

### Roadmap coverage

Layers 0–5 are done: the ideal carriers, norm regrouping, convolution, Euler products, counting, and estimates are in place; Layer 5 now includes density zero for primes of residue degree above one. Layer 6 is done, including cancellation-based continuation and Perron summation. Layer 7 has the all-prime normalization, finite-error and squeeze calculus, the natural-to-Dirichlet bridge, and fibre-count results, so is done. Landau's theorem and equality of the ordinary and absolute abscissae complete Layer 8; sharp Wiener–Ikehara and its principal variants complete Layer 9. Layer 10 is partial: its generic ψ-to-ϑ-to-π transfer and conditional prime ideal theorem are proved, while the named external boundary input for an unconditional prime ideal theorem is absent.

## The frontier

- **Dedekind-zeta boundary input** — prove in `LFunctions` that `-ζ'_K/ζ_K - 1/(s-1)` extends continuously to `Re s ≥ 1`, including the needed boundary nonvanishing; the [Dedekind-zeta boundary constructor](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ArithmeticDirichletSeries/Prime/DedekindZeta.html#TauCeti.PrimeBoundaryRemainder.ofDedekindZeta) then supplies the input for the unconditional prime ideal theorem.

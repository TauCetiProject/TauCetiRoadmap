<!--tauceti-status:v1 {"roadmap":"ArithmeticDirichletSeries","to_sha":"163ce800f7f3b5089428c699474f28f877d6759b","ts":"2026-09-29T08:26:13+00:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","state":"done"},{"id":"Layer 7","state":"done"},{"id":"Layer 8","state":"done"},{"id":"Layer 9","state":"done"},{"id":"Layer 10","state":"done"}],"readme_sha":"f375fdc7ee7cfda441216b12da86773f5b94f3aea10bf94400a50562f422ea8a","roadmap":"ArithmeticDirichletSeries","to_sha":"163ce800f7f3b5089428c699474f28f877d6759b"}-->
# Status: ArithmeticDirichletSeries

This file documents the status of the ArithmeticDirichletSeries roadmap up until `163ce80` (2026-09-29T08:26:13+00:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** All ten internal layers, from ideal arithmetic functions through the generic prime-number-theorem transfer, are in place. The prime ideal theorem remains conditional on continuous boundary data for the Dedekind zeta logarithmic derivative supplied by `LFunctions`; no unconditional prime ideal theorem is established here.

### Named results

- **The prime-number-theorem transfer** — exact boundary data for a prime set yield the asymptotics for its von Mangoldt sum ψ, logarithmically weighted count ϑ, and prime count π ([`TauCeti.primeNumberTheoremTransfer`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ArithmeticDirichletSeries/Prime/Boundary.html#TauCeti.primeNumberTheoremTransfer)).
- **The Wiener–Ikehara theorem** — a nonnegative Dirichlet series with a continuous remainder after subtracting its pole at one has sharp-cutoff partial sums asymptotic to the residue times the cutoff ([`TauCeti.LSeries.wienerIkehara`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LSeries/WienerIkehara/SharpCutoff.html#TauCeti.LSeries.wienerIkehara)).
- **The all-prime logarithmic normalization** — the sum of reciprocal prime-ideal norms near one equals log(1/(s − 1)) up to a bounded term, connecting ratio-normalized and logarithmically normalized Dirichlet density ([`TauCeti.primeIdealZetaSum_univ_sub_log_one_div_sub_one_isBigO`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ArithmeticDirichletSeries/Prime/IdealZetaSum.html#TauCeti.primeIdealZetaSum_univ_sub_log_one_div_sub_one_isBigO)).
- **The analytic Euler product** — on the half-plane of absolute convergence, the product of ideal local factors equals the L-series of the norm coefficients ([`TauCeti.EulerProductData.hasProd_eulerFactor`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ArithmeticDirichletSeries/EulerProduct/Analytic.html#TauCeti.EulerProductData.hasProd_eulerFactor)).
- **Landau’s theorem** — a Dirichlet series with nonnegative coefficients cannot continue analytically across its finite, actual abscissa of absolute convergence ([`TauCeti.LSeries.landau`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LSeries/Landau.html#TauCeti.LSeries.landau)).

### Notable definitions and infrastructure

- **Prime boundary data** — packages the exact von Mangoldt series and continuous remainder needed by the transfer; the Dedekind-zeta constructor still requires that remainder as an input ([`TauCeti.PrimeBoundaryRemainder`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ArithmeticDirichletSeries/Prime/Boundary.html#TauCeti.PrimeBoundaryRemainder)).
- **Cancellation for unitary ideal weights** — an ideal partial-sum bound that yields continuation to Re s > 1 − 1/[K : ℚ] ([`TauCeti.HasCancellation`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ArithmeticDirichletSeries/Cancellation.html#TauCeti.HasCancellation)).
- **Euler-product data** — records prime-power factors and coprime multiplicativity, allowing analytic product and logarithmic-derivative theorems for more than completely multiplicative weights ([`TauCeti.EulerProductData`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ArithmeticDirichletSeries/EulerProduct/Data.html#TauCeti.EulerProductData)).

### Roadmap coverage

Layers 0–4 are done: the ideal carrier, norm regrouping, convolution, Euler products, and inclusive counting functions are established. Layers 5–7 are done after the higher-degree-prime density-zero result, cancellation and continuation, Stieltjes summation, and the density calculus with fibre-count and contraction theorems. Layers 8–9 are done with the equality of ordinary and absolute abscissae for nonnegative coefficients and the sharp-cutoff Wiener–Ikehara theorem and variants. Layer 10 is done as a generic and conditional transfer, including the conditional all-prime specialization; applying it unconditionally awaits the external boundary theorem.

## The frontier

- **The all-prime boundary** — `LFunctions` must supply a continuous extension of −ζ′/ζ − 1/(s − 1) across Re s = 1, including nonvanishing there, to turn the conditional prime ideal theorem into an unconditional one. The [Dedekind-zeta boundary constructor](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ArithmeticDirichletSeries/Prime/DedekindZeta.html#TauCeti.PrimeBoundaryRemainder.ofDedekindZeta) accepts precisely this input.
- **Class-specific boundaries** — Chebotarev applications still require their own continuous boundary remainders for the corresponding prime sets before the generic transfer applies.

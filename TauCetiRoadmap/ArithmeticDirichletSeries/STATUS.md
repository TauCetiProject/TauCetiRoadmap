<!--tauceti-status:v1 {"roadmap":"ArithmeticDirichletSeries","to_sha":"ac726e8cab29a86a2ecc95cc1462c3d13261d38f","ts":"2026-09-22T20:57:37Z"}-->
# Status: ArithmeticDirichletSeries

This file documents the status of the ArithmeticDirichletSeries roadmap up until `ac726e8` (2026-09-22T20:57:37Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layers 0–8 are complete, including the density-zero treatment of higher-residue-degree primes, cancellation and named continuation, and the ordinary/absolute abscissa bridge. Layer 9 now has its sharp Wiener–Ikehara theorem and several variants; Layer 10.1–10.3 reaches the conditional prime-number-theorem summit, while the unconditional prime-ideal input from `LFunctions` has not begun.

### Named results

- **The logarithmic Dirichlet-density normalization** — Dirichlet density is equivalent to convergence of the prime sum after division by `log (1/(s-1))` ([`NumberField.Set.hasDirichletDensity_iff_tendsto_div_log_one_div_sub_one`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ArithmeticDirichletSeries/Prime/IdealZetaSum.html#NumberField.Set.hasDirichletDensity_iff_tendsto_div_log_one_div_sub_one)).
- **Cancellation continuation** — a unitary ideal weight with the prescribed partial-sum cancellation has a holomorphic continued `L`-function on `Re s > 1 - 1/[K : ℚ]` ([`TauCeti.differentiableOn_continuedLFunctionOfWeight`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ArithmeticDirichletSeries/Cancellation.html#TauCeti.differentiableOn_continuedLFunctionOfWeight)).
- **The ordinary/absolute abscissa identity** — for nonnegative coefficients, ordinary and absolute convergence have the same abscissa, the boundary needed by Landau ([`TauCeti.LSeries.abscissaOfConv_eq_abscissaOfAbsConv_of_nonneg`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LSeries/Convergence.html#TauCeti.LSeries.abscissaOfConv_eq_abscissaOfAbsConv_of_nonneg)).
- **The Wiener–Ikehara theorem** — nonnegative coefficients with a continuous boundary remainder after subtracting a nonnegative simple pole have normalized summatory function tending to the residue ([`TauCeti.LSeries.wienerIkehara`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LSeries/WienerIkehara/SharpCutoff.html#TauCeti.LSeries.wienerIkehara)).
- **Prime-number-theorem transfer** — exact boundary data packaged for a prime set yield the von Mangoldt, logarithmically weighted, and unweighted prime asymptotics together ([`TauCeti.primeNumberTheoremTransfer`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ArithmeticDirichletSeries/Prime/Boundary.html#TauCeti.primeNumberTheoremTransfer)).

### Notable definitions and infrastructure

- **Dirichlet-density bounds** — separate lower and upper epsilon predicates support squeeze arguments and keep the density API honest ([`NumberField.Set.IsLowerDirichletDensityBound`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/DirichletDensityBounds.html#NumberField.Set.IsLowerDirichletDensityBound)).
- **The cancellation predicate** — `HasCancellation` records the uniform ideal partial-sum bound that drives Abel continuation and its restriction and twist lemmas ([`TauCeti.HasCancellation`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ArithmeticDirichletSeries/Cancellation.html#TauCeti.HasCancellation)).
- **Prime boundary remainder** — `PrimeBoundaryRemainder` isolates the exact `LSeries` and continuity hypotheses consumed by the generic prime transfer ([`TauCeti.PrimeBoundaryRemainder`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ArithmeticDirichletSeries/Prime/Boundary.html#TauCeti.PrimeBoundaryRemainder)).

### Roadmap coverage

Layers 0–5 are done: carriers, norm regrouping, convolution and Euler products, counting, ideal estimates, higher-prime-power control, and density-zero higher-degree primes are all present. Layer 6 is done through Abel/Perron summation, cancellation, and the named continuation. Layer 7 is complete, including the adopted density API, normalization, finite-error calculus, natural-to-Dirichlet transfer, and fibre counts. Layer 8 is complete. Layer 9.1 and the natural-cutoff, eventual-nonnegativity, zero-residue, and shifted-abscissa variants are present, but the README's finite-coefficient-change and ordered-algebra variants are not established here. Layers 10.1–10.3 are complete conditionally; 10.4 still depends on the external `TauCeti.LFunctions.primeIdealVonMangoldtBoundary` export.

## The frontier

- **Unconditional prime-ideal theorem (Layer 10.4)** — supply `TauCeti.LFunctions.primeIdealVonMangoldtBoundary : PrimeBoundaryRemainder K Set.univ 1`; the current `primeIdealTheorem_of_boundary` remains conditional.
- **The remaining Wiener–Ikehara variants (Layer 9.2)** — add the finite-change-of-coefficients and ordered-real-algebra forms requested by the roadmap; the core theorem and currently landed variants are already available.

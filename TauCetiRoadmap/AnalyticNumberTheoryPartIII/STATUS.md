<!--tauceti-status:v1 {"roadmap":"AnalyticNumberTheoryPartIII","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","state":"untouched"},{"id":"Layer 9","state":"untouched"},{"id":"Layer 10","remaining":"needs Layers 8 and 9 first","state":"untouched"},{"id":"Layer 11","remaining":"11.1-11.3; in 11.4 the 2^omega series, the mu^2 abscissa and the combined statements","state":"partial"},{"id":"Layer 12","state":"untouched"},{"id":"Layer 13","state":"untouched"}],"readme_sha":"7a20a91ca258c162d4a04ad8b31f91dd84cca067e510f542213dee76874c1aab","roadmap":"AnalyticNumberTheoryPartIII","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: AnalyticNumberTheoryPartIII

This file documents the status of the AnalyticNumberTheoryPartIII roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Only Layer 11 has begun. Two of the four classical series of 11.4 are proved with their exact abscissas. Layers 7–10, 12 and 13 show no work yet: no Fourier decay, contour shifts, Mellin smoothing, transfer theorem, Tauberian theorem or Erdős–Goldbach applications.

### Named results

- **The Liouville Dirichlet series** — `Σ λ(n) n^{−s} = ζ(2s)/ζ(s)` on `Re s > 1` ([`LSeriesHasSum_liouville`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LSeries/Liouville.html#TauCeti.LSeriesHasSum_liouville)). Its abscissa of absolute convergence is exactly one ([`abscissaOfAbsConv_liouville`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LSeries/Liouville.html#TauCeti.abscissaOfAbsConv_liouville)).
- **The totient Dirichlet series** — `Σ φ(n) n^{−s} = ζ(s − 1)/ζ(s)` on `Re s > 2` ([`LSeriesHasSum_totient`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LSeries/Totient.html#TauCeti.LSeriesHasSum_totient)). It converges absolutely exactly on that half-plane ([`LSeriesSummable_totient_iff`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LSeries/Totient.html#TauCeti.LSeriesSummable_totient_iff)), so its abscissa is two, not one.

### Roadmap coverage

Layer 11 is partial. In 11.4 the `λ` and `φ` series and their abscissas are proved. The `2^ω` series and the `μ²` abscissa are missing, as is the combined statement `LSeries_two_pow_omega_moebius_sq_liouville` with its four-abscissa companion. The library does already have the `μ²` series in Euler-correction form, `ζ(s) = ζ(2s) L(μ², s)`, from other work. Targets 11.1 (complete multiplicativity), 11.2 (`σ_ν` and `d_z` with complex parameter) and 11.3 (Ramanujan's four-shift identity) have not started. Layers 7, 8, 9, 10, 12 and 13 are untouched: a search of the source finds none of their headline definitions (`deltaSpike`, `smoothCutoff`, `inghamExponent`, `factorialFactorCount`, the Goldbach-range propositions) or theorems.

## The frontier

- **11.4, the rest** — prove the series `ζ(s)²/ζ(2s)` for `2^ω` and pin the abscissa of `μ²` at one, then assemble the combined statements. The route needs only `2^{ω(n)} ≤ τ(n)` and divergence of `Σ 1/p`. The multiplicativity of `2^ω` comes from ProbabilisticAndMetricNumberTheory §0.1a.
- **11.1 and 11.2, complete multiplicativity and the complex divisor functions** — the predicate on `ArithmeticFunction R` and its equivalence with `ℕ →*₀ R`, then `σ_ν` and `d_z` for complex `ν`, `z`. `d_z` rests on Tau Ceti's binomial series for `Ring.multichoose`.
- **12.1, the Hardy–Landau Tauberian theorem** — independent of every other layer and uses only finite sums and limits, so it is a clean starting point.
- **Layer 8, the rectangle residue theorem in edge form** — the base of the contour shifts that Layer 10 needs. It is independent of Layers 7 and 9.
- **Layer 10, the transfer theorem** — blocked until 8.1–8.3 and 9.1–9.4 are in place.

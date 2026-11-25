<!--tauceti-status:v1 {"roadmap":"AnalyticNumberTheoryPartIII","to_sha":"d25d526e576659755e7a68a568facb24cb7cf97f","ts":"2026-11-24T20:52:12Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 7","remaining":"7.1 Fourier decay for bounded variation, 7.3 principal-value inversion, 7.4 sampling aliasing bound","state":"partial"},{"id":"Layer 8","remaining":"8.2 Caratheodory inequality and 8.3 Landau's logarithmic-derivative lemma","state":"partial"},{"id":"Layer 9","state":"done"},{"id":"Layer 10","remaining":"assemble the 10.2 transfer theorem; 10.3 for Hecke L-functions, which needs 8.3","state":"partial"},{"id":"Layer 11","remaining":"d_z and its series in 11.2, the four-shift identity in 11.3, the combined 11.4 statements","state":"partial"},{"id":"Layer 12","state":"done"},{"id":"Layer 13","state":"untouched"}],"readme_sha":"d86ed1d2b30dc333406ebf6452f3c9a50322da9a1e146fe2b793e3a70fd816a4","roadmap":"AnalyticNumberTheoryPartIII","to_sha":"d25d526e576659755e7a68a568facb24cb7cf97f"}-->
# Status: AnalyticNumberTheoryPartIII

This file documents the status of the AnalyticNumberTheoryPartIII roadmap up until `d25d526` (2026-11-24T20:52:12Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Mellin smoothing (Layer 9) and the Hardy–Landau Tauberian theorem (Layer 12) are done. The residue calculus of Layer 8 and the first step of Layer 10 are in place, but the transfer theorem in Ingham's form is not yet assembled. Layers 7 and 11 are partial, and Layer 13 has not begun.

### Named results

- **The rectangle residue theorem** — the four-edge boundary integral of a function meromorphic at finitely many interior points is `2πi` times the sum of its residues, with no restriction to simple poles ([`rectangle_boundary_integral_eq_residues`](https://taucetiproject.org/docs/TauCeti/Analysis/Contour/Residue/Rectangle.html#TauCeti.Contour.rectangle_boundary_integral_eq_residues)). Its U-shaped and L-shaped variants are also proved.
- **The Mellin transform of a smoothed cutoff** — it equals `mellin ν (εs)/s` ([`mellin_smoothCutoff`](https://taucetiproject.org/docs/TauCeti/Analysis/MellinTransform/SmoothCutoff.html#TauCeti.mellin_smoothCutoff)) and is bounded by `C/(|s|(1 + ε|s|)^k)` for a `C^k` bump, uniformly in `0 < ε ≤ 1` ([`exists_norm_mellin_smoothCutoff_le`](https://taucetiproject.org/docs/TauCeti/Analysis/MellinTransform/SmoothCutoff.html#TauCeti.exists_norm_mellin_smoothCutoff_le)).
- **Smoothed against sharp sums** — for coefficients bounded by `B log(n + 1)`, the smoothed sum is within `3B(2εX + 1) log X` of `Σ_{n≤X} a(n)` ([`norm_sum_sub_tsum_mul_smoothCutoff_le`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LSeries/SmoothedSum/Basic.html#TauCeti.norm_sum_sub_tsum_mul_smoothCutoff_le)). The smoothed sum itself is an inverse Mellin integral ([`hasSum_mul_smoothCutoff`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LSeries/SmoothedSum/Basic.html#TauCeti.LSeries.hasSum_mul_smoothCutoff)).
- **The divisor series with complex shift** — `Σ σ_ν(n) n^{−s} = ζ(s)ζ(s − ν)`, with abscissa of absolute convergence exactly `max(1, 1 + Re ν)` ([`LSeries_sigmaC`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LSeries/Divisor/PowerSum.html#TauCeti.LSeries.LSeries_sigmaC), [`abscissaOfAbsConv_sigmaC`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LSeries/Divisor/PowerSum.html#TauCeti.LSeries.abscissaOfAbsConv_sigmaC)).
- **The Hardy–Landau Tauberian theorem** — if the Cesàro means of the partial sums converge and `n a_n ≥ −K`, then the partial sums converge to the same limit ([`tendsto_of_cesaro_of_mul_ge`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecificLimits/Cesaro/Tauberian.html#TauCeti.tendsto_of_cesaro_of_mul_ge)). There is also a normed-space form under `n‖a_n‖ ≤ K`.

### Notable definitions and infrastructure

- **Smoothed cutoffs** ([`smoothCutoff`](https://taucetiproject.org/docs/TauCeti/Analysis/MellinTransform/SmoothCutoff.html#TauCeti.smoothCutoff), built from [`deltaSpike`](https://taucetiproject.org/docs/TauCeti/Analysis/MellinTransform/SmoothCutoff.html#TauCeti.deltaSpike)) — the weight that turns a partial sum into a contour integral whose tails can be controlled.
- **The Ingham exponent** ([`inghamExponent`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LSeries/InghamExponent.html#TauCeti.inghamExponent)) — measures the saving a zero-free width gives. It already has the lower bound `c₁ (log x)^{1/(1+A)}` that the transfer theorem uses to absorb logarithms.
- **Complete multiplicativity** ([`IsCompletelyMultiplicative`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ArithmeticFunction/CompletelyMultiplicative.html#ArithmeticFunction.IsCompletelyMultiplicative)) — the predicate, identified with `ℕ →*₀ R`. It gives the Euler product of an L-series and the Dirichlet inverse `μ · f`.

### Roadmap coverage

Layers 9 and 12 are done. In Layer 9, 9.2's strip decay comes from an existing bound for compactly supported `C^k` functions. Layer 8 has 8.1, 8.1a and 8.1b, but not Carathéodory's inequality (8.2) or Landau's logarithmic-derivative lemma (8.3). Layer 10 has 10.1 and the inputs to 10.2: the contour identity across a simple pole, edge and tail bounds, L-series bounds for log-bounded coefficients, and the Ingham exponent. The transfer theorem itself and 10.3 are missing. Layer 11 has 11.1 and `σ_ν`, and each of the four series of 11.4 with its exact abscissa. It lacks `d_z`, the four-shift identity and 11.4's combined statements, although the `τ(n²)` corollary of 11.3 is proved. Layer 7 has only 7.2, the sine-integral bounds. Layer 13 is untouched: there is no `factorialFactorCount` and no Goldbach-range propositions.

## The frontier

- **10.2, the transfer theorem** — every listed input is now proved. What remains is to choose the height `T` by `η(T + 3)` and set `ε = T^{−1/2}`, bound the four edges, and absorb the logarithmic factors with the Ingham lower bound.
- **11.2's `d_z` and the 11.4 statements** — define `generalizedDivisor` through `Ring.multichoose` and prove `L(d_z, s) = exp(z log ζ(s))` from Tau Ceti's binomial series. The combined 11.4 statements only need to assemble results that already exist.
- **11.3, Ramanujan's four-shift identity** — compare the Euler factors of `σ_α σ_β` with `ζ(s)ζ(s − α)ζ(s − β)ζ(s − α − β)/ζ(2s − α − β)`. The `τ(n²)` case shows the local method works.
- **8.2 and 8.3, Carathéodory and Landau** — these block 10.3. The library has real-part forms of Landau's lemma that keep some zeros, from other work, but not the norm bound against the full zero sum that 8.3 asks for.
- **Layer 7's remaining targets** — Fourier decay for bounded variation (7.1), principal-value Mellin inversion (7.3, which can now use 7.2) and the aliasing bound (7.4). Layer 13 is independent and could start at any time.

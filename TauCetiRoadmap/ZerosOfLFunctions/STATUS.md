<!--tauceti-status:v1 {"roadmap":"ZerosOfLFunctions","to_sha":"e06d6728b2f32e212d12e96ddcd366c4445e9e10","ts":"2026-11-11T00:57:04Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","remaining":"Stirling on sectors and strips, digamma asymptotic, gamma-factor growth 1.5, OrderLE of invGammaFactor, continuedL","state":"partial"},{"id":"Layer 2","remaining":"Dedekind and Hecke conductor identifications and the continuedL half of the normalization translation","state":"partial"},{"id":"Layer 3","remaining":"finite order for the families 3.1, polynomial edge bounds in 3.2, the two edges 3.3, convexity 3.4, strip growth 3.5","state":"partial"},{"id":"Layer 4","remaining":"family local counts 4.4, N(T) and its bounds 4.5, Nevanlinna comparison 4.6","state":"partial"},{"id":"Layer 5","remaining":"the canonical product 5.3, Hadamard at order one 5.5 and the L-function corollaries 5.6","state":"partial"},{"id":"Layer 6","remaining":"3-4-1, every zero-free region, the exceptional zero, the edges 6.5; for 6.4a the order bound, C_Gamma and the retained-zero inequalities","state":"partial"},{"id":"Layer 7","remaining":"divisor form of 7.2, argument variation and S(T), Riemann-von Mangoldt and its uniform and corollary forms","state":"partial"},{"id":"Layer 8","state":"untouched"},{"id":"Layer 9","state":"untouched"}],"readme_sha":"5cfcebf5af783f64bc54bc6064b921148922e299a7846f4ee78e50cd7e387298","roadmap":"ZerosOfLFunctions","to_sha":"e06d6728b2f32e212d12e96ddcd366c4445e9e10"}-->
# Status: ZerosOfLFunctions

This file documents the status of the ZerosOfLFunctions roadmap up until `e06d672` (2026-11-11T00:57:04Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer 0 is done. The disc and rectangle tools for counting zeros are now in place: Jensen's bound, zero-count growth for functions of finite order, and the argument principle on a rectangle. But no asymptotic theorem about an L-function has been proved yet: no Stirling estimate, convexity bound, `N(T)`, Hadamard product or zero-free region. Layers 8 and 9 have not begun.

### Named results

- **Twice Riemann's ξ as an entire completion** — [the explicit completion of ζ](https://taucetiproject.org/docs/TauCeti/NumberTheory/LFunctions/Zeros/Completion/RiemannZeta.html#TauCeti.LFunctions.zetaEntireCompletion) is `s(s − 1)Λ(s)`, with the value 1 filled in at 0 and 1. It is entire, invariant under `s ↦ 1 − s`, and is what the general construction gives for ζ.
- **Jensen's bound** — for `f` analytic on a closed disc of radius `R`, bounded by `M ≥ 1` on its boundary and nonzero at the centre, [the zeros in the concentric disc of radius `r`](https://taucetiproject.org/docs/TauCeti/Analysis/Meromorphic/Counting/Jensen.html#AnalyticOnNhd.zeroCount_le) number at most `log (M/‖f c‖)/log (R/r)`. A trailing-coefficient form handles a zero at the centre.
- **Zeros of a function of finite order** — an entire function of order at most `A` that is nonzero at 0 has [`O(R^B)` zeros of modulus at most `R`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/GrowthOrder/Zero/Count.html#TauCeti.OrderLE.isBigO_sum_divisor) for every `B > A`. The reciprocal `p`th powers of its zeros are [summable](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/GrowthOrder/Zero/Summability.html#TauCeti.OrderLE.summable_divisor_mul_norm_rpow) for every `p > A`.
- **The argument principle on a rectangle** — [the integral of `f'/f` around a rectangle](https://taucetiproject.org/docs/TauCeti/Analysis/Contour/Argument/Rectangle.html#TauCeti.Contour.argumentPrinciple_rectBoundary) is `2πi` times the sum of the orders of the zeros and poles inside it, provided none lies on the boundary.
- **Zeros of Dirichlet completions lie in the critical strip** — for a primitive nonprincipal character, [every zero of the entire completion](https://taucetiproject.org/docs/TauCeti/NumberTheory/LFunctions/Zeros/Completion/Dirichlet/Zeros.html#TauCeti.LFunctions.re_mem_Ioo_of_dirichletData_entireCompletion_eq_zero) has real part strictly between 0 and 1.

### Notable definitions and infrastructure

- [The entire completion](https://taucetiproject.org/docs/TauCeti/NumberTheory/LFunctions/Zeros/Completion/Basic.html#TauCeti.LFunctions.AnalyticLFunctionData.entireCompletion) of a meromorphically continued record is the object every count, factorization and finite-order statement is about. Its divisor is known exactly, including at cleared poles and under the reflection `s ↦ 1 − conj s`.
- [The zero count](https://taucetiproject.org/docs/TauCeti/Analysis/Meromorphic/Counting/Basic.html#TauCeti.zeroCount) is finite on bounded regions, additive across half-open rectangles and monotone in the region. It is the quantity that `N(T)`, Riemann–von Mangoldt and certified zeros will be stated in.
- [The entire reciprocal gamma factor](https://taucetiproject.org/docs/TauCeti/NumberTheory/LFunctions/GammaFactor/Basic.html#TauCeti.LFunctions.AnalyticLFunctionData.invGammaFactor) of a record vanishes exactly at the shifted gamma poles, with their multiplicities. The continued L-function will be built from it.

### Roadmap coverage

Layer 0 is done. Layer 1 has the log Γ branch (1.1), the exact gamma logarithmic derivatives (half of 1.4), the gamma divisor (half of 1.5) and the entire reciprocal of 1.6. It lacks Stirling (1.2–1.3), the digamma asymptotic, the gamma-factor growth estimate, the bound `OrderLE _ 1` for the reciprocal, and `continuedL`. Layer 2 is unchanged: the analytic conductor and its instances, without the family conductors. Layer 3 has only the Phragmén–Lindelöf input of 3.2, with constant rather than polynomial edge bounds. Layer 4 has 4.1–4.3. Layer 5 has 5.1, the elementary factor and the degree-one step of Hadamard's proof, but no canonical product. Layer 6 has the Dirichlet zero-location and logarithmic-derivative inputs of 6.4a, but no zero-free region. Layer 7 has the rectangle contour (7.1) and the pointwise form of 7.2. Layers 8 and 9 are untouched.

## The frontier

- **The canonical product and Hadamard at order one (5.3, 5.5).** The zero summability and the exponential-of-affine step are proved. What remains is the convergent product `∏ E₁(s/ρ)^{m_ρ}`, its divisor, and the quotient argument that connects them.
- **Stirling and the continued L-function (1.2–1.3, 1.6).** Stirling is still missing, and every gamma-factor growth estimate, the reciprocal's order bound, 3.3 and 4.4 depend on it. `continuedL`, with `ζ(0) = −1/2` as its test, needs only the reciprocal that now exists.
- **The divisor form of 7.2 and the argument variation (7.3).** This is the next step toward `S(T)`. Riemann–von Mangoldt itself also needs the gamma growth of 1.5.
- **The Dirichlet zero-free region (6.4a).** The zero location and the logarithmic-derivative split are in. Still missing are the order-one bound for the completion, the explicit gamma constant `C_Γ`, the real-part identity for `B(χ)` and the retained-zero inequalities.
- **Finite order for the families (3.1) and polynomial edge bounds (3.2).** Convexity, local zero counts and 5.6 all take these as input. Certified zeros (Layer 9) need only Layer 0 and 4.1, so they could start now.

# Roadmap: analytic number theory, part III — smoothing, contour shifts and the classical Dirichlet series

**Summary.** This part builds the general analytic tools that turn a zero-free region into an
error term for a prime sum, and the Dirichlet series of the classical arithmetic functions. It
starts from Mathlib's Fourier transform `𝓕`, `mellin`, `mellinInv`, `LSeries`, `riemannZeta` and
`ArithmeticFunction`, and from Tau Ceti's residue calculus, its one-dimensional bounded-variation
measures and its presented Hecke `L`-functions. In order it proves: Fourier decay for functions of
bounded variation, principal-value inversion on vertical lines with a quantitative window and
Brown's aliasing bound for the sampling series (Layer 7); the rectangle residue theorem in
Mathlib's edge form, with residues and with circle integrals about arbitrary isolated
singularities, the L-shaped contour shift to `Re s = −∞`, the derivative form of the
Borel–Carathéodory inequality and Landau's local logarithmic-derivative lemma (Layer 8); Mellin
convolution, Mellin transforms of compactly supported bumps, delta spikes for `dx/x` and the
smoothed cutoffs `1̃_ε` (Layer 9); the smoothed sum of a Dirichlet series as an inverse Mellin
integral, the transfer theorem from a zero-free region of width `η(t)` and a polylogarithmic bound
to the error `x exp(−c ω_η(x))`, and the classical bound `L′/L ≪ log(|t| + 3)` in a de la Vallée
Poussin region for the Hecke `L`-function of every ray class character of every number field
(Layer 10); complete multiplicativity, the divisor functions `σ_ν` and `d_z` with complex
parameter, Ramanujan's four-shift identity and the series of `2^ω`, `μ²`, `λ` and `φ` with their
exact abscissas (Layer 11); the Hardy–Landau Tauberian theorem for Cesàro means (Layer 12); and the
asymptotics of Erdős problem 392 with the waste-and-score framework of its upper bound, and the
Goldbach-range propositions with their transfers and derived ranges (Layer 13).

[`Suggested.lean`](Suggested.lean) states the headline theorems against the pinned libraries; it is
not the roadmap.

## Scope and ownership

### Place in the series

AnalyticNumberTheoryPartI owns Layers 0–3 (quantitative primes, the exclusion of Landau–Siegel
zeros, explicit formulas, Hecke and Artin comparisons, multiplicative means) and
AnalyticNumberTheoryPartII owns Layers 4–6 (special functions, multiple zeta functions, the
Bost–Connes system). This part owns Layers 7–13, numbered after them so that section numbers never
collide across the series. Part I uses contour shifts and smoothing kernels as local steps of
particular estimates (its §§0.11c and 1.2a are examples) and states four results for `ζ` and for
Dirichlet characters that are instances of statements here: the logarithmic-derivative bound right
of the de la Vallée Poussin curve (§0.33a), the local logarithmic-derivative expansions of §0.30a,
the ordered factorization count `d_n` (§§3.3–3.4) and the divisor-square Euler identity (§3.24a).
This part builds the tools once, as general statements with their own hypotheses, consumes those
results as Checks of 10.3, 8.3, 11.2 and 11.3, and does not restate them. It plans none of Part II's
objects.

### Owned here

- Layer 7: decay of `𝓕f` for integrable functions of bounded variation and for functions with a
  derivative of bounded variation; two uniform bounds on the truncated Dirichlet integral;
  pointwise principal-value inversion of the two-sided Laplace and the Mellin transform on a
  vertical line, and its windowed error; the aliasing error of the sampling series
  `Σ f(n/2W) sinc(π(2Wt − n))` for `f` the inverse Fourier transform of an integrable function,
  with its optimal constant.
- Layer 8: the residue theorem on a rectangle in Mathlib's edge form and the U-shaped contour
  identity that follows; the same edge expression as a sum of circle integrals about finitely many
  arbitrary isolated singularities; the shift of a segment `[1, 1 + iT]` onto an L-shaped contour
  running to `Re s = −∞`; Carathéodory's coefficient inequality and the derivative form of
  Borel–Carathéodory; Landau's local logarithmic-derivative lemma for an arbitrary holomorphic
  function on a disc. ZerosOfLFunctions §7.2 is the argument principle on its rectangle curve
  *rectBoundary*, an identity for `f′/f`; 8.1 differs in treating a general meromorphic `f` and
  in Mathlib's four-edge expression. Part I §0.30a proves the `ζ` and conductor-uniform Dirichlet
  instances of the nested-disc argument; 8.3 differs in being the lemma for every holomorphic
  function, with a constant depending only on the two radius ratios.
- Layer 9: Mellin convolution on `(0, ∞)`, Mellin transforms of compactly supported `C^k` bumps,
  the delta spikes `ν_ε` and their approximate-identity property, and the smoothed cutoffs `1̃_ε`.
  ExplicitPrimeCounting §2.1, extending the test class of the Weil explicit formula, bounds the
  Mellin transform of a continuous kernel supported in `[a, b] ⊂ (0, ∞)` whose derivative `tφ′(t)`
  is of bounded variation `V` by `max(1, b) V/|s|²` on `0 ≤ Re s ≤ 1`; 9.2 differs in treating
  `C^k` bumps on every vertical strip, with decay `(1 + |s|)^{−k}`.
- Layer 10: smoothed summatory functions of Dirichlet series as inverse Mellin integrals and their
  comparison with sharp sums; the transfer theorem in Ingham's zero-free-region form; the
  classical logarithmic-derivative bound for the presented Hecke `L`-function of every ray class
  character of a fixed field. Its `K = ℚ`, trivial-character instance is
  AnalyticNumberTheoryPartI §0.33a; 10.3 differs in covering every number field and every ray class
  character. ExplicitPrimeCounting §3.1 bounds `ψ(x) − x` by an explicit `εx` from a zero-free
  region, a verified height, a zero count and, in its forms (c) and (d), a zero density, through
  the explicit formula; 10.2 differs in being the qualitative transfer for an arbitrary Dirichlet
  series with a pole at `1` and a polylogarithmic bound in the region, with no zero count.
- Layer 11: the predicate of complete multiplicativity on `ArithmeticFunction R` and its
  equivalence with Mathlib's `ℕ →*₀ R`; `σ_ν` for `ν ∈ ℂ`; `d_z` for `z ∈ ℂ`; Ramanujan's
  four-shift identity and the series of `τ(n²)`; the series of `2^ω`, `μ²`, `λ` and `φ`, each with
  its exact abscissa of absolute convergence. The `α = β = 0` instance of Ramanujan's identity,
  `Σ τ(n)² n^{−s} = ζ(s)⁴/ζ(2s)`, is AnalyticNumberTheoryPartI §3.24a. 11.1 is the `ℕ`-indexed
  predicate for an arbitrary monoid with zero `R`, with no condition on the primes where `f`
  vanishes; ArithmeticDirichletSeries §0.2's `TauCeti.MultiplicativeIdealWeight` is the
  ideal-indexed carrier `Ideal (𝓞 K) →*₀ ℂ` of a number field that kills only finitely many
  primes, with unit-modulus subtype `TauCeti.UnitaryIdealWeight`; at `K = ℚ` its image under
  `TauCeti.normCoeff` is completely multiplicative in the sense of 11.1, while 11.1 also admits
  functions vanishing at infinitely many primes. The Dirichlet series of `d_k = ζ^k` for `k ∈ ℕ`,
  absolutely convergent on `Re s > 1` with sum `ζ(s)^k`, is ArithmeticDirichletSeriesPartII §5.1
  (`LSeriesHasSum_zeta_pow`); 11.2 differs in the complex exponent `z`, for which `ζ(s)^z` is the
  exponential of `z` times the Euler-product logarithm, and its `z = k` instance enters 11.2 as a
  Check. Complete additivity and the exponentials `n ↦ k^{f(n)}` of additive functions, with the
  multiplicativity of `2^ω`, are ProbabilisticAndMetricNumberTheory §0.1a; 11.1 is the
  multiplicative predicate (that section's `2^Ω` satisfies it, `2^ω` does not), and 11.4 takes the
  multiplicativity of `2^ω` from there.
- Layer 12: the Hardy–Landau Tauberian theorem for Cesàro means, one-sided for real sequences and
  two-sided in real normed spaces.
- Layer 13: the asymptotics of the least number of factors of `n!` bounded by `n²` (Erdős problem
  392) and by `n`, with the approximate factorizations, waste and score of the upper bound; the
  Goldbach-range propositions, their transfers, the published finite verifications as named
  propositions, and the ranges that the short-interval theorems of ExplicitPrimeCounting Layer 7
  give from them.

### Consumed, not redefined

- Mathlib: the value form of Borel–Carathéodory (`Complex.borelCaratheodory`); Mellin inversion
  for transforms integrable on the line (`mellinInv_mellin_eq`); `𝓜 1_(0,1] = 1/s`
  (`hasMellin_one_Ioc`); the smooth Fourier decay `(1 + u²)‖𝓕f(u)‖ ≤ ‖f‖₁ + ‖f″‖₁/(4π²)` for `C²`
  functions with integrable derivatives (`Real.one_add_sq_mul_norm_fourier_le`); the Euler products
  of `ζ` and of completely multiplicative `ℕ →*₀ F`; the Euler-product logarithm of `ζ`
  (`riemannZeta_eq_exp_LSeries`); the series `L(μ, s) = 1/ζ(s)`
  (`ArithmeticFunction.LSeries_zeta_mul_Lseries_moebius`); `ArithmeticFunction.sigma k` for
  `k : ℕ`, `ArithmeticFunction.liouville`, `ArithmeticFunction.cardDistinctFactors`,
  `ArithmeticFunction.moebius`; Cesàro convergence of convergent sequences
  (`Filter.Tendsto.cesaro`); Stirling (`Stirling.factorial_isEquivalent_stirling`); Chebyshev's
  bound and Legendre's formula.
- Tau Ceti: the Dirichlet integral `TauCeti.Contour.tendsto_integral_sin_div_atTop`; the residue
  and the residue theorem for null-homologous curves; the truncated Perron kernel and its
  arithmetic formula; integration by parts against the derivative measure of a function of bounded
  variation; the presented Hecke `L`-function `TauCeti.LFunctions.heckeLFunctionC` and the finiteness
  of ray class groups.
- The residue calculus itself: ContourIntegration (completed, realized in Tau Ceti).
- Zero-free regions, Jensen's bound, wide-strip growth and the rectangle curve: ZerosOfLFunctions
  §§3.4, 4.3, 6.2–6.5 and 7.1.
- Continued Dedekind zeta and Hecke `L`-functions, their Euler products and nonvanishing on
  `Re s = 1`: LFunctions Layers 3, 5 and 7.
- The Dirichlet series of `d_k = ζ^k`, `k ∈ ℕ`: ArithmeticDirichletSeriesPartII §5.1, a Check of
  11.2.
- Complete additivity and the multiplicativity of `2^ω`: ProbabilisticAndMetricNumberTheory §0.1a.
- Schoenfeld's, Ramaré–Saouter's and Kadiri–Lumley's short intervals containing a prime:
  ExplicitPrimeCounting §§7.1–7.3, instances of the hypothesis of 13.2 in the Examples of Layer 13.

### Not owned here

- Zero counting, the explicit formula and the prime ideal theorem with classical error:
  ZerosOfLFunctions Layers 4–8 (its §8.5 at `K = ℚ` is a Check of 10.2–10.3 here).
- Effective and conductor-uniform estimates, the zero-free strip for `ζ` with logarithmic bounds
  for `ζ − 1/(s − 1)` and `1/ζ` (§0.33), the bounds for `ζ′` and `ζ′/ζ` after pole subtraction on
  the half-plane right of the curve (§0.33a), the local expansions of `ζ′/ζ` and of `L′/L` for
  primitive Dirichlet characters (§0.30a), the Dirichlet divisor average (§3.22), the pointwise
  divisor bounds (§§3.1, 3.4) and the divisor-square Euler identity (§3.24a):
  AnalyticNumberTheoryPartI.
- Truncated Perron for `LSeries`, Abel–Stieltjes summation, Wiener–Ikehara and the transfer
  `ψ → θ → π`: ArithmeticDirichletSeries Layers 6, 9 and 10.
- Newman's Tauberian theorem: TauberianBoundaryConvergence N1–N2.
- Every decimal constant. In particular: the smoothed truncated Perron formulas with numerical
  error terms (ExplicitZetaBounds §6.1); the zero-free regions with explicit constants, the
  Vinogradov–Korobov regions among them (ExplicitZetaBounds Layer 7, §7.6); the explicit bounds for
  `ψ` from a region, a verified height, a zero count and, in some forms, a zero density, with
  Pintz's form (ExplicitPrimeCounting §3.1) and the Vinogradov–Korobov instance
  (ExplicitPrimeCounting §3.6); the prime-gap verifications and the short intervals containing a
  prime (ExplicitPrimeCounting §1.4 and Layer 7). Those roadmaps prove their statements by their
  own routes; 10.2 claims only an unspecified constant `c`, and 13.2 takes a short-interval prime
  statement as a hypothesis.
- The Parseval form of the Mellin convolution theorem, `𝓜[x ↦ ∫ f(t) h(xt) dt](z) = 𝓜f(1 − z) 𝓜h(z)`
  on a common strip of absolute convergence, with its inversion: AsymptoticExpansions §8.1. The
  product formula of 9.1 is the same theorem after the substitution `t = 1/y`; 9.1 states it for
  the operation `f ⋆ g` defined there, in its convolution variables at `x > 0`, which is the form
  9.4 uses for `1̃_ε = 1_(0,1] ⋆ ν_ε`.
- The shift of a full vertical line across a strip with finitely many poles under uniform decay:
  AsymptoticExpansions §8.2. 8.1 and 8.1a here differ in being finite-height rectangle statements
  with no decay hypothesis, and 8.1b in moving a segment of finite height to the left, with decay
  only as `Re s → −∞`.
- The sine integral `Si` as an entire function, with its continuation, asymptotics and Gibbs
  phenomenon: SpecialFunctionsEiLiErfIncompleteGamma Layer 9. 7.2 here states only two uniform
  bounds on the real truncated Dirichlet integral, without defining a function.
- The Fejér means of circle `L¹` functions and their `L¹` approximation: ToeplitzOperators T1.
- The Laplace carrier `HasLaplace` and Delange's theorem: ArithmeticDirichletSeriesPartII §0.1 and
  §3.2. Layer 7 works with Mathlib's Fourier carrier and needs neither.

## Conventions

- **Fourier transform.** `𝓕 f ξ = ∫ e^{−2πixξ} f(x) dx` (Mathlib). Witness: for `f = 1_[0,1]`,
  `𝓕 f (1/2) = (1 − e^{−πi})/(πi) = −2i/π`.
- **Mellin transform and its inverse.** `mellin f s = ∫_{(0,∞)} t^{s−1} f(t) dt` and
  `mellinInv σ F x = (2π)⁻¹ ∫_ℝ x^{−(σ+iy)} F(σ + iy) dy` (Mathlib); the inverse integral is
  `(2πi)⁻¹ ∫_{(σ)} F(s) x^{−s} ds`. Witness: `mellin 1_(0,1] 2 = 1/2`.
- **Two-sided Laplace transform.** `G(s) = ∫_ℝ g(u) e^{−su} du` on a line `Re s = c` where
  `u ↦ e^{−cu} g(u)` is integrable; under `u = −log t`, `mellin f = G` for `g(u) = f(e^{−u})`
  (Mathlib's `mellin_eq_fourier` records the same substitution). Witness: `f = 1_(0,1]` gives
  `g = 1_[0,∞)` and `G(2) = ∫_0^∞ e^{−2u} du = 1/2 = mellin 1_(0,1] 2`; the opposite substitution
  `u = log t` gives `g = 1_(−∞,0]`, whose integral `∫_{−∞}^0 e^{−2u} du` diverges.
- **Truncations.** The truncated inverse integral at height `T > 0` is
  `(2π)⁻¹ ∫_{−T}^{T} F(σ + iy) x^{−(σ+iy)} dy`; it equals a convolution with the Dirichlet kernel
  `D_T(v) = sin(Tv)/(πv)`, `D_T(0) = T/π`, whose integral over `ℝ` is `1` as an improper integral.
  Witness: for `F = 1/s` (the Mellin transform of `1_(0,1]`) and `x = 1` the truncated integral is
  `π⁻¹ arctan(T/σ)`, Tau Ceti's `TauCeti.truncatedPerronKernel_one`; it tends to `1/2`, the mean of
  `1_(0,1](1⁻) = 1` and `1_(0,1](1⁺) = 0`.
- **One-sided limits and variation.** `f(x₀⁻)`, `f(x₀⁺)` are Mathlib's `Function.leftLim` and
  `Function.rightLim`; the total variation of `f` on a set `S` is `(eVariationOn f S).toReal`.
  Witness: for `f = 1_(0,1]`, `Function.leftLim f 1 = 1`, `Function.rightLim f 1 = 0` and
  `(eVariationOn f univ).toReal = 2`.
- **Mellin convolution.** For `x > 0`, `(f ⋆ g)(x) = ∫_{(0,∞)} f(y) g(x/y) dy/y`. Identities about
  `⋆` are asserted only at `x > 0`. Witness: `(1_(0,1] ⋆ 1_(0,1])(x) = log(1/x)` on `(0, 1]` and
  `0` on `(1, ∞)`, so its value at `x = e^{−1}` is `1`.
- **Bumps, delta spikes and smoothed cutoffs.** A *bump* is `ν : ℝ → ℝ` with `ν ≥ 0`,
  `support ν ⊆ [1/2, 2]` and `∫_{(0,∞)} ν(x) dx/x = 1` (the standing bump hypotheses; the last one
  forces `x ↦ ν(x)/x` to be integrable, since a non-integrable integrand has Bochner integral `0`);
  the smoothness `ν ∈ C^k` is stated where used. For `ε > 0`, `ν_ε(x) = ε⁻¹ ν(x^{1/ε})` for `x > 0`
  and `ν_ε(x) = 0` for `x ≤ 0` (the explicit zero avoids Mathlib's junk values of `x^{1/ε}` at
  negative `x`); `1̃_ε(x) = ∫_{(x,∞)} ν_ε(z) dz/z` for `x > 0`, which is `(1_(0,1] ⋆ ν_ε)(x)`, and
  `1̃_ε(x) = 0` for `x ≤ 0`. Witness: `mellin ν_ε s = mellin ν (εs)`, so at `ε = 1` the spike is `ν`.
- **`LSeries` is total.** Mathlib's `LSeries a s` is `0` where the series does not converge
  absolutely and ignores `a 0`. Every identity below is stated on a half-plane of absolute
  convergence or with `LSeriesSummable`, and coefficients are compared only at `n ≥ 1`. Witness:
  for the constant sequence `1`, `LSeries 1 2 = ζ(2) = π²/6`, while `LSeries 1 1 = 0`, the junk
  value, because `Σ 1/n` diverges.
- **Complex powers of integers.** `n^ν = exp(ν log n)` for `n ≥ 1`; arithmetic functions built from
  `n^ν` take the value `0` at `n = 0`. Witness: `4^{1/2} = 2`, not `−2`, so
  `σ_{1/2}(4) = 1 + √2 + 2`.
- **Generalized divisor functions.** `σ_ν(n) = Σ_{d|n} d^ν`; `d_z` is multiplicative with
  `d_z(p^a)` the multiset coefficient `z(z+1)⋯(z+a−1)/a!` (Mathlib's `Ring.multichoose z a`).
  Witness: `d_{1/2}(p²) = 3/8` and `d_{−1} = μ`.
- **The Euler-product logarithm.** `log ζ(s)` means `LSeries (fun n ↦ Λ(n)/log n) s` for
  `Re s > 1`, the function whose exponential is `ζ(s)` by `riemannZeta_eq_exp_LSeries`; it is not
  the principal logarithm of the value `ζ(s)`. Witness: at `s = 2` it is
  `Σ_p Σ_{k≥1} p^{−2k}/k = log(π²/6) ≈ 0.49770`.
- **Cutoffs.** `Σ_{n≤x}` runs over `1 ≤ n ≤ ⌊x⌋` and includes `n = x`. The partial sums of a
  sequence `(a_i)` are `S_N = Σ_{i<N} a_i` and its Cesàro means `N⁻¹ Σ_{i<N} S_i` for `N ≥ 1`,
  Mathlib's convention in `Filter.Tendsto.cesaro`. Witness: `Σ_{n≤2} 1 = 2`; for `a_i = (−1)^i`,
  `S_0 = 0`, `S_1 = 1`, `S_2 = 0`, and the Cesàro mean at `N = 2` is `(S_0 + S_1)/2 = 1/2`.
- **Zero-free widths.** A width is `η : ℝ → ℝ`, used on `[3, ∞)`, with `0 < η(t) ≤ 1/2` there; its
  region is `R_η = {s : 1 − η(|Im s| + 3) ≤ Re s}` and its Ingham exponent is
  `ω_η(x) = inf_{t ≥ 3} (η(t) log x + log t)`. Witness: for `η = 1/log t` and `log x = 100`,
  `ω_η(x) = 20`, attained at `log t = 10`.
- **Ray class characters.** A ray class character of a modulus `𝔪` of a number field `K` is a
  homomorphism `RayClassGroup 𝔪 →* ℂˣ` (Tau Ceti's `TauCeti.GlobalNumberFields.RayClassCharacter`);
  it has finite order because the ray class group is finite
  (`TauCeti.GlobalNumberFields.finite_rayClassGroup`). Its `L`-function is the presented one,
  `TauCeti.LFunctions.heckeLFunctionC χ`, the canonical meromorphic continuation in normal form of
  the series over ideals prime to the finite part of `𝔪`. Witness: for `K = ℚ`, `𝔪 = 1` and
  `χ = 1` it agrees with `riemannZeta` on `ℂ ∖ {1}`, and `−L′/L` has residue `+1` at `s = 1`.
- **Constants.** Every constant is existential with its dependence stated; uniformity in a
  parameter means the constant is chosen before it. No decimal constant is asserted.

## Exact supplier contracts

### From Mathlib

- `𝓕` on `ℝ` (`Mathlib/Analysis/Fourier/FourierTransform.lean`), `Real.norm_fourier_le_integral_norm`,
  `Real.fourier_deriv` (for differentiable `f` with `f, f′` integrable) and
  `Real.one_add_sq_mul_norm_fourier_le` (`Mathlib/Analysis/Fourier/FourierTransformDeriv.lean`: for
  `ContDiff ℝ 2 f` with `iteratedDeriv k f` integrable for `k ≤ 2`); the Riemann–Lebesgue lemma
  `Real.zero_at_infty_fourier`; the inverse transform `𝓕⁻ g x = ∫ e^{2πixξ} g(ξ) dξ`; `Real.sinc`
  (`Mathlib/Analysis/SpecialFunctions/Trigonometric/Sinc.lean`: `sin x / x`, with value `1` at
  `0`).
- `BoundedVariationOn`, `eVariationOn`, `Function.leftLim`, `Function.rightLim`;
  `BoundedVariationOn.vectorMeasure` and `BoundedVariationOn.variation_vectorMeasure_univ_le`
  (`Mathlib/MeasureTheory/VectorMeasure/BoundedVariation.lean`), with the vector-measure integral
  `∫ᵛ`, `MeasureTheory.VectorMeasure.norm_integral_le_of_norm_le_const` (for a vector measure of
  finite variation) and `MeasureTheory.VectorMeasure.tendsto_integral_of_dominated_convergence`
  (`Mathlib/MeasureTheory/VectorMeasure/Integral.lean`).
- `mellin`, `mellinInv`, `MellinConvergent`, `HasMellin`, `Complex.VerticalIntegrable`,
  `hasMellin_one_Ioc`, `mellin_comp_rpow`, `mellin_comp_mul_left`, `MellinConvergent.comp_rpow`,
  `mellin_differentiableAt_of_isBigO_rpow` (`Mathlib/Analysis/MellinTransform.lean`);
  `mellin_eq_fourier`, `mellinInv_mellin_eq` (`Mathlib/Analysis/MellinInversion.lean`; the latter
  takes `0 < x`, `MellinConvergent f σ`, `VerticalIntegrable (mellin f) σ` and `ContinuousAt f x`).
- `Complex.integral_boundary_rect_eq_zero_of_differentiableOn`
  (`Mathlib/Analysis/Complex/CauchyIntegral.lean`), whose four-edge expression 8.1 uses verbatim,
  and `Complex.circleIntegral_eq_of_differentiable_on_annulus_off_countable` (same file);
  `Complex.reProdIm` (`×ℂ`); Cauchy's estimates; `circleIntegral`; `logDeriv`;
  `analyticOrderNatAt`; `MeasureTheory.intervalIntegral_tendsto_integral_Iic`.
- `Complex.borelCaratheodory` (`Mathlib/Analysis/Complex/BorelCaratheodory.lean`: for `f`
  differentiable on `‖z‖ < R` with `Re f ≤ M`, `0 < M`, the bound
  `‖f z‖ ≤ 2M‖z‖/(R − ‖z‖) + ‖f 0‖(R + ‖z‖)/(R − ‖z‖)`); `AnalyticOnNhd.sum_divisor_le` (Jensen,
  `Mathlib/Analysis/Complex/JensenFormula.lean`).
- `riemannZeta`, `LSeries`, `LSeriesSummable`, `LSeriesHasSum`, `LSeries.term`,
  `LSeries.abscissaOfAbsConv` (an `EReal`), `ArithmeticFunction.LSeries_zeta_eq_riemannZeta`,
  `ArithmeticFunction.LSeries_vonMangoldt_eq_deriv_riemannZeta_div`, `LSeries_convolution'`,
  `ArithmeticFunction.LSeries_mul`, `ArithmeticFunction.LSeries_zeta_mul_Lseries_moebius`,
  `riemannZeta_ne_zero_of_one_le_re`, `differentiableAt_riemannZeta`, `riemannZeta_eq_exp_LSeries`
  and `DirichletCharacter.eulerProduct_log_eq_LSeries`
  (`Mathlib/NumberTheory/EulerProduct/DirichletLSeries.lean`: for `Re s > 1`,
  `Σ_p −log(1 − χ(p) p^{−s}) = LSeries (n ↦ χ(n) Λ(n)/log n) s`; at the trivial character of
  level `1` this is the identity through which Mathlib proves `riemannZeta_eq_exp_LSeries`).
- `ArithmeticFunction.LSeriesSummable_zeta_iff` (`LSeriesSummable ζ s ↔ 1 < Re s`),
  `ArithmeticFunction.LSeriesSummable_mul` (`Mathlib/NumberTheory/LSeries/Convolution.lean`: the
  Dirichlet convolution of two absolutely convergent series converges absolutely),
  `LSeriesSummable.of_re_le_re`, `LSeriesSummable_of_le_const_mul_rpow` (absolute convergence on
  `Re s > x` when `|f(n)| ≤ C n^{x−1}`), `LSeries.abscissaOfAbsConv_le_of_forall_lt_LSeriesSummable`,
  `LSeries.abscissaOfAbsConv_le_of_le_const` and `LSeries.abscissaOfAbsConv_le_of_le_const_mul_rpow`
  (`Mathlib/NumberTheory/LSeries/Convergence.lean`); `Nat.Primes.not_summable_one_div`
  (`Mathlib/NumberTheory/SumPrimeReciprocals.lean`: `Σ_p 1/p` diverges).
- `ArithmeticFunction` with Dirichlet convolution, `ArithmeticFunction.IsMultiplicative`,
  `ArithmeticFunction.zeta`, `ArithmeticFunction.sigma` (`k : ℕ`), `ArithmeticFunction.pow`,
  `ArithmeticFunction.moebius`, `ArithmeticFunction.liouville` with
  `ArithmeticFunction.liouville_apply_mul`, `ArithmeticFunction.cardDistinctFactors`,
  `ArithmeticFunction.vonMangoldt`, `ArithmeticFunction.pmul`, `Nat.totient`,
  `Nat.factorization`; the completely multiplicative Euler product
  `EulerProduct.eulerProduct_completely_multiplicative_tprod` for `ℕ →*₀ F`, `F` a complete normed
  field, and `EulerProduct.eulerProduct_tprod` (`Mathlib/NumberTheory/EulerProduct/Basic.lean`: for
  `f` with values in a complete normed commutative ring, `f 1 = 1`, `f` multiplicative on coprime
  arguments, `f 0 = 0` and `Σ ‖f(n)‖ < ∞`, `∏'_p Σ'_e f(p^e) = Σ' f(n)`); `Summable.clog_one_sub`
  (`Mathlib/NumberTheory/EulerProduct/ExpLog.lean`), `HasSum.cexp`
  (`Mathlib/Analysis/SpecialFunctions/Exp.lean`: a sum `a` exponentiates to a product `exp a`) and
  `Complex.cpow_def_of_ne_zero`; `Ring.multichoose` and its `BinomialRing` instance for
  `ℚ≥0`-modules, which covers `ℂ`, the Chu–Vandermonde identity `Ring.add_choose_eq` and
  `Ring.choose_neg'` (`Ring.choose (−r) n = (−1)^n Ring.multichoose r n`)
  (`Mathlib/RingTheory/Binomial.lean`).
- `Filter.Tendsto.cesaro`, `Filter.Tendsto.cesaro_smul`
  (`Mathlib/Analysis/Asymptotics/SpecificAsymptotics.lean`).
- `Stirling.factorial_isEquivalent_stirling`, `Stirling.le_factorial_stirling`;
  `Chebyshev.theta_le_log4_mul_x`, `Chebyshev.psi` (`Mathlib/NumberTheory/Chebyshev.lean`);
  `Nat.factorization_factorial` (`Mathlib/Data/Nat/Choose/Factorization.lean`); `Nat.smoothNumbers`
  (`Mathlib/NumberTheory/SmoothNumbers.lean`: the `m ≠ 0` all of whose prime factors are `< k`);
  and Bertrand's postulate `Nat.exists_prime_lt_and_le_two_mul`.

### From Tau Ceti

- `BoundedVariationOn.integral_deriv_smul_eq_neg_integral_vectorMeasure`
  (`TauCeti/Analysis/BoundedVariation/OneDimensional.lean`): for `f` of bounded variation on `ℝ`
  with values in a real Banach space and a real compactly supported `C¹` test function `φ`,
  `∫ φ′ • f = −∫ᵛ φ ∂(Df)`, with no integrability of `f` assumed.
- `TauCeti.Contour.tendsto_integral_sin_div_atTop`
  (`TauCeti/Analysis/Contour/WorkedExamples/HalfDisc/SineIntegral.lean`):
  `∫_0^R sin x/x dx → π/2`.
- `TauCeti.Contour.residue` (`TauCeti/Analysis/Contour/Residue/Basic.lean`: the order-`(−1)`
  Laurent coefficient at a pole of a meromorphic function, `0` where `f` is analytic and junk `0`
  where `f` is not meromorphic) and `TauCeti.Contour.classicalResidueTheorem_nullHomologous`
  (`TauCeti/Analysis/Contour/Residue/Cycle.lean`): for `f` holomorphic on an open `U` off a finite
  `S`, meromorphic at the points of `S ∩ U`, and a closed piecewise-`C¹` null-homologous curve in
  `U` avoiding `S`, the contour integral is `2πi Σ_{s∈S} n(γ, s) Res_s f`.
- `TauCeti.truncatedPerronKernel` (the value `(2π)⁻¹ ∫_{−T}^{T} x^{c+it}/(c + it) dt`),
  `TauCeti.truncatedPerronKernel_one` (its value `π⁻¹ arctan(T/c)` at `x = 1`, `c ≠ 0`) and
  `TauCeti.truncatedPerron_LSeries` (`TauCeti/NumberTheory/ArithmeticDirichletSeries/Perron/`).
- `TauCeti.LFunctions.heckeLFunctionC` (`TauCeti/NumberTheory/LFunctions/Hecke/Basic.lean`), the
  presented continued `L`-function of `χ : TauCeti.GlobalNumberFields.RayClassCharacter 𝔪`,
  `TauCeti.LFunctions.heckeLFunctionC_eq_primitive` (on `Re s > 1`) and
  `TauCeti.LFunctions.heckeLFunctionC_eventuallyEq_primitive` (as punctured germs at every point);
  `TauCeti.GlobalNumberFields.finite_rayClassGroup`
  (`TauCeti/NumberTheory/NumberField/Global/RayClass/Finite.lean`).
- `TauCeti.hasSum_multichoose_mul_geometric_complex_of_norm_lt_one`
  (`TauCeti/Analysis/Analytic/Binomial.lean`): for complex `r` and `‖x‖ < 1`, the series
  `Σ_n Ring.multichoose r n · xⁿ` has sum `1/(1 − x)^r`, with the principal power.

### From TauCetiRoadmap.ContourIntegration

Layers 2–4 (completed and realized in Tau Ceti): residues, winding numbers and the residue theorem
for null-homologous piecewise-`C¹` curves, with the exact hypotheses listed under From Tau Ceti.

### From TauCetiRoadmap.ArithmeticDirichletSeries

§6.3 (truncated Perron kernel, its endpoint value `π⁻¹ arctan(T/c)` at `x = 1`) and §6.4 (the
arithmetic Perron formula), completed and realized as the Tau Ceti declarations above. They are
the `f = 1_(0,1]` instance of 7.3 and are used only as Checks. §0.2 (the completely multiplicative
ideal weights) is named in Scope and in a Check of 11.1.

### From TauCetiRoadmap.LFunctions

Layer 3 (the continued Dedekind zeta function and its simple pole at `1`), Layer 5 (finite-order
Hecke `L`-functions, their continuation, their Euler products on `Re s > 1`, and the comparison of a
presented character with its primitive one) and Layer 7 (nonvanishing on `Re s = 1`). 10.3 uses the
Euler product to bound `|L(2 + it)|` below by a positive constant depending only on `[K:ℚ]`.

### From TauCetiRoadmap.ZerosOfLFunctions

- §3.4, the "wide strips above the poles" corollary: for a fixed record and closed strip,
  `|L(σ + it)| ≤ C analyticConductorAt d (σ + it)^B` for `σ` in the strip and `|t| ≥ T₀` above the
  poles; at a fixed `K` and `χ` this is `≤ C′(|t| + 3)^{B′}`.
- §4.3 (Jensen's bound): for `f` analytic on `closedBall c R`, `f c ≠ 0`, `‖f‖ ≤ M` on the sphere
  with `M ≥ 1`, the number of zeros in `closedBall c r` is at most `log(M/‖f c‖)/log(R/r)`.
- §§6.2–6.4: for a primitive finite-order ray-class character `χ` of `K`, with
  `c = heckeZeroFreeConstant [K:ℚ]`, no zero `ρ` of `L(χ, ·)` with
  `Re ρ ≥ 1 − c/log analyticConductorAt d (i Im ρ)` except at most one real simple zero when
  `χ² = 1` (the predicate `IsExceptionalZero`); at a fixed `K` and `χ` the analytic conductor at
  height `γ` is at most `C_{K,χ} (|γ| + 3)^{[K:ℚ]}`.
- §6.5: no zero on `Re s = 1`.
- §7.1: the counterclockwise boundary curve *rectBoundary* of a rectangle, closed, piecewise `C¹`,
  null-homologous in every open set containing the rectangle, with winding number `1` about every
  point of the open rectangle.
- §8.5 at `K = ℚ`: `ψ(x) = x + O(x exp(−c √log x))`, used as a Check of 10.2–10.3.

### From TauCetiRoadmap.AnalyticNumberTheoryPartI

- §0.33a (`riemannZeta_deriv_logDeriv_bound`): there are `0 < β < 1` and `C > 0` such that every
  `s ≠ 1` with `Re s ≥ 1 − β/log(|Im s| + 2)` has `ζ(s) ≠ 0` and
  `|ζ′/ζ(s) + 1/(s − 1)| ≤ C log(|Im s| + 2)`, the left side extending analytically across `1`.
  This is the `K = ℚ`, `χ = 1` instance of 10.3, consumed and not restated; it enters 10.3 as a
  Check.
- §0.30a (`riemannZeta_local_logDeriv`): for `σ₀ > 1` and radii `0 < r < r′` there is `C` with
  `|ζ′/ζ(s) + 1/(s − 1) − Σ_{|ρ−s₀|≤r′} m(ρ)/(s − ρ)| ≤ C log(|Im s₀| + 2)` for `Re s₀ = σ₀`,
  `|s − s₀| ≤ r`, `ζ(s) ≠ 0`. It is 8.3 applied to `(s − 1)ζ(s)` and enters 8.3 as a Check.
- §§3.3–3.4 (the ordered factorization count `d_n` and its subpolynomial bound): `d_n` is the
  value at `z = n` of 11.2's `d_z`, a Check.
- §3.24a (`riemannZeta_pow_four_eq_mul_LSeries_divisor_sq`): for `Re s > 1` the series
  `Σ τ(n)² n^{−s}` converges absolutely and `ζ(s)⁴ = ζ(2s) Σ τ(n)² n^{−s}`. This is the
  `α = β = 0` instance of 11.3, consumed and not restated; it enters 11.3 as a Check.

### From TauCetiRoadmap.ProbabilisticAndMetricNumberTheory

§0.1a (complete additivity and exponentials of additive functions): `powOfAdditive` (for a monoid
with zero `R`, `k ∈ R` and `f : ArithmeticFunction ℕ`, the function with value `k^{f(n)}` at
`n > 0` and `0` at `0`), `isMultiplicative_powOfAdditive_cardDistinctFactors` (`n ↦ k^{ω(n)}` is
multiplicative for every `k`) and `IsCompletelyAdditive.powOfAdditive_mul` (`k^{f}` is
multiplicative on all pairs, coprime or not, when `f` is completely additive, so `k^Ω` is
completely multiplicative). 11.4 uses the multiplicativity of `2^ω` for its Euler product; `2^Ω`
and `2^ω` enter 11.1 as Checks.

### From TauCetiRoadmap.ArithmeticDirichletSeriesPartII

§5.1 (`LSeriesHasSum_zeta_pow`): for every `k ∈ ℕ` and every `s` with `Re s > 1`, the series of
`d_k = ζ^k` (the `k`-th Dirichlet power of `ArithmeticFunction.zeta`) converges absolutely and has
sum `ζ(s)^k`. It is the `z = k` instance of the series of 11.2, consumed and not restated; it
enters 11.2 as a Check. §0.1 (`HasLaplace`) and §3.2 (Delange's theorem) are named in Scope only.

### From TauCetiRoadmap.ExplicitPrimeCounting

§7.1 (Schoenfeld's interval): under that section's named hypotheses, for every `x > 2 010 759.9`
the open interval `(x, x + x/16597)` contains a prime. §7.2 (Ramaré–Saouter's intervals): under
that section's named hypotheses, `(x(1 − 1/28 314 000), x]` contains a prime for every
`x > 10 726 905 041`. §7.3 (Kadiri–Lumley's rows): under that section's named hypotheses, for
every `x > e⁵⁹` the interval `((1 − 1/1 946 282 821)x, x)` contains a prime, and for every
`x > e⁶⁰` the interval `((1 − 1/1 966 196 911)x, x)`. They enter the Examples of Layer 13 as
instances of the short-interval hypothesis of 13.2; no theorem here depends on them. §§1.4, 2.1,
3.1, 3.6 and the rest of Layer 7 are named in Scope only.

Every prerequisite above is a declaration of the pinned Mathlib or Tau Ceti or a section of one of
the roadmaps named in this section.

## How to read the build

Layers 7, 8 and 11–13 are independent of one another and rest only on the libraries and the
suppliers above. Layer 9 is independent of Layer 7: its decay comes from integration by parts on
compact supports. Layer 10 assembles 8.1–8.3, 9.1–9.4 and the zero-free regions of
ZerosOfLFunctions: 10.1 writes a smoothed sum as an inverse Mellin integral, 10.2 shifts it across a
rectangle inside the region, and 10.3 supplies the region and the bound in the case of number-field
`L`-functions. Layer 11 is pure arithmetic of `LSeries` on half-planes of absolute convergence.
Layer 12 uses only finite sums and limits. A proof sketch names one route and its inputs; a
target's *Needs* line lists what its statement and that route use, so another route is not
blocked. `Suggested.lean` states the definitions `deltaSpike`, `smoothCutoff`, `inghamExponent`,
`sigmaC`, `generalizedDivisor`, `factorialFactorCount`, `EvenGoldbachUpTo` and `OddGoldbachUpTo`,
which the headline statements need, and the headline theorems of 7.1, 7.3, 7.4, 8.1, 8.1a, 8.1b,
8.2, 8.3, 9.4, 10.1, 10.2, 10.3, 11.2, 11.3, 11.4, 12.1, 13.1 and 13.2; 8.1 is stated with
`TauCeti.Contour.residue` and 10.3 with `TauCeti.LFunctions.heckeLFunctionC`, and the file imports
the two Tau Ceti modules that declare them. The definitions *mellinConv* (9.1),
*IsCompletelyMultiplicative* (11.1) and the approximate factorizations of 13.1 with their *waste*,
*balance* and *score*, and the remaining targets, are README targets, named here in italics.

## Layer 7: Fourier and Laplace tools

### 7.1 Fourier decay for bounded variation

*An integrable function of bounded variation.* Prove that if `f : ℝ → E`, `E` a complete normed
complex space, is integrable and of bounded variation on `ℝ`, then `f(x) → 0` as `x → ±∞` and
`‖f(x)‖ ≤ V` for every `x`, where `V = (eVariationOn f univ).toReal`. Bounded variation gives the
two limits; integrability forces them to be `0` (`kontorovichtao-pntplus` line 189, the boundary
step of Lemma 3.1.4).

*Decay.* For such `f` and every real `ξ ≠ 0`, `‖𝓕f(ξ)‖ ≤ V/(2π|ξ|)`; this is
`norm_fourier_le_eVariationOn_div` (`kontorovichtao-pntplus` line 189, Lemma 3.1.4;
katznelson2004, Chapter I, for the analogue for Fourier coefficients on the circle). Route: apply
the Tau Ceti integration by parts to the real and imaginary parts of
`φ_R(x) = χ(x/R) e^{−2πixξ}` with a fixed bump `χ`, equal to `1` near `0`; the terms with
`χ′(x/R)/R` vanish as `R → ∞` because `f` is integrable, dominated convergence for `∫ᵛ` passes
to the limit, and `2πiξ 𝓕f(ξ) = ∫ᵛ e^{−2πixξ} ∂(Df)`; the vector-measure norm bound and
`BoundedVariationOn.variation_vectorMeasure_univ_le` give `V`.

*A derivative of bounded variation.* Let `g : ℝ → E` be integrable and of bounded variation, of
total variation `V₁`, and `f(x) = f(0) + ∫_0^x g` with `f` integrable. Prove
`𝓕g(ξ) = 2πiξ 𝓕f(ξ)` for every `ξ`; hence `‖𝓕f(ξ)‖ ≤ V₁/(2π|ξ|)²` for `ξ ≠ 0` and
`(1 + ξ²)‖𝓕f(ξ)‖ ≤ ‖f‖₁ + V₁/(4π²)` for every `ξ` (`kontorovichtao-pntplus` lines 198–209, Lemmas
3.1.5–3.1.6). The first identity is the absolutely continuous form of
`Real.fourier_deriv`: on `[−R, R]` integrate by parts with the primitive, and `f(±R) → 0`.

*The `C²` form.* If `f : ℝ → ℂ` is `C²` and `|f(t)|, |f″(t)| ≤ A/(1 + t²)` for all `t`, then `f′` is
integrable and `(1 + ξ²)‖𝓕f(ξ)‖ ≤ (π + 1/(4π)) A` for every `ξ` (`kontorovichtao-pntplus` lines
210–220, Lemma 3.1.7). Route: `f′(t) = −∫_t^∞ f″` and the same on the left give `|f′(t)| ≤ πA`
and `f′(t) → 0`; on `[t, t + 1]`, `|f′(t)| ≤ 2 sup|f| + sup|f″|` gives `f′ = O(1/t²)`; then
`Real.one_add_sq_mul_norm_fourier_le` with `‖f‖₁, ‖f″‖₁ ≤ πA`.

**Checks.**

- `f = 1_[0,1]`: `V = 2` and `|𝓕f(ξ)| = |sin πξ|/(π|ξ|)`; at `ξ = 1/2` both sides of the decay
  bound equal `2/π`, so the constant `1/(2π)` is sharp, and a bound `V/(4π|ξ|)` would be false
  there.
- The hypothesis `ξ ≠ 0` is needed: at `ξ = 0` the right side is the junk value `V/0 = 0`, while
  `𝓕(1_[0,1])(0) = 1`.
- `f = 1_[0,∞)` is of bounded variation, with `V = 1`, but not integrable, and tends to `1` at
  `+∞`: integrability is needed for the limits `0`.
- The tent `f(x) = max(0, 1 − |x|)` has `g = f′` of variation `V₁ = 4` and
  `𝓕f(ξ) = (sin πξ/(πξ))²`; at `ξ = 1/2` both sides of `‖𝓕f‖ ≤ V₁/(2πξ)²` equal `4/π²`, and the
  `(1 + ξ²)` form at `ξ = 0` reads `1 ≤ 1 + 1/π²`.
- `f(t) = 1/(1 + t²)` satisfies the `C²` hypotheses with `A = 2`
  (`|f″(t)| = |6t² − 2|/(1 + t²)³ ≤ 2/(1 + t²)`); `𝓕f(ξ) = π e^{−2π|ξ|}`, so the left side at
  `ξ = 0` is `π ≤ 2(π + 1/(4π))`.

*Needs:* Mathlib `BoundedVariationOn.vectorMeasure`,
`BoundedVariationOn.variation_vectorMeasure_univ_le`,
`MeasureTheory.VectorMeasure.norm_integral_le_of_norm_le_const`,
`MeasureTheory.VectorMeasure.tendsto_integral_of_dominated_convergence`,
`Real.one_add_sq_mul_norm_fourier_le`, `Real.norm_fourier_le_integral_norm`, `Real.fourier_deriv`;
Tau Ceti `BoundedVariationOn.integral_deriv_smul_eq_neg_integral_vectorMeasure`.

### 7.2 Bounds for the truncated Dirichlet integral

For real `x`, write `I(x) = ∫_0^x sin t/t dt`. Prove: `I` is odd and continuous; `|I(x)| ≤ I(π)`
for every real `x`; `|π/2 − I(x)| ≤ 2/x` for `x > 0`; and consequently
`|∫_a^b sin(Tv)/v dv| ≤ 2 I(π)` for all real `a ≤ b` and `T > 0`. The limit `I(x) → π/2` is Tau
Ceti's. Route: on `[kπ, (k+1)π]` the integrand has constant sign and its areas decrease, so the
local maxima `I((2k+1)π)` decrease and the minima `I(2kπ)` are positive (dlmf-ch6, §6.16, the first
maximum of `Si` at `π`); one integration by parts gives
`∫_x^R sin t/t dt = cos x/x − cos R/R − ∫_x^R cos t/t² dt`, of modulus at most `2/x` for every
`x > 0` (dlmf-ch6, 6.2.19 with 6.12.5–6.12.8 at `n = 0`: `0 < f(x) ≤ 1/x`, `0 < g(x) ≤ 1/x²`).

**Checks.**

- `I(π) ≈ 1.85194 > π/2 ≈ 1.5708`, so the plausible bound `|I(x)| ≤ π/2` is false at `x = π`.
- At `x = π`, `|π/2 − I(π)| ≈ 0.2811 ≤ 2/π ≈ 0.6366`; at `x = 2π`, `I(2π) ≈ 1.41815` and
  `|π/2 − I(2π)| ≈ 0.1526 ≤ 1/π`.
- The tail bound needs `x > 0`: at `x = −1`, `π/2 − I(−1) ≈ 2.517` exceeds `2/(−1) = −2`.

*Needs:* Tau Ceti `TauCeti.Contour.tendsto_integral_sin_div_atTop`; Mathlib interval integration.

### 7.3 Principal-value inversion on vertical lines

*Pointwise inversion, two-sided Laplace form.* Let `g : ℝ → ℂ`, `c ∈ ℝ`, with `h(u) = e^{−cu} g(u)`
integrable, and `G(c + iy) = ∫ g(u) e^{−(c+iy)u} du`. If `g` is of bounded variation on some
interval `[u₀ − δ, u₀ + δ]`, `δ > 0`, then
`(2π)⁻¹ ∫_{−T}^{T} G(c + iy) e^{(c+iy)u₀} dy → (g(u₀⁻) + g(u₀⁺))/2` as `T → ∞`
(montgomeryvaughan2007, Chapter 5, §5.1; titchmarsh1986, Chapter III, the truncated Perron lemma).
Route: the truncated integral equals `e^{cu₀} ∫ h(u₀ − v) D_T(v) dv`; split
at `|v| = δ`; the tail tends to `0` by the Riemann–Lebesgue lemma applied to
`v ↦ h(u₀ − v) 1_{|v|>δ}/v`; on the window write `h(u₀ ± v) = h(u₀^±) + (h(u₀ ± v) − h(u₀^±))` and
use 7.2.

*Pointwise inversion, Mellin form.* Let `f : ℝ → ℂ`, `σ ∈ ℝ`, `MellinConvergent f σ`, and `f` of
bounded variation on `[x₀ − δ, x₀ + δ]` with `0 < δ < x₀`. Then
`(2π)⁻¹ ∫_{−T}^{T} x₀^{−(σ+iy)} mellin f (σ + iy) dy → (f(x₀⁻) + f(x₀⁺))/2`; this is
`tendsto_truncated_mellinInv`. It is the Laplace form for `g(u) = f(e^{−u})`, `u₀ = −log x₀`, with
`c = σ`; bounded variation transfers along the monotone map `u ↦ e^{−u}`, and left and right
exchange under `u = −log t`, which leaves the mean unchanged.

*Windowed error.* There is an absolute constant `C` such that for every integrable `h : ℝ → ℂ` of
bounded variation on `ℝ`, of total variation `V`, and all `u₀ ∈ ℝ`, `δ > 0` and `T > 0`:
`|∫ h(u₀ − v) D_T(v) dv − (h(u₀⁻) + h(u₀⁺))/2| ≤ C (V⁺_δ + V⁻_δ + V/(Tδ))`, where
`V⁺_δ = (eVariationOn h (Ioc u₀ (u₀ + δ))).toReal` and
`V⁻_δ = (eVariationOn h (Ico (u₀ − δ) u₀)).toReal`; this is
`norm_dirichletKernel_integral_sub_mean_le` (the bound with an explicit window is stated here;
its inputs are the Dirichlet-integral bounds of 7.2, dlmf-ch6 §6.16 and 6.2.19 with 6.12.5–6.12.8
at `n = 0`, and the bound `sup|h| ≤ V` of 7.1 for integrable functions of bounded variation). The
integral is a Lebesgue integral, since
`|D_T| ≤ T/π`. Route: with the one-sided limits in place of `h`, the window contributes
`π⁻¹ I(Tδ)(h(u₀⁻) + h(u₀⁺))`, whose distance from the mean is at most
`2(|h(u₀⁻)| + |h(u₀⁺)|)/(πTδ)` by 7.2, plus Stieltjes integrals of `h(u₀ ± v) − h(u₀^±)` against
`v ↦ π⁻¹ I(Tv)`, bounded by `2 I(π) V^±_δ/π` after integration by parts against this continuous
function; on the tail, integrate `sin(Tv)` by parts against `h(u₀ − v)/(πv)`, whose variation on
`|v| ≥ δ` is at most `(sup|h| + V)/(πδ)`, giving at most `(2 sup|h| + V)/(πTδ)` on each side, and
`sup|h| ≤ V` by 7.1. Global bounded variation is required for the rate: integrability of `h` alone
gives no rate in `T` (see the Checks).

*The Perron instance.* For `f = 1_(0,1]` and `σ > 0`, `mellin f = 1/s`, the truncated integral at
`x₀ = 1/x` is `TauCeti.truncatedPerronKernel x σ T`; at `x = 1` it is `π⁻¹ arctan(T/σ) → 1/2`.

**Checks.**

- At the jump of `1_(0,1]` the limit is `1/2`, matching `TauCeti.truncatedPerronKernel_one`
  (`arctan(10)/π ≈ 0.46827` at `σ = 1`, `T = 10`); a statement with limit `f(x₀)` would give `1`
  and fail.
- The tail rate fails for merely integrable `h`: for `h(u₀ − v) = sin(T₀v) 1_[δ,2δ](v)`, at
  `T = T₀` the tail integral is `(2π)⁻¹ ∫_δ^{2δ} (1 − cos 2T₀v)/v dv → (log 2)/(2π) ≈ 0.110` as
  `T₀ → ∞`, while `‖h‖₁/(T₀δ) ≤ 1/T₀ → 0`.
- For `h(u) = e^{−σu} 1_{u≥0}` (the Laplace form of `1_(0,1]` at the line `σ > 0`), `V = 2`,
  `V⁺_δ = 1 − e^{−σδ}`, `V⁻_δ = 0` at `u₀ = 0`; the true error `π⁻¹ arctan(σ/T)` is at most the
  bound `C(σδ + 2/(Tδ))` for every `δ`, consistent with optimizing at `δ = (σT)^{−1/2}`: at
  `(σ, T) = (1, 10), (10, 1), (1000, 1)` the errors are `0.0317, 0.468, 0.4997` against
  `min_δ(σδ + 2/(Tδ)) = 0.894, 8.94, 89.4`.
- Mellin convergence on the line is needed: for `f = 1_(0,1]` and `σ = 0`, `∫_0^1 t^{−1} dt`
  diverges, so `mellin f (iy)` is the junk value `0` for every `y` and the truncated integral is `0`
  for every `T`, while the mean of the one-sided limits at `x₀ = 1` is `1/2`.

*Needs:* 7.1, 7.2; Mathlib `mellin_eq_fourier`, `MellinConvergent`, `Function.leftLim`,
`Function.rightLim`, `Real.zero_at_infty_fourier`; Tau Ceti `TauCeti.truncatedPerronKernel_one`
(for the instance).

### 7.4 The aliasing error of the sampling series

Let `G : ℝ → ℂ` be integrable, `f = 𝓕⁻G`, that is `f(t) = ∫ G(ξ) e^{2πiξt} dξ`, and `W > 0`. For
`N ∈ ℕ` and real `t` put `S_N(t) = Σ_{|n|≤N} f(n/2W) sinc(π(2Wt − n))`, with Mathlib's
`Real.sinc x = sin x/x`. Prove: for every real `t` the limit `S(t) = lim_{N→∞} S_N(t)` exists and
`|f(t) − S(t)| ≤ 2 ∫_{|ξ|>W} |G(ξ)| dξ`; this is `exists_tendsto_samplingSum_norm_sub_le`. The
constant `2` cannot be lowered: for `G(ξ) = e^{−πiξ/(2W)}` on `(W, 3W)` and `0` elsewhere, at
`t = 1/(4W)`, `S_N(t) → −2W` while `f(t) = 2W` and `∫_{|ξ|>W} |G| = 2W`, so the error `4W` equals
the bound (brown1967, Theorem 1, in angular frequency `ω = 2πξ`, with
`f(t) = (2π)⁻¹ ∫ F(ω) e^{iωt} dω` and the bound `π⁻¹ ∫_{|ω|>2πW} |F(ω)| dω`, shown there to be
optimal; ieantn-brown1967 lines 37–40 on the hypotheses and the optimality of Theorem 1, and lines
52–56 on its symmetric partial sums). Only integrability of `G` is assumed: no bounded variation,
no realness of `f`. The limit is taken over
the symmetric partial sums and is not a `tsum`, since the series need not converge absolutely (see
the Checks). If `G` vanishes off `[−W, W]` the bound is `0`, which is the sampling theorem for
`f`.

Route (Brown's): fix `t` and let `g_t` be the `2W`-periodic function equal to `e^{2πiξt}` on
`(−W, W)` and to `cos 2πWt` at `ξ ≡ W (mod 2W)`. Its Fourier coefficients are
`(2W)⁻¹ ∫_{−W}^{W} e^{2πiξ(t − n/2W)} dξ = sinc(π(2Wt − n))`, so exchanging the finite sum with
the integral gives `S_N(t) = ∫ G(ξ) σ_N(ξ) dξ`, where
`σ_N(ξ) = Σ_{|n|≤N} sinc(π(2Wt − n)) e^{πiξn/W}` is the symmetric partial Fourier sum of `g_t`.
It is the convolution of `g_t` with the periodic Dirichlet kernel `sin((N + ½)x)/sin(x/2)`;
replacing `1/sin(x/2)` by `2/x` changes the kernel by a bounded function, and the argument of 7.3
with the uniform bound of 7.2 shows that `σ_N → g_t` pointwise (to the mean `cos 2πWt` at the
jumps) with `sup_{N,ξ} |σ_N(ξ)| < ∞`, `g_t` being smooth on `(−W, W)` with one jump per period.
Dominated convergence gives `S(t) = ∫ G g_t`. Since `g_t = e^{2πiξt}` on `|ξ| < W` and
`|e^{2πiξt} − g_t(ξ)| ≤ 2`, `|f(t) − S(t)| ≤ 2 ∫_{|ξ|>W} |G|`. In the sharp instance
`g_t(ξ) = e^{2πi(ξ − 2W)t} = −e^{2πiξt}` on `(W, 3W)` at `t = 1/(4W)`, so the inequality is an
equality.

**Checks.**

- Integer sampling, `W = 1/2`, with the extremal `G(ξ) = e^{−πiξ}` on `(1/2, 3/2)` and `t = 1/2`:
  `f(n) = 2(−1)^n/(π(2n − 1))` and `sinc(π(1/2 − n)) = 2(−1)^n/(π(1 − 2n))`, so each term is
  `−4/(π²(2n − 1)²)`, and `Σ_{n∈ℤ} (2n − 1)^{−2} = π²/4` gives `S(1/2) = −1` against
  `f(1/2) = 1`. The error `2` equals `2 ∫_{|ξ|>1/2} |G|`, so a bound with constant `1` (in Brown's
  angular frequency, `1/(2π)` in place of his `1/π`) is false.
- At a sample point `t = m/(2W)`, `sinc(π(m − n))` vanishes for `n ≠ m`, so `S_N(t) = f(t)` once
  `N ≥ |m|` and the error is `0`.
- The symmetric limit is needed. Take `W = 1/2` and `G = h` on `[−1/2, 1/2]`, `0` elsewhere, where
  `h(ξ) = Σ_{n∈ℤ} e^{2πinξ}/log(|n| + 2)` is nonnegative and integrable on a period (katznelson2004,
  Chapter I, the theorem on convex coefficient sequences). Then `f(n) = 1/log(|n| + 2)` and the
  bound is `0`, but at `t = 1/2` the terms have modulus `2/(π|2n − 1| log(|n| + 2))`, whose sum
  diverges: the family is not summable, Mathlib's `tsum` is the junk `0`, while
  `S(1/2) = f(1/2) = ∫ h(ξ) cos πξ dξ > 0`.
- Realness is not assumed: at `W = 1/2` the extremal `G` gives `f(1/4) = −2√2 i/π`, so the case
  of equality above lies outside a statement for real-valued `f`.

*Needs:* 7.2 and the argument of 7.3; Mathlib `𝓕⁻`, `Real.sinc`,
`MeasureTheory.tendsto_integral_of_dominated_convergence`, `Real.zero_at_infty_fourier`.

### Examples

- `𝓕(1_[0,1])` attains the bound of 7.1 at `ξ = 1/2`.
- The Mellin inverse of `1/s` truncated at height `T` at `x = 1` is `π⁻¹ arctan(T/σ)`, which tends
  to `1/2`.

### Dependencies

Mathlib Fourier analysis, bounded variation and vector-measure integrals, Mellin transform,
`Real.sinc`; Tau Ceti one-dimensional bounded variation and the Dirichlet integral;
ArithmeticDirichletSeries §6.3 for the Perron Check.

## Layer 8: contours and discs

### 8.1 Rectangles with poles and the U-shaped contour

Let `σ₁ < σ₂`, `t₁ < t₂`, `R = [σ₁, σ₂] ×ℂ [t₁, t₂]`, `U` open with `R ⊆ U`, `P` a finite subset of
the open rectangle `(σ₁, σ₂) ×ℂ (t₁, t₂)`, and `f` complex differentiable on `U ∖ P` and
meromorphic at each point of `P`. Then Mathlib's boundary expression of
`Complex.integral_boundary_rect_eq_zero_of_differentiableOn` at the corners `σ₁ + it₁`,
`σ₂ + it₂`,
`∫_{σ₁}^{σ₂} f(x + it₁) dx − ∫_{σ₁}^{σ₂} f(x + it₂) dx + i ∫_{t₁}^{t₂} f(σ₂ + iy) dy − i ∫_{t₁}^{t₂} f(σ₁ + iy) dy`,
equals `2πi Σ_{p∈P} Res_p f`, with `TauCeti.Contour.residue`; this is
`rectangle_boundary_integral_eq_residues` (kontorovichtao-pntplus lines 621–642, Theorem 4.1.2 and
Lemmas 4.1.2–4.1.4, for simple poles). Route: the counterclockwise
boundary curve of ZerosOfLFunctions §7.1 is piecewise `C¹`, closed, null-homologous in `U`, with
winding number `1` about each point of the open rectangle; apply
`TauCeti.Contour.classicalResidueTheorem_nullHomologous` and split the curve integral into the four
edges.

*The U-shaped form.* If moreover `y ↦ f(σ₂ + iy)` is integrable on `ℝ` and `t₁ = −T`, `t₂ = T`,
then `∫_ℝ f(σ₂ + iy) dy` equals the sum of the two tails `∫_{|y|>T} f(σ₂ + iy) dy`, the left edge
`∫_{−T}^{T} f(σ₁ + iy) dy`, the horizontal term
`(∫_{σ₁}^{σ₂} f(x + iT) dx − ∫_{σ₁}^{σ₂} f(x − iT) dx)/i` (top edge minus bottom edge, divided by
`i`), and `2π Σ_{p∈P} Res_p f` (kontorovichtao-pntplus lines 596–613, Definitions 4.1.3–4.1.5 and
Lemma 4.1.1). This is the edge expression above divided by `i` and solved for the right edge.

**Checks.**

- `f = 1/s` on `[−1, 1] ×ℂ [−1, 1]`: the four terms are `iπ/2` each and the expression is `2πi`;
  the clockwise convention would give `−2πi`.
- `f = 1/(s − 2)` on the same rectangle, with `P = ∅` (the pole lies outside the rectangle; take
  `U` the disc of radius `3/2`): the expression is `0`, so a sum over all poles of `f` would be
  wrong.
- `f = 1/s²` on `[−1, 1] ×ℂ [−1, 1]`: a double pole with residue `0`, and the expression is `0`;
  a statement restricted to simple poles would not cover it.
- The sign of the horizontal term in the U-shaped form, tested on the finite-height identity behind
  it (right edge = left edge + horizontal term + `2π Σ_{p∈P} Res_p f`, which needs no
  integrability) at `f = 1/s`, `σ₁ = −1`, `σ₂ = 1`, `T = 1`: the right edge is
  `∫_{−1}^{1} dy/(1 + iy) = π/2`, the left edge `∫_{−1}^{1} dy/(−1 + iy) = −π/2`, the bottom edge
  `∫_{−1}^{1} dx/(x − i) = iπ/2`, the top edge `∫_{−1}^{1} dx/(x + i) = −iπ/2` and the residue sum
  `1`. The identity `π/2 = −π/2 + X + 2π` forces the horizontal term to be
  `X = −π = (−iπ/2 − iπ/2)/i`, top minus bottom over `i`; bottom minus top over `i`, the clockwise
  model, gives `+π` and fails.
- A function with an essential singularity in `P`, such as `exp(1/s)`, is excluded by the
  meromorphy hypothesis: `TauCeti.Contour.residue` is the junk `0` there while its boundary
  integral is `2πi`.

*Needs:* ZerosOfLFunctions §7.1; Tau Ceti `TauCeti.Contour.classicalResidueTheorem_nullHomologous`,
`TauCeti.Contour.residue`; Mathlib `Complex.integral_boundary_rect_eq_zero_of_differentiableOn` (for
the edge bookkeeping); ContourIntegration Layers 2–4.

### 8.1a Circle integrals about isolated singularities

Let `σ₁ < σ₂`, `t₁ < t₂`, `r > 0` and `P` a finite set such that the closed discs `closedBall ρ r`,
`ρ ∈ P`, are pairwise disjoint and contained in the open rectangle `(σ₁, σ₂) ×ℂ (t₁, t₂)`. If `f` is
complex differentiable on `[σ₁, σ₂] ×ℂ [t₁, t₂] ∖ P` (Mathlib's `DifferentiableOn`, as in
`Complex.integral_boundary_rect_eq_zero_of_differentiableOn`), then the edge expression of 8.1
equals `Σ_{ρ∈P} ∮_{C(ρ,r)} f`; this is `rectangle_boundary_integral_eq_sum_circleIntegral`
(ieantn-contourintegration lines 60–90, with the same hypotheses on `r`, `P` and `f`). No open
neighbourhood of the rectangle and no meromorphy is assumed, so the points of `P` may be essential
singularities.

Route: for `ρ ∈ P` let `f_ρ(z) = (2πi)⁻¹ ∮_{C(ρ,r)} f(w)/(z − w) dw`, holomorphic off
`closedBall ρ r`. On a thin annulus `r < |z − ρ| < r′` inside the rectangle and away from the other
discs, Cauchy's formula (Mathlib
`Complex.circleIntegral_eq_of_differentiable_on_annulus_off_countable` applied to
`w ↦ (f(w) − f(z))/(w − z)`) writes `f − f_ρ` as the Cauchy integral of `f` over `C(ρ, r′)`,
holomorphic on `ball ρ r′`. Hence `f − Σ_ρ f_ρ` agrees off the discs with a function differentiable
on the closed rectangle, whose edge expression is `0` by Mathlib's theorem. For each `ρ`, Fubini
(`MeasureTheory.integral_integral_swap`) and the value `2πi` of the edge expression of
`z ↦ 1/(z − w)` for `w` in the open rectangle (8.1 at a simple pole) turn the edge expression of
`f_ρ` into `∮_{C(ρ,r)} f`.

**Checks.**

- `f = exp(1/s)` on `[−1, 1] ×ℂ [−1, 1]`, `P = {0}`, `r = 1/2`: an essential singularity, outside
  8.1. Both the edge expression and `∮_{C(0,1/2)} exp(1/z) dz` equal `2πi`, the coefficient of `1/z`
  in `Σ_k z^{−k}/k!` being `1`.
- Agreement with 8.1: where `f` is meromorphic at `ρ`, `∮_{C(ρ,r)} f = 2πi Res_ρ f` for small `r`
  (`TauCeti.Contour.classicalResidueTheorem_nullHomologous` on the circle), so 8.1a returns 8.1's
  `2πi Σ_{p∈P} Res_p f`; for `f = 1/s` on `[−1, 1] ×ℂ [−1, 1]`, `∮_{C(0,1/2)} dz/z = 2πi`, the value
  of 8.1's first Check.
- Disjointness is needed: `f = 1/s`, `P = {0, 3/10}`, `r = 1/2` (`f` is differentiable off `P`).
  Both circles enclose `0`, so the sum is `4πi`, while the edge expression is `2πi`.

*Needs:* 8.1 (at the simple pole of `1/(z − w)`); Mathlib
`Complex.integral_boundary_rect_eq_zero_of_differentiableOn`,
`Complex.circleIntegral_eq_of_differentiable_on_annulus_off_countable`,
`MeasureTheory.integral_integral_swap`.

### 8.1b The L-shaped contour to `Re s = −∞`

Let `T > 0`, `w ∈ ℂ` with `Re w ≤ 1` and `0 < Im w < T`, and
`D_w = {s : Re s ≤ 1, 0 ≤ Im s ≤ T} ∖ {s : Re s < Re w, Im s < Im w}`, the half-infinite strip with
its lower-left block removed. Let `r > 0` and `P` a finite set whose closed discs `closedBall ρ r`
are pairwise disjoint and contained in `{s : Re s < 1, Im w < Im s < T}`. Let `f` be complex
differentiable on `D_w ∖ P`, with `f(s) → 0` as `Re s → −∞` uniformly in `Im w ≤ Im s ≤ T`, and
with `x ↦ f(x + i Im w)` integrable on `(−∞, Re w]` and `x ↦ f(x + iT)` integrable on `(−∞, 1]`.
Then

`i ∫_0^T f(1 + iy) dy = ∫_1^{Re w} f(x) dx + i ∫_0^{Im w} f(Re w + iy) dy − ∫_{−∞}^{Re w} f(x + i Im w) dx + ∫_{−∞}^1 f(x + iT) dx + Σ_{ρ∈P} ∮_{C(ρ,r)} f`,

the first three terms on the right being the integral of `f` along the L-shaped path
`1 → Re w → w → −∞ + i Im w`; this is `vertical_integral_eq_lShaped_add_sum_circleIntegral`
(ieantn-ch2v4 lines 93–110 and 135–162, stated there with differentiability on the whole strip
`{Re s ≤ 1, 0 ≤ Im s ≤ T}` off `P` and decay on all of it). Differentiability is required on `D_w`
only, and decay only on `Im w ≤ Im s ≤ T`, so `f` may be singular in the removed block, and the
points of `P` may be essential singularities. With `P = ∅` this is the pole-free shift.

Route: for large `X` apply 8.1a to the rectangle `[−X, 1] ×ℂ [Im w, T]`, which contains every disc,
and Mathlib's `Complex.integral_boundary_rect_eq_zero_of_differentiableOn` to
`[Re w, 1] ×ℂ [0, Im w]`; in the sum of the two edge expressions the segment from `w` to
`1 + i Im w` cancels. Let `X → ∞`: the left edge `i ∫_{Im w}^{T} f(−X + iy) dy` tends to `0` by the
uniform decay, and the two horizontal integrals converge by integrability
(`MeasureTheory.intervalIntegral_tendsto_integral_Iic`).

**Checks.**

- `f(s) = eˢ`, `P = ∅`: the left side is `e(e^{iT} − 1)`, and the right side
  `(e^{Re w} − e) + e^{Re w}(e^{i Im w} − 1) − e^w + e^{1+iT}` is the same for every admissible `w`.
- The sign of the circle term, at `f(s) = eˢ/(s − ρ₀)`, `ρ₀ = −1 + 1.2i`, `T = 2`,
  `w = 0.5 + 0.5i`, `r = 0.3`: both sides are `≈ −2.22089 + 1.12902i`, the circle term being
  `2πi e^{ρ₀}`; with `−Σ ∮` the right side would be `≈ 2.08784 − 0.54613i`.
- The removed block matters: `f(s) = eˢ/s` has its pole at `0`, in the block when `Re w > 0`, and is
  differentiable on `D_w` with `P = ∅`; on the full strip it is not.

*Needs:* 8.1a; Mathlib `Complex.integral_boundary_rect_eq_zero_of_differentiableOn`,
`MeasureTheory.intervalIntegral_tendsto_integral_Iic`.

### 8.2 Carathéodory's inequality and the derivative form of Borel–Carathéodory

Let `f` be holomorphic on `|z − z₀| < R` with `Re f ≤ M` there, and write
`f(z) = Σ_n a_n (z − z₀)^n`. Prove Carathéodory's coefficient inequality
`|a_n| R^n ≤ 2(M − Re a₀)` for every `n ≥ 1`, and hence, for `k ≥ 1`, `0 ≤ r < R` and
`|z − z₀| ≤ r`, `|f^{(k)}(z)| ≤ 2 · k! · R · (M − Re f(z₀))/(R − r)^{k+1}`; the latter is
`norm_iteratedDeriv_le_borelCaratheodory`, and its case `z = z₀`, `r = 0` is the former
(kontorovichtao-pntplus lines 1751–1758, Theorem 5.3.2, in the weaker form `16MR²/(R − r)³` at
`k = 1`, `f(z₀) = 0`; montgomeryvaughan2007, Chapter 6, §6.1). Route: for `ρ < R`,
`−a_n ρ^n = π⁻¹ ∫_0^{2π} (M − Re f(z₀ + ρe^{iθ})) e^{−inθ} dθ`, and the integrand `M − Re f ≥ 0`
has mean `M − Re a₀`; then sum
`Σ_{n≥k} n!/(n−k)! |a_n| r^{n−k} ≤ 2(M − Re a₀) k! R/(R − r)^{k+1}`.

**Checks.**

- The extremal `f(z) = −2M(z − z₀)/(R − (z − z₀))` has `Re f < M` on the disc, `f(z₀) = 0`, and at
  `z = z₀ + r` attains the bound with equality for every `k`: `|f^{(k)}| = 2 k! M R/(R − r)^{k+1}`;
  at `M = R = 1`, `r = 1/2` both sides are `8, 32, 192` for `k = 1, 2, 3`.
- At `k = 1`, `f(z₀) = 0`, `r = R/2` the bound is `8M/R`, below the source's
  `16MR²/(R − r)³ = 128M/R`.
- `k = 0` is excluded: `f ≡ i` has `M = 0 = Re f(z₀)`, so the formula would claim `|f| ≤ 0`.
- If `Re f` attains `M` at `z₀`, the bound is `0`, as it must be: `Re f` is then constant and so is
  `f`.

*Needs:* Mathlib power series of holomorphic functions on a disc, `circleIntegral`,
`Complex.borelCaratheodory` (the case `k = 0` is its value form).

### 8.3 Landau's local logarithmic-derivative lemma

Fix `0 < r₁ < r₂ < 1`. There is `C = C(r₁, r₂)` such that: if `R > 0`, `f` is holomorphic on a
neighbourhood of `|z − z₀| ≤ R`, `f(z₀) ≠ 0` and `|f(z)| ≤ e^M |f(z₀)|` on `|z − z₀| ≤ R` (so
`M ≥ 0`), then for every `z` with `|z − z₀| ≤ r₁R` and `f(z) ≠ 0`,
`|f′(z)/f(z) − Σ_ρ m_ρ/(z − ρ)| ≤ C M/R`, the sum over the zeros `ρ` of `f` with
`|ρ − z₀| ≤ r₂R`, counted with their orders `m_ρ`; this is `norm_logDeriv_sub_sum_zeros_le`
(kontorovichtao-pntplus lines 1971–1977, Theorem 5.3.7, with explicit `C`; titchmarsh1986, Chapter
III; montgomeryvaughan2007, Chapter 6, §6.1). The sum is finite because `f` is not identically zero
on the connected neighbourhood. Route: by Jensen (ZerosOfLFunctions §4.3) the zeros in
`|ρ − z₀| ≤ r₂R` number at most `M/log(1/r₂)`; divide `f` by the Blaschke factors of these zeros
for a radius `R′ ∈ (r₂R, R)`, take a holomorphic logarithm of the quotient on the zero-free disc,
bound its real part above by `M + O(M)`, and apply 8.2 with `k = 1`.

**Checks.**

- `f(z) = z − ρ` with `|ρ − z₀| ≤ r₂R`, `ρ ≠ z₀`: the zero sum is exactly `f′/f`, so the left
  side is `0` at every admissible `z`, while `M = log((R + |ρ − z₀|)/|ρ − z₀|) > 0`; with `ρ` just
  outside the disc of radius `r₂R` the sum is empty and the left side is `|1/(z − ρ)|`, at most
  `1/((r₂ − r₁)R)`, which the bound absorbs once `C ≥ 1/((r₂ − r₁) log 2)`, because the same
  formula gives `M ≥ log 2` whenever `|ρ − z₀| ≤ R`.
- `M = 0` forces `f` constant by the maximum principle; both sides are `0`.
- The zero sum is necessary: `f(z) = z − z₀ − ε` has `f′/f(z₀ + 2ε) = 1/ε` while
  `M = log((R + ε)/ε)`, so `CM/R ≪ 1/ε` as `ε → 0`.
- Scaling: replacing `f(z)` by `f(z₀ + λ(z − z₀))` multiplies `f′/f` and the zero sum by `λ` and
  divides `R` by `λ`, with `M` unchanged; the bound `CM/R` scales the same way, which is why the
  constant depends only on `r₁` and `r₂`.
- A sample with a non-polynomial factor: `f(z) = (z − 3/10) e^{2z}`, `z₀ = 0`, `R = 1`,
  `r₁ = 1/4`, `r₂ = 1/2`: `M = log(max|f|/|f(0)|) ≈ 2.85` and the left side is `|2| = 2`.
- Agreement with AnalyticNumberTheoryPartI §0.30a (`riemannZeta_local_logDeriv`): 8.3 applied to
  `(s − 1)ζ(s)` on `|s − s₀| ≤ r′ + 1` with `M = O(log(|Im s₀| + 2))` (Euler product at the centre,
  ZerosOfLFunctions §3.4 on the disc) gives Part I's error `C log(|Im s₀| + 2)`, the term
  `1/(s − 1)` being the logarithmic derivative of the factor `s − 1`.

*Needs:* 8.2; ZerosOfLFunctions §4.3; Mathlib holomorphic logarithms on a disc,
`AnalyticOnNhd.sum_divisor_le`, `logDeriv`, `analyticOrderNatAt`.

### Examples

- For `f = ζ`, `z₀ = 2 + it`, `R = 3/2`, `|t| ≥ 3`: `M = O(log |t|)` by ZerosOfLFunctions §3.4 and
  `|ζ(2 + it)| ≥ ζ(4)/ζ(2)`, which is the input of 10.3.
- The rectangle `[1/2, 2] ×ℂ [−1, 1]` with `f = −ζ′(s)/ζ(s) · x^s/s` has the single pole `1` inside,
  with residue `x`.

### Dependencies

Mathlib complex analysis (Cauchy, power series, Borel–Carathéodory, Jensen, circle integrals on
annuli, improper integrals on half-lines); Tau Ceti residue theorem; ZerosOfLFunctions §§4.3 and
7.1; ContourIntegration Layers 2–4.

## Layer 9: Mellin smoothing

### 9.1 Mellin convolution

Define *mellinConv* `f g x = ∫_{(0,∞)} f(y) g(x/y) dy/y` for `f, g : ℝ → ℂ` and `x : ℝ`, written
`(f ⋆ g)(x)` (kontorovichtao-pntplus lines 893–898, Definition 4.3.1). API:

- For `x > 0`, `(f ⋆ g)(x) = (g ⋆ f)(x)`, with no integrability hypothesis: the substitution
  `y ↦ x/y` preserves `dy/y` on `(0, ∞)` and exchanges the two integrands, so both sides are
  integrals of the same function or both are the junk value `0` (lines 900–914, Lemma 4.3.2).
- If `(x, y) ↦ f(y) g(x/y) x^{s−1}/y` is integrable on `(0, ∞)²`, then the Mellin transform of
  `f ⋆ g` at `s` is `mellin f s · mellin g s` (lines 916–946, Theorem 4.3.1); it follows from Fubini
  and `mellin_comp_mul_left`. By Tonelli the hypothesis holds when both transforms converge
  absolutely at `Re s`. This is AsymptoticExpansions §8.1 written for `⋆`: with
  `F(t) = f(1/t)/t`, `(F ⋆ h)(x) = ∫ f(t) h(xt) dt` and `mellin F z = mellin f (1 − z)`.
- The convolution is additive in each argument where the integrals converge, and for `x > 0` it
  depends on `f` and `g` only through their restrictions to `(0, ∞)`.
- Support: if `f` vanishes off `[a, b]` and `g` off `[c, d]`, `0 < a, c`, then `f ⋆ g` vanishes on
  `(0, ∞)` off `[ac, bd]`.

**Checks.**

- `(1_(0,1] ⋆ 1_(0,1])(x) = log(1/x)` for `0 < x ≤ 1` and `0` for `x > 1`; its Mellin transform at
  `s` with `Re s > 0` is `1/s² = (1/s)(1/s)`. The additive convolution of the same indicators is
  the tent on `(0, 2)`, a different function.
- `x > 0` is needed for commutativity: with `f = 1_[0,1]` and `g = 1_[1,2]`,
  `(g ⋆ f)(0) = f(0) log 2 = log 2` while `(f ⋆ g)(0) = g(0) · (junk) = 0`.
- Support: `1_[1,2] ⋆ 1_[1,2]` is supported in `[1, 4]` on `(0, ∞)`, with value `log 2` at
  `x = 2`, not in `[2, 4]` as an additive model would give.

*Needs:* Mathlib `mellin`, `mellin_comp_mul_left`, `MeasureTheory.integral_prod`, the measure
`dy/y` on `(0, ∞)` and its invariance under `y ↦ x/y`.

### 9.2 Mellin transforms of compactly supported bumps

Let `ν : ℝ → ℂ` be `C^k`, `k ≥ 1`, with support in `[a, b]`, `0 < a ≤ b`. Then: `mellin ν` is
entire; for every `σ₁ ≤ σ₂` there is `C` with `|mellin ν (s)| ≤ C (1 + |s|)^{−k}` on
`σ₁ ≤ Re s ≤ σ₂`; and `mellin ν 0 = ∫ ν(x) dx/x` (kontorovichtao-pntplus lines 947–962, Theorem
4.3.2, for `k = 1`). Route: `mellin ν (s) = (−1)^k mellin (ν^{(k)}) (s + k)/(s(s + 1)⋯(s + k − 1))`
by `k` integrations by parts with no boundary terms, and continuity on the compact part of the
strip.

**Checks.**

- For the `C¹` bump `ν(x) = (x − 1)²(2 − x)²` on `[1, 2]`, `0` elsewhere,
  `mellin ν 0 = 4 log 2 − 11/4 ≈ 0.0226` is the `dx/x`-mass, while `∫ ν dx = 1/30 ≈ 0.0333`.
- The support must stay away from `0`: `ν(x) = max(0, 1 − x)²` is `C¹` on `(0, ∞)` with support
  `[0, 1]`, and `mellin ν s = 2/(s(s + 1)(s + 2))` has poles at `0, −1, −2`, so it is not entire.
- The sign of the integration by parts at `k = 1`: `mellin ν 1 = −mellin ν′ 2`; for the bump of the
  first Check both sides are `1/30`, and the opposite sign would give `−1/30`.

*Needs:* Mathlib `mellin`, `mellin_differentiableAt_of_isBigO_rpow`, integration by parts on
compact intervals.

### 9.3 Delta spikes and the approximate identity for `dx/x`

Define `deltaSpike ν ε x = ε⁻¹ ν(x^{1/ε})` for `x > 0`, and `0` for `x ≤ 0`, for `ν : ℝ → ℝ`
(kontorovichtao-pntplus lines 964–966, Definition 4.3.2). Under the standing bump hypotheses on `ν`
and `0 < ε`, prove:

- the spike is supported in `[2^{−ε}, 2^{ε}]`, is `≥ 0` and has `dx/x`-mass `1` (lines 968–974,
  Lemma 4.3.3);
- its Mellin transform at `s` is `mellin ν (εs)` for every `s` (lines 976–978, Theorem 4.3.3), by
  `mellin_comp_rpow`; hence its value at `s = 1` is `mellin ν ε`, and `|mellin ν ε − 1| ≤ C ε` for
  `0 < ε ≤ 1` (lines 980–1005, Lemma 4.3.4), with `C = 2 log 2` because `|y^ε − 1| ≤ 2ε log 2` on
  `[1/2, 2]`;
- for `f : ℝ → ℂ` locally integrable on `(0, ∞)` and continuous at `x > 0`, the Mellin convolution
  of the spike with `f` at `x` tends to `f(x)` as `ε → 0⁺`, uniformly on compact subsets of
  `(0, ∞)` when `f` is continuous there. Route: the distance is at most
  `sup_{y∈[2^{−ε},2^{ε}]} |f(x/y) − f(x)|`.

**Checks.**

- At `ε = 1` the spike is `ν` itself on `(0, ∞)`; without the factor `ε⁻¹` the mass would be `ε`.
- For `ν` supported in `[1/2, 2]`, the spike at `ε = 1/2` is supported in `[2^{−1/2}, 2^{1/2}]`,
  not in `[1/4, 4]` (the support of the rescaling `x ↦ ν(x^{ε})` in the wrong direction).
- `deltaSpike ν ε 0 = 0` and `deltaSpike ν ε (−1) = 0`, whereas `ν((−1)^{1/ε})` uses Mathlib's
  junk value of a real power of a negative number.

*Needs:* 9.1; Mathlib `mellin_comp_rpow`, `MellinConvergent.comp_rpow`.

### 9.4 Smoothed cutoffs

Define `smoothCutoff ν ε x = ∫_{(x,∞)} ν_ε(z) dz/z` for `x > 0` and `0` for `x ≤ 0`, where
`ν_ε = deltaSpike ν ε`; for `x > 0` it is the Mellin convolution `(1_(0,1] ⋆ ν_ε)(x)`, by the
substitution `z = x/y` (kontorovichtao-pntplus lines 1015–1017, Definition 4.3.3). Under the
standing bump hypotheses and `0 < ε`, prove:

- `0 ≤ smoothCutoff ν ε x ≤ 1` (lines 1069–1104, Lemmas 4.3.7–4.3.8);
- `smoothCutoff ν ε x = 1` for `0 < x ≤ 2^{−ε}` and `= 0` for `x ≥ 2^{ε}` (lines 1025–1068,
  Lemmas 4.3.5–4.3.6, whose constants `1 − cε`, `1 + cε` are these thresholds weakened);
- the cutoff is continuous on `(0, ∞)` and Mellin convergent at every `s` with `Re s > 0`;
- for `Re s > 0`, `mellin 1̃_ε s = mellin ν (εs)/s`; this is `mellin_smoothCutoff` (lines
  1107–1127, Lemma 4.3.9), by Fubini on `{0 < x < z}` (or 9.1 with 9.3 and `hasMellin_one_Ioc`);
- if `ν` is `C^k`, `k ≥ 1`, then for `0 < σ₁` and every `σ₂` there is `C` with
  `|mellin 1̃_ε s| ≤ C/(|s| (1 + ε|s|)^k)` for `σ₁ ≤ Re s ≤ σ₂` and `0 < ε ≤ 1`; this is
  `norm_mellin_smoothCutoff_le` (lines 1128–1131, Lemma 4.3.10, the case `k = 1` in the form
  `O(1/(ε|s|²))`), by 9.2 on the fixed strip `0 ≤ Re w ≤ σ₂` for `w = εs`; in particular the
  transform is integrable on every such vertical line;
- `|mellin 1̃_ε 1 − 1| ≤ C ε` for `0 < ε ≤ 1` (lines 1132–1134, Lemma 4.3.11).

**Checks.**

- If `ν(1/x) = ν(x)` for all `x > 0`, then `smoothCutoff ν ε 1 = 1/2`, the mass of `ν_ε` on
  `[1, ∞)`; for the non-symmetric bump `ν ∝ (x − 1/2)²(2 − x)²` on `[1/2, 2]` and `ε = 1/2` the
  value at `1` is `≈ 0.706`, so the value `1/2` is a property of symmetric bumps only.
- `smoothCutoff ν ε 0 = 0`, so a sum `Σ_{n≥0} a(n) smoothCutoff ν ε (n/X)` has no `n = 0` term.
- The transform formula, computed for that non-symmetric bump at `ε = 1/2`, `s = 1.3 + 2i`: both
  sides equal `0.30772 − 0.32853i`. The opposite normalization `mellin ν (s/ε)/s` gives
  `0.49617 + 0.09889i` there instead. As `ε → 0⁺` the correct side tends to `mellin ν 0/s = 1/s`,
  the transform of `1_(0,1]` (`0.23536 − 0.35129i` at `ε = 1/20`, against
  `1/s = 0.22847 − 0.35149i`). The opposite side has modulus `0.506, 0.762, 16.4, 1.9·10⁴` at
  `ε = 1/2, 1/4, 1/10, 1/20` and is unbounded: this bump vanishes to second order at `2`, whence
  `|mellin ν w| ≍ 2^{Re w}/|w|³` as `Re w → +∞` in a sector `|arg w| ≤ θ < π/2`.
- The bound is uniform in `ε`: with `k = 1`, `s = 1 + iT`, it is `≍ 1/(T(1 + εT))`, which is
  `≍ 1/T` for `T ≤ 1/ε` and `≍ 1/(εT²)` beyond.

*Needs:* 9.1–9.3, 9.2 for the decay; Mathlib `hasMellin_one_Ioc`, `MeasureTheory.integral_prod`.

### Examples

- `smoothCutoff ν ε` with `ν` a symmetric `C^∞` bump: a `C^∞` function on `(0, ∞)` equal to `1` on
  `(0, 2^{−ε}]`, to `0` on `[2^{ε}, ∞)`, with value `1/2` at `1`.

### Dependencies

Mathlib Mellin transform and Fubini; Layer 7 is not needed; 9.2 feeds 9.4.

## Layer 10: from a zero-free region to an error term

### 10.1 Smoothed summatory functions

Let `a : ℕ → ℂ` with `LSeriesSummable a σ′` for every real `σ′ > 1`, `ν` a `C^k` bump with `k ≥ 1`
satisfying the standing hypotheses, `0 < ε ≤ 1`, `X > 0` and `σ > 1`. Then
`Σ_{n≥0} a(n) smoothCutoff ν ε (n/X) = mellinInv σ (fun s ↦ LSeries a s · mellin 1̃_ε s) X⁻¹`,
that is, `(2πi)⁻¹ ∫_{(σ)} F(s) 𝓜1̃_ε(s) X^s ds` with `F = LSeries a`; this is
`smoothedSum_eq_mellinInv` (kontorovichtao-pntplus lines 1463–1498, Definition 4.5.2 and Theorem
4.5.2). The sum is finite, the cutoff vanishing at `n = 0` and for `n ≥ 2^{ε}X`. Route:
`mellinInv_mellin_eq` at each `x = n/X` (9.4 gives its three hypotheses), then exchange sum and
integral by absolute convergence on `Re s = σ`.

*Comparison with the sharp sum.* If moreover `|a(n)| ≤ B log(n + 1)` for all `n ≥ 1`, there is an
absolute `C` such that for `X ≥ 2` and `0 < ε ≤ 1`,
`|Σ_{n≤X} a(n) − Σ_{n≥1} a(n) smoothCutoff ν ε (n/X)| ≤ C B (εX + 1) log X` (lines 1502–1506,
Theorem 4.5.3, for `a = Λ`, stated there as `O(εX log X)` with no condition on `ε`; the term `+1`,
which the second Check shows to be needed when `εX < 1`, is added here). Route: the two weights
agree off `(2^{−ε}X, 2^{ε}X)`, which contains at most `(2^ε − 2^{−ε})X + 1 ≤ 3εX + 1` integers, and
`|1 − 1̃_ε| ≤ 1`.

With `a = Λ` this is the smoothed Chebyshev function and its comparison with `Chebyshev.psi`.

**Checks.**

- `a = δ₁` (`a(1) = 1`, else `0`): both sides of the identity equal `smoothCutoff ν ε (1/X)`, by
  `mellinInv_mellin_eq` alone.
- The `+1` is necessary: for `a ≡ 1` (so `B = 1/log 2`), `X = 2` and symmetric `ν`, the difference
  is `1 − 1̃_ε(1) = 1/2` for every `ε ≤ log₂(3/2)` (then `1/2 ≤ 2^{−ε} = 2/3` at the endpoint and
  `3/2 ≥ 2^{ε}`), while `CBεX log X = 2Cε → 0`; the corrected bound is `≥ C`.
- `k ≥ 1` is needed for the line integral to converge absolutely: for a merely continuous `ν` the
  transform is `O(1/|s|)` only and `y ↦ 𝓜1̃_ε(σ + iy)` need not be integrable.

*Needs:* 9.4; Mathlib `mellinInv_mellin_eq`, `LSeries`, `LSeriesSummable`, `Chebyshev.psi`.

### 10.2 The transfer theorem in Ingham's form

Define `inghamExponent η x = inf_{t≥3} (η(t) log x + log t)`, the infimum over `t ∈ [3, ∞)` (the
real infimum, used where the set is bounded below). API, for `η` continuous on `[3, ∞)` with
`0 < η ≤ 1/2` there and `x ≥ 1`:

- the infimum is attained, since the function of `t` is continuous and tends to `∞`;
- the exponent is nondecreasing in `x`, and `log 3 ≤ inghamExponent η x ≤ η(3) log x + log 3`;
- if `η(t) ≥ a₀ (log t)^{−A}` with `a₀ > 0`, `A ≥ 0`, then
  `inghamExponent η x ≥ c₁ (log x)^{1/(1+A)}` for `x ≥ 3`, with `c₁ > 0` depending on `a₀` and `A`;
- if `η ≤ η′` on `[3, ∞)` then `inghamExponent η ≤ inghamExponent η′`.

Hypotheses of the transfer theorem:

- `η` is continuous and nonincreasing on `[3, ∞)`, `0 < η(t) ≤ 1/2` there, and
  `η(t) ≥ a₀ (log t)^{−A}` for some `a₀ > 0`, `A ≥ 0`;
- `a : ℕ → ℂ` with `|a(n)| ≤ B log(n + 1)` for `n ≥ 1`;
- `r ∈ ℂ`, `U ⊆ ℂ` open with `R_η ⊆ U`, and `G` holomorphic on `U` with
  `LSeries a s = G(s) + r/(s − 1)` for `Re s > 1`;
- `|G(s)| ≤ C₀ log(|Im s| + 3)^{B′}` on `R_η`.

Conclusion: there are `c > 0` and `C′` with `|Σ_{n≤x} a(n) − r x| ≤ C′ x exp(−c · inghamExponent η x)`
for every `x ≥ 3`; this is `norm_sum_sub_mul_le_of_zeroFreeRegion` (platttrudgian2020 lines 21–32,
Ingham's theorem in the zero-free-region form for `ψ`; kontorovichtao-pntplus lines 1507–1516 and
1673–1683, Definition 4.5.3 and Theorem 4.6.1, the case `η = A₀/log^{n₁} t`; montgomeryvaughan2007,
Chapter 6; tenenbaum2015, Chapter II.4; iwanieckowalski2004, Chapter 5).

Route: by 10.1 with `σ₀ = 1 + 1/log x`, write the smoothed sum as an integral on `Re s = σ₀`;
choose `T ≥ 3` with `log T = η(T + 3) log x` (the function `t ↦ η(t + 3) log x − log t` is continuous
and strictly decreasing on `[3, ∞)` and tends to `−∞`, and it is positive at `3` once
`η(6) log x > log 3`; smaller `x` are absorbed in `C′`, the left side being at most
`(B log(x + 1) + |r|) x` there). Taking `t = T + 3 ≤ 2T` in the infimum gives
`inghamExponent η x ≤ log T + log(2T)`, so `η(T + 3) log x = log T ≥ (inghamExponent η x − log 2)/2`,
and the left edge saves `x^{−η(T + 3)} = 1/T`; apply 8.1 to
`(G(s) + r/(s − 1)) · mellin ν (εs)/s · x^s`, which is meromorphic on `U` with the single pole `1` in
the rectangle `[1 − η(T + 3), σ₀] ×ℂ [−T, T] ⊆ R_η`, of residue `r · mellin ν (ε) · x`; bound the
tails by 9.4 and `|F(σ₀ + it)| ≤ B Σ log(n+1) n^{−σ₀} = O(B log² x)`, the horizontal edges and the
left edge by the hypothesis on `G` and `|r/(s − 1)| ≤ |r|/η(T + 3)`; take `ε = T^{−1/2}` and absorb
the factors `log^{O(1)} x` with `inghamExponent η x ≥ c₁ (log x)^{1/(1+A)}`, which the lower bound on
`η` gives; finish with the comparison of 10.1 and `|mellin ν ε − 1| ≤ Cε`. The constant `c`
produced is an absolute fraction. Ingham's factor `(1 − ε)/2` in front of `ω_η` (platttrudgian2020
lines 21–32) and Pintz's `1 − ε` (lines 54–56) are not claimed: their proofs sum the explicit
formula over the zeros, with a zero count and, for Pintz's form, a zero density (the form of
ExplicitPrimeCounting §3.1(d)), none of which the hypotheses of 10.2 provide.

**Checks.**

- `η(t) = c₀/log t`: `inghamExponent η x = 2√(c₀ log x)` once `√(c₀ log x) ≥ log 3`; at `c₀ = 1`,
  `x = e^{100}` the infimum is `20`, attained at `log t = 10`. The conclusion is the classical
  `x exp(−c√log x)`, consistent with ZerosOfLFunctions §8.5 at `K = ℚ` through 10.3 at `K = ℚ`
  (AnalyticNumberTheoryPartI §0.33a).
- `η(t) = A₀/log^{n₁} t` gives `inghamExponent η x ≍ (log x)^{1/(1+n₁)}`; `n₁ = 9` is
  kontorovichtao-pntplus line 1684 (Theorem 4.6.2, error `exp(−c (log x)^{1/10})`).
- A constant width `η ≡ η₀` (`A = 0`) gives `inghamExponent η x = η₀ log x + log 3` and the power
  saving `x^{1−cη₀}`; at `η₀ = 1/4`, `log x = 100` the infimum is `25 + log 3 ≈ 26.0986`, attained
  at `t = 3`.
- A plausible wrong exponent, `η(x) log x` (the width evaluated at `x`), is the constant `c₀` for
  `η = c₀/log t` and gives no decay; the infimum over `t` is essential.
- `a = μ`, `r = 0`, `G = 1/ζ`: the conclusion is `M(x) = O(x exp(−c√log x))`, the zero-residue
  case.
- `a ≡ 1`, `r = 1`, `G = ζ − 1/(s − 1)`: the conclusion `⌊x⌋ − x = O(x exp(−cω))` holds trivially.
- The height in the route is chosen by `η(T + 3)`, not by `η(T)`. Take `η = 1/2` on `[3, T₀]`,
  linear on `[T₀, T₀ + 3]` down to `1/log²(T₀ + 3)`, and `1/log² t` beyond, which meets every
  hypothesis with `a₀ = 1/2`, `A = 2` for `T₀ ≥ 6`, and `log x = 2 log T₀`. Then
  `inghamExponent η x ≥ log T₀`; the choice `log T = η(T) log x` gives `T = T₀` and a left-edge
  saving `x^{−η(T₀ + 3)} = exp(−2 log T₀/log²(T₀ + 3)) → 1`, no power of `T₀`, while the choice by
  `η(T + 3)` saves `1/T` with `log T ≥ log(T₀ − 3)`.

*Needs:* 8.1, 9.4, 10.1; Mathlib `LSeries`, `riemannZeta`; ZerosOfLFunctions §8.5 for the Check.

### 10.3 The classical logarithmic-derivative bound

Let `K` be a number field, `𝔪` a modulus of `K`, `χ : RayClassCharacter 𝔪` (of finite order, as
every ray class character is), and `L = TauCeti.LFunctions.heckeLFunctionC χ` (for the trivial
character of modulus `1` this is the continued Dedekind zeta function; at `K = ℚ` it agrees with
`riemannZeta` on `ℂ ∖ {1}`).
Put `δ_χ = 1` if `χ = 1` and `0` otherwise. There are `c > 0` and `C`, depending on `K`, `𝔪` and
`χ`, an open set `U` containing `R_c = {s : 1 − c/log(|Im s| + 3) ≤ Re s}` and `G` holomorphic on
`U`, such that `L(s) ≠ 0` and `−L′(s)/L(s) = G(s) + δ_χ/(s − 1)` for `s ∈ R_c ∖ {1}`, and
`|G(s)| ≤ C log(|Im s| + 3)` on `R_c`; this is `logDeriv_heckeLFunctionC_bound`
(montgomeryvaughan2007, Chapter 6, §6.1; titchmarsh1986, Chapter III; kontorovichtao-pntplus lines
1718–1723, Theorem 5.2.3, the weaker `log² t` bound for `ζ`).

Route: reduce to the primitive character (Tau Ceti `heckeLFunctionC_eq_primitive` and its germ
form; the deleted Euler factors have no zeros and a bounded logarithmic derivative on
`Re s ≥ 1/2`). Shrink the width of ZerosOfLFunctions §§6.2–6.4 so that the region misses the at
most one exceptional real zero, a fixed point `β < 1` for fixed `χ` (LFunctions Layer 7 and
ZerosOfLFunctions §6.5 exclude `β = 1`), and so that `c ≤ (log 3)/2`. For `|t| ≤ t₀` use
compactness and the simple pole. For `|t| ≥ t₀`, apply 8.3 at `z₀ = 2 + it`, `R = 3/2`,
`r₁R = 11/10`, `r₂R = 6/5`: `|L(2 + it)|` is bounded below by the Euler product (LFunctions Layer 5)
and `|L| ≤ C(|t| + 3)^B` on the disc (ZerosOfLFunctions §3.4), so `M = O(log |t|)`. Compare
`s ∈ R_{c/2}` with `s₁ = 1 + 1/log |t| + it`: each zero `ρ` in the disc has `Re ρ ≤ 1 − c/log |t|`,
so `|1/(s − ρ) − 1/(s₁ − ρ)| ≪ Re 1/(s₁ − ρ)`, and `Σ_ρ Re 1/(s₁ − ρ) = Re L′/L(s₁) + O(log |t|)` is
`O(log |t|)` because `|L′/L(σ + it)| ≤ [K:ℚ] |ζ′/ζ(σ)|` for `σ > 1`. Take the final width `c/2`.

**Checks.**

- `K = ℚ`, `χ = 1` is AnalyticNumberTheoryPartI §0.33a: there `G = −ζ′/ζ − 1/(s − 1)`, extended
  across `1`, and with `c = β` (Part I's width) every `s ∈ R_c` has
  `Re s ≥ 1 − β/log(|Im s| + 3) > 1 − β/log(|Im s| + 2)`, inside the open half-plane right of Part
  I's curve, where `ζ` has no zero and `|G(s)| ≤ C log(|Im s| + 2) ≤ C log(|Im s| + 3)`; the
  residue term is `δ_χ = 1`. Part I's strip bounds of §0.33 alone, multiplied as `ζ′ · (1/ζ)`, give
  only `log³`, so the single logarithm here agrees with §0.33a and does not follow from §0.33.
- `δ_χ` is the residue of `−L′/L` at `1`: `ζ` has residue `1`, `ζ′/ζ` residue `−1`, so `−ζ′/ζ` has
  residue `+1`; a definition with `δ_χ` the residue of `L` itself would put the class number formula
  in place of `1` for `K ≠ ℚ`.
- An imprimitive presentation of the trivial character modulo `2` has
  `L(s) = (1 − 2^{−s}) ζ(s)`, with its extra zeros on `Re s = 0` only, outside `R_c`; its `G` differs
  from that of `ζ` by `−(log 2) 2^{−s}/(1 − 2^{−s})`, bounded on `Re s ≥ 1/2`, and `δ_χ = 1` is
  unchanged although the residue of `L` at `1` becomes `1/2`.
- With 10.2 at `η(t) = c/log t` and `a(n) = Σ_{N𝔞 = n} Λ_K(𝔞) χ(𝔞)` (`|a(n)| ≤ [K:ℚ] log n`), this
  gives ZerosOfLFunctions §8.5 and §8.6 at fixed `K` and `χ`.

*Needs:* 8.3; ZerosOfLFunctions §§3.4, 6.2–6.5; LFunctions Layers 3, 5 and 7; Tau Ceti
`TauCeti.LFunctions.heckeLFunctionC`, `TauCeti.LFunctions.heckeLFunctionC_eq_primitive`,
`TauCeti.LFunctions.heckeLFunctionC_eventuallyEq_primitive`,
`TauCeti.GlobalNumberFields.finite_rayClassGroup`; AnalyticNumberTheoryPartI §0.33a for the Check.

### Examples

- 10.2 with 10.3 at `K = ℚ`, `χ = 1` (AnalyticNumberTheoryPartI §0.33a), `a = Λ`, `r = 1`:
  `ψ(x) = x + O(x exp(−c√log x))`.
- 10.2 with `a` the coefficients of `−L′/L(s, χ)` for a nontrivial Dirichlet character: `r = 0`.

### Dependencies

Layers 8 and 9; ZerosOfLFunctions §§3.4, 4.3, 6.2–6.5, 8.5; LFunctions Layers 3, 5, 7; Tau Ceti
Hecke `L`-functions; Mathlib Mellin inversion; AnalyticNumberTheoryPartI §0.33a for a Check.

## Layer 11: Dirichlet series of the classical arithmetic functions

### 11.1 Completely multiplicative functions

For `R` a monoid with zero, define *IsCompletelyMultiplicative* `f` for `f : ArithmeticFunction R`
as `f 1 = 1` and `f (m * n) = f m * f n` for all `m, n` (kontorovichtao-pntplus lines 3590–3604,
Definition 9.1.8, Theorems 9.1.66–9.1.67; apostol1976, Chapter 2). API:

- It implies `ArithmeticFunction.IsMultiplicative`.
- It is equivalent to `f` being the coercion of an `ℕ →*₀ R`, which is then unique: an equivalence
  between completely multiplicative arithmetic functions and `ℕ →*₀ R` commuting with evaluation.
- It is closed under pointwise product (`ArithmeticFunction.pmul`) for commutative `R`, and holds
  for `ArithmeticFunction.liouville`, for the arithmetic function of a Dirichlet character, and for
  `n ↦ n^ν` (`ν ∈ ℂ`, value `0` at `0`).
- For `R` a commutative semiring, `f · (g ⋆ h) = (f · g) ⋆ (f · h)` (pointwise product against
  Dirichlet convolution); for `R` a commutative ring, the Dirichlet inverse of `f` is `μ · f`.
- For `F` a complete normed field and `Σ ‖f(n)‖ < ∞`, `∏_p (1 − f(p))⁻¹ = Σ f(n)`, obtained from
  `EulerProduct.eulerProduct_completely_multiplicative_tprod` through the equivalence; for
  `F = ℂ` and `LSeriesSummable f s` this is the Euler product of `LSeries f s`.

**Checks.**

- `liouville`: `λ(4) = 1 = λ(2)²` and `λ(12) = −1 = λ(4) λ(3)`.
- `moebius` is multiplicative but not completely multiplicative: `μ(4) = 0 ≠ 1 = μ(2)²`; so the
  coprime-only condition, Mathlib's `IsMultiplicative`, is the wrong model.
- Dropping `f 1 = 1` admits the zero function, which is no `ℕ →*₀ R` for nontrivial `R`.
- The inverse formula at `f = λ`: `μλ = μ²`, and `Σ_{d|4} λ(d) μ²(4/d) = 0 − 1 + 1 = 0`.
- The indicator of the positive integers all of whose prime factors are `≡ 1 (mod 4)` is
  completely multiplicative (`f(1) = 1`, `f(5 · 13) = 1 = f(5) f(13)`, `f(5 · 3) = 0 = f(5) f(3)`)
  and vanishes at `2` and at every prime `≡ 3 (mod 4)`; a predicate requiring a finite set of zero
  primes, as the ideal weights of ArithmeticDirichletSeries §0.2 do, would exclude it.
- The exponentials of ProbabilisticAndMetricNumberTheory §0.1a separate the two notions:
  `2^Ω` is completely multiplicative (`2^{Ω(4)} = 4 = (2^{Ω(2)})²`), while `2^ω` is multiplicative
  but not completely multiplicative (`2^{ω(4)} = 2 ≠ 4 = (2^{ω(2)})²`).

*Needs:* Mathlib `ArithmeticFunction`, `ArithmeticFunction.IsMultiplicative`, `MonoidWithZeroHom`,
`ArithmeticFunction.liouville_apply_mul`, `EulerProduct.eulerProduct_completely_multiplicative_tprod`;
ProbabilisticAndMetricNumberTheory §0.1a for the Check.

### 11.2 The divisor functions `σ_ν` and `d_z`

*`σ_ν`.* Define `sigmaC ν : ArithmeticFunction ℂ` by `sigmaC ν n = Σ_{d|n} d^ν`, with value `0` at
`0` (kontorovichtao-pntplus lines 3215–3297, Definitions 9.1.4–9.1.5, Theorems 9.1.16–9.1.29).
API:

- at `ν = k : ℕ` it is the cast of `ArithmeticFunction.sigma k`;
- it is the Dirichlet convolution of `ζ` with `n ↦ n^ν`; it is multiplicative, with
  `σ_ν(p^a) = Σ_{j≤a} p^{jν}`; and `σ_ν(n) = n^ν σ_{−ν}(n)` for `n ≥ 1`;
- `LSeries (sigmaC ν) s = ζ(s) ζ(s − ν)` for `Re s > max(1, 1 + Re ν)`; this is `LSeries_sigmaC`
  (lines 3316–3323, Theorem 9.1.32);
- `LSeries.abscissaOfAbsConv (sigmaC ν) = max(1, 1 + Re ν)`; this is `abscissaOfAbsConv_sigmaC`
  (the upper bound: lines 3309–3323, Theorem 9.1.31, the abscissa of `n ↦ n^ν` is at most
  `Re ν + 1`, and Theorem 9.1.32, the series of `σ_ν` on `Re s > 1`, `Re(s − ν) > 1`; the
  divergence at the abscissa is proved here by the route below). Route: `σ_ν = ζ ⋆ (n ↦ n^ν)`, the
  series of `ζ` converges absolutely on `Re s > 1` (`ArithmeticFunction.LSeriesSummable_zeta_iff`)
  and that of `n ↦ n^ν`, of modulus `n^{Re ν}`, on `Re s > 1 + Re ν`
  (`LSeriesSummable_of_le_const_mul_rpow`), so `ArithmeticFunction.LSeriesSummable_mul` and
  `LSeries.abscissaOfAbsConv_le_of_forall_lt_LSeriesSummable` give the upper bound. For the lower
  bound it suffices, by `LSeriesSummable.of_re_le_re`, that the series diverges absolutely at the
  real point `σ₀ = max(1, 1 + Re ν)`; its terms at the primes are `|1 + p^ν| p^{−σ₀}`, and
  `|1 + p^ν| ≥ p^{Re ν} − 1` if `Re ν > 0`, `≥ 1 − 2^{Re ν}` if `Re ν < 0`, `= 2` if `ν = 0`, and,
  if `ν = it` with `t ≠ 0`, `|1 + p^{it}| ≥ 1 + cos(t log p)` with `Σ_p cos(t log p) p^{−σ}` bounded
  as `σ → 1⁺`: by `riemannZeta_eq_exp_LSeries`, `log|ζ(σ + it)|` is the real part of
  `LSeries (Λ/log) (σ + it)`, which differs from `Σ_p cos(t log p) p^{−σ}` by the bounded
  contribution of the `p^k`, `k ≥ 2`, and tends to the finite `log|ζ(1 + it)|` by
  `differentiableAt_riemannZeta` and `riemannZeta_ne_zero_of_one_le_re`. In each case the
  comparison is with `Nat.Primes.not_summable_one_div`.

*`d_z`.* Define `generalizedDivisor z : ArithmeticFunction ℂ` for `z ∈ ℂ` as the multiplicative
function with `generalizedDivisor z (p^a) = Ring.multichoose z a`, that is
`d_z(n) = ∏_{p^a ∥ n} Ring.multichoose z a` for `n ≥ 1` and `0` at `0` (kontorovichtao-pntplus lines
3151–3212, Definition 9.1.3 and Theorems 9.1.12–9.1.15, for `z ∈ ℕ`; iwanieckowalski2004, (1.25);
tenenbaum2015, Chapter II.5). API:

- it is multiplicative; `d_0` is the unit `δ₁` of Dirichlet convolution, `d_1 = ζ`, `d_{−1} = μ`,
  and at `z = k : ℕ` it is the cast of `ζ ^ k`, the ordered `k`-fold factorization count;
- `d_z ⋆ d_w = d_{z+w}`: both sides are multiplicative (`ArithmeticFunction.IsMultiplicative.mul`),
  and at `p^a` the identity is
  `Σ_{i+j=a} Ring.multichoose z i · Ring.multichoose w j = Ring.multichoose (z + w) a`, the
  Chu–Vandermonde identity `Ring.add_choose_eq` at `−z, −w` multiplied by `(−1)^a` through
  `Ring.choose_neg'`;
- `|d_z(n)| ≤ d_{|z|}(n) ≤ (ζ ^ ⌈|z|⌉)(n)`;
- for `Re s > 1`, the series of `d_z` converges absolutely and
  `LSeries (generalizedDivisor z) s = exp(z · LSeries (Λ/log) s)`, the Euler-product power
  `ζ(s)^z`; this is `LSeries_generalizedDivisor` (kontorovichtao-pntplus lines 3173–3184,
  Theorems 9.1.11–9.1.12, for `z ∈ ℕ`; tenenbaum2015, Chapter II.5, for complex `z`). Route:
  absolute convergence from the majorant `|d_z| ≤ ζ ^ ⌈|z|⌉` of the previous item, whose series
  converges absolutely on `Re s > 1` by `ArithmeticFunction.LSeriesSummable_zeta_iff` and
  `ArithmeticFunction.LSeriesSummable_mul`; then `EulerProduct.eulerProduct_tprod` for the
  multiplicative `n ↦ d_z(n) n^{−s}` writes the series as the product over the primes of the local
  factors `Σ_a Ring.multichoose z a p^{−as}`. Since `‖p^{−s}‖ = p^{−Re s} < 1`, the local factor is
  `(1 − p^{−s})^{−z} = exp(−z log(1 − p^{−s}))` by
  `TauCeti.hasSum_multichoose_mul_geometric_complex_of_norm_lt_one` and
  `Complex.cpow_def_of_ne_zero`. The product of these exponentials is
  `exp(z Σ_p −log(1 − p^{−s}))` by `HasSum.cexp`, the sum converging by `Summable.clog_one_sub`, and
  `Σ_p −log(1 − p^{−s}) = LSeries (Λ/log) s` is `DirichletCharacter.eulerProduct_log_eq_LSeries`
  at the trivial character of level `1`;
- `LSeries.abscissaOfAbsConv (generalizedDivisor z) = 1` for `z ≠ 0`; this is
  `abscissaOfAbsConv_generalizedDivisor` (absolute convergence on `Re s > 1`: kontorovichtao-pntplus
  line 3173, Theorem 9.1.11, for `z ∈ ℕ`, and tenenbaum2015, Chapter II.5, for complex `z`; the
  divergence at `s = 1` is proved here by the route below); at `z = 0` the abscissa is `⊥`. Route:
  the upper bound from the previous item by
  `LSeries.abscissaOfAbsConv_le_of_forall_lt_LSeriesSummable`; for the lower bound,
  `d_z(p) = Ring.multichoose z 1 = z`, so at `s = 1` the terms at the primes have modulus `|z|/p`
  and the series diverges absolutely by `Nat.Primes.not_summable_one_div`, hence at every real
  `s ≤ 1` by `LSeriesSummable.of_re_le_re`.

**Checks.**

- `sigmaC 1 6 = 12 = ArithmeticFunction.sigma 1 6`, `sigmaC (−1) 6 = 2 = 12/6`, and
  `sigmaC (1/2) 4 = 3 + √2 ≈ 4.41421`. A definition with `d^{−ν}` would give `2` at `ν = 1`,
  `n = 6`.
- `abscissaOfAbsConv (sigmaC 2) = 3` and `abscissaOfAbsConv (sigmaC (−2)) = 1`: the formula
  `1 + Re ν` alone would give `−1` for `ν = −2`, but `σ_{−2}(p) ≥ 1`.
- At `s = 3`, `ν = 1`: `Σ σ(n) n^{−3} = ζ(3) ζ(2) ≈ 1.97730`.
- `sigmaC ν 0 = 0`, since `Nat.divisors 0 = ∅`; the series never sees the value at `0`.
- `generalizedDivisor (1/2) (p²) = 3/8`, and `d_{1/2} ⋆ d_{1/2}` at `p²` is
  `3/8 + 1/4 + 3/8 = 1 = ζ(p²)`; numerically `Σ d_{1/2}(n) n^{−2} ≈ 1.28255 ≈ √ζ(2)`.
- `generalizedDivisor 2 (p^a) = a + 1 = τ(p^a)` and `generalizedDivisor 3 4 = 6` (ordered
  factorizations; the unordered count is `2`), in agreement with AnalyticNumberTheoryPartI §3.3's
  `d_3`.
- At `z = k ∈ ℕ` the right side is `exp(k · LSeries (Λ/log) s) = ζ(s)^k` by
  `riemannZeta_eq_exp_LSeries`, and `generalizedDivisor k` is the cast of `ζ ^ k`, so the series
  statement agrees with ArithmeticDirichletSeriesPartII §5.1 (`LSeriesHasSum_zeta_pow`): at `k = 2`,
  `s = 2` both give `Σ τ(n) n^{−2} = ζ(2)² ≈ 2.70581` (the partial sum to `2·10⁵` is `2.70574`, with
  tail `≈ 7·10⁻⁵`). The binomial coefficient `Ring.choose z a` in place of the multiset coefficient
  would give `d_2(p²) = 1` instead of `τ(p²) = 3`.
- For complex `z = i` at `s = 3` the series is `≈ 0.98311 + 0.18300i = exp(i log ζ(3))`.
- The principal power `riemannZeta s ^ (1/2 : ℂ)` is not a correct model of
  `LSeries (generalizedDivisor (1/2)) s`: where `Im LSeries (Λ/log) s ∉ (−π, π]` the two square
  roots of `ζ(s)` differ by a sign; the definition through the Euler-product logarithm is required.
- At `z = 0` the series is `1` and its abscissa is `⊥`, so the hypothesis `z ≠ 0` of the abscissa
  statement is needed.

*Needs:* 11.1; Mathlib `ArithmeticFunction.sigma`, `ArithmeticFunction.zeta`, `Ring.multichoose`,
`Ring.add_choose_eq`, `Ring.choose_neg'`, `ArithmeticFunction.IsMultiplicative.mul`,
`Nat.factorization`, `LSeries_convolution'`, `ArithmeticFunction.LSeries_zeta_eq_riemannZeta`,
`ArithmeticFunction.LSeriesSummable_zeta_iff`, `ArithmeticFunction.LSeriesSummable_mul`,
`LSeriesSummable_of_le_const_mul_rpow`, `LSeriesSummable.of_re_le_re`,
`EulerProduct.eulerProduct_tprod`, `Complex.cpow_def_of_ne_zero`, `HasSum.cexp`,
`Summable.clog_one_sub`, `DirichletCharacter.eulerProduct_log_eq_LSeries`,
`riemannZeta_eq_exp_LSeries`, `riemannZeta_ne_zero_of_one_le_re`, `differentiableAt_riemannZeta`,
`LSeries.abscissaOfAbsConv`, `LSeries.abscissaOfAbsConv_le_of_forall_lt_LSeriesSummable`,
`Nat.Primes.not_summable_one_div`; Tau Ceti
`TauCeti.hasSum_multichoose_mul_geometric_complex_of_norm_lt_one`; AnalyticNumberTheoryPartI §3.3
and ArithmeticDirichletSeriesPartII §5.1 for the Checks.

### 11.3 Ramanujan's four-shift identity

Let `α, β ∈ ℂ` and `Re s > max(1, 1 + Re α, 1 + Re β, 1 + Re(α + β))`. Then
`Σ_n σ_α(n) σ_β(n) n^{−s}` converges absolutely and equals
`ζ(s) ζ(s − α) ζ(s − β) ζ(s − α − β)/ζ(2s − α − β)`, with `ζ(2s − α − β) ≠ 0` because
`Re(2s − α − β) > 2`; this is `LSeries_sigmaC_mul_sigmaC` (kontorovichtao-pntplus lines 3324–3329,
Theorem 9.1.33; iwanieckowalski2004, (1.28); titchmarsh1986, Chapter I). Route: both sides are
Euler products on the half-plane; compare the local factors, which are rational functions of
`X = p^{−s}`, `p^α`, `p^β`. Corollary for `Re s > 1`, by the same local comparison:
`Σ τ(n²) n^{−s}` converges absolutely and equals `ζ(s)³/ζ(2s)` (lines 3353–3363 and 3489–3494,
Theorems 9.1.36 and 9.1.50).

**Checks.**

- At `α = β = 0` the identity is AnalyticNumberTheoryPartI §3.24a, `Σ τ(n)² n^{−s} = ζ(s)⁴/ζ(2s)`
  on `Re s > 1` (kontorovichtao-pntplus line 3336, Theorem 9.1.34), whose half-plane is the one
  here at `α = β = 0`. The local factor `(1 − X)^{−4}(1 − X²) = (1 + X)/(1 − X)³` has coefficients
  `1, 4, 9, 16, 25 = (k + 1)²`, Part I's prime-power statement; the `p²`-coefficient is
  `10 − 1 = 9 = τ(p²)²`, and without the factor `ζ(2s)` it would be `10`.
- `(1 − X)^{−3}(1 − X²) = 1 + 3X + 5X² + ⋯` gives `τ(p²) = 3` and `τ(p⁴) = 5`; at `s = 3`,
  `Σ τ(n²) n^{−3} ≈ 1.70729 = ζ(3)³/ζ(6)`.
- Complex shifts: at `α = 0.3 + i`, `β = −0.2 + 0.5i`, `s = 2.6 + i` both sides are
  `≈ 2.4856 − 0.3646i`.
- The half-plane is needed: at `α = 2`, `β = 0`, real `s = 3` lies on the boundary
  `1 + Re α = 3`, and `Σ σ₂(n) τ(n) n^{−3} ≥ Σ_p 2(p² + 1)/p³ = ∞`.

*Needs:* 11.2; Mathlib Euler products (`EulerProduct.eulerProduct_tprod` via
`ArithmeticFunction.IsMultiplicative`), `riemannZeta_ne_zero_of_one_le_re`;
AnalyticNumberTheoryPartI §3.24a for the Check.

### 11.4 The series of `2^ω`, `μ²`, `λ` and `φ`

For `Re s > 1`: `Σ 2^{ω(n)} n^{−s} = ζ(s)²/ζ(2s)`, `Σ μ(n)² n^{−s} = ζ(s)/ζ(2s)` and
`Σ λ(n) n^{−s} = ζ(2s)/ζ(s)`; this is `LSeries_two_pow_omega_moebius_sq_liouville`. For `Re s > 2`:
`Σ φ(n) n^{−s} = ζ(s − 1)/ζ(s)`; this is `LSeries_totient` (kontorovichtao-pntplus lines 3454–3545
and 3605–3640, Theorems 9.1.49, 9.1.57, 9.1.68 and 9.1.70; iwanieckowalski2004, (1.31)–(1.33) and
(1.35); apostol1976, Chapter 11). The abscissas of absolute convergence are `1, 1, 1, 2`; this is
`abscissaOfAbsConv_two_pow_omega_moebius_sq_liouville_totient` (absolute convergence on the
half-planes: kontorovichtao-pntplus lines 3379–3393, Theorems 9.1.38–9.1.39, for `2^ω` through
`2^{ω(n)} ≤ τ(n)`; lines 3498–3500, Theorem 9.1.51, for `μ²`; lines 3626–3631, Theorem 9.1.70, for
`φ` through `φ(n) ≤ n`; for `λ` it is `|λ| ≤ 1`; the divergence at each abscissa is proved here by
the route below). Route: the upper bounds from `2^{ω(n)} ≤ τ(n) = (ζ ⋆ ζ)(n)`, whose series
converges absolutely on `Re s > 1` by `ArithmeticFunction.LSeriesSummable_zeta_iff` and
`ArithmeticFunction.LSeriesSummable_mul`, with
`LSeries.abscissaOfAbsConv_le_of_forall_lt_LSeriesSummable`; from `|μ²|, |λ| ≤ 1` by
`LSeries.abscissaOfAbsConv_le_of_le_const`; and from `φ(n) ≤ n` by
`LSeries.abscissaOfAbsConv_le_of_le_const_mul_rpow`. The lower bounds from the primes: at `s = 1`
the terms at `p` of the first three series have modulus `2/p`, `1/p` and `1/p`, and at `s = 2` that
of `φ` is `(p − 1)/p² ≥ 1/(2p)`, so `Nat.Primes.not_summable_one_div` and
`LSeriesSummable.of_re_le_re` exclude every smaller real abscissa. The coefficient functions are
Mathlib's `ArithmeticFunction.cardDistinctFactors` (in `n ↦ 2^{ω(n)}`),
`ArithmeticFunction.moebius`, `ArithmeticFunction.liouville` and `Nat.totient`, cast to `ℂ`; no new
carrier is introduced for `2^ω`.

**Checks.**

- Local factors: `(1 − X)^{−2}(1 − X²) = 1 + 2X + 2X² + ⋯` (`2^{ω(p^a)} = 2`),
  `(1 − X)^{−1}(1 − X²) = 1 + X`, `(1 − X)/(1 − X²) = 1 − X + X² − ⋯` (`λ(p^a) = (−1)^a`),
  `(1 − X)/(1 − pX) = 1 + (p − 1)X + (p² − p)X² + ⋯`.
- At `s = 3` the three series are `≈ 1.42031, 1.18156, 0.84634`, the values of `ζ(3)²/ζ(6)`,
  `ζ(3)/ζ(6)` and `ζ(6)/ζ(3)`; at `s = 4`, `Σ φ(n) n^{−4} ≈ 1.11063 = ζ(3)/ζ(4)`.
- The abscissa of `φ` is `2`, not `1`: `Σ φ(n) n^{−2} ≥ Σ_p (p − 1)/p² = ∞` (the blueprint records
  that a hypothesis `Re s > 1` is incorrect, kontorovichtao-pntplus line 3631).
- `μ²(n) = Σ_{d²|n} μ(d)` at `n = 12`: `μ(1) + μ(2) = 0 = μ²(12)`.

*Needs:* 11.1, 11.2; Mathlib `ArithmeticFunction.cardDistinctFactors`, `ArithmeticFunction.moebius`,
`ArithmeticFunction.liouville`, `Nat.totient`, Euler products, `LSeries.abscissaOfAbsConv`,
`ArithmeticFunction.LSeriesSummable_zeta_iff`, `ArithmeticFunction.LSeriesSummable_mul`,
`LSeriesSummable.of_re_le_re`, `LSeries.abscissaOfAbsConv_le_of_forall_lt_LSeriesSummable`,
`LSeries.abscissaOfAbsConv_le_of_le_const`, `LSeries.abscissaOfAbsConv_le_of_le_const_mul_rpow`,
`Nat.Primes.not_summable_one_div`; ProbabilisticAndMetricNumberTheory §0.1a (the multiplicativity
of `2^ω`).

### Examples

- `L(d_{1/2}, s)² = ζ(s)` on `Re s > 1`, from the convolution law and the Euler-product logarithm.
- At `s = 3`, `ν = 1`: `Σ σ(n) n^{−3} = ζ(3) ζ(2) ≈ 1.97730`.

### Dependencies

Mathlib arithmetic functions, `LSeries`, Euler products, `Ring.multichoose`;
ProbabilisticAndMetricNumberTheory §0.1a; AnalyticNumberTheoryPartI §§3.3 and 3.24a and
ArithmeticDirichletSeriesPartII §5.1 for Checks.

## Layer 12: Cesàro summability

### 12.1 The Hardy–Landau Tauberian theorem

Let `(a_n)` be real, `S_N = Σ_{n<N} a_n`, and suppose the Cesàro means `N⁻¹ Σ_{i<N} S_i` converge to
`S`. If `n a_n ≥ −K` for all `n` and some `K`, then `S_N → S`; this is
`tendsto_of_cesaro_of_mul_ge`. In a real normed space `E` the same holds for `a : ℕ → E` under
`n ‖a_n‖ ≤ K`; this is `tendsto_of_cesaro_of_norm_mul_le`, and completeness of `E` is not needed
because the limit `S` is given (estradavindas2012littlewood lines 32–35, the stronger one-sided
theorem of Hardy and Littlewood for Abel summability, which Cesàro summability implies; hardy1949,
the Tauberian theorems for Cesàro means). The converse, convergence implies Cesàro convergence, is
Mathlib's `Filter.Tendsto.cesaro`. Route (Landau's argument): for `H > N`,
`(H − N)⁻¹ Σ_{N≤k<H} S_k = σ_H + N(σ_H − σ_N)/(H − N)` in terms of the Cesàro means `σ`, while
`S_k ≥ S_N − K(k − N)/N` for `k > N`; with `H = ⌈N(1 + δ)⌉` this gives `limsup S_N ≤ S + Kδ`, and
the symmetric choice `H < N` gives `liminf S_N ≥ S − Kδ`; let `δ → 0`. The two-sided form uses norms
in the same estimate.

**Checks.**

- `a_n = (−1)^n`: the means tend to `1/2` but `S_N` alternates `1, 0`; here `n a_n` is unbounded
  below, so the hypothesis excludes it.
- `a_n = 1` for all `n` satisfies `n a_n ≥ 0` but the means diverge, so the hypothesis of Cesàro
  convergence is not implied by the one-sided bound.
- The condition is on `n a_n`, not on `a_n`: `a_n = (−1)^n/√n` for `n ≥ 1`, `a_0 = 0`, has
  `a_n → 0` and a convergent series, yet `n a_n` is unbounded below, so it lies outside the
  theorem; the theorem is a sufficient condition, not a characterization of convergent series.
- At `n = 0` the hypothesis reads `0 ≥ −K`, so it forces `K ≥ 0` and says nothing about `a_0`, as it
  should: changing `a_0` by `d` shifts every `S_N` with `N ≥ 1` by `d` and the `N`-th mean by
  `d(N − 1)/N`, so both limits move by `d`.

*Needs:* Mathlib `Filter.Tendsto.cesaro`, `Filter.Tendsto.cesaro_smul`, finite sums.

### Examples

- The Cesàro means of the partial sums of `Σ (−1)^n/(n + 1)` converge to `log 2`; with
  `n a_n ≥ −1` the theorem returns convergence, already known here.

### Dependencies

Mathlib only.

## Layer 13: arithmetic applications

### 13.1 Factorizations of `n!` into bounded factors

Define `factorialFactorCount B n` as the least `t` such that `n! = a₁⋯a_t` with integers
`1 ≤ a_i ≤ B` (such a factorization exists for `B ≥ n`: the factors `1, 2, …, n`; the value is the
junk `0` when none exists, which happens exactly when `B` is smaller than the largest prime at most
`n`). API, for `B ≥ max(n, 2)`:

- `factorialFactorCount B n ≤ n`, and `factorialFactorCount B n · log B ≥ log n!`;
- the count is antitone in `B` on `B ≥ n`;
- `factorialFactorCount (B²) n ≤ ⌈factorialFactorCount B n / 2⌉`, by pairing factors.

Prove, as `n → ∞`:

- `factorialFactorCount (n²) n = n/2 − n/(2 log n) + o(n/log n)`; this is
  `factorialFactorCount_sq_sub_isLittleO` (Erdős problem 392; ieantn-erdos392 lines 16–21, with
  the upper bound at lines 72–75 and the lower bound at lines 87–89);
- `factorialFactorCount n n = n − n/log n + o(n/log n)`; this is
  `factorialFactorCount_self_sub_isLittleO` (ieantn-erdos392 lines 25–26, with the upper bound at
  lines 62–65).

The upper bounds are kontorovichtao-pntplus lines 3096–3101 (Theorems 8.1.1–8.1.2): a factorization
into factors at most `n`, balanced by the waste-and-score argument of lines 2984–3095 (stated
below), and pairing for `n²`; their inputs are Legendre's formula, Chebyshev's bound
`θ(x) ≤ x log 4` and `π(n) ≤ √n + 2n log 4/log n` (Sublemma 8.1.16), and Stirling. The lower bounds
are `t log B ≥ log n!` with Stirling. Method background: alexeevetal2025factorial, §1 (the
neighbouring Erdős problem 391).

*The waste-and-score framework* (kontorovichtao-pntplus lines 2984–3095).
These are README targets, for a fixed `n ≥ 1`:

- An *approximate factorization* of `n!` is a finite multiset `A` of integers in `[1, n]`, of size
  `t = |A|`. Its *waste* is `Σ_{a∈A} log(n/a) ≥ 0`; its *balance* at a prime `p` is
  `v_p(∏_{a∈A} a) − v_p(n!) ∈ ℤ` (with `Nat.factorization`); its *total imbalance* is
  `Σ_{p≤n} |balance_p|`. Prove: total imbalance `0` gives `∏_{a∈A} a = n!` (primes above `n` divide
  neither side), and then `waste = t log n − log n!`.
- For a cutoff `L ∈ ℕ`, the *score* of `A` is its waste, plus `log n` if the total imbalance is
  nonzero, plus, for each prime `p ≤ n`: `balance_p · log p` if `balance_p > 0`;
  `|balance_p| · log L` if `balance_p < 0` and `p ≤ L`; `|balance_p| · log(n/p)` if `balance_p < 0`
  and `p > L`. A balanced `A` has score equal to its waste.
- Prove: if some prime `p ≤ n` has `balance_p ≠ 0`, there is an approximate factorization with
  smaller total imbalance and no larger score. Route, in three cases: divide a surplus prime out of
  a factor containing it (waste `+log p`, surplus term `−log p`); add a deficit prime `p > L` as a
  new factor (waste `+log(n/p)`, deficit term `−log(n/p)`); otherwise every deficit prime is at most
  `L`, and either the product of all deficit primes, counted with multiplicity, is at most `n` and
  is added as one factor (waste at most `log n`, against the `log n` for imbalance), or a greedy
  product `m ≤ n` of deficit primes into which no further deficit prime fits is added, so that
  `m > n/L` (waste `< log L`, against at least one deficit term `log L`). By induction on the total
  imbalance, every approximate factorization `A` and cutoff `L` give an exact factorization of `n!`
  into `t` factors at most `n` with `t log n ≤ log n! + score_L(A)`.
- *The initial factorization.* For integers `M, L ≥ 2` with `n > L²` and `⌊n/L⌋ > √n`, let `A₀`
  consist of `M` copies of each integer `m` with `n − ⌊n/M⌋ ≤ m < n` and
  `m ∈ Nat.smoothNumbers ⌊n/L⌋` (all prime factors `< ⌊n/L⌋`). Prove: `|A₀| ≤ n`; its waste is at
  most `n log(1/(1 − 1/M))`; and its balances satisfy `−⌊n/p⌋ ≤ balance_p ≤ 0` for `p ≥ ⌊n/L⌋`,
  `balance_p ≤ M` for `p > √n`, `balance_p ≥ −M` for `√n < p < ⌊n/L⌋`, `balance_p ≤ M log n/log 2`
  for every `p`, `balance_p ≥ −M log n/log 2` for `L < p ≤ √n`, and
  `balance_p ≥ −M log n − M L² π(n)` for `p ≤ L`. Route: Legendre's formula
  (`Nat.factorization_factorial`), at most `log n/log 2` powers of `p` dividing an integer up to
  `n`, at least `⌊⌊n/M⌋/p⌋` multiples of `p` among `⌊n/M⌋` consecutive integers, and, for `p ≤ L`,
  a count of the removed non-smooth integers, each a prime `q ≥ ⌊n/L⌋` times a cofactor `c ≤ n/q`.
- *The initial score.* Prove that `score_L(A₀)` is at most the sum of the five terms
  `n log(1/(1 − 1/M))`, `Σ_{p≤n/L} M log n`, `Σ_{p≤√n} M log² n/log 2`,
  `Σ_{n/L≤p≤n} (n/p) log(n/p)` and `Σ_{p≤L} (M log n + M L² π(n)) log L`, from the balance bounds
  and `log p + log(n/p) = log n`; and, for every `ε > 0`, that each of the five terms is at most
  `εn`: the first for `M` large in terms of `ε`; the second for `L` large in
  terms of `M` and `ε`, then `n` large in terms of `L`; the third for `n` large in terms of `M` and
  `ε`; the fourth for `n` large in terms of `L` and `ε` (each term is `O(L log L)` and
  `π(n) = o(n)`); the fifth for `n` large in terms of `M`, `L` and `ε`. The inputs are Chebyshev's
  `π(n) ≤ √n + 2n log 4/log n` and its consequence `π(n) = o(n)`. Hence for every `ε > 0` and all
  large `n` there are `M` and `L` with `score_L(A₀) ≤ εn`, and Stirling turns
  `t log n ≤ log n! + εn` into the upper bound of `factorialFactorCount n n`.

**Checks.**

- `factorialFactorCount 16 4 = 2` (`24 = 2 · 12`, and `24 > 16`) and `factorialFactorCount 4 4 = 3`
  (`24 = 2 · 3 · 4`, and two factors at most `4` give at most `16`); the lower bound
  `log 24/(2 log 4) ≈ 1.146` forces `t ≥ 2` in the first case.
- `factorialFactorCount B 0 = factorialFactorCount B 1 = 0`: `0! = 1! = 1` is the empty product.
- For `n = 5, …, 10` the counts with `B = n` are `4, 4, 5, 6, 7, 7`, against the lower bounds
  `log n!/log n ≈ 2.97, 3.67, 4.38, 5.10, 5.83, 6.56`; with `B = n²` they are `2, 2, 3, 3, 3, 4`.
- The main terms differ by the factor `2` between the two bounds, as `log(n²) = 2 log n` predicts; a
  statement with main term `n/2 − n/log n` for `B = n²` contradicts the lower bound
  `log n!/(2 log n) = n/2 − n/(2 log n) + O(1)`.
- Waste at `n = 4`: `A = {2, 3, 4}` is balanced, with waste `log 2 + log(4/3) = log(8/3) ≈ 0.981`,
  equal to `3 log 4 − log 24`.
- Reduction at `n = 4`, `L = 2`: `A = {4, 4}` has balance `+1` at `2` and `−1` at `3`, and score
  `log 4 + log 2 + log(4/3) = log(32/3) ≈ 2.367`. Dividing a `4` by `2` gives `{2, 4}` with the same
  score; adding the deficit prime `3 > L` gives the balanced `{2, 3, 4}` of score `log(8/3)`, and
  `3 log 4 = log 64 ≤ log 24 + log(32/3) = log 256`.
- The initial factorization at `n = 100`, `M = L = 2`: `A₀` is two copies of the `40` integers in
  `[50, 100)` other than the ten primes there, so `|A₀| = 80 ≤ 100`; its waste is `≈ 24.81`, below
  `100 log 2 ≈ 69.31`; its balances are `−1 = −⌊100/p⌋` at the ten primes `53, …, 97`, `+1` at
  `2, 11, 13, 17, 19, 29, 31` and `+4` at `3`, within the bounds above, and its score at `L = 2` is
  `≈ 55.33`, giving a factorization of `100!` into at most `91` factors at most `100`.

*Needs:* Mathlib `Nat.factorization_factorial`, `Nat.factorization`, `Nat.smoothNumbers`,
`Chebyshev.theta_le_log4_mul_x`, `Stirling.factorial_isEquivalent_stirling`,
`Stirling.le_factorial_stirling`.

### 13.2 Goldbach ranges

Define, for real `H`, `EvenGoldbachUpTo H`: every even `n` with `4 ≤ n ≤ H` is a sum of two primes;
and `OddGoldbachUpTo H`: every odd `n` with `7 ≤ n ≤ H` is a sum of three primes (primes may
repeat) (ieantn-goldbach-vocabulary lines 25–36 and 38–51, for natural `H`). For each fixed real
`H` both are decidable by a finite search over `n ≤ ⌊H⌋`. Prove:

- both are antitone in `H` as propositions (`H ≤ H′` and the statement at `H′` give it at `H`);
- the even range up to `H` gives the odd range up to `H + 3` (subtract the prime `3`;
  ieantn-goldbach lines 46–52);
- the interval transfer: let `x₀`, `H` and `Δ` be real, and suppose that for every natural number
  `x ≥ x₀` the interval `(x(1 − 1/Δ), x]` contains a prime (`1/Δ` is Mathlib's real division, `0` at
  `Δ = 0`). Then `EvenGoldbachUpTo H` and `OddGoldbachUpTo (x₀ + 4)` give
  `OddGoldbachUpTo ((H − 4)Δ + 4)`; this is `oddGoldbachUpTo_of_primeGaps` (the prime-ladder
  argument recalled in helfgottplatt2013 lines 27–31, with a multiplicative gap;
  ieantn-goldbach lines 54–73, for natural `x₀`, `H` and `Δ`). The hypothesis is needed at
  integers only, and there is no condition on `x₀` or `Δ`: for `Δ ≤ 0` the interval is empty at
  every natural `x ≥ max(x₀, 1)`, so the hypothesis fails. Route: for odd `n` with
  `x₀ + 4 < n ≤ (H − 4)Δ + 4` the integer `x = n − 4 ≥ 3` is at least `x₀`; the largest prime
  `p ≤ x` lies in the interval, since some prime does, and `p ≥ 3` because `3 ≤ x`; so `n − p` is
  even, `n − p ≥ 4`, and `n − p < 4 + x/Δ ≤ H` because `Δ > 0`.

The published verifications are named propositions that theorems take as hypotheses, never proved
here: `EvenGoldbachUpTo (4 · 10¹⁸)` (oliveiraesilva-herzog-pardi2014 lines 13–14) and
`OddGoldbachUpTo 8875694145621773516800000000000` (helfgottplatt2013 lines 9–10). The
short-interval prime statement is a hypothesis of the transfer; its explicit instances are the
theorems of ExplicitPrimeCounting Layer 7, each under that roadmap's named hypotheses (see the
Examples).

**Checks.**

- `EvenGoldbachUpTo 30` and `OddGoldbachUpTo 33` by finite computation (`30 = 7 + 23`,
  `33 = 3 + 7 + 23`).
- The lower limits are needed: `2` is not a sum of two primes and `5` is not a sum of three, so a
  definition starting at `2` or `5` makes the propositions false at every `H ≥ 2` or `H ≥ 5`.
- `EvenGoldbachUpTo 3` and `OddGoldbachUpTo 6` hold vacuously.
- Transfer with Bertrand (`Δ = 2`, `x₀ = 2`, so `x₀(1 − 1/Δ) = 1`): for every natural `x ≥ 2`,
  `Nat.exists_prime_lt_and_le_two_mul` at `⌊x/2⌋` puts a prime in `(x/2, x]`. `EvenGoldbachUpTo 30`
  and the vacuous `OddGoldbachUpTo 6` give `OddGoldbachUpTo 56`; for instance `55 = 3 + 5 + 47`, and
  a finite search confirms every odd `n ∈ [7, 56]`.
- The route takes the largest prime in the interval: at `Δ = 3/2`, `n = 9`, `x = 5`, the interval
  `(5/3, 5]` contains `2`, `3` and `5`; the choice `p = 2` leaves the odd `7`, while `p = 5` leaves
  `4 = 2 + 2`.

*Needs:* Mathlib `Nat.Prime`, `Even`, `Odd`; the published verifications only as hypotheses;
Mathlib `Nat.exists_prime_lt_and_le_two_mul` for the Check.

### Examples

- `EvenGoldbachUpTo (4 · 10¹⁸)` gives `OddGoldbachUpTo (4 · 10¹⁸ + 3)`, an instance of the
  elementary transfer.
- Schoenfeld's interval (ExplicitPrimeCounting §7.1, under its named hypotheses) gives the
  hypothesis of the interval transfer with `Δ = 16598` and `x₀ = 2 010 882`: for `x ≥ x₀` put
  `y = x(1 − 1/16598) ≥ 2 010 760.8 > 2 010 759.9`; then `y + y/16597 = x`, so `(y, x)` contains a
  prime. With `EvenGoldbachUpTo (4 · 10¹⁸)`, which gives `OddGoldbachUpTo (x₀ + 4)` by the
  elementary transfer, this yields `OddGoldbachUpTo ((4 · 10¹⁸ − 4) · 16598 + 4)`, about
  `6.639 · 10²²`.
- Ramaré–Saouter's interval (ExplicitPrimeCounting §7.2, under its named hypotheses: a prime in
  `(x(1 − 1/28 314 000), x]` for every `x > 10 726 905 041`) gives the hypothesis of the interval
  transfer with `Δ = 28 314 000` and `x₀ = 10 726 905 042`. With `EvenGoldbachUpTo (4 · 10¹⁸)`,
  which gives `OddGoldbachUpTo (x₀ + 4)` by the elementary transfer, this yields
  `OddGoldbachUpTo ((4 · 10¹⁸ − 4) · 28 314 000 + 4)`, that is
  `OddGoldbachUpTo 113 255 999 999 999 999 886 744 004`, hence `OddGoldbachUpTo (1.1325 · 10²⁶)` by
  antitonicity (ieantn-goldbach lines 91–98).
- Kadiri–Lumley's rows (ExplicitPrimeCounting §7.3, under its named hypotheses: for `x > e⁵⁹` a
  prime in `((1 − 1/1 946 282 821)x, x)`, for `x > e⁶⁰` one in `((1 − 1/1 966 196 911)x, x)`) extend
  the previous range in two transfers, each with `EvenGoldbachUpTo (4 · 10¹⁸)`. First the `e⁵⁹` row
  with `x₀ = e⁵⁹ + 1`, whose `OddGoldbachUpTo (x₀ + 4)` the previous Example supplies
  (`e⁵⁹ ≈ 4.201 · 10²⁵`), gives `OddGoldbachUpTo ((4 · 10¹⁸ − 4) · 1 946 282 821 + 4)`, about
  `7.785 · 10²⁷`; then the `e⁶⁰` row with `x₀ = e⁶⁰ + 1` (`e⁶⁰ ≈ 1.142 · 10²⁶`, inside that range)
  gives `OddGoldbachUpTo ((4 · 10¹⁸ − 4) · 1 966 196 911 + 4)`, about `7.865 · 10²⁷`
  (ieantn-goldbach lines 100–115, which also note that the Ramaré–Saouter step carries the range
  across to `e⁵⁹`). The `e⁶⁰` row cannot be applied directly after the Ramaré–Saouter step,
  since `1.1325 · 10²⁶ < e⁶⁰`.

### Dependencies

Mathlib, with the published computations as hypotheses; ExplicitPrimeCounting §§7.1–7.3 for the
Examples.

## Downstream consumers

- Prime number theorems with an error term: 10.2 turns a zero-free region of width `η` with a
  polylogarithmic bound into the error `x exp(−c ω_η(x))` for any Dirichlet series with a pole at
  `1`, and 10.3 supplies its hypotheses for the Hecke `L`-function of every ray class character; a
  wider region, such as a width of Vinogradov–Korobov shape `η(t) ≍ (log t)^{−2/3}(log log t)^{−1/3}`,
  gives the corresponding error with no further analysis.
- The inversion theorems of Layer 7 and the smoothing kernels of Layer 9 are general Mellin
  analysis for every consumer that sums an arithmetic function against a compactly supported or
  sharp weight.
- The rectangle theorems 8.1–8.1a, the L-shaped contour shift 8.1b, the derivative form of
  Borel–Carathéodory 8.2 and Landau's lemma 8.3 are general complex analysis for any consumer.
- The series and abscissas of Layer 11 serve every consumer that averages the classical
  arithmetic functions by contour integration, and 12.1 every consumer that upgrades Cesàro
  convergence to convergence.
- The transfer of 13.2 turns a verified even Goldbach range and a short-interval prime theorem
  into a verified odd Goldbach range.

## References

- `kontorovichtao-pntplus`: A. Kontorovich, T. Tao and contributors, *Prime Number Theorem And …*,
  blueprint (Apache-2.0 project), §§3.1, 4.1–4.6, 5.2–5.3, 8.1, 9.1.
- `platttrudgian2020`: D. J. Platt, T. S. Trudgian, *The error term in the prime number theorem*,
  arXiv:1809.03134v2, §1.
- `oliveiraesilva-herzog-pardi2014`: T. Oliveira e Silva, S. Herzog, S. Pardi, Math. Comp. 83 (2014),
  abstract.
- `helfgottplatt2013`: H. A. Helfgott, D. J. Platt, arXiv:1305.3062v2, abstract and §1.
- `alexeevetal2025factorial`: B. Alexeev et al., *Decomposing a factorial into large factors*,
  arXiv:2503.20170v4, §1.
- `estradavindas2012littlewood`: R. Estrada, J. Vindas, *Distributional versions of Littlewood's
  Tauberian theorem*, arXiv:1201.1408, §1.
- `dlmf-ch6`: N. M. Temme, NIST Digital Library of Mathematical Functions, Chapter 6, 6.2.19,
  6.12.5–6.12.8, §6.16.
- `montgomeryvaughan2007`: H. L. Montgomery, R. C. Vaughan, *Multiplicative Number Theory I*,
  Chapters 5–6 (cited by locator).
- `titchmarsh1986`: E. C. Titchmarsh, *The Theory of the Riemann Zeta-Function*, 2nd ed., Chapters I
  and III (cited by locator).
- `iwanieckowalski2004`: H. Iwaniec, E. Kowalski, *Analytic Number Theory*, (1.25), (1.28)–(1.33),
  (1.35), Chapter 5 (cited by locator).
- `tenenbaum2015`: G. Tenenbaum, *Introduction to Analytic and Probabilistic Number Theory*, 3rd ed.,
  Chapters II.4–II.5 (cited by locator).
- `apostol1976`: T. M. Apostol, *Introduction to Analytic Number Theory*, Chapters 2 and 11 (cited by
  locator).
- `hardy1949`: G. H. Hardy, *Divergent Series*, the Tauberian theorems for Cesàro means (cited by
  locator).
- `katznelson2004`: Y. Katznelson, *An Introduction to Harmonic Analysis*, 3rd ed., Chapter I, the
  periodic analogue of 7.1 and the theorem on convex coefficient sequences used in a Check of 7.4
  (cited by locator).
- `brown1967`: J. L. Brown, Jr., *On the error in reconstructing a non-bandlimited function by
  means of the bandpass sampling theorem*, J. Math. Anal. Appl. 18 (1967), 75–84,
  doi:10.1016/0022-247X(67)90183-7, Theorem 1 (cited by locator).
- `ieantn-brown1967`, `ieantn-contourintegration`, `ieantn-ch2v4`, `ieantn-erdos392`,
  `ieantn-goldbach` and `ieantn-goldbach-vocabulary`: T. Tao and contributors, *IEANTN: Integrated
  Explicit Analytic Number Theory Network*, Lean formalization project (Apache-2.0),
  <https://github.com/teorth/IEANTN>, at commit 466b41b28ecc224398cf53a99c5fe9618131398b. One key
  per file, each cited by line: the conclusions of the nodes Brown1967 v1 (7.4), ContourIntegration
  v1 (8.1a), CH2 v4 (8.1b), Erdos392 v1 (13.1) and Goldbach v1 (13.2), and the vocabulary file
  defining the two Goldbach predicates (13.2).

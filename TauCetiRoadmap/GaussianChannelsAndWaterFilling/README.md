# Roadmap: Gaussian channels and water-filling

**Summary.** An additive noise channel takes an input `X` and returns `Y = X + Z`. Its mutual
information `I(X; Y)` is the Kullback–Leibler divergence of the joint law of `(X, Y)` from the
product of its marginals, in nats, with `+∞` allowed. This roadmap computes and bounds it when the
noise, the input or both are Gaussian. The theorems concern mutual information and the
optimization problems it leads to, not codes, and use divergences only: no differential entropy.
The headline theorems are these.

- *Gaussian input is best for Gaussian noise.* For centred Gaussian noise of variance `N > 0`
  independent of an input with a finite second moment and variance at most `P`,
  `I(X; X + Z) ≤ (1/2) log (1 + P/N)`, with equality exactly when the input is Gaussian of
  variance `P`, with any mean.
- *Gaussian noise is worst for Gaussian input.* For a centred Gaussian input of variance `P > 0`
  and a noise of second moment at most `N > 0`, uncorrelated with the input but not necessarily
  independent of it, `I(X; X + Z) ≥ (1/2) log (1 + P/N)`, with equality exactly when the noise is
  centred Gaussian of variance `N` and independent of the input.
- *The vector channel.* For noise `N(0, S)` on `ℝ^n`, `S` positive definite, and an input with a
  finite second moment whose covariance matrix is at most `K` in the Loewner order,
  `I(X; X + Z) ≤ (1/2) log (det (K + S) / det S)`, with equality exactly for the Gaussian input
  with the same mean and covariance `K`.
- *Water-filling.* For `n` parallel channels with independent noises `N(0, N_i)`, all `N_i > 0`,
  and inputs whose second moments add up to at most `P`, the greatest mutual information is
  `(1/2) ∑ log (1 + p_i / N_i)` with `p_i = max(ν − N_i, 0)`, the level `ν` making the `p_i` add up
  to `P`. For `n ≥ 1` and `P ≥ 0` this allocation exists, is unique, and is the only maximizer of
  `∑ log (1 + p_i / N_i)` over the nonnegative allocations of total at most `P`.

The roadmap builds on Mathlib's divergence with its chain rule and data processing, Gaussian laws
with their characteristic functions, and disintegration; on Tau Ceti's kernel chain rule, change of
reference for divergences, and the density, covariance and convolution of multivariate Gaussians;
and on the tensorization of the divergence stated by MathematicalStatisticsNonparametric.
Layer 1 proves the golden formula and Gaussian divergences, Layer 2 the scalar theorems (with
Ihara's bound), Layer 3 the vector channel, water-filling and parallel channels.

## Conventions

- **Logarithms** are natural (`Real.log`). `klDiv μ ν : ℝ≥0∞` is Mathlib's divergence: `∞` unless
  `μ ≪ ν` and the log-likelihood ratio is `μ`-integrable.
- **Mutual information.** For a measure `ρ` on `α × β`, `mutualInfo ρ = klDiv ρ (ρ.fst.prod ρ.snd)`
  (Polyanskiy–Wu, Definition 3.1, p. 42).
- **Additive channels.** For a joint law `γ` of an input and a noise on `E × E`,
  `inputOutputLaw γ = γ.map (fun p ↦ (p.1, p.1 + p.2))` is the joint law of input and output.
  Independent `μ` and `ν` give `inputOutputLaw (μ.prod ν)`, with output marginal `μ ∗ ν`. Here `E`
  is `ℝ`, `EuclideanSpace ℝ ι` or `Fin n → ℝ` with the Borel σ-algebra; in 1.1 it is any
  finite-dimensional real normed space.
- **Gaussian laws** are Mathlib's `gaussianReal m v` (Dirac for `v = 0`) and
  `multivariateGaussian m S` (Dirac unless `S` is positive semidefinite); `B x` is
  `B.toEuclideanLin x`.
- **Moments.** `variance id μ` is `∫ (x − m)² dμ`, `m = ∫ x dμ`, when `x²` is integrable
  (`ProbabilityTheory.variance_eq_integral`) and `0` otherwise, so every statement using it
  assumes `x ↦ x²` integrable. `TauCeti.covMatrix μ` is the covariance matrix of the coordinates.
- **Water-filling.** For a finite type `ι`, `N : ι → ℝ` and `P : ℝ`, `IsWaterFilling N P p` says
  `∑ i, p i = P` and `p i = max (ν − N i) 0` for one `ν : ℝ` (not always unique) and all `i`.

## Layer 1: mutual information and Gaussian divergences

### 1.1 The golden formula for additive channels

Define `mutualInfo` and `inputOutputLaw`. Prove `lintegral_klDiv_map_add_eq`: for a
finite-dimensional real normed space `E` with its Borel σ-algebra and probability measures `μ`,
`ν`, `Q` on `E`,
`∫⁻ x, klDiv (ν.map (x + ·)) Q ∂μ = mutualInfo (inputOutputLaw (μ.prod ν)) + klDiv (μ ∗ ν) Q`
in `ℝ≥0∞`, with no finiteness assumption (Polyanskiy–Wu, Theorem 4.1, p. 67, for any channel;
the resulting bound `I ≤ ∫⁻ x, klDiv (ν.map (x + ·)) Q ∂μ` is their Corollary 4.2, p. 68).

Route. Let `κ` be the Markov kernel `x ↦ ν.map (x + ·)` (the image of
`Kernel.id ×ₖ Kernel.const E ν` under addition) and `ρ = inputOutputLaw (μ.prod ν)`. Both `ρ` and
`μ ⊗ₘ κ` give `A ×ˢ B` the mass `∫ x in A, ν ((x + ·) ⁻¹' B) ∂μ`, so they are equal, `ρ.fst = μ`
and `ρ.snd = μ ∗ ν`. As `μ.prod Q = μ ⊗ₘ Kernel.const E Q` (`Measure.compProd_const`),
`TauCeti.klDiv_compProd_right` turns the left side into `klDiv ρ (μ.prod Q)`. The swap
`MeasurableEquiv.prodComm` preserves divergences (`klDiv_map_le` both ways) and sends `μ.prod Q`
to `Q.prod μ` (`Measure.prod_swap`). With `ρ' = ρ.map Prod.swap`: `E` is Polish, hence standard
Borel, so `ρ' = ρ.snd ⊗ₘ ρ'.condKernel` (`Measure.disintegrate`), and `klDiv_compProd_eq_add`
with `Q.prod μ = Q ⊗ₘ Kernel.const E μ` gives
`klDiv ρ' (Q.prod μ) = klDiv ρ.snd Q + klDiv ρ' (ρ.snd.prod μ)`; swapping back, the last term is
`klDiv ρ (μ.prod ρ.snd) = mutualInfo ρ`.

**Checks.**
- For `μ` uniform on `{0, 1}`, `ν` of masses `1/3`, `2/3` at `0`, `1`, and two laws `Q` on
  `{0, 1, 2}`, both sides agree exactly.

*Needs:* Mathlib `Measure.compProd_const`, `Measure.prod_swap`, `MeasurableEquiv.prodComm`,
`klDiv_map_le`, `Measure.disintegrate`, `Measure.condKernel`, `klDiv_compProd_eq_add`; Tau Ceti
`TauCeti.klDiv_compProd_right`.

### 1.2 The divergence between Gaussian laws on the line

Prove `klDiv_gaussianReal_gaussianReal`: for `a, b : ℝ` and nonzero `s, t : ℝ≥0`,
`klDiv (gaussianReal a s) (gaussianReal b t) = ofReal (((a − b)²/t + log (t/s) + s/t − 1)/2)`
(Polyanskiy–Wu, Example 2.2, (2.7), p. 23).

Route. Both laws have positive Lebesgue densities (`gaussianReal_of_var_ne_zero`) and Lebesgue
measure is absolutely continuous with respect to each (`gaussianReal_absolutelyContinuous'`), so
they are mutually absolutely continuous with log-likelihood ratio, almost everywhere,
`(1/2) log (t/s) − (x − a)²/(2s) + (x − b)²/(2t)`. This polynomial is integrable under the first
law, so `toReal_klDiv_of_measure_eq` gives the divergence as its integral, and
`∫ (x − a)² = s`, `∫ (x − b)² = s + (a − b)²` (`integral_id_gaussianReal`,
`variance_id_gaussianReal`) give the formula; the value is finite (`klDiv_ne_top_iff`).

**Checks.**
- For `a = 1/2`, `s = 2`, `b = −1`, `t = 3` the integral of the density times the
  log-likelihood ratio, computed in closed form, equals the formula.
- `s ≠ 0` is needed: `gaussianReal a 0` is a Dirac mass, so the divergence is `∞`, while the
  formula reads `log (t/0) = 0` and is finite; likewise for `t = 0` the formula gives `0`.

*Needs:* Mathlib `gaussianReal_of_var_ne_zero`, `gaussianReal_absolutelyContinuous`,
`gaussianReal_absolutelyContinuous'`, `toReal_klDiv_of_measure_eq`, `klDiv_ne_top_iff`,
`integral_id_gaussianReal`, `variance_id_gaussianReal`.

### 1.3 The divergence between Gaussian laws on `ℝ^n`

Prove `klDiv_multivariateGaussian_multivariateGaussian`: for a finite type `ι` of cardinality
`n`, `a, b : EuclideanSpace ℝ ι` and positive definite `S`, `T`, the divergence of `N(a, S)`
from `N(b, T)` is `ofReal (D/2)` with
`D = ⟪a − b, T⁻¹ (a − b)⟫ + log (det T / det S) + tr (T⁻¹ S) − n` (Polyanskiy–Wu, Example 2.2,
(2.8), p. 23, derived in their Exercise I.8).

Route. `N(a, S)` has the density `(2π)^(−n/2) (det S)^(−1/2) exp (−⟪x − a, S⁻¹ (x − a)⟫/2)`
(`TauCeti.Probability.multivariateGaussian_eq_withDensity`,
`TauCeti.Probability.multivariateGaussianPDFReal`), positive as `det S > 0`
(`Matrix.PosDef.det_pos`). As in 1.2 the laws are mutually absolutely continuous, with ratio
`(1/2) log (det T / det S) − ⟪x − a, S⁻¹ (x − a)⟫/2 + ⟪x − b, T⁻¹ (x − b)⟫/2`. The mean of
`N(a, S)` is `a` and its covariance matrix `S` (`integral_id_multivariateGaussian`,
`TauCeti.Probability.covMatrix_multivariateGaussian`), so the trace formula
`TauCeti.integral_inner_toEuclideanLin_sub_integral_eq_trace_mul_covMatrix` gives
`∫ ⟪x − a, S⁻¹ (x − a)⟫ = n`; writing `x − b = (x − a) + (a − b)`, the cross term has mean zero,
so `∫ ⟪x − b, T⁻¹ (x − b)⟫ = tr (T⁻¹ S) + ⟪a − b, T⁻¹ (a − b)⟫`. Conclude as in 1.2.

**Checks.**
- For `a = (1, 0)`, `S = [[2, 1], [1, 1]]`, `b = (0, 2)`, `T = diag(1, 3)`, the integral of the
  log-likelihood ratio computed from the first two moments of `N(a, S)` equals the formula.
- For `ι` empty both laws are the Dirac mass at the only point and both sides are `0`. When
  exactly one of `S`, `T` is singular, that law has no density and the other has one, so the
  divergence is `∞`, while the formula is finite.

*Needs:* 1.2 (the same argument); Mathlib `integral_id_multivariateGaussian`,
`Matrix.PosDef.det_pos`, `Matrix.PosDef.inv`, `toReal_klDiv_of_measure_eq`; Tau Ceti
`TauCeti.Probability.multivariateGaussian_eq_withDensity`,
`TauCeti.Probability.multivariateGaussianPDFReal`,
`TauCeti.Probability.covMatrix_multivariateGaussian`,
`TauCeti.integral_inner_toEuclideanLin_sub_integral_eq_trace_mul_covMatrix`.

### Examples

- 1.3 for the law of `(X, X + Z)`, covariance `[[P, P], [P, P + N]]`, against `diag(P, P + N)`
  gives `log (1 + P/N)/2`.

### Dependencies

Mathlib's divergence, disintegration and Gaussian laws; Tau Ceti's chain rule and Gaussians.

## Layer 2: the scalar channel

### 2.1 Gaussian input is best for Gaussian noise

Prove `mutualInfo_gaussianNoise_le`: for a probability measure `μ` on `ℝ` with `x ↦ x²`
integrable and `P, N : ℝ≥0` with `N ≠ 0` and `variance id μ ≤ P`,
`mutualInfo (inputOutputLaw (μ.prod (gaussianReal 0 N))) ≤ ofReal (log (1 + P/N)/2)`, with
equality if and only if `μ = gaussianReal m P` for some `m : ℝ` (Polyanskiy–Wu, Theorem 5.11,
parts 1 and 2, p. 100, whose equality case names the centred Gaussian, the proof taking all means
zero; Example 3.3, p. 48, computes the Gaussian value).

Route. Let `m = ∫ x dμ`, `Q = gaussianReal m (P + N)`, `C = log (1 + P/N)/2`. The shifted noise
is `gaussianReal x N` (`gaussianReal_map_const_add`), and 1.2 gives its divergence from `Q` as
`ofReal (f x)`, `f x = ((x − m)²/(P + N) + log ((P + N)/N) + N/(P + N) − 1)/2 ≥ 0`. By
`ofReal_integral_eq_lintegral_ofReal` and `ProbabilityTheory.variance_eq_integral`,
`∫⁻ x, ofReal (f x) ∂μ = ofReal (C − δ)`, `δ = (P − variance id μ)/(2(P + N)) ≥ 0`, so by 1.1
`I + klDiv (μ ∗ gaussianReal 0 N) Q = ofReal (C − δ) ≤ ofReal C`: the bound. If `I = ofReal C`,
then `δ = 0` and `μ ∗ gaussianReal 0 N = Q` (`klDiv_eq_zero_iff`); by `charFun_conv` and
`charFun_gaussianReal`, `charFun μ t · exp (−N t²/2) = exp (i m t − (P + N) t²/2)`, and dividing by
the nonvanishing exponential and applying `Measure.ext_of_charFun`, `μ = gaussianReal m P`.
Conversely, for `μ = gaussianReal m' P`, `m = m'`, `δ = 0` and `μ ∗ gaussianReal 0 N = Q`
(`gaussianReal_conv_gaussianReal`), so `I = ofReal C`.

**Checks.**
- The input uniform on `{−1, 1}`, `P = N = 1`, gives a strict inequality: its output has fourth
  moment `1 + 6 + 3 = 10`, not the `12` of `N(0, 2)`, so the divergence term is positive.
- `N ≠ 0` is needed: for `N = 0`, `μ = N(0, 1)`, `P = 1`, the joint law sits on the diagonal, the
  mutual information is `∞`, and the right side is `ofReal (log (1 + 1/0)/2) = 0`.
- Integrability of `x²` is needed: for the standard Cauchy input and `P = 0`, the junk value
  `variance id μ = 0` makes the right side `0`, but the joint law is not the product of its
  marginals, so the mutual information is positive.

*Needs:* 1.1, 1.2; Mathlib `gaussianReal_map_const_add`, `ofReal_integral_eq_lintegral_ofReal`,
`ProbabilityTheory.variance_eq_integral`, `klDiv_eq_zero_iff`, `charFun_conv`,
`charFun_gaussianReal`, `Measure.ext_of_charFun`, `integral_id_gaussianReal`,
`variance_id_gaussianReal`, `gaussianReal_conv_gaussianReal`.

### 2.2 Gaussian noise is worst for Gaussian input

Prove `le_mutualInfo_of_uncorrelated`: for a probability measure `γ` on `ℝ × ℝ` (the joint law of
input and noise) and nonzero `P, N : ℝ≥0`, if `γ.fst = gaussianReal 0 P`, `p ↦ p.2²` is
`γ`-integrable, `∫ p.1 p.2 dγ = 0` and `∫ p.2² dγ ≤ N`, then
`ofReal (log (1 + P/N)/2) ≤ mutualInfo (inputOutputLaw γ)`, with equality if and only if
`γ = (gaussianReal 0 P).prod (gaussianReal 0 N)` (Polyanskiy–Wu, Theorem 5.11, part 3, p. 100).

Route. Let `ρ = inputOutputLaw γ`, `s = ∫ p.2² dγ`, `b = P/(P + N)`, `c = PN/(P + N) > 0`. Under
`ρ`, `∫ x² = P`, `∫ x y = P` (no correlation) and `∫ y² = P + s`. Let `R` be the image under the
swap of `ρ.snd ⊗ₘ κ`, `κ` the kernel `y ↦ gaussianReal (b y) c`, and `Π = ρ.fst.prod ρ.snd`. Both
have second marginal `ρ.snd` and Gaussian fibres of nonzero variance, so they are mutually
absolutely continuous and `llr R Π = ℓ` almost everywhere, with
`ℓ (x, y) = log (P/c)/2 − (x − b y)²/(2c) + x²/(2P)`. If `mutualInfo ρ = ∞` there is nothing to
prove. Otherwise `ρ ≪ Π` with integrable log-likelihood ratio (`klDiv_ne_top_iff`), so `ρ ≪ R`
and `TauCeti.llr_add_llr` gives `llr ρ R + ℓ = llr ρ Π`, `ρ`-almost everywhere. As `ℓ` is
`ρ`-integrable, integrating (`toReal_klDiv_of_measure_eq`) gives
`toReal (mutualInfo ρ) = toReal (klDiv ρ R) + ∫ ℓ dρ ≥ ∫ ℓ dρ`, and from the three moments
`∫ ℓ dρ = log (1 + P/N)/2 + (P/(2(P + N))) (1 − s/N) ≥ log (1 + P/N)/2`.

Equality forces `klDiv ρ R = 0` and `s = N`, so `ρ = R` (`klDiv_eq_zero_iff`). Under `R`,
`X − b Y` has law `gaussianReal 0 c` independent of `Y`, so `exp (−P t²/2) = φ (b t) exp (−c t²/2)`
for the characteristic function `φ` of `ρ.snd`; as `b ≠ 0` and `(P − c)/b² = P + N`,
`ρ.snd = gaussianReal 0 (P + N)` (`Measure.ext_of_charFun`). At `(x, y) ↦ α x + β y` the
characteristic functions of `R` and of `inputOutputLaw ((gaussianReal 0 P).prod (gaussianReal 0 N))`
are `exp (−((P + N)(β + α b)² + α² c)/2)` and `exp (−(P (α + β)² + N β²)/2)`, equal, so the laws
are equal (`Measure.ext_of_charFunDual`); `inputOutputLaw` is injective (`(x, z) ↦ (x, x + z)` is
a measurable equivalence), so `γ` is the product. Conversely, 2.1 for `gaussianReal 0 P` gives
equality.

**Checks.**
- `∫ p.1 p.2 = 0` is needed: for `P = 1`, `N = 2` and the noise `−X + W`, `W ~ N(0, 1)`
  independent of `X`, the noise has second moment `2`, the output `W` is independent of the
  input, and the mutual information is `0 < log (3/2)/2`.
- `γ.fst = gaussianReal 0 P` and `∫ p.2² ≤ N` are needed: the input `0`, or an independent noise
  `N(0, 4N)`, gives `0` or `log (1 + P/(4N))/2`, below `log (1 + P/N)/2`.
- Integrability of `p.2²` is needed: for `P = 1`, `N = 1/2` and the noise `G + C`, `G ~ N(0, 1)`
  and `C` standard Cauchy, independent of each other and of `X`, both integrals are junk `0`, and
  the output is `X + G` plus independent noise, so the mutual information is at most
  `log 2/2 < log 3/2` (data processing).
- `P ≠ 0` is needed for the equality case: for `P = 0` every noise gives mutual information `0`,
  the value of the right side. `N ≠ 0` too: for `N = 0`, `γ` is the product with
  `gaussianReal 0 0`, but the mutual information is `∞`.

*Needs:* 2.1; Mathlib `klDiv_ne_top_iff`, `toReal_klDiv_of_measure_eq`, `klDiv_eq_zero_iff`,
`gaussianReal_absolutelyContinuous`, `gaussianReal_absolutelyContinuous'`, `charFun_gaussianReal`,
`Measure.ext_of_charFun`, `Measure.ext_of_charFunDual`; Tau Ceti `TauCeti.llr_add_llr`.

### 2.3 Ihara's bound

Prove `mutualInfo_le_add_klDiv`: for probability measures `μ` (input) and `ν` (noise) on `ℝ`
with `x ↦ x²` integrable under both, `0 < variance id ν` and `variance id μ ≤ P`, `P : ℝ≥0`,
`I ≤ ofReal (log (1 + P/σ²)/2) + klDiv ν (gaussianReal m σ²)` for the mutual information `I`
of `inputOutputLaw (μ.prod ν)`, `σ² = variance id ν` and `m = ∫ z dν` (Polyanskiy–Wu,
Theorem 20.12, (20.6), p. 401, for `E X² ≤ P`, attributed there to Ihara; proof an exercise).

Route. Let `m'` be the mean of `μ`, `G = gaussianReal m σ²`, `Q = gaussianReal (m + m') (P + σ²)`.
If `klDiv ν G = ∞` there is nothing to prove; otherwise `ν ≪ G`. Translations are measurable
equivalences, so (`klDiv_map_le` both ways, `gaussianReal_map_const_add`)
`klDiv (ν.map (x + ·)) Q = klDiv ν R_x` with `R_x = gaussianReal (m + m' − x) (P + σ²)`. The
log-likelihood ratio of `G` against `R_x` is quadratic (1.2), hence integrable under `ν` and
`G` with equal integrals, as `ν` and `G` share mean and variance; the Pythagorean identity
`TauCeti.klDiv_eq_klDiv_add_klDiv` gives `klDiv ν R_x = klDiv ν G + klDiv G R_x`, and 1.2 gives
`klDiv G R_x = ofReal (((x − m')²/(P + σ²) + log ((P + σ²)/σ²) + σ²/(P + σ²) − 1)/2)`.
Integrating as in 2.1, `∫⁻ x, klDiv G R_x ∂μ = ofReal (log (1 + P/σ²)/2 − δ)` with
`δ = (P − variance id μ)/(2(P + σ²)) ≥ 0`, and 1.1 bounds `I` by the average of `klDiv ν R_x`.

**Checks.**
- Noise uniform on `[−√3, √3]` (variance `1`): the divergence term is `log (πe/6)/2 > 0`, since
  `π > 3` and `e > 2`.
- `0 < variance id ν` is needed: for `ν = δ₀`, `μ = N(0, 1)`, `P = 1`, the right side is
  `ofReal (log (1 + 1/0)/2) + klDiv δ₀ (gaussianReal 0 0) = 0`, and `I = ∞`. Integrability under
  `μ` is needed: the standard Cauchy input with `P = 0` and `ν = N(0, 1)` has right side `0`.
  Under `ν` it is the natural hypothesis; in Mathlib it also follows from `0 < variance id ν`
  (`ProbabilityTheory.variance_of_not_memLp`), so it is stated rather than left to a junk value.

*Needs:* 1.1, 1.2; Mathlib `klDiv_map_le`,
`gaussianReal_map_const_add`, `gaussianReal_absolutelyContinuous`,
`ofReal_integral_eq_lintegral_ofReal`, `ProbabilityTheory.variance_eq_integral`; Tau Ceti
`TauCeti.klDiv_eq_klDiv_add_klDiv`.

### Examples

- For `P, N > 0`, 2.1 and 2.2 make the pair of centred Gaussian input and noise a saddle point.

### Dependencies

Layer 1; Mathlib's Gaussian laws and characteristic functions; Tau Ceti's change of reference.

## Layer 3: vector channels and water-filling

### 3.1 The vector Gaussian channel under a covariance constraint

Prove `mutualInfo_multivariateGaussianNoise_le`: for a finite type `ι` of cardinality `n`, a
probability measure `μ` on `EuclideanSpace ℝ ι` with `x ↦ ‖x‖²` integrable, positive definite
`S` and a matrix `K` with `K − TauCeti.covMatrix μ` positive semidefinite,
`mutualInfo (inputOutputLaw (μ.prod (multivariateGaussian 0 S)))` is at most
`ofReal (log (det (K + S) / det S)/2)`, with equality if and only if
`μ = multivariateGaussian (∫ x dμ) K`. (Proved here; Polyanskiy–Wu, Theorem 2.8, p. 28, is the
maximum-entropy statement under the same constraint.)

Route. `C = TauCeti.covMatrix μ` is positive semidefinite (`TauCeti.posSemidef_covMatrix`), so
`K = (K − C) + C` is too and `K + S` is positive definite (`Matrix.PosDef.add_posSemidef`). Let
`m = ∫ x dμ`, `A = (K + S)⁻¹`, `Q = multivariateGaussian m (K + S)`. The shift of the noise by
`x` is `multivariateGaussian x S` (`TauCeti.Probability.map_affine_multivariateGaussian`), and
1.3 gives its divergence from `Q` as `ofReal (g x/2)`,
`g x = ⟪x − m, A (x − m)⟫ + log (det (K + S)/det S) + tr (A S) − n`. The trace formula gives
`∫ ⟪x − m, A (x − m)⟫ dμ = tr (A C)`, and `tr (A C) + tr (A S) = n − τ` with
`τ = tr (A (K − C))`, so by 1.1
`I + klDiv (μ ∗ multivariateGaussian 0 S) Q = ofReal (log (det (K + S)/det S)/2 − τ/2)`. With
`B` the square root of `M = K − C` (`CFC.sqrt_mul_sqrt_self`), `τ = tr (B A B)`
(`Matrix.trace_mul_comm`), the trace of a positive semidefinite matrix
(`Matrix.PosSemidef.conjTranspose_mul_mul_same`): `τ ≥ 0`, the bound; and `τ = 0` gives
`B A B = 0` (`Matrix.PosSemidef.trace_eq_zero_iff`), so `B = 0` as `A` is positive definite, and
`C = K`. At equality also `μ ∗ multivariateGaussian 0 S = Q`, so by `charFun_conv` and
`charFun_multivariateGaussian`, `charFun μ t · exp (−⟪t, S t⟫/2)` equals
`exp (i ⟪t, m⟫ − ⟪t, (K + S) t⟫/2)` and `μ = multivariateGaussian m K` (`Measure.ext_of_charFun`).
Conversely, for that `μ`, `C = K` and `μ ∗ multivariateGaussian 0 S = Q`
(`TauCeti.Probability.multivariateGaussian_conv_multivariateGaussian`).

**Checks.**
- For `K = [[2, 1], [1, 2]]` and `S` equal to `1` or `[[2, 1], [1, 3]]`, 1.3 for the Gaussian law
  on `ℝ⁴` of covariance `[[K, K], [K, K + S]]` against the product of its marginals gives
  `(1/2) log (det (K + S)/det S)`, and `tr ((K + S)⁻¹ S) + tr ((K + S)⁻¹ K) = 2`.
- Positive definiteness of `S` is needed: for `ι = Fin 1`, `S = 0`, `μ = N(0, 1)`, `K = 1`, the
  mutual information is `∞` and the right side `ofReal (log (1/0)/2) = 0`. Integrability of
  `‖x‖²` is needed: for the standard Cauchy input on `Fin 1`, `S = 1` and `K = 0`, the junk
  covariance `0` meets the constraint, the right side is `0` and the mutual information is not.
  The constraint is needed: `N(0, 2K)` gives `(1/2) log (det (2K + S)/det S)`, larger.

*Needs:* 1.1, 1.3; Mathlib `Matrix.PosDef.add_posSemidef`, `Matrix.PosDef.inv`,
`Matrix.trace_mul_comm`, `CFC.sqrt_mul_sqrt_self`, `Matrix.PosSemidef.conjTranspose_mul_mul_same`,
`Matrix.PosSemidef.trace_eq_zero_iff`, `ofReal_integral_eq_lintegral_ofReal`,
`klDiv_eq_zero_iff`, `charFun_conv`, `charFun_multivariateGaussian`, `Measure.ext_of_charFun`,
`integral_id_multivariateGaussian`; Tau Ceti `TauCeti.posSemidef_covMatrix`,
`TauCeti.integral_inner_toEuclideanLin_sub_integral_eq_trace_mul_covMatrix`,
`TauCeti.Probability.map_affine_multivariateGaussian`,
`TauCeti.Probability.covMatrix_multivariateGaussian`,
`TauCeti.Probability.multivariateGaussian_conv_multivariateGaussian`.

### 3.2 The water-filling allocation exists and is unique

Define `IsWaterFilling`. Prove `existsUnique_isWaterFilling`: for a nonempty finite type `ι`,
every `N : ι → ℝ` and every `P ≥ 0` there is exactly one `p` with `IsWaterFilling N P p`.
(Proved here; Boyd–Vandenberghe, Example 5.2, pp. 245–246, treat positive levels and total `1`.)

Route. `F ν = ∑ i, max (ν − N i) 0` is continuous and nondecreasing. For `ν₀ = min N`,
`F ν₀ = 0 ≤ P ≤ F (ν₀ + P)`, so `intermediate_value_Icc` gives `ν` with `F ν = P`, and
`p i = max (ν − N i) 0` is water-filling. If `p`, `p'` are water-filling with levels `ν ≤ ν'`,
then `p ≤ p'` coordinatewise; both add up to `P`, so `p = p'`.

**Checks.**
- `N = (1, 2, 4)`: `P = 1` gives level `2` and `p = (1, 0, 0)`, the second channel exactly at the
  level and off; `P = 4` gives `7/2` and `(5/2, 3/2, 0)`; `P = 0` gives `0` for every level `≤ 1`.
- Ties `N = (1, 1, 3)`: `P = 2` gives `(1, 1, 0)`; `P = 5` gives `(7/3, 7/3, 1/3)`. Nonemptiness
  is needed (for `ι` empty and `P = 1` the sum is `0`), and so is `P ≥ 0`.

*Needs:* Mathlib `intermediate_value_Icc`.

### 3.3 Water-filling is optimal

Prove `isMaxOn_iff_isWaterFilling`: for a nonempty finite type `ι`, `N` with every `N i > 0`,
every `P : ℝ` and `p`, `p` lies in `F = {q | (∀ i, 0 ≤ q i) ∧ ∑ i, q i ≤ P}` and maximizes
`q ↦ ∑ i, log (1 + q i / N i)` on `F` if and only if `IsWaterFilling N P p`. (Proved here;
Boyd–Vandenberghe, Example 5.2, pp. 245–246, solve the conditions of Karush, Kuhn and Tucker
for total `1`; Polyanskiy–Wu, Theorem 20.14, p. 402.)

Route. For `P < 0` both sides are false: `F` is empty and no allocation of nonnegative entries
adds up to `P`. Sufficiency: let `p` be water-filling with level `ν`; then `p ∈ F`. If `P = 0`,
`F = {0}`.
If `P > 0`, some `p i > 0`, so `ν > N i > 0`. For `q ∈ F`,
`log (1 + q i/N i) − log (1 + p i/N i) ≤ (q i − p i)/(N i + p i)`
(`Real.log_le_sub_one_of_pos`); if `p i > 0` then `N i + p i = ν`, and if `p i = 0` then
`N i ≥ ν` and `q i/N i ≤ q i/ν`. Summing, the objective at `q` exceeds that at `p` by at most
`(∑ i, q i − P)/ν ≤ 0`. Necessity: the objective is strictly concave on the convex set `F`, each
term being strictly concave in one coordinate (`strictConcaveOn_log_Ioi`) and distinct points
differing in some coordinate. By 3.2 and sufficiency there is a water-filling maximizer, and a
maximizer is unique (`StrictConcaveOn.eq_of_isMaxOn`).

**Checks.**
- For `N = (1, 2, 4)` with `P = 0, 1, 4`, `N = (1, 1, 3)` with `P = 2, 5`, and `N = (3)` with
  `P = 2`, no point of the grid of step `1/8` in `F` has a larger product `∏ (1 + q i/N i)`, and
  `∑ (q i − p i)/(p i + N i) ≤ 0` on the grid of step `1/4`.
- `N i > 0` is needed: for `N = (0, 1)`, `P = 1`, `q/0 = 0` makes the objective `log (1 + q 2)`,
  maximized at `(0, 1)`; the water-filling allocation is `(1, 0)`. Nonemptiness is needed: for
  `ι` empty and `P = 1` the empty allocation is a maximizer.

*Needs:* 3.2; Mathlib `Real.log_le_sub_one_of_pos`, `strictConcaveOn_log_Ioi`,
`StrictConcaveOn.eq_of_isMaxOn`.

### 3.4 Parallel Gaussian channels

Prove `isGreatest_mutualInfo_parallel`: for `n : ℕ`, `N : Fin n → ℝ≥0` with every `N i ≠ 0`,
`P : ℝ` and `p` with `IsWaterFilling N P p`, `ofReal (∑ i, log (1 + p i/N i)/2)` is the
greatest value of `mutualInfo (inputOutputLaw (μ.prod Z))`, for the noise
`Z = Measure.pi fun i ↦ gaussianReal 0 (N i)`, over the probability measures `μ` on `Fin n → ℝ`
with every `x ↦ (x i)²` integrable and `∑ i, ∫ (x i)² dμ ≤ P`. (Proved here; Polyanskiy–Wu,
Theorem 20.14, p. 402.)

Route. Every `p i ≥ 0`. Let `Q = Measure.pi (i ↦ gaussianReal 0 (p i + N i))` and
`q i = ∫ (x i)² dμ`. The shift `Z.map (x + ·)` is `Measure.pi (i ↦ gaussianReal (x i) (N i))`
(`Measure.pi_map_pi`, `gaussianReal_map_const_add`), so its divergence from `Q` is the sum over
`i` of the divergences of the factors (MathematicalStatisticsNonparametric 1.3, `klDiv_pi`), each
given by 1.2: `ofReal (((x i)²/(p i + N i) + log ((p i + N i)/N i) + N i/(p i + N i) − 1)/2)`.
Integrating, the average is `ofReal (V + ∑ i, (q i − p i)/(2(p i + N i)))` with
`V = ∑ i, log (1 + p i/N i)/2`, and the sum is at most `0` by the sufficiency computation of 3.3
applied to `q` (if `P = 0` then `p = q = 0`); 1.1 gives the bound. It is attained by
`μ* = Measure.pi (i ↦ gaussianReal 0 (p i))`, whose coordinates have second moments `p i`
(`measurePreserving_eval`, `integral_id_gaussianReal`, `variance_id_gaussianReal`): through
`measurePreserving_arrowProdEquivProdArrow`, `μ*.prod Z` is the product over `i` of the pairs of
factors, so `μ* ∗ Z = Measure.pi (i ↦ gaussianReal 0 (p i) ∗ gaussianReal 0 (N i)) = Q`
(`Measure.pi_map_pi`, `gaussianReal_conv_gaussianReal`); with `q = p` and `klDiv Q Q = 0`, 1.1
gives the value.

**Checks.**
- `N = (1, 2, 4)`, `P = 4`: the value is `log (49/8)/2`; the equal split `(4/3, 4/3, 4/3)` gives
  `log (140/27)/2`, smaller since `140 · 8 < 49 · 27`.
- `N i ≠ 0` is needed: for `n = 1`, `N = 0`, `P = 1`, the input `N(0, 1)` gives `∞`, more than the
  value `ofReal (log (1 + 1/0)/2) = 0`. Without the integrability in the set, a Cauchy input with
  junk second moment `0` would be admitted for `P = 0` with positive mutual information.

*Needs:* 1.1, 1.2, 3.3 (the sufficiency computation); MathematicalStatisticsNonparametric 1.3
(`klDiv_pi`); Mathlib `Measure.pi_map_pi`, `measurePreserving_eval`,
`measurePreserving_arrowProdEquivProdArrow`, `gaussianReal_map_const_add`,
`gaussianReal_conv_gaussianReal`, `integral_id_gaussianReal`, `variance_id_gaussianReal`,
`ofReal_integral_eq_lintegral_ofReal`.

### Examples

- Noise levels `1`, `2`, `4` and total power `1`: all the power goes to the quietest channel and
  the greatest mutual information is `log 2/2`.

### Dependencies

Layers 1 and 2; Mathlib's product measures and convexity; MathematicalStatisticsNonparametric 1.3.

## Scope and ownership

This roadmap owns `mutualInfo`, `inputOutputLaw`, `IsWaterFilling` and the ten theorems above.
In the libraries and not targets: the divergence with its chain rules, data processing
and Csiszár's Pythagorean identity, and Gaussian laws with their characteristic functions,
convolutions, densities and covariance matrices (Mathlib and Tau Ceti).

- MathematicalStatisticsNonparametric 1.3 states the tensorization `klDiv_pi`, used in 3.4,
  `klDiv_gaussianReal` for a common variance, the case `s = t` of 1.2, and
  `klDiv_multivariateGaussian`, the case `ι = Fin d`, `S = T = v • 1` of 1.3; its 2.4 defines the
  mutual information of a uniformly distributed finite index for Fano's inequality.
- DiffusionReverseStepKLBound 1.2 states how the divergence from an isotropic Gaussian reference
  changes when its centre moves; the route of 2.3 uses instead Tau Ceti's Csiszár identity for a
  reference with the mean and variance of the noise.
- DenoisingDiffusion 1.1 states the divergence between isotropic Gaussian laws, the case
  `S = u • 1`, `T = v • 1` of 1.3.
- KalmanFiltering and Tau Ceti's Gaussian conditioning own the estimation of Gaussian vectors.
- ProbabilisticAndMetricNumberTheory §5.2 defines a mutual information of labels by entropies.

Not treated here: coding theorems; finite alphabets; mutual information and minimum mean squared
error; the matched filter and other linear filters; differential entropy and the entropy power
inequality; channel matrices and colored-noise water-filling; continuous-time channels.

## Exact supplier contracts

### From Mathlib

- `InformationTheory/KullbackLeibler/`: `klDiv`, `klDiv_eq_zero_iff` (finite measures),
  `klDiv_ne_top_iff` (`≠ ∞ ↔ μ ≪ ν ∧ Integrable (llr μ ν) μ`), `toReal_klDiv_of_measure_eq`
  (`μ ≪ ν`, equal masses: `∫ llr μ ν dμ`) in `Basic.lean`; `klDiv_compProd_eq_add` (finite
  measures, Markov kernels) in `ChainRule.lean`; `klDiv_map_le` (measurable map) in
  `DataProcessing.lean`.
- `Measure.compProd_const`; `Measure.condKernel` (finite, nonempty standard Borel second
  factor); `Measure.disintegrate`; `MeasurableEquiv.prodComm`; `Measure.prod_swap` (s-finite).
- `MeasureTheory/Measure/CharacteristicFunction/Basic.lean`: `Measure.ext_of_charFun` (finite
  measures, complete second-countable real inner product space, Borel), `Measure.ext_of_charFunDual`
  (normed space), `charFun_conv`.
- `Probability/Distributions/Gaussian/Real.lean`: `gaussianReal_of_var_ne_zero`,
  `gaussianReal_absolutelyContinuous`, `gaussianReal_absolutelyContinuous'` (variance `≠ 0`),
  `gaussianReal_map_const_add`, `charFun_gaussianReal`, `gaussianReal_conv_gaussianReal`,
  `integral_id_gaussianReal`, `variance_id_gaussianReal`; `Multivariate.lean`:
  `multivariateGaussian`, `charFun_multivariateGaussian` (positive semidefinite `S`),
  `integral_id_multivariateGaussian`.
- `ProbabilityTheory.variance_eq_integral`, `ProbabilityTheory.variance_of_not_memLp`
  (a.e.-measurable); `ofReal_integral_eq_lintegral_ofReal` (integrable, a.e. nonnegative);
  `Measure.pi_map_pi` (σ-finite images), `measurePreserving_eval`
  (probability factors), `measurePreserving_arrowProdEquivProdArrow`.
- `intermediate_value_Icc`, `Real.log_le_sub_one_of_pos`, `strictConcaveOn_log_Ioi`,
  `StrictConcaveOn.eq_of_isMaxOn`; `Matrix.PosDef.inv`, `Matrix.PosDef.det_pos`,
  `Matrix.PosDef.add_posSemidef`, `Matrix.PosSemidef.conjTranspose_mul_mul_same`,
  `Matrix.PosSemidef.trace_eq_zero_iff`, `Matrix.trace_mul_comm`, `CFC.sqrt_mul_sqrt_self`.

### From Tau Ceti

- `InformationTheory/KullbackLeibler/ChainRule.lean`: `TauCeti.klDiv_compProd_right` (finite
  measure and kernels, countably generated: `klDiv (μ ⊗ₘ κ) (μ ⊗ₘ η) = ∫⁻ a, klDiv (κ a) (η a) ∂μ`).
- `InformationTheory/KullbackLeibler/ChangeOfReference.lean`: `TauCeti.llr_add_llr` (σ-finite,
  `γ ≪ π ≪ R`: `llr γ π + llr π R = llr γ R`, `γ`-a.e.); `TauCeti.klDiv_eq_klDiv_add_klDiv`
  (finite, `γ ≪ π ≪ R`, `llr π R` integrable under `γ` and `π` with equal integrals).
- `Probability/Moments/Covariance.lean`: `TauCeti.covMatrix`, `TauCeti.posSemidef_covMatrix`
  and `TauCeti.integral_inner_toEuclideanLin_sub_integral_eq_trace_mul_covMatrix` (both for
  `MemLp id 2`; the latter: the mean of `⟪B (x − m), x − m⟫` is `tr (B C)`).
- `Probability/Distributions/Gaussian/`: `TauCeti.Probability.multivariateGaussian_eq_withDensity`
  (`S` positive definite), `TauCeti.Probability.multivariateGaussianPDFReal`,
  `TauCeti.Probability.covMatrix_multivariateGaussian`,
  `TauCeti.Probability.multivariateGaussian_conv_multivariateGaussian`,
  `TauCeti.Probability.map_affine_multivariateGaussian` (positive semidefinite covariances).

### From TauCetiRoadmap.MathematicalStatisticsNonparametric

- 1.3, `klDiv_pi`: for probability measures `P Q : Fin n → Measure X`,
  `klDiv (Measure.pi P) (Measure.pi Q) = ∑ i, klDiv (P i) (Q i)`.

## References

- Y. Polyanskiy and Y. Wu, *Information Theory: From Coding to Learning*, Cambridge University
  Press; prepublication version of August 16, 2024, with the numbering of the printed book,
  freely available from the first author's web page (people.lids.mit.edu/yp/homepage).
  Definition 3.1 (p. 42); Example 2.2, (2.7) and (2.8) (p. 23); Theorem 2.8 (p. 28); Example 3.3
  (p. 48); Theorem 4.1 (p. 67); Corollary 4.2 (p. 68); Theorem 5.11 (p. 100); Theorems 20.12
  (p. 401) and 20.14 (p. 402).
- S. Boyd and L. Vandenberghe, *Convex Optimization*, Cambridge University Press, 2004 (open copy
  at web.stanford.edu/~boyd/cvxbook): Example 5.2, water-filling, pp. 245–246.

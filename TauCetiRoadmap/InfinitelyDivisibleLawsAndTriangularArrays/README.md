# Roadmap: Infinitely divisible laws and triangular arrays

**Summary.** This roadmap builds the classical limit theory of sums of independent real random
variables: which laws can arise as limits of row sums of triangular arrays, how such laws are
described, and when a given array or i.i.d. sequence converges to a given limit.

- Characteristic functions on the line: interval inversion and the atom formula, locally uniform
  convergence under weak convergence, and the convergence-of-types theorem.
- Infinitely divisible laws: nonvanishing characteristic functions, the distinguished logarithm,
  unique roots, closure under convolution and weak limits, compound Poisson approximation, and the
  impossibility of bounded support.
- The Lévy–Khintchine formula with a fixed truncation: existence and uniqueness of the triplet, its
  behaviour under affine maps, the finite-variance form, Doeblin's criterion for atoms, the
  half-line case, and the Lévy measure as a limit of scaled roots.
- Convergence of infinitely divisible laws through their triplets, and the general limit theorem
  for infinitesimal arrays (Khintchine, Doeblin, Gnedenko), with its Gaussian and Poisson cases and
  Feller's converse to Lindeberg's theorem.
- Regular variation (the uniform convergence theorem and Karamata's theorem), Feller's weak laws,
  stable laws and their indices, stable laws as the limits of normalized i.i.d. sums, and domains
  of attraction.
- Self-decomposable laws and infinite divisibility on the nonnegative integers.

The nearest roadmaps are MathematicalStatisticsAsymptotic, which supplies the sufficiency half of
the Lindeberg–Feller theorem that this roadmap complements with Feller's converse;
StandardDistributions, whose stable laws in a fixed parametrisation serve here as the examples
that the classification of Layer 7 identifies; and FreeProbability, whose free infinite
divisibility is the free analogue of Layers 2–5 and shares no target with them. The roadmap is a
multi-source synthesis of Kallenberg, Klenke, Petrov, Durrett, Billingsley, Loève, Resnick and
Applebaum; the layers follow the proof dependencies of the subject, not the order of any one book.

[Suggested.lean](Suggested.lean) states, against the pinned Mathlib and Tau Ceti and each with
`sorry`, the headlines below that carry a Lean name, each with every conclusion this README
attaches to it, together with the definitions their statements need. It is not an exhaustive
acceptance test: the other headlines of this README are targets of the same standing, stated in
prose with their locators or proof routes.

Suggested home: `TauCeti/Probability/InfinitelyDivisible/` for Layers 2–5 and 7–8,
`TauCeti/Analysis/RegularVariation/` for Layer 6, and
`TauCeti/MeasureTheory/Measure/CharacteristicFunction/` for Layer 1.

## How to read the build

Layer 1 completes the characteristic-function toolkit on the line that the rest of the roadmap
uses: inversion identifies a law from its characteristic function on intervals, and convergence of
types controls affine normalisations. Layer 2 defines infinite divisibility through independent
sums and builds the distinguished logarithm, which every subsequent layer needs to take `n`-th roots
and logarithms of characteristic functions. Layer 3 proves the Lévy–Khintchine formula; Layer 4
turns weak convergence of infinitely divisible laws into convergence of triplets, and §§3.6–3.7
use its theorem to identify the Lévy measure from the roots (§4.1 needs only §§2.2 and 3.2, so
there is no cycle). Layer 5 applies Layer 4 to infinitesimal triangular arrays through the compound
Poisson approximation. Layer 6 is
independent real analysis (regular variation) and is used only by Layer 7, which treats i.i.d.
sums: weak laws, stable laws and domains of attraction. Layer 8 is two independent applications of
Layer 3.

Each subsection states its targets, a locator in at least one source (with the printed page) or a
proof route, and a *Needs:* line. Each layer ends with **Checks.**, *Examples* and
*Dependencies*.

## Conventions

- Laws are probability measures on `ℝ`, written as `Measure ℝ` with an
  `IsProbabilityMeasure` instance, or as elements of `ProbabilityMeasure ℝ` where weak convergence
  is meant; weak convergence is convergence in the topology of `ProbabilityMeasure ℝ`. The
  characteristic function is Mathlib's `charFun μ t = ∫ exp (i t x) dμ`.
- The law of the sum of `n` independent draws from `μ` is `iidSumLaw μ n`, the push-forward of
  the product law `Measure.pi` under the sum map. A law is infinitely divisible when it is such a
  sum for every `n ≥ 1`; on `ℕ` (§8.2) the summands are `ℕ`-valued.
- A Lévy–Khintchine triplet `(b, σ², ν)` uses the truncation `1{|x| ≤ 1}`, as in Kallenberg.
  Klenke truncates with `1{|x| < 1}`; the two drifts differ by `∫_{|x| = 1} x dν`, and the Checks
  of Layer 3 test the difference. The Lévy measure satisfies `ν {0} = 0` and
  `∫ min 1 x² dν < ∞`, stated with `∫⁻`; its total mass may be infinite.
- Convergence of Lévy measures is `TendstoAwayFromZero`: convergence of `∫ f dνₙ` for bounded
  continuous `f` vanishing on a neighbourhood of `0`. It is equivalent to Kallenberg's vague
  convergence on `[-∞, ∞] ∖ {0}` for the measures that occur, and it avoids the extended line.
- A triangular array has rows `X n j`, `j : Fin (m n)`, on probability spaces `(Ω n, μ n)`, as in
  [MathematicalStatisticsAsymptotic](../MathematicalStatisticsAsymptotic/README.md) §1.2.
  Convergence of row sums is Mathlib's `TendstoInDistribution` with limit `id` on `(ℝ, ν)`.
  Independence within rows is `iIndepFun`. The truncation at level `1` is `truncOne`; Kallenberg's
  `Var(ξ; |ξ| ≤ 1)` is the variance of `truncOne ξ`.
- An i.i.d. sequence is `X : ℕ → Ω → ℝ` with `iIndepFun X P` and `IdentDistrib (X i) (X 0) P P`.
  Convergence in probability is Mathlib's `TendstoInMeasure`. Domains of attraction are stated on
  the product space `Fin n → ℝ` under `Measure.pi`.
- Moments and masses that can be infinite are stated with `∫⁻` in `ℝ≥0∞`. Real suprema over the
  finite rows of an array are suprema of bounded families, and the empty supremum is `0`.
- The implementation namespace is TauCeti; the prototypes in `Suggested.lean` live in
  `TauCetiRoadmap.InfinitelyDivisibleLawsAndTriangularArrays`.

## Layer 1: characteristic functions on the line

### 1.1 Inversion

- **Lévy's inversion formula** (`tendsto_levyInversionIntegral`): for a law `μ` and `a < b`,
  `levyInversionIntegral μ a b T = (2π)⁻¹ ∫_{-T}^{T} (e^{-ita} - e^{-itb}) / (it) φ(t) dt`
  tends to `μ (a, b) + (μ {a} + μ {b}) / 2` as `T → ∞` (Durrett, Theorem 3.3.11, p. 111;
  Billingsley, Theorem 26.2, p. 346; Petrov, Theorem I.3, p. 12, at continuity points).
- **The atom formula** (`tendsto_atom_inversion`): `(2T)⁻¹ ∫_{-T}^{T} e^{-ita} φ(t) dt → μ {a}`
  (Billingsley, (26.30), p. 354).
- Target in prose: `∑_a μ {a}² = lim (2T)⁻¹ ∫_{-T}^{T} |φ(t)|² dt`, so a law is diffuse iff the
  Cesàro mean of `|φ|²` tends to `0` (the atom formula applied to the symmetrisation of `μ`).

*Proof route.* Fubini on `[-T, T] × ℝ` with the bounded integrand; the inner integral is
`2 ∫_0^T (sin t(x - a) - sin t(x - b)) / t dt`, bounded uniformly in `T` and `x` and converging to
`π (sgn(x - a) - sgn(x - b))`; dominated convergence. The atom formula is the same argument with
`(2T)⁻¹ ∫ e^{it(x - a)} dt = sin(T(x - a)) / (T(x - a))`.

*Needs:* Mathlib's `charFun` and interval integrals; nothing from this roadmap.

### 1.2 Continuity

- **Locally uniform convergence** (`tendstoLocallyUniformly_charFun`): if `μ n → μ₀` weakly, then
  `charFun (μ n) → charFun μ₀` uniformly on compact sets (Petrov, Theorem I.9, p. 15).
- **The doubling inequality** (`one_sub_norm_charFun_two_mul_sq_le`):
  `1 - |φ(2t)|² ≤ 4 (1 - |φ(t)|²)` (Petrov, Lemma I.1, p. 10).

*Proof route.* Weak convergence gives tightness; on a compact set of `x` the maps
`t ↦ e^{itx}` are equicontinuous. The doubling inequality is
`1 - Re ψ(2t) ≤ 4 (1 - Re ψ(t))` for the characteristic function `ψ = |φ|²` of the
symmetrisation, from `1 - cos 2u = 2 (1 - cos u)(1 + cos u) ≤ 4 (1 - cos u)`.

*Needs:* Mathlib's `ProbabilityMeasure.tendsto_iff_tendsto_charFun` and
`isTightMeasureSet_of_tendsto_charFun`.

### 1.3 Convergence of types

- **Degenerate laws** (`IsDegenerate`): `μ = δ_c` for some `c`.
- **Affine images** (`affineMap`): the image of a law under `x ↦ a x + b`.
- **Convergence of types** (`convergence_of_types`): if `μ n → μ₀`, `a n > 0`, the affine images
  `affineMap (μ n) (a n) (b n)` converge to `ν₀`, and `μ₀` and `ν₀` are nondegenerate, then
  `a n → a₀ > 0`, `b n → b₀`, and `ν₀ = affineMap μ₀ a₀ b₀` (Petrov, Theorem I.13, p. 17; Loève,
  §14.2.A, p. 216; Durrett, Theorem 3.8.9, p. 166).

*Proof route.* Tightness bounds `a n` above; nondegeneracy of `ν₀` bounds it below away from `0`
(if `a n → 0` along a subsequence, `|φ_{ν₀}| = 1` near `0`); along a subsequence `a n → a₀`,
`b n → b₀`, and two subsequential limits `(a₀, b₀) ≠ (a₁, b₁)` would make `μ₀` invariant under a
nontrivial affine map with `|φ_{μ₀}(t)| = |φ_{μ₀}(c t)|`, `c ≠ 1`, forcing `|φ_{μ₀}| ≡ 1`.

*Needs:* §1.2.

**Checks.**

- Bernoulli `(δ₀ + δ₁) / 2`, `a = 0`, `b = 1`: the inversion integral tends to
  `0 + (1/2 + 1/2) / 2 = 1/2` (`0.50006` at `T = 2000`).
- Negative control for the half-weights: without `(μ {a} + μ {b}) / 2` the Bernoulli value would be
  `0`; with full weights it would be `1`.
- `N(0, 1)` on `(-1, 1)`: the limit is `0.682689…`, the Gaussian probability, with no atom term.
- The atom formula for the Poisson law of mean `1` at `0` gives `e^{-1} = 0.36788…`
  (`0.36790` at `T = 3000`).
- Negative control for nondegeneracy in `convergence_of_types`: `μ n = μ₀ = δ₀` and `a n = n`
  give `ν₀ = δ₀` with `a n → ∞`.

### Examples

- The Cauchy law `φ(t) = e^{-|t|}` is recovered on `(a, b)` by inversion as
  `π⁻¹ (arctan b - arctan a)`.

### Dependencies

Mathlib's `charFun`, `ProbabilityMeasure.tendsto_iff_tendsto_charFun`,
`isTightMeasureSet_of_tendsto_charFun` and `measureReal_abs_gt_le_integral_charFun`.

## Layer 2: infinitely divisible laws

### 2.1 Definition and closure

- **The `n`-fold independent sum** (`iidSumLaw`) and **infinite divisibility**
  (`IsInfinitelyDivisible`): `μ` is a probability law and, for every `n ≥ 1`, `μ = iidSumLaw ν n`
  for some probability law `ν` on the same space (Klenke, Definition 16.1, p. 367).
- **No zeros** (`IsInfinitelyDivisible.charFun_ne_zero`): the characteristic function of an
  infinitely divisible law never vanishes (Petrov, Theorem II.1, p. 25; Klenke, Exercise 16.1.2,
  p. 381).
- **Convolution** (`IsInfinitelyDivisible.conv`): `μ ∗ ν` is infinitely divisible when `μ` and `ν`
  are (Petrov, Theorem II.2, p. 26).
- **Weak limits** (`isInfinitelyDivisible_of_tendsto`): a weak limit of infinitely divisible laws
  is infinitely divisible (Klenke, Corollary 16.9, p. 371; Petrov, Theorem II.3, p. 26; Kallenberg,
  Theorem 7.7(i), p. 152).
- Target in prose: affine images `x ↦ a x + b` of infinitely divisible laws are infinitely
  divisible.

*Proof route.* `charFun (iidSumLaw ν n) = (charFun ν)ⁿ` by Mathlib's
`charFun_map_sum_pi_eq_prod`. If `φ = ψₙⁿ`, then `|ψₙ|² = |φ|^{2/n} → 1{φ ≠ 0}`; the limit is
a characteristic function equal to `1` near `0` and continuous, hence `≡ 1`, so `φ` has no zero.
For weak limits, the roots of `μ n` are tight by the doubling inequality and have a subsequential
limit, which is an `n`-th root of the limit; this uses Tau Ceti's
`TauCeti.exists_probabilityMeasure_of_tendsto_charFun` to identify the limit.

*Needs:* §1.2; Mathlib's `charFun_conv`.

### 2.2 The distinguished logarithm

- **Distinguished logarithm** (`distLog`): for `φ : ℝ → ℂ` continuous and nonvanishing with
  `φ 0 = 1`, the continuous `ψ` with `ψ 0 = 0` and `exp ∘ ψ = φ`; `0` otherwise.
- **Existence and uniqueness** (`existsUnique_distLog`).
- **Continuity** (`tendstoLocallyUniformly_distLog`): locally uniform convergence of continuous
  nonvanishing `φ n` with `φ n 0 = 1` to a continuous nonvanishing `φ₀` gives locally uniform
  convergence of the distinguished logarithms.
- Target in prose: `distLog (φ * χ) = distLog φ + distLog χ`, and `exp (distLog φ / n)` is the only
  continuous `n`-th root of `φ` equal to `1` at `0`.

*Proof route.* Existence and uniqueness is the unique lifting through the covering map
`exp : ℂ → ℂ ∖ {0}` of a map from the simply connected space `ℝ` with a prescribed value at `0`:
Mathlib's `IsCoveringMap.existsUnique_continuousMap_lifts` with `Complex.isCoveringMap_exp`. For
continuity, on `[-T, T]` and for large `n`, `|φ n / φ₀ - 1| < 1`, so
`distLog (φ n) - distLog φ₀` is the principal logarithm of `φ n / φ₀` by uniqueness, and it tends
to `0` uniformly.

*Needs:* nothing from this roadmap.

### 2.3 Roots and the compound Poisson approximation

- **Unique roots** (`IsInfinitelyDivisible.charFun_root`): if `μ` is infinitely divisible and
  `μ = iidSumLaw ν n`, `n ≥ 1`, then `charFun ν = exp (distLog (charFun μ) / n)`; in particular the
  `n`-th root is unique (proof route below; Klenke writes the root `μ^{∗1/n}` in Theorem 16.5,
  p. 370).
- **Compound Poisson approximation** (`IsInfinitelyDivisible.tendsto_exp_charFun_root`): if `ν n`
  is the `n`-th root of `μ`, then `exp (n (charFun (ν n) t - 1)) → charFun μ t` (Klenke,
  Theorem 16.6, p. 370).
- Target in prose: the compound Poisson law with finite jump measure `λ` has characteristic
  function `exp ∫ (e^{itx} - 1) dλ` and is infinitely divisible; every infinitely divisible law is
  the weak limit of the compound Poisson laws with jump measures `n • ν n` (Klenke, Definition
  16.3, p. 369, and Theorem 16.5, p. 370; Kallenberg, Corollary 7.4, p. 150). The compound Poisson
  law at the pin is constructed in `TauCeti/Probability/Distributions/CompoundPoisson/` and is the
  intended implementation.

*Proof route.* `charFun ν` is a continuous `n`-th root of `charFun μ` equal to `1` at `0`; apply
§2.2. Then `n (exp (ψ / n) - 1) → ψ` for `ψ = distLog (charFun μ)`.

*Needs:* §2.1, §2.2.

### 2.4 Size constraints

- **A Gaussian lower bound** (`IsInfinitelyDivisible.exists_norm_charFun_ge`): some `γ > 0` has
  `|φ(t)| ≥ e^{-γ t²} / 2` for all `t` (Klenke, Corollary 16.11, p. 371).
- **No bounded support** (`IsInfinitelyDivisible.isDegenerate_of_measure_compl_Icc`): an
  infinitely divisible law carried by `[-R, R]` is a point mass (Klenke, Exercise 16.1.1, p. 381,
  and Example 16.2(x), p. 368).
- Target in prose: consequently `exp (-|t|^α)` is not a characteristic function for `α > 2`
  (Klenke, Corollary 16.11, p. 371), and the binomial law with `n ≥ 1` trials and `0 < p < 1` is
  not infinitely divisible (Klenke, Example 16.2(ix), p. 368).

*Proof route.* For the lower bound, apply the doubling inequality to the roots: `|φ|^{2/n}` is the
characteristic function of the symmetrised root, so `1 - |φ(2t)|^{2/n} ≤ 4 (1 - |φ(t)|^{2/n})`;
let `n → ∞` to get `-log |φ(2t)| ≤ 4 (-log |φ(t)|)`, and iterate from a neighbourhood of `0` where
`|φ| ≥ 1/2`. For bounded support, the roots are carried by `[-R/n, R/n]` up to a shift, so
their variances are at most `R²/n²` and `Var μ ≤ n · R² / n² → 0`.

*Needs:* §1.2, §2.3.

**Checks.**

- `charFun (iidSumLaw μ n) = (charFun μ)ⁿ`, one simplification with Mathlib's
  `charFun_map_sum_pi_eq_prod`.
- Negative control for `charFun_ne_zero`: the Bernoulli law `(δ₀ + δ₁) / 2` has
  `φ(π) = (1 + e^{iπ}) / 2 = 0`, so it is not infinitely divisible.
- The Gaussian `N(0, 1)` with `φ_n = e^{-t²/(2n)}`: `|exp (n (φ_n - 1)) - φ| = 1.5 · 10⁻⁵` at
  `t = 1.3`, `n = 10⁴`.
- Poisson of mean `5`: `|φ(t)| = exp (-5 (1 - cos t)) ≥ e^{-γ t²} / 2` holds with `γ = 1.77`
  (`max (5 (1 - cos t) - 1.77 t²) = 0.681 < log 2` on `[-50, 50]`), while `|φ(π)| = e^{-10} < 1/2`,
  so the Gaussian factor is needed.
- Negative control for the factor `1/2`: the Cauchy law has `|φ(t)| = e^{-|t|}`, which satisfies
  the bound for every `γ ≥ 1/(4 log 2) = 0.3607`, but no bound `e^{-γ t²} ≤ e^{-|t|}` holds near
  `t = 0`.

### Examples

- Gaussian, Poisson, Cauchy, Gamma and the negative binomial laws are infinitely divisible
  (Klenke, Example 16.2, p. 368); their triplets are in the Checks of Layer 3.

### Dependencies

§§1.1–1.2; Mathlib's `charFun_map_sum_pi_eq_prod`, `charFun_conv`,
`IsCoveringMap.existsUnique_continuousMap_lifts` and `Complex.isCoveringMap_exp`; Tau Ceti's
`TauCeti.exists_probabilityMeasure_of_tendsto_charFun`.

## Layer 3: the Lévy–Khintchine formula

### 3.1 Triplets

- **Lévy–Khintchine triplet** (`LevyTriplet`): a drift `b`, a Gaussian variance `σ² ≥ 0` and a
  Lévy measure `ν` with `ν {0} = 0` and `∫ min 1 x² dν < ∞` (Klenke, Definition 16.16, p. 376).
- **The integrand and the exponent** (`levyIntegrand`, `LevyTriplet.exponent`):
  `ψ(t) = i b t - σ² t² / 2 + ∫ (e^{itx} - 1 - i t x 1{|x| ≤ 1}) dν`.
- **The triplet of a law** (`HasLevyTriplet`): `charFun μ = exp ∘ T.exponent`.
- **Integrability** (`LevyTriplet.integrable_levyIntegrand`): the integrand is `ν`-integrable for
  every `t`.

*Proof route.* `|e^{itx} - 1 - itx| ≤ t² x² / 2` on `|x| ≤ 1` and `|e^{itx} - 1| ≤ 2` on `|x| > 1`,
where `ν` is finite.

*Needs:* nothing from this roadmap.

### 3.2 The representation theorem

- **Existence** (`LevyTriplet.exists_hasLevyTriplet`): every triplet is the triplet of an
  infinitely divisible law (Kallenberg, Corollary 7.6, p. 151; Klenke, Theorem 16.17, p. 376).
- **Triplets give infinite divisibility** (`HasLevyTriplet.isInfinitelyDivisible`).
- **Representation** (`IsInfinitelyDivisible.exists_hasLevyTriplet`): every infinitely divisible
  law has a triplet (Klenke, Theorem 16.17, p. 376; Petrov, Theorem II.5, p. 32; Durrett,
  Theorem 3.9.6, p. 170).
- **Uniqueness** (`HasLevyTriplet.unique`) (Klenke, Theorem 16.17, p. 376; Petrov, Lemma II.2,
  p. 29).

*Proof route.* Existence: the triplet with `ν` restricted to `|x| > 1/k` is the convolution of a
Gaussian and a compensated compound Poisson law; the exponents converge locally uniformly as
`k → ∞`, and Tau Ceti's `TauCeti.exists_probabilityMeasure_of_tendsto_charFun` gives the limit
law. Infinite divisibility: `(b/n, σ²/n, ν/n)` is a triplet whose law is the `n`-th root.
Representation: by §2.3, `n (charFun (ν n) - 1) → distLog (charFun μ)` locally uniformly; write
`n (charFun (ν n) - 1)` as an exponent with the finite measures `n • ν n` and pass to the limit
using tightness of `min 1 x² · n • ν n`, which follows from the bound of Mathlib's
`measureReal_abs_gt_le_integral_charFun` applied to the roots. Uniqueness: the second symmetric
difference `ψ(t + h) + ψ(t - h) - 2 ψ(t)` averaged over `h ∈ [-1, 1]` is the Fourier transform of
the finite measure `σ²/6 δ₀ + (1 - sin x / x) ν (dx)` (after the factor `-1/2`), which determines
`σ²` and `ν`; then `b`.

*Needs:* §§2.1–2.3.

### 3.3 Affine images

- **Affine images** (`HasLevyTriplet.map_affine`): if `μ` has triplet `(b, σ², ν)` and `a > 0`,
  the image of `μ` under `x ↦ a x + d` has the triplet with Gaussian variance `a² σ²`, Lévy measure
  the image of `ν` under `x ↦ a x`, and drift
  `a b + d + a ∫ x (1{|x| ≤ 1/a} - 1{|x| ≤ 1}) dν` (Klenke, Lemma 16.24, p. 383, adapted from the
  truncation `1{|x| < 1}` to `1{|x| ≤ 1}`).
- Target in prose: the `n`-th convolution power of a law with triplet `(b, σ², ν)` has triplet
  `(n b, n σ², n ν)` (Klenke, Lemma 16.24, p. 383).

*Proof route.* Compare the exponents at `a t`; the truncation of the image measure is
`1{|a x| ≤ 1}`, and the drift absorbs the difference, an integral over the annulus between `1` and
`1/a`, where `ν` is finite.

*Needs:* §3.2.

### 3.4 Moments

- **Kolmogorov's finite-variance form** (`HasLevyTriplet.memLp_two_iff`): a law with triplet
  `(b, σ², ν)` has a finite second moment iff `∫_{|x| > 1} x² dν < ∞`; then its mean is
  `b + ∫_{|x| > 1} x dν` and its variance is `σ² + ∫ x² dν` (Petrov, Theorem II.6, p. 32; Durrett,
  Theorem 3.9.7, p. 170).
- Target in prose: more generally, let `g ≥ 0` be measurable, locally bounded and submultiplicative
  in the sense `g(x + y) ≤ K g(x) g(y)` for some constant `K` (such as `|x|^p ∨ 1`, with
  `K = 2^p`, or `e^{c|x|}`); then `∫ g dμ < ∞` iff `∫_{|x| > 1} g dν < ∞` (Applebaum, Theorem 2.5.2,
  p. 132, for `g = |x|^n`, and the note after it, pp. 132–133, for submultiplicative `g`).

*Proof route.* For the Gaussian and small-jump part all moments are finite; the big-jump part is
compound Poisson with finite jump measure `ν|_{|x| > 1}`, whose second moment is finite iff the
jump law has one. Mean and variance are `-i ψ'(0)` and `-ψ''(0)`. For submultiplicative `g` and
the direction `⇐`, write the law as that of `X₁ + X₂` with independent Gaussian-and-small-jump part
`X₁` and compound Poisson part `X₂ = Y₁ + … + Y_N`; then `E g(X₁ + X₂) ≤ K E g(X₁) E g(X₂)`, a
locally bounded submultiplicative `g` grows at most exponentially while `X₁` has all exponential
moments, and `E g(Y₁ + … + Y_k) ≤ K^{k-1} (E g(Y₁))^k` makes `E g(X₂)` a convergent exponential
series.

*Needs:* §3.2.

### 3.5 Atoms

- **Doeblin's criterion** (`HasLevyTriplet.forall_measure_singleton_eq_zero_iff`): a law with
  triplet `(b, σ², ν)` has no atoms iff `σ² > 0` or `ν (ℝ) = ∞` (Kallenberg, Proposition 7.16,
  p. 159).

*Proof route.* If `σ² = 0` and `ν` is finite, the law is a shifted compound Poisson law with
an atom of mass at least `e^{-ν(ℝ)}`. Otherwise, by the atom formula of §1.1 applied to the
symmetrisation, it suffices that `(2T)⁻¹ ∫_{-T}^{T} |φ|² → 0`;
`|φ(t)|² = exp (-σ² t² - 2 ∫ (1 - cos tx) dν)`, and `∫ (1 - cos tx) dν → ∞` in Cesàro mean when
`ν` is infinite.

*Needs:* §1.1, §3.2.

### 3.6 The half-line

- **Infinitely divisible laws on `[0, ∞)`** (`HasLevyTriplet.measure_Iio_zero_eq_zero_iff`): a law
  with triplet `(b, σ², ν)` is carried by `[0, ∞)` iff `σ² = 0`, `ν` is carried by `(0, ∞)`,
  `∫ min 1 x dν < ∞` and the drift `b - ∫_{(0, 1]} x dν` is nonnegative (Klenke, Theorem 16.14,
  p. 372, in the Laplace form `u(t) = αt + ∫ (1 - e^{-tx}) ν (dx)`; Kallenberg, Theorem 7.5(ii),
  p. 151).

*Proof route.* For `⇐`, the law is the convolution of `δ_{b₀}`, `b₀ = b - ∫_{(0,1]} x dν`, with
the limit of compound Poisson laws with jumps in `(0, ∞)`. For `⇒`, the roots are carried by
`[0, ∞)` (a root with `P(Y < 0) > 0` gives `P(Y₁ + … + Yₙ < 0) ≥ P(Y < 0)ⁿ > 0`), so `n • ν n`
lives on `[0, ∞)` and by §3.7 `ν` lives on `(0, ∞)`. The Laplace exponents `n (1 - E e^{-s Yₙ})`
of the roots converge to `-log E e^{-sX}`, a Bernstein function; Tau Ceti's Bernstein-function form
of the Lévy–Khintchine formula, `TauCeti/Analysis/CompletelyMonotone/Bernstein/LevyKhintchine/` at
the pin, writes it as `α s + ∫ (1 - e^{-sx}) ν'(dx)` with `∫ min 1 x dν' < ∞`, and uniqueness of
the triplet (§3.2), after analytic continuation to `s = -it`, gives `σ² = 0`, `ν' = ν` and
`α = b₀ ≥ 0`.

*Needs:* §3.2, §3.7.

### 3.7 The Lévy measure from the roots

- **Scaled roots converge** (`HasLevyTriplet.tendstoAwayFromZero_root`): if `ν n` is the `n`-th
  root of a law with triplet `(b, σ², ν)`, then `n • ν n → ν` away from the origin
  (`TendstoAwayFromZero`) (Klenke, (16.19), p. 381).

*Proof route.* Let `λ n` be `n • ν n` restricted to `x ≠ 0`. The compound Poisson laws with jump
measures `λ n` have triplets `(∫_{|x| ≤ 1} x d(λ n), 0, λ n)` and converge to `μ` by §2.3. Since
`ν` has at most countably many atoms, choose `a > 0` with `ν {|x| = 1/a} = 0`. By §3.3 the images
of these laws and of `μ` under `x ↦ a x` have the image Lévy measures, and the limit's Lévy measure
does not charge `{|x| = 1}`, so §4.1 applies to the images. Convergence away from the origin of
the image measures is equivalent to that of `λ n`, or of `n • ν n`, to `ν`, because
`f ↦ f (a ·)` preserves the test functions of `TendstoAwayFromZero`.

*Needs:* §2.3, §3.3, §4.1.

**Checks.**

- A triplet forces a probability measure (`HasLevyTriplet.isProbabilityMeasure`): `charFun μ 0` is
  `μ (ℝ)` (as a real number), which must equal `exp 0 = 1`.
- The Poisson law of mean `λ`, pushed to `ℝ`, has triplet `(λ, 0, λ δ₁)`
  (`exists_hasLevyTriplet_poisson`): `exp ψ(t) = exp (λ (e^{it} - 1))`, checked at
  `t = 0.3, 1.7`.
- Negative control for the truncation: with Klenke's `1{|x| < 1}` the jump at `1` is not
  compensated and the drift of the Poisson law is `0`; the drift `λ` is wrong there (the
  characteristic functions differ by more than `0.1` at `t = 1.7`).
- The Cauchy law `e^{-|t|}` has triplet `(0, 0, (π x²)⁻¹ dx)` (Klenke, Example 16.19, p. 381);
  numerically `ψ(0.5) = -0.5000008`, `ψ(2) = -2.000003`.
- The exponential law of mean `1` has triplet `(1 - e^{-1}, 0, e^{-x} x⁻¹ dx on (0, ∞))`; its mean
  `b + ∫_{x > 1} x dν = 1` and its variance `∫ x² dν = 1` agree with `HasLevyTriplet.memLp_two_iff`,
  and its half-line drift `b - ∫_{(0,1]} x dν = 0` is nonnegative.
- `HasLevyTriplet.map_affine` on the Poisson law: `a = 2`, `d = 0` gives drift `0` (the jump `2`
  leaves the truncation); `a = 1/2`, `d = 0.3` gives drift `1.3` for `λ = 2`; both
  characteristic functions agree to `10⁻¹²`.
- Doeblin: the Poisson law has finite `ν` and atoms; the exponential law has infinite `ν` and no
  atoms.

### Examples

- The Gamma law of shape `r` has `ν (dx) = r e^{-x} x⁻¹ dx`, infinite, so it is diffuse by §3.5.
- The stable laws of [StandardDistributions](../StandardDistributions/README.md), Layer 15, have
  power-law Lévy measures (§7.2).

### Dependencies

Layers 1–2, and §4.1 for §§3.6–3.7; Tau Ceti's
`TauCeti.exists_probabilityMeasure_of_tendsto_charFun`; Mathlib's
`measureReal_abs_gt_le_integral_charFun`.

## Layer 4: convergence of infinitely divisible laws

### 4.1 Convergence through triplets

- **Convergence away from the origin** (`TendstoAwayFromZero`).
- **Truncated second moment** (`LevyTriplet.truncVar`): `σ² + ∫_{|x| ≤ 1} x² dν`.
- **Convergence of infinitely divisible laws** (`tendsto_iff_levyTriplet`): for laws with triplets
  `T n` and `T₀`, and `T₀`'s Lévy measure not charging `{|x| = 1}`, `μ n → μ₀` weakly iff the Lévy
  measures converge away from the origin, `(T n).truncVar → T₀.truncVar` and the drifts converge
  (Kallenberg, Theorem 7.7(ii), p. 152, with `h = 1`).
- Target in prose: the same with the modified characteristics `(b, σ² δ₀ + x² (1 + x²)⁻¹ ν)` and
  weak convergence of the finite measures (Kallenberg, Lemma 7.8, p. 152).

*Proof route.* `⇐`: the exponents converge pointwise, since the integrand splits into a bounded
continuous part away from `0`, which converges by hypothesis after cutting at a continuity radius,
and a part near `0` bounded by `t² x²` with the `truncVar` hypothesis. `⇒`: by §2.2, the exponents
converge locally uniformly; by the uniqueness argument of §3.2, the second symmetric differences
determine the finite measures `σ²/6 δ₀ + (1 - sin x / x) ν`, whose weak convergence gives the
three conditions.

*Needs:* §§2.2, 3.2.

**Checks.**

- Negative control for the hypothesis on `{|x| = 1}`: the compound Poisson laws with jump measure
  `δ_{1+1/n}` have triplets `(0, 0, δ_{1+1/n})` and converge weakly to the compound Poisson law
  with triplet `(1, 0, δ₁)` (distance `6 · 10⁻⁴` at `n = 1000`), but the drifts are `0`,
  not `1`, and `truncVar` is `0`, not `1`.
- Gaussians `N(0, 1/n)` converge to `δ₀`: triplets `(0, 1/n, 0) → (0, 0, 0)`.

### Examples

- Kallenberg, Corollary 7.9, p. 154: for i.i.d. rows `ξ n j`, `j < m n`, with `m n → ∞`, the row
  sums converge to an infinitely divisible law iff `m n • law(ξ n 1)` converges to its Lévy
  measure away from `0` and the truncated first and second moments of `m n • law(ξ n 1)`
  converge; it is §5.3 with identically distributed rows, for which infinitesimality follows from
  tightness of the row sums (Kallenberg, Lemma 7.3, p. 149).

### Dependencies

Layers 2–3.

## Layer 5: infinitesimal triangular arrays

### 5.1 Infinitesimal arrays

- **Infinitesimal array** (`IsInfinitesimalArray`): `max_j P(|X n j| > ε) → 0` for every `ε > 0`
  (Petrov, Chapter IV, §1, (1.2), p. 63; Kallenberg, null arrays, p. 130).
- **Characteristic-function form** (`isInfinitesimalArray_iff_charFun`): an array of measurable
  variables is infinitesimal iff `max_j |1 - φ_{n j}(t)| → 0` for every `t` (Kallenberg,
  Lemma 6.6, p. 130).
- **The truncation** (`truncOne`): `x 1{|x| ≤ 1}`.

*Proof route.* `|1 - φ(t)| ≤ |t| ε + 2 P(|X| > ε)`; conversely, the tail bound of Mathlib's
`measureReal_abs_gt_le_integral_charFun`.

*Needs:* nothing from this roadmap.

### 5.2 Khintchine's theorem

- **Limits are infinitely divisible** (`isInfinitelyDivisible_of_tendstoInDistribution`): a limit
  in distribution of the row sums of an infinitesimal array of row-independent variables is
  infinitely divisible (Kallenberg, Corollary 7.13, p. 156; Klenke, Theorem 16.13, p. 372; Petrov,
  Theorem IV.1, p. 72).

*Proof route.* By infinitesimality, `∏_j φ_{n j}` and `exp ∑_j (φ_{n j} - 1)` are asymptotically
equal after centring at truncated medians (Kallenberg, Proposition 7.11, p. 155); the right side is
a compound Poisson characteristic function, and §2.1 closes the class under weak limits.

*Needs:* §§2.1, 2.3, 5.1.

### 5.3 The general limit theorem

- **Doeblin–Gnedenko criterion** (`tendstoInDistribution_iff_levyTriplet`): for an infinitesimal
  array of row-independent variables and an infinitely divisible `ν` with triplet `T` whose Lévy
  measure does not charge `{|x| = 1}`, the row sums converge in distribution to `ν` iff
  `∑_j law(X n j) → T.levyMeasure` away from the origin, `∑_j Var(truncOne (X n j)) → T.truncVar`
  and `∑_j E truncOne (X n j) → T.drift` (Kallenberg, Theorem 7.14, p. 157, with `h = 1`; Petrov,
  Theorem IV.3, p. 75, in the Khintchine form of the triplet).

*Proof route.* By Kallenberg, Proposition 7.11, p. 155, the row sums are asymptotically equivalent
to the compound Poisson laws with jump measures `∑_j law(X n j - c n j)`, `c n j` the truncated
means; apply §4.1 to these and translate the conditions back, which costs only
`∑_j (E truncOne (X n j))² → 0`, a consequence of infinitesimality and the variance bound.

*Needs:* §§4.1, 5.1, 5.2.

### 5.4 Gaussian convergence

- **Gaussian limits** (`tendstoInDistribution_gaussianReal_iff`): for an infinitesimal array of
  row-independent variables, the row sums converge to `N(b, c)` iff `∑_j P(|X n j| > ε) → 0` for
  every `ε > 0`, `∑_j E truncOne (X n j) → b` and `∑_j Var(truncOne (X n j)) → c` (Kallenberg,
  Theorem 6.16, p. 137).

*Proof route.* §5.3 with `T = (b, c, 0)`: convergence of `∑_j law(X n j)` to the zero measure away
from the origin is `∑_j P(|X n j| > ε) → 0`. Kallenberg's direct proof (p. 137) is an alternative.

*Needs:* §5.3.

### 5.5 Feller's converse

- **Feller's theorem** (`lindeberg_of_tendstoInDistribution`): for row-independent centred
  square-integrable variables with `∑_j Var X n j → 1` and `max_j Var X n j → 0`, convergence of the
  row sums to `N(0, 1)` implies the Lindeberg condition
  `∑_j E(X n j²; |X n j| > ε) → 0` for every `ε > 0` (Kallenberg, Theorem 6.13, p. 135; Petrov,
  Theorem IV.22, p. 99).

*Proof route.* `max_j Var → 0` gives infinitesimality by Chebyshev; §5.4 gives
`∑_j Var(truncOne (X n j)) → 1` and, for every `ε`, convergence of the truncated variances at
level `ε`, so the truncated second moments lose no mass:
`∑_j E(X n j²; |X n j| ≤ ε) → 1 = lim ∑_j E X n j²`. The sufficiency half is
[MathematicalStatisticsAsymptotic](../MathematicalStatisticsAsymptotic/README.md) §1.2.

*Needs:* §5.4.

### 5.6 Poisson convergence

- **Poisson limits** (`tendstoInDistribution_poissonMeasure_iff`): for row-independent `ℕ`-valued
  variables with `max_j P(X n j > 0) → 0` and `c ≥ 0`, the row sums converge to the Poisson law of
  mean `c` (Mathlib's `poissonMeasure`) iff `∑_j P(X n j > 1) → 0` and `∑_j P(X n j = 1) → c`
  (Kallenberg, Theorem 6.7, p. 130; Durrett, Theorem 3.7.1, p. 151, for sufficiency).
- Target in prose: the degenerate case: the row sums of an infinitesimal array of
  row-independent variables converge in probability to a constant `b` iff
  `∑_j P(|X n j| > ε) → 0`, `∑_j E truncOne (X n j) → b` and `∑_j Var(truncOne (X n j)) → 0`
  (§5.4 with `c = 0`).

*Proof route.* The Lévy measure `c δ₁` of the Poisson law charges `{|x| = 1}`, so §5.3 is applied
to the halved array `X n j / 2`, whose row sums converge to the image of the Poisson law under
`x ↦ x / 2` iff the original row sums converge to the Poisson law. By §3.3 that image has triplet
`(c/2, 0, c δ_{1/2})`, which §5.3 admits, with `truncVar` equal to `c/4`. The conditions reduce to
the two stated ones, because `law(X n j / 2)` restricted away from `0` is
`P(X n j = 1) δ_{1/2} + (mass at least 1)`, `E truncOne (X n j / 2)` is
`P(X n j = 1) / 2 + P(X n j = 2)`, and the squared truncated means sum to at most
`max_j P(X n j > 0) · ∑_j P(X n j > 0) → 0`. Mathlib's `tendsto_choose_mul_pow_of_tendsto_mul_atTop`
is the binomial special case.

*Needs:* §3.3, §5.3.

**Checks.**

- Centred Bernoulli rows `X n j = (ξ_j - p) / √(n p q)`, `j < n`: the truncated means sum to `0`
  and the truncated variances to `1` once `√(n p q) ≥ 1`, so §5.4 gives the de Moivre–Laplace
  theorem.
- Bernoulli rows of mean `c / n` satisfy §5.6 with `∑_j P(X = 1) = c`; the `ℓ¹` distance
  of `Binomial(n, c/n)` to Poisson of mean `1.5` is `1.6 · 10⁻⁴` at `n = 5000`.
- Negative control for §5.6: rows with values in `{0, 2}` and `P(X = 2) = c / (2n)` have
  `∑_j P(X = 1) = 0` and `∑_j P(X > 1) = c/2`; the limit is twice a Poisson law of mean `c/2`,
  with variance `2c`, not `c`.
- Negative control for `max_j Var X n j → 0` in §5.5: `X n 0 ~ N(0, 1)` and `X n j = 0` for
  `j > 0` gives row sums `N(0, 1)` while the Lindeberg sum at `ε = 1/2` is `0.969`.
- Negative control for infinitesimality in §5.2: the rows `X n 0 = ξ`, `X n j = 0` for `j > 0`,
  with `ξ` Bernoulli, converge to a law that is not infinitely divisible.

### Examples

- The number of empty boxes when `r` balls fall into `n` boxes with `n e^{-r/n} → λ` is
  asymptotically Poisson (Durrett, Theorem 3.6.10, p. 150), via §5.6 after Poissonisation.

### Dependencies

Layers 2–4; [MathematicalStatisticsAsymptotic](../MathematicalStatisticsAsymptotic/README.md) §1.2
for the array conventions and the sufficiency half of §5.5.

## Layer 6: regular variation

### 6.1 Regularly and slowly varying functions

- **Regular variation** (`IsRegularlyVarying`): `U` is eventually positive and
  `U (t x) / U t → x^ρ` as `t → ∞` for every `x > 0`; **slow variation** (`IsSlowlyVarying`) is
  index `0` (Resnick, §2.2, p. 20).
- **The limit is a power** (`exists_rpow_of_tendsto_div`): for measurable eventually positive `U`,
  if `U (t x) / U t → h x` for every `x > 0`, then `h x = x^ρ` (Resnick, Proposition 2.3(i), p. 21).
- **Uniform convergence theorem** (`IsRegularlyVarying.tendstoUniformlyOn`): for measurable `U`,
  the convergence is uniform on `[a, b]`, `0 < a` (Resnick, Proposition 2.4, p. 24).
- Target in prose: the Karamata representation `L(x) = c(x) exp ∫_1^x ε(t) / t dt` with
  `c(x) → c > 0`, `ε(t) → 0` (Resnick, Corollary 2.1, p. 29).

*Proof route.* `h` is multiplicative and measurable, hence a power. The uniform convergence
theorem by Egorov's theorem and a measure-of-sets argument on `log`-scale (Resnick, proof of
Proposition 2.4, pp. 24–25).

*Needs:* nothing from this roadmap.

### 6.2 Karamata's theorem

- **Karamata's theorem** (`IsRegularlyVarying.integral`): if `U ≥ 0` is regularly varying with
  index `ρ ≥ -1` and integrable on every `(0, x]`, then `x ↦ ∫_0^x U` is regularly varying with
  index `ρ + 1` and `x U x / ∫_0^x U → ρ + 1` (Resnick, Theorem 2.1(a), p. 25).

*Proof route.* Resnick, pp. 25–28, from §6.1.

*Needs:* §6.1.

### 6.3 Truncated moments

- **Truncated second moment** (`truncSecondMoment`): `x ↦ ∫_{|y| ≤ x} y² dμ`.
- **Tails under slow variation** (`tendsto_tail_div_truncSecondMoment`): for nondegenerate `μ` with
  slowly varying truncated second moment `L₀`, `x^{2-p} ∫_{|y| > x} |y|^p dμ / L₀ x → 0` for every
  `p ∈ [0, 2)`, and every translate of `μ` has slowly varying truncated second moment (Kallenberg,
  Lemma 6.19, p. 140).

*Proof route.* Kallenberg's dyadic summation (p. 140): `L₀(2x) ≤ r L₀(x)` for `1 < r < 2^{2-p}`
and large `x`.

*Needs:* §6.1.

**Checks.**

- `U x = x^ρ log x`, `ρ = 1/2`: `x U x / ∫_1^x U` is `1.660, 1.576, 1.550` at `x = 10³, 10⁶, 10⁹`,
  tending to `ρ + 1 = 3/2`.
- The Pareto law `P(|ξ| > x) = x⁻²`, `x ≥ 1`: `L₀ x = 2 log x` is slowly varying, `ξ` has infinite
  variance, and `x² P(|ξ| > x) / L₀ x = 1 / (2 log x) → 0`, in accordance with §6.3 at `p = 0`.
- Negative control for `ρ ≥ -1` in Karamata's theorem: `U x = x⁻²` on `[1, ∞)` gives
  `x U x / ∫_1^x U → 0`, not `ρ + 1 = -1`.

### Examples

- `log x`, `log log x` and `exp ((log x)^{1/2})` are slowly varying; `2 + sin x` is not.

### Dependencies

Mathlib's measure theory on `ℝ`.

## Layer 7: sums of independent identically distributed variables

### 7.1 Weak laws

- **Feller's weak law** (`tendstoInMeasure_weakLaw_iff`): for an i.i.d. sequence, `S_n / n → c`
  in probability iff `r P(|X₀| > r) → 0` and `E(X₀; |X₀| ≤ r) → c` as `r → ∞` (Kallenberg,
  Theorem 6.17, p. 138, at `p = 1`; Durrett, Theorem 2.2.12, p. 54, for sufficiency).
- **Exponents `p ≠ 1`** (`tendstoInMeasure_rpow_weakLaw_iff`): for `p ∈ (0, 2)`, `p ≠ 1`,
  `n^{-1/p} S_n → c` in probability iff `c = 0`, `r^p P(|X₀| > r) → 0`, and `E X₀ = 0` when
  `p > 1` (Kallenberg, Theorem 6.17, p. 138, which omits the condition `E X₀ = 0` from the
  statement for `p ∈ (1, 2)` and derives it in the proof; the constant sequence `X = 1` with
  `p = 3/2` shows it is needed).

*Proof route.* §5.6's degenerate case for the array `X_j / n^{1/p}`, `j < n`, whose conditions
reduce to the stated tail and truncated-mean conditions.

*Needs:* §5.6.

### 7.2 Stable laws

- **Stable laws** (`IsStable`): nondegenerate, and for every `n ≥ 1` the sum of `n` independent
  copies has the law of `a X + b` for some `a > 0`, `b` (Klenke, Definition 16.20, p. 382);
  **stable with index `α`** (`IsStableWithIndex`): with `a = n^{1/α}` (Klenke, Definition 16.20,
  p. 383).
- **Stable laws are infinitely divisible** (`IsStable.isInfinitelyDivisible`).
- **The index** (`IsStable.exists_index`): every stable law is stable with an index
  `α ∈ (0, 2]` (Klenke, Theorem 16.22(i), p. 383).
- **Index two is Gaussian** (`IsStableWithIndex.exists_eq_gaussianReal`) (Klenke,
  Theorem 16.22(ii), p. 383).
- **Power-law Lévy densities** (`powerLevyDensity`): `c₊ x^{-α-1}` on `(0, ∞)` and
  `c₋ |x|^{-α-1}` on `(-∞, 0)`.
- **Stable laws through their triplets** (`isStable_iff_levyTriplet`): a nondegenerate law with
  triplet `(b, σ², ν)` is stable iff `ν = 0`, or `σ² = 0` and `ν` has a power-law density with some
  `α ∈ (0, 2)` (Petrov, Theorem IV.11, p. 89; Klenke, Theorem 16.22(iii), p. 383).
- Target in prose: the stable characteristic functions
  `exp (i b t - c |t|^α (1 + i β sgn t ω(t, α)))` with `c ≥ 0`, `β ∈ [-1, 1]`,
  `ω(t, α) = tan (π α / 2)` for `α ≠ 1` and `ω(t, 1) = (2/π) log |t|` (Petrov, Theorem IV.12,
  p. 90, whose sign convention for `β` this is; Klenke, Remark 16.23, p. 383, in terms of `c₊` and
  `c₋`); these are the laws of [StandardDistributions](../StandardDistributions/README.md),
  Layer 15, after the change of location between its parametrisation and this one.

*Proof route.* Infinite divisibility from the definition: if `X₁ + … + Xₙ` has the law of
`a X + b`, then `n` independent copies of `(X - b/n) / a` sum to a variable with the law of `X`.
The index: `a_{mn} = a_m aₙ` from the uniqueness of the triplet under §3.3, and `aₙ` is increasing
by a symmetrisation argument, so `aₙ = n^{1/α}`; `α ≤ 2` by the Gaussian lower bound of §2.4. The
triplet: by §3.3, `n ν = ν ∘ (x ↦ a_n x)⁻¹`, which forces a power law on each half-line, and
`n σ² = a_n² σ²` forces `σ² = 0` unless `α = 2`.

*Needs:* §§2.4, 3.2, 3.3.

### 7.3 Stable laws as limits

- **Domain of attraction** (`IsInDomainOfAttraction`): `(S_n - b n) / a n → ν` in distribution for
  some `a n > 0`, `b n`, with `S_n` the sum of `n` independent draws from `μ` (Klenke,
  Definition 16.26, p. 387).
- **Stable laws are exactly the limits** (`isStable_iff_exists_isInDomainOfAttraction`): a
  nondegenerate law has a nonempty domain of attraction iff it is stable (Klenke, Theorem 16.27,
  p. 387; Durrett, Theorem 3.8.8, p. 166; Petrov, Theorem IV.10, p. 88).
- **Self-attraction** (`IsStable.isInDomainOfAttraction_self`) (Klenke, Theorem 16.27, p. 387).

*Proof route.* Self-attraction is the definition. For the converse, `S_{kn}` is the sum of `k`
independent copies of `S_n`, so the limit `ν` satisfies `ν^{∗k} = affineMap ν a b` for limits `a`,
`b` given by convergence of types (§1.3).

*Needs:* §1.3, §7.2.

### 7.4 Domains of attraction

- **The Gaussian domain** (`isInDomainOfAttraction_gaussianReal_iff`): a nondegenerate law lies in
  the domain of attraction of `N(0, 1)` iff its truncated second moment is slowly varying
  (Kallenberg, Theorem 6.18, p. 139; Petrov, Theorem IV.13, p. 90; Klenke, Theorem 16.28, p. 387).
- **Domains of index `α < 2`** (`exists_isInDomainOfAttraction_iff`): a law lies in the domain of
  attraction of some stable law of index `α ∈ (0, 2)` iff its truncated second moment is regularly
  varying with index `2 - α` and `P(X ≥ x) / P(|X| ≥ x)` converges (Klenke, Theorem 16.28(iii),
  p. 387; Petrov, Theorem IV.14, p. 91; Durrett, Theorem 3.8.2, p. 162, for sufficiency).
- Target in prose: the normings: `aₙ` may be taken with `n L₀(aₙ) ~ aₙ²` in the Gaussian case
  and `n P(|X| > aₙ) → 1` for `α < 2`, with `bₙ = n E(X; |X| ≤ aₙ)` (Durrett, Theorem 3.8.2,
  p. 162; Kallenberg, proof of Theorem 6.18, p. 140).

*Proof route.* §5.4 and §5.3 for the arrays `(X_j - m_n) / a_n`, with §6.3 and Karamata's theorem
(§6.2) translating the conditions on `n • law(X / a_n)` into regular variation.

*Needs:* §§5.3, 5.4, 6.2, 6.3, 7.3.

### 7.5 Moments

- **Moments in a domain of attraction** (`IsInDomainOfAttraction.lintegral_rpow`): if `μ` lies in
  the domain of attraction of a stable law of index `α`, then `∫ |x|^β dμ < ∞` for `0 < β < α`, and
  `∫ |x|^β dμ = ∞` for `β > α` when `α < 2` (Klenke, Corollary 16.30, p. 388).

*Proof route.* §7.4 and §6.3: `P(|X| > x) = x^{-α} L(x)` with `L` slowly varying, and
`x^{±ε} L(x)` is eventually monotone by the representation of §6.1.

*Needs:* §§6.1, 7.4.

**Checks.**

- The Cauchy law: `φ(t)ⁿ = e^{-n|t|} = φ(n t)`, so it is stable with index `1`; the Gaussian:
  `e^{-n t²/2} = φ(√n t)`, index `2`.
- Negative control for `IsStable` against infinite divisibility: the Poisson law is infinitely
  divisible but not stable, since `a X + b` with `a ≠ 1` changes the lattice and `a = 1` gives
  variance `λ ≠ n λ`.
- The Pareto law with `P(X > x) = x^{-3/2}`, `x ≥ 1`: the truncated second moment
  `3 (x^{1/2} - 1)` is regularly varying with index `1/2 = 2 - α` (ratio `1.41425` against
  `√2` at `x = 10⁸`), and `E X^β = 1.5 / (1.5 - β)` is finite exactly for `β < 3/2`.
- The Cauchy law: `r P(|X| > r) → 2/π ≠ 0`, so Feller's weak law fails, as it must since `S_n / n`
  is Cauchy.
- The symmetric law with `P(|X| > x) = 1 / (x log x)` for `x ≥ e`: `r P(|X| > r) → 0` while
  `E|X| = ∞`, so Feller's weak law applies to a non-integrable law, with `c = 0`.
- Negative control for the truncated-mean condition: the positive law with the same tail has
  `E(X; X ≤ r)` growing like `log log r` (`2.79`, `3.55`, `4.28` at `r = 10³, 10⁶, 10¹²`), so
  `S_n / n` converges in probability to no constant.

### Examples

- `S_n / (n log n)^{1/2}` for the symmetric Pareto law `P(|ξ| > x) = x⁻²`, `x ≥ 1`, tends to
  `N(0, 1)`: the Gaussian domain with infinite variance.
- St. Petersburg-type laws with `r P(|X| > r) ↛ 0` lie outside Feller's weak law (`p = 1`) of §7.1;
  they satisfy the weak laws with `p < 1`, since `P(X > r) ≤ 2/r`.

### Dependencies

Layers 1–6.

## Layer 8: self-decomposable laws and the lattice `ℕ`

### 8.1 Self-decomposable laws

- **Self-decomposability** (`IsSelfDecomposable`): for every `c ∈ (0, 1)`, `μ` is the convolution
  of its image under `x ↦ c x` with some law (Petrov, Chapter IV, §3, Lemma 12, p. 83, as the
  characterisation of the class L of limits of normalised sums, p. 82).
- **Self-decomposable laws are infinitely divisible** (`IsSelfDecomposable.isInfinitelyDivisible`)
  (Petrov, p. 85, from Lemma 12, p. 83, and Chapter IV, §1).
- **Their Lévy measures** (`HasLevyTriplet.isSelfDecomposable_iff`): a law with triplet `T` is
  self-decomposable iff `ν (dx) = k(x) / |x| dx` with `k` nonincreasing on `(0, ∞)` and
  nondecreasing on `(-∞, 0)` (Petrov, Theorem IV.9, p. 85, in terms of the Lévy spectral function,
  `x L'(x)` nonincreasing).

*Proof route.* Petrov's Lemma 12 shows the components `ρ_c` are limits of row sums of an
infinitesimal array, so §5.2 makes them, and `μ`, infinitely divisible. The component `ρ_c` has Lévy
measure `ν - ν ∘ (x ↦ c x)⁻¹` (image measures), so by §3.3 and uniqueness the condition is
`ν ≥ ν ∘ (x ↦ c x)⁻¹` for every `c ∈ (0, 1)`, which is equivalent to monotonicity of `k`.

*Needs:* §§3.2, 3.3, 5.2.

### 8.2 Infinite divisibility on `ℕ`

- **Lattice infinite divisibility** (`isInfinitelyDivisible_nat_iff`): a law on `ℕ` is the law of
  the sum of `n` i.i.d. `ℕ`-valued summands for every `n ≥ 1` iff
  `-log E s^ξ = ∑_k ν_k (1 - s^k)` for `s ∈ (0, 1]` with a summable `ν ≥ 0`, `ν₀ = 0`; then `ν` is
  unique, and the law is the compound Poisson law with jump measure `ν` (Kallenberg, Exercise 7.10,
  p. 160).

*Proof route.* The roots are `ℕ`-valued with `P(root = 0) = P(ξ = 0)^{1/n} → 1`; `n` times their
laws off `0` are bounded measures that converge to `ν` by §2.3, and the generating function is
a power series in `s`.

*Needs:* §2.3.

**Checks.**

- The geometric law `P(k) = (1 - p) p^k` has `ν_k = p^k / k` (to `10⁻¹²` at `s = 0.2, 0.9`).
- Negative control for `ν ≥ 0`: the Bernoulli law `(δ₀ + δ₁) / 2` has
  `-log E s^ξ = ∑_k (-1)^{k+1} (1 - s^k) / k`, with `ν₂ = -1/2 < 0`, and it is not infinitely
  divisible.
- The exponential law is self-decomposable with `k(x) = e^{-x}`; the Poisson law is not, since its
  Lévy measure `λ δ₁` has no density.

### Examples

- Every stable law is self-decomposable: `k(x) = c₊ x^{-α}` on `(0, ∞)`.

### Dependencies

Layers 2–5.

## Downstream consumers

- No roadmap on main consumes this one. Lévy processes, local limit theorems in domains of
  attraction and rates of convergence to stable laws, listed under *Beyond this roadmap*, are the
  intended consumers of Layers 3, 5 and 7.

## Scope and ownership

Completion means:

1. Interval inversion, the atom formula, locally uniform convergence of characteristic functions
   and the convergence-of-types theorem on `ℝ` (Layer 1).
2. Infinite divisibility with its closure properties, the distinguished logarithm, unique roots,
   the compound Poisson approximation and the size constraints (Layer 2).
3. The Lévy–Khintchine formula with existence, uniqueness, affine images, moments, Doeblin's
   criterion, the half-line case and the Lévy measure as the limit of scaled roots (Layer 3).
4. Convergence of infinitely divisible laws through their triplets (Layer 4).
5. Khintchine's theorem, the Doeblin–Gnedenko criterion, Gaussian and Poisson convergence of
   infinitesimal arrays, and Feller's converse to Lindeberg's theorem (Layer 5).
6. Regular variation: the power form of the limit, the uniform convergence theorem, Karamata's
   theorem and the truncated-moment lemma (Layer 6).
7. Feller's weak laws, stable laws and their indices, stable laws as the limits of normalised
   i.i.d. sums, domains of attraction and their moments (Layer 7).
8. Self-decomposable laws and infinite divisibility on `ℕ` (Layer 8).

**Not owned here.**

- The sufficiency half of the Lindeberg–Feller theorem is owned by
  [MathematicalStatisticsAsymptotic](../MathematicalStatisticsAsymptotic/README.md) §1.2 (and the
  scalar form is formalized in Tau Ceti); this roadmap owns only the converse.
- The scalar stable laws in a fixed parametrisation, their construction, densities, tails and
  moments are owned by [StandardDistributions](../StandardDistributions/README.md), Layer 15, which
  excludes the general Lévy–Khintchine classification and domains of attraction; this roadmap owns
  those.
- The weak law for integrable i.i.d. sequences is owned by
  [MathematicalStatisticsFoundations](../MathematicalStatisticsFoundations/README.md) §8.5; this
  roadmap owns Feller's weak law without integrability.
- Free infinite divisibility is owned by [FreeProbability](../FreeProbability/README.md).
- Quantitative Poisson approximation (Le Cam and Stein–Chen bounds) belongs to the roadmap
  PoissonApproximation, local limit theorems to LocalLimitTheorems, the Berry–Esseen theorem,
  Fourier–Stieltjes transforms and Pólya's criterion to the higher-order and resampling roadmap of
  the MathematicalStatistics series, and series of independent variables (the three-series
  theorem) to SeriesOfIndependentRandomVariables. This roadmap's Poisson theorem is the qualitative
  limit in distribution and states no rate; its inversion theorem is the interval formula for an
  arbitrary law, which none of them states.
- Lévy continuity with existence of the limit is in Tau Ceti at the pin and is consumed; the
  compound Poisson law, convolution powers, the inversion of integrable characteristic functions,
  stable laws in Nolan's parametrisation and the Bernstein-function Lévy–Khintchine formula are in
  Tau Ceti at the pin and are reused in the proofs but are not imported by `Suggested.lean`.

## Exact supplier contracts

### From Mathlib

- `charFun` with `charFun_conv`, `charFun_gaussianReal` and `charFun_map_cast_poissonMeasure`
  (`Mathlib/MeasureTheory/Measure/CharacteristicFunction/`, `Mathlib/Probability/Distributions/`);
  `charFun_map_sum_pi_eq_prod`, the characteristic function of a sum under a product law
  (`Mathlib/Probability/Independence/CharacteristicFunction.lean`).
- Lévy's continuity theorem `ProbabilityMeasure.tendsto_iff_tendsto_charFun` and tightness
  `isTightMeasureSet_of_tendsto_charFun` (`Mathlib/MeasureTheory/Measure/LevyConvergence.lean`);
  the tail bound `measureReal_abs_gt_le_integral_charFun`
  (`Mathlib/MeasureTheory/Measure/IntegralCharFun.lean`).
- `TendstoInDistribution` (`Mathlib/MeasureTheory/Function/ConvergenceInDistribution.lean`),
  `TendstoInMeasure`, `iIndepFun`, `IdentDistrib`, `variance`, `MemLp`, `Measure.pi`.
- `gaussianReal` and `poissonMeasure`; the binomial-to-Poisson limit
  `tendsto_choose_mul_pow_of_tendsto_mul_atTop`
  (`Mathlib/Probability/Distributions/Poisson/PoissonLimitThm.lean`).
- The covering-map lifting `IsCoveringMap.existsUnique_continuousMap_lifts`
  (`Mathlib/Topology/Homotopy/Lifting.lean`) and `Complex.isCoveringMap_exp`
  (`Mathlib/Analysis/Complex/CoveringMap.lean`), for the distinguished logarithm.
- Mathlib has no interval inversion, convergence of types, infinite divisibility, Lévy–Khintchine
  formula, triangular-array limit theory, regular variation or domain of attraction.

### From Tau Ceti

- `TauCeti.exists_probabilityMeasure_of_tendsto_charFun`
  (`TauCeti/MeasureTheory/Measure/LevyConvergence.lean`): pointwise convergence of characteristic
  functions to a function continuous at `0` gives a limit law. It is used in §§2.1, 3.2.
- At the pin and reused in proofs, not imported:
  `TauCeti/Probability/Distributions/CompoundPoisson/`
  (the compound Poisson law and its characteristic function `exp (r (φ - 1))`),
  `TauCeti/MeasureTheory/Group/Convolution/Power.lean` (convolution powers),
  `TauCeti/Analysis/Bochner/CharFun/Inversion.lean` (the density of a law with integrable
  characteristic function), `TauCeti/Probability/Distributions/Stable/` (stable laws in Nolan's
  parametrisation and their exponents), and
  `TauCeti/Analysis/CompletelyMonotone/Bernstein/LevyKhintchine/` (the Lévy–Khintchine formula for
  Bernstein functions, the Laplace form on the half-line).

### From other roadmaps

- [MathematicalStatisticsAsymptotic](../MathematicalStatisticsAsymptotic/README.md) (on main):
  §1.2, the array convention (rows on `(Ωₙ, μₙ)` indexed by `Fin (m n)`, row independence) and the
  Lindeberg–Feller sufficiency theorem with its hypotheses (independent centred square-integrable
  rows, covariance sums converging, Lindeberg condition), which §5.5 complements.
- [StandardDistributions](../StandardDistributions/README.md) (on main): Layer 15, the stable
  laws, used as examples for §7.2 and §8.1.
- No other roadmap is consumed.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

- **Multivariate infinite divisibility**: the Lévy–Khintchine formula on `ℝ^d` and operator-stable
  laws.
- **Lévy processes**: the Lévy–Itô decomposition (Kallenberg, Theorem 7.5, p. 151) and the
  correspondence between infinitely divisible laws and Lévy processes; they need a theory of
  Poisson random measures.
- **Local limit theorems in domains of attraction** and **rates of convergence** to stable laws.
- **Partial attraction and the class of all limits of normalised sums of independent
  non-identically distributed variables** beyond self-decomposability (semistable laws).
- **Bingham–Goldie–Teugels-level regular variation**: de Haan theory, Abelian and Tauberian
  theorems.

## Prior formalization

- CKMA, *Core knowledge in mathematical analysis*, a Lean project under the Apache 2.0 licence
  (https://github.com/bjbraams/lean-CKMA), at commit f4bd822. Its synopsis numbers the results of
  area 06; the entries cited here are those numbers. `CKMA/Probability/InfinitelyDivisible/` proves
  the Lévy–Khintchine representation with a unique triplet for the truncation `1{|x| ≤ 1}` (06.51),
  the nonvanishing of infinitely divisible characteristic functions, their continuous logarithm, and
  the compound Poisson law, with no `sorry`; it is the starting point for §§2.1–2.3 and 3.1–3.2.
  `CKMA/Probability/LimitTheorems/LindebergFeller.lean` proves Feller's converse (06.34 necessity)
  and is the starting point for §5.5.
- CKMA coverage of this roadmap: 06.29 (§1.1), 06.34 necessity (§5.5), 06.35 and 06.38
  (Layers 5 and 7), 06.51 (Layer 3), 06.52 (§7.2).

## References

- O. Kallenberg, *Foundations of Modern Probability*, 3rd ed., Probability Theory and Stochastic
  Modelling 99, Springer, 2021. Chapters 6–7.
- A. Klenke, *Probability Theory: A Comprehensive Course*, 3rd ed., Universitext, Springer, 2020.
  Chapter 16.
- V. V. Petrov, *Sums of Independent Random Variables*, Ergebnisse der Mathematik 82, Springer,
  1975. Chapters I, II and IV.
- R. Durrett, *Probability: Theory and Examples*, 5th ed., Cambridge University Press, 2019.
  Sections 2.2, 3.3 and 3.6–3.9.
- P. Billingsley, *Probability and Measure*, 3rd ed., Wiley, 1995. Sections 26–28.
- M. Loève, *Probability Theory I*, 4th ed., Graduate Texts in Mathematics 45, Springer, 1977.
  Section 14 and Chapter VI.
- S. I. Resnick, *Heavy-Tail Phenomena: Probabilistic and Statistical Modeling*, Springer, 2007.
  Chapter 2.
- D. Applebaum, *Lévy Processes and Stochastic Calculus*, 2nd ed., Cambridge Studies in Advanced
  Mathematics 116, Cambridge University Press, 2009. Section 2.5.

# Roadmap: the Kesten–Stigum theorem and critical branching

**Summary.** This roadmap proves the classical limit theorems for a Galton–Watson process
`Z_0 = 1, Z_1, Z_2, …` beyond the question of extinction: how fast a supercritical process grows,
and how a critical process dies out. The process is a sequence of random variables with values
in the natural numbers, a Markov chain whose next state given `Z_n = j` is a sum of `j`
independent copies of an offspring variable `L` with law `ν` on `ℕ`. The mean is
`m = E L ∈ [0, ∞]`, the extinction probability is `q`, and in the critical case `m = 1` the
variance is `σ² = E (L − 1)² ∈ [0, ∞]`. No random tree is constructed: every statement is about
the generation sizes, and the arguments that are usually told with trees are carried out with
processes with immigration and with a change of measure on path space.

Headline theorems:

- **Kesten–Stigum.** Let `1 < m < ∞`. The martingale `Z_n / m^n` converges almost surely to a
  limit `W`, and the following are equivalent: `E[L log⁺ L] < ∞`; `E W = 1`; `P(W = 0) = q`.
  When `E[L log⁺ L] = ∞`, `W = 0` almost surely.
- **Seneta's theorem.** For a Galton–Watson process with offspring mean `1 < m < ∞` and
  independent, identically distributed immigration `Y_n`, started with no individuals, if
  `E log⁺ Y < ∞` then `Z_n / m^n` converges almost surely to a finite limit, and if
  `E log⁺ Y = ∞` then almost surely `Z_n / c^n` is unbounded for every `c > 0`.
- **Kolmogorov's estimate.** If `m = 1`, then `n P(Z_n > 0) → 2/σ²` in `[0, ∞]`; in particular
  `n P(Z_n > 0) → 0` when the variance is infinite.
- **Yaglom's limit law.** If `m = 1` and `0 < σ² < ∞`, the law of `Z_n / n` given `Z_n > 0`
  converges weakly to the exponential law with mean `σ²/2`.

The Galton–Watson process itself, its generating functions, its martingale, its extinction
probability and its limit in `L²` under a second moment belong to the roadmap PopulationDynamics,
whose definitions are used here unchanged. Mathlib supplies martingale convergence, the
Borel–Cantelli lemmas, Radon–Nikodym derivatives, mutual singularity and Lévy's continuity
theorem; Tau Ceti supplies the path laws of Markov chains, convolution powers of measures,
size-biased (weighted) laws and the characteristic function of the exponential law.

Layer 1 below proves two general dichotomies: the growth of an independent identically
distributed sequence according to whether its mean is finite, and the absolute continuity or
singularity of two measures read off from the limit of their density process. Layer 2 defines
the Galton–Watson process with immigration, proves Seneta's theorem, and identifies the
Galton–Watson law reweighted by `Z_n / m^n` with one plus a process with immigration. Layer 3
combines them into the Kesten–Stigum theorem. Layer 4 treats the critical process through the
iterates of the generating function, and uses neither Layer 2 nor Layer 3.

## Conventions

- **Offspring laws and the process.** An offspring law is a probability measure `ν` on `ℕ`, with
  `p_k = ν {k}` and generating function `f`. The objects of PopulationDynamics Layer 1 are used
  as defined there, and `Suggested.lean` carries verbatim copies of them: the generation kernel
  `gwKernel ν`, which sends `n` to the `n`-fold convolution power of `ν` (PopulationDynamics
  1.1); the mean `offspringMean ν`, the lower integral of `k` against `ν`, in `[0, ∞]`
  (PopulationDynamics 1.1); the predicate `IsGaltonWatson ν Z μ`, which says that the path map
  of `Z : ℕ → Ω → ℕ` has under `μ` the law of the chain with kernel `gwKernel ν` started at `1`
  (PopulationDynamics 1.2); and the extinction probability `extinctionProb ν`, the probability
  under that path law that some coordinate is `0` (PopulationDynamics 1.4). Statements write
  `m` for the real number `(offspringMean ν).toReal` once `offspringMean ν` is known to be finite.
- **Measurability.** `HasLaw` makes `μ` a probability measure and each `Z n` almost everywhere
  measurable, not measurable; events such as `{Z n > 0}` are therefore null-measurable and their
  measures are those computed from the path law. Limits of `Z_n / m^n` are almost everywhere
  limits of almost everywhere measurable functions; the Kesten–Stigum theorem asserts a
  measurable version `W` of the limit, so that `E W` and `P(W = 0)` are the integral and measure
  of a measurable function. The general theorems of Layer 1 assume measurability of every
  variable they integrate.
- **The `L log L` condition.** `E[L log⁺ L] < ∞` is written as integrability of
  `k ↦ k · log k` against `ν`, and `E log⁺ Y < ∞` as integrability of `k ↦ log k` against the
  immigration law. For natural numbers `log k = log⁺ k` because Mathlib's `Real.log` has
  `log 0 = 0` and `log 1 = 0`; both functions are nonnegative on `ℕ`.
- **Size biasing.** For an offspring law with `0 < m < ∞`, the size-biased law `ν̂` has mass
  `k p_k / m` at `k`. It is Tau Ceti's `ν.weighted (fun k ↦ k)`, the law `ν` reweighted by `k` and
  normalized, which is the zero measure when the total weight `m` is `0` or `∞`. `ν̂` lives on
  `k ≥ 1`, so `ν̂ − 1` (the image under `k ↦ k − 1`) is a probability law on `ℕ`.
- **Variance in the critical case.** When `m = 1`, `σ² = ∫ (k − 1)² dν(k) ∈ [0, ∞]`, written in
  Lean as the lower integral of `ENNReal.ofReal ((k − 1)²)`. When `ν` has a second moment, this is
  Mathlib's `Var[fun k ↦ (k : ℝ); ν]`. `σ² = 0` exactly when `ν` is the point mass at `1`.
- **Values in `[0, ∞]`.** Kolmogorov's estimate is stated in `[0, ∞]`, where `2 / ∞ = 0` and
  `2 / 0 = ∞`; both conventions give the true limit (see the Checks of 4.1).
- **Weak convergence.** The law of `Z_n / n` given `Z_n > 0` is the image of Mathlib's
  conditioned measure `μ[|{Z_n > 0}]`. Weak convergence to a probability law `P` on `ℝ` is the
  convergence of `∫ g` for every bounded continuous `g : ℝ → ℝ`, which is how Mathlib's
  `TendstoInDistribution` and the topology of `ProbabilityMeasure ℝ` are characterized
  (`ProbabilityMeasure.tendsto_iff_forall_integral_rclike_tendsto`). Under the hypotheses of 4.2,
  `P(Z_n > 0) > 0` for every `n`, so the conditioned measures are probability measures.
- **The exponential law.** Mathlib's `expMeasure r` is the exponential law of rate `r`, mean
  `1/r`; the exponential law of mean `σ²/2` is `expMeasure (2/σ²)`.

## Layer 1: two dichotomies

### 1.1 Growth of an independent identically distributed sequence

Prove `ae_tendsto_div_or_frequently_lt`: let `X_0, X_1, …` be measurable, nonnegative,
independent and identically distributed on a probability space. If `X_0` is integrable, then
`X_n / n → 0` almost surely; otherwise, almost surely, `X_n / n > C` for infinitely many `n`,
for every real `C`. In other words `limsup X_n / n` is almost surely `0` or `∞` according as
`E X_0` is finite or infinite (Lyons–Peres, Lemma 12.1, p. 413).

Route: for `ε > 0`, `∑_n P(X_0 > εn) < ∞` when `X_0` is integrable (Mathlib
`tsum_prob_mem_Ioi_lt_top`, applied to `X_0 / ε`), and the first Borel–Cantelli lemma gives
`X_n ≤ εn` eventually (the first part also follows from Mathlib's strong law
`ProbabilityTheory.strong_law_ae_real`, since `X_n / n = S_(n+1) / n − S_n / n` for the partial
sums `S_n = X_0 + ⋯ + X_(n−1)`); when `X_0` is not integrable, the bound
`E X_0 ≤ C (1 + ∑_{n ≥ 1} P(X_0 > Cn))` forces `∑_n P(X_n > Cn) = ∞` for every `C > 0`, and the
second Borel–Cantelli lemma for the independent events `{X_n > Cn}` gives infinitely many of
them almost surely; countably many `C` suffice.

The form used in Layer 2: if `E log⁺ Y < ∞`, then for every `c > 1` almost surely
`Y_n ≤ c^n` for all large `n`, so `∑ Y_n / a^n < ∞` for every `a > 1`; if `E log⁺ Y = ∞`, then
almost surely `Y_n > C c^n` infinitely often for every `C` and every `c > 0` (apply 1.1 to
`log⁺ Y_n`; Lyons–Peres, Exercise 12.2, p. 413, is the same consequence in exponential form).

**Checks.**

- `X_n = 1` for all `n`: `X_n / n = 1/n → 0`.
- `P(X_0 > x) = 1/x` for `x ≥ 1`: `E X_0 = ∞`, `∑_n P(X_0 > Cn)` diverges like the harmonic
  series for every `C > 0`, and `X_n / n` is unbounded almost surely.
- Independence is needed in the second part: if `X_n = X_0` for all `n` with `E X_0 = ∞`, then
  `X_n / n = X_0 / n → 0` everywhere.

*Needs:* Mathlib `tsum_prob_mem_Ioi_lt_top` (or `strong_law_ae_real`),
`measure_limsup_atTop_eq_zero`, `measure_limsup_eq_one`, `iIndepFun`, `IdentDistrib`. (Proved here.)

### 1.2 The dichotomy for a density process

Prove `absolutelyContinuous_mutuallySingular_iff_limsup`: let `μ` be a finite measure and `ν` a
probability measure on `(Ω, F)`, let `ℱ_0 ≤ ℱ_1 ≤ ⋯` be a filtration whose union generates `F`,
and let `X_n : Ω → [0, ∞]` be `ℱ_n`-measurable with `μ(s) = ∫_s X_n dν` for every `s ∈ ℱ_n`
(that is, `X_n` is a density of `μ` with respect to `ν` on `ℱ_n`). Put
`X = limsup_n X_n ∈ [0, ∞]`. Then

- `μ ≪ ν` if and only if `X < ∞` `μ`-almost everywhere, if and only if `∫ X dν = μ(Ω)`;
- `μ ⟂ ν` if and only if `X = ∞` `μ`-almost everywhere, if and only if `∫ X dν = 0`

(Lyons–Peres, Lemma 12.2, p. 417).

Route: `X_n` is a nonnegative `ν`-martingale for `ℱ`, so it converges `ν`-almost everywhere to
`X`, which is finite `ν`-almost everywhere. When `μ ≪ ν`, `X_n` is the conditional expectation
of the density `dμ/dν` given `ℱ_n`, and Lévy's upward theorem gives `X = dμ/dν`
`ν`-almost everywhere. In general, apply this to `μ` and `ν` against `(μ + ν)/C`, with
`C = μ(Ω) + 1`, and divide the two density processes to obtain the decomposition
`μ = X · ν + 1_{X = ∞} · μ`; each equivalence is read off from it.

**Checks.**

- Coin tossing: `Ω = {0, 1}^ℕ`, `ℱ_n` generated by the first `n` coordinates, `ν` the fair
  product law and `μ` the product of Bernoulli laws of parameter `3/4`. Then `X_n` is a product of
  `n` factors `3/2` or `1/2`; under `ν` the mean of `log` of a factor is `½ log(3/4) ≈ −0.1438`, so
  `X_n → 0` `ν`-almost surely, and under `μ` it is `¾ log(3/2) + ¼ log(1/2) ≈ 0.1308`, so
  `X_n → ∞` `μ`-almost surely: the laws are mutually singular and `∫ X dν = 0`.
- `μ = ν`: `X_n = 1`, `X = 1` and `∫ X dν = 1 = μ(Ω)`.
- The generating hypothesis is needed: with `ℱ_n` trivial for all `n` and `F` the coin-tossing
  σ-algebra, `X_n = μ(Ω)` is constant, `∫ X dν = μ(Ω)`, but the two laws of the first Check are
  singular.

*Needs:* Mathlib `Martingale`, `Submartingale.ae_tendsto_limitProcess`, `tendsto_ae_condExp`,
`Measure.rnDeriv`, `Measure.MutuallySingular`, `Measure.AbsolutelyContinuous`. (Proved here.)

### Examples

- If `μ ≪ ν` on all of `F` and every `ℱ_n` equals `F`, then `X_n = dμ/dν` for every `n`, and 1.2
  says that `dμ/dν` is finite `μ`-almost everywhere and has `ν`-integral `μ(Ω)`.
- In Layer 3, 1.2 is applied on the path space `ℕ → ℕ` with the filtration of the first
  coordinates, to the reweighted Galton–Watson law of 2.3 and the Galton–Watson law.

### Dependencies

Layer 1 uses only Mathlib (Borel–Cantelli lemmas, the tail-sum estimate of the strong law,
martingale convergence, Lévy's upward theorem, Radon–Nikodym derivatives).

## Layer 2: processes with immigration and size biasing

### 2.1 Galton–Watson processes with immigration

Define `immigrationKernel ν ρ`, the kernel on `ℕ` that sends `n` to the convolution of the
`n`-fold convolution power of `ν` with `ρ`; for probability measures `ν` and `ρ` it is a Markov
kernel. Define `IsGaltonWatsonImmigration ν ρ Z μ`: the path map of `Z` has under `μ` the law of
the chain with kernel `immigrationKernel ν ρ` started at `0`. Each generation is the offspring of
the previous one, independently with law `ν`, together with an independent number of immigrants
with law `ρ`; the process starts with no individuals (Lyons–Peres, §12.1, p. 416).

- With `ρ` the point mass at `0`, `immigrationKernel ν ρ = gwKernel ν`.
- The mean of `Z_n` is `E Y · (m^(n−1) + ⋯ + m + 1)` for `0 ≤ m < ∞`, by the recursion
  `E Z_(n+1) = m E Z_n + E Y`.

**Checks.**

- `ν = δ_2`, `ρ = δ_1`: `Z_n = 2^n − 1` and `Z_n / 2^n → 1`.
- `ν = ½ δ_0 + ½ δ_2`, `ρ = δ_1`, from the state `1`: the next state is `1` or `3`, with
  probabilities `½` and `½`. A kernel in which the immigrant arrives before reproduction would
  let `2` individuals reproduce and give `0`, `2`, `4` with probabilities `¼`, `½`, `¼`.

*Needs:* Mathlib `Kernel.ofFunOfCountable`, `Measure.conv`, `HasLaw`; Tau Ceti
`Measure.convolutionPower`, `markovChainLaw`. (Proved here.)

### 2.2 Seneta's theorem

Prove `IsGaltonWatsonImmigration.seneta`: let `1 < m < ∞` and let `Z` be a Galton–Watson process
with offspring law `ν` and immigration law `ρ`. If `E log⁺ Y < ∞` for `Y` of law `ρ`, then almost
surely `Z_n / m^n` converges to a finite limit; if `E log⁺ Y = ∞`, then almost surely, for every
`c > 0`, `Z_n / c^n` is unbounded (Lyons–Peres, Theorem 12.3, p. 418, where the second part is
stated for each `c`; countably many `c` suffice).

Route (that of Lyons–Peres, after Asmussen–Hering): realize the process from independent
offspring counts and immigration counts on a product space, and check by the product formula
for prefixes that its path law is the one of 2.1, so that the statement transfers. If
`E log⁺ Y = ∞`, then `Z_n ≥ Y_n` and the second part of 1.1 applies. If `E log⁺ Y < ∞`, fix the
immigration sequence `y`. Writing `Z_(n,k)` for the descendants in generation `n` of the `y_k`
immigrants of generation `k`, each `Z_(n,k) / m^(n−k)` is the martingale of PopulationDynamics
1.3 started from `y_k` individuals, so given `y` the process `Z_n / m^n` is a nonnegative
submartingale with `E[Z_n / m^n] = ∑_(k ≤ n) y_k / m^k`. This series converges for almost every
`y` by 1.1, so the submartingale is bounded in `L¹` and converges almost surely; Fubini's theorem
over the immigration coordinates ends the proof.

**Checks.**

- `ν = δ_2`, `ρ = δ_1`: `E log⁺ Y = 0` and `Z_n / 2^n = 1 − 2^(−n) → 1`.
- `ρ {2^(2^j)} = 2^(−j)` for `j ≥ 1` is a probability law with
  `E log Y = ∑_j 2^(−j) 2^j log 2 = ∞`. For every offspring law with `1 < m < ∞`, `Z_n / c^n`
  is then almost surely unbounded for every `c > 0`, already because `Z_n ≥ Y_n` and
  `Y_n > C c^n` for infinitely many `n` (1.1 applied to `log⁺ Y_n`).
- `m > 1` is needed: for `ν = δ_1` (`m = 1`) and `ρ = δ_1`, `Z_n = n`, and `Z_n / 1^n` does not
  converge although `E log⁺ Y = 0`.

*Needs:* 1.1, 2.1; PopulationDynamics 1.1 (branching property) and 1.3 (the martingale);
Mathlib `Submartingale.ae_tendsto_limitProcess`, `Measure.infinitePi`; Tau Ceti
`markovChainLaw_map_prefix_apply_singleton`.

### 2.3 The size-biased process

Prove `sizeBiased_eq_setLIntegral`: let `0 < m < ∞` and let `ρ` be `ν̂ − 1`, the size-biased
offspring law shifted down by one. Let `P` be the path law of the Galton–Watson process started
at `1` and `Q` the path law of `1 + Z'`, where `Z'` is the process with immigration of 2.1 with
offspring law `ν` and immigration law `ρ`. Then for every `n` and every set `s` of paths that
depends only on the coordinates `0, …, n`,

`Q(s) = ∫_s x_n / m^n dP(x)`,

so `x_n / m^n` is the density of `Q` with respect to `P` on the first `n + 1` coordinates
(Lyons–Peres, (12.1)–(12.2), p. 415, and the description of the size-biased tree after
Figure 12.1, p. 416, read on the generation sizes).

Route: both sides are determined by their values on the paths `(1, z_1, …, z_n)`. By the product
formula, the left side is `∏_i (ν^(*(z_i − 1)) ∗ ν̂)(z_(i+1))` and the right side is
`(z_n / m^n) ∏_i ν^(*z_i)(z_(i+1))`. The two products agree factor by factor because the
size-biased law of a sum of `j ≥ 1` independent copies of `L` is `ν^(*(j−1)) ∗ ν̂`, that is,
`k ν^(*j)(k) / (jm) = (ν^(*(j−1)) ∗ ν̂)(k)` (Lyons–Peres, Exercise 12.12 (c), p. 424); the factors
`z_(i+1) / (m z_i)` telescope to `z_n / m^n`. Paths through `0` have weight `0` on both sides.

**Checks.**

- `ν = ¼ δ_0 + ¼ δ_1 + ½ δ_2`: `m = 5/4`, `ν̂ = ⅕ δ_1 + ⅘ δ_2` and `ρ = ⅕ δ_0 + ⅘ δ_1`. The path
  `(1, 2)` has `Q`-probability `ρ{1} = ⅘` and `P`-probability `½`, and `(2 / (5/4)) · ½ = ⅘`.
  Exact rational computation confirms the identity on every path of length `3` with entries below
  `12`, for this law and for `⅛ δ_0 + ⅜ δ_1 + ⅜ δ_2 + ⅛ δ_3` and `½ δ_0 + ½ δ_3`.
- Poisson offspring of mean `λ > 0`: `ν̂ − 1` is again Poisson of mean `λ` (Tau Ceti
  `weighted_poissonMeasure`), so `Q` is one plus a process with Poisson immigration.
- The shift by one is needed: `Q` charges only paths with all coordinates `≥ 1`, and immigration
  with law `ν̂` itself would give `Q`-probability `ν̂{2} = ⅘` to the path `(1, 3)` in the first
  Check, where the right side is `0`.

*Needs:* 2.1; PopulationDynamics 1.1 (the generation kernel); Mathlib `Filtration.piLE`,
`Measure.conv`; Tau Ceti `Measure.weighted`, `Measure.weighted_apply`,
`Measure.isProbabilityMeasure_weighted`, `markovChainLaw_map_prefix_apply_singleton`.
(Proved here.)

### Examples

- Binary splitting `ν = (1 − a) δ_0 + a δ_2` with `½ < a ≤ 1`: `m = 2a`, `ν̂ = δ_2`, and `ρ = δ_1`:
  the reweighted process is one plus the process with exactly one immigrant per generation.

### Dependencies

2.1 uses Mathlib and Tau Ceti kernels and path laws. 2.2 uses 1.1, 2.1 and PopulationDynamics
1.1 and 1.3. 2.3 uses 2.1, PopulationDynamics 1.1 and Tau Ceti's weighted laws. Layer 2 does not
use 1.2.

## Layer 3: the Kesten–Stigum theorem

### 3.1 The Kesten–Stigum theorem

Prove `IsGaltonWatson.kestenStigum`: let `Z` be a Galton–Watson process with offspring law `ν`
and `1 < m < ∞`. There is a measurable `W : Ω → ℝ` with `Z_n / m^n → W` almost surely, and

- `E[L log⁺ L] < ∞` if and only if `E W = 1`;
- `E[L log⁺ L] < ∞` if and only if `P(W = 0) = q`;
- if `E[L log⁺ L] = ∞`, then `W = 0` almost surely

(Lyons–Peres, Kesten–Stigum theorem, §5.1, p. 137, and §12.1, p. 413; proof in §12.2, p. 418;
Lyons–Pemantle–Peres, Theorem A, p. 1126).
Since any two almost sure limits agree almost surely, the statements hold for every version of
the limit.

Route (Lyons–Pemantle–Peres, without trees):

1. Existence of `W`: on path space under `P`, the coordinates are measurable and `x_n / m^n` is a
   nonnegative martingale (PopulationDynamics 1.3), bounded in `L¹`, so it converges almost
   surely; `W` is a measurable version of the limit composed with the path map of `Z`, and every
   statement transfers along the equality of path laws.
2. Apply 1.2 on `ℕ → ℕ` with the filtration of the first coordinates, `μ = Q` and `ν = P` of 2.3,
   and `X_n = x_n / m^n`; the supremum of the σ-algebras `Filtration.piLE n` is the product
   σ-algebra, because each coordinate is measurable for one of them (proved here; the pinned
   libraries do not state it). On the event where `x_n / m^n` converges, `limsup X_n` is its
   limit.
3. `E log⁺ (L̂ − 1) < ∞` if and only if `E[L log⁺ L] < ∞`, because
   `E log⁺ (L̂ − 1) = m⁻¹ ∑_k k p_k log⁺ (k − 1)` and `0 ≤ k log k − k log (k − 1) ≤ 2` for
   `k ≥ 2`.
4. If `E[L log⁺ L] < ∞`, 2.2 applied to `Q` (one plus a process with immigration `ν̂ − 1`) gives
   `limsup x_n / m^n < ∞` `Q`-almost surely, so `∫ W dP = 1` by 1.2. If `E[L log⁺ L] = ∞`, 2.2
   with `c = m` gives `limsup x_n / m^n = ∞` `Q`-almost surely, so `∫ W dP = 0` and `W = 0`
   `P`-almost surely.
5. `P(W = 0)` is a fixed point of `f` in `[0, 1]`: by the Markov property at time `1` and the
   branching property of PopulationDynamics 1.1, given `Z_1 = j` the limit is `m⁻¹` times the
   sum of the limits of `j` independent copies of the process, which vanishes exactly when each
   of them does. Since `m > 1`, the only fixed points of `f` in `[0, 1]` are `q` and `1`
   (PopulationDynamics 1.4 and the strict convexity in 1.1), and `q < 1`
   (PopulationDynamics 1.4). So `E W = 1` forces `P(W = 0) = q`, and `P(W = 0) = q < 1` excludes
   the case `W = 0` almost surely, hence forces `E[L log⁺ L] < ∞` by step 4.

**Checks.**

- `ν = δ_2`: `Z_n / 2^n = 1`, `W = 1`, `E[L log L] = 2 log 2`, `E W = 1`, and
  `P(W = 0) = 0 = q`.
- `ν = ¼ δ_0 + ¼ δ_1 + ½ δ_2`: `m = 5/4`, `E[L log L] = log 2`, `q = ½`, so `E W = 1` and
  `P(W = 0) = ½`.
- A finite second moment is not needed: `p_k = k^(−3) / ζ(3)` for `k ≥ 1` has
  `m = ζ(2)/ζ(3) ≈ 1.368`, `E L² = ∞` and `E[L log L] = ∑ log k / (ζ(3) k²) < ∞`, so `E W = 1`
  here although PopulationDynamics 1.5 does not apply.
- The condition is not vacuous: `p_k = c / (k² (log k)²)` for `k ≥ 2`, with `c ≈ 1/0.6926`, has
  finite mean `m ≈ 3.05 > 1` and `E[L log L] = c ∑ 1/(k log k) = ∞`; here `W = 0` almost surely
  while `q < 1`, so `P(W = 0) = 1 ≠ q`.
- `m > 1` is needed: for `ν = ½ δ_0 + ½ δ_2` (`m = 1`), `E[L log L] = log 2 < ∞` while
  `Z_n → 0` almost surely, so `W = 0` and `E W = 0 ≠ 1`.

*Needs:* 1.2, 2.2, 2.3; PopulationDynamics 1.1, 1.3 and 1.4; Mathlib
`Submartingale.ae_tendsto_limitProcess`, `aemeasurable_of_tendsto_metrizable_ae'`,
`Filtration.piLE`; Tau Ceti
`Measure.condExp_shift_iterate_markovChainLaw`.

### Examples

- Binary splitting `ν = (1 − a) δ_0 + a δ_2` with `½ < a ≤ 1`: `E[L log L] = 2a log 2 < ∞`, so
  `E W = 1` and `P(W = 0) = (1 − a)/a`.

### Dependencies

Layer 3 uses 1.2, 2.2 and 2.3 and PopulationDynamics 1.1, 1.3 and 1.4.

## Layer 4: critical processes

### 4.1 Kolmogorov's estimate

Prove `IsGaltonWatson.tendsto_mul_measure_pos`: if `m = 1`, then `n P(Z_n > 0) → 2/σ²` in
`[0, ∞]`, with `σ² = E (L − 1)² ∈ [0, ∞]` (Lyons–Peres, Theorem 12.7 (i), p. 420, which
attributes the theorem to Kesten, Ney and Spitzer, 1966; Lyons–Pemantle–Peres, Theorem C (i),
p. 1126; for `E L³ < ∞` due to Kolmogorov, 1938). No moment beyond the mean is assumed: the
limit is `0` when `σ² = ∞`.

Route (the classical generating-function argument; Lyons–Peres prove it with trees instead):
`P(Z_n > 0) = 1 − f^[n](0)` by PopulationDynamics 1.2. For `0 ≤ s < 1` put
`φ(s) = 1/(1 − f(s)) − 1/(1 − s)`. Then `f(s) ≥ s` and `f(s) − s = ∑_k p_k (s^k − 1 + k(1 − s))`,
where each bracket divided by `(1 − s)²` increases to `k(k − 1)/2` as `s ↑ 1`; hence `φ(s) ≥ 0`,
`φ` is bounded with `φ(s) → σ²/2` when `σ² < ∞`, and `φ(s) → ∞` when `σ² = ∞`. Telescoping,
`1/(1 − f^[n](0)) = 1 + ∑_(k < n) φ(f^[k](0))`, and `f^[k](0) ↑ q = 1` (PopulationDynamics 1.4)
unless `ν = δ_1`; the Cesàro means of `φ(f^[k](0))` tend to `σ²/2`. If `ν = δ_1`, `Z_n = 1` and
`n P(Z_n > 0) = n → ∞ = 2/0`.

**Checks.**

- Critical geometric offspring, `p_k = 2^(−(k+1))`: `σ² = 2` and `P(Z_n > 0) = 1/(n + 1)` exactly
  (PopulationDynamics 1.6), so `n P(Z_n > 0) = n/(n + 1) → 1 = 2/σ²`.
- `ν = ½ δ_0 + ½ δ_2`: `σ² = 1`; iterating `f(s) = (1 + s²)/2` gives `n P(Z_n > 0) ≈ 1.983` at
  `n = 1000` and `≈ 1.9997` at `n = 10^5`, tending to `2`. The uncentred second moment `E L² = 2`
  would give the wrong limit `1`.
- Infinite variance: `f(s) = s + ½ (1 − s)^(3/2)` is the generating function of an offspring law
  (its coefficients are `½`, `¼` and then positive) with `m = 1` and `σ² = ∞`; iterating gives
  `n P(Z_n > 0) ≈ 1.6 · 10^(−4)` at `n = 10^5`, tending to `0`.
- `ν = δ_1`: `σ² = 0` and `n P(Z_n > 0) = n → ∞ = 2/0` in `[0, ∞]`.

*Needs:* PopulationDynamics 1.1, 1.2 and 1.4. (Proved here.)

### 4.2 Yaglom's limit law

Prove `IsGaltonWatson.yaglom`: if `m = 1`, `ν` has a finite second moment and `ν ≠ δ_1` (so that
`0 < σ² < ∞`), then for every bounded continuous `g : ℝ → ℝ`,

`E[g(Z_n / n) | Z_n > 0] → ∫ g d(expMeasure (2/σ²))`,

that is, the law of `Z_n / n` given `Z_n > 0` converges weakly to the exponential law of mean
`σ²/2` (Lyons–Peres, Theorem 12.7 (ii), p. 420; for `E L³ < ∞` due to Yaglom, 1947). The case
`σ² = ∞` is not treated: Lyons–Peres say after Theorem 12.7 that it appears to be open, and the
2003 erratum to Lyons–Pemantle–Peres withdraws their proof of the corresponding claim of
their Theorem C (ii).

Route (characteristic functions): extend `f` to the closed complex unit disc by its power series.
The first step, proved here, is `E[w^(Z_n)] = f^[n](w)` for complex `|w| ≤ 1`, which
PopulationDynamics 1.2 states for real `s` only: the complex generating function of `ν^(*j)` is
`f(w)^j`, because a convolution is the image of a product measure under addition (Mathlib
`MeasureTheory.integral_prod_mul`); the law of `Z_n` is the `n`-th power of the generation kernel
applied to `δ_1` (Tau Ceti `Measure.markovChainLaw_map_eval`), so `E[w^(Z_(n+1))] = E[f(w)^(Z_n)]`;
and induction on `n`, for all `w` in the disc at once, uses `|f(w)| ≤ 1`. With `s_n = e^(it/n)`,
the characteristic function of the conditioned law at `t` is
`(f^[n](s_n) − f^[n](0)) / (1 − f^[n](0))`. Since `E L² < ∞`,
`f(w) = w + (σ²/2)(1 − w)² + o(|1 − w|²)` as `w → 1` in the disc, so
`1/(1 − f(w)) − 1/(1 − w) → σ²/2`; because `|1 − f^[k](s_n)| ≤ |t| E Z_k / n = |t|/n` for every
`k`, telescoping as in 4.1 gives `n (1 − f^[n](s_n)) → (i/t + σ²/2)^(−1)` for `t ≠ 0`, and with
4.1 the characteristic functions tend to `1/(1 − i t σ²/2)`, which is the characteristic function
of `expMeasure (2/σ²)` (Tau Ceti `charFun_expMeasure`). Lévy's continuity theorem
(`ProbabilityMeasure.tendsto_iff_tendsto_charFun`) gives weak convergence. A route through
Laplace transforms at real arguments would need only PopulationDynamics 1.2, but also a
continuity theorem for Laplace transforms on `[0, ∞)`, which the pinned libraries lack (Tau Ceti
has the uniqueness theorem `TauCeti.Measure.ext_of_forall_integral_exp_neg_mul_eq`).

**Checks.**

- Critical geometric offspring: given `Z_n > 0`, `Z_n` is geometric on `{1, 2, …}` with
  `P(Z_n > k | Z_n > 0) = (n/(n + 1))^k` (exact computation for `n ≤ 4`, `k < 15`), so
  `P(Z_n / n > x | Z_n > 0) → e^(−x)`: the exponential law of mean `1 = σ²/2`.
- `ν = ½ δ_0 + ½ δ_2` (`σ² = 1`): at `n = 20000` the conditioned characteristic function at
  `t = 2` is `≈ 0.4997 + 0.5003 i`, against `1/(1 − i) = 0.5 + 0.5 i` for the exponential law of
  mean `½`; with mean `σ² = 1` instead it would be `0.2 + 0.4 i`.
- `ν ≠ δ_1` is needed: for `ν = δ_1`, `Z_n / n = 1/n → 0`, and the limit is the point mass at `0`.

*Needs:* 4.1; PopulationDynamics 1.1 (the generation kernel), 1.2 and 1.4; Mathlib
`ProbabilityTheory.cond`, `MeasureTheory.integral_prod_mul`,
`ProbabilityMeasure.tendsto_iff_tendsto_charFun`,
`ProbabilityMeasure.tendsto_iff_forall_integral_rclike_tendsto`, `expMeasure`; Tau Ceti
`Measure.markovChainLaw_map_eval`, `charFun_expMeasure`. (Proved here.)

### Examples

- Poisson offspring of mean `1`: `σ² = 1`, `n P(Z_n > 0) → 2`, and `Z_n / n` given `Z_n > 0`
  tends to the exponential law of mean `½`.

### Dependencies

Layer 4 uses PopulationDynamics 1.1, 1.2 and 1.4, Mathlib's Lévy continuity theorem and Tau
Ceti's characteristic function of the exponential law. It uses none of Layers 1–3.

## Scope and ownership

This roadmap owns: the growth dichotomy 1.1 for independent identically distributed sequences;
the dichotomy 1.2 for density processes; the Galton–Watson process with immigration and Seneta's
theorem; the identification 2.3 of the reweighted Galton–Watson law with a process with
immigration; the Kesten–Stigum theorem; Kolmogorov's estimate; and Yaglom's limit law.

Left to other roadmaps and to the libraries:

- PopulationDynamics (Layer 1) owns the Galton–Watson process: the generation kernel and the
  branching property (1.1), the generating functions and moments (1.2), the martingale
  `Z_n / m^n` (1.3), the extinction probability with its characterization as the least fixed
  point of `f` (1.4), the convergence in `L²` with `E W = 1` and `P(W = 0) = q` under a second
  moment (1.5) and the geometric offspring law (1.6). This roadmap copies its definitions and
  states none of its theorems; the Kesten–Stigum theorem above replaces the second moment of 1.5
  by `E[L log⁺ L] < ∞` and adds the converse, which that roadmap names as outside its scope.
- Size-biased laws are Tau Ceti's `Measure.weighted`, with the Poisson case
  `weighted_poissonMeasure`; StandardDistributions (§7.12, weighted laws and size biasing) owns
  them. They are used, not restated.
- The Borel–Cantelli lemmas, martingale convergence, Lévy's upward theorem, Radon–Nikodym
  derivatives and Lévy's continuity theorem are Mathlib's. Mathlib's `Kernel.densityProcess`
  (`Mathlib/Probability/Kernel/Disintegration/Density.lean`) is a martingale of density ratios
  for a kernel dominated by another on a countably generated space; it covers neither
  singular measures nor the dichotomy 1.2.
- SeriesOfIndependentRandomVariables proves the Marcinkiewicz–Zygmund strong law (4.2 there),
  whose necessity step uses the same Borel–Cantelli argument as 1.1; 1.1 is a different
  statement (no sums, no centring), stated for the use made of it in Layer 2.
- The Hawkes cluster process of the roadmap PointProcesses (Layer 12) builds a Galton–Watson
  process with Poisson offspring for its own use; nothing here concerns point processes.

Not treated here: Galton–Watson trees as random trees and the size-biased tree with its spine;
the Seneta–Heyde norming of a supercritical process; subcritical processes (Heathcote's theorem
and the Yaglom limit of a subcritical process); Yaglom's law for infinite variance; multi-type,
continuous-time and age-dependent branching processes; branching random walks; and branching
approximations of random graphs.

## Exact supplier contracts

### From Mathlib

- `Kernel.ofFunOfCountable` (`Mathlib/Probability/Kernel/Basic.lean`): a function from a
  countable type with measurable singletons to measures is a kernel.
- `ProbabilityTheory.HasLaw` (`Mathlib/Probability/HasLaw.lean`): the map is almost everywhere
  measurable and pushes the measure forward to the given law.
- `MeasureTheory.Measure.conv`, notation `∗` (`Mathlib/MeasureTheory/Group/Convolution.lean`):
  the image of the product measure under addition; a probability measure when both factors are.
- `MeasureTheory.Filtration.piLE` (`Mathlib/Probability/Process/Filtration.lean`): on a product
  `Π i, X i`, the filtration whose `i`-th σ-algebra consists of the measurable sets depending
  only on the coordinates `≤ i`.
- `MeasureTheory.Measure.MutuallySingular` (notation `⟂ₘ`) and
  `MeasureTheory.Measure.AbsolutelyContinuous` (notation `≪`); `MeasureTheory.Measure.rnDeriv`
  (`Mathlib/MeasureTheory/Measure/Decomposition/Lebesgue.lean`).
- `MeasureTheory.Martingale` (`Mathlib/Probability/Martingale/Basic.lean`);
  `MeasureTheory.Submartingale.ae_tendsto_limitProcess` (a submartingale bounded in `L¹` for a
  finite measure converges almost everywhere) and `MeasureTheory.tendsto_ae_condExp` (Lévy's
  upward theorem: conditional expectations along a filtration converge almost everywhere to the
  conditional expectation given its supremum) (`Mathlib/Probability/Martingale/Convergence.lean`).
- `MeasureTheory.measure_limsup_atTop_eq_zero` (first Borel–Cantelli lemma,
  `Mathlib/MeasureTheory/OuterMeasure/BorelCantelli.lean`);
  `ProbabilityTheory.measure_limsup_eq_one` (second Borel–Cantelli lemma for independent
  measurable sets, `Mathlib/Probability/BorelCantelli.lean`);
  `ProbabilityTheory.tsum_prob_mem_Ioi_lt_top` (for an integrable nonnegative `X`,
  `∑_j P(X > j) < ∞`) and `ProbabilityTheory.strong_law_ae_real` (the strong law for pairwise
  independent identically distributed integrable real variables)
  (`Mathlib/Probability/StrongLaw.lean`); `ProbabilityTheory.iIndepFun`,
  `ProbabilityTheory.IdentDistrib`.
- `MeasureTheory.Measure.infinitePi`, the product of a family of probability measures
  (`Mathlib/Probability/ProductMeasure.lean`); `MeasureTheory.integral_prod_mul` (the integral of
  `f(x) g(y)` against a product measure is the product of the integrals,
  `Mathlib/MeasureTheory/Integral/Prod.lean`).
- `aemeasurable_of_tendsto_metrizable_ae'` (an almost everywhere limit of almost everywhere
  measurable functions is almost everywhere measurable,
  `Mathlib/MeasureTheory/Constructions/BorelSpace/Metrizable.lean`).
- `ProbabilityTheory.cond`, notation `μ[|s]`, the measure `(μ s)⁻¹ • μ.restrict s`
  (`Mathlib/Probability/ConditionalProbability.lean`).
- `ProbabilityTheory.expMeasure r`, the gamma law of shape `1` and rate `r`
  (`Mathlib/Probability/Distributions/Exponential.lean`); `ProbabilityTheory.variance`.
- `ProbabilityMeasure.tendsto_iff_tendsto_charFun` (Lévy's continuity theorem,
  `Mathlib/MeasureTheory/Measure/LevyConvergence.lean`) and
  `ProbabilityMeasure.tendsto_iff_forall_integral_rclike_tendsto` (weak convergence is the
  convergence of integrals of bounded continuous functions,
  `Mathlib/MeasureTheory/Measure/ProbabilityMeasure.lean`); `TendstoInDistribution`
  (`Mathlib/MeasureTheory/Function/ConvergenceInDistribution.lean`).

### From Tau Ceti

- `MeasureTheory.Measure.convolutionPower`, a probability measure when its argument is one
  (`TauCeti/MeasureTheory/Group/Convolution/Power.lean`).
- `MeasureTheory.Measure.weighted μ w`, the measure `μ` reweighted by `w` and divided by the total
  weight, and the zero measure when that weight is `0` or `∞`; `Measure.weighted_apply`,
  `Measure.isProbabilityMeasure_weighted` (a probability measure when the total weight is positive
  and finite) (`TauCeti/MeasureTheory/Measure/Weighted.lean`); `weighted_poissonMeasure` (the
  size-biased Poisson law of positive rate is the image of the Poisson law under `k ↦ k + 1`,
  `TauCeti/Probability/Distributions/Poisson/SizeBias.lean`).
- `TauCeti.Probability.markovChainLaw ν κ`, the path law on `ℕ → α` of the chain with initial law
  `ν` and Markov kernel `κ`, and `markovChainLaw_map_prefix_apply_singleton` (the law of the first
  `n + 1` coordinates gives a path the product of the initial mass and the transition masses)
  and `Measure.markovChainLaw_map_eval` (the law of the `n`-th coordinate is the `n`-th power of
  the kernel applied to the initial law) (`TauCeti/Probability/Process/MarkovChain.lean`);
  `MeasureTheory.Measure.condExp_shift_iterate_markovChainLaw` (the Markov property: the
  conditional expectation of an integrable function of the future path given the first `n + 1`
  coordinates is its integral against the path law started at the `n`-th coordinate)
  (`TauCeti/Probability/MarkovChain/MarkovProperty.lean`).
- `TauCeti.Probability.charFun_expMeasure` (for `r > 0` the characteristic function of
  `expMeasure r` at `t` is `r/(r − i t)`,
  `TauCeti/Probability/Distributions/Exponential/Basic.lean`).

### From TauCetiRoadmap.PopulationDynamics

Items are cited as "layer.item" of PopulationDynamics, Layer 1 (Galton–Watson branching
processes). Its definitions `gwKernel`, `offspringMean`, `IsGaltonWatson` and `extinctionProb`
are copied verbatim into `Suggested.lean`.

- 1.1: the generation kernel `gwKernel ν` and its Markov property; the branching property (the
  path law from `j + k` individuals is that of the sum of two independent processes from `j` and
  from `k`); on `[0, 1]`, `f` is continuous, nondecreasing and convex, with `f(1) = 1`, and
  strictly convex when `p_0 + p_1 < 1`; the derivative of `f` at `s < 1` increases to `m`.
- 1.2: `IsGaltonWatson`; `E[s^(Z_n)] = f^[n](s)` for real `s` with `|s| ≤ 1` (the complex
  form used in 4.2 is proved there).
- 1.3: for `0 < m < ∞` and measurable coordinates, `Z_n / m^n` is a martingale for the natural
  filtration.
- 1.4: `extinctionProb ν` is the least fixed point of `f` in `[0, 1]`, it equals `1` exactly when
  `m ≤ 1` and `ν ≠ δ_1`, and the probability of extinction by generation `n` is `f^[n](0)`.
- 1.6: for the geometric offspring law with `p = ½`, `P(Z_n = 0) = n/(n + 1)`.

## References

- R. Lyons and Y. Peres, *Probability on trees and networks*, Cambridge University Press, 2016;
  read in the authors' corrected version of 19 August 2026 (rdlyons.pages.iu.edu/prbtree/):
  §5.1 (Proposition 5.5, Corollary 5.7 and the Kesten–Stigum theorem, pp. 136–137) and
  Chapter 12 (pp. 413–424).
- R. Lyons, R. Pemantle and Y. Peres, Conceptual proofs of `L log L` criteria for mean behavior
  of branching processes, *Annals of Probability* 23 (1995), 1125–1138; and the authors' erratum
  of 26 October 2003 on Theorem C(ii) for infinite variance (both on the first author's page).
- Attributions made in prose without a locator: H. Kesten and B. P. Stigum (1966);
  E. Seneta (1970); A. N. Kolmogorov (1938); A. M. Yaglom (1947); H. Kesten, P. Ney and
  F. Spitzer (1966); S. Asmussen and H. Hering (1983).

# Roadmap: mathematical population dynamics

**Summary.** This roadmap develops the classical mathematical models of populations: the
Galton–Watson branching process, the differential equations of growth, predation, competition
and epidemics, and the Markov chains and genealogies of population genetics in a population of
fixed finite size. An offspring law is an arbitrary probability measure on the natural numbers,
with generating function `f` and mean `m` in `[0, ∞]`; a deterministic model is an autonomous
differential equation with positive parameters, whose solutions enter the statements as
hypotheses; the genetic models are Markov chains counting the copies of an allele among `N`
genes.

Headline theorems:

- **Extinction.** For every offspring law, the probability that the Galton–Watson process started
  from one individual dies out is the least fixed point of `f` in `[0, 1]`; it equals `1`
  exactly when `m ≤ 1` and the law is not the point mass at `1`.
- **Predator and prey.** For positive parameters, the Lotka–Volterra system
  `x' = x (α − β y)`, `y' = y (δ x − γ)` has exactly one solution defined for all times from
  every point of the open quadrant; it stays on a level set of
  `δ x − γ log x + β y − α log y` and is periodic, and over a period the averages of `x` and
  `y` are `γ/δ` and `α/β`.
- **Final size of an epidemic.** For `β, γ > 0` and a solution of `S' = −β S I`,
  `I' = β S I − γ I` on `[0, ∞)` with `S(0) > 0` and `I(0) > 0`: `I(t)` tends to `0`, and
  `S(t)` tends to the unique `s` in `(0, γ/β)` with
  `s − (γ/β) log s = S(0) + I(0) − (γ/β) log S(0)`.
- **Fixation.** Among `N ≥ 1` genes, an allele present in `i ≤ N` copies is eventually carried by
  all of them with probability `i/N` in the neutral Wright–Fisher model, and with probability
  `(1 − r^(−i))/(1 − r^(−N))` in the Moran model when the allele has relative fitness `r > 0`,
  `r ≠ 1` (and `i/N` when `r = 1`).

The roadmap builds on Mathlib's integral curves, uniqueness theorem for differential equations,
martingales and standard laws, and on Tau Ceti's path laws of Markov chains, generating
functions, convolution powers and maximal integral curves of vector fields.
MarkovChainsAndRenewal supplies the Markov property of a chain on an arbitrary probability
space.

Layer 1 is the Galton–Watson process: generating functions and moments, the martingale
`Z_n / m^n`, extinction, convergence in `L²` in the supercritical case, and the geometric
offspring law in closed form. Layer 2 is the deterministic models: existence on a half-line, logistic
growth, the Lotka–Volterra predator–prey and competition systems, and the Kermack–McKendrick
SIR and SIS epidemic models. Layer 3 is population genetics: the Hardy–Weinberg law, the
Wright–Fisher chain, fixation in birth–death chains and the Moran model, and the coalescence
times of a sample with the number of segregating sites.

## How to read the build

The three layers are independent of one another; inside a layer each section uses the earlier
sections named in its *Needs:* line. Each numbered target ends with a *Needs:* line naming the
targets and suppliers that its statement and its route use; every claim carries a source locator
in parentheses or says that it is proved here. `LP` is the book of Lyons and Peres, `PTE` and
`DNA` are the two books of Durrett, `T` is the book of Teschl and `W` is the article of Weiss,
all listed under References. `Suggested.lean` states the headline theorems of each layer.

## Conventions

- **Offspring laws.** An offspring law is a probability measure `ν` on `ℕ`; `p_k = ν {k}`. Its
  generating function is Tau Ceti's `pgf id ν`, written `f`, with `f s = Σ_k p_k s^k` for
  `|s| ≤ 1` and `0^0 = 1`. Its mean `m = Σ_k k p_k` is taken in `[0, ∞]` as a lower integral
  (`offspringMean`); where a second moment is assumed, `m` is also the real integral and `σ²` is
  the variance of `ν`.
- **Chains.** The state of every chain is a natural number (a number of individuals or of
  copies). A process `X : ℕ → Ω → ℕ` on a measure space `(Ω, μ)` is the chain with kernel `κ`
  started at `i` when its path map has law `markovChainLaw (Measure.dirac i) κ` under `μ`
  (Mathlib's `HasLaw`). This makes `μ` a probability measure and each `X n` almost everywhere
  measurable. Each `X n` is assumed measurable only where the natural filtration of the process
  is formed.
- **Kernels on all of `ℕ`.** The Wright–Fisher and Moran kernels for `N` genes are defined at
  every state of `ℕ`, with probabilities clipped to `[0, 1]` by `Set.projIcc`. States above `N`
  are outside the model: every statement assumes that the initial state is at most `N`, and the
  chain then stays in `{0, …, N}`.
- **Differential equations.** For a vector field `v` on a normed space, a solution on `[0, ∞)`
  is a curve `x` with Mathlib's `IsIntegralCurveOn x (fun _ ↦ v) (Set.Ici 0)`: at every `t ≥ 0`
  the derivative of `x` within `[0, ∞)` is `v (x t)` (one-sided at `0`). A global solution has
  `IsIntegralCurve x (fun _ ↦ v)`. Solutions are hypotheses of the statements; no object is
  defined through a chosen solution. Planar systems live on `ℝ × ℝ`.
- **Parameters.** The rates of the deterministic models are positive real numbers, as each
  statement says. In the epidemic models `S` and `I` are the numbers (or fractions) of
  susceptible and infective individuals, and the number of removed individuals is the constant
  total minus `S + I`.
- **Population size.** `N` is the number of genes: the number of individuals in a haploid
  population, or twice that number in a diploid one. Time in the coalescent is scaled so that
  each pair of lineages merges at rate `1`.
- **Junk values.** Real division by zero is `0`, `Real.log 0 = 0`, and subtraction of natural
  numbers is truncated. Each definition says what this gives in its degenerate cases, and each
  statement either holds there or carries the hypothesis that excludes them.

## Layer 1: Galton–Watson branching processes

### 1.1 Offspring laws and the generation kernel

Define `offspringMean ν` as the lower integral of `k` against `ν`, and the kernel `gwKernel ν`
on `ℕ` that sends `n` to the `n`-fold convolution power of `ν`, Tau Ceti's
`ν.convolutionPower n`. For a probability measure `ν` it is a Markov kernel. Prove:

- `gwKernel ν n` is the law of `ξ_1 + ⋯ + ξ_n` for independent `ξ_i` of law `ν` (this is Tau
  Ceti's `Measure.hasLaw_sum_pi_convolutionPower`); in particular `0` is absorbing and
  `gwKernel ν 1 = ν` (the recursion (5.1) of LP);
- for `|s| ≤ 1` the generating function of `gwKernel ν n` at `s` is `(f s)^n`, by induction from
  `Measure.pgf_conv_of_abs_le_one`;
- the branching property: `gwKernel ν (j + k)` is the convolution of `gwKernel ν j` and
  `gwKernel ν k`, the same holds for every power of the kernel, and the path law of the chain
  started at `j + k` is the law of the sum of two independent chains started at `j` and at `k`;
- on `[0, 1]` the function `f` is continuous, nondecreasing and convex, `f 1 = 1`,
  `f 0 = p_0`, and the derivative of `f` at `s < 1` increases to `m` as `s ↑ 1`, also when
  `m = ∞` (LP, Exercise 5.1); if `p_0 + p_1 < 1`, `f` is strictly convex on `[0, 1]`.

(Proved here except where a locator is given.)

**Checks.**

- `ν = δ_0`: every state is sent to `0`, and `m = 0`. `ν = δ_1`: the identity kernel, `m = 1`.
  `ν = δ_2`: the state `n` is sent to `2n`.
- `ν = ½ δ_0 + ½ δ_2` from the state `2`: the next state is `0, 2, 4` with probabilities
  `1/4, 1/2, 1/4`. The kernel that multiplies one draw by the number of individuals would give
  `0, 4` with probabilities `1/2, 1/2`.
- `ν {2^j} = 2^(−j)` for `j ≥ 1` is a probability measure with `m = ∞`.

*Needs:* Mathlib `Kernel.ofFunOfCountable`; Tau Ceti `Measure.convolutionPower`,
`Measure.hasLaw_sum_pi_convolutionPower`, `pgf`, `hasSum_pgf`, `pgf_zero`,
`Measure.pgf_conv_of_abs_le_one`, `tendsto_iteratedDeriv_pgf_nhdsLT_one`, `markovChainLaw`.

### 1.2 The process, its generating functions and moments

Define `IsGaltonWatson ν Z μ`: the process `Z` on `(Ω, μ)` is the chain with kernel
`gwKernel ν` started at `1`. The coordinate process on path space under
`markovChainLaw (Measure.dirac 1) (gwKernel ν)` is one, and the law of `Z n` is
`(gwKernel ν ^ n) 1` by `Measure.markovChainLaw_map_eval`. For a Galton–Watson process prove:

- `E[s^(Z n)] = f^[n] s` for `|s| ≤ 1`, where `f^[n]` is the `n`-fold iterate
  (`IsGaltonWatson.pgf_eq_iterate`) (LP, Proposition 5.2, for `0 ≤ s ≤ 1`; the proof is the same
  on `[−1, 1]`, where `|f s| ≤ 1`);
- the mean of `Z n`, as a lower integral, is `m^n` in `[0, ∞]`, for every offspring law
  (`IsGaltonWatson.lintegral_eq_pow`) (LP, Proposition 5.5, for `0 < m < ∞`; the cases `m = 0`
  and `m = ∞` are proved here, with `0^0 = 1`);
- if `ν` has a second moment, the variance of `Z n` is `σ² (m^(n−1) + m^n + ⋯ + m^(2n−2))`,
  that is `σ² · Σ_{k < n} m^(n−1+k)` (`IsGaltonWatson.variance_eq`): from
  `Var(Z (n+1)) = σ² E[Z n] + m² Var(Z n)`. For `m ≠ 1` this is `σ² m^(n−1) (m^n − 1)/(m − 1)`
  and for `m = 1` it is `n σ²`. (Proved here; PTE, Example 4.4.9, has the equivalent formula
  `E[(Z n / m^n)²] = 1 + σ² Σ_{k=2}^{n+1} m^(−k)` for `m > 1`.)

**Checks.**

- `n = 0`: the generating function is `s`, the mean `1` and the variance `0` (an empty sum).
- `ν = ¼ δ_0 + ¼ δ_1 + ½ δ_2`: `m = 5/4`, `σ² = 11/16`, `E[Z 2] = 25/16` and
  `Var(Z 2) = (11/16)(5/4 + 25/16) = 495/256`. The formula `σ² m^n` would give `275/256`.
- `ν = δ_2` and `s = −1`: `f s = s²`, `f^[n] (−1) = 1` for `n ≥ 1`, and `Z n = 2^n` is even.
- `ν = δ_0`: `E[Z 0] = 1 = 0^0` and `E[Z n] = 0` for `n ≥ 1`. For an offspring law of infinite
  mean, `E[Z n] = ∞` for every `n ≥ 1`.

*Needs:* 1.1; Mathlib `HasLaw`, `variance`; Tau Ceti `markovChainLaw`,
`Measure.markovChainLaw_map_eval`, `pgf`.

### 1.3 The martingale

For a Galton–Watson process with measurable coordinates and `0 < m < ∞`, prove that
`Z n / m^n` is a martingale for the natural filtration of `Z`
(`IsGaltonWatson.martingale`) (LP, Proposition 5.5; PTE, Lemma 4.3.9, for the filtration
generated by all family sizes; for the natural filtration it follows from the Markov property).
Prove also that for every fixed point `r ∈ [0, 1]` of `f` the process `r^(Z n)`, with
`0^0 = 1`, is a bounded martingale (LP, Exercise 5.28; PTE, Exercise 4.3.12).

**Checks.**

- `ν = δ_2`: `Z n / m^n = 1` for all `n`.
- `ν = δ_0`: `m = 0`, and `Z n / m^n` is `1` at `n = 0` and `0/0 = 0` afterwards, which is not a
  martingale; the hypothesis `m ≠ 0` excludes it. For `m = ∞` the variables are not integrable.

*Needs:* 1.2; Mathlib `Martingale`, `Filtration.natural`; Tau Ceti
`Measure.condExp_shift_iterate_markovChainLaw`; MarkovChainsAndRenewal 0.3 and 1.1.

### 1.4 Extinction

Define `extinctionProb ν` as the probability, under the path law of the chain started at `1`,
that the path reaches `0`. For a Galton–Watson process the event `{∃ n, Z n = 0}` has this
probability, it is the increasing limit of `P(Z n = 0) = f^[n] 0` (LP, Corollary 5.3), and the
process started from `k` individuals dies out with probability `q^k`, where `q` is the
extinction probability (PTE, Exercise 4.3.12). Prove:

- `extinctionProb ν` is the least element of `{s ∈ [0, 1] | f s = s}`
  (`isLeast_extinctionProb`) (LP, Proposition 5.4 (ii), when `p_1 ≠ 1`; PTE, Theorem 4.3.12,
  when `m > 1`; when `p_1 = 1` every point of `[0, 1]` is fixed and the process never dies
  out);
- `extinctionProb ν = 1` if and only if `m ≤ 1` and `p_1 ≠ 1`
  (`extinctionProb_eq_one_iff`) (LP, Proposition 5.4 (i); PTE, Theorems 4.3.10, 4.3.11 and
  4.3.12); an offspring law of infinite mean has `m > 1`;
- if `p_1 ≠ 1`, then almost surely either `Z n = 0` for some `n` or `Z n → ∞`
  (`IsGaltonWatson.ae_extinct_or_tendsto_atTop`), because every state `k ≥ 1` is transient: if
  `p_0 > 0` the chain jumps from `k` to the absorbing state `0` with probability `p_0^k`, and if
  `p_0 = 0` the chain is nondecreasing and stays at `k` with probability `p_1^k < 1` (LP,
  Proposition 5.1).

**Checks.**

- `ν = δ_1`: `m = 1` and `q = 0`; this is the exception in the criterion, and `Z n = 1` neither
  dies out nor tends to infinity.
- `ν = ¼ δ_0 + ¼ δ_1 + ½ δ_2`: `f(½) = ¼ + ⅛ + ⅛ = ½`, and `q = ½`. Since `1` is always a fixed
  point, "a fixed point" does not determine `q`.
- `ν = ⅛ δ_0 + ⅜ δ_1 + ⅜ δ_2 + ⅛ δ_3`: `m = 3/2`, the fixed points solve
  `(s − 1)(s² + 4s − 1) = 0`, and `q = √5 − 2`.
- `ν = ½ δ_0 + ½ δ_2`: `m = 1`, `f s − s = (1 − s)²/2`, and `q = 1`. `ν = δ_0`: `q = 1`.

*Needs:* 1.1, 1.2; Tau Ceti `markovChainLaw`, `Measure.markovChainLaw_map_eval`,
`Measure.markovChainLaw_setOf_infinite_setOf_eq_eq_zero`.

### 1.5 Convergence in `L²` in the supercritical case

Let `ν` have a second moment and `m > 1`. For a Galton–Watson process prove that there is
`W ∈ L²(μ)` with `Z n / m^n → W` almost surely and in `L²`, `E[W] = 1`,
`Var(W) = σ² / (m (m − 1))` and `P(W = 0) = extinctionProb ν`
(`IsGaltonWatson.exists_tendsto_eLpNorm_two`) (LP, Exercise 5.27 and Corollary 5.7; PTE,
Example 4.4.9 and Exercise 4.3.11; the variance of `W` is the limit of 1.2). Route: by 1.2 the
second moments `1 + σ² Σ_{k=2}^{n+1} m^(−k)` are bounded, the increments of the martingale of
1.3 are orthogonal, so the sequence is Cauchy in `L²`; the almost sure limit exists by
martingale convergence. By the Markov property at time `1` and the branching property of 1.1,
`P(W = 0)` is a fixed point of `f`; since `m > 1` makes `f` strictly convex, the fixed points in
`[0, 1]` are `q` and `1`, and `E[W] = 1` excludes `1`. The argument is carried out for the
coordinate process on path space, whose coordinates are measurable, and `W` is the limit found
there composed with the path map of `Z`; the conclusions transfer along the equality of path
laws.

**Checks.**

- `ν = δ_2`: `W = 1`, `Var(W) = 0 = 0/(2 · 1)` and `q = 0`.
- `ν = ¼ δ_0 + ¼ δ_1 + ½ δ_2`: `Var(W) = (11/16)/((5/4)(1/4)) = 11/5` and `P(W = 0) = ½`.

*Needs:* 1.1, 1.2, 1.3, 1.4; Mathlib `MemLp`, `eLpNorm`,
`Submartingale.ae_tendsto_limitProcess`; MarkovChainsAndRenewal 0.3 and 1.1.

### 1.6 The geometric offspring law

Let `ν` be Mathlib's `geometricMeasure p`, with `p_k = (1 − p)^k p` for `p ≠ 0`, mean
`m = (1 − p)/p` and `f s = p / (1 − (1 − p) s)` (Tau Ceti's `pgf_geometricMeasure`). With
`S_n = 1 + m + ⋯ + m^(n−1)`, the identity `f (S_n / S_(n+1)) = S_(n+1) / S_(n+2)` gives
`P(Z n = 0) = S_n / S_(n+1)` for every `n` and every `p` in the unit interval
(`IsGaltonWatson.measureReal_eq_zero_geometric`; the case `p = 0` is the last Check), and for
`p ≠ 0` the extinction probability is `p / max p (1 − p)`: it is `1` for `p ≥ ½` and
`p/(1 − p) = 1/m` for `p < ½` (`extinctionProb_geometric`). (Proved here.)

**Checks.**

- `p = ½`: `m = 1`, `P(Z n = 0) = n/(n + 1)` and `q = 1`.
- `p = ⅓`: `m = 2`, `P(Z 1 = 0) = 1/3`, `P(Z 2 = 0) = 3/7 = f(1/3)` and `q = ½`.
- `p = 1`: `ν = δ_0`, `m = 0`, and the formula gives `0` for `n = 0` and `1` for `n ≥ 1`.
- `p = 0`: Mathlib sets `geometricMeasure 0 = δ_0`; the first formula still holds, with
  `1/0 = 0`, but `p / max p (1 − p) = 0` while `q = 1`, so the second needs `p ≠ 0`.

*Needs:* 1.2, 1.4; Mathlib `geometricMeasure`; Tau Ceti `pgf_geometricMeasure`.

### Examples

- Binary splitting `ν = (1 − a) δ_0 + a δ_2` with `0 < a ≤ 1`: `m = 2a`,
  `f s − s = (1 − s)(1 − a − a s)`, and `q = min 1 ((1 − a)/a)`.
- Poisson offspring of mean `λ > 0` (Mathlib's `poissonMeasure`): `f s = exp(λ (s − 1))`, and
  for `λ > 1` the extinction probability is the root of `q = exp(λ (q − 1))` in `(0, 1)`.

### Dependencies

Layer 1 uses Mathlib (kernels, `HasLaw`, martingales and their convergence, the geometric law),
Tau Ceti (convolution powers, generating functions, path laws of chains, the Markov property
and the finiteness of visits to a transient state) and MarkovChainsAndRenewal 0.3 and 1.1.

## Layer 2: deterministic models

### 2.1 Existence on `[0, ∞)` from an a priori bound

Let `v` be a continuously differentiable vector field on a real Banach space, `K` a compact set
and `x₀` a point such that every solution on a bounded interval `[0, T)` that starts at `x₀`
stays in `K`. Prove that there is a solution on `[0, ∞)` starting at `x₀` (T, Corollary 2.15,
in finite dimension). This is the half-line form, for solutions in the sense of the
Conventions, of the escape lemma for maximal integral curves. Route: regard the space as a
manifold modelled on itself, on which `v` is a `C¹` vector field; Tau Ceti's
`maximalIntegralCurve v x₀` is an integral curve on the open interval
`maximalIntegralCurveInterval v x₀`, which contains `0`, and takes the value `x₀` there; on
every `[0, T)` inside that interval it is a solution starting at `x₀`, hence stays in `K`;
`Ici_subset_maximalIntegralCurveInterval_of_isCompact_of_mapsTo` then puts `[0, ∞)` inside
the interval. Prove also uniqueness: two solutions of a continuously differentiable field on
`[0, T]` with the same initial value agree, by `ODE_solution_unique_of_mem_Icc_right`, the
field being Lipschitz on the compact union of the two curves. The same two statements hold
backwards in time, by applying them to `−v`. (Proved here from the suppliers named.)

**Checks.**

- `v x = x²` on `ℝ` with `x₀ = 1`: the solution `1/(1 − t)` leaves every compact set before
  time `1`, the hypothesis fails for every `K`, and there is no solution on `[0, ∞)`.
- `v x = −x` with `x₀ = 1` and `K = [0, 1]`: the hypothesis holds and the solution is
  `exp(−t)`.

*Needs:* Mathlib `IsIntegralCurveOn`, `IsMIntegralCurveOn`,
`hasMFDerivWithinAt_iff_hasFDerivWithinAt`, `ODE_solution_unique_of_mem_Icc_right`,
`ContDiff.locallyLipschitz`, `LocallyLipschitzOn.exists_lipschitzOnWith_of_compact`; Tau Ceti
`maximalIntegralCurveInterval`, `maximalIntegralCurve`, `zero_mem_maximalIntegralCurveInterval`,
`maximalIntegralCurve_zero`, `isMIntegralCurveOn_maximalIntegralCurve`,
`Ici_subset_maximalIntegralCurveInterval_of_isCompact_of_mapsTo`.

### 2.2 Logistic growth

For `r, K > 0` define `logisticField r K x = r x (1 − x/K)` and
`logisticSolution r K x₀ t = K x₀ / (x₀ + (K − x₀) exp(−r t))`. Prove that for a curve `x`
with `x 0 ≥ 0`, `x` is a solution on `[0, ∞)` if and only if it agrees on `[0, ∞)` with
`logisticSolution r K (x 0)` (`isIntegralCurveOn_logisticField_iff`); consequently every
solution with `x 0 > 0` converges to `K`, monotonically, and the solution with `x 0 = 0` is `0`
(T, Problem 1.15, for `0 < x 0 < K`). Route: for `x₀ ≥ 0` and `t ≥ 0` the denominator is
`x₀ (1 − exp(−r t)) + K exp(−r t) > 0`; differentiate, and use the uniqueness of 2.1.

**Checks.**

- `x 0 = K` gives the constant `K`; `x 0 = 0` gives `0`; `r = K = 1`, `x 0 = ½` gives
  `1/(1 + exp(−t))`.
- `x 0 < 0`: the denominator vanishes at a positive time and the solution tends to `−∞` there,
  so there is no solution on `[0, ∞)`; the statement assumes `x 0 ≥ 0`.

*Needs:* 2.1; Mathlib `IsIntegralCurveOn`.

### 2.3 The Lotka–Volterra predator–prey system

For `α, β, γ, δ > 0` define `lotkaVolterraField α β γ δ (x, y) = (x (α − β y), y (δ x − γ))`
and `lotkaVolterraIntegral α β γ δ (x, y) = δ x − γ log x + β y − α log y`; the equilibrium in
the open quadrant is `(γ/δ, α/β)`. Prove:

- for a solution on `[0, ∞)` with `x(0), y(0) > 0` and every `t ≥ 0`: `x(t), y(t) > 0`, and the
  first integral has the same value at `t` as at `0` (`lotkaVolterraIntegral_eq`); this holds
  for all real parameters, and in the same way for a solution on an interval `[0, T)` or
  `(−T, 0]`. Positivity follows from `x(t) = x(0) exp(∫_0^t (α − β y))`;
- the first integral is strictly convex on the open quadrant, has its minimum at the
  equilibrium, tends to `∞` at the boundary and at infinity, so its sublevel sets are compact
  subsets of the open quadrant and it is strictly increasing along every ray from the
  equilibrium;
- from every point of the open quadrant there is exactly one global solution
  (`existsUnique_isIntegralCurve_lotkaVolterraField`), by 2.1 in both time directions with `K`
  a level set;
- every global solution with `x(0), y(0) > 0` is periodic: there is `T > 0` with
  `z (t + T) = z t` for all `t` (`exists_periodic_lotkaVolterra`) (T, Theorem 7.1). Route: the
  equilibrium is the constant solution. Otherwise put `(u, v) = (x − γ/δ, y − α/β)`; then
  `u v' − v u' = δ y u² + β x v²` is positive and bounded below on the level set, which is
  compact and does not contain the equilibrium. Writing `w = u + i v`, the function
  `w(t) exp(−∫_0^t w'/w)` is constant, and the imaginary part `Θ(t)` of `∫_0^t w'/w` has
  derivative `(u v' − v u')/(u² + v²)`, bounded below by a positive constant. At the time `T`
  with `Θ(T) = 2π` the point `w(T)` is a positive multiple of `w(0)` on the same level set,
  hence equal to it, and uniqueness gives periodicity;
- Volterra's principle: if a global solution with `x(0), y(0) > 0` has `z T = z 0`, then
  `∫_0^T x = T γ/δ` and `∫_0^T y = T α/β` (`integral_lotkaVolterra_of_eq`), by integrating
  `(log x)' = α − β y` and `(log y)' = δ x − γ` (T, Problem 7.2). Of the four parameters only
  `β ≠ 0` and `δ ≠ 0` are used here, and `α`, `γ` may be any real numbers.

**Checks.**

- At the equilibrium the field vanishes, and for `α = β = γ = δ = 1` the first integral there
  is `2`, its minimum.
- With both logarithms taken with the opposite sign, the derivative of the function along the
  field is `2 (α δ x − β γ y)`, not `0`; the signs are fixed by this.
- On the axis `x = 0` the solution is `(0, y(0) exp(−γ t))`: it returns to its starting point
  at a time `T ≠ 0` only if `y(0) = 0`, and then `∫_0^T x = 0 ≠ T γ/δ`; Volterra's principle
  needs the open quadrant.
- `α = β = γ = δ = 1` from `(½, ½)`: the period is `6.6939…` (numerically), and the averages
  over it are `1` and `1`.

*Needs:* 2.1; Mathlib `IsIntegralCurveOn`, `IsIntegralCurve`.

### 2.4 Two competing species

For `r₁, r₂, K₁, K₂, a, b > 0` define `competitionField r₁ r₂ K₁ K₂ a b (x, y)` as
`(r₁ x (1 − (x + a y)/K₁), r₂ y (1 − (y + b x)/K₂))`. Its equilibria in the closed quadrant are
`(0, 0)`, `(K₁, 0)`, `(0, K₂)` and the points of the quadrant on both lines `x + a y = K₁` and
`b x + y = K₂`. For `a b ≠ 1` the lines meet in the single point
`((K₁ − a K₂)/(1 − a b), (K₂ − b K₁)/(1 − a b))`, the interior equilibrium when both numbers are
positive, and one of the three points above when one of them is `0`. For `a b = 1` the lines are
parallel: they are disjoint unless `K₁ = a K₂`, and then they coincide and every point of the
segment `x + a y = K₁`, `x, y ≥ 0`, is an equilibrium. Each of the three convergence statements
below assumes two strict inequalities that exclude this last case. For a solution on `[0, ∞)`
with `x(0), y(0) > 0` prove:

- `x` and `y` stay positive, `x ≤ max (x(0)) K₁` and `y ≤ max (y(0)) K₂`; from every point of
  the closed quadrant there is exactly one solution on `[0, ∞)`, by 2.1;
- the growth rates `P = x'/x` and `Q = y'/y` satisfy `P' = −(r₁/K₁)(x P + a y Q)` and
  `Q' = −(r₂/K₂)(y Q + b x P)`, so each of the sets `{P ≥ 0, Q ≤ 0}` and `{P ≤ 0, Q ≥ 0}` is
  invariant forwards in time; hence `x` and `y` are eventually monotone, the solution converges,
  and its limit is an equilibrium (T, Theorem 7.4);
- the limit is not `(0, 0)`, since `P → r₁ > 0` there; it is not `(0, K₂)` when `a K₂ < K₁`,
  since `P → r₁ (1 − a K₂/K₁) > 0` there, and not `(K₁, 0)` when `b K₁ < K₂`;
- competitive exclusion: if `a K₂ < K₁` and `K₂ < b K₁`, the solution converges to `(K₁, 0)`
  (`tendsto_competition_of_exclusion`); exchanging the two species, if `K₁ < a K₂` and
  `b K₁ < K₂` it converges to `(0, K₂)`;
- coexistence: if `a K₂ < K₁` and `b K₁ < K₂` (so `a b < 1`), it converges to the interior
  equilibrium (`tendsto_competition_of_coexistence`);
- bistability: if `K₁ < a K₂` and `K₂ < b K₁` (so `a b > 1`), it converges to `(K₁, 0)`, to
  `(0, K₂)` or to the interior equilibrium (`tendsto_competition_of_bistable`).

(Proved here, with the eventual monotonicity of T, Theorem 7.4.)

**Checks.**

- `K₁ = 2`, `K₂ = 3/2`, `a = ½`, `b = 2/5`: coexistence at `(25/16, 7/8)`.
- `K₁ = K₂ = 1`, `a = 3/2`, `b = 2`: the interior equilibrium is `(¼, ½)`; numerically the
  solution from `(½, 1/10)` tends to `(1, 0)` and the one from `(1/10, ½)` to `(0, 1)`, so no
  single limit can be asserted in the bistable case.
- `K₁ = 2`, `K₂ = 1`, `a = ½`, `b = 1`: exclusion, and the solution from `(1/100, 3)` tends to
  `(2, 0)`.
- With `y(0) = 0` the first coordinate is logistic and the limit is `(K₁, 0)` in every case, so
  positivity of both initial values is needed for coexistence.

*Needs:* 2.1; Mathlib `IsIntegralCurveOn`.

### 2.5 The Kermack–McKendrick SIR model

For `β, γ > 0` define `sirField β γ (S, I) = (−β S I, β S I − γ I)`, and write `ρ = γ/β`. For a
solution on `[0, ∞)` with `S(0) > 0` and `I(0) > 0` prove:

- for all `t ≥ 0`: `S(t), I(t) > 0` and `I + S − ρ log S` has the same value at `t` as at `0`
  (`sir_conserved`, which holds for `β > 0` and every real `γ`) (W, equation (5)); for
  `γ > 0`, `S + I` is nonincreasing, so the solution stays in the
  triangle `S, I ≥ 0`, `S + I ≤ S(0) + I(0)`, and `S` is strictly decreasing; from every point
  of the closed quadrant there is exactly one solution on `[0, ∞)`, by 2.1;
- the threshold: if `β S(0) ≤ γ` then `I` is strictly decreasing; if `β S(0) > γ` then `I`
  increases up to the time at which `S = ρ` and decreases afterwards (W, Theorem 2.1);
- the peak: the largest value of `I` on `[0, ∞)` is `I(0)` if `β S(0) ≤ γ`, and
  `I(0) + S(0) − ρ − ρ log(S(0)/ρ)` otherwise (`sir_peak`) (W, Section 2.2.7);
- the final size: `I(t) → 0`, and `S(t)` converges to a limit `s ∈ (0, ρ)`, which is the only
  solution in `(0, ρ)` of `s − ρ log s = S(0) + I(0) − ρ log S(0)` (`sir_finalSize`) (W,
  Sections 2.2.1 and 2.2.2, Proposition 2.2 and equation (7)). Route: `S` decreases and
  `S + I` decreases, both bounded below, so both converge; a positive limit of `I` would make
  `S + I` decrease without bound; the conserved quantity bounds `log S` below and passes to the
  limit; the function `s ↦ s − ρ log s` is strictly decreasing on `(0, ρ]` and its value at `ρ`
  is less than the constant, because `I(0) > 0`. For `S(0) + I(0) = 1` the equation reads
  `log(s/S(0)) = (β/γ)(s − 1)`.

**Checks.**

- `β = 2`, `γ = 1`, `S(0) = 0.99`, `I(0) = 0.01`: the peak is
  `1 − ½ − ½ log 1.98 = 0.15845…` and the final size is `s = 0.19979…`, which is less than
  `ρ = ½` (both confirmed by numerical integration).
- `β = 1`, `γ = 2`, `S(0) = 0.9`, `I(0) = 0.1`: `β S(0) ≤ γ`, the peak is `I(0)`, and
  `s = 0.82431…`.
- `I(0) = 0`: the solution is constant and `S` does not tend to a point of `(0, ρ)` when
  `S(0) ≥ ρ`. `S(0) = 0`: `I = I(0) exp(−γ t)`, `S = 0`, and `log S` is a junk value. Both are
  excluded by the hypotheses.
- The equation `s − ρ log s = c` has a second root, greater than `ρ`; the limit is the smaller
  one.

*Needs:* 2.1; Mathlib `IsIntegralCurveOn`.

### 2.6 The SIS model

For `β, γ > 0` define `sisField β γ i = β i (1 − i) − γ i`, the equation for the infective
fraction `i` when recovered individuals are again susceptible (`s = 1 − i`). For `β ≠ γ` it is
the logistic field: `sisField β γ i = logisticField (β − γ) (1 − γ/β) i`. Prove that every
solution on `[0, ∞)` with `i(0) > 0` converges to `max 0 (1 − γ/β)` (`tendsto_sis`): to the
endemic level `1 − γ/β` if `β > γ`, by 2.2, and to `0` if `β ≤ γ`, where for `β = γ` the
solution is `i(0)/(1 + β i(0) t)` and for `β < γ` it is the function `logisticSolution` of 2.2
with the negative parameters `β − γ` and `1 − γ/β`. (Proved here.)

**Checks.**

- `β = 2`, `γ = 1`: the limit is `½` from every `i(0) > 0`; with `i(0) = 0` the solution is `0`,
  so positivity is needed.
- `β = γ = 1`, `i(0) = ½`: `i(t) = 1/(2 + t) → 0`, with no exponential rate.

*Needs:* 2.1, 2.2; Mathlib `IsIntegralCurveOn`.

### Examples

- The data of W, Figure 1 (`β = 0.7/50000`, `γ = 1/5`, `S(0) = 49955`, `I(0) = 5`): the peak of
  2.5 is `17790.5…` infectives and the final number of susceptibles is `1704.4…`.
- The Lotka–Volterra system with `α = 3/2`, `β = 7/10`, `γ = 9/10`, `δ = 2/5` from `(3, 1)`:
  the averages over a period are `9/4` and `15/7`.

### Dependencies

Layer 2 uses Mathlib (integral curves, the uniqueness theorem, local Lipschitz continuity of
continuously differentiable maps) and Tau Ceti (maximal integral curves and the escape lemma).
Sections 2.2 to 2.6 use 2.1, and 2.6 uses 2.2.

## Layer 3: population genetics in finite populations

### 3.1 The Hardy–Weinberg law

A genotype distribution at one locus with two alleles `A`, `a` is a triple `(u, v, w)` of
nonnegative numbers of sum `1`, the frequencies of `AA`, `Aa`, `aa`; the frequency of `A` is
`p = u + v/2`. Under random mating each parent is drawn independently from the distribution and
transmits one of its two alleles with probability `½` each, so a parent of genotype `AA`, `Aa`,
`aa` transmits `A` with probability `1`, `½`, `0`. The random mating map sends `(u, v, w)` to
the genotype distribution of the offspring. Prove that it sends `(u, v, w)` to
`(p², 2 p (1 − p), (1 − p)²)`, that it preserves the frequency of `A`, and that it is
idempotent: the genotype frequencies are in Hardy–Weinberg proportions after one generation and
do not change afterwards. (Proved here; the law is named after Hardy and Weinberg.)

**Checks.**

- `(½, 0, ½)` is sent to `(¼, ½, ¼)`, which is fixed.
- `(1/5, 3/10, 1/2)`: `p = 7/20`, and the image is `(49/400, 182/400, 169/400)`.
- The proportion of heterozygotes `2 p (1 − p)` is at most `½`, so `(0, 1, 0)` is not fixed: it
  is sent to `(¼, ½, ¼)`.

*Needs:* nothing beyond real arithmetic.

### 3.2 The neutral Wright–Fisher chain

Define `wrightFisherKernel N`, the kernel on `ℕ` that sends `i` to Mathlib's
`ProbabilityTheory.binomial N` with success probability `i/N`: the `N` genes of the next
generation choose their parents independently and uniformly (PTE, Example 5.1.4). For the chain
`X` started at `i ≤ N` prove:

- the chain stays in `{0, …, N}`, and `0` and `N` are absorbing;
- `X n` is a martingale for the natural filtration, for a process with measurable coordinates
  (`wrightFisher_martingale`), since the binomial law has mean `N · (i/N)` (DNA, equation
  (1.3));
- almost surely the chain reaches `0` or `N`: for `N ≥ 1`, from every state `j ≤ N` the next
  state lies in `{0, N}` with probability `(j/N)^N + (1 − j/N)^N ≥ 2^(1−N)`;
- fixation: for `N ≥ 1` the chain reaches `N` with probability `i/N`
  (`wrightFisher_fixation`) (DNA, Theorem 1.1), by bounded convergence in `E[X n] = i`;
- heterozygosity: `E[X n (N − X n)] = (1 − 1/N)^n · i (N − i)`
  (`wrightFisher_heterozygosity`) (DNA, Theorem 1.3), since a binomial variable `B` with
  parameters `N` and `x` has `E[B (N − B)] = N (N − 1) x (1 − x)`. The probability that two
  genes drawn with replacement at time `n` differ is `2 X n (N − X n)/N²`, so its expectation
  decays by the factor `1 − 1/N` per generation; with `N` diploid individuals the factor is
  `1 − 1/(2N)`.

**Checks.**

- `N = 2`, `i = 1`: the next state is `0, 1, 2` with probabilities `¼, ½, ¼`; the mean is `1`,
  `E[X 1 (2 − X 1)] = ½ = (1 − ½) · 1`, and the fixation probability is `½`.
- `N = 0`: the only state is `0`, which equals `N`, so the chain is fixed from the start while
  `i/N = 0/0 = 0`; fixation assumes `N ≥ 1`. The heterozygosity identity reads `0 = 0`.
- `i > N`: the clipped success probability is `1`, the chain jumps to `N`, and it is not a
  martingale; the statements assume `i ≤ N`.
- `N = 1`: `(1 − 1/N)^n = 0^n`, which is `1` at `n = 0`, and `i (N − i) = 0` for `i ≤ 1`.

*Needs:* Mathlib `ProbabilityTheory.binomial`, `binomial_real_singleton`, `integral_binomial`,
`Kernel.ofFunOfCountable`, `HasLaw`, `Martingale`, `Filtration.natural`; Tau Ceti
`markovChainLaw`, `Measure.markovChainLaw_map_eval`,
`Measure.condExp_shift_iterate_markovChainLaw`; MarkovChainsAndRenewal 0.3 and 1.1.

### 3.3 Birth–death chains and the Moran model

**Birth–death chains.** Let `κ` be a Markov kernel on `ℕ` and `N ≥ 1` such that `0` and `N` are
absorbing and, for `0 < j < N`, the kernel at `j` is carried by `{j − 1, j, j + 1}` with
`κ j {j + 1} = b j > 0` and `κ j {j − 1} = d j`. Put
`φ k = Σ_{m < k} ∏_{j=1}^{m} d j / b j`. Prove that the chain started at `i ≤ N` reaches `N`
with probability `φ i / φ N` (`birthDeath_fixation`), and that almost surely it reaches `0` or
`N` (PTE, Example 5.3.9 and Theorem 5.3.10, where `d j > 0` is also assumed; the proof does not
use it). The source treats the exit from an interval `(a, c)` of a chain that need not stop at
its ends; stopping the chain at `a` and `c` and shifting the states by `a` gives the statement
here, which is the form that fixation uses. Route: `φ (X n)` is a bounded martingale, because
`b j (φ (j + 1) − φ j) = d j (φ j − φ (j − 1))`; from an interior state the chain reaches `N`
within `N` steps with probability at least `∏_j b j > 0`.

**The Moran model.** Define `moranKernel N r`: from `i` individuals of type `A` among `N`, where
type `A` has relative fitness `r`, one individual is chosen to reproduce, of type `A` with
probability `r i/(r i + N − i)`, and independently one individual chosen uniformly dies, of type
`A` with probability `i/N`; the new state is `i` plus one if the parent has type `A`, minus one
if the dead individual has type `A`. For `r > 0` and `0 < i < N` the chain moves up with
probability `r i (N − i)/(N (r i + N − i))` and down with probability
`i (N − i)/(N (r i + N − i))`, so `d i / b i = 1/r`. For the chain started at `i ≤ N` prove:

- fixation: for `N ≥ 1` and `r > 0` the chain reaches `N` with probability
  `(1 + r⁻¹ + ⋯ + r^(−(i−1)))/(1 + r⁻¹ + ⋯ + r^(−(N−1)))` (`moran_fixation`), which is
  `(1 − r^(−i))/(1 − r^(−N))` for `r ≠ 1` and `i/N` for `r = 1` (DNA, Theorems 1.31 and 6.1,
  for the continuous-time model, whose jump chain has the same ratio `d i / b i`);
- absorption time in the neutral case `r = 1`: the expected number of steps at which the chain
  is in `{1, …, N − 1}` is `N (Σ_{j=1}^{i} (N − i)/(N − j) + Σ_{j=i+1}^{N−1} i/j)`
  (`moran_neutral_lintegral_absorptionTime`). Route: the expected number `g i` of such steps is
  the bounded solution of `g i = 1 + Σ_j κ i {j} · g j` at interior states with
  `g 0 = g N = 0`, which for the neutral model reads
  `(i (N − i)/N²)(2 g i − g (i + 1) − g (i − 1)) = 1`. (DNA, equations (1.34) and (1.39),
  give the expected time `i/j` or `(N − i)/(N − j)` spent at each state `j` in continuous time;
  a step of the chain here leaves `j` with probability `2 j (N − j)/N²`, which multiplies these
  times by `N`.)

**Checks.**

- `N = 2`, `i = 1`, `r = 1`: the chain moves up or down with probability `¼` each, the fixation
  probability is `½`, and the expected absorption time is `2 · (1/1) = 2`.
- `N = 3`, `i = 1`, `r = 2`: `(1 − ½)/(1 − ⅛) = 4/7 = 1/(1 + ½ + ¼)`. The formula with `r` in
  place of `r⁻¹` gives `1/7`, the fixation probability of a deleterious type.
- `r = 1` in `(1 − r^(−i))/(1 − r^(−N))` is `0/0 = 0`, while the sum form gives `i/N`.
- A birth–death chain with `d 1 = 0` and `N = 2`: `φ 1 = φ 2 = 1` and the chain started at `1`
  reaches `2` with probability `1`.
- `N = 4`, `i = 2`, `r = 1`: the expected absorption time is `4 (2/3 + 1 + 2/3) = 28/3`.

*Needs:* Mathlib `bernoulliMeasure`, `Kernel.ofFunOfCountable`, `HasLaw`; Tau Ceti
`markovChainLaw`, `Measure.markovChainLaw_map_eval`,
`Measure.condExp_shift_iterate_markovChainLaw`, `lintegral_encard_setOf_eq_tsum`;
MarkovChainsAndRenewal 0.3 and 1.1.

### 3.4 Coalescence times and segregating sites

In Kingman's coalescent for a sample of `n` genes, the number of ancestral lineages decreases
from `n` to `1` one at a time, and the time `T_k` during which there are `k` lineages is
exponential of rate `k (k − 1)/2`, independently for `k = 2, …, n` (DNA, Theorem 1.4, where it
is the limit of the Wright–Fisher genealogy). Define `coalescentRate k = k (k − 1)/2`,
`coalescentTimes n` (the product over `j < n − 1` of the exponential laws of rate
`coalescentRate (j + 2)`, coordinate `j` being `T_(j+2)`), `treeHeight = Σ_k T_k` (the time to
the most recent common ancestor) and `treeLength = Σ_k k T_k` (the total branch length). Under
the infinite sites model with scaled mutation rate `θ ≥ 0`, mutations fall on the tree as a
Poisson process of rate `θ/2` per unit length, and the number of segregating sites is their
number: define `segregatingSitesLaw n θ` as Tau Ceti's `mixedPoissonMeasure` of the law of
`(θ/2) · treeLength`. Prove:

- the law of `treeHeight` is Tau Ceti's `hypoexponentialMeasure` of the rates
  `coalescentRate (j + 2)`; for `n ≥ 1` its mean is `2 (1 − 1/n)` (`integral_treeHeight`), by
  `Σ_{k=2}^{n} 2/(k (k − 1)) = 2 (1 − 1/n)`, and its variance is
  `Σ_{k=2}^{n} 4/(k² (k − 1)²)`;
- `k T_k` is exponential of rate `(k − 1)/2`, so `treeLength` has mean `2 H_(n−1)`, where
  `H_(n−1) = Σ_{j=1}^{n−1} 1/j` (DNA, equation (1.21)), and variance `4 Σ_{j=1}^{n−1} 1/j²`
  (the sum of the variances `4/j²` of its independent terms), and for
  `t ≥ 0` it is at most `t` with probability `(1 − exp(−t/2))^(n−1)`
  (`measureReal_treeLength_le`): it has the law of the maximum of `n − 1` independent
  exponential variables of rate `½` (proved here, by induction on `n`);
- `segregatingSitesLaw n θ` is the law of a sum of independent geometric variables, the `j`th
  with success probability `j/(j + θ)`, for `j = 1, …, n − 1`
  (`segregatingSitesLaw_eq_map_pi`) (DNA, proof of Theorem 1.21): both sides have the generating
  function `∏_{j=1}^{n−1} j/(j + θ (1 − s))` on `[0, 1)`, generating functions are analytic on
  `(−1, 1)`, and a finite measure on `ℕ` is determined by its generating function there;
- Watterson's formulas: the number of segregating sites has mean `θ H_(n−1)` and variance
  `θ H_(n−1) + θ² Σ_{j=1}^{n−1} 1/j²` (`integral_variance_segregatingSitesLaw`) (DNA, equation
  (1.20) and Theorem 1.21).

**Checks.**

- `n = 1`: there are no coalescence times, the height and the length are `0`, and
  `2 (1 − 1/1) = 0`. For `n = 0` the same holds, while `2 (1 − 1/0) = 2`; the mean of the
  height is stated for `n ≥ 1`.
- `n = 2`: the height is exponential of rate `1`, with mean `1 = 2 (1 − ½)`; the length is twice
  the height, exponential of rate `½`, and `P(length ≤ t) = 1 − exp(−t/2)`.
- `n = 2`, `θ = 1`: the number of segregating sites is geometric with success probability `½`,
  with mean `1` and variance `2 = 1 + 1`; it vanishes with probability `½`.
- With the rate `k (k − 1)` in place of `k (k − 1)/2` the mean height for `n = 2` would be `½`.
- `θ = 0`: every geometric law is the point mass at `0`, and so is the law of the number of
  segregating sites.

*Needs:* Mathlib `expMeasure`, `geometricMeasure`, `poissonMeasure`, `cdf_expMeasure_eq`; Tau
Ceti `integral_id_expMeasure`, `expMeasure_map_const_mul`, `hypoexponentialMeasure`,
`hypoexponentialMeasure_eq_map`, `integral_id_hypoexponentialMeasure`,
`variance_id_hypoexponentialMeasure`,
`mgf_id_hypoexponentialMeasure`, `mixedPoissonMeasure`, `pgf_mixedPoissonMeasure`,
`integral_natCast_mixedPoissonMeasure`, `variance_mixedPoissonMeasure`, `pgf_geometricMeasure`,
`analyticOnNhd_pgf`, `measure_eq_of_pgf_eqOn`.

### Examples

- A new mutant (`i = 1`) of fitness `r = 11/10` among `N = 100` in the Moran model is fixed with
  probability `(1 − 10/11)/(1 − (10/11)^100) = 0.0909…`, against `1/100` for a neutral one.
- For a sample of `n = 10` genes the expected height of the tree is `9/5` and the expected
  number of segregating sites is `θ H_9 = 2.8289… · θ`.

### Dependencies

Layer 3 uses Mathlib (the binomial, Bernoulli, exponential, geometric and Poisson laws, `HasLaw`
and martingales), Tau Ceti (path laws of chains, the Markov property, hypoexponential and mixed
Poisson laws, generating functions) and MarkovChainsAndRenewal 0.3 and 1.1. Section 3.1 uses
nothing; 3.2, 3.3 and 3.4 are independent of one another.

## Downstream consumers

Roadmaps on stochastic epidemic models, on multi-type and continuous-time branching processes,
on the diffusion limits of the Wright–Fisher and Moran chains and on coalescents with selection
or recombination would build on Layers 1 and 3; a roadmap on the qualitative theory of planar
differential equations would build on Layer 2.

## Scope and ownership

This roadmap owns: the Galton–Watson process with one type in discrete time (its kernel,
generating functions, moments, martingale, extinction probability and `L²` limit); the logistic,
Lotka–Volterra predator–prey, Lotka–Volterra competition, SIR and SIS differential equations
with the statements above; the half-line form 2.1 of the escape lemma; the Hardy–Weinberg law;
the neutral
Wright–Fisher chain; fixation in birth–death chains with absorbing ends and the Moran model;
and the laws of the height, the length and the number of segregating sites of the coalescent
tree of a sample.

Left to other roadmaps and to the libraries:

- kernels, path laws, the Markov and strong Markov properties, recurrence and transience,
  stationary laws and renewal theory belong to MarkovChainsAndRenewal and to Tau Ceti; the
  chains above are examples of its theory, and it states neither branching processes nor
  birth–death chains;
- the exit probabilities of a random walk with independent identically distributed steps `±1`
  (gambler's ruin) are StochasticCalculus 2.3; `birthDeath_fixation` above differs in allowing
  state-dependent probabilities and holding steps, and is stated for a Markov chain;
- matrix games, Nash and correlated equilibria belong to RegretMinimizationAndEquilibria; the
  replicator equation and evolutionary stability are not treated here;
- maximal integral curves of a `C¹` vector field on a manifold, the escape lemma and the
  completeness of compactly supported fields are already in Tau Ceti
  (`TauCeti/Geometry/Manifold/IntegralCurve/`); 2.1 above restates the escape lemma for a field
  on a Banach space and for solutions on a half-line with a one-sided derivative at `0`, the
  form in which Layer 2 states its hypotheses;
- the Poisson point process, Galton–Watson trees with Poisson offspring as point processes,
  mixing times of finite chains and hidden Markov models are separate subjects and are not
  treated here;
- sums of independent exponential variables and mixed Poisson laws are already in Tau Ceti
  (`hypoexponentialMeasure`, `mixedPoissonMeasure`); 3.4 above specializes them.

Out of scope: the Kesten–Stigum theorem under the `L log L` condition and the Seneta–Heyde
norming; multi-type, continuous-time and age-dependent branching processes; Galton–Watson trees
as random trees; models structured by age or space (the McKendrick–von Foerster equation,
reaction–diffusion equations, the Fisher–KPP equation); the Poincaré–Bendixson theorem and
general Lyapunov and LaSalle theory; models with more than two species; stochastic epidemic
models; the Wright–Fisher chain with selection or mutation and its diffusion approximation;
Kingman's coalescent as a partition-valued process and its derivation as a limit of finite
genealogies; the coalescent with recombination or selection; Ewens' sampling formula; chemostat
models and chemical reaction networks; phylogenetics; and all statistical questions.

## Exact supplier contracts

### From Mathlib

- `IsIntegralCurveOn γ v s` (`γ` has derivative `v t (γ t)` within `s` at every `t ∈ s`) and
  `IsIntegralCurve γ v` (the same with the derivative at every real `t`)
  (`Mathlib/Analysis/ODE/Basic.lean`).
- `ODE_solution_unique_of_mem_Icc_right` (`Mathlib/Analysis/ODE/ExistUnique.lean`): if `v t` is
  `K`-Lipschitz on `s t` for `t ∈ [a, b)`, and `f`, `g` are continuous on `[a, b]`, have
  right derivatives `v t (f t)` and `v t (g t)` on `[a, b)`, stay in `s t` there and agree at
  `a`, then they agree on `[a, b]`.
- `ContDiff.locallyLipschitz`: a `C¹` map between real normed spaces is locally Lipschitz
  (`Mathlib/Analysis/Calculus/ContDiff/RCLike.lean`);
  `LocallyLipschitzOn.exists_lipschitzOnWith_of_compact`: a map that is locally Lipschitz on a
  compact set is Lipschitz on it (`Mathlib/Topology/Algebra/MetricSpace/Lipschitz.lean`).
- `IsMIntegralCurveOn γ v s`, the manifold form of an integral curve on a set of times
  (`Mathlib/Geometry/Manifold/IntegralCurve/Basic.lean`), and
  `hasMFDerivWithinAt_iff_hasFDerivWithinAt`, which identifies the manifold derivative of a map
  between normed spaces with its Fréchet derivative
  (`Mathlib/Geometry/Manifold/MFDeriv/FDeriv.lean`).
- `Kernel.ofFunOfCountable` (`Mathlib/Probability/Kernel/Basic.lean`): a function from a
  countable type with measurable singletons to measures is a kernel.
- `ProbabilityTheory.HasLaw` (`Mathlib/Probability/HasLaw.lean`): the map is almost everywhere
  measurable and pushes the measure forward to the given law.
- `MeasureTheory.Martingale` (`Mathlib/Probability/Martingale/Basic.lean`);
  `MeasureTheory.Filtration.natural`, for a sequence of strongly measurable maps
  (`Mathlib/Probability/Process/Filtration.lean`);
  `MeasureTheory.Submartingale.ae_tendsto_limitProcess`: a submartingale bounded in `L¹` for a
  finite measure converges almost everywhere (`Mathlib/Probability/Martingale/Convergence.lean`).
- `ProbabilityTheory.variance` (`Mathlib/Probability/Moments/Variance.lean`);
  `MeasureTheory.MemLp` and `MeasureTheory.eLpNorm`.
- `ProbabilityTheory.binomial n p`, a measure on `ℕ` for `p` in the unit interval, with
  `binomial_real_singleton` (the mass of `k` is `C(n, k) p^k (1 − p)^(n−k)`) and
  `integral_binomial` (`Mathlib/Probability/Distributions/Binomial.lean`);
  `ProbabilityTheory.bernoulliMeasure x y p`, with mass `p` at `x` and `1 − p` at `y`
  (`Mathlib/Probability/Distributions/Bernoulli.lean`);
  `ProbabilityTheory.geometricMeasure p`, with mass `(1 − p)^k p` at `k` for `p ≠ 0` and equal
  to the point mass at `0` for `p = 0` (`Mathlib/Probability/Distributions/Geometric.lean`);
  `ProbabilityTheory.expMeasure r` and `cdf_expMeasure_eq` (for `r > 0` the distribution
  function is `1 − exp(−r x)` for `x ≥ 0` and `0` otherwise)
  (`Mathlib/Probability/Distributions/Exponential.lean`);
  `ProbabilityTheory.poissonMeasure` (`Mathlib/Probability/Distributions/Poisson/Basic.lean`).

### From Tau Ceti

- `MeasureTheory.Measure.convolutionPower`, a probability measure when `μ` is one
  (`TauCeti/MeasureTheory/Group/Convolution/Power.lean`), and
  `MeasureTheory.Measure.hasLaw_sum_pi_convolutionPower`: under the `n`-fold product of a
  probability measure `μ`, the sum of the coordinates has law `μ.convolutionPower n`
  (`TauCeti/Probability/Independence/ConvolutionPower.lean`).
- `TauCeti.Probability.pgf X μ t = ∫ t^(X ω) ∂μ`; `hasSum_pgf` (for a finite measure on `ℕ`
  and `|t| ≤ 1` the generating function is the sum of the series); `pgf_zero`;
  `MeasureTheory.Measure.pgf_conv_of_abs_le_one` (for finite measures and `|t| ≤ 1` the
  generating function of a convolution is the product); `tendsto_iteratedDeriv_pgf_nhdsLT_one`
  (if the `n`th factorial moment is finite, the `n`th derivative tends to it as `t ↑ 1`);
  `analyticOnNhd_pgf` (the generating function of a finite measure on `ℕ` is analytic on
  `(−1, 1)`); `measure_eq_of_pgf_eqOn` (two finite measures on `ℕ` with the same generating
  function on `(−1, 1)` are equal) (`TauCeti/Probability/GeneratingFunction.lean`);
  `pgf_geometricMeasure` (for `p ≠ 0` and `|(1 − p) t| < 1` the generating function of the
  geometric law is `p/(1 − (1 − p) t)`)
  (`TauCeti/Probability/Distributions/Geometric/Basic.lean`).
- `TauCeti.Probability.markovChainLaw ν κ`, the path law on `ℕ → α` of the chain with initial
  law `ν` and Markov kernel `κ`, and `MeasureTheory.Measure.markovChainLaw_map_eval` (the state
  at time `n` has law `(κ ^ n) ∘ₘ ν`) (`TauCeti/Probability/Process/MarkovChain.lean`);
  `MeasureTheory.Measure.condExp_shift_iterate_markovChainLaw` (for a finite initial measure and
  an integrable function of the future path, its conditional expectation given the first
  `n + 1` coordinates is its integral against the path law started at the `n`th coordinate)
  (`TauCeti/Probability/MarkovChain/MarkovProperty.lean`);
  `MeasureTheory.Measure.markovChainLaw_setOf_infinite_setOf_eq_eq_zero` (on a space with
  measurable singletons, a state whose return probability is less than `1` is visited
  infinitely often with probability `0`, for every finite initial measure)
  (`TauCeti/Probability/MarkovChain/Visits.lean`).
- `MeasureTheory.lintegral_encard_setOf_eq_tsum`: the mean number of indices `k` of a countable
  family at which a measurable property holds is the sum of the probabilities
  (`TauCeti/MeasureTheory/Integral/Lebesgue/Encard.lean`).
- `maximalIntegralCurveInterval v x` (the union of the open intervals around `0` that carry an
  integral curve of `v` with value `x` at `0`) and `maximalIntegralCurve v x`;
  `zero_mem_maximalIntegralCurveInterval` (for a field that is `C¹` at `x`, on a boundaryless
  `C¹` manifold with complete model space); `maximalIntegralCurve_zero`; for a `C¹`
  field on a Hausdorff boundaryless `C¹` manifold,
  `isMIntegralCurveOn_maximalIntegralCurve` (the maximal curve is an integral curve on
  the maximal interval) and, with complete model space,
  `Ici_subset_maximalIntegralCurveInterval_of_isCompact_of_mapsTo` (if `0` is in the
  maximal interval and the maximal curve maps its nonnegative times into a compact set, the
  maximal interval contains `[0, ∞)`)
  (`TauCeti/Geometry/Manifold/IntegralCurve/Maximal.lean`).
- `integral_id_expMeasure` (the exponential law of rate `r > 0` has mean `r⁻¹`) and
  `expMeasure_map_const_mul` (for `r, c > 0`, multiplying an exponential variable of rate `r`
  by `c` gives one of rate `r/c`)
  (`TauCeti/Probability/Distributions/Exponential/Basic.lean`);
  `TauCeti.Probability.hypoexponentialMeasure r` (for positive rates, the law of the sum under
  the product of the exponential laws, `hypoexponentialMeasure_eq_map`)
  (`TauCeti/Probability/Distributions/Hypoexponential/Basic.lean`), with
  `integral_id_hypoexponentialMeasure` (mean `Σ_i (r i)⁻¹`),
  `variance_id_hypoexponentialMeasure` (variance `Σ_i ((r i)²)⁻¹`) and
  `mgf_id_hypoexponentialMeasure` (for `t` below every rate the moment generating function is
  `∏_i r i/(r i − t)`), all for positive rates
  (`TauCeti/Probability/Distributions/Hypoexponential/Transforms.lean`).
- `TauCeti.Probability.mixedPoissonMeasure ρ`, the Poisson law with rate drawn from a measure
  `ρ` on `ℝ≥0`, with `pgf_mixedPoissonMeasure` (at `z ≥ 0` its generating function is the moment
  generating function of `ρ` at `z − 1`), `integral_natCast_mixedPoissonMeasure` (its mean is
  the mean of `ρ`) and `variance_mixedPoissonMeasure` (for a probability measure `ρ` with a
  second moment, its variance is the mean plus the variance of `ρ`)
  (`TauCeti/Probability/Distributions/Poisson/Mixed/Basic.lean`).

### From TauCetiRoadmap.MarkovChainsAndRenewal

Items are cited as "layer.item" of [MarkovChainsAndRenewal](../MarkovChainsAndRenewal/README.md).

- 0.3: a measurable process on any probability space has path law `markovChainLaw ν κ` exactly
  when its finite paths have the product-formula probabilities, and statements transfer along
  this equality of laws.
- 1.1: the one-step Markov property by conditional expectations relative to a filtration, and
  its equivalence with the prefix-law recursion for the natural filtration. It is used for the
  martingales of 1.3, 3.2 and 3.3 above and for the conditioning at time `1` in 1.5 above.

## Provenance and prior work

The Isabelle Archive of Formal Proofs contains the entry `Markov_Models`, which treats
discrete-time Markov chains and the classification of their states; it is reference material,
not the specification. No entry on the probability theory page of the Archive concerns
branching processes or population genetics, and neither Mathlib nor Tau Ceti at the pins states
the Galton–Watson process, the Lotka–Volterra or SIR equations, the Wright–Fisher or Moran
chains or the coalescence times.

## References

- R. Lyons and Y. Peres, *Probability on trees and networks*, Cambridge University Press, 2016;
  Chapter 5, Section 1, read in the authors' version of 8 November 2016.
- R. Durrett, *Probability: theory and examples*, fifth edition, Cambridge University Press,
  2019; read in the author's version of 11 January 2019.
- R. Durrett, *Probability models for DNA sequence evolution*, second edition, Springer, 2008;
  read in the copy made available by the author.
- G. Teschl, *Ordinary differential equations and dynamical systems*, Graduate Studies in
  Mathematics 140, American Mathematical Society, 2012; read in the author's preliminary
  version.
- H. Weiss, The SIR model and the foundations of public health, *Materials Matemàtics* 2013,
  no. 3, 17 pp.

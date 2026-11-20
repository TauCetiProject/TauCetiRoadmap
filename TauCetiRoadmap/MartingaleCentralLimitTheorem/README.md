# Roadmap: martingale central limit theorems

**Summary.** This roadmap proves central limit theorems for sums of dependent random variables
whose dependence is that of a martingale. The basic object is a martingale difference array: for
each `n`, finitely many real random variables `X(n, 0), …, X(n, kₙ − 1)` on one probability space,
each measurable for the next σ-algebra of a filtration attached to row `n` and with conditional
mean `0` given the previous one. The filtrations of different rows need not be related, and every
limit law is a centred Gaussian law `N(0, σ²)` with a constant variance `σ² ≥ 0`; for `σ² = 0` it is
the point mass at `0`, and the theorems hold in that case as stated.

The headline theorems are these.

- *McLeish's theorem.* If the row maxima `maxⱼ |X(n, j)|` are bounded in `L²` and tend to `0` in
  probability, and the sums of squares `∑ⱼ X(n, j)²` tend to `σ²` in probability, then the row
  sums `∑ⱼ X(n, j)` converge in law to `N(0, σ²)`.
- *The martingale central limit theorem with conditional variances* (the Lindeberg–Feller theorem
  for martingales). If the entries are square integrable, the conditional variances
  `∑ⱼ E[X(n, j)² | previous σ-algebra]` tend to `σ²` in probability, and for every `ε > 0` the
  conditional Lindeberg sums `∑ⱼ E[X(n, j)² 1{|X(n, j)| > ε} | previous σ-algebra]` tend to `0` in
  probability, then the row sums converge in law to `N(0, σ²)`.
- *The Billingsley–Ibragimov theorem.* If `X₀, X₁, …` is a stationary ergodic sequence of square
  integrable martingale differences, then `n^(−1/2) (X₀ + ⋯ + Xₙ₋₁)` converges in law to
  `N(0, E X₀²)`.
- *Gordin's central limit theorem for finite chains.* Let a Markov chain on a finite state space
  be irreducible with stationary law `π`, let `f` be a real function on the states and let `g`
  solve the Poisson equation `g − P g = f − E_π f`. From every initial law,
  `n^(−1/2) ∑_{j<n} (f(Xⱼ) − E_π f)` converges in law to `N(0, σ²)` with
  `σ² = E_π[g² − (P g)²]`. The chain may be periodic.

The roadmap builds on Mathlib's conditional expectations, filtrations, convergence in measure,
convergence in distribution with Lévy's continuity theorem, and Gaussian laws, the setting of
Mathlib's central limit theorem for independent identically distributed variables.
MathematicalStatisticsAsymptotic proves the Lindeberg–Feller theorem for independent rows, of which
the second theorem above is the martingale form. MarkovChainsAndRenewal supplies the ergodic
theorem for occupation frequencies and the stationary law of a finite irreducible chain, used for
Gordin's theorem; Tau Ceti supplies the path law of a chain, its Markov property and the mean
ergodic theorem used for the Billingsley–Ibragimov theorem.

Layer 1 below defines martingale difference arrays and proves McLeish's theorem by his product
method. Layer 2 compares sums of squares with conditional variances and derives the theorem with
conditional variances from McLeish's. Layer 3 treats a single martingale: the form with a
normalization by `√n`, and the stationary ergodic case. Layer 4 proves Gordin's theorem through
the martingale decomposition given by the Poisson equation.

## Conventions

- **Arrays.** All random variables of an array live on one measurable space `Ω` with a probability
  measure `μ`. Row `n` has length `k n` (possibly `0`) and a filtration `ℱ n : Filtration ℕ m`
  indexed by `ℕ`, where `m` is the σ-algebra of `Ω`. Entry `j` of row `n` is `X n j`, used for
  `j < k n` only; it is measurable for `ℱ n (j + 1)` and is conditionally centred given `ℱ n j`.
  Durrett's arrays start at index `1` with `F(n, 0)` trivial; here `ℱ n 0` is arbitrary. Row sums
  are `∑ j ∈ range (k n), X n j`, and the sum over an empty row is `0`.
- **No nesting.** Nothing relates `ℱ n` to `ℱ (n + 1)`. A nesting condition
  `F(n, j) ⊆ F(n + 1, j)` is assumed in the literature when the limit of the conditional variances
  is a random variable and the limit law a mixture of Gaussians; every limit here is a constant, and
  the routes below use no relation between the filtrations of different rows. Mixed Gaussian limits
  are outside this roadmap.
- **Convergence.** Convergence in probability is Mathlib's `TendstoInMeasure μ f atTop g` (for
  every `ε > 0` in `ℝ≥0∞`, `μ{ε ≤ edist (f n) g} → 0`). Convergence in law is Mathlib's
  `TendstoInDistribution Y atTop Z (fun _ ↦ μ) μ'`: the laws of `Y n` converge weakly to the law of
  `Z`, a random variable on another probability space `(Ω', μ')` with `HasLaw Z L μ'`.
- **Gaussian laws.** `N(0, σ²)` is Mathlib's `gaussianReal 0 σ²` with `σ² : ℝ≥0`. By
  `gaussianReal_zero_var`, `gaussianReal 0 0` is the Dirac mass at `0`, so every theorem includes
  the degenerate limit. A real variance `v ≥ 0` computed from the data enters as `v.toNNReal`.
- **Conditional expectations and integrability.** `μ[f | ℱ n j]` is Mathlib's conditional
  expectation, which is `0` for a function that is not integrable. Every statement with a
  conditional variance assumes the entries square integrable, so that `μ[(X n j)² | ℱ n j]` is the
  conditional variance and not this junk value.
- **Maxima.** The row maximum `maxⱼ |X n j|` is the supremum in `ℝ≥0` of the norms `‖X n j‖₊`
  over `j < k n`, which is `0` on an empty row; its square is integrated as an extended
  nonnegative integral.
- **Single sequences.** A martingale difference sequence is `X : ℕ → Ω → ℝ` with a filtration
  `ℱ`, `X j` measurable for `ℱ (j + 1)` and `μ[X j | ℱ j] = 0` almost everywhere; its normalized
  sums are `(√n)⁻¹ ∑_{j<n} X j`, with the junk value `0` at `n = 0`.
- **Markov chains.** The state space `S` is a finite type with a σ-algebra in which singletons are
  measurable. A chain is a Markov kernel `κ : Kernel S S`; `κ(x, {y})` is `(κ x).real {y}` and
  `(P g) x = ∑_y κ(x, {y}) g y`. Stationarity is Mathlib's `κ.Invariant π`, irreducibility is
  Mathlib's `Kernel.IsIrreducible Measure.count κ` (every state reaches every state in some number
  of steps), and the path law from the initial law `ν` is Tau Ceti's
  `TauCeti.Probability.markovChainLaw ν κ` on `ℕ → S`, with coordinates `ω j`.

## Layer 1: martingale difference arrays and McLeish's theorem

### 1.1 Martingale difference arrays

Define `IsMartingaleDiffArray μ ℱ k X`: for every `n` and `j < k n`, `X n j` is strongly
measurable for `ℱ n (j + 1)`, integrable, and `μ[X n j | ℱ n j] = 0` almost everywhere (Durrett,
§8.2, p. 397, with rows of length `n` and `F(n, 0)` trivial).

- For each `n`, the partial sums `∑_{j<i} X n j`, `i ≤ k n`, form a martingale for `ℱ n` up to
  time `k n`.
- If `X` is a martingale difference array for `ℱ` and `𝒢 n i ⊆ ℱ n i` is another filtration for
  which each `X n j` is `𝒢 n (j + 1)`-measurable (for instance the natural filtration of the row),
  `X` is a martingale difference array for `𝒢`. The hypotheses of 1.3 and 3.2 involve the
  filtration only through the martingale difference property, so these two theorems may be proved
  for the natural filtration; 2.3 and 3.1 may not, as their conditional variances depend on it.
- Stopping at a predictable time: if `τ n` is a random index with `{j < τ n} ∈ ℱ n j` for every
  `j`, the array `1{j < τ n} · X n j` is again a martingale difference array.
- Square-integrable martingale differences in one row are orthogonal:
  `E[(∑ⱼ X n j)²] = ∑ⱼ E[(X n j)²]`.

**Checks.**

- Rademacher rows: with `ε₀, ε₁, …` independent signs and `X n j = εⱼ/√n` for `j < n`, the array is
  a martingale difference array for the natural filtration, with `ℱ n 0` trivial.
- The conditional mean is taken given the previous σ-algebra, not the current one: an entry with
  `μ[X n j | ℱ n (j + 1)] = 0` is itself `0` almost everywhere, since it is
  `ℱ n (j + 1)`-measurable.

*Needs:* Mathlib `MeasureTheory.Filtration`, `MeasureTheory.condExp`, `StronglyMeasurable`.
(Proved here.)

### 1.2 Dvoretzky's inequality

For events `A₁, …, A_N` adapted to a filtration `𝒢₀ ⊆ 𝒢₁ ⊆ ⋯` and a nonnegative
`𝒢₀`-measurable `δ`,
`P(A₁ ∪ ⋯ ∪ A_N | 𝒢₀) ≤ δ + P(∑_m P(A_m | 𝒢_(m−1)) > δ | 𝒢₀)` almost everywhere (Durrett,
Lemma 8.2.7, p. 400, after Dvoretzky). Taking expectations with a constant `δ` gives the
unconditional form used in 2.1.

**Checks.**

- With one event the inequality reads `P(A₁ | 𝒢₀) ≤ δ + 1{P(A₁ | 𝒢₀) > δ}`, which holds on each
  of the two events.
- For independent events of probability `p` with trivial `𝒢₀` and `δ = Np`, the right side is
  `Np ≥ 1 − (1 − p)^N`, the union bound.

*Needs:* 1.1; Mathlib `MeasureTheory.condExp`. (Durrett's induction on `N`.)

### 1.3 McLeish's theorem

Prove `tendstoInDistribution_sum_of_sum_sq`: let `X` be a martingale difference array on
`(Ω, μ)` with `IsMartingaleDiffArray μ ℱ k X`, and `σ² ≥ 0` a constant. If

- the row maxima are bounded in `L²`: some `C` has `∫⁻ (maxⱼ ‖X n j‖₊)² ∂μ ≤ C` for every `n`,
- the row maxima tend to `0` in probability, and
- `∑ⱼ (X n j)² → σ²` in probability,

then `∑ⱼ X n j → N(0, σ²)` in law (attributed to McLeish, 1974; proved here in the form
stated). The filtrations of different rows are unrelated.

Route (McLeish's product method; proved here). By Lévy's continuity theorem it suffices to show
`E exp(i t Sₙ) → exp(−σ²t²/2)` for each real `t`, where `Sₙ` is the row sum. First stop each row at
the first index `J` with `∑_{j≤J} (X n j)² > σ² + 1`, keeping the entries with index at most `J`
and replacing the later ones by `0`. The event that entry `j` is kept is
`{∑_{i<j} (X n i)² ≤ σ² + 1}`, which lies in `ℱ n j`, so the stopped array is again a martingale
difference array (1.1), and it agrees with the original one outside an event
whose probability tends to `0`. Write `exp(i x) = (1 + i x) exp(−x²/2 + r(x))` with
`|r(x)| ≤ |x|³` for `|x| ≤ 1/2`, so that `exp(i t Sₙ) = Tₙ Uₙ` with `Tₙ = ∏ⱼ (1 + i t X n j)` and
`Uₙ = exp(−t² ∑ⱼ (X n j)²/2 + ∑ⱼ r(t X n j))`. Then `E Tₙ = 1` by conditioning successively on
`ℱ n j`, each partial product before a kept entry being bounded;
`|Tₙ|² = ∏ⱼ (1 + t² (X n j)²) ≤ exp(t²(σ² + 1)) (1 + t² maxⱼ (X n j)²)` after stopping, so
`(Tₙ)` is bounded in `L²` and uniformly integrable; and `Uₙ → exp(−σ²t²/2)` in probability, since
`|∑ⱼ r(t X n j)| ≤ |t|³ maxⱼ |X n j| ∑ⱼ (X n j)²` once `|t| maxⱼ |X n j| ≤ 1/2`. With
`c = exp(−σ²t²/2)` and `E Tₙ = 1`, `E Tₙ Uₙ − c = E[Tₙ (Uₙ − c)]`; the integrand tends to `0` in
probability and is uniformly integrable, because `|Tₙ Uₙ| = |exp(i t Sₙ)| = 1` gives
`|Tₙ (Uₙ − c)| ≤ 1 + |Tₙ|`.

**Checks.**

- Rademacher rows `X n j = εⱼ/√n`, `j < n`: the maxima are `1/√n`, the sums of squares are `1`,
  and the theorem gives the de Moivre–Laplace theorem for `n^(−1/2) ∑ εⱼ`.
- The maxima must tend to `0`: the rows of length one with `X n 0 = ε₀` have sums of squares `1`
  and row sums `±1`, not Gaussian.
- The `L²` bound on the maxima cannot be dropped. Take row `n ≥ 2` of length `2n`: first
  `X n j = εⱼ/√n` for `j < n`, then `n` independent entries each equal to `n` with probability
  `1/n²` and to `−(1/n)/(1 − 1/n²)` otherwise, all of mean `0`. The maxima tend to `0` in
  probability (an entry equal to `n` occurs with probability `1 − (1 − 1/n²)ⁿ ≤ 1/n`), the sums of
  squares tend to `1`, but off that event the last `n` entries sum to `−1/(1 − 1/n²) → −1`, so the
  row sums tend in law to `N(−1, 1)`. Here `E maxⱼ (X n j)² ≥ n² (1 − (1 − 1/n²)ⁿ) → ∞`.
- `σ² = 0`: if the sums of squares tend to `0` under the two conditions on the maxima, the row sums
  tend to `0` in law, the Dirac mass that `gaussianReal 0 0` is.

*Needs:* 1.1; Mathlib `TendstoInDistribution.of_tendsto_charFun`, `charFun_gaussianReal`,
`gaussianReal_zero_var`, `TendstoInMeasure`, `MeasureTheory.condExp`. (Proved here.)

### Examples

Rademacher rows; rows of independent centred variables with `|X n j| ≤ cₙ` for constants `cₙ → 0`
and variances summing to `1`, where 1.3 is the Lindeberg–Feller theorem for uniformly small bounded
entries (the sums of squares tend to `1` because their variance is at most `cₙ²`); the
counterexamples of the Checks of 1.3.

### Dependencies

Layer 1 uses Mathlib's conditional expectations, filtrations, convergence in measure, Lévy's
continuity theorem and Gaussian laws. No other layer.

## Layer 2: conditional variances

### 2.1 The conditional Lindeberg condition controls the maxima

Let `X` be a martingale difference array of square-integrable entries and `ε > 0`. Then
`∑ⱼ P(|X n j| > ε | ℱ n j) ≤ ε⁻² ∑ⱼ E[(X n j)² 1{|X n j| > ε} | ℱ n j]` almost everywhere, and if
the conditional Lindeberg sums `∑ⱼ E[(X n j)² 1{|X n j| > ε} | ℱ n j]` tend to `0` in probability
for every `ε > 0`, then `maxⱼ |X n j| → 0` in probability (Durrett, proof of (8.2.3), pp. 400–401,
with a fixed `ε` in place of `εₙ`).

Route: by 1.2 with `Aⱼ = {|X n j| > ε}`, `P(maxⱼ |X n j| > ε) ≤ δ + P(∑ⱼ P(Aⱼ | ℱ n j) > δ)` for
every `δ > 0`, and the conditional Chebyshev inequality bounds the sum.

**Checks.**

- For Rademacher rows the conditional Lindeberg sums vanish as soon as `ε√n ≥ 1`.
- In the rows of length one with `X n 0 = ε₀`, the conditional Lindeberg sum is `1` for every
  `ε < 1`, and the maximum is `1`.

*Needs:* 1.1, 1.2. (Proved here, following the cited route.)

### 2.2 Sums of squares and conditional variances

Let `X` be a martingale difference array of square-integrable entries whose conditional variances
`Vₙ = ∑ⱼ μ[(X n j)² | ℱ n j]` are bounded in probability and whose conditional Lindeberg sums tend
to `0` in probability for every `ε > 0`. Then `∑ⱼ (X n j)² − Vₙ → 0` in probability (a comparison
of the kind found in Hall and Heyde; proved here).

Route: split `X n j` into `X̄ = X n j 1{|X n j| ≤ ε}` and `X̂ = X n j 1{|X n j| > ε}`. The
differences `X̄² − μ[X̄² | ℱ n j]` are martingale differences with conditional variance at most
`ε² μ[X̄² | ℱ n j]`; stopped at the predictable time when `Vₙ` first exceeds a level `c`, their sum
has second moment at most `ε² c`. The sums `∑ⱼ X̂²` and `∑ⱼ μ[X̂² | ℱ n j]` tend to `0` in
probability, the second by hypothesis and the first by comparing with it after stopping at the
predictable time when it first exceeds `δ`.

**Checks.**

- For Rademacher rows both sums equal `1`.
- The conditional Lindeberg condition is needed: for rows of length one with `ℱ n 0` trivial and
  `X n 0 = ε₀ ξ`, with `ξ` independent of `ε₀` and `ξ² = 2` or `0` with probability `1/2` each,
  `Vₙ = E[ε₀² ξ²] = 1`, the conditional Lindeberg sum is `1` for every `ε < √2`, and the sum of
  squares is `2` or `0`.

*Needs:* 1.1; Mathlib `MeasureTheory.condExp`. (Proved here.)

### 2.3 The martingale central limit theorem with conditional variances

Prove `tendstoInDistribution_sum_of_condVar`: let `X` be a martingale difference array with
`IsMartingaleDiffArray μ ℱ k X` and every entry `X n j`, `j < k n`, in `L²(μ)`, and let `σ² ≥ 0` be
a constant. If

- `∑ⱼ μ[(X n j)² | ℱ n j] → σ²` in probability, and
- for every `ε > 0`, `∑ⱼ μ[(X n j)² 1{|X n j| > ε} | ℱ n j] → 0` in probability,

then `∑ⱼ X n j → N(0, σ²)` in law. This is the array form of Brown's martingale central limit
theorem (attributed to Brown, 1971, and to Hall and Heyde). Durrett, Theorem 8.2.4, p. 398,
proves the functional form for rows of length `n` with `F(n, 0)` trivial under the stronger
first condition that `∑_{1 ≤ m ≤ nt} E[X(n, m)² | F(n, m − 1)] → t` in probability for every
`t ∈ [0, 1]` (Durrett indexes from `1`); its value at `t = 1` is the case `σ² = 1` of this
statement.

Route: stop each row at the predictable time `τ n`, the first `j` with
`∑_{i ≤ j} μ[(X n i)² | ℱ n i] > σ² + 1`, and keep the entries with `j < τ n`, an event in
`ℱ n j`. The stopped array is a martingale difference array (1.1); its row maxima have second
moment at most `E ∑ⱼ (X n j)² 1{j < τ n} = E ∑ⱼ μ[(X n j)² | ℱ n j] 1{j < τ n} ≤ σ² + 1`,
they tend to `0` in probability by 2.1, and its sums of squares tend to `σ²` by 2.2. McLeish's
theorem 1.3 gives its row sums `N(0, σ²)` in law. The stopped and the original row sums differ
only on `{Vₙ > σ² + 1}`, whose probability tends to `0`, and Mathlib's
`tendstoInDistribution_of_tendstoInMeasure_sub` transfers the limit.

**Checks.**

- Independent rows with the natural filtration: the conditional sums are the unconditional ones,
  and the statement is the scalar Lindeberg–Feller theorem.
- The conditional Lindeberg condition is needed: with `Bⱼ` independent Bernoulli(`1/n`) and
  `X n j = Bⱼ − 1/n`, `j < n`, the variances sum to `1 − 1/n → 1`, the Lindeberg sums are
  `(1 − 1/n)² → 1` for `ε < 1/2` and `n > 1/ε`, and the row sums tend to a centred Poisson law.
- Square integrability is needed in this form: for rows of length one with `ℱ n 0` trivial and
  `X n 0` a symmetric variable with `E|X n 0| < ∞` and `E (X n 0)² = ∞`, Mathlib's conditional
  expectation of the non-integrable `(X n 0)²` is `0`, so both conditions hold with `σ² = 0`,
  while the row sums do not tend to `0`.
- `σ² = 0`: if the conditional variances tend to `0` in probability, the row sums tend to `0` in
  probability; then the second condition holds automatically, as each conditional Lindeberg sum is
  at most the conditional variance.

*Needs:* 1.1, 1.3, 2.1, 2.2; Mathlib `tendstoInDistribution_of_tendstoInMeasure_sub`,
`gaussianReal`. (Proved here, by the route above.)

### Examples

Rademacher rows; martingale transforms `X n j = Hⱼ εⱼ/√n` with `Hⱼ` bounded and `σ(ε₀, …, εⱼ₋₁)`-
measurable and `n⁻¹ ∑_{j<n} Hⱼ² → σ²` in probability; the counterexamples above.

### Dependencies

Layer 2 uses 1.1, 1.2 and 1.3, and Mathlib's conditional expectations and Slutsky's lemma.

## Layer 3: single martingales

### 3.1 Normalization by the square root of the number of terms

Prove `tendstoInDistribution_inv_sqrt_mul_sum_of_condVar`: let `X : ℕ → Ω → ℝ` be a martingale
difference sequence for `ℱ` with every `X j` in `L²(μ)`, and `σ² ≥ 0`. If

- `n⁻¹ ∑_{j<n} μ[(X j)² | ℱ j] → σ²` in probability, and
- for every `ε > 0`, `n⁻¹ ∑_{j<n} E[(X j)² 1{|X j| > ε√n}] → 0`,

then `(√n)⁻¹ ∑_{j<n} X j → N(0, σ²)` in law (Durrett, Theorem 8.2.8, p. 401, in its functional
form and for `σ² > 0`).

Route: apply 2.3 to the array `X n j = X j/√n`, `j < n`, with `ℱ n = ℱ`; the second condition is
the expectation of the conditional Lindeberg sum, so that sum tends to `0` in `L¹` and hence in
probability.

**Checks.**

- Independent identically distributed centred `X j` with variance `v`: the first condition holds
  with `σ² = v` and the second by dominated convergence, giving Mathlib's central limit theorem.
- Martingale transforms `X j = Hⱼ εⱼ`, with `Hⱼ` bounded by `B` and measurable for
  `σ(ε₀, …, εⱼ₋₁)`, have conditional variances `Hⱼ²`, so the first condition asks that
  `n⁻¹ ∑_{j<n} Hⱼ² → σ²` in probability; the second holds, its sum vanishing once `ε√n > B`.

*Needs:* 2.3. (Proved here.)

### 3.2 The Billingsley–Ibragimov theorem

Prove `tendstoInDistribution_inv_sqrt_mul_sum_of_ergodic`: let `X` be a martingale difference
sequence for `ℱ` with `X 0` in `L²(μ)`, and suppose the shift `x ↦ (j ↦ x (j + 1))` of `ℕ → ℝ` is
ergodic, in Mathlib's sense `Ergodic`, for the law of `(X j)ⱼ`; this includes stationarity. Then
`(√n)⁻¹ ∑_{j<n} X j → N(0, E[(X 0)²])` in law (Durrett, Theorem 8.3.1, p. 402, for a two-sided
stationary ergodic sequence and its natural filtration; Billingsley, 1961, and Ibragimov, 1963).

Route: apply 1.3 to `X n j = X j/√n`, `j < n`. The sums of squares `n⁻¹ ∑_{j<n} (X j)²` are the
Birkhoff averages of `x ↦ (x 0)²` along the shift, which tend to `E[(X 0)²]` in `L¹`: for
square-integrable observables this is Tau Ceti's `tendsto_integral_abs_birkhoffAverage_sub_condExp`
(the mean ergodic theorem in `L¹` form), its limit is constant by Mathlib's
`Ergodic.ae_eq_const_of_ae_eq_comp_ae`, and the integrable observable `(x 0)²` is reached by
truncation, the averages being contractions of `L¹`. The maxima satisfy
`P(maxⱼ |X j| > ε√n) ≤ n P((X 0)² > ε² n) ≤ ε⁻² E[(X 0)²; (X 0)² > ε² n] → 0` and
`E maxⱼ (X j)²/n ≤ E[(X 0)²]`.

**Checks.**

- Ergodicity is needed: with `ξ` equal to `1` or `2` with probability `1/2` each, independent of
  Rademacher signs `εⱼ`, and `ℱ j = σ(ξ, ε₀, …, εⱼ₋₁)`, the sequence `X j = ξ εⱼ` is a stationary
  martingale difference sequence with `E[(X 0)²] = 5/2`, and the normalized sums tend to the
  mixture `½ N(0, 1) + ½ N(0, 4)`, whose fourth moment is `51/2`, not the `3 (5/2)² = 75/4` of
  `N(0, 5/2)`.
- `E[(X 0)²] = 0` forces `X j = 0` almost everywhere, and the limit is the Dirac mass at `0`.

*Needs:* 1.3; Mathlib `Ergodic`, `Ergodic.ae_eq_const_of_ae_eq_comp_ae`; Tau Ceti
`TauCeti.Probability.tendsto_integral_abs_birkhoffAverage_sub_condExp`. (Proved here, by the route
above.)

### Examples

Martingale differences `X j = ζⱼ₊₁ h(ζⱼ)` for the filtration `ℱ j = σ(ζ₀, …, ζⱼ)`, built from an
independent identically distributed square-integrable sequence `(ζⱼ)` of mean zero and a bounded
measurable `h`, which are stationary and ergodic as a factor of a Bernoulli shift;
independent identically distributed sequences, where 3.2 is Mathlib's central limit theorem.

### Dependencies

3.1 uses 2.3; 3.2 uses 1.3, Mathlib's ergodic maps and Tau Ceti's mean ergodic theorem.

## Layer 4: finite Markov chains

### 4.1 Gordin's central limit theorem

Prove `tendstoInDistribution_markovChainLaw_of_poisson`: let `S` be finite, `κ` an irreducible
Markov kernel on `S` with stationary probability `π`, `ν` any initial probability, `f : S → ℝ`,
and `g : S → ℝ` a solution of the Poisson equation

    g x − ∑_y κ(x, {y}) g y = f x − E_π f   for every state x.

Then, under `markovChainLaw ν κ`,

    (√n)⁻¹ ∑_{j<n} (f(ω j) − E_π f)  →  N(0, σ²)  in law,  σ² = ∑_x π{x} (g x² − (P g x)²).

Aperiodicity is not assumed. (Gordin, 1969, in the stationary setting; Durrett, Example 8.3.4,
p. 405, proves the stationary aperiodic case through Theorem 8.3.2. The form here is proved here.)

Route: `Mⱼ = g(ω (j + 1)) − (P g)(ω j)` is a bounded martingale difference sequence for the
natural filtration of the path, by Tau Ceti's Markov property
`MeasureTheory.Measure.condExp_shift_iterate_markovChainLaw`, and
`∑_{j<n} (f(ω j) − E_π f) = ∑_{j<n} Mⱼ + g(ω 0) − g(ω n)`. The conditional variance of `Mⱼ` is
`h(ω j)` with `h = P(g²) − (P g)²`, and `n⁻¹ ∑_{j<n} h(ω j) → E_π h = σ²` almost surely by the
ergodic theorem for occupation frequencies (MarkovChainsAndRenewal Layer 2, item 4, where the
chain reaches every state almost surely by its Layer 2, item 3, with
`π{y} = 1/E_y[return time]` from its Layer 3, item 2); `E_π h = E_π[g²] − E_π[(P g)²]` by
stationarity. The increments are bounded, so the Lindeberg condition of 3.1 holds, and 3.1 gives
the martingale part; the boundary term `(g(ω 0) − g(ω n))/√n` tends to `0` uniformly.

**Checks.**

- `σ²` does not depend on the solution: `g + c` changes `g² − (P g)²` by `2c (g − P g)`, whose
  `π`-mean is `2c E_π(f − E_π f) = 0`. For the two-state chain of the Examples with `p = 1/3`,
  `q = 1/2` and `f` the indicator of `a`, the formula gives `σ² = 42/125`, which is
  `pq(2 − p − q)/(p + q)³`.
- A periodic chain: on the four states `a, b, c, d` with `κ(a, ·) = (0, 0, 0.3, 0.7)`,
  `κ(b, ·) = (0, 0, 0.6, 0.4)`, `κ(c, ·) = (0.5, 0.5, 0, 0)`, `κ(d, ·) = (0.2, 0.8, 0, 0)` (period
  two) and `f = (1, −2, 0.5, 3)`, `σ² ≈ 1.458`, and `n⁻¹ Var` from `a` is `≈ 1.455` at `n = 400`.
- The flip chain on two states with `f = (1, −1)`: `g = (1/2, −1/2)`, `P g = −g`, `σ² = 0`, and
  indeed the sums take only the values `−1, 0, 1`; the series `Var + 2 ∑ Cov` of the stationary
  autocovariances `(−1)ʲ` does not converge, which is why the variance is written through `g`.
- Irreducibility is needed. On `{a, b, c}` with `a` absorbing and `κ(b, ·) = κ(c, ·)` uniform on
  `{b, c}`, `π = (1/2, 1/4, 1/4)` is stationary, `f = (0, 1, −1)` has `E_π f = 0` and `g = f` solves
  the Poisson equation, so `σ² = 1/2`; from `π` the normalized sums tend to
  `½ δ₀ + ½ N(0, 1)`, which has variance `1/2` but fourth moment `3/2`, not the `3/4` of
  `N(0, 1/2)`.

*Needs:* 3.1; Tau Ceti `TauCeti.Probability.markovChainLaw`,
`MeasureTheory.Measure.condExp_shift_iterate_markovChainLaw`; Mathlib
`MeasureTheory.Filtration.piLE`, `Kernel.Invariant`, `Kernel.IsIrreducible`,
`tendstoInDistribution_of_tendstoInMeasure_sub`; MarkovChainsAndRenewal Layer 2, items 3 and 4,
and Layer 3, item 2.

### Examples

The two-state chain with `κ(a, b) = p`, `κ(b, a) = q`, `p, q ∈ (0, 1]`, and `f` the indicator of
`a`: the solution `g`, the value `σ² = pq(2 − p − q)/(p + q)³`, and `σ² = 0` for the flip chain
`p = q = 1`.

### Dependencies

Layer 4 uses 3.1, Tau Ceti's path law and Markov property, Mathlib's Slutsky lemma, and
MarkovChainsAndRenewal Layer 2, items 3 and 4, and Layer 3, item 2.

## Scope and ownership

This roadmap owns martingale difference arrays and the statements above: Dvoretzky's inequality,
McLeish's theorem, the comparison of sums of squares with conditional variances, the martingale
central limit theorem with conditional variances and the conditional Lindeberg condition, its form
for one martingale difference sequence, the Billingsley–Ibragimov theorem, and Gordin's central
limit theorem for finite irreducible chains, stated with a given solution of the Poisson equation.

Already in the libraries and therefore not targets: Mathlib's central limit theorem for
independent identically distributed real variables (`tendstoInDistribution_inv_sqrt_mul_sum_sub`),
Lévy's continuity theorem, Slutsky's lemma in the form
`tendstoInDistribution_of_tendstoInMeasure_sub`, the Gaussian laws and their characteristic
functions; Tau Ceti's path law of a Markov chain, its Markov property and the mean ergodic theorem.

Left to other roadmaps:

- MathematicalStatisticsAsymptotic 1.2 owns the multivariate Lindeberg–Feller theorem for
  independent rows (`tendstoInDistribution_sum_of_lindeberg`) and the multivariate central limit
  theorem. Theorem 2.3 above is scalar and allows martingale dependence; with independent rows it
  is the scalar case of that theorem, and nothing of that roadmap is restated.
- MarkovChainsAndRenewal owns the classification of states, the stationary law of an irreducible
  chain and the ergodic theorem for occupation frequencies (its Layers 2 and 3), consumed in 4.1.
- MarkovChainMixing (an open roadmap, not on main) states in its 6.3 the almost sure ergodic
  theorem for time averages of a finite irreducible chain and in its 6.4 a variance bound for time
  averages through the spectral gap; this roadmap restates neither, takes the ergodic theorem from
  MarkovChainsAndRenewal, which is on main, and does not depend on MarkovChainMixing. That roadmap
  lists the central limit theorem for Markov chains as outside its scope.
- The existence and uniqueness up to constants of solutions of the Poisson equation, the
  expression of `σ²` through the autocovariances and the fundamental matrix, spectral bounds on
  `σ²` and Peskun's ordering belong to the theory of the asymptotic variance of Markov chain Monte
  Carlo, not to this roadmap; 4.1 takes a solution `g` as a hypothesis.

Outside the scope: functional central limit theorems and invariance principles, which need
Brownian motion as a random continuous path; mixed Gaussian limits
and stable convergence under nested filtrations; rates of convergence (Berry–Esseen bounds for
martingales); vector-valued martingales; Gordin's theorem for general stationary sequences
(Durrett, Theorem 8.3.2) and for Markov chains on infinite state spaces; central limit theorems
for mixing sequences.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Probability/Process/Filtration.lean`: `MeasureTheory.Filtration ι m` (a monotone family
  of sub-σ-algebras of `m`); `MeasureTheory.Filtration.piLE` (the natural filtration of path space,
  generated by the coordinates up to time `n`).
- `Mathlib/MeasureTheory/Function/ConditionalExpectation/Basic.lean`: `MeasureTheory.condExp`,
  written `μ[f | m']` (the conditional expectation, `0` for a non-integrable `f`).
- `Mathlib/MeasureTheory/Function/ConvergenceInMeasure.lean`:
  `MeasureTheory.TendstoInMeasure μ f l g` (for every `ε > 0`, `μ{ε ≤ edist (f i) g} → 0` along
  `l`).
- `Mathlib/MeasureTheory/Function/ConvergenceInDistribution.lean`:
  `MeasureTheory.TendstoInDistribution X l Z μ μ'` (almost everywhere measurable `X i` and `Z`, and
  weak convergence of the laws as probability measures);
  `MeasureTheory.tendstoInDistribution_of_tendstoInMeasure_sub` (for a countably generated filter:
  if `X → Z` in law and `Y − X → 0` in measure with `Y` almost everywhere measurable, then
  `Y → Z` in law).
- `Mathlib/MeasureTheory/Measure/LevyConvergence.lean`:
  `MeasureTheory.TendstoInDistribution.of_tendsto_charFun` (pointwise convergence of characteristic
  functions of the laws gives convergence in law).
- `Mathlib/Probability/Distributions/Gaussian/Real.lean`: `ProbabilityTheory.gaussianReal μ v`
  for `v : ℝ≥0`; `ProbabilityTheory.gaussianReal_zero_var` (`gaussianReal μ 0 = dirac μ`);
  `ProbabilityTheory.charFun_gaussianReal`.
- `Mathlib/Probability/HasLaw.lean`: `ProbabilityTheory.HasLaw Z L μ'`.
- `Mathlib/Probability/CentralLimitTheorem.lean`:
  `ProbabilityTheory.tendstoInDistribution_inv_sqrt_mul_sum_sub` (the independent identically
  distributed case, cited in the Checks of 3.1 and 3.2).
- `Mathlib/Dynamics/Ergodic/Ergodic.lean`: `Ergodic f μ` (measure preserving, and invariant
  measurable sets are null or conull). `Mathlib/Dynamics/Ergodic/Function.lean`:
  `Ergodic.ae_eq_const_of_ae_eq_comp_ae` (an almost everywhere invariant function into a
  countably separated space is almost everywhere constant).
- `Mathlib/Probability/Kernel/Invariance.lean`: `ProbabilityTheory.Kernel.Invariant κ π`.
  `Mathlib/Probability/Kernel/Irreducible.lean`: `ProbabilityTheory.Kernel.IsIrreducible φ κ`,
  used with `φ = Measure.count`.

### From Tau Ceti

- `TauCeti/Probability/Process/MarkovChain.lean`: `TauCeti.Probability.markovChainLaw ν κ` (the
  Ionescu–Tulcea path law on `ℕ → S` of the chain with initial law `ν` and kernel `κ`, a
  probability measure when `ν` is).
- `TauCeti/Probability/MarkovChain/MarkovProperty.lean`:
  `MeasureTheory.Measure.condExp_shift_iterate_markovChainLaw` (for an integrable `f` on path
  space, the conditional expectation of `f` after the `n`-fold shift given the coordinates up to
  `n` is `∫ f d(markovChainLaw (dirac (ω n)) κ)` almost surely).
- `TauCeti/Probability/Ergodic/CondExpProjection.lean`:
  `TauCeti.Probability.tendsto_integral_abs_birkhoffAverage_sub_condExp` (for a measure-preserving
  map of a finite measure space and a square-integrable `f`, the Birkhoff averages of `f` converge
  in `L¹` to the conditional expectation of `f` given the invariant σ-algebra).

### From TauCetiRoadmap.MarkovChainsAndRenewal

- Layer 2, item 4: for every initial law and every state `y`, the occupation frequency
  `n⁻¹ #{1 ≤ j ≤ n : X j = y}` tends almost surely to
  `1{the chain reaches y} / E_y[return time to y]`.
- Layer 2, item 3: a finite closed communicating class is positive recurrent, and an irreducible
  recurrent chain reaches every state almost surely from every initial law.
- Layer 3, item 2: an irreducible positive recurrent chain has a unique invariant probability,
  with `π{x} = 1/E_x[return time to x]`.

## References

- Rick Durrett, *Probability: Theory and Examples*, fifth edition, Cambridge University Press,
  2019; the version of 11 January 2019 posted on the author's page at Duke University
  (`services.math.duke.edu/~rtd/PTE/PTE5_011119.pdf`), §8.2, pp. 396–401 (the definition of a
  martingale difference array on p. 397, Theorem 8.2.4 on p. 398, Lemma 8.2.7 and the proof of
  (8.2.3) on pp. 400–401, Theorem 8.2.8 on p. 401), and §8.3, pp. 402–405 (Theorem 8.3.1 on
  p. 402, Example 8.3.4 on p. 405). Page numbers are those printed in that file.
- D. L. McLeish, Dependent central limit theorems and invariance principles, *Annals of
  Probability* 2 (1974), 620–628. Attributed in prose only; no locator is given.
- B. M. Brown, Martingale central limit theorems, *Annals of Mathematical Statistics* 42 (1971),
  59–66; P. Hall and C. C. Heyde, *Martingale Limit Theory and Its Application*, Academic Press,
  1980. Attributed in prose only; no locator is given.
- P. Billingsley, The Lindeberg–Lévy theorem for martingales, *Proceedings of the American
  Mathematical Society* 12 (1961), 788–792; I. A. Ibragimov, A central limit theorem for a class
  of dependent random variables, *Theory of Probability and its Applications* 8 (1963), 83–89;
  M. I. Gordin, The central limit theorem for stationary processes, *Soviet Mathematics Doklady*
  10 (1969), 1174–1176. Attributed as Durrett attributes them; not consulted.

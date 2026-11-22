# Roadmap: best-arm identification

**Summary.** In a stochastic bandit with finitely many arms, a learner samples arms for a fixed
number of rounds and then names one arm; it errs when the named arm has a smaller mean than the
best one. This roadmap proves upper and lower bounds on that probability of error. As in the
theory of regret, a policy is a sequence of Markov kernels from histories to arms, and its
interaction with a bandit is a probability measure on trajectories. A sampling rule is a
condition on the policy and the recommendation, with ties broken in any way, never an algorithm.
Reward laws are sub-Gaussian with variance proxy `c` (`c = 1/4` for rewards in `[0, 1]`). The
headline theorems:

- *Uniform allocation.* If every arm is played `m` times and an arm with the largest sum of
  rewards is named, the probability of error is at most the sum over the suboptimal arms of
  `exp(−m Δ²/(4c))`, `Δ` being the arm's gap.
- *Sequential halving.* With `2^L` arms listed in decreasing order of mean, a budget `n` divisible
  by `2^L L`, and `L` phases that split the budget evenly and keep the better half of the arms
  by their sums in the phase, the probability of error is at most
  `3 L exp(−n/(16 c L H₂))`, where `H₂` is the largest `i/Δ_i²` over the suboptimal arms of
  rank `i`; several arms may be optimal. A phase-by-phase form holds for any number of arms and
  any plays per phase.
- *Median elimination.* For `c > 0`, `ε > 0` and `0 < δ ≤ 1`, with `L = ⌈log₂ K⌉` halving
  phases of `⌈(16c/ε_ℓ²) log(3/δ_ℓ)⌉` plays per arm, where `ε_ℓ = (3/4)^ℓ ε/4` and
  `δ_ℓ = δ/2^(ℓ+1)`, the named arm is within `ε` of the best with probability at least `1 − δ`,
  after at most `(256 c 2^L/ε²)(9 log(3/δ) + 81 log 2) + 2 · 2^L` rounds.
- *Lower bound.* For `K ≥ 2`, `v > 0`, `Δ > 0`, every policy and every measurable
  recommendation from `n` rounds there is a Gaussian bandit of variance `v`, with a best arm
  ahead of every other by `Δ`, on which the probability of error is at least
  `exp(−2nΔ²/((K − 1)v))/4`.

A deterministic theorem completes the picture: successive halving on convergent loss sequences
names an arm whose limit is within `ε/2` of the best once the budget exceeds an explicit
threshold, with ties and rounding made exact.

The roadmap rests on MultiArmedBandits, whose model it copies and whose sub-Gaussian bound for
weighted reward noises and divergence decomposition carry the probabilistic proofs; on
MathematicalStatisticsNonparametric, for Gaussian divergences, the binary divergence of an event
and the Bretagnolle–Huber inequality; and on Mathlib's sub-Gaussian random variables.

Layer 1 sets up the model, the halving schedules and uniform allocation; Layer 2 proves the
sequential-halving bounds; Layer 3 the deterministic theorem; Layer 4 median elimination;
Layer 5 the lower bounds. Layers 2 and 4 use Layer 1; Layer 3 uses nothing else; Layer 5 uses
1.1 only.

## Conventions

- **Arms and laws.** `ι` is a finite nonempty type of arms with measurable singletons, and
  `K = Fintype.card ι`. A bandit is `ν : ι → ProbabilityMeasure ℝ`; `mean ν a` is the mean of
  `ν a`, `μ⋆` the largest mean and `gap ν a = μ⋆ − mean ν a`. Several arms may be optimal. Where
  ranks matter (Layer 2) the arms are `Fin k`, listed in decreasing order of mean
  (`Antitone (mean ν)`), so arm `0` is optimal and the arm of index `i` has rank `i + 1`.
- **Rounds and trajectories** are those of MultiArmedBandits: rounds are numbered from `0`, a
  trajectory is `ω : ℕ → ι × ℝ`, `A_t = (ω t).1` is the arm and `X_t = (ω t).2` the reward of
  round `t`, `banditLaw ν π` is the law of the trajectory under the policy `π`, and
  `T_a(t) = pullCount a t ω` counts the rounds `s < t` in which `a` is played.
- **Recommendations.** In Layers 1, 2 and 4 a recommendation is any map
  `ψ : (ℕ → ι × ℝ) → ι` constrained by the sampling condition; in Layer 5 it is a measurable map
  `ψ` on the histories `range n → ι × ℝ` of the first `n` rounds, applied to
  `Finset.restrict (range n) ω`. The **probability of error** is
  `(banditLaw ν π).real {ω | 0 < gap ν (ψ ω)}`.
- **Sub-Gaussian** is Mathlib's `HasSubgaussianMGF X c μ` with `c : ℝ≥0`, meaning
  `E exp(tX) ≤ exp(c t²/2)` for all real `t`; a bandit is `c`-sub-Gaussian if every centred
  reward law `x ↦ x − mean ν a` is. A source's `σ`-subgaussian is `c = σ²`.
- **Ties.** Every sampling condition allows any tie-breaking, including one that depends on the
  whole trajectory, and every theorem holds for all of them. Ties are not a nuisance at small
  budgets: they decide the error (Check of 1.2).
- **Junk values.** Real division by `0` is `0` and `Real.log 0 = 0`, so `exp(−x/0) = 1`;
  natural-number division and subtraction truncate; `⌈x⌉₊ = 0` for `x ≤ 0`; `sInf ∅ = 0` in `ℕ`.
  Each statement says what it asserts at such values.

## Layer 1: the bandit model, halving schedules and uniform allocation

### 1.1 The bandit model

Copy verbatim from MultiArmedBandits the structure `Policy` and the law `envLaw` (its 1.1), the
predicate `Policy.PlaysIn` (1.1), the reward kernel `rewardKernel` with its Markov instance
`isMarkovKernel_rewardKernel`, the law `banditLaw`, `mean`, `gap` and `pullCount` (1.2),
`prefixSum` (2.2) and `gaussianBandit` (4.2). The facts used below are MultiArmedBandits 1.1
`ae_forall_mem_of_playsIn` (a policy that plays in sets `S` plays, almost surely, in `S t ω` at
every round), 2.1 `hasSubgaussianMGF_weightedNoise` and 4.1 `klDiv_map_restrict_banditLaw`,
stated under Exact supplier contracts. The Checks of MultiArmedBandits 1.1, 1.2 and 2.2 test
these definitions. (No locator: definitions.)

*Needs:* MultiArmedBandits 1.1, 1.2, 2.2, 4.2 (definitions).

### 1.2 Halving schedules

Let `halvingSize k ℓ = (k + 2^ℓ − 1)/2^ℓ`, which is `⌈k/2^ℓ⌉`: the number of arms left after
`ℓ` halvings of `k` arms when each halving keeps `⌈m/2⌉` of `m` arms. For plays per phase
`T : ℕ → ℕ`, phase `ℓ` occupies the rounds from `phaseStart k T ℓ = Σ_{j<ℓ} halvingSize k j · T j`
to `phaseStart k T (ℓ + 1)`. Let `phaseSum a u v ω` be the sum of the rewards of arm `a` in the
rounds `u ≤ s < v` and `phaseCount a u t ω` the number of rounds `u ≤ s < t` in which `a` is
played. Say that `(π, ψ)` **follows a halving schedule** with `L` phases, plays `T` and surviving
sets `A : ℕ → (ℕ → ι × ℝ) → Finset ι` (`IsSequentialHalving L T A π ψ`) if, writing `s_ℓ` for
`phaseStart K T ℓ`:

- `A 0 ω` is the set of all arms; for `ℓ < L`, `A (ℓ+1) ω ⊆ A ℓ ω` has `⌈|A ℓ ω|/2⌉` elements,
  and every arm of `A (ℓ+1) ω` has a phase-`ℓ` sum `phaseSum a s_ℓ s_(ℓ+1) ω` at least that of
  every arm of `A ℓ ω` outside `A (ℓ+1) ω`;
- for `ℓ ≤ L` and every arm `a`, `{ω | a ∈ A ℓ ω}` is measurable and depends only on the rounds
  before `s_ℓ` (`DependsOn … (Set.Iio s_ℓ)`);
- `π` plays in the sets `S t ω` of arms `a` such that, if `t` lies in phase `ℓ < L`, then
  `a ∈ A ℓ ω` and `phaseCount a s_ℓ t ω < T ℓ`; outside the phases nothing is required;
- `ψ ω ∈ A L ω` for every `ω`.

Then `|A ℓ ω| = halvingSize K ℓ` for `ℓ ≤ L`, and, almost surely, every arm of `A ℓ ω` is played
exactly `T ℓ` times in phase `ℓ` (`halvingSize K ℓ · T ℓ` rounds, each spent on an arm with fewer
than `T ℓ` plays in the phase, by `ae_forall_mem_of_playsIn`). When `K ≤ 2^L` the last set has
one element, the recommendation. Since `S (n+1) ω` depends only on the rounds up to `n`, the
condition constrains each kernel of the policy at the history it sees. With
`T ℓ = ⌊n/(L · halvingSize K ℓ)⌋` and `L = ⌈log₂ K⌉` this is the sequential halving of Karnin,
Koren and Somekh (2013, Algorithm 2, §4) and of Lattimore and Szepesvári (2020, Algorithm 22,
p. 413); with the plays of 4.1 it is median elimination (Even-Dar, Mannor and Mansour 2006,
Algorithm 4, p. 1088) with the elimination rule fixed as in 4.1. Comparing phase sums is
comparing the empirical means of the phase, since every surviving arm has the same number of
plays.

**Checks.**

- `halvingSize 5 ℓ` for `ℓ = 0, 1, 2, 3` is `5, 3, 2, 1`. Keeping `⌊m/2⌋` arms instead would
  give `5, 2, 1, 0`, an empty set after `⌈log₂ 5⌉ = 3` phases.
- `K = 4`, `T = (1, 2)`: `phaseStart 4 T ℓ` is `0, 4, 8` for `ℓ = 0, 1, 2`; the phases have
  `4 · 1` and `2 · 2` rounds.
- The condition can be met: the deterministic policy that, in phase `ℓ`, plays the arm of
  `A ℓ ω` of least index with fewer than `T ℓ` plays in the phase, with `A (ℓ+1) ω` the
  `⌈|A ℓ ω|/2⌉` arms of largest phase sum, ties to the smaller index, satisfies it (its sets
  are measurable and depend on the earlier phases only). Such an arm exists at every history,
  reachable or not: at a round of phase `ℓ` fewer than `|A ℓ ω| · T ℓ` rounds of the phase have
  passed, so some arm of `A ℓ ω` has fewer than `T ℓ` plays in it.
- Ties decide the error at small budgets. Two Bernoulli arms of means `(3/4, 1/4)`, `L = 1`:
  with `T 0 = 0` both sums are `0`, and the probability of error is `1` when the tie goes to the
  second arm and `0` when it goes to the first; with `T 0 = 1` it is `7/16` and `1/16`.

*Needs:* 1.1; Mathlib `DependsOn`, `Finset.Ico`.

### 1.3 Uniform allocation

Say that `(π, ψ)` is **uniform allocation with `m` plays per arm** (`IsUniformAllocation m π ψ`)
if in the rounds `t < K m` the policy plays only arms with `T_a(t) < m`, and `ψ ω` maximizes
`prefixSum b m (K m) ω` over the arms `b`. Prove (`measureReal_gap_pos_le_of_isUniformAllocation`)
that for a `c`-sub-Gaussian bandit

    P(0 < gap ν ψ) ≤ Σ_{a : gap ν a > 0} exp(−m gap(a)²/(4c)).

Proof route. Fix an optimal arm `a⋆`. If `ψ ω = a` is suboptimal then
`prefixSum a m (Km) ω ≥ prefixSum a⋆ m (Km) ω`. The bound needed is the third item of
MultiArmedBandits 2.2 (the difference of the centred sums of the first `m` rewards of two arms is
`c(2m)`-sub-Gaussian), a README item without a Lean declaration, so its short proof is kept
here. Apply MultiArmedBandits 2.1 with `s` all arms
and weights `g t ω b = [t < K m] [T_b(t) < m] ([b = a] − [b = a⋆])`, which depend only on the
rounds before `t`, and `V = 2m` (the squared weights add up to at most `2m` on every
trajectory, because of the factor `[T_b(t) < m]`). Almost surely every arm has exactly `m` plays
before round `K m` (pigeonhole and `ae_forall_mem_of_playsIn`), and then the weighted noise is
`prefixSum a − prefixSum a⋆ + m gap(a)`. By `HasSubgaussianMGF.measure_ge_le` with
`ε = m gap(a)` the event has probability at most `exp(−m² gap(a)²/(2 c · 2m))`; a union bound
over the suboptimal arms finishes. No measurability of `ψ` is needed: the error event lies in a
finite union of measurable events. (Lattimore and Szepesvári 2020, the display after (33.9),
p. 413, with `⌊n/k⌋` plays and `c = 1`, stated there as easily controlled by their Theorem 5.3
and Lemma 5.4; proved here.)

**Checks.**

- Two Bernoulli arms `(3/4, 1/4)`, `c = 1/4`: the bound is `exp(−m/4)`. The exact probability
  of error under the worst tie-breaking, `P(S₂ ≥ S₁)` for independent binomial sums, is `1`,
  `7/16`, `7459/65536` and `116522275/4294967296` for `m = 0, 1, 4, 8`, at most `1`,
  `exp(−1/4) > 7/9`, `exp(−1) > 1/3` and `exp(−2) > 1/8`.
- Several optimal arms: `(1/2, 1/2, 0)` Bernoulli, `m = 4`: an error needs both optimal sums to
  be `0`, probability `1/256`, and the bound is `exp(−1)`.
- `m = 0`: every prefix sum is `0`, any arm may be named, and the bound is the number of
  suboptimal arms, at least `1` if there is one.
- `c = 0`: the bound is the number of suboptimal arms (`exp(−x/0) = 1`).

*Needs:* 1.1; MultiArmedBandits 1.1 (`ae_forall_mem_of_playsIn`), 2.1
(`hasSubgaussianMGF_weightedNoise`); Mathlib `HasSubgaussianMGF.measure_ge_le`,
`MeasureTheory.measure_biUnion_finset_le`.

### Examples

Bernoulli arms (`c = 1/4` by Mathlib's `hasSubgaussianMGF_of_mem_Icc`), Gaussian arms of variance
`v` (`c = v`), Dirac arms (`c = 0`).

### Dependencies

Layer 1 uses MultiArmedBandits 1.1, 1.2, 2.1 and 2.2 and Mathlib's sub-Gaussian API.

## Layer 2: sequential halving

### 2.1 The phase-by-phase bound

For `k ≥ 1` arms `Fin k` in decreasing order of mean define
`complexityH2 ν = max_i (i + 1)/gap(i)²`, where an arm of gap `0` contributes `0` (Lean's
`x/0 = 0`); this is `H₂ = max_{Δ_i > 0} i/Δ_i²` of Lattimore and Szepesvári (2020, Theorem 33.10)
with ranks from `1`, and it is `0` exactly when all arms are optimal. Prove
(`measureReal_gap_pos_le_of_isSequentialHalving`): if `k ≤ 2^L`, the bandit is `c`-sub-Gaussian
and `IsSequentialHalving L T A π ψ`, then, with `m_ℓ = halvingSize k ℓ` and
`j_ℓ = ⌈m_ℓ/4⌉ + 1`,

    P(0 < gap ν ψ) ≤ 3 Σ_{ℓ<L} exp(−T ℓ · j_ℓ/(4 c H₂)).

Several arms may be optimal and `k` need not be a power of `2`.

Proof route (proved here; the outline is Lattimore and Szepesvári 2020, Exercise 33.8, pp.
419–420, for `k = 2^L`, a unique optimal arm and `kL ∣ n`, and Karnin, Koren and Somekh 2013,
Lemmas 4.2 and 4.3). Let `O` be the set of optimal arms and `E_ℓ` the event that `A ℓ` meets `O`
and `A (ℓ+1)` does not. If `ψ` is suboptimal then `E_ℓ` holds for some `ℓ < L`, since `A 0`
contains `0 ∈ O` and `A L = {ψ}`. Fix `ℓ`, write `m = m_ℓ`, `T = T ℓ`, and let `a⋆(ω)` be the
least index in `A ℓ ω`, `Top` the `⌈m/4⌉` least indices of `A ℓ ω` and `B` the other
`m − ⌈m/4⌉` arms of `A ℓ ω`, listed as `b_1(ω), …` in increasing index; all of these depend only
on the rounds before phase `ℓ`. On `E_ℓ`, `a⋆` is optimal (an index below an optimal one is
optimal) and eliminated, so the `⌈m/2⌉` survivors are suboptimal and have phase sums at least
that of `a⋆`; at most `⌈m/4⌉ − 1` of them lie in `Top`, so the number `N` of suboptimal arms of
`B` with phase sum at least that of `a⋆` is at least `⌈m/2⌉ − ⌈m/4⌉ + 1 ≥ |B|/3` (for every
`m ≥ 2`; `E_ℓ` is empty for `m = 1`). An arm `b ∈ B` has index at least `⌈m/4⌉`, so if it is
suboptimal, `H₂ ≥ (⌈m/4⌉ + 1)/gap(b)²` and `gap(b)² ≥ j_ℓ/H₂`. For each position `r`, apply
MultiArmedBandits 2.1 to the weights that, in the rounds of phase `ℓ`, on the event that `A ℓ`
meets `O` and `b_r` is suboptimal, are `+1` at `b_r` and `−1` at `a⋆` while the arm has fewer than
`T` plays in the phase, and `0` otherwise, with `V = 2T`. Almost surely the weighted noise is the
difference of the two phase sums plus `T gap(b_r)`, which is at least `T √(j_ℓ/H₂)` when `b_r`
is counted, so `HasSubgaussianMGF.measure_ge_le` with the deterministic `ε = T √(j_ℓ/H₂)` gives
probability at most `exp(−T j_ℓ/(4cH₂))` that `b_r` is counted. Hence the expectation of `N` on
the event that `A ℓ` meets `O` is at most `|B| exp(−T j_ℓ/(4cH₂))`, and Markov's inequality
(`mul_meas_ge_le_lintegral₀`) gives `P(E_ℓ) ≤ 3 exp(−T j_ℓ/(4cH₂))`. Sum over `ℓ`. The random
arms `b_r` and `a⋆` replace the conditioning on the history before phase `ℓ` that the outline
uses; the factor `[phaseCount < T]` keeps the bound on the squared weights on every trajectory,
as 2.1 requires.

**Checks.** (Bernoulli arms, `c = 1/4`; exact probabilities of error under the worst
tie-breaking, computed by enumerating the binomial phase sums.)

- `(1, 1/2)`, `L = 1`, `T = (8)`: `H₂ = 8`, `j_0 = 2`, the bound is `3 exp(−2) > 7/18`, and the
  error is `1/256` (the second arm ties at `8` successes).
- `(1, 1/2, 1/2, 0)`, `L = 2`, `T = (12, 12)`: `H₂ = max(2·4, 3·4, 4·1) = 12`, `j = (2, 2)`, the
  bound is `6 exp(−2) > 7/9`, and the error is `16781311/68719476736`.
- Two optimal arms `(1, 1, 1/2, 0)`, `T = (2, 2)`: the error is `1/16`; with `T = (5, 5)` it is
  `1/1024`. The bound uses the suboptimal arms only.
- `T ℓ = 0` for some phase: its term is `3`, and the error can be `1` (Check of 1.2).
- `c = 0`, or all arms optimal: every term is `exp(−x/0) = 1`, and the bound is `3L`; when all
  arms are optimal the error is `0`.
- `k = 1`, `L = 0`: the sum is empty and the error is `0`.

*Needs:* 1.1, 1.2; MultiArmedBandits 1.1 (`ae_forall_mem_of_playsIn`), 2.1
(`hasSubgaussianMGF_weightedNoise`); Mathlib `HasSubgaussianMGF.measure_ge_le`,
`mul_meas_ge_le_lintegral₀`.

### 2.2 Sequential halving with an even split of the budget

Prove (`measureReal_gap_pos_le_sequentialHalving`): for `2^L` arms in decreasing order of mean, a
`c`-sub-Gaussian bandit and a budget `n` divisible by `2^L L`, if `(π, ψ)` follows the halving
schedule with `T ℓ = n/(L 2^(L−ℓ))` plays in phase `ℓ` (so every phase has `n/L` rounds and the
schedule ends at round `n`), then

    P(0 < gap ν ψ) ≤ 3 L exp(−n/(16 c L H₂)).

Route: 2.1 with `m_ℓ = 2^(L−ℓ)` and `j_ℓ ≥ m_ℓ/4`, so `T ℓ · j_ℓ ≥ n/(4L)`. (Lattimore and
Szepesvári 2020, Theorem 33.10, p. 412, for `1`-sub-Gaussian bandits, with the proof left as
Exercise 33.8; Karnin, Koren and Somekh 2013, Theorem 4.1, with constant `8` for rewards in
`[0, 1]` and floors ignored in the proof. Both state it for every `k`, with `⌈log₂ k⌉` phases; the
form proved here takes `k = 2^L` and a divisible budget, and 2.1 covers the rest.)

**Checks.**

- `(1, 1/2, 1/2, 0)` Bernoulli, `c = 1/4`, `n = 192`: `T = (24, 48)`, the bound is
  `6 exp(−2) > 7/9` and the error is `562949953421311/2^96`; at `n = 8`, `T = (1, 2)` and the
  error is `7/16` while the bound exceeds `1`.
- The divisibility cannot be replaced by floors. Two Gaussian arms of means `(1, 0)` and variance
  `c = 1/100`, `L = 1`, `n = 1`: `H₂ = 2`, the claimed bound would be `3 exp(−25/8) < 1`
  (`e^(25/8) > e³ > 3`), but `T 0 = ⌊1/2⌋ = 0`, both sums are `0`, and the tie may name the
  second arm: error `1`.
- `L = 0`: `2^0 · 0 ∣ n` forces `n = 0`, there is one arm, and both sides are `0`.
- The schedule of the Check of 1.2 (`K = 4`, `T = (1, 2)`) is this one with `L = 2` and `n = 8`:
  `T ℓ = 8/(2 · 2^(2−ℓ))` is `1, 2`, and `phaseStart 4 T 2 = 8 = n`. Each phase has twice the
  plays per arm of the one before.

*Needs:* 2.1.

### Examples

Equal gaps `Δ` for `k − 1` arms: `H₂ = k/Δ²` and the exponent is `nΔ²/(16 c k L)`, against
`⌊n/k⌋Δ²/(4c)` for uniform allocation (1.3). One small gap `Δ` and the others `1`: `H₂` is of
order `1/Δ²`, and sequential halving's exponent is larger by a factor of order `k/L`
(Lattimore and Szepesvári 2020, p. 413).

### Dependencies

Layer 2 uses 1.1, 1.2, MultiArmedBandits 1.1 and 2.1, and Mathlib.

## Layer 3: successive halving on loss sequences

### 3.1 The deterministic guarantee

Here an arm is a sequence of losses: `loss i t` is the loss of arm `i` after `t` units of
resource, and `loss i t` approaches a limit `ν i`; smaller is better. Arms are `Fin n`, `n ≥ 1`,
in any order: the theorem compares every arm with arm `0`. Listed in increasing order of limit,
as in the source, arm `0` is a best arm, the factor `i + 1` in the threshold below is the rank of
arm `i`, and the conclusion says that the named arm is within `ε/2` of the best. Let `γ : ℕ → ℝ` be
antitone, tend to `0`, and satisfy `|loss i t − ν i| ≤ γ t` for all `i`, `t`; the pointwise
least such function, the envelope of Li et al., is one. Let
`envelopeInv γ y = sInf {t | γ t < y}` be the first `t` with
`γ t < y` (strict). With `L = ⌈log₂ n⌉` (`Nat.clog 2 n`), say that sets `S : ℕ → Finset (Fin n)`
are **successive halving with budget `B`** (`IsSuccessiveHalving loss B S`) if `S 0` is all arms
and, for `j < L`, `S (j+1) ⊆ S j` has `⌈|S j|/2⌉` elements whose losses at
`r_j = ⌊B/(|S j| L)⌋` are at most those of every arm of `S j` outside `S (j+1)` (ties broken in
any way). Prove (`limit_sub_le_of_isSuccessiveHalving`): for `ε > 0`, if

    B > z = 2L · max_{1 ≤ i < n} (i + 1)(1 + envelopeInv γ (max(ε/4, (ν i − ν 0)/2)))

then every arm `i` of `S L` has `ν i − ν 0 ≤ ε/2`.

Proof route (Li et al. 2018, Appendix B.1, pp. 39–41, with the two repairs below). For
`y > 0` the set `{t | γ t < y}` is nonempty because `γ → 0`, so `γ (envelopeInv γ y) < y`, and
since `γ` is antitone, `γ t < y` for all `t ≥ envelopeInv γ y`. If `ν i − ν 0 ≥ 2y` and `t` is
that large, `loss i t − loss 0 t ≥ ν i − ν 0 − 2γ t > 0`: arm `i` is strictly worse than arm
`0`. Let `τ_i` be the inverse at `max(ε/4, (ν i − ν 0)/2)`. In round `j` with `m = |S j| ≥ 2`,
call an arm `i ≥ 1` late if `2(i + 1) ≥ m`; arm `n − 1` is late since `m ≤ n`. A late arm has
`B/(mL) > (2/m)(i + 1)(1 + τ_i) ≥ 1 + τ_i`, so `r_j ≥ τ_i`. Suppose arm `0` is in `S j` and is
discarded, so that the `⌈m/2⌉` survivors have losses at most that of arm `0` at `r_j`. If some
late arm `i` has `ν i − ν 0 < ε/2`, then `τ_i` is the inverse at `ε/4` and `r_j ≥ τ_i`, so every
arm with `ν i − ν 0 ≥ ε/2` is strictly worse than arm `0` at `r_j`: every survivor, and every
arm of the later sets, has `ν i − ν 0 < ε/2`. Otherwise every late arm is strictly worse than
arm `0` at `r_j`, and the survivors lie among the arms `i ≥ 1` with `2(i + 1) < m`, fewer than
`⌈m/2⌉`: a contradiction. Arm `0` is in `S 0`, so either it is never discarded and
`S L = {0}`, or the first case applies in the round where it is. No order of the arms is used.
(Li, Jamieson, DeSalvo, Rostamizadeh and Talwalkar 2018, Theorem 1, p. 25; Jamieson and
Talwalkar 2016, Theorem 1, p. 243, without `ε`. The antitone envelope in place of the least one,
the strict inverse, the rule `⌈|S|/2⌉` and arms in any order are this roadmap's form; the route
is proved here.)

The two repairs. The source's inverse `min {t | γ t ≤ y}` lets arm `0` tie with a worse arm, and
its proof needs the tie to go to arm `0`; with any tie-breaking the statement then fails (first
Check). The source keeps `⌊|S|/2⌋` arms for `⌈log₂ n⌉` rounds, which empties the set when `n` is
not a power of `2` (second Check); `⌈|S|/2⌉` keeps one arm at the end.

**Checks.** (Exact, in rational arithmetic.)

- Ties. `n = 2`, `ν = (0, 1)`, both losses `1/2` for `t < 5` and equal to the limits from
  `t = 5` on, so the least envelope is `1/2` before `5` and `0` after; `ε = 1`. With the
  non-strict inverse `z = 2 · 1 · 2 · (1 + 0) = 4`; at `B = 5`, `r_0 = 2`, the two losses tie,
  and the tie may keep arm `1`: `ν 1 − ν 0 = 1 > 1/2`. With the strict inverse `z = 24`, and
  every `B > 24` gives `r_0 ≥ 12 ≥ 5`, where arm `0` is strictly better.
- `⌊|S|/2⌋` for `⌈log₂ n⌉` rounds: `3 → 1 → 0`, `5 → 2 → 1 → 0`, `6 → 3 → 1 → 0`,
  `7 → 3 → 1 → 0`; `⌈|S|/2⌉` gives `3 → 2 → 1`, `5 → 3 → 2 → 1`, `6 → 3 → 2 → 1`,
  `7 → 4 → 2 → 1`.
- `γ → 0` is needed. `n = 2`, `ν = (0, 1)`, `loss 0 ≡ 1`, `loss 1 ≡ 0`, `γ ≡ 1`, `ε = 1`: every
  inverse is `sInf ∅ = 0`, `z = 4`, and at `B = 5` arm `1` is kept: `1 > 1/2`.
- The source's second conclusion, that the reported loss `loss ı̂ ⌊B/(2L)⌋` is within `ε` of
  `ν 0`, does not follow from `B > z`: `n = 2`, `ν = (0, 1)`, `loss 0 t = 2/5` for `t < 100` and
  `0` after, `loss 1 ≡ 1`, `ε = 1/10`; then `z = 4`, at `B = 5` arm `0` is named, and its loss
  at `t = 2` is `2/5 > 1/10`. It is not a target.
- `n = 1`: `L = 0`, `z = 0`, and the single arm is named.

*Needs:* Mathlib `Nat.clog`, `Nat.le_pow_clog`, `Nat.sInf_mem`.

### Examples

Learning curves `loss i t = ν i + 1/(t + 1)`: `γ t = 1/(t + 1)` and `envelopeInv γ y` is the least
`t` with `t + 1 > 1/y`.

### Dependencies

Layer 3 uses only Mathlib. It shares no object with the other layers.

## Layer 4: median elimination

### 4.1 Median elimination

Let `medianEliminationPlays c ε δ ℓ = ⌈(16 c/ε_ℓ²) log(3/δ_ℓ)⌉₊` with `ε_ℓ = (3/4)^ℓ ε/4` and
`δ_ℓ = δ/2^(ℓ+1)`. Prove (`medianElimination`): for a `c`-sub-Gaussian bandit with `c > 0`, for
`ε > 0` and `0 < δ ≤ 1`, if `(π, ψ)` follows the halving schedule with `L = ⌈log₂ K⌉` phases and
these plays, then `P(gap ν ψ > ε) ≤ δ`, and the schedule ends at round

    phaseStart K T L ≤ (256 c 2^L/ε²)(9 log(3/δ) + 81 log 2) + 2 · 2^L.

Proof route. *Phase `ℓ`* (Even-Dar, Mannor and Mansour 2006, Lemma 11, p. 1088). Let `a⋆(ω)` be
an arm of `A ℓ ω` of largest mean (least index in a fixed enumeration of `ι`) and `F_ℓ` the event
that every arm of `A (ℓ+1)` has mean below `mean ν a⋆ − ε_ℓ`. On `F_ℓ`, `a⋆` is discarded, so
the `⌈m/2⌉` survivors have phase sums at least that of `a⋆` and are bad (mean below
`mean a⋆ − ε_ℓ`). Either the phase sum of `a⋆` is below `T(mean a⋆ − ε_ℓ/2)`, or at least `⌈m/2⌉`
bad arms of `A ℓ` exceed their mean by more than `T ε_ℓ/2`. By MultiArmedBandits 2.1 (weights
`±1` on one predictable arm, capped at `T` plays, `V = T`) and
`HasSubgaussianMGF.measure_ge_le`, each such deviation has probability at most
`exp(−T ε_ℓ²/(8c)) ≤ (δ_ℓ/3)² ≤ δ_ℓ/3`, the middle step by the choice of `T`. Markov's inequality
on the number of bad arms that deviate, with `m/⌈m/2⌉ ≤ 2`, gives `P(F_ℓ) ≤ δ_ℓ/3 + 2δ_ℓ/3`.
*All phases.* Off `⋃ F_ℓ` the best mean in `A (ℓ+1)` is within `ε_ℓ` of that in `A ℓ`, so the
named arm has gap at most `Σ_{ℓ<L} ε_ℓ < ε`, and `Σ δ_ℓ < δ` (EDMM, proof of Theorem 10,
p. 1089). *The count* (EDMM, Lemma 12, pp. 1088–1089, in `O` form; the constant is computed
here). `halvingSize K ℓ ≤ 2^(L−ℓ)`, the plays are at most
`(256 c/ε²)(16/9)^ℓ(log(3/δ) + (ℓ + 1) log 2) + 1`, which is nonnegative since `δ ≤ 1`, and
`Σ_ℓ (8/9)^ℓ = 9`, `Σ_ℓ (ℓ + 1)(8/9)^ℓ = 81`, `Σ_ℓ 2^(L−ℓ) ≤ 2 · 2^L`. (Even-Dar, Mannor and
Mansour 2006, Theorem 10 with Lemmas 11 and 12, pp. 1088–1089, for rewards in `[0, 1]`, where
`c = 1/4` and the plays `⌈(4/ε_ℓ²) log(3/δ_ℓ)⌉` are theirs up to the ceiling. The variance proxy
`c`, the ceilings, the rule `⌈m/2⌉` with any tie-breaking and the explicit count are this
roadmap's form, proved here.)

The source's rule discards the arms whose phase mean is strictly below the median, until one arm
is left. When all phase means tie (for instance identical deterministic arms) no arm is
discarded and the procedure never ends; for an odd number of arms the number discarded depends
on ties. The halving schedule fixes both: `⌈m/2⌉` arms of largest phase sums are kept, ties
broken in any way.

**Checks.**

- Rewards in `[0, 1]` (`c = 1/4`), `ε = 1`, `δ = 1`: the plays per phase are `115, 283, 643`
  (`⌈64 log 6⌉`, `⌈(1024/9) log 12⌉`, `⌈(16384/81) log 24⌉`, located by rational bounds on the
  logarithms); `K = 2`, `4`, `5` end at rounds `230`, `1026`, `2710`, against bounds above `8456`,
  `16912`, `33824`. With `δ = 1/2` the plays are `160, 362, 784`.
- `c > 0` is needed: Dirac arms at `(1, 0)` are `0`-sub-Gaussian, the plays are `⌈0⌉₊ = 0`, both
  sums are `0`, the tie may name the second arm, and for `ε = δ = 1/2` the error is `1 > 1/2`.
  The same happens for `ε = 0`, where `16c/0 = 0`.
- `δ ≤ 1` is needed for the count: for `K = 2`, `c = 1/4`, `ε = 1`, `δ = 2000` the plays are `0`
  and the right side is below `−300`.
- `K = 1`: `L = 0`, the schedule uses no round, and the named arm is the only one.

*Needs:* 1.1, 1.2; MultiArmedBandits 1.1 (`ae_forall_mem_of_playsIn`), 2.1
(`hasSubgaussianMGF_weightedNoise`); Mathlib `HasSubgaussianMGF.measure_ge_le`,
`mul_meas_ge_le_lintegral₀`, `Nat.clog`, `Nat.le_pow_clog`.

### Examples

For rewards in `[0, 1]` and `K = 2^L`, the count reads `(64K/ε²)(9 log(3/δ) + 81 log 2) + 2K`.

### Dependencies

Layer 4 uses 1.1 and 1.2, MultiArmedBandits 1.1 and 2.1, and Mathlib.

## Layer 5: lower bounds by change of measure

### 5.1 Change of measure at a fixed budget

Prove (`ofReal_mul_log_le_sum_lintegral_pullCount_mul_klDiv`): for bandits `ν`, `ν'` on finitely
many arms, a policy `π`, `n : ℕ`, a measurable set `E` of histories of `n` rounds and `δ ≤ 1/2`,
if the event `Finset.restrict (range n) ω ∈ E` has probability at least `1 − δ` under `ν` and at
most `δ` under `ν'`, then

    ENNReal.ofReal ((1 − 2δ) log((1 − δ)/δ)) ≤ Σ_a E_ν[T_a(n)] · klDiv (ν a) (ν' a).

Proof route (proved here). Let `P`, `Q` be the laws of the first `n` rounds under `ν` and `ν'`,
`p = P E ≥ 1 − δ` and `q = Q E ≤ δ` (`Measure.map_apply`, `Finset.measurable_restrict`). The
right side is `klDiv P Q` by MultiArmedBandits 4.1. If `δ ≤ 0` then `q = 0` (or there is no such
event) and the left side is `0` (`log 0 = 0` at `δ = 0`). If `q = 0 < p` then `P` is not
absolutely continuous with respect to `Q`, so `klDiv P Q = ∞` (`klDiv_of_not_ac`). Otherwise
`0 < q ≤ δ ≤ 1/2 ≤ 1 − δ ≤ p` and, by MathematicalStatisticsNonparametric 1.3
(`ofReal_klBin_le_klDiv`), `klBin p q ≤ klDiv P Q`. The binary divergence `klBin x y` increases
in `x` on `[y, 1]` (derivative `log(x/y) − log((1 − x)/(1 − y)) ≥ 0`, and it is continuous at
`x = 1`) and decreases in `y` on `(0, x]` (derivative `−x/y + (1 − x)/(1 − y) ≤ 0`), so
`klBin p q ≥ klBin (1 − δ) δ = (1 − 2δ) log((1 − δ)/δ)`. (Kaufmann, Cappé and Garivier 2016,
Lemma 1, p. 7, for almost surely finite stopping times and mutually absolutely continuous arm
laws, in the form `Σ_a E_ν[N_a] KL ≥ d(P_ν(E), P_ν'(E))`; here at a fixed horizon, without
absolute continuity, and with the event probabilities bounded by `δ`.)

**Checks.**

- One Bernoulli arm, `ν = Ber(3/4)`, `ν' = Ber(1/4)`, `n = 3`, `E` = at least two successes:
  `P = 27/32`, `Q = 5/32 = δ`; the left side is `(11/16) log(27/5)` and the right side
  `3 · (1/2) log 3`; the inequality between them reads `(27/5)^11 ≤ 3^24`, that is
  `3^9 = 19683 ≤ 5^11 = 48828125`.
- `δ ≤ 1/2` is needed: with `ν = ν'` and an event of probability `1/10`, `δ = 9/10` satisfies
  both hypotheses while the right side is `0`, and the left side is
  `(−4/5) log(1/9) = (4/5) log 9 > 0`.
- `δ = 1/2`: the left side is `0`. As `δ → 0` it grows like `log(1/δ)`, the order of
  Kaufmann, Cappé and Garivier's (3).
- `ν = ν'`: the right side is `0`, and indeed no event has `P ≥ 1 − δ > δ ≥ Q` when `P = Q`.

*Needs:* MultiArmedBandits 4.1 (`klDiv_map_restrict_banditLaw`); MathematicalStatisticsNonparametric
1.3 (`ofReal_klBin_le_klDiv`, with its `klBin`); Mathlib `klDiv_of_not_ac`, `Measure.map_apply`,
`Finset.measurable_restrict`.

### 5.2 The lower bound for Gaussian bandits

Prove (`exists_le_measureReal_gap_pos_gaussianBandit`): for `K ≥ 2` arms, every policy `π`, every
`n` and every measurable recommendation `ψ` from the histories of `n` rounds, every variance
`v ≠ 0` and every `Δ > 0`, there is a mean vector `μ` with an arm `a` such that
`μ b + Δ ≤ μ a` for all `b ≠ a`, and

    exp(−2nΔ²/((K − 1)v))/4 ≤ P_{gaussianBandit μ v}(0 < gap ψ).

Proof route (proved here; the construction is that of MultiArmedBandits 4.2 and of Lattimore
and Szepesvári 2020, Theorem 15.2). Fix an arm `a₀`, let `μ` be `Δ` at `a₀` and `0` elsewhere,
choose `b ≠ a₀` minimizing `E_μ[T_b(n)]`, at most `n/(K − 1)` because the counts add up to `n`,
and let `μ'` be `μ` with `2Δ` at `b`. Both have a best arm ahead of the others by `Δ`. By
MultiArmedBandits 4.1, MathematicalStatisticsNonparametric 1.3 (`klDiv_gaussianReal`) and
`klDiv_self`, the laws `P`, `Q` of the first `n` rounds have
`klDiv P Q = E_μ[T_b(n)] (2Δ)²/(2v) ≤ 2nΔ²/((K − 1)v)`, finite. By
MathematicalStatisticsNonparametric 1.4 (`half_exp_neg_klDiv_le`),
`exp(−klDiv P Q)/2 ≤ 1 − tvDist P Q/2`. For the event `G` that `ψ` names `a₀`,
`P G ≤ Q G + tvDist P Q/2` (the bound of MathematicalStatisticsFoundations 9.2, a README item
without a Lean declaration; it is Tau Ceti's `etvDist_le_two_mul_iff` with `c = etvDist P Q/2`,
read through `tvDist = (etvDist P Q).toReal`). Hence
`P Gᶜ + Q G ≥ exp(−2nΔ²/((K − 1)v))/2`. Under `μ`, naming another arm than `a₀` is an error;
under `μ'`, naming `a₀` is. One of the two errors is at least half the sum.

**Checks.**

- `K ≥ 2` is needed: with one arm the gap is always `0`, while the left side is
  `exp(−x/0)/4 = 1/4`.
- `v ≠ 0` is needed: Dirac arms (`v = 0`), `n ≥ K`, uniform allocation with one play per arm
  never errs, while the left side is `exp(−x/0)/4 = 1/4`.
- `n = 0`: `ψ` is constant, naming some arm `a`; any `μ` whose best arm is not `a` gives error
  `1 ≥ 1/4`.
- Against 1.3 with `c = v`, uniform allocation errs with probability at most
  `(K − 1) exp(−⌊n/K⌋Δ²/(4v))` on the bandits whose gaps all equal `Δ`, and the exponents
  `⌊n/K⌋Δ²/(4v)` and `2nΔ²/((K − 1)v)` differ by a bounded factor for `n ≥ K ≥ 2`.

*Needs:* MultiArmedBandits 4.1 (`klDiv_map_restrict_banditLaw`), 4.2 (`gaussianBandit`);
MathematicalStatisticsNonparametric 1.3 (`klDiv_gaussianReal`), 1.4 (`half_exp_neg_klDiv_le`);
Tau Ceti `MeasureTheory.etvDist_le_two_mul_iff`; Mathlib `klDiv_self`, `Measure.map_apply`,
`Finset.measurable_restrict`.

### Examples

Bernoulli pairs for 5.1; the Gaussian pair `(Δ, 0, …, 0)`, `(Δ, 0, …, 2Δ, …, 0)` for 5.2.

### Dependencies

Layer 5 uses 1.1, MultiArmedBandits 4.1 and 4.2, MathematicalStatisticsNonparametric 1.3 and
1.4, Tau Ceti's total variation bound and Mathlib. It uses neither Layer 2 nor Layers 3 and 4.

## Downstream consumers

The halving schedule of 1.2 with its predictable surviving sets is the sampling condition of
any elimination scheme with a fixed number of plays per phase, and 2.1 bounds such a scheme for
every number of arms and every split of the budget. Layer 3 is the guarantee used for the
brackets of Hyperband in hyperparameter search (Li et al. 2018, §5). The change of measure of
5.1 is the first step of lower bounds for identification at a fixed confidence.

## Scope and ownership

This roadmap owns: halving schedules as conditions on a policy and a recommendation, uniform
allocation for identification, the misidentification bounds of sequential halving (phase by
phase and with an even split), median elimination with its explicit count, the deterministic
guarantee of successive halving on loss sequences, the fixed-budget change-of-measure bound for
events, and the Gaussian fixed-budget lower bound.

The bandit model is MultiArmedBandits': `Policy`, `envLaw`, `Policy.PlaysIn`, `rewardKernel`,
`banditLaw`, `mean`, `gap`, `pullCount`, `prefixSum` and `gaussianBandit` are copied verbatim
from its 1.1, 1.2, 2.2 and 4.2, and its 1.1, 2.1 and 4.1 are cited, never restated. Its scope
puts best-arm identification outside it. Its 4.1 also derives, in prose, the two-bandit
inequality `exp(−D)/2 ≤ P_ν A + P_ν' Aᶜ`; the route of 5.2 derives the same step from the
declared 4.1 and MathematicalStatisticsNonparametric 1.4 and does not state it as a target. Its
4.2 is a lower bound on the regret; 5.2 bounds the probability of naming a suboptimal arm, a
different conclusion, by the same construction. Its 3.1 bounds the regret of explore-then-commit,
whose exploration phase is uniform allocation; 1.3 bounds the probability of error of the
recommendation instead. The divergence of Gaussian laws, the binary divergence of an event and
the Bretagnolle–Huber inequality are MathematicalStatisticsNonparametric 1.3 and 1.4; the bound
of an event's probability by the total variation distance is MathematicalStatisticsFoundations
9.2, used through Tau Ceti. Sub-Gaussian variables and Hoeffding's lemma are Mathlib's.

Not treated here:

- the guarantee of Hyperband itself (Li et al. 2018, Theorem 5): its constant is given only as
  `exp(O(max(α, β)))` and its rate has unspecified polylogarithmic factors, so it has no exact
  statement; Theorem 7 hides factors in `Ω̃`, and Corollaries 3 and 9 rest on an infinite-armed
  model with its own distribution functions;
- identification at a fixed confidence with a stopping time (Lattimore and Szepesvári 2020,
  Theorems 33.5 and 33.6; Kaufmann, Cappé and Garivier 2016, Theorem 4), and the change of
  measure at a stopping time;
- the bound `d(x, 1 − x) ≥ log(1/(2.4x))` of Kaufmann, Cappé and Garivier (2016, (3)), stated
  there without proof;
- the comparison `H₂ ≤ H₁ ≤ (1 + log k) H₂` (Lattimore and Szepesvári 2020, (33.9));
- identification of the `m` best arms, infinitely many arms, simple regret;
- sequential halving with `log₂ k` phases for `k` not a power of `2` in the even-split form of
  2.2 (2.1 covers every `k` with explicit plays per phase).

The halving learner of online learning, which discards experts that err, is a different object.

## Exact supplier contracts

### From Mathlib

- `HasSubgaussianMGF` (`Mathlib/Probability/Moments/SubGaussian.lean`);
  `HasSubgaussianMGF.measure_ge_le`: for `ε ≥ 0`, `μ.real {ω | ε ≤ X ω} ≤ exp(−ε²/(2c))`;
  `hasSubgaussianMGF_of_mem_Icc`: for a probability measure and `X` almost surely in `[a, b]`,
  `X − E X` is `HasSubgaussianMGF … ((‖b − a‖₊/2)²)`.
- `mul_meas_ge_le_lintegral₀` (`Mathlib/MeasureTheory/Integral/Lebesgue/Markov.lean`): for
  `f` almost everywhere measurable, `ε · μ {x | ε ≤ f x} ≤ ∫⁻ f`;
  `MeasureTheory.measure_biUnion_finset_le`: the measure of a finite union is at most the sum.
- `klDiv` (`Mathlib/InformationTheory/KullbackLeibler/Basic.lean`); `klDiv_of_not_ac`:
  `klDiv μ ν = ∞` when `μ` is not absolutely continuous with respect to `ν`; `klDiv_self`:
  `klDiv μ μ = 0` for `μ` σ-finite.
- `MeasureTheory.Measure.map_apply` (`Mathlib/MeasureTheory/Measure/Map.lean`): for measurable `f`
  and measurable `s`, `μ.map f s = μ (f ⁻¹' s)`; `Finset.measurable_restrict`
  (`Mathlib/MeasureTheory/MeasurableSpace/Constructions.lean`).
- `Nat.clog`, `Nat.le_pow_clog` (`Mathlib/Data/Nat/Log.lean`): `x ≤ b ^ clog b x` for `1 < b`;
  `Nat.sInf_mem`: the infimum of a nonempty set of naturals belongs to it.
- `DependsOn` (`Mathlib/Logic/Function/DependsOn.lean`), `Kernel.trajMeasure`, `gaussianReal`
  and `tvDist` as used by the copied definitions and by MathematicalStatisticsNonparametric.

### From Tau Ceti

- `MeasureTheory.etvDist_le_two_mul_iff`
  (`TauCeti/MeasureTheory/Measure/TotalVariation.lean`): for finite measures of equal total
  mass, `etvDist μ ν ≤ 2c` if and only if `μ A ≤ ν A + c` for every measurable `A`.

### From TauCetiRoadmap.MultiArmedBandits

- Definitions copied verbatim: `Policy`, `envLaw`, `Policy.PlaysIn` (1.1); `rewardKernel`,
  `isMarkovKernel_rewardKernel`, `banditLaw`, `mean`, `gap`, `pullCount` (1.2); `prefixSum`
  (2.2); `gaussianBandit` (4.2).
- 1.1, `ae_forall_mem_of_playsIn`: for countable `ι` with measurable singletons, if `π` plays in
  `S` then almost surely `A_t ∈ S t ω` for every `t`.
- 2.1, `hasSubgaussianMGF_weightedNoise`: for weights `g t ω a` measurable in `ω`, depending only
  on the rounds before `t`, zero off a set `s` of arms with `c`-sub-Gaussian centred laws, and
  with `Σ_{t<n} (g t ω A_t)² ≤ V` for every `ω`, the sum `Σ_{t<n} g t ω A_t (X_t − mean ν A_t)`
  is `HasSubgaussianMGF … (c V)` under `banditLaw ν π`.
- 4.1, `klDiv_map_restrict_banditLaw`: for finitely many arms, the divergence of the laws of the
  first `n` rounds under `ν` and `ν'` is `Σ_a E_ν[T_a(n)] · klDiv (ν a) (ν' a)` in `ℝ≥0∞`.

### From TauCetiRoadmap.MathematicalStatisticsNonparametric

- 1.3, `klDiv_gaussianReal`: for `v ≠ 0`,
  `klDiv (gaussianReal a v) (gaussianReal b v) = ENNReal.ofReal ((a − b)²/(2v))`.
- 1.3, `ofReal_klBin_le_klDiv`: for probability measures and a measurable set `A`,
  `ENNReal.ofReal (klBin (P.real A) (Q.real A)) ≤ klDiv P Q`, with
  `klBin a b = a log(a/b) + (1 − a) log((1 − a)/(1 − b))`.
- 1.4, `half_exp_neg_klDiv_le` (Bretagnolle–Huber): for probability measures with
  `klDiv P Q ≠ ∞`, `exp(−(klDiv P Q).toReal)/2 ≤ 1 − tvDist P Q/2`.

### From TauCetiRoadmap.MathematicalStatisticsFoundations

- 9.2, a README item without a Lean declaration: for probability measures and a measurable set
  `A`, `|P A − Q A| ≤ tvDist P Q/2`. The route of 5.2 uses it in the two-line form derived from
  Tau Ceti's `etvDist_le_two_mul_iff` above.

## References

- E. Even-Dar, S. Mannor and Y. Mansour, *Action elimination and stopping conditions for the
  multi-armed bandit and reinforcement learning problems*, J. Mach. Learn. Res. **7** (2006),
  1079–1105.
- K. Jamieson and A. Talwalkar, *Non-stochastic best arm identification and hyperparameter
  optimization*, Proc. AISTATS 2016, PMLR **51**, 240–248; arXiv:1502.07943.
- Z. Karnin, T. Koren and O. Somekh, *Almost optimal exploration in multi-armed bandits*, Proc.
  ICML 2013, PMLR **28**(3), 1238–1246 (cited by section and theorem number).
- E. Kaufmann, O. Cappé and A. Garivier, *On the complexity of best-arm identification in
  multi-armed bandit models*, J. Mach. Learn. Res. **17** (2016), 1–42.
- T. Lattimore and Cs. Szepesvári, *Bandit algorithms*, Cambridge University Press, 2020; the
  authors' online edition at <https://tor-lattimore.com/downloads/book/book.pdf> (printed page
  numbers).
- L. Li, K. Jamieson, G. DeSalvo, A. Rostamizadeh and A. Talwalkar, *Hyperband: a novel
  bandit-based approach to hyperparameter optimization*, J. Mach. Learn. Res. **18** (2018),
  no. 185, 1–52.

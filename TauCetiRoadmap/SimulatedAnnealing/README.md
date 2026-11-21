# Roadmap: simulated annealing

**Summary.** Simulated annealing looks for a global minimum of an energy `U` on a finite set by
running a Metropolis chain whose temperature is lowered as time goes on. The chain is therefore
time-inhomogeneous, and the question is whether the cooling is slow enough for it to forget its
starting point and to follow the equilibrium laws of the temperatures it passes through. This
roadmap develops the theory that answers it on a finite state space: Dobrushin's ergodicity
coefficient of a Markov kernel, weak and strong ergodicity of products of different kernels, the
Gibbs measures `π_β ∝ exp(−βU)` at low temperature, and annealing under logarithmic cooling.
Distances between laws are total variation distances normalized to lie in `[0, 1]`.

The headline theorems are these.

- *Dobrushin's contraction.* For a Markov kernel `P` on a finite set, let `δ(P)` be the largest
  distance between two of its rows. Then `‖μP − νP‖ ≤ δ(P) ‖μ − ν‖` for all probability
  measures `μ`, `ν`, and `δ(PQ) ≤ δ(P) δ(Q)` for any two Markov kernels `P`, `Q`.
- *The block criterion.* A sequence of Markov kernels is weakly ergodic (from every starting
  time, the coefficient of the product of the kernels tends to `0`) if and only if the time axis
  can be cut into consecutive blocks for which the series of the numbers `1 − δ(block)` diverges.
- *The Isaacson–Madsen theorem.* If a weakly ergodic sequence of Markov kernels `P_k` has
  stationary probability measures `π_k` with `Σ_k ‖π_k − π_(k+1)‖ < ∞`, then the `π_k` converge
  to a law `π`, and from every starting time the law of the chain converges to `π` uniformly in
  the initial state.
- *Logarithmic cooling.* Let the proposal matrix be symmetric and stochastic, let `z` be a state
  with a proposal neighbour of strictly higher energy from which every state is reached in at
  most `r` proposal steps, and let `L` bound the increase of `U` along a single proposal. If the
  inverse temperatures are nonnegative and nondecreasing, tend to infinity, and are at most
  `log(k + 1)/c` plus a constant at time `k`, with `c ≥ rL`, then the Metropolis annealing chain
  converges, from every starting time and uniformly in the initial state, to the uniform law on
  the global minimizers of `U`; in particular the probability of being at a global minimizer
  tends to `1`.

The roadmap builds on Mathlib's Markov kernels and total variation distance.
MarkovChainMixing supplies the coefficient itself: `δ(P)` is its distance `d̄(1)` between
starting points after one step, with its range and its characterization as a supremum over
initial laws. MarkovChainsAndRenewal supplies total variation on a countable set as a sum over points, and
MathematicalStatisticsFoundations the reversibility of the Metropolis–Hastings kernel, which
makes each Gibbs measure stationary for the annealing kernel at its temperature.

Layer 1 below proves Dobrushin's contraction and submultiplicativity. Layer 2 proves the block
criterion and the Isaacson–Madsen theorem. Layer 3 studies the Gibbs measures as the inverse
temperature grows and uses no other layer. Layer 4 defines the Metropolis kernels, bounds the
coefficient of their products and proves the convergence of annealing, using Layers 1, 2 and 3.

## Conventions

- **State spaces.** `S` is a finite type with a σ-algebra in which singletons are measurable
  (`[Fintype S] [MeasurableSpace S] [MeasurableSingletonClass S]`), so every set is measurable.
  `[Nonempty S]` is assumed where a maximum over states is taken, and `[DecidableEq S]` where the
  Metropolis kernel is defined.
- **Kernels and laws.** A kernel is `κ : Kernel S S`, Markov where a statement says
  `[IsMarkovKernel κ]`. Laws are measures on `S`; the law `μκ` reached from `μ` in one step is
  `μ.bind κ`. Composition follows Mathlib: `η ∘ₖ κ` is the kernel that applies `κ` first and then
  `η`, so it is the matrix product `κη` in the row-vector convention of the sources. Stationarity
  is Mathlib's `κ.Invariant π` (`π.bind κ = π`) and reversibility is `κ.IsReversible π`.
- **Total variation.** Mathlib's `tvDist μ ν` is the total variation norm of `μ − ν` and takes
  values in `[0, 2]` on probability measures. Every statement is written with `tvDist μ ν / 2`,
  which is the distance `max_A |μ A − ν A|` of Polyanskiy–Wu. Mitra–Romeo–Sangiovanni-Vincentelli
  measure laws with the norm `Σ_x |μ{x} − ν{x}|`, which is `tvDist μ ν` itself, and put the factor
  `1/2` into their coefficient of ergodicity; their ergodicity notions and summability conditions
  do not depend on the factor.
- **Inhomogeneous chains.** A chain is a sequence `P : ℕ → Kernel S S`; `P k` moves the chain
  from time `k` to time `k + 1`. `P_(m,n)` abbreviates the `n`-step kernel from time `m` of 2.1,
  so a chain with law `μ` at time `m` has law `μ.bind P_(m,n)` at time `m + n`.
- **Energies and temperatures.** `U : S → ℝ` is an energy, `β : ℝ` an inverse temperature, and
  `argmin U` is the set `{x | ∀ y, U x ≤ U y}` of global minimizers, nonempty when `S` is. The
  uniform law on it is Mathlib's `uniformOn`. `t⁺` is `max t 0`.
- **Proposals.** A proposal is a real matrix `q : S → S → ℝ` with nonnegative entries and rows
  summing to `1`; it is symmetric when `q x y = q y x`. Its proposal graph is
  `SimpleGraph.fromRel fun x y ↦ 0 < q x y`, and distances and eccentricities in it are Mathlib's
  `SimpleGraph.edist` and `SimpleGraph.eccent`, with values in `ℕ∞` (`⊤` for a state that cannot
  be reached).
- **Junk values.** Real division by zero is `0`. The Gibbs measure 3.1 is the zero measure on an
  empty type and a probability measure otherwise. `ENNReal.ofReal` sends negative reals to `0`;
  the Metropolis kernel 4.1 applies it only to entries that are nonnegative for a proposal and
  `β ≥ 0`.

## Layer 1: Dobrushin's ergodicity coefficient

### 1.1 The coefficient

The coefficient is not a new object: `dobrushinCoeff κ`, written `δ(κ)`, is the name used here
for `tvBetweenStarts κ 1` of MarkovChainMixing 1.2, its distance `d̄(1)` between starting points
after one step. Since `κ ^ 1 = κ`, it is the maximum over pairs `(x, y)` of
`tvDist (κ x) (κ y) / 2`, for a kernel on a nonempty finite set. `Suggested.lean` copies
`tvBetweenStarts` verbatim and writes `dobrushinCoeff` as an abbreviation of it. From
MarkovChainMixing 1.2 at `t = 1`, and not proved again here: `0 ≤ δ(κ) ≤ 1` for a Markov kernel,
and `δ(κ)` is the supremum of the distance between `μκ` and `νκ` over probability measures `μ`,
`ν`. Prove, for a Markov kernel `κ`:

- `δ(κ) = 0` exactly when all rows `κ x` are equal;
- `δ(κ) = 1 − min_(x,y) Σ_z min(κ(x, {z}), κ(y, {z}))` (Mitra–Romeo–Sangiovanni-Vincentelli,
  Definition 4.2, p. 17, where both expressions are given), by the formula of the total variation
  distance on a countable set as a sum over points;
- **column minima**: `δ(κ) ≤ 1 − Σ_z min_x κ(x, {z})`, since `min(κ(x, {z}), κ(y, {z}))` is at
  least the least entry of column `z`. In particular, if every row gives mass at least `η` to one
  common state, then `δ(κ) ≤ 1 − η`.

**Checks.**

- The two-state kernel with `κ(a, {b}) = p` and `κ(b, {a}) = q`: `δ(κ) = |1 − p − q|`, which is
  `3/5` for `p = 3/10`, `q = 1/10`.
- On at least two states the identity kernel has `δ = 1` and a constant kernel `δ = 0`; on one
  state every Markov kernel has `δ = 0`. Without the factor `1/2` the identity would get `2`.
- The column-minimum bound can be far from the coefficient: on three states, the kernel whose row
  `x` is uniform on the two states other than `x` has every column minimum `0`, so the bound is
  `1`, while `δ = 1/2`.

*Needs:* MarkovChainMixing 1.2 (`tvBetweenStarts`, its range); Mathlib `tvDist`,
`tvDist_triangle`, `tvDist_comm`; MarkovChainsAndRenewal 3.5.

### 1.2 Dobrushin's contraction

Prove `tvDist_bind_le_dobrushinCoeff_mul`: for a Markov kernel `κ` on a nonempty finite set and
probability measures `μ`, `ν`,

    tvDist (μ.bind κ) (ν.bind κ) / 2 ≤ δ(κ) · (tvDist μ ν / 2).

Route: write `μ − ν = s (α − α')` with `s = tvDist μ ν / 2` and probability measures `α`, `α'`
carried by the sets where `μ > ν` and `μ < ν`; then `μκ − νκ = s (ακ − α'κ)`, and
`‖ακ − α'κ‖ ≤ Σ_(x,y) α{x} α'{y} ‖κ x − κ y‖ ≤ δ(κ)` by the triangle inequality.
(Mitra–Romeo–Sangiovanni-Vincentelli, Theorem 6.1, p. 24, for a real vector with coordinate sum
`0`, recalled there from Dobrushin; Polyanskiy–Wu, Theorem 33.4, p. 630, where the coefficient is
shown to equal the largest ratio of the two distances.)

This sharpens the supremum characterization of MarkovChainMixing 1.2, which bounds the distance
between `μκ` and `νκ` by `δ(κ)` for all initial laws: here the bound carries the factor
`‖μ − ν‖`. With `μ`, `ν` the point masses at a pair attaining the maximum, both sides equal
`δ(κ)`, so on at least two states `δ(κ)` is the least constant for which the inequality holds for
all `μ`, `ν`.

**Checks.**

- Equal total masses are needed: for a constant kernel on two states, `ν` uniform and `μ = 2ν`,
  the left side is `1/2` and the right side `0`.
- The identity kernel on two states: equality `‖μ − ν‖ = 1 · ‖μ − ν‖` for all `μ`, `ν`; no
  factor below `1` holds.

*Needs:* 1.1; Mathlib `tvDist`, `tvDist_triangle`, `Measure.bind_apply`.

### 1.3 Submultiplicativity for two kernels

Prove `dobrushinCoeff_comp_le`: for Markov kernels `κ`, `η` on a nonempty finite set,
`δ(η ∘ₖ κ) ≤ δ(κ) δ(η)`, that is `δ(κη) ≤ δ(κ) δ(η)` for the kernel that applies `κ` first.
Route: the rows of `η ∘ₖ κ` at `x` and `y` are `(κ x).bind η` and `(κ y).bind η`; apply 1.2 to `η`
with `μ = κ x`, `ν = κ y`, and bound `‖κ x − κ y‖` by `δ(κ)`. (Attributed to Dobrushin; proved
here from 1.2.) MarkovChainMixing 1.2's `d̄(s + t) ≤ d̄(s) d̄(t)` is the
case `κ^s`, `κ^t` of this statement and stays there; 1.3 is the general statement, for two
different kernels, which that roadmap does not state.

- By induction, `δ(κ_1 ⋯ κ_n) ≤ δ(κ_1) ⋯ δ(κ_n)` for any finite sequence of Markov kernels.

**Checks.**

- On two states, let `κ = η` be the lazy kernel of the Examples below with `ε = 1/2` and `ρ`
  uniform. Then `δ(κ) = δ(η) = 1/2`, and `κη` is the lazy kernel with `ε = 3/4`, so
  `δ(κη) = 1/4`: equality.
- Strict inequality: on three states, let `κ` fix `x₁` and `x₂` and send `x₃` to `x₂`, and let
  `η` send `x₁` and `x₂` to `x₃` and `x₃` to `x₁` (deterministic kernels). Then `δ(κ) = δ(η) = 1`,
  while every row of `κη` is the point mass at `x₃`, so `δ(κη) = 0`.

*Needs:* 1.2; Mathlib `Kernel.comp_apply`.

### Examples

On at least two states, the lazy kernel whose row at `x` is `(1 − ε) δ_x + ε ρ`, for
`0 ≤ ε ≤ 1` and a probability measure `ρ`, has `δ = 1 − ε`: any two distinct rows differ by
`(1 − ε)(δ_x − δ_y)`. Every column `z` has least entry `ε ρ{z}`, so the column-minimum bound is
`1 − ε` as well, and it is attained.

### Dependencies

Layer 1 uses MarkovChainMixing 1.2 (the distance `d̄(1)`, with its range and its supremum
characterization), Mathlib's `tvDist` with its triangle inequality, Mathlib's composition of
kernels, and MarkovChainsAndRenewal 3.5.

## Layer 2: inhomogeneous chains, weak and strong ergodicity

### 2.1 Products of kernels

Define `inhomProd P m n`, written `P_(m,n)`, recursively: `P_(m,0)` is the identity kernel and
`P_(m,n+1) = P (m + n) ∘ₖ P_(m,n)`, the kernel that applies `P m`, then `P (m + 1)`, up to
`P (m + n)`. Prove:

- each `P_(m,n)` is Markov when every `P k` is;
- `P_(m,n+n') = P_(m+n,n') ∘ₖ P_(m,n)` (Chapman–Kolmogorov), by `Kernel.comp_assoc`;
- for a constant sequence `P k = κ`, `P_(m,n) = κ ^ n`;
- `n ↦ δ(P_(m,n))` is nonincreasing, by 1.3 and `δ ≤ 1`.

**Checks.**

- `P_(m,1) = P m` and `P_(m,2) = P (m + 1) ∘ₖ P m`: on two states with `P 0` the constant kernel
  at `a` and `P 1` the exchange of `a` and `b`, `P_(0,2)` is the constant kernel at `b`; with the
  composition in the other order it would be the constant kernel at `a`.

*Needs:* Mathlib `Kernel.id`, `Kernel.comp`, `Kernel.comp_assoc`, `Kernel.id_comp`; 1.3.

### 2.2 Weak ergodicity and the block criterion

Define `IsWeaklyErgodic P`: for every `m`, `δ(P_(m,n)) → 0` as `n → ∞`
(Mitra–Romeo–Sangiovanni-Vincentelli, Definition 4.1, p. 16, where the definition takes the
supremum of the distance over pairs of initial laws; by 1.2 and the point masses that supremum,
measured with `tvDist / 2`, is `δ(P_(m,n))`). Prove `isWeaklyErgodic_iff_exists_strictMono`: for
a sequence of Markov kernels,

    IsWeaklyErgodic P ↔ ∃ k strictly increasing, Σ_j (1 − δ(P_(k j, k (j+1) − k j))) = ∞,

the divergence written as `¬ Summable` of the nonnegative terms
(Mitra–Romeo–Sangiovanni-Vincentelli, Theorem 4.1, p. 17, recalled from Seneta and
Isaacson–Madsen).

Route: if the series diverges, then for `m ≤ k J` and `m + n ≥ k J'`,
`δ(P_(m,n)) ≤ Π_(J ≤ j < J') δ_j ≤ exp(−Σ_(J ≤ j < J') (1 − δ_j))` by 1.3, 2.1 and
`1 − t ≤ exp(−t)`, where `δ_j` is the coefficient of block `j`, and the right side tends to `0`.
Conversely, weak ergodicity from each time `k j` gives `k (j+1)` with block coefficient at most
`1/2`, so each term is at least `1/2`.

**Checks.**

- Weak ergodicity is asked from every starting time: on two states let `P k` be the lazy kernel
  of the Examples of Layer 1 with `ε = ε_k` and `ρ` uniform, where `ε_k = 1/(k + 1)²`. Then
  `δ(P_(m,n)) = Π_(m ≤ k < m+n) (1 − ε_k)`, which is `0` for `m = 0` (as `ε_0 = 1`) but tends
  to `1/2` for `m = 1`; the chain is not weakly ergodic. With `ε_k = 1/(k + 1)` it is, since
  `δ(P_(m,n)) = m/(m + n)` for `m ≥ 1`.
- The identity kernels on two states are not weakly ergodic: every block coefficient is `1` and
  every term of the series is `0`.

*Needs:* 1.2, 1.3, 2.1; Mathlib `Real.add_one_le_exp`.

### 2.3 Strong ergodicity and the Isaacson–Madsen theorem

Define `IsStronglyErgodic P π`: `π` is a probability measure and, for every `m`,
`max_x tvDist (P_(m,n) x) π / 2 → 0` as `n → ∞`
(Mitra–Romeo–Sangiovanni-Vincentelli, Definition 4.3, pp. 17–18, with the supremum over initial
laws; by convexity of the distance in the initial law it is the maximum over initial states).
Prove:

- a strongly ergodic chain is weakly ergodic, by the triangle inequality through `π`, and its
  limit is unique;
- `exists_isStronglyErgodic_of_summable` (the Isaacson–Madsen theorem): let every `P k` be
  Markov, let `P` be weakly ergodic, and let `π k` be probability measures with
  `(P k).Invariant (π k)` and `Σ_k tvDist (π k) (π (k + 1)) < ∞`. Then there is a measure `π'`
  with `tvDist (π k) π' → 0` and `IsStronglyErgodic P π'`, so `π'` is a probability measure
  (Mitra–Romeo–Sangiovanni-Vincentelli, Theorem 4.2, p. 18, recalled from Madsen and Isaacson).

Route: the `π k` form a Cauchy sequence for the total variation distance, so they converge to
some `π'`. For `m ≤ j < n`, telescope with stationarity:
`π_j P_(j,n−j) − π_(n−1) = Σ_(j ≤ i ≤ n−2) (π_i − π_(i+1)) P_(i+1,n−1−i)`, and Markov kernels do not
increase the distance (1.2 with `δ ≤ 1`). Then split
`‖P_(m,n−m) x − π'‖ ≤ ‖(P_(m,j−m) x − π_j) P_(j,n−j)‖ + ‖π_j P_(j,n−j) − π_(n−1)‖ + ‖π_(n−1) − π'‖`:
the first term is at most `δ(P_(j,n−j))`, which tends to `0` as `n → ∞` for fixed `j`, the second
at most the tail `Σ_(i ≥ j) ‖π_i − π_(i+1)‖`, and the third tends to `0`.

**Checks.**

- The summability is needed: on two states let `P k` be the constant kernel at `a` for even `k`
  and at `b` for odd `k`. Every `δ(P k)` is `0`, so the chain is weakly ergodic; `π k` is the
  point mass at `a` or `b`, consecutive distances are `1`, and the law of the chain alternates
  between the two point masses, so it is not strongly ergodic.
- Weak ergodicity is needed: the identity kernels with `π k` a fixed point mass satisfy the other
  hypotheses (the distances are `0`), but the chain started elsewhere never moves.
- The homogeneous case: for the two-state kernel of 1.1 with `p = 3/10`, `q = 1/10`, the kernel is
  constant in time, `δ(κ ^ n) = (3/5)^n → 0`, and the theorem gives strong ergodicity with limit
  the stationary law `(1/4, 3/4)`.

*Needs:* 1.2, 1.3, 2.1, 2.2; Mathlib `Kernel.Invariant`, `tvDist_triangle`, `tvDist_comm`.

### Examples

The lazy kernels of the first Check of 2.2 with `ε_k = 1/(k + 1)` all have the uniform law as
stationary law; with a constant `π k` the series of distances vanishes, and 2.3 gives strong
ergodicity with uniform limit.

### Dependencies

Layer 2 uses Layer 1 (1.2 and 1.3), Mathlib's kernel composition and invariance, and
`Real.add_one_le_exp`.

## Layer 3: Gibbs measures at low temperature

### 3.1 Gibbs measures

Define `gibbs U β`, written `π_β`, for an energy `U` on a finite set, as the measure giving mass
`exp(−β U x) / Σ_y exp(−β U y)` to each point `x`. It is Mathlib's exponential tilt of the
counting measure, `Measure.count.tilted (fun x ↦ −(β * U x))`; prove that identification. Two
facts then come from the library and are not targets: `π_β` is a probability measure when `S` is
nonempty (`isProbabilityMeasure_tilted`), and `π_0` is the uniform law (`tilted_const'`). Prove:

- `π_β` does not change when a constant is added to `U`;
- `dπ_β{x}/dβ = π_β{x} (Σ_y π_β{y} U y − U x)`, so `|dπ_β{x}/dβ| ≤ max U − min U`
  (Mitra–Romeo–Sangiovanni-Vincentelli, equation (3.8), p. 12, in the temperature `T = 1/β`).

**Checks.**

- `U = (0, 1)` on two states: `π_β = (1, e^(−β)) / (1 + e^(−β))`; at `β = 1` the masses are about
  `0.731` and `0.269`.
- The sign: with `exp(+βU)` in place of `exp(−βU)` the masses would concentrate on the maximizers
  as `β → ∞`; with the definition above they do so as `β → −∞`.

*Needs:* Mathlib `Measure.dirac`, `Real.exp`, `Measure.tilted`, `isProbabilityMeasure_tilted`,
`tilted_const'`.

### 3.2 Concentration on the global minimizers

Prove `tendsto_tvDist_gibbs_uniformOn`: on a nonempty finite set,
`tvDist π_β (uniformOn (argmin U)) → 0` as `β → ∞` (Mitra–Romeo–Sangiovanni-Vincentelli,
Proposition 3.2, pp. 10–11, where the proof is omitted). Route: pointwise, this is Tau Ceti's
`Matrix.IsHermitian.tendsto_trace_exp_neg_smul_mul_div` for the diagonal matrix with entries
`U x` and the matrix unit at `(x, x)`, whose least eigenvalue is `min U` with spectral projection
the indicator of `argmin U`; directly, dividing numerator and denominator by `exp(−β min U)`
leaves terms `exp(−β (U y − min U))` that tend to `1` on `argmin U` and to `0` off it. On a finite
set pointwise convergence gives convergence in total variation.

**Checks.**

- Ties: for `U = (0, 0, 1)` the limit gives mass `1/2` to each of the first two states, and
  `tvDist π_β (uniformOn (argmin U)) / 2 = e^(−β)/(2 + e^(−β))`, which is `1/5` at `β = log 2`.
  The point mass at one minimizer is not the limit.

*Needs:* 3.1; Mathlib `uniformOn`; MarkovChainsAndRenewal 3.5; Tau Ceti
`Matrix.IsHermitian.tendsto_trace_exp_neg_smul_mul_div` (or the direct route).

### 3.3 Monotonicity and summable variation

Prove:

- for `x ∈ argmin U`, `β ↦ π_β{x}` is nondecreasing on all of `ℝ`, since `1/π_β{x}` is a sum of
  terms `exp(−β (U y − U x))` with `U y − U x ≥ 0`;
- for `x ∉ argmin U`, there is `β_x` such that `β ↦ π_β{x}` is nonincreasing on `[β_x, ∞)`,
  because the derivative of 3.1 has the sign of `Σ_y π_β{y} U y − U x`, which tends to
  `min U − U x < 0` (Mitra–Romeo–Sangiovanni-Vincentelli, Proposition 3.3, pp. 11–12);
- `summable_tvDist_gibbs`: for every nondecreasing real sequence `β k`, the series
  `Σ_k tvDist π_(β k) π_(β (k+1))` converges (Mitra–Romeo–Sangiovanni-Vincentelli, Proposition
  5.1, p. 22, for temperatures decreasing to `0`). Route: let `β_*` be the largest of the `β_x`
  for `x ∉ argmin U` (any real if `U` is constant). Below `β_*` the masses are
  Lipschitz in `β` by 3.1, so the steps with `β (k+1) ≤ β_*` contribute at most
  `|S| (max U − min U) max(β_* − β 0, 0)`; at most one step crosses `β_*`, contributing at most
  `2`; above `β_*` every mass is monotone, so the remaining sum telescopes and is at most `|S|`.

**Checks.**

- A mass need not be monotone from `β = 0`: for `U = (0, 1, 5)` the mass of the middle state is
  `1/3` at `β = 0`, about `0.377` at `β = 0.3` and about `0.268` at `β = 1`; it increases at
  first because `U x = 1` is below the mean energy `2` of `π_0`.
- Monotonicity of the sequence is needed: for `U = (0, 1)` and `β k` alternating between `0` and
  `1`, every term equals `2 (1/2 − 1/(1 + e)) ≈ 0.462`, and the series diverges.

*Needs:* 3.1; Mathlib `monotoneOn_of_deriv_nonneg`, `antitoneOn_of_deriv_nonpos`;
MarkovChainsAndRenewal 3.5.

### Examples

For two states with `U = (0, Δ)` and `Δ > 0`, `π_β{a} = 1/(1 + e^(−βΔ))` is increasing in `β`,
`tvDist π_β π_β' = 2 |π_β{a} − π_β'{a}|`, and the series of 3.3 along any nondecreasing sequence
telescopes to at most `2 (1 − π_(β 0){a})`.

### Dependencies

Layer 3 uses no other layer. It uses Mathlib's `uniformOn` and calculus, MarkovChainsAndRenewal
3.5, and, for the route of 3.2, Tau Ceti's zero-temperature limit.

## Layer 4: Metropolis kernels and logarithmic cooling

### 4.1 The Metropolis kernel

Define `metropolis q U β` for a proposal `q`, an energy `U` and an inverse temperature `β` on a
finite set: from `x` it moves to `y ≠ x` with probability `q x y · exp(−β (U y − U x)⁺)` and stays
at `x` with the remaining probability `1 − Σ_(w ≠ x) q x w · exp(−β (U w − U x)⁺)`. Prove, for a
proposal `q` and `β ≥ 0`:

- it is a Markov kernel, the probability of staying at `x` being at least `q x x ≥ 0`;
- for symmetric `q` it is the Metropolis–Hastings kernel of MathematicalStatisticsFoundations
  9.4 for the positive weights `exp(−β U x)`, whose acceptance `min 1 (exp(−β U y)/exp(−β U x))`
  is `exp(−β (U y − U x)⁺)`; so it is reversible with respect to `π_β`, and `π_β` is stationary
  by `Kernel.IsReversible.invariant` (Mitra–Romeo–Sangiovanni-Vincentelli, Proposition 3.1,
  pp. 9–10, for their weighted proposals);
- at `β = 0` it is the proposal itself.

**Checks.**

- Two states, `q` the exchange, `U = (0, 1)`: the kernel has rows `(1 − e^(−β), e^(−β))` and
  `(1, 0)`, and detailed balance reads `π_β{a} e^(−β) = π_β{b} · 1` with
  `π_β = (1, e^(−β))/(1 + e^(−β))`.
- Symmetry is used: for the nonsymmetric proposal with rows `(0, 1)` and `(1/2, 1/2)` and
  `U = 0`, the kernel is the proposal itself, whose stationary law `(1/3, 2/3)` is not
  `π_β = (1/2, 1/2)`.

*Needs:* 3.1; MathematicalStatisticsFoundations 9.4; Mathlib `Kernel.ofFunOfCountable`,
`Kernel.IsReversible.invariant`.

### 4.2 The coefficient of a block of Metropolis kernels

Let `q` be a symmetric proposal, `a` its least positive entry, and `z`, `y₀` states with
`q z y₀ > 0` and `Δ = U y₀ − U z > 0` (so `z` is not a local maximum of `U` for the proposal
graph). Let `r ≥ 1` bound the eccentricity of `z` in the proposal graph and let `L` bound
`U y − U x` over the pairs with `q x y > 0`. Prove: for inverse temperatures
`0 ≤ β_lo ≤ β_1, …, β_r ≤ β_hi`, every entry in column `z` of the product of the `r` kernels
`metropolis q U β_i` is at least `m^r exp(−β_hi r L)` with `m = min(a, q z y₀ (1 − exp(−β_lo Δ)))`,
and hence, by the column-minimum bound of 1.1,

    δ(product) ≤ 1 − m^r exp(−β_hi r L).

Route: from `x`, follow a shortest proposal path to `z`, of length `d ≤ r`; each step has
probability at least `a exp(−β_hi L)`. Then stay at `z` for the remaining `r − d` steps; the
probability of staying is at least `q z y₀ (1 − exp(−β_i Δ))`, the part of the proposal of `y₀`
that is rejected. (Mitra–Romeo–Sangiovanni-Vincentelli, (5.1)–(5.8), pp. 19–20, for weighted
proposals and the centre minimizing the eccentricity; proved here in this form.)

**Checks.**

- The three-state path `a – m – b` with `q a a = q b b = 1/2`, `q a m = q m a = q m b = q b m = 1/2`,
  `q m m = 0` and `U = (0, 2, 1)` at `(a, m, b)`: the centre `m` is a local maximum and is not
  admissible; `a` and `b` are, with eccentricity `2`, and `L = 2`, so `r L = 4`.
- On random symmetric proposals of up to five states and random temperatures in a window the
  bound holds for `r` equal to the eccentricity and one more.

*Needs:* 1.1, 4.1; Mathlib `SimpleGraph.fromRel`, `SimpleGraph.eccent`,
`SimpleGraph.edist_le_eccent`, `SimpleGraph.exists_walk_of_edist_eq_coe`.

### 4.3 Convergence under logarithmic cooling

Let `q` be a symmetric proposal on a nonempty finite set, `U` an energy, `z`, `y₀` states with
`q z y₀ > 0` and `U z < U y₀`, `r` a natural number with `eccent z ≤ r` in the proposal graph,
`L` a real with `U y − U x ≤ L` whenever `q x y > 0`, and `c`, `b` reals with `r L ≤ c`. Let the
inverse temperatures `β k` be nondecreasing with `β 0 ≥ 0`, tend to `∞`, and satisfy
`β k ≤ log(k + 1)/c + b` for every `k`. Prove:

- `isStronglyErgodic_metropolis`: the chain `P k = metropolis q U (β k)` is strongly ergodic with
  limit `uniformOn (argmin U)`;
- `tendsto_measureReal_argmin_metropolis`: for every initial probability measure `μ`, the
  probability `(μ.bind P_(0,n)) (argmin U)` tends to `1`.

The hypotheses force `r ≥ 1` (as `y₀ ≠ z` is a neighbour of `z`) and `L ≥ U y₀ − U z > 0`, hence
`c > 0`. The schedule `β k = log(k + k₀ + 1)/c` with `k₀ ≥ 1` of the source is the case
`b = log(k₀ + 1)/c`.

Route: by 4.2 with blocks `[j r, (j + 1) r)` and `β_hi = β ((j + 1) r − 1)`, from the block where
`β ≥ 1` on, `1 − δ(block j) ≥ m^r e^(−r L b) ((j + 1) r)^(−rL/c) ≥ m^r e^(−r L b) / ((j + 1) r)`,
whose series diverges because `r L/c ≤ 1`; so the chain is weakly ergodic by 2.2. The laws
`π_(β k)` are stationary for `P k` by 4.1, the series of their distances converges by 3.3, and
they converge to `uniformOn (argmin U)` by 3.2; 2.3 gives strong ergodicity with that limit. The
second statement follows, since `uniformOn (argmin U)` gives `argmin U` mass `1`.
(Mitra–Romeo–Sangiovanni-Vincentelli, Theorem 5.1, p. 21, and Theorem 5.2, p. 23, for the schedule
`T_k = γ/log(k + k₀ + 1)` with `γ ≥ rL` and their weighted proposals without self-proposals;
proved here in this form.)

**Checks.**

- Some lower bound on `c` is needed: in the three-state example of 4.2 with
  `β k = log(k + 2)/c` and `c = 1/2`, the chain started at `b` stays at `b` forever with
  probability `Π_(k ≥ 0) (1 − (1/2)(k + 2)^(−2)) = 2√2 sin(π/√2)/π ≈ 0.716`, so the probability of
  being at `a` stays below `0.29`; numerically it settles near `0.149`.
- The condition `c ≥ rL` is sufficient, not necessary: by Hajek's theorem, outside the scope,
  the same example converges for every `c ≥ 1`, the depth `U m − U b` of the local minimum `b`.
  Numerically, the probability of being at `a`, started at `b`, is about `0.83` at time `10³`
  and `0.94` at time `10⁵` for `c = 4`, and about `0.79` and `0.93` for `c = 1`.
- `β 0 ≥ 0` is needed: for the exchange proposal on two states with `U = (0, 1)` and `β 0 < 0`,
  the row at the minimizer proposes the other state with weight `e^(−β 0) > 1`, so
  `metropolis q U (β 0)` is not a Markov kernel. In this example no row of a Metropolis kernel
  has total mass below `1`, so the law at time `n` from time `0`, started at the minimizer, has
  total mass at least `e^(−β 0) > 1` and does not converge to a probability measure.
- The centre hypothesis is needed: for the exchange proposal on two states and constant `U`, no
  state has a neighbour of higher energy; the Metropolis kernel is the exchange at every `β`, and
  the chain is not strongly ergodic, although every other hypothesis holds with `r = 1`, `L = 0`
  and any `c > 0` and `b ≥ 0`.
- `β → ∞` is needed: with `β k = 0` for all `k` the chain of the three-state example is
  homogeneous with kernel `q`, and it converges to the uniform law on the three states, not to
  the point mass at `a`.

*Needs:* 2.2, 2.3, 3.2, 3.3, 4.1, 4.2; Mathlib `Real.not_summable_one_div_natCast`, `uniformOn`.

### Examples

For the three-state example of 4.2, any schedule `β k = log(k + 2)/c` with `c ≥ 4` satisfies the
hypotheses of 4.3 with `z = a`, `y₀ = m`, `r = 2`, `L = 2` and `b = log 2/c`.

### Dependencies

Layer 4 uses Layer 1 (the column-minimum bound of 1.1), Layer 2 (2.2 and 2.3) and Layer 3 (3.2
and 3.3), MathematicalStatisticsFoundations 9.4, and Mathlib's simple graphs, kernels and the
divergence of the harmonic series.

## Scope and ownership

Dobrushin's coefficient is MarkovChainMixing 1.2's `d̄(1)`, and that roadmap owns it, with its
range, its characterization as a supremum over initial laws and its submultiplicativity along the
powers of one kernel. This roadmap depends on it and owns what it does not state: the formula of
the coefficient through row overlaps and its bound by column minima (1.1), the contraction of the
distance of two arbitrary initial laws by the factor `δ(κ)` (1.2), and the submultiplicativity for
two different kernels (1.3). It also owns products of kernels of an inhomogeneous chain, weak and strong ergodicity with
the block criterion and the Isaacson–Madsen theorem, Gibbs measures on a finite set with their
concentration, monotonicity and summable variation, the Metropolis kernel of an energy, the block
bound of 4.2 and the convergence of annealing under logarithmic cooling.

Already in the libraries or on main, and therefore not targets:

- the total variation distance, kernels, their composition, invariance, reversibility and the
  implication from reversibility to invariance (Mathlib);
- the zero-temperature limit of the Gibbs state of a Hermitian matrix (Tau Ceti), of which the
  pointwise form of 3.2 is the diagonal case;
- the formula of the total variation distance on a countable set as a sum over points
  (MarkovChainsAndRenewal 3.5);
- the reversibility of the Metropolis–Hastings kernel (MathematicalStatisticsFoundations 9.4); 4.1
  only identifies the Metropolis kernel with it.

Statements of other roadmaps that border this one:

- MarkovChainMixing, section 1.2, is a supplier, as said above. Its section 6.1 (Glauber dynamics)
  is not used.
- HiddenMarkovModels, section 6.1, states the contraction
  `‖νK − ν'K‖ ≤ (1 − ε) ‖ν − ν'‖` under a minorization `ε ρ ≤ K(s, ·)` on countable spaces. This
  roadmap states only the bound of the coefficient by column minima (1.1), which with 1.2 gives
  that contraction on finite spaces; it does not state the minorization contraction, and does not
  depend on that roadmap.

Outside the scope: Hajek's necessary and sufficient condition for convergence, that the constant
`c` be at least the depth of the deepest local minimum that is not global; rates of convergence
and finite-time bounds; continuous state spaces and diffusions; annealing with the Gibbs sampler
for Markov random fields; weighted proposals; mixing times of homogeneous chains; and every
algorithm and implementation.

## Exact supplier contracts

### From Mathlib

- `Mathlib/MeasureTheory/Measure/TotalVariation/Defs.lean`: `MeasureTheory.tvDist` (the total
  variation norm of `μ − ν`, in `[0, 2]` on probability measures), `tvDist_triangle` (for a finite
  middle measure), `tvDist_comm`.
- `Mathlib/Probability/Kernel/Basic.lean`: `Kernel.ofFunOfCountable` (a kernel from any function
  on a countable space with measurable singletons), `Kernel.id`.
  `Mathlib/Probability/Kernel/Composition/Comp.lean`: `Kernel.comp` (`η ∘ₖ κ`, applying `κ`
  first), `Kernel.comp_apply` (`(η ∘ₖ κ) a = (κ a).bind η`), `Kernel.comp_assoc`,
  `Kernel.id_comp`. `Mathlib/MeasureTheory/Measure/GiryMonad.lean`: `Measure.bind`,
  `Measure.bind_apply`.
- `Mathlib/Probability/Kernel/Invariance.lean`: `Kernel.Invariant` (`μ.bind κ = μ`),
  `Kernel.IsReversible` (detailed balance on measurable sets), `Kernel.IsReversible.invariant`
  (for a Markov kernel, reversibility implies invariance).
- `Mathlib/Probability/UniformOn.lean`: `uniformOn` (the counting measure conditioned on a set; a
  probability measure for a finite nonempty set).
- `Mathlib/Combinatorics/SimpleGraph/Basic.lean`: `SimpleGraph.fromRel` (adjacency `x ≠ y` and the
  relation in one of the two directions). `Mathlib/Combinatorics/SimpleGraph/Metric.lean`:
  `SimpleGraph.edist`, `SimpleGraph.exists_walk_of_edist_eq_coe` (a distance `k` is the length of
  a walk). `Mathlib/Combinatorics/SimpleGraph/Diam.lean`: `SimpleGraph.eccent` (the supremum of
  `edist` from a vertex, in `ℕ∞`), `SimpleGraph.edist_le_eccent`.
- `Mathlib/Analysis/Complex/Exponential.lean`: `Real.add_one_le_exp` (`x + 1 ≤ exp x`).
  `Mathlib/Analysis/PSeries.lean`: `Real.not_summable_one_div_natCast` (the harmonic series
  diverges). `Mathlib/Analysis/Calculus/Deriv/MeanValue.lean`: `monotoneOn_of_deriv_nonneg`,
  `antitoneOn_of_deriv_nonpos` (monotonicity from the sign of the derivative on a convex set).

- `Mathlib/MeasureTheory/Measure/Tilted.lean`: `MeasureTheory.Measure.tilted` (`μ.tilted f` is
  `μ` with density `exp (f x) / ∫ exp f ∂μ`), `isProbabilityMeasure_tilted` (a probability measure
  when `μ ≠ 0` and `exp ∘ f` is integrable), `tilted_const'` (the tilt by a constant is
  `(μ univ)⁻¹ • μ`). Used in 3.1.

### From Tau Ceti

- `TauCeti/Analysis/Matrix/Exponential/ZeroTemperature.lean`:
  `Matrix.IsHermitian.tendsto_trace_exp_neg_smul_mul_div` (for a Hermitian matrix `K` and any
  matrix `x`, `Tr(exp(−βK) x)/Tr(exp(−βK)) → Tr(P₀ x)/Tr P₀` as `β → ∞`, where `P₀` is the
  spectral projection at the least eigenvalue), used in the route of 3.2.

### From TauCetiRoadmap.MarkovChainMixing

- 1.2: `tvBetweenStarts κ t`, the maximum over pairs `(x, y)` of
  `tvDist ((κ ^ t) x) ((κ ^ t) y) / 2`, copied verbatim; for a Markov kernel it lies in `[0, 1]`
  and is the supremum of the distance between `κ^t ∘ μ` and `κ^t ∘ ν` over probability measures
  `μ`, `ν`. Used at `t = 1` as Dobrushin's coefficient, throughout.

### From TauCetiRoadmap.MarkovChainsAndRenewal

- Layer 3, item 5 (cited as 3.5): on a countable space,
  `tvDist μ μ' = Σ_y |μ{y} − μ'{y}|`. Used in 1.1, 3.2 and 3.3.

### From TauCetiRoadmap.MathematicalStatisticsFoundations

- 9.4: on a finite state space, for positive weights `π` and a nonnegative proposal with rows
  summing to `1`, the Metropolis–Hastings kernel (acceptance `min 1 (π y q y x/(π x q x y))`) is
  Markov and reversible for the weight measure `Σ_x π x • δ_x`. Used in 4.1, with the weights
  `exp(−β U x)` and a symmetric proposal; reversibility for the weight measure gives reversibility
  for `π_β`, its normalization.

## References

- Debasis Mitra, Fabio Romeo and Alberto Sangiovanni-Vincentelli, *Convergence and finite-time
  behavior of simulated annealing*, Memorandum UCB/ERL M85/23, Electronics Research Laboratory,
  University of California, Berkeley, 20 March 1985 (open on the department's technical report
  pages); published in Advances in Applied Probability 18 (1986), 747–771. The definition,
  theorem, proposition, equation and page numbers above are those of the memorandum.
- Yury Polyanskiy and Yihong Wu, *Information Theory: From Coding to Learning*, prepublication
  version of 16 August 2024 (open on the first author's pages); Cambridge University Press, 2025.
  Theorem 33.4, p. 630, of that version.
- Attributions made in prose without a locator: R. L. Dobrushin (the coefficient and the
  contraction, 1956); E. Seneta, *Non-negative Matrices and Markov Chains*, and D. L. Isaacson and
  R. W. Madsen, *Markov Chains: Theory and Applications* (1976), for the block criterion and the
  theorem on strong ergodicity; S. Kirkpatrick, C. D. Gelatt and M. P. Vecchi (simulated
  annealing, 1983); S. Geman and D. Geman (logarithmic cooling for the Gibbs sampler, 1984);
  B. Hajek (the necessary and sufficient condition on the constant, 1988).

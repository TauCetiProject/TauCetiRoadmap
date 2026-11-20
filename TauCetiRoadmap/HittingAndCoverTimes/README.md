# Roadmap: hitting and cover times of finite markov chains

**Summary.** This roadmap develops the mean hitting times and mean cover times of a Markov chain
on a finite state space. For a set `A` of states, `τ_A` is the first time `n ≥ 0` at which the
chain is in `A`, and `E_x τ_A` its mean for the chain started at `x`; the cover time of `A` is the
first time by which every state of `A` has been visited. Means are taken in `[0, ∞]`, so a time
that is infinite with positive probability has infinite mean. The chain need not be irreducible
unless a statement says so; where it is, `π` denotes its stationary law and `Z = (I − P + Π)⁻¹ − Π`
its fundamental matrix, `Π` being the matrix all of whose rows are `π`. Every target is a theorem
about expectations of stopping times of a chain.

The headline theorems are these.

- *The linear equations.* `x ↦ E_x τ_A` is the least solution in `[0, ∞]` of the first-step
  equations `h = 0` on `A` and `h(x) = 1 + Σ_y P(x, y) h(y)` off `A`; if `A` is reachable from
  every state, it is finite and is the unique real solution. On a connected electrical network,
  `E_a τ_z = Σ_x c(x) v(x)`, where `v` is the voltage of the unit current from `a` to `z`.
- *The mean hitting time formula.* For an irreducible chain, periodic or not,
  `π(y) E_x τ_y = Z(y, y) − Z(x, y)` and `π(x) E_π τ_x = Z(x, x)`. Hence the target time
  `Σ_y π(y) E_x τ_y` equals the trace of `Z` for every starting state (the random target lemma),
  and an irreducible reversible chain satisfies the cycle identity
  `E_a τ_b + E_b τ_c + E_c τ_a = E_a τ_c + E_c τ_b + E_b τ_a`.
- *Hitting bounds mixing.* For a chain reversible with respect to `π` with `P(x, x) ≥ 1/2` at
  every state, the total variation mixing time satisfies `t_mix(1/4) ≤ 2 max_x E_π τ_x + 1`.
- *Matthews' bounds.* On `n` states, from every starting state,
  `E_x τ_cov ≤ (max_{a, b} E_a τ_b)(1 + 1/2 + ⋯ + 1/(n − 1))`, and for every set `A` of states,
  the mean cover time of `A` is at least `(min_{a ≠ b in A} E_a τ_b)(1 + 1/2 + ⋯ + 1/(|A| − 1))`.

The roadmap builds on Mathlib's hitting times of processes and harmonic numbers, and on Tau Ceti's
path law of a Markov chain with its Markov and strong Markov properties. MarkovChainsAndRenewal
supplies Kac's formula for mean return times; ElectricalNetworksAndRandomWalks supplies networks
and voltages, and its commute time identity is quoted here, not restated; MCMCAsymptoticVariance
supplies the fundamental matrix and its identities; MarkovChainMixing supplies the mixing time and
the spectral decomposition of a reversible chain.

Below, Layer 1 gives the linear equations, Layer 2 the fundamental matrix formulas, Layer 3 the
mixing bound and Layer 4 cover times.

## How to read the build

Layer 1 depends on no other layer. Layer 2 uses 1.1 and 1.3. Layer 3 uses 1.1 and 2.2. Layer 4
uses 1.1 only. Within a layer the sections are in build order, and every target ends with a
*Needs:* line naming what its statement and its route use. `LPW` is the book of Levin and Peres,
`LP` the book of Lyons and Peres and `AF` the monograph of Aldous and Fill listed under
References. `Suggested.lean` states the theorem of every numbered section.

## Conventions

- **State spaces and chains.** The state space `S` is a type with a σ-algebra in which singletons
  are measurable (`[MeasurableSpace S] [MeasurableSingletonClass S]`, the letter used by
  MarkovChainMixing and MCMCAsymptoticVariance); it is finite (`[Fintype S]`) in every statement
  except 1.2, which needs only `[Countable S]`. The networks of 1.4 have vertex type `V`, as in
  ElectricalNetworksAndRandomWalks. A chain is a kernel `κ : Kernel S S` with
  `[IsMarkovKernel κ]`, and `P(x, y) = κ x {y}`. Irreducibility is Mathlib's
  `Kernel.IsIrreducible Measure.count κ`: every state reaches every state in some number `n ≥ 0`
  of steps (Tau Ceti's `Kernel.isIrreducible_count_iff_forall_reaches`). Stationarity is
  `κ.Invariant π` and reversibility is `κ.IsReversible π`, for a probability measure `π`. An
  irreducible finite chain has a unique stationary law, and it gives every state positive mass.
- **Path laws and hitting times.** The law of the chain with initial law `ν` is Tau Ceti's
  `markovChainLaw ν κ` on `ℕ → S`, written `P_ν`, and `P_x` when `ν` is the point mass at `x`. On a
  path `ω`, `τ_A = hittingAfter (fun n ω => ω n) A 0 ω` is the first entrance time of `A`, in
  `WithTop ℕ`, with `τ_A = 0` when `ω 0 ∈ A` and `τ_A = ⊤` when `A` is never entered; `τ_y` stands
  for `τ_{y}`. This is the first entrance `H_A` of the Conventions of MarkovChainsAndRenewal (the
  paragraph on first entrance and first return), which defines the hitting and return times
  themselves but not their means. Mean times
  are lower integrals in `ℝ≥0∞` of `ENat.toENNReal` of these times.
- **Matrices.** `P` is the real matrix `transitionMatrix κ`, `Π` is `stationaryMatrix π` and `Z`
  is `fundamentalMatrix κ π`, as in MCMCAsymptoticVariance 1.1, with Mathlib's matrix inverse,
  which is `0` at a singular matrix. The mixing time `t_mix(ε)` is `mixingTime κ π ε` of
  MarkovChainMixing 1.3, in `ℕ∞`, built from total variation normalized to lie in `[0, 1]`.
- **Harmonic numbers.** `H_m = 1 + 1/2 + ⋯ + 1/m` is Mathlib's `harmonic m`, with `H_0 = 0`;
  natural-number subtraction makes `H_(n − 1) = 0` for `n = 0`.
- **Junk values.** Real division by zero is `0`; an infimum over an empty family in `ℝ≥0∞` is `⊤`,
  and `⊤ · 0 = 0` in `ℝ≥0∞`. Each statement says how it treats these cases.

## Layer 1: mean hitting times and their linear equations

### 1.1 Mean hitting times

Define `meanHittingTime κ ν A`, the lower integral of `ENat.toENNReal τ_A` against
`markovChainLaw ν κ`, written `E_ν τ_A`. Mathlib's `hittingAfter` and Tau Ceti's
`markovChainLaw` supply the stopping time and the path law; what is added here is the mean, with
its value `⊤` when the set is missed with positive probability, and the theorems below.

- `E_x τ_A = 0` for `x ∈ A`, and `E_x τ_∅ = ⊤`.
- `E_ν τ_A = Σ_x ν {x} · E_x τ_A` for a finite initial measure `ν`, since the path law is the
  mixture of the laws started at fixed states (Tau Ceti's `Measure.markovChainLaw_eq_comp`).

**Checks.**
- The walk on the path `0 — 1 — 2` that moves to a uniform neighbour: `E_0 τ_2 = 4`,
  `E_1 τ_2 = 3` and `E_1 τ_{0, 2} = 1`. The variant that counts from time `1` (the return time)
  would give `E_2 τ_2 = 4` instead of `0`.
- The identity kernel on two states: `E_1 τ_0 = ⊤`, the chain never leaving `1`.

*Needs:* Mathlib `hittingAfter`, `ENat.toENNReal`; Tau Ceti `markovChainLaw`,
`Measure.markovChainLaw_eq_comp`. (Proved here.)

### 1.2 The least solution of the first-step equations

Prove `isLeast_meanHittingTime`: on a countable state space, for every Markov kernel and every set
`A`, the function `x ↦ E_x τ_A` is the least function `h : S → ℝ≥0∞` with `h a = 0` for `a ∈ A`
and `h x = 1 + Σ'_y P(x, y) h(y)` for `x ∉ A`. No irreducibility is assumed. This is the classical
first-step analysis of absorption times; the mean hitting times as the minimal nonnegative
solution are in J. R. Norris, *Markov chains* (Cambridge University Press, 1997), Section 1.3,
cited here without a theorem number because the text was not opened for this roadmap.

Route: the Markov property at time `1` (Tau Ceti's
`Measure.markovChainLaw_map_prefix_shift_iterate_eq_compProd` with `n = 1`) shows that the mean
solves the equations, since for `x ∉ A` the hitting time of a path from `x` is one more than that
of the shifted path, including the value `⊤`. For minimality, an induction on `m` shows that every
solution `h` satisfies `h(x) ≥ E_x (τ_A ∧ m)`; let `m → ∞` by monotone convergence.

**Checks.**
- Minimal and not unique on an infinite state space: the walk on `ℕ` that steps down with
  probability `2/3` and up with probability `1/3`, with `A = {0}`, has `E_x τ_0 = 3x`, while
  `h(x) = 3x + c (2^x − 1)` solves the equations for every `c ≥ 0`.
- The value `⊤` is forced: the chain with `P(0, 0) = P(0, 1) = 1/2` and `1` absorbing, with
  `A = {0}`, has `E_1 τ_0 = ⊤`, and the equation at `1` reads `h(1) = 1 + h(1)`.

*Needs:* 1.1; Tau Ceti `Measure.markovChainLaw_map_prefix_shift_iterate_eq_compProd`; Mathlib
`lintegral_iSup` (monotone convergence). (Proved here.)

### 1.3 The real linear system

Prove `meanHittingTime_ne_top_and_eq_iff`: on a finite state space, if `A` is reachable from every
state (for every `x` some `n` has `κ^n(x, A) > 0`), then every `E_x τ_A` is finite, and a function
`h : S → ℝ` satisfies `h = 0` on `A` and `h(x) = 1 + Σ_y P(x, y) h(y)` for `x ∉ A` exactly when
`h(x)` is the real number `E_x τ_A` for every `x` (LPW, Exercise 10.22, p. 149, an exercise
whose hint gives the route below).

Route: finiteness: with `m` the number of states, every state reaches `A` within `m` steps with
probability at least some `ε > 0`, so `P_x(τ_A > k m) ≤ (1 − ε)^k` by the Markov property, and
the mean is finite. Then the real numbers solve the system by 1.2. Uniqueness: the difference of
two solutions vanishes on `A` and is harmonic off `A`; at a state where its maximum is attained
off `A`, harmonicity propagates the maximum along the states reachable from there, which include a
state of `A`; so the maximum, and likewise the minimum, is `0`.

**Checks.**
- On the cycle of length `n` with uniform steps to the two neighbours, `E_k τ_0 = k (n − k)`,
  which solves `h(k) = 1 + (h(k − 1) + h(k + 1))/2` with `h(0) = h(n) = 0`.
- Reachability is needed: for the chain of the second Check of 1.2 the real system has no
  solution.

*Needs:* 1.1, 1.2; Tau Ceti `Measure.markovChainLaw_map_prefix_shift_iterate_eq_compProd`.
(Proved here.)

### 1.4 The hitting time identity on networks

Copy verbatim, from ElectricalNetworksAndRandomWalks 1.1 and 2.1, the network `Network V` with
its `weight`, `graph`, `walkPMF` and `walk`, the instance `IsMarkovKernel N.walk`, the
`laplacian`, the `groundedLaplacian` and the `voltage`. The walk steps from `x` to `y` with
probability `c(x, y)/c(x)`, and `voltage a z` is the voltage of the unit current from `a` to `z`,
grounded at `z`; it is `0` when `a = z`.

Prove `meanHittingTime_walk_eq_sum`: on a connected network, for all vertices `a` and `z`,
`E_a τ_z = Σ_x c(x) v(x)` with `v = voltage a z` (LP, Proposition 2.20, p. 48, the hitting-time
identity, due to Tetali; there `π(x)` denotes the weight `c(x)`). LP state it for a target set
`Z`; here `Z = {z}`, the case the voltage of ElectricalNetworksAndRandomWalks 2.1 expresses. For
`a = z` both sides are `0`.

Route: by 1.3, `h(x) = E_x τ_z` is the unique function vanishing at `z` with
`c(x) h(x) − Σ_y c(x, y) h(y) = c(x)` for `x ≠ z`, that is, the grounded Laplacian applied to the
restriction of `h` is the vector of weights. So `h(a)` is the entry at `a` of the inverse of the
grounded Laplacian applied to the weights, and since that inverse is a symmetric matrix this is
`Σ_x c(x) v(x)`. Connectivity makes the grounded Laplacian invertible
(ElectricalNetworksAndRandomWalks 2.1) and `z` reachable from every vertex.

**Checks.**
- The unit path `0 — 1 — 2`: the voltage from `0` to `2` is `(2, 1, 0)` and the weights are
  `(1, 2, 1)`, so `E_0 τ_2 = 2 + 2 = 4`, as in 1.1. Adding the identity for `(0, 2)` and for
  `(2, 0)` gives the commute time `8 = c_G R(0 ↔ 2) = 4 · 2` of ElectricalNetworksAndRandomWalks
  3.2.
- A loop counts in the weight: on the unit edge `az` with a unit loop at `a`, `E_a τ_z = 2`, the
  voltage is `(1, 0)` and the weight of `a` is `2`; the weight without the loop would give `1`.
- Connectivity is needed: on two vertices with no edge `E_a τ_z = ⊤`, while the voltage is the
  junk value `0`.

*Needs:* 1.3; ElectricalNetworksAndRandomWalks 1.1 and 2.1 (the definitions, and the invertibility
of the grounded Laplacian of a connected network); Mathlib `Matrix.inv`, `Matrix.mul_nonsing_inv`.
(Proved here, except as cited.)

### Examples

Paths, cycles and complete graphs, with their mean hitting times from the linear system; a walk on
`ℕ` with drift towards `0`, where the equations have many solutions; networks with loops.

### Dependencies

Mathlib `hittingAfter`, `ENat.toENNReal`, `lintegral_iSup`, `Matrix.inv`,
`Matrix.mul_nonsing_inv`; Tau Ceti `markovChainLaw`, `Measure.markovChainLaw_eq_comp`,
`Measure.markovChainLaw_map_prefix_shift_iterate_eq_compProd`; ElectricalNetworksAndRandomWalks
1.1 and 2.1. No other layer.

## Layer 2: the fundamental matrix and stationary starts

### 2.1 The mean hitting time formula

Copy verbatim `transitionMatrix` (MarkovChainMixing 2.1) and `stationaryMatrix` and
`fundamentalMatrix` (MCMCAsymptoticVariance 1.1). Prove `meanHittingTime_dirac_eq`: for an
irreducible chain on a finite state space with stationary law `π`, and all states `x`, `y`,
`E_x τ_y = (Z(y, y) − Z(x, y))/π(y)`, a finite number (AF, Chapter 2, §2.2.2, Lemma 2.12). The
chain may be periodic. AF define `Z(x, y) = Σ_t (P^t(x, y) − π(y))` (their (2.6)), read as a
Cesàro limit for periodic chains; by MCMCAsymptoticVariance 1.2 this is the matrix `Z` used here,
and their `T_j` is the first entrance `τ_j`, counted from time `0`.

Route: by 1.3, `h = E_· τ_y` is the unique real function with `h(y) = 0` and
`h(x) − (P h)(x) = 1` for `x ≠ y`. First-step analysis at `y` gives `E_y τ_y⁺ = 1 + (P h)(y)`,
and Kac's formula (MarkovChainsAndRenewal Layer 3, item 2; §3.2 in its sectioned numbering) gives
`E_y τ_y⁺ = 1/π(y)`; so `(I − P) h = 1 − e_y/π(y)`, where `1` is the constant function and `e_y`
the indicator of `y`. The function `g(x) = (Z(y, y) − Z(x, y))/π(y)` vanishes at `y`, and
`(I − P) g = −(I − P) Z e_y / π(y) = −(I − Π) e_y / π(y) = 1 − e_y/π(y)` by the identity
`(I − P) Z = I − Π` of MCMCAsymptoticVariance 1.1. So `g = h` by the uniqueness in 1.3.

**Checks.**
- The two-state chain with `P(a, b) = 1/3`, `P(b, a) = 1/2`: `π = (3/5, 2/5)`,
  `Z = [[12/25, −12/25], [−18/25, 18/25]]`, and the formula gives `E_a τ_b = 3` and
  `E_b τ_a = 2`, the means of geometric laws with parameters `1/3` and `1/2`.
- The exchange chain on two states, which has period `2`: `Z = [[1/4, −1/4], [−1/4, 1/4]]`
  and `E_a τ_b = (1/4 + 1/4)/(1/2) = 1`.

*Needs:* 1.1, 1.3; MarkovChainMixing 2.1 (the definition of `transitionMatrix`);
MCMCAsymptoticVariance 1.1 (the definitions, invertibility of `I − P + Π`, and
`(I − P) Z = I − Π`); MarkovChainsAndRenewal Layer 3, item 2 (Kac's formula); Tau Ceti
`Measure.markovChainLaw_map_prefix_shift_iterate_eq_compProd`. (Proved here, after AF.)

### 2.2 Hitting from stationarity

Prove `meanHittingTime_stationary_eq`: for an irreducible chain on a finite state space with
stationary law `π`, `E_π τ_x = Z(x, x)/π(x)` (AF, Chapter 2, §2.2.2, Lemma 2.11).

Route: `E_π τ_x = Σ_y π(y) E_y τ_x` by 1.1, which is `Σ_y π(y) (Z(x, x) − Z(y, x))/π(x)` by 2.1,
and `π Z = 0` (MCMCAsymptoticVariance 1.1).

- For an aperiodic chain, `Z(x, x) = Σ_t (P^t(x, x) − π(x))`, a convergent series
  (MCMCAsymptoticVariance 1.2), so `π(x) E_π τ_x = Σ_t (P^t(x, x) − π(x))`, which is LPW,
  Proposition 10.26, (10.38), p. 142, stated there for aperiodic chains.

**Checks.**
- The two-state chain of 2.1: `E_π τ_a = (2/5) · 2 = 4/5 = Z(a, a)/π(a) = (12/25)/(3/5)`. The
  matrix `(I − P + Π)⁻¹` of Kemeny and Snell, which has row sums `1`, would give `9/5`.
- The cycle of length `n` with uniform steps: `E_π τ_0 = (1/n) Σ_k k (n − k) = (n² − 1)/6`; for
  `n = 4` it is `5/2`.

*Needs:* 1.1, 2.1; MCMCAsymptoticVariance 1.1 and, for the bullet, 1.2. (Proved here, after AF.)

### 2.3 The random target lemma

Prove `sum_mul_meanHittingTime_eq_trace`: for an irreducible chain on a finite state space with
stationary law `π`, `Σ_y π(y) E_x τ_y = trace Z` for every state `x`. So the target time does not
depend on the starting state (LPW, Lemma 10.1, p. 129; AF, Chapter 2, §2.2.2, Corollaries 2.13
and 2.14), and it equals `E_π τ_π = Σ_{x, y} π(x) π(y) E_x τ_y` (LPW, (10.5), p. 129).

Route: by 2.1 the sum is `Σ_y (Z(y, y) − Z(x, y))`, and the rows of `Z` sum to `0`
(MCMCAsymptoticVariance 1.1).

**Checks.**
- The two-state chain of 2.1: from `a`, `π(b) E_a τ_b = (2/5) · 3 = 6/5`; from `b`,
  `π(a) E_b τ_a = (3/5) · 2 = 6/5`; and `trace Z = 12/25 + 18/25 = 6/5`.
- Irreducibility is needed: for the identity kernel on two states and `π` the point mass at `0`,
  the target time is `0` from `0` and `⊤` from `1`.

*Needs:* 2.1; MCMCAsymptoticVariance 1.1. (Proved here, after AF.)

### 2.4 The cycle identity

Prove `meanHittingTime_cycle`: for an irreducible chain on a finite state space, reversible with
respect to a probability `π`, and all states `a`, `b`, `c`,
`E_a τ_b + E_b τ_c + E_c τ_a = E_a τ_c + E_c τ_b + E_b τ_a` (LPW, Lemma 10.12, p. 133, where
the proof goes through path reversal; due to Coppersmith, Tetali and Winkler).

Route: reversibility makes `π(x) Z(x, y) = π(y) Z(y, x)`, since `D_π P` and `D_π Π` are
symmetric, with `D_π` the diagonal matrix of `π`, and hence so is `D_π (I − P + Π)⁻¹`. Write each
of the six terms by 2.1 as `(Z(y, y) − Z(x, y))/π(y)`; the diagonal terms cancel between the two
sides, and the off-diagonal terms cancel in pairs by this symmetry.

**Checks.**
- Reversibility is needed: on three states arranged in a cycle, stepping clockwise with
  probability `2/3` and counterclockwise with probability `1/3`, the clockwise sum is
  `3 · 12/7 = 36/7` and the other is `3 · 15/7 = 45/7`.
- Irreducibility is needed: add to that chain an absorbing fourth state `d`; the kernel is
  reversible with respect to the point mass at `d`, and the identity still fails on the three
  states of the cycle.
- The unit path `0 — 1 — 2`: `E_0 τ_1 + E_1 τ_2 + E_2 τ_0 = 1 + 3 + 4 = 8 = 4 + 1 + 3`.

*Needs:* 2.1; Mathlib `Kernel.IsReversible`, `Kernel.IsReversible.invariant`. (Proved here.)

### Examples

The two-state chain and the exchange chain with their fundamental matrices; uniform walks on
cycles; a biased walk on a triangle, which is not reversible.

### Dependencies

1.1, 1.3; MarkovChainMixing 2.1; MCMCAsymptoticVariance 1.1 and 1.2; MarkovChainsAndRenewal
Layer 3, item 2; Mathlib
`Kernel.IsReversible`, `Kernel.IsReversible.invariant`; Tau Ceti
`Measure.markovChainLaw_map_prefix_shift_iterate_eq_compProd`.

## Layer 3: hitting times bound mixing times

### 3.1 Lazy reversible chains

Copy verbatim `tvToStationary` (MarkovChainMixing 1.2) and `mixingTime` (MarkovChainMixing 1.3).
Prove `mixingTime_le_of_lazy`: for a chain on a finite nonempty state space, reversible with
respect to a probability `π` and lazy (`P(x, x) ≥ 1/2` for every `x`),
`t_mix(1/4) ≤ 2 max_x E_π τ_x + 1` in `[0, ∞]` (LPW, Theorem 10.22 and (10.34), pp. 140–141).
Irreducibility is not assumed: a reversible chain that is not irreducible has `E_π τ_y = ⊤` for
some `y`, because the support of `π` is closed under the transitions, so the bound then holds
trivially.

Route: let `M = max_x E_π τ_x`, finite for an irreducible chain. A lazy chain is aperiodic, so by
the bullet of 2.2, `π(x) M ≥ Σ_t (P^t(x, x) − π(x))`. For a lazy reversible chain the return
probabilities `P^t(x, x)` are nonincreasing in `t`: by the spectral decomposition of
MarkovChainMixing 2.1, `P^t(x, x) = π(x) Σ_j l_j^t f_j(x)²`, and every eigenvalue `l_j` of `P` is
`(1 + l'_j)/2` for an eigenvalue `l'_j ∈ [−1, 1]` of the reversible kernel `2P − I`, so
`l_j ∈ [0, 1]` (LPW, Proposition 10.25 (ii), p. 141, proves the monotonicity instead with a
reversible chain on an enlarged state space whose two-step transitions between the original states
are those of `P`). The return probabilities tend to `π(x)` (MarkovChainsAndRenewal Layer 3,
convergence to equilibrium, item 5; §3.5 in its sectioned numbering), so every term is
nonnegative and the first `2t` terms after the zeroth give `P^(2t)(x, x)/π(x) − 1 ≤ M/(2t)` for
`t ≥ 1`. Reversibility gives
`Σ_y π(y) (P^t(x, y)/π(y) − 1)² = P^(2t)(x, x)/π(x) − 1`, and by Cauchy–Schwarz the distance
`‖P^t(x, ·) − π‖` is at most half the square root of that sum. So `d(t) ≤ ½ (M/(2t))^(1/2)`,
which is at most `1/4` once `t ≥ 1` and `t ≥ 2M`; so `t_mix(1/4) ≤ max(1, ⌈2M⌉) ≤ 2M + 1`, and if
`M = 0` there is one state and `t_mix(1/4) = 0`.

**Checks.**
- Laziness is needed: the exchange chain on two states is reversible with respect to the uniform
  law and has `E_π τ_x = 1/2`, so the bound would be `2`, while `d(t) = 1/2` for all `t` and
  `t_mix(1/4) = ⊤`.
- Reversibility is needed: the lazy rotation on the cycle of length `11`, which stays put with
  probability `1/2` and steps clockwise otherwise, has the uniform stationary law and
  `E_π τ_x = 10`, so the bound would be `21`; but `d(22) = 1495409/5767168 > 1/4` and
  `t_mix(1/4) = 23`.
- The lazy walk on the cycle of length `4`, which stays put with probability `1/2` and otherwise
  steps to a uniform neighbour: `E_π τ_x = 5`, so the bound is `11`, and `t_mix(1/4) = 1`.
- Without irreducibility: the kernel with `P(1, 0) = P(1, 1) = 1/2` and `0` absorbing is lazy and
  reversible with respect to the point mass at `0`, and `E_π τ_1 = ⊤`.

*Needs:* 1.1, 2.2 (with its bullet); MarkovChainMixing 1.2 and 1.3 (the definitions) and 2.1 (the
spectral decomposition); MCMCAsymptoticVariance 1.2 (for the bullet of 2.2);
MarkovChainsAndRenewal Layer 3, item 5 (convergence in total variation); Mathlib `tvDist`,
`Kernel.IsReversible`, `Kernel.IsReversible.invariant`; Tau Ceti `Kernel.IsAperiodic`.
(Proved here, after LPW.)

### Examples

Lazy walks on cycles and paths, where the bound is of the right order; the exchange chain and the
lazy rotation, which show that laziness and reversibility cannot be dropped.

### Dependencies

1.1, 2.2; MarkovChainMixing 1.2, 1.3 and 2.1; MCMCAsymptoticVariance 1.2; MarkovChainsAndRenewal
Layer 3, item 5; Mathlib
`tvDist`, `Kernel.IsReversible`, `Kernel.IsReversible.invariant`; Tau Ceti `Kernel.IsAperiodic`.

## Layer 4: cover times

### 4.1 Cover times

Define `coverTime A ω` for a finite set `A` of states, the largest of the hitting times `τ_y`,
`y ∈ A`, in `WithTop ℕ`: the first time by which every state of `A` has been visited (LPW, §11.1,
(11.1), p. 150; LP, §2.7, p. 49). It is `0` for `A = ∅` and `⊤` when some state of `A` is never
visited. Define `meanCoverTime κ ν A`, the lower integral of `ENat.toENNReal (coverTime A ω)`
against `markovChainLaw ν κ`, written `E_ν τ_cov^A`, and `τ_cov = τ_cov^S`.

- `E_x τ_y ≤ E_x τ_cov` for every `y`, so `max_{x, y} E_x τ_y ≤ max_x E_x τ_cov` (LPW, (11.2),
  p. 150); the cover time of `A` is monotone in `A`.

**Checks.**
- The cycle of length `n` with uniform steps: `E_0 τ_cov = n(n − 1)/2` (LPW, Example 11.1,
  p. 150); for `n = 4` it is `6`.
- The complete graph on `n` vertices without loops, with uniform steps:
  `E_x τ_cov = (n − 1) H_(n − 1)`; for `n = 4` it is `11/2`. With a loop at every vertex the
  walk is uniform on all `n` states and `E_x τ_cov = n H_(n − 1)`, which is `22/3` for `n = 4`
  (LPW, Example 11.3, p. 151).
- The path `0 — 1 — ⋯ — (n − 1)` with uniform steps to the neighbours:
  `E_k τ_cov = (n − 1)² + k (n − 1 − k)`; for `n = 5` it is `16` from an end and `20` from the
  middle.
- One state: `τ_cov = 0`. The variant that counts the first visit at time `1` would give `1`.

*Needs:* 1.1 (for the bullet); Mathlib `hittingAfter`, `Finset.sup`, `ENat.toENNReal`; Tau Ceti
`markovChainLaw`. (Proved here.)

### 4.2 Matthews' upper bound

Prove `meanCoverTime_le`: for a chain on a finite state space with `n` states and every starting
state `x`, `E_x τ_cov ≤ t_hit H_(n − 1)`, where `t_hit = max_{a, b} E_a τ_b` (LPW, Theorem 11.2,
p. 151; LP, Theorem 2.22, p. 49; due to Matthews). The sources assume irreducibility; it is
not needed here, since a chain on `n ≥ 2` states that is not irreducible has `t_hit = ⊤`, and on
one state both sides are `0`.

Route: order the states other than `x` by a uniform random permutation `σ` independent of the
chain, let `T_k` be the first time by which `σ(1), …, σ(k)` have all been visited and `L_k` the
state at time `T_k`. By the strong Markov property at `T_(k − 1)` (Tau Ceti's
`Measure.markovChainLaw_restrict_map_stoppedValue_shift_iterate`), `T_k − T_(k − 1)` has
conditional mean at most `t_hit` on the event `L_k = σ(k)` and is `0` off it, and that event has
probability `1/k` by the symmetry of `σ`. Summing over `k` gives the bound. When `t_hit = ⊤` and
`n ≥ 2` the right side is `⊤`.

**Checks.**
- The bound is attained by the complete graph: there `t_hit = n − 1` and `E_x τ_cov` is
  `(n − 1) H_(n − 1)`. The variant with `H_n` would not be attained.
- The cycle of length `4`: `t_hit = 4`, so the bound is `4 · 11/6 = 22/3`, above `6`.

*Needs:* 1.1, 4.1; Mathlib `harmonic`; Tau Ceti
`Measure.markovChainLaw_restrict_map_stoppedValue_shift_iterate`. (Proved here, after LPW.)

### 4.3 Matthews' lower bound

Prove `le_meanCoverTime`: for a chain on a finite state space, every finite set `A` of states and
every starting state `x`, `E_x τ_cov^A ≥ t_min^A H_(|A| − 1)`, where `t_min^A` is the least of the
`E_a τ_b` over distinct `a`, `b` in `A` (LPW, Proposition 11.4, pp. 151–152, proved there for
starting states in `A`; LP, §2.7, p. 49, states it for every starting state just before Theorem
2.23 and leaves the proof of that theorem as Exercise 2.20). The sources assume irreducibility; it
is not needed here, and the route below does not use it. For `|A| ≤ 1` the bound is the
junk product `⊤ · 0 = 0`. Since `E_x τ_cov ≥ E_x τ_cov^A`, the mean cover time from every state
is at least the maximum of `t_min^A H_(|A| − 1)` over the sets `A`.

Route: let `|A| ≥ 2`. If `E_x τ_cov^A = ⊤` there is nothing to prove, so let every `T_k` below be
finite almost surely. For `x ∈ A`, order all of `A` by a uniform random permutation `σ`
independent of the chain and let `T_k` be the first time by which `σ(1), …, σ(k)` have been
visited. The first step `T_1` is `0` when `σ(1) = x`, with probability `1/|A|`, and otherwise has
mean at least `t_min^A`. For
`k ≥ 2`, on the event that `σ(k)` is the last of `σ(1), …, σ(k)` to be visited, which has
probability `1/k`, the strong Markov property at `T_(k − 1)` makes `T_k − T_(k − 1)` the hitting
time of `σ(k)` from another state of `A`, of mean at least `t_min^A`; off that event it is `0`.
Since `1 − 1/|A| + Σ_{2 ≤ k ≤ |A|} 1/k = H_(|A| − 1)`, the terms add up to the bound, in
`[0, ∞]`. For `x ∉ A`, the cover time of `A` is `τ_A` plus the cover time of `A` by the path
after `τ_A`, which starts in `A`; apply the strong Markov property at `τ_A` and the case `x ∈ A`.

**Checks.**
- The path with `n` vertices and `A` its two ends: `t_min^A = (n − 1)²` and `H_1 = 1`, so the bound
  `(n − 1)²` is attained from an end.
- A start outside `A`: on the star with centre `0` and leaves `1`, `2`, and `A = {1, 2}`,
  `t_min^A = E_1 τ_2 = 4` and `E_0 τ_cov^A = 5`.
- The cycle of length `4` with `A` all states: `t_min^A = 3`, and the bound `3 · 11/6 = 11/2` is
  below `6`.
- Without irreducibility: for the chain with `P(1, 0) = P(1, 1) = 1/2` and `0` absorbing, and
  `A = {0, 1}`, `t_min^A = E_1 τ_0 = 2` while `E_0 τ_1 = ⊤`, and `E_1 τ_cov^A = 2` attains the
  bound; from `0` the cover time of `A` is infinite.

*Needs:* 1.1, 4.1; Mathlib `harmonic`; Tau Ceti
`Measure.markovChainLaw_restrict_map_stoppedValue_shift_iterate`. (Proved here, after LPW.)

### Examples

Cycles, complete graphs with and without loops, paths and stars, with their exact mean cover
times and the two bounds of Matthews.

### Dependencies

1.1; Mathlib `hittingAfter`, `Finset.sup`, `ENat.toENNReal`, `harmonic`; Tau Ceti
`markovChainLaw`, `Measure.markovChainLaw_restrict_map_stoppedValue_shift_iterate`.

## Scope and ownership

This roadmap owns, for Markov chains on finite state spaces: mean hitting times and their
characterization by the first-step equations (on countable state spaces for the least-solution
form), the hitting time identity on networks, the mean hitting time formula through the
fundamental matrix, hitting from stationarity, the random target lemma with the target time as the
trace of the fundamental matrix, the cycle identity for reversible chains, the bound of the mixing
time of a lazy reversible chain by hitting times from stationarity, cover times and Matthews'
bounds.

Already in the libraries and therefore not targets: Mathlib's hitting times of processes
(`hittingAfter`), kernels with their invariance, reversibility and irreducibility, total
variation distance, matrices and their inverses, and the harmonic numbers; Tau Ceti's path law
`markovChainLaw` with its mixture form and its Markov and strong Markov properties, its period and
aperiodicity, and its visit counts and Green function for a chain without killing
(`TauCeti/Probability/MarkovChain/Visits.lean`). The hitting times of the path law are taken from
Mathlib; nothing at the pins takes their means or treats cover times.

Left to other roadmaps:

- MarkovChainsAndRenewal owns the first entrance and return times themselves (its Conventions,
  the paragraph on first entrance and first return), recurrence, positive recurrence of finite
  irreducible chains (Layer 2, item 3), Kac's
  formula `π(x) = 1/E_x τ_x⁺` (Layer 3, item 2) and convergence to equilibrium (Layer 3, item 5);
  2.1 and 3.1 above consume them. It takes no means of hitting times.
- ElectricalNetworksAndRandomWalks owns networks, their walk, voltages, effective resistance,
  escape probabilities, the commute time identity `E_a τ_b + E_b τ_a = c_G R(a ↔ b)` (its 3.2)
  and Foster's theorem. Its definitions are copied verbatim in 1.4; the commute time identity is
  not restated, and 1.4, which expresses a single hitting time by voltages, is the identity that
  roadmap leaves out of its scope.
- MarkovChainMixing owns the transition matrix, the distances to stationarity and the mixing
  time, copied verbatim in 2.1 and 3.1, the spectral decomposition of a reversible chain, consumed
  in 3.1, and every mixing bound by the spectrum, bottlenecks, couplings and strong stationary
  times; 3.1 above is a bound by hitting times, which that roadmap leaves out.
- MCMCAsymptoticVariance owns the fundamental matrix, its identities and its expression as a
  series, and the Poisson equation; its definitions are copied verbatim in 2.1, and Layer 2 above
  consumes its 1.1 and 1.2. Mean hitting times through the fundamental matrix are outside its
  scope.
- RandomWalkFluctuationTheory and RandomWalksOnFiniteGroups own random walks on `ℤ^d` and on
  finite groups; cycles appear here only in Checks.

Not treated here: hitting times of sets in terms of resistance between sets, Tetali's formula of
`E_a τ_z` through resistances, transitive networks, the spanning tree bound and the bound `3n²`
for cover times of regular graphs, cover times of trees and tori, the converse comparison of
hitting and mixing times for general chains, coalescence and meeting times of several walks,
continuous-time chains and countable state spaces beyond 1.2.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Probability/Process/HittingTime.lean`: `MeasureTheory.hittingAfter u s n`, the first
  time `≥ n` at which `u` is in `s`, in `WithTop ι`, and `⊤` if there is none.
- `Mathlib/Basic/Real/ENatENNReal.lean`: `ENat.toENNReal`, the coercion `ℕ∞ → ℝ≥0∞` sending `⊤`
  to `∞`.
- `Mathlib/MeasureTheory/Integral/Lebesgue/Add.lean`: `MeasureTheory.lintegral_iSup` (monotone
  convergence for lower integrals).
- `Mathlib/Probability/Kernel/Invariance.lean`: `ProbabilityTheory.Kernel.Invariant`,
  `ProbabilityTheory.Kernel.IsReversible`, `ProbabilityTheory.Kernel.IsReversible.invariant` (a
  measure for which a Markov kernel is reversible is invariant).
- `Mathlib/Probability/Kernel/Irreducible.lean`: `ProbabilityTheory.Kernel.IsIrreducible`.
- `Mathlib/MeasureTheory/Measure/TotalVariation/Defs.lean`: `MeasureTheory.tvDist`, with values
  in `[0, 2]` on probability measures.
- `Mathlib/LinearAlgebra/Matrix/NonsingularInverse.lean`: the inverse of a square matrix,
  `Matrix.mul_nonsing_inv` (`A * A⁻¹ = 1` when `A.det` is a unit) and
  `Matrix.nonsing_inv_apply_not_isUnit` (`A⁻¹ = 0` otherwise).
  `Mathlib/LinearAlgebra/Matrix/Trace.lean`: `Matrix.trace`.
- `Mathlib/NumberTheory/Harmonic/Defs.lean`: `harmonic n = Σ_{i < n} 1/(i + 1)`, in `ℚ`.
- `Mathlib/Data/Finset/Lattice/Fold.lean`: `Finset.sup`, the supremum over a finite set, `⊥` on `∅`.
- For the copied network definitions: `PMF.ofFintype`, `PMF.pure`, `SimpleGraph.fromRel`,
  `SimpleGraph.Connected`, `Matrix.diagonal`, `Matrix.submatrix`.

### From Tau Ceti

- `TauCeti/Probability/Process/MarkovChain.lean`: `TauCeti.Probability.markovChainLaw ν κ`, the
  path law on `ℕ → α` of the chain with initial measure `ν` and Markov kernel `κ`, and
  `MeasureTheory.Measure.markovChainLaw_eq_comp` (the path law is the mixture over `ν` of the path
  laws started at fixed states, for every initial measure).
- `TauCeti/Probability/MarkovChain/MarkovProperty.lean`:
  `MeasureTheory.Measure.markovChainLaw_map_prefix_shift_iterate_eq_compProd` (for a finite
  initial measure, the prefix up to time `n` and the path shifted by `n` have the joint law of the
  prefix composed with the path law started at the state at time `n`).
- `TauCeti/Probability/MarkovChain/StrongMarkov.lean`:
  `MeasureTheory.Measure.markovChainLaw_restrict_map_stoppedValue_shift_iterate` (for a stopping
  time of the natural filtration and an event of its σ-algebra, the path after the stopping time,
  on that event intersected with finiteness, has the path law started from the stopped state).
- `TauCeti/Probability/MarkovChain/Period.lean`: `ProbabilityTheory.Kernel.IsAperiodic`.
- `TauCeti/Probability/Kernel/Reachability.lean`:
  `ProbabilityTheory.Kernel.isIrreducible_count_iff_forall_reaches` (irreducibility for the
  counting measure is reachability of every state from every state).
- `TauCeti/Probability/Kernel/Matrix.lean`: `ProbabilityTheory.Kernel.toMatrix`, used by the
  copied `transitionMatrix`.
- `TauCeti/Probability/Kernel/PMF.lean`: `ProbabilityTheory.Kernel.ofPMF` and its
  `IsMarkovKernel` instance, used by the copied `walk`.

### From TauCetiRoadmap.MarkovChainsAndRenewal

- Layer 3, item 2 (§3.2 in its sectioned numbering), invariant probabilities and Kac's formula:
  an irreducible positive recurrent chain has a unique invariant probability, with
  `π {x} = 1/E_x τ_x⁺`. With Layer 2, item 3 (§2.3), class properties: every finite closed
  communicating class, so every irreducible chain on a finite state space, is positive recurrent.
  Used in 2.1.
- Layer 3, item 5 (§3.5), total variation and convergence to equilibrium: an irreducible
  aperiodic positive recurrent chain converges in total variation to its invariant probability.
  Used in 3.1.

### From TauCetiRoadmap.ElectricalNetworksAndRandomWalks

- 1.1: the definitions `Network`, `weight`, `graph`, `walkPMF`, `walk` and the instance
  `IsMarkovKernel N.walk`, copied verbatim in 1.4.
- 2.1: the definitions `laplacian`, `groundedLaplacian` and `voltage`, copied verbatim in 1.4,
  and the invertibility of the grounded Laplacian of a connected network. Used in 1.4.
- 3.2: the commute time identity, cited in the Checks of 1.4 and not restated.

### From TauCetiRoadmap.MarkovChainMixing

- 1.2 and 1.3: the definitions `tvToStationary` and `mixingTime`, copied verbatim in 3.1.
- 2.1: the definition `transitionMatrix`, copied verbatim in 2.1, and the spectral decomposition
  of a chain reversible with respect to a law of full support: eigenvalues in `[−1, 1]` with
  `κ^t(x, y) = π(y) Σ_j l_j^t f_j(x) f_j(y)` for a `π`-orthonormal eigenbasis. Used in 3.1.

### From TauCetiRoadmap.MCMCAsymptoticVariance

- 1.1: the definitions `stationaryMatrix` and `fundamentalMatrix`, copied verbatim in 2.1; for an
  irreducible chain with stationary law `π`, the matrix `I − P + Π` is invertible, `Z` has row
  sums `0`, `π Z = 0` and `(I − P) Z = I − Π`. Used in 2.1, 2.2 and 2.3.
- 1.2: for an irreducible aperiodic chain, `Σ_t (P^t − Π)` converges to `Z`. Used in the bullet of
  2.2 and in 3.1.

## References

- D. A. Levin and Y. Peres, with contributions by E. L. Wilmer, *Markov chains and mixing times*,
  second edition, American Mathematical Society, 2017. Numbering and pages as in the second
  edition made available by the first author: Chapter 10, §§10.2, 10.3 and 10.7 and Exercise
  10.22, pp. 129–149, and Chapter 11, §§11.1–11.2, pp. 150–152.
- R. Lyons and Y. Peres, *Probability on trees and networks*, Cambridge University Press, 2016;
  the corrected and updated edition on the first author's site (version of 19 August 2026),
  §2.7, Proposition 2.20 and Theorems 2.22 and 2.23, pp. 48–49.
- D. Aldous and J. A. Fill, *Reversible Markov chains and random walks on graphs*, unfinished
  monograph, 2002, recompiled 2014; numbering as in the HTML edition linked from the first
  author's page, where the chapter dated September 10, 1999 is Chapter 2: §2.2.2, Lemmas 2.11 and
  2.12 and Corollaries 2.13 and 2.14.

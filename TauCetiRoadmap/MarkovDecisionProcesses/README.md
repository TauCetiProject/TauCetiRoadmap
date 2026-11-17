# Roadmap: Markov decision processes, dynamic programming and Q-learning

**Summary.** Develop the theory of finite Markov decision processes with discounted reward. The
Bellman evaluation and optimality operators are monotone `γ`-contractions of the sup norm; their
fixed points are the value of a policy and the optimal value, and a policy that is greedy for the
optimal value is optimal among all history-dependent randomized policies, whose returns are defined
through the Ionescu-Tulcea trajectory law. The roadmap solves finite-horizon problems by backward
induction, proves the optimality of greedy policies, the policy improvement theorem and the
performance difference lemma, proves the convergence and error bounds of value iteration and
policy iteration, and characterizes the optimal value and the occupancy measures by a pair of
linear programs. It ends with stochastic approximation: Tsitsiklis's theorem on asynchronous
iterations of a weighted max-norm contraction with martingale-difference noise, and its
consequences, the almost-sure convergence of tabular Q-learning and of tabular TD(0).

## Scope and ownership

This roadmap owns:

- finite Markov decision processes, their policies (deterministic and randomized, stationary,
  Markov and history-dependent), the trajectory law of a policy and its expected discounted
  return;
- the Bellman operators, their contraction and monotonicity, the value of a policy and the optimal
  value, Q-functions, greedy policies and the existence of optimal deterministic stationary
  policies;
- finite-horizon dynamic programming;
- the policy improvement theorem, the discounted occupancy measure and the performance difference
  lemma;
- value iteration and policy iteration;
- the primal and dual linear programs of a discounted MDP;
- the scalar stochastic-approximation lemma with random step sizes, Tsitsiklis's asynchronous
  stochastic-approximation theorem, tabular Q-learning and tabular TD(0).

It consumes, and does not re-prove, the items listed under
[Exact supplier contracts](#exact-supplier-contracts).

Out of scope:

- countable and general state or action spaces, and measurable selection;
- average-reward and total-reward criteria, and constrained MDPs;
- partially observable MDPs, stochastic games, and optimal stopping as a separate theory;
- continuous-time control and the Hamilton–Jacobi–Bellman equation;
- function approximation, including linear TD with Markovian sampling, policy-gradient methods and
  sample-complexity bounds;
- general linear-programming duality: the two programs of Layer 5 are solved directly;
- the Robbins–Siegmund theorem and stochastic gradient descent, which belong to
  [FirstOrderOptimization](../FirstOrderOptimization/README.md); the noise lemma 6.1 is proved
  directly because its step sizes are random.

## Conventions

- `S` and `A` are nonempty finite types (`[Fintype S] [Nonempty S] [Fintype A] [Nonempty A]`) with
  decidable equality. Where a measurable structure is needed it is the discrete one
  (`[MeasurableSpace S] [DiscreteMeasurableSpace S]`, and the same for `A`).
- A **finite MDP** is a structure `FiniteMDP S A` with fields `trans : S → A → PMF S` and
  `reward : S → A → ℝ`. Rewards are deterministic functions of the current state and action.
- The **discount factor** is `γ : ℝ≥0` with `γ < 1`, coerced to `ℝ` inside the operators;
  `ContractingWith` takes its constant in `ℝ≥0`.
- **Value functions** are `S → ℝ` with Mathlib's sup norm `‖v‖ = sup_s |v s|`; Q-functions are
  `S × A → ℝ` with the same norm. The order on functions is pointwise.
- `M.expect v s a = Σ_{s'} (trans s a s').toReal * v s'` is the expected next value. The letter
  `P` is reserved for probability measures (Layers 1 and 6).
- **Policies.**
  - A deterministic stationary policy is `π : S → A`; a randomized stationary policy is
    `π : S → PMF A`, and `ofDet π = fun s ↦ PMF.pure (π s)`.
  - A Markov policy is `π : ℕ → S → PMF A`.
  - A history-dependent randomized policy (`HistoryPolicy S A`) is a pair: a Markov kernel
    `π₀ : Kernel S A` for the first action, and Markov kernels
    `π n : Kernel ((Π i : Iic n, S × A) × S) A` choosing the action at time `n + 1` from the
    history up to time `n` and the new state.
  - `ofMarkov π` is the history-dependent policy with `π₀ = π 0` and `(π n) (h, s') = π (n + 1) s'`,
    each `PMF` read as a measure by `PMF.toMeasure` and made a kernel by `Kernel.ofFunOfCountable`;
    `ofStationary π = ofMarkov (fun _ ↦ π)`.
- The **Bellman evaluation operator** of a randomized stationary policy is
  `T^π v s = Σ_a π s a · (reward s a + γ M.expect v s a)`, and the **Bellman optimality operator**
  is `T v s = max_a (reward s a + γ M.expect v s a)`. The **value** `V^π` is the fixed point of
  `T^π` and the **optimal value** `V⋆` is the fixed point of `T`.
  `Q^π (s, a) = reward s a + γ M.expect V^π s a` and `Q⋆ (s, a) = reward s a + γ M.expect V⋆ s a`.
- A deterministic `π` is **greedy** for `v` (`IsGreedy`) if `π s` maximizes
  `a ↦ reward s a + γ M.expect v s a` for every `s`; ties are broken by any choice, and statements
  hold for every greedy policy. A randomized stationary `π` is **optimal** if `V^π = V⋆`.
- `R = max_{s,a} |reward s a|`.
- **Probability.** `(Ω, P)` is a probability space with filtration `ℱ : Filtration ℕ m₀`;
  conditional expectation is Mathlib's `P[· | ℱ n]`, and almost-sure statements are `∀ᵐ ω ∂P`.

## Exact supplier contracts

- Mathlib:
  - `ContractingWith`, `ContractingWith.fixedPoint`, `ContractingWith.fixedPoint_isFixedPt`,
    `ContractingWith.fixedPoint_unique`, `ContractingWith.dist_fixedPoint_le` and
    `ContractingWith.apriori_dist_iterate_fixedPoint_le`
    (`Mathlib/Topology/MetricSpace/Contracting.lean`);
  - the sup norm on `S → ℝ` (`pi_norm_le_iff_of_nonneg`); `Matrix.linftyOpNormedRing`, a `def`
    used as a local instance; `NormedRing.inverse_one_sub`;
  - `PMF`, `PMF.toMeasure`, `Kernel`, `IsMarkovKernel`,
    `Kernel.ofFunOfCountable`, `Kernel.compProd`, `Kernel.traj`, `Kernel.trajMeasure`,
    `Kernel.integral_traj`, `Kernel.integral_traj_partialTraj` and `Kernel.condDistrib_trajMeasure`
    (`Mathlib/Probability/Kernel/IonescuTulcea/Traj.lean`);
  - `condExp`, `Filtration`, `StronglyAdapted`, `Martingale`, `Submartingale.exists_ae_tendsto_of_bdd`,
    and the stopping-time API `MeasureTheory.IsStoppingTime`, `stoppedProcess` and `hitting`.
- Tau Ceti: `TauCeti.Probability.markovChainLaw ν κ`
  (`TauCeti/Probability/Process/MarkovChain.lean`), the law on `ℕ → S` of the homogeneous Markov
  chain with initial law `ν` and kernel `κ`, and its Markov property
  `MeasureTheory.Measure.condExp_shift_iterate_markovChainLaw`
  (`TauCeti/Probability/MarkovChain/MarkovProperty.lean`).
- [MarkovChainsAndRenewal](../MarkovChainsAndRenewal/README.md) L0: the kernel and path-law
  conventions for chains on countable state spaces, which Layer 1 follows for the chain of a
  stationary policy.

## How to read the build

Each layer opens with its definitions. Each numbered target ends with **Checks**, tests that a
wrong convention or constant would fail, and a *Needs:* line naming the targets and suppliers it
uses. Every claim carries a source locator in parentheses, or says that it is proved here.
`Suggested.lean` states every named target against the pinned APIs.

## Layer 1: MDPs, policies and Bellman operators

### 1.1 Policies and trajectories

Define `FiniteMDP`, `HistoryPolicy`, `ofMarkov` and `ofStationary` as in
[Conventions](#conventions). Let `transKernel : Kernel (S × A) S` be
`Kernel.ofFunOfCountable fun (s, a) ↦ (trans s a).toMeasure`. For `π : HistoryPolicy S A` and
`s : S`, the **trajectory law** `trajLaw M π s : Measure (ℕ → S × A)` is `Kernel.trajMeasure μ₀ κ`
with `X n = S × A`, initial law `μ₀ = Measure.dirac s ⊗ₘ π₀`, and
`κ n = (transKernel.comap (fun h ↦ h ⟨n, _⟩)) ⊗ₖ π n` (`Kernel.compProd`): from the history up to
time `n` the next state is drawn from `trans sₙ aₙ`, and the next action from `π n` applied to
the history and that state. Prove that:

- `trajLaw M π s` is a probability measure, and under it the state at time `n + 1` has conditional
  law `trans sₙ aₙ` given the history up to time `n` (`Kernel.condDistrib_trajMeasure`);
- for a randomized stationary `π`, the state process under `trajLaw M (ofStationary π) s` has law
  `markovChainLaw (dirac s) κ^π`, with `κ^π = stationaryKernel π`, the kernel
  `Kernel.ofFunOfCountable fun s ↦ Σ_a π s a • (trans s a).toMeasure` (`trajLaw_ofStationary`).

Define the **expected discounted return**
`expectedReturn M γ π s = ∫ ω, Σ' n, γ ^ n * reward (ω n).1 (ω n).2 ∂(trajLaw M π s)` and the
**`N`-step return with terminal value `g`**
`finiteReturn M γ N g π s = ∫ ω, (Σ_{n<N} γ ^ n * reward (ω n).1 (ω n).2 + γ ^ N * g (ω N).1)
∂(trajLaw M π s)`. Prove `|expectedReturn M γ π s| ≤ R / (1 − γ)` and the **tail bound**
`|expectedReturn M γ π s − finiteReturn M γ N 0 π s| ≤ γ^N R / (1 − γ)`
(`abs_expectedReturn_sub_finiteReturn_le`). (Puterman 1994, Sections 2.1 and 5.1; proved here.)

**Checks.**

- A one-state MDP with `reward = c` constant: `expectedReturn M γ π s = c / (1 − γ)` for every
  policy.
- `γ = 0`: `expectedReturn M 0 π s = ∫ reward s a ∂(π₀ s)`.
- Two states, one action, `trans s a = pure (swap s)`: the state process alternates.

*Needs:* Mathlib `PMF.toMeasure`, `Kernel.ofFunOfCountable`, `Kernel.compProd`,
`Kernel.trajMeasure`, `Kernel.condDistrib_trajMeasure`; Tau Ceti `markovChainLaw`.

### 1.2 Bellman operators

Prove, for every randomized stationary `π`:

- `T^π` and `T` are monotone, and `T (v + c) = T v + γ c` and `T^π (v + c) = T^π v + γ c` for
  constant `c`;
- `T^π` and `T` are `ContractingWith γ` on `S → ℝ` with the sup norm
  (`contractingWith_bellman`, `contractingWith_bellmanEval`);
- `‖V^π‖ ≤ R / (1 − γ)` and `‖V⋆‖ ≤ R / (1 − γ)` (`norm_value_le`);
- `V^π = (1 − γ P^π)⁻¹ r^π`, with `P^π = policyMatrix π` the row-stochastic matrix of `κ^π`,
  `r^π s = Σ_a π s a · reward s a`, and the inverse given by the Neumann series in the normed
  ring `Matrix.linftyOpNormedRing` (`value_eq_inverse`).

(Puterman 1994, Proposition 6.2.4 and Theorem 6.1.1; proved here.)

**Checks.**

- `γ = 0`: `T v s = max_a reward s a` for every `v`, and `V⋆ = T 0`.
- The contraction constant is exactly `γ` on a one-state, one-action MDP:
  `T v − T w = γ (v − w)`.
- `T^π ≤ T` pointwise, with equality at `v` when `π` is greedy for `v`.

*Needs:* 1.1; Mathlib `ContractingWith`, `NormedRing.inverse_one_sub`.

### 1.3 Values of stationary policies

Prove that for every randomized stationary `π`,
`expectedReturn M γ (ofStationary π) s = V^π s` (`expectedReturn_eq_value`), by 1.1 and the Markov
property of `markovChainLaw`. (Puterman 1994, Theorem 6.1.1; proved here.)

**Checks.**

- One state, one action, reward `c`: both sides are `c / (1 − γ)`.
- A two-state chain alternating deterministically with rewards `1, 0`:
  `V^π = (1/(1 − γ²), γ/(1 − γ²))`.
- `γ = 0`: both sides are `r^π`.

*Needs:* 1.1, 1.2; Tau Ceti `condExp_shift_iterate_markovChainLaw`.

### Examples

A one-state MDP, the deterministic two-state alternation, and a two-state, two-action MDP with
`trans s a = pure a` (the action chooses the next state).

### Dependencies

Layer 1 uses Mathlib's kernels, `PMF` and contractions and Tau Ceti's `markovChainLaw`.

## Layer 2: finite horizon

### 2.1 Backward induction

For a horizon `N` and a terminal value `g : S → ℝ`, prove that
`T^N g s = ⨆ π, finiteReturn M γ N g π s`, the supremum over history-dependent randomized
policies, and that it is attained by `ofMarkov` of the deterministic Markov policy that at time
`n` is greedy for `T^{N−n−1} g` (`backwardInduction`). The proof is by induction on `N`, using
`Kernel.integral_traj_partialTraj` to split the trajectory after the first step. (Puterman 1994,
Theorem 4.5.1; proved here.)

**Checks.**

- `N = 0`: `T^0 g = g = finiteReturn M γ 0 g π`.
- `N = 1`: `T g s = max_a (reward s a + γ M.expect g s a)`.
- With `g = 0`, `T^N 0 → V⋆` geometrically by 1.2.

*Needs:* 1.1, 1.2; Mathlib `Kernel.integral_traj_partialTraj`.

### Examples

A two-period inventory problem with three states and two actions.

### Dependencies

Layer 2 uses Layer 1.

## Layer 3: optimality

### 3.1 Optimal policies

Prove:

- for every history-dependent randomized `π` and every `s`, `expectedReturn M γ π s ≤ V⋆ s`
  (`expectedReturn_le_optimalValue`): by the tail bound of 1.1 and 2.1,
  `expectedReturn M γ π s ≤ T^N 0 s + γ^N R/(1 − γ)`, which tends to `V⋆ s`;
- every deterministic stationary `π` greedy for `V⋆` has `V^π = V⋆`, and such a `π` exists
  (`value_eq_optimalValue_of_isGreedy`);
- hence `V⋆ s = ⨆ π, expectedReturn M γ π s` over all history-dependent randomized policies, the
  supremum is attained by `ofStationary (ofDet π)` for a deterministic stationary `π`, and every
  randomized stationary `π` has `V^π ≤ V⋆` (`optimalValue_eq_iSup_expectedReturn`,
  `value_le_optimalValue`);
- a deterministic stationary `π` is optimal if and only if it is greedy for `V^π`.

(Puterman 1994, Theorems 6.2.2, 6.2.6 and 6.2.10; proved here.)

**Checks.**

- The two-state MDP with `trans s a = pure a` and `reward s a = if a = 1 then 1 else 0`:
  `V⋆ = (1/(1 − γ), 1/(1 − γ))`, attained by `π s = 1`.
- For `0 < γ`, the history-dependent policy that alternates the actions `1, 0, 1, …` does worse
  there: its return is `1/(1 − γ²) < 1/(1 − γ)`.
- `γ = 0`: optimal policies are the greedy maximizers of `reward s ·`.

*Needs:* 1.1–1.3, 2.1.

### 3.2 Q-functions

Prove `V⋆ s = max_a Q⋆ (s, a)`, the Bellman equation
`Q⋆ (s, a) = reward s a + γ Σ_{s'} trans s a s' · max_b Q⋆ (s', b)`, that the operator
`H q (s, a) = reward s a + γ Σ_{s'} trans s a s' · max_b q (s', b)` (`qBellman`) is
`ContractingWith γ` on `S × A → ℝ` with fixed point `Q⋆` (`contractingWith_qBellman`), and that a
deterministic `π` is optimal if and only if `π s ∈ argmax_a Q⋆ (s, a)` for every `s`. (Watkins and
Dayan 1992, Section 2; proved here.)

**Checks.**

- One state, one action, reward `c`: `Q⋆ = c / (1 − γ)`.
- `H (q + c) = H q + γ c`.
- `γ = 0`: `Q⋆ = reward`.

*Needs:* 1.2, 3.1.

### 3.3 Policy improvement and performance difference

For randomized stationary `π`, `π'`, prove:

- **policy improvement:** if `T^{π'} V^π ≥ V^π` then `V^{π'} ≥ V^π`, and if moreover the inequality
  is strict at some state then `V^{π'}` is strictly larger at that state (`value_le_of_improve`);
- the **discounted occupancy measure** `occupancy M γ π s = (1 − γ) e_s (1 − γ P^π)⁻¹`, equal to
  `(1 − γ) Σ_n γ^n` times the law of the state at time `n` under `trajLaw M (ofStationary π) s`, is
  a probability vector on `S`;
- **performance difference:**
  `V^{π'} s − V^π s = 1/(1 − γ) Σ_{s'} occupancy M γ π' s s' Σ_a π' s' a · (Q^π (s', a) − V^π s')`
  (`performanceDifference`).

(Howard 1960, Chapter 3; Puterman 1994, Proposition 6.4.1; Kakade and Langford 2002, Lemma 6.1;
proved here.)

**Checks.**

- `π' = π`: the right side is `0`, since `Σ_a π s a Q^π (s, a) = V^π s`.
- `γ = 0`: `occupancy M 0 π s = e_s` and the identity reads `r^{π'} s − r^π s`.
- On the alternating two-state chain,
  `occupancy M γ π s₀ = ((1 − γ)/(1 − γ²), γ(1 − γ)/(1 − γ²))`.

*Needs:* 1.1–1.3.

### Examples

The two-action MDP of 3.1, and a three-state chain where the greedy policy for `V^π` improves `π`
strictly at one state.

### Dependencies

Layer 3 uses Layers 1 and 2.

## Layer 4: algorithms

### 4.1 Value iteration

Let `v_k = T^k v₀`. Prove:

- `‖v_k − V⋆‖ ≤ γ^k ‖v₀ − V⋆‖`, and `‖v_k − V⋆‖ ≤ γ/(1 − γ) ‖v_k − v_{k−1}‖` for `k ≥ 1`;
- **greedy suboptimality:** if `π` is greedy for `v`, then
  `‖V^π − V⋆‖ ≤ 2γ/(1 − γ) ‖v − V⋆‖` (`value_greedy_le`);
- there is `k₀` such that every policy greedy for `v_k` with `k ≥ k₀` is optimal
  (`eventually_optimal_greedy_valueIteration`), from the positive gap between optimal and
  suboptimal actions.

(Puterman 1994, Theorem 6.3.1; Singh and Yee 1994, Main Theorem; the last item is proved here.)

**Checks.**

- `v₀ = V⋆`: `v_k = V⋆` for every `k`.
- `γ = 0`: `v₁ = V⋆` from any `v₀`.
- `v = V⋆`: the greedy bound is `0`, and every greedy policy is optimal, as in 3.1.

*Needs:* 1.2, 3.1; Mathlib `ContractingWith.apriori_dist_iterate_fixedPoint_le`,
`ContractingWith.dist_fixedPoint_le`.

### 4.2 Policy iteration

Starting from a deterministic stationary `π₀`, let `π_{k+1}` be greedy for `V^{π_k}`, choosing
`π_{k+1} s = π_k s` whenever `π_k s` is greedy. Prove that `V^{π_{k+1}} ≥ V^{π_k}`; that
`‖V^{π_k} − V⋆‖ ≤ γ^k ‖V^{π₀} − V⋆‖` (`policyIteration_rate`); and that the sequence becomes
constant after at most `|A|^|S|` steps at an optimal policy (`policyIteration_terminates`).

(Howard 1960, Chapter 3; Puterman 1994, Theorems 6.4.2 and 6.4.6; proved here.)

**Checks.**

- If `π₀` is optimal, `π₁ = π₀` by the tie-breaking rule.
- `|S| = |A| = 1`: the sequence is constant from the start.
- The rate is the value-iteration rate: `V^{π_k} ≥ T^k V^{π₀}`.

*Needs:* 1.2, 3.1, 3.3.

### Examples

Value iteration and policy iteration on the two-state, two-action MDP of 3.1.

### Dependencies

Layer 4 uses Layers 1 and 3.

## Layer 5: linear programs

### 5.1 The primal program

For `μ : S → ℝ` with `μ s > 0` for all `s`, prove that every `v` with
`v s ≥ reward s a + γ M.expect v s a` for all `s`, `a` satisfies `v ≥ V⋆`
(`optimalValue_le_of_feasible`), and hence that `V⋆` is the unique minimizer of `Σ_s μ s v s` over
this set (`optimalValue_isLeast_primal`). (Puterman 1994, Section 6.9; proved here.)

**Checks.**

- `v = V⋆` is feasible, by the Bellman equation.
- `v = R/(1 − γ)` constant is feasible.
- `μ s₁ = 0` at a state `s₁` that no other state reaches: raising `v s₁` keeps `v` feasible and
  the objective unchanged, so uniqueness needs `μ > 0`.

*Needs:* 1.2, 3.1.

### 5.2 The dual program and occupancy measures

For `μ` a probability vector, a **feasible occupancy** is `x : S × A → ℝ` with `x ≥ 0` and
`Σ_a x (s', a) − γ Σ_{s,a} trans s a s' · x (s, a) = μ s'` for every `s'`. Prove:

- for every randomized stationary `π`, `x^π (s, a) = Σ_{s₀} μ s₀ · (occupancy M γ π s₀ s / (1 − γ))
  · π s a` is a feasible occupancy, and every feasible occupancy is `x^π` for the policy
  `π s a = x (s, a) / Σ_b x (s, b)` (any distribution where the denominator is `0`);
- `Σ_{s,a} reward s a · x (s, a) ≤ Σ_s μ s V⋆ s` for every feasible `x`, with equality for `x^π`
  when `π` is optimal (`occupancy_reward_le`, `occupancy_reward_optimal`).

The inequality is weak duality: `Σ x · reward ≤ Σ x · (V⋆ − γ M.expect V⋆) = Σ μ V⋆`.
(Puterman 1994, Theorems 6.9.1 and 6.9.4; proved here.)

**Checks.**

- `Σ_{s,a} x (s, a) = 1/(1 − γ)` for every feasible `x`, by summing the constraint over `s'`.
- One state, one action: `x = 1/(1 − γ)`.
- `γ = 0`: `x (s, a) = μ s π s a`.

*Needs:* 1.2, 3.1, 3.3.

### Examples

The two programs on the two-state, two-action MDP of 3.1.

### Dependencies

Layer 5 uses Layers 1 and 3.

## Layer 6: stochastic approximation and Q-learning

### 6.1 The scalar noise lemma

Let `α t` and `w t` be real processes with `α t` `ℱ t`-measurable and `0 ≤ α t ≤ 1`, `w t`
`ℱ (t+1)`-measurable and square-integrable, `P[w t | ℱ t] = 0` and `P[(w t)² | ℱ t] ≤ C` almost
surely, and `Σ_t α t = ∞`, `Σ_t (α t)² < ∞` almost surely. Then
`W (t+1) = (1 − α t) W t + α t w t` with deterministic `W 0` tends to `0` almost surely
(`ae_tendsto_zero_noise`). The proof shows that `Σ α t w t`, stopped at the first time where
`Σ_{s<t} (α s)²` exceeds `k` (`hitting`, `stoppedProcess`), is an `L²`-bounded martingale for each
`k`. (Tsitsiklis 1994, Lemma 1; Dvoretzky 1956; proved here.)

**Checks.**

- `w = 0`: `W t = Π_{s<t} (1 − α s) W 0 → 0` because `Σ α = ∞`.
- `α t = 1/(t + 1)` and `W 0 = 0`: `W t` is the running average of `w 0, …, w (t−1)`, and the lemma
  is the strong law for bounded-variance martingale differences.
- `α t = 1` for all `t` violates `Σ α² < ∞`, and `W (t+1) = w t` does not tend to `0`.

*Needs:* Mathlib `Martingale`, `Submartingale.exists_ae_tendsto_of_bdd`, `condExp`, `hitting`,
`stoppedProcess`.

### 6.2 Asynchronous stochastic approximation

Let `ι` be a finite type, `ξ : ι → ℝ` with `ξ i > 0`, `‖x‖_ξ = max_i |x i| / ξ i`
(`weightedMaxNorm`), and `F : (ι → ℝ) → (ι → ℝ)` with `‖F x − F y‖_ξ ≤ β ‖x − y‖_ξ` for some
`β < 1` and fixed point `x⋆`. Let `x t` be a process with
`x (t+1) i = x t i + α t i · (F (x t) i − x t i + w t i)` for every `i` and deterministic `x 0`,
where `α t i ∈ [0, 1]` is `ℱ t`-measurable with `Σ_t α t i = ∞` and `Σ_t (α t i)² < ∞` almost
surely, and `w t i` is `ℱ (t+1)`-measurable and square-integrable with `P[w t i | ℱ t] = 0` and
`P[(w t i)² | ℱ t] ≤ A + B ‖x t‖²_ξ` almost surely. Then `x t → x⋆` almost surely
(`ae_tendsto_asyncSA`).

The proof uses 6.1 twice. Boundedness: with `G t = max 1 (max_{s ≤ t} ‖x s‖_ξ)`, which is
`ℱ t`-measurable, the normalized noise `w t i / G t` satisfies 6.1 with `C = A + B`, and a
rescaling argument shows `sup_t ‖x t‖_ξ < ∞` almost surely. Convergence: on the event
`sup_t ‖x t‖_ξ ≤ K`, apply 6.1 to the truncated noise `w t i · 1{‖x t‖_ξ ≤ K}` from a sequence of
deterministic start times `τ` with the shifted filtrations `ℱ (τ + ·)`, shrinking boxes
`‖x − x⋆‖_ξ ≤ D_k` with `D_{k+1} = (β + ε) D_k`. (Tsitsiklis 1994, Theorems 1, 2 and 3, without
delays; Bertsekas and Tsitsiklis 1996, Section 4.3; proved here.)

**Checks.**

- `w = 0` and `α t i = 1`: the iteration is the Banach iteration `x (t+1) = F (x t)`, which
  converges by 1.2's supplier although `Σ α² = ∞` puts it outside the hypotheses.
- `F` constant `c`: each coordinate is the averaging of 6.1 around `c i`.
- `ι` a single point and `F x = β x` with `0 ≤ β < 1`: `x⋆ = 0`.

*Needs:* 6.1.

### 6.3 Q-learning

Let `(s t, a t)` be `ℱ t`-measurable random state-action pairs, `s' t` be `ℱ (t+1)`-measurable with
`P(s' t = s' | ℱ t) = trans (s t) (a t) s'`, and `α t (s, a) ∈ [0, 1]` be `ℱ t`-measurable with
`α t (s, a) = 0` unless `(s, a) = (s t, a t)`, `Σ_t α t (s, a) = ∞` and `Σ_t α t (s, a)² < ∞`
almost surely for every `(s, a)`. Define
`q (t+1) (s, a) = q t (s, a) + α t (s, a) · (reward s a + γ max_b q t (s' t, b) − q t (s, a))`
with deterministic `q 0`. By induction `q t` is `ℱ t`-measurable. Prove
`‖q t‖ ≤ max ‖q 0‖ (R/(1 − γ))` and `q t → Q⋆` almost surely (`qLearning_ae_tendsto`). The update
is 6.2 with `F = qBellman`, `ξ = 1`, and noise
`w t (s, a) = γ (max_b q t (s' t, b) − Σ_{s'} trans s a s' · max_b q t (s', b))` at
`(s, a) = (s t, a t)` and `w t (s, a) = 0` elsewhere; it has conditional mean `0` because `q t` is
`ℱ t`-measurable and `S` is finite, and it is bounded by `2γ ‖q t‖`. (Watkins and Dayan 1992,
Theorem; Tsitsiklis 1994, Section 5; Jaakkola, Jordan and Singh 1994, Theorem 2; proved here.)

**Checks.**

- A one-state, one-action MDP with reward `c` and `α t = 1/(t + 1)`: `q` is deterministic and
  tends to `c / (1 − γ)`.
- `γ = 0`: `q t (s, a)` is a weighted average of `reward s a` and `q 0 (s, a)` tending to
  `reward s a`.
- A pair visited only finitely often violates `Σ_t α t (s, a) = ∞`, and its entry stays fixed after
  the last visit.

*Needs:* 3.2, 6.2.

### 6.4 Tabular TD(0)

For a randomized stationary `π`, let `s t` be `ℱ t`-measurable, `a t` and `s' t` be
`ℱ (t+1)`-measurable with `P(a t = a, s' t = s' | ℱ t) = π (s t) a · trans (s t) a s'`, and
`α t s` as in 6.3 with `α t s = 0` unless `s = s t`. Define
`v (t+1) s = v t s + α t s · (reward s (a t) + γ v t (s' t) − v t s)` with deterministic `v 0`.
Prove `v t → V^π` almost surely (`td0_ae_tendsto`), as 6.2 with `F = T^π` and noise
`reward s (a t) + γ v t (s' t) − T^π (v t) s` at `s = s t` and `0` elsewhere. (Sutton 1988 and
Dayan 1992 introduce TD(0) and prove convergence in the mean; Jaakkola, Jordan and Singh 1994,
Theorem 3, prove almost-sure convergence; proved here.)

**Checks.**

- One state, one action: TD(0) and Q-learning coincide.
- `γ = 0`: `v t s → r^π s`, the averaging of 6.1.
- A deterministic policy and deterministic transitions: the noise is `0` and the iteration is a
  relaxed evaluation of `T^π`.

*Needs:* 1.2, 6.2.

### Examples

Q-learning on the two-state, two-action MDP of 3.1 with `(s t, a t)` drawn i.i.d. uniformly and
`α t (s, a) = 1/(number of visits to (s, a) up to time t)` at the visited pair, and TD(0) on the
alternating chain.

### Dependencies

Layer 6 uses 1.2, 3.2 and Mathlib's martingale and stopping-time theory.

## Downstream consumers

The finite-horizon results of 2.1 are the dynamic-programming principle for optimal stopping with
a stopping action. The asynchronous stochastic-approximation theorem of 6.2 applies to any
weighted max-norm contraction, including the averaging iterations of distributed computation.

## Provenance and prior work

- [rl-theory-in-lean](https://github.com/ShangtongZhang/rl-theory-in-lean) (Lean 4, MIT; Zhang
  2025, arXiv:2511.03618) formalizes finite MDPs, the contraction of the Q-Bellman operator, and
  Q-learning and linear TD under Markovian sampling by a Lyapunov argument.
- [FormalML](https://github.com/IBM/FormalML) (Coq, Apache-2.0) contains CertRL (Vajjha, Shinnar,
  Trager, Pestun and Fulton 2021: value iteration, policy improvement, finite-horizon dynamic
  programming) and a formalization of Dvoretzky's theorem and of Tsitsiklis's and Jaakkola's
  stochastic approximation leading to Q-learning.
- The Isabelle Archive of Formal Proofs entries `MDP-Rewards` and `MDP-Algorithms` (Schäffeler and
  Abdulaziz) verify the Bellman equations, value iteration, policy iteration and modified policy
  iteration.
- [lean4-mlir](https://github.com/brettkoonce/lean4-mlir), whose author contributed this
  roadmap, trains DQN on Pong and AlphaZero and MuZero on tic-tac-toe; it contains no proofs on
  this material.

These are reference material, not the specification.

## References

- D. P. Bertsekas and J. N. Tsitsiklis, *Neuro-dynamic programming*, Athena Scientific, 1996.
- P. Dayan, *The convergence of TD(λ) for general λ*, Mach. Learn. **8** (1992), 341–362.
- A. Dvoretzky, *On stochastic approximation*, Proc. Third Berkeley Symp. Math. Statist. Prob.
  **1** (1956), 39–55.
- R. A. Howard, *Dynamic programming and Markov processes*, MIT Press, 1960.
- T. Jaakkola, M. I. Jordan and S. P. Singh, *On the convergence of stochastic iterative dynamic
  programming algorithms*, Neural Comput. **6** (1994), 1185–1201.
- S. Kakade and J. Langford, *Approximately optimal approximate reinforcement learning*, ICML
  2002.
- M. L. Puterman, *Markov decision processes: discrete stochastic dynamic programming*, Wiley,
  1994.
- S. P. Singh and R. C. Yee, *An upper bound on the loss from approximate optimal-value
  functions*, Mach. Learn. **16** (1994), 227–233.
- R. S. Sutton, *Learning to predict by the methods of temporal differences*, Mach. Learn. **3**
  (1988), 9–44.
- J. N. Tsitsiklis, *Asynchronous stochastic approximation and Q-learning*, Mach. Learn. **16**
  (1994), 185–202.
- A. Vajjha, A. Shinnar, B. Trager, V. Pestun and N. Fulton, *CertRL: formalizing convergence
  proofs for value and policy iteration in Coq*, CPP 2021.
- C. J. C. H. Watkins and P. Dayan, *Q-learning*, Mach. Learn. **8** (1992), 279–292.

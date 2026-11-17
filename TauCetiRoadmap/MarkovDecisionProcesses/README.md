# Roadmap: Markov decision processes, dynamic programming and Q-learning

**Summary.** Develop the theory of finite Markov decision processes with discounted reward. The
Bellman evaluation and optimality operators are monotone `γ`-contractions of the sup norm; their
fixed points are the value of a policy and the optimal value, and a policy that is greedy for the
optimal value is optimal among all history-dependent randomized policies, whose returns are defined
through the Ionescu-Tulcea trajectory law. The roadmap solves finite-horizon problems by backward
induction, proves the optimality of greedy policies, the policy improvement theorem and the
performance difference lemma, proves the convergence and error bounds of value iteration and
policy iteration, and characterizes the optimal value and the occupancy measures by a pair of
linear programs. It ends with stochastic approximation: Tsitsiklis's boundedness and convergence
theorems for asynchronous iterations, with delays, of a map that contracts towards its fixed point
in a weighted max norm under martingale-difference noise, and their consequences, the almost-sure
convergence of tabular Q-learning and of tabular TD(0).

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
- the scalar noise lemma with random step sizes, the boundedness and convergence theorems for
  asynchronous stochastic approximation, tabular Q-learning and tabular TD(0).

It consumes, and does not re-prove, the items listed under
[Exact supplier contracts](#exact-supplier-contracts).

Out of scope:

- countable and general state or action spaces, and measurable selection;
- average-reward and total-reward criteria, undiscounted problems, and constrained MDPs;
- partially observable MDPs, stochastic games, and optimal stopping as a separate theory;
- continuous-time control and the Hamilton–Jacobi–Bellman equation;
- function approximation, including linear TD with Markovian sampling, policy-gradient methods and
  sample-complexity bounds;
- asynchronous stochastic approximation of monotone maps that are not contractions (Tsitsiklis
  1994, Theorem 2), which serves undiscounted problems;
- general linear-programming duality: the two programs of Layer 5 are solved directly;
- the classification, stationary laws and convergence of Markov chains, which belong to
  MarkovChainsAndRenewal;
- the Robbins–Siegmund theorem and stochastic gradient descent, which belong to
  FirstOrderOptimization (its Layer 5); the noise lemma 6.1 is proved here with a stopped
  martingale and uses neither.

## Conventions

- `S` and `A` are nonempty finite types (`[Fintype S] [Nonempty S] [Fintype A] [Nonempty A]`).
  Where a measurable structure is needed it is the discrete one
  (`[MeasurableSpace S] [DiscreteMeasurableSpace S]`, and the same for `A`); decidable equality
  of `S` is assumed where the identity matrix on `S` occurs.
- A **finite MDP** is a structure `FiniteMDP S A` with fields `trans : S → A → PMF S` and
  `reward : S → A → ℝ`. Layers 1 to 5 use only the mean reward `reward s a`; Layer 6 allows
  sampled rewards with this mean.
- The **discount factor** is `γ : ℝ≥0`, coerced to `ℝ` inside the operators; every statement that
  needs `γ < 1` says so, and `ContractingWith` takes its constant in `ℝ≥0`.
- **Value functions** are `S → ℝ` with Mathlib's sup norm `‖v‖ = max_s |v s|`; Q-functions are
  `S × A → ℝ` with the same norm. The order on functions is pointwise.
- The letter `P` is reserved for probability measures (Layers 1 and 6); `R` is any real number
  with `|reward s a| ≤ R` for all `s`, `a`.
- **Policies.** A deterministic stationary policy is `π : S → A`; a randomized stationary policy
  is `π : S → PMF A`; a Markov policy is `π : ℕ → S → PMF A`; history-dependent randomized
  policies are defined in 1.1.
- **Operators.** `T^π` is the Bellman evaluation operator of a randomized stationary policy `π`
  and `T` the Bellman optimality operator; `V^π` and `V⋆` are the value of `π` and the optimal
  value; `P^π` is the transition matrix of `π` and `r^π s = Σ_a π s a · reward s a` its mean
  reward; `Q^π (s, a) = reward s a + γ M.expect V^π s a`. All are defined in 1.2.
- A randomized stationary `π` is **optimal** if `V^π = V⋆`.
- **Probability.** `(Ω, P)` is a probability space with filtration `ℱ : Filtration ℕ m₀`;
  conditional expectation is Mathlib's `P[· | ℱ n]`, and almost-sure statements are `∀ᵐ ω ∂P`.

## Exact supplier contracts

- Mathlib:
  - `ContractingWith`, `ContractingWith.fixedPoint_unique'` (two fixed points of a contraction are
    equal), `ContractingWith.tendsto_iterate_fixedPoint` (the iterates from any point converge to
    the fixed point, in a complete nonempty metric space), `ContractingWith.dist_fixedPoint_le`
    and `ContractingWith.apriori_dist_iterate_fixedPoint_le`
    (`Mathlib/Topology/MetricSpace/Contracting.lean`);
  - the sup norm on `S → ℝ` (`pi_norm_le_iff_of_nonneg`); `Matrix.linftyOpNormedRing`
    (`Mathlib/Analysis/Matrix/Normed.lean`), a `def` used as a local instance;
    `NormedRing.inverse_one_sub` (`Mathlib/Analysis/Normed/Ring/Units.lean`): in a normed ring
    with summable geometric series, `‖t‖ < 1` gives `Ring.inverse (1 − t) = (1 − t)⁻¹` as a unit;
  - `PMF`, `PMF.toMeasure`, `PMF.bind`, `Kernel`, `IsMarkovKernel`, `Kernel.ofFunOfCountable`
    and `Kernel.compProd`;
  - `Kernel.traj`, `Kernel.trajMeasure`, `Kernel.integral_traj_partialTraj` (for `a ≤ b` and `f`
    integrable for `traj κ a x₀`) and `Kernel.condDistrib_trajMeasure` (for a probability measure
    `μ₀` and `X (a + 1)` standard Borel and nonempty, the conditional law of the coordinate
    `a + 1` given the coordinates up to `a` is `κ a`)
    (`Mathlib/Probability/Kernel/IonescuTulcea/Traj.lean`);
  - `condExp`, `Filtration`, `StronglyAdapted`, `Martingale`;
    `Submartingale.exists_ae_tendsto_of_bdd` (`Mathlib/Probability/Martingale/Convergence.lean`):
    on a finite measure, a submartingale with `eLpNorm (f n) 1 μ ≤ R` for all `n` converges almost
    everywhere; the stopping-time API `MeasureTheory.IsStoppingTime`,
    `MeasureTheory.stoppedProcess` (`Mathlib/Probability/Process/Stopping.lean`) and
    `MeasureTheory.hittingAfter` (`Mathlib/Probability/Process/HittingTime.lean`).
- Tau Ceti:
  - `TauCeti.Probability.markovChainLaw ν κ` (`TauCeti/Probability/Process/MarkovChain.lean`), the
    law on `ℕ → S` of the homogeneous Markov chain with initial law `ν` and Markov kernel `κ`;
    `MeasureTheory.Measure.eq_markovChainLaw` (same file): for finite `ν`, a measure on paths whose
    time-zero marginal is `ν` and whose prefix laws satisfy the one-step recursion with `κ` is
    `markovChainLaw ν κ`; `MeasureTheory.Measure.markovChainLaw_map_eval` (same file): the state
    at time `n` has law `(κ ^ n) ∘ₘ ν`;
  - `MeasureTheory.Measure.condExp_shift_iterate_markovChainLaw`
    (`TauCeti/Probability/MarkovChain/MarkovProperty.lean`): for finite `ν` and `f` integrable for
    `markovChainLaw ((κ ^ n) ∘ₘ ν) κ`, the conditional expectation of `f` of the path shifted by
    `n`, given the first `n + 1` coordinates, is `∫ f ∂(markovChainLaw (dirac (x n)) κ)`;
  - `Kernel.ofPMF` and `Kernel.ofPMF_apply` (`TauCeti/Probability/Kernel/PMF.lean`), the Markov
    kernel of a family of `PMF`s on a countable space; `Kernel.toMatrix`, `Kernel.toMatrix_pow`
    and `Kernel.comp_apply_singleton_eq_vecMul` (`TauCeti/Probability/Kernel/Matrix.lean`): the
    `ℝ≥0`-valued transition matrix of a kernel on a finite type, its compatibility with powers,
    and propagation of an initial law as a row-vector product.

## How to read the build

Layer 1 constructs the trajectory law of a policy and the Bellman operators and identifies the
value of a stationary policy with its expected return. Layer 2 solves the finite-horizon problem,
which Layer 3 uses, with the tail bound of Layer 1, to prove that the fixed point of the optimality
operator dominates every policy; Layer 3 also contains the Q-function, policy improvement and the
performance difference lemma. Layer 4 gives the rates of value iteration and policy iteration and
Layer 5 the two linear programs; both use Layers 1 and 3 only. Layer 6 proves the
stochastic-approximation theorems from Mathlib's martingale convergence alone and applies them to
the operators of 1.2 and 3.2. Each numbered target ends with **Checks** and a *Needs:* line, and
every claim carries a source locator in parentheses or says that it is proved here.

## Layer 1: MDPs, policies and Bellman operators

### 1.1 Policies and trajectories

Define the structure `FiniteMDP` of the [Conventions](#conventions). Define a **history-dependent
randomized policy** as a structure `HistoryPolicy S A` with a kernel `first : Kernel S A` choosing
the action at time `0` from the initial state, kernels
`next n : Kernel ((Π i : Iic n, S × A) × S) A` choosing the action at time `n + 1` from the
history up to time `n` and the state at time `n + 1`, and the proofs `isMarkovKernel_first` and
`isMarkovKernel_next` that these are Markov kernels. For a Markov policy `π`, `ofMarkov π` has
`first s = π 0 s` and `next n (h, s') = π (n + 1) s'`, each `PMF` read as a measure by
`PMF.toMeasure` and the family made a kernel by `Kernel.ofFunOfCountable`; for a randomized
stationary `π`, `ofStationary π = ofMarkov (fun _ ↦ π)`.

Let `transKernel : Kernel (S × A) S` be the kernel `(s, a) ↦ (trans s a).toMeasure`, and for a
randomized stationary `π` let `stationaryKernel π : Kernel S S` be the kernel
`s ↦ ((π s).bind (trans s)).toMeasure`, whose mass at `s'` is `Σ_a π s a · trans s a s'`. Both
are Markov kernels (`isMarkovKernel_transKernel`, `isMarkovKernel_stationaryKernel`) and agree
row by row with Tau Ceti's `Kernel.ofPMF` of the same families (`Kernel.ofPMF_apply`), so the
Tau Ceti lemmas on `Kernel.ofPMF` and `Kernel.toMatrix` apply to them.

For `π : HistoryPolicy S A` and `s : S`, the **trajectory law**
`trajLaw M π s : Measure (ℕ → S × A)` is `Kernel.trajMeasure μ₀ κ` with `X n = S × A`, initial law
`μ₀ = Measure.dirac s ⊗ₘ π.first`, and
`κ n = (transKernel.comap (fun h ↦ h ⟨n, _⟩)) ⊗ₖ π.next n` (`Kernel.compProd`): from the history
up to time `n` the next state is drawn from `trans sₙ aₙ`, and the next action from `π.next n`
applied to the history and that state. Define the **expected discounted return**
`expectedReturn M γ π s = ∫ ω, Σ' n, γ ^ n * reward (ω n).1 (ω n).2 ∂(trajLaw M π s)` and the
**`N`-step return with terminal value `g`**, `finiteReturn M γ N g π s`, the integral against
`trajLaw M π s` of `Σ_{n<N} γ ^ n * reward (ω n).1 (ω n).2 + γ ^ N * g (ω N).1`. Prove that:

- `trajLaw M π s` is a probability measure under which the state at time `0` is `s`, the action
  at time `0` has law `π.first s`, and the state at time `n + 1` has conditional law
  `trans sₙ aₙ` given the history up to time `n` (`Kernel.condDistrib_trajMeasure`);
- for a randomized stationary `π`, the state process under `trajLaw M (ofStationary π) s` has law
  `markovChainLaw (dirac s) (stationaryKernel π)` (`trajLaw_ofStationary`), by
  `MeasureTheory.Measure.eq_markovChainLaw`;
- for `γ < 1`, the integrand of `expectedReturn` is measurable and bounded by `R / (1 − γ)`, so
  `|expectedReturn M γ π s| ≤ R / (1 − γ)`, and the **tail bound**
  `|expectedReturn M γ π s − finiteReturn M γ N 0 π s| ≤ γ^N R / (1 − γ)` holds for every `N`
  (`abs_expectedReturn_sub_finiteReturn_le`).

(Puterman 1994, Sections 2.1.6 and 5.3, for the construction and the discounted criterion; the
statements are proved here.)

**Checks.**

- A one-state MDP with `reward = c` constant: `expectedReturn M γ π s = c / (1 − γ)` for every
  policy and `γ < 1`, and `finiteReturn M γ N 0 π s = c (1 − γ^N) / (1 − γ)`.
- `N = 0`: `finiteReturn M γ 0 g π s = g s`, which fixes the initial state as `s`; at `N = 0` the
  tail bound is the bound on `expectedReturn`.
- `γ = 0`: `expectedReturn M 0 π s = Σ_a (π.first s {a}) · reward s a`, with `0 ^ 0 = 1`.
- Two states, one action, `trans s a = pure (swap s)`: the state process alternates, and
  `finiteReturn M γ N g π s = Σ_{n<N} γ^n reward (swap^n s) a + γ^N g (swap^N s)`.
- `S = A` with two elements and `trans s a = pure a`: under `ofMarkov π` for a deterministic
  Markov `π`, the state at time `n + 1` is the action at time `n`, and the action at time `n + 1`
  is `π (n + 1)` of that state; a kernel `next n` built from `π n` would repeat the rule of time
  `0` at time `1`.
- `stationaryKernel (ofDet d) s = (trans s (d s)).toMeasure`, and every row of
  `stationaryKernel π` has total mass `1`.

*Needs:* Mathlib `PMF.toMeasure`, `PMF.bind`, `Kernel.ofFunOfCountable`, `Kernel.compProd`,
`Kernel.trajMeasure`, `Kernel.condDistrib_trajMeasure`; Tau Ceti `markovChainLaw`,
`MeasureTheory.Measure.eq_markovChainLaw` (for `trajLaw_ofStationary` only).

### 1.2 Bellman operators

Define the expected next value `M.expect v s a = Σ_{s'} (trans s a s').toReal * v s'` (`expect`);
the operators `T^π v s = Σ_a π s a · (reward s a + γ M.expect v s a)` (`bellmanEval`) and
`T v s = max_a (reward s a + γ M.expect v s a)` (`bellman`); the values
`V^π = lim_k (T^π)^k 0` (`value`) and `V⋆ = lim_k T^k 0` (`optimalValue`), limits in `S → ℝ`;
`ofDet π = fun s ↦ PMF.pure (π s)`; the predicate `IsGreedy γ v π`, saying that `π s` maximizes
`a ↦ reward s a + γ M.expect v s a` for every `s`; and the matrix
`P^π s s' = Σ_a π s a · trans s a s'` (`policyMatrix`). Prove, for every randomized stationary
`π`:

- `T^π v = r^π + γ P^π v`; `T^π` and `T` are monotone, and `T (v + c) = T v + γ c` and
  `T^π (v + c) = T^π v + γ c` for a constant `c`;
- `policyMatrix π` is row-stochastic and is the real coercion of
  `(stationaryKernel π).toMatrix` (Tau Ceti `Kernel.toMatrix`);
- for `γ < 1`, `T` and `T^π` are `ContractingWith γ` on `S → ℝ` with the sup norm
  (`contractingWith_bellman`, `contractingWith_bellmanEval`); hence the two limits exist, `V^π`
  is the unique fixed point of `T^π` (`bellmanEval_value`, the policy evaluation equation) and
  `V⋆` is the unique fixed point of `T` (`bellman_optimalValue`, the Bellman optimality
  equation), by `ContractingWith.tendsto_iterate_fixedPoint` and
  `ContractingWith.fixedPoint_unique'`;
- for `γ < 1`, `‖V^π‖ ≤ R / (1 − γ)` (`norm_value_le`), and likewise `‖V⋆‖ ≤ R / (1 − γ)`;
- for `γ < 1`, `V^π = (1 − γ P^π)⁻¹ r^π`, the inverse being `Ring.inverse` in the matrix ring and
  given by the Neumann series in the normed ring `Matrix.linftyOpNormedRing`, in which
  `‖γ P^π‖ = γ` (`value_eq_inverse`);
- every `v` has a greedy policy, and `T^(ofDet π) v = T v` if and only if `π` is greedy for `v`.

(Puterman 1994, Theorem 6.1.1 for the evaluation equation and the inverse, Proposition 6.2.4 for
the contractions and Theorem 6.2.5 for the optimality equation; proved here.)

**Checks.**

- `M.expect 1 s a = 1`, and `trans s a = pure s'` gives `M.expect v s a = v s'`.
- `γ = 0`: `T v s = max_a reward s a` for every `v`, `V⋆ = T 0` and `V^π = r^π`.
- The contraction constant is exactly `γ` on a one-state, one-action MDP:
  `T v − T w = γ (v − w)`; there `V^π = V⋆ = reward / (1 − γ)`.
- `γ = 1` on that MDP with reward `1`: `T^k 0 = k` has no limit, so `optimalValue` is defined for
  every `γ` but is meaningful only for `γ < 1`, which every statement about it assumes.
- `T^π ≤ T` pointwise; on the two-state MDP with `trans s a = pure a` and
  `reward s a = if a = 1 then 1 else 0`, the only policy greedy for `v = 0` is `π s = 1`, while
  for a constant reward and `γ = 0` every policy is greedy for every `v`.
- `policyMatrix (ofDet d) s s' = trans s (d s) s'`; on the alternating two-state chain it is the
  permutation matrix of the swap, and `(1 − γ P^π)⁻¹` has rows `(1, γ)/(1 − γ²)` and
  `(γ, 1)/(1 − γ²)`.

*Needs:* Mathlib `ContractingWith`, `ContractingWith.tendsto_iterate_fixedPoint`,
`ContractingWith.fixedPoint_unique'`, `pi_norm_le_iff_of_nonneg`; for `value_eq_inverse` also
`Matrix.linftyOpNormedRing` and `NormedRing.inverse_one_sub`; for the coercion of
`Kernel.toMatrix`, 1.1.

### 1.3 Values of stationary policies

Prove that for `γ < 1`, every randomized stationary `π` and every `s`,
`expectedReturn M γ (ofStationary π) s = V^π s` (`expectedReturn_eq_value`): by 1.1 the action at
time `n` has conditional law `π sₙ` given the states, so the return is the expectation of
`Σ' n, γ^n r^π (sₙ)` under `markovChainLaw (dirac s) (stationaryKernel π)`, and the Markov
property at time `1` shows that this function of `s` is a fixed point of `T^π`. (Puterman 1994,
Theorem 6.1.1; proved here.)

**Checks.**

- One state, one action, reward `c`: both sides are `c / (1 − γ)`.
- A two-state chain alternating deterministically with rewards `1, 0`:
  `V^π = (1/(1 − γ²), γ/(1 − γ²))`.
- `γ = 0`: both sides are `r^π s`.

*Needs:* 1.1, 1.2; Tau Ceti `MeasureTheory.Measure.condExp_shift_iterate_markovChainLaw`.

### Examples

A one-state MDP, the deterministic two-state alternation, and the two-state, two-action MDP with
`trans s a = pure a` (the action chooses the next state).

### Dependencies

Layer 1 uses Mathlib's kernels, `PMF`, the Ionescu-Tulcea construction and contractions, and
Tau Ceti's `markovChainLaw` with its uniqueness and Markov property.

## Layer 2: finite horizon

### 2.1 Backward induction

For every `γ : ℝ≥0` (also `γ ≥ 1`), every horizon `N` and every terminal value `g : S → ℝ`, prove
(`backwardInduction`) that `finiteReturn M γ N g π s ≤ T^N g s` for every history-dependent
randomized policy `π` and every `s`, and that for every deterministic Markov policy `π` such that
`π n` is greedy for `T^(N−n−1) g` at each time `n < N`, the policy
`ofMarkov (fun n ↦ ofDet (π n))` has `finiteReturn` equal to `T^N g s` from every `s`. Such a
policy exists, so `T^N g s` is the largest `N`-step return. The proof is by induction on `N`,
using `Kernel.integral_traj_partialTraj` to split the trajectory after the first step.
(Puterman 1994, Theorem 4.5.1; proved here.)

**Checks.**

- `N = 0`: `T^0 g = g = finiteReturn M γ 0 g π` for every policy.
- `N = 1`: `T g s = max_a (reward s a + γ M.expect g s a)`, attained by a first action greedy
  for `g`.
- On the two-state MDP with `trans s a = pure a` and `reward s a = if a = 1 then 1 else 0`, take
  `γ = 1`, `N = 2` and `g = (2, 0)`: `T g = 2` and `T² g = 3` at both states, attained by the
  action `1` at time `0` (greedy for `T g`) and the action `0` at time `1` (greedy for `g`);
  indexing the greedy rules by `T^n g` in place of `T^(N−n−1) g` plays `0` then `1` and
  returns `1`.

*Needs:* 1.1, 1.2; Mathlib `Kernel.integral_traj_partialTraj`.

### Examples

A two-period inventory problem with three stock levels and the actions "order" and "do not
order", solved by two steps of backward induction.

### Dependencies

Layer 2 uses Layer 1.

## Layer 3: optimality

### 3.1 Optimal policies

For `γ < 1`, prove:

- for every history-dependent randomized `π` and every `s`, `expectedReturn M γ π s ≤ V⋆ s`
  (`expectedReturn_le_optimalValue`): by the tail bound of 1.1 and by 2.1,
  `expectedReturn M γ π s ≤ T^N 0 s + γ^N R/(1 − γ)`, which tends to `V⋆ s`;
- every deterministic stationary `π` greedy for `V⋆` has `V^(ofDet π) = V⋆`
  (`value_eq_optimalValue_of_isGreedy`), and such a `π` exists;
- hence `V⋆ s` is the largest value of `expectedReturn M γ π s` over all history-dependent
  randomized policies (`optimalValue_eq_iSup_expectedReturn`), attained at every `s` by
  `ofStationary (ofDet π)` for one deterministic stationary `π`, and every randomized stationary
  `π` has `V^π ≤ V⋆` (`value_le_optimalValue`);
- a deterministic stationary `π` is optimal if and only if it is greedy for `V^(ofDet π)`, and
  if and only if it is greedy for `V⋆`.

(Puterman 1994, Theorems 6.2.2, 6.2.6, 6.2.7 and 6.2.10; proved here.)

**Checks.**

- The two-state MDP with `trans s a = pure a` and `reward s a = if a = 1 then 1 else 0`:
  `V⋆ = (1/(1 − γ), 1/(1 − γ))`, attained by `π s = 1`.
- For `0 < γ`, the Markov policy that alternates the actions `1, 0, 1, …` does worse there: its
  return is `1/(1 − γ²) < 1/(1 − γ)`.
- `γ = 0`: the optimal deterministic policies are the maximizers of `reward s ·` at every `s`.

*Needs:* 1.1, 1.2, 1.3, 2.1.

### 3.2 Q-functions

Define `Q⋆ (s, a) = reward s a + γ M.expect V⋆ s a` (`optimalQ`) and the operator
`H q (s, a) = reward s a + γ Σ_{s'} trans s a s' · max_b q (s', b)` (`qBellman`). For `γ < 1`,
prove that `V⋆ s = max_a Q⋆ (s, a)`, that `H` is `ContractingWith γ` on `S × A → ℝ`
(`contractingWith_qBellman`) with unique fixed point `Q⋆` (`qBellman_optimalQ`), and that a
deterministic `π` is optimal if and only if `π s` maximizes `a ↦ Q⋆ (s, a)` for every `s`.
(Watkins and Dayan 1992, Section 2, for `Q⋆` and its equation; Tsitsiklis 1994, Section 7, for the
contraction; proved here.)

**Checks.**

- One state, one action, reward `c`: `Q⋆ = c / (1 − γ)`.
- `H (q + c) = H q + γ c` for a constant `c`, and `H q (s, a) = reward s a + γ M.expect v s a`
  with `v s' = max_b q (s', b)`.
- `γ = 0`: `H q = reward` for every `q`, and `Q⋆ = reward`.
- On the two-state MDP of 3.1, `Q⋆ (s, 1) = 1/(1 − γ)` and `Q⋆ (s, 0) = γ/(1 − γ)`: the gap
  between the two actions is `1`.

*Needs:* 1.2, 3.1.

### 3.3 Policy improvement and performance difference

Define the **discounted occupancy measure**
`occupancy M γ π s = (1 − γ) e_s (1 − γ P^π)⁻¹`, a row vector indexed by `S`. For `γ < 1` and
randomized stationary `π`, `π'`, prove:

- **policy improvement** (`value_le_of_improve`): if `T^(π') V^π ≥ V^π` then `V^(π') ≥ V^π`, and
  `V^(π') s > V^π s` at every state `s` where `T^(π') V^π s > V^π s`;
- `occupancy M γ π s` is a probability vector on `S`, and its entry at `s'` is
  `(1 − γ) Σ_n γ^n` times the probability that the state at time `n` is `s'` under
  `trajLaw M (ofStationary π) s`;
- **performance difference** (`performanceDifference`):
  `V^(π') s − V^π s = 1/(1 − γ) Σ_{s'} occupancy M γ π' s s' Σ_a π' s' a · (Q^π (s', a) − V^π s')`.

(Howard 1960, Chapter 7, and Puterman 1994, Proposition 6.4.1, for policy improvement; Kakade and
Langford 2002, Lemma 6.1, for the performance difference; proved here.)

**Checks.**

- `π' = π`: the right side is `0`, since `Σ_a π s a Q^π (s, a) = V^π s`.
- `γ = 0`: `occupancy M 0 π s = e_s` and the identity reads `r^(π') s − r^π s`.
- On the alternating two-state chain,
  `occupancy M γ π s₀ = ((1 − γ)/(1 − γ²), γ(1 − γ)/(1 − γ²))`, which sums to `1`; without the
  factor `1 − γ` the sum would be `1/(1 − γ)`.
- On the two-state MDP of 3.1 with `π s = 0` and `π' s = 1`: `V^π = 0`, `V^(π') = 1/(1 − γ)`,
  and the right side is `1/(1 − γ) · 1`.

*Needs:* 1.2 for policy improvement and the performance difference; for the description of
`occupancy` by the trajectory law, also 1.1 and Tau Ceti
`MeasureTheory.Measure.markovChainLaw_map_eval`, `Kernel.toMatrix_pow` and
`Kernel.comp_apply_singleton_eq_vecMul`.

### Examples

The two-action MDP of 3.1, and a three-state chain where the greedy policy for `V^π` improves `π`
strictly at one state.

### Dependencies

Layer 3 uses Layers 1 and 2.

## Layer 4: value iteration and policy iteration

### 4.1 Value iteration

Let `γ < 1` and `v_k = T^k v₀`. By 1.2, Mathlib's `ContractingWith.dist_fixedPoint_le` and
`ContractingWith.apriori_dist_iterate_fixedPoint_le` give `‖v_k − V⋆‖ ≤ γ^k ‖v₀ − T v₀‖/(1 − γ)`
and `‖v_k − V⋆‖ ≤ γ/(1 − γ) ‖v_k − v_{k−1}‖` for `k ≥ 1`, and `‖v_k − V⋆‖ ≤ γ^k ‖v₀ − V⋆‖`
follows from the Lipschitz bound. Prove:

- **greedy suboptimality** (`value_greedy_le`): if `π` is greedy for `v`, then
  `‖V^(ofDet π) − V⋆‖ ≤ 2γ/(1 − γ) ‖v − V⋆‖`;
- there is `k₀` such that every policy greedy for `v_k` with `k ≥ k₀` is optimal
  (`eventually_optimal_greedy_valueIteration`): an action `a` with `Q⋆ (s, a) < V⋆ s` stops being
  greedy at `s` once `2γ ‖v_k − V⋆‖` is below the least positive gap `V⋆ s − Q⋆ (s, a)`.

(Puterman 1994, Theorem 6.3.1, for the rate and the stopping bound; Singh and Yee 1994, Main
Theorem, for the greedy bound; the last item is proved here.)

**Checks.**

- `v₀ = V⋆`: `v_k = V⋆` for every `k`.
- `γ = 0`: `v₁ = V⋆` from any `v₀`, and the greedy bound is `0`.
- `v = V⋆`: the greedy bound is `0`, and every greedy policy is optimal, as in 3.1.
- On the two-state MDP of 3.1 with `v₀ = 0`: `v_k = (1 − γ^k)/(1 − γ)` at both states,
  `‖v_k − V⋆‖ = γ^k/(1 − γ)`, and every `v_k` already has the optimal policy as its only greedy
  policy, so `k₀ = 0`.

*Needs:* 1.2, 3.1; for the last item also 3.2; Mathlib
`ContractingWith.apriori_dist_iterate_fixedPoint_le`, `ContractingWith.dist_fixedPoint_le`.

### 4.2 Policy iteration

Let `γ < 1` and let `π_k` be deterministic stationary policies with `π_{k+1}` greedy for
`V^(π_k)` for every `k`. Prove that `V^(π_{k+1}) ≥ V^(π_k)`, and that
`‖V^(π_k) − V⋆‖ ≤ γ^k ‖V^(π₀) − V⋆‖` (`policyIteration_rate`). If moreover
`π_{k+1} s = π_k s` at every state `s` where `π_k s` is itself a maximizer, prove that
`π_{k+1} = π_k` and `π_k` is optimal for every `k ≥ |A|^|S|` (`policyIteration_terminates`): the
values increase strictly until an optimal policy is reached, so the policies before it are
distinct, and an optimal policy is greedy for its own value.

(Howard 1960, Chapter 7; Puterman 1994, Proposition 6.4.1 and Theorems 6.4.2 and 6.4.6; proved
here.)

**Checks.**

- If `π₀` is optimal, `π₁ = π₀` by the tie-breaking rule; without the rule, two optimal policies
  may alternate forever, with constant value.
- `|S| = |A| = 1`: the sequence is constant from the start, and `|A|^|S| = 1`.
- The rate is the value-iteration rate: `V⋆ ≥ V^(π_k) ≥ T^k V^(π₀)`.
- On the two-state MDP of 3.1 from `π₀ s = 0`: `π₁ s = 1` is optimal after one step, within the
  bound `|A|^|S| = 4`.

*Needs:* 1.2, 3.1, 3.3.

### Examples

Value iteration and policy iteration on the two-state, two-action MDP of 3.1.

### Dependencies

Layer 4 uses Layers 1 and 3.

## Layer 5: linear programs

### 5.1 The primal program

Let `γ < 1`. Prove that every `v : S → ℝ` with `v s ≥ reward s a + γ M.expect v s a` for all `s`,
`a` satisfies `v ≥ V⋆` (`optimalValue_le_of_feasible`), and hence that for every `μ : S → ℝ` with
`μ s > 0` for all `s`, `V⋆` is the unique minimizer of `Σ_s μ s v s` over this set
(`optimalValue_isLeast_primal`). (Puterman 1994, Theorem 6.2.2(a) and Section 6.9.1; proved
here.)

**Checks.**

- `v = V⋆` is feasible, by the Bellman equation.
- `v = R/(1 − γ)` constant is feasible.
- `μ s₁ = 0` at a state `s₁` that no other state reaches: raising `v s₁` keeps `v` feasible and
  the objective unchanged, so uniqueness needs `μ > 0`.

*Needs:* 1.2.

### 5.2 The dual program and occupancy measures

For `μ : S → ℝ`, say that `x : S × A → ℝ` is a **feasible occupancy** (`IsFeasibleOccupancy`) if
`x ≥ 0` and `Σ_a x (s', a) − γ Σ_{s,a} trans s a s' · x (s, a) = μ s'` for every `s'`. For a
randomized stationary `π`, define the **state-action occupancy** `x^π` (`stateActionOccupancy`)
by `x^π (s, a) = (Σ_{s₀} μ s₀ · occupancy M γ π s₀ s / (1 − γ)) · π s a`. For `γ < 1`, prove:

- `x^π` satisfies the equality constraints for every `μ`, and for `μ ≥ 0` it is a feasible
  occupancy (`isFeasibleOccupancy_stateActionOccupancy`);
- every feasible occupancy `x`, for any `μ`, is `x^π` for the policy
  `π s a = x (s, a) / Σ_b x (s, b)`, with any distribution at the states where the denominator
  is `0` (`exists_eq_stateActionOccupancy`);
- `Σ_{s,a} reward s a · x^π (s, a) = Σ_s μ s V^π s` for every `μ` and `π`
  (`stateActionOccupancy_reward`);
- `Σ_{s,a} reward s a · x (s, a) ≤ Σ_s μ s V⋆ s` for every feasible occupancy `x`
  (`occupancy_reward_le`), with equality for `x^π` when `π` is optimal, so for `μ ≥ 0` the two
  programs have the same value.

The inequality is weak duality: `Σ x · reward ≤ Σ x · (V⋆ − γ M.expect V⋆) = Σ μ V⋆`.
(Puterman 1994, Theorems 6.9.1 and 6.9.4, stated there for positive `μ`; proved here.)

**Checks.**

- `Σ_{s,a} x (s, a) = (Σ_s μ s)/(1 − γ)` for every feasible `x`, by summing the constraint over
  `s'`; it is `1/(1 − γ)` for a probability vector `μ`.
- One state, one action, `μ = 1`: the only feasible occupancy is `x = 1/(1 − γ)`, and both
  programs have value `reward/(1 − γ)`.
- `γ = 0`: `x^π (s, a) = μ s · π s a`, and the constraint reads `Σ_a x (s', a) = μ s'`.
- `μ` with a negative entry `μ s' < 0` at a state `s'` that no state reaches: no `x ≥ 0` is
  feasible, and `x^π (s', a) = μ s' π s' a` is negative, so feasibility of `x^π` needs `μ ≥ 0`.
- On the two-state MDP of 3.1 with `μ = (1/2, 1/2)` and `π s = 1`: `x^π (1, 1) = 1/2 + γ/(1 − γ)`,
  `x^π (0, 1) = 1/2`, and the reward is `1/(1 − γ) = Σ μ V⋆`.

*Needs:* 1.2, 3.1, 3.3.

### Examples

The two programs on the two-state, two-action MDP of 3.1.

### Dependencies

Layer 5 uses Layers 1 and 3.

## Layer 6: stochastic approximation and Q-learning

### 6.1 The scalar noise lemma

Let `α t`, `w t`, `B t` and `W t` be real functions on `Ω` such that `α` is adapted to `ℱ` with
`0 ≤ α t ≤ 1`; `w t` is `ℱ (t+1)`-measurable and square-integrable with `P[w t | ℱ t] = 0` and
`P[(w t)² | ℱ t] ≤ B t` almost surely; `sup_t B t < ∞`, `Σ_t α t = ∞` and `Σ_t (α t)² < ∞`
almost surely; and `W (t+1) = (1 − α t) W t + α t w t` for all `t`. Then `W t → 0` almost surely
(`ae_tendsto_zero_noise`). Nothing is assumed of `W 0` or of the measurability of `B`.

The proof replaces `B t` by the `ℱ t`-measurable function `P[(w t)² | ℱ t]` and, for each `k`,
stops the martingale `Σ_{s<t} α s · w s` at the first `t` at which this function or
`Σ_{s≤t} (α s)²` exceeds `k` (`MeasureTheory.hittingAfter`, `MeasureTheory.stoppedProcess`); the
stopped martingale is bounded in `L²` by `k²`, so it converges almost surely, and the stopping
times are eventually infinite. A summation by parts then gives `W t → 0` on the event where the
series converges and `Σ_t α t = ∞`. (Tsitsiklis 1994, Lemma 1, where `Σ_t (α t)²` is bounded by a
constant; proved here.)

**Checks.**

- `w = 0`: `W t = Π_{s<t} (1 − α s) W 0 → 0` because `Σ α = ∞`.
- `α t = 1/(t + 1)`: `W t` is the running average of `w 0, …, w (t−1)` for `t ≥ 1`, whatever
  `W 0` is, and the lemma is the strong law for martingale differences of bounded conditional
  variance.
- `α t = 1` for all `t` violates `Σ α² < ∞`, and then `W (t+1) = w t`, which does not tend to `0`
  for independent signs `w t = ±1`.
- `α t = 1/(t + 1)²` violates `Σ α = ∞`, and with `w = 0` the limit is
  `W 0 · Π_t (1 − α t) = 0` only because `α 0 = 1`; with `α t = 1/(t + 2)²` the limit is
  `W 0 / 2`.

*Needs:* Mathlib `Martingale`, `Submartingale.exists_ae_tendsto_of_bdd`, `condExp`,
`MeasureTheory.hittingAfter`, `MeasureTheory.stoppedProcess`.

### 6.2 Asynchronous stochastic approximation

Let `ι` be a nonempty finite type. For `ξ : ι → ℝ` with `ξ i > 0`, define
`‖x‖_ξ = max_i |x i| / ξ i` (`weightedMaxNorm`). For `F : (ι → ℝ) → (ι → ℝ)`, processes
`x t`, `α t`, `w t : Ω → ι → ℝ`, delays `τ t i j : Ω → ℕ` and constants `A`, `B`, the predicate
`IsAsyncSA P ℱ F x α w τ A B` says that:

- `x` and `α` are adapted to `ℱ` (fields `adapted_x`, `adapted_step`), `0 ≤ α t i ≤ 1`
  (`step_mem`), and `Σ_t α t i = ∞` and `Σ_t (α t i)² < ∞` almost surely for every `i`
  (`step_not_summable`, `step_sq_summable`);
- `τ t i j ≤ t` (`delay_le`), and `τ t i j → ∞` as `t → ∞` almost surely for all `i`, `j`
  (`delay_tendsto`);
- `w t` is `ℱ (t+1)`-measurable (`measurable_noise`), each `w t i` is square-integrable
  (`memLp_noise`), `P[w t i | ℱ t] = 0` (`condExp_noise`) and
  `P[(w t i)² | ℱ t] ≤ A + B max_{s ≤ t} ‖x s‖²` almost surely, with the sup norm of `ι → ℝ`
  (`condExp_noise_sq`);
- `x (t+1) i = x t i + α t i · (F (x^i t) i − x t i + w t i)` for all `t` and `i` (`update`),
  where `x^i t = fun j ↦ x (τ t i j) j` is the vector of delayed coordinates seen by
  coordinate `i`.

The process `x` is adapted as soon as `x 0` is `ℱ 0`-measurable, `F` is Borel and every
`τ t i j` is `ℱ t`-measurable. Prove, for `β < 1`:

- **boundedness** (`ae_bddAbove_asyncSA`): if `‖F x‖_ξ ≤ β ‖x‖_ξ + D` for all `x`, then
  `sup_t ‖x t‖ < ∞` almost surely;
- **convergence** (`ae_tendsto_asyncSA`): if `‖F x − x⋆‖_ξ ≤ β ‖x − x⋆‖_ξ` for all `x`, then
  `x t → x⋆` almost surely. A map with `‖F x − F y‖_ξ ≤ β ‖x − y‖_ξ` satisfies this at its fixed
  point `x⋆`.

Both proofs use 6.1. Boundedness: with `G t = max 1 (max_{s ≤ t} ‖x s‖_ξ)`, which is
`ℱ t`-measurable, the normalized noise `w t i / G t` has conditional variance bounded by a
constant, and a comparison of `x` with the averaged normalized noise between the times at which
`G` grows by a fixed factor shows that `G` grows only finitely often. Convergence: the second
hypothesis implies the first with `D = (1 + β) ‖x⋆‖_ξ`, so `x` is bounded, 6.1 applies with
`B t = A + B max_{s ≤ t} ‖x s‖²`, and from boxes `‖x t − x⋆‖_ξ ≤ D_k` holding from a random time
on, the delays exceeding that time eventually, one obtains the box `D_{k+1} = (β + ε) D_k` with
`β + ε < 1`. (Tsitsiklis 1994, Theorems 1 and 3, where `Σ_t (α t i)²` is bounded by a constant;
Bertsekas and Tsitsiklis 1996, Proposition 4.4, for step sizes that are square-summable almost
surely; proved here.)

**Checks.**

- `ξ = 1`: `weightedMaxNorm 1 x = ‖x‖`; `weightedMaxNorm ξ ξ = 1`; and replacing `ξ` by `c ξ`
  with `c > 0` divides the norm by `c`.
- `τ t i j = t`, `w = 0` and `α t i = 1`: the iteration is `x (t+1) = F (x t)`, which converges
  for a contraction although `Σ α² = ∞` puts it outside the hypotheses.
- `F` constant equal to `c`: `x⋆ = c`, `β = 0`, and each coordinate of `x − c` is the averaging
  of 6.1.
- `β = 1` fails for convergence: `F = id` satisfies the hypothesis at every `x⋆` with `β = 1`,
  and with `α t = 1/(t + 1)` and independent signs `w t = ±1` the limit of `x t` is a
  non-constant random variable.
- `β = 1` fails for boundedness: `ι` a point, `F x = x + 1`, `D = 1`, `w = 0` gives
  `x (t+1) = x t + α t`, which is unbounded because `Σ α = ∞`.
- Delays that do not tend to infinity: `ι` a point, `F x = x/2`, `τ t = 0`, `w = 0`,
  `α t = 1/(t + 1)` and `x 0 = 1` give `x t = 1/2` for all `t ≥ 1`, not `x⋆ = 0`.

*Needs:* 6.1.

### 6.3 Q-learning

Let `γ < 1`. For every pair `(s, a)` and time `t` let `α t (s, a)` be a step size,
`snext t (s, a) : Ω → S` a sampled next state and `rew t (s, a) : Ω → ℝ` a sampled reward, such
that:

- `α` is adapted to `ℱ`, `0 ≤ α t (s, a) ≤ 1`, and `Σ_t α t (s, a) = ∞` and
  `Σ_t α t (s, a)² < ∞` almost surely for every `(s, a)`;
- `snext t (s, a)` and `rew t (s, a)` are `ℱ (t+1)`-measurable and `rew t (s, a)` is
  square-integrable;
- almost surely on the event `α t (s, a) ≠ 0`:
  `P(snext t (s, a) = s' | ℱ t) = trans s a s'` for every `s'`,
  `P[rew t (s, a) | ℱ t] = reward s a` and `P[rew t (s, a)² | ℱ t] ≤ C`.

Let `q 0` be deterministic and, for all `t` and `(s, a)`,

    q (t+1) (s, a) = q t (s, a)
      + α t (s, a) · (rew t (s, a) + γ max_b q t (snext t (s, a), b) − q t (s, a)).

Prove that `q t → Q⋆` almost surely (`qLearning_ae_tendsto`), and that when
`rew t (s, a) = reward s a` one has `‖q t‖ ≤ max ‖q 0‖ (R/(1 − γ))` for all `t`.

Learning along one trajectory is the case in which `ℱ t`-measurable pairs `(s t, a t)` are given,
`α t (s, a) = 0` unless `(s, a) = (s t, a t)`, and `snext t` and `rew t` do not depend on
`(s, a)`: the conditions on the event `α t (s, a) ≠ 0` then say that the next state has
conditional law `trans (s t) (a t)` and the reward conditional mean `reward (s t) (a t)`.

The iteration is 6.2 with `ι = S × A`, `F = qBellman`, `ξ = 1`, `β = γ`, no delays, and noise

    w t (s, a) = rew t (s, a) − reward s a
      + γ (max_b q t (snext t (s, a), b) − M.expect (fun s' ↦ max_b q t (s', b)) s a)

on the event `α t (s, a) ≠ 0` and `0` elsewhere. By induction `q t` is `ℱ t`-measurable and
square-integrable; the noise has conditional mean `0` because `S` is finite, and conditional
second moment at most `2C + 8γ² ‖q t‖²`. (Watkins and Dayan 1992, the Theorem of Section 2,
for bounded rewards and step sizes indexed by visits; Tsitsiklis 1994, Theorem 4(a); Jaakkola,
Jordan and Singh 1994, Theorem 2; proved here.)

**Checks.**

- A one-state, one-action MDP with `rew = c` and `α t = 1/(t + 1)`: `q` is deterministic and
  tends to `c / (1 − γ)`.
- `γ = 0` and `rew t (s, a) = reward s a`: `q t (s, a)` is a weighted average of `reward s a` and
  `q 0 (s, a)` tending to `reward s a`.
- `α t (s, a) = 0` for all `t` at one pair violates `Σ_t α t (s, a) = ∞`, and that entry stays at
  `q 0 (s, a)`.
- A sampled next state with the wrong law: on two states with `trans s a = pure a` and
  `reward s a = if s = 1 then 1 else 0`, one has `Q⋆ (0, 1) = γ/(1 − γ)`, but with
  `snext t (s, a) = s` always the entries `q t (0, a)` tend to `0`.

*Needs:* 3.2, 6.2.

### 6.4 Tabular TD(0)

Let `γ < 1` and let `π` be a randomized stationary policy. For every state `s` and time `t` let
`α t s`, `snext t s : Ω → S` and `rew t s : Ω → ℝ` satisfy the conditions of 6.3 with `s` in place
of `(s, a)`, the conditions on the event `α t s ≠ 0` being
`P(snext t s = s' | ℱ t) = P^π s s'`, `P[rew t s | ℱ t] = r^π s` and `P[(rew t s)² | ℱ t] ≤ C`.
Let `v 0` be deterministic and
`v (t+1) s = v t s + α t s · (rew t s + γ v t (snext t s) − v t s)`. Prove that `v t → V^π`
almost surely (`td0_ae_tendsto`), as 6.2 with `F = T^π`, `ξ = 1`, `β = γ`, no delays, and noise
`rew t s + γ v t (snext t s) − T^π (v t) s` on the event `α t s ≠ 0` and `0` elsewhere.

Evaluation along one trajectory is the case in which an action is drawn from `π (s t)` at the
`ℱ t`-measurable state `s t`, the next state from `trans (s t) (a t)`, `rew t = reward (s t) (a t)`
and `α t s = 0` unless `s = s t`. (Sutton 1988, Sections 2.3 and 6.4, for the iteration;
Jaakkola, Jordan and Singh 1994, Theorem 3, for almost-sure convergence on absorbing chains; the
discounted statement is proved here.)

**Checks.**

- One state, one action: the TD(0) and Q-learning iterations coincide.
- `γ = 0`: `v t s → r^π s`, the averaging of 6.1.
- A deterministic policy with deterministic transitions and `rew t s = r^π s`: the noise is `0`
  and the iteration is `v (t+1) s = (1 − α t s) v t s + α t s · T^π (v t) s`.
- On the alternating two-state chain with rewards `1, 0`, the limit is
  `(1/(1 − γ²), γ/(1 − γ²))`, as in 1.3.

*Needs:* 1.2, 6.2.

### Examples

Q-learning on the two-state, two-action MDP of 3.1 with `(s t, a t)` drawn independently and
uniformly and `α t (s, a) = 1/(number of visits to (s, a) up to time t)` at the visited pair, and
TD(0) on the alternating chain.

### Dependencies

Layer 6 uses 1.2, 3.2 and Mathlib's martingale and stopping-time theory.

## Downstream consumers

The finite-horizon results of 2.1 are the dynamic-programming principle for optimal stopping with
a stopping action. The theorems of 6.2 apply to any map that contracts towards its fixed point in
a weighted max norm, including the averaging iterations of distributed computation and the
dynamic-programming operators of stochastic shortest-path problems in which every policy is
proper.

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
- [lean4-mlir](https://github.com/brettkoonce/lean4-mlir) (Lean 4) trains DQN on Pong and
  AlphaZero and MuZero on tic-tac-toe; it contains no proofs on this material.

These are reference material, not the specification.

## References

- D. P. Bertsekas and J. N. Tsitsiklis, *Neuro-dynamic programming*, Athena Scientific, 1996.
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

# Roadmap: policy gradient methods for finite discounted Markov decision processes

**Summary.** This roadmap develops the exact, first-order theory of policy optimization in a
Markov decision process with finitely many states and actions and discount factor `0 ≤ γ < 1`.
The value of a policy is a smooth function of the policy's action probabilities, and of the
parameters of the softmax parametrization `π_θ(a | s) ∝ exp θ(s, a)`. The roadmap computes the
gradient of the value exactly, proves that the value is gradient dominated although it is not
concave, and analyses natural policy gradient, the gradient step preconditioned by the
pseudoinverse of the Fisher information matrix. Statements concern values, gradients and
parameter sequences defined by a recursion; nothing is sampled.

The headline theorems are these. Write `V^π(μ)` for the value of `π` averaged over a weight
vector `μ` on the states, `d^π_μ` for the discounted state-visitation vector and `A^π` for the
advantage.

- *The policy gradient theorem.* At every policy, the derivative of `V^π(μ)` with respect to the
  probability `π(a | s)` is `d^π_μ(s) Q^π(s, a) / (1 − γ)`; for the softmax parametrization, the
  derivative with respect to `θ(s, a)` is `d^π_μ(s) π(a | s) A^π(s, a) / (1 − γ)` at `π = π_θ`.
- *Gradient domination.* For policies `π` and `π'`, weight vectors `ρ ≥ 0` and `μ`, and
  `C ≥ 0` with `d^{π'}_ρ ≤ C μ` coordinatewise, `V^{π'}(ρ) − V^π(ρ)` is at most `C / (1 − γ)`
  times the largest directional derivative of `V^π(μ)` towards another policy. In the softmax
  parametrization, for `μ, ρ ≥ 0` and a deterministic `π'` with `d^{π'}_ρ ≤ C d^{π_θ}_μ`, the
  gap times `min_s π_θ(π'(s) | s)` is at most `√|S| · C` times the Euclidean norm of the
  gradient.
- *Natural policy gradient is multiplicative weights.* For a nonnegative weight vector `μ`, at
  every state `s` with `d^π_μ(s) > 0`, one natural policy gradient step with step size `η`
  multiplies `π(a | s)` by `exp(η A^π(s, a) / (1 − γ))` and renormalizes.
- *The convergence rate of natural policy gradient.* If rewards lie in `[0, 1]`, `ρ` is a
  probability vector and `η > 0`, the iterates started at `θ = 0` satisfy
  `V^{π'}(ρ) − V^{π_T}(ρ) ≤ log |A| / (η T) + 1 / ((1 − γ)² T)` for every policy `π'` and every
  `T ≥ 1`, with no dependence on the number of states or on `ρ`.

Taking for `π'` an optimal deterministic policy, which exists by MarkovDecisionProcesses, turns
the left sides into the gap to the optimal value. The roadmap builds on MarkovDecisionProcesses,
whose value, Q-function and occupancy measure it extends to real weight tables and whose
performance difference lemma drives the proofs; on the information matrix of
MathematicalStatisticsFoundations, of which the Fisher matrix is a multiple; and on Tau Ceti's
Moore–Penrose pseudoinverse. At every state that `ρ` charges, the natural policy gradient
iterates are the strategies of the Hedge method of RegretMinimizationAndEquilibria played against
the advantages divided by `1 − γ`.

Layer 1 below defines the value, Q-function, advantage and visitation vector of a weight table
and proves the direct policy gradient theorem. Layer 2 proves gradient domination. Layer 3 treats
the softmax parametrization and the Łojasiewicz inequality. Layer 4 treats natural policy
gradient: the Fisher matrix, the step, the improvement lemma and the rate. Layers 2 and 3 use
Layer 1; Layer 4 uses Layers 1 and 3.

## Conventions

- **States and actions.** `S` and `A` are finite types with decidable equality
  (`[Fintype S] [DecidableEq S] [Fintype A] [DecidableEq A]`). `|S|` and `|A|` are
  `Fintype.card S` and `Fintype.card A`.
- **The MDP.** `M : MDP S A` is the structure of MarkovDecisionProcesses (its Conventions): a
  transition law `trans : S → A → PMF S`, a mean reward `reward : S → A → ℝ`, a bound
  `rewardBound` and the proof `abs_reward_le` that `|reward s a| ≤ rewardBound`. Probabilities
  `trans s a s'` enter as real numbers through `ENNReal.toReal`.
- **Discount.** `γ : ℝ≥0`, coerced to `ℝ`; every theorem assumes `γ < 1`.
- **Weight tables and policies.** A weight table is any `π : S → A → ℝ`; it is a **policy**
  (`IsPolicy π`) when `π s a ≥ 0` and `Σ_a π s a = 1` for every `s`. A randomized stationary
  policy `p : S → PMF A` of MarkovDecisionProcesses is the policy `fun s a ↦ (p s a).toReal`, and
  every policy arises so. The direct parametrization takes the policy itself as the parameter;
  the values of weight tables that are not policies serve only to make derivatives meaningful.
- **Weight vectors on states.** `μ, ρ : S → ℝ`. A statement assumes `0 ≤ μ` or that `ρ` is a
  probability vector exactly when it says so. `V^π(μ) = Σ_s μ s · V^π s`.
- **Matrices.** `P^π s s' = Σ_a π s a · trans s a s'`; `(1 − γ P^π)⁻¹` is Mathlib's
  `Ring.inverse` in the ring `Matrix S S ℝ`, which is the inverse whenever `1 − γ P^π` is
  invertible, in particular at every policy, where the Neumann series converges because the
  rows of `P^π` are probability vectors (MarkovDecisionProcesses 1.2). Vectors on `S` multiply
  matrices on the left as row vectors (`ᵥ*`) and on the right as column vectors (`*ᵥ`).
- **Derivatives.** Weight tables form the normed space `S → A → ℝ` with the sup norm; derivatives
  are Mathlib's `fderiv ℝ`. The partial derivative in the coordinate `(s, a)` is the value of
  `fderiv` at `Pi.single s (Pi.single a 1)`. The Euclidean norm of a gradient is written out as
  `√(Σ_{s,a} (∂/∂θ(s, a))²)`.
- **Maxima** over the compact set of policies are stated by exhibiting a policy that attains the
  bound, and minima over states with `Finset.inf'`, so that no supremum over a set of reals and no
  junk value enters a statement.

## Layer 1: values of weight tables and the direct policy gradient

### 1.1 Value, Q-function, advantage and visitation

Restate the structure `MDP` of MarkovDecisionProcesses with an identical body, and define
`IsPolicy` as in the Conventions. For a weight table `π` define:

- the matrix `transMatrix π`, `P^π s s' = Σ_a π s a · trans s a s'`, and the mean reward
  `meanReward π`, `r^π s = Σ_a π s a · reward s a`;
- the **value** `policyValue γ π = (1 − γ P^π)⁻¹ r^π`, written `V^π`;
- the **Q-function** `policyQ γ π`,
  `Q^π (s, a) = reward s a + γ Σ_{s'} trans s a s' · V^π s'`, and the **advantage**
  `advantage γ π`, `A^π (s, a) = Q^π (s, a) − V^π s`;
- the **discounted state-visitation vector** `visitation γ μ π`,
  `d^π_μ = (1 − γ) μ (1 − γ P^π)⁻¹`, a row vector;
- the **objective** `objective γ μ π = Σ_s μ s · V^π s`, written `V^π(μ)`.

At a policy `π = fun s a ↦ (p s a).toReal` these are the objects of MarkovDecisionProcesses:
`P^π` is its `policyMatrix p`; `V^π` is its value of `p`, by its `value_eq_inverse` (1.2); `Q^π`
is its Q-function, because its expected next value is a finite sum on a finite state space
(1.2); and `d^π_μ s'` is `Σ_{s₀} μ s₀ · occupancy M γ p s₀ {s'}`, by its
`occupancy_real_singleton` (3.3). Hence, at a policy and for `γ < 1`, the following hold and are
used below: `d^π_μ` is nonnegative for `μ ≥ 0` with total mass `Σ_s μ s`, and
`d^π_μ ≥ (1 − γ) μ` coordinatewise for `μ ≥ 0` (MarkovDecisionProcesses 3.3, the occupancy
measure is a probability measure whose term `n = 0` is the Dirac mass);
`Σ_a π s a · A^π (s, a) = 0` at every `s` (the evaluation equation of MarkovDecisionProcesses
1.2); and the
**performance difference identity**
`V^{π'}(ρ) − V^π(ρ) = (1/(1 − γ)) Σ_s d^{π'}_ρ s Σ_a π' s a · A^π (s, a)` for policies `π`, `π'`
and every `ρ`, which is MarkovDecisionProcesses 3.3 (`performanceDifference`) summed against
`ρ`. (Agarwal, Kakade, Lee and Mahajan 2021, Section 3, equation (4) and Lemma 2, for the
visitation distribution and the performance difference lemma in this notation.)

**Checks.**

- One state, one action, reward `c`, any `γ < 1`: `V^π = c / (1 − γ)`, `Q^π = c / (1 − γ)`,
  `A^π = 0`, and `d^π_μ = μ`.
- One state, two actions with rewards `(1, 0)`, `π` uniform: `V^π = 1/(2(1 − γ))`,
  `Q^π = (V^π + 1/2, V^π − 1/2)` and `A^π = (1/2, −1/2)` for every `γ`; at `γ = 1/2` these are
  `1`, `(3/2, 1/2)` and `(1/2, −1/2)`.
- `γ = 0`: `V^π = r^π`, `Q^π = reward`, and `d^π_μ = μ`.
- The two-state chain with one action that alternates the states: `d^π_ρ` from the first state
  (`ρ = (1, 0)`) is `(1/(1 + γ), γ/(1 + γ))`, of total mass `1`. Without the factor `1 − γ` the
  total mass would be `1/(1 − γ)`.
- A weight table that is not a policy can make `1 − γ P^π` singular: one state, one action with
  `trans` the Dirac mass at that state, and `π = 1/γ` for `γ > 0`, give `1 − γ P^π = 0`, and
  `Ring.inverse` returns `0` there.

*Needs:* Mathlib `Ring.inverse`, `Matrix.vecMul`, `Matrix.mulVec`; MarkovDecisionProcesses 1.2
(`value_eq_inverse`) and 3.3 (`occupancy_real_singleton`, `performanceDifference`, the
occupancy measure is a probability measure) for the facts at policies.

### 1.2 The policy gradient theorem for the direct parametrization

Prove (`fderiv_objective`) that for `γ < 1`, every `μ : S → ℝ` and every policy `π`, the map
`π ↦ V^π(μ)` on weight tables is differentiable at `π` and, for every direction `h`,

    fderiv ℝ (objective γ μ) π h = Σ_s Σ_a h s a · d^π_μ s · Q^π (s, a) / (1 − γ).

So `∂V^π(μ)/∂π(a | s) = d^π_μ(s) Q^π(s, a) / (1 − γ)`. The route: near a policy, `1 − γ P^θ`
is invertible, and `θ ↦ (1 − γ P^θ)⁻¹` is differentiable with derivative
`H ↦ −(1 − γ P^θ)⁻¹ (−γ P^H) (1 − γ P^θ)⁻¹` by Mathlib's `hasFDerivAt_ringInverse` in the normed
algebra `Matrix.linftyOpNormedAlgebra` over the normed ring `Matrix.linftyOpNormedRing`, the
inverse being a unit by `NormedRing.inverse_one_sub`. Hence the derivative of `V^θ` in the
direction `h` is `(1 − γ P^π)⁻¹ (r^h + γ P^h V^π)`, whose entry at `s` before the inverse is
`Σ_a h s a · Q^π (s, a)`; pairing with `μ` and using the definition of `d^π_μ` gives the formula.
(Sutton, McAllester, Singh and Mansour 1999, Theorem 1, for the policy gradient theorem with the
unnormalized discounted weighting; Agarwal, Kakade, Lee and Mahajan 2021, equation (7), for the
direct parametrization in this normalization; proved here.)

**Checks.**

- `γ = 0`: `V^π(μ) = Σ_s μ s Σ_a π s a · reward s a` is linear in `π`, and the formula gives the
  constant gradient `μ s · reward s a`.
- One state, two actions with rewards `(1, 0)`, `γ = 0`, `μ = 1`, at the uniform policy: the
  gradient is `(1, 0) = Q^π`. The advantage `(1/2, −1/2)` in place of `Q^π` would be the wrong
  formula here: the direct parametrization does not keep `Σ_a π s a` fixed, so the term
  `V^π s` does not cancel.

*Needs:* 1.1; Mathlib `hasFDerivAt_ringInverse`, `Matrix.linftyOpNormedRing`,
`Matrix.linftyOpNormedAlgebra`, `NormedRing.inverse_one_sub`, `HasFDerivAt.comp`.

### Examples

The one-state MDP with two actions (a two-armed bandit with deterministic rewards), on which
values, gradients and the Fisher matrix are computed in closed form, and the alternating
two-state chain of MarkovDecisionProcesses 1.2.

### Dependencies

Layer 1 uses Mathlib's ring inverse and its derivative, matrices with the normed ring structure
`Matrix.linftyOpNormedRing`, and MarkovDecisionProcesses 1.2 and 3.3.

## Layer 2: gradient domination

### 2.1 Gradient domination for the direct parametrization

Prove (`gradientDomination`) that for `γ < 1`, `μ : S → ℝ`, `ρ ≥ 0`, policies `π` and `π'`, and
a real `C` with `d^{π'}_ρ s ≤ C · μ s` for every `s`, there is a policy `π̄` with

    V^{π'}(ρ) − V^π(ρ) ≤ C / (1 − γ) · fderiv ℝ (objective γ μ) π (π̄ − π).

Since the directional derivative is linear in `π̄` and the policies form a compact set, this says,
for `C ≥ 0`, that `V^{π'}(ρ) − V^π(ρ)` is at most `C / (1 − γ)` times the largest value of
`(π̄ − π)ᵀ ∇_π V^π(μ)` over policies `π̄`; when `μ s > 0` for every `s`, the least such `C` is
`max_s d^{π'}_ρ(s) / μ(s)`, the distribution mismatch coefficient. For `C < 0` the statement
gives the bound with the least value in place of the largest (see the Checks).

The route: by the performance difference identity of 1.1,
`V^{π'}(ρ) − V^π(ρ) ≤ (1/(1 − γ)) Σ_s d^{π'}_ρ s · m s` with `m s = max_a A^π (s, a)`, which is
`≥ 0` because `Σ_a π s a · A^π (s, a) = 0`. Let `π̄ s` be a point mass at a maximizer of
`A^π (s, ·)`; by 1.2 and `Σ_a (π̄ s a − π s a) V^π s = 0`, the directional derivative towards
`π̄` is `Σ_s d^π_μ s · m s / (1 − γ)`. Since `d^{π'}_ρ ≥ 0`, the hypothesis forces `μ ≥ 0` if
`C > 0` and `μ ≤ 0` if `C < 0`. If `C > 0`, then `d^{π'}_ρ ≤ C μ ≤ C/(1 − γ) · d^π_μ` because
`d^π_μ ≥ (1 − γ) μ`, and the bound follows. If `C < 0`, the same chain for `−μ` gives
`C μ ≤ C/(1 − γ) · d^π_μ`, and the bound follows again. If `C = 0`, then `d^{π'}_ρ = 0`, whose
total mass is `Σ_s ρ s`, so `ρ = 0` and both sides vanish at `π̄ = π`.
(Agarwal, Kakade, Lee and Mahajan 2021, Lemma 4, stated there for an optimal `π'` and
probability vectors `μ`, `ρ`, with both the bound through `d^π_μ` and the one through `μ`; the
statement for every `π'` and every real `C` is proved here.)

**Checks.**

- Equality: one state, two actions with rewards `(1, 0)`, `γ = 0`, `μ = ρ = 1`, `π` uniform,
  `π'` the point mass at the first action and `C = 1`: the left side is `1 − 1/2 = 1/2`, the
  gradient is `(1, 0)`, and the largest directional derivative is `1 − 1/2 = 1/2`.
- `ρ ≥ 0` is needed: on the same bandit with `ρ = −1`, `π` the point mass at the first action and
  `π'` at the second, `d^{π'}_ρ = −1 ≤ 0 · μ`, so `C = 0` is allowed, but the left side is
  `−(0 − 1) = 1 > 0`.
- The reading with the largest directional derivative needs `C ≥ 0`: on the same bandit with
  `ρ = 1`, `π` uniform, `π'` the point mass at the first action and `C = μ = −1`, the hypothesis
  `1 ≤ 1` holds and the gap is `1/2`; the gradient is `(−1, 0)`, the largest directional
  derivative is `1/2` and `C` times it is `−1/2`, while the point mass at the first action gives
  the directional derivative `−1/2` and the bound `1/2`, with equality.

*Needs:* 1.1 (the performance difference identity, `d^π_μ ≥ (1 − γ) μ` and
`Σ_a π s a · A^π (s, a) = 0`), 1.2.

### Examples

The two-armed bandit of 1.1, and a two-state chain in which the comparison policy visits a state
that `μ` does not weight, where no finite `C` exists.

### Dependencies

Layer 2 uses Layer 1.

## Layer 3: the softmax parametrization

### 3.1 The softmax policy gradient

Define the **softmax parametrization** `softmax θ`,
`π_θ (a | s) = exp θ(s, a) / Σ_b exp θ(s, b)`, a policy for every `θ : S → A → ℝ` when `A` is
nonempty (for an empty `A` it is the empty table, whose row sums are `0`). Prove
(`fderiv_objective_softmax`) that for `γ < 1`, every `μ : S → ℝ` and every `θ`, the map
`θ ↦ V^{π_θ}(μ)` is differentiable at `θ` and

    fderiv ℝ (fun θ ↦ objective γ μ (softmax θ)) θ h
      = Σ_s Σ_a h s a · d^{π_θ}_μ s · π_θ (a | s) · A^{π_θ} (s, a) / (1 − γ).

Define `softmaxGrad γ μ θ : S × A → ℝ`, the vector of partial derivatives
`∂V^{π_θ}(μ)/∂θ(s, a)`. The route is the chain rule (Mathlib `HasFDerivAt.comp`) through 1.2:
`∂π_θ(b | s')/∂θ(s, a) = 1[s' = s] π_θ(b | s) (1[b = a] − π_θ(a | s))`, and
`Σ_b π_θ(b | s) Q^{π_θ}(s, b) = V^{π_θ} s`. (Agarwal, Kakade, Lee and Mahajan 2021, equation (10)
and Lemma 40; Mei, Xiao, Szepesvári and Schuurmans 2020, Lemma 1; proved here.)

**Checks.**

- `softmax 0` is uniform, and adding a function of the state alone to `θ` does not change
  `π_θ`; accordingly `Σ_a ∂V^{π_θ}(μ)/∂θ(s, a) = 0` at every `s`.
- One state, two actions with rewards `(1, 0)`, `γ = 0`, `μ = 1`, `θ = (t, 0)`: `V^{π_θ} = σ(t)`
  with `σ` the logistic function, and the gradient is `(σ(t)(1 − σ(t)), −σ(t)(1 − σ(t)))`; at
  `t = 0` it is `(1/4, −1/4)`.

*Needs:* 1.1, 1.2; Mathlib `HasFDerivAt.comp`.

### 3.2 The non-uniform Łojasiewicz inequality

For `d : S → A` let `detPolicy d` be the policy with `π s a = 1` if `a = d s` and `0` otherwise.
Prove (`lojasiewicz_softmax`) that for nonempty `S`, `γ < 1`, `μ ≥ 0`, `ρ ≥ 0`, every `θ`, every
`d : S → A` and every real `C` with `d^{detPolicy d}_ρ s ≤ C · d^{π_θ}_μ s` for all `s`,

    (min_s π_θ (d s | s)) · (V^{detPolicy d}(ρ) − V^{π_θ}(ρ))
      ≤ √|S| · C · √(Σ_{s,a} (∂V^{π_θ}(μ)/∂θ(s, a))²).

When `d^{π_θ}_μ` has full support, the least such `C` is
`max_s d^{detPolicy d}_ρ(s) / d^{π_θ}_μ(s)`, and for `C > 0` the inequality reads

    ‖∇_θ V^{π_θ}(μ)‖₂ ≥ (1/√|S|) · C⁻¹ · min_s π_θ(d s | s) · (V^{detPolicy d}(ρ) − V^{π_θ}(ρ)).

The route: keep only the coordinates `(s, d s)` of the gradient and apply Cauchy–Schwarz
(Mathlib `Finset.sum_mul_sq_le_sq_mul_sq`) to get
`√|S| ‖∇‖₂ ≥ (1/(1 − γ)) Σ_s d^{π_θ}_μ s · π_θ(d s | s) · |A^{π_θ}(s, d s)|` by 3.1; bound
`π_θ(d s | s)` below by its minimum and, for `C > 0`, `d^{π_θ}_μ` below by `d^{detPolicy d}_ρ / C`;
drop the absolute value and recognize `V^{detPolicy d}(ρ) − V^{π_θ}(ρ)` by the performance
difference identity of 1.1. If `C ≤ 0`, then `C · d^{π_θ}_μ ≤ 0` because `μ ≥ 0`, so the
hypothesis forces `d^{detPolicy d}_ρ = 0`, hence `ρ = 0` and the left side is `0`; and if `C < 0`
it forces `d^{π_θ}_μ = 0`, hence `μ = 0` and the gradient is `0`, so the right side is `0` as
well. (Mei, Xiao, Szepesvári and Schuurmans 2020, Lemma 8, inequality (258),
stated there for a deterministic optimal policy; the proof uses only the performance difference
identity, and the statement for every deterministic `d` is proved here.)

**Checks.**

- One state, two actions with rewards `(1, 0)`, `γ = 0`, `μ = ρ = 1`, `d` the first action,
  `C = 1`, `θ = (t, 0)`: the left side is `σ(t)(1 − σ(t))` and the right side is
  `√2 σ(t)(1 − σ(t))`.
- The factor `min_s π_θ(d s | s)` cannot be dropped: in the same example at `t = −5`, the gap is
  `1 − σ(−5) = 0.9933` while the right side is `√2 σ(−5)(1 − σ(−5)) = 0.0094`.
- `μ ≥ 0` is needed: with `ρ = 0`, `μ = −1`, `C = −1` and `t = 0` the hypothesis
  `0 ≤ −d^{π_θ}_μ = 1` holds, the left side is `0`, and the right side is
  `−√(1/16 + 1/16) = −0.3536`.
- `ρ ≥ 0` is needed: in the same bandit with `μ = 1`, `ρ = −1`, `θ = 0` and `d` the second
  action, `d^{detPolicy d}_ρ = −1 ≤ 0`, so `C = 0` is allowed, and the left side is
  `1/2 · (0 − (−1/2)) = 1/4 > 0`.

*Needs:* 1.1 (the performance difference identity), 3.1; Mathlib
`Finset.sum_mul_sq_le_sq_mul_sq`.

### Examples

The two-armed bandit of 1.1 in the softmax parametrization, where every quantity is a function of
the logistic `σ(t)`.

### Dependencies

Layer 3 uses Layer 1.

## Layer 4: natural policy gradient

### 4.1 The Fisher matrix and the natural gradient step

Define, for `γ`, `μ` and `θ`:

- the **Fisher matrix** `fisher γ μ θ : Matrix (S × A) (S × A) ℝ`,
  `F_μ(θ) i j = Σ_s d^{π_θ}_μ s Σ_a π_θ (a | s) · ∂_i log π_θ (a | s) · ∂_j log π_θ (a | s)`, where
  `∂_i` is the partial derivative in the coordinate `i = (s', a')`; for `μ ≥ 0` with
  `Σ_s μ s > 0` it is `Σ_s μ s` times the information matrix of MathematicalStatisticsFoundations
  4.3 for the probability law on `S × A` with masses `d^{π_θ}_μ s · π_θ (a | s) / Σ_s μ s` and the
  score `∇_θ log π_θ (a | s)`, and for `μ = 0` it is `0`, so for `μ ≥ 0` it is positive
  semidefinite;
- the **natural policy gradient step** `npgStep γ μ η θ = θ + η F_μ(θ)† ∇_θ V^{π_θ}(μ)`, where
  `F†` is Tau Ceti's `Matrix.covariancePseudoInverse F`, the Moore–Penrose pseudoinverse of a
  positive semidefinite matrix (`Matrix.isMoorePenroseInverse_covariancePseudoInverse`), the
  gradient is `softmaxGrad γ μ θ` of 3.1, and the result is read back as a weight table by
  `Function.curry`;
- the **multiplicative-weights step** `mwStep γ η π`,
  `π' (a | s) = π (a | s) exp(η A^π (s, a) / (1 − γ)) / Z s` with
  `Z s = Σ_b π (b | s) exp(η A^π (s, b) / (1 − γ))`.

Prove, for `γ < 1`:

- **compatibility** (`fisher_mulVec_advantage`): for every `μ` and `θ`, the vector
  `(s, a) ↦ A^{π_θ}(s, a) / (1 − γ)` solves `F_μ(θ) w = ∇_θ V^{π_θ}(μ)`. With
  `∂_{(s', b)} log π_θ (a | s) = 1[s' = s] (1[a = b] − π_θ (b | s))`, the left side at `(s, b)` is
  `d^{π_θ}_μ s · π_θ (b | s) · (w (s, b) − Σ_a π_θ (a | s) w (s, a))`, and the advantage has
  `π_θ`-mean `0`, so 3.1 gives the right side;
- **natural policy gradient is multiplicative weights** (`softmax_npgStep`): for `μ ≥ 0`, every
  `η`, every `θ` and every state `s` with `d^{π_θ}_μ s > 0`,
  `softmax (npgStep γ μ η θ) s = mwStep γ η (softmax θ) s`. The Fisher matrix is block diagonal
  over states; by the computation above, the kernel of the block at a state with
  `d^{π_θ}_μ s > 0` is the constant vectors, because `π_θ` has full support. A Moore–Penrose
  pseudoinverse `F†` makes `F† F` the orthogonal projection onto the range of `F`, so by the
  compatibility `F† ∇V = F† F w₀` differs from `w₀ = A^{π_θ} / (1 − γ)` by a vector in the kernel,
  constant on the actions at every such state, and the softmax does not see such constants.
  Positive semidefiniteness, which the Tau Ceti pseudoinverse needs, holds for `μ ≥ 0` by
  MathematicalStatisticsFoundations 4.3 and the nonnegativity of `d^{π_θ}_μ` (1.1).

(Kakade 2001, Theorem 1, for compatibility in the average-reward setting, where the computation
is the same with the stationary distribution in place of `d^{π_θ}_μ`; Agarwal, Kakade, Lee and
Mahajan 2021, Lemma 15, equation (15) and its proof in Appendix C.3, for the multiplicative-weights
form at the states reachable from the initial distribution; proved here.)

**Checks.**

- One state, two actions with rewards `(1, 0)`, `γ = 0`, `μ = 1`, `θ = 0`: the Fisher matrix is
  `diag(π) − π πᵀ = [[1/4, −1/4], [−1/4, 1/4]]`, its pseudoinverse is `[[1, −1], [−1, 1]]`, the
  gradient is `(1/4, −1/4)`, `F† ∇V = (1/2, −1/2) = A^π`, and the new policy is
  `(1/(1 + exp(−η)), 1/(1 + exp η))`, which is `mwStep` of the uniform policy (`0.7311` at
  `η = 1`).
- The same bandit at `θ = (t, 0)`, with `σ = 1/(1 + exp(−t))`: the Fisher matrix is
  `σ(1 − σ) [[1, −1], [−1, 1]]`, its pseudoinverse is `[[1, −1], [−1, 1]] / (4σ(1 − σ))`, the
  gradient is `σ(1 − σ) (1, −1)`, so `F† ∇V = (1/2, −1/2)` for every `t`, while
  `A^π = (1 − σ, −σ)`. The two differ by `σ − 1/2`, a constant in the action: the step is
  `θ + η A^π/(1 − γ)` only up to a constant per state, which does not change the policy.
- The conclusion holds only where `d^{π_θ}_μ s > 0`: with two states, every transition into the
  first, `ρ = (1, 0)` and rewards `(0, 1)` at both states, `d^{π_θ}_ρ = (1, 0)`; the Fisher block
  and the gradient vanish at the second state, so the step leaves `θ` unchanged there, while
  `mwStep` moves the uniform policy at the second state to `(0.1192, 0.8808)` at `η = 1`,
  `γ = 1/2`. Adding to `A^{π_θ}/(1 − γ)` any vector supported on the second state gives another
  solution of `F w = ∇V`.
- `μ ≥ 0` is needed: with two absorbing states, two actions, `μ = (1, −1)` and rewards `(1, 0)`
  at the first state, `d^{π_θ}_μ = (1, −1)`; the Fisher matrix has a nonzero negative
  semidefinite block, so it is not positive semidefinite, the Tau Ceti pseudoinverse is `0`
  (`Matrix.covariancePseudoInverse_of_not_posSemidef`) and the step does not move `θ`, while at
  the first state, where `d^{π_θ}_μ = 1 > 0`, `mwStep` moves the uniform policy.

*Needs:* 1.1, 3.1; MathematicalStatisticsFoundations 4.3; Tau Ceti
`Matrix.covariancePseudoInverse`, `Matrix.isMoorePenroseInverse_covariancePseudoInverse`.

### 4.2 The improvement lemma

Prove (`mwStep_improvement`) that for `γ < 1`, `η > 0`, every policy `π` and every state `s`,
`log Z s ≥ 0` and

    (1 − γ)/η · log Z s ≤ V^{mwStep γ η π} s − V^π s.

The route: `log Z s ≥ Σ_a π s a · η A^π (s, a)/(1 − γ) = 0` by Jensen's inequality for the
concave logarithm (Mathlib `ConcaveOn.le_map_sum` with `strictConcaveOn_log_Ioi`) and
`Σ_a π s a A^π (s, a) = 0`. The performance difference identity of 1.1 with `ρ` the point mass at
`s` writes `V^{π'} s − V^π s` as `(1/η) Σ_{s'} d^{π'}_s s' (KL(π' s' ‖ π s') + log Z s')`, where
`π' = mwStep γ η π`; Kullback–Leibler divergences between distributions on `A` are nonnegative by
the same Jensen inequality, and `d^{π'}_s ≥ (1 − γ) · 1[· = s]` with `log Z ≥ 0` gives the bound.
(Agarwal, Kakade, Lee and Mahajan 2021, Lemma 17, stated there for the iterates of 4.3 and
weights `μ`; the pointwise form for every policy is proved here and implies it by averaging.)

**Checks.**

- One state, two actions with rewards `(1, 0)`, `γ = 0`, `π` uniform, `η = 1`:
  `log Z = log cosh(1/2) = 0.1201` and `V^{π'} − V^π = 0.7311 − 0.5 = 0.2311 ≥ 0.1201`.
- `η > 0` is needed: at `η = −1` in the same example, `(1 − γ)/η · log Z = −0.1201` but
  `V^{π'} − V^π = −0.2311`.
- `A` with one element: `Z = 1` and the step does not change `π`.

*Needs:* 1.1; Mathlib `ConcaveOn.le_map_sum`, `strictConcaveOn_log_Ioi`.

### 4.3 The convergence rate of natural policy gradient

Define the **natural policy gradient iterates** `npgIterate γ ρ η`: `θ₀ = 0` and
`θ_{t+1} = npgStep γ ρ η θ_t`, with `π_t = softmax θ_t`. Prove (`npg_rate`) that if
`0 ≤ reward s a ≤ 1` for all `s`, `a`, `γ < 1`, `ρ ≥ 0` with `Σ_s ρ s = 1`, and `η > 0`, then
for every policy `π'` and every `T ≥ 1`,

    V^{π'}(ρ) − V^{π_T}(ρ) ≤ log |A| / (η T) + 1 / ((1 − γ)² T).

The route: a state with `d^{π_t}_ρ s = 0` for some `t` is reached from `ρ` by no policy, because
`π_t` has full support; such states carry no mass of any `d^{π'}_ρ` or of `ρ` and do not enter
`V(ρ)`. At every other state, 4.1 makes `π_{t+1} = mwStep γ η π_t`. By the performance
difference identity of 1.1 and `π_{t+1} (a | s) Z_t s = π_t (a | s) exp(η A_t (s, a)/(1 − γ))`,

    V^{π'}(ρ) − V^{π_t}(ρ)
      = (1/η) Σ_s d^{π'}_ρ s · (KL(π' s ‖ π_t s) − KL(π' s ‖ π_{t+1} s) + log Z_t s).

Sum over `t < T`: the divergences telescope, `KL(π' s ‖ π₀ s) ≤ log |A|` for the uniform `π₀`
(Mathlib `Real.log_nonpos` for the entropy term), and by 4.2 averaged over the weights
`d^{π'}_ρ` (the values at a reachable state depend only on the policy at reachable states),
`Σ_t (1/η) Σ_s d^{π'}_ρ s log Z_t s ≤ (V^{π_T} − V^{π₀})(d^{π'}_ρ)/(1 − γ) ≤ 1/(1 − γ)²`,
since values lie in `[0, 1/(1 − γ)]` and `d^{π'}_ρ` is a probability vector. Finally
`V^{π_t}(ρ)` increases with `t` by 4.2, so the last term is at most the average.
(Agarwal, Kakade, Lee and Mahajan 2021, Theorem 16, stated for an optimal comparison policy; the
proof applies to every policy `π'`.)

At a state `s` with `ρ s > 0`, `d^{π_t}_ρ s ≥ (1 − γ) ρ s > 0` for all `t`, and `π_t (· | s)` is
the strategy that the exponential-weights method `hedge η` of RegretMinimizationAndEquilibria 1.2
plays at time `t` against the payoffs `u k = A^{π_k} (s, ·)/(1 − γ)`. The rate above is not that
method's regret bound: its second term does not depend on `η`.

**Checks.**

- `T = 0` is excluded: the right side is `0` there by Lean's division by zero, while on the
  two-armed bandit with rewards `(1, 0)`, `γ = 0` and `π'` the point mass at the first action the
  left side is `1 − 1/2 = 1/2`.
- `|A| = 1`: `log |A| = 0`, every policy is the same, and the left side is `0`.
- The reward range is needed. Take three states `s₀, s₁, s₂` and two actions, with deterministic
  transitions `s₀ → s₂, s₀`, `s₁ → s₁, s₂`, `s₂ → s₁, s₀` under the two actions, reward `1` at
  `(s₁, first action)` and `(s₂, second action)` and `0` elsewhere, `γ = 0.95` and `ρ` the point
  mass at `s₀`. The optimal value at `s₀` is `18.05`, and after one step with `η = 2` the gap is
  `6.768 ≤ 400.35`. Multiplying the rewards by `100` and taking `η = 0.02` gives the same iterates
  and the gap `676.82`, above the bound `434.66`.
- `Σ_s ρ s = 1` is needed: in the same MDP with rewards in `[0, 1]`, `η = 2` and `ρ` equal to
  `100` at `s₀`, the iterates do not change (the Fisher matrix and the gradient scale together),
  the gap is `676.82` and the bound is `400.35`.
- `ρ ≥ 0` is needed: take two absorbing states, two actions with rewards `(1, 0)` at both,
  `γ = 0`, `ρ = (3, −2)`, `η = 1` and `T = 1`. Then `d^{π_θ}_ρ = ρ` has a negative entry, the
  Fisher matrix is not positive semidefinite, its Tau Ceti pseudoinverse is `0` and `π₁` is
  uniform; for `π'` playing the first action at the first state and the second at the second,
  the gap is `3 − 1/2 = 5/2`, above `log 2 + 1 = 1.693`.

*Needs:* 1.1, 4.1, 4.2; Mathlib `Real.log_nonpos`, `ConcaveOn.le_map_sum`.

### Examples

Natural policy gradient on the two-armed bandit with `γ = 0`, where the iterates are the
strategies of Hedge against the advantages, and on the three-state MDP of the Checks of 4.3.

### Dependencies

Layer 4 uses Layers 1 and 3, MathematicalStatisticsFoundations 4.3, and Tau Ceti's
pseudoinverse.

## Scope and ownership

This roadmap owns the value, Q-function, advantage and visitation vector of arbitrary real weight
tables on a finite MDP (the extension off the policies needed to differentiate), the policy
gradient theorems of 1.2 and 3.1, gradient domination (2.1), the non-uniform Łojasiewicz
inequality (3.2), the Fisher matrix of the tabular softmax parametrization, the natural policy
gradient step and its multiplicative-weights form (4.1), the improvement lemma (4.2), and the
natural policy gradient iterates and their rate (4.3).

Stated by other roadmaps and used above:

- MarkovDecisionProcesses owns MDPs, their values, Q-functions, optimal values and optimal
  policies, the occupancy measure and the performance difference lemma (its 1.2, 3.1–3.3). The
  structure `MDP` is restated here with an identical body only so that the statements can be
  made without importing another roadmap; at policies the objects of 1.1 are that roadmap's.
- MathematicalStatisticsFoundations 4.3 owns the information matrix of a vector score and its
  positive semidefiniteness; for `μ ≥ 0` with `Σ_s μ s > 0` the Fisher matrix of 4.1 is
  `Σ_s μ s` times that matrix for one probability law on `S × A`, written as a finite sum indexed
  by `S × A`.
- RegretMinimizationAndEquilibria 1.2 owns the exponential-weights method `hedge` and its regret
  bound; the identification in 4.3 is a remark, and no statement here uses the regret bound.

Already in the libraries: Mathlib's derivative of the ring inverse and the normed ring structure
on matrices; Tau Ceti's Moore–Penrose pseudoinverse `Matrix.covariancePseudoInverse` of a
positive semidefinite matrix. Tau Ceti's `TauCeti.Probability.logisticNormalChart`
(`TauCeti/Probability/Distributions/LogisticNormal/Basic.lean`) is the softmax map with one
reference coordinate fixed at `0`; the tabular softmax here leaves every coordinate free and is a
different map.

Not treated here: sample-based estimation of gradients and sample complexity; policy gradient
for the average-reward criterion; function approximation, including log-linear and neural policy
classes and compatible function approximation beyond the tabular case; entropy and log-barrier
regularization; the rates of projected gradient ascent and of softmax gradient ascent, whose
constants depend on smoothness bounds and, for the softmax, on a lower bound for the iterates'
probabilities of optimal actions; trust-region and proximal methods; online and adversarial
MDPs; regret of learning in an unknown MDP; continuous state or action spaces.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Analysis/Calculus/FDeriv/Mul.lean`: `hasFDerivAt_ringInverse` (in a normed algebra
  with summable geometric series, at a unit `x` the derivative of `Ring.inverse` is
  `t ↦ −x⁻¹ t x⁻¹`).
- `Mathlib/Analysis/Matrix/Normed.lean`: `Matrix.linftyOpNormedRing` and
  `Matrix.linftyOpNormedAlgebra` (definitions, used as local instances: the operator norm for the
  sup norm on square matrices). Complete normed rings have summable geometric series
  (`Mathlib/Analysis/SpecificLimits/Normed.lean`).
- `Mathlib/Analysis/Normed/Ring/Units.lean`: `NormedRing.inverse_one_sub` (`‖t‖ < 1` gives
  `Ring.inverse (1 − t)` as the inverse of the unit `Units.oneSub t`).
- `Mathlib/Analysis/Calculus/FDeriv/Comp.lean`: `HasFDerivAt.comp` (the chain rule).
- `Mathlib/Analysis/Convex/Jensen.lean`: `ConcaveOn.le_map_sum` (Jensen's inequality for a
  concave function and nonnegative weights of sum `1` at points of its domain);
  `Mathlib/Analysis/Convex/SpecificFunctions/Basic.lean`: `strictConcaveOn_log_Ioi`.
- `Mathlib/Analysis/SpecialFunctions/Log/Basic.lean`: `Real.log_nonpos` (`0 ≤ x ≤ 1` gives
  `log x ≤ 0`).
- `Mathlib/Algebra/Order/BigOperators/Ring/Finset.lean`: `Finset.sum_mul_sq_le_sq_mul_sq`
  (Cauchy–Schwarz for finite sums).
- `Ring.inverse`, `Matrix.vecMul`, `Matrix.mulVec`, `Matrix.PosSemidef`, `Real.exp`, `Real.log`,
  `fderiv`, `Pi.single`, `Function.curry`, `Finset.inf'`.

### From Tau Ceti

- `TauCeti/Analysis/Matrix/CovariancePseudoInverse.lean`: `Matrix.covariancePseudoInverse`
  (for a positive semidefinite real matrix, the functional calculus inverting the nonzero
  eigenvalues; `0` for a matrix that is not positive semidefinite,
  `Matrix.covariancePseudoInverse_of_not_posSemidef`) and
  `Matrix.isMoorePenroseInverse_covariancePseudoInverse` (for `C` positive semidefinite, the
  Euclidean operators of `C` and of its pseudoinverse satisfy the four Penrose equations of
  `LinearMap.IsMoorePenroseInverse`, `TauCeti/Analysis/InnerProductSpace/MoorePenrose.lean`).

### From TauCetiRoadmap.MarkovDecisionProcesses

- Conventions and 1.1: the structure `MDP`, restated here with an identical body.
- 1.2: `policyMatrix`, the value of a randomized stationary policy, and `value_eq_inverse` (on a
  finite state space and for `γ < 1`, the value is `(1 − γ P^π)⁻¹ r^π`, the inverse being
  `Ring.inverse` and given by the Neumann series); the evaluation equation; the expected next
  value is a finite sum on a finite state space.
- 3.1: the existence of an optimal deterministic stationary policy, used only for the remark on
  the optimal value in the overview.
- 3.3: the occupancy measure is a probability measure; `occupancy_real_singleton` (its mass at
  `s'` is the entry of `(1 − γ) e_s (1 − γ P^π)⁻¹`); `performanceDifference`.

### From TauCetiRoadmap.MathematicalStatisticsFoundations

- 4.3: the information matrix `(∫ sᵢ sⱼ dP)` of a vector score with square-integrable
  coordinates under a probability law `P` is positive semidefinite; on a finite set every score is
  square integrable, and a nonnegative multiple of a positive semidefinite matrix is positive
  semidefinite.

### From TauCetiRoadmap.RegretMinimizationAndEquilibria

- 1.2: the definition of `hedge η`, used in the remark of 4.3 only.

## Provenance and prior work

The Lean repository [rl-theory-in-lean](https://github.com/ShangtongZhang/rl-theory-in-lean)
(MIT) formalizes finite MDPs, Q-learning and linear TD; its files contain no policy-gradient
material. It is reference material, not the specification.

## References

- A. Agarwal, S. M. Kakade, J. D. Lee and G. Mahajan, *On the theory of policy gradient methods:
  optimality, approximation, and distribution shift*, J. Mach. Learn. Res. **22** (2021), no. 98,
  1–76; open access at jmlr.org. Locators are to this version; arXiv:1908.00261v5 (2020) has the
  same statements numbered Lemma 3.2, Lemma 4.1, Lemma 5.1, Theorem 5.3, Lemma 5.2 and Lemma C.1
  in place of Lemmas 2, 4, 15, Theorem 16 and Lemmas 17 and 40.
- S. M. Kakade, *A natural policy gradient*, Advances in Neural Information Processing Systems
  **14** (2001).
- J. Mei, C. Xiao, Cs. Szepesvári and D. Schuurmans, *On the global convergence rates of softmax
  policy gradient methods*, Proceedings of ICML 2020; arXiv:2005.06392v3 (2022), whose Lemma 1
  and Lemma 8 are cited.
- R. S. Sutton, D. McAllester, S. Singh and Y. Mansour, *Policy gradient methods for
  reinforcement learning with function approximation*, Advances in Neural Information Processing
  Systems **12** (1999).

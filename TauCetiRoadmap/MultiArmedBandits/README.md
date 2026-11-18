# Roadmap: multi-armed bandits, regret bounds and lower bounds

**Summary.** Develop the theory of the finite-armed bandit problem. A policy is a sequence of
Markov kernels from histories of arms and rewards to arms, and its interaction with an environment
is a probability measure on trajectories built by the Ionescu-Tulcea construction. For stochastic
bandits the roadmap defines pull counts, gaps and regret and proves the regret decomposition. It
proves that a sum of reward noises with predictable weights is sub-Gaussian under every policy,
which replaces independence in the analysis of adaptive sampling. From this it derives the regret
bound of explore-then-commit and the gap-dependent and gap-free regret bounds of the upper
confidence bound policy, for rewards with a sub-Gaussian variance proxy. On the lower-bound side it
proves the divergence decomposition for the laws of histories under two bandits, the minimax lower
bound of order `√(K n)` for Gaussian bandits, and the Lai–Robbins lower bound on the expected
number of plays of an arm under a consistent policy. It ends with oblivious adversarial bandits:
the importance-weighted estimators of Exp3 and its regret bound `√(2 n K log K)`.

## Scope and ownership

This roadmap owns:

- history-dependent randomized policies on a measurable arm space with real rewards, the law of
  the interaction of a policy with an environment given by one reward kernel per round, and the
  predicate saying that a policy plays in prescribed sets of arms;
- stochastic bandits with finitely many arms: reward kernel, means, gaps, pull counts, empirical
  means, regret, and the regret decomposition;
- the sub-Gaussian bound for predictably weighted sums of reward noises along the interaction, and
  its consequences for the first `m` rewards of an arm;
- explore-then-commit and the upper confidence bound policy with a fixed confidence level, with
  their regret bounds;
- the divergence decomposition, the minimax lower bound for Gaussian bandits, consistency of a
  policy over a class of bandits, and the Lai–Robbins lower bound;
- oblivious adversarial bandits, the loss-based importance-weighted estimator, the Exp3 policy and
  its regret bound.

It consumes, and does not re-prove, the items listed under
[Exact supplier contracts](#exact-supplier-contracts). In particular sub-Gaussian random variables,
their Chernoff bound and Hoeffding's lemma for bounded variables are Mathlib's
(`HasSubgaussianMGF`); the chain rule for the Kullback–Leibler divergence is Tau Ceti's; and the
Bretagnolle–Huber inequality, the divergence between Gaussian laws and the bound of an event
probability by the total variation distance are stated by
[MathematicalStatisticsNonparametric](../MathematicalStatisticsNonparametric/README.md) 1.3 and
1.4 and [MathematicalStatisticsFoundations](../MathematicalStatisticsFoundations/README.md) 9.2.

Out of scope:

- infinitely many arms wherever a largest mean or a sum over the arms occurs, that is in the
  gaps and the regret of 1.2 and 1.3 and in Layers 3 to 5, and uncountably many arms outside 1.1
  (the law of the interaction of 1.1 is defined for every measurable arm space, and the reward
  kernel, the pull counts and Layer 2 for countably many arms);
- `ε`-greedy policies, the anytime and asymptotically optimal versions of the upper confidence
  bound policy, MOSS, and KL-UCB for Bernoulli rewards;
- Thompson sampling, Bayesian regret and Gittins indices;
- contextual, linear, combinatorial and nonstationary stochastic bandits;
- best-arm identification and other pure-exploration problems;
- high-probability regret bounds, Exp3.P and Exp3-IX, adaptive adversaries, and the minimax
  lower bound for adversarial bandits;
- full-information online learning: Hedge, regret matching and their game-theoretic consequences
  belong to [RegretMinimizationAndEquilibria](../RegretMinimizationAndEquilibria/README.md),
  which leaves bandit feedback out of its scope;
- Markov decision processes, which belong to
  [MarkovDecisionProcesses](../MarkovDecisionProcesses/README.md). The history-dependent policies
  and the trajectory law of its 1.1 are built from kernels on histories of states and actions
  of a controlled Markov chain with a countable state space; a bandit has no state, and the
  policies of 1.1 here are kernels on histories of arms and real rewards. The two constructions
  share only Mathlib's `Kernel.trajMeasure`.

## Conventions

- `ι` is the type of arms with a measurable structure. In 1.1 it is arbitrary, and statements
  that need more say so. From 1.2 on it has measurable singletons
  (`[MeasurableSpace ι] [MeasurableSingletonClass ι]`); the reward kernel, the law of a bandit
  and Layer 2 need `ι` countable (`[Countable ι]`) and nothing more. Finiteness (`[Fintype ι]`)
  is assumed where a sum over the arms occurs and nonemptiness (`[Nonempty ι]`) where a largest
  value over the arms does: for `gap` and `regret`, in 1.3 and in Layers 3, 4 and 5; there
  `K = Fintype.card ι`. Decidable equality of `ι` is assumed where a definition tests
  `A_s = a`. Rewards are real, and the horizon `n` is any natural number.
- **Rounds** are indexed by `ℕ` from `0`. A **trajectory** is `ω : ℕ → ι × ℝ`; the arm of round
  `t` is `A_t = (ω t).1` and its reward is `X_t = (ω t).2`. The **history through round `n`** is
  `Preorder.frestrictLe n ω : Π _ : Iic n, ι × ℝ`, the rounds `0, …, n`.
- A **stochastic bandit** is a family `ν : ι → ProbabilityMeasure ℝ` of reward laws, with Mathlib's
  `MeasureTheory.ProbabilityMeasure`. Its mean vector is `μ_a = mean ν a = ∫ x ∂(ν a)`, the
  largest mean is `μ⋆ = max_a μ_a` (attained, since `ι` is finite and nonempty) and
  `Δ_a = gap ν a = μ⋆ − μ_a`.
  An arm is **optimal** if `Δ_a = 0` and **suboptimal** if `Δ_a > 0`; several arms may be optimal.
- `P_ν` is `banditLaw ν π` for the policy in force and `E_ν` its expectation;
  `T_a(t) = pullCount a t ω` counts the rounds `s < t` with `A_s = a`, so `T_a(0) = 0` and
  `T_a(t)` is the count that a source with rounds `1, …, t` writes `T_a(t)`.
- **Sub-Gaussian** is Mathlib's `HasSubgaussianMGF X c μ` with `c : ℝ≥0`:
  `E exp (t X) ≤ exp (c t² / 2)` for all real `t`. The parameter `c` is a variance proxy: a source's
  `σ`-subgaussian is `c = σ²`. A bandit is **`c`-sub-Gaussian** if for every arm `a` the centred
  variable `x ↦ x − μ_a` is `HasSubgaussianMGF … c` under `ν a`.
- The Kullback–Leibler divergence is Mathlib's `klDiv`, with values in `ℝ≥0∞`; products
  `0 * ∞` are `0`, as in `ℝ≥0∞`.
- Real division by zero is `0` and `Real.log 0 = 0`, as in Mathlib; each statement in which such a
  value can occur says what it then asserts.

## Exact supplier contracts

- Mathlib:
  - `Kernel.trajMeasure μ₀ κ` (`Mathlib/Probability/Kernel/IonescuTulcea/Traj.lean`): for Markov
    kernels `κ n : Kernel (Π i : Iic n, X i) (X (n + 1))` and a measure `μ₀` on `X 0`, a measure
    on `Π n, X n`, a probability measure when `μ₀` is one;
    `Kernel.map_frestrictLe_trajMeasure_compProd_eq_map_trajMeasure` (same file): for a
    probability measure `μ₀`, the law of `(frestrictLe a x, x (a + 1))` is
    `(trajMeasure μ₀ κ).map (frestrictLe a) ⊗ₘ κ a`; `Kernel.condDistrib_trajMeasure` (same
    file): for a probability measure `μ₀` and `X (a + 1)` standard Borel and nonempty, the
    conditional law of the coordinate `a + 1` given the coordinates up to `a` is `κ a`;
  - `MeasureTheory.IsProjectiveLimit.unique`
    (`Mathlib/MeasureTheory/Constructions/Projective.lean`): two projective limits of one
    projective family of finite measures are equal;
  - `Kernel.compProd` and `Measure.compProd`; `Kernel.prodMkLeft`
    (`Mathlib/Probability/Kernel/Composition/MapComap.lean`); `Kernel.ofFunOfCountable` and
    `Kernel.deterministic` (`Mathlib/Probability/Kernel/Basic.lean`);
    `Kernel.lintegral_compProd` (`Mathlib/Probability/Kernel/Composition/CompProd.lean`): for
    s-finite kernels `κ`, `η` and measurable `f`,
    `∫⁻ f ∂((κ ⊗ₖ η) a) = ∫⁻ b, ∫⁻ c, f (b, c) ∂(η (a, b)) ∂(κ a)`;
    `MeasureTheory.Measure.lintegral_compProd`
    (`Mathlib/Probability/Kernel/Composition/MeasureCompProd.lean`): for s-finite `μ` and `κ` and
    measurable `f`, `∫⁻ f ∂(μ ⊗ₘ κ) = ∫⁻ a, ∫⁻ b, f (a, b) ∂(κ a) ∂μ`;
    `MeasureTheory.Measure.integral_compProd`
    (`Mathlib/Probability/Kernel/Composition/IntegralCompProd.lean`): the same for `f`
    integrable for `μ ⊗ₘ κ`;
  - `Preorder.frestrictLe` (`Mathlib/Order/Restriction.lean`), `Finset.restrict`
    (`Mathlib/Data/Finset/Pi.lean`), `DependsOn` (`Mathlib/Logic/Function/DependsOn.lean`):
    `DependsOn f s` says that `f x = f y` whenever `x` and `y` agree on `s`;
  - `HasSubgaussianMGF` (`Mathlib/Probability/Moments/SubGaussian.lean`), a structure with fields
    `integrable_exp_mul` and `mgf_le`; `HasSubgaussianMGF.measure_ge_le`:
    `μ.real {ω | ε ≤ X ω} ≤ exp (−ε² / (2 c))` for `ε ≥ 0`; `HasSubgaussianMGF.neg`;
    `HasSubgaussianMGF.integrable`;
  - `klDiv` (`Mathlib/InformationTheory/KullbackLeibler/Basic.lean`) and `klDiv_map_le`
    (`Mathlib/InformationTheory/KullbackLeibler/DataProcessing.lean`): for finite measures and
    measurable `g`, `klDiv (μ.map g) (ν.map g) ≤ klDiv μ ν`;
  - `gaussianReal`, `integral_id_gaussianReal` and `mgf_id_gaussianReal`
    (`Mathlib/Probability/Distributions/Gaussian/Real.lean`): the mean of `gaussianReal μ v` is
    `μ`, and its moment generating function is `t ↦ exp (μ t + v t² / 2)`;
  - `Real.add_one_le_exp` (`Mathlib/Analysis/Complex/Exponential.lean`): `x + 1 ≤ exp x`.
- Tau Ceti:
  - `TauCeti.klDiv_compProd_eq_add_lintegral`
    (`TauCeti/InformationTheory/KullbackLeibler/ChainRule.lean`): for finite measures `μ`, `ν` on
    `α` and Markov kernels `κ`, `η` from `α` to `β`, with `α` countable or `β` countably
    generated, `klDiv (μ ⊗ₘ κ) (ν ⊗ₘ η) = klDiv μ ν + ∫⁻ a, klDiv (κ a) (η a) ∂μ`;
  - `TauCeti.klDiv_compProd_right` (same file): for a finite measure `μ` and finite kernels `κ`,
    `η`, under the same countability condition,
    `klDiv (μ ⊗ₘ κ) (μ ⊗ₘ η) = ∫⁻ a, klDiv (κ a) (η a) ∂μ`.
- [MathematicalStatisticsFoundations](../MathematicalStatisticsFoundations/README.md) 9.2: for
  probability measures and a measurable set `A`, `|P A − Q A| ≤ tvDist P Q / 2`.
- [MathematicalStatisticsNonparametric](../MathematicalStatisticsNonparametric/README.md):
  - 1.3, `klDiv_gaussianReal`: for `v ≠ 0`,
    `klDiv (gaussianReal a v) (gaussianReal b v) = ENNReal.ofReal ((a − b)² / (2 v))`;
  - 1.4, `half_exp_neg_klDiv_le`, the Bretagnolle–Huber inequality: for probability measures
    with `klDiv P Q ≠ ∞`, `exp (−(klDiv P Q).toReal) / 2 ≤ 1 − tvDist P Q / 2`.

## How to read the build

Layer 1 constructs the law of the interaction of a policy with an environment (1.1), specializes
it to stochastic bandits with their pull counts and empirical means (1.2), and defines the regret
and proves its decomposition (1.3). Layer 2 proves the sub-Gaussian bound for weighted reward
noises from 1.1 and 1.2. Layer 3 proves the regret upper bounds from Layers 1 and 2. Layer 4
proves the lower bounds from Layer 1 and the supplier roadmaps; it uses neither Layer 2 nor
Layer 3. Layer 5 treats adversarial bandits; it uses 1.1, and 1.2 and 1.3 only to compare its
regret with that of a bandit of Dirac laws. The order is 1, 2, 3, 4, 5, and after Layer 1 the
three blocks formed by Layers 2 and 3, by Layer 4 and by Layer 5 do not depend on one another.
Each numbered target ends with **Checks** and a *Needs:* line, and every claim carries a source
locator in parentheses or says that it is proved here. Lattimore and Szepesvári 2020 is cited
by the result and equation numbers of the authors' online edition.

## Layer 1: policies, environments and regret

### 1.1 Policies and the law of the interaction

Define a **policy** on a measurable arm space `ι` as a structure `Policy ι` with a measure
`first` on `ι`, the law of the arm of round `0`; kernels
`next n : Kernel (Π _ : Iic n, ι × ℝ) ι`, choosing the arm of round `n + 1` from the history
through round `n`; and the proofs `isProbabilityMeasure_first` and `isMarkovKernel_next` that
`first` is a probability measure and every `next n` a Markov kernel. An **environment** is a
sequence `ρ : ℕ → Kernel ι ℝ` of Markov kernels: the reward of round `t` is drawn from `ρ t` at
the arm played. For a policy `π` and an environment `ρ` define the **law of the interaction**
`envLaw ρ π : Measure (ℕ → ι × ℝ)` as `Kernel.trajMeasure μ₀ κ` with `X n = ι × ℝ`, initial law
`μ₀ = π.first ⊗ₘ ρ 0` and `κ n = π.next n ⊗ₖ (ρ (n + 1)).prodMkLeft _` (`Kernel.compProd`): from
the history through round `n` the next arm is drawn from `π.next n`, and the next reward from
`ρ (n + 1)` at that arm. Say that `π` **plays in** the sets `S : ℕ → (ℕ → ι × ℝ) → Set ι`
(`Policy.PlaysIn`) if `π.first (S 0 ω) = 1` for every `ω` and
`π.next n (frestrictLe n ω) (S (n + 1) ω) = 1` for every `n` and `ω`. Prove that:

- `envLaw ρ π` is a probability measure; under it `(A_0, X_0)` has law `π.first ⊗ₘ ρ 0`, and for
  every `n` the law of `(frestrictLe n ω, ω (n + 1))` is the law of the history through round `n`
  composed with `κ n` (`Kernel.map_frestrictLe_trajMeasure_compProd_eq_map_trajMeasure`); hence,
  by `MeasureTheory.Measure.lintegral_compProd` and `Kernel.lintegral_compProd`, for measurable
  `f ≥ 0` the expectation of
  `f (frestrictLe n ω) A_(n+1) X_(n+1)` is the expectation of
  `∫⁻ a, ∫⁻ x, f h a x ∂(ρ (n + 1) a) ∂(π.next n h)` at `h = frestrictLe n ω`;
- for countable nonempty `ι` with measurable singletons, the conditional law of
  `(A_(n+1), X_(n+1))` given the history through round `n` is `κ n`
  (`Kernel.condDistrib_trajMeasure`, the space `ι × ℝ` being standard Borel): the conditional
  law of `A_(n+1)` given the history `h` through round `n` is `π.next n h`, and the conditional
  law of `X_(n+1)` given that history and `A_(n+1)` is `ρ (n + 1) A_(n+1)`. In round `0`,
  `A_0` has law `π.first` and the conditional law of `X_0` given `A_0` is `ρ 0 A_0`. These two
  conditional laws, in the integral form of the first item, are the only facts about
  `envLaw` that the proofs of 1.2 to 5.3 use;
- uniqueness: a probability measure on `ℕ → ι × ℝ` under which `ω 0` has law `π.first ⊗ₘ ρ 0` and
  which satisfies the identity of the first item for every `n` is `envLaw ρ π`, because the two
  measures have the same law of every history (induction on `n`) and so are projective limits of
  one family (`MeasureTheory.IsProjectiveLimit.unique`);
- for countable `ι` with measurable singletons, if `π` plays in `S` then, almost surely for
  `envLaw ρ π`, `A_t ∈ S t ω` for every `t` (`ae_forall_mem_of_playsIn`). No measurability of
  `S` and no condition on which rounds `S t` depends on is needed: the event
  `A_(n+1) = a ∉ S (n + 1) ω` lies in the event that `A_(n+1) = a` and
  `π.next n (frestrictLe n ω) {a} = 0`, which is null by the first item;
- for `a₀ : ι` and measurable maps `f n` from histories through round `n` to `ι`, the policy with
  `first = Measure.dirac a₀` and `next n = Kernel.deterministic (f n) _` plays in the singletons
  `S 0 ω = {a₀}`, `S (n + 1) ω = {f n (frestrictLe n ω)}`; and `Policy.PlaysIn` is monotone in
  `S`, so this policy plays in every `S` with `a₀ ∈ S 0 ω` and
  `f n (frestrictLe n ω) ∈ S (n + 1) ω` for all `n` and `ω`.

(Lattimore and Szepesvári 2020, Definition 4.7 for policies, Section 4.6 and Section 4.7 for the
law, there on finite horizons and by Ionescu-Tulcea on the infinite one, and Proposition 4.8 for
uniqueness; the statements are proved here.)

**Checks.**

- The constant policy at an arm `a` (`first = dirac a`, `next n` constant equal to `dirac a`):
  almost surely every `A_t` is `a`, and `X_t` has law `ρ t a`.
- One arm: there is exactly one policy, and `envLaw ρ π` makes the rewards independent with
  `X_t` of law `ρ t ()`.
- Two arms `0`, `1`, `ρ t = Kernel.deterministic` of the rewards `1` at arm `0` and `0` at arm
  `1`, `first = dirac 1`, and `next n` repeating the arm of round `n` if its reward is `1` and
  switching otherwise: the trajectory is `(1, 0), (0, 1), (0, 1), …`. A kernel `next n` reading
  the reward of round `n + 1` is not expressible, since its source is the history through
  round `n`.
- `Policy.PlaysIn` with `S t ω = Set.univ` holds for every policy; with `S t ω = {a}` and
  `{a}` measurable it holds exactly for the constant policy at `a`; with `S t ω = ∅` it holds
  for no policy, because `π.first ∅ = 0`.
- Countability is needed in `ae_forall_mem_of_playsIn`: for `ι = ℝ`, `first` the uniform law on
  `[0, 1]` and `S 0 ω = {a | a ≠ A_0}`, every `S 0 ω` has `first`-measure `1` while
  `A_0 ∉ S 0 ω` for every `ω`.
- Measurable singletons are needed there too: for two arms `0`, `1` with the trivial
  `σ`-algebra `{∅, univ}` there is one policy, the measure `π.first {0}` of the non-measurable
  set `{0}` is `1`, so the policy plays in `S t ω = {0}`; but every measurable set of
  trajectories containing `{ω | A_0 = 1}` is everything, so `A_0 ∈ {0}` does not hold almost
  surely.

*Needs:* Mathlib `Kernel.trajMeasure`,
`Kernel.map_frestrictLe_trajMeasure_compProd_eq_map_trajMeasure`, `Kernel.compProd`,
`Measure.compProd`, `Kernel.prodMkLeft`, `Preorder.frestrictLe`, `MeasureTheory.Measure.lintegral_compProd`, `Kernel.lintegral_compProd`;
for the conditional law also
`Kernel.condDistrib_trajMeasure`; for uniqueness also `MeasureTheory.IsProjectiveLimit.unique`;
for deterministic policies `Kernel.deterministic`.

### 1.2 Stochastic bandits and their statistics

Let `ι` be countable with measurable singletons. For a bandit
`ν : ι → ProbabilityMeasure ℝ` define the **reward kernel** `rewardKernel ν : Kernel ι ℝ` as
`Kernel.ofFunOfCountable (fun a ↦ ν a)`, a Markov kernel (`isMarkovKernel_rewardKernel`), and
the **law of the bandit under `π`**, `banditLaw ν π = envLaw (fun _ ↦ rewardKernel ν) π`. Define
`mean ν a = ∫ x ∂(ν a)`, for finite nonempty `ι` the gap
`gap ν a = max_b mean ν b − mean ν a`, the **pull count**
`pullCount a t ω`, the number of `s < t` with `A_s = a`, and the **empirical mean**
`empMean a t ω = (Σ_{s<t} [A_s = a] X_s) / pullCount a t ω`, which is `0` when the arm has not
been played. Prove that:

- `rewardKernel ν a = ν a` for every arm, and under `banditLaw ν π` the conditional law of
  `X_t` given the earlier rounds and `A_t` is `ν A_t` (the second item of 1.1);
- for finite nonempty `ι`: `gap ν a ≥ 0`, some arm has gap `0`, and `gap ν a = 0` if and only
  if `mean ν b ≤ mean ν a` for every `b`;
- `pullCount a 0 ω = 0`, `pullCount a (t + 1) ω = pullCount a t ω + [A_t = a]`,
  `Σ_a pullCount a t ω = t` for finite `ι`, and `pullCount a t` and `empMean a t` are
  measurable functions of
  `ω` that depend only on the rounds before `t` (`DependsOn … (Set.Iio t)`);
- `empMean a t ω * pullCount a t ω = Σ_{s<t} [A_s = a] X_s`;
- if `ν a` has a finite mean then `[A_t = a] X_t` is integrable for `banditLaw ν π` and
  `E_ν ([A_t = a] X_t) = mean ν a * P_ν (A_t = a)`; more generally, for `f` integrable for `ν a`,
  `E_ν ([A_t = a] f X_t) = P_ν (A_t = a) * ∫ f ∂(ν a)`, by the first item of 1.1 and
  `MeasureTheory.Measure.integral_compProd`.

(Lattimore and Szepesvári 2020, Section 4.5 for gaps and pull counts; proved here.)

**Checks.**

- `pullCount`. Arms `(0, 1, 0, 0)` in rounds `0` to `3`: `pullCount 0 3 ω = 2` and
  `pullCount 1 3 ω = 1`; counting the rounds `s ≤ t` would give `pullCount 0 3 ω = 3`.
- `pullCount 0 4 ω = 3` and `pullCount 1 4 ω = 1` on the same trajectory, with sum `4`; a count
  of the rounds in which the arm is not played would give `1` and `3`.
- `pullCount a 0 ω = 0` for every arm, and `pullCount 2 4 ω = 0` for a third arm.
- `empMean`. Arms `(0, 1, 0)` with rewards `(2, 5, 4)`: `empMean 0 3 ω = 3`; dividing by the
  number of rounds would give `2`.
- `empMean 1 3 ω = 5` and `empMean 0 1 ω = 2`: only the rounds before `t` count; with the rounds
  `s ≤ t` the second value would be `2` at `t = 0`, where it is `0`.
- `empMean 1 1 ω = 0`, since arm `1` has not been played before round `1`: the value at an
  unplayed arm is `0`, not the reward of a later round.
- `mean` and `gap`. `ν = (dirac 1, dirac 3, dirac 3)`: the means are `(1, 3, 3)` and the gaps
  `(2, 0, 0)`, with two optimal arms; the reversed sign would give `(−2, 0, 0)`.
- `mean` of `gaussianReal m v` is `m` (`integral_id_gaussianReal`), also for `v = 0`; the gaps
  of `(gaussianReal 0 1, gaussianReal 0 9)` are `(0, 0)`, since a gap compares means and not
  variances.
- One arm: its gap is `0` whatever its law.
- `rewardKernel` and `banditLaw`. Under the constant policy at `a` the rewards are independent
  with law `ν a`, and `E_ν X_t = mean ν a`; a kernel that ignored the arm would give the same
  law of rewards under every constant policy.
- Two arms and the policy drawing every arm uniformly whatever the history:
  `P_ν (A_t = a) = 1/2` and `E_ν (pullCount a n ω) = n / 2`; for `ν = (dirac 1, dirac 0)`,
  `E_ν X_t = 1/2`.
- `ν = (dirac 1, dirac 0)` and the policy of the third Check of 1.1: the trajectory is
  `(1, 0), (0, 1), (0, 1), …`, so `banditLaw` draws the reward of round `t` at the arm of
  round `t`, not at that of round `t − 1`.

*Needs:* 1.1; Mathlib `Kernel.ofFunOfCountable`, `MeasureTheory.Measure.integral_compProd`,
`DependsOn`.

### 1.3 Regret and its decomposition

Define the **regret** of `π` on `ν` after `n` rounds,
`regret ν π n = n * max_a mean ν a − E_ν (Σ_{t<n} X_t)`. Prove that if every `ν a` has a finite
mean then

    regret ν π n = Σ_a gap ν a * E_ν (pullCount a n ω)

(`regret_eq_sum_gap_mul_integral_pullCount`), by the last item of 1.2 and
`Σ_a [A_t = a] = 1`. Deduce, under the same hypothesis, that `0 ≤ regret ν π n ≤ n * max_a gap ν a`,
that `regret ν π n ≤ regret ν π (n + 1)`, and that `regret ν π n = 0` if and only if
`P_ν (gap ν A_t = 0) = 1` for every `t < n`. (Lattimore and Szepesvári 2020, Lemma 4.5, stated
there also for countably many arms, and Lemma 4.4; proved here.)

**Checks.**

- The constant policy at `a`: `regret ν π n = n * gap ν a`, which is `0` for an optimal arm.
- `ν = (dirac 1, dirac 0)` and the uniform policy of 1.2: `regret ν π n = n / 2`, and the
  decomposition reads `0 * (n / 2) + 1 * (n / 2)`.
- `n = 0`: both sides are `0`.
- One arm: `regret ν π n = 0` for every `n`.
- Finite means are needed. Let arm `0` have the standard Cauchy law and arm `1` the law
  `dirac 1`, and let `π` play arm `0` in round `0` and arm `1` afterwards. The Bochner integral
  gives `mean ν 0 = 0`, so the gaps are `(1, 0)` and the right side is `1`; but `Σ_{t<n} X_t`
  is not integrable, its integral is `0`, and `regret ν π n = n`. The two sides differ for
  `n ≥ 2`.

*Needs:* 1.1, 1.2.

### Examples

A one-armed bandit; the two-armed bandit `(dirac 1, dirac 0)` under the uniform policy and under
the two constant policies; the deterministic two-armed interaction of the third Check of 1.1.

### Dependencies

Layer 1 uses Mathlib's kernels, composition products, the Ionescu-Tulcea construction,
`MeasureTheory.IsProjectiveLimit.unique` and `DependsOn`.

## Layer 2: concentration under adaptive sampling

### 2.1 Predictably weighted reward noises

Under a policy the rewards of an arm are not observed at fixed times, so sums of them are not
sums of independent variables. Prove the following substitute (`hasSubgaussianMGF_weightedNoise`),
for countable `ι` with measurable singletons. Let `ν` be a bandit, `π` a policy, `c : ℝ≥0`,
and `s` a set of arms such that for every `a ∈ s`
the centred variable `x ↦ x − mean ν a` is `HasSubgaussianMGF … c` under `ν a`. Let
`g : ℕ → (ℕ → ι × ℝ) → ι → ℝ` be weights such that every `ω ↦ g t ω a` is measurable and depends
only on the rounds before `t` (`DependsOn … (Set.Iio t)`), and `g t ω a = 0` for `a ∉ s`. Let
`V : ℝ≥0` satisfy `Σ_{t<n} (g t ω A_t)² ≤ V` for every `ω`. Then

    ω ↦ Σ_{t<n} g t ω A_t * (X_t − mean ν A_t)

is `HasSubgaussianMGF … (c * V)` under `banditLaw ν π`.

Proof route. Fix a real `λ` and let `M_t = exp (λ S_t − λ² c Q_t / 2)`, where `S_t` and `Q_t`
are the sums of `g u ω A_u * (X_u − mean ν A_u)` and of `(g u ω A_u)²` over `u < t`. By the first
item of 1.1 the expectation of `M_(t+1)` is the expectation of `M_t` times the average over
`a ~ π.next` and `x ~ ν a` of `exp (λ g (x − mean ν a) − λ² c g² / 2)` with `g = g t ω a`, a
function of the history before `t` and of `a`; this average is at most `1`, by the field
`mgf_le` of `HasSubgaussianMGF` at `λ g` for `a ∈ s` and because `g = 0` for `a ∉ s`. Hence
`E M_n ≤ 1`, and `Q_n ≤ V` gives `E exp (λ S_n) ≤ exp (λ² c V / 2)`, which is finite, so the
exponential is integrable. (Proved here. `M_t` is the supermartingale of Lattimore and
Szepesvári 2020, Lemma 20.2, in dimension one, there for conditionally `1`-subgaussian noise.)

Mathlib's `HasSubgaussianMGF.sum_of_hasCondSubgaussianMGF`
(`Mathlib/Probability/Moments/SubGaussian.lean`) treats an adapted sequence whose term `i` is
conditionally sub-Gaussian with a parameter `cY i` that is a constant, and gives the parameter
`Σ_i cY i`. It does not give the statement above, in which the conditional parameter
`c (g t ω A_t)²` of a term is random and only the sum of the squared weights is bounded; the
third Check shows the difference.

**Checks.**

- The constant policy at `a`, `g = 1`, `s = {a}` and `V = n`: the sum is a sum of `n`
  independent centred rewards, and the conclusion is the parameter `c n` of Mathlib's
  `HasSubgaussianMGF.sum_of_iIndepFun`.
- Exact enumeration. Two arms with means `(0.3, −0.2)` and rewards `mean ± √c`, each sign with
  probability `1/2`, `c = 0.7`; the policy plays arm `0` first, repeats an arm after a positive
  reward and switches otherwise; `n = 6`; `g t ω a = 1` if `a = 0` and arm `0` has fewer than `2`
  plays before `t`, else `0`; `V = 2`. Then `E exp S = 1.8743 ≤ exp 0.7 = 2.0138` and
  `E exp (−S) = 1.8526`. With the weight of arm `0` minus the same weight for arm `1`, `V = 4`
  and `E exp S = 2.9612 ≤ exp 1.4 = 4.0552`.
- Round by round is weaker. For the weights of the second Check (`g t ω a = 1` if `a = 0` and
  arm `0` has fewer than `2` plays before `t`) the weight of round `t` is `1` with positive
  probability for every `t < 6`, so the best constant conditional parameter of each term is
  `c`, and a sum of constant parameters gives `6 c = 4.2` where the statement gives
  `c V = 1.4`.
- A weight that reads the reward of its own round is excluded by the dependence condition, and
  the conclusion fails for it: one round, `g 0 ω a` the sign of `X_0 − mean ν a`, same rewards.
  Then the sum is `√c` surely, with mean `√0.7 ≠ 0`, and `E exp S = 2.3086 > exp 0.35 = 1.4191`.
- An arm outside `s` must have weight `0`: for an arm with the exponential law of rate `1` and
  `g = 1`, `E exp (λ S)` is infinite for `λ ≥ 1`.
- `n = 0` or `V = 0`: the sum is `0` and the parameter is `0`.
- Measurability of the weights is needed: for a set `E` of reals that is not Lebesgue
  measurable, one arm with the standard Gaussian law, `n = 2`, `V = 1`, `g 0 = 0` and
  `g 1 ω a = 1` if `X_0 ∈ E` and `0` otherwise, the sum `S = [X_0 ∈ E] X_1` is not almost
  everywhere measurable, so `exp (t S)` is not integrable for `t ≠ 0`.

*Needs:* 1.1, 1.2; Mathlib `HasSubgaussianMGF`, `MeasureTheory.Measure.lintegral_compProd`,
`DependsOn`.

### 2.2 The first rewards of an arm

Define `prefixSum a m t ω = Σ_{s<t} [A_s = a ∧ pullCount a s ω < m] X_s`, the sum of the rewards
of the first `m` plays of arm `a` among the rounds before `t`. Prove that:

- `prefixSum a m t` is a measurable function of `ω` that depends only on the rounds before `t`;
  `prefixSum a m t ω` is the sum of `min m (pullCount a t ω)` rewards; it equals
  `empMean a t ω * pullCount a t ω` when `pullCount a t ω ≤ m`, and
  `prefixSum a m t ω = prefixSum a m u ω` for `t ≤ u` when `m ≤ pullCount a t ω`;
- if the centred law of arm `a` is `c`-sub-Gaussian then
  `Σ_{s<n} [A_s = a ∧ pullCount a s ω < m] (X_s − mean ν a)` is `HasSubgaussianMGF … (c * m)`
  under `banditLaw ν π` (2.1 with `s = {a}` and `V = m`); on the event `m ≤ pullCount a n ω` it
  is `prefixSum a m n ω − m * mean ν a`. Hence, for `ε ≥ 0`, each of the events
  `m ≤ pullCount a n ω ∧ ε ≤ prefixSum a m n ω − m * mean ν a` and
  `m ≤ pullCount a n ω ∧ prefixSum a m n ω − m * mean ν a ≤ −ε` has probability at most
  `exp (−ε² / (2 c m))` (`HasSubgaussianMGF.measure_ge_le`, `HasSubgaussianMGF.neg`);
- if the centred laws of two arms `a ≠ b` are `c`-sub-Gaussian then the difference of their two
  centred sums is `HasSubgaussianMGF … (c * (2 m))` (2.1 with `s = {a, b}` and `V = 2 m`);
- for an arm `a` with `c`-sub-Gaussian centred law, every real `L` and every `n`,

      P_ν (∃ t ≤ n, pullCount a t ω ≠ 0 ∧
          empMean a t ω + √(2 c L / pullCount a t ω) < mean ν a) ≤ n * exp (−L)

  (`measureReal_exists_empMean_add_sqrt_lt_le`), and the same bound holds with the inequality
  `mean ν a < empMean a t ω − √(2 c L / pullCount a t ω)` in place of the last one. For
  `c > 0` and `L ≥ 0` this is the union over the values `m = 1, …, n` of `pullCount a t ω` of
  the second item with `ε = √(2 c L m)`. For `L < 0` the right side is at least `n`, and the
  event is empty for
  `n = 0`. For `c = 0` the rewards of arm `a` are almost surely `mean ν a`, and the event, which
  has a strict inequality, is null.

(Lattimore and Szepesvári 2020, Corollary 5.5 for independent samples and inequality (7.7) for
the union bound, there in the reward-stack model of Section 4.6; proved here in the law of 1.2.)

**Checks.**

- Arms `(0, 1, 0, 0)` with rewards `(2, 5, 4, 7)`: `prefixSum 0 2 4 ω = 6` and
  `prefixSum 0 1 4 ω = 2`; the condition `pullCount a s ω ≤ m` in place of `<` would give
  `prefixSum 0 2 4 ω = 13`.
- Same trajectory: `prefixSum 0 5 4 ω = 13 = empMean 0 4 ω * 3`, since arm `0` has only three
  plays, and `prefixSum 1 2 4 ω = 5`.
- `prefixSum a 0 t ω = 0`, and `prefixSum 0 2 3 ω = prefixSum 0 2 4 ω = 6` on that trajectory:
  the sum does not change once the arm has `m` plays.
- The strict inequality in the last item matters at `c = 0`: with `≤` the event has probability
  `1` once the arm is played, while `n * exp (−L) < 1` for `L > log n`.
- One round, the constant policy at a Gaussian arm of variance `c`, `L = 1`: the event is
  `X_0 + √(2 c) < mean ν a`, of probability `Φ(−√2) = 0.0786 ≤ exp (−1) = 0.3679`.
- `L = 0` and `n ≥ 1`: the bound is `n ≥ 1` and says nothing.
- `m = 0` in the second item: the centred sum is `0`, the parameter is `0`, and Lean's
  `exp (−ε² / 0) = 1`.

*Needs:* 2.1, 1.2; Mathlib `HasSubgaussianMGF.measure_ge_le`, `HasSubgaussianMGF.neg`.

### Examples

Rewards with values in `[0, 1]` have `1/4`-sub-Gaussian centred laws, by Hoeffding's lemma in
Mathlib's form `hasSubgaussianMGF_of_mem_Icc`; `gaussianReal m v` has a `v`-sub-Gaussian centred law
(`mgf_id_gaussianReal`); a Dirac law is `0`-sub-Gaussian.

### Dependencies

Layer 2 uses 1.1 and 1.2 and Mathlib's `HasSubgaussianMGF`, `DependsOn` and
`MeasureTheory.Measure.lintegral_compProd`. It holds for countably many arms.

## Layer 3: regret upper bounds

### 3.1 Explore-then-commit

Say that `π` is an **explore-then-commit policy with `m` exploration plays** (`IsETC m π`) if it
plays in the sets

    S t ω = {a | pullCount a t ω < m ∨
               ((∀ b, m ≤ pullCount b t ω) ∧ ∀ b, prefixSum b m t ω ≤ prefixSum a m t ω)}

(`Policy.PlaysIn`): while some arm has fewer than `m` plays the policy plays such an arm, in any
order, and afterwards it plays an arm whose first `m` rewards have the largest sum, ties broken
in any way. For finite nonempty `ι` such a policy exists for every `m`: the set `S t ω` is
nonempty (an arm with fewer than `m` plays, or else an arm maximizing `prefixSum b m t ω`), it
is determined by the rounds before `t`, and each `{ω | a ∈ S t ω}` is measurable, so for an
enumeration of `ι` the policy that plays the first arm of `S t ω` is one of the deterministic
policies of the last item of 1.1 and satisfies `IsETC m`.
Prove (`etc_regret_le`) that for a `c`-sub-Gaussian bandit `ν`, a policy `π` with
`IsETC m π` and `m K ≤ n`,

    regret ν π n ≤ m Σ_a Δ_a + (n − m K) Σ_a Δ_a exp (−m Δ_a² / (4 c)).

Proof route. By `ae_forall_mem_of_playsIn`, almost surely every arm has exactly `m` plays in the
rounds before `m K`, and for `t ≥ m K` the event `A_t = a` implies
`prefixSum a⋆ m t ω ≤ prefixSum a m t ω` for a fixed optimal arm `a⋆`, both sums having `m`
terms. For a suboptimal `a` this event has probability at most `exp (−m Δ_a² / (4 c))` by the
third item of 2.2 and `HasSubgaussianMGF.measure_ge_le` with `ε = m Δ_a`. Hence
`E_ν (pullCount a n ω) ≤ m + (n − m K) exp (−m Δ_a² / (4 c))`, and 1.3 concludes; the finite
means that 1.3 needs come from `HasSubgaussianMGF.integrable`. (Lattimore and Szepesvári 2020,
Algorithm 1 and Theorem 6.1, for `c = 1`, exploration in cyclic order and `1 ≤ m ≤ n / K`; the
form with a variance proxy and an arbitrary exploration order is proved here by the same
argument.)

**Checks.**

- `m = 0`: every policy satisfies `IsETC 0`, and the bound is `n Σ_a Δ_a`, which holds by 1.3.
- Two arms, playing arm `0`, then arm `1`, then for ever the arm with the larger first reward:
  `IsETC 1` holds.
- Playing arm `0`, then arm `1`, then in each round the arm of largest `empMean` does not
  satisfy `IsETC 1`: after the rewards `(1, 0)` and then `−3` from arm `0` in round `2`, it
  plays arm `1` in round `3`, while `prefixSum` reads the first reward of each arm only and
  keeps arm `0`.
- `ν = (dirac 1, dirac 0)`, `m ≥ 1`, `n ≥ 2 m`: the regret is `m`. The bandit is `c`-sub-Gaussian
  for every `c`, and the bound `m + (n − 2 m) exp (−m / (4 c))` tends to `m` as `c → 0`; at
  `c = 0` Lean's `exp (−m / 0) = 1` and the bound is `n − m ≥ m`.
- Gaussian arms of variance `1` with means `(0.5, 0)`, `m = 5`, `n = 100`: the bound is
  `2.5 + 45 exp (−0.3125) = 35.42`; a simulation gives a regret of about `12.1`.
- The hypothesis `m K ≤ n` is needed: `K = 2`, `m = 1`, `n = 1`, `ν = (dirac 0, dirac 1)` and
  the policy that starts with arm `0` satisfies `IsETC 1` and has regret `1`, while the right
  side is `1 − exp (−1 / (4 c)) < 1` for `c > 0`.
- The constant `4` cannot be replaced by `2`: for Gaussian arms of variance `1` with gap `4`,
  `m = 1` and two arms, the probability of committing to the worse arm is
  `Φ(−4/√2) = 0.00234`, above `exp (−8) = 0.00034` and below `exp (−4) = 0.0183`.

*Needs:* 1.1, 1.2, 1.3, 2.2; Mathlib `HasSubgaussianMGF.measure_ge_le`,
`HasSubgaussianMGF.integrable`.

### 3.2 The upper confidence bound policy

For `c : ℝ≥0` and a real `δ` define the **index** of arm `a` at time `t`,
`ucbIndex c δ a t ω : EReal`, as `⊤` if `pullCount a t ω = 0` and as
`empMean a t ω + √(2 c log (1/δ) / pullCount a t ω)` otherwise. Say that `π` is a **UCB policy**
(`IsUCB c δ π`) if it plays in the sets
`S t ω = {a | ∀ b, ucbIndex c δ b t ω ≤ ucbIndex c δ a t ω}`: in every round it plays an arm of
largest index, ties broken in any way. For finite nonempty `ι` such a policy exists for every
`c` and `δ`: `S t ω` is nonempty, is determined by the rounds before `t`, and each
`{ω | a ∈ S t ω}` is measurable, so the policy that plays the first arm of `S t ω` in an
enumeration of `ι` is one of the deterministic policies of the last item of 1.1 and satisfies
`IsUCB c δ`. Prove, for a `c`-sub-Gaussian bandit `ν`, every `n` and
every `π` with `IsUCB c (1 / n²) π`:

- for every arm `a` with `Δ_a > 0`, `E_ν (pullCount a n ω) ≤ 3 + 16 c log n / Δ_a²`;
- `regret ν π n ≤ 3 Σ_a Δ_a + Σ_{a : Δ_a > 0} 16 c log n / Δ_a` (`ucb_regret_le`), by the first
  item and 1.3.

Proof route for the first item, for `c > 0` and `n ≥ 2`. Fix an optimal arm `a⋆` and let
`u = ⌈16 c log n / Δ_a²⌉ ≥ 1` and `L = log (1/δ) = 2 log n`. Let `G` be the event that
`mean ν a⋆ ≤ ucbIndex c δ a⋆ t ω` for all `t ≤ n` and that, if `u ≤ pullCount a n ω`,
`prefixSum a u n ω / u + √(2 c L / u) < mean ν a⋆`. On `G`, almost surely
`pullCount a n ω ≤ u`: otherwise there is a round `t < n` with `A_t = a` and
`pullCount a t ω = u`, where the index of `a` is below `mean ν a⋆` and so below the index of
`a⋆`, against `ae_forall_mem_of_playsIn`. The complement of the first condition has probability
at most `n exp (−L) = 1/n` by the last item of 2.2. Since `√(2 c L / u) ≤ Δ_a / 2`, the
complement of the second has probability at most `exp (−u Δ_a² / (8 c)) ≤ 1/n²` by the second
item of 2.2 with `ε = u Δ_a / 2`. Hence
`E_ν (pullCount a n ω) ≤ u + n (1/n + 1/n²) ≤ 3 + 16 c log n / Δ_a²`. For `n ≤ 1` the count is
at most `1`. For `c = 0` the rewards are almost surely the means, every arm is played once in
the first `K` rounds, and afterwards the indices are the means, so a suboptimal arm is played at
most once. (Lattimore and Szepesvári 2020, equation (7.2), Algorithm 3 and Theorem 7.1, for
`c = 1`; the per-arm bound is the last display of its proof. Auer, Cesa-Bianchi and Fischer
2002, Theorem 1, is the original bound, for rewards in `[0, 1]`, a confidence level varying with
the round and other constants. The form with a variance proxy is proved here.)

**Checks.**

- An arm that has not been played has index `⊤`, so a UCB policy plays every arm once in the
  first `K` rounds: `pullCount a K ω = 1` for every `a`, almost surely.
- Arms `(0, 1, 0)` with rewards `(2, 5, 4)`, `c = 1` and `log (1/δ) = 2`: at `t = 3` the indices
  are `3 + √2 = 4.414` and `5 + 2 = 7`, and the policy plays arm `1`.
- `δ = 1 / n²` gives `log (1/δ) = 2 log n`. For `n = 1`, and for `n = 0` with Lean's
  `1 / 0 = 0` and `log 0 = 0`, the bonus vanishes; the bounds then read
  `regret ν π n ≤ 3 Σ_a Δ_a`, and the regret is at most `max_a Δ_a`.
- `c = 0`, `ν` a family of Dirac laws and `n ≥ K`: the regret is `Σ_a Δ_a`, so the term
  `3 Σ_a Δ_a` cannot be replaced by a constant below `Σ_a Δ_a`.
- Gaussian arms of variance `1` with means `(0.5, 0)` and `n = 1000`: the bound is
  `1.5 + 16 log 1000 / 0.5 = 222.5`; a simulation gives a regret of about `31.5`, and the same
  simulation confirms the per-arm bound for `c ∈ {1/4, 1, 4}`, `n ≤ 1000` and four mean vectors.
- All arms equal: the regret is `0` and the sum over the arms with `Δ_a > 0` is empty.
- Without the bonus the bound fails. Let arm `0` be Bernoulli of mean `1/2` and arm `1` be
  `dirac (1/4)`, both `1/4`-sub-Gaussian, and play each arm once and then the arm of largest
  `empMean`. With probability `1/2` the first reward of arm `0` is `0` and arm `1` is played for
  ever, so the regret is at least `(n − 2)/8`, which is `249.75` at `n = 2000`, above
  `0.75 + 16 log 2000 = 122.4`.

*Needs:* 1.1, 1.2, 1.3, 2.2; Mathlib `HasSubgaussianMGF.integrable`.

### 3.3 The gap-free bound

Prove (`ucb_regret_le_sqrt`) that under the hypotheses of 3.2,

    regret ν π n ≤ 8 √(c n K log n) + 3 Σ_a Δ_a.

Proof route. For a threshold `Δ > 0`, the arms with `Δ_a < Δ` contribute at most `n Δ` to the
decomposition of 1.3 and the others at most `Σ (3 Δ_a + 16 c log n / Δ)` by the first item of
3.2; take `Δ = 4 √(c K log n / n)`. If `c log n = 0` the first item of 3.2 gives
`regret ν π n ≤ 3 Σ_a Δ_a` directly. (Lattimore and Szepesvári 2020, Theorem 7.2, for `c = 1`.)

**Checks.**

- `K = 2`, `c = 1`, `n = 1000`: `8 √(2000 log 1000) = 940.3`.
- Means `(0.05, 0)`, `c = 1`, `n = 1000`: the bound of 3.2 is `2210.6` and the bound of 3.3 is
  `940.5`; for means `(0.5, 0)` they are `222.5` and `941.8`. Neither bound implies the other.
- `n ≤ 1`: `log n = 0`, for `n = 0` by Lean's `log 0 = 0`, and the bound is `3 Σ_a Δ_a`.
- One arm: the regret is `0`.

*Needs:* 1.3, 3.2.

### Examples

Bernoulli bandits (`c = 1/4`), Gaussian bandits of variance `v` (`c = v`) and deterministic
bandits (`c = 0`), each under explore-then-commit and under a UCB policy.

### Dependencies

Layer 3 uses Layers 1 and 2 and Mathlib's `HasSubgaussianMGF`.

## Layer 4: lower bounds

### 4.1 The divergence decomposition

For two bandits `ν`, `ν'` on the same arms, a policy `π` and `n : ℕ`, prove
(`klDiv_map_restrict_banditLaw`) that the laws of the first `n` rounds satisfy

    klDiv ((banditLaw ν π).map (Finset.restrict (range n)))
          ((banditLaw ν' π).map (Finset.restrict (range n)))
      = Σ_a (∫⁻ ω, pullCount a n ω ∂(banditLaw ν π)) * klDiv (ν a) (ν' a)

in `ℝ≥0∞`, with no finiteness hypothesis. The proof is by induction on `n`. The law of the first
`n + 1` rounds is, up to a measurable equivalence, the law of the first `n` rounds composed with
the kernel that draws the arm of round `n` from the policy at the history and its reward from
`rewardKernel ν` at that arm (1.1; for `n = 0` it is `π.first ⊗ₘ rewardKernel ν`).
`TauCeti.klDiv_compProd_eq_add_lintegral` splits the divergence into that of the first `n`
rounds plus the average over histories of the divergence of the two kernels; at a history where
the policy draws the arm from the law `p`, that divergence is `∫⁻ a, klDiv (ν a) (ν' a) ∂p` by
`TauCeti.klDiv_compProd_right`, and its expectation is
`Σ_a P_ν (A_n = a) * klDiv (ν a) (ν' a)`. A measurable equivalence preserves `klDiv` by two
applications of `klDiv_map_le`. Deduce the **two-bandit inequality**: if the right side `D` is
finite then for every measurable set `B` of histories of `n` rounds, with `A` its preimage under
`Finset.restrict (range n)`,

    exp (−D.toReal) / 2 ≤ P_ν A + P_ν' Aᶜ,

by `half_exp_neg_klDiv_le` and the bound `|P A − Q A| ≤ tvDist P Q / 2`. (Lattimore and
Szepesvári 2020, Lemma 15.1, proved there when the divergences of the arms are finite, and
Theorem 14.2 for the inequality; Garivier, Ménard and Stoltz 2019, the equality in (8).)

**Checks.**

- The constant policy at `a`: the first `n` rounds are independent with laws `ν a` and `ν' a`,
  and both sides are `n * klDiv (ν a) (ν' a)`, the product formula of
  MathematicalStatisticsNonparametric 1.3.
- `ν = ν'`, or `n = 0`: both sides are `0`.
- An arm that is never played does not count: under the constant policy at arm `0`, with
  `ν 0 = ν' 0`, `ν 1 = dirac 0` and `ν' 1 = dirac 1`, the left side is `0` and the right side is
  `0 * ∞ = 0`.
- The expectation is under the first bandit. Arm `0` is Bernoulli of mean `1/2` under `ν` and
  `1/4` under `ν'`, arm `1` is the same under both, and `π` plays arm `0` until its first reward
  `1`, then arm `1`. For `n = 2`, `E_ν (pullCount 0 2 ω) = 3/2` and the divergence is
  `(3/2) · 0.14384 = 0.21576`, which a direct computation on the three outcomes of arm `0`
  confirms: `½ log 2 + ¼ log (4/3) + ¼ log (4/9) = 0.21576`. The expectation under `ν'` is
  `7/4` and would give `0.25172`.
- Finiteness is needed in the two-bandit inequality: one arm, `ν = dirac 0`, `ν' = dirac 1`,
  `n = 1`, `A = {X_0 = 1}`: `P_ν A + P_ν' Aᶜ = 0`, while `D = ∞` has `D.toReal = 0`.

*Needs:* 1.1, 1.2; Tau Ceti `TauCeti.klDiv_compProd_eq_add_lintegral`,
`TauCeti.klDiv_compProd_right`; Mathlib `klDiv`, `klDiv_map_le`, `Finset.restrict`; for the
two-bandit inequality MathematicalStatisticsNonparametric 1.4 (`half_exp_neg_klDiv_le`) and
MathematicalStatisticsFoundations 9.2.

### 4.2 The minimax lower bound for Gaussian bandits

Define the **Gaussian bandit** `gaussianBandit μ v`, with arm laws `gaussianReal (μ a) v`. Prove
that its means are `μ` and that it is `v`-sub-Gaussian (`integral_id_gaussianReal`,
`mgf_id_gaussianReal`). Prove (`exists_le_regret_gaussianBandit`) that for every policy `π`,
every `v : ℝ≥0` and every `n` with `K ≤ n + 1` there is a mean vector `μ : ι → ℝ` with values in
`[0, √v]` such that

    √(v (K − 1) n) / 27 ≤ regret (gaussianBandit μ v) π n.

Proof route, for `v > 0` and `K ≥ 2`. Let `Δ = √(v (K − 1) / (4 n))`, so that `2 Δ ≤ √v`. Fix an
arm `a₁`, let `μ` be `Δ` at `a₁` and `0` elsewhere, choose `b ≠ a₁` minimizing
`E_μ (pullCount b n ω)`, which is then at most `n / (K − 1)`, and let `μ'` be `μ` with the value
`2 Δ` at `b`. By 1.3, `regret (gaussianBandit μ v) π n ≥ (n Δ / 2) P_μ (pullCount a₁ n ω ≤ n/2)`
and `regret (gaussianBandit μ' v) π n ≥ (n Δ / 2) P_μ' (pullCount a₁ n ω > n/2)`. By 4.1 and
`klDiv_gaussianReal` the divergence of the two laws of `n` rounds is
`E_μ (pullCount b n ω) (2 Δ)² / (2 v) ≤ 1/2`, so the two-bandit inequality gives a sum of
regrets of at least `(n Δ / 4) exp (−1/2)`, and one of them is at least
`√(v (K − 1) n) exp (−1/2) / 16`. For `v = 0` or `K = 1` the bound is `0` and 1.3 applies.
(Lattimore and Szepesvári 2020, Theorem 15.2, for `v = 1`, where `K > 1` is assumed; the general
variance is proved here by the same argument. Bubeck and Cesa-Bianchi 2012, Theorem 3.4, is the
Bernoulli analogue with the constant `1/20` and `√(n K)`.)

**Checks.**

- The constant: `exp (−1/2) / 16 = 0.03791 ≥ 1/27 = 0.03704`.
- `gaussianBandit μ 0` is the family of Dirac laws at the `μ a`, a `0`-sub-Gaussian bandit.
- For `v ≠ 0` the divergence between the arms `a` of `gaussianBandit μ v` and
  `gaussianBandit μ' v` is `(μ a − μ' a)² / (2 v)`, by `klDiv_gaussianReal`: for means `0` and
  `1` and `v = 4` it is `1/8`, where a standard deviation `4` would give `1/32`.
- The means of `gaussianBandit μ v` are `μ` and its gaps `max_b μ b − μ a`, whatever `v`; for
  `μ = (0.05, 0.1)` the gaps are `(0.05, 0)`.
- `K = 1`: the left side is `0`, for every `n`.
- The hypothesis `K ≤ n + 1` is needed: for `K = 731`, `n = 1` and `v = 1` the left side is
  `√730 / 27 = 1.0007`, while means in `[0, 1]` give gaps at most `1` and regret at most `1`.
- `v = 0`: the only admissible mean vector is `0`, the rewards are `0` and both sides are `0`.
- The mean vector depends on the policy: for a fixed `μ`, the constant policy at an optimal arm
  has regret `0`, so the quantifiers cannot be exchanged.
- `K = 2`, `n = 100`, `v = 1`: the bound is `10/27 = 0.370` and `Δ = 0.05`; a simulation of the
  UCB policy of 3.2 on the means `(0.05, 0)` and `(0.05, 0.1)` gives regrets of about `2.3`.
- Against 3.3 with `c = v`: the upper bound `8 √(v n K log n)` exceeds this lower bound by the
  factor `216 √(K log n / (K − 1))`.

*Needs:* 1.2, 1.3, 4.1; MathematicalStatisticsNonparametric 1.3 (`klDiv_gaussianReal`); Mathlib
`gaussianReal`, `integral_id_gaussianReal`, `mgf_id_gaussianReal`.

### 4.3 Consistent policies and the Lai–Robbins bound

Say that `π` is **consistent** over a set `E` of bandits (`IsConsistent E π`) if for every
`ν ∈ E` and every real `p > 0`, `regret ν π n / n^p → 0` as `n → ∞`. Prove (`lai_robbins`): let
`ν` be a bandit, `a` an arm and `Q` a probability measure on `ℝ` with a finite mean such that
every `ν b` with `b ≠ a` has a finite mean smaller than the mean of `Q`; let `π` be consistent
over the one-element class `{Function.update ν a Q}`; and let `klDiv (ν a) Q ≠ ∞`. Then for every
real `r` with `r * (klDiv (ν a) Q).toReal < 1`, eventually in `n`,

    r * log n ≤ E_ν (pullCount a n ω).

Proof route. Write `ν' = Function.update ν a Q`, `k = (klDiv (ν a) Q).toReal` and `d > 0` for
the least difference between the mean of `Q` and a mean `mean ν b`, `b ≠ a` (if `K = 1` the
count is `n`). In `ν'` the arm `a` is the only optimal arm and every other gap is at least `d`,
so 1.3 gives `(n d / 2) P_ν' (pullCount a n ω ≤ n/2) ≤ regret ν' π n`. Markov's inequality gives
`P_ν (pullCount a n ω > n/2) ≤ 2 E_ν (pullCount a n ω) / n`. The laws of `n` rounds under `ν` and
`ν'` have divergence `E_ν (pullCount a n ω) * klDiv (ν a) Q` by 4.1, so the two-bandit
inequality yields

    exp (−k E_ν (pullCount a n ω)) / 2 ≤ 2 E_ν (pullCount a n ω) / n + 2 regret ν' π n / (n d).

If `E_ν (pullCount a n ω) < r log n` for infinitely many `n`, with `r > 0`, the left side is
above `n^(−r k) / 2` there, while the right side is `o (n^(−r k))` by consistency with
`0 < p < 1 − r k`: a contradiction. For `r ≤ 0` the claim holds for `n ≥ 1`.

Deduce the form for classes: if `M a` is a set of probability measures for every arm, `π` is
consistent over the product class `{ν | ∀ b, ν b ∈ M b}`, `ν` is in the class with finite means,
`a` is a suboptimal arm and `Q ∈ M a` has a finite mean above `μ⋆` and `klDiv (ν a) Q ≠ ∞`, then
the conclusion holds, since `Function.update ν a Q` is in the class. Hence, by 1.3, for every
set `F` of suboptimal arms, every choice of such a `Q_a` for `a ∈ F` and every
`r < Σ_{a ∈ F} Δ_a / (klDiv (ν a) Q_a).toReal`, eventually `r log n ≤ regret ν π n`; each
divergence is positive because the means of `ν a` and `Q_a` differ. (Lattimore and Szepesvári 2020,
Definition 16.1 and Theorem 16.2, whose proof bounds `P_ν (pullCount a n ω > n/2)` through the
regret on `ν` and so treats suboptimal arms; Garivier, Ménard and Stoltz 2019, Definition 1 and
Theorem 1, for the count of one arm. The statement for a single alternative `Q`, with
consistency required only at `Function.update ν a Q`, is proved here.)

**Checks.**

- `IsConsistent ∅ π` holds for every `π`, and `IsConsistent` is antitone in `E`.
- Over a class `E` of bandits with finite means, the constant policy at `a` is consistent if and
  only if `a` is optimal in every member of `E`: its regret is `n * gap ν a`, and
  `n * gap ν a / √n → 0` only if the gap is `0`.
- The exponent ranges over all `p > 0`: a policy with regret `√n` on `ν` is not consistent over
  `{ν}` (take `p = 1/4`), while one with regret `(log n)²` is.
- Gaussian arms of variance `v > 0`: for `Q = gaussianReal (μ⋆ + ε) v`,
  `klDiv (ν a) Q = (Δ_a + ε)² / (2 v)`, so every `r < 2 v / Δ_a²` is admissible for small `ε`.
  For `v = 1` and `Δ_a = 0.5` the constant is `8`, against `16 / Δ_a² = 64` in 3.2.
- Bernoulli arms: for `ν a` of mean `1/4`, `μ⋆ = 1/2` and `Q` Bernoulli of mean `q ↓ 1/2`, the
  divergence tends to `¼ log ½ + ¾ log (3/2) = 0.13081`, and the constant to `7.645`. The
  divergence with the arguments exchanged is `0.14384`.
- Finiteness of the divergence is needed. Two arms, `ν = (dirac 0, dirac 1)`, `a` the first arm,
  `Q = dirac 2`; `π` plays `a` in round `0` and then `a` for ever if the first reward is `2`,
  the other arm for ever otherwise. On `(dirac 2, dirac 1)` its regret is `0`, so `π` is
  consistent there, and `E_ν (pullCount a n ω) = 1`. Here `klDiv (dirac 0) (dirac 2) = ∞`, whose
  `toReal` is `0`.
- A finite mean of `Q` is needed. Two arms, `ν = (gaussianReal (−2) 1, gaussianReal (−1) 1)`,
  `a` the first arm, `Q` the standard Cauchy law, whose Bochner mean is `0 > −1` and for which
  `klDiv (ν a) Q` is finite; `π` plays `a` once and then the other arm. On
  `Function.update ν a Q` the sum of rewards is not integrable, the regret is `n · 0 − 0 = 0`
  and `π` is consistent, while `E_ν (pullCount a n ω) = 1`.
- One arm: `E_ν (pullCount a n ω) = n`, and `r log n ≤ n` eventually for every `r`.
- `Q = ν a`: the divergence is `0`, every `r` is admissible, and indeed consistency at `ν`
  with `a` the only optimal arm forces `E_ν (pullCount a n ω) = n − o (n^p)`.

*Needs:* 1.2, 1.3, 4.1.

### Examples

The pair of Gaussian bandits with means `(Δ, 0)` and `(Δ, 2Δ)`; the class of Gaussian bandits
of variance `1`; the class of Bernoulli bandits.

### Dependencies

Layer 4 uses Layer 1, Tau Ceti's chain rule for `klDiv`, Mathlib's `klDiv_map_le`,
`Finset.restrict` and `gaussianReal`, MathematicalStatisticsNonparametric 1.3 and 1.4, and
MathematicalStatisticsFoundations 9.2. It does not use Layers 2 and 3.

## Layer 5: adversarial bandits

### 5.1 Oblivious adversaries and regret

An **oblivious adversary** is a reward table `x : ℕ → ι → ℝ`, fixed before the interaction; its
environment is `ρ t = Kernel.deterministic (x t) _`, measurable because `ι` is finite with
measurable singletons. Define the **regret against `x`**,

    advRegret x π n = max_a Σ_{t<n} x t a − E (Σ_{t<n} X_t),

the expectation being for `envLaw ρ π`. Prove that under this law `X_t = x t A_t` for all `t`,
almost surely; that `E (Σ_{t<n} X_t) = Σ_{t<n} Σ_a x t a * P (A_t = a)`; and that if `x t a = y a`
does not depend on `t` then `envLaw ρ π = banditLaw (fun a ↦ dirac (y a)) π` and
`advRegret x π n = regret (fun a ↦ dirac (y a)) π n`. (Lattimore and Szepesvári 2020,
Section 11.1 and equation (11.1), where a policy is any map from histories to laws on the arms;
proved here for the policies of 1.1.)

**Checks.**

- The constant policy at `a`: `advRegret x π n = max_b Σ_{t<n} x t b − Σ_{t<n} x t a`.
- The comparison is with the best single arm: for two arms, `n = 2` and `x t a = 1` if
  `a = t mod 2` and `0` otherwise, `max_a Σ_t x t a = 1`, not `Σ_t max_a x t a = 2`.
- The uniform policy with `x t = (1, 0)` for all `t`: `advRegret x π n = n / 2`.
- The policy playing arm `t mod K` in round `t`, against `x t a = 0` if `a = t mod K` and `1`
  otherwise: for `K = 2`, `n = 10` the regret is `5`, and for `K = 5`, `n = 10` it is `8`,
  that is `n (1 − 1/K)`.
- `n = 0`: `advRegret x π 0 = 0`.

*Needs:* 1.1; Mathlib `Kernel.deterministic`; for the comparison with a Dirac bandit, 1.2 and
1.3.

### 5.2 The importance-weighted estimator and Exp3

For a learning rate `η : ℝ` define by recursion on `t` the **estimated cumulative rewards**
`exp3Est η t ω a` and the **sampling probabilities** `exp3Prob η t ω a`:

    exp3Est η 0 ω a = 0,
    exp3Prob η t ω a = exp (η * exp3Est η t ω a) / Σ_b exp (η * exp3Est η t ω b),
    exp3Est η (t + 1) ω a = exp3Est η t ω a + 1 − [A_t = a] (1 − X_t) / exp3Prob η t ω A_t.

Say that `π` is **the Exp3 policy with learning rate `η`** (`IsExp3 η π`) if `π.first {a} = 1/K`
for every arm and `π.next n (frestrictLe n ω) {a} = exp3Prob η (n + 1) ω a` for every `n`, `ω`
and `a`. Prove that:

- `exp3Est η t` and `exp3Prob η t` are measurable and depend only on the rounds before `t`;
  `exp3Prob η t ω a > 0` and `Σ_a exp3Prob η t ω a = 1`; and for every `η` there is exactly one
  policy with `IsExp3 η π`;
- the increment `1 − [A_t = a] (1 − X_t) / exp3Prob η t ω A_t` is at most `1` when `X_t ≤ 1`;
- unbiasedness: under `IsExp3 η π` and the law of 5.1, for every `x`, `t` and `a`,
  `E (exp3Est η (t + 1) ω a − exp3Est η t ω a) = x t a`, and more precisely the average of the
  increment over `A_t ~ exp3Prob η t ω` is `x t a` for every history; hence
  `E (exp3Est η n ω a) = Σ_{t<n} x t a`;
- for `x` with values in `[0, 1]`, the average over `A_t ~ exp3Prob η t ω` of
  `Σ_a (1 − increment of a)` is `Σ_a (1 − x t a) ≤ K`.

(Lattimore and Szepesvári 2020, equations (11.6) and (11.7) and Algorithm 9; Bubeck and
Cesa-Bianchi 2012, Section 3.1, in terms of losses. Proved here.)

**Checks.**

- `exp3Prob η 0 ω a = 1/K`, and `exp3Prob 0 t ω a = 1/K` for every `t`: `IsExp3 0 π` holds exactly
  for the uniform policy.
- Two arms, `η = 1`, arm `0` played in round `0`. With reward `0` the estimates become
  `(−1, 1)` and `exp3Prob 1 1 ω 0 = 1 / (1 + e²) = 0.1192`; with reward `1` they become `(1, 1)`
  and the probabilities stay `(1/2, 1/2)`.
- Probabilities `(0.2, 0.5, 0.3)` and rewards `(0.3, 0.9, 0)`: the increment of the played arm
  is `−2.5`, `0.8` or `−2.333`, and the three averages are `0.3`, `0.9` and `0`.
- The reward-based estimate `[A_t = a] X_t / exp3Prob η t ω a` is unbiased too, but it is
  `0.3 / 0.2 = 1.5 > 1` in the previous Check; the bound of the second item fails for it.

*Needs:* 1.1, 5.1.

### 5.3 The regret of Exp3

Prove (`exp3_advRegret_le`) that for `η > 0`, `π` with `IsExp3 η π`, every `n` and every `x` with
`x t a ∈ [0, 1]` for `t < n`,

    advRegret x π n ≤ log K / η + η n K / 2,

and (`exp3_advRegret_le_sqrt`) that for `π` with `IsExp3 √(2 log K / (n K)) π` and such `x`,

    advRegret x π n ≤ √(2 n K log K).

Proof route. Fix an arm `i`, write `Ŝ_t` for `exp3Est η t ω`, `W_t = Σ_a exp (η Ŝ_t a)` and
`Ŷ_t a` for `1` minus the increment of `a` in round `t`, which is nonnegative. Then
`exp (η Ŝ_n i) ≤ W_n = K Π_{t<n} W_(t+1) / W_t` and
`W_(t+1) / W_t = e^η Σ_a exp3Prob η t ω a * exp (−η Ŷ_t a)`. By `exp u ≤ 1 + u + u²/2` for
`u ≤ 0` (the difference has derivative `1 + u − exp u ≤ 0` and vanishes at `0`) and
`Real.add_one_le_exp`, the ratio is at most
`exp (η Σ_a P_a (1 − Ŷ_t a) + (η²/2) Σ_a P_a (Ŷ_t a)²)`, and `P_a (Ŷ_t a)² ≤ Ŷ_t a` because
`1 − x t a ≤ 1`. Taking logarithms and dividing by `η`,
`Ŝ_n i − Σ_{t<n} Σ_a P_a (1 − Ŷ_t a) ≤ log K / η + (η/2) Σ_{t<n} Σ_a Ŷ_t a`. The second sum
on the left is `Σ_{t<n} X_t`, because `Σ_a P_a Ŷ_t a = 1 − X_t`, and the expectations of
`Ŝ_n i` and of the sum on the right are given by the last two items of 5.2. The second bound follows
from the first when `n ≥ 1` and `K ≥ 2`; when `n = 0` or `K = 1` the learning rate is `0`, the
policy is uniform and both sides are `0`. (Lattimore and Szepesvári 2020, Theorem 11.2 and
inequalities (11.14) and (11.15); Bubeck and Cesa-Bianchi 2012, Theorem 3.1, bounds (3.2) and
(3.4). Theorem 11.1 of the first, `2 √(n K log K)` at the learning rate `√(log K / (n K))`,
follows from the first bound, which gives `(3/2) √(n K log K)` there.)

**Checks.**

- Exact computation over all action sequences. `K = 2`, `x t = (1, 0)`, tuned learning rate:
  for `n = 1, 2, 3, 6` the regret is `0.5000`, `0.8678`, `1.1912`, `1.9916` and the bound is
  `1.6651`, `2.3548`, `2.8841`, `4.0787`. For `η = 1`, `n = 2`: the regret is `0.8096` and the
  first bound is `log 2 + 2 = 2.693`.
- Over `K ≤ 4`, `n ≤ 7`, twelve reward tables and six learning rates in `[0.01, 10]`, the
  largest ratio of the exact regret to the first bound is `0.426`.
- `η > 0` is needed: `IsExp3 0` is the uniform policy, with regret `n/2` on `x t = (1, 0)`,
  while Lean's `log 2 / 0 + 0 = 0`.
- The range `[0, 1]` is needed: `K = 2`, `n = 1`, `x 0 = (4, 0)` and `η = 1` give regret `2`,
  above `log 2 + 1 = 1.693`.
- `K = 1`: the regret is `0` and the first bound is `η n / 2`.
- `n = 100`, `K = 10`: `√(2 n K log K) = 67.86`, against `2 √(n K log K) = 95.97`.

*Needs:* 5.1, 5.2; Mathlib `Real.add_one_le_exp`.

### Examples

Two arms with the constant table `(1, 0)`; the alternating table of the second Check of 5.1;
the uniform policy as Exp3 with learning rate `0`.

### Dependencies

Layer 5 uses 1.1, Mathlib's `Kernel.deterministic` and `Real.add_one_le_exp`, and 1.2 and 1.3
only for the comparison of 5.1 with a Dirac bandit. It does not use Layers 2, 3 and 4.

## Downstream consumers

The law of 1.1 and the predicate `Policy.PlaysIn` serve any sequential problem in which a learner
chooses among finitely many actions and observes a real reward. The bound of 2.1 is the
concentration step in the analysis of index policies for sub-Gaussian rewards, and 4.1 with its
two-bandit inequality is the first step of lower bounds for regret and for the identification
of the best arm. The estimator of 5.2 and the potential argument of 5.3 apply to
exponential-weights policies with bandit feedback.

## Coordination

[LML](https://github.com/LeanMachineLearning/LML), the Lean Machine Learning library
(Lean 4 on Mathlib, Apache-2.0), formalizes the interaction of an algorithm with an environment
through the Ionescu-Tulcea construction, the regret decomposition, the explore-then-commit bound
in the form of 3.1 with a variance proxy, a regret bound for an upper confidence bound policy
with other constants, and the divergence decomposition of 4.1 for general action spaces.
An implementation of Layers 1 to 3 and of 4.1 compares its statements with that library and
reuses its proofs only as its licence and its authors allow; the statements of this roadmap are
the specification.

## Provenance

The statements were written from the literature cited below. The library named under
[Coordination](#coordination) is prior work on Layers 1 to 3 and on 4.1; its carriers differ
from those of this roadmap (an algorithm and an environment with observations, and a predicate
on sequences of random variables on an arbitrary probability space, against the structure
`Policy` and the law `envLaw` on the trajectory space here).
[lean4-mlir](https://github.com/brettkoonce/lean4-mlir) (Lean 4, BSD-3), by the author of this
roadmap, trains reinforcement-learning agents and contains no proofs on bandits. These are
reference material, not the specification.

## References

- P. Auer, N. Cesa-Bianchi and P. Fischer, *Finite-time analysis of the multiarmed bandit
  problem*, Mach. Learn. **47** (2002), 235–256.
- S. Bubeck and N. Cesa-Bianchi, *Regret analysis of stochastic and nonstochastic multi-armed
  bandit problems*, Found. Trends Mach. Learn. **5** (2012), 1–122, arXiv:1204.5721 (the
  numbering cited is that of the arXiv version 2).
- A. Garivier, P. Ménard and G. Stoltz, *Explore first, exploit next: the true shape of regret
  in bandit problems*, Math. Oper. Res. **44** (2019), 377–399, arXiv:1602.07182 (the numbering
  cited is that of the arXiv version 3).
- T. Lattimore and Cs. Szepesvári, *Bandit algorithms*, Cambridge University Press, 2020; the
  authors' online edition at <https://tor-lattimore.com/downloads/book/book.pdf>.

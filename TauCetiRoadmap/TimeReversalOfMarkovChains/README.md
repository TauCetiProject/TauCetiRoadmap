# Roadmap: time reversal of markov chains

**Summary.** A Markov chain watched backwards is again a Markov chain, but in general a different
one: its transition laws come from the forward ones by Bayes' formula, with the law of the chain
at each time as the prior. This roadmap proves it in discrete time on standard Borel spaces,
with kernels that may change from step to step, and in continuous time on a finite set, with
jump rates that may change with time; for stationary chains it characterizes those equal to
their reversal.

- *The reverse Markov property.* Let a chain on a standard Borel space start from a finite law
  `μ`, move from time `n` to `n + 1` by a Markov kernel `Pₙ`, and have law `qₙ` at time `n`. Read
  backwards from a horizon `T`, it is the chain started from `q_T` whose step from forward time
  `n + 1` to `n` is the posterior of `Pₙ` under the prior `qₙ`. At a point `x` with
  `qₙ₊₁{x} > 0` that posterior gives `y` the mass `qₙ{y} Pₙ(y, {x}) / qₙ₊₁{x}`.
- *Stationary chains.* If `π` is invariant for `κ`, the stationary chain read backwards is the
  stationary chain of the posterior kernel `κ̂` of `κ` under `π`; at a point with `π(x) > 0`,
  `κ̂(x, {y}) = π{y} κ(y, {x}) / π{x}`. The kernel is reversible for `π` exactly when `π` is
  invariant and `κ̂ = κ` almost everywhere for `π`; for invariant `π` and `T ≥ 1`, exactly when the
  stationary path law up to time `T` is unchanged by reversing time.
- *Time-dependent rates.* On a finite set, continuous rates `Q(t)` have a propagator `P(s, t)`,
  the solution of `∂ₜ P = P Q(t)` with `P(s, s) = I`. Every solution of `p′ = p Q` on `[a, b]`
  is `p(t) = p(a) P(a, t)` there, and `P(s, t)` is stochastic when `s ≤ t` and every `Q(r)`,
  `r ∈ [s, t]`, is a rate matrix (nonnegative off the diagonal, rows summing to zero).
- *Their reversal.* If moreover `Q(t)` is a rate matrix on `[0, T]` and `p` is a positive
  solution of `p′ = p Q` there, the reversed rates `Q̂(s)ᵢⱼ = pⱼ(T − s) Q(T − s)ⱼᵢ / pᵢ(T − s)`
  (`i ≠ j`, rows summing to zero) form a rate matrix, `s ↦ p(T − s)` solves the forward
  equation of `Q̂`, and the Bayes transition matrices of the reversed chain are stochastic and
  solve the forward equation of `Q̂` from the identity.

The roadmap builds on Mathlib's posterior kernels, Ionescu-Tulcea trajectories and reversible
kernels, and on Tau Ceti's Dyson series. ContinuousTimeMarkovChains supplies rate matrices and
the constant-rate theory that Layers 3 and 4 extend; DiracScatteringAndNonlinearFourierTransform
supplies the composition law of propagators. DenoisingDiffusion states the reverse Markov
property of its Gaussian noising chain, which the first theorem, with the uniqueness of the
reversed kernels, generalizes.

Layer 1 below treats path laws, the reverse Markov property and Bayes' formula at atoms; Layer 2
uses it for invariant laws and reversibility. Layer 3 builds the propagator and Layer 4 reverses
it; they do not use Layers 1 and 2. A worked example reverses the uniform noising chain of
discrete-state diffusion models.

## Conventions

- **Discrete time.** `E` is a measurable space. Statements that involve a posterior kernel
  assume `[StandardBorelSpace E]` and `[Nonempty E]`, which Mathlib's
  `ProbabilityTheory.posterior` requires of the space of the prior. A chain is a family
  `P : ℕ → Kernel E E` of Markov kernels, `P n` moving the chain from time `n` to time `n + 1`;
  a time-homogeneous chain is the constant family `fun _ ↦ κ`. Initial laws are finite measures.
  The state space does not change with time.
- **Paths.** A path up to time `T` is an element of `Π i : Finset.Iic T, E`; `pathEval i hi x`
  is its value at time `i ≤ T` and `reverseIndex T x` is the reversed path,
  `(reverseIndex T x) i = x (T − i)`. Both maps are DenoisingDiffusion's (its Conventions, paths,
  and Layer 4, the variational bound), copied verbatim into `Suggested.lean`; there `E` is
  `EuclideanSpace ℝ (Fin d)`, here any measurable space.
- **Posteriors.** For a kernel `κ : Kernel Ω X` and a finite measure `μ` on `Ω`, `κ†μ` is
  Mathlib's posterior (scoped notation of `ProbabilityTheory`): the Markov kernel from `X` to `Ω`
  with `(κ ∘ₘ μ) ⊗ₘ κ†μ = (μ ⊗ₘ κ).map Prod.swap`. It is determined only up to a
  `κ ∘ₘ μ`-null set of points of `X`, so statements about it are equalities of measures or
  equalities almost everywhere, and pointwise only at points of positive mass.
- **Stationarity and reversibility** are Mathlib's `Kernel.Invariant κ π` (`π.bind κ = π`) and
  `Kernel.IsReversible κ π` (`∫⁻ x in A, κ x B ∂π = ∫⁻ x in B, κ x A ∂π` for measurable `A`,
  `B`), with `π` a finite measure.
- **Continuous time.** `S` is a finite type with `[DecidableEq S]`; it may be empty. Matrices are
  `Matrix S S ℝ`, rows index the starting state, and a distribution is a row vector
  `p : S → ℝ`, acted on as `p ᵥ* M`. A rate function is `Q : ℝ → Matrix S S ℝ`, continuous in
  each entry on all of `ℝ`; rates given on an interval are extended by constants outside it, and
  no statement uses their values outside the interval it names. Q-matrices are as in
  ContinuousTimeMarkovChains, Layer 1, Q-matrices (1.1). Stochastic matrices are members of
  Mathlib's `Matrix.rowStochastic ℝ S`.
- **Derivatives.** Derivatives of row vectors `p : ℝ → S → ℝ` are taken in the product norm and
  within the closed interval named, so at its endpoints they are one-sided. Derivatives of
  matrix-valued functions are taken entry by entry. Mathlib puts no norm on matrices; the
  propagator of 3.1 is defined with the operator norm `Matrix.linftyOpNormedRing`,
  `Matrix.linftyOpNormedAlgebra` as local instances, and every statement uses only its entries.
- **Division.** Real division by zero is `0` in Lean, and in `ℝ≥0∞` `a / 0 = ⊤` for `a ≠ 0`.
  Every statement that divides by a probability assumes it positive, and the Checks record what
  the junk values give otherwise.

## Layer 1: chains with time-dependent kernels and their reversal

### 1.1 The path law and its marginals

Define `chainPath μ P T`, the law on `Π i : Iic T, E` of the chain with initial law `μ` and
kernels `P`, as `Kernel.partialTraj` of the kernels `(P n).comap (pathEval n le_rfl)` from time
`0` to `T`, composed with the transport of `μ` to paths of length one. Define the marginals by
`chainMarginal μ P 0 = μ` and `chainMarginal μ P (t + 1) = P t ∘ₘ chainMarginal μ P t`, the
Chapman–Kolmogorov recursion for laws; they are finite measures (`isFiniteMeasure_chainMarginal`).
Prove:

- for `t ≤ T`, `(chainPath μ P T).map (pathEval t ht) = chainMarginal μ P t`;
- for `t < T`, the joint law of the states at times `t` and `t + 1` is
  `chainMarginal μ P t ⊗ₘ P t`;
- for `T ≤ T′`, restricting `chainPath μ P T′` to the times up to `T` gives `chainPath μ P T`;
- for a constant family, `chainPath μ (fun _ ↦ κ) T` is the restriction to the times up to `T` of
  Tau Ceti's `markovChainLaw μ κ`, the law of the time-homogeneous chain on `ℕ → E`.

Route: the first three by induction on `T` from `Kernel.partialTraj_succ_eq_comp` and
`Kernel.partialTraj_map_frestrictLe₂`; the last from `Kernel.traj_map_frestrictLe`, since
`markovChainLaw` is the trajectory measure of the same kernels. (Proved here.)

The marginal at time `t` is `μ.bind` of the composite kernel that applies `P 0` up to `P (t − 1)`;
these products of kernels and their Chapman–Kolmogorov identity are SimulatedAnnealing's (Layer 2,
products of kernels, 2.1) and are not restated here, where only the measures are defined. Tau
Ceti's `TauCeti.Measure.prefixChainMeasure` is a path law of the same shape built from prescribed
joint laws of consecutive states, stepping by their conditional kernels; `chainPath` takes the
kernels themselves, so it needs no disintegration and no standard Borel hypothesis.

**Checks.**
- `T = 0`: `chainPath μ P 0` is the image of `μ` under `x ↦ (fun _ ↦ x)`, and its only marginal
  is `μ`.
- On `{0, 1}` with `μ = (1/2, 1/2)` and `P 0` the matrix with rows `(1/2, 1/2)` and `(1/4, 3/4)`,
  `chainMarginal μ P 1 = (3/8, 5/8)`. Composing in the other order, the matrix times the column
  vector `μ`, gives `(1/2, 1/2)`, which is not the law at time `1`.

*Needs:* Mathlib `Kernel.partialTraj`, `Kernel.partialTraj_succ_eq_comp`,
`Kernel.partialTraj_map_frestrictLe₂`, `Kernel.traj_map_frestrictLe`, `Kernel.comap`,
`Measure.bind`; Tau Ceti `TauCeti.Probability.markovChainLaw`; DenoisingDiffusion (the path
maps `pathEval` and `reverseIndex`).

### 1.2 The reverse Markov property

Define `reversedKernel μ P T n = P (T − n − 1) † chainMarginal μ P (T − n − 1)`: the step of the
reversed chain from reversed time `n` to `n + 1`, which is forward time `T − n` to `T − n − 1`.
Prove `chainPath_map_reverseIndex`: for a finite `μ` and Markov kernels on a nonempty standard
Borel space, `(chainPath μ P T).map (reverseIndex T)` equals
`chainPath (chainMarginal μ P T) (reversedKernel μ P T) T`. Read backwards, the chain is the
chain started at its law at time `T` whose kernels are the Bayes reversals of the forward
kernels under the forward marginals.

- *Uniqueness of the reversed kernels.* If Markov kernels `R t` satisfy, for `1 ≤ t ≤ T`, that
  the joint law of `(x t, x (t − 1))` under `chainPath μ P T` is `chainMarginal μ P t ⊗ₘ R t`,
  then `R t` agrees with `P (t − 1) † chainMarginal μ P (t − 1)` almost everywhere for
  `chainMarginal μ P t`, and the reversed path law is the chain started at
  `chainMarginal μ P T` with kernels `n ↦ R (T − n)`. The reverse Markov property of
  DenoisingDiffusion, Layer 4, the reverse Markov property and the path divergence (4.1), is this
  statement for `E = EuclideanSpace ℝ (Fin d)`, `μ` a probability measure and the Gaussian
  noising kernels as `P`, its marginals being `chainMarginal` by its 2.2, the forward chain and
  its marginals.

Route: by induction on `T`. The joint law of `(x T, x (T + 1))` is
`chainMarginal μ P T ⊗ₘ P T` (1.1), which Mathlib's `compProd_posterior_eq_map_swap` rewrites as
the swap of `chainMarginal μ P (T + 1) ⊗ₘ (P T † chainMarginal μ P T)`. Given `x T`, the earlier
states do not depend on `x (T + 1)` (the Markov property of `Kernel.partialTraj`), so the reversed
path up to `T + 1` is the first reversed step followed by the reversed path up to `T`, whose law
given its starting point is identified by the induction hypothesis and the almost-everywhere
uniqueness of disintegrations, `Kernel.ae_eq_of_compProd_eq`. The uniqueness bullet is
`ae_eq_posterior_of_compProd_eq` and `Measure.compProd_congr`. For a stationary irreducible chain
on a finite set the statement is the formula `Pπ{X₀ = x₀, …} = Pπ{X̂₀ = xₜ, …}` of LPW,
Proposition 1.23, p. 14; the general statement is proved here.

**Checks.**
- `T = 0`: `reverseIndex 0` is the identity, `chainMarginal μ P 0 = μ`, and both sides are
  `chainPath μ P 0`.
- The example of 1.1: the posterior kernel has rows `(2/3, 1/3)` at `x = 0` and `(2/5, 3/5)` at
  `x = 1` (1.3), and the reversed law of `(x 0, x 1)` puts mass `1/4, 1/8, 1/4, 3/8` on
  `(0, 0), (0, 1), (1, 0), (1, 1)`, as `(3/8) · (2/3, 1/3)` and `(5/8) · (2/5, 3/5)` give. Taking
  the time-`1` marginal `(3/8, 5/8)` as the prior instead (an index shift) gives the row
  `(6/11, 5/11)` at `x = 0` and the wrong mass `(3/8)(6/11) = 9/44` at `(0, 0)`.
- Null points do not matter: with `μ = δ₀` and `P 0` the identity on `{0, 1}`, the time-`1` law is
  `δ₀`, the posterior at `1` is not determined, and both sides are `δ_(0, 0)` whatever it is.

*Needs:* 1.1; Mathlib `ProbabilityTheory.posterior`, `compProd_posterior_eq_map_swap`,
`ae_eq_posterior_of_compProd_eq`, `Kernel.ae_eq_of_compProd_eq`, `Measure.compProd_congr`,
`Kernel.partialTraj_succ_eq_comp`.

### 1.3 Bayes' formula at atoms

Prove `posterior_apply_singleton_eq_div`: for a finite kernel `κ : Kernel Ω X` from a nonempty
standard Borel space, a finite measure `μ` on `Ω`, singletons measurable in `X`, and a point `x`
with `(κ ∘ₘ μ) {x} ≠ 0`, `(κ†μ) x {ω} = μ {ω} * κ ω {x} / (κ ∘ₘ μ) {x}` for every `ω`, in `ℝ≥0∞`.
For a chain this is `reversedKernel μ P T n x {y} = qₖ{y} · P k y {x} / qₖ₊₁{x}` with
`k = T − n − 1`, `qₖ = chainMarginal μ P k` and `qₖ₊₁{x} > 0`.

Route: evaluate `compProd_posterior_eq_map_swap` on the rectangle `{x} ×ˢ {ω}` with
`Measure.compProd_apply_prod` on both sides; the left side is `(κ ∘ₘ μ) {x} · (κ†μ) x {ω}` by
`lintegral_singleton`, and the right side is `μ {ω} · κ ω {x}`. Singletons of `Ω` are measurable
because `Ω` is standard Borel. The argument uses no countability of `Ω` or `X`; Mathlib's
`posterior_eq_withDensity_of_countable` gives the posterior almost everywhere, as a density with
respect to `μ`, when `Ω` is countable, and the statement here is the value at a single point of
positive mass for any standard Borel `Ω`. (LPW, equation (1.32), p. 14, for the stationary finite
case; proved here.)

**Checks.**
- The example of 1.1: at `x = 0` the masses are `(1/2 · 1/2)/(3/8) = 2/3` and
  `(1/2 · 1/4)/(3/8) = 1/3`; at `x = 1` they are `(1/2 · 1/2)/(5/8) = 2/5` and
  `(1/2 · 3/4)/(5/8) = 3/5`. Each row sums to `1`.
- Dividing by the prior mass `μ{x}` instead of `(κ ∘ₘ μ){x}` gives the row `(1/2, 1/4)` at
  `x = 0` in the same example, which does not sum to `1`.
- The hypothesis `(κ ∘ₘ μ) {x} ≠ 0` is needed: if it fails, every `μ {ω} · κ ω {x}` vanishes, the
  right side is `0 / 0 = 0` for every `ω`, and the posterior at `x` is a probability measure.

*Needs:* Mathlib `compProd_posterior_eq_map_swap`, `Measure.compProd_apply_prod`,
`lintegral_singleton`.

### Examples

The two-state chain of 1.1 with its posterior rows, the identity chain started at a point, and
the deterministic two-cycle on `{0, 1}` started at `0`, whose reversed path up to `T = 1` is
`(1, 0)`.

### Dependencies

Mathlib `Kernel.partialTraj`, `Kernel.partialTraj_succ_eq_comp`,
`Kernel.partialTraj_map_frestrictLe₂`, `Kernel.traj_map_frestrictLe`, `Kernel.comap`,
`Measure.bind`, `ProbabilityTheory.posterior`, `compProd_posterior_eq_map_swap`,
`ae_eq_posterior_of_compProd_eq`, `Kernel.ae_eq_of_compProd_eq`, `Measure.compProd_congr`,
`Measure.compProd_apply_prod`, `lintegral_singleton`; Tau Ceti
`TauCeti.Probability.markovChainLaw`; DenoisingDiffusion (the path maps). No other layer.

## Layer 2: stationary chains and reversibility

Throughout, `κ : Kernel E E` is a Markov kernel and `π` a finite measure on `E`.

### 2.1 The reversed chain of a stationary chain

Let `κ.Invariant π`. The reversed kernel is `κ†π`. Prove:

- `κ†π` is a Markov kernel (Mathlib's instance) and `π` is invariant for it, by
  `posterior_comp_self` and `κ ∘ₘ π = π`;
- the Bayes identity `π ⊗ₘ κ†π = (π ⊗ₘ κ).map Prod.swap`, which is `compProd_posterior_eq_map_swap`
  with `κ ∘ₘ π = π`;
- reversal is an involution: `(κ†π)†π` agrees with `κ` almost everywhere for `π`, by
  `posterior_posterior`;
- at a point with `π {x} ≠ 0`, `(κ†π) x {y} = π {y} * κ y {x} / π {x}` (1.3);
- `chainPath_map_reverseIndex_of_invariant`: the stationary chain read backwards is the
  stationary chain of `κ†π`, `(chainPath π (fun _ ↦ κ) T).map (reverseIndex T)` equals
  `chainPath π (fun _ ↦ κ†π) T` for every `T` (LPW, (1.32) and Proposition 1.23, p. 14, for
  finite irreducible chains; here from 1.2, whose marginals are all `π`).

**Checks.**
- The deterministic cycle `0 → 1 → 2 → 0` with the uniform law: `κ†π` is the cycle
  `0 → 2 → 1 → 0`, run the other way.
- The walk on the 3-cycle that steps forward with probability `2/3` and back with `1/3` (LPW,
  Example 1.22, p. 14, on the `n`-cycle) has the uniform invariant law, and `κ†π` is the walk with
  the two probabilities exchanged.
- The two-state kernel with `κ 0 {1} = 1/3`, `κ 1 {0} = 1/6` and `π = (1/3, 2/3)` satisfies
  detailed balance, and `κ†π = κ`.
- Invariance is needed: for the deterministic two-cycle on `{0, 1}` started at `δ₀` and `T = 1`,
  the reversed path is `(1, 0)` with probability one, while a chain started at `δ₀` starts at `0`.

*Needs:* 1.1, 1.2, 1.3; Mathlib `Kernel.Invariant`, `posterior_comp_self`,
`compProd_posterior_eq_map_swap`, `posterior_posterior`.

### 2.2 Reversibility

Prove:

- `κ.IsReversible π` holds exactly when `(π ⊗ₘ κ).map Prod.swap = π ⊗ₘ κ`, for every
  measurable space `E`: the two measures agree on rectangles `A ×ˢ B` exactly under detailed
  balance, and rectangles form a π-system generating the product σ-algebra
  (`Measure.ext_of_generateFrom_of_iUnion`, `Measure.compProd_apply_prod`);
- `isReversible_iff_invariant_and_ae_eq_posterior`: `κ.IsReversible π` holds exactly when
  `κ.Invariant π` and `κ†π` agrees with `κ` almost everywhere for `π`. Route: a reversible
  Markov kernel leaves `π` invariant (`Kernel.IsReversible.invariant`); with `κ ∘ₘ π = π` the
  previous bullet and `ae_eq_posterior_of_compProd_eq` give the agreement, and conversely
  `Measure.compProd_congr` and the Bayes identity of 2.1 give the swap invariance;
- `isReversible_iff_map_reverseIndex_eq`: for an invariant `π` and `T ≥ 1`, on every measurable
  space `E`, `κ.IsReversible π` holds exactly when
  `(chainPath π (fun _ ↦ κ) T).map (reverseIndex T) = chainPath π (fun _ ↦ κ) T`. Route: under
  detailed balance the measure of a cylinder `A₀ × ⋯ × A_T` is symmetric under reversal, by
  induction on `T` from the swap invariance of `π ⊗ₘ κ` and the invariance of `π`; conversely
  the image of both sides under `x ↦ (x 0, x 1)` is `(π ⊗ₘ κ).map Prod.swap` on the left, since
  `(x T, x (T − 1))` under the stationary law is the swap of `(x (T − 1), x T)`, and `π ⊗ₘ κ` on
  the right.

(LPW, equations (1.29)–(1.31), p. 13, for the direction from detailed balance to the reversal
invariance on finite spaces; the converses and the general spaces are proved here.)

**Checks.**
- `T ≥ 1` is needed: the cycle `0 → 1 → 2 → 0` with the uniform law is not reversible
  (`π{0} κ 0 {1} = 1/3` and `π{1} κ 1 {0} = 0`), while its path law up to `T = 0` is unchanged by
  reversal.
- Invariance is needed in the last statement: for the deterministic two-cycle on `{0, 1}` and
  `π = δ₀`, the path law up to `T = 2` is the point mass at `(0, 1, 0)`, which reversal fixes, but
  `κ` is not reversible for `δ₀`.
- The 3-cycle with uniform law is invariant and `κ†π ≠ κ`; the two-state kernel of 2.1 is
  reversible and its path law up to `T = 2` gives `(0, 0, 1)` and `(1, 0, 0)` the same mass
  `1/3 · 2/3 · 1/3 = 2/27`.

*Needs:* 1.1, 2.1; Mathlib `Kernel.IsReversible`, `Kernel.IsReversible.invariant`,
`ae_eq_posterior_of_compProd_eq`, `Measure.compProd_congr`,
`Measure.ext_of_generateFrom_of_iUnion`, `Measure.compProd_apply_prod`.

### Examples

Cycles with and without bias, the two-state chain, and the Metropolis chains for a target law on
three states, whose posterior kernel is the chain itself.

### Dependencies

Layer 1 (1.1, 1.2, 1.3). Mathlib `Kernel.Invariant`, `Kernel.IsReversible`,
`Kernel.IsReversible.invariant`, `posterior_comp_self`, `compProd_posterior_eq_map_swap`,
`posterior_posterior`, `ae_eq_posterior_of_compProd_eq`, `Measure.compProd_congr`,
`Measure.ext_of_generateFrom_of_iUnion`, `Measure.compProd_apply_prod`.

## Layer 3: propagators of time-dependent rates

### 3.1 Q-matrices and the propagator

`IsMetzler B` (every off-diagonal entry nonnegative) and `IsQMatrix Q` (Metzler with rows
summing to zero) are the definitions of ContinuousTimeMarkovChains, Layer 1, Q-matrices (1.1),
copied verbatim. Define the propagator of a rate function as the Dyson series of the shifted
coefficient, `propagator Q s t = TauCeti.dysonSeries (fun r ↦ Q (s + r)) (t − s)`. For `Q`
continuous, prove:

- `propagator Q s s = 1`;
- the forward equation: `t ↦ propagator Q s t` has derivative `propagator Q s t * Q t` at every
  `t`, from `TauCeti.hasDerivAt_dysonSeries` and the chain rule for the shift;
- the identification: for all real `s` and `t`, the linear map `v ↦ v ᵥ* propagator Q s t` of
  row vectors is the propagator `N_A(t, s)` of DiracScatteringAndNonlinearFourierTransform,
  Layer 1, the propagator (1.3), on `E = S → ℝ` for the coefficient `A(r) v = v ᵥ* Q(r)`. Both
  are the identity at `t = s` and their matrices solve `M′ = M Q(t)` on all of `ℝ`, so
  `TauCeti.eq_of_hasDerivAt_mul` makes them equal;
- the backward equation: `s ↦ propagator Q s t` has derivative `−Q s * propagator Q s t` at
  every `s`, from the forward equation in the second variable, `propagator Q s t` being the
  inverse of `propagator Q t s`, and the derivative of the inverse. DiracScattering 1.3 gives
  this derivative at almost every `s` for integrable coefficients; here it holds at every `s`.

Through the identification, the composition law of DiracScattering 1.3 reads
`propagator Q r s * propagator Q s t = propagator Q r t` for all real `r`, `s`, `t` in any order,
so `propagator Q s t` is invertible with inverse `propagator Q t s`, and its locality clause says
that `propagator Q s t` depends only on the rates between `s` and `t`. These are used below and
not restated as targets. (Campbell et al., Appendix A, pp. 15–16, state the forward and backward
equations for time-dependent rates; proved here from the supplier series.)

**Checks.**
- A constant `Q`: `propagator Q s t = exp((t − s)Q)`, since both solve the forward equation with
  the value `1` at `t = s` (`hasDerivAt_exp_smul_const`, `TauCeti.eq_mul_dysonSeries`); this is
  the transition function of ContinuousTimeMarkovChains, Layer 1, stochastic exponentials (1.3),
  and Layer 2, uniqueness for the Kolmogorov equations (2.1).
- `Q(t) = β(t) (J − nI)` on `n ≥ 1` states, with `J` the matrix of ones and `β` continuous:
  `propagator Q s t = J/n + exp(−n ∫ₛᵗ β)(I − J/n)`, because `(J/n)(J − nI) = 0` and
  `(I − J/n)(J − nI) = −n(I − J/n)`, so the right side solves the forward equation with the
  value `I` at `t = s`.
- The composition law on these uniform rates: with `K = I − J/n`, which satisfies `K² = K` and
  `(J/n)K = 0`, the product `(J/n + aK)(J/n + bK)` is `J/n + abK`, and
  `exp(−nB(r, s)) exp(−nB(s, t)) = exp(−nB(r, t))` for `B(s, t) = ∫ₛᵗ β`, in every order of `r`,
  `s`, `t`.

*Needs:* Tau Ceti `TauCeti.dysonSeries`, `TauCeti.hasDerivAt_dysonSeries`,
`TauCeti.eq_mul_dysonSeries`, `TauCeti.eq_of_hasDerivAt_mul`; Mathlib `Matrix.linftyOpNormedRing`,
`Matrix.linftyOpNormedAlgebra`, `hasDerivAt_exp_smul_const`; ContinuousTimeMarkovChains 1.1;
DiracScatteringAndNonlinearFourierTransform 1.3.

### 3.2 Marginals and uniqueness on intervals

Prove `eq_vecMul_propagator`: for `Q` continuous, every `p : ℝ → S → ℝ` with derivative
`p t ᵥ* Q t` within `[a, b]` at every `t ∈ [a, b]` is `p t = p a ᵥ* propagator Q a t` there. So
the law of a chain with rates `Q` at time `t` is its law at time `a` times the propagator. Through
the identification of 3.1 this is the uniqueness clause of DiracScattering 1.2 on `E = S → ℝ`,
stated for the Dyson-series propagator and for solutions differentiable within `[a, b]`; Tau
Ceti's `TauCeti.eq_dysonSeriesLeft_apply` is the corresponding statement for solutions on all of
`ℝ`. It is the form in which 3.3 and Layer 4 use the propagator.

Route: `t ↦ p a ᵥ* propagator Q a t` solves the same equation (3.1). For uniqueness on `[a, b]`,
the field `q ↦ q ᵥ* Q(t)` is Lipschitz in `q` for the sup norm, uniformly for `t ∈ [a, b]`, with
constant the number of states times the largest `|Q(t)ᵢⱼ|`, `t ∈ [a, b]`; Mathlib's
`ODE_solution_unique_of_mem_Icc_right` applies. The same argument gives uniqueness on `[a, b]` for
matrix solutions of `M′ = M Q(t)`, and it uses the rates on `[a, b]` only. (Proved here.)

**Checks.**
- `a = b`: the statement reads `p a = p a ᵥ* 1`. For `a > b` the interval is empty and the
  statement is vacuous.
- The Lipschitz constant cannot be taken to be the operator norm `‖Q(t)‖` of the Conventions
  (largest absolute row sum): for `Q = [[1, 0], [1, 0]]` and `q = (1, 1)`, `‖Q‖ = 1` and the sup
  norm of `q` is `1`, but `q ᵥ* Q = (2, 0)`.

*Needs:* 3.1; Mathlib `ODE_solution_unique_of_mem_Icc_right`.

### 3.3 Stochasticity

Prove `propagator_mem_rowStochastic`: if `Q` is continuous, `s ≤ t`, and `Q r` is a Q-matrix for
every `r ∈ [s, t]`, then `propagator Q s t` is a stochastic matrix.

Route: choose `c ≥ 0` at least `−Q(r)ᵢᵢ` for all `r ∈ [s, t]` and `i`, possible by continuity on
a compact interval. Then `Q(r) + c·1` has nonnegative entries on `[s, t]`, so each term of the
Dyson series of `r ↦ Q(s + r) + c·1` at `t − s`, an iterated integral over `[0, t − s]` of
products of nonnegative matrices, is nonnegative; and `propagator Q s t` is `e^(−c(t − s))` times
that series, both sides solving the forward equation on all of `ℝ` (3.1,
`TauCeti.eq_of_hasDerivAt_mul`). Rows: `Q(r) *ᵥ 1 = 0` on `[s, t]`, so
`t ↦ propagator Q s t *ᵥ 1` has derivative `0` there and stays `1`. (Proved here; for constant
`Q` this is ContinuousTimeMarkovChains 1.3.)

**Checks.**
- `s ≤ t` is needed: for the constant `Q = [[−1, 1], [1, −1]]`, `propagator Q 1 0 = exp(−Q)` has
  the entry `(1 − e²)/2 ≈ −3.19`.
- Only the interval matters: rates that are not Q-matrices outside `[s, t]` do not affect
  `propagator Q s t` (the locality of 3.1).
- The row condition is needed: for the constant Metzler matrix `[[−1, 1], [0, −1]]` the rows of
  the propagator over a time `1` sum to `2e^(−1)` and `e^(−1)`.

*Needs:* 3.1; Tau Ceti `TauCeti.dysonTerm`, `TauCeti.eq_of_hasDerivAt_mul`; Mathlib
`Matrix.rowStochastic`, `Matrix.mem_rowStochastic_iff_sum`.

### Examples

Constant rate matrices, whose propagators are matrix exponentials, and the uniform rates
`β(t)(J − nI)` with their closed-form propagator.

### Dependencies

Tau Ceti `TauCeti.dysonSeries`, `TauCeti.dysonTerm`, `TauCeti.hasDerivAt_dysonSeries`,
`TauCeti.eq_mul_dysonSeries`, `TauCeti.eq_of_hasDerivAt_mul`; Mathlib
`Matrix.linftyOpNormedRing`, `Matrix.linftyOpNormedAlgebra`, `hasDerivAt_exp_smul_const`,
`ODE_solution_unique_of_mem_Icc_right`, `Matrix.rowStochastic`,
`Matrix.mem_rowStochastic_iff_sum`; ContinuousTimeMarkovChains 1.1;
DiracScatteringAndNonlinearFourierTransform 1.3. No other layer.

## Layer 4: time reversal of time-dependent rates

Throughout, `T` is a horizon, `Q` a rate function with `Q t` a Q-matrix for `t ∈ [0, T]`, and
`p : ℝ → S → ℝ` a solution of the forward equation `p′ = p Q` within `[0, T]` with `p t i > 0`
for all `t ∈ [0, T]` and all `i`. Reversed time is `s = T − t`.

### 4.1 Reversed rates and reversed marginals

Define `reversedRate Q p T s`: off the diagonal its entry `(i, j)` is
`p (T − s) j * Q (T − s) j i / p (T − s) i`, and its diagonal entry `(i, i)` is minus the sum of
the off-diagonal entries of row `i`. Prove `isQMatrix_reversedRate_and_hasDerivWithinAt`: for
`s ∈ [0, T]`, `reversedRate Q p T s` is a Q-matrix, and `s ↦ p (T − s)` has derivative
`p (T − s) ᵥ* reversedRate Q p T s` within `[0, T]`. The reversed marginals are the marginals of a
chain with the reversed rates.

Route: off-diagonal entries are nonnegative because `p > 0` and `Q (T − s)` is Metzler. For the
derivative, `pⱼ Q̂ⱼᵢ = pᵢ Qᵢⱼ` for `j ≠ i` and `pᵢ Q̂ᵢᵢ = −Σ_(k ≠ i) pₖ Qₖᵢ`, so
`(p ᵥ* Q̂)ᵢ = pᵢ Σ_(j ≠ i) Qᵢⱼ − Σ_(k ≠ i) pₖ Qₖᵢ = −(p ᵥ* Q)ᵢ` because row `i` of `Q` sums to
zero; and `−(p ᵥ* Q)(T − s)` is the derivative of `s ↦ p (T − s)`. (Campbell et al.,
Proposition 1, p. 4, with the reverse rate written in forward time; proved here at the level of
the forward equation.)

**Checks.**
- A constant `Q` with stationary positive `π` (`π ᵥ* Q = 0`) and `p t = π`: the reversed rate is
  the constant matrix `D⁻¹ Qᵀ D` with `D` the diagonal matrix of `π`, since
  `−Σ_(k ≠ i) πₖ Qₖᵢ = πᵢ Qᵢᵢ`. For `Q = [[−2, 1, 1], [0, −1, 1], [1, 0, −1]]` and
  `π = (1/4, 1/4, 1/2)`, `Q̂ = [[−2, 0, 2], [1, −1, 0], [1/2, 1/2, −1]] ≠ Q`.
- Detailed balance gives `Q̂ = Q`: the birth–death matrix
  `[[−1, 1, 0], [2, −3, 1], [0, 2, −2]]` with `π = (4/7, 2/7, 1/7)`, the example of
  ContinuousTimeMarkovChains, Layer 4, the stationary law (4.3), and Layer 5, detailed balance
  (5.1), is its own reversal.
- The diagonal cannot be taken from `Q`: away from stationarity the matrix `D⁻¹ Q(T − s)ᵀ D` has
  row sums `(p ᵥ* Q)ᵢ / pᵢ`; in the worked example below at `s = 0` its first row sums to `−3/5`.
- Positivity is needed: in the worked example started from a point mass, the reversed rate into
  the starting state tends to `∞` as `s → T`. At `s = T`, where `p(0) = δ₀`, division by zero
  makes row `1` of `reversedRate` zero, so `(p(0) ᵥ* Q̂)₁ = 0`, while the derivative of
  `s ↦ p₁(T − s)` at `s = T` is `−(p(0) ᵥ* Q)₁ = −1`.

*Needs:* 3.1; Mathlib `HasDerivWithinAt.comp`, `Matrix.vecMul`.

### 4.2 The reversed transition function

Define `reversedTransition Q p T u v`, the matrix with entry `(i, j)` equal to
`p (T − v) j * propagator Q (T − v) (T − u) j i / p (T − u) i`: by Bayes' formula, the
probability that the reversed chain is in `j` at reversed time `v` given that it is in `i` at
reversed time `u`. Prove `reversedTransition_forward_and_mem_rowStochastic`: for `Q` continuous
and `u ∈ [0, T]`,

- `reversedTransition Q p T u u = 1`;
- for `v ∈ [u, T]`, each entry of `w ↦ reversedTransition Q p T u w` has derivative the
  corresponding entry of `reversedTransition Q p T u v * reversedRate Q p T v` within `[u, T]`;
- for `v ∈ [u, T]`, `reversedTransition Q p T u v` is a stochastic matrix.

So the reversed chain is driven by the reversed rates. The reversed rates are continuous on
`[0, T]`, since `p` is continuous and positive there; by the uniqueness on intervals of 3.2 the
reversed transition function
is the only solution of the forward equation of `Q̂` on `[u, T]` with the value `1` at `u`; when
`reversedRate Q p T` is continuous on `ℝ` it equals `propagator (reversedRate Q p T) u v` there.

Route: the derivative uses the forward equation of `p` and the backward equation of 3.1,
`∂_v P(T − v, T − u) = Q(T − v) P(T − v, T − u)`; the diagonal terms `pⱼ Qⱼⱼ Pⱼᵢ` cancel and the
rest is the formula of 4.1 for `Q̂`. Nonnegativity is 3.3 on `[T − v, T − u] ⊆ [0, T]`; the row
sums are `(p (T − v) ᵥ* P(T − v, T − u))ᵢ / pᵢ(T − u) = 1` by `eq_vecMul_propagator` on
`[T − v, T − u]`. (Campbell et al., Proposition 1, p. 4, and its proof in Appendix B.1,
pp. 16–17, which computes the reversed rate from the same Bayes formula and backward equation.)

**Checks.**
- The stationary case of 4.1: `reversedTransition Q π T u v = exp((v − u) D⁻¹ Qᵀ D)`, entry by entry
  `πⱼ exp((v − u)Q)ⱼᵢ / πᵢ`, because `D⁻¹ Qᵀ D` has powers `D⁻¹ (Qᵀ)ᵏ D`.
- Multiplying `pᵢ(T − u)` back gives the symmetric two-time identity
  `pᵢ(T − u) R(u, v)ᵢⱼ = pⱼ(T − v) P(T − v, T − u)ⱼᵢ`: both are the probability that the forward
  chain is in `j` at `T − v` and in `i` at `T − u`.
- `u = T`: the interval `[u, T]` is the point `T`, and the statements reduce to
  `reversedTransition Q p T T T = 1`.

*Needs:* 3.1, 3.2, 3.3, 4.1.

### Examples

The stationary three-state chain of 4.1, the birth–death chain, and the uniform noising chain
below.

### Dependencies

Layer 3 (3.1, 3.2, 3.3). Mathlib `HasDerivWithinAt.comp`, `Matrix.vecMul`.

## Worked examples

**Uniform noising on three states.** Take `Q = J − 3I` on `{0, 1, 2}` (rate `1` between any two
distinct states; Campbell et al., §4.1, p. 5, use `β(t)` times this matrix), the initial law
`p(0) = (1/2, 1/3, 1/6)` and `T = (log 2)/3`, so that `exp(−3T) = 1/2`. Then
`p(t) = 1/3 + exp(−3t)(p(0) − 1/3)`, positive for all `t ≥ 0`, and `p(T) = (5/12, 1/3, 1/4)`. The
reversed rates are `Q̂(s)ᵢⱼ = pⱼ(T − s)/pᵢ(T − s)` off the diagonal, the ratios of marginal masses
that discrete-state diffusion models learn:

- at `s = 0`: rows `(−7/5, 4/5, 3/5)`, `(5/4, −2, 3/4)`, `(5/3, 4/3, −3)`;
- at `s = T`: rows `(−1, 2/3, 1/3)`, `(3/2, −2, 1/2)`, `(3, 2, −5)`.

The reversed rates depend on time although `Q` does not. Started from the point mass at `0`,
`p(t) = ((1 + 2e^(−3t))/3, (1 − e^(−3t))/3, (1 − e^(−3t))/3)` vanishes at `t = 0` outside `0`,
the hypotheses of Layer 4 fail on any interval reaching `t = 0`, and the reversed rate from `1` to
`0` at reversed time `s` is `(1 + 2e^(−3(T − s)))/(1 − e^(−3(T − s)))`, which tends to `∞` as
`s → T`. Layer 4 applies on every interval `[δ, T]` with `δ > 0`, after shifting time.

## Downstream consumers

The statements offered to consumers are
`chainPath_map_reverseIndex` with the definitions `chainPath`, `chainMarginal` and
`reversedKernel`, the formula `posterior_apply_singleton_eq_div`, the stationary reversal
`chainPath_map_reverseIndex_of_invariant`, the two criteria for reversibility, and in continuous
time `propagator` with its two theorems and the reversal theorems of Layer 4. Discrete-state
diffusion models in continuous time use Layer 4, and divergences between path laws of a chain
and of a model run backwards are computed along the reversed chain of 1.2; neither is treated
here.

## Scope and ownership

This roadmap owns: path laws and marginals of discrete-time chains with time-dependent kernels on
a measurable space; the reverse Markov property with posterior kernels on standard Borel spaces
and the uniqueness of the reversed kernels; Bayes' formula for posteriors at atoms; the stationary
reversed chain and its properties; the characterizations of reversibility by the reversed kernel
and by the reversal invariance of the stationary path law; the Dyson-series propagator of
continuous time-dependent rates on a finite set, its forward and backward equations at every
time, its identification with the propagator of DiracScatteringAndNonlinearFourierTransform, the
evolution of marginals by it on intervals, and its stochasticity; the reversed rates, the
reversed marginals and the reversed transition function.

Already in the libraries and therefore not targets:

- Mathlib's posterior kernel with the Bayes identity `compProd_posterior_eq_map_swap`, its
  almost-everywhere uniqueness, `posterior_comp_self`, the involution `posterior_posterior` and
  the density forms `posterior_eq_withDensity` and, for countable `Ω`,
  `posterior_eq_withDensity_of_countable` (1.3 is the value at a point of positive mass, with no
  countability); the one-step reversal is this identity and is not restated. Mathlib's
  `Kernel.Invariant`, `Kernel.IsReversible` and the implication from reversibility to
  invariance, and the Ionescu-Tulcea kernels `Kernel.partialTraj` and `Kernel.traj`.
- Tau Ceti's `markovChainLaw` (homogeneous chains on `ℕ → E`) and its two-time laws, compared
  with `chainPath` in 1.1. Tau Ceti's `TauCeti.Measure.chainMeasure` and `prefixChainMeasure`
  glue prescribed joint laws of consecutive states into a path law by their conditional kernels;
  `chainPath` is built from the kernels themselves (1.1).
- Tau Ceti's Dyson series with its derivative and uniqueness theorems, from which 3.1 defines the
  propagator, and `TauCeti.eq_dysonSeriesLeft_apply`, the evolution of solutions on all of `ℝ`
  that 3.2 states on intervals for the Dyson-series propagator.

Statements of other roadmaps that border this one:

- DenoisingDiffusion, Layer 4, the reverse Markov property and the path divergence (4.1), states
  the reverse Markov property of its Gaussian forward chain for any reverse kernels with the
  two-time laws of the chain, and the chain rule for the path divergence. Section 1.2 here is the
  statement for arbitrary Markov kernels on a standard Borel space, with the reversed kernels
  identified as posteriors; that roadmap's statement is the Gaussian case of the uniqueness
  statement of 1.2 and is not restated. This roadmap takes from it only the path maps `pathEval`
  (its Conventions, paths) and `reverseIndex` (its Layer 4), copied verbatim. No divergence
  between path laws is stated here.
- DiracScatteringAndNonlinearFourierTransform, Layer 1, the propagator (1.3), with the linear
  Carathéodory theorem (1.2), owns the propagator of a linear equation with an integrable
  coefficient in a Banach space: its composition law, invertibility, almost-everywhere backward
  derivative, Dyson expansion and locality. 3.1 identifies the propagator here with its
  finite-dimensional case and uses these through the identification without restating them; the
  targets kept here are the Dyson-series form, the backward equation at every time for
  continuous rates, the evolution of row vectors on intervals and stochasticity.
- MarkovChainsAndRenewal, Layer 3, stationarity and detailed balance (item 1; 3.1 in
  the sectioned numbering), states the singleton and matrix forms of invariance and detailed
  balance on countable and finite spaces; they are used in the Checks above and not restated.
- ContinuousTimeMarkovChains, Layer 1, Q-matrices (1.1), defines Metzler matrices and
  Q-matrices, copied verbatim in 3.1; its Layers 1 and 2 treat a constant rate matrix and its
  exponential, and its Layer 5, detailed balance (5.1), detailed balance for a constant `Q`. It
  places time-dependent rates outside its scope; Layers 3 and 4 here treat them and cite it for
  the constant case.
- SimulatedAnnealing, Layer 2, products of kernels (2.1), defines the products of the kernels of
  an inhomogeneous chain and their Chapman–Kolmogorov identity; the marginals `chainMarginal`
  here are the images of the initial law under those products, defined as measures by the
  one-step recursion, and the products are not restated.
- MarkovChainMixing, Layer 3, Cheeger's inequality (3.2), uses the reversed matrix
  `π(y) P(y, x)/π(x)` on the support of a stationary law inside a proof route, not as a target;
  2.1 here states it for general spaces. HiddenMarkovModels, smoothing laws (3.2), states that the
  hidden chain given the observations is an inhomogeneous chain run forward, which is not a time
  reversal.
  ScoreBasedDiffusion, Layer 3, treats Gaussian two-time laws and backward kernels of a diffusion,
  a different object. This roadmap depends on none of SimulatedAnnealing, MarkovChainMixing,
  HiddenMarkovModels and ScoreBasedDiffusion.

Outside the scope: divergences and chain rules for path laws; reversal of diffusions and of
stochastic differential equations; path laws of continuous-time chains (no carrier for a
continuous-time Markov process exists at the pins, so Layers 3 and 4 work with transition
functions) and continuous-time chains on infinite state spaces; chains whose state space changes
with time; Kolmogorov's criterion for reversibility, which is ContinuousTimeMarkovChains,
Layer 5, Kolmogorov's criterion (5.2);
queueing networks and output theorems; and every simulation procedure.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Probability/Kernel/Posterior.lean`: `ProbabilityTheory.posterior` (for
  `[StandardBorelSpace Ω] [Nonempty Ω]`, a finite measure `μ` on `Ω` and a finite kernel `κ`, a
  Markov kernel `κ†μ : Kernel X Ω`); `compProd_posterior_eq_map_swap`
  (`(κ ∘ₘ μ) ⊗ₘ κ†μ = (μ ⊗ₘ κ).map Prod.swap`); `ae_eq_posterior_of_compProd_eq` (a finite kernel
  with the same property agrees with `κ†μ` almost everywhere for `κ ∘ₘ μ`); `posterior_comp_self`
  (`κ†μ ∘ₘ κ ∘ₘ μ = μ` for Markov `κ`); `posterior_posterior` (`(κ†μ)†(κ ∘ₘ μ)` agrees with `κ`
  almost everywhere for `μ`, for Markov `κ` and standard Borel `X`).
- `Mathlib/Probability/Kernel/CompProdEqIff.lean`: `Kernel.ae_eq_of_compProd_eq` (finite `μ`,
  finite kernels, a countably generated σ-algebra on the source or the target:
  `μ ⊗ₘ κ = μ ⊗ₘ η` gives `κ = η` almost everywhere for `μ`).
  `Mathlib/Probability/Kernel/Composition/MeasureCompProd.lean`:
  `Measure.compProd_congr` (kernels equal almost everywhere give equal products),
  `Measure.compProd_apply_prod` (the mass of a rectangle).
- `Mathlib/Probability/Kernel/Invariance.lean`: `Kernel.Invariant`, `Kernel.IsReversible`,
  `Kernel.IsReversible.invariant` (a Markov kernel reversible for `π` leaves `π` invariant).
- `Mathlib/Probability/Kernel/IonescuTulcea/PartialTraj.lean`: `Kernel.partialTraj` (from paths up
  to time `a` to paths up to time `b`), `Kernel.partialTraj_succ_eq_comp`,
  `Kernel.partialTraj_map_frestrictLe₂` (restriction of a longer trajectory, Markov kernels).
  `Mathlib/Probability/Kernel/IonescuTulcea/Traj.lean`: `Kernel.traj_map_frestrictLe`.
  `Kernel.comap`, `Measure.bind`.
- `Mathlib/MeasureTheory/Integral/Lebesgue/Countable.lean`: `lintegral_singleton`
  (`∫⁻ x in {a}, f x ∂μ = f a * μ {a}`, measurable singletons).
  `Mathlib/MeasureTheory/Measure/Restrict.lean`: `Measure.ext_of_generateFrom_of_iUnion`
  (measures agreeing on a generating π-system, with a countable cover of finite measure, agree).
- `Mathlib/Analysis/Matrix/Normed.lean`: `Matrix.linftyOpNormedRing`,
  `Matrix.linftyOpNormedAlgebra` (local instances). `Mathlib/LinearAlgebra/Matrix/Stochastic.lean`:
  `Matrix.rowStochastic`, `Matrix.mem_rowStochastic_iff_sum`. `Matrix.vecMul`.
- `Mathlib/Analysis/ODE/ExistUnique.lean`: `ODE_solution_unique_of_mem_Icc_right` (two solutions
  of an equation whose field is Lipschitz in the state, agreeing at the left end of an interval,
  agree on it). `Mathlib/Analysis/SpecialFunctions/Exponential.lean`: `hasDerivAt_exp_smul_const`.
  `HasDerivWithinAt.comp` (chain rule within sets).

### From Tau Ceti

- `TauCeti/Analysis/ODE/DysonSeries.lean` (namespace `TauCeti`), for a real normed algebra `B`:
  `dysonTerm p n t` (the `n`-th iterated integral of `p` over `[0, t]`); `dysonSeries p t` (their
  sum); `hasDerivAt_dysonSeries` (`B` complete, `p` continuous: the series has derivative
  `dysonSeries p t * p t` at every `t`); `eq_mul_dysonSeries` (every `f` with `f′ = f p` on `ℝ` is
  `f 0 * dysonSeries p t`); `eq_of_hasDerivAt_mul` (two solutions of `f′ = f p` on `ℝ` agreeing at
  one time agree). `Suggested.lean` imports this module.
- `TauCeti/Probability/Process/MarkovChain.lean`: `TauCeti.Probability.markovChainLaw` (the law on
  `ℕ → α` of the homogeneous chain with initial law `ν` and Markov kernel `κ`, the trajectory
  measure of the kernels that step by `κ` from the last state). `Suggested.lean` does not import
  this module.

### From TauCetiRoadmap.ContinuousTimeMarkovChains

- Layer 1, Q-matrices (1.1): `IsMetzler`, `IsQMatrix`, copied verbatim into `Suggested.lean`
  (3.1).
- Layer 1, stochastic exponentials (1.3: the exponential of a Q-matrix is stochastic for
  `t ≥ 0`), Layer 2, uniqueness for the Kolmogorov equations (2.1: the exponential solves the
  forward equation, uniquely), Layer 4, the stationary law (4.3: its birth–death example with
  stationary law `(4/7, 2/7, 1/7)`) and Layer 5, detailed balance (5.1: for a constant rate
  matrix), cited in 3.1, 3.3 and 4.1 for the constant case.

### From TauCetiRoadmap.DiracScatteringAndNonlinearFourierTransform

- Layer 1, the propagator (1.3): the propagator `N_P(t, s)` of a linear equation with an
  integrable coefficient on an interval, its composition law `N_P(t, r) N_P(r, s) = N_P(t, s)`
  (hence invertibility) and its locality; used in 3.1 for continuous matrix rates on row vectors
  through the identification stated there, and in 3.3 and 4.2 through 3.1.

### From TauCetiRoadmap.DenoisingDiffusion

- Conventions, paths, and Layer 4, the variational bound: `pathEval` and `reverseIndex`, copied
  verbatim into `Suggested.lean` (Conventions, 1.1, 1.2).

## References

- David A. Levin and Yuval Peres, with contributions by Elizabeth L. Wilmer, *Markov Chains and
  Mixing Times*, second edition, American Mathematical Society, 2017; the PDF posted on
  D. A. Levin's page at the University of Oregon (`mcmt2e.pdf`). Cited as LPW: §1.6, pp. 13–14,
  equations (1.29)–(1.32), Example 1.22 and Proposition 1.23.
- Andrew Campbell, Joe Benton, Valentin De Bortoli, Tom Rainforth, George Deligiannidis and
  Arnaud Doucet, *A continuous time framework for discrete denoising models*, NeurIPS 2022,
  arXiv:2205.14987, version 2 (14 October 2022): Proposition 1, p. 4; §4.1, pp. 4–5;
  Appendix A, pp. 15–16; Appendix B.1, pp. 16–17.
- The Dyson series of Layer 3 is in Tau Ceti, whose module cites Bratteli and Robinson,
  *Operator Algebras and Quantum Statistical Mechanics 1*, Theorem 3.1.33; no locator is given
  here. The reverse Markov property on general state spaces (1.2), the characterizations of
  reversibility in 2.2 and the theorems of Layer 3 are classical and are proved here; the
  propagator of DiracScatteringAndNonlinearFourierTransform 1.3 is cited there.

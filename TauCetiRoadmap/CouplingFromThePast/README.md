# Roadmap: coupling from the past

**Summary.** This roadmap develops the theorem of Propp and Wilson on coupling from the past: the
mathematics of exact sampling from the stationary law of a Markov chain by composing random maps
backward in time. A transition kernel `κ` on a countable state space (a finite one wherever a
distance to stationarity appears) is represented by a random map: a measurable update `f(x, u)`
and a noise law `ρ` such that `f(x, U)` has law `κ(x, ·)` when `U` has law `ρ`. Independent
noises `U₀, U₁, …` give random maps `f(·, Uₖ)`; their backward composition
`F_t = f(·, U₀) ∘ ⋯ ∘ f(·, U_{t−1})` applies the oldest map first, and the forward composition
`G_t = f(·, U_{t−1}) ∘ ⋯ ∘ f(·, U₀)` is the familiar grand coupling of the chains
started from every state. The coalescence time `T` is the first `t` at which `F_t` is constant.
Every statement is about these random maps and the laws of random variables built from them; no
procedure and no running time is a target.

The headline theorems are these.

- *Exactness.* If `T` is almost surely finite, then for every state `x` the common value
  `F_T(x)` has law `π` for every invariant probability `π` of `κ`, and its law is itself
  invariant; so, on a nonempty space, `κ` has exactly one invariant probability.
- *Almost-sure coalescence.* The tail of `T` is submultiplicative,
  `P(T > s + t) ≤ P(T > s) P(T > t)`, so `T` is almost surely finite exactly when some `F_t` is
  constant with positive probability, and then its tail decays geometrically. The backward and
  forward coalescence times have the same law, although the value of the forward composition at
  its coalescence time need not have the stationary law.
- *Monotone updates.* On a finite partially ordered state space with a least element `0̂` and a
  greatest element `1̂`, if every map `f(·, u)` is monotone, then `F_t` is constant exactly when
  `F_t(0̂) = F_t(1̂)`, and `d̄(t) ≤ P(T > t) ≤ ℓ d̄(t)`, where `d̄(t)` is the largest total
  variation distance between two rows of `κ^t` and `ℓ` is the largest number of strict steps in
  a chain of states. Hence `P(T > j t) ≤ ℓ (2ε)^j` for every `j` once `t` is at least the mixing
  time `t_mix(ε)` relative to a probability measure `π`.

The roadmap builds on Mathlib's kernels, independence and laws of random variables; on Tau Ceti's
Markov chains driven by independent noise, whose path law is the Markov chain path law; and on
MarkovChainMixing, which supplies the distances `d` and `d̄`, the mixing time and the coupling
characterization of total variation. The uniform samplers of MarkovChainsAndRenewal are such
representations.

Layer 1 defines the backward and forward compositions and computes their laws. Layer 2 defines
the coalescence times, proves the tail estimates and the equality of their laws, and proves the
exactness theorem; it uses Layer 1. Layer 3 treats monotone updates and bounds the tail of the
coalescence time by the distance `d̄`; it uses Layers 1 and 2.

## Conventions

- **Noise.** `ξ` is a measurable space, `(Ω, P)` a measure space and `U : ℕ → Ω → ξ` a sequence of
  measurable random variables that are independent (`iIndepFun U P`, which makes `P` a probability
  measure) and identically distributed with law `ρ` (`HasLaw (U i) ρ P` for all `i`). The
  coordinate `U k` is the noise of the step from time `−(k + 1)` to time `−k` in the backward
  composition, and of the step from time `k` to time `k + 1` in the forward one.
- **Representations.** A random mapping representation of a kernel `κ : Kernel S S` is a map
  `f : S → ξ → S` that is jointly measurable (`Measurable (Function.uncurry f)`) with
  `ρ.map (f x) = κ x` for every `x`; this is the hypothesis of Tau Ceti's
  `hasLaw_randomizedChain`. It makes `κ` a Markov kernel, since `ρ` is a probability measure, so no
  statement assumes `IsMarkovKernel κ` separately. Measurability of `f` and of each `U i` is
  assumed wherever a law or a probability is computed: the pushforward of a measure by a
  non-measurable map is `0` in Mathlib, so the identities would otherwise say nothing.
- **State spaces.** Layer 1 allows any measurable space `S`, with `S → S` carrying the product
  σ-algebra. Layer 2 takes `S` countable with measurable singletons, so that the event that `F_t`
  is constant is measurable. The statements that use `d̄` take `S` finite and nonempty, as
  MarkovChainMixing does, and Layer 3 takes `S` finite with a partial order having a least
  element `⊥ = 0̂` and a greatest element `⊤ = 1̂`.
- **Coalescence times** take values in `ℕ∞`, with `⊤` when no composition is constant. The value
  at the coalescence time is written `F_{T.toNat}(x)`; on the event `T = ⊤` this is the junk value
  `F_0(x) = x`, which is why every statement about it assumes `T < ⊤` almost surely.
- **Total variation** is Mathlib's `tvDist`, with values in `[0, 2]` on probability measures; the
  distance `‖μ − ν‖_TV` of the source is `tvDist μ ν / 2`, as in MarkovChainMixing. There,
  `d(t) = max_x ‖κ^t(x, ·) − π‖_TV` is `tvToStationary κ π t`,
  `d̄(t) = max_{x,y} ‖κ^t(x, ·) − κ^t(y, ·)‖_TV` is `tvBetweenStarts κ t`, and the mixing time
  `t_mix(ε) = min {t : d(t) ≤ ε}` in `ℕ∞` is `mixingTime κ π ε`; `Suggested.lean` copies the three
  definitions verbatim from MarkovChainMixing 1.2 and 1.3.
- **Heights.** `ℓ` is Mathlib's `Order.height ⊤`, the largest `n` with a chain
  `x₀ < x₁ < ⋯ < xₙ` in `S`; it is finite on a finite type and counts strict steps, so a chain with
  `ℓ + 1` elements has height `ℓ`. `LPW` is the book of Levin and Peres listed under References,
  with page numbers of the second edition made available by the authors.

## Layer 1: random maps and their compositions

### 1.1 Backward and forward compositions

Define `backwardMap f u t : S → S` for a noise sequence `u : ℕ → ξ` by `F_0 = id` and
`F_{t+1}(x) = F_t(f(x, u t))`, so that `F_t = f(·, u 0) ∘ f(·, u 1) ∘ ⋯ ∘ f(·, u (t − 1))`; define
`forwardMap f u t` by `G_0 = id` and `G_{t+1}(x) = f(G_t(x), u t)`, so that
`G_t = f(·, u (t − 1)) ∘ ⋯ ∘ f(·, u 0)` (LPW, §25.3, p. 354, for the backward composition; LPW,
§5.4, (5.17), p. 69, for the grand coupling). Random mapping representations exist for every
Markov kernel on a nonempty standard Borel space, with uniform noise on the unit interval
(Mathlib's `Kernel.exists_measurable_map_eq_unitInterval`; LPW, Proposition 1.5, p. 6, for finite
state spaces), and they are far from unique. Prove:

- composition laws: `F_{s+t}` is `F_s` composed with the backward composition of `t` maps built
  from the shifted noise `k ↦ u (s + k)`, applied first; `G_{s+t}` is the forward composition of
  the shifted noise applied after `G_s`;
- `F_t` and `G_t` depend only on `u 0, …, u (t − 1)`, and `F_t` is `G_t` for the reversed noise
  `u (t − 1), …, u 0`;
- for each `x`, `t ↦ G_t(x)` is Tau Ceti's `randomizedChain` with the constant initial sampler at
  `x` and the noise shifted by one place (its coordinate `0` is unused), so the forward chains from
  all starting states, driven by the same noise, are the grand coupling of the chains of `κ`;
- if `f` is jointly measurable, the maps `u ↦ F_t` and `u ↦ G_t` into `S → S` are measurable.

**Checks.**

- On `{1, 2, 3}` let `f(·, up)` send `1, 2, 3` to `2, 3, 3` and `f(·, down)` send them to
  `1, 1, 2`. With `u 0 = up` and `u 1 = down`, the backward composition
  `F_2 = f(·, up) ∘ f(·, down)` sends `1, 2, 3` to `2, 2, 3`, and the forward composition
  `G_2 = f(·, down) ∘ f(·, up)` sends them to `1, 2, 2`: the two compositions of the same noise
  differ.
- `F_0 = G_0 = id`, and `F_1 = G_1 = f(·, u 0)`: the two notions differ only from `t = 2` on.

*Needs:* Mathlib `Kernel.exists_measurable_map_eq_unitInterval`, `Measurable`,
`Function.uncurry`; Tau Ceti `TauCeti.Probability.randomizedChain`. (Proved here.)

### 1.2 Laws of the compositions

Prove `map_backwardMap_eq_map_forwardMap`: under the conventions on the noise, for each `t` the
random maps `F_t` and `G_t` have the same law as random elements of `S → S`. Prove
`map_backwardMap_apply`: if `f` represents `κ`, then for each `t` and `x` the state `F_t(x)` has law
`κ^t(x, ·)`, that is, `P.map (F_t(x)) = (κ ^ t) x`. (LPW, §5.4, p. 69, for the forward chains;
proved here for the backward ones.)

Route: `(U 0, …, U (t − 1))` and `(U (t − 1), …, U 0)` have the same joint law, the product of `t`
copies of `ρ`, and `F_t` is the forward composition of the reversed noise (1.1). For the second
statement, `randomizedChain` with the constant initial sampler at `x` driven by `U` itself is the
forward chain from `x` driven by the shifted noise `U 1, U 2, …`, which has the law of `U`; by Tau
Ceti's `hasLaw_randomizedChain` (with `κ` a Markov kernel, as the representation gives) its path
law is `markovChainLaw (dirac x) κ`, and its time-`t` marginal is `κ^t(x, ·)` by
`Measure.markovChainLaw_map_eval`; alternatively, induct on `t` with
`F_{t+1}(x) = F_t(f(x, U t))`, where `U t` is independent of the maps that form `F_t`.

**Checks.**

- In the example of 1.1 with a fair coin, `F_2` takes the four values that send `1, 2, 3` to
  `3, 3, 3`, to `2, 2, 3`, to `1, 2, 2` and to `1, 1, 1`, each with probability `1/4`, and `G_2`
  takes the same four values with the same probabilities, though the noise `(up, down)` gives
  `2, 2, 3` for `F_2` and `1, 2, 2` for `G_2`.
- There `F_2(1)` takes the values `1, 2, 3` with probabilities `1/2, 1/4, 1/4`, the first row of
  `κ²`, where `κ` has rows `(1/2, 1/2, 0)`, `(1/2, 0, 1/2)` and `(0, 1/2, 1/2)`.
- Identical distribution is needed: if `U 0` is `up` and `U 1` is a fair coin, independent, then
  `F_2` is `3, 3, 3` or `2, 2, 3` while `G_2` is `3, 3, 3` or `1, 2, 2`.

*Needs:* 1.1; Mathlib `ProbabilityTheory.iIndepFun`, `ProbabilityTheory.HasLaw`,
`MeasureTheory.Measure.infinitePi`, the kernel powers `κ ^ t`; Tau Ceti
`TauCeti.Probability.hasLaw_randomizedChain`, `MeasureTheory.Measure.markovChainLaw_map_eval`.

### Examples

The walk on `{1, 2, 3}` that moves up or down by one with probability `1/2` each, staying put at
the ends, with the update of 1.1 and with the other updates of the same kernel listed in 2.1 and
3.1.

### Dependencies

Mathlib `Kernel.exists_measurable_map_eq_unitInterval`, `ProbabilityTheory.iIndepFun`,
`ProbabilityTheory.HasLaw`, `MeasureTheory.Measure.infinitePi`; Tau Ceti
`TauCeti.Probability.randomizedChain`, `TauCeti.Probability.hasLaw_randomizedChain`,
`MeasureTheory.Measure.markovChainLaw_map_eval`. No other layer.

## Layer 2: coalescence and exactness

### 2.1 Coalescence times

Define `backwardCoalescenceTime f u`, the infimum in `ℕ∞` of the `t` at which `F_t` is constant
(`∀ x y, F_t x = F_t y`), and `forwardCoalescenceTime f u`, the same for `G_t` (LPW, §25.3,
p. 354, where a constant composition is called collapsing). Write `T` for the backward time and
`T_forward` for the forward one. Prove:

- once `F_t` is constant with value `c`, every `F_s` with `s ≥ t` is constant with the same value
  `c`, because `F_s = F_t ∘ (maps applied first)`; so `{T ≤ t}` is the event that `F_t` is
  constant, and the value `F_T(x)` does not depend on `x`;
- once `G_t` is constant, every `G_s` with `s ≥ t` is constant, but its value may change, because
  the later maps act after `G_t`; so `{T_forward ≤ t}` is the event that `G_t` is constant;
- `T = 0` exactly when `S` has at most one element, since `F_0` is the identity;
- (`measureReal_lt_backwardCoalescenceTime_add_le`) `P(T > s + t) ≤ P(T > s) P(T > t)`;
- (`ae_backwardCoalescenceTime_lt_top_iff`) `T < ⊤` almost surely if and only if
  `P(T ≤ t) > 0` for some `t`; then `P(T > m t) ≤ (1 − P(T ≤ t))^m` for every `m`;
- (`map_backwardCoalescenceTime_eq_map_forwardCoalescenceTime`) the backward and the forward
  coalescence times have the same law;
- (`tvBetweenStarts_le_measureReal_lt_backwardCoalescenceTime`) on a finite nonempty `S`, if `f`
  represents `κ`, then `d̄(t) ≤ P(T > t)` for every `t`.

Route: by the composition law of 1.1, `F_{s+t} = F_s ∘ F'_t`, where `F'_t` is built from the noise
`U s, …, U (s + t − 1)`; if `F_s` or `F'_t` is constant, so is `F_{s+t}`. The two factors are
independent and `F'_t` has the law of `F_t`, which gives submultiplicativity, and iterating it
gives the geometric tail and the "if" direction; the "only if" direction holds because
`P(T ≤ t)` increases to `P(T < ⊤) = 1`. The equality of laws follows from 1.2, since `{T ≤ t}`
and `{T_forward ≤ t}` are the events that `F_t`, respectively `G_t`, is constant. For the last
item, `(F_t(x), F_t(y))` is a coupling of `κ^t(x, ·)` and `κ^t(y, ·)` by 1.2, so by the coupling
characterization of MarkovChainMixing 1.1 half their total variation distance is at most
`P(F_t(x) ≠ F_t(y)) ≤ P(T > t)`; take the maximum over pairs (LPW, Theorem 5.4, p. 62, for the
grand coupling of (5.17)).

**Checks.**

- Coalescence depends on the representation, not only on the kernel. For the kernel on `{0, 1}`
  with both rows `(1/2, 1/2)` and a fair bit `u`, the update `f(x, u) = u` gives `T = 1`, while
  `f(x, u) = x + u mod 2` makes every `F_t` a bijection, so `T = ⊤`.
- The same holds for the walk on `{1, 2, 3}` of 1.1: the update that sends `1, 2, 3` to `1, 3, 2`
  or to `2, 1, 3` with probability `1/2` each represents the same kernel, and every composition is
  a permutation, so `T = ⊤` surely, while for the update of 1.1, `P(T > t) = 2^(1 − t)` for
  `t ≥ 1`.
- For the identity kernel on two states every representation has `f(x, u) = x` for almost every
  `u`, so `T = ⊤` almost surely, in agreement with 2.2: the kernel has two invariant probabilities,
  so its compositions cannot coalesce almost surely.
- For the walk of 1.1, `P(T > 2) = 1/2`, `P(T > 4) = 1/8` and `P(T > 2)² = 1/4`: the inequality
  `P(T > 4) ≤ P(T > 2)²` is strict. For each `t ≤ 6` the backward and forward times there have
  `P(T > t) = 1, 1, 1/2, 1/4, 1/8, 1/16, 1/32`, and `d̄(t) = 2^(−t)`, so the last item reads
  `2^(−t) ≤ 2^(1 − t)` for `t ≥ 1`.
- The forward value changes after coalescence: on `{0, 1}` let `f(·, a)` send both states to `0`
  and `f(·, b)` exchange `0` and `1`. With the noise `a, b`, `G_1` is constant with value `0` and
  `G_2` is constant with value `1`, while `F_1` and `F_2` are both constant with value `0`.

*Needs:* 1.1, 1.2; MarkovChainMixing 1.1 (the coupling characterization) and 1.2 (the
definition of `d̄`); Mathlib `ProbabilityTheory.iIndepFun`, `ProbabilityTheory.HasLaw`;
Tau Ceti `TauCeti.IsCoupling`. (Proved here, except as cited.)

### 2.2 Exactness

Prove, for a countable `S` with measurable singletons, a random mapping representation `f` of `κ`
and the noise of the conventions, assuming `T < ⊤` almost surely:

- (`hasLaw_backwardMap_backwardCoalescenceTime`) **Propp and Wilson's theorem.** For every
  invariant probability `π` of `κ` (`κ.Invariant π`) and every state `x`, the value `F_T(x)` has
  law `π`;
- (`invariant_map_backwardMap_backwardCoalescenceTime`) the law of `F_T(x)` is invariant for `κ`.

Consequently, when `S` is nonempty, `κ` has exactly one invariant probability, the law of
`F_T(x)`; when `S` is empty, `T = 0` and there is no probability measure on `S`. (Propp and Wilson,
1996; LPW, §25.3, p. 355, states the theorem and its hypotheses, invariance of `π` under the
random map and almost-sure coalescence, without proof; proved here.)

Route for the first statement: fix a set `A` and a time `t`. On `{T ≤ t}` the value `F_T(x)` equals
`F_t(y)` for every `y`, so `|P(F_T(x) ∈ A) − P(F_t(y) ∈ A)| ≤ P(T > t)` for every `y`. Averaging
over `y` with weights `π {y}` and using 1.2, `Σ_y π {y} P(F_t(y) ∈ A) = (π κ^t)(A) = π(A)` by
invariance, so `|P(F_T(x) ∈ A) − π(A)| ≤ P(T > t)`, which tends to `0`. Route for the second:
write `F_{t+1} = f(·, U 0) ∘ F'_t`, with `F'_t` built from the noise `U 1, U 2, …`, which has the
law of the whole sequence. Its coalescence time `T'` is almost surely finite; on `{T' < ⊤}` the
composition `F_{T'+1}` is constant, so `T ≤ T' + 1` and `F_T(x) = f(Y', U 0)`, where `Y'` is the
value of `F'` at `T'`. `Y'` has the law of `F_T(x)` and is independent of `U 0`, so the law of
`F_T(x)` is that law composed with `κ`.

**Checks.**

- For the walk on `{1, 2, 3}` of 1.1, `π` is uniform, and the value at the backward coalescence
  time takes each of `1, 2, 3` with probability `1/3`. The value of the forward composition at
  the forward coalescence time takes `1` and `3` with probability `1/2` each and never `2`: the
  image of a forward composition is a set of consecutive states, and it shrinks to one point only
  at a step that pushes it against an end (LPW, Remark 25.1, pp. 353–354, poses this example).
  So the forward analogue of the theorem is false.
- On `{0, 1}` with the update of the last Check of 2.1 and `a`, `b` equally likely, `κ` has rows
  `(1/2, 1/2)` and `(1, 0)` and `π = (2/3, 1/3)`. The forward compositions first become constant
  at a step with noise `a`, so the forward value is `0` almost surely. The backward value is `0`
  when the noise begins `a`, or `b, b, a`, or `b, b, b, b, a`, and so on, with probability
  `1/2 + 1/8 + 1/32 + ⋯ = 2/3`, and `1` otherwise.
- Almost-sure coalescence is needed: for the permutation update of 2.1, `T = ⊤`, the junk value
  `F_{T.toNat}(x)` is `x`, and its law is the point mass at `x`, not the uniform `π`.
- Invariance of `π` is needed in the first statement: for the walk of 1.1 and `π` the point mass
  at `1`, which is not invariant, the law of `F_T(x)` is uniform, not `π`.

*Needs:* 1.2, 2.1; Mathlib `ProbabilityTheory.Kernel.Invariant`, `ProbabilityTheory.HasLaw`,
`ProbabilityTheory.iIndepFun`, `MeasureTheory.Measure.bind`. (Proved here.)

### Examples

The walk on `{1, 2, 3}` with its three updates of 1.1, 2.1 and 3.1; the two-state chain of the
second Check of 2.2, for which the forward value is biased toward one state.

### Dependencies

Layer 1; MarkovChainMixing 1.1 and 1.2; Mathlib `ProbabilityTheory.Kernel.Invariant`,
`ProbabilityTheory.HasLaw`, `ProbabilityTheory.iIndepFun`, `MeasureTheory.Measure.bind`; Tau Ceti
`TauCeti.IsCoupling`.

## Layer 3: monotone updates

Throughout this layer `S` carries a partial order with `[OrderBot S]` and `[OrderTop S]`, and the
update is monotone: `x ≤ y` implies `f(x, u) ≤ f(y, u)` for every noise value `u`. A kernel with
such a representation is a monotone chain in the sense of LPW, §22.3, p. 308 (Proposition 22.7
(iii) holds with the coupling `(f(x, U), f(y, U))`).

### 3.1 The extreme trajectories

Prove `coalescenceTime_eq_iInf_bot_eq_top`: for every noise sequence, the backward coalescence
time is the least `t` with `F_t(⊥) = F_t(⊤)`, and the forward coalescence time is the least `t`
with `G_t(⊥) = G_t(⊤)`, both in `ℕ∞` (LPW, §25.2, pp. 351–353). So the forward coalescence time is
the meeting time of the chains started at `0̂` and `1̂` under the monotone coupling given by the
update, a coupling of the kind that LPW, Theorem 22.26, considers.

Route: compositions of monotone maps are monotone, so `F_t(⊥) ≤ F_t(x) ≤ F_t(⊤)` for every `x`,
and `F_t(⊥) = F_t(⊤)` forces `F_t(x) = F_t(⊥)` by antisymmetry; the same holds for `G_t`.

**Checks.**

- The update of 1.1 is monotone: `f(·, up)` and `f(·, down)` are nondecreasing on `1 < 2 < 3`.
- Monotonicity is needed. The update that sends `1, 2, 3` to `1, 1, 3` or to `2, 3, 2` with
  probability `1/2` each represents the same kernel as in 1.1; the second map sends both `1` and
  `3` to `2` and sends `2` to `3`, so after one step the extreme trajectories have met while `F_1`
  is not constant.
- On a one-point space `⊥ = ⊤`, and both sides are `0`.

*Needs:* 1.1, 2.1 (the compositions and the coalescence times); Mathlib `Monotone`, `OrderBot`,
`OrderTop`. (Proved here.)

### 3.2 The tail of the coalescence time

Let `S` be finite, `f` a monotone random mapping representation of `κ`, and the noise as in the
conventions. Prove:

- (`measureReal_lt_backwardCoalescenceTime_le_height_mul`) `P(T > t) ≤ ℓ d̄(t)` for every `t`,
  with `ℓ = Order.height ⊤` (Propp and Wilson, 1996; LPW, Theorem 22.26, p. 319, for the meeting
  time of a monotone coupling of the chains from `0̂` and `1̂`, which by 2.1 and 3.1 has the law of
  `T`). With the lower bound of 2.1, `d̄(t) ≤ P(T > t) ≤ ℓ d̄(t)`.
- (`measureReal_lt_backwardCoalescenceTime_mul_le`) for every probability measure `π`, every `ε`
  and every `t` with `t_mix(ε) ≤ t`, and every `j`, `P(T > j t) ≤ ℓ (2ε)^j`.

Route for the first statement, on the backward maps directly: by 3.1 `T > t` exactly when
`F_t(⊥) < F_t(⊤)`, and then `Order.height (F_t(⊥)) + 1 ≤ Order.height (F_t(⊤))`
(`Order.height_strictMono`; heights are finite on a finite type). Hence, with
`h = Order.height`, `P(T > t) ≤ E[h(F_t(⊤))] − E[h(F_t(⊥))]`, and by 1.2 this is the difference of
the means of `h` under `κ^t(⊤, ·)` and `κ^t(⊥, ·)`. Since `0 ≤ h ≤ ℓ`, that difference is at
most `ℓ · ‖κ^t(⊤, ·) − κ^t(⊥, ·)‖_TV ≤ ℓ d̄(t)`. Route for the second: `t_mix(ε) ≤ t` gives
`d(t) ≤ ε` (MarkovChainMixing 1.3); `d̄(t) ≤ 2 d(t)` and
`d̄(j t) ≤ d̄(t)^j` (MarkovChainMixing 1.2, submultiplicativity of `d̄`); apply the first statement
at `j t`. For `j = 0` the bound reads `P(T > 0) ≤ ℓ`, true because `ℓ ≥ 1` when `S` has at least
two elements and `T = 0` otherwise.

**Checks.**

- For the walk of 1.1, `ℓ = 2`, `d̄(t) = 2^(−t)` and `P(T > t) = 2^(1 − t)` for `t ≥ 1`: the upper
  bound is an equality for every `t ≥ 1`, and the lower bound is off by the factor `2`.
- There `d(t) = (2/3) 2^(−t)` with the uniform `π`, so `t_mix(1/4) = 2`; the second statement
  gives `P(T > 2j) ≤ 2 · 2^(−j)`, and the exact value is `2 · 4^(−j)` for
  `j ≥ 1`.
- Monotonicity is needed: for the update of the second Check of 3.1, which represents the same
  kernel, `P(T > 2) = 3/4` and `P(T > 3) = 1/2`, above `ℓ d̄(2) = 1/2` and `ℓ d̄(3) = 1/4`.
- The height counts strict steps: on `{1, 2, 3}` the longest chain has three elements and height
  `2`, and with `3` in place of `ℓ` the first Check would not be an equality. On the Boolean
  cube `Bool^n` ordered coordinatewise, `ℓ = n`.

*Needs:* 1.2, 2.1, 3.1; MarkovChainMixing 1.2 (`tvBetweenStarts`, `tvToStationary`,
the submultiplicativity of `d̄`, and `d̄(t) ≤ 2 d(t)`) and 1.3 (`mixingTime` and the
characterization of `t_mix(ε) ≤ t`);
Mathlib `Order.height`, `Order.height_strictMono`, `Order.height_mono`, `tvDist`. (Proved here,
except as cited.)

### Examples

The walk on `{1, 2, 3}` with its monotone update; the walk on `{0, 1, …, n}` that moves up with
probability `p` and down with probability `1 − p`, staying put at the ends, with the update that
moves every state in the same direction (LPW, Example 22.8, p. 308), for which `ℓ = n`.

### Dependencies

Layers 1 and 2; MarkovChainMixing 1.2 and 1.3; Mathlib `Order.height`, `Order.height_strictMono`,
`Order.height_mono`, `tvDist`.

## Scope and ownership

This roadmap owns the backward and forward compositions of the random maps of a random mapping
representation, the identity of their laws, the backward and forward coalescence times and their
tails, the exactness theorem of Propp and Wilson, and the theory of monotone updates on a finite
partial order with least and greatest elements: the reduction to the extreme trajectories and the
bounds `d̄(t) ≤ P(T > t) ≤ ℓ d̄(t)`.

Already in the libraries and therefore not targets:

- the existence of a jointly measurable representation of a Markov kernel with uniform noise on
  the unit interval (Mathlib `Kernel.exists_measurable_map_eq_unitInterval`);
- the forward chain from one initial law driven by independent noise and its path law (Tau Ceti
  `TauCeti.Probability.randomizedChain`, `TauCeti.Probability.hasLaw_randomizedChain`), and the path
  law itself with its time marginals (Tau Ceti `TauCeti.Probability.markovChainLaw`,
  `MeasureTheory.Measure.markovChainLaw_map_eval`). What this roadmap adds to them is the family of
  chains from all states driven by the same noise, viewed as one random map, and its backward
  composition.

Left to other roadmaps:

- MarkovChainsAndRenewal, Layer 0, kernels, laws and simulation (item 4; 0.4, sampling from
  uniform variables, in the sectioned numbering), builds explicit quantile samplers on countable
  spaces and their iteration; those samplers are random mapping representations to which every
  statement above applies, and nothing of that item is restated. Its meeting-time coupling of two
  independent copies (Layer 3, equilibrium and coupling, item 4; 3.4 in the sectioned numbering) is
  a different coupling from the grand coupling here.
- MarkovChainMixing owns the distances `d` and `d̄`, the mixing time and the coupling
  characterization of total variation (its 1.1 to 1.3), which are consumed above and not
  restated; the three definitions are copied into `Suggested.lean` with that attribution. It also
  owns Markovian couplings and the coupling inequality (its 4.1), which are not used here: the
  lower bound of 2.1 goes through its 1.1 directly. That roadmap places coupling from the past
  outside its scope.
- SimulatedAnnealing owns products of kernels of inhomogeneous chains; the compositions here are
  of independent identically distributed maps of one kernel. BernoulliPercolation owns the
  monotone coupling of percolation configurations; the monotone updates here are a different
  object, a random self-map of a finite partial order. Time reversal of Markov chains is not
  treated here: the backward composition reverses the order in which noise is used, and no
  reversed chain appears.

Outside the scope: every procedure for finding the coalescence time and its running time or
expected number of steps; Fill's algorithm, dominated and read-once coupling from the past, and
bounding chains for non-monotone systems; the Ising and hard-core models and lozenge tilings as
examples of monotone systems; countable state spaces in Layer 3; and continuous-time chains.

## Exact supplier contracts

### From Mathlib

- `ProbabilityTheory.Kernel.exists_measurable_map_eq_unitInterval`
  (`Mathlib/Probability/Kernel/Representation.lean`): for a Markov kernel into a nonempty standard
  Borel space there is `f` with `Measurable (Function.uncurry f)` and `volume.map (f a) = κ a`.
- `ProbabilityTheory.iIndepFun` (`Mathlib/Probability/Independence/Basic.lean`), with
  `iIndepFun.isProbabilityMeasure`; `ProbabilityTheory.HasLaw`
  (`Mathlib/Probability/HasLaw.lean`): `HasLaw X μ P` means `X` is almost everywhere measurable
  and `P.map X = μ`; `MeasureTheory.Measure.infinitePi`
  (`Mathlib/Probability/ProductMeasure.lean`).
- `ProbabilityTheory.Kernel.Invariant` (`Mathlib/Probability/Kernel/Invariance.lean`):
  `κ.Invariant μ` means `μ.bind κ = μ`; the kernel powers `κ ^ t`
  (`Mathlib/Probability/Kernel/Composition/Comp.lean`); `MeasureTheory.Measure.bind`.
- `MeasureTheory.tvDist` (`Mathlib/MeasureTheory/Measure/TotalVariation/Defs.lean`): the total
  variation norm of the difference, with values in `[0, 2]` on probability measures.
- `Order.height`, `Order.height_mono` and `Order.height_strictMono` (for `x < y` with
  `height x < ⊤`, `height x < height y`) (`Mathlib/Order/KrullDimension.lean`).

### From Tau Ceti

- `TauCeti.Probability.randomizedChain`, `TauCeti.Probability.hasLaw_randomizedChain` (independent
  identically distributed noise passed through a measurable initial sampler and a jointly
  measurable update `f` with `ρ.map (f x) = κ x` gives a process with law
  `markovChainLaw ν κ`, for a Markov kernel `κ`)
  (`TauCeti/Probability/MarkovChain/Simulation.lean`).
- `TauCeti.Probability.markovChainLaw` and `MeasureTheory.Measure.markovChainLaw_map_eval` (the
  state at time `n` has law `(κ ^ n) ∘ₘ ν`) (`TauCeti/Probability/Process/MarkovChain.lean`).
- `TauCeti.IsCoupling` (`TauCeti/MeasureTheory/OptimalTransport/Coupling.lean`).

### From TauCetiRoadmap.MarkovChainMixing

- 1.1: the coupling characterization of total variation: half the total variation distance of two
  probability measures on a countable type is the least probability of disagreement over their
  couplings.
- 1.2: the definitions `tvToStationary` (`d`) and `tvBetweenStarts` (`d̄`) on a finite nonempty
  type; `d̄(t) ≤ 2 d(t)` for a probability measure `π`; submultiplicativity,
  `d̄(s + t) ≤ d̄(s) d̄(t)` for a Markov kernel.
- 1.3: the definition `mixingTime` in `ℕ∞`; its characterization, `t_mix(ε) ≤ t` exactly when
  `d(t) ≤ ε`, for every measure `π`.

The three definitions are copied verbatim into `Suggested.lean`, marked as copies.

## References

- D. A. Levin and Y. Peres, with contributions by E. L. Wilmer, *Markov Chains and Mixing Times*,
  second edition, American Mathematical Society, 2017, in the version made available by the
  authors on D. Levin's page. Used: §1.2 and Proposition 1.5 (random mapping representations);
  Proposition 4.7 and Theorem 5.4 (couplings and total variation); §5.4 (grand couplings);
  §22.3, Proposition 22.7 and Example 22.8 (monotone chains); Theorem 22.26; and Chapter 25,
  written by J. G. Propp and D. B. Wilson, §§25.2–25.3 and Remark 25.1.
- J. G. Propp and D. B. Wilson, Exact sampling with coupled Markov chains and applications to
  statistical mechanics, *Random Structures and Algorithms* 9 (1996), 223–252. Named as LPW
  attribute it, for the exactness theorem and for the bound of 3.2; no locator into it is given.

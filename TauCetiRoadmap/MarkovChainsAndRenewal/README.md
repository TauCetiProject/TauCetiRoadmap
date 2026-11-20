# Roadmap: Markov chains and renewal processes

**Summary.** This roadmap develops homogeneous discrete-time Markov chains on countable state
spaces and ordinary renewal processes with nonnegative independent identically distributed
increments, together with the bridge from renewal processes with exponential increments to the
homogeneous Poisson process. A chain is a Markov kernel κ on a countable state space S in which
every singleton is measurable; started from a probability ν, its path has the law on `S^ℕ` that
starts with ν and moves by κ. A renewal process has increments T₁, T₂, … ≥ 0 with a common law F
not concentrated at zero (increments equal to zero are allowed); its arrival times are the partial
sums Sₙ = T₁ + ⋯ + Tₙ, and N_t counts the indices n ≥ 1 with Sₙ ≤ t.

The headline theorems are these. For an irreducible chain, an invariant probability exists if and
only if every state x has finite mean return time m_x, and it is then unique and gives x the mass
1/m_x; no aperiodicity is needed, and every irreducible chain on a finite state space has one. For
any chain, any initial probability and any state y, the fraction of the times 1, …, n spent at y
converges almost surely to 1/m_y (zero when m_y = ∞) on the event that y is reached, and to zero
off it. If the chain is irreducible and aperiodic and has an invariant probability π, the law at
time n converges to π in total variation from every initial law; if it has none, the probability
of being at any fixed state tends to zero. For a renewal process with increment mean μ ∈ (0, ∞]:
if F is not carried by any lattice aℕ, the expected number of arrivals in (t, t + h] tends to h/μ
(zero when μ = ∞), and if F has maximal lattice span a, the expected number of arrivals at
a(n + 1) tends to a/μ (Blackwell's theorem). For F not carried by any lattice, the key renewal
theorem holds for nonincreasing integrable forcing, and when μ < ∞ the time from t to the next
arrival converges in law to the law with density P(T₁ > s)/μ. If T₁ has variance σ² ∈ (0, ∞),
then (N_t − t/μ)/(σ√(t/μ³)) converges in law to a standard Gaussian.

Tau Ceti's probability library supplies the path law of a chain with its Markov properties on path
space and the basic renewal theory (counts, renewal measure, renewal equation), on which every layer
builds. StochasticCalculus supplies the homogeneous Poisson counting process, which the last layer
identifies with renewal processes with exponential increments. StandardDistributions supplies the
scalar laws. Mathlib supplies kernels, invariance and detailed balance, stopping times, total
variation, the strong law and the central limit theorem. Statistical and game-theoretic roadmaps
take stationarity, detailed balance and the classification of chains from here.

## How to read the build

Layer 0 gives multi-time cylinder probabilities and explicit samplers from uniform variables.
Layer 1 states the Markov and strong Markov properties for a chain relative to an arbitrary
filtration and proves that return gaps are independent. Layer 2 classifies states and proves the
ergodic theorem for occupation frequencies. Layer 3 proves Kac's formula, coupling and convergence
to equilibrium, and treats the hard-core model. Layer 4 works out explicit renewal processes,
Layer 5 the renewal central limit theorem and Blackwell's theorem, Layer 6 the key renewal theorem
and the excess life, and Layer 7 the connections with the Poisson process.

Layers 0–3 are about chains and Layers 4–6 about renewal processes; the two strands meet in §5.3,
whose route to the lattice renewal theorem runs through a chain and Layer 3. Layer 2 uses the
strong law for independent identically distributed return gaps directly and does not depend on
Layer 5, so there is no cycle through the chain proof of the lattice limit. Layer 7 uses Layers 0,
4 and 5. Sections keep the numbers by which other roadmaps cite them; a number missing from a
layer is listed under Scope and ownership below. Each *Needs:* line lists the inputs of its
statement and of its route, item by item, so that a target proved by another route is not blocked
behind an unrelated section. Targets declared in `Suggested.lean` are named in code font; other
targets are described in words.

## Conventions

1. **Chains.** A chain is `κ : ProbabilityTheory.Kernel S S` with `IsMarkovKernel κ`, on a state
   space with `[MeasurableSpace S] [Countable S] [MeasurableSingletonClass S] [Nonempty S]`. No
   topology on the sample space is required. Write `p_n(x, y) := (κ ^ n) x {y}`,
   `P_ν := TauCeti.Probability.markovChainLaw ν κ` for an initial measure ν and
   `P_x := markovChainLaw (Measure.dirac x) κ`; the law at time n is `(κ ^ n) ∘ₘ ν`, and
   `ProbabilityTheory.Kernel.markovChainKernel κ` is the kernel x ↦ P_x. Distributions are
   probability measures, not a second probability-vector structure; the probability mass function
   and finite stochastic-matrix forms are `Kernel.ofPMF`, `Kernel.toPMF`, `Kernel.toMatrix` and
   `Matrix.rowStochastic.toKernel`, with composition in transition order.
2. **Classes.** Irreducible means `Kernel.IsIrreducible Measure.count κ`, equivalently every state
   reaches every state (`Kernel.Reaches`: some power `κ ^ n`, including the zeroth, gives the target
   positive mass). Communicating classes are `Kernel.communicatingClass`, closed sets
   `Kernel.IsClosedSet`. The period is `Kernel.period`, the gcd of the positive return lengths
   (zero when there are none), and aperiodic means `Kernel.IsAperiodic`, every state of period one.
3. **Hitting times.** On a path X, the first entrance `H_A := inf {n ≥ 0 | X_n ∈ A}` is
   `hittingAfter (fun n w => w n) A 0` and the first return `T_x⁺ := inf {n ≥ 1 | X_n = x}` is
   `firstReturn x`, that is `hittingAfter (fun n w => w n) {x} 1`; both take values in `WithTop ℕ`
   and the empty infimum is `⊤`. The k-th visit to a, visit zero being the first entrance, is
   `TauCeti.Probability.successiveVisit`. Write `ρ_x := P_x(T_x⁺ < ∞)` for the return probability,
   `V_x := ∑_{n ≥ 1} 1{X_n = x}` for the number of positive-time visits,
   `V_x(n) := ∑_{k=1}^{n} 1{X_k = x}`, and `G(y, x) := ∑_{n ≥ 0} p_n(y, x) ∈ [0, ∞]`.
4. **Return means.** The mean return time `m_x := 𝔼_x T_x⁺` is `meanReturn κ x`, an extended
   nonnegative integral in `[1, ∞]`; nonreturn with positive probability gives `m_x = ∞`. Write
   `r_x := (m_x⁻¹).toReal`, the inverse taken in `ℝ≥0∞` before `toReal`, so that `r_x = 0` when
   `m_x = ∞`. This avoids Lean's real-valued integral of a nonintegrable function, which is zero,
   being mistaken for an expectation.
5. **Filtrations.** The Markov property is stated relative to an explicit filtration
   `F : MeasureTheory.Filtration ℕ mΩ` with measurable adaptation (`MeasureTheory.Adapted`), and
   then specialized to the natural filtration; a Markov property for the natural filtration alone
   does not imply it for an arbitrary enlargement. `Filtration.natural` asks for strong
   measurability: for the countable-state adapter, give S the discrete topology, prove that it is
   Borel, and identify that filtration with the supremum of the comaps of the coordinates. The
   public Markov hypothesis remains measurable adaptation. On the canonical path space the natural
   filtration is `Filtration.piLE`.
6. **Renewals.** Increments are `T : ℕ → Ω → ℝ≥0`, measurable, with `iIndepFun T P` and
   `IdentDistrib (T n) (T 0) P P`, common law `F := P.map (T 0)` and `P {ω | T 0 ω = 0} < 1`, that
   is `F({0}) < 1`; zero increments are allowed. The Lean sequence is indexed from zero: `T 0` is
   T₁, and `S_n := arrival T n` sums `Finset.range n`, so `S_0 = 0`. Time and increments are in
   `ℝ≥0`. The count `N_t := renewalCount T t ∈ ℝ≥0∞` counts the n ≥ 1 with `S_n ≤ t`, with
   multiplicity: the artificial arrival `S_0` is not counted, genuine arrivals at zero are, and
   `N_0` need not vanish. The natural-valued count `renewalCountNat T t` equals N_t on the
   nonexplosion event `S_n → ∞`, which has probability one, and is zero on its complement.
7. **Renewal measure.** Write `μ := ∫ t F(dt) ∈ (0, ∞]`, in Lean `∫⁻ x, (x : ℝ≥0∞) ∂F`,
   `r := (μ⁻¹).toReal` and `m(t) := 𝔼 N_t = F.renewalFunction t`. The law F is distinguished from
   its distribution function `F_≤(t) := F([0, t])` and its tail `F̄(t) := F((t, ∞)) = P(T₁ > t)`.
   The convolution of a function with a measure is
   `renewalConv h F t = ∫_{[0, t]} h (t − s) F(ds)`, both endpoints included. The renewal measure
   is `U := ∑_{n ≥ 0} F^{∗n}` (`F.renewalMeasure`, with `F^{∗0} := δ₀`, `convolutionPower`); hence
   `U([0, t]) = 1 + m(t)`, including when F has an atom at zero, and `U − δ₀ = F ∗ U`. The excess at
   time t is `E_t := S_{N_t + 1} − t`, `renewalExcess T t`.
8. **Lattice laws.** `IsLatticeSpan F a` says that a > 0 and F is carried by the multiples aℕ, with
   no translation; F is lattice (`IsLattice F`) when it has a span and nonlattice otherwise; a
   maximal span is a span that is at least every other span.
9. **Poisson processes.** A rate-λ Poisson process for a filtration is StochasticCalculus §0.6's
   homogeneous Poisson counting process: `N₀ = 0` almost surely, N adapted, and each increment
   `N_t − N_s` Poisson of mean λ(t − s) and independent of the σ-algebra at time s. Unless stated
   otherwise the filtration is the natural filtration of N. Rate zero is the identically zero
   process. The path versions used here have values in ℕ, start at zero, are nondecreasing and
   right-continuous with jumps of size one, and count `(0, t]`: there is no point at zero. This
   agrees with the renewal convention when increments are strictly positive. Point measures retain
   multiplicities and are measurable maps into `Measure ℝ≥0`.
10. **Total variation.** Total variation is Mathlib's `MeasureTheory.tvDist`, the total variation
    of μ − μ'; on probability measures it takes values in [0, 2], not [0, 1].
11. **Library form.** Every new definition comes with its measurability, evaluation and
    extensionality lemmas, the law-transfer facts that let a statement about a path law be used for
    a process with that law, and its comparison with the underlying Mathlib or Tau Ceti object.
    Every target includes the examples and boundary cases written in its section. The material
    lives in `TauCeti/Probability/MarkovChain/` and `TauCeti/Probability/Renewal/`, extending the
    existing modules for shared process and kernel facts. The headline statements of
    `Suggested.lean` are in `TauCetiRoadmap.MarkovChainsAndRenewal`.

## Layer 0: Kernels, laws and simulation

### 0.2 Multi-time cylinder probabilities

Let ν be a finite measure on S. For times `t₀ < t₁ < ⋯ < t_k` and states `y₀, …, y_k`, prove

```text
P_ν(X_{t₀} = y₀, …, X_{t_k} = y_k) = ((κ ^ t₀) ∘ₘ ν){y₀} · ∏_{i=1}^{k} p_{t_i − t_{i−1}}(y_{i−1}, y_i)
```

(from Tassion, Definition 1.3 and Propositions 1.1 and 2.5; Norris, Chapter 1). For k = 0 this is
the law at time `t₀`. The masses of
these events determine the path law. The route sums the product formula for prefixes over the
intermediate states and applies the discrete Chapman–Kolmogorov identity.
*Needs:* Tau Ceti `TauCeti.Probability.markovChainLaw_map_prefix_apply_singleton`,
`MeasureTheory.Measure.markovChainLaw_setOf_apply_eq_comp`,
`ProbabilityTheory.Kernel.pow_add_apply_singleton`.

**Checks.**
- On the deterministic cycle 0 → 1 → 2 → 0 started at 0, the times 0 < 2 < 3 and the states
  0, 2, 0 have probability one. A formula that multiplies the one-step weights `κ y_{i−1} {y_i}`
  between consecutive listed times, instead of `p_{t_i − t_{i−1}}`, gives `κ 0 {2} · κ 2 {0} = 0`.

### 0.4 Sampling from uniform variables

Let p be a probability measure on S and e an enumeration of S, a bijection onto S from an initial
segment of ℕ (finite, or all of ℕ). With the cumulative sums `c_k := ∑_{j < k} p{e j}`, define the sampler of p
as the map sending `u ∈ [0, 1)` to `e k` for the unique k with `c_k ≤ u < c_{k+1}`: the intervals
are half-open, the empty ones belong to states of weight zero, and they partition [0, 1) because
`c_k` increases to 1. For a Markov kernel κ on S, the kernel sampler sends `(x, u)` to the sampler
of `κ x` at u. Prove that iterating the kernel sampler with independent uniform variables, the
initial state drawn by the sampler of ν, gives a process with path law `markovChainLaw ν κ`
(Tassion, Lemma 1.2 and Proposition 1.3). The uniform law on [0, 1) is
`volume.restrict (Set.Ico (0 : ℝ) 1)`.

- The sampler is measurable, and its image of the uniform law on [0, 1) is p.
- The sampler never returns a state of weight zero, for every u and not only almost every u.
- The index in the enumeration of the returned state is nondecreasing in u: the sampler is the
  quantile function of p for the order given by e.
- The kernel sampler is measurable jointly in the current state and the uniform variable.

The iteration is `TauCeti.Probability.randomizedChain`, and its path law is given by
`TauCeti.Probability.hasLaw_randomizedChain` once the two samplers have the right laws.
*Needs:* Tau Ceti `TauCeti.Probability.randomizedChain`, `TauCeti.Probability.hasLaw_randomizedChain`;
Mathlib `MeasureTheory.Measure.infinitePi`, `ProbabilityTheory.iIndepFun`,
`ProbabilityTheory.HasLaw`.

**Checks.**
- For the weights (1/2, 0, 1/2) on {0, 1, 2}, the sampler sends [0, 1/2) to 0 and [1/2, 1) to 2 and
  never returns 1. With closed intervals `[c_k, c_{k+1}]`, the point u = 1/2 also lies in the
  interval {1/2} of the weight-zero state 1, and the rule is not even well defined there.
- For the weights `2^{−(k+1)}` on ℕ, `c_k = 1 − 2^{−k}` and `[1 − 2^{−k}, 1 − 2^{−k−1})` goes to k:
  every u < 1 is covered and u = 1 is in no interval, which is why the sampler is defined on [0, 1).

### Examples

- The absorbing two-state chain on {0, 1} with `κ 0 {1} = κ 1 {1} = 1` has `p_n(0, 1) = 1` for
  n ≥ 1 and `p_0(0, 0) = 1`.
- The deterministic cycle of length L has `p_n(x, y) = 1` exactly when `y ≡ x + n (mod L)`; the
  powers of a deterministic kernel are the deterministic kernels of the iterates
  (`ProbabilityTheory.Kernel.deterministic_pow`).
- The nearest-neighbour walk on ℤ with right-step probability p ∈ (0, 1) and q = 1 − p has
  `p_n(0, k) = C(n, (n + k)/2) · p^((n + k)/2) · q^((n − k)/2)` when n + k is even and |k| ≤ n,
  and zero otherwise; for instance `p_2(0, 0) = 2pq`.

For each, the kernel powers recover these elementary transition laws.

### Dependencies

Layer 0 uses no earlier layer. §0.2 and §0.4 are independent of each other.

## Layer 1: Deterministic and strong Markov properties

### 1.1 The Markov property relative to a filtration

Let P be a probability measure on Ω, F a filtration on ℕ and `X : ℕ → Ω → S`. Call X a Markov
chain for F with kernel κ when X is adapted to F (`MeasureTheory.Adapted F X`) and, for every n and
every bounded measurable `g : S → ℝ`,

```text
P[g ∘ X (n + 1) | F n] =ᵐ[P] fun ω => ∫ y, g y ∂(κ (X n ω))
```

(natural filtration: Tassion, Proposition 1.4 and Remark 1.5; Norris, Chapter 1; the Zulip
discussion of adapted filtrations for Markov chains). The initial law, the law of `X 0`, is
specified separately.

- For the natural filtration of X (Convention 5) and `X 0` of law ν, X is a Markov chain for it
  with kernel κ exactly when the path of X has law `markovChainLaw ν κ`, through the prefix-law
  recursion `TauCeti.Probability.hasLaw_markovChainLaw_iff`.
- A Markov chain for F is a Markov chain for every smaller filtration to which X is adapted, in
  particular for its natural filtration.
- Multi-step form: `P[g ∘ X (n + k) | F n] =ᵐ[P] fun ω => ∫ y, g y ∂((κ ^ k) (X n ω))` for every k.
- Event form: `P(X_{n+1} ∈ B | F_n) = κ (X n) B` almost surely for measurable B, and on S the
  singleton form `P(X_{n+1} = y | F_n) = κ (X n) {y}`; either is equivalent to the definition.

*Needs:* Mathlib `MeasureTheory.Adapted`, `MeasureTheory.condExp`, `MeasureTheory.Filtration.natural`;
Tau Ceti `TauCeti.Probability.hasLaw_markovChainLaw_iff`.

**Checks.**
- Let `X_n` be independent fair bits and κ send every state to the fair law on {0, 1}. Then X is a
  Markov chain for its natural filtration. For `F_n := σ(X_0, …, X_{n+1})` it is adapted but
  `P(X_{n+1} = 1 | F_n) = 1{X_{n+1} = 1}`, not 1/2, so it is not a Markov chain for F: the property
  does not pass to enlargements, and a definition that only quantifies over natural filtrations
  cannot see this.

### 1.2 The path-valued Markov property

Let X be a Markov chain for F with kernel κ and n ∈ ℕ, and write `θ_n X := (X_{n+k})_k`. Prove that,
conditionally on `F n`, the path `θ_n X` has law `P_{X_n}`: for every bounded measurable f on
`ℕ → S`, `P[f ∘ θ_n X | F n] =ᵐ[P] fun ω => ∫ w, f w ∂P_{X n ω}`, and for every measurable set B of
paths, `P(θ_n X ∈ B | F n) = P_{X_n}(B)` almost surely (natural filtration: Tassion, Theorem 2.2
and Corollary 2.4; Norris, Chapter 1).
Measurability is for the product σ-algebra on `ℕ → S`. The route proves the identity on cylinder
functions by induction from §1.1 and the kernel powers and extends it by a monotone class argument;
on the canonical space with `Filtration.piLE` the two identities are
`MeasureTheory.Measure.condExp_shift_iterate_markovChainLaw` and
`MeasureTheory.Measure.condExp_indicator_shift_iterate_markovChainLaw`.
*Needs:* §1.1; Tau Ceti `ProbabilityTheory.Kernel.markovChainKernel`, `TauCeti.Probability.shift`,
`MeasureTheory.Measure.condExp_shift_iterate_markovChainLaw`,
`MeasureTheory.Measure.condExp_indicator_shift_iterate_markovChainLaw`.

### 1.3 The strong Markov property

Let X be a Markov chain for F with kernel κ and `τ : Ω → WithTop ℕ` a stopping time for F
(`MeasureTheory.IsStoppingTime F τ`), with σ-algebra `F_τ` (`IsStoppingTime.measurableSpace`).
Prove that on `{τ < ∞}`, conditionally on `F_τ`, the path `θ_τ X := (X_{τ+k})_k` has law
`P_{X_τ}`: for bounded measurable f on paths,

```text
P[1{τ < ∞} · f ∘ θ_τ X | F_τ] =ᵐ[P] 1{τ < ∞} · ∫ w, f w ∂P_{X_τ}
```

and the corresponding identity for events (natural filtration: Tassion, Theorem 2.6; Norris,
Chapter 1). The values of
`X_τ` and `θ_τ X` off `{τ < ∞}` do not enter. When τ < ∞ almost surely the indicators drop out.
The route decomposes `{τ < ∞}` into the events `{τ = n}` and applies §1.2 on each; on the canonical
space the forms are `MeasureTheory.Measure.condExp_stoppedValue_shift_iterate_markovChainLaw`,
`MeasureTheory.Measure.condExp_indicator_stoppedValue_shift_iterate_markovChainLaw` and
`MeasureTheory.Measure.condExp_stoppedValue_shift_iterate_markovChainLaw_of_ae_ne_top`.
*Needs:* §1.2; Mathlib `MeasureTheory.IsStoppingTime`, `MeasureTheory.IsStoppingTime.measurableSpace`,
`MeasureTheory.stoppedValue`; Tau Ceti the three canonical forms just named.

**Checks.**
- Let `κ 0 {0} = κ 0 {1} = 1/2` and `κ 1 {1} = 1`, start at 0, and let L be the last time at 0.
  Then `X_L = 0` but `X_{L+1} = 1` surely, while under `P_0` the state at time one is 0 with
  probability 1/2: the conclusion fails for L, which is not a stopping time, so the stopping-time
  hypothesis cannot be dropped.

### 1.4 Visits, returns and return gaps

The first entrance, the first return and the successive visits are stopping times for every
filtration to which the path is adapted (`MeasureTheory.Adapted.isStoppingTime_hittingAfter`,
`MeasureTheory.Adapted.isStoppingTime_successiveVisit`), and the shifts `θ_n` are measurable
(`TauCeti.Probability.measurable_shift_iterate`). Prove that the concatenation of a finite prefix
with a path is measurable. For a state x with `ρ_x = 1`, prove that under `P_x` the return gaps
`G_k :=` (visit k + 1) − (visit k), visit zero being time zero, are independent, each with the law
of `T_x⁺` under `P_x` (Tassion, Propositions 2.7–2.8; Norris, Chapter 1). Each gap is the
length of the corresponding excursion plus one, the chain started at a state it returns to almost
surely returns infinitely often, and the visit times of `successiveVisit` agree with the
`hittingAfter` return times on the event where the visit exists. The route takes the excursions,
independent with a common law under `P_x`, and reads each gap off its excursion.
*Needs:* Mathlib `MeasureTheory.Adapted.isStoppingTime_hittingAfter`; Tau Ceti
`MeasureTheory.Adapted.isStoppingTime_successiveVisit`, `TauCeti.Probability.measurable_shift_iterate`,
`ProbabilityTheory.Kernel.ae_infinite_setOf_eq_markovChainLaw_dirac`,
`TauCeti.Probability.iIndepFun_excursionProcess`, `TauCeti.Probability.map_excursionProcess_eq_excursionLaw`,
`TauCeti.Probability.successiveVisit_gap_eq_length_excursion_add_one`,
`TauCeti.Probability.successiveVisit_succ_eq_hittingAfter`.

**Checks.**
- On the deterministic cycle 0 → 1 → 2 → 0 started at 0, every return gap is 3 and every excursion
  is the word (1, 2) of length 2. A convention identifying the gap with the excursion length gives 2.

### Examples

- On the chain with one state, the first entrance is at time 0 and the first return at time 1.
  On the absorbing two-state chain started at 0, the first entrance to 0 is at time 0 and the first
  return is `⊤`.

### Dependencies

§1.2 uses §1.1 and §1.3 uses §1.2. §1.4 uses Layer 0 only through the path law. Layer 1 uses no
other layer.

## Layer 2: State classification and occupation

### 2.2 Recurrence, transience and visits

Define a state x to be recurrent when `ρ_x = 1`, transient otherwise, positive recurrent when it is
recurrent and `m_x < ∞`, and null recurrent when it is recurrent and `m_x = ∞` (Tassion,
Definitions 3.1–3.2; Norris, Chapter 1). Prove that for a transient x the number of positive-time
visits satisfies `P_x(V_x = k) = ρ_x^k · (1 − ρ_x)` for every k ≥ 0, so that `V_x` has Mathlib's
`ProbabilityTheory.geometricMeasure` law with success probability `1 − ρ_x` (which counts the
failures before the first success) and `1 + V_x` is geometric on {1, 2, …}; and that
`𝔼_x V_x = ρ_x / (1 − ρ_x) < ∞` (Tassion, Theorem 3.1).

- x is positive recurrent exactly when `meanReturn κ x < ⊤`: a finite mean return time forces
  `ρ_x = 1`.
- Every state is exactly one of transient, null recurrent and positive recurrent.
- `P_x(V_x ≥ k) = ρ_x^k` for every k ≥ 0; a recurrent x has `V_x = ∞` almost surely under `P_x`.
- `G(x, x) = (1 − ρ_x)⁻¹` in `ℝ≥0∞` and `G(y, x) = P_y(H_{x} < ∞) · G(x, x)`; hence x is recurrent
  exactly when `∑_{n ≥ 0} p_n(x, x) = ∞`.
- For every finite initial measure ν, the number of visits `∑_{n ≥ 0} 1{X_n = x}` has `P_ν`-mean
  `P_ν(H_{x} < ∞) · G(x, x)`; hence a transient state is visited finitely often almost surely from
  every initial law.

*Needs:* Mathlib `ProbabilityTheory.geometricMeasure`; Tau Ceti
`ProbabilityTheory.Kernel.markovChainLaw_dirac_setOf_successiveVisit_ne_top`,
`ProbabilityTheory.Kernel.ae_infinite_setOf_eq_markovChainLaw_dirac`,
`ProbabilityTheory.Kernel.tsum_pow_apply_singleton_self`,
`ProbabilityTheory.Kernel.tsum_pow_apply_singleton_self_eq_top_iff`,
`ProbabilityTheory.Kernel.tsum_pow_comp_apply_singleton`,
`MeasureTheory.Measure.lintegral_encard_setOf_eq_markovChainLaw`,
`MeasureTheory.Measure.markovChainLaw_setOf_infinite_setOf_eq_eq_zero`.

**Checks.**
- Let `κ 0 {0} = κ 0 {1} = 1/2` and `κ 1 {1} = 1`. Then `ρ_0 = 1/2`, `P_0(V_0 ≥ k) = 2^{−k}`,
  `𝔼_0 V_0 = 1` and `G(0, 0) = 2`. A count that includes time zero would give mean 2, the value of
  `G(0, 0)`.
- The chain with one state is positive recurrent with `m_x = 1`. On the absorbing two-state chain,
  0 is transient with `ρ_0 = 0`, `V_0 = 0` and `m_0 = ∞`: the extended mean records nonreturn.

### 2.3 Class properties

Prove: if x reaches y and x is recurrent, then y is recurrent and
`P_x(H_{y} < ∞) = P_y(H_{x} < ∞) = 1`. Deduce that recurrence and transience are class properties,
that a recurrent class is closed, and that an irreducible recurrent chain has `P_ν(H_{y} < ∞) = 1`
for every initial probability ν and every y. Prove that positive and null recurrence are class
properties, using the occupation limits of §2.4. Every finite closed communicating class is
positive recurrent. On a finite nonempty state space there is a closed communicating class, and
from every initial probability the chain enters the union of the closed communicating classes
almost surely (Tassion, Proposition 3.10, Theorems 3.12–3.13, Corollary 3.15 and Propositions
3.17–3.18; Norris, Chapter 1). The route applies the strong Markov property at the first entrance
and the Green-function identities of §2.2.
*Needs:* §1.3, §2.2, §2.4; Mathlib `ProbabilityTheory.Kernel.IsIrreducible`; Tau Ceti
`ProbabilityTheory.Kernel.Reaches`, `ProbabilityTheory.Kernel.communicatingClass`,
`ProbabilityTheory.Kernel.IsClosedSet`, `ProbabilityTheory.Kernel.isClosedSet_iff_forall_reaches_mem`,
`ProbabilityTheory.Kernel.isMarkovKernel_subtype_communicatingClass_iff`,
`ProbabilityTheory.Kernel.subtype`.

**Checks.**
- On {0, 1, 2} let `κ 0 {0} = κ 0 {1} = 1/2`, `κ 1 {2} = 1` and `κ 2 {1} = 1`. The classes are {0},
  transient and not closed, and {1, 2}, closed and positive recurrent with `m_1 = m_2 = 2`; from 0
  the chain enters {1, 2} almost surely. Calling every communicating class closed would misclassify
  {0}.

### 2.4 Occupation frequencies

Prove `ae_tendsto_occupation_div`: for every initial probability ν and every state y, `P_ν`-almost
surely `V_y(n)/n → 1{H_{y} < ∞} · r_y` (under `P_y`: Tassion, Theorem 3.4; Norris, Chapter 1).
For ν = `δ_y` this is `V_y(n)/n → r_y` almost surely under `P_y`. Prove the expectation limit
`𝔼_ν V_y(n)/n → P_ν(H_{y} < ∞) · r_y` (Tassion, Theorem 3.5) by bounded convergence, since
`V_y(n)/n ≤ 1`. The route: a transient y is visited finitely often
(§2.2); for a recurrent y, the strong Markov property at the first entrance and the independent
return gaps of §1.4, of mean `m_y`, give the limit by the strong law, in its infinite-mean form
`TauCeti.Probability.strong_law_ae_real_of_lintegral_eq_top` when `m_y = ∞`. No irreducibility or
aperiodicity is assumed.
*Needs:* §1.3, §1.4, §2.2; Mathlib `ProbabilityTheory.strong_law_ae`; Tau Ceti
`TauCeti.Probability.strong_law_ae_real_of_lintegral_eq_top`.

**Checks.**
- The chain on {0, 1} that always switches has period 2 and `m_0 = 2`; `V_0(n)/n → 1/2`, although
  `p_n(0, 0)` alternates between 0 and 1. A statement through limits of `p_n(0, 0)` would fail here.
- On the absorbing two-state chain started at 1, state 0 is never reached and the limit is 0; started
  at 0 it is reached, `m_0 = ∞`, and the limit is again 0.

### Examples

Prove, rather than assume, the classification of three chains, with the return and hitting
estimates each needs (Norris, Chapter 1):

- A finite cycle of length L is positive recurrent with `m_x = L`.
- The simple symmetric random walk on ℤ is null recurrent: `p_{2n}(0, 0) = C(2n, n)/4^n`, whose sum
  diverges, and `m_0 = ∞`.
- The walk with right-step probability p ∈ (0, 1), p ≠ 1/2, is transient with `ρ_0 = 1 − |p − q|`;
  for p = 2/3, `ρ_0 = 2/3` and `G(0, 0) = ∑ C(2n, n)(pq)^n = 1/√(1 − 4pq) = 3`.

### Dependencies

Layer 2 uses Layer 1 (§1.3, §1.4) and the strong law; it does not use Layer 5.

## Layer 3: Equilibrium and coupling

### 3.1 Stationarity and detailed balance

Stationarity is `Kernel.Invariant` and detailed balance is `Kernel.IsReversible`. Prove the countable
singleton formulas: π is invariant exactly when `∑_x π{x} · κ x {y} = π{y}` for every y, and
`isReversible_iff_singletons`, that κ is reversible for π exactly when
`π{x} · κ x {y} = π{y} · κ y {x}` for all x, y (Tassion, Definitions 4.1–4.2 and Proposition 4.1;
Norris, Chapter 1). For finite
S and a finite measure π with row vector `v x := (π {x}).toNNReal`, prove that π is invariant
exactly when `v ᵥ* κ.toMatrix = v`, and reversible exactly when `v x · M x y = v y · M y x` for
`M := κ.toMatrix`. Reversibility implies invariance by `Kernel.IsReversible.invariant`.
*Needs:* Mathlib `ProbabilityTheory.Kernel.Invariant`, `ProbabilityTheory.Kernel.IsReversible`,
`ProbabilityTheory.Kernel.IsReversible.invariant`, `Matrix.rowStochastic`; Tau Ceti
`ProbabilityTheory.Kernel.toMatrix`, `ProbabilityTheory.Kernel.comp_apply_singleton_eq_vecMul`.

**Checks.**
- The two-state chain with `κ 0 {1} = a` and `κ 1 {0} = b`, a + b > 0, has the invariant law
  `(b, a)/(a + b)` and is reversible for it, since `π{0} · a = π{1} · b`.
- The deterministic cycle 0 → 1 → 2 → 0 has the uniform invariant law but is not reversible:
  `π{0} · κ 0 {1} = 1/3` while `π{1} · κ 1 {0} = 0`. Invariance and detailed balance differ.

### 3.2 Invariant probabilities and Kac's formula

Prove `exists_invariant_probability_iff`: an irreducible chain has an invariant probability exactly
when it is positive recurrent, that is when `m_x < ∞` for every x (equivalently for one x, by §2.3).
Construct the invariant probability from the expected occupation in one return cycle: for a
recurrent x, `μ_x(B) := 𝔼_x ∑_{n=0}^{T_x⁺ − 1} 1{X_n ∈ B}` is invariant, with `μ_x{x} = 1` and total
mass `m_x`, and `μ_x / m_x` is an invariant probability when `m_x < ∞`. Prove uniqueness, and
Kac's formula `invariant_mass_eq_inv_meanReturn`: an invariant probability π of an irreducible chain
has `π{x} = 1/m_x` for every x. No aperiodicity is needed. On a finite state space every irreducible
chain has exactly one invariant probability, `existsUnique_invariant_probability` (Tassion,
Theorem 4.2, with Lemma 4.3 for positive recurrent x and Propositions 3.17–3.18 for finite S;
Norris, Chapter 1).
*Needs:* §1.3, §1.4, §2.2, §2.3; Mathlib `ProbabilityTheory.Kernel.Invariant`,
`ProbabilityTheory.Kernel.IsIrreducible`; Tau Ceti
`ProbabilityTheory.Kernel.isIrreducible_count_iff_forall_reaches`.

**Checks.**
- For the two-state chain with a = 1/2 and b = 1/4, `π = (1/3, 2/3)` and
  `m_0 = (1 − a) + a(1 + 1/b) = 3 = 1/π{0}`.
- A deterministic cycle of length L has `m_x = L` and the uniform invariant law, without
  aperiodicity.
- For the simple symmetric random walk on ℤ, counting measure is invariant but there is no invariant
  probability, and `m_0 = ∞`. A characterization through invariant measures rather than invariant
  probabilities would wrongly call the walk positive recurrent.

### 3.4 Product chains and coupling

The independent product of κ and η is `κ ∥ₖ η`; its path law pairs independent paths, products of
invariant laws are invariant for it, and the product of two irreducible aperiodic kernels is
irreducible and aperiodic. For two chains with the same kernel κ, run independently from initial
probabilities ν and ν', let τ be their first meeting time, `inf {n | X_n = Y_n}`, and let Z follow X
before τ and Y from τ on. Prove that τ is a stopping time of the joint natural filtration and that
Z has the path law `markovChainLaw ν κ` of X. Prove the coupling inequality
`|P(X_n ∈ B) − P(Y_n ∈ B)| ≤ P(τ > n)` for every B, hence
`tvDist ((κ ^ n) ∘ₘ ν) ((κ ^ n) ∘ₘ ν') ≤ 2 · P(τ > n)`. Whenever `κ ∥ₖ κ` is irreducible and
recurrent, prove that the two coordinates meet almost surely from arbitrary initial laws, by §2.3
applied to the product chain and a diagonal state. For an irreducible aperiodic positive recurrent
κ with invariant probability π, the product kernel has invariant probability `π ⊗ π` and is
therefore positive recurrent by §3.2 (Tassion, Propositions 4.8, 4.9, 4.11 and 4.13 and Lemma 4.14;
Norris, Chapter 1).
*Needs:* §1.3, §2.3, §3.2; Mathlib `ProbabilityTheory.Kernel.parallelComp`, `MeasureTheory.tvDist`;
Tau Ceti `MeasureTheory.Measure.markovChainLaw_parallelComp`,
`ProbabilityTheory.HasLaw.prodMk_markovChainLaw`, `ProbabilityTheory.Kernel.Invariant.parallelComp`,
`ProbabilityTheory.Kernel.IsAperiodic.isIrreducible_parallelComp`,
`ProbabilityTheory.Kernel.IsAperiodic.parallelComp`,
`ProbabilityTheory.Kernel.parallelComp_pow_apply_singleton`, `MeasureTheory.etvDist_le_two_mul_iff`.

**Checks.**
- Two copies of the chain on {0, 1} that always switches, started at 0 and at 1, never meet, and
  `tvDist (δ₀ κⁿ) (δ₁ κⁿ) = 2` for every n, matching the bound `2 · P(τ > n) = 2`. Its product with
  itself is not irreducible, since (0, 1) and (1, 0) only reach each other: aperiodicity is what
  makes the product irreducible.

### 3.5 Total variation and convergence to equilibrium

On a countable space with measurable singletons, prove that finite measures μ and μ' satisfy
`tvDist μ μ' = ∑_y |μ.real {y} − μ'.real {y}|`; the coupling bound of §3.4 then reads
`tvDist ≤ 2 · P(no meeting by n)`. Prove `tendsto_tvDist_comp_pow`: for an irreducible aperiodic
chain with an invariant probability π and every initial probability ν,
`tvDist ((κ ^ n) ∘ₘ ν) π → 0`. Prove `tendsto_comp_pow_apply_singleton_of_not_exists_invariant`:
for an irreducible aperiodic chain with no invariant probability, `((κ ^ n) ∘ₘ ν){y} → 0` for every
initial probability ν and every y (Tassion, Theorems 4.15–4.16 with Proposition 4.13 and
Lemma 4.17; Norris, Chapter 1).

The route to the second limit runs by cases on the product chain. If it is transient,
`((κ ^ n) ∘ₘ ν){y}²` is the probability that the product chain started from `ν ⊗ ν` is at (y, y) at
time n, which tends to zero by §2.2. If it is recurrent, then y is recurrent because
`p_n(y, y)² ≤ p_n(y, y)`, hence null recurrent. Coupling the chains started from ν and from
`(κ ^ i) ∘ₘ ν` gives `|((κ ^ n) ∘ₘ ν){y} − ((κ ^ (n + i)) ∘ₘ ν){y}| → 0` for each fixed i. The strong
Markov property at the first visit to y after time n gives
`(1/k) ∑_{i=1}^{k} ((κ ^ (n + i)) ∘ₘ ν){y} ≤ (1 + 𝔼_y V_y(k))/k` uniformly in n, and §2.4 makes the
right side small.
*Needs:* §1.3, §2.2, §2.4, §3.2, §3.4; Mathlib `MeasureTheory.tvDist`; Tau Ceti
`ProbabilityTheory.Kernel.IsAperiodic`, `ProbabilityTheory.Kernel.IsAperiodic.eventually_pos_pow_apply_singleton`,
`MeasureTheory.etvDist_le_two_mul_iff`.

**Checks.**
- `tvDist δ₀ δ₁ = 2`; a total variation normalized to [0, 1] would give 1.
- For the two-state chain with a = 1/2, b = 1/4 and π = (1/3, 2/3), the distance from the chain
  started at 0 is `2 · π{1} · |1 − a − b|^n = (4/3) · 4^{−n}`: 4/3, 1/3, 1/12, … .
- The chain on {0, 1} that always switches has the uniform invariant law, and the distance from the
  chain started at 0 is 1 for every n: the aperiodicity hypothesis cannot be dropped.
- The lazy symmetric walk on ℤ (stay with probability 1/2, step ±1 with probability 1/4 each) is
  irreducible and aperiodic with no invariant probability, and
  `((κ ^ n) ∘ₘ δ₀){y} = C(2n, n + y)/4^n → 0` for every y, while `tvDist ((κ ^ n) ∘ₘ δ₀) 0 = 1` for
  every n: the pointwise limit is not convergence in total variation to the zero measure.

### 3.6 The hard-core model

Let G be a finite nonempty simple graph on V (`SimpleGraph V` with `Fintype V`) and λ > 0. The state
space is the set of independent sets of G, and `π(I) ∝ λ^|I|`. A step chooses a vertex v uniformly,
deletes it from the current set, and then inserts it with probability `λ/(1 + λ)` if no neighbour of
v is in the set. Prove detailed balance for π, irreducibility, aperiodicity and convergence in total
variation to π from every initial law (§3.5). For λ = 1, π is the uniform law on independent sets
(λ = 1 on the 8 × 8 grid: Tassion, Proposition 4.18).
*Needs:* §3.1, §3.5; Mathlib `SimpleGraph`, `ProbabilityTheory.Kernel.IsReversible.invariant`.

**Checks.**
- On the graph with one edge u–v the independent sets are ∅, {u} and {v}, with
  `π = (1, λ, λ)/(1 + 2λ)`. From ∅ the chain moves to {u} with probability `λ/(2(1 + λ))` and stays
  with probability `1/(1 + λ)`; from {u} it never moves to {v} in one step, since v has the
  occupied neighbour u. Detailed balance holds for λ = 1, 2 and 1/3, and for λ = 1 the law is
  uniform. An update that inserts v whatever its neighbours would leave the independent sets.

### Examples

- A deterministic cycle of length L has the uniform invariant law but, started from a point mass,
  converges to it only when L = 1; the aperiodicity hypothesis belongs to §3.5.

### Dependencies

Layer 3 uses Layer 1 (§1.3, §1.4) and Layer 2. §3.4 uses §3.2, §3.5 uses §3.4, and §3.6 uses §3.1
and §3.5.

## Layer 4: Ordinary renewal processes and renewal measures

### 4.4 Explicit renewal processes

Work out the count law and the renewal function for increments in {0, a}, a > 0, with
`P(T₁ = a) = q ∈ (0, 1]` (Tassion, Propositions 5.1–5.2). For t ≥ 0 and `k := ⌊t/a⌋`, `N_t + 1`
is the index of the (k + 1)-st increment equal to a, so

```text
P(N_t = j) = C(j, k) · q^(k+1) · (1 − q)^(j−k)  for j ≥ k,      m(t) = (k + 1)/q − 1.
```

In particular `N_0` has `P(N_0 = j) = q(1 − q)^j` and `m(0) = (1 − q)/q`, and the renewal measure is
`U = (1/q) ∑_{n ≥ 0} δ_{an}`. For q = 1, the deterministic increments a, `N_t = ⌊t/a⌋` and
`m(t) = ⌊t/a⌋`. For exponential increments of rate λ > 0 the count `N_t` is Poisson of mean λt and
`m(t) = λt`, by `TauCeti.Probability.hasLaw_renewalCountNat_poissonMeasure` and
`TauCeti.Probability.lintegral_renewalCount_of_expMeasure`.
*Needs:* Tau Ceti `TauCeti.Probability.renewalCount`, `MeasureTheory.Measure.renewalFunction`,
`MeasureTheory.Measure.renewalMeasure`, `TauCeti.Probability.hasLaw_renewalCountNat_poissonMeasure`,
`TauCeti.Probability.lintegral_renewalCount_of_expMeasure`.

**Checks.**
- For deterministic increments a, `N_a = 1`: the arrival at time a is counted, because the count is
  over [0, t]. A count over [0, t) would give 0.
- For q = 1/2: `m(0) = 1`, the genuine atom of the count at time zero, and `m(3a/2) = 3`. A count
  that ignored zero increments would give `m(0) = 0`.

### Examples

- The three processes of §4.4 expose the endpoint convention of the count (deterministic
  increments), the lattice span (increments a and {0, a}) and the genuine atom of the count at time
  zero (increments {0, a} with q < 1).

### Dependencies

Layer 4 uses no earlier layer.

## Layer 5: Renewal limits

### 5.2 The central limit theorem for renewal counts

Prove `tendstoInDistribution_renewalCountNat`: if `T₁` has a finite second moment and variance
`σ² > 0`, then its mean μ is a finite positive real and

```text
(N_t − t/μ) / (σ √(t/μ³))  →  N(0, 1)  in law as t → ∞,
```

stated with Mathlib's `MeasureTheory.TendstoInDistribution` along `atTop` on `ℝ≥0`, equivalently
along every sequence `t_n → ∞` (Tassion, Theorem 5.6; Feller, vol. II, Chapter XI). The route inverts
the arrival times through `{N_t ≥ n} = {S_n ≤ t}` and controls the rounding of n against t, from
the central limit theorem for the sums `S_n`.
*Needs:* Mathlib `ProbabilityTheory.tendstoInDistribution_inv_sqrt_mul_sum_sub`,
`MeasureTheory.TendstoInDistribution`, `ProbabilityTheory.gaussianReal`,
`ProbabilityTheory.variance`; Tau Ceti `TauCeti.Probability.renewalCountNat`,
`TauCeti.Probability.le_renewalCountNat_iff`, `TauCeti.Probability.ae_tendsto_arrival_atTop`.

**Checks.**
- For exponential increments of rate λ, μ = σ = 1/λ and `σ √(t/μ³) = √(λt)`, the normalization of
  the central limit theorem for the Poisson law of mean λt. The normalization `σ √(t/μ)` would give
  `√(t/λ)`, which is wrong unless λ = 1.

### 5.3 Lattice laws and the lattice renewal theorem

Define `IsLatticeSpan` and `IsLattice` (Convention 8) (Tassion, Definition 5.4; Feller, vol. II,
Chapter XI).

- The point mass `δ₀` is lattice and every a > 0 is a span of it.
- A lattice law with `F({0}) < 1` has a unique maximal span d, and its spans are exactly the d/k
  for k ≥ 1.
- The renewal measure of a lattice law with span a is carried by aℕ.
- A law with a nonzero absolutely continuous part, for instance an exponential law, is nonlattice.

Prove `tendsto_renewalFunction_lattice`: if a is the maximal span of F, then
`m(a(n + 1)) − m(an) → a · r` (Tassion, Theorem 5.12). The route: set `q := 1 − F({0})` and let L
have the conditional law
of `T₁/a` given `T₁ > 0`. Build the chain on `C := {j ∈ ℕ | P(L > j) > 0}` that moves from j > 0 to
j − 1 and from 0 to a fresh `L − 1`. Prove that it is irreducible, that its return time to 0 has the
law of L, and that its period is one by the maximality of the span. With `(R_n)_{n ≥ 0}` this chain
started at 0, prove `U({an}) = P_0(R_n = 0)/q` for every n ≥ 0, and `𝔼 L = μ/(aq)`, including
infinite mean. These identities account for the clusters of zero increments rather than treating
the increment law as strictly positive. Since `m(a(n + 1)) − m(an) = U({a(n + 1)})`, Layer 3 (§3.2
and §3.5) yields the limit.
*Needs:* §3.2, §3.5; Mathlib `Nat.setGcd`, `Nat.exists_mem_closure_of_ge`; Tau Ceti
`MeasureTheory.Measure.renewalMeasure`, `MeasureTheory.Measure.renewalFunction`,
`MeasureTheory.Measure.renewalFunction_eq_tsum`, `MeasureTheory.Measure.renewalMeasure_Iic`,
`ProbabilityTheory.Kernel.period`.

**Checks.**
- For increments uniform on {1, 2}, μ = 3/2 and `U({n}) = 2/3 + (1/3)(−1/2)^n`: 1, 1/2, 3/4, 5/8,
  … → 2/3 = a · r.
- For increments uniform on {2, 4}, the maximal span is 2 and μ = 3: `U({2n}) → 2/3` and `U` is zero
  at odd integers. Using the span 1 would predict 1/3 at every integer.
- For increments in {0, 1} with `P(T₁ = 1) = q`, L = 1, μ = q and `U({n}) = 1/q = a · r` for every n:
  the zero-increment clusters are what the factor 1/q accounts for.

### 5.4 The nonlattice renewal theorem

Prove `tendsto_renewalFunction_add_sub`: for nonlattice F and every h ≥ 0,
`m(t + h) − m(t) → h · r`, including infinite mean (Tassion, Theorem 5.13; Feller, vol. II,
Chapter XI). The local renewal bound `U([t, t + h]) ≤ U([0, h])` for t, h ≥ 0, obtained by
conditioning at the first arrival at or after t and counting `S_0` in U, and the uniform bound on
the increments of m it gives, are `MeasureTheory.Measure.renewalMeasure_Icc_add_le` and
`MeasureTheory.Measure.renewalFunction_add_le`. The route is Feller's argument. By the local bound,
every sequence `t_k → ∞` has a subsequence along which the translates of U by `−t_k` converge
vaguely on ℝ, against continuous compactly supported test functions, to a Radon measure η with
`η = η ∗ F`; the compactness statement for families with uniformly bounded mass on unit intervals is
part of this target. Prove that for nonlattice F every such measure with
`sup_x η([x, x + 1]) < ∞` is a constant multiple c of Lebesgue measure. Identify c = r from
`∫_{[0, t]} P(T₁ > t − s) U(ds) = 1` for t ≥ 0, passing to the limit by dominated convergence with
the local bound when μ < ∞, and by Fatou's lemma, giving c = 0, when μ = ∞. The local bound alone
does not establish the limit.
*Needs:* §5.3 (the definition of lattice laws); Tau Ceti
`MeasureTheory.Measure.renewalMeasure_Icc_add_le`, `MeasureTheory.Measure.renewalFunction_add_le`,
`MeasureTheory.Measure.renewalMeasure_eq_dirac_add_conv`,
`TauCeti.Probability.renewalConv_measureReal_Ioi_renewalMeasure`; Mathlib
`MeasureTheory.Measure.conv`.

**Checks.**
- For exponential increments of rate λ, `m(t) = λt`, so `m(t + h) − m(t) = λh = h · r` for every t.
- For the lattice law `δ₁`, `m(t) = ⌊t⌋`, and `m(n + 1/2) − m(n) = 0` while
  `m(n + 1) − m(n + 1/2) = 1`: there is no limit, so the nonlattice hypothesis cannot be dropped.

### Examples

- The renewal processes of §4.4 are lattice; exponential increments are nonlattice.

### Dependencies

§5.2 uses no earlier layer of this roadmap. §5.3 uses Layer 3 for its route. §5.4 uses §5.3 for
the definition of lattice laws.

## Layer 6: Renewal equations and excess life

### 6.2 The renewal equation

For measurable h bounded on each [0, t], the measurable solution of `g = h + g ∗ F` that is bounded
on each [0, t] exists and is unique, and it is `g = h ∗ U`
(`TauCeti.Probability.renewalConv_renewalMeasure_eq_add`,
`TauCeti.Probability.eq_renewalConv_renewalMeasure`). Prove the equivalent formula
`g = h + h ∗ (U − δ₀)`, where `U − δ₀ = F ∗ U`; prove `g(0) = h(0)/(1 − F({0}))`; and recover the
renewal equation `m = F_≤ + m ∗ F` for the renewal function, with solution `m = F_≤ ∗ U` (Tassion,
Proposition 6.4 and Theorem 6.6; Feller, vol. II, Chapter XI).
*Needs:* Tau Ceti `TauCeti.Probability.renewalConv`,
`TauCeti.Probability.renewalConv_renewalMeasure_eq_add`,
`TauCeti.Probability.eq_renewalConv_renewalMeasure`, `TauCeti.Probability.renewalConv_add_measure`,
`TauCeti.Probability.renewalConv_dirac_zero`, `MeasureTheory.Measure.renewalMeasure_eq_dirac_add_conv`,
`MeasureTheory.Measure.renewalFunction_eq_tsum`.

**Checks.**
- For increments in {0, a} with `P(T₁ = a) = q`, `F({0}) = 1 − q`; the forcing `F_≤` gives
  `m(0) = (1 − q)/(1 − (1 − q)) = (1 − q)/q`, in agreement with §4.4. A convolution over (0, t]
  would give `g(0) = h(0)` and miss the atom.

### 6.3 The key renewal theorem

Prove `tendsto_renewalConv_conv_renewalMeasure`: for nonlattice F and every nonnegative,
nonincreasing, Lebesgue-integrable `h : [0, ∞) → ℝ`, `(h ∗ (U − δ₀))(t) → r ∫₀^∞ h(s) ds`. Deduce the
same limit for `h ∗ U`, using `h(t) → 0` (Tassion, Theorem 6.7; Feller, vol. II, Chapter XI). The route
uses the uniform bound on the increments of m (§5.4) and step-function approximations of h, which
are part of this target.
*Needs:* §5.4; Tau Ceti `TauCeti.Probability.renewalConv`, `MeasureTheory.Measure.renewalFunction_add_le`.

**Checks.**
- For exponential increments of rate λ, `U − δ₀` is λ times Lebesgue measure on [0, ∞), so
  `(h ∗ (U − δ₀))(t) = λ ∫₀^t h → λ ∫₀^∞ h` exactly.
- The forcing `h = 1_{[0, c)}` is nonincreasing and gives `m(t) − m(t − c) → c · r`: §6.3 contains
  §5.4.

### 6.4 The excess life

The excess `E_t` is measurable, its distribution function `e_x(t) := P(E_t ≤ x)` solves the renewal
equation with forcing `h_x(t) := F_≤(t + x) − F_≤(t)` for each x ≥ 0, and its tail has the
representation `P(E_t > x) = (F̄(· + x) ∗ U)(t)` with the nonincreasing forcing `F̄(t + x)`
(`TauCeti.Probability.measureReal_renewalExcess_le_eq_add`,
`TauCeti.Probability.measureReal_lt_renewalExcess`). Prove `tendsto_measureReal_renewalExcess_le`:
for nonlattice F with finite mean,

```text
P(E_t ≤ x)  →  (1/μ) ∫₀ˣ P(T₁ > s) ds   for every x ≥ 0,
```

and prove that the limit is a probability distribution with density `F̄(x)/μ` (Tassion, Section 6.8;
Feller, vol. II, Chapter XI). Apply §6.3 to the tail forcing, not directly to `h_x`, which need not
be nonincreasing. For μ = ∞, lattice or not, prove `P(E_t ≤ x) → 0` for every finite x, using
`{E_t ≤ x} ⊆ {N_{t+x} − N_t ≥ 1}` and §5.3 or §5.4.
*Needs:* §5.3, §5.4, §6.3; Tau Ceti `TauCeti.Probability.renewalExcess`,
`TauCeti.Probability.measurable_renewalExcess`, `TauCeti.Probability.measureReal_lt_renewalExcess`,
`TauCeti.Probability.measureReal_renewalExcess_le_eq_add`.

**Checks.**
- For exponential increments of rate λ, `P(E_t ≤ x) = 1 − e^{−λx}` for every t, which is the limit
  `λ ∫₀ˣ e^{−λs} ds`.
- For deterministic increments a (a lattice law), `E_t = a(⌊t/a⌋ + 1) − t` runs through (0, a]
  periodically and `P(E_t ≤ x)` has no limit for 0 < x < a; the formula would give x/a.
- When μ = ∞ the limit is zero for every x, a law of total mass zero: the finite-mean hypothesis is
  exactly what makes the limit a probability distribution.

### Examples

- For exponential increments every quantity of Layer 6 is explicit: `U − δ₀ = λ · Lebesgue`,
  `m(t) = λt` and `E_t` is exponential of rate λ for every t.

### Dependencies

§6.2 uses no earlier layer of this roadmap; §6.3 uses §5.4; §6.4 uses §5.3, §5.4 and §6.3.

## Layer 7: Connections to Poisson processes

The targets here connect the renewal processes of Layers 4–5 and the chains of Layer 0 with the
rate-λ Poisson process of StochasticCalculus §0.6 (Convention 9), for λ > 0 unless stated otherwise:
no point at zero, simple paths and no explosion (Tassion, Definitions 9.1 and 9.4 and
Proposition 9.1; Last and Penrose, Definition 3.1, Proposition 6.9 and Section 7.1).

### 7.1 Exponential renewals are Poisson processes

Let the increments be independent exponential of rate λ > 0. Prove that the point measure
`ξ := ∑_{n ≥ 1} δ_{S_n}` is a measurable map into `Measure ℝ≥0` with `ξ([0, t]) = N_t`, that almost
surely it has no atom at zero and all its atoms have mass one, and that for pairwise disjoint Borel
sets `B₁, …, B_k ⊆ ℝ≥0` of finite Lebesgue measure the counts `ξ(B_i)` are independent and Poisson
of means `λ · Leb(B_i)`. Prove that the count process `(N_t)` is a rate-λ Poisson process for its
natural filtration, and that every rate-λ Poisson process with the path regularity of
Convention 9 has, as a process indexed by `ℝ≥0`, the same law as `(N_t)` (Tassion, Theorem 9.3).
The maps from the increments to ξ and to the count process, and from a regular counting path to its
jump times, are measurable. Derive `N_t/t → λ` almost surely from the renewal law of large numbers
(Tassion, Theorem 9.8).
*Needs:* StochasticCalculus §0.6; Mathlib `ProbabilityTheory.expMeasure`,
`ProbabilityTheory.poissonMeasure`, `MeasureTheory.Measure.sum`, `MeasureTheory.Measure.dirac`,
`MeasureTheory.Measure.measurable_of_measurable_coe`; Tau Ceti
`TauCeti.Probability.hasLaw_renewalCountNat_poissonMeasure`,
`TauCeti.Probability.hasLaw_arrival_gammaMeasure`, `TauCeti.Probability.ae_tendsto_renewalCountNat_div`.

**Checks.**
- `P(N_t = 0) = e^{−λt} = P(T₁ > t)`, and `ξ((s, t])` is Poisson of mean λ(t − s) for s ≤ t.

### 7.2 The microscopic characterization

For λ > 0, let N be a process with measurable coordinates, values in ℕ, `N₀ = 0`, and paths that
are nondecreasing, right-continuous and finite at every time, all on one event of probability one.
Prove that N is a rate-λ Poisson process exactly when it has stationary independent increments and,
as h ↓ 0,

```text
P(N_h = 1) = λh + o(h),      P(N_h ≥ 2) = o(h).
```

The conclusion includes simplicity: almost surely every jump has size one (Tassion, Theorem 9.4).
The route subdivides [0, t] into m intervals, applies the scalar Poisson limit theorem to the number
of intervals that carry an increment, and controls the probability that some interval carries two
or more jumps.
*Needs:* StochasticCalculus §0.6; Mathlib `ProbabilityTheory.tendsto_choose_mul_pow_of_tendsto_mul_atTop`,
`ProbabilityTheory.poissonMeasure`.

**Checks.**
- A rate-λ Poisson process has `P(N_h = 1) = λh e^{−λh}` and `P(N_h ≥ 2) = O(h²)`.
- The process that doubles every point of a rate-λ Poisson process has stationary independent
  increments but `P(N_h ≥ 2) ∼ λh`, which is not o(h); it is not a Poisson process.

### 7.3 Restarting and sampling the Poisson process

For each deterministic t, StochasticCalculus §0.6's restart property, applied to the natural
filtration of N, makes `(N_{t+s} − N_t)_{s ≥ 0}` a rate-λ Poisson process independent of the
natural history up to t (Tassion, Theorem 9.7); prove that it has the law of N. For Δ > 0, prove
that `(N_{nΔ})_{n ≥ 0}` is a chain of Layer 0 on ℕ, with initial state 0 and the kernel sending i
to the law of `i + Poi(λΔ)`.
*Needs:* §1.1; StochasticCalculus §0.6; Mathlib `ProbabilityTheory.poissonMeasure`,
`ProbabilityTheory.poissonMeasure_conv_poissonMeasure`; Tau Ceti
`TauCeti.Probability.hasLaw_markovChainLaw_iff_prefixLaw_singleton`.

**Checks.**
- Two steps of the kernel `i ↦ i + Poi(λΔ)` give `i + Poi(2λΔ)`, the law of `N_{2Δ}` from `N_0 = i`,
  by `poissonMeasure_conv_poissonMeasure`.

### 7.4 Thinning and superposition

Prove the temporal thinning and superposition identities. Bernoulli thinning with p ∈ [0, 1], each
arrival kept independently with probability p, splits a rate-λ Poisson process into independent
Poisson processes of rates pλ and (1 − p)λ. The sum of independent Poisson processes of rates λ and
λ' is a Poisson process of rate λ + λ'. Rate zero is the identically zero process and is treated
separately from the positive-rate characterization by exponential gaps (Tassion, Theorems 9.9 and
9.11; Last and Penrose, Theorem 3.3, Proposition 5.5 and Corollary 5.9).
*Needs:* §7.1; StochasticCalculus §0.6; Mathlib `ProbabilityTheory.poissonMeasure`,
`ProbabilityTheory.poissonMeasure_conv_poissonMeasure`.

**Checks.**
- For p = 0 the kept process is identically zero, of rate zero, and the discarded one is the
  original process; for p = 1 the roles swap. Independence holds in both cases.
- For independent processes of rates 1 and 2, `P(N_1 = 0) = e^{−3}` for the sum; adding the processes
  must add the rates (a maximum of the rates would give `e^{−2}`).

### Examples

- The temporal Poisson process counts (0, t], agrees with the count of the exponential renewal
  process, and keeps independence under thinning, including p = 0 and p = 1.

### Dependencies

Layer 7 uses Layers 0, 4 and 5 (§1.1 for the chain of §7.3) and StochasticCalculus §0.6.

## Downstream consumers

- MathematicalStatisticsFoundations leaves stationarity and detailed balance, stated with
  `Kernel.Invariant` and `Kernel.IsReversible`, to Layer 3, and uses `Kernel.IsReversible.invariant`
  for the Metropolis–Hastings kernel.
- RegretMinimizationAndEquilibria leaves the theory of stationary distributions to Layer 3:
  stationarity with its finite matrix form (§3.1), and existence and uniqueness for irreducible
  positive recurrent chains (§3.2).
- MarkovDecisionProcesses leaves the classification, stationary laws and convergence of chains to
  Layers 2 and 3.
- FiniteSamplingDiscrepancy leaves total variation of measures on countable spaces to Layer 3
  (§3.5).
- ProbabilisticAndMetricNumberTheoryPartII leaves ordinary renewal processes, Blackwell's theorem
  and the key renewal theorem to Layers 4–6.

## Scope and ownership

This roadmap owns homogeneous discrete-time chains on nonempty countable state spaces with
measurable singletons, ordinary renewal processes with nonnegative independent identically
distributed increments, and their connections with the homogeneous Poisson process: the targets of
§§0.2, 0.4, 1.1–1.4, 2.2–2.4, 3.1, 3.2, 3.4–3.6, 4.4, 5.2–5.4, 6.2–6.4 and 7.1–7.4 above.

**At the pins.** The following material in the scope of this roadmap is proved in the pinned Tau
Ceti and Mathlib and is consumed by name. Other roadmaps cite it by the section numbers in the first
column, which resolve as follows.

| Section | Content | Declarations at the pins |
| --- | --- | --- |
| §0.1 | a unique Markov kernel from countable transition weights with row sums one; singleton evaluation; probability mass function and finite stochastic-matrix forms; compatibility with composition, powers and initial laws | Tau Ceti `ProbabilityTheory.Kernel.existsUnique_isMarkovKernel_of_tsum_eq_one`, `ProbabilityTheory.Kernel.ofPMF`, `ProbabilityTheory.Kernel.ofPMF_apply_singleton`, `ProbabilityTheory.Kernel.toPMF`, `ProbabilityTheory.Kernel.ofPMF_toPMF`, `ProbabilityTheory.Kernel.toPMF_ofPMF`, `ProbabilityTheory.Kernel.ofPMF_comp_ofPMF`, `ProbabilityTheory.Kernel.toPMF_comp`, `ProbabilityTheory.Kernel.pow_add_apply_singleton`, `PMF.toMeasure_bind`, `ProbabilityTheory.Kernel.toMatrix`, `ProbabilityTheory.Kernel.rowStochasticEquiv`, `Matrix.rowStochastic.toKernel`, `ProbabilityTheory.Kernel.toMatrix_comp`, `ProbabilityTheory.Kernel.toMatrix_pow`, `Matrix.rowStochastic.toKernel_mul`, `Matrix.rowStochastic.toKernel_pow`, `ProbabilityTheory.Kernel.comp_apply_singleton_eq_vecMul` |
| §0.2 (part) | the time-n law, uniqueness of the path law from its initial law and prefix recursion, measurable dependence on the starting state, the kernel x ↦ P_x | Tau Ceti `MeasureTheory.Measure.markovChainLaw_map_eval`, `MeasureTheory.Measure.eq_markovChainLaw`, `ProbabilityTheory.Kernel.measurable_markovChainLaw_dirac`, `ProbabilityTheory.Kernel.markovChainKernel`, `ProbabilityTheory.Kernel.markovChainKernel_apply` |
| §0.3 | a process has path law `markovChainLaw ν κ` exactly when its finite paths have the product masses | Tau Ceti `TauCeti.Probability.hasLaw_markovChainLaw_iff_prefixLaw_singleton` |
| §0.4 (part) | existence of jointly measurable uniform samplers and the law of their iteration | Tau Ceti `TauCeti.Probability.exists_uniform_randomizedChain`, `TauCeti.Probability.hasLaw_randomizedChain` |
| §1.2, §1.3 (canonical space) | the Markov and strong Markov properties of `markovChainLaw ν κ` for `Filtration.piLE` | Tau Ceti `MeasureTheory.Measure.condExp_shift_iterate_markovChainLaw`, `MeasureTheory.Measure.condExp_indicator_shift_iterate_markovChainLaw`, `ProbabilityTheory.HasLaw.prefix_processShift_markovChainLaw`, `MeasureTheory.Measure.condExp_stoppedValue_shift_iterate_markovChainLaw`, `MeasureTheory.Measure.condExp_indicator_stoppedValue_shift_iterate_markovChainLaw`, `MeasureTheory.Measure.condExp_stoppedValue_shift_iterate_markovChainLaw_of_ae_ne_top` |
| §1.4 (part) | successive visits as stopping times; infinitely many returns at a state returned to almost surely; each gap is the excursion length plus one; the visit-time conventions | Tau Ceti `MeasureTheory.Adapted.isStoppingTime_successiveVisit`, `ProbabilityTheory.Kernel.ae_infinite_setOf_eq_markovChainLaw_dirac`, `TauCeti.Probability.successiveVisit_gap_eq_length_excursion_add_one`, `TauCeti.Probability.successiveVisit_eq_visitTime`, `TauCeti.Probability.successiveVisit_succ_eq_hittingAfter` |
| §2.1 | reachability, communication, irreducibility, the equivalence-relation API, the closed-class criterion, restriction to a closed class as a Markov kernel on a subtype | Tau Ceti `ProbabilityTheory.Kernel.Reaches`, `ProbabilityTheory.Kernel.Communicates`, `ProbabilityTheory.Kernel.communicates_equivalence`, `ProbabilityTheory.Kernel.isIrreducible_count_iff_forall_communicates`, `ProbabilityTheory.Kernel.isIrreducible_count_iff_forall_reaches`, `ProbabilityTheory.Kernel.communicatingClass`, `ProbabilityTheory.Kernel.IsClosedSet`, `ProbabilityTheory.Kernel.isClosedSet_iff_forall_reaches_mem`, `ProbabilityTheory.Kernel.isMarkovKernel_subtype_communicatingClass_iff`, `ProbabilityTheory.Kernel.subtype`, `ProbabilityTheory.Kernel.isMarkovKernel_subtype_iff_isClosedSet`, `ProbabilityTheory.Kernel.subtype_pow_apply`, `ProbabilityTheory.Kernel.isIrreducible_subtype_communicatingClass`; Mathlib `ProbabilityTheory.Kernel.IsIrreducible` |
| §2.2 (part) | the geometric tail of the visits, infinitely many visits at a recurrent state, the Green-function identities, the recurrence criterion, the mean number of visits from every initial law | Tau Ceti `ProbabilityTheory.Kernel.markovChainLaw_dirac_setOf_successiveVisit_ne_top`, `ProbabilityTheory.Kernel.ae_infinite_setOf_eq_markovChainLaw_dirac`, `ProbabilityTheory.Kernel.tsum_pow_apply_singleton_self`, `ProbabilityTheory.Kernel.tsum_pow_apply_singleton_self_eq_top_iff`, `ProbabilityTheory.Kernel.tsum_pow_comp_apply_singleton`, `MeasureTheory.Measure.lintegral_encard_setOf_eq_markovChainLaw`, `MeasureTheory.Measure.markovChainLaw_setOf_infinite_setOf_eq_eq_zero` |
| §3.3 | the period, its class invariance, eventual positivity of return and transition masses, the additive-semigroup lemma | Tau Ceti `ProbabilityTheory.Kernel.returnLengths`, `ProbabilityTheory.Kernel.period`, `ProbabilityTheory.Kernel.IsAperiodic`, `ProbabilityTheory.Kernel.period_eq_period_of_pos`, `ProbabilityTheory.Kernel.eventually_pos_pow_apply_singleton_self_of_period_eq_one`, `ProbabilityTheory.Kernel.IsAperiodic.eventually_pos_pow_apply_singleton`; Mathlib `Nat.exists_mem_closure_of_ge` |
| §3.4 (part) | independent product chains, their path laws and invariant products, irreducibility and aperiodicity of the product | Tau Ceti `MeasureTheory.Measure.markovChainLaw_parallelComp`, `ProbabilityTheory.HasLaw.prodMk_markovChainLaw`, `ProbabilityTheory.Kernel.Invariant.parallelComp`, `ProbabilityTheory.Kernel.IsAperiodic.parallelComp`, `ProbabilityTheory.Kernel.IsAperiodic.isIrreducible_parallelComp`, `ProbabilityTheory.Kernel.parallelComp_pow_apply_singleton` |
| §4.1 | product-space construction and transfer, measurability, nonexplosion, finiteness of all counts on one event, monotonicity, right continuity, the inverse relations, the natural-valued count and the invariance of its law | Tau Ceti `TauCeti.Probability.map_renewalCount_eq_infinitePi_map`, `TauCeti.Probability.map_renewalCountNat_eq_infinitePi_map`, `TauCeti.Probability.measurable_renewalCount`, `TauCeti.Probability.measurable_renewalCountNat`, `TauCeti.Probability.ae_tendsto_arrival_atTop`, `TauCeti.Probability.ae_renewalCount_lt_top`, `TauCeti.Probability.monotone_renewalCount`, `TauCeti.Probability.continuousWithinAt_renewalCount_Ici`, `TauCeti.Probability.natCast_le_renewalCount_iff`, `TauCeti.Probability.arrival_renewalCountNat_le`, `TauCeti.Probability.lt_arrival_renewalCountNat_succ`, `TauCeti.Probability.renewalCountNat`, `TauCeti.Probability.map_renewalCountNat_eq_of_nonexplosion` |
| §4.2 | finite moments of every order of the counts, without a mean assumption | Tau Ceti `TauCeti.Probability.lintegral_renewalCount_pow_lt_top`, `TauCeti.Probability.exists_lintegral_renewalCount_pow_le` |
| §4.3 | convolution powers, the renewal measure, its finiteness on bounded intervals, `U = δ₀ + F ∗ U`, the renewal function as expected count, its monotonicity and right continuity, the Stieltjes measure of m | Tau Ceti `MeasureTheory.Measure.convolutionPower`, `MeasureTheory.Measure.renewalMeasure`, `MeasureTheory.Measure.renewalMeasure_Iic_lt_top`, `MeasureTheory.Measure.renewalMeasure_eq_dirac_add_conv`, `MeasureTheory.Measure.renewalFunction`, `MeasureTheory.Measure.renewalFunction_eq_tsum`, `MeasureTheory.Measure.renewalMeasure_Iic`, `TauCeti.Probability.lintegral_renewalCount`, `MeasureTheory.Measure.monotone_renewalFunction`, `MeasureTheory.Measure.continuousWithinAt_renewalFunction_Ici`, `MeasureTheory.Measure.renewalStieltjes`, `MeasureTheory.Measure.comap_measure_renewalStieltjes`, `MeasureTheory.Measure.measure_renewalStieltjes_singleton_zero` |
| §4.4 (part) | exponential increments | Tau Ceti `TauCeti.Probability.hasLaw_renewalCountNat_poissonMeasure`, `TauCeti.Probability.lintegral_renewalCount_of_expMeasure` |
| §5.1 | the almost-sure and `L¹` laws of large numbers for the counts, the elementary renewal theorem and uniform integrability of `N_t/t`, including μ = ∞ | Tau Ceti `TauCeti.Probability.ae_tendsto_renewalCountNat_div`, `TauCeti.Probability.tendsto_eLpNorm_renewalCountNat_div_sub`, `TauCeti.Probability.uniformIntegrable_renewalCountNat_div`, `TauCeti.Probability.tendsto_integral_renewalCountNat_div`, `MeasureTheory.Measure.tendsto_renewalFunction_div` |
| §5.4 (part) | the local renewal bound and the uniform bound on the increments of m | Tau Ceti `MeasureTheory.Measure.renewalMeasure_Icc_add_le`, `MeasureTheory.Measure.renewalFunction_add_le` |
| §6.1 | the convolution of a function with a measure, its measurability, local bound, linearity and associativity, and the uniform convergence of `∑ h ∗ F^{∗n}` on bounded intervals | Tau Ceti `TauCeti.Probability.renewalConv`, `TauCeti.Probability.measurable_renewalConv`, `TauCeti.Probability.abs_renewalConv_le`, `TauCeti.Probability.renewalConv_add`, `TauCeti.Probability.renewalConv_smul`, `TauCeti.Probability.renewalConv_renewalConv`, `TauCeti.Probability.summable_abs_renewalConv_convolutionPower`, `TauCeti.Probability.tendstoUniformlyOn_sum_renewalConv_convolutionPower`, `TauCeti.Probability.renewalConv_renewalMeasure` |
| §6.2 (part) | existence and uniqueness for the renewal equation | Tau Ceti `TauCeti.Probability.renewalConv_renewalMeasure_eq_add`, `TauCeti.Probability.eq_renewalConv_renewalMeasure` |
| §6.4 (part) | the excess, its measurability, its renewal equation and its tail representation | Tau Ceti `TauCeti.Probability.renewalExcess`, `TauCeti.Probability.measurable_renewalExcess`, `TauCeti.Probability.measureReal_renewalExcess_le_eq_add`, `TauCeti.Probability.measureReal_lt_renewalExcess`, `TauCeti.Probability.measureReal_lt_renewalExcess_eq_add` |

The path law of a chain and its excursion decomposition at a recurrent state were specified by the
completed [Exchangeability](../../Completed/Exchangeability/README.md) roadmap, Layer 8, and are
consumed here by their Tau Ceti names.

**Owned elsewhere.** [StochasticCalculus](../StochasticCalculus/README.md) §0.6 owns the homogeneous
Poisson counting process relative to an arbitrary filtration: its definition, existence, path
regularization, jump times and independent exponential waiting times, and its restart property for
an arbitrary filtration; Layer 7 here owns the connections with exponential renewal processes and
the natural-history statements. StochasticCalculus also owns Brownian motion, stochastic integration
and stochastic differential equations. [StandardDistributions](../StandardDistributions/README.md),
Layers 0–5 and 7, owns the scalar probability laws, their convolutions and moment identities.

**Outside this roadmap.** General-state Harris recurrence, generators of continuous-time chains,
Palm theory and renewal-reward theory; general random measures and point processes, Poisson
processes on general spaces and their construction and uniqueness, Laplace functionals, the mapping
and marking theorems in general, and two-sided stationary renewal laws, Palm inversion and length
bias, which the ordinary renewal limits here do not need; and direct Riemann integrability beyond
the nonincreasing forcing of §6.3.

## Exact supplier contracts

### From Mathlib

- Kernels: `ProbabilityTheory.Kernel`, `IsMarkovKernel`, kernel powers `κ ^ n` with
  `ProbabilityTheory.Kernel.pow_add` and `ProbabilityTheory.Kernel.pow_add_apply_eq_lintegral`
  (Chapman–Kolmogorov), `ProbabilityTheory.Kernel.deterministic`, the independent product
  `ProbabilityTheory.Kernel.parallelComp` (`κ ∥ₖ η`), and `MeasureTheory.Measure.bind` (`∘ₘ`).
- `ProbabilityTheory.Kernel.Invariant` (`μ.bind κ = μ`), `ProbabilityTheory.Kernel.IsReversible`
  (detailed balance on measurable sets) and `ProbabilityTheory.Kernel.IsReversible.invariant` (a
  reversible Markov kernel leaves π invariant), in `Mathlib/Probability/Kernel/Invariance.lean`.
- `ProbabilityTheory.Kernel.IsIrreducible φ κ` (φ-irreducibility), used with `φ = Measure.count`,
  in `Mathlib/Probability/Kernel/Irreducible.lean`.
- `ProbabilityTheory.Kernel.traj`, the Ionescu-Tulcea trajectory construction behind the path law.
- Filtrations and stopping: `MeasureTheory.Filtration`, `MeasureTheory.Filtration.natural`,
  `MeasureTheory.Filtration.piLE`, `MeasureTheory.Adapted`, `MeasureTheory.IsStoppingTime` with
  `IsStoppingTime.measurableSpace`, `MeasureTheory.stoppedValue`, `MeasureTheory.hittingAfter` (the
  first time at or after n in a set, `⊤` if none) and `MeasureTheory.Adapted.isStoppingTime_hittingAfter`,
  `MeasureTheory.condExp`.
- `MeasureTheory.tvDist` and `MeasureTheory.etvDist` (the total variation of μ − μ' for finite
  measures, zero for `tvDist` if one is not finite), in
  `Mathlib/MeasureTheory/Measure/TotalVariation/Defs.lean`.
- Independence and limit theorems: `ProbabilityTheory.iIndepFun`, `ProbabilityTheory.IdentDistrib`,
  `ProbabilityTheory.HasLaw`, `MeasureTheory.Measure.infinitePi`, `ProbabilityTheory.strong_law_ae`,
  `ProbabilityTheory.variance`, `MeasureTheory.TendstoInDistribution` and the central limit theorem
  `ProbabilityTheory.tendstoInDistribution_inv_sqrt_mul_sum_sub` (in
  `Mathlib/Probability/CentralLimitTheorem.lean`), `MeasureTheory.UniformIntegrable`.
- Scalar laws: `ProbabilityTheory.poissonMeasure` with `ProbabilityTheory.poissonMeasure_conv_poissonMeasure`,
  `ProbabilityTheory.expMeasure`, `ProbabilityTheory.gammaMeasure`, `ProbabilityTheory.geometricMeasure`
  (failures before the first success), `ProbabilityTheory.gaussianReal`, and the Poisson limit
  theorem `ProbabilityTheory.tendsto_choose_mul_pow_of_tendsto_mul_atTop`.
- Measures: `MeasureTheory.Measure.conv` (`∗`), `MeasureTheory.Measure.sum`,
  `MeasureTheory.Measure.dirac`, `MeasureTheory.Measure.count`,
  `MeasureTheory.Measure.measurable_of_measurable_coe`, `StieltjesFunction`.
- `Nat.setGcd` and `Nat.exists_mem_closure_of_ge` (a set of naturals contains, up to its closure
  under addition, every large multiple of its gcd), `Matrix.rowStochastic`, `PMF`, `SimpleGraph`.

### From Tau Ceti

All declarations below are proved at the pin, with the hypotheses stated; they are listed by file
(paths under `TauCeti/`). The declarations of the table under Scope and ownership are part of this
contract.

- *Path law* (`Probability/Process/MarkovChain.lean`): `TauCeti.Probability.markovChainLaw ν κ`,
  the Ionescu-Tulcea law of the homogeneous chain, a probability measure for probability ν;
  `ProbabilityTheory.Kernel.markovChainKernel` with `ProbabilityTheory.Kernel.markovChainKernel_apply`
  and `ProbabilityTheory.Kernel.measurable_markovChainLaw_dirac`;
  `MeasureTheory.Measure.markovChainLaw_map_eval` (the time-n law is `(κ ^ n) ∘ₘ ν`, every ν),
  `MeasureTheory.Measure.markovChainLaw_setOf_apply_eq_comp`,
  `TauCeti.Probability.markovChainLaw_map_prefix_apply_singleton` (product masses of finite paths,
  s-finite ν, measurable singletons), `MeasureTheory.Measure.eq_markovChainLaw` (uniqueness from the
  initial law and the prefix recursion, finite ν), `TauCeti.Probability.hasLaw_markovChainLaw_iff`
  and `TauCeti.Probability.hasLaw_markovChainLaw_iff_prefixLaw_singleton` (a process with almost
  everywhere measurable coordinates and finite ν; the second on a countable space).
- *Markov properties on path space* (`Probability/MarkovChain/MarkovProperty.lean`,
  `Probability/MarkovChain/StrongMarkov.lean`): the six conditional-expectation forms of the §1.2,
  §1.3 row, for finite ν, the filtration `Filtration.piLE` and its stopping times, restricted to
  `{τ ≠ ⊤}` except in the `_of_ae_ne_top` form, which assumes τ < ∞ almost surely; the shift is
  `TauCeti.Probability.shift`, with `TauCeti.Probability.measurable_shift_iterate`.
- *Visits and the Green function* (`Probability/MarkovChain/Visits.lean`,
  `Probability/Process/SuccessiveVisits.lean`): `TauCeti.Probability.successiveVisit` (visit zero is
  the first entrance, `⊤` when the visit does not exist) with the declarations of the §1.4 and §2.2
  rows; `ProbabilityTheory.Kernel.markovChainLaw_dirac_setOf_successiveVisit_ne_top` states
  `P_y(visit k exists) = ρ_y^k`, `ProbabilityTheory.Kernel.tsum_pow_apply_singleton_self` states
  `G(y, y) = (1 − ρ_y)⁻¹`, and `ProbabilityTheory.Kernel.tsum_pow_comp_apply_singleton` states
  `∑_n ((κ ^ n) ∘ₘ ν){y} = P_ν(H_y < ∞) · G(y, y)` for finite ν; all assume measurable singletons.
- *Excursions* (`Probability/Process/Excursion/MarkovChain.lean`): on a countable state space with
  measurable singletons and for a state `a₀` returned to infinitely often almost surely under
  `P_{a₀}`, `TauCeti.Probability.iIndepFun_excursionProcess` (the excursions are independent),
  `TauCeti.Probability.map_excursionProcess_eq_excursionLaw` (each has the law
  `TauCeti.Probability.excursionLaw κ a₀`), `TauCeti.Probability.markovChainLaw_eq_map_pathOfExcursions`
  and, in `Probability/Exchangeability/Recurrence/Excursion.lean`, the same independence in the
  form `TauCeti.Probability.conditionallyIIDWith_excursionProcess`.
- *Classes and periods* (`Probability/Kernel/Reachability.lean`, `Probability/Kernel/ClosedClass.lean`,
  `Probability/MarkovChain/Period.lean`): the declarations of the §2.1 and §3.3 rows, with
  `ProbabilityTheory.Kernel.Reaches` including the zeroth power and the period of a state without
  return lengths equal to zero.
- *Product chains* (`Probability/MarkovChain/Product.lean`,
  `Probability/Kernel/Composition/ParallelComp.lean`): the declarations of the §3.4 row; the path
  law identity is for finite initial measures, and `ProbabilityTheory.HasLaw.prodMk_markovChainLaw`
  assumes independence of the whole paths.
- *Kernels as weights and matrices* (`Probability/Kernel/PMF.lean`, `Probability/Kernel/Matrix.lean`,
  `Probability/Kernel/Composition/Power.lean`): the declarations of the §0.1 row, composition in
  transition order, and `ProbabilityTheory.Kernel.deterministic_pow`.
- *Simulation* (`Probability/MarkovChain/Simulation.lean`): `TauCeti.Probability.randomizedChain`;
  `TauCeti.Probability.hasLaw_randomizedChain` (measurable samplers g and f, independent noises of a
  common law ρ with `ρ.map g = ν` and `ρ.map (f x) = κ x`, give path law `markovChainLaw ν κ`);
  `TauCeti.Probability.exists_uniform_randomizedChain` (a nonempty standard Borel state space and
  uniform noise on the unit interval).
- *Infinite-mean strong law* (`Probability/StrongLaw.lean`):
  `TauCeti.Probability.strong_law_ae_real_of_lintegral_eq_top` (pairwise independent identically
  distributed real variables, almost surely nonnegative and of infinite mean, have averages tending
  to infinity almost surely).
- *Total variation* (`MeasureTheory/Measure/TotalVariation.lean`):
  `MeasureTheory.etvDist_le_two_mul_iff` (for finite measures of equal total mass, `etvDist ≤ 2c`
  exactly when every measurable event has μ-mass at most its μ'-mass plus c).
- *Renewal processes* (`Probability/Renewal/`, `MeasureTheory/Group/Convolution/Power.lean`): the
  declarations of the §4.1 to §6.4 rows, with `TauCeti.Probability.arrival`,
  `TauCeti.Probability.renewalCount`, `TauCeti.Probability.le_renewalCountNat_iff`,
  `TauCeti.Probability.renewalConv_add_measure`, `TauCeti.Probability.renewalConv_dirac_zero`,
  `TauCeti.Probability.renewalConv_measureReal_Ioi_renewalMeasure` (`∫_{[0, t]} F̄(t − s) U(ds) = 1`
  for a probability F with `F({0}) < 1`) and `TauCeti.Probability.hasLaw_arrival_gammaMeasure`. The
  statements about a realization assume measurable increments with `iIndepFun T P` and
  `IdentDistrib (T n) (T 0) P P`, and `P {ω | T 0 ω = 0} < 1` where finiteness of the counts is used;
  the almost-sure law of large numbers needs only pairwise independence. The statements about a law
  μ on `ℝ≥0` assume `IsProbabilityMeasure μ` and, where finiteness is used, `μ {0} < 1`.

### From TauCetiRoadmap.StochasticCalculus

§0.6: the rate-α Poisson process for a filtration F (a real process with `N₀ = 0` almost surely,
strongly adapted to F, increments `N_t − N_s` with law `(poissonMeasure (α(t − s))).map Nat.cast`
independent of `F s`), its existence, its regularized version with ℕ-valued nondecreasing
right-continuous paths with unit jumps and finitely many jumps on bounded intervals, its jump times
and the independent exponential waits of rate α > 0, and the restart property of the future
increment process for an arbitrary filtration. Layer 7 consumes the definition, the regularized
version and, for §7.3, the restart property.

### From TauCetiRoadmap.StandardDistributions

Layers 0–5 and 7: the Poisson, exponential, Gamma, geometric, Gaussian and uniform laws, their
convolutions and moment identities. Where these are in the pinned libraries, the names in the
Mathlib and Tau Ceti contracts above are the contract.

## References

- Vincent Tassion, *Applied Stochastic Processes*, lecture notes, ETH Zürich, Spring 2025 (revision
  June 20, 2025), https://metaphor.ethz.ch/x/2025/fs/401-3602-00L/sc/script.pdf. The main source,
  cited by numbered statement for the chain, renewal and Poisson results.
- J. R. Norris, *Markov Chains*, Cambridge University Press (1997), Chapter 1, for full proofs of
  the chain results, including those left to exercises or admitted in the notes.
- W. Feller, *An Introduction to Probability Theory and Its Applications*, vol. II, second edition
  (1971), Chapter XI, renewal theory, for full proofs of the renewal results and the argument of
  §5.4.
- G. Last and M. Penrose, *Lectures on the Poisson Process* (2017), for the definition and
  simplicity of Poisson processes, the homogeneous process on the half-line, superposition and
  thinning.
- Zulip discussion of adapted filtrations for Markov chains and Markov processes,
  https://leanprover-community.github.io/archive/stream/509433-Brownian-motion/topic/Adapted.20Filtrations.20for.20Markov.20Chains.20and.20Markov.20Processes.html,
  for the filtration-relative form of §1.1.

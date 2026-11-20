# Roadmap: hidden Markov models

**Summary.** Develop the theory of hidden Markov models with a countable hidden state space and
observations in an arbitrary measurable space whose emission laws have densities with respect to a
reference measure. The pair process of states and observations is constructed as a homogeneous
Markov chain on path space; the hidden process is a Markov chain, the observations are
conditionally independent given the states, and the finite-dimensional laws have an explicit
joint density. The roadmap proves that the forward recursion computes the likelihood of the
observations, as a sum over state paths and, on a finite state space, as a matrix product; that
the normalized forward variable is the conditional law of the present state given the
observations up to the present (the filter), with its normalized recursion, the likelihood as the
product of the normalizers, and prediction; that the forward and backward variables give the
conditional laws of one state and of two consecutive states given all the observations
(smoothing), and the conditional law of the whole state path. It proves that the Viterbi
recursion, in max-product and in max-sum form, computes the largest joint density over state
paths and that backtracking returns a maximizer, and characterizes the maximizers of positive
value. For finite state spaces and finite observation alphabets it proves Baum's inequality for
the auxiliary function, the closed form of the Baum–Welch update from expected counts, and that
one update does not decrease the likelihood, with equality only at models that satisfy the
update equations. It ends with the forgetting of the initial law: under a two-sided mixing
condition on the transition law, two filters driven by the same observations approach each other
at the geometric rate `1 − ε²`.

## How to read the build

Layer 1 defines models and their joint densities, constructs the path law and proves its
conditional laws and finite-dimensional densities. Layer 2 uses Layer 1: the forward variable,
the likelihood and the filter, identified with conditional laws through the densities of 1.3.
Layer 3 uses Layers 1 and 2: the backward variable and the smoothing laws. Layer 4 uses the joint
density of 1.1; its comparison with the forward variable uses 2.1, and one statement of 4.2
reads a Viterbi path as a most probable path through 3.2. Layer 5 uses the joint density of
1.1, the likelihood of 2.1 and the smoothing quantities of Layer 3; it does not use Layer 4.
Layer 6 uses the filter of Layer 2 and the backward variable and backward kernels of Layer 3,
and neither Layer 4 nor Layer 5. Each numbered target ends with **Checks** and a *Needs:* line,
and every claim carries a source locator in parentheses or says that it is proved here.

The Checks use four small models with `S = {0, 1}`. The **example model** `E` has
`Y = {a, b}`, `init = (1/2, 1/2)`, `trans 0 = (3/4, 1/4)`, `trans 1 = (1/4, 3/4)`, emission mass
functions `(3/4, 1/4)` in state `0` and `(1/4, 3/4)` in state `1`, and is observed along
`y = (a, a, b)` with horizon `n = 2`. The **uniform model** `U` has all these probabilities equal
to `1/2`. The **frozen model** has the initial and emission laws of `E` and `trans s = pure s`.
The **dead-end model** `D` has `init = (1, 0)`, `trans 0 = (1/2, 1/2)`, `trans 1 = (0, 1)`, and
both states emit `a` with probability `1`.

## Conventions

- **Hidden states.** `S` is the type of hidden states. The recursions of Layers 2 to 4 are sums
  `∑'` and suprema `⨆` in `ℝ≥0∞` and need no structure on `S`. Every statement about the path
  law assumes `[Countable S] [MeasurableSpace S] [DiscreteMeasurableSpace S]`, and every
  statement about a conditional law also assumes `[Nonempty S]`, which Mathlib's `condDistrib`
  requires of its target. Finiteness of `S` is assumed exactly where it is used: `[Fintype S]`
  with `[DecidableEq S]` for the matrix form of the likelihood (2.1), `[Finite S]` for the
  existence of a Viterbi path (4.2), and `[Fintype S]` for the sums over state paths of Layer 5.
- **Observations.** `Y` is a measurable space. The two statements that mention the product
  `Measure.pi fun _ ↦ M.ref` of the reference measure (`jointLaw_prefix_apply` of 1.3 and
  `jointLaw_map_obs` of 2.1) assume `[SigmaFinite M.ref]`: Mathlib defines `Measure.pi` for all
  factors and proves its value on boxes (`Measure.pi_pi`) and the splitting of a coordinate
  (`measurePreserving_piFinSuccAbove`) only for σ-finite factors. The statements about
  conditional laws do not mention the reference measure and do not assume this. Layer 5
  assumes in addition `[Fintype Y] [DecidableEq Y] [DiscreteMeasurableSpace Y]` where it treats
  emission mass functions.
- **Models.** A model is a term `M : HMM S Y` (1.1). Its transition probability from `s` to
  `s'` is `M.trans s s'`, its initial probability `M.init s`, and its emission density
  `M.dens s y : ℝ≥0`, coerced to `ℝ≥0∞` in every formula.
- **Time.** Time starts at `0`. A horizon `n` means the times `0, …, n`, hence `n + 1` states
  and `n + 1` observations. State paths and observation sequences are functions `x : ℕ → S` and
  `y : ℕ → Y`; a quantity with horizon `n` depends only on their values at times `≤ n`.
  A finite record `w : Fin (n + 1) → Y` is read as the sequence `fun i ↦ w (Fin.clamp i n)`
  (`Fin.clamp i n` is `min i n` as an element of `Fin (n + 1)`), and likewise for state paths.
- **Arithmetic.** All densities, forward, backward and Viterbi variables take values in `ℝ≥0∞`,
  with `0 * ⊤ = 0`, `x / 0 = ⊤` for `x ≠ 0`, `0 / 0 = 0` and `x / ⊤ = 0`. Normalized
  quantities are quotients in `ℝ≥0∞`; where the likelihood is `0` or `⊤` their value is `0`,
  and every statement that is sensitive to this says so.
- **The path space** is `ℕ → S × Y`; for `ω` in it, the state at time `n` is `(ω n).1` and the
  observation is `(ω n).2`. The letter `P` denotes the path law `M.jointLaw`.
- **Conditional laws** are Mathlib's `condDistrib`. A statement "the conditional law of `U`
  given `V` is `κ`" is written `∀ᵐ ω ∂P, condDistrib U V P (V ω) A = κ ω A`.
- **Distance.** The distance between two probability vectors `ν`, `ν'` on `S` is
  `∑' s, |ν s − ν' s|`, with values in `[0, 2]`. It needs no measurable structure on `S`, and
  Layer 6 is stated with it. On a countable `S` with measurable singletons it is Mathlib's
  `MeasureTheory.tvDist` of the two measures, an identity that MarkovChainsAndRenewal proves
  (its Layer 3, item 5) and that is not restated here.
- **Logarithms.** `Real.log 0 = 0` in Mathlib. The max-sum recursion of 4.1 uses
  `ENNReal.log : ℝ≥0∞ → EReal`, with `ENNReal.log 0 = ⊥`; the auxiliary function of 5.1 uses
  `Real.log`, and the statements about it carry the hypothesis that makes the value at `0`
  irrelevant.

## Layer 1: the model and its path law

### 1.1 Models and joint densities

Define a **hidden Markov model** as a structure `HMM S Y`, for a type `S` and a measurable space
`Y`, with fields `init : PMF S` (the initial law), `trans : S → PMF S` (the transition law of
each state), `ref : Measure Y` (the reference measure), `dens : S → Y → ℝ≥0` (the emission
density of each state), and the proofs `measurable_dens` that each `dens s` is measurable and
`lintegral_dens` that `∫⁻ y, dens s y ∂ref = 1` for each `s`. For a discrete measurable space
`Y` and emission mass functions `emit : S → PMF Y`, define `ofPMF init trans emit` as the model
with `ref = Measure.count` and `dens s y = (emit s y).toNNReal`.

Define the **joint density** of a state path `x` and an observation sequence `y` up to time `n`,

    jointDensity M x y n = init (x 0) * dens (x 0) (y 0) * ∏ t < n, trans (x t) (x (t+1)) * dens (x (t+1)) (y (t+1)).

Prove that:

- `jointDensity M x y n` depends only on the values of `x` and `y` at times `≤ n`, is finite, and
  satisfies `jointDensity M x y (n + 1) = jointDensity M x y n * trans (x n) (x (n + 1)) * dens (x (n + 1)) (y (n + 1))`;
- for fixed `x` and `n` it is a measurable function of `y`, and of the record
  `w : Fin (n + 1) → Y`;
- for `ofPMF init trans emit`, `dens s y = emit s y` after coercion and `∑' y, dens s y = 1`;
- every model whose emission laws are dominated by a σ-finite measure arises in this way: a
  probability measure dominated by a σ-finite `ref` has a density with values in `ℝ≥0`
  (`Measure.rnDeriv` is finite almost everywhere).

(Rabiner 1989, equations (12)–(15), for the joint probability of a state path and an
observation sequence on a finite alphabet; van Handel 2008, Definitions 1.6 and 1.9, for
observation densities with respect to a reference measure. Proved here.)

**Checks.**

- In `E` with `y = (a, a, b)`: `jointDensity E (0, 0, 0) y 2 = 1/2 · 3/4 · (3/4 · 3/4) · (3/4 · 1/4) = 81/2048`
  and `jointDensity E (0, 1, 1) y 2 = 1/2 · 3/4 · (1/4 · 1/4) · (3/4 · 3/4) = 27/2048`. Attaching
  to the transition from `x t` the density of the old state `x t` at `y (t + 1)` gives
  `81/2048` for the second path.
- `n = 0`: `jointDensity M x y 0 = init (x 0) * dens (x 0) (y 0)`; the empty product is `1`, and
  the observation at time `0` is weighted by the state at time `0`.
- The sum of `jointDensity E x y 2` over the eight state paths is `15/128`, and its sum over all
  `x` and all `y ∈ {a, b}³` is `1`.
- `lintegral_dens` excludes `dens = 2` on a one-point space with counting measure.
- `ofPMF`: for the emission law `(3/4, 1/4)` of state `0` of `E`, `dens 0 a = 3/4` and
  `dens 0 b = 1/4`, with integral `3/4 + 1/4 = 1` against counting measure; with the uniform
  probability measure on `{a, b}` as reference the density would be `(3/2, 1/2)`, twice the mass
  function.
- `ofPMF`: on `Y = ℕ` with the geometric emission law `emit s k = 2^(−(k+1))`, the field
  `lintegral_dens` is `∑' k, 2^(−(k+1)) = 1`, although `Y` is infinite.
- `ofPMF`: the model with one state, one symbol, `dens = 2` and `ref` half the counting measure
  satisfies all fields and is not of the form `ofPMF`, whose densities sum to `1` over `Y`; it
  is the model that the hypothesis of 5.3 excludes.
- A Gaussian emission model: `Y = ℝ`, `ref` Lebesgue measure and `dens s` the density of
  `N(m s, 1)`; here `ref` is σ-finite and not finite.
- `ref = Measure.count` on `Y = ℝ` and `dens s = indicator {0}` satisfy all fields, and `ref` is
  not σ-finite; the two statements that mention `Measure.pi fun _ ↦ M.ref` exclude this model,
  for which the supplier lemmas on `Measure.pi` say nothing, and the statements on conditional
  laws include it.

*Needs:* Mathlib `PMF`, `PMF.tsum_coe`, `lintegral_count`, `Fin.clamp`; for the last item,
`Measure.rnDeriv`, `Measure.rnDeriv_lt_top` and `Measure.withDensity_rnDeriv_eq`.

### 1.2 The path law

Assume `[Countable S] [MeasurableSpace S] [DiscreteMeasurableSpace S]`. Define

- `transKernel M : Kernel S S` as `Kernel.ofPMF M.trans`;
- `emitKernel M : Kernel S Y` as `Kernel.ofFunOfCountable fun s ↦ M.ref.withDensity (M.dens s)`,
  a Markov kernel by `lintegral_dens`;
- `pairKernel M : Kernel (S × Y) (S × Y)` as
  `(transKernel.comap Prod.fst) ⊗ₖ (emitKernel.comap Prod.snd)`: from `(s, y)` the next state
  `s'` is drawn from `trans s` and its observation from `emitKernel s'`; the old observation `y`
  is not used;
- the **path law** `jointLaw M : Measure (ℕ → S × Y)` as
  `markovChainLaw (M.init.toMeasure ⊗ₘ emitKernel M) (pairKernel M)`.

So the pair process is a homogeneous Markov chain by construction. Prove that `jointLaw M` is a
probability measure and that it has the following conditional laws, which are the ones every
proof of Layers 2, 3 and 6 uses:

- the pair at time `0` has law `init ⊗ₘ emitKernel`: the state at time `0` has law `init`, and
  the conditional law of the observation at time `0` given that state is `emitKernel` of it
  (`markovChainLaw_map_eval_zero`);
- for every `n`, the law of the pairs up to time `n` together with the pair at time `n + 1` is
  the law of the pairs up to time `n` composed with `pairKernel` at the pair of time `n`
  (`markovChainLaw_map_prefix_succ_eq_compProd`); hence the conditional law of the state at
  time `n + 1` given the pairs up to time `n` is `trans` of the state at time `n`, and the
  conditional law of the observation at time `n + 1` given the pairs up to time `n` and the
  state at time `n + 1` is `emitKernel` of that state;
- the hidden process is the Markov chain with initial law `init` and kernel `transKernel`
  (`jointLaw_map_states`): the image of `jointLaw M` under `ω ↦ fun n ↦ (ω n).1` is
  `markovChainLaw M.init.toMeasure (transKernel M)`; in particular the state at time `n` has law
  `(transKernel M ^ n) ∘ₘ init`;
- the observations up to time `n` are conditionally independent given the states up to time
  `n`, the `i`-th having the emission law of the `i`-th state (`jointLaw_map_prefix`): the
  joint law of the two records is the law of the state record composed with the kernel
  `x ↦ Measure.pi fun i ↦ emitKernel M (x i)`;
- for a standard Borel nonempty `Y`, the conditional law of the observation record given the
  state record is therefore `Measure.pi fun i ↦ emitKernel M (x i)`
  (`condDistrib_ae_eq_of_measure_eq_compProd`).

Route: `jointLaw_map_states` by `MeasureTheory.Measure.eq_markovChainLaw`, the recursion for the
state prefixes being the pair recursion with the observations integrated out;
`jointLaw_map_prefix` by induction on `n` from the pair recursion, splitting the last
coordinate of `Measure.pi` with `measurePreserving_piFinSuccAbove`. (van Handel 2008,
Definition 1.6 and Lemma 1.8, where the three properties are stated for general state spaces;
proved here.)

**Checks.**

- `emitKernel`: for `ofPMF init trans emit` it is `Kernel.ofPMF emit`; in `E` its row at state
  `0` gives mass `3/4` to `a`.
- `emitKernel`: for the Gaussian model of 1.1 its row at `s` is `N(m s, 1)`.
- `emitKernel`: its rows have total mass `1`; without `lintegral_dens` (`dens = 2` on a
  one-point space with counting measure) they would have mass `2`.
- `pairKernel`: in `E`, `pairKernel (0, a)` gives the pairs `(0, a)`, `(0, b)`, `(1, a)`, `(1, b)`
  the masses `9/16`, `3/16`, `1/16`, `3/16`, of sum `1`; its state marginal is
  `trans 0 = (3/4, 1/4)`.
- `pairKernel`: the old observation is not used: in the frozen model
  `pairKernel (0, b) = dirac 0 ⊗ (3/4, 1/4)`, the same as `pairKernel (0, a)`.
- `pairKernel`: a kernel that draws the new observation from the old state would give, in `E`,
  the mass `1/4 · 3/4 = 3/16` to `(1, a)` from `(0, a)` in place of `1/4 · 1/4 = 1/16`.
- `jointLaw`: in `E`, the pair at time `0` is `(0, a)` with probability `3/8` and `(1, a)` with
  probability `1/8`; an initial law `init ⊗ ref` would give `1/2 · 1` to `(0, a)` under counting
  measure and is not a probability measure.
- `jointLaw`: the observation process alone is not a Markov chain: in the frozen model
  `P(Y₂ = a | Y₁ = a, Y₀ = a) = 7/10` and `P(Y₂ = a | Y₁ = a, Y₀ = b) = 1/2`.
- `jointLaw`: conditional independence does not make the observations independent: in the
  frozen model `P(Y₀ = a, Y₁ = a) = 5/16` while `P(Y₀ = a) P(Y₁ = a) = 1/4`.
- `transKernel`: its row at `s` is the measure of `trans s`, so `transKernel s {s'} = trans s s'`;
  in `E`, `transKernel 0 {1} = 1/4`.
- `transKernel`: in the frozen model it is the identity kernel.
- `transKernel`: in `E` the state at time `1` has law `(1/2, 1/2)`, and
  `(transKernel ^ 2) 0 = (5/8, 3/8)`; the transposed convention would agree here, `trans`
  being symmetric, and differs in the dead-end model, where `transKernel 0 {1} = 1/2` and
  `transKernel 1 {0} = 0`.

*Needs:* 1.1; Mathlib `PMF.toMeasure`, `Kernel.ofFunOfCountable`, `IsMarkovKernel`,
`withDensity_apply`, `Kernel.comap`, `Kernel.compProd`, `Measure.compProd`, `Measure.pi`,
`measurePreserving_piFinSuccAbove`, `condDistrib_ae_eq_of_measure_eq_compProd`, the powers of a
kernel; Tau Ceti `Kernel.ofPMF` with its Markov instance, `markovChainLaw`,
`markovChainLaw_map_eval_zero`, `markovChainLaw_map_prefix_succ_eq_compProd`,
`MeasureTheory.Measure.eq_markovChainLaw`, `MeasureTheory.Measure.markovChainLaw_map_eval`.

### 1.3 Finite-dimensional densities

Assume the instances of 1.2 and `[SigmaFinite M.ref]`. Prove (`jointLaw_prefix_apply`) that for
every `n`, every state path `x` and every measurable `B ⊆ Fin (n + 1) → Y`, the probability
under `jointLaw M` that the states up to time `n` are `x 0, …, x n` and the observation record
lies in `B` is

    ∫⁻ w in B, jointDensity M x (fun i ↦ w (Fin.clamp i n)) n ∂(Measure.pi fun _ ↦ M.ref).

Equivalently, the law of the two records has density `jointDensity` with respect to the product
of counting measure on state records and `Measure.pi fun _ ↦ M.ref`. Route: by
`jointLaw_map_prefix` the left side is the mass of the state record, which is
`init (x 0) * ∏ trans (x i) (x (i + 1))` by `markovChainLaw_map_prefix_apply_singleton` and
`Kernel.ofPMF_apply_singleton`, times `(Measure.pi fun i ↦ emitKernel M (x i)) B`; and a product
of measures with densities has the product density, by induction on `n` with
`measurePreserving_piFinSuccAbove` and `lintegral_withDensity_eq_lintegral_mul`. (van Handel
2008, the display before Definition 2.8, for general state spaces, strictly positive densities
and a reference probability measure; proved here.)

**Checks.**

- `n = 0`, `B = {w | w 0 ∈ C}`: the probability that the state at time `0` is `s` and the
  observation lies in `C` is `init s * ∫⁻ y in C, dens s y ∂ref`.
- In `E` with `B = {(a, a, b)}`: the probability of the state path `(0, 0, 0)` with these
  observations is `81/2048`, and summing over the eight state paths gives `15/128`.
- `B = univ`: the right side is `init (x 0) * ∏ t < n, trans (x t) (x (t + 1))`, the mass of the
  state path, because each `dens s` integrates to `1`; a reference measure in the place of the
  emission law at time `0` only would break this.
- The statement for `x` and for any `x'` that agrees with `x` at times `≤ n` is the same on
  both sides.

*Needs:* 1.1, 1.2; Mathlib `Measure.pi`, `Measure.pi_pi`, `measurePreserving_piFinSuccAbove`,
`withDensity_apply`, `lintegral_withDensity_eq_lintegral_mul`, `Measure.compProd_apply`;
Tau Ceti `markovChainLaw_map_prefix_apply_singleton`, `Kernel.ofPMF_apply_singleton`.

### Examples

The example model `E`, the frozen model (a mixture of two i.i.d. sequences, whose observations
are exchangeable and not Markov), the Gaussian emission model on two states, and a model with
`S = ℕ` and a birth-and-death transition law.

### Dependencies

Layer 1 uses Mathlib's `PMF`, kernels with their composition products and powers, densities
and Radon–Nikodym derivatives, `lintegral_count`, finite product measures, `Fin.clamp` and
`condDistrib`, and Tau Ceti's `Kernel.ofPMF` and `markovChainLaw` with its time-zero marginal,
prefix recursion, finite path masses, uniqueness and one-time marginals.

## Layer 2: filtering and prediction

### 2.1 The forward variable and the likelihood

Define the **forward variable** by recursion on time,

    forward M y 0 s = init s * dens s (y 0),
    forward M y (t+1) s' = (∑' s, forward M y t s * trans s s') * dens s' (y (t+1)),

and the **likelihood** `likelihood M y n = ∑' s, forward M y n s`. Prove that:

- `forward M y t s` is the sum of the joint density over the state paths that are at `s` at
  time `t` (`forward_eq_tsum`), the sum being over the records `x : Fin (t + 1) → S` with
  `x (Fin.last t) = s`; hence `likelihood M y n` is the sum of the joint density over all state
  records of length `n + 1`;
- `forward M y 0 s ≤ dens s (y 0)` and
  `forward M y (t + 1) s' ≤ likelihood M y t * dens s' (y (t + 1))`, so the forward variable is
  finite wherever the preceding likelihood is; `likelihood M y n` is finite when `S` is finite
  or the densities at each `y t` are bounded in `s`, and can be `⊤` otherwise;
- on a finite state space the likelihood is a matrix product (`likelihood_eq_matrix`): with
  `A = Matrix.of fun s s' ↦ trans s s'` and `D v = Matrix.diagonal fun s ↦ dens s v`,

      likelihood M y n = (fun s ↦ init s * dens s (y 0)) ᵥ* (A * D (y 1)) * ⋯ * (A * D (y n)) ⬝ᵥ 1,

  the product being the ordered product of the list `List.ofFn fun t : Fin n ↦ A * D (y (t + 1))`,
  and `forward M y t` is the row vector obtained from the first `t` factors;
- with the instances of 1.3, the observation record up to time `n` has density
  `w ↦ likelihood M (fun i ↦ w (Fin.clamp i n)) n` with respect to `Measure.pi fun _ ↦ M.ref`
  (`jointLaw_map_obs`), and for measurable `B` the probability that the state at time `n` is `s`
  and the record lies in `B` is the integral of `forward` over `B`; in particular the
  likelihood is finite for almost every record.

(Rabiner 1989, equations (18)–(21), with time starting at `1`; van Handel 2008, Definition 2.8
and Theorem 2.9 for the recursion of the unnormalized filter on a general state space, and
Section 3.1 for the matrix form. Proved here.)

**Checks.**

- `forward`: in `E` with `y = (a, a, b)` the forward variables at times `0, 1, 2` are
  `(3/8, 1/8)`, `(15/64, 3/64)`, `(3/64, 9/128)`. Weighting by the density before the transition
  (the factor `dens s (y (t + 1))` of the old state inside the sum) gives `7/32` in place of
  `15/64` at state `0` and time `1`.
- `forward`: for a model with `trans s = init` for all `s` (i.i.d. states),
  `forward M y t s = init s * dens s (y t) * ∏ u < t, ∑' r, init r * dens r (y u)`.
- `forward`: summing `forward E y 1 s` over `y 1 ∈ {a, b}` gives `(5/16, 3/16)`, which is
  `forward E y 0` moved by `trans`; the wrong model `dens = 2` fails this.
- `likelihood`: in `E` the likelihoods at horizons `0, 1, 2` are `1/2`, `9/32`, `15/128`, and
  `15/128` is the sum over the eight paths of 1.1.
- `likelihood`: for a one-state model, `likelihood M y n = ∏ t ≤ n, dens s (y t)`, the density
  of independent observations.
- `likelihood` can be `⊤`: `S = ℕ`, `ref` Lebesgue measure on `[0, 1]`, `init s = 2^(−(s+1))`
  and `dens s = c s` on `[0, 1/c s]` and `0` elsewhere, with `c s = 2^(s+1) − 1`. At `y 0 = 0`
  the terms `init s * dens s 0 = 1 − 2^(−(s+1))` are not summable, so `likelihood M y 0 = ⊤`;
  this happens on a null set of observations, in agreement with `jointLaw_map_obs`.
- The matrix form at `n = 0` is `∑ s, init s * dens s (y 0)`, the empty product being the
  identity matrix, and at `n = 1` it is `∑ s s', init s * dens s (y 0) * trans s s' * dens s' (y 1)`,
  which is `9/32` in `E`; the factor `D (y (t + 1)) * A` in place of `A * D (y (t + 1))` gives
  `7/32 + 3/32 = 5/16`.

*Needs:* 1.1; Mathlib `ENNReal.tsum_comm`, `ENNReal.tsum_mul_left`, `ENNReal.tsum_prod`,
`Matrix.vecMul`, `Matrix.diagonal`, `dotProduct`; for `jointLaw_map_obs` and the integral of
`forward`, 1.3 and `withDensity_apply`.

### 2.2 The filter recursion

Define the **filter** `filter M y t s = forward M y t s / likelihood M y t` and the
**normalizers**

    normalizer M y 0 = likelihood M y 0,
    normalizer M y (t+1) = ∑' s', (∑' s, filter M y t s * trans s s') * dens s' (y (t+1)).

Prove that:

- if `likelihood M y t` is neither `0` nor `⊤`, then `filter M y t` sums to `1`; if it is `0`
  or `⊤`, then `filter M y t = 0`;
- if `likelihood M y t ≠ ⊤`, the filter satisfies the normalized recursion (`filter_succ`)

      filter M y (t+1) s' = (∑' s, filter M y t s * trans s s') * dens s' (y (t+1)) / normalizer M y (t+1),

  and `normalizer M y (t + 1) * likelihood M y t = likelihood M y (t + 1)`;
- if `likelihood M y t ≠ ⊤` for all `t < n`, the likelihood is the product of the normalizers
  (`likelihood_eq_prod_normalizer`): `likelihood M y n = ∏ t ≤ n, normalizer M y t`. Both
  statements hold when a likelihood vanishes: the filter is then `0` from that time on, and so
  are the normalizer and the subsequent likelihoods.

(Rabiner 1989, equations (91)–(103), where the scaling coefficient is the inverse of the
normalizer; van Handel 2008, Corollary 2.10 and Algorithm 3.1. Proved here.)

**Checks.**

- `filter`: in `E` along `(a, a, b)` the filters are `(3/4, 1/4)`, `(5/6, 1/6)`, `(2/5, 3/5)`.
- `filter`: with `dens` not depending on the state (uninformative observations), the filter at
  time `t` is the law of the state at time `t`, `init` moved `t` steps by `trans`.
- `filter`: a model with `init = pure 0` and `dens 0 = indicator {a}`, observed at `y 0 = b`,
  has `likelihood M y 0 = 0` and `filter M y 0 = 0`, not a probability vector.
- `normalizer`: in `E` the normalizers are `1/2`, `9/16`, `5/12`, with product `15/128`;
  `normalizer E y 1 = 9/16` is the conditional probability of `y 1 = a` given `y 0 = a`.
- `normalizer`: for a one-state model, `normalizer M y t = dens s (y t)`.
- `normalizer`: defining it with `forward` in place of `filter` gives `9/32` at time `1` in `E`,
  and the product `1/2 · 9/32 · 15/128` is not the likelihood.
- The hypothesis of `filter_succ`: in the model of 2.1 with `likelihood M y 0 = ⊤` take
  `trans s = pure s` and `y 1 = 1/2`. Then `forward M y 1 = (1/2, 0, 0, …)`, so
  `filter M y 1 0 = 1`, while `filter M y 0 = 0` makes the right side `0 / 0 = 0`. With
  `trans s = pure 0` and `y 1 = 1/2`, `likelihood M y 1 = ⊤` and the product of the normalizers
  is `⊤ * 0 = 0`.

*Needs:* 2.1; Mathlib `ENNReal.tsum_mul_left`.

### 2.3 The filter and prediction as conditional laws

Assume the instances of 1.2 and `[Nonempty S]`, and write `P = jointLaw M`, `X t ω = (ω t).1`,
`obs ω = fun i ↦ (ω i).2` and `Y≤t ω = fun i : Fin (t + 1) ↦ (ω i).2`. Prove that:

- the filter is the conditional law of the state at time `t` given the observations up to time
  `t` (`condDistrib_state_eq_filter`): for every `s`,
  `∀ᵐ ω ∂P, condDistrib (X t) Y≤t P (Y≤t ω) {s} = filter M (obs ω) t s`;
- prediction (`condDistrib_state_eq_predict`): for every `k` and `s'`,
  `∀ᵐ ω ∂P, condDistrib (X (t + k)) Y≤t P (Y≤t ω) {s'} = ∑' s, filter M (obs ω) t s * (transKernel M ^ k) s {s'}`;
  for `k = 1` the right side is `∑' s, filter M (obs ω) t s * trans s s'`, the vector that
  `filter_succ` weights by the next density;
- the normalizer is a conditional density: for measurable `C ⊆ Y`, the conditional probability
  that the observation at time `t + 1` lies in `C` given the observations up to time `t` is
  `∫⁻ v in C, ∑' s', (∑' s, filter M (obs ω) t s * trans s s') * dens s' v ∂ref` almost surely;
- at time `0` the filter is Mathlib's posterior kernel of the emission kernel with prior
  `init`: for `(emitKernel M ∘ₘ init)`-almost every `v`,
  `((emitKernel M)†(M.init.toMeasure)) v {s} = filter M (fun _ ↦ v) 0 s`.

The reference measure need not be σ-finite in these statements. Route: the set `A` of the `v` with
`dens s v ≠ 0` for some `s` is measurable and σ-finite for `M.ref`, because `S` is countable and
each `dens s` has integral `1`; replacing `M.ref` by its restriction to `A` changes neither
`emitKernel M`, hence nor `P`, nor any density, so one may assume `[SigmaFinite M.ref]`. Then by
2.1 the joint law of the observation record and the state at time `t` is the law of the record
composed with the kernel `w ↦ filter`, on the set of full measure where the likelihood is positive
and finite; `condDistrib_ae_eq_of_measure_eq_compProd` gives the first statement. Prediction
follows from the conditional law of the state at time `n + 1` given the pairs up to time `n`
(1.2), by induction on `k`. (van Handel 2008, Theorem 2.9, Corollary 2.10 and Theorem 2.14, for
general state spaces and strictly positive densities; the Bayes formula is his Theorem 2.7. Proved
here.)

**Checks.**

- In `E`, given the observations `(a, a)`, the state at time `1` is `0` with conditional
  probability `5/6`; by enumeration, `(15/64) / (9/32) = 5/6`.
- In `E`, given `(a, a)`, the state at time `2` is `0` with conditional probability
  `5/6 · 3/4 + 1/6 · 1/4 = 2/3` (prediction with `k = 1`), and the next observation is `a` with
  conditional probability `2/3 · 3/4 + 1/3 · 1/4 = 7/12`.
- `k = 0` in the prediction statement is the filter statement, since
  `(transKernel M ^ 0) s {s'}` is `1` if `s = s'` and `0` otherwise.
- The statements are almost sure and cannot hold for every `ω`: in the model with
  `init = pure 0`, `dens 0 = indicator {a}`, `condDistrib` at the record `b` is some
  probability measure while the filter is `0`; the record `b` has probability `0`.
- A reference measure that is not σ-finite: one state, `Y = ℝ`, `ref = Measure.count` and
  `dens 0 = indicator {0}`. Almost surely every observation is `0`, the filter is `1`, and the
  conditional law of the state is the point mass; the set `A` of the route is `{0}`.
- With uninformative observations the conditional law is the unconditional law of the state,
  so conditioning on the observations up to time `t − 1` in place of time `t` would give the
  same answer there and a different one in `E` (`3/4 · 3/4 + 1/4 · 1/4 = 5/8` against `5/6`).

*Needs:* 1.2, 1.3, 2.1, 2.2; Mathlib `condDistrib`, `condDistrib_ae_eq_of_measure_eq_compProd`,
`Measure.compProd_apply`, the powers of a kernel; Tau Ceti `Kernel.ofPMF_apply_singleton`; for
the posterior kernel, `ProbabilityTheory.posterior` and `posterior_eq_withDensity_of_countable`.

### Examples

The example model `E` along `(a, a, b)`; a two-state model with Gaussian emissions `N(±1, 1)`,
where the filter recursion is a logistic update; and the frozen model, where the filter is the
posterior of a two-point prior given i.i.d. observations.

### Dependencies

Layer 2 uses Layer 1, Mathlib's sums in `ℝ≥0∞`, matrices, densities, composition products,
powers of kernels, `condDistrib` and the posterior kernel, and Tau Ceti's
`Kernel.ofPMF_apply_singleton`.

## Layer 3: smoothing

### 3.1 The backward variable

Define the **backward variable** by recursion on the number `k` of future observations,

    backward M y t 0 s = 1,
    backward M y t (k+1) s = ∑' s', trans s s' * dens s' (y (t+1)) * backward M y (t+1) k s'.

For a horizon `n ≥ t`, the backward variable of the literature at time `t` is
`backward M y t (n − t)`. Prove that:

- `backward M y t k s` is the sum over the state records `x (t + 1), …, x (t + k)` of
  `∏ t ≤ u < t + k, trans (x u) (x (u + 1)) * dens (x (u + 1)) (y (u + 1))` with `x t = s`;
- the **forward–backward identity** (`tsum_forward_mul_backward`): for all `t` and `k`,
  `∑' s, forward M y t s * backward M y t k s = likelihood M y (t + k)`;
- with the instances of 1.3, `backward M y t k s` is the conditional density of the
  observations at times `t + 1, …, t + k` given that the state at time `t` is `s`.

(Rabiner 1989, equations (23)–(25); van Handel 2008, Definition 2.11 and Theorem 2.12, on a
general state space. Proved here.)

**Checks.**

- In `E` along `(a, a, b)`: `backward E y 1 1 = (3/8, 5/8)` and `backward E y 0 2 = (1/4, 3/16)`.
- The identity in `E` at `t = 0`, `k = 2`: `3/8 · 1/4 + 1/8 · 3/16 = 15/128`; at `t = 1`,
  `k = 1`: `15/64 · 3/8 + 3/64 · 5/8 = 15/128`; at `k = 0` it is the definition of the
  likelihood.
- `backward M y t 1 s = ∑' s', trans s s' * dens s' (y (t + 1))`: the density of the next
  observation is evaluated at the new state. Evaluating it at the old state gives
  `dens s (y (t + 1))`, which in `E` is `1/4` in place of `3/8` at `s = 0`, `y 2 = b`.
- Summing `backward E y t 1 s` over `y (t + 1) ∈ {a, b}` gives `1` for each `s`.
- Indexing by the number of future observations has no junk value: `backward M y t (n − t)` at
  `t > n` is `1`, and no statement uses it there.

*Needs:* 2.1; Mathlib `ENNReal.tsum_comm`, `ENNReal.tsum_mul_left`; for the conditional density,
1.3.

### 3.2 Smoothing laws

For a horizon `n` define the **marginal smoothing law** and the **pairwise smoothing law**

    smooth M y n t s = forward M y t s * backward M y t (n − t) s / likelihood M y n,
    smoothPair M y n t s s' = forward M y t s * trans s s' * dens s' (y (t+1)) * backward M y (t+1) (n − (t+1)) s' / likelihood M y n,

used for `t ≤ n` and for `t < n` respectively. Prove that:

- if `likelihood M y n` is neither `0` nor `⊤`, then for `t ≤ n` the values `smooth M y n t s`
  sum to `1`, `smooth M y n n = filter M y n`, and for `t < n`
  `∑' s', smoothPair M y n t s s' = smooth M y n t s` and
  `∑' s, smoothPair M y n t s s' = smooth M y n (t + 1) s'`; if the likelihood is `0` or `⊤`
  all these quantities are `0`;
- with the instances of 1.2 and `[Nonempty S]`, the conditional law of the whole state path
  given the observations up to time `n` (`condDistrib_states_cylinder`): for every `x`, almost
  surely the conditional probability that the hidden path agrees with `x` up to time `n` is
  `jointDensity M x (obs ω) n / likelihood M (obs ω) n`;
- `smooth` is the conditional law of the state at time `t ≤ n` given the observations up to
  time `n` (`condDistrib_state_eq_smooth`), and `smoothPair` is the conditional law of the
  states at times `t` and `t + 1`, `t < n` (`condDistrib_pair_eq_smoothPair`);
- given the observations up to time `n`, the hidden states up to time `n` form an inhomogeneous
  Markov chain: for `t < n` the conditional probability that the state at time `t + 1` is `s'`
  given the observations and the states up to time `t`, the last being `s`, is
  `trans s s' * dens s' (y (t + 1)) * backward M y (t + 1) (n − (t + 1)) s' / backward M y t (n − t) s`.

Route: after the reduction of 2.3 to a σ-finite reference measure,
`condDistrib_states_cylinder` from `jointLaw_prefix_apply` and `jointLaw_map_obs` by
`condDistrib_ae_eq_of_measure_eq_compProd`; the two marginal statements by summing the joint
density over the remaining coordinates, which is 2.1 for the past and 3.1 for the future.
(Rabiner 1989, equations (26)–(27) and (36)–(38); van Handel 2008, Theorems 2.12 and 3.2, and
Section 5.2 for the transition kernels of the conditional chain. Proved here.)

**Checks.**

- `smooth`: in `E` along `(a, a, b)` with `n = 2` the smoothing laws at times `0, 1, 2` are
  `(4/5, 1/5)`, `(3/4, 1/4)`, `(2/5, 3/5)`; the last is the filter, and the first differs from
  the filter `(3/4, 1/4)` at time `0`.
- `smooth`: `smooth E y 2 0 0 = (3/8 · 1/4) / (15/128) = 4/5`; dividing by `likelihood E y 0`
  in place of `likelihood E y 2` gives `3/16`, and the values no longer sum to `1`.
- `smooth`: in the frozen model `smooth M y n t` does not depend on `t ≤ n`.
- `smoothPair`: in `E`, `smoothPair E y 2 0` has rows `(27/40, 1/8)` and `(3/40, 1/8)`, with
  row sums `(4/5, 1/5)` and column sums `(3/4, 1/4)`.
- `smoothPair`: in the frozen model it vanishes off the diagonal.
- `smoothPair` is not the product of the two marginal laws: `27/40 ≠ 4/5 · 3/4`.
- The path law in `E`: the path `(0, 0, 0)` has conditional probability
  `(81/2048) / (15/128) = 27/80`, as has `(0, 0, 1)`.
- `t ≤ n` is needed for `smooth`: `smooth E y 0 1 = forward E y 1 / likelihood E y 0 = (15/32, 3/32)`
  is not a probability vector.
- `t < n` is needed for `smoothPair`: at `t = n` its value contains `dens s' (y (n + 1))`, an
  observation outside the horizon; in `E`, `smoothPair E y 1 1 0 0` is `15/32` for `y 2 = a` and
  `5/32` for `y 2 = b`.

*Needs:* 2.1, 2.2, 3.1; for the conditional laws 1.3, `jointLaw_map_obs` of 2.1, the reduction
of 2.3 to a σ-finite reference measure and Mathlib `condDistrib`,
`condDistrib_ae_eq_of_measure_eq_compProd`.

### Examples

The example model `E` along `(a, a, b)`; the frozen model, where smoothing at every time is the
posterior of the frozen state; and a left-to-right model on three states, in which the
smoothing law at an early time is concentrated by a late observation.

### Dependencies

Layer 3 uses Layers 1 and 2 and Mathlib's sums in `ℝ≥0∞` and `condDistrib`.

## Layer 4: decoding

### 4.1 The Viterbi variable

Define the **Viterbi variable** in max-product form,

    viterbi M y 0 s = init s * dens s (y 0),
    viterbi M y (t+1) s' = (⨆ s, viterbi M y t s * trans s s') * dens s' (y (t+1)),

and in max-sum form, with values in `EReal`,

    viterbiLog M y 0 s = log (init s) + log (dens s (y 0)),
    viterbiLog M y (t+1) s' = (⨆ s, viterbiLog M y t s + log (trans s s')) + log (dens s' (y (t+1))),

where `log` is `ENNReal.log`. Prove that:

- `viterbi M y t s` is the supremum of `jointDensity M x y t` over the state paths `x` with
  `x t = s` (`viterbi_eq_iSup`); it is `≤ forward M y t s`, with equality for every `t` and `s`
  when at most one path ending in `s` has positive joint density;
- the max-sum recursion computes the logarithm of the max-product one (`viterbiLog_eq`):
  `viterbiLog M y t s = ENNReal.log (viterbi M y t s)`, by `ENNReal.log_mul_add` and because
  the order isomorphism `ENNReal.logOrderIso` commutes with suprema (`OrderIso.map_iSup`);
- on a finite state space the suprema are maxima and `viterbi M y t s` is finite.

(Rabiner 1989, equations (30)–(33a) and (105a)–(105c); van Handel 2008, Theorem 3.6, which is
the max-sum form. Proved here.)

**Checks.**

- `viterbi`: in `E` along `(a, a, b)` the Viterbi variables are `(3/8, 1/8)`,
  `(27/128, 3/128)`, `(81/2048, 81/2048)`; the forward variable at time `1` is `(15/64, 3/64)`,
  larger in both coordinates.
- `viterbi`: for a deterministic model (`init` and all `trans s` point masses) the Viterbi and
  forward variables agree.
- `viterbi`: a sum in place of the supremum is the forward variable; a supremum taken after
  multiplying by `dens s (y (t + 1))` with the old state gives `9/128` in place of `3/128` at
  state `1` and time `1` in `E`.
- `viterbiLog`: a state with `init s = 0` has `viterbiLog M y 0 s = ⊥`, where
  `Real.log 0 = 0` would make it the largest value among probabilities below `1`.
- `viterbiLog`: in `U` along `(a, a)`, `viterbiLog U y 1 s = 4 log (1/2)`.
- `viterbiLog`: on `S = ℕ` the supremum can be `⊤` while every term is finite: with `ref` Lebesgue
  measure on `[0, 1]`, `init s = 2^(−(s+1))`, `dens s = 4^s` on `[0, 4^(−s)]` and `trans s = pure 0`,
  the terms `viterbi M y 0 s * trans s 0 = 2^(s−1)` at `y 0 = 0` are unbounded; `ENNReal.log ⊤ = ⊤`
  keeps `viterbiLog_eq` true there.

*Needs:* 1.1; Mathlib `ENNReal.mul_iSup`, `ENNReal.iSup_mul`, `ENNReal.log`,
`ENNReal.log_mul_add`, `ENNReal.logOrderIso`, `OrderIso.map_iSup`; for the comparison with
`forward`, 2.1.

### 4.2 Viterbi paths

Say that `x` is a **Viterbi path** up to time `n` (`IsViterbiPath M y n x`) if `x n` maximizes
`viterbi M y n`, and for each `t < n` the state `x t` maximizes
`s ↦ viterbi M y t s * trans s (x (t + 1))`. This is the backtracking rule: the last state is
chosen first and each earlier state from its successor; ties may be broken in any way. Prove
that:

- a Viterbi path maximizes the joint density over all state paths
  (`IsViterbiPath.isGreatest`): `jointDensity M x y n` is the greatest element of the set of
  values `jointDensity M x' y n`, and it equals `⨆ s, viterbi M y n s`; no positivity is
  assumed, so this includes observation sequences of likelihood `0`, where every path has joint
  density `0`;
- on a finite state space a Viterbi path exists (`exists_isViterbiPath`), by choosing the
  maximizers backwards from time `n`;
- a maximizer of the joint density with positive value is a Viterbi path
  (`isViterbiPath_of_isGreatest`); so when the largest joint density is positive, the Viterbi
  paths are exactly the maximizers;
- with the instances of 1.2 and `[Nonempty S]`, almost surely a Viterbi path for the observed
  sequence maximizes, among state paths, the conditional probability of 3.2 that the hidden
  path agrees with it up to time `n`.

(Rabiner 1989, equations (33b)–(35); van Handel 2008, Theorem 3.6 and Algorithm 3.4. Proved
here.)

**Checks.**

- In `E` along `(a, a, b)` the Viterbi paths are `(0, 0, 0)` and `(0, 0, 1)`, both of joint
  density `81/2048`, the largest of the eight values; the next is `27/2048`. Both choices of
  the last state are allowed by the tie.
- In `U` along `(a, a)` all four paths are Viterbi paths, with joint density `1/16`.
- Likelihood `0`: in the dead-end model `D` observed along `(a, b)` every path has joint
  density `0`; the Viterbi paths are `(0, 0)` and `(0, 1)`, while `(1, 0)` is a maximizer that
  is not a Viterbi path (`viterbi D y 0 = (1, 0)` and `1 · 1/2 > 0 · 0`). So the positivity
  hypothesis of `isViterbiPath_of_isGreatest` cannot be dropped.
- Backtracking is not the choice of the maximizer of `viterbi M y t` at each time, and the
  Viterbi path is not the sequence of individually most likely states: on three states with
  `init = (2/5, 3/5, 0)`, `trans 0 = pure 0`, `trans 1 = (0, 1/2, 1/2)`, `trans 2 = pure 2`, one
  symbol and `n = 1`, the Viterbi variables are `(2/5, 3/5, 0)` and `(2/5, 3/10, 3/10)`, which
  are also the smoothing laws; the only Viterbi path is `(0, 0)`, of joint density `2/5`, while
  the states maximizing each time separately form `(1, 0)`, of joint density `0`.
- No Viterbi path on an infinite state space: in the model of 2.1 at `y 0 = 0` and `n = 0`, the
  values `1 − 2^(−(s+1))` have supremum `1`, which is not attained.

*Needs:* 1.1, 4.1; for the statement about conditional probabilities, 3.2.

### Examples

The example model `E`; the uniform model, where every path is optimal; the dead-end model; and
a noisy binary channel with a two-state source, decoded along a short word.

### Dependencies

Layer 4 uses 1.1 and Mathlib's suprema in `ℝ≥0∞` and `ENNReal.log` with its order isomorphism;
the comparison with the forward variable uses 2.1
and the statement on conditional probabilities uses 3.2.

## Layer 5: Baum–Welch estimation

Throughout this layer `S` is a finite type.

### 5.1 The auxiliary function

For two models `M`, `M'` on the same `S` and `Y`, define **Baum's auxiliary function**

    auxiliary M M' y n = ∑ x, (jointDensity M x y n).toReal * Real.log (jointDensity M' x y n).toReal,

the sum over the state records `x : Fin (n + 1) → S`. Say that `M'` **keeps the paths of** `M`
if `jointDensity M x y n ≠ 0` implies `jointDensity M' x y n ≠ 0` for every state path `x`.
Prove **Baum's inequality** (`auxiliary_sub_le`): if `M'` keeps the paths of `M`, then

    auxiliary M M' y n − auxiliary M M y n ≤ (likelihood M y n).toReal * (log (likelihood M' y n).toReal − log (likelihood M y n).toReal),

with `log = Real.log`. Consequently, if `M'` keeps the paths of `M` and
`auxiliary M M y n ≤ auxiliary M M' y n`, then `likelihood M y n ≤ likelihood M' y n`. The
models need not have finite alphabets, and their densities need not be related. Route: divide
by `likelihood M y n` when it is positive; the right side is then the logarithm of the mean of
the ratios `jointDensity M' x y n / jointDensity M x y n` under the weights
`jointDensity M x y n / likelihood M y n` on the paths of positive weight, and the left side is
the mean of their logarithms; apply `ConcaveOn.le_map_sum` to `Real.log`. (The inequality goes
back to Baum, Petrie, Soules and Weiss. Rabiner 1989, equations (41)–(42), states its
consequence, and van Handel 2008, Lemma 6.10, proves it for mutually absolutely continuous
laws. Proved here.)

**Checks.**

- In `E` along `(a, a, b)`: `auxiliary E E y 2 = −0.436470`, and for the model `E'` with `init = (4/5, 1/5)`,
  `trans 0 = (21/31, 10/31)`, `trans 1 = (2/9, 7/9)` and emission laws `(31/39, 8/39)` and
  `(3/7, 4/7)`, `auxiliary E E' y 2 = −0.400776`.
- `auxiliary M M y n` is `∑ p log p` over the path values `p`; for a model with a single path
  of positive joint density `p` it is `p log p`, and it is `0` when the likelihood is `0`.
- Without the hypothesis the inequality fails: in `U` along `(a, b)` with `n = 1`, let `M'`
  have `init = pure 0`, `trans s = pure 0`, and emission laws `pure b` in state `0` and
  `pure a` in state `1`. Every path has joint density `0` under `M'`, so
  `auxiliary U M' y 1 = 0` because `Real.log 0 = 0`, while `auxiliary U U y 1 = −log 2 = −0.693147`;
  the left side `log 2` exceeds the right side `(1/4) (Real.log 0 − log (1/4)) = (log 2)/2`, and
  `likelihood M' y 1 = 0 < 1/4 = likelihood U y 1`.
- The factor `likelihood M y n` on the right is needed: with one state and one symbol, let `M`
  have `dens = 2` and `ref` half the counting measure, and `M'` have `dens = 4` and a quarter of
  the counting measure. The single path has joint densities `2^(n+1)` and `4^(n+1)`, and both
  sides are `2^(n+1) (n + 1) log 2`; without the factor the right side would be
  `(n + 1) log 2`, smaller than the left side.
- The weights are joint densities and not conditional probabilities: dividing each weight by
  the likelihood gives the function of Rabiner's equation (41), which differs from
  `auxiliary` by the factor `likelihood M y n`.

*Needs:* 1.1, 2.1 (`forward_eq_tsum`, for the likelihood as the sum over state records); Mathlib
`ConcaveOn.le_map_sum`, `strictConcaveOn_log_Ioi`.

### 5.2 Expected counts and the update

Assume in addition `[Fintype Y] [DecidableEq Y]`, and `[DiscreteMeasurableSpace Y]` for the
M-step, which mentions `ofPMF`. Define the **expected transition counts** and
the **expected emission counts**

    transCount M y n s s' = ∑ t < n, smoothPair M y n t s s',
    emitCount M y n s v = ∑ t ≤ n with y t = v, smooth M y n t s.

Say that `M'` is a **Baum–Welch update** of `M` for the observations `y` up to time `n`
(`IsBaumWelchStep M M' y n`) if, for all `s`, `s'` and `v`,

    M'.init s * ∑ s₀, smooth M y n 0 s₀ = smooth M y n 0 s,
    M'.trans s s' * ∑ s'', transCount M y n s s'' = transCount M y n s s',
    M'.dens s v * ∑ v', emitCount M y n s v' = emitCount M y n s v.

Each row of `M'` is thus the corresponding row of expected counts divided by its total,
wherever the total is not `0`; a row whose total is `0` is not constrained. No division occurs
in the definition. Prove that:

- with the instances of 1.2 and `[Nonempty S]`, `transCount M (obs ω) n s s'` is almost surely
  the conditional expectation, given the observations up to time `n`, of the number of
  `t < n` with states `s` at time `t` and `s'` at time `t + 1`, and `emitCount M (obs ω) n s v`
  that of the number of `t ≤ n` with state `s` and observation `v`;
- `∑ s', transCount M y n s s' = ∑ t < n, smooth M y n t s` and
  `∑ v, emitCount M y n s v = ∑ t ≤ n, smooth M y n t s`; if the likelihood is positive,
  `∑ s₀, smooth M y n 0 s₀ = 1`, and if it is `0` all counts are `0`;
- for every `M`, `y` and `n` and every `emit₀ : S → PMF Y` there is an update of the form
  `ofPMF init' trans' emit'`, which keeps the rows of `M.init`, `M.trans` and `emit₀` where the
  totals are `0`; if all row totals are positive, the rows of every update are determined;
- the M-step (`auxiliary_le_of_isBaumWelchStep`): a Baum–Welch update `M'` of `M` keeps the
  paths of `M`, and `auxiliary M M'' y n ≤ auxiliary M M' y n` for every model
  `M'' = ofPMF init trans emit` that keeps the paths of `M`. Here `M` is any model on the
  finite alphabet `Y`, and `M''` ranges over the models with emission mass functions.

Route for the M-step: on the paths of positive weight the logarithm of the joint density of
`M''` is a sum of logarithms of its initial, transition and emission probabilities, so
`auxiliary M M'' y n` is `likelihood M y n` times
`∑ s, c₀ s log (init s) + ∑ s s', c s s' log (trans s s') + ∑ s v, e s v log (emit s v)` with
the expected counts `c₀ = smooth M y n 0`, `c = transCount` and `e = emitCount` of `M`; each row
is maximized by the normalized counts, by Gibbs' inequality, which is `ConcaveOn.le_map_sum` for
`Real.log`. (Rabiner 1989, equations (36)–(40c), for the counts and the update; van Handel
2008, Section 3.2 for the counts, and Proposition 6.11, where the same maximization is carried
out for the initial law and the transition matrix of a finite-state model with Gaussian
observations and strictly positive parameters. Proved here.)

**Checks.**

- `transCount`: in `E` along `(a, a, b)` the matrix of counts is `(21/20, 1/2; 1/10, 7/20)`,
  with row sums `31/20 = 4/5 + 3/4` and `9/20`, and total `2 = n`.
- `transCount`: `n = 0` gives the empty sum `0`; every transition row is then unconstrained.
- `transCount`: in the frozen model it is diagonal.
- `emitCount`: in `E` the counts are `(31/20, 2/5)` in state `0` and `(9/20, 3/5)` in state
  `1`; the column sums `(2, 1)` are the numbers of `a` and of `b` in `(a, a, b)`.
- `emitCount`: the sum over `v` uses all `t ≤ n`, the transition counts only `t < n`; the row
  total of state `0` is `39/20` for emissions and `31/20` for transitions.
- `emitCount`: a symbol that does not occur in `y 0, …, y n` has count `0` in every state.
- `IsBaumWelchStep`: the update of `E` along `(a, a, b)` is unique, with `init' = (4/5, 1/5)`,
  `trans' 0 = (21/31, 10/31)`, `trans' 1 = (2/9, 7/9)`, emission laws `(31/39, 8/39)` and
  `(3/7, 4/7)`.
- `IsBaumWelchStep`: `U` along `(a, a)` is not an update of itself, since the update has
  emission laws `(1, 0)`; a one-state, one-symbol model is an update of itself.
- `IsBaumWelchStep`: if `likelihood M y n = 0`, every model is an update of `M`.
- `IsBaumWelchStep`: the model with `init = pure 0` and `trans s = pure 0` on two states has
  transition count `0` out of state `1`, so `trans' 1` is arbitrary; a definition with a
  quotient in `ℝ≥0∞` would force `trans' 1 s' = 0 / 0 = 0` for all `s'`, which no `PMF`
  satisfies.
- The M-step needs the restriction to models that keep the paths: the model `M'` of the third
  Check of 5.1 has `auxiliary U M' y 1 = 0`, above the value of the update.

*Needs:* 1.1, 3.2, 5.1; Mathlib `ConcaveOn.le_map_sum`, `strictConcaveOn_log_Ioi`,
`lintegral_count` (through `ofPMF`); for the conditional expectations,
`condDistrib_state_eq_smooth` and `condDistrib_pair_eq_smoothPair` of 3.2.

### 5.3 Monotonicity

Assume `[Fintype Y] [DecidableEq Y] [DiscreteMeasurableSpace Y]`, and let
`M = ofPMF init trans emit`. Prove (`likelihood_le_of_isBaumWelchStep`) that for every
Baum–Welch update `M'` of `M` for `y` up to time `n`:

- `likelihood M y n ≤ likelihood M' y n`;
- if `likelihood M y n = likelihood M' y n`, then `M` is a Baum–Welch update of itself: its
  rows with positive totals are already the normalized expected counts.

Zero probabilities in `M` are allowed, and `M'` may be any model that satisfies the update
equations, whatever its rows of total `0`. If all row totals of `M` are positive, the converse
holds as well: every update of a model that is an update of itself has the same `init`, `trans`
and `dens`, so the likelihood does not change. Route: `M` keeps its own paths, so
`auxiliary M M y n ≤ auxiliary M M' y n` by the M-step of 5.2 applied to `M'' = M`, and 5.1 gives
the inequality. If the likelihoods are equal and positive, 5.1 forces
`auxiliary M M y n = auxiliary M M' y n`, so `M` attains the maximum of the M-step, and the
maximizer of each row with positive total is unique by `StrictConcaveOn.map_sum_eq_iff`; if the
likelihood of `M` is `0`, every model is an update of `M`. (The theorem goes back to Baum, Petrie,
Soules and Weiss, and is the instance for hidden Markov models of the monotonicity of the EM
algorithm of Dempster, Laird and Rubin. Rabiner 1989 states it in the paragraph after equations
(40a)–(40c); van Handel 2008, Lemma 6.10, is the inequality. Proved here.)

**Checks.**

- In `E` along `(a, a, b)` the likelihood rises from `15/128 = 0.117188` to
  `501892/2906631 = 0.172671` under the update of 5.2.
- The hypothesis that `M` has emission mass functions: for one state, one symbol and
  `dens = 2`, a model that satisfies the fields of `HMM` for `ref` equal to half the counting
  measure, the update has `dens' = 1` and the likelihood falls from `2^(n+1)` to `1`.
- A one-state, one-symbol model `ofPMF` has likelihood `1` and is its own update: equality
  holds and the fixed-point conclusion is satisfied.
- Likelihood `0`: for `init = pure 0` on two states with emission laws `pure a` and `pure b`,
  observed at `y 0 = b` with `n = 0`, the likelihood is `0`, every model is an update, and both
  statements hold trivially; the update with `init' = pure 1` has likelihood `1`.
- In `U` along `(a, a)` the update has emission laws `pure a`; the likelihood rises from `1/4`
  to `1`, and `U` is not an update of itself.

*Needs:* 5.1, 5.2; Mathlib `StrictConcaveOn.map_sum_eq_iff`, `strictConcaveOn_log_Ioi`.

### Examples

The example model `E` along `(a, a, b)` with its unique update; a model with a zero transition
probability, which every update keeps equal to zero; and the frozen model along a constant
observation sequence.

### Dependencies

Layer 5 uses 1.1, 2.1 and Layer 3, and Mathlib's Jensen inequality with its equality case and
`lintegral_count`.

## Layer 6: forgetting of the initial law

### 6.1 Contraction under minorization

Prove (`tsum_abs_bind_sub_le`) that for probability mass functions `ν`, `ν'`, `ρ` on `S`, a
family `K : S → PMF S` and `ε : ℝ≥0∞` with `ε * ρ s' ≤ K s s'` for all `s`, `s'`,

    ∑' s', |(ν.bind K) s' − (ν'.bind K) s'| ≤ (1 − ε) * ∑' s, |ν s − ν' s|,

the differences and the factor `1 − ε` being taken after `ENNReal.toReal`. The hypothesis forces
`ε ≤ 1`. Route: for
`ε < 1` write `K s = ε ρ + (1 − ε) K' s` with `K' s` a probability mass function; the term `ε ρ`
cancels in the difference, and `ν ↦ ν.bind K'` does not increase the distance. (van Handel
2008, Lemma 5.2, for general state spaces, possibly random measures and `0 < ε < 1`; proved
here.)

**Checks.**

- `ε = 0` is the statement that `ν ↦ ν.bind K` does not increase the distance; it is an
  equality for `K s = pure s`, so no factor below `1` holds without the minorization.
- `ε = 1` forces `K s = ρ` for all `s`, and both sides are `0`.
- The constant is attained: on two states with `ρ = (1/2, 1/2)`, `K 0 = (1 − ε/2, ε/2)`,
  `K 1 = (ε/2, 1 − ε/2)`, `ν = pure 0`, `ν' = pure 1`, the left side is `2 (1 − ε)`.
- The constant `1 − 2ε` fails in the same example for `0 < ε < 1`.

*Needs:* Mathlib `PMF.bind`.

### 6.2 Stability of the filter

Let `M` and `M'` be two models with the same transition laws and the same densities
(`M'.trans = M.trans`, `M'.dens = M.dens`), so that they differ only in their initial laws.
Assume the **mixing condition**: there are a probability mass function `ρ` on `S` and
`ε : ℝ≥0∞`, `ε ≠ 0`, with

    ε * ρ s' ≤ trans s s' ≤ ε⁻¹ * ρ s'   for all s, s'.

Prove (`tsum_abs_filter_sub_le`) that for every observation sequence `y` and all `l ≤ k` such
that `likelihood M y l` and `likelihood M' y l` are neither `0` nor `⊤`,

    ∑' s, |filter M y k s − filter M' y k s| ≤ ε⁻² (1 − ε²)^(k − l) * ∑' s, |filter M y l s − filter M' y l s|,

the differences and `ε` being taken after `ENNReal.toReal`. The mixing condition forces `ε ≤ 1`.
The densities may vanish and need not be bounded. In particular, taking `l = 0`, the distance
between the two filters at time `k` is at most `2 ε⁻² (1 − ε²)^k` whenever both likelihoods at
time `0` are positive and finite. Route: for `l ≤ k` the filter at time `k` is obtained from the
filter at time `l` by first reweighting with `backward M y l (k − l)` and then applying the
`k − l` backward kernels of 3.2, which are stochastic when the likelihood at time `k` is positive
and finite. The mixing condition gives each of these kernels the minorization constant `ε²` with
respect to a probability mass function depending on time, so 6.1 applies `k − l` times; and
`ε C ≤ backward M y l (k − l) s ≤ ε⁻¹ C` for a constant `C` not depending on `s`, which costs the
factor `ε⁻²` in the reweighting. When `C` is `0` or `⊤`, both likelihoods at time `k` are `0` or
`⊤` and both filters are `0`. (van Handel 2008, Lemma 5.3 and Theorem 5.4, for general state
spaces, possibly random initial measures, strictly positive densities and `0 < ε < 1`; the
comparison of the two reweighted laws, which the proof of Theorem 5.4 takes from the proof of his
Theorem 4.5, is proved here with the constant `sup β / inf β`. Proved here.)

**Checks.**

- On two states with `trans 0 = (2/3, 1/3)`, `trans 1 = (1/3, 2/3)`, `ρ = (1/2, 1/2)` and
  `ε = 2/3`, the emission laws of `E`, initial laws `pure 0` and `pure 1` and constant
  observations `a`: the distances at times `0, 1, 2, 3` are `2`, `18/35`, `162/1457`,
  `1458/63539`, below the bounds `9/2`, `5/2`, `25/18`, `125/162` from `l = 0`.
- `ε = 1` forces `trans s = ρ`; then for `k > l` the filters agree, as the bound `0` says, and
  for `k = l` the bound is an equality.
- Positivity at time `l` is needed: with `trans s = (1/2, 1/2)`, `ε = 1`, emission laws
  `pure b` in state `0` and `pure a` in state `1`, initial laws `pure 0` and `pure 1` and
  constant observations `a`, the first model has likelihood `0` at every time and filter `0`,
  the second has filter `(0, 1)`; the distance is `1` at every time while the right side is `0`
  for `k > l`.
- `l ≤ k` is needed: with `ε = 1` the filters agree at time `1` and may differ at time `0`,
  and `k − l` is `0` in `ℕ` for `k < l`.
- `ε ≠ 0` is needed: for `ε = 0` the mixing condition holds for every model on a countable `S`
  when `ρ` has full support (`0⁻¹ * ρ s' = ⊤`), and the real number `ε⁻²` is `0` in Lean, so
  the right side would be `0`.
- The upper bound of the mixing condition is needed: on two states with `ρ = pure 0`,
  `ε = 9/10`, `trans 0 = (9/10, 1/10)`, `trans 1 = pure 0`, emission laws `(99/100, 1/100)` in
  state `0` and `pure b` in state `1`, initial laws `pure 0` and `pure 1` and observations
  `(b, b)`, the lower bound holds and `trans 0 1 = 1/10 > ε⁻¹ * ρ 1 = 0`. The filters at time
  `0` are `pure 0` and `pure 1`, at time `1` they are `(9/109, 100/109)` and `pure 0`, at
  distance `200/109`, above `ε⁻² (1 − ε²) · 2 = 38/81`.
- The lower bound is needed: in the frozen model with uninformative observations (`dens` not
  depending on the state), `ρ = (1/2, 1/2)` and `ε = 1/2`, the upper bound `trans s s' ≤ 1`
  holds, and the filters started from `pure 0` and `pure 1` stay at distance `2`, while the
  right side `8 (3/4)^k` tends to `0`.
- The two models must share `trans`: with uninformative observations, `init = (1/2, 1/2)` in
  both, `M.trans s = (1/2, 1/2)`, `ε = 1`, and `M'.trans s = pure 0`, the filters agree at time
  `0` and are `(1/2, 1/2)` and `pure 0` at time `1`, at distance `1`, while the right side is `0`.
- The two models must share `dens`: with `init = (1/2, 1/2)` and `trans s = (1/2, 1/2)` in both,
  `ε = 1`, uninformative observations in `M` and the emission laws of `E` in `M'`, along
  `(a, a)` the filters at time `1` are `(1/2, 1/2)` and `(3/4, 1/4)`, at distance `1/2`, while
  the right side is `0` for `l = 0`.
- Finiteness at time `l` is needed on an infinite state space: take the model of the sixth
  Check of 2.1 with `trans s = init` for all `s` (so `ε = 1`, `ρ = init`), and `M'` the same
  model with `init = pure 0`. At `y 0 = 0`, `likelihood M y 0 = ⊤` and
  `likelihood M' y 0 = 1`; for `y 1 = 1/2` the first filter at time `1` is `0` and the second is
  `pure 0`, so the distance is `1` while the right side is `0`.

*Needs:* 2.1, 2.2, 3.1, 3.2 (the backward kernels), 6.1.

### Examples

The two-state model of the first Check of 6.2 with several observation sequences; a model
whose transition matrix has all entries in `[ε/|S|, 1/(ε |S|)]`, mixing with `ρ` uniform; and a
model with a zero transition probability, which satisfies no mixing condition.

### Dependencies

Layer 6 uses Layers 2 and 3 and Mathlib's `PMF.bind`.

## Downstream consumers

The filter and its stability are the inputs to the consistency of the maximum likelihood
estimator for hidden Markov models and to uniform-in-time error bounds for approximate filters.
The belief state of a partially observable Markov decision process is the filter of 2.2 for the
controlled transition law. The forward recursion of 2.1 and the Viterbi recursion of 4.1 are
the sum-product and max-product recursions on a chain, the base case of the same recursions on
trees.

## Provenance and prior work

- The Isabelle Archive of Formal Proofs entry
  [Hidden_Markov_Models](https://www.isa-afp.org/entries/Hidden_Markov_Models.html) (Wimmer
  2018, BSD) formalizes hidden Markov models with finite state and observation spaces on top of
  Hölzl's discrete-time Markov chains, and proves the correctness of the forward algorithm and
  of an executable Viterbi algorithm.

This is reference material, not the specification.

## Scope and ownership

This roadmap owns:

- hidden Markov models with countable hidden state space and emission densities, the path law
  of the pair process, its conditional-independence structure and its finite-dimensional
  densities;
- the forward and backward variables, the likelihood, the filter with its normalized recursion,
  prediction, and the marginal, pairwise and path smoothing laws, each identified with a
  conditional law;
- the Viterbi variable in max-product and max-sum form and Viterbi paths;
- Baum's auxiliary function and inequality, expected transition and emission counts, the
  Baum–Welch update and its monotonicity;
- the contraction of a transition law under a minorization condition and the exponential
  stability of the filter under a mixing condition.

It consumes, and does not re-prove, the items listed under
[Exact supplier contracts](#exact-supplier-contracts).

**Generality.** The hidden state space is countable and the observation space is an arbitrary
measurable space. Rabiner 1989, Chapters 3 and 6 of van Handel 2008 (the matrix forms, the Viterbi
recursion, the expected counts and the Baum–Welch update) and the Isabelle entry treat finite
state spaces; the targets taken from them are stated here for countable `S`, with finiteness
assumed only where a statement fails without it. Chapters 1, 2 and 5 of van Handel 2008 (the path
law, filtering, smoothing, prediction and filter stability) treat a general measurable state
space, strictly positive observation densities and a reference probability measure; a locator to
those chapters points to the general statement, and the target here is its case of a countable
state space, extended to densities that may vanish and to a reference measure that need not be
finite. The restriction to countable `S` is what makes the forward, backward and Viterbi variables
functions on `S` given by sums and suprema in `ℝ≥0∞`, with recursions that hold for every
observation sequence and not only almost surely, and what gives state paths a density with respect
to counting measure, which Layer 4 maximizes and over which Layer 5 sums. The suppliers do not
force it: `markovChainLaw` is defined for every measurable state space.

Out of scope:

- hidden state spaces that are not countable, where the forward variable is a measure on the
  state space, the recursions are integrals against a transition kernel and hold almost surely,
  and the filter is a kernel from observation records to the state space (the setting of
  Chapters 2 and 5 of van Handel 2008); in particular linear Gaussian
  state-space models and the Kalman filter, whose conditional laws rest on the conditional
  Gaussian laws of StandardDistributions;
- continuous-time filtering (the Zakai and Kushner–Stratonovich equations);
- particle filters and other Monte Carlo approximations of the filter;
- consistency and asymptotic normality of the maximum likelihood estimator, identifiability,
  and model order estimation;
- the convergence of the Baum–Welch iterates, and updates for emission families other than
  probability mass functions on a finite alphabet (Gaussian and other log-concave families);
- the EM algorithm for a general missing-data model, which belongs to
  MathematicalStatisticsSemiparametric (its Layer 7); that layer assumes strictly positive
  complete-data densities, whereas Layer 5 here allows transition and emission probabilities
  equal to zero and proves its inequalities directly;
- the classification, stationary laws and convergence to equilibrium of Markov chains, which
  belong to MarkovChainsAndRenewal;
- partially observable Markov decision processes and control, which MarkovDecisionProcesses
  excludes as well.

## Exact supplier contracts

- Mathlib:
  - `PMF`, `PMF.tsum_coe` (the values sum to `1`) and `PMF.toMeasure`
    (`Mathlib/Probability/ProbabilityMassFunction/Basic.lean`); `PMF.bind`, with
    `(ν.bind K) s' = ∑' s, ν s * K s s'` (`PMF.bind_apply`,
    `Mathlib/Probability/ProbabilityMassFunction/Monad.lean`);
  - `Kernel` and `IsMarkovKernel` (`Mathlib/Probability/Kernel/Defs.lean`), `Kernel.comap`
    (`Mathlib/Probability/Kernel/Composition/MapComap.lean`), `Kernel.compProd` (`⊗ₖ`,
    `Mathlib/Probability/Kernel/Composition/CompProd.lean`), the monoid structure on
    `Kernel α α` given by composition, which defines the powers `κ ^ k`
    (`Mathlib/Probability/Kernel/Composition/Comp.lean`), and `Measure.compProd` (`⊗ₘ`) with
    `Measure.compProd_apply` for an s-finite measure and an s-finite kernel
    (`Mathlib/Probability/Kernel/Composition/MeasureCompProd.lean`);
  - `Kernel.ofFunOfCountable` (`Mathlib/Probability/Kernel/Basic.lean`): on a countable space
    with measurable singletons every function to measures is a kernel;
  - `Measure.withDensity`, `withDensity_apply` and `lintegral_withDensity_eq_lintegral_mul`
    (`Mathlib/MeasureTheory/Measure/WithDensity.lean`); `lintegral_count`
    (`Mathlib/MeasureTheory/Integral/Lebesgue/Countable.lean`);
  - `Measure.rnDeriv` with `Measure.rnDeriv_lt_top` (for σ-finite `μ`, `μ.rnDeriv ν` is finite
    `ν`-almost everywhere; `Mathlib/MeasureTheory/Measure/Decomposition/Lebesgue.lean`) and
    `Measure.withDensity_rnDeriv_eq` (for `μ ≪ ν` with a Lebesgue decomposition,
    `ν.withDensity (μ.rnDeriv ν) = μ`;
    `Mathlib/MeasureTheory/Measure/Decomposition/RadonNikodym.lean`);
  - `Measure.pi`, with `Measure.pi_pi` and `measurePreserving_piFinSuccAbove`, both for σ-finite
    factors (`Mathlib/MeasureTheory/Constructions/Pi.lean`); `Fin.clamp`
    (`Batteries/Data/Fin/Basic.lean`, imported by Mathlib);
  - `condDistrib` and `condDistrib_ae_eq_of_measure_eq_compProd`
    (`Mathlib/Probability/Kernel/CondDistrib.lean`): for a finite measure `μ`, almost
    everywhere measurable `X`, `Y`, the target of `Y` standard Borel and nonempty, and a finite
    kernel `κ` with `μ.map (fun a ↦ (X a, Y a)) = μ.map X ⊗ₘ κ`, one has
    `condDistrib Y X μ =ᵐ[μ.map X] κ`;
  - `ProbabilityTheory.posterior` (notation `κ†μ`) and `posterior_eq_withDensity_of_countable`
    (`Mathlib/Probability/Kernel/Posterior.lean`): for a finite kernel `κ` from a countable
    standard Borel nonempty space and a finite measure `μ` on it,
    `(κ†μ) x = μ.withDensity (fun ω ↦ (κ ω).rnDeriv (κ ∘ₘ μ) x)` for `κ ∘ₘ μ`-almost every `x`;
  - `ENNReal.tsum_comm`, `ENNReal.tsum_mul_left` and `ENNReal.tsum_prod`
    (`Mathlib/Topology/Algebra/InfiniteSum/ENNReal.lean`); `ENNReal.mul_iSup` and
    `ENNReal.iSup_mul`, valid for every factor and every index type
    (`Mathlib/Basic/ENNReal/Inv.lean`);
  - `ENNReal.log`, `ENNReal.log_mul_add` (`log (x * y) = log x + log y` for all `x`, `y`) and
    `ENNReal.log_strictMono` (`Mathlib/Analysis/SpecialFunctions/Log/ENNRealLog.lean`);
    `ENNReal.logOrderIso`, the order isomorphism `ℝ≥0∞ ≃o EReal` with underlying function
    `ENNReal.log` (`Mathlib/Analysis/SpecialFunctions/Log/ENNRealLogExp.lean`), and
    `OrderIso.map_iSup` (`Mathlib/Order/CompleteLattice/Basic.lean`);
  - `ConcaveOn.le_map_sum` and `StrictConcaveOn.map_sum_eq_iff`
    (`Mathlib/Analysis/Convex/Jensen.lean`), with `strictConcaveOn_log_Ioi`
    (`Mathlib/Analysis/Convex/SpecificFunctions/Basic.lean`);
  - `Matrix.vecMul` (`ᵥ*`) and `dotProduct` (`⬝ᵥ`) (`Mathlib/Data/Matrix/Mul.lean`) and
    `Matrix.diagonal` (`Mathlib/Data/Matrix/Diagonal.lean`).
- Tau Ceti:
  - `Kernel.ofPMF p` (`TauCeti/Probability/Kernel/PMF.lean`): for `p : α → PMF β` on a countable
    `α` with measurable singletons, the kernel whose row at `a` is the measure of `p a`, with
    its instance `IsMarkovKernel (Kernel.ofPMF p)` and `Kernel.ofPMF_apply_singleton`
    (`Kernel.ofPMF p a {b} = p a b` when `β` has measurable singletons);
  - `TauCeti.Probability.markovChainLaw ν κ` (`TauCeti/Probability/Process/MarkovChain.lean`),
    the law on `ℕ → α` of the homogeneous Markov chain with initial measure `ν` and Markov
    kernel `κ` on a measurable space `α`, a probability measure when `ν` is; from the same file
    `TauCeti.Probability.markovChainLaw_map_eval_zero` (the time-zero marginal is `ν`),
    `TauCeti.Probability.markovChainLaw_map_prefix_succ_eq_compProd` (for s-finite `ν`, the law
    of the first `n + 1` coordinates together with the next one is the law of the first
    `n + 1` coordinates composed with `κ` at the last of them),
    `TauCeti.Probability.markovChainLaw_map_prefix_apply_singleton` (for s-finite `ν` and
    measurable singletons, the mass of a finite path `w` is `ν {w 0}` times the product of the
    `κ (w i) {w (i + 1)}`), `MeasureTheory.Measure.eq_markovChainLaw` (for finite `ν`, a measure
    on paths with time-zero marginal `ν` whose prefix laws satisfy that recursion is
    `markovChainLaw ν κ`) and `MeasureTheory.Measure.markovChainLaw_map_eval` (the coordinate at
    time `n` has law `(κ ^ n) ∘ₘ ν`).

## References

- L. R. Rabiner, *A tutorial on hidden Markov models and selected applications in speech
  recognition*, Proc. IEEE **77** (1989), 257–286.
- R. van Handel, *Hidden Markov models*, lecture notes, Princeton University, version of
  July 28, 2008.
- S. Wimmer, *Hidden Markov models*, Archive of Formal Proofs, 2018,
  <https://www.isa-afp.org/entries/Hidden_Markov_Models.html>.

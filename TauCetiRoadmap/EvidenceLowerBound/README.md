# Roadmap: evidence lower bounds

**Summary.** In a latent-variable model the probability of an observation, its evidence, is an
integral over the latent space that can rarely be computed. Variational inference replaces
the logarithm of the evidence by lower bounds that are expectations under a chosen proposal law
`q`, and fits `q` or the model by maximizing them. This roadmap proves the main theorems about
these bounds. For a fixed observation the model is a finite measure `p` on the latent space; its
total mass `p(Z)` is the evidence and `p / p(Z)` is the posterior. The importance weight is the
density `w = dp/dq`. Statements about the bounds assume that `q` is a probability measure with
`q ≪ p` and that `log w` is `q`-integrable; some also need `p ≪ q`.

Its headline theorems:

- *Importance-weighted bounds.* Let `L_k` be the expected logarithm of the average of `w` over `k`
  independent samples of `q`. For `k ≥ 1` the bounds increase with `k` and stay below
  `log p(Z)`. If also `p ≪ q`, they converge to `log p(Z)`; one of them equals `log p(Z)` exactly
  when `q` is the posterior, and otherwise they increase strictly.
- *The augmented view.* Draw `n + 1` samples of `q`, select one with probability proportional to
  its weight, and put it first. When `p ≪ q`, the relative entropy of the law of the result from
  the posterior times `n` copies of `q` is exactly `log p(Z) − L_(n+1)`. Hence the selected sample
  converges in law to the posterior in relative entropy, and for `|t| ≤ C` the bias of the
  self-normalized importance sampling estimate of the posterior mean of `t` is at most
  `C √(2 (log p(Z) − L_(n+1)))`.
- *Greedy training of deep belief networks.* For a restricted Boltzmann machine and a law of data,
  replacing the hidden law by the visible law of a second machine that fits the aggregated
  posterior of the hidden units at least as well as the transposed machine does not decrease the
  average log-likelihood of the data.
- *The free-energy view of EM.* On a finite space of missing values with positive complete-data
  densities, the pairs that maximize the evidence lower bound jointly over laws of the missing
  values and parameters are exactly the pairs formed by a maximizer of the observed-data
  likelihood and its conditional law of the missing values.

The roadmap builds on ImportanceSamplingAndVarianceReduction (weights and estimates), on
RestrictedBoltzmannMachines (the layers of a deep belief network), on the EM objects of
MathematicalStatisticsSemiparametric, and on Mathlib's posterior kernel and relative entropy.

Layer 1 below fixes the weights, identifies Mathlib's posterior with the normalized joint measure
and defines the bounds. Layer 2 proves the theorems on the importance-weighted bounds. Layer 3,
which uses Layer 2, treats the augmented proposal. Layer 4 proves the greedy bound for deep belief
networks and uses no other layer; Layer 5 treats the free-energy view of EM and uses only the
evidence lower bound defined in Layer 1.

## Conventions

- **Model and posterior.** `Z` is a measurable space. For a fixed observation the model is a
  finite measure `p` on `Z`: in the usual setting `p(dz) = p(x, z) dz`, the joint density at the
  observation `x` against a reference measure. The evidence is `p(Z)`, written `p.real Set.univ`
  in the statements, and the posterior is `(p Set.univ)⁻¹ • p`. 1.2 shows that this is Mathlib's
  posterior kernel at almost every observation when the likelihood has a density.
- **Proposal and weight.** The proposal `q` is a probability measure on `Z`, and the weight is
  `isWeight p q z = (p.rnDeriv q z).toReal`, copied from ImportanceSamplingAndVarianceReduction.
  When `p ≪ q` it is a density of `p` with respect to `q`; in general it is the density of the
  part of `p` absolutely continuous with respect to `q`. The hypothesis `q ≪ p` says that the
  weight is positive `q`-almost everywhere.
- **Samples.** Independent samples of law `q` are the coordinates `ω i` of
  `Measure.infinitePi fun _ : ℕ ↦ q` on `ℕ → Z`; the bound `L_k` uses the first `k` of them.
- **Junk values.** `Real.log 0 = 0`, the Bochner integral of a non-integrable function is `0`,
  and the average of no samples is `0`. So every statement about `L_k` assumes `k ≥ 1`, positivity
  of the weight (`q ≪ p`) and integrability of `log w` under `q`; Checks of 1.3 and 2.1 show that
  each of these is needed. Relative entropy is Mathlib's `InformationTheory.klDiv`, with values in
  `[0, ∞]`.
- **Machines.** Restricted Boltzmann machines are those of RestrictedBoltzmannMachines: visible
  configurations `ι → Bool`, hidden configurations `κ → Bool`, parameters `θ : Params ι κ`, the
  joint law the Gibbs measure of the energy, with its marginals and its two conditional kernels.
  The definitions used are copied verbatim; `bit` and `gibbs`, which that roadmap copies from
  QuantumOptimization and SimulatedAnnealing, are copied from their owners. The average
  log-likelihood of a data law `q` under a law `r` on the visible configurations is
  `∫ v, Real.log (r.real {v}) ∂q`.
- **EM objects.** The observed-data likelihood, its logarithm and the conditional law of the
  missing part are those of MathematicalStatisticsSemiparametric 7.1, copied verbatim, for a
  complete-data density `f : E → Z → ℝ` integrated against `ρ`.

## Layer 1: importance weights, the posterior and the two bounds

### 1.1 Importance weights and estimates

Copy verbatim `isWeight`, `isEstimator` (ImportanceSamplingAndVarianceReduction 1.1) and
`snisEstimator` (ImportanceSamplingAndVarianceReduction 2.1): the weight `dp/dq` read in `ℝ`, the
importance sampling average `(1/n) Σ_{i<n} f(X i ω) w(X i ω)` and the self-normalized average
`Σ_{i<n} f(X i ω) w(X i ω) / Σ_{i<n} w(X i ω)`, which is `0` when the weights sum to `0`.

- The importance sampling average of `f = 1` is the average of the weights.

*Needs:* ImportanceSamplingAndVarianceReduction 1.1 and 2.1 (the definitions).

### 1.2 Bayes' formula with a likelihood density

Let `Z` be standard Borel and nonempty, `μ` a finite measure on `Z` (the prior), `κ` a finite
kernel from `Z` to a measurable space `X` (the likelihood), `ν` a σ-finite measure on `X`, and
`ℓ : Z → X → ℝ≥0∞` jointly measurable with `κ z = ν.withDensity (ℓ z)` for every `z`. Prove
(`posterior_ae_eq_smul_withDensity`) that for `(κ ∘ₘ μ)`-almost every `x` the joint measure
`μ.withDensity (ℓ · x)` has positive finite mass and Mathlib's posterior is

    (κ†μ) x = ((μ.withDensity (ℓ · x)) Set.univ)⁻¹ • μ.withDensity (ℓ · x).

So for almost every observation the posterior of the conventions, built from the joint measure
`p = μ.withDensity (ℓ · x)`, is Mathlib's posterior, and its evidence `p(Z) = ∫ ℓ z x dμ(z)` is
the density of `κ ∘ₘ μ` with respect to `ν` at `x`.

Route (proved here): write `m(x) = ∫⁻ ℓ z x dμ(z)`. By Tonelli (`lintegral_lintegral_swap`),
`κ ∘ₘ μ = ν.withDensity m`; as `κ ∘ₘ μ` is finite, `m < ∞` `ν`-almost everywhere, and
`m > 0` `(κ ∘ₘ μ)`-almost everywhere because the set `{m = 0}` has `(κ ∘ₘ μ)`-measure
`∫_{m = 0} m dν = 0`. Let `η x = m(x)⁻¹ • μ.withDensity (ℓ · x)`, a kernel of total mass at most
`1` (it is `0` where `m(x)` is `0` or `∞`). On a rectangle `A × B`, Tonelli gives
`((κ ∘ₘ μ) ⊗ₘ η)(A × B) = ∫_A ∫_B ℓ z x dμ(z) dν(x) = (μ ⊗ₘ κ)(B × A)`, so
`(κ ∘ₘ μ) ⊗ₘ η` is the image of `μ ⊗ₘ κ` under the swap, and Mathlib's
`ae_eq_posterior_of_compProd_eq` gives `η = κ†μ` almost everywhere. No countability of `X` is
used. Mathlib's own Bayes formula `ProbabilityTheory.posterior_eq_withDensity` writes `(κ†μ) x` as
`μ` with the density `z ↦ κ.rnDeriv (Kernel.const _ (κ ∘ₘ μ)) z x`; it assumes that
`κ z ≪ κ ∘ₘ μ` for `μ`-almost every `z` and that `Z` is countable or the σ-algebra of `X`
countably generated, and it does not identify that density
with `ℓ z x` divided by the evidence `m(x)`, which is the content of 1.2.

**Checks.**

- Prior uniform on `Z = {0, 1}`, `X = {0, 1}` with counting measure, `ℓ z 1 = 1/4, 3/4` for
  `z = 0, 1`: at `x = 1` the joint measure is `(1/8, 3/8)`, the evidence `1/2` and the posterior
  `(1/4, 3/4)`.
- The statement is almost everywhere and cannot hold at every `x`: at an `x` with
  `ℓ z x = 0` for all `z` the joint measure is `0`, while `(κ†μ) x` is a probability measure.

*Needs:* Mathlib `ProbabilityTheory.posterior`, `ProbabilityTheory.ae_eq_posterior_of_compProd_eq`,
`MeasureTheory.lintegral_lintegral_swap`, `Measure.compProd`, `Measure.withDensity`.

### 1.3 The evidence lower bound and the importance-weighted bounds

Define `elbo p r = ∫ z, Real.log (isWeight p r z) ∂r`, the evidence lower bound of a probability
measure `r` (Kingma–Welling, eqs. (1)–(2), p. 3), and

    iwElbo p q k = ∫ ω, Real.log (isEstimator p q (fun _ ↦ 1) (fun i ω ↦ ω i) k ω)
                     ∂(Measure.infinitePi fun _ : ℕ ↦ q),

the importance-weighted bound `L_k = E log ((1/k) Σ_{i<k} w(z_i))` with `z_i` independent of law
`q` (Burda–Grosse–Salakhutdinov, eq. (8), p. 3). Then `iwElbo p q 1 = elbo p q`, since the first
coordinate has law `q`.

- *The evidence lower bound identity.* If `p ≪ q` and `q ≪ p`, the posterior is the tilt
  `q.tilted (log w)`, and for a probability measure `r ≪ q` with `log w` and `llr r q`
  `r`-integrable, Mathlib's `integral_llr_tilted_right` (with `f = log w`, `∫ exp f dq = p(Z)`)
  gives `elbo p r = log p(Z) − KL(r ‖ posterior)`. This identity is the library's and is not a
  target here; it is the step that every route below calls "the identity of 1.3".

**Checks.**

- `Z = {0, 1}`, `q` uniform, `p = (1/4, 3/4)`: the weights are `1/2` and `3/2`, `p(Z) = 1`, and
  `L_1 = (1/2) log(3/4)`; the average of two weights takes the values `1/2, 1, 3/2` with
  probabilities `1/4, 1/2, 1/4`, so `L_2 = (1/4) log(3/4)`. In general here
  `L_k = Σ_j C(k, j) 2^(−k) log((k + 2j)/(2k))`.
- `k = 0`: the average of no samples is `0`, so `iwElbo p q 0 = Real.log 0 = 0`; with `w = 1/2`
  (`p = q/2`) this exceeds `L_1 = log(1/2)`.
- `q = p` with `p` a probability measure: `w = 1`, and `L_k = 0 = log p(Z)` for every `k ≥ 1`.

*Needs:* 1.1; Mathlib `Measure.infinitePi`, `measurePreserving_eval_infinitePi`.

### Examples

- The running example: `Z = {0, 1}`, `q` uniform, `p = (1/4, 3/4)`, evidence `1`, posterior
  `(1/4, 3/4)`, weights `(1/2, 3/2)`.

### Dependencies

- ImportanceSamplingAndVarianceReduction 1.1, 2.1 (definitions); Mathlib's posterior kernel,
  infinite product measures and relative entropy.

## Layer 2: the importance-weighted bounds

### 2.1 Monotonicity and the upper bound

Let `p` be finite and `q` a probability measure with `q ≪ p` and `log w` `q`-integrable. Prove
(`iwElbo_monotoneOn_and_le_log`) that `k ↦ L_k` is monotone on `k ≥ 1` and that
`L_k ≤ log p(Z)` for every `k ≥ 1` (Burda–Grosse–Salakhutdinov, Theorem 1, eq. (10), p. 4, proof
in Appendix A, parts 1 and 2, p. 10). The statement does not assume `p ≪ q`.

Route:

1. *Integrability.* `q ≪ p` makes `w > 0` `q`-almost everywhere, so the average `M_k` of the
   first `k ≥ 1` weights is positive almost surely. By concavity of `log`,
   `(1/k) Σ_{i<k} log w(ω i) ≤ log M_k ≤ M_k − 1`, and both bounds are integrable (the first by
   the integrability of `log w`, the second because `∫ w dq ≤ p(Z)`), so `log M_k` is integrable
   and `L_k` is not a junk value.
2. *Upper bound.* By the identity `∫ f w dq = ∫ f dp − ∫ f d(p.singularPart q)` of
   ImportanceSamplingAndVarianceReduction 1.1 (`integral_mul_isWeight`) with `f = 1`, and by
   linearity, `E M_k = ∫ w dq ≤ p(Z)`; Jensen's inequality for the concave `log`
   (`ConcaveOn.le_map_integral`) gives `L_k ≤ log E M_k ≤ log p(Z)`.
3. *Monotonicity.* For `1 ≤ m ≤ k`, `M_k` is the average over the `m`-element subsets `I` of the
   first `k` indices of the averages `M_I` over `I`; by concavity `log M_k ≥` the average of
   `log M_I`, and each `M_I` has the law of `M_m` because the coordinates are independent with
   law `q` (`iIndepFun_infinitePi`). Taking expectations gives `L_k ≥ L_m`.

**Checks.**

- Running example: `L_1 = (1/2) log(3/4) < L_2 = (1/4) log(3/4) < L_3 < L_4 < 0 = log p(Z)`,
  computed exactly from the closed form of 1.3.
- `q ≪ p` is needed: `q` uniform on `{0, 1}`, `p = δ₁`, so `w = (0, 2)`. In Lean,
  `L_1 = (1/2) Real.log 0 + (1/2) log 2 = (1/2) log 2 > 0 = log p(Z)`, and
  `L_2 = (1/4) log 2 < L_1`. (Without the junk value both are `−∞`.)
- Integrability of `log w` is needed: `Z = ℕ`, `q{n} = 2^(−(n+1))`, `w(n) = exp(−4^n)`, so
  `p(ℕ) = Σ 2^(−(n+1)) exp(−4^n) ≤ e^(−1) < 1` and `∫ log w dq = −Σ 2^(n−1) = −∞`; the Bochner
  integral `L_1` is then `0 > log p(ℕ)`.
- `p ≪ q` is not assumed: `q = δ₀` on `{0, 1}` and `p = δ₀ + δ₁` give `w(0) = 1`, `L_k = 0` for all
  `k ≥ 1` and `log p(Z) = log 2`.

*Needs:* 1.1, 1.3; ImportanceSamplingAndVarianceReduction 1.1 (`integral_mul_isWeight`); Mathlib
`ConcaveOn.le_map_integral`, `strictConcaveOn_log_Ioi`, `Real.log_le_sub_one_of_pos`,
`iIndepFun_infinitePi`, `measurePreserving_eval_infinitePi`, `Measure.rnDeriv_pos'`.

### 2.2 Convergence to the log-evidence

Let `p` be finite and `q` a probability measure with `p ≪ q`, `q ≪ p` and `log w` `q`-integrable.
Prove (`tendsto_iwElbo`) that `L_k → log p(Z)` as `k → ∞`.

Burda–Grosse–Salakhutdinov, Theorem 1, p. 4 (part 3 of Appendix A, p. 10), assume instead that
`w` is bounded. As printed that is false: for `q` uniform on `{0, 1}` and `w = (0, 2)` (bounded),
every `M_k` vanishes with probability `2^(−k) > 0`, so `L_k = −∞` for every `k` while
`log p(Z) = 0`; positivity of the weight must be added. Boundedness neither implies nor follows
from the integrability of `log w` (a bounded weight can have `∫ log w dq = −∞`, and
`q{n} = 2^(−(n+1))`, `w(n) = (3/2)^n / 2` on `ℕ` is unbounded with `log w` integrable), so the
statement here is not a special case of theirs. Their printed argument also passes from almost
sure convergence of `M_k` to convergence of `E log M_k` without a domination step; the route
below supplies the lower half by Fatou's lemma.

Route (proved here):

1. *Strong law.* `w` and `log w` are `q`-integrable (`∫ w dq = p(Z)` as `p ≪ q`), so by
   `strong_law_ae` applied to `w(ω i)` and to `log w(ω i)`, `M_k → p(Z)` and
   `A_k = (1/k) Σ_{i<k} log w(ω i) → ∫ log w dq` almost surely; `p(Z) > 0` because `q ≪ p`, so
   `log M_k → log p(Z)` almost surely.
2. *Lower bound.* `D_k = log M_k − A_k ≥ 0` by concavity (step 1 of 2.1), `D_k → log p(Z) − ∫ log
   w dq` almost surely, and `E A_k = ∫ log w dq`. Fatou's lemma (`lintegral_liminf_le`) gives
   `liminf E D_k ≥ log p(Z) − ∫ log w dq`, that is `liminf L_k ≥ log p(Z)`.
3. *Upper bound.* `L_k ≤ log p(Z)` by 2.1.

**Checks.**

- Running example: `L_1, …, L_4` increase to `0 = log p(Z)` (2.1).
- `p ≪ q` is needed: with `q = δ₀` and `p = δ₀ + δ₁` on `{0, 1}`, `L_k = 0` for every `k`, while
  `log p(Z) = log 2`; the limit is the logarithm of the mass of the part of `p` that `q` sees.

*Needs:* 2.1; Mathlib `strong_law_ae`, `iIndepFun_infinitePi`,
`measurePreserving_eval_infinitePi`, `lintegral_liminf_le`.

### 2.3 Equality and strict increase

Under the hypotheses of 2.2 prove (`iwElbo_eq_log_iff_and_strictMonoOn`):

- for every `k ≥ 1`, `L_k = log p(Z)` if and only if `q` is the posterior `(p Set.univ)⁻¹ • p`;
- if `q` is not the posterior, `k ↦ L_k` is strictly increasing on `k ≥ 1`.

Route (proved here):

1. `q` is the posterior exactly when `w` is `q`-almost everywhere constant: as `p ≪ q`,
   `p = q.withDensity (dp/dq)`, so a constant weight `c` gives `p = c q` and `c = p(Z)`;
   conversely the weight of `q = p / p(Z)` is `p(Z)`.
2. *Equality.* If `w = p(Z)` almost everywhere then `M_k = p(Z)` almost surely. Conversely, if
   `L_k = log p(Z) = log E M_k`, strict concavity
   (`StrictConcaveOn.ae_eq_const_or_lt_map_average` with `strictConcaveOn_log_Ioi`) makes `M_k`
   almost surely constant; since `k M_k = w(ω 0) + S` with `S` independent of `w(ω 0)`,
   `w(ω 0)` is almost surely a function of `S`, hence independent of itself and constant.
3. *Strict increase.* For `1 ≤ m < k`, the inequality of step 3 of 2.1 is strict at every `ω`
   where the first `k` weights are not all equal: if `w_a ≠ w_b`, an `m`-subset containing `a`
   but not `b` and the subset obtained by exchanging them have different averages. If `w` is not
   almost everywhere constant this event has positive probability, so `L_m < L_k`.

**Checks.**

- Running example: `q` is not the posterior and `L_1 < L_2 < L_3 < L_4`.
- `p = 3q`: the weight is constant `3`, `q` is the posterior and `L_k = log 3` for every `k ≥ 1`.
- `p ≪ q` is needed for the equivalence: with `q = δ₀` and `p = δ₀ + δ₁` the weight is constant,
  `L_k = 0 < log 2` and `q` is not the posterior.

*Needs:* 2.1, 2.2 (its hypotheses only); Mathlib `StrictConcaveOn.ae_eq_const_or_lt_map_average`,
`strictConcaveOn_log_Ioi`, `iIndepFun_infinitePi`, `Measure.withDensity_rnDeriv_eq`.

### Examples

- Burda–Grosse–Salakhutdinov's case `k = 1`: `L_1 = elbo p q` is the evidence lower bound of `q`
  itself, so 2.1 says that averaging more weights never makes the bound worse.

### Dependencies

- Layer 1; ImportanceSamplingAndVarianceReduction 1.1 (`integral_mul_isWeight`); Mathlib's strong
  law, Jensen inequality and Fatou lemma.

## Layer 3: the augmented proposal

### 3.1 The law of the selected sample and the others

Define `iwJoint p q n`, a measure on `Z × (Fin n → Z)` (the selected sample and the `n` others):
the product `q ⊗ qⁿ` with density

    (z, z') ↦ w(z) / ((n + 1)⁻¹ (w(z) + Σ_i w(z' i))),

read as `0` where the denominator is `0`. Prove (`iwJoint_eq_bind`) that, for a probability
measure `q` and any `p`, `iwJoint p q n` is the law of the following selection: draw
`y : Fin (n + 1) → Z` from `qⁿ⁺¹`, choose the index `m` with probability
`w(y m) / Σ_j w(y j)`, and return `(y m, Fin.removeNth m y)`, the selected sample followed by the
others in their order. In Lean the right side is
`(Measure.pi fun _ ↦ q).bind fun y ↦ Σ_m ofReal (w(y m) / Σ_j w(y j)) • δ_(y m, Fin.removeNth m y)`
(Domke–Sheldon, Algorithm 1 and Theorem 1, eq. (6), pp. 3–4, proof in Appendix A.2, p. 14).

Route: both sides give a measurable rectangle the same mass. On the right, by `Measure.bind_apply`
and Tonelli, the mass is the sum over `m` of the integral over `y` of the selection probability.
The map `y ↦ (y m, Fin.removeNth m y)` sends `qⁿ⁺¹` to `q ⊗ qⁿ` (a permutation of coordinates of a
product measure), and the sum of the weights is invariant under it, so each of the `n + 1` terms
equals the integral of `w(z) / Σ` against `q ⊗ qⁿ`; their sum is the left side. Where all
weights vanish both sides give mass `0`.

**Checks.**

- Running example, `n = 1`: `iwJoint` gives `(0, 0), (0, 1), (1, 0), (1, 1)` the masses
  `1/4, 1/8, 3/8, 1/4`, and enumerating the selection gives the same four masses.
- `n = 0`: the density is `1` where `w > 0`, so `iwJoint p q 0` is `q` times the point mass on the
  one-point space `Fin 0 → Z` when `q ≪ p`.

*Needs:* 1.1; Mathlib `Measure.bind`, `Measure.bind_apply`, `Measure.pi`, `Fin.removeNth`,
`Measure.withDensity`.

### 3.2 The gap is a relative entropy

Let `p` be finite and `q` a probability measure with `p ≪ q`, `q ≪ p` and `log w`
`q`-integrable. Prove (`isProbabilityMeasure_iwJoint_and_klDiv_eq`) that `iwJoint p q n` is a
probability measure and

    klDiv (iwJoint p q n) (posterior ⊗ qⁿ) = ENNReal.ofReal (log p(Z) − L_(n+1)),

with `posterior ⊗ qⁿ = ((p Set.univ)⁻¹ • p).prod (Measure.pi fun _ ↦ q)` (Domke–Sheldon,
Theorem 1, eq. (7), p. 3, proof p. 14). In particular the divergence is finite.

Route:

1. *Mass.* By the symmetry of 3.1, the mass of `iwJoint p q n` is the `qⁿ⁺¹`-probability that
   some weight is positive, which is `1` as `w > 0` `q`-almost everywhere.
2. *Density.* As `p ≪ q`, the posterior is `q` with density `w / p(Z)`, so
   `posterior ⊗ qⁿ` is `q ⊗ qⁿ` with density `w(z) / p(Z)`, and `iwJoint p q n` has density
   `p(Z) / R` with respect to it, `R = (n + 1)⁻¹ (w(z) + Σ_i w(z' i))` (both are positive almost
   everywhere).
3. *Divergence.* `klDiv` is the integral of `log p(Z) − log R` against `iwJoint p q n`
   (`toReal_klDiv_of_measure_eq`, both are probability measures), and the integral of `log R`
   against `iwJoint p q n` is, by the symmetry of 3.1, the integral of `log R` against
   `q ⊗ qⁿ`, which is `L_(n+1)` (the first `n + 1` coordinates of the infinite product have law
   `qⁿ⁺¹`, `Measure.infinitePi_map_restrict`). Integrability of `log R` is step 1 of 2.1.

**Checks.**

- Running example, `n = 1`: the posterior times `q` gives the four points the masses
  `1/8, 1/8, 3/8, 3/8`, and the divergence of `(1/4, 1/8, 3/8, 1/4)` from it is
  `(1/4) log 2 + (1/4) log(2/3) = (1/4) log(4/3) = −L_2`.
- `n = 0`: the statement is `KL(q ‖ posterior) = log p(Z) − L_1`, the identity of 1.3 with
  `r = q`.

*Needs:* 2.1, 3.1; Mathlib `toReal_klDiv_of_measure_eq`, `klDiv`, `Measure.infinitePi_map_restrict`.

### 3.3 The two gaps

Under the hypotheses of 3.2 prove (`klDiv_iwJoint_eq_add_and_iwElbo_le_elbo`) that, with `ρ_n` the
first marginal of `iwJoint p q n` (the law of the selected sample),

    klDiv (iwJoint p q n) (posterior ⊗ qⁿ)
      = klDiv ρ_n posterior + klDiv (iwJoint p q n) (ρ_n ⊗ qⁿ),

and that `L_(n+1) ≤ elbo p ρ_n ≤ log p(Z)` (Domke–Sheldon, Theorem 2 and eq. (8), p. 4, proof
p. 15). The second term is the expected relative entropy of the conditional law of the `n` others
given the selected sample from `qⁿ`, written without a conditional kernel. With 3.2 and the
identity of 1.3, the two gaps are `log p(Z) − elbo p ρ_n = KL(ρ_n ‖ posterior)` and
`elbo p ρ_n − L_(n+1)` the second term.

Route: `posterior ⊗ qⁿ = posterior ⊗ₘ (Kernel.const qⁿ)` and `ρ_n ⊗ qⁿ = ρ_n ⊗ₘ (Kernel.const qⁿ)`
(`Measure.compProd_const`); `iwJoint p q n` is absolutely continuous with respect to `q ⊗ qⁿ`,
hence with respect to `ρ_n ⊗ qⁿ` (the first marginal has a positive density with respect to `q`),
and the log-likelihood ratio splits as `llr ρ_n posterior` at the first coordinate plus
`llr (iwJoint p q n) (ρ_n ⊗ qⁿ)`; integrating gives the identity (Mathlib's
`klDiv_compProd_eq_add` is the same chain rule for composition products). The divergences are
finite by 3.2, so `KL(ρ_n ‖ posterior) ≤ log p(Z) − L_(n+1)`; the identity of 1.3 with `r = ρ_n`
(`ρ_n ≪ q`, and `llr ρ_n q` and `log w` are `ρ_n`-integrable because the density of `ρ_n` with
respect to `q` is at most `n + 1`, the density of 3.1 being at most `n + 1`) gives the two
inequalities.

**Checks.**

- Running example, `n = 1`: `ρ_1 = (3/8, 5/8)`; `KL(ρ_1 ‖ posterior) = (3/8) log(3/2) + (5/8)
  log(5/6)`, the second term is `(1/4) log(4/3) + (1/8) log(2/3) + (3/8) log(6/5) + (1/4)
  log(4/5)`, both positive, and their sum is `(1/4) log(4/3)`, as an exact identity between
  logarithms of `2, 3, 5`.
- `n = 0`: `ρ_0 = q`, the second term is `0`, and the inequalities read `L_1 ≤ elbo p q ≤ log p(Z)`
  with equality on the left.

*Needs:* 1.3 (the identity), 3.2; Mathlib `Measure.fst`, `Measure.compProd_const`,
`klDiv_compProd_eq_add`, `integral_llr_tilted_right`.

### 3.4 Self-normalized importance sampling and its bias

Under the hypotheses of 3.2, let `t : Z → ℝ` be measurable with `|t z| ≤ C` for all `z`. Prove
(`integral_fst_iwJoint_eq_and_abs_sub_le`):

- `∫ t dρ_n` is the mean of the self-normalized importance sampling estimate
  `snisEstimator p q t (fun i ω ↦ ω i) (n + 1)` over the infinite product (Domke–Sheldon,
  Lemma 4, p. 15);
- the bias of that estimate for the posterior mean `p(Z)⁻¹ ∫ t dp` is at most
  `C √(2 (log p(Z) − L_(n+1)))`.

Route: the first item is the symmetry of 3.1 applied to `t(z) w(z) / R`: averaging over the
`n + 1` positions of the selected sample turns it into `Σ_m t(y m) w(y m) / Σ_m w(y m)`. For the
second, `ρ_n ≪ posterior`, so `|∫ t dρ_n − ∫ t d posterior| ≤ C ∫ |dρ_n/d posterior − 1| d
posterior = C tvDist ρ_n posterior` (`tvDist_eq_integral_abs_rnDeriv_of_ac`, Mathlib's total
variation norm, with values in `[0, 2]`); Pinsker's inequality in Tau Ceti's form
(`etvDist_sq_le_two_mul_klDiv`) bounds it by `C √(2 KL(ρ_n ‖ posterior))`, and 3.3 bounds the
divergence by `log p(Z) − L_(n+1)`. Nonasymptotic bias bounds for self-normalized importance
sampling are outside the scope of ImportanceSamplingAndVarianceReduction; this one is proved
here.

**Checks.**

- Running example, `n = 1`, `t` the indicator of `1`, `C = 1`: the estimate with two samples has
  mean `(0 + 3/4 + 3/4 + 1)/4 = 5/8 = ρ_1{1}`, the posterior mean is `3/4`, and the bias `1/8`
  is below `√((1/2) log(4/3))`, since `(1/8)² = 1/64` and `(1/2) log(4/3) ≥ (1/2)(1 − 3/4) = 1/8`.
- `n = 0`: the estimate is `t(z₀)`, its mean `∫ t dq`, and the bound is Pinsker's inequality for
  `q` and the posterior.

*Needs:* 1.1, 3.1, 3.3; Mathlib `tvDist_eq_integral_abs_rnDeriv_of_ac`; Tau Ceti
`etvDist_sq_le_two_mul_klDiv`.

### 3.5 The selected sample converges to the posterior

Under the hypotheses of 3.2 prove (`tendsto_klDiv_fst_iwJoint`) that
`klDiv ρ_n posterior → 0` as `n → ∞`. Domke–Sheldon, p. 4, describe this behaviour in words; the
statement is proved here: `0 ≤ klDiv ρ_n posterior ≤ log p(Z) − L_(n+1)` by 3.3, and the right
side tends to `0` by 2.2. With 3.4, the bias of the self-normalized estimate of every bounded
`t` tends to `0`.

**Checks.**

- Running example: `KL(ρ_1 ‖ posterior) = (3/8) log(3/2) + (5/8) log(5/6) ≤ (1/4) log(4/3)`.
- With `q` the posterior, `w` is constant, `ρ_n = q` for every `n` and the divergence is `0`.

*Needs:* 2.2, 3.3.

### Examples

- Running example with two samples: the selected sample has law `(3/8, 5/8)` against the prior
  guess `(1/2, 1/2)` and the posterior `(1/4, 3/4)`; the largest difference of probabilities of an
  event (half of Mathlib's `tvDist`) falls from `1/4` to `1/8`.

### Dependencies

- Layers 1 and 2 (3.2 uses 2.1; 3.5 uses 2.2); Mathlib's chain rule for relative entropy and
  total variation; Tau Ceti's Pinsker inequality.

## Layer 4: the greedy layer-wise bound for deep belief networks

### 4.1 Replacing the hidden law

Copy verbatim `bit` (QuantumOptimization 1.1), `gibbs` (SimulatedAnnealing 3.1), and `Params`,
`energy`, `jointLaw`, `visibleLaw`, `hiddenLaw`, `hiddenField`, `visibleField`, `hiddenKernel`
and `visibleKernel` (RestrictedBoltzmannMachines 1.1 and 1.2). For a machine `θ` and a probability
measure `q` on the visible configurations (the data law), the aggregated posterior is
`q.bind (hiddenKernel θ)`, the law of the hidden configuration when the visible one is drawn
from `q` and the hidden one from its conditional law.

Let `p'` be a probability measure on the hidden configurations with `p' {h} > 0` for every `h`,
fitting the aggregated posterior at least as well as the hidden law of the machine:

    ∫ h, log (hiddenLaw θ){h} ∂(q.bind (hiddenKernel θ))
      ≤ ∫ h, log p'{h} ∂(q.bind (hiddenKernel θ)).

Prove (`integral_log_visibleLaw_le_bind_visibleKernel`) that the model that draws the hidden
configuration from `p'` and the visible one from `visibleKernel θ` has average log-likelihood at
least that of the machine:

    ∫ v, log (visibleLaw θ){v} ∂q ≤ ∫ v, log (p'.bind (visibleKernel θ)){v} ∂q

(Hinton–Osindero–Teh, §4: eqs. (7)–(8) and the greedy steps, p. 5; eq. (9) and the paragraph
after it, p. 6, where the guarantee is on the expected change of the log probability, footnote 4,
p. 6).

Route (proved here; everything is a finite sum): by RestrictedBoltzmannMachines 1.2
(`TauCetiRoadmap.RestrictedBoltzmannMachines.jointLaw_eq_compProd`), `jointLaw θ` is both
`visibleLaw θ ⊗ₘ hiddenKernel θ` and, after the swap, `hiddenLaw θ ⊗ₘ visibleKernel θ`, so
`hiddenKernel θ v` is the posterior of the hidden
configuration given `v`. All the masses involved are positive (each is a product of logistic
factors or a Gibbs weight). For every `v`, with `Q = hiddenKernel θ v` and `P = visibleKernel θ`,
concavity of `log` gives the evidence lower bound

    log (p'.bind P){v} ≥ Σ_h Q{h} (log p'{h} + log P h {v} − log Q{h}),

with equality for `p' = hiddenLaw θ` because `Q` is then the exact posterior. Subtracting,
`log (p'.bind P){v} − log (visibleLaw θ){v} ≥ Σ_h Q{h} (log p'{h} − log (hiddenLaw θ){h})`;
integrating against `q` turns the right side into the difference of the two sides of the
hypothesis, which is nonnegative.

**Checks.**

- One visible and one hidden unit, `W = log 3`, `b = c = 0` (the standard example of
  RestrictedBoltzmannMachines): `visibleLaw = hiddenLaw = (1/3, 2/3)`. For `q = δ₁` the
  aggregated posterior is `(1/4, 3/4)`; with `p'` equal to it the hypothesis holds (the difference
  of its two sides is `KL((1/4, 3/4) ‖ (1/3, 2/3)) > 0`, as `(3/4)(9/8)³ = 2187/2048 > 1`), and the
  new probability of `v = 1` is `(1/4)(1/2) + (3/4)(3/4) = 11/16 > 2/3`.
- Positivity of `p'` is needed: `p' = δ₀` satisfies the hypothesis in Lean (the term
  `(3/4) Real.log 0` is `0`), but the new probability of `v = 1` is `σ(0) = 1/2 < 2/3`.
- On the grid `p'{1} = a/12`, `a = 1, …, 11`, every `p'` satisfying the hypothesis gives a new
  probability of `v = 1` at least `2/3`.

*Needs:* RestrictedBoltzmannMachines 1.1, 1.2 (definitions and
`TauCetiRoadmap.RestrictedBoltzmannMachines.jointLaw_eq_compProd`); Mathlib `integral_fintype`,
`Measure.bind_apply`, `strictConcaveOn_log_Ioi`.

### 4.2 Adding a layer

Define `transposeParams θ : Params κ ι`, the machine with the roles of the layers exchanged: the
weight between its hidden unit `j` and visible unit `i` is `W i j`, its visible biases are `c`
and its hidden biases are `b`. Since `energy (transposeParams θ) h v = energy θ v h`, the hidden
law of `θ` is the visible law of `transposeParams θ` (the identity behind the tied-weight
initialization of Hinton–Osindero–Teh, §3, p. 3, and §4, step 3, p. 5; proved here by the image of
the Gibbs measure under the swap of coordinates).

Let `θ' : Params κ κ'` be a second machine whose visible units are the hidden units of `θ`, with
`κ'` finite. Prove (`integral_log_visibleLaw_le_dbn`) that if `θ'` fits the aggregated posterior
at least as well as the transposed machine,

    ∫ h, log (visibleLaw (transposeParams θ)){h} ∂(q.bind (hiddenKernel θ))
      ≤ ∫ h, log (visibleLaw θ'){h} ∂(q.bind (hiddenKernel θ)),

then the two-layer deep belief network `(visibleLaw θ').bind (visibleKernel θ)` has average
log-likelihood under `q` at least that of `θ` (Hinton–Osindero–Teh, §4, pp. 5–6: learning the
higher-level machine from the transposed initialization never decreases the log probability of
the data). Route: the identity above and 4.1 with `p' = visibleLaw θ'`, which charges every
configuration (its masses are Gibbs weights).

**Checks.**

- The biases must be exchanged: for one unit in each layer with `W = log 3`, `b = log 2`,
  `c = 0`, the joint weights of `(v, h) = (0,0), (0,1), (1,0), (1,1)` are `1, 1, 2, 6`, so the
  hidden law is `(3/10, 7/10)`, which is the visible law of the transposed machine; keeping the
  biases in place would give `(1/5, 4/5)`.
- Standard example, `q = δ₁`, `θ'` with one hidden unit, weight `0`, visible bias `log 3` and
  hidden bias `0`: `visibleLaw θ' = (1/4, 3/4)`, the aggregated posterior itself; the hypothesis
  holds as in 4.1 and the network gives `v = 1` the probability `11/16 > 2/3`.

*Needs:* 4.1; Mathlib `Measure.map`, `Equiv.prodComm` (the swap of coordinates).

### Examples

- Stacking: applying 4.2 to the second machine in place of the first gives the guarantee for a
  third layer, with the aggregated posterior of the second machine as its data law.

### Dependencies

- No other layer; RestrictedBoltzmannMachines 1.1–1.2, QuantumOptimization 1.1,
  SimulatedAnnealing 3.1 (definitions).

## Layer 5: the free-energy view of EM

### 5.1 Global maxima of the free energy

Copy verbatim `obsLikelihood`, `obsLogLikelihood` and `missingLaw`
(MathematicalStatisticsSemiparametric 7.1). Let `Z` be finite with measurable singletons, `ρ` a
finite measure on `Z`, `Θ` a set of parameters in a finite-dimensional real inner product space
`E`, and `f : E → Z → ℝ` with `f θ z > 0` for every `θ ∈ Θ` and every `z`. The joint measure at
`θ` is `ρ.withDensity (ofReal ∘ f θ)`, and Neal and Hinton's function `F(q, θ)` is its evidence
lower bound `elbo (ρ.withDensity (ofReal ∘ f θ)) q` for probability measures `q ≪ ρ`
(Neal–Hinton, eq. (2), p. 4, for a finite range of the missing variable and a joint probability
that never vanishes).

The E-step is the identity of 1.3 for this joint measure: for `θ ∈ Θ` and a probability measure
`q ≪ ρ`, `integral_llr_tilted_right` with `ν = ρ` and the tilt `log (f θ)`, whose tilted measure
is `missingLaw ρ f θ`, gives `F(q, θ) = obsLogLikelihood ρ f θ − KL(q ‖ missingLaw ρ f θ)` (the
density of the joint measure with respect to `ρ` is `f θ`, `Measure.rnDeriv_withDensity`), so
`F(q, θ) ≤ obsLogLikelihood ρ f θ` with equality exactly when `q = missingLaw ρ f θ`
(`klDiv_eq_zero_iff`; Neal–Hinton, eq. (3) and Lemma 1, p. 4). This is the library's and is not
a target here.

The M-step is not a target either. For `θ, θ' ∈ Θ`, the E-step identity at `θ` with
`q = missingLaw ρ f θ'`, together with the identity of MathematicalStatisticsSemiparametric 7.2
(`TauCetiRoadmap.MathematicalStatisticsSemiparametric.emQ_sub_le_obsLogLikelihood_sub`, whose
hypotheses hold on a finite space with positive densities), gives
`F(missingLaw ρ f θ', θ) = Q(θ | θ') − Q(θ' | θ') + obsLogLikelihood ρ f θ'`, with `Q` the EM
criterion `TauCetiRoadmap.MathematicalStatisticsSemiparametric.emQ`. So a parameter is an EM step
from `θ'` in the sense of 7.1 exactly when it maximizes `F(missingLaw ρ f θ', ·)` over `Θ`
(Neal–Hinton, Lemma 2 and Theorem 1, p. 5, where this is read off their definition (2) of `F` as
an expected complete-data log-likelihood plus an entropy).

Let `q⋆ ≪ ρ` be a probability measure and `θ⋆ ∈ Θ`. Prove
(`elbo_le_iff_obsLogLikelihood_le`) that `(q⋆, θ⋆)` maximizes `F(q, θ)` over all probability
measures `q ≪ ρ` and all `θ ∈ Θ` if and only if `θ⋆` maximizes `obsLogLikelihood ρ f` over `Θ`
and `q⋆ = missingLaw ρ f θ⋆` (Neal–Hinton, Theorem 2, p. 6, the global part; the converse and the
identification of `q⋆` are proved here).

Route: by the E-step identity, `F(missingLaw ρ f θ, θ) = obsLogLikelihood ρ f θ ≥ F(q, θ)`.
If `(q⋆, θ⋆)` is a maximizer,
`F(q⋆, θ⋆) ≥ F(missingLaw ρ f θ⋆, θ⋆) = obsLogLikelihood ρ f θ⋆ ≥ F(q⋆, θ⋆)`, so equality holds,
`q⋆ = missingLaw ρ f θ⋆` by the equality case, and
`obsLogLikelihood ρ f θ = F(missingLaw ρ f θ, θ) ≤ F(q⋆, θ⋆) = obsLogLikelihood ρ f θ⋆`. The
missing laws used are probability measures absolutely continuous with respect to `ρ`, since
`ρ ≠ 0` (it dominates `q⋆`) and `f θ > 0`. Conversely,
`F(q, θ) ≤ obsLogLikelihood ρ f θ ≤ obsLogLikelihood ρ f θ⋆ = F(missingLaw ρ f θ⋆, θ⋆)`.

**Checks.**

- `Θ = {θ₁, θ₂}` with `f θ₁ = (1, 3)` and `f θ₂ = (1, 1)` on `{0, 1}`, `ρ` counting measure: the
  observed likelihoods are `4` and `2`, so the maximizers of `F` are `((1/4, 3/4), θ₁)` only, with
  `F = log 4`; the pair `((1/2, 1/2), θ₁)` has `F = (1/2) log 2 + (1/2) log 6 = (1/2) log 12`, and
  the pair `((1/2, 1/2), θ₂)` has `F = log 2`; neither is one.
- `q ≪ ρ` is needed: with `Θ = {θ}`, `ρ = δ₀`, `f θ = 1/2` and `q = δ₁`, Lean's `F(q, θ)` is
  `Real.log 0 = 0`, above `F(missingLaw ρ f θ, θ) = obsLogLikelihood ρ f θ = log(1/2)`.
- Positivity of `f θ` is needed: with `Θ = {θ}`, `ρ` counting measure, `f θ = (0, 1)` and `q`
  uniform, Lean's `F(q, θ) = (1/2) log 2 > 0 = obsLogLikelihood ρ f θ`, so the conditional law
  `(0, 1)` is not a maximizer.
- The M-step identity: with `f θ' = (1, 3)` and `ρ` counting measure, `m = missingLaw ρ f θ'` is
  `(1/4, 3/4)`; for `f θ = (1, 1)`, `F(m, θ) = (1/4) log 4 + (3/4) log(4/3)` and `Q(θ | θ') = 0`;
  for `θ = θ'`, `F(m, θ') = log 4` and `Q(θ' | θ') = (3/4) log 3`. Both differences are
  `log 4 − (3/4) log 3`, the entropy of `m`, although the two values of `F` differ.

*Needs:* 1.3 (`elbo`); MathematicalStatisticsSemiparametric 7.1 (definitions); Mathlib
`integral_llr_tilted_right`, `Measure.tilted`, `Measure.rnDeriv_withDensity`, `klDiv_eq_zero_iff`.

### Examples

- With `Θ` a single parameter, 5.1 says that the unique maximizer of `F` over the laws `q ≪ ρ` is
  the conditional law of the missing values, the equality case of the E-step identity.

### Dependencies

- Layer 1 (`elbo`); MathematicalStatisticsSemiparametric 7.1 (definitions).

## Scope and ownership

This roadmap owns the importance-weighted bounds (monotonicity, upper bound, convergence, equality
and strict increase), the identification of Mathlib's posterior with the normalized joint measure
for a likelihood with a density, the augmented proposal of Domke and Sheldon with its gap
identities, the bias bound for self-normalized importance sampling in terms of the
importance-weighted gap and the convergence of the selected sample, the greedy layer-wise bound for
deep belief networks, and the global maxima of the evidence lower bound of an EM model over laws
of the missing values and parameters jointly.

Already in the libraries or stated by other roadmaps, and used above:

- The evidence lower bound identity `elbo p r = log p(Z) − KL(r ‖ posterior)` is Mathlib's
  `integral_llr_tilted_right` for the tilt of `q` by `log w`, and "the bound is attained exactly at
  the posterior" is `klDiv_eq_zero_iff`; neither is a target. For the joint measure of an EM
  model they are the E-step (Neal–Hinton, Lemma 1), recalled and used in 5.1.
- ImportanceSamplingAndVarianceReduction 1.1 and 2.1 own the weight, the two estimates, the mean
  of the importance sampling estimate and the consistency of the self-normalized one; they are
  used above, not restated, and their variance theorems are not used.
- RestrictedBoltzmannMachines 1.1–1.2 own the machines and their conditional laws, used in Layer
  4; that roadmap places deep belief networks outside its scope.
- MathematicalStatisticsSemiparametric 7.1 owns the EM objects, copied in Layer 5, and 7.2 owns
  the EM identity and the monotonicity of EM
  (`TauCetiRoadmap.MathematicalStatisticsSemiparametric.emQ_sub_le_obsLogLikelihood_sub`,
  `TauCetiRoadmap.MathematicalStatisticsSemiparametric.obsLogLikelihood_le_of_isEMStep`). With the
  E-step identity, the first gives the M-step reading of EM recalled in 5.1 (Neal–Hinton, Lemma 2
  and Theorem 1); neither is restated, and the theorem of 5.1 does not use them.
- DenoisingDiffusion 1.1 (`klDiv_multivariateGaussian_smul_one`) gives the relative entropy of
  isotropic Gaussian laws, from which the closed form of the evidence lower bound of a Gaussian
  proposal against a Gaussian prior follows coordinate by coordinate; it is not restated. Its
  Layer 4 owns the path-space variational bound of diffusion models.
- Tau Ceti owns the Donsker–Varadhan variational formula and Pinsker's inequality; the latter is
  used in 3.4.

Outside the scope: the asymptotic rate of the importance-weighted gap (Domke–Sheldon, Theorem 3);
gradient estimators and reparameterization; the local-maximum part of Neal–Hinton's Theorem 2 and
incremental variants of EM; deep Boltzmann machines and the up-down fine-tuning of deep belief
networks; probabilistic principal component analysis; and every algorithm, program and running
time.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Probability/Kernel/Posterior.lean`: `ProbabilityTheory.posterior` (`κ†μ`, for a finite
  measure `μ` and a finite kernel `κ` on a standard Borel nonempty space),
  `ProbabilityTheory.ae_eq_posterior_of_compProd_eq` (a finite kernel `η` with
  `(κ ∘ₘ μ) ⊗ₘ η = (μ ⊗ₘ κ).map Prod.swap` equals `κ†μ` `(κ ∘ₘ μ)`-almost everywhere). Used in
  1.2. `ProbabilityTheory.posterior_eq_withDensity` (Bayes' formula with the Radon–Nikodym
  derivative of the kernel, under `CountableOrCountablyGenerated`) is the related library form
  that 1.2 does not use.
- `Mathlib/MeasureTheory/Measure/Prod.lean`: `MeasureTheory.lintegral_lintegral_swap` (Tonelli for
  s-finite measures and a.e.-measurable integrands). Used in 1.2, 3.1.
- `Mathlib/Probability/ProductMeasure.lean`: `Measure.infinitePi`,
  `measurePreserving_eval_infinitePi`, `Measure.infinitePi_map_restrict` (for probability
  measures). `Mathlib/Probability/Independence/InfinitePi.lean`: `iIndepFun_infinitePi`. Used in
  1.3, 2.1–2.3, 3.2, 3.4.
- `Mathlib/Probability/StrongLaw.lean`: `ProbabilityTheory.strong_law_ae` (integrable, pairwise
  independent, identically distributed). Used in 2.2.
- `Mathlib/MeasureTheory/Integral/Lebesgue/Add.lean`: `MeasureTheory.lintegral_liminf_le` (Fatou).
  Used in 2.2.
- `Mathlib/Analysis/Convex/Integral.lean`: `ConcaveOn.le_map_integral` (Jensen for a probability
  measure), `StrictConcaveOn.ae_eq_const_or_lt_map_average`.
  `Mathlib/Analysis/Convex/SpecificFunctions/Basic.lean`: `strictConcaveOn_log_Ioi`;
  `Mathlib/Analysis/SpecialFunctions/Log/Basic.lean`: `Real.log_le_sub_one_of_pos`. Used in 2.1,
  2.3, 4.1.
- `Mathlib/MeasureTheory/Measure/Decomposition/RadonNikodym.lean`: `Measure.rnDeriv_pos'`
  (`μ ≪ ν` gives `0 < dν/dμ` `μ`-a.e.; with `μ = q`, `ν = p` it is the positivity of the weight),
  `Measure.withDensity_rnDeriv_eq`; `Mathlib/MeasureTheory/Measure/Decomposition/Lebesgue.lean`:
  `Measure.rnDeriv_withDensity`. Used in 2.1, 2.3, 5.1.
- `Mathlib/MeasureTheory/Measure/GiryMonad.lean`: `Measure.bind`, `Measure.bind_apply`. Used in
  3.1, 4.1. `Mathlib/MeasureTheory/Constructions/Pi.lean`: `Measure.pi`.
  `Mathlib/Data/Fin/Tuple/Basic.lean`: `Fin.removeNth`. Used in 3.1.
- `Mathlib/InformationTheory/KullbackLeibler/Basic.lean`: `InformationTheory.klDiv`,
  `InformationTheory.klDiv_eq_zero_iff`, `InformationTheory.toReal_klDiv_of_measure_eq` (for
  `μ ≪ ν` of equal finite mass, `(klDiv μ ν).toReal = ∫ llr μ ν dμ`). Used in 3.2, 3.3, 5.1.
  `Mathlib/InformationTheory/KullbackLeibler/ChainRule.lean`:
  `InformationTheory.klDiv_compProd_eq_add`.
  Used in 3.3.
- `Mathlib/MeasureTheory/Measure/LogLikelihoodRatio.lean`:
  `MeasureTheory.integral_llr_tilted_right` (for a probability measure `μ ≪ ν`, `ν` σ-finite,
  `f ∈ L¹(μ)`, `exp ∘ f ∈ L¹(ν)` and `llr μ ν ∈ L¹(μ)`:
  `∫ llr μ (ν.tilted f) dμ = ∫ llr μ ν dμ − ∫ f dμ + log ∫ exp f dν`);
  `Mathlib/MeasureTheory/Measure/Tilted.lean`: `Measure.tilted`. Used in 1.3, 3.3, 5.1.
- `Mathlib/Probability/Kernel/Composition/MeasureCompProd.lean`: `Measure.compProd`,
  `Measure.compProd_const`. `Mathlib/MeasureTheory/Measure/Prod.lean`: `Measure.fst`. Used in
  1.2, 3.3.
- `Mathlib/MeasureTheory/Measure/TotalVariation/Basic.lean`:
  `MeasureTheory.tvDist_eq_integral_abs_rnDeriv_of_ac` (for finite `μ ≪ ν`,
  `tvDist μ ν = ∫ |1 − dμ/dν| dν`). Used in 3.4.
- `Mathlib/MeasureTheory/Integral/Bochner/SumMeasure.lean`: `integral_fintype`. Used in 4.1.

### From Tau Ceti

- `TauCeti/InformationTheory/KullbackLeibler/Pinsker.lean`: `TauCeti.etvDist_sq_le_two_mul_klDiv`
  (for probability measures, `etvDist μ ν ^ 2 ≤ 2 klDiv μ ν`, with no absolute continuity
  hypothesis). Used in 3.4.

### From TauCetiRoadmap.ImportanceSamplingAndVarianceReduction

- 1.1: `isWeight p q = (p.rnDeriv q ·).toReal` and `isEstimator p q f X n`, copied verbatim;
  `TauCetiRoadmap.ImportanceSamplingAndVarianceReduction.integral_mul_isWeight` (for finite `p`,
  σ-finite `q` and `f ∈ L¹(p)`,
  `∫ f w dq = ∫ f dp − ∫ f d(p.singularPart q)`). Used in 1.1, 1.3, 2.1, and through 2.1 in
  every later statement on the bounds.
- 2.1: `snisEstimator p q f X n`, copied verbatim. Used in 3.4.

### From TauCetiRoadmap.RestrictedBoltzmannMachines

- 1.1: `Params`, `energy`, `jointLaw`, `visibleLaw`, `hiddenLaw`; 1.2: `hiddenField`,
  `visibleField`, `hiddenKernel`, `visibleKernel`, all copied verbatim, and
  `TauCetiRoadmap.RestrictedBoltzmannMachines.jointLaw_eq_compProd`
  (`jointLaw θ = visibleLaw θ ⊗ₘ hiddenKernel θ` and, after the swap,
  `hiddenLaw θ ⊗ₘ visibleKernel θ`). Used in 4.1, 4.2.

### From TauCetiRoadmap.QuantumOptimization

- 1.1: `bit`, copied verbatim. Used in 4.1, 4.2.

### From TauCetiRoadmap.SimulatedAnnealing

- 3.1: `gibbs`, the Gibbs measure of an energy on a finite set, copied verbatim. Used in 4.1, 4.2.

### From TauCetiRoadmap.MathematicalStatisticsSemiparametric

- 7.1: `obsLikelihood ρ f θ = ∫ f θ dρ`, `obsLogLikelihood ρ f θ = log obsLikelihood ρ f θ` and
  `missingLaw ρ f θ = ρ.withDensity (ofReal (f θ / obsLikelihood ρ f θ))`, copied verbatim. Used
  in 5.1. The EM criterion `TauCetiRoadmap.MathematicalStatisticsSemiparametric.emQ`
  (`Q(θ | θ') = ∫ log (f θ) d(missingLaw ρ f θ')`) and the EM step
  `TauCetiRoadmap.MathematicalStatisticsSemiparametric.IsEMStep` are named in the M-step remark of
  5.1 and not copied.
- 7.2: `TauCetiRoadmap.MathematicalStatisticsSemiparametric.emQ_sub_le_obsLogLikelihood_sub`
  (for positive measurable densities with the stated integrability,
  `obsLogLikelihood ρ f θ − obsLogLikelihood ρ f θ' = Q(θ | θ') − Q(θ' | θ') +
  (klDiv (missingLaw ρ f θ') (missingLaw ρ f θ)).toReal`). Named in the M-step remark of 5.1.

## References

- Yuri Burda, Roger Grosse and Ruslan Salakhutdinov, *Importance weighted autoencoders*, ICLR
  2016; arXiv:1509.00519, version 4: eqs. (8)–(9), p. 3; Theorem 1, eq. (10), p. 4; proof in
  Appendix A, p. 10.
- Justin Domke and Daniel Sheldon, *Importance weighting and variational inference*, NeurIPS 2018;
  arXiv:1808.09034, version 3: Theorem 1 and eqs. (6)–(7), p. 3; Algorithm 1, eq. (8) and
  Theorem 2, p. 4; proofs in Appendix A.2, pp. 14–15, with Lemma 4, p. 15.
- Diederik P. Kingma and Max Welling, *Auto-encoding variational Bayes*, ICLR 2014;
  arXiv:1312.6114, version 11: §2.1, p. 2; §2.2 and eqs. (1)–(3), p. 3.
- Geoffrey E. Hinton, Simon Osindero and Yee-Whye Teh, *A fast learning algorithm for deep belief
  nets*, Neural Computation 18(7) (2006), 1527–1554; preprint (16 pages) at
  https://www.cs.toronto.edu/~hinton/absps/fastnc.pdf, whose page numbers are used above: §3,
  p. 3; §4 with eqs. (7)–(8) and the greedy steps, p. 5; eq. (9) and footnote 4, p. 6.
- Radford M. Neal and Geoffrey E. Hinton, *A view of the EM algorithm that justifies incremental,
  sparse, and other variants*, in M. I. Jordan (ed.), *Learning in Graphical Models*, Kluwer,
  1998, 355–368; preprint (14 pages) at https://www.cs.toronto.edu/~radford/ftp/emk.pdf, whose
  page numbers are used above: the finite range of the missing variable, §2, p. 3; eqs. (2)–(3)
  and Lemma 1, p. 4; Lemma 2 and Theorem 1, p. 5; Theorem 2, p. 6.

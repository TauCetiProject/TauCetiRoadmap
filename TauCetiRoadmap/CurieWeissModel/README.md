# Roadmap: the Curie–Weiss model

**Summary.** This roadmap studies the Curie–Weiss model, the mean-field Ising model on `N` spins
`σ_i = ±1` in which every pair of spins interacts with the same strength. At inverse temperature
`β` and external field `h` a configuration has probability proportional to
`exp(β M² / (2N) + h M)`, where `M = Σ_i σ_i` and `m_N = M/N` is the magnetisation. The coupling
is normalised so that the phase transition is at `β = 1`. The mean-field free energy is
`f_β(m) = −β m²/2 − s(m)`, with `s(m)` the entropy of a spin of mean `m`, and the pressure is
`ψ(β, h) = max over m ∈ [−1, 1] of (h m − f_β(m))`.

The headline theorems are these.

- *Thermodynamic limit.* For all real `β` and `h`, `(1/N) log Z_N(β, h) → ψ(β, h)`. For every
  interval `J ⊆ [−1, 1]` with nonempty interior, `(1/N) log P(m_N ∈ J)` tends to minus the
  infimum over `J` of the rate function `f_β(m) − h m + ψ(β, h)`.
- *The phase transition at `β = 1`.* For `β ≤ 1` the mean-field equation `tanh(β m) = m` has
  the single solution `0`, which is the only minimiser of `f_β`; at zero field, for every
  `ε > 0` there is `c > 0` with `P(|m_N| < ε) ≥ 1 − 2e^{−cN}` for all large `N`. For `β > 1`
  the equation has exactly three solutions `0, ±m*(β)` with `0 < m*(β) < 1` and
  `m*(β)² ≤ 3(β − 1)`, the minimisers of `f_β` are `±m*(β)`, and at zero field
  `P(| |m_N| − m*(β) | < ε) ≥ 1 − 2e^{−bN}` for some `b > 0` and all large `N`.
- *Finite-`N` concentration by an exchangeable pair.* For `N ≥ 1`, `β ≥ 0`, every `h` and every
  `ε > 0`, `P(|m_N − tanh(β m_N + h)| > 2ε) ≤ (2 + 2β)/(N ε²)`.
- *Slow mixing at low temperature.* There is a constant `C > 0` such that for every `β > 1` there
  is `r > 0` for which the Glauber dynamics of the zero-field model on `N ≥ 1` spins has mixing
  time `t_mix(1/4) ≥ C e^{rN}`.

The roadmap rests on three roadmaps. QuantumOptimization supplies spins and the Ising energy,
SimulatedAnnealing the Gibbs law of an energy on a finite set, and MarkovChainMixing the Glauber
dynamics of an arbitrary law with its reversibility, mixing times and the bottleneck bound.

Layer 1 defines the model, its free energy, pressure and rate function, and the spontaneous
magnetisation. Layer 2 solves the mean-field equation. Layer 3 proves the thermodynamic limit by
counting configurations with an elementary binomial–entropy estimate. Layer 4 derives the
concentration of the magnetisation from Layers 2 and 3, and proves the finite-`N` bound with one
step of the Glauber dynamics as an exchangeable pair. Layer 5 proves the exponential lower bound
on the mixing time from Layers 2 and 3 and the bottleneck bound.

## Conventions

- **Configurations.** `x : Fin N → Bool`; the spin `spin x i` is `−1` when `x i` is true and `1`
  otherwise (QuantumOptimization 1.1). `M(x) = Σ_i spin x i` and the magnetisation is
  `magnetization x = M(x)/N` (it is `0` when `N = 0`). `Fin N → Bool` carries the product
  σ-algebra, in which every set is measurable.
- **The energy and its normalisation.** `cwEnergy N β h` is `ising J (fun _ ↦ −h)` with
  `J i j = −β/(2N)` for ALL ordered pairs `(i, j)`, the diagonal included. Since `ising` sums
  `J i j · spin x i · spin x j` over ordered pairs, this is `−(β/(2N)) M² − h M`, because
  `Σ_{i,j} σ_i σ_j = M²`. It is the Hamiltonian of (FV, Definition 2.1, (2.2), p. 58) with the
  dimension parameter `d = 1/2`, so FV's `2dβ` is our `β` and FV's critical value
  `β_c = 1/(2d)` is our `β = 1`; every locator into FV below is read with this translation. The
  field is not multiplied by `β`, as in FV. The coupling `−β/N` would give FV's normalisation with
  `d = 1` and a transition at `β = 1/2`.
- **The law.** `curieWeiss N β h = gibbs (cwEnergy N β h) 1`, the Gibbs law of SimulatedAnnealing
  3.1 at inverse temperature `1`, so `curieWeiss N β h {x} ∝ exp(β M(x)²/(2N) + h M(x))`. Its
  normaliser is `partitionFunction N β h = Σ_x exp(−cwEnergy N β h x)`.
- **Relation to the Ising model on the complete graph.** Summing over unordered pairs of distinct
  sites, `Σ_{i<j} σ_i σ_j = (M² − N)/2`, so the law of `exp((β/N) Σ_{i<j} σ_i σ_j)`, the Ising law
  of the complete graph at inverse temperature `β/N` in the convention of (LPW, Section 3.3.5,
  (3.8)–(3.10)), is `curieWeiss N β 0`: the constant `−N/2` cancels in the normalisation. LPW's
  `α` in (LPW, Theorem 15.4) is our `β`.
- **Free energy.** `s(m) = Real.binEntropy ((1 + m)/2)`, which for `m ∈ [−1, 1]` is
  `−((1 − m)/2) log((1 − m)/2) − ((1 + m)/2) log((1 + m)/2)` with `0 log 0 = 0` (FV, Definition
  2.4, p. 61, with `e(m) = −m²/2`). `freeEnergy β m = −β m²/2 − s(m)`. Outside `[−1, 1]` Mathlib's
  `Real.binEntropy` takes junk values; every statement restricts `m` to `[−1, 1]`.
- **Temperature.** `β` and `h` are real throughout. The statements of Layers 2–4.2 hold for every
  real `β` in their range, negative `β` included; 4.3 assumes `β ≥ 0`, and Checks there show
  that the bound fails without it.
- **Chains.** The Glauber dynamics is `glauber (curieWeiss N β 0)` (MarkovChainMixing 6.1).
  Distances to stationarity and mixing times are those of MarkovChainMixing:
  `tvToStationary κ π t = max_x tvDist ((κ ^ t) x) π / 2` (1.2) and `mixingTime κ π ε ∈ ℕ∞`
  (1.3), the least `t` with `tvToStationary κ π t ≤ ε`; `t_mix = mixingTime κ π (1/4)`, as in
  (LPW, (4.31), p. 54).
- **Copied definitions.** A roadmap's Lean file cannot import another's, so `Suggested.lean`
  repeats, byte for byte, `spin` and `ising` (QuantumOptimization 1.1), `gibbs` (SimulatedAnnealing
  3.1), and `tvToStationary`, `mixingTime` and `glauber` (MarkovChainMixing 1.2, 1.3 and 6.1).
  Those roadmaps own them.
- **Sources.** `FV` is the book of Friedli and Velenik and `LPW` the book of Levin and Peres
  listed under References, with their printed page numbers.

## Layer 1: the Curie–Weiss law and the mean-field free energy

### 1.1 The Curie–Weiss law

Define `cwEnergy`, `curieWeiss`, `partitionFunction` and `magnetization` as in the Conventions.

- `curieWeiss N β h` is a probability measure giving every configuration positive mass
  `exp(−cwEnergy N β h x) / partitionFunction N β h`.
- Law of the magnetisation: the number of configurations with `k` spins `−1` is `C(N, k)`, and for
  them `M = N − 2k`. Hence, with `m_k = (N − 2k)/N` for `N ≥ 1`,
  `partitionFunction N β h = Σ_{k=0}^{N} C(N, k) exp(N (β m_k²/2 + h m_k))` and the law gives
  `m_N = m_k` the probability `C(N, k) exp(N (β m_k²/2 + h m_k)) / partitionFunction N β h`
  (FV, (2.9)–(2.10), p. 62, at `h = 0`; the same decomposition with a field opens the proof of FV,
  Theorem 2.8, p. 65).
- Spin-flip symmetry: at `h = 0` the law is invariant under `x ↦ (fun i ↦ !x i)`, which sends `M`
  to `−M`; so `m_N` has a symmetric law and mean `0` (FV, (2.3), p. 59).
- Heat-bath formula: for `N ≥ 1`, conditionally on the spins off a site `i`, the spin at `i` is
  `+1` with probability `(1 + tanh(β m̌_i + h))/2`, where `m̌_i = (1/N) Σ_{j ≠ i} σ_j`; the
  diagonal term `σ_i² = 1` of the energy does not depend on `σ_i` (FV, Section 2.5.2, p. 71).

**Checks.**

- `N = 1`: `M² = 1`, so `partitionFunction 1 β h = 2 e^{β/2} cosh h` and the mean spin is
  `tanh h`. The diagonal term contributes the factor `e^{β/2}`, which cancels in the law.
- `N = 2`, `h = 0`: `M ∈ {2, 0, 0, −2}` gives `partitionFunction 2 β 0 = 2e^β + 2`, and
  `m_N = 0` has probability `1/(1 + e^β)`. The coupling `−β/N` in place of `−β/(2N)` would give
  `2e^{2β} + 2`, the law at `2β`.
- `N = 3` and `N = 4`, `h = 0`: `partitionFunction 3 β 0 = 6e^{β/6} + 2e^{3β/2}` and
  `partitionFunction 4 β 0 = 8e^{β/2} + 2e^{2β} + 6`. For `N ≤ 4` the law agrees exactly with the
  Ising law of the complete graph at `β/N` (unordered pairs, no diagonal), as the Conventions
  predict.
- `β = 0`: `partitionFunction N 0 h = (2 cosh h)^N`, and the law is the product of `N` spins of
  mean `tanh h`.
- Heat-bath formula from the definition: the two configurations that agree off `i` have
  `M = N m̌_i ± 1`, so their weights `exp(β M²/(2N) + h M)` are in the ratio
  `exp(2(β m̌_i + h))`, and `e^{2a}/(e^{2a} + 1) = (1 + tanh a)/2`.

*Needs:* QuantumOptimization 1.1 (`spin`, `ising`); SimulatedAnnealing 3.1 (`gibbs`); Mathlib
`Matrix.of`, `Nat.choose`, `Real.tanh_eq`.

### 1.2 The free energy, the pressure and the spontaneous magnetisation

Define

- `freeEnergy β m = −β m²/2 − Real.binEntropy ((1 + m)/2)`, the free energy `f_β` (FV, (2.5),
  p. 61);
- `pressure β h = sSup ((fun m ↦ h m − freeEnergy β m) '' [−1, 1])`, the variational pressure
  `ψ(β, h)` (FV, (2.14), p. 65);
- `rateFunction β h m = freeEnergy β m − h m + pressure β h`, the rate function (FV, (2.8),
  p. 61, at `h = 0`, and (2.19), p. 68, with a field);
- `spontaneousMagnetization β = sSup {m ∈ [0, 1] | tanh(β m) = m}`, written `m*(β)`.

API:

- `m ↦ h m − freeEnergy β m` is continuous on `ℝ` (Mathlib `Real.binEntropy_continuous`), so on
  the compact interval `[−1, 1]` its supremum `pressure β h` is attained; `rateFunction β h` is
  nonnegative on `[−1, 1]` and vanishes exactly at the maximisers.
- `freeEnergy β` is even, and differentiable on `(−1, 1)` with derivative
  `artanh m − β m` (from Mathlib `Real.deriv_binEntropy`); so its critical points in `(−1, 1)`
  are the solutions of the mean-field equation `tanh(β m) = m` (FV, (2.12), p. 63).
- `h ↦ pressure β h` is convex, as a supremum of affine functions, and
  `pressure β 0 = −min_{[−1, 1]} freeEnergy β` (FV, Theorem 2.8, p. 65).
- The set defining `m*(β)` contains `0` and lies in `[0, 1]`, so `m*(β) ∈ [0, 1]`.

**Checks.**

- `s(0) = log 2` and `s(±1) = 0`, so `freeEnergy β 0 = −log 2` and `freeEnergy β (±1) = −β/2`.
- `β = 0`: `pressure 0 h = log(2 cosh h)`, attained at `m = tanh h`; this is
  `(1/N) log partitionFunction N 0 h` for every `N ≥ 1`, by the last Check of 1.1.
- The junk values matter: Mathlib's `Real.log` is `log |x|` on negative numbers, so
  `Real.binEntropy (3/2) = −(3/2) log 3 + log 2`, and with `pressure 1 0 = log 2` (2.1)
  `rateFunction 1 0 2 = −2 − Real.binEntropy (3/2) + log 2 = (3/2) log 3 − 2`, which is negative
  because `27 < e⁴`; so the rate function is not nonnegative off `[−1, 1]`.

*Needs:* Mathlib `Real.binEntropy`, `Real.binEntropy_continuous`, `Real.deriv_binEntropy`,
`Real.binEntropy_one_sub`, `Real.artanh`, `Real.tanh_artanh`, `IsCompact.exists_isMaxOn`.

### Examples

- At `β = 2`: `tanh(2 · ½) = tanh 1 = (e² − 1)/(e² + 1) > ½` because `e² > 3`, so the function
  `m ↦ tanh(2m) − m` is positive at `½` and negative at `1`; hence `½ < m*(2) < 1`.

### Dependencies

1.1 uses QuantumOptimization 1.1 and SimulatedAnnealing 3.1; 1.2 uses Mathlib only.

## Layer 2: the mean-field equation

### 2.1 High temperature: a single solution

Prove `setOf_tanh_mul_eq_self_of_le_one`: for every real `β ≤ 1` the only real solution of
`tanh(β m) = m` is `m = 0`, and `0` is the only minimiser of `freeEnergy β` on `[−1, 1]` (FV,
proof of Theorem 2.2, p. 63, where the count of solutions is read off a figure).
(Proved here.)

Route: for `m > 0`, `tanh(β m) < m`: if `β ≤ 0` then `tanh(β m) ≤ 0 < m`, and if `0 < β ≤ 1` then
`tanh(β m) < β m ≤ m`, because `t ↦ t − tanh t` vanishes at `0` and has derivative
`tanh² t > 0` for `t ≠ 0` (the derivative `1 − tanh² t` of `tanh = sinh/cosh` by the quotient
rule). By oddness the same holds for `m < 0`. For the minimiser: on `(0, 1)` the derivative
`artanh m − β m` of 1.2 is positive, since `artanh m > m` there (the derivative of
`artanh m − m` is `m²/(1 − m²) > 0`, by Tau Ceti's `Real.hasDerivAt_artanh`) and `β m ≤ m`; so
`freeEnergy β` is strictly increasing on `[0, 1]` (it is continuous at `1`), and by evenness
strictly decreasing on `[−1, 0]`.

**Checks.**

- `β = 1` is included: `tanh m < m` for `m > 0`, so `m*(1) = 0`; the zero of `freeEnergy 1 + log 2`
  at `0` is of order four, since `artanh m − m = m³/3 + O(m⁵)`.
- `β ≤ 1` gives `spontaneousMagnetization β = sSup {0} = 0`.

*Needs:* 1.2; Mathlib `Real.tanh_eq_sinh_div_cosh`, `Real.hasDerivAt_sinh`,
`Real.hasDerivAt_cosh`, `Real.artanh`; Tau Ceti `Real.hasDerivAt_artanh`.

### 2.2 Low temperature: three solutions

Prove `spontaneousMagnetization_spec`: for `β > 1`, `0 < m*(β) < 1`, the real solutions of
`tanh(β m) = m` are exactly `−m*(β)`, `0` and `m*(β)`, the minimisers of `freeEnergy β` on
`[−1, 1]` are exactly `±m*(β)`, and `m*(β)² ≤ 3(β − 1)` (FV, proof of Theorem 2.2, pp. 63–64,
again from a figure, and Remark 2.6, (2.13), p. 64, for `m*(β) → 0` as `β ↓ 1`). (Proved here.)

Route: a solution has `|m| < 1` because `|tanh| < 1` (Mathlib `Real.tanh_lt_one`), and on
`(−1, 1)` it is a zero of `φ(m) = artanh m − β m` (apply `artanh`, Mathlib `Real.artanh_tanh`).
By Tau Ceti's `Real.hasDerivAt_artanh`, `φ` is differentiable on `(−1, 1)`. On `[0, 1)`,
`φ(0) = 0`, `φ'(m) = 1/(1 − m²) − β` is negative below `m₁ = √(1 − 1/β)` and positive above it,
and `φ(m) → +∞` as `m → 1` (Mathlib's `Real.artanh_eq_half_log`). So `φ < 0` on `(0, m₁]`
and `φ` has exactly one zero in `(m₁, 1)`, call it `m₀`, with `φ < 0` on `(0, m₀)` and `φ > 0`
on `(m₀, 1)`. Oddness gives the negative solutions. The set defining `m*(β)` is `{0, m₀}`, so
`m*(β) = m₀`. Since `φ = (freeEnergy β)'` on `(−1, 1)`, `freeEnergy β` decreases on `[0, m₀]`
and increases on `[m₀, 1]`; with evenness its minimisers on `[−1, 1]` are `±m₀`. Finally
`artanh m ≥ m + m³/3` on `[0, 1)` (the derivative of the difference is `m⁴/(1 − m²) ≥ 0`), so
`β m₀ = artanh m₀ ≥ m₀ + m₀³/3`, which gives `m₀² ≤ 3(β − 1)`.

**Checks.**

- The constant `3` cannot be lowered: (FV, Theorem 2.9, (2.24), p. 75), translated by the
  Conventions, gives `m*(β)² β³/(3(β − 1)) → 1` as `β ↓ 1`.
- At `β = 2`, Examples of Layer 1 give `m*(2) > ½`, and the bound gives `m*(2)² ≤ 3`; at
  `β = 1 + δ` the bound gives `m*(β) ≤ √(3δ)`, the continuity of the transition at `β = 1`.
- `0` is not a minimiser for `β > 1`: `freeEnergy β m − freeEnergy β 0 = −(β − 1) m²/2 + O(m⁴)`,
  which is negative for small `m ≠ 0`.

*Needs:* 1.2; Mathlib `Real.tanh_lt_one`, `Real.artanh`, `Real.artanh_tanh`,
`Real.artanh_eq_half_log`; Tau Ceti `Real.hasDerivAt_artanh`.

### Examples

- The figure argument of FV becomes, in both regimes, the sign pattern of `φ = (freeEnergy β)'`
  on `(0, 1)`: positive throughout for `β ≤ 1`, negative then positive for `β > 1`.

### Dependencies

2.1 and 2.2 use 1.2.

## Layer 3: the thermodynamic limit

### 3.1 The pressure

Prove `tendsto_log_partitionFunction_div`: for all real `β` and `h`,
`(1/N) log partitionFunction N β h → pressure β h` as `N → ∞` (FV, Proposition 2.5, (2.6),
p. 61, proof pp. 62–63, at `h = 0`; FV, Theorem 2.8, (2.14), p. 65, with a field, where the lower
bound is only sketched). (Proved here: the route below replaces the Stirling estimate (2.11) of
FV, which is FV's Exercise 2.1, p. 62, and is printed without proof.)

Route, with `g(m) = h m − freeEnergy β m`:

- *Binomial–entropy estimate.* For `N ≥ 1` and `0 ≤ k ≤ N`, with `p = k/N`,
  `e^{N binEntropy p}/(N + 1) ≤ C(N, k) ≤ e^{N binEntropy p}`. Upper bound: the term
  `C(N, k) p^k (1 − p)^{N−k}` of the binomial expansion of `(p + (1 − p))^N = 1` (Mathlib
  `add_pow`) is at most `1`, and it equals `C(N, k) e^{−N binEntropy p}` (with `0^0 = 1` when
  `p ∈ {0, 1}`). Lower bound: the `N + 1` terms `b_j = C(N, j) p^j (1 − p)^{N−j}` sum to `1`, and
  `b_k` is the largest, because for `p ∈ (0, 1)` the ratio `b_{j+1}/b_j = (N − j)p/((j + 1)(1 − p))`
  is at least `1` exactly when `j ≤ k − 1 + p`, that is when `j ≤ k − 1`; for `p ∈ {0, 1}`,
  `b_k = 1`.
- By `Real.binEntropy_one_sub`, `binEntropy (k/N) = s(m_k)`, so the term of index `k` in the
  law of the magnetisation (1.1) lies between `e^{N g(m_k)}/(N + 1)` and `e^{N g(m_k)}`.
- Upper bound: `partitionFunction N β h ≤ (N + 1) e^{N ψ(β, h)}`.
- Lower bound: let `m⁰ ∈ [−1, 1]` attain `ψ` (1.2) and `k` be such that `|m_k − m⁰| ≤ 1/N`
  (consecutive `m_k` are `2/N` apart and run from `−1` to `1`). Then
  `(1/N) log partitionFunction N β h ≥ g(m_k) − log(N + 1)/N`, and `g(m_k) → g(m⁰)` by uniform
  continuity of `g` on `[−1, 1]`.

**Checks.**

- `β = 0`: both sides are `log(2 cosh h)` for every `N ≥ 1` (1.1 and 1.2).
- Agreement with the library's variational principle: Tau Ceti's
  `TauCeti.klDiv_tilted_neg_add_ofReal_neg_log`, applied with the uniform law as reference measure
  and `f = cwEnergy − min cwEnergy ≥ 0`, gives `log partitionFunction N β h ≥ E_q[−H] + Ent(q)`
  for every law `q`, with equality at `curieWeiss N β h`. For the product law `q` of `N` spins of
  mean `m ∈ [−1, 1]`, `E_q[M²] = N²m² + N(1 − m²)`, so
  `E_q[−H] + Ent(q) = N g(m) + β(1 − m²)/2`. Hence for `β ≥ 0`,
  `(1/N) log partitionFunction N β h ≥ pressure β h` at every `N ≥ 1`.
- For `β < 0` that finite-`N` inequality fails and only the limit holds: at `h = 0`,
  `pressure β 0 = log 2` (2.1), while every term `exp(β M²/(2N))` of `partitionFunction N β 0` is
  at most `1`, and strictly less for the all-`+1` configuration, so
  `partitionFunction N β 0 < 2^N` for every `N ≥ 1`.
- The binomial–entropy estimate at `N = 2`, `k = 1`: `binEntropy ½ = log 2`, and
  `4/3 ≤ C(2, 1) = 2 ≤ 4`.

*Needs:* 1.1, 1.2; Mathlib `add_pow`, `Real.binEntropy_one_sub`, `IsCompact.exists_isMaxOn`; Tau
Ceti `TauCeti.klDiv_tilted_neg_add_ofReal_neg_log` (Checks only).

### 3.2 The magnetisation on intervals

Prove `tendsto_log_measureReal_magnetization_mem_div`: let `β, h` be real and `J ⊆ [−1, 1]` an
interval (`Set.OrdConnected`) with nonempty interior. Then
`(1/N) log curieWeiss N β h (m_N ∈ J) → −inf_J rateFunction β h` (FV, Proposition 2.5, (2.7),
p. 61, at `h = 0`, where the passage to intervals is "a similar computation", p. 63; FV,
Exercise 2.5, (2.19), p. 68, with a field, without proof). (Proved here.)

The interval must have nonempty interior. FV state (2.7) for every interval, and that is false for
one-point intervals: for `J = {m₀}` with `m₀` irrational and `m₀ ≠ 0`, at `β = h = 0`, the
probability is `0` for every `N`, so the left side is `0` (Mathlib's `log 0 = 0`), while the right
side is `−rateFunction 0 0 m₀ < 0`.

Route: with `g` as in 3.1, `−inf_J rateFunction β h = sup_J g − ψ(β, h)`, and by 3.1 it suffices
to show `(1/N) log Σ_{k : m_k ∈ J} C(N, k) e^{N(β m_k²/2 + h m_k)} → sup_J g`.

- Upper bound: the sum has at most `N + 1` terms, each at most `e^{N sup_J g}` (3.1).
- Lower bound: since `J` is an interval with nonempty interior, `sup_J g = sup` of `g` over the
  interior of `J`, by continuity of `g` (the closure of the interior of `J` is the closure of
  `J`). Given `δ > 0`, take `m⁰` in the interior with `g(m⁰) > sup_J g − δ` and a closed interval
  of positive length around `m⁰` inside `J` on which `g > sup_J g − 2δ`; for large `N` it contains
  some `m_k`, and that term is at least `e^{N(sup_J g − 2δ)}/(N + 1)`.

The route covers closed, open and half-open intervals alike, endpoints at `±1` (where `m_k = ±1`
occurs for every `N`) and endpoints at a maximiser of `g`.

**Checks.**

- `β = h = 0`, `J = [½, 1]`: `s(½) = 2 log 2 − (3/4) log 3` and the rate `log 2 − s(m)` increases
  in `|m|`, so the limit is `−(log 2 − s(½)) = −((3/4) log 3 − log 2)`, the Cramér rate of a fair
  `±1` coin at `½`, which is negative because `16 < 27`.
- Not an interval: `J = {0} ∪ [½, 1]` at `β = h = 0` has nonempty interior, but along even `N`
  the probability is at least `P(m_N = 0) ≥ 1/(N + 1)`, so `(1/N) log P → 0`, while along odd `N`
  it is `P(m_N ≥ ½)` and `(1/N) log P → −((3/4) log 3 − log 2) < 0`: there is no limit. So
  `Set.OrdConnected` is needed.
- `J ⊆ [−1, 1]` is needed: for `J = [−2, 2]`, `β = 1`, `h = 0` the probability is `1`, so the
  left side is `0`, while `rateFunction 1 0 2 < 0` (1.2) makes the right side positive.
- An interval with an endpoint at a minimiser of the rate function: at `β = 2`, `h = 0`,
  `J = [m*(2), 1]` gives the limit `0`.

*Needs:* 1.1, 1.2, 3.1; Mathlib `Set.OrdConnected`, `interior`, `Real.binEntropy_continuous`.

### Examples

- `β = 2`, `h = 0`, `J = (−⅕, ⅕)`: `freeEnergy 2` is even and decreases on `[0, m*(2)]` (2.2),
  and `m*(2) > ½` (Examples of Layer 1), so the infimum of the rate over `J` is its value at the
  endpoints and the limit is `−(freeEnergy 2 (⅕) − freeEnergy 2 (m*(2)))`, which is negative
  because `⅕ < m*(2)`: below the critical temperature a magnetisation near `0` is exponentially
  unlikely.

### Dependencies

3.1 uses 1.1 and 1.2; 3.2 uses 3.1.

## Layer 4: concentration of the magnetisation

### 4.1 High temperature

Prove `exists_one_sub_two_mul_exp_le_measureReal_abs_magnetization_lt`: for real `β ≤ 1` and
`ε > 0` there is `c > 0` such that `curieWeiss N β 0 (|m_N| < ε) ≥ 1 − 2 e^{−cN}` for all large
`N` (FV, Theorem 2.2, item 1, p. 59, proof p. 63, where `β ≤ β_c` includes the critical point).

Route: the probability is nondecreasing in `ε`, so take `ε < 1`. At `h = 0`,
`rateFunction β 0 m = freeEnergy β m − freeEnergy β 0` by 2.1, and it is positive on
`[−1, −ε] ∪ [ε, 1]` (2.1), hence at least some `r > 0` there by compactness. Apply 3.2 to each of
the two intervals: each has probability at most `e^{−N r/2}` for large `N`. Take `c = r/2`.

**Checks.**

- Spin-flip symmetry (1.1) makes the two intervals equally likely.
- Consequence: for `β ≤ 1`, `m_N → 0` in probability; by 4.2 this fails for every `β > 1`
  (FV, Remark 2.3, p. 60).

*Needs:* 2.1, 3.2.

### 4.2 Low temperature

Prove `exists_one_sub_two_mul_exp_le_measureReal_abs_abs_magnetization_sub_lt`: for `β > 1` and
every `ε > 0` there is `b > 0` such that
`curieWeiss N β 0 (| |m_N| − m*(β) | < ε) ≥ 1 − 2 e^{−bN}` for all large `N` (FV, Theorem 2.2,
item 2, p. 59, proof pp. 63–64). FV state it for all small enough `ε`; the event grows with `ε`,
so it holds for every `ε > 0`. The event is `m_N ∈ (−m* − ε, −m* + ε) ∪ (m* − ε, m* + ε)`.

Route: take `ε < min(m*, 1 − m*)` (2.2 gives `0 < m* < 1`). The complement in `[−1, 1]` is the
union of the three intervals `[−1, −m* − ε]`, `[−m* + ε, m* − ε]`, `[m* + ε, 1]`, each with
nonempty interior, on which `rateFunction β 0` is at least some `r > 0`, because its zeros on
`[−1, 1]` are `±m*` (2.2). By 3.2 the three probabilities are at most `e^{−N r/2}` each for large
`N`, and `3 e^{−N r/2} ≤ 2 e^{−N r/4}` for large `N`. Take `b = r/4`.

**Checks.**

- Each of the two peaks carries probability tending to `½`, by the spin-flip symmetry of 1.1;
  the mean of `m_N` stays `0`.
- `β = 2`, `ε = ¼`: since `m*(2) > ½` (Examples of Layer 1), the event forces `|m_N| > ¼`, so
  the probability of `|m_N| ≤ ¼` decays exponentially, in contrast with 4.1.

*Needs:* 2.2, 3.2.

### 4.3 Concentration at finite `N` by an exchangeable pair

Prove `measureReal_two_mul_lt_abs_magnetization_sub_tanh_le`: for `N ≥ 1`, `β ≥ 0`, real `h` and
`ε > 0`,
`curieWeiss N β h (|m_N − tanh(β m_N + h)| > 2ε) ≤ (2 + 2β)/(N ε²)` (FV, Section 2.5.2, "Stein's
method for exchangeable pairs", pp. 71–72, after Chatterjee; FV write the constant `2 + 4dβ`,
which is `2 + 2β` here, and require `N` large enough, which is not needed).

Route. Let `μ = curieWeiss N β h` and `K = glauber μ`. Draw `x` from `μ` and `x'` from `K x`.

- The pair is exchangeable: `K` is reversible for `μ`
  (`TauCetiRoadmap.MarkovChainMixing.isReversible_glauber`), so the law of `(x, x')` is symmetric.
  `K` is a Markov kernel (`TauCetiRoadmap.MarkovChainMixing.isMarkovKernel_glauber`, `N ≥ 1`).
- By the heat-bath formula of 1.1 (every configuration has positive mass, so the null branch of
  `glauber` does not occur), `K x` picks a uniform site `i` and redraws `σ_i` with mean
  `tanh(β m̌_i + h)`.
- With `F(x, x') = Σ_i (σ_i − σ'_i)`, `|F| ≤ 2`, and its conditional mean given `x` is
  `f(x) = (1/N) Σ_i (σ_i − tanh(β m̌_i + h))`. When `F ≠ 0`, `x` and `x'` differ at one site, so
  `|f(x) − f(x')| ≤ 2/N + (N − 1)/N · 2β/N ≤ (2 + 2β)/N`, since `tanh` is 1-Lipschitz and
  `β ≥ 0`.
- Exchangeability and the tower property give `E[f(x) g(x)] = ½ E[F (g(x) − g(x'))]` for every
  `g`; with `g = 1` this is `E f = 0`, and with `g = f` it gives `Var(f) ≤ (2 + 2β)/N`.
  Chebyshev (Mathlib `ProbabilityTheory.meas_ge_le_variance_div_sq`) gives
  `μ(|f| ≥ ε) ≤ (2 + 2β)/(N ε²)`.
- `|m̌_i − m_N| = 1/N`, so `|f − (m_N − tanh(β m_N + h))| ≤ β/N`. If `β ≤ N ε`, the event
  `|m_N − tanh(β m_N + h)| > 2ε` lies in `|f| ≥ ε`. If `β > N ε` and `ε ≤ 1`, the right side
  exceeds `2/ε ≥ 2`; if `ε > 1` the event is empty, since `|m_N| ≤ 1` and `|tanh| < 1`.

**Checks.**

- `N = 1`: `m̌_1 = 0`, so `f(x) = σ_1 − tanh h`, `E f = tanh h − tanh h = 0` by 1.1, and
  `E[f²] = 1 − tanh² h`, which is at most `2 + 2β`, as the route predicts.
- `N ≥ 1` is needed: for `N = 0` there is one configuration, `m_N = 0`, and at `β = 0`, `h = 1`,
  `ε = ¼` the left side is `1` (as `tanh 1 > ½`) while the right side is `2/0 = 0` in Lean.
- `β ≥ 0` is needed: at `N = 1`, `β = −1`, `h = 1`, `ε = ¼` both configurations satisfy the event
  (`|1 − tanh 0| = 1` and `|−1 − tanh 2| > 1`), so the left side is `1`, while the right side is
  `0`.
- At `N = 1` and `ε ≤ 1` the right side is at least `2`, so the bound says nothing there; it is
  informative for `N > (2 + 2β)/ε²`.

*Needs:* 1.1; MarkovChainMixing 6.1 (`glauber`,
`TauCetiRoadmap.MarkovChainMixing.isMarkovKernel_glauber`,
`TauCetiRoadmap.MarkovChainMixing.isReversible_glauber`);
Mathlib `ProbabilityTheory.meas_ge_le_variance_div_sq`, `Real.tanh_eq`.

### Examples

- `h = 0`, `β > 1`: the bound puts `m_N` near a solution of `tanh(β m) = m`, that is near
  `0, ±m*(β)` (2.2), with an error of order `N^{−1/2}`; 4.2 says that the solution `0` carries
  exponentially little mass.

### Dependencies

4.1 uses 2.1 and 3.2; 4.2 uses 2.2 and 3.2; 4.3 uses 1.1 and MarkovChainMixing 6.1.

## Layer 5: slow mixing of the Glauber dynamics

### 5.1 Exponential mixing time at low temperature

Prove `exists_ceil_mul_exp_le_mixingTime_glauber_curieWeiss`: there is `C > 0` such that for
every `β > 1` there is `r > 0` with `⌈C e^{rN}⌉₊ ≤ t_mix(1/4)` for the chain
`glauber (curieWeiss N β 0)` and every `N ≥ 1` (LPW, Theorem 15.4(ii), p. 218, proof there, for
the complete graph at `β = α/n` with `α > 1`, which is this chain at `β = α` by the Conventions;
LPW's proof estimates the binomial factors with Stirling's formula and an `o(1)`, replaced here by
the estimate of 3.1).

Route. Let `μ = curieWeiss N β 0`, `κ = glauber μ`, `S = {x | M(x) < 0}`.

- `κ` is a Markov kernel and `μ` is stationary, from
  `TauCetiRoadmap.MarkovChainMixing.isMarkovKernel_glauber` and
  `TauCetiRoadmap.MarkovChainMixing.isReversible_glauber` with Mathlib
  `ProbabilityTheory.Kernel.IsReversible.invariant`. By
  `TauCetiRoadmap.MarkovChainMixing.ceil_le_mixingTime_of_bottleneckRatio` (LPW, Theorem 7.4,
  p. 90), `⌈1/(4Φ⋆)⌉₊ ≤ t_mix(1/4)`, where `Φ⋆` is the bottleneck ratio of MarkovChainMixing 3.1.
- `Φ⋆ > 0`: from any set `A` with `0 < μ(A) ≤ ½` some configuration of `A` has a single-spin-flip
  neighbour outside `A`, and that move has positive probability; there are finitely many sets.
  `S` is admissible: it contains the all-`−1` configuration, and `μ(S) ≤ ½` by the spin-flip
  symmetry of 1.1, which maps `S` onto the disjoint set `{M > 0}`. So `Φ⋆ ≤ Φ(S)`.
- One step changes `M` by `0` or `±2`, so a step leaves `S` only from a configuration with
  `M ∈ {−1, −2}`; their total mass is at most `2^N e^{2β}/partitionFunction N β 0`, using the law
  of 1.1 and `C(N, k) ≤ 2^N`.
- `μ(S)` is at least the mass of the level `m_k ∈ [−1, 0)` nearest to `−m*(β)`, which by 3.1 is at
  least `e^{N g(m_k)}/((N + 1) partitionFunction N β 0)` with `g = −freeEnergy β`. By 2.2,
  `g(−m*) − log 2 = freeEnergy β 0 − freeEnergy β m* =: 2δ > 0`, and `g(m_k) ≥ log 2 + δ` for
  large `N` by continuity, since `|m_k + m*| ≤ 2/N`.
- So `Φ(S) ≤ (N + 1) e^{2β} e^{−Nδ}` for `N ≥ N₀`. For every `N ≥ 1`, `t_mix(1/4) ≥ 1`, because
  `tvToStationary κ μ 0 = 1 − min_x μ{x} ≥ ½ > ¼`
  (`TauCetiRoadmap.MarkovChainMixing.mixingTime_le_iff` at `t = 0`). Take `C = ½`, choose
  `N₁ ≥ N₀` with `e^{Nδ/2} ≥ 2(N + 1) e^{2β}` for `N ≥ N₁`, and
  `r = min(δ/2, (log 2)/N₁)`. For `N ≥ N₁`, `½ e^{rN} ≤ e^{Nδ}/(4(N + 1)e^{2β}) ≤ 1/(4Φ⋆)`; for
  `N < N₁`, `½ e^{rN} ≤ 1`. Conclude with Mathlib `Nat.ceil_le`.

**Checks.**

- `N = 2`, with `q = e^β`: `S` is the single configuration with both spins `−1`, of mass
  `q/(2q + 2) ≤ ½`. From it the chosen spin sees `m̌ = −½` and becomes `+1` with probability
  `(1 + tanh(−β/2))/2 = 1/(1 + q)`, so `Φ(S) = 1/(1 + q)` and the bottleneck bound gives
  `t_mix(1/4) ≥ ⌈(1 + q)/4⌉₊`. Iterating the 4 × 4 transition matrix in rational arithmetic, the
  least `t` with `tvToStationary κ μ t ≤ ¼` is `3`, `6` and `11` at `q = 3`, `7` and `15`, against
  the bounds `1`, `2` and `4`.
- `β > 1` is needed: at `β = 0` the chain is the hypercube walk of MarkovChainMixing 5.3, whose
  separation bound `n(1 − 1/n)^t` gives `t_mix(1/4) ≤ ⌈N log(4N)⌉`, so no exponential lower bound
  holds.
- `N = 1`: the two configurations have mass `½` and `t_mix(1/4) = 1`, so the constant must
  satisfy `⌈C e^r⌉₊ ≤ 1`, which the choice `C = ½` and `r ≤ log 2` meets.

*Needs:* 1.1, 2.2, 3.1 (the binomial–entropy estimate and the law of the magnetisation);
MarkovChainMixing 1.2 (`tvToStationary`), 1.3 (`mixingTime`,
`TauCetiRoadmap.MarkovChainMixing.mixingTime_le_iff`), 3.1
(`TauCetiRoadmap.MarkovChainMixing.ceil_le_mixingTime_of_bottleneckRatio`), 6.1 (`glauber`,
`TauCetiRoadmap.MarkovChainMixing.isMarkovKernel_glauber`,
`TauCetiRoadmap.MarkovChainMixing.isReversible_glauber`); Mathlib
`ProbabilityTheory.Kernel.IsReversible.invariant`, `Nat.ceil_le`.

### Examples

- The bottleneck is the level `M = 0`: at `β > 1` the law of `m_N` has two peaks near `±m*(β)`
  (4.2) separated by a valley of depth `2δ` per spin, and the chain moves `m_N` by `2/N` per step.

### Dependencies

5.1 uses 1.1, 2.2, 3.1 and MarkovChainMixing 1.2, 1.3, 3.1, 6.1.

## Scope and ownership

This roadmap owns the Curie–Weiss law in the normalisation with the transition at `β = 1`, its
mean-field free energy, pressure, rate function and spontaneous magnetisation, the solutions of
the mean-field equation, the thermodynamic limit of the pressure and of the magnetisation on
intervals, the concentration of the magnetisation on both sides of the transition, the
exchangeable-pair bound at finite `N`, and the exponential lower bound on the mixing time of the
Glauber dynamics of the complete graph at low temperature.

Left to other roadmaps and to the libraries:

- spins and the Ising energy are QuantumOptimization (1.1), and Gibbs laws of an energy on a
  finite set are SimulatedAnnealing (3.1); this roadmap copies their definitions;
- the Glauber dynamics of an arbitrary law with its Markov property and reversibility, mixing
  times, the bottleneck bound and the hypercube walk are MarkovChainMixing (1.2, 1.3, 3.1, 5.3,
  6.1); this roadmap applies them and restates none;
- the Gibbs variational principle on a finite set is Tau Ceti's
  `TauCeti.klDiv_tilted_neg_add_ofReal_neg_log`, used above in a Check only.

Not treated here: the fluctuations of the magnetisation (the central limit theorem at `β < 1` and
the non-Gaussian scaling limit at `β = 1`); critical exponents; the concentration of the
magnetisation at the maximiser of `h m − freeEnergy β m` in a nonzero field, and the derivatives
of the pressure; equivalence of ensembles; the general theory of large deviations (Cramér's and
Sanov's theorems, Varadhan's lemma, exponential tilting, the method of types); fast mixing of the
Glauber dynamics at high temperature; Ising models with real-valued spins, correlation
inequalities, Lee–Yang theory, contour (Peierls) arguments and infinite-volume Gibbs measures.
The limits of Layer 3 also follow from the general theory of large deviations, by Cramér's
theorem for a fair coin with exponential tilting; here they are proved by counting
configurations, and no target uses that theory.

## Exact supplier contracts

### From Mathlib

- `Real.binEntropy`, `Real.binEntropy_continuous`, `Real.deriv_binEntropy`
  (`deriv binEntropy p = log(1 − p) − log p`) and `Real.binEntropy_one_sub`
  (`Mathlib/Analysis/SpecialFunctions/BinaryEntropy.lean`).
- `Real.tanh`, `Real.tanh_eq` (`tanh x = (e^x − e^{−x})/(e^x + e^{−x})`),
  `Real.tanh_eq_sinh_div_cosh` and `Real.tanh_lt_one`
  (`Mathlib/Analysis/Complex/Trigonometric.lean`); `Real.hasDerivAt_sinh` and
  `Real.hasDerivAt_cosh` (`Mathlib/Analysis/SpecialFunctions/Trigonometric/DerivHyp.lean`);
  `Real.artanh`, `Real.tanh_artanh` (`tanh (artanh x) = x` on `(−1, 1)`), `Real.artanh_tanh`
  (`artanh (tanh x) = x`) and `Real.artanh_eq_half_log`
  (`Mathlib/Analysis/SpecialFunctions/Artanh.lean`).
- `add_pow` (`Mathlib/Data/Nat/Choose/Sum.lean`); `Nat.ceil_le`
  (`Mathlib/Algebra/Order/Floor/Defs.lean`); `IsCompact.exists_isMaxOn`
  (`Mathlib/Topology/Order/Compact.lean`); `Set.OrdConnected`
  (`Mathlib/Order/Interval/Set/Defs.lean`); `Matrix.of`.
- `MeasureTheory.tvDist` (`Mathlib/MeasureTheory/Measure/TotalVariation/Defs.lean`);
  `MeasureTheory.Measure.real` (`Mathlib/MeasureTheory/Measure/MeasureSpaceDef.lean`);
  `ProbabilityTheory.cond`, inside `glauber`; `ProbabilityTheory.Kernel.IsReversible` and
  `ProbabilityTheory.Kernel.IsReversible.invariant` (a Markov kernel reversible for `π` leaves `π`
  invariant) (`Mathlib/Probability/Kernel/Invariance.lean`);
  `ProbabilityTheory.meas_ge_le_variance_div_sq` (Chebyshev, for `X ∈ L²`)
  (`Mathlib/Probability/Moments/Variance.lean`).

### From Tau Ceti

- `TauCeti.klDiv_tilted_neg_add_ofReal_neg_log`
  (`TauCeti/InformationTheory/KullbackLeibler/Tilted.lean`): for probability measures `μ, ν` and
  `f` a.e.-measurable with `f ≥ 0` `ν`-a.e.,
  `klDiv μ (ν.tilted (−f)) + ofReal(−log ∫ e^{−f} dν) = ∫⁻ ofReal f dμ + klDiv μ ν`. Checks only.
- `Real.hasDerivAt_artanh` (`artanh` has derivative `(1 − x²)⁻¹` at every `x ∈ (−1, 1)`)
  (`TauCeti/Analysis/SpecialFunctions/Artanh.lean`), in the routes of 2.1 and 2.2.

### From TauCetiRoadmap.MarkovChainMixing

- 1.2 `tvToStationary`; 1.3 `mixingTime` and
  `TauCetiRoadmap.MarkovChainMixing.mixingTime_le_iff` (for a Markov kernel, `t_mix(ε) ≤ t` iff
  `d(t) ≤ ε`).
- 3.1 the bottleneck ratio `Φ⋆` (the infimum of `Q(A, Aᶜ)/π(A)` over `0 < π(A) ≤ ½`) and
  `TauCetiRoadmap.MarkovChainMixing.ceil_le_mixingTime_of_bottleneckRatio` (for a Markov kernel
  with stationary probability `π`, `⌈1/(4Φ⋆)⌉₊ ≤ t_mix(1/4)`).
- 5.3 the hypercube walk and its separation bound, in Checks only.
- 6.1 `glauber`, `TauCetiRoadmap.MarkovChainMixing.isMarkovKernel_glauber` (for nonempty `V` and
  a probability measure) and `TauCetiRoadmap.MarkovChainMixing.isReversible_glauber` (for a
  probability measure).

### From TauCetiRoadmap.SimulatedAnnealing

- 3.1 `gibbs`, the Gibbs law `π_β(x) = exp(−β U x)/Σ_y exp(−β U y)` of an energy on a finite set.

### From TauCetiRoadmap.QuantumOptimization

- 1.1 `spin` (`−1` on `true`, `1` on `false`) and `ising` (couplings summed over ordered pairs,
  plus fields).

## References

- S. Friedli and Y. Velenik, *Statistical mechanics of lattice systems: a concrete mathematical
  introduction*, Cambridge University Press, 2017; the revised version of 22 August 2017 made
  available by the authors at unige.ch/math/folks/velenik/smbook. Used: Chapter 2, Definitions 2.1
  and 2.4, Theorem 2.2, Remarks 2.3 and 2.6, Proposition 2.5 with its proof, Theorem 2.8, (2.15),
  Exercises 2.1 and 2.5, Section 2.5.2 (the exchangeable pair, attributed there to Chatterjee),
  Theorem 2.9.
- D. A. Levin and Y. Peres, with contributions by E. L. Wilmer, *Markov chains and mixing times*,
  second edition, American Mathematical Society, 2017; the edition made available by the authors
  at pages.uoregon.edu/dlevin/MARKOV/. Used: Section 3.3.5; (4.31); Theorem 7.4; Theorem 15.4.

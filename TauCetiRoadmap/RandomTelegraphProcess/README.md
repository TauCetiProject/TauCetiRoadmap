# Roadmap: the random telegraph process

**Summary.** The random telegraph process is the simplest noise with memory: a signal that
switches between two values at the jumps of a Markov clock. This roadmap builds it from
independent exponential holding times, identifies its laws with the transition matrices of the
two-state Markov chain, and proves the classical facts about the particle that moves at constant
speed `c` and reverses direction at rate `a`: its moments, the shape of its law, Kac's telegraph
equation, its characteristic function and its Brownian limit. Holding times are independent with
exponential laws, the rates are positive, and the initial direction is independent of the holding
times; times are nonnegative.

- *Two-state chains.* For the chain on two states that leaves the first at rate `a` and the
  second at rate `b`, the transition matrix at time `t` is `1 + ((1 − e^(−(a+b)t))/(a + b)) Q`
  with `Q` the rate matrix. The process built from alternating exponential holding times of rates
  `a` and `b` has exactly these transition matrices: the probability of visiting given states at
  given increasing times is the product of their entries.
- *Moments and law.* At time `t ≥ 0` the position `X_t` of the particle has mean
  `c E[σ] (1 − e^(−2at))/(2a)`, where `σ = ±1` is the initial direction, and second moment
  `(c²/a)(t − (1 − e^(−2at))/(2a))`: ballistic for small `t`, diffusive for large `t`. For
  `c ≠ 0` its law has atoms of masses `P(σ = ±1) e^(−at)` at `±ct` and is otherwise absolutely
  continuous and carried by the open interval `(−|c|t, |c|t)`; so it has no density on the line.
- *Kac's theorem.* For a twice continuously differentiable `f`, the function
  `u(t, x) = E f(x + X_t)` solves the telegraph equation `u_tt + 2a u_t = c² u_xx` for `t ≥ 0`,
  with `u(0, x) = f(x)` and `u_t(0, x) = c E[σ] f′(x)`. The characteristic function of `X_t` is
  `e^(−at)(cosh(rt) + (a + icξE[σ]) sinh(rt)/r)` with `r² = a² − c²ξ²`.
- *Diffusive limit.* If `a → ∞` and `c²/a → s`, then `X_t` converges in distribution to the
  centred Gaussian law of variance `st`.

Renewal counts and their Poisson laws come from Tau Ceti's renewal theory, on which
MarkovChainsAndRenewal also builds. The transition matrices are the matrix exponentials of
ContinuousTimeMarkovChains, whose characterization of stochastic semigroups identifies the laws
of the two-state process. Characteristic functions and Lévy's continuity theorem are Mathlib's.

Layer 1 computes the exponential of the two-state rate matrix; Layer 2 builds the two
processes, identifies the laws of the first and studies the position; Layer 3 proves Kac's
equations, the characteristic function and the diffusive limit.

## Conventions

- **Holding times.** A sequence `T : ℕ → Ω → ℝ≥0` of measurable, independent (`iIndepFun`)
  random variables on a measure space `(Ω, P)`; the real value `(T n ω : ℝ)` has the law
  `expMeasure ρ` of Mathlib. `T 0` is the first holding time. A rate is in `ℝ≥0`. Independence
  already forces `P` to be a probability measure
  (`ProbabilityTheory.iIndepFun.isProbabilityMeasure`), and `expMeasure 0` is the zero measure,
  so the hypotheses of every process-level statement force positive rates.
- **Counts and time.** The number of switches up to time `t ≥ 0` is Tau Ceti's
  `TauCeti.Probability.renewalCountNat T t.toNNReal`: the number of `n ≥ 1` with
  `T 0 + ⋯ + T (n − 1) ≤ t`, and `0` on the null set of explosive paths. Time is real and is
  passed to the count through `Real.toNNReal`; every statement concerns times `t ≥ 0`.
- **States and matrices.** The two states are `0` and `1` in `Fin 2`. Rows index the starting
  state: `exp(tQ)_ij` is the probability of being in `j` at time `t` from `i`, with
  `exp(tQ) = NormedSpace.exp (t • Q)`, as in ContinuousTimeMarkovChains.
- **The telegraph process.** Speed `c ∈ ℝ` (negative `c` starts the motion downwards), initial
  sign `σ : Ω → ℝ` measurable with `σ ω = 1 ∨ σ ω = −1` for every `ω` and independent of the
  whole sequence `fun ω n ↦ T n ω` (`IndepFun`), velocity `V_t = c σ (−1)^(N_t)` and position
  `X_t = ∫₀ᵗ V_s ds`. All holding times have the same rate `a`. Writing `X^c` means the position
  with speed `c` and initial sign `1`.
- **Notation.** `E` is the integral against `P`; `f′`, `f″` are `deriv f`, `deriv (deriv f)`.

## Layer 1: The two-state generator

### 1.1 The exponential of the rate matrix

Define `twoStateGenerator a b`, the matrix `!![−a, a; b, −b]` on `Fin 2`, for real `a`, `b`.

Prove `exp_smul_twoStateGenerator`: for all real `a`, `b` with `a + b ≠ 0` and every real `t`,
`exp(tQ) = 1 + ((1 − e^(−(a+b)t))/(a + b)) Q` with `Q = twoStateGenerator a b`. For `a, b ≥ 0`
the entries are the transition probabilities of the two-state chain (Durrett, §4.2,
Example 4.8, p. 132, for nonnegative rates); here the rates are arbitrary reals.

Route: `Q² = −(a + b) Q` by multiplying out, so `Qⁿ = (−(a + b))^(n−1) Q` for `n ≥ 1` by
induction. In the series `NormedSpace.exp_eq_tsum` the terms with `n ≥ 1` sum to
`Σ_(n≥1) tⁿ (−(a + b))^(n−1)/n! · Q`, and `Σ_(n≥1) tⁿ λ^(n−1)/n! = (e^(λt) − 1)/λ` for
`λ = −(a + b) ≠ 0`. The series converges entrywise, so the identity holds entry by entry.

**Checks.**
- `a = 1`, `b = 2`: `exp(tQ)_01 = (1 − e^(−3t))/3` and `exp(tQ)_00 = (2 + e^(−3t))/3`.
- `exp(tQ)_00 = b/(a + b) + (a/(a + b)) e^(−(a+b)t)`, the first entry of Durrett's example.
- The hypothesis `a + b ≠ 0` is needed: for `a = 1`, `b = −1`, `Q² = 0` and `exp(tQ) = 1 + tQ`,
  while the right side, read with `x / 0 = 0`, is `1`.

*Needs:* Mathlib `NormedSpace.exp_eq_tsum`.

### Examples

`a = b`, with `exp(tQ)_01 = (1 − e^(−2at))/2`; `a = 0 < b`, where state `0` is absorbing.

### Dependencies

Mathlib's matrix exponential. No other layer.

## Layer 2: The two-state process and the telegraph process

### 2.1 Finite-dimensional laws of the two-state process

Define `twoStateProcess T t ω : Fin 2`, the parity `N_t mod 2` of the number of switches of `T`
up to time `t`: the process starts in `0` and changes state at every renewal. With holding times
of rate `a` at even and `b` at odd indices this is the construction of the two-state chain from
its jump chain and holding times (Durrett, §4.1, "Formal construction", pp. 127–128, (4.3)).

Prove `measureReal_twoStateProcess_eq`: let the holding times be independent, with law
`expMeasure a` for even and `expMeasure b` for odd indices, `a, b ∈ ℝ≥0`. For `n ∈ ℕ`, times
`0 ≤ t₀ ≤ t₁ ≤ ⋯ ≤ tₙ` and states `i₀, …, iₙ`, the probability that the process is in `i_k` at
time `t_k` for every `k` is `exp(t₀Q)_(0 i₀) ∏_(k<n) exp((t_(k+1) − t_k)Q)_(i_k i_(k+1))` with
`Q = twoStateGenerator a b`. (Proved here.)

Route. Write `S_m` for the `m`-th arrival `T 0 + ⋯ + T (m − 1)`. Almost surely `S_m → ∞`: the
even-indexed holding times are independent with law `expMeasure a`, so
`TauCeti.Probability.ae_tendsto_arrival_atTop_of_expMeasure` applies to them, and `S_(2m)`
dominates their partial sums. On that event `N_t = m` exactly when `S_m ≤ t < S_(m+1)`
(`TauCeti.Probability.renewalCountNat_eq_iff`).
1. *Restart at a fixed time.* Fix `t ≥ 0` and `m`, and let `E_m = {S_m ≤ t < S_(m+1)}`. On `E_m`
   set `R = S_(m+1) − t` and let the restarted sequence be `(R, T (m + 1), T (m + 2), …)`. For a
   measurable set `A` of values of `(T 0, …, T (m − 1))`, `r ≥ 0` and a measurable set `B` of
   sequences, `P(E_m, (T 0, …, T (m−1)) ∈ A, R > r, (T (m+1), …) ∈ B)` equals
   `P(E_m, (T 0, …, T (m−1)) ∈ A) e^(−ρ_m r) P((T (m+1), …) ∈ B)`, where `ρ_m` is the rate of
   `T m`. Indeed `E_m ∩ {R > r} = {S_m ≤ t} ∩ {T m > t − S_m + r}`; the law of the sequence is
   the product of its marginals, so `T m` is independent of the other holding times, and
   integrating over `T m` first gives
   `e^(−ρ_m (t − S_m + r)) = e^(−ρ_m (t − S_m)) e^(−ρ_m r)`. So on `E_m` the restarted sequence
   is an alternating sequence of independent exponential holding times beginning with rate `ρ_m`,
   independent of the holding times before `m`.
2. *Transition matrices.* For `i ∈ Fin 2` let `P(u)_ij` be the probability that the process
   built from independent holding times with rates alternating from that of state `i`, started
   in `i`, is in `j` at time `u ≥ 0`. By step 1, summed over `m`, the state at times `t + u_l`
   is the state at `t` moved by the process of the restarted sequence, which is independent of
   the states at times `≤ t`. Induction on `n` gives the product formula with `P` in place of
   `exp(·Q)`, and the case `n = 1`, `t₀ = s`, `t₁ = s + u` gives `P(s + u) = P(s) P(u)`.
3. *Identification.* `P(0) = 1` because `T 0 > 0` almost surely; each `P(u)` is a stochastic
   matrix; and `P(u)_ii ≥ P(T 0 > u) = e^(−ρ u) → 1` as `u → 0`, so `P` is continuous at `0`
   within `[0, ∞)`. ContinuousTimeMarkovChains 2.2 (`existsUnique_isQMatrix_of_semigroup`) gives
   a Q-matrix `Q'` with `P(u) = exp(uQ')`, so `Q'` is the right derivative of `P` at `0`
   (`hasDerivAt_exp_smul_const`). From state `0`,
   `P(T 0 ≤ u < T 0 + T 1) = a ∫₀ᵘ e^(−av) e^(−b(u−v)) dv = au + O(u²)`, and `P(u)_01`, the
   probability that `N_u` is odd, differs from it by at most `P(N_u ≥ 3) = O(u³)`; so
   `Q'_01 = a`, and from state `1` likewise `Q'_10 = b`. Rows of a Q-matrix sum to zero, so
   `Q' = twoStateGenerator a b`.

**Checks.**
- One time, from `0`: the Laplace transform of `P(N_t even)` is
  `Σ_m (ab/((a+λ)(b+λ)))^m · (1/(a+λ)) = (b + λ)/(λ(λ + a + b))`, which is the transform of
  `exp(tQ)_00 = b/(a + b) + (a/(a + b)) e^(−(a+b)t)` (Layer 1).
- The first holding time has rate `a`: `P(state 1 at t) = (a/(a+b))(1 − e^(−(a+b)t))`, which is
  `at + O(t²)`, not `bt + O(t²)`.
- Monotone times are needed: for `a = b = 1`, `n = 1`, `t₀ = 1`, `t₁ = 0`, `i = (0, 1)` the left
  side is `0` (the state at time `0` is `0` almost surely) and the right side is
  `((1 + e^(−2))/2)((1 − e²)/2) ≠ 0`.

*Needs:* ContinuousTimeMarkovChains 2.2; Tau Ceti
`TauCeti.Probability.ae_tendsto_arrival_atTop_of_expMeasure`,
`TauCeti.Probability.renewalCountNat_eq_iff`, `TauCeti.Probability.measurable_renewalCountNat`;
Mathlib `ProbabilityTheory.iIndepFun_iff_map_fun_eq_infinitePi_map`, `hasDerivAt_exp_smul_const`.

### 2.2 Mean and second moment of the position

Define `telegraphVelocity c σ T t ω = c σ(ω) (−1)^(N_t(ω))` and
`telegraphPosition c σ T t ω = ∫₀ᵗ telegraphVelocity c σ T s ω ds` (an interval integral).

API: the map `(s, ω) ↦ V_s(ω)` is measurable on `ℝ × Ω`, because `{(s, ω) : N_s(ω) = n}` is the
set where `S_n(ω) ≤ s < S_(n+1)(ω)` on the measurable set of nonexplosive `ω`, together with
all explosive `ω` when `n = 0` (Tau Ceti `TauCeti.Probability.measurable_arrival`); so `ω ↦ X_t(ω)` is measurable, `X_0 = 0`,
`|X_t − X_s| ≤ |c| |t − s|`, and `|X_t| ≤ |c| t` for `t ≥ 0`.

Prove `integral_telegraphPosition`: for independent holding times of rate `a` and an initial
sign `σ = ±1` independent of them, for every real `c` and every `t ≥ 0`,
`E X_t = c E[σ] (1 − e^(−2at))/(2a)` and `E X_t² = (c²/a)(t − (1 − e^(−2at))/(2a))`. For the
symmetric start, `E[σ] = 0`, these are Iacus and Yoshida, §2, (2.1) and (2.2), p. 3, who
credit Orsingher (1990); the mean for a general initial law is proved here.

Route. By Fubini (`MeasureTheory.integral_integral_swap`, with the measurability above and
`|V| ≤ |c|`), `E X_t = ∫₀ᵗ E V_s ds` and `E X_t² = 2 ∫∫_(0 ≤ s ≤ u ≤ t) E[V_s V_u] ds du`. Since
`σ` is independent of the counts, `E V_s = c E[σ] E[(−1)^(N_s)]`. For `s ≤ u`, `σ² = 1` gives
`V_s V_u = c² (−1)^(N_s + N_u)`. With `a = b` the parity of `N` is the two-state process of 2.1,
so 2.1 with `n = 1` and Layer 1 give
`E[(−1)^(N_s + N_u)] = Σ_(i,j) (−1)^(i+j) exp(sQ)_(0i) exp((u − s)Q)_(ij) = e^(−2a(u−s))`, using
`Σ_j (−1)^(i+j) exp(τQ)_ij = e^(−2aτ)` for `Q = twoStateGenerator a a`; likewise
`E[(−1)^(N_s)] = e^(−2as)`. Integrating gives both formulas.

**Checks.**
- `2 ∫₀ᵗ ∫₀ᵘ c² e^(−2a(u−s)) ds du = (c²/a)(t − (1 − e^(−2at))/(2a))`.
- `E X_t² = c²t² − (2/3)ac²t³ + O(t⁴)` and `E X_t² = (c²/a)t − c²/(2a²) + o(1)`; as `a → 0` it
  tends to `c²t²`, the value without switching.
- The decay rate is `2a`, not `a`: `E[V_s V_u] = c² e^(−2a|u − s|)`.
- Independence of `σ` is needed for the mean: with `σ = 1` on `{T 0 > t}` and `−1` elsewhere,
  `E X_t = 2ct e^(−at) − c(1 − e^(−2at))/(2a)`, while the formula gives
  `c (2e^(−at) − 1)(1 − e^(−2at))/(2a)`; at `a = c = t = 1` these are `0.303…` and `−0.114…`.

*Needs:* 1.1, 2.1; Mathlib `MeasureTheory.integral_integral_swap`; Tau Ceti
`TauCeti.Probability.measurable_arrival`.

### 2.3 The law of the position

Prove `map_telegraphPosition_eq`: under the hypotheses of 2.2 and `c ≠ 0`, for every `t ≥ 0`
there is a measure `ν`, absolutely continuous with respect to Lebesgue measure and carried by
`(−|c|t, |c|t)`, with
`law(X_t) = P(σ = 1) e^(−at) δ_(ct) + P(σ = −1) e^(−at) δ_(−ct) + ν`. For the symmetric start
and `c > 0` the atoms and the mass `1 − e^(−at)` of the open interval are Kolesnik, §2, (2.1)
and (2.2), p. 4, whose (2.5) gives the density of `ν` through modified Bessel functions; the
statement for every initial law and every `c ≠ 0` is proved here.

Route. Work on the almost sure event where `S_m → ∞` (2.1, first paragraph of the route). Put
`ν = law(X_t; N_t ≥ 1)`, the image of `P` restricted to `{N_t ≥ 1}`.
1. *Atoms.* On `{N_t = 0}`, `V = cσ` on `[0, t]` and `X_t = cσt`. By independence of `σ` and the
   holding times, `P(σ = ±1, N_t = 0) = P(σ = ±1) e^(−at)`
   (`TauCeti.Probability.measureReal_renewalCountNat_eq_of_expMeasure` with `n = 0`).
2. *Support.* On `{N_t ≥ 1}`, `T 0 ≤ t`, and `T 0 = t` has probability `0`. If `T 0 < t` the
   velocity takes both values on sets of positive length in `[0, t]`, so `|X_t| < |c|t`.
3. *Absolute continuity.* Fix `n ≥ 1`. On `{N_t = n}`,
   `X_t = cσ (Σ_(k<n) (−1)^k T k + (−1)^n (t − S_n))`. Choose `j = 0` if `n` is odd and `j = 1`
   if `n` is even; then `j < n` and the coefficient of `T j` in `X_t` is
   `cσ((−1)^j − (−1)^n) = ±2cσ ≠ 0`. Fix the values of `σ` and of all `T k` with `k ≠ j`: the
   event `{N_t = n}` becomes an interval condition on `T j` (`S_n ≤ t < S_n + T n`, and `n ≠ j`),
   on which `X_t` is an affine function of `T j` with slope `±2c`. For a Lebesgue-null set `A`
   the set of values of `T j` with `X_t ∈ A` is then Lebesgue-null, hence `expMeasure a`-null.
   Since `T j` is independent of `σ` and of the other holding times, Fubini gives
   `P(N_t = n, X_t ∈ A) = 0`. Summing over `n ≥ 1`, `ν(A) = 0`.

**Checks.**
- `c ≠ 0` is needed: for `c = 0`, `X_t = 0`, the law is `δ_0`, and the right side has mass
  `e^(−at) < 1` for `a, t > 0`, because `ν` must vanish off the empty interval.
- On `{N_t = 1}` with `σ = 1`, `X_t = c(2 T 0 − t)` and the law of `X_t` there has density
  `a e^(−at)/(2|c|)` on `(−|c|t, |c|t)`, from `P(T 0 ∈ dv, T 1 > t − v) = a e^(−at) dv`.

*Needs:* 2.1 (almost sure nonexplosion, from its route's first paragraph, which rests on
`TauCeti.Probability.ae_tendsto_arrival_atTop_of_expMeasure`); 2.2 (definitions and API); Tau
Ceti `TauCeti.Probability.measureReal_renewalCountNat_eq_of_expMeasure`,
`TauCeti.Probability.renewalCountNat_eq_iff`; Mathlib
`ProbabilityTheory.iIndepFun_iff_map_fun_eq_infinitePi_map`, `MeasureTheory.integral_integral_swap`.

### Examples

The symmetric start `P(σ = 1) = 1/2` (the Goldstein–Kac process); the deterministic starts
`σ = ±1`; the symmetric two-state process `a = b`, whose sign is the telegraph signal.

### Dependencies

Layer 1; ContinuousTimeMarkovChains 2.2; Tau Ceti's renewal counts with exponential
increments; Mathlib's independence and Fubini theorems.

## Layer 3: Kac's equations and the diffusive limit

Throughout, the holding times are independent with law `expMeasure a`.

### 3.1 The first-switch equation

Prove `integral_comp_telegraphPosition_eq`: for a bounded measurable `f`, real `c`, `x` and
`t ≥ 0`, `E f(x + X^c_t) = e^(−at) f(x + ct) + ∫₀ᵗ a e^(−as) E f(x + cs + X^(−c)_(t−s)) ds`.
(Proved here.)

Route. Let `T' = (T 1, T 2, …)`. By `TauCeti.Probability.arrival_add` with `m = 1`, the arrivals
of `T` after the first are `T 0` plus those of `T'`, so on the nonexplosive event `N_s(T) = 0`
for `s < T 0` and `N_s(T) = 1 + N_(s − T 0)(T')` for `s ≥ T 0`. Hence on `{T 0 ≤ t}`
`X^c_t(T) = c T 0 + X^(−c)_(t − T 0)(T')` (split the interval integral at `T 0` with
`intervalIntegral.integral_add_adjacent_intervals`), and on `{T 0 > t}` `X^c_t = ct`. The law
of `T` on `ℕ → ℝ≥0` is the product of copies of `expMeasure a`
(`ProbabilityTheory.iIndepFun_iff_map_fun_eq_infinitePi_map`), so `T 0` is independent of `T'`
and `T'` has the law of `T`. Integrating over `T 0` with
density `a e^(−as)` on `[0, t]` (Fubini) gives the second term; `{T 0 > t}` has probability
`e^(−at)` and gives the first.

**Checks.**
- For `f(y) = e^(iξy)` (real and imaginary parts), `x = 0`, and the functions `φ_±` of 3.4 with
  `E[σ] = ±1`, the equation `φ_+(t) = e^(−at) e^(icξt) + ∫₀ᵗ a e^(−as) e^(icξs) φ_−(t − s) ds`
  holds at `(a, c, ξ) = (1, 1, 1/2)`, `(1, 1, 2)` and `(2, −3, 1)`.
- Boundedness is needed: for `c = 1`, `x = 0`, `t > 0` and `f(y) = 1/|y|` (`f(0) = 0`), on
  `{N_t = 1}` the law of `X_t` has density `a e^(−at)/2` on `(−t, t)` (2.3), so `f(X_t)` is not
  integrable and the left side is `0`, while the right side is at least `e^(−at)/t > 0`.

*Needs:* 2.2 (definitions and API); Tau Ceti `TauCeti.Probability.arrival_add`,
`TauCeti.Probability.renewalCountNat_eq_iff`,
`TauCeti.Probability.ae_tendsto_arrival_atTop_of_expMeasure`; Mathlib
`ProbabilityTheory.iIndepFun_iff_map_fun_eq_infinitePi_map`,
`intervalIntegral.integral_add_adjacent_intervals`, `MeasureTheory.integral_integral_swap`.

### 3.2 Kac's first-order system

Prove `hasDerivWithinAt_integral_comp_telegraphPosition`: for a continuously differentiable `f`
and real `c`, `x`, with `u_c(t, x) = E f(x + X^c_t)`, at every `t ≥ 0` the function
`s ↦ u_c(s, x)` has derivative within `[0, ∞)` equal to
`c E f′(x + X^c_t) + a (u_(−c)(t, x) − u_c(t, x))`. (Proved here.)

Route. Since `|X^c_s| ≤ |c| s`, only the values of `f` and `f′` on compact intervals enter; on
them both are bounded (`IsCompact.exists_bound_of_continuousOn`), and 3.1 applies to `f`
composed with the projection onto `[x − |c|(t + 1), x + |c|(t + 1)]`, which is bounded,
measurable and agrees with `f` at every point `x + X^(±c)_s`, `s ≤ t + 1`. Dominated convergence
makes `u_(±c)` and `E f′(· + X^c_s)` jointly continuous in `(s, x)`, and
`∂_x u_c(s, x) = E f′(x + X^c_s)` (`hasDerivAt_integral_of_dominated_loc_of_deriv_le`). Put
`x = y − cs` in 3.1 and substitute `r = s − v` in the integral:
`e^(as) u_c(s, y − cs) = f(y) + ∫₀ˢ a e^(ar) u_(−c)(r, y − cr) dr`. The integrand is continuous,
so (`intervalIntegral.integral_hasDerivWithinAt_right`) `g_y(s) = u_c(s, y − cs)` has derivative
`a (u_(−c) − u_c)(s, y − cs)`. Finally
`u_c(s, x) − u_c(t, x) = [u_c(s, x) − u_c(s, x − c(s − t))] + [g_y(s) − g_y(t)]` with
`y = x + ct`; the first bracket is `c (s − t) E f′(x + X^c_t) + o(s − t)` by the mean value
theorem and the joint continuity of `∂_x u_c`, the second `a (u_(−c) − u_c)(t, x)(s − t) +
o(s − t)`.

**Checks.**
- For `f(y) = e^(iξy)` and `x = 0`: `φ_+′ = icξ φ_+ + a(φ_− − φ_+)` at the three parameter
  triples of 3.1.
- `f(y) = y`: `∂_t E X^c_t = c e^(−2at)` and `c + a(E X^(−c)_t − E X^c_t) = c e^(−2at)` (2.2).

*Needs:* 3.1; 2.2 (API); Mathlib `hasDerivAt_integral_of_dominated_loc_of_deriv_le`,
`intervalIntegral.integral_hasDerivWithinAt_right`, `IsCompact.exists_bound_of_continuousOn`.

### 3.3 Kac's theorem: the telegraph equation

Prove `hasDerivWithinAt_telegraph_equation`: for an initial sign `σ = ±1` independent of the
holding times, a twice continuously differentiable `f` and real `c`, `x`, with
`u(t, x) = E f(x + X_t)` and `v(t, x) = E[V_t f′(x + X_t)]`, at every `t ≥ 0` the derivative of
`s ↦ u(s, x)` within `[0, ∞)` is `v(t, x)`, that of `s ↦ v(s, x)` is
`c² E f″(x + X_t) − 2a v(t, x)`, and the function `y ↦ ∂_y u(t, y)` has derivative
`E f″(x + X_t)` at `x`. So `u_tt + 2a u_t = c² u_xx`, with `u(0, x) = f(x)` and
`u_t(0, x) = c E[σ] f′(x)`.
For the symmetric start the equation for the density of `X_t` is the Goldstein–Kac theorem
(Kolesnik, §2, (2.3) and (2.4), p. 4); the form for expectations and every initial law is
proved here.

Route.
1. *First derivative.* Off the switching times `s ↦ f(x + X_s)` has derivative
   `V_s f′(x + X_s)`, and it is Lipschitz on `[0, t + 1]`, so
   `f(x + X_s) − f(x + X_t) = ∫_t^s V_r f′(x + X_r) dr` pathwise. Take expectations and use
   Fubini. As `r → r₀`, `V_r → V_(r₀)` except when some arrival equals `r₀`, an event of
   probability `0` because the arrivals have densities; dominated convergence makes `v(·, x)`
   continuous, and the fundamental theorem of calculus gives the first claim.
2. *Mixture.* `X_t(ω)` is the position with speed `cσ(ω)` and initial sign `1`; by independence
   of `σ` and the holding times, `E F(σ, T) = p E F(1, T) + (1 − p) E F(−1, T)` with
   `p = P(σ = 1)`. So `u = p u_c + (1 − p) u_(−c)` and, by step 1 and 3.2 (derivatives within
   `[0, ∞)` are unique), `v = p v_c + (1 − p) v_(−c)` with
   `v_(±c) = ±c E f′(x + X^(±c)_t) + a (u_(∓c) − u_(±c))`.
3. *Second derivative.* Apply 3.2 to `f` and to `f′` (both continuously differentiable) at
   speeds `c` and `−c`. Differentiating `v_c` gives
   `c (c E f″(x + X^c_t) + a(E f′(x + X^(−c)_t) − E f′(x + X^c_t))) + a(∂_t u_(−c) − ∂_t u_c)`,
   and `∂_t u_(−c) − ∂_t u_c = −c (E f′(x + X^(−c)_t) + E f′(x + X^c_t)) + 2a(u_c − u_(−c))`; the
   sum is `c² E f″(x + X^c_t) − 2a v_c`. Likewise for `v_(−c)`; mixing as in step 2 gives the
   second claim.
4. *Space derivatives.* Since `|X_t| ≤ |c| t`, `f′` and `f″` are bounded on the values
   `y + X_t` for `y` near `x`; differentiation under the integral sign
   (`hasDerivAt_integral_of_dominated_loc_of_deriv_le`) gives `∂_y u(t, y) = E f′(y + X_t)` for
   every `y`, and once more the third claim.

**Checks.**
- `f(y) = y²`: `u = x² + 2xc E[σ](1 − e^(−2at))/(2a) + E X_t²` and
  `v = 2xc E[σ] e^(−2at) + c²(1 − e^(−2at))/a`; then `u_t = v` and `v_t = 2c² − 2a v`.

*Needs:* 3.2; 2.2 (API); Mathlib `MeasureTheory.integral_integral_swap`,
`hasDerivAt_integral_of_dominated_loc_of_deriv_le`,
`intervalIntegral.integral_hasDerivWithinAt_right`.

### 3.4 The characteristic function

Prove `charFun_map_telegraphPosition`: under the hypotheses of 2.2, for every `t ≥ 0`, real `ξ`
and complex `r` with `r² = a² − c²ξ²`,
`E e^(iξX_t) = e^(−at)(cosh(rt) + (a + icξE[σ]) S)`, where `S = sinh(rt)/r` if `r ≠ 0` and
`S = t` if `r = 0`. Both sides are even in `r`. For the symmetric start this is Kolesnik, §2,
(2.12), p. 5, which writes the cases `c|ξ| ≤ a` and `c|ξ| > a` with real square roots; the
general initial law and the form with `r` are proved here.

Route. Apply 3.3 at `x = 0` to `cos(ξ·)` and `sin(ξ·)`: `φ(t) = E e^(iξX_t)` is twice
differentiable within `[0, ∞)` with `φ″ + 2aφ′ + c²ξ²φ = 0`, `φ(0) = 1` (as `X_0 = 0`) and
`φ′(0) = E[V_0 iξ] = icξE[σ]` (as `N_0 = 0` almost surely). The right side `ψ` of the formula
satisfies the same equation and initial values: for `r ≠ 0` the exponents `−a ± r` are the roots
of `λ² + 2aλ + c²ξ² = 0`, and for `r = 0` the double root is `−a`. The pair `(φ − ψ, φ′ − ψ′)`
solves a linear system with constant coefficients and vanishes at `0`, so it vanishes on every
`[0, T]` (`ODE_solution_unique_of_mem_Icc_right`).

**Checks.**
- For `E[σ] = 0` the formula agrees with Kolesnik's (2.12) at `(a, c, ξ) = (2, 1, 1)`
  (`r = √3`), `(1, 1, 3)` (`r = i√8`) and `(3/2, 2, 1/4)`.
- The `r = 0` value `e^(−at)(1 + (a + icξE[σ]) t)` is the limit of the `r ≠ 0` form.
- Expanding at `ξ = 0`, the coefficients of `ξ` and `ξ²` give the mean and second moment of 2.2.

*Needs:* 3.3; Mathlib `MeasureTheory.charFun`, `ODE_solution_unique_of_mem_Icc_right`.

### 3.5 The diffusive limit

Prove `tendstoInDistribution_telegraphPosition`: let `a_m ∈ ℝ≥0` tend to infinity, let `c_m` be
real with `c_m²/a_m → s ≥ 0`, and for each `m` let the holding times `T m` be independent with
law `expMeasure a_m` and the initial sign `σ m = ±1` be independent of them, all on one
probability space. For every `t ≥ 0` the positions `X^(m)_t` converge in distribution to the
centred Gaussian law of variance `st`. (Proved here; Kolesnik, §1, p. 2, records that the law of
the telegraph process tends to that of Brownian motion as the speed and the rate grow.)

Route. By Lévy's continuity theorem (`MeasureTheory.TendstoInDistribution.of_tendsto_charFun`,
with measurability from 2.2) and `ProbabilityTheory.charFun_gaussianReal`, it suffices that
`φ_m(ξ) → e^(−stξ²/2)` for each `ξ`. Since `c_m²/a_m² → 0`, for large `m` the root
`r_m = (a_m² − c_m²ξ²)^(1/2)` is real and positive, `r_m/a_m → 1`, and
`r_m − a_m = −c_m²ξ²/(r_m + a_m) → −sξ²/2`. In 3.4,
`e^(−a_m t) cosh(r_m t)` and `e^(−a_m t) a_m sinh(r_m t)/r_m` each tend to `e^(−stξ²/2)/2`,
and the remaining term is at most `(|c_m|/r_m) |ξ| e^((r_m − a_m)t)`, which tends to `0` because
`|c_m|/a_m = (c_m²/a_m)^(1/2) a_m^(−1/2) → 0`.

**Checks.**
- With `a_m = m`, `c_m = (sm)^(1/2)` the characteristic function tends to `e^(−stξ²/2)` for every
  value of `E[σ]`.
- `a_m → ∞` is needed: `a_m = 1`, `c_m = 1` has `c_m²/a_m → 1`, but by 2.3 the law of `X_1` has
  atoms at `±1` for every `m`.

*Needs:* 3.4; 2.2 (API); Mathlib `MeasureTheory.TendstoInDistribution.of_tendsto_charFun`,
`ProbabilityTheory.charFun_gaussianReal`.

### Examples

`f = cos(ξ·)` with the symmetric start; `f(y) = y²` with `σ = 1`; the scaling `a_m = m`,
`c_m = m^(1/2)`, with limit the standard Gaussian law of variance `t`.

### Dependencies

Layer 2; Mathlib's dominated differentiation, the fundamental theorem of calculus, uniqueness
for ordinary differential equations, characteristic functions and Lévy's continuity theorem.

## Scope and ownership

Owned here: the two-state rate matrix and its exponential (1.1); the two-state process built
from alternating exponential holding times and its finite-dimensional laws (2.1); the telegraph
velocity and position, their measurability and moments, and the decomposition of the law of the
position into atoms and an absolutely continuous part (2.2, 2.3); Kac's first-switch equation,
first-order system and telegraph equation for expectations, the characteristic function and the
diffusive limit at a fixed time (Layer 3).

Already in the library: renewal counts and their Poisson laws (Tau Ceti); characteristic
functions, Lévy's continuity theorem and the Gaussian law (Mathlib).

Stated by roadmap ContinuousTimeMarkovChains: the theory of matrix exponentials of Q-matrices,
stationary laws and convergence to equilibrium on finite state spaces; this roadmap uses its 2.2
and states nothing about general finite chains. That roadmap leaves the construction of the
process from holding times outside its scope; 2.1 builds it for two states. Stated by roadmap
MarkovChainsAndRenewal, Layer 7: that the count of exponential renewals is a Poisson process with
independent increments, and (7.3) its restart at a fixed time, for holding times of one rate; the
routes here use only the library's renewal counts, and the restart in the route of 2.1, for
alternating rates, is proved there. Stated by roadmap StochasticCalculus, 0.6: the Poisson
counting process for a filtration.

Not treated here: the explicit Bessel-function density of the absolutely continuous part; the
asymmetric telegraph process with two speeds and two rates; the convergence of the whole path to
Brownian motion; spectral densities of the telegraph signal; first-passage and maximum laws;
telegraph processes in several dimensions.

## Exact supplier contracts

### From Mathlib

- `ProbabilityTheory.expMeasure` (`Mathlib/Probability/Distributions/Exponential.lean`): the
  exponential law on `ℝ`, the zero measure for rate `0`.
- `ProbabilityTheory.iIndepFun.isProbabilityMeasure`
  (`Mathlib/Probability/Independence/Basic.lean`): a measure under which a family is independent
  is a probability measure.
- `ProbabilityTheory.iIndepFun_iff_map_fun_eq_infinitePi_map`
  (`Mathlib/Probability/Independence/InfinitePi.lean`): a family of measurable functions is
  independent iff the law of the family is the product of the laws.
- `NormedSpace.exp_eq_tsum` (`Mathlib/Analysis/Normed/Algebra/Exponential.lean`): the
  exponential series, over a field of characteristic zero.
- `hasDerivAt_exp_smul_const` (`Mathlib/Analysis/SpecialFunctions/Exponential.lean`): the
  derivative of `u ↦ exp(u • x)` in a complete normed algebra over `ℝ` or `ℂ`.
- `MeasureTheory.integral_integral_swap` (`Mathlib/MeasureTheory/Integral/Prod.lean`): Fubini
  for integrable functions and σ-finite measures.
- `intervalIntegral.integral_add_adjacent_intervals`
  (`Mathlib/MeasureTheory/Integral/IntervalIntegral/Basic.lean`): additivity over adjacent
  intervals, for functions interval integrable on both.
- `intervalIntegral.integral_hasDerivWithinAt_right`
  (`Mathlib/MeasureTheory/Integral/IntervalIntegral/FundThmCalculus.lean`): the one-sided
  derivative of an interval integral in its upper limit, for an integrand interval integrable,
  measurable at the filter and continuous within the set at the point.
- `hasDerivAt_integral_of_dominated_loc_of_deriv_le`
  (`Mathlib/Analysis/Calculus/ParametricIntegral.lean`): differentiation under the integral sign
  with an integrable bound on the derivative near the point.
- `IsCompact.exists_bound_of_continuousOn` (`Mathlib/Analysis/Normed/Group/Bounded.lean`).
- `ODE_solution_unique_of_mem_Icc_right` (`Mathlib/Analysis/ODE/ExistUnique.lean`): two solutions of
  an equation that is Lipschitz in the state, with the same initial value, agree on `[a, b]`.
- `MeasureTheory.charFun` (`Mathlib/MeasureTheory/Measure/CharacteristicFunction/Basic.lean`),
  `ProbabilityTheory.charFun_gaussianReal` (`Mathlib/Probability/Distributions/Gaussian/Real.lean`).
- `MeasureTheory.TendstoInDistribution.of_tendsto_charFun`
  (`Mathlib/MeasureTheory/Measure/LevyConvergence.lean`): pointwise convergence of the
  characteristic functions of a sequence of almost everywhere measurable random vectors in a
  finite-dimensional inner product space gives convergence in distribution.

### From Tau Ceti

- `TauCeti.Probability.renewalCountNat`, `TauCeti.Probability.renewalCountNat_eq_iff`,
  `TauCeti.Probability.measurable_renewalCountNat` (`TauCeti/Probability/Renewal/Count.lean`):
  the count, equal to `n` exactly when `S_n ≤ t < S_(n+1)` on a nonexplosive path; measurable.
- `TauCeti.Probability.arrival`, `TauCeti.Probability.arrival_add`,
  `TauCeti.Probability.measurable_arrival` (`TauCeti/Probability/Renewal/Basic.lean`).
- `TauCeti.Probability.ae_tendsto_arrival_atTop_of_expMeasure`,
  `TauCeti.Probability.measureReal_renewalCountNat_eq_of_expMeasure`
  (`TauCeti/Probability/Renewal/Exponential.lean`): for measurable independent increments with
  law `expMeasure r`, the arrivals tend to infinity almost surely and the count at time `t` is
  `n` with probability `e^(−rt)(rt)^n/n!`.

### From TauCetiRoadmap.ContinuousTimeMarkovChains

- 2.2 `existsUnique_isQMatrix_of_semigroup`: a family of stochastic matrices `P t`, `t ≥ 0`, on a
  finite state space with `P 0 = 1`, `P (s + t) = P s * P t` and continuity at `0` within
  `[0, ∞)` is `exp(tQ)` for exactly one Q-matrix `Q`. Used in 2.1.

## References

- Rick Durrett, *Essentials of Stochastic Processes*, version 3.9 (May 2021), author's page,
  https://sites.math.duke.edu/~rtd/EOSP/EOSP2021.pdf: §4.1, formal construction, pp. 127–128,
  (4.3); §4.2, Example 4.8 (two-state chains), p. 132.
- Alexander D. Kolesnik, *The explicit probability distribution of the sum of two telegraph
  processes*, arXiv:1402.6866v1 (2014): §1, p. 2; §2, (2.1)–(2.5), p. 4, and (2.12), p. 5.
- Stefano M. Iacus and Nakahiro Yoshida, *Estimation for the discretely observed telegraph
  process*, arXiv:math/0612784v1 (2006): §1, (1.1), p. 1; §2, (2.1) and (2.2), p. 3.
- Mark Kac, *A stochastic model related to the telegrapher's equation*, Rocky Mountain J. Math.
  4 (1974), no. 3, 497–510, doi:10.1216/RMJ-1974-4-3-497 (a reprinting of a 1956 article,
  according to Kolesnik, §1).
- S. Goldstein, *On diffusion by discontinuous movements, and on the telegraph equation*, Quart.
  J. Mech. Appl. Math. 4 (1951), no. 2, 129–156, doi:10.1093/qjmam/4.2.129.
- Enzo Orsingher, *Probability law, flow function, maximum distribution of wave-governed random
  motions and their connections with Kirchoff's laws*, Stochastic Process. Appl. 34 (1990),
  no. 1, 49–66, doi:10.1016/0304-4149(90)90056-X.

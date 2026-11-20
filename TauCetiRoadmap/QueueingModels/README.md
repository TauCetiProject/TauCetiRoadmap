# Roadmap: queueing models

**Summary.** This roadmap develops the stationary theory of Markovian queues whose number of
customers moves up or down by one and never exceeds a fixed bound. Such a queue is a
continuous-time chain on the states `0, 1, …, N` whose generator is a birth–death matrix: the
rate `b_n` of a birth from `n` to `n + 1` (an arrival) and the rate `d_n` of a death from `n` to
`n − 1` (a departure). Everything stated concerns this matrix and its stationary vectors; rates
are real numbers, and the hypotheses on their signs are stated with each theorem. No statement
concerns the paths of the process.

The headline theorems are these.

- *Detailed balance and the product form.* For any real rates, a row vector `π` is stationary
  for a birth–death generator (`πQ = 0`) exactly when it satisfies detailed balance,
  `π_n b_n = π_(n+1) d_(n+1)` for every `n < N`. If the birth rates are nonnegative and the
  death rates positive, the unique stationary probability vector is
  `π_n ∝ (b_0 b_1 ⋯ b_(n−1)) / (d_1 d_2 ⋯ d_n)`, even when some birth rate vanishes.
- *The infinite waiting room as a limit.* For `0 ≤ ρ < 1`, let `π_n ∝ ρⁿ` be the truncated
  geometric law on `{0, …, N}`; by the product form it is the stationary law of the
  single-server queue with traffic intensity `ρ` and room for `N` customers. As `N → ∞` every
  mass of this law tends to the mass `(1 − ρ)ρⁿ` of the geometric law, and its mean tends to the
  geometric mean `ρ/(1 − ρ)`. No chain on an infinite state space is involved.
- *Erlang's loss formula.* For the loss system with `c` servers and offered load `a`, the
  stationary probability `B(c, a)` that all servers are busy satisfies Jagerman's integral
  formula `1/B(c, a) = a ∫_(y > 0) e^(−ay) (1 + y)^c dy` for `a > 0`. With at least one server
  it strictly increases in the load on `[0, ∞)`. At a fixed load `a ≥ 0` per server, `B(c, ac)`
  tends to `0` if `a ≤ 1` and to `1 − 1/a` if `a > 1` as `c → ∞`.

The roadmap builds on ContinuousTimeMarkovChains, which supplies Q-matrices, irreducibility,
uniqueness of the stationary law, convergence of `exp(tQ)` and detailed balance for finite
generators; each birth–death generator here is an instance of its theory. Mathlib supplies the
geometric, Poisson and binomial laws that the stationary laws are compared with; Tau Ceti
supplies the mean of the geometric law and the cumulative masses of the Poisson law, and
StandardDistributions develops the elementary theory of these laws and of conditioning.

The guide to the layers: Layer 1 treats the birth–death generator and its stationary vectors;
Layer 2 the single-server queue with a finite waiting room and its limit; Layer 3 the Erlang loss
system; Layer 4 the Engset and machine-repair models with finitely many sources. Layers 2, 3 and
4 rest on Layer 1, and the machine-repair section of Layer 4 also uses Layer 3.

## Conventions

- **States and rates.** The states of a generator are `Fin (N + 1)`, read as `{0, …, N}`. Rates
  are functions `b d : ℕ → ℝ`; `b n` is read only for `n < N` and `d n` only for `1 ≤ n ≤ N`.
  Rows index the starting state, a stationary vector is a real row vector `π` with
  `π ᵥ* Q = 0`, and a probability vector has nonnegative entries summing to `1`. These are the
  conventions of ContinuousTimeMarkovChains, whose definitions of Q-matrices and irreducible
  generators (its 1.1) are used as they are.
- **Laws on ℕ.** The stationary laws of the models of Layers 2 to 4 are written as functions
  `ℕ → ℝ` that vanish beyond the largest state, so that laws with different numbers of states can
  be compared and their limits taken; on `Fin (N + 1)` they are read through the cast to `ℕ`.
  Means are `∑_(n ≤ N) n π_n`.
- **Loads.** A model with arrival or failure rate `λ` and service rate `μ` is described by the
  ratio `λ/μ` (`ρ` for one server, `a` for the Erlang system, `r` for finite sources). The
  stationarity statements assume `λ ≥ 0` and `μ > 0`; the formulas about the laws assume a
  nonnegative ratio, which is what makes their normalizing sums positive.
- **Division.** In Lean `x/0 = 0` and `0⁻¹ = 0`. A normalizing sum that vanishes makes a law
  identically `0`; each statement excludes this by its hypotheses, and the Checks record what the
  junk values give where a hypothesis is dropped.
- **Lean names.** `Suggested.lean` states the six headline theorems. The stationary laws of the
  individual models, the comparisons with Mathlib's laws, the Erlang recursion, the carried load
  and the identities of Layer 4 follow from them in one or two steps or by algebra; they are
  targets stated below in prose, without Lean names.

## Layer 1: birth–death generators

### 1.1 The birth–death generator

Define `birthDeathGenerator`: `birthDeathGenerator N b d` is the matrix on `Fin (N + 1)` with
entry `b n` at `(n, n + 1)` for `n < N`, entry `d n` at `(n, n − 1)` for `1 ≤ n ≤ N`, diagonal
entry minus the sum of the rates out of `n`, and `0` elsewhere (Zukerman, §11, pp. 191–192, for
the generator with state-dependent rates; §2.5.2, equations (225)–(226), p. 95, for the rates of
a birth–death process). Its rows sum to zero for all real rates.

- It is a Q-matrix in the sense of ContinuousTimeMarkovChains 1.1 if and only if `b n ≥ 0` for
  every `n < N` and `d n ≥ 0` for every `1 ≤ n ≤ N`.
- It is an irreducible generator in the sense of ContinuousTimeMarkovChains 1.1 if and only if
  `b n > 0` for every `n < N` and `d n > 0` for every `1 ≤ n ≤ N`.

Route: the off-diagonal entries are the rates; a state leads to a larger one only through the
births in between and to a smaller one only through the deaths, since the only nonzero
off-diagonal entries join neighbours.

**Checks.**
- `N = 2`, `b = 1`, `d = 2` gives `[[−1, 1, 0], [2, −3, 1], [0, 2, −2]]`, the birth–death matrix
  of the Checks of ContinuousTimeMarkovChains 4.3; it is a Q-matrix and irreducible.
- `N = 2`, `b = (1, 0)`, `d = 1` is a Q-matrix but not irreducible: state `2` is not reached from
  state `0`.
- `b 0 = −1` makes the entry `(0, 1)` negative, so the matrix is not Metzler.
- `N = 0`: the matrix is the `1 × 1` zero matrix, a Q-matrix and irreducible, and both conditions
  on the rates are empty.

*Needs:* ContinuousTimeMarkovChains 1.1 (Metzler matrices, Q-matrices, the relation "leads to"
and irreducible generators); Mathlib `Matrix.of`, `Relation.ReflTransGen`. (Proved here.)

### 1.2 Stationary vectors and detailed balance

Prove `vecMul_birthDeathGenerator_eq_zero_iff`: for all real rates and every real row vector `π`,
`π Q = 0` if and only if `π_i Q_ij = π_j Q_ji` for all `i, j`, that is, if and only if
`π_n b_n = π_(n+1) d_(n+1)` for every `n < N`. So every stationary vector of a birth–death
generator, signed or not, satisfies detailed balance; for a positive stationary law this is
reversibility in the sense of detailed balance. (Zukerman, §11, pp. 191–192, derives the
equations `π_(i−1) λ_(i−1) = π_i μ_i` from the balance equations (407)–(409) by adding them
successively; §2.5.10, p. 102, equation (254) and the discussion after it, gives the reversibility
of birth–death processes.)

Route: write `F_n = π_n b_n − π_(n+1) d_(n+1)` for `n < N`. The `n`-th entry of `πQ` is `−F_0`
for `n = 0`, `F_(n−1) − F_n` for `0 < n < N` and `F_(N−1)` for `n = N` (for `N ≥ 1`), so
`πQ = 0` forces `F_0 = F_1 = ⋯ = F_(N−1) = 0`. Detailed balance for non-neighbours and on the
diagonal is trivial. The converse is the computation of ContinuousTimeMarkovChains 5.1, first
bullet (detailed balance implies `πQ = 0`), stated there for Q-matrices; its argument uses only
that the rows sum to zero, which holds here for all real rates.

**Checks.**
- `N = 1`, `b 0 = 2`, `d 1 = 1`, `π = (1, 2)`: `πQ = (−2 + 2, 2 − 2) = 0` and
  `π_0 b_0 = 2 = π_1 d_1`.
- Signs play no role: `N = 1`, `b 0 = −1`, `d 1 = 1` gives `Q = [[1, −1], [1, −1]]`, and
  `π = (1, −1)` has `πQ = 0` and `π_0 Q_01 = −1 = π_1 Q_10`.
- The statement is special to birth–death matrices: the cycle `C₃` of ContinuousTimeMarkovChains
  1.1 has the uniform stationary vector, which fails detailed balance (Check of
  ContinuousTimeMarkovChains 5.1).

*Needs:* 1.1; ContinuousTimeMarkovChains 5.1 (first bullet); Mathlib `Matrix.vecMul`.

### 1.3 The product form of the stationary law

Define `productWeight` by `productWeight b d n = ∏_(k < n) b k / d (k + 1)`, and `birthDeathLaw`
by letting `birthDeathLaw N b d` be the vector of product weights on `Fin (N + 1)` divided by
their sum. Prove `stationary_iff_eq_birthDeathLaw`: if
`b n ≥ 0` for every `n < N` and `d n > 0` for every `1 ≤ n ≤ N`, a vector `π` is a stationary
probability vector of the birth–death generator if and only if `π = birthDeathLaw N b d`
(Zukerman, §11, equations (411)–(412), p. 192; Adan–Resing, §4.2.2, p. 31, for constant rates).
No birth rate needs to be positive: when `b k = 0` the states above `k` get mass `0`.

Route: by 1.2, `πQ = 0` gives `π_(n+1) = π_n b_n / d_(n+1)`, so `π_n = π_0 productWeight b d n`,
and the normalization fixes `π_0`; the weights are nonnegative with `productWeight b d 0 = 1`, so
their sum is at least `1`. Conversely the product weights satisfy the equations of 1.2. When every
rate is positive, the generator is irreducible by 1.1, and the uniqueness also follows from
ContinuousTimeMarkovChains 4.3; that roadmap's 4.4 then gives `exp(tQ)_ij → π_j` for the law
above, its 5.1 gives `π_i exp(tQ)_ij = π_j exp(tQ)_ji` for every `t ≥ 0`, and its 5.2 is
satisfied, as its Check on birth–death matrices records. Those consequences are not restated
here.

**Checks.**
- `N = 2`, `b = 1`, `d = 2`: the weights are `1, 1/2, 1/4` and the law is `(4/7, 2/7, 1/7)`, the
  stationary law of the Check of ContinuousTimeMarkovChains 4.3.
- A vanishing birth rate: `N = 2`, `b = (1, 0)`, `d = 1` gives `(1/2, 1/2, 0)`, and it is the only
  stationary probability vector although the generator is not irreducible.
- Positive death rates are needed: for `N = 1`, `b 0 = 0`, `d 1 = 0` the generator is `0`, every
  probability vector is stationary, and `birthDeathLaw` is `(1, 0)` (the weight `0/0` is `0`), so
  `(0, 1)` is stationary and differs from it.
- Nonnegative birth rates are needed: for `N = 2`, `b = −1`, `d = 1` the weights are `1, −1, 1`,
  the law is `(1, −1, 1)` and no probability vector is stationary.

*Needs:* 1.1, 1.2; Mathlib `Finset.prod_range_succ`; ContinuousTimeMarkovChains 4.3 for the
alternative route.

### Examples

The three-state matrix with `b = 1`, `d = 2`; the reducible matrix with `b = (1, 0)`; the zero
generator on two states; the signed two-state example.

### Dependencies

ContinuousTimeMarkovChains 1.1 (Q-matrices and irreducible generators), 5.1 (first bullet) and,
for the alternative route of 1.3, 4.3. Mathlib `Matrix.of`, `Matrix.vecMul`,
`Relation.ReflTransGen`, `Finset.prod_range_succ`.

## Layer 2: the single-server queue with a finite waiting room

### 2.1 The truncated geometric law

Define `mm1nLaw` by `mm1nLaw N ρ n = ρⁿ / ∑_(k ≤ N) ρᵏ` for `n ≤ N` and `0` for `n > N`. Prove
that for arrival rate `λ ≥ 0` and service rate `μ > 0`, a vector on `Fin (N + 1)` is a stationary
probability vector of the birth–death generator with `b = λ` and `d = μ` if and only if it is
`mm1nLaw N (λ/μ)` (Zukerman, §12.3, equations (416)–(421), pp. 195–196). This is the M/M/1/N
queue: one exponential server and room for `N` customers in the system, arrivals finding it full
being lost.

Route: 1.3 with constant rates; the product weight is `ρⁿ`.

**Checks.**
- For `ρ ≠ 1` and `n ≤ N`, `mm1nLaw N ρ n = (1 − ρ)ρⁿ / (1 − ρ^(N+1))` (`geom_sum_eq`); for
  `ρ = 1` it is `1/(N + 1)` (the case `ρ = 1` is Zukerman's exercise Homework 12.1, p. 196).
- `N = 2`, `ρ = 1/2`: `(4/7, 2/7, 1/7)`; `ρ = 2`: `(1/7, 2/7, 4/7)`. `ρ = 0` gives the law
  concentrated at `0`, since `0⁰ = 1`.
- A positive service rate is needed: for `N = 1`, `λ = 1`, `μ = 0` the only stationary
  probability vector is `(0, 1)`, while `λ/μ = 0` gives `mm1nLaw 1 0 = (1, 0)`.
- The rate of accepted arrivals equals the rate of departures: `λ(1 − π_N) = μ(1 − π_0)`; for
  `N = 2`, `ρ = 1/2`, `μ = 1`: `(1/2)(6/7) = 3/7 = 1 − 4/7`.

*Needs:* 1.3; Mathlib `geom_sum_eq`.

### 2.2 The mean number in the system

Prove that for `ρ ≥ 0` with `ρ ≠ 1`,
`∑_(n ≤ N) n · mm1nLaw N ρ n = ρ/(1 − ρ) − (N + 1)ρ^(N+1) / (1 − ρ^(N+1))`. (Proved here; the
formula is the derivative of the geometric sum. Zukerman's exercises Homework 12.2,
pp. 197–198, and Homework 12.3, p. 198, compute the mean for `N = 5`, `ρ = 1`, and for `N = 2`.)

Route: `∑ n ρⁿ = ρ (d/dρ) ∑ ρⁿ` for the finite sum, with `geom_sum_eq`, divided by the
normalizing sum; or induction on `N`.

**Checks.**
- `N = 2`, `ρ = 1/2`: the mean is `2/7 + 2/7 = 4/7`, and the formula gives `1 − 3 · (1/8)/(7/8)
  = 4/7`. `ρ = 2`: the mean is `10/7`, and the formula gives `−2 + 24/7 = 10/7`.
- At `ρ = 1` the mean is `N/2` (`5/2` for `N = 5`, Zukerman, Homework 12.2), while the formula
  with Lean's `x/0 = 0` gives `0`: the hypothesis `ρ ≠ 1` is needed for `N ≥ 1`.
- `ρ ≥ 0` is needed: for `N = 1`, `ρ = −1` the normalizing sum is `0`, the law is `0` and so is
  its mean, while the formula gives `−1/2`.

*Needs:* 2.1; Mathlib `geom_sum_eq`.

### 2.3 The limit of an infinite waiting room

Prove `tendsto_mm1nLaw_geometric`: for a success probability `p ≠ 0` (a member of
`unitInterval`) and `ρ = 1 − p`, as `N → ∞` the mass `mm1nLaw N ρ n` tends, for every `n`, to
the mass `(1 − p)ⁿ p` of Mathlib's geometric law `geometricMeasure p`, and the mean tends to
`(1 − p)/p`, the mean of that law (Tau Ceti's
`TauCeti.Probability.integral_id_map_cast_geometricMeasure`). In terms of `0 ≤ ρ < 1`: the limit
is `(1 − ρ)ρⁿ` with mean `ρ/(1 − ρ)`, the stationary law of the M/M/1 queue (Adan–Resing,
§4.2.1, equation (4.6), p. 31; §4.3, p. 32, for the mean). This is a limit of the finite laws; no
chain on an infinite state space is used. Prove also, from the closed forms:

- for `ρ ≥ 1`, every mass `mm1nLaw N ρ n` tends to `0` and the mean tends to `+∞`;
- for `ρ ≥ 0`, the mass `mm1nLaw N ρ N` of a full system tends to `0` if `ρ ≤ 1` and to
  `1 − 1/ρ` if `ρ > 1` (proved here, from the closed form of Zukerman, equation (422), p. 196).

Route: the closed forms of 2.1 and 2.2; for `ρ < 1`, `ρ^(N+1) → 0` and `(N + 1)ρ^(N+1) → 0`
(`tendsto_pow_atTop_nhds_zero_of_lt_one`, `tendsto_self_mul_const_pow_of_lt_one`), and the
masses of the limit are `geometricMeasure_real_singleton`. For `ρ > 1`,
`mm1nLaw N ρ N = (ρ − 1)/(ρ − ρ^(−N))` and the mean exceeds `N − ρ/(ρ − 1)`; for `ρ = 1` the
masses are `1/(N + 1)` and the mean is `N/2`.

**Checks.**
- `p ≠ 0` is needed: at `p = 0`, `ρ = 1` and the masses `1/(N + 1)` tend to `0`, while
  `geometricMeasure 0` is Mathlib's point mass at `0`, of mass `1` there.
- `p = 1`: `ρ = 0`, every `mm1nLaw N 0` is the point mass at `0`, which is `geometricMeasure 1`,
  and both means are `0`.
- `ρ = 3/2`: the full-system probability tends to `1/3`; it is `0.33723…` at `N = 10`.
- `ρ = 1`: the full-system probability is `1/(N + 1) → 0` and the mean is `N/2 → ∞`.
- `ρ ≥ 0` is needed in the last statement: at `ρ = −1` the normalizing sum is `1` for even `N` and
  `0` for odd `N`, so `mm1nLaw N (−1) N` alternates between `1` and `0`.

*Needs:* 2.1, 2.2; Mathlib `ProbabilityTheory.geometricMeasure`,
`ProbabilityTheory.geometricMeasure_real_singleton`, `geom_sum_eq`,
`tendsto_pow_atTop_nhds_zero_of_lt_one`, `tendsto_self_mul_const_pow_of_lt_one`.

### Examples

The queues with `N = 2` and `ρ = 1/2, 1, 2`; the queue with `N = 5`, `ρ = 1`; the limits at
`ρ = 0`, `1/2`, `1`, `3/2`.

### Dependencies

Layer 1 (1.3). Mathlib `geom_sum_eq`, `ProbabilityTheory.geometricMeasure`,
`ProbabilityTheory.geometricMeasure_real_singleton`, `tendsto_pow_atTop_nhds_zero_of_lt_one`,
`tendsto_self_mul_const_pow_of_lt_one`. Tau Ceti
`TauCeti.Probability.integral_id_map_cast_geometricMeasure` (the value of the limit).

## Layer 3: the Erlang loss system

### 3.1 The truncated Poisson law and Erlang's formula

Define `erlangLaw` by `erlangLaw c a n = (aⁿ/n!) / ∑_(k ≤ c) aᵏ/k!` for `n ≤ c` and `0` for
`n > c`, and Erlang's loss formula `erlangB` by `erlangB c a = erlangLaw c a c`, written
`B(c, a)`: the stationary probability that all `c` servers are busy.

- For arrival rate `λ ≥ 0` and service rate `μ > 0` per server, a vector on `Fin (c + 1)` is a
  stationary probability vector of the birth–death generator with `b = λ` and `d n = nμ` if and
  only if it is `erlangLaw c (λ/μ)` (Adan–Resing, §11.2, Example 11.2.1 and equation (11.2),
  p. 115; Zukerman, §8.2, equations (339)–(344), pp. 153–155). This is the M/M/c/c loss system:
  `c` servers and no waiting room.
- For `a ≥ 0` (in `ℝ≥0`) and `n ≤ c`, `erlangLaw c a n` is the mass of `{n}` under Mathlib's
  `poissonMeasure a` conditioned on `{0, …, c}` (`ProbabilityTheory.cond` with `Set.Iic c`), that
  is, the mass of `{n}` divided by the mass of `{0, …, c}` (Zukerman, §8.2, p. 155). The
  normalizing sum is `e^a` times that mass, which Tau Ceti computes as `1 − P(c + 1, a)` with the
  regularized incomplete gamma function `P` (`TauCeti.Probability.poissonMeasure_real_Iic`).

Route: 1.3 with product weight `aⁿ/n!`; the factor `e^(−a)` of `poissonMeasure_real_singleton`
cancels.

**Checks.**
- `c = 2`, `a = 1`: `(2/5, 2/5, 1/5)`, so `B(2, 1) = 1/5`; `B(3, 2) = (4/3)/(19/3) = 4/19`;
  `B(1, a) = a/(1 + a)`.
- `B(0, a) = 1` for every `a`, and `B(c, 0) = 0` for `c ≥ 1`.
- A Check against a plausible wrong definition: dividing by `∑_(k ≤ c) aᵏ` instead of
  `∑_(k ≤ c) aᵏ/k!` gives `B(2, 1) = 1/6`, not `1/5`.

*Needs:* 1.3; Mathlib `ProbabilityTheory.poissonMeasure`,
`ProbabilityTheory.poissonMeasure_real_singleton`, `ProbabilityTheory.cond`; Tau Ceti
`TauCeti.Probability.poissonMeasure_real_Iic` (for the second form of the normalizing sum).

### 3.2 The Erlang recursion and Jagerman's integral

- Prove that for `a ≥ 0`, `B(c + 1, a) = aB(c, a) / (c + 1 + aB(c, a))` (Adan–Resing, §11.3,
  equation (11.3), p. 116; Zukerman, §8.3, equations (345)–(347), p. 156).
- Prove `inv_erlangB_eq_integral`: for `a > 0`, `1/B(c, a) = a ∫_(y > 0) e^(−ay)(1 + y)^c dy`
  (Zukerman, §8.3, equation (350), p. 156, where it is attributed to Jagerman).

Route: for the recursion, divide numerator and denominator of `B(c + 1, a)` by `∑_(k ≤ c) aᵏ/k!`.
For the integral, expand `(1 + y)^c` binomially and use `∫ yʲ e^(−ay) dy = j!/a^(j+1)`
(`Real.integral_rpow_mul_exp_neg_mul_Ioi` with `Real.Gamma_nat_eq_factorial`), which gives
`∑_j (c choose j) j!/aʲ = (c!/a^c) ∑_(k ≤ c) aᵏ/k!`.

**Checks.**
- From `B(2, 1) = 1/5` the recursion gives `B(3, 1) = (1/5)/(3 + 1/5) = 1/16`, and directly
  `(1/6)/(8/3) = 1/16`.
- `a ≥ 0` is needed in the recursion: at `a = −1` the normalizing sum for `c = 1` is `0`, so
  `B(1, −1) = 0` by the junk value, while `B(2, −1) = (1/2)/(1/2) = 1` differs from the right side
  `0`.
- Jagerman's formula at `c = 1`: `a ∫ e^(−ay)(1 + y) dy = 1 + 1/a = 1/B(1, a)`. At `a = 0` it
  fails: `1/B(0, 0) = 1`, while the right side is `0`.
- With Tau Ceti's regularized incomplete gamma function `P` and its integer form
  `TauCeti.regularizedGamma_natCast`, `∑_(k ≤ c) aᵏ/k! = e^a (1 − P(c + 1, a))` for `a ≥ 0`, so
  `1/B(c, a) = c! a^(−c) e^a (1 − P(c + 1, a))` for `a > 0`; at `c = 0` both sides are `1`.

*Needs:* 3.1; Mathlib `Real.integral_rpow_mul_exp_neg_mul_Ioi`, `Real.Gamma_nat_eq_factorial`.

### 3.3 Monotonicity and the carried load

- Prove that for `a ≥ 0` the mean number of busy servers is
  `∑_(n ≤ c) n · erlangLaw c a n = a(1 − B(c, a))` (Adan–Resing, §11.2, p. 115, state it, derived
  there from Little's law; Zukerman, §8.8, p. 160, poses it as the exercise Homework 8.9). Here it
  is an identity of the stationary law: `n aⁿ/n! = a · a^(n−1)/(n − 1)!`.
- Prove that for `a > 0`, `B(c + 1, a) < B(c, a)` (Zukerman, §8.6, p. 158).
- Prove `erlangB_strictMonoOn`: for `c ≥ 1`, `a ↦ B(c, a)` is strictly increasing on `[0, ∞)`.
  Zukerman, §8.6, p. 158, leaves the proof as the exercise Homework 8.4, and Homework 8.8, p. 160,
  asks for the strict inequality, both with a hint by induction on `c` through the recursion; the
  route below is this roadmap's own.

Route: by the recursion, `B(c + 1, a) < B(c, a)` is `a(1 − B(c, a)) < c + 1`, and the left side
is the mean of a law on `{0, …, c}`, at most `c`. For the load,
`1/B(c, a) = ∑_(j ≤ c) c!/((c − j)! aʲ)` for `a > 0`, whose terms with `j ≥ 1` strictly decrease
in `a`, and `c ≥ 1` gives at least one such term; at `a = 0`, `B(c, 0) = 0 < B(c, a)`.

**Checks.**
- `c = 2`, `a = 1`: the mean is `2/5 + 2/5 = 4/5 = 1 · (1 − 1/5)`.
- Consequence: since the mean is at most `c`, `B(c, a) ≥ 1 − c/a` for `a > 0` (Zukerman, §8.5,
  (353) and (354), p. 158); for `c = 1`, `a = 2`: `2/3 ≥ 1/2`.
- `a > 0` is needed for strict decrease: `B(1, 0) = B(2, 0) = 0`. `c ≥ 1` is needed for strict
  increase: `B(0, a) = 1` for every `a`.
- `a ≥ 0` is needed for the mean: at `c = 1`, `a = −1` the law is `0` by the junk value, so its
  mean is `0`, while `a(1 − B(1, a)) = −1`.

*Needs:* 3.1, 3.2.

### 3.4 Many servers

- Prove `tendsto_erlangB_mul`: for a load per server `a ≥ 0`, `B(c, ac)` tends, as `c → ∞`, to
  `0` if `a ≤ 1` and to `1 − 1/a` if `a > 1` (Zukerman, §8.7, p. 159, poses it as the exercise
  Homework 8.5, with a guide through Jagerman's integral credited there to a treatment based on
  Syski's book; the route below is this roadmap's own).
- Prove that for fixed `a ≥ 0` and every `n`, `erlangLaw c a n` tends, as `c → ∞`, to the Poisson
  mass `e^(−a) aⁿ/n!` of `poissonMeasure a`, the stationary law of the system with infinitely
  many servers (Adan–Resing, §11.1, equation (11.1), p. 114), obtained as a limit of the finite
  laws.

Route for the first: substituting `y = t/(ac)` in 3.2 gives
`1/B(c, ac) = ∫_(t > 0) e^(−t) (1 + t/(ac))^c dt` for `a > 0` and `c ≥ 1`. The integrands increase
in `c` to `e^(−t(1 − 1/a))` (`Real.tendsto_one_add_div_pow_exp`), so by monotone convergence
(`MeasureTheory.lintegral_tendsto_of_tendsto_of_monotone`) the integrals tend to `∞` if `a ≤ 1`
and to `1/(1 − 1/a)` if `a > 1`. At `a = 0`, `B(c, 0) = 0` for `c ≥ 1`. For the second, the
normalizing sums tend to `e^a` (`NormedSpace.expSeries_div_hasSum_exp`).

**Checks.**
- `a = 2`: `B(c, 2c)` is `0.5048…` at `c = 100` and `0.50049…` at `c = 1000`, near `1/2`.
- `a = 1`: `B(c, c)` is `0.0757…` at `c = 100` and `0.0248…` at `c = 1000`; it tends to `0`
  slowly.
- `a ≥ 0` is needed: for `a = −1`, `B(2, −2) = 2/(1 − 2 + 2) = 2` and `B(5, −5) ≈ 2.11`, far from
  the value `0` given by the formula.
- `a = 3`, `n = 0`: `erlangLaw 10 3 0 = 0.049801…` against `e^(−3) = 0.049787…`.

*Needs:* 3.1, 3.2; Mathlib `Real.tendsto_one_add_div_pow_exp`,
`MeasureTheory.lintegral_tendsto_of_tendsto_of_monotone`, `NormedSpace.expSeries_div_hasSum_exp`,
`ProbabilityTheory.poissonMeasure_real_singleton`.

### Examples

`c = 1, 2, 3` with `a = 1, 2`; the scaled systems with `a = 1/2, 1, 2`; the junk-value examples at
negative loads.

### Dependencies

Layer 1 (1.3). Mathlib `ProbabilityTheory.poissonMeasure`,
`ProbabilityTheory.poissonMeasure_real_singleton`, `ProbabilityTheory.cond`,
`Real.integral_rpow_mul_exp_neg_mul_Ioi`, `Real.Gamma_nat_eq_factorial`,
`Real.tendsto_one_add_div_pow_exp`, `MeasureTheory.lintegral_tendsto_of_tendsto_of_monotone`,
`NormedSpace.expSeries_div_hasSum_exp`. Tau Ceti `TauCeti.Probability.poissonMeasure_real_Iic`
and `TauCeti.regularizedGamma_natCast` (the incomplete-gamma form of the normalizing sum).

## Layer 4: finite-source models

The targets of this layer are specializations of 1.3 and identities between explicit finite laws;
they are stated in prose and carry no Lean names.

### 4.1 The Engset law

Define the Engset law with `M` sources, `c` servers and load `r` per idle source as
`(M choose n) rⁿ / ∑_(k ≤ c) (M choose k) rᵏ` for `n ≤ c` and `0` for `n > c`.

- With `M` sources, each idle source calling at rate `λ ≥ 0`, and `c` servers of rate `μ > 0`, a
  vector on `Fin (c + 1)` is a stationary probability vector of the birth–death generator with
  `b n = (M − n)λ` and `d n = nμ` if and only if it is the Engset law with load `λ/μ` (Zukerman,
  §10.1, equations (387)–(391), pp. 184–185). Here `M − n` is the number of idle sources,
  truncated at `0`, so `c` may exceed `M`; the states above `M` then get mass `0`.
- For `p ∈ [0, 1]` with `p ≠ 1`, `r = p/(1 − p)` and `n ≤ c`, the Engset law at `n` is the mass
  of `{n}` under Mathlib's binomial law `binomial M p` conditioned on `{0, …, c}`. With `c ≥ M`
  the Engset law is the binomial law itself, with `p = λ/(λ + μ)`.

Route: 1.3 with product weight `(M choose n) rⁿ` (the product `M(M − 1) ⋯ (M − n + 1)/n!`); for
the binomial form, `(M choose n) pⁿ (1 − p)^(M−n) = (1 − p)^M (M choose n) rⁿ` for `n ≤ M`
(`ProbabilityTheory.binomial_real_singleton`).

**Checks.**
- `M = c = 3`, `r = 1`: `(1/8, 3/8, 3/8, 1/8)`, the binomial law with `p = 1/2`.
- `M = 3`, `c = 1`, `r = 1`: `(1/4, 3/4)`.
- `p ≠ 1` is needed: at `p = 1`, `r = 1/0 = 0` and the Engset law is the point mass at `0`, while
  the binomial law with `p = 1` is the point mass at `M`; for `M = c = 1`, `n = 0` the two sides
  are `1` and `0`.

*Needs:* 1.3; Mathlib `Nat.choose`, `ProbabilityTheory.binomial`,
`ProbabilityTheory.binomial_real_singleton`, `ProbabilityTheory.cond`.

### 4.2 The Engset law weighted by the calling rates

Prove that for `M ≥ 1` sources and `r ≥ 0`, the Engset law weighted by the calling rate of each
state, `(M − n) π_n / ∑_(m ≤ c) (M − m) π_m` with `π` the Engset law with `M` sources, is the
Engset law with `M − 1` sources, for every `n`. Zukerman, §10.2, equations (392)–(393),
pp. 185–186, for `c < M`, takes the weighted mass of the full state `n = c` as the blocking
probability (the call congestion) and obtains from this identity the Engset loss formula; it
differs from the time congestion, the mass of `c` under the Engset law with `M` sources. Only the
identity between the two finite laws is a target here; its reading as the law seen by an arriving
call is outside the scope.

Route: `(M − n)(M choose n) = M (M − 1 choose n)` (`Nat.choose_mul_succ_eq`), and the factor `M`
cancels.

**Checks.**
- `M = 3`, `c = 1`, `r = 1`: the weighted mass of the full state is
  `2 · (3/4) / (3 · 1/4 + 2 · 3/4) = 2/3`, which is the last mass of the Engset law with two
  sources, `(1/3, 2/3)`; the mass of the full state under the law with three sources is `3/4`.
- `M ≥ 1` is needed: for `M = 0` every weight `(0 − n)` is `0`, the weighted law is `0` by the
  junk value, and the law with `M − 1 = 0` sources has mass `1` at `0`.
- `r ≥ 0` is needed: for `M = 2`, `c = 1`, `r = −1/2` the normalizing sum `1 + 2r` vanishes, the
  weighted law is `0`, and the law with one source is `(2, −1)`.

*Needs:* 4.1; Mathlib `Nat.choose`, `Nat.choose_mul_succ_eq`.

### 4.3 The machine-repair model

Define the machine-repair law with `M` machines and load `r` as
`M(M − 1) ⋯ (M − n + 1) rⁿ / ∑_(k ≤ M) M(M − 1) ⋯ (M − k + 1) rᵏ` for `n ≤ M` and `0` for
`n > M`, with the falling factorial `Nat.descFactorial M n`.

- With `M` machines, each working machine breaking down at rate `λ ≥ 0`, and one repairer of
  rate `μ > 0`, a vector on `Fin (M + 1)` is a stationary probability vector of the birth–death
  generator with `b n = (M − n)λ` and `d n = μ` if and only if it is the machine-repair law with
  load `λ/μ` (an instance of Zukerman, §11, equation (412), p. 192, with the state-dependent
  rates `λ_i = (M − i)λ` and `μ_i = μ`).
- For `r > 0` and `n ≤ M`, the machine-repair law at `n` equals `erlangLaw M (1/r) (M − n)`. So
  the number of working machines has the Erlang law with `M` servers and load `μ/λ`, and the
  probability that the repairer is idle is `B(M, μ/λ)`. (Proved here.)

Route: 1.3 with product weight `M(M − 1) ⋯ (M − n + 1) rⁿ`; for the comparison,
`M!/(M − n)! · rⁿ = r^M M! · (1/r)^(M−n)/(M − n)!` (`Nat.factorial_mul_descFactorial`), and the
factor `r^M M!` cancels.

**Checks.**
- `M = 2`, `r = 1`: `(1/5, 2/5, 2/5)`, and `B(2, 1) = 1/5` is the mass at `0`.
- Departures balance breakdowns: `μ(1 − π_0) = λ(M − L)` with `L` the mean; for `M = 2`,
  `λ = μ = 1`: `4/5 = 2 − 6/5`.
- `r > 0` is needed: at `r = 0` the machine-repair law is the point mass at `0`, while
  `erlangLaw M 0⁻¹ (M − n) = erlangLaw M 0 (M − n)` is the point mass at `n = M`.
- `n ≤ M` is needed: at `n = M + 1` the left side is `0`, while `M − n = 0` in `ℕ` and the right
  side is the positive mass `erlangLaw M (1/r) 0` of the Erlang law at `0`.

*Needs:* 1.3, 3.1; Mathlib `Nat.descFactorial`, `Nat.factorial_mul_descFactorial`.

### Examples

The Engset systems with `M = 3`; the two-machine repair model; the degenerate cases `M = 0`,
`p = 1`, `r = 0`.

### Dependencies

Layer 1 (1.3) and, for 4.3, Layer 3 (3.1). Mathlib `Nat.choose`, `Nat.choose_mul_succ_eq`,
`Nat.descFactorial`, `Nat.factorial_mul_descFactorial`, `ProbabilityTheory.binomial`,
`ProbabilityTheory.binomial_real_singleton`, `ProbabilityTheory.cond`.

## Scope and ownership

This roadmap owns: the birth–death generator on `{0, …, N}`, the characterization of its
stationary vectors by detailed balance and the product form under nonnegative birth and positive
death rates; the stationary laws of M/M/1/N, M/M/c/c, the Engset system and the machine-repair
model; the mean of the M/M/1/N law and its limits as `N → ∞`; the Erlang recursion, Jagerman's
integral, the monotonicity of Erlang's formula, the carried load and the many-server limits; the
identity between the rate-weighted Engset law and the Engset law with one source fewer; the
identification of the machine-repair law with an Erlang law.

Taken from other roadmaps and the libraries, not restated:

- ContinuousTimeMarkovChains supplies, for finite state spaces, Q-matrices and irreducible
  generators (1.1, whose definitions are used as they are), the stationary law and its
  uniqueness (4.3), convergence of `exp(tQ)` (4.4), detailed balance for the generator and the
  semigroup (5.1) and Kolmogorov's criterion (5.2). The theorems above are statements about one
  family of generators; 1.2 and 1.3 cite 5.1 and 4.3, and none of these theorems is stated again.
  Its scope names queueing models as outside it.
- Mathlib supplies the geometric, Poisson and binomial laws (`geometricMeasure`,
  `poissonMeasure`, `binomial`), their masses and conditioning (`ProbabilityTheory.cond`); Tau
  Ceti supplies the mean of the geometric law
  (`TauCeti.Probability.integral_id_map_cast_geometricMeasure`) and the cumulative mass of the
  Poisson law (`TauCeti.Probability.poissonMeasure_real_Iic`). StandardDistributions develops the
  elementary theory of these laws (Layer 1: the binomial, geometric and Poisson entries, 1.2, 1.3
  and 1.4 in its sectioned numbering) and conditioning and truncation (7.3); the laws of 3.1 and
  4.1 are instances of that conditioning, and nothing of it is restated. Tau Ceti's
  `TauCeti.regularizedGamma_natCast`, the integer form of the regularized incomplete gamma
  function (SpecialFunctionsEiLiErfIncompleteGamma), gives the second form of Erlang's formula in
  the Check of 3.2.
- DirectedMatrixTreeAndBEST, Layer 3, the Markov chain tree theorem (3.1), writes the stationary
  law of a finite chain as a ratio of arborescence sums and has a birth–death matrix among its
  Checks; the product form here is a different, explicit statement for tridiagonal generators, and
  this roadmap does not depend on that one. PopulationDynamics, 3.3, treats discrete-time
  birth–death chains with absorbing ends and their fixation probabilities, a different object.
- MarkovChainsAndRenewal owns renewal processes (its Layer 4 onward) and their connection with
  Poisson processes, and StochasticCalculus §0.6 owns the homogeneous Poisson counting process.
  Nothing here uses them.

Outside the scope: every statement about the paths of a queue (waiting-time and sojourn-time
laws, departure processes, busy periods, Burke's output theorem); what an arriving customer
observes, including the reading of the rate-weighted laws of 4.2 as arrival distributions and the
equality of time and call congestion for Poisson arrivals; queues on an infinite state space as
chains, including M/M/1 on all of `ℕ` and Jackson networks, which appear here only as limits of
finite stationary laws; Little's law in its sample-path, renewal-reward or Palm form; the PASTA
property; M/G/1, Pollaczek–Khinchine and the insensitivity of loss systems to the service-time
law; time reversal of a chain and generators with time-dependent rates; dimensioning and every
numerical procedure.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Data/Matrix/Mul.lean`: `Matrix.vecMul` (notation `π ᵥ* Q`, the row vector `πQ`).
  `Mathlib/Data/Matrix/Defs.lean`: `Matrix.of`. `Mathlib/Logic/Relation.lean`:
  `Relation.ReflTransGen`.
- `Mathlib/Algebra/BigOperators/Basic.lean` and its companions: `Finset.prod_range_succ`.
  `Mathlib/Algebra/Field/GeomSum.lean`: `geom_sum_eq` (for `x ≠ 1`,
  `∑_(i < n) xⁱ = (xⁿ − 1)/(x − 1)` in a division ring).
- `Mathlib/Analysis/SpecificLimits/Basic.lean`: `tendsto_pow_atTop_nhds_zero_of_lt_one`
  (`rⁿ → 0` for `0 ≤ r < 1`). `Mathlib/Analysis/SpecificLimits/Normed.lean`:
  `tendsto_self_mul_const_pow_of_lt_one` (`n rⁿ → 0` for `0 ≤ r < 1`).
- `Mathlib/Data/Nat/Choose/Basic.lean`: `Nat.choose`, `Nat.choose_mul_succ_eq`
  (`choose n k · (n + 1) = choose (n + 1) k · (n + 1 − k)`).
  `Mathlib/Data/Nat/Factorial/Basic.lean`: `Nat.descFactorial` (`n(n − 1) ⋯ (n − k + 1)`, which
  is `0` for `k > n`) and `Nat.factorial_mul_descFactorial`
  (`(n − k)! · n.descFactorial k = n!` for `k ≤ n`).
- `Mathlib/Probability/Distributions/Geometric.lean`: `ProbabilityTheory.geometricMeasure p` for
  `p : unitInterval` (the point mass at `0` when `p = 0`) and
  `ProbabilityTheory.geometricMeasure_real_singleton` (for `p ≠ 0`, the mass of `{n}` is
  `(1 − p)ⁿ p`).
- `Mathlib/Probability/Distributions/Poisson/Basic.lean`: `ProbabilityTheory.poissonMeasure r` for
  `r : ℝ≥0`, `ProbabilityTheory.poissonMeasure_real_singleton` (mass `e^(−r) rⁿ/n!`).
- `Mathlib/Probability/Distributions/Binomial.lean`: `ProbabilityTheory.binomial n p` for
  `p : unitInterval`, `ProbabilityTheory.binomial_real_singleton` (mass
  `(n choose k) pᵏ (1 − p)^(n−k)`).
- `Mathlib/Probability/ConditionalProbability.lean`: `ProbabilityTheory.cond` (the measure
  conditioned on a set, `μ[t | s] = (μ s)⁻¹ μ (s ∩ t)` for measurable `s`).
- `Mathlib/Analysis/SpecialFunctions/Gamma/Basic.lean`: `Real.integral_rpow_mul_exp_neg_mul_Ioi`
  (for `a, r > 0`, `∫_(t > 0) t^(a−1) e^(−rt) dt = (1/r)^a Γ(a)`), `Real.Gamma_nat_eq_factorial`.
- `Mathlib/Analysis/SpecialFunctions/Complex/LogBounds.lean`: `Real.tendsto_one_add_div_pow_exp`
  (`(1 + t/n)ⁿ → eᵗ`).
- `Mathlib/MeasureTheory/Integral/Lebesgue/Add.lean`:
  `MeasureTheory.lintegral_tendsto_of_tendsto_of_monotone` (monotone convergence for a sequence of
  a.e. measurable functions with values in `ℝ≥0∞`).
- `Mathlib/Analysis/Normed/Algebra/Exponential.lean`: `NormedSpace.expSeries_div_hasSum_exp`
  (`∑ xⁿ/n!` has sum `exp x`).

### From Tau Ceti

- `TauCeti/Probability/Distributions/Geometric/Basic.lean`:
  `TauCeti.Probability.integral_id_map_cast_geometricMeasure` (the mean of the real cast of
  `geometricMeasure p` is `(1 − p)/p`), the value of the mean in 2.3.
- `TauCeti/Probability/Distributions/Poisson/Tail.lean`:
  `TauCeti.Probability.poissonMeasure_real_Iic` (the mass of `{0, …, n}` under
  `poissonMeasure r` is `1 − P(n + 1, r)`), for the normalizing sum in 3.1.
- `TauCeti/Analysis/SpecialFunctions/IncompleteGamma.lean`: `TauCeti.regularizedGamma_natCast`
  (for `n ≠ 0` and `x ≥ 0`, `P(n, x) = 1 − e^(−x) ∑_(j < n) xʲ/j!`). Used in a Check of 3.2.
- `Suggested.lean` imports none of these modules.

### From TauCetiRoadmap.ContinuousTimeMarkovChains

- 1.1: the definitions of Metzler matrices, Q-matrices, the relation "leads to" and irreducible
  generators, used in 1.1 above; `Suggested.lean` does not restate them.
- 4.3: an irreducible Q-matrix on a nonempty finite state space has exactly one stationary
  probability vector (alternative route of 1.3).
- 5.1, first bullet: detailed balance for a Q-matrix implies `πQ = 0` (route of 1.2; the
  argument uses only that rows sum to zero).
- 4.4 and 5.1 are named in 1.3 for the consequences they give for birth–death generators; no
  target here depends on them.

### From TauCetiRoadmap.StandardDistributions

- Layer 1, the binomial, geometric and Poisson entries (1.2, 1.3, 1.4 in its sectioned
  numbering), and 7.3, conditioning a law on an event of positive mass, the operation that the
  laws of 3.1 and 4.1 are instances of. Named for comparison; no route here depends on it.

## References

- Moshe Zukerman, *Introduction to Queueing Theory and Stochastic Teletraffic Models*,
  arXiv:1307.2968, version 27 (March 2025), read in full on arXiv. Cited as Zukerman: §2.5.2,
  equations (225)–(226), p. 95; §2.5.10, equation (254), p. 102; §8.2, equations (339)–(344),
  pp. 153–155; §8.3, equations (345)–(350), p. 156; §8.5, (353)–(354), p. 158; §8.6 and
  Homework 8.4, p. 158; §8.7, Homework 8.5, p. 159; §8.8, Homeworks 8.8 and 8.9, p. 160; §10.1,
  equations (387)–(391), pp. 184–185; §10.2, equations (392)–(393), pp. 185–186; §11, equations
  (407)–(412), pp. 191–192; §12.3, equations (416)–(422) and Homeworks 12.1–12.3, pp. 195–198.
  The items marked as Homework are exercises of that text; where one is a target here, the route
  given is this roadmap's own.
- Ivo Adan and Jacques Resing, *Queueing Systems*, lecture notes, Eindhoven University of
  Technology, posted on I. Adan's page (`www.win.tue.nl/~iadan/queueing.pdf`). Cited as
  Adan–Resing: §4.2.1, equation (4.6), p. 31; §4.2.2, p. 31; §4.3, p. 32; §11.1, equation (11.1),
  p. 114; §11.2, Example 11.2.1 and equation (11.2), p. 115; §11.3, equation (11.3), p. 116.
- The mean of 2.2, the limit of the full-system probability in 2.3 and the identification of the
  machine-repair law with an Erlang law in 4.3 are elementary and proved here without a locator.

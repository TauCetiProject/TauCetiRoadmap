# Roadmap: asymptotic variance of finite markov chains

**Summary.** A Markov chain Monte Carlo estimate of a mean `E_π f` is a time average
`(1/n) S_n`, where `S_n = f(X_0) + ⋯ + f(X_{n−1})` is summed along a chain whose stationary law is
`π`. Its error is governed by the growth of `Var(S_n)`, which is linear in `n` with a slope called
the asymptotic variance. This roadmap develops that slope for a chain on a finite state space:
throughout, the chain is irreducible (every state reaches every state), `π` is its stationary
law, and `f` is a real function on the states. Writing `P` for the transition matrix, `Π` for the
matrix all of whose rows are `π`, and `f̄ = f − E_π f`, the fundamental matrix is
`Z = (I − P + Π)⁻¹ − Π` and the asymptotic variance is `σ²(f) = 2 ⟨f̄, Z f̄⟩_π − Var_π f`.

Headline theorems:

- **Poisson equation.** The solutions `g` of `g − P g = f − E_π f` are exactly the functions
  `Z f + c` with `c` constant.
- **Asymptotic variance.** From every initial law, `Var(S_n)/n → σ²(f)`; the chain may be
  periodic. For every solution `g` of the Poisson equation, `σ²(f) = E_π[g² − (P g)²]`.
- **Spectral bound.** If `γ` is the spectral gap, the least value of `E(g)/Var_π g` over the
  functions of nonzero variance, `E` being the Dirichlet form, then
  `σ²(f) ≤ (2/γ − 1) Var_π f`. The chain need not be reversible.
- **Peskun's theorem.** Let `π` be stationary for two chains `κ₁` and `κ₂`, with `κ₂` irreducible
  and reversible with respect to `π`. If `κ₁` moves from `x` to `y` at least as often as `κ₂` for
  every pair of distinct states `x`, `y`, then `σ²(κ₁, f) ≤ σ²(κ₂, f)` for every `f`.

The roadmap builds on MarkovChainsAndRenewal, which supplies the stationary law of an irreducible
chain, its positivity, occupation frequencies and convergence to equilibrium; on
MarkovChainMixing, whose transition matrix, Dirichlet form, spectral gap, Poincaré inequality and
spectral decomposition are used here with the same normalizations; on Tau Ceti's path law of a
chain and its finite path masses; and on Mathlib's matrices, variances and covariances. The
Metropolis–Hastings kernel of MathematicalStatisticsFoundations is the main example of Peskun's
ordering. The central limit theorem for the chain, whose limiting variance is `σ²(f)`, is not
treated here.

Layer 1 below defines the fundamental matrix, identifies it with the summed deviations
`Σ_t (P^t − Π)`, and solves the Poisson equation. Layer 2 defines the asymptotic variance and
proves its formulas: the limit of `Var(S_n)/n`, the series of autocovariances for aperiodic
chains, and the characterization of `σ²(f) = 0`. Layer 3 expresses `σ²` through the Dirichlet
form and proves the spectral bound and, for reversible chains, a variational formula. Layer 4
compares chains by Dirichlet forms and by Peskun's off-diagonal order, from which the optimality of
the Metropolis acceptance rule follows.

## Conventions

- **State spaces.** `S` is a finite type with a σ-algebra in which singletons are measurable and
  decidable equality (`[Fintype S] [DecidableEq S] [MeasurableSpace S]
  [MeasurableSingletonClass S]`).
- **Chains.** A chain is a kernel `κ : Kernel S S` with `[IsMarkovKernel κ]`, and `π` is a
  probability measure on `S`. Stationarity is Mathlib's `κ.Invariant π`, reversibility is
  `κ.IsReversible π`, and irreducibility is Mathlib's `Kernel.IsIrreducible Measure.count κ`
  (every state reaches every state in some number `n ≥ 0` of steps, so a chain on one state is
  irreducible), as in MarkovChainMixing. Aperiodicity is Tau Ceti's `κ.IsAperiodic`. The standing
  hypotheses of every statement are that `κ` is Markov, irreducible where the statement says so,
  and that `π` is a stationary probability; for an irreducible chain `π` is then unique and gives
  every state positive mass (MarkovChainsAndRenewal 3.2).
- **Matrices.** `P = transitionMatrix κ`, with `P x y = κ x {y}` (MarkovChainMixing 2.1), acting on
  functions by `(P g) x = Σ_y P x y · g y`; `Π = stationaryMatrix π`, with `Π x y = π {y}`;
  `I = 1`. The matrix inverse is Mathlib's `Matrix.inv`, which is `0` at a singular matrix.
- **Functions.** `E_π f = ∫ f ∂π`, `f̄ = f − E_π f`, `⟨f, g⟩_π = Σ_x π {x} · f x · g x`, and
  `Var_π f = Var[f; π] = ⟨f̄, f̄⟩_π`. The Dirichlet form and the spectral gap are those of
  MarkovChainMixing 2.4, copied verbatim in 3.1.
- **Path laws.** The law of the chain started from a probability `ν` is Tau Ceti's
  `markovChainLaw ν κ` on `ℕ → S`, with coordinates `ω k`, and `S_n(ω) = Σ_{k<n} f (ω k)`
  (so `S_0 = 0`). The stationary chain is the case `ν = π`.
- **Junk values.** Real division by zero is `0`, and an infimum over an empty index type is `0`.
  Each definition says what this gives in its degenerate cases.

## Layer 1: the fundamental matrix and the Poisson equation

### 1.1 The fundamental matrix

Define `stationaryMatrix π`, the matrix `Π` with every row equal to `π`, and
`fundamentalMatrix κ π = (1 − P + Π)⁻¹ − Π` (written `Z`). Its API, used by the targets below,
for `κ` irreducible with stationary law `π`:

- `P Π = Π P = Π Π = Π`, and so `(P − Π)^t = P^t − Π` for `t ≥ 1`;
- `1 − P + Π` is invertible: if `(1 − P + Π) v = 0`, then `π`-averaging gives `E_π v = 0`, so
  `P v = v`, and a function with `P v = v` attains its maximum on a set closed under the
  transitions, which is everything by irreducibility; so `v` is constant with mean `0`;
- `Z` has row sums `0` and `π Z = 0`, and `(1 − P) Z = Z (1 − P) = 1 − Π` (Aldous–Fill,
  Chapter 2, (2.7), for the row sums). These identities use only that `P` is row-stochastic, that
  `π` is a stationary probability and that `1 − P + Π` is invertible.

**Checks.**

- The two-state chain with `κ(a, b) = p`, `κ(b, a) = q`, `p + q > 0`: `π = (q, p)/(p + q)` and
  `Z = (p + q)⁻² · [[p, −p], [−q, q]]`. For `p = 1/3`, `q = 1/2`: `π = (3/5, 2/5)` and
  `Z = [[12/25, −12/25], [−18/25, 18/25]]`. The matrix `(1 − P + Π)⁻¹` of Kemeny and Snell has row
  sums `1` instead.
- The chain that exchanges two states: `π` is uniform and `Z = [[1/4, −1/4], [−1/4, 1/4]]`.
- One state: `P = Π = 1` and `Z = 0`.
- Irreducibility is needed: for the identity kernel on two states and uniform `π`,
  `1 − P + Π = Π` has rank `1`, so `Z` is the junk value `−Π`.

*Needs:* Mathlib `Matrix.inv`, `Matrix.mul_nonsing_inv`, `Matrix.nonsing_inv_mul`,
`Matrix.isUnit_iff_isUnit_det`, `Kernel.Invariant`, `Kernel.IsIrreducible`; Tau Ceti
`Kernel.toMatrix`, `Kernel.coe_toMatrix_apply`, `Kernel.toMatrix_pow`, `Kernel.toMatrix_mem_rowStochastic`,
`Kernel.isIrreducible_count_iff_forall_reaches`; MarkovChainsAndRenewal 3.1 and 3.2.

### 1.2 The fundamental matrix as a sum

Prove, for `κ` irreducible with stationary law `π`:

- the Cesàro means of the partial sums of `Σ_t (P^t − Π)` converge to `Z`:
  `Σ_{t<n} (1 − t/n) (P^t − Π) → Z` (`tendsto_cesaro_fundamentalMatrix`), for periodic chains
  too;
- if `κ` is also aperiodic, the series itself converges: `Σ_t (P^t − Π) = Z`
  (`hasSum_fundamentalMatrix`).

This is the definition of the fundamental matrix in Aldous–Fill, Chapter 2, (2.6), where the
Cesàro limit is used for periodic chains. Route: with `A = P − Π`, the partial sum up to `m` is
`(1 − A)⁻¹ (1 − A^m) − Π`, and its Cesàro mean is `(1 − A)⁻¹ (1 − (1/n) Σ_{m=1}^n (P^m − Π)) − Π`;
the averages `(1/n) Σ_{m=1}^n P^m` tend to `Π`, because the expected occupation frequencies of an
irreducible finite chain tend to `π` from every starting state (MarkovChainsAndRenewal 2.3, 2.4
and 3.2). In the aperiodic case `P^t → Π` (MarkovChainsAndRenewal 3.5), so some power of `A` has
operator norm below `1`, the terms decay geometrically, and the series converges to
`(1 − A)⁻¹ − Π`.

**Checks.**

- The exchange chain: the partial sums alternate between `1 − Π = [[1/2, −1/2], [−1/2, 1/2]]`
  and `0`, so the series does not converge, while their Cesàro means tend to
  `Z = [[1/4, −1/4], [−1/4, 1/4]]`. Aperiodicity is needed in the second item.
- The two-state chain: `P^t − Π = (1 − p − q)^t (1 − Π)`, and the geometric series gives
  `(1 − Π)/(p + q) = Z`.

*Needs:* 1.1; Mathlib `HasSum`, `Filter.Tendsto`, `summable_geometric_of_lt_one`; Tau Ceti `Kernel.IsAperiodic`;
MarkovChainsAndRenewal 2.3, 2.4, 3.2 and 3.5.

### 1.3 The Poisson equation

Prove, for `κ` irreducible with stationary law `π`:

- for `h : S → ℝ`, the equation `g − P g = h` has a solution exactly when `E_π h = 0`;
- **Poisson equation** (`poisson_iff`): for `f g : S → ℝ`, `g − P g = f − E_π f` holds exactly
  when `g = Z f + c` for a constant `c`.

Route: if `g` solves the equation and `c = E_π g`, then `(1 − P + Π)(g − c) = f̄`, so
`g − c = (Z + Π) f̄ = Z f`, because `Π f̄ = 0` and `Z` kills constants; conversely
`(1 − P) Z f = (1 − Π) f = f̄` by 1.1. (Proved here; the fundamental matrix is due to Kemeny and
Snell.)

**Checks.**

- The two-state chain with `p = 1/3`, `q = 1/2` and `f` the indicator of `a`: `Z f = (12/25, −18/25)`,
  and `g − P g = (12/25 − (2/3)(12/25) − (1/3)(−18/25), …) = (2/5, −3/5) = f − 3/5`.
- Mean zero is needed for solvability: `g − P g = 1` has no solution, since its `π`-average
  reads `0 = 1`.
- Irreducibility is needed for uniqueness: for the identity kernel on two states every `g`
  solves `g − P g = 0`.

*Needs:* 1.1; MarkovChainsAndRenewal 3.2.

### Examples

The two-state chain, with `Z = (p + q)⁻² [[p, −p], [−q, q]]`; the exchange chain, for which only
the Cesàro form of 1.2 holds.

### Dependencies

Layer 1 uses Mathlib's matrix inverse, Tau Ceti's kernel–matrix dictionary and period, and
MarkovChainsAndRenewal 2.3, 2.4, 3.1, 3.2 and 3.5.

## Layer 2: the asymptotic variance

### 2.1 Definition and the Poisson formula

Define `asymptoticVariance κ π f = 2 ⟨f̄, Z f̄⟩_π − ⟨f̄, f̄⟩_π` (written `σ²(f)`). Prove, for `κ`
irreducible with stationary law `π`:

- `σ²(f) = Σ_{x,y} f̄ x · Γ x y · f̄ y` with `Γ x y = π(x) Z x y + π(y) Z y x + π(x) π(y) − π(x) [x = y]`,
  the form of Aldous–Fill, Chapter 2, (2.11) and (2.12);
- **the Poisson formula** (`asymptoticVariance_eq_of_poisson`): for every solution `g` of
  `g − P g = f − E_π f`, `σ²(f) = Σ_x π(x) (g x² − (P g x)²)`; in particular the right side does
  not depend on the solution;
- `σ²(f + c) = σ²(f)` for constants `c`, `σ²(a f) = a² σ²(f)`, and `σ²(f) ≥ 0`, since
  `g² − (P g)²` has the same `π`-mean as `P(g²) − (P g)²`, the variance of `g` under `κ x`;
- the lazy chain with rows `½ δ_x + ½ κ x` has asymptotic variance `2 σ²(f) + Var_π f`, its
  Poisson solution being `2 Z f`.

Route for the Poisson formula: with `u = Z f`, `2 ⟨f̄, u⟩ − ⟨f̄, f̄⟩ = 2 ⟨u − P u, u⟩ − ⟨u − P u, u − P u⟩
= ⟨u, u⟩ − ⟨P u, P u⟩`, and 1.3 reduces every solution to `u + c`, which changes
`g² − (P g)²` by `2c (g − P g)`, of `π`-mean `0`. (Proved here.)

**Checks.**

- The two-state chain with `f` the indicator of `a`: `σ²(f) = pq(2 − p − q)/(p + q)³`. For
  `p = 1/3`, `q = 1/2` it is `42/125`, and the Poisson formula with `g = (12/25, −18/25)` gives
  `42/125` again; its lazy chain has `σ² = 114/125 = 2 · 42/125 + 6/25`.
- The exchange chain: `σ²(f) = 0` for every `f`.
- Without stationarity the definition is not the asymptotic variance: `σ²` depends on `π`, and
  for `κ` with rows `(1/4, 3/4)` and `(1/2, 1/2)`, `π` uniform, `f` the indicator of `a`, it
  gives `3/20`, while its stationary law `(2/5, 3/5)` gives `18/125`.
- Irreducibility is needed in the Poisson formula: for two disjoint copies of the exchange chain on
  `{a, b}` and `{c, d}`, `π` uniform and `f = (1, −1, 0, 0)`, the function `g = (1/2, −1/2, 0, 0)`
  solves the Poisson equation and `Σ_x π(x) (g x² − (P g x)²) = 0`, while `1 − P + Π` is singular,
  `Z = −Π`, and the definition gives `σ²(f) = −Var_π f = −1/2`.

*Needs:* 1.1, 1.3; Mathlib `Matrix.mulVec`, `variance`.

### 2.2 The variance of the sums

Prove `tendsto_variance_sum_div`: for `κ` irreducible with stationary law `π`, every initial
probability `ν` and every `f`,

    Var(S_n) / n  →  σ²(f),   the variance taken under markovChainLaw ν κ.

Aperiodicity is not assumed. (Aldous–Fill, Chapter 2, (2.11), for the stationary chain, and
Chapter 4, Proposition 4.29, for reversible stationary chains; the form here, from every initial
law, is proved here.)

Route: let `g = Z f` and `D_j = g(ω (j + 1)) − (P g)(ω j)`. Then
`S_n − n E_π f = Σ_{j<n} D_j + g(ω 0) − g(ω n)`, and `S_n` has the variance of this centred sum. From the finite path masses of the chain, `E D_j = 0`,
`E[D_i D_j] = 0` for `i ≠ j`, and `E[D_j²] = E[h(ω j)]` with `h = P(g²) − (P g)²`, so
`E[(Σ_{j<n} D_j)²] = Σ_{j<n} (ν P^j) h`. The Cesàro averages of `ν P^j` tend to `π`
(MarkovChainsAndRenewal 2.3, 2.4 and 3.2), and `π h = σ²(f)` by 2.1. The boundary term is bounded
by `2 max |g|`, so its effect on `√Var(S_n)` is bounded and vanishes after division by `√n`.

**Checks.**

- The path `a – b – c` with `κ(a, b) = κ(c, b) = 1`, `κ(b, a) = κ(b, c) = 1/2` has period `2` and
  `π = (1/4, 1/2, 1/4)`. For `f` the indicator of `a`, `σ²(f) = 1/8`. Started at `a`, `S_n` is `1`
  plus a binomial count with `⌊(n − 1)/2⌋` trials of probability `1/2`, so
  `Var(S_n) = ⌊(n − 1)/2⌋/4`, and `Var(S_n)/n` is `199/1600` at `n = 400`, tending to `1/8`.
- Irreducibility is needed: for the identity kernel on two states, `ν = π` uniform and `f` the
  indicator of `a`, `S_n = n f(ω 0)` and `Var(S_n) = n²/4`.
- One state: `S_n = n f` is deterministic, and `σ²(f) = 0`.

*Needs:* 1.1, 1.3, 2.1; Tau Ceti `markovChainLaw`, `markovChainLaw_map_prefix_apply_singleton`,
`Measure.markovChainLaw_map_eval`; Mathlib `variance`; MarkovChainsAndRenewal 2.3, 2.4 and 3.2.

### 2.3 Autocovariances

Prove `hasSum_covariance`: for `κ` irreducible and aperiodic with stationary law `π`,

    σ²(f) = Var_π f + 2 Σ_{k ≥ 1} Cov(f(ω 0), f(ω k)),

the covariances being taken under `markovChainLaw π κ`, and the series converging. Route: the
covariance is `⟨f̄, P^k f̄⟩_π`, and the second item of 1.2 sums the series to
`⟨f̄, (Z − 1 + Π) f̄⟩_π`. (Aldous–Fill, Chapter 11, (11.2), where the series is written without the
aperiodicity that its convergence needs.)

**Checks.**

- Aperiodicity is needed: for the exchange chain and `f` the indicator of `a`, the covariances
  are `−1/4, 1/4, −1/4, …`, the series diverges, and `σ²(f) = 0`.
- The two-state chain: the covariances are `Var_π f · (1 − p − q)^k`, and the sum gives
  `Var_π f · (2 − p − q)/(p + q)`, which is `σ²(f)` of 2.1.

*Needs:* 1.2, 2.1; Mathlib `covariance`; Tau Ceti `markovChainLaw`,
`markovChainLaw_map_prefix_apply_singleton`.

### 2.4 When the asymptotic variance vanishes

Prove `asymptoticVariance_eq_zero_iff`: for `κ` irreducible with stationary law `π`, `σ²(f) = 0`
exactly when there is `u : S → ℝ` with `f x − E_π f = u x − u y` whenever `κ x {y} > 0`. In that
case `S_n − n E_π f = u(ω 0) − u(ω n)` almost surely, so the centred sums stay bounded. Route: by
2.1, `σ²(f)` is the `π`-average of the variance of `g` under `κ x`, which vanishes exactly when `g`
is constant on the support of each row; since every state has positive mass, take `u = g`.
(Proved here.)

**Checks.**

- On `{a, b, c}` with `κ(a, b) = κ(b, c) = 1` and `κ(c, a) = κ(c, b) = 1/2`, an aperiodic chain
  with `π = (1/5, 2/5, 2/5)`: `f = (0, 1, −1)` has `σ²(f) = 0` with `u = (0, 0, −1)`, while the
  indicator of `a` has `σ² = 8/125`.
- For the cycle `x ↦ x + 1` on three states every `f` has `σ²(f) = 0`, since `f̄` sums to `0`
  around the cycle.
- `f` constant: `f̄ = 0` and `σ²(f) = 0`.
- Irreducibility is needed: for the identity kernel on two states with the stationary law `π = δ_a`
  and `f = (0, 1)`, `Z = −Π` and `σ²(f) = 0`, but no `u` exists, since the step from `b` to `b`
  would need `f b − E_π f = 1` to vanish.

*Needs:* 1.3, 2.1; MarkovChainsAndRenewal 3.2.

### Examples

The two-state chain, with `σ²(f) = pq(2 − p − q)/(p + q)³` for the indicator of `a`; the
periodic path `a – b – c`; the exchange chain, for which every `σ²` vanishes.

### Dependencies

Layer 2 uses Layer 1, Tau Ceti's path law and its finite path masses, Mathlib's variance and
covariance, and MarkovChainsAndRenewal 2.3, 2.4 and 3.2.

## Layer 3: Dirichlet forms and the spectral bound

### 3.1 The Dirichlet form of the Poisson solution

Copy verbatim from MarkovChainMixing 2.4 the definitions `dirichletForm κ π f`, the form
`E(f) = ½ Σ_{x,y} (f x − f y)² · π {x} · κ x {y}`, and `spectralGap κ π`, the infimum of
`E(f)/Var_π f` over the `f` with `Var_π f ≠ 0` (written `γ`; it is `0` on one state). Prove
`asymptoticVariance_eq_two_mul_dirichletForm`: for every `κ` with stationary law `π`, irreducible
or not,

    σ²(f) = 2 E(Z f) − Var_π f.

Route: for a stationary `π`, `E(g) = ⟨g, g⟩_π − ⟨g, P g⟩_π` (MarkovChainMixing 2.4). If
`1 − P + Π` is invertible, the identities `(1 − P) Z = 1 − Π` and `Z 1 = 0` of 1.1 hold, so
`E(Z f) = ⟨Z f, f̄⟩_π = ⟨f̄, Z f̄⟩_π`. If it is singular, Mathlib's inverse is `0`, so `Z = −Π`,
`Z f` is the constant `−E_π f`, `Z f̄ = 0`, and both sides are `−Var_π f`. (Proved here.)

**Checks.**

- The two-state chain with `p = 1/3`, `q = 1/2`, `f` the indicator of `a`: `Z f = (12/25, −18/25)`,
  `E(Z f) = (3/5)(1/3)(6/5)² = 36/125`, and `2 · 36/125 − 6/25 = 42/125`.
- Stationarity is needed: for the exchange chain with `π = (2/3, 1/3)`, which is not stationary,
  and `f` the indicator of `a`, the definition gives `σ²(f) = 0`, while `2 E(Z f) − Var_π f = 1/36`.
- A reducible chain: for the identity kernel on two states with `π` uniform, `Z = −Π`, and for the
  indicator of `a` both sides are `−1/4 = −Var_π f`.

*Needs:* 1.1, 2.1; MarkovChainMixing 2.4; Mathlib `variance`, `Matrix.nonsing_inv_apply_not_isUnit`.

### 3.2 The spectral bound

Prove `asymptoticVariance_le_spectralGap`: for every `κ` with stationary law `π`, reversible or
not, irreducible or not,

    σ²(f) ≤ (2/γ − 1) Var_π f.

Route. Always `γ ≥ 0`, so `2/γ ≥ 0` (with `2/0 = 0`). If `1 − P + Π` is singular, `Z = −Π` and
`Z f̄ = 0`, so the left side is `−Var_π f` and the bound holds; this happens whenever the chain has
two closed classes, whose stationary laws `π₁ ≠ π₂` give the nonzero row vector `π₁ − π₂` killed by
`1 − P + Π` from the left. Otherwise let `u = Z f`: by 3.1, `E(u) = ⟨f̄, u⟩_π`; by the Poincaré
inequality of MarkovChainMixing 2.4, `γ Var_π u ≤ E(u)`; and `⟨f̄, u⟩_π ≤ √(Var_π f · Var_π u)`, so
for `γ > 0`, `⟨f̄, u⟩_π ≤ Var_π f / γ`, and the definition of `σ²(f)` gives the bound. If `γ = 0`,
either no function has nonzero variance, `f̄` vanishes on the support of `π` and both sides are
`0`, or the infimum is attained (MarkovChainMixing 2.4) at a `g` with `E(g) = 0` and
`Var_π g ≠ 0`; such a `g` is constant along the transitions from the states of the support of `π`,
which is a union of closed classes, so there are two closed classes and the singular case applies. For an
irreducible chain on at least two states `γ > 0`. (Aldous–Fill, Chapter 4, Proposition 4.29 and its
proof, for reversible chains in the form `σ²(f) ≤ (1 + λ₂)/(1 − λ₂) · Var_π f` with
`λ₂ = 1 − γ`; the statement without reversibility and without irreducibility, and the route above,
are proved here.)

A consequence for `κ` irreducible and reversible with respect to `π`, recorded as a remark rather
than a separate target, is the **spectral representation**: if `l j`, `φ j` is an orthonormal
eigenbasis of MarkovChainMixing 2.1, then
`σ²(f) = Σ_{j : l j ≠ 1} (1 + l j)/(1 − l j) · ⟨f, φ j⟩_π²`, and equality holds in the bound
exactly when `f̄` is an eigenfunction for the eigenvalue `1 − γ` or `f` is constant (Aldous–Fill,
Chapter 4, proof of Proposition 4.29; the equality case is proved here, from the strict increase
of `l ↦ (1 + l)/(1 − l)` and MarkovChainMixing 2.4, by which `1 − γ` is the largest eigenvalue
other than `1`).

**Checks.**

- The two-state chain with `p = 1/3`, `q = 1/2`: `γ = p + q = 5/6`, `Var_π f = 6/25` for the
  indicator of `a`, and `(12/5 − 1) · 6/25 = 42/125 = σ²(f)`: the bound is an equality, `f̄` being
  an eigenfunction.
- The cycle `x ↦ x + 1` on three states is not reversible: `γ = 3/2`, so the bound for the
  indicator of `a` is `(4/3 − 1) · 2/9 = 2/27`, and `σ² = 0`.
- Negative eigenvalues: the exchange chain has `γ = 2`, the bound reads `σ²(f) ≤ 0`, and
  `σ²(f) = 0`. Bounding by the absolute spectral gap of MarkovChainMixing 2.2, which is `0` here,
  would give the junk value `−Var_π f`.
- One state: `γ = 0`, `2/γ − 1 = −1`, and both sides are `0`.
- A reducible chain: for the identity kernel on two states with `π` uniform, `γ = 0`, `Z = −Π`, and
  both sides are `−Var_π f`.

*Needs:* 1.1, 2.1, 3.1; Mathlib `Matrix.nonsing_inv_apply_not_isUnit`; MarkovChainMixing 2.1 and
2.4 (the Poincaré inequality, its attainment, the form of `E` for a stationary law, the largest
eigenvalue other than `1`); Tau Ceti `Kernel.IsClosedSet`, `Kernel.subtype`,
`Kernel.isMarkovKernel_subtype_iff_isClosedSet`; MarkovChainsAndRenewal 2.3 and 3.2 (closed classes
and the stationary laws of the chains restricted to them).

### 3.3 The variational formula

Prove `isGreatest_variational`: for `κ` irreducible and reversible with respect to `π`,

    (σ²(f) + Var_π f)/2 = ⟨f̄, Z f̄⟩_π = max over g of ( 2 ⟨f̄, g⟩_π − E(g) ),

the maximum being attained at `g = Z f`. Route: reversibility makes `E` the quadratic form of the
symmetric operator `1 − P` on `ℓ²(π)`; with `u = Z f`,
`2 ⟨f̄, g⟩_π − E(g) = ⟨f̄, u⟩_π − E(g − u)`, and `E ≥ 0`. (Andrieu–Livingstone, Section 2.2,
display after Corollary 2.8, gives `2 ⟨f̄, (1 − λP)⁻¹ f̄⟩ − ⟨f̄, f̄⟩` for `λ < 1`; the variational
form is proved here.)

**Checks.**

- The two-state chain with `p = 1/3`, `q = 1/2`: the maximum is `(42/125 + 30/125)/2 = 36/125`,
  which is `⟨f̄, Z f̄⟩_π = E(Z f)` of 3.1.
- Reversibility is needed: for the cycle `x ↦ x + 1` on three states and the indicator of `a`,
  the maximum is `4/27`, the value for the symmetrized chain with rows `½ δ_{x+1} + ½ δ_{x−1}`,
  which has the same Dirichlet form, while `(σ² + Var_π f)/2 = (0 + 2/9)/2 = 1/9`.

*Needs:* 1.3, 2.1, 3.1; Mathlib `Kernel.IsReversible`, `Kernel.IsReversible.invariant`;
MarkovChainsAndRenewal 3.1.

### Examples

The two-state chain, where the spectral bound is an equality; the cycle on three states, where it
is strict and the variational formula fails.

### Dependencies

Layer 3 uses 1.1, 1.3, 2.1, MarkovChainMixing 2.1 and 2.4, Mathlib's matrix inverse, and
MarkovChainsAndRenewal 2.3, 3.1 and 3.2.

## Layer 4: comparison of chains

### 4.1 Ordering by Dirichlet forms

Prove `asymptoticVariance_le_of_dirichletForm_le`: let `π` be stationary for `κ₁`, and let `κ₂` be
irreducible and reversible with respect to `π`. If `E₂(g) ≤ E₁(g)` for every `g`, where `E_i` is the
Dirichlet form of `κ_i` and `π`, then `σ²(κ₁, f) ≤ σ²(κ₂, f)` for every `f`. Route: `κ₁` is
irreducible, since a set `A` closed for `κ₁` has `E₁(1_A) = 0` by stationarity, hence
`E₂(1_A) = 0`, which forces `A` to be empty or everything; with `u = Z₁ f`,
`⟨f̄, u⟩_π = 2 ⟨f̄, u⟩_π − E₁(u) ≤ 2 ⟨f̄, u⟩_π − E₂(u) ≤ ⟨f̄, Z₂ f̄⟩_π` by 3.1 and 3.3.
(Andrieu–Livingstone, Theorem 2.7, attributed there to Caracciolo, Pelissetto and Sokal and to
Tierney, for two reversible chains; the form with `κ₁` only stationary is proved here.)

**Checks.**

- A reversible chain and its lazy version: `E` of the lazy chain is half of `E`, so `σ²(κ, f)` is
  at most the lazy value `2 σ²(κ, f) + Var_π f` of 2.1.
- For an irreducible reversible chain whose eigenvalues are nonnegative (a lazy chain, for
  instance), the Dirichlet form of the two-step kernel `κ ^ 2` exceeds that of `κ` by
  `⟨g, (P − P²) g⟩_π ≥ 0`, so `σ²(κ ^ 2, f) ≤ σ²(κ, f)`.
- Reversibility of `κ₂` is needed: see the second Check of 4.2.

*Needs:* 3.1, 3.3; Tau Ceti `Kernel.isIrreducible_count_iff_forall_reaches`.

### 4.2 Peskun's theorem

Prove `asymptoticVariance_le_of_offDiag_le`: let `π` be stationary for `κ₁`, and let `κ₂` be
irreducible and reversible with respect to `π`. If `κ₂ x {y} ≤ κ₁ x {y}` for all `x ≠ y`, then
`σ²(κ₁, f) ≤ σ²(κ₂, f)` for every `f`. Route: the Dirichlet form only sees the off-diagonal
entries, each with a nonnegative weight, so `E₂ ≤ E₁`, and 4.1 applies. (Peskun, 1973; Aldous–Fill,
Chapter 3, Lemma 3.4, and Andrieu–Livingstone, Corollary 2.8, for two reversible chains; the form
with `κ₁` only stationary is proved here.)

**Checks.**

- On two states with `π = (1/3, 2/3)` and the proposal that always moves, the Metropolis chain
  has `κ(a, b) = 1`, `κ(b, a) = 1/2`, and the chain with Barker's acceptance `r/(1 + r)` has
  `κ(a, b) = 2/3`, `κ(b, a) = 1/3`; both have stationary law `π`, Metropolis dominates off the
  diagonal, and for `f` the indicator of `a` the asymptotic variances are `2/27 ≤ 2/9`.
- Reversibility of `κ₂` is needed: on the cycle `ZMod 4` with uniform `π`, let `κ₂` stay with
  probability `1/2` and step to `x − 1` otherwise, and let `κ₁` stay with probability `1/4`, step
  to `x + 1` with probability `1/4` and to `x − 1` with probability `1/2`. Then `κ₁` dominates `κ₂`
  off the diagonal, both fix `π`, and for `f = (1, 0, −1, 0)`,
  `σ²(κ₁, f) = 7/10 > 1/2 = σ²(κ₂, f)`.
- Stationarity of `κ₁` is needed: on `{a, b, c}` with `π = (1/4, 1/4, 1/2)`, let `κ₂` have rows
  `(1/2, 3/10, 1/5)`, `(3/10, 1/2, 1/5)`, `(1/10, 1/10, 4/5)`, which is irreducible and reversible
  with respect to `π`, and let `κ₁` agree with `κ₂` except for the row `(7/15, 1/3, 1/5)` at `a`.
  Then `κ₁` dominates `κ₂` off the diagonal but does not fix `π`, and for `f = (0, 1, −1)` the
  definition gives `σ²(κ₁, f) = 197/80 > 39/16 = σ²(κ₂, f)`.
- Irreducibility of `κ₂` is needed: for `κ₂` the identity kernel on two states, reversible with
  respect to the uniform `π`, and `κ₁` the exchange chain, `κ₁` dominates off the diagonal, and for
  the indicator of `a` the definition gives `σ²(κ₁, f) = 0 > −1/4 = σ²(κ₂, f)`.

*Needs:* 4.1.

### 4.3 Optimality of the Metropolis acceptance

Let `π` be a probability with `π {x} > 0` for all `x`, `q` a proposal (a nonnegative matrix with
rows summing to `1`), and `M` the Metropolis–Hastings kernel of MathematicalStatisticsFoundations
9.4 for the weights `π {x}` and the proposal `q`. As a consequence of 4.2, recorded as a remark
rather than a separate target: for every kernel `κ` that is irreducible, reversible with respect to
`π`, and satisfies `κ x {y} ≤ q x y` for `x ≠ y`, `σ²(M, f) ≤ σ²(κ, f)` for every `f`. Route: reversibility gives
`κ x {y} = π(y) κ y {x}/π(x) ≤ π(y) q y x/π(x)`, so `κ x {y} ≤ M x {y}` off the diagonal; `M`
fixes `π` by MathematicalStatisticsFoundations 9.4 and Mathlib's `Kernel.IsReversible.invariant`,
and 4.2 applies. (Aldous–Fill, Chapter 11, Lemma 11.1.)

**Checks.**

- The first Check of 4.2: the Barker chain has `κ x {y} ≤ q x y` off the diagonal and loses to
  the Metropolis chain.
- Irreducibility of `κ` is needed for `σ²(κ, f)` to be the asymptotic variance: the identity
  kernel satisfies the other hypotheses, and its sums have variance growing like `n²`.

*Needs:* 4.2; MathematicalStatisticsFoundations 9.4; Mathlib `Kernel.IsReversible.invariant`.

### Examples

Metropolis against Barker on two states; the non-reversible pair on `ZMod 4` where the off-diagonal
order is reversed in the asymptotic variance.

### Dependencies

Layer 4 uses 3.1, 3.3, MathematicalStatisticsFoundations 9.4 and Tau Ceti's reachability.

## Downstream consumers

A central limit theorem for an irreducible finite chain has `σ²(f)` as its limiting variance and
takes the solution `g = Z f` of 1.3; the formula of 2.1 gives that variance in the form
`E_π[g² − (P g)²]`. Error bounds for Markov chain Monte Carlo averages, and comparisons of
samplers built from the Metropolis–Hastings kernel, consume Layers 3 and 4.

## Provenance and prior work

The fundamental matrix `(I − P + Π)⁻¹` is due to Kemeny and Snell; Aldous and Fill normalize it to
row sums `0`, as here. Peskun proved his ordering for finite reversible chains (1973); Tierney
extended it to general state spaces (1998), and Caracciolo, Pelissetto and Sokal gave the form
with Dirichlet forms (1990). These are attributed in prose and were not consulted; the locators
above are to Aldous–Fill and Andrieu–Livingstone. No formalization of these results is known to
the author.

## Scope and ownership

This roadmap owns, for irreducible chains on finite state spaces: the fundamental matrix and its
expression as a summed or Cesàro-summed series, the Poisson equation, the asymptotic variance with
its formulas (the Poisson formula, the limit of `Var(S_n)/n` from every initial law, the series of
autocovariances, the characterization of `σ²(f) = 0`), its expression through the Dirichlet form,
the spectral bound, the spectral representation and variational formula for reversible chains, the
ordering by Dirichlet forms, Peskun's theorem and the optimality of the Metropolis acceptance.

Left to other roadmaps and to the libraries:

- MarkovChainsAndRenewal owns stationary laws, their uniqueness and positivity, occupation
  frequencies, periods and convergence to equilibrium; Layers 1 and 2 above consume them.
- MarkovChainMixing (an open roadmap, not on main) owns the transition matrix (its 2.1), the
  spectral decomposition of reversible chains (2.1), the Dirichlet form, the spectral gap, the
  Poincaré inequality and the largest eigenvalue other than `1` (2.4), and the bound
  `γ · E[S_t²] ≤ 2 t Var_π f` for the centred sums of a stationary reversible chain (6.4). The three
  definitions are copied here verbatim. The bound of 3.2 above concerns the limit `σ²(f)`, has the
  smaller constant `2/γ − 1` in place of `2/γ`, and holds for chains that are not reversible; it
  does not restate 6.4. That roadmap's comparison of spectral gaps (2.4) gives the spectral-gap
  half of Peskun's ordering, which is not restated here.
- MathematicalStatisticsFoundations 9.4 owns the Metropolis–Hastings kernel and its
  reversibility, consumed in 4.3.
- The central limit theorem for Markov chains, Berry–Esseen bounds, estimators of `σ²(f)` (batch
  means, spectral variance estimators), mean hitting times and their relation to the fundamental
  matrix, continuous-time chains, chains on infinite state spaces, non-reversible samplers built
  by lifting, and importance sampling and control variates are not treated here.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Probability/Kernel/Invariance.lean`: `ProbabilityTheory.Kernel.Invariant κ π`
  (`π.bind κ = π`), `ProbabilityTheory.Kernel.IsReversible κ π`, and
  `ProbabilityTheory.Kernel.IsReversible.invariant` (a Markov kernel reversible for `π` leaves `π`
  invariant). `Mathlib/Probability/Kernel/Irreducible.lean`:
  `ProbabilityTheory.Kernel.IsIrreducible φ κ`, used with `φ = Measure.count`.
- `Mathlib/LinearAlgebra/Matrix/NonsingularInverse.lean`: `Matrix.inv` (written `A⁻¹`, `0` when
  `A.det` is not a unit, which is `Matrix.nonsing_inv_apply_not_isUnit`), `Matrix.mul_nonsing_inv`
  and `Matrix.nonsing_inv_mul` (for `IsUnit A.det`), `Matrix.isUnit_iff_isUnit_det`. `Matrix.mulVec` (written `*ᵥ`).
- `Mathlib/Probability/Moments/Variance.lean`: `ProbabilityTheory.variance` (written `Var[X; μ]`).
  `Mathlib/Probability/Moments/Covariance.lean`: `ProbabilityTheory.covariance` (written
  `cov[X, Y; μ]`).
- `Mathlib/Analysis/SpecificLimits/Basic.lean`: `summable_geometric_of_lt_one`; `HasSum` and
  `Filter.Tendsto` from Mathlib's topology library.

### From Tau Ceti

- `TauCeti/Probability/Kernel/Matrix.lean`: `ProbabilityTheory.Kernel.toMatrix` (entries
  `κ a {b}` in `ℝ≥0`), `Kernel.coe_toMatrix_apply` (for a finite kernel), `Kernel.toMatrix_pow`
  (for a finite kernel on a finite type with measurable singletons) and
  `Kernel.toMatrix_mem_rowStochastic` (for a Markov kernel).
- `TauCeti/Probability/Kernel/Reachability.lean`:
  `ProbabilityTheory.Kernel.isIrreducible_count_iff_forall_reaches` (with measurable singletons,
  irreducibility for counting measure means that every state reaches every state).
- `TauCeti/Probability/Kernel/ClosedClass.lean`: `ProbabilityTheory.Kernel.IsClosedSet` (no mass
  leaves the set in one step), `ProbabilityTheory.Kernel.subtype` (the restriction to a measurable
  set) and `ProbabilityTheory.Kernel.isMarkovKernel_subtype_iff_isClosedSet` (for a Markov kernel the
  restriction is Markov exactly when the set is closed); used in 3.2.
- `TauCeti/Probability/MarkovChain/Period.lean`: `ProbabilityTheory.Kernel.IsAperiodic` (every
  state has period `1`).
- `TauCeti/Probability/Process/MarkovChain.lean`: `TauCeti.Probability.markovChainLaw ν κ` (the
  path law on `ℕ → S`, a probability measure when `ν` is);
  `TauCeti.Probability.markovChainLaw_map_prefix_apply_singleton` (with measurable singletons and
  an s-finite `ν`, the path `w 0, …, w n` has mass `ν {w 0} · Π_i κ (w i) {w (i + 1)}`);
  `MeasureTheory.Measure.markovChainLaw_map_eval` (the state at time `n` has law `(κ ^ n) ∘ₘ ν`).

### From TauCetiRoadmap.MarkovChainsAndRenewal

Items are cited as "layer.item" of [MarkovChainsAndRenewal](../MarkovChainsAndRenewal/README.md).

- 2.3: a finite closed communicating class is positive recurrent, and an irreducible recurrent
  chain reaches every state almost surely from every initial law. 2.4: the expected occupation
  frequency of `y` up to time `n`, divided by `n`, tends to `P_ν(the chain reaches y) / m_y`.
- 3.1: the singleton and matrix forms of `Kernel.Invariant` and `Kernel.IsReversible`.
- 3.2: an irreducible positive recurrent chain has a unique invariant probability, with mass
  `1/m_x > 0` at `x`.
- 3.5: for an irreducible aperiodic positive recurrent chain and every initial probability `ν`,
  `tvDist (ν κ^n) π → 0`.

### From TauCetiRoadmap.MarkovChainMixing

- 2.1: the definition of `transitionMatrix` (copied verbatim), and the spectral decomposition of a
  chain reversible with respect to a positive `π` (an orthonormal eigenbasis of `ℓ²(π)` with real
  eigenvalues in `[−1, 1]`).
- 2.4: the definitions of `dirichletForm` and `spectralGap` (copied verbatim); for a stationary
  `π`, `E(f) = ⟨f, f⟩_π − ⟨f, P f⟩_π`; the Poincaré inequality `γ Var_π f ≤ E(f)` with the
  infimum attained when some `f` has nonzero variance; for an irreducible reversible chain on at
  least two states, `1 − γ` is the largest real eigenvalue of `P` other than `1`.

### From TauCetiRoadmap.MathematicalStatisticsFoundations

- [MathematicalStatisticsFoundations](../MathematicalStatisticsFoundations/README.md) 9.4: for
  positive weights and a nonnegative proposal with rows summing to `1`, the Metropolis–Hastings
  kernel (moving from `x` to `y ≠ x` with probability `q x y · min 1 (π y q y x / (π x q x y))`)
  is Markov and reversible for the weight measure; used in 4.3.

## References

- D. Aldous and J. A. Fill, *Reversible Markov chains and random walks on graphs*, unfinished
  monograph, 2002, the web edition hosted by the first author
  (`stat.berkeley.edu/~aldous/RWG/Book_Ralph/book.html`): Chapter 2 (version of September 10,
  1999), Section 2.2.2, (2.6) and (2.7), and Section 2.3, (2.10)–(2.12); Chapter 3 (September 10,
  2002), Section 3.1.2, Lemma 3.4; Chapter 4 (October 11, 1994), Section 4.4.1, Proposition 4.29;
  Chapter 11 (January 8, 2001), Section 11.1.1, (11.2), and Section 11.4.1, Lemma 11.1.
- C. Andrieu and S. Livingstone, Peskun–Tierney ordering for Markov chain and process Monte Carlo:
  beyond the reversible scenario, arXiv:1906.06197, version 1 (2019), Section 2.2: (2), (3),
  Theorem 2.7, Corollary 2.8. Numbering as in that version.
- P. H. Peskun, Optimum Monte-Carlo sampling using Markov chains, *Biometrika* 60 (1973),
  607–612. Attributed in prose only.
- L. Tierney, A note on Metropolis–Hastings kernels for general state spaces, *Annals of Applied
  Probability* 8 (1998), 1–9; S. Caracciolo, A. Pelissetto and A. D. Sokal, Nonlocal Monte Carlo
  algorithm for self-avoiding walks with fixed endpoints, *Journal of Statistical Physics* 60
  (1990), 1–53; J. G. Kemeny and J. L. Snell, *Finite Markov Chains*, Van Nostrand, 1960.
  Attributed in prose only.

# Roadmap: Hopfield networks

**Summary.** A Hopfield network is a finite set of units, each in one of two states `±1`,
coupled by real weights `W` and thresholds `θ`. Its energy is the quadratic form
`E(x) = −½ Σ_i Σ_j W_ij s_i s_j − Σ_i θ_i s_i` of the spins `s_i`, and a unit is updated by
giving it the sign of its local field `h_i = Σ_j W_ij s_j + θ_i`, keeping its state when the
field vanishes. The modern, continuous Hopfield network of Ramsauer and coauthors stores
patterns `x_1, …, x_N` in a real inner product space and moves a state `ξ` to the average
`f(ξ) = Σ_j p_j x_j` with weights `p_j ∝ exp(β ⟪x_j, ξ⟫)`. The headline theorems of this
roadmap are these.

- *Asynchronous convergence.* If `W` is symmetric with nonnegative diagonal, every update that
  changes a configuration strictly lowers the energy. Hence along every schedule of single-unit
  updates the configuration changes at most `2ⁿ − 1` times for `n` units, and if every unit is
  updated infinitely often the trajectory ends at a stable configuration.
- *Synchronous updates.* If `W` is symmetric, with any diagonal, every orbit of the synchronous
  update is eventually periodic with period `1` or `2`.
- *Hebbian storage.* For `p` pairwise orthogonal `±1` patterns on `n` units, the Hebbian weights
  `Σ_μ ξ^μ ξ^μᵀ − p I` and zero thresholds, a configuration within Hamming distance `d` of a
  pattern with `p(2d + 1) < n` is sent to that pattern by one synchronous update, and every unit
  updated asynchronously takes the pattern's value.
- *Modern Hopfield networks.* For `β > 0` the update lowers the energy
  `−β⁻¹ log Σ_j exp(β ⟪x_j, ξ⟫) + ½‖ξ‖² + const` by at least `½‖f(ξ) − ξ‖²`; the iterates have
  a compact connected set of cluster points made of fixed points, and converge when the limiting
  energy level has finitely many fixed points. A pattern separated from the others by `Δ`
  attracts: `‖f(ξ) − x_i‖ ≤ 2(N − 1) M exp(−β(Δ − 2M‖ξ − x_i‖))` when all patterns have norm
  at most `M`, and under an explicit condition on `β, M, Δ, r` the update has exactly one fixed
  point within distance `r` of `x_i`, which attracts that whole ball.

The Hopfield energy is an Ising energy: the roadmap takes the spins and the Ising energy of
QuantumOptimization (quadratic binary optimization and Ising energies) and adds the dynamics.
Mathlib supplies Hamming distance, Jensen's inequality, the mean value inequality, compactness of
convex hulls of finite sets and the contraction mapping theorem, and Tau Ceti the bound of a
log-sum-exp by its largest term. The stochastic version of the
binary dynamics is the Glauber dynamics of MarkovChainMixing, applied to the Gibbs law of the
energy with a uniformly random unit updated, and is not restated.

Layers 1 and 2 prove energy descent and asynchronous convergence, Layer 3 the period-two theorem
and Layer 4 Hebbian storage, using the definitions of Layers 1 to 3. Layer 5, the modern network,
uses no other layer.

## Conventions

- **Units and configurations.** The units form a finite type `ι` (`[Fintype ι]`, and
  `[DecidableEq ι]` where a single unit is updated or the Hebbian diagonal is written); `n` is
  `Fintype.card ι`. A configuration is `x : ι → Bool`. Its spins are `spin x i`, equal to `−1`
  when `x i` is true and to `1` otherwise; this is the convention of QuantumOptimization 1.1,
  whose definitions `spin` and `ising` are copied verbatim. A pattern is a configuration.
- **Weights and thresholds.** Weights are an arbitrary real matrix `W : Matrix ι ι ℝ` and
  thresholds `θ : ι → ℝ`. Symmetry (Mathlib's `W.IsSymm`) and the sign of the diagonal are
  hypotheses where they are needed, never part of a definition. The local field is
  `localField W θ x i = Σ_j W i j · spin x j + θ i`, diagonal term included.
- **Energy.** `hopfieldEnergy W θ x` is `ising (−½ W) (−θ) x`, that is
  `−½ Σ_i Σ_j W i j s_i s_j − Σ_i θ i s_i` summed over all ordered pairs. Since `s_i² = 1` the
  diagonal contributes the constant `−½ Σ_i W i i`.
- **Schedules.** An asynchronous schedule is a sequence `u : ℕ → ι` of units: at time `t` the
  unit `u t` is updated and no other. A schedule is *fair* when every unit occurs in it
  infinitely often (`∀ i T, ∃ t ≥ T, u t = i`).
- **Modern networks.** `E` is a real inner product space (`[NormedAddCommGroup E]
  [InnerProductSpace ℝ E]`), with no completeness or dimension hypothesis; the stored patterns
  are `X : Fin N → E` and `β : ℝ` is the inverse temperature. The sources work in `ℝᵈ`; every
  statement and route here holds verbatim in any real inner product space, because the iterates
  stay in the convex hull of the patterns, which is compact. Junk values are those of Mathlib:
  `0⁻¹ = 0`, `log 0 = 0`, an empty sum is `0`.

### Design note: the update and its tie rule

The objects below are fixed before any target; every target uses them unchanged.

- **The update.** `asyncUpdate W θ i x` changes only unit `i`: its spin becomes `1` if the local
  field is positive, `−1` if it is negative, and the unit keeps its state if the field is `0`.
  `syncUpdate W θ x` applies the same rule to every unit at once, all fields computed from `x`.
  `IsStable W θ x` says that no single-unit update changes `x`, that is, for every unit the
  field is `0` or has the sign of its spin.
- **Why "keep on a tie".** With this rule an update that changes `x` flips unit `i` only when
  `s_i h_i < 0`, and the energy then changes by exactly `2 s_i h_i − 2 W i i`, which is negative
  when `W i i ≥ 0`. MacKay (§42.2, eq. (42.2)) instead sends a zero field to `+1`.
- **The tie rule also covers synchronous updates.** Keeping the state on a tie is the tie-free
  rule for the weights `W + εI` once `0 < ε` is below every nonzero `|h_i(x)|`, so no statement
  needs a hypothesis that fields never vanish.

**Checks.**

- *The other tie rule.* One unit, `W = 0`, `θ = 0`, spin `−1`: the field is `0`. Under "keep" the
  update does nothing. Under "zero goes to `+1`" the unit flips to `+1` and the energy stays `0`,
  so the statement "every update that changes the configuration strictly lowers the energy" is
  false for that rule.
- *Spin convention.* `spin x i` is `−1` exactly when `x i` is true, so a positive field sets the
  unit to `false`. With two units, `W` with off-diagonal entries `1` and zero diagonal, `θ = 0`
  and `x = (false, true)` (spins `(1, −1)`), the fields are `(−1, 1)` and `syncUpdate` gives
  `(true, false)`.
- *Stability.* One unit, `W = 0`, `θ = 1`: the configuration with spin `1` is stable, the one
  with spin `−1` is not (its field `1` disagrees with its spin).

## Layer 1: energy and the single-unit update

### 1.1 Local field and energy

Define `localField W θ x i`, `hopfieldEnergy W θ x`, and, copied from QuantumOptimization 1.1,
`spin` and `ising`, as in the Conventions. A step of the route of 1.3:

- Flipping unit `i` of `x` (all other units fixed) changes the energy by
  `2 s_i h_i(x) − 2 W i i` when `W` is symmetric, where `s_i` and `h_i(x)` are computed before
  the flip.

**Checks.**

- One unit with `W = (w)` and `θ = t`: the energy is `−w/2 − t s`, so it does not depend on the
  state when `t = 0`, and the flip formula gives `2 s (w s + t) − 2w = 2ts`, the difference of
  `−t(−s)` and `−ts`.
- With two units, `W` with off-diagonal entries `1`, zero diagonal, `θ = 0`: the energy is `−1`
  on the two aligned configurations and `1` on the two others.

### 1.2 The update and stable configurations

Define `asyncUpdate W θ i x` and `IsStable W θ x` as in the design note. A step of the route
of 2.2:

- A configuration is stable if and only if, for every unit, its field is `0` or has the sign of
  its spin.

**Checks.** See the design note; and with `W = 0` every configuration is stable exactly when
`θ = 0`.

### 1.3 Energy descent

Prove (`hopfieldEnergy_asyncUpdate_lt`) that if `W` is symmetric and `0 ≤ W i i` for every `i`,
then for every `θ`, unit `i` and configuration `x` with `asyncUpdate W θ i x ≠ x`, the energy
of `asyncUpdate W θ i x` is strictly smaller than that of `x`. Route: the update changes `x`
only by flipping unit `i` when `s_i h_i(x) < 0`, and by 1.1 the energy then changes by
`2 s_i h_i(x) − 2 W i i < 0`. Consequently a global minimizer of the energy over the finitely
many configurations is stable. (Proved here; the energy argument is due to Hopfield. MacKay
§42.4, pp. 507–508, explains the convergence of the continuous network through a Lyapunov
function and names symmetric connections and asynchronous updates as what it needs.)
*Needs:* 1.1; Mathlib `Matrix.IsSymm.apply`.

**Checks.**

- *Symmetry is needed.* Two units with `W 1 2 = 1`, `W 2 1 = −1`, zero diagonal, `θ = 0`
  (MacKay, solution to Exercise 42.3, p. 520): the energy is `0` on every configuration, yet
  updating unit 2 at the configuration with both spins `1` flips it; the round-robin schedule
  cycles through all four configurations forever.
- *The diagonal sign is needed.* One unit with `W = (−1)`, `θ = 0`: the field is `−s`, so every
  update flips the unit while the energy stays `½`.
- Brute force over all symmetric matrices with entries in `{−2, …, 2}` and nonnegative diagonal,
  `θ ∈ {−1, 0, 1}ⁿ`, all configurations and units, `n ≤ 3`: every changing update lowers the
  energy by exactly `2 s_i h_i − 2 W i i > 0`.

### Examples

- Two units with `W` off-diagonal `1`, zero diagonal, `θ = 0`: from spins `(1, −1)` updating unit
  1 gives `(−1, −1)` and the energy falls from `1` to `−1`; that configuration is stable.

### Dependencies

- QuantumOptimization 1.1 (`spin`, `ising`, copied); Mathlib's matrices.

## Layer 2: asynchronous dynamics

### 2.1 Finitely many changes

Define `asyncTraj W θ u x`, the trajectory with `asyncTraj W θ u x 0 = x` and step `t + 1`
obtained by updating unit `u t`. Prove (`asyncTraj_changes_finite`) that if `W` is symmetric with
nonnegative diagonal, then for every `θ`, schedule `u` and initial `x`, the set of times `t` with
`asyncTraj W θ u x (t + 1) ≠ asyncTraj W θ u x t` is finite and has at most `2 ^ n − 1`
elements. Route: list the change times `t₁ < t₂ < …`; by 1.3 the energies of `x(t₁)`,
`x(t₁ + 1)`, `x(t₂ + 1)`, … strictly decrease, so these configurations are pairwise distinct;
there are at most `2ⁿ` configurations, so there are at most `2ⁿ − 1` change times, and in
particular finitely many. (Proved here.) *Needs:* 1.3; Mathlib `Set.ncard` and the cardinality
`2ⁿ` of `ι → Bool`.

**Checks.**

- The bound is not attained in small cases: by an exact search over all schedules (the longest
  chain of changing updates), for symmetric matrices with entries in `{−1, 0, 1, 2}` and
  nonnegative diagonal, `θ ∈ {−1, 0, 1}ⁿ`, the largest number of changes is `1, 2, 4` for
  `n = 1, 2, 3`, against `1, 3, 7`.
- Both hypotheses are needed: the two examples of 1.3 change infinitely often.

### 2.2 Convergence to a stable configuration

Prove (`exists_isStable_asyncTraj`) that if `W` is symmetric with nonnegative diagonal and the
schedule `u` is fair, then for every `θ` and `x` there is a time `T` such that the trajectory is
constant from `T` on and `asyncTraj W θ u x T` is stable. Route: by 2.1 there is a `T` after
which nothing changes; for a unit `i`, fairness gives `t ≥ T` with `u t = i`, and
`asyncUpdate W θ i (x T) = x (t + 1) = x T`. (Proved here.) *Needs:* 2.1, 1.2.

**Checks.**

- *Fairness is needed.* Two units, `W = 0`, `θ = (1, 1)`, both spins `−1`, and the schedule that
  only ever updates unit 1: the trajectory stops at spins `(1, −1)`, which is not stable since
  unit 2 has field `1`.
- *Symmetry and the diagonal sign are needed.* Both schedules of the examples of 1.3 (round robin
  on two units, and the only schedule on one unit) are fair, and neither trajectory is eventually
  constant.
- Round-robin schedules of length `n · 2ⁿ + n` end at a stable configuration for every network
  and initial configuration of the first Check of 2.1.

### Examples

- Two units, `W` off-diagonal `1`, zero diagonal, `θ = 0`: the stable configurations are the two
  aligned ones; from `(1, −1)` the round-robin schedule reaches `(−1, −1)` in one step.

### Dependencies

- Layer 1.

## Layer 3: synchronous dynamics

### 3.1 Period one or two

Define `syncUpdate W θ x` as in the design note. Prove (`syncUpdate_eventually_period_two`) that
if `W` is symmetric (with any diagonal), then for every `θ` and `x` there is `T` with
`syncUpdate^[t + 2] x = syncUpdate^[t] x` for all `t ≥ T`. Route: choose `0 < ε` below every
nonzero value of `|h_i(y)|` over configurations `y` and units `i` (or `ε = 1` if there is none),
and put `W' = W + εI`, with fields `h'_i(y) = h_i(y) + ε s_i(y)`. Then `h'_i(y)` is never `0` and
has the sign that `syncUpdate W θ` gives unit `i`, so `syncUpdate W θ` is the tie-free sign
map of `W'`. Along the orbit `x(t)`, put
`L(t) = −Σ_i Σ_j W'_ij s_i(x(t)) s_j(x(t − 1)) − Σ_i θ_i (s_i(x(t)) + s_i(x(t − 1)))`. Symmetry
of `W'` gives `L(t + 1) − L(t) = −Σ_i (s_i(x(t + 1)) − s_i(x(t − 1))) h'_i(x(t))`. Each term is
`0` or `2 |h'_i(x(t))| > 0`, the latter exactly for the units where `x(t + 1)` and `x(t − 1)`
differ. So `L` is nonincreasing and drops whenever `x(t + 1) ≠ x(t − 1)`; it takes finitely many
values, so `x(t + 1) = x(t − 1)` from some time on. (Proved here; the theorem is due to Goles and
coauthors.) *Needs:* 1.1, 1.2.

**Checks.**

- *Period two occurs.* Two units with `W` off-diagonal `1`, zero diagonal, `θ = 0`, spins
  `(1, −1)` (MacKay, solution to Exercise 42.4, p. 521): both units flip at every step, while the
  asynchronous dynamics of the same network converges (2.2).
- *Symmetry is needed.* Three units with `W 2 1 = W 3 2 = W 1 3 = 1`, all other entries `0`,
  `θ = 0`: every field is `±1`, the update rotates the spins, and spins `(1, −1, −1)` have period
  `3`.
- No diagonal condition: one unit with `W = (−1)` has period `2`.
- Brute force: symmetric matrices with entries in `{−2, …, 2}` and `θ ∈ {−1, 0, 1}ⁿ` for
  `n ≤ 3`, and zero-diagonal ones with entries in `{−1, 0, 1}` and `θ ∈ {0, (1, 0, 0, 0)}` for
  `n = 4`: every orbit has eventual period `1` or `2`, with and without vanishing fields.

### Examples

- The two-unit network above: the period-two orbit `(1, −1) ↔ (−1, 1)` and the two fixed points
  `(1, 1)`, `(−1, −1)`.

### Dependencies

- Layer 1 (1.1 and 1.2 only).

## Layer 4: Hebbian storage

### 4.1 The Hebbian weights and the alignment margin

For patterns `ξ : Fin p → ι → Bool` define `hebb ξ`, the matrix with entries
`Σ_μ spin (ξ μ) i · spin (ξ μ) j − p · [i = j]`; it is symmetric with zero diagonal (the sum of
outer products of MacKay, eq. (42.5), p. 507, with `η = 1` and the diagonal removed). Patterns
are *orthogonal* when `Σ_i spin (ξ μ) i · spin (ξ ν) i = 0` for `μ ≠ ν`.

Prove (`le_spin_mul_localField_hebb`) that for pairwise orthogonal patterns, every `ν`, every
configuration `x` at Hamming distance `d` from `ξ ν` and every unit `i`, with zero thresholds,
`n − p (2d + 1) ≤ spin (ξ ν) i · localField (hebb ξ) 0 x i`. Route: write `σ^μ` for the spins of
`ξ μ` and `s` for those of `x`, so that `h_i(x) = Σ_μ σ^μ_i ⟪σ^μ, s⟫ − p s_i`. Then
`⟪σ^ν, s⟫ = n − 2d`, and for `μ ≠ ν`, orthogonality gives `⟪σ^μ, s⟫ = −2 Σ_{j ∈ D} σ^μ_j σ^ν_j`
over the `d` units `D` where `x` and `ξ ν` differ, so `|⟪σ^μ, s⟫| ≤ 2d`. Multiply by `σ^ν_i` and
bound the `p − 1` cross terms by `2d` each and `−p σ^ν_i s_i` by `−p`. (Proved here.)
*Needs:* 1.1; Mathlib `hammingDist`.

**Checks.**

- For `p = 1` the bound is attained at every unit where `x` agrees with the pattern:
  `σ_i h_i = (n − 2d) − 1`.
- Exhaustively, for all subsets of the rows of the Sylvester–Hadamard matrices of orders 2, 4
  and 8 (pairwise orthogonal patterns), every pattern, configuration and unit: the inequality
  holds, with equality in 21548 of the 2099232 cases.
- For `p = n` orthogonal patterns `hebb ξ = 0` (the patterns form an orthogonal basis with
  `Σ_μ σ^μ σ^μᵀ = nI`), and the bound reads `−2nd ≤ 0`.

### 4.2 Retrieval in a Hamming ball

Prove (`hebb_retrieval`) that for pairwise orthogonal patterns, zero thresholds, a pattern
`ξ ν`, a configuration `x` with `hammingDist x (ξ ν) ≤ d` and `p (2d + 1) < n`: one synchronous
update sends `x` to `ξ ν`, and for every schedule `u`, every time `t` and every unit `i` that
occurs among `u 0, …, u (t − 1)`, the asynchronous trajectory satisfies
`asyncTraj (hebb ξ) 0 u x t i = ξ ν i`.
Route: by 4.1 every field at a configuration within distance `d` of `ξ ν` is nonzero with the
sign of `ξ ν`, so a synchronous update returns `ξ ν`, and each asynchronous update sets its unit
to the value of `ξ ν` and does not increase the distance; induct on `t`. With `d = 0` this says
that every stored pattern is stable when `p < n`. (Proved here.) *Needs:* 4.1, 2.1 (the
trajectory), 3.1 (the synchronous update).

**Checks.**

- *Orthogonality is needed.* Four units, the patterns with spins `(1, 1, 1, 1)`,
  `(1, 1, 1, −1)`, `(1, 1, −1, 1)`, so `p = 3 < 4`: at the second pattern the fields are
  `(3, 3, 3, 1)`, so unit 4 flips and the stored pattern is not stable. The same configuration
  refutes 4.1 without orthogonality: there `d = 0` and the margin `4 − 3 = 1` exceeds
  `spin · field = −1` at unit 4.
- *The condition `p (2d + 1) < n` is needed.* With `p = n = 4` (all rows of the Hadamard matrix of
  order 4) the weights vanish (Check of 4.1), every field is `0`, and a configuration at distance
  `1` from a pattern is left unchanged by the synchronous update.
- The exhaustive search of 4.1 confirms, for every case with `p (2d + 1) < n`, the synchronous
  retrieval and the single-unit statement.

### Examples

- `n = 8`, two orthogonal rows of the Hadamard matrix: `p (2d + 1) < 8` allows `d = 1`, so every
  configuration at distance `1` from a stored pattern is corrected in one synchronous step.

### Dependencies

- Layers 1, 2 and 3 (the definitions of the trajectory and of the synchronous update).

## Layer 5: the modern Hopfield network

### 5.1 Energy and update

Define `patternRadius X`, the largest norm `M` of the patterns (`0` for `N = 0`),
`modernEnergy X β ξ = −β⁻¹ log Σ_j exp(β ⟪X j, ξ⟫) + ‖ξ‖²/2 + β⁻¹ log N + M²/2` and
`modernUpdate X β ξ = Σ_j p_j • X j` with `p_j = exp(β ⟪X j, ξ⟫)/Σ_k exp(β ⟪X k, ξ⟫)`
(Ramsauer et al., eqs. (1)–(3), p. 3).

The following two facts are steps of the routes of 5.3–5.6, not separate targets.

- For `N ≥ 1` and `β > 0`, `½(‖ξ‖ − M)² ≤ modernEnergy X β ξ`, because the log-sum-exp term is
  at most `max_j ⟪X j, ξ⟫ + β⁻¹ log N ≤ M‖ξ‖ + β⁻¹ log N`; in particular the energy is
  nonnegative (Ramsauer et al., Lemma A1, eq. (16), p. 14). The bound of the log-sum-exp by its
  largest term is Tau Ceti's `Finset.log_sum_exp_eq_add_log_sum_exp_sub` with
  `Finset.sum_exp_sub_sup'_le_card`.
- `modernUpdate X β ξ` lies in the convex hull of the patterns for `N ≥ 1`, and is `0` for
  `N = 0`.

**Checks.**

- Two patterns `1, −1` in `ℝ`: the update is `ξ ↦ tanh(βξ)` and the energy is
  `−β⁻¹ log cosh(βξ) + ξ²/2 + ½`; the fixed points are the solutions of `ξ = tanh(βξ)`, only `0`
  for `β ≤ 1` and three for `β > 1`.

### 5.2 The derivative of the energy

Prove (`hasFDerivAt_modernEnergy`) that for `β ≠ 0` the energy is differentiable at every `ξ`
with derivative `v ↦ ⟪ξ − modernUpdate X β ξ, v⟫`, so that the fixed points of the update are
exactly the stationary points of the energy (Ramsauer et al., eqs. (36)–(40), p. 16: the update
is the gradient of the log-sum-exp term). Route: the chain rule, with the positive sum of
exponentials for `N ≥ 1`; for `N = 0` the energy is `‖ξ‖²/2` and the update is `0`.
*Needs:* 5.1; Mathlib `HasFDerivAt.log`.

**Checks.**

- *`β ≠ 0` is needed.* At `β = 0` the junk value `0⁻¹ = 0` makes the energy `‖ξ‖²/2 + M²/2`, with
  derivative `⟪ξ, ·⟫`, while the update is the mean of the patterns: for the patterns `1, 0` in
  `ℝ` the stated derivative would be `ξ − ½`.
- Patterns `1, −1` in `ℝ`: the energy `−β⁻¹ log cosh(βξ) + ξ²/2 + ½` of 5.1 has derivative
  `ξ − tanh(βξ)`, which is `ξ − f(ξ)`, for every `β ≠ 0`.

### 5.3 Energy descent

Prove (`modernEnergy_modernUpdate_add_le`) that for `β > 0` and every state `ξ`,
`E(f ξ) + ‖f ξ − ξ‖²/2 ≤ E(ξ)`, with `f = modernUpdate X β` and `E = modernEnergy X β`
(Ramsauer et al., Theorem A1, p. 16, with eq. (50), p. 17, shows `E(f ξ) ≤ E(ξ)` by the
concave–convex procedure; the quadratic gain is proved here). Route: write
`ψ(η) = β⁻¹ log Σ_j exp(β ⟪X j, η⟫)`.
Jensen's inequality for `exp` with the weights `p_j` at `ξ` gives
`ψ(η) − ψ(ξ) = β⁻¹ log Σ_j p_j exp(β ⟪X j, η − ξ⟫) ≥ ⟪f ξ, η − ξ⟫` for every `η`. Hence
`E(η) ≤ E(ξ) − ⟪f ξ, η − ξ⟫ + ‖η‖²/2 − ‖ξ‖²/2`, and at `η = f ξ` the right side is
`E(ξ) − ‖f ξ − ξ‖²/2`. For `N = 0` both sides are computed directly. *Needs:* 5.1; Mathlib
`ConvexOn.map_sum_le`, `convexOn_exp`.

**Checks.**

- *`β > 0` is needed.* Patterns `1, −1` in `ℝ`, `β = −1`: the energy is
  `E(η) = log cosh η + η²/2 + ½ ≥ ½`. At `ξ = 1`, `E(1) = log cosh 1 + 1 < 3/2` because
  `log cosh y < y²/2` for `y ≠ 0`, while `f(1) = −tanh 1` and `E(f(1)) + ½(1 + tanh 1)² ≥ ½ + ½(1 + tanh 1)²`,
  which exceeds `3/2` because `tanh 1 = (e² − 1)/(e² + 1) > √2 − 1` (equivalently `e² > √2 + 1`).
  At `β = 0`, `ξ = 0` and the patterns `1, 0`: the left side is `⅛ + ⅛ + ½` and the right side
  `½`.
- *The factor `½` is sharp.* For one pattern `x` (`N = 1`) the update is constant equal to `x`, the
  energy is `½‖ξ − x‖²`, and `E(f ξ) + ½‖f ξ − ξ‖² = 0 + ½‖x − ξ‖² = E(ξ)` for every `β > 0`.

### 5.4 Global convergence

Prove (`modernUpdate_iterate_clusterPts`) that for `β ≥ 0` and every initial state `ξ₀`, with
`ξ_t = f^[t] ξ₀`: the energies `E(ξ_t)` converge to some `E*`, the steps `ξ_(t+1) − ξ_t` tend to
`0`, and the set of cluster points of `(ξ_t)` is compact, connected (hence nonempty) and contained
in the set of fixed points of `f` of energy `E*`. Prove (`tendsto_modernUpdate_iterate`) that if
moreover `E(ξ_t) → E*` and `f` has only finitely many fixed points of energy `E*`, then `ξ_t`
converges to one of them (Ramsauer et al., Theorem 2, p. 3, and Theorem A2, p. 18, stated for
`β > 0` in `ℝᵈ`).

Route. For `β = 0`, `f` is constant, equal to the mean of the patterns, and all claims are
immediate. For `β > 0` and `N ≥ 1`: by 5.3, `E(ξ_t)` is nonincreasing and by 5.1 bounded below
by `0`, so it converges, and `Σ_t ‖ξ_(t+1) − ξ_t‖²/2 ≤ E(ξ₀)`, so the steps tend to `0`. For
`t ≥ 1` the iterates lie in the convex hull `K` of the patterns, which is compact; the cluster
set is the intersection of the closures of the tails, a closed subset of `K`, nonempty by
compactness. If `ξ_(t_k) → z` then `ξ_(t_k + 1) = f(ξ_(t_k)) → f(z)` by continuity and also `→ z`
since the steps vanish, so `f z = z`; continuity of `E` gives `E z = E*`. Connectedness: if the
cluster set were the union of two disjoint nonempty closed sets `A`, `B` at distance `δ > 0`,
the sequence would enter the `δ/3`-neighbourhoods of both infinitely often with steps eventually
below `δ/3`, so it would visit infinitely often the compact set of points of `K` at distance at
least `δ/3` from `A` and from `B`, which would then contain a cluster point. For the second
statement, a nonempty connected subset of a finite set of a Hausdorff space is a single point
`z`, and a sequence eventually in a compact set with the unique cluster point `z` converges to
`z`. For `N = 0`, `f = 0` and the iterates are `0` from `t = 1` on. (The paper's proof cites
Sriperumbudur–Lanckriet and Meyer; the route here is self-contained and proved here.)
*Needs:* 5.1, 5.3; Mathlib `Set.Finite.isCompact_convexHull`, `IsCompact.exists_mapClusterPt`,
`IsCompact.tendsto_nhds_of_unique_mapClusterPt`.

**Checks.**

- *`β ≥ 0` is needed.* Patterns `1, −1` in `ℝ`, `β = −3`, and `ξ₀ = a`, the positive solution of
  `a = tanh(3a)` (it lies in `(0.99, 1)`, since `tanh 2.97 > 0.99` amounts to `e^5.94 > 199`, and
  `tanh 3 < 1`): the update is `ξ ↦ −tanh(3ξ)`, the orbit alternates between `a`
  and `−a`, the steps do not tend to `0`, and the cluster set `{a, −a}` is disconnected and
  contains no fixed point.
- Patterns `1, −1`, `β = 3`: from every `ξ₀ > 0` the iterates converge to the positive root of
  `ξ = tanh(3ξ)`; from `ξ₀ = 0` they stay at the fixed point `0`, a local maximum of the energy.

### 5.5 One-step retrieval

Prove (`norm_modernUpdate_sub_le`) that if `β ≥ 0`, `‖X j‖ ≤ M` for every `j`, and
`Δ ≤ ⟪X i, X i⟫ − ⟪X i, X j⟫` for every `j ≠ i`, then for every state `ξ`
`‖f ξ − X i‖ ≤ 2 (N − 1) M exp(−β (Δ − 2M ‖ξ − X i‖))`. The largest admissible `Δ` is the
separation `Δ_i` of Ramsauer et al., eq. (5), p. 4. Route: `f ξ − X i = Σ_(j ≠ i) p_j (X j − X i)`
with `‖X j − X i‖ ≤ 2M`, and `p_j ≤ p_j/p_i = exp(β ⟪X j − X i, ξ⟫)` where
`⟪X j − X i, ξ⟫ = ⟪X j − X i, X i⟫ + ⟪X j − X i, ξ − X i⟫ ≤ −Δ + 2M ‖ξ − X i‖`; multiply by
`β ≥ 0`. (Ramsauer et al., Theorem 5, eq. (8), p. 4, proof as Theorem A9, p. 57, with
`max{‖ξ − X i‖, ‖x*_i − X i‖}` in the exponent; the form here has `‖ξ − X i‖` alone, implies
that one, and is proved here.) *Needs:* 5.1.

**Checks.**

- Patterns `1, −1` in `ℝ` (`M = 1`, `Δ = 2`), `ξ = 1`: `1 − tanh β = 2/(e^(2β) + 1) ≤ 2e^(−2β)`;
  at `β = 3` the two sides are `0.004945…` and `0.004957…`.
- For `N = 1` both sides are `0`.
- *`β ≥ 0` is needed.* Patterns `1, 0` in `ℝ` (`M = 1`, `Δ = 1`), `i` the first, `ξ = −3`,
  `β = −1`: `‖f ξ − 1‖ = 1/(1 + e³)`, which exceeds the bound `2e^(−7)` since `e⁷ > 2 + 2e³`.

### 5.6 Stored patterns

Prove (`exists_unique_fixedPoint_closedBall`) that under the hypotheses of 5.5, with
`ε = exp(−β (Δ − 2Mr))` and `L = 4 β M² (N − 1) ε`, if `2 (N − 1) M ε ≤ r` and `L < 1`, then
the update has exactly one fixed point `z` in the closed ball `B` of radius `r` about `X i`,
`‖f ξ − z‖ ≤ L ‖ξ − z‖` for every `ξ ∈ B`, and `f^[t] ξ → z` for every `ξ ∈ B`. This is the
first condition of the notion of a stored pattern of Ramsauer et al., Definition 1, p. 4 (the
definition also asks the balls about distinct patterns to be disjoint, which is not part of the
statement here), and a variant of their
Theorem 4, eqs. (6)–(7), p. 4 (Theorem A8, p. 56), with the constant `4 β M² (N − 1)` in place
of `2 β N M² (N − 1)` and the radius `r` in the exponent.

Route (proved here). The hypothesis forces `r ≥ 0`. By 5.5, monotone in `‖ξ − X i‖` because
`β, M ≥ 0`, `f` maps `B` into `B`, and into `K = B ∩ conv(X)`, which is compact, hence complete,
and contains `f(X i)`. The derivative of `f` at `ξ` is
`v ↦ β Σ_j p_j ⟪X j − f ξ, v⟫ (X j − f ξ)`, of norm at most
`β Σ_j p_j ‖X j − f ξ‖² ≤ β Σ_j p_j ‖X j − X i‖² ≤ 4 β M² Σ_(j ≠ i) p_j ≤ L` on `B` (a variance is
at most the second moment about any point, and `p_j ≤ ε` for `j ≠ i` as in 5.5). The mean value
inequality on the convex set `B` makes `f` `L`-Lipschitz there; the contraction mapping theorem
on `K` gives the fixed point, which is unique in `B` because every fixed point in `B` lies in
`f(B) ⊆ K`, and `‖f^[t] ξ − z‖ ≤ Lᵗ ‖ξ − z‖`. *Needs:* 5.1, 5.5; Mathlib
`Convex.norm_image_sub_le_of_norm_hasFDerivWithin_le`, `ContractingWith.exists_fixedPoint'`,
`IsCompact.isComplete`, `Set.Finite.isCompact_convexHull`.

**Checks.**

- Patterns `1, −1` in `ℝ`, `β = 3`, `r = 0.2`: `ε = e^(−4.8)`, `2ε ≤ 0.2` and `L = 12ε < 1`
  (both because `e^4.8 > 12`); the fixed point is the positive root of `ξ = tanh(3ξ)`, which lies
  in `(0.99, 1)` (Check of 5.4). On the ball `[0.8, 1.2]` the derivative `3 sech²(3ξ)` is largest
  at `ξ = 0.8`, where it is `3 sech² 2.4 < 12 e^(−4.8) = L`, since `sech² y < 4e^(−2y)`.
- Ten orthonormal patterns in `ℝ¹⁰` (`M = 1`, `Δ = 1`), `β = 10`, `r = 0.1`: `ε = e^(−8)`,
  `18ε ≤ 0.1` and `L = 360ε < 1` (both because `e⁸ > 360`); by 5.5 at the fixed point `z`, which
  lies in the ball, `‖z − X 1‖ ≤ 18 e^(−8)`.
- *The condition `2 (N − 1) M ε ≤ r` is needed.* Patterns `1, −1` in `ℝ`, `β = 3`, `r = 0`:
  `L = 12e^(−6) < 1` but `2e^(−6) > 0`, and the ball `{1}` contains no fixed point, since
  `f(1) = tanh 3 ≠ 1`.
- *`β ≥ 0` is needed.* Patterns `1, 0` in `ℝ`, `i` the first, `M = Δ = 1`, `β = −1`, `r = 2`:
  `2ε = 2e^(−3) ≤ 2` and `L < 0`, so the contraction claim `‖f ξ − z‖ ≤ L ‖ξ − z‖` fails at every
  `ξ ≠ z` of the ball.

### Examples

- With `M = 1`, unit-norm patterns separated by `Δ = 1` and `r = 0.1`, the conditions of 5.6 hold
  for `N = 10` and every `β ≥ 10`: they hold at `β = 10` as computed above, and `18e^(−0.8β)` and
  `L = 36βe^(−0.8β)` decrease in `β` for `β ≥ 10`.

### Dependencies

- Mathlib's inner product spaces, convexity, mean value inequality and contraction mapping
  theorem; Tau Ceti's log-sum-exp bound (5.1). No other layer.

## Scope and ownership

This roadmap owns the dynamics of binary Hopfield networks (energy descent under single-unit
updates, finiteness of changes and convergence under fair schedules, the period-two theorem for
synchronous updates), the alignment margin and retrieval for Hebbian weights of orthogonal
patterns, and the modern Hopfield network: derivative and descent of its energy, global
convergence of the iterates, one-step retrieval and the stored-pattern theorem.

Stated by other roadmaps:

- QuantumOptimization 1.1 owns configurations of spins and the Ising energy `ising`; this roadmap
  copies `spin` and `ising` verbatim, defines the Hopfield energy as the Ising energy with
  couplings `−W/2` and fields `−θ`, and depends on that roadmap. Its reductions between quadratic
  pseudo-Boolean functions, Ising energies and cuts are not used.
- MarkovChainMixing 6.1 owns the Glauber dynamics of a measure on configurations (a site chosen
  uniformly at random is resampled from its conditional law) and its reversibility, and
  SimulatedAnnealing 3.1 owns the Gibbs measures `gibbs U β ∝ exp(−βU)` of an energy on a finite
  set. The stochastic Hopfield network at inverse temperature `β`, with the unit to update chosen
  uniformly at random, is the Glauber dynamics of the Gibbs measure of the Hopfield energy, so it
  is not restated; this roadmap depends on neither roadmap.
- PotentialGamesAndPriceOfAnarchy 1.2 owns improvement paths and the finite improvement property
  of finite games (`hasFiniteImprovementProperty_iff`). With the units as players, each with the
  two states as strategies and the energy as its cost, the energy is an exact potential, and for
  symmetric `W` with nonnegative diagonal 1.3 makes every update that changes the configuration an
  improvement step; so the finiteness part of 2.1 also follows from 1.3 and that theorem (after
  the steps that change nothing are dropped). 2.1 is
  stated here for the bound `2ⁿ − 1` on the number of change times along a schedule that may also
  update a unit without changing it, which its route gives directly; this roadmap does not depend
  on that roadmap.
- FirstOrderOptimization 1.1 owns the sufficient decrease of a gradient step for a function with
  `K`-Lipschitz gradient. By 5.2 the modern update is the gradient step `ξ − ∇E(ξ)` of length
  `1`, but 5.3 is not an instance of that bound: it would need `K ≤ 1`, and for the patterns
  `1, −1` in `ℝ` and `β = 3` the second derivative of the energy at `0` is `1 − β = −2`, so its
  derivative is not `1`-Lipschitz. The route of 5.3 uses only the convexity of the log-sum-exp
  term.
- PolicyGradientMethods 3.1 defines the tabular softmax parametrization of a policy; the weights
  `p_j` of 5.1 are the same normalised exponentials of a vector, written inline in
  `modernUpdate`; this roadmap does not depend on that roadmap.
- OnlineLearningAndLittlestoneDimension, Layer 3, owns the perceptron and its mistake bound, and
  UniversalApproximation owns approximation by one-hidden-layer networks; neither is used.

Outside the scope: the statistical-mechanics and probabilistic storage capacity of the Hebb rule
for random patterns, the storage-capacity theorems of Ramsauer et al. (Theorem 3, and Theorems
A3–A7 for placed and for random patterns), Boltzmann machines and their learning
rule, the continuous-time continuous Hopfield network, the metastable states of the modern
network, attention layers and every algorithm, program and running time.

## Exact supplier contracts

### From Mathlib

- `Mathlib/LinearAlgebra/Matrix/Symmetric.lean`: `Matrix.IsSymm` (`Aᵀ = A`),
  `Matrix.IsSymm.apply` (`A j i = A i j`). Used in 1.3 and 3.1.
- `Mathlib/InformationTheory/Hamming.lean`: `hammingDist` (the number of coordinates where two
  functions on a finite type differ), `hammingDist_le_card_fintype`. Used in 4.1 and 4.2.
- `Mathlib/Analysis/Convex/Jensen.lean`: `ConvexOn.map_sum_le` (Jensen's inequality for finite
  convex combinations); `Mathlib/Analysis/Convex/SpecificFunctions/Basic.lean`: `convexOn_exp`.
  Used in 5.3.
- `Mathlib/Analysis/SpecialFunctions/Log/Deriv.lean`: `HasFDerivAt.log` (at a point where the
  argument is nonzero). Used in 5.2.
- `Mathlib/Analysis/Convex/Topology.lean`: `Set.Finite.isCompact_convexHull` (the convex hull of
  a finite set in a topological vector space over `ℝ` is compact). Used in 5.4 and 5.6.
- `Mathlib/Topology/Compactness/Compact.lean`: `IsCompact.exists_mapClusterPt` (a sequence in a
  compact set has a cluster point in it), `IsCompact.tendsto_nhds_of_unique_mapClusterPt` (a
  sequence eventually in a compact set with a unique cluster point converges to it). Used in 5.4.
- `Mathlib/Analysis/Calculus/MeanValue.lean`:
  `Convex.norm_image_sub_le_of_norm_hasFDerivWithin_le` (on a convex set, a bound `C` on the
  derivative gives `‖f y − f x‖ ≤ C ‖y − x‖`). Used in 5.6.
- `Mathlib/Topology/MetricSpace/Contracting.lean`: `ContractingWith.exists_fixedPoint'` (a map
  contracting on a complete invariant set has a fixed point there, and the iterates from every
  point of the set converge to it); `Mathlib/Topology/UniformSpace/Cauchy.lean`:
  `IsCompact.isComplete`. Used in 5.6.

### From Tau Ceti

- `TauCeti/Analysis/SpecialFunctions/Log/SumExp.lean`: `Finset.log_sum_exp_eq_add_log_sum_exp_sub`
  (a finite log-sum-exp is unchanged by shifting every exponent by a constant `c` and adding `c`
  back) and `Finset.sum_exp_sub_sup'_le_card` (after shifting by the largest exponent the sum of
  exponentials is at most the number of terms). Used in the energy bound of 5.1.

### From TauCetiRoadmap.QuantumOptimization

- 1.1: `spin x i` (`−1` if `x i` is true, `1` otherwise) and
  `ising J h x = Σ_i Σ_j J i j · spin x i · spin x j + Σ_i h i · spin x i` on a finite type of
  variables, copied verbatim. Used throughout Layers 1–4.

## References

- Hubert Ramsauer, Bernhard Schäfl, Johannes Lehner, Philipp Seidl, Michael Widrich, Thomas
  Adler, Lukas Gruber, Markus Holzleitner, Milena Pavlović, Geir Kjetil Sandve, Victor Greiff,
  David Kreil, Michael Kopp, Günter Klambauer, Johannes Brandstetter and Sepp Hochreiter,
  *Hopfield Networks is All You Need*, arXiv:2008.02217, version 3 (28 April 2021); ICLR 2021.
  Equation, theorem, lemma, definition and page numbers above are those of version 3.
- David J. C. MacKay, *Information Theory, Inference, and Learning Algorithms*, Cambridge
  University Press, 2003; version 7.2 (fourth printing, 28 March 2005), open on the author's
  book pages. Chapter 42: §42.2 and eq. (42.2), p. 506; eq. (42.5), p. 507; §42.4, pp. 507–508;
  solutions to Exercises 42.3 and 42.4, pp. 520–521 (printed page numbers).
- Attributions made in prose without a locator: J. J. Hopfield (the binary network and its
  energy function); E. Goles and coauthors (the period-two theorem for synchronous threshold
  networks with symmetric weights).

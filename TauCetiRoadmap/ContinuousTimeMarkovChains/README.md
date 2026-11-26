# Roadmap: continuous-time markov chains

**Summary.** A Markov chain in continuous time on a finite set of states is described by its
rates: a matrix `Q` whose off-diagonal entry `q_ij` is the rate of jumps from `i` to `j` and
whose rows sum to zero. Such a matrix is called a Q-matrix. The transition probabilities at time
`t` are the entries of the matrix exponential `P(t) = exp(tQ)`; this roadmap develops the
matrix theory of these exponentials. The state space is finite (only Kolmogorov's criterion is
stated for an arbitrary set of states), matrices are real, rows index the starting state, and a
distribution is a row vector; no statement concerns the law of the random paths.

- *Positivity of the exponential.* For a real square matrix `B`, the exponential `exp(tB)` has
  nonnegative entries for every `t ≥ 0` exactly when the off-diagonal entries of `B` are
  nonnegative (`B` is a Metzler matrix). Consequently `exp(tQ)` is a stochastic matrix for every
  `t ≥ 0` exactly when `Q` is a Q-matrix.
- *Generators.* Every family of stochastic matrices `P(t)`, `t ≥ 0`, with `P(0) = I`,
  `P(s + t) = P(s)P(t)` and `P(t) → I` as `t` decreases to `0`, equals `exp(tQ)` for exactly one
  Q-matrix `Q`; and `exp(tQ)` is the only solution of the forward equation `P′ = PQ`, and the
  only solution of the backward equation `P′ = QP`, with `P(0) = I`.
- *Equilibrium.* If `Q` is a Q-matrix and every state can be reached from every other through
  positive rates, then `exp(tQ)` has strictly positive entries for every `t > 0`; if moreover the
  set of states is nonempty, there is exactly one probability vector `π` with `πQ = 0`, and every
  entry `P(t)_ij` tends to `π_j` as `t → ∞`. No aperiodicity condition is needed.
- *Kolmogorov's criterion.* Such a `Q` admits positive weights `π` with `π_i q_ij = π_j q_ji`
  for all `i, j` (detailed balance) exactly when, along every closed walk, the product of the
  rates equals that of the reversed walk.

Uniformization connects the two time scales: for a rate `r > 0` at least every total jump rate,
`K = I + Q/r` is a stochastic matrix and `exp(tQ)` is the average of the powers `Kⁿ` under the
Poisson law of mean `rt`. The matrix exponential and its derivative come from Mathlib. Tau Ceti
supplies the Perron–Frobenius theorem for irreducible nonnegative matrices, used for the
stationary law, and the theory of strongly continuous semigroups planned in
OneParameterSemigroups, whose uniqueness and bounded-generator theorems Layer 2 states in matrix
form. The discrete-time theory of MarkovChainsAndRenewal applies to the uniformized matrix `K`.

The guide to the layers: Layer 1 defines Q-matrices, Metzler matrices and communication and
proves the two positivity theorems; Layer 2 treats the Kolmogorov equations and stochastic
semigroups; Layer 3 uniformization; Layer 4 stationary vectors, positivity of transition
probabilities and convergence; Layer 5 detailed balance and Kolmogorov's criterion. Layers 2, 3
and 5 use only Layer 1, and Layer 4 uses Layers 1 and 3.

## Conventions

- **States and matrices.** The state space is a finite type `S` with `[Fintype S]` and
  `[DecidableEq S]`; it may be empty unless a statement says otherwise. The definitions of 1.1
  other than `IsQMatrix`, and Kolmogorov's criterion 5.2, need no finiteness and are stated for
  any type. Matrices are `Matrix S S ℝ`, and `1` is the identity matrix. Rows index the
  starting state: `P i j` is the probability of moving from `i` to `j`. A distribution or a
  weight vector is a function `π : S → ℝ` used as a row vector, `π ᵥ* M` is the row vector
  `πM`, and `M *ᵥ x` is the column vector `Mx`.
- **Exponential.** The matrix exponential is Mathlib's `NormedSpace.exp`, written `exp(tQ)` in
  prose and `NormedSpace.exp (t • Q)` in Lean. Mathlib puts no norm on matrices by default;
  routes that need the derivative of `t ↦ exp(tQ)` or the convergence of the exponential series
  choose one locally, for instance the operator norm `Matrix.linftyOpNormedRing` with
  `Matrix.linftyOpNormedAlgebra`, as the module documentation of Mathlib's matrix exponential
  suggests. The value of the exponential does not depend on that choice.
- **Stochastic matrices.** A stochastic matrix is a member of Mathlib's
  `Matrix.rowStochastic ℝ S`: nonnegative entries and rows summing to one.
- **Rates.** In a Q-matrix the off-diagonal entries are rates and the diagonal entry `q_ii` is
  minus the total rate `q_i = Σ_(j ≠ i) q_ij` of leaving `i`. A state with `q_i = 0` is absorbing.
  Statements about stationary laws use row vectors (`πQ = 0`), never column vectors.
- **Times.** Time is a real number `t`. Statements about transition probabilities assume
  `t ≥ 0`; the exponential is defined for all real `t`, and for `t < 0` it is in general not a
  stochastic matrix (Check of 1.3). Derivatives at `t = 0` are taken within `[0, ∞)`.
- **Division.** In Lean `r⁻¹ = 0` for `r = 0`; the uniformization identity of 3.1 assumes
  `r ≠ 0`, and its Check records what the junk value gives.

## Layer 1: Q-matrices, Metzler matrices and the sign of the exponential

### 1.1 Q-matrices, Metzler matrices and communication

Define `IsMetzler B`: every off-diagonal entry of `B` is nonnegative. Define `IsQMatrix Q`: `Q` is
Metzler and every row of `Q` sums to `0`. Define `LeadsTo B i j`: `j` is reached from `i` by a
finite chain of steps `a → b` with `a ≠ b` and `0 < B a b`, the empty chain included, so every
state leads to itself; it is the reflexive transitive closure `Relation.ReflTransGen` of the
relation of positive off-diagonal entries. Define `IsIrreducibleGenerator B`: every state leads
to every state. The diagonal of `B` plays no role in `LeadsTo`. For a Q-matrix this is the
relation "i leads to j" of the class structure of continuous-time chains (Norris, Chapter 3).

- A Q-matrix has nonpositive diagonal: `q_ii = −Σ_(j ≠ i) q_ij ≤ 0`.
- On one state the only Q-matrix is the zero matrix, and it is an irreducible generator.
- For a Q-matrix `Q` and a rate `r > 0` with `−q_ii ≤ r` for all `i`, the matrix `Q` is an
  irreducible generator if and only if the nonnegative matrix `1 + r⁻¹ • Q` of 3.1 is irreducible
  in Mathlib's sense `Matrix.IsIrreducible` (its graph of positive entries is strongly connected
  by paths of positive length). On two or more states an irreducible generator has a cycle of
  positive rates through every state; on one state `1 + r⁻¹ • Q = 1` has a loop.

**Checks.**
- `[[−1, 1], [2, −2]]` is a Q-matrix and an irreducible generator; `[[−1, 1], [0, 0]]` is a
  Q-matrix whose second state is absorbing, so the second state does not lead to the first and
  the matrix is not an irreducible generator.
- `[[−1, 1], [0, −1]]` is Metzler and not a Q-matrix (its second row sums to `−1`), and
  `[[0, −1], [0, 0]]` is not Metzler.
- The three-state cycle `C₃` with rates `q_12 = q_23 = q_31 = 1`, diagonal `−1` and all other
  entries `0` is an irreducible generator; state `1` leads to state `3` only through state `2`.

*Needs:* Mathlib `Relation.ReflTransGen`, `Matrix.IsIrreducible`. (Definitions.)

### 1.2 Metzler matrices and nonnegative exponentials

Prove `exp_smul_nonneg_iff_isMetzler`: for every real square matrix `B`, the matrix `exp(tB)` has
nonnegative entries for every `t ≥ 0` if and only if `B` is Metzler. This is the positivity
theorem consumed by the theory of positive linear systems.

Route: if `B` is Metzler, pick `c ≥ 0` with `c ≥ −b_ii` for all `i`; then `B + c·1` has
nonnegative entries, so every partial sum of its exponential series at `t ≥ 0` is nonnegative,
and `exp(tB) = e^(−ct) exp(t(B + c·1))` because `c·1` commutes with `B`
(`Matrix.exp_add_of_commute`, `Matrix.exp_diagonal`). Conversely the entry `i ≠ j` of
`exp(tB)` vanishes at `t = 0` and has derivative `b_ij` there (`hasDerivAt_exp_smul_const` with
`NormedSpace.exp_zero`); a nonnegative function on `[0, ∞)` that vanishes at `0` has nonnegative
right derivative there.

**Checks.**
- `B = [[0, −1], [0, 0]]` is not Metzler and `exp(tB) = [[1, −t], [0, 1]]` has a negative entry
  for every `t > 0`.
- A Metzler matrix may have entries of either sign on the diagonal: `B = [[1, 1], [0, 1]]` gives
  `exp(tB) = e^t [[1, t], [0, 1]] ≥ 0`.
- The hypothesis `t ≥ 0` is needed for the conclusion: see the Check of 1.3 at `t = −1`.

*Needs:* Mathlib `NormedSpace.exp`, `NormedSpace.exp_series_hasSum_exp'`,
`NormedSpace.exp_zero`, `Matrix.exp_add_of_commute`, `Matrix.exp_diagonal`,
`hasDerivAt_exp_smul_const`, `Matrix.linftyOpNormedRing`, `Matrix.linftyOpNormedAlgebra`; 1.1.
(Proved here.)

### 1.3 Q-matrices and stochastic exponentials

Prove `exp_smul_mem_rowStochastic_iff`: for every real square matrix `Q`, the matrix `exp(tQ)`
is stochastic for every `t ≥ 0` if and only if `Q` is a Q-matrix (LPW, §20.1, equations (20.5)
and (20.6), p. 281, for the direction from a Q-matrix; the converse is proved here). The family
`P(t) = exp(tQ)` is then a semigroup, `P(s + t) = P(s)P(t)` (`Matrix.exp_add_of_commute`), with
`P(0) = 1`.

Route: nonnegativity in both directions is 1.2. Rows: if `Q *ᵥ 1 = 0` then `Qⁿ *ᵥ 1 = 0` for
`n ≥ 1`, so `exp(tQ) *ᵥ 1 = 1`; conversely `t ↦ exp(tQ) *ᵥ 1` is constant on `[0, ∞)` and its
right derivative at `0` is `Q *ᵥ 1`.

**Checks.**
- For `Q = [[−1, 1], [2, −2]]`, `P(t)_12 = (1 − e^(−3t))/3` and `P(t)_11 = (2 + e^(−3t))/3`, so
  each row of `P(t)` sums to one.
- Negative times: for `Q = [[−1, 1], [1, −1]]`, `exp(−Q)_12 = (1 − e²)/2 ≈ −3.19`, so
  `exp(tQ)` need not be stochastic for `t < 0`.
- The row condition is needed: `B = [[−1, 1], [0, −1]]` is Metzler, `exp(tB) ≥ 0`, and the rows
  of `exp(B)` sum to `2e^(−1)` and `e^(−1)`, not to one.
- On one state, `Q = 0` and `exp(tQ) = 1`.

*Needs:* 1.1, 1.2; Mathlib `Matrix.rowStochastic`, `Matrix.mem_rowStochastic_iff_sum`,
`Matrix.exp_add_of_commute`, `hasDerivAt_exp_smul_const`.

### Examples

The two-state matrices `[[−1, 1], [2, −2]]` and `[[−1, 1], [1, −1]]`, the absorbing example
`[[−1, 1], [0, 0]]`, the cycle `C₃`, and the non-Metzler and non-stochastic examples of the
Checks.

### Dependencies

Mathlib's matrix exponential (`NormedSpace.exp`, `NormedSpace.exp_series_hasSum_exp'`,
`NormedSpace.exp_zero`, `Matrix.exp_add_of_commute`, `Matrix.exp_diagonal`,
`hasDerivAt_exp_smul_const`, with the local norm `Matrix.linftyOpNormedRing`,
`Matrix.linftyOpNormedAlgebra`), `Matrix.rowStochastic`, `Matrix.mem_rowStochastic_iff_sum`,
`Matrix.IsIrreducible` and `Relation.ReflTransGen`. No other layer.

## Layer 2: the Kolmogorov equations and transition semigroups

### 2.1 Uniqueness for the forward and backward equations

`P(t) = exp(tQ)` solves the forward equation `P′ = PQ` and the backward equation `P′ = QP` with
`P(0) = 1`; this is Mathlib's `hasDerivAt_exp_smul_const` and `hasDerivAt_exp_smul_const'` (LPW,
§20.1, equation (20.7), p. 281, applied to functions). Prove uniqueness, for every real square
matrix `Q`:

- `eq_exp_smul_of_forward`: if `P : ℝ → Matrix S S ℝ` has `P 0 = 1` and every entry of `P` has,
  at every `t ≥ 0`, derivative within `[0, ∞)` equal to the corresponding entry of `P(t)Q`, then
  `P(t) = exp(tQ)` for every `t ≥ 0`;
- `eq_exp_smul_of_backward`: the same with `QP(t)` in place of `P(t)Q`.

These are the matrix forms, with entrywise derivatives within `[0, ∞)`, of uniqueness theorems
the libraries prove for vector-valued equations: Mathlib's uniqueness for Lipschitz ODEs
(`ODE_solution_unique_of_mem_Icc_right`) and Tau Ceti's uniqueness for the abstract Cauchy
problem of a strongly continuous semigroup (`TauCeti.Semigroups.IsClassicalSolution.unique`,
applied to `TauCeti.Semigroups.StronglyContinuousSemigroup.ofBounded`, whose value at `t` is the
operator exponential `exp(tA)`); each column of a backward solution, and each row of a forward
solution read as a column for `Qᵀ`, is such a solution.

Route: `R(t) = P(t) exp(−tQ)` (forward) or `exp(−tQ) P(t)` (backward) is continuous on `[0, ∞)`
with right derivative `0`, hence constant (`constant_of_has_deriv_right_zero`), and
`exp(tQ) exp(−tQ) = 1` (`Matrix.exp_add_of_commute`, `NormedSpace.exp_zero`). Alternatively,
apply `ODE_solution_unique_of_mem_Icc_right` to `P` and `t ↦ exp(tQ)` on each interval `[0, b]`,
with the vector field `M ↦ MQ` (or `M ↦ QM`), Lipschitz in the local norm.

**Checks.**
- The derivative must be taken within `[0, ∞)` and not only from the right: for `Q = 0`, the
  function equal to `1` on `[0, 1)` and to `2·1` on `[1, ∞)` has right derivative `0 = P(t)Q`
  at every point and `P(0) = 1`, but `P(1) = 2·1 ≠ exp(Q) = 1`.
- For `Q = [[−1, 1], [2, −2]]` the closed form of the Check of 1.3 satisfies
  `P′(t)_12 = e^(−3t) = (P(t)Q)_12`, since `(P(t)Q)_12 = P(t)_11 − 2 P(t)_12`.

*Needs:* Mathlib `hasDerivAt_exp_smul_const`, `hasDerivAt_exp_smul_const'`,
`Matrix.exp_add_of_commute`, `NormedSpace.exp_zero`, `constant_of_has_deriv_right_zero` (or
`ODE_solution_unique_of_mem_Icc_right`), with the local norm of the Conventions. (Proved here as
the matrix form of the library statements above.)

### 2.2 Continuous stochastic semigroups

Prove `existsUnique_isQMatrix_of_semigroup`: let `P : ℝ → Matrix S S ℝ` satisfy `P 0 = 1`,
`P (s + t) = P s * P t` for all `s, t ≥ 0`, `P t ∈ Matrix.rowStochastic ℝ S` for all `t ≥ 0`, and
`P` is continuous at `0` within `[0, ∞)`. Then there is exactly one Q-matrix `Q` with
`P t = exp(tQ)` for every `t ≥ 0`. So the Q-matrices are exactly the generators of the
transition semigroups of finite continuous-time chains. The step that a semigroup continuous at
`0` in operator norm is the exponential of a bounded generator is Tau Ceti's
(`TauCeti.Semigroups.StronglyContinuousSemigroup.continuousAt_zero_iff_domain_eq_top` with
`TauCeti.Semigroups.StronglyContinuousSemigroup.eq_ofBounded_of_generator_eq`, for semigroups
indexed by `ℝ≥0` on a Banach space); what is added here is the passage from matrices to that
setting and the identification of the generator as a Q-matrix.

Route: on the finite-dimensional space `S → ℝ`, the operators `x ↦ P(t) *ᵥ x`, `t ≥ 0`, form a
strongly continuous semigroup, and entrywise continuity at `0` is continuity in operator norm.
By `continuousAt_zero_iff_domain_eq_top` its generator is defined everywhere, hence is a bounded
operator `A` since the space is finite-dimensional, and `eq_ofBounded_of_generator_eq` makes the
semigroup `ofBounded A`, so `P(t) = exp(tA)` for
the matrix of `A` (transport of the exponential along the algebra isomorphism between matrices and
operators, `NormedSpace.map_exp`), and by 1.3 `A` is a Q-matrix. Uniqueness: `Q` is the right
derivative of `exp(tQ)` at `0` (`hasDerivAt_exp_smul_const`).

**Checks.**
- Continuity is needed: on two states let `P(0) = 1` and let `P(t)` be the matrix with all
  entries `1/2` for `t > 0`. Every `P(t)` is stochastic and the semigroup law holds, since that
  matrix is idempotent, but `P(t)` does not tend to `1` as `t → 0`, while `exp(tQ)` does.
- For `P(t)` the closed form of the Check of 1.3, the unique `Q` is `[[−1, 1], [2, −2]]`, the
  right derivative of `P` at `0`.
- On the empty state space every statement holds and `Q` is the empty matrix.

*Needs:* 1.3; Tau Ceti `TauCeti.Semigroups.StronglyContinuousSemigroup`,
`TauCeti.Semigroups.StronglyContinuousSemigroup.continuousAt_zero_iff_domain_eq_top`,
`TauCeti.Semigroups.StronglyContinuousSemigroup.eq_ofBounded_of_generator_eq`,
`TauCeti.Semigroups.StronglyContinuousSemigroup.ofBounded_apply`; Mathlib `NormedSpace.map_exp`,
`Matrix.rowStochastic`, `hasDerivAt_exp_smul_const`. (Proved here as the matrix form of the Tau
Ceti theorem.)

### Examples

The two-state semigroup of the Checks of 1.3, its generator, and the discontinuous idempotent
semigroup.

### Dependencies

Layer 1 (1.3, for 2.2). Mathlib `hasDerivAt_exp_smul_const`, `hasDerivAt_exp_smul_const'`,
`Matrix.exp_add_of_commute`, `NormedSpace.exp_zero`, `NormedSpace.map_exp`,
`constant_of_has_deriv_right_zero`, `ODE_solution_unique_of_mem_Icc_right`,
`Matrix.rowStochastic`. Tau Ceti's strongly continuous semigroups
(`TauCeti/Analysis/Semigroups/`): `IsClassicalSolution.unique`, `ofBounded`,
`continuousAt_zero_iff_domain_eq_top`, `eq_ofBounded_of_generator_eq`.

## Layer 3: uniformization

### 3.1 The uniformization identity

Define `uniformized Q r = 1 + r⁻¹ • Q`, the matrix `K` of the chain observed at the rings of a
Poisson clock of rate `r`. Prove `hasSum_uniformized_pow`: for every real square matrix `Q`, every
real `r ≠ 0`, every real `t` and all states `i, j`, the series
`Σₙ e^(−rt) (rt)ⁿ/n! · (Kⁿ)_ij` converges to `exp(tQ)_ij` (LPW, §20.1, equations (20.5) and
(20.6), p. 281, where `r` is the largest total rate; the identity is algebraic and is stated for
every `r ≠ 0`). Prove also, as an API fact: for `r > 0`, `K` is stochastic if and only if `Q` is
a Q-matrix with `−q_ii ≤ r` for every `i` (LPW, §20.1, p. 281, builds `K` from a Q-matrix with
`r` the largest total rate; the equivalence is proved here).

Route: `tQ = (rt)•K − (rt)•1` with commuting terms, so
`exp(tQ) = e^(−rt) exp((rt)•K)` (`Matrix.exp_add_of_commute`, `Matrix.exp_diagonal`), and the
exponential series of `(rt)•K` converges (`NormedSpace.exp_series_hasSum_exp'`); evaluation at
`(i, j)` is continuous and linear.

In probabilistic terms, `P(t)_ij` is the probability that the discrete chain with transition matrix
`K`, run for a Poisson number of steps of mean `rt`, moves from `i` to `j`; StochasticCalculus §0.6
owns the Poisson counting process itself, which this identity does not use.

**Checks.**
- `Q = [[−2, 2], [1, −1]]`: for `r = 2`, `K = [[0, 1], [1/2, 1/2]]` is stochastic; for `r = 1`,
  `K = [[−1, 2], [1, 0]]` has a negative entry, and the identity still holds.
- `Q = 0`: `K = 1` for every `r > 0` and the series sums to `1 = exp(0)`. The largest total rate
  is `0`, so the rate must be chosen positive, not equal to it.
- `r = 0` is excluded: Lean's `0⁻¹ = 0` gives `K = 1`, and the series reduces to its term
  `n = 0`, the matrix `1`; for `Q = [[−1, 1], [1, −1]]` and `t = 1` this is `0` at `(1, 2)`,
  while `exp(Q)_12 = (1 − e^(−2))/2 ≈ 0.432`.
- At `t = 0` the series is `1` for every `r ≠ 0`.

*Needs:* 1.1 (for the API fact); Mathlib `NormedSpace.exp_series_hasSum_exp'`,
`Matrix.exp_add_of_commute`, `Matrix.exp_diagonal`, `Matrix.mem_rowStochastic_iff_sum`, with the
local norm of the Conventions.

### Examples

The two rates for `[[−2, 2], [1, −1]]` and the case `Q = 0`.

### Dependencies

Layer 1 (1.1). Mathlib `NormedSpace.exp_series_hasSum_exp'`, `Matrix.exp_add_of_commute`,
`Matrix.exp_diagonal`, `Matrix.mem_rowStochastic_iff_sum`.

## Layer 4: communication, stationary laws and convergence

### 4.1 Stationary vectors

Prove `vecMul_eq_zero_iff_forall_vecMul_exp_smul`: for every real square matrix `Q` and every row
vector `π`, `πQ = 0` if and only if `π exp(tQ) = π` for every `t ≥ 0` (Proved here; LPW, §20.1,
p. 281, records that a probability vector is stationary for `K` exactly when `πQ = 0`, and
Theorem 20.1, p. 282, uses `πH_t = π`). For a probability vector this says that `π` is a
stationary law of the chain.

Route: if `πQ = 0` then `πQⁿ = 0` for `n ≥ 1`. Conversely `t ↦ π exp(tQ)` is constant on
`[0, ∞)`, and its right derivative at `0` is `πQ`.

**Checks.**
- `π = (2/3, 1/3)` satisfies `πQ = 0` for `Q = [[−1, 1], [2, −2]]`.
- The quantifier over all `t ≥ 0` is needed for a general matrix: for
  `R = [[0, 2π], [−2π, 0]]`, `exp(R) = 1`, so every `π` is fixed at `t = 1`, but
  `(1, 0) R = (0, 2π) ≠ 0`, and at `t = 1/2` the vector `(1, 0)` is sent to `(−1, 0)`.

*Needs:* Mathlib `hasDerivAt_exp_smul_const`, `NormedSpace.exp_series_hasSum_exp'`,
`Matrix.vecMul_vecMul`, with the local norm of the Conventions.

### 4.2 Positivity of transition probabilities

Prove `exp_smul_apply_pos_iff`: for a Metzler matrix `B`, a time `t > 0` and states `i, j`, the
entry `exp(tB)_ij` is strictly positive if and only if `i` leads to `j`. In particular, for an
irreducible Q-matrix every entry of `P(t)` is strictly positive at every `t > 0`, and `P(t)_ii > 0`
for every Q-matrix and every `t ≥ 0`. For Q-matrices this is classical (Norris, Chapter 3,
attributed in prose); the statement for Metzler matrices is proved here. Unlike the discrete-time
case there is no periodicity: positivity at one positive time is positivity at all.

Route: with `c` as in 1.2 but `c > −b_ii` for every `i`, the matrix `A = B + c·1` is nonnegative
with positive diagonal, and `exp(tB)_ij = e^(−ct) Σₙ tⁿ/n! (Aⁿ)_ij`. A term is positive exactly
when `A` has a path of length `n` from `i` to `j` through positive entries
(`Matrix.pow_apply_pos_iff_nonempty_path`); the loops of positive diagonal entries let such a
path be lengthened or shortened, and its off-diagonal steps are the steps of `LeadsTo B`.

**Checks.**
- Absorbing state: for `Q = [[−1, 1], [0, 0]]`, `P(t)_12 = 1 − e^(−t) > 0` and `P(t)_21 = 0` for
  every `t > 0`.
- The cycle `C₃` has `q_13 = 0`, yet `P(t)_13 > 0` for every `t > 0`.
- One state: `exp(tB) = e^(t b_11) > 0` and every state leads to itself.

*Needs:* 1.1, 1.2; Mathlib `Matrix.pow_apply_pos_iff_nonempty_path`,
`NormedSpace.exp_series_hasSum_exp'`, `Matrix.exp_add_of_commute`, `Matrix.exp_diagonal`.

### 4.3 The stationary law

Prove `existsUnique_stationary`: if `S` is nonempty and `Q` is an irreducible Q-matrix, there is
exactly one probability vector `π` (nonnegative entries summing to one) with `πQ = 0`. Prove also
that its entries are strictly positive (from 4.1 and 4.2: `π_j = Σᵢ π_i P(1)_ij > 0`). (Kelly,
§1.1, p. 3, for the existence and uniqueness of the equilibrium distribution of an irreducible
process on a finite state space; LPW, Theorem 20.1, p. 282, for `πH_t = π`.)

Route: pick `r > 0` with `−q_ii ≤ r` for all `i`. The matrix `K = 1 + r⁻¹ • Q` is stochastic (3.1)
and irreducible (1.1), and so is its transpose (`Matrix.IsIrreducible.transpose`). By Tau Ceti's
`Matrix.IsIrreducible.exists_mulVec_eq_smul`, `Kᵀ v = μ v` for some `μ > 0` and a `v` with positive
entries; summing the entries and using the row sums of `K` gives `μ = 1`, so `π = v/Σ v` has
`πK = π`, that is `πQ = 0`. If `ν` is another probability vector with `νQ = 0`, then
`Kᵀ ν = ν`, so `ν` is a multiple of `v` by
`Matrix.IsIrreducible.exists_eq_smul_of_mulVec_eq_smul`, and the normalization
fixes the multiple.

**Checks.**
- `Q = [[−1, 1], [2, −2]]`: `π = (2/3, 1/3)`.
- The birth–death matrix `[[−1, 1, 0], [2, −3, 1], [0, 2, −2]]`: `π = (4/7, 2/7, 1/7)`.
- The cycle `C₃`: `π` is uniform, `(1/3, 1/3, 1/3)`.
- Irreducibility is needed for uniqueness: for `Q = 0` on two states every probability vector is
  stationary. Nonemptiness is needed for existence: on the empty type no vector has entries
  summing to one.

*Needs:* 1.1, 3.1, 4.1, 4.2; Mathlib `Matrix.IsIrreducible`, `Matrix.IsIrreducible.transpose`;
Tau Ceti `Matrix.IsIrreducible.exists_mulVec_eq_smul`,
`Matrix.IsIrreducible.exists_eq_smul_of_mulVec_eq_smul`.

### 4.4 Convergence to equilibrium

Prove `tendsto_exp_smul_apply`: if `Q` is an irreducible Q-matrix and `π` is a probability vector
with `πQ = 0`, then `exp(tQ)_ij → π_j` as `t → ∞`, for all states `i, j` (LPW, Theorem 20.1,
p. 282, with Remark 20.2: no aperiodicity is assumed; Kelly, §1.1, p. 3).

Route: by 4.2 every entry of `P(1)` is at least some `δ > 0`, so for every column vector `x`
the spread `max − min` of `P(1)x` is at most `(1 − |S|δ)` times the spread of `x`. With
`P(n + s) = P(1)ⁿ P(s)` (`Matrix.exp_add_of_commute`, `Matrix.exp_nsmul`), the spread of column
`j` of `P(t)` tends to `0`. By 4.1, `π_j = Σᵢ π_i P(t)_ij` lies between the least and the largest
entry of that column, so every entry tends to `π_j`.

**Checks.**
- `Q = [[−1, 1], [1, −1]]`: the uniformized matrix at `r = 1` is `[[0, 1], [1, 0]]`, which is
  periodic, yet `P(t) = ½ [[1 + e^(−2t), 1 − e^(−2t)], [1 − e^(−2t), 1 + e^(−2t)]]` tends to the
  matrix with all entries `1/2`.
- `Q = [[−1, 1], [2, −2]]`: `P(t)_12 = (1 − e^(−3t))/3 → 1/3 = π_2`.
- Irreducibility is needed: for `Q = 0` on two states `P(t) = 1` for all `t`, which does not
  converge to a matrix with equal rows.

*Needs:* 1.3, 4.1, 4.2; Mathlib `Matrix.exp_add_of_commute`, `Matrix.exp_nsmul`.

### Examples

The two-state chain with `π = (2/3, 1/3)`, the birth–death chain on three states, the cycle
`C₃`, the periodic uniformized chain of the symmetric two-state matrix, and the reducible matrix
`Q = 0`.

### Dependencies

Layers 1 (1.1, 1.2, 1.3) and 3 (3.1). Mathlib `Matrix.pow_apply_pos_iff_nonempty_path`,
`Matrix.IsIrreducible`, `Matrix.IsIrreducible.transpose`, `Matrix.exp_add_of_commute`,
`Matrix.exp_nsmul`, `Matrix.exp_diagonal`, `Matrix.vecMul_vecMul`,
`NormedSpace.exp_series_hasSum_exp'`, `hasDerivAt_exp_smul_const`; Tau Ceti
`Matrix.IsIrreducible.exists_mulVec_eq_smul`,
`Matrix.IsIrreducible.exists_eq_smul_of_mulVec_eq_smul`.

## Layer 5: detailed balance and Kolmogorov's criterion

### 5.1 Detailed balance for the generator and the semigroup

Prove `detailedBalance_iff_forall_exp_smul`: for every real square matrix `Q` and every vector
`π`, the detailed balance equations `π_i q_ij = π_j q_ji` hold for all `i, j` if and only if
`π_i P(t)_ij = π_j P(t)_ji` holds for all `i, j` and every `t ≥ 0`. For a probability vector `π`
with positive entries and a Q-matrix `Q` these are the conditions of Kelly, Theorem 1.3,
pp. 6–7, equation (1.6), and the second form is the matrix statement that the stationary chain
started from `π` has the same two-time laws forwards and backwards.

- Detailed balance for a Q-matrix implies `πQ = 0`: summing `π_i q_ij = π_j q_ji` over `i` gives
  `(πQ)_j = π_j Σᵢ q_ji = 0` (Kelly, proof of Theorem 1.3, p. 7).

Route: with `D` the diagonal matrix of `π`, detailed balance says `DQ = QᵀD`; then `DQⁿ = (Qᵀ)ⁿD`
for every `n`, so `D exp(tQ) = exp(tQᵀ) D = exp(tQ)ᵀ D` (`Matrix.exp_transpose`). Conversely
differentiate at `t = 0`.

**Checks.**
- The birth–death matrix of 4.3 with `π = (4/7, 2/7, 1/7)`: `π_1 q_12 = 4/7 = π_2 q_21` and
  `π_2 q_23 = 2/7 = π_3 q_32`.
- The cycle `C₃` with uniform `π` is stationary but fails detailed balance:
  `π_1 q_12 = 1/3` and `π_2 q_21 = 0`.

*Needs:* Mathlib `Matrix.exp_transpose`, `NormedSpace.exp_series_hasSum_exp'`,
`hasDerivAt_exp_smul_const`, with the local norm of the Conventions. (Proved here.)

### 5.2 Kolmogorov's criterion

Prove `exists_detailedBalance_iff_cycle`: let `B` be a Metzler matrix on any index type (in
particular any Q-matrix) that is an irreducible generator. Then there are weights `π` with every
`π_i > 0` and `π_i b_ij = π_j b_ji` for all `i, j` if and only if, for every `n` and every
sequence of states `c₀, c₁, …, cₙ` with `cₙ = c₀`, the product `Π_(k < n) b(c_k, c_(k+1))`
equals `Π_(k < n) b(c_(k+1), c_k)` (Kelly, Theorem 1.8 and equation (1.22), p. 23, whose proof is
the analogue of that of Theorem 1.7, pp. 21–22; Kelly assumes irreducibility throughout,
pp. 2–3, and sets the
diagonal rates to zero, which changes nothing here since a step that stays put contributes the
same factor to both products). For an irreducible Q-matrix the weights, normalized, are the
stationary law of 4.3.

Route: multiplying the detailed balance equations along a closed walk and cancelling the
positive weights gives the criterion. Conversely, fix a state `j₀`; for each `j` choose a chain
of positive rates from `j₀` to `j`, and let `π_j` be the product of the forward rates divided by
the product of the reversed ones. A reversed rate on such a chain is positive, because the
criterion applied to the chain closed up by a chain of positive rates back to its start gives a
positive forward product and hence a nonzero, so positive, reversed product; the criterion also
makes `π_j` independent of the chain chosen, and gives detailed balance for each pair.

**Checks.**
- Irreducibility is needed: `[[−1, 1], [0, 0]]` satisfies the cycle condition (every closed walk
  that uses the rate `q_12` also uses `q_21 = 0`, and so does its reverse), but `π_1 · 1 = π_2 · 0`
  forces `π_1 = 0`.
- Nonnegativity off the diagonal is needed: `[[−2, 1, 1], [−1, 0, 1], [1, −1, 0]]` has zero row
  sums and the cycle `1 → 2 → 3 → 1` of positive rates, it satisfies the cycle condition (the
  triangle gives `1 · 1 · 1 = (−1)(−1) · 1`), and `π_1 · 1 = π_2 · (−1)` excludes positive
  weights.
- The cycle `C₃` fails the criterion: `q_12 q_23 q_31 = 1` and `q_21 q_32 q_13 = 0`.
- Every birth–death matrix (`q_ij = 0` for `|i − j| > 1`) with positive rates between neighbours
  satisfies the criterion: a closed walk on a path crosses each edge equally often in each
  direction.
- On the empty type there is no sequence of states and the weights are the empty function.

*Needs:* 1.1; Mathlib `Relation.ReflTransGen`. (Proved here, following Kelly's proof.)

### Examples

The birth–death matrix on three states, the cycle `C₃`, the absorbing two-state matrix and the
matrix with negative off-diagonal entries of the Checks.

### Dependencies

Layer 1 (1.1). Mathlib `Matrix.exp_transpose`, `NormedSpace.exp_series_hasSum_exp'`,
`hasDerivAt_exp_smul_const`, `Relation.ReflTransGen`.

## Scope and ownership

This roadmap owns the targets stated above: Q-matrices, Metzler matrices, the relation of
communication and irreducible generators; the positivity theorems for `exp(tB)` and `exp(tQ)`;
uniqueness for the Kolmogorov forward and backward equations and the identification of
continuous stochastic semigroups with exponentials of Q-matrices; the uniformization identity;
stationary vectors, positivity of transition probabilities, existence and uniqueness of the
stationary law and convergence to it; detailed balance for the semigroup and Kolmogorov's
criterion. The positivity theorem 1.2 for Metzler matrices is owned here, and a theory of positive
linear systems or of M-matrices cites it.

Already in the libraries and therefore not targets:

- Mathlib's matrix exponential with its semigroup law and its derivative
  (`Matrix.exp_add_of_commute`, `hasDerivAt_exp_smul_const`, `hasDerivAt_exp_smul_const'`):
  that `exp(tQ)` solves both Kolmogorov equations is this derivative and is not restated.
- Mathlib's stochastic matrices `Matrix.rowStochastic` and irreducible nonnegative matrices
  `Matrix.IsIrreducible`; Tau Ceti's Perron–Frobenius theorem for irreducible matrices
  (`TauCeti/LinearAlgebra/Matrix/PerronFrobenius/Irreducible.lean`), consumed in 4.3.
- Tau Ceti's strongly continuous semigroups on Banach spaces (`TauCeti/Analysis/Semigroups/`),
  planned by OneParameterSemigroups (completed), Part A: uniqueness for the abstract Cauchy
  problem (`TauCeti.Semigroups.IsClassicalSolution.unique`) and the theorem that a semigroup
  continuous in operator norm is the exponential of a bounded generator
  (`TauCeti.Semigroups.StronglyContinuousSemigroup.continuousAt_zero_iff_domain_eq_top`,
  `TauCeti.Semigroups.StronglyContinuousSemigroup.eq_ofBounded_of_generator_eq`). Layer 2 states
  their matrix forms for real square matrices and adds the identification of the generator of a
  stochastic semigroup as a Q-matrix; it re-proves neither. Mathlib's uniqueness theorem for
  Lipschitz ODEs (`ODE_solution_unique_of_mem_Icc_right`) gives 2.1 as well.
- Tau Ceti's correspondence between row-stochastic matrices with entries in `ℝ≥0` and Markov
  kernels on a finite type (`ProbabilityTheory.Kernel.toMatrix`,
  `ProbabilityTheory.Kernel.rowStochasticEquiv`). The statements above use real matrices, since a
  Q-matrix has negative diagonal entries; each `exp(tQ)`, `t ≥ 0`, and each uniformized matrix
  `K` with `−q_ii ≤ r` is a stochastic matrix and so, after this correspondence, a Markov kernel.

Left to other roadmaps:

- MarkovChainsAndRenewal (on main) owns discrete-time chains and places continuous-time
  generators outside its scope. Its Layer 3 (stationarity and convergence for irreducible
  aperiodic chains) applies to the uniformized matrix `K` of 3.1, which is aperiodic when
  `−q_ii < r` for every `i`; the proofs above do not depend on it.
- StochasticCalculus (on main), §0.6, owns the homogeneous Poisson counting process. The
  uniformization identity uses only the Poisson weights `e^(−rt)(rt)ⁿ/n!` as numbers.
- MarkovChainMixing (an open roadmap, not on main) treats mixing times of discrete-time finite
  chains and excludes continuous time; LinearSystemsAndControl (an open roadmap, not on main),
  Layer 5, characterizes `exp(tA) → 0` (Hurwitz matrices) and the Lyapunov equation, whereas the
  exponentials here are stochastic and converge to a matrix with equal rows; PopulationDynamics
  (an open roadmap, not on main), §3.3, mentions continuous-time birth–death models only in
  its source attributions. This roadmap does not depend on any of them.
- Continuous-time quantum walks, the unitary exponentials `exp(−itA)` of a graph, are a different
  object and are not treated here.

Outside the scope: the law of the random paths (construction of the process from its jump chain
and exponential holding times, the strong Markov property, the jump chain itself), since the
pinned libraries have no carrier for a continuous-time Markov process; countable state spaces,
explosion and minimal solutions; time-inhomogeneous rates; mixing times and spectral gaps in
continuous time; formulas for the stationary law in terms of spanning trees; queueing models.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Analysis/Normed/Algebra/Exponential.lean`: `NormedSpace.exp` (the exponential series,
  `1` when no `ℚ`-algebra structure exists, which does not occur for real matrices);
  `NormedSpace.exp_zero` (`exp 0 = 1`); `NormedSpace.exp_series_hasSum_exp'` (in a complete normed
  algebra over a field `𝕂` of characteristic zero, `Σ (n!)⁻¹ • xⁿ` has sum `exp x`).
- `Mathlib/Analysis/Normed/Algebra/MatrixExponential.lean`: `Matrix.exp_add_of_commute` (for
  commuting `A, B`, `exp (A + B) = exp A * exp B`, with no norm on matrices assumed);
  `Matrix.exp_nsmul` (`exp (n • A) = exp A ^ n`); `Matrix.exp_diagonal`
  (`exp (diagonal v) = diagonal (exp v)`); `Matrix.exp_transpose` (`exp Aᵀ = (exp A)ᵀ`).
- `Mathlib/Analysis/SpecialFunctions/Exponential.lean`: `hasDerivAt_exp_smul_const` and
  `hasDerivAt_exp_smul_const'` (for `𝕂` an `RCLike` field and a complete normed `𝕂`-algebra,
  `u ↦ exp (u • x)` has derivative `exp (t • x) * x`, respectively `x * exp (t • x)`, at `t`).
- `Mathlib/Analysis/Matrix/Normed.lean`: `Matrix.linftyOpNormedRing`,
  `Matrix.linftyOpNormedAlgebra` (the operator norm for the sup norm, a normed ring and algebra
  structure on square matrices, used as a local instance).
- `Mathlib/LinearAlgebra/Matrix/Stochastic.lean`: `Matrix.rowStochastic R n` (the submonoid of
  matrices with nonnegative entries and rows summing to one), `Matrix.mem_rowStochastic_iff_sum`.
- `Mathlib/LinearAlgebra/Matrix/Irreducible/Defs.lean`: `Matrix.IsIrreducible` (nonnegative
  entries and a strongly connected graph of positive entries, by paths of positive length);
  `Matrix.IsIrreducible.transpose`; `Matrix.pow_apply_pos_iff_nonempty_path` (for nonnegative `A`,
  `0 < (A ^ k) i j` if and only if the graph has a path of length `k` from `i` to `j`).
- `Mathlib/Analysis/Calculus/MeanValue.lean`: `constant_of_has_deriv_right_zero` (a function
  continuous on `[a, b]` with right derivative `0` on `[a, b)` is constant there).
- `Mathlib/Analysis/ODE/ExistUnique.lean`: `ODE_solution_unique_of_mem_Icc_right` (two solutions
  on `[a, b]` of an ODE whose field is Lipschitz, with derivatives within `[t, ∞)`, that agree at
  `a` agree on `[a, b]`).
- `Mathlib/Analysis/Normed/Algebra/Exponential.lean`: `NormedSpace.map_exp` (a continuous ring
  homomorphism commutes with `exp`).
- `Mathlib/Data/Matrix/Mul.lean`: `Matrix.vecMul_vecMul` (`(v ᵥ* M) ᵥ* N = v ᵥ* (M * N)`).
  `Mathlib/Logic/Relation.lean`: `Relation.ReflTransGen`.

### From Tau Ceti

- `TauCeti/LinearAlgebra/Matrix/PerronFrobenius/Irreducible.lean`:
  `Matrix.IsIrreducible.exists_mulVec_eq_smul` (a nonempty index type and an irreducible real
  matrix `A`: some `r > 0` and some `v` with all entries positive have `A *ᵥ v = r • v`);
  `Matrix.IsIrreducible.exists_eq_smul_of_mulVec_eq_smul` (over a linearly ordered field, for
  irreducible `A`, `v` with positive entries and `A *ᵥ v = r • v`, every `w` with
  `A *ᵥ w = r • w` is a multiple of `v`). The statements of `Suggested.lean` do not import this
  module.
- `TauCeti/Analysis/Semigroups/` (namespace `TauCeti.Semigroups`), for 2.1 and 2.2:
  `StronglyContinuousSemigroup` (operators `S t : X →L[ℝ] X` for `t : ℝ≥0` on a real normed
  space, `S 0 = 1`, `S (s + t) = S s ∘ S t`, strong continuity at `0`);
  `StronglyContinuousSemigroup.ofBounded` with `ofBounded_apply` (`ofBounded A` at `t` is
  `exp (t • A)`; `BoundedGenerator/Basic.lean`);
  `StronglyContinuousSemigroup.eq_ofBounded_of_generator_eq` (a semigroup whose generator is the
  bounded `A` on all of `X` is `ofBounded A`);
  `StronglyContinuousSemigroup.continuousAt_zero_iff_domain_eq_top` (`UniformlyContinuous.lean`,
  `X` complete: continuity in operator norm at `0` if and only if the generator is everywhere
  defined); `IsClassicalSolution.unique` (`CauchyProblem/Uniqueness.lean`: two classical
  solutions of `u′ = Au` with the same initial value agree on `[0, ∞)`). The statements of
  `Suggested.lean` do not import these modules.

## References

- David A. Levin and Yuval Peres, with contributions by Elizabeth L. Wilmer, *Markov Chains and
  Mixing Times*, second edition, American Mathematical Society, 2017; the PDF posted on
  D. A. Levin's page at the University of Oregon (`mcmt2e.pdf`). Cited as LPW: Chapter 20, §20.1,
  pp. 280–281, equations (20.5)–(20.7), and §20.2, Theorem 20.1 and Remark 20.2, p. 282.
- Frank P. Kelly, *Reversibility and Stochastic Networks*, Wiley, 1979; the chapter files posted,
  with the permission of the copyright holder, on the author's page at the Statistical Laboratory,
  Cambridge (`www.statslab.cam.ac.uk/~frank/BOOKS/kelly_book.html`, Chapter 1 as
  `book/ch1.pdf`, read in the copy kept by the Internet Archive). Chapter 1: §1.1, pp. 1–3; §1.2,
  Theorem 1.3, pp. 6–7, equation (1.6); §1.5, Theorems 1.7 and 1.8, pp. 21–23, equations (1.21)
  and (1.22).
- James R. Norris, *Markov Chains*, Cambridge University Press, 1997, Chapters 2 and 3, for
  Q-matrices, their exponentials, the forward and backward equations and the class structure of
  continuous-time chains; cited in prose without locators.
- The positivity of `exp(tB)` for Metzler matrices (1.2) is classical and is proved here; no
  locator is given for it. The theorem that a semigroup continuous in operator norm is the
  exponential of its generator, used in 2.2, is in Tau Ceti (see the supplier contracts).

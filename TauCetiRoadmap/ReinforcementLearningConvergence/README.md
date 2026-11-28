# Roadmap: reinforcement learning convergence

**Summary.** This roadmap proves convergence theorems for reinforcement-learning methods beyond
the tabular theory: temporal-difference learning with linear features, exploration along one
trajectory, and gradient ascent on softmax policies. Throughout, the state and action
spaces are finite and the discount factor `γ` satisfies `0 ≤ γ < 1`.

The first part concerns a Markov chain with transition matrix `P`, a reward vector `r`, a
positive stationary weight vector `d` and a feature matrix `Φ`, in whose column space the value
`V = (1 − γP)⁻¹ r` is approximated. For every `λ` in `[0, 1]` the TD(λ) operator
is a contraction of the `d`-weighted mean-square norm with modulus `κ = γ(1 − λ)/(1 − γλ)`. The
projected Bellman equation `A_λ θ = b_λ` always has a solution, all its solutions give the same
value vector `Φθ`, and `(1 − κ²)‖Φθ − V‖²` is at most the squared distance from `V` to every
vector `Φθ'`. The quadratic form of `A_λ` is at least `1 − κ` times `‖Φx‖²`, so `A_λ` is
positively stable when `Φ` has full column rank; for weights that are not stationary this can
fail.

The second part is TD(0) with independent transitions sampled from the stationary law.
With full-rank features and nonnegative deterministic steps with `Σ α_t = ∞` and `Σ α_t² < ∞`, the
iterates converge almost surely to the solution `θ⋆` of the projected equation. With features of
norm at most one, `T ≥ 64/(1 − γ)²` and the constant step `1/√T`, the average `θ̄_T` of the first
`T` iterates has `E‖Φ(θ̄_T − θ⋆)‖² ≤ (‖θ_0 − θ⋆‖² + 2σ²)/(√T(1 − γ))`, with `σ²` the mean
squared norm of the update at `θ⋆`. With decreasing steps of the Polyak–Juditsky type, `√t`
times the error of the averaged iterate is asymptotically normal with covariance
`A₀⁻¹ Σ⋆ A₀⁻ᵀ`.

The third part shows that a policy which, at each visit to a state, gives every action
probability at least `c/n` (with `c > 0` and `n` the number of visits to that state) visits every
state-action pair infinitely often almost surely in a communicating MDP; this supplies the
step-size hypothesis of tabular Q-learning along a single trajectory. The fourth part shows that,
for rewards in `[0, 1]` and a probability vector `μ` of initial states, the softmax value at `μ` is
`8/(1 − γ)³`-smooth; if `μ` is positive, gradient ascent with step `(1 − γ)³/8` has, after
`t ≥ 1` steps, suboptimality at most a constant over `c_t² t`, with `c_t` the least probability
the iterates before time `t` give the actions of a fixed optimal deterministic policy.

The roadmap rests on MarkovDecisionProcesses (the MDP, its trajectory law and tabular
Q-learning), StochasticApproximationAveraging (positive stability and the asymptotic linear form of
averaged iterates), FirstOrderOptimization (the Robbins–Siegmund theorem and smooth functions),
PolicyGradientMethods (the softmax gradient and the non-uniform Łojasiewicz inequality),
MathematicalStatisticsAsymptotic (the multivariate central limit theorem) and
MarkovChainsAndRenewal (irreducibility and invariant laws).

Layer n is part n; Layers 3 and 4 do not use Layers 1 and 2.

## Conventions

- `S` is a finite type of states with decidable equality; vectors on `S` are functions
  `S → ℝ`, `P : Matrix S S ℝ` is stochastic (`P s s' ≥ 0`, rows summing to `1`) and acts by
  `Matrix.mulVec`; `d ᵥ* P = d` says that the row vector `d` is stationary. The discount factor is
  `γ : ℝ≥0` with `γ < 1`, as in MarkovDecisionProcesses. The trace parameter `λ ∈ [0, 1]` is
  written `lam` in Lean.
- Inverses of square matrices are `Ring.inverse`, which is `0` at a singular matrix. For a
  stochastic `P` and `γ < 1`, the matrices `1 − γP` and `1 − γλP` are invertible (Neumann series
  in Mathlib's `Matrix.linftyOpNormedRing`, `NormedRing.inverse_one_sub`), so no junk value
  occurs in the statements below.
- `V = (1 − γP)⁻¹ r`. For an MDP `M` and a randomized stationary policy `π`, taking `P` to be
  `M.policyMatrix π` and `r s = Σ_a π(a | s) reward(s, a)` makes `V` the value of `π`, by
  MarkovDecisionProcesses 1.2 (`value_eq_inverse`). If the state chain of `π` is irreducible,
  MarkovChainsAndRenewal Layer 3 (`existsUnique_invariant_probability`, finite `S`) gives an
  invariant probability `ν`, and `d s = ν {s}` is a stationary vector with `d > 0`: invariance
  gives `d ᵥ* P = d` (the singleton formula of `Kernel.ofPMF`), and if `d x > 0` and `x` reaches
  `s` in `n` steps then `d s ≥ d x (Pⁿ) x s > 0`. Aperiodicity is not needed anywhere.
- `weightedSq d v = Σ_s d s · v s²` is `‖v‖²_D` for `D = diagonal d`; for `d > 0` it is the
  square of a norm, for `d ≥ 0` of a seminorm.
- Features: `Φ : Matrix S (Fin k) ℝ`, with row `φ s = Φ s`; `k = 0` is allowed. "Full column
  rank" is `Function.Injective Φ.mulVec`. Parameter vectors are `Fin k → ℝ`; their Euclidean
  norm is written `‖θ‖² = θ ⬝ᵥ θ` (Mathlib's default norm on `Fin k → ℝ` is the sup norm and is
  not used).
- TD(λ) objects: `N_λ = (1 − γλP)⁻¹` (`tdResolvent`), `T_λ v = N_λ r + γ(1 − λ) N_λ P v`
  (`tdOperator`), `κ_λ = γ(1 − λ)/(1 − γλ)`, `A_λ = Φᵀ D N_λ (1 − γP) Φ` (`tdMatrix`) and
  `b_λ = Φᵀ D N_λ r` (`tdVector`). At `λ = 0`, `A₀ = Σ_{s,s'} d s P s s' φ s (φ s − γ φ s')ᵀ`.
  Since `N_λ (1 − γP) = 1 − γ(1 − λ) N_λ P`, one has `b_λ − A_λ θ = Φᵀ D (T_λ(Φθ) − Φθ)`: the
  equation `A_λ θ = b_λ` says that `Φθ` is a `D`-orthogonal projection of `T_λ(Φθ)` onto the
  column space of `Φ`, `Φθ = Π_D T_λ(Φθ)`. Tsitsiklis and Van Roy write the TD matrix with the
  opposite sign and call it negative definite; here `A_λ` is positive, so that it matches the
  recursion `x − γ_t (R x + ξ_t)` of StochasticApproximationAveraging with `R θ = A₀(θ − θ⋆)`.
- MDPs (Layers 3 and 4) are MarkovDecisionProcesses' `MDP`; Layer 4 uses the weight-table
  objects of PolicyGradientMethods (`softmax`, `policyValue`, `policyQ`, `visitation`,
  `objective`), copied verbatim.
- "Proved here" means that the route is written out in full in this README; it claims no
  novelty.

## Layer 1: the projected Bellman equation

### 1.1 Contraction and the projected fixed point

Let `P` be stochastic, `d ≥ 0` with `d ᵥ* P = d`, `γ < 1` and `0 ≤ λ ≤ 1`.

- **Contraction** (`weightedSq_tdOperator_sub_le`): for all `v`, `w`,
  `‖T_λ v − T_λ w‖²_D ≤ κ_λ² ‖v − w‖²_D`, and `T_λ V = V`.
- **The projected equation** (`projectedBellman`): if moreover `d > 0`, then for every feature
  matrix `Φ` the equation `A_λ θ = b_λ` has a solution; any two solutions `θ`, `θ'` have
  `Φθ = Φθ'`; and every solution satisfies `(1 − κ_λ²) ‖Φθ − V‖²_D ≤ ‖Φθ' − V‖²_D` for all `θ'`.
  When `Φ` has full column rank the solution `θ⋆` is therefore unique.

Tsitsiklis–Van Roy, Lemma 1 (p. 680, `‖PJ‖_D ≤ ‖J‖_D`), Lemma 4 (p. 681, the modulus
`α(1 − λ)/(1 − αλ)` with their `α` for our `γ`), Lemmas 5 and 6 (p. 681), and Theorem 1(3)–(4)
(p. 679, under their Assumptions 1–4), where the bound is
`‖Φθ⋆ − V‖_D ≤ (1 − λγ)/(1 − γ) ‖Π_D V − V‖_D`; Lemma 6 gives it under their Assumptions 1 and 2,
which include full column rank, irreducibility and aperiodicity. Their footnote 1 (p. 679) states
the sharper factor `(1 − λγ)/√((1 − γ)(1 + γ − 2λγ))` without proof; it equals
`(1 − κ_λ²)^(−1/2)`, which is the form above. The general `Φ` (no rank condition), `d ≥ 0` in
the contraction and the sharper factor are proved here.

*Proof route.* (a) For each `s`, Jensen's inequality for `x ↦ x²` with the weights `P s ·`
(Mathlib `ConvexOn.map_sum_le`) gives `((P v) s)² ≤ Σ_{s'} P s s' v s'²`; multiplying by
`d s ≥ 0`, summing, and using `d ᵥ* P = d` gives `‖P v‖²_D ≤ ‖v‖²_D`. (b) By the Neumann series,
`N_λ P = Σ_{m ≥ 0} (γλ)^m P^{m+1}`, so `‖N_λ P u‖_D ≤ Σ (γλ)^m ‖u‖_D = ‖u‖_D/(1 − γλ)` by (a)
and the triangle inequality for the seminorm `‖·‖_D` (Cauchy–Schwarz for the form
`Σ d s x s y s`). Since `T_λ v − T_λ w = γ(1 − λ) N_λ P (v − w)`, squaring gives the contraction.
`T_λ V = V`: multiplying by the invertible `1 − γλP`, it says `r + γ(1 − λ) P V = (1 − γλP) V`,
that is `r = (1 − γP) V`. (c) Let `d > 0`; then `‖·‖_D` is a norm. Write `C` for the column space
of `Φ` and `Π` for the `D`-orthogonal projection onto it (Mathlib `Submodule.starProjection` for
the inner product `Σ d s x s y s`). By the identity of the Conventions, `A_λ θ = b_λ` holds
exactly when `Φθ = Π T_λ(Φθ)`. The map `u ↦ Π T_λ u` sends `C` into `C` and, since `Π` does not
increase `‖·‖_D`, is a `κ_λ`-contraction of the finite-dimensional normed space `C` with
`κ_λ ≤ γ < 1`; Banach's theorem (Mathlib `ContractingWith.fixedPoint_unique'` and the existence of
the fixed point in the complete space `C`) gives a unique fixed point `u⋆ ∈ C`, and any `θ` with
`Φθ = u⋆` solves the equation. Two solutions give two fixed points, hence `Φθ = Φθ'`. If `Φ` is
injective, `θ` is then unique. (d) With `u⋆ = Φθ`: `u⋆ − Π V ∈ C` and `Π V − V` is
`D`-orthogonal to `C`, so `‖u⋆ − V‖²_D = ‖Π V − V‖²_D + ‖u⋆ − Π V‖²_D`, and
`‖u⋆ − Π V‖_D = ‖Π T_λ u⋆ − Π T_λ V‖_D ≤ κ_λ ‖u⋆ − V‖_D` (using `T_λ V = V`). Hence
`(1 − κ_λ²) ‖u⋆ − V‖²_D ≤ ‖Π V − V‖²_D ≤ ‖Φθ' − V‖²_D` for every `θ'`. Finally
`1 − κ_λ² = (1 − γ)(1 + γ − 2λγ)/(1 − γλ)²`, which gives the footnote's factor, and
`(1 + γ − 2λγ)(1 − γλ)⁻² ≥ (1 − γ)(1 − γλ)⁻²` gives Tsitsiklis–Van Roy's.

*Needs:* Mathlib `ConvexOn.map_sum_le`, `NormedRing.inverse_one_sub`, `Submodule.starProjection`,
`ContractingWith.fixedPoint_unique'`.

**Checks.**

- The chain on three states with rows `(1/2, 1/4, 1/4)`, `(0, 1/3, 2/3)`, `(1, 0, 0)` has the
  stationary vector `d = (8/15, 1/5, 4/15)`, and `‖P v‖²_D ≤ ‖v‖²_D` for all 125 vectors
  `v ∈ {−2, …, 2}³` (exact). With the uniform weights `1/3`, which are not stationary, `v = e_1`
  gives `5/12 > 1/3`: stationarity is needed.
- On this chain with `r = (1, −2, 1/2)`, for `γ ∈ {0, 1/2, 9/10}` and `λ ∈ {0, 1/2, 1}`, the
  contraction holds on the same 125 vectors, `T_λ V = V`, and the error bound holds for a rank-one,
  a rank-two and a rank-deficient (`Φ = ((1, 2), (1, 2), (0, 0))`) feature matrix (exact).
  For `γ = 9/10`, `λ = 1/2`: `κ = 9/11`.
- One state: `T_λ v − T_λ w = κ_λ (v − w)`, so the modulus is attained.
- `λ = 1`: `κ = 0` and `Φθ⋆ = Π_D V` (the best approximation, with equality in the bound).
  Tabular features `Φ = 1`: `θ⋆ = V`. `γ = 0`: `Φθ⋆ = Π_D r`. `k = 0`: `Φθ = 0`, and the bound
  reads `(1 − κ²)‖V‖²_D ≤ ‖V‖²_D`.
- For the rank-deficient matrix above, `det A_λ = 0`, the solutions form a line, and all give the
  same `Φθ`; this is why only `Φθ`, not `θ`, is unique without full rank.
- `γ = 1` is excluded: with `Φ = 1` on the chain above, `A₀ = D(1 − P)` is singular.

### 1.2 The TD matrix

Let `P` be stochastic, `d ≥ 0` with `d ᵥ* P = d`, `γ < 1` and `0 ≤ λ ≤ 1`, and `Φ` any feature
matrix. Then (`tdMatrix_quadratic_ge`):

- for every `x : Fin k → ℝ`, `xᵀ A_λ x ≥ (1 − κ_λ) ‖Φx‖²_D`;
- if moreover `d > 0` and `Φ` has full column rank, `A_λ` is positively stable
  (`IsPositivelyStable`, copied from StochasticApproximationAveraging 1.1: every complex
  eigenvalue has positive real part), and in particular invertible.

Tsitsiklis–Van Roy, Lemma 9 (p. 683), and the deduction from it on p. 684 (which verifies
hypothesis 4 of their Theorem 2, p. 683) give the negative definiteness of their matrix for full
column rank; Bhandari–Russo–Singal, Lemma 3 (p. 10), state
the case `λ = 0` in the form `(θ⋆ − θ)ᵀ ḡ(θ) ≥ (1 − γ)‖V_θ − V_θ⋆‖²_D`. `A_λ` is not symmetric,
and the statement concerns its quadratic form; it does not claim that `A_λ` is positive definite
in Mathlib's sense, which includes being Hermitian. Proved here for `d ≥ 0` and general `Φ`.

*Proof route.* Write `u = Φx`. By the identity of the Conventions,
`xᵀ A_λ x = uᵀ D u − γ(1 − λ) uᵀ D N_λ P u = ‖u‖²_D − ⟨u, γ(1 − λ) N_λ P u⟩_D`, and by
Cauchy–Schwarz for `⟨·,·⟩_D` and the bound `‖γ(1 − λ) N_λ P u‖_D ≤ κ_λ ‖u‖_D` of 1.1 (the
contraction applied to `u` and `0`), the second term is at most `κ_λ ‖u‖²_D`. If `d > 0` and `Φ`
is injective, `xᵀ A_λ x > 0` for real `x ≠ 0`. For a complex eigenvector `z = x + iy ≠ 0` with
eigenvalue `μ`, `Re(z* A_λ z) = xᵀ A_λ x + yᵀ A_λ y > 0` (the imaginary cross terms cancel in the
real part because `A_λ` is real), and `z* A_λ z = μ ‖z‖²`, so `Re μ > 0`. Since `0` is then not an
eigenvalue, `A_λ` is invertible.

*Needs:* 1.1; StochasticApproximationAveraging 1.1 (`IsPositivelyStable`, definition).

**Checks.**

- On the three-state chain of 1.1 with `Φ = ((1, 0), (1, 1), (0, 1))`, for `γ ∈ {0, 1/2, 9/10}`
  and `λ ∈ {0, 1/2, 1}`: the inequality holds for all `x ∈ {−3, …, 3}²` and both eigenvalues of
  `A_λ` have positive real part (exact). At `γ = 0` or `λ = 1`, `A_λ = Φᵀ D Φ` and the inequality
  is an equality.
- Stationarity cannot be dropped (Tsitsiklis–Van Roy, Section IX, Theorem 3, p. 686, for sampling
  from a law other than the stationary one). Two states, `P` with both rows `(1/20, 19/20)`,
  `φ = (1, 2)` (`k = 1`, full rank), `γ = 9/10`, `λ = 0`, zero rewards and the weights
  `q = (1/2, 1/2)`, which are positive but not stationary (`q P = (1/20, 19/20)`): every other
  hypothesis holds, and the scalar `A_q = Σ_s q s φ s (φ s − γ (Pφ) s) = −53/400 < 0`, so both
  conclusions fail. With the stationary weights `(1/20, 19/20)` of the same chain,
  `A = 1711/4000 > 0`. For `q`, (a) of 1.1 fails too: `‖Pφ‖²_q = 1521/400 > 5/2 = ‖φ‖²_q`. Consequently, TD(0) that samples states from
  `q` has expected iterates `m_{t+1} = (1 − α_t A_q) m_t`, with `|m_t| → ∞` from every `m_0 ≠ 0`
  whenever `α_t ≥ 0` and `Σ α_t = ∞`, as `Π (1 + α_t |A_q|) ≥ 1 + |A_q| Σ α_t`.
- Full rank is needed for stability: with the rank-deficient `Φ` of 1.1, `det A_λ = 0`.

*Consequence, not a target.* For `d > 0` and full column rank, `θ⋆ = A_λ⁻¹ b_λ` (least-squares
temporal differences, Bradtke–Barto, in the batch form): 1.1 and 1.2 together.

### Examples

The three-state chain of the Checks; the two-state off-policy chain; one-state chains, where
every object is a scalar and `A_λ = (1 − γ)/(1 − γλ) · φ²`.

### Dependencies

Mathlib linear algebra and convexity; StochasticApproximationAveraging 1.1 (definition).

## Layer 2: linear TD(0) with independent on-policy samples

The sampling model is `IsIIDTransitionSample μ d P r st sn rew` on a probability space
`(Ω, μ)`: the triples `(st t, sn t, rew t)` (state, next state, reward) are measurable,
independent and identically distributed (`iIndepFun`, `IdentDistrib`), the pair `(st 0, sn 0)`
has law `d s · P s s'`, `∫ rew 0` over `{st 0 = s}` is `d s · r s`, and `rew 0` is
square-integrable (`MemLp (rew 0) 2 μ`). With `d` stationary this is "on-policy" sampling: the
next state `sn t` also has law `d`. Linear TD(0) is `linearTD0 Φ γ α θ₀ st sn rew`,

    θ (t+1) = θ t + α t (rew t + γ φ(sn t)ᵀ θ t − φ(st t)ᵀ θ t) φ(st t),   θ 0 = θ₀.

Write `A_t = φ(st t)(φ(st t) − γ φ(sn t))ᵀ`, `b_t = rew t · φ(st t)`, so that
`θ (t+1) = θ t + α t (b_t − A_t θ t)`, `E A_t = A₀` and `E b_t = b₀`. Let `θ⋆` solve
`A₀ θ⋆ = b₀` (1.1), `ζ_t = b_t − A_t θ⋆` (the update at `θ⋆`, with `E ζ_t = 0`),
`σ² = E ‖ζ_0‖²` and `Σ⋆ = E ζ_0 ζ_0ᵀ`. Let `ℱ t` be the σ-algebra of the triples with index
`< t`; then `θ t` is `ℱ t`-measurable and the triple `t` is independent of `ℱ t`
(`iIndepFun.indepFun_finset`). Hence, for `e = θ t − θ⋆` and a function `f` of the triple,
conditional expectations given `ℱ t` of products of coordinates of `e` with `f` are computed by
pulling out the coordinates of `e` (Mathlib `condExp_mul_of_stronglyMeasurable_left`) and
replacing `f` by its mean (Mathlib `condExp_indep_eq`). This gives, for `d ᵥ* P = d` and rows of
`P` summing to `1`, with `ξ = φ(st t)ᵀ e` and `ξ' = φ(sn t)ᵀ e`:

- `E[ξ² | ℱ t] = E[ξ'² | ℱ t] = ‖Φe‖²_D` (the law of `st` is `d` because rows sum to `1`, and that
  of `sn` is `d ᵥ* P = d`), hence `E[ξξ' | ℱ t] ≤ ‖Φe‖²_D` by Cauchy–Schwarz;
- `E[eᵀ(b_t − A_t θ t) | ℱ t] = −E[ξ(ξ − γξ') | ℱ t] ≤ −(1 − γ)‖Φe‖²_D`;
- `‖b_t − A_t θ t‖² = ‖ζ_t − (ξ − γξ') φ(st t)‖² ≤ 2‖ζ_t‖² + 2 ‖φ(st t)‖² (ξ − γξ')²`, and
  `E[(ξ − γξ')² | ℱ t] ≤ (1 + γ)² ‖Φe‖²_D`.

This is the computation behind Bhandari–Russo–Singal, Lemma 3 (p. 10) and (15) (p. 14), done here
conditionally on `ℱ t`; it is the source of the three statements below. Every `θ t` is
square-integrable: by induction, `θ (t+1)` is a bounded linear image of `θ t` plus
`α t ζ`-type terms in `L²` (the features are bounded and `rew t ∈ L²`).

### 2.1 Almost-sure convergence

Let the rows of `P` sum to `1`, `d > 0` with `d ᵥ* P = d`, the sample be as above, `γ < 1`, `Φ` of
full column rank, `A₀ θ⋆ = b₀`, and let the deterministic steps satisfy `α t ≥ 0`,
`Σ α t = ∞` and `Σ α t² < ∞`. Then, for every `θ₀`, `θ t → θ⋆` almost surely
(`linearTD0_ae_tendsto`).

Tsitsiklis–Van Roy, Section IX (p. 686), say that this sampling variant converges when states are
sampled from the stationary law, and give no proof. Proved here, by the Robbins–Siegmund theorem.

*Proof route.* Let `V_t = ‖θ t − θ⋆‖²` and `B = max_s ‖φ s‖`. Expanding
`V_{t+1} = V_t + 2 α t eᵀ(b_t − A_t θ t) + α t² ‖b_t − A_t θ t‖²` and using the three facts above
with `‖φ(st t)‖ ≤ B` and `(ξ − γξ')² ≤ B²(1 + γ)² V_t`:

    E[V_{t+1} | ℱ t] ≤ (1 + 2 α t² B⁴ (1 + γ)²) V_t + 2 α t² σ² − 2 α t (1 − γ) ‖Φ(θ t − θ⋆)‖²_D.

All four sequences `V_t`, `a_t = 2 α t² B⁴ (1 + γ)²`, `β_t = 2 α t² σ²`,
`ζ'_t = 2 α t (1 − γ) ‖Φ(θ t − θ⋆)‖²_D` are nonnegative and adapted, `V_t` is integrable, and
`a`, `β` are summable. FirstOrderOptimization 5.1 (`ae_tendsto_of_robbinsSiegmund`,
`ae_summable_of_robbinsSiegmund`) gives, almost surely, `V_t → L(ω)` and
`Σ α t ‖Φ(θ t − θ⋆)‖²_D < ∞`. With `d > 0` and `Φ` injective, `ω₀ = min_{‖x‖ = 1} ‖Φx‖²_D > 0`,
so `Σ α t V_t < ∞`; since `Σ α t = ∞`, `liminf V_t = 0`, and therefore `L = 0`.

*Needs:* 1.1 (existence of `θ⋆`); FirstOrderOptimization 5.1; Mathlib
`condExp_mul_of_stronglyMeasurable_left`, `MeasureTheory.condExp_indep_eq`,
`ProbabilityTheory.iIndepFun.indepFun_finset`.

**Checks.**

- `Σ α t² < ∞` cannot be dropped: one state, `φ = 1`, `γ = 0`, rewards `±1` with probability `1/2`
  each (`r = 0`, `θ⋆ = 0`) and `α t = 1/2`: `θ (t+1) = θ t / 2 ± 1/2`, so
  `|θ (t+1)| ≥ 1/2 − |θ t|/2`
  on every path and `θ t` never tends to `0`. Every other hypothesis holds.
- `d > 0` cannot be dropped: two states, both rows of `P` equal to `(0, 1)`, `d = (0, 1)`
  (stationary), tabular features. The first state is never sampled, so the first coordinate of
  `θ t` stays at that of `θ₀`, while `A₀ = diag(0, 1)(1 − γP)` is singular and `A₀ θ⋆ = b₀` leaves
  the first coordinate of `θ⋆` free.
- `Σ α t = ∞` cannot be dropped: `α = 0` keeps `θ t = θ₀`.

### 2.2 Mean-square bounds

- **Averaged iterate** (`linearTD0_average_weightedSq_le`): let the rows of `P` sum to `1`,
  `d ᵥ* P = d`, the sample be as above, `γ < 1`, `‖φ s‖ ≤ 1` for every `s`, `A₀ θ⋆ = b₀`, and
  `T ≥ 64/(1 − γ)²` (an integer). With the constant step `1/√T` and
  `θ̄_T = T⁻¹ Σ_{t < T} θ t`,
  `E ‖Φ(θ̄_T − θ⋆)‖²_D ≤ (‖θ₀ − θ⋆‖² + 2σ²)/(√T (1 − γ))`.
- **Mean-square convergence** (`linearTD0_integral_sq_tendsto`): let the rows of `P` sum to `1`,
  `d > 0` with `d ᵥ* P = d`, the sample be as above, `γ < 1`, `Φ` of full column rank and
  `A₀ θ⋆ = b₀`. If the deterministic steps satisfy `α t ≥ 0`, `α t → 0` and `Σ α t = ∞`, then
  `E ‖θ t − θ⋆‖² → 0`; in particular `sup_t E ‖θ t − θ⋆‖² < ∞`.

Bhandari–Russo–Singal, Theorem 2(a) (p. 14), state a bound of the first kind with `4σ²` in place
of `2σ²`, for the average of `θ_1, …, θ_T`, under the normalization `Σ_s d s ‖φ s‖² ≤ 1` (p. 5);
their proof ((15), p. 14, and (16), p. 15) uses the bound on `E ‖g_t(θ)‖²` that the pointwise
normalization `‖φ s‖ ≤ 1` gives. The statement and constant above are those of the route below,
proved here. The second statement is proved here (no step-size schedule is assumed beyond
`α t → 0` and `Σ α t = ∞`; Bhandari–Russo–Singal, Theorem 2(c), give a rate for one schedule).

*Proof route.* (a) *One step.* Let `α t = α` with `0 < α ≤ (1 − γ)/8`, `e = θ t − θ⋆` and
`u_t = E ‖θ t − θ⋆‖²`. Taking expectations in the expansion of 2.1, with `‖φ s‖ ≤ 1` and
`(1 + γ)² ≤ 4`:

    u_{t+1} ≤ u_t − 2α(1 − γ) E‖Φe‖²_D + α² (2σ² + 8 E‖Φe‖²_D)
            ≤ u_t − α(1 − γ) E‖Φe‖²_D + 2α²σ²,

because `8α ≤ 1 − γ`. (b) *Average.* Summing (a) over `t < T` and dropping `u_T ≥ 0`:
`α(1 − γ) Σ_{t<T} E‖Φ(θ t − θ⋆)‖²_D ≤ ‖θ₀ − θ⋆‖² + 2Tα²σ²`. With `α = 1/√T`, admissible exactly
when `T ≥ 64/(1 − γ)²`, this is `T⁻¹ Σ_{t<T} E‖Φ(θ t − θ⋆)‖²_D ≤ (‖θ₀ − θ⋆‖² + 2σ²)/(√T(1 − γ))`,
and `‖Φ(θ̄_T − θ⋆)‖²_D ≤ T⁻¹ Σ_{t<T} ‖Φ(θ t − θ⋆)‖²_D` by convexity of `x ↦ ‖Φx‖²_D`.
(c) *Decreasing
steps.* Let `B = max_s ‖φ s‖` and `ω₀ > 0` as in 2.1. The expansion of 2.1 gives, once
`α t ≤ (1 − γ)/(2B²(1 + γ)²)` (true for `t ≥ t₀`, as `α t → 0`),
`u_{t+1} ≤ u_t − α t (1 − γ) E‖Φe‖²_D + 2 α t² σ² ≤ (1 − c α t) u_t + C α t²` with
`c = (1 − γ) ω₀` and `C = 2σ²`; every `u_t` is finite. Given `ε > 0`, take `t₁ ≥ t₀` with
`C α t ≤ c ε` and `c α t ≤ 1` for `t ≥ t₁`. Then
`u_{t+1} − ε ≤ (1 − c α t)(u_t − ε) − α t (c ε − C α t) ≤ (1 − c α t)(u_t − ε)`, so
`max(u_t − ε, 0) ≤ Π_{t₁ ≤ i < t} (1 − c α i) · max(u_{t₁} − ε, 0)`, which tends to `0` because
`Π (1 − c α i) ≤ exp(−c Σ α i)` and `Σ α i = ∞`. Hence `limsup u_t ≤ ε` for every `ε > 0`.

*Needs:* 1.1 (existence of `θ⋆`); the conditional computation of the layer introduction; Mathlib
`condExp_mul_of_stronglyMeasurable_left`, `MeasureTheory.condExp_indep_eq`.

**Checks.**

- Two states, `P` with rows `(1/2, 1/2)`, `(1/4, 3/4)`, `d = (1/3, 2/3)`,
  `φ = ((1, 0), (3/5, 4/5))`, `γ = 1/2`, rewards `r s + ε c s` with a fair sign `ε`,
  `r = (1, −1/2)`,
  `c = (1, 1/2)`: `A₀ = ((3/10, 2/15), (2/15, 4/15))`, `θ⋆ = (8/7, −11/7)`, `σ² = 32/49`. For
  `θ₀ = (3, −2)`, `T = 256` and `α = 1/16 = (1 − γ)/8` (the boundary case), the exact first- and
  second-moment recursion of the iterates (rational arithmetic) satisfies the one-step inequality
  (a) at all 256 steps and the averaged bound (b). The same holds for `γ = 0`, `T = 64`, and for
  the chain with rows `(0, 1)`, `(1/2, 1/2)`, `γ = 3/4`, `T = 1024`.

### 2.3 The central limit theorem for the averaged iterate

Let the rows of `P` sum to `1`, `d > 0` with `d ᵥ* P = d`, the sample be as above, `γ < 1`, `Φ` of
full column rank, `A₀ θ⋆ = b₀`, `θ₀` deterministic, and let the steps satisfy `α t > 0`,
`α t → 0` and `(α t − α (t+1))/α t = o(α t)` (the decreasing case of
StochasticApproximationAveraging
1.1, for example `α t = c (t + 1)^(−a)` with `0 < a < 1`). With the averaged iterate
`θ̄_t = t⁻¹ Σ_{i<t} θ (i+1)` (`averagedIterate`, copied from StochasticApproximationAveraging 2.1),

    √t (θ̄_t − θ⋆) → N(0, A₀⁻¹ Σ⋆ A₀⁻ᵀ)   in law
    (`linearTD0_averagedIterate_tendstoInDistribution`),

where `Σ⋆` is the covariance matrix (`TauCeti.covMatrix`) of the law of `ζ_0`.

Polyak and Juditsky (1992) prove such a limit for linear recursions with additive noise. TD(0)
has multiplicative noise (`A_t` is random); the theorem is proved here from
StochasticApproximationAveraging 2.1 and MathematicalStatisticsAsymptotic 1.2. Constant steps are
excluded: with multiplicative noise the limit covariance then has an additional term
(StochasticApproximationAveraging, scope, after Mou, Li, Wainwright, Bartlett and Jordan).

*Proof route.* (1) *The supplier's form.* Since `b_t − A_t θ = −A₀(θ − θ⋆) − ξ_t` with
`ξ_t = (A_t − A₀)(θ t − θ⋆) − ζ_t`, the iteration is `θ (t+1) = θ t − α t (R(θ t) + ξ_t)` with
`R θ = A₀(θ − θ⋆)`, read in `EuclideanSpace ℝ (Fin k)` through `WithLp.toLp 2`. Its hypotheses
hold: `A₀` is positively stable (1.2 at `λ = 0`); the steps satisfy the second clause of
`IsAdmissibleStepSize` of StochasticApproximationAveraging 1.1; `ξ_t` is `ℱ (t+1)`-measurable and
square-integrable, with `E[ξ_t | ℱ t] = (E A_t − A₀)(θ t − θ⋆) − E ζ_t = 0`; `sup_t E ‖ξ_t‖² < ∞`
by 2.2 (the second statement: the conditions there follow, `Σ α t = ∞` because otherwise
`Σ (α t − α (t+1))/α t` would converge and `log α t` with it, so `α t` would not tend to `0`) and
the boundedness of the features; and the linearization term `R(θ) − A₀(θ − θ⋆)` is `0`.
StochasticApproximationAveraging 2.1 (`tendstoInMeasure_sqrt_smul_averagedIterate_sub_add`) gives
`√t (θ̄_t − θ⋆) + A₀⁻¹ t^(−1/2) Σ_{i<t} ξ_i → 0` in probability. (2) *The multiplicative part.*
`η_i = (A_i − A₀)(θ i − θ⋆)` are martingale differences, so
`E ‖t^(−1/2) Σ_{i<t} η_i‖² = t⁻¹ Σ_{i<t} E‖η_i‖² ≤ K t⁻¹ Σ_{i<t} E‖θ i − θ⋆‖² → 0`, with `K` a bound
for `‖A_i − A₀‖²`, by 2.2 and Cesàro (Mathlib `Filter.Tendsto.cesaro`); by Chebyshev,
`A₀⁻¹ t^(−1/2) Σ η_i → 0` in probability. (3) *The additive part.* The `ζ_i` are i.i.d., centred
(`A₀ θ⋆ = b₀`), measurable functions of the triples and square-integrable;
MathematicalStatisticsAsymptotic
1.2 (`tendstoInDistribution_inv_sqrt_smul_sum_sub_euclidean`) gives
`t^(−1/2) Σ_{i<t} ζ_i → N(0, Σ⋆)` in law. The continuous mapping theorem (Mathlib
`TendstoInDistribution.continuous_comp`) and Tau Ceti's `map_affine_multivariateGaussian` (with
`TauCeti.posSemidef_covMatrix`) give `A₀⁻¹ t^(−1/2) Σ ζ_i → N(0, A₀⁻¹ Σ⋆ A₀⁻ᵀ)`. (4) Since
`√t (θ̄_t − θ⋆) = A₀⁻¹ t^(−1/2) Σ ζ_i − A₀⁻¹ t^(−1/2) Σ η_i + o_P(1)`, Slutsky's lemma (Mathlib
`tendstoInDistribution_of_tendstoInMeasure_sub`) concludes.

*Needs:* 1.2, 2.2; StochasticApproximationAveraging 1.1 and 2.1; MathematicalStatisticsAsymptotic
1.2; Mathlib `TendstoInDistribution.continuous_comp`,
`tendstoInDistribution_of_tendstoInMeasure_sub`, `Filter.Tendsto.cesaro`; Tau Ceti
`TauCeti.Probability.map_affine_multivariateGaussian`, `TauCeti.posSemidef_covMatrix`.

**Checks.**

- Tabular features (`Φ = 1`) with `γ = 0`: `A₀ = diagonal d`, `θ⋆ = r`,
  `Σ⋆ = diagonal (d s · Var(rew | st = s))`, and the limit covariance is
  `diagonal (Var(rew | st = s) / d s)`, that of the sample means of the rewards at each state with
  `d s · t` samples.
- `α t = c/(t + 1)` is not in the admissible class: `(α t − α (t+1))/α t = 1/(t + 2)`, which is not
  `o(c/(t + 1))`.

### Examples

The two-state chains of the Checks; tabular features, where linear TD(0) with independent
samples is the synchronous-in-law version of the tabular TD(0) of MarkovDecisionProcesses 6.4.

### Dependencies

Layer 1; FirstOrderOptimization 5.1; StochasticApproximationAveraging 1.1 and 2.1;
MathematicalStatisticsAsymptotic 1.2; Mathlib conditional expectation, independence and
convergence in distribution; Tau Ceti Gaussian measures and covariance matrices.

## Layer 3: exploration

### 3.1 Every state-action pair is visited infinitely often

Let `M` be an MDP (MarkovDecisionProcesses, `MDP`) with finitely many states and actions, and
suppose `M` is communicating in the following sense: for some randomized stationary policy `π₀`,
the state kernel `M.stationaryKernel π₀` is irreducible (`IsIrreducible`, copied from
MarkovChainsAndRenewal). Let `π` be a history-dependent policy (`HistoryPolicy`) and `c > 0` such
that, for every `n`, history `h` up to time `n`, state `s` and action `a`, the action at time
`n + 1` in state `s` has probability `π.next n (h, s) {a} ≥ c / (1 + m)`, where `m` is the number
of times `i ≤ n` with state `s` in `h`. Then for every initial state `s₀`, almost surely under
`M.trajLaw π s₀`, every pair `(s, a)` occurs at infinitely many times
(`ae_frequently_eq_of_explore`).

Singh–Jaakkola–Littman–Szepesvári, Appendix B, Lemma 4 (p. 302, proof pp. 302–303), with the
extended Borel–Cantelli lemma, Lemma 3 (p. 302), and the visit-count exploration of B.1–B.2
(pp. 303–304). Their "communicating" (p. 290) is reachability of every state from every other.
The statement here is proved with Lévy's conditional Borel–Cantelli lemma in Mathlib's form.

*Proof route.* Write `ω t = (s_t, a_t)`. Under `M.trajLaw π s₀`, given the history to time `n`
the state `s_{n+1}` has law `trans s_n a_n`, and given the history and `s_{n+1}` the action
`a_{n+1}` has law `π.next n (h, s_{n+1})` (MarkovDecisionProcesses 1.1, the description of the
trajectory law; it follows from Mathlib `ProbabilityTheory.Kernel.condDistrib_trajMeasure` and
the definition of `Kernel.compProd` in `trajLaw`). (1) *Actions.* Fix `(s, a)` and let `𝒢 n` be
generated by `ω 0, …, ω n` and `s_{n+1}`, and `E_n = {ω n = (s, a)}`, which is
`𝒢 n`-measurable. Then `P(E_{n+1} | 𝒢 n) ≥ 1{s_{n+1} = s} · c/(1 + m_n(s))`, and along the visits
to `s` after time `0` these terms are at least `c/2, c/3, …`; on the event that `s` is visited
infinitely often their sum diverges (Mathlib `Real.tendsto_sum_range_one_div_nat_succ_atTop`), and
Lévy's lemma (Mathlib `MeasureTheory.ae_mem_limsup_atTop_iff`) gives that `(s, a)` occurs infinitely
often, almost surely on that event. (2) *Transitions.* If `trans s a s' > 0`, then with `ℱ n`
generated by `ω 0, …, ω n` and `F_n = {s_n = s'}`,
`P(F_{n+1} | ℱ n) ≥ 1{ω n = (s, a)} trans s a s'`, so the same lemma gives that `s'` is visited
infinitely often, almost surely on the event that `(s, a)` occurs infinitely often. (3) On the
almost-sure event where (1) and (2) hold for all `s, a, s'` (finitely many), the set `W` of states
visited infinitely often is nonempty (`S` is finite) and contains `s'` whenever it contains `s`
and `trans s a s' > 0` for some `a`. If `(κ^n) x {y} > 0` for `κ = M.stationaryKernel π₀`, there is
a path `x = x_0, …, x_n = y` whose steps have `trans x_i a_i x_{i+1} > 0` for some `a_i` (induction
on `n`, as `κ x {z} = Σ_a π₀(a | x) trans x a z`). By irreducibility, `W = S`, and by (1) every pair
occurs infinitely often.

*Needs:* MarkovDecisionProcesses 1.1 (`MDP`, `HistoryPolicy`, `trajLaw`, `stationaryKernel`,
definitions, and the conditional laws of the trajectory); MarkovChainsAndRenewal (`Reaches`,
`IsIrreducible`, definitions); Mathlib `MeasureTheory.ae_mem_limsup_atTop_iff`,
`Real.tendsto_sum_range_one_div_nat_succ_atTop`,
`ProbabilityTheory.Kernel.condDistrib_trajMeasure`.

**Checks.**

- Communication cannot be dropped: two states, one action, `trans 0 = trans 1 = pure 1`. Every
  policy satisfies the bound with `c = 1`, and from `s₀ = 0` the state `0` is visited only at time
  `0`. Here no stationary policy has an irreducible state chain.
- `c > 0` cannot be dropped: one state, two actions, and the policy that always takes the first
  action; the bound holds with `c = 0` only, and the pair with the second action never occurs.
- One state and one action: `ω t = (s, a)` for every `t`.

*Consequence, not a target: tabular Q-learning along one trajectory.* Let `π` be as in 3.1, `Ω`
the path space with `M.trajLaw π s₀` and `ℱ t` generated by `ω 0, …, ω t`. Take the visit-count
steps `α t (s, a) = 1/n_t(s, a)` if `ω t = (s, a)` and `0` otherwise (`n_t(s, a)` the number of
`i ≤ t` with `ω i = (s, a)`), `snext t (s, a) = (ω (t+1)).1` and `rew t (s, a) = reward s a`.
MarkovDecisionProcesses 6.3 (`qLearning_ae_tendsto`) applies: `α` is adapted with values in
`[0, 1]`; `Σ_t α t (s, a) = ∞` almost surely, because by 3.1 the pair occurs infinitely often and
the steps at its visits are `1, 1/2, 1/3, …`; `Σ_t α t (s, a)² ≤ π²/6`; `snext` is
`ℱ (t+1)`-measurable and, on `{α t (s, a) ≠ 0} = {ω t = (s, a)}`, has conditional law
`trans s a` given `ℱ t` (the description of the trajectory law above); the rewards are constants,
so the mean and variance conditions hold with `C = rewardBound²`. Hence the Q-learning iterates
converge to `optimalQ` almost surely, with the step-size hypothesis of 6.3 supplied by 3.1 rather
than assumed. An `ε`-greedy policy with `ε = c/n_t(s)` with respect to the current iterate is a
history-dependent policy satisfying the bound of 3.1 with `c` replaced by `c/|A|`, for
`0 < c ≤ 1`.

### Examples

`ε`-greedy and Boltzmann exploration with visit-dependent parameters (Singh–Jaakkola–Littman–
Szepesvári, B.1–B.2), and the uniformly random policy, for which the bound holds with
`c = 1/|A|` without the visit count.

### Dependencies

MarkovDecisionProcesses 1.1 and 6.3; MarkovChainsAndRenewal (definitions); Mathlib martingale
theory.

## Layer 4: the softmax policy gradient

Layer 4 uses the objects of PolicyGradientMethods for an MDP with finitely many states and
actions: `softmax θ`, the value `policyValue γ π = (1 − γP^π)⁻¹ r^π`, `policyQ`, the visitation
vector `visitation γ μ π = (1 − γ) μ (1 − γP^π)⁻¹` and `objective γ μ π = Σ_s μ s V^π s`. The
parameter `θ` lives in `EuclideanSpace ℝ (S × A)`, read as the table `fun s a ↦ θ (s, a)`, so
that smoothness (FirstOrderOptimization's `LipschitzSmoothWith`) and gradients (Mathlib
`gradient`) refer to the Euclidean norm. The partial derivatives of the objective are
PolicyGradientMethods' `softmaxGrad` (3.1), so the squared norm of the gradient is
`Σ_i softmaxGrad γ μ θ i ²`.

### 4.1 Smoothness of the softmax value

For rewards in `[0, 1]`, `γ < 1` and a probability vector `μ` (`μ ≥ 0`, `Σ μ = 1`), the map
`θ ↦ V^{π_θ}(μ)` is `LipschitzSmoothWith ℝ (8/(1 − γ)³)`: differentiable, with
`|f θ' − f θ − Df θ (θ' − θ)| ≤ 4/(1 − γ)³ ‖θ' − θ‖²` (`lipschitzSmoothWith_objective_softmax`).

Mei–Xiao–Szepesvári–Schuurmans, Lemma 7 (p. 6; proof eqs. (175)–(257), pp. 22–27), with rewards
in `[0, 1]` (their Assumption 1, p. 2) and the two-sided definition (7) of smoothness (p. 3); they
note that Agarwal–Kakade–Lee–Mahajan also show that this objective is smooth.

*Proof route.* Fix `θ` and a unit direction `u`, and let `θ_x = θ + x u`. Per state, the softmax
row satisfies `|d/dx π_{θ_x}(· | s)ᵀ y| ≤ 2 ‖u‖ ‖y‖_∞` and
`|d²/dx² π_{θ_x}(· | s)ᵀ y| ≤ 6 ‖u‖² ‖y‖_∞`
(Mei, (177)–(188)); hence, for `P(x) = P^{π_{θ_x}}` and `r(x) = r^{π_{θ_x}}`,
`‖P'(x) y‖_∞ ≤ 2‖y‖_∞`, `‖P''(x) y‖_∞ ≤ 6‖y‖_∞`, `‖r(x)‖_∞ ≤ 1`, `‖r'(x)‖_∞ ≤ 1`,
`‖r''(x)‖_∞ ≤ 3` ((189)–(226); the range of `r(s, ·)` is at most `1`). With
`N(x) = (1 − γP(x))⁻¹`, whose `∞`-operator norm is at most `1/(1 − γ)` (it is `(1 − γ)⁻¹` times a
stochastic matrix), and `V(x) = N(x) r(x)` (MarkovDecisionProcesses 1.2, `value_eq_inverse`;
derivative of the inverse by Mathlib `hasFDerivAt_ringInverse`),

    V'' = 2γ² N P' N P' N r + γ N P'' N r + 2γ N P' N r' + N r'',

so `‖V''(x)‖_∞ ≤ 8γ²/(1 − γ)³ + 6γ/(1 − γ)² + 4γ/(1 − γ)² + 3/(1 − γ)`, and
`8γ² + 10γ(1 − γ) + 3(1 − γ)² = γ² + 4γ + 3 ≤ 8` gives `≤ 8/(1 − γ)³` ((227)–(249)). Averaging
against the probability vector `μ` keeps the bound, and Taylor's formula along the segment
(Mathlib `taylor_mean_remainder_lagrange`) gives the remainder bound with `K/2 = 4/(1 − γ)³`
((250)–(257)).

*Needs:* PolicyGradientMethods 1.1 and 3.1 (definitions; `fderiv_objective_softmax` for
differentiability); MarkovDecisionProcesses 1.2 (`value_eq_inverse`); FirstOrderOptimization
(`LipschitzSmoothWith`, definition); Mathlib `hasFDerivAt_ringInverse`,
`taylor_mean_remainder_lagrange`.

**Checks.**

- One action: `softmax θ = 1`, the objective is constant, and the remainder is `0`.
- One state, two actions, `γ = 0`, `r = (1, 0)`, `μ = 1`: the objective is `σ(θ_1 − θ_2)` with `σ`
  the logistic function; its second derivative along a unit `u` is `σ''(θ_1 − θ_2)(u_1 − u_2)²`,
  of absolute value at most `2 · √3/18 = 1/(3√3)`, well below `8` (Mei's Lemma 2 gives `5/2` for
  this one-state case).
- The probability normalization matters: replacing `μ` by `2μ` doubles the objective and its
  second derivatives, so the constant `8/(1 − γ)³` is for `Σ μ = 1`.

### 4.2 The rate of softmax policy gradient

Let rewards lie in `[0, 1]`, `γ < 1`, `μ` a probability vector with `μ s > 0` for all `s`, `ρ` a
probability vector, and `d : S → A` a deterministic policy greedy for its own Q-function:
`Q^d(s, a) ≤ V^d(s)` for all `s, a` (so `d` is optimal, MarkovDecisionProcesses 3.1). Let
`θ_t = gradientDescent f η θ_0 t` with `f θ = −V^{π_θ}(μ)` and `η = (1 − γ)³/8`, that is,
`θ_{t+1} = θ_t + η ∇_θ V^{π_θ}(μ)|_{θ_t}`, from any `θ_0`. For `t ≥ 1` let
`c_t = min_{i < t} min_s π_{θ_i}(d s | s) > 0`. Then (`objective_sub_le_softmaxAscent`)

    V^d(ρ) − V^{π_{θ_t}}(ρ) ≤ 16 |S| ‖d^d_μ / μ‖²_∞ ‖1/μ‖_∞ / (c_t² (1 − γ)⁶ t),

where `d^d_μ = visitation γ μ (detPolicy d)`.

Mei–Xiao–Szepesvári–Schuurmans, Theorem 4 (p. 6; proof eqs. (334)–(351), pp. 33–34), state this
with `c = inf_{t} min_s π_{θ_t}(a⋆(s) | s)`, which their Lemma 9 shows is positive. With `c_t`, the
minimum over the iterates before time `t`, the bound holds for every `t ≥ 1` without Lemma 9, and
theirs follows from it because `c ≤ c_t`. (Their iterates are indexed from `1`; here `θ_t` is the
iterate after `t` steps.) The form with `c_t` is proved here.

*Proof route.* Write `δ_t = V^d(μ) − V^{π_{θ_t}}(μ)`. (1) *Optimality gap is nonnegative and
transfers.* The performance difference identity (PolicyGradientMethods 1.1, which is
MarkovDecisionProcesses 3.3 `performanceDifference` summed against the initial vector) gives
`V^{π_θ}(ν) − V^d(ν) = (1 − γ)⁻¹ Σ_s d^{π_θ}_ν(s) Σ_a π_θ(a | s)(Q^d(s, a) − V^d(s))` for every
`ν ≥ 0`; each inner sum is `≤ 0` by the greedy hypothesis, so the gap is `≥ 0`. Since
`d^{π_θ}_ρ` is a probability vector (`P^{π_θ}` is stochastic, so `(1 − γ)(1 − γP^{π_θ})⁻¹` is a
stochastic matrix) and `d^{π_θ}_μ ≥ (1 − γ) μ` (PolicyGradientMethods 1.1),
`d^{π_θ}_ρ(s) ≤ 1 ≤ ‖1/μ‖_∞ μ(s) ≤ ‖1/μ‖_∞ d^{π_θ}_μ(s)/(1 − γ)`, and therefore
`V^d(ρ) − V^{π_θ}(ρ) ≤ ‖1/μ‖_∞ (1 − γ)⁻¹ (V^d(μ) − V^{π_θ}(μ))`. (2) *Descent.*
`f` is `K`-smooth with `K = 8/(1 − γ)³` by 4.1 (negation keeps the remainder bound) and `ηK = 1`;
the sufficient decrease of FirstOrderOptimization 1.1, `f(x − η∇f x) ≤ f x − η(1 − Kη/2)‖∇f x‖²`
(one line from the definition of `LipschitzSmoothWith` at `y = x − η∇f x`), gives
`δ_{i+1} ≤ δ_i − (η/2) ‖∇V(θ_i)‖²`. (3) *Łojasiewicz.* PolicyGradientMethods 3.2
(`lojasiewicz_softmax`) with `ρ := μ` and `C = ‖d^d_μ/μ‖_∞ / (1 − γ)`, whose hypothesis
`d^d_μ ≤ C d^{π_θ}_μ` follows from `d^{π_θ}_μ ≥ (1 − γ) μ`, gives
`min_s π_θ(d s | s) · δ ≤ √|S| C ‖∇V(θ)‖`. For `i < t` the minimum is at least `c_t`, so
`δ_{i+1} ≤ δ_i − κ δ_i²` with `κ = η c_t² (1 − γ)² / (2 |S| ‖d^d_μ/μ‖²_∞)`. (4) *Recursion.* If
some `δ_i = 0` then `δ_j = 0` for `j ≥ i` (the gap is `≥ 0` and nonincreasing). Otherwise
`1/δ_{i+1} − 1/δ_i = (δ_i − δ_{i+1})/(δ_i δ_{i+1}) ≥ κ δ_i / δ_{i+1} ≥ κ`, so
`δ_t ≤ 1/(κ t) = 16 |S| ‖d^d_μ/μ‖²_∞ / (c_t² (1 − γ)⁵ t)`. (5) Step (1) multiplies this by
`‖1/μ‖_∞/(1 − γ)`.

*Needs:* 4.1; FirstOrderOptimization 1.1 (sufficient decrease, with its proof above) and Layer 2
(`gradientStep`, `gradientDescent`, definitions); PolicyGradientMethods 1.1 (visitation bound and
performance difference identity), 3.1 (`softmaxGrad`) and 3.2 (`lojasiewicz_softmax`);
MarkovDecisionProcesses 3.3 (`performanceDifference`); Mathlib `gradient`.

**Checks.**

- One action: `V^d = V^{π_θ}`, the left side is `0`.
- `t = 0` is excluded: the minimum defining `c_t` is over an empty set, and the bound divides by
  `t`.
- `c_t` is nonincreasing in `t` and at most `1`; for `θ_0 = 0` it is at most `1/|A|`.
- `γ = 0` and one state: the objective is `π_θ ᵀ r`, `‖d^d_μ/μ‖_∞ = ‖1/μ‖_∞ = 1`, and the bound is
  `16/(c_t² t)`.

### Examples

The one-state bandit of the Checks of 4.1; the two-state chain of PolicyGradientMethods 1.1.

### Dependencies

PolicyGradientMethods 1.1, 3.1 and 3.2; FirstOrderOptimization (definitions, 1.1 and Layer 2);
MarkovDecisionProcesses 1.2, 3.1 and 3.3; Mathlib calculus.

## Scope and ownership

This roadmap is built on six others and restates none of their theorems. From
MarkovDecisionProcesses it takes the MDP, its trajectory law, the value of a policy and the
optimal Q-function, the performance difference lemma, and the almost-sure convergence of tabular
Q-learning (6.3), whose step-size hypothesis 3.1 derives from exploration. From
StochasticApproximationAveraging it takes positive stability and the asymptotic linear
representation of the averaged iterate (1.1, 2.1); from FirstOrderOptimization the Robbins–Siegmund
theorem (5.1), smoothness and gradient descent (Conventions, 1.1, Layer 2); from
PolicyGradientMethods the softmax objective, its gradient and the non-uniform Łojasiewicz
inequality (1.1, 3.1, 3.2). From MathematicalStatisticsAsymptotic, by another contributor, it uses
the multivariate central limit theorem (1.2), and from MarkovChainsAndRenewal, by another
contributor, irreducibility and the invariant probability of a finite irreducible chain (Layer 3).

Temporal differences with linear features, the subject of Layers 1 and 2, appear in the list
*Beyond this roadmap* of StatisticalLearningTheory, by another contributor (pull request
[#2515](https://github.com/TauCetiProject/TauCetiRoadmap/pull/2515)), in its item on bandits and
reinforcement learning. Layers 1 and 2 are one possible development of
that entry, offered alongside that roadmap's plan and not in place of it; it does not depend on
StatisticalLearningTheory and cites nothing from it.

Owned elsewhere and not restated: the Bellman operators and their sup-norm contraction, values,
`Q⋆`, the performance difference lemma, asynchronous stochastic approximation and tabular
Q-learning and TD(0) (MarkovDecisionProcesses 1–3 and 6); the Robbins–Siegmund theorem and the
descent lemma (FirstOrderOptimization 1.1 and 5.1); the Polyak–Juditsky lemma, the asymptotic
linear representation and the central limit theorem with independent additive noise
(StochasticApproximationAveraging 1.2, 2.1, 3.1); the policy gradient theorems, gradient domination,
the Łojasiewicz inequality and natural policy gradient (PolicyGradientMethods); the multivariate
central limit theorem (MathematicalStatisticsAsymptotic 1.2); irreducibility, recurrence and
invariant laws (MarkovChainsAndRenewal). The sup-norm contraction of `T_λ` with modulus `κ_λ`
follows in two lines from MarkovDecisionProcesses 1.2 and the geometric series, and is not a
target; linear TD is not treated here as an instance of MarkovDecisionProcesses 6.2, because
`Π_D T_λ` need not be a maximum-norm contraction (Tsitsiklis–Van Roy, p. 679).

Not treated here: linear TD along a single Markov trajectory (Tsitsiklis–Van Roy, Theorem 1,
through the ODE method) and with off-policy corrections; TD(λ) as a stochastic algorithm with
eligibility traces; limit covariances with constant steps; SARSA and actor–critic methods; sample
complexity and regret; the projected-gradient rate of the direct parametrization; nonlinear
function approximation; optimal stopping with linear features.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Analysis/Convex/Jensen.lean`: `ConvexOn.map_sum_le` (1.1).
- `Mathlib/Analysis/Normed/Ring/Units.lean` and `Mathlib/Analysis/Matrix/Normed.lean`:
  `NormedRing.inverse_one_sub`, `Matrix.linftyOpNormedRing` (Conventions, 1.1).
- `Submodule.starProjection` (1.1); `ContractingWith.fixedPoint_unique'` (1.1).
- `MeasureTheory.condExp_mul_of_stronglyMeasurable_left`
  (`Mathlib/MeasureTheory/Function/ConditionalExpectation/PullOut.lean`),
  `MeasureTheory.condExp_indep_eq` (`Mathlib/Probability/ConditionalExpectation.lean`; independent
  σ-algebras, strongly measurable integrand), `ProbabilityTheory.iIndepFun.indepFun_finset`
  (Layer 2).
- `MeasureTheory.TendstoInDistribution.continuous_comp`,
  `MeasureTheory.tendstoInDistribution_of_tendstoInMeasure_sub`
  (`Mathlib/MeasureTheory/Function/ConvergenceInDistribution.lean`), `Filter.Tendsto.cesaro`
  (2.3).
- `MeasureTheory.ae_mem_limsup_atTop_iff` (`Mathlib/Probability/Martingale/BorelCantelli.lean`:
  finite measure, `s n` measurable for `ℱ n`), `Real.tendsto_sum_range_one_div_nat_succ_atTop`,
  `ProbabilityTheory.Kernel.condDistrib_trajMeasure` (3.1).
- `hasFDerivAt_ringInverse`, `taylor_mean_remainder_lagrange`, `gradient` (Layer 4).

### From Tau Ceti

- `TauCeti/Probability/Moments/Covariance.lean`: `TauCeti.covMatrix` (2.3, statement) and
  `TauCeti.posSemidef_covMatrix` (2.3).
- `TauCeti/Probability/Distributions/Gaussian/Affine.lean`:
  `TauCeti.Probability.map_affine_multivariateGaussian` (positive semidefinite covariance; 2.3).
- `TauCeti/Probability/Kernel/PMF.lean`: `ProbabilityTheory.Kernel.ofPMF` and its Markov-kernel
  instance (in the copied `stationaryKernel`, `transKernel`).

### From TauCetiRoadmap.MarkovDecisionProcesses

- Definitions copied verbatim: `MDP`, `HistoryPolicy`, `MDP.transKernel`, `MDP.stationaryKernel`,
  `MDP.trajLaw` (Conventions, 1.1).
- 1.1, the description of the trajectory law (conditional laws of the next state and action), a
  README item proved there from `Kernel.condDistrib_trajMeasure`; used in 3.1 with that
  derivation.
- 1.2 `value_eq_inverse` (`[Fintype S]`, `γ < 1`): the value is `(1 − γP^π)⁻¹ r^π`; used in the
  Conventions and 4.1.
- 3.1 optimal deterministic policies and 3.3 `performanceDifference` (`γ < 1`); used in 4.2.
- 6.3 `qLearning_ae_tendsto` (`[Fintype S]`, `γ < 1`, the hypotheses listed there); used in the
  consequence of 3.1.

### From TauCetiRoadmap.MarkovChainsAndRenewal

- Definitions copied verbatim: `Reaches`, `IsIrreducible` (3.1).
- Layer 3 `existsUnique_invariant_probability` (`[Finite S]`, irreducible Markov kernel): used in
  the Conventions for a positive stationary `d`.

### From TauCetiRoadmap.MathematicalStatisticsAsymptotic

- 1.2 `tendstoInDistribution_inv_sqrt_smul_sum_sub_euclidean` (measurable, independent,
  identically distributed, `MemLp (X 0) 2`, limit law `multivariateGaussian 0 (covMatrix ...)`);
  used in 2.3.

### From TauCetiRoadmap.StochasticApproximationAveraging

- Definitions copied verbatim: `IsPositivelyStable` (1.1, used in 1.2) and `averagedIterate`
  (2.1, used in 2.3).
- 1.1 `IsAdmissibleStepSize` (its decreasing clause) and 2.1
  `tendstoInMeasure_sqrt_smul_averagedIterate_sub_add` (positively stable `A`, admissible steps,
  `x 0` a.e. strongly measurable, `ξ t` measurable for `ℱ (t+1)`, in `L²`, conditionally centred,
  `sup_t ∫ ‖ξ t‖² < ∞`, the averaged linearization condition); used in 2.3.

### From TauCetiRoadmap.FirstOrderOptimization

- Definitions copied verbatim: `LipschitzSmoothWith` (Conventions), `gradientStep`,
  `gradientDescent` (Layer 2); used in 4.1 and 4.2.
- 1.1 sufficient decrease (a README item; its one-line proof is in 4.2).
- 5.1 `ae_tendsto_of_robbinsSiegmund`, `ae_summable_of_robbinsSiegmund` (nonnegative adapted
  `V`, `a`, `β`, `ζ`, integrable `V n`, the conditional recursion); used in 2.1.

### From TauCetiRoadmap.PolicyGradientMethods

- Definitions copied verbatim: `softmax` (3.1), `detPolicy` (3.2), `MDP.transMatrix`,
  `MDP.meanReward`, `MDP.policyValue`, `MDP.policyQ`, `MDP.visitation`, `MDP.objective` (1.1).
- 1.1 the facts at policies (visitation `≥ (1 − γ) μ` for `μ ≥ 0`, the performance difference
  identity), derived there from MarkovDecisionProcesses 3.3; used in 4.2.
- 3.1 `fderiv_objective_softmax` and `softmaxGrad` (used in 4.1 and 4.2), 3.2
  `lojasiewicz_softmax` (`[Nonempty S]`, `γ < 1`, `0 ≤ μ`, `0 ≤ ρ`, the visitation comparison
  with constant `C`); used in 4.2.

## References

- J. N. Tsitsiklis and B. Van Roy, *An analysis of temporal-difference learning with function
  approximation*, IEEE Trans. Automat. Control 42 (1997), 674–690 (author's PDF): Assumptions 1–4,
  Theorem 1 and footnote 1, p. 679; Lemma 1, p. 680; Lemmas 4–6, p. 681; Lemma 9 and Theorem 2,
  p. 683; Section IX and Theorem 3, p. 686.
- J. Bhandari, D. Russo and R. Singal, *A finite time analysis of temporal difference learning
  with linear function approximation*, arXiv:1806.02450v1 (2018): normalization p. 5, Lemma 3
  p. 10, Theorem 2 and (15) p. 14, (16) p. 15.
- S. Singh, T. Jaakkola, M. L. Littman and C. Szepesvári, *Convergence results for single-step
  on-policy reinforcement-learning algorithms*, Machine Learning 38 (2000), 287–308 (author's
  PDF, whose header prints volume 39): "communicating", p. 290; Appendix B, Lemmas 3 and 4,
  pp. 302–303; B.1–B.2, pp. 303–304.
- J. Mei, C. Xiao, C. Szepesvári and D. Schuurmans, *On the global convergence rates of softmax
  policy gradient methods*, ICML 2020, arXiv:2005.06392v3: Assumption 1, p. 2; definition (7),
  p. 3; Lemma 7 and Theorem 4, p. 6; proof of Lemma 7, (175)–(257), pp. 22–27; proof of Theorem 4,
  (334)–(351), pp. 33–34.
- B. T. Polyak and A. B. Juditsky, *Acceleration of stochastic approximation by averaging*,
  SIAM J. Control Optim. 30 (1992), 838–855: attributed in prose, not consulted.
- S. J. Bradtke and A. G. Barto, *Linear least-squares algorithms for temporal difference
  learning*, Machine Learning 22 (1996), 33–57: attributed in prose, not consulted.
- A. Agarwal, S. M. Kakade, J. D. Lee and G. Mahajan, *On the theory of policy gradient methods:
  optimality, approximation, and distribution shift*, J. Mach. Learn. Res. 22 (2021): cited by Mei
  et al. for the smoothness of the softmax objective, not consulted.

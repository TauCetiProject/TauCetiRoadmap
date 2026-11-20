# Roadmap: mixing of finite Markov chains

**Summary.** This roadmap develops the quantitative theory of convergence to equilibrium for
Markov chains on a finite state space. A chain is a Markov kernel `κ` on a finite set, and `π` is
a probability measure on it, stationary where a statement says so. Distance is total variation,
normalized to lie in `[0, 1]`; the distance to stationarity is `d(t) = max_x ‖κ^t(x, ·) − π‖`, and
the mixing time `t_mix(ε)` is the first `t` with `d(t) ≤ ε`. The roadmap bounds these quantities
by four methods (the spectrum, bottlenecks, couplings and strong stationary times) and applies
them to random walks, a card shuffle and the samplers of Markov chain Monte Carlo.

Headline theorems:

- **Relaxation time.** Let `κ` be irreducible and reversible with respect to `π`, let `λ⋆ < 1` be
  the largest modulus of an eigenvalue other than `1`, and `t_rel = 1/(1 − λ⋆)`. Then, for every
  `ε > 0`,
  `(t_rel − 1) log(1/(2ε)) ≤ t_mix(ε) ≤ ⌈t_rel (½ log(1/π_min) + log(1/(2ε)))⌉`, where `π_min`
  is the least stationary mass of a state.
- **Cheeger's inequality.** For a stationary `π`, let `γ` be the least value of
  `E(f)/Var_π(f)` over the functions `f` of nonzero variance, where `E` is the Dirichlet form,
  and let `Φ⋆` be the least ratio `Q(A, Aᶜ)/π(A)` over the sets with `0 < π(A) ≤ 1/2`; both are
  read as `0` when `π` is a point mass. Then `Φ⋆²/2 ≤ γ ≤ 2Φ⋆`, and `t_mix(1/4) ≥ 1/(4Φ⋆)`.
  The chain need not be reversible or irreducible.
- **Path coupling.** Let the state space carry a metric with distinct points at distance at
  least `1`, and let `E` be a set of pairs such that every other pair of distinct points has a
  third point on a geodesic between them. If the transportation distance between `κ(x, ·)` and
  `κ(y, ·)` is at most `c · dist(x, y)` for the pairs of `E`, then `d(t) ≤ c^t · diam` for
  every stationary `π`.
- **Strong stationary times.** If `π` is stationary and positive and `τ` is a strong stationary
  time for the chain started at `x`, then `1 − κ^t(x, y)/π(y) ≤ P(τ > t)` for every state `y`.

The roadmap builds on Mathlib's kernels, total variation distance and Hermitian spectral theorem,
and on Tau Ceti's Markov chain path laws, kernel–matrix dictionary, couplings and Wasserstein
distances. MarkovChainsAndRenewal supplies the qualitative theory (stationary laws, periods,
convergence without a rate, occupation frequencies); MathematicalStatisticsFoundations supplies
the Metropolis–Hastings kernel, to which the bounds here apply.

Layer 1 defines the distances and the mixing time. Layer 2 is the spectral theory, Layer 3 the
bottleneck ratio, Layer 4 couplings and path coupling, Layer 5 separation distance and strong
stationary times, and Layer 6 the samplers: Glauber dynamics, the ergodic theorem and the error
of time averages.

## How to read the build

Layers 2, 4 and 5 each use Layer 1 only. Layer 3 uses Layer 1 and the transition matrix,
Dirichlet form and spectral gap of 2.1 and 2.4. Layer 6 uses 1.3, 2.1, 2.4 and 4.2. Each numbered
target ends with a *Needs:* line naming the targets and suppliers that its statement and its
route use; every claim carries a source locator in parentheses or says that it is proved here.
`LPW` is the book of Levin and Peres listed under References. `Suggested.lean` states the headline theorems of each layer.

## Conventions

- **State spaces.** `S` is a finite type with a σ-algebra in which singletons are measurable
  (`[Fintype S] [MeasurableSpace S] [MeasurableSingletonClass S]`), so every set is measurable.
  Finiteness is the setting of the source; two statements (1.1 and the first of 4.1) do not use
  it and are stated for countable `S`. `[Nonempty S]` is assumed where a maximum over states is
  taken, and `[DecidableEq S]` where matrix products on `S` occur.
- **Chains.** A chain is a kernel `κ : Kernel S S` with `[IsMarkovKernel κ]`; `κ ^ t` is its
  `t`-step kernel and `κ^t(x, y)` abbreviates `((κ ^ t) x).real {y}`. Laws are measures, and `π`
  is a probability measure on `S`. Stationarity is Mathlib's `κ.Invariant π` and reversibility is
  `κ.IsReversible π`. Irreducibility is Mathlib's `Kernel.IsIrreducible Measure.count κ` (every
  state reaches every state in some number `n ≥ 0` of steps, so a chain on one state is
  irreducible) and aperiodicity is Tau Ceti's `κ.IsAperiodic` (every state has period `1`).
  `π_min` is the least of the numbers `π.real {x}`. That `κ` is Markov and `π` a probability
  measure is the standing setting of every statement, except where a statement says "every
  measure `π`".
- **Total variation.** Mathlib's `tvDist μ ν` is the total variation norm of `μ − ν` and takes
  values in `[0, 2]` on probability measures. The distance `‖μ − ν‖ = max_A |μ A − ν A|` of the
  source is `tvDist μ ν / 2`, and every statement is written with that expression.
- **Mixing times** take values in `ℕ∞`, with `⊤` for a chain that never comes within `ε`. A real
  lower bound `r ≤ t_mix(ε)` is written `⌈r⌉₊ ≤ t_mix(ε)`, which is the same assertion.
- **Matrices and functions.** `P` is the real matrix `P x y = κ^1(x, y)` of 2.1, acting on
  functions `f : S → ℝ` by `(P f) x = Σ_y P x y · f y`. `E_π f = ∫ f ∂π`, `Var_π f` is Mathlib's
  `Var[f; π]`, and `⟨f, g⟩_π = Σ_x f x · g x · π.real {x}`.
- **Junk values.** Real division by zero is `0`, and an infimum or supremum of an empty set of
  reals is `0`. Each definition says what this gives in its degenerate cases, and each statement
  either holds there or carries the hypothesis that excludes them.
- **Path laws.** The law of the chain with initial law `ν` is Tau Ceti's `markovChainLaw ν κ` on
  `ℕ → S`.

## Layer 1: distance to stationarity and mixing times

### 1.1 Total variation and couplings

Let `μ`, `ν` be probability measures on a countable type with measurable singletons. A coupling of
them is a measure `γ` on the product with `TauCeti.IsCoupling γ μ ν`. Prove that every coupling
has `tvDist μ ν / 2 ≤ γ {z | z.1 ≠ z.2}`, and that some coupling attains equality, so that
`tvDist μ ν / 2` is the least value of the probability of disagreement over all couplings
(`isLeast_measureReal_ne_of_isCoupling`). The optimal coupling puts mass `min (μ {x}) (ν {x})` at
`(x, x)` and distributes the rest as a normalized product of the two excesses. (LPW,
Proposition 4.7 and Remark 4.8, for finite sets; the countable case has the same proof.)

**Checks.**

- `μ = ν`: the least value is `0`, attained by the diagonal coupling; the independent coupling of
  two fair coins has disagreement probability `1/2`, so it is not optimal.
- Two distinct point masses have one coupling, with disagreement probability `1 = 2/2`; with the
  unnormalized `tvDist` the statement would read `1 = 2`.

*Needs:* Mathlib `tvDist`; Tau Ceti `IsCoupling`; MarkovChainsAndRenewal 3.5.

### 1.2 The distances `d` and `d̄`

Define `tvToStationary κ π t` as the maximum over `x` of `tvDist ((κ ^ t) x) π / 2` (the
`d(t)` of the Summary), and `tvBetweenStarts κ t` as the maximum over pairs `(x, y)` of
`tvDist ((κ ^ t) x) ((κ ^ t) y) / 2` (written `d̄(t)`). Prove:

- both lie in `[0, 1]`, `d̄(t)` is the supremum of the distance between `κ^t ∘ μ` and `κ^t ∘ ν`
  over probability measures `μ`, `ν`, and `d(t)` is the supremum of the distance between
  `κ^t ∘ μ` and `π` (LPW, Exercise 4.1);
- `d` and `d̄` are nonincreasing in `t`, for every measure `π` (stationary or not, a probability
  measure or not), because each row of `κ^(t+1)` is a convex combination of rows of `κ^t` (LPW,
  Exercise 4.2);
- `d̄(t) ≤ 2 d(t)`, by the triangle inequality through `π`, and, if `π` is stationary,
  `d(t) ≤ d̄(t)` (`tvToStationary_le_tvBetweenStarts`) (LPW, Lemma 4.10);
- `d̄(s + t) ≤ d̄(s) d̄(t)` (`tvBetweenStarts_add_le`) (LPW, Lemma 4.11), from the optimal
  coupling of 1.1;
- if `π` is stationary, `d(s + t) ≤ d(s) d̄(t)` (`tvToStationary_add_le`) (LPW, Exercise 4.3).

**Checks.**

- `d(0) = 1 − π_min` and `d̄(0) = 1` on at least two states; on one state both vanish.
- The two-state chain with `κ(a, b) = p`, `κ(b, a) = q`, `p + q > 0`: `π = (q, p)/(p + q)`,
  `d(t) = max(p, q)/(p + q) · |1 − p − q|^t` and `d̄(t) = |1 − p − q|^t`. For `p = 3/10`,
  `q = 1/10`: `d(1) = 9/20` and `d̄(1) = 3/5`.
- The chain that exchanges two states: `d(t) = 1/2` and `d̄(t) = 1` for all `t`; `d` does not
  tend to `0`.
- Stationarity is needed: for the kernel sending both of two states to `b` and `π` the point
  mass at `a`, `d(1) = 1` and `d̄(1) = 0`.

*Needs:* 1.1; Mathlib `tvDist`, `tvDist_triangle`, `Kernel.Invariant`.

### 1.3 Mixing time

Define `mixingTime κ π ε : ℕ∞` as the infimum of the `t : ℕ` with `d(t) ≤ ε`. Prove:

- for every measure `π`, `mixingTime κ π ε ≤ t` exactly when `d(t) ≤ ε` (`mixingTime_le_iff`),
  by the monotonicity of 1.2; the mixing time is antitone in `ε`, and for a probability measure
  `π` it is `0` for `ε ≥ 1` and `⊤` for `ε < 0`;
- for a stationary `π`, `d(k t) ≤ (2 d(t))^k`, and for `ε > 0`,
  `t_mix(ε) ≤ ⌈log₂ ε⁻¹⌉ · t_mix(1/4)` in `ℕ∞` (`mixingTime_le_ceil_logb_mul`) (LPW, (4.32)
  to (4.34)).

**Checks.**

- The exchange chain: `t_mix(ε) = ⊤` for `ε < 1/2` and `0` for `ε ≥ 1/2`; a natural-number
  infimum would give `0` in both cases.
- The two-state chain with `p = 3/10`, `q = 1/10`: `d(t) = (3/4)(3/5)^t`, so `t_mix(1/4) = 3`.
- `ε = 0` is excluded from the last bound: there `⌈log₂ ε⁻¹⌉ = 0`, while `t_mix(0) = ⊤` for the
  chain of the previous Check.
- Stationarity is needed in the last bound: for the kernel sending both of two states to `a` and
  `π = (19/25, 6/25)`, `d(t) = 6/25` for `t ≥ 1`, so `t_mix(1/4) = 1` and `t_mix(1/10) = ⊤`.

*Needs:* 1.2.

### Examples

The two-state chain, with all quantities in closed form; the lazy walk on the `n`-cycle of 4.3,
for which `t_mix(1/4)` is `1, 3, 4, 5, 6` for `n = 4, …, 8`.

### Dependencies

Layer 1 uses Mathlib's `tvDist`, Tau Ceti's `IsCoupling` and MarkovChainsAndRenewal 3.5.

## Layer 2: spectral theory

### 2.1 The transition matrix and its spectral decomposition

Define `transitionMatrix κ : Matrix S S ℝ` as the real coercion of Tau Ceti's `κ.toMatrix`.
Prove:

- its entries are `κ^1(x, y)`, it is row-stochastic, `transitionMatrix (κ ^ t)` is its `t`-th
  power, and it is `Matrix.IsPrimitive` exactly when `κ` is irreducible and aperiodic;
- (not a target here: by MarkovChainsAndRenewal 3.1, `κ.Invariant π` reads
  `Σ_x π.real {x} · P x y = π.real {y}` for all `y`, and `κ.IsReversible π` reads
  `π.real {x} · P x y = π.real {y} · P y x` for all `x`, `y`; these forms are used throughout;)
- if `κ` is reversible for `π`, the matrix `A x y = √(π x) · P x y / √(π y)` is symmetric, also
  where `π` has zeros, and `⟨P f, g⟩_π = ⟨f, P g⟩_π`;
- **spectral decomposition** (`exists_orthonormal_eigenbasis`): if `κ` is reversible for `π` and
  `π {x} > 0` for all `x`, there are `l : S → ℝ` and `f : S → S → ℝ` with every `l j` in
  `[−1, 1]`, `⟨f i, f j⟩_π = 1` if `i = j` and `0` otherwise, `P (f j) = l j • f j`, and
  `κ^t(x, y) = π.real {y} · Σ_j (l j)^t · f j x · f j y` for all `t`, `x`, `y`. One of the
  `f j` may be taken constant with `l j = 1`.

The route applies Mathlib's spectral theorem to `A` and sets `f j = φ_j / √π`. (LPW, Lemma 12.2
and its proof.)

**Checks.**

- The two-state chain: `l = (1, 1 − p − q)`, `f₁ = 1`, `f₂ = (√(p/q), −√(q/p))`, and the
  decomposition at `t = 1`, `x = y = a` reads `1 − p = q/(p + q) · (1 + (1 − p − q) p/q)`.
- At `t = 0` the decomposition is the completeness relation `Σ_j f j x · f j y = [x = y]/π(y)`;
  a basis orthonormal for the unweighted inner product fails it unless `π` is uniform.
- Positivity is needed: if `π {x} = 0` for some `x`, the form `⟨·, ·⟩_π` is degenerate and has no
  orthonormal family of `|S|` functions.

*Needs:* Tau Ceti `Kernel.toMatrix`, `Kernel.toMatrix_pow`, `Kernel.toMatrix_mem_rowStochastic`;
Mathlib `Matrix.IsHermitian.eigenvalues`, `Matrix.IsHermitian.eigenvectorBasis`,
`Matrix.IsHermitian.mulVec_eigenvectorBasis`, `Matrix.IsPrimitive`; MarkovChainsAndRenewal 3.1.

### 2.2 The absolute spectral gap

Define `absSpectralGap κ = 1 − λ⋆`, where `λ⋆` is the supremum of `‖z‖` over the complex
eigenvalues `z ≠ 1` of `P` (the spectrum of the complexified matrix), and `λ⋆ = 0` if there is
none. The **relaxation time** is `t_rel = (absSpectralGap κ)⁻¹`. Prove:

- every complex eigenvalue of `P` has modulus at most `1`, so `0 ≤ γ⋆ ≤ 1` (LPW, Lemma 12.1(i));
- an eigenfunction for an eigenvalue other than `1` has `π`-mean `0` for every stationary `π`
  (LPW, Lemma 12.3);
- for irreducible `κ`, `0 < absSpectralGap κ` exactly when `κ` is aperiodic
  (`absSpectralGap_pos_iff`): an aperiodic irreducible chain has a power with positive entries,
  which leaves no eigenvalue of modulus `1` other than `1`, and a chain of period `m ≥ 2` has the
  eigenvalue `exp(2πi/m)` (LPW, Lemma 12.1 and Exercise 12.1(c); the source does not state
  the equivalence with `γ⋆ > 0`, which is assembled here from these);
- for `κ` irreducible and reversible for `π`,
  `Var_π(P^t f) ≤ (1 − γ⋆)^(2t) Var_π(f)` (`variance_pow_mulVec_le`), with equality for an
  eigenfunction of an eigenvalue of modulus `λ⋆` (LPW, (12.8) and Exercise 12.4).

**Checks.**

- One state: the only eigenvalue is `1`, so `λ⋆ = 0`, `γ⋆ = 1` and `t_rel = 1`.
- The two-state chain: `γ⋆ = 1 − |1 − p − q|`; the exchange chain has `γ⋆ = 0`, and its
  relaxation time is the junk value `0`, which is why 2.3 assumes `γ⋆ > 0`.
- The identity kernel on two states is reducible and has `λ⋆ = 0`, `γ⋆ = 1`, although no function
  is contracted: irreducibility is needed in the variance bound.
- Reversibility is needed in the variance bound: for the kernel on `{a, b, c}` with rows
  `(0, 1, 0)`, `(1/2, 0, 1/2)`, `(1/2, 0, 1/2)`, uniform `π` and eigenvalues `1, 0, −1/2`, the
  function `f = (1, −1, 0)` has `Var_π(f) = 2/3` and `Var_π(P f) = 1/2 > (1/2)² · 2/3`.

*Needs:* 2.1; Mathlib `spectrum`; Tau Ceti `Kernel.IsAperiodic`,
`Kernel.IsAperiodic.eventually_pos_pow_apply_singleton`, `Kernel.period`.

### 2.3 Mixing bounds from the spectrum

Prove:

- for a stationary `π` and a complex eigenvalue `z ≠ 1` of `P`, `‖z‖^t ≤ 2 d(t)` for all `t`
  (`norm_pow_le_two_mul_tvToStationary`) (LPW, (12.15));
- **lower bound:** for a stationary `π` and `γ⋆ > 0`,
  `⌈(t_rel − 1) log(1/(2ε))⌉₊ ≤ t_mix(ε)` for every real `ε`
  (`ceil_le_mixingTime_of_absSpectralGap`) (LPW, Theorem 12.5, stated there for irreducible
  aperiodic chains; its proof uses the previous item and so stationarity only);
- for `κ` irreducible and reversible for `π`,
  `|κ^t(x, y)/π(y) − 1| ≤ (1 − γ⋆)^t / √(π(x) π(y))` and
  `d(t) ≤ (1 − γ⋆)^t / (2 √π_min)` (`tvToStationary_le_pow_absSpectralGap`) (LPW, (12.13) and
  the last display of the proof of Theorem 12.4);
- **upper bound:** if moreover `γ⋆ > 0` and `ε > 0`, then
  `t_mix(ε) ≤ ⌈t_rel (½ log(1/π_min) + log(1/(2ε)))⌉₊` (`mixingTime_le_of_absSpectralGap`),
  and on at least two states and for `ε ≤ 1` the right side is at most
  `t_rel log(1/(ε π_min))` (LPW, Theorem 12.4);
- for `κ` reversible for `π` with `π {x} > 0` for all `x`,
  `(tvDist ((κ ^ t) x) π)² ≤ κ^(2t)(x, x)/π(x) − 1` (`tvDist_sq_le_of_isReversible`), the right
  side being `Σ_j (l j)^(2t) (f j x)²` over the nonconstant eigenfunctions of 2.1 (LPW,
  Lemma 12.18(i));
- for `κ` irreducible and `π` stationary, `d(t)^(1/t) → λ⋆` as `t → ∞`
  (`tendsto_tvToStationary_rpow`). With `Π` the matrix whose rows are `π`,
  `(P − Π)^t = P^t − Π` for `t ≥ 1`, `d(t)` is a norm of this matrix, and the spectral radius of
  `P − Π` is `λ⋆` because `1` is a simple eigenvalue of `P`; Gelfand's formula gives the limit.
  (LPW, Corollary 12.7, for reversible aperiodic chains; the general statement is proved here.)

**Checks.**

- The two-state chain with `p = 3/10`, `q = 1/10`: `λ⋆ = 3/5`, `t_rel = 5/2`, `π_min = 1/4`,
  and at `ε = 1/4` the bounds read `⌈(3/2) log 2⌉ = 2 ≤ t_mix(1/4) = 3 ≤ ⌈(5/2)(log 2 + log 2)⌉ = 4`;
  the bound on `d(t)` is `(3/5)^t ≥ (3/4)(3/5)^t`.
- `γ⋆ > 0` is needed in the lower bound: for the exchange chain and `ε = 9/10` the junk value
  `t_rel = 0` gives `⌈log(9/5)⌉ = 1`, while `t_mix(9/10) = 0`.
- Reversibility is needed in the bound on `d(t)`: the kernel with rows `(1/2, 0, 1/2)`,
  `(1/2, 1/2, 0)`, `(1/2, 1/2, 0)` is irreducible with `π = (1/2, 1/4, 1/4)` and eigenvalues
  `1, 0, 0`, so `λ⋆ = 0`, and `d(1) = 1/4`.
- Irreducibility is needed in the limit: the identity kernel on two states has `d(t) = 1/2` and
  `λ⋆ = 0`.
- Positivity is needed in the squared bound: if `π {x} = 0` its right side is `−1`.

*Needs:* 1.2, 1.3, 2.1, 2.2; for the limit, Mathlib
`spectrum.pow_norm_pow_one_div_tendsto_nhds_spectralRadius`; MarkovChainsAndRenewal 3.2 (an
irreducible chain on a finite set has a unique stationary law, and it is positive).

### 2.4 The Dirichlet form and the spectral gap

Define `dirichletForm κ π f = ½ Σ_{x,y} (f x − f y)² · π.real {x} · κ^1(x, y)` and
`spectralGap κ π` as the infimum of `dirichletForm κ π f / Var_π f` over the `f` with
`Var_π f ≠ 0` (written `γ`; it is `0` when `π` is a point mass). Define `lazyKernel κ`, the kernel
with rows `½ δ_x + ½ κ x`. Prove:

- for a stationary `π`, `dirichletForm κ π f = ⟨f, f⟩_π − ⟨f, P f⟩_π` (LPW, Lemma 13.6, where
  reversibility is assumed and stationarity is what the proof uses);
- **Poincaré inequality:** `γ · Var_π f ≤ dirichletForm κ π f` for every `f`, and the infimum is
  attained when some `f` has `Var_π f ≠ 0`;
- for `κ` irreducible and reversible for `π` on a type with at least two elements, `1 − γ` is
  the greatest real eigenvalue of `P` other than `1` (`isGreatest_spectrum_diff_one`) (LPW,
  Lemma 13.7 and Remark 13.8);
- `spectralGap (lazyKernel κ) π = γ / 2`, and under the hypotheses of the previous item
  `absSpectralGap (lazyKernel κ) = γ / 2` (`absSpectralGap_lazyKernel`), because the eigenvalues
  `(1 + l j)/2` of the lazy chain are nonnegative (LPW, Exercise 12.3);
- **comparison** (`spectralGap_le_of_dirichletForm_le`): let `π` be stationary for `κ`, let `π'`
  be a probability measure with `π' {x} > 0` for all `x`, and `κ'` a Markov kernel. If
  `dirichletForm κ' π' f ≤ a · dirichletForm κ π f` for all `f`, then
  `spectralGap κ' π' ≤ max_x (π(x)/π'(x)) · a · spectralGap κ π` (LPW, Lemma 13.18, for
  reversible chains; the proof there does not use reversibility). Stationarity of `π` enters
  only when `π` is a point mass: then `γ` is the junk value `0`, and the Dirichlet form of `κ`
  vanishes because the atom is absorbing.

**Checks.**

- The two-state chain: `γ = p + q`. The lazy walk on the `n`-cycle (4.3, `p = 1/2`) has
  `γ = (1 − cos(2π/n))/2`: `1/2` for `n = 4` and `1/4` for `n = 6`. The lazy walk on the
  hypercube (5.3) has `γ = γ⋆ = 1/n`.
- One state: no function has nonzero variance, `γ = 0` and `γ⋆ = 1`; this is why the two
  spectral statements assume at least two states.
- The identity kernel on two states with uniform `π` is reversible with `γ = 0`, while the set of
  eigenvalues other than `1` is empty: irreducibility is needed.
- Reversibility is needed: the walk on the `6`-cycle that stays with probability `1/2`, steps
  `+1` with probability `9/20` and `−1` with probability `1/20` has `γ = 1/4`, and its only real
  eigenvalue other than `1` is `0`.
- Stationarity is needed in the comparison: on two states `u`, `v` let `π` be the point mass at
  `u`, `κ` the kernel sending both states to `v`, `π'` uniform and `κ'` the kernel with both
  rows uniform. Then `dirichletForm κ π f = ½ (f u − f v)²` and
  `dirichletForm κ' π' f = ¼ (f u − f v)²`, so the hypothesis holds with the constant `1/2`,
  while `spectralGap κ' π' = 1` and `spectralGap κ π = 0`.

*Needs:* 2.1, 2.2; for the eigenvalue characterization, Tau Ceti
`LinearMap.IsSymmetric.eigenvalues_eq_iSup_iInf_re_inner` or the decomposition of 2.1; Mathlib
`variance`.

### Examples

The two-state chain; the lazy walk on the cycle `ZMod n`, with eigenvalues
`(1 + cos(2πk/n))/2`; the lazy walk on the hypercube, with eigenvalues `1 − k/n`.

### Dependencies

Layer 2 uses Layer 1, Mathlib's spectral theory of Hermitian matrices and Gelfand's formula, Tau
Ceti's kernel–matrix dictionary, period and Courant–Fischer formula, and MarkovChainsAndRenewal
3.1 and 3.2.

## Layer 3: the bottleneck ratio

### 3.1 Bottlenecks slow mixing

For `A : Set S` define the edge measure `Q(A, B) = ∫ x in A, κ x B ∂π`, the ratio
`bottleneckRatioOf κ π A = Q(A, Aᶜ) / π(A)`, and `bottleneckRatio κ π` (written `Φ⋆`) as the
infimum of `bottleneckRatioOf κ π A` over the sets with `0 < π(A) ≤ 1/2`; it is `0` when there is
no such set, which happens exactly when `π` is a point mass. Prove, for a stationary `π`:

- `Q(A, Aᶜ) = Q(Aᶜ, A)`, and `Φ(A) ≤ 1`;
- for every `A` with `π(A) > 0` and every `t`, `d(t) ≥ 1 − t Φ(A) − π(A)`
  (`le_tvToStationary_of_bottleneckRatioOf`) (LPW, (7.10) and the display after it);
- `⌈1/(4Φ⋆)⌉₊ ≤ t_mix(1/4)` (`ceil_le_mixingTime_of_bottleneckRatio`) (LPW, Theorem 7.4, stated
  there for irreducible aperiodic chains; the proof uses stationarity only).

**Checks.**

- The two-state chain with `p = 3/10`, `q = 1/10`: the only admissible set is `{a}`, with
  `Φ = p = 3/10`, and the bound reads `⌈5/6⌉ = 1 ≤ 3`.
- The lazy walk on the `n`-cycle, `n` even: an arc of `n/2` points has `Φ = 1/(2n)·2 = 1/n`, and
  `Φ⋆ = 1/n` (`1/4` for `n = 4`, `1/6` for `n = 6`).
- The identity kernel on two states: `Φ⋆ = 0`, the bound is `0 ≤ t_mix(1/4) = ⊤`.
- `π(A) > 0` is needed: for `A = ∅` the junk ratio is `0` and the inequality would read
  `1 ≤ d(t)`.

*Needs:* 1.2, 1.3; Mathlib `Kernel.Invariant`.

### 3.2 Cheeger's inequality

Prove, for a stationary `π`:

    Φ⋆² / 2 ≤ γ ≤ 2 Φ⋆

(`cheeger`), with `γ` the spectral gap of 2.4. The upper bound tests the Dirichlet form on the
indicator of `A`, for which `E(1_A) = Q(A, Aᶜ)` and `Var_π(1_A) = π(A)(1 − π(A))`. For the lower
bound, the matrix `P̂ x y = π(y) P y x / π(x)` on the support of `π` is stochastic with stationary
law `π`, and `(P + P̂)/2` is reversible for `π` with the same Dirichlet form and the same
`Q(A, Aᶜ)` as `P`; so the reversible case suffices, and there the bound follows from the
eigenfunction of `1 − γ` by the co-area argument of the source. (LPW, Theorem 13.10 and
Lemma 13.13, for reversible chains; the reduction is proved here.)

**Checks.**

- The lazy walk on the hypercube of dimension `2`: `Φ⋆ = 1/4` and `γ = 1/2`, so the upper bound
  is an equality and the lower bound reads `1/32 ≤ 1/2`.
- The lazy walk on the `6`-cycle: `Φ⋆ = 1/6`, `γ = 1/4`, and `1/72 ≤ 1/4 ≤ 1/3`.
- The biased walk of the last Check of 2.4 is not reversible and has the same `Φ⋆ = 1/6` and
  `γ = 1/4` as the unbiased one.
- One state: both `Φ⋆` and `γ` are the junk value `0`, and the statement reads `0 ≤ 0 ≤ 0`.

*Needs:* 2.1, 2.4, 3.1.

### Examples

The lazy walk on the `n`-cycle with `n` even has `Φ⋆ = 1/n`, so 3.1 gives `t_mix(1/4) ≥ n/4`
and 3.2 gives `1/(2n²) ≤ γ ≤ 2/n`; the true gap `(1 − cos(2π/n))/2` is of the order of the lower
bound.

### Dependencies

Layer 3 uses Layer 1 and 2.1, 2.4.

## Layer 4: couplings

### 4.1 Markovian couplings

For a kernel `K` on `S × S`, define `IsMarkovCoupling κ K` to mean that `K (x, y)` is a coupling
of `κ x` and `κ y` for every pair. Prove, for a Markov kernel `κ` and a kernel `K` with
`IsMarkovCoupling κ K` (every row of `K` is then a probability measure):

- `(K ^ t) (x, y)` is a coupling of `(κ ^ t) x` and `(κ ^ t) y`, on a countable `S`;
- **coupling inequality** (`tvDist_pow_le_of_isMarkovCoupling`), on a countable `S`:
  `tvDist ((κ ^ t) x) ((κ ^ t) y) / 2 ≤ (K ^ t) (x, y) {z | z.1 ≠ z.2}` (LPW, Theorem 5.4 through
  (5.5));
- for a stationary `π` on a finite `S`, `d(t)` is at most the maximum over pairs of the right
  side (`tvToStationary_le_of_isMarkovCoupling`) (LPW, Corollary 5.5);
- the independent coupling `κ ∥ₖ κ` and the coupling that moves both coordinates together from
  the diagonal are Markovian couplings, and a Markovian coupling may be modified to stay on the
  diagonal once there (LPW, (5.2)).

**Checks.**

- For `K` the kernel that sends every pair to the diagonal law of `κ x` (first coordinate only),
  the second marginal is `κ x`, not `κ y`: it is not a Markovian coupling unless `κ` is constant.
- Two-state chain with the coupling in which, from `(a, b)`, the two copies stay apart with
  probability `|1 − p − q|` and otherwise meet, and move together from the diagonal:
  `P(X_t ≠ Y_t) = |1 − p − q|^t = d̄(t)`, so the inequality is an equality.
- Stationarity is needed in the third item, as in the last Check of 1.2 with `K` the kernel that
  sends every pair to `(b, b)`.

*Needs:* 1.1, 1.2; Tau Ceti `IsCoupling`.

### 4.2 Path coupling

Let `S` be finite with a metric (`[MetricSpace S]`), and write `W₁` for Tau Ceti's
`wassersteinEDist 1`, the infimum over couplings of the expected distance (the transportation
metric of the source). Let `E` be a relation on `S` such that every pair of distinct points
`x`, `y` satisfies `E x y` or has a point `z` distinct from both with
`dist x z + dist z y = dist x y`. Prove:

- every pair of distinct points is joined by a chain of pairs in `E` whose distances add up to
  `dist x y`;
- **path coupling** (`wassersteinEDist_comp_le`): if `c : ℝ≥0` and
  `W₁ (κ x) (κ y) ≤ c · dist x y` for all pairs with `E x y`, then
  `W₁ (κ ∘ μ) (κ ∘ ν) ≤ c · W₁ μ ν` for all probability measures `μ`, `ν` (LPW, Theorem 14.6);
- if moreover `dist x y ≥ 1` for `x ≠ y` and `π` is stationary, then
  `d(t) ≤ c^t · diam(S)` (`tvToStationary_le_pow_mul_diam`), and for `c = exp(−α)`, `α > 0`,
  `ε > 0`, `t_mix(ε) ≤ ⌈(log diam(S) − log ε)/α⌉₊` (LPW, Corollary 14.8).

The hypothesis on `E` holds for the path metric of a connected graph with edge lengths and `E`
its set of edges, which is the setting of the source: a pair that is not an edge has an interior
vertex on a shortest path.

**Checks.**

- The hypercube with the Hamming distance, `E` the pairs at distance `1`, and the lazy walk of
  5.3: the coupling that refreshes the same coordinate with the same bit gives
  `W₁ ≤ 1 − 1/n`, so `d(t) ≤ n (1 − 1/n)^t`.
- The condition on `E` cannot be dropped: with `E` empty on two points at distance `1` it fails,
  and for the identity kernel the conclusion fails for every `c < 1`.
- `dist ≥ 1` is needed for the bound on `d`: on two points at distance `1/4`, with the identity
  kernel, `E` all pairs, `c = 1` and uniform `π`, the hypotheses of path coupling hold and the
  bound at `t = 0` would read `1/2 ≤ 1/4`.

*Needs:* 1.1, 1.2; Tau Ceti `wassersteinEDist`, `wassersteinEDist_triangle`, `IsCoupling`; Mathlib
`Metric.diam`.

### 4.3 The lazy walk on the cycle

For `n ≥ 1` and `p` in the unit interval, define `cycleWalk n p` on `ZMod n`, with rows
`½ δ_x + ½ (p δ_{x+1} + (1 − p) δ_{x−1})`. The uniform law is stationary for it. Prove
`4 t · d(t) ≤ n²` for all `t` (`tvToStationary_cycleWalk_le`), hence `t_mix(1/4) ≤ n²`. In the
coupling of the source one of the two walkers, chosen by a fair coin, moves at each step until
they meet; the clockwise distance between them is a simple symmetric walk on `{0, …, n}` stopped
at the ends, whose absorption time has mean at most `n²/4`. (LPW, Section 5.3.2.)

**Checks.**

- `n = 6`, `p = 1/2`: the largest value of `4 t d(t)` over `t` is `27/8 ≤ 36`, and
  `t_mix(1/4) = 4`.
- `n = 2`: `x + 1 = x − 1`, the walk moves with probability `1/2`, and `d(t) = 0` for `t ≥ 1`.
- `p = 1`: the walk is not reversible and the bound holds unchanged.

*Needs:* 4.1; Mathlib `bernoulliMeasure`, `Measure.uniformOfFinset`, `Kernel.ofFunOfCountable`.

### Examples

The lazy walk on the cycle; the lazy walk on the hypercube with the coordinate coupling.

### Dependencies

Layer 4 uses Layer 1 and Tau Ceti's couplings and Wasserstein distances.

## Layer 5: strong stationary times

### 5.1 Separation distance

Define `sepDist κ π x t` as the maximum over `y` of `1 − κ^t(x, y)/π(y)` (written `s_x(t)`); a
state with `π(y) = 0` contributes `1`. Prove:

- `tvDist ((κ ^ t) x) π / 2 ≤ s_x(t)` (`tvDist_le_sepDist`) (LPW, Lemma 6.16);
- for a stationary `π`, `s_x(t + u) ≤ s_x(t) · max_z s_z(u)` (`sepDist_add_le`), so `s_x` is
  nonincreasing (LPW, Exercise 6.4);
- for `κ` reversible for `π` with `π {y} > 0` for all `y`,
  `s_x(2t) ≤ 1 − (1 − d̄(t))²` (`sepDist_two_mul_le`) (LPW, Lemma 6.17).

**Checks.**

- The two-state chain with `p + q ≤ 1`: `s_a(t) = (1 − p − q)^t`, larger than
  `‖κ^t(a, ·) − π‖ = p/(p + q) · (1 − p − q)^t`.
- Stationarity is needed in the second item: for the kernel with both rows `(1/4, 3/4)` and
  uniform `π`, `s_x(t) = 1/2` for all `t ≥ 1`, and `1/2 ≤ 1/4` fails.
- Reversibility is needed in the third: the kernel with rows `(0, 0, 1)`, `(1/2, 0, 1/2)`,
  `(0, 1/2, 1/2)` has positive stationary law `(1/7, 2/7, 4/7)`, `d̄(1) = 1/2` and `s_a(2) = 1`.
- Positivity is needed in the third: for `π` the point mass at `a` and the kernel sending both of
  two states to `a`, `s_x(2) = 1` and `d̄(1) = 0`.

*Needs:* 1.2; MarkovChainsAndRenewal 3.1.

### 5.2 Strong stationary times

Let `π` be stationary with `π {y} > 0` for all `y`. On a probability space `(Ω, P)` with a
filtration `ℱ`, let `X : ℕ → Ω → S` be adapted with `X 0 = x` almost surely and
`P[1_{X (n+1) = y} | ℱ n] = κ^1(X n, y)` almost surely for all `n`, `y` (the Markov property
relative to `ℱ`), and let `τ` be a stopping time of `ℱ` with values in `WithTop ℕ` such that
`P(τ = t, X t = y) = P(τ = t) · π {y}` for all `t : ℕ` and `y` (a **strong stationary time**).
Prove:

- `P(τ ≤ t, X t = y) = P(τ ≤ t) · π {y}` (LPW, Remark 6.8);
- `s_x(t) ≤ P(τ > t)` (`sepDist_le_of_strongStationaryTime`) (LPW, Lemma 6.12), and so, by 5.1,
  `‖κ^t(x, ·) − π‖ ≤ P(τ > t)` (LPW, Proposition 6.11).

**Checks.**

- `τ = 0` is a strong stationary time for the chain started from `x` only on one state: the
  condition at `t = 0` reads `[y = x] = π {y}`.
- Positivity is needed: for `π` the point mass at an absorbing state `a` of a two-state chain
  started at `a`, `τ = 0` satisfies the condition, `P(τ > t) = 0`, and the junk term of the other
  state makes `s_a(t) = 1`.
- A hitting time of a state drawn from `π` at time `0` is a stationary time and not a strong one:
  on `{τ = 0}` the chain is at `x`.

*Needs:* 5.1; Mathlib `condExp`, `Filtration`, `Adapted`, `IsStoppingTime`;
MarkovChainsAndRenewal Layer 1, item 1 (the multi-step Markov property relative to a filtration).

### 5.3 The hypercube and the top-to-random shuffle

Define `hypercubeWalk n` on `Fin n → Bool`: a uniform pair `(j, b)` is drawn and coordinate `j`
is set to `b`. Define `topToRandom n` on `Equiv.Perm (Fin n)`, where `σ i` is the card at position
`i` and position `0` is the top: a uniform `k` is drawn and `σ` is replaced by
`σ * Fin.cycleRange k`, which moves the top card to position `k`. For both the uniform law is
stationary. Prove, for `n ≥ 1`, every starting state and every `t`:

- `s_x(t) ≤ n (1 − 1/n)^t` for `hypercubeWalk n` (`sepDist_hypercubeWalk_le`), with `τ` the
  first time every coordinate has been drawn (LPW, Example 6.10 and (6.14));
- `s_σ(t) ≤ n (1 − 1/n)^t` for `topToRandom n` (`sepDist_topToRandom_le`), with `τ` one step
  after the original bottom card reaches the top (LPW, Proposition 6.1 and Section 6.5.3).

Both times have the law of the coupon collector's time, for which
`P(τ > t) ≤ n (1 − 1/n)^t` by a union bound (LPW, proof of Proposition 2.4). Hence
`d(t) ≤ exp(−c)` for `t ≥ n log n + c n`, and `t_mix(ε) ≤ ⌈n log n + n log(1/ε)⌉₊` for `ε > 0`
(LPW, (6.15) to (6.17)).

**Checks.**

- Hypercube, `n = 2`, `t = 2`: `s_x(2) = 1/2 = 2 (1/2)²`, an equality.
- Top-to-random, `n = 2`: `Fin.cycleRange 0 = 1` and `Fin.cycleRange 1` is the transposition, so
  each step swaps the two cards with probability `1/2`, and `s(1) = 0 ≤ 1`.
- `n = 3`, `σ = 1`, `k = 2`: the new arrangement has cards `1, 2, 0` at positions `0, 1, 2`; the
  former top card is at the bottom. With `Fin.cycleRange k * σ` the cards would be renamed
  instead of moved.
- `n = 0` is excluded: the uniform law on an empty set of moves is the zero measure, and the
  kernel is not Markov.

*Needs:* 5.2; Mathlib `Measure.uniformOfFinset`, `Fin.cycleRange`, `Kernel.ofFunOfCountable`;
Tau Ceti `hasLaw_randomizedChain`.

### Examples

The two examples of 5.3.

### Dependencies

Layer 5 uses Layer 1, Mathlib's filtrations and stopping times, Tau Ceti's randomized chains,
and MarkovChainsAndRenewal Layer 1 and 3.1.

## Layer 6: Monte Carlo samplers

### 6.1 Glauber dynamics

Let `V` be a finite type of sites, `A` a countable type of values, and `π` a probability measure
on configurations `V → A`. Write `B(x, v)` for the set of configurations that agree with `x` off
`v`. Define `glauber π`, the kernel whose row at `x` is the average over `v` of the conditional
law `π[| B(x, v)]`, with `δ_x` in place of the conditional law when `π (B(x, v)) = 0`. Prove:

- for nonempty `V` it is a Markov kernel (`isMarkovKernel_glauber`);
- it is reversible with respect to `π` (`isReversible_glauber`), hence `π` is stationary (LPW,
  Section 3.3.2 and Exercise 3.2, for finite `A`).

**Checks.**

- One site: `B(x, v)` is everything and `glauber π x = π` for every `x`.
- Two sites with values in `Bool` and `π` uniform on `{(0, 0), (1, 1)}`: the conditional laws are
  point masses and the kernel is the identity on the support; it is reversible and not
  irreducible.
- A configuration `x` outside the support with `π (B(x, v)) = 0` for all `v` is fixed by the
  kernel; the row still has mass `1`.

*Needs:* Mathlib `ProbabilityTheory.cond`, `Kernel.IsReversible`, `Kernel.IsReversible.invariant`,
`Kernel.ofFunOfCountable`; MarkovChainsAndRenewal 3.1.

### 6.2 Glauber dynamics for colourings

Let `G` be a simple graph on a finite vertex type `V` with `n` vertices and maximum degree `Δ`,
and `q ≥ 1`. For a colouring `x : V → Fin q` define `allowedColours G x w`, the colours carried by
no neighbour of `w`, and `colouringGlauber G q`, the kernel on all colourings that picks a uniform
vertex `w` and recolours it with a uniform allowed colour (and keeps `x` if none is allowed).
Prove:

- for `q > Δ` and nonempty `V` it is a Markov kernel that maps proper colourings to proper
  colourings, and the uniform law on proper colourings is reversible for it; on proper
  colourings it agrees with `glauber` of that law (LPW, Section 3.3.1);
- if `q > 2Δ` and `π` is a stationary probability measure, then
  `d(t) ≤ n · exp(−(q − 2Δ) t / ((q − Δ) n))` for all `t`
  (`tvToStationary_colouringGlauber_le`), and so
  `t_mix(ε) ≤ ⌈(q − Δ)/(q − 2Δ) · n (log n − log ε)⌉₊` for `ε > 0` (LPW, Theorem 14.10, with
  (14.19) and (14.20)).

The route is 4.2 with the Hamming distance, `E` the pairs of colourings that differ at one vertex,
and `c = 1 − (q − 2Δ)/((q − Δ) n)`.

**Checks.**

- A graph with no edges and `q = 2`, `n = 3`: `Δ = 0`, the chain is the hypercube walk, and the
  bound is `3 exp(−t/3)`.
- The path on `3` vertices with `q = 5`: `Δ = 2`, the exponent is `−t/9`, the bound at
  `ε = 1/4` is `⌈9 log 12⌉ = 23`, and the mixing time is `6`.
- The distance is taken over all `q^n` colourings, proper or not: the maximum in `d(t)` includes
  improper starting colourings.

*Needs:* 4.2, 6.1; Mathlib `SimpleGraph.maxDegree`, `Measure.uniformOfFinset`.

### 6.3 The ergodic theorem

Let `κ` be irreducible with stationary law `π` on a finite `S`, `ν` a probability measure and
`f : S → ℝ`. Prove that, for almost every path `ω` of `markovChainLaw ν κ`,

    (1/n) Σ_{k<n} f (ω k) → E_π f

(`ae_tendsto_timeAverage`). The sum is `Σ_y f y · (number of k < n with ω k = y)`, and each
occupation frequency tends to `π {y}`. (LPW, Theorem C.1.)

**Checks.**

- The exchange chain and `f` the indicator of `a`: the averages tend to `1/2` although the law at
  time `n` does not converge.
- Irreducibility is needed: for the identity kernel on two states the limit is `f (ω 0)`.

*Needs:* MarkovChainsAndRenewal 2.3, 2.4 and 3.2; Tau Ceti `markovChainLaw`.

### 6.4 The error of time averages

Let `κ` be reversible with respect to `π` and `γ` its spectral gap. Prove:

- for the stationary chain,
  `γ · E[(Σ_{s<t} (f(X_s) − E_π f))²] ≤ 2 t · Var_π f`
  (`spectralGap_mul_integral_sq_sum_le`), the expectation being under `markovChainLaw π κ` (LPW,
  Lemma 12.22, (12.31));
- (`measureReal_timeAverage_deviation_le`) for `η > 0`, `ε > 0`, natural numbers `r` and `t ≥ 1`
  with `t_mix(ε/2) ≤ r` and `4 Var_π f ≤ η² ε γ t`, and every starting state `x`,
  `P_x(|(1/t) Σ_{s<t} f(X_{r+s}) − E_π f| ≥ η) ≤ ε` (LPW, Theorem 12.21). The route compares the
  law of `X_r` with `π` in total variation and applies Chebyshev's inequality to the stationary
  chain.

**Checks.**

- `t = 1`: the first bound reads `γ Var_π f ≤ 2 Var_π f`, true because `γ ≤ 2`.
- For the chain with all rows equal to `π`, `γ = 1` and the sum has variance `t Var_π f`, half of
  the bound.
- `t ≥ 1` is needed in the second statement: at `t = 0` the average is the junk value `0`.

*Needs:* 1.3, 2.1, 2.4; Tau Ceti `markovChainLaw`, `MeasureTheory.Measure.markovChainLaw_map_eval`;
Mathlib `ProbabilityTheory.meas_ge_le_variance_div_sq`.

### Examples

Glauber dynamics for proper colourings of a path; the Metropolis chain of
MathematicalStatisticsFoundations 9.4 for a target on two states, to which 2.3 and 6.4 apply
through its reversibility.

### Dependencies

Layer 6 uses 1.3, 2.1, 2.4, 4.2, and MarkovChainsAndRenewal 2.3, 2.4, 3.1 and 3.2.

## Downstream consumers

The bounds of Layers 2 to 5 apply to every reversible kernel on a finite type, in particular to
the Metropolis–Hastings kernel of MathematicalStatisticsFoundations 9.4 and to the hard-core
sampler of MarkovChainsAndRenewal 3.6. Approximate counting by sampling consumes 6.2.

## Provenance and prior work

The Isabelle Archive of Formal Proofs contains the entries `Markov_Models` (Hölzl and Nipkow:
discrete-time Markov chains and their classification), `Stochastic_Matrices` (stochastic matrices
and stationary distributions through the Perron–Frobenius theorem) and `Perron_Frobenius`. None
of them treats mixing times. They are reference material, not the specification.

## Scope and ownership

This roadmap owns, for chains on finite state spaces: the distances `d` and `d̄`, the mixing time,
the coupling characterization of total variation, the spectral decomposition of reversible
chains, the absolute spectral gap and relaxation time, the Dirichlet form and spectral gap, the
bottleneck ratio and Cheeger's inequality, Markovian couplings and path coupling, separation
distance and strong stationary times, Glauber dynamics, and the error bounds for time averages.

Left to other roadmaps and to the libraries:

- kernels, path laws, the Markov and strong Markov properties, classification, the existence,
  uniqueness and positivity of stationary laws, periods, the meeting-time coupling of independent
  copies, convergence in total variation without a rate, the formula
  `tvDist μ ν = Σ_y |μ {y} − ν {y}|`, occupation frequencies and the hard-core sampler belong to
  MarkovChainsAndRenewal. The coupling inequality of 4.1 above differs from its Layer 3, item 4 in
  allowing an arbitrary Markovian coupling;
- the event form `tvDist / 2 = sup_A |μ A − ν A|` is MathematicalStatisticsFoundations 9.2, and
  the Metropolis–Hastings kernel with its reversibility is its 9.4;
- couplings, transport costs and Wasserstein distances in general belong to OptimalTransport and
  Tau Ceti's optimal-transport library; 4.2 above uses them on a finite metric space;
- Markov decision processes belong to MarkovDecisionProcesses; hidden Markov models, the spectral
  theory of graph Laplacians and quantum walks on graphs, and classical ergodic theory of
  measure-preserving maps are separate subjects with roadmaps of their own, and a random walk on a
  graph appears here only as an example chain;
- CoboundaryExpansion treats Cheeger constants of cochain complexes; the bottleneck ratio here is
  a different object.

Out of scope: countable and general state spaces, Harris chains, continuous-time chains, the
cutoff phenomenon, comparison of chains by canonical paths and congestion, Wilson's lower bound,
expander families, hitting and cover times, evolving sets, logarithmic Sobolev inequalities,
coupling from the past, the central limit theorem for Markov chains, and Langevin and Hamiltonian
Monte Carlo.

## Exact supplier contracts

### From Mathlib

- `MeasureTheory.tvDist`, `tvDist_triangle` (for a finite middle measure), `tvDist_comm`
  (`Mathlib/MeasureTheory/Measure/TotalVariation/Defs.lean`): the total variation norm of the
  difference, with values in `[0, 2]` on probability measures.
- `Kernel.Invariant`, `Kernel.IsReversible`, and `Kernel.IsReversible.invariant` (a Markov kernel
  reversible for `π` leaves `π` invariant) (`Mathlib/Probability/Kernel/Invariance.lean`);
  `Kernel.IsIrreducible` (`Mathlib/Probability/Kernel/Irreducible.lean`);
  `Kernel.ofFunOfCountable` (`Mathlib/Probability/Kernel/Basic.lean`).
- `Matrix.IsHermitian.eigenvalues`, `Matrix.IsHermitian.eigenvectorBasis` and
  `Matrix.IsHermitian.mulVec_eigenvectorBasis` (`Mathlib/Analysis/Matrix/Spectrum.lean`): a
  Hermitian matrix has an orthonormal basis of eigenvectors with real eigenvalues.
  `Matrix.IsPrimitive` (`Mathlib/LinearAlgebra/Matrix/Irreducible/Defs.lean`): entrywise
  nonnegative with a positive power all of whose entries are positive.
- `spectrum`, and `spectrum.pow_norm_pow_one_div_tendsto_nhds_spectralRadius`
  (`Mathlib/Analysis/Normed/Algebra/GelfandFormula.lean`): Gelfand's formula in a complex Banach
  algebra.
- `ProbabilityTheory.variance` and `ProbabilityTheory.meas_ge_le_variance_div_sq` (Chebyshev's
  inequality for a function in `L²` of a finite measure)
  (`Mathlib/Probability/Moments/Variance.lean`); `ProbabilityTheory.cond`
  (`Mathlib/Probability/ConditionalProbability.lean`); `MeasureTheory.condExp`
  (`Mathlib/MeasureTheory/Function/ConditionalExpectation/Basic.lean`);
  `MeasureTheory.Filtration`, `MeasureTheory.Adapted` (each `X n` is measurable for `ℱ n`) and
  `MeasureTheory.IsStoppingTime` (for times with values in `WithTop ℕ`)
  (`Mathlib/Probability/Process/Filtration.lean`, `Adapted.lean`, `Stopping.lean`).
- `MeasureTheory.Measure.uniformOfFinset` (`Mathlib/Probability/Distributions/Uniform.lean`) and
  `ProbabilityTheory.bernoulliMeasure` (`Mathlib/Probability/Distributions/Bernoulli.lean`), which
  gives mass `p` to its first point and `1 − p` to its second; `Fin.cycleRange`
  (`Mathlib/GroupTheory/Perm/Fin.lean`), the cycle `(0 1 … k)`; `SimpleGraph.maxDegree`;
  `Metric.diam`.

### From Tau Ceti

- `Kernel.toMatrix`, `Kernel.toMatrix_pow` (for a finite kernel on a finite type) and
  `Kernel.toMatrix_mem_rowStochastic` (for a Markov kernel)
  (`TauCeti/Probability/Kernel/Matrix.lean`).
- `Kernel.period`, `Kernel.IsAperiodic` and
  `Kernel.IsAperiodic.eventually_pos_pow_apply_singleton` (for an irreducible aperiodic kernel
  with measurable singletons, `(κ ^ n) x {y} > 0` for all large `n`)
  (`TauCeti/Probability/MarkovChain/Period.lean`).
- `TauCeti.Probability.markovChainLaw` and `MeasureTheory.Measure.markovChainLaw_map_eval` (the
  state at time `n` has law `(κ ^ n) ∘ₘ ν`) (`TauCeti/Probability/Process/MarkovChain.lean`);
  `TauCeti.Probability.hasLaw_randomizedChain` (a chain driven by independent identically
  distributed noise through a measurable update map has law `markovChainLaw`)
  (`TauCeti/Probability/MarkovChain/Simulation.lean`).
- `TauCeti.IsCoupling` (`TauCeti/MeasureTheory/OptimalTransport/Coupling.lean`);
  `TauCeti.wassersteinEDist` and `TauCeti.wassersteinEDist_triangle` (for a jointly measurable
  distance, exponent at least `1`, a finite middle measure and a standard Borel space)
  (`TauCeti/MeasureTheory/OptimalTransport/Wasserstein/Basic.lean`).
- `LinearMap.IsSymmetric.eigenvalues_eq_iSup_iInf_re_inner`, the Courant–Fischer formula
  (`TauCeti/Analysis/InnerProductSpace/CourantFischer.lean`).

### From TauCetiRoadmap.MarkovChainsAndRenewal

Items are cited as "layer.item" of [MarkovChainsAndRenewal](../MarkovChainsAndRenewal/README.md).

- Layer 1, item 1: the one-step Markov property relative to a filtration and its multi-step form
  with kernel powers.
- 2.3: in an irreducible recurrent chain every state is hit almost surely from every initial law,
  and a finite irreducible chain is positive recurrent. 2.4: the occupation frequency of `y`
  tends almost surely to the reciprocal of its mean return time.
- 3.1: the singleton and matrix forms of `Kernel.Invariant` and `Kernel.IsReversible`.
- 3.2: an irreducible positive recurrent chain has a unique invariant probability, with mass
  `1/m_x` at `x`.
- 3.5: `tvDist μ ν = Σ_y |μ {y} − ν {y}|` on a countable space.

### From TauCetiRoadmap.MathematicalStatisticsFoundations

- [MathematicalStatisticsFoundations](../MathematicalStatisticsFoundations/README.md) 9.4: the
  Metropolis–Hastings kernel on a finite type is Markov and reversible for its target; used in
  the Examples of Layer 6 only.

## References

- D. A. Levin and Y. Peres, with contributions by E. L. Wilmer, *Markov chains and mixing times*,
  second edition, American Mathematical Society, 2017. Numbering as in the second edition made
  available by the authors.

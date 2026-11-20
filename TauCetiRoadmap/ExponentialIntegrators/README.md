# Roadmap: exponential integrators

**Summary.** Many evolution equations are semilinear: `x' = A(t) x + b(t) F(t, x)`, with a linear
part `A` of possibly very large norm (a stiff system, or a discretized parabolic equation) and a
nonlinear part `F` that is Lipschitz with a moderate constant. Classical explicit methods have
error bounds that grow exponentially with the norm of `A`. Exponential integrators solve the
linear part exactly and approximate only the nonlinear part in the variation-of-constants
formula. This roadmap builds their error theory on a real Banach space. The linear part enters
only through an evolution family `U(t, s)`, the solution operator from time `s` to time `t`, with
a growth bound `‖U(t, s)‖ ≤ M e^(ω(t − s))`; this covers bounded time-dependent operators and
strongly continuous semigroups alike.

The headline theorems are these.

- *A one-sided growth bound.* On a real inner product space, if `⟪A(r) v, v⟫ ≤ ω ‖v‖²` for all
  `r` and `v`, every solution of `x' = A(t) x` satisfies `‖x(t)‖ ≤ e^(ω(t − s)) ‖x(s)‖` for
  `t ≥ s`, whatever the norms of the operators `A(r)`.
- *The φ-functions* on a complete normed algebra satisfy `φ_k(X) = 1/k! + X φ_(k+1)(X)`, and a
  bound `‖e^(sX)‖ ≤ M e^(ωs)` on `[0, 1]` gives `‖φ_(k+1)(X)‖ ≤ M φ_(k+1)(ω)`.
- *Convergence of the exponential Euler method.* If the growth bound holds with `ω ≥ 0`, the
  weight is bounded by `B`, `F` is `L`-Lipschitz in `x` and `t ↦ F(t, x(t))` is `M₂`-Lipschitz
  along the solution, then on every mesh with steps at most `h_max` the error at time `t_n` is at
  most `M e^((ω + MBL)(t_n − t₀)) (‖e₀‖ + B M₂ h_max (t_n − t₀)/2)`, where `e₀` is the initial
  error.
- *A second-order exponential Runge–Kutta method* has global error `O(h_max²)` with explicit
  constants of the same kind when the derivative of `t ↦ F(t, x(t))` is Lipschitz; with zero
  linear part it is Heun's method, with Heun's constants.
- *DDIM is exponential Euler.* In the logarithm `λ` of the signal-to-noise ratio, the
  probability-flow equation of the variance-preserving Gaussian noising, in noise-prediction
  form, is `dx/dλ = σ(λ)² x − σ(λ) ε(λ, x)`. A deterministic DDIM step is one exponential Euler
  step for it, and for every noise predictor that is `L`-Lipschitz in `x` and `M₂`-Lipschitz in
  `λ` along the solution the DDIM error is at most
  `e^((1 + L)(λ_n − λ₀)) (‖e₀‖ + M₂ h_max (λ_n − λ₀)/2)`.

The roadmap builds on the one-step methods roadmap, whose meshes, numerical solutions and
defects it uses and whose convergence theorem it sharpens; on the
propagators of the Dirac scattering roadmap and the semigroups of Tau Ceti, which are evolution
families; and, for the last layer, on the noising paths of the score-based diffusion roadmap and
the probability-flow field of the flow-matching roadmap.

Layer 1 below defines evolution families and mild solutions and proves the one-sided growth
bound; Layer 2 develops the φ-functions; Layers 3 and 4 bound the defects and global errors of
the two methods; Layer 5 reads DDIM as the exponential Euler method.

## Conventions

- `E` is a real normed space (`[NormedAddCommGroup E] [NormedSpace ℝ E]`), complete
  (`[CompleteSpace E]`) wherever a statement integrates `E`-valued functions, that is in Layers 3,
  4 and 5. `H` is a real inner product space; `𝔸` is a complete normed real algebra.
- **Sign convention.** The equation is `x' = A(t) x + b(t) F(t, x)` and the semigroup of a
  constant `A` is `e^(tA)`. Hochbruck and Ostermann write `u' + A u = g(t, u)` and `e^(−tA)`; their
  `A` is `−A` here.
- **Evolution families.** `U : ℝ → ℝ → E →L[ℝ] E`, read `U t s` as the solution operator from
  time `s` to time `t`, used for `s ≤ t`. The growth bound `HasGrowthBound U M ω` is
  `‖U t s‖ ≤ M e^(ω(t − s))` for `s ≤ t`. For a Tau Ceti semigroup `S` and `U t s = S(t − s)` it
  is `S.HasGrowthBound ω M` without the condition `1 ≤ M`, which follows here from `U t t = 1`
  when `E ≠ 0`. The theorems of Layers 3 and 4 assume `ω ≥ 0`; a bound with `ω < 0` implies the
  bound with `ω = 0`.
- **The equation.** The nonlinearity is split as `b(t) F(t, x)` with a real weight `b`; the
  classical case is `b = 1`. The methods freeze `F`, not `b F`, inside the integral; Layer 5 needs
  the weight. `g(r) = F(r, x(r))` denotes the nonlinearity along a solution `x`.
- **Meshes and one-step methods.** Meshes, numerical solutions and defects are those of
  OneStepMethodsForODEs 1.1 and 1.2: `meshNode t₀ h n = t₀ + h 0 + ⋯ + h (n − 1)`, written `t_n`;
  `oneStepSeq Φ t₀ h y₀` with `Y (n + 1) = Y n + h n • Φ (t_n) (Y n) (h n)`; and
  `oneStepDefect Φ y t h = y (t + h) − y t − h • Φ t (y t) h`. A method given by a step map
  `S t u h` has the increment function `h⁻¹ • (S t u h − u)`; since `h⁻¹ = 0` at `h = 0` in Lean,
  `u + h • Φ t u h = S t u h` for every `h`, provided `S t u 0 = u`.
- **Lipschitz constants** `L`, `M₂`, `M₃` are in `ℝ≥0`, as in Mathlib's `LipschitzWith` and
  `LipschitzOnWith`.
- **Exponential.** `exp` is Mathlib's `NormedSpace.exp`; on `ℝ` it is `Real.exp`.

## Layer 1: evolution families and mild solutions

### 1.1 Evolution families and mild solutions

Define `IsEvolutionFamily U`: `U t t = 1` for all `t`; `U t r ∘ U r s = U t s` for
`s ≤ r ≤ t`; and `(t, s) ↦ U t s v` is continuous on `{s ≤ t}` for every `v`. Define
`HasGrowthBound U M ω` as in the Conventions, and `IsMildSolutionOn U b F x a c`: for
`a ≤ s ≤ t ≤ c`,

    x t = U t s (x s) + ∫_s^t b(r) U t r (F(r, x(r))) dr.

Prove:

- **bounded time-dependent linear parts.** For `P : ℝ → E →L[ℝ] E` continuous and `E` complete,
  the propagator `N_P(t, s)` of DiracScatteringAndNonlinearFourierTransform 1.3 is an evolution
  family, with growth bound `(1, ω)` when `‖P r‖ ≤ ω` for all `r`, and a function `x` with
  `x' = P(t) x + b(t) F(t, x)` on `[a, c]`, where `r ↦ b(r) F(r, x(r))` is continuous on `[a, c]`,
  is a mild solution there: this is the variation-of-constants identity of that section with
  forcing `r ↦ b(r) F(r, x(r))`. For continuous `P`, `N_P(t, 0)` is Tau Ceti's
  `TauCeti.dysonSeriesLeft P t` (Check of that section);
- **constant linear parts.** For `A : E →L[ℝ] E` and `E` complete, `U t s = exp ((t − s) • A)` is
  the family of the semigroup `TauCeti.Semigroups.StronglyContinuousSemigroup.ofBounded A`, so the
  semigroup case below applies, and the growth bound `(1, ‖A‖)` is Tau Ceti's
  `ofBounded_hasGrowthBound`; the composition law is Tau Ceti `ContinuousLinearMap.exp_add_smul`;
- **scalar linear parts.** For a continuous `a : ℝ → ℝ`, `U t s = exp (∫_s^t a) • 1` is an
  evolution family with growth bound `(1, ω)` whenever `a ≤ ω`;
- **semigroups.** For a Tau Ceti `StronglyContinuousSemigroup S` on a Banach space,
  `U t s = S.realOperator (t − s)` is an evolution family (`realOperator_zero`,
  `realOperator_add`, `continuous_realOperator_apply`), and a growth bound `S.HasGrowthBound ω M`
  gives `HasGrowthBound U M ω`. For `F = 0` the two notions of mild solution agree: a Tau Ceti
  mild solution `u` of `u' = Au`, `u(0) = v` (`TauCeti.Semigroups.IsMildSolution`, an integrated
  identity for the generator `A`) is the orbit `t ↦ S(t) v` on `[0, ∞)`
  (`IsMildSolution.eq_realOperator`), and so satisfies `IsMildSolutionOn U b 0 u a c` for every
  `0 ≤ a ≤ c` and every `b`;
- **continuity of the integrands.** If `U` is an evolution family with a growth bound, `g` is
  continuous on `[s, t]` and `b` is continuous on `[s, t]`, then `r ↦ b(r) U t r (g r)` is
  continuous on `[s, t]`, hence interval integrable: write
  `U t r (g r) − U t r₀ (g r₀) = U t r (g r − g r₀) + (U t r − U t r₀) (g r₀)` and bound the first
  term by the growth bound.

(The variation-of-constants formula is Hochbruck–Ostermann 2010, (2.19), for a constant
generator; evolution families of time-dependent equations are standard. The statements above are
proved here from the cited suppliers.)

**Checks.**

- `U t s = 1`, `b = 1`: a mild solution is a solution of the integral equation
  `x t = x s + ∫_s^t F(r, x(r)) dr`.
- `A = −K · 1` with `K ≥ 0`: `‖exp ((t − s) • A)‖ = e^(−K(t − s)) ≤ 1`, so the growth bound
  `(1, 0)` holds for every `K`, while `‖A‖ = K` and the bound `(1, ‖A‖)` grows with `K`.
- The family `U t s = (t − s + 1) • 1` has `U t t = 1` and is continuous, but it is not an
  evolution family: at `s = 0`, `r = 1`, `t = 2`, `U t r ∘ U r s = 4 • 1 ≠ 3 • 1 = U t s`.
- Scalar: `a = −20 (1 + sin 5t) + 1/2` satisfies `a ≤ 1/2`, so `U t s = exp (∫_s^t a)` has growth
  bound `(1, 1/2)`, although `|a|` reaches `39.5`.

*Needs:* DiracScatteringAndNonlinearFourierTransform 1.3 (the propagator); Tau Ceti
`TauCeti.dysonSeriesLeft`, `ContinuousLinearMap.exp_add_smul`,
`TauCeti.Semigroups.StronglyContinuousSemigroup.ofBounded`, `ofBounded_hasGrowthBound`,
`TauCeti.Semigroups.StronglyContinuousSemigroup.realOperator`,
`realOperator_zero`, `realOperator_add`, `continuous_realOperator_apply`,
`TauCeti.Semigroups.StronglyContinuousSemigroup.HasGrowthBound`,
`TauCeti.Semigroups.IsMildSolution`, `IsMildSolution.eq_realOperator`; Mathlib
`NormedSpace.exp`, `intervalIntegral`.

### 1.2 The one-sided growth bound

Prove `norm_le_exp_mul_norm_of_inner_le`: let `H` be a real inner product space,
`A : ℝ → H →L[ℝ] H`, and `ω` real with `⟪A r v, v⟫ ≤ ω ‖v‖²` for all `r ∈ [s, t₁]` and all `v`.
If `x' = A(r) x` on `[s, t₁]` (derivatives within `[s, t₁]`), then
`‖x t‖ ≤ e^(ω(t − s)) ‖x s‖` for every `t ∈ [s, t₁]`. No bound on `‖A r‖` and no continuity of
`A` is assumed. In particular, on a complete `H`, the propagator `U` of 1.1 of a continuous such
`A` has the growth bound `(1, ω)`, and for constant `A`, `‖exp (t • A)‖ ≤ e^(ωt)` for `t ≥ 0`.
For constant `A` and `ω = 0` the hypothesis says that `A` is dissipative in the sense of Tau Ceti
(`TauCeti.Semigroups.isDissipative_iff_real_inner_nonpos`), whose Lumer–Phillips theorem
characterizes the generators of contraction semigroups; the time-dependent statement along
solutions is proved here.

Route: `r ↦ ‖x r‖²` has right derivative `2 ⟪A r (x r), x r⟫ ≤ 2ω ‖x r‖²`
(`HasDerivWithinAt.inner`), so `e^(−2ω(r − s)) ‖x r‖²` is nonincreasing on `[s, t₁]`
(`image_le_of_liminf_slope_right_le_deriv_boundary`). (Hochbruck–Ostermann 2010, Example 2.3,
states the case of a constant matrix with field of values in a half-plane; the statement above is
proved here.)

**Checks.**

- `A = −K · 1`, `K ≥ 0`: `⟪A v, v⟫ = −K ‖v‖² ≤ 0`, so `ω = 0` for every `K`.
- The Jordan block `A = (0, 1; 0, 0)` on `ℝ²`: `⟪A v, v⟫ = v₁ v₂ ≤ ‖v‖²/2`, so `ω = 1/2`, and
  `‖exp (2A)‖ = 1 + √2 = 2.414… ≤ e = 2.718…`. Its eigenvalues are `0`, and the bound with the
  spectral abscissa `ω = 0` in place of the field of values is false: `2.414… > 1`.
- `A(t) = (−3, 5 cos t; −5 cos t, −1 + sin t)`: the symmetric part has largest eigenvalue
  `−1 + sin t ≤ 0`, so solutions do not grow in norm, although `‖A(t)‖` reaches about `6.4`.

*Needs:* Mathlib `HasDerivWithinAt.inner`, `image_le_of_liminf_slope_right_le_deriv_boundary`,
`Real.exp`; for the propagator, 1.1.

### Examples

The constant family `exp ((t − s) • A)` for `A = −K · 1`, for the Jordan block and for
`A = (−1, 10; 0, −2)` (growth bound `(M, 0)` with `M > 1`); the scalar family of the Checks of 1.1;
the semigroup families of Tau Ceti.

### Dependencies

Layer 1 uses DiracScatteringAndNonlinearFourierTransform 1.3 (the propagator), the Tau Ceti
declarations on operator exponentials, Dyson series and strongly continuous semigroups named in
1.1 (and, for comparison in 1.2, Tau Ceti's dissipativity), and Mathlib's
`NormedSpace.exp`, `HasDerivWithinAt.inner` and
`image_le_of_liminf_slope_right_le_deriv_boundary`.

## Layer 2: the φ-functions

### 2.1 Definition and recursion

Define `phi : ℕ → 𝔸 → 𝔸` by `phi 0 X = exp X` and
`phi (k + 1) X = ∫₀¹ (θ^k / k!) • exp ((1 − θ) • X) dθ`. Prove:

- `phi_eq_inv_factorial_smul_one_add_mul`: `phi k X = (1/k!) • 1 + X * phi (k + 1) X` for every
  `k`; for `k = 0` this is `exp X = 1 + X φ₁(X)`, which is Tau Ceti's Duhamel formula
  `TauCeti.exp_add_sub_exp_eq_integral` at the point `0` with increment `X` (it gives
  `exp X − 1 = φ₁(X) X`), together with the commutation below;
- `phi k 0 = (1/k!) • 1`, and the series `phi k X = ∑_j X^j / (j + k)!`, norm convergent;
- `X` commutes with `phi k X`;
- on `ℝ`: `phi 1 x = (e^x − 1)/x` and `phi 2 x = (e^x − 1 − x)/x²` for `x ≠ 0`; each `phi k` is
  positive and nondecreasing on `ℝ`, and `phi (k + 1) x ≤ e^(max x 0)/(k + 1)!`.

Route: integrate by parts in `θ`, using `hasDerivAt_exp_smul_const`. (Hochbruck–Ostermann 2010,
(2.10) and (2.11), for complex arguments; for elements of a normed algebra proved here.)

**Checks.**

- `phi 2 1 = e − 2 = 0.718…`; the plausible wrong reading `φ₂(x) = (e^x − 1)/x²` gives
  `e − 1 = 1.718…`.
- `X = N` nilpotent with `N² = 0`: `phi 1 N = 1 + N/2` and `phi 2 N = 1/2 + N/6`, and the
  recursion `phi 1 N = 1 + N (1/2 + N/6) = 1 + N/2` holds.
- `phi k 0` is `1, 1, 1/2, 1/6` for `k = 0, 1, 2, 3`.

*Needs:* Mathlib `NormedSpace.exp`, `hasDerivAt_exp_smul_const`,
`intervalIntegral.integral_eq_sub_of_hasDerivAt`; Tau Ceti `TauCeti.exp_add_sub_exp_eq_integral`
for the case `k = 0`.

### 2.2 Bounds and the weights of the methods

Prove:

- `norm_phi_succ_le`: if `‖exp (s • X)‖ ≤ M e^(ωs)` for `s ∈ [0, 1]`, then
  `‖phi (k + 1) X‖ ≤ M · phi (k + 1) ω`, the right side being the real φ-function; hence
  `‖phi (k + 1) X‖ ≤ M e^(max ω 0)/(k + 1)!`;
- **the weights.** For `E` complete, `A : E →L[ℝ] E`, `h ≠ 0` and `k : ℕ`,
  `∫_t^(t+h) ((r − t)/h)^k / k! • exp ((t + h − r) • A) dr = h • phi (k + 1) (h • A)`, by the
  substitution `r = t + θh` (`intervalIntegral.integral_comp_mul_deriv`); so for the family
  `exp ((t − s) • A)` and `b = 1` the integrals of the methods of Layers 3 and 4 are
  `h • phi 1 (h • A)` and `h • phi 2 (h • A)` applied to vectors.

(Hochbruck–Ostermann 2010, Lemma 2.4, proves that `φ_k(−hA)` is bounded under the growth bound;
the constant `M φ_(k+1)(ω)` is proved here.)

**Checks.**

- `X = −K`, `K > 0`, on `ℝ`: `phi 1 (−K) = (1 − e^(−K))/K ≤ 1 = phi 1 0`, the bound with `M = 1`,
  `ω = 0`.
- The Jordan block `N` of 1.2 has `‖exp (sN)‖ ≤ e^(s/2)`; the operator norm of
  `phi 1 N = (1, 1/2; 0, 1)` is `1.2807…`, and `phi 1 (1/2) = 2 (e^(1/2) − 1) = 1.2974…`.
- `k = 0`, `A = 0`: the weight integral is `h`, and `h • phi 1 0 = h`.

*Needs:* 2.1; Mathlib `intervalIntegral.norm_integral_le_of_norm_le`,
`intervalIntegral.integral_comp_mul_deriv`.

### Examples

`phi k` of `−K`, of the Jordan block and of a diagonal matrix, where it acts entrywise.

### Dependencies

Layer 2 uses Mathlib's `NormedSpace.exp`, `hasDerivAt_exp_smul_const`,
`intervalIntegral.integral_eq_sub_of_hasDerivAt`, `intervalIntegral.norm_integral_le_of_norm_le`
and `intervalIntegral.integral_comp_mul_deriv`, and Tau Ceti's
`TauCeti.exp_add_sub_exp_eq_integral`. It uses no other layer.

## Layer 3: the exponential Euler method

Throughout Layers 3 and 4, `E` is complete, `U` is an evolution family with
`HasGrowthBound U M ω` and `ω ≥ 0`, `b` is continuous on `[a, c]` with `|b| ≤ B` there, and `x`
is a mild solution on `[a, c]` (`IsMildSolutionOn U b F x a c`) along which
`g(r) = F(r, x(r))` is `M₂`-Lipschitz on `[a, c]`.

### 3.1 The method

Define `expEulerStep U b F t u h = U (t + h) t u + ∫_t^(t+h) b(r) U (t + h) r (F(t, u)) dr` and
the increment `expEulerIncrement U b F t u h = h⁻¹ • (expEulerStep U b F t u h − u)`. Prove:

- `expEulerStep U b F t u 0 = u`, so `u + h • expEulerIncrement U b F t u h` is the step for
  every `h`, and `oneStepSeq (expEulerIncrement U b F)` is the sequence of steps;
- for `U t s = 1` and `b = 1` the increment is `F t u` for `h ≠ 0`: the method is the explicit
  Euler method of OneStepMethodsForODEs 3.1;
- for `U t s = exp ((t − s) • A)` and `b = 1` the step is
  `exp (h • A) u + h • phi 1 (h • A) (F(t, u))` (2.2);
- **exactness for constant forcing:** if `F(r, v) = w` for all `r`, `v`, the defect along every
  mild solution is `0`.

(Hochbruck–Ostermann 2010, Example 2.12 and (2.29), for a constant generator and `b = 1`; the
form with an evolution family and a weight is proved here.)

**Checks.**

- `E = ℝ`, `x' = −x + 1`, `x(0) = 0`, `h = 1`: the exponential Euler step is
  `e^(−1) · 0 + φ₁(−1) · 1 = 1 − e^(−1) = 0.632…`, the exact value; the explicit Euler step gives
  `1`.
- The DDIM step of 5.2 freezes `F = ε` with weight `−σ`. Freezing `F = −σ ε` with weight `1`
  gives a different method: at `λ = −1`, `λ' = 1/2`, `x = 0.8`, `ε(λ, x) = tanh x · cos λ`, its
  step is `1.2207…` and the DDIM step is `1.3333…`.

*Needs:* 1.1, 2.2; OneStepMethodsForODEs 1.2 (`oneStepSeq`) and 3.1.

### 3.2 The defect

Prove `norm_oneStepDefect_expEulerIncrement_le`: for `a ≤ t`, `0 ≤ h`, `t + h ≤ c`,

    ‖oneStepDefect (expEulerIncrement U b F) x t h‖ ≤ B M M₂ e^(ωh) h² / 2.

No Lipschitz condition on `F` in `x` is needed. Route: by the mild-solution identity on
`[t, t + h]`, the defect is `∫_t^(t+h) b(r) U (t + h) r (g r − g t) dr`, whose integrand has norm at
most `B M e^(ωh) M₂ (r − t)`. (Hochbruck–Ostermann 2010, (2.31) and (2.32), give the defect as
this integral for a constant generator; the bound is proved here.)

**Checks.**

- `U = 1`, `b = 1`, `F(t, u) = t`: `g(r) = r`, `M₂ = 1`, and the defect is `h²/2`, equal to the
  bound with `B = M = 1`, `ω = 0`.
- `A = −K · 1`: the bound `M₂ h²/2` holds for every `K ≥ 0`.
- `ω ≥ 0` is needed: `U t s = e^(−50(t − s))` has the growth bound `(1, −50)`; with
  `F(t, u) = t`, `b = 1`, `t = 0`, `h = 1`, the defect is `(49 + e^(−50))/2500 = 0.0196`, while the
  formula with `ω = −50` gives `e^(−50)/2 ≈ 9.6 · 10^(−23)`.

*Needs:* 1.1 (`IsMildSolutionOn`, the continuity of the integrands), 3.1; OneStepMethodsForODEs
1.2 (`oneStepDefect`); Mathlib `intervalIntegral.norm_integral_le_of_norm_le`.

### 3.3 The global error

Prove `norm_sub_oneStepSeq_expEulerIncrement_le`: let moreover `F(t, ·)` be `L`-Lipschitz for every
`t`. On every mesh with first node `a`, steps `0 ≤ h n ≤ h_max` for `n < N` and `t_N ≤ c`, for
every `y₀` and `n ≤ N`,

    ‖x (t_n) − oneStepSeq (expEulerIncrement U b F) a h y₀ n‖
      ≤ M e^((ω + M B L)(t_n − a)) (‖x a − y₀‖ + B M₂ h_max (t_n − a)/2).

Route: with `e_k = x(t_k) − Y_k`, the mild-solution identity and the step give
`e_(k+1) = U(t_(k+1), t_k) e_k + ∫ b(r) U(t_(k+1), r) (g r − F(t_k, Y_k)) dr`. Unrolling with the
composition law,

    e_n = U(t_n, a) e_0
          + ∑_(k<n) ∫_(t_k)^(t_(k+1)) b(r) U(t_n, r) (g r − g t_k + F(t_k, x_k) − F(t_k, Y_k)) dr,

so `η_n = e^(−ω(t_n − a)) ‖e_n‖` satisfies
`η_n ≤ M ‖e_0‖ + B M M₂ h_max (t_n − a)/2 + M B L ∑_(k<n) h_k η_k`. The right side's first two
terms are nondecreasing in `n`, and the discrete Grönwall inequality
(`discrete_gronwall_prod_general` applied to the partial sums `∑_(k<n) h_k η_k`, and
`Real.add_one_le_exp`) gives
`η_n ≤ (M ‖e_0‖ + B M M₂ h_max (t_n − a)/2) e^(M B L (t_n − a))`. (Hochbruck–Ostermann 2010,
Theorem 2.14, for a constant generator of an analytic semigroup under its parabolic Assumptions
2.9 and 2.10, `b = 1`, constant steps and an unspecified constant; the statement above, under the
growth bound alone and with explicit constants, is proved here.)

**Checks.**

- `U = 1`, `b = 1`, `M = 1`, `ω = 0`: the bound is `e^(L(t_n − a)) (‖e₀‖ + M₂ h_max (t_n − a)/2)`.
  The explicit Euler bound of OneStepMethodsForODEs 3.1,
  `gronwallBound ‖e₀‖ L (M₂ h_max/2) (t_n − a)`, is smaller, since
  `(e^(Lτ) − 1)/L ≤ τ e^(Lτ)`; the bound here is weaker by that inequality, the price of its
  argument for a general evolution family with `M > 1`.
- Stiffness: for `A = −1000 · 1`, `F = 0`, `b = 1` and steps `h = 0.01`, the increment function
  of 3.1 is `u ↦ ((e^(−10) − 1)/0.01) u`, with best Lipschitz constant `99.995…`, so
  OneStepMethodsForODEs 1.4 (the convergence theorem) gives a bound with the factor
  `e^(99.995… T)`; the bound here has `M = 1`, `ω = 0`, `L = 0` and the factor `1`.
- `n = 0`: the bound is `M ‖x a − y₀‖`, and `M ≥ 1` when `E ≠ 0`, because `U a a = 1`.
- `ω ≥ 0` is needed: in the last Check of 3.2, with `N = 1`, `y₀ = x(0) = 0`, `h_max = 1`, the
  error after one step is `0.0196`, and the formula with `ω = −50` gives about `9.6 · 10^(−23)`.

*Needs:* 1.1, 3.1, 3.2; OneStepMethodsForODEs 1.1 (`meshNode`), 1.2 (`oneStepSeq`); Mathlib
`discrete_gronwall_prod_general`, `Real.add_one_le_exp`.

### Examples

The stiff scalar equation `x' = −Kx + sin x + cos t`, a non-normal system with
`A = (−1, 10; 0, −2)`, and the scalar time-dependent family of 1.1 with weight `b = cos t`.

### Dependencies

Layer 3 uses 1.1, 2.2, OneStepMethodsForODEs 1.1, 1.2, 1.4 (in a Check) and 3.1 (in a Check), and
Mathlib's `intervalIntegral.norm_integral_le_of_norm_le`, `discrete_gronwall_prod_general` and
`Real.add_one_le_exp`.

## Layer 4: a second-order exponential Runge–Kutta method

The standing hypotheses of Layer 3 hold, `F(t, ·)` is `L`-Lipschitz for every `t`, and moreover
`g` has a derivative `g'` within `[a, c]` at every point of `[a, c]`, with `g'` `M₃`-Lipschitz on
`[a, c]`.

### 4.1 The method

Define `expRK2Step U b F t u h`: with `v = expEulerStep U b F t u h`,

    expRK2Step U b F t u h = v + ∫_t^(t+h) (b(r) (r − t)/h) U (t + h) r (F(t + h, v) − F(t, u)) dr,

and `expRK2Increment U b F t u h = h⁻¹ • (expRK2Step U b F t u h − u)`. Prove:

- `expRK2Step U b F t u 0 = u`;
- for `U = 1` and `b = 1` the step is `u + (h/2) • (F(t, u) + F(t + h, u + h • F(t, u)))`, the step
  of the method `heun` of OneStepMethodsForODEs 3.2;
- for `U t s = exp ((t − s) • A)` and `b = 1` the step is
  `v + h • phi 2 (h • A) (F(t + h, v) − F(t, u))`, with
  `v = exp (h • A) u + h • phi 1 (h • A) (F(t, u))`.

(Hochbruck–Ostermann 2010, Example 2.18, the family (2.39) with `c₂ = 1`, for a constant
generator; the form with an evolution family and a weight is proved here.)

**Checks.**

- `U = 1`, `b = 1`, `F(t, u) = −sin u + cos 2t`, `t = 0.2`, `h = 0.3`, `u = 0.7`: the step agrees
  with Heun's step to rounding.
- The weight `(r − t)/h` is needed: replacing it by `1` makes the correction
  `F(t + h, v) − F(t, u)` enter with weight `h` instead of `h/2` at `U = 1`, and the method is no
  longer Heun's method (it is not even consistent of order two on `F(t, u) = t`, where its defect
  at `t = 0` is `h²/2 − h² = −h²/2`).

*Needs:* 2.2, 3.1; OneStepMethodsForODEs 3.2.

### 4.2 The defect

Prove `norm_oneStepDefect_expRK2Increment_le`: for `a ≤ t`, `0 ≤ h`, `t + h ≤ c`,

    ‖oneStepDefect (expRK2Increment U b F) x t h‖
      ≤ B M e^(ωh) h³ (M₃/12 + L B M M₂ e^(ωh)/4).

Route: the defect is

    ∫ b(r) U(t + h, r) (g r − g t − ((r − t)/h)(g(t + h) − g t)) dr
      + ∫ (b(r)(r − t)/h) U(t + h, r) (g(t + h) − F(t + h, v)) dr,

the integrals over `[t, t + h]`, with `v` the exponential Euler step from `x(t)`. The
interpolation error of a function with `M₃`-Lipschitz derivative satisfies
`‖g(t + s) − g t − (s/h)(g(t + h) − g t)‖ ≤ M₃ s (h − s)/2` for `0 ≤ s ≤ h`,
whose integral over `[0, h]` is `M₃ h³/12`; and `‖g(t + h) − F(t + h, v)‖ ≤ L ‖x(t + h) − v‖`,
which 3.2 bounds by `L B M M₂ e^(ωh) h²/2`. (Hochbruck–Ostermann 2010, Theorem 2.17, states
second order of the global error with an unspecified constant for a constant generator under its
parabolic Assumptions 2.9 and 2.16; the defect bound above is proved here.)

**Checks.**

- `U = 1`, `b = 1`, `F(t, u) = t²`, `t = 0`: `L = 0`, `g' = 2r`, `M₃ = 2`; the defect is
  `h³/3 − h³/2 = −h³/6`, of norm `M₃ h³/12`: equality. These are the constants `(M₃/12 + L M₂/4)` of
  `heun_defect_le` in OneStepMethodsForODEs 3.2.
- `h = 0`: both sides are `0`.

*Needs:* 1.1, 3.2, 4.1; OneStepMethodsForODEs 1.2.

### 4.3 The global error

Prove `norm_sub_oneStepSeq_expRK2Increment_le`: on every mesh as in 3.3, for every `y₀` and
`n ≤ N`,

    ‖x (t_n) − oneStepSeq (expRK2Increment U b F) a h y₀ n‖
      ≤ e^((ω + C)(t_n − a)) (M ‖x a − y₀‖ + D h_max² (t_n − a))

with `C = B M L (1 + M e^(ω h_max) (1 + B h_max L))/2` and
`D = B M (M₃/12 + L B M M₂ e^(ω h_max)/4)`.

Route: as in 3.3. The error recursion is

    e_(k+1) = U(t_(k+1), t_k) e_k + (W₁ − W₂)(F(t_k, x_k) − F(t_k, Y_k))
              + W₂ (F(t_(k+1), v(x_k)) − F(t_(k+1), v(Y_k))) + δ_k,

with `W₁ = ∫ b(r) U(t_(k+1), r) dr`, `W₂ = ∫ b(r) ((r − t_k)/h_k) U(t_(k+1), r) dr` and `δ_k` the
defect; after composition with `U(t_n, t_(k+1))` the two weights have norm at most
`B M e^(ω(t_n − t_k)) h_k/2`, the stage difference satisfies
`‖v(x_k) − v(Y_k)‖ ≤ M e^(ω h_k)(1 + B h_k L) ‖e_k‖`, and the defect, written as the two
integrals of 4.2 with `U(t_n, t_(k+1))` composed inside them (so that `U(t_n, r)` appears and no
second factor `M`), contributes at most `e^(ω(t_n − t_k)) D h_k³`. (Proved here; Hochbruck and
Ostermann 2010, Theorem 2.17, give the order with an unspecified constant, as said in 4.2.)

**Checks.**

- `U = 1`, `b = 1`, `M = 1`, `ω = 0`, `B = 1`: `C = L (1 + h_max L/2)`, the Lipschitz constant of
  the increment of `heun` in OneStepMethodsForODEs 3.2, and `D = M₃/12 + L M₂/4`.
- `n = 0`: the bound is `M ‖x a − y₀‖`.

*Needs:* 1.1, 3.2, 4.1, 4.2; OneStepMethodsForODEs 1.1, 1.2; Mathlib
`discrete_gronwall_prod_general`, `Real.add_one_le_exp`.

### Examples

The examples of Layer 3, and the scalar equation `x' = −Kx + t²` with `b = 1`, for which `g' = 2t`
and `M₃ = 2` whatever `K`.

### Dependencies

Layer 4 uses 1.1, 2.2, 3.1, 3.2, OneStepMethodsForODEs 1.1, 1.2 and 3.2 (in Checks), and Mathlib's
`discrete_gronwall_prod_general` and `Real.add_one_le_exp`.

## Layer 5: DDIM as the exponential Euler method

### 5.1 Log signal-to-noise time

Define `lsnrSignal λ = (1 + e^(−2λ))^(−1/2)` and `lsnrNoise λ = (1 + e^(2λ))^(−1/2)`, written
`α(λ)` and `σ(λ)`, and the scalar evolution family `lsnrFamily λ' λ = (α(λ')/α(λ)) • 1`. Prove:

- `α² + σ² = 1`, `α/σ = e^λ`, `α' = σ² α` and `σ' = −α² σ`;
- `lsnrFamily` is an evolution family with `HasGrowthBound lsnrFamily 1 1`
  (`α(λ')/α(λ) = exp (∫_λ^λ' σ²) ≤ e^(λ' − λ)`), and it is the propagator of `σ(λ)² · 1`;
- a solution of `dx/dλ = σ(λ)² x − σ(λ) ε(λ, x)` on `[λ₀, λ₁]`, with `λ ↦ ε(λ, x(λ))` continuous, is
  a mild solution for `lsnrFamily`, the weight `−σ` and `F = ε` (1.1 with `P = σ² · 1`).

When `ε` is the exact noise prediction, the equation is the probability-flow equation in
noise-prediction form. The levels `c = α`, `s = σ`, read as functions of `λ`, form a noising path
in the sense of ScoreBasedDiffusion (Conventions), whose definition puts no sign condition on the
diffusion coefficient: its drift coefficient is `a = σ²` and its diffusion coefficient is
`G = 2(σ σ' − σ² α'/α) = −2σ²`, negative because `λ` runs against the noise. FlowMatching 4.1
(the probability-flow field) defines the field from a drift and a diffusion matrix by a formula
that needs no sign condition either; for the drift `a x` and the matrix `G • id` it is
`a x − (G/2) ∇ log p_λ = σ² x + σ² ∇ log p_λ`, and with the noise prediction
`ε* = −σ · noisyScore` of DenoisingDiffusion 3.3 it is `σ² x − σ ε*`. Increasing `λ` lowers the
noise, so the sampler runs forward in `λ`. (Lu, Zhou, Bao, Chen, Li and Zhu 2022, Section 2.2,
(2.7), and Section 3.1, (3.1)–(3.4) and Proposition 3.1, for the exact solution formula in `λ`; the
identities above are proved here.)

**Checks.**

- `α(0) = σ(0) = 1/√2`; for a time `t` of ScoreBasedDiffusion's variance-preserving path with
  `∫₀ᵗ β > 0`, `λ(t) = log (vpSignal β t / vpNoise β t)` gives `α(λ(t)) = vpSignal β t`.
- Gaussian data: `d = 1`, `μ₀ = N(0, s²)`. Then `ε*(λ, x) = σ x/(α² s² + σ²)`, and the solution
  is `x(λ) = x(λ₀) v(λ)/v(λ₀)` with `v = √(α² s² + σ²)`, the standard deviation of the noisy law.
  For `s² = 0.04`, `x(2)/x(−3) = 0.23958…`.
- With `G` computed with the wrong sign, `+2σ²`, the field would be `σ² x + σ ε*`, under which the
  Gaussian example grows instead of contracting toward the data.

*Needs:* 1.1; ScoreBasedDiffusion Conventions and 1.2 (for the identification), FlowMatching 4.1
(for the identification), DenoisingDiffusion 3.3; Mathlib `Real.exp`, `Real.sqrt`.

### 5.2 The DDIM step

Define `ddimStep ε λ λ' x = (α(λ')/α(λ)) • (x − σ(λ) • ε(λ, x)) + σ(λ') • ε(λ, x)`, the
deterministic DDIM update, and `ddimSeq ε λ₀ h x₀` with `Y (n + 1) = ddimStep ε λ_n λ_(n+1) (Y n)`.
Prove `ddimStep_eq_expEulerStep`: for every `λ`, `h` and `x`,

    ddimStep ε λ (λ + h) x = expEulerStep lsnrFamily (−σ) ε λ x h.

Route: `∫_λ^(λ+h) σ(r) α(λ + h)/α(r) dr = α(λ + h) ∫_λ^(λ+h) e^(−r) dr`, which is
`α(λ + h) σ(λ)/α(λ) − σ(λ + h)`. Also
prove that `ddimStep ε λ (λ + h) x = (α(λ + h)/α(λ)) • x − σ(λ + h) (e^h − 1) • ε(λ, x)`, the
DPM-Solver-1 form. (Song, Meng and Ermon 2021, (12) with `σ_t = 0`, in whose notation our `α²` is
their `α`; Lu, Zhou, Bao, Chen, Li and Zhu 2022, (3.7) and Section 4.1, (4.1), for the identity
of DDIM with DPM-Solver-1; the identity with the exponential Euler step of 3.1 is proved here.)

**Checks.**

- `h = 0`: `ddimStep ε λ λ x = x`.
- `λ = −2`, `h = 0.7` and `λ = 0.5`, `h = 1.5`, with `ε(λ, x) = tanh x · cos λ`: the three forms
  agree to rounding.
- The DDIM step is not the explicit Euler step of the equation: in the Gaussian example of 5.1
  with `s² = 0.04`, from `λ = 0`, `x = 1` with `h = 1`, the exact value is `0.54496…`, the DDIM step
  gives `0.52053…` and the explicit Euler step `1 + σ(0)² − σ(0) ε*(0, 1) = 0.53846…`.

*Needs:* 3.1, 5.1.

### 5.3 The error of DDIM

Prove `norm_sub_ddimSeq_le`: let `E` be complete, `ε(λ, ·)` `L`-Lipschitz for every `λ`, `x` a
solution of `dx/dλ = σ² x − σ ε(λ, x)` on `[λ₀, λ₁]` along which `λ ↦ ε(λ, x(λ))` is
`M₂`-Lipschitz. On every mesh with first node `λ₀`, steps in `[0, h_max]` and `λ_N ≤ λ₁`, for
every `x₀` and `n ≤ N`,

    ‖x (λ_n) − ddimSeq ε λ₀ h x₀ n‖ ≤ e^((1 + L)(λ_n − λ₀)) (‖x λ₀ − x₀‖ + M₂ h_max (λ_n − λ₀)/2).

Route: by 5.1 the solution is mild for `lsnrFamily` with weight `−σ`, where `|σ| ≤ 1`; by 5.2 the
DDIM iterates are `oneStepSeq (expEulerIncrement lsnrFamily (−σ) ε)`; apply 3.3 with `M = 1`,
`ω = 1`, `B = 1`. (Lu, Zhou, Bao, Chen, Li and Zhu 2022, Theorem 3.2, state first order for
DPM-Solver-1 under the regularity conditions of their Appendix B.1, with an unspecified constant;
the bound above is proved here.)

**Checks.**

- Gaussian example of 5.1, `x₀ = x(−3) = 1`, uniform meshes on `[−3, 2]`: the error at `λ = 2` is
  `0.0197…` for ten steps and `0.00508…` for forty, a ratio of about `3.9`, as for a first-order
  method.
- `n = 0`: the bound is `‖x λ₀ − x₀‖`.

*Needs:* 3.3, 5.1, 5.2.

### Examples

The Gaussian example of 5.1; mixtures of two Gaussians on `ℝ`, for which `ε*` is explicit and
Lipschitz on every bounded `λ`-interval.

### Dependencies

Layer 5 uses 1.1, 3.1, 3.3, ScoreBasedDiffusion (Conventions and 1.2), FlowMatching 4.1 and
DenoisingDiffusion 3.3 for the identification in 5.1, and Mathlib's `Real.exp` and `Real.sqrt`.

## Downstream consumers

The error bound 5.3 is the discretization part of a guarantee for the deterministic DDIM sampler.
It is pathwise, for one solution of the equation with the learned noise predictor; a bound on the
distance between the data law and the law of the DDIM output would combine it, through a
coupling of the exact and the discrete flows and with constants `L` and `M₂` uniform over the
starting points, with a comparison of the exact and the learned flows such as FlowMatching 5.2
(the Wasserstein bound). The bounds of Layers 3 and 4 apply to the time discretization of semilinear
parabolic equations through the semigroup families of 1.1.

## Scope and ownership

This roadmap owns: evolution families with a growth bound as the linear part of a semilinear
equation and mild solutions in this sense, the one-sided growth bound 1.2, the φ-functions on a
normed algebra with their recursion and bounds, the exponential Euler method and the
second-order exponential Runge–Kutta method of Layer 4 with weights, their defect bounds and
their global error bounds with constants that depend on the growth bound and not on the linear
part, the log-SNR coefficients, the identity of DDIM with the exponential Euler method, and the
error bound of DDIM.

Already in the libraries, and not targets here: the operator exponential with its composition law
and the Duhamel formulas `exp (tB) x − x = ∫₀ᵗ exp (uB) (B x) du` and, in a complete normed algebra,
`exp (x + h) − exp x = ∫₀¹ exp ((1 − t)(x + h)) h exp (t x) dt` (Tau Ceti
`ContinuousLinearMap.exp_add_smul`, `ContinuousLinearMap.exp_smul_apply_sub_eq_intervalIntegral`,
`TauCeti.exp_add_sub_exp_eq_integral`); the propagator of a continuous path of bounded operators
as a Dyson series (Tau Ceti `TauCeti.dysonSeriesLeft`); strongly continuous semigroups, the
semigroup `exp (tA)` of a bounded operator with `‖exp (tA)‖ ≤ e^(t‖A‖)`, growth bounds, the
mild solutions of the homogeneous Cauchy problem and their identification with orbits, and the
Hilbert-space form of dissipativity (Tau Ceti `TauCeti.Semigroups.StronglyContinuousSemigroup`,
`StronglyContinuousSemigroup.ofBounded_hasGrowthBound`, `TauCeti.Semigroups.IsMildSolution`,
`IsMildSolution.eq_realOperator`, `TauCeti.Semigroups.isDissipative_iff_real_inner_nonpos`), which
OneParameterSemigroups (Completed) specifies; the discrete Grönwall inequality (Mathlib
`discrete_gronwall_prod_general`). The two-parameter evolution families, their growth bounds and
the mild solutions of 1.1 are not Tau Ceti notions: a semigroup gives an evolution family, and
for `F = 0` a Tau Ceti mild solution is a mild solution in the sense of 1.1, as proved there.

Left to other roadmaps:

- OneStepMethodsForODEs owns meshes, one-step methods, the one-step defect (1.1, 1.2), the
  discrete stability and convergence theorems (1.3, 1.4), and the explicit Euler and Heun
  methods (3.1, 3.2). Its three definitions are repeated verbatim in `Suggested.lean` only so
  that the statements elaborate. Its convergence theorem applies to the exponential methods too,
  with the Lipschitz constant of their increment functions, which grows with the norm of the
  linear part (Check of 3.3); 3.3 and 4.3 here replace that constant by the growth bound, and
  with zero linear part their constants are those of its 3.1 and 3.2 (Checks).
- DiracScatteringAndNonlinearFourierTransform 1.3 owns the propagator of a time-dependent bounded
  linear system and its variation-of-constants formula; 1.1 here uses them for the
  time-dependent case and does not restate them.
- ScoreBasedDiffusion owns the Gaussian noising paths and the variance-preserving path
  (Conventions, Layer 1); FlowMatching Layer 4 owns the probability-flow equation and its field;
  DenoisingDiffusion 3.3 owns the noise prediction. Layer 5 uses them only to identify its
  equation with the probability-flow equation; its theorems are stated for an arbitrary noise
  predictor `ε`.
- StochasticCalculus 9.4 names the variation of constants for matrix linear equations as part of
  its examples of stochastic equations; nothing here concerns stochastic equations.

Out of scope: exponential multistep, Rosenbrock, Magnus and Lawson methods; exponential
Runge–Kutta methods of order three and higher and the stiff order conditions in general;
analytic semigroups and the parabolic smoothing estimates with fractional powers; highly
oscillatory problems; the approximation of matrix functions (Krylov and Chebyshev methods);
stochastic DDIM and higher-order diffusion samplers; and every implementation or count of
function evaluations.

## Exact supplier contracts

### From Mathlib

- `NormedSpace.exp` (`Mathlib/Analysis/Normed/Algebra/Exponential.lean`): the exponential of a
  normed algebra, `Real.exp` on `ℝ`; `hasDerivAt_exp_smul_const`
  (`Mathlib/Analysis/SpecialFunctions/Exponential.lean`): for `x` in a complete normed algebra,
  `u ↦ exp (u • x)` has derivative `exp (t • x) * x` at `t`.
- `HasDerivWithinAt.inner` (`Mathlib/Analysis/InnerProductSpace/Calculus.lean`): the derivative
  of `t ↦ ⟪f t, g t⟫`; `image_le_of_liminf_slope_right_le_deriv_boundary`
  (`Mathlib/Analysis/Calculus/MeanValue.lean`): comparison of a continuous real function with a
  bound through right slopes.
- `intervalIntegral.integral_eq_sub_of_hasDerivAt`,
  `intervalIntegral.integral_comp_mul_deriv` (`Mathlib/MeasureTheory/Integral/IntervalIntegral/`)
  and `intervalIntegral.norm_integral_le_of_norm_le`: the fundamental theorem of calculus, the
  substitution rule and the norm bound for interval integrals, for `a ≤ b` and an integrable
  majorant.
- `discrete_gronwall_prod_general` (`Mathlib/Analysis/ODE/DiscreteGronwall.lean`): if
  `u (n + 1) ≤ c n * u n + b n` with `0 ≤ c n` for `n ≥ n₀`, then `u n` is bounded by the product
  formula; `Real.add_one_le_exp`: `x + 1 ≤ exp x`.
- `LipschitzWith`, `LipschitzOnWith`, `HasDerivWithinAt`, `Real.sqrt`.

### From Tau Ceti

- `ContinuousLinearMap.exp_add_smul` (`TauCeti/Analysis/Normed/Operator/Exponential.lean`): for
  `A : X →L[𝕜] X` on a Banach space, `exp ((s + t) • A) = exp (s • A) ∘ exp (t • A)`.
- `TauCeti.exp_add_sub_exp_eq_integral` (`TauCeti/Analysis/SpecialFunctions/Exponential.lean`):
  in a complete normed real algebra,
  `exp (x + h) − exp x = ∫₀¹ exp ((1 − t) • (x + h)) * h * exp (t • x) dt`.
- `TauCeti.dysonSeriesLeft` (`TauCeti/Analysis/ODE/DysonSeries.lean`): for a continuous path `M`
  of bounded operators on a Banach space, every solution of `w' = M(t) w` is
  `w t = dysonSeriesLeft M t (w 0)` (`TauCeti.eq_dysonSeriesLeft_apply`); cited in 1.1 for the
  agreement with the propagator.
- `TauCeti.Semigroups.StronglyContinuousSemigroup.ofBounded`
  (`TauCeti/Analysis/Semigroups/BoundedGenerator/Basic.lean`): for `A : X →L[ℝ] X` on a Banach
  space, the semigroup `t ↦ exp (t • A)`, with `ofBounded_hasGrowthBound`:
  `(ofBounded A).HasGrowthBound ‖A‖ 1`.
- `TauCeti.Semigroups.StronglyContinuousSemigroup` with `realOperator`, `realOperator_zero`
  (`S.realOperator 0 = id`) and `realOperator_add` (`S(s + t) = S(s) ∘ S(t)` for `s, t ≥ 0`)
  (`TauCeti/Analysis/Semigroups/Basic.lean`), `continuous_realOperator_apply` (on a Banach space,
  `t ↦ S(t) x` is continuous) and `StronglyContinuousSemigroup.HasGrowthBound S ω M`
  (`1 ≤ M` and `‖S(t)‖ ≤ M e^(ωt)` for `t ≥ 0`) (`TauCeti/Analysis/Semigroups/GrowthBound.lean`).
- `TauCeti.Semigroups.IsMildSolution` (`TauCeti/Analysis/Semigroups/CauchyProblem/Basic.lean`):
  mild solutions of `u' = Au`, `u(0) = x`, for a generator `A`: continuity on `[0, ∞)`,
  `u 0 = x`, and `∫_(0,t] u ∈ D(A)` with `A ∫_(0,t] u = u t − x`; and
  `IsMildSolution.eq_realOperator` (`CauchyProblem/Uniqueness.lean`): a mild solution for the
  generator of `S` is the orbit `t ↦ S(t) x` at every `t ≥ 0`.
- `TauCeti.Semigroups.isDissipative_iff_real_inner_nonpos`
  (`TauCeti/Analysis/Semigroups/Dissipative/Hilbert.lean`): on a real inner product space an
  operator is dissipative if and only if `⟪A x, x⟫ ≤ 0` on its domain; cited in 1.2 for comparison.

### From TauCetiRoadmap.OneStepMethodsForODEs

- 1.1 `meshNode` and 1.2 `oneStepSeq`, `oneStepDefect`, with the conventions recalled above; the
  theorems of 3.3 and 4.3 are stated for `oneStepSeq`.
- 1.4 `norm_sub_oneStepSeq_le` (the convergence theorem with a Lipschitz increment function), 3.1
  `explicitEuler_error_le` and 3.2 `heun` with `heun_defect_le`, used only in Checks for
  comparison.

### From TauCetiRoadmap.DiracScatteringAndNonlinearFourierTransform

- 1.3: for a coefficient `P` integrable on an interval, on a Banach space, the propagator
  `N_P(t, s)` with `N_P(t, t) = 1`, `N_P(t, r) N_P(r, s) = N_P(t, s)`, norm continuity, the bound
  `‖N_P(t, s)‖ ≤ exp |∫_s^t ‖P‖|`, and the variation-of-constants formula
  `Y(t) = N_P(t, t₀) y₀ + ∫_(t₀)^t N_P(t, s) F(s) ds` for the solutions of 1.2 of that roadmap.

### From TauCetiRoadmap.ScoreBasedDiffusion

- Conventions: noising paths `(c, s)` with drift coefficient `c′/c` and diffusion coefficient
  `2(s s′ − s² c′/c)`; `vpSignal` and `vpNoise`. 1.2: the Fokker–Planck equation of the smoothed
  density along a noising path, used in 5.1 only to identify the equation.

### From TauCetiRoadmap.FlowMatching

- 4.1: the probability-flow field `f − (1/2) rowDivergence A − (1/2) A ∇p/p`, which is
  `f − (g²/2) ∇ log p` for `A = g² · id`; used in 5.1 only to identify the equation.

### From TauCetiRoadmap.DenoisingDiffusion

- 3.3: the noise prediction `−s • noisyScore μ₀ c s` minimizes the noise-prediction loss; used
  in 5.1 to write the probability-flow field in noise-prediction form.

## References

- M. Hochbruck and A. Ostermann, *Exponential integrators*, Acta Numerica **19** (2010), 209–286,
  doi:10.1017/S0962492910000048; the published version as deposited by the first author's
  institution in the KIT repository (`publikationen.bibliothek.kit.edu/1000024914`). Assumption 2.2
  with (2.6), Example 2.3, (2.10), (2.11), Lemma 2.4, (2.19), Example 2.12 with (2.29), (2.31),
  (2.32), Theorem 2.14, Theorem 2.17 and Example 2.18 with (2.39).
- C. Lu, Y. Zhou, F. Bao, J. Chen, C. Li and J. Zhu, *DPM-Solver: a fast ODE solver for diffusion
  probabilistic model sampling in around 10 steps*, NeurIPS 2022, arXiv:2206.00927v3: Section 2.2
  with (2.7), Section 3.1 with (3.1)–(3.4) and Proposition 3.1, (3.7), Theorem 3.2, Section 4.1
  with (4.1).
- J. Song, C. Meng and S. Ermon, *Denoising diffusion implicit models*, ICLR 2021,
  arXiv:2010.02502v4: (12) and Section 4.3 with (13).

# Roadmap: optimal control and Hamilton–Jacobi equations

**Summary.** A deterministic optimal control problem steers the state of a system `ẏ = f(y, u)` in
`ℝⁿ` by choosing, at each time, a control value `u` in a set `U ⊆ ℝᵐ`, so as to minimize a running
cost integrated up to a fixed final time `T` plus a cost on the final state. This roadmap develops
the two classical answers to such problems: Bellman's dynamic programming, which leads to a
first-order partial differential equation for the optimal cost, and Pontryagin's maximum
principle, which gives a necessary condition along a single optimal trajectory. Controls are
measurable functions of time and trajectories solve the equation in integral form. The standing
assumptions are that `U` is compact and nonempty, that the dynamics and the running cost are
continuous, bounded and Lipschitz in the state uniformly in the control, and that the final cost is
bounded and Lipschitz.

The headline theorems are these.

- *Dynamic programming and the value function.* The value function, the least cost from a given
  starting time and state, satisfies the dynamic programming principle, is bounded and Lipschitz
  on `[0, T] × ℝⁿ`, and is a viscosity solution of the Hamilton–Jacobi–Bellman equation
  `−∂ₜv + H(x, Dₓv) = 0`, where `H(x, p)` is the largest value of `−p(f(x, u)) − L(x, u)` over
  `u ∈ U`. In general it is not differentiable.
- *Comparison and uniqueness.* For a Hamiltonian that is uniformly continuous in `p`, uniformly in
  `x`, and satisfies `|H(x, p) − H(y, p)| ≤ ω(‖x − y‖ (1 + ‖p‖))` for a function `ω` tending to `0`
  at `0`, a bounded continuous viscosity subsolution lies
  below a bounded continuous viscosity supersolution as soon as it does at the final time. Hence
  the value function is the only bounded continuous viscosity solution that equals the final cost
  at time `T`.
- *Verification.* If a continuously differentiable function satisfies the Hamilton–Jacobi–Bellman
  inequality for every control value, equals the final cost at time `T`, and an admissible control
  attains equality along its trajectory, then that control is optimal and the function gives its
  cost.
- *Pontryagin's maximum principle.* For data continuously differentiable in the state, an optimal
  control of the fixed-time problem with free final state minimizes `u ↦ p(f(y, u)) + L(y, u)` at
  almost every time, where the costate `p` solves the adjoint linear equation backwards from the
  derivative of the final cost.

Examples in one dimension, with `ẏ = u` and `|u| ≤ 1`, show value functions with kinks of both
kinds and a Lipschitz function that solves the equation almost everywhere without being the value
function. The scalar linear-quadratic problem is a worked example of the verification theorem.

The roadmap builds on Mathlib's calculus, its Lebesgue differentiation theorem and its fundamental
theorem of calculus for absolutely continuous functions. From Tau Ceti it uses the existence and
uniqueness of solutions of linear equations with measurable coefficients, for the adjoint and the
variational equations, and Grönwall's inequality in integral form. The roadmap
MarkovDecisionProcesses develops dynamic programming in discrete time and places continuous-time
control outside its scope; nothing of it is used here.

## How to read the build

Layer 1 below defines control problems, admissible pairs and their costs, and proves existence and
uniqueness of trajectories. Layer 2 depends on Layer 1: it defines the value function and proves
the dynamic programming principle and the Lipschitz estimate. Layer 3 defines viscosity solutions
and the Hamiltonian and shows, from Layer 2, that the value function is a viscosity solution.
Layer 4 proves the comparison principle, which uses only the definitions of Layer 3, and deduces
uniqueness from Layers 2 and 3. Layer 5, the verification theorem, uses the definitions of Layers 1
and 3 and none of their theorems. Layer 6, the maximum principle, uses Layer 1. Within a layer the
sections are in build order.

## Conventions

- **State and control spaces.** The state space is `EuclideanSpace ℝ (Fin n)`, written `ℝⁿ`, and
  control values lie in a set `U` of `EuclideanSpace ℝ (Fin m)`, written `ℝᵐ`. A covector is a
  continuous linear form `p : ℝⁿ →L[ℝ] ℝ`; its norm is the operator norm, which is the Euclidean
  norm of the vector representing it. The derivative of a scalar function is such a form, so no
  gradient is taken.
- **Time and space-time.** Time comes first: functions of time and state are functions on
  `ℝ × ℝⁿ`. For `φ : ℝ × ℝⁿ → ℝ` the time derivative is `∂ₜφ(z) = Dφ(z)(1, 0)` and the spatial
  derivative is the covector `Dₓφ(z) = Dφ(z) ∘ (x ↦ (0, x))`, both read off Mathlib's `fderiv`.
- **Controls and trajectories.** A control is a measurable function `α : ℝ → ℝᵐ` with `α s ∈ U` at
  every time. Its trajectory from the initial time `t` and the initial state `x` is a solution in
  Carathéodory's sense: a curve `y`, continuous on `[t, T]`, with
  `y s = x + ∫ r in t..s, f (y r) (α r)` for every `s ∈ [t, T]`. Nothing is asked of `y` outside
  `[t, T]`, and the values of `α` there, which must still lie in `U`, do not affect the trajectory
  or the cost. An admissible pair also asks that `s ↦ f(y s, α s)` and `s ↦ L(y s, α s)` be
  integrable on `[t, T]`, so that every integral above is a genuine Lebesgue integral; under the
  standing assumptions of 2.1 this holds for every control.
- **Minimization.** The cost of a pair is `∫ s in t..T, L(y s, α s) + g(y T)`, and the value
  function is the infimum of the costs. Mathlib's `sInf` of an empty set, or of a set of reals not
  bounded below, is `0`, so the value function means the least cost only when the costs form a
  nonempty set bounded below; under the standing assumptions they do (2.1).
- **The Hamilton–Jacobi–Bellman equation** is written `−∂ₜv + H(x, Dₓv) = 0` with
  `H(x, p) = sup_{u ∈ U} (−p(f(x, u)) − L(x, u))`, which equals
  `−∂ₜv − min_{u ∈ U} (Dₓv(f(x, u)) + L(x, u)) = 0` and is Liberzon's form (5.38). The sign matters
  for viscosity solutions: the value function solves this equation in the viscosity sense and, in
  general, not the equation multiplied by `−1` (Check of 3.4).
- **Viscosity solutions** are tested with functions `φ : ℝ × ℝⁿ → ℝ` of class `C¹` on the whole
  space, at local extrema of `u − φ` relative to the domain `Ω`. Every domain used is open, so
  these are ordinary local extrema. Testing with `C¹` functions gives at least as many tests as
  testing with smooth ones, so a solution in the sense used here is one in the sense of Calder's
  notes, which test with smooth functions.
- **Degenerate horizons.** Statements about `[t, T]` assume `t ≤ T` where they would otherwise be
  false; when `t > T` the interval is empty and the conditions on admissible pairs are void.

## Layer 1: controlled trajectories

### 1.1 Control problems, admissible pairs and costs

Define `ControlProblem n m`, a structure with fields `U` (a set of `ℝᵐ`), `f : ℝⁿ → ℝᵐ → ℝⁿ`, the
running cost `L : ℝⁿ → ℝᵐ → ℝ`, the terminal cost `g : ℝⁿ → ℝ` and the terminal time `T : ℝ`.
Define the predicate `ControlProblem.IsAdmissiblePair P t x α y` as in the Conventions: `α` is
measurable with values in `U`, `y` is continuous on `[t, T]`, `s ↦ f(y s, α s)` and
`s ↦ L(y s, α s)` are integrable on `[t, T]`, and `y s = x + ∫ r in t..s, f (y r) (α r)` for
`s ∈ [t, T]`. Define `ControlProblem.cost P t α y = ∫ s in t..T, L (y s) (α s) + g (y T)` and
`ControlProblem.costs P t x`, the set of costs of the admissible pairs from `(t, x)`.

- At `s = t` the integral equation gives `y t = x`; for `t = T` every admissible pair has cost
  `g x`.
- If `t ≤ τ ≤ T` and `(α, y)` is admissible from `(t, x)`, then `(α, y)` is admissible from
  `(τ, y τ)`, and its cost from `t` is `∫ s in t..τ, L(y s, α s)` plus its cost from `τ`.
- If `t ≤ τ ≤ T`, `(α, y)` is admissible from `(t, x)` and `(β, z)` from `(τ, y τ)`, the control equal to `α`
  before `τ` and to `β` from `τ` on, with the trajectory equal to `y` on `[t, τ]` and to `z` on
  `[τ, T]`, is admissible from `(t, x)` (Mathlib `Measurable.piecewise`).

**Checks.**
- With `n = m = 1`, `U = [−1, 1]`, `f(x, u) = u` and the constant control `1`, the trajectory from
  `(t, x)` is `y s = x + (s − t)`. With `L = 0` and `g(x) = min(|x|, 1)`, its cost from `(0, 0)`
  with `T = 2` is `g(2) = 1`, while the constant control `0` has cost `0`.
- Integrability is part of admissibility because Mathlib's integral of a function that is not
  integrable is `0`. With `U = ℝ`, `f(x, u) = u`, `L(x, u) = u²/2` and the control
  `α(s) = s^(-1/2)` on `(0, 1]`, the running cost `1/(2s)` is not integrable on `[0, 1]`; without
  the integrability clause this pair would be given a finite cost.

*Needs:* Mathlib `Measurable`, `ContinuousOn`, `IntegrableOn`, interval integrals,
`Measurable.piecewise`. (Proved here.)

### 1.2 Existence and uniqueness of trajectories

Prove `ControlProblem.exists_isAdmissiblePair`: if `U` is compact, `f` and `L` are continuous on
`ℝⁿ × U` and `f(·, u)` is `K`-Lipschitz for every `u ∈ U`, then for every measurable control `α`
with values in `U`, every `t ≤ T` and every `x` there is a trajectory `y` with `(α, y)` admissible
from `(t, x)`. Prove `ControlProblem.eqOn_of_isAdmissiblePair`: if `f(·, u)` is `K`-Lipschitz for
every `u ∈ U`, two admissible pairs from `(t, x)` with the same control have trajectories that
agree on `[t, T]` (Liberzon, §3.3.1, pp. 67–69, for local existence and uniqueness with measurable
locally bounded controls, stated there without proof).

Route: the map `s ↦ f(y, α s)` is measurable in `s` for fixed `y` and Lipschitz in `y`, and
`‖f(y, u)‖ ≤ C + K‖y‖` with `C` the maximum of `‖f(0, u)‖` over the compact `U`. Some iterate of
the Picard map `y ↦ x + ∫ r in t..·, f(y r, α r)` on `C([t, T], ℝⁿ)` is a contraction, by the
estimate `(K (s − t))^k / k!`, as in Tau Ceti's proof of
`TauCeti.exists_continuousOn_eq_forall_mem_Icc_eq_picard` for linear equations. Along a
continuous `y` the functions `s ↦ f(y s, α s)` and `s ↦ L(y s, α s)` are measurable and bounded on
`[t, T]`, since `(y s, α s)` stays in a compact subset of `ℝⁿ × U`. Uniqueness: the difference of
two trajectories satisfies `‖y₁ s − y₂ s‖ ≤ K ∫ r in t..s, ‖y₁ r − y₂ r‖`, so it vanishes by
Grönwall's inequality (`TauCeti.le_mul_exp_of_le_add_mul_integral` with `c = 0`).

**Checks.**
- Mathlib's `IsPicardLindelof` asks for a field continuous in time, which `s ↦ f(y, α s)` is not
  for the control `α = 1` on `[0, 1)` and `−1` afterwards; the trajectory of `ẏ = α` from `(0, 0)`
  is `y s = min(s, 2 − s)`, which is not differentiable at `s = 1`.
- Without the Lipschitz condition uniqueness fails: for `f(x, u) = 2 √|x|` (continuous, not
  Lipschitz at `0`) both `y = 0` and `y s = (s − t)²` solve the equation from `(t, 0)`.

*Needs:* 1.1; Mathlib `ODE.picard`, interval integrals, `IsCompact.exists_isMaxOn`; Tau Ceti
`TauCeti.le_mul_exp_of_le_add_mul_integral`. (Proved here, following the route of the cited Tau
Ceti theorem.)

### 1.3 Grönwall estimates

Prove the two estimates used in Layers 2 and 3, which we call the trajectory estimates. If `f` is
`K`-Lipschitz in the state uniformly over `U` and `(α, y)` and `(α, y')` are admissible from
`(t, x)` and `(t, x')`, then `‖y s − y' s‖ ≤ e^(K (s − t)) ‖x − x'‖` for `s ∈ [t, T]`. If
`‖f(x, u)‖ ≤ M` on `ℝⁿ × U` and `(α, y)` is admissible from `(t, x)`, then `‖y s − x‖ ≤ M (s − t)`
for `s ∈ [t, T]`. (Proved here.)

Route: the first is Grönwall's inequality for `s ↦ ‖y s − y' s‖`, which is at most
`‖x − x'‖ + K ∫ r in t..s, ‖y r − y' r‖`; the second bounds the integral of `f` by `M (s − t)`.

**Checks.**
- For `f(x, u) = −x + u` (`K = 1`) and a common control, `y s − y' s = e^(−(s − t)) (x − x')`, below
  the bound `e^(s − t) ‖x − x'‖`; for `f(x, u) = x` (`K = 1`) the first estimate is an equality.

*Needs:* 1.1; Tau Ceti `TauCeti.le_mul_exp_of_le_add_mul_integral`.

### Examples

The trajectories of `ẏ = u` and of `ẏ = −y + u` with `U = [−1, 1]` under constant and bang-bang
controls; the two solutions of `ẏ = 2 √|y|` from `0`.

### Dependencies

Mathlib `Measurable`, `Measurable.piecewise`, `ContinuousOn`, `IntegrableOn`, interval integrals,
`ODE.picard`, `IsCompact.exists_isMaxOn`; Tau Ceti `TauCeti.le_mul_exp_of_le_add_mul_integral`. No
other layer.

## Layer 2: the value function and dynamic programming

### 2.1 Standing assumptions and the value function

Define `ControlProblem.Assumptions P`: `U` is compact and nonempty; `f` and `L` are continuous on
`ℝⁿ × U`; `‖f(x, u)‖ ≤ M_f`, `|L(x, u)| ≤ M_L` and `|g(x)| ≤ M_g` for all `x` and `u ∈ U`; `f(·, u)`
and `L(·, u)` are Lipschitz with constants `K_f` and `K_L` independent of `u ∈ U`, and `g` is
`K_g`-Lipschitz. Liberzon (§5.3.3, p. 141) names, as hypotheses under which the value function is
locally Lipschitz and the unique viscosity solution, uniformly continuous data with bounded
derivatives in the state and a compact `U`; here Lipschitz constants take the place of the bounds
on derivatives, and `f`, `L` and `g` are also bounded. Define
`ControlProblem.valueFunction P t x = sInf (costs P t x)`.

- Under the standing assumptions, for `t ≤ T` the set of costs from `(t, x)` is nonempty (a
  constant control and 1.2) and bounded below by `−M_L (T − t) − M_g`. So the value function is
  the greatest lower bound of the costs, `|v(t, x)| ≤ M_L (T − t) + M_g`, and `v(T, x) = g(x)`.

**Checks.**
- For `ẏ = u`, `U = [−1, 1]`, `L = 0` and `g(x) = min(|x|, 1)`, the trajectories from `(t, x)` reach
  exactly the points of `[x − (T − t), x + (T − t)]` at time `T`, so
  `v(t, x) = min(1, max(0, |x| − (T − t)))`. With `T = 2`: `v(1, 0.5) = 0`, `v(1, 1.5) = 0.5`,
  `v(0, 4) = 1`.
- With `g(x) = −min(|x|, 1)` instead, `v(t, x) = max(−1, −(|x| + T − t))`; with `T = 2`,
  `v(1.5, 0) = −0.5` and `v(0, 0) = −1`.

*Needs:* 1.1, 1.2. (Proved here.)

### 2.2 The dynamic programming principle

Prove `ControlProblem.valueFunction_eq_sInf`: under the standing assumptions, for `t ≤ τ ≤ T` and
every `x`, `v(t, x)` is the infimum, over the admissible pairs `(α, y)` from `(t, x)`, of
`∫ s in t..τ, L(y s, α s) + v(τ, y τ)` (Liberzon, §5.1.2, equation (5.4), p. 128, with one
inequality proved there and the other left as Exercise 5.1, p. 129).

Route: splitting the cost at `τ` (1.1) gives one inequality, since the cost from `τ` is at least
`v(τ, y τ)`. For the other, given an admissible pair from `(t, x)` and `ε > 0`, choose an admissible
pair from `(τ, y τ)` whose cost is within `ε` of `v(τ, y τ)` and concatenate the two (1.1); no
measurable selection is needed, since only one point `(τ, y τ)` is involved.

**Checks.**
- At `τ = t` the right-hand side is `v(t, x)`, since `y t = x`; at `τ = T` it is the infimum of the
  costs, since `v(T, ·) = g`.
- For the first example of 2.1, with `L = 0`, the principle says that `v(t, x)` is the minimum of
  `v(τ, ·)` over `[x − (τ − t), x + (τ − t)]`; with `T = 2`, `t = 0`, `τ = 1` and `x = 2.5` both sides
  are `0.5`.

*Needs:* 1.1, 1.2, 2.1. (Proved here, following the cited route.)

### 2.3 Boundedness and Lipschitz continuity

Prove `ControlProblem.valueFunction_bounded_lipschitz`: under the standing assumptions the value
function is bounded on `[0, T] × ℝⁿ`, and there is `C` with
`|v(t, x) − v(s, y)| ≤ C (|t − s| + ‖x − y‖)` for all `t, s ∈ [0, T]` and all `x`, `y` (Liberzon,
§5.3.3, p. 141, states local Lipschitz continuity without proof; the global bound here uses the
boundedness in 2.1).

Route: for a common control, the trajectory estimates of 1.3 give
`|v(t, x) − v(t, x')| ≤ C_x ‖x − x'‖` with `C_x = (K_L T + K_g) e^(K_f T)` when `0 ≤ t ≤ T`. In time,
for `t ≤ s`, the dynamic programming principle with `τ = s` and the second trajectory estimate give
`|v(t, x) − v(s, x)| ≤ (M_L + C_x M_f)(s − t)`.

**Checks.**
- The first example of 2.1 has `M_f = 1`, `K_f = K_L = M_L = 0`, `K_g = 1`, so the bounds give
  constant `1` in each variable, which `v = min(1, max(0, |x| − (T − t)))` attains.
- The value function need not be differentiable: in the second example of 2.1, `v(t, x) = −|x| −
  (T − t)` near `x = 0` when `T − t < 1`.

*Needs:* 1.3, 2.1, 2.2. (Proved here, following the cited route.)

### Examples

The two value functions of 2.1, computed against the reachable sets, and the dynamic programming
principle for them at the grid points `t, τ ∈ {0, 0.5, 1, 1.5, 2}`.

### Dependencies

Layer 1 (1.1, 1.2, 1.3); Mathlib `sInf`, `Measurable.piecewise`; Tau Ceti
`TauCeti.le_mul_exp_of_le_add_mul_integral`.

## Layer 3: viscosity solutions of the Hamilton–Jacobi–Bellman equation

### 3.1 Partial derivatives and viscosity solutions

Define `timeDeriv φ z = fderiv ℝ φ z (1, 0)` and
`spaceDeriv φ z = (fderiv ℝ φ z).comp (ContinuousLinearMap.inr ℝ ℝ ℝⁿ)`. For
`H : ℝⁿ → (ℝⁿ →L[ℝ] ℝ) → ℝ`, a set `Ω ⊆ ℝ × ℝⁿ` and `u : ℝ × ℝⁿ → ℝ`, define:

- `IsViscositySubsolution H Ω u`: for every `φ` of class `C¹` and every `z ∈ Ω` at which `u − φ` has
  a local maximum relative to `Ω`, `−∂ₜφ(z) + H(x, Dₓφ(z)) ≤ 0`, where `x` is the state coordinate
  of `z`;
- `IsViscositySupersolution H Ω u`: the same at local minima, with `≥ 0`;
- `IsViscositySolution H Ω u`: both.

This is Liberzon's definition, §5.3.2, p. 140, with `C¹` test functions, for the space-time
variable as in §5.3.3, p. 141; Calder, Definition 2.1, p. 15, uses smooth test functions.

**Checks.**
- On `Ω = (0, 2) × ℝ` with `H(x, p) = |p|`, the function `w(t, x) = min(0, |x| − (2 − t))` is
  Lipschitz and satisfies `−∂ₜw + |∂ₓw| = 0` wherever it is differentiable, but it is not a viscosity
  supersolution: at `(1, 0)` the test function `φ(t, x) = t − 2` touches it from below
  (`w − φ = |x| ≥ 0` near `(1, 0)`) with `∂ₜφ = 1` and `Dₓφ = 0`, and `−1 + 0 < 0`. So "Lipschitz and
  a solution almost everywhere" is a weaker notion than "viscosity solution".
- Exchanging maxima and minima in the definition changes the notion: with them exchanged, `w`
  above would pass both tests at `(1, 0)`, since no test function touches it from above there, and
  those touching from below have `(∂ₜφ, ∂ₓφ) = (1, q)` with `|q| ≤ 1`, for which `−1 + |q| ≤ 0`.

*Needs:* Mathlib `fderiv`, `ContinuousLinearMap.inr`, `ContDiff`, `IsLocalMaxOn`, `IsLocalMinOn`.
(Proved here.)

### 3.2 The Hamiltonian of a control problem

Define `ControlProblem.hamiltonian P x p = sSup ((fun u ↦ −p (f x u) − L x u) '' U)`. Prove, under
the standing assumptions, the three facts that we call the Hamiltonian estimates:

- the supremum is attained, since `u ↦ −p(f(x, u)) − L(x, u)` is continuous on the compact nonempty
  `U`;
- `|H(x, p) − H(x, q)| ≤ M_f ‖p − q‖`;
- `|H(x, p) − H(y, p)| ≤ (K_f ‖p‖ + K_L) ‖x − y‖ ≤ max(K_f, K_L) ‖x − y‖ (1 + ‖p‖)`.

So `H` satisfies the hypotheses of 4.1 with `ω(r) = max(K_f, K_L) r` and `ω₁(r) = M_f r`. (Proved
here; Calder, Lemma 4.5, p. 35, proves the estimate in `x` for a Hamiltonian of the same form
coming from a problem of the calculus of variations.)

**Checks.**
- For `ẏ = u`, `U = [−1, 1]`, `L = 0`: `H(x, p) = |p|`.
- The factor `1 + ‖p‖` cannot be dropped: for `f(x, u) = u sin x`, `U = [−1, 1]`, `L = 0`, one has
  `H(x, p) = |p| |sin x|` and `|H(0.01, p) − H(0, p)| = |p| sin 0.01`, which is unbounded in `p`;
  the bound `|H(x, p) − H(y, p)| ≤ |x − y| (1 + |p|)` holds, since `|sin x − sin y| ≤ |x − y|`.

*Needs:* 2.1; Mathlib `sSup`, `IsCompact.exists_isMaxOn`. (Proved here.)

### 3.3 Classical solutions

Prove that a function `u` of class `C¹` on `ℝ × ℝⁿ` is a viscosity solution of
`−∂ₜu + H(x, Dₓu) = 0` on an open set `Ω` if and only if `−∂ₜu(z) + H(x, Dₓu(z)) = 0` at every
`z ∈ Ω`, for any `H` (Liberzon, §5.3.2, p. 140, remark after the definition, for the direction from
viscosity to classical solutions at points of differentiability). Route: test with
`φ = u` for one direction; for the other, at a local extremum of `u − φ` in the open set `Ω` the
derivatives of `u` and `φ` agree (Mathlib `IsLocalMax.hasFDerivAt_eq_zero`). (Proved here.)

**Checks.**
- For `H(x, p) = |p|` on `(0, 2) × ℝ`, `u(t, x) = x − (2 − t)` is a classical and so a viscosity
  solution; `u(t, x) = x + (2 − t)` is neither, since `−∂ₜu + |∂ₓu| = 2`.

*Needs:* 3.1; Mathlib `IsLocalMax.hasFDerivAt_eq_zero`.

### 3.4 The value function is a viscosity solution

Prove `ControlProblem.isViscositySolution_valueFunction`: under the standing assumptions,
`(t, x) ↦ v(t, x)` is a viscosity solution of `−∂ₜv + H(x, Dₓv) = 0` on `(0, T) × ℝⁿ`, with `H` the
Hamiltonian of 3.2 (Liberzon, §5.3.3, pp. 141–142, with the subsolution property proved there and
the supersolution property left as Exercise 5.7, p. 142; Calder, Theorem 4.6, p. 35, proves the
analogue for a stationary problem of the calculus of variations on a bounded domain).

Route: subsolution. If `v − φ` has a local maximum at `(t, x)` and `u ∈ U`, apply the dynamic
programming principle with the constant control `u` on `[t, t + h]`: `v(t, x)` is at most
`∫ L + v(t + h, y(t + h))`, hence at most `∫ L + φ(t + h, y(t + h)) − φ(t, x) + v(t, x)`. Divide by `h`
and let `h → 0⁺`, using the continuity of `f`, `L` and `Dφ` and the trajectory estimate of 1.3:
`0 ≤ ∂ₜφ + Dₓφ(f(x, u)) + L(x, u)` for every `u`, which is the subsolution inequality.
Supersolution: if `v − φ` has a local minimum at `(t, x)` and the inequality failed, then
`min_{u ∈ U} (∂ₜφ + Dₓφ(f(x, u)) + L(x, u)) > 0`, so `∂ₜφ + Dₓφ(f(·, u)) + L(·, u) ≥ θ > 0` near
`(t, x)` for every `u ∈ U`, uniformly by compactness of `U`; along any admissible pair from `(t, x)`
on `[t, t + h]` this gives `∫ L + v(t + h, y(t + h)) ≥ v(t, x) + θ h`, contradicting the dynamic
programming principle.

**Checks.**
- For the first example of 2.1 (`H(x, p) = |p|`), at the convex kink `(t, x) = (1, 1)` no test
  function touches `v` from above, and those touching from below have `(∂ₜφ, ∂ₓφ) = (λ, λ)` with
  `λ ∈ [0, 1]`, where `−λ + |λ| = 0 ≥ 0`; at the concave kink `(1, 2)` those touching from above have
  `(λ, λ)` with `λ ∈ [0, 1]` and `−λ + λ ≤ 0`.
- The sign of the equation matters. For the second example of 2.1 with `T = 2`, at `(1.5, 0)` the
  value function is `−|x| − (2 − t)` nearby, and the test functions touching it from above have
  `(∂ₜφ, ∂ₓφ) = (1, q)` with `|q| ≤ 1`; then `−1 + |q| ≤ 0`, as 3.4 requires. For the same equation
  multiplied by `−1`, `∂ₜv − |Dₓv| = 0`, the subsolution inequality `1 − |q| ≤ 0` fails at `q = 0`.

*Needs:* 1.3, 2.2, 2.3, 3.1, 3.2. (Proved here, following the cited route.)

### Examples

The kinks of the two value functions of 2.1, with their sets of touching test-function derivatives
computed on a grid; the almost-everywhere solution `w` of 3.1.

### Dependencies

Layers 1 and 2 (1.3, 2.1, 2.2, 2.3); Mathlib `fderiv`, `ContinuousLinearMap.inr`, `ContDiff`,
`IsLocalMaxOn`, `IsLocalMinOn`, `IsLocalMax.hasFDerivAt_eq_zero`, `sSup`, `IsCompact.exists_isMaxOn`.

## Layer 4: comparison and uniqueness

### 4.1 The comparison principle

Prove `le_of_isViscositySubsolution_of_isViscositySupersolution`: let
`H : ℝⁿ → (ℝⁿ →L[ℝ] ℝ) → ℝ` and `ω, ω₁ : ℝ → ℝ` tend to `0` at `0⁺`, with
`|H(x, p) − H(y, p)| ≤ ω(‖x − y‖ (1 + ‖p‖))` and `|H(x, p) − H(x, q)| ≤ ω₁(‖p − q‖)` for all `x`, `y`,
`p`, `q`. If `u` and `w` are bounded and continuous on `[0, T] × ℝⁿ`, `u` is a viscosity
subsolution and `w` a viscosity supersolution of `−∂ₜu + H(x, Dₓu) = 0` on `(0, T) × ℝⁿ`, and
`u(T, x) ≤ w(T, x)` for every `x`, then `u ≤ w` on `[0, T] × ℝⁿ` (Calder, Theorem 6.6 and
Corollary 6.7, pp. 58–59, for `uₜ + H(Du, x) = 0` with an initial condition, which is this
statement after the change of time `t ↦ T − t`; there `H` is also assumed continuous, which follows
here from the two estimates). Calder states Theorem 6.6 for upper and lower semicontinuous
functions; at the end of the strip where no data is given that version fails (first Check below),
and the statement here assumes continuity on the closed strip, the setting of Corollary 6.7, for
which the proof of Theorem 6.6 goes through. No uniform continuity is assumed: the logarithmic
penalty of Calder's Theorem 6.4 handles the unbounded state space.

Route: replace `u` by `u − ε (T − t) − ε / t − λ log(1 + ‖x‖²)`. It satisfies the subsolution
inequality with right-hand side `−ε` plus an error that tends to `0` with `λ`, it still lies below
`w` at `t = T`, and it tends to `−∞` as `t → 0⁺` and as `‖x‖ → ∞`. Then double the variables: maximize
`u(t, x) − w(s, y) − (a/2)(|t − s|² + ‖x − y‖²)` with the same corrections, for a large parameter
`a`. Boundedness gives a maximizer away from `t = 0`, `a (|t − s|² + ‖x − y‖²) → 0`, and the two
viscosity inequalities at the maximizer, with the estimates on `H`, contradict strictness. Letting
`ε, λ → 0` gives `u ≤ w` on `(0, T] × ℝⁿ`, and continuity gives it at `t = 0` (Calder, proofs of
Theorems 6.4 and 6.6, pp. 56–59, which treat the free end by a penalty that blows up there).

**Checks.**
- Continuity cannot be weakened to upper semicontinuity of `u` at `t = 0`: with `T > 0`, `H = 0`, the
  function `u` equal to `1` on `{0} × ℝⁿ` and to `0` elsewhere is upper semicontinuous on
  `[0, T] × ℝⁿ`, is a viscosity subsolution of `−∂ₜu = 0` on `(0, T) × ℝⁿ` and has `u(T, ·) = 0`,
  yet it exceeds the supersolution `w = 0` at `t = 0`.
- The Hamiltonian of 3.2 satisfies the hypotheses with `ω(r) = max(K_f, K_L) r`, `ω₁(r) = M_f r`.

*Needs:* 3.1; Mathlib `ContinuousOn`, `IsCompact.exists_isMaxOn`, `fderiv`, `ContDiff`. (Proved
here, following the cited route.)

### 4.2 Uniqueness of the value function

Prove `ControlProblem.eqOn_valueFunction_of_isViscositySolution`: under the standing assumptions,
if `w` is bounded and continuous on `[0, T] × ℝⁿ`, is a viscosity solution of
`−∂ₜw + H(x, Dₓw) = 0` on `(0, T) × ℝⁿ` with the Hamiltonian of 3.2, and `w(T, x) = g(x)` for every
`x`, then `w = v` on `[0, T] × ℝⁿ` (Liberzon, §5.3.3, p. 141, states uniqueness without proof;
Calder, Corollary 6.7, p. 59).

Route: by 2.3 and 3.4, `v` is a bounded continuous viscosity solution with `v(T, ·) = g`; by the
Hamiltonian estimates of 3.2, 4.1 applies to `(w, v)` and to `(v, w)`.

**Checks.**
- The almost-everywhere solution `w` of the Check of 3.1 is bounded, Lipschitz and equals `0 = g` at
  `t = 2`; it differs from the value function `0` of the problem with `g = 0`, and 4.2 does not
  apply to it, since it is not a supersolution.

*Needs:* 2.1, 2.3, 3.2, 3.4, 4.1.

### Examples

The comparison of the value functions of 2.1 with the bounded continuous solutions `v ± c` of
the same equation, whose final values are `g ± c`.

### Dependencies

Layers 2 and 3 (2.1, 2.3, 3.1, 3.2, 3.4); Mathlib `ContinuousOn`, `IsCompact.exists_isMaxOn`,
`fderiv`.

## Layer 5: the verification theorem

### 5.1 Verification of optimality

Prove `ControlProblem.isLeast_costs_of_hjb`: let `w : ℝ × ℝⁿ → ℝ` be of class `C¹` with
`w(T, x) = g(x)` for every `x`, let `t ≤ T`, and suppose that
`0 ≤ ∂ₜw(s, x) + Dₓw(s, x)(f(x, u)) + L(x, u)` for every `s ∈ [t, T)`, every `x` and every `u ∈ U`.
If `(α, y)` is admissible from `(t, x)` and
`∂ₜw(s, y s) + Dₓw(s, y s)(f(y s, α s)) + L(y s, α s) = 0` for almost every `s ∈ [t, T]`, then the
cost of `(α, y)` is `w(t, x)` and `w(t, x)` is the least element of the costs from `(t, x)`
(Liberzon, §5.1.4, pp. 132–133, for piecewise continuous controls and equality everywhere; Evans,
*An Introduction to Mathematical Optimal Control Theory*, Theorem 5.2, p. 76, for maximization,
with the smooth value function in the role of `w`).
No standing assumption of 2.1 is used: `U` may be unbounded and the costs unbounded, as in the
linear-quadratic example below.

Route: for any admissible pair `(β, z)` from `(t, x)`, each coordinate of `z` is an indefinite
integral of an integrable function, hence absolutely continuous (Mathlib
`IntervalIntegrable.absolutelyContinuousOnInterval_intervalIntegral`), and `s ↦ w(s, z s)` is
absolutely continuous because `w` is Lipschitz on a compact convex neighbourhood of the graph
(Mathlib `ContDiffOn.exists_lipschitzOnWith`, `LipschitzOnWith.comp_absolutelyContinuousOnInterval`).
At almost every `s`, `z` has derivative `f(z s, β s)` (Mathlib
`IntervalIntegrable.ae_hasDerivAt_integral`), so the chain rule (Mathlib
`HasFDerivAt.comp_hasDerivAt`) and the fundamental theorem of calculus for absolutely continuous
functions (Mathlib `AbsolutelyContinuousOnInterval.integral_deriv_eq_sub`) give
`g(z T) − w(t, x) = ∫ s in t..T, (∂ₜw + Dₓw(f))(s, z s)`, which is at least
`−∫ s in t..T, L(z s, β s)`, with equality for `(α, y)`.

**Checks.**
- The hypothesis `t ≤ T` is needed: for `t > T` the interval `[t, T]` is empty and every
  measurable control with values in `U`, together with every curve, forms an admissible pair. With
  `n = 1`, `L = 0` and `g(x) = x` the costs `g(y T)` are then all real numbers, and there is no
  least cost.
- For `ẏ = u`, `U = [−1, 1]`, `L = 0`, `g(x) = x`, the function `w(t, x) = x − (T − t)` has
  `∂ₜw + ∂ₓw u + L = 1 + u ≥ 0`, with equality for `u = −1`; so the constant control `−1` is optimal
  and `v(t, x) = x − (T − t)`, which the reachable set `[x − (T − t), x + (T − t)]` confirms.
- The value functions of 2.1 have kinks, so this theorem does not apply to them.

*Needs:* 1.1, 3.1; Mathlib `IntervalIntegrable.absolutelyContinuousOnInterval_intervalIntegral`,
`ContDiffOn.exists_lipschitzOnWith`, `LipschitzOnWith.comp_absolutelyContinuousOnInterval`,
`IntervalIntegrable.ae_hasDerivAt_integral`, `HasFDerivAt.comp_hasDerivAt`,
`AbsolutelyContinuousOnInterval.integral_deriv_eq_sub`, `IsLeast`. (Proved here, following the
cited route.)

### Examples

The linear problem with `g(x) = x` above, and the linear-quadratic problem of the worked examples.

### Dependencies

Layer 1 (1.1) and Layer 3 (3.1); the Mathlib declarations of the *Needs:* line of 5.1.

## Layer 6: Pontryagin's maximum principle

### 6.1 Needle variations

For an admissible pair `(α, y)` from `(t, x)`, a time `s ∈ (t, T)`, a value `u ∈ U` and small
`ε > 0`, the needle variation is the control equal to `u` on `(s − ε, s]` and to `α` elsewhere. Prove,
under the hypotheses of 6.2 and at every `s` at which `r ↦ f(y r, α r)`, `r ↦ L(y r, α r)` and
`r ↦ f(y r, u)`, `r ↦ L(y r, u)` have Lebesgue points, that the varied trajectory `y_ε` exists for
small `ε` and satisfies `y_ε(τ) = y(τ) + ε ξ(τ) + o(ε)` uniformly for `τ ∈ [s, T]`, where `ξ` solves the
variational equation `ξ' = ∂ₓf(y, α) ξ` with `ξ(s) = f(y s, u) − f(y s, α s)`, and that the cost
changes by `ε (Dg(y T) ξ(T) + ∫ r in s..T, ∂ₓL(y r, α r) ξ(r) + L(y s, u) − L(y s, α s)) + o(ε)`
(Evans, Lemmas A.1–A.3, pp. 114–116, without running cost and without the Lebesgue-point
condition, which is what makes the expansion valid for a measurable control). (Proved here.)

Route: on `[s − ε, s]` the two trajectories differ by `ε (f(y s, u) − f(y s, α s)) + o(ε)` at a
Lebesgue point (Mathlib `IntervalIntegrable.ae_hasDerivAt_integral`); after `s` they solve the same
equation, and the first-order expansion in the initial state is the variational equation, a linear
equation with measurable bounded coefficients (Tau Ceti
`TauCeti.exists_continuousOn_eq_forall_mem_Icc_eq_picard`,
`TauCeti.eqOn_of_forall_mem_Icc_eq_picard`), with the remainder controlled by Grönwall's inequality.
The hypotheses of 6.2 give no global Lipschitz bound, so 1.2 and 1.3 are applied to
`f̃(x, u) = f(π x, u)`, with `π` the nearest-point projection onto a closed ball containing a
neighbourhood of `y([t, T])`: `f̃` is continuous and Lipschitz in the state uniformly over `U` (the
bound of `∂ₓf` on the ball times `U`), and for small `ε` the varied trajectory of `f̃` stays in the
ball, so it is a trajectory of `f`.

*Needs:* 1.1, 1.2, 1.3; Mathlib `IntervalIntegrable.ae_hasDerivAt_integral`; Tau Ceti
`TauCeti.exists_continuousOn_eq_forall_mem_Icc_eq_picard`,
`TauCeti.eqOn_of_forall_mem_Icc_eq_picard`, `TauCeti.le_mul_exp_of_le_add_mul_integral`.

### 6.2 The maximum principle

Prove `ControlProblem.pontryagin_minimum_principle`: let `U` be compact, let `f` and `L` be
continuous on `ℝⁿ × U` and differentiable in the state for each `u ∈ U`, with
`(x, u) ↦ ∂ₓf(x, u)` and `(x, u) ↦ ∂ₓL(x, u)` continuous on `ℝⁿ × U`, and let `g` be of class `C¹`. Let
`(α, y)` be admissible from `(t, x)` with cost at most the cost of every admissible pair from
`(t, x)`, and let `p : ℝ → (ℝⁿ →L[ℝ] ℝ)` be continuous on `[t, T]` with
`p s = Dg(y T) + ∫ r in s..T, (p r ∘ ∂ₓf(y r, α r) + ∂ₓL(y r, α r))` for `s ∈ [t, T]`, that is,
`ṗ = −p ∘ ∂ₓf(y, α) − ∂ₓL(y, α)` with `p(T) = Dg(y T)`. Then for almost every `s ∈ [t, T]` and every
`u ∈ U`, `p s (f(y s, α s)) + L(y s, α s) ≤ p s (f(y s, u)) + L(y s, u)` (Evans, Theorem 4.3, p. 48,
and its proof in Appendix A.3–A.4, pp. 115–117, for maximization of a payoff `r = −L` with costate
`−p`, stated there at every time; Liberzon, §4.1–4.2, for the free-time problem with piecewise
continuous controls). No standing assumption of 2.1 is needed beyond the compactness of `U`.

The costate exists and is unique: the adjoint equation is a linear equation for `p` with
measurable bounded coefficients, solved backwards from `T` (Tau Ceti
`TauCeti.exists_continuousOn_eq_forall_mem_Icc_eq_picard` and
`TauCeti.eqOn_of_forall_mem_Icc_eq_picard` after the change of time `s ↦ t + T − s`). The integrand
of the adjoint equation is integrable, since `(y r, α r)` stays in a compact subset of `ℝⁿ × U`, so
the equation is not satisfied by a junk value of the integral.

Route: by 6.1 and optimality, the first-order change of cost under a needle variation is
nonnegative. The product rule for `p ξ` along the adjoint and variational equations shows that this
change equals `ε (p s (f(y s, u) − f(y s, α s)) + L(y s, u) − L(y s, α s))` (Evans, proof of Lemma
A.3, p. 116, and the extra state variable of A.4, p. 117, which absorbs the running cost). This
gives the inequality for a fixed `u` at almost every `s`; a countable dense subset of `U` and the
continuity in `u` give it for every `u` outside one null set of times.

**Checks.**
- Sign of the adjoint equation. For `ẏ = u`, `U = [−1, 1]`, `L(x, u) = x`, `g = 0`, the optimal
  control is `u = −1` (cost `x T − T²/2` from `(0, x)`; brute force over the controls with values in
  `{−1, 0, 1}` on 12 equal subintervals for `x = 0.7`, `T = 1.5` gives `−0.075`). The adjoint equation
  gives `ṗ = −1`, `p(T) = 0`, so `p(s) = T − s ≥ 0`, and `u ↦ p(s) u` is minimized at `u = −1`. The
  wrong sign `ṗ = +1` would give `p(s) = s − T` and select `u = +1`.
- The costate is the spatial derivative of the value function along the optimal trajectory in this
  example: `v(t, x) = x (T − t) − (T − t)²/2` has `∂ₓv = T − t = p(t)`, and it satisfies
  `−∂ₜv + |∂ₓv| − x = 0`, the Hamilton–Jacobi–Bellman equation of this problem, whose Hamiltonian
  is `H(x, p) = |p| − x`.
- For `ẏ = −y + u`, `U = [−1, 1]`, `L = 0`, `g(x) = x`, the adjoint equation `ṗ = p`, `p(T) = 1` gives
  `p(s) = e^(s − T) > 0`, and the minimum principle selects `u = −1`, which is optimal.

*Needs:* 1.1, 1.2, 6.1; Tau Ceti `TauCeti.exists_continuousOn_eq_forall_mem_Icc_eq_picard`,
`TauCeti.eqOn_of_forall_mem_Icc_eq_picard`. (Proved here, following the cited route.)

### Examples

The two problems of the Checks of 6.2, and the problem with `L = 0`, `g(x) = x²/2`, `x = 2`, `T = 1`,
where `u = −1`, `y(1) = 1` and `p ≡ 1`.

### Dependencies

Layer 1 (1.1, 1.2, 1.3); Mathlib `IntervalIntegrable.ae_hasDerivAt_integral`; Tau Ceti
`TauCeti.exists_continuousOn_eq_forall_mem_Icc_eq_picard`,
`TauCeti.eqOn_of_forall_mem_Icc_eq_picard`, `TauCeti.le_mul_exp_of_le_add_mul_integral`.

## Worked examples

**The scalar linear-quadratic problem.** Take `n = m = 1`, `U = ℝ`, `f(x, u) = u`,
`L(x, u) = u²/2` and `g(x) = x²/2`. The function `w(t, x) = x² / (2 (1 + T − t))` is smooth for
`t < 1 + T`, with
`∂ₜw = x² / (2 (1 + T − t)²)` and `∂ₓw = x / (1 + T − t)`, and
`∂ₜw + ∂ₓw u + u²/2 = (u + ∂ₓw)²/2 ≥ 0`, with equality exactly at `u = −x / (1 + T − t)`. From
`(t, x)` with `t ≤ T`, the control `α(s) = −x / (1 + T − t)` has the trajectory
`y(s) = x (1 + T − s) / (1 + T − t)`, along which equality holds. Since `w` blows up at
`t = 1 + T`, 5.1 is applied to `x²/2 · h(t)`, where `h` is smooth and equal to `1/(1 + T − t)` for
`t ≤ T + 1/2`: this function is `C¹` on `ℝ × ℝ`, agrees with `w` near `[t, T] × ℝ`, and has the
same derivatives there, so 5.1 shows that the control is optimal and that the value is
`x² / (2 (1 + T − t))`. With `T = 1.5`: from `(0, 1)` the value is `0.2`, from `(0.5, −2)` it is
`1`, and from `(1, 3)` it is `3`, which the costs of these constant controls confirm. The
problem lies outside the standing assumptions (`U` is unbounded and the costs are unbounded), so
Layers 2 to 4 do not apply to it; 5.1 does.

**Value functions with kinks.** For `ẏ = u`, `U = [−1, 1]`, `L = 0` and `T = 2`, the final costs
`min(|x|, 1)` and `−min(|x|, 1)` give the value functions of 2.1. At each of their kinks, every slope
`(∂ₜφ, ∂ₓφ)` of a test function touching from above or below satisfies the viscosity inequality of
3.4, and at the concave kink `(1.5, 0)` of the second, the inequality for the equation multiplied
by `−1` fails at the slope `(1, 0)`.

## Scope and ownership

This roadmap owns the targets stated above: admissible pairs of measurable controls and
Carathéodory trajectories, with existence, uniqueness and the trajectory estimates; the value
function of the finite-horizon problem, the dynamic programming principle and its Lipschitz
continuity; viscosity sub- and supersolutions of `−∂ₜu + H(x, Dₓu) = 0` with `C¹` test functions,
the Hamiltonian of a control problem and its estimates, the agreement of viscosity and classical
solutions for `C¹` functions, and the theorem that the value function is a viscosity solution; the
comparison principle for bounded continuous viscosity sub- and supersolutions on `[0, T] × ℝⁿ` and
the uniqueness of the value function; the verification theorem; needle variations and Pontryagin's
maximum principle for the fixed-time problem with free final state.

Already in the libraries and therefore not targets:

- Tau Ceti's linear equations with measurable coefficients
  (`TauCeti.exists_continuousOn_eq_forall_mem_Icc_eq_picard`,
  `TauCeti.eqOn_of_forall_mem_Icc_eq_picard`), consumed for the variational and adjoint equations
  in Layer 6, and Grönwall's inequality in integral form
  (`TauCeti.le_mul_exp_of_le_add_mul_integral`). The nonlinear existence theorem of 1.2 follows the
  route of the first; it is not in the libraries. Tau Ceti's equations with measurable time
  dependence are linear, its nonlinear global solution `ODE.globalSolution`
  (`TauCeti/Analysis/ODE/GlobalSolution.lean`) is for autonomous globally Lipschitz fields, and
  Mathlib's `IsPicardLindelof` asks for continuity in time; the field `s ↦ f(y, α s)` is
  nonlinear, depends on time and is only measurable in it.
- Mathlib's Lebesgue differentiation theorem on intervals and fundamental theorem of calculus for
  absolutely continuous functions, consumed in Layers 5 and 6.
- Tau Ceti's Hopf–Lax formula (`TauCeti.hopfLax`, `TauCeti/Analysis/PDE/HopfLax.lean`) is the value
  of the control problem with `ẏ = u`, `u` ranging over the whole space, running cost `L(u)` and an
  initial rather than a final cost, and the file proves its subsolution inequality without
  differentiability. That problem has an unbounded control set and is outside the standing
  assumptions here; nothing of that file is restated, and no comparison between the two is a
  target.
- Tau Ceti's viscosity solutions of the Monge–Ampère equation
  (`TauCeti.IsMongeAmpereViscositySolution`) are a second-order notion on convex functions; the
  definitions of 3.1 are first-order and in space-time, and neither is a case of the other.

Boundaries with other roadmaps:

- MarkovDecisionProcesses (on main) owns finite-horizon dynamic programming in discrete time and
  lists continuous-time control and the Hamilton–Jacobi–Bellman equation as outside its scope;
  nothing of it is used or restated here.
- The linear-quadratic problem appears only as a worked example. Riccati equations, differential,
  difference or algebraic, and the linear-quadratic regulator in general are not treated here.

Outside the scope: problems with state constraints, target sets or free final time, and the
transversality conditions they bring; the constancy of the minimized Hamiltonian along an optimal
pair; existence of optimal controls (Filippov's theorem); infinite-horizon and discounted problems;
stochastic control and second-order Hamilton–Jacobi–Bellman equations; differential games;
discontinuous viscosity solutions and Perron's method; semiconcavity of the value function and the
method of characteristics; the Hopf–Lax formula; numerical schemes.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Analysis/Calculus/FDeriv/Defs.lean`: `fderiv` (the Fréchet derivative, `0` where the
  function is not differentiable); `Mathlib/Analysis/Calculus/ContDiff/Defs.lean`: `ContDiff`
  (`ContDiff ℝ 1 φ` gives a continuous derivative);
  `Mathlib/Topology/Algebra/Module/ContinuousLinearMap/PiProd.lean`: `ContinuousLinearMap.inr`
  (`x ↦ (0, x)`).
- `Mathlib/Topology/Order/LocalExtr.lean`: `IsLocalMaxOn f s a`, `IsLocalMinOn f s a` (an
  extremum among the points of `s` near `a`). `Mathlib/MeasureTheory/MeasurableSpace/Basic.lean`:
  `Measurable.piecewise` (gluing two measurable functions along a measurable set). `Mathlib/Analysis/Calculus/LocalExtr/Basic.lean`:
  `IsLocalMax.hasFDerivAt_eq_zero` (the derivative vanishes at a local maximum).
- `Mathlib/Topology/Order/Compact.lean`: `IsCompact.exists_isMaxOn` (a function continuous on a
  nonempty compact set attains its maximum).
- `Mathlib/Analysis/Calculus/ContDiff/RCLike.lean`: `ContDiffOn.exists_lipschitzOnWith` (a `C¹`
  function is Lipschitz on a compact convex set).
- `Mathlib/Analysis/Calculus/Deriv/Comp.lean`: `HasFDerivAt.comp_hasDerivAt` (the chain rule along a
  curve).
- `Mathlib/MeasureTheory/Integral/IntervalIntegral/LebesgueDifferentiationThm.lean`:
  `IntervalIntegrable.ae_hasDerivAt_integral` (for `f` interval integrable on `a..b` with values in
  a Banach space, at almost every `x ∈ [a, b]` the indefinite integral has derivative `f x`).
- `Mathlib/MeasureTheory/Function/AbsolutelyContinuous.lean`:
  `IntervalIntegrable.absolutelyContinuousOnInterval_intervalIntegral` (the indefinite integral of a
  real interval-integrable function is absolutely continuous),
  `LipschitzOnWith.comp_absolutelyContinuousOnInterval` (a Lipschitz function of an absolutely
  continuous curve is absolutely continuous).
- `Mathlib/MeasureTheory/Integral/IntervalIntegral/AbsolutelyContinuousFun.lean`:
  `AbsolutelyContinuousOnInterval.integral_deriv_eq_sub` (for real absolutely continuous `f`,
  `∫ x in a..b, deriv f x = f b − f a`).
- `Mathlib/Analysis/ODE/PicardLindelof.lean`: `ODE.picard` (the map
  `α ↦ x₀ + ∫ τ in t₀..t, f τ (α τ)`); `IsPicardLindelof` (named in the scope only).
- Basic Mathlib: `Measurable`, `ContinuousOn`, `IntegrableOn`, interval
  integrals `∫ s in a..b`, `sInf`, `sSup`, `IsLeast`, `LipschitzWith`, `EuclideanSpace`.

### From Tau Ceti

- `TauCeti/Analysis/ODE/Caratheodory.lean`: `TauCeti.exists_continuousOn_eq_forall_mem_Icc_eq_picard`
  (for `M : ℝ → E →L[ℝ] E` almost everywhere strongly measurable and essentially bounded on `(a, b)`
  and `F` integrable there, in a Banach space `E`, the equation `x t = x₀ + ∫ s in a..t, (M s (x s) +
  F s)` has a solution continuous on `[a, b]`); `TauCeti.eqOn_of_forall_mem_Icc_eq_picard` (two
  such solutions agree on `[a, b]`). Layer 6 uses them with `E = ℝⁿ` for the variational equation
  and with `E = ℝⁿ →L[ℝ] ℝ` for the adjoint equation.
- `TauCeti/Analysis/ODE/Gronwall.lean`: `TauCeti.le_mul_exp_of_le_add_mul_integral` (if `φ` is
  continuous on `[a, b]`, `0 ≤ K` and `φ t ≤ c + K ∫ s in a..t, φ s` on `[a, b]`, then
  `φ t ≤ c exp(K (t − a))` there).
- Named in the scope only: `TauCeti/Analysis/ODE/GlobalSolution.lean`: `ODE.globalSolution`;
  `TauCeti/Analysis/PDE/HopfLax.lean`: `TauCeti.hopfLax`;
  `TauCeti/Analysis/Convex/MongeAmpere/Viscosity.lean`: `TauCeti.IsMongeAmpereViscositySolution`.

## References

- Lawrence C. Evans, *An Introduction to Mathematical Optimal Control Theory*, lecture notes,
  version of Spring 2024, on the author's page at Berkeley (`math.berkeley.edu/~evans`): Chapter 4,
  Theorem 4.3, p. 48; Chapter 5, Theorem 5.2, p. 76; Appendix, §§A.2–A.4, Lemmas A.1–A.3 and
  Theorem A.4, pp. 113–117. The notes maximize a payoff.
- Daniel Liberzon, *Calculus of Variations and Optimal Control Theory: A Concise Introduction*,
  preliminary version of 9 August 2011 on the author's page at Illinois
  (`liberzon.csl.illinois.edu`), whose page numbers differ from those of the book published by
  Princeton University Press: §3.3.1, pp. 67–69; §4.1–4.2, pp. 81–101; §5.1.2, equation (5.4), p. 128,
  and Exercise 5.1, p. 129; §5.1.4, pp. 132–133; §5.3.2, p. 140; §5.3.3 and Exercise 5.7,
  pp. 141–142.
- Jeff Calder, *Lecture notes on viscosity solutions*, version of 30 July 2024, on the author's page
  at the University of Minnesota: Definition 2.1, p. 15; Lemma 4.5 and Theorem 4.6, p. 35;
  Theorem 6.4, pp. 56–57; Theorem 6.6 and Corollary 6.7, pp. 58–59.
- The viscosity solutions of Crandall and Lions (1983) and the maximum principle of Pontryagin,
  Boltyanskii, Gamkrelidze and Mishchenko (1962) are attributed as the sources above attribute
  them.

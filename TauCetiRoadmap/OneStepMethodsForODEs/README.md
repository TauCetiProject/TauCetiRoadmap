# Roadmap: convergence of one-step methods for ordinary differential equations

**Summary.** Develop the convergence theory of one-step numerical methods for initial value
problems `y' = f(t, y)`, `y(t₀) = y₀` on a real normed space. It starts from a general one-step
method given by an increment function on a mesh with variable steps, and proves the discrete
stability theorem and the convergence theorem with the exact Grönwall constant, and convergence of
every consistent method. It defines Runge–Kutta methods by their Butcher tableau, explicit or
implicit, proves that the stage equations are uniquely solvable and that the increment function
is Lipschitz with explicit constants. It proves the error bound of the explicit Euler method and
the local error bounds, with explicit constants, of the explicit midpoint and explicit
trapezoidal methods, of the implicit Euler and implicit midpoint methods and of the trapezoidal
rule. It proves that for explicit methods with the row-sum condition the eight order conditions
through order four are sufficient and necessary, that an explicit method with `s` stages has
order at most `s`, and that the classical Runge–Kutta method has order exactly four. It
develops linear stability: the stability function, stability regions, A-stability and
L-stability, with the regions of the Euler and midpoint methods, and the boundedness of the
stability region of every explicit method whose weights sum to `1`.
It ends with contractivity of the implicit Euler and implicit midpoint methods for one-sided
Lipschitz fields, Cooper's theorem on quadratic invariants, and the symplecticity of the
Runge–Kutta methods that satisfy Cooper's condition.

## Scope and ownership

This roadmap owns:

- meshes with variable steps, one-step methods given by an increment function, the one-step
  defect, and the discrete stability and convergence theorems;
- Runge–Kutta methods given by a Butcher tableau: the stage equations, their unique solvability,
  and the Lipschitz constants of the increment function;
- the explicit Euler, explicit midpoint, explicit trapezoidal, implicit Euler, implicit midpoint,
  trapezoidal and classical fourth-order Runge–Kutta methods, with their error constants;
- the order conditions for orders one to four, the notion of order of a Runge–Kutta method, and
  the bound `p ≤ s` for explicit methods;
- the stability function, stability regions, A-stability and L-stability of Runge–Kutta methods;
- contractivity of the implicit Euler and implicit midpoint methods for one-sided Lipschitz
  fields, preservation of linear and quadratic invariants, and symplecticity of Runge–Kutta
  methods.

Already in the libraries, and not targets here. Every theorem of this roadmap takes a solution
of the differential equation as a hypothesis; none constructs one. Existence of solutions is
Mathlib's `IsPicardLindelof.exists_eq_forall_mem_Icc_hasDerivWithinAt`
(`Mathlib/Analysis/ODE/ExistUnique.lean`) and, for a globally Lipschitz autonomous field, Tau
Ceti's `ODE.globalSolution` with `ODE.isIntegralCurve_globalSolution`
(`TauCeti/Analysis/ODE/GlobalSolution.lean`); uniqueness is Mathlib's `ODE_solution_unique`
(`Mathlib/Analysis/ODE/ExistUnique.lean`); the continuous Grönwall estimate between two solutions
is `dist_le_of_trajectories_ODE` (`Mathlib/Analysis/ODE/Gronwall.lean`). The proof of existence
by convergence of Euler polygons is not a target: 3.1 proves that the Euler polygons converge to
a given solution. Mathlib's `ODE.contDiffOn_enat_Icc_of_hasDerivWithinAt`
(`Mathlib/Analysis/ODE/PicardLindelof.lean`) proves that a solution of a `C^n` field on a
complete space is `C^n`; 3.2 proves `C^(n+1)` and needs no completeness, which is what the
Taylor expansions of Layers 3 and 4 use. That the exact flow of a `C²` Hamiltonian with
Lipschitz Hamiltonian vector field preserves the symplectic form is Tau Ceti's
`TauCeti.SymplecticForm.apply_fderiv_hamiltonianFlow`
(`TauCeti/Geometry/Symplectic/Hamiltonian/Flow.lean`); 6.3 proves the same identity for the step
map of a Runge–Kutta method.

Boundaries with other roadmaps:

- [StochasticCalculus](../StochasticCalculus/README.md) 9.6 owns the Euler–Maruyama scheme for
  stochastic differential equations. With zero diffusion coefficient its recurrence is the
  explicit Euler recurrence of 3.1; the two convergence statements have different hypotheses
  (there coefficients that are Hölder of exponent `1/2` in time and a rate `1/2`, here a solution
  with Lipschitz derivative and a rate `1`), and neither contains the other.
- [MathematicalStatisticsFoundations](../MathematicalStatisticsFoundations/README.md) 9.4 owns
  the leapfrog map with its reversibility and volume preservation. Leapfrog is a partitioned
  method, not a Runge–Kutta method; it occurs here only as an example of a one-step method to
  which Layer 1 applies. Its use and error analysis inside Hamiltonian Monte Carlo samplers is
  not part of this roadmap.
- [OptimalTransport](../OptimalTransport/README.md) 10.4 owns the implicit Euler step of a
  metric gradient flow, defined by minimizing a Moreau–Yosida functional on a metric space. The
  implicit Euler method of 3.3 is the method for a Lipschitz vector field on a normed space,
  defined by a fixed-point equation.
- Rates of gradient descent, which is the explicit Euler method for a gradient field read as an
  optimization method, are not part of this roadmap.

Out of scope:

- linear multistep methods, zero-stability and the Dahlquist barriers; general linear methods;
- rooted trees, B-series and the order conditions of order five and higher; the Butcher barriers
  on the number of stages of explicit methods of order five and higher;
- collocation and Gauss methods as a family (the two-stage Gauss method appears as an example);
- embedded pairs, error estimators and adaptive step-size control;
- stiff order reduction, B-convergence and algebraic stability of general Runge–Kutta methods;
- partitioned, splitting and composition methods, backward error analysis and modified equations;
- differential-algebraic equations, delay equations and discretizations of partial differential
  equations;
- stochastic differential equations;
- floating-point arithmetic: 1.3 bounds the effect of arbitrary perturbations of each step, and
  no model of rounding is part of this roadmap.

## Conventions

- `E` is a real normed space (`[NormedAddCommGroup E] [NormedSpace ℝ E]`), of any dimension.
  Completeness (`[CompleteSpace E]`) is assumed exactly in 2.3 and 3.3, where an implicit
  equation is solved; an inner product is assumed exactly in 6.1; finite dimension, which
  implies completeness, exactly in 6.3, where Tau Ceti's Hamiltonian vector field requires it.
- A vector field is `f : ℝ → E → E`, time first, as in Mathlib's `IsIntegralCurveOn`. "`y` is a
  solution on `[a, b]`" means `IsIntegralCurveOn y f (Set.Icc a b)`, that is
  `HasDerivWithinAt y (f t (y t)) (Set.Icc a b) t` for every `t ∈ [a, b]`; the derivatives at
  the endpoints are one-sided. "`f` is `L`-Lipschitz in `y`" means `∀ t, LipschitzWith L (f t)`
  with `L : ℝ≥0`.
- **Meshes.** A mesh is a first node `t₀` and a sequence of steps `h : ℕ → ℝ`; its nodes are
  `meshNode t₀ h n = t₀ + h 0 + ⋯ + h (n − 1)`, written `t_n`. The theorems assume `0 ≤ h n`.
  A uniform mesh has constant steps. A step may be `0`.
- **One-step methods.** An increment function is `Φ : ℝ → E → ℝ → E`, with arguments time,
  state, step. One step from `(t, y)` with step `h` leads to `y + h • Φ t y h`.
- **Smoothness of solutions.** Hypotheses on higher derivatives of a solution `y` are stated
  without derivatives of `f`: "`y'` is `M₂`-Lipschitz" means
  `LipschitzOnWith M₂ (fun r ↦ f r (y r)) (Set.Icc a b)`, which holds when `‖y''‖ ≤ M₂`;
  "`y''` is `M₃`-Lipschitz" means that a function `y₂` with
  `HasDerivWithinAt (fun r ↦ f r (y r)) (y₂ r) (Set.Icc a b) r` on `[a, b]` satisfies
  `LipschitzOnWith M₃ y₂ (Set.Icc a b)`, which holds when `‖y'''‖ ≤ M₃`.
- **Grönwall bound.** Error bounds are stated with Mathlib's `gronwallBound δ K ε x`, which is
  `δ e^(K x) + (ε / K)(e^(K x) − 1)` for `K ≠ 0` and `δ + ε x` for `K = 0`.
- **Tableaux.** A Butcher tableau with `s` stages is a triple `(A, b, c)` with
  `A : Matrix (Fin s) (Fin s) ℝ` and `b c : Fin s → ℝ`; `s = 0` is allowed. `𝟙` is the vector
  with all entries `1`. The row-sum condition is `c = A 𝟙`, that is `c i = ∑ j, A i j`; it is a
  hypothesis exactly where it is used (4.2, 4.3, 5.1). `|A|` and `|b|` are the entrywise absolute
  values.
- **Matrix inverse.** `M⁻¹` for a square matrix is Mathlib's inverse, which is `0` when `det M`
  is not a unit.

## Exact supplier contracts

- Mathlib:
  - `IsIntegralCurveOn γ v s` (`Mathlib/Analysis/ODE/Basic.lean`):
    `∀ t ∈ s, HasDerivWithinAt γ (v t (γ t)) s t`;
  - `gronwallBound` and `gronwallBound_mono` (`Mathlib/Analysis/ODE/Gronwall.lean`): the function
    of the Conventions, monotone in `x` when `δ`, `ε`, `K` are nonnegative;
  - `discrete_gronwall_prod_general` (`Mathlib/Analysis/ODE/DiscreteGronwall.lean`): if
    `u (n + 1) ≤ c n * u n + b n` and `0 ≤ c n` for `n ≥ n₀`, then for `n ≥ n₀`,
    `u n ≤ u n₀ * ∏ i ∈ Ico n₀ n, c i + ∑ k ∈ Ico n₀ n, b k * ∏ i ∈ Ico (k + 1) n, c i`;
  - `Real.add_one_le_exp`: `x + 1 ≤ exp x`;
  - `image_norm_le_of_norm_deriv_right_le_deriv_boundary`
    (`Mathlib/Analysis/Calculus/MeanValue.lean`): if `g` is continuous on `[a, b]` with right
    derivative `g'` on `[a, b)`, `‖g a‖ ≤ B a`, `B` has derivative `B'` and `‖g' x‖ ≤ B' x` on
    `[a, b)`, then `‖g x‖ ≤ B x` on `[a, b]`; no completeness is needed;
  - `ContractingWith.fixedPoint_isFixedPt` and `ContractingWith.fixedPoint_unique'`
    (`Mathlib/Topology/MetricSpace/Contracting.lean`): a contraction of a nonempty complete
    metric space has a fixed point, and two fixed points of a contraction are equal;
  - `ODE.contDiffOn_comp` (`Mathlib/Analysis/ODE/PicardLindelof.lean`): if `Function.uncurry f`
    is `C^n` on `s ×ˢ u` and `α` is `C^n` on `s` with values in `u`, then `t ↦ f t (α t)` is
    `C^n` on `s`; no completeness is needed;
  - `contDiffOn_succ_iff_derivWithin` (`Mathlib/Analysis/Calculus/ContDiff/Deriv.lean`) and
    `uniqueDiffOn_Icc` (`Mathlib/Analysis/Calculus/TangentCone/Real.lean`): on `[a, b]` with
    `a < b`, a function is `C^(n+1)` if and only if it is differentiable and its derivative
    within `[a, b]` is `C^n`;
  - `taylor_mean_remainder_bound` (`Mathlib/Analysis/Calculus/Taylor.lean`): for `g` of class
    `C^(n+1)` on `[a, b]` with `(n+1)`-st derivative bounded by `C`, the Taylor polynomial of
    degree `n` at `a` approximates `g x` within `C (x − a)^(n+1) / n!`;
  - `HasStrictFDerivAt.to_localInverse`
    (`Mathlib/Analysis/Calculus/InverseFunctionTheorem/FDeriv.lean`): the local inverse of a map
    with invertible strict derivative has the inverse strict derivative;
  - `Matrix.mul_nonsing_inv` and `Matrix.nonsing_inv_apply_not_isUnit`
    (`Mathlib/LinearAlgebra/Matrix/NonsingularInverse.lean`): `M * M⁻¹ = 1` when `det M` is a
    unit, and `M⁻¹ = 0` otherwise;
  - `Matrix.det_add_replicateCol_mul_replicateRow`
    (`Mathlib/LinearAlgebra/Matrix/SchurComplement.lean`): the matrix determinant lemma for a
    rank-one update of a matrix with unit determinant;
  - `Polynomial.tendsto_abv_atTop` (`Mathlib/Topology/Algebra/Polynomial.lean`): a polynomial of
    positive degree tends to infinity in absolute value along every filter along which its
    argument does;
  - `real_inner_le_norm`: `⟪x, y⟫ ≤ ‖x‖ ‖y‖`.
- Tau Ceti:
  - `TauCeti.SymplecticForm V` (`TauCeti/Geometry/Symplectic/AlmostComplex.lean`): an
    alternating nondegenerate bilinear form on a real vector space;
  - `TauCeti.SymplecticForm.hamiltonianVectorField`,
    `TauCeti.SymplecticForm.contDiff_hamiltonianVectorField` and
    `TauCeti.SymplecticForm.apply_fderiv_hamiltonianVectorField_add`
    (`TauCeti/Geometry/Symplectic/Hamiltonian/Basic.lean`): on a finite-dimensional real normed
    space, the field `X_H` with `ω (X_H x) v = dH(x) v`; it is `C^n` when `H` is `C^(n+1)`; and
    for `H` of class `C²` at `x`, `ω (DX_H(x) u) v + ω u (DX_H(x) v) = 0`.

## How to read the build

The layers are built in order, and each uses only earlier ones. Layer 1 is the general theory
of one-step methods and uses only Mathlib. Layer 2 defines Runge–Kutta methods on top of the
one-step methods of 1.2 and bounds the Lipschitz constant of their increment functions, the
hypothesis of 1.3 and 1.4. Layer 3 bounds the defects of six named methods and combines them
with Layers 1 and 2. Layer 4 treats the order conditions and the classical Runge–Kutta method;
it uses Layers 1 and 2 and the regularity of solutions and the defect bounds of 3.1 and 3.2.
Layer 5 treats linear stability and the order barrier for explicit methods; it uses 1.2, 2.1
and 4.1 to 4.3. Layer 6 treats contractivity, invariants and symplecticity; it uses the stage
equations of 2.1, the solvability theorem 2.3 and Tau Ceti's Hamiltonian vector fields. The
Checks of Layers 4, 5 and 6 evaluate the named tableaux of Layers 3 and 4, and those of 6.2 the
stability functions of 5.1.

Each numbered target ends with a **Checks** list of tests that a wrong convention or a wrong
constant would fail, and a *Needs:* line naming the targets and suppliers it uses. Every claim
carries a source locator in parentheses, or says that it is proved here. `Suggested.lean` states
the headline theorems of each layer against the pinned APIs.

## Layer 1: one-step methods and the convergence theorem

### 1.1 Meshes

Define `meshNode t₀ h n = t₀ + ∑ i ∈ Finset.range n, h i`. Prove:

- `meshNode t₀ h 0 = t₀` and `meshNode t₀ h (n + 1) = meshNode t₀ h n + h n`;
- if `0 ≤ h n` for all `n < N`, the nodes are nondecreasing up to index `N`;
- for constant steps `h n = η`, `meshNode t₀ h n = t₀ + n η`;
- `meshNode t₀ h n` depends only on `h 0, …, h (n − 1)`.

(Proved here.)

**Checks.**

- `t₀ = 2`, steps `1, 1/2, 1/4, …`: the nodes are `2, 3, 7/2, 15/4`; an indexing that started the
  sum at `h 1` would give `2, 5/2, 11/4`.
- Steps `1, −1`: `meshNode t₀ h 2 = t₀`. The definition allows negative steps; the theorems of
  1.3 to 1.5 exclude them.
- All steps `0`: every node is `t₀`.

*Needs:* none beyond Mathlib.

### 1.2 One-step methods and the defect

Define the numerical solution `oneStepSeq Φ t₀ h y₀ : ℕ → E` by `Y 0 = y₀` and
`Y (n + 1) = Y n + h n • Φ (t_n) (Y n) (h n)`, and the defect of a curve `y : ℝ → E`,
`oneStepDefect Φ y t h = y (t + h) − y t − h • Φ t (y t) h`. The local truncation error of the
literature is the defect divided by `h` (Süli 2022, (23)); the defect has no division and is
defined at `h = 0`. Prove:

- `oneStepDefect Φ y t 0 = 0`;
- with `z n = y (t_n)`, `z (n + 1) − z n − h n • Φ (t_n) (z n) (h n) = oneStepDefect Φ y (t_n) (h n)`;
- `oneStepSeq Φ t₀ h y₀ n` depends only on `h 0, …, h (n − 1)`;
- if `Φ` is continuous in its three arguments jointly, `(y₀, h) ↦ oneStepSeq Φ t₀ h y₀ n` is
  continuous for each `n`, for the product topology on step sequences.

(Proved here.)

**Checks.**

- `E = ℝ`, `Φ t u h = u`, constant step `η`: `Y n = (1 + η)^n y₀`.
- `E = ℝ`, `Φ t u h = t`, `t₀ = 0`, constant step `η`, `y₀ = 0`: `Y n = η² n (n − 1) / 2`, the
  left Riemann sum of `t`; evaluating `Φ` at the right node `t_(n+1)` would give
  `η² n (n + 1) / 2`.
- The same `Φ` and `y t = t² / 2`: `oneStepDefect Φ y t h = h² / 2` for every `t`. The sign
  convention is exact minus numerical: the opposite convention gives `−h² / 2`.
- `Φ = 0`: `Y n = y₀` for every mesh, and `oneStepDefect 0 y t h = y (t + h) − y t`.

*Needs:* 1.1.

### 1.3 Discrete stability

Let `0 ≤ h n` for `n < N`, and let `u ↦ Φ (t_n) u (h n)` be `L`-Lipschitz for each `n < N`,
`L : ℝ≥0`. Let `z, Y : ℕ → E` be two sequences with, for `n < N`,
`‖z (n + 1) − z n − h n • Φ (t_n) (z n) (h n)‖ ≤ h n · τ` and
`‖Y (n + 1) − Y n − h n • Φ (t_n) (Y n) (h n)‖ ≤ ρ n`. Prove, for `n ≤ N`,

    ‖z n − Y n‖ ≤ gronwallBound (‖z 0 − Y 0‖ + ∑ k < n, ρ k) L τ (t_n − t₀)

(`norm_sub_le_gronwallBound_of_oneStep`), with the two cases `L > 0` and `L = 0` of the
Conventions.

Route: the errors `e n = ‖z n − Y n‖` satisfy `e (n + 1) ≤ (1 + h n L) e n + h n τ + ρ n`;
`discrete_gronwall_prod_general` gives
`e n ≤ e 0 ∏ (1 + h i L) + ∑ k < n, (h k τ + ρ k) ∏ k < i < n, (1 + h i L)`; then
`1 + x ≤ e^x`, and `h k e^(L (t_n − t_(k+1))) ≤ (e^(L (t_n − t_k)) − e^(L (t_n − t_(k+1)))) / L`
for `L > 0`, which telescopes. If `τ < 0` the hypothesis forces `h n = 0` for all `n < N`, and
the bound is `‖z 0 − Y 0‖ + ∑ ρ k` at `t_n = t₀`.

Prove also:

- **perturbed steps:** if `Y (n + 1) = Y n + h n • Φ (t_n) (Y n) (h n) + r n` with `‖r n‖ ≤ ε`
  and `z n = y (t_n)` has defects at most `h n · τ`, then
  `‖y (t_n) − Y n‖ ≤ gronwallBound (‖y t₀ − Y 0‖ + n ε) L τ (t_n − t₀)`;
- **dependence on the initial value:** two numerical solutions on the same mesh satisfy
  `‖oneStepSeq Φ t₀ h y₀ n − oneStepSeq Φ t₀ h y₀' n‖ ≤ e^(L (t_n − t₀)) ‖y₀ − y₀'‖`;
- **local form:** if `u ↦ Φ (t_n) u (h n)` is only `LipschitzOnWith L` on the closed ball of
  radius `r` around `z n`, for each `n < N`, if `τ ≥ 0`, and if the right side of the displayed
  bound at `n = N` is at most `r`, then the bound holds for all `n ≤ N`: by induction and
  `gronwallBound_mono`, `Y n` stays in the ball around `z n`.

(Süli 2022, Theorem 4 and (25), for `E = ℝ`, a uniform mesh, `ρ = 0`; the statement for a normed
space, variable steps and perturbations is proved here.)

**Checks.**

- `E = ℝ`, `Φ t u h = L u`, constant step `η`, `z = 0`, `Y 0 = 1`, `τ = 0`, `ρ = 0`:
  `‖z n − Y n‖ = (1 + η L)^n ≤ e^(L n η)`. For `η L = 1`, `n = 2`: `4 ≤ e² = 7.389…`.
- `L = 0`, `Φ = 0`, `E = ℝ`, `z n = n η τ`, `Y = 0`: `‖z n − Y n‖ = τ (t_n − t₀)`, equality in the
  bound for `L = 0`.
- Negative steps: `E = ℝ`, `Φ t u s = u` for `s ≥ 0` and `−u` for `s < 0`, `L = 1`, steps `1, −1`,
  `z = 0`, `Y 0 = 1`: `Y 2 = 4`, while the right side at `t_2 = t₀` is `1`.
- Without the Lipschitz hypothesis: `E = ℝ`, `Φ t u s = √|u|`, constant step `1`, `z = 0`,
  `Y 0 = δ² > 0`: `Y 1 = δ² + δ`, and no bound `C δ²` holds as `δ → 0`.
- Perturbations add up: `Φ = 0`, `z = 0`, `Y n = n ε`: equality with `ρ k = ε`, `τ = 0`.

*Needs:* 1.1; Mathlib `gronwallBound`, `gronwallBound_mono`, `discrete_gronwall_prod_general`,
`Real.add_one_le_exp`.

### 1.4 The convergence theorem

Let `y : ℝ → E` be any curve, `p : ℕ`, and `C, hmax, b` real with
`‖oneStepDefect Φ y t s‖ ≤ C s^(p+1)` whenever `t₀ ≤ t`, `0 ≤ s ≤ hmax` and `t + s ≤ b`. Let the
mesh satisfy `0 ≤ h n ≤ hmax` for `n < N` and `t_N ≤ b`, and let `u ↦ Φ (t_n) u (h n)` be
`L`-Lipschitz for `n < N`. Prove, for every `y₀ : E` and `n ≤ N`,

    ‖y (t_n) − oneStepSeq Φ t₀ h y₀ n‖ ≤ gronwallBound ‖y t₀ − y₀‖ L (C hmax^p) (t_n − t₀)

(`norm_sub_oneStepSeq_le`). The curve `y` need not
solve a differential equation: the theorem compares `y` with the method through the defect
alone. No sign condition on `C` is needed: if `C < 0` the hypothesis forces every `h n` to be
`0`. It is 1.3 with `z n = y (t_n)`, `τ = C hmax^p`, `ρ = 0`, since
`C (h n)^(p+1) ≤ h n · C hmax^p`.

Consequences to prove: for `p ≥ 1`, `y t₀ = y₀` and uniform meshes of `N ≥ 1` steps on `[t₀, b]`, `t₀ ≤ b`,
the largest error over the nodes is at most `gronwallBound 0 L (C ((b − t₀)/N)^p) (b − t₀)` and
tends to `0` as `N → ∞`; and the perturbed form of 1.3 with `τ = C hmax^p`.

(Süli 2022, Theorem 4 with Definition 3, for `E = ℝ` and uniform meshes; proved here.)

**Checks.**

- `E = ℝ`, `Φ t u h = t`, `y t = t² / 2`, `t₀ = 0`, `y₀ = 0`: the defect is `s² / 2`, so `C = 1/2`,
  `p = 1`, `L = 0`. On the uniform mesh with step `η`, `y (t_n) − Y n = η t_n / 2`, equal to the
  bound `C η (t_n − t₀)`.
- `p = 0` does not give convergence: `Φ = 0`, `y t = t`, `C = 1`, `L = 0`: the error `t_n − t₀`
  equals the bound for every mesh.
- `N = 0`, or all steps `0`: both sides are `‖y t₀ − y₀‖`.
- The bound uses the largest step, not the smallest: for the first example on the mesh with
  steps `1, η, η, …` the error at `t_1 = 1` is `1/2`, which `C η (t_1 − t₀)` does not bound.

*Needs:* 1.2, 1.3.

### 1.5 Consistency implies convergence

Let `y` be a solution of `y' = f(t, y)` on `[a, b]`. Let `Φ` be jointly continuous on
`ℝ × E × ℝ`, **consistent**, that is `Φ t u 0 = f t u` for all `t`, `u` (Süli 2022, Definition 2
and (26)), and `L`-Lipschitz in `u` for every `t` and every step in `[0, h₀]`, `h₀ > 0`. Prove:
for every `ε > 0` there is `δ > 0` such that for every mesh with first node `a`, steps in
`[0, δ]` and `t_N ≤ b`, and every `n ≤ N`,

    ‖y (t_n) − oneStepSeq Φ a h (y a) n‖ ≤ ε

(`exists_forall_norm_sub_oneStepSeq_le_of_consistent`).

Route: `r ↦ f r (y r) = Φ r (y r) 0` is continuous on the compact interval `[a, b]`, hence
uniformly continuous, and so is `(r, s) ↦ Φ r (y r) s` on `[a, b] × [0, h₀]`. The mean value
inequality `image_norm_le_of_norm_deriv_right_le_deriv_boundary` applied to
`r ↦ y r − y t − (r − t) • f t (y t)` bounds `‖y (t + s) − y t − s • f t (y t)‖` by `s` times
the oscillation of `y'` on `[t, t + s]`. So the defect is at most `s · τ(δ)` with `τ(δ) → 0`,
and 1.3 gives the bound `gronwallBound 0 L τ(δ) (b − a)`.

(Süli 2022, Theorem 5, for `E = ℝ` and uniform meshes; Mirzaei 2024, Theorem 2.4; proved here.)

**Checks.**

- For `f` continuous and Lipschitz in `u`, `Φ t u s = f t u + s • v` with a fixed `v` is
  consistent and converges; its defect is of order `s²` when `y'` is Lipschitz.
- Consistency is needed: `E = ℝ`, `f t u = u`, `Φ t u s = 2u`, `y = exp`, `[a, b] = [0, 1]`: on
  the uniform mesh with `N` steps `Y N = (1 + 2/N)^N → e²`, not `e`.
- Continuity in the step is needed: `Φ t u s = u` for `s = 0` and `2u` for `s ≠ 0` is
  consistent with `f t u = u` and `2`-Lipschitz in `u`, and on meshes with positive steps
  its numerical solution is that of the previous check.
- `a = b`: the only admissible meshes have `t_n = a` for `n ≤ N`, and the error is `0`.

*Needs:* 1.2, 1.3; Mathlib `IsIntegralCurveOn`,
`image_norm_le_of_norm_deriv_right_le_deriv_boundary`.

### Examples

The explicit Euler increment `Φ t u h = f t u`. The leapfrog method for `q'' = g(q)` on
`E × E`, with increment
`Φ t (q, p) h = (p + (h/2) • g q, (1/2) • (g q + g (q + h • p + (h²/2) • g q)))`: it is
consistent with the field `(q, p) ↦ (p, g q)`, and for Lipschitz `g` it is Lipschitz in `(q, p)`
uniformly for `h ∈ [0, h₀]`, so 1.5 applies. With `−g` in place of `g`, one step of this
method is the leapfrog step of MathematicalStatisticsFoundations 9.4, which owns the map.

### Dependencies

Layer 1 uses Mathlib's `IsIntegralCurveOn`, `gronwallBound`, `gronwallBound_mono`,
`discrete_gronwall_prod_general`, `Real.add_one_le_exp` and
`image_norm_le_of_norm_deriv_right_le_deriv_boundary`.

## Layer 2: Runge–Kutta methods

### 2.1 Tableaux and stage equations

Define the structure `ButcherTableau s` with fields `A`, `b`, `c` as in the Conventions. For a
tableau `T` define:

- `T.IsExplicit`: `A i j = 0` whenever `i ≤ j`;
- `T.IsStage f t y h k`, for `k : Fin s → E`: the stage equations
  `k i = f (t + c i * h) (y + h • ∑ j, A i j • k j)` for all `i`;
- `T.stages f t y h`: the unique `k` with `T.IsStage f t y h k` if there is exactly one, and `0`
  otherwise;
- `T.increment f t y h = ∑ i, b i • T.stages f t y h i`, the increment function of the method.

The Runge–Kutta method of `T` for `f` is the one-step method with this increment function
(Butcher 2007, section "Runge-Kutta methods"; Sanz-Serna 2015, (2.4)–(2.6); Mirzaei 2024,
Definition 2.13 for explicit tableaux). Prove:

- for an explicit tableau, every `f`, `t`, `y`, `h` have exactly one stage vector
  (`ButcherTableau.existsUnique_isStage_of_isExplicit`), with no hypothesis on `f`; it is
  computed stage by stage, `k i = f (t + c i * h) (y + h • ∑ j < i, A i j • k j)`, and it is the
  `s`-th iterate from any starting vector of the map `k ↦ (i ↦ f (t + c i * h) (y + h • ∑ j, A i j • k j))`;
- if `T.IsStage f t y h k` and the stage vector is unique, then `T.stages f t y h = k`;
- at `h = 0`, `k i = f t y` for all `i` is the unique stage vector of every tableau, and
  `T.increment f t y 0 = (∑ i, b i) • f t y`; so the method is consistent in the sense of 1.5
  exactly when `∑ i, b i = 1` or `f = 0`;
- for an explicit tableau and `f` jointly continuous, `T.increment f` is jointly continuous.

(Proved here.)

**Checks.**

- `s = 0`: the empty vector is the unique stage vector, `T.increment f t y h = 0`, and the
  numerical solution is constant.
- The tableau `A = (0)`, `b = (1)`, `c = (0)`: `k 0 = f t y` and the increment is `f t y`.
- `A = (0, 0; 1, 0)`, `b = (1/2, 1/2)`, `c = (0, 1)`: `k 0 = f t y`, `k 1 = f (t + h) (y + h • k 0)`.
  Reading `A` as its transpose would make the equations implicit.
- `A = (1)`, `b = (1)`, `c = (1)`, `E = ℝ`, `f t u = λ u`: for `h λ ≠ 1` the unique stage vector
  is `k 0 = λ y / (1 − h λ)`. For `h λ = 1` and `y ≠ 0` there is none, and for `h λ = 1`, `y = 0`
  every `k` is one; in both cases `T.stages` is `0`.
- The same tableau with `f t u = sin u`, `y = 0`, `h = 3/2`: `k = sin (3k/2)` has three
  solutions, so `T.stages` is `0` by the junk convention and not by solving the equation.
- A tableau with `A 0 0 = 1/2` is not explicit; a tableau with `s = 0` is.

*Needs:* 1.2.

### 2.2 Explicit methods: the Lipschitz constant

Define, for real `L` and `h`,

    T.explicitLipschitzConst L h = L * ∑ i, |b i| * ((∑ m < s, (h L)^m • |A|^m) 𝟙) i

Let `T` be explicit and `f` be `L`-Lipschitz in `y`. Prove, for all `t`, `h`, `y`, `y'`,
`‖T.increment f t y h − T.increment f t y' h‖ ≤ T.explicitLipschitzConst L |h| · ‖y − y'‖`
(`ButcherTableau.norm_increment_sub_le_of_isExplicit`). Prove also that
`T.explicitLipschitzConst L h` is nondecreasing in `h ≥ 0` for `L ≥ 0`, so that it bounds the
Lipschitz constant for all steps in `[0, hmax]` when evaluated at `hmax`, and that it is at most
`L (∑ i, |b i|) ∑ m < s, (h L α)^m` when every absolute row sum of `A` is at most `α`.

Route: the differences `d i = ‖k i − k' i‖` of the stage vectors satisfy
`d ≤ L ‖y − y'‖ 𝟙 + |h| L |A| d` entrywise, and `|A|^s = 0`, so
`d ≤ (∑ m < s, (|h| L |A|)^m) 𝟙 · L ‖y − y'‖`. (Mirzaei 2024, Example 2.3, for the explicit
midpoint method; the general constant is proved here.)

**Checks.**

- `A = (0)`, `b = (1)`: the constant is `L`.
- `A = (0, 0; 1/2, 0)`, `b = (0, 1)` and `A = (0, 0; 1, 0)`, `b = (1/2, 1/2)`:
  `L (1 + h L / 2)` for both; for the first this is the constant `L + (h/2) L²` of Mirzaei
  2024, Example 2.3. The coarser bound with `α = 1` for the second is `L (1 + h L)`.
- `A = (0, 0, 0, 0; 1/2, 0, 0, 0; 0, 1/2, 0, 0; 0, 0, 1, 0)`, `b = (1/6, 1/3, 1/3, 1/6)`:
  `L (1 + x/2 + x²/6 + x³/24)` with `x = h L`.
- For `E = ℝ`, `f t u = L u` and a tableau with nonnegative entries the increment is
  `L bᵀ (∑ m < s, (h L A)^m) 𝟙 · y`, so the constant is attained.
- `s = 0`: the constant is `0`, and the increment is `0`.

*Needs:* 2.1.

### 2.3 Implicit methods: solvability and the Lipschitz constant

Let `E` be complete, `f` be `L`-Lipschitz in `y`, and `α` a real number with
`∑ j, |A i j| ≤ α` for all `i`. Prove:

- if `|h| L α < 1`, then for all `t`, `y` there is exactly one stage vector
  (`ButcherTableau.existsUnique_isStage`): the map
  `k ↦ (i ↦ f (t + c i * h) (y + h • ∑ j, A i j • k j))` is a contraction of `Fin s → E` with
  the supremum norm, with constant `|h| L α`;
- under the same hypothesis,
  `‖T.increment f t y h − T.increment f t y' h‖ ≤ L (∑ i, |b i|) / (1 − |h| L α) · ‖y − y'‖`
  (`ButcherTableau.norm_increment_sub_le`);
- for `f` jointly continuous, `T.increment f` is jointly continuous on the set of `(t, y, h)`
  with `|h| L α < 1`.

(The contraction argument is the standard one; proved here.)

**Checks.**

- `A = (1)`, `b = (1)`: `α = 1`, the condition is `|h| L < 1`, and the constant `L / (1 − h L)` is
  attained by `f t u = L u` on `ℝ`, for which the increment is `L y / (1 − h L)`.
- The condition is sharp for that tableau: at `h L = 1` the check of 2.1 has no stage vector.
- `A = (1/2)`, `b = (1)`: `α = 1/2`, the condition is `|h| L < 2`, the constant `L / (1 − h L / 2)`.
- The condition is sufficient, not necessary: for `A = (0, 0; 1/2, 1/2)` it reads `|h| L < 1`,
  while the stage vector is unique for `|h| L < 2`, because the first stage is explicit and the
  second solves a contraction with constant `|h| L / 2`.
- `L = 0`: `f t` is constant and every tableau has the unique stage vector `k i = f (t + c i * h) y`.
- Completeness is needed: let `E` be the finitely supported real sequences with the supremum
  norm, `S` the right shift and `f t u = e₀ + S u`, which is `1`-Lipschitz. For `A = (1)`,
  `h = 1/2`, `y = 0` the stage equation is `k = e₀ + (1/2) S k`, whose only solution in the
  completion is `(1, 1/2, 1/4, …)`: there is no stage vector in `E`, although `|h| L α = 1/2`.

*Needs:* 2.1; Mathlib `ContractingWith.fixedPoint_isFixedPt`,
`ContractingWith.fixedPoint_unique'`.

### Examples

The tableaux of the Checks of 2.1 and 2.2. The two-stage Gauss tableau
`A = (1/4, 1/4 − √3/6; 1/4 + √3/6, 1/4)`, `b = (1/2, 1/2)`, `c = (1/2 − √3/6, 1/2 + √3/6)`
(Butcher 2007, section "Implicit Runge-Kutta methods") has `α = 1/2 + √3/6`.

### Dependencies

Layer 2 uses 1.2 and Mathlib's `ContractingWith.fixedPoint_isFixedPt` and
`ContractingWith.fixedPoint_unique'`.

## Layer 3: Euler, midpoint and trapezoidal methods with explicit constants

Throughout this layer `y` is a solution on `[a, b]`, and `t`, `h` satisfy `a ≤ t`, `0 ≤ h`,
`t + h ≤ b`.

### 3.1 The explicit Euler method

Define `explicitEuler` as the tableau `A = (0)`, `b = (1)`, `c = (0)`; its increment is `f t y`.
Prove:

- **Taylor residuals.** Let `w : ℝ → E` have derivative `w' r` within `[a, b]` at every
  `r ∈ [a, b]`, with `w'` `M`-Lipschitz on `[a, b]`. Then
  `‖w (t + h) − w t − h • w' t‖ ≤ M h² / 2`, `‖w (t + h) − w t − h • w' (t + h)‖ ≤ M h² / 2` and
  `‖w (t + h/2) − (1/2) • (w t + w (t + h))‖ ≤ M h² / 8`. For `w = y`, `w' r = f r (y r)` and
  `M = M₂` the first is the defect bound of the explicit Euler method; it needs no Lipschitz
  condition on `f`.
- **Global error.** If moreover `f` is `L`-Lipschitz in `y`, then on every mesh with first node
  `a`, steps in `[0, hmax]` and `t_N ≤ b`, for every `y₀` and `n ≤ N`,

      ‖y (t_n) − oneStepSeq (explicitEuler.increment f) a h y₀ n‖ ≤ gronwallBound ‖y a − y₀‖ L (M₂ hmax / 2) (t_n − a)

  (`explicitEuler_error_le`); for `L > 0` the right side is
  `e^(L (t_n − a)) ‖y a − y₀‖ + (M₂ hmax / (2L))(e^(L (t_n − a)) − 1)`, the bound (20) of Süli
  2022.
- **Lipschitz data.** If `f` is `L`-Lipschitz in `y`, `K`-Lipschitz in `t` (that is
  `LipschitzWith K (fun r ↦ f r u)` for every `u`), and `‖f r (y r)‖ ≤ B` on `[a, b]`, then `y'`
  is `(K + L B)`-Lipschitz on `[a, b]`, so the bounds hold with `M₂ = K + L B`.
- **Euler polygons.** For `n < N` and `t_n ≤ t ≤ t_(n+1)`, the polygon value
  `Y n + (t − t_n) • f (t_n) (Y n)` differs from `y t` by at most
  `gronwallBound ‖y a − y₀‖ L (M₂ hmax / 2) (t − a)`: it is the global error on the mesh whose
  `n`-th step is replaced by `t − t_n`.
- For `f` jointly continuous and Lipschitz in `y`, and `y'` merely continuous, the explicit
  Euler method converges by 1.5.

Route for the residuals: `image_norm_le_of_norm_deriv_right_le_deriv_boundary` applied to
`r ↦ w r − w t − (r − t) • w' t` with `B r = M (r − t)² / 2`, and its mirror image; the third
follows from the first at the point `t + h/2` in both directions.
(Süli 2022, (19) and (20), for `E = ℝ`, a uniform mesh and `M₂ = max |y''|`; Mirzaei 2024,
(2.6); proved here.)

**Checks.**

- `E = ℝ`, `f t u = t`, `y t = t² / 2`, `a = 0`, `y₀ = 0`: `L = 0`, `M₂ = 1`, and on the uniform
  mesh with step `η` the error at `t_n` is `η t_n / 2`, equal to the bound. The residual
  `y (t + h/2) − (y t + y (t + h))/2 = −h² / 8` is also an equality.
- `E = ℝ`, `f t u = u`, `y = exp`, `[a, b] = [0, 1]`, `y₀ = 1`: `L = 1`, `M₂ = e`. With two steps
  of `1/2` the error at `1` is `e − 9/4 = 0.468…` and the bound is `(e/4)(e − 1) = 1.167…`.
- `f t u = arctan u` on `ℝ`: `L = 1`, `|y''| = |arctan y| / (1 + y²) ≤ π/2`, and the bound is
  `e^(t_n − a) |y a − y₀| + (π/4) hmax (e^(t_n − a) − 1)` (Süli 2022, Example 2).
- A bound with `hmax²` in place of `hmax` is false: in the first example the error is `η t_n / 2`.
- `explicitEuler.increment f t y h = f t y` although `explicitEuler.c 0 = 0` and the stage time
  is `t + 0 · h`; with `c = (1)` the increment would be `f (t + h) y`.

*Needs:* 1.4, 1.5, 2.1; Mathlib `IsIntegralCurveOn`,
`image_norm_le_of_norm_deriv_right_le_deriv_boundary`.

### 3.2 The explicit midpoint and explicit trapezoidal methods

Define `explicitMidpoint` as `A = (0, 0; 1/2, 0)`, `b = (0, 1)`, `c = (0, 1/2)`, with increment
`f (t + h/2) (y + (h/2) • f t y)` (the modified Euler method), and `heun` as `A = (0, 0; 1, 0)`,
`b = (1/2, 1/2)`, `c = (0, 1)`, with increment `(1/2) • (f t y + f (t + h) (y + h • f t y))` (the
improved Euler method, often called Heun's method; Heun's third-order method is a different
tableau). (Süli 2022, Section 2.4, methods a) and b).) Let `y'` be `M₂`-Lipschitz and `y''` be
`M₃`-Lipschitz on `[a, b]`. Prove:

- **quadrature residuals:**
  `‖y (t + h) − y t − (h/2) • (y' t + y' (t + h))‖ ≤ M₃ h³ / 12` and
  `‖y (t + h) − y t − h • y' (t + h/2)‖ ≤ M₃ h³ / 24`, where `y' r = f r (y r)`;
- if `f` is `L`-Lipschitz in `y`:
  `‖oneStepDefect (heun.increment f) y t h‖ ≤ (M₃ / 12 + L M₂ / 4) h³` (`heun_defect_le`) and
  `‖oneStepDefect (explicitMidpoint.increment f) y t h‖ ≤ (M₃ / 24 + L M₂ / 8) h³`
  (`explicitMidpoint_defect_le`);
- the global errors: on meshes with steps in `[0, hmax]`, by 1.4 and 2.2, at most
  `gronwallBound ‖y a − y₀‖ (L (1 + hmax L / 2)) (C hmax²) (t_n − a)` with `C` the respective
  defect constant;
- **regularity of solutions:** if `Function.uncurry f` is of class `C^n` on `ℝ × E`, `n : ℕ`,
  then `y` is `C^(n+1)` on `[a, b]` (`ContDiffOn`), in every real normed space `E`; for `n = 2`,
  `y₂` exists and constants `M₂`, `M₃` exist.

Route. Trapezoidal residual: with `g = y'`, the function
`R s = y (t + s) − y t − (s/2) • (g t + g (t + s))` has
`R' s = (1/2) • (g (t + s) − g t − s • y₂ (t + s))`, of norm at most `M₃ s² / 4` by the second
residual of 3.1 applied to `w = g`, `w' = y₂`; integrate with the mean value inequality. Midpoint residual:
`s ↦ y (c + s) − y (c − s) − 2s • g c` at `c = t + h/2` has derivative
`g (c + s) + g (c − s) − 2 • g c`, of norm at most `M₃ s²`. Defects: the defect of `heun` is
the trapezoidal residual plus `(h/2) • (f (t + h) (y (t + h)) − f (t + h) (y t + h • f t (y t)))`,
of norm at most `(h/2) L · M₂ h² / 2`; that of `explicitMidpoint` is the midpoint residual plus
`h • (f (t + h/2) (y (t + h/2)) − f (t + h/2) (y t + (h/2) • f t (y t)))`, of norm at most
`h L · M₂ (h/2)² / 2`. Regularity, for `a < b` (for `a ≥ b` the interval has at most one
point): `y` is continuous on `[a, b]`; if `y` is `C^k` there with `k ≤ n`, then
`r ↦ f r (y r)` is `C^k` by `ODE.contDiffOn_comp`, and it is the derivative of `y` within
`[a, b]`, so `y` is `C^(k+1)` by `contDiffOn_succ_iff_derivWithin` and `uniqueDiffOn_Icc`.
(Süli 2022, Section 2.4, gives the leading terms of the two
truncation errors for `E = ℝ`; the bounds with these constants are proved here.)

**Checks.**

- `E = ℝ`, `f t u = t²`, `y t = t³ / 3`, `t = 0`: `L = 0`, `y₂ r = 2r`, `M₃ = 2`. The defect of
  `heun` is `h³/3 − h³/2 = −h³/6`, of absolute value `M₃ h³ / 12`; that of `explicitMidpoint` is
  `h³/3 − h³/4 = h³/12 = M₃ h³ / 24`. Both bounds are equalities, and exchanging the constants
  `1/12` and `1/24` makes the first one false.
- `E = ℝ`, `f t u = u`, `y = exp`, `t = 0`, `[a, b] = [0, h]`: both defects equal
  `e^h − 1 − h − h²/2`, with `L = 1`, `M₂ = M₃ = e^h`. The midpoint bound is `e^h h³ / 6` and the
  trapezoidal one `e^h h³ / 3`; the defect is `h³/6 + h⁴/24 + ⋯`, so the midpoint constant is
  attained to leading order.
- `h = 0`: both sides are `0`.
- `0 ≤ h` is needed: in the first example at `t > 0` with `h < 0` and `t + h ≥ 0`, the defect of
  `heun` is `−h³/6 > 0` and the right side `M₃ h³ / 12` is negative.
- The explicit Euler method does not satisfy a bound `C h³`: its defect on `f t u = t` is `h²/2`.

*Needs:* 1.4, 2.1, 2.2, 3.1; Mathlib `IsIntegralCurveOn`,
`image_norm_le_of_norm_deriv_right_le_deriv_boundary`, `ODE.contDiffOn_comp`,
`contDiffOn_succ_iff_derivWithin`, `uniqueDiffOn_Icc`.

### 3.3 The implicit Euler, implicit midpoint and trapezoidal methods

Let `E` be complete and `f` be `L`-Lipschitz in `y`. Define `implicitEuler` as `A = (1)`,
`b = (1)`, `c = (1)`; `implicitMidpoint` as `A = (1/2)`, `b = (1)`, `c = (1/2)`; and `trapezoid`
as `A = (0, 0; 1/2, 1/2)`, `b = (1/2, 1/2)`, `c = (0, 1)`. Their steps `z = y + h • Φ` solve
`z = y + h • f (t + h) z`, `z = y + h • f (t + h/2) ((1/2) • (y + z))` and
`z = y + (h/2) • (f t y + f (t + h) z)`. Prove:

- for `h L < 1`, if `y'` is `M₂`-Lipschitz:
  `‖oneStepDefect (implicitEuler.increment f) y t h‖ ≤ M₂ h² / (2 (1 − h L))`
  (`implicitEuler_defect_le`);
- for `h L < 2`, if `y'` is `M₂`-Lipschitz and `y''` is `M₃`-Lipschitz:
  `‖oneStepDefect (implicitMidpoint.increment f) y t h‖ ≤ (M₃ / 24 + L M₂ / 8) h³ / (1 − h L / 2)`
  (`implicitMidpoint_defect_le`);
- for `trapezoid` and `|h| L < 2` there is exactly one stage vector, although 2.3 with `α = 1`
  gives this only for `|h| L < 1`: the first stage is `f t y`, and the second is the fixed
  point of a contraction of `E` with constant `|h| L / 2`; the increment is Lipschitz in `y`
  with constant `L / (1 − |h| L / 2)`;
- for `h L < 2`, if `y''` is `M₃`-Lipschitz:
  `‖oneStepDefect (trapezoid.increment f) y t h‖ ≤ M₃ h³ / (12 (1 − h L / 2))`
  (`trapezoid_defect_le`);
- the global errors by 1.4 and 2.3: for the implicit Euler method on meshes with steps in
  `[0, hmax]`, `hmax L < 1`, at most
  `gronwallBound ‖y a − y₀‖ (L / (1 − hmax L)) (M₂ hmax / (2 (1 − hmax L))) (t_n − a)`, and
  likewise for the two second-order methods with Lipschitz constant `L / (1 − hmax L / 2)`.

Route. For the implicit Euler method the defect `e = y (t + h) − z` equals the second Taylor
residual of 3.1 plus `h • (f (t + h) (y (t + h)) − f (t + h) z)`, so `‖e‖ ≤ M₂ h² / 2 + h L ‖e‖`.
For the trapezoidal rule `e` is the trapezoidal residual of 3.2 plus
`(h/2) • (f (t + h) (y (t + h)) − f (t + h) z)`. For the implicit midpoint method `e` is the
midpoint residual plus `h • (f (t + h/2) (y (t + h/2)) − f (t + h/2) ((1/2) • (y t + z)))`, and
`y (t + h/2) − (1/2) • (y t + z)` is the third Taylor residual of 3.1 plus `(1/2) • e`, so
`‖e‖ ≤ M₃ h³ / 24 + h L (M₂ h² / 8 + ‖e‖ / 2)`. (Süli 2022, (21), states a global bound for the
θ-method on `ℝ` without proof; the bounds here are proved here.)

**Checks.**

- `E = ℝ`, `f t u = t`, `y t = t² / 2`, `t = 0`: `L = 0`, `M₂ = 1`; the implicit Euler defect is
  `h²/2 − h² = −h²/2`, equality.
- `E = ℝ`, `f t u = t²`, `y t = t³/3`, `t = 0`: the trapezoidal defect is `−h³/6` and the implicit
  midpoint defect `h³/12`, equalities with `M₃ = 2`, `L = 0`.
- `E = ℝ`, `f t u = u`, `y = exp`, `t = 0`, `h = 1/2`: the implicit Euler step is `1/(1 − h) = 2`,
  the defect is `√e − 2 = −0.351…`, and the bound with `M₂ = √e` is `√e / 4 = 0.412…`.
- The factor `1 − h L` cannot be dropped: in the last example the defect `e^h − 1/(1 − h)` is
  unbounded as `h → 1`.
- `E = ℝ`, `f t u = λ u`, `h λ ≠ 1, 2`: the step is `y / (1 − h λ)` for `implicitEuler` and
  `(1 + h λ/2)/(1 − h λ/2) · y` for `implicitMidpoint` and for `trapezoid`; the second check
  separates the last two, and with `c = (0)` in place of `c = (1)` the step of `implicitEuler`
  in the first check would be `0` instead of `h²`.

*Needs:* 1.4, 2.1, 2.3, 3.1, 3.2; Mathlib `IsIntegralCurveOn`,
`ContractingWith.fixedPoint_isFixedPt`, `ContractingWith.fixedPoint_unique'`.

### Examples

The six methods on `y' = λ y`, `y' = t` and `y' = t²`, as in the Checks, and on the rotation
field `(q, p) ↦ (p, −q)` of `ℝ²`, for which `L = 1` and every derivative of a solution has the
norm of the initial value.

### Dependencies

Layer 3 uses 1.4, 1.5, 2.1, 2.2, 2.3 and Mathlib's `IsIntegralCurveOn`,
`image_norm_le_of_norm_deriv_right_le_deriv_boundary`, `ODE.contDiffOn_comp`,
`contDiffOn_succ_iff_derivWithin`, `uniqueDiffOn_Icc`, `ContractingWith.fixedPoint_isFixedPt`
and `ContractingWith.fixedPoint_unique'`.

## Layer 4: order conditions through order four

### 4.1 The order conditions

For a tableau `T` and `p : ℕ` define `T.OrderConditions p` as the conjunction of

- for `p ≥ 1`: `∑ b i = 1`;
- for `p ≥ 2`: `∑ b i c i = 1/2`;
- for `p ≥ 3`: `∑ b i (c i)² = 1/3` and `∑ b i (A c) i = 1/6`;
- for `p ≥ 4`: `∑ b i (c i)³ = 1/4`, `∑ b i c i (A c) i = 1/8`, `∑ b i (A c²) i = 1/12` and
  `∑ b i (A (A c)) i = 1/24`, where `c²` is the entrywise square.

These are the conditions of the rooted trees with at most `min p 4` vertices (Butcher 2007,
equations (2)–(9), for an explicit four-stage tableau; Süli 2022, Section 2.4, for two and three
stages). For `p ≥ 5` the definition is `T.OrderConditions 4`; every theorem below assumes
`p ≤ 4`. Prove:

- `T.OrderConditions p` implies `T.OrderConditions q` for `q ≤ p`, and `T.OrderConditions 0`
  holds;
- under the row-sum condition `c = A 𝟙`, the conditions for `p ≥ k` imply
  `bᵀ A^(k−1) 𝟙 = 1/k!` for `k = 1, 2, 3, 4`.

(Proved here.)

**Checks.**

- The tableau `A = (0, 0, 0, 0; 1/2, 0, 0, 0; 0, 1/2, 0, 0; 0, 0, 1, 0)`,
  `b = (1/6, 1/3, 1/3, 1/6)`, `c = (0, 1/2, 1/2, 1)`, which 4.4 names `rk4`, satisfies all
  eight: for example `A c = (0, 0, 1/4, 1/2)`, so
  `∑ b i (A c) i = 1/12 + 1/12 = 1/6`, and `A (A c) = (0, 0, 0, 1/4)`, so the last sum is `1/24`.
- `heun` and `explicitMidpoint` satisfy the conditions for `p = 2` and not for `p = 3`:
  `∑ b i (c i)²` is `1/2` and `1/4`, and `∑ b i (A c) i = 0`.
- `explicitEuler` satisfies them for `p = 1` and not for `p = 2`: `∑ b i c i = 0`.
- The three-stage tableau `A = (0, 0, 0; 1/2, 0, 0; −1, 2, 0)`, `b = (1/6, 2/3, 1/6)`,
  `c = (0, 1/2, 1)` satisfies the four conditions for `p = 3`: `∑ b i (c i)² = 1/6 + 1/6` and
  `A c = (0, 0, 1)`, so `∑ b i (A c) i = 1/6`.
- `implicitMidpoint` satisfies them for `p = 2` and not `p = 3` (`∑ b i (c i)² = 1/4`);
  `implicitEuler` for `p = 1` and not for `p = 2` (`∑ b i c i = 1`).
- The tableau of the first check with fourth row of `A` replaced by `(1/10, 0, 9/10, 0)` keeps
  `c` and the row-sum condition, and has `∑ b i (A c) i = 19/120 ≠ 1/6`: the conditions hold
  for `p = 2` and not for `p = 3`.
- `p ≥ 5`: the tableau of the first check satisfies `OrderConditions 5` by definition, while
  its defect on `f t u = t⁴`, `y t = t⁵/5` at `t = 0` is `h⁵/5 − 5h⁵/24 = −h⁵/120`.

*Needs:* 2.1; the tableaux of 3.1, 3.2 and 3.3 in the Checks.

### 4.2 Order, and sufficiency of the order conditions

Define `T.HasOrder p`: for every `d : ℕ`, every `f : ℝ → ℝ^d → ℝ^d` with `Function.uncurry f`
smooth (`ContDiff ℝ ∞`), every `a`, `b` and every solution `y` on `[a, b]`, there is `C` with
`‖oneStepDefect (T.increment f) y t h‖ ≤ C h^(p+1)` whenever `a ≤ t`, `0 ≤ h`, `t + h ≤ b`.
Here `ℝ^d` is `EuclideanSpace ℝ (Fin d)`. This is "order at least `p`" (Süli 2022,
Definition 3, which names the largest such `p`). The definition is used for explicit tableaux;
for an implicit tableau and a field that is not globally Lipschitz the stage equations can have
several solutions and `T.stages` takes its junk value, and the orders of the implicit methods of
3.3 are stated by their defect bounds.

Prove:

- `T.HasOrder p` implies `T.HasOrder q` for `q ≤ p`;
- **sufficiency.** Let `T` be explicit with `c = A 𝟙`, `p ≤ 4` and `T.OrderConditions p`. Let
  `E` be any real normed space, `Function.uncurry f` of class `C^p` on `ℝ × E`, and `y` a
  solution on `[a, b]`. Then there is `C` with `‖oneStepDefect (T.increment f) y t h‖ ≤ C h^(p+1)`
  whenever `a ≤ t`, `0 ≤ h`, `t + h ≤ b`
  (`ButcherTableau.exists_norm_oneStepDefect_le_of_orderConditions`). In particular
  `T.HasOrder p`, and by 1.4 and 2.2 the global error on meshes with steps at most `hmax` is
  `O(hmax^p)` when `f` is Lipschitz in `y`.

Route. For `p = 0` the solution is Lipschitz on `[a, b]` and the increment is bounded on the
compact parameter set. For `p ≥ 1`, `y` is `C^(p+1)` on `[a, b]` by the regularity of
solutions of 3.2, and each stage
`k i (t, h)` is `C^p` in `h`, jointly continuously in `(t, h)` with its derivatives. Write the
defect as the Taylor remainder of order `p + 1` of `h ↦ y (t + h)` minus `h` times the Taylor
remainder of order `p` of `h ↦ ∑ b i • k i (t, h)`, plus a polynomial in `h` of degree at most
`p`; `taylor_mean_remainder_bound` bounds the two remainders by `C h^(p+1)` with `C` a supremum
over the compact set of `(t, h)`. The polynomial vanishes: its coefficients are, tree by tree,
the elementary differentials of `f` along `y` multiplied by the differences of the two sides of
the order conditions; the row-sum condition and `∑ b i = 1` reduce the time-dependent case to
the autonomous one on `ℝ × E`. (The theorem for the rooted trees of all orders is due to
Butcher; Butcher 2007, section "Order conditions", states it; proved here for `p ≤ 4`.)

**Checks.**

- `explicitEuler.HasOrder 1`, by 3.1 with the constant `M₂ / 2`.
- `heun.HasOrder 2` and `explicitMidpoint.HasOrder 2`, by 3.2.
- A tableau with `s = 0` has `HasOrder 0` and not `HasOrder 1`: on `f t u = 1`, `d = 1`, the
  defect is `h`.
- The row-sum condition is needed: `A = (0, 0; 1/2, 0)`, `b = (1/2, 1/2)`, `c = (0, 1)` satisfies
  `OrderConditions 2`, and on `f t u = u`, `y = exp` its step is `1 + h + h²/4`, so the defect is
  `e^t (h²/4 + ⋯)` and it does not have order `2`.

*Needs:* 1.2, 1.4, 2.1, 2.2, 3.1, 3.2, 4.1; Mathlib `IsIntegralCurveOn`,
`taylor_mean_remainder_bound`.

### 4.3 Necessity of the order conditions

Let `T` be explicit with `c = A 𝟙` and `p ≤ 4`. Prove `T.HasOrder p ↔ T.OrderConditions p`
(`ButcherTableau.hasOrder_iff_orderConditions`).

Route for necessity: three families of scalar problems, `d = 1`, with explicit solutions, and
the defect at `t = 0` as a power series in `h`, whose coefficients through `h^p` must vanish.
`f t u = t^(k−1)` with `y t = t^k / k` gives `∑ b i (c i)^(k−1) = 1/k` for `k ≤ p`.
`f t u = u + t^q` with `y 0 = 0`, for which the step is `∑ m, h^(q+m+1) bᵀ A^m c^q` and
`y h = ∑ m, q! h^(q+m+1) / (q+m+1)!`, gives `bᵀ A^m c^q = q!/(q + m + 1)!` for
`q + m + 1 ≤ p`. `f t u = t u` with `y t = exp (t²/2)` gives `∑ b i c i (A c) i = 1/8` for
`p = 4`. These are the eight conditions; the row-sum condition is used only for sufficiency.
(Butcher 2007, section "Order conditions", Table 1: for `p ≤ 4` the number of conditions for
scalar problems equals the number for systems, `1, 2, 4, 8`; proved here.)

**Checks.**

- `p = 1`: `f t u = 1` has defect `h (1 − ∑ b i)`, which is `O(h²)` only if `∑ b i = 1`.
- `p = 2`: `f t u = t`, `y = t²/2`: the defect at `t = 0` is `h² (1/2 − ∑ b i c i)`.
- `f t u = t u`, `y = exp (t²/2)`, at `t = 0`: the exact step is `1 + h²/2 + h⁴/8 + ⋯` and the
  numerical one is `1 + h² ∑ b i c i + h⁴ ∑ b i c i (A c) i`, so the coefficient of `h⁴` gives the
  condition with value `1/8`.
- The equivalence is false for `p = 5` with the definition of 4.1, by the last check of 4.1.
- Explicitness is needed, because of the junk value of `T.stages`: `implicitMidpoint`
  satisfies `c = A 𝟙` and `OrderConditions 2`, but on `f t u = u²`, `y t = 1/(1 − t)`,
  `[a, b] = [0, 1/2]`, the stage equation `k = (y + (h/2) k)²` has two solutions for
  `0 < h < 1/4`, so the increment is `0`, the defect is `y (t + h) − y t ≥ h`, and
  `implicitMidpoint.HasOrder 1` fails.

*Needs:* 4.1, 4.2; the tableau `implicitMidpoint` of 3.3 in the Checks.

### 4.4 The classical Runge–Kutta method

Define `rk4` as `A = (0, 0, 0, 0; 1/2, 0, 0, 0; 0, 1/2, 0, 0; 0, 0, 1, 0)`,
`b = (1/6, 1/3, 1/3, 1/6)`, `c = (0, 1/2, 1/2, 1)` (Butcher 2007, section "Runge-Kutta methods";
Süli 2022, Section 2.4). Prove `rk4.HasOrder 4 ∧ ¬ rk4.HasOrder 5` (`rk4_hasOrder`), and, for `f`
that is `L`-Lipschitz in `y` with `Function.uncurry f` of class `C⁴`, the global error bound
`gronwallBound ‖y a − y₀‖ (L (1 + x/2 + x²/6 + x³/24)) (C hmax⁴) (t_n − a)`, `x = hmax L`, with
`C` the constant of 4.2.

The first half is 4.3 with the first check of 4.1. For the second, `f t u = t⁴` with `d = 1`
and `y t = t⁵/5`: the defect at `t = 0` is `−h⁵/120`, which no `C h⁶` bounds on `[0, b]`.
(Proved here.)

**Checks.**

- `f t u = t³` on `ℝ`: the step from `t = 0` is `h (4 (h/2)³ + h³)/6 = h⁴/4`, exact, as for
  Simpson's rule; on `f t u = t⁴` it is `5h⁵/24 ≠ h⁵/5`, so the defect is `−h⁵/120`.
- `f t u = u`: the step multiplies by `1 + h + h²/2 + h³/6 + h⁴/24`, and the defect at `t = 0` is
  `h⁵/120 + ⋯`.
- Exchanging the weights to `b = (1/3, 1/6, 1/6, 1/3)` gives `∑ b i c i = 1/2` and
  `∑ b i (c i)² = 5/12 ≠ 1/3`: order `2`.

*Needs:* 1.4, 2.2, 4.1, 4.2, 4.3.

### Examples

The tableaux `explicitEuler`, `heun`, `explicitMidpoint`, the three-stage tableau of 4.1 and
`rk4`, with orders `1, 2, 2, 3, 4`.

### Dependencies

Layer 4 uses 1.2, 1.4, 2.1, 2.2, the defect bounds and the regularity of solutions of 3.1 and
3.2, the tableaux of 3.1, 3.2 and 3.3, and Mathlib's `IsIntegralCurveOn` and
`taylor_mean_remainder_bound`.

## Layer 5: linear stability

### 5.1 The stability function

Define, for `z : ℂ`, `T.stabilityFunction z = 1 + z · bᵀ (1 − z A)⁻¹ 𝟙`, with `A` and `b` mapped
to `ℂ` (Butcher 2007, section "Stability"). Where `det (1 − z A) = 0` the inverse is `0` and
the value is `1`. Write `R = T.stabilityFunction`. Prove:

- **test equation.** For `E = ℂ`, `f t u = λ u` with `λ : ℂ`, real `h`, and
  `det (1 − (h λ) A) ≠ 0`: every stage vector `k` satisfies
  `y + h • ∑ i, b i • k i = R (h λ) · y`
  (`ButcherTableau.add_smul_sum_eq_stabilityFunction_mul`), and exactly one stage vector exists;
  the same holds on every complex normed space;
- where `det (1 − z A) ≠ 0`, `R z = det (1 − z A + z 𝟙 bᵀ) / det (1 − z A)`;
- for an explicit tableau, `det (1 − z A) = 1` for all `z`, and
  `R z = 1 + ∑ 1 ≤ k ≤ s, (bᵀ A^(k−1) 𝟙) z^k`;
- for an explicit tableau with `c = A 𝟙`, `s ≤ 4` and `T.OrderConditions s`:
  `R z = ∑ k ≤ s, z^k / k!` (`ButcherTableau.stabilityFunction_eq_sum_of_orderConditions`).

(Süli 2022, Section 2.5, for explicit methods with `s = p ≤ 4` and real `z`; proved here.)

**Checks.**

- `explicitEuler`: `R z = 1 + z`. `heun` and `explicitMidpoint`: `1 + z + z²/2`. `rk4`:
  `1 + z + z²/2 + z³/6 + z⁴/24`.
- `implicitEuler`: `R z = 1/(1 − z)` for `z ≠ 1`, and `R 1 = 1` by the junk value.
  `implicitMidpoint` and `trapezoid`: `(1 + z/2)/(1 − z/2)` for `z ≠ 2`.
- `s = 0`: `R = 1`, and the last item reads `1 = 1`.
- `A = (0, 0; 1, 0)`, `b = (1, 0)`, explicit with `∑ b i = 1`: `R z = 1 + z`; the coefficient of
  `z²` is `bᵀ A 𝟙 = 0`, and the tableau does not satisfy `OrderConditions 2`.
- The harmonic oscillator `q' = p`, `p' = −q` is `u' = −i u` for `u = q + i p`, and
  `|u|² = q² + p²` is multiplied in one step by `|R(−i h)|²`: `1 + h²` for `explicitEuler`,
  `1/(1 + h²)` for `implicitEuler`, `1` for `implicitMidpoint` and `trapezoid`, `1 + h⁴/4` for
  `heun`, and `1 − h⁶/72 + h⁸/576` for `rk4`. After `n` steps of the explicit Euler method the
  energy is `(1 + h²)^n` times its initial value.

*Needs:* 2.1, 4.1; the tableaux of 3.1, 3.2, 3.3 and 4.4 in the Checks; Mathlib
`Matrix.mul_nonsing_inv`, `Matrix.nonsing_inv_apply_not_isUnit`,
`Matrix.det_add_replicateCol_mul_replicateRow`.

### 5.2 Stability regions, A-stability and L-stability

Define `T.stabilityRegion = {z : ℂ | det (1 − z A) ≠ 0 ∧ ‖R z‖ ≤ 1}` (Mirzaei 2024,
Definition 2.5), `T.IsAStable` as `{z | z.re ≤ 0} ⊆ T.stabilityRegion` (Mirzaei 2024,
Definition 3.3), and `T.IsLStable` as `T.IsAStable` together with `‖R z‖ → 0` along
`Filter.cocompact ℂ` (Mirzaei 2024, Definition 3.5). The condition on the determinant excludes
the points where the stage equations of the test equation are singular. Prove:

- for `z = h λ` in the stability region and a numerical solution of `u' = λ u` with constant
  step `h`, `‖Y n‖ ≤ ‖Y 0‖` for all `n`; and if `det (1 − z A) ≠ 0` and `‖R z‖ > 1`,
  `‖Y n‖ = ‖R z‖^n ‖Y 0‖` is unbounded for `Y 0 ≠ 0`;
- `explicitEuler.stabilityRegion = Metric.closedBall (−1) 1` (`stabilityRegion_explicitEuler`);
- `implicitEuler.stabilityRegion = {z | 1 ≤ ‖z − 1‖}`, and `implicitEuler.IsLStable`
  (`implicitEuler_isLStable`);
- `implicitMidpoint.stabilityRegion = {z | z.re ≤ 0}` (`stabilityRegion_implicitMidpoint`), and
  the same for `trapezoid`; both are A-stable and neither is L-stable, since `‖R z‖ → 1`.

(Mirzaei 2024, Sections 2.4, 3.3 and 3.4, states these regions; proved here.)

**Checks.**

- `z = −2` is in the region of `explicitEuler` and `z = −21/10` is not; for `heun`, `R(−2) = 1`
  and `R(−21/10) = 221/200`.
- For the three-stage tableau of 4.1, `R(−5/2) = −47/48` and `R(−13/5) = −431/375`; for `rk4`,
  `R(−27/10) = 70307/80000` and `R(−14/5) = 639/625`. These bracket the left ends `−2.51`
  and `−2.78` of the real stability intervals (Süli 2022, Section 2.5).
- `z = 1` is not in the region of `implicitEuler`: the determinant vanishes, although the junk
  value `R 1 = 1` has norm `1`. A definition without the determinant condition would contain it.
- `A = (1, 0; 0, −1)`, `b = (1, 0)`: `R z = 1/(1 − z)` for `z ≠ ±1`, as for `implicitEuler`, but
  `det (1 − z A) = (1 − z)(1 + z)` vanishes at `z = −1`, where the second stage equation of the
  test equation has no solution; this tableau is not A-stable in the sense defined here.
- `implicitEuler`: `R(−1) = 1/2`, `R(i) = 1/(1 − i)` of norm `1/√2`, `R(1/2) = 2`.

*Needs:* 1.2, 2.1, 5.1; the tableaux of 3.1, 3.2, 3.3 and 4.4 and the three-stage tableau of
4.1 in the Checks.

### 5.3 Explicit methods

Let `T` be explicit with `∑ i, b i = 1`. Prove that `T.stabilityRegion` is bounded
(`ButcherTableau.isBounded_stabilityRegion_of_isExplicit`), and hence that `T` is not A-stable.

Route: by 5.1, `R` is a polynomial with coefficient `∑ b i = 1` at `z`, so of positive degree,
and `Polynomial.tendsto_abv_atTop` gives `‖R z‖ → ∞` as `‖z‖ → ∞`. (Butcher 2007, section
"Stability", states that explicit methods are not A-stable; Mirzaei 2024, Section 3.3; proved
here.)

**Checks.**

- `∑ b i = 1` is needed: for `b = 0`, `R = 1`, the stability region is `ℂ`, and the tableau is
  A-stable; its method leaves every initial value fixed.
- `explicitEuler`: the region is the disc of 5.2, of diameter `2`.
- `implicitEuler` is not explicit and its region is unbounded.

*Needs:* 5.1, 5.2; the tableaux of 3.1 and 3.3 in the Checks; Mathlib
`Polynomial.tendsto_abv_atTop`.

### 5.4 The order barrier for explicit methods

Let `T` be explicit with `s` stages. Prove:

- if `T.HasOrder p` then `bᵀ A^(k−1) 𝟙 = 1/k!` for `1 ≤ k ≤ p`, for every `p`;
- `T.HasOrder p` is false for every `p > s` (`ButcherTableau.not_hasOrder_of_isExplicit`).

Route: on `f t u = u`, `d = 1`, `y = exp`, one step multiplies by the polynomial
`1 + ∑ 1 ≤ k ≤ s, (bᵀ A^(k−1) 𝟙) h^k` (5.1), so the defect is `e^t` times the difference of
`e^h` and that polynomial; and `A^s = 0` gives the coefficient `0 ≠ 1/(s + 1)!` at `h^(s+1)`.
No row-sum condition is used. (Butcher 2007, section "Explicit Runge-Kutta methods", Table 2 and
the remark after it, for orders up to four; proved here.)

**Checks.**

- `explicitEuler` has order `1` and not `2`; `heun` and `explicitMidpoint` order `2` and not `3`.
- `s = 0`: no order `p ≥ 1`.
- The bound is attained for `s ≤ 4`: `explicitEuler`, `heun`, the three-stage tableau of 4.1
  and `rk4` have orders `1, 2, 3, 4`.
- Implicit methods are not bound by it: `implicitMidpoint` has one stage and its defect is of
  order `h³` (3.3).

*Needs:* 2.1, 4.2, 5.1; the tableaux of 3.1, 3.2, 3.3 and 4.4, and 4.1 and 4.3, in the Checks.

### Examples

The stability functions and regions of the seven named tableaux, and the energy factors of the
harmonic oscillator.

### Dependencies

Layer 5 uses 1.2, 2.1, 4.1, 4.2, 4.3, the tableaux of 3.1, 3.2, 3.3 and 4.4, and Mathlib's
`Matrix.mul_nonsing_inv`, `Matrix.nonsing_inv_apply_not_isUnit`,
`Matrix.det_add_replicateCol_mul_replicateRow` and `Polynomial.tendsto_abv_atTop`.

## Layer 6: contractivity and structure preservation

### 6.1 One-sided Lipschitz fields

Let `F` be a real inner product space and `f : ℝ → F → F` with
`⟪f r u − f r v, u − v⟫ ≤ μ ‖u − v‖²` for all `r`, `u`, `v` (a one-sided Lipschitz condition
with constant `μ`; Süli 2022, Definition 16; the field is dissipative when `μ = 0`, Definition
15; for a bound `ν(r)` depending on time as there, apply the theorems to the field frozen at
the stage time, with `μ = ν(t + h)` and `μ = ν(t + h/2)`). Let `h ≥ 0`, and let `z`, `z'` be
steps from `y`, `y'` with stage vectors `k`, `k'`. Prove:

- for `implicitEuler` and `h μ < 1`: `‖z − z'‖ ≤ ‖y − y'‖ / (1 − h μ)`
  (`implicitEuler_norm_sub_le`);
- for `implicitMidpoint`, `μ ≥ 0` and `h μ < 2`:
  `‖z − z'‖ ≤ (1 + h μ / 2)/(1 − h μ / 2) · ‖y − y'‖` (`implicitMidpoint_norm_sub_le`);
- in particular for a dissipative field both methods are nonexpansive for every `h ≥ 0`, and
  the stage vector, if it exists, is unique.

Route. Implicit Euler: `z − z' = (y − y') + h • (f r z − f r z')` with `r = t + h`; take the
inner product with `z − z'` and use `real_inner_le_norm`. Implicit midpoint: with
`m = (1/2) • (y + z)`,
`‖z − z'‖² − ‖y − y'‖² = 2h ⟪f r m − f r m', m − m'⟫ ≤ 2 h μ ‖m − m'‖² ≤ (h μ / 2)(‖z − z'‖ + ‖y − y'‖)²`.
(These are the B-stability of the two methods, due to Butcher and to Dahlquist for the one-leg
form; Süli 2022, Section 5, treats one-leg methods; proved here.)

**Checks.**

- `F = ℝ`, `f r u = μ u`: the implicit Euler step is `y / (1 − h μ)` and the implicit midpoint
  step `(1 + h μ/2)/(1 − h μ/2) · y`: both bounds are equalities.
- `F = ℝ`, `f r u = −u³`, dissipative and not Lipschitz: `h = 1`, `y = 2`, `y' = 0`: the implicit
  Euler step solves `z + z³ = 2`, so `z = 1`, `z' = 0`, and `|z − z'| = 1 ≤ 2`.
- The explicit Euler method is not nonexpansive on a dissipative field: `f r u = −u`, `h = 3`,
  steps `−2y`.
- The implicit midpoint bound is false for `μ < 0`: `F = ℝ`, `f r u = −6u` satisfies the
  condition with `μ = −1`; for `h = 1` the step is `−y/2`, while
  `(1 + h μ/2)/(1 − h μ/2) = 1/3`. A field with constant `μ < 0` has constant `0`, and the
  theorem then gives the factor `1`.
- `h μ = 1` for implicit Euler and `f r u = μ u`, `μ > 0`: no step exists from `y ≠ 0`.
- `0 ≤ h` is needed: `f r u = −u` satisfies the condition with `μ = 0`; for `h = −1/2` the
  implicit Euler step is `2y`, and for `h = −1` the implicit midpoint step is `3y`, while both
  bounds have the factor `1`.

*Needs:* 2.1; the tableaux of 3.1 and 3.3; Mathlib `real_inner_le_norm`.

### 6.2 Linear and quadratic invariants

Prove, for every tableau `T`, every `f`, and every stage vector `k` (`T.IsStage f t y h k`;
neither uniqueness of `k` nor a Lipschitz condition on `f` is assumed, here and in 6.1) with
step `z = y + h • ∑ i, b i • k i`:

- **linear invariants:** if `ℓ : E →ₗ[ℝ] G` to a real vector space `G` satisfies
  `ℓ (f t u) = 0` for all `t`, `u`, then `ℓ z = ℓ y`;
- **quadratic invariants (Cooper's theorem):** if `b i A i j + b j A j i = b i b j` for all
  `i`, `j`, and `B : LinearMap.BilinForm ℝ E` satisfies `B (f t u) u + B u (f t u) = 0` for all
  `t`, `u`, then `B z z = B y y` (`ButcherTableau.bilin_add_smul_sum_eq_of_isStage`). The form
  `B` need not be symmetric or continuous.

Route: with `Y i = y + h • ∑ j, A i j • k j`, so that `k i = f (t + c i * h) (Y i)`,
`B z z − B y y = h ∑ i, b i (B (k i) (Y i) + B (Y i) (k i)) − h² ∑ i j, (b i A i j + b j A j i − b i b j) B (k i) (k j)`.
(Sanz-Serna 2015, Theorem 2.1 and (2.8), on `ℝ^D`, where the result is attributed to Cooper;
proved here.)

**Checks.**

- `implicitMidpoint` satisfies the condition: `1 · 1/2 + 1 · 1/2 = 1`. So does the two-stage
  Gauss tableau of Layer 2: for `i = j = 0`, `2 · (1/2)(1/4) = 1/4`, and for `i ≠ j`,
  `(1/2)(1/4 − √3/6) + (1/2)(1/4 + √3/6) = 1/4`.
- `explicitEuler`, `heun`, `rk4`, `implicitEuler` and `trapezoid` do not: for `i = j = 0` the
  condition reads `2 b 0 A 0 0 = (b 0)²`, which is `0 = 1`, `0 = 1/4`, `0 = 1/36`, `2 = 1` and
  `0 = 1/4`.
- `E = ℝ²`, `f t u = J u`, `B` the inner product: `explicitEuler` multiplies `B u u` by `1 + h²`,
  `implicitEuler` by `1/(1 + h²)`, `implicitMidpoint` by `1` (5.1).
- `f t u = u × (I⁻¹ u)` on `ℝ³` with `I` diagonal and positive (the free rigid body) has the
  invariants `‖u‖²` and `⟪u, I⁻¹ u⟫`; `implicitMidpoint` preserves both.
- Linear invariants: for `f t u = M u` on `ℝ^d` with all column sums of `M` zero, the sum of
  the coordinates is preserved by every step of every tableau, `explicitEuler` included, which
  does not preserve the quadratic invariant of the rotation field.

*Needs:* 2.1; the tableaux of 3.1, 3.2, 3.3 and 4.4 and the stability functions of 5.1 in the
Checks.

### 6.3 Symplecticity

Let `V` be a finite-dimensional real normed space, `ω : TauCeti.SymplecticForm V`, `H : V → ℝ`
of class `C²` whose Hamiltonian vector field `X = ω.hamiltonianVectorField H` is `L`-Lipschitz.
Let `T` satisfy `b i A i j + b j A j i = b i b j` for all `i`, `j`, let `∑ j, |A i j| ≤ α` for
all `i`, and `|h| L α < 1`. Let `ψ x = x + h • T.increment (fun _ ↦ X) t x h` be the step map.
Prove that `ψ` is differentiable and, for all `y`, `u`, `v`,

    ω (fderiv ℝ ψ y u) (fderiv ℝ ψ y v) = ω u v

(`ButcherTableau.symplecticForm_fderiv_step_eq`).

Route: `X` is `C¹` (`contDiff_hamiltonianVectorField`) with `‖DX‖ ≤ L`. By 2.3 the stage vector
`k(x)` is the unique zero of `G(x, k) = k − (i ↦ X (x + h • ∑ j, A i j • k j))`, whose partial
derivative in `k` is invertible, being `1` minus an operator of norm at most `|h| L α < 1`; the
inverse function theorem `HasStrictFDerivAt.to_localInverse` applied to `(x, k) ↦ (x, G(x, k))`
makes `k` differentiable, and uniqueness identifies it with `T.stages`. The derivatives
`K i = D(k i)(y) u` satisfy the stage equations of the linearized field, and the computation of
6.2 for the bilinear expression `ω (·) (·)` in the two variations, with
`apply_fderiv_hamiltonianVectorField_add` in place of the invariance hypothesis, gives the
claim. (Sanz-Serna 2015, Theorem 2.2, where the result is attributed to Lasagni, to Sanz-Serna
and to Suris; proved here.)

**Checks.**

- `implicitMidpoint` on `V = ℝ²`, `ω (q, p) (q', p') = q p' − p q'`, `H = (q² + p²)/2`, for which
  `X (q, p) = (p, −q)` and `L = 1`: the step map is linear with matrix
  `(1 − h²/4, h; −h, 1 − h²/4)/(1 + h²/4)`, of determinant `1`, for `|h| < 2`.
- `explicitEuler` on the same system has step matrix `(1, h; −h, 1)` of determinant `1 + h²`,
  and `implicitEuler` has determinant `1/(1 + h²)`: neither preserves `ω`, and neither satisfies
  the condition (6.2).
- `h = 0`: `ψ` is the identity.

*Needs:* 2.1, 2.3, 6.2; the tableaux of 3.1 and 3.3 in the Checks; Mathlib
`HasStrictFDerivAt.to_localInverse`; Tau Ceti
`TauCeti.SymplecticForm`, `TauCeti.SymplecticForm.hamiltonianVectorField`,
`TauCeti.SymplecticForm.contDiff_hamiltonianVectorField`,
`TauCeti.SymplecticForm.apply_fderiv_hamiltonianVectorField_add`.

### Examples

The harmonic oscillator and the free rigid body with the implicit midpoint method and the
two-stage Gauss method.

### Dependencies

Layer 6 uses 2.1, 2.3, the tableaux of 3.1, 3.2, 3.3 and 4.4, the stability functions of 5.1,
Mathlib's `real_inner_le_norm` and
`HasStrictFDerivAt.to_localInverse`, and the Tau Ceti declarations on symplectic forms and
Hamiltonian vector fields named in 6.3.

## Downstream consumers

The stability theorem 1.3 is the deterministic part of the error analysis of time-stepping
schemes for evolution equations and of sampling schemes built on discretized flows. The
Lipschitz and defect bounds of Layers 2 and 3 give explicit step-size conditions for rigorous
enclosures of solutions. Target 6.3 supplies symplectic integrators to developments built on Tau
Ceti's Hamiltonian flows.

## Provenance

The Isabelle Archive of Formal Proofs entry *Ordinary Differential Equations* by F. Immler and
J. Hölzl (BSD licence) contains theories on one-step methods, the Euler method and Runge–Kutta
methods, used there for rigorous numerical enclosures. It is reference material, not the
specification.

## References

- J. C. Butcher, *Runge–Kutta methods*, Scholarpedia **2**(9):3147, 2007, revision 91735,
  <http://www.scholarpedia.org/article/Runge-Kutta_methods>.
- D. Mirzaei, *Lecture notes: numerical solution of ODEs*, arXiv:2412.19959v1, 2024.
- J. M. Sanz-Serna, *Symplectic Runge–Kutta schemes for adjoint equations, automatic
  differentiation, optimal control and more*, arXiv:1503.04021v2, 2015.
- E. Süli, *Numerical solution of ordinary differential equations*, lecture notes, Mathematical
  Institute, University of Oxford, version of 2 March 2022,
  <https://people.maths.ox.ac.uk/suli/nsodes.pdf>.

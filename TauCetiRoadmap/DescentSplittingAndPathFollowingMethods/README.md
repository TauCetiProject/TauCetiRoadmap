# Roadmap: descent, splitting and path-following methods

**Summary.** This roadmap builds the convergence theory of the main iterative methods of
continuous optimization that go beyond plain gradient steps and local Newton theory:
- line searches: the existence of steps satisfying the Wolfe conditions, Zoutendijk's theorem and
  convergence of the gradient to zero for directions bounded away from orthogonality;
- trust-region methods: the decrease achieved by the Cauchy point and the global convergence of
  the basic trust-region algorithm, with a liminf result when every improvement is accepted and a
  limit result when acceptance needs a fixed fraction of the predicted decrease;
- quasi-Newton methods with a line search: acceptance of the unit step near a nondegenerate
  minimizer, positive definiteness along a BFGS run, global convergence of BFGS on a strongly
  convex level set, and its superlinear convergence;
- lower complexity bounds for first-order methods that move in the span of the gradients seen so
  far, for smooth convex functions in finite dimension and for strongly convex functions on ℓ²;
- monotone operators in Hilbert space: firm nonexpansiveness, Minty's theorem, resolvents and
  their identification with proximal maps;
- fixed-point and splitting iterations: Fejér monotonicity, the Krasnosel'skiĭ–Mann iteration, the
  proximal-point algorithm, forward–backward and Douglas–Rachford splitting, and the ergodic rate
  and weak convergence of the primal–dual hybrid gradient method;
- self-concordant barriers with a barrier parameter, the central path, and the short-step
  path-following method with an explicit iteration bound.

It consumes the BFGS update and the Dennis–Moré characterization of the merged roadmap
NewtonAndQuasiNewtonMethods, the proximal map and accelerated rates of FirstOrderOptimization,
the monotonicity notions of ConvexAnalysisAndDuality and the self-concordance theory and damped
Newton method of InteriorPointMethods; NonlinearProgrammingOptimality supplies the optimality
conditions that the methods target. Its results are used by numerical methods for optimal
control, inverse problems and imaging, statistical estimation and machine learning, and by the
analysis of interior-point solvers. The material is a synthesis of Nocedal–Wright, Nesterov,
Bauschke–Combettes, Chambolle–Pock and Boumal (see [References](#references)). Headlines that
restate a source result cite a theorem, definition or equation number with its printed page;
corollaries and adaptations carry a proof route.

Suggested.lean states, against the pinned Mathlib and Tau Ceti, the headlines below that carry
a Lean name, each with every conclusion the README attaches to it, and the definitions those
statements need. It is not an exhaustive acceptance test; the headlines without a Lean name are
targets of the same standing, stated in prose.

Suggested home: TauCeti/Analysis/Optimization/ for Layers 1–4 and 8 and
TauCeti/Analysis/MonotoneOperator/ for Layers 5–7.

## How to read the build

Layers 1 and 2 are the two globalization strategies for smooth minimization in a real Hilbert
space. Both rest on a one-step decrease estimate (Armijo with the curvature condition in 1.2, the
Cauchy decrease in 2.1) summed over the run against a lower bound of `f`. Layer 3 adds the local
theory: 3.1 is the bridge from a Dennis–Moré type condition on the directions to acceptance of the
unit step, and 3.2 applies it to BFGS. Layer 4 is independent of Layers 1–3 and gives the
matching lower bounds for first-order span methods.

Layers 5–7 are the monotone-operator side. Layer 5 builds resolvents of maximal monotone graphs,
and Layer 6 proves weak convergence of the classical splitting iterations through one engine, the
Fejér monotonicity lemma 6.1 applied to an averaged map. Layer 7 is the primal–dual hybrid
gradient method, whose rate is an inequality between saddle-function values and whose convergence
is again 6.1, in a metric twisted by `K`.

Layer 8 extends the self-concordance theory of InteriorPointMethods by the barrier parameter `ν`:
barrier calculus (8.1–8.2), the barrier inequality 8.3, minimizers and the full Newton step from
a small Newton decrement (8.4), central points and their gaps (8.5–8.6), and the short-step
method (8.7).

The layers are in build order: each layer needs only earlier layers and the suppliers.

## Conventions

- **Spaces.** Layers 1, 2 and 5–7 work in a real Hilbert space `E` with Mathlib's `gradient`
  (notation `∇ f`) and Hessian `fderiv ℝ (∇ f)`. BFGS runs live on `EuclideanSpace ℝ ι`, whose
  vectors are moved to `ι → ℝ` by `WithLp.toLp` and `.ofLp` so that the matrix update `bfgsUpdate`
  applies; a matrix acts on vectors by `Matrix.toEuclideanCLM`. Layer 8 works in a
  finite-dimensional normed space with the iterated `fderiv` of InteriorPointMethods.
- **Methods are predicates or maps.** Line-search and trust-region runs are predicates on
  sequences (`IsWolfeStep`, `IsTrustRegionRun`, `IsBFGSRun`), and their theorems quantify over
  every sequence satisfying them; PDHG and path following are iterates of explicit step maps
  (`pdhgSeq`, `pathFollowingSeq`). A first-order method in Layer 4 is any sequence satisfying
  `IsSpanFirstOrder`, so the lower bounds hold for every span method at once.
- **Weak convergence** is `WeakTendsto x z`: convergence of `toWeakSpace ℝ E ∘ x` to
  `toWeakSpace ℝ E z` in Mathlib's weak topology `WeakSpace ℝ E`. In a Hilbert space this is the
  convergence of every pairing ⟨y, x_n⟩ (Riesz). Strong convergence of the splitting iterations is
  not claimed and fails in infinite dimension.
- **Monotone operators are graphs** `Γ : Set (E × E)`; monotonicity is `IsMonotoneSet (innerₗ E)`
  and maximality is Mathlib's `Maximal`. The zeros of `Γ` are the `z` with (z, 0) ∈ Γ.
- **Extended values.** Proper convex functions take values in `EReal` with the
  `ClosedProperConvex` convention of FirstOrderOptimization; conjugates are Tau Ceti's
  `fenchelConjugate`. Every `EReal` statement is an upper bound written with `+`, and the PDHG
  gap is stated only for `x ∈ dom g` and `y ∈ dom f⋆`.
- **Rates.** Superlinear convergence is ‖x (k + 1) - x⋆‖ / ‖x k - x⋆‖ → 0. A divergent series of
  nonnegative terms is `¬ Summable`. A liminf of zero is `∃ᶠ k in atTop, ‖∇ f (x k)‖ < ε` for
  every `ε > 0`.
- **Junk values.** `x / 0 = 0`; `ContinuousLinearMap.inverse` is `0` off invertible maps; `√` is
  `0` on negative reals; `resolvent` and `prox` return their argument where no unique point exists.
  The Cauchy bound has an explicit case for `B = 0` rather than ‖g‖ / 0 = 0. Every theorem
  carries the hypothesis that keeps it off these values: a nonvanishing gradient for runs that
  stop at stationary points, `c ≠ 0` for path following, and `0 ≤ ν` where a barrier parameter is
  added or square-rooted.

## Layer 1: line searches

### 1.1 Wolfe steps

`IsWolfeStep f c₁ c₂ x p α` says `α > 0`, sufficient decrease f(x + αp) ≤ f(x) + c₁α⟨∇f(x), p⟩
and the curvature condition c₂⟨∇f(x), p⟩ ≤ ⟨∇f(x + αp), p⟩ (Nocedal–Wright (3.6), p. 34);
`IsStrongWolfeStep` replaces the curvature condition by the two-sided bound (3.7), p. 34.

- **Strong Wolfe steps exist** (`exists_Ioo_isStrongWolfeStep`): for `f` of class C¹, a descent
  direction `p`, `f` bounded below on the ray and 0 < c₁ < c₂ < 1, some open interval of steps
  satisfies the strong Wolfe conditions. Nocedal–Wright, Lemma 3.1, p. 35.
- **Strong Wolfe implies Wolfe** (`IsStrongWolfeStep.isWolfeStep`), along a descent direction;
  proved in Suggested.lean.

**Checks.**
- For f(x) = x² at x = 1, p = −1, c₁ = 0.1, c₂ = 0.9 the strong Wolfe steps are exactly
  [0.1, 1.8]: sufficient decrease gives α ≤ 1.8 and the curvature bound gives |1 − α| ≤ 0.9.
- (negative control) For p = +1 at the same point no step satisfies sufficient decrease with
  c₁ > 0, so the descent hypothesis cannot be dropped.

### 1.2 Zoutendijk's theorem

- **Zoutendijk** (`summable_zoutendijk`): if 0 < c₁, c₂ < 1, `f` is bounded below, `f` is
  differentiable with `∇ f` Lipschitz on an open set containing the initial sublevel set, every
  `p k` is a descent direction and every step is a Wolfe step, then
  ∑ ⟨∇f(x_k), p_k⟩² / ‖p_k‖² < ∞. Nocedal–Wright, Theorem 3.2, p. 38; the proof gives the
  one-step decrease f(x_{k+1}) ≤ f(x_k) - c₁(1 - c₂)/L · ⟨∇f(x_k), p_k⟩²/‖p_k‖², and the iterates
  stay in the sublevel set by sufficient decrease. The source's c₁ < c₂ is needed only for the
  existence of Wolfe steps (1.1), not by the proof, and is not a hypothesis.
- **Angle condition** (`tendsto_gradient_of_angle`): under the same hypotheses, if
  δ‖∇f(x_k)‖‖p_k‖ ≤ −⟨∇f(x_k), p_k⟩ with `δ > 0`, then ∇f(x_k) → 0. Nocedal–Wright
  (3.17)–(3.18), p. 39. Route: the summand of 1.2 is at least δ²‖∇f(x_k)‖².
- **Quasi-Newton directions** (`div_opNorm_mul_le_neg_inner`): if B p = −g and
  m‖v‖² ≤ ⟨Bv, v⟩ with `m ≥ 0`, then (m/‖B‖)‖g‖‖p‖ ≤ −⟨g, p⟩. With m = ‖B⁻¹‖⁻¹ this is the
  angle bound cos θ ≥ 1/M of Nocedal–Wright (3.19), p. 40, for ‖B‖‖B⁻¹‖ ≤ M.

**Checks.**
- On f(x) = ½xᵀAx with A = diag(1, 10), steepest descent with exact line search from (10, 1) has
  cos θ_k = 1, and ‖∇f(x_k)‖ falls by the factor (κ − 1)/(κ + 1) = 9/11 = 0.8182 per step, to
  8.4·10⁻⁵ after 60 steps.
- (negative control) For f = ½‖x‖² on ℝ² from (1, 0), with R the rotation by π/2, the descent
  directions p_k = −∇f(x_k) + (k + 1)R∇f(x_k) and the exact steps α_k = 1/(1 + (k + 1)²), which
  are Wolfe steps for c₁ ≤ 1/2 and every c₂ ∈ (0, 1), satisfy the hypotheses of
  `summable_zoutendijk`; cos θ_k = (1 + (k + 1)²)^{−1/2} → 0 and ‖∇f(x_k)‖ decreases to 0.5216.
  The angle hypothesis of `tendsto_gradient_of_angle` is what turns summability into
  convergence.
- (negative control) `m ≥ 0` is needed in `div_opNorm_mul_le_neg_inner`: for B = diag(2, −1),
  m = −1 and p = (0, 1) the left side is −0.5 and the right side is −1.

## Layer 2: trust regions

### 2.1 The Cauchy point

trModel g B p = ⟨g, p⟩ + ⟨p, Bp⟩/2 is the model (4.2) without its constant term;
`cauchyPoint g B Δ` is the minimizer of the model along −g within radius Δ (Nocedal–Wright
(4.11)–(4.12), p. 72), and `cauchyBound g B Δ` is ‖g‖/2 · min(Δ, ‖g‖/‖B‖), read as ‖g‖Δ/2 at B = 0.
No symmetry of `B` is needed.

- **Cauchy decrease** (`trModel_cauchyPoint_le`): for Δ > 0 the Cauchy point lies in the trust
  region and trModel g B (cauchyPoint g B Δ) ≤ −cauchyBound g B Δ. Nocedal–Wright, Lemma 4.3,
  p. 78; Boumal, Lemma 6.15, p. 130, states the same step with the constant 1/2 in a Riemannian
  setting.
- **Exact minimizers** (`trModel_le_of_isMinOn`): a minimizer of the model over the closed ball
  satisfies (4.20) with `c₁ = 1`; proved in Suggested.lean from the Cauchy decrease.

**Checks.**
- On 3000 random cases with B indefinite or zero, dimension 1 to 4 and random Δ, the Cauchy point
  lies in the ball and the slack −m(p^C) − cauchyBound is nonnegative to rounding (minimum
  −1.1·10⁻¹⁶); equality occurs in dimension one when ⟨g, Bg⟩ = ‖B‖‖g‖² and τ < 1.
- At g = 0 the Cauchy point is 0 and both sides vanish.
- (negative control) Without the case split, Lean's ‖g‖/0 = 0 would make the bound 0 at B = 0, and
  (4.20) would then admit the zero step, which makes no progress.

### 2.2 Global convergence

`trRatio` is the ratio (4.4), p. 68, of actual to predicted reduction, and
`IsTrustRegionRun` is a run of Nocedal–Wright, Algorithm 4.1, p. 69, with threshold η, radius
bound Δmax, steps ‖p_k‖ ≤ γΔ_k and model decrease at least c₁ · `cauchyBound` (4.20), p. 77.

- **η = 0** (`IsTrustRegionRun.frequently_norm_gradient_lt`): with c₁ > 0, ‖B_k‖ ≤ β, f bounded
  below on the initial sublevel set S, ∇f Lipschitz and f differentiable on the R₀-thickening of
  S, and no gradient zero along the run, liminf ‖∇f(x_k)‖ = 0. Nocedal–Wright, Theorem 4.5, p. 80.
- **0 < η < 1/4** (`IsTrustRegionRun.tendsto_norm_gradient`): under the same hypotheses
  ∇f(x_k) → 0. Nocedal–Wright, Theorem 4.6, p. 82.

The source's γ ≥ 1 and c₁ ≤ 1 serve only to give Δ̄ ≤ ε/β in the proof of Theorem 4.5 (p. 81),
and putting ε/β into the minimum that defines Δ̄ removes both; a run with γ ≤ 0 cannot meet
(4.20).

**Checks.**
- On the Rosenbrock function from (−1.2, 1) with Cauchy steps, exact Hessians, η = 0.1, Δ₀ = 1 and
  Δmax = 10, the run reaches ‖∇f‖ < 10⁻⁶ at (1, 1) after 14110 iterations.
- (negative control) For f(x) = −x on ℝ, which is unbounded below, with B_k = 0, every Cauchy
  step is accepted with ratio 1 and ‖∇f(x_k)‖ = 1 for every k: the lower bound on f is needed.

## Layer 3: quasi-Newton methods with a line search

### 3.1 The unit step

- **Unit step and superlinear rate** (`eventually_isWolfeStep_one_and_superlinear`): in finite
  dimension, for f of class C², x_{k+1} = x_k + α_k p_k with p_k ≠ 0, x_k → x⋆, ∇f(x⋆) = 0,
  positive definite Hessian at x⋆ and ‖∇f(x_k) + ∇²f(x_k)p_k‖/‖p_k‖ → 0 (3.35), the unit step is
  eventually a Wolfe step for any c₁ < 1/2 and c₂ > 0; and if α_k = 1 eventually, the convergence
  is superlinear. Nocedal–Wright, Theorem 3.6, p. 46, printed with c₁ ≤ 1/2; at c₁ = 1/2 part (i)
  fails (Checks), so the statement uses c₁ < 1/2.

The Wolfe property of the actual steps is not a hypothesis: part (i) concerns the unit step only,
and part (ii) assumes α_k = 1.

**Checks.**
- For f(x) = x²/2 + x³ and the Newton direction p = −f′(x)/f″(x), sufficient decrease at α = 1
  with c₁ = 1/2 fails for every x < 0 near 0: the excess f(x + p) − f(x) − ½f′(x)p is 5.36·10⁻³
  at x = −0.1, 1.10·10⁻⁶ at x = −0.01 and 1.0·10⁻¹² at x = −10⁻⁴. A sequence x_k → 0⁻ with
  these directions satisfies every other hypothesis, so c₁ = 1/2 falsifies part (i).
- The same function refutes the printed c₁ ≤ 1/2 under the source's own hypotheses: from
  x₀ = −0.01 the steps α_k = 1/2 along the Newton direction are Wolfe steps for c₁ = 1/2 and
  c₂ = 0.9 (x₁ = −0.00484), the iterates stay negative and tend to 0, and the unit step is never
  admissible.
- At c₁ = 0.49 the unit step is accepted at x = −10⁻³ and x = −10⁻⁴, as part (i) predicts.

### 3.2 BFGS runs

bfgsDirection B g = −B⁻¹g, and `IsBFGSRun f c₁ c₂ x B α` is a run of Nocedal–Wright,
Algorithm 6.1, p. 140: B₀ positive definite, Wolfe steps along `bfgsDirection`, and the update
`bfgsUpdate` along s_k = x_{k+1} − x_k and y_k = ∇f(x_{k+1}) − ∇f(x_k).

- **The run is well defined** (`IsBFGSRun.posDef`): for c₂ < 1 and no gradient zero along the
  run, every B_k is positive definite and s_kᵀy_k > 0. Route: the direction is a descent
  direction, the curvature condition gives y_kᵀs_k ≥ (c₂ − 1)α_k∇f(x_k)ᵀp_k > 0, and
  NewtonAndQuasiNewtonMethods 3.2 gives positive definiteness of the update (Nocedal–Wright
  (6.8), p. 138).
- **Global convergence** (`IsBFGSRun.tendsto_isMin`): for c₁ > 0, c₂ < 1, f of class C², a
  convex initial sublevel set on which m‖z‖² ≤ ⟨∇²f(y)z, z⟩ ≤ M‖z‖² with m > 0 (Assumption 6.1,
  p. 153), the iterates converge to the global minimizer of f. Nocedal–Wright, Theorem 6.5,
  p. 154.
- **Superlinear convergence** (`IsBFGSRun.superlinear`): if x_k → x⋆ with ∇f(x⋆) = 0, positive
  definite Hessian at x⋆ that is Lipschitz at x⋆ (Assumption 6.2, p. 156), and
  ∑‖x_k − x⋆‖ < ∞ (6.52), p. 156, then the Dennis–Moré condition
  ‖(B_k − ∇²f(x⋆))s_k‖/‖s_k‖ → 0 holds, the unit step is eventually a Wolfe step for c₁ < 1/2 and
  0 < c₂ < 1, and if α_k = 1 eventually the convergence is superlinear. Nocedal–Wright,
  Theorem 6.6, p. 158; the Dennis–Moré condition is the last display of its proof, p. 160, and
  the unit step follows by 3.1. The Dennis–Moré characterization itself is
  NewtonAndQuasiNewtonMethods 4.1 and is not restated.

The hypothesis ∇f(x⋆) = 0 with a positive definite Hessian is implicit in the source, whose proof
uses the square root of ∇²f(x⋆).

**Checks.**
- On f(x) = ½xᵀAx − bᵀx + ∑ log cosh x_i in dimension 4 with A positive definite, BFGS with a
  bisection Wolfe search (c₁ = 10⁻⁴, c₂ = 0.9) from (3, 3, 3, 3) keeps B_k positive definite and
  s_kᵀy_k > 0 at every step, takes unit steps in its last five iterations, and the error ratios
  fall to 0.17, 0.11, 0.11, 0.05, 0.04.
- (negative control) Without the curvature condition, a step with y_kᵀs_k < 0 (a backtracking
  step on a nonconvex f) gives an indefinite update by NewtonAndQuasiNewtonMethods 3.2, so c₂ < 1
  with the curvature condition is what keeps the run defined.

## Layer 4: lower complexity bounds

### 4.1 The chain quadratic and the span lemma

`IsSpanFirstOrder f x` says that x_k − x_0 lies in the span of ∇f(x_0), …, ∇f(x_{k−1})
(Nesterov, Assumption 2.1.4, p. 69). `chainQuadratic n k L` is Nesterov's function
L/4(½[x₀² + ∑_{i<k−1}(x_i − x_{i+1})² + x_{k−1}²] − x₀) with coordinates read by `chainCoord`, and
`chainMinimizer n k` has coordinates 1 − (i + 1)/(k + 1) for i < k and 0 after.

- **The chain quadratic** (`chainQuadratic_spec`): for 1 ≤ k ≤ n it is smooth and convex with
  L-Lipschitz gradient, `chainMinimizer n k` minimizes it with value L/8(−1 + 1/(k + 1)), and
  ‖`chainMinimizer n k`‖² ≤ (k + 1)/3. Nesterov, §2.1.2, pp. 69–70.
- **The span lemma** (`chainCoord_eq_zero_of_isSpanFirstOrder`): a span method started at 0 on any
  chain quadratic has x_k supported in the first k coordinates. Nesterov, Lemma 2.1.5, p. 71.

**Checks.**
- For L = 2 and (n, k) = (5, 1), (5, 2), (7, 3), (9, 4) the gradient vanishes at the minimizer to
  10⁻¹⁶, the values are −0.125, −0.1667, −0.1875, −0.2 = L/8(−1 + 1/(k + 1)), the squared norms
  0.25, 0.556, 0.875, 1.2 are below (k + 1)/3, and the largest Hessian eigenvalue is below L.
- ‖`chainMinimizer n k`‖² = k(2k + 1)/(6(k + 1)), which is at most (k + 1)/3.

### 4.2 The lower bounds

- **Smooth convex functions** (`exists_lowerBound_smoothConvex`): for 2k + 1 ≤ n and every x₀
  there are a smooth convex f on `EuclideanSpace ℝ (Fin n)` with L-Lipschitz gradient and a
  minimizer x⋆ such that every span method from x₀ satisfies
  f(x_k) − f(x⋆) ≥ 3L‖x₀ − x⋆‖²/(32(k + 1)²) and ‖x_k − x⋆‖² ≥ ‖x₀ − x⋆‖²/8. Nesterov,
  Theorem 2.1.7, p. 71, with the witness f_{2k+1}(· − x₀). The source's k ≥ 1 is not needed: at
  k = 0 the witness f₁ gives the bound (Checks). The quantifiers are ∀k ∃f.
- **Strongly convex functions on ℓ²** (`exists_lowerBound_strongConvex`): for 0 < μ ≤ L and every
  x₀ ∈ ℓ² there are a smooth μ-strongly convex f with L-Lipschitz gradient and minimizer x⋆ such
  that every span method from x₀ satisfies, for every k and q = (√(L/μ) − 1)/(√(L/μ) + 1),
  ‖x_k − x⋆‖² ≥ q^{2k}‖x₀ − x⋆‖² and f(x_k) − f(x⋆) ≥ μ/2 · q^{2k}‖x₀ − x⋆‖². Nesterov,
  Theorem 2.1.13, p. 79, stated there for L/μ > 1; at L = μ, q = 0 and the bounds hold by strong
  convexity. The quantifiers are ∃f ∀k, and the space is `lp (fun _ : ℕ => ℝ) 2`.
- **Optimality of accelerated methods**, stated in prose: the constant-momentum accelerated rate
  (1 − 1/√κ)^k of FirstOrderOptimization 4.3, at g = 0, matches the second bound up to the
  constant in the exponent, and the 1/k² rate of FirstOrderOptimization 4.2 matches the first up
  to a constant factor. Chambolle–Pock, Theorems 4.3–4.4, p. 187, restate both bounds.

**Checks.**
- With L = 1, n = 2k + 1 and x₀ = 0, the best span point for k = 0, …, 5 has gaps 0.0625, 0.03125,
  0.0208, 0.0156, 0.0125, 0.0104 against the bounds 0.0234, 0.0205, 0.0159, 0.0128, 0.0107,
  0.0092, and squared distances 0.25, 0.375, 0.528, 0.688, 0.85, 1.01 against 0.031, 0.109,
  0.191, 0.273, 0.356, 0.439.
- The ℓ² witness truncated to 400 coordinates with μ = 1 has minimizer coordinates q, q², q³, …:
  1/3, 1/9, 1/27, 1/81 for L = 4 and 2/3, 4/9, 8/27, 16/81 for L = 25, and Hessian norm at most L.
- (negative control) Conjugate gradients on a quadratic in dimension n reaches the minimizer in n
  steps, so the first bound needs k below the dimension: 2k + 1 ≤ n cannot be dropped.

## Layer 5: monotone operators and resolvents

### 5.1 Firm nonexpansiveness

`FirmlyNonexpansiveOn T D` is ‖Tx − Ty‖² + ‖(x − Tx) − (y − Ty)‖² ≤ ‖x − y‖² on D
(Bauschke–Combettes, Definition 4.1(i), p. 69).

- **Characterizations** (`firmlyNonexpansiveOn_tfae`): T is firmly nonexpansive on D iff Id − T is,
  iff 2T − Id is nonexpansive on D, iff ‖Tx − Ty‖² ≤ ⟨x − y, Tx − Ty⟩, iff
  0 ≤ ⟨Tx − Ty, (Id − T)x − (Id − T)y⟩. Bauschke–Combettes, Proposition 4.4(i)–(v), p. 70.

**Checks.**
- The rotation by π/2 in ℝ² is nonexpansive but not firmly nonexpansive: ⟨x − y, R(x − y)⟩ = 0
  while ‖R(x − y)‖² > 0.
- The projection onto a closed convex set is firmly nonexpansive (FirstOrderOptimization 3.1),
  and so is ½(Id + R) for the rotation R.

### 5.2 Minty's theorem and resolvents

`resolvent Γ γ z` is the unique x with (x, γ⁻¹(z − x)) ∈ Γ when there is one, and z otherwise
(Bauschke–Combettes, Proposition 23.2(ii), p. 393).

- **Resolvent membership** (`resolvent_mem`): where the defining point is unique, the resolvent is
  that point; proved in Suggested.lean.
- **Minty** (`maximal_isMonotoneSet_iff`): a monotone graph is maximal iff for every z some x has
  (x, z − x) ∈ Γ, that is ran(Id + Γ) = E. Bauschke–Combettes, Theorem 21.1, p. 369.
- **Resolvents of maximal monotone graphs** (`resolvent_spec`): for γ > 0 the defining point
  exists and is unique for every z, and the resolvent is firmly nonexpansive on E.
  Bauschke–Combettes, Corollary 23.11(i), p. 396. Route: Minty applied to γΓ for existence, and
  monotonicity with 5.1 for uniqueness and firmness.
- **Every firmly nonexpansive map is a resolvent** (`maximal_graph_resolvent_eq`): for T firmly
  nonexpansive on E the graph {(Tz, z − Tz) | z ∈ E} is maximal monotone with resolvent T at
  γ = 1.
  Bauschke–Combettes, Proposition 23.8 and Corollary 23.9, pp. 395–396.
- **Proximal maps are resolvents** (`resolvent_subdifferential_eq_prox`): for g closed proper
  convex and η > 0 the resolvent of the subdifferential graph is `prox g η`.
  Bauschke–Combettes, Example 23.3, p. 394. Route: existence and uniqueness of the proximal point
  and its subdifferential characterization, FirstOrderOptimization 3.2.

**Checks.**
- For the rotation graph {(x, Rx)} in ℝ² the resolvent is (I + γR)⁻¹, and Minty holds because
  I + γR is invertible; the graph is maximal monotone but not a subdifferential, since R is not
  symmetric.
- For Γ = {(x, x)} the resolvent is z/(1 + γ), and for the subdifferential of |x| it is soft
  thresholding at γ.
- (negative control) For the monotone graph {(0, 0)} the range of Id + Γ is {0}, so the graph is
  not maximal and its resolvent returns z off 0.

## Layer 6: fixed-point and splitting iterations

### 6.1 Fejér monotonicity

- **Fejér monotone sequences** (`exists_weakTendsto_of_fejer`): a sequence Fejér monotone with
  respect to a nonempty C whose weak sequential cluster points all lie in C converges weakly to a
  point of C. Bauschke–Combettes, Theorem 5.5, p. 92, via Lemma 2.47, p. 38.

**Checks.**
- An orthonormal sequence in ℓ² is Fejér monotone with respect to {0} and converges weakly but not
  strongly (Bauschke–Combettes, Example 5.6, p. 92).
- (negative control) For C empty Fejér monotonicity is vacuous and x_n = n·e₁ has no weak cluster
  point, so the nonemptiness of C cannot be dropped.

### 6.2 Iterations

- **Krasnosel'skiĭ–Mann** (`krasnoselskiiMann`): for T nonexpansive from a closed convex D to
  itself with a fixed point, θ_n ∈ [0, 1] with ∑θ_n(1 − θ_n) = ∞ and x₀ ∈ D, the iteration
  x_{n+1} = x_n + θ_n(Tx_n − x_n) is Fejér monotone with respect to the fixed points,
  Tx_n − x_n → 0, and x_n converges weakly to a fixed point. Bauschke–Combettes, Theorem 5.15,
  pp. 96–97.
- **Proximal point** (`proximalPoint_weakTendsto`): for Γ maximal monotone with a zero and
  γ_n > 0 with ∑γ_n² = ∞, the iteration x_{n+1} = J_{γ_nΓ}x_n converges weakly to a zero.
  Bauschke–Combettes, Theorem 23.41(i), p. 406.
- **Forward–backward** (`forwardBackward_weakTendsto`): for Γ maximal monotone, C β-cocoercive,
  0 < γ < 2β, δ = 2 − γ/(2β), θ_n ∈ [0, δ] with ∑θ_n(δ − θ_n) = ∞ and a zero of Γ + C, the
  iteration x_{n+1} = x_n + θ_n(J_{γΓ}(x_n − γCx_n) − x_n) converges weakly to a zero of Γ + C,
  and Cx_n → Cz for every zero z. Bauschke–Combettes, Theorem 26.14(i)–(ii), p. 478. This is the
  operator form; the function-value rate of proximal gradient descent is FirstOrderOptimization
  3.4.
- **Douglas–Rachford** (`douglasRachford_weakTendsto`): for A, B maximal monotone with a zero of
  A + B, γ > 0 and θ_n ∈ [0, 2] with ∑θ_n(2 − θ_n) = ∞, the sequence
  y_{n+1} = y_n + θ_n(J_{γA}(2J_{γB}y_n − y_n) − J_{γB}y_n) converges weakly to some ȳ,
  J_{γB}ȳ is a zero of A + B, the shadows J_{γB}y_n and J_{γA}(2J_{γB}y_n − y_n) approach each
  other, and J_{γB}y_n converges weakly to J_{γB}ȳ. Bauschke–Combettes, Theorem 26.11(i)–(iii),
  p. 473.

**Checks.**
- For the rotation R of ℝ² by π/2 (fixed point 0) the Picard iteration θ_n = 1 keeps ‖x_n‖ = 1,
  while θ_n = 1/2 gives ‖x_n‖ = (1/√2)^n → 0: the divergence hypothesis excludes
  θ_n = 1, and it is needed.
- The proximal-point iteration on the rotation graph from (1, 0) with γ = 1 contracts by 1/√2 per
  step and reaches 0 to machine precision in 2000 steps; for Γ the subdifferential graph of g it is
  proximal minimization, by 5.2.
- In one dimension, forward–backward with A the normal cone of [1, ∞), C = Id, γ = 1.5 and θ = 1
  from x₀ = 5 converges to the zero 1. Douglas–Rachford for the same pair with γ = 1 and θ = 1 from
  y₀ = 4 has y_n → 2 = ȳ and shadows J_{γB}y_n = y_n/2 → 1 = J_{γB}ȳ.

## Layer 7: the primal–dual hybrid gradient method

saddleLagrangian K f g x y = ⟨y, Kx⟩ + g(x) − f⋆(y) (Chambolle–Pock (3.12), p. 178) with
f⋆ = `fenchelConjugate (innerₗ Y) f`; `IsSaddlePoint` is the saddle-point property; `pdhgStep` is
x⁺ = prox_{τg}(x − τK*y), y⁺ = prox_{σf⋆}(y + σK(2x⁺ − x)) (Algorithm 6, p. 212), and `pdhgSeq` is
its iterates.

- **Ergodic gap** (`pdhg_gap_le`): for f and g closed proper convex, τ, σ > 0 with τσ‖K‖² ≤ 1,
  k ≥ 1, x ∈ dom g and y ∈ dom f⋆, the averages X̄_k, Ȳ_k of the iterates 1, …, k satisfy
  L(X̄_k, y) ≤ L(x, Ȳ_k) + (‖x − x⁰‖²/τ + ‖y − y⁰‖²/σ)/k. Chambolle–Pock, Theorem 5.1, (5.10),
  pp. 213–214, with h = 0, so that (5.9) reads τσ‖K‖² ≤ 1.
- **Weak convergence** (`pdhg_weakTendsto`): if moreover τσ‖K‖² < 1 and a saddle point exists,
  the iterates converge weakly to a saddle point. Chambolle–Pock, Theorem 5.1, last sentence,
  p. 214. Route: PDHG is the proximal-point algorithm for the monotone operator (3.15) in the
  metric M of (5.7), p. 213, which is positive definite for τσ‖K‖² < 1; then 6.1.

**Checks.**
- In one dimension with f(u) = u²/2, g(x) = (x − 1)²/2, K = 2, τ = 0.2 and σ = 1.25 (so
  τσ‖K‖² = 1), from (3, −2), the gap minus the bound over 199 iterations and four test pairs
  (x, y) is at most −0.356.
- (negative control) The averages run over the iterates 1, …, k: with the averages over
  0, …, k − 1 instead, the same problem from (100, 100) exceeds the bound by 5.96·10³ within five
  steps on a grid of test pairs, while the stated averages stay below it by at least 4.7·10³.

## Layer 8: self-concordant barriers and short-step path following

### 8.1 Barriers

`IsSelfConcordantBarrier F U ν` is self-concordance (`SelfConcordantOn`, InteriorPointMethods 2.1)
with DF(x)[v]² ≤ ν D²F(x)[v, v] (Nesterov, Definition 5.3.2, p. 369, in the form (5.3.6)). The
blow-up at the frontier is not part of the definition; theorems that need it assume it.

- **The logarithm** (`isSelfConcordantBarrier_neg_log`): −log is a 1-barrier for (0, ∞). Nesterov,
  Example 5.3.1, item 3, p. 370.
- **Linear functions are not barriers** (`not_isSelfConcordantBarrier_id`), for any ν; proved in
  Suggested.lean. Nesterov, Example 5.3.1, item 1, p. 370.

### 8.2 Barrier calculus

- **Sums** (`IsSelfConcordantBarrier.add`): for 0 ≤ ν₁ and 0 ≤ ν₂, F₁ + F₂ is a (ν₁ + ν₂)-barrier on
  U₁ ∩ U₂. Nesterov, Theorem 5.3.2, p. 371. Route: InteriorPointMethods 2.3 for self-concordance,
  Cauchy–Schwarz for the parameter.
- **Affine substitution** (`IsSelfConcordantBarrier.comp_affine`): y ↦ F(Ay + b) is a ν-barrier on
  {y | Ay + b ∈ U}. Nesterov, Theorem 5.3.3, p. 371. Route: InteriorPointMethods 2.2.
- **Polyhedra** (`isSelfConcordantBarrier_logBarrier`): the logarithmic barrier of m strict linear
  inequalities is an m-barrier on their solution set, with `logBarrier` and `strictFeasibleSet` of
  InteriorPointMethods 1.1. Route: the three results above.

**Checks.**
- On (0, 1), F(x) = −log x − log(1 − x) has sup F′²/F″ = 1 on a grid of 999 points and
  |F‴| ≤ 2F″^{3/2}, so it is a 1-barrier; the sum rule gives only ν = 2.
- (negative control) The constant 0 on ℝ satisfies the barrier inequality with ν = −1, and
  0 + (−log) is not a 0-barrier, so the hypotheses 0 ≤ ν_i of the sum rule are needed.

### 8.3 The barrier inequality

- **Barrier inequality** (`IsSelfConcordantBarrier.fderiv_sub_lt`): for ν > 0 and x, y ∈ U,
  DF(x)[y − x] < ν. Nesterov, Theorem 5.3.7(1), (5.3.10), p. 375.

**Checks.**
- For F = −log x − log(1 − x) with ν = 2 the supremum of F′(x)(y − x) over a grid on (0, 1)² is
  0.859.
- (negative control) A constant function on E satisfies the definition with ν = 0 and makes the
  strict inequality fail at y = x, so ν > 0 is needed.

### 8.4 Small Newton decrement

- **Existence of the minimizer** (`existsUnique_isMinOn_of_newtonDecrement_lt_one`): in finite
  dimension, a self-concordant f tending to +∞ at the frontier of U, with positive definite
  Hessian on U and λ(x) < 1 at some x ∈ U, has a unique minimizer on U. Nesterov, Theorem 5.1.13,
  p. 347, with M = 1. The accompanying bound on f(x) − f⋆ is InteriorPointMethods 3.5.
- **The full Newton step** (`newtonMap_mem_and_newtonDecrement_le`): under the same hypotheses, if
  λ(x) < 1 the Newton point x₊ = `newtonMap (fderiv ℝ f) x` lies in U and
  λ(x₊) ≤ (λ(x)/(1 − λ(x)))². Nesterov, Theorem 5.2.2, (5.2.6), p. 356, with M = 1. Route: the
  Dikin ellipsoid, InteriorPointMethods 3.4, and the Hessian comparison 3.2 there.

**Checks.**
- For f(x) = x − log x on (0, ∞), λ(x) = |x − 1| and x₊ = 2x − x², so λ(x₊) = λ(x)²; at x = 0.6,
  λ = 0.4, λ(x₊) = 0.16 ≤ (0.4/0.6)² = 0.444.
- For f = 3x − log x − log(1 − x) at x = 0.3, λ = 0.302 and λ(x₊) = 0.0705 ≤ 0.187.
- (negative control) Without the blow-up at the frontier the Newton point can leave U: f(x) =
  x − log x on U = (0, 1/2) at x = 0.45 has λ = 0.55 and x₊ = 0.6975 ∉ U.

### 8.5 Central points

- **Central points exist** (`existsUnique_isMinOn_linear_add`): in finite dimension, for F
  continuous and strictly convex on a bounded nonempty U and tending to +∞ at the frontier, and
  any functional c and t ∈ ℝ, the function x ↦ t·c(x) + F(x) has a unique minimizer on U. Nesterov
  (5.3.19)–(5.3.21), p. 379; t = 0 gives the analytic center of Definition 5.3.3, p. 377.

**Checks.**
- On (0, 1) with F = −log x − log(1 − x) and c(x) = x the central point is the root of
  t − 1/x + 1/(1 − x) = 0: x⋆(1) = (3 − √5)/2 = 0.381966, x⋆(10) = 0.0901, x⋆(100) = 0.0099.
- (negative control) On U = (0, ∞) with F = −log x and t = −1 the function −x − log x has no
  minimizer, so boundedness of U is needed.

### 8.6 Gaps

- **On the central path** (`centralPath_gap`): for a ν-barrier with 0 ≤ ν, t > 0 and x⋆(t) a
  minimizer of t·c + F on U, c(x⋆(t)) − c(y) ≤ ν/t for every y ∈ U. Nesterov, Theorem 5.3.10,
  (5.3.23), p. 379.
- **Under approximate centering** (`approxCentering_gap`): if moreover F tends to +∞ at the
  frontier, its Hessian is positive definite on U, and λ_{tc+F}(x) ≤ β < 1 at x ∈ U, then
  c(x) − c(y) ≤ (ν + (β + √ν)β/(1 − β))/t for every y ∈ U. Nesterov, Theorem 5.3.10, (5.3.24),
  p. 379.

The source states both against the optimal value c⋆; the form for every y ∈ U avoids an infimum.

**Checks.**
- In the example of 8.5, x⋆(t) ≤ 2/t: 0.382 ≤ 2, 0.0901 ≤ 0.2, 0.0099 ≤ 0.02.
- (negative control) In the zero space every F is a barrier for any ν; with ν < −β²/(1 − β) the
  bound of `approxCentering_gap` is negative, so 0 ≤ ν is needed there.

### 8.7 Short-step path following

`dualLocalNorm` is ‖s‖⋆_x = (s[D²F(x)⁻¹s])^{1/2} for a functional s. `centeringRadius τ` is
β(τ) = τ²(1 + τ + τ/(1 + τ + τ²)) (Nesterov, Lemma 5.2.2, p. 359). `pathFollowingStep F c γ` is the
step (5.3.25), p. 380: t₊ = t + γ/‖c‖⋆_x, then a damped Newton step for t₊c + F with damping
1/(1 + ξ), ξ = λ²/(1 + λ); `pathFollowingSeq` iterates it from (0, x₀) as in scheme (5.3.29),
p. 381.

- **The Newton decrement is a dual norm** (`newtonDecrement_eq_dualLocalNorm`): λ_F(x) is the dual
  local norm of DF(x); proved in Suggested.lean by unfolding.
- **Short-step path following** (`pathFollowingSeq_spec`): in finite dimension, for a ν-barrier F
  tending to +∞ at the frontier with positive definite Hessian, an analytic center x_F, c ≠ 0,
  0 < τ ≤ 1/2, β = β(τ), γ = τ − β and x₀ ∈ U with λ_F(x₀) ≤ β, every iterate k ≥ 1 lies in U,
  satisfies λ_{t_k c+F}(x_k) ≤ β, has t_k ≥ γ(1 − 2β)/((1 − β)‖c‖⋆_{x_F}) · (1 + γ/(β + √ν))^{k−1},
  and has c(x_k) − c(y) ≤ (ν + (β + √ν)β/(1 − β))/t_k for every y ∈ U. Nesterov, Theorem 5.3.11,
  p. 381, with the explicit bounds of its proof, p. 382; Lemma 5.2.2 (keeping β), Lemma 5.3.2
  (‖c‖⋆_x ≤ (β + √ν)/t, (5.3.27), p. 380) and 8.6.
- **Iteration count**, stated in prose: with τ = 0.29, β ≈ 0.126 and γ ≈ 0.164 ((5.3.28), p. 380)
  the gap is at most ε once k − 1 ≥ (1 + (β + √ν)/γ) · ln(C(1 − β)‖c‖⋆_{x_F}/(γ(1 − 2β)ε)) with
  C = ν + (β + √ν)β/(1 − β), since ln(1 + a) ≥ a/(1 + a); the leading term is
  6.11 √ν ln(ν‖c‖⋆_{x_F}/ε) (p. 382).

**Checks.**
- β(0.29) = 0.126238, γ = 0.163762 and 1/γ = 6.1064 < 6.11; at τ = 1/2, β = 0.4464, γ = 0.0536 and
  1 − 2β = 0.1071 > 0.
- On (0, 1) with F = −log x − log(1 − x), ν = 2, c(x) = x, x_F = x₀ = 1/2, for k ≤ 79 and
  τ ∈ {0.29, 1/2} every iterate stays in (0, 1), λ_{t_k c+F}(x_k) ≤ β, t_k is above the lower
  bound and the gap is below its bound; at τ = 0.29, t₁ = 0.463 ≥ 0.396 and t₄₀ = 850.8 ≥ 20.4.
- (negative control) Without c ≠ 0 the step γ/‖c‖⋆_x is Lean's γ/0 = 0, t stays 0 and no gap
  bound holds.

The display for t₁ on p. 382 writes t₁ = γ/‖c‖⋆_{x₀} in one chain with the upper bound
‖c‖⋆_{x₀} ≤ (1 − r₀)⁻¹‖c‖⋆_{x_F} ≤ (1 − β)/(1 − 2β) · ‖c‖⋆_{x_F}; read literally it bounds t₁ above.
The headline uses the lower bound for t₁ that follows from it and that the next line of the
proof uses.

## Downstream consumers

Numerical optimal control and PDE-constrained optimization use the line-search and trust-region
theory of Layers 1–2 and BFGS of Layer 3; imaging, inverse problems and sparse statistical
estimation use the proximal and splitting iterations of Layers 5–7; the complexity theory of
first-order methods uses the lower bounds of Layer 4 to certify optimality of accelerated rates;
linear, quadratic and semidefinite programming solvers use the barrier calculus and the
short-step bound of Layer 8.

## Scope and ownership

The roadmap is complete when Tau Ceti proves all of the following.

1. **Line searches.** Existence of strong Wolfe steps, Zoutendijk's theorem, the angle condition
   and the quasi-Newton angle bound (1.1–1.2).
2. **Trust regions.** Cauchy decrease and the convergence theorems for η = 0 and 0 < η < 1/4
   (2.1–2.2).
3. **Quasi-Newton.** Acceptance of the unit step, positive definiteness along a BFGS run, global
   and superlinear convergence of BFGS (3.1–3.2).
4. **Lower bounds.** The chain quadratic, the span lemma and the two lower bounds (4.1–4.2).
5. **Monotone operators.** Firm nonexpansiveness, Minty's theorem, resolvents, the converse, and
   proximal maps as resolvents (5.1–5.2).
6. **Splitting.** Fejér monotonicity, Krasnosel'skiĭ–Mann, proximal point, forward–backward and
   Douglas–Rachford (6.1–6.2).
7. **PDHG.** The ergodic gap and weak convergence (Layer 7).
8. **Path following.** Barrier examples and calculus, the barrier inequality, minimizers and the
   full Newton step, central points, gaps and the short-step method (8.1–8.7).

Ownership boundaries.
- NewtonAndQuasiNewtonMethods owns the BFGS and DFP updates with hereditary positive
  definiteness (3.1), the Dennis–Moré characterization (4.1) and quadratic termination; it
  excludes line searches, trust regions and global and superlinear BFGS, which this roadmap owns.
- FirstOrderOptimization owns smoothness inequalities, gradient descent rates, projections, the
  proximal map with its existence, firm nonexpansiveness and subdifferential characterization,
  proximal gradient function-value rates, and accelerated methods; it excludes line searches,
  primal–dual methods, splitting other than forward–backward function values, and lower
  complexity bounds, which this roadmap owns.
- ConvexAnalysisAndDuality owns monotone and cyclically monotone sets and the maximal monotonicity
  of subdifferentials (4.4); Minty's theorem, resolvents, the proximal-point algorithm and
  Douglas–Rachford are outside it and are owned here.
- InteriorPointMethods owns self-concordance, its calculus, the local norm, the Newton decrement
  with the suboptimality bound, the damped Newton method with its two phases, and the m/t bound
  for central points of the logarithmic barrier of convex constraints (its 1.2). Barrier
  parameters, the existence of central points, the full Newton step and short-step path
  following are outside it and are owned here; 8.6 is the bound ν/t for a general ν-barrier and
  a linear objective and does not restate its 1.2.
- NonlinearProgrammingOptimality owns the Karush–Kuhn–Tucker theory; nothing of it is consumed.
- The open roadmap ManifoldOptimization (PR #1506), O4.2–O4.5, states Armijo descent, the Cauchy
  point and trust-region complexity on Riemannian manifolds; this roadmap proves the Euclidean
  statements directly and consumes nothing from it.
- The open roadmap VariationalAnalysisAndMetricRegularity (PR #2978), §2.4, owns Moreau envelopes
  and proximal maps under epi-convergence; there is no overlap.

## Exact supplier contracts

### From NewtonAndQuasiNewtonMethods

[NewtonAndQuasiNewtonMethods](../NewtonAndQuasiNewtonMethods/README.md), used with its hypotheses:
- §3.1: the update `bfgsUpdate` (local copy). §3.2: hereditary positive definiteness: for B
  positive definite and sᵀy ≠ 0, the update is positive definite iff sᵀy > 0. Used by 3.2.
- §4.1: the Dennis–Moré characterization on a finite-dimensional space, for f : E → E with
  Gâteaux derivatives on an open convex D ∋ x⋆, f′ continuous at x⋆ with f′(x⋆) invertible, and
  the unit-step iteration x_{k+1} = x_k − B_k⁻¹f(x_k) in D with invertible B_k, x_k → x⋆ and
  x_k ≠ x⋆ eventually. Cited by 3.2 (for f = ∇f along unit steps) and not restated.
- §1.1: the Newton map `newtonMap` (local copy, through InteriorPointMethods 4.1).

### From FirstOrderOptimization

[FirstOrderOptimization](../FirstOrderOptimization/README.md), used with its hypotheses:
- §3.2: `ClosedProperConvex` and `prox` (local copies); for g closed proper convex and η > 0, the
  proximal point exists and is unique and p = prox g η x iff η⁻¹(x − p) is a subgradient of g at p.
  Used by 5.2 and Layer 7.
- §3.1: firm nonexpansiveness of the projection onto a closed convex set. Used in the Checks of
  5.1.
- §§4.2–4.3: the 1/k² rate of the accelerated method and the constant-momentum rate
  (1 − 1/√κ)^k for μ-strongly convex f with K-smooth gradient. Used by the prose optimality
  statement of 4.2.

### From ConvexAnalysisAndDuality

[ConvexAnalysisAndDuality](../ConvexAnalysisAndDuality/README.md), used with its hypotheses:
- §4.4: `IsMonotoneSet` (local copy) and maximal monotonicity of the subdifferential graph of a
  proper closed convex function on a Hilbert space. Used by 5.2 to apply Layer 6 to
  subdifferentials, and by the route of the weak-convergence headline of Layer 7.

### From InteriorPointMethods

[InteriorPointMethods](../InteriorPointMethods/README.md), used with its hypotheses:
- §1.1: `logBarrier` and `strictFeasibleSet` (local copies). §2.1: `SelfConcordantOn` (local
  copy). §§2.2–2.4: self-concordance under affine substitution and of weighted sums and of the
  polyhedral logarithmic barrier, with its blow-up at the frontier. Used by 8.2.
- §§3.2, 3.4: the Hessian comparison and the Dikin ellipsoid. Used by 8.4, 8.6 and 8.7.
- §3.5: `newtonDecrement` (local copy) and f(x) − f(y) ≤ −λ − log(1 − λ) for λ < 1 with positive
  definite Hessian. Used by 8.4.
- §4.1: `newtonMap` (local copy); §4.3: the two phases of the damped Newton method, which supply
  a start x₀ with λ_F(x₀) ≤ β for 8.7.

### From Mathlib

- **Calculus:** `gradient`, `fderiv`, `ContDiff`, `ContDiffOn`, `DifferentiableOn`,
  `LipschitzWith`, `LipschitzOnWith`, `ConvexOn`, `StrongConvexOn`, `StrictConvexOn`.
- **Linear algebra:** `ContinuousLinearMap.inverse`, `ContinuousLinearMap.adjoint`,
  `Matrix.PosDef`, `Matrix.toEuclideanCLM`, `WithLp.toLp`, `Submodule.span`, `innerₗ`.
- **Spaces and order:** `EuclideanSpace`, `lp`, `Metric.thickening`, `Metric.closedBall`,
  `Bornology.IsBounded`, `Maximal`, `List.TFAE`, `IsMinOn`, `Summable`, `WeakSpace`,
  `toWeakSpace`.

### From Tau Ceti

- `subdifferential` (TauCeti/Analysis/Convex/Subdifferential.lean) and `fenchelConjugate`
  (TauCeti/Analysis/Convex/Conjugate.lean), for the inner-product pairing `innerₗ`.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

The following material is recorded only to fix the boundary. Contributors should not attempt it
under this roadmap.

- **Further line-search and trust-region theory**: the Moré–Thuente line search, the dogleg and
  Steihaug–CG steps with their fraction of Cauchy decrease, exact trust-region subproblems
  (Moré–Sorensen), second-order convergence of trust-region methods, and nonmonotone searches.
- **Quasi-Newton beyond BFGS**: global convergence of the Broyden class, limited-memory BFGS, and
  BFGS on nonconvex functions.
- **Further splitting**: strong convergence under uniform monotonicity, linear rates, ADMM,
  Tseng's forward–backward–forward, three-operator splitting, and accelerated and preconditioned
  PDHG (Chambolle–Pock, Algorithms 8–9).
- **Further interior-point theory**: long-step and predictor–corrector methods, finding the
  analytic center from an arbitrary start, universal barriers, self-scaled cones and primal–dual
  methods for semidefinite programming.
- **Lower bounds beyond span methods**: resisting oracles for general deterministic methods,
  nonsmooth lower bounds and lower bounds for stochastic oracles.

## Prior formalization

lean-NASC (https://github.com/bjbraams/lean-NASC) at commit 8efdbf7, module
NASC/Optimization.lean, states analogues of
several targets here with sorry and proves none of them: Wolfe-step summability with a global
Lipschitz gradient (NASC.summable_wolfe_gradient_sq, the counterpart of 1.2), a Dennis–Moré
equivalence for minimization (NASC.tendsto_error_ratio_iff_dennisMore), a first-order lower bound
for span methods (NASC.exists_firstOrder_lowerBound, the counterpart of the first bound of 4.2),
weak convergence of the Krasnosel'skiĭ–Mann iteration (NASC.exists_weakLimit_krasnoselskiiMann),
a self-concordant Newton step (NASC.newton_mem_and_decrement_le_of_selfConcordance, the
counterpart of 8.4) and a PDHG gap bound for finite-valued g and f⋆
(NASC.primalDualHybridGradient_gap_le). The proved gradient-descent rate of that module belongs to
FirstOrderOptimization.

## References

The locators refer to these editions; page numbers are printed page numbers.

- H. H. Bauschke and P. L. Combettes, *Convex Analysis and Monotone Operator Theory in Hilbert
  Spaces*, 2nd ed., CMS Books in Mathematics, Springer, 2017.
- N. Boumal, *An Introduction to Optimization on Smooth Manifolds*, Cambridge University Press,
  2023.
- A. Chambolle and T. Pock, An introduction to continuous optimization for imaging, *Acta
  Numerica* 25 (2016), 161–319.
- Yu. Nesterov, *Lectures on Convex Optimization*, 2nd ed., Springer Optimization and Its
  Applications 137, Springer, 2018.
- J. Nocedal and S. J. Wright, *Numerical Optimization*, 2nd ed., Springer, 2006.

# Roadmap: convergence of first-order optimization methods

**Summary.** Develop the convergence theory of the first-order methods of smooth and convex
optimization on real Hilbert spaces. It starts from the inequalities that make these
methods work: the descent lemma in gradient form, cocoercivity of convex smooth gradients, strong
monotonicity, and the Polyak–Łojasiewicz inequality. It proves the rates of gradient descent in the
nonconvex, convex, strongly convex and Polyak–Łojasiewicz regimes. It develops the theory of the
projection onto a closed convex set, builds the proximal map, and proves the rates of the
subgradient method and of proximal gradient descent. It treats momentum: Polyak's heavy ball on quadratics, and Nesterov
acceleration in its proximal form (FISTA) with the `O(1/k²)` rate and the accelerated linear rate.
In the stochastic setting it proves the Robbins–Siegmund almost-supermartingale theorem and from it
the expected and almost-sure convergence of stochastic gradient descent. It ends with adaptive
methods: preconditioned descent, AdaGrad-Norm, the step bound of Adam, and the counterexample of
Reddi, Kale and Kumar on which Adam does not converge.

## Scope and ownership

This roadmap owns:

- the vocabulary of `K`-smooth functions on real Hilbert spaces, the gradient forms of their
  quadratic bounds, and their convex and strongly convex refinements;
- the Polyak–Łojasiewicz condition;
- gradient descent with a fixed step size, and its rates;
- the theory of the nearest-point map onto a closed convex subset of a real Hilbert space (the
  variational inequality and firm nonexpansiveness; the map itself is owned by
  MathematicalStatisticsNonparametric 6.5), and the proximal map of a closed proper convex
  function with its basic theory;
- the subgradient method and proximal gradient descent (forward–backward splitting), and their
  rates;
- the heavy-ball method on quadratics, FISTA, and FISTA with constant momentum;
- the Robbins–Siegmund theorem;
- stochastic gradient descent driven by an unbiased gradient oracle with bounded conditional
  variance: one-step bounds, expected rates, and almost-sure convergence under Robbins–Monro step
  sizes;
- preconditioned gradient descent, AdaGrad-Norm, the update rules of RMSProp and Adam with their
  step bound, and the Reddi–Kale–Kumar counterexample.

It consumes, and does not re-prove, the items listed under
[Exact supplier contracts](#exact-supplier-contracts).

Out of scope:

- Riemannian optimization on manifolds (retractions, Riemannian gradient descent, Newton and
  trust-region methods); the Euclidean statements here are proved directly;
- steepest descent for non-Euclidean norms, including the spectral norm and Muon, which belongs to
  [SpectralSteepestDescent](../SpectralSteepestDescent/README.md);
- continuous-time gradient flows, which belong to [OptimalTransport](../OptimalTransport/README.md)
  and Tau Ceti's `GradientFlow` library;
- second-order, quasi-Newton and conjugate-gradient methods, line searches, coordinate and block
  methods, variance-reduced stochastic methods, mirror descent, Frank–Wolfe, primal–dual and
  splitting methods other than forward–backward, and lower complexity bounds;
- the Kurdyka–Łojasiewicz theory of nonsmooth nonconvex descent;
- online-learning regret bounds, except the regret computation of 6.4;
- floating-point error and automatic differentiation.

## Conventions

- `E` is a real Hilbert space (`[NormedAddCommGroup E] [InnerProductSpace ℝ E]
  [CompleteSpace E]`); completeness is what Mathlib's `gradient` requires. Finite dimension is
  assumed only where a statement says so.
- `f : E → ℝ`. Its gradient is Mathlib's `gradient f x`, written `∇f x`, so that
  `fderiv ℝ f x h = ⟪∇f x, h⟫` (`toDual_gradient`).
- **Smoothness.** `LipschitzSmoothWith ℝ K f`, with `K : ℝ≥0`, means that `f` is differentiable
  and `‖f y − f x − fderiv ℝ f x (y − x)‖ ≤ K / 2 · dist x y ^ 2` for all `x`, `y`. This is the
  definition of Mathlib PR [#39574](https://github.com/leanprover-community/mathlib4/pull/39574),
  with its name and field names; Layer 1 builds it here and switches to Mathlib's when that PR
  lands. "`f` is `K`-smooth" means `LipschitzSmoothWith ℝ K f`.
- **Convexity** is Mathlib's `ConvexOn ℝ Set.univ f`; **strong convexity** with modulus `μ` is
  `StrongConvexOn Set.univ μ f`, which is Mathlib's normalization
  `f (a x + b y) ≤ a f x + b f y − a b μ / 2 ‖x − y‖²`.
- **Optimal values.** A rate that needs a minimizer takes `x⋆` with `∀ y, f x⋆ ≤ f y`, and writes
  `f⋆ = f x⋆`. A rate that needs only a lower bound takes `m` with `∀ y, m ≤ f y`.
- **Condition number.** With `0 < μ ≤ K`, `κ = K / μ`.
- **Extended-valued functions.** `g : E → EReal` is **closed proper convex**
  (`ClosedProperConvex g`) when its real
  epigraph `{p : E × ℝ | g p.1 ≤ p.2}` is convex, `g` is lower semicontinuous, `g x ≠ ⊥` for all
  `x`, and `g x ≠ ⊤` for some `x`, the convention of Tau Ceti's `FenchelMoreau.lean`. Its
  subdifferential is Tau Ceti's `subdifferential (innerₗ E) g x`. The indicator of `C : Set E`
  is `ι_C x = 0` for `x ∈ C` and `⊤` otherwise. For `F = f + g` the value `(f x : EReal) + g x` is
  used, and rates for `F` are stated as upper bounds `F x ≤ F x⋆ + r`, never with a subtraction in
  `EReal`. Checks: `ι_C` of a nonempty closed convex `C` is closed proper convex; the constant `⊤`
  fails the last condition; `x ↦ −‖x‖²` (with `E` nontrivial) fails the convexity of the
  epigraph.
- **Iterations** are total functions iterated with `Nat.iterate`. A method with memory iterates on
  the tuple of its state, and the iterate `x_k` is a projection of the `k`-th state. Step sizes are
  real numbers; a step-size schedule is `η : ℕ → ℝ`.
- **Stochastic processes.** `(Ω, P)` is a probability space with filtration `ℱ : Filtration ℕ m₀`,
  and conditional expectation is Mathlib's `P[· | ℱ n]`. Iterates are processes `x : ℕ → Ω → E`
  with deterministic start `x 0 = fun _ ↦ x₀`. Almost-sure statements are `∀ᵐ ω ∂P`.
- **Coordinates.** Coordinatewise methods (Layer 6) act on `EuclideanSpace ℝ ι` with `ι` a
  `Fintype`. Squares, square roots and divisions of vectors are coordinatewise.

## Exact supplier contracts

- [MathematicalStatisticsNonparametric](../MathematicalStatisticsNonparametric/README.md) 6.4: the
  soft-threshold map `softThreshold λ y = sign y · (|y| − λ)₊`; and 6.5: the nearest-point map
  `metricProj s x`, a point of `s` at distance `infDist x s` from `x`, and `0` where there is
  none.
- [SpectralSteepestDescent](../SpectralSteepestDescent/README.md) 5.1: the descent lemma
  `le_add_fderiv_add_of_lipschitz` for a real normed space: if `f` is differentiable on the
  segment `[x, x + h]` and `‖fderiv ℝ f y − fderiv ℝ f x‖ ≤ L ‖y − x‖` there, then
  `f (x + h) ≤ f x + fderiv ℝ f x h + L / 2 ‖h‖²`.
- Tau Ceti:
  - `StrongConvexOn.add_add_le_of_hasFDerivWithinAt` (`TauCeti/Analysis/Convex/Strong.lean`):
    `f x + f' (y − x) + μ / 2 ‖y − x‖² ≤ f y`; at `μ = 0`, through Mathlib's
    `strongConvexOn_zero`, it is the first-order inequality `f x + ⟪∇f x, y − x⟫ ≤ f y` of a
    convex differentiable `f`;
  - `exists_affine_le_of_lt` (`TauCeti/Analysis/Convex/FenchelMoreau.lean`): a closed proper
    convex `g : E → EReal` has a continuous affine minorant;
  - `subdifferential` (`TauCeti/Analysis/Convex/Subdifferential.lean`) with the pairing
    `innerₗ E`;
  - `moreauYosidaResolvent` (`TauCeti/Analysis/GradientFlow/MoreauYosida/Basic.lean`).
- Mathlib: `gradient` and `toDual_gradient`; `ConvexOn`, `StrongConvexOn`, `strongConvexOn_zero`
  and `strongConvexOn_iff_convex`;
  `exists_norm_eq_iInf_of_complete_convex` and `norm_eq_iInf_iff_real_inner_le_zero`;
  `LinearMap.IsSymmetric.eigenvectorBasis`; `LinearMap.singularValues`; `condExp`, `Filtration`,
  `Supermartingale`, `Submartingale.ae_tendsto_limitProcess` and
  `Submartingale.exists_ae_tendsto_of_bdd`.

## Coordination

- Mathlib PR [#39574](https://github.com/leanprover-community/mathlib4/pull/39574) defines
  `LipschitzSmoothWith` and `fderiv_descent_le`; PR
  [#43429](https://github.com/leanprover-community/mathlib4/pull/43429) proves the descent lemma
  from a Lipschitz derivative; PR
  [#41501](https://github.com/leanprover-community/mathlib4/pull/41501) proves the Baillon–Haddad
  theorem; PR [#41494](https://github.com/leanprover-community/mathlib4/pull/41494) proves the
  multivariate first-order characterization of convexity; PR
  [#45868](https://github.com/leanprover-community/mathlib4/pull/45868) defines subgradients of
  real-valued functions. Targets here that cover the same ground take those PRs' names and
  statement shapes, and are replaced by Mathlib's declarations when they land.

## How to read the build

Each layer opens with its definitions. Each numbered target ends with a **Checks** list of tests
that a wrong convention or a wrong constant would fail, and a *Needs:* line naming the targets and
suppliers it uses. Every claim carries a source locator in parentheses, or says that it is proved
here. `Suggested.lean` states the headline theorems of each layer against the pinned APIs.

## Layer 1: smoothness and convexity inequalities

### 1.1 Smooth functions

Define `LipschitzSmoothWith ℝ K f` as in [Conventions](#conventions), and prove:

- the gradient forms of the two quadratic bounds: `f y ≤ f x + ⟪∇f x, y − x⟫ + K/2 ‖y − x‖²` and
  `f x + ⟪∇f x, y − x⟫ − K/2 ‖y − x‖² ≤ f y`;
- `LipschitzWith K (gradient f)` and differentiability imply `LipschitzSmoothWith ℝ K f`
  (`LipschitzSmoothWith.of_lipschitzWith_gradient`), from the supplier 5.1 applied to `f` and to
  `−f`;
- monotonicity in `K`; `c + ⟪a, ·⟫` is `0`-smooth; `f₁ + f₂` is `(K₁ + K₂)`-smooth; `c • f` is
  `(‖c‖₊ K)`-smooth; `x ↦ ⟪A x, x⟫ / 2` is `‖A‖₊`-smooth for `A : E →L[ℝ] E` symmetric
  (`IsSymmetric`), with gradient `A x`;
- **sufficient decrease:** for every `η`,
  `f (x − η ∇f x) ≤ f x − η (1 − K η / 2) ‖∇f x‖²`;
- **gradient bound at a lower bound:** if `∀ y, m ≤ f y`, then `‖∇f x‖² ≤ 2 K (f x − m)`
  (`LipschitzSmoothWith.norm_gradient_sq_le`).

(Nesterov 2018, Lemma 1.2.3 and (1.2.19); proved here.)

**Checks.**

- `f x = K/2 ‖x‖²`: both quadratic bounds are equalities, `‖∇f x‖² = 2K (f x − 0)`, and
  sufficient decrease is an equality.
- `f` affine with `K = 0`: every bound is an equality and the gradient bound forces `∇f = 0`
  when `f` is bounded below.
- `sin` on `ℝ` is `1`-smooth and not `0`-smooth: the remainder `sin y − sin x − cos x (y − x)` is
  not identically `0`.

*Needs:* SpectralSteepestDescent 5.1; Mathlib `gradient`, `toDual_gradient`.

### 1.2 Convex smooth functions

Let `f` be convex and `K`-smooth with `K > 0`. Prove, for all `x`, `y`:

- `f x + ⟪∇f x, y − x⟫ + ‖∇f y − ∇f x‖² / (2K) ≤ f y` (`ConvexOn.add_inner_gradient_add_le`);
- **cocoercivity:** `‖∇f x − ∇f y‖² / K ≤ ⟪∇f x − ∇f y, x − y⟫`
  (`ConvexOn.norm_gradient_sub_sq_le_inner`).

Prove also, for every `K : ℝ≥0` and every `K`-smooth `f`, convex or not, that
`LipschitzWith K (gradient f)` (`LipschitzSmoothWith.lipschitzWith_gradient`; for convex `f` this
is the Baillon–Haddad theorem, in finite and infinite dimension), so that with 1.1 a
differentiable `f` is `K`-smooth exactly when its gradient is `K`-Lipschitz. For convex `f` and
`K > 0` it follows from cocoercivity and the Cauchy–Schwarz inequality. In general, for `K > 0`,
the function `h = f + K/2 ‖·‖²` is convex and `2K`-smooth by the two bounds of 1.1, and
cocoercivity of `∇h x = ∇f x + K • x` with constant `2K` gives `‖∇f x − ∇f y‖ ≤ K ‖x − y‖`; for
`K = 0`, `f` is affine.

(Nesterov 2018, Theorem 2.1.5, for convex `f`; the statement without convexity is proved here.)

**Checks.**

- `f x = K/2 ‖x‖²`: cocoercivity is an equality.
- `f = log (1 + exp ·)` on `ℝ` with `K = 1/4`: `f` is convex and `1/4`-smooth, and cocoercivity
  holds with constant `4`.
- `f x = −‖x‖²/2` is `1`-smooth but not convex, and cocoercivity fails at `x ≠ y`, while its
  gradient `−x` is `1`-Lipschitz.

*Needs:* 1.1; Tau Ceti `StrongConvexOn.add_add_le_of_hasFDerivWithinAt`; Mathlib
`strongConvexOn_zero`.

### 1.3 Strongly convex smooth functions

Let `f` be `μ`-strongly convex and differentiable with `μ > 0`. Prove:

- **strong monotonicity:** `μ ‖x − y‖² ≤ ⟪∇f x − ∇f y, x − y⟫`;
- a continuous `μ`-strongly convex `f` with `μ > 0`, differentiable or not, has a unique
  minimizer `x⋆` (`StrongConvexOn.existsUnique_isMinOn`); `f` is bounded below, because it is
  bounded on a ball around `0` and the strong convexity inequality on the segment from `0` to `y`
  gives `f y ≥ c₀ − c₁ ‖y‖ + μ/4 ‖y‖²` for large `‖y‖`;
- `μ/2 ‖x − x⋆‖² ≤ f x − f⋆` (quadratic growth);
- `2μ (f x − f⋆) ≤ ‖∇f x‖²`;
- if moreover `f` is `K`-smooth, then `μ ≤ K` when `E` is nontrivial, and, in every `E`, for all
  `x`, `y`:
  `μK/(μ + K) ‖x − y‖² + 1/(μ + K) ‖∇f x − ∇f y‖² ≤ ⟪∇f x − ∇f y, x − y⟫`
  (`StrongConvexOn.inner_gradient_sub_ge`).

The minimizer is built from a minimizing sequence, which strong convexity makes Cauchy; the
remaining items follow from the supplier inequality. (Nesterov 2018, Theorems 2.1.10 and 2.1.12;
proved here.)

**Checks.**

- `f x = μ/2 ‖x‖²`, `K = μ`: every inequality is an equality, and the last one reads
  `μ/2 ‖x − y‖² + 1/(2μ) μ² ‖x − y‖² = μ ‖x − y‖²`.
- `f x = (x₁² + 4 x₂²)/2` on `ℝ²` with `μ = 1`, `K = 4`: at `x = (1, 0)`, `y = 0` the last
  inequality is `4/5 + 1/5 = 1 ≤ 1`, an equality; at `x = (0, 1)` it is `4/5 + 16/5 = 4 ≤ 4`.
- `μ = 0`: uniqueness of the minimizer fails for `f = 0`, and existence fails for `f = exp` on `ℝ`.
- `f x = |x| + x²/2` on `ℝ` is continuous and `1`-strongly convex, not differentiable at `0`, and
  has the unique minimizer `0`.

*Needs:* 1.1, 1.2; Mathlib `StrongConvexOn`, `strongConvexOn_iff_convex`; Tau Ceti
`StrongConvexOn.add_add_le_of_hasFDerivWithinAt`.

### 1.4 The Polyak–Łojasiewicz condition

Define `PolyakLojasiewicz μ f` as a structure with fields `bddBelow : BddBelow (Set.range f)` and
`le : ∀ x, 2 μ (f x − ⨅ y, f y) ≤ ‖∇f x‖²`. Prove:

- a differentiable `μ`-strongly convex function with `μ > 0` is `PolyakLojasiewicz μ`;
- under `PolyakLojasiewicz μ f` with `μ > 0`, every `x` with `∇f x = 0` is a global minimizer;
- **least squares:** for `A : E →ₗ[ℝ] F` between finite-dimensional real inner product spaces,
  `b : F`, and `σ > 0` at most every nonzero singular value of `A`, the function
  `x ↦ ‖A x − b‖² / 2` is `PolyakLojasiewicz σ²` (`polyakLojasiewicz_leastSquares`), whatever the
  rank of `A`. For `A ≠ 0` the largest such `σ` is the smallest nonzero singular value; for
  `A = 0` the function is constant and every `σ > 0` is allowed.

(Karimi, Nutini and Schmidt 2016, Section 2.3 and Appendix B; proved here.)

**Checks.**

- `f x = x²/2` on `ℝ` is `PolyakLojasiewicz 1`, and not `PolyakLojasiewicz μ` for `μ > 1`.
- `A = [[1, 0], [0, 0]]`, `b = (0, 1)`: `f (x₁, x₂) = (x₁² + 1)/2`, infimum `1/2`, and the
  condition reads `x₁² ≤ x₁²` with `σ = 1`; `f` is not strongly convex.
- `f = exp` on `ℝ` is bounded below with infimum `0` and gradient never `0`, and is not
  `PolyakLojasiewicz μ` for any `μ > 0`: `2μ exp x ≤ exp (2x)` fails as `x → −∞`.

*Needs:* 1.3; Mathlib `LinearMap.singularValues`.

### Examples

`K/2 ‖x‖²`, `(x₁² + 4x₂²)/2`, the logistic loss `log (1 + exp ·)`, and least squares.

### Dependencies

Layer 1 uses SpectralSteepestDescent 5.1, Tau Ceti's
`StrongConvexOn.add_add_le_of_hasFDerivWithinAt`, and Mathlib's gradient, convexity and
singular-value declarations named in the *Needs:* lines.

## Layer 2: gradient descent

Define `gradientStep f η x = x − η • ∇f x` and the iterates
`gradientDescent f η x₀ k = (gradientStep f η)^[k] x₀`, written `x_k`.

### 2.1 Nonconvex smooth functions

Let `f` be `K`-smooth with `∀ y, m ≤ f y`, and `η > 0` with `η K ≤ 1` (that is, `η ≤ 1/K` when
`K > 0`). Prove
`f x_{k+1} ≤ f x_k − η/2 ‖∇f x_k‖²`,
`Σ_{i < k} ‖∇f x_i‖² ≤ 2 (f x₀ − m) / η`, hence
`min_{i < k} ‖∇f x_i‖² ≤ 2 (f x₀ − m) / (η k)` for `k ≥ 1`, and `∇f x_k → 0`
(`gradientDescent_sum_norm_gradient_sq_le`, `tendsto_gradient_gradientDescent`). For
`η > 0` with `η K < 2` prove `Σ_{i < k} ‖∇f x_i‖² ≤ (f x₀ − m) / (η (1 − Kη/2))`.

(Nesterov 2018, (1.2.20)–(1.2.22); proved here.)

**Checks.**

- `f x = x²/2` on `ℝ`, `η = 1`: `x_1 = 0`, and the bound `x₀² ≤ 2 · x₀²/2` is an equality.
- `η = 2/K` on `f x = K/2 x²`: `x_k = (−1)^k x₀`, and `∇f x_k ↛ 0`; this is why `η < 2/K`.
- `f = cos` on `ℝ`, `K = 1`, `m = −1`, `η = 1`: the bound gives
  `Σ sin² x_i ≤ 2 (cos x₀ + 1)`.

*Needs:* 1.1.

### 2.2 Convex smooth functions

Let `f` be convex and `K`-smooth, `x⋆` a minimizer, and `η > 0` with `η K ≤ 1`. Prove:

- `f x_k` is nonincreasing and `‖x_k − x⋆‖` is nonincreasing;
- `f x_k − f⋆ ≤ ‖x₀ − x⋆‖² / (2 η k)` for `k ≥ 1` (`gradientDescent_convex_rate`);
- if `E` is finite-dimensional, `x_k` converges to a minimizer of `f`
  (`tendsto_gradientDescent_of_convex`).

(Nesterov 2018, Theorem 2.1.14; the constant is that of Beck 2017, Theorem 10.21 at `g = 0`;
convergence of the iterates is proved here from Fejér monotonicity.)

**Checks.**

- `f x = x²/2`, `η = 1`, `x⋆ = 0`: `f x_1 = 0 ≤ x₀²/2`.
- `f x = K/2 ‖x‖²` with `η = 1/(2K)`: `x_k = 2^{−k} x₀` and
  `f x_k = K/2 · 4^{−k} ‖x₀‖² ≤ K ‖x₀‖² / k` for `k ≥ 1`.
- `f = 0`: `x_k = x₀` for every `k`, and every point is a minimizer.

*Needs:* 1.1, 1.2, 2.1.

### 2.3 Polyak–Łojasiewicz functions

Let `f` be `K`-smooth with `K > 0` and `PolyakLojasiewicz μ f`, and `f⋆ = ⨅ y, f y`.
For `η = 1/K`, `f x_k − f⋆ ≤ (1 − μ/K)^k (f x₀ − f⋆)` (`gradientDescent_polyakLojasiewicz_rate`).
The bound holds for every real `μ`; it is a linear rate when `μ > 0`.

(Karimi, Nutini and Schmidt 2016, Theorem 1; proved here.)

**Checks.**

- The least-squares function of 1.4 with `A = [[1, 0], [0, 0]]`, `b = (0, 1)`, `K = μ = 1`:
  `x_1 = (0, x₀₂)` reaches the infimum `1/2` in one step, as the factor `0` predicts.
- For `μ > 0`, `μ ≤ K` whenever `f` is not constant, so the factor lies in `[0, 1)`; for
  `μ ≤ 0` the factor is at least `1` and the bound follows from `f x_k ≤ f x₀`.
- `f x = x² + 3 sin² x` on `ℝ` is `8`-smooth, not convex, and `PolyakLojasiewicz (1/32)`
  (Karimi, Nutini and Schmidt 2016, Section 2), so the factor is `1 − 1/256`.

*Needs:* 1.1, 1.4.

### 2.4 Strongly convex smooth functions

Let `f` be `μ`-strongly convex and `K`-smooth with `0 < μ`, and `x⋆` its minimizer. Prove:

- for `0 < η ≤ 2/(μ + K)`:
  `‖x_k − x⋆‖² ≤ (1 − 2ημK/(μ + K))^k ‖x₀ − x⋆‖²` (`gradientDescent_strongConvex_rate`);
- for `η = 2/(μ + K)`: `‖x_k − x⋆‖ ≤ ((κ − 1)/(κ + 1))^k ‖x₀ − x⋆‖`;
- for `η = 1/K`: `f x_k − f⋆ ≤ (1 − 1/κ)^k (f x₀ − f⋆)`.

(Nesterov 2018, Theorem 2.1.15; the last item is 2.3 with 1.4; proved here.)

**Checks.**

- `f x = μ/2 ‖x‖²`, `K = μ`, `η = 1/μ`: `x_1 = x⋆ = 0`, and every rate factor is `0`.
- `f x = (x₁² + 4x₂²)/2`, `η = 2/5`: the iteration multiplies coordinates by `3/5` and `−3/5`, and
  `(κ − 1)/(κ + 1) = 3/5` is attained.
- `η = 1/K` on the same function: the iteration multiplies coordinates by `3/4` and `0`.

*Needs:* 1.3, 1.4, 2.3.

### Examples

Gradient descent on the quadratic `(x₁² + 4x₂²)/2` with the step sizes `1/4`, `2/5` and `1/2`, and
on the least-squares problem of 1.4.

### Dependencies

Layer 2 uses Layer 1.

## Layer 3: projections, proximal maps and nonsmooth methods

### 3.1 Projection onto a closed convex set

Let `C : Set E` be nonempty, closed and convex. The nearest-point map onto `C` is `metricProj C`
of MathematicalStatisticsNonparametric 6.5. `convexProjection C x` is the nearest point of `C` to
`x` when exactly one exists, and `x` otherwise; for nonempty closed convex `C` it equals
`metricProj C x`, since the nearest point exists by `exists_norm_eq_iInf_of_complete_convex` and
is unique. Prove:

- the variational inequality: `p = convexProjection C x ↔ p ∈ C ∧ ∀ z ∈ C, ⟪x − p, z − p⟫ ≤ 0`;
- **firm nonexpansiveness:**
  `‖P x − P y‖² ≤ ⟪P x − P y, x − y⟫` for `P = convexProjection C`, hence `LipschitzWith 1 P`
  (`convexProjection_firmlyNonexpansive`);
- `P x = x ↔ x ∈ C`, and `P ∘ P = P`;
- for a closed subspace, `convexProjection` agrees with Mathlib's orthogonal projection.

(Bauschke and Combettes 2017, Theorem 3.16 and Proposition 4.16; proved here.)

**Checks.**

- `C = closedBall 0 1`: `P x = x / max 1 ‖x‖`.
- `C = {x | 0 ≤ x}` in `EuclideanSpace ℝ ι`: `P x = max x 0` coordinatewise.
- `C = Set.Icc (−1) 1` in `ℝ`: `P x = max (−1) (min 1 x)`.
- `C = ∅`: `convexProjection ∅ x = x` and `metricProj ∅ x = 0`; the two maps can differ only outside
  the hypothesis that `C` is nonempty, closed and convex.

*Needs:* MathematicalStatisticsNonparametric 6.5; Mathlib `exists_norm_eq_iInf_of_complete_convex`,
`norm_eq_iInf_iff_real_inner_le_zero`.

### 3.2 The proximal map

Let `g : E → EReal` closed proper convex and `η > 0`. Define
`prox g η x` as the unique minimizer of `u ↦ g u + ‖u − x‖² / (2η)` (and `x` when no unique
minimizer exists). Prove:

- existence and uniqueness of the minimizer (`existsUnique_prox`);
- `moreauYosidaResolvent g η.toNNReal x = {prox g η x}`, identifying `prox` with Tau Ceti's metric
  resolvent (`moreauYosidaResolvent_eq_prox`);
- the subdifferential characterization:
  `p = prox g η x ↔ η⁻¹ • (x − p) ∈ subdifferential (innerₗ E) g p` (`eq_prox_iff`);
- firm nonexpansiveness in the sense of 3.1, hence `LipschitzWith 1 (prox g η)`;
- `prox ι_C η = convexProjection C`;
- on `EuclideanSpace ℝ ι`, with `g x = λ Σᵢ |xᵢ|` and `λ ≥ 0`:
  `(prox g η x)ᵢ = softThreshold (η λ) (x i)`, the soft-threshold map of
  MathematicalStatisticsNonparametric 6.4.

Existence: the infimum of the penalized function is finite because `g` has a continuous affine
minorant (`exists_affine_le_of_lt`); a minimizing sequence is Cauchy by the parallelogram law and
the convexity of the real epigraph of `g`, and its limit is a minimizer by lower semicontinuity.
Uniqueness follows from the same parallelogram estimate. (Bauschke and Combettes 2017,
Definition 12.23 and Propositions 12.28 and 16.44; proved here.)

**Checks.**

- `g = 0`: `prox g η x = x`.
- `g x = ‖x‖²/2`: `prox g η x = x / (1 + η)`.
- `g = |·|` on `ℝ`, `η = 1`: `prox g 1 3 = 2`, `prox g 1 (1/2) = 0`, `prox g 1 (−3) = −2`.

*Needs:* 3.1; Tau Ceti `subdifferential`, `moreauYosidaResolvent`, `exists_affine_le_of_lt`;
MathematicalStatisticsNonparametric 6.4.

### 3.3 The subgradient method

Let `f : E → ℝ` have a minimizer `x⋆`, and `s : E → E` with
`s x ∈ subdifferential (innerₗ E) (fun z ↦ (f z : EReal)) x` and `‖s x‖ ≤ G` for all `x`; such an
`f` is convex, being the supremum of the affine functions `f x + ⟪s x, · − x⟫`. For a
schedule `η` with `η i > 0`, let `x_{i+1} = x_i − η i • s x_i`. Prove

`min_{i ≤ k} f x_i − f⋆ ≤ (‖x₀ − x⋆‖² + G² Σ_{i ≤ k} (η i)²) / (2 Σ_{i ≤ k} η i)`

(`subgradientMethod_rate`), and, for the constant schedule `η i = R / (G √(k + 1))` with
`R ≥ ‖x₀ − x⋆‖` and `G > 0`, `min_{i ≤ k} f x_i − f⋆ ≤ R G / √(k + 1)`.

(Nesterov 2018, Section 3.2.3; proved here.)

**Checks.**

- `f = |·|` on `ℝ`, `s = sign` with `sign 0 = 0`, `G = 1`, `x₀ = 1`, `η i = 1`: `x₁ = 0`, and the
  bound for `k = 0` reads `1 ≤ (1 + 1)/2`.
- The bound does not require `f x_i` to decrease, and on `|·|` with `η i = 2` and `x₀ = 1/2` it
  does not: `x₁ = −3/2` and `f x₁ = 3/2 > f x₀`.
- With `Σ η i = ∞` and `Σ (η i)² < ∞` the right side tends to `0`.

*Needs:* Tau Ceti `subdifferential`.

### 3.4 Proximal gradient descent

Let `f` be convex and `K`-smooth, `g : E → EReal` closed proper convex, and
`F x = (f x : EReal) + g x` with a minimizer `x⋆`. Define
`proxGradientStep f g η x = prox g η (x − η • ∇f x)` and its iterates `x_k`. For
`η > 0` with `η K ≤ 1`, prove:

- `F x_{k+1} ≤ F x_k` for all `k`, and `F x_k ≠ ⊤` for `k ≥ 1`;
- `F x_k ≤ F x⋆ + ‖x₀ − x⋆‖² / (2ηk)` for `k ≥ 1` (`proxGradient_rate`);
- if `f` is `μ`-strongly convex with `μ > 0`, then for every `0 < η ≤ 2/(μ + K)` (not only
  `η K ≤ 1`): `‖x_k − x⋆‖² ≤ (1 − 2ημK/(μ + K))^k ‖x₀ − x⋆‖²`, since the gradient step contracts
  by 1.3 and `prox g η` is nonexpansive with fixed point `x⋆ − η ∇f x⋆ ↦ x⋆`.

With `g = ι_C` the iteration is projected gradient descent, and with `g = 0` it is
gradient descent, so 2.2 and the first item of 2.4 are the cases `g = 0`.

(Beck and Teboulle 2009, Theorem 3.1; Beck 2017, Theorems 10.21 and 10.29; proved here.)

**Checks.**

- `g = 0`: `proxGradientStep f 0 η = gradientStep f η`.
- The lasso `f x = ‖A x − b‖²/2`, `g = λ‖·‖₁` on `EuclideanSpace ℝ ι`: the step is soft
  thresholding of a gradient step (ISTA).
- `C = closedBall 0 1`, `f x = ‖x − c‖²/2` with `‖c‖ = 2`, `η = 1`: `x_1 = c / 2`, the minimizer.

*Needs:* 1.1–1.3, 3.1, 3.2.

### Examples

Projection onto a ball, the nonnegative orthant and an interval; soft thresholding; ISTA for the
lasso.

### Dependencies

Layer 3 uses 1.1–1.3, the Tau Ceti subdifferential, Moreau–Yosida and Fenchel–Moreau suppliers,
Mathlib's two nearest-point lemmas, and MathematicalStatisticsNonparametric 6.4 and 6.5.

## Layer 4: momentum and acceleration

### 4.1 The heavy-ball method on quadratics

Let `E` be finite-dimensional, `A : E →L[ℝ] E` symmetric with
`μ ‖v‖² ≤ ⟪A v, v⟫ ≤ K ‖v‖²` for all `v` and `0 < μ ≤ K`, `b : E`, and
`f x = ⟪A x, x⟫/2 − ⟪b, x⟫`, with minimizer `x⋆ = A⁻¹ b`. Define
`heavyBallStep f α β (x, x') = (x − α ∇f x + β (x − x'), x)` with start `(x₀, x₀)`, and let
`x_k` be the first component of the `k`-th state. With
`α = 4 / (√K + √μ)²` and `β = ((√κ − 1)/(√κ + 1))²`, prove
`∃ c, ∀ k, ‖x_k − x⋆‖ ≤ c (k + 1) ((√κ − 1)/(√κ + 1))^k` (`heavyBall_quadratic_rate`).

In each eigendirection of `A` (`LinearMap.IsSymmetric.eigenvectorBasis`) the error satisfies a
second-order linear recurrence whose characteristic roots have modulus `√β` for every eigenvalue
in `[μ, K]`; the factor `k + 1` covers a repeated root. (Polyak 1964; Polyak 1987, Section 3.2.1,
Theorem 1; proved here.)

**Checks.**

- `κ = 1`: `β = 0`, `α = 1/μ`, and `x_1 = x⋆`.
- `A = diag(1, 100)`: the rate `9/11` beats gradient descent's `99/101` from 2.4.
- On `A = diag(1, 4)` the eigenvalues `1` and `4` give the double roots `1/3` and `−1/3`, and
  `|e_k| ≤ c (k + 1) 3^{−k}` is attained up to the constant.

*Needs:* 1.1; Mathlib `LinearMap.IsSymmetric.eigenvectorBasis`.

### 4.2 FISTA

Let `f`, `g`, `F`, `x⋆` be as in 3.4 and `η > 0` with `η K ≤ 1`. Define FISTA with the state
`(x_k, x_{k−1}, t_k)` (one step is `fistaStep`): `y₁ = x₀`, `t₁ = 1`, and for `k ≥ 1`
`x_k = prox g η (y_k − η ∇f y_k)`, `t_{k+1} = (1 + √(1 + 4 t_k²))/2`,
`y_{k+1} = x_k + ((t_k − 1)/t_{k+1}) (x_k − x_{k−1})`. Prove `t_k ≥ (k + 1)/2` and
`F x_k ≤ F x⋆ + 2 ‖x₀ − x⋆‖² / (η (k + 1)²)` for `k ≥ 1` (`fista_rate`). With `g = 0` this is
Nesterov's accelerated gradient method.

(Beck and Teboulle 2009, Lemma 4.3 and Theorem 4.4; Beck 2017, Theorem 10.34; proved here.)

**Checks.**

- `t₂ = (1 + √5)/2`, `t₃ = (1 + √(7 + 2√5))/2`, and `t_k ≥ (k + 1)/2` with equality at `k = 1`.
- `f x = x²/2`, `g = 0`, `η = 1`: `x₁ = 0 = x⋆`, and every later iterate is `0`.
- The rate is `O(1/k²)` against `O(1/k)` in 3.4: at `k = 99` the bounds are
  `2R²/(100² η)` and `R²/(198 η)`.

*Needs:* 1.1, 1.2, 3.2, 3.4.

### 4.3 FISTA with constant momentum

Let moreover `f` be `μ`-strongly convex with `0 < μ ≤ K`, `η = 1/K`, and
`q = (√κ − 1)/(√κ + 1)`. Define `x_{−1} = x₀`, `y_k = x_k + q (x_k − x_{k−1})`,
`x_{k+1} = prox g η (y_k − η ∇f y_k)` (one step is `fistaConstantMomentumStep`). Prove
`F x_k ≤ F x⋆ + (1 − 1/√κ)^k ((F x₀).toReal − (F x⋆).toReal + μ/2 ‖x₀ − x⋆‖²)` for `x₀` with
`F x₀ ≠ ⊤`, the last term a real number cast to `EReal` (`fistaConstantMomentum_rate`). With `g = 0` this is Nesterov's constant-momentum scheme.

(Beck 2017, Theorem 10.42; Nesterov 2018, Theorem 2.2.3 with scheme (2.2.22); proved here.)

**Checks.**

- `κ = 1`: `q = 0`, the factor is `0`, and the scheme is 3.4 with `η = 1/μ`.
- `f x = (x₁² + 100 x₂²)/2`, `g = 0`: the factor is `9/10` against `99/100` for 2.4.
- The rate needs `F x₀ ≠ ⊤`; at `k = 0` it reads `F x₀ ≤ F x₀ + μ/2 ‖x₀ − x⋆‖²`, with
  `(F x⋆).toReal` finite because `F x⋆ ≤ F x₀ < ⊤` and `F x⋆ ≠ ⊥`.

*Needs:* 1.3, 3.2, 3.4, 4.2.

### Examples

The heavy-ball and accelerated rates on `diag(1, 100)`, and FISTA on the lasso.

### Dependencies

Layer 4 uses Layers 1 and 3 and Mathlib's `LinearMap.IsSymmetric.eigenvectorBasis`.

## Layer 5: stochastic approximation

Conventions of this layer: `(Ω, P)` a probability space and `ℱ : Filtration ℕ m₀`.
Measurability of `E`-valued processes is strong measurability, so no σ-algebra on `E` is used.

### 5.1 The Robbins–Siegmund theorem

Let `V`, `a`, `β`, `ζ : ℕ → Ω → ℝ` be nonnegative and adapted to `ℱ`, with `V n` integrable, and
suppose `P[V (n+1) | ℱ n] ≤ᵐ (1 + a n) V n + β n − ζ n` for all `n`. Prove:

- **the theorem:** for almost every `ω` with `Σ_n a n ω < ∞` and `Σ_n β n ω < ∞`, `V n ω`
  converges to a real limit and `Σ_n ζ n ω < ∞` (`ae_tendsto_of_robbinsSiegmund`,
  `ae_summable_of_robbinsSiegmund`);
- **the integrable form:** if moreover `a` is deterministic with `Σ a n < ∞`, `β n` is
  integrable and `Σ_n ∫ β n ∂P < ∞`, then the hypotheses of the theorem hold almost surely, and
  `sup_n ∫ V n ∂P < ∞` and `Σ_n ∫ ζ n ∂P < ∞` (`robbinsSiegmund_integrable`). Each `ζ n` is then
  integrable, since `0 ≤ ζ n ≤ (1 + a n) V n + β n` almost surely.

In the integrable form, `V n / Π_{i<n} (1 + a i) − Σ_{i<n} (β i − ζ i)/Π_{j≤i} (1 + a j)` is a
supermartingale bounded in `L¹`, and the supplier convergence theorem applies to its negative. The
theorem reduces to it: dividing by the `ℱ n`-measurable product `Π_{i≤n} (1 + a i) ≥ 1` gives the
recursion with `a = 0` for `V n / Π_{i<n} (1 + a i)`; then stop at the first `n` with
`Σ_{k≤n} β k > K`, for each `K : ℕ`. The stopped `β` is bounded by `K` and the stopped `ζ` by
`V n + β n`, so both are integrable; on `{Σ a < ∞}` the product converges, and the conclusions
transfer. (Robbins and Siegmund 1971, Theorem 1; Combettes and Pesquet 2015, Lemma 2.2; proved
here.)

**Checks.**

- `a = β = ζ = 0`: `V` is a nonnegative supermartingale and converges almost surely.
- Deterministic `V n = Π_{i<n} (1 + a i)` with `β = ζ = 0`: the recursion holds with equality and
  `V` converges to `Π (1 + a i) < ∞`.
- `Σ a n = ∞` fails: `V n = 2^n` satisfies the recursion with `a n = 1` and diverges.
- Random `a n = ξ/(n + 1)²` with `ξ ≥ 0` `ℱ 0`-measurable and unbounded is covered by the theorem
  and not by the integrable form.

*Needs:* Mathlib `condExp`, `Supermartingale`, `Submartingale.ae_tendsto_limitProcess`,
`Submartingale.exists_ae_tendsto_of_bdd`.

### 5.2 Stochastic gradient descent

Define `IsSGD ℱ P f η σ x g` as a structure: `x (n+1) = x n − η n • g n`; `x n` is
`ℱ n`-strongly measurable and `g n` is `ℱ (n+1)`-strongly measurable; `‖g n‖²` and
`‖g n − ∇f ∘ x n‖²` are integrable; `P[g n | ℱ n] =ᵐ fun ω ↦ ∇f (x n ω)` (unbiasedness); and
`P[fun ω ↦ ‖g n ω − ∇f (x n ω)‖² | ℱ n] ≤ᵐ fun _ ↦ σ²` (bounded conditional variance). The
integrability fields make the conditional expectations meaningful: Mathlib's `condExp` is `0` on
non-integrable functions. Prove, for `K`-smooth `f`, deterministic `x 0` and `0 ≤ η n`, that
`f ∘ x n` and `‖x n‖²` are integrable and the one-step bounds:

- `P[f ∘ x (n+1) | ℱ n] ≤ᵐ f ∘ x n − η n (1 − K η n / 2) ‖∇f ∘ x n‖² + K (η n)² σ² / 2`;
- for convex `f` with minimizer `x⋆`:
  `P[‖x (n+1) − x⋆‖² | ℱ n] ≤ᵐ ‖x n − x⋆‖² − 2 η n (f ∘ x n − f⋆) + (η n)² (‖∇f ∘ x n‖² + σ²)`.

(Bottou, Curtis and Nocedal 2018, Lemmas 4.2 and 4.4; proved here.)

**Checks.**

- `σ = 0`: `g n = ∇f ∘ x n` almost surely, and the first bound is 1.1's sufficient decrease.
- `f x = x²/2` on `ℝ`, `g n = x n + ξ n` with `ξ n` independent of `ℱ n`, uniform on `{−1, 1}`:
  `σ = 1`, and `E[x (n+1)² | ℱ n] = (1 − η)² x n² + η²`.
- Unbiasedness alone is not enough: with `ξ n = ±M` the variance term grows like `M²`.

*Needs:* 1.1, 1.2.

### 5.3 Expected rates

Let `IsSGD ℱ P f η σ x g` with `x 0 = fun _ ↦ x₀`. Prove:

- **nonconvex:** for `f` `K`-smooth with `∀ y, m ≤ f y`, constant `η n = η > 0` with `η K ≤ 1`,
  and `N ≥ 1`,
  `(1/N) Σ_{n<N} ∫ ‖∇f (x n)‖² ∂P ≤ 2 (f x₀ − m)/(η N) + K η σ²` (`sgd_nonconvex_rate`);
- **strongly convex, constant step:** for `f` `μ`-strongly convex with `μ > 0` and `K`-smooth,
  with minimizer `x⋆`, and `η n = η > 0` with `η K ≤ 1`,
  `∫ ‖x n − x⋆‖² ∂P ≤ (1 − ημ)^n ‖x₀ − x⋆‖² + η σ²/μ` (`sgd_strongConvex_constant_rate`);
- **strongly convex, decreasing step:** for the same `f` and `η n = 2/(μ (n + n₀))` with
  `n₀ : ℕ`, `n₀ ≥ 2K/μ`,
  `∫ ‖x n − x⋆‖² ∂P ≤ max (n₀ ‖x₀ − x⋆‖²) (4σ²/μ²) / (n + n₀)` (`sgd_strongConvex_rate`).

The strongly convex recursions use `⟪∇f x, x − x⋆⟫ ≥ μ/2 ‖x − x⋆‖² + 1/(2K) ‖∇f x‖²`, the average
of strong monotonicity (1.3) and cocoercivity (1.2). (Ghadimi and Lan 2013, Theorem 2.1; Bottou,
Curtis and Nocedal 2018, Theorems 4.6 and 4.7; the constants here are proved here.)

**Checks.**

- `σ = 0`: the constant-step bounds become the deterministic rates of 2.1 and 2.4 with the
  weaker factor `1 − ημ`.
- `n = 0` in the decreasing-step bound: `‖x₀ − x⋆‖² ≤ n₀ ‖x₀ − x⋆‖² / n₀`.
- The noise floor `ησ²/μ` is attained for `f x = μ x²/2` with additive noise of variance `σ²` and
  `η = 1/K = 1/μ`: `x n = −ξ (n−1)/μ`, so `E x n² = σ²/μ² = η σ²/μ` for `n ≥ 1`.

*Needs:* 1.1–1.3, 5.2.

### 5.4 Almost-sure convergence

Let `IsSGD ℱ P f η σ x g` with deterministic `x 0`, `η n > 0`, `Σ η n = ∞` and
`Σ (η n)² < ∞`. Prove:

- **nonconvex:** for `K`-smooth `f` bounded below, `Σ η n ‖∇f (x n ω)‖² < ∞` and
  `liminf ‖∇f (x n ω)‖ = 0` for almost every `ω`;
- **convex:** for convex `K`-smooth `f` with a minimizer, `Σ η n (f (x n ω) − f⋆) < ∞` for almost
  every `ω`, and, when `E` is finite-dimensional, `x n ω` converges to a minimizer of `f` for
  almost every `ω` (`sgd_convex_ae_tendsto`);
- **strongly convex:** for `μ`-strongly convex `K`-smooth `f` with `μ > 0`, `x n → x⋆` almost
  surely.

Each follows from 5.1. In the nonconvex case take `V n = f (x n) − m`, `ζ n = η n ‖∇f (x n)‖²`,
`β n = K (η n)² σ²/2` and `a n = K² (η n)²`, using 1.1's `‖∇f x‖² ≤ 2K (f x − m)` to absorb the
steps with `K η n > 1`. In the convex cases take `V n = ‖x n − x⋆‖²` and `a n = K² (η n)²`, using
`‖∇f x‖² ≤ K² ‖x − x⋆‖²`. Convergence of the
whole sequence in the convex case uses a countable dense subset of the minimizers and the
continuity of `f`. (Robbins and Monro 1951; Robbins and Siegmund 1971, Section 3; Combettes and
Pesquet 2015, Proposition 2.3; proved here.)

**Checks.**

- `η n = 1/(n + 1)`: `Σ η n = ∞` and `Σ (η n)² = π²/6`.
- A constant schedule `η n = η` violates `Σ (η n)² < ∞`, and the floor of 5.3, attained for
  `μ x²/2` with additive noise, shows that `x n` does not converge.
- `σ = 0`: the statements are deterministic, about gradient descent with the schedule `η`.

*Needs:* 1.1–1.3, 5.1, 5.2.

### Examples

SGD on `x²/2` with Rademacher noise, and on least squares with sampled rows.

### Dependencies

Layer 5 uses Layer 1 and Mathlib's martingale theory.

## Layer 6: adaptive methods

### 6.1 Preconditioned gradient descent

Let `f` be `K`-smooth and `P : E ≃L[ℝ] E` with `⟪P v, v⟫ ≥ p ‖v‖²` for all `v`, with `p > 0`. Write `d x = P.symm (∇f x)`. Prove
`f (x − η d x) ≤ f x − η ⟪∇f x, d x⟫ + K η²/2 ‖d x‖²` and `‖d x‖² ≤ ⟪∇f x, d x⟫ / p`, so for
`η > 0` with `η K ≤ p`: `f (x − η d x) ≤ f x − η/2 ⟪∇f x, d x⟫`. For the iterates
`x_{i+1} = x_i − η d x_i` and `∀ y, m ≤ f y`, prove
`Σ_{i < k} ⟪∇f x_i, d x_i⟫ ≤ 2 (f x₀ − m)/η` (`preconditioned_sum_le`).

(Bertsekas 1999, Section 1.2, scaled gradient methods; the bounds stated here are proved here.)

**Checks.**

- `P = 1`, `p = 1`: this is 1.1's sufficient decrease at `η ≤ 1/K`.
- `f x = (x₁² + 100 x₂²)/2`, `P = diag(1, 100)`: `P⁻¹ ∇f x = x`, so `η = 1` reaches the minimizer
  in one step, while `p = 1` and `K = 100` only allow `η ≤ 1/100`; the threshold `p/K` is not sharp
  for a well-chosen preconditioner.
- `P = 1`: `d x = ∇f x` and the sum bound is 2.1's.

*Needs:* 1.1.

### 6.2 AdaGrad-Norm

Let `f` be `K`-smooth with `∀ y, m ≤ f y`, `η > 0`, `b₀ > 0`, and define
`b_{k+1}² = b_k² + ‖∇f x_k‖²`, `x_{k+1} = x_k − (η / b_{k+1}) ∇f x_k`. Prove that
`b_k` converges, so `Σ_k ‖∇f x_k‖² < ∞` and `∇f x_k → 0`, for every `η` and `b₀`
(`adaGradNorm_summable`). Explicitly: if `b_k < ηK` for all `k`, then `b_k ≤ ηK`; otherwise, with
`k₀` the first index with `b_{k₀} ≥ ηK`, `b_k ≤ max (ηK) (b_{k₀} + 2 (f x_{k₀} − m)/η)` for all `k`.

After `k₀` the step is at most `1/K`, sufficient decrease gives
`Σ_{k ≥ k₀} ‖∇f x_k‖²/b_{k+1} ≤ 2 (f x_{k₀} − m)/η`, and
`‖∇f x_k‖²/b_{k+1} = (b_{k+1}² − b_k²)/b_{k+1} ≥ b_{k+1} − b_k`. (Ward, Wu and Bottou 2019,
Theorem 2.2; the bound stated here is proved here.)

**Checks.**

- `f x = K/2 x²` with `b₀ ≥ ηK`: `k₀ = 0` and the iteration is gradient descent with steps at
  most `1/K`.
- `b₀` tiny: the first step `η/b₁ = η/√(b₀² + ‖∇f x₀‖²)` is still at most `η/‖∇f x₀‖`.
- `f = 0`: `b_k = b₀` and `x_k = x₀`.

*Needs:* 1.1.

### 6.3 RMSProp and Adam

On `EuclideanSpace ℝ ι`, define, with `β₁, β₂ ∈ [0, 1)`, `ε > 0`, `m₀ = v₀ = 0` and gradients
`g_t` for `t ≥ 1`:

- `m_t = β₁ m_{t−1} + (1 − β₁) g_t`, `v_t = β₂ v_{t−1} + (1 − β₂) g_t²` (`adamFirstMoment`,
  `adamSecondMoment`);
- the bias corrections `m̂_t = m_t/(1 − β₁^t)` and `v̂_t = v_t/(1 − β₂^t)`;
- the Adam step `x_t = x_{t−1} − α m̂_t / (√v̂_t + ε)`, and the RMSProp step
  `x_t = x_{t−1} − α g_t / (√v_t + ε)`.

Prove that `m̂_t` and `v̂_t` are convex combinations of `g_1, …, g_t` and of `g_1², …, g_t²`, and
the **step bound**: if `β₁² < β₂` then, coordinatewise,
`|m̂_t| ≤ (1 − β₁)/(1 − β₁^t) · √((1 − β₂^t)/(1 − β₂)) · √((1 − r^t)/(1 − r)) · √v̂_t` with
`r = β₁²/β₂`, so that each coordinate of the Adam step is at most `α` times that constant
(`adam_step_le`). The proof is the Cauchy–Schwarz inequality for the two weight sequences, with the
finite geometric sum `Σ_{j<t} r^j`.

(Kingma and Ba 2015, Algorithm 1 and Section 2.1; the bound is proved here.)

**Checks.**

- `t = 1`: `m̂₁ = g₁`, `v̂₁ = g₁²`, the constant is `1`, and the step is
  `α g₁/(|g₁| + ε)`.
- `β₁ = 0`: `r = 0`, the constant at `t` is `√((1 − β₂^t)/(1 − β₂))`, and the bound is
  `|g_t| ≤ √(v_t/(1 − β₂))`, which follows from `v_t ≥ (1 − β₂) g_t²`.
- Constant gradients `g_t = c`: `m̂_t = c`, `v̂_t = c²`, and the bound holds since the constant
  is at least `1`.

*Needs:* none beyond Mathlib's `EuclideanSpace`.

### 6.4 The Reddi–Kale–Kumar counterexample

On `ℝ` with feasible set `[−1, 1]`, let `C > 2` and `f_t x = C x` if `t % 3 = 1` and `f_t x = −x`
otherwise (`reddiLoss C t x`, with derivative `reddiGrad C t`). Let `β₂ = 1/(1 + C²)`, `0 < α < √(1 − β₂)`, `x₁ = 1`, `v₀ = 0`, `g_t = f_t'`,
`v_t = β₂ v_{t−1} + (1 − β₂) g_t²`, and
`x_{t+1} = max (−1) (min 1 (x_t − (α/√t) g_t/√v_t))`: Adam with `β₁ = 0`, without bias
correction and `ε`, projected onto `[−1, 1]`. Prove:

- `x_t ∈ (0, 1]` for all `t ≥ 1`, and `x_{3s+1} = 1` for all `s` (`reddi_iterate`);
- the regret satisfies `Σ_{t ≤ 3n} f_t x_t − min_{x ∈ [−1, 1]} Σ_{t ≤ 3n} f_t x ≥ (2C − 4) n`, so
  the average regret does not tend to `0`, while the minimizer of `Σ_t f_t` on `[−1, 1]` is
  `−1` (`reddi_regret`).

For `s ≥ 1` the step `x_{3s+4} = 1` follows as in Reddi, Kale and Kumar 2018, Appendix A. Their
estimate fails for the first block, which is handled exactly: `v₁ = (1 − β₂) C²`,
`v₂ = (1 − β₂)(2 − β₂)` and `v₃ = (1 − β₂)(1 + 2β₂ − β₂²)`, and
`1/√(2(2 − β₂)) + 1/√(3(1 + 2β₂ − β₂²)) ≥ 1` on `0 < β₂ < 1/5` (its minimum there is about
`1.022`, at `β₂ = 1/5`), which is what `x₄ = 1` requires. (Reddi, Kale and Kumar 2018, Theorem 1
and Appendix A; proved here.)

**Checks.**

- `C = 3`, `β₂ = 1/10`: `v₁ = 81/10` and `x₂ = 1 − α/√(9/10) ∈ (0, 1)` for `0 < α < √(9/10)`.
- Each block `t = 3s + 1, 3s + 2, 3s + 3` contributes `C − x_{3s+2} − x_{3s+3} ≥ C − 2` to
  `Σ f_t x_t` and `−C + 2` to `Σ f_t (−1)`.
- `C = 2`: the regret bound is `0`, and the construction says nothing.

*Needs:* none beyond Mathlib.

### Examples

Adam and RMSProp on constant gradients, and the Reddi–Kale–Kumar sequence for `C = 3`.

### Dependencies

Layer 6 uses 1.1 and Mathlib's `EuclideanSpace`.

## Downstream consumers

Riemannian fixed-step and geodesically strongly convex rates specialize, on a Hilbert space with
retraction `x + v`, to 2.1 and 2.4. The proximal map and ISTA of 3.2 and 3.4 compute the
lasso estimators of [MathematicalStatisticsHighDimensional](../MathematicalStatisticsHighDimensional/README.md).

## Provenance

[lean4-mlir](https://github.com/brettkoonce/lean4-mlir) proves a coordinatewise inexact-gradient
descent lemma (`LeanMlir/Proofs/Training/SgdDescent/Basic.lean`, the `ℓ¹`/`ℓ∞` form of 1.1's
sufficient decrease with a gradient error term) and defines the update rules of momentum SGD,
RMSProp, Adam and LAMB (`LeanMlir/Proofs/Training/Optim/`). It is BSD-3 licensed, and its author
contributed this roadmap. [Optlib](https://github.com/optsuite/optlib) (Apache-2.0) formalizes
the convex and strongly convex gradient descent rates, the subgradient and proximal gradient
methods, and Nesterov's method in an earlier Lean and Mathlib; `nesterov-lean`
(<https://github.com/velvetmonkey/nesterov-lean>, MIT) proves the `O(1/k²)` rate. These are
reference material, not the specification.

## References

- D. P. Bertsekas, *Nonlinear programming*, 2nd ed., Athena Scientific, 1999.
- H. H. Bauschke and P. L. Combettes, *Convex analysis and monotone operator theory in Hilbert
  spaces*, 2nd ed., Springer, 2017.
- A. Beck, *First-order methods in optimization*, SIAM, 2017.
- A. Beck and M. Teboulle, *A fast iterative shrinkage-thresholding algorithm for linear inverse
  problems*, SIAM J. Imaging Sci. **2** (2009), 183–202.
- L. Bottou, F. E. Curtis and J. Nocedal, *Optimization methods for large-scale machine learning*,
  SIAM Rev. **60** (2018), 223–311.
- P. L. Combettes and J.-C. Pesquet, *Stochastic quasi-Fejér block-coordinate fixed point
  iterations with random sweeping*, SIAM J. Optim. **25** (2015), 1221–1248.
- S. Ghadimi and G. Lan, *Stochastic first- and zeroth-order methods for nonconvex stochastic
  programming*, SIAM J. Optim. **23** (2013), 2341–2368.
- H. Karimi, J. Nutini and M. Schmidt, *Linear convergence of gradient and proximal-gradient
  methods under the Polyak–Łojasiewicz condition*, ECML PKDD 2016, arXiv:1608.04636.
- D. P. Kingma and J. Ba, *Adam: a method for stochastic optimization*, ICLR 2015,
  arXiv:1412.6980.
- Yu. Nesterov, *Lectures on convex optimization*, 2nd ed., Springer, 2018.
- B. T. Polyak, *Some methods of speeding up the convergence of iteration methods*, USSR Comput.
  Math. Math. Phys. **4** (1964), 1–17.
- B. T. Polyak, *Introduction to optimization*, Optimization Software, 1987.
- S. J. Reddi, S. Kale and S. Kumar, *On the convergence of Adam and beyond*, ICLR 2018,
  arXiv:1904.09237.
- H. Robbins and S. Monro, *A stochastic approximation method*, Ann. Math. Statist. **22** (1951),
  400–407.
- H. Robbins and D. Siegmund, *A convergence theorem for non negative almost supermartingales and
  some applications*, in *Optimizing methods in statistics*, Academic Press, 1971, 233–257.
- R. Ward, X. Wu and L. Bottou, *AdaGrad stepsizes: sharp convergence over nonconvex
  landscapes*, ICML 2019, arXiv:1806.01811.

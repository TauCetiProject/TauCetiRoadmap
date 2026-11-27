# Roadmap: Newton-type methods and algorithmic differentiation

**Summary.** This roadmap builds the iterative methods for nonlinear equations that go beyond the
local Newton theory, and the exact differentiation of evaluation programs that those methods use:
- bisection and the secant method for a scalar equation, with the golden-ratio order of the secant
  method;
- the local theory of Newton's method that needs no Lipschitz condition (superlinear convergence
  at a nondegenerate zero), the affine-covariant local theorem with its uniqueness ball, and the a
  priori error bound of the Newton–Kantorovich theorem;
- the damped Newton method with its global convergence on a compact level set, and inexact Newton
  methods with linear, superlinear and quadratic convergence controlled by the forcing terms;
- Broyden's method for systems: the secant update, its least-change and invertibility properties,
  bounded deterioration, and local linear and superlinear convergence;
- the Gauss–Newton method for nonlinear least squares, its local convergence with the
  incompatibility constant and quadratic convergence for compatible problems;
- predictor–corrector continuation along a solution curve: the order of the classical and tangent
  predictors and the step size for which the Newton corrector converges;
- algorithmic differentiation on a register machine with overwriting: forward and reverse sweeps
  and their correctness, the four-component cost model with the cheap gradient principle, and
  Jacobian compression by column colouring.

It consumes the Newton map, the quadratic remainder estimate, the Newton–Kantorovich theorem and the
Dennis–Moré characterization of the roadmap NewtonAndQuasiNewtonMethods, Mathlib's calculus (Fréchet
derivatives, the mean value inequality, the implicit function theorem, graph colourings) and Tau
Ceti's Moore–Penrose inverse. Its results are used by optimization methods built on Newton steps and
gradients, by implicit time-stepping and continuation codes, by adjoint methods for parameter
estimation, and by verified enclosures of zeros. The material is a synthesis of Gautschi,
Quarteroni–Sacco–Saleri, Stoer–Bulirsch, Ciarlet, Deuflhard, Deuflhard–Hohmann, Kelley,
Nocedal–Wright and Griewank–Walther (see [References](#references)). Headlines that restate a source
result cite a theorem, definition or equation number with its printed page; corollaries and
adaptations carry a proof route.

`Suggested.lean` states, against the pinned Mathlib and Tau Ceti, the headlines below that carry
a Lean name, each with every conclusion the README attaches to it, and the definitions those
statements need. It is not an exhaustive acceptance test; the headlines without a Lean name are
targets of the same standing, stated in prose.

Suggested home: `TauCeti/Analysis/NonlinearEquations/` for Layers 1–6 and
`TauCeti/Analysis/AlgorithmicDifferentiation/` for Layers 7–8.

## How to read the build

Layer 1 is one-dimensional and uses only the order of `ℝ` and the mean value theorem. Layer 2
refines the local Newton theory of the supplier in three directions: weaker hypotheses at the zero
(continuity of the derivative instead of a Lipschitz bound), the affine-covariant form in which
the constant `ω` measures the nonlinearity relative to the derivative at the current point, and
the a priori bound of the Kantorovich majorant. The affine-covariant theorem of 2.2 is the engine
of Layers 5 and 6: the Gauss–Newton estimate is the same computation with the Moore–Penrose
inverse in place of the inverse, and the continuation step size is the hypothesis of 2.2 at the
predicted point.

Layer 3 changes the iteration rather than the hypotheses: a step length chosen by an acceptance
test on `‖f‖²` (3.1), or a step that solves the Newton equation only up to a relative residual
(3.2). Layer 4 replaces the derivative by secant approximations and proves convergence through
bounded deterioration and the Dennis–Moré characterization of the supplier.

Layers 7 and 8 are independent of Layers 1–6. Layer 7 defines programs on a finite register file
and proves that the forward sweep computes the derivative and the reverse sweep its transpose.
Layer 8 counts operations: the work of each sweep is a natural-number vector summed over the
elementals of the evaluation trace, and its runtime is a weighted sum.

The layers are in build order: each layer needs only earlier layers and the suppliers.

## Conventions

- **Iterations are maps.** Bisection, the secant method, Newton, Broyden and Gauss–Newton are
  iterates of explicit one-step maps (`bisectSeq`, `secantSeq`, `newtonSeq`, `broydenSeq`,
  `gaussNewtonSeq`); the damped and inexact Newton methods, whose steps involve a choice, are
  predicates on sequences (`IsDampedNewtonSeq`, `IsInexactNewtonSeq`) and their theorems quantify
  over every sequence satisfying the predicate.
- **Inverses and junk values.** Inverses are Mathlib's `ContinuousLinearMap.inverse`, which is `0`
  at a map that is not invertible; the Newton map then fixes the point, and the Newton direction
  `newtonDir` is `0`. Division by `0` in the secant step is Lean's `0`, so after an exact zero the
  secant pair becomes constant. Every theorem that needs an inverse carries an invertibility
  hypothesis (`ContinuousLinearMap.IsInvertible`, or a continuous linear equivalence `A`) or
  proves invertibility as a conclusion (Kantorovich, Broyden).
- **Derivatives.** Derivatives are given as maps `f' : E → E →L[ℝ] F` with `HasFDerivAt f (f' x) x`
  on the set used; `fderiv` occurs inside the definitions of `newtonMap`, `gaussNewtonMap` and
  `newtonDir` and in statements only under a differentiability hypothesis. `C^k` hypotheses are
  `ContDiffOn` on the set used. In the scalar layer, derivatives on `[α - ε, α + ε]` are
  `derivWithin` and `iteratedDerivWithin` on that interval.
- **Lipschitz conditions.** The affine-covariant condition of 2.2 and 6.2 is the two-point form
  `‖f'(x)⁻¹ (f'(y) - f'(x)) (y - x)‖ ≤ ω ‖y - x‖²` of Deuflhard, Theorem 2.3. It is equivalent to
  the one-parameter form `‖f'(x)⁻¹ (f'(x + s v) - f'(x)) v‖ ≤ s ω ‖v‖²` of Deuflhard–Hohmann (4.4)
  (substitute `y = x + s v`). The Gauss–Newton condition of 5.1 is the same with the Moore–Penrose
  inverse. Kelley's standard assumptions are a zero `x⋆`, a derivative Lipschitz with constant `γ`
  on a ball about `x⋆`, and `f'(x⋆)` invertible.
- **Rates.** Superlinear convergence is `(fun k ↦ x (k + 1) - x⋆) =o[atTop] (fun k ↦ x k - x⋆)`
  (`Asymptotics.IsLittleO`), which needs no exception at indices where the error vanishes;
  q-linear convergence is a contraction factor `q < 1` at every step.
- **Spaces.** Layer 2 and the inexact Newton theorems work in Banach spaces (2.2 needs no
  completeness). The damped Newton method, the convergence of Broyden's method and Gauss–Newton
  work in finite-dimensional real inner product spaces, with the operator norm; the update
  lemmas of 4.1 and bounded deterioration hold in any real inner product space. The condition
  number in 3.1 is `‖A‖ ‖A⁻¹‖` in the operator norm. Euclidean `ℝⁿ` is `EuclideanSpace ℝ (Fin n)`.
- **Bisection numbering.** `bisectSeq f a b k` is the `k`-th interval, with
  `bisectSeq f a b 0 = (a, b)`; the source's interval `[a_n, b_n]` is `bisectSeq f a b (n - 1)`.
- **Register machines.** A program is a list of `ElementalStep`s on the register file `ι → ℝ` for a
  finite type `ι` of registers. Each step reads argument registers, possibly with repetitions and
  possibly including its output register, and overwrites one output register. The elemental
  function comes with its open domain and its derivative, so the forward and reverse sweeps use
  only that data.
- **Cost models.** Work is a natural-number vector `Fin 4 → ℕ` counting moves, additions and
  subtractions, multiplications, and nonlinear operations (Griewank–Walther (4.6), p. 74), for an
  explicit procedure on an evaluation trace, never a running time. The trace is the list of
  elemental kinds executed; the work of a procedure is the sum of its per-elemental work vectors,
  read off Griewank–Walther's tables. Runtime is the weighted sum `runtime w W = ∑ i, w i * W i`.
- **Sparsity.** Jacobian compression uses the actual nonzero entries of the matrix; a colouring of
  the graph built from a structural pattern containing them is a colouring of `columnGraph A`.

## Layer 1: scalar root finding

### 1.1 Bisection

`bisectStep f (a, b)` halves the interval at its midpoint `m`, keeping `(m, b)` when `f m < 0` and
`(a, m)` otherwise; `bisectSeq f a b k` is its `k`-th iterate from `(a, b)`. An exact zero at the
midpoint becomes the right endpoint.

- **The bisection invariant** (`bisectSeq_invariant`): for `a < b`, `f a < 0` and `0 < f b`, every
  interval satisfies `f a_k < 0 ≤ f b_k`, has width `(b - a) / 2 ^ k`, lies in `[a, b]`, and
  contains the next interval. No continuity is needed. Gautschi, §4.3.1, (4.30)–(4.31),
  pp. 261–262; Quarteroni–Sacco–Saleri, §6.2.1, (6.8), pp. 250–251.
- **Convergence of bisection** (`exists_bisection_root`): if moreover `f` is continuous on
  `[a, b]`, there is a zero `α ∈ [a, b]` lying in every interval, the midpoints satisfy
  `|x_k - α| ≤ (b - a) / 2 ^ (k + 1)`, and both endpoint sequences converge to `α` (Gautschi,
  (4.31), p. 262). Route: the endpoints are monotone and bounded with vanishing gap; continuity
  passes the sign conditions to the common limit.

**Checks.**
- For `f(x) = x² - 2` on `[0, 2]` the intervals begin `[0, 2]`, `[1, 2]`, `[1, 1.5]`,
  `[1.25, 1.5]`; after 40 steps the invariant, the width `2 / 2 ^ k` and the midpoint bound
  `2 / 2 ^ (k + 1)` hold at every step.
- For `f(x) = x` on `[-1, 1]` the first midpoint is the zero; `bisectStep` gives `(-1, 0)`, with
  `f(-1) < 0 ≤ f(0)`, and the iteration converges to `0`. A rule that kept the right half when
  `f m ≤ 0` would make the zero a left endpoint and break `f a_k < 0`.
- (negative control) For the step function equal to `-1` on `[0, 1/3)` and `1` on `[1/3, 1]` the
  invariant holds and the endpoints converge to `1/3`, where the function is `1`: continuity
  cannot be dropped from `exists_bisection_root`.

### 1.2 The secant method

`secantStep f (x_{n-1}, x_n) = (x_n, x_n - f(x_n) (x_n - x_{n-1}) / (f(x_n) - f(x_{n-1})))` and
`secantSeq f x₀ x₁ n` is the first component of its `n`-th iterate. Throughout, `α` is a simple
zero of `f` (`f'(α) ≠ 0`), `f` is `C²` on `I_ε = [α - ε, α + ε]` with `ε > 0`, and `M` bounds
`|f''(s) / (2 f'(t))|` for all `s, t ∈ I_ε`, with `ε M < 1` (Gautschi, Theorem 4.5.1 and
(4.49)–(4.50), p. 270). The quotient is Lean's, `0` where `f'(t) = 0`; the bound still forces
`f' ≠ 0` on `I_ε`, since otherwise `f'` takes arbitrarily small nonzero values, so `f'' = 0`,
`f` is affine and `f'(α) = 0`. The starting points `x₀ ≠ x₁` lie in `I_ε`.

- **Uniqueness on `I_ε`** (`secant_eq_of_mem_of_eq_zero`): `α` is the only zero of `f` in `I_ε`
  (Gautschi, proof of Theorem 4.5.1, p. 271). Route: Taylor's theorem gives
  `f(x) = f'(α) (x - α) (1 + (x - α) f''(ξ) / (2 f'(α)))`, and the bracket is at least
  `1 - ε M > 0`.
- **Local convergence** (`secantSeq_mem_and_tendsto`): all iterates stay in `I_ε`; for `n ≥ 1`,
  `x_{n+1} = x_n` exactly when `x_n = α`; and `x_n → α` (Gautschi, Theorem 4.5.1, pp. 270–271).
- **The error recursion** (`abs_secantSeq_sub_le`): `|x_{n+1} - α| ≤ M |x_n - α| |x_{n-1} - α|`
  for `n ≥ 1` (Gautschi, (4.52), p. 272; Stoer–Bulirsch, (5.9.8)–(5.9.11), p. 341).
- **The golden-ratio order** (`secantSeq_error_le_rpow`): with `p = (1 + √5) / 2` and
  `E = max (M |x₀ - α|) ((M |x₁ - α|) ^ (1 / p))`, `E < 1` and `M |x_n - α| ≤ E ^ (p ^ n)` for every
  `n` (Gautschi, Theorem 4.5.2 and (4.51)–(4.54), p. 272; Stoer–Bulirsch, (5.9.12), p. 341).
  Route: induction with `p² = p + 1`.

**Checks.**
- For `f(x) = x² - 2`, `ε = 0.3`: `M = 1 / (2 (√2 - 0.3)) = 0.4487` and `ε M = 0.1346`. From
  `x₀ = √2 + 0.25`, `x₁ = √2 - 0.2`, `E = 0.2254`; the values `M |x_n - α|` are `0.1122`,
  `0.08975`, `7.80e-3`, `5.97e-4`, `3.69e-6`, `1.73e-9` against the bounds `0.2254`, `0.08975`,
  `2.02e-2`, `1.82e-3`, `3.67e-5`, `6.67e-8` (equality at `n = 1`); the recursion and `x_n ∈ I_ε`
  hold for `n ≤ 8`.
- For an affine `f` the curvature bound holds with `M = 0`, and the error recursion gives
  `x₂ = α`: one secant step from distinct points is exact.
- (negative control) For `f(x) = x²` the zero is not simple, the condition on `f'` fails on every
  `I_ε`, and from `x₀ = 1`, `x₁ = 1/2` the iterates are `1/3, 1/5, 1/8, …` (reciprocals of
  Fibonacci numbers), which converge only linearly.

## Layer 2: local theory of Newton's method

`newtonMap`, `newtonSeq` and `kantorovichRadius` are the supplier's (NewtonAndQuasiNewtonMethods,
§§1.1 and 2.1). The supplier proves local quadratic convergence and uniqueness under an
affine radial Lipschitz condition (§§1.3–1.4) and the Newton–Kantorovich theorem with the
quadratic rate (§§2.1–2.2). This layer adds what those statements do not contain.

### 2.1 Superlinear convergence without a Lipschitz condition

Here `E` and `F` are Banach spaces, `f` has derivative `f' x` on a ball about the zero `x⋆`, `f'`
is continuous at `x⋆`, and `f'(x⋆) = A` for a continuous linear equivalence `A`.

- **The Newton map is superlinear at `x⋆`** (`newtonMap_sub_isLittleO`):
  `newtonMap f x - x⋆ = o(x - x⋆)` as `x → x⋆` (Nocedal–Wright, Theorem 11.2 and (11.8), p. 276).
  Route: `f'` is invertible near `x⋆` with bounded inverse, and
  `f(x) - f'(x)(x - x⋆) = o(x - x⋆)` by the mean value inequality and continuity of `f'` at `x⋆`.
- **Local superlinear convergence** (`newtonSeq_superlinear`): there is `δ > 0` such that from any
  `x₀ ∈ B(x⋆, δ)` the Newton sequence stays in `B(x⋆, δ)`, converges to `x⋆`, and
  `x_{k+1} - x⋆ = o(x_k - x⋆)` along `atTop` (Nocedal–Wright, Theorem 11.2, p. 276).

**Checks.**
- For `f(x) = x + sign(x) |x|^{3/2}` the derivative `1 + (3/2) |x|^{1/2}` is continuous but not
  Lipschitz at `0`. From `x₀ = 0.5` the ratios `|e_{k+1}| / |e_k|` are `0.17`, `0.10`, `0.041`,
  `0.0092`, `9e-4`, `2.7e-5`, tending to `0`, while `|e_{k+1}| / |e_k|²` is `0.34`, `1.2`, `4.7`,
  `26`, `275`, `9.2e3`:
  superlinear but not quadratic, so the Lipschitz hypothesis of the supplier's §1.3 is what buys
  the quadratic rate.
- (negative control) For `f(x) = x²` the derivative at the zero is not invertible and
  `newtonMap f x = x / 2`: the ratio is `1/2`, not `o(1)`.

### 2.2 The affine-covariant local theorem

`D ⊆ E` is convex, `f` has invertible derivative `f' x` at every `x ∈ D`, and
`‖f'(x)⁻¹ (f'(y) - f'(x)) (y - x)‖ ≤ ω ‖y - x‖²` for `x, y ∈ D`; `x⋆ ∈ D` is a zero. No
completeness is needed.

- **Affine-covariant convergence** (`newtonSeq_affineCovariant`): if `x₀ ∈ D`,
  `ρ = ‖x₀ - x⋆‖ < 2 / ω` and `B(x⋆, ρ) ⊆ D`, then every iterate lies in `D` with
  `‖x_{k+1} - x⋆‖ ≤ (ω / 2) ‖x_k - x⋆‖²`; when `x₀ ≠ x⋆` every `x_{k+1}` lies in `B(x⋆, ρ)`; and
  `x_k → x⋆` (Deuflhard–Hohmann, Theorem 4.10, pp. 88–89; Deuflhard, Theorem 2.3, p. 50).
  Route: with `h = x⋆ - x_k`, `x_{k+1} - x⋆ = -g(1)` for
  `g(t) = f'(x_k)⁻¹ (f(x_k + t h) - f(x_k) - t f'(x_k) h)`. The condition at the pair
  `(x_k, x_k + t h)` gives `‖g'(t)‖ ≤ ω t ‖h‖²`, and the mean value inequality gives
  `‖g(1)‖ ≤ (ω / 2) ‖h‖²`; no integral, hence no completeness, is needed.
- **Uniqueness** (`eq_of_affineCovariant_of_eq_zero`): `x⋆` is the only zero of `f` in
  `D ∩ B(x⋆, 2 / ω)` (Deuflhard–Hohmann, Theorem 4.10, p. 89; Deuflhard, Theorem 2.3, p. 50).
  Route: a zero `z` is a fixed point of the Newton map, so the estimate gives
  `‖z - x⋆‖ ≤ (ω / 2) ‖z - x⋆‖²`.

**Checks.**
- For `f(x) = x² - 2` on `D = (1/2, ∞)`: `f'(x)⁻¹ (f'(y) - f'(x)) (y - x) = (y - x)² / x`, so
  `ω = 2` and `2 / ω = 1`. From `x₀ = √2 + 0.9`, `√2 - 0.9` and `√2 + 0.5` the quadratic bound
  holds and the iterates stay in `B(√2, ρ)`; the other zero `-√2` lies outside `D`.
- (negative control) The sources state that the iterates stay in the open ball `B(x⋆, ρ)`; at
  `x₀ = x⋆` the ball is empty, which is why the headline assumes `x₀ ≠ x⋆` for that conjunct.
- With `ω ≤ 0` the hypothesis `ρ < 2 / ω` is unsatisfiable, so the theorems need no sign
  hypothesis on `ω`; Deuflhard–Hohmann's `ω ≥ 0` includes the affine case `ω = 0`, where Lean's
  `2 / 0 = 0` makes the statement vacuous rather than false.

### 2.3 The a priori bound of the Newton–Kantorovich theorem

The hypotheses are those of the supplier's §2.1: Banach spaces, `C ⊆ E`, `f` continuous on `C`
with derivative `f' x` at interior points, `x₀` interior with `f'(x₀) = A`,
`‖A⁻¹ (f'(y) - f'(x))‖ ≤ L ‖x - y‖` on `C`, `‖A⁻¹ f(x₀)‖ ≤ b`, `0 < L`, `0 < b`, `2 b L ≤ 1`,
and `B[x₀, t⋆] ⊆ C` with `t⋆ = kantorovichRadius L b`.

- **The a priori bound** (`newtonKantorovich_apriori`): `f'(x)` is invertible at every interior
  point `x` of `C` with `‖x - x₀‖ < 1 / L`, and the Newton sequence converges to a zero `x⋆` with
  `‖x⋆ - x_k‖ ≤ (L t⋆) ^ (2 ^ k) / (L 2 ^ k)` for every `k` (Ciarlet, Theorem 7.7-3,
  pp. 485–486, where `L = μ ν`, `b = λ` and the bound reads `(r / 2^k) (r₋ / r) ^ (2 ^ k)` with
  `r = 1 / L`, `r₋ = t⋆`). Route: the Neumann series for the invertibility, and the majorant
  sequence t_k of the supplier's proof, for which `t⋆ - t_k` has the closed form behind the
  bound (Ciarlet, p. 487).
- Uniqueness in Ciarlet's form follows from the supplier and is not restated. For `2 b L < 1`
  the zero is unique in the open ball `B(x₀, t⋆⋆)`, `t⋆⋆ = (1 + √(1 - 2bL)) / L`, when `f` is
  differentiable with the Lipschitz bound there: apply the supplier's §2.2 uniqueness in
  `B[x₀, ρ]` for every `ρ < t⋆⋆` with `C = B(x₀, t⋆⋆)`. In the critical case `2 b L = 1` the
  zero is unique in `B[x₀, t⋆]` (the supplier's §2.1 with `C = B[x₀, t⋆]`).

**Checks.**
- For `f(x) = x² - 2` and `x₀ = 2`: `A = 4`, `L = 1/2`, `b = 1/2`, `2bL = 1/2`,
  `t⋆ = 2 - √2 = 0.5858 = |x₀ - √2|`. The errors `0.5858`, `0.0858`, `2.45e-3`, `2.12e-6`,
  `1.6e-12` lie below the bounds `0.5858`, `0.0858`, `3.68e-3`, `1.35e-5`, `3.7e-10`, with
  equality at `k = 0, 1`. The other zero `-√2` lies at distance `2 + √2 = t⋆⋆` from `x₀`, so
  uniqueness holds in the open ball of radius `t⋆⋆` and not in the closed one.
- The invertibility radius is sharp: `f'(x₀ - 1 / L) = f'(0) = 0`.
- In the critical case `f(x) = x²`, `x₀ = 1`: `L = 1`, `b = 1/2`, `t⋆ = 1`, iterates `2^{-k}`;
  the bound `1 / 2^k` is attained, so the rate is only linear.

## Layer 3: globalized and inexact Newton methods

### 3.1 The damped Newton method

`E` is a finite-dimensional real inner product space and `f : E → E`. The Newton direction is
`newtonDir f x = Df(x)⁻¹ f(x)`, the merit function `sqResidual f x = ‖f x‖²`, and
`invCond A = 1 / (‖A‖ ‖A⁻¹‖)`. The step length `2⁻ʲ` is acceptable (`IsDampedAcceptable`) when
`h(x - 2⁻ʲ d) ≤ h(x) - 2⁻ʲ (γ / 4) ‖d‖ ‖Dh(x)‖` with `γ = invCond (Df(x))`
(Stoer–Bulirsch, (5.4.2.4), pp. 309–310). A damped Newton sequence (`IsDampedNewtonSeq`) takes at
step `k` the least acceptable `j` and moves to `x_k - 2⁻ⁱ d_k` for some `i ≤ j` that minimizes
`h(x_k - 2⁻ˡ d_k)` over `l ≤ j`.

- **Descent** (`fderiv_sqResidual_neg_newtonDir`): if `f` is differentiable at `x` with `Df(x)`
  invertible, `Dh(x)(-d) = -2 h(x)` (Stoer–Bulirsch, (5.4.2.2), p. 309, where
  `Dh(x) = 2 f(x)ᵀ Df(x)`).
- **Stationary points are zeros** (`fderiv_sqResidual_eq_zero_iff`): under the same hypotheses
  `Dh(x) = 0` iff `f x = 0` (Stoer–Bulirsch, (5.4.2.3), p. 309).
- **Global convergence** (`dampedNewton_global`): if the level set
  `K = {x | h x ≤ h x₀}` is compact, `f` is `C¹` on an open set containing `K`, and `Df` is
  invertible on `K`, then a damped Newton sequence from `x₀` exists, and every such sequence stays
  in `K`, has a cluster point (`MapClusterPt`), and has only zeros of `f` as cluster points
  (Stoer–Bulirsch, Theorem (5.4.2.5), p. 310). Route: by descent and
  `‖d‖ ‖Dh(x)‖ ≤ 2 h(x) / γ`, the test passes for small `2⁻ʲ` whenever `h(x) > 0`, so `j` exists;
  then compactness bounds `γ` below on `K`, and the decrease of `h` forces `Dh = 0` at cluster
  points.

**Checks.**
- `Dh(x)(-d) = -2 h(x)` at a random point of a planar cubic system: both sides `-4.6141`.
- For `f = arctan` from `x₀ = 3`, undamped Newton diverges (`-9.49`, `124`, …), while the damped
  method takes `j = 2`, `i = 2` at the first step and full steps thereafter, converging to `0`.
- When `Df(x)` is not invertible, `newtonDir f x = 0` and `j = 0` passes trivially; the
  invertibility hypothesis on `K` is what excludes stalling at a non-zero point, as for
  `f(x) = x² + 1` on `ℝ` with `x₀ = 0`, where `h` has a minimum but `f` no zero.

### 3.2 Inexact Newton methods

An inexact Newton sequence with forcing terms `η` (`IsInexactNewtonSeq`) satisfies
`‖f(x_k) + f'(x_k)(x_{k+1} - x_k)‖ ≤ η_k ‖f(x_k)‖` (Nocedal–Wright, (11.17) and Framework 11.2,
p. 277; Kelley, (6.1), p. 95). `E`, `F` are Banach spaces, `f(x⋆) = 0`, `f'(x⋆) = A` is a
continuous linear equivalence, and `f` has derivative `f'` on a ball about `x⋆`.

- **One-step estimate** (`inexactNewton_one_step`): under Kelley's standard assumptions there are
  `δ`, `K` with `‖x + s - x⋆‖ ≤ K (‖x - x⋆‖ + η) ‖x - x⋆‖` whenever `x ∈ B(x⋆, δ)` and
  `‖f x + f' x s‖ ≤ η ‖f x‖` (Kelley, Theorem 6.1.1, p. 95; Assumption 4.3.1, pp. 68–69). Route:
  `e₊ = f'(x)⁻¹ (f'(x) e - f(x) + r)` with `‖r‖ ≤ η ‖f x‖`; the supplier's §1.2 on the ball,
  with base point `x` and end point `x⋆`, bounds `‖f'(x) e - f(x)‖` by `(γ / 2) ‖e‖²`.
- **Linear convergence** (`inexactNewton_linear`): with `f'` continuous at `x⋆`, there are
  `η̄ > 0`, `δ > 0` and `q < 1` such that every inexact Newton sequence with `η_k ≤ η̄` from
  `B(x⋆, δ)` stays there, contracts by `q` at every step, and converges to `x⋆`
  (Nocedal–Wright, Theorem 11.3(i), p. 278; Kelley, Theorem 6.1.2, p. 96).
- **Superlinear convergence** (`inexactNewton_superlinear`): with `f'` continuous at `x⋆` and
  bounded forcing terms `η_k → 0`, the convergence is superlinear (Nocedal–Wright,
  Theorem 11.3(ii), p. 278; Kelley, Theorem 6.1.2, p. 96).
- **Quadratic convergence** (`inexactNewton_quadratic`): under the standard assumptions, for
  every `c` there are `δ > 0` and `K` such that every inexact Newton sequence from `B(x⋆, δ)` with
  `η_k ≤ c ‖f(x_k)‖` satisfies `‖x_{k+1} - x⋆‖ ≤ K ‖x_k - x⋆‖²` and converges to `x⋆`
  (Nocedal–Wright, Theorem 11.3(iii), p. 278; Kelley, Theorem 6.1.2, p. 96).
- **Any forcing bound below `1`** (`inexactNewton_weighted`): with `f'` continuous at `x⋆`, for
  `η̄ < t < 1` there is `δ` such that every inexact Newton sequence with `η_k ≤ η̄` from
  `B(x⋆, δ)` satisfies `‖A(x_{k+1} - x⋆)‖ ≤ t ‖A(x_k - x⋆)‖` and converges. This adapts Kelley,
  Theorem 6.1.4, p. 99, from the standard assumptions to continuity of `f'` at `x⋆`. Route:
  `A e_{k+1} = r_k + o(e_k)` with `‖r_k‖ ≤ η_k ‖f(x_k)‖` and `f(x_k) = A e_k + o(e_k)`.

**Checks.**
- For a planar system with `η_k = 1/2` and random residual directions of the allowed size, the
  weighted errors contract by at most `0.75 = t` at every step and reach `2e-9`.
- (negative control) With `η_k = 1` the step `s = 0` is admissible, so no convergence theorem can
  allow `η̄ ≥ 1`.
- (negative control) For `f(x) = x² - 2` from `x₀ = 2` with the constant forcing term `η = 0.1`,
  each step leaving the residual `η f(x)` of the largest allowed size, the ratios
  `|e_{k+1}| / |e_k|` tend to `0.1`: the convergence is linear, so `η_k → 0` cannot be dropped from
  the superlinear headline.
- For the same `f` from `x₀ = 1.5` with forcing terms `|f(x)|` (so `c = 1`), each step leaving the
  residual `|f(x)| f(x)`, the errors `0.0858`, `0.0233`, `1.72e-3`, `9.44e-6`, `2.84e-10`,
  `2.56e-19` have ratios `|e_{k+1}| / |e_k|²` between `3.16` and `3.19`: quadratic convergence.

## Layer 4: Broyden's method

### 4.1 The update

`E` is a real inner product space, finite-dimensional for the convergence theorems of 4.2.
Broyden's update is
`broydenUpdate B s y = B + (y - B s) sᵀ / ‖s‖²`, written with `innerSL` and
`ContinuousLinearMap.smulRight`; it is `B` when `s = 0`. A step on `(x, B)` (`broydenStep`) takes
`s = -B⁻¹ f(x)`, `x₊ = x + s` and `B₊ = broydenUpdate B s (f x₊ - f x)` (Nocedal–Wright, (11.24)
and (11.28), pp. 279–280); `broydenSeq` iterates it.

- **The secant equation** (`broydenUpdate_apply_self`): `B₊ s = y` for `s ≠ 0` (Nocedal–Wright,
  (11.27), p. 280). Proved in `Suggested.lean`.
- **Least change** (`norm_broydenUpdate_sub_le`): `‖B₊ - B‖ ≤ ‖X - B‖` for every `X` with
  `X s = y`, in the operator norm (Nocedal–Wright, Lemma 11.4, p. 280, in the Euclidean norm).
  Route: `B₊ - B = (X - B) s sᵀ / ‖s‖²` and the orthogonal projection has norm at most `1`.
- **Invertibility** (`isInvertible_broydenUpdate_iff`): for invertible `B` and `s ≠ 0`, `B₊` is
  invertible iff `⟪s, B⁻¹ y⟫ ≠ 0`. This is the Sherman–Morrison criterion of Kelley,
  Proposition 7.3.1, p. 124, with `u = (y - B s) / ‖s‖²` and `v = s`:
  `1 + ⟪s, B⁻¹ u⟫ = ⟪s, B⁻¹ y⟫ / ‖s‖²`.

**Checks.**
- On 2000 random `4 × 4` instances the least-change inequality holds against random `X` with
  `X s = y`.
- On 500 random `3 × 3` instances `det B₊ = det B · ⟪s, B⁻¹ y⟫ / ‖s‖²`.
- (negative control) `B = 1` on `ℝ²`, `s = e₁`, `y = e₂`: `⟪s, B⁻¹ y⟫ = 0` and
  `B₊ = [[0, 0], [1, 1]]` is singular, so a Broyden step can lose invertibility away from `x⋆`.
- (negative control) With `s = 0` the update returns `B`, so `B₊ s = 0`, which differs from any
  `y ≠ 0`: the secant equation needs `s ≠ 0`.

### 4.2 Convergence

Kelley's standard assumptions hold: `f(x⋆) = 0`, `f'` Lipschitz with constant `γ` on `B(x⋆, κ)`,
`f'(x⋆) = A` invertible.

- **Bounded deterioration** (`norm_broydenUpdate_sub_fderiv_le`): if `f'` is Lipschitz with
  constant `γ` on `B(x⋆, κ)`, then for `x, x + s ∈ B(x⋆, κ)` and `y = f(x + s) - f(x)`,
  `‖B₊ - f'(x⋆)‖ ≤ ‖B - f'(x⋆)‖ + (γ / 2)(‖x - x⋆‖ + ‖x + s - x⋆‖)`. This adapts Kelley,
  Theorem 7.2.2, (7.31), p. 121, stated there for the Broyden step from an invertible `B`, to an
  arbitrary step; no zero, no invertibility and no finite dimension are needed. Route:
  `B₊ - A = (B - A)(1 - P) + (y - A s) sᵀ / ‖s‖²` with `P` the orthogonal projection onto `s`,
  and `‖y - A s‖ ≤ (γ / 2)(‖e‖ + ‖e₊‖) ‖s‖` by comparing `t ↦ f(x + t s) - t A s` with the bound
  `γ ((1 - t) ‖e‖ + t ‖e₊‖) ‖s‖` on its derivative (mean value inequality, no integral).
- **Local linear convergence** (`broydenSeq_linear`): for every `r ∈ (0, 1)` there are `δ`, `δ_B`
  such that from `x₀ ∈ B(x⋆, δ)` and `‖B₀ - A‖ < δ_B` every `B_k` is invertible and
  `‖x_{k+1} - x⋆‖ ≤ r ‖x_k - x⋆‖`, with `x_k → x⋆` (Kelley, Theorem 7.2.3, p. 122).
- **Superlinear convergence** (`broydenSeq_superlinear`): under the same conditions the
  convergence is superlinear (Kelley, Theorem 7.2.4, p. 123; Nocedal–Wright, Theorem 11.5,
  pp. 282–283). Route: the Dennis–Moré condition from bounded deterioration and the summability
  of the errors (Kelley, Lemma 7.2.1, p. 116), then the supplier's §4.1; when some `x_k = x⋆` the
  sequence is constant from there and the rate is trivial.

**Checks.**
- On Nocedal–Wright's example (11.31), p. 281, from `x₀ = (-0.5, 1.4)` with `B₀ = f'(x₀)`, the
  errors are `0.64`, `0.062`, `5.3e-4`, `2.5e-4`, `4.3e-5`, `1.4e-7`, `5.7e-10`, `1.8e-12`,
  matching Nocedal–Wright's Table 11.1, p. 282, to two digits; the secant equation holds at
  every step. The ratios `0.097`, `0.0085`, `0.47`, `0.17`, `0.0033`, `0.0041`, `0.0031` are not
  monotone: superlinear convergence is a statement about the limit.
- For `f(x) = x² - 2` from `(x₀, B₀) = (1.6, 3)`, bounded deterioration with `γ = 2` holds at every
  step in 200-digit arithmetic; in double precision it fails once `s` reaches rounding level,
  because `y - B s` is then pure cancellation.

## Layer 5: the Gauss–Newton method

### 5.1 Local convergence

`E`, `F` are finite-dimensional real inner product spaces and `f : E → F`. The Gauss–Newton map is
`gaussNewtonMap f x = x - f'(x)⁺ f(x)` with Tau Ceti's `LinearMap.moorePenroseInverse`;
`gaussNewtonSeq` iterates it. `D` is convex; on `D` the derivative is injective (full column
rank), `‖f'(x)⁺ (f'(y) - f'(x)) (y - x)‖ ≤ ω ‖y - x‖²`, and
`‖f'(x)⁺ f(x⋆)‖ ≤ κ⋆ ‖x - x⋆‖` (Deuflhard–Hohmann, (4.12)–(4.13), p. 94). The normal equations
`f'(x)* f(x) = 0` say that `x` is a stationary point of `‖f‖²`.

- **Fixed points** (`gaussNewtonMap_eq_self_iff`): at a point where `f` has derivative `f'x`,
  the map fixes `x` iff the normal equations `f'x* f(x) = 0` hold (`ContinuousLinearMap.adjoint`)
  (Deuflhard–Hohmann, p. 94). Route: the kernels of `A⁺` and `A*` coincide.
- **One-step estimate** (`norm_gaussNewtonMap_sub_le`): for `x ∈ D`,
  `‖x₊ - x⋆‖ ≤ (ω / 2) ‖x - x⋆‖² + κ⋆ ‖x - x⋆‖` (Deuflhard–Hohmann, (4.15) and the proof of
  Theorem 4.14, pp. 94–95). Route: `f'(x)⁺ f'(x) = 1` by injectivity, so
  `x₊ - x⋆ = f'(x)⁺ (f(x⋆) - f(x) - f'(x)(x⋆ - x)) - f'(x)⁺ f(x⋆)`.
- **Local convergence** (`gaussNewtonSeq_tendsto`): if `x₀ ∈ D`,
  `ρ = ‖x₀ - x⋆‖ < 2 (1 - κ⋆) / ω` and `B(x⋆, ρ) ⊆ D`, the iterates stay in `D`, lie in
  `B(x⋆, ρ)` from `k = 1` on when `x₀ ≠ x⋆`, and converge to `x⋆` (Deuflhard–Hohmann,
  Theorem 4.14, p. 94).
- **Uniqueness** (`eq_of_gaussNewtonMap_eq_self`): `x⋆` is the only fixed point of the
  Gauss–Newton map in `D ∩ B(x⋆, 2 (1 - κ⋆) / ω)` (Deuflhard–Hohmann, Theorem 4.14, p. 94).
- **Compatible problems** (`gaussNewtonSeq_quadratic`): if `f(x⋆) = 0`, the incompatibility
  condition holds with `κ⋆ = 0`, and for `‖x₀ - x⋆‖ < 2 / ω` the errors satisfy
  `‖x_{k+1} - x⋆‖ ≤ (ω / 2) ‖x_k - x⋆‖²` (Deuflhard–Hohmann, p. 95). Derived in `Suggested.lean`
  from the local convergence and the one-step estimate, which remain targets.

**Checks.**
- Compatible: `f(x) = (x - 1, x² - 1)` on `ℝ`, `x⋆ = 1`, from `x₀ = 1.4`: errors `0.4`, `0.0507`,
  `9.97e-4`, `3.97e-7`, `6.3e-14`.
- Incompatible: `f(x) = (x, ε (x² + 1))`, `x⋆ = 0`. Here
  `f'(x)⁺ f(0) = 2 ε² x / (1 + 4 ε² x²)`, so `κ⋆ = 2 ε²`. For `ε = 0.2`, `0.4` the computed
  `κ⋆ = 0.08`, `0.32` and the error ratios settle at `0.080`, `0.320`: the convergence is
  linear with factor `κ⋆`, not quadratic, so `f(x⋆) = 0` cannot be dropped from the last headline.
- (negative control) For `ε = 1`, `κ⋆ = 2 > 1`. The point `0` is the global minimizer of
  `‖f‖² = 1 + 3 x² + x⁴`, but the Gauss–Newton map is `x ↦ (2 x³ - 2 x) / (1 + 4 x²)`, which
  repels `0`: from `x₀ = 0.1` the iterates `-0.190`, `0.321`, `-0.408`, `0.408`, … approach a
  two-cycle. So `κ⋆ < 1` cannot be dropped.

## Layer 6: continuation

### 6.1 Solution curves and predictors

For a `C¹` map `F` on `ℝ × E` with `F(λ₀, x₀) = 0` and `F_x(λ₀, x₀)` invertible, Mathlib's
implicit function theorem (`ContDiffAt.implicitFunction`, `ContDiffAt.contDiffAt_implicitFunction`,
`ContDiffAt.hasStrictFDerivAt_implicitFunction`) gives a `C¹` solution curve `s ↦ x(s)` near
`s = 0` with `F(λ₀ + s, x(s)) = 0`, and differentiating the identity gives the tangent equation
F_x x'(0) = -F_λ (Deuflhard–Hohmann, §4.4.1, pp. 101–103). This is
consumed, not restated. A predictor `x̂` has order `p` with constant `η` on `[-ε, ε]`
(`IsPredictorOfOrder`) if `‖x(s) - x̂(s)‖ ≤ η |s| ^ p` for `|s| ≤ ε` (Deuflhard–Hohmann,
Definition 4.21, p. 104; the source asks for the bound on a smaller interval, which is the same
notion with a smaller `ε`).

- **The classical predictor** (`isPredictorOfOrder_const`): if `x` has derivative `x'` within
  `[-ε, ε]` (`HasDerivWithinAt`) with `‖x'‖ ≤ η`, the constant predictor `x̂(s) = x(0)` has order
  `1` with constant `η` (Deuflhard–Hohmann, Lemma 4.22, p. 104).
- **The tangent predictor** (`isPredictorOfOrder_tangent`): if moreover `x'` has derivative `x''`
  within `[-ε, ε]` with `‖x''‖ ≤ C`, then `x̂(s) = x(0) + s x'(0)` has order `2` with constant
  `C / 2` (Deuflhard–Hohmann, Lemma 4.23, p. 105).

**Checks.**
- `F(x, λ) = x³ + x - λ`, `x(0) = 0`: `x'(s) = 1 / (3 x² + 1)`, so `η = 1` on `[-1, 1]` for the
  classical predictor; `max |x''| / 2 = 0.448` on `[-1, 1]` for the tangent predictor. Both bounds
  hold on a grid of 4001 points.
- (negative control) The classical predictor is not of order `2` here: `|x(s) - x(0)| / s² → ∞`.
- The tangent predictor of this odd curve behaves like order `3`:
  `|x(s) - s| / s³ = 0.9997` at `s = 0.01`, consistent with `x(s) = s - s³ + O(s⁵)`.

### 6.2 The step size of the corrector

- **Newton from the predicted point** (`tendsto_newtonSeq_predictor`): fix `s`, let `f(·, s)`
  satisfy the hypotheses of 2.2 on a convex `D` with constant `ω`, let `x(s) ∈ D` be its zero, and
  let `x̂` be a predictor of order `p` with constant `η`. If `|s| ≤ ε`, `η |s| ^ p < 2 / ω`,
  `x̂(s) ∈ D` and `B(x(s), η |s| ^ p) ⊆ D`, Newton's method for `f(·, s)` from `x̂(s)` converges
  to `x(s)` (Deuflhard–Hohmann, Theorem 4.24, p. 105). Derived in `Suggested.lean` from
  `newtonSeq_affineCovariant`, which remains a target.

When `f(·, s)` satisfies these hypotheses for every `s` with one `ω`, and `η, ω > 0`, the step
condition reads `|s| < (2 / (ω η)) ^ (1 / p)`; the printed step bound (4.24) has `max` where `min`
is meant.

**Checks.**
- For `x³ + x - λ` on `D = (-1, 1)` the two-point condition holds with
  `ω = sup 3 |x + y| / (3 x² + 1) = 3.23`; with the tangent predictor (`η = 0.448`) the step
  condition is `|s| < (2 / (3.23 · 0.448)) ^ (1/2) = 1.18`. At `s = 1/2` the remaining hypotheses
  hold: `x(1/2) = 0.424`, `x̂(1/2) = 1/2 ∈ D` and `B(0.424, 0.112) ⊆ D`.
- (negative control) With `max` as printed, the step bound would be at least `ε` whatever the
  curvature, and a large `ε` would admit steps where `η |s| ^ p ≥ 2 / ω`, for which 2.2 gives
  nothing.

## Layer 7: algorithmic differentiation on a register machine

### 7.1 Programs

An `ElementalStep ι` has an arity `a`, argument registers `args : Fin a → ι`, an output register
`out`, an open domain in `Fin a → ℝ`, an elemental function `φ` and its derivative `dφ` on the
domain (after Griewank–Walther, Table 2.2, p. 19, and Assumption (ED), p. 23). `exec` overwrites
the output register with `φ` of the arguments; `run` executes a list of steps; `runDom` is the set
of register states at which every step's arguments lie in its domain.

- **Smoothness of programs** (`isOpen_runDom_and_contDiffOn`): the domain of a program is open,
  and the program is `C^d` on it when every elemental is `C^d` on its domain (Griewank–Walther,
  Proposition 2.1, p. 23). Route: induction on the list, with `Function.update` and composition.

**Checks.**
- A five-step program on four registers with aliasing (`v₀ ← v₀ · v₀`), in-place overwriting
  (`v₂ ← tan v₂`) and a division `v₁ ← v₀ / v₃`: its domain is the set of states where the
  argument of `tan` is not an odd multiple of `π / 2` and the divisor is nonzero, an open set.
- (negative control) An elemental with a closed domain such as `[0, ∞)` for `√` would not be
  differentiable at the boundary; the structure requires an open domain.
- (negative control) Execution reads the overwritten state: `run` of `v₀ ← v₀ + v₁`,
  `v₁ ← v₀ - v₁` at `(1, 2)` is `(3, 1)`; a semantics that read all arguments from the initial
  state would give `(3, -1)`.

### 7.2 Forward and reverse sweeps

The tangent step sets `v̇_out ← Σ_j ∂_j φ · v̇_{args j}` (`ElementalStep.tangent`), the elementary
Jacobian A_i = 1 + e_out (∇φ - e_out)ᵀ of Griewank–Walther (3.7), p. 39, acting on the register
file. The adjoint step (`ElementalStep.adjoint`) is its transpose (3.11), p. 40: read
`c = v̄_out`, set `v̄_out ← 0`, then add `c ∂_j φ` to `v̄_{args j}` for every `j`. `runTangent`
composes the tangent steps forward; `runAdjoint` composes the adjoint steps in reverse order,
each at the register state before its step.

- **Forward mode** (`runTangent_eq_fderiv`): on `runDom P` the program is differentiable and the
  forward sweep computes its derivative (Griewank–Walther, (3.8)–(3.9), pp. 39–40, and
  Table 3.4, p. 35).
- **Reverse mode** (`runAdjoint_pairing`): `⟨x̄, ẋ⟩ = ⟨ȳ, ẏ⟩` for the reverse sweep `x̄` of `ȳ`
  and the forward sweep `ẏ` of `ẋ` at the same state, with no domain hypothesis
  (Griewank–Walther, (3.4), p. 39, and (3.10), p. 40). Griewank–Walther's adjoint tables
  (Table 3.5, p. 41) assume no overwrites; with overwriting the identity holds step by step
  because each adjoint step is the transpose of the elementary Jacobian on the register file.
- **Gradients** (`runAdjoint_single_eq_fderiv`): the reverse sweep seeded with the `o`-th unit
  vector computes the gradient of the `o`-th output register (Griewank–Walther, (3.3), p. 38).
  Route: the two preceding headlines.

**Checks.**
- For the four-register program with aliasing and overwriting, at `v = (0.7, 1.3, 0, 0)`, the
  forward sweep agrees with central differences to relative accuracy `1.3e-7`, and
  `⟨x̄, ẋ⟩ = ⟨ȳ, ẏ⟩ = -2807.6995` for random `ẋ`, `ȳ`.
- (negative control) Omitting the reset `v̄_out ← 0` gives `-4527.58` instead: with overwriting
  the reset is what makes the sweep the transpose.
- (negative control) For the single aliasing step `v₀ ← v₀ · v₀` at `v₀ = 3`, the tangent step
  gives `v̇₀ ← 6 v̇₀` and the adjoint step `v̄₀ ← 6 v̄₀`, adding `3 v̄₀` once for each argument; an
  adjoint step that assigned instead of adding would give `3 v̄₀` and break the pairing.

## Layer 8: complexity of derivative evaluation

### 8.1 The four-component cost model

Elementals are of four kinds (`ElementalKind`): constants, additions and subtractions,
multiplications, and univariate nonlinear functions. Their work vectors (moves, adds, mults,
nlops) are `workEval` (Griewank–Walther, (4.7), p. 75), `workTangent` ((4.16), p. 81),
`workTangentVec p` for `p` tangents (Table 4.15, p. 82), `workGradient` ((4.20), p. 84) and
`workGradientVec q` for `q` adjoints ((4.22) and Table 4.18, p. 85). `work W P` sums the vectors
over a trace `P`, and `runtime w W` weights them. Admissible weights (`IsRuntimeWeight`) are
`w = (μ, 1, π, ν)` with `μ ≥ π ≥ 1` and `ν ≥ 2 π` (Griewank–Walther, (4.11), p. 76).

- **Additive tasks are bounded** (`runtime_work_le_of_forall`): a bound
  `runtime w (W e) ≤ c · runtime w (W' e)` for every elemental kind bounds the runtime ratio of
  every trace (Griewank–Walther, Proposition 4.3, p. 78, and (4.12), p. 76). Proved in
  `Suggested.lean`: induction on the trace and linearity of `runtime`.

### 8.2 Tangents

- **One tangent** (`runtime_workTangent_le`): the tangent sweep costs at most `5/2` evaluations
  for admissible weights (Griewank–Walther, (4.17), p. 82).
- **`p` tangents** (`runtime_workTangentVec_le`): for `p ≥ 1`, at most `1 + 3p/2` evaluations
  (Griewank–Walther, (4.18), p. 82).

### 8.3 Gradients

- **The cheap gradient principle** (`runtime_workGradient_le`): a gradient costs at most `4`
  evaluations (Griewank–Walther, (4.21), p. 85, and Rule 8, p. 88).
- **`q` adjoints** (`runtime_workGradientVec_le`): for `q ≥ 1`, at most `3/2 + 5q/2` evaluations
  (Griewank–Walther, (4.23), p. 85).
- **Sharpness** (`runtime_mul_attains`): a single multiplication at `w = (1, 1, 1, 2)` attains all
  four bounds. Proved in `Suggested.lean` by evaluation.

**Checks.**
- The bounds come from per-elemental ratios; at `w = (1, 1, 1, 2)` the multiplication has
  `runtime` `4` for evaluation, `10` for the tangent, `16` for the gradient, `4 + 6p` and
  `6 + 10q` for the vector modes.
- Over a grid of admissible weights the ratios range over `(2, 5/2]`, `(1 + p, 1 + 3p/2]`,
  `(7/2, 4]` and `(3/2 + 2q, 3/2 + 5q/2]` (for `p = q = 3`: `(4, 5.5]` and `(7.5, 9]`), so the
  printed intervals of Griewank–Walther contain the ranges and their upper ends are attained.
- (negative control) Without `μ ≥ π` the gradient ratio of a multiplication tends to `5` as
  `μ → 0`, so the cheap gradient bound `4` needs that constraint.
- (negative control) For `p = 0` the vector tangent table still charges two nonlinear operations
  per univariate elemental, and the ratio `(2μ + 2ν) / (2μ + ν)` exceeds the bound `1`; likewise
  for `q = 0`. Hence `p ≥ 1` and `q ≥ 1`.

### 8.4 Jacobian compression

`columnGraph A` joins distinct columns of `A` that have a nonzero entry in a common row
(Griewank–Walther, §8.1, p. 164). A colouring `c` of it (`SimpleGraph.Coloring`) gives the seed
`colourSeed c` with entries `S j k = [c j = k]` ((8.7), p. 165).

- **Recovery** (`mul_colourSeed_apply`): `(A S) i (c j) = A i j` whenever `A i j ≠ 0`
  (Griewank–Walther, (8.6)–(8.8), pp. 164–165). Proved in `Suggested.lean`.
- **The row bound** (`card_nonzero_row_le_chromaticNumber`): the number of nonzeros in any row is
  at most `SimpleGraph.chromaticNumber` of the graph, since the nonzero columns of a row form a
  clique; so every colouring of `columnGraph A` uses at least that many colours. Proved in
  `Suggested.lean`.

**Checks.**
- A tridiagonal `6 × 6` matrix with the colouring `j mod 3`: every nonzero entry is recovered from
  `A S`; three colours, and three nonzeros in the interior rows.
- (negative control) The colouring `j mod 2` is not proper (columns `0` and `2` share row `1`), and
  `(A S) 1 0 = A 1 0 + A 1 2 ≠ A 1 0`.
- The row bound need not be attained: for the `3 × 3` matrix with rows `(1, 1, 0)`, `(0, 1, 1)`,
  `(1, 0, 1)` every row has two nonzeros, while `columnGraph A` is a triangle with chromatic
  number `3`.

## Downstream consumers

Line-search and trust-region methods for minimization use the damped Newton theory of 3.1 and the
inexact Newton theory of 3.2; implicit Runge–Kutta and multistep solvers use the inexact Newton
corrector of 3.2 and the continuation step of 6.2; nonlinear least-squares
fitting and parameter estimation use Layer 5 and the gradients of Layer 7; adjoint methods for
optimal control and back-propagation use 7.2 and the cost bounds of 8.3; sparse Jacobian
evaluation in stiff solvers uses 8.4.

## Scope and ownership

The roadmap is complete when Tau Ceti proves all of the following.

1. **Scalar methods.** The bisection invariant and convergence; uniqueness, convergence, the error
   recursion and the golden-ratio order of the secant method (1.1–1.2).
2. **Local Newton theory.** Superlinear convergence under continuity of the derivative, the
   affine-covariant local theorem and its uniqueness ball, and the Kantorovich a priori bound with
   the invertibility radius (2.1–2.3).
3. **Globalized and inexact Newton.** The descent identity, stationary points as zeros and global
   convergence of the damped method; the one-step estimate and the linear, superlinear, quadratic
   and weighted-norm convergence of inexact Newton (3.1–3.2).
4. **Broyden's method.** The secant equation, least change, invertibility, bounded deterioration,
   and local linear and superlinear convergence (4.1–4.2).
5. **Gauss–Newton.** Fixed points and the normal equations, the one-step estimate, local
   convergence, uniqueness, and quadratic convergence for compatible problems (5.1).
6. **Continuation.** The orders of the classical and tangent predictors and the corrector step
   size (6.1–6.2).
7. **Algorithmic differentiation.** Smoothness of programs, correctness of the forward and reverse
   sweeps with overwriting, and gradients (7.1–7.2).
8. **Complexity.** Boundedness of additive tasks, the tangent, gradient and vector-mode bounds,
   their sharpness, and column compression with the row bound (8.1–8.4).

Ownership boundaries.
- NewtonAndQuasiNewtonMethods owns the Newton map, the quadratic remainder estimate, local
  quadratic convergence under the affine radial condition, uniqueness of the zero, the
  Newton–Kantorovich theorem with its closed-ball uniqueness and halving of the error, the quadratic
  rate with uniqueness up to `t⋆⋆`, the BFGS and DFP updates, the Dennis–Moré characterization and
  quadratic termination. This roadmap restates none of them and consumes those listed in its
  supplier contract; its Broyden's method is the secant method for systems of equations, not the
  Broyden class of updates for minimization in that roadmap's Layer 5. Its §1.3 (local quadratic
  convergence under a radial condition at `x⋆`, radius `2/(3K)`) and §1.4 (uniqueness) are not
  consumed: 2.2 uses a condition at the current point with `f'(x)⁻¹` and has radius `2 / ω`, and 2.1
  assumes no Lipschitz condition.
- [InteriorPointMethods](../InteriorPointMethods/README.md) Layer 4 owns the damped Newton method
  for self-concordant minimization, with the step `(1 + λ)⁻¹` of the Newton decrement `λ`; 3.1 is
  the damped Newton method for equations, with the step chosen by the test on `‖f‖²`.
- Mathlib owns the implicit function theorem, which gives the solution curve and tangent equation
  of 6.1, and the algebraic Newton map of polynomials.
- The open roadmap HypergradientsAndBilevelOptimization (PR #2991), §1.1, differentiates
  parametrized fixed points; it owns no result of this roadmap, and Layer 7 does not differentiate
  through solvers.
- Newton's method for minimization, line searches and trust regions belong to optimization;
  Newton methods with interval data and verified enclosures belong to interval analysis. Both
  consume this roadmap.

## Exact supplier contracts

### From NewtonAndQuasiNewtonMethods

[NewtonAndQuasiNewtonMethods](../NewtonAndQuasiNewtonMethods/README.md), used with its hypotheses:
- §1.1: the Newton map `newtonMap f x = x - (fderiv ℝ f x).inverse (f x)` and the Newton sequence
  `newtonSeq` (local copies in `Suggested.lean`).
- §1.2: the quadratic remainder estimate: on a convex set where `g` has derivative `g'` within
  the set and `‖g' u - g' v‖ ≤ L ‖u - v‖`, `‖g y - g x - g' x (y - x)‖ ≤ (L / 2) ‖y - x‖²`. Used in
  the route of the one-step estimate of 3.2, on the ball of Kelley's standard assumptions.
- §2.1: `kantorovichRadius` (local copy) and the Newton–Kantorovich theorem: under the hypotheses
  listed in 2.3, the iterates lie in `B(x₀, t⋆)`, converge to the unique zero in `B[x₀, t⋆]`, and
  the error halves at every step. Used by 2.3.
- §2.2: for `2bL < 1`, the quadratic rate and uniqueness in `B[x₀, ρ]` for `t⋆ ≤ ρ < t⋆⋆` with
  `B[x₀, ρ] ⊆ C`. Used for the uniqueness corollary of 2.3.
- §4.1: the Dennis–Moré characterization on a finite-dimensional space: for an open convex `D`
  on which `f` has Gâteaux derivatives `f' z`, `f'` continuous at `x⋆ ∈ D` with `f'(x⋆)`
  invertible, and `x_{k+1} = x_k - B_k⁻¹ f(x_k)` with invertible `B_k`, `x_k ∈ D`, `x_k → x⋆` and
  `x_k ≠ x⋆` eventually, superlinear convergence with `f(x⋆) = 0` is equivalent to
  `‖(B_k - f'(x⋆)) s_k‖ / ‖s_k‖ → 0`. Used by 4.2 with `D = B(x⋆, κ)`, where the Fréchet
  derivative gives the Gâteaux derivatives.

### From Mathlib

- **Calculus:** `HasFDerivAt`, `fderiv`, `DifferentiableAt`, `ContDiffOn`, `derivWithin`,
  `iteratedDerivWithin`, `HasDerivWithinAt`, the mean value inequality
  `Convex.norm_image_sub_le_of_norm_hasFDerivWithin_le`, and the implicit function theorem
  `ContDiffAt.implicitFunction` with `ContDiffAt.contDiffAt_implicitFunction` and
  `ContDiffAt.hasStrictFDerivAt_implicitFunction`
  (`Mathlib/Analysis/Calculus/ImplicitContDiff.lean`).
- **Linear maps:** `ContinuousLinearMap.inverse`, `ContinuousLinearMap.IsInvertible`,
  `ContinuousLinearMap.adjoint`, `ContinuousLinearMap.smulRight`, `innerSL`.
- **Asymptotics and topology:** `Asymptotics.IsLittleO`, `MapClusterPt`, `IsCompact`.
- **Combinatorics:** `SimpleGraph.fromRel`, `SimpleGraph.Coloring`,
  `SimpleGraph.chromaticNumber`, `SimpleGraph.IsClique.card_le_chromaticNumber`.

### From Tau Ceti

- `LinearMap.moorePenroseInverse` (`TauCeti/Analysis/InnerProductSpace/MoorePenrose.lean`), the
  Moore–Penrose inverse of a linear map between finite-dimensional inner product spaces, with the
  Penrose equations and the left-inverse property for injective maps.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

The following material is recorded only to fix the boundary. Contributors should not attempt it
under this roadmap.

- **Further local theory**: Ostrowski's theorem on attraction of fixed points of `C¹` maps with
  spectral radius below `1`; the Newton–Mysovskikh theorem with existence; Newton's method at
  singular zeros; higher-order methods (Halley, Chebyshev).
- **Global methods**: global convergence of line-search Gauss–Newton (Nocedal–Wright,
  Theorem 10.1), Levenberg–Marquardt and trust regions; natural-level-function damping and the
  restricted monotonicity test; global convergence of inexact Newton with backtracking.
- **Continuation beyond a regular curve**: pseudo-arclength continuation, turning points and
  bifurcation, and step-size control from computed contraction estimates.
- **Algorithmic differentiation beyond first derivatives**: higher-order tangents, Taylor
  arithmetic and dual numbers, checkpointing and the memory–time trade-off of the reverse mode,
  Newsam–Ramsdell seeding and row compression, and sparsity detection.

## Prior formalization

[lean-NASC](https://github.com/bjbraams/lean-NASC) at commit 8efdbf7, module
`NASC/NonlinearEquations.lean`, proves without `sorry`, each in its own form:
- 1.1: the convergence of bisection, with its own bisection step (NASC.exists_bisection_root);
- 5.1: a one-step Gauss–Newton bound of the shape of the one-step estimate, with a left inverse in
  place of the Moore–Penrose inverse and a `C¹` map on the whole space
  (NASC.norm_gaussNewtonStep_sub_le);
- 6.1: the tangent predictor bound for a `C²` curve on `ℝ` (NASC.norm_sub_tangentPredictor_le);
- 7.2: forward and reverse correctness on a register model with overwriting whose instructions are
  constants, additions, multiplications and unary functions
  (NASC.ScalarInstruction.evalProgram_fderiv_apply,
  NASC.ScalarInstruction.evalProgram_reverse_dot_eq).

## References

The locators refer to these editions; page numbers are printed page numbers.

- P. G. Ciarlet, *Linear and Nonlinear Functional Analysis with Applications*, SIAM, 2013.
- P. Deuflhard, *Newton Methods for Nonlinear Problems: Affine Invariance and Adaptive
  Algorithms*, Springer Series in Computational Mathematics 35, Springer, 2011 (paperback of the
  2004 edition).
- P. Deuflhard and A. Hohmann, *Numerical Analysis in Modern Scientific Computing: An
  Introduction*, 2nd ed., Texts in Applied Mathematics 43, Springer, 2003.
- W. Gautschi, *Numerical Analysis*, 2nd ed., Birkhäuser, 2012.
- A. Griewank and A. Walther, *Evaluating Derivatives: Principles and Techniques of Algorithmic
  Differentiation*, 2nd ed., SIAM, 2008.
- C. T. Kelley, *Iterative Methods for Linear and Nonlinear Equations*, Frontiers in Applied
  Mathematics 16, SIAM, 1995.
- J. Nocedal and S. J. Wright, *Numerical Optimization*, 2nd ed., Springer, 2006.
- A. Quarteroni, R. Sacco and F. Saleri, *Numerical Mathematics*, 2nd ed., Texts in Applied
  Mathematics 37, Springer, 2007.
- J. Stoer and R. Bulirsch, *Introduction to Numerical Analysis*, 3rd ed., Texts in Applied
  Mathematics 12, Springer, 2002.

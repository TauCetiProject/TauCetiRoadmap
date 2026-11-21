# Roadmap: interior-point methods

**Summary.** A convex program `minimize f₀(x) subject to gᵢ(x) ≤ 0` can be approached from the
inside of its feasible region. One adds the logarithmic barrier `φ = −∑ log(−gᵢ)`, which is
finite exactly at the strictly feasible points and blows up at the boundary, and minimizes
`t f₀ + φ` for a growing parameter `t`. Newton's method does the minimizing, and its behaviour on
these functions is governed by self-concordance, a bound on the third derivative by the 3/2
power of the second that does not change under affine changes of variables. All statements are
theorems about functions, points and sequences defined by recursion.

The headline theorems are these.

- *The central points are `m/t`-optimal.* Let `f₀` and the `m` constraint functions be convex on
  a convex set and `t > 0`. A strictly feasible minimizer `x` of `t f₀ + φ` satisfies
  `f₀(x) − m/t ≤ f₀(z)` for every feasible `z`, with no differentiability. For every `μ > 0`,
  `μ t f₀ + φ` at `x` exceeds its value at any strictly feasible point by at most
  `m (μ − 1 − log μ)`.
- *The local theory of self-concordance.* A self-concordant function satisfies
  `|D³f(x)[h₁, h₂, h₃]| ≤ 2 |h₁|ₓ |h₂|ₓ |h₃|ₓ` in the norm `|h|ₓ` of its own Hessian. If it
  also tends to infinity at the boundary of its open domain, the open unit ball of that norm
  about any point of the domain lies in the domain, and over a step of local length `r < 1` the
  Hessian changes by a factor between `(1 − r)²` and `(1 − r)⁻²`.
- *The damped Newton method.* For such a function with positive definite Hessian on a
  finite-dimensional space, the step `x ↦ x − (1 + λ)⁻¹ D²f(x)⁻¹ Df(x)`, with `λ` the Newton
  decrement, stays in the domain, lowers `f` by at least `λ − log(1 + λ)`, and satisfies
  `λ₊ ≤ 2λ²`. If `f ≥ p` on the domain, the decrement falls to `1/4` within `(f(x₀) − p)/γ`
  steps, where `γ = 1/4 − log(5/4) ≈ 0.0269`, and for `0 < ε ≤ 1/2` the iterate is `ε`-optimal
  after `(f(x₀) − p)/γ + log₂ log₂(1/ε)` steps.
- *Newton steps per centering step.* If `μ t f₀ + φ` is self-concordant, tends to infinity at the
  boundary and has positive definite Hessian, its damped Newton sequence started from a
  minimizer of `t f₀ + φ` needs at most `m (μ − 1 − log μ)/γ` steps before its quadratic phase,
  a number independent of `t` and of the dimension.

The roadmap builds on Mathlib's convex functions, Fréchet derivatives and positive definite
matrices. It takes the Newton map from NewtonAndQuasiNewtonMethods, whose local theory under
Lipschitz conditions is a different one. Convex duality, including linear and conic programming,
is ConvexAnalysisAndDuality's and is not restated.

Layer 1 below treats the barrier and the central points using convexity alone. Layer 2 defines
self-concordance and proves its calculus and the basic examples, and Layer 3 its local theory.
Layer 4 proves the two phases of the damped Newton method, and Layer 5 combines Layers 1 and 4.

## Conventions

- **Spaces.** In Layer 1, `E` is any real vector space. In Layers 2 and 3, `E` is a real normed
  space; the sources work in `ℝⁿ`, and every argument used runs along segments or in the span of
  finitely many vectors, so it holds as stated. From 3.5 on, `E` is finite-dimensional.
- **Constraints.** The constraints are `g : ι → E → ℝ` with `ι` a finite type, `m` its cardinality
  (possibly `0`), and `S ⊆ E` a convex set that carries the domain of the problem and any affine
  equality constraints. The strictly feasible set `strictFeasibleSet S g` is
  `{x ∈ S | gᵢ(x) < 0 for every i}`; a point is feasible when it lies in `S` and `gᵢ ≤ 0` there.
- **Derivatives.** All derivatives are Mathlib's `fderiv`. `D²f(x)[v, w]` is
  `fderiv ℝ (fderiv ℝ f) x v w` and `D³f(x)[u, v, w]` is
  `fderiv ℝ (fderiv ℝ (fderiv ℝ f)) x u v w`; both are symmetric for a `C³` function on an open
  set, by Mathlib's `ContDiffAt.isSymmSndFDerivAt` (symmetry of a second derivative) applied to
  `f` at the points near `x` and to `fderiv ℝ f` at `x`. `C³` on `U` is `ContDiffOn ℝ 3 f U`.
- **Local norm.** `localNorm f x h = |h|ₓ = √(D²f(x)[h, h])`. It is a seminorm when `f` is convex;
  it is a norm exactly when `D²f(x)` is positive definite, `D²f(x)[v, v] > 0` for `v ≠ 0`.
- **Barrier property.** `f` *tends to infinity at the frontier* of an open set `U` when
  `Tendsto f (𝓝[U] y) atTop` for every `y ∈ frontier U`. Self-concordance (2.1) does not include
  it; theorems that use it assume it. Nemirovski's definition includes it, and Boyd and
  Vandenberghe call such functions closed.
- **Junk values.** `ContinuousLinearMap.inverse` is `0` on a map that is not invertible;
  `Real.log 0 = 0` and `Real.log u = log |u|` for `u < 0`; `√u = 0` for `u < 0`;
  `x ^ (3/2) = 0` for `x < 0` (Mathlib's `Real.rpow`). Every statement keeps its arguments where
  these values are not reached: the barrier is used only at strictly feasible points, and the
  Newton decrement only where the Hessian is positive definite.
- **Methods.** "Damped Newton method" and "barrier method" name maps and recursively defined
  sequences; nothing here is an algorithm to be run, and no running time is a target.

## Layer 1: the logarithmic barrier and the central path

### 1.1 The barrier and the strictly feasible set

Define `logBarrier g x = −∑ᵢ log(−gᵢ(x))` and `strictFeasibleSet S g` as in the Conventions. A
*central point* for the parameter `t > 0` is a strictly feasible minimizer of `t f₀ + φ` over the
strictly feasible set, that is
`IsMinOn (fun z ↦ t * f₀ z + logBarrier g z) (strictFeasibleSet S g) x` together with
`x ∈ strictFeasibleSet S g` (Boyd–Vandenberghe, (11.5), pp. 563–564, and §11.2.2, p. 564,
where the central point is assumed unique and the functions twice differentiable).

**Checks.**
- With `m = 0` the barrier is `0` and the strictly feasible set is `S`.
- For `g₁(x) = −x`, `g₂(x) = x − 1` on `ℝ` the barrier is `−log x − log(1 − x)` on `(0, 1)`.

*Needs:* Mathlib `Real.log`, `IsMinOn`. (Definitions.)

### 1.2 Central points are `m/t`-optimal

Prove `centralPath_bound`: let `f₀` and every `gᵢ` be convex on `S`, `t > 0`, and `x` a central
point for `t`. Then for every `z ∈ S`

    f₀(x) − m/t ≤ f₀(z) + ∑ᵢ gᵢ(z) / (−t gᵢ(x)),

and in particular `f₀(x) − m/t ≤ f₀(z)` for every feasible `z` (Boyd–Vandenberghe, §11.2.2,
pp. 565–566, for differentiable data with affine equality constraints; there the left side is
the dual function at `λᵢ = −1/(t gᵢ(x))`). No differentiability and no constraint qualification
is assumed.

Route: let `z ∈ S` and `x_s = x + s(z − x)` for small `s > 0`. Convexity gives
`gᵢ(x_s) ≤ (1 − s) gᵢ(x) + s gᵢ(z) < 0`, so `x_s` is strictly feasible, and dividing by
`gᵢ(x) < 0`, `gᵢ(x_s)/gᵢ(x) ≥ 1 + s cᵢ` with `cᵢ = gᵢ(z)/gᵢ(x) − 1`. Minimality of `x` and
convexity of `f₀` give `0 ≤ t s (f₀(z) − f₀(x)) − ∑ᵢ log(1 + s cᵢ)`. Divide by `s` and let
`s → 0⁺`, using `log(1 + u)/u → 1` as `u → 0`: `0 ≤ t (f₀(z) − f₀(x)) − ∑ᵢ cᵢ`, which is the
inequality. For feasible `z` every
`gᵢ(z)/(−t gᵢ(x))` is `≤ 0`.

**Checks.**
- Minimize `x` on `[0, 1]` (`g₁ = −x`, `g₂ = x − 1`, `m = 2`): the central point solves
  `t x² − (t + 2) x + 1 = 0`. For `t = 10`, `x ≈ 0.090098 ≤ 2/10`; the multipliers
  `λ₁ = 1/(t x) ≈ 1.1099`, `λ₂ = 1/(t(1 − x)) ≈ 0.1099` satisfy `λ₁ − λ₂ = 1`, the dual value is
  `−λ₂ ≈ −0.1099`, and the duality gap `x + λ₂` is `0.2 = m/t` exactly.
- No differentiability: for `f₀(x) = |x|` on `ℝ` with `g₁ = −x − 1`, `g₂ = x − 1`, the central
  point is `0` for every `t`, a kink of `f₀`; the Lagrangian of the bound is `|z| − 2/t`, with
  equality at `z = 0`.
- `t > 0` is needed: for `t = 0` and the first example the central point is `1/2`, and the bound
  fails (in Lean `m/0 = 0`, and `1/2 ≤ f₀(0) = 0` is false).

*Needs:* 1.1; Mathlib `ConvexOn`, `Real.log`, `Real.hasDerivAt_log`.
(Proved here, except as cited.)

### 1.3 The centering gap

Prove `centering_gap`: under the hypotheses of 1.2, for every `μ > 0` and every strictly feasible
`y`,

    (μ t f₀(x) + φ(x)) − (μ t f₀(y) + φ(y)) ≤ m (μ − 1 − log μ)

(Boyd–Vandenberghe, §11.5.2, pp. 588–589, for `μ > 1` and `y` the central point for `μ t`).

Route: with `aᵢ = gᵢ(y)/gᵢ(x) > 0` the left side is `μ t (f₀(x) − f₀(y)) + ∑ᵢ log aᵢ`. Write
`log aᵢ = log(μ aᵢ) − log μ ≤ μ aᵢ − 1 − log μ`, and `∑ᵢ μ aᵢ = −μ t ∑ᵢ gᵢ(y)/(−t gᵢ(x))`; the
first inequality of 1.2 at `z = y` finishes.

**Checks.**
- At `μ = 1` the bound is `0`, which is the minimality of `x`.
- In the example of 1.2 with `t = 10`, `μ = 2` and `y` the central point for `20`
  (`y ≈ 0.047506`), the left side is `≈ 0.25755`, below `2(1 − log 2) ≈ 0.61371`.
- The function `μ ↦ μ − 1 − log μ` is `≥ 0`, vanishes only at `1`, and is `≈ (μ − 1)²/2` near `1`.

*Needs:* 1.2; Mathlib `Real.log_le_sub_one_of_pos`. (Proved here, except as cited.)

### 1.4 The outer iterations

Prove `barrierCenters_sub_le`: let `t₀ > 0`, `μ > 1`, `ε > 0`, and let `x k` be a central point
for `μᵏ t₀` for every `k`. If `log(m/(ε t₀))/log μ ≤ k`, then `f₀(x k) − f₀(z) ≤ ε` for every
feasible `z` (Boyd–Vandenberghe, §11.3.3, (11.13), p. 577).

Route: 1.2 gives the bound `m/(μᵏ t₀)`, and `μᵏ ≥ m/(ε t₀)` under the hypothesis on `k`.

**Checks.**
- With `m = 0`, Lean's `log 0 = 0` makes the hypothesis `0 ≤ k`, and the conclusion holds because
  every central point is then optimal.
- With `μ = 1 + 1/√m` one has `log μ ≥ (log 2)/√m` (for `m = 1, 2, 5, 100`:
  `√m log μ ≈ 0.693, 0.756, 0.827, 0.953`), so `√m log₂(m/(ε t₀))` outer iterations suffice.

*Needs:* 1.2. (Proved here.)

### Examples

The segment `[0, 1]` with objective `x` and `m = 2`, at `t = 1, 10, 20, 100`: central points
`≈ 0.381966, 0.090098, 0.047506, 0.009900`, each with gap exactly `2/t` to its dual point. The
kinked objective `|x|` on `[−1, 1]`.

### Dependencies

Mathlib `ConvexOn`, `IsMinOn`, `Real.log`, `Real.hasDerivAt_log`, `Real.log_le_sub_one_of_pos`.
No other layer.

## Layer 2: self-concordant functions

### 2.1 Self-concordance

Define `SelfConcordantOn f U`: `U` is open, `f` is `C³` and convex on `U` (Mathlib's `ConvexOn`,
which makes `U` convex), and

    |D³f(x)[v, v, v]| ≤ 2 (D²f(x)[v, v])^(3/2)   for every x ∈ U and every v ∈ E

(Boyd–Vandenberghe, (9.41), p. 497, and the definition along lines on p. 498; Nemirovski,
Definition 2.0.1 and (2.1), pp. 17–18, without the barrier property). On `ℝ` with `v = 1` this is
`|f‴(x)| ≤ 2 f″(x)^(3/2)`.

**Checks.**
- `−log` on `(0, ∞)`: `f″ = 1/x²`, `f‴ = −2/x³`, equality everywhere.
- `x log x − log x` on `(0, ∞)`: the ratio `|f‴|/(2 f″^(3/2)) = (x + 2)/(2(x + 1)^(3/2))` is below
  `1` and tends to `1` as `x → 0` (`≈ 0.530` at `x = 1`).
- Non-examples: `x log x` fails exactly on `(0, 1/4)` (at `x = 0.2`, `|f‴| = 25` against
  `2 f″^(3/2) ≈ 22.36`); `exp` fails exactly for `x < −2 log 2 ≈ −1.386`;
  `(−log x)/4` fails everywhere (`|f‴| = 1/(2x³)` against `1/(4x³)`), so the factor `2` fixes a
  normalization that scaling by a number below `1` breaks.
- Affine and convex quadratic functions are self-concordant on every open convex set: their third
  derivative is `0`.
- The convexity requirement is not implied by the inequality: `−x²` on `ℝ` has `f″ = −2`,
  `(−2)^(3/2) = 0` in `Real.rpow` and `f‴ = 0`, so it satisfies the inequality and is excluded
  only by convexity.

*Needs:* Mathlib `ContDiffOn`, `ConvexOn`, `fderiv`, `Real.rpow`. (Definition.)

### 2.2 Affine substitution

Prove `SelfConcordantOn.comp_affine`: if `f` is self-concordant on `U ⊆ E` and `A : F →L[ℝ] E`,
`b ∈ E`, then `y ↦ f(A y + b)` is self-concordant on `{y | A y + b ∈ U}` (Boyd–Vandenberghe,
§9.6.2, p. 499; Nemirovski, Proposition 2.1.1 (i), p. 18, where the preimage is assumed
nonempty).

Route: `D^k(f ∘ (A · + b))(y)[v, …, v] = D^k f(A y + b)[A v, …, A v]` for `k = 2, 3`.

**Checks.**
- `−log(b − ⟪a, x⟫)` is self-concordant on the open half-space `{⟪a, x⟫ < b}`.
- With `A = 0` and `b ∈ U` the composite is constant on `F`, self-concordant on all of `F`; with
  `b ∉ U` the domain is empty and the statement holds trivially.

*Needs:* 2.1; Mathlib `ContDiffOn.comp`, `fderiv_comp`, `ConvexOn.comp_affineMap`. (Proved here,
except as cited.)

### 2.3 Weighted sums

Prove `SelfConcordantOn.sum`: if `f i` is self-concordant on `U i` and `α i ≥ 1` for every `i`
in a finite set `s`, then `∑ i ∈ s, α i f i` is self-concordant on `⋂ i ∈ s, U i`
(Boyd–Vandenberghe, §9.6.2, p. 499; Nemirovski, Proposition 2.1.1 (ii), p. 19).

Route: `∑ αᵢ bᵢ^(3/2) ≤ ∑ (αᵢ bᵢ)^(3/2) ≤ (∑ αᵢ bᵢ)^(3/2)` for `bᵢ ≥ 0`, `αᵢ ≥ 1`; the second
step is superadditivity of `u ↦ u^(3/2)` (Mathlib `NNReal.add_rpow_le_rpow_add`).

**Checks.**
- For `s = ∅` the sum is `0` on `E`.
- `t c(x) + φ(x)` for a linear `c`, `t ≥ 0` and the barrier of 2.4 is self-concordant on the
  interior of the polyhedron: the linear term has weight `1` after writing `t c` as one function.
- The weight bound is needed: `(1/4)(−log)` is not self-concordant (2.1).

*Needs:* 2.1; Mathlib `NNReal.add_rpow_le_rpow_add`, `ContDiffOn.sum`, `ConvexOn.add`. (Proved
here, except as cited.)

### 2.4 The logarithmic barrier of a polyhedron

Prove `logBarrier_linear`: for linear functionals `aᵢ : E →L[ℝ] ℝ` and reals `bᵢ`, the barrier
`x ↦ −∑ᵢ log(bᵢ − aᵢ x)` (that is `logBarrier` of `gᵢ = aᵢ − bᵢ`) is self-concordant on
`P° = {x | aᵢ x < bᵢ for every i}` and tends to infinity at every frontier point of `P°`
(Nemirovski, Corollary 2.1.1, p. 19, under a Slater point; Boyd–Vandenberghe, Example 9.4,
p. 499).

Route: 2.2 and 2.3 from 2.1's `−log`. At a frontier point `y`, some `aᵢ y = bᵢ`, so that term
tends to `+∞`, while every `bⱼ − aⱼ x` stays bounded above near `y`, so the other terms stay
bounded below.

**Checks.**
- The Hessian at `x` is `∑ᵢ aᵢ ⊗ aᵢ/(bᵢ − aᵢ x)²`; it is positive definite exactly when the `aᵢ`
  span the dual space. For `m = 0` the barrier is `0` on `E`.
- On `ℝ` with `a = (−1, 1)`, `b = (0, 1)`: `−log x − log(1 − x)` on `(0, 1)`, tending to `+∞` at
  `0` and `1`.

*Needs:* 1.1, 2.1, 2.2, 2.3; Mathlib `frontier`, `Real.tendsto_log_nhdsGT_zero`. (Proved here,
except as cited.)

### 2.5 The log-determinant

Prove `selfConcordantOn_neg_log_det`: for square real matrices `X` and `V` with `V` symmetric,
`t ↦ −log det(X + t V)` is self-concordant on `{t | X + t V is positive definite}`
(Boyd–Vandenberghe, Example 9.5, p. 499, which states self-concordance of `−log det` on the
positive definite matrices through these restrictions to lines).

Route: at a point `t₀` of the set, with `Y = X + t₀ V` positive definite and `μⱼ` the eigenvalues
of `Y^(−1/2) V Y^(−1/2)`, `−log det(X + t V) = −log det Y − ∑ⱼ log(1 + (t − t₀) μⱼ)`; apply 2.2
and 2.3.

**Checks.**
- On `1 × 1` matrices with `V = 1`, this is `−log(X + t)`, with equality in 2.1.
- For `X = I₂` and `V = diag(1, −1)`: `g(t) = −log(1 − t²)` on `(−1, 1)`; at `t = 1/2`,
  `g″ = 40/9 ≈ 4.444` and `g‴ = 416/27 ≈ 15.407`, below `2 g″^(3/2) ≈ 18.739`.
- Symmetry of `V` is needed: for `X = I₂` and `V` with a single `1` above the diagonal,
  `X + t V` is symmetric only at `t = 0`, so the set is `{0}`, which is not open.
- If `X` is not symmetric the set is empty; for `n = 0` the function is `0` on `ℝ`.

*Needs:* 2.1, 2.2, 2.3; Mathlib `Matrix.PosDef`, `Matrix.IsHermitian.eigenvalues`,
`Matrix.IsHermitian.det_eq_prod_eigenvalues`, `Matrix.det_mul`. (Proved here, except as cited.)

### Examples

`−log`, `x log x − log x`, the barrier of `[0, 1]`, linear plus barrier, and the
log-determinant; the non-examples `x log x`, `exp` and `(−log)/4`.

### Dependencies

Layer 1 (1.1, the definition of `logBarrier`); Mathlib `ContDiffOn`, `ConvexOn`, `fderiv`,
`Real.rpow`, `NNReal.add_rpow_le_rpow_add`, `ConvexOn.comp_affineMap`, `frontier`,
`Real.tendsto_log_nhdsGT_zero`, `Matrix.PosDef`, `Matrix.IsHermitian.eigenvalues`,
`Matrix.IsHermitian.det_eq_prod_eigenvalues`, `Matrix.det_mul`.

## Layer 3: local behaviour of a self-concordant function

Throughout, `f` is self-concordant on `U` and `r = |h|ₓ`.

### 3.1 The basic inequality

Define `localNorm f x h = √(D²f(x)[h, h])`. Prove `SelfConcordantOn.abs_third_le_localNorm`: for
`x ∈ U` and all `h₁, h₂, h₃`,

    |D³f(x)[h₁, h₂, h₃]| ≤ 2 |h₁|ₓ |h₂|ₓ |h₃|ₓ

(Nemirovski, §2.2, item 0, p. 20; it is the case `k = 3` of the statement (P), (2.30)–(2.31),
p. 31, whose proof is laid out in Exercises 2.3.3–2.3.6, with solutions of 2.3.3, 2.3.5 and
2.3.6 on pp. 175–176).

Route: the statement involves only the span of `h₁, h₂, h₃`. On it, replace `D²f(x)` by
`D²f(x) + δ·(an inner product)`, which is positive definite, and apply the classical fact that a
symmetric trilinear form attains the supremum of `|A[h₁, h₂, h₃]|` over the unit ball of an inner
product at a diagonal triple `h₁ = h₂ = h₃`; let `δ → 0`.

**Checks.**
- For `−log` on `(0, ∞)`, `D³f(x)[h₁, h₂, h₃] = −2h₁h₂h₃/x³` and `|hₖ|ₓ = |hₖ|/x`: equality,
  so the constant `2` cannot be lowered.
- For `f(x₁, x₂) = −log x₁ − log x₂` at `(1, 1)` and `h₁ = h₂ = h₃ = (1, 1)`: the left side is
  `|−2 − 2| = 4` and the right side `2 (√2)³ ≈ 5.657`.

*Needs:* 2.1; Mathlib `ContDiffAt.isSymmSndFDerivAt`. (Proved here, except as cited.)

### 3.2 Hessian comparison

Prove `SelfConcordantOn.hessian_comparison`: if `x, x + h ∈ U` and `r < 1`, then for every `g`

    (1 − r)² D²f(x)[g, g] ≤ D²f(x + h)[g, g] ≤ D²f(x)[g, g] / (1 − r)²

(Nemirovski, §2.2, item I, (2.2), p. 20, with the proof on pp. 20–22; Boyd–Vandenberghe, (9.46),
p. 501, along the direction `h` only).

Route: `φ(s) = D²f(x + s h)[h, h]` satisfies `|φ′| ≤ 2 φ^(3/2)`, so (after adding a small
`δ > 0`) `|d/ds φ^(−1/2)| ≤ 1` and `r²/(1 + rs)² ≤ φ(s) ≤ r²/(1 − rs)²` on `[0, 1]`. Then
`ψ(s) = D²f(x + s h)[g, g]` satisfies `|ψ′| ≤ 2 ψ φ^(1/2) ≤ 2 r ψ/(1 − r s)` by 3.1, and the
derivatives of `(1 − r s)² ψ` and `(1 − r s)⁻² ψ` have opposite signs.

**Checks.**
- For `−log` on `(0, ∞)` at `x = 1`, `h = −r`: `f″(1 − r) = 1/(1 − r)²`, equality in the upper
  bound; with `h = r`, `f″(1 + r) = 1/(1 + r)² ≥ (1 − r)²`.
- For `−log x₁ − log x₂` at `(1, 1)`, `h = (−1/2, 0)` (`r = 1/2`) and `g = (1, 0)`:
  `D²f(x)[g, g] = 1`, `D²f(x + h)[g, g] = 4 = 1/(1 − r)²`, the upper bound attained; for
  `g = (0, 1)` both values are `1`, inside the bounds `[1/4, 4]`.

*Needs:* 2.1, 3.1; Mathlib `image_le_of_deriv_right_le_deriv_boundary`. (Proved here, except as
cited.)

### 3.3 Bounds on the function

Prove `SelfConcordantOn.bounds`: for `x, x + h ∈ U`,

    f(x) + Df(x)[h] + r − log(1 + r) ≤ f(x + h),

and if moreover `r < 1`,

    f(x + h) ≤ f(x) + Df(x)[h] − r − log(1 − r)

(Nemirovski, §2.2, (2.4)–(2.5), p. 20, with the remark that the lower bound needs no `r < 1`;
Boyd–Vandenberghe, (9.48), p. 502, and (9.54), p. 504, along a line).

Route: integrate the two bounds on `φ` in 3.2 twice over `[0, 1]`; the lower one needs no
restriction on `r`.

**Checks.**
- For `−log` at `x = 1`: with `h = 0.5` the lower bound is an equality (`−log 1.5 ≈ −0.40547`);
  with `h = −0.5` the upper bound is an equality (`log 2 ≈ 0.69315`); with `h = 3` (`r = 3`) the
  lower bound is again an equality, `−log 4`.

*Needs:* 3.2; Mathlib `intervalIntegral.integral_eq_sub_of_hasDerivAt`. (Proved here, except as
cited.)

### 3.4 The Dikin ellipsoid

Prove `SelfConcordantOn.add_mem_of_localNorm_lt_one`: if `f` tends to infinity at every frontier
point of `U`, then `x + h ∈ U` for every `x ∈ U` and every `h` with `|h|ₓ < 1` (Nemirovski,
§2.2, item I, p. 20, proof step 4°, p. 22).

Route: otherwise the half-open segment from `x` towards `x + h` leaves `U` at a frontier point
`y`, and 3.3, applied along the segment with local length below `|h|ₓ < 1`, keeps `f` bounded on
it, against the barrier property.

**Checks.**
- For `−log` on `(0, ∞)`, `|h|ₓ < 1` means `x + h ∈ (0, 2x)`: the ellipsoid touches the boundary
  at `h = −x`, so the radius `1` cannot be enlarged.
- The barrier property is needed: `−log` is self-concordant on `(0, 1)`, and at `x = 0.8` the step
  `h = 0.4` has `|h|ₓ = 0.5` but `x + h = 1.2 ∉ (0, 1)`.

*Needs:* 3.3; Mathlib `frontier`, `IsOpen`, `Convex`. (Proved here, except as cited.)

### 3.5 The Newton decrement and suboptimality

Let `E` be finite-dimensional. Define `newtonDecrement f x = √(Df(x)[D²f(x)⁻¹ Df(x)])`, with
`D²f(x)` viewed as a continuous linear map from `E` to its dual and inverted by
`ContinuousLinearMap.inverse`. When `D²f(x)` is positive definite it is invertible, and
`λ(x) = sup_(v ≠ 0) Df(x)[v]/|v|ₓ` (Nemirovski, §2.2, items IV and IVa, pp. 24–25;
Boyd–Vandenberghe, §9.6.3, (9.44), p. 501).

Prove `SelfConcordantOn.sub_le_of_newtonDecrement_lt_one`: if `D²f(x)` is positive definite at
`x ∈ U` and `λ = λ(x) < 1`, then `f(x) − f(y) ≤ −λ − log(1 − λ)` for every `y ∈ U`
(Boyd–Vandenberghe, (9.49), p. 502; Nemirovski, §2.2, item VIII, (2.16), p. 28, there under the
barrier property).

Route (Boyd–Vandenberghe's): put `y = x + v`. If `Df(x)[v] ≥ 0`, convexity gives `f(y) ≥ f(x)`.
Otherwise the lower bound of 3.3 for `s v`, minimized over `s ≥ 0` with `u = −Df(x)[v]/|v|ₓ ≤ λ`,
gives `f(y) ≥ f(x) + u + log(1 − u) ≥ f(x) + λ + log(1 − λ)`.

**Checks.**
- For `f(x) = x − log x` on `(0, ∞)`: `λ(x) = |x − 1|`, and for `x < 1`,
  `f(x) − f(1) = −λ − log(1 − λ)` exactly (at `x = 0.5`, both are `≈ 0.19315`).
- For `−log` on `(0, ∞)`, `λ ≡ 1` and `f` is unbounded below: the hypothesis `λ < 1` is needed.
- `−λ − log(1 − λ) ≤ λ²` exactly for `λ ≤ 0.68380…` (Boyd–Vandenberghe, (9.50), p. 502, states it
  for `λ ≤ 0.68`): at `0.68` the two sides are `≈ 0.45943 ≤ 0.4624`, at `0.69` they are
  `≈ 0.48118 > 0.4761`.
- Positive definiteness is needed: `f(x₁, x₂) = −log x₁ + x₂` on `{x₁ > 0}` is self-concordant
  (2.3) with singular Hessian; the junk inverse gives `λ = 0`, while `f` is unbounded below.

*Needs:* 2.1, 3.3; Mathlib `ContinuousLinearMap.inverse`, `ConvexOn`. (Proved here, except as
cited.)

### Examples

`−log`, `x − log x` and the barrier of a polyhedron; the domain `(0, 1)` for `−log`, where the
barrier property fails; `−log x₁ + x₂`, where the Hessian is singular.

### Dependencies

Layer 2 (2.1; the Checks use 2.3 and 2.4); Mathlib `ContDiffAt.isSymmSndFDerivAt`,
`image_le_of_deriv_right_le_deriv_boundary`, `intervalIntegral.integral_eq_sub_of_hasDerivAt`,
`frontier`, `ContinuousLinearMap.inverse`.

## Layer 4: the damped Newton method

Throughout, `E` is finite-dimensional, `f` is self-concordant on `U`, tends to infinity at every
frontier point of `U`, and has positive definite Hessian at every point of `U`.

### 4.1 The damped Newton map and sequence

Use `newtonMap g x = x − (Dg(x))⁻¹ g(x)` of NewtonAndQuasiNewtonMethods 1.1, copied verbatim. For
the gradient map `g = Df`, `e(x) = newtonMap (Df) x − x = −D²f(x)⁻¹ Df(x)` is the Newton step of
`f`, and `|e(x)|ₓ = λ(x)`. Define `dampedNewtonMap f x = x + (1 + λ(x))⁻¹ e(x)` and
`dampedNewtonSeq f x₀ k`, its `k`-th iterate at `x₀` (Nemirovski, §2.2, item V, p. 25, and (2.23),
p. 30).

**Checks.**
- For `f(x) = x − log x`: from any `x > 1` the damped map lands on the minimizer `1`; from
  `x = 1/2` it gives `2/3`, with `λ(2/3) = 1/3`.
- At a minimizer `Df(x) = 0`, `λ = 0` and the map fixes `x`.

*Needs:* 3.5; NewtonAndQuasiNewtonMethods 1.1 (`newtonMap`). (Definitions.)

### 4.2 One damped step

Prove `dampedNewtonMap_spec`: for `x ∈ U`, with `λ = λ(x)` and `x₊` the damped Newton iterate,
`x₊ ∈ U`, `f(x₊) ≤ f(x) − (λ − log(1 + λ))` and `λ(x₊) ≤ 2λ²` (Nemirovski, §2.2, item V, (2.13),
p. 25, and item IX, (2.19), pp. 28–29; the decrease is also Boyd–Vandenberghe's estimate at the
step `1/(1 + λ)` in §9.6.4, p. 504).

Route: `|x₊ − x|ₓ = λ/(1 + λ) < 1`, so `x₊ ∈ U` by 3.4, and the upper bound of 3.3 gives the
decrease. For the decrement, fix `h` and bound the second derivative of `s ↦ Df(x + s e)[h]` on
`[0, 1/(1 + λ)]` by `2(1 − sλ)⁻³ λ² |h|ₓ` (3.1 and 3.2); two integrations give
`Df(x₊)[h] ≤ 2λ²/(1 + λ) · |h|ₓ`, and 3.2 turns `|h|ₓ` into `(1 + λ)|h|ₓ₊`.

**Checks.**
- For `f(x) = x − log x` at `x = 1/2`: `λ = 1/2`, `f(1/2) − f(2/3) = log(4/3) − 1/6 ≈ 0.12102`,
  above `1/2 − log(3/2) ≈ 0.09453`; `λ₊ = 1/3 ≤ 1/2`. For `x > 1` the decrease
  `x − 1 − log x` equals `λ − log(1 + λ)`: the bound is attained.
- For `F(x) = 20x − log x − log(1 − x)` on `(0, 1)` from `x ≈ 0.090098`: `λ ≈ 0.897`, the
  decrease `F(x) − F(x₊) ≈ 0.25754 ≥ λ − log(1 + λ) ≈ 0.25654`, and `λ(x₊) ≈ 4.35·10⁻³`.
- Without the barrier property the iterate can leave `U`: for `−log` on `(0, 1)` at `x = 0.8`,
  `λ = 1` and `x₊ = 1.2`.

*Needs:* 3.1, 3.2, 3.3, 3.4, 4.1; Mathlib `ContinuousLinearMap.inverse`. (Proved here, except as
cited.)

### 4.3 The two phases

Prove `dampedNewtonSeq_two_phase`: let `x₀ ∈ U`, `p ≤ f(y)` for all `y ∈ U`, `x_k` the damped
Newton sequence from `x₀`, and `γ = 1/4 − log(5/4) ≈ 0.026856`. Then

- some `k₀ ≤ (f(x₀) − p)/γ` has `2λ(x_(k₀ + j)) ≤ (1/2)^(2^j)` for every `j ≥ 0`;
- for `0 < ε ≤ 1/2` and every `l ≥ (f(x₀) − p)/γ + log₂ log₂(1/ε)`, `f(x_l) − f(y) ≤ ε` for all
  `y ∈ U`

(Nemirovski, §2.2, item X, B.1–B.2 and C, p. 30, with the constant `1/4 − log(5/4)` printed
there and an unspecified absolute constant in C; Boyd–Vandenberghe, (9.53), p. 504, for the form
of the bound with backtracking line search).

Route: while `λ(x_k) > 1/4`, each step lowers `f` by more than `γ` (4.2, `λ − log(1 + λ)` is
increasing), and `f ≥ p`; so the first `k₀` with `λ(x_(k₀)) ≤ 1/4` exists and is at most
`(f(x₀) − p)/γ`. From there `2λ₊ ≤ (2λ)²` (4.2) keeps `λ ≤ 1/4`. For the second item,
`l − k₀ ≥ log₂ log₂(1/ε) ≥ 0` gives `2λ(x_l) ≤ ε`, and 3.5 with the Check `−λ − log(1 − λ) ≤ λ²`
for `λ ≤ 1/4` gives `f(x_l) − f(y) ≤ ε²/4 ≤ ε`.

**Checks.**
- `1/γ ≈ 37.235`; for `ε = 10⁻¹⁰`, `log₂ log₂(10¹⁰) ≈ 5.054`.
- For `F(x) = 20x − log x − log(1 − x)` from `x₀ ≈ 0.090098`, with `p = min F`:
  `F(x₀) − p ≈ 0.25755`, so the bound on `k₀` is `≈ 9.59`; in fact `k₀ = 1`
  (decrements `≈ 0.897, 4.35·10⁻³, 7.27·10⁻⁸`).
- The restriction `ε ≤ 1/2` keeps `log₂ log₂(1/ε) ≥ 0`; for `ε` between `1/2` and `1` the stated
  index could precede `k₀`.
- Without the barrier property the conclusion fails: `−log` on `(0, 1)` is bounded below by `0`,
  but `λ ≡ 1` and the iterates leave `(0, 1)`.

*Needs:* 3.5, 4.1, 4.2; Mathlib `Real.logb`. (Proved here, except as cited.)

### Examples

`x − log x` from `1/2` and from points above `1`; the barrier of `[0, 1]` plus `20x`, from
`x ≈ 0.090098`: the decrements are `≈ 0.897, 4.35·10⁻³, 7.27·10⁻⁸`, the quadratic phase starting
at the second iterate.

### Dependencies

Layer 3 (3.1–3.5); NewtonAndQuasiNewtonMethods 1.1; Mathlib `ContinuousLinearMap.inverse`,
`Real.logb`.

## Layer 5: Newton steps per centering step

### 5.1 Centering from the previous central point

Prove `centering_dampedNewtonSeq`: let `E` be finite-dimensional, `f₀` and the `gᵢ` convex on
`S`, `t > 0`, `μ > 0`, and `x` a central point for `t`. Suppose `F = μ t f₀ + φ` is
self-concordant on the strictly feasible set `S°`, tends to infinity at its frontier and has
positive definite Hessian on it. Then the damped Newton sequence of `F` from `x` has some
`k₀ ≤ m(μ − 1 − log μ)/γ` with `2λ_F(x_(k₀ + j)) ≤ (1/2)^(2^j)` for every `j`, and for
`0 < ε ≤ 1/2` every `l ≥ m(μ − 1 − log μ)/γ + log₂ log₂(1/ε)` has `F(x_l) − F(y) ≤ ε` for all
`y ∈ S°` (Boyd–Vandenberghe, §11.5.1–11.5.2, (11.24)–(11.26), pp. 586–589, with the
backtracking constants in place of `γ`).

Route: by 1.3, `p = F(x) − m(μ − 1 − log μ)` is a lower bound of `F` on `S°`; apply 4.3.

**Checks.**
- The barrier of `[0, 1]` with `f₀(x) = x`, `t = 10`, `μ = 2`: `F = 20x − log x − log(1 − x)`
  satisfies the hypotheses (2.3, 2.4), the bound is `2(1 − log 2)/γ ≈ 22.85`, and the sequence
  from `x ≈ 0.090098` is in its quadratic phase after one step.
- With `μ = 1 + 1/√m`, `m(μ − 1 − log μ) ≤ 1/2` (`≈ 0.307, 0.345, 0.388, 0.469` for
  `m = 1, 2, 5, 100`), so at most `1/(2γ) ≈ 18.6` steps precede the quadratic phase, whatever `m`
  and `t`. Together with the Check of 1.4 this gives Boyd–Vandenberghe's order-`√m` count, (11.29),
  p. 591.
- Affine equality constraints fit by parametrizing the affine set: 2.2 transports
  self-concordance, and Layer 1 allows any convex `S`.

*Needs:* 1.3, 4.3. (Proved here.)

### Examples

The barrier of `[0, 1]` with a linear objective, and linear programs `min ⟪c, x⟫` over a bounded
polyhedron with nonempty interior: given a central point for `t`, the hypotheses on `F` follow
from 2.3 and 2.4 (the linear term is continuous, so `F` keeps the barrier property of the
logarithmic barrier) when the `aᵢ` span the dual space.

### Dependencies

Layer 1 (1.3); Layer 4 (4.3).

## Scope and ownership

This roadmap owns the logarithmic barrier and the central point bounds of Layer 1, the
definition of self-concordance with its calculus and the examples of Layer 2, the local theory of
Layer 3 (basic inequality, Hessian comparison, function bounds, Dikin ellipsoid, Newton decrement
and suboptimality), the damped Newton map and its two phases, and the bound on Newton steps per
centering step.

Nothing in the pinned Mathlib or Tau Ceti treats self-concordance, Newton decrements, barriers
of optimization problems or central paths. Mathlib supplies the convex functions, derivatives,
the symmetry of second derivatives, the superadditivity of `u ↦ u^(3/2)` and positive definite
matrices used above.

- NewtonAndQuasiNewtonMethods 1.1 owns the Newton map `newtonMap`; it is copied verbatim and the
  dependency is declared. That roadmap's local convergence theory under Lipschitz conditions and
  the Newton–Kantorovich theorem (its Layers 1 and 2) are different statements and are not used;
  it lists the Newton decrement, self-concordant functions, interior-point methods and damped
  Newton steps among what it does not treat.
- NonlinearProgrammingOptimality owns first- and second-order optimality conditions for smooth
  programs (its Layers 2 and 3) and leaves barrier and interior-point methods out. The bound 1.2
  is not a multiplier theorem: it assumes a central point and needs no differentiability and no
  constraint qualification. This roadmap does not depend on that one.
- ConvexAnalysisAndDuality owns the Karush–Kuhn–Tucker theorem under Slater's condition (its
  5.2), linear-programming duality (5.3) and conic duality (5.4), whose examples include the
  dual of a semidefinite program; it leaves facial reduction and the Shapiro and Ramana duals of
  semidefinite programs beyond its scope. None of these is restated. The dual point of 1.2
  appears only in its Check; no duality theorem, conic barrier or semidefinite program is a
  target here.
- MathematicalStatisticsHighDimensional 7.4 uses strict convexity of `−log det` in a route; 2.5
  states self-concordance along lines, a different statement.

Not treated here: self-concordant barriers with a complexity parameter and short-step
path-following; primal-dual and potential-reduction methods; barriers for cones and generalized
inequalities; phase I and feasibility problems; existence and uniqueness of central points and
of minimizers; the Legendre transform of a self-concordant function; line searches; pure Newton
steps; implementations and operation counts.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Analysis/Convex/Function.lean`: `ConvexOn` (convexity of the set and Jensen's
  inequality for two points); `ConvexOn.add`; `ConvexOn.comp_affineMap` (composition with an
  affine map preserves convexity).
- `Mathlib/Order/Filter/Extr.lean`: `IsMinOn`.
- `Mathlib/Analysis/SpecialFunctions/Log/Basic.lean`: `Real.log`, `Real.log_le_sub_one_of_pos`
  (`log x ≤ x − 1` for `x > 0`), `Real.tendsto_log_nhdsGT_zero` (`log → −∞` at `0⁺`).
- `Mathlib/Analysis/SpecialFunctions/Log/Deriv.lean`: `Real.hasDerivAt_log` (derivative `x⁻¹` at
  `x ≠ 0`).
- `Mathlib/Analysis/SpecialFunctions/Log/Base.lean`: `Real.logb`.
- `Mathlib/Analysis/SpecialFunctions/Pow/Real.lean`: `Real.rpow`.
- `Mathlib/Analysis/MeanInequalitiesPow.lean`: `NNReal.add_rpow_le_rpow_add`
  (`a^p + b^p ≤ (a + b)^p` for `p ≥ 1`).
- `Mathlib/Analysis/Calculus/FDeriv/Defs.lean`: `fderiv`;
  `Mathlib/Analysis/Calculus/FDeriv/Comp.lean`: `fderiv_comp`;
  `Mathlib/Analysis/Calculus/ContDiff/Defs.lean`: `ContDiffOn`;
  `Mathlib/Analysis/Calculus/ContDiff/Comp.lean`: `ContDiffOn.comp`;
  `Mathlib/Analysis/Calculus/ContDiff/Operations.lean`: `ContDiffOn.sum`.
- `Mathlib/Analysis/Calculus/FDeriv/Symmetric.lean`: `ContDiffAt.isSymmSndFDerivAt` (a `C²`
  function has symmetric second derivative).
- `Mathlib/Analysis/Calculus/MeanValue.lean`: `image_le_of_deriv_right_le_deriv_boundary`.
- `Mathlib/MeasureTheory/Integral/IntervalIntegral/FundThmCalculus.lean`:
  `intervalIntegral.integral_eq_sub_of_hasDerivAt`.
- `Mathlib/Topology/Algebra/Module/ContinuousLinearMap/Invertible.lean`:
  `ContinuousLinearMap.inverse` (`0` on a map that is not an equivalence).
- `Mathlib/Topology/Defs/Basic.lean`: `frontier`.
- `Mathlib/LinearAlgebra/Matrix/PosDef.lean`: `Matrix.PosDef` (symmetric with `xᵀ M x > 0` for
  `x ≠ 0`); `Mathlib/Analysis/Matrix/Spectrum.lean`: `Matrix.IsHermitian.eigenvalues`,
  `Matrix.IsHermitian.det_eq_prod_eigenvalues`;
  `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean`: `Matrix.det_mul`.

### From TauCetiRoadmap.NewtonAndQuasiNewtonMethods

- Section 1.1 (Layer 1, the Newton map and the Newton sequence): `newtonMap f x =
  x − (fderiv ℝ f x).inverse (f x)` for `f : E → F` between real normed spaces, the identity at
  points of non-invertible derivative. Copied verbatim into `Suggested.lean`, inside a section
  with that roadmap's `variable` line, so that the signature is the same; used in 4.1 with `F` the
  dual of `E` and `f = fderiv ℝ f`.

No Tau Ceti declaration is used; `Suggested.lean` imports only Mathlib.

## References

- S. Boyd and L. Vandenberghe, *Convex Optimization*, Cambridge University Press, 2004; read in
  the authors' PDF at web.stanford.edu/~boyd/cvxbook; the section, equation, example and page
  numbers above are those of that PDF.
- A. Nemirovski, *Interior Point Polynomial Time Methods in Convex Programming*, lecture notes,
  Spring 1996, read in the author's PDF at www2.isye.gatech.edu/~nemirovs/Lect_IPM.pdf; the
  definition, proposition, item, equation, exercise and page numbers above are those of that PDF.
- Attributions in prose without a locator: Yu. Nesterov and A. Nemirovski (self-concordance and
  the damped Newton method, *Interior-Point Polynomial Algorithms in Convex Programming*, SIAM,
  1994, the book Nemirovski's notes follow).

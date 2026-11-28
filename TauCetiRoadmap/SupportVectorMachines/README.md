# Roadmap: support vector machines

**Summary.** A support vector machine classifies points of a real inner product space, of any
dimension, by the sign of an affine function `⟪w, x⟫ + b` chosen from a finite labelled sample by
a convex optimization problem. This roadmap proves the structural theorems of that problem.
Labels are real numbers, equal to `±1` where a statement says so.

The hard-margin problem minimizes `‖w‖` over the pairs `(w, b)` with `y_i (⟪w, x_i⟫ + b) ≥ 1` for
every `i`. The first headline theorem: for labels `±1` with both labels present, the problem is
feasible exactly when the convex hulls of the two classes are at a positive distance `δ`; it then
has exactly one solution, its weight vector has norm `2/δ`, and the solution divided by that norm
is the only pair with `‖w‖ ≤ 1` whose margin attains the largest value `δ/2`.

The second is the support-vector theorem with its converse, for arbitrary real labels: a feasible
pair is a solution exactly when `w = Σ α_i y_i x_i` for some `α ≥ 0` with `Σ α_i y_i = 0` that
vanishes off the margin, the points where `y_i (⟪w, x_i⟫ + b) = 1`. These points, the support
vectors, depend on the solution only; `α` need not be unique. The dual objective
`Σ α_i − ‖Σ α_i y_i x_i‖²/2` is bounded above under the same constraints on `α` exactly when the
problem is feasible, and for each solution its maximum is `‖w‖²/2`, attained exactly at those `α`.

The third concerns the soft margin, `λ‖w‖²` plus the average hinge loss, the slack-variable
problem with the slacks eliminated. For `λ > 0` a minimizer exists and its `w` is unique, although
`b` need not be. If a feasible pair has a vector `α` as above, and `λ > 0` with `2λmα_i ≤ 1` for
every `i`, `m` the sample size, the soft-margin minimizers are exactly the hard-margin solutions.

The fourth is the leave-one-out bound, for a separable space `E`. Let `D` be a σ-finite measure
on pairs `(x, y)` with labels `±1` almost everywhere, and let almost every sample of size `m + 1`
be linearly separable, `m ≥ 1`. Then for every measurable choice of hard-margin solutions, the
integral over samples of `m` points of the error of the classifier they give is at most the
integral over samples of `m + 1` points of the number of support vectors, divided by `m + 1`.
Such measurable choices exist.

The roadmap builds on ThresholdFunctionsAndMargins, whose maximum-margin theorems give `δ/2` and
the homogeneous margin used for duality, and on NonlinearProgrammingOptimality, whose Fritz John
theorem gives the support vectors. Kernels enter as the choice of the space.

Below, Layer 1 treats the hard margin, Layer 2 the support vectors and duality, Layer 3 the soft
margin, and Layer 4 a measurable choice of hard-margin solutions and the leave-one-out bound.
Layer 2 uses the definitions of Layer 1, and Layers 3 and 4 each use Layers 1 and 2.

## Conventions

- **Samples.** `E` is a real inner product space of any dimension (completeness is not assumed),
  `ι` a finite type, possibly empty, `x : ι → E` the points and `y : ι → ℝ` the labels;
  `m = Fintype.card ι`. A pair `p = (w, b) : E × ℝ` is the classifier `x ↦ sign(⟪w, x⟫ + b)`.
  Labels are real numbers as in ThresholdFunctionsAndMargins; statements that need `±1` say so.
- **Hard margin.** `hardFeasible x y` is the set of `p` with `1 ≤ y i * (⟪w, x i⟫ + b)` for all
  `i`; `IsHardMarginSolution x y p` says that `p` is feasible and minimizes `‖w‖`
  there (equivalently `‖w‖²`, the objective of the sources). `classDistance x y` is
  `Metric.infDist 0 (P − N)`, `P` and `N` the convex hulls of the points labelled `1` and `−1`:
  the distance between the two hulls, as in ThresholdFunctionsAndMargins 4.2. With a class
  absent, one hull is empty and `classDistance` is `0`, Mathlib's `infDist` to the empty set.
- **Support vectors.** `marginSet x y p` is the finite set of `i` with
  `y i * (⟪w, x i⟫ + b) = 1`: the points on the margin of `p`. It depends on `p` only. The indices
  where a multiplier vector of 2.1 is positive lie in it, but multiplier vectors are not used to
  define it, since they are not unique (Check of 2.1).
- **Soft margin.** `softObjective x y λ p = λ‖w‖² + m⁻¹ Σ max(0, 1 − y i (⟪w, x i⟫ + b))`, the
  form of Shalev-Shwartz–Ben-David (15.5); with `m = 0` the average is `0` (Lean's `0⁻¹ = 0`).
  Mohri–Rostamizadeh–Talwalkar's `½‖w‖² + C Σ ξ_i` has the same minimizers for `λ = 1/(2Cm)`.
  Minimizers are stated with Mathlib's `IsMinOn f Set.univ p`.
- **Risk.** For a measure `D` on `E × ℝ`, `misclassRisk D p` is the `D`-mass of the pairs `(x, y)`
  with `y (⟪w, x⟫ + b) ≤ 0`, in `ℝ≥0∞`: ties count as errors. Samples of size `m` are
  `Fin m → E × ℝ` under `Measure.pi (fun _ => D)`. `E` carries its Borel σ-algebra and is
  separable (`SecondCountableTopology`), as every finite-dimensional space and every separable
  Hilbert space is, so that the space of samples carries the Borel σ-algebra of its topology.
- **Learning rules.** A sample is `S : ι → E × ℝ`, with points `(S i).1` and labels `(S i).2`. The
  hard-margin rule is any family of measurable maps `A n : (Fin n → E × ℝ) → E × ℝ` such that
  `A n S` solves the hard-margin problem whenever the labels of `S` are `±1` and the problem is
  feasible. On a two-class separable sample the solution is unique (1.3), so every such rule
  returns it; on a sample with a single label the solutions are the `(0, b)` with `b y ≥ 1`, and
  the rule may return any of them; elsewhere the rule is arbitrary.

## Layer 1: the hard margin as a norm minimization

### 1.1 The hard-margin problem

Define `hardFeasible`, `IsHardMarginSolution` and `classDistance` as in the Conventions: the
problem `min ‖w‖` subject to `y_i (⟪w, x_i⟫ + b) ≥ 1` (Shalev-Shwartz–Ben-David, (15.2), p. 204;
Mohri–Rostamizadeh–Talwalkar, (5.7), p. 82).

**Checks.**

- `E = ℝ`, points `1, 2` labelled `1` and `−1` labelled `−1`: `w + b ≥ 1` and `w − b ≥ 1` force
  `w ≥ 1`, and `(1, 0)` is feasible, so the minimum of `|w|` is `1`; `classDistance = 2`.
- Duplicate points with opposite labels (`x_1 = x_2`, `y = (1, −1)`) make the problem infeasible,
  since `y_1 (⟪w, x_1⟫ + b) = −y_2 (⟪w, x_2⟫ + b)`; the two hulls meet and `classDistance = 0`.
- A point `x_i = 0` imposes `y_i b ≥ 1` only: with `0` labelled `1` and `2` labelled `−1`, the
  pair `(−1, 1)` is feasible.

### 1.2 Support vectors

Define `marginSet x y p`, the indices on the margin of `p` (Mohri–Rostamizadeh–Talwalkar, §5.2.2,
p. 83, call the points with a nonzero multiplier support vectors and note that they lie on the
marginal hyperplanes and are not unique; Shalev-Shwartz–Ben-David, Thm 15.8, p. 210, call the
points on the margin support vectors).

**Checks.**

- In the first Check of 1.1, `marginSet` of `(1, 0)` is `{1, −1}`: the point `2` has value `2`.
- With a single label `1`, `(0, 1)` is a solution whose margin contains every point, and `(0, 2)`
  is a solution with empty margin: for samples that are not two-class, the margin depends on
  the chosen solution.

### 1.3 Equivalence with the maximum margin

Copy `affineMargin` verbatim from ThresholdFunctionsAndMargins 4.2 (with its `variable` line).
Prove `existsUnique_isHardMarginSolution`: let the labels be `±1`, both present, and
`δ = classDistance x y`. The problem is feasible exactly when `δ > 0`. Then it has exactly one
solution `p = (w⋆, b⋆)`; `‖w⋆‖ = 2/δ`; some point labelled `1` and some point labelled `−1` lie on
its margin; and for `‖w‖ ≤ 1`, `affineMargin x y w b = δ/2` holds exactly when
`(w, b) = (w⋆, b⋆)/‖w⋆‖`. Together with ThresholdFunctionsAndMargins 4.2, which says that `δ/2` is
the largest affine margin over `‖w‖ ≤ 1`, this is the exact equivalence of the norm minimization
with the maximum-margin problem (Shalev-Shwartz–Ben-David, Lemma 15.2, p. 204, show that the
normalized hard-margin output maximizes the margin; Mohri–Rostamizadeh–Talwalkar, (5.5)–(5.7),
pp. 81–82, and the uniqueness remark on p. 82). The uniqueness of `b`, the margin points of both
classes and the uniqueness of the maximizing pair are proved here.

Route. Write `M(w, b)` for `affineMargin x y w b`. If `(w, b)` is feasible then `w ≠ 0`, since
a point of each label would need `b ≥ 1` and `−b ≥ 1`; `(w, b)/‖w‖` has norm `1` and margin at
least `1/‖w‖`, so `1/‖w‖ ≤ δ/2` by the upper-bound half of `isGreatest_affineMargin`. Hence
`δ > 0` and `‖w‖ ≥ 2/δ` on the feasible set. If `δ > 0`, the attainment half gives `(u, c)` with
`‖u‖ ≤ 1` and `M(u, c) = δ/2`, so `(2u/δ, 2c/δ)` is feasible with norm at most `2/δ`: the least
norm is `2/δ`, attained. At a solution `(w, b)` let `π = min ⟪w, x_i⟫` over the points labelled
`1` and `ν = max ⟪w, x_j⟫` over those labelled `−1`; feasibility gives `π + b ≥ 1 ≥ −1 ≥ ν + b`,
so `π − ν ≥ 2`. If `π − ν > 2`, the pair `(2w/(π − ν), −(π + ν)/(π − ν))` is feasible with a
smaller norm; so `π − ν = 2`, which forces `b = 1 − π`, and the points attaining `π` and `ν`
lie on the margin. Two solutions with `w₁ ≠ w₂` and `‖w₁‖ = ‖w₂‖` would make the feasible
midpoint shorter, by the parallelogram law (`parallelogram_law_with_norm`); so `w` is unique, and
`b = 1 − π` with it. Finally, if `‖w‖ ≤ 1` and `M(w, b) = δ/2 > 0`, then `w ≠ 0` (as above) and
`(2w/δ, 2b/δ)` is feasible with norm `2‖w‖/δ ≤ 2/δ`, hence a solution, hence equal to `(w⋆, b⋆)`,
and `‖w‖ = 1`; conversely `(w⋆, b⋆)/‖w⋆‖` has margin `δ/2`, since the least value of
`y_i (⟪w⋆, x_i⟫ + b⋆)` is `1` (a margin point exists).

**Checks.**

- In the first Check of 1.1, `δ = 2`, the solution is `(1, 0)` with `‖w⋆‖ = 1 = 2/δ`, and its margin
  points are `1` (labelled `1`) and `−1` (labelled `−1`); `(1, 0)` attains the affine margin `1`.
- Both labels are needed. With the single point `1` labelled `1`, the problem is feasible (`(0, 1)`)
  while `classDistance = 0`, and every `(0, b)` with `b ≥ 1` is a solution, so `b` is not unique.
- The margin is attained only at the normalized solution: in the first Check of 1.1, `(1, 0)` has
  margin `1`, while `(1, 1/2)` has margin `1/2` (at the point `−1`) and `(1/2, 0)` has margin `1/2`.

*Needs:* ThresholdFunctionsAndMargins 4.2 (`affineMargin`, copied; `isGreatest_affineMargin`);
Mathlib `parallelogram_law_with_norm`.

### Examples

- The homogeneous problem `min ‖w‖` subject to `y_i ⟪w, x_i⟫ ≥ 1` (Shalev-Shwartz–Ben-David, (15.3),
  p. 205) is governed by ThresholdFunctionsAndMargins 4.1 applied to the points `a_i = y_i x_i`,
  for a nonempty family. Let `γ⋆` be the distance from `0` to their hull. If `w` is feasible, then
  `w ≠ 0` and `w/‖w‖` has margin at least `1/‖w‖`, so `‖w‖ ≥ 1/γ⋆`. If `γ⋆ > 0`, then 4.1 gives a
  unit vector `w⋆` of margin `γ⋆`, and `w⋆/γ⋆` is feasible of norm `1/γ⋆`. A feasible `w` of norm
  `1/γ⋆` makes `γ⋆ w` a vector of norm `1` and margin `γ⋆`, so `γ⋆ w = w⋆` by the uniqueness clause
  of 4.1. So the problem is feasible exactly when `γ⋆ > 0`, and then its unique solution is
  `c⋆/γ⋆²`, `c⋆` the nearest point of the hull. For `a = ((1, 0), (0, 1))` this is `(1, 1)`. A
  point `x_i = 0` makes the homogeneous problem infeasible, and `γ⋆ = 0`.

### Dependencies

1.1 and 1.2 are definitions. 1.3 uses 1.1, 1.2 and ThresholdFunctionsAndMargins 4.2.

## Layer 2: support vectors, multipliers and the dual problem

### 2.1 The support-vector theorem

Define `IsMarginMultiplier x y p α`: `α ≥ 0`, `α i ≠ 0 → i ∈ marginSet x y p`,
`Σ α i * y i = 0` and `p.1 = Σ (α i * y i) • x i`. Prove
`isHardMarginSolution_iff_exists_isMarginMultiplier`: for arbitrary real labels and a feasible
`p`, `p` is a hard-margin solution exactly when it has a multiplier vector. The forward direction
is the support-vector theorem (Shalev-Shwartz–Ben-David, Thm 15.8, p. 210, homogeneous case,
through Fritz John's conditions, Lemma 15.9, p. 211; Mohri–Rostamizadeh–Talwalkar, (5.9)–(5.11),
p. 83, through the Karush–Kuhn–Tucker conditions); the converse, the affine case through Fritz
John's theorem and the arbitrary labels are proved here.

Route. Converse: for feasible `(w', b')`, `‖w'‖² ≥ ‖w‖² + 2⟪w, w' − w⟫` (expand
`‖w' − w‖² ≥ 0`, `norm_sub_sq_real`), and, inserting `(b' − b) Σ α_i y_i = 0`,
`⟪w, w' − w⟫ = Σ α_i (y_i (⟪w', x_i⟫ + b') − y_i (⟪w, x_i⟫ + b))`, which is
`Σ α_i (y_i (⟪w', x_i⟫ + b') − 1) ≥ 0`.
Forward: let `F` be the span of the `x_i`, finite-dimensional (`FiniteDimensional.span_of_finite`),
and `P` its orthogonal projection (`Submodule.starProjection`). Then `⟪P w, x_i⟫ = ⟪w, x_i⟫`
(`Submodule.inner_starProjection_left_eq_right`), so `(P w, b)` is feasible, and
`‖w‖² = ‖P w‖² + ‖w − P w‖²` (`Submodule.norm_sq_eq_add_norm_sq_starProjection`); minimality
forces `w = P w ∈ F`. On the finite-dimensional space `F × ℝ`, `(w, b)` minimizes `‖v‖²` subject to
the affine constraints `g_i (v, b) = 1 − y_i (⟪v, x_i⟫ + b) ≤ 0`, with no equality constraint.
NonlinearProgrammingOptimality 2.2 (`exists_fritzJohn`; the constraints are affine, hence
differentiable and continuous, and the objective has derivative `2⟪v, ·⟫` in `v`,
`hasStrictFDerivAt_norm_sq`) gives `μ₀ ≥ 0`, `μ ≥ 0`, not both zero, with `μ_i g_i (w, b) = 0`
and `μ₀ · 2⟪w, u⟫ − Σ μ_i y_i (⟪u, x_i⟫ + c) = 0` for all `(u, c) ∈ F × ℝ`. With `c = 0` and
`u ∈ F` this gives `2μ₀ w = Σ μ_i y_i x_i` (both sides lie in `F`), and with `u = 0`,
`Σ μ_i y_i = 0`. If `μ₀ = 0`, pairing with `(w, b)` gives
`0 = Σ μ_i y_i (⟪w, x_i⟫ + b) = Σ μ_i`, since `μ_i ≠ 0` only on the margin; so `μ = 0`, a
contradiction. Hence `α = μ/(2μ₀)` is a multiplier vector.

**Checks.**

- In the first Check of 1.1, the multiplier vector of `(1, 0)` is unique:
  `α = (1/2, 0, 1/2)` (for the points `1, 2, −1`), from `α_1 + α_3 = 1` and `α_1 − α_3 = 0`.
- Multipliers need not be unique, so they cannot define the support vectors. In `ℝ²`, with
  `(1, 0), (1, 1)` labelled `1` and `(−1, 0), (−1, 1)` labelled `−1`, the solution is
  `((1, 0), 0)`, all four points lie on its margin, and both `(1/2, 0, 1/2, 0)` and
  `(0, 1/2, 0, 1/2)` are multiplier vectors.
- The condition `Σ α i * y i = 0` cannot be dropped from the converse: in the first Check of 1.1,
  `(2, −1)` is feasible with margin `{1}`, and `α = (2, 0, 0)` satisfies every other condition,
  yet `|2| > 1`.

*Needs:* 1.1, 1.2; NonlinearProgrammingOptimality 2.2 (`exists_fritzJohn`); Mathlib
`FiniteDimensional.span_of_finite`, `Submodule.starProjection`,
`Submodule.inner_starProjection_left_eq_right`, `Submodule.norm_sq_eq_add_norm_sq_starProjection`,
`hasStrictFDerivAt_norm_sq`, `norm_sub_sq_real`.

### 2.2 Lagrangian duality

Define `dualObjective x y α = Σ α i − ‖Σ (α i * y i) • x i‖²/2` and `dualFeasible y`, the `α ≥ 0`
with `Σ α i * y i = 0`. Prove `isGreatest_dualObjective`, for arbitrary real labels: the hard-margin
problem is feasible exactly when `dualObjective` is bounded above on `dualFeasible`; and for every
solution `p`, the greatest dual value is `‖p.1‖²/2`, attained at `α ∈ dualFeasible` exactly when
`α` is a multiplier vector of `p` (Mohri–Rostamizadeh–Talwalkar, (5.12)–(5.14), p. 84, and
(5.18)–(5.19), p. 85; Shalev-Shwartz–Ben-David, §15.4, (15.8)–(15.11), pp. 211–212, who assert
strong duality without proof). The feasibility criterion and the characterization of the
maximizers are proved here.

Route. Weak duality: for feasible `(w, b)` and dual feasible `α`, with `v = Σ α_i y_i x_i`,
`‖w‖²/2 − dualObjective α = ‖w − v‖²/2 + Σ α_i (y_i (⟪w, x_i⟫ + b) − 1)` (expand, using
`Σ α_i y_i = 0`), and both terms are nonnegative. So feasibility bounds the dual. For a solution
`p`, 2.1 gives a multiplier `α`, and `Σ α_i = Σ α_i y_i (⟪w, x_i⟫ + b) = ‖w‖²` (only margin
indices carry weight), so `dualObjective α = ‖w‖²/2`: the bound is attained. A dual feasible `α`
attains it exactly when both terms of the identity vanish, which is the definition of a multiplier
vector. Infeasible implies unbounded: `ι` is nonempty (the empty sample is feasible). In the inner
product space `WithLp 2 (E × ℝ)` (inner product `⟪u.1, v.1⟫ + u.2 v.2`, `WithLp.prod_inner_apply`)
put `a_i = (y_i x_i, y_i)`. If `0` is not in the hull of the `a_i`, which is compact
(`Set.Finite.isCompact_convexHull`), its distance `γ⋆` to the hull is positive
(`IsClosed.notMem_iff_infDist_pos`), and ThresholdFunctionsAndMargins 4.1 (`isGreatest_margin`)
gives `(w, b)` with `y_i (⟪w, x_i⟫ + b) ≥ γ⋆` for all `i`, so `(w, b)/γ⋆` is feasible. Otherwise
there are weights `λ_i ≥ 0` summing to `1` with `Σ λ_i y_i x_i = 0` and `Σ λ_i y_i = 0`
(`mem_convexHull_iff_exists_fintype`, grouping the weights by index), and `α = tλ` is dual feasible
with `dualObjective (tλ) = t` for every `t ≥ 0`.

**Checks.**

- In the first Check of 1.1, `dualObjective (1/2, 0, 1/2) = 1 − 1/2 = 1/2 = ‖w⋆‖²/2`, and
  `Σ α_i = 1 = ‖w⋆‖²` (Mohri–Rostamizadeh–Talwalkar, (5.19): the squared margin `1/‖w⋆‖²` is
  `1/Σ α_i`).
- Infeasible data: `x_1 = x_2 = 1` in `ℝ` with `y = (1, −1)`; `α = (t, t)` is dual feasible,
  `Σ α_i y_i x_i = 0`, and `dualObjective = 2t` is unbounded.
- With one label `1`, `dualFeasible` is `{0}`: the dual value is `0 = ‖0‖²/2`, the value at the
  solutions `(0, b)`.

*Needs:* 1.1, 1.2, 2.1; ThresholdFunctionsAndMargins 4.1 (`margin`, `isGreatest_margin`); Mathlib
`WithLp.prod_inner_apply`, `Set.Finite.isCompact_convexHull`, `IsClosed.notMem_iff_infDist_pos`,
`mem_convexHull_iff_exists_fintype`.

### Examples

- Kernels. Take for `E` a reproducing-kernel Hilbert space `H` of functions on a set `T` (Mathlib
  `RKHS ℝ H T ℝ`, complete) and `x_i = RKHS.kerFun H (t_i) 1`, the kernel function at `t_i`. Then
  `⟪w, x_i⟫` is the value of `w` at `t_i` (the reproducing property) and `⟪x_i, x_j⟫ = K(t_i, t_j)`,
  so 2.1 puts the weight of a solution in the span of the `K(t_i, ·)`, with coefficients
  `α_i y_i`, and the dual objective of 2.2 involves only the Gram matrix `(K(t_i, t_j))`. The
  representer theorem of MathematicalStatisticsNonparametric 5.8 gives the span for the
  soft-margin objective without offset; 2.1 adds the signs and the support of the coefficients for
  the hard margin with offset.

### Dependencies

2.1 uses 1.1, 1.2 and NonlinearProgrammingOptimality 2.2. 2.2 uses 2.1 and
ThresholdFunctionsAndMargins 4.1.

## Layer 3: the soft margin

### 3.1 Regularized hinge loss

Define `softObjective`, `slackFeasible` (pairs `((w, b), ξ)` with `ξ_i ≥ 0` and
`1 − ξ_i ≤ y_i (⟪w, x_i⟫ + b)`) and `slackObjective λ ((w, b), ξ) = λ‖w‖² + m⁻¹ Σ ξ_i`. Prove
`softObjective_minimizers`: for every real `λ`, a feasible `((w, b), ξ)` minimizes the slack form
exactly when `(w, b)` minimizes `softObjective` and `ξ_i = max(0, 1 − y_i (⟪w, x_i⟫ + b))` for
every `i`; and for `λ > 0` the soft-margin objective has a minimizer, and all its minimizers have
the same `w` (Shalev-Shwartz–Ben-David, (15.4)–(15.5) and Claim 15.5, p. 207, for the
equivalence; Mohri–Rostamizadeh–Talwalkar, (5.24), p. 88, and the uniqueness remark on p. 90).
Existence and uniqueness of `w` are proved here; the labels are arbitrary reals.

Route. For feasible `((w, b), ξ)`, `slackObjective ≥ softObjective (w, b)`, with equality
exactly when each `ξ_i` is the hinge value (for `m ≥ 1`; for `m = 0` there is no slack). This
gives the equivalence in both directions. Existence for `λ > 0`: replacing `w` by its projection
onto the span `F` of the `x_i` (as in 2.1) does not increase the objective. For `m = 0` the
objective is `λ‖w‖²`, minimized at `(0, 0)`. For `m ≥ 1` the value at `(0, 0)` is `1`, so it
suffices to minimize over `w ∈ F` with `λ‖w‖² ≤ 1`, a compact set. For such `w`, the map
`b ↦ Σ max(0, 1 − y_i (⟪w, x_i⟫ + b))` is convex, piecewise linear and bounded below, so it
attains its minimum at one of its break points `b = 1/y_i − ⟪w, x_i⟫` (`y_i ≠ 0`), or is
constant. These break points lie in a bounded interval, so the objective attains its minimum on
a compact product of the ball and the interval (`IsCompact.exists_isMinOn`), and this minimum is
global. Uniqueness of `w`: if two minimizers had different `w`, their midpoint would have a
strictly smaller `λ‖w‖²` term (`parallelogram_law_with_norm`) and no larger hinge term
(convexity), contradicting minimality.

**Checks.**

- `b` need not be unique. In `ℝ` with `1` labelled `1`, `−1` labelled `−1` and `λ = 1`, the
  objective is `w² + (max(0, 1 − w − b) + max(0, 1 − w + b))/2`; for `w ≤ 1` and `|b| ≤ 1 − w` it
  is `w² + 1 − w`, and elsewhere it is larger. The minimum `3/4` is attained exactly at `w = 1/2`
  and every `b` with `|b| ≤ 1/2`; the optimal slacks at `(1/2, 0)` are `(1/2, 1/2)`.
- `λ > 0` is needed: for `λ = 0` the same data have every `(w, b)` with `w ≥ 1 + |b|` as a
  minimizer (value `0`), so `w` is not unique; for `λ = −1`, `(w, 0)` has value
  `−w² + max(0, 1 − w) → −∞`, and there is no minimizer.

*Needs:* Mathlib `Submodule.starProjection`, `Submodule.inner_starProjection_left_eq_right`,
`Submodule.norm_starProjection_apply_le`, `IsCompact.exists_isMinOn`,
`parallelogram_law_with_norm`.

### 3.2 Weak regularization recovers the hard margin

Prove `isMinOn_softObjective_iff_isHardMarginSolution`: if `p = (w⋆, b⋆)` is feasible for the
hard margin with a multiplier vector `α` (2.1), and `λ > 0` with `2λ m α_i ≤ 1` for every `i`,
then the minimizers of `softObjective x y λ` are exactly the hard-margin solutions. In the form
`½‖w‖² + C Σ ξ_i` the condition reads `C ≥ max α_i`, the box constraint of
Mohri–Rostamizadeh–Talwalkar's dual (5.33), p. 91. (Proved here; no source opened states it.)

Route. For `t ∈ [0, 1]`, `max(0, s) ≥ t s`. With `t_i = 2λ m α_i ∈ [0, 1]` and
`s_i = 1 − y_i (⟪w, x_i⟫ + b)`, and since the hinge values of `p` are `0`,
`softObjective (w, b) − softObjective p ≥ λ(‖w‖² − ‖w⋆‖²) + 2λ Σ α_i − 2λ⟪w, w⋆⟫ − 2λ b Σ α_i y_i`.
As in 2.2, `Σ α_i = ‖w⋆‖²`, and `Σ α_i y_i = 0`, so the right side is `λ‖w − w⋆‖² ≥ 0`. Hence `p`
is a minimizer, every minimizer has weight `w⋆`, and its hinge values vanish (the minimum value is
`λ‖w⋆‖²`), so it is hard-feasible with weight `w⋆`. Every hard-margin solution has weight `w⋆`,
because `p` is a solution by 2.1 and solutions share their weight (parallelogram law, as in 1.3),
and hard-feasible pairs have hinge values `0`. So both sets are the hard-feasible pairs with
weight `w⋆`.

**Checks.**

- In `ℝ` with `1` labelled `1` and `−1` labelled `−1`, `p = (1, 0)` and `α = (1/2, 1/2)`; the
  condition is `λ ≤ 1/2`. For `λ = 1/2` the objective on `w ≤ 1`, `|b| ≤ 1 − w` is `w²/2 + 1 − w`,
  least at `w = 1`, and the unique minimizer is `(1, 0)`. For `λ = 1` it is `(1/2, b)`,
  `|b| ≤ 1/2` (Check of 3.1): the threshold is sharp here.
- `λ > 0` is needed: for `λ = 0` the minimizers are all `(w, b)` with `w ≥ 1 + |b|`.
- Feasibility of `p` is needed: for `x = (0, 0)` with labels `(1, −1)`, `p = (0, 1)` and `α = 0`
  satisfy the multiplier conditions, the hard-margin problem has no solution, and the soft
  objective has minimizers (3.1).

*Needs:* 1.1, 2.1 (`IsMarginMultiplier`, and the converse in
`isHardMarginSolution_iff_exists_isMarginMultiplier`);
Mathlib `parallelogram_law_with_norm`.

### Examples

- For labels `±1`, whenever the hard-margin problem has a solution (both labels present and
  separable data, by 1.3; or a single label, with the solution `(0, ±1)` and `α = 0`), 2.1 gives a
  multiplier vector, and 3.2 says that the soft-margin minimizers coincide with the hard-margin
  solutions for every `λ` in an interval `(0, λ₀]`: the limit `λ → 0` is attained.

### Dependencies

3.1 uses Mathlib only (the projection argument of 2.1 is repeated). 3.2 uses 1.1 and 2.1.

## Layer 4: the leave-one-out bound

### 4.1 A measurable choice of hard-margin solutions

Prove `exists_measurable_isHardMarginSolution`: for `E` with its Borel σ-algebra and separable,
there is a measurable map `A : (ι → E × ℝ) → E × ℝ` such that `A S` is a hard-margin solution for
every sample `S` with labels `±1` whose hard-margin problem is feasible. (Proved here.)

Route. Define `A` piecewise. Split the samples by their label vector `σ ∈ {±1}^ι`, finitely many
measurable pieces, plus the remaining samples, on which `A` is `(0, 0)`. For the empty sample put
`(0, 0)`. For a nonempty one-class `σ` with common label `c`, put `A S = (0, c)`: a solution, since
`w = 0` is feasible with offset `c`. For a two-class `σ`, let `U_σ` be the samples of that label
vector with `classDistance > 0`; by 1.3
these are exactly the feasible ones, and there put `A S` the unique solution of 1.3; off `U_σ`
put `A S = (0, 0)`. Measurability. First, `classDistance` is continuous in the points: by
`convexHull_sub` the difference of the hulls is the hull of the `x_i − x_j`, `i` labelled `1`,
`j` labelled `−1`, and moving every point by at most `ε` moves this hull by at most `2ε` in
Hausdorff distance (`Metric.infDist_le_infDist_add_hausdorffDist`). So `U_σ` is open in its piece
and measurable, and `‖w⋆‖ = 2/δ` is continuous on it. Next, the solution is continuous on `U_σ`.
Let `S_k → S` in `U_σ`, with solutions `(w_k, b_k)` and multiplier vectors `α_k` (2.1). Then
`Σ_i α_{k,i} = ‖w_k‖²` (2.2) is bounded, and `b_k = 1 − ⟪w_k, x_{k,i}⟫` at a margin point labelled
`1` (1.3), so `b_k` is bounded. A subsequence has `α_k → ᾱ` and `b_k → b̄`
(`tendsto_subseq_of_bounded`), so `w_k = Σ α_{k,i} y_i x_{k,i} → w̄ = Σ ᾱ_i y_i x_i`. The limit
is feasible for `S` with `‖w̄‖ = 2/δ(S)`, hence it is the unique solution of `S`. So every
subsequence has a further subsequence converging to it, and the map is continuous on `U_σ`.
Continuity on the measurable set `U_σ` and constancy off it make each piece measurable
(`ContinuousOn.measurable_piecewise`), and gluing the finitely many pieces along their measurable
domains keeps it so (`Measurable.piecewise`), for the Borel σ-algebra of the separable sample space
(`Pi.borelSpace`, `Prod.borelSpace`).

**Checks.**

- The map of the route sends the sample `1, 2` labelled `1`, `−1` labelled `−1` (first Check of
  1.1) to `(1, 0)`, and the empty sample to `(0, 0)`, a solution of its (unconstrained) problem.

*Needs:* 1.1, 1.3, 2.1, 2.2; Mathlib `convexHull_sub`,
`Metric.infDist_le_infDist_add_hausdorffDist`, `tendsto_subseq_of_bounded`,
`ContinuousOn.measurable_piecewise`, `Measurable.piecewise`, `Pi.borelSpace`, `Prod.borelSpace`.

### 4.2 Expected error and support vectors

Define `misclassRisk D p`. Prove `lintegral_misclassRisk_le`: let `D` be a σ-finite measure on
`E × ℝ` whose labels are `±1` almost everywhere, `m ≥ 1`, almost every sample of size `m + 1`
separable (`hardFeasible` nonempty), and `A` a hard-margin rule (Conventions). Then
`∫⁻ misclassRisk D (A m S) d(D^m)(S) ≤ (∫⁻ #marginSet(A (m+1) S) d(D^(m+1))(S))/(m + 1)`
(Mohri–Rostamizadeh–Talwalkar, Def 5.2, p. 85, Lemma 5.3 and Thm 5.4, p. 86, for a probability
law with deterministic labels on `ℝ^N`, with separable samples assumed in the proof and support
vectors through the multipliers). The count here is of margin points; every index where a
multiplier vector is positive lies on the margin (2.1), so this count is at least Mohri's and
the bound here is the weaker one, but it does not depend on a choice of multipliers. Random
labels, σ-finite measures, an arbitrary measurable rule and the measurability are covered here,
with a complete route.

Route. Deterministic step: let `S` have `m + 1 ≥ 2` points with labels `±1`, feasible, and let
`S∖i` be `S` without its `i`-th point. If all labels of `S` equal `c`, every solution for the
nonempty sample `S∖i` is some `(0, b)` with `cb ≥ 1`, which classifies `(x_i, c)` correctly. If
both labels occur, `A (m+1) S` is the unique solution `p` (1.3). For `i ∉ marginSet p`,
`y_i (⟪w, x_i⟫ + b) > 1`. The sample `S∖i` still has both labels, because the margin of `p` meets
both classes (1.3). A multiplier vector of `p` vanishes at `i` (2.1), so its restriction is one for
`S∖i`, and `p` is the unique solution there (2.1 converse, 1.3); so `A m (S∖i) = p` classifies
`x_i` correctly. Hence at most `#marginSet (A (m+1) S)` indices `i` have `x_i` misclassified by
`A m (S∖i)` (Mohri's (5.21)). Expectations: by Tonelli and `measurePreserving_piFinSuccAbove`, the
left side equals the `D^(m+1)`-integral of the indicator that `A m` of the other `m` points
misclassifies the point left out, for any index left out; by `measurePreserving_piCongrLeft`
(exchangeability) these integrals agree for all indices. So the left side is `1/(m + 1)` times the
integral of the leave-one-out count (`lintegral_finsetSum`), and the deterministic step bounds the
count almost everywhere. The integrands are measurable (`hAm`, `Measurable.inner`,
`measurableSet_eq_fun`).

**Checks.**

- `D` uniform on `(1, 1), (2, 1), (−1, −1)` in `ℝ × ℝ`, with the rule of 4.1: for `m = 1` a
  one-point sample predicts its own label everywhere, so the left side is
  `(2/3)(1/3) + (1/3)(2/3) = 4/9`, and the right side is `1`; for `m = 2` the two sides are `2/9`
  and `25/27` (exact enumeration of the `9` and `27` samples).
- Labels `±1` are needed. Take `D = ½ δ_(1, 2) + ½ δ_(−1, −1)`, every sample of which is
  separable, and the rule returning the unique solution when the labels are `±1` and it is unique,
  `(0, −1)` when every label is `−1`, and `(0, 1)` otherwise (measurable by the argument of 4.1).
  With `m = 1` the left side is `1/2`, and the right side is `1/4`: only the sample of two copies
  of `(−1, −1)`, of probability `1/4`,
  has support vectors, two of them.
- Separability is needed: for `D = ¼ δ_(1, 1) + ¾ δ_(1, −1)`, the same rule and `m = 4`, the two
  sides are `303/512` and `499/1024` (exact enumeration), and the left one is larger. Samples with
  both labels are infeasible here.
- `m ≥ 1` is needed: for `D = δ_(0, 1)`, `m = 0`, and the rule of 4.1 changed to return `(0, −1)` on
  the empty sample and `(0, 2)` on the one-point samples labelled `1` (both solutions, and the
  rule stays measurable), the left side is `1` and the right side `0`.

*Needs:* 1.1, 1.2, 1.3, 2.1; Mathlib `Measure.pi`, `measurePreserving_piFinSuccAbove`,
`measurePreserving_piCongrLeft`, `lintegral_prod`, `lintegral_finsetSum`, `Measurable.inner`,
`measurableSet_eq_fun`.

### Examples

- 4.1 provides a rule to which 4.2 applies, so the bound is not vacuous; for the first Check of 4.2
  that rule may be replaced by any other measurable choice on single-label samples without
  changing the left side.

### Dependencies

4.1 uses 1.1, 1.3, 2.1 and 2.2. 4.2 uses 1.1–1.3 and 2.1; 4.1 shows that its hypothesis on `A` can
be met.

## Scope and ownership

This roadmap owns the hard-margin problem as a norm minimization and its equivalence with the
maximum affine margin (with the uniqueness of the maximizing pair), the support vectors defined
by the margin, the support-vector theorem and its converse, Lagrangian duality for the hard margin,
the soft margin as regularized hinge loss with existence and uniqueness of the weight vector,
the exactness of the soft margin for weak regularization, a measurable choice of hard-margin
solutions and the leave-one-out bound.

Stated elsewhere and cited, never restated:

- ThresholdFunctionsAndMargins 4.1 and 4.2 state the maximum homogeneous margin (the distance from
  the origin to a hull, with the unique maximizing direction) and the maximum affine margin (half
  the distance between the hulls); `affineMargin` is copied verbatim. Its perceptron theorem 4.3 is
  not used.
- NonlinearProgrammingOptimality 2.2 states the Fritz John theorem used in 2.1.
- MathematicalStatisticsNonparametric 5.8 states the representer theorem
  (`mem_span_kerFun_of_isMinOn`); the kernel form of the soft margin without offset is an instance
  of it and is not restated (Examples of Layer 2).

Not treated here: generalization bounds through margins and Rademacher complexity, uniform
stability and the calibration of the hinge loss, which the roadmap StatisticalLearningTheory by
another contributor treats for general hypothesis classes and losses, with the soft-margin
classifier as an example of stability (this roadmap does not depend on that one); the soft-margin
dual with box constraints as a theorem; the `ν`-formulation, multiclass and regression machines;
algorithms (sequential minimal optimization, stochastic gradient).
DiscriminantAnalysisAndLogisticRegression treats logistic regression and separation of the
logistic likelihood, and lists hinge losses and margins outside its scope.
The roadmap ConvexAnalysisAndDuality by another contributor states, in its 5.2, the
Karush–Kuhn–Tucker theorem under Slater's condition for convex programs on a finite-dimensional
inner product space, with subgradients, and the sufficiency of those conditions. For
finite-dimensional `E`, applied in `WithLp 2 (E × ℝ)` to `‖w‖²` and the affine constraints (a
feasible pair multiplied by `2` is strictly feasible), with the subgradients computed, they would
also give both directions of 2.1. Here 2.1 is stated for `E` of every dimension, and its route
uses NonlinearProgrammingOptimality 2.2 instead; this roadmap does not depend on that one.

## Exact supplier contracts

### From Mathlib

- `Metric.infDist` (`Mathlib/Topology/MetricSpace/HausdorffDistance.lean`), with
  `IsClosed.notMem_iff_infDist_pos` (for a closed nonempty set, a point is outside it exactly when
  its distance is positive) and `Metric.infDist_le_infDist_add_hausdorffDist` in the same file.
- `convexHull`, `convexHull_sub` (`Mathlib/Analysis/Convex/Combination.lean`: the hull of a
  difference is the difference of the hulls), `mem_convexHull_iff_exists_fintype` (same file),
  `Set.Finite.isCompact_convexHull` (`Mathlib/Analysis/Convex/Topology.lean`).
- `Submodule.starProjection`, `Submodule.inner_starProjection_left_eq_right`,
  `Submodule.norm_starProjection_apply_le`, `Submodule.norm_sq_eq_add_norm_sq_starProjection`
  (`Mathlib/Analysis/InnerProductSpace/Projection/Basic.lean`), for a finite-dimensional
  submodule; `FiniteDimensional.span_of_finite`
  (`Mathlib/LinearAlgebra/FiniteDimensional/Defs.lean`).
- `parallelogram_law_with_norm`, `norm_sub_sq_real`
  (`Mathlib/Analysis/InnerProductSpace/Basic.lean`);
  `hasStrictFDerivAt_norm_sq` (`Mathlib/Analysis/InnerProductSpace/Calculus.lean`);
  `WithLp.prod_inner_apply` (`Mathlib/Analysis/InnerProductSpace/ProdL2.lean`: the inner product
  of `WithLp 2 (E × F)` is the sum of the two inner products).
- `IsCompact.exists_isMinOn` (`Mathlib/Topology/Order/Compact.lean`), `tendsto_subseq_of_bounded`
  (`Mathlib/Topology/MetricSpace/Sequences.lean`).
- `Measure.pi`, `measurePreserving_piFinSuccAbove`, `measurePreserving_piCongrLeft`
  (`Mathlib/MeasureTheory/Constructions/Pi.lean`); `lintegral_prod`
  (`Mathlib/MeasureTheory/Measure/Prod.lean`); `lintegral_finsetSum`
  (`Mathlib/MeasureTheory/Integral/Lebesgue/Add.lean`); `Measurable.inner`
  (`Mathlib/MeasureTheory/Function/SpecialFunctions/Inner.lean`, for a second countable space);
  `measurableSet_eq_fun` (`Mathlib/MeasureTheory/MeasurableSpace/Constructions.lean`);
  `Measurable.piecewise` (`Mathlib/MeasureTheory/MeasurableSpace/Basic.lean`);
  `ContinuousOn.measurable_piecewise`, `Pi.borelSpace`, `Prod.borelSpace` (the last two for second
  countable factors) (`Mathlib/MeasureTheory/Constructions/BorelSpace/Basic.lean`).
- `RKHS`, `RKHS.kerFun`, in the Examples of Layer 2 only.

### From TauCetiRoadmap.ThresholdFunctionsAndMargins

- 4.1 `margin` and `isGreatest_margin` (for a nonempty finite family `a` in a real inner product
  space: the margins of the `w` with `‖w‖ ≤ 1` have greatest element the distance from `0` to the
  hull of `a`, and when it is positive the maximizing direction is unique), in 2.2 and the
  Examples of Layer 1.
- 4.2 `affineMargin` (copied verbatim, with the `variable` line
  `{E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]`) and `isGreatest_affineMargin`
  (labels `±1`, both present, `[Nonempty ι]`: the affine margins of the `(w, b)` with `‖w‖ ≤ 1`
  have greatest element `classDistance / 2`), in 1.3.

### From TauCetiRoadmap.NonlinearProgrammingOptimality

- 2.2 `exists_fritzJohn`, with `feasibleSet` (1.1): on a finite-dimensional real normed space, at
  a local minimizer on the feasible set, with the objective and the active inequality constraints
  differentiable at the point, every inequality constraint continuous there and the equality
  constraints strictly differentiable, there are `μ₀ ≥ 0`, `μ ≥ 0` and `ν`, not all zero, with
  complementary slackness and `μ₀ f' + Σ μ_i g_i' + Σ ν_j h_j' = 0`. Used in 2.1 on `F × ℝ`, with
  an empty family of equality constraints.

## References

- S. Shalev-Shwartz and S. Ben-David, *Understanding Machine Learning: From Theory to Algorithms*,
  Cambridge University Press, 2014; the authors' PDF from
  https://www.cs.huji.ac.il/~shais/UnderstandingMachineLearning/ (printed page numbers). Used:
  (15.2) and Lemma 15.2, p. 204; (15.3), p. 205; (15.4), (15.5) and Claim 15.5,
  p. 207; Thm 15.8, p. 210; Lemma 15.9 and §15.4, (15.7)–(15.9), p. 211; (15.10)–(15.11), p. 212.
- M. Mohri, A. Rostamizadeh and A. Talwalkar, *Foundations of Machine Learning*, 2nd ed., MIT
  Press, 2018; the open-access PDF linked from https://cs.nyu.edu/~mohri/mlbook/ (printed page
  numbers). Used: §5.2.1, (5.5)–(5.7), pp. 81–82; §5.2.2, (5.9)–(5.11), p. 83; §5.2.3,
  (5.12)–(5.14), p. 84, (5.18)–(5.19), p. 85; §5.2.4, Def 5.2, p. 85, Lemma 5.3, Thm 5.4 and
  (5.21), p. 86; §5.3, (5.24), p. 88, (5.26)–(5.30), p. 90, (5.33), p. 91.

# Roadmap: kernel support vector machines

**Summary.** A kernel support vector machine classifies points of a space `X` by the sign of a
function `h` in a reproducing-kernel Hilbert space `H` of real functions on `X`. Trained on a
sample `(x_1, y_1), …, (x_n, y_n)` with labels `±1`, it minimizes the average hinge loss
`max(0, 1 − y_i h(x_i))` plus `λ‖h‖²`, with `λ > 0`. This roadmap states the theorems of the
standard account of this machine, from its optimization problem to its statistical guarantees,
each with a proof route. It builds on seven other roadmaps and restates none of their results.

The first part is the optimization problem. For every maximizer `α` of the dual objective
`Σ α_i − (1/2) Σ α_i α_j y_i y_j K(x_i, x_j)` over the box `0 ≤ α_i ≤ (2λn)⁻¹`, the machine is
`Σ α_i y_i K(·, x_i)`, and the least value of the training objective is `2λ` times the largest
dual value. With an offset, the dual gains the constraint `Σ α_i y_i = 0`, and the optimal
offsets form a closed interval, which may be unbounded. The Jaakkola–Haussler inequality bounds
the leave-one-out margin at each sample point, for the machine retrained with the same weight
per point, from below by a quantity read off any dual maximizer.

The second part is statistical, for a probability law of the data. For a continuous kernel on a
second-countable space, the machine depends continuously on sample points with fixed labels, so
its losses are measurable, as the stability theory of the roadmap StatisticalLearningTheory
requires. If moreover `K(x, x) ≤ r²` and `n ≥ 1`, the expected hinge risk of the machine is at
most `R(h) + λ‖h‖² + r²/(λn)` for every `h` in `H`. For every measurable score, with no
hypothesis on where it vanishes, the excess misclassification risk of its sign is at most its
excess hinge risk. For a continuous universal kernel on a compact metric space, and `λ_n → 0`
with `nλ_n → ∞`, the expected misclassification risk of the machine converges to the Bayes risk
for every law; the Gaussian kernel of any nonzero width is universal on every compact subset of
`ℝ^d`. Finally, for a continuous kernel with `K(x, x) ≤ r²` and `r ≥ 0` on a second-countable
space, `n ≥ 1` and `δ > 0`, with probability at least `1 − δ` a margin bound holds simultaneously
for every margin `ρ` in `(0, r]` and every function of norm at most one, so that it applies to a
margin read off the sample.

The roadmap builds on StatisticalLearningTheory (risks, the Bayes classifier, the margin bound,
uniform stability), on ConvexAnalysisAndDuality (strongly convex minimization and the
Karush–Kuhn–Tucker theorem), on SupportVectorMachines and ThresholdFunctionsAndMargins (the
soft-margin problem with offset, maximum margins), on KernelsAndSpectralMethods (the Gaussian
kernel), and on Mathlib's reproducing-kernel Hilbert spaces.

Layer 1 treats the machine, its dual and the leave-one-out inequality; Layer 2 continuity,
measurability and the oracle inequality; Layer 3 calibration and universal consistency; Layer 4
the margin bound uniform in the margin.

## Conventions

- `H` is a real Hilbert space with `[RKHS ℝ H X ℝ]` (Mathlib): its elements are functions on
  `X`, and the scalar kernel is `K(x, y) = RKHS.kernel H x y 1`. The kernel section at `y` is
  `RKHS.kerFun H y 1`, the function `x ↦ K(x, y)` (Mathlib `RKHS.kerFun_apply`); since `H` is
  real, `K` is symmetric (`RKHS.isHermitian_kernel`), and `⟪h, RKHS.kerFun H x 1⟫ = h(x)`
  (`RKHS.inner_kerFun`). Tau Ceti's universality is stated for `k x = (y ↦ k x y)`; for the
  symmetric `K` the two kinds of section coincide.
- Data and labels follow StatisticalLearningTheory: a sample of size `n` is `S : Fin n → X × Bool`
  under `Measure.pi (fun _ ↦ P)`; labels are read as `y_i = labelSign (S i).2 ∈ {1, −1}`;
  `x_i = (S i).1`. The hinge loss is `hingeLoss u = max(0, 1 + u)`, StatisticalLearningTheory's
  orientation `Φ`, so that `hingeLoss (−(y h(x))) = max(0, 1 − y h(x))`, and the hinge risk is
  `surrogateRisk P hingeLoss h`. Misclassification risks are `classificationError` (an outer
  probability for a non-measurable classifier) and `marginError` (ties counted as errors).
- One normalization throughout: the averaged objective `n⁻¹ Σ max(0, 1 − y_i h(x_i)) + λ‖h‖²`
  with `λ > 0`, and the dual box `[0, C]ⁿ` with `C = (2λn)⁻¹`. Dividing the objective by `2λ`
  gives Mohri–Rostamizadeh–Talwalkar's `‖w‖²/2 + C Σ ξ_i` (their (5.24) and (6.13), pp. 88 and
  116) and Shalev-Shwartz–Ben-David's (15.6), p. 207, with the same `λ`. The only exception is
  1.3, where the weight `C` per point is held fixed when a point is deleted.
- The classifier of a score `h` is `signClassifier h = (x ↦ decide (0 < h x))`, so that a score
  `0` predicts `false`; this is Bartlett–Jordan–McAuliffe's `sign(0) = −1` (p. 7).
- The machine without offset is the only one in Layers 2–4. Uniform stability with an offset is
  open (Bousquet–Elisseeff, p. 516), and an optimal offset need not be unique (1.2).

## Layer 1: the machine and its dual

### 1.1 The machine

- `hingeLoss u = max(0, 1 + u)`.
- `svmObjective H λ S h = n⁻¹ Σ_i max(0, 1 − y_i h(x_i)) + λ‖h‖²` for `h : H` (the average is
  `0` when `n = 0`).
- `svm H λ S`, a minimizer of `svmObjective H λ S` chosen by `Classical.epsilon`.
- `signClassifier h x = decide (0 < h x)`.

Facts used below, each a short consequence of a supplier and not a target here:

- For `λ > 0`, `svmObjective H λ S` has exactly one minimizer, so `svm H λ S` is that minimizer,
  and every `h` satisfies the quadratic growth
  `svmObjective H λ S (svm H λ S) + λ‖h − svm H λ S‖² ≤ svmObjective H λ S h`. Both are
  ConvexAnalysisAndDuality 4.1 `strongConvex_minimizer_spec` with
  `μ = 2λ`, applied to the real-valued objective cast to `EReal`: it is continuous (Mathlib
  `RKHS.continuous_eval_const`), and subtracting `λ‖h‖²` leaves an average of convex functions of
  the evaluations `h(x_i)`.
- `svm H λ S` lies in the span of the sections `K(·, x_i)`
  (MathematicalStatisticsNonparametric 5.8 `mem_span_kerFun_of_isMinOn` with
  `L y u = max(0, 1 − y u)`); 1.2 gives its coefficients.
- `λ‖svm H λ S‖² ≤ svmObjective H λ S 0 = 1` for `n ≥ 1` (and `svm H λ S = 0` for `n = 0`), so
  `|svm H λ S x| ≤ ‖svm H λ S‖ √K(x, x) ≤ r/√λ` when `K(x, x) ≤ r²` with `r ≥ 0` (Mathlib
  `RKHS.norm_apply_le`; Mohri–Rostamizadeh–Talwalkar, Lemma 14.7, p. 341).
- With an offset, the soft-margin objective has minimizers, all with the same function part
  (SupportVectorMachines 3.1,
  `TauCetiRoadmap.SupportVectorMachines.softObjective_minimizers`, for the family `K(·, x_i)`
  of `H`).

**Checks.**

- `hingeLoss (−(labelSign true · 1/2)) = 1/2` and `hingeLoss (−(labelSign false · 1/2)) = 3/2`:
  the orientation `max(0, 1 + u)` turns `Φ(−y h(x))` into the hinge loss of the margin.
- One point `x` with `K(x, x) = 1` (so `H` is the line of multiples of `K(·, x)`), label `true`:
  the objective of `h = c K(·, x)` is `max(0, 1 − c) + λc²`; its minimizer is `c = 1` at
  `λ = 1/8` (value `1/8`) and `c = 1/2` at `λ = 1` (value `3/4`).
- At `λ = 0` the minimizer is not unique: in the previous example every `c ≥ 1` gives `0`.
- For `n = 0`, `svmObjective H λ S h = λ‖h‖²` and `svm H λ S = 0`.
- `signClassifier 0` is constantly `false`; `marginError P 0 = 1` while
  `classificationError P (signClassifier 0) = P(Y = true)`.

### 1.2 The box-constrained dual

Define `kernelDual H S α = Σ_i α_i − (1/2) Σ_{i,j} α_i α_j y_i y_j K(x_i, x_j)` for
`α : Fin n → ℝ`, and write `h_α = Σ_j α_j y_j K(·, x_j)`, `m_i = y_i h_α(x_i)` and
`C = (2λn)⁻¹`. The soft-margin objective with offset is `softObjective`, copied from
SupportVectorMachines 3.1, applied to the family `K(·, x_i)` of `H` and the labels `y_i`; its
value at `(h, b)` is `λ‖h‖² + n⁻¹ Σ max(0, 1 − y_i (h(x_i) + b))`.

- **Without offset** (`isMaxOn_kernelDual_iff`): let `λ > 0`. `kernelDual H S` has a maximizer
  on the box `[0, C]ⁿ`. A point `α` of the box is a maximizer if and only if, for every `i`,
  `m_i ≥ 1` when `α_i = 0`, `m_i ≤ 1` when `α_i = C`, and `m_i = 1` when `0 < α_i < C`. For every
  maximizer, `svm H λ S = h_α` and `svmObjective H λ S (svm H λ S) = 2λ · kernelDual H S α`.
- **With offset** (`isMinOn_softObjective_iff`): let `λ > 0` and
  `F = [0, C]ⁿ ∩ {α : Σ α_i y_i = 0}`. `kernelDual H S` has a maximizer on `F`. For every
  maximizer `α` on `F`, a pair `(h, b)` minimizes the soft-margin objective if and only if
  `h = h_α` and the margins `M_i = y_i (h(x_i) + b)` satisfy `M_i ≤ 1` when `α_i > 0` and
  `M_i ≥ 1` when `α_i < C`; an offset `b` with `(h_α, b)` optimal exists; and the minimum value
  is `2λ · kernelDual H S α`. Consequently the optimal offsets form a closed interval, the
  intersection of the half-lines given by these conditions; it is the single point
  `b = y_i − h_α(x_i)` when some `0 < α_i < C`, and it is unbounded for a sample with one label
  only (then `F = {0}`, `h_α = 0`, and the optimal offsets are the `b` with `y b ≥ 1`).

The dual with offset and the formula for `b` at a free index are Mohri–Rostamizadeh–Talwalkar
(6.13)–(6.15), p. 116, derived from the Karush–Kuhn–Tucker conditions (5.26)–(5.30), p. 90, with
the dual (5.33), p. 91, where the dual is said to be equivalent to the primal; the dual without
offset, in the normalization `C = 1`, is Jaakkola–Haussler, Def. 1, eqs. (1)–(2), p. 2. The
attainment of the dual, the characterization of all its maximizers and the interval of offsets
are proved here.

*Proof route.* (1) *The identity.* For `h : H`, `b ∈ ℝ`, slacks `ξ_i` and `α ∈ ℝⁿ`, with
`P = λ‖h‖² + n⁻¹ Σ ξ_i`, expanding `‖h − h_α‖²` with `⟪h, h_α⟫ = Σ α_i y_i h(x_i)`
(`RKHS.inner_kerFun`) and `‖h_α‖² = Σ α_i α_j y_i y_j K(x_i, x_j)` gives

    P − 2λ D(α) = λ‖h − h_α‖² + 2λ Σ α_i (y_i (h(x_i) + b) − 1 + ξ_i)
                  + Σ (n⁻¹ − 2λ α_i) ξ_i − 2λ b Σ α_i y_i.

Take `ξ_i = max(0, 1 − M_i)` with `M_i = y_i (h(x_i) + b)`. Then the middle terms are
`2λ α_i max(M_i − 1, 0)` and `(n⁻¹ − 2λ α_i) max(0, 1 − M_i)`, both `≥ 0` on the box. So without
offset (`b = 0`) the objective at `h` is at least `2λ D(α)` for every box point `α`, with equality
exactly when `h = h_α`, `α_i > 0 ⇒ m_i ≤ 1` and `α_i < C ⇒ m_i ≥ 1`; with offset the same holds
for `α ∈ F`, since then the last term vanishes. (2) *Without offset.* `D` is a concave quadratic
(its quadratic part is a Gram form, Mathlib `RKHS.posSemidef_kernel`), and its partial derivative
in `α_i` is `1 − m_i`. On the compact box it has a maximizer (`IsCompact.exists_isMaxOn`). A box
point maximizes the concave `D` if and only if the coordinatewise first-order conditions hold:
moving one coordinate inside the box shows they are necessary, and the tangent inequality
`D(β) ≤ D(α) + Σ (1 − m_i)(β_i − α_i)` shows they are sufficient. These conditions are those of
the statement (for `n ≥ 1`, `C > 0`, so the cases `α_i = 0` and `α_i = C` are exclusive). At such
an `α` the identity gives equality for `h = h_α`, so `h_α` minimizes the objective (the lower
bound `2λ D(α)` holds for every `h`), hence `h_α = svm H λ S` by uniqueness (1.1), and the
minimum is `2λ D(α)`. For `n = 0` everything is `0`. (3) *With offset.* `F` is compact and
contains `0`, so a maximizer exists. If both labels occur, `F` has a point with `0 < α_i < C`
for every `i` (take `C n₋/n` on the positive points and `C n₊/n` on the negative ones, where
`n₊` and `n₋` count them), so ConvexAnalysisAndDuality 5.2 `exists_kkt_of_slater` applies to
minimizing `−D` on `EuclideanSpace ℝ (Fin n)` under the inequality constraints `−α_i ≤ 0`,
`α_i − C ≤ 0` and the linear constraint `Σ α_i y_i = 0`. The functions are differentiable, so
the subgradients it returns are gradients (Tau Ceti
`TauCeti.hasGradientAt_toReal_of_mem_subdifferential`), and stationarity reads
`1 − m_i − β y_i = ν_i − μ_i` with multipliers `μ_i, ν_i ≥ 0` of the two bounds, complementary
slackness, and `β` the multiplier of the hyperplane. Put `b = β`: then `1 − M_i = ν_i − μ_i`,
so `α_i > 0 ⇒ μ_i = 0 ⇒ M_i ≤ 1` and `α_i < C ⇒ ν_i = 0 ⇒ M_i ≥ 1`; the offset is the
multiplier of `Σ α_i y_i = 0`. The identity then gives the value `2λ D(α)` at `(h_α, b)`, the
lower bound everywhere, hence the minimum, and, for any other maximizer `α'` (same value), the
characterization of all minimizers through the vanishing of the terms of the identity at `α'`;
an optimal pair `(h_α, b)` turns into `(h_{α'}, b)` with the same offset. If one label only
occurs, `F = {0}` and the objective is `0` exactly at `(0, b)` with `y b ≥ 1`.

*Needs:* ConvexAnalysisAndDuality 4.1 (through 1.1) and 5.2; Tau Ceti
`TauCeti.hasGradientAt_toReal_of_mem_subdifferential`; Mathlib `RKHS.inner_kerFun`,
`RKHS.posSemidef_kernel`, `IsCompact.exists_isMaxOn`.

**Checks.**

- Four points of `ℝ²` with the linear kernel, `(1, 0)` and `(0, 1)` labelled `true`, `(−1, 0)`
  and `(1/2, 1/2)` labelled `false`, `λ = 1/4`, so `C = 1/2`: the maximizer is
  `α = (1/2, 1/2, 1/2, 1/2)`, on the upper face of the box in every coordinate, with
  `h_α = ⟪(3/4, 1/4), ·⟫`, dual value `27/16` and primal value `27/32 = 2λ · 27/16` (computed
  exactly, without and with offset). There is no free index, so the formula
  `b = y_i − h_α(x_i)` does not apply; the optimal offsets form the interval `[−1/4, 1/4]`.
- Two copies of the point `1 ∈ ℝ` with label `true`, linear kernel, `λ = 1/4` (`C = 1`): every
  `α` with `α_1 + α_2 = 1` is a maximizer, while `h_α = K(·, 1)` is the same; dual maximizers need
  not be unique, only the machine is.
- One label only (two points labelled `true`), with offset: `F = {0}`, the minimum `0`, and the
  optimal offsets are all `b ≥ 1`, an unbounded interval.
- The zero kernel: `h_α = 0`, every `m_i = 0 < 1`, so the unique maximizer is `α = (C, …, C)`,
  with dual value `nC = (2λ)⁻¹` and primal value `1`.
- The identity of the route holds exactly for 200 random rational choices of `h`, `b`, slacks
  above the hinge and box points (polynomial kernel on three points).

### 1.3 The leave-one-out inequality

Define `cObjective H C S h = ‖h‖²/2 + C Σ_i max(0, 1 − y_i h(x_i))`, the objective with a fixed
weight `C` per sample point. For `n ≥ 1` and `C = (2λn)⁻¹` it is `Cn · svmObjective H λ S`.

- **Jaakkola–Haussler** (`labelSign_mul_sum_le_loo`): let `S` have `m + 1` points, let `α` be a
  point of the box `[0, C]^(m+1)` maximizing `kernelDual H S` there, and let `h'` minimize
  `cObjective H C` on the sample without its point `t`. Then
  `y_t Σ_{i ≠ t} α_i y_i K(x_t, x_i) ≤ y_t h'(x_t)`.

Consequently the number of points `t` that the machine trained without `t` misclassifies (with
ties as errors, `y_t h'(x_t) ≤ 0`) is at most the number of `t` with
`y_t Σ_{i ≠ t} α_i y_i K(x_t, x_i) ≤ 0`, a count read off one dual maximizer.

Jaakkola–Haussler, Lemma 1, eq. (5), p. 3, state the count bound, and its proof in App. A,
eq. (30), pp. 6–7, gives the inequality, for the machine without offset in the normalization
`C = 1`, with the dual maximizers unique by the assumptions of their Def. 1. The statement here
holds for every maximizer and every `C`, and is proved here.

*Proof route.* Write `J` for `kernelDual H S` and `J₋` for the dual of the reduced sample, a
function of `β` indexed by `i ≠ t`. For `β` in the reduced box and `a ∈ [0, C]`, symmetry of `K`
gives `J(β, a) = J₋(β) + a − a y_t Σ_{i≠t} β_i y_i K(x_t, x_i) − a² K(x_t, x_t)/2`. If `C = 0`
or `m = 0` both sides vanish (`α = 0`; `h'` minimizes `‖h‖²/2`, so `h' = 0`). Otherwise let `β⋆`
maximize `J₋` on the reduced box; by 1.2 without offset, applied to the reduced sample with
`λ' = (2Cm)⁻¹` (whose objective is `cObjective H C` divided by `Cm`),
`h' = Σ_{i≠t} β⋆_i y_i K(·, x_i)`, and the same holds for every maximizer of `J₋`. Maximality of `α`
gives
`J(α₋, α_t) ≥ J(β⋆, α_t)`, and maximality of `β⋆` gives `J₋(β⋆) ≥ J₋(α₋)`; subtracting,
`α_t y_t Σ β⋆_i y_i K(x_t, x_i) ≥ α_t y_t Σ α_i y_i K(x_t, x_i)`. If `α_t > 0`, divide. If
`α_t = 0`, then `J(β, 0) = J₋(β)` shows that `α₋` maximizes `J₋`, so
`h' = Σ_{i≠t} α_i y_i K(·, x_i)` and equality holds.

*Needs:* 1.2; Mathlib `RKHS.isHermitian_kernel`.

**Checks.**

- Points `1, 2, −1 ∈ ℝ` labelled `true, true, false`, linear kernel: for `C ∈ {1/4, 1, 3}` the
  inequality holds at every `t` and the leave-one-out count is at most the count of the bound
  (exact computation; the reduced machines checked against a grid of coefficients).
- The weight per point must be kept fixed. Deleting `−1` from the sample above at `λ = 1/4`
  (`C = 2/3`): the reduced machine with `C = 2/3` is `(2/3) K(·, 1)`, while the averaged objective
  with `λ = 1/4` on the two remaining points (weight `1` per point) gives `K(·, 1)`.
- Non-unique maximizers: two copies of `1 ∈ ℝ` labelled `true`, `C = 1`; for each of the
  maximizers `(1, 0)`, `(1/2, 1/2)`, `(0, 1)` the inequality holds at both `t`.
- `m = 0`: the reduced sample is empty, `h' = 0`, and both sides are `0`.

### Examples

- The four computations of the Checks of 1.2 and 1.3, together with a polynomial kernel
  `(1 + xy)²` on `−1, 0, 1` labelled `true, false, true` (separable only after the feature map):
  strong duality `P = 2λD` holds exactly at `λ ∈ {1, 1/4, 1/16}`, without and with offset, and no
  point of a grid of coefficients and offsets beats the dual value.

### Dependencies

ConvexAnalysisAndDuality 4.1 and 5.2; MathematicalStatisticsNonparametric 5.8 (for the facts of
1.1); SupportVectorMachines 3.1 (the objective `softObjective`); Tau Ceti
`TauCeti.hasGradientAt_toReal_of_mem_subdifferential`; Mathlib `RKHS`.

## Layer 2: continuity, measurability and the oracle inequality

### 2.1 Continuity and measurability of the machine

- **Hölder continuity** (`mul_sqrt_mul_norm_svm_sub_sq_le`): for `λ > 0` and samples `S`, `S'` of
  size `n` with the same labels,
  `λ^(3/2) ‖svm H λ S − svm H λ S'‖² ≤ n⁻¹ Σ_i ‖K(·, x_i) − K(·, x'_i)‖`, where
  `‖K(·, x) − K(·, x')‖² = K(x, x) − 2K(x, x') + K(x', x')` (Mathlib
  `RKHS.norm_kerFun_sub_kerFun_sq`).
- **Measurability** (`measurable_svm_apply`): if `X` is a second-countable topological space with
  its Borel σ-algebra, `(x, y) ↦ K(x, y)` is continuous and `λ > 0`, then
  `(S, x) ↦ svm H λ S x` is measurable on `(X × Bool)ⁿ × X`. In particular the loss
  `L S z = max(0, 1 − labelSign z.2 · svm H λ S z.1)` satisfies the hypothesis
  `Measurable (Function.uncurry L)` of StatisticalLearningTheory 4.2 `stable_generalization`.

No source opened states either fact. Steinwart works with outer probabilities to avoid the
question of measurability (*On the influence of the kernel*, Thm 12 and the remark after it,
pp. 77–78). Proved here.

*Consequence, not a separate target.* With the measurability above, the bound `|h_S(x)| ≤ r/√λ`
of 1.1 for `r ≥ 0` (`M = 1 + r/√λ`) and `β = r²/(nλ)` from StatisticalLearningTheory 4.2
`uniformStability_rkhs_regularized` (convex `1`-Lipschitz loss), `stable_generalization` gives,
for `n ≥ 1` and `δ ∈ (0, 1)`, with probability at least `1 − δ`, that the hinge risk of the machine
is at most its empirical hinge risk plus `r²/(nλ) + (2r²/λ + 1 + r/√λ) √(log(1/δ)/(2n))`. This is
Mohri–Rostamizadeh–Talwalkar, Cor 14.8, pp. 341–342, and the example of support vector machines
in StatisticalLearningTheory Layer 4; 2.1 supplies the measurability it needs.

*Proof route.* Hölder continuity: write `F = svmObjective H λ S`, `F' = svmObjective H λ S'`,
`h = svm H λ S`, `h' = svm H λ S'`. The quadratic growth of 1.1 for `F` at `h'` and for `F'` at
`h`, added, gives `2λ‖h − h'‖² ≤ G(h') − G(h)` with `G = F − F'`, since the `λ‖·‖²` terms cancel.
As the labels agree and the hinge is `1`-Lipschitz,
`|G(g)| ≤ n⁻¹ Σ |g(x_i) − g(x'_i)| = n⁻¹ Σ |⟪g, K(·, x_i) − K(·, x'_i)⟫|`, which is at most
`‖g‖ n⁻¹ Σ ‖K(·, x_i) − K(·, x'_i)‖`. With `‖h‖, ‖h'‖ ≤ λ^(−1/2)` (1.1) this is the claim; for
`n = 0` both sides are
`0`. Measurability: `x ↦ K(·, x)` is continuous into `H` (Mathlib
`RKHS.continuous_kernel_iff_continuous_kerFun`). For a fixed label vector `ℓ ∈ Boolⁿ`, the
Hölder bound shows that `(x_1, …, x_n) ↦ svm H λ ((x_i, ℓ_i))_i` is continuous into `H`, so
`((x_i)_i, x) ↦ ⟪svm H λ ((x_i, ℓ_i))_i, K(·, x)⟫` is continuous on `Xⁿ × X`, hence measurable,
because the Borel σ-algebra of `Xⁿ × X` is the product σ-algebra for second-countable `X`
(Mathlib `Pi.borelSpace`, `Prod.borelSpace`). The map of the statement is this family of maps
composed with the measurable map `(S, x) ↦ (labels of S, (points of S, x))`, and a function on a
product with the countable discrete factor `Boolⁿ` that is measurable in the other variable for
each value of that factor is measurable (Mathlib `measurable_from_prod_countable_right`).

*Needs:* 1.1; Mathlib `RKHS.norm_kerFun_sub_kerFun_sq`, `RKHS.inner_kerFun`,
`RKHS.continuous_kernel_iff_continuous_kerFun`, `Pi.borelSpace`, `Prod.borelSpace`,
`measurable_from_prod_countable_right`.

**Checks.**

- Linear kernel on `ℝ` (`H` the functions `x ↦ w x`, `‖K(·, x) − K(·, x')‖ = |x − x'|`),
  `λ = 1/4`, so `λ^(3/2) = 1/8`: for `S = ((3, true))` and `S' = ((−3, true))` the machines are
  `w = 1/3` and `w = −1/3`, and `1/8 · (2/3)² = 1/18 ≤ 6`; for `S = ((1, true), (−1, false))` and
  `S' = ((2, true), (−1, false))` both machines are `w = 1`, and `0 ≤ 1/2`; at `λ ∈ {1/16, 1}`
  four pairs of samples satisfy the bound as well (exact).
- The labels must agree: `S = ((1, true))` and `S' = ((1, false))` have kernel distance `0`, but
  the machines are `w = 1` and `w = −1`.

### 2.2 The oracle inequality in expectation

- **Oracle inequality** (`lintegral_surrogateRisk_svm_le`): let `X` be second countable with its
  Borel σ-algebra, `K` continuous with `K(x, x) ≤ r²`, `P` a probability law on `X × Bool`,
  `λ > 0` and `n ≥ 1`. Then for every `h : H`,
  `∫⁻ R_hinge(svm H λ S) dPⁿ(S) ≤ R_hinge(h) + λ‖h‖² + r²/(λn)`, and the same bound holds for the
  expected misclassification risk `∫⁻ classificationError P (signClassifier (svm H λ S)) dPⁿ(S)`.

Shalev-Shwartz–Ben-David, Cor 13.8, p. 179, and Cor 15.7, p. 208, state this with the constant
`2ρ²/(λm)` for `‖x‖ ≤ ρ`, from the replace-one identity Thm 13.2, p. 174. The constant here,
`r²/(λn)`, is half of theirs: it is the stability constant of StatisticalLearningTheory 4.2,
which uses the strong convexity of both objectives (Mohri–Rostamizadeh–Talwalkar, Prop 14.4,
p. 338). The measurability needed to take the expectations is 2.1.

*Proof route.* Write `A S = svm H λ S` and `ℓ(g, z) = max(0, 1 − labelSign z.2 · g(z.1))`, so
that `R_hinge(g) = ∫ ℓ(g, z) dP(z)`. (1) *Replace-one identity*, the item *Average stability*
of StatisticalLearningTheory 4.2, with its proof: for each `i`, the map
`(S, z') ↦ (Function.update S i z', S i)` carries `Pⁿ ⊗ P` to itself (it exchanges the `i`-th
coordinate with an independent copy; Mathlib `measurePreserving_piCongrLeft` and Fubini), so
`E R(A S) = E ℓ(A (Function.update S i z'), S i)`. The integrands are measurable by 2.1 and
bounded by `1 + |r|/√λ` (1.1, applied with `|r|`). (2) *Stability*: StatisticalLearningTheory 4.2
`uniformStability_rkhs_regularized` with `Y = Bool`, `c y u = max(0, 1 − labelSign y · u)`
(convex and `1`-Lipschitz), `G = 1` and `A = svm H λ` (its hypothesis `hA` is the minimality of
1.1; the objective has exactly the shape `(Σ c (S i).2 (h (S i).1)) / n + λ‖h‖²`) bounds
`|ℓ(A (Function.update S i z'), S i) − ℓ(A S, S i)|` by `r²/(nλ)`. Averaging over `i`,
`E R(A S) ≤ E R̂(A S) + r²/(nλ)`, `R̂` the empirical hinge risk. (3) *Minimality*:
`R̂(A S) ≤ R̂(A S) + λ‖A S‖² ≤ R̂(h) + λ‖h‖²`. (4) `E R̂(h) = R(h)`, as each coordinate of `S` has
law `P` and `h` is continuous (Mathlib `RKHS.continuous_of_continuous_kernel`). (5) The
misclassification clause: `1{signClassifier g x ≠ y} ≤ ℓ(g, (x, y))` for every `g` (a wrong sign
means a margin `≤ 0`), so `classificationError P (signClassifier (A S)) ≤ R(A S)`, and
`S ↦ classificationError P (signClassifier (A S))` is measurable by 2.1 and Mathlib
`measurable_measure_prodMk_left`.

*Needs:* 1.1, 2.1; StatisticalLearningTheory 4.2; Mathlib `measurePreserving_piCongrLeft`,
`RKHS.continuous_of_continuous_kernel`, `measurable_measure_prodMk_left`.

**Checks.**

- Linear kernel on `ℝ` and the law with atoms `(1, true)`, `(−1, false)`, `(1/2, false)`,
  `(−1/2, true)` of masses `1/2, 1/4, 1/8, 1/8` (`r = 1`): the exact expectation over all samples
  of size `n ∈ {1, 2, 3}` of the hinge risk of the machine is `39/64` for each `n` at `λ = 1/2`
  and `27/32`, `63/128`, `63/128` at `λ = 1/8`, below the exact right sides at the best `h`,
  `359/128`, `231/128`, `565/384` and `17/2`, `9/2`, `19/6`; the expected misclassification risks,
  `3/8`, `9/32`, `159/512` at both values of `λ`, are below them too.
- `n ≥ 1` is needed: for `n = 0` the machine is `0`, of hinge risk `1`, while for `X` one point
  with `K = 1`, label `true` almost surely and `h = K(·, x)/2`, the right side is
  `1/2 + λ/4 < 1` at `λ = 1/16`.
- `r = 0`: the kernel vanishes, so `H = {0}`, every hinge risk is `1`, and the bound reads
  `1 ≤ 1`.

### Examples

- The ideal choice `λ = r/(B√n)` for a comparison function of norm at most `B` turns 2.2 into
  `E R_hinge(svm H λ S) ≤ R_hinge(h) + 2rB/√n` for every `h` with `‖h‖ ≤ B`, the form of the last
  display of Shalev-Shwartz–Ben-David, Cor 15.7.

### Dependencies

Layer 1; StatisticalLearningTheory 1.4 (definitions) and 4.2; Mathlib `RKHS`, measure theory.

## Layer 3: calibration, approximation and consistency

### 3.1 The hinge risk and the sign classifier

Let `P` be a probability law on `X × Bool` and `η` a regression function of `P`
(`IsRegressionFunction P η`, StatisticalLearningTheory 1.2), and write
`R* = classificationError P (bayesClassifier η)`.

- **The least hinge risk and the comparison without ties** (`hinge_calibration`): the infimum of
  `surrogateRisk P hingeLoss g` over measurable `g : X → ℝ` is `2R*`, attained at
  `g = labelSign ∘ bayesClassifier η`; and every measurable `h : X → ℝ` satisfies
  `classificationError P (signClassifier h) − R* ≤ surrogateRisk P hingeLoss h − 2R*`, with no
  hypothesis on the set where `h` vanishes.

Bartlett–Jordan–McAuliffe, Thm 3(1), p. 12, with the hinge loss of Example 4, pp. 19–20
(`H(η) = 2 min(η, 1 − η)`, `ψ(θ) = |θ|`), and their convention `sign(0) = −1`, p. 7. The
comparison of StatisticalLearningTheory 1.4
(`TauCetiRoadmap.StatisticalLearningTheory.marginError_sub_le_surrogateRisk_sub`) is Zhang's
inequality for general calibrated losses, and 1.4 records the hinge loss as the case `s = 1`,
`c = 1/2`. It is stated for `marginError`, which counts ties as errors, under the hypothesis
`P(h(X) = 0) = 0`, which 1.4 shows cannot be dropped there, and with the infimum of the surrogate
risk over measurable scores. 3.1, for the hinge loss only, computes that infimum and states the
comparison for the sign classifier with no hypothesis on ties. The comparison can also be reached
from 1.4, by applying it to `h` shifted to `−ε` on `{h = 0}` (which has the same sign classifier
and hinge risk at most `ε` larger) and letting `ε → 0`, once the infimum is known; the route below
is direct.

*Proof route.* (1) *Conditional decomposition.* The set function `A ↦ P(A × {true})` is the
measure `ofReal ∘ η` times the marginal `P_X = P.map Prod.fst` (equal on measurable sets by the
definition of `IsRegressionFunction`, both finite), and `A ↦ P(A × {false})` is `1 − η` times
`P_X`. Splitting the integral over the two labels gives
`surrogateRisk P hingeLoss h = ∫⁻ ofReal(C(η(x), h(x))) dP_X`, with
`C(η, u) = η max(0, 1 − u) + (1 − η) max(0, 1 + u)`, the `condSurrogateRisk` of
StatisticalLearningTheory 1.4 for the hinge loss. (2) *Pointwise.* For `η ∈ [0, 1]`,
`C(η, u) ≥ 2 min(η, 1 − η)`, with equality at `u = labelSign (decide (1/2 ≤ η))`: on `[−1, 1]`,
`C(η, u) = 1 + u(1 − 2η)`, and outside it `C` is larger. And
`|2η − 1| · 1{decide (0 < u) ≠ decide (1/2 ≤ η)} ≤ C(η, u) − 2 min(η, 1 − η)`: if `u > 0` and
`η < 1/2` then `C(η, u) ≥ C(η, 0) = 1`, and if `u ≤ 0` and `η ≥ 1/2` the same holds. (3)
StatisticalLearningTheory 1.2
`TauCetiRoadmap.StatisticalLearningTheory.classificationError_bayesClassifier` gives
`R* = ∫ min(η, 1 − η) dP_X`, so integrating (2) gives the infimum and its attainment. With the
third clause of that theorem, for the measurable classifier `g = signClassifier h`,
`classificationError P g − R* = ∫ |2η − 1| 1{g ≠ bayesClassifier η} dP_X`, which by (2) is at
most `∫⁻ ofReal(C(η, h)) − ∫⁻ ofReal(2 min(η, 1 − η))` (Mathlib `MeasureTheory.lintegral_sub`,
the subtracted integral being finite).

*Needs:* StatisticalLearningTheory 1.2 (the excess-risk identity) and 1.4
(definitions); Mathlib `MeasureTheory.Measure.withDensity`, `MeasureTheory.lintegral_sub`,
`MeasureTheory.ofReal_integral_eq_lintegral_ofReal`.

**Checks.**

- For `η ∈ {0, 1/8, …, 1}` and `u ∈ {−3, −11/4, …, 3}`: the least value of `C(η, ·)` on the grid
  is `2 min(η, 1 − η)`, attained at `u = labelSign (decide (1/2 ≤ η))`, and the pointwise
  inequality of (2) holds, including `u = 0` (exact).
- It is sharp: at `η = 3/4` and `u = 0` both sides of (2) are `1/2`.
- Negative control: for `η ≡ 1/2` and `h ≡ 0`, `marginError P h − R* = 1/2` while the excess
  hinge risk is `0`, so the comparison fails for `marginError`; for `signClassifier h` the excess
  is `0 ≤ 0`.

### 3.2 Universal kernels: approximation and consistency

Let `X` be a compact metric space with its Borel σ-algebra, `K` continuous and universal
(`TauCeti.IsUniversalKernel (fun x y ↦ K(x, y))`, Tau Ceti: the continuous sections span a dense
subspace of `C(X, ℝ)`), `P` a probability law on `X × Bool` with regression function `η`, and
`R*` as in 3.1.

- **Approximation** (`iInf_surrogateRisk_eq_of_isUniversalKernel`): the infimum of
  `surrogateRisk P hingeLoss h` over `h : H` is `2R*`.
- **Universal consistency** (`tendsto_lintegral_classificationError_svm`): if `λ_n → 0` and
  `nλ_n → ∞` (which force `λ_n > 0` for large `n`, the only `n` that matter), then
  `∫⁻ classificationError P (signClassifier (svm H λ_n S)) dPⁿ(S) → R*`. Since the excess risk is
  nonnegative and measurable in `S` (2.1), the misclassification risk of the machine also tends to
  `R*` in probability.

Steinwart, Def 4, p. 72, defines universal kernels; his results for this machine with an offset
(Thm 22 and Cor 23, p. 89) assume a bound on covering numbers and give consistency, in outer
probability, for laws whose noise level is constant. The statement here holds for every law; it is
proved here, by the oracle inequality of 2.2 and the comparison of 3.1.

*Proof route.* Approximation, `≥`: every `h : H` is continuous (Mathlib
`RKHS.continuous_of_continuous_kernel`), hence measurable, so 3.1 applies. Approximation, `≤`:
fix `ε > 0` and `g⋆ = labelSign ∘ bayesClassifier η`, bounded and measurable, of hinge risk `2R*`
(3.1). A compact metric space is normal, and a finite Borel measure on it is weakly regular
(Mathlib `MeasureTheory.Measure.WeaklyRegular.of_pseudoMetrizableSpace_of_isFiniteMeasure`), so
there is a bounded continuous `f` with `∫ |g⋆ − f| dP_X ≤ ε`
(`MeasureTheory.Integrable.exists_boundedContinuous_integral_sub_le`). By universality there is
`s` in the span of the continuous sections with `‖f − s‖_∞ ≤ ε`. Each section `y ↦ K(x, y)` is,
by symmetry, the function of `RKHS.kerFun H x 1`, so `s` is the function of some
`h = Σ c_j K(·, x_j)` in `H`. As the hinge is `1`-Lipschitz,
`|R_hinge(u) − R_hinge(v)| ≤ ∫ |u − v| dP_X`, so `R_hinge(h) ≤ 2R* + 2ε`. Consistency: by 3.1,
for each sample `classificationError P (signClassifier (A S)) − R* ≤ R_hinge(A S) − 2R*`; by
2.2, for every `h : H` and `n ≥ 1`,

    E classificationError P (signClassifier (svm H λ S)) − R* ≤ R_hinge(h) + λ‖h‖² − 2R* + r²/(λn),

with `r² = max_x K(x, x)`, finite as `K` is continuous on the compact `X`. Given `ε > 0`, choose
`h` with `R_hinge(h) ≤ 2R* + ε` by the approximation; then `λ_n > 0`, `λ_n‖h‖² ≤ ε` and
`r²/(λ_n n) ≤ ε` for large `n`. The left side is nonnegative by the optimality of the Bayes
classifier (StatisticalLearningTheory 1.2, second clause).

*Needs:* 2.2, 3.1; StatisticalLearningTheory 1.2; Tau Ceti `TauCeti.IsUniversalKernel`;
Mathlib `RKHS.continuous_of_continuous_kernel`, `RKHS.kerFun_apply`, `RKHS.isHermitian_kernel`,
`MeasureTheory.Integrable.exists_boundedContinuous_integral_sub_le`,
`MeasureTheory.Measure.WeaklyRegular.of_pseudoMetrizableSpace_of_isFiniteMeasure`.

**Checks.**

- Universality is needed: on two points `a`, `b` with the constant kernel `1` (positive
  semidefinite, not universal; Tau Ceti's documentation of `TauCeti.IsUniversalKernel`), `H` is
  the constants; with `P_X` uniform and `η(a) = 0`, `η(b) = 1`, the hinge risk of the constant `c`
  is `(max(0, 1 + c) + max(0, 1 − c))/2 ≥ 1`, while `2R* = 0`.
- On the same two points with the identity kernel (positive definite, hence universal by Tau Ceti
  `Matrix.PosDef.isUniversalKernel`), `H` is all functions and `h = (−1, 1)` has hinge risk `0`.

### 3.3 The Gaussian kernel is universal

- **Gaussian universality** (`isUniversalKernel_gaussianKernel`): for `d ≥ 0`, `σ ≠ 0` and a
  compact set `K ⊆ ℝ^d`, the restriction to `K` of `gaussianKernel σ` (KernelsAndSpectralMethods
  8.2, `exp(−‖x − y‖²/(2σ²))`) is universal.

The kernel depends on `σ` only through `σ²`, so the statement is made for `σ ≠ 0`; at `σ = 0`
the formula gives the constant kernel `1`. Steinwart, Example 1, p. 76, states it for
`exp(−σ²‖x − y‖²)`, which is the same family, and derives it from his Cor 10 and Prop 8, p. 74;
the route below is a different, complete argument from the Stone–Weierstrass theorem. By
KernelsAndSpectralMethods 8.2 `posSemidef_gaussianKernel` the kernel is positive semidefinite
(for `σ > 0`, hence for every `σ ≠ 0`), so its restriction to `K` has a reproducing-kernel
Hilbert space (Mathlib `RKHS.OfKernel`) with a continuous kernel, and 3.2 applies: Gaussian
support vector machines are universally consistent on compact subsets of `ℝ^d`.

*Proof route.* Write `s = σ² > 0` and `g(x) = exp(−‖x‖²/(2s))`. (1) *Features.* Index by
`ι = Σ k : ℕ, (Fin k → Fin d)` and set
`φ_(k,w)(x) = g(x) (s^k k!)^(−1/2) Π_(j<k) x_(w j)`. Since
`Σ_(w : Fin k → Fin d) Π_j x_(w j) y_(w j) = ⟪x, y⟫^k` (Mathlib `Finset.prod_univ_sum`) and
`exp(t) = Σ t^k/k!` (Mathlib `NormedSpace.exp_eq_tsum`, `Real.exp_eq_exp_ℝ`),
`Σ_ι φ_ι(x) φ_ι(y) = g(x) g(y) exp(⟪x, y⟫/s) = exp(−‖x − y‖²/(2s))`, the sum of nonnegative terms
at `x = y` being `1`. So `Φ(x) = (φ_ι(x))_ι` lies in `ℓ²(ι)` with norm `1` and
`⟪Φ(x), Φ(y)⟫ = gaussianKernel σ x y`. (2) *Each feature is a uniform limit of combinations of
sections.* Let `V` be the closure of the span of `Φ(K)` in `ℓ²(ι)` and `p` the orthogonal
projection of the basis vector `e_ι` onto `V` (Mathlib `Submodule.starProjection`). For `y ∈ K`,
`Φ(y) ∈ V`, so `φ_ι(y) = ⟪e_ι, Φ(y)⟫ = ⟪p, Φ(y)⟫`. Choose `v_m = Σ_x c_x Φ(x)` (finite sums,
`x ∈ K`) with `v_m → p`; then `y ↦ ⟪v_m, Φ(y)⟫ = Σ_x c_x gaussianKernel σ x y` is a combination of
sections, and `sup_(y ∈ K) |⟪v_m − p, Φ(y)⟫| ≤ ‖v_m − p‖ → 0`. So `φ_ι` restricted to `K` lies in
the closure `W` of the span of the sections in `C(K, ℝ)`. (3) *Stone–Weierstrass.* Multiplication
by `g` is a linear homeomorphism of `C(K, ℝ)` (its inverse is multiplication by `1/g`), so
`W' = {f : g f ∈ W}` is a closed subspace; by (2) it contains every monomial
`Π_(j<k) x_(w j)`, including the constant `1`. The subalgebra generated by the coordinate
functions is the span of the monomials (Mathlib `Algebra.adjoin_eq_span`) and separates the
points of `K`; `K` is compact (`isCompact_iff_compactSpace`), so its closure is `C(K, ℝ)`
(Mathlib `ContinuousMap.subalgebra_topologicalClosure_eq_top_of_separatesPoints`). Hence
`W' = C(K, ℝ)` and `W = g · W' = C(K, ℝ)`.

*Needs:* KernelsAndSpectralMethods 8.2 (the definition; `posSemidef_gaussianKernel` for the
consequence); Tau Ceti `TauCeti.IsUniversalKernel`; Mathlib `lp`, `Submodule.starProjection`,
`Algebra.adjoin_eq_span`, `ContinuousMap.subalgebra_topologicalClosure_eq_top_of_separatesPoints`,
`Finset.prod_univ_sum`, `NormedSpace.exp_eq_tsum`.

**Checks.**

- `σ ≠ 0` is needed: at `σ = 0`, `−‖x − y‖²/(2 · 0) = 0` in Lean's division, the kernel is the
  constant `1`, and on a set of two points its sections span only the constants.
- `d = 0`: `ℝ⁰` is one point, the kernel is `exp 0 = 1` there, and its section spans `C(K, ℝ)`
  for `K` the point (and trivially for `K = ∅`).
- On two points at distance `t > 0` the Gram matrix `[[1, q], [q, 1]]` with
  `q = exp(−t²/(2σ²)) < 1` has determinant `1 − q² > 0`, so the sections are independent, as
  universality on a finite set requires.
- `gaussianKernel σ` and `gaussianKernel (−σ)` are the same function.

### Examples

- On a finite set `X` with the discrete topology, every positive-definite kernel is universal
  (Tau Ceti `Matrix.PosDef.isUniversalKernel`); 3.2 then says that the machine is consistent
  for every law on `X × Bool`. The Gaussian kernel on finitely many distinct points of `ℝ^d` is
  of this kind, by 3.3 or directly.

### Dependencies

Layers 1–2; StatisticalLearningTheory 1.2 and 1.4; KernelsAndSpectralMethods 8.2; Tau Ceti
`TauCeti.IsUniversalKernel`; Mathlib `RKHS`, measure theory and the Stone–Weierstrass theorem.

## Layer 4: margins uniform in the margin

### 4.1 The margin bound for every margin

Let `X` be second countable with its Borel σ-algebra, `K` continuous with `K(x, x) ≤ r²` and
`r ≥ 0`, `P` a probability law on `X × Bool`, `n ≥ 1` and `δ > 0`. For a sample `S` write
`a_S(i) = y_i K(·, x_i)`, so that `margin a_S h = min_i y_i h(x_i)` (`margin` of
ThresholdFunctionsAndMargins 4.1).

- **Uniform margin bound** (`marginError_le_uniform`): with probability at least `1 − δ` over
  `S`, every `h` with `‖h‖ ≤ 1` and every `ρ ∈ (0, r]` satisfy
  `marginError P h ≤ empiricalMarginLoss ρ h S + B(ρ)`, where
  `B(ρ) = 4r/(ρ√n) + √(log(log₂(2r/ρ))/n) + √(log(2/δ)/(2n))`; and with probability at least
  `1 − δ`, every `h` with `‖h‖ ≤ 1` and `γ = margin a_S h > 0` satisfies
  `marginError P h ≤ B(γ)`.

By ThresholdFunctionsAndMargins 4.1 `isGreatest_margin`, the largest margin over the unit ball is
`γ_S = Metric.infDist 0 (convexHull ℝ (range a_S))`, attained, when positive, only at the unit
vector `w_S` along the nearest point of that hull: the maximum-margin kernel classifier without
offset. The second clause applies to it with `γ = γ_S`, a margin chosen from the sample; this is
the purpose of the uniformity in `ρ`. The class with offsets `b ∈ ℝ` is unbounded, so the bound
says nothing about the hard-margin classifier with offset of SupportVectorMachines.

Mohri–Rostamizadeh–Talwalkar, Thm 5.9, (5.41), p. 96 (proof by stratification over
`ρ_k = r/2^k`), with the complexity of the kernel ball, Thm 6.12, p. 118, as in their remark after
Cor 5.11, p. 97.

*Proof route.* For `r = 0` or `δ ≥ 1` there is nothing to prove (the events are empty, or the
probability is at most `1 ≤ δ`). Otherwise apply StatisticalLearningTheory 4.1
`TauCetiRoadmap.StatisticalLearningTheory.marginError_le_empiricalMarginLoss` (first clause) to
the class `T = Metric.closedBall (0 : H) 1`,
`f t = t`, for each `k ≥ 1` with `ρ_k = r/2^k` and `δ_k = δ/(2k²)`. Its hypotheses hold: each
`t` is continuous (`RKHS.continuous_of_continuous_kernel`), hence measurable; `|t(x)| ≤ r`
(`RKHS.norm_apply_le`); the class is pointwise separable (MathematicalStatisticsAsymptotic 3.2,
`IsPointwiseSeparable`), because `H` is separable (the sections at a countable dense set of points
of `X` span a dense subspace, by continuity of `x ↦ K(·, x)` and Mathlib `RKHS.kerFun_dense`), the
ball has a countable dense subset, and norm convergence gives pointwise convergence
(`RKHS.continuous_eval_const`). The expected Rademacher term is at most `(2/ρ_k)(r/√n)` by
StatisticalLearningTheory 2.2 `empiricalRademacherComplexity_closedBall_le` (second clause,
`B = 1`), because a bound that holds for every sample bounds the integral (a non-integrable
integrand has integral `0 ≤ r/√n`). The union of the bad events has outer probability at most
`Σ_k δ/(2k²) = δπ²/12 ≤ δ` (`MeasureTheory.measure_iUnion_le`). Outside it, for `ρ ∈ (0, r]` take
`k ≥ 1` with `ρ_k < ρ ≤ ρ_(k−1)`: then `rampLoss ρ_k ≤ rampLoss ρ`, `2r/(ρ_k √n) ≤ 4r/(ρ√n)`,
`k ≤ log₂(2r/ρ)`, and `√(log(2k²/δ)/(2n)) ≤ √(log(2/δ)/(2n)) + √(log k/n)`; so the first clause
holds. For the second, `margin a_S h = γ > 0` gives `y_i h(x_i) ≥ γ`, so
`empiricalMarginLoss γ h S = 0`, and `γ ≤ y_1 h(x_1) ≤ r`; the first clause at `ρ = γ` gives it.

*Needs:* StatisticalLearningTheory 2.2 and 4.1; MathematicalStatisticsAsymptotic 3.2;
ThresholdFunctionsAndMargins 4.1 (the definition `margin`, and `isGreatest_margin` for the
maximum-margin classifier); Mathlib `RKHS.norm_apply_le`, `RKHS.kerFun_dense`,
`RKHS.continuous_eval_const`, `RKHS.continuous_of_continuous_kernel`,
`MeasureTheory.measure_iUnion_le`.

**Checks.**

- At `ρ = r`, `log₂(2r/ρ) = 1` and `log 1 = 0`: no junk value of the logarithm occurs on
  `(0, r]`, where `log₂(2r/ρ) ≥ 1`.
- `r ≥ 0` is needed for the second clause: with `X` one point, `K = 1`, `H` the constants,
  `r = −1` (so `K(x, x) ≤ r²`), `n = 1`, `δ = 1/2`, `P` the point with label `true` and `h = 1`,
  the margin is `1`, `log₂|−2| = 1`, and the bound fails on every sample, since
  `−4 + 0 + √(log 4/2) < 0 = marginError P h`.
- `n ≥ 1` is needed: for `n = 0` every term of the bound is `0` in Lean's division, and
  `marginError P 0 = 1`, so the event of the first clause (with `r > 0`) has probability
  `1 > δ` for `δ < 1`.
- `X = [−1, 1]` with the linear kernel, `r = 1`, and the sample of the two points `1` and `−1`
  labelled `true` and `false`: `a_S(1)` and `a_S(2)` are both the identity function, `γ_S = 1`
  and `w_S(x) = x`, so outside the exceptional event of the second clause (probability at most
  `δ` over samples of size `2`) this sample gives `marginError P w_S ≤ 4/√2 + √(log(2/δ)/4)`.

### Examples

- For a sample separated with kernel margin `γ_S` by the unit-norm `w_S`, the bound is of order
  `r/(γ_S √n)` up to the `√(log log)` term, whatever the dimension of `H`.

### Dependencies

StatisticalLearningTheory 2.2 and 4.1; MathematicalStatisticsAsymptotic 3.2;
ThresholdFunctionsAndMargins 4.1; Mathlib `RKHS`.

## Scope and ownership

This roadmap is built on seven others and restates none of their theorems. The soft-margin
support vector machine appears in StatisticalLearningTheory, by another contributor, as an
example of uniform stability (the *Examples* of its Layer 4: the hinge loss gives stability
`r²/(nλ)` through 4.2, and 1.4 converts the surrogate risk into misclassification risk). This
roadmap starts from that example and develops it into separate statements for this machine: its
measurability, which is the hypothesis of `stable_generalization` (2.1), the oracle inequality in
expectation (2.2), the comparison of hinge and misclassification risks for the sign classifier
with no hypothesis on ties (3.1) and universal consistency (3.2, with the Gaussian kernel in
3.3); and it adds the box-constrained dual (1.2), the leave-one-out inequality (1.3) and the
margin bound uniform in the margin (4.1).
From StatisticalLearningTheory it uses the Bayes classifier and its excess-risk identity (1.2),
the surrogate and misclassification risks (1.4), the Rademacher complexity of kernel balls (2.2),
the margin bound (4.1), and uniform stability with the stability of regularized kernel methods
(4.2); its definitions are copied verbatim, and its item *Average stability* is used with its
proof written out in 2.2. From ConvexAnalysisAndDuality, by the same contributor, it uses the
minimizers of strongly convex functions (4.1) and the Karush–Kuhn–Tucker theorem (5.2). From
KernelsAndSpectralMethods, by the same contributor, it uses the Gaussian kernel and its positive
semidefiniteness (8.2); the characteristic property of 8.2 is a different property and is not
used. From MathematicalStatisticsNonparametric it uses the representer theorem (5.8), and from
MathematicalStatisticsAsymptotic pointwise separability (3.2). From SupportVectorMachines it uses
the soft-margin objective with offset (3.1); that roadmap treats the geometry of the hard and
soft margin in an arbitrary inner product space and leaves out the box-constrained dual, which
1.2 supplies for kernel samples. From ThresholdFunctionsAndMargins it uses the maximum margin
(4.1).

The other boundaries, item by item:

- the existence and uniqueness of the machine and its representer form are the facts of 1.1,
  consequences of ConvexAnalysisAndDuality 4.1, MathematicalStatisticsNonparametric 5.8 and
  SupportVectorMachines 3.1, and are not restated; the high-probability bound for the machine
  follows from StatisticalLearningTheory 4.2 as in its example, with the measurability of 2.1,
  and is recorded in 2.1 as a consequence, not a target;
- the margin bound at a fixed margin and its kernel form, the comparison inequality of Zhang and
  the uniform-stability theorems are StatisticalLearningTheory 4.1, 1.4 and 4.2;
- the hard margin, support vectors, the hard-margin dual, the hard-margin leave-one-out bound and
  the exactness of the soft margin for small `λ` (which, for the family `K(·, x_i)`, is the
  kernel case) are SupportVectorMachines 1–4;
- universal kernels on finite discrete spaces and kernel mean embeddings are Tau Ceti's;
  characteristic kernels and random Fourier features are KernelsAndSpectralMethods 8 and 11;
- OptimalTransport 13.4 asks for the properties of the Sinkhorn divergence under the hypothesis
  that the Gibbs kernel `exp(−C/ε)` is universal, with Euclidean specializations for the costs
  `‖x − y‖` and `‖x − y‖²` on bounded sets; it names no universality theorem for a particular
  kernel as a target. For `C(x, y) = ‖x − y‖²` and `ε = 2σ²` the Gibbs kernel is the Gaussian
  kernel, so 3.3 supplies that hypothesis on compact sets for the squared-distance case.

Not treated here: the offset in the stability chain (Bousquet–Elisseeff, p. 516, leave it open);
measurable but discontinuous kernels; learning rates under margin or source conditions and local
Rademacher complexities (on StatisticalLearningTheory's list *Beyond this roadmap*); algorithms
for the dual; multiclass, `ν`- and regression machines; random-feature approximations of the
machine.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Analysis/InnerProductSpace/Reproducing.lean`: the class `RKHS`, `RKHS.kernel`,
  `RKHS.kerFun` (with `[CompleteSpace H]`), `RKHS.kerFun_apply`
  (`kerFun H y v x = kernel H x y v`), `RKHS.inner_kerFun`, `RKHS.norm_apply_le`
  (`‖f x‖ ≤ ‖f‖ √‖kernel H x x‖`), `RKHS.norm_kerFun_sub_kerFun_sq`, `RKHS.isHermitian_kernel`,
  `RKHS.posSemidef_kernel`, `RKHS.continuous_eval_const`,
  `RKHS.continuous_kernel_iff_continuous_kerFun`, `RKHS.continuous_of_continuous_kernel` (each
  element is continuous when `(x, y) ↦ kernel H x y` is), `RKHS.kerFun_dense`, `RKHS.OfKernel`.
- `Mathlib/Topology/ContinuousMap/StoneWeierstrass.lean`:
  `ContinuousMap.subalgebra_topologicalClosure_eq_top_of_separatesPoints` (compact `X`).
- `Mathlib/MeasureTheory/Function/ContinuousMapDense.lean`:
  `MeasureTheory.Integrable.exists_boundedContinuous_integral_sub_le` (normal Borel space, weakly
  regular measure); `Mathlib/MeasureTheory/Measure/Regular.lean`:
  `MeasureTheory.Measure.WeaklyRegular.of_pseudoMetrizableSpace_of_isFiniteMeasure`.
- Measure theory: `MeasureTheory.measurePreserving_piCongrLeft`, `Pi.borelSpace`,
  `Prod.borelSpace` (second countability), `measurable_from_prod_countable_right`,
  `measurable_measure_prodMk_left`, `MeasureTheory.measure_iUnion_le` (outer measures),
  `MeasureTheory.lintegral_sub`, `MeasureTheory.ofReal_integral_eq_lintegral_ofReal`,
  `MeasureTheory.Measure.withDensity`.
- Analysis and algebra: `IsCompact.exists_isMaxOn`, `isCompact_iff_compactSpace`, `lp`,
  `Submodule.starProjection`, `Algebra.adjoin_eq_span`, `Finset.prod_univ_sum`,
  `NormedSpace.exp_eq_tsum`, `Real.exp_eq_exp_ℝ`.

### From Tau Ceti

- `TauCeti/Analysis/PositiveDefinite/Kernel/Universal.lean`: `TauCeti.IsUniversalKernel k`, the
  density in `C(X, 𝕜)` of the span of the continuous sections `k x`;
  `Matrix.PosDef.isUniversalKernel` (finite discrete spaces). Imported by `Suggested.lean`.
- `TauCeti/Analysis/Convex/Differentiability.lean`:
  `TauCeti.hasGradientAt_toReal_of_mem_subdifferential` (a subgradient at a point of
  differentiability is the gradient).

### From TauCetiRoadmap.StatisticalLearningTheory

- Definitions, copied verbatim: `labelSign`, `classificationError` (1.1), `IsRegressionFunction`,
  `bayesClassifier` (1.2), `surrogateRisk`, `marginError` (1.4), `rampLoss`,
  `empiricalMarginLoss` (4.1).
- 1.2 `TauCetiRoadmap.StatisticalLearningTheory.classificationError_bayesClassifier`
  (`[IsProbabilityMeasure P]`,
  `IsRegressionFunction P η`, `g` measurable): the Bayes risk `∫ min(η, 1 − η)`, its optimality,
  and the excess-risk identity; used in 3.1 and 3.2.
- 2.2 `empiricalRademacherComplexity_closedBall_le` (complete `H`, `0 ≤ B`), second clause with
  `B = 1`; used in 4.1.
- 4.1 `TauCetiRoadmap.StatisticalLearningTheory.marginError_le_empiricalMarginLoss`
  (`[Nonempty T]`, measurable members, pointwise
  separable, bounded by `M`, `0 < ρ`, `0 < n`, `0 < δ < 1`), first clause; used in 4.1.
- 4.2 `uniformStability_rkhs_regularized` (`c y` convex and `G`-Lipschitz, `0 < λ`,
  `‖kernel H x x‖ ≤ r²`, `A S` a minimizer of `(Σ c (S i).2 (h (S i).1))/n + λ‖h‖²`); used in 2.2.
  `stable_generalization` (`Measurable (Function.uncurry L)`, `L S z ∈ [0, M]`, `β`-stability,
  `0 < n`, `0 < δ < 1`); used in the consequence stated in 2.1. The item *Average stability* of
  4.2 is used in 2.2 with its proof written out there.

### From TauCetiRoadmap.ConvexAnalysisAndDuality

- 4.1 `strongConvex_minimizer_spec` (complete real inner product space; `f : H → EReal` never
  `⊥`, somewhere finite, lower semicontinuous, `0 < μ`, `f − μ‖·‖²/2` with convex epigraph): unique
  minimizer and quadratic growth; used in 1.1 (and through it in 1.2 and 2.1).
- 5.2 `exists_kkt_of_slater` (finite-dimensional real inner product spaces, a convex objective
  and finitely many convex inequality constraints `g i ≤ 0`, an affine constraint `A x = b` with
  `A` continuous linear, and a point satisfying `A x = b` with every `g i x < 0`): for a
  minimizer, multipliers with complementary slackness and stationarity in subgradients; used in
  1.2.

### From TauCetiRoadmap.KernelsAndSpectralMethods

- 8.2 `gaussianKernel`, copied verbatim; `posSemidef_gaussianKernel` (`0 < σ`); used in 3.3.

### From TauCetiRoadmap.MathematicalStatisticsNonparametric

- 5.8 `mem_span_kerFun_of_isMinOn` (complete `H`, any `L`, `0 < λ`, `f` a minimizer of
  `n⁻¹ Σ L(Y_i, f(x_i)) + λ‖f‖²`): `f` lies in the span of the sections; used in 1.1.

### From TauCetiRoadmap.MathematicalStatisticsAsymptotic

- 3.2 `IsPointwiseSeparable`, the hypothesis of StatisticalLearningTheory 4.1 discharged in 4.1.

### From TauCetiRoadmap.SupportVectorMachines

- 3.1 `softObjective`, copied verbatim and used in 1.2 for the family `K(·, x_i)` of `H`;
  `TauCetiRoadmap.SupportVectorMachines.softObjective_minimizers` for the facts of 1.1.

### From TauCetiRoadmap.ThresholdFunctionsAndMargins

- 4.1 `margin`, copied verbatim and used in 4.1; `isGreatest_margin` (`[Nonempty ι]`, any real
  inner product space) for the maximum-margin classifier in 4.1.

## References

- P. L. Bartlett, M. I. Jordan and J. D. McAuliffe, *Convexity, classification, and risk bounds*,
  J. Amer. Statist. Assoc. 101 (2006), 138–156; preprint from P. Bartlett's Berkeley page, page
  numbers of the preprint: sign convention p. 7, Thm 3 p. 12, Example 4 pp. 19–20.
- O. Bousquet and A. Elisseeff, *Stability and generalization*, J. Mach. Learn. Res. 2 (2002),
  499–526: Example 2 and the remark on the offset, p. 516.
- T. S. Jaakkola and D. Haussler, *Probabilistic kernel regression models*, Proceedings of the
  Seventh International Workshop on Artificial Intelligence and Statistics (1999), PMLR R2:
  Def. 1, p. 2; Lemma 1, p. 3; App. A, p. 6.
- M. Mohri, A. Rostamizadeh and A. Talwalkar, *Foundations of Machine Learning*, 2nd ed., MIT
  Press, 2018 (open-access PDF): (5.26)–(5.30) p. 90, (5.33) p. 91, Thm 5.9 p. 96, Cor 5.11 p. 97,
  (6.13)–(6.15) p. 116, Thm 6.12 p. 118, Prop 14.4 p. 338, Lemma 14.7 and Cor 14.8 pp. 341–342.
- S. Shalev-Shwartz and S. Ben-David, *Understanding Machine Learning*, Cambridge University
  Press, 2014 (authors' PDF): Thm 13.2 p. 174, Cor 13.8 p. 179, (15.6) p. 207, Cor 15.7 p. 208.
- I. Steinwart, *On the influence of the kernel on the consistency of support vector machines*,
  J. Mach. Learn. Res. 2 (2001), 67–93: Def 4 p. 72, Prop 8 and Cor 10 p. 74, Example 1 p. 76,
  Thm 12 and the remark on outer probabilities pp. 77–78, Thm 22 and Cor 23 p. 89.

# Roadmap: optimality conditions in nonlinear programming

**Summary.** A nonlinear program asks for a local minimizer of a differentiable function `f` on a
set cut out by finitely many inequality constraints `gᵢ ≤ 0` and equality constraints `hⱼ = 0` in
a finite-dimensional real space. No convexity is assumed; the question is which first- and
second-order conditions a local minimizer must satisfy, and which force a point to be one. This
roadmap builds the two cones the answers are phrased in, the tangent cone of the feasible set and
the cone obtained by linearizing the active constraints, the four classical constraint
qualifications that relate them, and the multiplier theorems they give. Either family of
constraints may be empty throughout. The headline theorems follow.

- *The Fritz John theorem.* At a local minimizer, if `f` and the active inequality constraints
  are differentiable there, the inactive ones are continuous and the equality constraints are
  strictly differentiable, there are multipliers `μ₀ ≥ 0`, `μᵢ ≥ 0` and `νⱼ`, not all zero, with
  `μᵢ = 0` for every inactive constraint, such that `μ₀ ∇f + Σ μᵢ ∇gᵢ + Σ νⱼ ∇hⱼ = 0` at the
  point. On `{x ∈ ℝ | x² ≤ 0}` the minimizer `0` of `f(x) = x` has such multipliers only with
  `μ₀ = 0`, so the Karush–Kuhn–Tucker conditions (`μ₀ = 1`) can fail.
- *Gauvin's theorem.* At such a local minimizer, the set of Karush–Kuhn–Tucker multipliers is
  nonempty and compact exactly when the Mangasarian–Fromovitz condition holds: the equality
  gradients are linearly independent and some direction decreases every active inequality
  constraint to first order while fixing every equality constraint to first order. If the
  gradients of all active constraints are linearly independent, the multiplier is unique.
- *The Gould–Tolle theorem.* At a feasible point, every objective that is differentiable there
  and has a local minimum there has a Karush–Kuhn–Tucker multiplier if and only if Guignard's
  condition holds: the tangent cone and the linearized cone have the same polar.
- *Second-order conditions.* At a local minimizer where `f`, the active inequality constraints
  and the equality constraints are `C²`, the inactive constraints are continuous and the
  gradients of the active constraints are linearly independent, the Hessian of the Lagrangian is
  nonnegative on the critical cone, the directions of the linearized cone along which `f` does
  not increase to first order. Conversely, at a feasible point with a multiplier whose
  Lagrangian Hessian is positive on the nonzero critical directions, with the same functions
  `C²`, `f` grows at least quadratically on the feasible set near the point; this needs no
  constraint qualification.

The roadmap builds on Mathlib's tangent cone, its first-order condition at a constrained local
minimum and its implicit function theorem, and on Tucker's theorem of the alternative from Tau
Ceti. The Fritz John theorem extends Mathlib's Lagrange multiplier rule to inequality
constraints. Convex programs under Slater's condition and optimization on Riemannian manifolds
are not treated here.

Layer 1 below defines the cones and the constraint qualifications and relates them. Layer 2
proves the first-order theorems from Layer 1, and Layer 3 the second-order conditions from
Layers 1 and 2.

## Conventions

- **Spaces and data.** `E` is a finite-dimensional real normed space (`ℝⁿ` with any norm is the
  model). The objective is `f : E → ℝ`; the inequality constraints are `g : ι → E → ℝ` and the
  equality constraints `h : κ → E → ℝ`, with `ι` and `κ` finite types, either of which may be
  empty. The feasible set is `feasibleSet g h = {x | (∀ i, g i x ≤ 0) ∧ ∀ j, h j x = 0}`; with no
  constraints at all it is `E`.
- **Derivatives.** Gradients are Mathlib's `fderiv ℝ f x`, a continuous linear functional on `E`;
  `∇f` in prose means this functional. The Hessian of `f` at `x` in the direction `d` is
  `fderiv ℝ (fderiv ℝ f) x d d`. Where a function is not differentiable, Mathlib's `fderiv` is
  `0`. The definitions below use `fderiv` of the constraints, so a statement whose truth does not
  depend on differentiability of the constraints (1.1, the dual form in 1.2, 2.1, 3.1) carries no
  such hypothesis; every other statement assumes the differentiability its proof uses, stated
  at the point (`DifferentiableAt`, `HasStrictFDerivAt`, `ContDiffAt`).
- **Active constraints.** The inequality constraint `i` is active at `x` when `g i x = 0`.
- **Tangent cone.** The tangent cone of a set `S` at `x` is Mathlib's `posTangentConeAt S x`. It
  consists of the limits of `cₙ • dₙ` with `cₙ ≥ 0`, `dₙ → 0` and `x + dₙ ∈ S` (Mathlib
  `exists_fun_of_mem_tangentConeAt` and `mem_tangentConeAt_of_seq`); for `x ∈ S` this is the
  tangent cone of Andréasson–Evgrafov–Patriksson, Definition 5.2, p. 119, defined there for
  closed sets.
- **Local minimizers.** A local minimizer of `f` on `S` is a point `x ∈ S` with
  `IsLocalMinOn f S x`; membership is always a separate hypothesis, since `IsLocalMinOn` does not
  include it.
- **Smoothness.** `C²` at `x` is `ContDiffAt ℝ 2`, which asks for two continuous derivatives on a
  neighbourhood of `x`. Strict differentiability at `x` is Mathlib's `HasStrictFDerivAt`, implied
  by `C¹` near `x`.

## Layer 1: feasible sets, cones and constraint qualifications

### 1.1 The linearized cone

Define `feasibleSet g h` as above and `linearizedCone g h x`, the set of `d : E` with
`fderiv ℝ (g i) x d ≤ 0` for every active `i` and `fderiv ℝ (h j) x d = 0` for every `j`.
Prove that for `x ∈ feasibleSet g h` the tangent cone is contained in the linearized cone:
`posTangentConeAt (feasibleSet g h) x ⊆ linearizedCone g h x` (Andréasson–Evgrafov–Patriksson,
Lemma 5.10, p. 124, without equality constraints; p. 134, proof of Proposition 5.36, with the
equalities written as two inequalities).

- The statement assumes no differentiability: when an active `g i` or some `h j` is not
  differentiable at `x`, its condition in the linearized cone reads `0 ≤ 0` or `0 = 0`.
- The inactive constraints do not enter the linearized cone.

Route: for a differentiable active `g i`, take `cₙ • dₙ → d` with `x + dₙ` feasible; then
`cₙ (g i (x + dₙ) − g i x) ≤ 0` and differentiability give `fderiv ℝ (g i) x d ≤ 0`; for `h j`
the differences vanish.

**Checks.**
- On `{x ∈ ℝ | x² ≤ 0} = {0}` the tangent cone is `{0}` and the linearized cone is `ℝ`, since
  the derivative of `x²` at `0` is `0`: the inclusion is strict.
- The cusp `S = {x ∈ ℝ² | x₂ ≤ x₁³, x₂ ≥ x₁⁵, x₂ ≥ 0}` at `0`: the gradients of the three active
  constraints are `(0, 1)`, `(0, −1)`, `(0, −1)`, so the linearized cone is the line `x₂ = 0`,
  while the tangent cone is the half-line `{(t, 0) | t ≥ 0}` (Andréasson–Evgrafov–Patriksson,
  Example 5.6, p. 120).

*Needs:* Mathlib `posTangentConeAt`, `exists_fun_of_mem_tangentConeAt`.

### 1.2 Constraint qualifications

Define, at a point `x`:

- `LICQ g h x`: the family consisting of `fderiv ℝ (g i) x` for the active `i` and
  `fderiv ℝ (h j) x` for all `j`, indexed by the sum of the subtype of active indices and `κ`, is
  linearly independent (Andréasson–Evgrafov–Patriksson, Definition 5.41, p. 135).
- `MFCQ g h x`: the family `fderiv ℝ (h j) x` is linearly independent, and some `d` has
  `fderiv ℝ (g i) x d < 0` for every active `i` and `fderiv ℝ (h j) x d = 0` for every `j`
  (Andréasson–Evgrafov–Patriksson, Definition 5.35, p. 134).
- Abadie's condition: `posTangentConeAt (feasibleSet g h) x = linearizedCone g h x`
  (Andréasson–Evgrafov–Patriksson, Definition 5.23, p. 129, and (5.15), p. 133).
- `GuignardCQ g h x`: every `φ : StrongDual ℝ E` with `φ d ≤ 0` on the tangent cone has `φ d ≤ 0`
  on the linearized cone; by 1.1, at a feasible point the two cones then have the same polar
  (Bertsekas–Ozdaglar, pp. 292–293, the case of no abstract set constraint).

Prove:

- **LICQ implies MFCQ** (Andréasson–Evgrafov–Patriksson, Proposition 5.42, p. 135). The family of
  the `h j` is a subfamily, and a direction with `fderiv ℝ (g i) x d = −1` for active `i` and
  `fderiv ℝ (h j) x d = 0` exists because linearly independent functionals on a
  finite-dimensional space can take any prescribed values.
- **The dual form of MFCQ.** `MFCQ g h x` holds if and only if the only `(μ, ν)` with `μ ≥ 0`,
  `μ i = 0` for every inactive `i`, and `∑ i, μ i • fderiv ℝ (g i) x + ∑ j, ν j • fderiv ℝ (h j) x = 0`
  is `(0, 0)` (Pacaud, Proposition 2.7, p. 6, where `g` denotes the equality and `h` the
  inequality constraints). No differentiability is assumed. Route: one direction applies the MFCQ
  direction `d` to the relation; the other applies Tau Ceti's Tucker theorem to the family
  `−fderiv ℝ (g i) x` (`i` active), `fderiv ℝ (h j) x`, `−fderiv ℝ (h j) x` in the dual of `E`,
  whose functional on the dual is evaluation at a vector of the finite-dimensional `E`.
- **MFCQ implies Abadie** when every active `g i` is differentiable at `x`, every inactive `g i`
  is continuous at `x`, every `h j` is strictly differentiable at `x` and `x` is feasible
  (Andréasson–Evgrafov–Patriksson, Proposition 5.36, p. 134, with a sketch; Bertsekas–Ozdaglar,
  pp. 290–291, CQ2). Route: by 1.1 it remains to put the linearized cone inside the tangent cone.
  For `d` with `fderiv ℝ (g i) x d < 0` on the active `i` and `fderiv ℝ (h j) x d = 0`, the
  implicit function theorem for `x ↦ (h j x)ⱼ`, whose strict derivative is onto by linear
  independence, gives a curve `c` in `{h = 0}` with `c t = x + t • d + o(t)`; for small `t > 0`
  it is feasible, the active constraints by their derivatives and the inactive ones by continuity,
  so `d` is tangent. A general `d` of the linearized cone is the limit of `d + ε • d̄` with `d̄`
  the MFCQ direction, and the tangent cone is closed.
- **Affine constraints satisfy Abadie** at every feasible point: if every `g i` and every `h j`
  is a constant plus a continuous linear functional, then Abadie's condition holds at
  `x ∈ feasibleSet g h` (Andréasson–Evgrafov–Patriksson, Proposition 5.44, p. 136). The segment
  from `x` to `x + t • d` stays feasible for small `t > 0` when `d` is in the linearized cone.
- Abadie's condition implies Guignard's at once.

**Checks.**
- The set `S = {x ∈ ℝ² | −x₁ ≤ 0, (x₁ − 1)² + x₂² ≤ 1}` at `0` (Andréasson–Evgrafov–Patriksson,
  Example 5.4, p. 120): the active gradients are `(−1, 0)` and `(−2, 0)`, linearly dependent, so
  LICQ fails; `d = (1, 0)` decreases both, so MFCQ holds. The points `(s², s)` are feasible for
  small `s`, so `(0, 1)` and `(0, −1)` are tangent, and the tangent cone is the linearized cone
  `{d | d₁ ≥ 0}`.
- The complementarity set `S = {x ∈ ℝ² | −x₁ ≤ 0, −x₂ ≤ 0, x₁ x₂ ≤ 0}` at `0`
  (Andréasson–Evgrafov–Patriksson, Example 5.5, p. 120): the tangent cone is the union of the two
  nonnegative half-axes and the linearized cone is the quadrant `{d₁ ≥ 0, d₂ ≥ 0}` (the gradient
  of `x₁ x₂` vanishes at `0`). Abadie fails; Guignard holds, since both cones have the polar
  `{φ | φ(1, 0) ≤ 0, φ(0, 1) ≤ 0}`. MFCQ fails: the third constraint is active with zero gradient.
- The cusp of 1.1 fails Guignard: `φ(d) = −d₁` is nonpositive on the tangent cone and positive at
  `(−1, 0)` in the linearized cone.
- MFCQ with redundant equalities: `h₁ = x₂`, `h₂ = 2 x₂` on `ℝ²` define the same feasible set as
  `h₁` alone, and Abadie holds (the constraints are affine), but MFCQ fails because the gradients
  `(0, 1)` and `(0, 2)` are dependent.

*Needs:* 1.1; Mathlib `LinearIndependent`, `HasStrictFDerivAt.implicitFunctionOfComplemented`,
`HasStrictFDerivAt.to_implicitFunctionOfComplemented`,
`HasStrictFDerivAt.map_implicitFunctionOfComplemented_eq`,
`Submodule.ClosedComplemented.of_finiteDimensional`, `hasStrictFDerivAt_pi`,
`mem_tangentConeAt_of_seq`, `tangentConeAt_eq_biInter_closure` (the tangent cone is an
intersection of closed sets, hence closed), `Module.evalEquiv` (every linear functional on the
dual of `E` is evaluation at a vector); Tau Ceti
`TauCeti.exists_nonneg_sum_smul_eq_zero_and_forall_coeff_add_dual_pos`. (The dual form and the
implications are proved here.)

### Examples

The cusp, the complementarity set, the disc tangent to a half-plane and the redundant
equalities of the Checks; the one-point set `{x² ≤ 0}`.

### Dependencies

Mathlib `posTangentConeAt`, `exists_fun_of_mem_tangentConeAt`, `mem_tangentConeAt_of_seq`,
`tangentConeAt_eq_biInter_closure`, `LinearIndependent`, `Module.evalEquiv`, the implicit
function theorem for complemented kernels (`HasStrictFDerivAt.implicitFunctionOfComplemented`
and its two companions), `Submodule.ClosedComplemented.of_finiteDimensional`,
`hasStrictFDerivAt_pi`; Tau Ceti `TauCeti.exists_nonneg_sum_smul_eq_zero_and_forall_coeff_add_dual_pos`.
No other layer.

## Layer 2: first-order conditions

### 2.1 Multipliers and the Gould–Tolle theorem

Define `IsKKTMultiplier f g h x μ ν` for `μ : ι → ℝ`, `ν : κ → ℝ`: `μ i ≥ 0` for all `i`,
complementary slackness `μ i * g i x = 0` for all `i`, and stationarity
`fderiv ℝ f x + ∑ i, μ i • fderiv ℝ (g i) x + ∑ j, ν j • fderiv ℝ (h j) x = 0`
(Andréasson–Evgrafov–Patriksson, (5.17), p. 133). Define `kktMultipliers f g h x`, the set of
pairs `(μ, ν)` that are multipliers; it is closed and convex.

Prove `guignardCQ_iff_forall_kktMultipliers_nonempty`: for `x ∈ feasibleSet g h`,
`GuignardCQ g h x` holds if and only if every `f` that is differentiable at `x` and has
`IsLocalMinOn f (feasibleSet g h) x` has a multiplier (Bertsekas–Ozdaglar, pp. 292–293, who
attribute the characterization to Gould and Tolle and the sufficiency to Guignard). No
differentiability of the constraints is assumed (see the conventions).

- **Corollary: KKT under Abadie.** At a local minimizer where Abadie's condition holds and `f` is
  differentiable, a multiplier exists (Andréasson–Evgrafov–Patriksson, Theorem 5.33, p. 133;
  Theorem 5.25, p. 129, without equality constraints).
- **Corollary: affine constraints.** With affine constraints every local minimizer at which `f` is
  differentiable has a multiplier, by 1.2.

Route. If Guignard holds: Mathlib `IsLocalMinOn.hasFDerivWithinAt_nonneg` makes `−∇f` nonpositive
on the tangent cone, hence on the linearized cone. Apply Tau Ceti's Tucker theorem to the family
`−∇f`, `−∇gᵢ` (`i` active), `∇hⱼ`, `−∇hⱼ`: it gives a nonnegative relation and a vector `d` (a
functional on the dual of `E`) on which every member is nonnegative, with each member either in
the relation or positive at `d`. Then `d` lies in the linearized cone and `∇f(d) ≤ 0`, so
`∇f(d) = 0`, so `−∇f` carries a positive coefficient, and dividing by it gives the multiplier,
with `μᵢ = 0` for inactive `i`. Conversely, for `φ` nonpositive on the tangent cone, put
`θ(r) = sup {φ(y − x) | y feasible, ‖y − x‖ ≤ r}`, a finite, nondecreasing, nonnegative
function (`y = x` is allowed). Since `φ` is nonpositive on the tangent cone and the unit sphere
of `E` is compact, `θ(r) = o(r)` as `r → 0`. The function `f(y) = −φ(y − x) + θ(‖y − x‖)` is
then differentiable at `x` with derivative `−φ`, and `f(y) ≥ 0 = f(x)` for feasible `y`; its
multiplier writes `φ` as `∑ μᵢ ∇gᵢ + ∑ νⱼ ∇hⱼ` with `μ ≥ 0` vanishing off the active set, which is nonpositive on the
linearized cone.

**Checks.**
- On the complementarity set of 1.2 with `f = x₁ + x₂`, the minimizer `0` has the multiplier
  `μ = (1, 1, 0)`; with `f = x₁` the multipliers are `(1, 0, μ₃)` for every `μ₃ ≥ 0`
  (Andréasson–Evgrafov–Patriksson, Example 5.30, p. 131). Multipliers exist although Abadie
  fails, as Guignard holds there (1.2).
- On the cusp of 1.1 with `f = x₁`, `0` is a minimizer (every feasible point near `0` has
  `x₁ ≥ 0`) and has no multiplier: the first coordinates of the active gradients are `0` and that
  of `∇f` is `1` (Andréasson–Evgrafov–Patriksson, Example 5.31, p. 131). By the theorem Guignard
  fails, as the Check of 1.2 shows directly.
- On `{x² ≤ 0}` with `f(x) = x`, `1 + μ · 0 = 0` has no solution: no multiplier.
- Without constraints the multiplier condition is `∇f(x) = 0`, Fermat's rule, and Guignard holds
  because the tangent cone is all of `E`.

*Needs:* 1.1, 1.2; Mathlib `IsLocalMinOn.hasFDerivWithinAt_nonneg`, `Module.evalEquiv`; Tau Ceti
`TauCeti.exists_nonneg_sum_smul_eq_zero_and_forall_coeff_add_dual_pos`. (Proved here.)

### 2.2 The Fritz John theorem

Prove `exists_fritzJohn`: let `x ∈ feasibleSet g h` with `IsLocalMinOn f (feasibleSet g h) x`,
`f` differentiable at `x`, every active `g i` differentiable at `x`, every `g i` continuous at
`x`, and every `h j` strictly differentiable at `x` with derivative `fderiv ℝ (h j) x`. Then there
are `μ₀ ≥ 0`, `μ ≥ 0` and `ν` with `(μ₀, μ, ν) ≠ 0`, `μ i * g i x = 0` for all `i`, and
`μ₀ • fderiv ℝ f x + ∑ i, μ i • fderiv ℝ (g i) x + ∑ j, ν j • fderiv ℝ (h j) x = 0`
(Bertsekas–Ozdaglar, Proposition 2.1, p. 295, for continuously differentiable data and an
abstract set `X`; with `X = ℝⁿ` its normal cone is `{0}`, and its condition (iv) forces
`μ i = 0` for inactive `i`; Andréasson–Evgrafov–Patriksson, Theorem 5.15, p. 125, without
equality constraints).

Route. If the `fderiv ℝ (h j) x` are linearly dependent, a nontrivial relation among them gives
`ν` with `μ₀ = 0`, `μ = 0`. Otherwise no `d` has `∇f(d) < 0`, `∇gᵢ(d) < 0` for active `i` and
`∇hⱼ(d) = 0`: such a `d` would witness MFCQ, so by 1.2 (MFCQ implies Abadie) it would lie in the
tangent cone, where `IsLocalMinOn.hasFDerivWithinAt_nonneg` gives `∇f(d) ≥ 0`. Tau
Ceti's Tucker theorem applied to `−∇f`, `−∇gᵢ` (`i` active), `∇hⱼ`, `−∇hⱼ` then gives a relation
in which `−∇f` or some `−∇gᵢ` has a positive coefficient, which is the claim.

**Checks.**
- With no constraints the theorem says `μ₀ ∇f(x) = 0` with `μ₀ ≠ 0`: Fermat's rule.
- With no inequality constraints it says that `∇f(x)` and the `∇hⱼ(x)` are linearly dependent,
  the conclusion of Mathlib's `IsLocalExtrOn.exists_multipliers_of_hasStrictFDerivAt` for a local
  minimum (where `f` too is assumed strictly differentiable).
- On `{x² ≤ 0}` with `f(x) = x`: `μ₀ = 0`, `μ = 1` is a Fritz John multiplier and `μ₀ = 0` is
  forced.
- Continuity of the inactive constraints is needed: on `ℝ`, the constraint `g` with `g(0) = −1`
  and `g(y) = 1` for `y ≠ 0` makes `0` the only feasible point, so `f(y) = y` has a local
  minimum there; complementary slackness forces `μ = 0` and then `μ₀ = 0`, so no Fritz John
  multiplier exists.

*Needs:* 1.2 (MFCQ implies Abadie); Mathlib `IsLocalMinOn.hasFDerivWithinAt_nonneg`,
`Module.evalEquiv`; Tau Ceti `TauCeti.exists_nonneg_sum_smul_eq_zero_and_forall_coeff_add_dual_pos`.
(Proved here.)

### 2.3 Gauvin's theorem

Prove `mfcq_iff_kktMultipliers_nonempty_and_isCompact`: under the hypotheses of 2.2 (a local
minimizer with the same smoothness), `MFCQ g h x` holds if and only if `kktMultipliers f g h x` is
nonempty and compact (Pacaud, Theorem 2.6, p. 6, stated there as boundedness of the multiplier
set alone; the direction from MFCQ to nonemptiness needs the local minimizer, and the converse
needs nonemptiness, as the last Check shows;
Bertsekas–Ozdaglar, pp. 317–318, who attribute it to Gauvin). In particular MFCQ at a local
minimizer gives a multiplier.

Route. From MFCQ: the Fritz John multiplier of 2.2 has `μ₀ > 0`, because a relation with `μ₀ = 0`
contradicts the dual form of MFCQ in 1.2 (complementary slackness puts the support of `μ` in the
active set); the multiplier set is closed, and it is bounded because its recession directions
are the relations excluded by the dual form. Conversely, if MFCQ fails, the dual form gives a
nonzero relation `(μ̄, ν̄)`, `μ̄ ≥ 0` supported on the active set, and `p + t (μ̄, ν̄)` is a
multiplier for every multiplier `p` and every `t ≥ 0`, so a nonempty multiplier set is unbounded.

**Checks.**
- The disc and half-plane of 1.2 with `f = x₁`, minimized at `0`: the multipliers are the
  `(μ₁, μ₂)` with `μ₁ + 2 μ₂ = 1`, `μ ≥ 0`, the segment from `(1, 0)` to `(0, 1/2)`: compact, as
  MFCQ predicts, and not a single point, since LICQ fails.
- The redundant equalities `h₁ = x₂`, `h₂ = 2 x₂` with `f = x₁² + x₂`, minimized at `0`: the
  multipliers are the `(ν₁, ν₂)` with `ν₁ + 2 ν₂ = −1`, a line, unbounded, and MFCQ fails.
- The complementarity set with `f = x₁`: the multiplier set `{(1, 0, μ₃) | μ₃ ≥ 0}` is nonempty
  and unbounded, and MFCQ fails.
- `{x² ≤ 0}` with `f(x) = x`: MFCQ fails and the multiplier set is empty.

*Needs:* 1.2, 2.2; Mathlib `Metric.isCompact_of_isClosed_isBounded`. (Proved here.)

### 2.4 KKT under linear independence

Prove `existsUnique_isKKTMultiplier_of_licq`: under the hypotheses of 2.2 and `LICQ g h x`, there
is exactly one pair `(μ, ν)` with `IsKKTMultiplier f g h x μ ν` (Nemirovski, Theorem 8.2.6,
p. 166; Andréasson–Evgrafov–Patriksson, the remark after Proposition 5.42, p. 136).

Route. LICQ implies MFCQ (1.2), so 2.3 gives a multiplier. Two multipliers vanish on the inactive
indices by complementary slackness, and their difference is a linear relation among the family
of LICQ, hence zero.

**Checks.**
- The set `{x ∈ ℝ² | −x₂ ≤ 0, (x₁ − 1)² + x₂² = 1}` with `f = x₁`, minimized at `0`
  (Andréasson–Evgrafov–Patriksson, Examples 5.7 and 5.34, pp. 120 and 134): the gradients
  `(0, −1)` and `(−2, 0)` are independent, and the unique multiplier is `μ = 0`, `ν = 1/2`; the
  active inequality constraint has multiplier `0`.
- Without LICQ uniqueness fails: the disc and half-plane of 2.3 has a segment of multipliers.

*Needs:* 1.2, 2.3. (Proved here.)

### Examples

Every example of Layer 1 with `f = x₁`, together with `f = x₁ + x₂` on the complementarity set and
`f = x₁² + x₂` with redundant equalities; the one-point set `{x² ≤ 0}` with `f(x) = x`.

### Dependencies

Layer 1 (1.1, 1.2); Mathlib `IsLocalMinOn.hasFDerivWithinAt_nonneg`, `Module.evalEquiv`,
`Metric.isCompact_of_isClosed_isBounded`, and, in a Check only,
`IsLocalExtrOn.exists_multipliers_of_hasStrictFDerivAt`; Tau Ceti
`TauCeti.exists_nonneg_sum_smul_eq_zero_and_forall_coeff_add_dual_pos`.

## Layer 3: second-order conditions

### 3.1 The critical cone and the Hessian of the Lagrangian

Define `criticalCone f g h x`, the set of `d ∈ linearizedCone g h x` with
`fderiv ℝ f x d ≤ 0` (Pacaud, Definition 2.1, (2.10), p. 4), and
`lagrangianHessian f g h x μ ν d`, equal to
`fderiv ℝ (fderiv ℝ f) x d d + ∑ i, μ i * fderiv ℝ (fderiv ℝ (g i)) x d d + ∑ j, ν j * fderiv ℝ (fderiv ℝ (h j)) x d d`,
the Hessian of the Lagrangian `f + ∑ μᵢ gᵢ + ∑ νⱼ hⱼ` evaluated at `(d, d)` when the functions are
twice differentiable.

Prove that for every multiplier `(μ, ν)` the critical cone is the set of `d` in the linearized
cone with `fderiv ℝ (g i) x d = 0` for every `i` with `μ i > 0` (Pacaud, (2.11), p. 4). So the
constraints with positive multiplier are held at equality to first order, and the active
constraints with multiplier `0` only to first-order inequality. No differentiability is assumed.

Route: on the linearized cone, stationarity gives `∇f(d) = −∑ μᵢ ∇gᵢ(d) ≥ 0`, a sum of
nonnegative terms, so `∇f(d) ≤ 0` exactly when each term vanishes.

**Checks.**
- `f = x₁² + x₂ − x₂²` on `{−x₂ ≤ 0}` at `0`: the multiplier is `μ = 1`, the linearized cone is
  `{d₂ ≥ 0}` and the critical cone is the line `{(t, 0)}`.
- `f = x₁² − x₂²` on `{−x₂ ≤ 0}` at `0`: the gradient of `f` is `0`, the multiplier is `μ = 0`
  (the constraint is active with multiplier `0`), and the critical cone is the whole linearized
  cone `{d₂ ≥ 0}`, not the line `{d₂ = 0}`.

*Needs:* 1.1, 2.1. (Proved here.)

### 3.2 The second-order necessary condition

Prove `lagrangianHessian_nonneg_of_licq`: let `x ∈ feasibleSet g h` with
`IsLocalMinOn f (feasibleSet g h) x`, `f`, every active `g i` and every `h j` of class `C²` at
`x`, every `g i` continuous at `x`, and `LICQ g h x`. Then for the multiplier `(μ, ν)` (unique by
2.4) and every `d` in the critical cone, `0 ≤ lagrangianHessian f g h x μ ν d` (Pacaud, Theorem
2.4, p. 5; Nemirovski, Theorem 8.2.7, p. 167, gives the weaker statement on the subspace where
all active constraints are held at equality).

Route. By 3.1 the direction `d` has `∇gᵢ(d) = 0` for `μᵢ > 0` and `∇gᵢ(d) ≤ 0` for the other
active `i`. LICQ makes the derivative of the map formed by the `hⱼ` and the active `gᵢ` with
`∇gᵢ(d) = 0` onto, and the implicit function theorem gives a curve `c` with
`c t = x + t • d + o(t)` on which these constraints vanish; for small `t ≥ 0` it is feasible. On
it the Lagrangian equals `f`, so it is at least its value at `x`. Its derivative at `x` is `0`
(stationarity), and the second-order expansion of the Lagrangian at `x` (from the mean value
inequality applied to the remainder, and the symmetry of the second derivative of a `C²`
function) gives `t² (lagrangianHessian … d) / 2 + o(t²) ≥ 0`.

**Checks.**
- Without constraints the statement says that the Hessian of `f` is positive semidefinite at a
  local minimizer: Tau Ceti `TauCeti.fderiv_fderiv_self_nonneg_of_isLocalMin`.
- `f = x₁² − x₂²` on `{−x₂ ≤ 0}` at `0` (LICQ holds, `μ = 0`): `d = (0, 1)` is critical and the
  Lagrangian Hessian there is `−2 < 0`, so `0` is not a local minimizer, as `f(0, t) = −t²` shows.
  On the line `{d₂ = 0}`, where all active constraints are held at equality, the Hessian
  `2 d₁²` is nonnegative and does not detect this.
- LICQ is needed: on `{x ∈ ℝ² | x₁² ≤ 0} = {x₁ = 0}`, `f = x₂² − x₁²` has a local minimum at `0`;
  the gradients of `f` and of the constraint vanish there, so every `μ ≥ 0` is a multiplier, the
  critical cone is `ℝ²`, and for `μ = 0` the Lagrangian Hessian at `d = (1, 0)` is `−2`.

*Needs:* 1.2, 2.4, 3.1; Mathlib `HasStrictFDerivAt.implicitFunctionOfComplemented` and its
companions as in 1.2, `ContDiffAt.hasStrictFDerivAt`, `ContDiffAt.isSymmSndFDerivAt`,
`Convex.norm_image_sub_le_of_norm_hasFDerivWithin_le`. (Proved here.)

### 3.3 The second-order sufficient condition

Prove `exists_quadratic_growth_of_lagrangianHessian_pos`: let `x ∈ feasibleSet g h`, `f`, every
active `g i` and every `h j` of class `C²` at `x`, and `(μ, ν)` a multiplier with
`0 < lagrangianHessian f g h x μ ν d` for every nonzero `d` in the critical cone. Then there is
`σ > 0` with `f x + σ ‖y − x‖² ≤ f y` for all feasible `y` near `x`; in particular `x` is a strict
local minimizer. No constraint qualification is assumed (Pacaud, Definition 2.11 and Proposition
2.12, p. 6; Nemirovski, Theorem 8.2.7, p. 167, under LICQ and positivity on a larger subspace).

Route. If not, there are feasible `yₙ → x`, `yₙ ≠ x`, with `f yₙ < f x + ‖yₙ − x‖²/n`. A limit `d`
of `(yₙ − x)/‖yₙ − x‖` has norm `1`, is tangent, hence in the linearized cone (1.1), and has
`∇f(d) ≤ 0`, so it is critical. On the feasible set the Lagrangian is at most `f` (`μ ≥ 0`,
`g ≤ 0`, `h = 0`), equals `f` at `x` (complementary slackness) and has derivative `0` there; its
second-order expansion along `yₙ` gives `lagrangianHessian … d ≤ 0`, a contradiction. The
inactive constraints carry multiplier `0` and do not enter.

**Checks.**
- `f = x₁² + x₂ − x₂²` on `{−x₂ ≤ 0}` at `0` with `μ = 1`: the Lagrangian Hessian is
  `2 d₁² − 2 d₂²`, which is negative at `(0, 1)` in the linearized cone but equals `2 t² > 0` on
  the nonzero critical directions `(t, 0)`. The theorem applies, and indeed
  `f ≥ (‖x‖₂)² / 2` on the feasible points with `|x₁|, |x₂| ≤ 0.3`, since there
  `x₂ − x₂² ≥ 0.7 x₂ ≥ x₂² / 2`.
- The sign pattern matters: for `f = x₁² − x₂²` on `{−x₂ ≤ 0}` (`μ = 0`), positivity holds on the
  line `{d₂ = 0}` but fails at the critical direction `(0, 1)`, and `0` is not a local minimizer.
- No constraint qualification is needed: on `{x₁² ≤ 0}`, where LICQ, MFCQ and Abadie fail,
  `f = x₂² − x₁²` with `μ = 2` has Lagrangian Hessian `2 d₁² + 2 d₂²`, and `f(y) = ‖y‖₂²` on the
  feasible set.
- Strict positivity cannot be weakened to nonnegativity: `f(x) = x³` on `ℝ` without constraints
  has critical cone `ℝ` and Hessian `0` at `0`, which is not a local minimizer.
- The condition is not necessary: `f(x) = x⁴` has a strict minimum at `0` with Hessian `0`, and
  no quadratic growth.

*Needs:* 1.1, 2.1, 3.1; Mathlib `mem_tangentConeAt_of_seq`, `ContDiffAt.isSymmSndFDerivAt`,
`Convex.norm_image_sub_le_of_norm_hasFDerivWithin_le`. (Proved here.)

### Examples

The three objectives on the half-plane `{x₂ ≥ 0}` and the objective `x₂² − x₁²` on the line
`{x₁² ≤ 0}` of the Checks; `x³` and `x⁴` on `ℝ`.

### Dependencies

Layer 1 (1.1, 1.2) and Layer 2 (2.1, 2.4); Mathlib `mem_tangentConeAt_of_seq`, `ContDiffAt.hasStrictFDerivAt`,
`ContDiffAt.isSymmSndFDerivAt`, `Convex.norm_image_sub_le_of_norm_hasFDerivWithin_le`, the
implicit function theorem of 1.2; Tau Ceti `TauCeti.fderiv_fderiv_self_nonneg_of_isLocalMin` in a
Check only.

## Scope and ownership

This roadmap owns the feasible set and the linearized cone of a nonlinear program with finitely
many smooth constraints in a finite-dimensional real space, the constraint qualifications LICQ,
MFCQ, Abadie and Guignard with the implications between them, the Karush–Kuhn–Tucker multiplier
set, the Gould–Tolle characterization, the Fritz John theorem, Gauvin's theorem, uniqueness under
LICQ, the critical cone, and the second-order necessary and sufficient conditions stated above.

Already in the libraries and therefore not targets:

- The tangent cone and the first-order condition at a constrained local minimum,
  `IsLocalMinOn.hasFDerivWithinAt_nonneg` (Mathlib), which 2.1 uses.
- The Lagrange multiplier rule for equality constraints,
  `IsLocalExtrOn.exists_multipliers_of_hasStrictFDerivAt` (Mathlib); 2.2 extends it to
  inequality constraints and is not restated without them.
- Tucker's and Gordan's theorems of the alternative (Tau Ceti,
  `TauCeti/Geometry/Convex/Cone/Alternative.lean`), from which the routes derive the finite
  alternatives they use.
- The unconstrained second-order necessary condition (Tau Ceti
  `TauCeti.fderiv_fderiv_self_nonneg_of_isLocalMin`) and Mathlib's one-variable second-derivative
  test `isLocalMin_of_deriv_deriv_pos`.
- The tangent cone of a regular level set, `HasStrictFDerivAt.tangentConeAt_preimage_singleton`
  (Tau Ceti), for the two-sided cone `tangentConeAt`; 1.2 needs the one-sided cone of a set cut
  out also by inequalities.

Boundaries with other roadmaps:

- VariationalMethods 2.1 (on main) states the first variation on affine and closed convex
  constraints in a Banach space, with normal cones and the subdifferential sum rule. This roadmap
  has no convexity and no subdifferentials; it does not restate those results.
- ConvexAnalysisAndDuality (an open roadmap, not on main) states in its 5.2 the
  Karush–Kuhn–Tucker theorem for convex programs under Slater's condition, with subgradients and
  global minimizers, and the sufficiency of the conditions written with subgradients; in its 1.4 Farkas'
  lemma for matrices; and in its 3.7 the tangent and normal cones of convex sets. The theorems
  here are about local minimizers of smooth, not necessarily convex, programs under constraint
  qualifications; none of those statements is restated, and the finite alternatives in the routes
  come from Tau Ceti's Tucker theorem. This roadmap does not depend on that one.
- ManifoldOptimization (an open roadmap, not on main) states in its O3.2–O3.4 the second-order
  conditions on a Riemannian manifold and, on a regular level set, the identification of the
  Riemannian Hessian with the Hessian of the Lagrangian on the tangent space. Without inequality
  constraints and under LICQ, 3.2 and 3.3 concern the same level sets, but stated in the ambient
  space with the critical cone, and with inequality constraints and no qualification in 3.3. This
  roadmap does not depend on that one.
- ExactPenalties (an open roadmap, not on main) treats an abstract penalty with a unit violation
  gap. Exact penalty functions of nonlinear programs are not stated here.

Outside the scope: algorithms of every kind (sequential quadratic programming, penalty, barrier
and augmented Lagrangian methods, active-set and interior-point methods); trust-region subproblems
and the S-lemma; sensitivity of solutions and multipliers to parameters; the constant rank and
constant positive linear dependence qualifications and second-order constraint qualifications; second-order conditions under MFCQ alone;
infinite-dimensional spaces and abstract set constraints; nonsmooth data and subdifferentials;
duality theory.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Analysis/Calculus/TangentCone/Defs.lean`: `posTangentConeAt s x`, the tangent cone
  `tangentConeAt ℝ≥0 s x`; `exists_fun_of_mem_tangentConeAt` (a tangent vector `y` is a limit
  `c n • d n → y` with `d n → 0` and `x + d n ∈ s` eventually) and `mem_tangentConeAt_of_seq` (the
  converse).
- `Mathlib/Analysis/Calculus/TangentCone/Basic.lean`: `tangentConeAt_eq_biInter_closure` (the
  tangent cone is the intersection over neighbourhoods `U` of `0` of the closures of the scalings
  of `U ∩ (s − x)`; in particular it is closed).
- `Mathlib/LinearAlgebra/Dual/Defs.lean`: `Module.evalEquiv` (for a reflexive module, in particular
  a finite-dimensional space such as the dual of `E`, evaluation is an isomorphism onto the
  double dual).
- `Mathlib/Analysis/Calculus/LocalExtr/Basic.lean`: `IsLocalMinOn.hasFDerivWithinAt_nonneg` (if
  `f` has a local minimum on `s` at `a` with derivative `f'` within `s`, then `0 ≤ f' y` for every
  `y` in `posTangentConeAt s a`).
- `Mathlib/Analysis/Calculus/LagrangeMultipliers.lean`:
  `IsLocalExtrOn.exists_multipliers_of_hasStrictFDerivAt` (at a local extremum on
  `{x | ∀ i, f i x = f i x₀}` of a strictly differentiable `φ`, with strictly differentiable
  `f i`, some `(Λ, Λ₀) ≠ 0` has `∑ i, Λ i • f' i + Λ₀ • φ' = 0`), in a Check of 2.2.
- `Mathlib/Analysis/Calculus/Implicit.lean`: `HasStrictFDerivAt.implicitFunctionOfComplemented`,
  `HasStrictFDerivAt.to_implicitFunctionOfComplemented` (the implicit function is strictly
  differentiable at `0` with derivative the inclusion of the kernel) and
  `HasStrictFDerivAt.map_implicitFunctionOfComplemented_eq` (it parametrizes the level set near
  the point), for a strict derivative onto the target with closed complemented kernel between
  complete spaces.
- `Mathlib/Analysis/LocallyConvex/HahnBanach.lean`:
  `Submodule.ClosedComplemented.of_finiteDimensional` (a finite-dimensional subspace is closed and
  complemented; with `E` finite-dimensional every kernel is).
- `Mathlib/Analysis/Calculus/FDeriv/Prod.lean`: `hasStrictFDerivAt_pi` (a map into a finite
  product is strictly differentiable when every component is).
- `Mathlib/Analysis/Calculus/ContDiff/RCLike.lean`: `ContDiffAt.hasStrictFDerivAt` (a function of
  class `Cⁿ`, `n ≥ 1`, at a point is strictly differentiable there).
- `Mathlib/Analysis/Calculus/FDeriv/Symmetric.lean`: `ContDiffAt.isSymmSndFDerivAt` (over `ℝ`, the
  second derivative of a `C²` function is symmetric).
- `Mathlib/Analysis/Calculus/MeanValue.lean`:
  `Convex.norm_image_sub_le_of_norm_hasFDerivWithin_le` (the mean value inequality on a convex
  set).
- `Mathlib/Topology/MetricSpace/Bounded.lean`: `Metric.isCompact_of_isClosed_isBounded` (closed
  bounded sets of a proper space are compact).
- `Mathlib/LinearAlgebra/LinearIndependent/Defs.lean`: `LinearIndependent`.

### From Tau Ceti

- `TauCeti/Geometry/Convex/Cone/Alternative.lean`:
  `TauCeti.exists_nonneg_sum_smul_eq_zero_and_forall_coeff_add_dual_pos` (Tucker's theorem: for a
  finite family `a` in a vector space over a linearly ordered field there are `x ≥ 0` with
  `∑ j, x j • a j = 0` and a linear functional `y` with `y (a j) ≥ 0` and `x j + y (a j) > 0` for
  every `j`).
- `TauCeti/Analysis/Calculus/DerivativeTest.lean`:
  `TauCeti.fderiv_fderiv_self_nonneg_of_isLocalMin` (at a local minimum of a `C²` function on a
  real normed space every diagonal Hessian value is nonnegative), in a Check of 3.2.

## References

- Niclas Andréasson, Anton Evgrafov and Michael Patriksson, *An Introduction to Optimization:
  Foundations and Fundamental Algorithms*, draft of February 22, 2005, course text of Chalmers
  University of Technology, available from the course pages of the Department of Mathematical
  Sciences at Chalmers; chapter 5, pp. 119–136. Page numbers are the printed ones.
- Dimitri P. Bertsekas and Asuman E. Ozdaglar, Pseudonormality and a Lagrange multiplier theory
  for constrained optimization, *Journal of Optimization Theory and Applications* 114 (2002),
  287–343; the copy on the first author's page at MIT.
- François Pacaud, Sensitivity analysis for parametric nonlinear programming: a tutorial,
  arXiv:2504.15851, version 1; §2.1–2.2, pp. 4–6. Its `g` are the equality and its `h` the
  inequality constraints.
- Arkadi Nemirovski, *Optimization II: Numerical Methods for Nonlinear Continuous Optimization*,
  lecture notes, Technion, 1999, on the author's page; Lecture 8, pp. 164–167.
- Attributions in prose without a locator: Fritz John (1948); William Karush (1939), Harold W.
  Kuhn and Albert W. Tucker (1951); Olvi L. Mangasarian and Stanley Fromovitz (1967); Jean Abadie
  (1967); Monique Guignard (1969); F. J. Gould and Jon W. Tolle (1971); Jacques Gauvin (1977).

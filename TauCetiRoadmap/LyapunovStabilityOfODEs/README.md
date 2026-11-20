# Roadmap: Lyapunov stability of ordinary differential equations

**Summary.** An equilibrium of an autonomous differential equation `x' = f(x)` is a zero of the
vector field. It is stable when solutions that start near it stay near it for all later times, and
asymptotically stable when, in addition, they converge to it. Lyapunov's two methods decide these
properties without solving the equation: the direct method by a function that does not increase
along solutions, the indirect method by the derivative of `f` at the equilibrium. This roadmap
develops that theory for a continuously differentiable vector field on a finite-dimensional real
normed space. Each notion of stability asks both that solutions from nearby points exist for all
positive times and that all of them behave as required, so that a field whose solutions escape in
finite time is never called stable.

The headline theorems are these.

- *Lyapunov's direct method.* If a function `V`, differentiable on a ball around the equilibrium,
  vanishes there, is positive at the other points of the ball, and its derivative along `f` is
  nonpositive on the ball, the equilibrium is stable; if that derivative is negative away from the
  equilibrium, it is asymptotically stable.
- *LaSalle's invariance principle.* If a solution stays in a bounded set and the derivative of a
  differentiable `V` along `f` is nonpositive at each of its points, the solution approaches the
  union of the complete orbits of `f` (those defined for all real times) along which that
  derivative vanishes. If `V` moreover
  vanishes at the equilibrium, is positive elsewhere, tends to infinity at infinity and has
  nonpositive derivative along `f` everywhere, and the only solution keeping that derivative zero
  for all positive times stays at the equilibrium, the equilibrium is globally asymptotically
  stable (the Barbashin–Krasovskii theorem).
- *Chetaev's instability theorem.* If there are points arbitrarily close to the equilibrium where a
  continuously differentiable `V` is positive, and the derivative of `V` along `f` is positive at
  every point of a ball where `V` is positive, the equilibrium is not stable.
- *Lyapunov's indirect method.* For a continuously differentiable field on `ℝⁿ`, if every complex
  eigenvalue of the Jacobian matrix at an equilibrium has negative real part, the equilibrium is
  exponentially stable; if some complex eigenvalue of the Jacobian matrix at a point has positive
  real part, that point is not stable.

The roadmap builds on Mathlib's integral curves and the Picard–Lindelöf theorem. From
PopulationDynamics it takes the existence of a solution on `[0, ∞)` once all solutions from a
point stay in a compact set. From LinearSystemsAndControl it takes Hurwitz matrices and the
Lyapunov equation, which supply the quadratic functions of the indirect method. Tau Ceti
contributes the description of the ω-limit set of a curve as an intersection of closures.

Layer 1 below defines solutions on `[0, ∞)` and the four notions of stability. Layer 2 proves that
the ω-limit set of a bounded solution is made of complete orbits. Layer 3 proves Lyapunov's
theorems, LaSalle's principle and the Barbashin–Krasovskii theorem. Layer 4 proves Chetaev's
theorem, and Layer 5 the two theorems of the indirect method, using Layer 4 for instability.

## Conventions

- **Spaces and fields.** `E` is a finite-dimensional real normed space and `f : E → E` a vector
  field with `ContDiff ℝ 1 f` on all of `E`. Finite dimension makes closed bounded sets compact;
  all norms on `E` are equivalent, so none of the notions below depends on the norm, except for
  the constant `C` of exponential stability. Fields defined only on an open subset are not
  treated.
- **Solutions.** A forward solution from `x` is a curve `γ : ℝ → E` with `γ 0 = x` and Mathlib's
  `IsIntegralCurveOn γ (fun _ ↦ f) (Set.Ici 0)`: for every `t ≥ 0` the derivative of `γ` within
  `[0, ∞)` at `t` is `f (γ t)`, one-sided at `0` and two-sided at `t > 0`. The values of `γ` at
  negative times play no role. A complete solution is a curve `η` with
  `IsIntegralCurve η (fun _ ↦ f)`, a solution on all of `ℝ`. For a `C¹` field two forward solutions
  from one point agree on `[0, ∞)`, and a forward solution from `x` exists as soon as every
  solution from `x` on a bounded interval `[0, T)` stays in a fixed compact set; both are
  PopulationDynamics 2.1.
- **Existence is part of stability.** Each stability notion of Layer 1 asks for a forward solution
  from every point near the equilibrium as well as a bound on all of them. Without the first
  clause, a point from which every solution escapes in finite time would satisfy any bound
  vacuously (the Check of 1.2).
- **Lie derivative.** For `V : E → ℝ`, the derivative of `V` along `f` at `x` (its Lie derivative)
  is `fderiv ℝ V x (f x)`. Where `V` is differentiable at `γ t` and `γ` is a forward solution, the
  chain rule (Mathlib `HasFDerivAt.comp_hasDerivWithinAt`) makes it the derivative of `V ∘ γ` within
  `[0, ∞)` at `t`. Every statement assumes `V` differentiable wherever this quantity is used, so the
  value `0` that `fderiv` takes at a point of non-differentiability never occurs.
- **Linearization.** Layer 5 works on `n → ℝ` for a finite type `n`, with Mathlib's sup norm. The
  Jacobian of `f` at `x₀` is a matrix `A : Matrix n n ℝ` with `fderiv ℝ f x₀ v = A *ᵥ v` for all
  `v`, and the eigenvalues of `A` are the elements of `spectrum ℂ (A.map (algebraMap ℝ ℂ))`, as in
  LinearSystemsAndControl 5.1. The condition that all of them have negative real part is that
  roadmap's `IsHurwitz A`, written out in full in the statements here.
- **Junk values.** The `ε`-thickening of the empty set is empty, so the conclusion of LaSalle's
  principle (3.3) cannot hold vacuously. The cocompact filter of a zero-dimensional space is the
  bottom filter, so radial unboundedness holds there trivially; every statement is true in that
  case, where every curve is constant.

## Layer 1: stability of an equilibrium

### 1.1 Forward solutions

Define `forwardSolutions f x` as the set of curves `γ` with `γ 0 = x` and
`IsIntegralCurveOn γ (fun _ ↦ f) (Set.Ici 0)`.

- If `γ ∈ forwardSolutions f x` and `s ≥ 0`, the shifted curve `t ↦ γ (t + s)` lies in
  `forwardSolutions f (γ s)` (Mathlib `IsIntegralCurveOn.comp_add` and `IsIntegralCurveOn.mono`).
- For a `C¹` field the set has at most one element on `[0, ∞)`: two members agree at every
  `t ≥ 0` (PopulationDynamics 2.1).
- A complete solution `η` with `η 0 = x` lies in `forwardSolutions f x`.

**Checks.**
- For `f x = x²` on `ℝ` and `x = a > 0` the set is empty: the solution `a/(1 − a t)` leaves every
  compact set before time `1/a`. For `a ≤ 0` it contains `a/(1 − a t)`, which tends to `0`.
- For `f x = −x` it contains `t ↦ x e^(−t)`, and for `f = 0` the constant curve.

*Needs:* Mathlib `IsIntegralCurveOn`, `IsIntegralCurveOn.comp_add`, `IsIntegralCurveOn.mono`;
PopulationDynamics 2.1. (Proved here.)

### 1.2 Lyapunov stability

Define `IsLyapunovStable f x₀`: for every `ε > 0` there is `δ > 0` such that for every `x` with
`dist x x₀ < δ` the set `forwardSolutions f x` is nonempty and every member `γ` has
`dist (γ t) x₀ < ε` for all `t ≥ 0` (Teschl, §6.5, p. 198; the existence of the solutions is
implicit there). An equilibrium that is not Lyapunov stable is called unstable.

- If `x₀` is Lyapunov stable then `f x₀ = 0`: a forward solution from `x₀` stays within every
  `ε > 0` of `x₀`, so it is constant on `[0, ∞)`, and its derivative within `[0, ∞)` at `0`,
  which is `f x₀`, vanishes.
- For a `C¹` field, `x₀` is unstable exactly when there is `ε > 0` such that arbitrarily close to
  `x₀` there are points whose solution reaches distance at least `ε` from `x₀` at some positive
  time (Sontag, Definition 5.8.6, p. 237). A point with no forward solution qualifies, since its
  solutions on bounded intervals leave every compact set by PopulationDynamics 2.1.
- On `ℝ`, the field `f x = a x` has `0` Lyapunov stable if and only if `a ≤ 0` (Teschl, §6.5,
  p. 198).

**Checks.**
- For `f x = x²` on `ℝ`, every forward solution from a point `a ≤ 0` stays in `[a, 0]`, but there
  is none from any `a > 0` (1.1). So `0` is not Lyapunov stable; a definition without the
  existence clause would call it stable, and even asymptotically stable.
- The harmonic oscillator `f (x, y) = (y, −x)` has `0` Lyapunov stable: solutions are rotations,
  so `δ = ε` serves for the Euclidean norm and `δ = ε/√2` for the sup norm of `ℝ × ℝ`.
- For `f x = x` on `ℝ`, the solution `a e^t` from any `a ≠ 0` leaves every bounded set, so `0` is
  unstable.

*Needs:* 1.1; Mathlib `HasDerivWithinAt`, `uniqueDiffWithinAt_Ici`; PopulationDynamics 2.1.
(Proved here.)

### 1.3 Asymptotic stability

Define `IsAsymptoticallyStable f x₀`: `x₀` is Lyapunov stable, and for some `δ > 0` every `x` with
`dist x x₀ < δ` has a forward solution and every forward solution from it tends to `x₀` (Teschl,
§6.5, p. 198). Define `IsGloballyAsymptoticallyStable f x₀`: `x₀` is Lyapunov stable, every `x`
has a forward solution, and every forward solution tends to `x₀` (Sontag, Definition 5.5.2,
p. 211, for systems without controls).

- Global asymptotic stability implies asymptotic stability, with any `δ`.

**Checks.**
- Convergence without stability (Teschl, Problem 6.16, p. 200): the field written in polar
  coordinates as `r' = r (1 − r²)`, `θ' = 2 sin²(θ/2)`, which is `C¹` away from the origin, has
  the equilibrium `(1, 0)`. Every solution starting near it converges to it, but the solution
  from angle `θ₀ > 0` first runs once around the unit circle. Numerically, for `θ₀ = 10⁻¹`,
  `10⁻²` and `10⁻³` with `r = 1`, the distance from `(1, 0)` reaches more than `1.999`. So
  `(1, 0)` satisfies the convergence clause and is not asymptotically stable; the stability
  clause in the definition is not redundant.
- For `f x = −x + x² = x (x − 1)` on `ℝ`, `0` is asymptotically stable: `f` is positive on
  `(−∞, 0)` and negative on `(0, 1)`, so solutions from `(−∞, 1)` move monotonically towards `0`
  and converge to it. It is not globally asymptotically stable: `1` is a second equilibrium, and
  the solution `1/(1 − (1 − 1/a) e^t)` from `a = 1.1` leaves every compact set before time
  `log 11 ≈ 2.398`.

*Needs:* 1.2. (Proved here.)

### 1.4 Exponential stability

Define `IsExponentiallyStable f x₀`: there are `δ > 0`, `C` and `α > 0` such that every `x` with
`dist x x₀ < δ` has a forward solution and every forward solution `γ` from it satisfies
`dist (γ t) x₀ ≤ C e^(−α t) dist x x₀` for all `t ≥ 0` (Teschl, §6.5, equation (6.27), p. 198).

- Exponential stability implies asymptotic stability: the bound tends to `0`, and for a given
  `ε` the radius `min δ (ε / (|C| + 1))` keeps every solution within `ε`.
- On `ℝ`, the field `f x = a x` has `0` exponentially stable if and only if `a < 0` (Teschl, §6.5,
  p. 198).

**Checks.**
- For `f x = −x³` on `ℝ`, `0` is asymptotically stable but not exponentially stable: the solution
  from `a` is `a / √(1 + 2a² t)`, whose absolute value decreases to `0`, and for `a > 0` the
  product of `√t` with it tends to `1/√2`. Numerically, at `t = 10⁴` the products are `0.7053`
  for `a = 0.1` and `0.7070` for `a = 0.5`.
- No sign is imposed on `C`: at `t = 0` the bound forces `C ≥ 1` as soon as some `x ≠ x₀` lies
  within `δ`.

*Needs:* 1.3. (Proved here.)

### Examples

The scalar fields `a x`, `x²`, `−x + x²` and `−x³`, the harmonic oscillator, and Teschl's
attracting but unstable equilibrium on the unit circle.

### Dependencies

PopulationDynamics 2.1; Mathlib `IsIntegralCurveOn`, `IsIntegralCurveOn.comp_add`,
`IsIntegralCurveOn.mono`, `HasDerivWithinAt`, `uniqueDiffWithinAt_Ici`.

## Layer 2: limit sets of bounded solutions

### 2.1 Complete orbits in a set

Define `completeOrbitSet f S` for `S : Set E` as the set of points `y` for which some complete
solution `η` has `η 0 = y` and `η t ∈ S` for every `t : ℝ`.

- It is contained in `S`, and it is monotone in `S`.
- For a `C¹` field it is invariant: if `y` lies in it and `η` is a complete solution through `y`
  inside `S`, then every `η s` lies in it, through the curve `t ↦ η (t + s)`.
- If `S` is compact, it is the largest subset of `S` that is invariant in Teschl's sense (it
  contains, with each point, the whole maximal orbit through it), because an orbit that stays in a
  compact set is defined on all of `ℝ` (Teschl, Lemma 6.3, p. 193, and PopulationDynamics 2.1 in
  both time directions).

**Checks.**
- For `f x = −x` on `ℝ` and `S = [−1, 1]`, the set is `{0}`: the solution `y e^(−t)` through
  `y ≠ 0` leaves `S` as `t → −∞`, although `S` is invariant forward in time.
- For `f x = x²` and `S = ℝ`, the set is `{0}`: every other solution escapes in finite time in
  one direction. So for a noncompact `S` it need not be the largest invariant subset in Teschl's
  sense, which here is `ℝ`.
- For the harmonic oscillator and `S` the unit circle, the set is the whole circle.

*Needs:* Mathlib `IsIntegralCurve`, `IsIntegralCurve.comp_add`; PopulationDynamics 2.1.
(Proved here.)

### 2.2 The ω-limit set of a bounded solution

Let `γ` be a forward solution whose values `γ '' Set.Ici 0` form a bounded set, and let `Ω` be its
ω-limit set `{y | MapClusterPt y atTop γ}`, the convention of Tau Ceti's
`TauCeti.setOf_mapClusterPt_atTop_eq_iInter`. Prove:

- `Ω` is nonempty and compact (Teschl, Lemma 6.6, p. 194);
- every point of `Ω` lies on a complete solution that stays in `Ω`, that is,
  `Ω ⊆ completeOrbitSet f Ω` (Teschl, Lemma 6.5, p. 193, with Lemma 6.3);
- for every `ε > 0`, `γ t` lies in the `ε`-thickening of `Ω` for all large `t` (Teschl,
  Lemma 6.7, p. 194).

Route: by Tau Ceti's `TauCeti.setOf_mapClusterPt_atTop_eq_iInter`, `Ω` is the intersection of
the closures of the tails `γ '' Set.Ici T`, a decreasing family of nonempty compact sets
(`Metric.isCompact_of_isClosed_isBounded`), so it is compact and nonempty
(`IsCompact.exists_mapClusterPt`). For the third claim, a sequence of times along which `γ` stays
`ε` away from `Ω` has a convergent subsequence, whose limit lies in `Ω`. For invariance, let
`γ (tₖ) → y` with `tₖ → ∞`. Mathlib's `IsPicardLindelof.of_contDiffAt_one` and
`IsPicardLindelof.exists_forall_mem_closedBall_eq_hasDerivWithinAt_lipschitzOnWith` give, for some
`τ > 0` and `r > 0`, solutions on `[−τ, τ]` from every point of the closed ball of radius `r`
about `y`, Lipschitz in the starting point. By uniqueness (PopulationDynamics 2.1),
`γ (tₖ + s)` is the value at time `s` of the solution from `γ (tₖ)`, so it converges to the value
at time `s` of the solution from `y`, which therefore lies in `Ω` for `|s| ≤ τ`. Applied at every
point of `Ω`, this makes the set of times at which a solution through `y` lies in `Ω` open as well
as closed in its interval of existence, so the solution stays in the compact set `Ω`, and
PopulationDynamics 2.1, forwards and backwards in time, extends it to all of `ℝ`.

**Checks.**
- For `f = 1` on `ℝ` the solution `γ t = x + t` is unbounded and has `Ω = ∅`: boundedness is
  needed for the first claim.
- For `f x = −x`, `Ω = {0}`. For the harmonic oscillator from `(1, 0)`, `Ω` is the unit circle,
  and every point of it lies on the complete solution through it, which stays on the circle.

*Needs:* 1.1, 2.1; Tau Ceti `TauCeti.setOf_mapClusterPt_atTop_eq_iInter`; Mathlib
`MapClusterPt`, `IsCompact.exists_mapClusterPt`, `Metric.isCompact_of_isClosed_isBounded`,
`Metric.thickening`, `IsPicardLindelof.of_contDiffAt_one`,
`IsPicardLindelof.exists_forall_mem_closedBall_eq_hasDerivWithinAt_lipschitzOnWith`;
PopulationDynamics 2.1. (Proved here, after Teschl.)

### Examples

The scalar fields `−x` and `x²`, the constant field `1`, and the harmonic oscillator with its
circular orbits.

### Dependencies

Layer 1 (1.1); Tau Ceti `TauCeti.setOf_mapClusterPt_atTop_eq_iInter`; Mathlib `IsIntegralCurve`,
`IsIntegralCurve.comp_add`, `MapClusterPt`, `IsCompact.exists_mapClusterPt`,
`Metric.isCompact_of_isClosed_isBounded`, `Metric.thickening`,
`IsPicardLindelof.of_contDiffAt_one`,
`IsPicardLindelof.exists_forall_mem_closedBall_eq_hasDerivWithinAt_lipschitzOnWith`;
PopulationDynamics 2.1.

## Layer 3: Lyapunov's direct method and the invariance principle

### 3.1 Lyapunov's stability theorem

Prove `isLyapunovStable_of_lyapunov`: let `f` be `C¹`, `r > 0`, and `V : E → ℝ` differentiable on
the open ball of radius `r` about `x₀`, with `V x₀ = 0`, `V x > 0` for the other points `x` of the
ball, and `fderiv ℝ V x (f x) ≤ 0` on the ball. Then `x₀` is Lyapunov stable (Teschl,
Theorem 6.13 with Lemmas 6.11 and 6.12, p. 201, for a continuous `V` that does not increase along
solutions; the differentiable form is Teschl's (6.40), p. 202).

Route: for `E = 0` there is nothing to prove. Otherwise, given `ε`, take `ρ < min ε r`. The
sphere of radius `ρ` about `x₀` is compact (`isCompact_sphere`) and nonempty, so `V` has a positive
minimum `m` on it; by continuity at `x₀` there is
`δ ≤ ρ` with `V < m` on the ball of radius `δ`. Along a solution from such a point, as long as it
stays in the ball of radius `ρ`, `V ∘ γ` is antitone (Mathlib
`antitoneOn_of_hasDerivWithinAt_nonpos` with the chain rule), hence below `m`, so the solution
never reaches the sphere. Every solution on a bounded interval therefore stays in the closed ball
of radius `ρ`, and PopulationDynamics 2.1 gives the forward solution.

**Checks.**
- `V x₀ = 0` is needed: for `f x = x` on `ℝ` and `V x = 1 − x²`, the derivative along `f` is
  `−2x² ≤ 0` and `V > 0` on `(−1, 1)`, but `0` is unstable.
- Positivity is needed: for `f x = x` and `V x = −x²`, the derivative along `f` is `−2x² ≤ 0` and
  `V 0 = 0`, but `0` is unstable.
- For the harmonic oscillator and `V (x, y) = x² + y²`, the derivative along `f` is
  `2xy − 2yx = 0`, so `0` is stable (Teschl, Example on p. 202).
- For the predator–prey field `(x (α − β y), y (δ x − γ))` with positive parameters, let `H` be the
  first integral `δ x − γ log x + β y − α log y` of PopulationDynamics 2.3, which has a strict
  minimum at the equilibrium `(γ/δ, α/β)`. Its derivative along the field is
  `(δ x − γ)(α − β y) + (β y − α)(δ x − γ) = 0`, so `V = H − H(γ/δ, α/β)` on a ball inside the
  open quadrant makes the equilibrium Lyapunov stable.
- The hypotheses force `f x₀ = 0`, as Lyapunov stability does (1.2), so the statement does not
  assume it.

*Needs:* 1.2; Mathlib `isCompact_sphere`, `IsCompact.exists_isMinOn`,
`antitoneOn_of_hasDerivWithinAt_nonpos`, `HasFDerivAt.comp_hasDerivWithinAt`;
PopulationDynamics 2.1. (Proved here, after Teschl.)

### 3.2 Lyapunov's asymptotic stability theorem

Prove `isAsymptoticallyStable_of_lyapunov`: under the hypotheses of 3.1, with
`fderiv ℝ V x (f x) < 0` for every point `x ≠ x₀` of the ball, `x₀` is asymptotically stable
(Teschl, Theorem 6.14, p. 202, which assumes only that `V` is not constant on any orbit in the
punctured ball).

Route: by 3.1, solutions from a small ball stay in a compact set `K` inside the ball of radius `r`,
and `V ∘ γ` decreases to a limit `c ≥ 0`. On the ω-limit set `Ω`, which is nonempty and lies in
`K` (2.2), `V` equals `c` by continuity. If `c > 0`, a point `y ∈ Ω` differs from `x₀`; the
complete solution through `y` inside `Ω` (2.2) keeps `V` equal to `c`, so the derivative of `V`
along `f` vanishes at `y`, which contradicts the hypothesis. So `c = 0`, every point of `Ω` is
`x₀`, and `γ → x₀` by the third claim of 2.2. The route needs no continuity of the derivative
of `V`.

**Checks.**
- Strictness is needed: for the harmonic oscillator with `V = x² + y²` the derivative along `f`
  is `0`, the solutions are circles, and `0` is stable but not asymptotically stable. The same
  holds for the predator–prey equilibrium of the Check of 3.1, since `H` is constant along
  solutions.
- For `f x = −x³` and `V x = x²` the derivative along `f` is `−2x⁴`, negative away from `0`, so
  `0` is asymptotically stable although the derivative of `f` at `0` vanishes (compare 5.2).

*Needs:* 2.2, 3.1; Mathlib `HasFDerivAt.comp_hasDerivAt`. (Proved here, after Teschl.)

### 3.3 LaSalle's invariance principle

Prove `eventually_mem_thickening_completeOrbitSet`: let `f` be `C¹`, `V : E → ℝ` differentiable,
and `γ` a forward solution with `γ '' Set.Ici 0` bounded and `fderiv ℝ V (γ t) (f (γ t)) ≤ 0` for
all `t ≥ 0`. Let `Z` be the set `{x | fderiv ℝ V x (f x) = 0}`. Then for every `ε > 0`, `γ t`
lies in the `ε`-thickening of `completeOrbitSet f Z` for all large `t`. In particular
`completeOrbitSet f Z` is nonempty. (Teschl, Theorem 6.15 with Lemmas 6.5 to 6.7, pp. 193–202,
which together give the statement; the principle is due to LaSalle and to Krasovskii.)

Route: `V ∘ γ` is antitone and bounded below, since `V` is continuous on the compact closure of the
orbit, so it tends to a limit `c`, and `V = c` on the ω-limit set `Ω`. By 2.2 each `y ∈ Ω` lies on
a complete solution `η` inside `Ω`; `V ∘ η` is the constant `c`, so its derivative, the derivative
of `V` along `f` at `η t`, vanishes for every `t`. Hence `Ω ⊆ completeOrbitSet f Z`, and the third
claim of 2.2 concludes.

**Checks.**
- Boundedness is needed: for `f = 1` on `ℝ` and `V x = −x`, the derivative along `f` is `−1`,
  so `Z` and `completeOrbitSet f Z` are empty and the conclusion fails for the solution
  `x + t`.
- For the damped oscillator `f (x₁, x₂) = (x₂, −x₁ − x₂)` and `V = x₁² + x₂²`, the derivative
  along `f` is `−2x₂²`, so `Z` is the line `x₂ = 0`. A complete solution in `Z` has `x₂ = 0`
  throughout, hence `x₁ = −x₂' = 0`, so `completeOrbitSet f Z = {0}` and every solution, bounded
  since `V` does not increase, tends to `0` (Sontag, Example 5.7.11, p. 228). Numerically the
  solutions from `(1, 0)`, `(5, −3)` and `(−10, 10)` are within `10⁻¹²` of `0` at `t = 60`.
- For a constant `V` the set `Z` is all of `E`, and the conclusion says only that `γ`
  approaches points on complete orbits, which 2.2 already gives.

*Needs:* 2.1, 2.2; Mathlib `antitoneOn_of_hasDerivWithinAt_nonpos`,
`HasFDerivAt.comp_hasDerivWithinAt`, `Metric.thickening`. (Proved here, after Teschl.)

### 3.4 Global asymptotic stability

Prove `isGloballyAsymptoticallyStable_of_lyapunov` (the Barbashin–Krasovskii theorem): let `f` be
`C¹` and `V : E → ℝ` differentiable, with `V x₀ = 0`, `V x > 0` for `x ≠ x₀`,
`Tendsto V (cocompact E) atTop` (radial unboundedness), and `fderiv ℝ V x (f x) ≤ 0` for every
`x`. Suppose that every forward solution `γ` with `fderiv ℝ V (γ t) (f (γ t)) = 0` for all `t ≥ 0`
satisfies `γ t = x₀` for all `t ≥ 0`. Then `x₀` is globally asymptotically stable (Sontag,
Lemma 5.7.8, p. 226, with Theorem 17, p. 220, and Remark 5.7.2, p. 220, for radial unboundedness;
there `V` is continuously differentiable).

Route: stability is 3.1. Every sublevel set `{V ≤ c}` is closed and, by radial unboundedness,
bounded, hence compact; a solution from `x` stays in `{V ≤ V x}`, so it exists on `[0, ∞)` by
PopulationDynamics 2.1 and is bounded. By 3.3 it approaches `completeOrbitSet f Z`. A complete
solution `η` in `Z` restricts to a forward solution along which the derivative of `V` along `f`
vanishes, so `η 0 = x₀` by the hypothesis. Hence `completeOrbitSet f Z ⊆ {x₀}`, and the
thickenings of a subset of `{x₀}` are balls about `x₀`, so `γ → x₀`.

**Checks.**
- If the derivative of `V` along `f` is negative at every `x ≠ x₀`, the hypothesis on forward
  solutions holds, since such a solution stays in `{x₀}`.
- The damped oscillator of 3.3, with `V = x₁² + x₂²`, which is radially unbounded: `0` is
  globally asymptotically stable (Sontag, Example 5.7.11, p. 228).
- Radial unboundedness is needed. For
  `f (x₁, x₂) = (−6x₁/(1 + x₁²)² + 2x₂, −2(x₁ + x₂)/(1 + x₁²)²)` and
  `V = x₁²/(1 + x₁²) + x₂²`, which tends to `1 + x₂²`, not to infinity, along `x₂` fixed, the
  derivative of `V` along `f` is `−4(x₁⁴x₂² + 2x₁²x₂² + 3x₁² + x₂²)/(1 + x₁²)⁴`, negative away
  from `0`. So `0` is asymptotically stable by 3.2, but not globally: numerically the solution
  from `(3, 2)` has `x₁ > 3.9 · 10⁴` at `t = 10⁴` while `x₂` stays near `2`, and those from
  `(5, 1)` and `(2, 4)` also have `x₁` above `10⁴` there.

*Needs:* 3.1, 3.3; Mathlib `Filter.cocompact`, `Metric.isCompact_of_isClosed_isBounded`;
PopulationDynamics 2.1. (Proved here, after Sontag.)

### Examples

The harmonic and damped oscillators, the scalar fields `x`, `−x³` and `1`, the predator–prey
equilibrium of PopulationDynamics, and a field whose Lyapunov function is not radially unbounded.

### Dependencies

Layers 1 (1.2) and 2 (2.1, 2.2), as stated in 3.1 to 3.4; PopulationDynamics 2.1; Mathlib
`isCompact_sphere`, `IsCompact.exists_isMinOn`, `antitoneOn_of_hasDerivWithinAt_nonpos`,
`HasFDerivAt.comp_hasDerivWithinAt`, `HasFDerivAt.comp_hasDerivAt`, `Metric.thickening`, `Filter.cocompact`,
`Metric.isCompact_of_isClosed_isBounded`.

## Layer 4: instability

### 4.1 Chetaev's instability theorem

Prove `not_isLyapunovStable_of_chetaev`: let `f` be `C¹`, `r > 0`, and `V : E → ℝ` with
`ContDiffOn ℝ 1 V` on the open ball of radius `r` about `x₀`. Suppose `x₀` lies in the closure of
`{x | 0 < V x}` and `fderiv ℝ V x (f x) > 0` at every point `x` of the ball with `V x > 0`. Then
`x₀` is not Lyapunov stable. (Chetaev's theorem; proved here. Sontag, Theorem 20, p. 237, is the
special case in which the derivative of `V` along `f` is at least `c V` on the ball for some
`c > 0`.)

Route: suppose `x₀` is stable, and take `δ` for `ε = r/2`. Pick `x` within `δ` with
`V x = a > 0`, and its forward solution `γ`, which stays in the closed ball `B` of radius `r/2`.
On the compact set `B ∩ {V ≥ a}`, which lies in the open ball where `fderiv ℝ V` is continuous,
the derivative of `V` along `f` is continuous and positive, so at least some `m > 0`. As long as `V (γ t) ≥ a`, `V ∘ γ` increases, so `V (γ t) ≥ a` for all
`t ≥ 0`, and then `V (γ t) ≥ a + m t`. This contradicts the boundedness of `V` on `B`. The value
`V x₀` and the condition `f x₀ = 0` are not used.

**Checks.**
- For the saddle `f (x, y) = (x, −y)` and `V = x² − y²`, the derivative along `f` is
  `2x² + 2y² > 0` off the origin, and `V (s, 0) = s² > 0`, so `0` is unstable.
- For `f x = x³` and `V x = x²`, the derivative along `f` is `2x⁴ > 0` where `V > 0`, so `0` is
  unstable, although the derivative of `f` at `0` vanishes (compare 5.3).
- The closure hypothesis is needed: for `f x = −x` and `V x = −x²` the set `{V > 0}` is empty,
  the condition on the derivative holds vacuously, and `0` is stable.

*Needs:* 1.2; Mathlib `IsCompact.exists_isMinOn`, `HasFDerivAt.comp_hasDerivWithinAt`,
`ContDiffOn.continuousOn_fderiv_of_isOpen`, `monotoneOn_of_hasDerivWithinAt_nonneg`,
`isCompact_closedBall`. (Proved here.)

### Examples

The saddle, and the scalar field `x³`.

### Dependencies

Layer 1 (1.2); Mathlib `IsCompact.exists_isMinOn`, `HasFDerivAt.comp_hasDerivWithinAt`,
`ContDiffOn.continuousOn_fderiv_of_isOpen`, `monotoneOn_of_hasDerivWithinAt_nonneg`,
`isCompact_closedBall`.

## Layer 5: Lyapunov's indirect method

### 5.1 An indefinite Lyapunov equation

Let `A : Matrix n n ℝ` have an eigenvalue with positive real part. Prove that there are a matrix
`P` with `Pᵀ = P`, a real `c > 0` and a positive definite `Q` with `Aᵀ P + P A = c P + Q`, and a
vector `x` with `x ⬝ᵥ P *ᵥ x > 0` (Sontag, Proposition 5.8.5, p. 236).

Route (Sontag's): let `c` be the least positive real part of an eigenvalue of `A`, and
`B = A − (c/2) I`. No eigenvalue of `B` lies on the imaginary axis, and some has positive real part.
Split the characteristic polynomial of `B` as `p₊ p₋`, with real coefficients, according to the sign
of the real parts of its complex roots; the factors are coprime, so `n → ℝ` is the direct sum of the
`B`-invariant subspaces `ker p₊(B)` and `ker p₋(B)` (Mathlib
`Polynomial.sup_ker_aeval_eq_ker_aeval_mul_of_coprime`,
`Polynomial.disjoint_ker_aeval_of_isCoprime`, `Matrix.aeval_self_charpoly`). In a basis adapted to
the splitting, `B` is block diagonal with blocks `D₁` and `D₂`, where `−D₁` and `D₂` are Hurwitz.
LinearSystemsAndControl 5.2 gives positive definite `P₁`, `P₂` with `D₁ᵀ P₁ + P₁ D₁ = I` and
`D₂ᵀ P₂ + P₂ D₂ = −I`. The block matrix with blocks `P₁` and `−P₂`, transported back, is `P`, and
the transport of `I` is `Q`; then `Bᵀ P + P B = Q`, which is `Aᵀ P + P A = c P + Q`, and `P` is
positive on the first summand, which is not zero.

**Checks.**
- For the block diagonal `A` with blocks `[[0, 1], [−1, 0]]` and `[1]`, so with eigenvalues `±i`
  and `1`: `c = 1`, `P = diag(−1, −1, 1)` and `Q = I` give `Aᵀ P + P A = diag(0, 0, 2) = c P + Q`,
  and `P` is positive on the third basis vector.
- For `A = diag(1, 0)`: `c = 1`, `P = diag(1, −1)` and `Q = I` give
  `Aᵀ P + P A = diag(2, 0) = c P + Q`. Here `B = diag(1/2, −1/2)` has two eigenvalues with sum
  zero, and the equation `Bᵀ P + P B = Q` leaves the off-diagonal entry of `P` free.
- The hypothesis is needed: for the rotation generator `[[0, 1], [−1, 0]]` and any `c > 0`,
  `H = A − (c/2) I` is Hurwitz, the equation reads `Hᵀ (−P) + (−P) H = −Q`, and by
  LinearSystemsAndControl 5.2 its only solution `−P` is the integral
  `∫₀^∞ exp (t Hᵀ) Q exp (t H) dt`, which is positive definite for positive definite `Q`; so `P` is
  negative definite. For `c = 1` and `Q = I` it is `P = −I`.
- Numerically, on random real matrices of sizes one to five with an eigenvalue of positive real
  part, some of them also with eigenvalues on the imaginary axis, the construction of the route
  gives a symmetric `P`, a positive definite `Q` and a vector with `x ⬝ᵥ P *ᵥ x > 0` satisfying
  the equation to rounding error.

*Needs:* LinearSystemsAndControl 5.1, 5.2; Mathlib `Matrix.PosDef`, `spectrum`,
`Matrix.mem_spectrum_iff_isRoot_charpoly`, `Matrix.aeval_self_charpoly`,
`Polynomial.sup_ker_aeval_eq_ker_aeval_mul_of_coprime`,
`Polynomial.disjoint_ker_aeval_of_isCoprime`. (Proved here, after Sontag.)

### 5.2 Exponential stability from the linearization

Prove `isExponentiallyStable_of_re_neg`: let `f : (n → ℝ) → n → ℝ` be `C¹` with `f x₀ = 0` and
`fderiv ℝ f x₀ v = A *ᵥ v` for all `v`. If every `μ ∈ spectrum ℂ (A.map (algebraMap ℝ ℂ))` has
`μ.re < 0`, then `x₀` is exponentially stable (Teschl, Theorem 6.10, p. 199, and Corollary 3.27,
p. 101).

Route (Sontag, proof of Theorem 19, p. 234): LinearSystemsAndControl 5.2 gives a positive definite
`P` with `Aᵀ P + P A = −I`. Put `V x = (x − x₀) ⬝ᵥ P *ᵥ (x − x₀)` and `f x = A *ᵥ (x − x₀) + g x`,
where `g x = o(‖x − x₀‖)` (Mathlib `hasFDerivAt_iff_isLittleO_nhds_zero`). The derivative of `V`
along `f` is `−w ⬝ᵥ w + 2 w ⬝ᵥ P *ᵥ g x` with `w = x − x₀`, which on a small ball is at most
`−(w ⬝ᵥ w)/2`, hence at most `−κ V x` for some `κ > 0`. So `e^(κ t) V (γ t)` does not increase,
solutions from a smaller ball stay in a compact sublevel set and exist on `[0, ∞)`
(PopulationDynamics 2.1), and `V (γ t) ≤ e^(−κ t) V x`; comparing `V` with the square of the norm
gives the bound with `α = κ/2`.

**Checks.**
- `f x₀ = 0` is needed: for `f x = −x + 1` on `ℝ` and `x₀ = 0`, the derivative is `−1`, but `0` is
  not an equilibrium and is not stable.
- The damped pendulum `f (x₁, x₂) = (x₂, −sin x₁ − x₂)` at `0` has Jacobian `[[0, 1], [−1, −1]]`,
  with eigenvalues `(−1 ± i√3)/2`, and `P = [[3/2, 1/2], [1/2, 1]]` solves `Aᵀ P + P A = −I`. So
  `0` is exponentially stable; numerically the solution from `(0.5, 0)` decays like `e^(−t/2)`
  (fitted rate `−0.501`).
- Exponential stability is local: for `f x = −x + x²` the equilibrium `0` is exponentially stable,
  but not globally asymptotically stable (1.3).
- Negative real parts are needed: `f x = −x³` has Jacobian `0` and `0` is asymptotically stable
  but not exponentially stable (1.4); `f x = x³` also has Jacobian `0`, and `0` is unstable (4.1).

*Needs:* 1.4; LinearSystemsAndControl 5.1, 5.2; Mathlib `hasFDerivAt_iff_isLittleO_nhds_zero`,
`Matrix.PosDef`, `antitoneOn_of_hasDerivWithinAt_nonpos`, `HasFDerivAt.comp_hasDerivWithinAt`;
PopulationDynamics 2.1. (Proved here, after Sontag.)

### 5.3 Instability from the linearization

Prove `not_isLyapunovStable_of_re_pos`: let `f : (n → ℝ) → n → ℝ` be `C¹` with
`fderiv ℝ f x₀ v = A *ᵥ v` for all `v`. If some `μ ∈ spectrum ℂ (A.map (algebraMap ℝ ℂ))` has
`μ.re > 0`, then `x₀` is not Lyapunov stable (Sontag, Corollary 5.8.7, p. 238).

Route: if `f x₀ ≠ 0`, `x₀` is not stable by 1.2. Otherwise take `P`, `c`, `Q` from 5.1 and
`V x = (x − x₀) ⬝ᵥ P *ᵥ (x − x₀)`. With `f x = A *ᵥ (x − x₀) + g x` as in 5.2, the derivative of
`V` along `f` is `c V x + (x − x₀) ⬝ᵥ Q *ᵥ (x − x₀) + 2 (x − x₀) ⬝ᵥ P *ᵥ g x`, which on a small
ball is at least `c V x` plus a positive multiple of `‖x − x₀‖²`, hence positive where `V > 0`.
Since `V (x₀ + s y) = s² (y ⬝ᵥ P *ᵥ y)`, the point `x₀` lies in the closure of `{V > 0}`, and 4.1
applies.

**Checks.**
- The inverted pendulum `f (x₁, x₂) = (x₂, sin x₁)` at `0` has Jacobian `[[0, 1], [1, 0]]` with
  eigenvalues `±1`, so `0` is unstable. For `f x = x − x³` the Jacobian at `0` is `[1]`, and `0` is
  unstable while `±1` are exponentially stable by 5.2.
- Complex eigenvalues are needed: `A = [[1, −1], [1, 1]]` has the eigenvalues `1 ± i` and no real
  eigenvalue, and `0` is unstable for `f x = A *ᵥ x`, whose solutions grow like `e^t`; a hypothesis
  on real eigenvalues only would not apply.
- Positive real part is needed: `f x = −x³` and `f x = x³` both have Jacobian `0` and differ in
  stability (Teschl, equation (6.30), p. 199).

*Needs:* 1.2, 4.1, 5.1; Mathlib `hasFDerivAt_iff_isLittleO_nhds_zero`, `Matrix.PosDef`.
(Proved here, after Sontag.)

### Examples

The damped and the inverted pendulum, the scalar fields `x − x³`, `−x + x²` and `±x³`, the
planar field with eigenvalues `1 ± i`, and the matrices of 5.1.

### Dependencies

Layers 1 (1.2, 1.4) and 4 (4.1), as stated in 5.2 and 5.3; LinearSystemsAndControl 5.1, 5.2;
PopulationDynamics 2.1; Mathlib `Matrix.PosDef`, `spectrum`,
`Matrix.mem_spectrum_iff_isRoot_charpoly`, `Matrix.aeval_self_charpoly`,
`Polynomial.sup_ker_aeval_eq_ker_aeval_mul_of_coprime`,
`Polynomial.disjoint_ker_aeval_of_isCoprime`, `hasFDerivAt_iff_isLittleO_nhds_zero`,
`antitoneOn_of_hasDerivWithinAt_nonpos`, `HasFDerivAt.comp_hasDerivWithinAt`.

## Scope and ownership

This roadmap owns the definitions and theorems stated above: forward solutions and the Lyapunov,
asymptotic, global asymptotic and exponential stability of an equilibrium, with existence of
solutions built into each notion; the set of complete orbits inside a set and the invariance of the
ω-limit set of a bounded forward solution; Lyapunov's stability and asymptotic stability theorems,
LaSalle's invariance principle and the Barbashin–Krasovskii theorem; Chetaev's instability theorem;
the indefinite Lyapunov equation of 5.1; and the two theorems of Lyapunov's indirect method.

Already in the libraries and therefore not targets:

- Integral curves of vector fields on normed spaces (`IsIntegralCurveOn`, `IsIntegralCurve`), the
  Picard–Lindelöf theorem with local flows that are Lipschitz in the initial point, and the
  uniqueness of solutions, in Mathlib (`Mathlib/Analysis/ODE/`). Mathlib's `omegaLimit` of a set
  under a flow and its invariance, in `Mathlib/Dynamics/OmegaLimit.lean`.
- In Tau Ceti: the ω-limit set of a curve as a set of cluster points, its description as an
  intersection of closures, and its preconnectedness (`TauCeti/Topology/OmegaLimit.lean`), where
  `Flow.mapClusterPt_atTop_flow` also shows that the ω-limit set of an orbit of a flow of `ℝ` is
  invariant under the flow. That needs a global flow; 2.2 proves the invariance for a bounded
  forward solution of a `C¹` field, which need not generate one. For a flow of `ℝ` on a compact
  Hausdorff space and a continuous function antitone along every orbit, every orbit converges to
  a point of a finite set containing the points along whose orbits the function is constant
  (`Flow.exists_tendsto_atTop_of_antitone`), and a strict global minimum of such a function is a
  fixed point (`Flow.fixed_of_antitone_of_strictMin`), in `TauCeti/Dynamics/Flow/Lyapunov.lean`.
  These need a global flow on a compact space; the theorems above concern a `C¹` field on a
  noncompact `E` whose solutions may exist only forward in time, arbitrary sets where the
  derivative of `V` along `f` vanishes, and the stability notions of Layer 1, which that file does
  not define.
- In Tau Ceti: the maximal integral curve of a `C¹` vector field, and the fact that it exists for
  all positive times when its forward part stays in a compact set
  (`Ici_subset_maximalIntegralCurveInterval_of_isCompact_of_mapsTo`,
  `TauCeti/Geometry/Manifold/IntegralCurve/Maximal.lean`). PopulationDynamics 2.1 derives from it
  the existence statement on `[0, ∞)` used here.
- In Tau Ceti: the flow of a globally Lipschitz field (`TauCeti.flowOfLipschitz`,
  `TauCeti/Dynamics/Flow/OfLipschitz.lean`); negative gradient trajectories, along which the
  function decreases (`IsIntegralCurveOn.antitoneOn_comp_neg_gradient`,
  `TauCeti/Analysis/Calculus/Morse/GradientFlow.lean`), and their convergence to a critical point
  when they stay in a compact set with finitely many critical points
  (`TauCeti/Analysis/Calculus/Morse/Convergence.lean`); local stable and unstable sets at a
  hyperbolic equilibrium by the Lyapunov–Perron method (`TauCeti/Analysis/ODE/LyapunovPerron/`).
  Gradient systems are therefore not treated separately here, and 5.3 does not assume
  hyperbolicity. With the projection of those files taken to be the identity, they show that a
  forward solution of `y' = A y + N y` staying in a small closed ball about `0` tends to `0`
  (`ContinuousLinearMap.tendsto_of_isIntegralCurveOn_mapsTo_closedBall`), and that a bounded one
  decays exponentially when `N` is globally Lipschitz with a small constant
  (`ContinuousLinearMap.norm_le_of_isIntegralCurveOn_of_bounded`), for an operator `A` given with
  an exponential bound on `exp (t • A)` and `N 0 = 0`. Through a cut-off of the nonlinearity this
  is an alternative route to 5.2; 5.2 itself starts from the eigenvalues of the Jacobian matrix,
  asks for a forward solution from every nearby point and bounds every forward solution, none of
  which those files state.

Left to other roadmaps:

- LinearSystemsAndControl (an open roadmap, not on main, on which this one depends) owns Hurwitz
  matrices (its 5.1) and the Lyapunov equation `Aᵀ P + P A = −Q` for Hurwitz `A` (its 5.2). This
  roadmap consumes both and restates neither; its 5.1 concerns the indefinite equation for a
  matrix with an eigenvalue of positive real part, which that roadmap does not state.
- PopulationDynamics (an open roadmap, not on main, on which this one depends) owns, in its 2.1,
  the existence of a solution on `[0, ∞)` from an a priori bound in a compact set and the
  uniqueness of solutions of a `C¹` field, which every layer here uses. Its predator–prey system
  (its 2.3) appears above only in Checks; none of its theorems is restated.

Not treated here: converse Lyapunov theorems, input-to-state stability, time-dependent fields and
uniform stability, fields on open subsets or manifolds, stability of periodic orbits, the
Hartman–Grobman theorem and center manifolds, discrete-time systems, the Poincaré–Bendixson theorem,
structural stability, stochastic stability, numerical integration, and optimal control.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Analysis/ODE/Basic.lean`: `IsIntegralCurveOn γ v s`, which is
  `∀ t ∈ s, HasDerivWithinAt γ (v t (γ t)) s t`; `IsIntegralCurve γ v`, which is
  `∀ t, HasDerivAt γ (v t (γ t)) t`; `IsIntegralCurveOn.mono`.
  `Mathlib/Analysis/ODE/Transform.lean`: `IsIntegralCurveOn.comp_add` and `IsIntegralCurve.comp_add`
  (translation of time).
- `Mathlib/Analysis/ODE/PicardLindelof.lean`: `IsPicardLindelof.of_contDiffAt_one` (a field that is
  `C¹` at `x₀` satisfies the Picard–Lindelöf hypotheses on some time interval `[t₀ − ε, t₀ + ε]`
  and ball about `x₀`, for every `t₀`). `Mathlib/Analysis/ODE/ExistUnique.lean`:
  `IsPicardLindelof.exists_forall_mem_closedBall_eq_hasDerivWithinAt_lipschitzOnWith` (a local
  flow on a closed ball, Lipschitz in the initial point at each time).
- `Mathlib/Analysis/Calculus/Deriv/Comp.lean`: `HasFDerivAt.comp_hasDerivWithinAt` and
  `HasFDerivAt.comp_hasDerivAt` (chain rule).
  `Mathlib/Analysis/Calculus/Deriv/MeanValue.lean`: `antitoneOn_of_hasDerivWithinAt_nonpos` and
  `monotoneOn_of_hasDerivWithinAt_nonneg` (on a convex set, a continuous function with
  nonpositive, respectively nonnegative, derivative within the interior is antitone, respectively
  monotone). `Mathlib/Analysis/Calculus/ContDiff/Defs.lean`:
  `ContDiffOn.continuousOn_fderiv_of_isOpen` (a `C¹` function on an open set has continuous
  derivative there).
  `Mathlib/Analysis/Calculus/FDeriv/Basic.lean`: `hasFDerivAt_iff_isLittleO_nhds_zero`.
  `Mathlib/Analysis/Calculus/TangentCone/Real.lean`: `uniqueDiffWithinAt_Ici`.
- `Mathlib/Topology/Defs/Filter.lean`: `MapClusterPt`; `Filter.cocompact` (generated by the
  complements of compact sets). `Mathlib/Topology/Compactness/Compact.lean`:
  `IsCompact.exists_mapClusterPt`. `Mathlib/Topology/Order/Compact.lean`:
  `IsCompact.exists_isMinOn`. `Mathlib/Topology/MetricSpace/Thickening.lean`: `Metric.thickening`
  (the points at distance less than `ε` from a set). `Mathlib/Topology/MetricSpace/Bounded.lean`:
  `Metric.isCompact_of_isClosed_isBounded` (in a proper space).
  `Mathlib/Topology/MetricSpace/ProperSpace.lean`: `isCompact_sphere` and `isCompact_closedBall`
  (in a proper space; a finite-dimensional real normed space is proper).
- `Mathlib/Algebra/Algebra/Spectrum/Basic.lean`: `spectrum`.
  `Mathlib/LinearAlgebra/Matrix/PosDef.lean`: `Matrix.PosDef` (Hermitian, hence symmetric over `ℝ`,
  with positive quadratic form). `Mathlib/LinearAlgebra/Matrix/Charpoly/Eigs.lean`:
  `Matrix.mem_spectrum_iff_isRoot_charpoly`. `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean`:
  `Matrix.aeval_self_charpoly` (Cayley–Hamilton). `Mathlib/RingTheory/Polynomial/Basic.lean`:
  `Polynomial.sup_ker_aeval_eq_ker_aeval_mul_of_coprime` and
  `Polynomial.disjoint_ker_aeval_of_isCoprime` (for coprime `p`, `q`, the kernels of `p(B)` and
  `q(B)` are independent and span the kernel of `(p q)(B)`).

### From Tau Ceti

- `TauCeti/Topology/OmegaLimit.lean`: `TauCeti.setOf_mapClusterPt_atTop_eq_iInter` (for every
  `u : ℝ → X` and `a`, the set of cluster points of `u` along `atTop` is the intersection over
  `T ≥ a` of the closures of `u '' Set.Ici T`).

### From TauCetiRoadmap.LinearSystemsAndControl

- Section 5.1: `IsHurwitz A` for `A : Matrix n n ℝ`, meaning that every
  `μ ∈ spectrum ℂ (A.map (algebraMap ℝ ℂ))` has `μ.re < 0`. The statements of 5.2 write this
  condition out, since a roadmap's Lean file does not import another roadmap's.
- Section 5.2: `isHurwitz_iff_forall_posDef_exists_posDef` (`A` is Hurwitz if and only if for every
  positive definite `Q` some positive definite `P` has `Aᵀ P + P A = −Q`), and `lyapunov_eq_iff`
  (for Hurwitz `A`, the only solution of `Aᵀ P + P A = −Q` is the entrywise integral
  `∫₀^∞ exp (t • Aᵀ) Q exp (t • A) dt`), used in a Check of 5.1.

### From TauCetiRoadmap.PopulationDynamics

- Section 2.1: for a `C¹` vector field on a real Banach space, a compact set `K` and a point `x₀`
  such that every solution on a bounded interval `[0, T)` starting at `x₀` stays in `K`, there is a
  solution on `[0, ∞)` starting at `x₀`; two solutions on `[0, T]` with the same initial value
  agree; both hold backwards in time.

## References

- Gerald Teschl, *Ordinary Differential Equations and Dynamical Systems*, Graduate Studies in
  Mathematics 140, American Mathematical Society, 2012; the author's preliminary version, made
  available on his page at the University of Vienna with the publisher's permission. Cited: §6.3,
  Lemmas 6.3, 6.5, 6.6, 6.7 (pp. 193–194); §6.5, the definitions, equation (6.27), Theorem 6.10,
  equation (6.30) and Problem 6.16 (pp. 198–200); §6.6, Theorems 6.13 to 6.15 and the example on
  p. 202 (pp. 201–202); Corollary 3.27 (p. 101).
- Eduardo D. Sontag, *Mathematical Control Theory: Deterministic Finite Dimensional Systems*,
  second edition, Texts in Applied Mathematics 6, Springer, 1998; the PDF on the author's site.
  Cited: Definition 5.5.2 (p. 211); Remark 5.7.2 and Theorem 17 (p. 220); Lemma 5.7.8 (p. 226);
  Example 5.7.11 (p. 228); Theorem 19 (p. 234); Proposition 5.8.5 (p. 236); Definition 5.8.6 and
  Theorem 20 (p. 237); Corollary 5.8.7 (p. 238).
- The theorems carry their customary attributions: A. M. Lyapunov (1892) for the direct and
  indirect methods, E. A. Barbashin and N. N. Krasovskii (1952) for 3.4, J. P. LaSalle (1960) and
  N. N. Krasovskii for the invariance principle, and N. G. Chetaev (1934) for 4.1. These works
  were not consulted, and no locator is given for them.

# Closed exponential cone and elementary conic representations

Build a reusable real exponential cone with its exact zero face, then use its sections to
represent exponential, logarithmic and softplus inequalities. The main applications are
positive-scale perspectives and finite sums of nonnegatively weighted exponential terms.
Scalar process and logistic-cost substitutions exercise the same API.

This is a specification for the mathematics, independent of any existing implementation.
`Suggested.lean` gives selected interfaces in the namespace `ExponentialCone`. The markdown
is definitive; the suggested signatures do not exhaust the basic API requested below.

## Conventions and native foundations

Use `Space = ℝ × ℝ × ℝ`, the right-associated product, with coordinates `(u,v,w)` in the order
(epigraph height, perspective scale, exponent numerator). In particular its projections are
`q.1`, `q.2.1`, `q.2.2`. Let

```text
positive = {(u,v,w) | 0 < v ∧ v * exp(w/v) ≤ u}.
```

Use the existing Mathlib bundle `PointedCone ℝ Space` for `cone`. Its carrier must be exactly

```text
K = {(u,v,w) | (0 < v ∧ v * exp(w/v) ≤ u) ∨ (v = 0 ∧ 0 ≤ u ∧ w ≤ 0)}.
```

A concrete native construction is
`cone := (PointedCone.hull ℝ positive).closure`, followed by the carrier theorem
`mem_cone_iff` identifying it with `K`. The equality `closure positive = (cone : Set Space)`
is a required result, rather than an assumption about the construction. The positive branch
is a `Set Space`: it excludes the origin. No quotient evaluated at scale zero defines `K`.

Mathlib's `PointedCone` is a submodule over nonnegative scalars; its terminology means that
the cone contains zero. It does not assert the stronger no-lines property called `Salient`.
Use its existing zero/addition/scalar membership, coercion, extensionality and convexity APIs.
Closedness of the displayed native construction follows from closure. Do not introduce new
names merely to wrap `PointedCone.convex`, `PointedCone.smul_mem` or `isClosed_closure`.

The needed suppliers already exist: `Real.exp`, `Real.log`, `Real.add_one_le_exp`,
`Real.log_le_iff_le_exp`, `Real.le_log_iff_exp_le`, finite sums, `Set.closure`, continuous
product coordinates, and the cone APIs in `Mathlib/Geometry/Convex/Cone/Pointed.lean` and
`Mathlib/Analysis/Convex/Cone/Closure.lean`. The prototype imports Mathlib and introduces no
new generic convexity, cone-hull or homogenization API.

Real logarithms use their ordinary positive domain in every equivalence below. Mathlib's
`Real.log` is totalized, so the explicit strict hypotheses are part of the specification.
All vector families below have type `Fin n → ℝ` for an arbitrary `n : ℕ`, including `n = 0`.
All unqualified scalar variables are real.

## 1. Geometry and a usable membership API

Develop positive-scale, zero-scale and negative-scale membership simplifications from
`mem_cone_iff`. The zero section is exactly `0 ≤ u ∧ w ≤ 0`; negative scales have no points.
Record explicit origin, positive-branch and nontrivial zero-face examples. Supply the
following exponential-specific results, retaining their exact quantifiers:

- `zero_approximation`: if `0 ≤ u`, `w ≤ 0` and `0 < δ`, then
  `(u+δ,δ,w) ∈ positive`.
- `halfspace_iff`: `(u,v,w) ∈ cone` if and only if
  `0 ≤ u ∧ 0 ≤ v ∧ ∀ a : ℝ, exp(a) * (w + (1-a)*v) ≤ u`.
- `closure_positive`: `closure positive = (cone : Set Space)`.

An elementary proof route starts with the tangent bound
`exp(a) * (1+z-a) ≤ exp(z)`, using `Real.add_one_le_exp`. First characterize the literal
branch-union set `K` by the displayed affine halfspaces. On the positive branch choose
`a=w/v` for the converse. At scale zero, a hypothetical `w>0` is rejected by
`a=log((u+1)/w)`, whose argument is positive because `u≥0`.
The halfspace description makes `K` closed and closed under nonnegative conical
combinations, and it contains `positive`. Thus the native closed cone-hull construction is
contained in `K`. The explicit zero approximation proves the reverse inclusion through
`closure positive`. This establishes the carrier identification and density without a
circular dependence on either conclusion. Convexity and nonnegative scaling, including
scalar zero, are then available through the native bundle.

**Checks.** `(1,1,0) ∈ positive`; `(2,0,-1) ∈ cone` and belongs to `closure positive`;
`(1,0,1) ∉ cone`. These last two points distinguish the literal face from a totalized
quotient expression. The topology is the ordinary product topology on the three real
coordinates.

## 2. Elementary sections and perspectives

Use cone membership directly in the scalar APIs. Require:

| Interface | Exact mathematical statement |
| --- | --- |
| `exponential_iff` | `exp(w) ≤ u ↔ (u,1,w) ∈ cone` |
| `logarithm_cone_iff` | for `x>0`, `t ≤ log(x) ↔ (x,1,t) ∈ cone` |
| `logarithm_perspective_iff` | for `x>0,y>0`, `t ≤ y*log(x/y) ↔ (x,y,t) ∈ cone` |

Define the actual two-auxiliary system

```text
softplusSystem x t y :=
  ∃ u v : ℝ, u+v ≤ y ∧ (u,y,x-t) ∈ cone ∧ (v,y,-t) ∈ cone.
```

The two witnesses are independent. Its three required identities are:

- `softplus_iff`: `log(1+exp(x)) ≤ t ↔ softplusSystem x t 1`.
- `softplus_perspective_iff`, for `y>0`:
  `y*log(1+exp(x/y)) ≤ t ↔ softplusSystem x t y`.
- `softplus_zero_iff`: `softplusSystem x t 0 ↔ 0 ≤ t ∧ x ≤ t`.

For unit scale rewrite softplus as `exp(x-t)+exp(-t) ≤ 1`; the exponentials are tight
auxiliary witnesses. For positive scale use their scaled versions. At zero scale the
explicit cone face and the sum bound force both auxiliary heights to zero. This last
identity is a separate closed-face statement, not evaluation of the positive-scale scalar
formula at zero.

**Checks.** Take `x=log(3)`, `t=log(4)`, with witnesses `u=3/4`, `v=1/4`. At scale `1/2`
use input `log(3)/2`, height `log(4)/2`, and witnesses `3/8`, `1/8`. At zero scale,
`softplusSystem 2 2 0` and `softplusSystem (-2) 0 0` hold, while
`softplusSystem 2 1 0` fails.

## 3. Finite nonnegative-weight lifting

`weighted_exponential_iff` owns the finite aggregation mechanism. For `d,s : Fin n → ℝ`,
`L : ℝ`, and `∀ j, 0 ≤ d j`, require

```text
(∑ j, d j * exp(s j)) ≤ L ↔
  ∃ u : Fin n → ℝ,
    (∑ j, d j * u j) ≤ L ∧ ∀ j, (u j,1,s j) ∈ cone.
```

Choose `u j = exp(s j)` for the forward direction. For the converse, multiply each
exponential lower bound by the corresponding nonnegative coefficient and sum. Zero
coefficients remain permitted; negative coefficients are outside this statement. An empty
family reduces both sides to `0 ≤ L`. This mechanism is used by the process rows below,
with the corresponding scalar time transformation.

## 4. Source substitutions and application rows

These are required support for the same mathematical component. They specialize the preceding
interfaces and do not specify full process-design, disjunctive or statistical models.

### 4.1 Affine softplus and logistic cost

For `a,x : Fin n → ℝ` and real `b,t`, `affine_softplus_iff` substitutes
`(∑ j, a j*x j)+b` for the scalar softplus input.

`logistic_cost_iff` states

```text
-log(1/(1+exp(-score))) ≤ t ↔ softplusSystem (-score) t 1.
```

For `y>0`, `logistic_cost_perspective_iff` states

```text
-y*log(1/(1+exp(-score/y))) ≤ t ↔ softplusSystem (-score) t y.
```

The logarithm's argument is positive automatically. These are scalar cost identities; the
sigmoid probability and the negative log of that probability are different quantities.

### 4.2 Process time factors and weighted rows

For arbitrary real `u,x` and `t>0`, `process_cone_iff` requires

```text
(t*(u+1),t,x) ∈ cone ↔ exp(x/t)-1 ≤ u.
```

The auxiliary `u` is free. A nonnegative restriction would change the statement, since a
negative input has a negative tight value `exp(x/t)-1`. For `d,t,x : Fin n → ℝ`,
`∀ j,0≤d j`, `∀ j,0<t j`, and real `L`, `weighted_process_iff` requires

```text
(∑ j, d j*(exp(x j/t j)-1)) ≤ L ↔
  ∃ u : Fin n → ℝ, (∑ j, d j*u j) ≤ L ∧
    ∀ j, (t j*(u j+1),t j,x j) ∈ cone.
```

For arbitrary `s : Fin n → ℝ`, `source_process_iff` uses exactly the same hypotheses and
replaces the two scalar comparisons with

```text
(∑ j, d j*(exp(x j/t j)-1)) - (∑ j, s j*x j) ≤ 0
```

and

```text
(∑ j, d j*u j) - (∑ j, s j*x j) ≤ 0,
```

respectively. Thus it follows from the weighted row with `L=∑ j,s j*x j`; it introduces
no restriction on `s`.

**Checks.** A one-row instance has weight `3`, time `2`, input `2*log(2)`, tight auxiliary
`1` and right side `3`. Also use input `-1`, time `1`, and auxiliary `exp(-1)-1<0`.
Keep zero-weight and empty-row cases.

### 4.3 Exponential coefficients and affine right sides

For `a>0` and arbitrary real `s,R`, require

```text
random_exponential_cone_iff:
  a*exp(s) ≤ R ↔ ∃ v : ℝ, a*v ≤ R ∧ (v,1,s) ∈ cone

random_exponential_log_iff:
  a*exp(s) ≤ R ↔ 0<R ∧ log(a)+s ≤ log(R).
```

The strict positivity of `R` is forced by the original inequality and stays as a conjunct
on the right. `source_random_cone_iff` and `source_random_log_iff` substitute
`s=∑ j,q j*x j` and `R=b*z+c`, for `q,x : Fin n → ℝ` and arbitrary real `b,c,z`, retaining
only the hypothesis `a>0`. They neither assume nor prove a model-dependent cap on `z`.

**Checks.** Use `a=2`, scalar score `log(3)` and `R=6`; the same right side can be written
with `b=-1,z=-3,c=3`. A nonpositive right side is infeasible for every `a>0`. The negative
slope example tests the general scalar identity, not the source's positive sampling scheme.

## Dependencies and connections

The order is native cone/set definitions; explicit approximation and halfspace proof;
carrier identification and density; elementary slices and softplus; finite aggregation;
then the application substitutions. Weighted process uses the scalar process identity and
the same finite monotone-summation argument as Section 3. Source-process follows weighted
process. Source-random follows the two scalar random identities. Affine/logistic identities
follow softplus. No later application is a prerequisite for the core cone geometry.

Tau Ceti's `ConvexOn.antitoneOn_mul_map_div` concerns a convex function vanishing at zero
and a nonnegative fixed numerator. It is a related monotonicity theorem; `exp(0)=1` does not
meet its zero-value hypothesis. `Set.homogenization` supplies a general closed cone-hull
construction with closed-convex positive slices and a nonempty closed-convex recession
slice. Reuse that generic theory wherever it is used; this roadmap does not add another
homogenization definition or a general closed-perspective theorem. The cone construction
above needs only the existing Mathlib cone API.

The convex-duality and entropy targets in OptimalTransport Sections 5.1–5.2 and 13.1–13.3
and the constrained-minimum bridge in VariationalMethods Section 2.1 are neighboring
programs. This roadmap supplies the concrete exponential cone and elementary representation
API; it does not claim those programs require the scalar lifts specified here.

`Suggested.lean` contains 21 named target theorem signatures, three concrete definitions and
one coordinate-type abbreviation. Three anonymous examples show existing convexity,
closedness and nonnegative scaling APIs. Those generic facts need no duplicate wrappers.
The signatures cover the main interfaces; the membership simplifications, examples and
source substitutions above remain part of the requested usable API.

## Sources and exact scope

- D. E. Bernal Neira's doctoral thesis, Chapter 8: equation 8.8, Table 8.1 and
  equations 8.32–8.35. The selected exponential portion is distinct from other cone families
  and the full application/solver models in that chapter.
- D. E. Bernal Neira and I. E. Grossmann,
  [*Convex mixed-integer nonlinear programs derived from generalized disjunctive programming
  using cones*](https://doi.org/10.1007/s10589-024-00557-9), Computational Optimization and
  Applications 88 (2024), 251–312: Table 1, equations 9–12 and Appendix A9. The corresponding
  [arXiv v1](https://arxiv.org/abs/2109.09657v1) and
  [v3](https://arxiv.org/abs/2109.09657v3) are separate versions.
- P. R. Chares, *Cones and Interior-Point Algorithms for Structured Convex Optimization
  involving Powers and Exponentials*, Section 4.2, Lemma 4.2.1 and Section 4.2.1. Chares's
  coordinates are `(argument,height,scale)`, so his `(z1,z2,z3)` corresponds to `(w,u,v)`
  here. The thesis bibliography dates this work to 2009; the recovered academic-host
  filename contains 2007, which does not establish a separate edition's identity.
- MOSEK, [*Modeling Cookbook*, exponential cone chapter](https://docs.mosek.com/modeling-cookbook/expo.html),
  Sections 5.1–5.2, and [Section 7.1.1](https://docs.mosek.com/modeling-cookbook/practical.html#perspective-functions).
  The consulted online edition is 3.4.0; it is not identified with the exact 2018 edition
  cited by the thesis. The thesis table credits this modeling source.

As a secondary implementation source, the
[existing thesis formalization](https://github.com/bernalde/complete-retained-library/tree/59c355eb14ed1eff9664736428ca02b4543200b8)
contains retained exponential geometry and row conversions. Its declarations are source
material for adaptation; the mathematics and native interfaces specified here govern the
development.

The source table and later application versions agree on distinct softplus auxiliaries.
The thesis equation 8.33 and arXiv v1 equation 4.8 repeat the same auxiliary; the selected
system follows Table 8.1, arXiv v3 equation 4.8 and the published equation 10. Similarly,
the selected process coordinate is `t*u+t`, as in arXiv v3 equation 4.7 and published
equation 9; thesis equation 8.32 and arXiv v1 equation 4.7 print `t*u+1`. These are
version-specific correspondences, not an assertion that every source formula was already
identical. The explicit zero face controls the quotient shorthand in the background.

The written halfspace/approximation proof route differs from the Cookbook's Hessian
argument and Chares's sequence; it proves the same specified cone after the coordinate
permutation. The scalar representations are known mathematics, with no novelty claim.
General GDP hull theorems, generic recession theory, projection algorithms, dual cones,
facial/error-bound classifications, other table rows, smoothing accuracy, optimizer
existence, statistical-model equivalence and solver/empirical performance are outside this
roadmap. Bounded indicator-perspective and later quadratic GDP results do not expand this
exponential-specific scope.

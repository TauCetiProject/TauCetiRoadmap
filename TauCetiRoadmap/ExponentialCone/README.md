# Roadmap: closed exponential cone and elementary conic representations

**Summary.** Build a reusable real exponential cone with its literal zero face, elementary
exponential/logarithmic sections, softplus perspectives and finite nonnegative-weight
lifts. Scalar affine, logistic-cost and process substitutions exercise the same API.

## Scope and ownership

This roadmap owns the exponential-cone specialization and its elementary representations.
It includes the usable membership and boundary API, the supporting-halfspace proof route,
finite weighted lifting and every scalar substitution specified below. The scalar rows do
not assert full process-design, disjunctive or statistical-model equivalence. General GDP
hulls, generic recession/perspective theory, projection/dual/facial classifications,
other cone families, smoothing accuracy, optimizer existence and empirical performance
are outside this roadmap. These are known representations, without a novelty claim.

The markdown is definitive. `Suggested.lean` provides nine selected admitted headline
signatures, three concrete definitions and one coordinate-type abbreviation in namespace
`TauCetiRoadmap.ExponentialCone`. It is not an exhaustive checklist. The basic API,
supporting arguments, scalar identities and Checks remain mathematical requirements even
where they do not need separate prototype theorem names. Existing native convexity,
closedness and scaling interfaces are used directly, without duplicate wrappers.

## How to read the build

The numbered mathematical subsections are addressable targets within four dependency
layers. Each definition comes with its required API and discriminating Checks; all of
these are part of the specification. `Suggested.lean` contains nine selected headline
signatures with concrete definitions and admitted theorem bodies. A successful interface
build checks that those signatures can be stated against the pinned suppliers; it does
not prove admitted statements or replace the remaining README API and Checks. Implement
the full mathematical requirements, including the scalar process identity, even where
an elementary API consequence has no separate selected prototype.

## Conventions

Use `Space = ℝ × ℝ × ℝ`, the right-associated product, with coordinates `(u,v,w)` in the
order (epigraph height, perspective scale, exponent numerator), and projections
`q.1`, `q.2.1`, `q.2.2`. Define the set

```text
positive = {(u,v,w) | 0 < v ∧ v*exp(w/v) ≤ u}.
```

Use Mathlib's native `PointedCone ℝ Space` for
`cone := (PointedCone.hull ℝ positive).closure`. Its required carrier is

```text
K = {(u,v,w) | (0<v ∧ v*exp(w/v)≤u) ∨ (v=0 ∧ 0≤u ∧ w≤0)}.
```

Prove that carrier identification and `closure positive = (cone : Set Space)`; neither
is a defining assumption. `positive` is a set excluding zero, rather than itself a
`PointedCone`. Mathlib's `PointedCone` means a submodule over nonnegative scalars and
includes zero; its separate `Salient` property expresses the stronger no-lines condition.
No salience/proper-cone theorem is required here. Negative scales are excluded, and no
quotient evaluated at zero substitutes for the literal zero face.

All scalar variables are real. Families have type `Fin n → ℝ` for arbitrary `n : ℕ`,
including zero. Logarithms in equivalences have the explicit strict domains stated below:
Mathlib's globally extended `Real.log` does not remove those hypotheses. Use the ordinary
product topology on `Space`.

## Exact supplier contracts

The prototype uses the roadmap's Lean4.36.0-rc2, Mathlib
`1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti dependency
`2fd255d997f47c0b5d834ee416c7015d55444ce5` interfaces. Suppliers are:

- Mathlib `PointedCone.hull`, the smallest pointed cone containing a set;
  `PointedCone.closure`, whose carrier is the topological closure; and
  `PointedCone.convex`, `PointedCone.smul_mem`, zero/addition membership, coercion and
  extensionality. See `Mathlib/Geometry/Convex/Cone/Pointed.lean` and
  `Mathlib/Analysis/Convex/Cone/Closure.lean`.
- Mathlib `Real.exp`, its positivity/monotonicity and `Real.add_one_le_exp`; `Real.log`,
  `Real.log_le_iff_le_exp`, `Real.le_log_iff_exp_le` and `Real.log_inv`, with their actual
  domain premises; finite sums and monotone multiplication/summation.
- Mathlib `Convex ℝ`, `IsClosed`, `closure`, continuity of coordinate projections and
  affine expressions, closed intersections and metric closure membership.

The construction uses `PointedCone.hull` and `PointedCone.closure`; no generic
homogenization result is consumed or introduced. Tau Ceti's
`ConvexOn.antitoneOn_mul_map_div` is a related scalar monotonicity theorem requiring
a convex function vanishing at zero and a nonnegative fixed numerator. Since `exp(0)=1`,
it does not supply this cone or its closure/softplus statements.

## Layer 1: cone geometry

### 1.1 Positive branch

**API.** For `positive`, require:

- From `(u,v,w)∈positive`, extract `v>0` and `v*exp(w/v)≤u`, hence `u>0`.
- If `(u,v,w)∈positive` and `u≤u'`, then `(u',v,w)∈positive`.
- The sum of two members of `positive` belongs to `positive`.
- For every real `a>0`, multiplying all three coordinates of a member by `a`
  gives another member of `positive`.
- The origin and every zero-scale point are excluded from `positive`.

**Checks.**

- `(1,1,0)∈positive`: the scale is positive and `1*exp(0)=1≤1`.
- `(0,1,0)∉positive`: positive scale alone cannot satisfy the height bound `1≤0`.
- `(0,0,0)∉positive`: the strict scale condition `0<0` fails.

*Needs:* the definition of `positive`, positivity of `Real.exp`, ordered-field arithmetic;
for addition, the supporting-halfspace characterization below (or its convexity argument)
and positivity of the sum of two positive scales.

### 1.2 Cone carrier and membership

**API.** For the native `cone`, require:

- `mem_cone_iff` identifies membership with the displayed positive-branch/zero-face union.
- Under `v>0`, simplify membership to `v*exp(w/v)≤u`.
- At `v=0`, simplify membership to `0≤u ∧ w≤0`; under `v<0`, membership is impossible.
- Use native zero/addition membership, nonnegative scalar membership (including scalar
  zero), convexity and closedness; require the halfspace and density bridges below.

**Checks.**

- `(1,1,0)∈cone`: its positive-branch bound is `1≤1`.
- `(2,0,-1)∈cone`: the literal face conditions are `0≤2` and `-1≤0`.
- `(1,0,1)∉cone`: the zero-face argument condition `1≤0` fails.
- `(1,-1,0)∉cone`: neither a positive scale nor a zero scale is present.

*Needs:* native hull/closure supplier contracts and the noncircular halfspace/density route
below. Sources: [T] (8.8), printed p.282; [C] §4.2, Lemma4.2.1, printed p.120;
[M] §5.1, (5.1)–(5.3).

### 1.3 Supporting halfspaces

`halfspace_iff` requires exactly

```text
(u,v,w) ∈ cone ↔ 0≤u ∧ 0≤v ∧ ∀a:ℝ, exp(a)*(w+(1-a)*v)≤u.
```

Start from `exp(a)*(1+z-a)≤exp(z)`, obtained from `Real.add_one_le_exp (z-a)`.
First characterize the literal set `K`: the converse uses `a=w/v` when `v>0`;
at `v=0,w>0`, choose `a=log((u+1)/w)`, whose argument is strictly positive.
The resulting closed affine halfspaces show that `K` is closed, contains `positive`
and zero, and is closed under nonnegative conical combinations. Therefore the native
closed cone generated by `positive` is contained in `K`.

*Needs:* the literal branch union, exponential arithmetic and tangent bound, strict-log
inversion, continuous affine inequalities and native hull/closure minimality. The
supporting-halfspace route is supplied by [L], `halfspace_iff`; it differs from [M]'s
Hessian proof and [C]'s source sequence, while retaining the same cone.

### 1.4 Carrier density and native cone API

For `u≥0,w≤0,δ>0`, require `(u+δ,δ,w)∈positive`, because `exp(w/δ)≤1`.
These points converge to `(u,0,w)`. Prove `closure_positive`:

```text
closure positive = (cone : Set Space).
```

*Needs:* the explicit approximation, positive-branch inclusion, metric closure and the
preceding closed-halfspace containment. This proves carrier identification/density
without assuming either conclusion. Sources: [C] Lemma4.2.1, printed p.120, for the
branch/face statement; [L], `zero_approximation` and `closure_positive`, for this specific
approximation/proof route.

Use native convexity, closedness and nonnegative scaling, including scalar zero, on `cone`.
*Needs:* the displayed native bundle and its supplier contracts; no new wrapper theorems.

### Examples

- `(1,1,0)∈positive`: positive scale and `1*exp(0)=1≤1`.
- `(0,1,0)∉positive`: the scale is positive but the required bound is `1≤0`.
- `(0,0,0)∉positive`: the strict scale requirement `0<0` fails.
- `(2,0,-1)∈cone` and in `closure positive`, witnessed by
  `(2+δ,δ,-1)` as `δ` decreases to zero. `(1,0,1)∉cone` because its zero-face argument
  is positive; the halfspace with `a=log 2` gives the impossible `2≤1`.
- Cone scaling by zero gives the origin, which belongs to `cone`. The midpoint of
  `(1,1,0)` and `(2,0,-1)` is `(3/2,1/2,-1/2)`; its lower bound is `exp(-1)/2≤3/2`.

### Dependencies

Exact supplier contracts → literal-set tangent/halfspace argument → native construction
containment and explicit boundary approximation → membership and density. No application
row is a prerequisite for geometry.

## Layer 2: sections and perspectives

### 2.1 Exponential and logarithmic sections

Require the exponential and logarithmic sections

```text
exp(w)≤u ↔ (u,1,w)∈cone;
for x>0: t≤log(x) ↔ (x,1,t)∈cone.
```

*Needs:* Layer1 unit-scale membership, respectively strict-domain log/exp inversion.
Sources: [T] Table8.1, printed p.300, exponential/logarithm rows; [M] §§5.2.1–5.2.2,
(5.4)–(5.5).

`logarithm_perspective_iff`, for `x>0,y>0`, requires
`t≤y*log(x/y) ↔ (x,y,t)∈cone`.

*Needs:* positive-scale membership, `x/y>0`, and division by `y>0`.
Sources: [T] Table8.1, printed p.300, logarithm perspective; [M] §5.1 (5.3) and
§7.1.1's strictly positive-scale convention.

### 2.2 Softplus system and perspectives

Define the literal distinct-auxiliary system

```text
softplusSystem x t y :=
  ∃u v:ℝ, u+v≤y ∧ (u,y,x-t)∈cone ∧ (v,y,-t)∈cone.
```

**API.** For `softplusSystem`, require:

- Extract two real witnesses `u,v`, their sum bound `u+v≤y`, and both cone memberships
  from the system; conversely, these data construct the system. The two real witness
  variables range independently.
- `softplus_iff`: `log(1+exp x)≤t ↔ softplusSystem x t 1`.
- `softplus_perspective_iff`, for `y>0`:
  `y*log(1+exp(x/y))≤t ↔ softplusSystem x t y`.
- At zero scale, `softplusSystem x t 0 ↔ 0≤t ∧ x≤t`; at a negative scale the system is empty.

**Checks.**

- `softplusSystem (log 3) (log 4) 1` has witnesses `3/4,1/4`, with sum `1`.
- `softplusSystem 0 0 1` fails: the two exponential lower bounds have sum `1+1=2>1`.
- `softplusSystem 2 2 0` holds with zero witnesses, whereas `softplusSystem 2 1 0`
  fails because `2≤1` is false.
- `softplusSystem 0 0 (-1)` fails because each cone membership would have negative scale.

*Needs:* Layer1 membership; the scalar identity
`log(1+exp x)≤t ↔ exp(x-t)+exp(-t)≤1`; witnesses equal to these exponential lower
bounds and their positively scaled versions. Sources: [T] Table8.1, printed p.300,
softplus row; [M] §5.2.5 (5.8), and §7.1.1 Example7.1 for homogenizing the finite-sum
representation on a positive scale. The source table uses `y∈[0,1]`; the scalar
positive-scale identity here is explicitly required for every `y>0`.

For the separate closed-face identity, the witnesses have zero heights, because
nonnegative heights with sum at most zero both vanish. No totalized evaluation of the
positive perspective at zero replaces it. Negative-scale systems are empty.

*Needs:* Layer1 literal zero/negative-scale API and the system's sum bound.
Source convention: [T] §8.2.2 (8.16)–(8.17), printed p.286; the explicit zero identity
is the derived face calculation in [L].

### 2.3 Affine softplus and logistic cost

For finite affine score `r=(∑j,a_j*x_j)+b`, require
`log(1+exp r)≤t ↔ softplusSystem r t 1`. Also require the scalar cost identities

```text
-log(1/(1+exp(-score)))≤t ↔ softplusSystem (-score) t 1;
for y>0:
-y*log(1/(1+exp(-score/y)))≤t ↔ softplusSystem (-score) t y.
```

*Needs:* scalar softplus/perspective identities and logarithm of a positive reciprocal.
Sources: [T] Table8.1, printed p.300, logistic row, and (8.33), printed p.318;
[A3] §4.2.3 (4.8), printed p.18; [V] §4.2.3 (10), printed p.273. The negative log
of a sigmoid is a cost; the sigmoid probability itself is a different quantity.

### Examples

- `x=log 3,t=log 4` has tight softplus witnesses `3/4,1/4`; at scale `1/2`, input
  `log 3/2` and height `log 4/2` have witnesses `3/8,1/8`.
- The scalar sum identity gives `2≤1` when `x=t=0`, hence softplus infeasibility.
- Zero-scale systems hold at `(x,t)=(2,2),(-2,0)` and fail at `(2,1)`.
- The logarithm section holds at `x=2,t=log 2`; `x=0,t=0` is excluded from its domain:
  totalized `0≤log 0` holds, while the cone would require `1≤0`.
- For the logarithmic perspective use `x=1,y=1/2,t=log 2/2`: the cone bound is
  `(1/2)*exp(log 2)=1`. For an empty affine score, take `b=0,t=log 2`.
- Logistic score `-log 3` and height `log 4` give reciprocal `1/4` and cost `log 4`;
  the positive-scale `1/2` version gives the corresponding half-height identity.

### Dependencies

Layer1 → unit sections → scalar exponential-sum/softplus equivalence → positive
perspectives and explicit zero face → affine/logistic substitutions. All logarithm
arguments have stated or automatic positivity.

## Layer 3: finite weighted lifting

### 3.1 Finite nonnegative-weight lifting

`weighted_exponential_iff` owns the finite aggregation mechanism. For `d,s:Fin n→ℝ`,
arbitrary `L:ℝ`, and `∀j,0≤d_j`, require

```text
Σj d_j*exp(s_j)≤L ↔
  ∃u:Fin n→ℝ, Σj d_j*u_j≤L ∧ ∀j,(u_j,1,s_j)∈cone.
```

*Needs:* Layer2 exponential section and finite sum monotonicity. Choose `u_j=exp(s_j)`
forward; multiply the cone lower bounds by `d_j≥0` and sum backward. This is a derived
finite aggregation argument, motivated by [T] Table8.1 printed p.300 and [M] §5.2.6
(5.9), rather than a claim that those unweighted log-sum-exp rows state this arbitrary
nonnegative-weight theorem. Zero coefficients and `n=0` are included; negative weights
and infinite families are excluded.

### Examples

- Empty sums reduce both sides to `0≤L`: true at `L=0`, false at `L=-1`.
- `d=(2,0),s=(log 3,0),L=6` has witnesses `(3,1)` and weighted sum `6`.
- All-zero weights again give `0≤L`, while cone witnesses remain available.
- Outside the domain, `d=-1,s=0,L=-2` makes `-1≤-2` false but admits lifted witness
  `u=2`, since `-2≤-2` and `exp 0=1≤2`. This tests the nonnegative-weight premise.

### Dependencies

Layer2 exponential section → nonnegative multiplication → finite sum monotonicity.
This layer supplies the aggregation mechanism for process rows.

## Layer 4: affine exponential inequalities

### 4.1 Process rows and time factors

For arbitrary real `u,x` and `t>0`, require the scalar process API identity
`(t*(u+1),t,x)∈cone ↔ exp(x/t)-1≤u`. The auxiliary `u` remains free.

*Needs:* Layer1 positive-scale membership and multiplication/division by `t>0`.
Sources: [T] (8.32), printed p.316, and [A1] (4.7), printed p.24, contain `t*u+1`;
the selected `t*u+t=t*(u+1)` is printed in [A3] (4.7), p.17, and [V] (9), p.272.
The correction changes the formula's time factor, not the scope to a full process model.

`weighted_process_iff`, for `d,t,x:Fin n→ℝ`, `d_j≥0`, `t_j>0` and arbitrary real `L`,
requires

```text
Σj d_j*(exp(x_j/t_j)-1)≤L ↔
  ∃u:Fin n→ℝ, Σj d_j*u_j≤L ∧ ∀j,(t_j*(u_j+1),t_j,x_j)∈cone.
```

*Needs:* the scalar process row and Layer3's nonnegative finite-sum mechanism, with
tight witnesses `u_j=exp(x_j/t_j)-1`. Under the same hypotheses, for arbitrary real
`s_j`, require the source residual form

```text
Σj d_j*(exp(x_j/t_j)-1) - Σj s_j*x_j ≤ 0 ↔
  ∃u, Σj d_j*u_j - Σj s_j*x_j ≤ 0 ∧ ∀j,(t_j*(u_j+1),t_j,x_j)∈cone.
```

*Needs:* the weighted process row with `L=Σj s_j*x_j`. Source locators are the same
process equations above. No sign restriction on `s_j` or `x_j` is added by this substitution.

### 4.2 Exponential coefficients and affine right sides

`random_exponential_cone_iff`, for `a>0` and arbitrary real `s,R`, requires
`a*exp(s)≤R ↔ ∃v:ℝ,a*v≤R ∧ (v,1,s)∈cone`.

*Needs:* Layer2 exponential section and multiplication by positive `a`. Also require
the scalar logarithmic identity `a*exp(s)≤R ↔ 0<R ∧ log(a)+s≤log(R)`.
Its positivity conjunct is forced by `a*exp(s)>0` and cannot be dropped.

For finite score `r=Σj q_j*x_j` and arbitrary real `b,c,z`, require both source forms

```text
a*exp(r)≤b*z+c ↔ ∃v:ℝ,a*v≤b*z+c ∧ (v,1,r)∈cone;
a*exp(r)≤b*z+c ↔ 0<b*z+c ∧ log(a)+r≤log(b*z+c),  for a>0.
```

*Needs:* the preceding scalar cone/log identities with `s=r,R=b*z+c`.
Sources: [T] (8.35), printed p.320; [A1] (4.10), p.27;
[A3] (4.10), p.19; [V] (12), p.274. These substitutions do not assume
or prove the separately displayed source cap on `z` or a full random GDP equivalence.

### Examples

- Process: `d=3,t=2,x=2*log 2,u=1,L=3` gives cone height and bound `4`, weighted sum
  `3`. In residual form take `s=3/(2*log 2)`, so `s*x=3` and both residuals vanish.
- `t=1,x=-1,u=exp(-1)-1<0` gives tight height `exp(-1)`; imposing `u≥0` would change
  this scalar row. Retain zero-weight and empty-family checks, including failure at
  empty budget `L=-1`.
- Random scalar: `a=2,s=log 3,R=6,v=3` is tight; `R=0` is infeasible. For the affine
  substitution take the one-coordinate score `q=1,x=log 3`, and
  `b=-1,z=-3,c=3`, giving `b*z+c=6`. The negative slope tests the general identity,
  rather than the source's positive sampling ranges. With an empty score and
  `a=1,b=c=z=0`, the strict right-side guard fails and both sides are false.

### Dependencies

Layers1–2 supply scalar process/exponential sections. Layer3 supplies finite aggregation.
The residual process row is a bound substitution; the affine random rows are score/right-side
substitutions. None supplies a prerequisite to an earlier layer.

## Downstream consumers

Conic modeling can consume the elementary sections and finite auxiliary lifts directly.
Generic composition/model lifting belongs to ConvexLifting, and boxed-union hulls to
BoundedConicHulls; neither is a supplier required by this roadmap. OptimalTransport
§§5.1–5.2,13.1–13.3 and VariationalMethods §2.1 are neighboring duality/entropy/optimization
programs, without an asserted dependency on these scalar lifts. No new unrestricted
homogenization or closed-perspective API is requested.

## References and source versions

- **[T]** David E. Bernal Neira, *Modern Computational Approaches to Nonlinear Discrete
  Optimization and Applications in Process Systems Engineering*, Carnegie Mellon University
  doctoral thesis, **original May 2021 edition**. Chapter8: (8.8), printed p.282; (8.16)–(8.17),
  p.286; Table8.1, p.300; (8.32), p.316; (8.33), p.318; (8.35), p.320. This reference
  designates the original May 2021 thesis, distinct from the author-corrected November 2026 edition.
- **[A1]/[A3]** Bernal/Grossmann, *Convex Mixed-Integer Nonlinear Programs Derived from
  Generalized Disjunctive Programming using Cones*, [arXiv2109.09657v1](https://arxiv.org/abs/2109.09657v1),
  20 September 2021, and [v3](https://arxiv.org/abs/2109.09657v3), 19 February 2024. Versions are
  distinct: process/softplus (4.7)/(4.8) occur on v1 pp.24/26 and v3 pp.17/18; random
  (4.10) is on v1 p.27 and v3 p.19. Appendix(A.9) gives the exponential-cone
  background; (A.16)–(A.17) distinguish the perspective from its closure.
- **[V]** David E. Bernal Neira and Ignacio E. Grossmann,
  [*Convex mixed-integer nonlinear programs derived from generalized disjunctive programming
  using cones*](https://doi.org/10.1007/s10589-024-00557-9), *Computational Optimization
  and Applications* 88 (2024), 251–312, published online 20 February 2024: Table1; equations
  (9),p.272; (10),p.273; (12),p.274; Appendix(A9),(A16)–(A17).
- **[C]** Peter Robert Chares, *Cones and Interior-Point Algorithms for Structured Convex
  Optimization involving Powers and Exponentials*, §4.2,Lemma4.2.1, **printed p.120**.
  Coordinates `(z1,z2,z3)` correspond to `(w,u,v)` here. Bibliographic year: 2009 in [T];
  Chares's title page is undated, so the year is not an edition identifier.
- **[M]** MOSEK, [*Modeling Cookbook*3.4.0, exponential chapter](https://docs.mosek.com/modeling-cookbook/expo.html):
  §5.1,(5.1)–(5.3); §§5.2.1–5.2.2,(5.4)–(5.5);
  [§5.2.5,(5.8)](https://docs.mosek.com/modeling-cookbook/expo.html#softplus-function);
  §5.2.6,(5.9); [§7.1.1,Example7.1 and Proof7.1](https://docs.mosek.com/modeling-cookbook/practical.html#perspective-functions).
  These are section/equation locators in the 3.4.0 HTML edition. [T] cites a 2018
  Cookbook without a version; this reference designates 3.4.0, with no identification
  of those editions. Table8.1 credits the Cookbook as a modeling source.
- **[L]** David E. Bernal Neira's [thesis formalization](https://github.com/bernalde/complete-retained-library/tree/59c355eb14ed1eff9664736428ca02b4543200b8),
  exact commit59c355eb14ed1eff9664736428ca02b4543200b8, Apache-2.0: secondary interface/proof
  source with canonical lineage `lean-modern/Chapter08ExponentialGeometry.lean` (notably
  halfspace_iff and zero_approximation), `Chapter08ExponentialRows.lean` and `Chapter08ExponentialControls.lean`.
  Adapted signatures are attributed in `Suggested.lean`; the native mathematical specification
  governs the development.
  Source notice: Copyright 2026 David E. Bernal Neira. Licensed under the Apache License,
  Version 2.0; see the repository [LICENSE](../../LICENSE).

The selected distinct-auxiliary softplus formula occurs in original Table8.1 and v3/VOR
scalar equations; original thesis (8.33) and v1 (4.8) repeat `v`. The selected process height
is `t*u+t` from v3/VOR; original thesis (8.32) and v1 (4.7) print `t*u+1`. The background's
explicit branch/face definition controls its final quotient shorthand. Each formula uses
the conventions and source version identified above.

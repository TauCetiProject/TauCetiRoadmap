# Roadmap: convex analysis and duality

**Summary.** This roadmap builds the core of convex analysis and convex duality as a library on
the extended-real conjugate, subdifferential and Fenchel–Moreau theorem that Tau Ceti already
has for an arbitrary bilinear pairing:
- convex sets: supporting hyperplanes in finite dimension, the Minkowski–Carathéodory theorem,
  the Minkowski–Weyl theorem for polyhedra, and Farkas' lemma;
- operations on extended-real convex functions: indicator and support functions, polars,
  infimal convolution, recession functions and closed perspectives, with their conjugates;
- subgradients: directional derivatives, the max formula, existence on the relative interior,
  differentiability, Danskin's theorem, the sum and linear chain rules under continuity and
  relative-interior qualifications, tangent and normal cones, projections and Moreau's
  decomposition for cones;
- strong convexity and its dual smoothness, functions of Legendre type, maximal and cyclic
  monotonicity of subdifferentials, generic differentiability on separable spaces, and the
  Brøndsted–Rockafellar theorem;
- duality: Fenchel–Rockafellar duality, the Karush–Kuhn–Tucker theorem under Slater's
  condition, linear-programming duality with complementary slackness, and conic duality;
- integral representation: Choquet's theorem and the Choquet–Meyer characterization of
  simplices in the metrizable case.

The organization is that of the subject, not of a text. Sets come first because every existence
statement for subgradients is a separation statement; operations on functions come before
calculus because the calculus rules are proved by conjugating them; the duality theorems come
last because each is a subgradient-existence statement for a value function. The material is
the graduate core shared by Bauschke–Combettes, Borwein–Lewis, Borwein–Vanderwerff,
Hiriart-Urruty–Lemaréchal, Rockafellar–Wets, Boyd–Vandenberghe, Schneider and Simon (see
[References](#references)). Headlines that restate a source result carry a theorem, definition,
section or example locator with its printed page; corollaries and adaptations carry a proof
route.

Mathlib has separation theorems, extreme points and the Krein–Milman theorem, Carathéodory's,
Radon's and Helly's theorems, continuity of convex functions on the interior, Sion's minimax
theorem, strong convexity of real-valued functions, nearest points in Hilbert spaces, closed
convex cones with their inner duals and the hyperplane separation of cones, and finitely
generated cones with their duals. Tau Ceti has the extended-real conjugate and subdifferential,
Fenchel–Young, the Fenchel–Moreau theorem, subgradient reciprocity, the Fermat rule,
Rademacher's and Alexandrov's theorems for convex functions, Gordan's alternative, convex
polyhedra as finite intersections of half-spaces, and Rockafellar's construction of a convex
potential from a cyclically monotone set. Neither has support functions, infimal convolution,
recession functions or perspectives of extended-real functions, directional derivatives with the
max formula, any subdifferential calculus rule beyond affine perturbation, normal cones of
intersections, Legendre functions, the Minkowski–Weyl theorem for polyhedra, Farkas' lemma,
linear-programming duality beyond the finite transport problem, conic duality, the
Karush–Kuhn–Tucker theorem, the Brøndsted–Rockafellar theorem, generic differentiability, or
Choquet theory. The Minkowski–Weyl theorem for cones is a target of ScatteringDiagrams §1.1,
which this roadmap consumes.

`Suggested.lean` states, against the pinned Mathlib and Tau Ceti, the headlines below that carry
a Lean name, which in the layers are all the bold ones, each with every conclusion the README
attaches to it, and the definitions those statements need. It is not an exhaustive acceptance
test: the bullets without a bold name are targets of the same standing, stated in prose with
their locators or proof routes.

Suggested home: `TauCeti/Analysis/Convex/` for Layers 2–5, next to the existing
`Conjugate.lean`, `Subdifferential.lean` and `FenchelMoreau.lean`, with Layer 1 in
`TauCeti/Geometry/Convex/` and Layer 6 in `TauCeti/Analysis/Convex/Choquet/`.

## How to read the build

Each layer opens with a short orientation, then numbered subsections. In a subsection a **bold
name** with a Lean name in parentheses is a headline stated in `Suggested.lean`; a bold name
without one is a target of the same standing stated in prose. Locators follow the headline; an
adaptation carries a *Proof route.* Every subsection ends with a *Needs:* line naming what it
uses. **Checks.** are small cases computed by hand and recomputed numerically, one fact per
bullet; at least one per definition is a negative control, a case that a plausible wrong
convention or a dropped hypothesis gets wrong. Each layer closes with Examples and Dependencies.

The layers are ordered by dependency: Layer 1 needs Mathlib and ScatteringDiagrams §1.1; Layer 2
needs Layer 1 and the Tau Ceti conjugate; Layer 3 needs Layers 1–2; Layer 4 needs Layer 3;
Layer 5 needs Layers 1 and 3; Layer 6 needs only 1.2 and Mathlib's measure theory, and can be
built in parallel with Layers 2–5.

## Conventions

These are fixed for every target. A statement that departs from them is a different target.

- **Namespace.** The implementation is in the namespace `TauCeti`, next to
  `TauCeti.fenchelConjugate` and `TauCeti.subdifferential`. `Suggested.lean` states the
  prototypes in the namespace `TauCetiRoadmap.ConvexAnalysisAndDuality`.
- **Extended-real functions.** A function is `f : E → EReal`. Its *domain* is `{x | f x ≠ ⊤}`.
  It is *convex* when its real epigraph `{p : E × ℝ | f p.1 ≤ p.2}` is convex, *proper* when
  `∀ x, f x ≠ ⊥` and `∃ x, f x ≠ ⊤`, and *closed* when it is `LowerSemicontinuous`. These are the
  hypotheses of Tau Ceti's Fenchel–Moreau theorem `fenchelConjugate_flip_fenchelConjugate_eq`,
  and every target uses them in this form. Real-valued convex functions use Mathlib's
  `ConvexOn`, and Tau Ceti's `convexOn_toReal` is the bridge.
- **EReal arithmetic.** Mathlib's `EReal` has `⊥ + ⊤ = ⊥`, hence `⊤ - ⊤ = ⊥`, and
  `(t : EReal) * ⊤ = ⊤` for real `t > 0`. Every definition below that adds or subtracts extended
  values is used only under hypotheses that exclude `⊥`, and the Checks record the value of each
  definition at the boundary cases.
- **Pairings.** Conjugates and subdifferentials are Tau Ceti's `fenchelConjugate B f` and
  `subdifferential B f x` for a bilinear `B : E →ₗ[ℝ] F →ₗ[ℝ] ℝ`. Three tiers are used, and
  each target names its tier:
  - *Normed:* a real normed space `E` with `F = StrongDual ℝ E` and the evaluation pairing
    `(topDualPairing ℝ E).flip`, so that `B x u = u x`. Completeness is assumed only where a
    target says so (4.5, 4.6).
  - *Hilbert:* a real Hilbert space `H` with `F = H` and `B = innerₗ H`.
  - *Euclidean:* a finite-dimensional real inner product space `E` with `B = innerₗ E`.
    Relative interiors are Mathlib's `intrinsicInterior ℝ`, and adjoints are
    `ContinuousLinearMap.adjoint`.
- **Subdifferential.** `subdifferential B f x` is empty unless `f x` is finite, so a sum rule
  or chain rule holds trivially at points outside the domain. This is the convention of every
  source cited here.
- **Normal cone and indicator.** `convexIndicator C` is `0` on `C` and `⊤` off `C`, and
  `normalCone B C x` is `{y | ∀ v ∈ C, B (v - x) y ≤ 0}`; both are local copies of
  VariationalMethods §2.1, and the normal cone is used only at points `x ∈ C`. Tangent cones are
  Mathlib's one-sided `posTangentConeAt C x`, which is `tangentConeAt NNReal C x`; Mathlib's
  `tangentConeAt ℝ C x` admits negative scalars and is not the tangent cone of convex analysis.
- **Optimal values.** Primal and dual values of optimization problems are infima and suprema in
  `EReal`, so infeasibility is `⊤` for a minimization and `⊥` for a maximization, and an
  unbounded problem has value `⊥` or `⊤`. A duality theorem asserts equality in `EReal`, and
  attainment is a separate conclusion.
- **Cones.** A closed convex cone in an inner product space is Mathlib's `ProperCone ℝ E`, its
  dual is `ProperCone.innerDual`, and the polar cone is the negative of the dual. A finitely
  generated pointed cone is `PointedCone.hull ℝ D` for a `Finset D`.
- **Locators** are `(Author, Theorem, printed page)` in the editions listed under
  [References](#references).

## Layer 1: convex sets and cones

Finite-dimensional facts that Mathlib's separation theorems do not yet give: support without an
interior hypothesis, the dimension bound in Minkowski's theorem, the two descriptions of
polyhedra, and the linear alternative that drives linear-programming duality.

### 1.1 Supporting hyperplanes in finite dimension

- **Support at frontier points** (`exists_support_of_mem_frontier`). In a finite-dimensional
  inner product space, every frontier point `x` of a convex set `C` has a `y ≠ 0` with
  `⟪c, y⟫ ≤ ⟪x, y⟫` for all `c ∈ C`; no interior hypothesis is made (Borwein–Lewis, Thm 4.1.6,
  p. 67, with nonempty interior; Schneider, Thm 1.3.2, p. 11, for closed sets; Boyd–Vandenberghe,
  §2.5.2, pp. 50–51).
- **Nontrivial support off the relative interior**
  (`exists_nontrivial_support_of_notMem_intrinsicInterior`). A point `x ∈ C` outside
  `intrinsicInterior ℝ C` has a `y` with `⟪c, y⟫ ≤ ⟪x, y⟫` on `C` and strict inequality at some
  `c ∈ C`, so the supporting hyperplane does not contain `C` (Borwein–Vanderwerff, Thm 2.4.7,
  p. 67, for the separation of `ri C` from `{x}`).

*Proof route.* For the first headline: if `C` has nonempty interior, separate `x` from the open
convex set `interior C` with `geometric_hahn_banach_of_nonempty_interior_point`, using that for a
convex set in finite dimension `interior (closure C) = interior C`, so `x ∉ interior C` gives the
inequality on `closure C`. If `interior C` is empty, `C` lies in a proper affine subspace, and a
nonzero normal of its direction space works. For the second, apply Borwein–Vanderwerff's
separation inside the affine span of `C`: choose the separating `y` in the direction space of the
affine span, where it is nonzero, so it is not constant on `C`.

*Needs:* Mathlib `geometric_hahn_banach_of_nonempty_interior_point`, `intrinsicInterior`.

### 1.2 Extreme points in finite dimension

- **Minkowski–Carathéodory theorem** (`convexHull_extremePoints_eq`). A compact convex set `K` in
  a finite-dimensional real normed space is the convex hull of its extreme points, and every
  `x ∈ K` lies in the convex hull of at most `dim K + 1` extreme points, where `dim K` is the
  dimension of the vector span of `K` (Simon, Thm 8.11, p. 126; Hiriart-Urruty–Lemaréchal I,
  Ch. III, Thm 2.3.4, p. 111; Borwein–Lewis, Thm 4.1.8, p. 68).
- Line-free closed convex sets are the convex hull of their extreme points and extreme rays
  (Schneider, Thm 1.4.3, p. 18). This unbounded form of the theorem is a target in prose.

*Proof route.* By Krein–Milman (`closure_convexHull_extremePoints`) and finite dimension the
closure is unnecessary: induct on the dimension, using 1.1 to place each frontier point in a face
`K ∩ H` of lower dimension whose extreme points are extreme in `K`, and a line through an interior
point to write it as a combination of two frontier points. The count follows by Carathéodory's
theorem `convexHull_eq_union` inside the affine span, with `AffineIndependent.card_le_finrank_succ`.

*Needs:* 1.1; Mathlib `closure_convexHull_extremePoints`, `convexHull_eq_union`,
`AffineIndependent.card_le_finrank_succ`.

### 1.3 The Minkowski–Weyl theorem

- **Minkowski–Weyl for polyhedra** (`isConvexPolyhedron_iff_convexHull_add_hull`). In a
  finite-dimensional real normed space, a set is a convex polyhedron in the sense of Tau Ceti's
  `IsConvexPolyhedron` exactly when it is `convexHull ℝ P + PointedCone.hull ℝ D` for finite sets
  `P` and `D`; and it is a bounded polyhedron exactly when it is `convexHull ℝ P` for a finite
  `P` (Borwein–Lewis, Thm 5.1.7, p. 99; Schneider, Thm 2.4.3, p. 96, and Thm 2.4.6, p. 97).

- The cone form, that a pointed cone in a finite-dimensional real vector space is finitely
  generated exactly when it is `PointedCone.DualFG` for the pairing with the dual space
  (Rockafellar–Wets, Thm 3.52, p. 102; Borwein–Lewis, Thm 5.1.7, p. 99), is the Minkowski–Weyl
  target of ScatteringDiagrams §1.1 and is consumed here, not built.

*Proof route.* Homogenize the inequalities, not the points. Write `s = {x | ∀ i, ℓᵢ x ≤ bᵢ}`
with `ℓᵢ` linear, and let `Ĉ = {(x, t) | t ≥ 0, ∀ i, ℓᵢ x ≤ t bᵢ}` in `V × ℝ`. It is the dual
of a finite set of linear forms by construction, so the cone form of ScatteringDiagrams §1.1
gives finitely many generators. Those with `t > 0`, rescaled to `t = 1`, give `P`; those with
`t = 0` give `D`; and `s` is the slice of `Ĉ` at `t = 1`, which is
`convexHull ℝ P + PointedCone.hull ℝ D`. For the converse, apply the cone form to the cone
generated by the `(p, 1)`, `p ∈ P`, and the `(d, 0)`, `d ∈ D`: its slice at `t = 1` is
`convexHull ℝ P + PointedCone.hull ℝ D`, and the slice of the dual of a finite set is a
polyhedron. The homogenization of the points, `{(t • x, t) | t ≥ 0, x ∈ s}`, does not work: it
is not closed when `s` is unbounded. The bounded case: `PointedCone.hull ℝ D` is bounded only if
it is `{0}`.

*Needs:* ScatteringDiagrams §1.1 (Minkowski–Weyl for cones); Mathlib `PointedCone.hull`,
`PointedCone.DualFG`; Tau Ceti `IsConvexPolyhedron`.

### 1.4 Linear alternatives

- **Farkas' lemma** (`exists_nonneg_mulVec_eq_iff`). For a real matrix `A` and vector `b`, the
  system `A x = b`, `x ≥ 0` has a solution exactly when no `y` has `Aᵀ y ≥ 0` and `b ⬝ᵥ y < 0`
  (Borwein–Lewis, Lemma 2.2.7, p. 24; Boyd–Vandenberghe, §5.8, p. 263).
- Gordan's alternative is Tau Ceti's `exists_forall_dual_pos_iff`, and Farkas' lemma does not
  depend on it.

*Proof route.* The cone `{A x | x ≥ 0}` is finitely generated, hence the dual of a finite set by
the cone form of Minkowski–Weyl (ScatteringDiagrams §1.1) and closed; separate `b` from it with
`ProperCone.hyperplane_separation'`.

*Needs:* ScatteringDiagrams §1.1; Mathlib `ProperCone.hyperplane_separation'`.

**Checks.**

- Support at a frontier point without interior: the segment `C = [0, 1] × {0}` in `ℝ²` has empty
  interior; at `x = (1/2, 0)` the vector `y = (0, 1)` supports `C`.
- At the same point the support of the first headline is trivial, since `⟪c, y⟫ = 0` on all of
  `C`; the relative interior of `C` is `(0, 1) × {0}` and contains `x`, so the second headline
  correctly gives nothing there.
- At `x = (1, 0)`, outside the relative interior, `y = (1, 0)` supports nontrivially:
  `⟪(0, 0), y⟫ = 0 < 1`.
- The unit square has `4` extreme points and dimension `2`; its centre needs `2` of them
  (`(0, 0)` and `(1, 1)`), and every point needs at most `3 = 2 + 1`.
- The closed unit disc has the whole circle as extreme points; the bound `dim + 1 = 3` is attained
  by no point, since every point is on a chord.
- Negative control for the dimension: a triangle in a plane in `ℝ³` has `dim K = 2`, not `3`, so
  the bound is `3` points, not `4`.
- Minkowski–Weyl: the quadrant `{x ≥ 0, y ≥ 0}` is `convexHull {0} + hull {e₁, e₂}`; the strip
  `{0 ≤ y ≤ 1}` in `ℝ²` is `convexHull {(0,0), (0,1)} + hull {e₁, -e₁}`.
- Negative control for boundedness: the half-line `{x ≥ 0}` in `ℝ` is a polyhedron but not a
  polytope, since every `convexHull ℝ P` is compact.
- Negative control for the homogenization: for `s = {x ≥ 0}` in `ℝ`, the cone over the points,
  `{(a, t) | a ≥ 0, t > 0} ∪ {(0, 0)}`, contains `(1, 1/n)` for every `n` but not `(1, 0)`, so it
  is not closed; the homogenized inequality `-a ≤ t · 0` gives the closed quadrant
  `{(a, t) | a ≥ 0, t ≥ 0}`, generated by `(0, 1)` and `(1, 0)`, so `P = {0}` and `D = {1}`.
- Farkas: `A = (1 1)`, `b = -1` has no `x ≥ 0` with `x₁ + x₂ = -1`, and `y = 1` gives
  `Aᵀ y = (1, 1) ≥ 0` with `b ⬝ᵥ y = -1 < 0`.
- Farkas, solvable side: `A = (1 1)`, `b = 1` has `x = (1, 0)`, and every `y` with
  `Aᵀ y ≥ 0` has `y ≥ 0`, so `b ⬝ᵥ y ≥ 0`.

### Examples

- The probability simplex `{x ≥ 0, ∑ xᵢ = 1}` is a bounded polyhedron, the convex hull of the
  unit vectors.
- The second-order cone in `ℝ³` is closed and convex but not finitely generated: it has
  infinitely many extreme rays, so 1.3 does not apply to it, and 5.4 treats it as a
  `ProperCone`.

### Dependencies

Mathlib; Tau Ceti `IsConvexPolyhedron`; ScatteringDiagrams §1.1.

## Layer 2: operations on convex functions

The constructions that conjugation exchanges: indicators and support functions, polars, sums
and infimal convolutions, recession functions and the domain of the conjugate. Theorems are in
the Hilbert tier unless stated, because their proofs use Tau Ceti's Fenchel–Moreau theorem for
`innerₗ H`; the definitions take an arbitrary pairing.

### 2.1 Support functions

- **Definition** (`supportFunction`). `supportFunction B C y = ⨆ x ∈ C, (B x y : EReal)`. It is
  `⊥` for empty `C`, and otherwise never `⊥`.
- **Indicator–support duality** (`fenchelConjugate_convexIndicator_and_supportFunction`). For
  every subset `C` of a real Hilbert space, the conjugate of `convexIndicator C` is
  `supportFunction (innerₗ H) C`, and the conjugate of the support function is the indicator of
  `closure (convexHull ℝ C)` (Bauschke–Combettes, Example 13.3(i), p. 221, for the first;
  Borwein–Lewis, Cor 4.2.3, p. 77, for compact convex `C`). Under the `EReal` conventions both
  hold for empty `C`, where the support function is `⊥` and its conjugate `⊤`.
- The support function is sublinear, closed, and determines the closed convex hull:
  `supportFunction B C = supportFunction B D` exactly when the closed convex hulls agree, and
  `x ∈ closure (convexHull ℝ C)` exactly when `⟪x, y⟫ ≤ supportFunction (innerₗ H) C y` for all
  `y`. This is a target in prose.

*Proof route.* The first identity is the definition of the conjugate. For the second, the
support function is a supremum of continuous linear functions, so it is convex and closed and
its conjugate is the conjugate of the biconjugate of the indicator; by Fenchel–Moreau
(`fenchelConjugate_innerₗ_fenchelConjugate_innerₗ`) that is the closed convex envelope of the
indicator, which is the indicator of the closed convex hull.

*Needs:* Tau Ceti `fenchelConjugate`, `fenchelConjugate_innerₗ_fenchelConjugate_innerₗ`.

### 2.2 Polars

- **Definition** (`convexPolar`). `convexPolar B C = {y | ∀ x ∈ C, B x y ≤ 1}`, the one-sided
  polar. Tau Ceti's absolute polar for `StrongDual.bipolar_eq_closedAbsConvexHull` is the
  two-sided one, `|B x y| ≤ 1`.
- **Bipolar theorem** (`convexPolar_convexPolar`). In a real Hilbert space,
  `convexPolar (convexPolar C) = closure (convexHull ℝ (insert 0 C))` (Borwein–Lewis,
  Thm 4.1.5, p. 67).
- For a cone `K`, the polar is the polar cone `{y | ∀ x ∈ K, ⟪x, y⟫ ≤ 0}` and the bipolar is
  the closed convex cone generated by `K` (Borwein–Lewis, Thm 3.3.14, p. 54); this is a target in
  prose. In a Hilbert space the polar cone is `-ProperCone.innerDual K`, and the bipolar is
  `ProperCone.innerDual (ProperCone.innerDual K)`, which for a closed convex cone is `K` itself by
  Mathlib's `ProperCone.innerDual_innerDual`.
- The same bipolar theorem holds for a Hausdorff locally convex space `E` paired with
  `StrongDual ℝ E`, with closure in the weak topology on `E`, by the same separation argument
  with `geometric_hahn_banach_point_closed`; this is a target in prose.

*Proof route.* `convexPolar C` is the sublevel set `{supportFunction C ≤ 1}`. A point `x` outside
`closure (convexHull (insert 0 C))` is strictly separated by some `y` with
`⟪c, y⟫ < ⟪x, y⟫` on the closed hull; since `0` is in it, the separating constant is positive and
can be scaled to `1`.

*Needs:* Mathlib `geometric_hahn_banach_point_closed`.

### 2.3 Infimal convolution

- **Definition** (`infConv`). `infConv f g x = ⨅ y, f y + g (x - y)`.
- **Convexity and conjugate** (`convex_epigraph_infConv_and_fenchelConjugate`). For any pairing
  `B`, if `f` and `g` are convex and never `⊥`, then `infConv f g` is convex and its conjugate is
  `fenchelConjugate B f + fenchelConjugate B g` (Bauschke–Combettes, Prop 13.24(i), p. 226, which
  needs no convexity for the conjugate identity; convexity is the strict-epigraph sum).
- The infimum defining `infConv f g x` need not be attained, even when `g` is finite and
  continuous: `infConv exp 0 0 = 0` on `ℝ` is attained at no `y`. The conjugate of a sum, which
  is an infimal convolution of the conjugates with attainment under a qualification on
  `dom f ∩ dom g`, is a target of 5.1.

*Proof route.* The conjugate identity is an exchange of suprema with the substitution
`x = y + z`; the hypothesis that neither function takes `⊥` makes `f y + g z - B (y + z) u`
equal to `(f y - B y u) + (g z - B z u)` in `EReal`.

*Needs:* Tau Ceti `fenchelConjugate`.

### 2.4 Recession functions

- **Definition** (`recessionFunction`).
  `recessionFunction f d = ⨆ x ∈ {x | f x ≠ ⊤}, (f (x + d) - f x)`. It is `⊥` when the domain is
  empty, and it generalizes Tau Ceti's one-variable `TauCeti.recessionConstant`.
- **Slopes and support** (`recessionFunction_spec`). For a proper closed convex function on a
  real Hilbert space and any `x` in its domain, `(f (x + t • d) - f x) / t` tends to
  `recessionFunction f d` as `t → ∞`, and `recessionFunction f` is the support function of the
  domain of `f*` (Bauschke–Combettes, Prop 9.30(ii), p. 165, and Prop 13.49, p. 234;
  Rockafellar–Wets, Thm 11.5, p. 477; Hiriart-Urruty–Lemaréchal II, Ch. X, Prop 1.2.2, p. 41).
- **Bounded sublevel sets** (`isBounded_sublevel_iff_recessionFunction_pos`). For a proper closed
  convex function on a finite-dimensional inner product space, every sublevel set
  `{x | f x ≤ r}` is bounded exactly when `recessionFunction f d > 0` for every `d ≠ 0`
  (Rockafellar–Wets, Thm 3.26, p. 91, and Cor 3.27, p. 92).
- The recession function of a proper closed convex function is proper, closed, convex and
  positively homogeneous, and its epigraph is the recession cone of the epigraph
  (Bauschke–Combettes, Prop 9.29, p. 164, and Prop 9.30(i), p. 165). This is a target in prose.

*Proof route.* For a convex `f` the slope `(f (x + t • d) - f x) / t` is nondecreasing in `t`, so
its limit is its supremum, and closedness makes the supremum independent of `x`. The support
identity: by Fenchel–Moreau `f` is the supremum of its affine minorants `⟪·, u⟫ - f* u`, and the
slope at infinity of that supremum is `⨆ u ∈ dom f*, ⟪d, u⟫`. For the sublevel criterion in
finite dimension, a sequence of unit vectors along which `f` stays below `r` has a limit point `d`
with `recessionFunction f d ≤ 0`, and conversely `recessionFunction f d ≤ 0` keeps `f` bounded
on the ray `x + t • d`.

*Needs:* 2.1; Tau Ceti `fenchelConjugate_innerₗ_fenchelConjugate_innerₗ`.

### 2.5 Perspectives

- **Definition** (`perspective`). For `f : E → EReal`, `perspective f (x, t)` is
  `t * f (t⁻¹ • x)` for `t > 0`, `recessionFunction f x` for `t = 0`, and `⊤` for `t < 0`.
- **Closed perspective** (`perspective_spec`). For a proper closed convex function on a real
  Hilbert space, `perspective f` is convex and lower semicontinuous on `H × ℝ`, and it is the
  largest lower semicontinuous function below `t * f (t⁻¹ • x)` on `t > 0`
  (Bauschke–Combettes, Prop 9.42, p. 172; Boyd–Vandenberghe, §3.2.6, p. 89, for `t > 0`).

*Proof route.* The epigraph of the restriction to `t > 0` is the cone over `{1} × epi f`, and
its closure adds `{0} × epi (recessionFunction f)` by the recession-cone description of 2.4.
Lower semicontinuity is closedness of that epigraph.

*Needs:* 2.4.

**Checks.**

- `supportFunction` of `C = [-1, 1]` in `ℝ` is `|y|`.
- `supportFunction` of the empty set is `⊥` at every `y`, and its conjugate is `⊤`, the
  indicator of the empty set.
- Negative control for the closed convex hull: `C = {-1, 1}` has the same support function `|y|`
  as `[-1, 1]`, so the conjugate of the support function is the indicator of `[-1, 1]`, not of
  `C`.
- `convexPolar` of the closed unit ball is the closed unit ball.
- `convexPolar {0}` is the whole space, and `convexPolar` of the whole space is `{0}`.
- Negative control for the inserted `0`: in `ℝ`, `convexPolar [1, 2] = (-∞, 1/2]`, whose polar is
  `[0, 2] = convexHull (insert 0 [1, 2])`, not the closed convex set `[1, 2]`.
- `infConv (convexIndicator {0}) g = g` for `g` never `⊥`; for `g 0 = ⊥` and `g = 0` elsewhere,
  the term `y = 1` at `x = 1` is `⊤ + ⊥ = ⊥ ≠ g 1`.
- `infConv |·| (x²/2)` is the Huber function, `x²/2` for `|x| ≤ 1` and `|x| - 1/2` otherwise;
  its conjugate is `y²/2` on `[-1, 1]` and `⊤` outside, the sum of the conjugates `δ_[-1,1]` and
  `y²/2` (at `y = 0.3` both are `0.045`).
- Negative control for the `⊥` hypothesis: for `f ≡ ⊥` and `g ≡ ⊤`, `infConv f g ≡ ⊥` because
  `⊥ + ⊤ = ⊥`, whose conjugate is `⊤`, while `f* + g* = ⊤ + ⊥ = ⊥`.
- `recessionFunction` of `exp` is `0` at `d ≤ 0` and `⊤` at `d > 0`; the domain of `exp*` is
  `[0, ∞)`, whose support function has the same values.
- `recessionFunction |·| = |·|`.
- `recessionFunction` of a function with empty domain is `⊥`.
- Negative control for strict positivity: `recessionFunction exp (-1) = 0`, not `> 0`, and the
  sublevel set `{exp ≤ 1} = (-∞, 0]` is unbounded.
- `perspective` of `x²` is `x²/t` for `t > 0`; at `t = 0` it is `0` at `x = 0` and `⊤` at
  `x ≠ 0`, because the recession function of `x²` is `⊤` off `0`.
- `perspective |·|` is `|x|` for `t ≥ 0` and `⊤` for `t < 0`.
- Negative control for the value at `t = 0`: the convention `0 · f(x/0) = 0` for `f = x²` gives
  value `0` at `(1, 0)` and at `(0, 2)`, but value `1/4` at their midpoint `(1/2, 1)`, so it is
  not convex.

### Examples

- The negative entropy `x log x` and its perspective `x log (x/t)`, the relative entropy, is
  convex on `[0, ∞)²` by `perspective_spec`.
- The dual norm is the support function of the unit ball, and the indicator of the dual unit ball
  is the conjugate of the norm.

### Dependencies

Layer 1 (separation in 2.2); Tau Ceti conjugate and Fenchel–Moreau.

## Layer 3: subgradients and calculus

Subgradients exist where the function is continuous or, in finite dimension, on the relative
interior of the domain; the directional derivative is the support function of the
subdifferential; and the subdifferential of a sum or a composition with a linear map is computed
from the pieces under a qualification. The normed-tier results need no completeness.

### 3.1 Directional derivatives

- **Definition** (`dirDeriv`). `dirDeriv f x d = ⨅ t > 0, t⁻¹ * (f (x + t • d) - f x)`. For a
  convex `f` finite at `x` the quotient is nondecreasing in `t`; for a nonconvex `f` the infimum
  is a junk value and is not the one-sided derivative.
- **One-sided limit** (`tendsto_dirDeriv`). If `f` is convex, never `⊥`, and finite at `x`, the
  difference quotients converge to `dirDeriv f x d` as `t ↓ 0` (Bauschke–Combettes, Prop 17.2(i),
  p. 290).
- **Subgradients and directional derivatives**
  (`mem_subdifferential_iff_forall_le_dirDeriv`). For any pairing and any `f` finite at `x`,
  `y ∈ subdifferential B f x` exactly when `B d y ≤ dirDeriv f x d` for all `d`
  (Borwein–Lewis, Prop 3.1.6, p. 35; Hiriart-Urruty–Lemaréchal I, Ch. VI, Thm 1.2.2, p. 242).
  No convexity is needed, since the quotient at `t = 1` is already the subgradient inequality.
- For convex `f` finite at `x`, `dirDeriv f x` is sublinear, and it is finite on the interior of
  the domain (Borwein–Lewis, Prop 3.1.2, p. 34). This is a target in prose.

*Proof route.* Monotonicity of the quotient is convexity on the segment `[x, x + t • d]`. The
limit of a monotone function at `0⁺` in `EReal` is its infimum.

*Needs:* Tau Ceti `subdifferential`.

### 3.2 Existence of subgradients and the max formula

- **Max formula** (`isGreatest_dirDeriv`). On a real normed space, if `f` is convex, never `⊥`,
  finite at `x` and continuous at `x`, then `subdifferential (topDualPairing ℝ E).flip f x` is
  nonempty and `dirDeriv f x d` is the greatest value of `u d` over its elements
  (Borwein–Vanderwerff, Thm 4.1.10, p. 131; Bauschke–Combettes, Thm 17.18, p. 296, for Hilbert
  spaces; Borwein–Lewis, Thm 3.1.8, p. 36, in finite dimension).
- **Relative interior** (`nonempty_subdifferential_of_mem_intrinsicInterior`). On a
  finite-dimensional inner product space, a convex `f` that is never `⊥` has a nonempty
  subdifferential at every point of `intrinsicInterior ℝ {x | f x ≠ ⊤}`
  (Hiriart-Urruty–Lemaréchal II, Ch. X, Thm 1.4.2, p. 47; Borwein–Vanderwerff, Thm 2.4.8,
  p. 67). Tau Ceti's `nonempty_subdifferential_of_mem_interior` is the interior case.
- In finite dimension, at an interior point of the domain, `dirDeriv f x d` is the maximum of
  `⟪d, u⟫` over `subdifferential (innerₗ E) f x`; this follows from the first headline and
  `ConvexOn.continuousOn_tfae`, and is a target in prose.

*Proof route.* Continuity at `x` makes `dirDeriv f x` a finite continuous sublinear function.
For each `d`, Hahn–Banach extends `t • d ↦ t * dirDeriv f x d` to a linear functional dominated
by `dirDeriv f x`; it is continuous because `dirDeriv f x` is bounded on a ball, and it is a
subgradient by `mem_subdifferential_iff_forall_le_dirDeriv`. For the relative interior,
restrict to the affine span of the domain, where the point is interior, apply Tau Ceti's
`nonempty_subdifferential_of_mem_interior`, and extend by zero on the orthogonal complement.

*Needs:* 3.1; Tau Ceti `nonempty_subdifferential_of_mem_interior`; Mathlib
`ConvexOn.locallyLipschitzOn_intrinsicInterior`.

### 3.3 Differentiability

- **Singleton subdifferentials** (`differentiableAt_iff_subdifferential_eq_singleton`). On a
  finite-dimensional inner product space, for a convex `f` that is never `⊥`: at a point of the
  interior of the domain, `f` is differentiable exactly when its subdifferential is a singleton;
  and the gradient is continuous on the set of interior points where `f` is differentiable
  (Borwein–Lewis, Cor 3.1.10, p. 36; for continuity, Hiriart-Urruty–Lemaréchal I, Ch. VI,
  Thm 6.2.4, p. 283).
- **Monotone gradients** (`convexOn_iff_monotone_gradient`). A function differentiable on an
  open convex set is convex there exactly when its gradient is monotone,
  `0 ≤ ⟪∇f x - ∇f y, x - y⟫` (Borwein–Vanderwerff, Thm 2.2.6, p. 37).
- Differentiability off a Lebesgue-null set and the Hessian test are Tau Ceti's
  `ConvexOn.ae_differentiableAt_of_mem_interior` and `ConvexOn.isPositive_of_hasFDerivAt_gradient`
  with `TauCeti.convexOn_of_hasFDerivAt_gradient`.

*Proof route.* By the max formula, a singleton subdifferential `{g}` makes `dirDeriv f x` linear,
and a convex function with linear directional derivative at an interior point of a
finite-dimensional space is differentiable there (uniform convergence of the monotone quotients
on the unit sphere, by compactness). Tau Ceti's `hasFDerivAt_apply_eq_of_mem_subdifferential`
gives the converse. Continuity of the gradient is the outer semicontinuity of the
subdifferential at points where it is a singleton. Monotone gradients: restrict to segments,
where monotone derivative is convexity in one variable.

*Needs:* 3.2; Tau Ceti `hasFDerivAt_apply_eq_of_mem_subdifferential`,
`mem_subdifferential_of_hasFDerivAt`, `hasGradientAt_toReal_of_continuousAt_subgradient`.

### 3.4 Danskin's theorem

- **Danskin's theorem** (`subdifferential_iSup_eq_convexHull`). Let `K` be a nonempty compact
  subset of a topological space and `φ : E → T → ℝ` with each `φ (·) t` convex and
  differentiable for `t ∈ K`, and `φ` and its gradient in the first variable jointly continuous on
  `E × K`. Then the subdifferential of `f x = ⨆ t ∈ K, φ x t` at `x` is the convex hull of the
  gradients `∇φ (·) t` at `x` over the active set `{t ∈ K | φ x t = f x}`
  (Hiriart-Urruty–Lemaréchal I, Ch. VI, Cor 4.4.4, p. 269, after Thm 4.4.2, p. 267).
- The directional derivative of `f` is `max {⟪d, ∇φ (·) t x⟫ | t active}`; for finitely many
  smooth functions this is Borwein–Lewis, Prop 2.3.2, p. 28. It is a target in prose, and the
  first step of the proof.

*Proof route.* Compute `dirDeriv f x d` as the maximum over active `t` by compactness and joint
continuity; the right side is the support function of the convex hull of the active gradients,
which is compact. Then the max formula 3.2 and 2.1 identify the subdifferential.

*Needs:* 2.1, 3.1, 3.2.

### 3.5 Calculus under a continuity qualification

- **Sum rule** (`subdifferential_add_of_continuousAt`). On a real normed space, for convex `f`,
  `g` that are never `⊥`, if both are finite at `x₀` and `g` is continuous at `x₀`, then
  `subdifferential (f + g) x = subdifferential f x + subdifferential g x` at every `x`, for the
  evaluation pairing (Borwein–Vanderwerff, Thm 4.1.19, p. 135; Bauschke–Combettes, Cor 16.48(ii),
  p. 277, for Hilbert spaces).
- **Linear chain rule** (`subdifferential_comp_of_continuousAt`). For a bounded linear
  `A : E →L[ℝ] F` and a convex `g` that is never `⊥`, finite and continuous at `A x₀`, the
  subdifferential of `g ∘ A` at `x` is the image of the subdifferential of `g` at `A x` under
  `u ↦ u.comp A` (Borwein–Vanderwerff, Thm 4.1.19, p. 135).
- Without a qualification, every sum of a subgradient of `f` and one of `g` at `x` is a
  subgradient of `f + g` at `x`, for any pairing and any `f`, `g`; this is a target in prose.
- The indicator rule of VariationalMethods §2.1 is the case `f = convexIndicator C`, whose
  subdifferential at `x ∈ C` is `normalCone B C x` (Bauschke–Combettes, Example 16.13, p. 267).

*Proof route.* For `u ∈ subdifferential (f + g) x`, separate in `E × ℝ` the epigraph of
`f - f x - (u - ·)` from the hypograph of `g x - g`, whose interior is nonempty by continuity of
`g` at `x₀` (`geometric_hahn_banach_of_nonempty_interior_point`); the separating functional splits
`u`. The chain rule is the sum rule for `δ_{graph A}` and `g` on `E × F`, or directly by the same
separation.

*Needs:* 3.2; Mathlib `geometric_hahn_banach_of_nonempty_interior_point`.

### 3.6 Calculus under the relative-interior qualification

- **Sum rule** (`subdifferential_add_of_intrinsicInterior`). On a finite-dimensional inner
  product space, for convex `f`, `g` that are never `⊥` and whose domains have intersecting
  relative interiors, `subdifferential (f + g) x = subdifferential f x + subdifferential g x` at
  every `x` (Hiriart-Urruty–Lemaréchal II, Ch. X, Thm 2.3.2, p. 62, for the conjugate of the sum,
  from which the rule follows by Fenchel–Young).
- **Linear chain rule** (`subdifferential_comp_of_intrinsicInterior`). For a linear
  `A : E →L[ℝ] F` between finite-dimensional inner product spaces and a convex `g` that is never
  `⊥`, if some `A x₀` lies in the relative interior of the domain of `g`, then the subdifferential
  of `g ∘ A` at `x` is the image under `ContinuousLinearMap.adjoint A` of the subdifferential of
  `g` at `A x` (Hiriart-Urruty–Lemaréchal II, Ch. X, Thm 2.2.3, p. 58, for the conjugate).
- **Relative interior of a linear image** (`intrinsicInterior_linearMap_image`). For a linear
  map `L` between finite-dimensional real normed spaces and a convex set `C`, the relative
  interior of `L '' C` is the image of the relative interior of `C` (Rockafellar–Wets,
  Prop 2.44(a), p. 66). With Mathlib's `intrinsicInterior_prod_eq` and `L (a, b) = a - b` this
  gives `ri (C - D) = ri C - ri D` for convex `C`, `D`.

*Proof route.* The inclusion `⊇` is the unqualified rule of 3.5. For `⊆`, fix
`u ∈ subdifferential (f + g) x` and set `φ y = ⨅ z, f z - ⟪z, u⟫ + g (z + y)`. Then `φ` is convex,
`φ 0 = f x + g x - ⟪x, u⟫` is finite and attained at `z = x`, and `dom φ = dom g - dom f`, whose
relative interior `ri dom g - ri dom f` contains `0` by the image rule. A convex function finite
at a relative-interior point of its domain is never `⊥`, so 3.2 gives a subgradient `w` of `φ` at
`0`. Taking `z = x` in the infimum gives `w ∈ subdifferential g x`, and taking `y = x - z` gives
`u - w ∈ subdifferential f x`. The chain rule is the same argument for
`φ y = ⨅ z, g (A z + y) - ⟪z, u⟫`, whose domain `dom g - range A` has `0` in its relative
interior when some `A x₀` is in `ri dom g`; the second substitution gives
`u = ContinuousLinearMap.adjoint A w`.

*Needs:* 3.2, 3.5; Mathlib `intrinsicInterior_prod_eq`.

### 3.7 Tangent and normal cones

- **Polarity** (`posTangentConeAt_eq_and_normalCone_polar`). For a convex set `C` in a real
  Hilbert space and `x ∈ C`, Mathlib's one-sided tangent cone `posTangentConeAt C x` is the
  closure of the cone `{t • (c - x) | t > 0, c ∈ C}`; the normal cone is its polar; and the
  tangent cone is the polar of the normal cone (Bauschke–Combettes, Prop 6.44(i), p. 127;
  Rockafellar–Wets, Thm 6.9, p. 203).
- **Intersections** (`normalCone_inter_of_intrinsicInterior`). For convex `C`, `D` in a
  finite-dimensional inner product space with `intrinsicInterior ℝ C ∩ intrinsicInterior ℝ D`
  nonempty, the normal cone of `C ∩ D` at `x ∈ C ∩ D` is the sum of the normal cones.
- The normal cone at a point of `interior C` is `{0}` (Bauschke–Combettes, Prop 6.44(ii),
  p. 127); this is a target in prose.

*Proof route.* The first claim: `posTangentConeAt C x` consists of limits of `cₙ (yₙ - x)` with
`cₙ ≥ 0`, `yₙ ∈ C`, `yₙ → x`; convexity lets `yₙ = x + sₙ (c - x)` be chosen on segments. The
sign condition `cₙ ≥ 0` is essential: the two-sided `tangentConeAt ℝ C x` is symmetric under
negation and is in general larger. Polarity is the
bipolar theorem for cones (2.2). Intersections: the subdifferential of the indicator is the
normal cone (Bauschke–Combettes, Example 16.13, p. 267), and the sum rule 3.6 for the two
indicators gives the formula.

*Needs:* 2.2, 3.6; Mathlib `posTangentConeAt`.

### 3.8 Nearest points and Moreau's decomposition

- **Normal cones and nearest points** (`mem_normalCone_iff_isMinOn`). For a convex set `C` in a
  real Hilbert space, `x ∈ C`, and `γ > 0`, `u` is in the normal cone of `C` at `x` exactly when
  `x` is a nearest point of `C` to `x + γ • u` (Bauschke–Combettes, Prop 6.47, p. 127, for closed
  `C`). With `C` closed this is `u ∈ N_C(x) ↔ P_C (x + γ u) = x`.
- **Moreau's decomposition for cones** (`exists_unique_moreau_decomposition`). For a closed
  convex cone `K` in a real Hilbert space and any `x`, there are unique `a ∈ K` and `b` in the
  polar cone with `a + b = x` and `⟪a, b⟫ = 0`; and `a` and `b` are the nearest points of `K` and
  of the polar cone to `x` (Bauschke–Combettes, Thm 6.30, p. 123).

*Proof route.* The first headline is Mathlib's variational characterization
`norm_eq_iInf_iff_real_inner_le_zero`, rewritten with `c - x` and scaled by `γ`. For Moreau: let
`a` be the nearest point of `K` (`exists_norm_eq_iInf_of_complete_convex`); then `x - a` is
normal to `K` at `a`, which for a cone means `x - a` is in the polar and orthogonal to `a`.
Uniqueness: two decompositions give `‖a - a'‖² = ⟪a - a', b' - b⟫ ≤ 0`.

*Needs:* 3.7; Mathlib `exists_norm_eq_iInf_of_complete_convex`,
`norm_eq_iInf_iff_real_inner_le_zero`, `ProperCone.innerDual`.

**Checks.**

- `dirDeriv |·| 0 d = |d|`.
- `dirDeriv (x²) 1 d = 2d`.
- Negative control for convexity in `tendsto_dirDeriv`: `f x = √|x|` at `0` has quotients
  `√|d| / √t`, whose infimum over `t > 0` is `0` but whose limit at `0⁺` is `⊤` for `d ≠ 0`.
- Max formula: `subdifferential |·| 0 = [-1, 1]`, and `max {u d | u ∈ [-1, 1]} = |d|`.
- Negative control for continuity in the max formula: `f = -√x` on `[0, ∞)` and `⊤` elsewhere is
  convex and finite at `0` but has empty subdifferential there, since `dirDeriv f 0 1 = ⊥`.
- Relative interior: `convexIndicator ([0, 1] × {0})` in `ℝ²` has subdifferential
  `{0} × ℝ` at `(1/2, 0)`, a relative-interior point of a domain with empty interior.
- Singleton subdifferential: `x²/2` has `{x}` at every `x`; `|·|` has `[-1, 1]` at `0` and is not
  differentiable there.
- Negative control for interiority in 3.3: `x²/2 + δ_[0,∞)` is differentiable at no boundary
  point but `subdifferential` at `0` is `(-∞, 0]`, not a singleton, so 3.3 says nothing there.
- Monotone gradient: `x³` on `ℝ` has `(3x² - 3y²)(x - y) < 0` at `x = 0`, `y = -1`, and is not
  convex.
- Danskin: `φ x t = t x` on `K = [-1, 1]` gives `f = |·|`; at `x = 0` every `t` is active and the
  convex hull of the gradients `t` is `[-1, 1]`.
- Danskin, one active index: at `x = 2` only `t = 1` is active and the subdifferential is `{1}`.
- Sum rule: `subdifferential (|·| + δ_[0,∞)) 0 = [-1, 1] + (-∞, 0] = (-∞, 1]`.
- Negative control for the qualification: in `ℝ²`, `f = δ` of the disc of radius `1` about
  `(0, 1)` and `g = δ` of the `x`-axis meet only at `0`; the subdifferential of `f + g` at `0` is
  all of `ℝ²`, but the sum of the normal cones is `{0} × ℝ`, and neither is continuous at a common
  point nor do the relative interiors meet.
- Normal cone: the normal cone of `[0, 1]` is `[0, ∞)` at `1` and `{0}` at `1/2`.
- Tangent cone: `posTangentConeAt [0, 1] 0 = [0, ∞)`, whose polar `(-∞, 0]` is the normal cone of
  `[0, 1]` at `0`.
- Negative control for the one-sided cone: `tangentConeAt ℝ [0, 1] 0 = ℝ` by Mathlib's
  `tangentConeAt_eq_univ`, whose polar is `{0}`, not the normal cone `(-∞, 0]`.
- Negative control for `x ∈ C` in `normalCone`: at `x = 2 ∉ [0, 1]` the formula gives
  `[0, ∞)`, which is why every target uses the normal cone only at points of `C`.
- `mem_normalCone_iff_isMinOn`: with `C = [0, 1]`, `x = 1`, `u = 3`, `γ = 1`, the nearest point
  of `C` to `4` is `1`.
- Moreau: in `ℝ²` with `K` the first quadrant, `x = (1, -2)` splits as `a = (1, 0)`,
  `b = (0, -2)`, with `⟪a, b⟫ = 0`.

### Examples

- The subdifferential of a norm at `x ≠ 0` is the set of dual unit vectors norming `x`, by
  Danskin's theorem for the supremum over the dual unit ball.
- The largest eigenvalue of a symmetric matrix is the maximum of `⟪v, X v⟫` over unit `v`, and
  its subdifferential is the convex hull of `v vᵀ` over top eigenvectors.

### Dependencies

Layers 1–2; Tau Ceti subdifferential, Fermat rule and interior subgradients.

## Layer 4: strong convexity, Legendre functions and monotone structure

The infinitesimal theory of Layer 3 seen globally: strong convexity and Lipschitz gradients are
dual, essential smoothness and essential strict convexity are dual, subdifferentials are exactly
the maximal cyclically monotone sets, and subgradients exist densely.

### 4.1 Strong convexity

- **Minimizers of strongly convex functions** (`strongConvex_minimizer_spec`). Let `f` be proper
  and closed on a real Hilbert space with `f - μ/2 ‖·‖²` convex for some `μ > 0`. Then `f` has a
  unique minimizer `z`; `f x ≥ f z + μ/2 ‖x - z‖²` for all `x`; and the subdifferential is
  `μ`-strongly monotone, `μ ‖x₁ - x₂‖² ≤ ⟪x₁ - x₂, y₁ - y₂⟫` (Bauschke–Combettes, Cor 11.17,
  p. 194, for existence and uniqueness).
- For real-valued `f` on a convex set, convexity of `f - μ/2 ‖·‖²` is Mathlib's
  `StrongConvexOn` by `strongConvexOn_iff_convex` (Hiriart-Urruty–Lemaréchal I, Ch. IV,
  Prop 1.1.2, p. 144).

*Proof route.* Existence: `f - μ/2 ‖·‖²` has an affine minorant (Tau Ceti
`exists_affine_le_of_lt`), so `f` is coercive and the direct method in the weak topology applies
(VariationalMethods §1.4, or directly with Tau Ceti's weak compactness). Growth: `0` is a
subgradient at `z`; the sum rule 3.5 for `f = (f - μ/2 ‖·‖²) + μ/2 ‖·‖²`, whose second term is
continuous with gradient `μ z` at `z`, gives `-μ z ∈ ∂(f - μ/2 ‖·‖²) z`, and that subgradient
inequality rearranges to the bound. Strong monotonicity: add the two subgradient
inequalities of `f - μ/2 ‖·‖²`.

*Needs:* 3.5; Tau Ceti `exists_affine_le_of_lt`, `mem_subdifferential_of_hasFDerivAt`,
`isCompact_toWeakSpace_of_isClosed_of_convex_of_isBounded`; Mathlib `strongConvexOn_iff_convex`.

### 4.2 Strong convexity and smooth conjugates

- **Strong convexity and Lipschitz gradients**
  (`strongConvex_iff_lipschitz_gradient_fenchelConjugate`). For a proper closed convex `f` on a
  real Hilbert space and `μ > 0`, `f - μ/2 ‖·‖²` is convex exactly when `f*` is finite everywhere
  and differentiable with a `μ⁻¹`-Lipschitz gradient (Bauschke–Combettes, Thm 18.15, p. 322;
  Hiriart-Urruty–Lemaréchal II, Ch. X, Thm 4.2.1, p. 82, and Thm 4.2.2, p. 83, in finite
  dimension).
- Dually, a finite convex `f` with `L`-Lipschitz gradient has `f* - (1/(2L)) ‖·‖²` convex; this is
  the headline applied to `f*` with Fenchel–Moreau, and a target in prose.

*Proof route.* Forward: by 4.1 applied to `f - ⟪·, y⟫`, the supremum defining `f* y` is attained
at a unique `x(y)`, which is the gradient of `f*` by subgradient reciprocity
(`mem_subdifferential_fenchelConjugate_iff`); strong monotonicity gives
`‖x(y₁) - x(y₂)‖ ≤ μ⁻¹ ‖y₁ - y₂‖`. Backward: a convex function with `μ⁻¹`-Lipschitz gradient
satisfies the cocoercivity inequality, and conjugating the quadratic upper bound gives the
quadratic lower bound for `f = f**`.

*Needs:* 4.1; Tau Ceti `mem_subdifferential_fenchelConjugate_iff`,
`fenchelConjugate_innerₗ_fenchelConjugate_innerₗ`.

### 4.3 Functions of Legendre type

- **Definitions.** On a finite-dimensional inner product space:
  - `IsEssentiallySmooth f`: the interior of the domain is nonempty, `f` is differentiable on it,
    and `subdifferential (innerₗ E) f x` is empty at every `x` outside it. This is
    Rockafellar–Wets' "almost differentiable" (Thm 11.13(a), p. 483).
  - `IsEssentiallyStrictlyConvex f`: `f` is strictly convex on every convex set of points where
    its subdifferential is nonempty.
  - `IsLegendre f`: both.
- **Steepness** (`isEssentiallySmooth_iff_tendsto_norm_gradient`). For a proper closed convex
  `f` on a finite-dimensional inner product space, `IsEssentiallySmooth f` holds exactly when the
  interior of the domain is nonempty, `f` is differentiable on it, and `‖∇f xₙ‖ → ∞` whenever
  `xₙ` in the interior of the domain converges to a point of the frontier of that interior
  (Borwein–Vanderwerff, Def 7.1.1(a), p. 338, for the steep form, and Thm 7.3.8(a), p. 345, for
  its equivalence with `∂f` single-valued and locally bounded on its domain). It is the form in
  which essential smoothness enters the Gärtner–Ellis theorem.
- **Strict–smooth duality**
  (`isEssentiallySmooth_iff_isEssentiallyStrictlyConvex_fenchelConjugate`). A proper closed
  convex `f` is essentially smooth exactly when `f*` is essentially strictly convex
  (Borwein–Lewis, Thm 4.2.5, p. 78; Rockafellar–Wets, Thm 11.13, p. 483).
- **Legendre transform** (`IsLegendre.fenchelConjugate_and_bijOn_gradient`). If a proper closed
  convex `f` is of Legendre type, so is `f*`, and `∇f` is a bijection from the interior of the
  domain of `f` onto that of `f*`, with `∇f* (∇f x) = x` (Borwein–Vanderwerff, Thm 7.3.7, p. 345,
  for reflexive spaces).

*Proof route.* By reciprocity, `∂f* = (∂f)⁻¹`. Essential smoothness says `∂f` is single-valued
and lives on the interior of the domain; essential strict convexity of `f*` says no two points of
`dom ∂f*` share a subgradient, that is, `(∂f*)⁻¹ = ∂f` is single-valued. Making both precise uses
3.2 (nonempty on the relative interior) and 3.3. The Legendre statement combines the two
directions and the symmetry `f** = f`.

Steepness: `IsEssentiallySmooth f` gives `∂f` single-valued on its domain, which is the interior
of `dom f`, and locally bounded there, by 3.3 and continuity on the interior. Conversely, if `∂f`
is single-valued and locally bounded on its domain, then the domain of `f` has interior, since
otherwise `∂f` at a relative-interior point contains a translate of the orthogonal complement of
the affine span (3.2); and `∂f x` is empty at a frontier point `x`, since a subgradient there
plus the nonzero normals of 1.1 would give a second one. Borwein–Vanderwerff's Thm 7.3.8(a)
identifies single-valued, locally bounded `∂f` with the steep form.

*Needs:* 1.1, 3.2, 3.3; Tau Ceti `mem_subdifferential_fenchelConjugate_iff`.

### 4.4 Monotone and cyclically monotone subdifferentials

- **Definition** (`IsMonotoneSet`). A set `Γ ⊆ E × F` is monotone for `B` when
  `0 ≤ B (x₁ - x₂) (y₁ - y₂)` for all pairs in it. Maximality is Mathlib's `Maximal`.
- **Rockafellar's maximal monotonicity theorem** (`maximal_isMonotoneSet_subdifferential`). The
  graph of the subdifferential of a proper closed convex function on a real Hilbert space is a
  maximal monotone set (Bauschke–Combettes, Thm 20.25, p. 354; Borwein–Vanderwerff, Thm 6.1.5,
  p. 278, for Banach spaces).
- **Rockafellar's cyclic monotonicity theorem** (`maximal_isCyclicallyMonotone_iff`). A set
  `Γ ⊆ H × H` is maximal among cyclically monotone sets, in Tau Ceti's sense
  `IsCyclicallyMonotone (pairingCost (innerₗ H))`, exactly when it is the graph of the
  subdifferential of a proper closed convex function (Bauschke–Combettes, Thm 22.18, p. 389,
  with Prop 22.14, p. 388).
- **Uniqueness of the potential** (`exists_eq_add_const_of_subdifferential_eq`). Two proper
  closed convex functions on a real Hilbert space with the same subdifferential differ by a
  constant.
- On `ℝ` every maximal monotone set is maximal cyclically monotone, hence a subdifferential
  (Bauschke–Combettes, Cor 22.23, p. 391); this is a target in prose.

*Proof route.* Maximal monotonicity: for `(x, u)` monotonically related to the graph, minimize
`f + ‖· - x‖²/2 - ⟪·, u⟫` (strongly convex, so 4.1 applies), and the optimality condition places
`(x, u)` in the graph. Cyclic monotonicity: the graph of `∂f` is cyclically monotone by summing
subgradient inequalities around a cycle; a cyclically monotone `Γ` lies in the graph of `∂f` for
the potential of Tau Ceti's `isCyclicallyMonotone_pairingCost_iff_exists_fenchelConjugate`, and
maximality forces equality. Uniqueness: for proper closed convex `f` and `x₀` in the domain of
`∂f`, `f x - f x₀` is the supremum, over chains `x₀, x₁, …, xₙ = x` with subgradients `uᵢ`,
of `∑ ⟪xᵢ₊₁ - xᵢ, uᵢ⟫`; the right side depends only on the graph.

*Needs:* 4.1; Tau Ceti `IsCyclicallyMonotone`, `pairingCost`,
`isCyclicallyMonotone_pairingCost_iff_exists_fenchelConjugate`.

### 4.5 Generic differentiability

- **Mazur's theorem** (`exists_isGδ_gateaux`). On a separable real Banach space, a continuous
  convex function on an open convex set `U` is Gâteaux differentiable, with a continuous linear
  derivative, on a dense `G_δ` subset of `U` (Borwein–Vanderwerff, Thm 4.6.3, p. 198).
- **Separable duals** (`exists_isGδ_differentiableAt`). If the dual of a real Banach space is
  separable, a continuous convex function on an open convex set `U` is Fréchet differentiable on
  a dense `G_δ` subset of `U` (Borwein–Vanderwerff, Thm 4.6.6, p. 199, on the whole space).

*Proof route.* Mazur: for a dense sequence `vₖ`, the set where
`dirDeriv f x vₖ + dirDeriv f x (-vₖ) < 1/n` is open (upper semicontinuity of `dirDeriv` in `x`)
and dense (a convex function of one variable is differentiable off a countable set); intersect.
Fréchet: the points where `f` is Fréchet differentiable form a `G_δ` (the oscillation of the
quotients on the unit ball is upper semicontinuous), and Borwein–Vanderwerff show its complement
is angle-small, hence of first category, so it is dense by Baire. The open-set version is the
same argument localized to `U`.

*Needs:* 3.1, 3.2; Mathlib `HasLineDerivAt`, `IsGδ`.

### 4.6 The Brøndsted–Rockafellar theorem

- **Definition** (`epsSubdifferential`). For `ε ≥ 0`,
  `epsSubdifferential B ε f x = {y | f x finite, ∀ x', f x + B (x' - x) y - ε ≤ f x'}`
  (Hiriart-Urruty–Lemaréchal II, Ch. XI, Def 1.1.1, p. 92). At `ε = 0` it is the subdifferential.
- **Brøndsted–Rockafellar theorem** (`exists_mem_subdifferential_near`). For a proper closed
  convex function on a real Banach space, `ε > 0`, `r > 0`, and an `ε`-subgradient `y₀` at `x₀`,
  there are `x` and `y ∈ subdifferential f x` with `‖x - x₀‖ ≤ r` and `‖y - y₀‖ ≤ ε / r`
  (Borwein–Vanderwerff, Thm 4.3.2, p. 162).
- In particular the domain of the subdifferential is dense in the domain of `f`; this is a target
  in prose.

*Proof route.* Tau Ceti's Ekeland principle
`LowerSemicontinuous.exists_add_mul_dist_le_and_lt_add_mul_dist`, applied with weight `ε / r` to
the real-valued function `f - y₀` on the closed, hence complete, sublevel set
`{x | f x - y₀ x ≤ f x₀ - y₀ x₀}`, where it is bounded below by `f x₀ - y₀ x₀ - ε`, gives a point
`x` that minimizes `f - y₀ + (ε / r) ‖· - x‖`; the sum rule 3.5, with the norm continuous, yields
`y ∈ subdifferential f x` with `‖y - y₀‖ ≤ ε / r`.

*Needs:* 3.5; Tau Ceti `LowerSemicontinuous.exists_add_mul_dist_le_and_lt_add_mul_dist`.

**Checks.**

- Strong convexity: `f = x²/2 + |x|` with `μ = 1` has minimizer `0` and `f x ≥ x²/2`.
- 4.2: the conjugate of `x²/2 + |x|` is `(max (|y| - 1) 0)²/2`, finite with the `1`-Lipschitz
  gradient soft thresholding; at `y = 2` it is `0.5` and at `y = -3` it is `2`.
- Negative control for 4.2: `|·|` is not strongly convex, and its conjugate `δ_[-1,1]` is not
  finite.
- Negative control for closedness in 4.1: `f = δ_(0, 1] + x²` on `ℝ` is strongly convex and proper
  but not closed, and has no minimizer.
- `IsEssentiallySmooth (-log)` with `⊤` on `(-∞, 0]`: the domain `(0, ∞)` is open and the
  subdifferential is empty off it.
- `IsEssentiallySmooth` fails for `x²/2 + δ_[0,∞)`, whose subdifferential at `0` is `(-∞, 0]`.
- `IsEssentiallySmooth` fails for `|·|`, which is not differentiable at the interior point `0`.
- Steepness: for `-log` the gradient norm `1/x` tends to `∞` as `x ↓ 0`; for `x²/2 + δ_[0,∞)`
  the gradient `x` tends to `0`, matching the failure of `IsEssentiallySmooth` there.
- Negative control for closedness in the steepness equivalence: `δ_(0,1)` on `ℝ` is convex and
  proper but not closed; it is essentially smooth (differentiable on `(0, 1)`, no subgradient off
  it), yet its gradient is `0`, so it is not steep.
- `IsEssentiallyStrictlyConvex (x²/2)` holds.
- `IsEssentiallyStrictlyConvex` fails for `|·|`, which is affine on `[0, ∞)` where it has
  subgradients.
- `IsEssentiallyStrictlyConvex` fails for `δ_[-1,1]`, constant on `[-1, 1]` where it has
  subgradients; consistently with 4.3 it is the conjugate of `|·|`, which is not essentially
  smooth.
- `IsLegendre` holds for `x log x - x` on `[0, ∞)` (value `0` at `0`): its conjugate is `exp`
  (`exp 1 = 2.71828…` and `exp 2 = 7.38906…` recomputed as suprema), and `∇f = log` is a
  bijection `(0, ∞) → ℝ` with inverse `exp = ∇f*`.
- `IsLegendre (-log)`: its conjugate is `-1 - log (-y)` on `y < 0`, again of Legendre type, and
  `∇f x = -1/x` maps `(0, ∞)` onto `(-∞, 0)`.
- Negative control for `IsLegendre`: `x²/2 + δ_[0,∞)` is not essentially smooth, and its
  conjugate `(max y 0)²/2` is not strictly convex on `(-∞, 0]`.
- `IsMonotoneSet` holds for the graph of the identity.
- `IsMonotoneSet` holds for the graph of the rotation `J (x₁, x₂) = (-x₂, x₁)`, since
  `⟪J v, v⟫ = 0`.
- Negative control for `IsMonotoneSet`: the graph of `x ↦ -x` on `ℝ` is not monotone.
- The rotation is not cyclically monotone: on the cycle `(1,0), (0,1), (-1,0), (0,-1)` the
  pairing cost is `0` on the graph and `-4` after shifting each image back by one step.
- `epsSubdifferential` of `x²/2` at `0` is `[-√(2ε), √(2ε)]`; for `ε = 1/2` it is `[-1, 1]`.
- `epsSubdifferential` of `|·|` at `1` is `[1 - ε, 1]` for `ε ≤ 2`.
- Negative control for finiteness in `epsSubdifferential`: at a point where `f = ⊤` it is empty,
  not the whole space that the inequality alone would give.

### Examples

- Bregman divergences of a Legendre function, such as the Kullback–Leibler divergence of
  `x log x - x`, are defined on the interior of its domain by 4.3.
- The `ℓ¹` norm is Gâteaux differentiable exactly at the sequences with no zero entry, a dense
  `G_δ` as Mazur's theorem predicts, and Fréchet differentiable nowhere; this is consistent with
  4.5 because the dual `ℓ^∞` of `ℓ¹` is not separable.

### Dependencies

Layer 3; Tau Ceti reciprocity and cyclic monotonicity; VariationalMethods §1.4 as an
alternative route to existence in 4.1.

## Layer 5: duality

Each duality theorem is the existence of a subgradient of a convex value function at `0`, under
the qualification that makes `0` a point of continuity or of the relative interior of its
domain.

### 5.1 Fenchel–Rockafellar duality

- **Continuity qualification** (`fenchelRockafellar_of_continuousAt`). On real normed spaces, for
  convex `f`, `g` that are never `⊥` and a bounded linear `A`, if `f x₀` and `g (A x₀)` are finite
  and `g` is continuous at `A x₀`, then
  `⨅ x, f x + g (A x) = ⨆ u, -f* (-(u ∘ A)) - g* u` in `EReal`, and if the common value is not `⊥`
  the supremum is attained (Borwein–Vanderwerff, Thm 4.4.18, p. 177; Bauschke–Combettes,
  Thm 15.23, p. 255, for Hilbert spaces).
- **Relative-interior qualification** (`fenchelRockafellar_of_intrinsicInterior`). On
  finite-dimensional inner product spaces, the same conclusion, with `ContinuousLinearMap.adjoint`
  in place of `u ∘ A`, holds when some `x₀` in the relative interior of the domain of `f` has
  `A x₀` in the relative interior of the domain of `g` (Borwein–Lewis, Thm 3.3.5, p. 52, and
  Borwein–Vanderwerff, Thm 2.3.4, p. 46, under the core condition).
- Weak duality `⨆ u, -f* (-(u ∘ A)) - g* u ≤ ⨅ x, f x + g (A x)` holds with no hypothesis, by
  Fenchel–Young; this is a target in prose.
- **Conjugate of a sum** (`fenchelConjugate_add_of_continuousAt`,
  `fenchelConjugate_add_of_intrinsicInterior`). For convex `f`, `g` that are never `⊥`, if `g`
  is finite and continuous at a point of `dom f` (normed tier), or `ri dom f ∩ ri dom g` is
  nonempty (Euclidean tier), then `(f + g)* = infConv f* g*` for the pairing of the tier, and at
  every `u` where this value is not `⊤` the infimum defining `infConv f* g* u` is attained
  (Hiriart-Urruty–Lemaréchal II, Ch. X, Thm 2.3.2, p. 62, for proper closed convex functions
  under the relative-interior qualification; Bauschke–Combettes, Prop 15.2, p. 247, in Hilbert
  space under `0 ∈ core (dom f - dom g)`).

*Proof route.* The value function `v y = ⨅ x, f x + g (A x + y)` is convex, and its conjugate is
`u ↦ f* (-(u ∘ A)) + g* u`. Under either qualification `0` is a point of continuity, or a
relative-interior point, of `dom v`, so `v` has a subgradient `-u` at `0` (3.2) when `v 0 ≠ ⊥`,
and `v 0 = -v* (-u)` is the dual value at `u`. In the Euclidean tier, `dom v = dom g - A (dom f)`
and the relative interior of this set is `ri dom g - A (ri dom f)` by the image rule of 3.6. The
conjugate of a sum is the case `A = id` with `f` replaced by `f - B (·) u`: the primal value is
`-(f + g)* u`, and the attained dual supremum is `-infConv f* g* u` with its minimizer.

*Needs:* 3.2, 3.6 (relative interior of a linear image); 2.3 (`infConv`); Tau Ceti
`le_add_fenchelConjugate`.

### 5.2 The Karush–Kuhn–Tucker theorem

- **Necessity under Slater** (`exists_kkt_of_slater`). On a finite-dimensional inner product
  space, let `f` and `gᵢ` (`i` in a finite type) be real convex functions and `A x = b` a linear
  constraint with values in a finite-dimensional inner product space. If some `x` has `gᵢ x < 0`
  for all `i` and `A x = b`, then every minimizer `x*` of `f` on
  `{x | ∀ i, gᵢ x ≤ 0, A x = b}` has multipliers `λᵢ ≥ 0` and `y` with `λᵢ gᵢ x* = 0` and
  `0 ∈ ∂f x* + ∑ λᵢ ∂gᵢ x* + Aᵀ y` (Hiriart-Urruty–Lemaréchal I, Ch. VII, Thm 2.2.5, p. 310;
  Borwein–Lewis, Thm 3.2.8, p. 44; Boyd–Vandenberghe, §5.5.3, pp. 243–244, for differentiable
  data).
- **Sufficiency** (`isMinOn_of_kkt`). A feasible point with such multipliers is a minimizer,
  with no constraint qualification and no convexity hypothesis: the subgradient inequalities
  carry the argument (Hiriart-Urruty–Lemaréchal I, Ch. VII, Thm 2.2.5, p. 310, for convex data).

*Proof route.* Necessity is Fenchel duality 5.1 for `f` and the indicator of the feasible set,
whose normal cone at `x*` is computed by the sum rule 3.6 and Danskin 3.4 for `max gᵢ`; Slater's
point is in the interior of `{max gᵢ ≤ 0}` within the affine set `{A x = b}`. Sufficiency: sum the
subgradient inequalities with weights `1`, `λᵢ`, and use complementary slackness.

*Needs:* 3.4, 3.6, 5.1.

### 5.3 Linear programming

- **Linear-programming duality** (`linearProgramming_duality`). If
  `min c ⬝ᵥ x` over `A x = b`, `x ≥ 0` is feasible and bounded below, the primal and the dual
  `max b ⬝ᵥ y` over `Aᵀ y ≤ c` both have solutions, with equal values; and a primal-feasible `x`
  and dual-feasible `y` have equal values exactly when complementary slackness
  `xⱼ (c - Aᵀ y)ⱼ = 0` holds for all `j` (Borwein–Lewis, Cor 5.3.7, p. 111;
  Boyd–Vandenberghe, §5.2.4, p. 227, and §5.5.2, p. 242).
- If the primal is infeasible, the dual is infeasible or unbounded, and symmetrically; this is
  a target in prose, from Farkas' lemma.

*Proof route.* Farkas' lemma 1.4 applied to the system `A x = b`, `x ≥ 0`, `c ⬝ᵥ x ≤ t` for the
optimal `t`, augmented by one row, gives the dual solution; attainment of the primal is closedness
of the finitely generated cone `{(A x, c ⬝ᵥ x) | x ≥ 0}` (as in 1.4). Complementary slackness is the
identity `c ⬝ᵥ x - b ⬝ᵥ y = x ⬝ᵥ (c - Aᵀ y)` with nonnegative terms.

*Needs:* 1.3, 1.4.

### 5.4 Conic duality

- **Conic duality** (`conic_duality`). For a closed convex cone `K` in a finite-dimensional inner
  product space, the program `⨅ ⟪c, x⟫` over `A x = b`, `x ∈ K` has the dual
  `⨆ ⟪b, y⟫` over `c - Aᵀ y ∈ K*`. If some `x` in the interior of `K` has `A x = b` and the
  primal value is not `⊥`, the values are equal and the dual is attained (Borwein–Lewis,
  Cor 5.3.6, p. 110; Boyd–Vandenberghe, §5.9, p. 265, and Example 5.12, p. 266).
- Strict dual feasibility, a `y` with `c - Aᵀ y` in the interior of `K*`, and a finite dual value
  give equality and primal attainment; this is the same theorem for the dual program and a
  target in prose.

*Proof route.* Fenchel–Rockafellar 5.1 for `f = ⟪c, ·⟫ + δ_K` and `g = δ_{b}` with the map `A`:
the conjugates are `δ` of `c - K*` translated and `⟪b, ·⟫`, and Slater's point is a point of the
interior of the domain of `f` mapped into the domain of `g`, so the relative-interior form
applies.

*Needs:* 5.1; Mathlib `ProperCone.innerDual`.

**Checks.**

- Fenchel–Rockafellar: `f = x²/2`, `g = (x - 1)²/2`, `A = id` on `ℝ` give primal value `1/4` at
  `x = 1/2`; the dual is `max -u²/2 - (u²/2 + u) = 1/4` at `u = -1/2`.
- Negative control for attainment without a qualification: on `ℝ`, `f = δ_(-∞,0]` and
  `g x = -√x` for `x ≥ 0`, `⊤` for `x < 0`, with `A = id`. The primal value is `0`, at `x = 0`.
  For `u < 0`, `f* (-u) = 0` and `g* u = -1/(4u)`, so the dual objective is `1/(4u)`, with
  supremum `0` approached as `u → -∞` and not attained (`-0.0025` at `u = -100`). The relative
  interiors `(-∞, 0)` and `(0, ∞)` are disjoint, and `g` is finite and continuous at no point of
  `dom f`.
- KKT: `f x = x`, `g x = 1 - x` on `ℝ`: minimizer `1`, `∂f = {1}`, `∂g = {-1}`, multiplier
  `λ = 1`.
- Negative control for Slater: `f x = x`, `g x = x²` has feasible set `{0}` and minimizer `0`,
  but `1 + λ · 0 ≠ 0` for every `λ`, so no multiplier exists; no point has `x² < 0`.
- LP: `min x₁ + 2x₂` over `x₁ + x₂ = 1`, `x ≥ 0` has `x = (1, 0)` with value `1`; the dual
  `max y` over `y ≤ 1`, `y ≤ 2` has `y = 1`; complementary slackness `x₂ (2 - 1) = 0` holds.
- Negative control for boundedness: `min -x₁` over `x₁ - x₂ = 0`, `x ≥ 0` is unbounded, and the
  dual constraints `y ≤ -1`, `-y ≤ 0` are infeasible.
- Conic duality, gap without Slater: `K = {(x, y, z) | x ≥ 0, z ≥ 0, x z ≥ y²}`, minimize `2y`
  subject to `x = 0`. Feasibility forces `y = 0`, so the primal value is `0`; the dual asks for
  `(0, 2, 0) - (t, 0, 0) ∈ K*`, and `K*` is `{(a, b, c) | a ≥ 0, c ≥ 0, 4 a c ≥ b²}`, which
  fails since `4 · (-t) · 0 = 0 < 4`; the dual is infeasible with value `⊥`. Slater fails because
  `x = 0` misses the interior of `K`.

### Examples

- The dual of a linear program in conic form and the dual of a semidefinite program are instances
  of 5.4 with `K` the orthant and the positive semidefinite cone. A convex quadratic program is an
  instance of 5.1 directly, with `f` the quadratic objective and `g` the indicator of the
  feasible set.
- Minimax: Sion's theorem (`Sion.minimax`) gives the saddle-point form for convex–concave
  functions on a compact convex set, which is the convex minimax theorem.

### Dependencies

Layers 1 and 3.

## Layer 6: integral representation

Choquet theory: compact convex sets as sets of barycenters of measures carried by extreme
points. It uses 1.2 for the finite-dimensional case and Mathlib's measure theory, and nothing
from Layers 2–5.

### 6.1 Choquet's theorem

- **Choquet's theorem** (`exists_probabilityMeasure_barycenter_extremePoints`). Let `K` be a
  compact metrizable convex subset of a Hausdorff locally convex real space. Then the extreme
  points of `K` form a Borel subset of `K`, and every `x ∈ K` is the barycenter of a probability
  measure on `K` carried by the extreme points: `∫ φ dμ = φ x` for every continuous linear `φ`
  (Simon, Thm 10.7, p. 168).
- A probability measure on such a `K` is carried by the extreme points exactly when it is
  maximal in the Choquet order (Simon, Thm 10.8, p. 169); this is a target in prose.

*Proof route.* Choose a strictly convex continuous function `h` on `K` (metrizability gives a
countable separating family of continuous affine functions, and `h = ∑ 2⁻ⁿ aₙ²`). Its upper
concave envelope `ĥ` agrees with `h` exactly at the extreme points. A Hahn–Banach and
Riesz–Markov–Kakutani argument gives a probability `μ` with barycenter `x` and
`∫ h dμ = ĥ x`, and then `μ {h < ĥ} = 0`. The extreme points are `G_δ`: the complement is the
union over `n` of the closed sets of midpoints `(a + b)/2` with `a, b ∈ K` and `d(a, b) ≥ 1/n`.

*Needs:* 1.2; Mathlib `Set.extremePoints`, `IsProbabilityMeasure`, and the Riesz–Markov–Kakutani
theorem `RealRMK.rieszMeasure` with `RealRMK.integral_rieszMeasure`
(`Mathlib/MeasureTheory/Integral/RieszMarkovKakutani/Real.lean`).

### 6.2 Uniqueness and simplices

- **Definitions.** `coneOver K = {(t • x, t) | t ≥ 0, x ∈ K}` in `V × ℝ`, ordered by
  `d ≤ a ↔ a - d ∈ coneOver K`. `IsChoquetSimplex K` asserts that any two elements of the cone have
  a least upper bound in it. For convex `K`, upper bounds of an element of the cone lie in the
  cone, so least upper bounds in the cone are least upper bounds in its span
  `coneOver K - coneOver K`, and translation moves any two elements of the span into the cone;
  hence the property says that the span, with the order of the cone, is a vector lattice,
  Simon's definition of a simplex (Simon, p. 174, where (11.5) shows that least upper bounds
  suffice).
- **Choquet–Meyer theorem** (`isChoquetSimplex_iff_existsUnique`). For a compact metrizable
  convex `K` as in 6.1, every point has exactly one representing probability measure carried by
  the extreme points if and only if `K` is a Choquet simplex (Simon, Thm 11.12, p. 182, from
  Thm 11.5, p. 175, and Thm 10.8, p. 169).

*Proof route.* Simon's route: the simplex property is equivalent to affinity of the concave
envelope `ĥ` of every continuous `h`, and to the integral `∫ h dμ` being the same, `ĥ x`, for
every maximal `μ` with barycenter `x`; maximal measures in the metrizable case are those carried
by the extreme points (6.1).

*Needs:* 6.1.

**Checks.**

- A triangle is a Choquet simplex: the cone over it in `ℝ³` is the orthant in suitable
  coordinates, a lattice.
- A segment and a point are Choquet simplices.
- `coneOver ∅ = ∅`, and `coneOver {x₀}` is the ray through `(x₀, 1)`.
- `coneOver [0, 1]` in `ℝ × ℝ` is `{(s, t) | 0 ≤ s ≤ t}`, the cone over a segment, a lattice in
  its own order.
- Negative control for the witness at `t = 0`: `(0, 0)` lies in `coneOver K` only when `K` is
  nonempty, so the empty set is a simplex vacuously and not through a degenerate cone `{0}`.
- Negative control for the lattice property: over the unit square, the cone points `((0, 0), 1)`
  and `((1, 0), 1)` have the two upper bounds `((1, 0), 2)` and `((1, 1), 2)`, which differ by
  `±((0, 1), 0)`, outside the cone; every upper bound has height at least `2`, and one of height
  `2` below both would have to be both of them, so there is no least upper bound.
- Negative control: the unit square is not a simplex, and its centre has two representing
  measures carried by the vertices, `(δ_(0,0) + δ_(1,1))/2` and `(δ_(1,0) + δ_(0,1))/2`.
- The closed unit disc is not a simplex: its centre is the barycenter of the uniform measure on
  the circle and of `(δ_v + δ_{-v})/2` for every unit `v`.
- Choquet in finite dimension: by 1.2 the representing measure can be chosen finitely supported,
  with at most `dim K + 1` atoms.

### Examples

- The probability measures on a compact metric space form a Choquet simplex whose extreme points
  are the Dirac measures.
- The invariant probability measures of a continuous map of a compact metric space form a Choquet
  simplex whose extreme points are the ergodic measures; ergodic decomposition is the uniqueness
  in 6.2.

### Dependencies

1.2; Mathlib measure theory.

## Downstream consumers

- **VariationalMethods** uses the indicator sum rule of its §2.1, which is the case
  `f = convexIndicator C` of 3.5, and can take its normal-cone calculus from 3.7.
- **OptimalTransport** §5 uses the conjugate tower that this roadmap extends; the Legendre
  transform of 4.3 and the uniqueness of potentials in 4.4 are the convex-analysis input of the
  quadratic-cost theory there.
- **OperatorAlgebraDynamics** D7 proves that the KMS states form a Choquet simplex, defined there
  by uniqueness of maximal representing measures; for metrizable state spaces 6.2 identifies that
  definition with the lattice definition used here.
- **RegretMinimizationAndEquilibria** proves the matrix-game minimax theorem, which is the
  case of 5.3 for the game's linear program.
- **MarkovDecisionProcesses** Layer 5 states linear programs for Markov decision processes
  and proves their duality directly; 5.3 is the general theorem those programs instantiate.
- The large-deviations roadmap uses essential smoothness in the Gärtner–Ellis theorem in the
  steep form of 4.3 (the gradient norm tends to infinity at the frontier of the interior of the
  domain); 4.3 owns the predicate and the equivalence of the two forms.
- The convergence theory of proximal and splitting algorithms rests on 3.5, 3.8 (the cone case
  of Moreau's decomposition), 4.1, 4.2 and 4.4.

## Scope and ownership

The roadmap is complete when Tau Ceti proves all of the following.

1. **Convex sets and cones.** Supporting hyperplanes at frontier points in finite dimension and
   nontrivial support off the relative interior; the Minkowski–Carathéodory theorem; the
   Minkowski–Weyl theorem for convex polyhedra, with bounded polyhedra as polytopes; Farkas'
   lemma.
2. **Operations on convex functions.** Support functions and their duality with indicators; the
   one-sided polar and the bipolar theorem; infimal convolution with its conjugate; the recession
   function as a limit of slopes and as the support function of the conjugate domain, and the
   recession criterion for bounded sublevel sets; the closed perspective.
3. **Subgradients and calculus.** The directional derivative and its relation to subgradients;
   the max formula at points of continuity; nonempty subdifferentials on the relative interior;
   differentiability and singleton subdifferentials, continuity of the gradient, and the
   monotone-gradient test; Danskin's theorem; the sum and linear chain rules under a continuity
   qualification on normed spaces and under the relative-interior qualification in finite
   dimension; tangent and normal cones and the normal cone of an intersection; the
   normal-cone characterization of nearest points and Moreau's decomposition for a closed convex
   cone.
4. **Strong convexity, Legendre functions and monotone structure.** Minimizers of strongly
   convex functions; the duality between strong convexity and Lipschitz gradients; essential
   smoothness, essential strict convexity and functions of Legendre type; maximal monotonicity of
   subdifferentials, Rockafellar's cyclic monotonicity theorem and uniqueness of the potential;
   Mazur's theorem and Fréchet differentiability on a dense `G_δ` when the dual is separable; the
   `ε`-subdifferential and the Brøndsted–Rockafellar theorem.
5. **Duality.** Fenchel–Rockafellar duality under a continuity qualification and under the
   relative-interior qualification; the Karush–Kuhn–Tucker theorem under Slater's condition and
   the sufficiency of its conditions; linear-programming duality with complementary slackness;
   conic duality.
6. **Integral representation.** Choquet's theorem for compact metrizable convex sets, and the
   equivalence of the Choquet simplex property with uniqueness of the representing measures.

The numbers are those of the layers below, and `k.n` names subsection `n` of Layer `k`.

**Not owned here.** The following are used, not built:
- separation of a point from a closed convex set and of a compact from a closed convex set,
  extreme points and the Krein–Milman theorem, Carathéodory's, Radon's and Helly's theorems,
  local Lipschitz continuity of convex functions on the interior and on the relative interior,
  and Sion's minimax theorem: Mathlib;
- the conjugate, Fenchel–Young, the Fenchel–Moreau theorem, subgradient reciprocity, the Fermat
  rule, the subgradient of an affine perturbation, almost-everywhere differentiability and
  Alexandrov's theorem, the Hessian test for convexity, convex polyhedra and Gordan's
  alternative: Tau Ceti (the conjugate tower is the implementation of OptimalTransport §5.1–§5.2
  and §5.4);
- the indicator of a convex set, the normal cone for the evaluation pairing and the sum rule
  `∂(E + δ_C)(u) = ∂E(u) + N_C(u)` for `E` continuous at a point of `C`: VariationalMethods §2.1.
  This roadmap uses local copies of the indicator and the normal cone; its general sum rule 3.5
  contains that indicator rule as the special case `g = E`, `f = δ_C`;
- the direct method for convex functions on reflexive spaces: VariationalMethods §1.2 and §1.4;
- the Bishop–Phelps theorem (density of support points and support functionals):
  BanachSpaceTheory B2; John's ellipsoid theorem and the Banach–Mazur distance to `ℓ₂ⁿ`:
  BanachSpaceTheory B7;
- the proximal map of a closed proper convex function (its 3.2), the Baillon–Haddad theorem (its
  1.2), projected and proximal gradient descent, the subgradient method and accelerated gradient
  methods: the first-order-methods roadmap. That roadmap also owns existence, uniqueness and
  quadratic growth for minimizers of continuous real-valued strongly convex functions (its 1.3),
  of which 4.1 is the extended-real closed form, and the variational inequality for the
  projection onto a closed convex set (its 3.1), of which `mem_normalCone_iff_isMinOn` in 3.8 is
  the normal-cone form. Moreau envelopes, the Moreau decomposition for proximal maps and the
  other splitting methods are in the boundary list;
- the finite matrix Farkas certificate over the rationals, with nonnegative inequality and free
  equality multipliers, among the rational polyhedron adapters of TensorProductCombinatorics
  §1.3; Farkas' lemma 1.4 is the real matrix form for the standard system `A x = b`, `x ≥ 0`;
- the Minkowski–Weyl theorem for cones: ScatteringDiagrams §1.1, consumed by 1.3 and 1.4;
- Ekeland's variational principle: Tau Ceti
  `LowerSemicontinuous.exists_add_mul_dist_le_and_lt_add_mul_dist`, used by 4.6;
- the matrix-game minimax theorem: RegretMinimizationAndEquilibria;
- duality with both attainments for the finite transport linear program: Tau Ceti
  `TauCeti.exists_cost_eq_finiteDualValue`, the target of OptimalTransport §2.3. It is the
  transport instance of 5.3, proved directly there and not re-derived here.

Every result that is not listed in a layer belongs to the
[boundary list](#beyond-this-roadmap-a-roadmap-for-a-roadmap-do-not-implement).

## Exact supplier contracts

### From Mathlib

- **Separation and support:** `geometric_hahn_banach_point_closed`,
  `geometric_hahn_banach_compact_closed` and `geometric_hahn_banach_of_nonempty_interior_point`
  (`Mathlib/Analysis/LocallyConvex/Separation.lean`).
- **Convex geometry:** `convexHull_eq_union` (Carathéodory), `Convex.radon_partition`,
  `Convex.helly_theorem'`, `AffineIndependent.card_le_finrank_succ`, `Set.extremePoints`,
  `IsCompact.extremePoints_nonempty` and `closure_convexHull_extremePoints` (Krein–Milman),
  `intrinsicInterior` (`Mathlib/Analysis/Convex/Intrinsic.lean`).
- **Cones:** `ProperCone`, `ProperCone.innerDual`, `ProperCone.hyperplane_separation'` and
  `ProperCone.relative_hyperplane_separation` (`Mathlib/Analysis/Convex/Cone/InnerDual.lean`);
  `PointedCone.hull`, `PointedCone.dual`, `PointedCone.DualFG`
  (`Mathlib/Geometry/Convex/Cone/DualFinite.lean`) and `Submodule.FG`.
- **Convex functions:** `ConvexOn`, `StrictConvexOn`, `StrongConvexOn` with
  `strongConvexOn_iff_convex` (`Mathlib/Analysis/Convex/Strong.lean`),
  `ConvexOn.continuousOn_tfae`, `ConvexOn.locallyLipschitzOn_interior`,
  `ConvexOn.locallyLipschitzOn_intrinsicInterior` (`Mathlib/Analysis/Convex/Continuous.lean`),
  `ConvexOn.sSup_affine_eq` (`Mathlib/Analysis/Convex/Approximation.lean`) and
  `IsMinOn.of_isLocalMinOn_of_convexOn`.
- **Hilbert spaces:** `exists_norm_eq_iInf_of_complete_convex` and
  `norm_eq_iInf_iff_real_inner_le_zero`
  (`Mathlib/Analysis/InnerProductSpace/Projection/Minimal.lean`), `innerₗ`,
  `ContinuousLinearMap.adjoint`.
- **Duals and derivatives:** `StrongDual`, `topDualPairing`, `Convex.toWeakSpace_closure`,
  `posTangentConeAt`, `tangentConeAt`, `tangentConeAt_eq_univ`, `HasLineDerivAt`, `HasGradientAt`,
  `gradient`, `DifferentiableAt`.
- **Minimax:** `Sion.minimax` (`Mathlib/Topology/Sion.lean`).
- **Order:** `Maximal`, `IsGreatest`, `IsMinOn`, `IsMaxOn`; measures `IsProbabilityMeasure`,
  `MeasurableSet` and `IsGδ`; the Riesz–Markov–Kakutani theorem `RealRMK.rieszMeasure` and
  `RealRMK.integral_rieszMeasure` (`Mathlib/MeasureTheory/Integral/RieszMarkovKakutani/Real.lean`).

### From Tau Ceti

- **Conjugate** (`TauCeti/Analysis/Convex/Conjugate.lean`): `TauCeti.fenchelConjugate`,
  `sub_le_fenchelConjugate`, `le_add_fenchelConjugate`.
- **Subdifferential** (`TauCeti/Analysis/Convex/Subdifferential.lean`):
  `TauCeti.subdifferential`, `mem_subdifferential_coe_iff_isMinOn_sub` (the Fermat rule),
  `apply_le_apply_of_mem_subdifferential`, `mem_subdifferential_iff_add_fenchelConjugate_eq`
  (Fenchel–Young equality), `mem_subdifferential_add_affine_iff`.
- **Fenchel–Moreau** (`TauCeti/Analysis/Convex/FenchelMoreau.lean`): `exists_affine_le_of_lt`,
  `fenchelConjugate_flip_fenchelConjugate_eq`, `fenchelConjugate_flip_fenchelConjugate_eq_iff`,
  `fenchelConjugate_innerₗ_fenchelConjugate_innerₗ`, and subgradient reciprocity
  `mem_subdifferential_fenchelConjugate_iff`.
- **Interior subgradients and differentiability:** `nonempty_subdifferential_of_mem_interior`
  (`TauCeti/Analysis/Convex/SubgradientImage.lean`); `hasFDerivAt_apply_eq_of_mem_subdifferential`,
  `mem_subdifferential_of_hasFDerivAt` and `hasGradientAt_toReal_of_continuousAt_subgradient`
  (`TauCeti/Analysis/Convex/Differentiability.lean`); `convexOn_toReal`
  (`TauCeti/Analysis/Convex/EffectiveDomain.lean`).
- **Second order and almost everywhere:** `ConvexOn.isPositive_of_hasFDerivAt_gradient` and
  `TauCeti.convexOn_of_hasFDerivAt_gradient` (`TauCeti/Analysis/Convex/Hessian.lean`),
  `ConvexOn.ae_differentiableAt_of_mem_interior` (`TauCeti/Analysis/Calculus/Rademacher.lean`),
  `ConvexOn.ae_existsUnique_isPositive_isLittleO` (`TauCeti/Analysis/Convex/Alexandrov.lean`).
- **Strong convexity and superlinear conjugates:** `StrongConvexOn.add_add_le_of_hasFDerivWithinAt`
  (`TauCeti/Analysis/Convex/Strong.lean`), `contDiff_fenchelConjugate_toReal_of_superlinear` and
  `mem_subdifferential_iff_eq_gradient_fenchelConjugate_of_superlinear`
  (`TauCeti/Analysis/Convex/Superlinear.lean`).
- **Cyclic monotonicity** (`TauCeti/MeasureTheory/OptimalTransport/CTransform/Rockafellar.lean`
  and its imports): `TauCeti.IsCyclicallyMonotone`, `TauCeti.pairingCost` (the cost
  `-B x y`), and `isCyclicallyMonotone_pairingCost_iff_exists_fenchelConjugate`.
- **Finite transport duality:** `TauCeti.exists_cost_eq_finiteDualValue`
  (`TauCeti/MeasureTheory/OptimalTransport/Finite/Duality.lean`), the transport instance of 5.3.
- **Polyhedra and alternatives:** `TauCeti.IsConvexPolyhedron`
  (`TauCeti/Analysis/Convex/Polyhedron/Basic.lean`), Gordan's alternative
  `exists_forall_dual_pos_iff` (`TauCeti/Geometry/Convex/Cone/Alternative.lean`).
- **Duality in normed spaces:** `StrongDual.bipolar_eq_closedAbsConvexHull`
  (`TauCeti/Analysis/LocallyConvex/Bipolar.lean`) and the weak compactness of bounded closed
  convex sets `isCompact_toWeakSpace_of_isClosed_of_convex_of_isBounded`.
- **One-variable recession constant:** `TauCeti.recessionConstant`
  (`TauCeti/Analysis/Convex/RecessionConstant.lean`), which 2.4 generalizes.

### From other roadmaps

- **VariationalMethods §2.1:** the indicator of a convex set and the normal cone, of which
  `convexIndicator` and `normalCone` are local copies with the same values (the normal cone of
  §2.1 uses the evaluation pairing; the copy here takes the pairing as a parameter and agrees
  with it for `(topDualPairing ℝ E).flip`).
- **ScatteringDiagrams §1.1:** the Minkowski–Weyl theorem for cones, that a pointed cone in a
  finite-dimensional real vector space, lineality allowed, is finitely generated exactly when it
  is the dual of a finite set of linear forms. 1.3 and 1.4 use it.

This roadmap consumes nothing else from other roadmaps.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

The following material is recorded only to fix the boundary. Contributors should not attempt it
under this roadmap.

- **Nonsmooth and variational analysis**: Ekeland's principle as a standalone topic, Berge's
  maximum theorem, epi-convergence and Attouch's theorem, Painlevé–Kuratowski convergence of
  sets, Clarke's generalized gradient and its calculus, the Lyusternik–Graves theorem, Hoffman's
  error bound, limiting subdifferentials and their calculus, the extremal principle, the
  Mordukhovich criterion, and KKT and second-order conditions under general constraint
  qualifications (entries 12.45–12.52, 12.54, 12.55 and 12.70–12.75 of the CKMA list described
  under [Prior formalization](#prior-formalization)). They need a theory of set-valued maps and
  regularity that this roadmap does not build. Ekeland's principle itself is Tau Ceti's, and 4.6
  uses it.
- **Asplund spaces**: Fréchet differentiability on a dense `G_δ` for every Asplund space, beyond
  the separable-dual case of 4.5, needs the separable reduction and the Radon–Nikodým property.
- **Choquet theory without metrizability**: the Choquet–Bishop–de Leeuw theorem and the
  Choquet–Meyer theorem for maximal measures on general compact convex sets, where the extreme
  points need not be Borel.
- **Monotone operator theory beyond subdifferentials**: Minty's theorem, resolvents,
  Fitzpatrick functions, and maximal monotonicity of subdifferentials on general Banach spaces.
- **Proximal and splitting algorithms**: Moreau envelopes and the Moreau decomposition for
  proximal maps, the proximal point method, alternating projections and Douglas–Rachford
  splitting, with their convergence theory. They need the resolvent theory listed under monotone
  operators; 3.8 proves the cone case of Moreau's decomposition, which is their input.
- **Polyhedral and semidefinite refinements**: polyhedral qualifications in the calculus rules
  (Bauschke–Combettes, Thm 16.47(ii)–(iii), p. 276), facial reduction, and the Shapiro and Ramana
  duals of semidefinite programs.

## Prior formalization

Several targets are formalized in `CKMA/Analysis/Convex/` of
[lean-CKMA](https://github.com/bjbraams/lean-CKMA), the Core Knowledge of Mathematical Analysis
project, on top of Tau Ceti's conjugate and subdifferential. lean-CKMA proves the sum rule under
a continuity qualification and under the relative-interior qualification
(`Duality/Sum.lean`, `Duality/SumIntrinsic.lean`), Fenchel–Rockafellar duality with dual
attainment (`Duality/FenchelRockafellar.lean`), the Karush–Kuhn–Tucker theorem under Slater's
condition (`Duality/KKT.lean`), and Choquet's theorem for compact metrizable convex sets
(`Duality/Choquet.lean`, which has one `sorry`); its subdifferential is the evaluation-pairing
specialization of Tau Ceti's. Proximal maps are in `Proximal.lean`, outside this roadmap.

The CKMA entries of area 12 in the charter map to this roadmap as follows, which is not
prescriptive:

| CKMA entries | Where |
|---|---|
| 12.1, 12.3–12.5, 12.12 | Mathlib (separation, Carathéodory, Radon, Helly, continuity) |
| 12.2 | 1.1; the Bishop–Phelps part is BanachSpaceTheory B2 |
| 12.6, 12.7 | 1.2, 1.3 |
| 12.9, 12.10 | 6.1, 6.2 |
| 12.11 | BanachSpaceTheory B7 |
| 12.13, 12.14, 12.15 | 3.2, 3.1–3.2, 3.3 (with Tau Ceti for almost everywhere and Hessian) |
| 12.17–12.19, 12.27 | Tau Ceti (Fenchel–Young, Fenchel–Moreau, reciprocity, Fermat) |
| 12.20 | 4.3 |
| 12.21, 12.22 | 3.5, 3.6 |
| 12.23–12.26 | 2.3, 2.1, 2.2, 2.4 |
| 12.28 | VariationalMethods §1.2 and §1.4 |
| 12.29, 12.31 | 4.1, 3.8 |
| 12.34 | 3.8 (cone form); the proximal form is the first-order-methods roadmap's |
| 12.39–12.43 | 5.1, 5.2, 1.4, 5.3, 5.4 |
| 12.53 | 4.5 (separable-dual case; Asplund spaces are beyond) |
| 12.64–12.69 | 4.2, 2.5, 3.7, 3.4, 4.6, 4.4 |

Mathlib has no subgradient of a real-valued convex function at the pinned version. A bridge from
Tau Ceti's `subdifferential` with `innerₗ E` to any such Mathlib notion belongs to 3.1 and changes
no target.

## References

The locators refer to these editions; page numbers are printed page numbers.

- H. H. Bauschke and P. L. Combettes, *Convex Analysis and Monotone Operator Theory in Hilbert
  Spaces*, 2nd ed., CMS Books in Mathematics, Springer, 2017, Chs. 6, 9, 11, 13–18, 20, 22.
- J. M. Borwein and A. S. Lewis, *Convex Analysis and Nonlinear Optimization*, 2nd ed., CMS Books
  in Mathematics, Springer, 2006, Chs. 2–5.
- J. M. Borwein and J. D. Vanderwerff, *Convex Functions: Constructions, Characterizations and
  Counterexamples*, Encyclopedia of Mathematics and its Applications 109, Cambridge University
  Press, 2010, Chs. 1, 2, 4, 6, 7.
- S. Boyd and L. Vandenberghe, *Convex Optimization*, Cambridge University Press, 2004, Chs. 2,
  3, 5.
- J.-B. Hiriart-Urruty and C. Lemaréchal, *Convex Analysis and Minimization Algorithms I*,
  Grundlehren 305, Springer, 1993, Chs. III, IV, VI, VII.
- J.-B. Hiriart-Urruty and C. Lemaréchal, *Convex Analysis and Minimization Algorithms II*,
  Grundlehren 306, Springer, 1993, Chs. X, XI.
- R. T. Rockafellar and R. J.-B. Wets, *Variational Analysis*, Grundlehren 317, Springer, 1998,
  Chs. 3, 6, 11.
- R. Schneider, *Convex Bodies: The Brunn–Minkowski Theory*, Encyclopedia of Mathematics and its
  Applications 44, Cambridge University Press, 1993, Chs. 1–2.
- B. Simon, *Convexity: An Analytic Viewpoint*, Cambridge Tracts in Mathematics 187, Cambridge
  University Press, 2011, Chs. 8, 10, 11.

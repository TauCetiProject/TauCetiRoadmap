# Roadmap: CAT(0) spaces

**Summary.** A CAT(0) space is a geodesic metric space whose triangles are no fatter than
triangles in the Euclidean plane. Tau Ceti defines it in the two-point form of Bruhat and Tits:
every midpoint `m` of two points `x, y` satisfies the CN inequality
`d(z, m)² ≤ (d(z, x)² + d(z, y)²)/2 − d(x, y)²/4` for every `z`, which is an equality in the plane.
Tau Ceti proves that the squared distance is then strongly convex along geodesics, that Hilbert
spaces are CAT(0), and that a nonzero measure on a CAT(0) metric space has at most one quadratic
barycentre. This roadmap builds the classical
metric theory on that definition. The definition does not include completeness; a complete CAT(0)
space is a Hadamard space, and completeness is assumed exactly where it is needed.

The headline theorems are these.

- *Three definitions agree.* A geodesic space is CAT(0) if and only if every geodesic triangle
  satisfies the comparison inequality against its Euclidean comparison triangle, and if and only
  if every four points satisfy the quadrilateral inequality of Berg and Nikolaev. A complete space
  is CAT(0) as soon as any two points have one point satisfying the CN inequality.
- *Projections and barycentres without compactness.* In a CAT(0) metric space, every point has
  exactly one nearest point in a nonempty complete geodesically convex set, and a nearest point
  satisfies the Pythagoras inequality against every point of the set. In a complete CAT(0)
  space, which need not be proper, every finite measure for which open sets are measurable and
  with finite second moment about one point has a quadratic barycentre.
- *The Bruhat–Tits fixed point theorem.* A nonempty bounded set of a complete CAT(0) metric space
  has exactly one circumcentre, and a group acting by isometries with a bounded orbit has a fixed
  point.
- *Flatness.* In a CAT(0) metric space two geodesic lines at bounded distance bound a flat
  strip: after a shift of parameter, their points are at the distances of two parallel lines in
  the plane. In a CAT(0) space, if four points have equal opposite sides and both diagonals
  satisfy Pythagoras's relation, then the points of geodesic segments along two opposite sides are
  at the distances of the opposite sides of a Euclidean rectangle.

The roadmap rests on Tau Ceti's CAT(0) spaces, geodesic segments, geodesic convexity of energies
and Fréchet barycentres; the last two implement notions planned by OptimalTransport. It uses the
affine-invariant distance on positive definite matrices of OperatorMonotoneFunctionsAndMatrixMeans
to show that the positive definite cone is a Hadamard space. The fixed point theorem is the general
form of the one ReductiveGroupsPartII states for buildings.

Layer 1 below proves that the three definitions agree and proves Reshetnyak's quadruple
inequality. Layer 2 treats pairs of geodesics. Layer 3 introduces geodesically convex sets and
proves the existence of minimizers, projections and barycentres. Layer 4 proves the fixed point
theorem, Layer 5 the flatness theorems, and Layer 6 gives products, normed spaces and the positive
definite cone as examples.

## Conventions

- **The predicate.** `TauCeti.IsCATZeroSpace X` for `[PseudoMetricSpace X]`: `X` is a geodesic
  space (`TauCeti.IsGeodesicSpace`) and the CN inequality holds at every metric midpoint `m` of
  `x, y`, that is at every `m` with `d(x, m) = d(m, y) = d(x, y)/2`. Completeness is not part of
  it. No other CAT(0) class is introduced. "Hadamard space" means a complete CAT(0) metric space.
- **Pseudometric or metric.** A statement that survives replacing a point by one at distance `0`
  is made on a pseudometric space. Where a statement says that two points are equal (uniqueness of
  nearest points, circumcentres, fixed points, flat strips) the space is a `MetricSpace`.
- **Geodesic segments.** `TauCeti.IsGeodesicSegment γ x y` for `γ : ℝ → X`: `γ 0 = x`,
  `γ 1 = y` and `d(γ s, γ t) = |s − t| d(x, y)` for `s, t ∈ [0, 1]`; the values of `γ` off
  `[0, 1]` are not constrained. A geodesic line is an isometry `c : ℝ → X`.
- **Comparison triangles.** A comparison triangle of `x, y, z` is a triple of points of
  `EuclideanSpace ℝ (Fin 2)` with the same three distances; the point at time `s` of the side from
  `x'` to `y'` is `AffineMap.lineMap x' y' s`.
- **Circumradius.** For `S ⊆ X` and `x ∈ X` the circumradius is `r_S(x) = ⨆ a ∈ S, d(x, a)`,
  written in Lean as an indexed supremum over the subtype `S`. Lean's real supremum is `0` over
  an empty or unbounded family, so every statement about it assumes `S` nonempty and bounded.
- **Group actions.** `[Group G] [MulAction G X] [IsIsometricSMul G X]` (Mathlib).
- **Barycentres.** For measures, Tau Ceti's `frechetPower 2 μ x = ∫⁻ d(x, y)² dμ(y)` (an extended
  nonnegative real, with the exponent as a real power) and `IsFrechetBarycenter 2 μ b` (finite
  radius at `b` and `b` minimizes the radius). For finite families, plain sums
  `∑ wᵢ d(y, xᵢ)²`.
- "Proved here" means that the route is written out in full in this README; it claims no
  novelty.

## Layer 1: three definitions of CAT(0)

### 1.1 Midpoints with the CN inequality

Prove `isCATZeroSpace_tfae`: on a complete pseudometric space `X` the following are equivalent:
(i) `X` is CAT(0); (ii) for all `x, y` there is `m` with
`d(z, m)² ≤ (d(z, x)² + d(z, y)²)/2 − d(x, y)²/4` for every `z`; (iii) for all `x, y` and `ε > 0`
there is `m` with the same inequality plus `ε` on the right. Statement: Sturm, Def 2.1 (p. 4),
Remark 2.2 and its proof (p. 5), with the geodesic built as in Sturm, Prop 1.2 and its proof
(p. 2); Bruhat–Tits, Remarque 3.2.2 (p. 63), for the uniqueness step.

Route. (i) ⇒ (ii): the point at time `1/2` of a geodesic segment from `x` to `y` is a metric
midpoint, and the class field applies. (ii) ⇒ (iii) is immediate. (iii) ⇒ (ii): let `m_ε` satisfy
the inequality with `ε`. Putting `z = x` and `z = y` gives `d(x, m_ε)² ≤ d(x, y)²/4 + ε` and
`d(y, m_ε)² ≤ d(x, y)²/4 + ε`; putting `z = m_δ` in the inequality of `m_ε` then gives
`d(m_δ, m_ε)² ≤ ε + δ`. So `m_(1/k)` is Cauchy; take a limit `m` (`cauchySeq_tendsto_of_complete`),
and the inequality with `ε = 0` passes to the limit. (ii) ⇒ (i), in three steps.

- A CN point `m` of `x, y` is a metric midpoint: `z = x` and `z = y` give `d(x, m) ≤ d(x, y)/2`
  and `d(m, y) ≤ d(x, y)/2`, and the triangle inequality forces equality. And every metric midpoint
  `m'` has `d(m, m') = 0`: put `z = m'` (the right side is `0`).
- Geodesics: put `γ 0 = x`, `γ 1 = y`, and define `γ` on the dyadic rationals of `(0, 1)` by
  taking CN points of consecutive points level by level. By induction, consecutive points of level
  `n` are at distance `d(x, y)/2ⁿ`; the triangle inequality along the chain gives
  `d(γ r, γ s) ≤ |r − s| d(x, y)` and, through `d(x, y) ≤ d(x, γ r) + d(γ r, γ s) + d(γ s, y)`,
  equality. For `t ∈ (0, 1)` the values at the dyadic truncations of `t` form a Cauchy sequence;
  let `γ t` be a chosen limit. The distance identity passes to limits, and
  `TauCeti.isGeodesicSegment_of_dist_le` concludes. So `X` is a geodesic space.
- The CN inequality at every metric midpoint `m'`: by the first step `d(z, m') = d(z, m)` for
  every `z`, where `m` is the CN point of `x, y`.

**Checks.**

- Completeness is needed in (ii) ⇒ (i): in `ℚ` the point `(x + y)/2` satisfies the CN inequality
  with equality, but `ℚ` is not a geodesic space (no geodesic segment joins `0` and `1`).
- On the empty space and on a one-point space all three conditions hold.

*Needs:* Tau Ceti `TauCeti.IsCATZeroSpace`, `TauCeti.IsGeodesicSegment`,
`TauCeti.isGeodesicSegment_of_dist_le`; Mathlib `cauchySeq_tendsto_of_complete`.

### 1.2 Comparison triangles

Prove `isCATZeroSpace_iff_comparison`: a geodesic pseudometric space `X` is CAT(0) if and only if,
for all `x, y, z`, every geodesic segment `γ` from `x` to `y`, every geodesic segment `σ` from `x`
to `z`, every comparison triangle `x', y', z'` and all `s, t ∈ [0, 1]`,
`d(γ s, σ t) ≤ |lineMap x' y' s − lineMap x' z' t|`. Two points on two sides of a triangle share a
vertex of the triangle, so after relabelling and reversing (`TauCeti.IsGeodesicSegment.reverse`)
this is the comparison inequality for all pairs of points of a geodesic triangle (Poulsen,
Def 3.1.1 and Prop 3.2.1). The docstring of `TauCeti.IsCATZeroSpace` records this equivalence.
(Proved here.)

Route ⇒. Put `q = σ t` and `q' = lineMap x' z' t`. By `TauCeti.IsGeodesicSegment.dist_sq_le` on
`σ` with the point `y`,
`d(y, q)² ≤ (1 − t) d(y, x)² + t d(y, z)² − t(1 − t) d(x, z)²`, and the right side is `|y' q'|²`
by Stewart's identity in the plane (the case of equality of the same inequality, which the
inner product gives). By `TauCeti.IsGeodesicSegment.dist_sq_le` on `γ` with the point `q`,
`d(q, γ s)² ≤ (1 − s) d(q, x)² + s d(q, y)² − s(1 − s) d(x, y)²`. Here `d(q, x) = t d(x, z)
= |q' x'|`, and the right side increases with `d(q, y)²` because `s ≥ 0`; at `|q' y'|²` it is
`|q' p'|²` with `p' = lineMap x' y' s`, by Stewart's identity again.

Route ⇐. Let `m` be a metric midpoint of `x, y` and `z` a point. Join `x` to `m` and `m` to `y` by
geodesic segments and run them in turn at double speed; the triangle inequality through `m`, and
the reverse bound through `x` and `y`, give a geodesic segment `γ` from `x` to `y` with
`γ (1/2) = m` (`TauCeti.isGeodesicSegment_of_dist_le`). Take any `σ` from `x` to `z` and a
comparison triangle `x' = 0`, `y' = (c, 0)`, `z' = (p, √(b² − p²))` with `c = d(x, y)`,
`b = d(x, z)`, `a = d(y, z)`, `p = (c² + b² − a²)/(2c)`; here `b² ≥ p²` is the triangle
inequality, and for `c = 0` take `z' = (b, 0)`, since then `a = b`. The hypothesis at `s = 1/2`,
`t = 1` gives `d(m, z) ≤ |m' z'|` with `m'` the midpoint of `x' y'`, and Apollonius's identity
(`EuclideanGeometry.dist_sq_add_dist_sq_eq_two_mul_dist_midpoint_sq_add_half_dist_sq`) turns
`|m' z'|²` into the right side of the CN inequality.

**Checks.**

- In the plane both sides of the comparison inequality are equal (Stewart's identity; checked on
  300 rational configurations).
- The hypothesis that `X` is geodesic is needed for ⇐: in `ℚ` the only geodesic segments are the
  constant ones, so the comparison condition holds, but `ℚ` is not CAT(0).
- The circle of length `4` with its arc metric is geodesic and not CAT(0): the antipodal points
  `0, 2` have the two midpoints `1` and `3`, and the comparison inequality fails for the two
  geodesic segments from `0` to `2`, whose points at time `1/2` are at distance `2` while their
  comparison points coincide.

*Needs:* Tau Ceti `TauCeti.IsGeodesicSegment.dist_sq_le`, `.reverse`,
`TauCeti.isGeodesicSegment_of_dist_le`; Mathlib
`EuclideanGeometry.dist_sq_add_dist_sq_eq_two_mul_dist_midpoint_sq_add_half_dist_sq`,
`AffineMap.lineMap`, `EuclideanSpace`.

### 1.3 Reshetnyak's quadruple inequality and the quadrilateral characterization

Prove `IsCATZeroSpace.dist_sq_add_dist_sq_le` (Reshetnyak): in a CAT(0) pseudometric space, for
all `x₁, x₂, x₃, x₄`,
`d(x₁, x₃)² + d(x₂, x₄)² ≤ d(x₂, x₃)² + d(x₄, x₁)² + 2 d(x₁, x₂) d(x₃, x₄)` (Sturm, Prop 2.4,
p. 6; Sturm derives it from a later theorem, and the route below is written out here).

Prove `isCATZeroSpace_iff_quadrilateral` (Berg–Nikolaev): a geodesic pseudometric space is CAT(0)
if and only if every four points `w, x, y, z` satisfy
`d(w, y)² + d(x, z)² ≤ d(w, x)² + d(x, y)² + d(y, z)² + d(z, w)²` (Sato, Thm 1.1, p. 1, with the
proof of ⇐ on pp. 2–3).

Route of Reshetnyak's inequality. Write `dᵢⱼ = d(xᵢ, xⱼ)`. If `d₁₂ = 0`, then `d₁₃ = d₂₃` and
`d₁₄ = d₂₄`, and the inequality is an equality; likewise if `d₃₄ = 0`. Otherwise put
`η = d₁₂/(d₁₂ + d₃₄) ∈ (0, 1)`, take a geodesic segment `σ` from `x₂` to `x₄` and `q = σ η`.
Then `d₁₃² ≤ (d(x₁, q) + d(q, x₃))² ≤ d(x₁, q)²/η + d(q, x₃)²/(1 − η)`, the last step because the
difference is `(u(1 − η) − vη)²/(η(1 − η))`. By `TauCeti.IsGeodesicSegment.dist_sq_le` on `σ`,
`d(x₁, q)² ≤ (1 − η) d₁₂² + η d₁₄² − η(1 − η) d₂₄²` and
`d(q, x₃)² ≤ (1 − η) d₂₃² + η d₃₄² − η(1 − η) d₂₄²`. Substituting, the bound is
`((1 − η)/η) d₁₂² + (η/(1 − η)) d₃₄² + d₁₄² + d₂₃² − d₂₄²`, and with the chosen `η` the first two
terms are each `d₁₂ d₃₄`.

Route of the characterization. ⇒: Reshetnyak's inequality with `(x₁, x₂, x₃, x₄) = (w, x, y, z)`
and `2 d(w, x) d(y, z) ≤ d(w, x)² + d(y, z)²`. ⇐: Sato's proof, in which every point written
`γ_(ab)(1/2)` is read as any metric midpoint of `a, b` and `γ_(yx)(2⁻ⁿ)` as the point at time
`2⁻ⁿ` of one fixed geodesic segment from `y` to `x`; each of his steps (Lemma 2.1, Lemma 2.2,
(2.4)–(2.6)) uses only the distances `d(a, m) = d(m, b) = d(a, b)/2` of the midpoints it names, so
it holds for every choice. This gives the CN inequality at every chosen midpoint. At any other
metric midpoint `m'` of `y, z` the quadrilateral inequality for `(y, m, z, m')` gives
`d(y, z)² + d(m, m')² ≤ d(y, z)²`, so `d(m, m') = 0` and the CN inequality transfers.

A consequence used in Layer 5, with its proof: if four points satisfy the quadrilateral
inequality with equality, then `d(w, x) = d(y, z)` and `d(x, y) = d(z, w)`, by Reshetnyak's
inequality for `(w, x, y, z)` and for `(x, y, z, w)`.

**Checks.**

- In `ℝ³` the quadrilateral inequality is `|w − x + y − z|² ≥ 0` after expansion; Reshetnyak's
  inequality is then Cauchy–Schwarz.
- On the circle of length `4` the points `0, 1, 2, 3` give `4 + 4 ≤ 1 + 1 + 1 + 1`, false.
- The geodesic hypothesis is needed for ⇐: every ultrametric space satisfies the quadrilateral
  inequality (Sato, Example 1.2), and the three-point ultrametric space with all distances `1` is
  not geodesic.

*Needs:* Tau Ceti `TauCeti.IsGeodesicSegment.dist_sq_le`, `TauCeti.IsGeodesicSpace`.

### Examples

- Real inner product spaces are CAT(0) (Tau Ceti `TauCeti.instIsCATZeroSpace`), with equality in
  the CN inequality.
- Metric trees are CAT(0) (Sturm, Prop 3.4, p. 10). More generally, a geodesic space satisfying
  Gromov's four-point condition `d(x, y) + d(z, w) ≤ max(d(x, z) + d(y, w), d(x, w) + d(y, z))` is
  CAT(0): applied to `x, y, z` and a metric midpoint `m` of `x, y` it gives
  `d(z, m) ≤ max(a, b) − c/2` with `a = d(z, x)`, `b = d(z, y)`, `c = d(x, y)`, and for `a ≥ b`,
  `(a − c/2)² ≤ (a² + b²)/2 − c²/4` is `b² ≥ (a − c)²`, the triangle inequality. (A remark, not a
  target.)

### Dependencies

Tau Ceti only. Later layers use Reshetnyak's inequality (3.3, 3.4, 5.1) and the quadrilateral
inequality (5.2).

## Layer 2: geodesics

### 2.1 Busemann convexity

Prove `IsGeodesicSegment.dist_le_of_isCATZeroSpace`: in a CAT(0) pseudometric space, for geodesic
segments `γ` from `x` to `y` and `σ` from `x'` to `y'` and `t ∈ [0, 1]`,
`d(γ t, σ t) ≤ (1 − t) d(x, x') + t d(y, y')` (Sturm, Cor 2.5, (2.6), p. 7). (Proved here.)

Route. Common start: if `x' = x`, apply `TauCeti.IsGeodesicSegment.dist_sq_le` on `σ` at the point
`γ t`, and on `γ` at the point `y'`; with `d(x, γ t) = t d(x, y)` the bounds combine to
`d(γ t, σ t)² ≤ (1 − t) t² D² + t((1 − t) P + t Q − t(1 − t) D²) − t(1 − t) P = t² Q`, where
`D = d(x, y)`, `P = d(x, y')²`, `Q = d(y, y')²`. General case: take a geodesic segment `ρ` from
`x` to `y'`; the common-start case gives `d(γ t, ρ t) ≤ t d(y, y')`, and applied to the reversed
segments of `ρ` and `σ`, which start at `y'`, at time `1 − t` it gives
`d(ρ t, σ t) ≤ (1 − t) d(x, x')`.

Consequence used below, with its proof: in a CAT(0) metric space two geodesic segments from `x`
to `y` agree on `[0, 1]` (take `x' = x`, `y' = y`).

**Checks.**

- In `ℝ²`, `γ t = (t, 0)` and `σ t = (0, 1 + t)` give `d(γ t, σ t)² = t² + (1 + t)²`, while the
  bound is `(1 − t) + t√5`; at `t = 1` both sides are `√5`.
- On the circle of length `4` the two geodesic segments from `0` to `2` are at distance `2` at
  time `1/2`, while the bound is `0`.

*Needs:* Tau Ceti `TauCeti.IsGeodesicSegment.dist_sq_le`, `.reverse`,
`TauCeti.IsGeodesicSegment.dist_source_apply`.

### 2.2 Contractibility

Prove `IsCATZeroSpace.contractibleSpace`: a nonempty CAT(0) pseudometric space is contractible
(Sturm, consequence (iii) of Cor 2.5, p. 8). (Proved here.)

Route. Fix `x₀`, choose for each `y` a geodesic segment `γ_y` from `x₀` to `y`, and put
`H(t, y) = γ_y t` on `[0, 1] × X`. By 2.1 with common start and the distance identity,
`d(H(t, y), H(t', y')) ≤ t d(y, y') + |t − t'| d(x₀, y')`, so `H` is continuous; `H(0, ·)` is
constant and `H(1, ·)` is the identity, and `contractible_iff_id_nullhomotopic` concludes.

**Checks.**

- The empty space is CAT(0) and not contractible, so `Nonempty X` is needed.
- The circle of length `4` is geodesic and not contractible; it is not CAT(0) (1.2).

*Needs:* 2.1; Mathlib `contractible_iff_id_nullhomotopic`.

### Examples

- In a tree the two statements are visible: the distance between points at time `t` on two
  segments of a tripod is piecewise linear and convex in `t`.

### Dependencies

Tau Ceti; 2.2 needs 2.1.

## Layer 3: convex sets, minimizers, projections and barycentres

### 3.1 Geodesically convex sets

Define `IsGeodesicallyConvexSet C` for `C ⊆ X` in a pseudometric space: for all `x, y ∈ C`, every
geodesic segment `γ` from `x` to `y` and every `t ∈ [0, 1]`, `γ t ∈ C` (Sturm, Def 1.4, p. 2).
Neither pinned library has this notion for sets: Tau Ceti's `TauCeti.ConvexAlongGeodesics` is
about functions `X → EReal`, and Mathlib's `Convex ℝ` needs a vector space. The first relation
is a target, the second a remark with its proof:

- `isGeodesicallyConvexSet_iff_convexAlongGeodesics`: `C` is geodesically convex if and only if
  the function equal to `0` on `C` and `⊤` off `C` is `0`-convex along geodesics. Proof: its
  effective domain is `C`, and along a geodesic segment from a point of `C` to a point of `C` the
  convexity inequality reads `φ(γ t) ≤ 0`.
- In a strictly convex real normed space, geodesic convexity is `Convex ℝ`. Proof: affine
  segments are geodesic segments (`TauCeti.isGeodesicSegment_lineMap`), which gives ⇒ with
  `convex_iff_segment_subset`; every geodesic segment is the affine one
  (`TauCeti.IsGeodesicSegment.eq_lineMap`, `Convex.lineMap_mem`), which gives ⇐.

**Checks.**

- Strict convexity is needed for ⇐: in `ℝ²` with the sup norm the segment from `(0, 0)` to
  `(2, 0)` is convex, but `γ s = (2s, 1 − |1 − 2s|)` is a geodesic segment between its ends
  through `(1, 1)`.
- In a CAT(0) metric space the range of a geodesic line is geodesically convex (2.1, with the
  consequence on uniqueness), and so is every closed ball (Sturm, p. 8, (i) after Cor 2.5).

*Needs:* Tau Ceti `TauCeti.ConvexAlongGeodesics`, `TauCeti.ConvexAlong`,
`TauCeti.isGeodesicSegment_lineMap`, `TauCeti.IsGeodesicSegment.eq_lineMap`; Mathlib `Convex`,
`convex_iff_segment_subset`, `Convex.lineMap_mem`, `StrictConvexSpace`.

### 3.2 Minimizers of midpoint strongly convex functions

Throughout, `X` is a geodesic pseudometric space, `F ⊆ X` is geodesically convex and `G : X → ℝ`
is *midpoint `c`-strongly convex on `F`*: for `q, q', m ∈ F` with `m` a metric midpoint of `q, q'`,
`G m ≤ G q/2 + G q'/2 − (c/4) d(q, q')²`.

Prove `IsMinOn.add_mul_dist_sq_le` (the variance inequality): if `b ∈ F` minimizes `G` on `F`,
then `G b + c d(y, b)² ≤ G y` for every `y ∈ F`, for every real `c`. (Proved here.)

Prove `exists_isMinOn_of_midpoint`: if moreover `F` is complete and nonempty, `G` is lower
semicontinuous on `F`, and `c > 0`, then `G` attains its infimum on `F`. No lower bound on `G` is
assumed; the route derives one. (Sturm, Prop 1.7, p. 3, for a uniformly convex lower
semicontinuous function on a complete geodesic space.)

Route of the variance inequality. For `c ≤ 0` it is minimality. For `c > 0`, suppose
`G b + c' d(y, b)² ≤ G y` for all `y ∈ F` (true for `c' = 0`). For `y ∈ F` let `m` be the point at
time `1/2` of a geodesic segment from `b` to `y`; it lies in `F` and is a metric midpoint. Then
`G b + c' d(y, b)²/4 ≤ G m ≤ G b/2 + G y/2 − (c/4) d(y, b)²`, which is the inequality with
`(c + c')/2`. Iterating gives `c(1 − 2⁻ᵏ)` for every `k`, and the limit gives `c`.

Route of existence. First, `G` is bounded below on `F`. Fix `q₀ ∈ F`; lower semicontinuity gives
`r > 0` with `G > G q₀ − 1` at the points of `F` within `r` of `q₀`. For `y ∈ F` with
`d = d(q₀, y) ≥ r`, let `γ` be a geodesic segment from `q₀` to `y` (in `F`); induction on `k`, with
`γ(2⁻ᵏ⁻¹)` a metric midpoint of `q₀` and `γ(2⁻ᵏ)`, gives
`G(γ t) ≤ (1 − t) G q₀ + t G y − c t(1 − t) d²` at `t = 2⁻ᵏ`, since the right side satisfies the
midpoint relation with equality. Taking `t = 2⁻ᵏ` with `r/2 ≤ t d < r` gives
`G y ≥ G q₀ − 1/t + c(1 − t) d² ≥ G q₀ − 2d/r + c d²/2 ≥ G q₀ − 2/(c r²)`. Now let `I` be the
infimum of `G` on `F` and `qₙ ∈ F` with `G qₙ → I`. For the
midpoint `m` of `qₙ, qₖ` on a geodesic segment (in `F`),
`I ≤ G m ≤ G qₙ/2 + G qₖ/2 − (c/4) d(qₙ, qₖ)²`, so `(qₙ)` is Cauchy. Completeness of `F` gives a
limit `b ∈ F`, and lower semicontinuity gives `G b ≤ I`.

**Checks.**

- `c > 0` is needed: `G = exp` on `F = ℝ` is midpoint `0`-strongly convex and continuous, and
  does not attain its infimum `0`.
- Completeness is needed: `G x = x²` on `F = (0, 1) ⊆ ℝ` is midpoint `1`-strongly convex (with
  equality), and its infimum `0` is not attained in `F`.
- Lower semicontinuity is needed: on `F = [0, 1]`, `G 0 = 1` and `G x = x²` for `x > 0` is midpoint
  `1`-strongly convex (checked exactly on the grid of sixteenths, and in general because a
  midpoint of `q, q'` is `0` only if `q = q' = 0`) and has infimum `0`, not attained.
- Geodesic convexity is needed: the points `(n, n²)`, `n ≥ 1`, of the plane form a closed set with
  no metric midpoint of two distinct points inside it (checked for `n ≤ 30`; in general a midpoint
  of two points of a strictly convex curve lies above it), so the condition on `G` holds for every
  `G`, and `G(n, n²) = 1/n` has no minimum.

*Needs:* 3.1; Tau Ceti `TauCeti.IsGeodesicSpace`, `TauCeti.IsGeodesicSegment`.

### 3.3 Nearest-point projections

In a CAT(0) space, let `C` be geodesically convex.

- `existsUnique_nearest`: in a metric space, if `C` is complete and nonempty, every `y` has exactly
  one point `p ∈ C` with `d(y, p) ≤ d(y, q)` for all `q ∈ C` (Sturm, Prop 2.6 (i), p. 8).
- `dist_sq_add_dist_sq_le_of_nearest` (the Pythagoras inequality): if `p ∈ C` is a nearest point to
  `y`, then `d(y, p)² + d(p, q)² ≤ d(y, q)²` for all `q ∈ C` (Sturm, Prop 2.6 (ii), p. 8). No
  completeness is assumed.

On a real inner product space the existence part of the first statement is Mathlib's
`exists_norm_eq_iInf_of_complete_convex` read through 3.1, and the second follows from
`norm_eq_iInf_iff_real_inner_le_zero`; here they hold in every CAT(0) space. (Proved here: the
routes below.)

Route. Pythagoras: take a geodesic segment `γ` from `p` to `q`; it lies in `C`, so by
`TauCeti.IsGeodesicSegment.dist_sq_le`,
`d(y, p)² ≤ d(y, γ t)² ≤ (1 − t) d(y, p)² + t d(y, q)² − t(1 − t) d(p, q)²`. Divide by `t > 0` and
let `t → 0`. Existence and uniqueness: apply
3.2 with `F = C`, `G = d(y, ·)²` (continuous, nonnegative) and `c = 1`, which is the CN inequality
of the class; two nearest points `p, p'` satisfy `d(y, p)² + d(p, p')² ≤ d(y, p')² = d(y, p)²` by
Pythagoras, so `p = p'` in a metric space.

A consequence, with its proof (a remark, not a target): nearest points move by at most the
distance between the points projected, that is, if `p, p' ∈ C` are nearest points to `y, y'`, then
`d(p, p') ≤ d(y, y')` (Sturm, Prop 2.6 (iii), p. 8), with no completeness assumed. Add the
Pythagoras inequalities for `(y, p, p')` and `(y', p', p)` to get
`2 d(p, p')² ≤ d(y, p')² + d(y', p)² − d(y, p)² − d(y', p')²`, and Reshetnyak's inequality (1.3)
for `(y, y', p', p)` bounds the right side by `2 d(y, y') d(p, p')`.

**Checks.**

- Completeness is needed for existence: the open unit disc of `ℝ²` and `y = (2, 0)`.
- Convexity is needed for uniqueness: the unit circle of `ℝ²` is complete and every point of it is
  nearest to `y = 0`.
- On a leg of the tripod, the nearest point to a point `y` of another leg, at distance `r` from the
  centre, is the centre, and for `q` at distance `s` from the centre the Pythagoras inequality is
  strict when `r s > 0`: `r² + s² < (r + s)²`.

*Needs:* 1.3 (Reshetnyak), 3.1, 3.2; Tau Ceti `TauCeti.IsGeodesicSegment.dist_sq_le`.

### 3.4 Barycentres in complete spaces

Prove `exists_isFrechetBarycenter_two`: let `X` be a complete CAT(0) pseudometric space with its
open sets measurable and `μ` a finite measure on `X` with `frechetPower 2 μ x₀ ≠ ∞` for some `x₀`.
Then `μ` has a quadratic Fréchet barycentre `b`, and
`frechetPower 2 μ b + μ(X) d(z, b)² ≤ frechetPower 2 μ z` for every `z` (Sturm, Prop 4.3 and
Prop 4.4, pp. 14–15, for probability measures with finite first moment). `X` need not be proper or
separable; Tau Ceti proves existence on proper spaces and uniqueness on CAT(0) metric spaces. With
`μ = 0` every point is a barycentre and the statement holds.

Prove `sum_mul_dist_le_of_isMinOn`: in a CAT(0) pseudometric space, for weights `wᵢ ≥ 0` on a
finite index type, if `b` minimizes `∑ wᵢ d(·, xᵢ)²` and `b'` minimizes `∑ wᵢ d(·, x'ᵢ)²`, then
`(∑ wᵢ) d(b, b') ≤ ∑ wᵢ d(xᵢ, x'ᵢ)`. This is a finite case of Sturm, Thm 6.3 (p. 25), which assumes
completeness and is proved there through Jensen's inequality; the route below uses neither.
(Proved here.)

Route of existence. If `μ = 0` every point works; otherwise normalize `μ` to a probability measure.
By `TauCeti.frechetRadius_ne_top_of_ne_top` the radius is finite everywhere, and by
`TauCeti.lipschitzWith_one_toReal_frechetRadius` it is `1`-Lipschitz, so
`F = (frechetPower 2 μ ·).toReal` is continuous (`TauCeti.frechetRadius_rpow_eq_frechetPower`).
`TauCeti.IsGeodesicSegment.frechetPower_two_add_le` at `t = 1/2` makes `F` midpoint
`μ(X)`-strongly convex at the geodesic midpoints, and every metric midpoint `m` of `q, q'` is at
distance `0` from the geodesic one (the CN inequality at `m` with `z` the geodesic midpoint), so
`F` takes the same value there. Apply 3.2 with `F = X`, then
`TauCeti.isFrechetBarycenter_iff_forall_frechetPower_le`.

Route of the Lipschitz bound. `G = ∑ wᵢ d(·, xᵢ)²` is midpoint `(∑ wᵢ)`-strongly convex (sum of the
CN inequalities), so by 3.2 `G b + (∑ wᵢ) d(y, b)² ≤ G y` for all `y`; likewise for `b'`. Take
`y = b'` and `y = b` and add:
`2 (∑ wᵢ) d(b, b')² ≤ ∑ wᵢ (d(b', xᵢ)² + d(b, x'ᵢ)² − d(b, xᵢ)² − d(b', x'ᵢ)²)`. Reshetnyak's
inequality for `(b', b, xᵢ, x'ᵢ)` bounds each bracket by `2 d(b, b') d(xᵢ, x'ᵢ)`; divide by
`2 d(b, b')` when it is positive.

**Checks.**

- The moment hypothesis is needed: on `ℝ`, `μ = ∑ₙ 2⁻ⁿ δ_(2ⁿ)` has `frechetPower 2 μ z = ∞` for
  every `z`, so no point is a barycentre.
- On `ℝ` the minimizer of `∑ wᵢ (y − xᵢ)²` is the weighted mean and the Lipschitz bound is the
  triangle inequality (checked exactly on 300 rational families, including empty ones and zero
  weights).
- With no index or all weights zero, both sides of the Lipschitz bound are `0`.

*Needs:* 1.3 (Reshetnyak), 3.2; Tau Ceti `TauCeti.frechetPower`, `TauCeti.IsFrechetBarycenter`,
`TauCeti.IsGeodesicSegment.frechetPower_two_add_le`,
`TauCeti.isFrechetBarycenter_iff_forall_frechetPower_le`, `TauCeti.frechetRadius_ne_top_of_ne_top`,
`TauCeti.lipschitzWith_one_toReal_frechetRadius`, `TauCeti.frechetRadius_rpow_eq_frechetPower`;
OptimalTransport 12.2 (these notions).

### Examples

- Through 6.3 both statements of 3.4 apply to the positive definite cone; for a weighted family
  of positive definite matrices the minimizer of 3.4 is the Karcher barycentre of
  OperatorMonotoneFunctionsAndMatrixMeans 7.4, which is not restated.

### Dependencies

3.1; 3.2 needs 3.1; 3.3 needs 1.3, 3.1, 3.2; 3.4 needs 1.3, 3.2 and Tau Ceti's Fréchet barycentres.

## Layer 4: circumcentres and the Bruhat–Tits fixed point theorem

### 4.1 Circumcentres

Prove `existsUnique_circumcenter`: in a complete CAT(0) metric space, a nonempty bounded set `S`
has exactly one point `c` minimizing the circumradius `r_S`. The circumcentre is the centre of the
smallest closed ball containing `S`; it is not Mathlib's `Affine.Simplex.circumcenter`, the point
equidistant from the vertices of a simplex. For a finite nonempty `S` in a metric space whose open
sets are measurable, `r_S(x)` is the real value at `x` of Tau Ceti's essential-supremum radius
`TauCeti.chebyshevRadius` of the sum of the Dirac masses at the points of `S`, so the circumcentre
is that measure's Chebyshev centre (`TauCeti.IsChebyshevCenter`); Tau Ceti has no existence or
uniqueness theorem for Chebyshev centres. (Proved here.)

Route. For `a ∈ S` the CN inequality gives, at a metric midpoint `m` of `q, q'`,
`d(m, a)² ≤ (d(q, a)² + d(q', a)²)/2 − d(q, q')²/4`; taking suprema over `a`, `r_S²` is midpoint
`1`-strongly convex. It is `1`-Lipschitz (a supremum of `1`-Lipschitz functions, finite because
`S` is bounded and nonempty), hence continuous, and nonnegative. 3.2 with `F = X` gives a minimizer
`c` and `r_S(c)² + d(y, c)² ≤ r_S(y)²` for all `y`; a second minimizer is at distance `0`.

**Checks.**

- In `ℝ²`, for `S = {(0, 0), (4, 0), (1, 1)}` the circumcentre is `(2, 0)` with radius `2`, while
  the point equidistant from the three points is `(2, −1)`, with circumradius `√5`.
- Nonempty and bounded are needed: for `S` empty or unbounded the supremum is `0` at every point
  (`Real.iSup_of_isEmpty`, `Real.iSup_of_not_bddAbove`), and every point minimizes.

*Needs:* 3.2; Mathlib `Bornology.IsBounded`.

### 4.2 The fixed point theorem

Prove `exists_forall_smul_eq_of_isBounded_orbit`: a group `G` acting by isometries on a complete
CAT(0) metric space `X` with a bounded orbit `G x₀` has a fixed point (Bruhat–Tits, Lemme 3.2.3,
pp. 63–64, for the stabilizer of a bounded set in a complete metric space with the CN condition).
(Proved here: the route below goes through 4.1, while Bruhat and Tits iterate midpoint sets.)

Route. Let `c` be the circumcentre of the orbit `O`. Each `g` is an isometry (`isometry_smul`) and
permutes `O`, so `r_O(g • x) = r_O(x)` for every `x`; hence `g • c` is also a circumcentre, and
`g • c = c` by uniqueness.

**Checks.**

- The trivial group fixes every point; a finite group's orbits are bounded.
- Boundedness is needed: translations of `ℝ` by `ℤ` have unbounded orbits and no fixed point.

*Needs:* 4.1; Mathlib `IsIsometricSMul`, `isometry_smul`.

### Examples

- ReductiveGroupsPartII (RG2.2, *building-metric*) states that the building of a reductive group
  over a field with a discrete valuation is a complete CAT(0) metric space; item (1) of its
  *bruhat-tits-fixed-point-theorem*, that a group of isometries with a bounded orbit fixes the
  circumcentre of that orbit, is then 4.1 and 4.2 for the building, apart from its further clause
  that the circumcentre lies in the closed convex hull of the orbit.
- Through 6.3, a group of invertible matrices acting by congruence `P ↦ g P gᴴ` with a bounded
  orbit in the positive definite cone fixes a positive definite matrix.

### Dependencies

Layer 3 (3.2).

## Layer 5: flatness

### 5.1 Flat rectangles

Prove `flat_rectangle`: in a CAT(0) pseudometric space, let `γ` be a geodesic segment from `x` to
`u` and `η` one from `y` to `v`, with `d(x, y) = d(u, v) = δ`, `d(x, u) = d(y, v) = h`, and
`d(x, v)² = d(y, u)² = δ² + h²`. Then `d(γ s, η t)² = δ² + h²(s − t)²` for all `s, t ∈ [0, 1]`.
(Proved here; for the angle form of the same fact see Poulsen, Thm 3.4.6.)

Route. Write `D(a, c) = d(γ a, η c)²` and, for points `p, p', r, r'`,
`Φ(p, p'; r, r') = d(p, r')² + d(p', r)² − d(p, r)² − d(p', r')²`.

- Reshetnyak's inequality (1.3) for `(p, p', r', r)` is `Φ(p, p'; r, r') ≤ 2 d(p, p') d(r, r')`.
- `Φ` is additive when either pair is split at a third point:
  `Φ(p, p'; r, r') + Φ(p', p''; r, r') = Φ(p, p''; r, r')`, and likewise in `r, r'`.
- By the hypotheses `Φ(x, u; y, v) = 2h² = 2 d(x, u) d(y, v)`. Split `[0, 1]` at `a` for `γ` and at
  `c` for `η`: the four pieces of `Φ` are each at most `2h²` times the product of the lengths of
  their parameter intervals, and these bounds add up to `2h²`. So each piece attains its bound; in
  particular `Φ(x, γ a; y, η c) = 2ac h²`, that is
  `D(a, c) = D(a, 0) + D(0, c) − δ² − 2ac h²`. With `E(a, c) = D(a, c) − h²(a − c)²` this says
  `E(a, c) = f(a) + g(c) − δ²` where `f(a) = E(a, 0)` and `g(c) = E(0, c)`.
- At `c = a`: `Φ(x, γ a; y, η a) = 2a²h²`, and Reshetnyak's inequality for
  `(γ a, η a, y, x)` reads `d(x, η a)² + d(γ a, y)² ≤ 2a²h² + 2 δ d(γ a, η a)`. Together they give
  `δ² + d(γ a, η a)² ≤ 2 δ d(γ a, η a)`, so `d(γ a, η a) = δ`, that is `f(a) + g(a) = 2δ²`.
- By `TauCeti.IsGeodesicSegment.dist_sq_le` on `γ` with the point `y`,
  `D(a, 0) ≤ (1 − a)δ² + a(δ² + h²) − a(1 − a)h² = δ² + a²h²`, so `f(a) ≤ δ²`; likewise on `η`
  with the point `x`, `g(a) ≤ δ²`. Hence `f = g = δ²` and `E = δ²`.

**Checks.**

- A rectangle in `ℝ²`, and one placed obliquely in `ℝ³`, satisfy the conclusion.
- The second diagonal is needed: in `ℝ³`, `x = (0, 0, 0)`, `u = (−3, 0, 0)`, `y = (−3, −3, 0)`,
  `v = (−3, −3, −3)` have `d(x, y)² = d(u, v)² = 18`, `d(x, u)² = d(y, v)² = 9` and
  `d(x, v)² = 27 = 18 + 9`, but `d(y, u)² = 9`, and the conclusion fails at `s = 1`, `t = 0`. By
  symmetry the first diagonal is needed too.
- Equal opposite sides and the sum of the two diagonals are not enough: the parallelogram
  `x = (0, 0)`, `u = (2, 0)`, `y = (1, 1)`, `v = (3, 1)` has `d(x, v)² + d(y, u)² = 2(δ² + h²)`
  and `d(x, v)² = 10 ≠ 2 + 4`.
- In a tree the hypotheses force `δ h = 0`.

*Needs:* 1.3 (Reshetnyak); Tau Ceti `TauCeti.IsGeodesicSegment.dist_sq_le`,
`TauCeti.IsGeodesicSegment.dist_eq`.

### 5.2 The flat strip theorem

Prove `flat_strip`: in a CAT(0) metric space, let `c, c' : ℝ → X` be geodesic lines with
`t ↦ d(c t, c' t)` bounded. Then there are `a` and `D ≥ 0` with
`d(c s, c'(t + a))² = D² + (s − t)²` for all `s, t` (Poulsen, Thm 3.4.7, which states that the
convex hull of the two lines is a flat strip and asks for `D > 0`, which fails for `c' = c`).
(Proved here: the route below uses no angles.)

Route.

- For each `a`, `φ_a(τ) = d(c τ, c'(τ + a))` is convex: on `[τ₁, τ₂]` the two lines, reparametrized
  over `[0, 1]`, are geodesic segments (`TauCeti.isGeodesicSegment_lineMap` and
  `TauCeti.IsGeodesicSegment.comp_isometry`), and 2.1 applies. It is bounded, by
  `d(c τ, c' τ) + |a|`. A convex function on `ℝ` bounded above is constant: if
  `φ(τ₁) < φ(τ₂)` with `τ₁ < τ₂`, convexity forces `φ(τ) → ∞` as `τ → ∞`, and symmetrically. So
  `φ_a ≡ Δ(a) := d(c 0, c' a)`.
- `Δ` is `1`-Lipschitz and `Δ(a) ≥ |a| − Δ(0)`, so it attains its minimum at some `a₀`
  (`Continuous.exists_forall_le`). Put `D = Δ(a₀)` and `c'' t = c'(t + a₀)`.
- `c t` is a nearest point of `range c` to `c'' t`: `d(c s, c'' t) = Δ(a₀ + t − s) ≥ D`. The range
  of `c` is geodesically convex (2.1 and its consequence on uniqueness), so the Pythagoras
  inequality (3.3) gives `d(c s, c'' t)² ≥ D² + (s − t)²`, and in the same way
  `d(c t, c'' s)² ≥ D² + (s − t)²`.
- The quadrilateral inequality (1.3) for `(c s, c t, c'' t, c'' s)` gives
  `d(c s, c'' t)² + d(c t, c'' s)² ≤ 2(s − t)² + 2D²`, so both inequalities are equalities.

**Checks.**

- In `ℝ²`, `c t = (t, 0)` and `c' t = (t + 5, 3)` give `a = −5`, `D = 3`, and
  `d(c s, c'(t − 5))² = 9 + (s − t)²` (checked for integers `|s|, |t| ≤ 5`).
- The bounded-distance hypothesis is needed: `c' t = (−t, 3)` has `d(c t, c' t)² = 4t² + 9`, and
  for every `a` and `D`, `d(c s, c'(t + a))² = (s + t + a)² + 9` is not `D² + (s − t)²` for all
  `s, t`.
- `c' = c` gives `a = 0` and `D = 0`.

*Needs:* 1.3 (quadrilateral inequality), 2.1, 3.1, 3.3 (Pythagoras); Tau Ceti
`TauCeti.isGeodesicSegment_lineMap`, `TauCeti.IsGeodesicSegment.comp_isometry`; Mathlib
`Continuous.exists_forall_le`.

### Examples

- In a tree, two geodesic lines at bounded distance agree after a shift (`D = 0`).

### Dependencies

5.1 needs 1.3. 5.2 needs 1.3, 2.1, 3.1 and 3.3.

## Layer 6: examples

### 6.1 Products and convex subsets

Prove `isCATZeroSpace_withLp_prod`: if `X` and `Y` are CAT(0) pseudometric spaces, so is their
`L²` product `WithLp 2 (X × Y)`, with `d² = d_X² + d_Y²` (`WithLp.prod_dist_eq_add`) (Sturm,
Lemma 3.9, p. 11). (Proved here.)

Route. Geodesic segments run coordinatewise: the pair of geodesic segments of the factors is one
of the product, since `d² = |s − t|²(d_X(x, y)² + d_Y(x', y')²)`. Every metric midpoint of the
product is coordinatewise a metric midpoint: with `dᵢ` the distances of the coordinates of the two
points and `aᵢ, bᵢ` those to the midpoint, `∑ aᵢ² = ∑ bᵢ² = d²/4` and `dᵢ ≤ aᵢ + bᵢ` give
`d² = ∑ dᵢ² ≤ ∑ (aᵢ + bᵢ)² = d²/2 + 2 ∑ aᵢ bᵢ ≤ d²`, and equality forces `aᵢ = bᵢ = dᵢ/2`. The CN
inequality is the sum of those of the factors.

A geodesically convex subset `C` of a CAT(0) space is CAT(0) with the induced metric: a geodesic
segment of `X` between points of `C`, with its parameter clamped to `[0, 1]`, is one of `C`, and
Tau Ceti's `TauCeti.IsCATZeroSpace.of_isometry` applies to the inclusion. (A remark, not a target.)

**Checks.**

- The `L¹` product is not enough: in `ℝ²` with `d = |Δx| + |Δy|`, `(1, 0)` is a metric midpoint of
  `(0, 0)` and `(1, 1)`, and the CN inequality at `z = (0, 1)` reads `4 ≤ 0`.
- `ℝ × ℝ` with the `L²` product metric is the Euclidean plane.

*Needs:* Tau Ceti `TauCeti.IsCATZeroSpace`, `TauCeti.IsGeodesicSegment`; Mathlib `WithLp`,
`WithLp.prod_dist_eq_add`.

### 6.2 Normed spaces

Prove `isCATZeroSpace_iff_innerProductSpaceable`: a real normed space is CAT(0) if and only if its
norm satisfies the parallelogram identity (`InnerProductSpaceable`) (Sturm, Prop 3.5 (ii),
p. 10, for Banach spaces and with its proof on p. 11). Route ⇒: `(x + y)/2` is a metric midpoint
of `x, y`, and the CN inequality at `z = 0` is
`‖x + y‖² + ‖x − y‖² ≤ 2‖x‖² + 2‖y‖²`; replacing `x, y` by `x + y, x − y` gives the reverse
inequality. Route ⇐: `InnerProductSpace.ofNorm` and Tau Ceti's `TauCeti.instIsCATZeroSpace`.

**Checks.**

- `ℝ²` with the sup norm is not CAT(0): `(1, 1)` is a metric midpoint of `(0, 0)` and `(2, 0)`, and
  the CN inequality at `z = (1, −1)` reads `4 ≤ 0`.

*Needs:* Mathlib `InnerProductSpaceable`, `InnerProductSpace.ofNorm`; Tau Ceti
`TauCeti.instIsCATZeroSpace`.

### 6.3 The positive definite cone

`Mat n`, `msqrt`, `misqrt`, `opMean`, `wgm`, `frob` and `riemDist` are copied verbatim from
OperatorMonotoneFunctionsAndMatrixMeans (Conventions, 5.1, 6.1, 7.1): `wgm t A B` is the weighted
geometric mean `A #ₜ B` and `riemDist A B = ‖log(A^(−1/2) B A^(−1/2))‖_F` the affine-invariant
distance on complex positive definite matrices. Neither pinned library has a metric on positive
definite matrices; Mathlib has the predicate `Matrix.PosDef`.

Prove `exists_metricSpace_posDef`: for every `n`, the set `{A : Mat n // A.PosDef}` carries a
metric space structure whose distance is `riemDist`, and with it the cone is complete and CAT(0).
Since a metric space structure contains the proof of the triangle inequality, which is a theorem
of the supplier, the statement asserts that such a structure exists. Completeness is stated for the
uniform structure of that metric, not for the entrywise one that the set of positive definite
matrices also inherits from the matrices. (Proved here.)

Route, resting on the declared statements of OperatorMonotoneFunctionsAndMatrixMeans, all in the
namespace `TauCetiRoadmap.OperatorMonotoneFunctionsAndMatrixMeans`:
`TauCetiRoadmap.OperatorMonotoneFunctionsAndMatrixMeans.riemDist_congr_inv_symm` (7.1),
`TauCetiRoadmap.OperatorMonotoneFunctionsAndMatrixMeans.riemDist_triangle` and
`TauCetiRoadmap.OperatorMonotoneFunctionsAndMatrixMeans.riemDist_wgm` (7.2),
`TauCetiRoadmap.OperatorMonotoneFunctionsAndMatrixMeans.riemDist_wgm_sq_le` (7.3) and
`TauCetiRoadmap.OperatorMonotoneFunctionsAndMatrixMeans.exists_tendsto_riemDist_of_cauchy` (7.4),
referred to below by their sections.

- Metric: symmetry is the third clause of the invariance statement of 7.1 with `X = 1`; the
  triangle inequality and `riemDist A B = 0 ↔ A = B` are the metric statement of 7.2.
- Completeness: a Cauchy sequence of the cone is `riemDist`-Cauchy, and
  the completeness statement of 7.4 gives a positive definite limit.
- Geodesics: `wgm t A B` is positive definite for every real `t`, because
  `misqrt A * B * misqrt A` is positive definite (`Matrix.PosDef.conjTranspose_mul_mul_same`, with
  `misqrt A` Hermitian and invertible), `cfc` of the positive function `x ↦ x ^ t` keeps it
  positive definite (`cfc_isStrictlyPositive_iff`, `Matrix.isStrictlyPositive_iff_posDef`), and
  congruence by `msqrt A` does too. By the geodesic statement of 7.2,
  `riemDist A (wgm 0 A B) = 0` and
  `riemDist (wgm 1 A B) B = 0`, so `wgm 0 A B = A` and `wgm 1 A B = B`. For `s ≤ t` in `[0, 1]`
  and `d = riemDist A B`, the semiparallelogram law of 7.3 with `C = wgm s A B` and the geodesic
  statement of 7.2 give
  `riemDist (wgm s A B) (wgm t A B)² ≤ ((1 − t)s² + t(1 − s)² − t(1 − t)) d² = (t − s)² d²`, and
  `TauCeti.isGeodesicSegment_of_dist_le` makes `t ↦ wgm t A B` a geodesic segment.
- The CN inequality: a metric midpoint of `A, B` is `wgm (1/2) A B` by the uniqueness clause of
  the geodesic statement of 7.2 at `t = 1/2`, and the semiparallelogram law of 7.3 at `t = 1/2`
  is the CN inequality there.

**Checks.**

- On diagonal positive definite matrices `riemDist (diag a) (diag b)` is the Euclidean distance of
  the vectors `(log aᵢ)` and `(log bᵢ)`, and `wgm t` is `diag(aᵢ^(1 − t) bᵢ^t)`; there the CN
  inequality is Apollonius's identity, an equality.
- For `n = 0` the cone has one point.
- For `n ≥ 1` the cone is not complete for the entrywise uniform structure of matrices: `k⁻¹ · 1`
  is entrywise Cauchy with limit `0`, which is not positive definite, while
  `riemDist (k⁻¹ · 1) (l⁻¹ · 1) = √n |log(k/l)|` is unbounded. This is why the Lean statement names
  the uniform structure of the metric in its completeness clause.

*Needs:* OperatorMonotoneFunctionsAndMatrixMeans Conventions, 5.1, 6.1 (definitions, copied), and
the five statements of 7.1–7.4 named above; Tau Ceti `TauCeti.isGeodesicSegment_of_dist_le`;
Mathlib `Matrix.PosDef.conjTranspose_mul_mul_same`, `cfc_isStrictlyPositive_iff`,
`Matrix.isStrictlyPositive_iff_posDef`.

### Examples

- The `2`-Wasserstein space over the real line is CAT(0) (Tau Ceti
  `TauCeti.WassersteinSpace.instIsCATZeroSpace`), so Layers 3 to 5 apply to it.

### Dependencies

6.1 and 6.2 need only Tau Ceti and Mathlib; 6.3 needs OperatorMonotoneFunctionsAndMatrixMeans
Layers 5 to 7.

## Scope and ownership

This roadmap develops the metric theory of CAT(0) spaces on Tau Ceti's predicate
`TauCeti.IsCATZeroSpace`. It owns: the agreement of the midpoint, comparison-triangle and
quadrilateral definitions and Reshetnyak's inequality (Layer 1); Busemann convexity and
contractibility (Layer 2); geodesically convex sets, minimizers of midpoint strongly convex
functions, nearest-point projections, and quadratic barycentres in complete spaces that need not
be proper (Layer 3); circumcentres and the fixed point theorem (Layer 4); flat rectangles and flat
strips (Layer 5); `L²` products, normed spaces and the positive definite cone (Layer 6).

Already in the pinned libraries and not restated: the predicate itself, strong convexity of the
squared distance and the comparison inequality along geodesic segments, the instances for inner
product spaces and Euclidean affine spaces and the transfer along isometries
(`TauCeti/Topology/MetricSpace/CATZero.lean`); convexity of the squared distance along geodesics
(`TauCeti.convexAlongGeodesics_dist_sq`); uniqueness of quadratic barycentres
(`TauCeti.subsingleton_frechetBarycenters_two`) and their existence on proper spaces
(`TauCeti.exists_isFrechetBarycenter`); the CAT(0) property of Wasserstein space over the line; and
Mathlib's nearest points in Hilbert spaces, of which 3.3 is the metric form.

Left to other roadmaps:

- OptimalTransport (12.2) plans the CAT(0) predicate and quadratic barycentres with uniqueness, and
  existence on proper spaces; Tau Ceti implements them. 3.4 adds existence in complete spaces that
  need not be proper. Its 8.1 owns curvature bounded below.
- OperatorMonotoneFunctionsAndMatrixMeans (Layer 7) owns the affine-invariant distance, its
  geodesics, the semiparallelogram law, completeness and the Karcher barycentre; 6.3 states only
  that these make the cone a complete CAT(0) metric space.
- ReductiveGroupsPartII (RG2.2) owns the building of a reductive group over a local field, its
  CAT(0) metric and its fixed point theorem.
- RealSemisimpleLieGroups (5.4) owns convexity on Hadamard manifolds and Cartan's fixed-point
  theorem for compact groups acting on them.
- FreeGroupsAndLimitGroups (9.2) owns `Λ`-trees, whose metrics take values in an ordered abelian
  group.

Not treated here: CAT(κ) for `κ ≠ 0` and curvature bounded below; that Hadamard manifolds are
CAT(0); Alexandrov angles and the boundary at infinity; the flat torus theorem and Reshetnyak's
majorization theorem; laws of large numbers and Jensen's inequality for barycentres; buildings.

The paper *VP ≠ VNP over every field* (Claude, Anthropic, 2026; public at
github.com/anthropics/formal-math, folder `vp-vnp`) uses standard facts of this kind in its
Lemma C.4. The Lean development in the same folder proves the quadruple and quadrilateral
inequalities, nearest points with the Pythagoras inequality, the contraction bound for weighted
barycentres, finite `L²` products and flat rectangles for its own class of complete metric spaces
in which any two points have a point satisfying the CN inequality; it is not one of the pinned
libraries.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Topology/UniformSpace/Cauchy.lean` and `Mathlib/Topology/MetricSpace/Cauchy.lean`:
  `cauchySeq_tendsto_of_complete`; used in 1.1.
- `Mathlib/Geometry/Euclidean/Triangle.lean`:
  `EuclideanGeometry.dist_sq_add_dist_sq_eq_two_mul_dist_midpoint_sq_add_half_dist_sq`
  (Apollonius); used in 1.2. `EuclideanSpace`, `AffineMap.lineMap`.
- `Mathlib/Topology/Homotopy/Contractible.lean`: `ContractibleSpace`,
  `contractible_iff_id_nullhomotopic`; used in 2.2.
- `Mathlib/Analysis/Convex/Basic.lean`: `Convex`, `convex_iff_segment_subset`,
  `Convex.lineMap_mem`; `StrictConvexSpace`; used in 3.1.
- `Mathlib/Analysis/InnerProductSpace/Projection` files: `exists_norm_eq_iInf_of_complete_convex`,
  `norm_eq_iInf_iff_real_inner_le_zero`; compared in 3.3.
- `Real.iSup_of_isEmpty`, `Real.iSup_of_not_bddAbove`, `Bornology.IsBounded`; used in 4.1.
- `IsIsometricSMul`, `isometry_smul`; used in 4.2.
- `Continuous.exists_forall_le`; used in 5.2.
- `Mathlib/Analysis/Normed/Lp/ProdLp.lean`: `WithLp`, `WithLp.prod_dist_eq_add`; used in 6.1.
- `Mathlib/Analysis/InnerProductSpace/OfNorm.lean`: `InnerProductSpaceable`,
  `InnerProductSpace.ofNorm`; used in 6.2.
- `Matrix.PosDef`, `Matrix.PosDef.conjTranspose_mul_mul_same` (congruence by a matrix with
  injective `mulVec`), `cfc_isStrictlyPositive_iff`, `Matrix.isStrictlyPositive_iff_posDef`;
  used in 6.3.
- `Affine.Simplex.circumcenter`, compared in 4.1.

### From Tau Ceti

- `TauCeti/Topology/MetricSpace/CATZero.lean`: `TauCeti.IsCATZeroSpace` (the class, with field
  `TauCeti.IsCATZeroSpace.dist_sq_le_of_dist_eq_half`), `TauCeti.IsGeodesicSegment.dist_sq_le`
  (for a geodesic segment from `x` to `y`, every `z` and `t ∈ [0, 1]`,
  `d(z, γ t)² ≤ (1 − t) d(z, x)² + t d(z, y)² − t(1 − t) d(x, y)²`), used throughout;
  `TauCeti.IsCATZeroSpace.of_isometry` (6.1 remark), `TauCeti.instIsCATZeroSpace` (6.2).
  Imported by `Suggested.lean`.
- `TauCeti/Topology/MetricSpace/Length.lean`: `TauCeti.IsGeodesicSegment` and its lemmas
  `.reverse`, `.comp_isometry`, `.dist_source_apply`, `.dist_eq`, `.eq_lineMap` (strictly convex
  normed torsors), `TauCeti.isGeodesicSegment_of_dist_le` (a curve with the right ends and
  `d(γ s, γ t) ≤ (t − s) d(x, y)` for `0 ≤ s ≤ t ≤ 1` is a geodesic segment),
  `TauCeti.isGeodesicSegment_lineMap`, `TauCeti.IsGeodesicSpace`.
- `TauCeti/Analysis/GradientFlow/GeodesicConvex.lean`: `TauCeti.ConvexAlong`,
  `TauCeti.ConvexAlongGeodesics`; used in 3.1. Imported by `Suggested.lean`.
- `TauCeti/MeasureTheory/Measure/FrechetMean/Basic.lean`: `TauCeti.frechetPower`,
  `TauCeti.IsFrechetBarycenter`, `TauCeti.isFrechetBarycenter_iff_forall_frechetPower_le`
  (`p ≠ 0`, `p ≠ ∞`, a.e.-measurable distance functions), `TauCeti.frechetRadius_ne_top_of_ne_top`
  and `TauCeti.lipschitzWith_one_toReal_frechetRadius` (probability measures, `1 ≤ p`),
  `TauCeti.frechetRadius_rpow_eq_frechetPower`, `TauCeti.chebyshevRadius`; used in 3.4 and 4.1.
  Imported by `Suggested.lean`.
- `TauCeti/MeasureTheory/Measure/FrechetMean/CATZero.lean`:
  `TauCeti.IsGeodesicSegment.frechetPower_two_add_le` (strong convexity of the quadratic Fréchet
  functional along geodesic segments; pseudometric CAT(0) space, open sets measurable); used in 3.4.
- `TauCeti/MeasureTheory/OptimalTransport/Wasserstein/Quantile/Isometry.lean`:
  `TauCeti.WassersteinSpace.instIsCATZeroSpace`; an Example of Layer 6.

### From TauCetiRoadmap.OptimalTransport

- 12.2 (existence on proper spaces and CAT(0) uniqueness): the CAT(0) predicate and the Fréchet
  radius and barycentre, which Tau Ceti implements as listed above; 3.4 uses them.

### From TauCetiRoadmap.OperatorMonotoneFunctionsAndMatrixMeans

- Conventions, 5.1, 6.1, 7.1: `Mat`, `msqrt`, `misqrt`, `opMean`, `wgm`, `frob`, `riemDist`,
  copied verbatim.
- 7.1 `TauCetiRoadmap.OperatorMonotoneFunctionsAndMatrixMeans.riemDist_congr_inv_symm` (positive
  definite `A, B`, invertible `X`: congruence and inversion invariance, and
  `riemDist B A = riemDist A B`).
- 7.2 `TauCetiRoadmap.OperatorMonotoneFunctionsAndMatrixMeans.riemDist_triangle` (positive definite
  `A, B, C`: the triangle inequality and `riemDist A B = 0 ↔ A = B`) and
  `TauCetiRoadmap.OperatorMonotoneFunctionsAndMatrixMeans.riemDist_wgm` (positive definite `A, B`,
  `t ∈ [0, 1]`: the two distances of `wgm t A B`, and uniqueness among positive definite matrices).
- 7.3 `TauCetiRoadmap.OperatorMonotoneFunctionsAndMatrixMeans.riemDist_wgm_sq_le` (the
  semiparallelogram law).
- 7.4 `TauCetiRoadmap.OperatorMonotoneFunctionsAndMatrixMeans.exists_tendsto_riemDist_of_cauchy`
  (completeness).
- All five are used in 6.3.

## References

- F. Bruhat and J. Tits, *Groupes réductifs sur un corps local. I. Données radicielles valuées*,
  Publ. Math. IHÉS 41 (1972), 5–251 (Numdam); §3.2, pp. 63–64.
- K.-T. Sturm, *Probability measures on metric spaces of nonpositive curvature*, in *Heat Kernels
  and Analysis on Manifolds, Graphs, and Metric Spaces*, Contemp. Math. 338 (2003), 357–390; page
  numbers are those of the author's preprint on his web page.
- T. Sato, *An alternative proof of Berg and Nikolaev's characterization of CAT(0)-spaces via
  quadrilateral inequality*, Arch. Math. 93 (2009), 487–490; page numbers are those of the Kyoto
  University preprint (2008).
- S. R. B. Poulsen, *A gentle introduction to CAT(0) spaces*, arXiv:2406.09883v2; statement
  numbers of that version.
- I. D. Berg and I. G. Nikolaev, *Quasilinearization and curvature of Aleksandrov spaces*, Geom.
  Dedicata 133 (2008), 195–218 (the quadrilateral characterization; cited through Sato, not
  consulted).
- M. R. Bridson and A. Haefliger, *Metric Spaces of Non-Positive Curvature*, Springer, 1999 (the
  standard reference; not consulted).

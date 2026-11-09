# Roadmap: local geometry of Riemannian surfaces

**Summary.** Develop the local intrinsic geometry of smooth Riemannian surfaces: polar
coordinates and normal strips with their Jacobians and the polar length and area formulas,
integration up to normal cut times on surface domains, Gauss–Bonnet for disks with corners
together with the turning theorem for curves with corners, normal balls in nonpositive
curvature without completeness, and conformal invariance of the surface Dirichlet energy.
Every statement is local: the ambient surface is boundaryless and never assumed complete,
and the domains inside it may have boundary and corners.

## Scope and ownership

This sub-roadmap of [RiemannianGeometry](../README.md) is independently definitive. It owns:

- Layer 1: the polar Jacobian j on a metric normal ball of a surface, the normal-strip
  Jacobian a of an embedded arc with its signed geodesic curvature, the distance to an arc
  near an interior footpoint, and the polar length and area formulas
  `L′(r) = 2π − ∫_(B_r) K`, `V′(r) = L(r)`.
- Layer 2: the normal cut time of a boundary arc or circle of a surface domain, the normal
  coverage of the near region outside a null set, and the integration formula up to the cut
  time with `|grad d| = 1` almost everywhere and the coarea identity.
- Layer 3: the Gauss–Bonnet formula for a compact disk with piecewise smooth boundary in an
  oriented surface, the boundary term against local connection forms, cancellation along a
  common boundary arc, and the extension of the signed planar turning theorem to curves with
  corners.
- Layer 4: disk filling for simple closed curves in a simply connected open set lying in one
  chart, and normal balls under `K ≤ 0` on such a ball.
- Layer 5: conformal invariance of the surface Dirichlet energy, under a conformal rescaling
  and under a conformal diffeomorphism.

Boundaries with the parent and with other roadmaps:

- [R4.1](../README.md#r4-comparison-complete-manifolds-and-space-forms) and R4.6 own the
  cut-truncated polar domain and polar integration on complete manifolds in all dimensions.
  Layer 1 lives on metric normal balls of a surface, without completeness.
- [R1](../README.md#r1-intrinsic-curvature-calculus-and-normal-coordinate-jets) owns the
  curvature tensor, the Gaussian curvature of a surface as its sectional curvature, and the
  conformal transformation laws of the connection and the curvature. Layer 5 is the
  integrated two-dimensional energy identity.
- R2 and R3 own Jacobi fields, geodesic variations, conjugate points and the loss of
  minimality past a conjugate point.
  [R6](../README.md#r6-focal-geometry-and-squared-distance-morse-functions) owns focal points
  of submanifolds, the measure-zero focal set and the shortening variation past an interior
  focal point; R4.2 owns first variation with a moving endpoint. Layers 1 and 2 consume them.
- [R4.9.6a](../README.md#r496a-length-controlled-parametric-regularization) owns the signed
  planar turning theorem for smooth Jordan curves and the round-sphere disk and annulus
  identities. Layer 3 consumes the smooth turning theorem and owns only its extension to
  corners.
- PositiveMass §3.1 owns the Gauss–Bonnet theorem for compact surfaces with boundary and
  arbitrary Euler characteristic, with its triangulation and Euler identification and its
  exhaustion naturality. It consumes Layer 3's disk formula, boundary term and common-arc
  cancellation. Annuli are the case `χ = 0` of that theorem and are not restated here.
- R4.4 owns Cartan–Hadamard on complete manifolds. Layer 4 assumes no completeness; its
  generality is a simply connected ball lying in one chart of the maximal atlas, which by
  ConformalMapping L3 is the same as a ball diffeomorphic to the open unit disk. The
  statement for an arbitrary simply connected ball reduces to this one through the theorem
  that a simply connected open surface is diffeomorphic to the plane, equivalently through
  disk filling on arbitrary surfaces (Epstein, *Curves on 2-manifolds and isotopies*, Acta
  Math. 115 (1966), 83–107, Theorem 1.7). That classification is surface topology outside
  this sub-roadmap and is owned by no roadmap cited here, so it is not an input, and the
  chart hypothesis is Layer 4's stated generality rather than a step of its proof.

## Conventions

Work with finite-dimensional real, Hausdorff, second-countable smooth surfaces and smooth
positive-definite metrics, expressed through Mathlib's `ModelWithCorners`, `ChartedSpace`,
`IsManifold`, `RiemannianBundle`, `IsContMDiffRiemannianBundle` and `IsRiemannianManifold`.
The ambient surface is boundaryless (`I.Boundaryless`), as every exponential-map supplier
below requires. Domains with boundary and corners are compact subsets of the ambient surface
whose boundary is piecewise smooth, so their normal exponentials, distances and curvature are
those of the ambient surface. Impose orientation and compactness where stated.

Curvature follows the parent: `R(X,Y)Z = ∇_X∇_Y Z − ∇_Y∇_X Z − ∇_[X,Y]Z`, and the Gaussian
curvature K of a surface is its sectional curvature, `+1` on the unit sphere. Distances are
intrinsic. Use arclength whenever a geodesic parameter is identified with distance. All
exponential domains remain explicit.

**Corners.** At a corner of a piecewise smooth boundary the two one-sided unit tangents are
nonzero. The interior angle βᵢ ∈ (0, 2π) is the angle of the domain at the corner, measured
inside it, and the signed exterior angle is `αᵢ = π − βᵢ ∈ (−π, π)`. Convex corners have
`αᵢ > 0`, reflex corners `αᵢ < 0`, and cusps, `βᵢ ∈ {0, 2π}`, are excluded. For a positively
oriented planar curve with one-sided unit tangents `v⁻` and `v⁺` at a corner, `αᵢ` is the
argument of `v⁺/v⁻` in `(−π, π)`; on an oriented surface it is the oriented angle
`oangle(v⁻, v⁺)` of the oriented tangent plane, `Orientation.oangle`, as a real number in
`(−π, π)`. A reflex corner is not a smoothly embedded quadrant with
the inherited metric. Treat it by subdividing into pieces with convex corners, using Layer 3's
cancellation along common arcs and of endpoint angles, or through DifferentialGeometry
5.6.3's Green identity for piecewise `C¹` cycles in charts, which needs no corner charts.

**Orientation, conormals and connection forms.** An orientation of the surface is
`TauCeti.Manifold.Orientation I M (Fin 2)`, which orients every tangent plane through
`orientationAt`, and J denotes the rotation by `+π/2` of the oriented tangent plane,
`Orientation.rightAngleRotation`. Boundary components are oriented with the domain on the
left: for a unit tangent T of the boundary, `exp(ε J T)` lies in the interior of the domain for
small `ε > 0`, and `J T` is the inward conormal. k_g is the signed geodesic curvature with
respect to the inward conormal, `k_g = ⟨D_t T, J T⟩`, so that the unit circle bounding the
unit disk has `k_g = 1`. For an oriented
orthonormal frame `(e₁, e₂)` on an open set, the connection form ω is defined by
`∇e₁ = ω ⊗ e₂`, so that `dω = −K dA`, and for a unit-speed boundary curve with tangent
`T = cos θ e₁ + sin θ e₂` the boundary term is `k_g ds = dθ + ω(T) ds`. Witness on the unit
sphere with `e₁ = ∂_φ` and `e₂ = (sin φ)⁻¹ ∂_ψ`: `ω = cos φ dψ`, `dω = −sin φ dφ ∧ dψ = −K dA`,
and on the boundary of the cap `{φ ≤ φ₀}`, traversed with the cap on its left, `T = e₂`, θ is
constant and `k_g = ω(T) = cot φ₀`, the geodesic curvature of the latitude circle. The
opposite sign convention would give `−cot φ₀`.

## Exact supplier contracts

### From Mathlib

- `ModelWithCorners`, `ChartedSpace`, `IsManifold`, `IsManifold.maximalAtlas`,
  `RiemannianBundle`, `IsContMDiffRiemannianBundle`, `IsRiemannianManifold`: the manifold
  and metric carriers.
- `LipschitzWith.ae_differentiableAt` (`Mathlib/Analysis/Calculus/Rademacher.lean`):
  Rademacher's theorem, used by Layer 2 for the distance to an arc in charts.
- `SimplyConnectedSpace`, `IsSimplyConnected`, `Complex.arg`, `intervalIntegral`,
  `IntervalIntegrable`, `HasDerivAt`, `derivWithin`: the carriers of the Layer 3 and Layer 4
  statements.
- `Complex.exists_continuousOn_eqOn_exp_comp` (`Mathlib/Analysis/Complex/BranchLogRoot.lean`):
  a continuous nonvanishing function on an open simply connected planar set has a continuous
  logarithm there, used by Layer 4.1.
- `Orientation.rightAngleRotation` (`Mathlib/Analysis/InnerProductSpace/TwoDim.lean`) and
  `Orientation.oangle` (`Mathlib/Geometry/Euclidean/Angle/Oriented/Basic.lean`): the rotation
  by `+π/2` and the oriented angle of an oriented real inner product plane, the inward conormal
  and the signed exterior angle of Layer 3.2.

### From Tau Ceti

Each item names its module under `TauCeti/`. Every exponential-map item below is stated for
a boundaryless model, `[I.Boundaryless]`, which the conventions impose on the ambient
surface.

- `TauCeti.Manifold.IsGeodesicCurveOn` (`Geometry/Manifold/Riemannian/Geodesic/Basic.lean`);
  `expDomain`, `riemannianExp` (`…/Geodesic/Exponential.lean`); `IsNormalDomain`,
  `riemannianLog` (`…/Geodesic/Normal/Basic.lean`); the Gauss lemma
  `inner_mfderiv_riemannianExp_radial` (`…/Geodesic/Gauss/Basic.lean`); the pointwise polar
  inequality `abs_inner_le_norm_mul_norm_mfderiv_riemannianExp` and the radial distance bound
  `IsNormalDomain.ofReal_norm_riemannianLog_le_pathELength` (`…/Geodesic/Gauss/Polar.lean`);
  the energy first variation `hasDerivAt_energy` (`…/Riemannian/FirstVariation.lean`); the
  completeness theory of `…/Geodesic/HopfRinow.lean`. These are the Layers 0–4 of the
  completed [HopfRinow](../../../Completed/HopfRinow/README.md) roadmap.
- `alongCurveWithin` (`Geometry/Manifold/VectorBundle/CovariantDerivative/AlongCurve/Basic.lean`)
  and `curveVelocityWithin` (`Geometry/Manifold/MFDeriv/Curve.lean`): the covariant
  derivative along a curve that defines the signed geodesic curvature of Layer 1.2.
- `TauCeti.Manifold.IsJacobiFieldOn` with the equation `D_t²J + R(J,γ′)γ′ = 0`
  (`…/Riemannian/Jacobi/Basic.lean`); `isJacobiFieldOn_mfderiv_riemannianExp`
  (`…/Jacobi/Exponential.lean`), the differential of the exponential map as a Jacobi field,
  used by Layer 1; `not_isConjugateOn_of_sectionalCurvature_nonpos`
  (`…/Jacobi/Conjugate.lean`) and
  `norm_le_norm_mfderiv_riemannianExp_of_sectionalCurvature_nonpos`
  (`…/Jacobi/Comparison.lean`), used by Layer 4.
- `CovariantDerivative.leviCivitaConnection` and `sectionalCurvature`
  (`Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita/…`,
  `…/Curvature/Sectional.lean`).
- `TauCeti.SmoothEmbedding.normalExp`, `normalExpDomain`
  (`Geometry/Manifold/TubularNeighborhood/Riemannian/Basic.lean`), with
  `isOpen_normalExpDomain`, `contMDiffOn_normalExp` (`…/Riemannian/Regularity.lean`) and
  `exists_partialDiffeomorph_normalExp_subset` (`…/Riemannian/Coordinates.lean`): the normal
  exponential of an embedding and its tube.
- `TauCeti.Manifold.mgradient` (`Geometry/Manifold/Riemannian/Gradient/Basic.lean`).
- `TauCeti.Manifold.Orientation` and `orientationAt` (`Geometry/Manifold/Orientation/Basic.lean`):
  an orientation of the surface and the orientation it induces on each tangent plane, the
  orientation carrier of Layer 3.2.
- `TauCeti.riemannianVolume` (`…/Riemannian/VolumeDensity/Volume.lean`);
  `Homeomorph.measurePreserving_riemannianVolume` (`…/Riemannian/VolumeDensity/Isometry.lean`),
  the isometry invariance of the Riemannian volume for a differentiable homeomorphism whose
  tangent maps preserve the inner products, between manifolds modelled on one vector space:
  the change of variables of Layer 5.2.
- `TauCeti.WithMetric`, `ContMDiffRiemannianMetric.rescale` and `conformalClass`
  (`…/Riemannian/WithMetric.lean`, `Geometry/Manifold/VectorBundle/Riemannian/Conformal.lean`);
  `TauCeti.WithMetric.inner_mgradient_rescale` (`…/Riemannian/Conformal.lean`) and
  `integral_riemannianVolume_rescale` (`…/Riemannian/VolumeDensity/Conformal.lean`), the
  pointwise and volume halves of Layer 5; `ContMDiffRiemannianMetric.pullback` and
  `pullback_inner` (`…/Riemannian/Pullback/Basic.lean`).
- `TauCeti.Contour.windingNumber` (`Analysis/Contour/Winding/Number/Basic.lean`),
  `TauCeti.IsJordanCurve` (`Topology/JordanCurve/Basic.lean`) and `TauCeti.filledHull`
  (`Topology/FilledHull.lean`), the planar carriers of Layers 3 and 4;
  `TauCeti.HasContinuousLogOn` (`Analysis/Complex/ContinuousLog/Basic.lean`) and the
  filled-hull criterion `hasContinuousLogOn_sub_iff_notMem_filledHull`
  (`Analysis/Complex/PlaneSeparation/Basic.lean`): for a bounded closed `K ⊆ ℂ`, `z ↦ z − a`
  has a continuous logarithm on K exactly when `a ∉ filledHull K`, used by Layer 4.1.

### From TauCetiRoadmap.RiemannianGeometry

R1: the curvature of a surface and the constant-scaling law. R2: geodesic variations and the
fixed-chart derivative lift. R3: a geodesic does not minimize past a conjugate point. R4.2:
first variation with a moving endpoint. R4.9.6a: the signed planar turning theorem for
smooth Jordan curves, with its tangent-angle lift on intervals, the degree/turning-integral
identity and the Jordan orientation comparison giving degree `+1`. R6: focal points of the
normal exponential of an embedded curve, nullity of its focal set, and the shortening
variation past an interior focal point. All are stated for boundaryless manifolds.

### From TauCetiRoadmap.DifferentialGeometry

[DifferentialGeometry](../../DifferentialGeometry/README.md) 5.3–5.5: Stokes on manifolds
with boundary and corners; 5.6.3: the winding-weighted Green identity for piecewise `C¹`
cycles; 10.2: manifold Sard; 12.2: the gradient with its chain rule; 12.4: the density/measure
comparison.

### From TauCetiRoadmap.GeometricMeasureTheory

[GeometricMeasureTheory](../../GeometricMeasureTheory/README.md) G1: arclength of
rectifiable curves; G2: the area and coarea formulas.

### From Completed.ConformalMapping

[ConformalMapping](../../../Completed/ConformalMapping/README.md) L3: the Riemann mapping
theorem; L5: the planar Jordan curve theorem, with exactly two complementary components, the
inside `filledHull C \ C` open, bounded and connected with frontier C, the filled-hull
containment and separation API, and the Carathéodory closed-disc correspondence for Jordan
domains.

## How to read the build

Layer 1 builds the two Jacobians of a surface, polar and normal, from the Jacobi equation,
and derives the polar length and area formulas from `j_rr + Kj = 0`, `j_r(0) = 1` and
Fubini alone; they use no curvature sign and no Gauss–Bonnet input. Layer 2 integrates up
to the normal cut time on a domain, using Layer 1's strips, R6's focal theory and R4.2's
moving-endpoint variation. Layer 3 proves the disk Gauss–Bonnet formula with corners from
Stokes and local connection forms, independently of Layers 1–2, and extends R4.9.6a's
turning theorem to corners. Layer 4 fills simple closed curves in a one-chart ball with
disks and uses Layer 3's disk formula to exclude geodesic bigons and loops. Layer 5 is
independent of Layers 1–4. The Lean name at each target is its signature in
`Suggested.lean`.

## Layer 1 (S1): polar coordinates and normal strips

### 1.1 Polar density

Let p lie on a smooth Riemannian surface. Assume `R > 0`, that the tangent R-ball lies in
the domain of `exp_p`, that `exp_p` maps it bijectively onto the metric R-ball with
`d(p, exp_p v) = |v|`, and that the closed metric R-ball is compact. Since a radial geodesic
that minimizes up to R has no conjugate point before R (R3), `exp_p` is a diffeomorphism
from the open tangent ball onto the open metric ball. Parametrize the unit tangent circle by
angular arclength θ. For `F(r,θ) = exp_p(r e(θ))`, construct the radial Jacobian
`j(r,θ) = |d(exp_p)_(r e(θ))(r e′(θ))|` and prove

`F*g = dr² + j(r,θ)² dθ²`,

`j_rr + (K ∘ F)j = 0`, `j(0,θ) = 0`, `j_r(0,θ) = 1`,

where the value and derivative at zero are the one-sided limits (do Carmo, *Differential
Geometry of Curves and Surfaces*, §4-6, geodesic polar coordinates and the equation
`(√G)_ρρ + K√G = 0`, 1976 edition; Lee, *Introduction to Riemannian
Manifolds*, 2nd ed., Theorem 6.9, the Gauss lemma, in "Geodesics and Minimizing Curves",
pp. 151–162, and the Jacobi field `d(exp_p)_(rv)(rw)` in "Basic Computations with Jacobi
Fields", pp. 287–296). Lean name: `polar_jacobian_ode`.

**API.**

- `j > 0` for `0 < r < R`, smoothness of j in `(r,θ)` away from the centre, and the one-sided
  limits `j → 0`, `j_r → 1` as `r ↓ 0`, uniformly in θ.
- `j dr dθ` is the Riemannian area measure and `j dθ` is arclength on the r-circle, through
  DifferentialGeometry 12.4 and GeometricMeasureTheory G1.
- Change of variables on angular charts, their agreement across the angular seam, and
  differentiation under the integral in r for the circle lengths and disk areas.

**Checks.**

- Euclidean plane: `j(r,θ) = r`.
- Unit sphere: `j = sin r`, with `−sin r + sin r = 0`; hyperbolic plane: `j = sinh r`, with
  `sinh r − sinh r = 0`.
- Negative control for the equation: `j = r` on the unit sphere gives `j_rr + j = r ≠ 0`.
- Negative control for the hypotheses: on the unit sphere with `R = 4`, `d(p, exp_p v) = |v|`
  fails for `|v| > π`, where the distance is `2π − |v|`.

*Needs:* HopfRinow's Gauss lemma and radial distance; `isJacobiFieldOn_mfderiv_riemannianExp`
and R2's geodesic variations; R3; DifferentialGeometry 12.4; GeometricMeasureTheory G1.

### 1.2 Normal strips

Let σ be a smooth embedded unit-speed arc in the surface, with a smooth unit normal n along
it. Use the normal exponential `F(s,t) = exp_(σ(s))(t n(s))`. On a regular injective strip
containing `t = 0`, define the signed geodesic curvature by `k_g = ⟨D_s σ′, n⟩`, that is
`∇_(σ′)σ′ = k_g n`. Construct a positive scalar a and prove

`F*g = dt² + a(s,t)² ds²`,

`a_tt + (K ∘ F)a = 0`, `a(s,0) = 1`, `a_t(s,0) = −k_g(s)`

(Chavel, *Riemannian Geometry: A Modern Introduction*, 2nd ed., §III.6, Fermi coordinates,
pp. 138–145; Lee, 2nd ed., "Tubular Neighborhoods and Fermi Coordinates", pp. 133–136, and
"Basic Computations with Jacobi Fields", pp. 287–296). Lean name: `normalStrip_jacobian`.

**API.**

- `a ds dt` is area and `a ds` is the arclength of the parallel arc `t = const`, through
  DifferentialGeometry 12.4 and GeometricMeasureTheory G1.
- For a fixed compact parameter interval `[s₀,s₁]`, `L(t) = ∫_[s₀,s₁] a(s,t) ds`,
  `L′(t) = ∫_[s₀,s₁] a_t(s,t) ds`, and `Area(F([s₀,s₁] × [0,t])) = ∫₀ᵗ L(τ) dτ` for
  nonnegative t in the strip.
- Restriction to subarcs, and compatibility with changing the chosen normal: replacing n by
  `−n` replaces `k_g` by `−k_g` and `a(s,t)` by `a(s,−t)`.
- For an arc σ of the boundary of a domain D, take n inward and `t ≥ 0`; the strip is the
  ambient normal exponential restricted to `t ≥ 0`, and the formulas hold with right
  derivatives at zero.

**Checks.**

- Straight line in the plane: `k_g = 0` and `a = 1`.
- Plane circle of radius ρ with inward normal: `k_g = 1/ρ`, `a(s,t) = 1 − t/ρ` before
  `t = ρ`, so `a_t(s,0) = −1/ρ = −k_g`; with the outward normal `k_g = −1/ρ` and
  `a = 1 + t/ρ`.
- Latitude circle of the unit sphere at polar angle `φ₀`, normal toward the pole:
  `k_g = cot φ₀`, `a(s,t) = sin(φ₀ − t)/sin φ₀`, so `a_t(s,0) = −cot φ₀ = −k_g` and
  `a_tt + a = 0`. Equator: `a = cos t`, `k_g = 0`.
- `L′` for the latitude circle: `L′(t) = −2π cos(φ₀ − t)` on both sides of the formula; for a
  plane annular sector of angle θ about a circle of radius ρ, `Area = θ/2 · (ρ² − (ρ − t)²)`
  equals `(s₁ − s₀)(t − t²/(2ρ))`.

*Needs:* `SmoothEmbedding.normalExp` and its tube; `alongCurveWithin`; R2's Jacobi fields;
DifferentialGeometry 12.4; GeometricMeasureTheory G1.

### 1.3 Distance to an arc

Prove that a nonconstant segment realizing the distance from a point to a smooth arc, with
its footpoint in the arc interior, has initial velocity orthogonal to the arc, from R4.2's
first variation with a moving endpoint (Lee, 2nd ed., "Geodesics and Minimizing Curves",
first variation formula, pp. 151–162). On a sufficiently small tube of a compact subarc,
identify `t ≥ 0` with distance to that subarc when the nearest point is interior. Retain the
minimizing, boundary-separation, regularity and injectivity hypotheses when extending the
strip. The formulas do not extend across a focal point or a competing nearest-point branch.

**Checks.**

- The x-axis segment `[0,1]` and the point `(1/2, 2)`: the foot `(1/2, 0)` is interior and
  the velocity `(0, −2)` is orthogonal to the segment.
- The same segment and the point `(2, 1)`: the foot `(1, 0)` is the endpoint, the velocity
  `(−1, −1)` has inner product `−1` with the direction `(1, 0)`, and no orthogonality holds.
  The interior hypothesis is load-bearing.
- Plane circle of radius ρ with inward normal: `t` is the distance to the circle for
  `0 ≤ t < ρ`, and the centre is the focal point where the identification stops.

*Needs:* 1.2; R4.2; HopfRinow's local minimizing geodesics.

### 1.4 Polar length and area

For the polar disks of 1.1, put `L(r) = Length(∂B_r(p)) = ∫₀^(2π) j(r,θ) dθ` and
`V(r) = Area(B_r(p))`. Prove

`L′(r) = 2π − ∫_(B_r(p)) K dμ`, `V′(r) = L(r)`, `L(0) = V(0) = 0`,

where the values at zero are the continuous extensions: integrate `j_rr = −Kj` in r from
the initial condition `j_r(0,θ) = 1` and use Fubini on `j dr dθ` (Chavel, 2nd ed., §III.1,
geodesic spherical coordinates, p. 112; do Carmo, *Curves and Surfaces*, §4-6). Lean name:
`hasDerivAt_polarLength_and_volume_ball`.

**API.**

- The integrated forms `L(r) − 2πr = −∫₀ʳ ∫_(B_ρ(p)) K dμ dρ` and
  `V(r) − πr² = −∫₀ʳ ∫₀ᵗ ∫_(B_ρ(p)) K dμ dρ dt`.
- Continuity of L and V on `[0, R)` and differentiability on `(0, R)`, from 1.1's
  differentiation under the integral.
- Monotonicity of V, and the comparison `L(r) ≤ 2πr`, `V(r) ≤ πr²` when `K ≥ 0` on the
  ball, and the reverse inequalities when `K ≤ 0`.

**Checks.**

- Euclidean plane: `L = 2πr`, `V = πr²`.
- Unit sphere: `L = 2π sin r`, `V = 2π(1 − cos r)`, so `L′ = 2π cos r = 2π − V` and
  `V′ = 2π sin r = L`; integrated, `2π(sin r − r) = −2π ∫₀ʳ (1 − cos t) dt`, both sides being
  `−2π(1 − sin 1) = −0.9961` at `r = 1`.
- Unit sphere, the area identity: `2π(1 − cos r) − πr² = −2π ∫₀ʳ (t − sin t) dt`, both sides
  being `−0.2532` at `r = 1`.
- Hyperbolic plane: `L = 2π sinh r`, `V = 2π(cosh r − 1)`, so
  `L′ = 2π cosh r = 2π + 2π(cosh r − 1)`.

Keep 1.1's metric normal-ball hypotheses. No curvature sign and no global cut-locus
nullity theorem is a prerequisite.

*Needs:* 1.1.

### Examples

- The three model surfaces above, with the two negative controls of 1.1 and the endpoint
  control of 1.3.
- The strip about the equator of the unit sphere reaches `t = π/2` on each side, where
  `a = cos t` vanishes at the pole: the focal point of 1.3 and the cut time of Layer 2.

### Dependencies

HopfRinow's exponential map, Gauss lemma and local minimizing geodesics; R2's Jacobi fields
and R3's loss of minimality past a conjugate point; R4.2's moving-endpoint first variation;
the tubular neighbourhood of an embedded arc; DifferentialGeometry 12.4 and
GeometricMeasureTheory G1 for the identification of densities with area and arclength. No
curvature sign, no Gauss–Bonnet and no completeness input.

## Layer 2 (S2): integration up to normal cut times

### 2.1 Cut time and normal coverage

Let D be a compact domain with piecewise smooth boundary in a surface and σ a smooth
boundary circle or compact boundary arc. In the arc case, assume its adjacent boundary sides
γ₁, γ₂ are unit-speed geodesics meeting σ at interior angles π/2, with `d_D(σ,γᵢ(t)) = t`
for `0 ≤ t ≤ ℓ`. Assume all remaining boundary is at distance at least ℓ from σ, and fix
`0 < R < ℓ`. For a boundary circle, ℓ is any positive number such that the rest of the
boundary lies at distance at least ℓ from σ. Put `T_R = {x ∈ D : 0 < d_D(x,σ) < R}`. Use
intrinsic distances in D.

For an interior footpoint s of σ, follow the inward normal exponential `F(s,t)` of 1.2.
Define c(s), capped at ℓ, as the supremum of times up to which the normal segment stays in D
and realizes distance to σ. Prove `0 < c(s) ≤ ℓ`, measurability of c, positivity of the
Jacobian a before c(s), and unique regular normal parametrization of T_R outside an
area-null set (Chavel, 2nd ed., §III.2, conjugate and cut loci, from p. 114, for the point
case; Lee, 2nd ed., "Cut Points", pp. 307–312). Apply R6's shortening variation: a focal
point strictly before the endpoint prevents minimization. Prove that the stated side
conditions exclude interior regions reached by minimizers ending at the endpoints of the
arc; do not discard such regions without this argument. Apply R6's nullity of the focal set
to the normal exponential of σ, and prove nullity of the set of points with competing
minimizing normals, using Rademacher's theorem for the distance in charts.

**API.**

- Lower semicontinuity of c, and `c(s) = ℓ` on every parameter where the normal segment of
  length ℓ realizes the distance.
- The normal parametrization `(s,t) ↦ F(s,t)` on `{0 < t < min(R, c(s))}` is injective with
  positive Jacobian, and its image has full area measure in `T_R`.
- Restriction of c to subarcs, and its monotonicity in D: enlarging D never decreases c.

**Checks.**

- Disk of radius ρ in the plane with σ its boundary circle and `ℓ ≥ ρ`: `c ≡ ρ`.
- Rectangle `[0,a] × [0,b]`, σ the bottom side with the two vertical sides as γ₁, γ₂: `ℓ = b`
  and `c ≡ b`.
- Unit sphere, σ the equator and D the closed northern hemisphere, with `ℓ ≥ π/2`: `c ≡ π/2`,
  the pole being the focal point of every normal geodesic.

*Needs:* 1.2, 1.3; R6; R4.2; `LipschitzWith.ae_differentiableAt`; DifferentialGeometry 10.2.

### 2.2 Integration formula and coarea

For every nonnegative measurable f, prove

`∫_(T_R) f dμ = ∫_σ ∫₀^min(R,c(s)) f(F(s,t)) a(s,t) dt ds`

(Chavel, 2nd ed., §III.6, integration in Fermi coordinates, pp. 138–145, together with the
cut-locus truncation of §III.2). Prove `|grad d_D(·,σ)| = 1` almost everywhere in T_R, the
coarea identity for almost every level, and compatibility with restriction and measurable
weights. Extend a by zero after c(s) when integrating on a fixed parameter rectangle. Keep
the Jacobi equation only before the cut time; the zero extension need not satisfy it.

**Checks.**

- Disk of radius ρ with `ℓ > R > ρ`: `πρ² = 2πρ · ρ/2`; with `R < ρ` both sides equal
  `2πρR − πR²`. With `ρ = 1`, `ℓ = 2`: `R = 3/2` gives `π` on both sides and `R = 1/2` gives
  `3π/4`.
- Rectangle `[0,a] × [0,b]` with `R < b`: both sides equal `aR`, and `|grad d| = |∂_y y| = 1`.
- Northern hemisphere over the equator with `ℓ ≥ π/2` and `R < π/2`:
  `Area = ∫₀^(2π) ∫₀^R cos t dt ds = 2π sin R`, the area of the zone of height `sin R`.

*Needs:* 2.1; DifferentialGeometry 12.4; GeometricMeasureTheory G2.

### Examples

- Negative control for the side conditions: the trapezoid with σ the base `[0,4]` on the
  x-axis and the side from `(0,0)` to `(−1,1)`, so that the interior angle at `(0,0)` is
  `135°`. For `R ≤ 1` the points of the domain with `x < 0` within distance R of σ have their
  nearest point at the endpoint `(0,0)` and form a sector of angle `π/4`, of area `πR²/8`,
  which the normal parametrization misses.
- Negative control for the cut time: on the disk of radius ρ with `ℓ > R > ρ`, extending
  the Jacobi equation past `t = ρ` would give `a = 1 − t/ρ < 0`, while the zero extension
  gives the correct area.

### Dependencies

Layer 1's strips and distance to an arc; R6's focal nullity and shortening variation;
R4.2's moving-endpoint variation; Mathlib's Rademacher theorem; DifferentialGeometry 10.2
and 12.4; GeometricMeasureTheory G2. No Gauss–Bonnet input.

## Layer 3 (S3): Gauss–Bonnet for disks with corners

### 3.1 The turning theorem with corners

Let γ be a positively oriented piecewise `C²` planar Jordan curve, unit speed, with finitely
many corners of signed exterior angles αᵢ ∈ (−π, π), no cusps, and integrable signed
curvature k on the smooth pieces. At each corner, insert into the unit tangent the arc of
the unit circle through the signed exterior angle αᵢ. The resulting completed tangent loop
`T̂` is continuous, and

`2π deg(T̂) = ∫ k ds + Σᵢ αᵢ`, `deg(T̂) = 1`

(do Carmo, *Curves and Surfaces*, §4-5, theorem of turning tangents for piecewise regular
curves, from p. 264, proved in §5-7; Lee, 2nd ed., "Some Plane Geometry",
rotation index theorem, pp. 263–270). Consume R4.9.6a's smooth theorem: its tangent-angle
lift on intervals, its degree/turning-integral identity and its Jordan orientation
comparison giving degree `+1`. Construct the tangent-angle lift across the inserted arcs and
prove the degree identity for the completed loop, then reduce the degree to the smooth case
by rounding the corners with a `C¹` approximation whose total turning converges. Unsigned
Fenchel is a different theorem. Lean name:
`integral_signedCurvature_add_sum_exteriorAngle_eq_two_pi`.

**API.**

- The completed tangent loop `T̂ : ℝ/Lℤ → S¹` is continuous, agrees with the unit tangent
  off the corners, and traverses the inserted arc of angle αᵢ at the corner `sᵢ`.
- The tangent-angle lift `θ̂` of `T̂` is continuous on `[0, L]` with `θ̂(L) − θ̂(0) = 2π deg(T̂)`,
  equals `∫ k ds` on each smooth piece and jumps by αᵢ across the inserted arcs.
- Invariance of `deg(T̂)` under orientation-preserving reparametrization, and `deg = −1` for
  the reversed curve.

**Checks.**

- Circle traversed counterclockwise: `∫ k = 2π`, no corners, `deg = 1`; clockwise: `−2π` and
  `deg = −1`, excluded by positive orientation.
- Unit square: `k = 0`, four corners with `α = π/2`, `Σα = 2π`, `deg = 1`.
- Boundary of the L-shaped domain: `k = 0`, five corners with `α = π/2` and one with
  `α = −π/2`, `Σα = 2π`.
- Figure eight: not a Jordan curve, total turning `0`.

*Needs:* R4.9.6a, with its orientation comparison; `TauCeti.Contour.windingNumber`;
ConformalMapping L5 for the Jordan separation.

### 3.2 Gauss–Bonnet for disks with corners

Let D be a compact domain in an oriented smooth Riemannian surface, homeomorphic to a closed
disk. Its embedded boundary consists of finitely many regular smooth arcs with nonzero
one-sided tangents and signed exterior corner angles αᵢ as in the conventions, reflex
corners included and cusps excluded. Orient the boundary with D on its left, and define k_g
with respect to the inward conormal. Prove

`∫_D K dμ + ∫_(∂D) k_g ds + Σᵢ αᵢ = 2π`

(do Carmo, *Curves and Surfaces*, §4-5, local Gauss–Bonnet theorem, from p. 264; Lee, 2nd
ed., "The Gauss–Bonnet Formula", pp. 271–275). In the statement, the boundary is a piecewise
`C²` unit-speed Jordan curve c with corners at a finite set T of parameters and integrable k_g
on the smooth pieces, D lies on its left in the sense of the conventions,
`k_g = ⟨D_t c′, J c′⟩`, and the exterior angle at a corner is the oriented angle from the left
to the right one-sided tangent, cusps excluded. Include the
smooth-boundary and geodesic-polygon cases. Prove the comparison of the boundary integral
with the local connection form of an oriented orthonormal frame, `k_g ds = dθ + ω(T) ds` in
the conventions, and use Stokes with corners and 3.1 to obtain the intrinsic formula. Lean
name: `integral_curvature_add_integral_geodesicCurvature_add_sum_exteriorAngle_eq_two_pi`.

**API.**

- Cancellation along a common boundary arc of two adjacent disks, with the corresponding
  endpoint-angle terms: at a point where the common arc meets the outer boundary, the
  interior angles add, so the two exterior angles sum to the exterior angle of the union
  plus π.
- The restriction and orientation-reversal laws for these domains.
- The frame-independence of `∫_(∂D) (dθ + ω)` on the disk, with `dω = −K dA`.

**Checks.**

- Unit disk: `0 + 2π + 0 = 2π`. Hemisphere of the unit sphere: `2π + 0 + 0 = 2π`.
- Octant triangle of the unit sphere, three right angles: `π/2 + 0 + 3 · π/2 = 2π`.
- L-shaped planar domain, `K = 0` and `k_g = 0`: five corners with `α = π/2` and one with
  `α = −π/2`, `Σα = 2π`; unsigned exterior angles would give `3π`, so the sign convention is
  load-bearing.
- Spherical lune of angle β: `2β + 0 + 2(π − β) = 2π`.
- Rectangle `[0,2] × [0,1]` split along `x = 1`: at `(1,0)` each unit square has exterior
  angle `π/2` and the rectangle has no corner, so `π/2 + π/2 = 0 + π`. The two disk formulas
  sum to `4π`, the two meeting points carry `π` each, and the rectangle gets `4π − 2π = 2π`.
- Negative control for the conormal: with the outward conormal the unit disk gives
  `−2π ≠ 2π`.

*Needs:* 3.1; DifferentialGeometry 5.3–5.5 and 12.4; R1's curvature of a surface;
`TauCeti.Manifold.Orientation`, `Orientation.rightAngleRotation`, `Orientation.oangle`.

### Examples

- Round annulus `1 < r < 2` in the plane, as a Check of PositiveMass §3.1 against this
  layer: cut along the radial arcs `θ = 0` and `θ = π` into two half-annuli, each a disk with
  four right-angle corners. Each half gives `0 + (π − π) + 4 · π/2 = 2π`. Gluing, the two
  radial arcs cancel, and each of the four meeting points carries `π` by the common-arc law,
  so the annulus gets `2 · 2π − 4π = 0`, which is `2πχ`.
- The cap `{φ ≤ φ₀}` of the unit sphere: `2π(1 − cos φ₀) + 2π sin φ₀ · cot φ₀ = 2π`, with
  the boundary term computed from the connection form in the conventions.

### Dependencies

R4.9.6a's smooth signed turning theorem and orientation comparison; DifferentialGeometry's
Stokes with corners and the density comparison; ConformalMapping L5 for the Jordan
separation; R1's curvature.
Independent of Layers 1–2 and of every completeness or curvature-sign hypothesis.

## Layer 4 (S4): normal balls in nonpositive curvature

### 4.1 Disk filling in a chart

Let B be an open subset of a smooth surface that is simply connected and lies in the source
of one chart of the maximal atlas, as it does for a planar domain and for a disk
parametrized by one chart; by ConformalMapping L3 this is the same as B being diffeomorphic
to the open unit disk. Let c be a simple closed curve in B: continuous, L-periodic and
injective on a period. Prove that c bounds a compact disk `D ⊆ B`: D is compact, its frontier
is the trace of c, and D is homeomorphic to the closed unit disk. When c is piecewise `C¹`
with corners of signed exterior angles in `(−π, π)`, D has the corner regularity of Layer 3.
Lean name: `exists_disk_of_simpleClosedCurve`.

Fix a linear isomorphism of the two-dimensional model space with ℂ, so that the chart
carries B onto a nonempty open simply connected `Ω ⊆ ℂ` and c onto a planar Jordan curve ĉ
with trace in Ω. For `a ∉ Ω`, the function `z ↦ z − a` is continuous and nonvanishing on Ω,
so by `Complex.exists_continuousOn_eqOn_exp_comp` it has a continuous logarithm on Ω, hence
on the trace of ĉ, and `hasContinuousLogOn_sub_iff_notMem_filledHull` gives
`a ∉ filledHull ĉ`. Therefore `filledHull ĉ ⊆ Ω`. By ConformalMapping L5, ĉ has exactly two
complementary components, the filled hull is the closure of the bounded one with frontier ĉ,
and L5's closed-disc correspondence identifies it with a closed disk. Pulling back by the
chart gives D (Lee, 2nd ed., "Some Plane Geometry", pp. 263–270, states the Jordan curve
theorem for curved polygons). No index value and no regularity of c enter.

**Checks.**

- A circle in the unit-disk chart bounds the corresponding disk.
- The core circle of an annulus chart is not null-homotopic and is excluded by the
  hypothesis on B: for a the hole, `z ↦ z − a` has no continuous logarithm on the circle, and
  the hole lies in its filled hull but outside Ω.
- A geodesic triangle in the Poincaré disk bounds the solid hyperbolic triangle, whose area
  is `π − (β₁ + β₂ + β₃)` by 3.2: with three angles `π/4`, `−A + 3 · 3π/4 = 2π` gives
  `A = π/4`.

*Needs:* ConformalMapping L3, L5; `Complex.exists_continuousOn_eqOn_exp_comp`;
`TauCeti.HasContinuousLogOn`, `hasContinuousLogOn_sub_iff_notMem_filledHull`,
`TauCeti.IsJordanCurve`, `TauCeti.filledHull`; `SimplyConnectedSpace`, `IsSimplyConnected`.

### 4.2 Normal balls under `K ≤ 0`

Let `R > 0`, and let the closed intrinsic R-ball about p be compact, with `K ≤ 0` on the open
R-ball and the open R-ball satisfying 4.1's hypothesis. Prove that `exp_p` maps the tangent
R-ball diffeomorphically onto the open ball, with radial length equal to distance (do Carmo,
*Riemannian Geometry*, Chapter 7, Theorem 3.1 and Lemma 3.3, and Lee, 2nd ed., Theorem
12.8, Cartan–Hadamard, in "Manifolds of Nonpositive Curvature", pp. 352–360, for the
complete case). Use compact continuation for existence of minimizing segments and
`not_isConjugateOn_of_sectionalCurvature_nonpos` to exclude conjugate points, so that
`exp_p` is a local diffeomorphism on the tangent R-ball with `|d(exp_p)_v w| ≥ |w|`. In
particular every `r < R` satisfies 1.1's normal-ball hypotheses. No complete surface is
assumed. Lean name: `riemannianExp_bijOn_ball_of_curvature_nonpos`.

Exclude a failure of injectivity through an explicit disk. From two distinct tangent vectors
with the same image, or from a self-intersecting radial geodesic, extract a simple geodesic
bigon or a simple geodesic loop with one corner, made of radial geodesic arcs of length less
than R, so contained in the open ball. Uniqueness of geodesics puts its interior angles in
`(0, 2π)`. By 4.1 it bounds an embedded compact disk D in the open ball with Layer 3's
corner regularity, and 3.2 gives `∫_D K dμ = β₁ + β₂` for a bigon with interior angles β₁,
β₂ and `∫_D K dμ = π + β` for a loop with interior angle β. Both are positive, contradicting
`K ≤ 0`.

**Checks.**

- Euclidean plane and hyperbolic plane: every ball is a normal ball, with the identity and
  the Poincaré-disk charts, which lie in the maximal atlas.
- Bigon and loop identities: a lune of angle β on the unit sphere has area `2β = β + β`;
  the equator as a loop at a point with `β = π` has area `2π = π + π`. Both are positive, so
  neither occurs under `K ≤ 0`.
- The conclusion for `r < R` gives 1.1's hypotheses with `R` replaced by `r`, so 1.4's
  formulas hold on every such ball with `L(r) ≥ 2πr` and `V(r) ≥ πr²`.

*Needs:* 4.1, 3.2; HopfRinow's local minimizing geodesics and compact continuation;
`not_isConjugateOn_of_sectionalCurvature_nonpos`,
`norm_le_norm_mfderiv_riemannianExp_of_sectionalCurvature_nonpos`.

### Examples

- Negative control for simple connectivity: the flat cylinder of circumference `2π` with
  `R = 4`; the open ball contains a meridian circle, `exp_p(0,π) = exp_p(0,−π)`, and the
  conclusion fails.
- Negative control for the curvature sign alone: the oblate spheroid of equatorial radius
  `1` and small polar radius, p on the equator, q its antipode on the equator, and R slightly
  below `d(p,q)`, which is the largest distance from p. The open ball is the spheroid minus a
  disk around q, so it is simply connected and lies in one chart, and the closed ball is
  compact. A point of the equator near q is joined to p by two shortest paths, one across
  each face, exchanged by the reflection in the equatorial plane, so `exp_p` is not injective
  on the tangent R-ball. Here `K > 0` everywhere.
- Negative control for compactness of the closed ball alone: the slit plane
  `ℝ² ∖ {(x, 0) : x ≥ 1}` with `p = 0` and `R = 2`. The open ball is the disk of radius 2 minus
  the segment `[1, 2) × {0}`; it is star-shaped about p, so simply connected, and planar, so
  it lies in one chart, and `K = 0`. The closed ball is not compact, the radial geodesic in
  direction `(1, 0)` leaves the surface at `t = 1`, so the tangent ball is not in the domain
  of `exp_p` and the conclusion fails. Only the compactness hypothesis fails.

### Dependencies

Layer 3's disk formula; HopfRinow's geodesic continuation and minimizing segments; the
pinned nonpositive-curvature Jacobi lemmas; ConformalMapping L3 and L5, Mathlib's continuous
logarithm on simply connected planar sets and the pinned filled-hull criterion for disk
filling. Independent of Layers 1–2 and of R4.4.

## Layer 5 (S5): conformal invariance of the surface Dirichlet energy

### 5.1 Conformal rescaling

Let g be a smooth surface metric and `g̃ = f g` for a smooth positive f, for instance
`f = e^(2u)`. Prove, for every real φ,

`∫ |grad_(g̃) φ|_(g̃)² dμ_(g̃) = ∫ |grad_g φ|_g² dμ_g`.

Combine the pinned `inner_mgradient_rescale`, the gradient law `|dφ|²_(fg) = f⁻¹|dφ|²_g`, and
`integral_riemannianVolume_rescale`, the volume law `dμ_(fg) = f^(N/2) dμ_g`, on the
`WithMetric` carriers: the integrand factor is `f^(N/2) · f⁻¹ = 1` in dimension `N = 2`.
Neither side needs a regularity or support hypothesis on φ. Prove integrability of both
sides for `C¹` φ with compact support, and compatibility with restriction to an open
subdomain containing the support (Lee, 2nd ed., "Methods for Constructing Riemannian
Metrics", conformal metrics, pp. 15–25; the coordinate density `dV_g = (det g)^(1/2) |dx|` is
Lee and Parker, *The Yamabe problem*, p. 42, and since `det(fg) = f^N det g` it gives
`dμ_(fg) = f^(N/2) dμ_g`, which is the pinned `integral_riemannianVolume_rescale`). Lean name:
`integral_norm_mgradient_sq_rescale`, proved in `Suggested.lean` from the two pinned lemmas.

**Checks.**

- `ℝ²` with `f = e^(2x)`: `e^(2x) · e^(−2x) = 1`, equality of the two energies.
- Constant `f = 4`: `4 · 4⁻¹ = 1`.
- Negative control for dimension two: `ℝ³` with `f = e^(2x)` gives the factor `e^(x)` and the
  energies differ.
- Non-`C¹` φ: the pinned lemmas still give equality, so the identity needs no regularity.

*Needs:* `inner_mgradient_rescale`, `integral_riemannianVolume_rescale`.

### 5.2 Conformal diffeomorphisms

For a smooth diffeomorphism `Φ : M → N` of surfaces with `Φ*g_N = f g` for a smooth positive
f, define the energy `E_g(ψ) = ∫ |grad_g ψ|_g² dμ_g` and prove `E_g(φ ∘ Φ) = E_(g_N)(φ)` for
every real φ on N. The two surfaces are modelled on one model vector space E, possibly with
different model spaces H; this is the stated generality, and any pair of surfaces is brought
to it by transporting the structure of one along a linear isomorphism of the two-dimensional
model spaces. Form the pullback metric `ContMDiffRiemannianMetric.pullback`. By
`pullback_inner` the tangent maps of Φ preserve the inner products from `Φ*g_N` to `g_N`, so
Φ is an isometry `(M, Φ*g_N) → (N, g_N)`: `Homeomorph.measurePreserving_riemannianVolume`
gives the change of variables of the Riemannian volume, and DifferentialGeometry 12.2's chain
rule transports `grad_(g_N) φ` to `grad_(Φ*g_N)(φ ∘ Φ)`, so `E_(Φ*g_N)(φ ∘ Φ) = E_(g_N)(φ)`.
Then 5.1 gives `E_(Φ*g_N) = E_(fg) = E_g`. The Riemannian density permits
orientation-reversing Φ (Lee, 2nd ed., "Methods for Constructing Riemannian Metrics", pullback
metrics, pp. 15–25). Lean name: `integral_norm_mgradient_sq_comp_eq_of_pullback_eq_rescale`.

**API.**

- `E_g` is invariant under isometries, `E_(cg) = E_g` for constant `c > 0`, and
  `E_g(φ) = ∫ ⟨dφ, dφ⟩_g dμ_g` on the `WithMetric` carrier.
- Invariance under the conformal class: `E_(g′) = E_g` for every `g′ ∈ g.conformalClass`.
- Composition law: the conformal factor of `Φ ∘ Ψ` is `(f_Φ ∘ Ψ) · f_Ψ`, and the energy
  identity composes.

**Checks.**

- `Φ(z) = 2z` on ℂ: `∫ 4|∇φ(2z)|² dx dy = ∫ |∇φ|² dw`.
- `Φ(z) = z̄`, orientation-reversing with `f = 1`: equal energies.
- Stereographic projection from the unit sphere to the plane, with `f` the stereographic
  factor: the energy of a function on the sphere equals the planar energy of its
  stereographic transform.

*Needs:* 5.1; `ContMDiffRiemannianMetric.pullback` and `pullback_inner`;
`Homeomorph.measurePreserving_riemannianVolume`; DifferentialGeometry 12.2.

### Examples

- The Checks of 5.1 and 5.2, and a non-differentiable φ, for which the junk gradient `0`
  appears at the same points on both sides of 5.2.

### Dependencies

The two pinned conformal lemmas, the pullback metric, the pinned isometry invariance of the
Riemannian volume and DifferentialGeometry 12.2's chain rule. Independent of Layers 1–4.

## Downstream consumers

PositiveMass §3.1 consumes Layer 3's disk formula with corners, its boundary term against
local connection forms and its cancellation along common edges, and builds the
compact-surface theorem on them. No roadmap on main consumes this sub-roadmap;
RiemannianGeometry R1, R2, R3, R4.2, R4.9.6a and R6 supply it and take nothing back.

## References

- J. M. Lee, *Introduction to Riemannian Manifolds*, 2nd ed., Springer GTM 176 (2018):
  "Methods for Constructing Riemannian Metrics", pp. 15–25; "Tubular Neighborhoods and
  Fermi Coordinates", pp. 133–136; "Geodesics and Minimizing Curves", pp. 151–162, with
  Theorem 6.9 (Gauss lemma) and the first variation formula; "Some Plane Geometry",
  pp. 263–270, "The Gauss–Bonnet Formula", pp. 271–275; "Basic Computations with Jacobi
  Fields", pp. 287–296, "Cut Points", pp. 307–312; "Manifolds of Nonpositive Curvature",
  pp. 352–360, with Theorem 12.8 (Cartan–Hadamard). Page ranges are from the table of
  contents of the printed second edition.
- M. P. do Carmo, *Differential Geometry of Curves and Surfaces*, Prentice-Hall (1976):
  §4-5, from p. 264 (theorem of turning tangents with corners, local and global
  Gauss–Bonnet); §4-6, ending before p. 298 (exponential map, geodesic polar coordinates,
  `(√G)_ρρ + K√G = 0`); §5-7 (proof of the theorem of turning tangents). The two page
  numbers are from the printed table of contents.
- M. P. do Carmo, *Riemannian Geometry*, Birkhäuser (1992): Chapter 7, Theorem 3.1
  (Hadamard's theorem) and Lemma 3.3 (local isometries and coverings).
- I. Chavel, *Riemannian Geometry: A Modern Introduction*, 2nd ed., Cambridge University
  Press (2006): §III.1, geodesic spherical coordinates, p. 112; §III.2, conjugate and cut
  loci, p. 114; §III.6, Fermi coordinates, pp. 138–145. Pages are from the printed table of
  contents.
- D. B. A. Epstein, *Curves on 2-manifolds and isotopies*, Acta Math. 115 (1966), 83–107,
  Theorem 1.7: the disk-filling theorem on arbitrary surfaces, which Layer 4 does not own.
- J. M. Lee and T. H. Parker, *The Yamabe problem*, Bull. Amer. Math. Soc. 17 (1987), 37–91,
  p. 42: the coordinate expression of the Riemannian density.

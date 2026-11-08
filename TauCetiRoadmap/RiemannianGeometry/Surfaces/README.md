# Roadmap: local geometry of Riemannian surfaces

**Summary.** Develop the local intrinsic geometry of smooth Riemannian surfaces: polar
coordinates and normal strips with their Jacobians and the polar length and area formulas,
integration up to normal cut times on surface domains, Gauss–Bonnet for disks with corners
together with the turning theorem for curves with corners, normal balls in nonpositive
curvature without completeness, and conformal invariance of the surface Dirichlet energy.
Every statement is local: surface domains may have boundary and corners, and neither the
surface nor the interior of a surface with boundary is assumed complete.

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
- Layer 4: normal balls under `K ≤ 0` on a simply connected ball lying in one chart, with the
  disk filling of a null-homotopic geodesic bigon in a chart.
- Layer 5: conformal invariance of the surface Dirichlet energy, under a conformal rescaling
  and under a conformal diffeomorphism.

Boundaries with the parent and with other roadmaps:

- [R4.1](../README.md#r4-comparison-complete-manifolds-and-space-forms) and R4.6 own the
  cut-truncated polar domain and polar integration on complete manifolds in all dimensions.
  Layer 1 lives on metric normal balls of a surface, without completeness.
- [R6](../README.md#r6-focal-geometry-and-squared-distance-morse-functions) owns focal points
  of submanifolds, the measure-zero focal set and the shortening variation past an interior
  focal point; R4.2 owns first variation with a moving endpoint. Layer 2 consumes them.
- [R4.9.6a](../README.md#r496a-length-controlled-parametric-regularization) owns the signed
  planar turning theorem for smooth Jordan curves and the round-sphere disk and annulus
  identities. Layer 3 consumes the smooth turning theorem and owns only its extension to
  corners.
- PositiveMass §3.1 owns the Gauss–Bonnet theorem for compact surfaces with boundary and
  arbitrary Euler characteristic, with its triangulation and Euler identification and its
  exhaustion naturality. It consumes Layer 3's disk formula, boundary term and common-arc
  cancellation. Annuli are the case `χ = 0` of that theorem and are not restated here.
- R4.4 owns Cartan–Hadamard on complete manifolds. Layer 4 assumes no completeness. The
  theorem that a simple closed curve which is null-homotopic in an open surface bounds an
  embedded disk in it (Epstein, *Curves on 2-manifolds and isotopies*, Acta Math. 115 (1966),
  Theorem 1.7) rests on the classification of simply connected surfaces and is owned by no
  roadmap cited here; Layer 4 therefore takes the disk structure of the ball as a hypothesis
  and owns disk filling in a chart.
- [R1](../README.md#r1-intrinsic-curvature-calculus-and-normal-coordinate-jets) owns the
  conformal transformation laws of the connection and the curvature. Layer 5 is the
  integrated two-dimensional energy identity.

## Conventions

Work with finite-dimensional real, Hausdorff, second-countable smooth surfaces and smooth
positive-definite metrics, expressed through Mathlib's `ModelWithCorners`, `ChartedSpace`,
`IsManifold`, `RiemannianBundle`, `IsContMDiffRiemannianBundle` and `IsRiemannianManifold`.
Unlike the parent, surface domains may have boundary and corners, modelled on the half-plane
and the quadrant. Interior statements use boundaryless neighbourhoods; one-sided statements at
the boundary are stated where they occur. Impose orientation and compactness where stated.
Layer 3's domains are compact subsets of the interior of an ambient surface with piecewise
smooth boundary, and they may have reflex corners.

Curvature follows the parent: `R(X,Y)Z = ∇_X∇_Y Z − ∇_Y∇_X Z − ∇_[X,Y]Z`, and the Gaussian
curvature K of a surface is its sectional curvature, `+1` on the unit sphere. The scalar
Laplacian is DifferentialGeometry's `laplaceBeltrami`, `Δ = div grad`. Distances are intrinsic.
Use arclength whenever a geodesic parameter is identified with distance. All exponential
domains remain explicit.

**Corners.** At a corner of a piecewise smooth boundary the two one-sided unit tangents are
nonzero. The interior angle βᵢ ∈ (0, 2π) is the angle of the domain at the corner, measured
inside it, and the signed exterior angle is `αᵢ = π − βᵢ ∈ (−π, π)`. Convex corners have
`αᵢ > 0`, reflex corners `αᵢ < 0`, and cusps, `βᵢ ∈ {0, 2π}`, are excluded. For a positively
oriented planar curve with one-sided unit tangents `v⁻` and `v⁺` at a corner, `αᵢ` is the
argument of `v⁺/v⁻` in `(−π, π)`. A reflex corner is not a smoothly embedded quadrant with
the inherited metric. Treat it by subdividing into pieces with convex corners, using Layer 3's
cancellation along common arcs and of endpoint angles, or through DifferentialGeometry
5.6.3's Green identity for piecewise `C¹` cycles in charts, which needs no corner charts.

**Orientation and conormals.** Boundary components are oriented with the domain on the left,
and k_g is the signed geodesic curvature with respect to the inward conormal, so that the unit
circle bounding the unit disk has `k_g = 1`.

## Exact supplier contracts

### From Mathlib

- `ModelWithCorners`, `ChartedSpace`, `IsManifold`, `RiemannianBundle`,
  `IsContMDiffRiemannianBundle`, `IsRiemannianManifold`: the manifold and metric carriers.
- `LipschitzWith.ae_differentiableAt` (`Mathlib/Analysis/Calculus/Rademacher.lean`):
  Rademacher's theorem, used by Layer 2 for the distance to an arc in charts.
- `SimplyConnectedSpace`, `Complex.arg`, `intervalIntegral`, `HasDerivAt`, `derivWithin`:
  the carriers of the Layer 3 and Layer 4 statements.

### From Tau Ceti

Each item names its module under `TauCeti/`.

- `TauCeti.Manifold.IsGeodesicCurveOn` (`Geometry/Manifold/Riemannian/Geodesic/Basic.lean`);
  `expDomain`, `riemannianExp` (`…/Geodesic/Exponential.lean`); `IsNormalDomain`,
  `riemannianLog` (`…/Geodesic/Normal/Basic.lean`); the Gauss lemma
  `inner_mfderiv_riemannianExp_radial` (`…/Geodesic/Gauss/Basic.lean`); the pointwise polar
  inequality `abs_inner_le_norm_mul_norm_mfderiv_riemannianExp` and the radial distance bound
  `IsNormalDomain.ofReal_norm_riemannianLog_le_pathELength` (`…/Geodesic/Gauss/Polar.lean`);
  the energy first variation `hasDerivAt_energy` (`…/Riemannian/FirstVariation.lean`); the
  completeness theory of `…/Geodesic/HopfRinow.lean`. These are the Layers 0–4 of the
  completed [HopfRinow](../../../Completed/HopfRinow/README.md) roadmap.
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
- `TauCeti.Manifold.mgradient` (`Geometry/Manifold/Riemannian/Gradient/Basic.lean`) and
  `laplaceBeltrami` (`…/Riemannian/Laplacian.lean`).
- `TauCeti.riemannianVolume` (`…/Riemannian/VolumeDensity/Volume.lean`).
- `TauCeti.WithMetric`, `ContMDiffRiemannianMetric.rescale` and `conformalClass`
  (`…/Riemannian/WithMetric.lean`, `Geometry/Manifold/VectorBundle/Riemannian/Conformal.lean`);
  `TauCeti.WithMetric.inner_mgradient_rescale` (`…/Riemannian/Conformal.lean`) and
  `integral_riemannianVolume_rescale` (`…/Riemannian/VolumeDensity/Conformal.lean`), the
  pointwise and volume halves of Layer 5; `ContMDiffRiemannianMetric.pullback`
  (`…/Riemannian/Pullback/Basic.lean`).
- `TauCeti.Contour.windingNumber` (`Analysis/Contour/Winding/Number/Basic.lean`),
  `TauCeti.IsJordanCurve` (`Topology/JordanCurve/Basic.lean`) and `TauCeti.filledHull`
  (`Topology/FilledHull.lean`), the planar carriers of Layers 3 and 4.

### From TauCetiRoadmap

- RiemannianGeometry R2: geodesic variations and the differential of the exponential map
  as a Jacobi field, with the fixed-chart derivative lift. R4.2: first variation with a
  moving endpoint. R4.9.6a: the signed planar turning theorem for smooth Jordan curves, with
  its tangent-angle lift on intervals, the degree/turning-integral identity and the Jordan
  orientation comparison giving degree `+1`. R6: focal points of the normal exponential of
  an embedded curve, nullity of its focal set, and the shortening variation past an interior
  focal point.
- [DifferentialGeometry](../../DifferentialGeometry/README.md) 5.3–5.5: Stokes on manifolds
  with boundary and corners; 5.6.3: the winding-weighted Green identity for piecewise `C¹`
  cycles with `filledHull K ⊆ U` and winding number one inside; 10.2: manifold Sard;
  12.2–12.5: gradient, Hessian, Laplacian, the density/measure comparison and the divergence
  theorem.
- [GeometricMeasureTheory](../../GeometricMeasureTheory/README.md) G1: arclength of
  rectifiable curves; G2: the area and coarea formulas.
- [ConformalMapping](../../../Completed/ConformalMapping/README.md) L3: the Riemann mapping
  theorem; L5: the planar Jordan curve theorem, the filled-hull containment and separation
  API, and the Carathéodory closed-disc correspondence.

## How to read the build

Layer 1 builds the two Jacobians of a surface, polar and normal, from the Jacobi equation,
and derives the polar length and area formulas from `j_rr + Kj = 0`, `j_r(0) = 1` and
Fubini alone; they use no curvature sign and no Gauss–Bonnet input. Layer 2 integrates up
to the normal cut time on a domain, using Layer 1's strips, R6's focal theory and R4.2's
moving-endpoint variation. Layer 3 proves the disk Gauss–Bonnet formula with corners from
Stokes and local connection forms, independently of Layers 1–2, and extends R4.9.6a's
turning theorem to corners. Layer 4 uses Layer 3's disk formula and the planar disk filling
of DifferentialGeometry 5.6.3 and ConformalMapping L5 to exclude geodesic bigons and loops.
Layer 5 is independent of Layers 1–4.

## Layer 1: polar coordinates and normal strips

### 1.1 Polar density

Let p lie on a smooth Riemannian surface. Assume `R > 0` and that `exp_p` maps a tangent
ball of radius strictly larger than R diffeomorphically onto the metric ball of that radius,
with `d(p, exp_p v) = |v|`. Assume the closed metric R-ball is compact and lies in the
interior. Parametrize the unit tangent circle by angular arclength θ. For
`F(r,θ) = exp_p(r e(θ))`, construct the radial Jacobian
`j(r,θ) = |d(exp_p)_(r e(θ))(r e′(θ))|` and prove

`F*g = dr² + j(r,θ)² dθ²`,

`j_rr + (K ∘ F)j = 0`, `j(0,θ) = 0`, `j_r(0,θ) = 1`,

where the value and derivative at zero are the one-sided limits (do Carmo, *Differential
Geometry of Curves and Surfaces*, §4-6, geodesic polar coordinates; Lee, *Introduction to
Riemannian Manifolds*, 2nd ed., Theorem 6.9 for the Gauss lemma and Chapter 10 for the
Jacobi field `d(exp_p)_(rv)(rw)`). Prove `j > 0` for `0 < r < R` and smoothness away from the
centre. Identify `j dr dθ` with the Riemannian area measure and `j dθ` with arclength on the
r-circle. Supply change of variables on angular charts, their agreement across the angular
seam, and differentiation under the integral for the circle lengths and disk areas. These are
local metric-ball statements.

*Needs:* HopfRinow's Gauss lemma and radial distance; `isJacobiFieldOn_mfderiv_riemannianExp`
and R2's geodesic variations; DifferentialGeometry 12.4; GeometricMeasureTheory G1.

### 1.2 Normal strips

Let σ be a smooth embedded unit-speed arc in the surface interior, with a smooth unit normal
n within the surface. Use the normal exponential `F(s,t) = exp_(σ(s))(t n(s))`. On a regular
injective strip containing `t = 0`, define signed geodesic curvature by `∇_(σ′)σ′ = k_g n`.
Construct a positive scalar a and prove

`F*g = dt² + a(s,t)² ds²`,

`a_tt + (K ∘ F)a = 0`, `a(s,0) = 1`, `a_t(s,0) = −k_g(s)`

(Chavel, *Riemannian Geometry: A Modern Introduction*, 2nd ed., Chapter III, Fermi
coordinates along a submanifold; Lee, 2nd ed., Chapter 10, normal exponential map).
Identify `a ds dt` with area and `a ds` with the arclength of a parallel arc. For a fixed
compact parameter interval `[s₀,s₁]`, prove `L(t) = ∫_[s₀,s₁] a(s,t) ds`,
`L′(t) = ∫_[s₀,s₁] a_t(s,t) ds`, and `Area(F([s₀,s₁] × [0,t])) = ∫₀ᵗ L(τ) dτ` for
nonnegative t in the strip. Prove restriction to subarcs and compatibility with changing
the chosen normal.

For an arc of the boundary of the surface, take n inward and `t ≥ 0`, with metric and arc
smooth up to the boundary and right derivatives at zero. Construct a smooth local extension
in boundary charts, restrict the formulas, and prove independence of the extension. A
global extension or completeness hypothesis is not an input.

*Needs:* `SmoothEmbedding.normalExp` and its tube; R2's Jacobi fields; DifferentialGeometry
12.4; GeometricMeasureTheory G1.

### 1.3 Distance to an arc

Prove that a nonconstant segment realizing the distance from a point to a smooth arc, with
its initial footpoint in the arc interior, has initial velocity orthogonal to the arc, from
R4.2's first variation with a moving endpoint (Lee, 2nd ed., Chapter 6, first variation
formula). On a sufficiently small tube of a compact subarc, identify `t ≥ 0` with distance
to that subarc when the nearest point is interior. Retain the minimizing,
boundary-separation, regularity and injectivity hypotheses when extending the strip. The
formulas do not extend across a focal point or a competing nearest-point branch.

*Needs:* 1.2; R4.2; HopfRinow's local minimizing geodesics.

### 1.4 Polar length and area

For the polar disks of 1.1, put `L(r) = Length(∂B_r(p)) = ∫₀^(2π) j(r,θ) dθ` and
`V(r) = Area(B_r(p))`. Prove

`L′(r) = 2π − ∫_(B_r(p)) K dμ`, `V′(r) = L(r)`, `L(0) = V(0) = 0`,

where the values at zero are the continuous extensions: integrate `j_rr = −Kj` in r from
the initial condition `j_r(0,θ) = 1` and use Fubini on `j dr dθ` (Chavel, 2nd ed., Chapter
III, §III.1 geodesic spherical coordinates; do Carmo, *Curves and Surfaces*, §4-6).
Integrate to obtain

`L(r) − 2πr = −∫₀ʳ ∫_(B_ρ(p)) K dμ dρ`,

`V(r) − πr² = −∫₀ʳ ∫₀ᵗ ∫_(B_ρ(p)) K dμ dρ dt`.

Keep 1.1's metric normal-ball hypotheses. No curvature sign and no global cut-locus
nullity theorem is a prerequisite.

*Needs:* 1.1.

### Examples

- Euclidean plane: `j(r,θ) = r`, `L(r) = 2πr`, `V(r) = πr²`; `k_g = 0` and `a = 1` for strips
  about a straight line.
- Unit sphere: `j = sin r`, `L = 2π sin r`, `L′ = 2π cos r = 2π − 2π(1 − cos r)` with
  `V(r) = 2π(1 − cos r)`, and `V′ = 2π sin r = L`. Hyperbolic plane: `j = sinh r`,
  `L′ = 2π cosh r = 2π + 2π(cosh r − 1)`.
- Negative control for the Jacobi equation: `j = r` on the unit sphere gives
  `j_rr + j = r ≠ 0`.
- Latitude circle of the unit sphere at polar angle `φ₀`, inward normal: `k_g = cot φ₀`,
  `a(s,t) = sin(φ₀ − t)/sin φ₀`, so `a_t(s,0) = −cot φ₀ = −k_g`. Equator: `a = cos t`,
  `k_g = 0`.
- Plane circle of radius ρ, inward normal: `k_g = 1/ρ`, `a(s,t) = 1 − t/ρ` before `t = ρ`;
  outward normal: `k_g = −1/ρ`, `a = 1 + t/ρ`.
- Interior footpoint in 1.3: for the x-axis segment `[0,1]` and the point `(1,2)` the foot
  `(1,0)` is interior and the segment is orthogonal; for `(2,1)` the foot is the endpoint
  `(1,0)` and the segment is not orthogonal, so the interior hypothesis is load-bearing.

### Dependencies

HopfRinow's exponential map, Gauss lemma and local minimizing geodesics; R2's Jacobi
fields; R4.2's moving-endpoint first variation; the tubular neighbourhood of an embedded
arc; DifferentialGeometry 12.4 and GeometricMeasureTheory G1 for the identification of
densities with area and arclength. No curvature sign, no Gauss–Bonnet and no completeness
input.

## Layer 2: integration up to normal cut times

### 2.1 Cut time and normal coverage

Let D be a compact Riemannian surface domain with piecewise smooth boundary and σ a smooth
boundary circle or compact boundary arc. In the arc case, assume its adjacent boundary sides
γ₁, γ₂ are unit-speed geodesics meeting σ at interior angles π/2, with `d_D(σ,γᵢ(t)) = t`
for `0 ≤ t ≤ ℓ`. Assume all remaining boundary is at distance at least ℓ from σ, and fix
`0 < R < ℓ`. Put `T_R = {x ∈ D : 0 < d_D(x,σ) < R}`. Use intrinsic distances in D.

For an interior footpoint s of σ, follow the inward normal exponential `F(s,t)` of 1.2.
Define c(s), capped at ℓ, as the supremum of times up to which the normal segment stays in D
and realizes distance to σ. Prove `0 < c(s) ≤ ℓ`, measurability of c, positivity of the
Jacobian a before c(s), and unique regular normal parametrization of T_R outside an
area-null set (Chavel, 2nd ed., Chapter III, cut locus; the point case is Lee, 2nd ed.,
Chapter 10, cut points). Apply R6's shortening variation: a focal point strictly before the
endpoint prevents minimization. Prove that the stated side conditions exclude interior
regions reached by minimizers ending at the endpoints of the arc; do not discard such
regions without this argument. Apply R6's nullity of the focal set to the normal exponential
of σ, and prove nullity of the set of points with competing minimizing normals, using
Rademacher's theorem for the distance in charts.

*Needs:* 1.2, 1.3; R6; R4.2; `LipschitzWith.ae_differentiableAt`; DifferentialGeometry 10.2.

### 2.2 Integration formula and coarea

For every nonnegative measurable f, prove

`∫_(T_R) f dμ = ∫_σ ∫₀^min(R,c(s)) f(F(s,t)) a(s,t) dt ds`

(Chavel, 2nd ed., Chapter III, integration in Fermi coordinates up to the cut locus). Prove
`|grad d_D(·,σ)| = 1` almost everywhere in T_R, the coarea identity for almost every level,
and compatibility with restriction and measurable weights. Extend a by zero after c(s) when
integrating on a fixed parameter rectangle. Keep the Jacobi equation only before the cut
time; the zero extension need not satisfy it.

*Needs:* 2.1; DifferentialGeometry 12.4; GeometricMeasureTheory G2.

### Examples

- Disk of radius ρ in the plane, σ its boundary circle: `c ≡ ρ`; with `R > ρ` the formula
  gives `πρ² = 2πρ · ρ/2`, and with `R < ρ` both sides equal `2πρR − πR²`.
- Rectangle `[0,a] × [0,b]`, σ the bottom side with the two vertical sides as γ₁, γ₂:
  `ℓ = b`, and for `R < b` both sides equal `aR`; `|grad d| = |∂_y y| = 1`.
- Negative control for the side conditions: the 45° trapezoid with σ its long base and a
  slanted side, where a region of area `R²/2` has its nearest point at an endpoint of σ and
  is missed by the normal parametrization.
- Unit sphere, σ the equator, inward normal into the northern hemisphere: `c ≡ π/2`, and
  for `R < π/2` the formula gives `Area = 2π sin R`.

### Dependencies

Layer 1's strips and distance to an arc; R6's focal nullity and shortening variation;
R4.2's moving-endpoint variation; Mathlib's Rademacher theorem; DifferentialGeometry 10.2
and 12.4; GeometricMeasureTheory G2. No Gauss–Bonnet input.

## Layer 3: Gauss–Bonnet for disks with corners

### 3.1 The turning theorem with corners

Let γ be a positively oriented piecewise smooth planar Jordan curve, unit speed, with
finitely many corners of signed exterior angles αᵢ ∈ (−π, π) and no cusps. At each corner,
insert into the unit tangent the arc of the unit circle through the signed exterior angle
αᵢ. The resulting completed tangent loop `T̂` is continuous, and with k the signed curvature

`2π deg(T̂) = ∫ k ds + Σᵢ αᵢ`, `deg(T̂) = 1`

(do Carmo, *Curves and Surfaces*, §4-5, theorem of turning tangents, proved in §5-7;
Hopf's Umlaufsatz). Consume R4.9.6a's smooth theorem: its tangent-angle lift on intervals,
its degree/turning-integral identity and its Jordan orientation comparison giving degree
`+1`. Construct the tangent-angle lift across the inserted arcs and prove the degree
identity for the completed loop, then reduce the degree to the smooth case by rounding the
corners with a `C¹` approximation whose total turning converges. Unsigned Fenchel is a
different theorem.

*Needs:* R4.9.6a; `TauCeti.Contour.windingNumber`; ConformalMapping L5.

### 3.2 Gauss–Bonnet for disks with corners

Let D be a compact domain in an oriented smooth Riemannian surface, homeomorphic to a closed
disk. Its embedded boundary consists of finitely many regular smooth arcs with nonzero
one-sided tangents and signed exterior corner angles αᵢ as in the conventions, reflex
corners included and cusps excluded. Orient the boundary with D on its left, and define k_g
with respect to the inward conormal. Prove

`∫_D K dμ + ∫_(∂D) k_g ds + Σᵢ αᵢ = 2π`

(do Carmo, *Curves and Surfaces*, §4-5, local Gauss–Bonnet theorem; Lee, 2nd ed., Chapter
9, Gauss–Bonnet formula). Include the smooth-boundary and geodesic-polygon cases. Prove the
comparison of the boundary integral with the local connection form of an oriented
orthonormal frame, `k_g ds = dθ + ω`, and use Stokes with corners and 3.1 to obtain the
intrinsic formula. Prove cancellation along a common boundary arc of two adjacent disks,
with the corresponding endpoint-angle terms, and the restriction, orientation-reversal and
disk-difference laws for these domains.

*Needs:* 3.1; DifferentialGeometry 5.3–5.5, 5.6.3 and 12.4; R1's curvature of a surface.

### Examples

- Unit disk: `0 + 2π + 0 = 2π`. Hemisphere of the unit sphere: `2π + 0 + 0 = 2π`.
- Octant triangle of the unit sphere, three right angles: `π/2 + 0 + 3 · π/2 = 2π`.
- L-shaped planar domain, `K = 0` and `k_g = 0`: five corners with `α = π/2` and one with
  `α = −π/2`, `Σα = 2π`; unsigned exterior angles would give `3π`, so the sign convention is
  load-bearing.
- Negative control for the conormal: with the outward conormal the unit disk gives
  `−2π ≠ 2π`.
- Turning theorem: the circle traversed counterclockwise gives `2π` and degree `1`,
  clockwise `−2π`; a square has `∫k = 0` and `Σα = 2π`; a figure eight is not a Jordan curve
  and has total turning `0`.
- Round annulus `1 < r < 2` in the plane as a Check of PositiveMass §3.1 against this layer:
  cutting along a radial arc gives a disk with four right-angle corners, the two copies of
  the arc cancel, and the outer and inner boundaries contribute `2π − 2π = 0`.

### Dependencies

R4.9.6a's smooth signed turning theorem; DifferentialGeometry's Stokes with corners, the
winding-weighted Green identity and the density comparison; ConformalMapping L5 for the
Jordan orientation. Independent of Layers 1–2 and of every completeness or curvature-sign
hypothesis.

## Layer 4: normal balls in nonpositive curvature

### 4.1 Disk filling in a chart

Let B be an open subset of a smooth surface that is simply connected and lies in the domain
of a single chart into ℝ², as it does for a planar domain or for a disk parametrized by one
chart; by ConformalMapping L3 this is the same as B being diffeomorphic to the open unit
disk. Let c be a simple closed piecewise `C¹` curve in B with corners of signed exterior
angles in `(−π, π)`. Prove that c bounds a compact embedded disk `D ⊆ B` with the corner
regularity of Layer 3: the chart image of c is a planar Jordan curve, null-homotopic in the
image Ω of B, so its winding number vanishes outside Ω; DifferentialGeometry 5.6.3 gives
`filledHull ⊆ Ω` with winding number one inside, ConformalMapping L5 identifies the filled
hull with a closed disk whose frontier is the curve, and pulling back by the chart gives D.

*Needs:* DifferentialGeometry 5.6.3; ConformalMapping L3, L5; `TauCeti.filledHull`.

### 4.2 Normal balls under `K ≤ 0`

Let `R > 0`, and let the closed intrinsic R-ball about p be compact and contained in the
surface interior, with `K ≤ 0` on the open R-ball. Assume the open R-ball satisfies 4.1's
hypothesis. Prove that `exp_p` maps the tangent R-ball diffeomorphically onto the open ball,
with radial length equal to distance (do Carmo, *Riemannian Geometry*, Chapter 7, Theorem
3.1 and Lee, 2nd ed., Theorem 12.8 for the complete case). Use compact continuation for
existence of minimizing segments and `not_isConjugateOn_of_sectionalCurvature_nonpos` to
exclude conjugate points, so that `exp_p` is a local diffeomorphism on the tangent R-ball
with `|d(exp_p)_v w| ≥ |w|`. In particular every `r < R` satisfies 1.1's normal-ball
hypotheses with a larger-radius margin. No complete interior is assumed.

Exclude a failure of injectivity through an explicit disk. From two distinct tangent vectors
with the same image, or from a self-intersecting radial geodesic, extract a simple geodesic
bigon or a simple geodesic loop with one corner, made of radial geodesic arcs of length less
than R, so contained in the open ball. Uniqueness of geodesics puts its interior angles in
`(0, 2π)`. By 4.1 it bounds an embedded compact disk D in the open ball with Layer 3's
corner regularity, and 3.2 gives `∫_D K dμ = β₁ + β₂` for a bigon with interior angles β₁,
β₂ and `∫_D K dμ = π + β` for a loop with interior angle β. Both are positive, contradicting
`K ≤ 0`.

*Needs:* 4.1, 3.2; HopfRinow's local minimizing geodesics and compact continuation;
`not_isConjugateOn_of_sectionalCurvature_nonpos`,
`norm_le_norm_mfderiv_riemannianExp_of_sectionalCurvature_nonpos`.

### Examples

- Euclidean plane and hyperbolic plane: every ball is a normal ball, and the chart
  hypothesis holds with the identity and the Poincaré disk charts.
- Negative control for simple connectivity: the flat cylinder of circumference `2π` with
  `R = 4`; the open ball contains a meridian circle, `exp_p(0,π) = exp_p(0,−π)`, and the
  conclusion fails.
- Negative control for the curvature sign: the unit sphere with `R = 4`, where injectivity
  fails at `|v| = π`.
- Bigon and loop identities: a lune of angle β on the unit sphere has area `2β = β + β`;
  the equator as a loop at a point with `β = π` has area `2π = π + π`. Both are positive, so
  neither occurs under `K ≤ 0`.

### Dependencies

Layer 3's disk formula; HopfRinow's geodesic continuation and minimizing segments; the
pinned nonpositive-curvature Jacobi lemmas; DifferentialGeometry 5.6.3 and ConformalMapping
L3, L5 for disk filling. Independent of Layers 1–2 and of R4.4.

## Layer 5: conformal invariance of the surface Dirichlet energy

### 5.1 Conformal rescaling

Let g be a smooth surface metric and `g̃ = f g` for a smooth positive f, for instance
`f = e^(2u)`. Prove, for every real φ,

`∫ |grad_(g̃) φ|_(g̃)² dμ_(g̃) = ∫ |grad_g φ|_g² dμ_g`.

Combine the pinned `inner_mgradient_rescale` and `integral_riemannianVolume_rescale` on the
`WithMetric` carriers: the integrand factor is `f^(N/2) · f⁻¹ = 1` in dimension `N = 2`.
Neither side needs a regularity or support hypothesis on φ. Prove integrability of both
sides for `C¹` φ with compact support in the interior, and compatibility with restriction to
an open subdomain containing the support (Lee, 2nd ed., Chapter 2, conformal metrics; the
pinned module cites Lee–Parker, *The Yamabe problem*, §2).

*Needs:* `inner_mgradient_rescale`, `integral_riemannianVolume_rescale`.

### 5.2 Conformal diffeomorphisms

For a smooth diffeomorphism `F : U → V` of surface domains with
`F*g_V = f g_U` for a smooth positive f, prove `E_(g_U)(φ ∘ F) = E_(g_V)(φ)` for every real
φ on V, where `E_g(ψ) = ∫ |grad_g ψ|_g² dμ_g`. Use the pullback metric
`ContMDiffRiemannianMetric.pullback`, the change of variables for diffeomorphisms of the
Riemannian volume, and 5.1. The Riemannian density permits orientation-reversing F.

*Needs:* 5.1; `ContMDiffRiemannianMetric.pullback`; DifferentialGeometry 12.4.

### Examples

- `ℝ²` with `u = x`: `e^(−2x) · e^(2x) = 1`, equality of the two energies.
- Negative control for dimension two: `ℝ³` with `u = x` gives the factor `e^(x)` and the
  energies differ.
- Non-`C¹` φ: the pinned lemmas still give equality, so the identity needs no regularity.
- `F(z) = 2z` on ℂ: `∫ 4|∇φ(2z)|² dx dy = ∫ |∇φ|² dw`.

### Dependencies

The two pinned conformal lemmas, the pullback metric and DifferentialGeometry 12.4.
Independent of Layers 1–4.

## Downstream consumers

PositiveMass §3.1 consumes Layer 3's disk formula with corners, its boundary term against
local connection forms and its cancellation along common edges, and builds the
compact-surface theorem on them. No roadmap on main consumes this sub-roadmap;
RiemannianGeometry R2, R4.2, R4.9.6a and R6 supply it and take nothing back.

## References

- J. M. Lee, *Introduction to Riemannian Manifolds*, 2nd ed., Springer GTM 176 (2018):
  Chapter 2 (conformal metrics), Theorem 6.9 (Gauss lemma) and the first variation formula
  of Chapter 6, Chapter 9 (rotation index theorem and Gauss–Bonnet formula), Chapter 10
  (Jacobi fields, the normal exponential map and cut points), Theorem 12.8 (Cartan–Hadamard).
- M. P. do Carmo, *Differential Geometry of Curves and Surfaces*, Prentice-Hall (1976):
  §4-5 (theorem of turning tangents with corners, local and global Gauss–Bonnet), §4-6
  (exponential map, geodesic polar coordinates, `(√G)_ρρ + K√G = 0`), §5-7 (proof of the
  theorem of turning tangents).
- M. P. do Carmo, *Riemannian Geometry*, Birkhäuser (1992): Chapter 7, Theorem 3.1
  (Hadamard's theorem) and Lemma 3.3 (local isometries and coverings).
- I. Chavel, *Riemannian Geometry: A Modern Introduction*, 2nd ed., Cambridge University
  Press (2006): Chapter III (geodesic spherical and Fermi coordinates, the cut locus, and
  integration in these coordinates).
- D. B. A. Epstein, *Curves on 2-manifolds and isotopies*, Acta Math. 115 (1966), 83–107,
  Theorem 1.7: the disk-filling theorem that Layer 4 does not own.
- J. M. Lee and T. H. Parker, *The Yamabe problem*, Bull. Amer. Math. Soc. 17 (1987), 37–91,
  §2: the conformal change of the gradient and the volume.

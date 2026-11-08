# Local geometry of Riemannian surfaces

Develop the local intrinsic geometry of smooth Riemannian surfaces: polar coordinates and
normal strips with their Jacobians, integration up to normal cut times on surface domains,
Gauss–Bonnet for disks and annuli with piecewise smooth boundary together with the signed
turning theorem, normal balls in nonpositive curvature, and conformal invariance of the
surface Dirichlet energy. Every statement is local: surface domains may have boundary and
corners, and neither the surface nor the interior of a surface with boundary is assumed
complete.

This sub-roadmap of [RiemannianGeometry](../README.md) is independently definitive. Its
boundaries with the parent are:

- S1's polar coordinates live on metric normal balls of a surface, without completeness.
  [R4.1](../README.md#r4-comparison-complete-manifolds-and-space-forms) and R4.6 own the
  cut-truncated polar domain and polar integration on complete manifolds in all dimensions.
- S2 owns the cut time, the normal coverage and the integration formula for the normal
  exponential of a curve in a surface domain.
  [R6](../README.md#r6-focal-geometry-and-squared-distance-morse-functions) owns focal points
  of submanifolds, the measure-zero focal set and the shortening variation past an interior
  focal point; R4.2 owns first variation with a moving endpoint.
- S3 owns Gauss–Bonnet for disks and annuli in an arbitrary oriented surface, the signed
  planar turning theorem, and their local boundary, corner and gluing interfaces: boundary
  terms against local connection forms, exterior corner angles, and cancellation along common
  boundary arcs. [R4.9.6a](../README.md#r496a-length-controlled-parametric-regularization)
  consumes both for domains in the round sphere. The general Gauss–Bonnet theorem for compact
  surfaces with boundary, with the triangulation and Euler-characteristic identification and
  the exhaustion applications, is not owned here: PositiveMass §3.1, proposed in
  [#956](https://github.com/TauCetiProject/TauCetiRoadmap/pull/956), owns it and consumes
  S3's local interfaces rather than rebuilding them.
- S4 is local and assumes no completeness. R4.4 owns Cartan–Hadamard on complete manifolds.
- S5 is the integrated two-dimensional energy identity.
  [R1](../README.md#r1-intrinsic-curvature-calculus-and-normal-coordinate-jets) owns the
  conformal transformation laws of the connection and the curvature.

## Conventions and suppliers

Work with finite-dimensional real, Hausdorff, second-countable smooth surfaces and smooth
positive-definite metrics, expressed through Mathlib's `ModelWithCorners`, `ChartedSpace`,
`IsManifold`, `RiemannianBundle`, `IsContMDiffRiemannianBundle` and `IsRiemannianManifold`.
Unlike the parent, surface domains may have boundary and corners, modelled on the half-plane
and the quadrant. Interior statements use boundaryless neighbourhoods; one-sided statements at
the boundary are stated where they occur. Impose orientation and compactness where stated.
S3's domains are instead compact subsets of the interior of an ambient surface with piecewise
smooth boundary, and they may have reflex corners. A reflex corner, such as the reentrant
corner of a planar L-shaped domain, is not a smoothly embedded quadrant with the inherited
metric. Treat it by subdividing into pieces with convex corners, using S3's cancellation along
common arcs and of endpoint angles, or through DifferentialGeometry 5.6.3's Green identity for
piecewise `C¹` cycles in charts, which needs no corner charts.

Curvature follows the parent: `R(X,Y)Z = ∇_X∇_Y Z − ∇_Y∇_X Z − ∇_[X,Y]Z`, and the Gaussian
curvature K of a surface is its sectional curvature, `+1` on the unit sphere. The scalar
Laplacian is DifferentialGeometry's `laplaceBeltrami`, `Δ = div grad`. Distances are intrinsic.
Use arclength whenever a geodesic parameter is identified with distance. All exponential
domains remain explicit.

Consume:

- [HopfRinow](../../../Completed/HopfRinow/README.md), Layers 0–4: the Levi-Civita connection,
  covariant differentiation along curves, geodesic flow, `TauCeti.Manifold.riemannianExp` and
  `riemannianLog` on their natural domains, `TauCeti.Manifold.IsNormalDomain`, the Gauss lemma,
  first variation and local minimizing geodesics.
- [RiemannianGeometry](../README.md) R2: Jacobi fields `TauCeti.Manifold.IsJacobiFieldOn`, with
  the equation `D_t²J + R(J,γ′)γ′ = 0`, geodesic variations and the differential of the
  exponential map; R4.2: first variation with a moving endpoint; R6: focal points of the
  normal exponential of an embedded curve, nullity of its focal set, and the shortening
  variation past an interior focal point.
- [GeometricTopology](../../GeometricTopology/README.md), Layer 1: the smooth normal bundle and
  normal exponential `SmoothEmbedding.normalExp` of an embedding, with its tubular
  neighbourhood.
- [DifferentialGeometry](../../DifferentialGeometry/README.md), Layers 5, 10 and 12:
  integration and Stokes, including manifolds with boundary and corners and 5.6.3's
  winding-weighted Green identity with filled-hull containment for piecewise `C¹` cycles,
  manifold Sard, gradient, Hessian, `laplaceBeltrami`, and the canonical density/measure
  comparison.
  [GeometricMeasureTheory](../../GeometricMeasureTheory/README.md), G1–G2: arclength,
  area and coarea, and almost-everywhere differentiability of Lipschitz functions in charts.
- [ConformalMapping](../../../Completed/ConformalMapping/README.md), L3/L5: the planar Jordan
  curve theorem and the closed-disc correspondence used by S3 and S4.
- R1's conformal rescaling of the gradient and of the Riemannian volume on the native
  `WithMetric` carriers, `TauCeti.WithMetric.inner_mgradient_rescale` and
  `integral_riemannianVolume_rescale`, used by S5.

## Milestones

### S1 — Polar coordinates and normal strips

1. **Polar density.** Let p lie on a smooth Riemannian surface. Assume `R > 0` and that
   `exp_p` maps a tangent ball of radius strictly larger than R diffeomorphically onto the
   metric ball of that radius, with `d(p, exp_p v) = |v|`. Assume the closed metric R-ball is
   compact and lies in the interior. Parametrize the unit tangent circle by angular arclength
   θ. For `F(r,θ) = exp_p(r e(θ))`, construct the radial Jacobian j and prove

   `F*g = dr² + j(r,θ)² dθ²`,

   `j_rr + (K ∘ F)j = 0`, `j(0,θ) = 0`, `j_r(0,θ) = 1`.

   Prove `j > 0` for `0 < r < R`, smoothness away from the centre, and the one-sided initial
   limits. Identify `j dr dθ` with the Riemannian area measure and `j dθ` with arclength on the
   r-circle. Supply change of variables on angular charts, their agreement across the angular
   seam, and differentiation under the integral for the circle lengths and disk areas. These
   are local metric-ball statements.

2. **Normal strips.** Let σ be a smooth embedded unit-speed arc in the surface interior, with a
   smooth unit normal n within the surface. Use the normal exponential
   `F(s,t) = exp_(σ(s))(t n(s))`. On a regular injective strip containing `t = 0`, define
   signed geodesic curvature by `∇_(σ′)σ′ = k_g n`. Construct a positive scalar a and prove

   `F*g = dt² + a(s,t)² ds²`,

   `a_tt + (K ∘ F)a = 0`, `a(s,0) = 1`, `a_t(s,0) = −k_g(s)`.

   Identify `a ds dt` with area and `a ds` with the arclength of a parallel arc. For a fixed
   compact parameter interval `[s₀,s₁]`, prove `L(t) = ∫_[s₀,s₁] a(s,t) ds`,
   `L′(t) = ∫_[s₀,s₁] a_t(s,t) ds`, and `Area(F([s₀,s₁] × [0,t])) = ∫₀ᵗ L(τ) dτ` for
   nonnegative t in the strip. Prove restriction to subarcs and compatibility with changing
   the chosen normal.

   For an arc of the boundary of the surface, take n inward and `t ≥ 0`, with metric and arc
   smooth up to the boundary and right derivatives at zero. Construct a smooth local extension
   in boundary charts, restrict the formulas, and prove independence of the extension. A
   global extension or completeness hypothesis is not an input.

3. **Distance to an arc.** Prove that a nonconstant segment realizing the distance from a
   point to a smooth arc, with its initial footpoint in the arc interior, has initial velocity
   orthogonal to the arc, from R4.2's first variation with a moving endpoint. On a
   sufficiently small tube of a compact subarc, identify `t ≥ 0` with distance to that subarc
   when the nearest point is interior. Retain the minimizing, boundary-separation, regularity
   and injectivity hypotheses when extending the strip. The formulas do not extend across a
   focal point or a competing nearest-point branch.

### S2 — Integration up to normal cut times

Let D be a compact Riemannian surface domain with piecewise smooth boundary and σ a smooth
boundary circle or compact boundary arc. In the arc case, assume its adjacent boundary sides
γ₁, γ₂ are unit-speed geodesics meeting σ at interior angles π/2, with `d_D(σ,γᵢ(t)) = t` for
`0 ≤ t ≤ ℓ`. Assume all remaining boundary is at distance at least ℓ from σ, and fix
`0 < R < ℓ`. Put `T_R = {x ∈ D : 0 < d_D(x,σ) < R}`. Use intrinsic distances in D.

For an interior footpoint s of σ, follow the inward normal exponential `F(s,t)` of S1. Define
c(s), capped at ℓ, as the supremum of times up to which the normal segment stays in D and
realizes distance to σ. Prove `0 < c(s) ≤ ℓ`, measurability of c, positivity of the Jacobian a
before c(s), and unique regular normal parametrization of T_R outside an area-null set. Apply
R6's shortening variation: a focal point strictly before the endpoint prevents minimization.
Prove that the stated side conditions exclude interior regions reached by minimizers ending at
the endpoints of the arc; do not discard such regions without this argument. Apply R6's
nullity of the focal set to the normal exponential of σ, and prove nullity of the set of points
with competing minimizing normals, using almost-everywhere differentiability of the distance
in charts. For every nonnegative measurable f, prove

`∫_(T_R) f dμ = ∫_σ ∫₀^min(R,c(s)) f(F(s,t)) a(s,t) dt ds`.

Prove `|grad d_D(·,σ)| = 1` almost everywhere in T_R, the coarea identity for almost every
level, and compatibility with restriction and measurable weights. Extend a by zero after c(s)
when integrating on a fixed parameter rectangle. Keep the Jacobi equation only before the cut
time; the zero extension need not satisfy it.

### S3 — Gauss–Bonnet for disks and annuli

Let D be a compact domain in an oriented smooth Riemannian surface, homeomorphic to a closed
disk or annulus. Its embedded boundary consists of finitely many regular smooth arcs with
nonzero one-sided tangents and well-defined signed exterior corner angles αᵢ, reflex corners
included. Orient each boundary component with D on its left, and define k_g with respect to
the inward conormal. Prove

`∫_D K dμ + ∫_(∂D) k_g ds + Σᵢ αᵢ = 2π χ(D)`,

with `χ(D) = 1` for a disk and `χ(D) = 0` for an annulus. Include the smooth-boundary and
geodesic-polygon cases. Prove the comparison of the boundary integral with the local
connection form, cancellation along a common boundary arc with the corresponding endpoint-angle
terms, and the signed turning theorem for a positively oriented smooth or piecewise smooth
planar Jordan curve. At each corner, insert into the unit tangent the arc of the unit circle
through the signed exterior angle αᵢ. The resulting completed tangent loop `T̂` is continuous,
and with k the signed curvature

`2π deg(T̂) = ∫ k ds + Σᵢ αᵢ`, `deg(T̂) = 1`.

Construct the tangent-angle lift on the smooth arcs and across the inserted arcs; unsigned
Fenchel is a different theorem. Use Stokes and local connection forms to obtain the intrinsic
formula. Give the restriction, orientation-reversal and disk-difference laws for these domains.

### S4 — Normal balls in nonpositive curvature

Let `R > 0`, and let the closed intrinsic R-ball about p be compact and contained in the surface
interior, with `K ≤ 0` on the open R-ball. Assume that open ball is simply connected and lies in
the domain of a single chart into ℝ², as it does when the surface is a planar domain or a disk
parametrized by one chart. Prove that `exp_p` maps the tangent R-ball diffeomorphically onto
the open ball, with radial length equal to distance. Use compact continuation for existence of
minimizing segments and the Jacobi equation to exclude conjugate points. In particular every
`r < R` satisfies S1's normal-ball hypotheses with a larger-radius margin. No complete interior
is assumed.

Exclude a failure of injectivity through an explicit disk. From two distinct tangent vectors
with the same image, or from a self-intersecting radial geodesic, extract a simple geodesic
bigon or a simple geodesic loop with one corner, made of radial geodesic arcs of length less
than R, so contained in the open ball. Uniqueness of geodesics puts its interior angles in
`(0, 2π)`. Its chart image is a planar piecewise `C¹` Jordan curve. It is null-homotopic in the
image Ω of the ball, because the ball is simply connected, so its winding number vanishes
outside Ω. DifferentialGeometry 5.6.3 then gives `filledHull ⊆ Ω`, with winding number one on
the inside, and ConformalMapping L5 identifies the filled hull with a closed disk whose
frontier is the curve. Pulling back by the chart gives an embedded compact disk D in the open
ball, bounded by the bigon or loop, with the corner regularity of S3. S3 gives
`∫_D K dμ = β₁ + β₂` for a bigon with interior angles β₁, β₂ and `∫_D K dμ = π + β` for a loop
with interior angle β. Both are positive, contradicting `K ≤ 0`. Without the chart hypothesis,
a disk-filling theorem for simple null-homotopic loops on surfaces would replace this step;
that theorem is not part of S4.

For the polar disks of S1, put `L(r) = Length(∂B_r(p))` and `V(r) = Area(B_r(p))`. Prove

`L′(r) = 2π − ∫_(B_r(p)) K dμ`, `V′(r) = L(r)`, `L(0) = V(0) = 0`,

where the values at zero are the continuous extensions. Integrate to obtain

`L(r) − 2πr = −∫₀ʳ ∫_(B_ρ(p)) K dμ dρ`,

`V(r) − πr² = −∫₀ʳ ∫₀ᵗ ∫_(B_ρ(p)) K dμ dρ dt`.

Keep S1's metric normal-ball hypotheses. No global cut-locus nullity theorem is a prerequisite.

### S5 — Conformal invariance of the surface Dirichlet energy

Let g be a smooth surface metric, u a smooth real function and φ a C¹ real function with
compact support in the interior of the domain. Put `g̃ = e^(2u)g`. Prove

`∫ |grad_(g̃) φ|_(g̃)² dμ_(g̃) = ∫ |grad_g φ|_g² dμ_g`.

Combine the conformal rescaling of the gradient and of the volume on their `WithMetric`
carriers; the factors `e^(−2u)` and `e^(2u)` cancel in dimension two. Prove integrability under
the compact-support hypothesis and compatibility with restriction to an open subdomain
containing the support.

For a smooth conformal diffeomorphism `F : U → V` of surface domains with
`F*g_V = e^(2u)g_U`, prove `E_(g_U)(φ ∘ F) = E_(g_V)(φ)` for compactly supported C¹ φ on V,
where `E_g(ψ) = ∫ |grad_g ψ|_g² dμ_g`. Use the change of variables for diffeomorphisms and the
comparison of pulled-back metrics.

## Order and validation

S1's polar formulas precede S4's length and area formulas; S1's strips and distance to an arc
precede S2. S3 uses Stokes and local connection forms independently of S1, and its disk formula
precedes S4's exclusion of geodesic bigons and loops, whose disks come from
DifferentialGeometry 5.6.3 and ConformalMapping L5. S5 is independent of S1–S4. R4.9.6a
consumes S3.

Validate the conventions on the Euclidean plane: `j(r,θ) = r`, `k_g = 0` and `a = 1` for strips
about a straight line, and equality of the two energies. For a plane circle of radius ρ with
inward normal, check `k_g = 1/ρ` and `a(s,t) = 1 − t/ρ` before `t = ρ`; its inward cut time is
ρ and the truncated area formula gives `πρ²`.

## References

- J. M. Lee, *Introduction to Riemannian Manifolds*, second edition, Springer, 2018: Chapter 2
  for conformal metrics, Chapter 6 for normal coordinates and distance, Chapter 9 for the
  rotation index theorem and Gauss–Bonnet, and Chapter 10 for Jacobi fields and the
  normal-exponential focal calculations.
- I. Chavel, *Riemannian Geometry: A Modern Introduction*, second edition, Cambridge
  University Press, 2006: Chapter III for cut loci and integration in polar and normal
  coordinates.

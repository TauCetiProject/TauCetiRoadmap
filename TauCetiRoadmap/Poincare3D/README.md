# Roadmap: Three-dimensional Poincaré through Ricci flow with surgery

**Summary.** Develop Ricci flow with surgery on closed orientable three-manifolds, its finite
extinction for simply connected initial manifolds, and reconstruction of the
initial manifold from the actual finite surgery history. The resulting library
proves the smooth and topological three-dimensional Poincaré theorems. Its reusable
outputs include reduced geometry, ancient-solution compactness, canonical
neighborhoods, metric surgery, loop-family filling width, and finite-history
topological reconstruction.

This document specifies the mathematics; [Suggested.lean](Suggested.lean) gives
selected target signatures.

## Scope and ownership

The endpoints concern compact Hausdorff manifolds without boundary, modeled on
`EuclideanSpace ℝ (Fin 3)`. The smooth conclusion is a `Diffeomorph` to
`Metric.sphere (0 : EuclideanSpace ℝ (Fin 4)) 1`; the topological conclusion is a
`Homeomorph` to that same sphere. Use `SimplyConnectedSpace`, including its
nonemptiness and path-connectedness consequences. Countability follows from
compactness and charts.

The flow and surgery development covers arbitrary closed orientable smooth
three-manifolds with a chosen normalized smooth metric. The extinction and
Poincaré conclusions specialize to simply connected initial manifolds. Local
analytic results retain their stated arbitrary-dimensional generality. The
global programme follows surgery flow through finite extinction and
reconstruction of the initial manifold.

The [GeometricTopology roadmap](../GeometricTopology/README.md), Layer 8, owns
geometric decomposition vocabulary and faithful statements of geometrization.
Its native statement is `TauCeti.GeometrizationConjecture`, in
`TauCeti/LowDimTopology/Geometrization.lean`; GeometricTopology supplies its
geometric-decomposition vocabulary and statement. This roadmap owns the Ricci-surgery and
finite-extinction proof programme for Poincaré described here;
Layer 15 supplies the topological endpoint named in GeometricTopology Layer 8.
GeometricTopology Layer 11 owns the dimension-three triangulation and
Hauptvermutung theorems; Layer 14 here owns dimension-three compatible smoothing.
Use the supplier's manifold, collar, gluing, connected-sum and PL carriers throughout.

## Exact supplier contracts

**From Mathlib.** Use `ChartedSpace`, `IsManifold`, `TangentBundle`,
`Bundle.ContMDiffRiemannianMetric`, `Diffeomorph`, `Homeomorph`, `Path`,
`ContinuousMap.HomotopyEquiv`, `HomotopyGroup.Pi`, singular homology, and the native
covering-space and measure/integration APIs. Compact charted manifolds obtain
second countability from `ChartedSpace.secondCountable_of_sigmaCompact`.

| Supplier | Exact material consumed | Material owned here |
| --- | --- | --- |
| [GeometricTopology](../GeometricTopology/README.md), Layers 1, 2, 7 and 11 and its smooth-implies-PL comparison | Smooth/PL manifolds, collars, gluing, connected sum with parameterized ball embeddings and the disc theorem, smooth triangulation, locally flat embeddings, geometric structures, realization, combinatorial/PL comparison and Moise's dimension-three triangulation/Hauptvermutung theorems | The three-dimensional neck/cap consequences, actual Ricci surgery and reconstruction, compatible PL-to-smooth existence and native atlas transport in Layer 14 |
| [AlgebraicTopology](../AlgebraicTopology/README.md), Stages 1–6 and 8 | van Kampen, finite CW comparison, homology/cohomology, integral manifold duality, Hurewicz, relative homotopy, higher-group comparison | Closed-three-manifold consequences, regular loop-family comparison, surgery ancestry and class transport |
| [DifferentialGeometry](../DifferentialGeometry/README.md), Layers 0–3, 5–10, 12 | Tensor/form calculus, orientations, smooth flows, Sard, integration/Stokes, metric density and scalar operators | Ricci-flow and moving-curve specializations |
| [HopfRinow](../../Completed/HopfRinow/README.md), Layers 0–4 | Levi-Civita connection, geodesic flow, normal balls, length and metric completeness | Time-dependent comparisons, reduced paths, complete pointed flow limits |
| [RiemannianGeometry](../RiemannianGeometry/README.md), R1–R5a and R7.0 | Tensor/curvature conventions, variations, Jacobi fields, comparison geometry, model metrics, immersion area calculus and scalar Bochner identity | Ricci-surgery estimates, branched sphere/filling analysis and curve shortening in a moving ambient three-manifold |
| [PDE](../PDE/README.md), Lanes A, C–F; [ComplexKahlerGeometry](../ComplexKahlerGeometry/README.md), K5a | Sobolev/weak compactness, elliptic/parabolic regularity, scalar maximum principles and real compact-bundle Sobolev/elliptic theory | The noncompact cap construction and moving-curve nonlinear problems, with their extra localization/compactness estimates |
| [RicciFlow](../RicciFlow/README.md), Layers 1–5 (R1–R5) | Metric variation, compact-bundle parabolic theory, DeTurck, compact-flow existence/uniqueness/continuation, global Shi estimates and curvature evolution/maximum principles on closed manifolds | Localized Shi estimates and their complete noncompact applications in Layer 2, Hamilton–Ivey and differential Harnack specializations, pointed compactness, reduced geometry, ancient solutions and all surgery/extinction targets below |

**From Tau Ceti.** Use `TauCeti.IsTriangulable` in
`TauCeti/Topology/Triangulable.lean` and the proposition
`TauCeti.TriangulationConjecture` in
`TauCeti/Topology/TriangulationConjecture.lean`. The dimension-three proof is
GeometricTopology Layer 11's target, supported by its
[Moise extract](../GeometricTopology/references/moise-triangulation-dim3.md).
Smooth triangulation is the smooth-implies-PL target of GeometricTopology's
smoothing-and-triangulation comparison, built from its chart-based PL and
combinatorial-manifold APIs in Layers 1 and 11; its
[Munkres extract](../GeometricTopology/references/munkres-smoothing-triangulations.md)
states Theorems 10.5 and 10.6.
Use `HomotopyGroup.pathLoopSpaceMulEquiv` from
`TauCeti/Topology/Homotopy/HomotopyGroup/LoopSpace.lean` for the based-loop shift.
Import the native covariant-derivative, curvature, geodesic and covering APIs
at their supplying layers.

Generic curve shortening of embedded curves on a smooth two-sphere belongs to
RiemannianGeometry R4.9. Layer 10 treats immersed loops and ramps in a
time-dependent ambient manifold and the family estimates needed for filling
width. Generic rectifiability and the area formula are consumed from
[GeometricMeasureTheory G1–G2](../GeometricMeasureTheory/README.md).
Layer 9 owns the harmonic-sphere, filling-area and regular-representative bridges
needed here.

## Conventions

For metrics, use the `RiemannianBundle` mechanism or metric-indexed type synonyms when induced norms
are needed. Keep instances for a selected metric local to its constructions.
Import the actual Tau Ceti covariant-derivative, curvature, geodesic and covering
APIs when using them.

Identify the chosen metric's Levi-Civita connection with the native connection
on differentiable vector fields, and prove the curvature evaluation, slot-order,
Ricci contraction and scalar-trace identities. Prove that the calibrated
intrinsic Hausdorff volume used for metric balls agrees with the native
Riemannian volume defined by chart densities. Use these identities in the
normalization, comparison and flow estimates.

Use the native metric, covariant-derivative and supplier model-geometry APIs.
Develop missing mathematics in Tau Ceti under the supplier targets specified
above, following Mathlib's interface conventions.

Use these conventions throughout, with proved translation lemmas for sources
using different normalizations.

- `∂ₜg = -2 Ric`. The curvature sign is
  `R(X,Y)Z = ∇X∇Y Z - ∇Y∇X Z - ∇[X,Y] Z`; the unit round `Sⁿ` has sectional
  curvature `1` and scalar curvature `n(n-1)`. The scalar heat operator is
  `Δ = div grad`, the negative of the nonnegative spectral Laplacian.
- The curvature operator acts on `Λ²TM`, with constant sectional curvature `k`
  giving `k Id`. Write its eigenvalues `λ ≥ μ ≥ ν`; scalar curvature is
  `R = 2(λ+μ+ν)`. Specify tensor norms and every conversion to operator norms.
- For `Q>0`, parabolic rescaling at `(x₀,t₀)` is
  `g_Q(s)=Q g(t₀+s/Q)`. Distances scale by `√Q`, curvature norms by `Q⁻¹`,
  their squares by `Q⁻²`, and volume by `Q^(n/2)`.
- Backward time is `τ=t₀-t`. For a path from `(x₀,t₀)` to `(q,t₀-τ)`,
  `L(γ)=∫₀^τ √s (R(γ(s),t₀-s)+|γ′(s)|²) ds`,
  `l(q,τ)=inf L/(2√τ)`, and
  `Ṽ(τ)=∫ (4πτ)^(-n/2) exp(-l(q,τ)) dμ_(t₀-τ)`.
  Euclidean static flow has `Ṽ=1`. Prove the conversion from the convention
  omitting `(4π)^(-n/2)`, whose Euclidean value is `(4π)^(n/2)`.
- An ordinary flow includes its actual carrier, time domain, metric family,
  spatial/time regularity and Ricci equation. A spacetime includes a smooth
  time function without critical points, a vector field `∂t` with `dt(∂t)=1`,
  a metric on `ker dt`, its horizontal connection and the Ricci equation.
  Completeness of slices and survival of worldlines are explicit properties.
- A closed manifold is compact and without boundary, with Hausdorff topology;
  impose connectedness and orientation where used. Empty surgery slices are
  represented by empty manifolds.
- An `ε`-neck at curvature scale `r` is, after rescaling by `r⁻²`,
  `C^⌊ε⁻¹⌋`-close by a specified embedding to the scalar-curvature-one round
  cylinder on `S²×(-ε⁻¹,ε⁻¹)`. A strong neck includes the rescaled interval
  `[-1,0]` and the evolving cylinder. Fix the norms in these model coordinates.
  An `ε`-cap is a ball or `RP³` minus a ball with such a neck end. Global
  compact positively curved components have a separate model clause.
- All estimates state their parameter dependencies and time intervals.
  Universal constants precede the solutions to which they apply. Distinguish
  pointwise-in-time curvature bounds from a single bound on an entire slab.
  Restriction, pullback, isometry, basepoint change, time translation and
  scaling laws belong to the API of every object for which they make sense.

## How to read the build

| Layer | Local predecessors | Principal output |
| --- | --- | --- |
| Layer 1 | none | Closed-three-manifold topology, models and metric normalization |
| Layer 2 | Layer 1 | Flow adapters, localized derivative estimates, pinching, Harnack and pointed compactness |
| Layer 3 | Layer 2 | Ordinary/spacetime reduced geometry and noncollapse |
| Layer 4 | Layer 2, Layer 3 | Ancient κ-solutions and shrinking asymptotic models |
| Layer 5 | Layer 4 | Canonical neighborhoods and singular-time geometry |
| Layer 6 | Layer 1, Layer 2, Layer 5 | Standard cap, actual metric surgery and local comparison |
| Layer 7 | Layer 3, Layer 5, Layer 6 | Global controlled surgery flow |
| Layer 8 | Layer 1, Layer 6, Layer 7 | Finite component ancestry and homotopy transport |
| Layer 9 | Layer 1 | Regular loop families, filling area and width |
| Layer 10 | Layer 2, Layer 9 | Corrected moving-curve/ramp estimates and family deformation |
| Layer 11 | Layer 7, Layer 8, Layer 9, Layer 10 | Width comparison and finite extinction |
| Layer 12 | Layer 1, Layer 6, Layer 7, Layer 8, Layer 11 | Reconstruction from finite actual surgery history |
| Layer 13 | Layer 1, Layer 6, Layer 12 | Classification of simply connected factors; smooth endpoint |
| Layer 14 | none | Dimension-three compatible smoothing and native atlas adapter |
| Layer 15 | Layer 13, Layer 14 | Topological endpoint and hypothesis transport |

Each row also consumes the exact external suppliers named above. The topology
and smoothing branches start from their algebraic-topology and PL suppliers;
Layer 14 consumes GeometricTopology Layer 11's compatible triangulation theorem
and builds the PL-to-smooth theorem.
The width branch can be built independently of surgery existence until Layer 11
joins them. Layer 6 defines local operations before Layer 7 proves they can be iterated,
and Layer 11 uses the flow constructed by Layer 7.

## Layer 1: Closed topology, models and normalization

### 1.1. Closed topology

Use the external gluing/finite-CW/duality suppliers to prove that a closed
simply connected smooth three-manifold is orientable and has
`H₀≅ℤ`, `H₁=H₂=0`, `H₃≅ℤ`, `π₂=0` and `π₃≅ℤ`. Include the comparison between
singular and cellular computations and their basepoint/naturality statements.
Hurewicz and Whitehead give a homotopy equivalence with the three-sphere.
Prove that an orientable three-manifold contains no embedded
two-sided projective plane, using its normal orientation and the induced
orientation on a two-sided hypersurface.

Sources: Hatcher, §1.2, Theorem 1.20 (van Kampen); §3.3, Theorem 3.30
(Poincaré duality); §4.1, Theorem 4.5, p. 346 (Whitehead); and §4.2,
Theorem 4.32 (Hurewicz).

**API.**

- Basepoint and orientation transport.
- Natural homology/homotopy comparisons.
- Induced maps of equivalences.

**Checks.**

- The round three-sphere has the displayed integral homology and higher homotopy groups.
- The Poincaré homology sphere satisfies the homology conclusion but fails simple connectedness.
- The sphere bundle over the circle has a nontrivial fundamental group.

*Needs:* GeometricTopology Layers 1 and 11; AlgebraicTopology Stages 1–6 and 8.

### 1.2. Round and quotient models

Construct the round three-sphere, its finite free isometric quotients, the round
cylinder, the ball cap and punctured `RP³` models in the existing smooth/gluing
vocabulary. Prove their smoothness, completeness where appropriate, curvature,
orientation and fundamental-group computations. Include the orientable
`S²`-bundle over `S¹`, its projection and nontrivial fundamental group; use the
bundle classification to identify the orientable total-space case.

Source: Morgan–Tian, Chapter 1 and the models in Definitions 9.72–9.78.

**API.**

- Isometry/diffeomorphism transport.
- Quotient projection and covering maps.
- Model curvature and orientation.

**Checks.**

- The unit three-sphere has scalar curvature 6.
- The antipodal quotient is projective three-space with fundamental group of order two.
- The orientable sphere bundle over the circle is the product bundle.

*Needs:* 1.1; GeometricTopology Layers 1, 2 and 7; RiemannianGeometry model metrics.

### 1.3. Normalized initial metrics

Construct a smooth metric on every closed smooth manifold using the supplier's
partition-of-unity API. For a closed three-manifold, prove that a constant
rescaling produces a metric with `|Rm|≤1`, curvature-operator minimum `ν≥-1`,
and

`∀ x, ∀ r, 0<r≤1 → vol(B(x,r)) ≥ (1/2) ω₃ r³`,

where `ω₃` is the Euclidean unit-ball volume. Derive this uniform-in-center,
all-small-radii estimate from smooth normal coordinates and compactness.
Construct the normalized metric from the closed smooth manifold and establish
pullback and scaling laws for every condition.

The normalized initial conditions are Morgan–Tian, Definition 4.10, with the
curvature-operator bound expressed in the conventions above. All Morgan–Tian
locators below refer to the published Clay edition linked in the bibliography.

**API.**

- Metric existence, pullback and positive rescaling.
- Uniform small-ball limits and normalization.

**Checks.**

- Scaling a normalized metric up preserves its all-small-radii volume lower bound.
- The unit round sphere can be rescaled to satisfy the curvature bound.
- A curvature bound alone does not imply the normalized volume bound on collapsed flat tori.

*Needs:* 1.2; DifferentialGeometry partitions of unity and metric densities;
RiemannianGeometry normal coordinates.

### Examples

The round three-sphere has the displayed integral homology and higher homotopy groups. The
unit three-sphere has scalar curvature 6. Scaling a normalized metric up preserves its
all-small-radii volume lower bound.

### Dependencies

GeometricTopology Layers 1, 2, 7 and 11; AlgebraicTopology Stages 1–6 and 8;
DifferentialGeometry metric existence; RiemannianGeometry models and normal coordinates.

## Layer 2: Ordinary flow estimates and complete pointed compactness

### 2.1. Native flow adapters

Consume RicciFlow R1–R5 for compact initial-value theory, continuation, global
Shi estimates on closed manifolds and curvature evolution. Prove the adapters
between that flow carrier, the metrics selected in Layer 1 and the conventions above. The compact
initial-value theorem includes uniqueness on common domains, smooth dependence,
time restriction/restart, pullback, scaling, maximal-time construction and
continuation when curvature remains uniformly bounded. Use compact-bundle
parabolic estimates for the symmetric-tensor equation.

Use the metric section restricted to the stated time domain as the observable
flow data. Formulate equality and uniqueness on common restrictions, with
one-sided derivatives at included interval endpoints. A presentation by total
time-dependent metric and connection representatives comes with restriction
and extension maps and proofs that their composites preserve the restricted
metric, Ricci equation and regularity. Connection comparison uses the
Levi-Civita uniqueness theorem on differentiable fields.

Source: RicciFlow R1–R5 for the supplied compact initial-value API.

**API.**

- Restriction/restart, time translation, pullback, scaling and equality of the observable
  metrics on common domains.

**Checks.**

- The time-independent flat metric satisfies the flow equation.
- Restriction followed by comparison recovers the same metric on the smaller interval.
- Changing total representatives outside the stated interval preserves the restricted flow.

*Needs:* 1.3; RicciFlow R1–R5; native connection uniqueness.

### 2.2. Localized Shi estimates

Construct the localized Shi estimates of Morgan–Tian, Theorems 3.27–3.29.
For every dimension `n`, derivative order `k≥0` and positive `K,A,r`, construct
`C(n,k,K,A,r)>0` with the following property. Let `(U,g(t))`, `0≤t≤T`, be a
smooth Ricci flow with `0<T≤A/K`, and let `B_(g(0))(p,r)` have compact closure
in `U`. If `|Rm|≤K` on `B_(g(0))(p,r)×[0,T]`, prove

`|∇^k Rm|_(g(t))(y) ≤ C(n,k,K,A,r) t^(-k/2)`

for every `y∈B_(g(0))(p,r/2)` and `0<t≤T`. The constant is uniform over
the flows and independent of the geometry outside the controlled region.
Prove the versions with prescribed initial covariant-derivative bounds, with
constants also depending on those bounds, including uniform bounds up to
`t=0` at the controlled orders.
Build the evolving-metric distance comparisons, spatial/time cutoffs and
their gradient and `(∂t-Δ)` bounds, with support-barrier arguments at cut loci,
localized maximum principles and the nested-region derivative induction.
Derive the complete noncompact and exhaustion-uniform versions on buffered
regions, with time-translation and parabolic-rescaling laws. Use these
estimates to supply the derivative hypotheses for Layer 2 compactness in Layers 4–5
and for the standard-cap exhaustion in Layer 6.

**API.**

- Inner-domain restriction, initial-derivative variants, scale/time translation and
  exhaustion-uniform applications.

**Checks.**

- For k=0 the controlled outer curvature bound supplies the inner bound.
- Flat flow has zero curvature derivatives at every order.
- Without initial derivative bounds the stated positive-time estimate may diverge as t approaches zero.

*Needs:* 2.1; RicciFlow curvature evolution and closed maximum principles; local
PDE/cutoff construction here.

### 2.3. Pinching and differential Harnack

Prove the three-dimensional Hamilton–Ivey estimate. With `ν(0)≥-1`, at a point
where `ν<0` require

`R ≥ 2(-ν) (log(-ν)+log(1+t)-3)`.

Record the time/rescaling variants and the consequence that high-curvature
blowup limits have nonnegative curvature operator. The scalar maximum principle
gives `R_min(t)≥-6/(1+4t)` for normalized initial data; retain the stronger
general initial-lower-bound formula too.

Prove Hamilton's trace differential Harnack inequality for complete flows with
nonnegative curvature operator and curvature bounded on each compact time slab:
`∂t R + R/t + 2⟨∇R,V⟩ + 2 Ric(V,V) ≥ 0` for `t>0`. Derive its integrated and
ancient versions. Noncompact versions state their localization assumptions
and the required uniform bounds on each time slab.

Source: Morgan–Tian, Theorem 4.26, Theorem 4.37 and Corollary 4.39.

**API.**

- Scalar lower-bound comparison, rescaling of pinching and integrated/ancient trace
  Harnack forms.

**Checks.**

- The hyperbolic flow realizes the scalar lower comparison when normalized at curvature operator minimum −1.
- The shrinking cylinder has increasing scalar curvature in forward time.
- The trace Harnack target requires nonnegative curvature operator.

*Needs:* 2.1–2.2; RicciFlow curvature evolution and maximum principles.

### 2.4. Complete pointed limits

Define pointed smooth convergence on compatible exhausting domains, including
the embeddings, their overlap comparison maps, smooth metric convergence and
time compatibility. Prove Hamilton compactness for complete pointed flows with
uniform curvature/derivative bounds on the stated compact spacetime sets and a
positive basepoint injectivity-radius bound. Prove completeness of the limit
using ball exhaustion and distance control, with those hypotheses included
in the compactness theorem. Derive the
noncollapse-to-injectivity input from comparison geometry. Prove that two
complete pointed limits of the same convergent subsequence are pointed
isometric, together with subsequence and restriction laws and convergence of
curvature, distances and local volumes.

Source: Morgan–Tian, Theorems 5.11 and 5.15 for pointed metric/flow compactness.
Retain the limit-completeness hypotheses discussed by Topping.

**API.**

- Exhaustion embeddings and overlaps.
- Subsequence/restriction laws.
- Metric, curvature and local-volume convergence.

**Checks.**

- A constant sequence of pointed complete flows has its original flow as a limit.
- Changing the basepoint within a controlled ball is compatible with the convergence maps.
- Local convergence alone supplies no completeness assertion without the stated exhaustion and distance hypotheses.

*Needs:* 2.2–2.3; RiemannianGeometry injectivity/comparison; native manifold and tensor
transport.

### Examples

The time-independent flat metric satisfies the flow equation. For k=0 the controlled outer
curvature bound supplies the inner bound. The hyperbolic flow realizes the scalar lower
comparison when normalized at curvature operator minimum −1. A constant sequence of
pointed complete flows has its original flow as a limit.

### Dependencies

Layer 1; RicciFlow R1–R5; local PDE and Riemannian comparison inputs specified above.

## Layer 3: Reduced geometry, spacetime and noncollapse

### 3.1. Reduced action, distance and volume

Construct reduced action, reduced distance and reduced volume for complete
ordinary flows on their actual time intervals. Prove admissible path existence,
minimizer existence for `τ>0`, short-time asymptotics, first and second
variations, the reduced exponential map and its Jacobian comparison. Include
the cut-locus/null-set or weak-distributional arguments that justify integration
across nonsmooth reduced distance. Prove local Lipschitz regularity, the
Hamilton–Jacobi/weak differential inequalities, monotonicity of `Ṽ` in backward
time, and equality rigidity to the appropriate gradient shrinking soliton on
the region covered by the equality hypotheses. State the completeness,
curvature and integrability assumptions of each noncompact result.

Source: Morgan–Tian, Chapters 6–7, especially Theorem 7.26 for monotonicity on complete
bounded-curvature flows.

**API.**

- Endpoint/basepoint transport, parabolic scaling, variational inequalities, weak
  integration and equality rigidity.

**Checks.**

- Static Euclidean flow has normalized reduced volume 1.
- The unnormalized Euclidean integral is (4π)^(n/2).
- The τ=0 endpoint is recovered by the short-time limit of the τ>0 construction.

*Needs:* 2.1–2.4; HopfRinow geodesic/length theory; PDE weak calculus and measure
integration.

### 3.2. Spacetime and surviving paths

Build the spacetime carrier described in the conventions, its worldlines,
horizontal tensor calculus and changes of gauge. An ordinary flow gives its
product spacetime; prove the converse local trivialization by worldlines and
the equivalence of the intrinsic and ordinary Ricci equations on the **same**
identified domains. Prove parabolic scaling and domain transport, including
the behavior of path endpoints and the horizontal derivative.
Construct the worldline gauges on a covering of the stated region, prove their
horizontal calculus and zero-drift identities, and establish compatibility on
overlaps. State the survival interval and completeness hypotheses used to
construct each gauge.

Extend reduced geometry to spacetime domains on which the relevant paths are
defined and remain in the specified region. Construct the positive-start
version, its endpoint correction terms and comparison with ordinary reduced
geometry. Prove stability under domain restriction, pointed convergence and
scaling. For paths meeting a surgery region, prove the survival and domain
conditions needed to define their reduced action.

Source: Morgan–Tian, Chapter 6 and Definitions 14.1 and 14.8 for the horizontal
formulation.

**API.**

- Worldline gauges, ordinary/product comparison, horizontal connection, time/scale changes
  and positive-start restriction.

**Checks.**

- An ordinary flow gives its product spacetime and the same Ricci equation.
- A worldline ending at a domain boundary is used only on its survival interval.
- A constant-time slice carries the original spatial metric.

*Needs:* 3.1; 2.1; DifferentialGeometry smooth vector-field flows and tensor calculus.

### 3.3. Noncollapse

Define `κ`-noncollapse at scales below `r₀` by
`vol B(x,r)≥κrⁿ` on the specified curvature-controlled parabolic balls with
`0<r≤r₀`. Prove ordinary finite-time no-local-collapsing and its local/spacetime
versions from the reduced-volume estimates. Constants depend explicitly on
initial geometry, time horizon, dimension and scale bounds. Keep the stronger
all-scale ancient hypothesis separate from finite-horizon noncollapse.
Include the Euclidean reduced-volume calculation, shrinking models, positive-start
conversion and scale invariance in the API.

Source: Morgan–Tian, Theorems 8.1 and 8.10; retain the stated reduced-path domain and τ₀,
V, l₀, n dependence.

**API.**

- Scale and restriction laws, explicit parameter dependence, reduced-volume-to-ball-volume
  and injectivity comparisons.

**Checks.**

- Euclidean balls have their exact dimensional volume ratio.
- A free spherical quotient retains quotient-dependent volume constants.
- Shrinking a circle factor in flat product metrics rules out a uniform noncollapse constant across that family.

*Needs:* 3.1–3.2; 2.4; RiemannianGeometry volume comparison.

### Examples

Static Euclidean flow has normalized reduced volume 1. An ordinary flow gives its product
spacetime and the same Ricci equation. Euclidean balls have their exact dimensional volume
ratio.

### Dependencies

Layer 2; HopfRinow; DifferentialGeometry vector-field flows; PDE weak calculus and
Riemannian volume comparison.

## Layer 4: Ancient κ-solutions and shrinking asymptotic models

### 4.1. Connected ancient κ-solutions

An ancient `κ`-solution is a complete nonflat flow on `(-∞,0]` with a connected
manifold carrier, bounded curvature on compact time slabs, nonnegative curvature
operator, positive scalar curvature and `κ`-noncollapse on all scales. Develop
its pointed/isometric, restriction and rescaling API, together with the
positivity consequences of the strong maximum principle. Its classifications
and pointed compactness theorems concern that connected carrier, and pointed
limits retain the connected component containing the basepoint. Layer 7's finite disjoint unions
describe surgery slices.

Source: Morgan–Tian, Definitions 9.1–9.2 and Chapter 9.

**API.**

- Pointed/isometric transport, time translation and rescaling.
- Component retention and positivity consequences.

**Checks.**

- The round shrinking sphere restricted to an ancient interval is an ancient κ-solution.
- Flat Euclidean flow fails the nonflatness and positive-scalar clauses.
- A disjoint union of two round solutions fails the connected-carrier clause.

*Needs:* 2.2–2.4; 3.3; curvature strong maximum principles.

### 4.2. Asymptotic models and compactness

Construct backward blowdown sequences at reduced-distance-controlled points.
Prove the required curvature, distance, noncollapse and injectivity estimates,
then apply Layer 2's localized derivative estimates and compactness, and Layer 3
reduced-volume rigidity, to obtain an actual complete nonflat gradient shrinking
asymptotic soliton. Construct the limit
carrier and its convergence embeddings from the rescaled flows.

Classify two-dimensional ancient κ-solutions as shrinking round spheres or
their free isometric quotients. Classify the **three-dimensional gradient
shrinking asymptotic models**: round spherical spaceforms, the round cylinder
and its free quotient models, with the flat branch separated when the nonflat
hypothesis is removed. The cylinder quotients are `RP²×ℝ` and the quotient by
`(x,z)↦(-x,-z)`; orientability excludes the former. Prove the splitting, quotient
and covering identifications. General three-dimensional ancient κ-solutions
are treated through their structural properties and asymptotic models.

Prove zero asymptotic volume ratio for noncompact three-dimensional ancient
κ-solutions, the derivative/Harnack and bounded-distance consequences, and the
universal noncollapse alternative: a universal positive `κ₀` applies outside
the round spherical-spaceform branch. In that branch, retain the dependence
of volume bounds on the quotient group.

Prove pointed compactness of normalized ancient solutions, with scalar curvature
one at the basepoint, retaining the spherical exception and all necessary
normalization/noncollapse hypotheses. The limit is an actual complete nonflat
ancient flow. Derive the classifications from the preceding analytic and
topological inputs.

Sources: Morgan–Tian, Theorem 9.4 and Corollary 9.50(3) for the two-dimensional
classification, Theorem 9.42 for three-dimensional shrinking models,
Proposition 9.58 for the universal noncollapse alternative, and Theorem 9.59
for zero asymptotic volume ratio.

**API.**

- Blowdown embeddings, shrinking-model classification, quotient/orientation branches and
  normalized pointed compactness.

**Checks.**

- The round sphere supplies the compact shrinking model.
- The quotient (x,z)↦(−x,−z) of the cylinder is orientable; projective-plane times line is not.
- Increasing spherical quotient orders prevents a quotient-independent lower volume bound.

*Needs:* 4.1; 2.4; 3.1–3.3; 1.1–1.2.

### Examples

The round shrinking sphere restricted to an ancient interval is an ancient κ-solution. The
round sphere supplies the compact shrinking model.

### Dependencies

Layers 1–3; native quotient and orientation transport.

## Layer 5: Canonical neighborhoods and singular-time geometry

### 5.1. Necks, caps and canonical components

Use Morgan–Tian, Definitions 9.72–9.78, for necks, caps, canonical components
and strong necks, with the model-coordinate normalizations fixed above.

Prove the topology of overlapping necks and caps, neck-chain continuation,
sphere-bundle alternatives and finite covers of compact canonical components.
Use the embeddings and collars from Layer 1 and GeometricTopology, and prove that
the coordinate changes describe the same regions in the actual manifold.

Produce a universal `0<ε₀≤10⁻³` such that for every `0<ε≤ε₀` there are
constants `C(ε)≥1` and derivative, volume and neighborhood-radius bounds
with the following property. For every normalized ancient solution outside
the `RP²×ℝ` shrinking-cylinder branch, each point lies in an `ε`-neck, an
`ε`-cap or a compact positively curved component with the stated bounds.
Retain the `RP²×ℝ` branch in the general ancient alternative, and prove its
exclusion for the orientable pointed limits used by surgery, using Layer 1 and
transport of orientation through the convergence embeddings.
Specify model-coordinate `C^⌊ε⁻¹⌋` closeness,
curvature comparability and the time interval for strong necks. Constants are
chosen before the solution. At scalar curvature `R(x)`, take radii comparable
to `R(x)^(-1/2)`, require `C⁻¹R(x)≤R≤CR(x)` on the specified neighborhood,
`|∇R|≤CR^(3/2)` and `|∂tR|≤CR²`; the neck/cap clauses include the stated
noncollapsed volume bound. The compact spherical-spaceform clause uses
volume bounds with their quotient-group dependence.
Derive the local ancient alternatives needed in
the blowup argument, including the quotient branches.

**API.**

- Embedded model-coordinate comparison, overlap and neck-chain laws, scale transport and
  quantitative derivative/volume bounds.

**Checks.**

- The exact round cylinder is the neck model at scalar curvature one.
- Both a ball cap and a punctured projective-space cap have the specified neck end.
- The projective-plane cylinder branch is excluded from orientable surgery limits.

*Needs:* 4.1–4.2; 1.1–1.2; GeometricTopology collars/gluing.

### 5.2. High curvature and singular-time limits

For ordinary three-dimensional flows with Hamilton–Ivey pinching, prove the
bounded-distance curvature estimates and the high-curvature canonical
neighborhood theorem on a finite time horizon, using a point-picking
construction, Layer 2's localized derivative estimates and complete pointed blowup
limits. The theorem states its
noncollapse and prior-scale hypotheses and chooses its threshold before the
flow/point. Include the spacetime versions used near surgery.

At a finite singular time, construct the smooth limit metric on the actual
regular region where curvature remains locally bounded. Prove compatibility on
overlaps, identify its ends, and show that the high-curvature ends used for
surgery are horns with strong-neck cross sections. Prove the finite neck/horn
selection and disjointness statements at the chosen cutoff scale. State the
compactness and completeness properties of the specific components and ends
used in surgery.

Source: Morgan–Tian, Theorem 10.2 for bounded curvature at bounded distance and Theorem
11.19 under Assumptions 11.18 for the singular-time limit.

**API.**

- Point-picking and bounded-distance comparisons.
- Compatible regular-region limits, horns and disjoint cutoff-neck selection.

**Checks.**

- On a uniformly curvature-controlled closed slab the regular-region limit is the whole manifold.
- The regular region may be empty at total extinction.
- Completeness of a pointed blowup and incompleteness of a singular-time regular region have separate hypotheses.

*Needs:* 5.1; 2.2–2.4; 3.3; finite-horizon ordinary flow.

### Examples

The exact round cylinder is the neck model at scalar curvature one. On a uniformly
curvature-controlled closed slab the regular-region limit is the whole manifold.

### Dependencies

Layers 1–4; GeometricTopology collars, gluing and local component topology.

## Layer 6: Standard cap and actual metric surgery

### 6.1. Standard cap and noncompact flow

Construct the class of rotationally symmetric complete standard cap metrics
on `ℝ³` with nonnegative curvature and an exactly round cylindrical end of
scalar curvature one. In polar coordinates write `dr²+f(r)²g_(S²)`, with
`f(0)=0`, `f′(0)=1`, the odd smooth extension at zero, `f>0` for `r>0`,
`0≤f′≤1`, `f″≤0` and `f=√2` beyond a finite radius. Require a round tip of
sectional curvature `1/4`: on some interval `0≤r<r_tip` with `r_tip>0`,
`f(r)=2 sin(r/2)`. Prove this class is
nonempty and prove the metric/curvature assertions, including smoothness at
the tip. For each such initial metric construct its complete
bounded-curvature Ricci flow by exhaustion, Layer 2's localized derivative estimates
and local parabolic existence estimates. Prove uniqueness among complete
solutions with curvature bounded on compact
time slabs, and prove its curvature, asymptotic-cylinder and
canonical-neighborhood estimates on `[0,1)`, with maximal time one. State
which constants depend on the chosen cap profile. Include the noncompact
existence and exhaustion arguments as part of this construction.

The standard initial metric and its flow are Morgan–Tian, Definition 12.1
and Theorem 12.5.

**API.**

- Profile-to-metric construction, tip/cylinder curvature, complete exhaustion, uniqueness
  and asymptotic-cylinder control.

**Checks.**

- The tip profile 2 sin(r/2) has sectional curvature 1/4.
- The constant profile √2 has scalar curvature one on the cylindrical end.
- A profile with f(0)>0 describes no smooth tip at the origin.

*Needs:* 1.2–1.3; 2.1–2.4; 5.1–5.2; local parabolic existence/exhaustion here.

### 6.2. Metric cut, cap and comparison maps

Define metric surgery along a finite disjoint collection of selected strong
necks. Perform the actual cut and cap attachment using collars and smooth
cutoffs, prove positivity/smoothness of the new metric, and identify it with
the old metric off the surgery region. State the quantitative `δ`-closeness,
curvature pinching and derivative bounds of the cap interpolation at scale
`h`; establish their scaling laws. Prove the elementary topology of every
discarded canonical component, yielding spherical-spaceform and sphere-bundle
factors and explicit connected-sum descriptions for multi-cap cases.

Construct comparison maps between actual pre- and post-event components on
the regions used in the width argument. Prove the stated length/area distortion
and the homotopies on surviving regions. Give the local formulas and domain
conditions both on unchanged regions and on collapsed caps. Prove independence
of auxiliary collar choices up to the equivalence used by downstream statements.
Record the boundary parameterization of each inserted ball in the chosen
product-neck coordinates. Prove that reversing a separating cut identifies the
two ball boundaries by the standard connected-sum identification in those
coordinates, with the orientation convention carried by the ball embeddings.

Prove continuation after a cut, including the case of an empty post-slice,
compatibility with ordinary-flow restart and persistence of the inserted cap
on its controlled parabolic region. Construct the local surgery and
continuation data from the stated geometric hypotheses.

Source: Morgan–Tian, Chapters 13–15, especially Definition 15.8, Proposition 15.3 and
Lemma 15.11.

**API.**

- Actual cut/cap embeddings, unchanged-region identities, length/area comparison,
  boundary-parameterization compatibility, collar-choice transport and continuation.

**Checks.**

- An empty neck collection gives the unchanged metric before any component deletion.
- Separating neck surgery produces two capped children with the actual pre-event common region.
- The empty post-slice has an empty ordinary-flow continuation.

*Needs:* 6.1; 5.1–5.2; GeometricTopology collared gluing and connected sum.

### Examples

The tip profile 2 sin(r/2) has sectional curvature 1/4. An empty neck collection gives the
unchanged metric before any component deletion.

### Dependencies

Layers 1, 2 and 5; local parabolic exhaustion and GeometricTopology gluing.

## Layer 7: Controlled schedules and global surgery flow

### 7.1. Surgery-flow data and control schedules

Define a surgery flow as ordinary smooth epochs, pre-event left-limit regular
geometry, post-event metrics, actual cut/cap data, discarded components and
identifications of the unchanged regions. Each slice is a finite disjoint union
of closed orientable three-manifolds; empty slices continue as empty. Include
restriction to a finite time interval, the initial diffeomorphism/isometry,
event-side conventions and identity/composition laws for epoch transport.

For every normalized initial metric, construct positive cutoff/canonical scales
and a decreasing surgery-accuracy schedule on `[0,∞)`. Prove the noncollapse
and canonical-neighborhood inductions, including the reduced-path survival or
large-action alternative near inserted caps. Quantify the allowed accuracy
in terms of the initial geometry, finite time horizon and previously chosen
control parameters. Prove all extension steps needed to obtain the next epoch.

Source: Morgan–Tian, Definitions 14.1 and 14.8 and Chapter 15 Assumptions (1)–(7).

**API.**

- Finite epochs/events, left/right conventions, initial isometry, restriction and epoch
  composition, accuracy/noncollapse induction.

**Checks.**

- A single ordinary epoch with no events gives a surgery flow.
- Restriction to an epoch preserves its initial and terminal side conventions.
- A deleted component contributes no post-event worldline.

*Needs:* 3.1–3.3; 5.1–5.2; 6.1–6.2.

### 7.2. Local finiteness and global existence

At a genuine neck/cap event of scale `h` and accuracy `δ`, prove the
three-dimensional volume-loss estimate `c h³/δ`, with `c>0` determined by the
model parameters. Compare the post-event volume with the **pre-event left
limit**, and account for smooth-time volume growth using the scalar lower
bound. Prove that the chosen schedule gives a uniform positive loss bound for
these events on each compact time interval. Count deletion-only events using
the component history and bounds on component creation at neck/cap events.
Include the terminal transition to an empty slice in the event history.
Together these estimates give finitely many events on each compact interval.

Construct coherent finite prefixes, their restriction identifications and a
global flow by compatible extension. Prove local finiteness, the control
estimates for all epochs, actual initial identification and permanent emptiness
after the first empty slice. The existence theorem covers every normalized
closed orientable initial metric and constructs all the stated data.

Sources: Morgan–Tian, Theorem 15.9 for all-time extension with controlled
parameters, Corollary 15.10 and its proof for global existence from normalized
initial data, and Lemma 17.12 for local finiteness of surgery times. The
initial short-time flow and extension compose for each chosen normalized
metric, retaining that metric in the initial identification.

**API.**

- Volume accounting, deletion-event counting, coherent finite prefixes, all-time extension
  and permanent emptiness.

**Checks.**

- The volume removed by a neck at scale h scales as h³.
- Deleting a whole component is counted even with no neck/cap volume-loss estimate.
- After the terminal empty event all later restrictions remain empty.

*Needs:* 7.1; 2.3 scalar lower bound; finite component creation from 6.2.

### Examples

A single ordinary epoch with no events gives a surgery flow. The volume removed by a neck
at scale h scales as h³.

### Dependencies

Layers 2, 3, 5 and 6; finite component bookkeeping.

## Layer 8: Component ancestry and homotopy transport

### 8.1. Component ancestry and class transport

Prove separation by embedded spheres in a closed simply connected
three-manifold from duality and van Kampen. Compute fundamental groups of
the actual connected-sum/cap operations, including injections of factor groups
into the free product. Deduce simple connectedness of every surviving child
component, and of the factors in each finite reconstruction. Identify and
transport basepoints by explicit paths when the comparison map moves them.

For any surviving component at time `T`, construct its finite ordered ancestry
back to a component at time zero, using Layer 7 local finiteness. Specify its actual
component inclusions, epoch transports, event parents and comparison maps.
Prove that transport sends the selected component onto a full component and
that adjacent path segments and endpoint identifications agree. Build
composition and restriction laws for the resulting homotopy maps.

Construct the native higher-homotopy class transport used by Layer 11 across
this same ancestry. Prove preservation of a nonzero class under the relevant
parent/child maps, together with basepoint-change and composition laws.
Layer 9 supplies the natural comparison with regular loop-family representatives;
construct the continuous higher-homotopy maps here using the native homotopy
groups. Choose an initial nonzero class and prove the transport results for
that fixed class uniformly in the final time.

Source: Morgan–Tian, Proposition 15.3, Definition 18.2 and the paths of components in
§18.3; construct the explicit native transport maps here.

**API.**

- Actual parent/child maps, basepoint paths, identity/composition/restriction, factor
  injections and fixed-class transport.

**Checks.**

- With no events the ancestry is the ordinary epoch identification.
- At a separating neck each surviving child has its specified pre-event parent.
- A completely discarded component has no surviving descendant.

*Needs:* 1.1–1.2; 6.2; 7.1–7.2; AlgebraicTopology van Kampen and higher homotopy.

### Examples

With no events the ancestry is the ordinary epoch identification.

### Dependencies

Layers 1, 6 and 7; AlgebraicTopology van Kampen and higher homotopy.

## Layer 9: Regular loop families, filling area and width

### 9.1. Regular free-loop families

For closed smooth Riemannian manifolds, construct the `C¹` free-loop space and
its topology from the native smooth-map/path carriers, with evaluation,
constant loops, reparametrization and continuous family/homotopy APIs. Prove
relative parametric smoothing and the comparison with the continuous loop
space. Consume AlgebraicTopology 8.11a (`basedLoopCWType`) for the CW comparison
of based loops and Tau Ceti's `HomotopyGroup.pathLoopSpaceMulEquiv`
for the based-loop homotopy-group shift. Construct here the free-loop evaluation
fibration with its constant-loop section and the resulting comparison: for a
simply connected three-manifold with `π₂=0`, identify
`π₂(Λ₀M,const_x)≅π₃(M,x)`, where `Λ₀M` is the nullhomotopic-loop component.
Prove naturality, basepoint-change laws and existence of regular representatives
in this component.

Source: Morgan–Tian, §18.3, for the loop-family construction; build the stated
evaluation-fibration comparison here.

**API.**

- Evaluation/constant section, relative parametric smoothing, reparametrization and
  based/free naturality.

**Checks.**

- Constant loops form a section of evaluation.
- For the three-sphere the comparison gives π₂(ΛS³)≅ℤ.
- A loop winding around the circle factor belongs to a nontrivial free homotopy component.

*Needs:* 1.1; AlgebraicTopology 8.11a and based-loop shift; DifferentialGeometry
relative Whitney approximation; the parametric loop-family extension is built here.

### 9.2. Disk filling area

Define the area of a Lipschitz spanning disk by integrating its metric
two-Jacobian, and energy by `1/2 ∫|df|²`. For a nullhomotopic `C¹` loop `γ`,
define `Fill_g(γ)` as the infimum of areas of all such spanning disks with the
specified boundary parametrization. Prove nonemptiness, finiteness,
nonnegativity, comparison with every disk, and `ε`-near-minimizers. Prove the
reparametrization law and continuity on null loops in the chosen `C¹` topology.
Establish uniform small-loop filling estimates on compact manifolds using
normal balls and actual disk maps. Prove the annulus-gluing inequality for
two nearby loops with a displayed spanning annulus and its area.

Construct disk competitors by relative smoothing of a chosen nullhomotopy,
using 9.1. Finiteness and near-minimizers then follow from the nonempty
competitor set and its nonnegative area infimum. Source: Morgan–Tian, §18.3
and the proof of Lemma 19.2 for the filling functional.

**API.**

- Competitor and near-minimizer laws, monotone boundary parametrizations, C¹ continuity,
  small-loop estimates and annular gluing.

**Checks.**

- A constant loop has filling area zero.
- Scaling the ambient metric by Q>0 scales filling area by Q.
- The filling functional is defined on nullhomotopic loops; a winding-one product ramp is outside that domain.

*Needs:* 9.1; RiemannianGeometry immersion area; GeometricMeasureTheory G1–G2; PDE weak
compactness.

### 9.3. Variational disks and null-loop annuli

Construct the variational disk and annulus results used by that comparison and
Layer 10's deformation proof. For a nullhomotopic embedded `C²` loop in a closed
Riemannian manifold with `π₂=0`, prove existence of an area-minimizing spanning
disk, with the weak conformality, interior branched harmonic regularity and
boundary regularity required by its curvature/area estimates. Boundary values
are allowed monotone circle reparametrizations, with the precise normalization
and nondegeneracy conditions included in the variational problem. Construct
annular near-minimizers and their boundary-reparametrization and gluing laws.
For disjoint embedded nullhomotopic `C²` boundary loops, prove annular
attainment under the strict Douglas gap
`inf Area(annuli) < Fill_g(γ₀)+Fill_g(γ₁)`; include boundary parametrizations
and the modulus compactness proof. Establish the comparison for general nearby
loops using spanning annuli and near-minimizers. Prove approximation back to
the original `C¹` competitors.

Sources: Morrey, *The problem of Plateau on a Riemannian manifold*, pp. 807–851,
and Hildebrandt, *Boundary behavior of minimal surfaces*, pp. 47–82, for disk
existence and boundary regularity. For annuli, use Jost's Riemannian
Plateau–Douglas variational method in *Conformal mappings and the
Plateau-Douglas problem in Riemannian manifolds*, pp. 37–54. Construct the
strict-gap compactness argument here: a degeneration separating the boundary
components costs at least the sum of the two disk infima, while disjoint
boundary images exclude the opposite degeneration. Include bubble removal
using `π₂(M)=0` and regularity of the resulting minimizer.

**API.**

- Conformal normalization, weak compactness and regularity, boundary reparametrizations,
  annular gluing and approximation.

**Checks.**

- For constant boundary data the filling-area infimum is zero, treated separately from embedded-boundary attainment.
- Pinching an annulus into two disks gives the comparison threshold Fill(γ₀)+Fill(γ₁).
- Equality at that threshold supplies no strict Douglas-gap attainment conclusion.

*Needs:* 9.1–9.2; PDE/GMT compactness and Riemannian area calculus.

### 9.4. Annuli between degree-one ramps

For Layer 10, also construct annular minimization between ramps in
`M×S¹_λ`, where `M` is a closed smooth manifold of dimension `n≥3` with
`π₂(M)=0` and the circle has a fixed positive circumference `λ`.
For two disjoint embedded `C²` boundary ramps with circle projection of degree
one and a specified free homotopy between them, prove attainment of the infimum
over all spanning annuli, allowing
monotone boundary reparametrizations, by a weakly conformal branched minimal
annulus. The boundary loops represent a common nontrivial free homotopy
class in the product. Construct a finite-energy annular competitor from the
specified homotopy. Establish modulus compactness for minimizing sequences
at each fixed `λ>0`: use the positive lower bound on lengths of core curves
from their degree-one circle projection and the positive separation of the
boundary images to control the two degenerations of modulus. Include weak
compactness, bubbling control, interior/boundary regularity and branch-point handling needed for
area variation and small-area comparison. Prove approximation and annular
gluing estimates for intersecting boundary ramps. These are the noncontractible
boundary results used in Morgan–Tian, Lemma 19.15 and Section 19.7; the
Douglas-gap result above supplies the null-loop case. This layer owns these
nonlinear existence and regularity results.

**API.**

- Finite-energy competitors, fixed-circumference modulus compactness, branch-point
  regularity and intersecting-boundary approximation.

**Checks.**

- The circle projection prevents the boundary ramps from being nullhomotopic in the product.
- At fixed λ>0 an energy bound and positive boundary separation control both modulus degenerations.
- Those modulus bounds need not be uniform as λ tends to zero.

*Needs:* 9.1–9.3; product metric and circle models; π₂(M)=0.

### 9.5. Least sphere area and variation

Develop sphere area/energy, weak conformality, branched minimal spheres and
the bubble-compactness analysis needed for the least nontrivial sphere-area
theorem. If `π₂(M)` is nonzero and `M` is closed, prove a positive least area
among all non-nullhomotopic sphere maps, attained by a branched minimal sphere.
The minimization ranges over all nontrivial classes. Build the
Sobolev compactness, harmonic replacement, removable-singularity and energy
quantization arguments from the cited PDE/GMT and Riemannian area suppliers.
In dimension three along Ricci flow, for a branched minimal sphere selected at
time `t` and any scalar lower bound `ρ` at that time, prove
`A′(t)≤-4π-(ρ/2)A(t)`, with branch contributions and Gauss–Bonnet accounted for.
Prove fixed-map area variation and two-sided metric-time comparison separately.
The least-sphere-area theorem and its variation inequality are Morgan–Tian,
Lemmas 18.10 and 18.11.

**API.**

- Harmonic replacement, bubbling/removable singularities, least-area attainment, fixed-map
  variation and metric-time comparison.

**Checks.**

- A round two-sphere in the product S²×S¹ represents a nonzero π₂ class.
- On a closed manifold with π₂=0 the nontrivial-class minimization has no competitors.
- In dimension three the Gauss–Bonnet term in the sphere inequality is −4π.

*Needs:* 9.2–9.3; PDE harmonic-map compactness; RiemannianGeometry area variation.

### 9.6. Family and homotopy-class width

For a continuous null-loop family `F:S²→Λ₀M`, define
`w_g(F)=max_(z∈S²) Fill_g(F(z))`. For its free homotopy class define
`W_g([F])=inf_(G≃F) w_g(G)`, over **all** continuous null-loop representatives.
Prove existence of family maxima, nonempty competitor sets, finite class
width, nonnegativity, near-minimizers, homotopy invariance, comparison under metric change,
and agreement with the based-class notation supplied by the loop comparison.
Prove a uniform small-loop-family width bound and the short-loop nontriviality
criterion: when `π₂(M)=0`, there is `ζ(g)>0` such that every continuous null-loop
family whose members all have length less than `ζ(g)` represents the zero
class under the based/free comparison. Use this criterion for the nonzero
transported class in Layers 10–11, together with finiteness and nonnegativity of its
width and the family-deformation estimates.

Sources: Morgan–Tian, §18.3, Definition 18.17 for family and class width;
§18.4.2, Lemma 18.27 for the short-loop criterion and Corollary 18.28 for the
small-loop filling bound, both on p. 434. For every η>0 choose ζ>0 so that
length less than ζ implies filling area less than η; this gives the uniform
bound for families of such loops.

**API.**

- Family maxima, all-continuous-competitor infima, near-minimizers, class invariance and
  metric/short-loop comparison.

**Checks.**

- The family consisting entirely of constant loops has width zero.
- Scaling the metric by Q>0 scales both family width and homotopy-class width by Q.
- The short-loop criterion gives a zero class under π₂(M)=0; it supplies no uniform positive width hypothesis.

*Needs:* 9.1–9.5; compact parameter space S²; 1.1 for the three-manifold applications.

### Examples

Constant loops form a section of evaluation. A constant loop has filling area zero. For
constant boundary data the filling-area infimum is zero, treated separately from
embedded-boundary attainment. The circle projection prevents the boundary ramps from being
nullhomotopic in the product. A round two-sphere in the product S²×S¹ represents a nonzero
π₂ class. The family consisting entirely of constant loops has width zero.

### Dependencies

Layer 1; AlgebraicTopology based-loop inputs; DifferentialGeometry smoothing; Riemannian
area calculus; PDE/GMT weak compactness.

## Layer 10: Moving-curve estimates, ramps and family deformation

### 10.1. Moving curves and corrected estimates

For immersed loops in an ordinary smooth ambient Ricci flow, construct curve
shortening and its reparametrization invariant geometric equation
`∂tc=∇_s T`. Prove local existence, uniqueness modulo the specified
parametrization, smooth dependence, continuation and the corresponding equations
for speed, arclength derivative, length, curvature vector and curvature squared.
Include the time variation of the ambient Levi-Civita connection.

Prove the corrected estimates of Morgan–Tian's Section 19.2 correction. On a
compact ambient slab with displayed curvature and derivative bounds, derive
the curvature inequality with its **linear** curvature contribution, regularize
by `sqrt(k²+η²)`, integrate before taking `η↓0`, and obtain a total-curvature
bound with the length-dependent term. Constants depend on the displayed ambient
bounds and initial family bounds and apply uniformly to the parameter family.

Source: Morgan–Tian, §§19.1–19.2, with the retained 2015 correction.

**API.**

- Reparametrization-invariant flow, local existence/continuation, connection variation,
  regularized total-curvature and family bounds.

**Checks.**

- A stationary closed geodesic in a flat ambient flow satisfies the geometric curve equation.
- The curvature regularization is controlled before passing η to zero.
- The corrected total-curvature constant retains initial length as well as initial total curvature.

*Needs:* 2.1–2.3; 9.1–9.3; local quasilinear curve-flow theory here.

### 10.2. Ramps and family deformation

For Layer 9's null-loop families, construct the degree-one ramp curves
`θ↦(γ(θ),θ)` in `M×S¹_λ`, their local flows, angle/length/curvature control
and continuation on the controlled slab. Their circle projection represents
the nontrivial degree-one class; their projections to `M` are the null loops
used for filling area. Use Layer 9's annulus theorem for noncontractible boundary
loops to prove continuity and
the forward growth bound for the infimum of annular areas along ramp flows in
Morgan–Tian, Lemma 19.15 and Corollary 19.16, with growth constants independent
of `λ`. Project the resulting comparison annuli to `M` and use Layer 9's
disk/annulus gluing inequality to compare filling areas of the projected loops.
Establish errors tending to zero as `λ↓0`, with quantitative bounds uniform
over a fixed compact parameter family. Construct polygonal approximation,
compatible smoothing and finite nets of loop families in the topology actually
used for these estimates.

Assemble family deformation preserving the relevant homotopy class, with all
small-loop, filling-area and annulus errors displayed. Prove the deformation
estimate for almost minimizing families, with explicit approximation errors.
The output is the deformation estimate needed for Layer 11's forward width
inequality, uniformly in the family parameter and on the specified time slab.
The source target is Morgan–Tian, Proposition 18.24; Section 19.7, including
Lemma 19.31, supplies the small-area annulus analysis used in its proof.
Use [the retained correction](https://arxiv.org/abs/1512.00699v1), including its
consequences for the family estimates.

**API.**

- Ramp construction/continuation, degree and angle control, projected annular comparison,
  finite nets and homotopy-preserving deformation.

**Checks.**

- The graph of a null loop has degree one in the circle factor.
- Projection of an annulus in the product supplies an annulus competitor in M.
- The area-growth coefficient remains independent of λ while fixed-λ modulus estimates retain their own dependence.

*Needs:* 10.1; 9.1–9.6; 2.2 ambient derivative bounds.

### Examples

A stationary closed geodesic in a flat ambient flow satisfies the geometric curve
equation. The graph of a null loop has degree one in the circle factor.

### Dependencies

Layers 2 and 9; moving-curve local existence and the corrected estimates constructed in
this layer.

## Layer 11: Width comparison and finite extinction

### 11.1. Smooth-epoch width comparison

For a transported nonzero class on a smooth epoch, prove continuity and the
upper forward-difference estimate

`D⁺W(t) ≤ -2π - (R_min(t)/2) W(t)`.

Here `D⁺` is the upper right Dini derivative: express the inequality by
`∀η>0, ∃δ>0, ∀0<h<δ` within the epoch, the forward quotient is at most the
displayed bound plus `η`. Using Layer 2's scalar bound and `W≥0`, deduce

`D⁺W(t) ≤ -2π + 3W(t)/(1+4t)`.

Prove the regular-slab comparison theorem for continuous functions satisfying
this forward estimate, including endpoint restrictions and restarting at any
nonnegative time. The integrating factor is `(1+4t)^(-3/4)`. For zero event
errors and initial width `W₀`, the comparison profile is

`G(t)=(W₀+2π)(1+4t)^(3/4)-2π(1+4t)`.

Verify `G(0)=W₀`, `G′=-2π+3G/(1+4t)` for `t≥0`, and eventual negativity
for every finite initial width. These are normalization and comparison checks
for the width theorem.

Source: Morgan–Tian, Proposition 18.18 and the proof of Theorem 18.1.

**API.**

- Continuity, upper forward quotients, endpoint/restart laws and the integrating-factor
  comparison.

**Checks.**

- The profile G starts at W₀.
- Its derivative is exactly −2π+3G/(1+4t).
- Every finite W₀ gives eventual negativity of G.

*Needs:* 7.1; 8.1; 9.6; 10.2; 2.3 scalar bound.

### 11.2. Event budgets and finite extinction

Across each actual surgery event, construct the representative comparison on
the child/parent path from Layer 8 and prove the width jump bound from Layer 6's metric
and homotopy comparison. Give the nonnegative event error `e_j` explicitly
and choose Layer 7's accuracy schedule so the total **weighted** error
`Σ_j (1+4t_j)^(-3/4)e_j` is bounded by a prescribed finite `E`. If a construction
gives exact nonincrease, prove that case with `e_j=0`. Prove the
weighted-budget selection lemma and its compatibility with the canonical
neighborhood/noncollapse requirements on the same schedule.

For every surviving component at time `T`, use its Layer 8 ancestry to compare its
nonnegative width to the **fixed initial class** and obtain

`(1+4T)^(-3/4) W(T) ≤ W₀ + E - 2π((1+4T)^(1/4)-1)`.

Prove finite-piece propagation through the locally finite event set, including
left/right event limits and restarts. The right side is negative for all
sufficiently large `T`. Thus the global flow constructed in Layer 7 is empty after
a finite time when its initial manifold is simply connected. Express the
extinction-time bound in terms of the normalized initial width and chosen
error budget.

The existence/extinction theorem constructs a flow satisfying the budget and
the Layer 7 controls and proves finite extinction for that flow.
Sources: Morgan–Tian, Proposition 18.18 for the forward width estimate and
Theorem 18.1 for finite extinction, specialized here to simply connected data.

**API.**

- Weighted event-error propagation, one fixed transported class, compatible accuracy
  schedules and a quantitative empty-time bound.

**Checks.**

- Zero event errors recover the smooth comparison profile.
- An error at t_j enters the normalized bound with weight (1+4t_j)^(-3/4).
- A surviving component has nonnegative width, contradicting the eventual negative upper bound.

*Needs:* 11.1; 6.2 comparison maps; 7.1–7.2; 8.1 ancestry and class transport.

### Examples

The profile G starts at W₀. Zero event errors recover the smooth comparison profile.

### Dependencies

Layers 2 and 6–10, including a single accuracy schedule satisfying both flow controls and
the error budget.

## Layer 12: Reconstruction from the actual finite history

### 12.1. Finite history and reconstruction maps

Layer 7 local finiteness and Layer 11 finite extinction give a finite complete event
history. Define its finite ancestry/assembly index using actual surviving,
discarded and capped components. Construct the immediate-successor relation
and identify each transported survivor with the full pre-component at its next
event. Prove terminal absence of survivors and the exact reindexing equivalences
when substituting one local decomposition into another.

At each event prove a smooth connected-sum reconstruction of the pre-slice
from the actual post-slice and discarded elementary factors. Use the collared
gluing maps and metrics' unchanged-region identifications from Layer 6. Reverse
each separating cut using Layer 6's boundary-parameterization compatibility, so
the resulting connected sum uses the specified full ball embeddings and the
standard boundary identification of GeometricTopology Layer 1. Reverse
induction on the finite event order gives a smooth identification of the
initial manifold with an iterated connected sum of the spherical-spaceform and
`S²`-bundle factors. Multi-cap discarded components are decomposed by their
proved elementary topology.

Provide the identity, composition, substitution and finite-reindexing laws for
these assembly maps. Prove the fundamental-group factor injections for this
actual assembly using Layer 8. Develop the geometric assembly maps and their finite
indexing with explicit compatibility lemmas.

Sources: Morgan–Tian, Proposition 15.3 for the single-event connected-sum
description and Corollary 15.4(1) for finite-history reconstruction. Its proof
inverts the actual event operations; expose those assembly maps and their laws
as above. The Chapter 18 proof of Theorem 0.1 applies this reconstruction.

**API.**

- Actual ancestry/assembly indices, terminality, reverse-event induction,
  substitution/reindexing and factor-group injections.

**Checks.**

- A two-event prefix composes the actual component identifications.
- A terminal deletion is part of the history even when no post-component survives.
- The empty connected-sum expression is handled by the unit-sphere convention, with a separate nonempty initial component.

*Needs:* 1.1–1.2; 6.2; 7.1–7.2; 8.1; 11.2.

### Examples

A two-event prefix composes the actual component identifications.

### Dependencies

Layers 1, 6–8 and 11; GeometricTopology finite connected sums and collared gluing.

## Layer 13: Factor classification and the smooth endpoint

### 13.1. Factor classification and smooth endpoint

For simply connected initial data, transport simple connectedness through the
initial identification, the reconstructed connected sum and its factor-group
injections. Exclude each sphere-bundle factor using its nontrivial fundamental
group. For a spherical-spaceform factor prove that simple connectedness forces
the covering degree to be one and construct a diffeomorphism with the unit
round sphere using the quotient cover.

Prove the smooth sphere connected-sum identity for the collared ball embeddings
and gluing maps occurring in Layer 12. Use Layers 6 and 12's parameterizations
to identify the boundary gluing with the standard connected-sum identification
through the product neck. Consume GeometricTopology Layer 1's disc theorem to
move the specified full, orientation-compatible ball embeddings to standard
ones. In these coordinates the two punctured three-spheres are standard
three-balls glued by the identity, giving the standard three-sphere.
The disc theorem is Hirsch, *Differential Topology*, Chapter 4 §6, Theorem 6.6,
p. 117, as stated in the supplier's
[extract](../GeometricTopology/references/hirsch-disc-theorem.md); its connected-sum
API supplies independence of the ball embeddings. Keep the ball parameterizations
in the identification when transporting a factor diffeomorphism.
Induct on the finite assembly while keeping smooth identifications of untouched
components. Connectedness and nonemptiness give one final sphere.

Assemble `poincare_3d_smooth` with exactly the hypotheses displayed in
`Suggested.lean`. Choose the initial metric and normalized scale, construct the
budget-compatible flow, prove its extinction, reconstruct it and classify its
factors. Quantify over the closed simply connected smooth manifold in the
endpoint theorem. Also expose the preceding reconstruction and factor theorems
as reusable library results with their weaker hypotheses.
The smooth endpoint is Morgan–Tian, Corollary 0.2(a).

**API.**

- Factor injections, degree-one quotient covers, parameterized neck/ball gluing
  compatibility, ball-embedding independence and finite connected-sum induction.

**Checks.**

- A simply connected spherical quotient has trivial covering group.
- A sphere-bundle factor over S¹ is excluded by its nontrivial fundamental group.
- The round sphere itself has the identity endpoint diffeomorphism.

*Needs:* 1.1–1.3; 6.2; 12.1; GeometricTopology Layer 1 disc theorem and gluing;
native quotient-cover APIs.

### Examples

A simply connected spherical quotient has trivial covering group.

### Dependencies

Layers 1, 6 and 12; GeometricTopology Layer 1 disc theorem, parameterized connected
sums and collared gluing.

## Layer 14: Compatible smoothing in dimension three

### 14.1. Compatible PL smoothing and native atlas

For every compact Hausdorff topological three-manifold without boundary,
construct a compatible smooth atlas. Consume GeometricTopology Layers 1 and 11
for chart-based PL structures, realization, subdivisions and the
combinatorial/PL comparison, and Layer 11's dimension-three triangulation and
Hauptvermutung theorems (Moise, Theorems 35.3 and 36.2, printed pp. 252–253).
The native `TauCeti.TriangulationConjecture 3` is the closed-case proposition;
consume the stronger compatible combinatorial triangulation supplied by
Moise's theorem to obtain the PL structure. Its underlying realization
predicate is `TauCeti.IsTriangulable`.

For every Hausdorff second-countable PL three-manifold without boundary,
prove here the existence of a compatible smooth structure. Build the
normal-position construction of Cairns, Theorem III, p. 797, proved in §§7–11,
to give the triangulated topological manifold an analytic atlas and hence a
smooth atlas. Cairns's connected/countable convention on p. 796 applies to
each connected component; second countability gives countably many components.

To obtain compatibility with the prescribed PL structure, smoothly triangulate
the resulting smooth manifold using GeometricTopology's smooth-implies-PL comparison (Munkres,
*Elementary Differential Topology*, Theorem 10.6, pp. 103–104). Apply
GeometricTopology Layer 11's Hauptvermutung to obtain a PL homeomorphism from
the prescribed PL manifold to that smooth triangulation, and pull back the
smooth atlas along this homeomorphism. Prove subdivision and overlap
compatibility and preservation of the original topology. Keep triangulation,
compatible PL structure and compatible smooth atlas distinct in the adapter.

Construct `smoothable_closed_three_manifold` as an alternative `ChartedSpace`
on the original `TopologicalSpace M`, with an `IsManifold (𝓡 3) ∞ M` witness,
as in `Suggested.lean`. An explicitly homeomorphic smooth carrier is an
equivalent intermediate presentation; prove its transport to the same-carrier
atlas. Prove compatibility with the original topology and preservation of
compactness, Hausdorffness and the homotopy hypotheses needed by Layer 15.

The smoothing adapter covers disconnected and empty manifolds. Compactness
and local connectedness give finitely many open-and-closed connected
components. Apply the compatible-smoothing theorem componentwise and unite
the compatible atlases; on the empty carrier the smoothness conditions are
vacuous. Compactness and the chart structure also supply paracompactness and
countability.

**API.**

- Compatible smoothing, subdivision/overlap compatibility, topology preservation and
  transport between same-carrier and homeomorphic presentations.

**Checks.**

- The standard sphere returns a compatible smooth atlas.
- Two disjoint spheres are smoothed componentwise; the empty carrier is included.
- Ordinary triangulability alone is kept distinct from the compatible combinatorial/PL input.
- Pullback along the PL homeomorphism gives an atlas compatible with the prescribed PL structure.

*Needs:* GeometricTopology Layers 1 and 11, including Moise 35.3/36.2, and its
smooth-implies-PL comparison; native manifold and realization APIs.

### Examples

The standard sphere returns a compatible smooth atlas.

### Dependencies

GeometricTopology Layers 1 and 11 and its smooth-implies-PL comparison;
native topological and smooth manifold vocabulary.

## Layer 15: Topological endpoint and transport

### 15.1. Topological endpoint and presentation transport

Transport compactness, Hausdorffness, connectedness and simple connectedness
through the Layer 14 identification. Apply Layer 13 to the resulting smooth manifold
and forget the smooth structure of its diffeomorphism to obtain the exact
topological `Homeomorph` endpoint in `Suggested.lean`. A new atlas on the same
topological carrier preserves these properties. Expose the general
homeomorphism/diffeomorphism transport lemmas used in this assembly.

Provide the adapter to GeometricTopology Layer 8's Poincaré statement.
A compatible `MetricSpace` supplies Hausdorffness; an explicit
`SecondCountableTopology` assumption follows already from compactness and
charts. Preserve `T2Space` in the second-countable presentation. Construct a
compatible metrization when passing in the other direction, and prove that
it induces the original topology. These presentations describe the same
closed manifolds. The full geometric torus-decomposition
statement `TauCeti.GeometrizationConjecture` remains the GeometricTopology
target identified in the scope section.

Complete both endpoint proofs in the implementation library by composing the
constructions and theorems in Layers 1–14.

Source: Morgan–Tian, Corollary 0.2(a), together with the smoothing theorem in Layer 14.

**API.**

- Compatible-atlas installation, forgetting diffeomorphisms, compatible metrization and
  exact native endpoint transport.

**Checks.**

- The resulting homeomorphism has the original topology as its source.
- A compatible metric supplies T2Space; countability follows from compactness and charts.
- Second countability alone is kept separate from the Hausdorff hypothesis.

*Needs:* 13.1; 14.1; native Diffeomorph.toHomeomorph and topology transport.

### Examples

The resulting homeomorphism has the original topology as its source.

### Dependencies

Layers 13 and 14; native homeomorphism and diffeomorphism APIs.

## Downstream consumers

GeometricTopology Layer 8 consumes the topological Poincaré endpoint. The
ordinary/spacetime comparisons, localized compactness and ancient-solution
theory in Layers 2–5 serve further Ricci-flow geometry. Layers 6–8 and 12
provide actual surgery, component-transport and finite-history assembly APIs.
Layers 9–11 provide loop-family filling and deformation estimates with explicit
error budgets. Layer 14 supplies compatible smoothing for closed topological
three-manifolds independently of the extinction argument.

## Worked examples

The following examples exercise the two endpoints, the intermediate APIs,
their transport/restriction laws and their estimates:

1. The Euclidean and round-model reduced-volume calculations with the fixed
   normalization, together with parabolic scaling of length/area/volume.
2. A complete pointed ancient limit with explicit exhaustion embeddings and
   the distinction between shrinking models and general ancient solutions.
3. A metric cut/cap operation and a two-event finite surgery prefix whose
   comparison maps and reconstruction refer to the same actual components.
4. Regular nonzero loop-family representatives with raw-competitor width,
   near-minimizers and the corrected family-uniform deformation estimate.
5. The regular-slab ODE comparison, weighted finite-event propagation and
   eventual negativity of the normalized extinction barrier.
6. Compatible smoothing of a topological three-manifold with its original
   topology and the explicit atlas/endpoint transport.

## References

- B. Chow and D. Knopf, [*The Ricci Flow: An Introduction*](https://doi.org/10.1090/surv/110),
  Mathematical Surveys and Monographs 110 (2004): ordinary Ricci flow,
  curvature evolution, maximum principles and pinching estimates for Layer 2.
- B. Chow, S.-C. Chu, D. Glickenstein, C. Guenther, J. Isenberg, T. Ivey,
  D. Knopf, P. Lu, F. Luo and L. Ni, [*The Ricci Flow: Techniques and
  Applications. Part II: Analytic Aspects*](https://doi.org/10.1090/surv/144),
  Mathematical Surveys and Monographs 144 (2008), especially Chapter 15 for
  the Harnack estimates used in Layer 2.
- The same authors, [*The Ricci Flow: Techniques and Applications. Part III:
  Geometric-Analytic Aspects*](https://doi.org/10.1090/surv/163), Mathematical
  Surveys and Monographs 163 (2010): complete noncompact geometry and analytic
  estimates for Layers 2–4, including Chapter 26's distance-smoothing estimates.
- J. Morgan and G. Tian, *Ricci Flow and the Poincaré Conjecture*, Clay
  Mathematics Monographs 3 (2007),
  [published text](https://www.claymath.org/wp-content/uploads/2022/03/Ricci-pdf.pdf):
  ordinary/reduced flow and ancient solutions, surgery and reconstruction,
  Chapters 18–19 for filling-width extinction and curve estimates;
  Corollary 0.2(a) for the smooth endpoint. The
  [arXiv v2](https://arxiv.org/abs/math/0607607v2) is a distinct edition, with
  different pagination.
- J. Morgan and G. Tian,
  [*Correction to Section 19.2*](https://arxiv.org/abs/1512.00699v1):
  the connection variation, linear curvature term and family consequences
  required in Layer 10.
- A. Hatcher, *Algebraic Topology* (2002), §§1.2, 3.3, 4.1 and 4.2:
  van Kampen, manifold duality, Hurewicz and Whitehead.
- C. B. Morrey, [*The problem of Plateau on a Riemannian
  manifold*](https://doi.org/10.2307/1969401), Ann. Math. 49 (1948), 807–851;
  S. Hildebrandt, *Boundary behavior of minimal surfaces*, Arch. Rational
  Mech. Anal. 35 (1969), 47–82: the variational and boundary-regularity
  inputs built in Layer 9.
- J. Jost, *Conformal mappings and the Plateau-Douglas problem in Riemannian
  manifolds*, [J. reine angew. Math. 359 (1985), 37–54](https://doi.org/10.1515/crll.1985.359.37):
  the Riemannian variational framework for the null-loop annulus target.
- G. Perelman, [*The entropy formula for the Ricci flow and its geometric
  applications*](https://arxiv.org/abs/math/0211159),
  [*Ricci flow with surgery on three-manifolds*](https://arxiv.org/abs/math/0303109),
  and [*Finite extinction time for the solutions to the Ricci flow on certain
  three-manifolds*](https://arxiv.org/abs/math/0307245).
- B. Kleiner and J. Lott, [*Notes on Perelman's papers*](https://doi.org/10.2140/gt.2008.12.2587),
  Geometry & Topology 12 (2008), 2587–2858; use the
  [corrected author text](https://math.berkeley.edu/~lott/gt-2008-12-059p.pdf)
  when comparing corrected estimates.
- P. Topping, [*Remarks on Hamilton's Compactness Theorem for Ricci flow*](https://doi.org/10.1515/crelle-2012-0079),
  J. reine angew. Math. 692 (2014), 173–191: completeness hypotheses in Layer 2/Layer 4.
- E. Moise, *Geometric Topology in Dimensions 2 and 3*, GTM 47 (1977),
  Chapters 35–36; A. J. S. Hamilton,
  [*The Triangulation of 3-Manifolds*](https://doi.org/10.1093/qmath/27.1.63),
  Q. J. Math. 27 (1976), 63–70, Theorem 2(1): compatible PL existence.
- S. Cairns, [*Homeomorphisms Between Topological Manifolds and Analytic
  Manifolds*](https://doi.org/10.2307/1968860), Ann. Math. 41 (1940), 796–808,
  Theorem III, p. 797, and its normal-position construction in §§7–11:
  analytic coordinates on triangulated three-manifolds.
- J. Munkres, *Elementary Differential Topology*, Annals of Mathematics
  Studies 54 (1966), Theorems 10.5–10.6, pp. 103–104: uniqueness and existence of
  smooth triangulations, consumed from GeometricTopology's smooth-implies-PL
  comparison in Layer 14.
- M. Hirsch, *Differential Topology*, GTM 33 (1976), Chapter 4 §6,
  Theorem 6.6, p. 117: the disc theorem underlying GeometricTopology Layer 1's
  independence of the ball embeddings in connected sum.

Prior Lean formalizations include
[frenzymath/PoincareConjecture](https://github.com/frenzymath/PoincareConjecture)
and its [LeanEval submission](https://github.com/frenzymath/lean-eval-submissions).

# Three-dimensional Poincaré through Ricci flow with surgery

Develop Ricci flow with surgery on closed orientable three-manifolds, its finite
extinction for simply connected initial manifolds, and reconstruction of the
initial manifold from the actual finite surgery history. The resulting library
proves the smooth and topological three-dimensional Poincaré theorems. Its reusable
outputs include reduced geometry, ancient-solution compactness, canonical
neighborhoods, metric surgery, loop-family filling width, and finite-history
topological reconstruction.

The mathematical specification is this document. [Suggested.lean](Suggested.lean)
prototypes selected interfaces. P1–P15 specify the required mathematics.

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
This roadmap owns the Ricci-surgery proof programme described here. Use its
manifold, collar, gluing, connected-sum, and PL carriers throughout.

| Supplier | Exact material consumed | Material owned here |
| --- | --- | --- |
| [GeometricTopology](../GeometricTopology/README.md), Layers 1, 2, 7, 11 and smoothing comparison | Smooth/PL manifolds, collars, gluing, connected sum, locally flat embeddings, geometric structures, triangulation/realization and smooth triangulation | The three-dimensional neck/cap consequences, actual Ricci surgery and reconstruction, dimension-three compatible PL/smooth existence in P14 |
| [AlgebraicTopology](../AlgebraicTopology/README.md), Stages 1–6 and 8 | van Kampen, finite CW comparison, homology/cohomology, integral manifold duality, Hurewicz, relative homotopy, higher-group comparison | Closed-three-manifold consequences, regular loop-family comparison, surgery ancestry and class transport |
| [DifferentialGeometry](../DifferentialGeometry/README.md), Layers 0–3, 5–10, 12 | Tensor/form calculus, orientations, smooth flows, Sard, integration/Stokes, metric density and scalar operators | Ricci-flow and moving-curve specializations |
| [HopfRinow](../HopfRinow/README.md), Layers 0–4 | Levi-Civita connection, geodesic flow, normal balls, length and metric completeness | Time-dependent comparisons, reduced paths, complete pointed flow limits |
| [RiemannianGeometry](../RiemannianGeometry/README.md), R1–R5a and R7.0 | Tensor/curvature conventions, variations, Jacobi fields, comparison geometry, model metrics, immersion area calculus and scalar Bochner identity | Ricci-surgery estimates, branched sphere/filling analysis and curve shortening in a moving ambient three-manifold |
| [PDE](../PDE/README.md), Lanes A, C–F; [ComplexKahlerGeometry](../ComplexKahlerGeometry/README.md), K5a | Sobolev/weak compactness, elliptic/parabolic regularity, scalar maximum principles and real compact-bundle Sobolev/elliptic theory | The noncompact cap construction and moving-curve nonlinear problems, with their extra localization/compactness estimates |
| [RicciFlow, R1–R5](https://github.com/TauCetiProject/TauCetiRoadmap/blob/544d4ff582d69f200582787ba09a29de3abfe359/TauCetiRoadmap/RicciFlow/README.md) | Metric variation, compact-bundle parabolic theory, DeTurck, compact-flow existence/uniqueness/continuation, global Shi estimates and curvature evolution/maximum principles on closed manifolds | Localized Shi estimates and their complete noncompact applications in P2, Hamilton–Ivey and differential Harnack specializations, pointed compactness, reduced geometry, ancient solutions and all surgery/extinction targets below |

The last row cites the explicit supplier contract in the RicciFlow proposal. The other rows refer to the corresponding merged roadmap targets.

Generic curve shortening of embedded curves on a fixed surface belongs to
RiemannianGeometry R4.9. P10 treats immersed loops and ramps in a
time-dependent ambient manifold and the family estimates needed for filling
width. Generic rectifiability and the area formula are consumed from
[GeometricMeasureTheory G1–G2](../GeometricMeasureTheory/README.md).
P9 owns the harmonic-sphere, filling-area and regular-representative bridges
needed here.

## Existing floor and conventions

Start from Mathlib's `ChartedSpace`, `IsManifold`, `TangentBundle`,
`Bundle.ContMDiffRiemannianMetric`, `Diffeomorph`, `Homeomorph`, `Path`,
`ContinuousMap.HomotopyEquiv`, `HomotopyGroup.Pi`, singular homology, native
covering-space and measure/integration interfaces. For metrics, use the
`RiemannianBundle` mechanism or metric-indexed type synonyms when induced norms
are needed. Keep instances for a selected metric local to its constructions.
Import the actual Tau Ceti covariant-derivative, curvature, geodesic and covering
APIs when using them.

Identify the chosen metric's Levi-Civita connection with the native connection
on differentiable vector fields, and prove the curvature evaluation, slot-order,
Ricci contraction and scalar-trace identities. Prove that the calibrated
intrinsic Hausdorff volume used for metric balls agrees with the native
Riemannian volume defined by chart densities. Use these identities in the
normalization, comparison and flow estimates.

Follow Mathlib's developing metric and covariant-derivative interfaces,
including [metric existence](https://github.com/leanprover-community/mathlib4/pull/33714)
and [curvature](https://github.com/leanprover-community/mathlib4/pull/45069).
The [round-sphere metric experiment](https://github.com/leanprover-community/mathlib4/pull/43657)
provides prior art for pullbacks along immersions. Use the native metric and
supplier model-geometry APIs, and adopt the resulting Mathlib interfaces as
they land. Develop missing mathematics in Tau Ceti under the supplier targets
specified above.

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

## Dependency order

| Layer | Local predecessors | Principal output |
| --- | --- | --- |
| P1 | none | Closed-three-manifold topology, models and metric normalization |
| P2 | P1 | Flow adapters, localized derivative estimates, pinching, Harnack and pointed compactness |
| P3 | P2 | Ordinary/spacetime reduced geometry and noncollapse |
| P4 | P2, P3 | Ancient κ-solutions and shrinking asymptotic models |
| P5 | P4 | Canonical neighborhoods and singular-time geometry |
| P6 | P1, P2, P5 | Standard cap, actual metric surgery and local comparison |
| P7 | P3, P5, P6 | Global controlled surgery flow |
| P8 | P1, P6, P7 | Finite component ancestry and homotopy transport |
| P9 | P1 | Regular loop families, filling area and width |
| P10 | P2, P9 | Corrected moving-curve/ramp estimates and family deformation |
| P11 | P7, P8, P9, P10 | Width comparison and finite extinction |
| P12 | P1, P6, P7, P11 | Reconstruction from finite actual surgery history |
| P13 | P1, P12 | Classification of simply connected factors; smooth endpoint |
| P14 | none | Compatible smoothing of closed connected topological three-manifolds |
| P15 | P13, P14 | Topological endpoint and hypothesis transport |

Each row also consumes the exact external suppliers named above. The topology
and smoothing branches start from their algebraic-topology and PL suppliers.
The width branch can be built independently of surgery existence until P11
joins them. P6 defines local operations before P7 proves they can be iterated,
and P11 uses the flow constructed by P7.

## P1. Closed topology, models and normalization

Use the external gluing/finite-CW/duality suppliers to prove that a closed
simply connected smooth three-manifold is orientable and has
`H₀≅ℤ`, `H₁=H₂=0`, `H₃≅ℤ`, `π₂=0` and `π₃≅ℤ`. Include the comparison between
singular and cellular computations and their basepoint/naturality statements.
Hurewicz and Whitehead give a homotopy equivalence with the three-sphere.
Prove that an orientable three-manifold contains no embedded
two-sided projective plane, using its normal orientation and the induced
orientation on a two-sided hypersurface.

Construct the round three-sphere, its finite free isometric quotients, the round
cylinder, the ball cap and punctured `RP³` models in the existing smooth/gluing
vocabulary. Prove their smoothness, completeness where appropriate, curvature,
orientation and fundamental-group computations. Include the orientable
`S²`-bundle over `S¹`, its projection and nontrivial fundamental group; use the
bundle classification to identify the orientable total-space case.

Construct a smooth metric on every closed smooth manifold using the supplier's
partition-of-unity API. For a closed three-manifold, prove that a constant
rescaling produces a metric with `|Rm|≤1`, curvature-operator minimum `ν≥-1`,
and

`∀ x, ∀ r, 0<r≤1 → vol(B(x,r)) ≥ (1/2) ω₃ r³`,

where `ω₃` is the Euclidean unit-ball volume. Derive this uniform-in-center,
all-small-radii estimate from smooth normal coordinates and compactness.
Construct the normalized metric from the closed smooth manifold and establish
pullback and scaling laws for every condition.

Completion checks include the exact round sphere/quotient models, the small-ball
volume limit, the normalized metric construction, and the closed homotopy-sphere
calculation.

## P2. Ordinary flow estimates and complete pointed compactness

Consume RicciFlow R1–R5 for compact initial-value theory, continuation, global
Shi estimates on closed manifolds and curvature evolution. Prove the adapters
between that flow carrier, the metrics selected in P1 and the conventions above. The compact
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
estimates to supply the derivative hypotheses for P2 compactness in P4–P5
and for the standard-cap exhaustion in P6.

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

## P3. Reduced geometry, spacetime and noncollapse

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

Define `κ`-noncollapse at scales below `r₀` by
`vol B(x,r)≥κrⁿ` on the specified curvature-controlled parabolic balls with
`0<r≤r₀`. Prove ordinary finite-time no-local-collapsing and its local/spacetime
versions from the reduced-volume estimates. Constants depend explicitly on
initial geometry, time horizon, dimension and scale bounds. Keep the stronger
all-scale ancient hypothesis separate from finite-horizon noncollapse.
The Euclidean reduced-volume calculation, shrinking models, positive-start
conversion and scale invariance are acceptance examples.

## P4. Ancient κ-solutions and shrinking asymptotic models

An ancient `κ`-solution is a complete nonflat flow on `(-∞,0]` with bounded
curvature on compact time slabs, nonnegative curvature operator, positive scalar
curvature and `κ`-noncollapse on all scales. Develop its pointed/isometric,
restriction and rescaling API, together with the positivity consequences of
the strong maximum principle.

Construct backward blowdown sequences at reduced-distance-controlled points.
Prove the required curvature, distance, noncollapse and injectivity estimates,
then apply P2's localized derivative estimates and compactness, and P3
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

## P5. Canonical neighborhoods and singular-time geometry

Prove the topology of overlapping necks and caps, neck-chain continuation,
sphere-bundle alternatives and finite covers of compact canonical components.
Use the embeddings and collars from P1 and GeometricTopology, and prove that
the coordinate changes describe the same regions in the actual manifold.

Produce a universal `0<ε₀≤10⁻³` such that for every `0<ε≤ε₀` there are
constants `C(ε)≥1` and derivative, volume and neighborhood-radius bounds
with the following property. For every normalized ancient solution outside
the `RP²×ℝ` shrinking-cylinder branch, each point lies in an `ε`-neck, an
`ε`-cap or a compact positively curved component with the stated bounds.
Retain the `RP²×ℝ` branch in the general ancient alternative, and prove its
exclusion for the orientable pointed limits used by surgery, using P1 and
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

For ordinary three-dimensional flows with Hamilton–Ivey pinching, prove the
bounded-distance curvature estimates and the high-curvature canonical
neighborhood theorem on a finite time horizon, using a point-picking
construction, P2's localized derivative estimates and complete pointed blowup
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

## P6. Standard cap and actual metric surgery

Construct the class of rotationally symmetric complete standard cap metrics
on `ℝ³` with nonnegative curvature and an exactly round cylindrical end of
scalar curvature one. In polar coordinates write `dr²+f(r)²g_(S²)`, with
`f(0)=0`, `f′(0)=1`, the odd smooth extension at zero, `f>0` for `r>0`,
`0≤f′≤1`, `f″≤0` and `f=√2` beyond a finite radius. Require a round tip of
sectional curvature `1/4`: on some interval `0≤r<r_tip` with `r_tip>0`,
`f(r)=2 sin(r/2)`. Prove this class is
nonempty and prove the metric/curvature assertions, including smoothness at
the tip. For each such initial metric construct its complete
bounded-curvature Ricci flow by exhaustion, P2's localized derivative estimates
and local parabolic existence estimates. Prove uniqueness among complete
solutions with curvature bounded on compact
time slabs, and prove its curvature, asymptotic-cylinder and
canonical-neighborhood estimates on `[0,1)`, with maximal time one. State
which constants depend on the chosen cap profile. Include the noncompact
existence and exhaustion arguments as part of this construction.

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

Prove continuation after a cut, including the case of an empty post-slice,
compatibility with ordinary-flow restart and persistence of the inserted cap
on its controlled parabolic region. Construct the local surgery and
continuation data from the stated geometric hypotheses.

## P7. Controlled schedules and global surgery flow

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

## P8. Component ancestry and homotopy transport

Prove separation by embedded spheres in a closed simply connected
three-manifold from duality and van Kampen. Compute fundamental groups of
the actual connected-sum/cap operations, including injections of factor groups
into the free product. Deduce simple connectedness of every surviving child
component, and of the factors in each finite reconstruction. Identify and
transport basepoints by explicit paths when the comparison map moves them.

For any surviving component at time `T`, construct its finite ordered ancestry
back to a component at time zero, using P7 local finiteness. Specify its actual
component inclusions, epoch transports, event parents and comparison maps.
Prove that transport sends the selected component onto a full component and
that adjacent path segments and endpoint identifications agree. Build
composition and restriction laws for the resulting homotopy maps.

Construct the native higher-homotopy class transport used by P11 across
this same ancestry. Prove preservation of a nonzero class under the relevant
parent/child maps, together with basepoint-change and composition laws.
P9 supplies the natural comparison with regular loop-family representatives;
construct the continuous higher-homotopy maps here using the native homotopy
groups. Choose an initial nonzero class and prove the transport results for
that fixed class uniformly in the final time.

## P9. Regular loop families, filling area and width

For closed smooth Riemannian manifolds, construct the `C¹` free-loop space and
its topology from the native smooth-map/path carriers, with evaluation,
constant loops, reparametrization and continuous family/homotopy APIs. Prove
relative parametric smoothing and the comparison with the continuous loop
space. Use AlgebraicTopology Stage 8's loop/homotopy comparison; for a simply
connected three-manifold with `π₂=0`, identify
`π₂(Λ₀M,const_x)≅π₃(M,x)`, where `Λ₀M` is the nullhomotopic-loop component.
Prove naturality, basepoint-change laws and existence of regular representatives
in this component.

Define the area of a Lipschitz spanning disk by integrating its metric
two-Jacobian, and energy by `1/2 ∫|df|²`. For a nullhomotopic `C¹` loop `γ`,
define `Fill_g(γ)` as the infimum of areas of all such spanning disks with the
specified boundary parametrization. Prove nonemptiness, finiteness,
nonnegativity, comparison with every disk, and `ε`-near-minimizers. Prove the
reparametrization law and continuity on null loops in the chosen `C¹` topology.
Establish uniform small-loop filling estimates on compact manifolds using
normal balls and actual disk maps. Prove the annulus-gluing inequality for
two nearby loops with a displayed spanning annulus and its area.

Construct the variational disk and annulus results used by that comparison and
P10's deformation proof. For a nullhomotopic embedded `C²` loop in a closed
Riemannian manifold with `π₂=0`, prove existence of an area-minimizing spanning
disk, with the weak conformality, interior branched harmonic regularity and
boundary regularity required by its curvature/area estimates. Boundary values
are allowed monotone circle reparametrizations, with the precise normalization
and nondegeneracy conditions included in the variational problem. Construct
annular near-minimizers and the modulus estimates used for ramp comparison.
For disjoint embedded nullhomotopic `C²` boundary loops, prove annular
attainment under the strict Douglas gap
`inf Area(annuli) < Fill_g(γ₀)+Fill_g(γ₁)`; include boundary parametrizations
and the modulus compactness proof. Establish the comparison for general nearby
loops using spanning annuli and near-minimizers. Prove approximation back to
the original `C¹` competitors. This layer owns these nonlinear existence and
regularity results.

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
transported class in P10–P11, together with finiteness and nonnegativity of its
width and the family-deformation estimates.

## P10. Moving-curve estimates, ramps and family deformation

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

Construct the ramp curves in `M×S¹` with the small circle metric, their local
flows, angle/length/curvature control and continuation on the controlled slab.
Prove annular comparison of the projected loops, with errors tending to zero
in the ramp parameter and with quantitative bounds uniform over a fixed compact
parameter family. Construct polygonal approximation, compatible smoothing and
finite nets of loop families in the topology actually used for these estimates.

Assemble family deformation preserving the relevant homotopy class, with all
small-loop, filling-area and annulus errors displayed. Prove the deformation
estimate for almost minimizing families, with explicit approximation errors.
The output is the deformation estimate needed for P11's forward width
inequality, uniformly in the family parameter and on the specified time slab.
Use [the retained correction](https://arxiv.org/abs/1512.00699v1), including its
consequences for the family estimates.

## P11. Width comparison and finite extinction

For a transported nonzero class on a smooth epoch, prove continuity and the
upper forward-difference estimate

`D⁺W(t) ≤ -2π - (R_min(t)/2) W(t)`.

Here `D⁺` is the upper right Dini derivative: express the inequality by
`∀η>0, ∃δ>0, ∀0<h<δ` within the epoch, the forward quotient is at most the
displayed bound plus `η`. Using P2's scalar bound and `W≥0`, deduce

`D⁺W(t) ≤ -2π + 3W(t)/(1+4t)`.

Prove the regular-slab comparison theorem for continuous functions satisfying
this forward estimate, including endpoint restrictions and restarting at any
nonnegative time. The integrating factor is `(1+4t)^(-3/4)`. For zero event
errors and initial width `W₀`, the comparison profile is

`G(t)=(W₀+2π)(1+4t)^(3/4)-2π(1+4t)`.

Across each actual surgery event, construct the representative comparison on
the child/parent path from P8 and prove the width jump bound from P6's metric
and homotopy comparison. Give the nonnegative event error `e_j` explicitly
and choose P7's accuracy schedule so the total **weighted** error
`Σ_j (1+4t_j)^(-3/4)e_j` is bounded by a prescribed finite `E`. If a construction
gives exact nonincrease, prove that case with `e_j=0`. Prove the
weighted-budget selection lemma and its compatibility with the canonical
neighborhood/noncollapse requirements on the same schedule.

For every surviving component at time `T`, use its P8 ancestry to compare its
nonnegative width to the **fixed initial class** and obtain

`(1+4T)^(-3/4) W(T) ≤ W₀ + E - 2π((1+4T)^(1/4)-1)`.

Prove finite-piece propagation through the locally finite event set, including
left/right event limits and restarts. The right side is negative for all
sufficiently large `T`. Thus the global flow constructed in P7 is empty after
a finite time when its initial manifold is simply connected. Express the
extinction-time bound in terms of the normalized initial width and chosen
error budget.

The existence/extinction theorem constructs a flow satisfying the budget and
the P7 controls and proves finite extinction for that flow.

## P12. Reconstruction from the actual finite history

P7 local finiteness and P11 finite extinction give a finite complete event
history. Define its finite ancestry/assembly index using actual surviving,
discarded and capped components. Construct the immediate-successor relation
and identify each transported survivor with the full pre-component at its next
event. Prove terminal absence of survivors and the exact reindexing equivalences
when substituting one local decomposition into another.

At each event prove a smooth connected-sum reconstruction of the pre-slice
from the actual post-slice and discarded elementary factors. Use the collared
gluing maps and metrics' unchanged-region identifications from P6. Reverse
induction on the finite event order gives a smooth identification of the
initial manifold with an iterated connected sum of the spherical-spaceform and
`S²`-bundle factors. Multi-cap discarded components are decomposed by their
proved elementary topology.

Provide the identity, composition, substitution and finite-reindexing laws for
these assembly maps. Prove the fundamental-group factor injections for this
actual assembly using P8. Develop the geometric assembly maps and their finite
indexing with explicit compatibility lemmas.

## P13. Factor classification and the smooth endpoint

For simply connected initial data, transport simple connectedness through the
initial identification, the reconstructed connected sum and its factor-group
injections. Exclude each sphere-bundle factor using its nontrivial fundamental
group. For a spherical-spaceform factor prove that simple connectedness forces
the covering degree to be one and construct a diffeomorphism with the unit
round sphere using the quotient cover.

Prove the smooth sphere connected-sum identity for the collared ball embeddings
and gluing maps occurring in P12. Supply the dimension-two sphere boundary
diffeomorphism extension/isotopy result needed to extend the gluing over a
three-ball, consuming GeometricTopology's gluing API.
Induct on the finite assembly while keeping smooth identifications of untouched
components. Connectedness and nonemptiness give one final sphere.

Assemble `poincare_3d_smooth` with exactly the hypotheses displayed in
`Suggested.lean`. Choose the initial metric and normalized scale, construct the
budget-compatible flow, prove its extinction, reconstruct it and classify its
factors. Quantify over the closed simply connected smooth manifold in the
endpoint theorem. Also expose the preceding reconstruction and factor theorems
as reusable library results with their weaker hypotheses.

## P14. Compatible smoothing in dimension three

For every compact Hausdorff connected topological three-manifold without
boundary, construct a compatible smooth atlas. Consume GeometricTopology
Layers 1 and 11 for chart-based PL structures, locally finite complexes,
realization, subdivisions and the PL/combinatorial comparison; consume its
smooth triangulation theory where the comparison requires it.

Prove dimension-three compatible PL existence (Moise/Hamilton), including the
local interpolation and relative gluing/extension results required by the
proof. Construct the link-controlled triangulation, its compatible PL
structure and its identification with the original topology. This layer owns
these dimension-three existence results.

Prove the dimension-three PL-to-smooth existence theorem (Cairns), with the
relative simplex/handle smoothing and compatibility on overlaps needed to
construct a smooth atlas. Prove that its chart topology is the original
topology. Compactness supplies paracompactness and countability, and the
connected hypothesis matches the source convention. The target is existence
of a compatible smoothing in dimension three.

The output may choose a new `ChartedSpace` on the same topological carrier,
as in `Suggested.lean`, or produce an explicitly homeomorphic smooth carrier
and the transport theorem between these presentations. Prove smoothness of
the chosen atlas and its compatibility with the original topology. Distinguish
smooth triangulation, compatible PL structure and compatible smooth atlas in
both the definitions and the comparison proofs.

## P15. Topological endpoint and transport

Transport compactness, Hausdorffness, connectedness and simple connectedness
through the P14 identification. Apply P13 to the resulting smooth manifold
and forget the smooth structure of its diffeomorphism to obtain the exact
topological `Homeomorph` endpoint in `Suggested.lean`. A new atlas on the same
topological carrier preserves these properties. Expose the general
homeomorphism/diffeomorphism transport lemmas used in this assembly.

Complete both endpoint proofs in the implementation library by composing the
constructions and theorems in P1–P14.

## Completion examples

Each introduced object comes with its basic usable API, transport/restriction
laws and the estimates stated in its layer. In addition to the two endpoints,
the completed development demonstrates:

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

## Mathematical references

- B. Chow and D. Knopf, [*The Ricci Flow: An Introduction*](https://doi.org/10.1090/surv/110),
  Mathematical Surveys and Monographs 110 (2004): ordinary Ricci flow,
  curvature evolution, maximum principles and pinching estimates for P2.
- B. Chow, S.-C. Chu, D. Glickenstein, C. Guenther, J. Isenberg, T. Ivey,
  D. Knopf, P. Lu, F. Luo and L. Ni, [*The Ricci Flow: Techniques and
  Applications. Part II: Analytic Aspects*](https://doi.org/10.1090/surv/144),
  Mathematical Surveys and Monographs 144 (2008), especially Chapter 15 for
  the Harnack estimates used in P2.
- The same authors, [*The Ricci Flow: Techniques and Applications. Part III:
  Geometric-Analytic Aspects*](https://doi.org/10.1090/surv/163), Mathematical
  Surveys and Monographs 163 (2010): complete noncompact geometry and analytic
  estimates for P2–P4, including Chapter 26's distance-smoothing estimates.
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
  required in P10.
- G. Perelman, [*The entropy formula for the Ricci flow and its geometric
  applications*](https://arxiv.org/abs/math/0211159),
  [*Ricci flow with surgery on three-manifolds*](https://arxiv.org/abs/math/0303109),
  and [*Finite extinction time for the solutions to the Ricci flow on certain
  three-manifolds*](https://arxiv.org/abs/math/0307245).
- B. Kleiner and J. Lott, [*Notes on Perelman's papers*](https://doi.org/10.2140/gt.2008.12.2587),
  Geometry & Topology 12 (2008), 2587–2855; use the
  [corrected author text](https://math.berkeley.edu/~lott/gt-2008-12-059p.pdf)
  when comparing corrected estimates.
- P. Topping, [*Remarks on Hamilton's Compactness Theorem for Ricci flow*](https://doi.org/10.1515/crelle-2012-0079),
  J. reine angew. Math. 692 (2014), 173–191: completeness hypotheses in P2/P4.
- E. Moise, *Geometric Topology in Dimensions 2 and 3*, GTM 47 (1977),
  Chapters 35–36; A. J. S. Hamilton,
  [*The Triangulation of 3-Manifolds*](https://doi.org/10.1093/qmath/27.1.63),
  Q. J. Math. 27 (1976), 63–70, Theorem 2(1): compatible PL existence.
- S. Cairns, [*Homeomorphisms Between Topological Manifolds and Analytic
  Manifolds*](https://doi.org/10.2307/1968860), Ann. Math. 41 (1940), 796–808,
  Theorem III: dimension-three compatible smoothing.

## Existing Lean formalizations

- [frenzymath/PoincareConjecture](https://github.com/frenzymath/PoincareConjecture),
  [revision `62db01a`](https://github.com/frenzymath/PoincareConjecture/tree/62db01af9388dc1d9b56b66d6674f4c09b2318a2):
  the subject-organized `PoincareLib` and its smooth and topological endpoint
  interfaces, following Morgan–Tian.
- [PoincareLib in the LeanEval submission](https://github.com/frenzymath/lean-eval-submissions/tree/1038df99f5fcbe6d11054afa3495167dc3eb696c/submissions/poincare_3d_smooth/Submission/PoincareLib),
  revision `1038df9`: the migrated library used by the benchmark submission.

These implementations provide definitions, proofs and estimates for reuse and
adaptation to the supplier APIs and targets specified above. Preserve the
applicable source notices and attribution when integrating their code.

# Roadmap: geodesics, the exponential map, and the Hopf–Rinow theorem

Mathlib's Riemannian library has the metric-and-distance layer: `RiemannianBundle`,
`IsRiemannianManifold`, and `EMetricSpace.ofRiemannianMetric` live in
`Mathlib/Geometry/Manifold/Riemannian/Basic.lean`, while `Manifold.pathELength` and
`Manifold.riemannianEDist` live in `Mathlib/Geometry/Manifold/Riemannian/PathELength.lean`.
Mathlib also has general covariant derivatives and their torsion. What remains is the
Riemannian connection-and-geodesic layer: metric compatibility and the Levi-Civita theorem,
covariant differentiation along curves, geodesics and their flow, the exponential map, and
geodesic completeness. Without that layer, Hopf–Rinow — which ties metric completeness of a
Riemannian manifold to the global existence of its geodesics — cannot yet be stated.

Suggested home: `TauCeti/Geometry/Manifold/Riemannian/Geodesic/`. Shared connection and
local-diffeomorphism prerequisites belong under `TauCeti/Geometry/Manifold/`, but their delivery
is explicitly owned by this roadmap rather than deferred to another roadmap. In particular, this
roadmap owns the Levi-Civita connection, geodesics and their flow, exponential maps and their local
inverse logarithms, and Hopf--Rinow. The [Geometric Topology
roadmap](../GeometricTopology/README.md) consumes the connection to build curvature and volume;
the [Optimal Transport roadmap](../OptimalTransport/README.md) consumes the exponential,
logarithm, completeness, and minimizing-geodesic APIs and owns the subsequent cut-locus and
transport-specific theory.

The target is do Carmo, *Riemannian Geometry*, Chapter 7 §2, Theorem 2.8 with Corollary 2.9,
stated under that chapter's standing assumption that `M` is **connected** (do Carmo carries this
as a chapter convention rather than in the theorem line; it is load-bearing — see Standing
hypotheses). Paraphrased in the roadmap's normalized notation:

> Let `M` be a (connected) Riemannian manifold and let `p ∈ M`. The following assertions are
> equivalent: **(a)** `exp_p` is defined on all of `T_p M`; **(b)** the closed and bounded sets of
> `M` are compact; **(c)** `M` is complete as a metric space; **(d)** `M` is geodesically
> complete; **(e)** there exists a sequence of compact sets `K_n ⊆ K_{n+1}`, `⋃ K_n = M`, such
> that `q_n ∉ K_n ⇒ d(p, q_n) → ∞`. In addition, each of the above implies **(f)**: for any
> `q ∈ M` there is a geodesic `γ` joining `p` to `q` with `ℓ(γ) = d(p, q)`.

The headline is one milestone inside a fuller development: the geodesic equation and its ODE
theory, the exponential map, normal neighbourhoods and the Gauss lemma, and the
minimizing-geodesic theory are all wanted here, each with its own basic API, not only the two
implications the equivalence turns on.

## Standing hypotheses

Spell hypotheses out; do not bundle them. Work over a finite-dimensional real model
(`[FiniteDimensional ℝ E]`) with the following conventions.

- **Smoothness.** The manifold and its Riemannian metric are `C^∞`: use
  `[IsManifold I ∞ M]`, `[Bundle.RiemannianBundle (fun x : M ↦ TangentSpace I x)]`, and
  `[IsContMDiffRiemannianBundle I ∞ E (fun x : M ↦ TangentSpace I x)]`.
- **No boundary** is the explicit model-space hypothesis `[I.Boundaryless]`.
- **Topology, Hausdorffness, and separation.** Require `[T2Space M]` explicitly in topological
  statements; a genuine `[EMetricSpace M]` or `[MetricSpace M]` supplies both the topology and
  this instance, so do not add an independent `[TopologicalSpace M]`. When constructing
  `EMetricSpace.ofRiemannianMetric` from the manifold topology, assume `[T3Space M]`; the
  pseudo-emetric construction instead assumes `[RegularSpace M]`.
- **Connectedness** (`[ConnectedSpace M]`) is load-bearing and stated explicitly wherever used:
  without it the distance is not finite and assertion (f) fails across components. The purely
  local geodesic theory (Layers 1–2) does not need it; the equivalence and (f) (Layers 3–4) do.
- **The ambient distance is the Riemannian distance.** For abstract theory, use an existing
  `[EMetricSpace M]` or `[MetricSpace M]` together with `[IsRiemannianManifold I M]`; its field
  `IsRiemannianManifold.out` identifies `edist` with `Manifold.riemannianEDist`. For construction,
  start from the manifold topology and `[T3Space M]`, install
  `EMetricSpace.ofRiemannianMetric`, prove global finiteness under `[ConnectedSpace M]`, and only
  then expose the compatible ordinary `MetricSpace` structure. Do not introduce a private
  compatibility predicate. There is no positive-dimension assumption: the connected
  zero-dimensional case remains part of the public theorem.

## What Mathlib already has (consume)

- **Manifolds and tangent bundles.** `ModelWithCorners`, `IsManifold`, `TangentBundle`,
  `TangentSpace`, `ContMDiff`, `mfderiv`, charts/`extChartAt`
  (`Mathlib/Geometry/Manifold/`).
- **The metric-level Riemannian API.** `RiemannianBundle`, `IsRiemannianManifold`, and
  `EMetricSpace.ofRiemannianMetric` (`Mathlib/Geometry/Manifold/Riemannian/Basic.lean`), together
  with `Manifold.pathELength` and `Manifold.riemannianEDist`
  (`Mathlib/Geometry/Manifold/Riemannian/PathELength.lean`). The latter is defined as the infimum
  of lengths of `C^1` paths and is the distance object Layer 0 must reconcile with the piecewise
  `C^1` formulation.
- **General covariant derivatives.** `IsCovariantDerivativeOn`, the bundled
  `CovariantDerivative`, `ContMDiffCovariantDerivative`, and the difference of two connections
  as an endomorphism-valued one-form
  (`Mathlib/Geometry/Manifold/VectorBundle/CovariantDerivative/Basic.lean`), together with the
  torsion tensor and `CovariantDerivative.torsion_eq_zero_iff`
  (`.../CovariantDerivative/Torsion.lean`).
- **Completeness and properness.** `CompleteSpace`, `ProperSpace`, the instances
  `complete_of_proper` and `proper_of_compact`, `Metric.isCompact_iff_isClosed_bounded` (under
  `[T2Space M]`), `IsClosed.completeSpace_coe`, and the Cauchy/total-boundedness API
  (`Mathlib/Topology/MetricSpace/`, `.../EMetricSpace/`, and `.../UniformSpace/`). Assertion (b)
  is `ProperSpace M`; (c) is `CompleteSpace M`. Consume these results rather than restating them
  as Riemannian milestones.
- **ODE estimates and local solutions.** `Mathlib/Analysis/ODE/` supplies Picard–Lindelöf local
  existence, `ODE_solution_unique*`, Gronwall estimates, and Lipschitz dependence on initial
  conditions. It does not yet supply `C^k` dependence, flows, or maximal intervals.
- **Integral curves on manifolds.** `IsIntegralCurve`, existence and uniqueness, transformation
  lemmas, and a uniform-time theorem for local integral curves
  (`Mathlib/Geometry/Manifold/IntegralCurve/{Basic,ExistUnique,Transform,UniformTime}.lean`). The
  geodesic spray should be connected to this API rather than developed solely in model-space ODE
  terms.

## What is missing (build here)

Metric compatibility for a covariant derivative and existence and uniqueness of the
Levi-Civita connection; the pullback connection and covariant differentiation along a curve;
the geodesic spray, its smooth local flow, and maximal intervals of existence; an interval-aware
geodesic predicate carrying its parameter set and initial data; constant speed; the exponential
map and its domain; the manifold inverse-function theorem needed for normal coordinates; normal
neighbourhoods and their local inverse logarithms, the Gauss lemma, and minimizing geodesic
segments; geodesic completeness; and the Hopf–Rinow equivalence itself. Open-submanifold metric
restriction and metric-level length-space and geodesic-space interfaces are also missing. The
roadmap must consume the general connection, torsion, ODE, and integral-curve APIs above while
building these results.

## Prior art and coordination

There is active Mathlib work on the substrate this roadmap needs:

- [mathlib4#36036](https://github.com/leanprover-community/mathlib4/pull/36036) coordinates work
  on connections and geodesics, and
  [mathlib4#36845](https://github.com/leanprover-community/mathlib4/pull/36845) develops the
  Levi-Civita connection on a manifold.
- [mathlib4#26413](https://github.com/leanprover-community/mathlib4/pull/26413) develops maximal
  solutions under Picard–Lindelöf hypotheses,
  [mathlib4#26394](https://github.com/leanprover-community/mathlib4/pull/26394) develops local
  flows on manifolds, and
  [mathlib4#40062](https://github.com/leanprover-community/mathlib4/pull/40062) restates ODE
  existence and uniqueness through the integral-curve API.

These are in-flight dependencies, not facts to assume from the pinned Mathlib. Before beginning
the overlapping milestones, check their status, follow any API that has landed, coordinate with
their authors, and keep unavoidable local definitions as temporary shims to remove after
upstreaming.

### Existing implementation provenance (secondary)

The author's public
[`frenzymath/Poincare-Conjecture`](https://github.com/frenzymath/Poincare-Conjecture) repository
is licensed under Apache-2.0 and contains a Hopf–Rinow development. It is prior art rather than a
Tau Ceti dependency or specification: the mathematical milestones below are intrinsic, and the
Tau Ceti API must be reviewed against current Mathlib rather than copied wholesale. The relevant
provenance under `formalized-sources/DoCarmo/` is concentrated in:

- `DoCarmoLib/Riemannian/Geodesic/CovariantDerivative.lean`, `Equation.lean`, and
  `Existence.lean` for along-curve differentiation and the geodesic equation;
- `DoCarmoLib/Riemannian/Geodesic/FlowCInftyDependence.lean` and `MaximalInterval.lean` for flow
  regularity and maximal domains;
- `DoCarmoLib/Riemannian/Exponential/{Defs,Intrinsic,StrictDerivative,CInftyBall}.lean` for the
  exponential map, its interval-aware domain, its derivative at zero, and its local inverse;
- `DoCarmoLib/Riemannian/Exponential/{GaussLemma,NormalBallEDist}.lean` and
  `DoCarmoLib/Riemannian/Variation/FirstVariation.lean` for radial comparison, the escape
  estimate, and variation theory; and
- `DoCarmoLib/Riemannian/Geodesic/{Completeness,HopfRinow}.lean` for completeness and the
  headline theorem.

Coordination outcome for this roadmap PR: the roadmap author also owns that repository and agrees
that it may be used as prior art and adapted under Apache-2.0; no source from it is being
integrated or copied in this PR. Before a later implementation ports or adapts it, the implementor
must coordinate with the Mathlib contributors, record the source revision and Apache-2.0
attribution, and agree which parts should instead be replaced by the upstream work listed above.

---

## The build, in layers

As each layer makes the next layer's *types* expressible in `TauCeti/`, state its milestones in
`Suggested.lean` (with `sorry`).

### Layer 0: the reconciled Riemannian distance
- **Existing `C¹` length algebra (consume):** use `Manifold.pathELength_add` for subdivision and
  `Manifold.pathELength_comp_of_monotoneOn` for differentiable monotone reparametrizations. Do not
  reprove either result in a piecewise-length wrapper.
- **Regular reparametrization and limits:** prove constant-speed reparametrization for a regular
  `C¹` curve, explicitly assuming its speed is nowhere zero. State lower semicontinuity only for
  a sequence of `C¹` curves `γ_n` and a `C¹` limit curve `γ` on one fixed compact interval, with
  `γ_n → γ` uniformly there:
  `pathELength I γ a b ≤ liminf_n pathELength I (γ_n n) a b`. No claim is made for a
  non-differentiable limit, where `mfderiv` is junk-valued.
- **Corner smoothing and the piecewise-`C¹` comparison:** define a piecewise-`C¹` path by a finite
  partition and compute its length as the sum of Mathlib `pathELength`s on the pieces. Prove
  independence under refinement, then prove a named corner-smoothing reparametrization theorem:
  every piecewise-`C¹` path has a `C¹` path with the same endpoints and length. Deduce that do
  Carmo's piecewise-`C¹` infimum equals Mathlib's `C¹` infimum
  `Manifold.riemannianEDist`. This comparison is a substantive target, not an assembly lemma.
- **Canonical convention:** all downstream Tau Ceti statements use Mathlib's `C¹`
  `Manifold.pathELength` and `Manifold.riemannianEDist`; the piecewise-`C¹` formulation is exposed
  only through the comparison theorem above.
- **Restriction to open submanifolds:** for `U : TopologicalSpace.Opens M`, construct the restricted
  `RiemannianBundle` and its smoothness instance and apply `EMetricSpace.ofRiemannianMetric` on
  `U`. For a convex open subset of a finite-dimensional real inner-product space, prove that the
  resulting Riemannian distance agrees with the ambient norm distance. This owned target is what
  makes the open-unit-ball acceptance example below expressible.
- **Distance compatibility and finiteness.** Starting with the extended metric supplied by
  `EMetricSpace.ofRiemannianMetric`, prove
  `Manifold.riemannianEDist I x y ≠ ∞` on a connected manifold. Only after this theorem, construct
  the compatible ordinary metric-space presentation needed by `dist`, `ProperSpace`, and
  `CompleteSpace`. For results stated against an existing metric, consume
  `IsRiemannianManifold I M` and rewrite with `IsRiemannianManifold.out`; do not introduce another
  compatibility predicate.
- ⚠ Do **not** grow a private `length`/`dist` theory beside
  `Manifold.pathELength`/`Manifold.riemannianEDist`;
  where the metric-level API already proves a fact, consume it.

### Layer 1: the geodesic equation, the flow, and the exponential map
- **The Levi-Civita connection:** define metric compatibility for Mathlib's bundled
  `CovariantDerivative` and prove existence and uniqueness of the torsion-free,
  metric-compatible connection. Reuse `CovariantDerivative.torsion_eq_zero_iff`; consume
  mathlib4#36845 if it lands first. Otherwise this roadmap owns the implementation in the shared
  manifold connection namespace; the Geometric Topology roadmap consumes the resulting API.
- **Covariant derivative along a curve:** construct the pullback of a covariant derivative along
  `γ` and its action on sections of `γ*TM`. Establish linearity, the Leibniz rule, locality under
  restriction, naturality under reparametrization, agreement with the ambient derivative for a
  pulled-back vector field, and the chart formula. Specialize it to the velocity field to define
  covariant acceleration. This is the API through which the connection-based geodesic predicate
  is stated.
- **`IsGeodesicCurveOn g γ s`:** `γ` is continuous on the parameter set `s`, and its velocity has
  vanishing covariant derivative there for the Levi-Civita connection of `g`. Define the all-time
  abbreviation only as the `s = univ` specialization. In a chart this is the second-order geodesic
  ODE with the Christoffel symbols; prove the chart form equivalent to the connection-based
  definition. Use the Levi-Civita connection milestone above.
- **Initial data:** package `γ 0 = p`, velocity `γ'(0) = v`, and
  `IsGeodesicCurveOn g γ s` in a real predicate; the initial velocity may not be an unused binder.
- **The geodesic spray:** construct the vector field `S_g` on `TM`. Prove that in a tangent-bundle
  chart it is `(x, v) ↦ (v, -Γ_x(v, v))`, that this formula is independent of the chart, and that
  `S_g` is `C^∞`. Prove that integral curves of `S_g` are exactly the velocity lifts of curves
  satisfying the covariant geodesic equation, with set-restricted versions on their common time
  domains. This is the object to which Mathlib's `IsIntegralCurve` API is applied.
- **Local existence and uniqueness** of the geodesic from `(p, v)` on an open interval containing
  `0`: apply Mathlib's manifold integral-curve API to `S_g` and prove uniqueness on the overlap of
  two such intervals.
- **Smooth dependence and the local geodesic flow:** prove `C^∞` dependence on time and initial
  data and package the resulting local flow on `TM`. This is a target, not a theorem available in
  the pinned ODE library; consume mathlib4#26394 and mathlib4#40062 if their APIs land first.
- **Constant speed** (`‖γ'‖_g` is constant — the connection is metric): the lemma that makes a
  geodesic Cauchy at a finite endpoint of its interval.
- **Maximal interval and homogeneity:** using the preceding local theory (and mathlib4#26413 if it
  lands first), define the maximal open interval `J_g(p,v)` from genuine geodesic witnesses with
  initial data `(p,v)`. State
  `γ_{p,λv}(t) = γ_{p,v}(λt)` only when the corresponding times belong to their maximal intervals,
  together with the precise relation between those domains.
- **Finite-endpoint extension criterion:** for `z : ℝ → TM` an integral curve on a maximal open
  interval `J` with finite right endpoint `b`, prove that if `t_n ∈ J`, `t_n → b`, and
  `z (t_n) → z_b` in `TM`, then local existence at `z_b` and uniqueness on the overlap extend `z`
  past `b`, contradicting maximality; state the left-endpoint analogue too. This is a named target
  because the pinned integral-curve API has no maximal-solution extension theorem; consume
  mathlib4#26413 if it supplies the required form first.
- **Exponential map:** define `expDomain g p = {v | 1 ∈ J_g(p,v)}` and
  `exp_p v = γ_{p,v}(1)` on that domain, with `exp_p 0 = p`. Any total implementation with a junk
  value outside the natural domain must carry a `v ∈ expDomain g p` hypothesis in mathematical
  statements.
- **The derivative at zero:** make the canonical identification
  `T_0(T_p M) ≃L[ℝ] T_p M` explicit using `NormedSpace.fromTangentSpace`, and prove that
  `mfderiv exp_p 0` is the identity under this identification. Record the corresponding strict
  derivative statement needed by the inverse-function theorem.
- **The manifold inverse-function theorem:** add the missing shared theorem to
  `TauCeti/Geometry/Manifold/LocalDiffeomorph.lean`: for `C¹` boundaryless Banach manifolds, a
  `C¹` map whose `mfderiv` at a point is a continuous linear equivalence induces a
  `LocalDiffeomorphAt` there. Mathlib's
  `Geometry/Manifold/LocalDiffeomorph.lean` lists this implication as a TODO, so this roadmap owns
  it as a prerequisite rather than consuming it. Apply it to the preceding derivative theorem to
  obtain that `exp_p` is a local diffeomorphism at `0`.
- Milestone **(a) at `p`**, written `(a_p)`, is `expDomain g p = univ`. Define pointwise geodesic
  completeness `(d_p)` by `∀ v, J_g(p,v) = univ`, and prove `(a_p) ↔ (d_p)` via domain-aware
  homogeneity. Global milestone **(d)** is `∀ p, (d_p)` and is not inferred in Layer 1 from one
  base point.
- ⚠ Read curves through the chart at the *current* point of the curve, not one global chart. The
  word "intrinsic" belongs to those chart-reading auxiliaries, **not** to `exp_p` or the
  book-numbered statements.

### Layer 2: normal neighbourhoods, the Gauss lemma, and minimizing geodesics
- **Normal neighbourhoods and the local logarithm:** `exp_p` restricts to a diffeomorphism from a
  star-shaped neighbourhood of `0`, giving normal balls and normal coordinates. Define `log_p` on
  the resulting neighbourhood of `p` as this restriction's inverse, with its domain in the type or
  in every theorem. Prove smoothness, `log_p p = 0`, and the two inverse identities there. Do not
  introduce a global single-valued logarithm across the cut locus.
- **The Gauss lemma:** prove the radial/tangential orthogonality identity for `mfderiv exp_p` and
  its polar length inequality on a normal ball.
- **Ball-internal radial minimization:** a radial segment from `p` minimizes length against every
  piecewise-`C¹` competitor with the same endpoints whose image stays in the normal ball. State
  the equality case as uniqueness of the constant-speed affinely parametrized radial geodesic,
  and separately as uniqueness of arbitrary minimizers up to a nondecreasing surjective
  reparametrization; pauses do not give a different unparametrized minimizer.
- **The escape estimate and local distance identity:** shrink the normal ball and prove that every
  competitor which leaves the larger ball is longer than the radial segment. Combining this with
  ball-internal minimization gives the global-infimum statement
  `pathELength I γ 0 1 = edist p (γ 1)` for radial segments in the smaller ball.
- **The first variation of energy:** define the energy functional on `C¹` curves, smooth
  variations with fixed endpoints, and their variation fields. Build covariant differentiation
  in both variation directions, prove the integration-by-parts step and the first-variation
  formula, define criticality by vanishing derivative for every fixed-endpoint variation, and
  prove that a smooth curve is critical exactly when it is a geodesic. This milestone is part of
  the reusable geodesic API; it is not an input to the Hopf–Rinow implication graph below.

### Layer 3: the Hopf–Rinow equivalence
- For the fixed base point `p`, assemble the `TFAE` of `(a_p)`, (b), (c), global (d), and `(e_p)`,
  together with `(a_p) ⇒ (f_p)`. Give `(e_p)` the explicit Lean form
  `∃ K : ℕ → Set M, (∀ n, IsCompact (K n)) ∧ Monotone K ∧ (⋃ n, K n) = univ ∧
  ∀ q : ℕ → M, (∀ n, q n ∉ K n) → Tendsto (fun n ↦ dist p (q n)) atTop atTop`.
  The implication graph to implement is
  `(c) ⇒ (d) ⇒ (a_p) ⇒ (f_p)`, `(a_p) ∧ (f_p) ⇒ (b) ⇒ (c)`, and `(b) ⇔ (e_p)`.
- **(c) ⇒ (d), including convergence in `TM`:** at a finite endpoint of a maximal geodesic,
  constant speed makes the base curve Cauchy, so metric completeness supplies a limit `q : M`.
  Prove local uniform equivalence between the smooth Riemannian norm and the chart norm near `q`;
  in the resulting tangent-bundle trivialization the velocity coordinates are bounded. Finite
  dimensionality then gives a convergent subsequence of the lifted fixed-speed states
  `(γ(t_n), γ'(t_n))`. Apply the Layer-1 finite-endpoint extension criterion to its limit in `TM`,
  and use uniqueness for the geodesic spray to identify the extension with the original curve.
  Prove the analogous argument at the left endpoint. Neither convergence of the velocities nor
  the extension lemma is implicit in constant speed.
- **(d) ⇒ (a_p):** global geodesic completeness gives `(d_p)`, and the Layer-1 pointwise
  equivalence `(d_p) ↔ (a_p)` makes `exp_p` defined on all of `T_p M`.
- **(a_p) ⇒ (f_p):** with `exp_p` everywhere defined, every `q` is joined to `p` by a curve
  satisfying `IsGeodesicCurveOn g γ (Icc 0 1)`, `γ 0 = p`, `γ 1 = q`, and
  `pathELength I γ 0 1 = edist p q`; its subsegments also realize distance. Do not require this
  witness to extend to an all-time geodesic. Build it by minimizing distance on compact spheres
  in the finite-dimensional `T_p M`, using continuity of distance to `q`, and iterating the
  normal-ball radial extension step.
- **(a_p) and (f_p) ⇒ (b):** the minimizing initial velocities identify each closed ball centered
  at `p` with the image under `exp_p` of a compact closed ball in `T_p M`. A closed ball centered
  at an arbitrary `q` is a closed subset of a sufficiently large compact ball centered at `p`, by
  the triangle inequality. Hence every closed ball is compact and `ProperSpace M` follows.
- **(b) ⇒ (c):** consume the instance `complete_of_proper`.
- **(b) ⇒ (e_p):** take `K_n = closedBall p n`; properness makes each `K_n` compact, connectedness
  and finiteness of `dist` give `⋃ n, K_n = univ`, and `q_n ∉ K_n` forces
  `dist p (q_n) → ∞`.
- **(e_p) ⇒ (b):** if a closed bounded set `A` were contained in no `K_n`, choose
  `q_n ∈ A ∖ K_n`. The divergence clause in `(e_p)` contradicts boundedness of `A`, so
  `A ⊆ K_N` for some `N`; being closed in the compact set `K_N`, it is compact.
- **Base-point propagation:** after proving the equivalence, state explicitly that `(a_p)` at one
  point implies global (d), hence `(d_q)` and `(a_q)` for every `q`. This global step belongs here,
  not in the pointwise homogeneity argument of Layer 1.
- ⚠ **(f_p) does not imply (b).** Properness follows from `(a_p)` — all-time `exp_p` is what makes
  closed balls compact images of Euclidean balls — *together with* `(f_p)`, never from the
  existence-of-minimizers `(f_p)` alone. Any narrative must route properness through `(a_p)`.

### Layer 4: corollaries and downstream theory
- **Compact ⇒ geodesically complete** (do Carmo, Corollary 2.9): use `proper_of_compact`, then
  `complete_of_proper`, then Layer 3's `(c) ⇒ (d)`. Do not claim compactness of `M` directly
  confines the flow on noncompact `TM`; connectedness is unnecessary for this corollary.
- **Metric length-space API:** in `TauCeti/Topology/MetricSpace/Length.lean`, define metric curve
  length as the supremum of finite sums of successive distances, and define a length space by
  equality of `dist x y` with the infimum of lengths of continuous curves from `x` to `y`.
- **Metric geodesic-space API:** in the same file, define a geodesic space by the existence, for
  every `x y`, of a constant-speed segment `γ` on `[0,1]` satisfying
  `dist (γ s) (γ t) = |s - t| * dist x y`. Prove separately that geodesic spaces are length spaces
  and that a complete connected Riemannian manifold is both, using `(f_p)` and the Layer-0 length
  comparison. Coordinate names and reuse with [Evan Bailey's Lean Zulip metric-length
  proposal](https://leanprover-community.github.io/archive/stream/113489-new-members/topic/Evan.20Bailey.20%28self-introduction%29.html#476429541)
  before upstreaming this shared API; this roadmap owns delivery if no upstream definition lands.
- **Transport of geodesic completeness** across isometries and through the
  `IsRiemannianManifold` identification, so downstream roadmaps (constant-curvature model spaces)
  apply the theory without reopening it.

## Worked examples (acceptance criteria, keeping the theory honest)

Discharge these alongside the layers; they catch a vacuous equivalence or a hidden completeness
assumption:
- **A finite-dimensional real inner-product space `F`:** consume Mathlib's existing
  `IsRiemannianManifold 𝓘(ℝ, F) F` instance. Prove that geodesics are affine lines, `F` is
  geodesically and metrically complete, and the affine segment from `x` to `y` has
  `pathELength = ‖x - y‖`. Include the trivial space; no `NeZero` hypothesis is needed.
- **The open unit ball in `ℝ`, with `p = 0`:** use the Layer-0 open-submanifold restriction of the
  flat metric. Every `q` is joined to `0` by its radial segment, which realizes `dist 0 q`, but
  `closedBall 0 2` is the whole open ball and is not compact. A unit-speed radial geodesic reaches
  the missing boundary in finite time, so the space is neither metrically nor geodesically
  complete. This single example is both the incompleteness check and the explicit
  `(f_p)`-without-(b) guard.

## Ordering

Layer 0 first: corner smoothing, open-submanifold restriction, the piecewise-`C¹`/`C¹` infimum
comparison, global finiteness of the extended distance, and only then the ordinary metric-space
presentation settle the metric convention. In Layer 1, the Levi-Civita
connection and along-curve derivative come before the geodesic spray; the spray then feeds local
existence, smooth dependence, constant speed, maximal intervals, the finite-endpoint extension
criterion, and `exp_p`. The derivative of `exp_p` and the manifold inverse-function theorem
precede Layer 2's normal neighbourhoods and local logarithms. Layer 2 supplies the local minimizing
theory. Layer 3 closes the explicit Hopf–Rinow implication graph, and Layer 4 packages its
corollaries and the shared metric length/geodesic-space API.

## References

- M. P. do Carmo, *Riemannian Geometry*, Birkhäuser, 1992: **Ch. 1, Def. 2.9** (arc length),
  **Ch. 2 §§2–3** (covariant differentiation and the Riemannian connection), **Ch. 3 §2**
  (geodesic equation, flow, and exponential map), **§3** (Gauss lemma, normal neighbourhoods, and
  minimizing geodesics), **§4** (convex neighbourhoods), **Ch. 7 §2, Def. 2.4 and Thm. 2.8/Cor.
  2.9** (Riemannian distance and Hopf–Rinow), and **Ch. 9 §2, Props. 2.4–2.5** (first variation
  and geodesics as critical points). See the reviewer-checkable
  [source extract](references/do-carmo-hopf-rinow.md).
- J. Lee, *Introduction to Riemannian Manifolds*, GTM 176, 2018: the Levi-Civita connection
  (Thm 5.10), geodesics and the exponential map (Ch. 5–6), the Gauss lemma and the Hopf–Rinow
  theorem (Ch. 6). Its connection material is the substrate shared with the Geometric Topology
  roadmap's curvature layer.
- P. Petersen, *Riemannian Geometry*, GTM 171: an alternative account of completeness, minimizing
  geodesics, and the length-space view (cross-checks for Layers 2–4).

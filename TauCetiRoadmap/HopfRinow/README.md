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

Suggested home: `TauCeti/Geometry/Manifold/Riemannian/Geodesic/`.

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
- **Topology and separation.** An existing `[EMetricSpace M]` or `[MetricSpace M]` supplies the
  topology and its separation properties; do not add an independent `[TopologicalSpace M]`.
  When constructing `EMetricSpace.ofRiemannianMetric` from the manifold topology, assume
  `[T3Space M]`; the pseudo-emetric construction instead assumes `[RegularSpace M]`.
- **Connectedness** (`[ConnectedSpace M]`) is load-bearing and stated explicitly wherever used:
  without it the distance is not finite and assertion (f) fails across components. The purely
  local geodesic theory (Layers 1–2) does not need it; the equivalence and (f) (Layers 3–4) do.
- **The ambient distance is the Riemannian distance.** Use Mathlib's
  `[IsRiemannianManifold I M]`; its field `IsRiemannianManifold.out` identifies `edist` with
  `Manifold.riemannianEDist`. Do not introduce a private compatibility predicate. There is no
  positive-dimension assumption: the connected zero-dimensional case remains part of the public
  theorem.

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
- **Completeness and properness.** `CompleteSpace`, `ProperSpace` (with `ProperSpace.complete`),
  `Metric.isCompact_iff_isClosed_bounded`, Cauchy/total-boundedness API
  (`Mathlib/Topology/MetricSpace/`, `.../EMetricSpace/`). (b) is `ProperSpace M`; (c) is
  `CompleteSpace M`.
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
map and its domain; normal neighbourhoods, the Gauss lemma, and minimizing geodesic segments;
geodesic completeness; and the Hopf–Rinow equivalence itself. The roadmap must consume the
general connection, torsion, ODE, and integral-curve APIs above while building these specifically
Riemannian results.

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
- `DoCarmoLib/Riemannian/Exponential/{Defs,Intrinsic}.lean` for the exponential map and its
  interval-aware domain; and
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
- **Length of a piecewise-`C¹` curve** and its API: additivity under concatenation, invariance
  under monotone reparametrization, constant-speed reparametrization, lower semicontinuity under
  uniform limits. State it through Mathlib's `pathELength` where possible.
- **The length–distance identity.** do Carmo's infimum over piecewise-`C¹` curves equals
  `Manifold.riemannianEDist`; this is what makes every later "distance" the Mathlib one. The tools
  (piecewise length, chart-straight polygonal approximants with continuity-based length control)
  are within the metric-level API; the work is assembly.
- **Distance compatibility and finiteness.** Consume `IsRiemannianManifold I M` and rewrite with
  `IsRiemannianManifold.out`. Prove `Manifold.riemannianEDist I x y ≠ ∞` on a connected manifold,
  then expose the ordinary metric-space presentation needed by `dist`, `ProperSpace`, and
  `CompleteSpace`; do not introduce another compatibility predicate.
- ⚠ Do **not** grow a private `length`/`dist` theory beside
  `Manifold.pathELength`/`Manifold.riemannianEDist`;
  where the metric-level API already proves a fact, consume it.

### Layer 1: the geodesic equation, the flow, and the exponential map
- **The Levi-Civita connection:** define metric compatibility for Mathlib's bundled
  `CovariantDerivative` and prove existence and uniqueness of the torsion-free,
  metric-compatible connection. Reuse `CovariantDerivative.torsion_eq_zero_iff`; consume
  mathlib4#36845 if it lands first.
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
  definition. Use the Levi-Civita connection milestone above, shared with the Geometric Topology
  roadmap's curvature layer.
- **Initial data:** package `γ 0 = p`, velocity `γ'(0) = v`, and
  `IsGeodesicCurveOn g γ s` in a real predicate; the initial velocity may not be an unused binder.
- **Local existence and uniqueness** of the geodesic from `(p, v)` on an open interval containing
  `0`: define the geodesic spray on `TM`, use Mathlib's manifold integral-curve API, and prove
  uniqueness on the overlap of two such intervals.
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
- **Exponential map:** define `expDomain g p = {v | 1 ∈ J_g(p,v)}` and
  `exp_p v = γ_{p,v}(1)` on that domain, with `exp_p 0 = p` and `d(exp_p)_0 = id` (so `exp_p` is a
  local diffeomorphism at `0`). Any total implementation with a junk value outside the natural
  domain must carry a `v ∈ expDomain g p` hypothesis in mathematical statements.
- Milestone **(a) at `p`** is `expDomain g p = univ`. Define geodesic completeness at `p` by
  `∀ v, J_g(p,v) = univ`, and global milestone **(d)** by requiring this at every `p`. Prove the
  pointwise exponential-domain/completeness equivalence via domain-aware homogeneity.
- ⚠ Read curves through the chart at the *current* point of the curve, not one global chart. The
  word "intrinsic" belongs to those chart-reading auxiliaries, **not** to `exp_p` or the
  book-numbered statements.

### Layer 2: normal neighbourhoods, the Gauss lemma, and minimizing geodesics
- **Normal neighbourhoods:** `exp_p` restricts to a diffeomorphism from a star-shaped
  neighbourhood of `0`, giving normal balls and normal coordinates.
- **The Gauss lemma** and **local minimization:** inside a normal ball the radial geodesic is the
  unique shortest path to its endpoint and realizes the distance (stated via the Layer-0 distance,
  `pathELength γ = edist p (γ 1)`).
- **The first variation of energy**, enough to characterize geodesics as critical points and to
  drive the endpoint arguments of Layer 3.
- **Minimizing geodesics from `p`** (milestone **(f)**): every `q` is joined to `p` by a curve
  satisfying `IsGeodesicCurveOn g γ (Icc 0 1)`, `γ 0 = p`, `γ 1 = q`, and
  `pathELength I γ 0 1 = edist p q`; its subsegments also realize distance. Do not require this
  witness to extend to an all-time geodesic.

### Layer 3: the Hopf–Rinow equivalence
- Assemble the `TFAE` of (a)–(e) and the implication (a) ⇒ (f). Give (e) the explicit Lean form
  `∃ K : ℕ → Set M, (∀ n, IsCompact (K n)) ∧ Monotone K ∧ (⋃ n, K n) = univ ∧
  ∀ q : ℕ → M, (∀ n, q n ∉ K n) → Tendsto (fun n ↦ dist p (q n)) atTop atTop`.
  The weight is in the two directions joining metric and geodesic completeness; the rest are
  short.
- **(c) ⇔ (d):** constant speed makes a geodesic Cauchy at a finite endpoint of its maximal
  interval; metric completeness supplies the limit and a local flow extends past it, so no maximal
  interval is bounded — and conversely.
- **(a) ⇒ (b) and (a) ⇒ (f):** with `exp_p` everywhere defined, a compactness argument on spheres
  in `T_p M` produces a minimizing geodesic to each `q` (f) and exhibits closed balls as compact
  images, i.e. `ProperSpace M` (b).
- **(b) ⇒ (c)** is `ProperSpace.complete`; **(b) ⇔ (e)** uses the closed-ball exhaustion
  `K_n = closedBall p n`.
- ⚠ **(f) does not imply (b).** Properness follows from (a) — all-time `exp_p` is what makes closed
  balls compact images of Euclidean balls — *together with* (f), never from the
  existence-of-minimizers (f) alone. Any narrative must route properness through (a).

### Layer 4: corollaries and downstream theory
- **Compact ⇒ geodesically complete** (do Carmo, Corollary 2.9), with a direct proof (a geodesic
  on a compact manifold cannot escape, so its interval is unbounded) as well as via completeness.
- **Minimizing geodesics between arbitrary points** of a complete connected manifold, and hence
  that `(M, d_g)` is a geodesic (length) metric space.
- **Closed subsets inherit completeness**; closed bounded subsets are compact; the diameter
  corollaries.
- **Transport of geodesic completeness** across isometries and through the
  `IsRiemannianManifold` identification, so downstream roadmaps (constant-curvature model spaces)
  apply the theory without reopening it.

## Worked examples (acceptance criteria, keeping the theory honest)

Discharge these alongside the layers; they catch a vacuous equivalence or a hidden completeness
assumption:
- **`ℝⁿ`** with its flat metric is geodesically and metrically complete, including when `n = 0`,
  and the minimizing geodesic from `x` to `y` is the affine segment, with
  `pathELength = ‖x − y‖`. Both directions of the equivalence are non-vacuous in positive
  dimension, while the zero-dimensional case checks that no unnecessary hypothesis leaks into
  the public theorem.
- **`Sⁿ`** is compact, hence geodesically complete by Layer 4, and a great-circle arc realizes the
  distance. Exercises Corollary 2.9.
- **An open ball in `ℝⁿ` (or `ℝⁿ ∖ {0}`)** is neither geodesically nor metrically complete, and a
  radial geodesic leaves it in finite time: the equivalence correctly reports incompleteness, so
  no hypothesis silently forces completeness.
- **(f)-without-(b) guard:** a witness where minimizers from `p` exist yet closed balls are not
  compact, matching the trap in Layer 3.

## Ordering

Layer 0 first: the length–distance identity and the bridge unblock every completeness statement
and settle the `Manifold.riemannianEDist` reconciliation. Layer 1 is the bulk (along-curve
covariant differentiation, the geodesic ODE and flow, and `exp_p`) and gates the rest; within it,
the equation and local existence come before smooth dependence, constant speed, and homogeneity,
which come before the maximal interval and `exp_p`. Layer 2 and the two hard directions of Layer
3 follow; the remaining implications of Layer 3 and all of Layer 4 are short.

## References

- M. P. do Carmo, *Riemannian Geometry*, Birkhäuser, 1992: **Ch. 1–2** (the Riemannian metric,
  the induced distance, the Levi-Civita connection), **Ch. 3 §2–3** (the geodesic equation and
  flow, the exponential map, the Gauss lemma, minimizing geodesics, normal neighbourhoods —
  Layers 0–2), and **Ch. 7 §2** (Theorem 2.8, Hopf–Rinow, and Corollary 2.9 — Layers 3–4). The
  primary target.
- J. Lee, *Introduction to Riemannian Manifolds*, GTM 176, 2018: the Levi-Civita connection
  (Thm 5.10), geodesics and the exponential map (Ch. 5–6), the Gauss lemma and the Hopf–Rinow
  theorem (Ch. 6). Its connection material is the substrate shared with the Geometric Topology
  roadmap's curvature layer.
- P. Petersen, *Riemannian Geometry*, GTM 171: an alternative account of completeness, minimizing
  geodesics, and the length-space view (cross-checks for Layers 2–4).

## Authorship

Drafted with AI assistance from Codex/GPT-5 and reviewed by the human author before submission.

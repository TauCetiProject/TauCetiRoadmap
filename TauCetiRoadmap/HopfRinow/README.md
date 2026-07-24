# Roadmap: geodesics, the exponential map, and the Hopf–Rinow theorem

Mathlib's Riemannian library reaches the metric-and-distance level: a Riemannian metric induces
`riemannianEDist` and, through `EMetricSpace.ofRiemannianMetric`, an (extended) metric space
(`Mathlib/Geometry/Manifold/Riemannian/Basic.lean`), with path length in
`Mathlib/Geometry/Manifold/Riemannian/PathELength.lean`. It **stops there**: there is no geodesic
as a solution of the geodesic equation, no exponential map, and no notion of geodesic
completeness, so the Hopf–Rinow theorem — which ties metric completeness of a Riemannian
manifold to the global existence of its geodesics — cannot even be stated. We build that theory
here.

Suggested home: `TauCeti/Geometry/Manifold/Riemannian/Geodesic/`.

The target is do Carmo, *Riemannian Geometry*, Chapter 7 §2, Theorem 2.8 with Corollary 2.9,
stated under that chapter's standing assumption that `M` is **connected** (do Carmo carries this
as a chapter convention rather than in the theorem line; it is load-bearing — see Standing
hypotheses). Verbatim:

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

Spell hypotheses out; do not bundle them. Work with a finite-dimensional manifold `M` over a
`ModelWithCorners` without boundary, carrying a Riemannian metric `g`.

- **Connectedness** (`[ConnectedSpace M]`) is load-bearing and stated explicitly wherever used:
  without it the distance is not finite and assertion (f) fails across components. The purely
  local geodesic theory (Layers 1–2) does not need it; the equivalence and (f) (Layers 3–4) do.
- **Positive dimension** (`NeZero` on the model's `finrank`). The connected zero-dimensional case
  is a one-point manifold where everything is trivial; exclude it rather than special-case it.
- **The distance is `g`'s.** Completeness is a statement about the distance `g` induces
  (`riemannianEDist`), so every completeness milestone carries the bridge identifying the ambient
  `dist`/`edist` on `M` with the `g`-induced one. The preferred form takes the metric from
  `EMetricSpace.ofRiemannianMetric`, making the bridge definitional; a bridge hypothesis is the
  form used while an independent metric structure coexists.

## What Mathlib already has (consume)

- **Manifolds and tangent bundles.** `ModelWithCorners`, `IsManifold`, `TangentBundle`,
  `TangentSpace`, `ContMDiff`, `mfderiv`, charts/`extChartAt`
  (`Mathlib/Geometry/Manifold/`).
- **The metric-level Riemannian API.** `RiemannianBundle`, `IsRiemannianManifold`,
  `riemannianEDist`, `EMetricSpace.ofRiemannianMetric`
  (`Mathlib/Geometry/Manifold/Riemannian/Basic.lean`), and path length
  (`.../Riemannian/PathELength.lean`) — the substrate every layer builds on.
- **Completeness and properness.** `CompleteSpace`, `ProperSpace` (with `ProperSpace.complete`),
  `Metric.isCompact_iff_isClosed_bounded`, Cauchy/total-boundedness API
  (`Mathlib/Topology/MetricSpace/`, `.../EMetricSpace/`). (b) is `ProperSpace M`; (c) is
  `CompleteSpace M`.
- **ODE theory.** Picard–Lindelöf existence/uniqueness and `C^k` dependence of flows on initial
  conditions (`Mathlib/Analysis/ODE/`), consumed for the geodesic equation after its reduction to
  a first-order system on `TM`.

## What is missing (build here)

The Levi-Civita connection and covariant derivative along a curve; the geodesic equation and its
solutions; constant speed; the exponential map and its domain; normal neighbourhoods, the Gauss
lemma, and minimizing geodesics; geodesic completeness; and the Hopf–Rinow equivalence itself.
None of this is upstream.

## Prior art and coordination

There is active Mathlib work on the substrate this roadmap needs. In particular,
leanprover-community/mathlib4#36036 is the placeholder PR coordinating ongoing work on
connections and geodesics, and leanprover-community/mathlib4#36845 develops the Levi-Civita
connection on a manifold. Tau Ceti work on this roadmap should cite those PRs, follow the
conventions that emerge there, and treat any overlapping local definitions as temporary shims to
delete or refactor once the Mathlib versions land.

The author has related Lean material in `~/Poincare-Conjecture`, especially the DoCarmo and
Petersen developments around connections, geodesics, exponential maps, and Hopf–Rinow. That code
is useful provenance and a source of possible target shapes, but it is not the standard for Tau
Ceti: implementors should build fresh against the roadmap, current Mathlib, and reviewer
feedback, improving generality and API design where appropriate.

---

## The build, in layers

As each layer makes the next layer's *types* expressible in `TauCeti/`, state its milestones in
`Suggested.lean` (with `sorry`).

### Layer 0: the reconciled Riemannian distance
- **Length of a piecewise-`C¹` curve** and its API: additivity under concatenation, invariance
  under monotone reparametrization, constant-speed reparametrization, lower semicontinuity under
  uniform limits. State it through Mathlib's `pathELength` where possible.
- **The length–distance identity.** do Carmo's infimum over piecewise-`C¹` curves equals
  `riemannianEDist`; this is what makes every later "distance" the Mathlib one. The tools
  (piecewise length, chart-straight polygonal approximants with continuity-based length control)
  are within the metric-level API; the work is assembly.
- **The distance-bridge predicate** identifying an ambient metric on `M` with the `g`-induced
  distance, and the lemmas transporting completeness and boundedness across it.
- ⚠ Do **not** grow a private `length`/`dist` theory beside `pathELength`/`riemannianEDist`;
  where the metric-level API already proves a fact, consume it.

### Layer 1: the geodesic equation, the flow, and the exponential map
- **`IsGeodesicCurve`:** the covariant derivative of the velocity vanishes; equivalently, in a
  chart, the second-order geodesic ODE with the Christoffel symbols. State it chart-independently
  and prove the chart form equivalent. (Needs the Levi-Civita connection — built here or in a
  shared connection home; see the Geometric Topology roadmap's curvature layer for the same
  substrate.)
- **Local existence, uniqueness, smooth dependence** of the geodesic from `(p, v)`, consumed from
  Mathlib's ODE flow theory after reducing to a first-order system on `TM`.
- **Constant speed** (`‖γ'‖_g` is constant — the connection is metric): the lemma that makes a
  geodesic Cauchy at a finite endpoint of its interval.
- **Homogeneity** `γ_{p, λv}(t) = γ_{p, v}(λt)`, the **maximal interval of existence**, and the
  **exponential map** `exp_p v = γ_{p,v}(1)` with its domain, `exp_p 0 = p`, and
  `d(exp_p)_0 = id` (so `exp_p` is a local diffeomorphism at `0`).
- Milestone **(a)** is that the domain of `exp_p` is all of `T_p M`; milestone **(d)** is geodesic
  completeness (every `v` launches an all-time geodesic). (a) ⇔ (d) at a point, via homogeneity,
  is proved here.
- ⚠ Read curves through the chart at the *current* point of the curve, not one global chart. The
  word "intrinsic" belongs to those chart-reading auxiliaries, **not** to `exp_p` or the
  book-numbered statements.

### Layer 2: normal neighbourhoods, the Gauss lemma, and minimizing geodesics
- **Normal neighbourhoods:** `exp_p` restricts to a diffeomorphism from a star-shaped
  neighbourhood of `0`, giving normal balls and normal coordinates.
- **The Gauss lemma** and **local minimization:** inside a normal ball the radial geodesic is the
  unique shortest path to its endpoint and realizes the distance (stated via the Layer-0 distance,
  `pathELength γ = riemannianEDist p (γ 1)`).
- **The first variation of energy**, enough to characterize geodesics as critical points and to
  drive the endpoint arguments of Layer 3.
- **Minimizing geodesics from `p`** (milestone **(f)**): every `q` is joined to `p` by a geodesic
  on `[0,1]` whose subsegments realize distance and whose length equals `d(p, q)`.

### Layer 3: the Hopf–Rinow equivalence
- Assemble the `TFAE` of (a)–(e) and the implication (a) ⇒ (f). The weight is in the two
  directions joining metric and geodesic completeness; the rest are short.
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
- **Transport of geodesic completeness** across isometries and along the distance bridge, so
  downstream roadmaps (constant-curvature model spaces) apply the theory without reopening it.

## Worked examples (acceptance criteria, keeping the theory honest)

Discharge these alongside the layers; they catch a vacuous equivalence or a hidden completeness
assumption:
- **`ℝⁿ`** (flat metric, `NeZero n`) is geodesically and metrically complete, and the minimizing
  geodesic from `x` to `y` is the affine segment, with `pathELength = ‖x − y‖`. Both directions of
  the equivalence are non-vacuous.
- **`Sⁿ`** is compact, hence geodesically complete by Layer 4, and a great-circle arc realizes the
  distance. Exercises Corollary 2.9.
- **An open ball in `ℝⁿ` (or `ℝⁿ ∖ {0}`)** is neither geodesically nor metrically complete, and a
  radial geodesic leaves it in finite time: the equivalence correctly reports incompleteness, so
  no hypothesis silently forces completeness.
- **(f)-without-(b) guard:** a witness where minimizers from `p` exist yet closed balls are not
  compact, matching the trap in Layer 3.

## Ordering

Layer 0 first: the length–distance identity and the bridge unblock every completeness statement
and settle the `riemannianEDist` reconciliation. Layer 1 is the bulk (the geodesic ODE theory and
`exp_p`) and gates the rest; within it, the equation and local existence come before constant
speed and homogeneity, which come before the maximal interval and `exp_p`. Layer 2 and the two
hard directions of Layer 3 follow; the remaining implications of Layer 3 and all of Layer 4 are
short.

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

<!--tauceti-status:v1 {"roadmap":"ConvexLifting","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","state":"done"},{"id":"Layer 2","remaining":"Point and FiniteModel data with coordinate API, then normalizedLift and separableLift with their projection and minimum statements","state":"untouched"},{"id":"Layer 3","remaining":"normed-space tangent-support lemma, the matched rows, and analytic_comparison with its affine-coordinate and full-space variants","state":"untouched"},{"id":"Layer 4","remaining":"sharedRows and independentRows with their projection identities, and the link to Layer 3 rows","state":"untouched"}],"readme_sha":"8b03e212199f48f1e8b143d512e60cf852e1a46d21f8fc81d3f423b09814b3e3","roadmap":"ConvexLifting","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: ConvexLifting

This file documents the status of the ConvexLifting roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer 1, the exact lift of monotone compositions together with the transfer of feasible minima, is done. Its examples cover every check the roadmap lists. Nothing has been started on the finite mixed-integer models (Layer 2), the derivative-matched outer approximations (Layer 3) or finite support elimination (Layer 4).

### Named results

- **Exact projection of the lift** — when `g` maps the domain `D` into the outer domain `E` and `h` is monotone on `E`, the set of pairs `(x, y)` with `x ∈ D`, `y ∈ E`, `g x ≤ y` and `h y ≤ b` projects exactly onto `{x ∈ D | h (g x) ≤ b}`. This is the order form of the monotone-outer epigraph reformulation. It needs no convexity, and the outer values may lie in any preorder ([`fst_image_liftedSet`](https://taucetiproject.org/docs/TauCeti/Order/CompositionLift.html#TauCeti.CompositionLift.fst_image_liftedSet)).
- **The epigraph criterion** — the epigraph of `h ∘ g` on `D` is the set of pairs `(x, t)` admitting a height `y` with `g x ≤ y` and `h y ≤ t`. It is stated in the shape used by Mathlib's `convexOn_iff_convex_epigraph`, so convexity of a composition can be read off from convexity of the lift ([`epigraph_comp_eq`](https://taucetiproject.org/docs/TauCeti/Order/CompositionLift.html#TauCeti.CompositionLift.epigraph_comp_eq)).
- **Transfer of feasible minima** — a pair minimises an objective in the original variables on the lift exactly when its first coordinate minimises it on the original set. Membership is handled by separate graph-insertion and projection lemmas, since `IsMinOn` alone does not assert it ([`isMinOn_comp_fst_liftedSet_iff`](https://taucetiproject.org/docs/TauCeti/Order/CompositionLift.html#TauCeti.CompositionLift.isMinOn_comp_fst_liftedSet_iff)).
- **Transfer of attainment** — such an objective attains a feasible minimum on the lift exactly when it attains one on the original set. This says nothing about attainment in general, and the examples include an open interval where both problems fail to attain their infimum ([`exists_isMinOn_liftedSet_iff`](https://taucetiproject.org/docs/TauCeti/Order/CompositionLift.html#TauCeti.CompositionLift.exists_isMinOn_liftedSet_iff)).

### Notable definitions and infrastructure

- **The original and lifted sets** ([`originalSet`](https://taucetiproject.org/docs/TauCeti/Order/CompositionLift.html#TauCeti.CompositionLift.originalSet), [`liftedSet`](https://taucetiproject.org/docs/TauCeti/Order/CompositionLift.html#TauCeti.CompositionLift.liftedSet)) are plain sets that keep both domain filters. Layers 2 and 3 are meant to reuse these conventions for their projection statements.
- **The monotonicity counterexample** ([`fst_image_liftedSet_sq_one_sub_ne`](https://taucetiproject.org/docs/TauCeti/Examples/Order/CompositionLift.html#TauCeti.CompositionLift.fst_image_liftedSet_sq_one_sub_ne)) shows that with the decreasing outer function `1 - y`, the lift projects onto strictly more than the original set. So the `MonotoneOn` hypothesis is essential.

### Roadmap coverage

Layer 1 is done. Both §1.1 (sets, exact projection, the pointwise and emptiness criteria, the epigraph criterion) and §1.2 (feasible minima and attainment) are proved, and all four example checks are formalised. Layers 2, 3 and 4 are untouched: the source contains no `FiniteModel`, no tangent-support bridge or shared outer approximation, and no `sharedRows`.

## The frontier

- **Finite model data (Layer 2, §2.1)** — `Point`, `FiniteModel`, its objective, mixed feasibility and continuous relaxation, together with `project`, `height`, graph insertion and `affineArgument`. Everything else in Layer 2 depends on this.
- **Normalization and separable lifting (Layer 2, §2.2–2.3)** — `normalizedLift` and `separableLift`, with projection, relaxation-projection and minimum-transfer statements for each. These are where Layer 1's transfer results get used. Separable lifting needs nonnegative weights.
- **The normed-space tangent-support lemma (Layer 3, §3.1)** — `f a + L (x − a) ≤ f x` for a convex function with an actual Fréchet derivative, obtained by restricting to a line and applying Mathlib's scalar secant lemma. Every row-support statement in Layer 3 rests on it.
- **Matched outer approximations (Layer 3, §3.2)** — `analytic_comparison`, `affine_coordinate_comparison` and the full-space comparison chain the original set inside the shared-height approximation, and that inside the direct one. They need the tangent-support lemma and the rows of §3.1.
- **Finite support elimination (Layer 4)** — `shared_rows_projection` and `independent_rows_projection` are purely algebraic, using finite maxima and sums. Only their identification with Layer 3's rows waits on Layer 3, so the algebra could be done in parallel.

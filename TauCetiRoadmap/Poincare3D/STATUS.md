<!--tauceti-status:v1 {"roadmap":"Poincare3D","to_sha":"e06d6728b2f32e212d12e96ddcd366c4445e9e10","ts":"2026-11-11T00:57:04Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","state":"untouched"},{"id":"Layer 2","state":"untouched"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","remaining":"the standard cap metric with tip smoothness and curvature, its complete flow, and the metric cut, cap and comparison maps of 6.2","state":"partial"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","state":"untouched"},{"id":"Layer 9","state":"untouched"},{"id":"Layer 10","state":"untouched"},{"id":"Layer 11","remaining":"geometric width of a transported class, its forward estimate on smooth epochs, event jump bounds and the finite-extinction theorem","state":"partial"},{"id":"Layer 12","state":"untouched"},{"id":"Layer 13","state":"untouched"},{"id":"Layer 14","state":"untouched"},{"id":"Layer 15","state":"untouched"}],"readme_sha":"06077e4227b02e7b6ea2c9d832e44c6618328c2a8aa11d5ab9365174dba74a15","roadmap":"Poincare3D","to_sha":"e06d6728b2f32e212d12e96ddcd366c4445e9e10"}-->
# Status: Poincare3D

This file documents the status of the Poincare3D roadmap up until `e06d672` (2026-11-11T00:57:04Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The roadmap is at its very beginning. The scalar comparison behind finite extinction (Layer 11) and the profile of the standard cap (Layer 6) are proved. No Ricci flow, surgery, width or topological statement for three-manifolds exists yet, and neither Poincaré endpoint has been started.

### Named results

- **The width comparison profile** — the explicit profile `G(t)=(W₀+2π)(1+4t)^(3/4)-2π(1+4t)` starts at `W₀` and solves `G′=-2π+3G/(1+4t)`. Every continuous function obeying the forward Dini inequality stays below it, and it becomes negative eventually for every finite `W₀` ([`ricciWidthProfile`](https://taucetiproject.org/docs/TauCeti/Geometry/RicciFlow/WidthComparison.html#TauCeti.ricciWidthProfile), [`eventually_ricciWidthProfile_neg`](https://taucetiproject.org/docs/TauCeti/Geometry/RicciFlow/WidthComparison.html#TauCeti.eventually_ricciWidthProfile_neg)).
- **Finite-event width propagation** — across finitely many event times, with jump errors `eⱼ`, the normalized width satisfies `(1+4T)^(-3/4)W(T) ≤ W(τ₀)` plus the weighted error sum minus `2π((1+4T)^(1/4)-1)`, restarted at the first event time ([`ricciWidth_normalized_le_of_forward_le_of_jump_le`](https://taucetiproject.org/docs/TauCeti/Geometry/RicciFlow/WidthComparison.html#TauCeti.ricciWidth_normalized_le_of_forward_le_of_jump_le)).
- **The scalar extinction-time bound** — a weighted error budget `E` gives an explicit time beyond which the width cannot be nonnegative ([`ricciWidth_time_le_of_forward_le_of_jump_le`](https://taucetiproject.org/docs/TauCeti/Geometry/RicciFlow/WidthComparison.html#TauCeti.ricciWidth_time_le_of_forward_le_of_jump_le)). This is the arithmetic of Morgan–Tian Theorem 18.1, stated for real functions; no flow supplies its hypotheses yet.
- **Existence of standard cap profiles** — there is a smooth odd concave radial profile equal to `2 sin(r/2)` near the tip and `√2` beyond a finite radius. From these conditions follow `f(0)=0`, `f′(0)=1`, `0≤f′≤1`, `f″≤0` and `0<f≤√2` away from the tip ([`exists_isStandardCapProfile`](https://taucetiproject.org/docs/TauCeti/Geometry/RicciFlow/StandardCap/Profile.html#TauCeti.exists_isStandardCapProfile)).

### Notable definitions and infrastructure

- [`IsStandardCapProfile`](https://taucetiproject.org/docs/TauCeti/Geometry/RicciFlow/StandardCap/Profile.html#TauCeti.IsStandardCapProfile) fixes the class of Definition 12.1 profiles. The cap metric `dr²+f(r)²g_(S²)` and its curvature will be built from it.
- **Higher-order reflection across a half-space** gives every `Cᵏ` function on a closed half-space a global `Cᵏ` extension ([`exists_contDiff_extension_halfSpace`](https://taucetiproject.org/docs/TauCeti/Analysis/Sobolev/Trace/Reflection/HalfSpace.html#TauCeti.HalfSpaceExtension.exists_contDiff_extension_halfSpace)). It sits alongside [uniform jet bounds](https://taucetiproject.org/docs/TauCeti/Analysis/Calculus/UniformJets.html#TauCeti.HasUniformJetBoundsOn) for families of maps and a two-sided Grönwall inequality. These are generic tools for the parabolic estimates ahead.
- **Compactness and measure tools** cover simultaneous isometric ultrafilter limits of compact metric charts ([`exists_isometric_ultrafilter_limit`](https://taucetiproject.org/docs/TauCeti/Topology/MetricSpace/Isometry/CompactLimit.html#TauCeti.exists_isometric_ultrafilter_limit)), completeness criteria for comparable metrics, and polar-coordinate integration, which shows that radial graphs are Haar-null. None is yet tied to a stated milestone.

### Roadmap coverage

Two layers are partial. **Layer 11** has the whole scalar side of 11.1 and 11.2: the comparison, restart, profile checks, weighted event propagation and the time bound. The width of a transported class, its forward estimate on smooth epochs, the event jump bounds and the finite-extinction theorem itself are missing. **Layer 6** has only the profile class of 6.1. The cap metric, its curvature and tip smoothness, the standard-cap flow and all of 6.2 (cut, cap and comparison maps) are missing. **Layers 1–5, 7–10 and 12–15** are untouched: none of their milestones appears in the library. Layer 2 now has some generic supporting analysis, but no milestone.

## The frontier

- **The standard cap metric (6.1)** — build `dr²+f(r)²g_(S²)` on ℝ³ from a standard cap profile, prove it smooth at the tip and nonnegatively curved, and check the README's sectional curvature `1/4` at the tip and scalar curvature one on the end. The profile inequalities needed are already in place.
- **Closed simply connected three-manifold topology (1.1)** — homology and homotopy of a closed simply connected three-manifold and the homotopy equivalence with `S³`. This depends on the AlgebraicTopology suppliers (Hurewicz, Whitehead, duality), not on any analysis here.
- **Normalized initial metrics (1.3)** — metric existence and rescaling to `|Rm|≤1`, `ν≥-1` and the small-ball volume bound. This needs Riemannian normal coordinates from RiemannianGeometry.
- **Localized Shi estimates (2.2)** — the first genuinely parabolic layer. It needs the RicciFlow roadmap's compact-flow API (R1–R5) and the cutoff and maximum-principle constructions described in the README.
- **The geometric forward width estimate (11.1)** — linking the proved scalar comparison to an actual flow. This waits on width (Layer 9), moving-curve estimates (Layer 10) and surgery flows (Layer 7), so it is far from the current frontier.

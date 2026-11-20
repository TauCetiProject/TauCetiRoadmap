<!--tauceti-status:v1 {"roadmap":"DeRhamCohomologyAndDuality","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3","ts":"2026-11-13T23:20:12Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"uniqueness of potentials on discs, the continuous path integral and its homotopy invariance, exactness on simply connected domains","state":"partial"},{"id":"Layer 2","remaining":"chart invariance and strictly inward fields on M, inward domination, chain transfer, relative smooth chains, relative approximation","state":"partial"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"}],"readme_sha":"6d9ca0951a4b1bbb1ce323ce1007327620cb74b4ea9618f7825509b6e6e67c29","roadmap":"DeRhamCohomologyAndDuality","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3"}-->
# Status: DeRhamCohomologyAndDuality

This file documents the status of the DeRhamCohomologyAndDuality roadmap up until `aa6e43e` (2026-11-13T23:20:12Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The first piece of each of the two opening layers is in place: Layer 1 has local potentials for continuous one-forms, and Layer 2 has the flat strict inward cone. None of the end theorems has landed. Neither the continuous path integral nor inward domination has started, and Layers 3–5 (relative de Rham theory, fundamental classes, relative transversality) are untouched.

### Named results

- **Closed one-forms have local potentials** — a closed `C¹` covector field on an open set, with values in a complete space, is locally the derivative of a `C¹` function. The proof applies the flat Poincaré lemma on balls ([`hasLocalPotentials_of_extDeriv_eq_zero`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Calculus/DifferentialForm/LocalPotentials.html#TauCeti.hasLocalPotentials_of_extDeriv_eq_zero)).
- **Locality of local potentials** — the predicate holds on a union exactly when it holds on each open piece of the cover ([`hasLocalPotentials_iUnion_iff`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Calculus/LocalPotentials.html#TauCeti.hasLocalPotentials_iUnion_iff)), and it pulls back along `C¹` maps of open domains ([`HasLocalPotentials.pullback`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Calculus/LocalPotentials.html#TauCeti.HasLocalPotentials.pullback)).
- **Strict inwardness through the interior** — for a convex set and a point in it, a direction is strictly inward exactly when its positive ray meets the interior ([`Convex.mem_strictInwardCone_iff`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Convex/Cone/StrictInward.html#Convex.mem_strictInwardCone_iff)).
- **Uniform inward ball estimates** — the radius and time bounds can be chosen uniformly near any strictly inward point and direction. This is the local input for gluing strictly inward vector fields ([`Convex.exists_uniform_ball_subset_of_mem_strictInwardCone`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Convex/Cone/StrictInward.html#Convex.exists_uniform_ball_subset_of_mem_strictInwardCone)).

### Notable definitions and infrastructure

- [`HasLocalPotentials`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Calculus/LocalPotentials.html#TauCeti.HasLocalPotentials) is the input to the continuous path integral of §1.2. It is stated for a field on any real normed space, so the planar case of the roadmap is a specialisation. It needs no regularity of the field and no completeness for the predicate itself.
- [`strictInwardCone`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Convex/Cone/StrictInward.html#TauCeti.strictInwardCone) is defined by balls of linearly growing radius. On the half-line it [excludes the zero direction](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Convex/Cone/StrictInward.html#TauCeti.strictInwardCone_Ici_zero), as the roadmap's check demands, so it is not the closed tangent cone.

### Roadmap coverage

Layer 1 is partial. In §1.1, the definition, the closed `C¹` case, locality on open covers, restriction and pullback are done, but uniqueness of potentials up to a constant on discs is not stated. §1.2, the continuous path integral and its homotopy invariance, and §1.3, exactness on simply connected domains, are not started. Layer 2 is partial. The flat half of §2.1 is done for an arbitrary convex set: convexity, positive scaling, interior anchors, openness, uniform estimates, and the half-line, quadrant and interior checks. Chart-change invariance and strictly inward fields on `M` are missing, and §§2.2–2.5 are not started. Layers 3, 4 and 5 are untouched; nothing for the relative de Rham complex, the fundamental-class comparison or incidence parameters has landed.

## The frontier

- **Strictly inward vector fields (§2.1)** — specialise the cone to `range I`, prove its invariance under derivatives of chart changes, and glue local constant fields with `exists_contMDiffSection_forall_mem_convex_of_local`. The flat estimates needed for this are in place.
- **The continuous path integral (§1.2)** — define integration along continuous paths by subdividing into potential discs, prove that it is well defined, and prove homotopy invariance rel endpoints. Uniqueness of potentials up to a constant on discs (the last open item of §1.1) is a prerequisite.
- **Exactness on simply connected domains (§1.3)** — `exists_hasFDerivAt_of_simplyConnected` follows from §1.2's homotopy invariance and `SimplyConnectedSpace.paths_homotopic`.
- **Incidence parameters (§§5.1–5.2)** — Layer 5 depends only on calculus and Tau Ceti's Sard and level-set APIs, so it can start now. Its first targets are `incidenceEquation`, `IsRegularIncidenceParameter` and the Haar-null theorem.
- **Inward domination (§2.2)** — this needs the strictly inward fields above, a smooth proper exhaustion function, and the forward semiflow in a convex model.

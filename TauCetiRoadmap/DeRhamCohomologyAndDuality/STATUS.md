<!--tauceti-status:v1 {"roadmap":"DeRhamCohomologyAndDuality","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"locality of local primitives for rough forms on manifolds, the covering space and continuous path integral with homotopy invariance, exactness on simply connected manifolds","state":"partial"},{"id":"Layer 2","remaining":"inward semiflow and inward domination, chain transfer, relative smooth chains, relative approximation","state":"partial"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","remaining":"universal transversality, countable avoidance and cover/affine invariance in 5.1; the Haar-null theorem 5.2; relative perturbations 5.3","state":"partial"}],"readme_sha":"d2e29ce20d8248afd11d6dcdebf1d48941452d0040a13a7ba11960db058c4f1d","roadmap":"DeRhamCohomologyAndDuality","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: DeRhamCohomologyAndDuality

This file documents the status of the DeRhamCohomologyAndDuality roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** §2.1 is complete: the strict inward cone on manifolds with corners, together with smooth strictly inward vector fields. Layer 5 has its definitions, and Layer 1 has a flat version of local potentials. None of the six end theorems has landed, and Layers 3 and 4 (relative de Rham theory, fundamental classes) are untouched.

### Named results

- **Strictly inward vector fields exist** — a Hausdorff σ-compact manifold over a finite-dimensional model with corners carries a smooth vector field that is strictly inward at every point. This is the input for the forward semiflow of §2.2 ([`exists_contMDiffSection_mem_strictInwardTangentCone`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/VectorField/StrictInward.html#TauCeti.exists_contMDiffSection_mem_strictInwardTangentCone)).
- **Chart invariance of strict inwardness** — derivatives of chart changes preserve and reflect strict inwardness, so the cone is intrinsic to each tangent space. More generally, differentials of dense range preserve it ([`tangentCoordChange_mem_strictInwardCone_iff`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/VectorField/StrictInward.html#TauCeti.tangentCoordChange_mem_strictInwardCone_iff), [`MDifferentiableAt.mapsTo_strictInwardTangentCone`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/VectorField/StrictInward.html#MDifferentiableAt.mapsTo_strictInwardTangentCone)).
- **Avoidance for regular incidence parameters** — if `dim E + dim W < dim V`, the slice of a regular parameter misses the image of `j` entirely ([`IsRegularIncidenceParameter.disjoint_range`](https://taucetiproject.org/docs/TauCeti/Analysis/Calculus/Incidence.html#TauCeti.IsRegularIncidenceParameter.disjoint_range)).
- **Closed one-forms have local potentials** — on an open set of a normed space, a closed `C¹` covector field with complete values is locally the derivative of a `C¹` function, by the flat Poincaré lemma on balls ([`hasLocalPotentials_of_extDeriv_eq_zero`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Calculus/DifferentialForm/LocalPotentials.html#TauCeti.hasLocalPotentials_of_extDeriv_eq_zero)).
- **Strict inwardness through the interior** — for a convex set, a direction is strictly inward at a point exactly when its positive ray meets the interior. The ball estimates are uniform near each point and direction, and the manifold-level gluing rests on this ([`Convex.mem_strictInwardCone_iff`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Convex/Cone/StrictInward.html#Convex.mem_strictInwardCone_iff)).

### Notable definitions and infrastructure

- [`strictInwardTangentCone`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/VectorField/StrictInward.html#TauCeti.strictInwardTangentCone) is the open convex cone of strictly inward tangent vectors. It is the whole tangent space exactly at interior points and excludes zero on the boundary, which is the form §2.2's semiflow needs.
- [`IsRegularIncidenceParameter`](https://taucetiproject.org/docs/TauCeti/Analysis/Calculus/Incidence.html#TauCeti.IsRegularIncidenceParameter) is regularity of [`incidenceEquation`](https://taucetiproject.org/docs/TauCeti/Analysis/Calculus/Incidence.html#TauCeti.incidenceEquation) as a `TauCeti.IsRegularParameter`, the form that §§5.2–5.3 consume. For differentiable maps it is [surjectivity of `(u, v) ↦ D_xF u − Dj v`](https://taucetiproject.org/docs/TauCeti/Analysis/Calculus/Incidence.html#TauCeti.isRegularIncidenceParameter_iff_surjective), so it does not forget `Dj`.
- [`HasLocalPotentials`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Calculus/LocalPotentials.html#TauCeti.HasLocalPotentials) is the flat predicate for local potentials. It is local on open covers and pulls back along `C¹` maps.

### Roadmap coverage

Layer 1 is partial. The revised README states §1.1 for rough forms on `C¹` manifolds through Tau Ceti's `IsPrimitiveOn`, whose API now supplies uniqueness up to a constant. What exists here is the flat analogue on open subsets of a normed space. The manifold locality bullet is not established in the README's form, and §1.2 (the covering space and the continuous path integral) and §1.3 (exactness on simply connected manifolds) have not started. Layer 2 is partial. §2.1 is done, including chart invariance, existence of strictly inward fields and the half-line, quadrant and interior checks. §§2.2–2.5 (semiflow and inward domination, chain transfer, relative smooth chains, relative approximation) have not started. Layer 5 is partial. In §5.1, the definitions, the derivative formulas and avoidance are done; universal transversality, avoidance for countable families, and invariance under covers and affine maps are not. §§5.2–5.3 have not started. Layers 3 and 4 are untouched.

## The frontier

- **Inward semiflow and inward domination (§2.2)** — its local input, the strictly inward fields, is now in place. What remains is the forward semiflow in a convex model (existence, uniqueness, smoothness, entry into the interior, global existence after rescaling against a proper function) and `exists_smooth_inward_deformation`.
- **The Haar-null theorem (§5.2)** — `addHaar_setOf_not_isRegularIncidenceParameter` and its local form, via level-set charts of the incidence and Sard on countably many charts. It first needs the universal transversality hypothesis, which is not yet defined.
- **Finishing §5.1** — avoidance for countable families of regular parameters, and the reduction of regularity to open covers and affine changes of coordinates that §5.3 uses to pass to manifolds.
- **Local primitives on manifolds and the continuous path integral (§§1.1–1.2)** — state the locality bullet for rough forms on manifolds. Then prove that the primitive space is a covering for forms with local primitives, and define the monodromy integral with its homotopy invariance. Exactness on simply connected manifolds (§1.3) follows from these.
- **Transfer of smooth-chain equivalences (§2.3)** — this is formal and needs no inward domination, so it can start now.

<!--tauceti-status:v1 {"roadmap":"AdicSpacesPartV","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"regular-local-flat-ascent, regular-map-maximal-local, affinoid-localization-regular, and the rigid Zariski geometry of 0.1-0.4","state":"partial"},{"id":"Layer 1","state":"untouched"},{"id":"Layer 2","state":"untouched"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"}],"readme_sha":"1660cf601a3bfef778b9a07d29ee6ecab70c49a5a2f480ae46acb8fc8402ae51","roadmap":"AdicSpacesPartV","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: AdicSpacesPartV

This file documents the status of the AdicSpacesPartV roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Only the commutative-algebra groundwork at the start of Layer 0 has begun: one of the three regularity lemmas of §0.5 is proved. No rigid-geometric target of any layer has landed, and none of the end theorems has been started: Gauss-point closure, rigid resolution, the constant-rank normal form and the subfield identity theorem.

### Named results

- **Faithfully flat descent of regular maps** — if A → B → C are ring maps with A → C regular and C faithfully flat over B, then A → B is regular (Stacks, Tag 07NT). This is the roadmap's *regular-map-faithfully-flat-descent*, the step that will pass regularity from completed local rings down to affinoid localizations: [`RegularAlgebraMap.of_faithfullyFlat`](https://taucetiproject.org/docs/TauCeti/RingTheory/RegularLocalRing/RegularAlgebraMap/Basic.html#TauCeti.Excellence.RegularAlgebraMap.of_faithfullyFlat).
- **Descent of regularity for base changes** — if C is faithfully flat over B and S ⊗ C is a regular ring, then so is S ⊗ B. This is the ring-level input to the fibre argument above: [`IsRegularRing.tensorProduct_of_faithfullyFlat`](https://taucetiproject.org/docs/TauCeti/RingTheory/RegularLocalRing/Descent.html#TauCeti.IsRegularRing.tensorProduct_of_faithfullyFlat).
- **Descent of geometric regularity over a field** — the analogous statement for algebras over a field: [`GeometricallyRegular.of_faithfullyFlat`](https://taucetiproject.org/docs/TauCeti/RingTheory/RegularLocalRing/GeometricallyRegular.html#TauCeti.Excellence.GeometricallyRegular.of_faithfullyFlat).

### Roadmap coverage

Layer 0 is partial. Of §0.5, only the faithfully flat descent lemma is proved. The other two lemmas, *regular-local-flat-ascent* and *regular-map-maximal-local*, are still missing, and so is the target *affinoid-localization-regular* itself. Nothing has landed yet on Zariski closed subsets, local dimension, nowhere density or proper images (§§0.1–0.4). Layers 1–6 are untouched: normalization and components, regular and smooth loci, finite-extension points and Gauss closure, Shilov points, rigid resolution, and analytic manifolds and constant rank. The supplier floor that already exists in Tau Ceti, such as affinoid subdomains, flat local regularity transfer and the one-variable Gauss point, belongs to other roadmaps.

## The frontier

- **The rest of §0.5's regularity lemmas** — ascent of regularity along a flat local map with a regular closed fibre (Stacks, Tag 031E), and the criterion that A → B is regular iff each A_m → B_n is (Tag 07C0). Both are pure commutative algebra with no affinoid prerequisites.
- **Affinoid localizations are regular** — the affinoid-domain case needs the two lemmas above, all-characteristic affinoid excellence and the completion comparison at classical points from RigidAnalyticGeometry. The smooth case also waits on gap:complete-local-formal-smoothness-regular from SchemeAndStackFoundations.
- **Zariski closed subsets and local dimension (§§0.1–0.2)** — these need the coherent-sheaf contract and the rigid carrier from RigidAnalyticGeometry, and AdicEtaleGeometry A2.6's global dimension.
- **The constant rank theorem for analytic maps (§6.1)** — it consumes only Mathlib's analytic inverse function theorem, so it can proceed independently of the rigid layers.
- **Gauss-point closure of rational points (§3.4)** — the polydisc and one-variable Gauss point it builds on already exist in Tau Ceti. It still needs the finite-extension points of §3.1, the rational-point topology of §3.3 and a several-variable Gauss point.

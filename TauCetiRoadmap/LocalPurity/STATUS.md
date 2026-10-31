<!--tauceti-status:v1 {"roadmap":"LocalPurity","to_sha":"e177885ee120f8074a7610c3e60571ab00b20004","ts":"2026-10-24T06:33:22Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"miracle flatness: flat_of_isCohenMacaulay (00R4) and flat_of_normal_dim_two","state":"partial"},{"id":"Layer 1","remaining":"punctured spectrum and PurityHolds, finiteNormalEquiv, completion and hypersurface full faithfulness, local Lefschetz 0BLM","state":"untouched"},{"id":"Layer 2","remaining":"purity for regular local rings (0BMA), spreading out (0BQ5/0EY3), extension across points where purity holds (0EY7)","state":"partial"}],"readme_sha":"763a91b7c90c4be9907db9a19a560d834bab1afc54712ab09a4f1e94336afd2d","roadmap":"LocalPurity","to_sha":"e177885ee120f8074a7610c3e60571ab00b20004"}-->
# Status: LocalPurity

This file documents the status of the LocalPurity roadmap up until `e177885` (2026-10-24T06:33:22Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The discriminant half of Layer 0 is done, and so is the discriminant step of purity for regular local rings, which assumes flatness. Miracle flatness is only begun. Layer 1 (punctured spectra, finite normal algebras, completion, local Lefschetz) has not started, and none of the end theorems of Layer 2 is proved.

### Named results

- **The discriminant criterion** — a finite free algebra is étale iff the discriminant of a basis is a unit, over any commutative base, which is more general than the local base Stacks 0BJF uses ([`etale_iff_isUnit_discr`](https://taucetiproject.org/docs/TauCeti/RingTheory/Etale/Discriminant.html#TauCeti.Algebra.etale_iff_isUnit_discr)).
- **Étaleness via the trace form** — a finite-dimensional algebra over a field is étale iff its trace form is nondegenerate ([`etale_iff_traceForm_nondegenerate`](https://taucetiproject.org/docs/TauCeti/RingTheory/Etale/Discriminant.html#TauCeti.Algebra.etale_iff_traceForm_nondegenerate)).
- **Height-one detection of étaleness** — a finite free algebra over a Noetherian ring is étale iff its fibres over all primes of height at most one are étale, by Krull's principal ideal theorem ([`etale_iff_etale_fiber_of_height_le_one`](https://taucetiproject.org/docs/TauCeti/RingTheory/Etale/Purity.html#TauCeti.Algebra.etale_iff_etale_fiber_of_height_le_one)).
- **Purity for finite flat covers** — over a Noetherian local ring of dimension at least two, a finite flat algebra unramified at every prime off the closed point is étale. This is the last step of the dimension-two case of 0BMA, with flatness as a hypothesis ([`etale_of_isUnramifiedAt_of_two_le_ringKrullDim`](https://taucetiproject.org/docs/TauCeti/RingTheory/Etale/Purity.html#TauCeti.Algebra.etale_of_isUnramifiedAt_of_two_le_ringKrullDim)).
- **Regular local rings are Cohen–Macaulay** — a regular system of parameters is a regular sequence, so depth equals Krull dimension (Stacks 00NQ; [`isCohenMacaulay`](https://taucetiproject.org/docs/TauCeti/RingTheory/RegularLocalRing/CohenMacaulay.html#TauCeti.IsRegularLocalRing.isCohenMacaulay)). The §2.2 gluing argument needs this.

### Notable definitions and infrastructure

- **Discriminants under localization and base change** — the image of the discriminant in `A_𝔭` is a unit iff the localized algebra is étale ([`isUnit_discr_localization_iff`](https://taucetiproject.org/docs/TauCeti/RingTheory/Etale/Discriminant.html#TauCeti.Algebra.isUnit_discr_localization_iff)). This is the hook the 0BMA argument uses to rule out a nonunit discriminant at a height-one prime.
- **Simultaneous regular parameters on finite normal algebras** — over a two-dimensional regular local ring, every pair generating the maximal ideal is regular on a finite injective normal local algebra ([`isRegular_pair_of_finite_normal`](https://taucetiproject.org/docs/TauCeti/RingTheory/RegularLocalRing/FiniteNormal.html#TauCeti.IsRegularLocalRing.isRegular_pair_of_finite_normal)). This is meant to feed a regular-sequence criterion for freeness, and so the dimension-two flatness lemma.

### Roadmap coverage

Layer 0 is partial: §0.2 is done, covering the trace-form criterion, the discriminant criterion and its localization form, but §0.1 has neither `flat_of_isCohenMacaulay` nor `flat_of_normal_dim_two`. Layer 1 is untouched: the source has no punctured spectrum, `PurityHolds`, `finiteNormalEquiv`, completion comparison or `finiteEtale_extend_of_hypersurface`. Layer 2 is partial only in its ingredients. The discriminant step of §2.1 and the depth of regular local rings have landed, but `purityHolds_of_isRegularLocalRing`, `etale_of_finiteNormal_of_isRegularLocalRing`, `spread_from_localScheme` and `finiteEtale_extend_of_purity` are all missing.

## The frontier

- **Dimension-two miracle flatness** (`flat_of_normal_dim_two`) — turn the simultaneous regular parameters into freeness of a finite normal local algebra over a two-dimensional regular local ring. Combined with the finite flat purity result, this would essentially give the dimension-two case of 0BMA(2) after localizing at the maximal ideals of `B`.
- **General miracle flatness** (`flat_of_isCohenMacaulay`, Stacks 00R4) — the §2.1 base case needs the general form, because the localizations `B_𝔮` need not be finite over `A`. It depends on SchemeAndStackFoundations' Cohen–Macaulay API.
- **The punctured spectrum and `PurityHolds`** (§1.1) — the definitions and the faithfulness of restriction for depth at least one. Nothing in Layer 1 or the statement of 0BMA(1) can be written without them.
- **The finite normal anti-equivalence** (`finiteNormalEquiv`, corrected 0BM9) — this links clauses (1) and (2) of 0BMA. It needs §1.1 and depth-two section extension.
- **The local Lefschetz extension** (§§1.3–1.4) — completion and hypersurface full faithfulness, then 0BLM. This is the inductive step for dimension three and up, and the deepest prerequisite. It waits on SchemeAndStackFoundations' henselian pairs, local cohomology and formal completion.

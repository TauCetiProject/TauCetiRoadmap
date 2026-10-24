<!--tauceti-status:v1 {"roadmap":"PerfectoidSpaces","to_sha":"b4b3ce57a438a4ec6e21ef62e4a5607ae920a5e0","ts":"2026-10-23T19:26:26Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer P0","remaining":"BasicSetup itself (P0.1, P0.3) and all of almost modules and algebras; only the valuation-ring idempotence lemma is in","state":"partial"},{"id":"Layer P1","remaining":"iff_frobenius_surjective_modP in P1.1, then the tilt, perfectoid fields, theta, untilts and the tilting equivalence (P1.3-P1.33)","state":"partial"},{"id":"Layer P2","state":"untouched"},{"id":"Layer P3","state":"untouched"},{"id":"Layer P4","state":"untouched"},{"id":"Layer P5","state":"untouched"},{"id":"Layer P6","state":"untouched"},{"id":"Layer P7","state":"untouched"}],"readme_sha":"fc5faa3686ab6bbf35afdbb14affc764da31ed2247405503d66e1fc509c29562","roadmap":"PerfectoidSpaces","to_sha":"b4b3ce57a438a4ec6e21ef62e4a5607ae920a5e0"}-->
# Status: PerfectoidSpaces

This file documents the status of the PerfectoidSpaces roadmap up until `b4b3ce5` (2026-10-23T19:26:26Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The roadmap has started at the beginning of layer P1. The definition of a perfectoid Tate ring is in place, along with its characteristic-`p` characterisation, products, and the basic examples. Nothing beyond that has been built: no tilts or untilts, no almost mathematics past one valuation-ring lemma, and nothing geometric (P2–P7).

### Named results

- **Perfectoid equals perfect in characteristic `p`.** A complete Hausdorff Tate ring of characteristic `p` is perfectoid exactly when it is a perfect ring (Scholze, *Étale cohomology of diamonds*, Proposition 3.5): [`isPerfectoidTateRing_iff_perfectRing`](https://taucetiproject.org/docs/TauCeti/RingTheory/Perfectoid/PerfectRing.html#TauCeti.Perfectoid.isPerfectoidTateRing_iff_perfectRing).
- **Perfect complete Tate rings are uniform.** In characteristic `p`, perfectness alone makes `R°` bounded. The proof applies the open mapping theorem to Frobenius, and this is the substantive half of the previous result: [`IsUniform.of_perfectRing`](https://taucetiproject.org/docs/TauCeti/RingTheory/Huber/Perfect.html#TauCeti.Huber.IsUniform.of_perfectRing).
- **Algebraically closed fields are perfectoid.** Every complete algebraically closed nonarchimedean field with `‖p‖ < 1` is a perfectoid Tate ring, so in particular `ℂ_p` is: [`isPerfectoidTateRing_of_isAlgClosed`](https://taucetiproject.org/docs/TauCeti/RingTheory/Perfectoid/IsAlgClosed.html#TauCeti.Perfectoid.isPerfectoidTateRing_of_isAlgClosed).
- **Products of perfectoid rings.** `R × S` is perfectoid exactly when `R` and `S` are. This is the mechanism that allows mixed-characteristic products such as `K × K♭` with no base field: [`isPerfectoidTateRing_prod_iff`](https://taucetiproject.org/docs/TauCeti/RingTheory/Perfectoid/Basic.html#TauCeti.Perfectoid.isPerfectoidTateRing_prod_iff).
- **`ℚ_p` is not perfectoid.** Every pseudouniformiser of `ℚ_p` is too small for `ϖ^p` to divide `p`, even though Frobenius on `𝔽_p` is bijective. This is the README's guard against weakening the definition: [`not_isPerfectoidTateRing_padic`](https://taucetiproject.org/docs/TauCeti/RingTheory/Perfectoid/Padic.html#TauCeti.Perfectoid.not_isPerfectoidTateRing_padic).

### Notable definitions and infrastructure

- **Perfectoid Tate rings.** [`IsPerfectoidTateRing`](https://taucetiproject.org/docs/TauCeti/RingTheory/Perfectoid/Basic.html#TauCeti.Perfectoid.IsPerfectoidTateRing) is the predicate every later layer consumes, including the sousperfectoid frames of P3. It is stated on Tau Ceti's Huber rings with no fixed base field, and [`isPerfectoidTateRing_iff`](https://taucetiproject.org/docs/TauCeti/RingTheory/Perfectoid/Basic.html#TauCeti.Perfectoid.isPerfectoidTateRing_iff) repackages it as bijectivity of Frobenius on `R°/ϖ → R°/ϖ^p`.
- **The automatic-injectivity criterion.** [`IsPerfectoidTateRing.of_surjective`](https://taucetiproject.org/docs/TauCeti/RingTheory/Perfectoid/Basic.html#TauCeti.Perfectoid.IsPerfectoidTateRing.of_surjective) reduces perfectoidness to surjectivity of Frobenius modulo `ϖ^p`. Injectivity comes for free because `R°` is integrally closed ([`frobeniusModPow_injective`](https://taucetiproject.org/docs/TauCeti/RingTheory/Ideal/Quotient/Frobenius.html#TauCeti.frobeniusModPow_injective)). This is how the examples so far are proved.
- **Power-bounded subrings of products.** The identification [`(A × B)° = A° × B°`](https://taucetiproject.org/docs/TauCeti/RingTheory/Huber/Prod.html#TauCeti.Huber.powerBoundedSubring_prod), together with the [Tate-ring instance on products](https://taucetiproject.org/docs/TauCeti/RingTheory/Huber/Prod.html#TauCeti.Huber.IsTateRing.instProd), will also serve the product constructions later in the roadmap.

### Roadmap coverage

P1 is partial. P1.1 has the definition, the surjectivity criterion, uniformity and reducedness, transport along isomorphisms, products, and the zero-ring and `ℚ_p` boundaries. Still missing from P1.1 are the Frobenius-modulo-`p` criterion `iff_frobenius_surjective_modP` and the cyclotomic toric example ring. P1.2's headline equivalence is proved, but its supporting lemma on the adic completeness of rings of integral elements is not. Of the later examples, only the algebraically closed field case is in. The tilt, the sharp map, the almost setup of a perfectoid ring, perfectoid fields, `θ`, untilts and the tilting equivalence (P1.3–P1.33) have not begun. P0 is partial in only a nominal sense: the idempotence of a non-finitely-generated maximal ideal of a valuation domain (part of P0.3) is proved, but no basic setup, almost module or almost algebra exists. P2 through P7 are untouched.

## The frontier

- **The Frobenius-modulo-`p` criterion.** `IsPerfectoidTateRing.iff_frobenius_surjective_modP` completes P1.1, and P3.17a's sousperfectoid frames consume it. Together with `map_mem_powerBoundedSubring` and surjectivity of Frobenius on `R⁺/p`, this closes the layer's opening section.
- **Adic completeness of rings of integral elements.** This is the supporting lemma of P1.2. It makes `R⁺` satisfy the hypotheses of Mathlib's `PreTilt.untilt` and `fontaineTheta`, and it rests on AdicEtaleGeometry A1.0.2(i).
- **Compatible `p`-power roots and the tilt.** The next steps are P1.3's pseudouniformisers with compatible roots and spectral gauge, then `uniformTilt` (P1.7) before the perfectoid tilt (P1.4) and the sharp map (P1.5). The README orders these explicitly.
- **The basic setup.** P0.1's `BasicSetup` and P0.3's `BasicSetup.ofValuationRing` now have their idempotence input and the `𝒪_{ℂ_p}` non-finite-generation lemma available. After that, almost modules (P0.4–P0.6) can proceed independently of P1.
- **Perfectoid fields.** P1.10–P1.15 would connect the algebraically closed field example to the README's field-level characterisations and to Mathlib's `Tilt`.

<!--tauceti-status:v1 {"roadmap":"PerfectoidSpaces","to_sha":"fe8ca8b0765fa23cc5b5baaa3652c8efcd50ad3c","ts":"2026-10-24T01:02:20Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer P0","remaining":"the BasicSetup structure and everything after it; only the valuation-ring idempotence inputs of P0.3 are proved","state":"partial"},{"id":"Layer P1","remaining":"the mod-p Frobenius criterion and integral completeness in P1.1-P1.2, then P1.3 onward: tilts, theta, untilts, perfectoid fields","state":"partial"},{"id":"Layer P2","state":"untouched"},{"id":"Layer P3","state":"untouched"},{"id":"Layer P4","state":"untouched"},{"id":"Layer P5","state":"untouched"},{"id":"Layer P6","state":"untouched"},{"id":"Layer P7","state":"untouched"}],"readme_sha":"fc5faa3686ab6bbf35afdbb14affc764da31ed2247405503d66e1fc509c29562","roadmap":"PerfectoidSpaces","to_sha":"fe8ca8b0765fa23cc5b5baaa3652c8efcd50ad3c"}-->
# Status: PerfectoidSpaces

This file documents the status of the PerfectoidSpaces roadmap up until `fe8ca8b` (2026-10-24T01:02:20Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Work has started at the bottom of Layer P1. Perfectoid Tate rings are defined, their characteristic-`p` form is proved, and the first examples and non-examples are in. Almost mathematics (P0) has only its valuation-ring inputs. Nothing from tilting onward, and nothing in layers P2–P7, has begun.

### Named results

- **Perfectoid equals perfect in characteristic `p`.** A complete Hausdorff Tate ring of characteristic `p` is perfectoid exactly when it is a perfect ring (Scholze, ECD Proposition 3.5): [`isPerfectoidTateRing_iff_perfectRing`](https://taucetiproject.org/docs/TauCeti/RingTheory/Perfectoid/PerfectRing.html#TauCeti.Perfectoid.isPerfectoidTateRing_iff_perfectRing).
- **Perfect complete Tate rings are uniform.** In characteristic `p`, perfectness alone forces `R°` to be bounded. The proof uses the open mapping theorem to show Frobenius is open: [`IsUniform.of_perfectRing`](https://taucetiproject.org/docs/TauCeti/RingTheory/Huber/Perfect.html#TauCeti.Huber.IsUniform.of_perfectRing).
- **Surjectivity of Frobenius suffices.** Injectivity of `R°/ϖ → R°/ϖ^p` is automatic because `R°` is integrally closed (ECD Remark 3.2): [`IsPerfectoidTateRing.of_surjective`](https://taucetiproject.org/docs/TauCeti/RingTheory/Perfectoid/Basic.html#TauCeti.Perfectoid.IsPerfectoidTateRing.of_surjective).
- **Algebraically closed fields are perfectoid.** Every complete algebraically closed nonarchimedean field with `‖p‖ < 1` is a perfectoid Tate ring, `ℂ_p` included: [`isPerfectoidTateRing_of_isAlgClosed`](https://taucetiproject.org/docs/TauCeti/RingTheory/Perfectoid/IsAlgClosed.html#TauCeti.Perfectoid.isPerfectoidTateRing_of_isAlgClosed).
- **Products and the `ℚ_p` boundary.** A product is perfectoid exactly when both factors are, so mixed products like `K × K♭` are allowed: [`isPerfectoidTateRing_prod_iff`](https://taucetiproject.org/docs/TauCeti/RingTheory/Perfectoid/Basic.html#TauCeti.Perfectoid.isPerfectoidTateRing_prod_iff). By contrast, `ℚ_p` is [not perfectoid](https://taucetiproject.org/docs/TauCeti/RingTheory/Perfectoid/Padic.html#TauCeti.Perfectoid.not_isPerfectoidTateRing_padic).

### Notable definitions and infrastructure

- **Perfectoid Tate rings**, [`IsPerfectoidTateRing`](https://taucetiproject.org/docs/TauCeti/RingTheory/Perfectoid/Basic.html#TauCeti.Perfectoid.IsPerfectoidTateRing). The condition is stated over an arbitrary complete Hausdorff Tate ring with no base field, and it is equivalent to Frobenius being bijective ([`isPerfectoidTateRing_iff`](https://taucetiproject.org/docs/TauCeti/RingTheory/Perfectoid/Basic.html#TauCeti.Perfectoid.isPerfectoidTateRing_iff)). Every later layer is phrased in terms of it.
- **Frobenius on quotients.** [`frobeniusModPow`](https://taucetiproject.org/docs/TauCeti/RingTheory/Ideal/Quotient/Frobenius.html#TauCeti.frobeniusModPow) packages `A/(ϖ) → A/(ϖ^p)` as a ring map with injectivity and surjectivity criteria. The injectivity criterion for integrally closed subrings is what makes the surjectivity criterion work.
- **Power-bounded subrings of products.** The identity [`(A × B)° = A° × B°`](https://taucetiproject.org/docs/TauCeti/RingTheory/Huber/Prod.html#TauCeti.Huber.powerBoundedSubring_prod) and the [Tate-ring instance on products](https://taucetiproject.org/docs/TauCeti/RingTheory/Huber/Prod.html#TauCeti.Huber.IsTateRing.instProd) make products of mixed characteristic available.

### Roadmap coverage

**P1** is partial, and only at its start. P1.1 has the definition, its transport, reducedness, the product theorem, and the `ℚ_p` and zero-ring boundary cases. It still lacks `iff_frobenius_surjective_modP`, `map_mem_powerBoundedSubring` and the `ℂ_p[ε]/(ε²)` non-example. P1.2's main equivalence is proved, but the adic completeness of rings of integral elements and the perfectness of `R⁺` are not. P1.3 onward is untouched: pseudouniformisers with roots, the tilt, `θ`, untilts, perfectoid fields and the tilting equivalence. **P0** is partial only in the thinnest sense. The ring-theoretic inputs of P0.3 are proved: idempotence of a non-finitely-generated maximal ideal of a valuation domain, and non-finite-generation for `𝒪_{ℂ_p}`. There is no `BasicSetup` structure, almost category or later P0 material. **P2–P7** are untouched.

## The frontier

- **Finish P1.1.** Prove the Frobenius-modulo-`p` criterion `iff_frobenius_surjective_modP`, and `map_mem_powerBoundedSubring` for continuous maps into uniform Tate rings. Record `ℂ_p[ε]/(ε²)` as the non-uniform counterexample.
- **Integral elements are adically complete (P1.2).** This is needed before Mathlib's `PreTilt.untilt` and `fontaineTheta` can be applied. It rests on AdicEtaleGeometry A1.0.2(i)'s `isAdicComplete_of_completeSpace`.
- **The basic setup (P0.1–P0.3).** Define `Almost.BasicSetup` and `BasicSetup.ofValuationRing`. The idempotence lemmas are ready; the flatness of `m ⊗ m` is the remaining input.
- **Pseudouniformisers with compatible `p`-power roots (P1.3).** This is the next step toward the tilt.
- **The tilt (P1.4–P1.8).** This means `uniformTilt`, the sharp map, and the identification of the integral tilt with Mathlib's `PreTilt`. It opens the way to P1.9's almost setup, where P0 and P1 meet.

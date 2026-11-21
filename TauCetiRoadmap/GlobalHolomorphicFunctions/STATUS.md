<!--tauceti-status:v1 {"roadmap":"GlobalHolomorphicFunctions","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"Looman–Menchoff criterion, the packaged exists_laurent_decomposition headline, and confirmation of the Cauchy–Green items","state":"partial"},{"id":"Layer 1","remaining":"genus-one products over weighted countable zero data, exists_entire_genusOne_product and its divisor form","state":"partial"},{"id":"Layer 2","remaining":"explicit metric on the compact-open algebra H(U) and continuity of differentiation","state":"partial"},{"id":"Layer 3","remaining":"zero-free Runge approximation, prescribed zero orders, divisor realization, boundary noncontinuation","state":"untouched"},{"id":"Layer 4","remaining":"the holomorphic quotient corollary exists_holomorphic_quotient, waiting on Layer 3","state":"partial"},{"id":"Layer 6","state":"unassessed"},{"id":"Layer 7","remaining":"global smooth dbar solvability on arbitrary open sets, closed completion, two-form exactness, Cousin I","state":"untouched"}],"readme_sha":"976e295a27262e955ebd85708135ce1d2b6084278b7e25f78f5c1006093c6858","roadmap":"GlobalHolomorphicFunctions","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: GlobalHolomorphicFunctions

This file documents the status of the GlobalHolomorphicFunctions roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Two layers are now substantially built. Runge approximation on arbitrary open plane sets (Layer 2) and the Mittag-Leffler theorem with arbitrary isolated singularities (Layer 4) are both proved. The local Laurent theory and the product infrastructure of Layers 0–1 are partly in place. Divisor realization (Layer 3) and global ∂̄ with Cousin I (Layer 7) have not begun, and the examples layer has not been assessed.

### Named results

- **The Mittag-Leffler theorem for isolated singularities.** On any Ω ⊆ ℂ, open or not, take a relatively closed discrete set E with a holomorphic germ on a punctured neighbourhood of each point, essential singularities allowed. Then some function holomorphic on Ω \ E has exactly those singular germs modulo holomorphic ones ([`exists_holomorphic_prescribed_isolated_singularities`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/MittagLeffler.html#TauCeti.exists_holomorphic_prescribed_isolated_singularities)).
- **The classical Mittag-Leffler theorem.** Finitely many prescribed poles at each point of E are realized by a meromorphic function with no other poles ([`exists_meromorphic_prescribed_principal_parts`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/MittagLeffler.html#TauCeti.exists_meromorphic_prescribed_principal_parts)). The solution is unique up to a function holomorphic on Ω ([`exists_differentiableOn_eqOn_sub`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/MittagLeffler.html#TauCeti.HasPrescribedSingularities.exists_differentiableOn_eqOn_sub)).
- **Runge's theorem, domain-relative form.** A compact K ⊆ Ω has every function holomorphic near K uniformly approximable on K by functions holomorphic on Ω exactly when no component of Ω \ K is relatively compact in Ω (`isRungeCompactPair_iff_approximation`). As a consequence, the holomorphic hull of K is K with those components filled in (`holomorphicHull_eq_fill`).
- **The finite-rank Runge operator.** The Runge approximants can be taken to be a fixed linear combination of point evaluations, chosen independently of f. Approximation therefore preserves continuous, smooth or holomorphic dependence on parameters (`exists_finite_rank_runge_operator`).
- **Runge pole pushing.** On a filled compact set avoiding a disk, the negative Laurent part of a function is approximable by functions holomorphic on Ω. This is the step that lets Mittag-Leffler handle essential singularities ([`exists_differentiableOn_norm_laurentNegPart_sub_lt`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/Runge/Laurent.html#TauCeti.IsFilledIn.exists_differentiableOn_norm_laurentNegPart_sub_lt)).

### Notable definitions and infrastructure

- **Prescribed-singularity data** ([`HasPrescribedSingularities`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/MittagLeffler.html#TauCeti.HasPrescribedSingularities)) records a function together with its singular germs. It is closed under linear operations, restriction, translation, scaling and pullback along nowhere locally constant analytic maps, so later layers can apply it directly.
- **Laurent series on an annulus** (`HasLaurentSeriesOnAnnulus`) splits a function into its positive and negative parts. The negative part is holomorphic outside the inner disk and tends to zero at infinity, which yields a global singular representative for any isolated singularity ([`exists_analyticOnNhd_compl_singleton_tendsto_cocompact_sub_analyticAt`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/Laurent/Expansion.html#TauCeti.exists_analyticOnNhd_compl_singleton_tendsto_cocompact_sub_analyticAt)).
- **Runge compact pairs** (`IsRungeCompactPair`), together with the filled compact exhaustion of an open set, make up the exhaustion along which every global construction here is patched.

### Roadmap coverage

- **Layer 4** is done except for the quotient corollary, `exists_holomorphic_quotient`.
- **Layer 2** is done in its Runge content: the equivalence, the hull, the finite-rank operator and pole pushing. An explicit metric on the compact-open algebra H(U), with continuity of differentiation, was not located.
- **Layer 0** is partial. The Laurent decomposition's three parts are present in substance, though not as the single headline `exists_laurent_decomposition`. The Looman–Menchoff criterion is not located, and the status of the Cauchy–Green items is not established here.
- **Layer 1** is partial. The sharp finite-product majorant and a locally uniform holomorphic-product criterion with additive orders exist, and so does a genus-one product for the divisor of an entire function. The headline genus-one products over weighted countable data do not.
- **Layers 3 and 7** are untouched: none of their headline theorems appears.
- **Layer 6** has not been assessed.

## The frontier

- **Divisor realization (Layer 3).** The Weierstrass theorem on open sets remains: zero-free Runge approximation, holomorphic functions with prescribed zero orders, and meromorphic functions with a prescribed divisor. Runge (Layer 2) is available; the weighted genus-one products of Layer 1 are the missing input.
- **Holomorphic quotients.** Every meromorphic function on an open plane set should be a quotient of holomorphic functions (`exists_holomorphic_quotient`). This is blocked only on Layer 3.
- **The Laurent headline.** Packaging the existing positive and negative Laurent parts into `exists_laurent_decomposition` looks like a short step.
- **Global ∂̄ and Cousin I (Layer 7).** Smooth solvability of ∂̄g = f on an arbitrary open Ω is the first step; Cousin I and the vanishing of H²_dR follow from it. Only local Dolbeault exactness is present, and the Runge exhaustion it needs is now in place.
- **Looman–Menchoff (Layer 0.2).** The low-regularity Cauchy–Riemann criterion is independent of everything else and still open.

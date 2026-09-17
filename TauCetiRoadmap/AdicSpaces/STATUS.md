<!--tauceti-status:v1 {"roadmap":"AdicSpaces","to_sha":"2f71ccdae7c86f2d2bfbb07d1f8d5d3234db93d2","ts":"2026-09-09T16:23:07Z"}-->
# Status: AdicSpaces

This file documents the status of the AdicSpaces roadmap up until `2f71ccd` (2026-09-09T16:23:07Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer 1 is complete, and Layer 2 is now close to it: `Spa(A,A⁺)` is spectral, rational subsets form a basis and are stable under intersection, perturbation and passage to a localisation, and the emptiness criterion holds without extra hypotheses. Layer 3 has coordinate rings, restriction maps and a candidate structure presheaf but no stalk theory; Layer 4 has the algebraic chain up to Proposition 8.30 and nothing past it; Layers 5 and 6 have not begun.

### Named results

- **Spectrality of the adic spectrum** — `Spa(A,A⁺)` is [a spectral space](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AdicSpace/Spa/Spectral.html#TauCeti.ValuationSpectrum.instSpectralSpaceElemSpaOfIsHuberRing) for a Huber ring and a ring of integral elements, resting on the characterisation of the continuous locus inside `Spv(A,IA)`.

- **The rational-localisation homeomorphism** — the adic spectrum of the topological localisation `A(T/s)`, with plus ring the integral closure of `A⁺[T/s]`, is [homeomorphic to the rational subset `R(T/s)`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AdicSpace/Spa/Localization/Homeomorph.html#TauCeti.ValuationSpectrum.spaLocalizationHomeomorph); the corresponding statement for the completed ring `A⟨T/s⟩` is still open.

- **Wedhorn's emptiness criterion (Proposition 7.49(1))** — the adic spectrum of a Huber pair is [empty exactly when `1` lies in the closure of `0`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AdicSpace/Spa/Emptiness.html#TauCeti.ValuationSpectrum.spa_eq_empty_iff_one_mem_closure_zero), equivalently when the separated quotient is the zero ring.

- **The Laurent presentation of a numerator enlargement (Remark 7.55)** — adjoining one numerator presents `A⟨T'/s⟩` as [the Laurent quotient `A⟨T/s⟩⟨X⟩ / (t/s − X)`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RingTheory/Huber/LocalizationTopology/Laurent/Identification.html#TauCeti.Huber.PairOfDefinition.laurentQuotientRingEquiv), an isomorphism of topological rings and the chain Tate acyclicity runs along.

- **Flatness of rational restriction maps (Proposition 8.30)** — the restriction `A⟨T/s⟩ → A⟨T'/s⟩` of a numerator enlargement is [flat](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RingTheory/Huber/LocalizationTopology/Laurent/Flat.html#TauCeti.Huber.PairOfDefinition.flat_restrictionRingHomOfSubset_of_isStronglyNoetherian_base) when the completed localisation carrying the smaller presentation is strongly noetherian; that hypothesis is assumed, not established.

### Notable definitions and infrastructure

- **[The completed rational localisation](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RingTheory/Huber/LocalizationTopology/Completion.html#TauCeti.Huber.PairOfDefinition.toCompletionLoc)** — `A → A⟨T/s⟩` with its universal property for complete Hausdorff targets, now equipped with [restriction maps of numerator enlargements](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RingTheory/Huber/LocalizationTopology/Restriction.html#TauCeti.Huber.PairOfDefinition.restrictionRingHomOfSubset) satisfying the identity and composition laws. These are the transition maps the structure presheaf needs.

- **[Residue-field valuations](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AdicSpace/ResidueField.html#TauCeti.ValuationSpectrum.residueFieldValuation)** — every point of the valuation spectrum now carries a valuation on `κ(v)`, extending the quotient valuation on `A ⧸ supp v`. This is the datum a pre-adic space attaches to each point, and the target of the eventual stalk statement.

- **Stability of strong noetherianness** — it passes to [`A⟨X₁,…,Xₖ⟩`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RingTheory/Huber/StronglyNoetherian.html#TauCeti.Huber.IsStronglyNoetherian.restrictedMvPowerSeriesCompletion), to [any algebra strictly topologically of finite type](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RingTheory/Huber/TopologicallyFiniteType.html#TauCeti.Huber.IsStrictlyTopologicallyFiniteType.isStronglyNoetherian), and [along numerator enlargements](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RingTheory/Huber/LocalizationTopology/Laurent/StronglyNoetherian.html#TauCeti.Huber.PairOfDefinition.isStronglyNoetherian_completion_of_subset), resting on the topological iteration isomorphism `A⟨X₁,…,X_{k+m}⟩ ≅ A⟨X₁,…,Xₖ⟩⟨Y₁,…,Y_m⟩`.

### Roadmap coverage

Layer 0 has boundedness, Huber and Tate foundations, completion, restricted series with their universal properties and quotients, open mapping, and Proposition 6.18; Weierstrass theory and strong noetherianness of complete rank-one fields remain. Layer 1 is done, including vertical generization of continuous valuations. Layer 2 covers `Spa`, functoriality, spectrality, the rational basis, intersections, perturbation invariance, rational-in-rational, plus-ring recovery, emptiness, quotient pairs and closed polydiscs; Corollary 7.53, the standard-refinement Lemma 7.54, and most of the analytic-locus theory of Proposition 7.49(2) are not established here. Layer 3 has coordinate rings, presentation-change and enlargement restriction maps, the complete separated target category with all small limits, and a presentation-limit candidate presheaf, but not its identification with `A_U`, nor `𝒪_X⁺`, stalks or pre-adic spaces. Layer 4 has module base change, the Lemma 8.31 flatness statements and Proposition 8.30, but nothing on Čech exactness, sheafiness or stable uniformity. Layers 5 and 6 are untouched.

## The frontier

- **The completed coordinate ring `A_U = A⟨T/s⟩`** — carry the homeomorphism from the topological localisation `A(T/s)` to the completed one, prove `(A_U, A_U⁺)` is a Huber pair, and identify valuations and rational subsets across it. Everything in Layer 3 downstream waits on this.

- **Surjectivity of the rational evaluation map** — `A⟨X₁,…,Xₖ⟩ → A⟨T/s⟩` has dense range when the numerators and `s` generate the unit ideal; only closed range is missing. It would make `A⟨T/s⟩` strictly topologically of finite type, hence strongly noetherian over a strongly noetherian base, discharging the hypothesis Proposition 8.30 currently assumes.

- **Structure-presheaf local geometry** — identify the presentation limit with `A_U` on rational opens, define `𝒪_X⁺`, and prove that stalks are local with the point valuation supported at the maximal ideal. The residue-field valuations exist; nothing at stalk level does.

- **Tate acyclicity** — continue from Proposition 8.30 to Corollary 8.32, the two-piece Laurent cover of Lemma 8.33, and arbitrary finite rational covers. The last step needs Lemma 7.54, the standard rational refinement, which is not established.

- **Pre-adic spaces** — define `𝒱^pre`, its affinoid objects and the sheafiness predicates once the stalk package is in place; this is the entry point to Layers 5 and 6, both of which are empty.

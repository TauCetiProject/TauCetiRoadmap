<!--tauceti-status:v1 {"roadmap":"GlobalQuadraticForms","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 4","remaining":"the quadratic Hasse norm adapter (4.3) and transport of local predicates, local forms and records (4.1, item 2)","state":"partial"},{"id":"Layer 5","remaining":"the ternary case of 5.1 (needs 4.3), the unconditional quaternary case, and Hasse-Minkowski isotropy (5.5)","state":"partial"},{"id":"Layer 6","remaining":"scalar and form representation (6.1, 6.2) and Hasse-Minkowski isometry (6.3), after 5.5","state":"untouched"},{"id":"Layer 7","remaining":"uniqueness (7.4), which now needs only Hasse-Minkowski isometry (6.3)","state":"partial"},{"id":"Layer 8","remaining":"complete invariant theorem, global hyperbolicity, Witt injectivity and the SO kernel corollary, all after 6.3","state":"untouched"}],"readme_sha":"6611e03ebf7abd4261cc57287b962d61a6dbe7b3083d48131e833bd23dd7511d","roadmap":"GlobalQuadraticForms","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: GlobalQuadraticForms

This file documents the status of the GlobalQuadraticForms roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Of the two arithmetic inputs of Hasse–Minkowski, the global square theorem is proved, and with it the binary case; the quadratic Hasse norm adapter is not. The existence half of the classification is proved for number fields in every universe. The ternary case, Hasse–Minkowski in general, representation and isometry (Layer 6), uniqueness and the global classification (Layer 8) are still missing.

### Named results

- **The global square theorem** — a unit of `K` that is a square in `K_v` at every finite place outside a finite set is a square in `K`, with nothing assumed at the real places (O'Meara 65:15). It holds for number fields in every universe, and it makes the map from global to local square classes injective ([`Units.isSquare_of_isSquare_unitAtFinitePlace_of_notMem`](https://taucetiproject.org/docs/TauCeti/NumberTheory/QuadraticForm/Global/Squares.html#Units.isSquare_of_isSquare_unitAtFinitePlace_of_notMem)).
- **Hasse–Minkowski in dimension at most two** — a form of dimension at most two is isotropic exactly when it is locally isotropic. Isotropy at all but finitely many finite places already suffices, and no regularity hypothesis is needed ([`QuadraticForm.not_anisotropic_iff_isLocallyIsotropic_of_finrank_le_two`](https://taucetiproject.org/docs/TauCeti/NumberTheory/QuadraticForm/Global/LowRank.html#QuadraticForm.not_anisotropic_iff_isLocallyIsotropic_of_finrank_le_two)).
- **The quaternary case of Hasse–Minkowski** — a locally isotropic regular quaternary form is isotropic, provided the ternary case holds over every number field ([`QuadraticForm.not_anisotropic_of_isLocallyIsotropic_quaternary`](https://taucetiproject.org/docs/TauCeti/NumberTheory/QuadraticForm/Global/Quaternary.html#QuadraticForm.not_anisotropic_of_isLocallyIsotropic_quaternary)). A matching step reduces rank `n ≥ 5` to rank `n − 1`.
- **Realization of admissible systems** — every admissible system of rank, discriminant, finite Hasse signs and real positive indices is the system of a regular form on `Kⁿ` (O'Meara 72:1), over any number field. The form can be chosen isometric at every place to a prescribed local realization ([`GlobalFormInvariants.IsAdmissible.exists_globalForm`](https://taucetiproject.org/docs/TauCeti/NumberTheory/QuadraticForm/Global/Realization.html#TauCeti.NumberField.QuadraticForm.GlobalFormInvariants.IsAdmissible.exists_globalForm)). The proof does not use Hasse–Minkowski.
- **Local equivalence is equality of records** — two regular forms are isometric at every finite and real place exactly when they have the same rank, global discriminant, finite Hasse signs and real positive indices. The global square theorem supplies the discriminant ([`QuadraticForm.locallyEquivalent_iff_globalInvariants_eq`](https://taucetiproject.org/docs/TauCeti/NumberTheory/QuadraticForm/Global/Classification.html#QuadraticForm.locallyEquivalent_iff_globalInvariants_eq)).

### Notable definitions and infrastructure

- **The global-to-local map of Witt rings** — [`TauCeti.WittRing.globalToLocal`](https://taucetiproject.org/docs/TauCeti/NumberTheory/QuadraticForm/Global/WittLocalization.html#TauCeti.WittRing.globalToLocal), `W(K) → ∏_v W(K_v) × ∏_w W(ℝ)`. Its kernel is already [described by invariants](https://taucetiproject.org/docs/TauCeti/NumberTheory/QuadraticForm/Global/WittLocalization.html#TauCeti.WittRing.globalToLocal_eq_zero_iff), and its injectivity is 8.3.
- **Transport of forms along semilinear equivalences** — [`QuadraticMap.transport`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/QuadraticForm/Transport.html#QuadraticMap.transport) carries a form over `K` to a form over an isomorphic field, preserving regularity, anisotropy, representation and isometry. This is the form-level part of 4.1, item 2.
- **Transport of places along field isomorphisms** — the [bijection of infinite places](https://taucetiproject.org/docs/TauCeti/NumberTheory/NumberField/InfinitePlace/Transport.html#NumberField.InfinitePlace.equivOfRingEquiv) induced by `K ≃+* L` comes with matching statements for finite places, local squares, Hilbert symbols and local norm equations. These carry results proved in `Type` to every universe.

### Roadmap coverage

Layer 4 is partial. The global square theorem (4.2) is done. In 4.1, the inputs stated in `Type` hold in every universe, the quadratic Hasse norm theorem in coordinates included. Forms transport along isomorphisms, but the local predicates, local forms and records do not yet. The quadratic Hasse norm adapter (4.3) is missing. Layer 5 is partial: the binary case of 5.1 is done, and the ternary case, the unconditional quaternary case and 5.5 are missing. Layer 6 is untouched. Layer 7 is partial: 7.2 and 7.3 are proved by a route that bypasses 6.2, and uniqueness (7.4) is missing. Layer 8 is untouched, though its hyperbolicity and Witt-kernel inputs are in place.

## The frontier

- **The quadratic Hasse norm adapter (4.3)** — identify solvability of `a = x² − d y²` in each completion with local representation of `a` by `⟨1, −d⟩`. The coordinate theorem is already available in every universe, so nothing upstream blocks this.
- **The ternary case of 5.1** — diagonalize to `⟨1, −d⟩ ⊥ ⟨−a⟩` and apply 4.3. This also makes the quaternary case unconditional.
- **Hasse–Minkowski isotropy (5.5)** — once the ternary case is in, an induction over steps that are already proved.
- **Representation, isometry and uniqueness (6.1 to 6.3, 7.4)** — after 5.5. Uniqueness then needs nothing beyond 6.3, since equal records already give local isometry. The complete invariant theorem (8.1), hyperbolicity (8.2) and Witt injectivity (8.3) follow.
- **Transport of local predicates, local forms and records (4.1, item 2)** — the form-level transport exists. The localization comparisons along `adicCompletionCongr` and the reindexing of records are still to be written.

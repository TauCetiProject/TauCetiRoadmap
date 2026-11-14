<!--tauceti-status:v1 {"roadmap":"GlobalQuadraticForms","to_sha":"e06d6728b2f32e212d12e96ddcd366c4445e9e10","ts":"2026-11-11T00:57:04Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 4","remaining":"the global square theorem (4.2), the quadratic Hasse norm adapter (4.3), and transport of forms and records in 4.1","state":"partial"},{"id":"Layer 5","remaining":"binary and ternary cases of 5.1 (need 4.2 and 4.3), then Hasse-Minkowski isotropy (5.5)","state":"untouched"},{"id":"Layer 6","remaining":"scalar and form representation (6.1, 6.2) and Hasse-Minkowski isometry (6.3), after 5.5","state":"untouched"},{"id":"Layer 7","remaining":"uniqueness (7.4, needs 6.3), and 7.2 and 7.3 for number fields outside Type","state":"partial"},{"id":"Layer 8","remaining":"complete invariant theorem, global hyperbolicity, Witt injectivity and the SO kernel corollary, all after 6.3","state":"untouched"}],"readme_sha":"fcf0a0353665a55ff1a4d96b3fa0ba939d536e0006f01dd635f0b254efe04b3a","roadmap":"GlobalQuadraticForms","to_sha":"e06d6728b2f32e212d12e96ddcd366c4445e9e10"}-->
# Status: GlobalQuadraticForms

This file documents the status of the GlobalQuadraticForms roadmap up until `e06d672` (2026-11-11T00:57:04Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The existence theorem is proved for number fields in `Type`, and global forms with any admissible system of local invariants exist, without Hasse–Minkowski. Layer 4 is partial: transport has begun, and the global square theorem and quadratic Hasse norm adapter are missing. Hasse–Minkowski itself (Layer 5), representation and isometry (Layer 6), uniqueness and the global classification (Layer 8) have not begun.

### Named results

- **Realization of admissible systems** — every admissible system of rank, discriminant, finite Hasse signs and real positive indices is the system of a regular form on `Kⁿ` (O'Meara 72:1), and the form can be chosen [isometric at every place](https://taucetiproject.org/docs/TauCeti/NumberTheory/QuadraticForm/Global/Realization.html#TauCeti.NumberField.QuadraticForm.GlobalFormInvariants.IsAdmissible.exists_globalForm_equivalent_at_places) to any prescribed local realization ([`GlobalFormInvariants.IsAdmissible.exists_globalForm`](https://taucetiproject.org/docs/TauCeti/NumberTheory/QuadraticForm/Global/Realization.html#TauCeti.NumberField.QuadraticForm.GlobalFormInvariants.IsAdmissible.exists_globalForm)).
- **Hilbert sign prescription** — for `b ∈ Kˣ` and an even set of places at which `b` is a nonsquare, some `a` has `(a, b)_v = -1` exactly there (O'Meara 71:19a), now for number fields in every universe ([`exists_hilbertSymbol_eq_ite`](https://taucetiproject.org/docs/TauCeti/NumberTheory/QuadraticForm/Global/SignPrescription.html#TauCeti.NumberField.QuadraticForm.exists_hilbertSymbol_eq_ite)).
- **The Hasse product formula** — the finite and real Hasse signs of a regular form multiply to one, so the invariants of every positive-rank form are admissible ([`QuadraticForm.globalInvariants_hasseProduct_eq_one`](https://taucetiproject.org/docs/TauCeti/NumberTheory/QuadraticForm/Global/ProductFormula.html#QuadraticForm.globalInvariants_hasseProduct_eq_one)).
- **The quaternary case of Hasse–Minkowski** — a locally isotropic regular quaternary form is isotropic, provided the ternary case holds over every number field ([`QuadraticForm.not_anisotropic_of_isLocallyIsotropic_quaternary`](https://taucetiproject.org/docs/TauCeti/NumberTheory/QuadraticForm/Global/Quaternary.html#QuadraticForm.not_anisotropic_of_isLocallyIsotropic_quaternary)). A matching step reduces rank `n ≥ 5` to rank `n − 1`.
- **The kernel of the global-to-local Witt map** — a Witt class vanishes at every finite and real place exactly when it has even dimension, its signed discriminant and Clifford invariant are locally trivial, and its signatures vanish ([`TauCeti.WittRing.globalToLocal_eq_zero_iff`](https://taucetiproject.org/docs/TauCeti/NumberTheory/QuadraticForm/Global/WittLocalization.html#TauCeti.WittRing.globalToLocal_eq_zero_iff)).

### Notable definitions and infrastructure

- **The orthogonal sum of invariant systems** — [`GlobalFormInvariants.prod`](https://taucetiproject.org/docs/TauCeti/NumberTheory/QuadraticForm/Global/OrthogonalSum.html#TauCeti.NumberField.QuadraticForm.GlobalFormInvariants.prod) mirrors `Q ⊥ R` on records. With it, a line can be split off any admissible system of rank at least four, leaving an admissible complement, and this is what drives realization by induction on the rank.
- **The global-to-local map of Witt rings** — [`TauCeti.WittRing.globalToLocal`](https://taucetiproject.org/docs/TauCeti/NumberTheory/QuadraticForm/Global/WittLocalization.html#TauCeti.WittRing.globalToLocal), `W(K) → ∏_v W(K_v) × ∏_w W(ℝ)`, is the map whose injectivity is 8.3. Its value on the Witt class of a form is the family of localizations.
- **Transport of places along field isomorphisms** — the [bijection of infinite places](https://taucetiproject.org/docs/TauCeti/NumberTheory/NumberField/InfinitePlace/Transport.html#NumberField.InfinitePlace.equivOfRingEquiv) induced by `K ≃+* L`, with the matching statements for finite places, local squares and Hilbert symbols. These carry statements proved in `Type` to number fields in every universe.

### Roadmap coverage

Layer 4 is partial. In 4.1, places, local squares and Hilbert symbols transport along isomorphisms. Six of the seven inputs hold in every universe; the quadratic Hasse norm theorem in coordinates is still stated only in `Type`. Transport of forms, local forms and records is not written. The global square theorem (4.2) and the quadratic Hasse norm adapter (4.3) are missing. The rewritten roadmap counts the conditional quaternary and rank-at-least-five steps as existing inputs, so none of Layer 5's own milestones is proved: the binary and ternary cases, the unconditional quaternary case and 5.5 are all missing. Layer 6 is untouched. Layer 7 is partial: 7.2 and 7.3 are proved for number fields in `Type`, by a route that bypasses 6.2. Uniqueness (7.4) is missing. Layer 8 is untouched, although its hyperbolicity and Witt-kernel inputs are in place.

## The frontier

- **The global square theorem (4.2)** — O'Meara 65:15 by the pinned idele route. Its inputs (square-class approximation, surjectivity of the idele-class norm, the first inequality) are in the library, so nothing upstream blocks it. The binary case of 5.1 follows from it.
- **The quadratic Hasse norm adapter (4.3) and the ternary case** — match solvability of `a = x² − d y²` in completions with local representation by `⟨1, −d⟩`, then the ternary chain of 5.1. That also makes the quaternary case unconditional.
- **Hasse–Minkowski isotropy (5.5)** — once 5.1 is in, this is an induction over steps that are already proved.
- **Representation, isometry and uniqueness (6.1 to 6.3, 7.4)** — scalar and form representation, then Hasse–Minkowski isometry, from which uniqueness and the complete invariant theorem (8.1) follow. Hyperbolicity and Witt injectivity (8.2, 8.3) then use the Witt-kernel description already proved.
- **Transport of forms and records (4.1, item 2)** — needed to state realization, and the Hasse norm input, for number fields in every universe.

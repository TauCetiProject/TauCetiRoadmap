<!--tauceti-status:v1 {"roadmap":"GlobalQuadraticForms","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3","ts":"2026-11-13T23:20:12Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 4","remaining":"the global square theorem (4.2), the quadratic Hasse norm adapter (4.3), and transport of forms and records in 4.1","state":"partial"},{"id":"Layer 5","remaining":"binary and ternary cases of 5.1 (need 4.2 and 4.3), then Hasse-Minkowski isotropy (5.5)","state":"untouched"},{"id":"Layer 6","remaining":"scalar and form representation (6.1, 6.2) and Hasse-Minkowski isometry (6.3), after 5.5","state":"untouched"},{"id":"Layer 7","remaining":"uniqueness (7.4), which needs Hasse-Minkowski isometry (6.3)","state":"partial"},{"id":"Layer 8","remaining":"complete invariant theorem, global hyperbolicity, Witt injectivity and the SO kernel corollary, all after 6.3","state":"untouched"}],"readme_sha":"18c5f7da5dc4323b2a1a95c0c7d94b162475d789c90b33a18b1bf3aa239f0409","roadmap":"GlobalQuadraticForms","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3"}-->
# Status: GlobalQuadraticForms

This file documents the status of the GlobalQuadraticForms roadmap up until `aa6e43e` (2026-11-13T23:20:12Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The existence theorem is proved for number fields in every universe: every admissible system of local invariants comes from a global form, and the proof does not use Hasse–Minkowski. Layer 4 is partial, because the global square theorem and the quadratic Hasse norm adapter are missing. Hasse–Minkowski itself (Layer 5), representation and isometry (Layer 6), uniqueness, and the global classification (Layer 8) have not begun.

### Named results

- **Realization of admissible systems** — every admissible system of rank, discriminant, finite Hasse signs and real positive indices is the system of a regular form on `Kⁿ` (O'Meara 72:1), now over any number field, and the form can be chosen [isometric at every place](https://taucetiproject.org/docs/TauCeti/NumberTheory/QuadraticForm/Global/Realization.html#TauCeti.NumberField.QuadraticForm.GlobalFormInvariants.IsAdmissible.exists_globalForm_equivalent_at_places) to any prescribed local realization ([`GlobalFormInvariants.IsAdmissible.exists_globalForm`](https://taucetiproject.org/docs/TauCeti/NumberTheory/QuadraticForm/Global/Realization.html#TauCeti.NumberField.QuadraticForm.GlobalFormInvariants.IsAdmissible.exists_globalForm)).
- **Hilbert sign prescription** — for `b ∈ Kˣ` and an even set of places at which `b` is a nonsquare, some `a` has `(a, b)_v = -1` exactly there (O'Meara 71:19a), for number fields in every universe ([`exists_hilbertSymbol_eq_ite`](https://taucetiproject.org/docs/TauCeti/NumberTheory/QuadraticForm/Global/SignPrescription.html#TauCeti.NumberField.QuadraticForm.exists_hilbertSymbol_eq_ite)).
- **The Hasse product formula** — the finite and real Hasse signs of a regular form multiply to one, so the invariants of every positive-rank form are admissible ([`QuadraticForm.globalInvariants_hasseProduct_eq_one`](https://taucetiproject.org/docs/TauCeti/NumberTheory/QuadraticForm/Global/ProductFormula.html#QuadraticForm.globalInvariants_hasseProduct_eq_one)).
- **The quaternary case of Hasse–Minkowski** — a locally isotropic regular quaternary form is isotropic, provided the ternary case holds over every number field ([`QuadraticForm.not_anisotropic_of_isLocallyIsotropic_quaternary`](https://taucetiproject.org/docs/TauCeti/NumberTheory/QuadraticForm/Global/Quaternary.html#QuadraticForm.not_anisotropic_of_isLocallyIsotropic_quaternary)). A matching step reduces rank `n ≥ 5` to rank `n − 1`.
- **The kernel of the global-to-local Witt map** — a Witt class vanishes at every finite and real place exactly when it has even dimension, its signed discriminant and Clifford invariant are locally trivial, and its signatures vanish ([`TauCeti.WittRing.globalToLocal_eq_zero_iff`](https://taucetiproject.org/docs/TauCeti/NumberTheory/QuadraticForm/Global/WittLocalization.html#TauCeti.WittRing.globalToLocal_eq_zero_iff)).

### Notable definitions and infrastructure

- **The orthogonal sum of invariant systems** — [`GlobalFormInvariants.prod`](https://taucetiproject.org/docs/TauCeti/NumberTheory/QuadraticForm/Global/OrthogonalSum.html#TauCeti.NumberField.QuadraticForm.GlobalFormInvariants.prod) mirrors `Q ⊥ R` on records. It lets a line be split off any admissible system of rank at least four with an admissible complement, and that split drives realization by induction on the rank.
- **The global-to-local map of Witt rings** — [`TauCeti.WittRing.globalToLocal`](https://taucetiproject.org/docs/TauCeti/NumberTheory/QuadraticForm/Global/WittLocalization.html#TauCeti.WittRing.globalToLocal), `W(K) → ∏_v W(K_v) × ∏_w W(ℝ)`, is the map whose injectivity is 8.3.
- **Transport of places along field isomorphisms** — the [bijection of infinite places](https://taucetiproject.org/docs/TauCeti/NumberTheory/NumberField/InfinitePlace/Transport.html#NumberField.InfinitePlace.equivOfRingEquiv) induced by `K ≃+* L`, with matching statements for finite places, local squares and Hilbert symbols. These carry results proved in `Type` to number fields in every universe.

### Roadmap coverage

Layer 4 is partial. In 4.1, places, local squares and Hilbert symbols transport along isomorphisms, and six of the seven inputs hold in every universe. The quadratic Hasse norm theorem in coordinates is still stated only in `Type`, and transport of forms, local forms and records (item 2) is not written. The global square theorem (4.2) and the quadratic Hasse norm adapter (4.3) are missing. None of Layer 5's own milestones is proved: the binary and ternary cases, the unconditional quaternary case and 5.5 are all missing. Layer 6 is untouched. Layer 7 is partial: 7.2 and 7.3 are proved in every universe by a route that bypasses 6.2, and uniqueness (7.4) is missing. Layer 8 is untouched, although its hyperbolicity and Witt-kernel inputs are in place.

## The frontier

- **The global square theorem (4.2)** — O'Meara 65:15 by the pinned idele route. Its inputs (square-class approximation, surjectivity of the idele-class norm, the first inequality) are in the library, so nothing upstream blocks it. The binary case of 5.1 follows from it.
- **The quadratic Hasse norm adapter (4.3) and the ternary case** — match solvability of `a = x² − d y²` in completions with local representation by `⟨1, −d⟩`, then the ternary chain of 5.1. This also makes the quaternary case unconditional. The norm theorem still has to be carried out of `Type`.
- **Hasse–Minkowski isotropy (5.5)** — once 5.1 is in, this is an induction over steps that are already proved.
- **Representation, isometry and uniqueness (6.1 to 6.3, 7.4)** — scalar and form representation, then Hasse–Minkowski isometry, from which uniqueness and the complete invariant theorem (8.1) follow. Hyperbolicity and Witt injectivity (8.2, 8.3) then use the Witt-kernel description already proved.
- **Transport of forms and records (4.1, item 2)** — realization no longer needs it, but the roadmap still lists it as a milestone of 4.1.

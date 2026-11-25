<!--tauceti-status:v1 {"roadmap":"ResolutionOfSingularitiesCharacteristicZero","to_sha":"58174b5fcdf1ac017fecf4e3c64a05b1c92a4fe2","ts":"2026-11-25T12:15:24Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"regular coordinates, scheme stalk order, SNC boundaries, permissible centres, controlled transforms, test equivalence, normalized orders; closed affine cosupport","state":"partial"},{"id":"Layer 2","remaining":"maximal contact, coefficient and residual presentations, finite-degree criterion, Samuel jets and semicoherence; Hilbert-Samuel completion invariance","state":"partial"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"}],"readme_sha":"4475710d5731c9a130dda374a885a08fac84ca7fc260db10db9b4fe63e9d248f","roadmap":"ResolutionOfSingularitiesCharacteristicZero","to_sha":"58174b5fcdf1ac017fecf4e3c64a05b1c92a4fe2"}-->
# Status: ResolutionOfSingularitiesCharacteristicZero

This file documents the status of the ResolutionOfSingularitiesCharacteristicZero roadmap up until `58174b5` (2026-11-25T12:15:24Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Only the affine and formal algebra at the base of Layers 1 and 2 has landed. This covers ideal order and affine marked ideals, Hironaka's formal division, the Hilbert–Samuel function of a formal ideal with its lexicographic stabilization, and derivative ideals at rational points. The scheme-level theory has not begun: marked ideal sheaves, SNC boundaries, transforms, test equivalence and maximal contact. Layers 3–7 have not begun either.

### Named results

- **Hironaka's formal division theorem** — every power series has a unique quotient-and-remainder decomposition against finitely many series with prescribed graded-lexicographic initial exponents. This is the roadmap's `formalDivision` target in exactly its suggested form ([`TauCeti.formalDivision`](https://taucetiproject.org/docs/TauCeti/RingTheory/MvPowerSeries/FormalDivision.html#TauCeti.formalDivision)). The general version holds for any monomial order over any ring with unit initial coefficients ([`existsUnique_formalDivision`](https://taucetiproject.org/docs/TauCeti/RingTheory/MvPowerSeries/FormalDivision.html#MonomialOrder.existsUnique_formalDivision)).
- **Lexicographic Hilbert–Samuel stabilization** — in finitely many variables over a field, lexicographically nonincreasing Hilbert–Samuel functions of ideals of `K[[X]]` are eventually constant. This is the roadmap's `hsLexStabilization` target ([`exists_forall_ge_localQuotientHilbertSamuel_eq_of_antitone`](https://taucetiproject.org/docs/TauCeti/RingTheory/MvPowerSeries/HilbertSamuel.html#MvPowerSeries.exists_forall_ge_localQuotientHilbertSamuel_eq_of_antitone)).
- **The Hilbert–Samuel function counts the complement of the initial diagram** — its value at ℓ is the number of exponents of degree at most ℓ outside the graded-lexicographic diagram of initial exponents ([`localQuotientHilbertSamuel_eq_ncard_diff_initialDiagram`](https://taucetiproject.org/docs/TauCeti/RingTheory/MvPowerSeries/HilbertSamuel.html#Ideal.localQuotientHilbertSamuel_eq_ncard_diff_initialDiagram)).
- **The cosupport of a marked sum** — over a regular ring, the cosupport of `(Iᵇ + Jᵃ, ab)` is the intersection of the cosupports of `(I, a)` and `(J, b)`, and rescaling `(I, d)` to `(Iᵏ, kd)` does not change it ([`cosupport_sum`](https://taucetiproject.org/docs/TauCeti/RingTheory/MarkedIdeal.html#TauCeti.MarkedIdeal.cosupport_sum)).
- **Order-one equations in iterated derivative ideals** — in characteristic zero, at a rational point where an ideal has finite positive order d, the (d−1)-st iterated derivative ideal contains a polynomial of order one there. This is the algebraic germ of maximal contact ([`exists_orderAt_eq_one_mem_derivativeIdeal_iterate`](https://taucetiproject.org/docs/TauCeti/RingTheory/MvPolynomial/Ideal/Derivative.html#Ideal.exists_orderAt_eq_one_mem_derivativeIdeal_iterate)).

### Notable definitions and infrastructure

- **Ideal order at a prime** ([`Ideal.orderAt`](https://taucetiproject.org/docs/TauCeti/RingTheory/Ideal/Order.html#Ideal.orderAt)) is the local algebraic order behind every cosupport. It agrees with formal order in power series charts and with Taylor order at rational points of polynomial charts. It is multiplicative wherever the associated graded ring has no zero divisors. For regular local rings, the identification of that graded ring with a polynomial ring is in place ([`associatedGradedEquiv`](https://taucetiproject.org/docs/TauCeti/RingTheory/RegularLocalRing/AssociatedGraded.html#TauCeti.IsRegularLocalRing.associatedGradedEquiv)).
- **The diagram of initial exponents** ([`initialDiagram`](https://taucetiproject.org/docs/TauCeti/RingTheory/MvPowerSeries/InitialDiagram.html#MonomialOrder.initialDiagram)) is an upper set with finitely many vertices. It turns Hilbert–Samuel questions into counting problems on exponents.
- **Affine marked ideals** ([`TauCeti.MarkedIdeal`](https://taucetiproject.org/docs/TauCeti/RingTheory/MarkedIdeal.html#TauCeti.MarkedIdeal)) pair an ideal with a positive mark, and come with rescaling and the marked sum. They are the affine carrier of §1.10, separate from the global marked ideals on smooth schemes in §1.4.

### Roadmap coverage

Layer 1 is partial. Its affine part, §1.10, is done apart from closedness of the cosupport on regular finite-type rings. The formal-chart order formula of §1.2 is done. Everything geometric remains: regular coordinates, stalk order on schemes, birth-ordered SNC boundaries, permissible centres, controlled transforms, test equivalence and normalized orders. Layer 2 is partial. Initial diagrams (§2.5), formal division (§2.6), both forms of stabilization (§2.8) and derivative ideals at rational points (§2.15) are done. The Hilbert–Samuel function (§2.7) lacks completion invariance and the closed-point scheme version. Maximal contact, coefficient and residual presentations, the finite-degree criterion and the Samuel jet, presentation and semicoherence results are untouched. Layers 3–7 are untouched.

## The frontier

- **Completion invariance of the Hilbert–Samuel function** (§2.7) — show that each value equals the value for the extended ideal in the maximal-adic completion. This links the local ring to the formal computations already proved.
- **Closed cosupport** (§1.10) — the affine cosupport of a marked ideal is closed on a regular ring of finite type over a characteristic-zero field. This is the one affine Layer 1 item still open.
- **Finite-degree criterion** (§2.9) — a spanning threshold for the supported-division families of a monotone diagram. It is purely combinatorial on top of the initial diagram, and it feeds Hilbert–Samuel semicoherence.
- **Global marked ideals and controlled transforms** (§§1.2–1.6) — stalk order, labelled SNC boundaries and transforms under blowup on smooth schemes. These need the blowups of StableReduction Layer 4 and the presentation and marked-tower carriers, which the roadmap says are not yet available.
- **Abstract field resolution** (`exists_resolution`, §§5.5, 7.8) — the summit statement for finite-type schemes over a characteristic-zero field. It needs all of Layers 1–5 and is far off.

<!--tauceti-status:v1 {"roadmap":"NoncommutativeGeometry","to_sha":"69cd1ab4dcfbb6676e344f3f193e63473eab5a3d","ts":"2026-10-25T14:11:34Z"}-->
# Status: NoncommutativeGeometry

This file documents the status of the NoncommutativeGeometry roadmap up until `69cd1ab` (2026-10-25T14:11:34Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** For unital algebras, the algebraic cyclic theory of N1 is mostly in place: the (b, B) operators, the comparison with the cyclic bicomplex, Hochschild cohomology, and cycles with their characters. SBI exactness, periodic cohomology and the higher universal forms are still missing. N2 has both of Connes' pairings, with their stabilization and invariance properties, but no K-theory for them to descend to. N3–N7 have not begun.

### Named results

- **Cyclic cochains compute the cyclic bicomplex** — over a ring containing ℚ, the inclusion of Connes' cyclic cochain complex into the total complex of the cyclic bicomplex is a quasi-isomorphism ([`quasiIso_cyclicCochainComplexToTotal`](https://taucetiproject.org/docs/TauCeti/RingTheory/CyclicCohomology/Bicomplex.html#TauCeti.quasiIso_cyclicCochainComplexToTotal)). A degreewise version only needs 1, …, m to be invertible.
- **Cyclic cohomology of the ground ring** — in even degree it is the coefficient module, via the product cochain, whenever 2 is not a zero divisor ([`selfEquiv`](https://taucetiproject.org/docs/TauCeti/RingTheory/CyclicCohomology/GroundRing.html#TauCeti.cyclicCohomology.selfEquiv)). In odd degree it vanishes ([`isZero_cyclicCohomology_self_of_odd`](https://taucetiproject.org/docs/TauCeti/RingTheory/CyclicCohomology/GroundRing.html#TauCeti.isZero_cyclicCohomology_self_of_odd)).
- **Connes' even pairing** — for an idempotent matrix e, the value (m!)⁻¹(φ#Tr)(e,…,e) depends only on the class of φ. It is invariant under conjugation by units ([`evenPairing_units_conj`](https://taucetiproject.org/docs/TauCeti/RingTheory/CyclicCohomology/EvenPairing/Invariance.html#TauCeti.cyclicCohomology.evenPairing_units_conj)) and polynomial homotopy, and additive on direct sums.
- **Connes' odd pairing** — an invertible u pairs with an odd class through (1+i)⁻¹ 2⁻ⁿ Γ(n/2+1)⁻¹ φ(u⁻¹−1, u−1, …) ([`oddPairing`](https://taucetiproject.org/docs/TauCeti/RingTheory/CyclicCohomology/OddPairing.html#TauCeti.cyclicCohomology.oddPairing)). The pairing is unchanged under u ↦ u ⊕ 1 ([`oddPairing_matrixExtension_of_val_eq_fromBlocks_one`](https://taucetiproject.org/docs/TauCeti/RingTheory/CyclicCohomology/OddPairing.html#TauCeti.cyclicCohomology.oddPairing_matrixExtension_of_val_eq_fromBlocks_one)) and additive on direct sums.
- **The character of a cycle** — for a differential graded algebra with a closed graded trace and a map ρ that need not preserve units, ∫ρ(a₀)dρ(a₁)⋯dρ(aₙ) is a cyclic cocycle ([`cycleCocycle`](https://taucetiproject.org/docs/TauCeti/RingTheory/CyclicCohomology/Cycle.html#TauCeti.cycleCocycle)).

### Notable definitions and infrastructure

- [Relative cyclic cohomology](https://taucetiproject.org/docs/TauCeti/RingTheory/CyclicCohomology/Relative.html#TauCeti.relativeCyclicCohomology), the kernel of scalar restriction on the forced unitization, is the README's nonunital convention and the base for nonunital pairings.
- [Matrix extension on cyclic cohomology](https://taucetiproject.org/docs/TauCeti/RingTheory/CyclicCohomology/Matrix.html#TauCeti.cyclicCohomology.matrixExtension), the generalized trace φ#Tr, commutes with b, B and the cyclic operators. It carries both pairings and is the ingredient for Morita invariance.
- [Continuous cyclic cochains](https://taucetiproject.org/docs/TauCeti/RingTheory/CyclicCohomology/Continuous.html#TauCeti.continuousCyclicCochains) on algebras with jointly continuous multiplication are preserved by b, B, the cyclic operator and the cyclic norm, which satisfy the mixed-complex relations. These operators are continuous for bounded convergence ([`continuous_continuousConnesB`](https://taucetiproject.org/docs/TauCeti/RingTheory/CyclicCohomology/OperatorTopology.html#TauCeti.continuous_continuousConnesB)).

### Roadmap coverage

**N1 is partial.** Done for unital algebras:
- the cochain-level cyclic theory: b, the cyclic operator and norm, b′ with its contraction, and B with B² = 0 and bB + Bb = 0;
- cyclic, reduced and relative cohomology, and the ground-ring computation;
- the bicomplex comparison and the Hochschild comparison with dual coefficients;
- Hochschild cohomology, with I and B on cohomology;
- the character of a cycle.

Missing from N1:
- S, SBI exactness, periodic cohomology and the normalization constants;
- homotopy and Morita invariance at the level of cohomology, and products;
- universal forms above degree one, and the realization of cyclic cocycles by cycles;
- on the analytic side, continuous cohomology, completed bar resolutions, Fréchet completeness and the smooth-circle tensor identity.

**N2 is partial.** Both pairings exist on individual idempotents and invertibles, with stabilization and direct sums, and for the even pairing conjugation and polynomial homotopy. Algebraic K₀ and K₁, descent to K-theory, the Fréchet/C*-transport and the Chern-chain calibrations are absent.

**N3, N4, N5, N6 and N7 are untouched.** The source has no Fredholm modules, logarithmic ideal, Dixmier traces, spectral triples or smooth torus. It does have the algebraic shapes of the torus cocycles: the 1-cocycle τ(a₀δa₁) and the [two-derivation 2-cocycle](https://taucetiproject.org/docs/TauCeti/RingTheory/CyclicCohomology/Derivation.html#TauCeti.traceDerivationPairCocycle).

## The frontier

- **The SBI sequence** — I and B on cohomology exist, and B ∘ I = 0. What remains is S as the exterior product with σ₁, followed by exactness at every term.
- **Algebraic K₀/K₁ and descent of the pairings** — build K₀ by group completion and K₁ as GL∞/E∞, then show both pairings factor through them. Stabilization and direct sums are already proved.
- **Periodic cyclic cohomology** — the direct limit under S, its comparison with the (b, B) totalization, and the pinned constants c₂ₘ and c₂ₖ₊₁.
- **Continuous cyclic cohomology** — the quotient of continuous cocycles by continuous coboundaries, with its quotient topology. It also needs the comparison with continuous functionals on completed tensors, and completed bar resolutions. N6's torus computation needs all of these.
- **Higher universal forms** — the graded differential algebra over A⁺ with d² = 0. The aim is to show that every cyclic cocycle is the character of a universal-form cycle, which now has the cycle-to-cocycle direction to build on.

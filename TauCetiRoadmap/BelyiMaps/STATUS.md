<!--tauceti-status:v1 {"roadmap":"BelyiMaps","to_sha":"e06d6728b2f32e212d12e96ddcd366c4445e9e10","ts":"2026-11-11T00:57:04Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","remaining":"1.6 label semantics in degrees 6 to 11, behind the transitive-group gap","state":"partial"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","remaining":"the S3-orbit-representative clause of the 3.5 database comparison","state":"partial"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","remaining":"edge cases and the chart description of the punctured neighbourhood of infinity in 5.1; general pullback and examples in 5.3","state":"partial"},{"id":"Layer 6","remaining":"6.2 finiteness and functoriality; 6.3 naturality, composite pullbacks, pointed counts 13, 71, 461","state":"partial"},{"id":"Layer 7","remaining":"general uniqueness in 7.4, the pointwise statement of 7.5, the assembled dessin bijection of 7.6","state":"partial"},{"id":"Layer 8","remaining":"analytic genus reconciliation, the 8.1 equivalences, the cyclic order of germs in 8.7","state":"partial"},{"id":"Layer 9","remaining":"point separation for 9.3, and 9.4 to 9.8","state":"partial"},{"id":"Layer 10","remaining":"10.6 over C, the descent step of 10.7, and the 10.8 examples","state":"partial"},{"id":"Layer 11","remaining":"preservation of genus and ramification partitions under conjugation (11.1)","state":"partial"},{"id":"Layer 12","remaining":"12.4 to 12.6, 12.8, 12.9, and the branch-cycle theorem 12.11 to 12.12","state":"partial"},{"id":"Layer 13","remaining":"the outer action of 13.1, surjectivity onto zhat units, 13.3, 13.4, and 13.5 on classes","state":"partial"},{"id":"Layer 14","remaining":"6T6 and 3T1 certificates, and comparison of map records with trueOrbitSize and coverage (14.2)","state":"partial"}],"readme_sha":"13e365e38fb27aa6186c0fb2a41f930008991c929ce86db92b1851a70cc4d14a","roadmap":"BelyiMaps","to_sha":"e06d6728b2f32e212d12e96ddcd366c4445e9e10"}-->
# Status: BelyiMaps

This file documents the status of the BelyiMaps roadmap up until `e06d672` (2026-11-11T00:57:04Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The classification of three-point covers is essentially complete. Covers of `ℂ ∖ {0, 1}`, connected permutation triples, dessins, branched covers and analytic Belyi pairs all classify one another, with small leftover items in several of these layers. Over `ℚ̄`, the existence half of Belyi's theorem is done, and so is the theory of fields of moduli and Galois orbits. Partial are the analytic-to-algebraic comparison, descent from `ℂ` to `ℚ̄`, the profinite and pro-`ℓ` arithmetic, faithfulness, and the LMFDB semantics. No layer is untouched.

### Named results

- **Analytic Riemann existence for three-point covers** — isomorphism classes of analytic Belyi pairs of degree `n` correspond bijectively to connected degree-`n` covers of `ℂ ∖ {0, 1}` ([`TauCeti.AnalyticBelyiPair.isoClassEquivConnectedCoverClass`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/ThricePuncturedSphere/FilledCover/AnalyticBelyiPair.html#TauCeti.AnalyticBelyiPair.isoClassEquivConnectedCoverClass)), and so to classes of connected triples.
- **Belyi's theorem, existence direction** — over any field algebraic over `ℚ`, every function field with exact constants admits a Belyi map ([`TauCeti.IsFunctionField.exists_isAlgebraicBelyiPair`](https://taucetiproject.org/docs/TauCeti/FieldTheory/FunctionField/Belyi/Existence.html#TauCeti.IsFunctionField.exists_isAlgebraicBelyiPair)).
- **Orbit size and fields of definition** — the degree of the field of moduli is the size of the Galois orbit ([`finrank_fieldOfModuli_eq_trueOrbitSize`](https://taucetiproject.org/docs/TauCeti/FieldTheory/FunctionField/Belyi/FiniteDescent.html#TauCeti.AlgebraicBelyiPair.IsoClass.finrank_fieldOfModuli_eq_trueOrbitSize)). For any finite field of definition `k`, the embeddings of `k` map onto the orbit, with fibres of size `[S : H]` ([`embeddingToOrbit_surjective`](https://taucetiproject.org/docs/TauCeti/FieldTheory/FunctionField/Belyi/Embeddings.html#TauCeti.AlgebraicBelyiPair.IsoClass.IsDefinedOver.embeddingToOrbit_surjective)).
- **Rigid pairs are defined over their field of moduli** — over a number field, a Belyi pair with no nontrivial automorphisms descends to its field of moduli ([`TauCeti.AlgebraicBelyiPair.IsoClass.isDefinedOver_fieldOfModuli`](https://taucetiproject.org/docs/TauCeti/FieldTheory/FunctionField/Belyi/Rigidity.html#TauCeti.AlgebraicBelyiPair.IsoClass.isDefinedOver_fieldOfModuli)).
- **Lenstra's polynomial argument** — for every automorphism `σ ≠ 1` of `ℚ̄`, some Belyi polynomial is not carried to its conjugate by any affine change of variable ([`TauCeti.exists_polynomial_criticalValues_subset_comp_ne_map`](https://taucetiproject.org/docs/TauCeti/Algebra/Polynomial/Lenstra/Belyi.html#TauCeti.exists_polynomial_criticalValues_subset_comp_ne_map)). This is the genus-zero core of faithfulness.

### Notable definitions and infrastructure

- **The Galois action on isomorphism classes** ([`TauCeti.AlgebraicBelyiPair.IsoClass.instMulAction`](https://taucetiproject.org/docs/TauCeti/FieldTheory/FunctionField/Belyi/GaloisAction.html#TauCeti.AlgebraicBelyiPair.IsoClass.instMulAction)) — conjugation of pairs descends to classes, carrying the [field of moduli](https://taucetiproject.org/docs/TauCeti/FieldTheory/FunctionField/Belyi/FieldOfModuli.html#TauCeti.AlgebraicBelyiPair.IsoClass.fieldOfModuli).
- **The `ẑ`-cyclotomic character** ([`TauCeti.profiniteCyclotomicCharacter`](https://taucetiproject.org/docs/TauCeti/FieldTheory/Galois/AbsoluteGaloisGroup/Cyclotomic/Profinite.html#TauCeti.profiniteCyclotomicCharacter)) — the continuous character of an absolute Galois group in characteristic zero, with `ℓ`-adic components the usual ones.
- **The meromorphic function field** ([`TauCeti.RiemannSurface.MeromorphicFunction`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/RiemannSurface/FunctionField.html#TauCeti.RiemannSurface.MeromorphicFunction)) — the bridge to algebraization. A function separating an unbranched fibre has degree exactly `deg β`.

### Roadmap coverage

- **Done:** Layers 0, 2 and 4.
- **Done up to small items:** Layer 1 lacks label semantics in degrees 6 to 11 (1.6), behind a supplier gap. Layer 3 lacks the clause of the 3.5 database comparison saying the records' passports are `S₃`-orbit representatives. Layer 5 lacks the edge cases and chart description in 5.1 and general pullback in 5.3. Layer 6 lacks finiteness and functoriality of the associated cover (6.2), and naturality, the composite pullbacks and the pointed counts `13, 71, 461` (6.3). Layer 7 lacks the general uniqueness of 7.4, the pointwise branch-point statement of 7.5, and the assembled graph bijection of 7.6.
- **Layer 8** lacks the analytic genus reconciliation, the assembled equivalences of 8.1, and the cyclic order of germs in 8.7.
- **Layer 9** has 9.1 and most of 9.2. Layer 9.3 is conditional on point separation, and 9.4 to 9.8 are untouched.
- **Layer 10** has 10.1 to 10.5 in substance, and 10.7 up to its final descent step. 10.6 and the 10.8 examples are missing.
- **Layer 11**, over `ℚ̄`, is done except for preservation of genus and ramification data under conjugation (11.1).
- **Layer 12** has the profinite integers, profinite powers and outer automorphisms (12.1–12.3, 12.7), and the `ẑ`-cyclotomic character (12.10). The geometric fundamental group, its comparison, the outer Galois action and the branch-cycle theorem are missing.
- **Layer 13** has the free pro-`ℓ` carrier, `ℓ`-adic surjectivity over `ℚ` (half of 13.2), and the polynomial core of 13.5.
- **Layer 14** has 14.1 to 14.3, 14.5, and most of 14.6, including the degree-four reconciliation and the `5T1-5_5_5` row.

## The frontier

- **Faithfulness on classes (13.5)** — combine Lenstra's polynomial with the computation of the action on polynomial pairs. Fixing a class means the polynomial changes affinely.
- **`ẑ`-surjectivity (13.2)** — deduce surjectivity of the `ẑ`-valued character from the finite levels by compactness. After that comes the pro-`ℓ` outer action `ρ_ℓ` of 13.1 and the peripheral-power theorem.
- **The `6T6`/`3T1` certificates (14.6)** — prove the stored degree-six triple generates a conjugate of the `6T6` reference, then transport primitivization to `3T1-3_3_3-a`. This waits on the transitive-group gap in degrees 6 to 11.
- **Point separation (9.3)** — give any two points a meromorphic function with a pole at one and not the other. This makes the degree theorem unconditional, and needs Riemann–Roch.
- **Descent from `ℂ` (10.6, 10.7)** — finiteness of classes in each degree over `ℂ`, then the descent step, resting on 9.8.

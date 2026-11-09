<!--tauceti-status:v1 {"roadmap":"BelyiMaps","to_sha":"d2083f0f1dd2136d02467ba36efbbe1af612e89c","ts":"2026-11-08T09:37:56Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","remaining":"1.6 label semantics in degrees 6 to 11","state":"partial"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","state":"done"},{"id":"Layer 7","state":"done"},{"id":"Layer 8","remaining":"the analytic genus reconciliation of 8.6","state":"partial"},{"id":"Layer 9","remaining":"point separation for 9.3, and 9.4 to 9.8","state":"partial"},{"id":"Layer 10","remaining":"10.6 over C, the model step of 10.7, and the 10.8 examples","state":"partial"},{"id":"Layer 11","remaining":"the examples over Q of 11.5 and the embedding surjection of 11.7","state":"partial"},{"id":"Layer 12","state":"untouched"},{"id":"Layer 13","remaining":"faithfulness on isomorphism classes and dessins in 13.5, and 13.1 to 13.4","state":"partial"},{"id":"Layer 14","remaining":"orbit and field-of-definition certificates for rows, 14.4, and the acceptance suite of 14.6","state":"partial"}],"readme_sha":"f173686f995f7a3401cef4676595f839ae812b2409401351249c6de42854b1f5","roadmap":"BelyiMaps","to_sha":"d2083f0f1dd2136d02467ba36efbbe1af612e89c"}-->
# Status: BelyiMaps

This file documents the status of the BelyiMaps roadmap up until `d2083f0` (2026-11-08T09:37:56Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The topological and analytic classification of three-point covers is done. Covers of `ℂ ∖ {0, 1}`, connected permutation triples, dessins, branched covers and analytic Belyi pairs all classify one another. The existence half of Belyi's theorem is done over `ℚ̄`, and so is most of the theory of fields of moduli there. Still partial are the analytic-to-algebraic comparison, descent from `ℂ` to `ℚ̄`, faithfulness of the Galois action, and the LMFDB semantics. The profinite layer (12) has not begun.

### Named results

- **Analytic Riemann existence for three-point covers** — isomorphism classes of analytic Belyi pairs of degree `n` correspond bijectively to connected degree-`n` covers of `ℂ ∖ {0, 1}` ([`TauCeti.AnalyticBelyiPair.isoClassEquivConnectedCoverClass`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/ThricePuncturedSphere/FilledCover/AnalyticBelyiPair.html#TauCeti.AnalyticBelyiPair.isoClassEquivConnectedCoverClass)), and so to classes of connected triples.
- **Belyi's theorem, existence direction** — over any field algebraic over `ℚ`, every function field with exact constants admits a Belyi map ([`TauCeti.IsFunctionField.exists_isAlgebraicBelyiPair`](https://taucetiproject.org/docs/TauCeti/FieldTheory/FunctionField/Belyi/Existence.html#TauCeti.IsFunctionField.exists_isAlgebraicBelyiPair)).
- **The degree of the field of moduli is the orbit size** — over `ℚ̄`, the field of moduli of a class of Belyi pairs is a number field, and its degree over `ℚ` is the size of the class's Galois orbit ([`TauCeti.AlgebraicBelyiPair.IsoClass.finrank_fieldOfModuli_eq_trueOrbitSize`](https://taucetiproject.org/docs/TauCeti/FieldTheory/FunctionField/Belyi/FiniteDescent.html#TauCeti.AlgebraicBelyiPair.IsoClass.finrank_fieldOfModuli_eq_trueOrbitSize)).
- **Rigid pairs are defined over their field of moduli** — over a number field, a Belyi pair with no nontrivial automorphisms descends to its field of moduli ([`TauCeti.AlgebraicBelyiPair.IsoClass.isDefinedOver_fieldOfModuli`](https://taucetiproject.org/docs/TauCeti/FieldTheory/FunctionField/Belyi/Rigidity.html#TauCeti.AlgebraicBelyiPair.IsoClass.isDefinedOver_fieldOfModuli)), the unique isomorphisms to its conjugates forming a descent datum.
- **Lenstra's polynomial argument** — for every automorphism `σ ≠ 1` of `ℚ̄` some Belyi polynomial is not carried to its conjugate by any affine change of variable ([`TauCeti.exists_polynomial_criticalValues_subset_comp_ne_map`](https://taucetiproject.org/docs/TauCeti/Algebra/Polynomial/Lenstra/Belyi.html#TauCeti.exists_polynomial_criticalValues_subset_comp_ne_map)). This is the genus-zero core of faithfulness on dessins.

### Notable definitions and infrastructure

- **The Galois action on isomorphism classes** ([`TauCeti.AlgebraicBelyiPair.IsoClass.instMulAction`](https://taucetiproject.org/docs/TauCeti/FieldTheory/FunctionField/Belyi/GaloisAction.html#TauCeti.AlgebraicBelyiPair.IsoClass.instMulAction)) — conjugation of pairs descends to classes, preserving degree. It carries the [field of moduli](https://taucetiproject.org/docs/TauCeti/FieldTheory/FunctionField/Belyi/FieldOfModuli.html#TauCeti.AlgebraicBelyiPair.IsoClass.fieldOfModuli), with finite orbits and open stabilizers.
- **Galois descent of fields** ([`TauCeti.GaloisDescent.fixedFieldBaseChangeEquiv`](https://taucetiproject.org/docs/TauCeti/FieldTheory/Galois/SemilinearDescent.html#TauCeti.GaloisDescent.fixedFieldBaseChangeEquiv)) — a semilinear action of a finite Galois group on a field exhibits its fixed field as a form, with exact constants and degrees descending. This drives Weil descent for Belyi pairs.
- **The meromorphic function field** ([`TauCeti.RiemannSurface.MeromorphicFunction`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/RiemannSurface/FunctionField.html#TauCeti.RiemannSurface.MeromorphicFunction)) — the bridge to algebraization. A function separating an unbranched fibre [has degree exactly `deg β`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/RiemannSurface/FunctionField/Degree.html#TauCeti.RiemannSurface.MeromorphicFunction.natDegree_minpoly_ratFunc_eq_degree) and generates the field.

### Roadmap coverage

- **Done:** Layers 0 and 2 to 7.
- **Layer 1** lacks only label semantics in degrees 6 to 11 (1.6).
- **Layer 8** lacks only the analytic genus reconciliation of 8.6.
- **Layer 9** has 9.1 with local `(e, f)` data and its `S₃`-action, and 9.2. 9.3 is proved conditionally on point separation, which waits on Riemann–Roch. 9.4 to 9.8 are untouched.
- **Layer 10** has 10.1 in tower form, algebraically and analytically, with 10.2 to 10.4 and the group-theoretic input of 10.5. 10.7 has Köck's pointed stabilizer and the descent of the normalized generator's equation. Still missing are 10.6 over `ℂ`, the conclusion of 10.7, and the examples of 10.8.
- **Layer 11**, over `ℚ̄`, has 11.1 to 11.4, the containment of the field of moduli in fields of definition (11.5) and the rigidity theorem (11.6). It lacks the examples over `ℚ` of 11.5 and the embedding surjection `G/H ↠ G/S` of 11.7.
- **Layer 13** has only the polynomial core of 13.5.
- **Layer 14** has the records of 14.1 and 14.2, the certification levels of 14.3 and the label grammar of 14.5. It lacks orbit and field-of-definition certificates for stored rows, the `S₃` representative (14.4), and most of the acceptance suite.
- **Untouched:** Layer 12.

## The frontier

- **Faithfulness on classes (13.5)** — combine Lenstra's polynomial with the computation of the action on polynomial pairs, which shows that `σ` fixes a class exactly when the polynomial changes affinely. That combination gives faithfulness on isomorphism classes of genus-zero pairs over `ℚ̄`. Stating it on dessins also needs 12.4.
- **Point separation (9.3)** — give any two points a meromorphic function with a pole at one point and none at the other. This makes the degree theorem unconditional, and needs the Riemann–Roch chain from ModularForms.
- **Descent from `ℂ` (10.6, 10.7)** — show there are finitely many classes in each degree over `ℂ`, so that the field of moduli is a number field there. The descended equation then gives a model over `ℚ̄`. This rests on 9.8.
- **Orbits and embeddings (11.7)** — the surjection from embeddings of a field of definition onto the true orbit.
- **Genus reconciliation (8.6)** — show that the analytic genus equals the combinatorial genus of the triple, through ModularForms' Riemann–Hurwitz.

<!--tauceti-status:v1 {"roadmap":"QuadraticCharactersAndReduction","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"exists_unique_fundamental_discriminant at every level, with naturality under changeLevel and the odd-prime Legendre dictionary","state":"partial"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"}],"readme_sha":"4a5fa9662214dd1d0166bd582d9fde113dc4b7ab381e92527c6bba073cc59a6a","roadmap":"QuadraticCharactersAndReduction","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: QuadraticCharactersAndReduction

This file documents the status of the QuadraticCharactersAndReduction roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layers 2, 3 and 4 are done: reduction of `ℤ[ω]` modulo every `m`, Frobenius over finite fields with the integral Frobenius congruence, and the complex embeddings with their coordinate bound. Layer 1 is done through the local classification and the conductor product formula. Its main theorem, the unique fundamental discriminant of an arbitrary quadratic character, has not been stated.

### Named results

- **The quadratic characters at an odd prime power** — a character of level `p^k`, `p` odd, is quadratic exactly when it is principal or, for `k ≥ 1`, the lifted Legendre character modulo `p`. This holds for values in any commutative ring ([`isQuadratic_iff_eq_one_or_eq_changeLevel_quadraticChar`](https://taucetiproject.org/docs/TauCeti/NumberTheory/DirichletCharacter/OddPrimePower/Quadratic.html#DirichletCharacter.isQuadratic_iff_eq_one_or_eq_changeLevel_quadraticChar)).
- **The quadratic characters at a power of two** — at level `2^k` they are the principal character, the lift of `χ₄` when `4 ∣ 2^k`, and the lifts of `χ₈` and `χ₈′` when `8 ∣ 2^k` ([`isQuadratic_iff_of_level_two_pow`](https://taucetiproject.org/docs/TauCeti/NumberTheory/DirichletCharacter/Dyadic/Classification.html#DirichletCharacter.isQuadratic_iff_of_level_two_pow)).
- **The conductor product formula** — the conductor of any Dirichlet character is the product of the conductors of its local factors ([`conductor_eq_prod_conductor_localFactor`](https://taucetiproject.org/docs/TauCeti/NumberTheory/DirichletCharacter/LocalFactor.html#DirichletCharacter.conductor_eq_prod_conductor_localFactor)). For a quadratic character these are `1` or `p` at odd `p`, and `1`, `4` or `8` at `2`.
- **The integral Frobenius congruence** — if `r` is not a square modulo the prime `p`, then `(u + v√r)^p ≡ u − v√r (mod p)` coefficientwise in `ℤ[√r]` ([`frobenius_congruence`](https://taucetiproject.org/docs/TauCeti/NumberTheory/QuadraticOrder/Frobenius.html#QuadraticAlgebra.frobenius_congruence)). The hypothesis is sharp: when `r` is a square modulo `p`, including every `r` at `p = 2`, the generator violates it.
- **The coordinate bound for complex embeddings** — every `ℚ`-algebra map `σ : ℚ[√r] → ℂ` satisfies `‖σ(u + vω)‖ ≤ |u| + |v|√|r|`, for every rational `r` ([`norm_embedding_le`](https://taucetiproject.org/docs/TauCeti/NumberTheory/NumberField/Quadratic/EmbeddingBound.html#QuadraticAlgebra.norm_embedding_le)).

### Notable definitions and infrastructure

- **The local factor of a Dirichlet character** — [`localFactor`](https://taucetiproject.org/docs/TauCeti/NumberTheory/DirichletCharacter/LocalFactor.html#DirichletCharacter.localFactor) restricts a character of level `N` to the prime power `p^{v_p(N)}` through the Chinese remainder splitting. Every character is the product of its local factors, uniquely, and this reduces questions about quadraticity, order and conductor to prime-power levels.
- **The quotient `ℤ[ω]/(m)`** — [`quotientSpanNatCastEquiv`](https://taucetiproject.org/docs/TauCeti/NumberTheory/QuadraticOrder/Reduction.html#QuadraticAlgebra.quotientSpanNatCastEquiv) identifies it with the quadratic algebra over `ℤ/m` for every `m`, including `0` and `1`, compatibly with changing the modulus. Cardinality, coordinate rectangles and the Frobenius congruence are all read through it.
- **The two embeddings `σ₊`, `σ₋`** — [`sqrtEmbedding`](https://taucetiproject.org/docs/TauCeti/NumberTheory/NumberField/Quadratic/EmbeddingBound.html#QuadraticAlgebra.sqrtEmbedding) and its partner send `ω` to `±√r`, chosen purely imaginary when `r < 0`. Every algebra map to `ℂ` is one of them, they are injective exactly when `r` is not a square, and their product and sum are the norm and trace.

### Roadmap coverage

Layer 1 is partial. §§1.1–1.3 are proved: both local classifications with their conductors, the count of quadratic characters at odd prime powers, the Legendre values, the equivalence between real and quadratic characters, and the local decomposition with the conductor product. §1.4 is absent: no theorem attaches a unique fundamental discriminant to an imprimitive or principal quadratic character, and neither naturality under change of level nor the odd-prime dictionary has been stated. Layers 2, 3 and 4 are done. Layer 2 covers the kernel and quotient for every `m`, the cardinality `m²`, coordinate rectangles with exact interval endpoints, and the index-two comparison, which is an isomorphism modulo odd `m` and neither injective nor surjective modulo `2`. Layer 3 adds to the earlier [trichotomy](https://taucetiproject.org/docs/TauCeti/Algebra/QuadraticAlgebra/Trichotomy.html#QuadraticAlgebra.trichotomy) the Frobenius identities in the inert, split and repeated-root cases ([`pow_card_eq_star`](https://taucetiproject.org/docs/TauCeti/Algebra/QuadraticAlgebra/FiniteField.html#QuadraticAlgebra.pow_card_eq_star)), together with the integral congruence and its comparison with the maximal-order Frobenius. The scalar-extension remark of §3.2 is not stated separately. Layer 4 covers exhaustiveness for positive nonsquare `r`, coordinate recovery, the signature and the norm comparison.

## The frontier

- **The primitive discriminant of a real character (§1.4)** — prove `exists_unique_fundamental_discriminant` at every level, with `|D|` the conductor and the sign fixed by `χ(−1)`. The source already has a primitive case, `DirichletCharacter.IsPrimitive.exists_isFundamentalDiscr_apply_eq`, so what remains is to pass through `primitiveCharacter` to the imprimitive and principal cases, and to prove uniqueness.
- **Naturality and the odd-prime dictionary (§1.4)** — show that the discriminant is unchanged under `changeLevel`, and that `χ_D(p) = legendreSym p D = legendreSym p d` for the squarefree radicand `d`, including the odd primes dividing `D`. A consumer needs this to feed a value `χ(p) = −1` into Layer 3's nonsquare hypothesis.

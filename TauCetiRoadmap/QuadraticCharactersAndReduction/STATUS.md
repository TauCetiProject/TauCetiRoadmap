<!--tauceti-status:v1 {"roadmap":"QuadraticCharactersAndReduction","to_sha":"1c6a1a4e61e51f1bcef7784fdd6d5131235b7299","ts":"2026-11-11T04:46:07Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"the classifications at p^k and 2^k levels, the conductor product, and exists_unique_fundamental_discriminant","state":"untouched"},{"id":"Layer 2","remaining":"reduction_kernel and the quotient isomorphism for every m, the cardinality m^2, coordinate rectangles, and the index-two comparison","state":"untouched"},{"id":"Layer 3","remaining":"the Frobenius identities pow_card_eq_star and pow_card_eq_self_of_square, and the integral frobenius_congruence","state":"partial"},{"id":"Layer 4","remaining":"norm_embedding_le for every algebra map, and exhaustiveness of the two embeddings for positive nonsquare r","state":"untouched"}],"readme_sha":"030349b2d59254c5356b7c6654d8710dd424b12ad51a20a6c405e48a9a6ce725","roadmap":"QuadraticCharactersAndReduction","to_sha":"1c6a1a4e61e51f1bcef7784fdd6d5131235b7299"}-->
# Status: QuadraticCharactersAndReduction

This file documents the status of the QuadraticCharactersAndReduction roadmap up until `1c6a1a4` (2026-11-11T04:46:07Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The first section of Layer 3 is done: the split, inert and repeated-root trichotomy for `QuadraticAlgebra F r 0` over a finite field. The rest of Layer 3 is still open: the Frobenius identity `z^Q = star z` and its integral congruence. Nothing has landed yet for the character classifications of Layer 1, the reduction modulo `m` of Layer 2 or the embedding bounds of Layer 4.

### Named results

- **The trichotomy for quadratic algebras** — over any field with `2 ≠ 0`, `K[X]/(X² − r)` is `K × K`, a field, or the ring of dual numbers ([`QuadraticAlgebra.trichotomy`](https://taucetiproject.org/docs/TauCeti/Algebra/QuadraticAlgebra/Trichotomy.html#QuadraticAlgebra.trichotomy)). Its finite-field form, for odd cardinality, is [`FiniteField.quadraticAlgebra_trichotomy`](https://taucetiproject.org/docs/TauCeti/Algebra/QuadraticAlgebra/Trichotomy.html#FiniteField.quadraticAlgebra_trichotomy).
- **The square-class criteria** — the algebra splits exactly when `r` is a nonzero square ([`nonempty_algEquiv_prod_iff`](https://taucetiproject.org/docs/TauCeti/Algebra/QuadraticAlgebra/Trichotomy.html#QuadraticAlgebra.nonempty_algEquiv_prod_iff)), and it is a field exactly when `r` is not a square, in every characteristic ([`isField_iff_not_isSquare`](https://taucetiproject.org/docs/TauCeti/Algebra/QuadraticAlgebra/Trichotomy.html#QuadraticAlgebra.isField_iff_not_isSquare)).
- **The even-characteristic control** — over a finite field of even cardinality, `F[X]/(X² − r)` is never `F × F` ([`FiniteField.isEmpty_quadraticAlgebra_algEquiv_prod_of_even_card`](https://taucetiproject.org/docs/TauCeti/Algebra/QuadraticAlgebra/Trichotomy.html#FiniteField.isEmpty_quadraticAlgebra_algEquiv_prod_of_even_card)). Instead it is always the dual numbers, so the oddness hypothesis of the split case cannot be dropped.

### Notable definitions and infrastructure

- **The repeated-root isomorphism** — [`algEquivDualNumberOfDoubleRoot`](https://taucetiproject.org/docs/TauCeti/Algebra/QuadraticAlgebra/DualNumber.html#QuadraticAlgebra.algEquivDualNumberOfDoubleRoot) identifies the algebra of `(X − r)²` with the dual numbers via `ω ↦ r + ε`. This gives the norm `(x + ry)²` and the description of the nilpotents, which the repeated-root case of Frobenius (`z^Q = z.re`) will read off.
- **Coordinates in the split case** — under the Tau Ceti splitting `algEquivProdOfSq`, the norm is the product of the two coordinates and the trace is their sum ([`norm_eq_fst_mul_snd_algEquivProdOfSq`](https://taucetiproject.org/docs/TauCeti/Algebra/QuadraticAlgebra/Split.html#QuadraticAlgebra.norm_eq_fst_mul_snd_algEquivProdOfSq)). Conjugation swaps the two factors, which is what transporting `FiniteField.pow_card` componentwise in §3.2 needs.

### Roadmap coverage

Layer 3 is partial. §3.1, the trichotomy with its norm, trace and cardinality bullets, is proved, in somewhat greater generality than the README asks. §3.2 (`pow_card_eq_star`, `pow_card_eq_self_of_square`) and §3.3 (`frobenius_congruence`) are absent. Layers 1, 2 and 4 are untouched: none of their target declarations occur in the source. These include `odd_prime_power_classification`, `two_power_classification`, `exists_unique_fundamental_discriminant`, `reduction_kernel`, `card_reduction_quotient` and `norm_embedding_le`. Layer 2's kernel argument exists only for prime `m`, as a step inside the supplier's inert criterion `isMaximal_span_natCast_iff`. Layer 4's exhaustiveness of complex embeddings is available only for `r ≤ 0`, through the supplier `complexEmbedding`.

## The frontier

- **Frobenius on a finite quadratic algebra (§3.2)** — prove `z^Q = star z` for nonsquare `r`, and `z^Q = z` for a nonzero square `r` with `Q` odd. With §3.1 in place, this is the nearest target.
- **Reduction modulo m (§§2.1–2.2)** — prove that the kernel of `ρ_m` is `(m)` for every `m`, including `0` and `1`, that `A/(m)` is isomorphic to the quadratic algebra over `ℤ/m`, and that it has `m²` elements. Nothing in Layer 1 is needed for this.
- **The integral Frobenius congruence (§3.3)** — `z^p ≡ star z (mod p)` in `ℤ[√r]` for odd `p` with `r` not a square modulo `p`. This waits on §3.2 and on the kernel statement of §2.1.
- **Embedding bounds (§4.1)** — the bound `‖σ(u + vω)‖ ≤ |u| + |v|√|r|` for every algebra map, together with the exhaustiveness of the two embeddings for positive nonsquare `r`. This layer is independent of the others.
- **Quadratic characters (Layer 1)** — the local classifications at levels `p^k` and `2^k`, then the conductor product and the primitive discriminant. §1.4 consumes AnalyticNumberTheoryPartI §0.34a, and §§1.1–1.2 consume ClassicalArithmeticCompletion §§1.4, 1.5 and 1.21.

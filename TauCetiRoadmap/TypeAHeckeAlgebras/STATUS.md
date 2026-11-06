<!--tauceti-status:v1 {"roadmap":"TypeAHeckeAlgebras","to_sha":"b4b3ce57a438a4ec6e21ef62e4a5607ae920a5e0","ts":"2026-10-23T19:26:26Z"}-->
# Status: TypeAHeckeAlgebras

This file documents the status of the TypeAHeckeAlgebras roadmap up until `b4b3ce5` (2026-10-23T19:26:26Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The foundations of H1 have started. The infinite Hecke algebra, its stages and its braid homomorphism are in place, and so are the content-separation and power-sum inputs to the module theory. None of H1's main theorems are proved yet: there is no finite presentation, no basis theorem, no Specht modules and no cocenter basis. H2 has uniqueness of Markov traces but not existence. H3 has only its R-matrix building block, and H4 has not begun.

### Named results

- **Separation of Jucys-Murphy eigenvalues** — over a domain, if `∏_(d≤n) [d]_Q ≠ 0` and `Q ≠ 1`, then the powers `Q^content` of distinct addable cells differ on every Young diagram of size less than `n` ([`YoungDiagram.injOn_zpow_cellContent_of_prod_geom_sum_ne_zero`](https://taucetiproject.org/docs/TauCeti/Algebra/TypeAHeckeAlgebra/ContentSeparation.html#YoungDiagram.injOn_zpow_cellContent_of_prod_geom_sum_ne_zero)). The underlying criterion, `Q^d ≠ 1` for `2 ≤ d ≤ n`, is shown to be sharp ([`YoungDiagram.injOn_zpow_cellContent_iff`](https://taucetiproject.org/docs/TauCeti/Combinatorics/Young/Addable.html#YoungDiagram.injOn_zpow_cellContent_iff)).
- **The Yang-Baxter equation for the signed checked R-matrix** — on words in positive and negative letters, the operators on two pairs of strands sharing a strand satisfy the braid relation ([`TauCeti.signedCheckedR_braid`](https://taucetiproject.org/docs/TauCeti/Algebra/TypeAHeckeAlgebra/SignedCheckedR.html#TauCeti.signedCheckedR_braid)). They also satisfy the Hecke quadratic relation, and they [agree with the Jimbo R-matrix](https://taucetiproject.org/docs/TauCeti/Algebra/TypeAHeckeAlgebra/SignedCheckedR.html#TauCeti.signedCheckedR_eq_jimboGenerator) when every letter is positive.
- **The power-sum basis** — over a ℚ-algebra, in at least `n` variables, the products `p_μ` over partitions of `n` form a basis of the degree-`n` symmetric polynomials ([`TauCeti.psumPartBasis`](https://taucetiproject.org/docs/TauCeti/RingTheory/MvPolynomial/Symmetric/PowerSum/Basis.html#TauCeti.psumPartBasis)). This is H1's Newton-identity interface.
- **Uniqueness of the Markov trace** — for each `z` there is at most one normalized Markov trace on the infinite Hecke algebra, and every Markov trace is multiplicative on disjoint strand blocks. The library has this, but no documentation link is supplied for it here. It rests on the decomposition `H_(n+2) = H_(n+1) + H_(n+1) T H_(n+1)` of the stages.

### Notable definitions and infrastructure

- **The infinite type-A Hecke algebra** ([`TauCeti.InfiniteTypeAHeckeAlgebra`](https://taucetiproject.org/docs/TauCeti/Algebra/TypeAHeckeAlgebra/Infinite.html#TauCeti.InfiniteTypeAHeckeAlgebra)) is the `RingQuot` of the free algebra on ℕ, exactly as the README prescribes, with its universal property. Every later trace, quotient and comparison map is stated on this carrier.
- **Stages, shifts and block maps.** The [stage](https://taucetiproject.org/docs/TauCeti/Algebra/TypeAHeckeAlgebra/Infinite.html#TauCeti.InfiniteTypeAHeckeAlgebra.stage) on `n` strands is spanned by images of `n`-strand braids. The strand [shift](https://taucetiproject.org/docs/TauCeti/Algebra/TypeAHeckeAlgebra/Infinite.html#TauCeti.InfiniteTypeAHeckeAlgebra.shift) and the [disjoint block map](https://taucetiproject.org/docs/TauCeti/Algebra/TypeAHeckeAlgebra/Infinite.html#TauCeti.InfiniteTypeAHeckeAlgebra.blockIncl) supply the block embeddings that H1's cycle-block words and H2's multiplicativity statements need.
- **The signed checked representation** ([`TauCeti.signedCheckedRep`](https://taucetiproject.org/docs/TauCeti/Algebra/TypeAHeckeAlgebra/SignedCheckedR.html#TauCeti.signedCheckedRep)) is the braid group action on signed word spaces. H3's atomic tensor models and H4a's colour decompositions are to be built from it.

### Roadmap coverage

**H1 is partial.** Present: the infinite carrier, its stages and braid homomorphism, the stage decomposition, the content-separation bounds, and power sums generating the symmetric polynomials. Missing: the finite presentation and its comparison with the stages, the basis theorem and rank `n!`, the split-semisimplicity criterion from Specht forms, Specht modules and branching, the cocenter basis, Ram's formula, and the positive-real Pieri carrier. **H2 is partial.** Uniqueness and block multiplicativity of Markov traces are proved, but existence of the Ocneanu trace, the trace radical, and the braid-closure invariant `P_braid` are not. **H3 is partial at most.** Only the signed checked R-matrix has landed: no positivity statement, quotient carrier or classification. **H4 and H4a are untouched.**

## The frontier

- **The finite presentation and basis theorem** — define `H_n(q)` by generators and relations, prove the `T_w` basis indexed by `Sₙ`, and prove that `H_n(q)` is isomorphic to the stage and injects into the infinite algebra. Almost everything else in H1 is blocked on this.
- **Existence of the Ocneanu trace** — uniqueness is done. The library's own documentation says existence waits on the basis theorem for the stages.
- **Jucys-Murphy elements and their tableau eigenvalues** — the content-separation input is ready. What remains is the elements themselves, their commutation, and the eigenvalue `Q^(column−row)` on a fixed Specht basis, which needs the Specht modules first.
- **The cocenter basis and Ram's formula** — `cycleBlock_cocenterBasis` and the trace-comparison exports. The power-sum basis covers the symmetric-function side, but the Hecke side has not been started.
- **Atomic tensor models** — the signed R-matrix exists, but the weighted trace on it, and the proof that it gives a positive Markov trace, are open. These need the H3 state carrier to be specified first.

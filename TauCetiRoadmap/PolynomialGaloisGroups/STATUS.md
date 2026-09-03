<!--tauceti-status:v1 {"roadmap":"PolynomialGaloisGroups","to_sha":"8745177e39945cdda39b4203688f5f6bb380a0b9","ts":"2026-09-01T22:18:35Z"}-->
# Status: PolynomialGaloisGroups

This file documents the status of the PolynomialGaloisGroups roadmap up until `8745177` (2026-09-01T22:18:35Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Four pull requests have landed, all in the roadmap's opening layers: Layer 0's degree bookkeeping, most of the API for cycle types that count fixed points, and two of Layer 1's recognition theorems. Everything else, from the orbit dictionary and wreath products through discriminants, resolvents, Frobenius specialization, the labels in degree at most five, and the realization of Sₙ over ℚ, has not begun.

### Named results

- **Full cycles in prime degree** — a transitive permutation group of prime degree contains a cycle on all the points, the first of Layer 1's recognition theorems ([`TauCeti.exists_isCycle_mem_of_isPretransitive_of_prime_card`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/GroupTheory/Perm/Recognition.html#TauCeti.exists_isCycle_mem_of_isPretransitive_of_prime_card)).
- **Double transitivity from a long cycle** — a transitive subgroup of a finite symmetric group that contains a cycle moving all but one point is doubly transitive ([`TauCeti.is_two_pretransitive_of_isCycle_mem_of_card_support_add_one_eq_card`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/GroupTheory/Perm/MultipleTransitivity.html#TauCeti.is_two_pretransitive_of_isCycle_mem_of_card_support_add_one_eq_card)).
- **Primitivity from a long cycle** — the same hypothesis gives primitivity, the form Layer 9's group-theoretic steps consume ([`TauCeti.isPreprimitive_of_isCycle_mem_of_card_support_add_one_eq_card`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/GroupTheory/Perm/MultipleTransitivity.html#TauCeti.isPreprimitive_of_isCycle_mem_of_card_support_add_one_eq_card)).
- **The Galois image has the order of the Galois group** — in any splitting extension the image of the root action has the same order as `Polynomial.Gal`, so permutation invariants of the Galois group can be computed in the image ([`TauCeti.natCard_galActionHom_range`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/GaloisGroups/Degree.html#TauCeti.natCard_galActionHom_range)).
- **Cycle types with fixed points are a class function** — the parts of `Equiv.Perm.partition`, the cycle type with fixed points restored as parts equal to one, are constant on conjugacy classes ([`Equiv.Perm.parts_partition_conj`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/GroupTheory/Perm/Partition.html#Equiv.Perm.parts_partition_conj)).

### Notable definitions and infrastructure

- **Numbering the roots** — a separable polynomial's roots in its splitting field are in bijection with `Fin p.natDegree`, the temporary numbering every later comparison with a reference subgroup will pass through ([`TauCeti.nonempty_rootSet_splittingField_equiv_fin`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/GaloisGroups/Degree.html#TauCeti.nonempty_rootSet_splittingField_equiv_fin)).
- **The parts of `Equiv.Perm.partition` as the corrected cycle type** — parts other than one agree with `cycleType` and the ones count fixed points, which is what will let a factorization type of `f mod p` be compared with a permutation in Layers 5 and 6 ([`Equiv.Perm.count_parts_partition_of_ne_one`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/GroupTheory/Perm/Partition.html#Equiv.Perm.count_parts_partition_of_ne_one), [`Equiv.Perm.count_one_parts_partition`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/GroupTheory/Perm/Partition.html#Equiv.Perm.count_one_parts_partition)).
- **Unique fixed points** — a permutation moves all but one point exactly when it has a unique fixed point, bridging the two spellings of the long-cycle theorems ([`TauCeti.card_support_add_one_eq_card_iff_existsUnique_fixedPoint`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/GroupTheory/Perm/Basic.html#TauCeti.card_support_add_one_eq_card_iff_existsUnique_fixedPoint)).

### Roadmap coverage

- Layer 0: the degree bookkeeping is done. The `fullCycleType` milestone is largely delivered, but under the spelling `Equiv.Perm.partition`: no declaration named `fullCycleType` has landed, the `Fin 4` examples are absent, and whether the landed parts match the `cycleType + replicate … 1` shape that the Number Field Arithmetic contract is stated in is not established here. Orbits and irreducible factors, transitivity against irreducibility, the invariants of the image, normal closures, and conjugate fields are untouched.
- Layer 1: partial. Two of the five recognition theorems are done (a full cycle in prime degree; a long cycle gives double transitivity and primitivity). The transposition-in-prime-degree statement, the primitive-with-transposition and primitive-with-3-cycle statements, and the odd-power transposition lemma are not there. The block-stabilizer correspondence, the two extremal cases, general wreath products, the imprimitivity embedding, and Jordan's theorem for a p-cycle are untouched.
- Layers 2, 3, 4, 5, 6 and 9: untouched, worked examples included.

## The frontier

- **The remaining recognition theorems of Layer 1** — the transposition-in-prime-degree statement, the odd-power-is-a-transposition lemma, and the primitive-with-transposition and primitive-with-3-cycle statements. The README records that Mathlib supplies the last two and the main ingredient of the first; with the two landed theorems they complete the four group-theoretic steps of Layer 9.
- **`fullCycleType` as the roadmap spells it** — the name is the contract with Number Field Arithmetic and an export to Belyi Maps, and the contract check in `Suggested.lean` needs the exact shape `cycleType + replicate (card − support.card) 1` at the carrier's own `DecidableEq` instance. What remains is that definition bridged to the landed `partition` API, plus the `Fin 4` examples and the sum lemma.
- **Layer 0's orbit dictionary** — the bijection between Galois orbits on the roots and the distinct monic irreducible factors, and the equivalence between transitivity and irreducibility for separable polynomials. Its only in-roadmap prerequisite, the degree bookkeeping, is available.
- **The root-product formula for the discriminant** — Layer 3 has not started. It gates the discriminant test, the quadratic extension, and the base change and separability readings Layers 4 and 5 need, and depends on Layer 0 alone.
- **Blocks and wreath products** — the block-stabilizer correspondence and the general wreath product of Layer 1 are untouched and gate Layer 2, the imprimitivity embedding, and the block analysis of Layer 6. Separately, Layer 5's membership statement waits on the supplier declaration `exists_gal_fullCycleType_eq_factorizationType` from Number Field Arithmetic, which nothing landed here touches.

<!--tauceti-status:v1 {"roadmap":"ClusterAlgebras","to_sha":"1c6a1a4e61e51f1bcef7784fdd6d5131235b7299","ts":"2026-11-11T04:46:07Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"Trop(J), Qsf(K), FractionRing of Z[P]; Laurent rings and charts, expansions, quantum tori, one-exchange algebra (0.2-0.7)","state":"partial"},{"id":"Layer 1","remaining":"ice quivers, E/F factorization and rank invariance in 1.1; seeds, patterns, geometric coefficients, quantum seeds (1.2-1.6)","state":"partial"},{"id":"Layer 2","state":"untouched"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"}],"readme_sha":"648deeb31b3783701f61fe38b2ac3e5cf617f167a17a3e02128a588b20f518a9","roadmap":"ClusterAlgebras","to_sha":"1c6a1a4e61e51f1bcef7784fdd6d5131235b7299"}-->
# Status: ClusterAlgebras

This file documents the status of the ClusterAlgebras roadmap up until `1c6a1a4` (2026-11-11T04:46:07Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Only the first stones are laid: coefficient semifields (§0.1) and exchange matrices with their mutation (§1.1) exist, each partially. Laurent charts, quantum tori, seeds, the Laurent phenomenon, cluster varieties, finite type, positivity and double Bruhat cells have not begun.

### Named results

- **Involutivity of matrix mutation** — mutating an integer matrix twice in the same direction returns the original matrix, for extended matrices with frozen rows as well as square ones ([`matrixMutation_involutive`](https://taucetiproject.org/docs/TauCeti/Algebra/Cluster/ExchangeMatrix/Mutation.html#TauCeti.matrixMutation_involutive)).
- **Mutation preserves skew-symmetrizers** — a positive vector `d` with `dᵢbᵢⱼ = −dⱼbⱼᵢ` for `B` works equally for every mutation of `B`, so exchange matrices mutate with their symmetrizer kept fixed ([`IsSkewSymmetrizer.matrixMutation`](https://taucetiproject.org/docs/TauCeti/Algebra/Cluster/ExchangeMatrix/Mutation.html#Matrix.IsSkewSymmetrizer.matrixMutation)).
- **Coefficient semifields are torsion-free** — `n`-th powers are injective in any coefficient semifield, which with the general fact that [unique roots give two unique products](https://taucetiproject.org/docs/TauCeti/Algebra/Group/UniqueProds/TorsionFree.html#HasUniqueRoots.to_twoUniqueProds) makes the group ring ℤ[P] a domain ([`instHasUniqueRoots`](https://taucetiproject.org/docs/TauCeti/Algebra/Cluster/CoefficientSemifield/Basic.html#TauCeti.CoefficientSemifield.instHasUniqueRoots)).

### Notable definitions and infrastructure

- [`CoefficientSemifield`](https://taucetiproject.org/docs/TauCeti/Algebra/Cluster/CoefficientSemifield/Basic.html#TauCeti.CoefficientSemifield) and its [homomorphisms](https://taucetiproject.org/docs/TauCeti/Algebra/Cluster/CoefficientSemifield/Hom.html#TauCeti.CoefficientSemifieldHom): Fomin and Zelevinsky's coefficient groups with an auxiliary addition and no zero, closed under products, with the one-element object and the units of semifields such as the nonnegative rationals. This is where the `y`-variables of every later seed will live.
- [`ExchangeMatrix`](https://taucetiproject.org/docs/TauCeti/Algebra/Cluster/ExchangeMatrix/Basic.html#TauCeti.ExchangeMatrix): an extended integer matrix along an embedding of mutable into all indices, carrying a chosen skew-symmetrizer of its principal block. [Its mutation](https://taucetiproject.org/docs/TauCeti/Algebra/Cluster/ExchangeMatrix/Mutation.html#TauCeti.ExchangeMatrix.mutation) commutes with taking the principal block, reindexing, injective restriction and block-diagonal sums, which is the transport the seed layer will need.

### Roadmap coverage

Layer 0 is partial: of §0.1, the class, its homomorphisms, products, the one-element object, the units of a semifield and the domain property of ℤ[P] are in place. Still missing from §0.1 are the tropical semifield `Trop(J)`, the universal subtraction-free semifield `Qsf(K)` with its evaluation property, the fraction field of ℤ[P] and the embedding `P →* ℤ[P]ˣ`. §§0.2–0.7 (Laurent rings and charts, expansions, based quantum tori, the one-exchange algebra, support and divisibility, polynomial replacement) are untouched. Layer 1 is partial: §1.1 has mutation, involutivity, symmetrizer preservation, zero diagonal and compatibility with principal blocks, reindexing and block sums, while §§1.2–1.6 (seeds, patterns, geometric coefficients, quantum seeds, algebras) are untouched. Layers 2–6 are untouched.

## The frontier

- **Finish exchange matrices (§1.1)** — the bijection with ice quivers intertwining matrix and quiver mutation, the factorization `μ_k(B̃) = E_ε B̃ F_ε` through involutive integer matrices, invariance of rational rank and column independence under mutation, and iterated mutation along words.
- **Finish coefficient semifields (§0.1)** — the tropical semifield `Trop(J)` with its evaluations and reindexing, the universal subtraction-free semifield `Qsf(K)` with its unique `⊕`-preserving map to any coefficient semifield, and `FractionRing ℤ[P]` with `P →* ℤ[P]ˣ`.
- **Laurent rings and charts (§§0.2–0.3)** — `LaurentRing` as the localization of polynomials at the variables, `LaurentChart` as an injective map into a field, and Laurent expansions; the one-variable `laurentEval` from Tau Ceti is the stated supplier.
- **Seeds and mutation (§1.2)** — needs §0.1's `P →* ℤ[P]ˣ` and §0.2's generating charts before the exchange relation can even be stated.
- **Based quantum tori (§0.4)** — waits on the quantum monoid algebra that ScatteringDiagrams §4.3 is to supply.

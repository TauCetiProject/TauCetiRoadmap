<!--tauceti-status:v1 {"roadmap":"ClusterAlgebras","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3","ts":"2026-11-13T23:20:12Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"zero-sum-free semirings, T(A), Qsf(K), P to Z[P] units; Laurent charts and Pos(P,K); sections 0.3-0.7","state":"partial"},{"id":"Layer 1","remaining":"ice quivers, form mutation and mutation words in 1.1; coefficient systems and seeds with charts; sections 1.3-1.6","state":"partial"},{"id":"Layer 2","remaining":"everything beyond abstract upper-bound propagation and principal-extension independence: P1, Q1-Q3 for seeds, L5-L8, Starfish","state":"partial"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"}],"readme_sha":"77b5523d8fbc10e0cf7b0f6c1860068aebcb610aeda4ae7dad491e25f83a8c73","roadmap":"ClusterAlgebras","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3"}-->
# Status: ClusterAlgebras

This file documents the status of the ClusterAlgebras roadmap up until `aa6e43e` (2026-11-13T23:20:12Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The algebraic foundations are well under way. Exchange matrices (§1.1) are nearly complete, Laurent rings (§0.2) exist without charts, and the tropical semifield and Y-seeds are in place. The first abstract piece of the upper-bound argument has landed. Quantum tori, full seeds with charts, the Laurent phenomenon itself, cluster varieties, finite type, positivity and double Bruhat cells have not begun.

### Named results

- **Factorization of matrix mutation**: mutation of an extended matrix is `E_ε B̃ F_ε` for two integer matrices that are their own inverses, the shared input for the classical and quantum layers ([`matrixMutation_eq_mul`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Cluster/ExchangeMatrix/Factorization.html#TauCeti.matrixMutation_eq_mul)).
- **Rank invariance under mutation**: mutation preserves rank after scalar change to any commutative ring, and with it independence of the columns ([`rank_matrixMutation`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Cluster/ExchangeMatrix/Factorization.html#TauCeti.rank_matrixMutation)).
- **The Laurent ring as a localization**: Laurent polynomials are the polynomial ring with its variables inverted, and evaluation at a family of units is injective exactly when the family is algebraically independent ([`isLocalization`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/MvPolynomial/Laurent/Polynomial.html#TauCeti.LaurentRing.isLocalization), [`aeval_injective_iff_algebraicIndependent`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/MvPolynomial/Laurent/Polynomial.html#TauCeti.LaurentRing.aeval_injective_iff_algebraicIndependent)).
- **Involutivity of Y-seed mutation**: normalized coefficient mutation together with matrix mutation is an involution, and it commutes with coefficient specialization and relabelling ([`mutation_involutive`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Cluster/YSeed/Basic.html#TauCeti.YSeed.mutation_involutive)).
- **Upper bounds from local inclusions**: for any family of involutions on lattice-valued charts, local three-chart inclusions make the upper bound equal to the intersection of all reachable charts. Generators lying in their adjacent charts then lie in every reachable chart ([`upperBound_eq_iInf_foldl_of_local`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Cluster/UpperBound/Lattice.html#TauCeti.Mutation.upperBound_eq_iInf_foldl_of_local)).

### Notable definitions and infrastructure

- [`CoefficientSemifield`](https://taucetiproject.org/docs/TauCeti/Algebra/Cluster/CoefficientSemifield/Basic.html#TauCeti.CoefficientSemifield) and [`Trop`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Cluster/CoefficientSemifield/Tropical.html#TauCeti.Trop): Fomin and Zelevinsky's coefficient groups, now with the tropical model `Trop(J)` (integer exponents under minimum) and its group evaluations. These are the geometric coefficients that §1.4 and principal coefficients will use.
- [`ExchangeMatrix`](https://taucetiproject.org/docs/TauCeti/Algebra/Cluster/ExchangeMatrix/Basic.html#TauCeti.ExchangeMatrix) with [column compatibility](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Cluster/ExchangeMatrix/Compatibility.html#Matrix.IsColumnCompatible): extended matrices with a fixed skew-symmetrizer, together with the compatibility condition `B̃ᵀΛ = (diag(w) 0)` that ties them to an alternating form. Nonzero weights force independent columns, and the [principal extension](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Cluster/ExchangeMatrix/Compatibility.html#TauCeti.ExchangeMatrix.principalExtension) always has independent columns and a compatible form, which is what the principal-coefficient Laurent theorem needs.
- [`YSeed`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Cluster/YSeed/Basic.html#TauCeti.YSeed): coefficients in a semifield paired with a square exchange matrix, the chart-free half of a seed.

### Roadmap coverage

**Layer 0 is partial.**
- §0.1 has coefficient semifields, their homomorphisms and products, the domain property of ℤ[P], and `Trop(J)` for integer exponents with generators, evaluations, reindexing and the finite comparison with `J → ℤ`. It still lacks zero-sum-free semirings and the regular localization `T(A)`, the lattice-ordered and max tropicalizations with zero adjoined, `Qsf(K)`, and `FractionRing ℤ[P]` with `P →* ℤ[P]ˣ`.
- §0.2 has the Laurent ring, its universal property, localization, renaming, coefficient maps and the domain property. Laurent charts, generating charts and the positive semifields `Pos(P,K)` are absent.
- §§0.3–0.7 are untouched.

**Layer 1 is partial.**
- §1.1 lacks only the ice-quiver bijection, form mutation and `matrixMutationWord`.
- Y-seeds from §1.2 exist, but coefficient systems, exchange data and seeds with charts do not.
- §§1.3–1.6 are untouched.

**Layer 2 is partial, at the level of scaffolding.** The abstract upper-bound propagation behind Q3 and the independence of principal extensions' columns are proved, but nothing that needs a seed is.

**Layers 3–6 are untouched.**

## The frontier

- **Finish §1.1**: the ice-quiver bijection intertwining matrix and quiver mutation, `formMutation` `Λ' = E_εᵀΛE_ε` preserving compatibility with the same weights, and iterated mutation along words.
- **Laurent charts and expansions (§§0.2–0.3)**: injective Laurent maps into an algebra, the canonical chart in `T(L(R,K))` and generating charts, then `laurentExpansion` and transition maps. This needs §0.1's regular localization `T`.
- **Finish §0.1**: zero-sum-free semirings and `T(A)`, the general lattice-ordered and max tropicalizations, the universal semifield `Qsf(K)` with its evaluation property, and `P →* ℤ[P]ˣ`.
- **Seeds and coefficient systems (§1.2)**: exchange polynomials, normalizers and seeds carrying a chart. Their mutation is what will supply the local three-chart inclusions that the abstract upper-bound theorem now takes as hypotheses.
- **Based quantum tori (§0.4)**: still waiting on the quantum monoid algebra from ScatteringDiagrams §4.3.

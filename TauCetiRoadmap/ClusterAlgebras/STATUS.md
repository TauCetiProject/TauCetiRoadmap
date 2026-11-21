<!--tauceti-status:v1 {"roadmap":"ClusterAlgebras","to_sha":"bf5b062a82c430e6c3f39b8852bf98ffdcef428f","ts":"2026-11-18T04:36:49Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"Laurent charts and Pos(P,K); expansions (0.3); Ore localization of quantum tori; 0.5; width and centre in 0.6; 0.7","state":"partial"},{"id":"Layer 1","remaining":"weighted ice quivers and amalgamation; coefficient systems, exchange data and seeds; binary seeds; 1.3 algebras; 1.5-1.6","state":"partial"},{"id":"Layer 2","remaining":"everything beyond abstract upper-bound propagation: P1, Q1-Q3 for seeds, L5-L8, Starfish","state":"partial"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","remaining":"the finite-type classification and its Dynkin types; root combinatorics (4.2)","state":"partial"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","remaining":"double Bruhat cells, generalized minors, the BFZ quiver, seed and coordinate-ring identification","state":"partial"}],"readme_sha":"32856f42984d76964fcb5d867c176d2ea172735596738f4654cea02ce6d0916a","roadmap":"ClusterAlgebras","to_sha":"bf5b062a82c430e6c3f39b8852bf98ffdcef428f"}-->
# Status: ClusterAlgebras

This file documents the status of the ClusterAlgebras roadmap up until `bf5b062` (2026-11-18T04:36:49Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The matrix side of Layer 1 is essentially complete, and the coefficient algebra of Layer 0 is largely in place. The other ingredients of a seed (exchange polynomials, based charts, tropical Y-seeds) now exist separately, but seeds themselves, the Laurent phenomenon, cluster varieties, positivity and double Bruhat cells have not begun beyond scaffolding.

### Named results

- **Factorization of matrix mutation**: mutation of an extended matrix is `E_ε B̃ F_ε` for two integer involutions, which gives invariance of rank and column independence and is shared by the classical and quantum layers ([`matrixMutation_eq_mul`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Cluster/ExchangeMatrix/Factorization.html#TauCeti.matrixMutation_eq_mul)).
- **The ice-quiver dictionary**: ice quivers correspond bijectively to rectangular integer matrices, and the correspondence turns quiver mutation into matrix mutation ([`IceQuiver.matrix_mutation`](https://taucetiproject.org/docs/TauCeti/Algebra/Cluster/IceQuiver/Mutation.html#TauCeti.IceQuiver.matrix_mutation)).
- **Compatibility is preserved by mutation**: mutating an alternating form by `Λ' = E_εᵀΛE_ε` alongside the matrix keeps column compatibility with the same weights, as in Berenstein–Zelevinsky's quantum seeds ([`transpose_matrixMutation_mul_formMutation`](https://taucetiproject.org/docs/TauCeti/Algebra/Cluster/ExchangeMatrix/FormMutation.html#TauCeti.transpose_matrixMutation_mul_formMutation)).
- **Tropical Y-seeds are extended matrices**: Y-seeds with coefficients in `Trop(J)` are exactly extended matrices with finitely supported frozen columns, and the bijection intertwines the two mutations ([`tropicalYSeedEquiv`](https://taucetiproject.org/docs/TauCeti/Algebra/Cluster/YSeed/Geometric.html#TauCeti.ExchangeMatrix.tropicalYSeedEquiv)).
- **Upper bounds from local inclusions**: for abstract involutions on lattice-valued charts, local three-chart inclusions make the upper bound equal to the intersection of all reachable charts ([`upperBound_eq_iInf_foldl_of_local`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Cluster/UpperBound/Lattice.html#TauCeti.Mutation.upperBound_eq_iInf_foldl_of_local)).

### Notable definitions and infrastructure

- [`BasedChart`](https://taucetiproject.org/docs/TauCeti/Algebra/Cluster/BasedChart/Basic.html#TauCeti.BasedChart): a chart presented as a faithful family of normalized monomials `M(a)M(b)=u^{Λ(a,b)}M(a+b)`, built on a based quantum torus. This is the chart a seed will carry, classical at `u=1`, `Λ=0` and quantum otherwise.
- [`ExchangePolynomial`](https://taucetiproject.org/docs/TauCeti/Algebra/Cluster/ExchangePolynomial/Basic.html#TauCeti.ExchangePolynomial): exchange polynomials with unit endpoints, with reversal, dilation and scaling and the propagation factor of a mutation. They make polynomial exchange data and normalization possible.
- [Coefficient semifields](https://taucetiproject.org/docs/TauCeti/Algebra/Cluster/CoefficientSemifield/Basic.html#TauCeti.CoefficientSemifield) with their models: `Trop(J)`, [min-tropical semifields](https://taucetiproject.org/docs/TauCeti/Algebra/Tropical/Basic.html#TauCeti.InfTropical) of lattice-ordered groups, zero adjunction, and the universal semifield `Qsf(K)` with its evaluation property.

### Roadmap coverage

**Layer 0 is partial.** §0.1 is largely in place in the library source, including zero adjunction, the total quotient `T(A)`, `Qsf(K)` and lattice tropicalization. §0.2 has the Laurent ring and its partially inverted subrings but no Laurent charts or `Pos(P,K)`. §0.3's expansions are absent. §0.4 has the based quantum torus and based charts but no Ore localization. §0.6 has the separated intersection `(f)∩(g)=(fg)` and its flat-module transport, but not the width argument or the centre. §§0.5 and 0.7 are untouched. **Layer 1 is partial.** §1.1 is done except the weighted ice quivers, freezing, defrosting and amalgamation. §1.2 has Y-seeds and exchange polynomials but no coefficient systems, exchange data or seeds. §1.3 has words and reachability for matrices and Y-seeds only. §1.4 has the tropical bijection and the stability of zero frozen rows, but no binary seeds. §§1.5–1.6 are untouched. **Layer 2 is partial** only at the level of the abstract upper-bound argument. **Layer 4 is partial**: the source has the Cartan companion with its symmetrization and the rank-two mutation classes, but not the classification. **Layer 6 is partial**: only BFZ's signed-word combinatorics. **Layers 3 and 5 are untouched.**

## The frontier

- **Coefficient systems, exchange data and seeds (§1.2)**: normalizers, exchange data with dilation-then-normalize mutation, and seeds carrying a based chart. With exchange polynomials and based charts in place, this is now the main gap, and it is what will supply the local inclusions the upper-bound theorem assumes.
- **Weighted ice quivers and amalgamation (§1.1)**: frozen weights, the full rational matrix, freezing and defrosting, and amalgamation. The BFZ quiver `Q(w)` of §6.2 is built this way.
- **Fractions of quantum tori (§0.4)**: the Ore conditions, the skew field of fractions, and the comparison with the quantum monoid algebra of ScatteringDiagrams §4.3.
- **Laurent charts and expansions (§§0.2–0.3)**: injective Laurent maps, generating charts in `T(L(R,K))`, `Pos(P,K)` and `laurentExpansion` with its transition maps.
- **Finish §0.6, then §§0.5 and 0.7**: relative primality via width, the centre of a quantum torus, one-exchange normal forms and finite polynomial replacement, which are the inputs to P1 and Q1–Q3.

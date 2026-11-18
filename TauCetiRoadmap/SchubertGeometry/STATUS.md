<!--tauceti-status:v1 {"roadmap":"SchubertGeometry","to_sha":"1b19ebb4ca6fab1281fb00c21dee68df6ff21243","ts":"2026-11-11T12:36:39Z"}-->
# Status: SchubertGeometry

This file documents the status of the SchubertGeometry roadmap up until `1b19ebb` (2026-11-11T12:36:39Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The combinatorial core is well advanced. The root operators of S4.2 are complete, S4.3 has its chain arithmetic and most of the LS-path theory, and the combinatorial items of S3 are done. Geometry has only just begun, with type-A Grassmannian loci and ring-level Frobenius splittings. There are still no flag varieties, Bott–Samelson schemes, line bundles, standard monomials or K-rings.

### Named results

- **Littelmann's a-chain criterion** — for comparable ends in W/W_λ, a saturated a-chain exists exactly when the denominator of a divides the interval gcd d_λ(x, y), and then every saturated chain is one ([`exists_isAChain_iff_den_dvd_intervalBondGcd`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/RootSystem/Weyl/IntervalBondGcd.html#TauCeti.exists_isAChain_iff_den_dvd_intervalBondGcd)).
- **Word independence of Demazure operators** — the braid relations hold, so D_{i₁}⋯D_{i_r} along a reduced word depends only on the element it spells ([`prod_map_demazureOperator_eq_of_wordProd_eq`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/RootSystem/Weyl/Demazure/Braid.html#RootPairing.prod_map_demazureOperator_eq_of_wordProd_eq)). Along an arbitrary word it equals the operator of the Demazure product.
- **Demazure's formula for the longest element** — D_{w₀}(e^λ) is Weyl's quotient ([`weylDenominator_mul_prod_map_demazureOperator_single`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/RootSystem/Weyl/Demazure/LongestElement.html#RootPairing.weylDenominator_mul_prod_map_demazureOperator_single)), resting on the [Weyl denominator identity](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/RootSystem/Weyl/Denominator/Integral.html#RootPairing.dotAlternatization_one) for a root datum. This is a formal identity; no comparison with modules or with cohomology has been made.
- **Lowering preserves LS paths** — Littelmann's f_i sends a Lakshmibai–Seshadri path of dominant shape to another one ([`exists_toPLPath_eq_of_lower_eq_some`](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/LSPath/Lower.html#TauCeti.LSPath.exists_toPLPath_eq_of_lower_eq_some)). There are [finitely many](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/LSPath/Basic.html#TauCeti.LSPath.finite) such paths, and the straight path is [the unique highest one](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/LSPath/Highest.html#TauCeti.LSPath.forall_raise_eq_none_iff).
- **The string-length identities** — on a path, the raising string has length −min H ([`isSome_raiseIter_iff_of_eq_natCast`](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/LSPath/StringLength.html#TauCeti.PLPath.isSome_raiseIter_iff_of_eq_natCast)) and the lowering string has length H(1) − min H. Together with the [partial-inverse property](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/LSPath/PartialInverse.html#TauCeti.PLPath.lower_eq_some_iff), these are the normal-crystal axioms for paths.

### Notable definitions and infrastructure

- The [interval bond gcd](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/RootSystem/Weyl/IntervalBondGcd.html#TauCeti.intervalBondGcd) d_λ(x, y), which is chain-independent by proof rather than by choice. It is the arithmetic S7 will compare with Chevalley divisor multiplicities.
- The [Schubert rank locus](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Grassmannian/RankLocus.html#Module.Grassmannian.schemeSchubertLocus), a closed subscheme of the Grassmannian cut out by minors against a basis flag, with base change and a universal property. Over a field, its cells are [in bijection with affine space](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/Basis/Flag.html#Module.Basis.flagCellEquiv) of dimension Σ(p_i − i).
- [Frobenius splittings](https://taucetiproject.org/docs/TauCeti/RingTheory/Frobenius/Splitting.html#TauCeti.FrobeniusSplitting) of rings, with compatible ideals closed under sums and intersections and with reduced quotients. They come with the affine-space Cartier trace, which [represents every p⁻¹-linear map](https://taucetiproject.org/docs/TauCeti/RingTheory/MvPolynomial/Cartier.html#TauCeti.MvPolynomial.existsUnique_eq_frobeniusTrace_mul).

### Roadmap coverage

S4.2 is done: the root operators with their conventions, presentation independence, partial inverses, endpoint shifts, string-length identities and local-minimum integrality on LS paths. S4.1 is largely in place. Crystals have components, transport, central weight twists, highest elements and Weyl-invariant formal characters. Paths have a segment model that is faithful up to reparametrization, with unique distinguished presentations. S4.3 is partial. The reflection test, cover bonds, interval gcd, a-chain criterion, central transport (with composition and inverse) and convexity are proved, as are finiteness, the unique highest path and lowering stability. Still missing are raising stability, B(λ) as a normal crystal, and its equivalence with the operator-generated component. S4.4 and S4.5 are partial. S4.4 has stretching, uniform subdivision into straight paths and the highest-concatenation criterion, but not the character or tensor-component theorem. S4.5 has the six-vertex S₃ Bruhat-chain complex with its four tetrahedra, but not general fixed-chain simplices. S3 is done in its combinatorial items: the Demazure operator, localization, idempotence, braid relations, word independence, and the Levi, wall and longest-word cases. Its geometric items (line bundles, ℙ¹ cohomology, H⁰ on X(w)) are untouched. S1 is partial in type A only: Schubert cells over a field, rank-locus subschemes against a basis flag, and the isotropic Grassmannian with affine charts. S5 is partial at ring level only. S2 and S9 have combinatorial support only: the Demazure-product subword criterion and an algebraic fixed-point formula. S4.6–7 and S6–S8 are untouched.

## The frontier

- **B(λ) as a normal crystal** — prove that raising preserves LS paths, package the paths as a `NormalCrystal`, and show that the a-chain description equals the operator-generated component.
- **The path character theorem (S4.4)** — prove the tensor-component theorem and the translated-chamber multiplicity rule, then derive the Demazure and Weyl characters. Stretching, subdivision and the highest-concatenation criterion are ready.
- **Type-A Schubert schemes (S1.3–4)** — identify the rank loci with the closures of the affine cells, and extend from a basis flag to an arbitrary complete subbundle flag over a base.
- **Splitting on root charts (S5.1–2)** — the affine trace and the coordinate-subspace compatibility exist. Gluing them across the root charts of G/B needs the flag carrier and the algebraic Steinberg module, both owned by ReductiveGroups and ShimuraData.
- **Line bundles and ℙ¹ cohomology (S3.1–3)** — not begun. This waits on the G/P− and Par_t(G) carriers from ShimuraData.

<!--tauceti-status:v1 {"roadmap":"SchubertGeometry","to_sha":"d25d526e576659755e7a68a568facb24cb7cf97f","ts":"2026-11-24T20:52:12Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"Par_t(G) and root cells (S1.0, S1.2), relative flags over a general base (S1.1), root-cell comparison of type-A cells (S1.3), the symplectic parabolic as a group (S1.5)","state":"partial"},{"id":"Layer 2","remaining":"cranks and word schemes; needs S1.0's flag carrier","state":"untouched"},{"id":"Layer 3","remaining":"associated lines L(lambda), sections, and the geometric reading of the supplied Demazure operators","state":"untouched"},{"id":"Layer 4","remaining":"S4.4's isomorphism and tensor-component theorems and the path character formula; S4.6-7","state":"partial"},{"id":"Layer 5","remaining":"Frobenius trace and compatible splitting on the flag's root charts; everything from S5.3 on","state":"partial"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","state":"untouched"},{"id":"Layer 9","state":"untouched"}],"readme_sha":"2d25c995512c68e0a1173189c9fee692cc3c9831e5e08fb5f6ba893a2042597c","roadmap":"SchubertGeometry","to_sha":"d25d526e576659755e7a68a568facb24cb7cf97f"}-->
# Status: SchubertGeometry

This file documents the status of the SchubertGeometry roadmap up until `d25d526` (2026-11-24T20:52:12Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Littelmann's path model is built through the connected crystal B(λ) and its chain simplices: S4.1–4.3 and S4.5 are done. The character formula and the tensor-component theorem (S4.4) are not. Geometry is still early: flag schemes and type-A Schubert cells over affine bases, isotropic stabilizers, and ring-level Frobenius splittings. There are no root cells, word schemes, line bundles, standard monomials, Chevalley divisors or flag K-rings.

### Named results

- **Littelmann's path-model theorem** — for dominant λ the Lakshmibai–Seshadri paths form a [connected](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/LSPath/Crystal/Normal.html#TauCeti.LSPath.connected_crystal_graph) normal crystal B(λ), and in any faithful realization it is [strictly isomorphic](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/LSPath/Crystal/Normal.html#TauCeti.LSPath.toPLPathComponentIso) to the component of the straight path in the ambient crystal of integral paths.
- **Stability of LS paths under root operators** — Littelmann's [raising](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/LSPath/Raise.html#TauCeti.LSPath.exists_toPLPath_eq_of_raise_eq_some) and [lowering](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/LSPath/Lower.html#TauCeti.LSPath.exists_toPLPath_eq_of_lower_eq_some) operators send an LS path of dominant shape to another one, by reflecting one strictly falling or rising piece.
- **Littelmann's crystal of integral paths** — every operator-closed set of integral paths is a normal crystal, with weight the endpoint and ε_i = −min H_i, φ_i = H_i(1) − min H_i ([`normalCrystalOn`](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/LSPath/Crystal/Basic.html#TauCeti.PLPath.normalCrystalOn)).
- **The integral break test** — a saturated a-chain between comparable ends of W/W_λ exists exactly when the denominator of a divides the interval bond gcd d_λ ([`exists_isAChain_iff_den_dvd_intervalBondGcd`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/RootSystem/Weyl/IntervalBondGcd.html#TauCeti.exists_isAChain_iff_den_dvd_intervalBondGcd)). On a chain simplex this [selects the LS points](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/LSPath/ChainSimplex.html#TauCeti.LSPath.mem_chainLSPoints_iff_den_dvd), so an edge carries d_λ(x, y) − 1 of them in its interior.
- **Type-A Schubert closures** — over any ring, the Zariski closure of a Schubert cell in the Grassmannian is the determinantal Schubert rank locus ([`closure_range_schubertCellι`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Grassmannian/Schubert.html#Module.Grassmannian.closure_range_schubertCellι)).

### Notable definitions and infrastructure

- The [flag scheme](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Schubert/AffineFlag/Basic.html#TauCeti.AlgebraicGeometry.flagScheme) of a finite module over an affine base is cut out of a product of Grassmannians by incidence equations. It is proper and has forgetful maps and base change, and it is the affine case of S1.1's relative flags.
- The [central-transport isomorphisms](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/LSPath/Central/Crystal.html#TauCeti.LSPath.centralTransportIso) T(λ,χ;σ) : B(λ)^(σ+χ) ≅ B(λ+χ)^σ come with identity, composition and inverse laws. They let path crystals move across central characters without changing root operators.
- The [Bruhat-chain complex](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/LSPath/Simplex/BruhatComplex.html#TauCeti.LSPath.bruhatChainComplex) of a shape λ: chain simplices glued along common faces, inside which the finite LS set sits as a strict subset.

### Roadmap coverage

Layer 4 is partial. S4.1, S4.2, S4.3 and S4.5 are done. S4.4 has the highest-concatenation criterion and linked-path subdivision lemmas but not the isomorphism theorem, the tensor-component theorem or Δ·char B(λ) = J(e^λ). S4.6–7 are untouched. Layer 1 is partial. S1.1 has flag schemes only over affine bases. S1.3 has the type-A cells as subschemes over any ring, but they are not yet identified with root cells. S1.5 has transitivity on isotropic subspaces and the Levi decomposition of their stabilizers. Par_t(G), root cells and the root-cell dictionary (S1.0, S1.2) are missing. Layer 5 is partial at ring level only. Layers 2, 3 and 6–9 are untouched. The README counts the Coxeter combinatorics and Demazure operators as supplied input, so they meet no milestone here.

## The frontier

- **Path characters and tensor components (S4.4)** — prove that the component of any dominant path ending at λ is isomorphic to B(λ), that B(λ)*B(μ) ≅ B(λ)⊗B(μ) decomposes over the λ-dominant η in B(μ), and that Δ·char B(λ) = J(e^λ). B(λ) and the concatenation morphism are in place.
- **Relative flags over any base (S1.1)** — glue the affine flag schemes along base change, and add tautological sequences, annihilator flags, refinement bundles and the comparison with the classical flag variety.
- **The symplectic parabolic as a group (S1.5)** — the split projection to GL_r × Sp_2s with its section and semidirect product, base change of the block maps, and the isotropic Grassmannian dimension r(2m−r) − r(r−1)/2.
- **Root cells and Par_t(G) (S1.0, S1.2)** — they need ReductiveGroups Layers 7–9. They block S1.3's comparison with root cells and every later geometric layer.
- **Line bundles, word schemes and splitting on G/P− (S2, S3.1, S5.1)** — not begun. All of them need S1.0's flag carrier.

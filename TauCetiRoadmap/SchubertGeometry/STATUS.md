<!--tauceti-status:v1 {"roadmap":"SchubertGeometry","to_sha":"273ea28e12515bd7f9e5c2aefd933352264b83e1","ts":"2026-10-21T07:26:02Z"}-->
# Status: SchubertGeometry

This file documents the status of the SchubertGeometry roadmap up until `273ea28` (2026-10-21T07:26:02Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Only the combinatorial foundation of the finite-type path engine (S4.1) has begun: abstract normal crystals with their tensor product, plus a model of piecewise-linear paths up to reparametrization. Nothing geometric has started. There are no flags, Schubert cells, Bott–Samelson schemes, line bundles, splittings, standard monomials or K-rings yet.

### Named results

- **String identities for normal crystals** — raising n times is defined exactly when n ≤ ε_i, and lowering n times exactly when n ≤ φ_i, each step shifting the weight by the simple root ([`isSome_eIter_iff`](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/Crystal/Basic.html#TauCeti.NormalCrystal.isSome_eIter_iff), [`isSome_fIter_iff`](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/Crystal/Basic.html#TauCeti.NormalCrystal.isSome_fIter_iff)).
- **Rigidity of normal crystals** — a normal crystal is determined by its weight map and raising operators ([`ext`](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/Crystal/Basic.html#TauCeti.NormalCrystal.ext)), and a weight-preserving map commuting with raising automatically commutes with lowering and preserves string lengths ([`f_apply_eq_of_e_map`](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/Crystal/Basic.html#TauCeti.NormalCrystal.f_apply_eq_of_e_map)).
- **Kashiwara's tensor-product rule** — the string lengths of x₁ ⊗ x₂ are ε_i = max(ε_i x₁, ε_i x₂ − ⟨wt x₁, α_i^∨⟩) and the symmetric formula for φ_i ([`tensor_ε_eq_max`](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/Crystal/Tensor.html#TauCeti.NormalCrystal.tensor_ε_eq_max), [`tensor_φ_eq_max`](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/Crystal/Tensor.html#TauCeti.NormalCrystal.tensor_φ_eq_max)).
- **Associativity and duality of the tensor product** — the [associator](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/Crystal/Tensor.html#TauCeti.NormalCrystal.tensorAssoc) is a strict isomorphism, and dualizing reverses the factors, (B₁ ⊗ B₂)^∨ ≅ B₂^∨ ⊗ B₁^∨ ([`dualTensor`](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/Crystal/Tensor.html#TauCeti.NormalCrystal.dualTensor)).

### Notable definitions and infrastructure

- [Normal crystals](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/Crystal/Basic.html#TauCeti.NormalCrystal) over a root datum with a base, with [strict morphisms](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/Crystal/Basic.html#TauCeti.NormalCrystal.StrictHom) and duals. This is the category the LS-path crystals B(λ) are meant to live in.
- The [tensor product](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/Crystal/Tensor.html#TauCeti.NormalCrystal.tensor) with Kashiwara's tie convention. That convention is chosen so that Littelmann's concatenation of paths will correspond to tensoring, as the later tensor-component theorem needs.
- A model of piecewise-linear paths as reduced segment lists (`TauCeti.PLPath`), with a normal-form algorithm, concatenation, endpoint and reversal. As its own documentation notes, it does not yet evaluate paths as functions on [0, 1] or prove that equal normal forms correspond to reparametrization.

### Roadmap coverage

S4.1 is partial. The crystal side has its axioms, string identities, strict morphisms, duals and tensor products, but components and transport through isomorphisms are missing. The path side has segment-list normal forms and concatenation, but no rational/integral-endpoint presentations, central translation or distinguished LS representatives. S4.2–7 (root operators on paths, B(λ) and its chain/gcd criterion, the character and component theorems, simplices, geometric path sections, the opposition dictionary) are untouched. So are S1–S3 and S5–S9: relative flags and root cells, Bott–Samelson words, line bundles and Demazure operators, Frobenius splitting and normality, standard monomial theory, Chevalley divisors, K-rings and the complex comparisons.

## The frontier

- **Finish the S4.1 crystal API** — connected components of a normal crystal and transport of crystal structure along bijections or strict isomorphisms. Both are small additions to the existing category.
- **Rational PL paths with integral endpoint** — upgrade the segment-list model to rational presentations with an endpoint in the weight lattice, and prove that equal normal forms are exactly reparametrization-equivalent, as S4.1 asks.
- **Littelmann root operators (S4.2)** — define e_i and f_i on paths via the running coroot heights, with the first/last cut-time conventions. Then prove they are partial inverses that shift the endpoint by ±α_i, so that paths become a normal crystal in the category above.
- **The LS crystal B(λ) and the chain-gcd criterion (S4.3)** — the a-chain description of LS paths, together with the chain-independent bond gcd d_λ(u,v) on parabolic Bruhat intervals. This needs the Weyl-group quotient/Bruhat API from RootSystems.
- **Relative flags and root cells (S1)** — the geometric side has not begun. Its first step consumes the universal flag and Par_t(G) carriers owned by ModularCurves, AlgebraicModuliForArithmeticGeometry and ShimuraData, so it waits on those owners.

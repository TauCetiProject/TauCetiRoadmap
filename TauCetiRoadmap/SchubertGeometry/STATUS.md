<!--tauceti-status:v1 {"roadmap":"SchubertGeometry","to_sha":"93d1fe508e122e53ce5538a8a3994c290753f127","ts":"2026-10-26T01:30:01Z"}-->
# Status: SchubertGeometry

This file documents the status of the SchubertGeometry roadmap up until `93d1fe5` (2026-10-26T01:30:01Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Only the combinatorial side of the roadmap has begun. The path engine (S4.1–3) has normal crystals, piecewise-linear paths with Littelmann's root operators, and the reflection and cover-bond facts on W/W_λ. S3 has the integral Demazure operator. Nothing geometric exists yet: there are no flags, Schubert cells, Bott–Samelson schemes, line bundles, splittings, standard monomials or K-rings.

### Named results

- **Littelmann's root operators are partial inverses** — lowering a path p gives q exactly when raising q gives p ([`lower_eq_some_iff`](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/LSPath/PartialInverse.html#TauCeti.PLPath.lower_eq_some_iff)). The operators do not depend on the chosen presentation and shift the endpoint by ∓α.
- **The reflection test on W/W_λ** — for a positive root β and minimal coset representatives, s_β u lies strictly below u exactly when ⟨uλ, β^∨⟩ < 0, and in the same coset exactly when the pairing is zero (`bruhatLE_and_ne_iff_coroot'_neg_of_isMinimalCosetRep`). Behind it, the stabilizer of a dominant weight [is a standard parabolic subgroup](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/RootSystem/Weyl/ParabolicQuotient.html#RootPairing.parabolic_wallIndices_eq_stabilizer).
- **Cover bonds are positive integers with a unique root label** — each cover y ⋖ x in W/W_λ satisfies yλ = s_β xλ for exactly one positive root β ([`existsUnique_isPos_reflection_smul_eq_of_minimalCosetRepCovBy`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/RootSystem/Weyl/CoverBond.html#TauCeti.existsUnique_isPos_reflection_smul_eq_of_minimalCosetRepCovBy)), and when λ is integral its bond ⟨yλ, β^∨⟩ is a positive integer ([`exists_nat_reflectionBond_eq_of_minimalCosetRepCovBy`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/RootSystem/Weyl/CoverBond.html#TauCeti.exists_nat_reflectionBond_eq_of_minimalCosetRepCovBy)).
- **The Demazure localization identity** — (1 − e^{−α_i}) D_i f = f − e^{−α_i} s_i f ([`one_sub_single_neg_root_mul_demazureOperator`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/RootSystem/Weyl/Demazure.html#RootPairing.one_sub_single_neg_root_mul_demazureOperator)), and the identity D_i² = D_i follows ([`demazureOperator_demazureOperator`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/RootSystem/Weyl/Demazure.html#RootPairing.demazureOperator_demazureOperator)).
- **Kashiwara's tensor-product rule** — for normal crystals, ε_i(x₁ ⊗ x₂) = max(ε_i x₁, ε_i x₂ − ⟨wt x₁, α_i^∨⟩), and symmetrically for φ_i ([`tensor_ε_eq_max`](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/Crystal/Tensor.html#TauCeti.NormalCrystal.tensor_ε_eq_max)). The tensor product also has an associator and is compatible with duals.

### Notable definitions and infrastructure

- [Normal crystals](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/Crystal/Basic.html#TauCeti.NormalCrystal) with strict morphisms, duals and a [tensor product](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/Crystal/Tensor.html#TauCeti.NormalCrystal.tensor) using Kashiwara's tie convention. This is the category the path crystals B(λ) are meant to live in.
- Piecewise-linear paths as reduced segment lists, carrying Littelmann's [lowering operator](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/LSPath/RootOperator.html#TauCeti.PLPath.lower) and its reversal-conjugate [raising operator](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/LSPath/RootOperator.html#TauCeti.PLPath.raise). The operators are defined over any ordered field, for an arbitrary vector and linear form.
- The [reflection bond](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/RootSystem/ReflectionBond.html#RootPairing.reflectionBond) of two weights related by a positive-root reflection, together with the [cover relation](https://taucetiproject.org/docs/TauCeti/GroupTheory/Coxeter/Bruhat.html#CoxeterSystem.MinimalCosetRepCovBy) on minimal coset representatives. These are the edge labels from which the chain gcd d_λ(u, v) is to be built.

### Roadmap coverage

S4.1 is partial. Crystals have their axioms, string identities, tensor products and duals, but no connected components or transport along isomorphisms. Paths are reduced segment lists, with no rational presentations and no proof that normal forms match reparametrization classes. S4.2 is partial. The root operators, their presentation independence, their partial-inverse property and their endpoint shifts are proved. Still missing are the crystal identities ε = −min H and φ = H(1) − min H, the local-minimum integrality, and the packaging of paths as a normal crystal. S4.3 is partial: only its preliminary reflection test and the cover-bond positivity and uniqueness are done. B(λ), a-chains, the interval gcd, central transport and convexity are untouched. S3 is partial in its combinatorial items: the Demazure operator, its localization identity and idempotence. Line bundles, ℙ¹ cohomology, braid relations and the character formulas are untouched. S4.4–7, S1, S2 and S5–S9 are untouched.

## The frontier

- **Paths as a normal crystal** — prove ε = −min H and φ = H(1) − min H on integral paths, and assemble the root operators into a `NormalCrystal`. Then add components and transport, which S4.1 also asks for.
- **The interval gcd d_λ(u, v)** — prove maximal-chain connectivity by rank-two replacements in parabolic Bruhat intervals, then the rank-two bond-gcd checks (A₁×A₁, A₂, B₂, G₂), then the a-chain divisibility criterion. The cover bonds it is built from are now available.
- **The LS crystal B(λ)** — encode it by decreasing cosets and a-chains, and prove this matches the operator-generated component. This needs the two items above and rational path presentations.
- **Braid relations for Demazure operators** — the braid relations and word-independence of S3.4, leading to the Demazure and Weyl character formulas. The geometric identification with H⁰(X(w), L_λ) waits on S5.
- **Relative flags and root cells (S1)** — not begun. This step consumes the universal flag and Par_t(G) carriers owned by other roadmaps, so it waits on them.

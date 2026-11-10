<!--tauceti-status:v1 {"roadmap":"BanachAlgebras","to_sha":"d2083f0f1dd2136d02467ba36efbbe1af612e89c","ts":"2026-11-08T09:37:56Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"positive functionals and Banach-input GNS, the swapped-involution example, and the 1.2 norm examples","state":"partial"},{"id":"Layer 2","remaining":"the smooth contour system, the germ calculus homomorphism with uniqueness and spectral mapping, Riesz idempotents, and all of 2.2","state":"partial"},{"id":"Layer 3","remaining":"nonunital character spaces and their unitization comparison, and AC[0,1] with its operator calculus","state":"partial"},{"id":"Layer 4","remaining":"double centralizers, balanced module tensors, and Arens regularity criteria","state":"partial"},{"id":"Layer 5","remaining":"the general separating-ideal structure theorem and the derivative formula D(f(a)) = f'(a)Da","state":"partial"},{"id":"Layer 6","remaining":"amenability equivalences, virtual diagonals, permanence, and square-zero extensions","state":"partial"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","remaining":"contour agreement for compact Riesz projections, the transitive-algebra lemma and Lomonosov hyperinvariance","state":"partial"}],"readme_sha":"dcac48da4c0d5415efe1cf6a5883c2705df8bb41cef100b853298527df17f477","roadmap":"BanachAlgebras","to_sha":"d2083f0f1dd2136d02467ba36efbbe1af612e89c"}-->
# Status: BanachAlgebras

This file documents the status of the BanachAlgebras roadmap up until `d2083f0` (2026-11-08T09:37:56Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Automatic continuity (A5) is essentially done: all four of its continuity theorems and Singer–Wermer are proved, and only the general separating-ideal structure theorem and the functional-calculus derivative formula remain. A1, A2, A3, A4, A6 and A8 are partial. A2 has everything but the calculus homomorphism itself. A7, group algebras and Johnson's amenability theorem, has not begun.

### Named results

- **Johnson's uniqueness-of-norm theorem**: any two complete algebra norms on a semisimple complex algebra are equivalent. It is deduced from Johnson's theorem that a surjective homomorphism onto a semisimple Banach algebra is continuous, and a nonunital form is also proved ([`AlgebraNorm.exists_le_mul_and_le_mul_of_jacobson_eq_bot`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Algebra/SeparatingIdeal/NormUniqueness.html#AlgebraNorm.exists_le_mul_and_le_mul_of_jacobson_eq_bot)).
- **The Johnson–Sinclair theorem**: every derivation of a semisimple Banach algebra is continuous, with no continuity assumed ([`LinearMap.continuous_of_derivation_of_jacobson_eq_bot`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Algebra/SeparatingIdeal/Derivation.html#LinearMap.continuous_of_derivation_of_jacobson_eq_bot)).
- **The Singer–Wermer theorem**: a bounded derivation of a commutative Banach algebra, possibly without unit, takes values in the radical ([`ContinuousLinearMap.apply_mem_nonUnitalJacobson_of_derivation`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Algebra/Derivation/SingerWermer.html#ContinuousLinearMap.apply_mem_nonUnitalJacobson_of_derivation)).
- **Cohen–Hewitt factorization**: given a bounded approximate identity, every element of an essential Banach module factors with a norm bound. The left, right and bimodule forms are all proved, and the bimodule form shows that essential bimodules are pseudo-unital ([`ContinuousLinearMap.exists_apply_apply_eq_of_mem_topologicalClosure_span`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Module/CohenFactorization/Bimodule.html#ContinuousLinearMap.exists_apply_apply_eq_of_mem_topologicalClosure_span)).
- **Rickart's scalar-commutant theorem**: every algebraic endomorphism of a simple complex Banach module is a scalar. Complex Jacobson density follows from it ([`LinearMap.existsUnique_eq_smul_of_isSimpleModule`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Module/Simple.html#LinearMap.existsUnique_eq_smul_of_isSimpleModule)).

### Notable definitions and infrastructure

- **Separating ideals** ([`Submodule.IsSeparatingIdeal`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Algebra/SeparatingIdeal/Basic.html#Submodule.IsSeparatingIdeal)) carry the automatic-continuity arguments. The separating spaces of surjective homomorphisms, of derivations and of intertwining maps are separating ideals, and in a semisimple algebra every separating ideal is finite-dimensional.
- **The primitive spectrum** ([`TauCeti.PrimitiveSpectrum`](https://taucetiproject.org/docs/TauCeti/RingTheory/Spectrum/Primitive/Basic.html#TauCeti.PrimitiveSpectrum)) comes with its hull–kernel topology, and its kernel is the Jacobson radical. Through it, a separating ideal lies in all but finitely many primitive ideals.
- **The algebra of holomorphic germs** ([`TauCeti.holomorphicGerms`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/Germ/Algebra.html#TauCeti.holomorphicGerms)) near a compact set, together with restriction maps from each algebra O(U). These form the domain of the holomorphic calculus. On the contour side, resolvent integrals do not depend on the cycle, are multiplicative over nested cycles and recover polynomials.

### Roadmap coverage

- **A5 is partial, with little left.** Šilov's, Johnson's and Johnson–Sinclair's theorems, the homeomorphism and norm-uniqueness corollaries, Singer–Wermer and the exponential of a derivation are proved, each with nonunital forms. Missing: the general structure theorem J = D ⊕ rad J, and D(f(a)) = f′(a)·Da.
- **A1 is partial.** Done: the radical, primitive ideals, the primitive spectrum, Rickart's theorem, quotients with the continuous first isomorphism theorem, and the left-regular renorming. Missing: positive functionals and Banach-input GNS (1.3), the swapped-involution example (1.4), and most worked examples in 1.2.
- **A2 is partial.** Done: the Banach-valued Cauchy theory, weak holomorphy, O(U) and germs, the resolvent-integral identities and the grid cover. Missing: the smooth contour system, the calculus homomorphism and its uniqueness, Riesz idempotents, and all of 2.2.
- **A3 is partial.** Done: diagonal operators on ℓ² realizing every nonempty compact set as a spectrum, the Gelfand kernel as the radical, and character pullback. Missing: the nonunital character-space theory and AC[0,1].
- **A4 is partial.** Done: approximate identities, dual actions and all three Cohen–Hewitt forms. Arens products are defined in the source with norm bounds, but regularity criteria are not. Double centralizers and balanced tensors are not established here.
- **A6 is partial.** Done: the bounded Hochschild coboundary, δ² = 0, coefficient naturality, and approximate diagonals giving bounded approximate identities. Missing: the amenability equivalences, permanence, and square-zero extensions.
- **A8 is partial.** Done: the Riesz decomposition at nonzero scalars and the eigenvalue threshold, which gives countable spectrum. Missing: contour agreement and Lomonosov. A Schauder fixed-point theorem is present in the source.
- **A7 is untouched.**

## The frontier

- **The holomorphic functional calculus (A2)**: assemble the germ homomorphism f ↦ (2πi)⁻¹∫ f(z)(z−a)⁻¹dz, prove its uniqueness, spectral mapping and composition, then Riesz idempotents. The identities are in place, but the cycle-existence construction around compact sets beyond the grid cover is still needed.
- **Lomonosov's theorem (A8)**: prove the transitive-algebra lemma and hyperinvariance, using the Schauder theorem already in the source and the compact eigenspace results.
- **Amenability equivalences (A6)**: show that bounded approximate diagonals, virtual diagonals and inner derivations into duals are equivalent. Surjectivity of the multiplication map is done. Cohomology groups and universal derivations have begun in the source.
- **The separating-ideal structure theorem (A5)**: J ⊆ rad B, or J = D ⊕ rad J with D finite-dimensional. The finite-dimensionality pieces are proved.
- **Positive functionals and GNS (A1.3)**: automatic continuity of positive functionals and the cyclic representation for Banach *-algebras.

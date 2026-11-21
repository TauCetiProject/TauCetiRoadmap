<!--tauceti-status:v1 {"roadmap":"BanachAlgebras","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"positive functionals and Banach-input GNS, the swapped-involution example, and the 1.2 norm examples","state":"partial"},{"id":"Layer 2","remaining":"Riesz idempotents, the smooth contour system, rectifiable paths, logarithms and roots, idempotent lifting, and all of 2.2","state":"partial"},{"id":"Layer 3","remaining":"nonunital character spaces and their unitization comparison, and AC[0,1] with its operator calculus","state":"partial"},{"id":"Layer 4","remaining":"the multiplier extension of representations, balanced module tensors, and Arens regularity criteria","state":"partial"},{"id":"Layer 5","remaining":"the general separating-ideal structure theorem and the derivative formula D(f(a)) = f'(a)Da","state":"partial"},{"id":"Layer 6","remaining":"amenable implies approximate diagonal, virtual diagonals, higher-degree vanishing, permanence, and square-zero extensions","state":"partial"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","remaining":"contour agreement for compact Riesz projections, the polynomially compact case, and the l2 invariant-subspace question","state":"partial"}],"readme_sha":"dcac48da4c0d5415efe1cf6a5883c2705df8bb41cef100b853298527df17f477","roadmap":"BanachAlgebras","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: BanachAlgebras

This file documents the status of the BanachAlgebras roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Two depth milestones now stand: automatic continuity for semisimple algebras (A5) and Lomonosov's invariant-subspace theorem (A8). The holomorphic functional calculus (A2) is built, though Riesz idempotents and all of 2.2 are still missing. Amenability (A6) is defined but its diagonal equivalences are only half proved. Group algebras and Johnson's amenability theorem (A7) have not begun.

### Named results

- **Lomonosov's theorem** — over ℂ, a nonscalar operator commuting with a nonzero compact operator has a nonzero proper closed hyperinvariant subspace. A real-or-complex invariant-subspace form and the Aronszajn–Smith theorem are also proved ([`IsCompactOperator.exists_isClosed_ne_bot_ne_top_forall_commute_mem_invtSubmodule_of_commute`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Operator/Algebra/Lomonosov.html#IsCompactOperator.exists_isClosed_ne_bot_ne_top_forall_commute_mem_invtSubmodule_of_commute)).
- **The spectral mapping theorem for the holomorphic calculus** — for f holomorphic near the spectrum of a, σ(f(a)) = f(σ(a)), and f(a) is invertible exactly when f has no zero on σ(a) ([`TauCeti.spectrum_holomorphicCalculus_ofFun`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Algebra/HolomorphicFunctionalCalculus/Spectrum.html#TauCeti.spectrum_holomorphicCalculus_ofFun)).
- **Johnson's uniqueness-of-norm theorem** — any two complete algebra norms on a semisimple complex algebra are equivalent. It follows from Johnson's theorem that surjective homomorphisms onto semisimple Banach algebras are automatically continuous ([`AlgebraNorm.exists_le_mul_and_le_mul_of_jacobson_eq_bot`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Algebra/SeparatingIdeal/NormUniqueness.html#AlgebraNorm.exists_le_mul_and_le_mul_of_jacobson_eq_bot)).
- **The Johnson–Sinclair theorem** — every derivation of a semisimple Banach algebra is continuous, with no continuity assumed ([`LinearMap.continuous_of_derivation_of_jacobson_eq_bot`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Algebra/SeparatingIdeal/Derivation.html#LinearMap.continuous_of_derivation_of_jacobson_eq_bot)).
- **Cohen–Hewitt factorization** — given a bounded approximate identity, every element of an essential Banach left, right or bimodule factors with a norm bound ([`ContinuousLinearMap.exists_apply_apply_eq_of_mem_topologicalClosure_span`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Module/CohenFactorization/Bimodule.html#ContinuousLinearMap.exists_apply_apply_eq_of_mem_topologicalClosure_span)).

### Notable definitions and infrastructure

- **The holomorphic calculus** ([`TauCeti.holomorphicCalculus`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Algebra/HolomorphicFunctionalCalculus/Basic.html#TauCeti.holomorphicCalculus)) is a unital homomorphism from germs near the spectrum, defined by the contour integral and continuous on each O(U). The source also has its uniqueness among such continuous homomorphisms, the composition rule g(f(a)) = (g∘f)(a), power-series agreement, naturality and commutation. This is the base for Riesz idempotents.
- **Amenability** ([`TauCeti.IsAmenable`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Algebra/Amenable.html#TauCeti.IsAmenable)) asks that every bounded derivation into a dual bimodule be inner. It sits on the [bounded Hochschild cohomology](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Algebra/HochschildCohomology/Complex.html#ContinuousLinearMap.hochschildBimoduleCohomology) groups, where H⁰ is the centre and H¹ is derivations modulo inner ones. It also uses the universal bounded derivation into completed one-forms.
- **Separating ideals** ([`Submodule.IsSeparatingIdeal`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Algebra/SeparatingIdeal/Basic.html#Submodule.IsSeparatingIdeal)) carry the automatic-continuity arguments. In a semisimple algebra every separating ideal is finite-dimensional.

### Roadmap coverage

- **A5 and A8 are partial, with little left.** A5 lacks only the general structure theorem J = D ⊕ rad J and the derivative formula D(f(a)) = f′(a)·Da. A8 has the compact Riesz decomposition, countable spectrum, Schauder's theorem, transitive algebras, Lomonosov's lemma and both invariant-subspace theorems. Still missing are contour agreement with Riesz projections, the polynomially compact case, and the ℓ² invariant-subspace question with its reduction.
- **A2 is partial.** 2.1's calculus is complete through uniqueness, composition and spectral mapping. Still missing are Riesz idempotents, the smooth contour system, rectifiable paths, logarithms and roots, idempotent lifting and the normality converse. Nothing in 2.2 has landed.
- **A4 and A6 are partial.** A4 has Cohen–Hewitt, both Arens products with identities from approximate identities, and double centralizers with their algebraic model and isometric ideal embedding. A4 lacks the multiplier extension of representations, balanced tensors and Arens regularity criteria. A6 has cohomology through H¹, universal derivations, and the implication from approximate diagonals to amenability. A6 lacks the converse, virtual diagonals, higher-degree vanishing, permanence and square-zero extensions.
- **A1 and A3 are partial, unchanged.** A1 lacks positive functionals and GNS (1.3), the swapped involution (1.4) and most 1.2 examples. A3 lacks the nonunital character-space comparison and AC[0,1], though nonunital characters are now known to be contractive.
- **A7 is untouched.**

## The frontier

- **Riesz idempotents (A2)**: build the idempotents for a partition of the spectrum, with orthogonality, sum one and corner spectra. Then compare them with the compact Riesz decomposition to close A8's contour agreement.
- **Amenability equivalences (A6)**: prove that amenable algebras have bounded approximate identities, and build the virtual diagonal from a weak-star cluster point of eᵢ⊗eᵢ. Bidual cluster points and Cohen–Hewitt surjectivity are already available; the Goldstine passage back to an approximate diagonal is not.
- **The separating-ideal structure theorem (A5)**: J ⊆ rad B, or J = D ⊕ rad J with D finite-dimensional. The finite-dimensionality pieces are proved.
- **Multipliers and Arens regularity (A4)**: the unique extension of an essential bounded representation to the double centralizers, and the weak-compactness and double-limit criteria.
- **Group algebras (A7)**: nothing has landed. The product-domain work in 7.1 needs only Mathlib, while Johnson's theorem in 7.6 waits on the A6 diagonal equivalences.

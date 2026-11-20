<!--tauceti-status:v1 {"roadmap":"KacMoody","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","remaining":"Cartan injectivity, central splitting of the algebra, triangular decomposition, invariant form, PBW, affine loop isomorphism","state":"partial"},{"id":"Layer 2","remaining":"Coxeter isomorphism and faithfulness, length, real roots, Tits cone, parabolic quotients","state":"partial"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","remaining":"the cone-supported character ring; its convolution finiteness lemma is already proved","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","state":"untouched"},{"id":"Layer 9","state":"untouched"}],"readme_sha":"ad652c35c885ea4e0f4680f96c263a1c99ec13f213cb210288392dcb7ef61ed2","roadmap":"KacMoody","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: KacMoody

This file documents the status of the KacMoody roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer 0 is done: realizations, their uniqueness, the lattices and the dominance order are all proved. Layers 1 and 2 have started, with the presented algebra and its Serre comparison, and with the Weyl group and the Coxeter relations. From highest-weight modules onward nothing exists yet: no modules, characters, paths or groups.

### Named results

- **Kac's dimension bound.** Every realization of an `I × I` matrix `A` has dimension at least `2|I| − rank A` ([`two_mul_card_le_rank_add_finrank`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/Matrix/Cartan/Realization/Basic.html#TauCeti.CartanRealization.two_mul_card_le_rank_add_finrank)), and every matrix has a realization that attains it ([`Matrix.nonempty_cartanRealization`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/Matrix/Cartan/Realization/Basic.html#Matrix.nonempty_cartanRealization)).
- **Uniqueness of minimal realizations.** Any two minimal realizations of the same matrix are isomorphic by a map that preserves roots and coroots, singular matrices included ([`IsMinimal.exists_map_eq`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/Matrix/Cartan/Realization/Uniqueness.html#TauCeti.CartanRealization.IsMinimal.exists_map_eq)).
- **The central splitting of a realization.** Every finite-dimensional realization is a minimal sub-realization plus a summand killed by all simple roots ([`exists_isMinimal_restrict_isCompl`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/Matrix/Cartan/Realization/CentralSplitting.html#TauCeti.CartanRealization.exists_isMinimal_restrict_isCompl)).
- **The braid orders of simple reflections.** Over a field of characteristic zero, `sᵢsⱼ` has order exactly 2, 3, 4 or 6 when the Cartan product is 0, 1, 2 or 3, and infinite order from 4 on ([`orderOf_simpleReflection_mul_simpleReflection`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/Matrix/Cartan/Realization/Weyl.html#TauCeti.CartanRealization.orderOf_simpleReflection_mul_simpleReflection)). As a result the Coxeter group maps onto the Weyl group ([`range_coxeterHom`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/Matrix/Cartan/Realization/Weyl.html#TauCeti.CartanRealization.range_coxeterHom)).
- **Serre's algebra is the derived algebra.** The image of Serre's presentation in the Kac–Moody algebra is `[𝔤, 𝔤]` ([`range_serreHom_eq_derivedSeries`](https://taucetiproject.org/docs/TauCeti/Algebra/Lie/KacMoody/Basic.html#TauCeti.KacMoody.range_serreHom_eq_derivedSeries)), and `𝔤 = [𝔤, 𝔤] + H` ([`range_serreHom_sup_range_cartanElement`](https://taucetiproject.org/docs/TauCeti/Algebra/Lie/KacMoody/Basic.html#TauCeti.KacMoody.range_serreHom_sup_range_cartanElement)).

### Notable definitions and infrastructure

- **The presented Kac–Moody algebra** ([`PresentedLieAlgebra`](https://taucetiproject.org/docs/TauCeti/Algebra/Lie/KacMoody/Basic.html#TauCeti.KacMoody.PresentedLieAlgebra)). It is the free Lie algebra on the full realization and the Chevalley generators, modulo the Cartan and Serre relators. Its [universal property](https://taucetiproject.org/docs/TauCeti/Algebra/Lie/KacMoody/Basic.html#TauCeti.KacMoody.lift) is how every later homomorphism out of `𝔤` will be built.
- **Realizations of a matrix** ([`CartanRealization`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/Matrix/Cartan/Realization/Basic.html#TauCeti.CartanRealization)). These keep the full ambient space, so a singular Cartan matrix loses nothing. They can be transported, restricted, and [extended to a larger field](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/Matrix/Cartan/Realization/BaseChange.html#TauCeti.CartanRealization.baseChange). The library also has coweight lattices `Y`, their dual weight lattices `P` with a perfect pairing, and the criterion for fundamental weights to lie in `P`.
- **The dominance order on weights** ([`RootLE`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/Matrix/Cartan/Realization/RootLattice.html#TauCeti.CartanRealization.RootLE)). This is `μ ≤ λ` when `λ − μ` lies in the positive root cone. The order is antisymmetric even for a singular matrix, and it has [finite bounded-height intervals](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/Matrix/Cartan/Realization/RootLattice.html#TauCeti.CartanRealization.finite_setOf_rootLE_height_le). These are the finiteness facts that category `O` and the character rings rely on.

### Roadmap coverage

Layer 0 is done. Section 0.1 was already in place. Section 0.2 is now complete, with isomorphism of minimal realizations for singular `A` and scalar extension. Section 0.3 has `P`, `Y`, `Q`, `Q_+`, height, dominance and finite-height intervals.

Layer 1 is partial. Section 1.1 has the presentation, its universal property and the Serre comparison. It still lacks Cartan injectivity, the central splitting of the algebra, `[𝔤,𝔤] ∩ H = H_Q'` and the functoriality morphisms. Sections 1.2–1.5 are untouched.

Layer 2 is partial. Section 2.1 has the simple and dual reflections, the Weyl group, the stability of `Q`, `P` and `Y`, the Coxeter relations and the surjection from the Coxeter group. The isomorphism, faithfulness, length and transport of real roots are missing. Sections 2.2–2.3 are untouched.

Layers 3–9 are untouched. The local-finiteness lemma for cone convolution is groundwork for Layer 4, not one of its milestones.

## The frontier

- **Cartan injectivity (1.1).** The map from the realization into the presented algebra still has to be shown injective (Kac, Theorems 1.2 and 9.11). The central splitting of the algebra and `[𝔤,𝔤] ∩ H = H_Q'` also remain, and every later layer leans on them.
- **The Weyl group as a Coxeter group (2.1).** The surjection from the Coxeter group needs to be proved injective (Kac, Proposition 3.13), via the descent criterion `ℓ(wsᵢ) < ℓ(w)` iff `w(αᵢ) < 0`. Faithfulness on `Q` and the length function also remain.
- **Triangular decomposition and root spaces (1.2).** This needs Cartan injectivity first, and 2.1 for real roots as Weyl orbits.
- **The cone-supported character ring (4.1).** The convolution finiteness, the lattices and the dominance order are all in place, so the ring and its completion can now be built.
- **Tits cone and inversion sets (2.2).** This waits on the Coxeter identification and the length function from 2.1.

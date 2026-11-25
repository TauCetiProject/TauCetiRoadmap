<!--tauceti-status:v1 {"roadmap":"AlgebraicKTheory","to_sha":"0253c4f16eb7629683572bfef8e6cc2571faac5c","ts":"2026-11-25T06:54:39Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"kZeroMap with extendScalarsιIso and extendScalarsCompIso, products and corner Morita, the complex half of the Möbius example","state":"partial"},{"id":"Layer 1","remaining":"lower-right and injective corner embeddings, filtered colimits, the finitary-automorphism comparison","state":"partial"},{"id":"Layer 2","remaining":"the automorphism presentation, Morita invariance, the Dieudonne determinant, kOne_divisionRing, filtered colimits","state":"partial"},{"id":"Layer 3","remaining":"relative K1(R,I), K0(R,I), the boundary and five-term sequence, reduced K0 and its comparison","state":"partial"},{"id":"Layer 4","remaining":"semilocal stable range one, Jacobson-radical invariance, covering dimension and Vaserstein's function-ring theorems (4.3-4.5)","state":"partial"},{"id":"Layer 5","remaining":"Matsumoto's theorem, K2 of finite fields, the relative connecting map, Morita and products for K2","state":"partial"},{"id":"Layer 6","remaining":"patching triples and milnor_patching, the boundary, exactness at K1(Q), K0(D) and the K0 end","state":"partial"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","remaining":"8.2: exponentials, the identity component and lifting along surjections","state":"partial"}],"readme_sha":"71b5024f0ff411695b02f74beb386a1a138047a6fdbcdb4629ecfd11b3f292e1","roadmap":"AlgebraicKTheory","to_sha":"0253c4f16eb7629683572bfef8e6cc2571faac5c"}-->
# Status: AlgebraicKTheory

This file documents the status of the AlgebraicKTheory roadmap up until `0253c4f` (2026-11-25T06:54:39Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Eight of the nine layers are now partial and none is complete. The universal central extension (5.1) and the stability theorems (4.1) are done. K₀ has its idempotent model and its function-ring examples, but its induced map along ring maps is still missing, and so is Milnor patching. Only Layer 7's gluing calculations have not begun.

### Named results

- **The Kervaire–Steinberg theorem** — for every ring, [St(R) → E(R) is the universal central extension](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Steinberg/UniversalCentralExtension.html#TauCeti.steinberg_universalCentralExtension) of the perfect group E(R). It rests on [Milnor's centrality theorem](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Steinberg/Centrality.html#TauCeti.SteinbergGroup.ker_toStableGL_le_center) K₂(R) ≤ Z(St(R)).
- **Bass–Vaserstein stability** — over a ring of stable range at most s, every invertible matrix is [elementary times a size-s block](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Stability/Surjective.html#TauCeti.surjective_stability), and an [elementary stabilization forces elementarity](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Stability/Injective.html#TauCeti.injective_stability) from size s + 1 on. Hence [K₁(R) ≅ GLₙ(R)/Eₙ(R)](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Stability.html#TauCeti.AlgebraicK1.quotientFinElementarySubgroupEquiv) for n ≥ s + 1.
- **Bass's bound** — a commutative Noetherian ring of Krull dimension at most d [has stable range at most d + 1](https://taucetiproject.org/docs/TauCeti/RingTheory/StableRange/Commutative.html#TauCeti.hasStableRangeLE_of_ringKrullDim_le).
- **Mayer–Vietoris for K₁ at the middle term** — for a fibre product of rings with one surjective leg, the [K₁ sequence is exact at K₁(A₁) × K₁(A₂)](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Pullback.html#TauCeti.AlgebraicK1.mayerVietoris_exact).
- **K₁ of a Euclidean domain is its group of units** — the determinant gives [K₁(R) ≅ Rˣ](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/DeterminantK1.html#TauCeti.AlgebraicK1.detEquiv) whenever [SK₁(R) vanishes](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/DeterminantK1.html#TauCeti.specialAlgebraicK1_eq_bot_of_euclideanDomain), which covers ℤ and every field. In K₁(ℤ) = {±1}, the class of −1 [has order two](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/DeterminantK1.html#TauCeti.AlgebraicK1.orderOf_ofUnits_neg_one_int).

### Notable definitions and infrastructure

- [`AlgebraicK2`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Steinberg/K2.html#TauCeti.AlgebraicK2) — K₂ as the kernel of St(R) → GL(R). It is abelian, functorial and exact in 1 → K₂ → St → GL → K₁ → 1, and carries [Steinberg symbols](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Steinberg/Symbol.html#TauCeti.steinbergSymbol).
- [`IdempotentMonoid`](https://taucetiproject.org/docs/TauCeti/Algebra/Category/ModuleCat/FiniteProjective/KZero/Idempotent.html#TauCeti.IdempotentMonoid) — the monoid V(R) of idempotent matrices up to equivalence, with [K₀ its group completion](https://taucetiproject.org/docs/TauCeti/Algebra/Category/ModuleCat/FiniteProjective/KZero/Idempotent.html#TauCeti.IdempotentMonoid.kZeroEquiv). The boundary formula of 6.3 is written in it.
- [`RightBalancedExtension`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/TensorProduct/Balanced/RightExtension.html#TauCeti.RightBalancedExtension) — extension of scalars for right modules, with its [adjunction](https://taucetiproject.org/docs/TauCeti/Algebra/Category/ModuleCat/RightBalancedExtension.html#TauCeti.RightBalancedExtension.adjunction) and the pentagon and triangle identities. This is what `kZeroMap` will be built from.

### Roadmap coverage

Layer 7 is untouched; every other layer is partial.

- **Layer 0:** 0.2 (right-module extension), 0.4 (idempotents and V(R)), 0.5 (the non-free tangent-section module with [P] = 2[R]) and 0.6 (the complex frame) are done. In 0.7 the real Möbius module has M ⊕ M ≅ R² and is not stably free. Missing are `kZeroMap` with `extendScalarsιIso` and `extendScalarsCompIso`, products and the right-module corner Morita map, and the complex half of 0.7.
- **Layer 1:** done except filtered colimits, the finitary-automorphism comparison and the lower-right and injective corner embeddings.
- **Layer 2:** 2.1 is done apart from filtered colimits. The determinant splitting K₁(R) ≅ Rˣ × SK₁(R) and K₁ of Euclidean domains, ℤ and fields included, are in place. Missing are the automorphism presentation (2.2), Morita invariance, the Dieudonné determinant and `kOne_divisionRing`.
- **Layer 3:** the relative triple group K₀(T) has its difference map, functoriality and universal property. Base change along a surjection is full, and reduced K₁ and K₂ of unitizations exist. Missing are relative K₁(R,I), K₀(R,I), the boundary and five-term sequence, and reduced K₀.
- **Layer 4:** 4.1 is done. In 4.2, Bass's bound, monotonicity under quotients and local rings are proved; semilocal rings and Jacobson-radical invariance are not. 4.3–4.5 (covering dimension and Vaserstein's function-ring theorems) are untouched.
- **Layer 5:** 5.1 is done; 5.2 has K₂, its exact sequence, symbols and reduced K₂.
- **Layer 6:** 6.1's fibre-product layer is in place, and one of the four exactness statements of 6.4 is proved.
- **Layer 8:** 8.1's [stable component group](https://taucetiproject.org/docs/TauCeti/Topology/Algebra/Matrix/GeneralLinearGroup/StableComponent.html#TauCeti.StableComponentGroup) and the surjection from K₁ exist, and the comparison is trivial for ℂ. 8.2 (exponentials) is untouched.

## The frontier

- **`kZeroMap` and its functoriality** — the right-module extension is now available. What remains is to put it on finite projectives with `extendScalarsιIso` and `extendScalarsCompIso`. Patching, the K₀ half of Mayer–Vietoris and both Layer 7 calculations depend on it.
- **Milnor patching** — `PatchingTriples`, the patched module M(P₁, P₂, α) and `milnor_patching`. The boundary δ and the other three exactness statements of 6.4 follow it.
- **Matsumoto's theorem and K₂ of finite fields** — symbols exist, but bilinearity, {a, 1 − a} = 1 and the presentation of K₂(F) are not stated. The connecting map K₂(R/I) → K₁(R,I) also needs relative K₁(R,I) from 3.1.
- **K₁ of division rings** — K₁(F) = Fˣ for fields already follows from the Euclidean-domain isomorphism, but not under the roadmap's name. `kOne_divisionRing` still needs the Dieudonné determinant, which has not been started.
- **Semilocal stable range** — `hasStableRangeLE_one_of_isSemisimpleRing` and invariance modulo the Jacobson radical; only local rings are done.

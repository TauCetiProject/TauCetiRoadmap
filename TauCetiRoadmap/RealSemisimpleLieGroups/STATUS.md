<!--tauceti-status:v1 {"roadmap":"RealSemisimpleLieGroups","to_sha":"522d48f5cf3a7d1e2de29e18281399b335b25833","ts":"2026-11-25T15:07:27Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"conjugacy of Cartan involutions and Int(g0) (0.2); ideals, products and compactness criterion (0.3); the reductive Cartan-involution predicate","state":"partial"},{"id":"Layer 1","remaining":"the restricted RootPairing, positive systems and multiplicities (1.2); real rank (1.3); split real forms (1.4); link to LieGroups IwasawaData","state":"partial"},{"id":"Layer 2","state":"untouched"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"}],"readme_sha":"9f3b593737868623fa835a47e686759124a32ecbfd320164a8521983739c09c1","roadmap":"RealSemisimpleLieGroups","to_sha":"522d48f5cf3a7d1e2de29e18281399b335b25833"}-->
# Status: RealSemisimpleLieGroups

This file documents the status of the RealSemisimpleLieGroups roadmap up until `522d48f` (2026-11-25T15:07:27Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Only the Lie-algebra layers have started. Most of Layer 0 is done: the Cartan-involution predicate, the Cartan decomposition and the matrix realizations. Layer 1 has the restricted root space decomposition and the 𝔰𝔩₂ integrality behind the restricted root system. Conjugacy of Cartan involutions, real rank, and all of the group-level and geometric theory (Layers 2–5) have not begun.

### Named results

- **Knapp's matrix criterion** — a real Lie algebra of matrices that is closed under conjugate transpose has `X ↦ −X*` as a Cartan involution exactly when its centre is trivial ([`isCartanInvolution_restrictNegConjTranspose_iff`](https://taucetiproject.org/docs/TauCeti/Algebra/Lie/CartanInvolution/Matrix.html#LieSubalgebra.isCartanInvolution_restrictNegConjTranspose_iff)). It is instantiated for 𝔰𝔬(p, q), [𝔰𝔲(p, q)](https://taucetiproject.org/docs/TauCeti/Algebra/Lie/IndefiniteUnitary/Cartan.html#TauCeti.isCartanInvolution_restrictNegConjTranspose_specialIndefiniteUnitaryLieAlgebra), 𝔰𝔭(p, q), 𝔰𝔭(2n, ℝ), and 𝔰𝔩ₙ(ℂ), 𝔰𝔬ₙ(ℂ) and 𝔰𝔭₂ₙ(ℂ) viewed as real.
- **The restricted root space decomposition** — for a Cartan involution θ and any abelian 𝔞 ⊆ 𝔭, 𝔤₀ is the internal direct sum of the joint eigenspaces of ad 𝔞 ([`isInternal_restrictedRootSpace`](https://taucetiproject.org/docs/TauCeti/Algebra/Lie/CartanInvolution/RestrictedRoot/Decomposition.html#LieEquiv.IsCartanInvolution.isInternal_restrictedRootSpace)). It is proved through self-adjointness for B_θ, with no group involved.
- **Integrality of restricted roots** — the 𝔰𝔩₂ triple attached to a restricted root λ makes every ν(H'_λ) an integer ([`exists_int_apply_restrictedCoroot`](https://taucetiproject.org/docs/TauCeti/Algebra/Lie/CartanInvolution/RestrictedRoot/Sl2.html#LieEquiv.IsCartanInvolution.exists_int_apply_restrictedCoroot)). As a consequence, the only multiples of λ that can be roots are ±½λ, ±λ and ±2λ ([`mem_of_smul_mem_restrictedRoots`](https://taucetiproject.org/docs/TauCeti/Algebra/Lie/CartanInvolution/RestrictedRoot/Sl2.html#LieEquiv.IsCartanInvolution.mem_of_smul_mem_restrictedRoots)).
- **Cartan involutions force semisimplicity** — a Lie algebra with a Cartan involution is semisimple ([`isSemisimple`](https://taucetiproject.org/docs/TauCeti/Algebra/Lie/CartanInvolution/Basic.html#LieEquiv.IsCartanInvolution.isSemisimple)), and the involution is determined by its fixed algebra 𝔨 ([`eq_of_fixedSubalgebra_eq`](https://taucetiproject.org/docs/TauCeti/Algebra/Lie/CartanInvolution/Basic.html#LieEquiv.IsCartanInvolution.eq_of_fixedSubalgebra_eq)).
- **Compact real forms give Cartan involutions** — for a complex Lie algebra viewed as real, a compact real form 𝔲 gives the Cartan involution with 𝔨 = 𝔲 and 𝔭 = i𝔲 ([`isCartanInvolution_of_re_killingForm_fixedSubalgebra_neg`](https://taucetiproject.org/docs/TauCeti/Algebra/Lie/CartanInvolution/Complex.html#LieEquiv.isCartanInvolution_of_re_killingForm_fixedSubalgebra_neg)).

### Notable definitions and infrastructure

- [`LieEquiv.IsCartanInvolution`](https://taucetiproject.org/docs/TauCeti/Algebra/Lie/CartanInvolution/Basic.html#LieEquiv.IsCartanInvolution) is the predicate itself. Around it sit the twisted Killing form B_θ, for which ad 𝔨 is skew and ad 𝔭 is symmetric, and the splitting of 𝔨 into its centre and a semisimple derived algebra with negative definite Killing form.
- [`Submodule.restrictedRootSpace`](https://taucetiproject.org/docs/TauCeti/Algebra/Lie/CartanInvolution/RestrictedRoot/Basic.html#Submodule.restrictedRootSpace) and [`IsMaximalAbelianInP`](https://taucetiproject.org/docs/TauCeti/Algebra/Lie/CartanInvolution/RestrictedRoot/Basic.html#LieEquiv.IsMaximalAbelianInP) are the Lie-algebra carriers of restricted roots. Maximal abelian subspaces exist, satisfy 𝔤_0 = 𝔪 ⊕ 𝔞, and equal their own centralizer in 𝔭.
- The [restricted coroot](https://taucetiproject.org/docs/TauCeti/Algebra/Lie/CartanInvolution/RestrictedRoot/Sl2.html#LieEquiv.IsCartanInvolution.restrictedCoroot) H'_λ comes with its 𝔰𝔩₂ triple. It is the data a `RootPairing` on (𝔞*, 𝔞) needs.

### Roadmap coverage

Layer 0 is partial. §0.1 is done except for the reductive Cartan-involution predicate. §0.4 is essentially done, including the classical Killing forms and the 𝔰𝔩₂(ℝ) ≅ 𝔰𝔬(2, 1) check. From §0.2, only "θ is determined by 𝔨" has landed; the inner-automorphism conjugacy and `Int(𝔤₀)` are absent. From §0.3, only the compact-real-form case has landed. Layer 1 is partial. §1.1 is done in its direct, group-free form, but the identification with LieGroups Layer 9's `IwasawaData` fields is missing. §1.2 has the 𝔰𝔩₂ triples, integrality and the multiples rule, but no `RootPairing`, positive systems or multiplicity invariance. §1.3 (real rank) and §1.4 (split forms) are untouched. Layers 2, 3, 4 and 5 are untouched: none of the `Suggested.lean` targets in them exist in the library.

## The frontier

- **The restricted root pairing (§1.2)** — package Σ with the coroots H'_λ as a crystallographic `RootPairing` on (𝔞*, 𝔞), the target `exists_restrictedRootPairing`. The reflections s_λ permuting Σ are the missing ingredient.
- **Conjugacy of Cartan involutions (§0.2)** — `exists_conj_cartanInvolution` and `Int(𝔤₀)`. These need LieGroups Layers 2, 4 and 9 for the group form. The Lie-algebra part of the route (ω = θ′θ, its positive powers, and the inner derivation log ω²) could be built first.
- **Real rank (§1.3)** — `realRank`, `finrank_eq_realRank` and `realRank_eq_zero_iff`. This needs §0.2 and the conjugacy of maximal abelian subspaces under K_θ.
- **Ideals, products and compactness (§0.3)** — show that θ preserves each simple ideal, assemble involutions over ideals, and prove that 𝔤₀ is compact iff 1 is a Cartan involution. These depend only on §0.1.
- **Cartan's fixed-point theorem (§5.4)** — `exists_forall_smul_eq_of_sectionalCurvature_nonpos` on Hadamard manifolds. This is independent of the Lie theory and can start now. Its route runs through the Jacobi comparison with κ = 0 and Hopf–Rinow.

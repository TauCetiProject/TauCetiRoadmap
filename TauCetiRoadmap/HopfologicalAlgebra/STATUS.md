<!--tauceti-status:v1 {"roadmap":"HopfologicalAlgebra","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"existence of a nonzero cointegral, the modular character and Nakayama formula, the symmetric criterion","state":"partial"},{"id":"Layer 2","state":"untouched"},{"id":"Layer 3","remaining":"the smash product and its universal property, right comodule algebras, the finite dual comparison","state":"partial"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","remaining":"the exterior superalgebra and H4 repairs, truncated primitives and slash homology, Taft and Nichols examples","state":"partial"},{"id":"Layer 8","state":"untouched"}],"readme_sha":"c1d1d138c17bbc8f0ca62f84a6630bd83800c73e9dbe735c09cd0ea51550a6b5","roadmap":"HopfologicalAlgebra","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: HopfologicalAlgebra

This file documents the status of the HopfologicalAlgebra roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer 1 is still partial, and everything in it waits on one theorem: that a finite-dimensional Hopf algebra has a nonzero cointegral. Given such a cointegral, the Frobenius theorem, bijectivity of the antipode, one-dimensionality of the integrals and the Frobenius property of all modules are proved. Layers 3 and 7 have their first pieces. Layers 2, 4, 5, 6 and 8 have not begun.

### Named results

- **Projective equals injective over a Frobenius algebra** — over a finite-dimensional algebra with a Frobenius functional, any module, finitely generated or not, is projective exactly when it is injective. As a result, the [category of all modules is a Frobenius category](https://taucetiproject.org/docs/TauCeti/Algebra/Category/ModuleCat/Frobenius.html#ModuleCat.abelian_isFrobenius). This is Khovanov's Proposition 1 in the generality Layer 2 needs ([`moduleProjective_iff_moduleInjective`](https://taucetiproject.org/docs/TauCeti/Algebra/Module/Injective/Frobenius.html#LinearMap.IsFrobeniusFunctional.moduleProjective_iff_moduleInjective)).
- **Invariant functionals are Frobenius** — on a finite-dimensional Hopf algebra over a field, a nonzero right cointegral is a Frobenius functional (`LinearMap.IsRightInvariantIntegral.isFrobeniusFunctional`). This is the conditional form of the roadmap's `isFrobeniusFunctional_of_isRightCointegral`. The same hypothesis makes the antipode bijective (`LinearMap.IsRightInvariantIntegral.antipode_bijective`).
- **Integrals form a line** — whenever a Frobenius functional exists, the left and right integral spaces are each one-dimensional (`LinearMap.IsFrobeniusFunctional.finrank_leftIntegral`).
- **The antipode exchanges the two integral lines** — the antipode sends left integrals to right integrals with no hypothesis. When it is bijective it [identifies the two submodules](https://taucetiproject.org/docs/TauCeti/Algebra/HopfAlgebra/Integral/Basic.html#TauCeti.integralAntipodeEquiv).
- **No square-zero primitives outside characteristic two** — in a bialgebra over a field with `2 ≠ 0`, a [primitive element with `d² = 0` vanishes](https://taucetiproject.org/docs/TauCeti/Algebra/Bialgebra/Primitive.html#Bialgebra.IsPrimitiveElem.eq_zero_of_sq_eq_zero). This is the obstruction that motivates Layer 7's super and bosonized models.

### Notable definitions and infrastructure

- **Integral submodules** — the [left](https://taucetiproject.org/docs/TauCeti/Algebra/HopfAlgebra/Integral/Basic.html#TauCeti.leftIntegral) and [right](https://taucetiproject.org/docs/TauCeti/Algebra/HopfAlgebra/Integral/Basic.html#TauCeti.rightIntegral) integrals of a bialgebra, with no counit normalization. This admits the characteristic-two integral `1 + g` of `k[C₂]`, and the group algebra is worked out as the first example.
- **Left module algebras** — [module algebras over a bialgebra](https://taucetiproject.org/docs/TauCeti/Algebra/Bialgebra/ModuleAlgebra/Basic.html#TauCeti.LeftModuleAlgebra), with equivariant maps, restriction along bialgebra maps and the [invariant subalgebra](https://taucetiproject.org/docs/TauCeti/Algebra/Bialgebra/ModuleAlgebra/Basic.html#TauCeti.LeftModuleAlgebra.invariants). These are the objects on which the smash product and `C(A,H)` will be built.
- **Induced equals coinduced** — a Frobenius functional gives an [isomorphism `A ⊗ V ≅ Hom(A, V)`](https://taucetiproject.org/docs/TauCeti/Algebra/Module/Injective/Frobenius.html#LinearMap.IsFrobeniusFunctional.tensorEquivLinearMap) of `A`-modules. This makes induced modules injective, and it is the engine of the projective-equals-injective theorem.

### Roadmap coverage

Layer 1 is partial. §1.1 is done except the unconditional one-dimensionality of the integrals. §1.2's Frobenius theorem, antipode bijectivity and `hMod_abelian_isFrobenius` are proved only for a Hopf algebra given a nonzero cointegral. The modular character and Nakayama formula of §1.3 are absent, and so is the symmetric criterion of §1.4. Layer 3 is partial: §3.1's module algebras, equivariant maps, restriction and invariants are in place, but the smash product and its universal property are not. The right comodule algebras of §3.2 and the duality of §3.3 are also missing. Layer 7 is partial: only §7.1's characteristic-zero obstruction is proved. Layers 2, 4, 5, 6 and 8 are untouched.

## The frontier

- **Existence of a nonzero cointegral** — prove that every finite-dimensional Hopf algebra over a field has a nonzero right cointegral. Combined with the existing results, this would make `finrank_leftIntegral`, the Frobenius theorem, `antipode_bijective` and `hMod_abelian_isFrobenius` unconditional.
- **The smash product `A # H`** — construct `SmashProduct` with `smashProduct_nonempty` and the universal property `SmashProduct.lift_unique`, on top of the new module-algebra API.
- **Modular character and Nakayama automorphism** — define `α` from a nonzero left integral and prove `nakayamaAut_symm_eq_winding`. This needs a nonzero integral, so it waits on the first item.
- **Layer 2, the monoidal category of all `H`-modules** — extend `FiniteHopfModuleCat` to all modules and show that projectives form a tensor ideal. The Frobenius exact structure it needs is now available, conditionally on the first item.
- **Layer 7's two sign repairs** — construct the exterior Hopf superalgebra `E(d)` and Sweedler's `H₄`, now that the obstruction they get around is proved.

<!--tauceti-status:v1 {"roadmap":"DerivedModuleAlgebra","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"the maps induced on Koszul complexes are maps of differential graded algebras","state":"partial"},{"id":"Layer 1","remaining":"exactness and monoidal structure of the derived tensor, resolution property of §0.1, §S.1 E₂ and edge maps, §0.2.2, §0.3","state":"partial"},{"id":"Layer 2","remaining":"the full cotangent complex (§0.4) and everything built on it, §§0.6–0.25","state":"partial"},{"id":"Layer 3","remaining":"tensor–Hom adjunction, derived limit compatibility with tower maps, closure of completeness under Rlim, §§1.3–1.9","state":"partial"},{"id":"Layer 4","remaining":"retracts, pseudo-coherence, Tor amplitude, perfect base change, compatible finite-free models, effectivity","state":"partial"},{"id":"Layer 5","remaining":"Artinian biduality, the completion adjunction, and the complex and equivariant forms of §1.M.1","state":"partial"}],"readme_sha":"b084d8076bffbe4204890035c76805138a463af3b0289cb6c80a386d035f87f4","roadmap":"DerivedModuleAlgebra","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: DerivedModuleAlgebra

This file documents the status of the DerivedModuleAlgebra roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The divided-power layer is finished, and so is the Koszul complex apart from one clause. The derived tensor product, derived base change, derived Hom and triangulated derived limits are now in place. Derived completeness, perfect complexes and Matlis duality are each partly built, and the cotangent complex, the completion reflector and effectivity have not begun.

### Named results

**Existence of the derived tensor product**: over any commutative ring, the totalised tensor product of possibly unbounded complexes [has a left derived bifunctor on `D(R)`](https://taucetiproject.org/docs/TauCeti/Algebra/Homology/ModuleCat/KFlat/DerivedTensor.html#TauCeti.hasLeftDerivedFunctor₂_tensor), computed on K-flat models.

**The derived extension–restriction adjunction**: every left derived functor of termwise scalar extension along `R → S` [is left adjoint to derived restriction](https://taucetiproject.org/docs/TauCeti/Algebra/Homology/ModuleCat/KFlat/BaseChange.html#TauCeti.nonempty_derivedExtendRestrictScalarsAdj) (Stacks 0GMT).

**Roby representability**: composition with the universal law [identifies linear maps `Γ^d_R(M) → N` with homogeneous degree-`d` polynomial laws `M → N`](https://taucetiproject.org/docs/TauCeti/RingTheory/DividedPowerAlgebra/Representability.html#DividedPowerAlgebra.homogeneousLawEquiv), with no flatness of `M`.

**Derived completeness is detected on cohomology**: an object of `D(A)` is derived `I`-complete [exactly when each of its cohomology modules is](https://taucetiproject.org/docs/TauCeti/RingTheory/AdicCompletion/DerivedComplete.html#TauCeti.derivedComplete_iff_isDerivedComplete_homology) (Stacks 091T).

**Matlis biduality for finitely generated modules**: over a complete Noetherian local ring with any residue field, [evaluation into the double dual is bijective](https://taucetiproject.org/docs/TauCeti/RingTheory/MatlisDuality/Finite.html#TauCeti.IsInjectiveEnvelope.bijective_applyₗ_of_finite).

### Notable definitions and infrastructure

- The [K-flat left derivability structure](https://taucetiproject.org/docs/TauCeti/Algebra/Homology/Monoidal/KFlat/DerivabilityStructure.html#CochainComplex.KFlat.isLeftDerivabilityStructure_localizerMorphism): any functor on complexes that inverts quasi-isomorphisms between K-flat complexes can be left-derived through it. This is how the tensor product and base change were derived, and it is the route to the tensor–Hom adjunction.
- The [derived limit of towers](https://taucetiproject.org/docs/TauCeti/Algebra/Category/ModuleCat/Tower/DerivedLimit.html#TauCeti.ModuleTower.derivedLimit) is now a [triangulated functor](https://taucetiproject.org/docs/TauCeti/Algebra/Category/ModuleCat/Tower/DerivedLimit.html#TauCeti.ModuleTower.instIsTriangulatedDerivedCategoryModuleCatDerivedLimit) that keeps the global connecting morphisms. Derived completion and effectivity will be built on it.
- [Perfect complexes](https://taucetiproject.org/docs/TauCeti/Algebra/Homology/ModuleCat/Perfect.html#TauCeti.DerivedDeRham.IsPerfect), defined by bounded finite-projective models, form a triangulated subcategory of `D(A)`. This is the predicate Layer 4 works with.

### Roadmap coverage

**Layer 0** is done except one clause of §0.K.1: the maps induced on Koszul complexes are not yet shown to respect the wedge product. **Layer 1** is partial. Lazard's theorem (§0.2.1) is done. §0.2 has its headline existence results, the adjunction, Stacks Lemma 15.60.12 and the bounded-above flat model. It lacks exactness in each variable, the symmetric monoidal structure and K-flatness of totalised bicomplexes. §0.I.1 lacks compatibility with the bounded-below construction. §0.1 has the augmented standard resolution with its extra degeneracy, but not the resolution property or the `Lπ_!F` comparison. §S.1 lacks its `E₂` term and edge maps, and §0.2.2 and §0.3 are untouched. **Layer 2** is partial: only §0.5, square-zero extensions with `Exal` a group under Baer sum, is present. **Layer 3** is partial. Exactness of the derived limit is done, but its compatibility with the tower maps is not. §1.2 is done except closure under derived limits. The tensor–Hom adjunction (§1.1.1) and §§1.3–1.9 are open. **Layer 4** is partial. Perfect complexes exist and are closed under shifts and triangles. Retracts, pseudo-coherence, Tor amplitude, base change, compatible models and effectivity (§1.E.1) are open. **Layer 5** is partial. Finite-length and finitely generated biduality are proved, and the endomorphism ring of the hull is identified with the completion. Artinian biduality, the completion adjunction, and the complex and equivariant forms are open.

## The frontier

- **Multiplicativity of Koszul functoriality** (§0.K.1). Show that the chain maps induced by `g` with `φ′ ∘ g = φ` are maps of differential graded algebras. This closes Layer 0.
- **The tensor–Hom adjunction** (§1.1.1). Build `Hom•(K, Hom•(L, I)) ≅ Hom•(Tot(K ⊗ L), I)` on Hom complexes and descend it, with `L` K-flat and `I` K-injective. The derived tensor it needed is now in place.
- **Perfect complexes and base change** (§1.E.0). Prove that derived extension of scalars preserves perfect complexes, add closure under retracts, pseudo-coherence and Tor amplitude, then construct the compatible finite-free models that effectivity needs.
- **Artinian Matlis biduality and the completion adjunction** (§1.M.2). Show that the dual of an Artinian module is finite over `R̂` and that evaluation is bijective on it, then build `Hom_{R̂}(N̂, E) ≅ Hom_R(N, E)`.
- **The cotangent complex** (§0.4). First derive the resolution property of the standard polynomial resolution from its extra degeneracy and compare resolutions through `Lπ_!F` (§0.1). The non-additive derived functors of §0.3 are also prerequisites.

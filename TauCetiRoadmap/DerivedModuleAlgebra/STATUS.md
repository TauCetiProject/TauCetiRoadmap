<!--tauceti-status:v1 {"roadmap":"DerivedModuleAlgebra","to_sha":"d9fbe7bd6aedb5ed0ffb867836c3ed71aa7d28e5","ts":"2026-11-11T09:30:56+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"Koszul induced maps as DGA maps, and the mapping-cone identification of K(φ ⊕ (y·))","state":"partial"},{"id":"Layer 1","remaining":"the derived tensor bifunctor and base-change adjunction, resolution comparison of §0.1, §S.1 E₂ and edge maps, §0.2.2, §0.3","state":"partial"},{"id":"Layer 2","remaining":"the full cotangent complex (§0.4) and everything built on it, §§0.6–0.25","state":"partial"},{"id":"Layer 3","remaining":"exactness of the derived limit, tensor–Hom adjunction, cohomology criterion for completeness, §§1.3–1.9","state":"partial"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","remaining":"Artinian biduality, the completion adjunction, and the complex and equivariant forms of §1.M.1","state":"partial"}],"readme_sha":"a686324825f3c07aca07c11a671e2705233b13e2c98e69fadee8be73601bf0c9","roadmap":"DerivedModuleAlgebra","to_sha":"d9fbe7bd6aedb5ed0ffb867836c3ed71aa7d28e5"}-->
# Status: DerivedModuleAlgebra

This file documents the status of the DerivedModuleAlgebra roadmap up until `d9fbe7b` (2026-11-11T09:30:56+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The polynomial-law and divided-power layer is finished, and the Koszul complex is finished except for two clauses. Matlis duality has finite-length and finitely generated biduality. Square-zero extensions, K-injective replacements, derived Hom and derived limits are in place, but the cotangent complex, the derived tensor bifunctor, completion and effectivity have not begun.

### Named results

**Roby representability** — composition with the universal law [identifies linear maps `Γ^d_R(M) → N` with homogeneous degree-`d` polynomial laws `M → N`](https://taucetiproject.org/docs/TauCeti/RingTheory/DividedPowerAlgebra/Representability.html#DividedPowerAlgebra.homogeneousLawEquiv), with no flatness or projectivity of `M`.

**Roby algebras classify multiplicative laws** — for an algebra `A`, `Γ^d_R(A)` with its internal product has [algebra maps out of it in bijection with multiplicative degree-`d` laws](https://taucetiproject.org/docs/TauCeti/RingTheory/DividedPowerAlgebra/RobyAlgebra.html#DividedPowerAlgebra.RobyAlgebra.algHomEquiv) from `A`.

**Divided powers of a free module are symmetric tensors** — for free `M`, `γ_d(m) ↦ m^{⊗d}` gives [an isomorphism `Γ^d_R(M) ≅ (M^{⊗d})^{S_d}`](https://taucetiproject.org/docs/TauCeti/RingTheory/DividedPowerAlgebra/SymmetricTensor.html#DividedPowerAlgebra.symmetricTensorEquiv) over any commutative ring.

**Koszul acyclicity for regular sequences** — the Koszul complex of a weakly regular sequence [has no homology in positive degrees](https://taucetiproject.org/docs/TauCeti/RingTheory/KoszulComplex/Regular.html#TauCeti.koszulComplex.exactAt_of_isWeaklyRegular), so it is a finite free resolution of `R/(x)`.

**Matlis biduality for finitely generated modules** — over a complete Noetherian local ring with any residue field, [evaluation into the double dual is bijective](https://taucetiproject.org/docs/TauCeti/RingTheory/MatlisDuality/Finite.html#TauCeti.IsInjectiveEnvelope.bijective_applyₗ_of_finite) for every finitely generated module.

### Notable definitions and infrastructure

- The [K-injective replacement functor](https://taucetiproject.org/docs/TauCeti/Algebra/Homology/DerivedCategory/KInjective.html#TauCeti.kInjectiveReplacement) from the derived category to the homotopy category works for arbitrary unbounded complexes of modules. It underlies the [derived Hom complex](https://taucetiproject.org/docs/TauCeti/Algebra/Homology/DerivedCategory/DerivedHom.html#TauCeti.derivedHom), whose cohomology is identified with shifted morphisms in `D(R)`.
- [`Exal_A(B, M)`](https://taucetiproject.org/docs/TauCeti/RingTheory/Extension/SquareZero/Basic.html#TauCeti.Exal), the classes of square-zero extensions, is an abelian group under Baer sum and functorial by pushout and pullback. The lifting obstruction [vanishes exactly when a lift exists](https://taucetiproject.org/docs/TauCeti/RingTheory/Extension/SquareZero/Pullback.html#TauCeti.SquareZeroExtension.morphismObstruction_eq_zero_iff). This is the deformation-theoretic side that the cotangent complex will be compared against.
- The [derived limit of towers](https://taucetiproject.org/docs/TauCeti/Algebra/Category/ModuleCat/Tower/DerivedLimit.html#TauCeti.ModuleTower.derivedLimit) is computed by the homotopy limit `Cone(δ)[−1]`, commutes with shifts, and [agrees with the termwise limit](https://taucetiproject.org/docs/TauCeti/Algebra/Category/ModuleCat/Tower/DerivedLimit.html#TauCeti.ModuleTower.derivedLimitIsoLimComplex) when `lim¹` vanishes. Derived completion will be built on it.

### Roadmap coverage

**Layer 0** is partial. §§0.DP.1–0.DP.3 are done, including the tensor map, the Roby algebra and the comparison with symmetric tensors. §0.K.1 is done except that induced maps are not yet proved to respect the wedge product, and the mapping-cone identification of `K(φ ⊕ (y·))` is missing.

**Layer 1** is partial. Lazard's theorem (§0.2.1) is done. K-injective replacements (§0.I.1) are in place, but their compatibility with the bounded-below injective construction is not. §0.2 has its K-flat models, shift compatibility and the `ℤ/4` counterexample, but not the derived bifunctor or the base-change adjunction. §0.1 has the standard polynomial resolution as a simplicial algebra, but not the resolution property or the comparison with `Lπ_!F`. §S.1 is missing its `E₂` identification and edge maps. The comparisons of §0.2.2 and all of §0.3 are untouched.

**Layer 2** is partial. Only §0.5 is substantially present; §0.4 and everything built on the cotangent complex are untouched.

**Layer 3** is partial. Derived completeness has a definition, invariance under radicals, and a criterion for a single module. Exactness of the derived limit (§1.1), the tensor–Hom adjunction (§1.1.1), the cohomology criterion of §1.2 and §§1.3–1.9 are not established here.

**Layer 4** is untouched.

**Layer 5** is partial. Finite-length and finitely generated biduality are proved. So are the Artinian criterion, scalar endomorphisms of the hull and the `R̂`-action on torsion modules.

## The frontier

- **Finishing the Koszul complex** (§0.K.1). Prove that the maps induced by `g` are maps of differential graded algebras, and identify `K(φ ⊕ (y·))` with the cone of multiplication by `y`. This closes Layer 0.
- **Artinian Matlis biduality and the completion adjunction** (§1.M.2). Show that the dual of an Artinian module is finite and that evaluation is bijective on it, then build `Hom_{R̂}(N̂, E) ≅ Hom_R(N, E)`. The scalar-endomorphism theorem and the Artinian criterion are already in place.
- **The derived tensor bifunctor** (§0.2). Show that the K-flat model is a left derived bifunctor, and prove the extension–restriction adjunction. This needs Stacks Lemma 15.60.12, the part not yet formalised. The tensor–Hom adjunction of §1.1.1 waits on it.
- **Exactness of the derived limit** (§1.1). Prove that `Rlim` is triangulated through the cone comparison for chain maps of towers. The cohomology criterion for derived completeness (§1.2) and the completion reflector come next.
- **The cotangent complex** (§0.4). This needs the resolution property of the standard polynomial resolution (§0.1) and the non-additive derived functors of §0.3. The square-zero side it will be compared with (§0.5) is ready.

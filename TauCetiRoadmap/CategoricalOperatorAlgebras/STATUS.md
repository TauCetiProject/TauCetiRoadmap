<!--tauceti-status:v1 {"roadmap":"CategoricalOperatorAlgebras","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
# Status: CategoricalOperatorAlgebras

This file documents the status of the CategoricalOperatorAlgebras roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The C*-category interface at the base of CA1a is in place, with Hilbert spaces as its first example. The rest of CA1a is open: linking algebras, finite completions, Hilbert C*-module examples and W*-categories. Nothing has landed yet for CA1b or for CA2–CA10.

### Named results

- **Endomorphism algebras are C*-algebras.** In any C*-category, [End X is a unital C*-algebra](https://taucetiproject.org/docs/TauCeti/Analysis/CStarAlgebra/Category/Basic.html#CategoryTheory.End.instCStarAlgebra). Its star is the dagger, its multiplication is in operator order, and its positive cone is [exactly the composites f†f](https://taucetiproject.org/docs/TauCeti/Analysis/CStarAlgebra/Category/Basic.html#CategoryTheory.End.nonneg_iff).
- **Automatic contractivity of dagger functors.** A complex linear dagger functor between C*-categories [does not increase norms](https://taucetiproject.org/docs/TauCeti/Analysis/CStarAlgebra/Category/Functor.html#CategoryTheory.Functor.norm_map_le) and is [isometric when faithful](https://taucetiproject.org/docs/TauCeti/Analysis/CStarAlgebra/Category/Functor.html#CategoryTheory.Functor.norm_map).
- **Hilbert spaces form a C*-category.** With operator norms and adjoints, [complex Hilbert spaces satisfy the C*-category axioms](https://taucetiproject.org/docs/TauCeti/Analysis/InnerProductSpace/Category.html#TauCeti.HilbertCat.instCStarCategoryComplex). Positivity of f†f comes from the operator square root, and [unitary arrows are exactly the linear isometric equivalences](https://taucetiproject.org/docs/TauCeti/Analysis/InnerProductSpace/Category.html#TauCeti.HilbertCat.unitaryEquivLinearIsometryEquiv).

### Notable definitions and infrastructure

- **[C*-categories](https://taucetiproject.org/docs/TauCeti/Analysis/CStarAlgebra/Category/Basic.html#TauCeti.CStarCategory).** These sit on Mathlib's native `Preadditive` and `Linear ℂ` carriers and take the Hom norms as parameters, as Mathlib's `CStarModule` does. Concrete categories can therefore keep their own normed structures. Each later layer that speaks of C*-categories builds on this class.
- **[Dagger categories](https://taucetiproject.org/docs/TauCeti/CategoryTheory/Dagger/Basic.html#TauCeti.DaggerCategory)** with additive and conjugate-linear compatibility, [unitary arrows](https://taucetiproject.org/docs/TauCeti/CategoryTheory/Dagger/Basic.html#TauCeti.IsUnitary), and dagger-preserving functors. This is the algebraic vocabulary for unitary natural transformations: a natural transformation with unitary components [becomes a natural isomorphism with the pointwise dagger as inverse](https://taucetiproject.org/docs/TauCeti/CategoryTheory/Dagger/Functor.html#CategoryTheory.NatTrans.unitaryIso).
- **[A category of Hilbert spaces](https://taucetiproject.org/docs/TauCeti/Analysis/InnerProductSpace/Category.html#TauCeti.HilbertCat)** with continuous linear maps, whose dagger is the adjoint. Several of the roadmap's CA1a checks are computed in this category.

### Roadmap coverage

CA1a is partial. Done: the dagger and C*-category axioms, the C*-algebra structure on End X, identities of nonzero objects having norm one, contractivity and isometry of dagger functors, and the Hilbert-space example. That example covers all complex Hilbert spaces, so it includes the finite-dimensional ones the roadmap asks for. Not done: Cauchy–Schwarz and polarization for Hom spaces, closed kernels, finite linking algebras, orthogonal sums and the unitary Karoubi completion with its universal property, the C*-category of Hilbert C*-modules with its compact-operator ideal, W*-categories and their preduals, and W*-Cauchy completion. CA1b (analytic bicategories and correspondences) and CA2–CA10 are untouched.

## The frontier

- **Hilbert C*-modules as a C*-category.** This needs right Hilbert B-modules with adjointable maps, the zero module, direct sums as orthogonal sums, and K_B(E,F) as a closed ideal. It depends on HilbertModules H1–H2.
- **Finite linking algebras.** This needs linking algebras for lists of objects with matrix positivity, and the Hom norm and positivity recovered from two-object corners. The CA1a W* criterion is stated in terms of these.
- **Finite unitary Cauchy completion.** This needs orthogonal sums and unitary splittings of self-adjoint idempotents. Then it needs the comparison with Mathlib's biproducts and `Karoubi`, where an idempotent is first conjugated to a self-adjoint projection. Last comes the universal property for linear dagger functors.
- **W*-categories.** This needs dual Hom spaces with weak-* continuous composition and dagger, the finite-linking-algebra criterion, preduals and normal functors. It depends on VonNeumannAlgebras V4 and on linking algebras.
- **Analytic bicategories (CA1b).** This needs C*- and W*-structure on native bicategories and the correspondence bicategories. It depends on HilbertModules H3's interior tensor product and on Subfactors Layer 1.

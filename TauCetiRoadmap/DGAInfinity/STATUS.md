<!--tauceti-status:v1 {"roadmap":"DGAInfinity","to_sha":"163ce800f7f3b5089428c699474f28f877d6759b","ts":"2026-09-29T08:26:13+00:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"dependent operations on graded-quiver paths; dual compatibility; b² = 0 equivalence with Stasheff identities","state":"partial"},{"id":"Layer 1","remaining":"DG categories and bimodules; extension and derived tensor of modules; one-object comparison","state":"partial"},{"id":"Layer 2","state":"untouched"},{"id":"Layer 3","remaining":"complete filtered perturbation, tree transfer, Kadeishvili minimal models and derived module equivalence","state":"partial"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","state":"untouched"},{"id":"Layer 9","state":"untouched"},{"id":"Layer 10","state":"untouched"},{"id":"Layer 11","state":"untouched"}],"readme_sha":"5084846eb030e70e08d60ce4421e4dc2db67285aee06d338c28807a3f66941ad","roadmap":"DGAInfinity","to_sha":"163ce800f7f3b5089428c699474f28f877d6759b"}-->
# Status: DGAInfinity

This file documents the status of the DGAInfinity roadmap up until `163ce80` (2026-09-29T08:26:13+00:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The signed graded foundations are extensive but Layer 0 remains partial. Layer 1 now has DG algebras and right-module theory, and Layer 3 has contractions and an invertibility-based perturbation lemma; the `A∞` hierarchy and Layers 4–11 have not begun.

### Named results

- **The basic perturbation lemma** — a special contraction survives a perturbation `δ` when `1 + δh` is invertible, with explicit new differential, inclusion, projection and homotopy ([`TauCeti.LinearSpecialContraction.perturb`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Homology/Contraction/Perturbation.html#TauCeti.LinearSpecialContraction.perturb)).
- **The DG Yoneda lemma** — evaluation at the unit identifies the Hom complex from the free rank-one DG right module with the underlying complex of any right module ([`TauCeti.dgYonedaIso`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Homology/DG/Module/Right/Yoneda.html#TauCeti.dgYonedaIso)).
- **The linear Hom complex enrichment** — cochain complexes in an `R`-linear preadditive category are enriched over cochain complexes of `R`-modules, using the Koszul braiding for composition ([`TauCeti.linearHomComplexEnrichedCategory`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Homology/LinearHomComplex/Enrichment.html#TauCeti.linearHomComplexEnrichedCategory)).
- **The graded coderivation–Taylor correspondence** — signed coderivations on reduced tensor words correspond to their Taylor components ([`TauCeti.ReducedTensorWords.gradedCoderivEquivTaylor`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/TensorCoalgebra/GradedCoderivation.html#TauCeti.ReducedTensorWords.gradedCoderivEquivTaylor)).
- **The suspended–unsuspended Stasheff comparison** — the two arity sums vanish together, with the prescribed unsuspended sign ([`TauCeti.AInfinity.suspendedStasheffSum_eq_zero_iff`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Homology/AInfinity/Stasheff.html#TauCeti.AInfinity.suspendedStasheffSum_eq_zero_iff)).

### Notable definitions and infrastructure

- **DG algebras** — the [unital](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Homology/DG/Algebra/Defs.html#TauCeti.IsDGAlgebra) and [nonunital](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Homology/DG/Algebra/Defs.html#TauCeti.IsNonUnitalDGAlgebra) structures support morphisms, augmentations, signed opposites and tensor products, and graded cohomology.
- **DG right-module Hom complexes** — [homogeneous module maps](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Homology/DG/Module/Right/HomComplex.html#TauCeti.dgRightModuleHomComplex) form the complexes used by DG Yoneda and the right-module enrichment.
- **Length-completed tensor words** — [coaugmented](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/TensorCoalgebra/Completed.html#TauCeti.CompletedTensorWords) and [reduced](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/TensorCoalgebra/ReducedCompleted.html#TauCeti.CompletedReducedTensorWords) products have separated, complete length filtrations and coordinatewise deconcatenation, preparing the completed bar setting.

### Roadmap coverage

Layer 0 is partial: the braiding, linear Hom enrichment, signed Taylor calculus and length completions are in place, as is a dual grading under finite degree support; dependent operations on composable quiver paths and the equivalence between `b² = 0` and all Stasheff identities remain. Layer 1 is partial: DG algebras, their cohomology and signed constructions, left and right DG modules, right-module Hom complexes, restriction of scalars and the one-object Yoneda lemma exist; DG categories, bimodules, extension and derived tensor do not. Layer 3 is partial: contractions normalize and perturb under an invertibility assumption, but complete filtered perturbation, tree transfer, minimal models and derived equivalence remain. Layer 2 is untouched beyond the supporting graded linear quiver; Layers 4–11 are untouched.

## The frontier

- **`A∞` algebras** — define the square-zero suspended coderivation and prove its arity components equivalent to the Stasheff identities; the signed Taylor correspondence and suspension formulas are available.
- **DG categories and bimodules** — build the many-object enrichment and its `Z⁰` and `H⁰` categories, then module and bimodule comparisons; the cochain Hom enrichment and one-object DG algebra theory are available.
- **Homological transfer** — prove the complete filtered perturbation regime and finite tree formulas, then Kadeishvili's minimal-model theorem; the current perturbation result assumes invertibility of `1 + δh`.
- **Dependent graded-quiver operations** — extend homogeneous multilinear maps to composable paths and complete the finite-projective dual and tensor compatibility needed for `A∞` categories.

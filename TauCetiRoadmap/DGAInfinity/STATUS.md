<!--tauceti-status:v1 {"roadmap":"DGAInfinity","to_sha":"b1ab119fa96ae6d2d8f43e2aa8159a148ba67f57","ts":"2026-09-27T20:34:44+00:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"dependent graded-quiver maps, general braces, and dual comparisons beyond finite support","state":"partial"},{"id":"Layer 1","remaining":"general DG bimodules, tensor and internal Hom, and many-object Yoneda","state":"partial"},{"id":"Layer 2","remaining":"A∞ categories, functors, modules, bimodules, and unital strictification","state":"partial"},{"id":"Layer 3","remaining":"tree transfer, Kadeishvili's theorem, filtered perturbation, and derived comparison","state":"partial"},{"id":"Layer 4","remaining":"augmented reduced bar, cobar adjunction, DG envelope, and controlled twisting","state":"partial"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","remaining":"derived and perfect-category invariance, Morita bimodules, and compact generators","state":"partial"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","state":"untouched"},{"id":"Layer 9","state":"untouched"},{"id":"Layer 10","state":"untouched"},{"id":"Layer 11","state":"untouched"}],"readme_sha":"5084846eb030e70e08d60ce4421e4dc2db67285aee06d338c28807a3f66941ad","roadmap":"DGAInfinity","to_sha":"b1ab119fa96ae6d2d8f43e2aa8159a148ba67f57"}-->
# Status: DGAInfinity

This file documents the status of the DGAInfinity roadmap up until `b1ab119` (2026-09-27T20:34:44+00:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The signed coalgebra groundwork is substantial but incomplete. DG algebras, DG categories, right modules, and nonunital A∞ algebras and morphisms now exist; transfer, derived modules, Morita theory, and the later geometric and Koszul layers have no general theorem yet.

### Named results

- **The bar-coderivation/Stasheff equivalence** — an A∞ bar differential is square-zero exactly when all unsuspended Stasheff identities hold on homogeneous inputs ([`TauCeti.AInfinityAlgebra.barDifferential_sq_iff_stasheff`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Homology/AInfinity/Algebra.html#TauCeti.AInfinityAlgebra.barDifferential_sq_iff_stasheff)).
- **The differential graded Yoneda lemma** — the Hom complex from the free rank-one right DG module to a module is that module's underlying cochain complex ([`TauCeti.dgYonedaIso`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Homology/DG/Module/Right/Yoneda.html#TauCeti.dgYonedaIso)).
- **The two presentations of a DG category** — explicit Hom-complex data and enrichment in cochain complexes are equivalent ([`TauCeti.DGCategoryData.equivDGCategory`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/CategoryTheory/DG/HomComplexData.html#TauCeti.DGCategoryData.equivDGCategory)).
- **Minimal quasi-isomorphisms are isomorphisms** — between minimal A∞ algebras, a morphism is a quasi-isomorphism precisely when it is an isomorphism ([`TauCeti.AInfinityHom.isQuasiIso_iff_isIso`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Homology/AInfinity/Algebra/Minimal.html#TauCeti.AInfinityHom.isQuasiIso_iff_isIso)).
- **DG quasi-equivalences descend to homotopy equivalences** — a quasi-equivalence of DG categories induces an equivalence of their H⁰ categories ([`CategoryTheory.EnrichedFunctor.IsQuasiEquivalence.isEquivalence_mapDGHomotopyCategory`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/CategoryTheory/DG/QuasiEquivalence.html#CategoryTheory.EnrichedFunctor.IsQuasiEquivalence.isEquivalence_mapDGHomotopyCategory)).

### Notable definitions and infrastructure

- **A∞ algebra and morphism** — [the algebra](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Homology/AInfinity/Algebra.html#TauCeti.AInfinityAlgebra) stores a suspended Taylor map, while [a morphism](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Homology/AInfinity/Algebra/Hom/Basic.html#TauCeti.AInfinityHom) is a bar-coalgebra map intertwining differentials; these support operations, strict units, augmentations, and cohomology.
- **Completed tensor words** — [products by tensor length](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/TensorCoalgebra/Completed.html#TauCeti.CompletedTensorWords) have a separated, complete length filtration and coordinatewise deconcatenation, supplying a carrier for later filtered constructions.
- **The Koszul braiding** — [symmetric braiding on cochain complexes](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Homology/Monoidal/Braiding.html#TauCeti.koszulBraidedCategory) underlies DG enrichment and its composition signs.

### Roadmap coverage

Layer 0 remains partial: completion and a finite-support graded dual have landed, but dependent graded-quiver maps and the full dual and brace interfaces are not established. Layer 1 is partial, with DG algebra and category structures, right-module Hom complexes and the algebraic Yoneda case, but no general bimodule and derived tensor theory. Layer 2 is partial at the algebra and morphism level; A∞ categories, functors, modules, bimodules, and strictification remain. Layer 3 has normalized contractions and definitions of minimality and formality, but no transfer or Kadeishvili theorem. Layer 4 has a coaugmented bar differential, but no cobar adjunction, DG envelope, or controlled twisting. Layer 6 has the H⁰ consequence of DG quasi-equivalence, but no derived Morita result. Layers 5 and 7–11 are untouched.

## The frontier

- **Homological transfer** — construct the finite tree formulas and prove the transferred identities and Kadeishvili theorem from a normalized contraction; the A∞ algebra and contraction structures are available.
- **A∞ categories and modules** — extend the suspended bar encoding from algebras to composable Hom strings and right-module comodules, including functors, bimodules, and Yoneda; dependent graded-quiver infrastructure remains to be supplied.
- **DG module theory** — build general DG bimodules, tensor and internal Hom, and the many-object Yoneda embedding beyond the free rank-one algebra case.
- **Bar–cobar and twisting** — form the augmented bar construction on the reduced ideal, prove the cobar adjunction and DG-envelope comparison, then establish finite or complete-filtered Maurer–Cartan twisting.
- **Derived Morita theory** — prove that quasi-equivalences induce equivalences of derived module and perfect categories before the compact-generator and quotient results can follow.

<!--tauceti-status:v1 {"roadmap":"DGAInfinity","to_sha":"8339b5a9999c7fe7c83ad0ac2b89c5a2754fd8c8","ts":"2026-09-28T06:14:44+00:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"dependent graded-quiver operations and full brace substitution","state":"partial"},{"id":"Layer 1","remaining":"DG bimodules, general representables, extension of scalars, and derived tensor and Hom","state":"partial"},{"id":"Layer 2","remaining":"A∞ categories, modules, bimodules, homotopy inverses, and strictification","state":"partial"},{"id":"Layer 3","remaining":"tree transfer, Kadeishvili's theorem, perturbation lemma, and derived comparison","state":"partial"},{"id":"Layer 4","remaining":"cobar, twisting cochains, adjunction, DG envelope, and twisted operations","state":"partial"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","state":"untouched"},{"id":"Layer 9","state":"untouched"},{"id":"Layer 10","state":"untouched"},{"id":"Layer 11","state":"untouched"}],"readme_sha":"5084846eb030e70e08d60ce4421e4dc2db67285aee06d338c28807a3f66941ad","roadmap":"DGAInfinity","to_sha":"8339b5a9999c7fe7c83ad0ac2b89c5a2754fd8c8"}-->
# Status: DGAInfinity

This file documents the status of the DGAInfinity roadmap up until `8339b5a` (2026-09-28T06:14:44+00:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The signed coalgebra foundation now supports nonunital A∞ algebras and morphisms, while DG algebras, categories, and right modules support a rank-one Yoneda theorem. Layers 0–4 are partial; the stated derived, quotient, deformation, geometric, K-theoretic, and Koszul milestones in Layers 5–11 have not begun.

### Named results

- **The square-zero coderivation/Stasheff equivalence** — the suspended bar coderivation squares to zero exactly when the unsuspended operations satisfy all Stasheff identities on homogeneous inputs ([`TauCeti.AInfinity.IsSuspension.comp_self_eq_zero_iff_forall_stasheffSum_eq_zero`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Homology/AInfinity/Coderivation.html#TauCeti.AInfinity.IsSuspension.comp_self_eq_zero_iff_forall_stasheffSum_eq_zero)).
- **The differential graded Yoneda lemma for a free rank-one module** — its Hom complex into a right DG module is the module's underlying cochain complex ([`TauCeti.dgYonedaIso`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Homology/DG/Module/Right/Yoneda.html#TauCeti.dgYonedaIso)).
- **Homotopy-category invariance under DG quasi-equivalence** — a DG quasi-equivalence induces an equivalence on H⁰ categories ([`CategoryTheory.EnrichedFunctor.IsQuasiEquivalence.isEquivalence_mapDGHomotopyCategory`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/CategoryTheory/DG/QuasiEquivalence.html#CategoryTheory.EnrichedFunctor.IsQuasiEquivalence.isEquivalence_mapDGHomotopyCategory)).
- **The Koszul braiding on cochain complexes** — the signed interchange makes cochain complexes of modules symmetric monoidal ([`TauCeti.koszulBraidedCategory`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Homology/Monoidal/Braiding.html#TauCeti.koszulBraidedCategory)).
- **The graded coderivation/Taylor correspondence** — signed coderivations of reduced tensor words correspond to their Taylor components ([`TauCeti.ReducedTensorWords.gradedCoderivEquivTaylor`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/TensorCoalgebra/GradedCoderivation.html#TauCeti.ReducedTensorWords.gradedCoderivEquivTaylor)).

### Notable definitions and infrastructure

- **Nonunital A∞ algebras and morphisms** ([`TauCeti.AInfinityAlgebra`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Homology/AInfinity/Algebra.html#TauCeti.AInfinityAlgebra), [`TauCeti.AInfinityHom`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Homology/AInfinity/Algebra/Hom/Basic.html#TauCeti.AInfinityHom)) — square-zero bar coderivations and compatible coalgebra maps now carry higher operations and their composition.
- **DG categories** ([`TauCeti.DGCategory`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/CategoryTheory/DG/Basic.html#TauCeti.DGCategory)) — enriched Hom complexes provide closed and homotopy categories, functors, and a setting for right DG modules.
- **Completed tensor words** ([`TauCeti.CompletedTensorWords`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/TensorCoalgebra/Completed.html#TauCeti.CompletedTensorWords)) — products by tensor length provide the completed carrier needed for later filtered constructions.

### Roadmap coverage

Layer 0 is partial: the completed word constructions and coderivation/Stasheff bridge join the earlier braiding, Hom enrichment, and sign audit, but dependent graded-quiver multilinear maps and full brace operations remain unestablished. Layer 1 is partial: DG algebras, categories, H⁰, right modules, and rank-one Yoneda are present; bimodules and the derived tensor and Hom package remain. Layer 2 is partial: nonunital A∞ algebras, units and augmentations, morphisms, and quasi-isomorphisms are present, but A∞ categories, modules, bimodules, and strictification remain. Layer 3 is partial through contractions and minimality/formality predicates, without transfer or Kadeishvili's theorem. Layer 4 is partial through the coaugmented bar differential and arity-nilpotent Maurer–Cartan equation, without cobar, the adjunction, or twisted operations. The stated milestones of Layers 5–11 remain untouched; equivalence of H⁰ under quasi-equivalence does not establish derived Morita invariance.

## The frontier

- **Dependent graded-quiver operations** — construct multilinear substitution along composable paths and its signs, needed to state A∞ categories with the roadmap's interface.
- **DG bimodules and module functors** — add bimodules, extension of scalars, tensor and internal Hom, and general representable modules beyond the rank-one Yoneda case.
- **A∞ categories and modules** — define their higher compositions and module coderivations, then establish functors, Yoneda, and the DG comparison.
- **Homological transfer** — build finite planar-tree formulas and prove their Stasheff identities and Kadeishvili's minimal-model theorem; the contraction package and A∞ algebra definitions are available.
- **Bar–cobar and controlled twisting** — construct cobar, twisting cochains, the adjunction and DG envelope; extend the current arity-nilpotent Maurer–Cartan equation to twisted operations under the roadmap's finite or complete hypotheses.

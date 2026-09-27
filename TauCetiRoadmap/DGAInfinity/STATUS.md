<!--tauceti-status:v1 {"roadmap":"DGAInfinity","to_sha":"8745177e39945cdda39b4203688f5f6bb380a0b9","ts":"2026-09-01T22:18:35Z"}-->
# Status: DGAInfinity

This file documents the status of the DGAInfinity roadmap up until `8745177` (2026-09-01T22:18:35Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer 0 is largely done: graded modules in both presentations, signed homogeneous multilinear maps, the reduced and coaugmented tensor coalgebras with their coderivations, the Koszul braiding, the `R`-linear Hom complex with its enrichment, and the Stasheff identities in both encodings have all landed; still missing there are the completed tensor coalgebra, duals, dependent graded-quiver versions, and the bridge from `b² = 0` to the Stasheff identities. Beyond Layer 0 only the contraction package of Layer 3 has been touched; no DG or `A∞` algebra has yet been defined.

### Named results

- **The Koszul braiding on cochain complexes** — `CochainComplex (ModuleCat R) ℤ` is a symmetric monoidal category with braiding `x ⊗ y ↦ (-1)^{|x||y|} y ⊗ x` on the summands of Mathlib's totalized tensor product, both hexagons proved at complex level ([`TauCeti.koszulBraidedCategory`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Homology/Monoidal/Braiding.html#TauCeti.koszulBraidedCategory)).
- **The linear Hom complex enrichment** — cochain complexes in an `R`-linear preadditive category are enriched in cochain complexes of `R`-modules, with closed degree-zero composition obtained from Keller composition through the Koszul braiding, and with underlying additive complex Mathlib's `HomComplex` ([`TauCeti.linearHomComplexEnrichedCategory`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Homology/LinearHomComplex/Enrichment.html#TauCeti.linearHomComplexEnrichedCategory)).
- **The graded coderivation/Taylor correspondence** — a `q`-twisted, Koszul-signed coderivation of the reduced tensor coalgebra is exactly its family of Taylor components, with inverse the signed Taylor expansion ([`TauCeti.ReducedTensorWords.gradedCoderivEquivTaylor`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/TensorCoalgebra/GradedCoderivation.html#TauCeti.ReducedTensorWords.gradedCoderivEquivTaylor)).
- **The suspended and unsuspended Stasheff identities agree** — the suspended arity-`n` sum with no structural coefficient vanishes exactly when the unsuspended sum with `(-1)^{r+st}` does, and the arity 1–4 equations are evaluated verbatim ([`TauCeti.AInfinity.suspendedStasheffSum_eq_zero_iff`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Homology/AInfinity/Stasheff.html#TauCeti.AInfinity.suspendedStasheffSum_eq_zero_iff)).
- **Normalization of contractions** — every contraction `(i, p, h)` of cochain complexes can be replaced, keeping `i` and `p`, by one satisfying `h i = 0`, `p h = 0`, `h h = 0`; a contraction is a homotopy equivalence and its two maps are quasi-isomorphisms ([`TauCeti.Contraction.normalize`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Homology/Contraction.html#TauCeti.Contraction.normalize)).

### Notable definitions and infrastructure

- **Internal gradings** ([`TauCeti.InternalGrading`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Module/GradedModule/Internal.html#TauCeti.InternalGrading)) — a module with homogeneous submodules forming an internal direct sum, equivalent to Mathlib's graded objects and closed under shift, tensor product, opposite, and direct sum, so that multiplication can be defined on a total module.
- **Reduced and coaugmented tensor coalgebras** ([`TauCeti.ReducedTensorWords`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/TensorCoalgebra/Basic.html#TauCeti.ReducedTensorWords), [`TauCeti.TensorWords`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/TensorCoalgebra/Coaugmented.html#TauCeti.TensorWords)) — deconcatenation, conilpotence filtration, primitives, splices, and coderivations: the carrier for the planned bar construction `B∞A`.
- **Signed substitution and suspension** ([`MultilinearMap.signedOneSlot`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/Graded/Insertion.html#MultilinearMap.signedOneSlot), [`MultilinearMap.suspend`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/Graded/Shift.html#MultilinearMap.suspend)) — one-slot substitution with the exact Koszul sign, and the involutive suspension turning an operation of degree `2 - n` into one of degree one.

### Roadmap coverage

Layer 0 is partial: graded-module packaging is done except duals; homogeneous multilinear maps and signed substitution are done except the dependent graded-quiver versions; the reduced and coaugmented tensor coalgebras with coderivations are done, the completed tensor coalgebra is untouched; braiding, `R`-linear Hom complex, enrichment, and the comparison with Mathlib's `HomComplex` are done; the suspension equivalence and Stasheff formulas are done at the level of operations, but no `A∞` structure and no `b² = 0 ⇔ (SI_n)` theorem exist. Layer 3 is partial: the contraction package and its normalization are done; tree transfer, Kadeishvili's theorem, the perturbation lemma, and the derived equivalence are untouched. Layers 1, 2, and 4–11 are untouched. Of the worked examples, the arity 1–4 sign audit is partial (map-level identities and the suspension round trip, not the derivation from `b²` nor units); the rest are untouched.

## The frontier

- **`A∞` algebras and `b² = 0 ⇔ (SI_n)`** — define an `A∞` structure as a degree-one square-zero graded coderivation on the reduced tensor coalgebra of `sA` and prove that the arity-`n` letter component of `b²` is the suspended Stasheff sum. The coderivation/Taylor correspondence, suspension, and both Stasheff sums are in place; this closes the arity 1–4 audit.
- **Completed tensor coalgebra** — products by tensor length, distinguished from the direct-sum conilpotent coalgebra; the last construction Layer 0 asks for, and a prerequisite for the complete-filtration twisting regime of Layer 4.
- **DG algebras and DG categories (Layer 1)** — the enrichment instance for cochain complexes is the prototype; the general definition as enrichment in `CochainComplex (ModuleCat k) ℤ`, `Z⁰`, `H⁰`, DG modules, and the DG Yoneda lemma have not begun.
- **Homological transfer (Layer 3)** — with contractions normalized, the tree-sum transferred operations, their Stasheff identities, and Kadeishvili's theorem remain; blocked on the `A∞` definition above.
- **Remaining Layer 0 gaps for Layer 2** — duals under finite projectivity and dependent multilinear maps along composable paths in a graded quiver, needed before `A∞` categories can be stated.

<!--tauceti-status:v1 {"roadmap":"RepresentationTheory","to_sha":"9f8f0e7168e182286a822c184bb165c121fede9b","ts":"2026-09-06T04:17:43Z"}-->
# Status: RepresentationTheory

This file documents the status of the RepresentationTheory roadmap up until `9f8f0e7` (2026-09-06T04:17:43Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The Cartan-Killing classification, the finite-group character table, Peter-Weyl, Weyl complete reducibility, and the finite-dimensional highest-weight classification are established. The executable character-table summit, compact character completeness, Schur-Weyl duality, Spin representations, and Gabriel's theorem remain partial, while Mackey theory, the general classical-group classification, and the deeper Lie-group layers have not begun in the supplied record.

### Named results

- **[The finite-dimensional highest-weight classification](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Lie/HighestWeight/FiniteDimensional.html#TauCeti.exists_isDominantIntegral_nonempty_lieModuleEquiv_irreducibleQuotient)** — over an algebraically closed field of characteristic zero, the finite-dimensional irreducibles of a Killing-semisimple Lie algebra are exactly the `L(λ)` for dominant integral weights.
- **[The Peter-Weyl theorem](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Compact/PeterWeyl.html#TauCeti.stdPeterWeylBasis)** — normalized matrix coefficients of finite-dimensional irreducible unitary representations of a compact Hausdorff group form a Hilbert basis of `L²(G)`.
- **[The character table and both orthogonality relations](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/CharacterTable/Table.html#TauCeti.characterTable)** — irreducible characters form a basis of the class functions, with row and column orthogonality.
- **[The Cartan-Killing classification](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/RootSystem/FiniteType/Classification.html#TauCeti.existsUnique_dynkinType)** — every irreducible reduced crystallographic finite root system has a unique valid Dynkin type.
- **[The classification of complex Specht modules](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Symmetric/Specht/Complex.html#TauCeti.partitionEquivSimpleFDRepClassesℂ)** — partitions of `n` classify the simple finite-dimensional complex representations of `Sₙ` obtained by scalar extension from the rational Specht modules.

### Notable definitions and infrastructure

- **[The exact-cyclotomic Dixon-Schneider stage](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/CharacterTable/Dixon/Cyclotomic/Solver.html#TauCeti.ClassData.dixonCyclotomicCharacterTable?)** — runs the exact lifting stage and certifies every successful output against both the cyclotomic and complex character-table specifications, but does not yet establish the roadmap's full general solver.
- **[The compact isotypic projector](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Compact/Character/IsotypicProjection.html#ContRepresentation.isotypicProjector)** — averaging against the normalized conjugate character gives an idempotent continuous self-intertwiner whose range is the chosen isotypic component.
- **[The Auslander-Reiten translate](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Module/AuslanderReiten/Translate.html#TauCeti.AuslanderReitenTranslate)** — the construction `τ = D Tr` is available and independent up to linear equivalence of the minimal projective presentation, preparing AR duality and almost-split existence.

### Roadmap coverage

Root systems have Layers 1, 2 and 4-6, with the root-system-free Coxeter layer still missing; compact groups reach Peter-Weyl in Layer 5 and now have part of Layer 6, but not character completeness or the `SU(2)` engine. Character theory has Layers 0-5 and 7, part of the Layer 6 solver, Frobenius-kernel groundwork in Layer 8, and only the Steinberg boundary of Layer 9. Highest-weight theory has the Layer 4 classification and Layer 5 complete reducibility; its Verma-module, decomposition and `gl_n` interfaces are substantial, and Freudenthal's formula is proved, but the three Layer 6 formulas, Harish-Chandra and Serre remain. Semisimple algebras retain Layers 3-6 with Layer 2 incomplete. Schur-Weyl reaches the Specht classification and hook-length formula, but lacks the standard basis, Murnaghan-Nakayama, RSK and Schur-Weyl duality. Spin, Lie groups, induction-restriction, classical groups and quivers remain partial: quivers now have positive-definite finite representation type and `τ`, but neither Gabriel's bijection nor almost-split existence.

## The frontier

- **The Weyl character, dimension and Kostant formulas** — identify the alternating numerator and derive the three formulas; Weyl invariance, the denominator machinery, finite-dimensional `L(λ)`, the isotypic decomposition, and Freudenthal recursion are now available.
- **The Burnside-Dixon-Schneider solver** — connect the certified exact-cyclotomic stage to the full modular search, degree recovery and generic exact output, then establish the stated executable examples and correctness equality.
- **The standard Specht basis and character recursion** — finish Garnir straightening to obtain the standard polytabloid basis, then prove Murnaghan-Nakayama; RSK and Schur-Weyl duality remain beyond it.
- **Spin representations and Kostant isotypy** — construct the spin and half-spin modules and prove irreducibility; the Clifford structure and double covers exist, but the left-regular Kostant module has no isotypic decomposition.
- **Gabriel and Auslander-Reiten theory** — upgrade the positive-definite finiteness theorem to the bijection between indecomposables and positive roots, prove AR duality and almost-split existence from the new translate, and assemble the AR quiver.

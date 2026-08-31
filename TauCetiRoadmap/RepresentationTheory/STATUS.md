<!--tauceti-status:v1 {"roadmap":"RepresentationTheory","to_sha":"1870dd9c28549903e13841383798d76df08b659e","ts":"2026-08-31T04:53:31Z"}-->
# Status: RepresentationTheory

This file documents the status of the RepresentationTheory roadmap up until `1870dd9` (2026-08-31T04:53:31Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The Cartan–Killing classification, the finite-group character table, Peter–Weyl, the semisimple-algebra core, and Weyl complete reducibility are established. The finite-dimensional highest-weight classification, the executable character-table solver, Schur–Weyl, Spin representations, and Gabriel's theorem remain partial or absent; the supplied declaration record is truncated, so only explicitly supported results are credited below.

### Named results

- **[The Peter–Weyl theorem](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Compact/PeterWeyl.html#TauCeti.stdPeterWeylBasis)** — normalized matrix coefficients of the finite-dimensional irreducible unitary representations of a compact Hausdorff group form a Hilbert basis of `L²(G)`.
- **[The character table and both orthogonality relations](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/CharacterTable/Table.html#TauCeti.characterTable)** — irreducible characters form a basis of class functions, with the expected row and column orthogonality.
- **[The Cartan–Killing classification](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/RootSystem/FiniteType/Classification.html#TauCeti.existsUnique_dynkinType)** — every irreducible reduced crystallographic finite root system has a unique valid Dynkin type.
- **[Weyl's complete reducibility theorem](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Lie/HighestWeight/CompleteReducibility.html#TauCeti.exists_isCompl_of_isKilling)** — over an algebraically closed field of characteristic zero, every submodule of a finite-dimensional module for a Lie algebra with nondegenerate Killing form has a complement.
- **[The classification of irreducible highest-weight modules](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Lie/HighestWeight/Irreducible.html#TauCeti.nonempty_lieModuleEquiv_iff_eq_of_isHighestWeightVector)** — two irreducible highest-weight modules are isomorphic exactly when their highest weights agree, without a finite-dimensionality assumption.

### Notable definitions and infrastructure

- **[The irreducible quotient `L(λ)`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Lie/HighestWeight/Verma.html#TauCeti.irreducibleQuotient)** — the Verma module modulo its maximal submodule supplies the canonical irreducible highest-weight module; proving it finite-dimensional for every dominant integral `λ` remains.
- **[The multiplicative hook-length formula](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Combinatorics/Young/HookLength/Formula.html#TauCeti.standardCount_mul_prod_hookLength)** — computes the standard-tableau count without division and advances the standard-basis layer, though that basis itself is not established here.
- **[The Auslander–Reiten transpose](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Module/AuslanderReitenTranspose.html#TauCeti.AuslanderReitenTranspose)** — provides the presentation-theoretic cokernel needed before constructing the AR translate and almost-split sequences.

### Roadmap coverage

Compact groups are complete through Layer 5, while compact characters and the `SU(2)` engine are not established. Character theory has Layers 0–5 and 7, with Layer 8 only at the Frobenius-kernel groundwork and no assembled Layer 6 solver. Root systems have Layers 1, 2 and 4–6; semisimple algebras have Layers 3–6 and only the uniqueness portion of Layer 2. Highest-weight theory now has Layer 5, Verma modules and `L(λ)` in Layer 3, and the uniqueness side of Layer 4; finite-dimensionality for dominant weights and the Layer 6 formulas remain incomplete, though formal characters and reductive `gl_n` have advanced. Schur–Weyl reaches Layer 4 and the hook-length theorem in Layer 5, with rim-hook groundwork but no Murnaghan–Nakayama or RSK. Spin has Layers 0, 2 and 3, parts of the structure theorem and real periodicity, and the left-regular Kostant module, but neither spin modules nor Kostant isotypy. Lie groups reach the exponential and adjoint layers; induction–restriction has Frobenius reciprocity but not Mackey theory; classical groups have only initial and extreme constructions. Quivers have reflection functors and substantial Layer 6 infrastructure, but neither Gabriel's theorem nor the AR translate and almost-split existence.

## The frontier

- **Finite-dimensional highest-weight classification** — prove that `L(λ)` is finite-dimensional for every dominant integral `λ`, completing the bijection with finite-dimensional irreducibles; the missing work includes integrability, Weyl-stable weight bounds, and finite weight support.
- **The Weyl character and dimension formulas** — formal characters are Weyl-invariant and their denominator product is alternating; identifying the numerator and deriving the character, dimension, and Kostant multiplicity formulas remains.
- **The Burnside–Dixon–Schneider solver** — exact arithmetic, good-prime theory, eigenvector search, lifting, and checking exist, but the certified executable solver and its correctness equality are not assembled.
- **Spin representations and Kostant isotypy** — construct the spin and half-spin modules and prove their irreducibility; for the Clifford algebra of a semisimple Lie algebra, the faithful left-regular action still lacks the claimed isotypic decomposition.
- **Gabriel and Auslander–Reiten theory** — build the AR translate from the new transpose, prove almost-split existence, and complete the Krull–Schmidt and Coxeter-functor arguments needed to identify indecomposables with positive roots.

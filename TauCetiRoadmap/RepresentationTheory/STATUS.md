<!--tauceti-status:v1 {"roadmap":"RepresentationTheory","to_sha":"aa9e5f89ab3cee691992ab2274b0da31961faabb","ts":"2026-09-10T22:09:52Z"}-->
# Status: RepresentationTheory

This file documents the status of the RepresentationTheory roadmap up until `aa9e5f8` (2026-09-10T22:09:52Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The Cartan-Killing classification, the character table of a finite group, the
character table of the symmetric group, Peter-Weyl, Weyl complete reducibility and the
finite-dimensional highest-weight classification are all established. Genuinely partial are the
executable character-table algorithm, the spin representations, Schur-Weyl duality, Gabriel's theorem
and the Lie-group correspondence; the classical groups as a family, Mackey decomposition, and the
deeper Lie-group structure theory have not begun in the supplied record.

### Named results

- **[The Cartan-Killing classification](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/RootSystem/FiniteType/Classification.html#TauCeti.existsUnique_dynkinType)** — every irreducible reduced crystallographic finite root system has a unique valid Dynkin type, and every valid type is realized.
- **[The finite-dimensional highest-weight classification](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Lie/HighestWeight/FiniteDimensional.html#TauCeti.exists_isDominantIntegral_nonempty_lieModuleEquiv_irreducibleQuotient)** — over an algebraically closed field of characteristic zero, the finite-dimensional irreducibles of a Killing-semisimple Lie algebra are exactly the `L(λ)` for dominant integral weights.
- **[The Peter-Weyl theorem](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Compact/PeterWeyl.html#TauCeti.stdPeterWeylBasis)** — normalized matrix coefficients of the finite-dimensional irreducible unitary representations of a compact Hausdorff group form a Hilbert basis of `L²(G)`.
- **[The character table of a finite group](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/CharacterTable/Table.html#TauCeti.characterTable)** — the irreducible characters are a basis of the class functions, with both orthogonality relations in row and column form.
- **[The character table of the symmetric group](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Symmetric/Specht/Character.html#TauCeti.symmetricCharacterTable)** — the integer matrix of Specht character values `χ^μ(ν)` on cycle types, orthogonal in rows and columns, and equal to the general complex character table of `Sₙ` once reindexed.

### Notable definitions and infrastructure

- **[The standard polytabloid basis](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Symmetric/Specht/StandardBasis.html#TauCeti.standardPolytabloidBasis)** — Garnir straightening gives `S^μ` a basis indexed by the standard tableaux, which is what makes `dim S^μ = f^μ` and the character table computable rather than merely well defined.
- **[The Bruhat order](https://taucetiproject.github.io/TauCeti/docs/TauCeti/GroupTheory/Coxeter/Bruhat.html#CoxeterSystem.bruhatPartialOrder)** — a partial order on any Coxeter group with the subword property: everything below `w` is spelled by a sublist of every word for `w`. This is the root-system-free Coxeter layer the Weyl-group theory was missing.
- **[The single-weight isotypy criterion for `gl_N`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Lie/GeneralLinear/Isotypic.html#TauCeti.isIsotypic_of_forall_isGlHighestWeightVector)** — a finite-dimensional module all of whose highest-weight vectors share one weight is isotypic, reducing Kostant's corollary to locating highest-weight vectors.

### Roadmap coverage

Root systems are done: Layers 1, 2, 4-6, and now the root-system-free Coxeter combinatorics of Layer 3
(strong exchange, the deletion condition, inversion sequences, Bruhat). Semisimple algebras now reach
Layer 6 with no gap, Layer 2 uniqueness having been settled by identifying a Wedderburn
presentation's degrees with intrinsic block multiplicities. Character theory has Layers 0-5 and 7, part of the
Layer 6 solver, and only groundwork in Layers 8 and 9. Schur-Weyl now has Layers 0-5 and the character
half of Layer 6, but not Murnaghan-Nakayama, symmetric functions, RSK or the duality itself.
Highest-weight theory has Layers 0-5, Freudenthal and self-duality from Layer 7, and a substantial
Layer 9 `gl_n` interface; the three Layer 6 formulas, Harish-Chandra and Serre remain. Compact groups
reach Peter-Weyl and now have the circle as a fully classified engine case, but not character
completeness or `SU(2)`. Induction-restriction has Layers 0-2 and Clifford theory in Layer 5, skipping
the Mackey decomposition and criterion of Layers 3-4. Spin has Layers 0-2, the quadratic
realization of `𝔰𝔬(V)` in Layer 3, Layer 7, and the Layer 6 isomorphism `Spin(3) ≅ SL₂`, with only a
type-B fragment of Layers 4-5. Lie groups have Layer 0 and
partial Layer 2. Quivers have Layer 4 and the Auslander-Reiten translate, but not Gabriel's bijection.
Classical groups remain untouched.

## The frontier

- **The Weyl character, dimension and Kostant formulas** — identify the alternating numerator and derive the three formulas; Weyl invariance, the denominator machinery, finite-dimensional `L(λ)`, the isotypic toolkit and Freudenthal recursion are all available.
- **The Murnaghan-Nakayama rule** — with the standard basis and the character table in hand, the remaining obstacle is the rim-hook recursion for the entries; RSK and Schur-Weyl duality sit beyond it.
- **Spin representations and Kostant isotypy** — construct the spin and half-spin modules in general and prove irreducibility. The type B polarization is started and the `gl_n` isotypy machinery is ready, but the corollary has no statement.
- **The Burnside-Dixon-Schneider solver** — connect the certified exact-cyclotomic stage to the modular search, degree recovery and generic exact output, then establish the executable examples.
- **Gabriel's theorem and almost-split sequences** — upgrade positive-definite finite representation type to the bijection between indecomposables and positive roots, and prove Auslander-Reiten duality and existence from the translate.

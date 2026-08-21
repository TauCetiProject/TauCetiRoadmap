<!--tauceti-status:v1 {"roadmap":"RepresentationTheory","to_sha":"dfa452e279e454d02f2d4f4002047ea1078b8969","ts":"2026-08-19T06:48:22Z"}-->
# Status: RepresentationTheory

This file documents the status of the RepresentationTheory roadmap up until `dfa452e` (2026-08-19T06:48:22Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Root-system classification through pinned integral data is complete; the character table, Peter–Weyl theorem, rational classification for `Sₙ`, and algebraic Pin/Spin double covers also stand. Highest-weight classification, spin representations, Gabriel’s theorem and the executable character-table solver remain incomplete; because the supplied record truncates some declaration lists, the account below is limited to results explicitly visible there and in the preceding snapshot.

### Named results

- **[The Peter–Weyl theorem](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Compact/PeterWeyl.html#TauCeti.stdPeterWeylBasis)** — normalized matrix coefficients of the finite-dimensional irreducible unitary representations of a compact Hausdorff group form a Hilbert basis of `L²(G)`.
- **[The character table and both orthogonality relations](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/CharacterTable/Table.html#TauCeti.characterTable)** — irreducible characters form a basis of class functions, with rows and columns satisfying their respective orthogonality relations.
- **[The classification of irreducible rational representations of `Sₙ`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Symmetric/Specht/Completeness.html#TauCeti.partitionEquivSimpleModuleClasses)** — partitions classify simple `ℚ[Sₙ]`-modules; the statement is over `ℚ`, not an arbitrary characteristic-zero field.
- **[The Cartan–Killing classification](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/RootSystem/FiniteType/Classification.html#TauCeti.existsUnique_dynkinType)** — every irreducible reduced crystallographic finite root system has a unique valid Dynkin type.
- **The [Pin](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/CliffordAlgebra/Pin/DoubleCover.html#CliffordAlgebra.pinDoubleCover) and [Spin](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/CliffordAlgebra/Spin/DoubleCover.html#CliffordAlgebra.spinDoubleCover) double covers** — over a separably closed field with `2` invertible, the actions give extensions of `O(Q)` and `SO(Q)` by `ℤ/2`; the general-field Spin image is only the kernel of the spinor norm.

### Notable definitions and infrastructure

- **[Pinned simply connected root data](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/RootSystem/SimplyConnectedRootDatum/Assembly.html#TauCeti.DynkinType.simplyConnectedRootDatum)** — supplies a Bourbaki-numbered integral datum for every valid Dynkin type, ready for constructions that need an explicit carrier.
- **[The central Casimir element](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Lie/UniversalEnveloping/Casimir.html#TauCeti.casimirElement_mem_center)** — provides the main operator for extending complete reducibility beyond `sl₂`, although its required scalar-action and splitting arguments remain.
- **[The Bender–Knuth involutions](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Combinatorics/Young/BenderKnuth.html#SemistandardYoungTableau.benderKnuth)** — exchange adjacent contents of semistandard tableaux, supplying combinatorics needed for Schur-function symmetry and RSK.

### Roadmap coverage

Compact groups are complete through Layer 5; character theory through Layers 5 and 7; root systems through Layers 1, 2 and 4–6; and semisimple algebras through Layers 3–6, with only the uniqueness part of Layer 2 established. Schur–Weyl reaches Layer 4 over `ℚ`. Spin has Layers 0, 2 and 3, the associated-graded part of Layer 1, and real periodicity from Layer 7, but no spin module. Highest-weight theory has `sl₂`, substantial weight theory, ordered PBW spanning, dominant-highest-weight existence and the Casimir, but neither Verma modules nor `L(λ)`. Lie groups reach the exponential and adjoint layers; quivers have reflection functors and new projective/injective and irreducible-morphism infrastructure, but not Krull–Schmidt uniqueness or Gabriel. Induction–restriction has Frobenius reciprocity but not Mackey theory; classical groups have only the extreme Weyl-construction cases. Compact characters and `SU(2)`, Frobenius groups, and the later spin and Lie-group layers are not established here.

## The frontier

- **The Burnside–Dixon–Schneider solver** — the exact arithmetic, good-prime theory, eigenvector search, lift and checker exist, but their assembly into the certified executable solver and its equality theorem remains.
- **Verma modules and `L(λ)`** — ordered PBW monomials now span the enveloping algebra and dominant highest weights exist uniquely for finite-dimensional irreducibles; the Verma construction, unique irreducible quotient and dominant-weight classification are still absent.
- **Weyl complete reducibility** — the invariant form and central Casimir are available; its scalar computation together with the dual/Hom-module splitting argument remains.
- **The spin and half-spin representations** — the double cover is ready, but the Fock model, Clifford action and irreducibility are still needed; these also unlock the Clifford structure theorem.
- **Gabriel’s theorem** — reflection functors and surrounding module infrastructure are present, while the Krull–Schmidt exchange argument, Coxeter functor and correspondence with positive roots remain.

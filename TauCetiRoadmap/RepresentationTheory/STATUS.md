<!--tauceti-status:v1 {"roadmap":"RepresentationTheory","to_sha":"671091ae4d4ff844de3ac9f31bb7d8a4610d75ba","ts":"2026-08-11T02:10:03Z"}-->
# Status: RepresentationTheory

This file documents the status of the RepresentationTheory roadmap up until `671091a` (2026-08-11T02:10:03Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Three summits stand: the character table of a finite group with both orthogonality
relations, the Peter-Weyl theorem, and the classification of the irreducible rational
representations of `Sₙ` by partitions. Cartan-Killing has its rigidity half and five types realized
but not its enumeration of diagrams; the algebra foundation runs to the Brauer group and now has
Wedderburn uniqueness. The highest-weight theory beyond `sl₂`, Gabriel's theorem, the spin
representations proper and the Dixon-Schneider solver are not reached. Two pull requests had
truncated declaration lists in the record, so the type `Cₙ` and Dixon-lift material may be wider
than described.

### Named results

- **The Peter-Weyl theorem** — the normalized matrix coefficients of the finite-dimensional
  irreducible unitary representations of a compact Hausdorff group are a Hilbert basis of `L²(G)`
  (<https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Compact/PeterWeyl.html#TauCeti.stdPeterWeylBasis>),
  via uniform density of the representative ring in `C(G, 𝕜)`
  (<https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Compact/RepresentativeDensity.html#TauCeti.dense_representativeSubmodule>).
- **The character table and the orthogonality relations** — the irreducible characters of a finite
  group are a basis of its class functions, as many as there are conjugacy classes, orthonormal by
  rows and by columns
  (<https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/CharacterTable/Table.html#TauCeti.characterTable>).
- **The classification of the irreducible rational representations of `Sₙ`** — sending a partition of
  `n` to the Specht module `S^μ` is a bijection onto the simple `ℚ[Sₙ]`-modules up to isomorphism
  (<https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Symmetric/Specht/Completeness.html#TauCeti.partitionEquivSimpleModuleClasses>).
  It is stated over `ℚ`, not over a general field of characteristic zero.
- **The rigidity half of Cartan-Killing** — two root systems carrying bases of the same Cartan type
  are isomorphic, so the Dynkin type is a complete invariant
  (<https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/RootSystem/Isomorphism.html#TauCeti.nonempty_equiv_of_hasCartanType>).
- **The decomposition of an `sl₂`-module** — over an algebraically closed field of characteristic
  zero it is an internal direct sum of copies of the irreducibles `V(n)`
  (<https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Lie/Sl2/Decomposition.html#TauCeti.Sl2Std.exists_isInternal_lieModuleEquiv>).

### Notable definitions and infrastructure

- **The pinned simply connected root data**
  (<https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/RootSystem/SimplyConnectedRootDatum/A.html#TauCeti.DynkinType.hasCartanType_typeASimplyConnectedRootDatum>):
  explicit root and coroot tables realizing the Bourbaki Cartan matrices of types A, C, D, E₆ and G₂
  with the coroots spanning the cocharacter lattice. They are the existence half of the
  classification, and what the Chevalley-Demazure construction asks for.
- **The BGP reflection functor on representations**
  (<https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Quiver/Reflection/Representation.html#TauCeti.reflectionFunctor>),
  fully faithful on every indecomposable other than the vertex simple, which it kills: a missing
  prerequisite of Gabriel's theorem.
- **The certified cyclotomic lift**
  (<https://taucetiproject.github.io/TauCeti/docs/TauCeti/RingTheory/Cyclotomic/Lift.html#TauCeti.Cyclotomic.lift>),
  recovering a cyclotomic integer within Dixon's size bound from its residues at the conjugate roots
  of a good prime, making the modular phase of Burnside-Dixon-Schneider lossless.

### Roadmap coverage

Character theory is done through Layers 5 and 7, with Layer 6 holding every ingredient but the
assembled solver and Layer 9 opened at the Borel subgroup of `GL₂(𝔽_q)`. Compact groups run through
Layer 5; Layer 6 and the SU(2) engine are untouched. Semisimple algebras have Layers 3 to 6 and now
the uniqueness half of Layer 2, with Layer 0 untouched. Root systems have Layers 1, 2 and 4, Layer 5
except the enumeration, and Layer 6 for five types. Schur-Weyl reaches Layer 4 over `ℚ`, leaving the
hook-length formula, Murnaghan-Nakayama and duality open. Above Layer 0 and the Layer 2 weight
theory the highest-weight roadmap is empty, and Lie groups have Layer 0 and most of Layer 1. The
spin roadmap has Layers 0 and 3, Layer 1 as the Clifford filtration quotients identified with the
exterior powers, half of Layer 2, and real Bott periodicity from Layer 7. Classical groups have the
extreme shapes of Layer 2 and nothing of Layers 3 to 5. Induction and restriction are unchanged, and quiver
work appears below.

## The frontier

- **The Burnside-Dixon-Schneider solver** (character theory Layer 6). Every named piece is present,
  including the certified lift from `ZMod p` and the common-eigenvector search; assembly against the
  specification remains.
- **The enumeration of the admissible Dynkin diagrams** (root systems Layer 5). The degree bound and
  the tree shape of an irreducible finite-type diagram are proved; the induction that turns these
  constraints into the list of types remains. Types B, F₄ and E₇ also still need pinned root data.
- **Verma modules and `L(λ)`** (highest weight Layers 3 and 4). Highest weight vectors exist over a
  Killing-semisimple algebra; the enveloping algebra is the missing prerequisite, and Weyl's
  complete reducibility beyond `sl₂` waits behind it.
- **Gabriel's theorem** (quiver Layer 5). Reflection functors are in place; Krull-Schmidt uniqueness
  (Layer 2) still lacks its exchange argument, and the Coxeter functor and the bijection with the
  positive roots are absent.
- **The Pin and Spin double covers** (spin Layer 2). Reflections lift over a separably closed field
  and the inductive step of Cartan-Dieudonné is proved; the induction, surjectivity onto `O(Q)`, and
  the kernel being `{±1}` remain.

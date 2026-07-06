# Representation theory

A connected family of roadmaps for the representation theory of groups, algebras, and Lie algebras,
downstream of Mathlib. Each subdirectory is a self-contained roadmap (a definitive `README.md` plus a
`Suggested.lean` of target signatures); this page is the index and the map of how they fit together.

The organizing principle is the one stated across the roadmaps: build the general theory, and specialize
only where a special case genuinely unlocks the general construction. The module and algebra core is
primary and Mathlib-native; the analytic and categorical layers are introduced where they generalize.

## The roadmaps

- [**Semisimple algebras, Artin-Wedderburn, and module structure**](SemisimpleAlgebras/README.md) — the
  algebra foundation: the Jacobson radical, simple modules and Schur's lemma, the Wedderburn
  decomposition with uniqueness, the density theorem, central simple algebras, Skolem-Noether, and the
  Brauer group. Underpins character theory.
- [**Character theory of finite groups, and computing character tables**](CharacterTheory/README.md) —
  class functions, the group-algebra center and structure constants, completeness and both orthogonality
  relations, the arithmetic of character values, and an executable, proven-correct
  Burnside-Dixon-Schneider algorithm that computes character tables.
- [**Induction, restriction, and Mackey theory**](InductionRestriction/README.md) — induced and
  restricted representations, Frobenius reciprocity, the projection formula, induced characters, the
  Mackey decomposition and irreducibility criterion, and Clifford theory.
- [**Root systems, Weyl groups, and the Cartan-Killing classification**](RootSystems/README.md) — the
  shared combinatorial foundation: root systems, the Weyl group as a Coxeter system, positive roots and
  the fundamental domain, and the Dynkin-diagram classification.
- [**Semisimple Lie algebras: sl₂, highest weight, and the Weyl character formula**](LieHighestWeight/README.md)
  — sl₂ as the engine case, the root-space decomposition, weights, Verma modules and `L(λ)`, the
  highest-weight classification, Weyl's complete reducibility, and the Weyl character and dimension
  formulas.
- [**Finite-dimensional representations of the classical groups**](ClassicalGroups/README.md) — the
  standard representation and its tensor powers, the Weyl construction via Young symmetrizers, highest
  weights, Schur polynomials as characters, the Weyl dimension formula, and branching rules.
- [**The symmetric group, Specht modules, and Schur-Weyl duality**](SchurWeyl/README.md) — partitions and
  tableaux, Young symmetrizers, Specht modules and their classification, the hook-length formula, the
  Murnaghan-Nakayama rule, RSK, and Schur-Weyl duality.
- [**Compact groups, Haar measure, and the Peter-Weyl theorem**](CompactGroups/README.md) — Haar
  averaging and complete reducibility, matrix coefficients, Schur orthogonality in L²(G), the Peter-Weyl
  theorem, characters of compact groups, and the SU(2) and maximal-torus engine.
- [**Lie groups and the Lie algebra correspondence**](LieGroups/README.md) — the smooth-group side:
  the exponential map and one-parameter subgroups, `Ad`/`ad`, the closed-subgroup theorem, the Lie
  functor and Baker-Campbell-Hausdorff, Lie's third theorem, maximal-torus conjugacy and the general
  Weyl integration formula, complexification and real forms, Borel-Weil, and the Cartan/Iwasawa/KAK
  decompositions.
- [**Clifford algebras, the Pin and Spin groups, and spin representations**](SpinRepresentations/README.md)
  — Clifford algebras and their structure, the Pin and Spin groups as double covers of O and SO, the
  spin and half-spin representations that supply the fundamental representations of types B and D, the
  low-dimensional exceptional isomorphisms, real Clifford algebras, and triality.
- [**Quiver representations and finite-dimensional algebras**](QuiverRepresentations/README.md) — path
  algebras, representations of a quiver, Krull-Schmidt, Gabriel's theorem (finite type ⇔ ADE Dynkin,
  indecomposables ↔ positive roots), reflection and Coxeter functors, and Auslander-Reiten theory.

## How they depend on one another

- **Semisimple algebras → character theory.** The Wedderburn structure of the group algebra and the
  count of irreducibles rest on the general semisimple-algebra theory.
- **Induction/restriction and Schur-Weyl feed character theory.** Induced and permutation characters, and
  the Murnaghan-Nakayama rule for symmetric groups, are character-table tools.
- **Root systems → Lie highest weight → classical groups.** Root systems and Weyl groups are the shared
  language; the highest-weight theory of semisimple Lie algebras specializes to the classical groups,
  where Schur-Weyl duality and Young symmetrizers connect to the symmetric group.
- **Character theory is the finite case of compact groups.** Peter-Weyl, restricted to a finite group,
  recovers the finite-group character theory, and the two share the orthogonality machinery.
- **Lie groups sit under the Lie-algebra and compact-group theory.** The Lie-group roadmap builds the
  smooth-group ↔ Lie-algebra correspondence that the highest-weight and compact-group roadmaps
  presuppose, and abstracts the general Weyl integration formula the compact-group roadmap proves only
  for SU(2).
- **Spin representations complete the classical groups.** The spin and half-spin representations are the
  fundamental representations of types B and D that are not realized in tensor powers of the standard
  representation, so they finish the classical-groups picture.
- **Quiver representations meet root systems.** Gabriel's theorem identifies the finite-type quivers with
  the ADE Dynkin diagrams and the indecomposables with the positive roots, tying the finite-dimensional
  algebra theory back to root systems.

Roadmaps in this family also cite roadmaps outside it: the classical-groups and compact-groups roadmaps
border [reductive algebraic groups](../ReductiveGroups/README.md) and
[weighted orthogonal L² bases](../OrthogonalL2Bases/README.md), the character-theory roadmap shares the
Frobenius-Schur indicator with [pivotal and spherical categories](../PivotalSpherical/README.md), and the
Schur-Weyl roadmap borders [Temperley-Lieb](../TemperleyLieb/README.md).

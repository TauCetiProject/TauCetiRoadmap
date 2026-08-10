<!--tauceti-status:v1 {"roadmap":"RepresentationTheory","to_sha":"eb0f4564349742315bf3e1cc2a7b9bf2ae7b96c0","ts":"2026-08-09T18:56:42Z"}-->
# Status: RepresentationTheory

This file documents the status of the RepresentationTheory roadmap up until `eb0f456` (2026-08-09T18:56:42Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The finite-group summit is reached in its mathematical layers: the character table
exists, both orthogonality relations and completeness are proved, and the table is characterized up
to a permutation of rows by a specification, so only the executable Dixon-Schneider solver remains
open on that lane. The algebra foundation now runs to the Brauer group, `sl₂` representation theory
is complete, and the Weyl-group combinatorics is largely done; the general highest-weight theory,
Peter-Weyl, Specht modules, Gabriel's theorem and the spin representations proper have not begun.
Some declarations and modules from this window are missing from the extracted record, so a lane
called untouched below may have support that is not visible here.

### Named results

- **The character table and the orthogonality relations** — the irreducible characters of a finite
  group are a basis of its class functions, as many as there are conjugacy classes, orthonormal by
  rows and by columns, with degrees dividing `|G|` and squares summing to it
  (<https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/CharacterTable/Table.html#TauCeti.characterTable>).
- **The Frobenius-Schur trichotomy** — the indicator of an irreducible representation over an
  algebraically closed field of characteristic zero is `1`, `0` or `-1`, according as it carries an
  invariant symmetric form, no invariant form, or an invariant alternating one
  (<https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/CharacterTable/FrobeniusSchur/Trichotomy.html#TauCeti.Representation.frobeniusSchurIndicator_eq_one_or_eq_zero_or_eq_neg_one>).
- **The classification of the finite-dimensional irreducible `sl₂`-modules** — over an algebraically
  closed field of characteristic zero there is exactly one such module `V(n)` for each natural
  number, of dimension `n + 1`
  (<https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Lie/Sl2/Classification.html#TauCeti.Sl2Std.existsUnique_nonempty_lieModuleEquiv>),
  and every submodule of a finite-dimensional module is a direct summand.
- **The Skolem-Noether theorem** — two homomorphisms from a finite-dimensional central simple
  algebra into a simple algebra are conjugate by a unit, so every automorphism is inner
  (<https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/CentralSimple/SkolemNoether.html#TauCeti.skolemNoether>).
- **The Brauer group of a field** — the classes of finite-dimensional central simple algebras form a
  commutative group under tensor product, with inverse the opposite algebra, trivial over finite and
  over algebraically closed fields
  (<https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/BrauerGroup/Group.html#TauCeti.BrauerGroup.instCommGroup>).

### Notable definitions and infrastructure

- **The character-table specification**
  (<https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/CharacterTable/Specification.html#TauCeti.isCharacterTableSpec_iff_exists_perm>).
  The matrices satisfying it are exactly the row permutations of the character table, which is what
  will let a computed table be certified rather than merely produced.
- **Verified dense linear algebra over a field**: Gauss-Jordan elimination with a kernel basis, and
  an eigenvalue search proved to return exactly the spectrum
  (<https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/Matrix/EigenvalueSearch.html#TauCeti.coe_eigenvalueSearch>).
  These are the linear-algebra half of the Dixon-Schneider eigenvector search.
- **The Lie-group exponential**
  (<https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Lie/Exponential/Basic.html#lieExp>),
  built from invariant integral curves, with the classification of continuous one-parameter
  subgroups by their generators and a local inverse at the identity.

### Roadmap coverage

Character theory is done through Layer 5 and Layer 7; Layer 6 has its executable class data, the
finite-field linear algebra, the existence of good Dixon primes and the good-prime structure theorem,
but no exact cyclotomic arithmetic and no assembled solver, and Layers 8 and 9 have only the
trivial-intersection prerequisites for Frobenius groups. Semisimple algebras are done at Layers 3 to
6 (double centralizer, central simple tensor products, Skolem-Noether and the centralizer theorem,
the Brauer group with splitting fields); general Artin-Wedderburn with uniqueness (Layer 2) is still
not established, and Layer 0 is untouched. Root systems have Layers 1, 2 and 4 (inversions and
length, braid relations, chambers, the fundamental domain, the longest element, the Weyl vector);
Layer 5 has the finite-type combinatorics, the `B`/`C` duality and the rank-two classification but
not Cartan-Killing. The highest-weight roadmap has Layer 0 complete, Layer 2 for Killing-semisimple
algebras, and the `gl_n` root-space and Borel vocabulary of Layers 1 and 9. Lie groups have Layer 0
and much of Layer 1. The spin roadmap has Layers 0 and 3, Layer 1 in its associated-graded form, half
of Layer 2, and four base entries of the real periodicity table. Classical groups have the
combinatorial half of Layer 6 (Gelfand-Tsetlin patterns matched with semistandard tableaux, dominant
weights as shapes up to a determinant twist), but nothing of Layers 2 to 5. Induction and restriction
gained only Layer 7, where `H²(G, M)` now classifies extensions with abelian kernel. Compact groups,
Schur-Weyl above its combinatorial Layer 0, and quiver representations are where they were.

## The frontier

- **The Burnside-Dixon-Schneider solver** (character theory Layer 6). Class data, elimination,
  eigenvalue search, good primes and the good-prime structure theorem are all in place; what remains
  is computable cyclotomic arithmetic and the structured lift from `ZMod p`, then assembly against
  the specification.
- **The Cartan-Killing classification** (root systems Layer 5). The degree bound, the absence of
  triangles, the star bound and the affine counterexamples are proved, and rank two is classified;
  the induction that turns these into the list of diagrams is the remaining work.
- **Verma modules and `L(λ)`** (highest weight Layers 3 and 4). The `sl₂` engine, weight integrality
  and the triangular decomposition are done; the enveloping algebra is the missing prerequisite, and
  Weyl's complete reducibility beyond `sl₂` waits behind it.
- **Krull-Schmidt** (quiver Layer 2), unchanged: Fitting's lemma and the local-endomorphism-ring
  criterion are proved, the exchange argument for uniqueness is not, and Gabriel's theorem needs
  reflection functors on representations.
- **The Pin and Spin double covers** (spin Layer 2). The twisted-conjugation map to `O(Q)` is built
  and reflections lift over a separably closed field; surjectivity by Cartan-Dieudonné and the
  computation of the kernel as `{±1}` remain.

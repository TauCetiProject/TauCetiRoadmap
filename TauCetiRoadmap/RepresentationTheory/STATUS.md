<!--tauceti-status:v1 {"roadmap":"RepresentationTheory","to_sha":"6919462d4134c7850ded5c71cc7a2e8a9054a2d0","ts":"2026-08-01T03:46:02Z"}-->
# Status: RepresentationTheory

This file documents the status of the RepresentationTheory roadmap up until `6919462` (2026-08-01T03:46:02Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

The family is eleven roadmaps. Roughly, the algebra and finite-group core has real theorems in it,
the combinatorial and quiver lanes have their vocabulary but not their summits, and the Lie-theoretic
lanes are barely begun. A hundred or so declarations from this window are missing from the extracted
record, so a layer called untouched below may have partial support that is not visible here.

**Semisimple algebras.** Layer 3, the double-centralizer theorem, is done, in the general faithful
semisimple form and in the simple-ring specialisation, with Jacobson-Chevalley density alongside it
(`TauCeti.toModuleEnd_moduleEnd_bijective`,
<https://taucetiproject.github.io/TauCeti/docs/TauCeti/RingTheory/Semisimple/DoubleCentralizer.html#TauCeti.toModuleEnd_moduleEnd_bijective>).
Layer 2 is present in the central simple case: `IsSimpleRing.exists_algEquiv_matrix_centralDivisionRing`
splits a finite-dimensional central simple algebra as matrices over a central division algebra, with
the dimension identity; general Artin-Wedderburn with uniqueness is not established here. Layer 4 has
its core closure properties (the tensor product of two central algebras is central; the tensor
product of a central simple algebra with a simple algebra is simple), the degree function `deg` with
its behaviour under matrices and tensor products, and the Hamilton quaternions as a worked central
algebra that is not split over an ordered ring. Layers 0, 5 (Skolem-Noether) and 6 (the Brauer group)
are untouched.

**Character theory.** Layers 0 to 2 are done. Class functions form a module of dimension the number
of conjugacy classes with a normalized pairing; class sums are a basis of the centre of `k[G]` with
structure constants; and the Wedderburn layer gives the splitting of `k[G]`, the identification of
the block count with the number of conjugacy classes, and the sum-of-squares identity
(<https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/CharacterTable/Wedderburn.html#TauCeti.exists_algEquiv_pi_matrix>).
Layer 5, the Dixon-Schneider specification, is half built: the class-multiplication matrices exist,
commute pairwise, are injective in the class, and normalized common left eigenrows are characterised
and have forced eigenvalues; class sums are known integral over `ℤ`. What is missing is Layer 3
entirely: no character table, no orthogonality relations, no completeness. Layers 4 and 6 to 9 are
untouched.

**Induction, restriction, and Mackey.** Layer 0 has induction and coinduction in stages and the
restriction functor with its composition laws; Layer 1, the conjugate representation, is done at
length, including the autoequivalence for a normal subgroup, invariance of irreducibility, and the
subrepresentation order isomorphism; Layer 2 is done, with induced characters, the permutation
representation as induction of the trivial, and Frobenius reciprocity in both directions and in both
its character and its intertwining-dimension form. Layer 7 has its foundations: factor sets, the
twisted product they build, the fact that every extension with abelian kernel arises from one and
that cohomologous factor sets give equivalent extensions, and the twisted monoid algebra `k_α[G]`
with its universal property. The Schur multiplier itself, and Layers 3 to 6 (Mackey, intertwining
numbers, Clifford theory, Artin-Brauer induction), are untouched.

**Root systems.** Layer 1 is largely there: positive and negative roots partition the roots, height
decreases under the right simple reflection, and inversion sets are defined with the exchange count
(right multiplication by a simple reflection changes the number of inversions by exactly one).
Layer 2 has the simple reflections generating the Weyl group and the Coxeter matrix of a base, with
the Cartan product of distinct simple roots confined to `{0, 1, 2, 3}`; the Coxeter-system statement
itself is not recorded here. Layer 4 has only the open dominant chamber and the fact that no simple
reflection fixes a point of it. Layer 5 has the `DynkinType` datatype with all standard Cartan
matrices and a decidable simply-laced predicate matching the base-level notion
(<https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/RootSystem/DynkinType.html#TauCeti.DynkinType>);
the Cartan-Killing classification theorem is not proved.

**Quiver representations.** Layer 0 is done: the path algebra with its path basis, vertex
idempotents, generation by idempotents and arrows, finite-dimensionality for a finite acyclic quiver,
and the one-loop quiver as the counterexample. Layer 1 has representations as functors, the vertex
simples `Sᵢ`, the indecomposable projectives `Pᵢ` and injectives `Iᵢ` with their universal maps, and
dimension vectors additive on biproducts and short exact sequences. Layer 2 is not the theorem but
its input: indecomposability, Fitting's lemma, and the equivalence of indecomposability with a local
endomorphism ring. Layer 4 has the Euler and Tits forms, their values on simple dimension vectors and
on vertex projectives (including the homological reading), and the vertex reflections that preserve
the Tits form, plus reflection of a quiver at a sink or source. The generalized Kronecker quiver is
worked as an example, including exactly when its Tits form is positive semidefinite. Layers 3, 5
(Gabriel) and 6 (Auslander-Reiten) are untouched.

**Symmetric group and Schur-Weyl.** Layer 0 is done: partitions match Young diagrams and conjugacy
classes of `Sₙ`, the dominance partial order and the lexicographic order are built with dominance
refining lex, and standard Young tableaux are a fintype closed under transposition. Layer 1 has Young
subgroups with their order and index. Layer 2 is done: row and column groups, their disjointness,
row symmetrizer, column antisymmetrizer, the Young symmetrizer with its idempotent-like identities,
and the key vanishing lemma. Layer 3 has the left ideal `ℚ[Sₙ] c_t` as a representation, nonzero and
finite-dimensional, with dimension and character depending only on the shape; the classification of
these as the irreducibles is not there. Layer 5 has hook lengths, arms and legs, monotonicity along
rows and columns, and transposition invariance, but the hook-length formula only for a single row or
a single column. Layers 4 and 6 to 9 are untouched.

**Compact groups.** Layers 0 to 3 are done: normalized Haar probability measure with inversion and
two-sided invariance, Haar averaging as a norm-one operator, Weyl's unitarian trick, complete
reducibility for finite-dimensional unitary representations, and matrix coefficients both pointwise
and as elements of `L²(G)`. Layer 4 is begun rather than finished: the averaging intertwiner and
`ContRepresentation.schur_orthogonality_distinct` are there, but not the orthogonality relation for a
single irreducible. Layers 5 (Peter-Weyl) and 6, and the `SU(2)` engine case, are untouched.

**Classical groups.** Layers 0 and 1 are done. The standard representation exists and is faithful for
`GL`, `SL`, the symplectic group (equivariantly self-dual against the standard alternating form) and
the orthogonal group, with characters computed as matrix traces; determinant powers, tensor,
symmetric and exterior powers of the standard representation are built, the tensor square splits as
symmetric plus exterior, and the `Sd` action on a tensor power is shown to commute with `GL n k`
(the Schur-Weyl setup). Layers 2 to 6 (Weyl construction, weights, Schur polynomials, dimension
formula, branching) are untouched.

**Lie highest weight.** Untouched in the visible record: the diagonal Cartan and general-linear files
were edited without adding declarations.

**Lie groups.** Layer 0 has only its analytic seed: the Banach-algebra exponential as a map into the
group of units, continuous, with the one-parameter subgroup law. Everything else is untouched.

**Spin representations.** Layer 0 is partly built: the degree filtration of a Clifford algebra
(multiplicative, exhaustive, respected by involution, reversal and isometries), the injectivity of
`ι` and of the scalars, and the first filtration step as `R ⊕ M`. The orthogonal group of a quadratic
form, its reflections, and `SO(Q)` as a normal subgroup are in place as a prerequisite for the Pin
and Spin layer. Layers 1 to 9 are untouched.

## The frontier

- **Character theory Layer 3** is the nearest large target and the one most work depends on: the
  character table, the orthogonality relations, and completeness. Layers 0 to 2 and the class algebra
  are already in place, so the missing ingredient is the identification of the Wedderburn blocks with
  irreducible characters. Layer 5 cannot close without it: the eigenrow machinery
  (`isClassEigenrow_of_forall_exists_smul`) characterises the rows, but nothing yet says they are
  characters.
- **Krull-Schmidt** (quiver Layer 2). Fitting's lemma and the local-endomorphism-ring criterion are
  done; the exchange argument for uniqueness of the decomposition is what remains. Gabriel's theorem
  is further off, and needs reflection functors on representations, not just the reflection of a
  quiver and of dimension vectors that exist now.
- **Specht module classification** (Schur-Weyl Layer 4). The key vanishing lemma is the standard input
  and it is proved; what is needed is that `ℚ[Sₙ] c_t` is irreducible and that distinct shapes give
  non-isomorphic modules. The general hook-length formula (Layer 5) is a separate open target.
- **Schur orthogonality for a single irreducible**, then Peter-Weyl (compact groups Layers 4 and 5).
  The averaging intertwiner, `L²` matrix coefficients, and the norm identities are all in place.
- **Skolem-Noether** (semisimple algebras Layer 5), which the double-centralizer theorem and the
  tensor-product results now support, and after it the Brauer group.
- **Mackey decomposition** (induction Layer 3) is the next unbuilt layer on that roadmap; Clifford
  theory (Layer 5) is unusually well prepared, since the conjugate-representation layer it rests on is
  finished.
- **The Weyl construction** (classical groups Layer 2) is closer than its layer number suggests: both
  halves exist separately, the Young symmetrizers on one side and the commuting `Sd` action on tensor
  powers on the other, and joining them is the next step.
- Blocked or waiting on prerequisites: the Cartan-Killing classification (root systems Layer 5) needs
  more Coxeter combinatorics than is recorded; the whole highest-weight roadmap and the classical
  groups above Layer 1 wait on it; the Lie-group roadmap has essentially no infrastructure yet; and
  the spin roadmap cannot reach Pin and Spin without the Clifford structure theorem (Layer 1), which
  the degree filtration was built to serve.

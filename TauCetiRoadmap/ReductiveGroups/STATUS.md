<!--tauceti-status:v1 {"roadmap":"ReductiveGroups","to_sha":"c4d7989a116c565aa558fb82c318ad7c651bf2f4","ts":"2026-08-18T20:34:58Z"}-->
# Status: ReductiveGroups

This file documents the status of the ReductiveGroups roadmap up until `c4d7989` (2026-08-18T20:34:58Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layers 0 through 4 are essentially done: an affine group scheme of finite type
over a field embeds in a general linear group, is recovered from its tensor category of
representations, and its points decompose into semisimple and unipotent parts. Layer 5 has
started, Layer 6 exists only as definitions, and Layers 7 and 8 have not begun; of Layer 9 only
Lie-algebra prerequisites and root subgroups of the classical groups are in place.

### Named results

- **Tannakian reconstruction** — the points of a commutative Hopf algebra over a field are
  exactly the tensor automorphisms of scalar extension on its finite-dimensional comodules
  ([`fgPointTensorIsoEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/Equivalence.html#TauCeti.Tannaka.fgPointTensorIsoEquiv)),
  naturally enough in the value algebra to be an isomorphism of group-valued functors
  ([`pointsFunctorIsoTensorAutFunctor`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/GroupFunctor.html#TauCeti.Tannaka.pointsFunctorIsoTensorAutFunctor)).
- **The multiplicative Jordan decomposition** — over a perfect extension field every point
  factors uniquely as commuting semisimple and unipotent parts, compatibly with homomorphisms
  ([`jordanDecomposition`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Representation/JordanDecomposition/Basic.html#TauCeti.HopfAlgebra.Point.jordanDecomposition),
  [`isSemisimple_isUnipotent_unique`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Representation/JordanDecomposition/Basic.html#TauCeti.HopfAlgebra.Point.isSemisimple_isUnipotent_unique)).
- **The embedding theorem** — every affine group scheme of finite type over a field is a closed
  subgroup of some general linear group
  ([`exists_isClosedImmersion_generalLinear`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Representation/Embedding.html#TauCeti.AffineGroupSchemeCat.exists_isClosedImmersion_generalLinear)),
  proved through finite-dimensional subcoalgebras.
- **Cartier duality** — finite dualization is an anti-equivalence of the category of finite
  locally free bicommutative Hopf algebras over a commutative ring
  ([`cartierDuality`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/HopfAlgebra/FiniteDual/CartierDuality/Basic.html#TauCeti.FiniteLocallyFreeBicommutativeHopfAlgCat.cartierDuality)),
  and commuting with base change.
- **The characterization of tori** — a finite-type commutative Hopf algebra over a field is a
  torus exactly when it is of multiplicative type, geometrically connected and geometrically
  reduced
  ([`iff_multiplicativeType_and_geometricallyConnected_and_geometricallyReduced`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Torus/Characterization.html#TauCeti.torusCommHopfAlgProperty.iff_multiplicativeType_and_geometricallyConnected_and_geometricallyReduced)).

### Notable definitions and infrastructure

- **The fppf quotient sheaf.** The quotient of an affine group by a normal Hopf ideal is a group
  object in fppf sheaves
  ([`fppfQuotientSheaf`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Fppf/Quotient/Basic.html#TauCeti.CommHopfAlgCat.fppfQuotientSheaf)),
  with a locally surjective projection whose kernel pair is the torsor square
  ([`isPullback_fppfQuotientTorsor`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Fppf/Quotient/Torsor.html#TauCeti.CommHopfAlgCat.isPullback_fppfQuotientTorsor)).
  This makes short exact sequences and the component group expressible; representability by a
  scheme is not addressed.
- **The identity component.** `G°` is a closed subgroup scheme with connected carrier
  ([`identityComponentSpec`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Connected/GroupScheme.html#TauCeti.FiniteTypeCommHopfAlgCat.identityComponentSpec)),
  cut out by a normal Hopf ideal, and over an algebraically closed field its component group is
  finite
  ([`instFiniteComponentGroupPoints`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Connected/ComponentGroup/Basic.html#TauCeti.FiniteTypeCommHopfAlgCat.instFiniteComponentGroupPoints)).
- **Unipotence, geometrically.** A group is smooth unipotent when it is smooth and every
  algebraically-closed-valued point acts unipotently in every finite-dimensional representation
  ([`smoothUnipotentCommHopfAlgProperty_iff`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Unipotent/Basic.html#TauCeti.smoothUnipotentCommHopfAlgProperty_iff)),
  the definition reductivity is stated against.

### Roadmap coverage

Layers 0 and 2 are done, as is Layer 1 now that reconstruction has closed. Layer 3 is done except
that quotients are only fppf sheaves and the identity component and component group are currently
developed over an algebraically closed field. Layer 4 is done: Jordan decomposition, groups of
multiplicative type with their Galois module structure on characters and cocharacters, tori with
a perfect character-cocharacter pairing, and Cartier duality. Layer 5 has the definition of
unipotence with its closure properties, `𝔾ₐ` and the upper-unitriangular groups as examples,
solvability of geometric points closed under extensions, and no unipotent radical. Layer 6 has
reductive and semisimple as object properties
([`reductiveCommHopfAlgProperty_iff`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Reductive/Basic.html#TauCeti.reductiveCommHopfAlgProperty_iff))
and linear reductivity separately
([`IsLinearlyReductive`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Coalgebra/Comodule/LinearlyReductive.html#TauCeti.Coalgebra.IsLinearlyReductive)),
but no theorem connecting them and no example of either beyond diagonalizable groups. Layers 7
and 8 are untouched apart from a Borel subgroup of `GL₂` and the weight grading of the adjoint
action. Layer 9 has root subgroups of `GLₙ` and `SLₙ` with the type-A Chevalley commutator
relations, the Serre presentation of split semisimple Lie algebras, and the Kostant integral form
in rank one. Worked examples now include the orthogonal and symplectic groups as Hopf-ideal
quotients of `GLₙ` with their points identified.

## The frontier

- **The unipotent radical.** Layer 5's hard core, and the reason reductivity is currently a
  definition with no examples. Nothing constructs a maximal connected normal unipotent subgroup;
  the closure properties of unipotence are the raw material.
- **A group proved reductive.** `GLₙ`, `SLₙ` and tori are all present and none is known to be
  reductive. The geometric definition requires ruling out unipotent normal subgroups of the base
  change to an algebraic closure, which needs the previous item or a direct argument.
- **Lie-Kolchin.** The flag machinery is conditional: if every nonzero finite-dimensional comodule
  has a nonzero fixed vector then every one has an upper-unitriangular basis
  ([`exists_basis_coefficientMatrix_isUpperUnitriangular_of_fixed_vectors`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Coalgebra/Comodule/Flag/Induction.html#TauCeti.Comodule.exists_basis_coefficientMatrix_isUpperUnitriangular_of_fixed_vectors)).
  The fixed-vector hypothesis is undischarged for solvable or unipotent groups.
- **Root data of a group.** The bracket of weight vectors multiplies weights
  ([`lie_mem_adjointWeightSpace_mul`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Tangent/RootSpace.html#Derivation.lie_mem_adjointWeightSpace_mul)),
  which is the grading a root datum would sit on, but there is no maximal torus inside a larger
  group, no root set, and no Weyl group.
- **Chevalley-Demazure over `ℤ`.** The Serre presentation and the rank-one Kostant form exist; the
  general Kostant form, pinnings, the construction itself and the isomorphism theorem for pinned
  groups do not.

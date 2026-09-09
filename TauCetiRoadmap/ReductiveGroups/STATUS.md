<!--tauceti-status:v1 {"roadmap":"ReductiveGroups","to_sha":"e7f4d8372f5a7ad39a75e61b43864f16d1bb57a0","ts":"2026-09-09T14:34:24+10:00"}-->
# Status: ReductiveGroups

This file documents the status of the ReductiveGroups roadmap up until `e7f4d83` (2026-09-09T14:34:24+10:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layers 0-4 are done, and Layer 7 has just acquired its first general theorems:
maximal tori and Borel subgroups exist. What is missing there is uniqueness, since no conjugacy
statement is available, and with it the root datum of a general reductive group. Layer 8, the
classification, has not begun.

### Named results

- **The Hopf algebra-affine group scheme anti-equivalence** — `Spec` identifies commutative Hopf
  algebras contravariantly with affine group schemes, keeping the roadmap's three models
  interchangeable ([`commHopfAlgCatOpEquivAffineGroupSchemeCat`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AffineGroupScheme/Equivalence.html#TauCeti.commHopfAlgCatOpEquivAffineGroupSchemeCat)).
- **The embedding theorem** — every finite-type affine group scheme over a field is a closed
  subgroup of some general linear group ([`exists_isClosedImmersion_generalLinear`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Representation/Embedding.html#TauCeti.AffineGroupSchemeCat.exists_isClosedImmersion_generalLinear)).
- **Tannakian reconstruction** — a commutative Hopf algebra's points are exactly the tensor
  automorphisms of scalar extension on its finite-dimensional comodules ([`fgPointTensorIsoEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/Equivalence.html#TauCeti.Tannaka.fgPointTensorIsoEquiv)).
- **Existence of maximal tori and Borel subgroups** — every finite-type affine group over a field
  contains a maximal torus ([`exists_isMaximalTorus`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Torus/Existence.html#TauCeti.HopfIdeal.exists_isMaximalTorus)),
  its geometric fibre contains a Borel subgroup ([`exists_geometricBorel`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Borel/Existence.html#TauCeti.HopfIdeal.exists_geometricBorel)),
  and over an algebraically closed field every torus lies inside a Borel. The solvable radical is
  contained in every Borel, and a normal Borel is exactly the solvable radical.
- **Lie-Kolchin** — if the derived subgroup of a reduced finite-type affine group over an
  algebraically closed field is geometrically unipotent, every finite-dimensional representation
  is upper triangular in a suitable basis, with characters on the diagonal ([`exists_basis_coefficientMatrix_isUpperTriangular_of_geometricallyUnipotent_derived`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Solvable/LieKolchin.html#TauCeti.Comodule.exists_basis_coefficientMatrix_isUpperTriangular_of_geometricallyUnipotent_derived)).
  The hypothesis is unipotence of the derived subgroup, not connectedness and solvability, and
  nothing yet links the two.

### Notable definitions and infrastructure

- **Smoothness as geometric reducedness.** For a finite-type commutative Hopf algebra over a field,
  smoothness and geometric reducedness [coincide](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Smooth/GeometricallyReduced.html#TauCeti.smoothCommHopfAlgProperty_iff_geometricallyReduced),
  the criterion the roadmap's standing hypotheses ask for, and it lets smoothness be checked on a
  coordinate ring.
- **The Borel predicate.** [`IsBorel`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Borel/Basic.html#TauCeti.HopfIdeal.IsBorel)
  is stated on Hopf ideals over an arbitrary field by base change to an algebraic closure, so
  concrete groups can be tested against it: the upper-triangular subgroups of `GL₂` and `SL₂` are
  Borel over every field.
- **Group-like weight spaces of comodules.** [`weightSpace`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Coalgebra/Comodule/Weight/Space.html#GroupLike.weightSpace)
  presents a weight space as the joint eigenspace of the coaction components, with independence and
  finiteness on Noetherian comodules: the machine underneath the triangularization results.

### Roadmap coverage

Layers 0-2 and 4 are done. Layer 3 has Hopf ideals, kernels, identity components and fppf
quotients, with a representability result only for the component quotient. Layer 5 has Lie-Kolchin as
above, geometric unipotence, and a criterion making the unipotent radical trivial given a faithful
completely reducible representation, but not the general construction-and-maximality theorem.
Layer 6 has the radicals, the reduced centre, central isogenies, simply connected semisimple groups
as a property, and reductivity for `GLₙ`, `SLₙ`, `Sp₂ₘ` and direct products; the special orthogonal
groups are reductive only in ranks zero and one, and the characteristic-zero equivalence with linear
reductivity and simply connected covers are open. Layer 7 has existence of maximal tori and Borels,
dynamic parabolics, and root data only for `GLₙ`; conjugacy, the Weyl group of a general pair, and
Bruhat decomposition beyond `GL₂` and `SL₂` are absent. Layer 8 is untouched. Layer 9 has explicit
integral carriers for several types with root subgroups, weight tori, Weyl representatives and
Frobenius endomorphisms whose fixed points are the points over the fixed subring, and the
exceptional isogeny of `Sp₄` in characteristic two, but no uniform pinned Chevalley-Demazure
construction and no isomorphism theorem.

## The frontier

- **Conjugacy of Borel subgroups and maximal tori.** Existence is settled; nothing yet says any two
  are conjugate over an algebraically closed field. This is the immediate blocker for defining the
  root datum of a group rather than of `GLₙ`.
- **The unipotent radical.** The general construction of the maximal connected normal smooth
  unipotent closed subgroup, with its maximality, is still missing; what exists are
  characterizations and computations in examples.
- **Root data and Weyl groups of a general reductive group.** Extracting roots from a maximal torus
  and identifying the normalizer quotient as a Weyl group needs conjugacy first, then the split case
  before any Galois or relative theory.
- **Reductivity of the special orthogonal groups.** The standard comodule is faithful, and simple
  in dimension at least three away from characteristic two, which is the input; the conclusion is
  proved only for `SO₀` and `SO₁`.
- **A uniform pinned Chevalley-Demazure construction.** The carriers exist type by type, with
  root-subgroup and torus data and, for `B₂`, `F₄` and `G₂`, a special isogeny only at torus level.
  A single construction from a root datum, and the isomorphism theorem for pinned groups, remain to
  be built.

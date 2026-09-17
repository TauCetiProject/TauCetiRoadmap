<!--tauceti-status:v1 {"roadmap":"ReductiveGroups","to_sha":"890ee2c15e6cc392ab851708562a109a4b010a89","ts":"2026-09-12T19:06:17Z"}-->
# Status: ReductiveGroups

This file documents the status of the ReductiveGroups roadmap up until `890ee2c` (2026-09-12T19:06:17Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layers 0-2 and 4 are done, and the four classical families are now all known to be
reductive. Layer 7 has existence of maximal tori and Borel subgroups but no conjugacy, which keeps
the root datum of a general reductive group out of reach; Layer 8 has not begun, and Layer 9 has
carriers type by type rather than one construction.

### Named results

- **The Hopf algebra-affine group scheme anti-equivalence** — `Spec` identifies commutative Hopf
  algebras contravariantly with affine group schemes, keeping the roadmap's three models
  interchangeable ([`commHopfAlgCatOpEquivAffineGroupSchemeCat`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AffineGroupScheme/Equivalence.html#TauCeti.commHopfAlgCatOpEquivAffineGroupSchemeCat)).
- **The embedding theorem** — every finite-type affine group scheme over a field is a closed
  subgroup of some general linear group ([`exists_isClosedImmersion_generalLinear`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Representation/Embedding.html#TauCeti.AffineGroupSchemeCat.exists_isClosedImmersion_generalLinear)).
- **Tannakian reconstruction** — a commutative Hopf algebra's points are exactly the tensor
  automorphisms of scalar extension on its finite-dimensional comodules ([`fgPointTensorIsoEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/Equivalence.html#TauCeti.Tannaka.fgPointTensorIsoEquiv)).
- **Reductivity of the classical groups** — `GLₙ`, `SLₙ` and `Sp₂ₘ` are reductive over every field,
  and [`SOₙ` in every dimension](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/SpecialOrthogonal/Reductive.html#TauCeti.SpecialOrthogonal.reductiveCommHopfAlgProperty_finiteTypeCoordinateHopfAlgebra)
  over every field of characteristic different from two. The orthogonal case runs through
  Cartan-Dieudonné and a Laurent-polynomial path to the identity; characteristic two is excluded.
- **Existence of maximal tori and Borel subgroups** — every finite-type affine group over a field
  contains a maximal torus ([`exists_isMaximalTorus`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Torus/Existence.html#TauCeti.HopfIdeal.exists_isMaximalTorus)),
  its geometric fibre contains a Borel ([`exists_geometricBorel`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Borel/Existence.html#TauCeti.HopfIdeal.exists_geometricBorel)),
  and the solvable radical is contained in every Borel. The diagonal tori of `GLₙ` and
  [`Sp₂ₘ`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Symplectic/DiagonalTorus/Maximal.html#TauCeti.Symplectic.isMaximalTorus_diagonalTorusDefiningIdeal)
  are maximal over every field. Nothing says two maximal tori, or two Borels, are conjugate.

### Notable definitions and infrastructure

- **Smoothness as geometric reducedness.** For a finite-type commutative Hopf algebra over a field,
  smoothness and geometric reducedness [coincide](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Smooth/GeometricallyReduced.html#TauCeti.smoothCommHopfAlgProperty_iff_geometricallyReduced),
  the criterion the roadmap's standing hypotheses ask for, and it lets smoothness be checked on a
  coordinate ring.
- **The Borel predicate.** [`IsBorel`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Borel/Basic.html#TauCeti.HopfIdeal.IsBorel)
  is stated on Hopf ideals over an arbitrary field by base change to an algebraic closure, so
  concrete groups can be tested against it.
- **The pinned Geck carrier as a group functor.** Its points are now
  [functorial in the value ring](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/RootSystem/SimplyConnectedRootDatum/GeckLattice/PointsFunctor.html#TauCeti.DynkinType.geckPointsMap)
  and carry Weyl representatives, a graph automorphism and a twisted Frobenius, what the finite
  groups of Lie type are to be built from.

### Roadmap coverage

Layers 0-2 and 4 are complete. Layer 3 has Hopf ideals, kernels, identity components and fppf
quotients, representable only for the component quotient. Layer 5 has geometric unipotence,
Lie-Kolchin under a hypothesis on the derived subgroup rather than solvability, and recognition
criteria identifying a given connected normal smooth unipotent kernel as the unipotent radical, but
not a general maximality theorem. Layer 6 has the radicals, the centre with base-change and
finiteness criteria, central isogenies, simple connectivity as a property, and the classical groups
above; the characteristic-zero equivalence with linear reductivity and simply connected covers are
open. Layer 7 has existence as above, dynamic parabolics and Levis, with the `GLₙ` weight Levis shown
smooth, geometrically connected and of
[trivial unipotent radical](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/GeneralLinear/Weight/Levi/UnipotentRadical.html#TauCeti.GeneralLinear.unipotentRadicalDefiningIdeal_weightLeviFiniteTypeCoordinateHopfAlgebra),
and root data only for `GLₙ`. Layer 8 is untouched. Layer 9 has integral carriers for several types
with root subgroups, weight tori, Weyl representatives, Frobenius and twisted-Frobenius
endomorphisms whose fixed points are the points over the fixed subring, G₂ short-pair commutator
relations, and the exceptional isogeny of `Sp₄` in characteristic two, but no uniform construction
and no isomorphism theorem.

## The frontier

- **Conjugacy of Borel subgroups and maximal tori.** Existence is settled; nothing yet says any two
  are conjugate over an algebraically closed field. This is the immediate blocker for the root datum
  of a group rather than of `GLₙ`.
- **Root data and Weyl groups of a general reductive group.** Extracting roots from a maximal torus
  and identifying the normalizer quotient as a Weyl group needs conjugacy first. Torsion-freeness of
  the character lattice is an input, not the theorem.
- **The unipotent radical.** What exists are computations in examples and criteria recognising a
  candidate kernel as the radical; the general maximality statement for the maximal connected normal
  smooth unipotent closed subgroup is still missing.
- **Non-split tori and forms.** Galois descent now produces a Hopf algebra from the invariants of a
  split group algebra, and recovers the split one after scalar extension. The absolute root datum
  with its Galois action, and relative root systems, have not been attempted.
- **A uniform pinned Chevalley-Demazure construction.** Carriers exist type by type with root
  subgroups and torus data, and `B₂`, `F₄` and `G₂` have a special isogeny only at torus level. A
  single construction from a root datum, and the isomorphism theorem for pinned groups, remain.

<!--tauceti-status:v1 {"roadmap":"ReductiveGroups","to_sha":"f7aaa6df91011d8623d880c19e6cc3f69e1d46f4","ts":"2026-08-12T11:39:43+10:00"}-->
# Status: ReductiveGroups

This file documents the status of the ReductiveGroups roadmap up until `f7aaa6d` (2026-08-12T11:39:43+10:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layers 0 and 2 are done, and Layer 1 is done but for Tannakian reconstruction: an
affine group scheme of finite type over a field provably embeds in a general linear group, and the
tangent Lie algebra with its adjoint action exists. Layers 3 and 4 are partial, and Layers 5
through 9 — unipotence, reductivity, root data, classification — have not begun.

### Named results

- **The embedding theorem** — every affine group scheme of finite type over a field is a closed
  subgroup of some general linear group
  ([`exists_isClosedImmersion_generalLinear`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Representation/Embedding.html#TauCeti.AffineGroupSchemeCat.exists_isClosedImmersion_generalLinear)),
  proved through finite-dimensional subcoalgebras rather than bare Noetherianity.
- **Faithfulness is generation by matrix coefficients** — a finite free comodule gives a closed
  immersion into `GLₙ` exactly when its matrix coefficients and their antipode images generate the
  coordinate Hopf algebra
  ([`isClosedImmersion_coordinateGroupSchemeHom_iff_matrixCoefficientSubalgebra_sup_antipode_eq_top`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Representation/Faithful.html#TauCeti.Comodule.isClosedImmersion_coordinateGroupSchemeHom_iff_matrixCoefficientSubalgebra_sup_antipode_eq_top)),
  the roadmap's definition rather than injectivity of a coaction.
- **The Hopf/affine-group-scheme anti-equivalence** — `Spec` is an anti-equivalence from commutative
  `S`-Hopf algebras onto affine group schemes over `Spec S`
  ([`commHopfAlgCatOpEquivAffineGroupSchemeCat`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AffineGroupScheme/Equivalence.html#TauCeti.commHopfAlgCatOpEquivAffineGroupSchemeCat)),
  restricting to the finite-type objects on both sides
  ([`finiteTypeCommHopfAlgCatOpEquivFiniteTypeAffineGroupSchemeCat`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AffineGroupScheme/FiniteType.html#TauCeti.finiteTypeCommHopfAlgCatOpEquivFiniteTypeAffineGroupSchemeCat)),
  smoothness matching likewise.
- **The fundamental theorem of comodules** — every element of a coalgebra over a field lies in a
  finite-dimensional subcoalgebra
  ([`exists_finiteDimensional_subcoalgebra_mem`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Coalgebra/Subcoalgebra/Finite.html#TauCeti.Subcoalgebra.exists_finiteDimensional_subcoalgebra_mem)),
  now also over a principal ideal domain. It drives both the embedding theorem and reconstruction.
- **Classification of closed subgroup schemes** — Hopf ideals of `H` under reverse inclusion are
  order-isomorphic to closed subgroup schemes of `Spec H`
  ([`hopfIdealOrderIsoClosedSubgroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/HopfIdeal/Scheme/Classification.html#TauCeti.CommHopfAlgCat.hopfIdealOrderIsoClosedSubgroup)),
  kernels being the extended augmentation ideal.

### Notable definitions and infrastructure

- **The Lie algebra with its adjoint action.** Counit-valued derivations are dual to the cotangent
  space at the identity
  ([`CotangentSpace`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Tangent/Cotangent.html#TauCeti.Bialgebra.CotangentSpace)),
  and points act on them by convolution conjugation, giving `Ad` both as a representation of the
  functor of points and as a comodule
  ([`adjointPointRepresentation`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Tangent/Representation.html#TauCeti.Derivation.adjointPointRepresentation)).
  Closed subgroups have Lie algebras with an exact conormal sequence, and `Lie(GLₙ)`, `Lie(SLₙ)` are
  the matrix and trace-zero matrix Lie algebras.
- **Tensor automorphisms of scalar extension.** Scalar extension from finite comodules is strong
  monoidal, and each point induces a tensor automorphism of it
  ([`fgPointTensorIso`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/Monoidal.html#TauCeti.Tannaka.fgPointTensorIso)).
  Reconstruction is a statement about this object, where the semisimple and unipotent parts of a
  point currently live.
- **Normality and quotients at the presheaf level.** A Hopf ideal is normal when the conjugation
  coordinate morphism carries it into `H ⊗ I`
  ([`IsNormal`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/HopfIdeal/Normal.html#TauCeti.HopfIdeal.IsNormal)),
  equivalently when it cuts out a normal subgroup of `G(A)` for every `A`; the quotient
  `A ↦ G(A)/V(I)(A)` is then a presheaf, awaiting sheafification.

### Roadmap coverage

Layer 0 is done, now with base change of Hopf algebras and of affine group schemes. Layer 1 is
complete except Tannakian reconstruction, half proved: points act faithfully by tensor
automorphisms and each tensor automorphism yields a point recovering it, but not conversely. Layer 2
is done apart from the smoothness criterion through `Lie(G)`; smoothness exists only as a property
matched across the anti-equivalence. Layer 3 has Hopf ideals, closed subgroups, kernels, normality,
the presheaf quotient and geometric connectedness, but no sheaf quotient and no `G°` or `π₀`. Layer 4 has the diagonalizable anti-equivalence, `μ_n`, split tori with their perfect
character-cocharacter pairing and Jordan–Chevalley decomposition of linear automorphisms, but no
Jordan decomposition of group elements, no multiplicative type, no non-split tori, no Cartier
duality. Layers 5 through 8 are untouched; of Layer 9 only the `p^n`-power Frobenius on points
exists. The sheaves-and-descent lane has faithfully flat descent for the points of a Hopf algebra
and nothing else. Worked examples cover `𝔾ₐ`, `𝔾ₘ`, `μ_n`, `αₚ`, split tori, `GLₙ` and `SLₙ`, but
not `PGLₙ`, `SOₙ` or `Sp₂ₙ`. Almost everything is over a general commutative base.

## The frontier

- **Tannakian reconstruction.** What remains is that a tensor automorphism agrees with the one
  induced by its reconstructed point; the global functional, its multiplicativity and faithfulness
  of the point action are in place, parts of them over a principal ideal domain with the Hopf
  algebra free.
- **Jordan decomposition of group elements.** The semisimple and unipotent parts of a point's
  actions form commuting tensor automorphisms with product the point; turning them into points is
  what the missing half of reconstruction supplies.
- **Quotients `G/H`.** The pointwise quotient presheaf exists for a normal Hopf ideal; the fppf
  topology, sheafification and the rest of the descent lane do not, and representability is a
  theorem with hypotheses rather than a construction.
- **The identity component and `π₀`.** Nothing splits the coordinate ring by idempotents to produce
  `G°`, and finiteness of `π₀` under smoothness is untried.
- **Unipotence and reductivity.** Layers 5 and 6 are empty; with the adjoint representation now
  available, the unipotent radical is the next real obstacle.

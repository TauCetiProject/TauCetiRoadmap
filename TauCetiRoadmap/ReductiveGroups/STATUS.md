<!--tauceti-status:v1 {"roadmap":"ReductiveGroups","to_sha":"11ef09d4d6e560655ed762ace27ef2858e9117cd","ts":"2026-08-03T18:31:13Z"}-->
# Status: ReductiveGroups

This file documents the status of the ReductiveGroups roadmap up until `11ef09d` (2026-08-03T18:31:13Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer 0 is done: the anti-equivalence between commutative Hopf algebras and
affine group schemes exists, and all three of the roadmap's views are explicitly identified with
one another. Layer 1 has its structural theorems and its rigid tensor category but not
faithfulness, the embedding theorem or Tannakian reconstruction; Layer 2 is begun; Layers 3 and 4
are partly built; Layers 5 through 8 and the sheaf-and-descent lane have not started.

### Named results

- **The Hopf/affine-group-scheme anti-equivalence** — `Spec` is an anti-equivalence from
  commutative `S`-Hopf algebras onto affine group schemes over `Spec S`, assembled from Mathlib's
  `hopfSpec` and a Hopf-algebra structure on the global sections of an affine group scheme
  ([`commHopfAlgCatOpEquivAffineGroupSchemeCat`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AffineGroupScheme/Equivalence.html#TauCeti.commHopfAlgCatOpEquivAffineGroupSchemeCat)).
  It closes the two `Suggested.lean` targets that were the roadmap's stated bottleneck.
- **Classification of closed subgroup schemes** — the Hopf ideals of `H` under reverse inclusion
  are order-isomorphic to the closed subgroup schemes of `Spec H`
  ([`hopfIdealOrderIsoClosedSubgroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/HopfIdeal/Scheme/Classification.html#TauCeti.CommHopfAlgCat.hopfIdealOrderIsoClosedSubgroup)).
  Kernels are the case of the extended augmentation ideal, and are the scheme-theoretic fibre over
  the identity.
- **The fundamental theorem of comodules** — every element of a coalgebra over a field lies in a
  finite-dimensional subcoalgebra
  ([`exists_finiteDimensional_subcoalgebra_mem`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Coalgebra/Subcoalgebra/Finite.html#TauCeti.Subcoalgebra.exists_finiteDimensional_subcoalgebra_mem)),
  with a module-finite version over a principal ideal domain, and every comodule over a free
  coefficient coalgebra is the supremum of its finite subcomodules
  ([`sSup_finiteSubcomodules_eq_top`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Coalgebra/Subcomodule/Finite.html#TauCeti.Subcomodule.sSup_finiteSubcomodules_eq_top)).
- **Rigidity of finite comodules** — finite-dimensional comodules over a commutative Hopf algebra
  form a rigid symmetric monoidal category, duals carrying the antipode-twisted coaction
  ([`FGComoduleCat.instRigidCategory`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Coalgebra/Comodule/Finite/Rigid.html#TauCeti.FGComoduleCat.instRigidCategory)).
  This is the tensor category any Tannakian statement will be about.
- **Diagonalizable groups are finitely generated abelian groups** — those groups, with arrows
  reversed, are equivalent to diagonalizable group schemes
  ([`schemeEquivalence`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/DiagonalizableGroup/Equivalence.html#TauCeti.DiagonalizableGroup.schemeEquivalence)),
  completing an anti-equivalence that previously had only its easy direction. Fullness needs the
  base to have connected prime spectrum.

### Notable definitions and infrastructure

- **The tangent space at the identity, as a Lie algebra.** Dual-number points over the identity
  are the derivations at the counit, and the convolution commutator makes them a Lie algebra
  ([`Derivation.instLieAlgebra`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Tangent/Lie/Basic.html#TauCeti.Derivation.instLieAlgebra)),
  with the differential of a Hopf morphism a Lie morphism. This is `Lie(G)`; nothing is built on it.
- **The representation ⇆ comodule dictionary.** Natural actions of the functor of points on a
  module correspond to comodule structures
  ([`pointRepresentationEquivComodule`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Representation/Comodule/Basic.html#TauCeti.HopfAlgebra.pointRepresentationEquivComodule)),
  so comodule results can be read as statements about representations.
- **`GLₙ` and `SLₙ` as group schemes**, with scheme-valued points identified with the ordinary
  matrix groups
  ([`GeneralLinear.schemePointsMulEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/GeneralLinear/Scheme.html#TauCeti.GeneralLinear.schemePointsMulEquiv)),
  `SLₙ` a closed subgroup cut out by the determinant. `GLₙ` is what the embedding theorem targets.

### Roadmap coverage

Layer 0 is done, third view included: the points functor is corepresentable, full and faithful.
Layer 1 has comodules, subcomodules, matrix coefficients and their subalgebra, duals, rigidity and
the finiteness theorems, but not faithfulness as a closed immersion, its matrix-coefficient
criterion, the embedding theorem or Tannakian reconstruction. Layer 2 has the tangent space, the
bracket and the differential, and no adjoint action or smoothness criterion. Layer 3 has Hopf
ideals, closed subgroup schemes, kernels and quotient Hopf algebras, but no normality, no `G/H`,
no identity component or component group. Layer 4 has the diagonalizable anti-equivalence, `μ_n`
inside `𝔾ₘ`, and split tori with their perfect pairing; non-split tori, multiplicative type,
Cartier duality and Jordan decomposition are absent. Layers 5 through 8 and the sheaves-and-descent
lane are untouched. Worked examples cover `𝔾ₐ`, `𝔾ₘ`, `μ_n`, `αₚ`, split tori, `GLₙ` and `SLₙ`;
`PGLₙ`, `SOₙ` and `Sp₂ₙ` are absent. Everything is over a general commutative base ring, with
field, domain or connected-spectrum hypotheses added exactly where needed.

## The frontier

- **Faithfulness and the embedding theorem.** The pieces are close together: a `hopfSpec` morphism
  is a closed immersion exactly when the coordinate map is surjective, the matrix-coefficient
  subalgebra exists, and the finite subcoalgebra theorem is the engine the roadmap named. Missing
  are the equivalence of the two definitions of faithful, and then `G ↪ GLₙ`.
- **Tannakian reconstruction**, newly expressible now that the rigid symmetric monoidal category
  of finite-dimensional comodules exists. Nothing attempted.
- **The adjoint representation.** `Lie(G)` and the differential exist; `Ad : G → GL(Lie G)` does
  not, and Jordan decomposition, root spaces and the unipotent radical all wait on it.
- **Quotients and the identity component.** Both need the sheaf-and-descent lane, which has not
  started; the identity component also needs base change to `k̄` and geometric connectedness.
- **Root data.** The split torus pairing is still the only input in place: no maximal torus in a
  larger group, no root, no Weyl group, and the intervening unipotence and reductivity layers have
  not begun.

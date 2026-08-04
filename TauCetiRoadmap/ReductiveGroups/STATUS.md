<!--tauceti-status:v1 {"roadmap":"ReductiveGroups","to_sha":"ed837d596f81c587c5b9696efed02a869f945e7e","ts":"2026-07-29T20:34:58-04:00"}-->
# Status: ReductiveGroups

This file documents the status of the ReductiveGroups roadmap up until `ed837d5` (2026-07-29T20:34:58-04:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**Cross-cutting prerequisite: sheaves and descent.** Untouched. Nothing in the declaration list
mentions presheaves on `CommAlgCat k`, representability, fppf sheafification, torsors, or
faithfully flat descent.

**Layer 0: the functor of points and the three-way dictionary.** Partly done, and unevenly. The
functor-of-points view is real: `R`-algebra homomorphisms out of a Hopf algebra form a group under
convolution with inverse `f ∘ S`
([`AlgHom.instGroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/FunctorOfPoints.html#TauCeti.AlgHom.instGroup)),
abelian when the Hopf algebra is cocommutative, and this is packaged as a functor in the value
algebra
([`HopfAlgebra.pointsFunctor`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/PointsFunctor.html#TauCeti.HopfAlgebra.pointsFunctor)).
Points of a tensor product are the product of the points
([`AffineGroup.Product.pointsMulEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Product.html#TauCeti.AffineGroup.Product.pointsMulEquiv)),
naturally in the value algebra, and the trivial group has the expected one-element functor of
points. The other two views are not there. There is no group object in schemes anywhere in the
declaration list, no `Spec`/`Γ` translation, no anti-equivalence `(CommHopfAlg k)ᵒᵖ ≌ AffGrpSch k`,
and no third view by representable group functors; the two scheme-side examples in
`Suggested.lean` are still stated with `sorry`. A base-change lane exists in the source tree
(modules for base change of Hopf algebras, of the standard examples, and of the category of
commutative Hopf algebras), but no new declarations landed in those modules in this window, so
this report cannot say what they contain.

**Layer 1: representations = comodules.** The comodule half is substantially built; the
representation-theoretic half is not. Comodules over a coalgebra exist
([`Comodule`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Coalgebra/Comodule/Basic.html#TauCeti.Comodule)),
with morphisms forming an `R`-module, a preadditive category `ComoduleCat` with a zero object and
binary products, trivial, group-like, regular, and cofree comodules, corestriction, transport
along linear equivalences, a full subobject theory (lattice of subcomodules, inverse images,
kernels, induced coactions, quotients with lifts and uniqueness), and the corresponding
subcoalgebra lattice, images, group-like spans, and order embedding into subcomodules of the
regular comodule. Over a bialgebra there is the diagonal tensor product
([`Comodule.tensor`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Coalgebra/Comodule/TensorProduct.html#TauCeti.Comodule.tensor)),
and finitely generated comodules form a monoidal category
([`FGComoduleCat.instMonoidalCategory`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Coalgebra/Comodule/Finite/Monoidal.html#TauCeti.FGComoduleCat.instMonoidalCategory)).
Missing, and these are the parts the roadmap cares about: duals, so the monoidal category is not
rigid; the finite-dimensional subcoalgebra theorem (every element lies in a finite-dimensional
subcoalgebra, every comodule is the union of its finite-dimensional subcomodules); the
representation ⇆ comodule dictionary; faithfulness as a closed immersion and its equivalence with
matrix coefficients generating `A`; the embedding theorem; Tannakian reconstruction. Matrix
coefficients themselves exist and are now known to be multiplicative on tensor products
([`Comodule.matrixCoefficientSubmodule_mul_le`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Coalgebra/Comodule/MatrixCoefficient/TensorProduct.html#TauCeti.Comodule.matrixCoefficientSubmodule_mul_le)),
which is a step toward the faithfulness criterion and not the criterion.

**Layer 2: Lie algebra and the adjoint representation.** Untouched. No tangent space at the
identity, no `Lie(G)`, no differential of a homomorphism, no `Ad`.

**Layer 3: subgroups, quotients, components.** Partly done, on the Hopf side only. Quotient
bialgebras by two-sided coideals have their universal property
([`Bialgebra.Quotient.liftBialgHom`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Bialgebra/Quotient.html#Bialgebra.Quotient.liftBialgHom)),
the kernel of a surjective bialgebra morphism is a Hopf ideal and the quotient by it is
bialgebra-equivalent to the codomain
([`HopfIdeal.kerLiftBialgEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/HopfAlgebra/Kernel.html#TauCeti.HopfIdeal.kerLiftBialgEquiv)),
and Hopf ideals pull back along surjections compatibly with joins and suprema
([`HopfIdeal.comap`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/HopfAlgebra/HopfIdeal/Comap.html#TauCeti.HopfIdeal.comap)).
Not there: the anti-equivalence between Hopf ideals and closed subgroup schemes, normality via the
adjoint coaction, the fppf sheaf quotient `G/H` and any representability theorem for it, short
exact sequences, the identity component, and the component group.

**Layer 4: Jordan decomposition, diagonalizable groups, tori.** The diagonalizable and torus lane
is the furthest advanced part of the roadmap. Characters and cocharacters of `D(M)` are
homomorphisms of group functors, they pair to an integer
([`DiagonalizableGroup.pairing`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Cocharacter.html#TauCeti.DiagonalizableGroup.pairing)),
the pairing is bilinear and is realized on points by a power endomorphism of `𝔾ₘ`, `μ_n` is the
kernel of the `n`-th power endomorphism
([`RootsOfUnityGroup.range_inclusion`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/RootsOfUnity/Kernel.html#TauCeti.RootsOfUnityGroup.range_inclusion)),
and for a split torus of finite rank the character and cocharacter lattices pair perfectly
([`SplitTorus.instIsPerfPair`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/SplitTorus/Cocharacter.html#TauCeti.SplitTorus.instIsPerfPair)).
The anti-equivalence `M ↦ D(M)` between finitely generated abelian groups and diagonalizable
groups has one direction only, the coordinate-ring functor
[`DiagonalizableGroup.coordinateRingFunctor`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/DiagonalizableGroup/FiniteType.html#TauCeti.DiagonalizableGroup.coordinateRingFunctor)
out of the category of finitely generated commutative groups; full faithfulness and essential
surjectivity are not proved. Non-split tori, groups of multiplicative type in general, Cartier
duality, and Jordan decomposition are all untouched.

**Layer 5: solvable and unipotent groups; the unipotent radical.** Untouched. No definition of
unipotence, no Lie–Kolchin, no unipotent radical.

**Layer 6: reductive and semisimple groups.** Untouched. Neither definition of reductivity is
stated, and neither is linear reductivity.

**Layer 7: structure theory.** Untouched. No Borel or parabolic subgroups, no maximal tori inside
a larger group, no root datum, no Weyl group, no Bruhat decomposition or BN-pairs. The perfect
character–cocharacter pairing of Layer 4 is the input this layer will consume, and it is the only
piece of it in place.

**Layer 8: classification and existence.** Untouched, as expected at this stage.

**Worked examples.** `𝔾ₐ` (with its Frobenius endomorphism), `𝔾ₘ`, `μ_n`, `αₚ`, split tori of
arbitrary rank, the trivial group, and products of affine groups are all exercised on the functor
of points. `GLₙ`, `SLₙ`, `PGLₙ`, `SOₙ`, and `Sp₂ₙ` do not appear anywhere in the declaration list.
`αₚ` is doing the job the roadmap assigned it: its coordinate ring is provably non-reduced, and it
has only the identity point over a reduced algebra, so a naive reduced-points definition of
anything would already be visibly wrong.

One standing caveat that cuts across all of the above: the whole development is stated over a
general commutative base ring `R`, not over a field `k`. That is more general than the roadmap's
starting hypothesis and costs nothing so far, but every geometric notion the later layers need
(connectedness, smoothness, unipotence, reductivity) is defined after base change to `k̄` and none
of that has been set up.

## The frontier

The nearest targets, roughly in order of how little stands between them and the current state:

- **Duals of finitely generated comodules**, upgrading `FGComoduleCat` from monoidal to rigid.
  The monoidal structure is finished, so this is the immediate next step in Layer 1 and a
  prerequisite for anything Tannakian.
- **The finite-dimensional subcoalgebra theorem**: every element of a coalgebra lies in a
  finitely generated subcoalgebra, and every comodule is the union of its finitely generated
  subcomodules. The groundwork is in place (the subcoalgebra lattice with its finiteness lemmas,
  spans of group-like elements, subcoalgebras as subcomodules of the regular comodule), and the
  roadmap identifies this as the real engine behind the embedding theorem.
- **Full faithfulness and essential surjectivity of the diagonalizable coordinate-ring functor**,
  which would close out the `M ↦ D(M)` anti-equivalence. The functor exists; the two remaining
  properties are self-contained.
- **The two Layer 0 scheme-side targets** in `Suggested.lean`: `Γ(G)` as a Hopf algebra for an
  affine group scheme `G` over `Spec R`, and `Spec A` as a group object for a Hopf algebra `A`.
  These are still `sorry`, and they are the bottleneck for a large amount of downstream work: the
  correct definition of faithfulness (a closed immersion `G ↪ GLₙ`), scheme-theoretic kernels as
  opposed to the kernels-on-points computed so far, the fppf quotient `G/H`, and every geometric
  notion in Layers 3, 5, and 6. Anyone wanting to unblock the most work should start here.
- **`GLₙ` as a worked example.** Nothing in the current development names it, and it is needed
  both as a check on the definitions and as the target of the embedding theorem.
- **Layer 2 in its entirety** (`Lie(G)`, differentials, the adjoint action). It is untouched, it
  has no prerequisites that are missing, and the roadmap places it early precisely because Jordan
  decomposition, root spaces, and the unipotent radical all wait on it.

Blocked rather than merely unstarted: unipotence, the unipotent radical, reductivity, and the
identity component all need base change to `k̄` and a geometric notion of connectedness, and the
declaration list contains neither. Working over a general commutative ring rather than a field, as
the current development does, will have to be revisited at that point, since these notions are
field-specific.

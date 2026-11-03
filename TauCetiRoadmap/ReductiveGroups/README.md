# Roadmap: reductive algebraic groups

**Summary.** Build the general theory of affine group schemes from Hopf algebras,
comodules and scheme group objects, through orbit geometry, reductive structure and
Lang–Steinberg, to integral PBW, pinned integral models, highest-weight classification
and spectral Weyl monodromy. The theory supplies algebraic groups for the Langlands
programme and automorphic forms. Suggested home: `TauCeti/Algebra/AlgebraicGroup/` (foundations) and
`TauCeti/AlgebraicGeometry/` (the scheme-side dictionary).

The marker `⚠` identifies a common mathematical trap, followed immediately by its correction.

## Scope and ownership

This roadmap extends its existing group/Hopf/points programme. It owns the group-specific
comparison maps, orbit geometry, reductive structure, full-root-datum integral construction,
rational representation theory and spectral quotient. Generic descent is supplied by
SchemeAndStackFoundations §§1.1, 1.14–1.18 and ModularCurves §§0E–0F; Layer 8 applies it
to reductive groups rather than defining another descent theory. RootSystems Layers 5–6
owns the abstract root data and diagram theory; the group extraction and integral realization
are the distinct targets here. Section 3A.5 owns the classical topology on complex
scheme points and its smooth-chart and properness comparisons; §11.0 supplies the
group-operation and tangent-bracket adapters. This topological and smooth prefix
does not construct full ringed analytification with its analytic structure sheaf
and nilpotents.

The general Lang theorem and finite-field exactness belong to Layer 7a; rational
cohomology and cotensor induction to §1.1; the group-specific analytic dictionary to §11.0.
ReductiveGroupsPartII, IntegralHeckeAndGaloisDeterminants and FormalConnectionsOpers
are consumers of those interfaces. The finite-presentation Weil restriction used in Layer 8
comes directly from ModularCurves §0F. No arbitrary-affine extension of that construction
is needed for the finite-type group examples over fields.

The counit-derivation bracket, Lie-hom differential and point adjoint representation
are supplied by Tau Ceti’s tangent modules, as are augmentation cotangent duality
and the affine Zariski-cotangent comparison. Layer 2 owns their compatibility with
the scheme group-object dictionary, scheme kernels and the represented algebraic
adjoint morphism; it does not reconstruct those native operations.

Layer 4 uses Tau Ceti’s point Jordan decomposition, diagonalizable group-scheme
anti-equivalence, multiplicative-type and torus predicates, and geometric lattice
pairing. Its additional targets compare those carriers through the group-object
dictionary and extend Galois classification from the native perfect-field case
to arbitrary fields. Finite locally free commutative Cartier duality belongs to
ModularCurves §0B; it is distinct from diagonalizable character duality.

The Hopf-ideal object, its quotient Hopf algebra and its order-reversing
classification of closed subgroup schemes are supplied by Tau Ceti. So are
normality in conjugation coordinates, the fppf quotient sheaf, and its affine
coinvariant representation when the ambient group is geometrically reduced.
Layer 3 extends the quotient comparison to arbitrary finite-type affine groups
over fields and descends the identity component from algebraically closed fields;
it constructs the finite étale component group without a smoothness assumption.
RootSystems Layer 4 supplies the chamber action. The generic Weyl/based
factorization belongs to RootSystems; its required extension is specified by
**gap:root-automorphism-based-factorization** in the supplier contract below.
The main RootSystems roadmap does not state this factorization. Section 9A.1a-L
owns only its signed-cover and full-Y transport applications.
The unipotent and solvable radical Hopf ideals, geometric reductivity and
semisimplicity predicates, reduced geometric unipotent embedding and
Lie–Kolchin theorem are supplied by Tau Ceti. Layers 5–6 compare these with
scheme subgroups and extend the unipotence criterion to nonreduced groups;
they do not construct a second radical or prove Lie–Kolchin again.
The affine Hopf/group-scheme anti-equivalence, rational point-representation/comodule
equivalence, finite subcoalgebra and subcomodule theorems, faithful coefficient
criterion, and closed embedding into GLₙ over a field are supplied by Tau Ceti.
Layers 0–1 retain the scheme/points/descent and Tannakian comparison diagrams;
they do not reconstruct these equivalences or the embedding theorem.

## Conventions

State hypotheses separately; **do not** bundle them into one mega-class. Work over a field
`k` to start and state each result at its own generality.

Keep **two distinct notions**, and never make smoothness implicit:
- an **affine group scheme of finite type** over `k`: a commutative Hopf `k`-algebra `A`
  finitely generated as a `k`-algebra. This admits `μ_p`, `αₚ`, and other non-smooth /
  non-reduced groups, and is the right default generality.
- a **smooth** such group (an "algebraic group" in the classical sense): add smoothness
  as a named hypothesis. For group schemes locally of finite type over a *field*,
  smoothness ⇔ geometric reducedness of `A` (a fact special to the homogeneous,
  finite-type-over-a-field setting, *not* a general commutative-algebra equivalence; in
  characteristic 0 every such group is automatically smooth, by Cartier).

There will be **no** monolithic `LinearAlgebraicGroup`/`Variety` definition. Like
Mathlib, we state exactly the hypotheses each result needs.

### Three synchronized models

Maintain **three equivalent views** of an affine algebraic group and the explicit
equivalences between them, so any proof can work in whichever is most convenient:

1. **Commutative Hopf algebras** over `k` (the coordinate ring `A`).
2. **Group objects in schemes over `Spec k`**: `GrpObj (G.asOver (Spec k))`, with
   `[G.Over (Spec k)]` and `[IsAffine G]` kept as separate hypotheses.
3. **The functor of points**: a representable group-valued functor `R ↦ Homₖ(A, R)`.

Representations are then **comodules over `A`**, and we keep the
representation ⇆ comodule ⇆ Tannakian dictionary in sync throughout. Wherever there is
a modelling fork (Hopf-ideal kernel vs. scheme-theoretic kernel; root data vs. dynamic
parabolics; reductive-via-unipotent-radical vs. linearly-reductive), **do both and
prove them equivalent** rather than committing.

## Exact supplier contracts

### From Mathlib

- **Hopf/coalgebra algebra:** `Mathlib/RingTheory/HopfAlgebra/{Basic,GroupLike,TensorProduct}.lean`,
  `Mathlib/RingTheory/Coalgebra/{Convolution,GroupLike}.lean`.
- **Categorical group objects:** `Mathlib/CategoryTheory/Monoidal/{Mon_,Comon_,Bimon_,Grp_,CommGrp_}.lean`
  and the cartesian/`Over` variants for the scheme group-object view.
- **Algebra categories:** `Mathlib/Algebra/Category/CoalgCat/ComonEquivalence.lean`
  (coalgebras ≃ comonoids), `Mathlib/Algebra/Category/CommAlgCat/{Basic,FiniteType,Monoidal}.lean`.
- **Scheme-side group theory:** `Mathlib/AlgebraicGeometry/Group/Abelian.lean` (the
  rigidity theorem
  `AlgebraicGeometry.isCommMonObj_of_isProper_of_geometricallyIntegral`: a proper
  geometrically integral group scheme over a field is commutative, at line 132).
  A constant S₃ over ℂ is proper but has six components: (12)(23)=(123), while
  (23)(12)=(132); it fails geometric integrality. The trivial group and abelian
  varieties satisfy the stated hypotheses. Smoothness comparisons use
  `Mathlib/AlgebraicGeometry/Group/Smooth.lean`.
- **Affine group schemes and Hopf algebras:** `Mathlib/AlgebraicGeometry/Group/Affine.lean`
  provides `hopfSpec.fullyFaithful` and `essImage_hopfSpec` for affine group schemes over
  `Spec R`; use this dictionary for the corresponding Layer 0 targets.
- **Classical-topology and chart inputs:** `AlgebraicGeometry.Smooth.exists_isStandardSmooth`
  in `Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean` supplies local standard-smooth
  presentations. The local ring of holomorphic germs in §11.0 uses
  `smoothSheafCommRing` and `smoothSheafCommRing.eval` in
  `Mathlib/Geometry/Manifold/Sheaf/Smooth.lean`, over the complex model, and
  `smoothSheafCommRing.isUnit_stalk_iff` in
  `Mathlib/Geometry/Manifold/Sheaf/LocallyRingedSpace.lean`: a germ is a unit
  exactly when its value is nonzero. `TopCat.GlueData` and `IsProperMap` supply topological gluing and
  proper continuous maps; the latter includes continuity and does not impose
  Hausdorffness on either space.
- **Smoothness ingredient:** `Mathlib/RingTheory/Nilpotent/GeometricallyReduced.lean`.
- **Combinatorial prerequisites** (not ready-made algebraic-group infrastructure; they
  supply abstract root systems/Weyl groups; extracting a *root datum from a group* still
  needs substantial glue): `Mathlib/LinearAlgebra/RootSystem/*` (root pairings, bases,
  Cartan matrices) and `Mathlib/GroupTheory/Coxeter/*`.
- **Representation theory to mine for patterns** (finite-group / module flavour; it does
  *not* generalize directly without building comodules and rational representations first):
  `Mathlib/RepresentationTheory/{FDRep,Character,Tannaka,Maschke,Semisimple,Irreducible}.lean`.

### From Tau Ceti

- `TauCeti.HopfAlgebra.Point.jordanDecomposition` in
  `TauCeti/Algebra/AlgebraicGroup/Representation/JordanDecomposition/Basic.lean`
  supplies the two factors over a perfect coefficient field; the sibling
  `Naturality.lean`, `ScalarExtension.lean` and `Commuting.lean` supply
  `TauCeti.HopfAlgebra.Point.jordanDecomposition_mapDomain`,
  `TauCeti.HopfAlgebra.Point.jordanDecomposition_mapValue` and
  `TauCeti.HopfAlgebra.Point.jordanDecomposition_mul_of_commute`.
- `TauCeti.DiagonalizableGroup.schemeEquivalence` in
  `TauCeti/Algebra/AlgebraicGroup/DiagonalizableGroup/Equivalence.lean` supplies
  the contravariant equivalence over a field. The point comparison
  `TauCeti.DiagonalizableGroup.schemePointsMulEquiv` in
  `TauCeti/Algebra/AlgebraicGroup/DiagonalizableGroup/Scheme/Points.lean` works
  over any commutative base ring; `TauCeti.DiagonalizableGroup.isShortExact_mapDomainBialgHom`
  in `TauCeti/Algebra/AlgebraicGroup/DiagonalizableGroup/Exact.lean` supplies
  exactness. No second diagonalizable-group constructor is required in Layer 4.
- `TauCeti.multiplicativeTypeCommHopfAlgProperty` in
  `TauCeti/Algebra/AlgebraicGroup/MultiplicativeType/Basic.lean` and
  `TauCeti.torusCommHopfAlgProperty`, `TauCeti.splitTorusCommHopfAlgProperty` in
  `TauCeti/Algebra/AlgebraicGroup/Torus/Basic.lean` are the predicates used here.
  `TauCeti.TorusCommHopfAlgCat.characterLatticeFunctor_isEquivalence` in
  `TauCeti/Algebra/AlgebraicGroup/Torus/CharacterLattice/Equivalence.lean`
  requires a perfect field; the arbitrary-field extension is a Layer 4 target.
  `TauCeti.MultiplicativeTypeCommHopfAlgCat.characterCocharacterPairing` and
  `TauCeti.MultiplicativeTypeCommHopfAlgCat.characterCocharacterPairing_galois_invariant`
  in `TauCeti/Algebra/AlgebraicGroup/MultiplicativeType/Cocharacter.lean` supply
  the pairing and its equivariance, on geometric rather than k-rational characters.
  `TauCeti.TorusCommHopfAlgCat.instCharacterCocharacterPairingIsPerfPair` in
  `TauCeti/Algebra/AlgebraicGroup/Torus/Cocharacter/Basic.lean` supplies perfectness
  for tori over arbitrary fields.
- `Derivation.instBracketCounitAlgebra` in
  `TauCeti/Algebra/AlgebraicGroup/Tangent/Lie/Basic.lean` defines the convolution
  commutator on counit-valued derivations of a commutative bialgebra over a
  commutative ring, with values in a commutative coefficient algebra.
  `TauCeti.derivationCompLieHom`, `TauCeti.derivationCompLieHom_id` and
  `TauCeti.derivationCompLieHom_comp` in
  `TauCeti/Algebra/AlgebraicGroup/Tangent/Lie/Map.lean` give the differential for
  bialgebra morphisms and its functoriality. `Derivation.adRepresentation` in
  `TauCeti/Algebra/AlgebraicGroup/Tangent/Adjoint.lean` gives the linear point
  action for a commutative Hopf algebra. This point representation does not by
  itself supply the scheme morphism to GL of the tangent space.
- `Derivation.cotangentLinearEquiv` in
  `TauCeti/Algebra/AlgebraicGroup/Tangent/Cotangent.lean` identifies linear
  functionals on the augmentation cotangent space with counit-valued derivations.
  Over a field, `TauCeti.Bialgebra.cotangentLinearEquivZariski` and its generator
  equation `TauCeti.Bialgebra.cotangentLinearEquivZariski_toCotangent` in
  `TauCeti/Algebra/AlgebraicGroup/Tangent/Scheme.lean` identify that cotangent
  space with the stalk cotangent at the augmentation point of Spec H. They
  concern algebraic stalks, not holomorphic germs.
- `AnalyticAt.exists_openPartialHomeomorph`, in
  `TauCeti/Analysis/Analytic/Inverse.lean`, supplies analytic local inverses when
  the derivative is a continuous linear equivalence, over a complete normed
  source. Section 3A.5 applies it over ℂ in finite-dimensional coordinate spaces.
  `DifferentiableOn.analyticOnNhd_of_finiteDimensional` in
  `TauCeti/Analysis/Complex/CauchyIntegralPolydisc.lean` supplies holomorphic
  analyticity on an open subset of a finite-dimensional complex domain, with
  complete codomain; §11.0 uses codomain ℂ.
- Mathlib `AlgebraicGeometry.Group.Affine` provides `hopfSpec.fullyFaithful` and
  `essImage_hopfSpec`; use this affine group scheme/Hopf-algebra dictionary. Its scope is
  affine group schemes over `Spec R`. Mathlib `AlgebraicGeometry.Group.Smooth` provides
  `AlgebraicGeometry.smooth_of_grpObj` under its field, locally finite type, group-object,
  and geometric-reducedness hypotheses.
- Tau Ceti's `FiniteTypeCommHopfAlgCat`, `CommHopfAlgCat.pointsFunctor`,
  `FiniteTypeCommHopfAlgCat.pointsFunctor`, and base-change modules provide the finite-type
  Hopf categories and group-valued points. Its `WithConv` point construction and functorial
  maps are the starting point for R-points; extend these interfaces for any missing
  comparison with scheme points and descent.
- Tau Ceti's `Comodule.Basic`, `Comodule.Cat`, finite/rigid comodule categories, matrix
  coefficient subcoalgebras, and `Subcoalgebra.Finite` supply comodule structures, finite
  subcoalgebras over fields, and coefficient constructions. In particular,
  `exists_finiteDimensional_subcoalgebra_mem` proves elementwise finite-subcoalgebra
  containment, and `exists_finite_subcomodule_matrixCoefficientSubalgebra_eq_top` gives a
  finite subcomodule whose coefficients generate a finite-type algebra-coalgebra over a
  field. The remaining targets are the algebraic-group representation dictionary, the
  group-scheme representation map and closed immersion with their full hypotheses.
  [`TauCeti.Tannaka.pointsFunctorIsoTensorAutFunctor`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/GroupFunctor.lean) already reconstructs the points
  functor of a commutative Hopf algebra over a field from tensor automorphisms, with
  its explicit universe lift. Layer1 transports this natural isomorphism through the
  representation/comodule and scheme/group-functor dictionaries.
- Tau Ceti `Borel.Basic` and `Reductive.Basic` provide predicates on finite-type
  commutative Hopf algebras. The dynamic modules provide cocharacter-defined parabolic,
  Levi, unipotent point subgroups and a pointwise Levi decomposition. Their documentation
  does not establish representability of arbitrary dynamic subfunctors or the algebraic
  intersection/transporter results below. `Frobenius.Points` and `Frobenius.FixedPoints`
  provide pointwise Frobenius maps and fixed-point comparisons; they do not prove finiteness
  for every endomorphism or Lang–Steinberg.
- Mathlib's root-system and Coxeter modules provide abstract combinatorial structures.
  Tau Ceti has concrete torus, GL, SL, and symplectic root-data carriers. These are
  reusable instances, not general root extraction or classification.

### From TauCetiRoadmap.SchemeAndStackFoundations

Sections 1.1 and 1.14–1.18 supply fpqc quasi-coherent descent, sheaf descent,
group actions, torsors and quotient-stack interfaces. They do not turn every group
quotient sheaf into a scheme. Section 0.7 supplies scheme dimension theory;
§4.12 supplies Chow's lemma for the properness comparison in §3A.5.
Section 0.9 supplies finite-presentation descent of schemes and morphisms along
limits of quasi-compact quasi-separated schemes with affine transition maps,
including eventual descent of smoothness and isomorphisms. Section 8.2 uses
this affine-locally to descend finite group-law diagrams; it owns the comparison
of the resulting relative group constructions, not another limit theory.

### From TauCetiRoadmap.ModularCurves

Sections 0E–0F supply effective faithfully flat descent of affine schemes and
of their group structures, and affine finitely presented Weil restriction along a
finite locally free morphism, with arbitrary base change. These apply affine-locally over arbitrary schemes in §8.2 and to the
finite-type group schemes over fields in §8.3.

### From Tau Ceti: fppf quotients

`TauCeti.CommHopfAlgCat.fppfQuotientSheaf`, in
`TauCeti/Algebra/AlgebraicGroup/Fppf/Quotient/Basic.lean`, sheafifies the
pointwise quotient for a normal Hopf ideal; it does not assert representability.
Use its projection and the represented-group comparison in Layers 3 and 8.

### From Tau Ceti: affine and representation dictionaries

- `TauCeti.commHopfAlgCatOpEquivAffineGroupSchemeCat`, in
  `TauCeti/AlgebraicGeometry/AffineGroupScheme/Equivalence.lean`, is the
  anti-equivalence over any commutative base ring, with its actual unit and counit.
- `TauCeti.pointRepresentationCategoryEquivalence` and
  `TauCeti.fgPointRepresentationCategoryEquivalence`, in
  `TauCeti/Algebra/AlgebraicGroup/Representation/Comodule/Equivalence.lean`,
  compare natural point representations with right comodules and their finitely
  generated restrictions. Over a field the latter are finite-dimensional.
- `TauCeti.Comodule.isClosedImmersion_coordinateGroupSchemeHom_iff` and
  `TauCeti.AffineGroupSchemeCat.exists_isClosedImmersion_generalLinear`, in
  `TauCeti/Algebra/AlgebraicGroup/Representation/Embedding.lean`, supply the
  finite-free coordinate criterion and the finite-type affine embedding theorem
  over a field. The former uses the specified basis and coordinate Hopf morphism.
  `TauCeti.Comodule.coordinateBialgHom_surjective_iff_matrixCoefficientSubalgebra_sup_antipode_eq_top`,
  in `TauCeti/Algebra/AlgebraicGroup/Representation/Faithful/Basic.lean`, supplies
  the exact coefficient-and-antipode generation criterion (Milne 2017, §4a,
  p. 83 and Theorem 4.9, p. 87).

### From Tau Ceti: closed subgroups and components

- `TauCeti.HopfIdeal`, in `TauCeti/Algebra/HopfAlgebra/HopfIdeal/Basic.lean`,
  records a two-sided ideal, comultiplication into the sum of the two tensor
  ideals, vanishing counit and antipode stability. Its quotient instances do
  not require reducedness or smoothness.
- `TauCeti.CommHopfAlgCat.hopfIdealOrderIsoClosedSubgroup`, in
  `TauCeti/Algebra/AlgebraicGroup/HopfIdeal/Scheme/Classification.lean`, identifies
  the order dual of Hopf ideals with closed subgroup subobjects over any
  commutative base ring (Milne 2017, Definition 3.10 and Propositions 3.12, 3.15,
  pp. 67–68). The inverse is the defining ideal, not the vanishing ideal of
  field-valued points.
- `TauCeti.HopfIdeal.IsNormal`, in
  `TauCeti/Algebra/AlgebraicGroup/HopfIdeal/Normal/Basic.lean`, means
  conjugation pulls the ideal into the right tensor ideal: the first factor
  is the conjugating group element. `TauCeti.CommHopfAlgCat.coinvariantsFppfQuotientIso`,
  in `TauCeti/Algebra/AlgebraicGroup/Fppf/Quotient/Coinvariants.lean`, represents
  the normal quotient for a geometrically reduced finite-type ambient group
  over any field; the subgroup may be nonreduced.
- `TauCeti.FiniteTypeCommHopfAlgCat.identityComponentSpec` and
  `TauCeti.FiniteTypeCommHopfAlgCat.identityComponentSpecι`, in
  `TauCeti/Algebra/AlgebraicGroup/Connected/GroupScheme.lean`, construct the
  identity-component group scheme and its closed immersion over an
  algebraically closed field. The finite-component instance
  `TauCeti.FiniteTypeAffineGroupSchemeCat.instFiniteConnectedComponents`, in
  `TauCeti/AlgebraicGeometry/AffineGroupScheme/Components/Finite.lean`, concerns
  the underlying topological components over a Noetherian base; it is not a
  construction of the étale group scheme π₀.

### From Tau Ceti: unipotence, radicals and representation theory

- `TauCeti.geometricallyUnipotentPointsCommHopfAlgProperty`, in
  `TauCeti/Algebra/AlgebraicGroup/Unipotent/Basic.lean`, tests every
  algebraic-closure-valued point in every finite-dimensional representation;
  it does not detect infinitesimal non-unipotence. In
  `TauCeti/Algebra/AlgebraicGroup/Unipotent/Embedding.lean`,
  `TauCeti.geometricallyUnipotentPointsCommHopfAlgProperty.iff_exists_isClosedImmersion_upperUnitriangularGroupScheme`
  identifies this condition with an upper-unitriangular closed embedding for
  reduced finite-type Hopf algebras over an algebraically closed field.
- `TauCeti.Comodule.exists_basis_coefficientMatrix_isUpperTriangular_of_geometricallySolvable`,
  in `TauCeti/Algebra/AlgebraicGroup/Solvable/LieKolchin.lean`, assumes an
  algebraically closed field, a reduced finite-type Hopf algebra, geometric
  connectedness and solvability, and a finite-dimensional comodule. It gives
  an upper-triangular coefficient matrix with group-like diagonal entries.
- `TauCeti.FiniteTypeCommHopfAlgCat.unipotentRadicalDefiningIdeal` and
  `TauCeti.FiniteTypeCommHopfAlgCat.eq_unipotentRadicalDefiningIdeal_iff`, in
  `TauCeti/Algebra/AlgebraicGroup/Unipotent/Radical/Construction.lean`, give
  the k-radical and its universal property over any field. The corresponding
  `TauCeti.FiniteTypeCommHopfAlgCat.solvableRadicalDefiningIdeal` and
  `TauCeti.FiniteTypeCommHopfAlgCat.eq_solvableRadicalDefiningIdeal_iff` are in
  `TauCeti/Algebra/AlgebraicGroup/Solvable/Radical/Construction.lean`.
  These are least defining ideals, hence greatest represented subgroups.
  `TauCeti.FiniteTypeCommHopfAlgCat.unipotentRadicalDefiningIdeal_baseChange_le`,
  in `TauCeti/Algebra/AlgebraicGroup/Unipotent/Radical/BaseChange.lean`, gives
  inclusion of the base-changed radical in the new radical, not equality for
  arbitrary inseparable extensions.
- `TauCeti.reductiveCommHopfAlgProperty` and
  `TauCeti.semisimpleCommHopfAlgProperty`, in
  `TauCeti/Algebra/AlgebraicGroup/Reductive/Basic.lean` and
  `TauCeti/Algebra/AlgebraicGroup/Semisimple/Basic.lean`, require smoothness,
  geometric connectedness and absence of the respective geometric smooth
  connected normal subgroups. `TauCeti.linearlyReductiveCommHopfAlgProperty`,
  in `TauCeti/Algebra/AlgebraicGroup/LinearlyReductive.lean`, instead tests
  complete reducibility of finite-dimensional comodules.
- `TauCeti.exists_isCompl_of_isKilling`, in
  `TauCeti/Algebra/Lie/HighestWeight/CompleteReducibility.lean`, supplies a Lie
  submodule complement over a characteristic-zero field for finite-dimensional
  modules over a finite-dimensional Lie algebra with nondegenerate Killing
  form. Applying it to a group representation requires the algebraic
  differential and group/Lie invariant-subspace comparison, not just a Lie action.

### From TauCetiRoadmap.RootSystems

Layer 4, *Chambers, the fundamental domain, and the longest element*, supplies
simple transitivity of the Weyl action on open chambers for finite reduced
crystallographic real root pairings with a base.

**What RootSystems must provide (gap:root-automorphism-based-factorization).**
For a finite reduced crystallographic spanning real root pairing P and base b,
RootSystems must supply the actual subgroup D of automorphisms preserving b's
simple support, normality of W in Aut(P), W∩D={1}, and unique factorization
a=wδ with w∈W and δ∈D. The required isomorphism W⋊D→Aut(P) sends (w,δ) to
wδ, with multiplication (w,δ)(v,ε)=(w(δvδ⁻¹),δε), reflection-conjugation
law a s_α a⁻¹=s_(aα), and transport under change of base (Milne 2017, C.22
and Proposition C.53, pp. 612, 624). Section 9A.1a-L consumes precisely this
contract, retaining its own signed-cover and integral full-Y comparisons.

### From TauCetiRoadmap.SmoothBundlesConnections

B1.0 supplies regular fibres and transverse fibre products of finite-dimensional
smooth manifolds, with the derivative-surjectivity or transversality hypotheses,
tangent-kernel identification and dimension formula. B1.1 supplies the
principal-bundle comparison and smooth division map. B1.4 supplies the quotient
by a closed Lie subgroup and its local sections. Section 3A.5 applies these
smooth results to the underlying real manifolds and proves the holomorphic
comparison using its own complex charts and analytic inverse theorem.

## How to read the build

Layers 0–3 construct the dictionaries, representations and subgroup geometry;
Layer 3A supplies orbit theorems before structure and classification. Layers 4–8
supply tori, radicals, Bruhat theory and finite-field applications. Layers 9–10
construct the integral group and representation theory; Layer 11 supplies the
spectral quotient. The relative classification in Layer 8 uses the independent
split construction of Layer 9. The headline acceptance statements are in
`Suggested.lean`; all APIs, constructions and Checks are specified here.

## Layer 0: the functor of points and the three-way dictionary

### 0.1 Points and their group law

Keep `R` a commutative `k`-algebra and let the values `G(R)` be
allowed to be noncommutative. Consume Tau Ceti's `WithConv`,
`CommHopfAlgCat.pointsFunctor`, and `FiniteTypeCommHopfAlgCat.pointsFunctor`; prove
convolution, identity, inverse, and naturality lemmas at their exact hypotheses where
the named interfaces need them; do not introduce a parallel `AlgPoints` structure. The convolution is
`(f * g)(a) = ∑ f(a₁) g(a₂)`, with counit identity and antipode inverse, not composition.
`GroupLike k A` is not the points functor: group-like elements form a commutative group,
whereas `GLₙ(R)` can be noncommutative.
These equations use Milne 2017, §3.5, p. 66.

**Checks.**

- In constant S₃, (12)(23)=(123) but (23)(12)=(132); reversing convolution
  would reverse these values.
- In Gₘ, evaluation at 2 sends t to 2 and t⁻¹ to 1/2 over ℚ; inversion
  interchanges these values, while the identity sends both to 1.
- For the zero test algebra there is one algebra homomorphism and one group
  element, with 0=1; points are not assumed nonempty by a nonzero-value test.

*Needs:* the Hopf points and convolution suppliers in the exact contracts.

### 0.2 The three model interfaces

For affine group schemes over `Spec R`, use the native anti-equivalence in the
supplier contract, including its unit and counit `Γ(Spec A) ≃ A` and `Spec Γ(G) ≃ G`.
Compare its finite-type and smoothness predicates with the represented points
functor, keeping the predicates separate from the category objects.
Construct the three-way comparison with representable group-valued functors
using Yoneda and Tau Ceti's `CommHopfAlgCat.pointsFunctor`; identify the points of `Spec A`
with algebra homomorphisms by existing `Spec.mapMulEquiv`, and prove compatibility of the
group laws and naturality in the test algebra. Pin the scheme, Hopf carrier, and test-algebra
universes to a common `u` (`w=v=u` in `pointsFunctor` / `GrpCat.{max v w}` and
`R S T : Type u` for `Spec.mapMulEquiv`); no heterogeneous-universe convention is intended.
The comparison must commute with the named unit, counit and structural maps;
`Scheme.Over` carries the structural morphism.
The field case is Milne 2017, Proposition 3.6 and Corollary 3.7, pp. 66–67;
the arbitrary-ring comparison uses the named native affine dictionary.

**Checks.**

- For Gₐ over k, a point over k[ε]/(ε²) sending t to ε remains that same
  algebra homomorphism through the three views; restricting to k-points loses it.
- For the trivial group, the coordinate ring is k and all three views give
  one point over every test k-algebra.
- In SL₂, multiplying I+E₁₂ by I+E₂₁ gives [[2,1],[1,1]], whereas the
  reversed product is [[1,1],[1,2]]; the dictionary preserves group order.

*Needs:* Mathlib Hopf spectra, affine global sections and Yoneda; the Tau Ceti
points functor named in the exact contracts.

### 0.3 Base change and descent

Consume Tau Ceti's finite-type Hopf-category and base-change
functors, including compatibility of points under base change. Keep geometric notions
after extension to `k̄`. Use SchemeAndStackFoundations §1.1 and §§1.14–1.18 and ModularCurves §0E
for descent and torsors. Construct the comparisons between their scheme sheaves and
the Hopf points functor. Prove quotient representability separately in Layers 3 and 8
(Milne, §5j, Definition 5.65 and Proposition 5.68, p. 116).

**Checks.**

- Base-changing μ₂ from ℤ to 𝔽₂ sends t²−1 to (t−1)², retaining the
  two-dimensional nonreduced coordinate algebra.
- Base-changing μ₂ to ℚ gives a reduced algebra of dimension 2; reducedness
  over one fibre does not give smoothness of every fibre.
- For k=𝔽ₚ(s) and K=k(s^(1/p)), αₚ base-changes from k[t]/(tᵖ) to
  K[t]/(tᵖ), still of dimension p; inseparability does not discard nilpotents.

*Needs:* SchemeAndStackFoundations §1.1 and §§1.14–1.18; ModularCurves §0E;
Tau Ceti base-change functors in the exact contracts.

### Examples

For constant S₃, convolution multiplies points in their group order: (12)(23)=(123), whereas (23)(12)=(132). For Gₘ, a point sends t to a unit and t⁻¹ to its inverse.

### Dependencies

*Needs:* Mathlib affine group objects and Hopf spectra; Tau Ceti Hopf points; ModularCurves §0E descent.

## Layer 1: representations = comodules

### 1.0a Rational representations and comodules

For an affine group scheme G over a field k, transport the native point-representation
and right-comodule equivalence through §0.2's scheme/points comparison, on arbitrary
k-vector spaces and on the finite-dimensional subcategory. Identify the regular
representation with the comultiplication coaction on O(G), and compare the tensor
unit, tensor products and, on finite-dimensional objects, duals.

- For ρ(v)=Σ vᵢ⊗aᵢ and g:O(G)→R, the action on R⊗k V sends 1⊗v to
  Σ g(aᵢ)⊗vᵢ. Morphisms are exactly the linear maps commuting with these actions
  for every test algebra R, not merely on k-points.
- The tensor product acts diagonally, the unit acts trivially, and the dual
  action is (g·ℓ)(v)=ℓ(g⁻¹v). These comparisons preserve evaluation and coevaluation.
- The regular action satisfies (g·f)(x)=f(xg); finite subcomodules and faithful
  coefficient-generated embeddings use the supplier maps under this comparison.

The comparison is the one in Milne 2017, Remark 4.1, pp. 84–85.

**Checks.**

- The weight-three Gₘ line has coaction v↦v⊗t³ and a unit a acts by a³v;
  at a=2 the value is 8v, not v/8. The dual has scalar 1/8, so evaluation
  pairs (1/8)ℓ with 8v to give ℓ(v); weights 1 and 2 tensor to weight 3,
  with scalar 2·4=8.
- The trivial line has coaction v↦v⊗1 and every point acts as identity.
- The zero module has zero coaction and its unique automorphism is the identity;
  no positive dimension belongs in the dictionary.

- For the standard Gₘ character, t and t⁻¹ generate k[t,t⁻¹], whereas
  t alone generates k[t]. In positive characteristic p, the character tᵖ
  has scheme kernel μₚ of degree p despite injectivity on geometric points.
- For Gₐ, Δt=t⊗1+1⊗t keeps span{1,t} stable, and right translation by a
  sends t to t+a; the opposite translation would give t−a.
- The zero representation factors through GL₀=1; it is faithful only for
  the trivial group. For αₚ in positive characteristic p, a↦[[1,a],[0,1]]
  instead gives a faithful closed embedding in GL₂.

*Needs:* Layer 0 points; Tau Ceti comodule, dual, tensor and representation
suppliers; Milne 2017, Remark 4.1 and Theorem 4.9, pp. 84–85, 87.

### 1.0b Tannakian comparison

Consume native
`TauCeti.Tannaka.pointsFunctorIsoTensorAutFunctor k H` for `[Field k]`,
`[CommRing H]`, `[HopfAlgebra k H]` in the common universe. Preserve the actual
`pointsFunctor ⋙ GrpCat.uliftFunctor ≅ tensorAutFunctor`, its coefficient-algebra
naturality and component/reconstructed-point equations. Transport it through the
rational-representation/comodule equivalence and Layer0's scheme/group-functor
equivalences; construct those remaining adapters and their compatibility with the
faithful-representation/closed-immersion maps. No second native reconstruction
theorem or unlifted equality of these functors is intended.

The reconstruction comparison uses the native theorem in the exact contracts;
the representation–comodule identification is Milne 2017, Remark 4.1, pp. 84–85.

**Checks.**

- For Gₘ and its weight-three line, a reconstructed point with t-value 2
  acts by 8, recovering the original point action.
- The tensor unit has weight 0 and every reconstructed point acts by 1;
  arbitrary scalar automorphisms of the unit are excluded by tensor compatibility.
- For the trivial group the tensor-automorphism group is trivial; the universe
  lift changes the carrier universe but preserves this one-element group.

*Needs:* the native tensor-automorphism reconstruction and its universe lift;
Layer 0 scheme/Hopf/points comparisons and §1.0a.

### 1.1 Rational cohomology and algebraic induction

For a commutative ring A, a flat commutative Hopf A-algebra H and any right
H-comodule M, define rational cohomology by the Hochschild complex with degree-n
term M⊗H⊗⋯⊗H (n Hopf factors). Use the coefficient coaction, interior coproducts
and final unit as cofaces, with alternating signs. Prove comparison with derived
scheme invariants using the cofree resolution and enough injectives in the flat
comodule category (Jantzen, 1985 preprint I.3.9, I.4.14–I.4.16, pp. 60, 77–79a).

The API includes functoriality in M, connecting maps for short exact sequences,
degree-zero identification with scheme invariants, and acyclicity of every cofree
comodule N⊗H, even when N is not flat or injective. The cyclic tensor permutation
M⊗H^⊗n → H^⊗n⊗M transports cofaces and gives the coefficient-last convention
without a sign; retain this chain isomorphism in the derived comparison.

**Checks.**

- For H=A and M=A, the first differentials are 0, identity, 0; positive cohomology
  vanishes and degree zero is A. A complex with every differential zero fails this test.
- For A=ℤ and M=ℤ/2 with trivial H, degree zero is ℤ/2 and higher degrees vanish;
  flatness of M is unnecessary.
- For H=ℤ[t,t⁻¹] and its weight-one line, d⁰(1)=1⊗(t−1); the
  coefficient-last value is (t−1)⊗1, not its negative.

For flat commutative Hopf A-algebras H,K, a bialgebra map f:H→K and a right
K-comodule M, define algebraic induction as the equalizer in M⊗H of the coaction
on M and the map obtained by applying f to the first factor of Δ_H. Prove that
1⊗Δ_H restricts to an H-coaction, using flatness of H. Prove the natural
Frobenius-reciprocity bijection with corestriction: its forward map uses ε_H and
its inverse takes u to (u⊗1)ρ. The antipode on H compares the function convention
F(hg)=hF(g), with right translation, to f(gh)=h⁻¹f(g), with left translation,
by f(g)=F(g⁻¹) (Jantzen, 1985 preprint I.3.3–I.3.7, pp. 53–58).

The API includes identity and composite induction, counit evaluation, naturality
in M, and the inversion comparison with its inverse and action equations.

**Checks.**

- For the trivial subgroup of constant C₂ over ℤ, induction of ℤ is ℤ² and
  the nonidentity element swaps the two delta functions.
- For f the identity, counit evaluation identifies the equalizer with M;
  for M=0 the equalizer is 0.
- For H=K and the weight-one Gₘ character, F(t)=t becomes f(t)=t⁻¹;
  evaluation at 1 is 1 in both conventions.

*Needs:* Tau Ceti `Comodule.cofree`, `Comodule.Hom.cofreeEquiv`,
`Comodule.Hom.cofreeUnit`, `Comodule.Corestrict`; Mathlib module injectives,
tensor equalizers, complexes and homology; Layer 1 representation/comodule dictionary.

### Examples

The standard Gₘ character has coefficient algebra k[t]; adjoining the dual character gives k[t,t⁻¹]. A faithful closed representation therefore needs the determinant inverse.

### Dependencies

*Needs:* Layer 0; native comodule, cofree and finite-subcoalgebra APIs; §1.1 for induction and cohomology.

## Layer 2: Lie algebra and the adjoint representation

### 2.1 Tangent Lie algebra and differentials

For an affine finite-type group scheme G over a field k, transport the native
counit-derivation Lie algebra through the affine scheme/Hopf dictionary to the
tangent space at its identity. Prove that the transported differential is the
scheme tangent map and that the point adjoint action agrees with the differential
of the scheme conjugation morphism. The targets are these compatibility
squares, with the maps supplied in the exact contracts above (Milne, Proposition
10.28 and Proposition 10.29, pp. 195–196; Theorem 10.23, p. 193).

- For every homomorphism f:G→H of affine finite-type k-group schemes, identify
  ker(df) with the tangent Lie algebra of its scheme-theoretic kernel, without
  a smoothness assumption (Milne, §10.14, p. 190).
- For smooth G, prove dim Lie(G)=dim G. If ker(f) is smooth, deduce
  dim ker(df)=dim ker(f); the dimension here is scheme dimension, not the
  dimension of the reduced point set (Milne, Proposition 1.37, p. 18, and §10.14, p. 190).
- Construct the algebraic representation Ad:G→GL(Lie(G)) representing the native
  point adjoint action. Prove compatibility with field extension, the square
  df(Ad_G(g)v)=Ad_H(f(g))(df(v)), and dAd=ad on the actual Lie algebra
  (Milne, Theorem 10.23, p. 193).

**Checks.**

- The trivial group has Lie algebra 0; Gₐ has a one-dimensional abelian Lie algebra.
- For SL₂, [E₁₂,E₂₁]=diag(1,−1), fixing the left-invariant bracket convention.
- Frobenius on Gₘ in characteristic p has zero differential and kernel μₚ;
  dim Lie(μₚ)=1 while dim μₚ=0. Omitting smoothness gives a false dimension equality.

### Examples

For Gₐ, Lie(Gₐ)=k and the bracket is zero; for SL₂, [E₁₂,E₂₁]=diag(1,−1). In characteristic p, μₚ has tangent dimension 1 but scheme dimension 0, excluding a smoothness-free dimension formula.

### Dependencies

*Needs:* Layer 0 group objects and affine dictionary; the native tangent, cotangent,
differential and adjoint declarations in the Tau Ceti contract; Mathlib scheme
tangent spaces; Layer 1 representations and faithful closed embeddings.

## Layer 3: subgroups, quotients, components

### 3.1 Subgroup and quotient comparisons

For an affine group scheme G of finite type over a field k and a normal closed
subgroup N, construct the affine finite-type group Q representing the fppf
quotient G/N, with its faithfully flat projection q:G→Q and scheme kernel N.
Extend the coinvariant comparison to non-geometrically-reduced G: the pullback
q* identifies O(Q) with the functions a satisfying `(id ⊗ π)Δ(a)=a⊗1`, where
π:O(G)→O(N) is restriction. No perfection, smoothness or characteristic bound
is imposed (Milne 2017, Theorem 5.13 and Proposition 5.18, pp. 101–103).

- Every group-scheme morphism G→K killing N factors uniquely through q.
- The identification with the fppf quotient carries its projection to q and
  its kernel inclusion to N→G; it is not an identification with G(k)/N(k).
- Extension of the base field preserves Q, q and the kernel comparison,
  by the sheaf quotient universal property and faithful flat descent.

**Checks.**

- In k[t,t⁻¹], the ideals (t−1) and (t²−1) have counit values 0 and 0;
  they cut out 1 and μ₂. Their inclusion (t²−1)⊆(t−1) reverses to 1⊆μ₂.
  Over ℚ the ideal (t−2) has counit value −1 and defines no subgroup.
- In characteristic 2, k[t,t⁻¹]/(t²−1) is k[u]/(u²), with u=t−1.
  Its one geometric point does not make it the trivial subgroup scheme.
- For Gₘ/μ₂ over ℚ, q(t)=t² and O(Q)=ℚ[t²,t⁻²]; 2 has no rational
  lift but lifts over ℚ(√2), distinguishing fppf surjectivity from pointwise
  surjectivity.
- In characteristic p, take G=αₚ×αₚ and N its first factor. Then Q=αₚ,
  q(x,y)=y, and the coinvariants in k[x,y]/(xᵖ,yᵖ) are k[y]/(yᵖ).
  This tests the nonreduced ambient case, including p=2 and p=3.
- G/G=1 and G/1=G; for constant S₃ and N=A₃ the quotient has order 2.
  The subgroup generated by (12) is not normal: conjugation by (123)
  sends it to the subgroup generated by (23), excluding a group quotient.

*Needs:* Layer 0 affine dictionary; Layer 1 faithful representations;
Tau Ceti Hopf ideals, normality, coinvariants and fppf quotient; the affine
faithfully flat descent of ModularCurves §0E. General nonnormal homogeneous
spaces use §3A and Layer 7; their complex reductive affineness comparison is
Layer 6B.

### 3.2 Identity component and finite étale component group

For every affine finite-type group scheme G over an arbitrary field k,
construct G° as the open and closed subgroup scheme whose geometric fibre
is the connected component containing the identity, with its inherited scheme
structure. Descend the identity-component construction along field extensions.
Construct π₀(G) as the finite étale group scheme of geometric connected
components, with the continuous absolute-Galois action and multiplication
induced from G. Prove the fppf exact sequence `1 → G° → G → π₀(G) → 1`;
G° is geometrically connected and normal, and the projection is faithfully
flat. Neither G nor G° is required to be smooth or reduced (Milne 2017,
Proposition 1.34, pp. 16–17; Proposition 2.37 and Definition 2.38, pp. 51–52).

- A homomorphism G→E to a finite étale k-group factors uniquely through π₀(G).
- Both constructions and the exact sequence commute with every field extension,
  including inseparable extensions, and with finite products.
- π₀(G) has degree equal to the number of geometric connected components;
  it is trivial exactly when G is geometrically connected. Geometric
  connectedness means that O(G)⊗k k̄ has only the idempotents 0 and 1.
- G° retains nilpotents; replacing it by its reduction changes the kernel.
  When G is smooth, its open subgroup G° is smooth. The term
  connected–étale sequence is reserved for finite group schemes.

**Checks.**

- For Gₘ, G°=Gₘ and π₀(Gₘ)=1, with degree 1. For the trivial group,
  both constructions are trivial. Real Lie components do not replace these:
  ℝˣ has two real connected components although algebraic Gₘ is connected.
- For constant S₃, G°=1 and π₀(G)=S₃ has degree 6; (12)(23)=(123)
  and (23)(12)=(132), so the component group need not be commutative.
- Over 𝔽₂, μ₂=Spec 𝔽₂[u]/(u²) is its own identity component and has
  trivial π₀ of degree 1. Its reduction has coordinate ring 𝔽₂ and is
  a different kernel. Over 𝔽₃, μ₂ is étale and π₀(μ₂)=μ₂ has degree 2.
- Over ℝ, μ₃ is finite étale of degree 3, hence equals its component group;
  it has one real point and three complex points. Complex conjugation exchanges
  the two nonidentity components, so degree is not the number of k-points.
- Over k=𝔽ₚ(s), G=αₚ×(ℤ/2)ₖ has G°=αₚ and component group (ℤ/2)ₖ.
  After the purely inseparable extension k(s^(1/p)), these remain the two
  respective base changes, with dimensions 0 and degrees p and 2.

*Needs:* §3.1 quotient comparison; Layer 0 affine dictionary;
Tau Ceti identity component over algebraically closed fields and finite
connected components; ModularCurves §§0E–0F descent; SchemeAndStackFoundations
§§1.14–1.18 sheaf descent.

### Examples

The quotient Gₘ/μ₂ is Gₘ via squaring. Constant S₃ has six components,
whereas μ₂ in characteristic 2 is connected and nonreduced.

### Dependencies

*Needs:* Layers 0–2; the Hopf-ideal, quotient and component suppliers above;
ModularCurves §§0E–0F and SchemeAndStackFoundations §§1.14–1.18.

## Layer 3A: algebraic actions, orbit boundaries and projective closed orbits

Build this phase on Layers0–1 and the early scheme/group-object vocabulary of
Layer3. It precedes Borel subgroups, reductive classification and Borel–Weil.
For its geometric statements take an algebraically closed field k, a smooth
affine finite-type k-group G, and a separated finite-type k-scheme X with an
actual algebraic G-action. G need not be connected, and X need not be
irreducible or reduced. Empty X has no orbit-existence assertion. Over a
nonclosed field apply the geometric statements after the specified algebraic
closure; do not turn a geometric orbit or closed point into a k-rational one
without a descent argument. Retain the standing distinction between smooth
groups and arbitrary finite-type group schemes. In characteristic zero use
the separately proved Cartier smoothness comparison when starting from the
latter. No reductivity hypothesis belongs in the orbit-existence theorem.

**3A.1 Actual action and orbit maps.** Use native `GrpObj` and `ModObj` in
the cartesian monoidal category of schemes over Spec k. Its action is a
scheme morphism G×X→X with native unit/associativity laws; the native
`CategoryTheory.Hom.group` and `Hom.mulAction` give the action on test-scheme
points. Export product, inverse-translation, stabilizer equalizer, base-change
and equivariant-map laws. For x∈X(k) construct μ_x:G→X, g↦gx, translations
t_g and their inverses, and μ_(hx)=μ_x∘R_h. Define the geometric orbit O_x
as the image of the underlying scheme map μ_x, with closure Z_x and boundary
Z_x\O_x. Compare its closed points with the actual orbit of x under G(k).
This comparison uses the finite-type closed-point/residue-field theorem; the
image of all scheme points is not literally a set consisting only of
k-valued points. Define the stabilizer as the scheme fibre over x, with its
actual subgroup structure and fibre translation isomorphisms. A set-theoretic
stabilizer does not supply the scheme-theoretic kernel or a smoothness proof.

**3A.2 Constructible image and local closedness.** Derive that μ_x is
quasi-compact and locally of finite presentation from finite type over k,
the Noetherian target and separatedness/quasi-separatedness; do not add
these conclusions as unexplained action data. Consume native
`Scheme.Hom.isLocallyConstructible_image` / `isConstructible_image`
(Chevalley) at their exact hypotheses. Supply the finite-type-over-k
Jacobson adapter: closed points have residue field k; a nonempty
constructible set contains a closed point; and constructible subsets are
determined by their closed points. Consume native `residueFieldIsoBase`,
`pointOfClosedPoint`, `pointEquivClosedPoint` and
`LocallyOfFiniteType.jacobsonSpace` at their actual hypotheses. The
remaining image/fibre and constructible-set comparisons are bounded
adapters here, not new point or residue-field carriers. For a closed point in the image, a
nonempty finite-type fibre has a k-point. Prove that a dense constructible
set in a Noetherian space contains an open subset dense in every
irreducible component of its closure. Apply this to O_x⊂Z_x, choose a
closed point of that open subset, and translate it by G(k). The translates
are open in Z_x and cover exactly the orbit on closed points; Jacobson
constructible detection identifies their union with O_x as a subset of the
whole scheme space. Thus O_x is open in Z_x and locally closed in X.
Construct its reduced locally closed subscheme and immersion into X,
including the action restriction, independence of the open/closed
factorization, equivariant isomorphisms and algebraically closed field
extension comparisons. These are direct image/subscheme constructions;
no representability theorem for G/H is a premise.

**3A.3 Finite dimensions, including disconnected groups.** Consume
SchemeAndStackFoundations0.7 and native topological Krull dimension rather
than introducing a second dimension function. Prove the bounded helpers
needed here: finite-type schemes over k have finite dimension; a proper
closed subset of an irreducible finite-dimensional finite-type k-scheme
has strictly smaller dimension; a nonempty open in such an irreducible
component has the same dimension; and dimension of a finite union of
closed components is their maximum. Treat the empty set with dimension
−∞, not dimension0. For Z_x, the finitely many irreducible components
are permuted transitively by G(k). Prove this using closed orbit points
away from component intersections and transitivity on O_x(k). A point of
O_x cannot lie in two components: translate an orbit point belonging to
only one component to that point. It follows that all components have
the same dimension d=dim O_x and the boundary misses a dense open in
each. Hence dim(Z_x\O_x)<dim O_x, and every boundary orbit O_y has
strictly smaller dimension. Prove closure stability and orbit containment
before applying the bound. Do not assume Z_x irreducible or assert that
every closed orbit has the globally smallest dimension.

**3A.4 Existence of closed orbits.** In a nonempty X, minimize the natural
number dim O_x over its k-points. If the boundary is nonempty, its
finite-type closed locus has a k-point y, contradicting the strict bound.
Thus an orbit of minimal dimension is closed. Apply the same argument
inside every Z_x to prove that each orbit closure contains a closed orbit.
Export the actual chosen point, containment, closed immersion of its
reduced orbit model, and change-of-choice statements; uniqueness is not
claimed. This is a generic algebraic action theorem, not a highest-line
or adjoint-only substitute. The argument also gives closed orbits in
nonproper X, but supplies compactness only with properness.

### 3A.4a Native acceptance statements

`AlgebraicOrbits.orbit_locallyClosed`, `AlgebraicOrbits.boundary_dimension_lt`,
`AlgebraicOrbits.exists_closed_orbit_in_closure` and
`AlgebraicOrbits.exists_closed_orbit` state §§3A.2–3A.4 for an algebraically closed
field k, a smooth affine finite-type group G and a separated finite-type k-scheme X
with an algebraic action. Neither connectedness of G nor reducedness of X is
assumed. The first three take a point x; the last explicitly assumes nonempty X(k).
These are Milne 2017, Proposition 1.65 and Proposition 1.66 and its proof,
pp. 26–28; for a nonreduced X, the smooth group's orbit map factors through the
reduction, which has the same underlying topological space. For disconnected G,
use the equal-dimensional component argument of §3A.3.

Define `AlgebraicOrbits.Points` by morphisms from the terminal object, and
`AlgebraicOrbits.orbitMorphism` by pairing the identity on G with the constant
point x, then applying the action.

- API: identify these morphisms with k-rational points; prove equivariant-map
  functoriality, μ_x(1)=x and μ_x(gh)=gμ_x(h).
- API: base change the actual morphism, preserving its source G and target X.

**Checks.**

- For G=1 acting on Spec k, there is one point and the orbit map is the identity.
- For Gₘ acting on A¹, x=0 gives the constant-zero map and x=1 gives the
  inclusion Gₘ→A¹; the zero map is wrong for x=1.
- For the empty scheme, there are no rational points and no orbit map with a
  point argument; the existence theorem cannot acquire an unconditional witness.

Define `AlgebraicOrbits.geometricOrbit` as the topological image of that morphism,
and `AlgebraicOrbits.orbitClosure` as its Zariski closure.

- API: prove local closedness, translation stability, the reduced locally closed
  scheme structure and compatibility with equivariant isomorphisms.
- API: closure contains the orbit, is stable under G and contains a closed orbit.

**Checks.**

- For the scaling action on A¹ and x=1, the orbit is D(t) and its closure is A¹;
  replacing the image by only the closed rational points omits the generic point.
- For the same action and x=0, both image and closure are {0}.
- Constant C₂ interchanging two points has a closed two-point orbit; it is not
  irreducible, so connectedness cannot be inferred from the word orbit.

Define `AlgebraicOrbits.orbitBoundary` as closure minus orbit, and
`AlgebraicOrbits.orbitDimension` as native topological Krull dimension of the orbit.

- API: the boundary is closed and stable in the orbit closure, has strictly lower
  dimension, and each of its orbits has strictly lower dimension.
- API: orbit dimension is finite and nonnegative, invariant under translation,
  and the empty boundary has dimension −∞.

**Checks.**

- Scaling on P¹ gives open orbit Gₘ of dimension 1, boundary {0,∞} of dimension 0,
  and two distinct closed orbits, both of dimension 0.
- A fixed point has dimension 0 and empty boundary of dimension −∞, so −∞<0;
  assigning dimension 0 to the empty set would falsify the strict inequality.
- For the trivial action on Spec k[ε]/(ε²), the image, closure and reduction each
  have one point, dimension 0 and empty boundary; reducedness of X is unnecessary.

*Needs:* Layers 0–1; §3A.1 action maps; §3A.2 constructibility;
SchemeAndStackFoundations §0.7 scheme dimension and reduction.

### 3A.5 Classical complex points, smooth charts and properness

For every scheme X locally of finite type over ℂ, put the classical topology on
X(ℂ)=Hom_ℂ(Spec ℂ,X). On Spec(ℂ[t₁,…,tₙ]/I) it is the topology of the common
zero locus of I in ℂⁿ. Prove independence of the finite presentation and glue over
arbitrary affine open covers, with no separatedness, reducedness or smoothness
assumption. This constructs a functor to topological spaces on the native scheme
point carrier (SGA 1, Exposé XII, Theorem and Definition 1.1 and §1.2,
retyped pp. 239–241). The defining affine charts and their open gluing determine
the topology, including for infinite covers. In Suggested.lean,
`ClassicalPoints.affinePointEval` evaluates a regular function at a scheme point,
`ClassicalPoints.classicalPointSubbasis` consists of its complex-open inverse images
inside affine open charts, and `ClassicalPoints.classicalPointTopology` is the
generated topology. The compactness headline is `ClassicalPoints.compact_complexPoints`,
for every X over ℂ whose structural morphism is proper.

Its API is:

- Every scheme morphism over ℂ induces its usual point map continuously; identity,
  composition, open restrictions and fibre products commute with this construction.
  Open and closed immersions induce open and closed embeddings, respectively;
  reduction induces a homeomorphism (SGA 1 XII, §1.1(a)–(c), §1.2).
- A separated X has Hausdorff complex points. A proper morphism between locally
  finite-type complex schemes induces a proper continuous map; in particular a
  proper complex scheme has compact Hausdorff points (SGA 1 XII, Proposition 3.1(viii)
  and Proposition 3.2(v), pp. 244–247). One route uses the closed diagonal, projective
  space compactness and SchemeAndStackFoundations §4.12's Chow lemma, locally on
  the target, as in the proof of Proposition 3.2(v).
- For smooth X, construct holomorphic charts from local standard-smooth
  presentations and prove compatibility under changes of presentation. On each
  locus of constant dimension d, these give the native complex manifold modeled
  on ℂᵈ; regular maps between smooth schemes are holomorphic, and étale maps are
  local biholomorphisms. No constant dimension is imposed across different
  components. For finite-type X the point topology is second countable; Hausdorffness
  still requires separatedness (SGA 1 XII, Proposition 3.1(iii)–(iv), pp. 244–245;
  Serre, GAGA, §2 no. 5, pp. 8–9, for the affine-chart topology).

**Checks.**

- Evaluation at 2 on A¹ sends t to 2, t² to 4 and 1 to 1; evaluation at 0
  sends t to 0. On Spec ℂ[ε]/(ε²), ε evaluates to 0 at the unique point,
  excluding any interpretation as evaluation at a nonzero nilpotent complex number.
- In the identity chart of A¹, f=t and W={z:|z|<1} give the unit disc as a
  subbasic open. With f=0 the same W gives all points; W=∅ gives the empty set.
  Thus neither only Zariski opens nor a discrete finite-subset topology describes it.
- A⁰(ℂ) is one point, A¹(ℂ) is ℂ with its usual topology, and the unit ideal gives
  no points. The discrete topology would incorrectly make the sequence 1/n
  fail to converge to 0 in A¹(ℂ).
- Spec ℂ[ε]/(ε²) and its reduction both have one complex point, but their algebraic
  tangent dimensions are 1 and 0. Topological reduction invariance does not identify
  their structure sheaves or assert that the nonreduced scheme is smooth.
- The line with doubled origin has two distinct origins whose neighborhoods always
  intersect. Its charts are copies of ℂ, but its point space is not Hausdorff.
- P¹(ℂ) has the two charts z and w with w=1/z: at z=2, w=1/2 and dw/dz=−1/4.
  It is compact; A¹(ℂ) is not, since the sequence of positive integers is unbounded.
- The node xy=0 has tangent dimension 2 at (0,0) and dimension 1 along each
  punctured branch, so smooth one-dimensional charts cannot be assigned there.
  On Gₘ, z↦z² has derivative 2 at 1 and local inverse derivative 1/2; at 0 on A¹
  its derivative is 0 and there is no local inverse.
- An uncountable disjoint union of complex points is locally of finite type with
  discrete topology and is not second countable. The finite-type hypothesis in
  the countability assertion cannot be dropped.

*Needs:* native scheme points, affine presentations and open gluing;
Mathlib `TopCat.GlueData`, `IsProperMap`,
`AlgebraicGeometry.Smooth.exists_isStandardSmooth` and finite-dimensional complex
manifold carriers; Tau Ceti `AnalyticAt.exists_openPartialHomeomorph`;
SchemeAndStackFoundations §4.12 for the Chow-lemma proof route.

For the orbit application, if X is proper over k, the closed orbit model is proper.
Use SchemeAndStackFoundations §0.3's relative-Proj/projective-space carrier and the
projective-morphism properness theorem for projective X. Consume native
`IsProper (Proj.toSpecZero 𝒜)` at its `Algebra.FiniteType (𝒜 0) A` hypothesis and
transport through the actual projective-space/closed-immersion maps. Apply the
preceding complex-points functor and its subspace and properness comparisons.
A proper scheme over ℂ has compact
Hausdorff complex points; the closed orbit therefore has compact complex
points. To obtain its complex manifold, prove that the reduced orbit
model is smooth: over the perfect field ℂ its nonempty smooth locus
meets each component, and translations spread it to the whole orbit.
Consume native `Scheme.Hom.dense_smoothLocus_of_perfectField` and its
open smooth locus, restricting to the reduced component loci as needed.
Construct the corresponding charts and compare with the existing
finite-dimensional closed-subgroup quotient construction of
SmoothBundlesConnections B1.4. Pin H=Stab_G(x), the actual map G(ℂ)→O_x(ℂ)
and its fibres. Consume SmoothBundlesConnections B1.0 for regular fibres and transverse
fibre products, B1.1 for principal-bundle comparisons and B1.4 for the
closed-subgroup quotient, applied first to the underlying real manifolds. Prove the complex orbit map
is a holomorphic submersion using characteristic-zero separability:
prove the generic maximal-rank statement from the actual function-field
extension and Jacobian criterion, then spread the smooth/rank locus by
the source/target translation equations. This bounded orbit-map
separability/rank adapter is part of this phase, not assumed action data.
Then construct holomorphic local sections by the analytic inverse theorem.
Prove the induced biholomorphic homogeneous-space
identification G(ℂ)/H(ℂ)≃O_x(ℂ). This is downstream of the direct
orbit construction and the characteristic-zero stabilizer-smoothness
theorem. It does not assume an algebraic quotient G/H was already
represented. The compact manifold can be disconnected. A closed orbit
in affine X need not be compact, and an arbitrary projective orbit
need not be closed or compact.

**Checks.**

- For two identity maps of ℝ, the fibre product is the diagonal with tangent
  {(v,v)}, and its dimension is 1+1−1=1.
- For two squaring maps at (0,0), the derivative ranges sum to {0}, not ℝ;
  the crossing x²=y² fails the supplier's transversality hypothesis.
- For the additive complex group acting on ℂ by translation, H=1 and the
  quotient-to-orbit map is z↦z with complex derivative 1 and real rank 2.
  This distinguishes the holomorphic comparison from a bare smooth quotient.

**3A.6 Projective representation and restriction maps.** For a nonzero
finite-dimensional rational G-module V retain the original G and its
homomorphism ρ:G→GL(V). Construct the dual action
(g·ℓ)(v)=ℓ(ρ(g⁻¹)v) on V*, its regular action on P(V*) and the O(1)
linearization. Consume the generic relative-Proj/tautological line and
projective-space H⁰ calculation from SchemeAndStackFoundations0.3/2.6
and AlgebraicVectorBundles. Prove the actual natural identification
H⁰(P(V*),O(1))≃V (using finite-dimensional double duality) and its
equivariance. Choose a closed orbit X in P(V*) by 3A.4; construct the
G-equivariant restriction r:V→H⁰(X,O(1)|X), including multiplication,
pullback and section evaluation in trivializations. At x=[ℓ] choose
v with ℓ(v)≠0, proving r≠0. Its kernel is a rational G-submodule;
for irreducible V it is zero. When using point-group representations,
first prove the rational-submodule versus G(k)-stable-subspace adapter
by the density of k-points of the smooth group. Do not replace G by
GL(V), assume H⁰(X,O(1)) irreducible, or assume restriction surjective.
H⁰ finiteness uses the existing proper/coherent theorem, separately
from this kernel argument. Any comparison with holomorphic sections
uses the specified proper coherent comparison later; no Borel–Weil or
cohomological vanishing premise enters the injection. For connected
reductive G, identifying H with a parabolic and the line with a
dominant-weight associated bundle is the later Layer7/SchubertGeometry
application, not an input to generic orbit existence.
For the compact U(n) source specialization, first consume the actual
compact-to-rational GL_n(ℂ) representation dictionary from the existing
classical/compact representation suppliers. Do not apply an algebraic
action theorem directly to a bare continuous compact-group action.

**3A.7 Regularity, tests and conventions.** Compare a rational/comodule
representation with its actual scheme morphism, all action equations,
and regular matrix coefficients. On GL_n these lie in
k[x_ij,det⁻¹]; arbitrary rational functions with poles on GL_n are
not allowed. Prove that entrywise complex conjugation is not a complex
algebraic representation, by restriction to the nonholomorphic map
z↦bar z on a diagonal ℂ* (n>0); GL_0 is the separate trivial case.
Require the following complete tests with explicit action/orbit maps:
ℂ* acting by t·[u:v]=[tu:v] on P¹ has two closed fixed-point orbits
and the nonclosed open orbit ℂ*, whose boundary is those two points;
the finite constant group C₂ swapping coordinates has the disconnected
closed orbit {0,∞}; trivial actions give point orbits; zero V gives
empty P(V*) and no chosen orbit; dimension-one V gives P⁰.
In characteristic p, t·[u:v]=[t^p u:v] has the same geometric open
orbit but scheme stabilizer μ_p and zero orbit differential. Keep the
local-closedness/boundary theorem, but do not infer smooth orbit maps,
tangent-image equality, or a separable homogeneous quotient from it
without the actual stabilizer/separability hypotheses.

The generic algebraic construction belongs here. SchemeAndStackFoundations
retains generic constructibility/dimension/projective/coherent geometry,
Section 3A.5 supplies the classical topology and smooth charts, while
LieGroups supplies finite-dimensional analytic quotient/manifold theory.
NilpotentOrbits' adjoint orbit and SchubertGeometry's highest-line/flag
comparison consume or compare with this earlier phase without becoming
its prerequisites. The orbit headline statements are in
`Suggested.lean` in the namespace `AlgebraicOrbits`, with actual scheme action
maps and no quotient-representability assumption.

### Examples

Scaling on P¹ has one one-dimensional orbit and two closed zero-dimensional orbits. A fixed point has empty boundary of dimension −∞.

### Dependencies

*Needs:* Layers 0–1; Layer 3 subgroup language; SchemeAndStackFoundations §0.7; the complex comparisons named in §3A.5.

## Layer 4: Jordan decomposition, diagonalizable groups, tori

### 4.1 Geometric Jordan decomposition

For an affine finite-type group scheme G over any field k and g∈G(k̄), transport
the native point Jordan decomposition through the Layer 0 dictionary. Identify
its two factors with the semisimple and unipotent parts in every rational
scheme representation from Layer 1; the comparison preserves the unique
commuting factorization g=g_s g_u. Over a perfect field this factorization
is defined over k for g∈G(k); over an imperfect field the assertion remains
geometric (Milne, Theorems 9.11 and 9.18, pp. 168, 170).

- The comparison intertwines the native factor maps with scheme homomorphisms
  and faithful closed representations, independently of their choice (Milne, §§9.19–9.21, p. 171).
- In the transported scheme representation, semisimple elements have unipotent
  part 1 and unipotent elements have semisimple part 1; the native product formula
  for commuting elements gives the componentwise decomposition
  (Milne, Theorem 9.11 and its polynomial-factor proof, pp. 168–169,
  and Theorem 9.18, p. 170).
- The scheme-point comparison commutes with the native factor maps under
  extension of perfect fields and further extension after passing to k̄ (Milne, proof of Theorem 9.11, pp. 168–169).

**Checks.**

- The identity, including in the rank-zero group, has parts (1,1); a decomposition
  into arbitrary commuting factors would also allow (a,a⁻¹) and is excluded.
- For g=[[2,1],[0,2]] over ℚ, g_s=2I and g_u=[[1,1/2],[0,1]], whose product is g;
  assigning the off-diagonal entry to the semisimple factor fails diagonalizability.
- In characteristic 2, g=I+E₁₂ has g²=I but g_s=I and g_u=g; finite order alone
  does not imply semisimplicity in the defining characteristic.

*Needs:* Layers 0–1; native finite-dimensional Jordan decomposition; faithful
closed representations and their tensor compatibility.

### 4.2 Diagonalizable groups

Use the native diagonalizable group D(M)=Spec k[M] for a finitely generated
abelian group M and its native anti-equivalence. Here Δ(u_m)=u_m⊗u_m,
ε(u_m)=1 and S(u_m)=u_(−m). The scheme-facing targets identify the
native Hopf exact sequences with the represented fppf quotients of Layer 3,
and characterize smoothness and the torus locus in those same group objects (Milne, Proposition 12.3 and Theorems 12.8–12.9,
pp. 231–234).

- In the quotient comparison, use the native identification D(M)(R)=Hom(M,Rˣ)
  for every commutative k-algebra R, so M→N induces D(N)→D(M) by precomposition (Milne, Proposition 12.3,
  pp. 231–232).
- Identify the reversed native Hopf exact sequence with the Layer 3 fppf
  sequence, including its kernel and represented quotient
  (Milne, Theorem 12.9(b)–(c), pp. 233–234).
- If char(k)=p>0, D(M) is smooth precisely when multiplication by p on M is
  injective; in characteristic zero every D(M) is smooth. It is a split torus precisely
  when M is torsion-free (Milne, Remark 12.5, p. 232, Definition 12.14, p. 236).

**Checks.**

- M=0 gives the trivial group, while M=ℤ gives Gₘ; evaluation of the character
  3 on the cocharacter −2 is t↦t⁻⁶, fixing the contravariant pairing convention.
- M=ℤ/2 over ℂ gives μ₂ with two reduced points; replacing M by its torsion-free
  quotient would incorrectly give the trivial group.
- M=ℤ/p over characteristic p gives μₚ with coordinate ring k[u]/(uᵖ), where
  t=1+u. It has one geometric point and tangent dimension 1, so it is not smooth.
- The map ℤ→ℤ given by multiplication by 2 induces t↦t² on Gₘ; its kernel is μ₂,
  not the trivial group, even in characteristic 2.

*Needs:* Layer 0 group-algebra/Hopf dictionary; Layer 1 rational representations;
Layer 3 subgroup schemes and fppf exactness.

### 4.3 Groups of multiplicative type and torus lattices

Use the native multiplicative-type, torus and split-torus predicates. Compare
their algebraic-closure definitions with splitting over a separable closure kˢ:
multiplicative type means diagonalizable there, and a torus becomes Gₘʳ for
finite r. Compare the native geometric character and cocharacter carriers with
X*(G)=Hom_(kˢ)(G_(kˢ),Gₘ) and X_*(G)=Hom_(kˢ)(Gₘ,G_(kˢ)). Prove, over arbitrary
fields, the anti-equivalence with finitely generated abelian groups carrying
continuous Galois action, restricting to finite free lattices for tori, and its
agreement with the native perfect-field equivalence (Milne, Definitions 12.14 and 12.17,
pp. 236–237, and Theorem 12.23, p. 240).

For a torus, the comparison must carry the native pairing to the exponent of
χ∘λ:t↦t^⟨χ,λ⟩, identifying the geometric lattices with mutually dual lattices (Milne, Theorem 12.9, pp. 233–234, and Theorem 12.23, p. 240).

- Characters defined over k are exactly the Galois-fixed geometric characters;
  a group of multiplicative type is split precisely when the action is trivial
  (Milne, §12g, pp. 239–240).
- A group of multiplicative type is a torus precisely when its geometric character
  group is torsion-free. Short exact sequences correspond contravariantly to
  short exact sequences of Galois modules (Milne, Theorem 12.23, p. 240).
- The comparison preserves the native perfect Galois-invariant pairing and the
  equation ⟨f*χ,λ⟩=⟨χ,f_*λ⟩ for f:T→T′. Base change restricts the Galois action, and purely inseparable
  extension leaves morphisms between groups of multiplicative type unchanged
  (Milne, Theorem 12.23 and Corollary 12.25, p. 240).

**Checks.**

- For Gₘ, both lattices are ℤ and ⟨3,−2⟩=−6. The rank-zero torus has zero
  lattices and the perfect pairing 0×0→ℤ.
- The real norm-one torus has both geometric lattices ℤ with conjugation acting
  by −1; its real character group is 0, although its geometric rank is 1.
  The pairing is invariant since (−m)(−n)=mn. Confusing k-characters with
  geometric characters would incorrectly give rank 0.
- μₚ in characteristic p is of multiplicative type with character group ℤ/p,
  but is nonreduced and is not a torus; its cocharacter group is 0, so no perfect
  integral lattice pairing exists for it.
- Gₐ is not of multiplicative type: its geometric character group is 0 but
  Gₐ has dimension 1, whereas D(0) has dimension 0.

*Needs:* §4.2; SchemeAndStackFoundations §1.1 and ModularCurves §0E for descent;
Layer 0 field extension; native character and cocharacter modules.

### Examples

For Gₘ, character and cocharacter lattices are ℤ with pairing (m,n)↦mn. The real
norm-one torus becomes Gₘ over ℂ, with conjugation acting on both lattices by −1.

### Dependencies

*Needs:* Layers 0–3; native character lattices and finite-dimensional Jordan
decomposition; the descent suppliers named in §4.3.

## Layer 5: solvable and unipotent groups; the unipotent radical

### 5.1 Unipotence and triangular representations

For an affine group scheme G of finite type over any field k, define
scheme-theoretic unipotence by the following representation condition: every
nonzero finite-dimensional rational G-module has a nonzero invariant vector.
Use Layer 1's comodule dictionary to express invariance by ρ(v)=v⊗1. Prove
that this is equivalent to a closed k-embedding G→Uₙ for some n, including
nonreduced G (Milne 2017, Proposition 14.3, Theorem 14.5 and Corollary 14.6,
pp. 280–282). The extension beyond the reduced geometric-point criterion
retains the infinitesimal group scheme.

- Compare the representation predicate, a full stable flag with trivial
  successive actions, and the represented upper-unitriangular embedding;
  all comparisons use the same coordinate Hopf morphism (Milne, 14.3–14.6).
- Prove invariance and reflection under every field extension and closure
  under closed subgroups, represented quotients and extensions, transporting
  the scheme maps through Layer 0 (Milne, Corollaries 14.7 and 14.9, p. 282).
- For smooth G, identify this predicate with geometric point unipotence.
  Prove every homomorphism from a unipotent k-group to a group of multiplicative
  type is trivial (Milne, Corollaries 14.12 and 14.18, pp. 283–284).

**Checks.**

- Gₐ embeds in U₂ by t↦I+tE₁₂; (tE₁₂)²=0. The zero-dimensional
  representation has no nonzero vector and is excluded by the quantifier.
- In characteristic p, αₚ is a subgroup of Gₐ and is unipotent. In contrast,
  μₚ has only the identity geometric point but its tautological one-dimensional
  comodule has coaction v↦v⊗t≠v⊗1, so its invariant subspace is 0.
- Gₘ has the weight-one comodule with invariant subspace 0. Over an
  algebraically closed field SL₂ has no nontrivial characters, yet its standard
  two-dimensional module has invariant subspace 0; both fail unipotence.

*Needs:* Layer 1's rational-module dictionary; Layer 0 base change; Layer 3
closed subgroup and represented quotient comparisons; the native reduced
embedding contract for its special case. The infinitesimal extension uses
Milne's coconnected coalgebra filtration in the proof of Theorem 14.5.

For smooth connected solvable affine G over an algebraically closed field,
transport Lie–Kolchin through the comodule dictionary: every finite-dimensional
rational representation admits a complete G-stable flag, with a character
on each one-dimensional quotient (Milne 2017, Theorem 16.30, pp. 334–335).
Here solvability means termination of the scheme derived series; identify it
with solvability of geometric points for smooth groups.

- Identify diagonal matrix coefficients with the characters on flag quotients;
  a stable line need not be fixed pointwise.
- Transport the flag along representation isomorphisms and compare the
  derived-series condition with the native solvability property.
- For smooth connected solvable groups over an algebraically closed field,
  prove that absence of nontrivial characters is equivalent to unipotence,
  using a faithful triangular representation (Milne, Theorem 16.30 and
  Corollary 14.18). For other fields this criterion uses geometric characters.

**Checks.**

- The upper triangular subgroup of GL₂ preserves ke₁; its two quotient
  characters are the two diagonal entries a and d. On diag(2,3) over ℚ̄
  they are 2 and 3, so a weight line need not have character 1.
- The real norm-one torus has no real characters and its standard real
  representation has no stable real line; over ℂ its weights are 1 and −1.
  This excludes a triangularization statement without algebraic closure.
- Over ℂ the standard representation of the constant solvable group S₃ has
  dimension 2 and no invariant line. It excludes omission of connectedness;
  for the trivial group every flag is stable.

*Needs:* native Lie–Kolchin as specified in the supplier contract; Layers 0–1
for scheme representations; Layer 3 for scheme derived subgroups; §4.3 for
geometric characters.

### 5.2 The unipotent radical and descent

For smooth connected affine G over any field k, compare the scheme subgroup
represented by the native k-radical Hopf quotient with the greatest smooth
connected normal unipotent k-subgroup Rᵤ,ₖ(G). Over k̄ write Rᵤ(G_k̄) for
the geometric radical. The comparison is an equality of subgroup schemes,
not merely of their k-points (Milne 2017, Corollary 14.8, p. 282, and
Proposition 19.9, pp. 399–400).

- Transport the native universal property and characteristicity to scheme
  subgroups: every smooth connected normal unipotent subgroup factors
  uniquely through the radical inclusion, and every group automorphism
  preserves it (Milne, Proposition 6.42 and §6.46, pp. 134–135).
- Prove the comparison commutes with separable algebraic extension. For k
  perfect, identify its extension to k̄ with the geometric radical by Galois
  descent; do not replace the native inclusion by equality for arbitrary
  inseparable extensions (Milne, Proposition 19.9, pp. 399–400).
- Compare the represented quotient G/Rᵤ,ₖ(G) with Layer 3's quotient map.
  Over a perfect field prove this quotient reductive; over arbitrary fields
  Layer 8 treats pseudo-reductivity (Milne, Proposition 19.11, p. 400).

**Checks.**

- Rᵤ(Gₐ)=Gₐ: its defining Hopf ideal is 0 and the quotient group is 1.
- Rᵤ(Gₘ)=1: its defining ideal is (t−1), not 0, and the quotient is Gₘ.
- Rᵤ(SL₂)=1 in every characteristic, although SL₂ contains the nonnormal
  subgroup U₂ of dimension 1. Maximality is among normal subgroups.
- For k=𝔽ₚ(t), K=k(t^(1/p)), and G=Res_(K/k)Gₘ from Layer 8,
  dim Rᵤ,ₖ(G)=0 but dim Rᵤ(G_k̄)=p−1. For p=2 these values are 0 and 1,
  so the geometric radical cannot descend to the k-radical.

*Needs:* native radical ideals and universal properties; §5.1; Layer 3
subgroup/quotient dictionary; ModularCurves §0E effective affine descent.
The restriction-of-scalars Check uses Layer 8's example, not its proof as
an input to radical construction.

### 5P: the shared polynomial-unipotent exponential and logarithm

Construct this characteristic-zero helper here, from Layers2–5, before the Levi-complement machinery of6A or the ordered-root/Bruhat construction of7C. It is the single polynomial exponential/logarithm package:6A.1 consumes its commutative-unipotent/vector-layer restriction, while7C consumes its full unipotent variety and subgroup comparison. Neither application is a premise, and there is no separate duplicate exponential engine. Keep all of Layer5's arbitrary-field unipotent scope; the finite-factorial argument of this subsection is specifically characteristic zero.

In characteristic zero construct the finite polynomial exp/log maps on a faithful upper-unitriangular realization of each smooth finite-type affine group with geometrically unipotent points used here, before presuming connectedness. Consume the actual faithful-comodule/upper-unitriangular embedding of Layer5 under its reducedness and algebraic-closure hypotheses, and prove the smooth/reduced and field-descent adapters rather than dropping them. For the finite-type closed subgroup schemes needed here, construct the characteristic-zero Cartier smoothness comparison using their coordinate Hopf algebra/invariant derivations and the tangent smoothness criteria of Layer2; transport it to the reducedness hypothesis of the faithful embedding. Do not assert that arbitrary closed subgroups of smooth groups in characteristic p are smooth. For d-by-d strict upper-triangular X and unipotent1+Z use exp(X)=sum_(0≤j<d)X^j/j! and log(1+Z)=sum_(1≤j<d)(−1)^(j+1)Z^j/j. Native [`IsNilpotent.exp`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/RingTheory/Nilpotent/Exp.lean#L50) supplies the finite exponential and its functoriality; construct the finite logarithm and inverse identities, not an unrelated analytic local logarithm. Prove restriction to the actual subgroup and its Lie algebra using its defining Hopf ideal: the invariant derivation attached to a tangent vector preserves that ideal and its finite Taylor exponential preserves the subgroup; conversely log(g) is tangent to the polynomial one-parameter subgroup g^t, whose integer values are powers of g and whose equations vanish identically in characteristic zero. Prove naturality for subgroup maps, independence of the faithful realization, compatibility with algebraic field extensions, and equivariance under every automorphism, in particular conjugation by T. This identifies U+ with its actual nilpotent Lie algebra as affine varieties, not as additive groups. Apply the Hopf-ideal argument also to a smooth closed subgroup with geometrically unipotent points before its connectedness is known: the faithful upper-unitriangular native theorem requires reducedness and finite type, not an extra connectedness assumption. Thus its exp/log restrictions identify it with its actual Lie subspace without presupposing component triviality. Over C compare these polynomials with the Lie exponential and prove their analytic maps inverse; hence U+(C) is contractible and simply connected. This uses no Bruhat, Iwasawa or highest-weight classification theorem. Do not use this characteristic-zero argument for arbitrary unipotent groups in characteristic p.

The scheme isomorphism and naturality are Milne 2017, §14.31 and
Proposition 14.32, pp. 288–289. Their subgroup restriction is a statement
about the actual defining Hopf ideal over characteristic-zero fields.

- Export exp:Lie(U)→U and log:U→Lie(U) as inverse scheme morphisms,
  with the derivative of exp at 0 equal to the identity.
- For a homomorphism f:U→V, prove f∘exp=exp∘df and
  df∘log=log∘f; these equations also fix conjugation equivariance.
- For commuting X,Y prove exp(X+Y)=exp(X)exp(Y); for general X,Y retain
  the noncommutative multiplication rather than an additive-group assertion.

**Checks.**

- For N=2E₁₂, N²=0, so exp(N)=I+2E₁₂ and log(exp(N))=2E₁₂.
  For the zero Lie algebra and the trivial group the maps exchange 0 and 1.
- In U₃ over ℚ, X=E₁₂ and Y=E₂₃ give exp(X)exp(Y) with (1,3)-entry 1,
  whereas exp(X+Y) has (1,3)-entry 1/2. This excludes additivity without
  the commuting hypothesis.
- For N=E₁₂+E₂₃, N²=E₁₃≠0 and N³=0. In characteristic 2 the coefficient
  1/2 does not exist; thus this polynomial formula is not the arbitrary-
  characteristic unipotence definition.

*Needs:* §5.1's represented unipotent embedding and Layer 2's differential;
Layer 3's Hopf-ideal subgroup dictionary; the native nilpotent exponential.

### Examples

The upper unitriangular subgroup of GL₂ has one additive root coordinate. For a 2-by-2 strictly upper triangular N, N²=0 and exp(N)=I+N, log(I+N)=N.

### Dependencies

*Needs:* Layers 1–4; characteristic-zero tangent comparison for §5P; native nilpotent exponential.

## Layer 6: reductive and semisimple groups

### 6.1 Geometric radicals and reductivity

For smooth connected affine G over k, identify the native reductivity predicate
with Rᵤ(G_k̄)=1 and the native semisimplicity predicate with R(G_k̄)=1,
where R is the greatest smooth connected normal solvable subgroup. Transport
the native solvable radical's universal property to the same scheme carrier
used in §5.2 (Milne 2017, §§19a–19b, pp. 397–400).

- Compare both predicates under every field extension and under isomorphism;
  semisimplicity implies reductivity (Milne, Propositions 19.5 and 19.13,
  pp. 398–400).
- Over a perfect field, identify R(G)_k̄ with R(G_k̄) and prove G/R(G)
  semisimple, with its represented quotient map (Milne, Propositions 19.1–19.2,
  pp. 397–398).
- For reductive G, compare R(G) with the largest subtorus of the schematic
  center Z(G); prove semisimplicity equivalent to finiteness of Z(G), without
  assuming the center smooth (Milne, §19b and Proposition 19.10, p. 400).

**Checks.**

- For Gₐ, R=Rᵤ=Gₐ, both dimensions are 1, and neither predicate holds.
- For Gₘ, dim R=1 and dim Rᵤ=0: reductivity holds and semisimplicity fails.
  For the trivial group both dimensions are 0 and both predicates hold.
- For SL₂, both radical dimensions are 0. In characteristic 2 its center
  μ₂ has coordinate algebra k[t]/((t−1)²), length 2 and tangent dimension 1;
  a nontrivial connected center does not refute semisimplicity when it is not smooth.

*Needs:* §5.2 and native solvable radical; Layers 0–3 subgroup and quotient
comparisons; §4.3 for the central torus. Center, derived group and central
isogeny constructions, including simply connected and adjoint forms, are the
classification targets of Layers 8 and 9B; the criterion about the center
uses those constructions and is not a prerequisite for them.

### 6.2 Linear reductivity and its characteristic dependence

On Layer 1's rational representation category, compare complete reducibility
of every finite-dimensional module with the native linear reductivity
predicate. Prove that for smooth connected affine G in characteristic zero
it is equivalent to reductivity as defined in §6.1, as stated by
`reductive_iff_linearlyReductive` on `TauCeti.FiniteTypeCommHopfAlgCat` with explicit
`CharZero`, smoothness and geometric connectedness hypotheses (Milne 2017, Definition 12.52,
p. 248, and Theorem 22.42, pp. 477–478). For smooth connected affine G over
an algebraically closed field of characteristic p>0, prove linear reductivity
is equivalent to being a torus (Milne, Remark 12.56, p. 249).

- Relate complete reducibility to G-stable complements for every submodule
  of a finite-dimensional rational module, through the actual comodule
  equivalence (Milne, Remark 12.53, p. 248).
- Identify the projection onto invariants along the sum of nontrivial simple
  summands when linear reductivity holds; it is natural for module maps,
  not an algebra homomorphism on every G-algebra (Milne, §12l, p. 249).
- Apply the equivalence to tori and characteristic-zero reductive groups with
  their rational representations, retaining the field characteristic in each
  implication (Milne, Proposition 12.54 and Theorem 22.42).

**Checks.**

- Gₘ acting on k[x,x⁻¹] by weights has invariant projection xᵐ↦0 for m≠0
  and 1↦1. Thus the projection of xx⁻¹ is 1 whereas the product of the two
  projections is 0; it is not multiplicative.
- For Gₐ acting by I+tE₁₂, ke₁ is stable and has no stable complement:
  e₂+ae₁ maps to e₂+(a+t)e₁. This fails complete reducibility over any field.
- For SL₂ in characteristic 2, Sym²(k²) has stable span{x²,y²}. Any lift
  xy+ax²+by² of its one-dimensional quotient acquires a term t x² under
  y↦y+tx, which cannot vanish identically with the t² term. The extension
  does not split, although SL₂ is reductive. In characteristic zero SL₂
  satisfies complete reducibility instead.
- In characteristic p, μₚ is linearly reductive because its rational modules
  are graded by ℤ/p, yet it is not a torus: its coordinate ring has length p
  and is nonreduced. The smoothness hypothesis in the torus criterion is essential.

*Needs:* Layers 1 and 4; §6.1's geometric predicate; the native linear
reductivity predicate. The characteristic-zero route uses `TauCeti.exists_isCompl_of_isKilling`
and Layer 8's center/derived comparison. Prove the required nondegeneracy of
the Killing form on the derived Lie algebra and equality of group-stable and
Lie-stable subspaces for connected groups in characteristic zero, through
Layer 2's differential (Milne, §22g, proof of Theorems 22.41–22.42,
pp. 476–478). The structural construction in Layers 7–8 uses the geometric
predicate of §6.1, not this complete-reducibility equivalence; the torus route
uses weights.

### 6A: characteristic-zero Levi complements for general affine groups

Let k be a field of characteristic zero and G a smooth connected affine k-group
of finite type. Here G need not be reductive or be a parabolic in another
reductive group. Consume Layer5's geometric unipotent radical U=R_u(G),
its k-descent and smooth connectedness, and Layer3's represented quotient
q:G→Q=G/U; prove Q reductive with this actual quotient map. A Levi complement
is a closed k-subgroup L⊂G for which q|L:L→Q is a group-scheme isomorphism.
Construct such L, prove it connected and reductive, and construct the actual
semidirect-product group scheme U⋊L, with L acting on U by conjugation.
On every commutative k-algebra A its multiplication is
`(u,l)(u',l')=(u(lu'l⁻¹),ll')`; the isomorphism U⋊L→G sends `(u,l)` to ul.
Its inverse sends g to `(g s(q(g))⁻¹,s(q(g)))`, where
`s:Q→G` is the splitting with image L. Construct these as scheme morphisms
and prove both inverse identities, not just a bijection on k-points.

Build the following algebraic splitting machinery before proving this theorem.
It uses Layers0–1's same affine/Hopf and native right-comodule carriers,
Layer3's quotients and Layer5's unipotent structure, followed by Layer6's
characteristic-zero equivalence between reductivity and linear reductivity.
It uses neither the parabolic Levi theorem of Layer7 nor an integration of an
arbitrary Lie subalgebra.

1. **Equivariant vector layers and regular sections.** For a connected
   unipotent k-group U normal in G, construct a finite descending filtration
   `U=U₀⊃U₁⊃⋯⊃U_m=1` by smooth connected k-subgroups characteristic in U,
   normal in G, with `[U,U_i]⊂U_(i+1)` and vector-group quotients
   `V_i=U_i/U_(i+1)`. The strictly descending nontrivial layers can be obtained
   from the lower central series. Prove in characteristic zero that each
   commutative unipotent layer is canonically linearizable through its Lie
   algebra, using polynomial unipotent exponential/logarithm on a faithful
   matrix realization and proving subgroup preservation and independence of
   the realization. Conjugation consequently gives an actual rational linear
   Q-action on V_i. Retain Q's central torus in this action. These are
   constructions of the filtration and linearization, not additional hypotheses
   restricting G. From Layer0's faithfully-flat torsor/descent machinery prove
   vector-group torsors over affine k-schemes trivial: construct the additive
   descent cocycle and solve it by the exact affine module/Amitsur sequence.
   Induct through split-unipotent layers to obtain regular sections for the
   quotients used here. Prove in particular U(k)→(U/U₁)(k) surjective.
   A regular section of varieties is not asserted a group homomorphism.
2. **Rational algebraic cohomology and averaging.** For an affine k-group H
   and rational H-module V consume §1.1’s
   generic rational-cohomology construction for a flat commutative coordinate Hopf
   algebra and an arbitrary right comodule, specialized to the field k. The canonical
   generic cofree-resolution, enough-injectives and derived-invariants API is owned
   in §1.1, consuming the native comodule/cofree foundations used in
   Layer1; no later relative, spectral or arithmetic layer is an input. Preserve its
   arbitrary-module generality. Transport its coefficient-first complex by the supplied
   tensor permutation to `Cⁿ_alg(H,V)=k[H]^(⊗n)⊗V`, with C⁰=V and tensor unit in degree0.
   Here V^H is defined by `coact(v)=v⊗1`, not only by invariance under H(k). For
   finite-dimensional V construct the identification with regular maps Hⁿ→V; no
   complex of arbitrary functions on H(k) is substituted. With the left point action
   and left-factor-first Hopf convention, the inhomogeneous differential is
   `dc(g₁,…,g_(n+1))=g₁·c(g₂,…,g_(n+1))`
   `+Σ_(j=1)^n(−1)^j c(g₁,…,g_j g_(j+1),…,g_(n+1))`
   `+(−1)^(n+1)c(g₁,…,g_n)`.
   Transport §1.1’s d²=0, H⁰=V^H, coefficient functoriality, connecting maps
   and derived-invariants comparisons through these exact coface/convention maps.
   Construct the normalized-subcomplex comparison and extension-of-field compatibility
   needed here. Consume the native abelian `TauCeti.ComoduleCat` for flat coordinate
   coalgebras and `Comodule.cofree`, `Comodule.Hom.cofreeUnit`,
   `Comodule.Hom.cofreeEquiv` and `ComoduleCat.cofree`; §1.1 constructs
   their categorical injectivity/cofree-resolution comparisons without requiring V
   flat, finite-dimensional or injective. This layer constructs the regular-function,
   normalization and field transports and the reductive averaging application below. For reductive Q in characteristic zero, transport Layer6's
   finite-dimensional complete reducibility to the native
   `Coalgebra.IsLinearlyReductive` hypothesis and consume
   `Comodule.Hom.exists_fixed_preimage_of_isLinearlyReductive`,
   `fixedMap_surjective_of_isLinearlyReductive` and
   `exact_fixedMap_of_isLinearlyReductive` from
   `TauCeti.Algebra.Coalgebra.Comodule.LinearlyReductive.Fixed`.
   These already lift invariant vectors in arbitrary rational modules by
   Layer1's finite-subcomodule reduction and an equivariant splitting of its
   finite-dimensional image; retain this comparison with the scheme-level
   invariants. Construct the resulting Reynolds splittings/acyclicity
   comparison, and prove `Hⁿ_alg(Q,V)=0` for n>0. This algebraic averaging
   uses rational representations over k, not a Haar probability measure on Q(k).
3. **Vector extensions and explicit sign conventions.** For a smooth affine
   extension `1→V→E→H→1` by a vector group with the specified rational
   H-action, construct a regular normalized section s using item1. Define
   `s(g)s(h)=i(c(g,h))s(gh)`; associativity is exactly the algebraic
   2-cocycle equation. Identify E, as a variety and as an extension, with
   V×H having product
   `(v,g)(w,h)=(v+g·w+c(g,h),gh)`.
   If `s_b(g)=i(b(g))s(g)`, prove `c_b=c+db`, where
   `db(g,h)=g·b(h)−b(gh)+b(g)`. Thus a solution c=da gives the
   homomorphic section s_(−a). Prove independence of the cohomology class,
   classification of these extensions with identified kernel/quotient/action
   by H²_alg, and the split criterion. In the split extension, sections are
   precisely regular 1-cocycles a:H→V. If `a(g)=g·v−v`, then
   `s_a(g)=i(−v)s₀(g)i(v)`; prove this identity with the displayed product.
   Vanishing H¹_alg gives conjugacy by V(k). Include V=0 and the trivial
   action, and prove that the kernel coordinate action term cannot be omitted.
4. **Induction and all complements.** Apply H² vanishing to
   `G/U₁`, an extension of Q by V₀. Pull back its resulting complement to
   G and induct on the remaining unipotent filtration. Prove that this
   pullback is smooth connected affine of finite type, with unipotent radical
   U₁ and reductive quotient Q, before
   applying the induction. This constructs L and the scheme isomorphism
   above without assuming a Levi complement in the induction inputs.
   For two Levi complements first use H¹ vanishing in G/U₁, lift its
   conjugating V₀(k)-point to U(k) by item1, and then induct in the
   preimage of the common complement. Prove that U(k) acts transitively
   on the set of k-Levi complements and that the stabilizer of L is
   C_U(L)(k): an element of U normalizing L acts trivially on its quotient
   Q and hence centralizes L. Construct the orbit bijection with
   `U(k)/C_U(L)(k)` as a set of group cosets, and distinguish this from
   any asserted representability of a complement-parameter functor.
   Conjugators need not be unique.

Export the quotient, chosen section/complement, multiplication isomorphism,
its point-functor/Hopf comparisons and their identity/composition diagrams.
Prove extension of scalars carries any chosen complement, its action and its
scheme isomorphism to the corresponding data over every field extension;
this does not assert that every complement after base change descends.
Different choices are related by the conjugacy theorem, not a canonical
functorial choice of L. Differentiate the actual scheme isomorphism to obtain
`Lie(G)≃Lie(U)⋊Lie(L)` and compare with Layer2; a general Lie-algebra splitting
is not used to assert an algebraic complement. Keep the full reductive
central torus, arbitrary unipotent dimension, U=1 and Q=1 cases.

Give explicit tests on a torus acting on a vector group, upper-triangular
invertible matrices, a connected reductive group (U=1), a connected unipotent
group (L=1), and L×G_a. In the last example all of U centralizes the same
complement, disproving uniqueness of the conjugating element. Under k=ℂ
compare this exact algebraic decomposition with the underlying holomorphic
group and use LieGroups Layer7 only for the already reductive factor's
compact real form. There is no asserted Levi splitting for all groups in
positive characteristic; Layer7's separate all-field parabolic theorem
retains its hypotheses and is not replaced by this characteristic-zero lane.
The regular extension/cohomology route is discussed in
[McNinch §§2.2–2.3,3.1,4.1,4.3–4.5,5.1–5.2](https://arxiv.org/html/1007.2777v1).

### 6B: affine quotients by reductive subgroups

Let k be an algebraically closed field of characteristic zero, A an affine
algebraic group of finite type over k, and H a closed subgroup whose identity
component is reductive. Neither A nor H is required to be connected, and A
need not be reductive. Construct the fpqc quotient A/H and identify it
with Spec(O(A)^H), where H acts on O(A) by right translations. The quotient is
therefore affine (Arzhantsev, *Invariant Ideals and Matsushima’s Criterion*,
arXiv:math/0506430v1, Proposition 2.2, p. 2). Construct its quotient map and
H-torsor comparison A×H→A×_(A/H)A, (a,h)↦(a,ah).

Build the Reynolds projection O(A)→O(A)^H from §6.2, first projecting to
H⁰-invariants and then averaging over the finite group H/H⁰; its order is
invertible in k. Prove finite generation
of the invariant algebra and separation of closed H-orbits, and identify the
resulting affine quotient with the homogeneous quotient of Layer 3. These are
construction targets, including the invariant-theory steps used in Arzhantsev's
proof of Proposition 2.2, not consequences of an arbitrary orbit-set bijection.

- The quotient map q:A→A/H is faithfully flat and its pullback identifies
  O(A/H) with O(A)^H. For every k-scheme Y, composition with q identifies
  morphisms A/H→Y with H-invariant morphisms A→Y, by fpqc descent.
- For every k-scheme S, identify (A/H)×ₖS with the quotient A_S/H_S;
  the torsor comparison and the invariant-algebra comparison commute with
  this pullback. Over affine S=Spec R the coordinate equation is
  O(A)^H⊗ₖ R ≃ (O(A)⊗ₖ R)^(H_R).
- The Reynolds projection fixes each invariant and is O(A)^H-linear;
  it need not preserve products of arbitrary functions. The inclusion of
  invariants, rather than this projection, is the coordinate algebra map.

**Checks.**

- For H=1 the invariant algebra is O(A), q is the identity, and
  A×1→A×_A A is the diagonal isomorphism; the quotient has dimension dim A.
- For H=A with A⁰ reductive, invariants are k and the quotient is Spec k, of dimension 0;
  (a,h)↦(a,ah) has inverse (a,b)↦(a,a⁻¹b).
- For A=SL₂ and H=T diagonal, write its coordinates as a,b,c,d with ad−bc=1.
  The right-T invariants x=ab, y=cd and z=ad satisfy xy=z(z−1), giving
  the affine surface Spec k[x,y,z]/(xy−z(z−1)), of dimension 2.
- For A=Gₐ×Gₘ and H=Gₘ, right translation fixes x and sends t to ts.
  Thus k[x,t,t⁻¹]^H=k[x] and A/H=Gₐ has dimension 1, although A has
  a one-dimensional unipotent radical. Over R=k[ε]/(ε²), the same comparison
  gives R[x,t,t⁻¹]^(H_R)=R[x], retaining the nonzero nilpotent ε.
- For A=Gₘ and H=μ₂, H⁰=1 and averaging sends t to 0 and t² to t².
  The invariant algebra is k[t²,t⁻²]; the quotient map t↦t² has degree 2.
  For a constant S₃ ambient group and a transposition subgroup C₂, the
  invariant algebra is k³ and each of the three quotient fibers has two points.
- For the upper Borel B⊂SL₂, the quotient is ℙ¹ and has only constant
  regular functions. Its dimension is 1 whereas Spec O(ℙ¹) has dimension 0;
  B is not reductive, so the asserted affine identification does not apply.
- On O(Gₘ), the projection for translation sends t and t⁻¹ to 0 but
  sends tt⁻¹=1 to 1; the two products are 0 and 1 respectively.

Specialize to k=ℂ and apply this construction to GLₙ/G for every faithful closed
connected reductive G→GLₙ. FormalConnectionsOpers §3A.5 consumes it for its loop-Grassmannian
reduction-locus application.

*Needs:* Layer 1 rational comodules; §6.2 complete reducibility and invariant
projection; Layer 3 homogeneous quotients; §3A closed orbits; §0.3 fpqc descent.
The finite generation and closed-orbit separation for this quotient are targets
of this subsection, preceding its torsor identification.

### Examples

GL₂ has trivial unipotent radical and one-dimensional central torus. Upper triangular GL₂ has a one-dimensional unipotent radical; it is not reductive.

### Dependencies

*Needs:* Layers 1–5; §1.1 cohomology for §6A; Layer 3 quotients for §6B.

## Layer 7: structure theory

### 7.1 Borel subgroups and maximal tori

For smooth connected affine G over an algebraically closed field, compare
its Borel subgroups with maximal smooth connected solvable closed subgroups,
and its maximal tori with maximal closed torus subgroups. Prove conjugacy
of Borels and of maximal tori by G(k), and that G/B is proper (Milne 2017,
Definition 17.6 and Theorems 17.9–17.10, pp. 353–355). For arbitrary k,
Borel k-subgroups mean subgroups that become Borels over k̄; existence of a
k-Borel is not asserted for every k-group.

- Identify the subgroup inclusions and their transports under conjugation
  with the native Borel and torus predicates.
- For reductive G, prove every pair of geometric Borels contains a common
  maximal torus by applying the Bruhat decomposition of §7.3. For fixed T,
  compare Borels containing T with positive systems of the extracted roots
  (Milne, Theorem 21.80, p. 450, and Theorem 21.32, pp. 434–435).
- Compare the quotient map G→G/B with the flag parametrization and its
  stabilizer; these are scheme maps, not just a list of conjugate point groups.

**Checks.**

- In GL₂, upper and lower triangular Borels intersect in the diagonal torus
  of dimension 2; GL₂/B is ℙ¹, of dimension 1.
- For G=Gₘ, the unique Borel and maximal torus both equal G, so G/B=1.
- In SL₂, the standard upper Borel fixes [1:0]; its orbit on [0:1] is
  {[a:1] : a∈k}. Its two orbits on ℙ¹ have dimensions 0 and 1.

*Needs:* Layers 1, 3 and 3A's orbit and proper-quotient geometry; §5.1's
Lie–Kolchin comparison; §4.3's tori; §7.3's root extraction for the
positive-system comparison. The Borel existence and conjugacy argument
precedes that comparison.

### 7.2 Parabolic subgroups and Levi complements

For smooth connected affine reductive G over any field k, define a parabolic
k-subgroup P as a smooth closed subgroup for which G/P is proper. Prove
that Rᵤ(P_k̄) descends to a smooth connected k-split normal subgroup U of P.
Define a Levi complement as a closed k-subgroup L for which L→P/U is an
isomorphism, and prove such L exists.
Equivalently, multiplication U⋊L→P is a group-scheme isomorphism with
conjugation action (Conrad–Feng, *Reductive Groups over Fields*, version of
December 5, 2020, §6.3, p. 53, and Proposition 12.3.1, p. 127).

- Compare P with P_G(λ), U with U_G(λ), and L with Z_G(λ) for a suitable
  k-cocharacter λ, using the scheme-level extension of the dynamic point APIs.
- Prove U(k) acts simply transitively by conjugation on the Levi k-subgroups
  of a fixed P; every maximal k-torus of P lies in a unique Levi complement
  (Conrad–Feng, Proposition 12.3.1, p. 127).
- Export the quotient projection, splitting and multiplication/inverse maps;
  transport them under field extension and conjugation. Layer 7b adds the
  finite-field intersection and transporter comparisons.

**Checks.**

- For the upper Borel of GL₂, U consists of I+aE₁₂ and L is the diagonal
  torus. Conjugating diag(s,t) by I+aE₁₂ gives upper entry a(t−s).
- For P=G, U=1 and the only Levi complement is G, so the simply transitive
  action is the one-element action.
- For λ(t)=diag(t,1), conjugation sends E₁₂ to tE₁₂ and E₂₁ to t⁻¹E₂₁;
  thus P_G(λ) is upper triangular, while −λ gives the opposite parabolic.
  This computation remains valid over 𝔽₂ on the group scheme Gₘ, even
  though Gₘ(𝔽₂) has only one element.

*Needs:* Layers 3–5; §6.1's geometric predicate; §7.1; native dynamic
subgroups and their representability comparison. No characteristic-zero
Levi theorem from §6A is used for this arbitrary-field parabolic statement.

### 7.3 Root extraction and Bruhat decomposition

For split reductive G over k with specified split maximal torus T, construct
the full datum (X*(T),Φ,X_*(T),Φ∨). Here Φ consists of the nonzero T-weights
on Lie(G), the root subgroups give the coroots via the rank-one maps, and
W=N_G(T)/T acts by the resulting reflections. Prove the reduced root-datum
axioms on these actual lattices (Milne 2017, §21b, Corollary 21.12 and §§21.17–21.18,
pp. 430–432). Compare the datum under field extension and group isomorphism.
For nonsplit G, retain the geometric datum and its Galois action; for a
maximal split torus construct the relative root system, allowing nonreduced
systems and higher-dimensional root spaces (Conrad–Feng, §§12.1–12.3).

- Prove the character/cocharacter pairing and root/coroot maps agree with
  the native lattice pairing and rank-one subgroup differentials.
- Given a Borel B containing T, identify B's roots with a positive system
  and its simple roots with a base of the same full datum.
- Prove the Bruhat strata U_w n_w B and flag cells U_w n_w B/B form
  disjoint decompositions, with U_w≃𝔸^(ℓ(w)); multiplication U_w×B→U_w n_w B
  is an isomorphism. Deduce B(k)\G(k)/B(k)≃W for split G over any field
  (Milne, Theorem 21.80, p. 450). The ordered coordinates are §7C's target.
- Construct the BN-pair on G(k) with B(k), N_G(T)(k) and this same Weyl
  group in the split case, proving the generating, intersection and
  rank-one multiplication axioms; compare with the dynamic parabolic
  construction (Milne, Proposition 21.75, p. 448).

**Checks.**

- For Gₘ, Φ is empty, both lattices are ℤ, W=1 and G/B=1; discarding
  the central lattice would confuse this with the trivial group.
- For SL₂ with diagonal parameter t, the positive root is t↦t² and its
  coroot is t↦diag(t,t⁻¹), so the pairing is 2, including in characteristic 2
  where the differential of t↦t² is zero. The root remains an integral character.
- For GL₂ over 𝔽_q, the two flag cells have 1 and q points, giving q+1
  points on ℙ¹. At q=2 the values are 1,2,3, not two singleton cells.
- For the real norm-one torus the geometric rank is 1 and the real split
  rank is 0; both root sets are empty, but the two lattice actions differ.

*Needs:* §7.1, §7.2, Layers 2–5 and §6.1; RootSystems Layers 1–4 for
finite root combinatorics; §7C's algebraic root-group coordinates for Bruhat.
No use of §6.2's linear reductivity or Layer 8 classification enters the
root extraction or ordered-root construction.

### 7C: ordered unipotent factors and the contraction proof of Bruhat coordinates

Build this phase inside Layer7, before consuming its final Bruhat decomposition. Keep the actual connected smooth affine reductive group G, maximal torus T, B+=T⋉U+, opposite B− and full character/cocharacter lattices. For split G over a field construct the root subgroups and their rank-one maps on this actual group, with their closed immersions, tangent root lines, torus-conjugation equations and positive-root generation of U+. These early root maps are a construction from the given group, not an application of the later classification of split groups or of9B's separately constructed Chevalley group. Use Layers2–5's tangent, solvable and unipotent theory and [RootSystems Layers1–4](../RepresentationTheory/RootSystems/README.md)'s finite root/reflection API. Prove the root-string commutator and positive-height filtration laws needed for ordered collection. Keep every root type, isogeny and central torus. For a nonsplit group use the geometric statement after the specified algebraic closure and retain its actual descent data; no unqualified assertion about k-rational orbits or lifts follows. The generic all-field Bruhat target retains its generality; the complex contraction/cover proof below is a separate characteristic-zero proof route and does not supply a positive-characteristic exponential argument.

For the all-field early root-map phase, construct the scheme-theoretic centralizer of ker(α) in the given split group and its connected rank-one derived subgroup. Retain its actual central-isogeny lattice: the simply connected SL₂ map may have a kernel and is not declared an embedding of SL₂ for every group form. Construct its two smooth additive root groups as T-contracted subgroups and prove their parameterizations by Ga, their torus weights and their tangent maps. Prove the rank-one open multiplication chart and central isogeny by the actual rank-one coordinate equations, including
`x_α(a)x_−α(b)=x_−α(b/(1+ab)) α∨(1+ab) x_α(a/(1+ab))`
on the open set1+ab≠0, and `n_α(a)=x_α(a)x_−α(−a^−1)x_α(a)` for a≠0. This is the rank-one calculation inside the given group, not the final all-rank Bruhat decomposition. Prove the finite root-string conjugation and commutator polynomials by collecting in each rank-two subsystem using these actual parameterizations; keep the integer constants and signs determined by the chosen pinning, including their reductions in bad characteristic, and prove base-change compatibility. Construct the positive-height filtration by the closed subgroups generated by root groups of height at least r, prove its successive additive root-coordinate quotients, and prove generation by induction on height. This is the lower all-field supplier for ordered collection and the two-cell rank-one calculation. All of these construction and inverse obligations belong to this phase; later9B existence/classification, or the desired final group decomposition, is not a hidden supplier.

**7C.1 Consume the shared lower exponential.** Use Layer5P's actual polynomial exp/log isomorphism and its closed-subgroup, Lie, field-extension and automorphism comparisons. Its inputs are Layers2–5, so this use precedes both Levi splitting and the final Bruhat theorem. In the C route its analytic comparison makes U+(C) contractible and simply connected. The all-field root-height collection route above remains independent of this characteristic-zero helper.

**7C.2 The two specified root subsets.** With W acting on the left, fix a normalizer representative n_w and put
`A_w={β∈Φ+ : w^−1β∈Φ+}` and `I_w={β∈Φ+ : w^−1β∈Φ−}`.
Prove these partition Φ+, are closed under root addition when the sum is a root, and define their actual root Lie subalgebras. Define the closed intersection H_w=U+∩n_w U+ n_w^−1, with its scheme equalizer and Lie intersection, before asserting connectedness. Define J_w=U+∩n_w U− n_w^−1 similarly. In characteristic zero prove their Lie algebras are the sums over A_w and I_w, using the actual root decomposition and tangent intersection; prove the scheme stabilizers smooth at the stated hypotheses. The two Lie algebras are complementary in Lie(U+). With n_0 a longest representative, I_w=A_(w w0), so J_w=H_(w w0) after the root/intersection comparison. It is generally not H_(w0 w). Normalizer lifts differing by T give the same subgroups; provide the change-of-lift equations on all coordinates.

At e and w0 obtain H_e=U+, J_e=1 and H_w0=1, J_w0=U+. At a simple reflection s_i, H_(s_i) has all positive root directions except α_i and J_(s_i)=U_(α_i). At s_i w0, H_(s_i w0)=U_(α_i). These assertions do not identify H_(s_i) with a negative one-parameter root subgroup. In A2 with w=s1, H_w has roots α2,α1+α2, whereas H_(w0 w) has root α2 and overlaps it; the correct complementary subgroup has root α1. Include rank0, a pure torus, empty root systems and products, with empty coordinate products equal to the identity.

**7C.3 Actual action, derivative and closed rank-drop locus.** Work first over C without assuming either intersection connected or the desired product decomposition. Use the algebraic H_w×J_w action `(h,j)·u=h u j^−1`. If using h u j instead, use H_w×J_w^op and state its multiplication; ordinary right multiplication is not a left action of the ordinary direct product. In left-trivialized tangent coordinates the derivative at(1,1) of this action at u is
`L_u:(X,Y)↦Ad(u^−1)X−Y`.
Construct this actual bundle morphism, its coordinate matrix and every maximal minor in a chosen basis; show change of basis preserves its rank. Domain and target dimensions both equal dim U+. At1 the Lie direct sum makes L_1 invertible. The locus Z where its rank is smaller than dim U+ is the common zero locus of these regular maximal minors, and therefore closed. Prove conjugation by T transports the action, derivative and stabilizer, so Z is T-stable. Scheme stabilizer dimension and orbit dimension are related by the smooth characteristic-zero orbit-map calculation; finite rank alone is not an orbit-closure theorem.

Choose an actual positive integral cocharacter c∈Y, for example2ρ∨=sum_(β>0)β∨, and prove every positive root pairs positively with it. The symbolρ as a weight is not itself presumed a cocharacter, and the compact real torus cannot provide this contraction. Through exp/log, conjugation by c(z) sends each root coordinate X_β to z^〈β,c〉X_β and extends regularly to A1×U+, with value1 at z=0. For every nonempty closed T-stable subset S of U+ prove1∈S by this extension (or by the analytic limit for a classically closed S). Thus Z must be empty, since1∉Z.

Consume Layer3A's actual orbit local-closedness and finite-dimension comparisons, at the action just constructed. U+ is irreducible, being identified with affine Lie(U+) by the independent polynomial exponential. Every full-dimensional locally closed orbit is open in U+: its closure is all U+, and it is open in its closure. Two nonempty open orbits in this irreducible variety intersect, hence are the same. Therefore the action is transitive. Do not replace irreducibility/local-closedness by the assertion that connected spaces cannot have disjoint open subsets. Export the actual orbit map, stabilizer and full-rank equations, not merely transitivity as an unexplained assumption.

**7C.4 Components, the actual covering, and polynomial inverses.** H_w and J_w are closed finite-type algebraic subgroups stable under T. Their finite sets of connected components are fixed by the connected complex algebraic torus: construct the action on components, prove it continuous/algebraic into the finite discrete component set, and prove the orbit of each component is constant. Each component is closed in U+, so the contraction lemma forces it to contain1. Distinct components are disjoint, hence both subgroups are connected. The same proof applies to any closed T-stable subgroup of U+ at these hypotheses; it is not a claim about arbitrary closed subgroups of a connected Lie group.

Before this topological step, provide the actual analytic connected/path-connected and locally path-connected adapters for H_w and J_w: apply Layer5P to these smooth closed subgroups and their root Lie subspaces to obtain inverse polynomial maps and their continuous analytic maps. This supplies the relevant Euclidean-space topology directly; no unproved general algebraic-to-analytic connected-component comparison is assumed. The preceding torus/component argument remains a separate proof of the source's algebraic connectedness claim. Construct the analytic homogeneous quotient of H_w×J_w by the actual closed discrete stabilizer Γ of1. Use the preceding surjective local-diffeomorphism orbit map, prove its fibres are stabilizer cosets and construct the quotient identification with U+(C). Give evenly covered neighborhoods using an identity neighborhood V with V^−1V∩Γ={1}. The connected total space is therefore a connected covering of the simply connected U+(C), so Γ is trivial. Apply native [`IsCoveringMap.existsUnique_continuousMap_lifts`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Topology/Homotopy/Lifting.lean#L477) to the identity of the base with its chosen identity lift; use [`IsCoveringMap.eq_of_comp_eq`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Topology/Covering/Basic.lean#L367) on the preconnected total space for the other inverse. This comparison is constructed here, not imported: from the covering map, its basepoint and the stated connectedness hypotheses, the first lemma gives the continuous section through the basepoint and the second identifies the composite with the identity of the total space, so a connected covering of a simply connected, locally path-connected base is a homeomorphism. It is not necessary to assume the total space simply connected. Inverting the J coordinate gives the multiplication isomorphism H_w×J_w→U+ as a complex manifold; interchanging H and J gives J_w×H_w as well. The independent exp/log restrictions also show the factors contractible; this is not inferred from simple connectedness of the base. Retain the algebraic alternative check: a zero-dimensional smooth unipotent subgroup is finite étale, and in characteristic zero a finite unipotent subgroup is trivial.

Export regular polynomial inverses, not only analytic bijections. In characteristic zero use the positive-root-height filtration of the nilpotent Lie algebra and its finite BCH polynomial. To invert exp(X)exp(Y), at height1 split log(u) using the A_w/I_w projections; at height r subtract the BCH terms already determined at smaller heights and split the remaining height-r coefficient. Brackets strictly raise height, so the unknown height-r terms enter only as X_r+Y_r. This finite recursion gives polynomial maps with two-sided inverse and T-equivariance equations; repeat in the other order. It uses no presumed product decomposition. Over arbitrary split fields construct the corresponding ordered root-subgroup collection/inverse maps by the root-height filtration and rank-two commutator laws, with additive root-coordinate quotients and explicit parameter recovery; do not divide by factorials there. Prove the root/intersection equality, smoothness and connectedness by those actual maps at that generality. All-field group-form/base-change comparisons remain part of Layer7, not inferred from the C-covering proof.

**7C.5 Stabilizers, cell coordinates and existence without a circular premise.** For the actual right flag quotient G/B+, prove
`Stab_(U+)(n_w B+)=U+∩n_w B+ n_w^−1=H_w`.
The Borel's torus quotient and unipotence eliminate its torus part; prove that comparison on the actual subgroup, not by dimension alone. The orbit is the homogeneous space U+/H_w of right cosets, not generally a quotient group. Use the complement-FIRST factorization J_w×H_w→U+ to construct the isomorphism j↦j n_w B+ onto this orbit. Construct its regular inverse by the actual orbit/fppf quotient and factor maps; a bijection of closed points alone is insufficient. The Lie/root coordinate cardinality gives complex dimension |I_w|=ell(w), and real dimension2ell(w). The complement's left action is simply transitive.

Derive existence from the early rank-one group maps and generation by B+ and the negative simple-root subgroups. The UNION of the candidate B+ n_w B+ double cosets is stable: prove the rank-one multiplication inclusion into the two neighboring indices w,s_i w, then its minimal-parabolic two-cell equality. Individual cells need not be stable under a negative simple subgroup, and s_i w=w never holds for left multiplication in W. The union contains1 and is stable under the generating subgroups, so covers G. This is a proof of the covering, not an invocation of the final Bruhat theorem. For disjointness, the coordinate orbit above has exactly one T-fixed point: conjugation on J_w and the positive cocharacter force j=1. Distinct normalizer classes have distinct points n_w B+, using N_G(T)∩B+=T. Thus the candidate orbits have unique Weyl labels. Fix one lift n_w per label; arbitrary lifts are not intrinsically unique. The unique expression g=j n_w b now follows with j∈J_w, b∈B+. Construct right/left quotient and Borel-opposition transport before applying this convention to SchubertGeometry's negative-Borel cells.

Export the parabolic projection to G/P+ with its actual minimal W/W_P representatives, stabilizer/root subsets, affine coordinates and fibre maps; compare P/Q orbits with W_P\W/W_Q without treating different coset conventions as equal labels. In typeA give the actual upper-unipotent/upper-triangular reduction, block-parabolic flag and Grassmannian maps with their universal subspaces. The GL2 big-cell map is a↦u(a)n_0B+, or equivalently u(a)B−; u(a)B+ is constant. On P1 with the line model B+ stabilizing[e1], the former chart is a↦[a:1], with inverse x/y on y≠0. The rank-one chart and the A₂ factor-order and non-normal-stabilizer calculations are Checks of these coordinate maps. The generic flag CW/cohomology and coherent-line comparisons stay at their existing LieGroups/Schubert owners.

### Examples

The GL₂ open flag chart is a↦[a:1], whereas u(a)B⁺ is constant. In A₁, the two Bruhat cells have dimensions 0 and 1.

### Dependencies

*Needs:* Layers 2–5 and §6.1; RootSystems Layers 1–4; §5P for the complex contraction route.

## Layer 7a: finite fields, Frobenius and rational points

This layer owns Lang surjectivity for smooth geometrically connected finite-type
groups over finite fields, including nonreductive groups, and its fixed-coset and
exactness consequences. Layer 7g extends the endomorphism hypothesis to Steinberg maps.

Let `q=p^f`, `k=F̄_q`, and let `G₀` be a connected reductive group scheme of finite type over
`F_q`, with base change `G=G₀×_{F_q}k`. Define the geometric Frobenius `F` on `G` from the
`F_q`-structure: on the coordinate algebra it is the scalar extension of the `q`-power map
on functions of `G₀`. More generally, use this same definition for any `F_q`-form of the
geometric group; do not restrict the carrier to the split form. Prove the canonical group
equivalence `G^F ≃ G₀(F_q)` and its compatibility with morphisms and `F`-stable closed
subgroup schemes. Reserve “split q-Frobenius” for the case that `G₀` is split. State
separately the standard field-Frobenius and Steinberg hypotheses in every result.

Tau Ceti's `TauCeti.Bialgebra.iterateFrobeniusPoints` supplies the iterated prime-power
point map for its `ℤ`-bialgebra carrier. For a commutative `ℤ`-Hopf algebra, the fixed-point
equivalence `TauCeti.Bialgebra.frobeniusFixedPointsMulEquiv` identifies points fixed by that
map with points over the Frobenius-fixed coefficient ring; `Frobenius.FixedPoints` supplies
the corresponding pointwise comparison. Extend the point-functor comparison to arbitrary
`F_q`-forms, including nonsplit forms, at the hypotheses above.

Prove finiteness of `G^F` and of the rational points of named `F`-stable closed subgroup
schemes, and functoriality on these finite groups. Prove that for every smooth geometrically connected group of finite type over
F_q, the map g↦g⁻¹F(g) is surjective on geometric points. Prove H¹(F_q,G)=1
and rational-point surjectivity in a short exact sequence of smooth finite-type
groups whose kernel is geometrically connected. For an F-stable smooth connected
closed subgroup H of G, prove every fixed geometric coset in G/H has an F-fixed
representative, by solving the Lang equation in H. These are consequences of
Milne 2017, Theorem 17.96 and Corollaries 17.97–17.98, p. 383; inversion of the
input converts the source's convention to g⁻¹F(g).

**Checks.**

- On Gₐ over F₂, for a²+a+1=0 in F₄, F(a)−a=a²+a=1; the Lang map
  need not be onto F₂ when restricted to F₂-valued inputs.
- On constant C₂, F is the identity and g⁻¹F(g)=1 for both elements; the
  nonidentity element is missed, so geometric connectedness is essential.
- For the trivial group the image is {1}; for Gₘ over F₃, the Lang map is
  t↦t², and a square root of −1 in F₉ maps to −1.

*Needs:* Layer 3 quotients; Layer 3A orbit geometry; SchemeAndStackFoundations §0.29
finite-field Frobenius; SchemeAndStackFoundations §§1.14–1.18 torsors.

For every
F-stable closed subgroup used by this layer, prove the application adapter: finite type,
smoothness, geometric connectedness, and compatibility of its restricted Frobenius with the
q-Frobenius structure of this theorem. Establish these hypotheses separately for each
parabolic, unipotent radical, or connected centralizer to which the theorem is applied. Smoothness
is retained as an explicit hypothesis and a convenient adapter condition; this makes no
claim that point-level Lang fails for nonsmooth connected groups. Consume
`FiniteTypeCommHopfAlgCat.baseChangePointsMulEquiv` for the comparison
`G₀×_{F_q}k`-points `≃ Hom_{F_q}(O(G₀),k)` when `k/F_q` is a field extension.
Identify `G₀(F_q)` with `Hom_{F_q}(O(G₀),F_q)` by the points functor. The `q`-power
map is `F_q`-linear on `F_q`-algebras. For a `ℤ`-model, identify the iterated prime-power
point map with this construction.

### Examples

For a²+a+1=0 in F₄, a²−a=1; for constant C₂, every Lang value is 1.

### Dependencies

*Needs:* Layer 3 quotients; Layer 3A orbit geometry; SchemeAndStackFoundations §0.29 Frobenius.

## Layer 7b: algebraic parabolics and Levi intersections

Use Layer 7's algebraic parabolic subgroup schemes `P`, unipotent radicals `U=R_u(P)`, and
Levi complements `P=L⋉U`, together with Tau Ceti's cocharacter-defined point subgroups and
pointwise Levi decomposition. Layer 7b owns the additional F-stability data, the comparison
between these existing scheme/group carriers and the finite-point subgroups, and the
intersection and transport theorems below. Prove the comparison with standard parabolics in
split reductive groups where the existing point-carrier adapter requires it; do not introduce a
second general parabolic, Levi, or unipotent-radical definition.

Consume Layer 7's conjugacy of Borel subgroups and maximal tori, common-maximal-torus
theorem for pairs of Borels, and Bruhat/Weyl double-coset theorem; Layer 7b owns none of
these prerequisites. For a fixed maximal torus `T` contained in `P`, prove the unique Levi
complement of `P` containing `T`. For arbitrary Levi complements of `P`, prove conjugacy
under `R_u(P)` by a unique element of `R_u(P)`; retain the uniqueness clause. State the
field and connectedness hypotheses for all these results.

Use Dudas–Michel Proposition 8.9 with its exact hypothesis: for `P=L⋉U` and `Q=M⋉V`,
the selected Levi complements `L` and `M` contain one common maximal torus `T`. Then
`(P∩Q)U` is parabolic with Levi `L∩M`, and `P∩Q` is connected with unique factorization

    P∩Q = (L∩M) ⋉ ((L∩V)(M∩U)(U∩V)).

Prove the scheme-level and finite-point forms, connectedness of each factor and intersection
used, and uniqueness of the expression. In the rational transporter case, require
`x∈S(L,M)^F`; the transported Levi `xMx⁻¹` then shares a maximal torus with `L`. The
input Levis need not share one global torus.

Make the additional intersection facts explicit for each such `F`-fixed `x`:

* `L∩xQx⁻¹` is an `F`-stable parabolic subgroup of the connected reductive group `L`,
  with Levi `L∩xMx⁻¹` and unipotent radical `L∩xVx⁻¹`.
* `P∩xMx⁻¹` is an `F`-stable parabolic subgroup of `xMx⁻¹`, with unipotent radical
  `U∩xMx⁻¹` and Levi factor `L∩xMx⁻¹` from the intersection decomposition.
* `(L,F|_L)` and `(xMx⁻¹,F|_{xMx⁻¹})` are again connected reductive groups with the
  restricted Frobenius endomorphisms used below.
* `U∩xVx⁻¹` is connected, as required by the unipotent-piece bijection. Prove connectedness
  scheme-theoretically before passing to finite fixed points.

Prove the parabolic double-coset theorem `P\G/Q ≃ W_L\W/W_M` with the common-torus
hypotheses, consuming Layer 7's Bruhat decomposition, common-torus theorem, and Weyl-group
interfaces. State the exact map and its inverse on representatives.

For an `F`-stable Levi decomposition `P=L⋉U`, prove the scheme-to-point comparison and
Frobenius compatibility give `P^F=L^F⋉U^F`, with unique coordinates and projection
`P^F →* L^F`. This uses Layer 7a's rational-point groups and the algebraic decomposition
and compatibility proved in this layer.

**Checks.**

- For `P=Q`, `L=M` and `U=V`, the decomposition reads `P∩Q=L⋉U`: the factors `L∩V`
  and `M∩U` are trivial and `U∩V=U`. A formula omitting the `U∩V` factor returns `L`,
  of dimension 2 instead of 3 for the Borel of `GL₂`.
- For opposite Borels `P=B⁺`, `Q=B⁻` of `GL₂` with `L=M=T`: `P∩Q=T` and all three
  unipotent factors are trivial; `W_L=W_M=1`, so `P\G/Q≃W` has two elements, matching
  the two `B⁺`-orbits on `G/B⁻=ℙ¹`.
- The common-torus hypothesis is not decorative. For `x=u=[[1,1],[0,1]]` in `GL₂`, the
  transported Levi `uTu⁻¹` meets `T` in the scalar group, which contains no maximal
  torus, so `u∉S(T,T)`. Here `B⁺∩uB⁻u⁻¹=uTu⁻¹` has dimension 2, while the formula's
  factors `T∩uTu⁻¹`, `T∩uU⁻u⁻¹`, `uTu⁻¹∩U⁺` and `U⁺∩uU⁻u⁻¹` have dimensions 1, 0, 0
  and 0: the matrices `M=[[1+s,−s],[s,1−s]]` of `uU⁻u⁻¹` are diagonal or upper
  unitriangular in the chosen basis only for `s=0`, since their lower-left entry is
  `s`. Every such matrix is nevertheless unipotent: `(M−I)²=0`. Over `ℚ`, `s=1`
  gives `[[2,−1],[1,0]]≠I`, a unipotent matrix outside both `T` and `U⁺`.
- For `GL₃`, let `P` stabilize the line `⟨e₁⟩` and `Q` the plane `⟨e₁,e₂⟩`, with Levis
  `L=GL₁×GL₂` and `M=GL₂×GL₁` containing the diagonal torus. Then `L∩M=T`, `P∩Q` is
  the upper Borel `B`, and the factors `L∩V`, `M∩U`, `U∩V` are the root groups at
  positions (2,3), (1,2), (1,3), of total dimension `3=dim R_u(B)`; dropping `L∩V`
  leaves dimension 5, not 6. The double cosets `W_L\S₃/W_M` with `W_L=⟨(23)⟩`,
  `W_M=⟨(12)⟩` have sizes 4 and 2, so `P\G/Q` has two elements: a line lies in a
  plane or not.
- For `GL₂(𝔽_q)`, `|B^F|=(q−1)²q=|T^F|·|U^F|`, and the projection `B^F→T^F` has kernel
  `U^F` of order `q`; a decomposition forgetting the `F`-compatibility would not give
  the point count.

### Examples

For GL₂, B⁺∩B⁻=T, with both unipotent intersections trivial; for P=Q the intersection is P.

### Dependencies

*Needs:* Layers 4–7; Layer 7a Frobenius structures and fixed-point comparisons.

## Layer 7c: Harish–Chandra functors and biadjunctions

Let `Λ` be a commutative ring in which `p` is invertible, and let `P=L⋉U` be an
`F`-stable parabolic with `F`-stable Levi complement. Work in the categories of all left
modules over the finite group algebras (equivalently, Mathlib's `Rep Λ G^F` and
`Rep Λ L^F` at `[CommRing Λ]`); the finitely generated and finite-dimensional subcategories
are consequences where their hypotheses apply. Define Harish–Chandra induction
and restriction by the following permutation bimodules (Dudas–Michel,
Definition 9.2, Remark 9.3 and Proposition 9.4(i), pp. 35–36):

    R^G_{L⊂P}(M) = Λ[G^F/U^F] ⊗_{Λ L^F} M
    *R^G_{L⊂P}(N) = Λ[U^F\G^F] ⊗_{Λ G^F} N ≃ N^{U^F}.

The first permutation module is a `(ΛG^F,ΛL^F)`-bimodule; the second is a
`(ΛL^F,ΛG^F)`-bimodule. The actions of `L^F` come from `P^F=L^F⋉U^F`. Prove the displayed
invariant identification using the averaging idempotent
`e_U=|U^F|⁻¹∑_{u∈U^F}u`. Prove that rational points of each connected unipotent radical form a finite p-group; hence
`p∈Λˣ` implies `|U^F|∈Λˣ` (Dudas–Michel, proof of Proposition 9.4, p. 36).

- On an L^F-linear map f:M→M′, induction sends gU^F⊗m to gU^F⊗f(m).
  Prove well-definedness for the balanced tensor relations, identity and
  composition laws, and G^F-equivariance.
- On a G^F-linear map f:N→N′, restriction is f on U^F-invariant vectors.
  The tensor-to-invariants map sends [U^F g]⊗n to e_U·(g·n), with inverse
  v↦[U^F]⊗v; prove both inverse equations and L^F-equivariance.
- The induction module has one copy of M for each coset of P^F in G^F.
  A chosen Λ-basis of M of size d induces a basis of size [G^F:P^F]d; the action
  on these copies includes the section cocycle when M is nontrivial.
- The invariant projector n↦e_U·n is idempotent, has image N^(U^F), and
  commutes with module maps and the L^F-action. These identities give a
  natural comparison between coinvariants and invariants, including for
  non-free modules. They imply exactness of restriction; induction is exact
  since its right ΛL^F permutation module is free.

**Checks for induction.**

- For G^F=P^F=L^F=1, U^F=1 and Λ=ℚ, induction sends Λ to Λ, with rank 1;
  multiplication Λ⊗Λ→Λ sends 2⊗3 to 6.
- For the finite-group adapter 1⊂C₂ with U=1 and Λ=ℤ, induction of
  the trivial line is ℤ² and the nonidentity element has matrix
  `[[0,1],[1,0]]`. Its trace is 0, whereas two trivial lines have trace 2.
- For GL₂(𝔽₂)=S₃, take its upper Borel P^F=U^F=C₂ and L^F=1,
  with Λ=ℤ[1/2]. Induction of Λ has rank 3; a transposition fixes one
  coset and exchanges two, so its trace is 1, not 3.

**Checks for restriction and averaging.**

- For U^F=1 and Λ=ℚ, restriction on N=Λ² has projector I₂ and rank 2;
  on a zero module its rank is 0. It does not take G^F-invariants.
- For GL₂(𝔽₂), its U^F=C₂, and the regular module Λ[S₃] over
  Λ=ℤ[1/2], averaging pairs the six basis vectors into three U^F-orbits.
  The invariant submodule has rank 3, and [U^F]⊗1 maps to (1+u)/2;
  its inverse maps this vector back to [U^F]⊗1, not twice that tensor.
- For the sign representation of S₃ over ℤ[1/2], the nontrivial element
  of U^F=C₂ acts by −1, so e_U acts by (1−1)/2=0 and restriction is zero.
  For the trivial line it acts by (1+1)/2=1 and restriction has rank 1.
- Over 𝔽₂, the augmentation 𝔽₂[C₂]→𝔽₂ is surjective, but sends
  the invariant vector 1+u to 0. Invariants are not exact there; this
  excludes using the averaging comparison when p is not invertible.
- For the zero coefficient ring, every unital module is zero. Both functors
  and all averaging maps are the unique zero maps; basis-size comparisons
  assert the specified indexed bases, not uniqueness of rank over this ring.

*Needs:* Layer 7a finite rational points; Layer 7b's F-compatible semidirect
product and projection; §7.2's split unipotent radical; the native
induction and representation/module equivalence specified below. The
averaging comparison is constructed here before either biadjunction.

First prove the induction-side adapter, naturally in every left `ΛL^F`-module `M`:

    Λ[G^F/U^F] ⊗_{ΛL^F} M ≃
      Ind_{P^F}^{G^F}(Inf_{L^F}^{P^F} M).

The left side uses the right `L^F`-action on `G^F/U^F`; the right side is ordinary
finite-group induction from `P^F`. Use `P^F=L^F⋉U^F` and the section/cocycle model for
nontrivial `M`. The restriction-side adapter identifying
`Λ[U^F\G^F] ⊗_{ΛG^F} N` with `N^{U^F}` is the averaging comparison above;
Layer 7d consumes it in the Mackey decomposition.

Prove inflation/invariants adjunctions, exactness, and the finite-index biadjunctions

    R^G_{L⊂P} ⊣ *R^G_{L⊂P} ⊣ R^G_{L⊂P}.

Prove exactness and both biadjunctions with these hypotheses
(Dudas–Michel, Proposition 9.4(ii)–(iii), p. 36).
Derive both adjunctions from finite-group induction/coinduction and the averaging equivalence
between `U^F`-invariants and `U^F`-coinvariants. State naturality, conjugation compatibility,
finite-free permutation-bimodule bases, and the exact module categories. For general `Λ`,
consume Mathlib's `Rep.ind`, `Rep.indResAdjunction`, `Rep.resIndAdjunction`,
`Rep.coindResAdjunction`, and `Rep.indCoindIso` at their commutative-ring hypotheses, together
with the equivalence between representations and modules over the corresponding monoid
algebra. Mathlib's finite-index adjunction declarations additionally require
`[S.FiniteIndex]`, `[DecidableRel (QuotientGroup.rightRel S)]`, and carrier universe
`Rep.{max w u v}`. Keep Tau Ceti's `indFDRep` and its finite-dimensional adjunctions for the
field / complex specialization; they do not supply the general coefficient-ring adapter.
For the complex specialization, use
`indFDRep (FDRep.of (M.ρ.comp π))`, where `π:P^F→L^F` is the projection. The dimension
theorem is `finrank ℂ (indFromProjectedLevi P π M) = P.index * finrank ℂ M`, by Tau
Ceti's `finrank_indFDRep`. For nontrivial `M`, a coset-function presentation of induction must use the section
cocycle; the coset permutation action itself carries only the trivial module.

### Examples

For S₃ and C₂, induction of the trivial line has dimension 3=3·1. This tests finite-index induction, not a new dimension theorem.

### Dependencies

*Needs:* Layer 7b algebraic Levi factors; native finite-group induction and restriction; the coefficient invertibility hypotheses of this layer.

## Layer 7d: rational transport and the specialized Mackey theorem

For `F`-stable Levis `L,M` in `F`-stable parabolics `P,Q`, define `ad_x(V)` for an `M`-module as the `xMx⁻¹`-module with action
`(xmx⁻¹)·v := m·v`; use this direction throughout (Dudas–Michel,
Theorem 9.6, p. 37). Define the transporter subset

    S(L,M) = {x∈G | L∩xMx⁻¹ contains a maximal torus of G}.

- Conjugation transport keeps the underlying Λ-module and linear maps, sends
  the action of xmx⁻¹ to the action of m, and has inverse transport by x⁻¹.
  Transport first by x and then by y agrees with transport by yx.
- The subset S(L,M) is stable under left multiplication by L and right
  multiplication by M, and inversion identifies it with S(M,L). For L=M=T
  a maximal torus, it is N_G(T); for L=G it is all of G
  (Dudas–Michel, Lemma 9.10 and its proof, pp. 38–39).

**Checks for conjugation transport.**

- At x=1 a complex one-dimensional character of C₃ with value ζ on a
  generator, where ζ is a primitive cube root of unity,
  still has value ζ; transport does not dualize the representation.
- In S₃ let M=⟨(123)⟩ and x=(12). A complex character with value ζ at (123)
  transports to a character with value ζ at (132), hence ζ⁻¹ at (123).
  The unchanged character would give ζ at (123) and is the wrong model.
- For the algebraic conjugation adapter on GL₃ over ℂ, take M diagonal,
  x=(123) as a permutation matrix, and the
  character diag(a,b,c)↦a. The transported character is diag(a,b,c)↦b;
  at diag(2,3,5) it is 3. Using x rather than x⁻¹ to pull back would
  give c=5. A second transport by x gives c, and a third gives a.

**Checks for the transporter subset.**

- For G=T=Gₘ and L=M=T, S(T,T)=T and T\S(T,T)/T has one element.
- For G=GL₂ and L=M=T diagonal, S(T,T)=N_G(T), whose quotient by T
  has two elements, represented by I and the coordinate swap. For
  u=`[[1,1],[0,1]]`, T∩uTu⁻¹ consists only of scalar matrices, of
  dimension 1 rather than 2, so u is excluded.
- For G=GL₂, L=G and M=T, S(G,T)=G and G\S(G,T)/T has one element;
  restricting this subset to N_G(T) would wrongly exclude the same u.

*Needs:* Layer 7b's algebraic Levi intersections; §7.1's maximal-torus
conjugacy; native restriction of representations along group isomorphisms.

Prove the geometric transporter equivalence `L\S(L,M)/M ≃ P\G/Q` and the rational
bijection

    L^F\S(L,M)^F/M^F ≃ P^F\G^F/Q^F.

Both maps are induced by inclusion of S(L,M) into G
(Dudas–Michel, Lemma 9.10, pp. 38–39).

The rational proof consumes Layer 7a’s Lang theorem and fixed-coset lifting, after Layer 7a/7b establish their exact finite-type, smooth,
geometrically-connected, F-stable subgroup and restricted-Frobenius hypotheses. It also uses
the fixed-point/orbit and component-group lemmas of this layer, and connectedness of the actual
stabilizers `P∩xQx⁻¹` and `L∩xMx⁻¹`. Prove both smoothness and geometric connectedness of
each stabilizer, as required by the Lang application; do not infer either property from
equality of point groups. Consume Layer 7b's intersection and restricted-Frobenius facts.

Use the source permutation-bimodule route for the parabolic Mackey theorem. Reuse Layer 7c's
induction-side adapter and restriction-side bimodule equivalence

    Λ[U^F\G^F] ⊗_{ΛG^F} −  ≃  (−)^{U^F}

at `p∈Λˣ`; prove that composition of these functors corresponds to tensoring their
bimodules by associativity. The composite bimodule for
`*R^G_{L⊂P} ∘ R^G_{M⊂Q}` is `Λ[U^F\G^F/V^F]`, with left `L^F` and right `M^F` actions.

For each `x∈S(L,M)^F`, prove the source piece bijection, with exact map and actions:

    L^F/(L∩xVx⁻¹)^F ×_{(L∩xMx⁻¹)^F}
      (U∩xMx⁻¹)^F\(xMx⁻¹)^F  → U^F\P^F x Q^F/V^F,
      (l, m′) ↦ U^F·l·m′·x·V^F.

The middle group acts by the identified Levi factor. Prove this factor is
`L∩xMx⁻¹` and prove its finite-point identification. Prove the right `M^F` action on the
left-hand fiber product is `m′ ↦ m′·xmx⁻¹`, including well-definedness and equivariance.
Show these pieces
partition the full biset as `[x]` ranges over `L^F\S(L,M)^F/M^F`. Prove the biset linearization adapter
`Λ[X] ⊗_{ΛH} Λ[Y] ≃ Λ[X ×_H Y]` for the finite bisets in this theorem, then linearize this
bijection to a direct-sum decomposition of `(ΛL^F,ΛM^F)`-permutation bimodules. Identify
each piece with the tensor product of the two finite permutation bimodules for the Levi intersections,
and use the tensor-composition equivalences from Layer 7c to obtain the natural Mackey
isomorphism

    *R^G_{L⊂P} ∘ R^G_{M⊂Q}
      ≅ ⊕_[x] R^L_{L∩xMx⁻¹ ⊂ L∩xQx⁻¹}
            ∘ *R^{xMx⁻¹}_{L∩xMx⁻¹ ⊂ P∩xMx⁻¹}
            ∘ ad_x,

where `[x]` ranges over `L^F\S(L,M)^F/M^F`. The intermediate functors use the finite-point
parabolic, Levi, and unipotent-radical intersections from Layer 7b. Prove naturality and
compatibility with the pinned conjugation convention (Dudas–Michel,
Theorem 9.6 and Lemma 9.11, pp. 37–39). This supplies parabolic Mackey from explicit bisets.

### Examples

For the two Borels in GL₂, the Weyl double-coset labels are 1 and s; their stabilizers have different unipotent factors.

### Dependencies

*Needs:* Layers 7a–7c; fixed-coset lifting of Layer 7a; native Mackey decomposition.

## Layer 7e: common-Levi independence

Let `Λ` be a commutative ring with `p∈Λˣ`. For `F`-stable parabolics `P,Q` with a common
`F`-stable algebraic Levi complement `L`, prove the natural isomorphisms on all left
`ΛG^F`- and `ΛL^F`-modules,

    *R^G_{L⊂P} ≅ *R^G_{L⊂Q},   R^G_{L⊂P} ≅ R^G_{L⊂Q}.

The coefficient ring is commutative with identity and has `p∈Λˣ`. If `L=G`, then `P=Q=G`
and both Harish–Chandra functors are identities; handle this case directly. For `L≠G`, prove the coefficient-general theorem by constructing the natural
`(Λ[G^F],Λ[L^F])`-bimodule isomorphism
`Λ[G^F/U^F] ≃ Λ[G^F/V^F]`, where `U=R_u(P)` and `V=R_u(Q)`. Separately prove the
complex-character identity by the Layer 7d decomposition and induction on semisimple rank of
the ambient connected reductive group. Prove that every proper Levi has strictly smaller
semisimple rank; at each step identify the full-Levi normalizer and conjugation terms. For
general `Λ`, identify these bimodule carriers with `Λ[G^F]e_U` and `Λ[G^F]e_V`; the explicit
corner construction follows below.
Use the explicit averaged-idempotent construction below, prove its hypotheses, and establish
extension-of-scalars compatibility. Tensor the resulting bimodule isomorphism with an arbitrary
left `Λ[L^F]`-module and prove naturality to obtain the induction comparison. Obtain the
restriction comparison from the adjunctions in Layer 7c using Mathlib
`CategoryTheory.Adjunction.ofNatIsoLeft` and `CategoryTheory.Adjunction.rightAdjointUniq`; prove
the resulting unit/counit compatibility. The complex character identity is the complex
specialization of these functor isomorphisms. Howlett–Lehrer and Dipper–Du are source
references, not opaque assumptions.

The construction target is explicit and finite. First work in the integral model
`A₀=ℤ[1/p][G^F]`. For each finite `p`-group `U`, write
`e_U=|U|⁻¹∑_{u∈U}u` in `A₀`, and likewise for `V`; construct finite free
`ℤ[1/p]`-bases of the corner algebras `e_UA₀e_U` and `e_VA₀e_V`, using normalized
double-coset averages. Prove their base-change identifications with the corresponding
corners of `Λ[G^F]` for every commutative `Λ` in which `p` is a unit. For `t:=e_Ue_V`, prove the corner memberships and construct
`z_U:=e_Ue_Ve_U` and `z_V:=e_Ve_Ue_V` as units in their respective corners, first over
`ℤ[1/p]`. Set `s:=e_Ve_U z_U⁻¹`. Then `ts=e_U`; from `ts=e_U`, `st` is an idempotent, and
`(st)z_V=z_V`; since `z_V` is a unit, `st=e_V`. Because `L^F` normalizes both unipotent
radicals, `t` and `s` commute with every `ℓ∈L^F`. Right multiplication by `t` and `s` gives
mutually inverse `(ΛG^F,ΛL^F)`-bimodule maps
`Λ[G^F]e_U ≃ Λ[G^F]e_V`, hence the required permutation-bimodule isomorphism. The
construction and both unit proofs over `ℤ[1/p]` base-change to every commutative `Λ` with
`p∈Λˣ`.

The hard unit statements remain explicit proof targets: prove normalized-average factorization
and the betweenness identity `e_Ue_We_V=e_Ue_V` when
`W=(W∩U)(W∩V)`; connect the parabolics with Levi `L` by galleries of `F`-stable parabolics;
reduce each gallery step to adjacent relative-rank-one common-Levi pairs; and give an explicit
finite-free corner basis and rank-one inversion calculation whose only denominators are powers
of `p`. Construct and verify the intermediate subgroups, parabolics, and unipotent-factor
transport needed for these reductions. No Weyl representative, Bruhat-leading-coefficient
criterion, or unnamed source lemma is assumed. Howlett–Lehrer and Dipper–Du remain source
references, not opaque assumptions.

If the two Levis are rationally conjugate, require a witness `g∈G^F` with `gLg⁻¹=M`.
For an `L`-module `V`, define `ad_g(V)` as the `M`-module with action
`m·v := (g⁻¹mg)·v`. State the natural isomorphism
`R^G_{L⊂P} ≅ R^G_{M⊂gPg⁻¹} ∘ ad_g` and the restriction isomorphism
`*R^G_{L⊂P} ≅ ad_g⁻¹ ∘ *R^G_{M⊂gPg⁻¹}` before applying common-Levi independence. Geometric conjugacy alone or conjugacy of the finite Levi point subgroups does
not supply this rational witness. Keep the `G`-split hypothesis explicit: an `F`-stable
Levi need not be a Levi complement of an `F`-stable parabolic.

**Checks.**

- For `P=Q`, `e_U=e_V`, so `t=z_U=s=e_U` and the bimodule isomorphism is the identity
  of `Λ[G^F]e_U`.
- For `GL₂(𝔽₂)≅S₃` with `U=U⁺=⟨(12)⟩`, `V=U⁻=⟨(13)⟩` and `L=T=1` over `ℤ[1/2]`: the
  corner `e_U·ℚ[S₃]·e_U` has dimension 2, the number of double cosets `U\S₃/U` (of
  sizes 2 and 4). On the trivial summand `z_U=1`; on the two-dimensional irreducible,
  where `e_U` and `e_V` are the projections onto the fixed lines of two reflections at
  angle `π/3`, `z_U=e_Ue_Ve_U` acts on the image of `e_U` by `cos²(π/3)=1/4`. So `z_U`
  is a unit with inverse `(1,4)` on the two summands, the only denominator being `2²`,
  and `s=e_Ve_Uz_U⁻¹` satisfies `ts=e_U` and `st=e_V`. Over `ℤ` the idempotent `e_U`
  does not exist.
- The betweenness identity needs its hypothesis. With unit vectors `u,v,w` spanning the
  fixed lines of the three reflections of `S₃` (pairwise inner products `−1/2`),
  `e_Ue_V` is `−1/2` times the rank-one map `|u⟩⟨v|` on the two-dimensional
  irreducible, while for `W=⟨(23)⟩`, where `W∩U=W∩V=1`, `e_Ue_We_V` is `1/4` times
  that map: the identity fails because `W≠(W∩U)(W∩V)`. For `W=U` it holds trivially.
- Every proper Levi has smaller semisimple rank: in `GL₃` the Levi `GL₁×GL₂` has
  semisimple rank 1 and the torus 0, against 2 for `GL₃`; `L=G` is the excluded case
  handled directly.
- The rational witness is needed: the nonsplit torus `𝔽_(q²)^×⊂GL₂(𝔽_q)` is
  geometrically conjugate to `T` but is the Levi of no `F`-stable parabolic, and its
  order `q²−1` differs from `|T^F|=(q−1)²`, so no `g∈G^F` conjugates one to the other.

### Examples

When the two parabolics are equal, common-Levi independence gives the identity comparison; for opposite Borels in GL₂ it compares the same torus Levi.

### Dependencies

*Needs:* Layers 7a–7d; the common-Levi and coefficient hypotheses stated in this layer.

## Layer 7f: trivial-module specialization and Gassmann interface

For the trivial `L^F`-module, inflation is trivial and Harish–Chandra induction is the
permutation representation on left cosets `G^F/P^F`. Layer 7e therefore gives isomorphic
complex permutation representations for common-Levi parabolics. Build the comparison as a
`Representation.Equiv` between the two permutation representations, using the Layer 7c
`Ind∘Inf` adapter and Tau Ceti's `indTrivialEquiv`. The latter has a companion `Rep`-category
isomorphism `indTrivialIso`; provide the explicit conversion between that `Rep`-isomorphism and
the `Representation.Equiv` interface consumed by InductionRestriction Layer 2.1. Under
`[Finite G^F]`, `[Field ℂ]`, and `[CharZero ℂ]`, consume
`Gassmann.almostConjugate_iff_permutation_equiv` to obtain
`Gassmann.AlmostConjugate (P^F) (Q^F)` in `G^F`. See the
[InductionRestriction roadmap, Layer 2.1](../RepresentationTheory/InductionRestriction/README.md#layer-21-almost-conjugacy-and-permutation-representations)
for its owner contract. The arithmetic identity below is an independent target of that layer;
this roadmap does not treat it as already proved. The generic induction-restriction layer owns
its finite-group criterion; this layer owns the Harish–Chandra-to-permutation adapter and the
finite-reductive application.

For finite `G`, subgroup `H≤G`, and `g∈G`, use `Nat.card` for natural cardinality,
`C_G(g)` for the centralizer, and `g^G` for the conjugacy class. The target identity is

    Nat.card (MulAction.fixedBy (G ⧸ H) g) * Nat.card H
      = Nat.card (MulAction.stabilizer (ConjAct G) g)
          * Nat.card {x : G // x ∈ (ConjClasses.mk g).carrier ∧ x ∈ H}.

It counts representatives of fixed cosets mapping to each element of the class intersection.

**Checks.**

- The trivial-module adapter identifies `Λ[G^F/U^F]⊗_(ΛL^F)Λ` with `Λ[G^F/P^F]`: for
  `GL₂(𝔽₂)` and its upper Borel this has rank 3, agreeing with the Layer 7c induction
  Check; for `P=G` it has rank 1.
- The counting identity on `S₃/C₂`, `C₂=⟨(12)⟩`: for `g=1` both sides are `3·2=6·1`;
  for `g=(12)` they are `1·2=2·1`; for a 3-cycle `0·2=3·0`. Replacing `|C_G(g)|` by
  the class size `|g^G|` gives `3·1=3≠2` at a transposition.
- Almost conjugacy is weaker than conjugacy: in `GL₃(𝔽₂)` the line stabilizer and the
  plane stabilizer both have index 7 and, by Layer 7e, equal permutation characters,
  so they are almost conjugate; they are not conjugate, since every conjugate of the
  line stabilizer fixes a line while the plane stabilizer fixes none.
- For `H=G`, `G/G` is a point, both permutation representations are the trivial line,
  and the conversion between the `Rep`-isomorphism and the `Representation.Equiv` is
  the identity of a one-dimensional space.

### Examples

On S₃/C₂ the permutation character has values 3,1,0 on the identity, a transposition and a 3-cycle.

### Dependencies

*Needs:* Layers 7c–7e; finite permutation representations and the named Gassmann interface.

## Layer 7g: Steinberg endomorphisms and extension of Layers 7a–7f

Let `σ:G→G` be a surjective algebraic-group endomorphism of a connected reductive group over
an algebraic closure of a finite field. A Steinberg endomorphism here means that some positive
power `σ^m` is the geometric Frobenius attached to an `F_{q′}`-structure on `G`. State the
characteristic, finite-type, smoothness, and connectedness assumptions; include diagram
automorphism twists and special isogenies only when this power condition is proved. Prove point
and algebraic compatibility needed to construct the finite group `G^σ`. For each stable closed
subgroup `H`, specify the restricted endomorphism `σ|_H` and verify that its positive power is
the restricted geometric Frobenius from the induced `F_{q′}`-structure. The ordinary q-Frobenius
Lang statement in Layer 7a covers the standard-Frobenius case; the Steinberg Lang–Steinberg theorem and its restricted-subgroup
applications are new targets here.

Extend each finite-field interface from Layers 7a–7f to this exact regime: finiteness and
functoriality of `G^σ` and `H^σ`; Lang–Steinberg surjectivity for every connected smooth affine
finite-type group and every connected smooth `σ`-stable closed subgroup with its restricted
endomorphism; fixed-point, component, and orbit consequences; `P^σ=L^σ⋉U^σ` for `σ`-stable
parabolics and Levis; `p`-invertible coefficient-ring Harish–Chandra induction/restriction and
biadjunctions; transporter and connected-intersection results for `σ`-stable parabolics; the
permutation-bimodule Mackey decomposition; common-Levi independence for commutative `Λ` with
`p∈Λˣ`; and the trivial-module Gassmann target. Reprove or transport each interface with the
power-Frobenius hypothesis visible. No 7a–7f output is treated as a split-only result when its
Steinberg extension is needed.

**Checks.**

- The standard `q`-Frobenius is Steinberg with `m=1` and `G^σ=G(𝔽_q)`; `GL₁^σ` has
  `q−1` elements.
- The unitary twist `σ(g)=(F(g)ᵀ)⁻¹` on `GL_n` has `σ²=F_(q²)`, so `m=2`. Its fixed
  points on `GL₁` are the solutions of `a^(q+1)=1`, `q+1` of them, while `GL₁^(σ²)` has
  `q²−1`: `G^σ` is not `G^(σ^m)`. On the diagonal torus of `GL₂` the restriction
  `σ|_T(diag(a,b))=diag(a^(−q),b^(−q))` squares to `F_(q²)|_T`, and `T^σ` has `(q+1)²`
  elements.
- Neither the identity of `𝔾_m` nor the inversion `g↦g⁻¹` is Steinberg: the
  inversion has the finite fixed-point set `μ₂` but its square is the identity, whose
  fixed points `𝔾_m(𝔽̄_q)` are infinite, whereas every Frobenius power has finitely
  many fixed points. For the identity the Lang map `g↦g⁻¹σ(g)` is constant, not
  surjective. For `𝔾_a` with `σ=F` the Lang map `x↦x^q−x` is surjective with kernel
  `𝔽_q` of order `q`.

Layer 9's pinned Chevalley–Demazure groups supply explicit inputs, but do not by themselves
discharge the Steinberg fixed-point and representation-theory targets.

#### Worked example: GL3 over every finite field

For every `q`, let `P` stabilize the line `⟨e₁⟩`, `Q` stabilize the plane `⟨e₂,e₃⟩`, and
`L=diag(GL₁,GL₂)`. Both parabolics are F-stable with common Levi `L`, so Layer 7e gives
isomorphic complex permutation modules. They are not conjugate as finite subgroups:
every conjugate of `P` preserves a line, whereas `Q` has no common invariant line. A line
inside `⟨e₂,e₃⟩` is moved by `GL₂(F_q)`, including `q=2`; a line outside that plane is
moved by a lower-block unipotent. This example tests the general theorem and does not
replace it.

#### References for Layers 7a–7g

- O. Dudas and J. Michel, *Lectures on finite reductive groups and their representations*
  (2015), §§7–10, especially Proposition 7.5, Lemma 7.6, Proposition 7.7, Propositions
  8.7 and 8.9, Lemmas 9.9–9.11, Theorem 9.6 and Theorem 10.1:
  <https://webusers.imj-prg.fr/~jean.michel/papiers/lectures_beijing_2015.pdf>.
- R. B. Howlett and G. I. Lehrer, “On Harish-Chandra induction and restriction for modules
  of Levi subgroups,” *Journal of Algebra* 165 (1994), 172–183.
- R. Dipper and J. Du, “Harish-Chandra vertices,” *Journal für die reine und angewandte
  Mathematik* 437 (1993), 101–130.
- R. W. Carter, *Finite Groups of Lie Type: Conjugacy Classes and Complex Characters*,
  §1.17 (Frobenius fixed points and finite groups of Lie type).
- S. Lang, “Algebraic groups over finite fields,” *Amer. J. Math.* 78 (1956), 555–563;
  R. Steinberg, *Endomorphisms of Linear Algebraic Groups*, Memoirs AMS 80 (1968).
- J.-P. Serre, *Linear Representations of Finite Groups*, §§2.3 and 3.3; F. Gassmann,
  “Bemerkungen zur vorstehenden Arbeit von Hurwitz,” *Math. Z.* 25 (1926), 665–675.

### Examples

Ordinary q-Frobenius is the case m=1 of the power condition; the identity on a positive-dimensional Gₘ is not Steinberg.

### Dependencies

*Needs:* Layers 7a–7f; the positive-power Frobenius condition, checked for every restricted endomorphism.

## Layer 8: classification and existence

### 8.1 Split classification

For every field k, prove that split reductive k-groups up to isomorphism
are classified by reduced root data with finite free character and
cocharacter lattices. Every such datum occurs, including the root-free and
rank-zero cases. For split groups with specified maximal tori, an isomorphism
of root data lifts to a group isomorphism uniquely up to conjugation by
(T/Z(G))(k); a compatible pinning makes the lift unique (Milne 2017,
Theorem 23.25 and Remark 23.26, pp. 492–493, Theorem 23.55, p. 501;
Conrad, Theorem 6.1.17, p. 197).

- Compare extraction and realization in both directions on the full datum,
  retaining the specified lattice maps, roots, coroots and pinning.
- For split semisimple groups, compare central isogeny classes with Dynkin
  diagrams, and distinguish simply connected and adjoint forms through
  their full lattices. The isogeny theorem retains the characteristic-
  exponent powers on roots for general isogenies (Milne, Theorem 23.25).
- Compare the field realization with base change of Layer 9B's integral
  model; this is not a second existence construction. The structural
  center and derived-group comparisons use the geometric radical criterion and do
  not assume §6.2's complete-reducibility theorem.

**Checks.**

- A root-free rank-one datum gives Gₘ, whereas rank zero gives 1; the
  dimensions are 1 and 0 despite identical empty diagrams.
- SL₂ and PGL₂ both have diagram A₁. In SL₂ the root is twice the
  generator of X*(T); in PGL₂ it is primitive. The central isogeny has
  kernel μ₂, of scheme length 2 even in characteristic 2.
- For GL₂, diag(2,1) over ℚ conjugates I+aE₁₂ to I+2aE₁₂.
  This is the identity on the torus root datum but changes the chosen
  root pinning, so an unpinned lift cannot be claimed unique.

*Needs:* Layer 7 root extraction and group structure; §6.1's geometric
predicate; RootSystems Layers 5–6; independent split integral construction
in Layer 9B. The relative and pseudo-reductive targets follow below.

### 8.2 Relative reductive groups

For an arbitrary scheme S, a reductive S-group means a smooth affine group scheme
of finite presentation with connected reductive geometric fibers; semisimple means all
those fibers are semisimple. Define these fiberwise predicates on scheme
group objects, using Hopf presentations over each affine open of S. Prove invariance under isomorphism, arbitrary
base change along every scheme morphism S′→S, products and fpqc descent, with the actual base-change
and descent comparison maps. Construct the relative center and derived subgroup, prove
the derived subgroup semisimple and the center of multiplicative type, and state
smoothness only where it holds; for example the center of SL_p need not be smooth in
characteristic p. Construct central isogenies and the simply-connected and adjoint
semisimple forms, their kernels and their base-change compatibilities.

Construct the smooth scheme of maximal tori and the smooth projective scheme of Borels,
with their functor-of-points descriptions, pullback equations and étale-local sections.
Construct root subgroup and relative root-space decompositions after an étale splitting
cover, and descend the character/cocharacter perfect pairing and root datum as étale
locally constant sheaves. Prove the split root datum is locally constant in the étale
topology and that the group is étale-locally a split group from Layer9. The identification
retains the full root datum, not merely its Dynkin diagram. Prove the based-root-datum
classification of split pinned models over every nonempty scheme S, with a
specified constant character lattice and a fixed based root datum on all components,
and the isomorphism, base-change and pinning-change equations. Here an isomorphism
respects that splitting datum; locally varying datum automorphisms are not silently
identified with a single automorphism of the fixed datum. Extend the field-level subgroup/quotient and multiplicative-type comparisons of
Layers3–4 to these bases in this lane: use the supplied fppf sheaf coequalizers and effective affine descent;
prove representability of the particular center, derived group, maximal-torus and
Borel functors specified here, with their base-change maps. Field-only quotient results do not imply these relative
theorems. Use Layer0's actual affine/Hopf dictionaries and the independent Layer9 split
integral models. This relative extension is not a prerequisite of Layer9.

Prove the affine-local gluing comparison: for an open cover of S, the relative
center, derived subgroup, maximal-torus scheme and Borel scheme constructed on its
members restrict to the corresponding constructions on overlaps, satisfy the
cocycle equation, and glue to their represented functors over S. The gluing is
independent of the cover and compatible with every pullback S′→S. Consume the
scheme/sheaf descent of SchemeAndStackFoundations §§1.1, 1.14–1.18 and the effective
affine descent of ModularCurves §0E; the Borel scheme is glued as a scheme, not as
an affine scheme.

Prove the finite-presentation comparison for relative groups: if R is a filtered
colimit of rings Rᵢ, a reductive group over Spec R and any finite diagram of its
finitely presented group schemes and maps descend to a sufficiently large stage,
with the specified equations, after enlarging the stage when necessary. Apply
SchemeAndStackFoundations §0.9 to the multiplication, inverse and unit diagrams;
use openness of the reductive-fiber locus to retain reductivity at a stage
(Conrad, Proposition 3.1.9 and Corollary 3.1.11, pp. 85–88). Identify the pullbacks
of the center, derived group, maximal-torus scheme and Borel scheme at that stage
with those over R by their functorial base-change isomorphisms; two such choices
agree after passage to a common stage. No Noetherian hypothesis is imposed on R.

For each fixed split reductive model G₀ over S, construct its automorphism sheaf and its
inner/outer and pinned-automorphism interfaces, and the actual `Isom(G₀,G)` torsor.
Prove the equivalence between étale forms of G₀ and torsors under this automorphism sheaf
by effective affine descent, with inverse functors and the resulting nonabelian H¹
classification. Use SchemeAndStackFoundations §§1.14–1.18 and ModularCurves §0E for the
sheaf-torsor and effective affine descent inputs. This classifies forms with that specified split type; it asserts
no chosen global splitting or Borel on every base. Include a nonsplit real torus and
SL₂ versus PGL₂ as tests of the Galois/root-datum and global-form distinctions.

The fiberwise definition is Conrad, Definition 3.1.1, p. 81; the center
and derived-group constructions are Theorems 3.3.4 and 5.3.1, pp. 98–99
and 160–161. Maximal tori and Borels are Theorems 3.2.6 and 5.2.11,
pp. 94–95 and 157–158; pinned classification is Theorem 6.1.17, p. 197.

- For every base map S′→S, identify the pulled-back center and derived
  subgroup with those of G_S′ and compare their inclusion and quotient maps.
- The maximal-torus and Borel functors classify actual subgroup schemes;
  pullback of a family agrees with pullback of its point in the representing
  scheme. For the Borel scheme retain the relatively ample determinant line.
- The pinning-preserving isomorphism attached to a based-datum isomorphism
  preserves identity and composition. Without a pinning retain the actual
  automorphism torsor instead of a chosen global isomorphism.

**Checks.**

- For Gₘ over Spec ℤ, the center is Gₘ, the derived group is 1, and both
  the maximal-torus scheme and Borel scheme are Spec ℤ; all four descriptions
  pull back unchanged to ℤ/4.
- For SL₂ over Spec ℤ, the center is μ₂ and the derived group is SL₂.
  On the fiber at 2 the center has length 2 and tangent dimension 1; smoothness
  of G does not imply smoothness of its center. Its Borel scheme is ℙ¹_ℤ,
  with 3 points on the 𝔽₂ fiber.
- Over Spec 0 all geometric-fiber conditions are vacuous and the unique
  group scheme is empty. Root data of ranks 0 and 1 then have the same
  realization, explaining the nonempty-base hypothesis in classification.
- For R=k[x₁,x₂,…], GL₂,R has center Gₘ,R, derived group SL₂,R and
  Borel scheme ℙ¹_R. These pull back from k; their relative dimensions are
  respectively 1, 3 and 1. Truncating to k[x₁,…,xₙ] and then extending to R
  gives exactly the same three schemes.
- For S=Spec k ⊔ Spec k, the fixed pinned GL₂ datum realizes GL₂ on both
  components: the center has ranks (1,1), the derived dimensions are (3,3),
  and the Borel fibers are (ℙ¹,ℙ¹). Replacing one component by SL₂ would
  give character ranks (2,1) and cannot realize that fixed split datum.
- On the two standard charts of ℙ¹_k, the center of GL₂ is the scalar matrices
  aI. On their overlap the change t↦t⁻¹ leaves aI unchanged; the glued
  center is Gₘ,ℙ¹ and the Borel scheme is ℙ¹_ℙ¹, of relative dimension 1.
- The real norm-one torus has geometric character lattice ℤ with conjugation
  −1; Gₘ has conjugation +1. Their dimensions agree at 1 but their forms differ.

*Needs:* Layers 0, 3–5 and 7; §6.1's geometric predicate; Layer 9's independent
split model; SchemeAndStackFoundations §§1.14–1.18 and ModularCurves §0E
for effective affine descent; SchemeAndStackFoundations §0.9 for finite-presentation
limits and §§1.1, 1.14–1.18 for gluing. None of these constructions assumes §6.2.

### 8.3 Pseudo-reductive basic theory

For any field k, start with
smooth connected affine finite-type k-groups. Use §5.2's scheme comparison
for the native k-unipotent radical Rᵤ,ₖ(G), its universal property and represented quotient. Define pseudo-reductive to mean this subgroup is trivial.
Prove reductive implies pseudo-reductive and equality of the two notions over perfect
fields. For a finite separable extension K/k, prove that the k-unipotent radical commutes
with extension to K, hence pseudo-reductivity is preserved and reflected by that
extension. Do not claim pseudo-reductivity survives arbitrary inseparable extension. Identify the radical
after algebraic closure and the obstruction to descending it. Keep the schematic center
without an unproved smoothness assertion.

Consume ModularCurves §0F’s affine finitely presented Weil restriction along a
finite locally free morphism and its arbitrary-base-change comparison. Construct
the point-adjunction, product and Hopf/group-law adapters using Layer 0 and Yoneda. For every nontrivial finite purely
inseparable extension K/k, construct `Res_(K/k) G_m` with its actual unit functor
`(K⊗_k A)ˣ`. Prove it smooth, connected, commutative and pseudo-reductive over k.
On an algebraic closure, identify K⊗k k̄ as a local algebra with residue k̄; the units
have quotient G_m and unipotent kernel `1+nilradical` of dimension `[K:k]−1`, so the
group is not reductive. Prove the kernel filtration by powers of the nilradical and its
additive successive quotients. Prove the k-unipotent radical is trivial using the Weil
adjunction and the absence of characters of unipotent groups, rather than deducing it
from the geometric fiber. Give coordinate calculations for K=k(a^(1/p)), and recover
G_m when K=k. Develop homomorphism, product, central-subgroup and quotient API at the
hypotheses proved here; no general closure under inseparable base change is implicit.
These are active basic-theory and example targets. They neither assume nor substitute
for a full classification of pseudo-reductive groups over all imperfect fields.

The k-radical comparison is §5.2 and Milne, Proposition 19.9, pp. 399–400;
Milne's §6.47 and Example 6.48, p. 136, distinguish pseudo-reductivity from
reductivity after algebraic closure. The general Weil-restriction family uses the explicit
unit-functor and nilradical calculation specified here.

- Compare the pseudo-reductivity predicate with triviality of the native
  k-radical, preserving the represented quotient map and its universal property.
- Prove separable algebraic extension preserves and reflects the predicate,
  with the radical base-change isomorphism; inseparable extension retains
  only the radical inclusion unless its extra hypotheses are proved.
- For G=Res_(K/k)Gₘ, identify G(A) with (K⊗_k A)ˣ naturally in A and
  compare multiplication, inverse and the geometric residue-field quotient.

**Checks.**

- For K=k, the nilradical of K⊗_k k̄ is 0, so the kernel is 1 and G=Gₘ.
- For k=𝔽₂(t), K=k(√t), the geometric algebra is k̄[ε]/(ε²).
  Its units are c(1+aε), with product cd(1+(a+b)ε); the unipotent kernel
  is Gₐ of dimension 1 while the k-radical is trivial.
- For k=𝔽₃(t), K=k(t^(1/3)), the geometric algebra is k̄[ε]/(ε³).
  The kernel product has ε²-coordinate b+d+ac for factors
  1+aε+bε² and 1+cε+dε². Its dimension is 2, and its filtration has two
  additive one-dimensional quotients; it is not defined by discarding ε².

*Needs:* §5.2; Layer 3 represented quotients; ModularCurves §0F's finite
locally free Weil restriction and base-change comparison; Layer 0's point
and group-law dictionaries.

### Examples

SL₂ and PGL₂ have the same A₁ diagram but different character lattices. For K=k the restriction-of-scalars example is Gₘ and the geometric unipotent kernel has dimension 0.

### Dependencies

*Needs:* Layers 3–7; independent split construction of Layer 9; ModularCurves §§0E–0F; SchemeAndStackFoundations descent and torsors.

## Layer 9: pinned Chevalley–Demazure group schemes over `ℤ`

This lane is the exception to the standing "work over a field `k`" hypothesis: its whole
point is a group scheme over `ℤ` that is then base-changed. It is narrower than the relative
theory of Layer 8 because it constructs the split case over `ℤ`. This construction serves a
specific prerequisite rather than generalizing the relative theory, and it must not wait
behind pseudo-reductive groups.

The [CFSG statement roadmap](../CFSGStatement/README.md) defines finite groups of Lie type
as fixed points of a Steinberg endomorphism on the `𝔽̄_p`-points of a pinned simply connected
group, or on an explicit carrier identified with those points. Its milestone L5 depends on
explicit carriers; Chevalley existence alone does not specify one.
The root data start from `DynkinType.simplyConnectedRootDatum` in [the root-systems
roadmap](../RepresentationTheory/RootSystems/README.md). Layer 7g supplies the Steinberg
fixed-point and representation-theory interfaces; Layer 9 supplies the pinned group schemes
and explicit carriers they consume.

#### 9A. The full reductive integral enveloping form

Fix a finite reduced root datum `(X, Φ, Y, Φ∨, ⟨−,−⟩)` with its perfect
character/cocharacter pairing, positive roots and pinning. Use the actual free
lattices X and Y. They need not be respectively the full abstract weight lattice
and coroot lattice. In particular do not discard the central torus, assume that
Y splits integrally into central and coroot summands, or replace a reductive Lie
algebra by its Killing-semisimple part.

1. Construct the rational pinned Lie algebra and its integral Chevalley lattice
   `Y ⊕ ⨁_(α∈Φ) ℤ e_α`, with `H_y` additive in y,
   `[H_y,e_α]=⟨α,y⟩e_α`, `[e_α,e_(−α)]=H_(α∨)` and the pinned signed
   root-string constants. Prove Jacobi, lattice independence of choices with
   specified transport, and the comparison with the Lie algebra of the group
   constructed in 9B. The root-free datum gives the full toral Lie algebra.
   These algebraic constructions precede that group comparison.
   **9A.1a. Signed ADE lattice presentation and its integral comparison.**
   For a finite, possibly disconnected ADE diagram with a specified order on its
   vertices, use its free simple-root coordinate lattice `Q=⊕_i ℤ α_i` and Gram
   pairing `B` with diagonal2 and off-diagonal minus the number of bonds. Specify
   the simply-laced isometry `Q→Q∨`, `α_i↦h_i`; this identifies the presentation's
   Cartan lattice with the coroot lattice, not with X or the full Y. Include the
   empty diagram. Consume the actual finite realizations of
   [RootSystems Layers5–6](../RepresentationTheory/RootSystems/README.md) and the
   native `IntegralLattice.integralForm`, `ofIntegralForm`, `carrierIsometry` and
   `rationalizationIsometry` dictionary from
   [IntegralLattices](../IntegralLattices/README.md). Prove that the norm2 shell
   `Φ={a∈Q:B(a,a)=2}` is exactly the root set of that realization, with explicit
   root/coroot index maps. A positive norm2 vector has a simple reflection that
   lowers height unless it is simple: its coefficients have one sign, since two
   nonzero disjoint sign parts would have norm at least4. This gives the
   height-induction proof, finiteness, root enumeration, reflection and component
   APIs. In particular `a+b∈Φ` iff `B(a,b)=−1`, and `B(a,b)=±2` iff `a=±b`.

   Construct the group on `Q×ℤˣ`, where `ℤˣ={±1}`, by
   `ε(a,b)=(−1)^(Σ_(i>j) bond(i,j)a_i b_j)` and
   `(a,s)(b,t)=(a+b,stε(a,b))`. Prove normalization and the cocycle identity,
   identity `(0,1)`, inverse `(a,s)⁻¹=(−a,sε(a,−a))`, and the commutator formula
   `[ê, f̂]=(−1)^B(a,b)`. Define `τ=(0,−1)`, its order2 and centrality, the actual
   injection of `ℤˣ`, projection to `Multiplicative Q`, exact kernel/image and
   surjectivity, packaged as native `GroupExtension`. Prove centrality separately
   from those exact-sequence fields. Supply the presentation by the ordered
   simple lifts and central τ with their bond commutators, via unique normal
   words; there is no square relation on a simple lift. Give the specified set
   section `u_a=(a,1)` and its inverse and cocycle-defect equation
   `u_a u_b=ι(ε(a,b))u_(a+b)`, with ι the actual kernel inclusion. Prove that
   this section is a homomorphic splitting exactly when the diagram has no
   bonds, including the empty diagram. `τu_a` lies over a, whereas `u_a⁻¹`
   lies over −a.

   Let `Φ̂` be the inverse image of Φ. Construct the quotient of the free
   ℤ-module on Φ̂ by `[τe]+[e]=0`, with its explicit section-basis equivalence to
   `Φ→₀ℤ`, and use `Q⊕(Φ→₀ℤ)` for the integral Lie carrier. With section vectors
   `x_a`, define the bilinear bracket by
   `[H_h,H_k]=0`, `[H_h,x_a]=B(h,a)x_a`,
   `[x_a,x_b]=ε(a,b)x_(a+b)` when `a+b∈Φ`,
   `[x_a,x_(−a)]=ε(a,−a)H_a`, and zero in all other root/root cases.
   On lifted generators the root-sum bracket is the vector indexed by the
   **group product** ef; the opposite bracket is `H_(πe)` if `ef=1` and its
   negative if `ef=τ`. Prove quotient well-definedness, additivity/scalar laws,
   evaluation on all generators, alternation, antisymmetry and Jacobi over ℤ.
   In particular an arbitrary negative-root section is not an inverse lift.
   For A2 ordered `α₁<α₂`, `ε(α₁+α₂,−α₁−α₂)=−1`: the matrix example has
   `x_(α₁+α₂)=E₁₃` but `x_(−α₁−α₂)=−E₃₁`. Include this rejection test,
   rank1, reducible components and rank0.

   Prove Jacobi before using any Serre or Chevalley comparison. Trilinearity
   reduces it to Cartan and root vectors. The Cartan cases use weight additivity.
   Dispose of repeated underlying root lines by alternation and antisymmetry
   without division by2. For three remaining roots a,b,c, total degree outside
   `Φ∪{0}` forces every term to vanish. At degree0 their cyclic lifted products
   agree with the same central sign, and the sum is that sign times
   `H_a+H_b+H_c=0`. At a root degree with no opposite pair the three pairings
   have pattern `(-1,-1,0)`; precisely two products occur and differ by τ. With
   b=−a, rescale the lift to `f=e⁻¹` and put `d=B(a,c)∈{0,±1}`. For d=0 all
   terms vanish; for d=1 the terms are `g,0,−g`; for d=−1 they are `0,−g,g`.
   These cases supply the complete integral proof, including disconnected types.

   Supply explicit changes of section and order. For orders o,o′ let `E_rev`
   consist **only of unordered bond edges whose relative order changes**. Then
   `σ(a)=(−1)^(Σ_{{i,j}∈E_rev}a_i a_j)` satisfies
   `ε′/ε=σ(a)σ(b)/σ(a+b)`; give the induced cover and Lie equivalences and
   their composition/value equations. For general specified lattice isometries,
   construct the corresponding quadratic coboundary, including diagonal
   `binom(a_i,2)` terms when needed. For homomorphic cover-isomorphism lifts
   of a fixed lattice isometry that fix the central sign kernel, classify
   differences by characters `Q→{±1}`; this character group is trivial at
   rank0. Normalized set sections instead differ by arbitrary normalized sign
   functions, which need not be characters. Track the diagonal quadratic factor when
   comparing the zero-diagonal ordered cocycle with a lattice-VOA asymmetry
   convention; transport root signs and inverse lifts rather than identify
   formulas belonging to different sections. The integral construction and
   elementary Jacobi argument require no VOA premise.

   Normalize the negative root vectors by inverse lifts so opposite brackets
   become `H_(a∨)` while retaining the simple positive pinning. Over ℚ construct
   the split root decomposition, Cartan and generation. Compute the Cartan
   Killing pairing as `Σ_(a∈Φ)B(h,a)B(k,a)` and its nondegeneracy, and use
   invariance to prove the nonzero opposite root-space pairings; assemble
   components. The simple generators satisfy the actual Serre relations, giving
   native `TauCeti.serreLift` with its H/E/F values and surjectivity. Consume
   LieHighestWeight Layer7
   for the split-field presentation/injectivity comparison; the native pinned
   Serre map alone supplies no injectivity theorem. Preserve its Cartan-matrix
   orientation even where ADE symmetry hides the transpose.

   Compare **integrally** with9A.1's pinned Chevalley lattice by explicit unit-sign
   root-basis maps and inverse maps. For each positive nonsimple root, subtract
   a suitable simple root and track the resulting bracket word, whose ADE
   root-string coefficient is a unit ±1. Prove word/choice consistency and
   identify the Cartan and all root basis images. A rational equivalence alone
   does not establish an integral equivalence. With the actual root/coroot maps
   into a general reductive datum, extend the Cartan to its full Y, use
   `[H_y,x_a]=⟨a,y⟩x_a`, and send the signed opposite bracket to `H_(a∨)`.
   Prove the same integral laws, comparison with the actual full-Y frame, unit
   basis inverse and all diagrams. Do not assume an integral center/derived
   splitting. Base change these identities and the basis to every commutative
   ring, with root-free data giving the full abelian toral algebra; simplicity
   in bad characteristic is a separate assertion. The9B group and9C distribution
   comparisons consume this construction and are not premises for its Lie laws.

   **9A.1a-L. The group of all kernel-fixing ADE cover lifts.**
   On the actual ordered cover of9A.1a, let A be the group of integral Gram
   isometries preserving its norm2 shell. Construct the subgroup of
   `MulAut(Cover) × A` consisting of pairs `(φ,g)` with
   `φ∘ι=ι` and `π∘φ=g∘π`, where `ι:ℤˣ→Cover` and π are the actual extension
   maps. Use native `GroupExtension.Equiv` for extension transport and its
   existing section-ratio/quotient APIs for the corresponding comparison laws.
   Prove closure, inverse and identity by these equations and use the
   native subgroup group structure. Export its cover action, projection to A,
   conjugation/change-of-order maps, and the literal action on simple lifts,
   section values, τ, products, inverses and root fibers. This is the group of
   **all** compatible lifts, not one silently selected lift per root isometry.

   The quadratic-coboundary construction above supplies a lift of every g,
   hence surjectivity onto A. Prove that the kernel is the character group
   `Hom(Q,{±1})`: χ acts by `(a,s)↦(a,sχ(a))`; for any kernel lift, the ratio
   of its value on a lift over a to that lift lies in ι({±1}), is independent
   of the lift, and is multiplicative in a. Give both inverse maps and all
   evaluation equations, injectivity/exactness and a native
   [`GroupExtension`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/GroupTheory/GroupExtension/Defs.lean#L73-L83).
   For a general central extension first project onto the actual subgroup of
   liftable automorphisms; only the proved ADE coboundary theorem makes that
   subgroup all of A. Choosing normalized set sections gives arbitrary
   normalized sign functions, whereas the difference of two homomorphic
   cover lifts of the same g is a character. Do not conflate these categories.

   For `(φ,g)` and the fixed section `u_a`, define the actual sign
   `s_φ(a)` by `φ(u_a)=ι(s_φ(a))u_(ga)`. On the signed integral Lie carrier
   construct `H_h↦H_(gh)` and `x_a↦s_φ(a)x_(ga)`, extending through the
   sign quotient. Prove root indexing, additivity/scalars, bracket and
   inverse/composition equations on the actual Cartan/root basis. In particular
   `[x_a,x_(-a)]` and the inverse-lift normalization must be transported,
   not guessed from negative-section labels. Kernel characters fix Cartan and
   multiply each root line by χ(a). Prove this action faithful over ℤ, using
   the simple root basis and cover normal words. Construct scalar-extension
   actions and their comparison diagrams; characteristic2 can collapse sign
   characters, so faithfulness is not asserted after every base change.
   State composition through native Lie-equivalence composition or actual
   action equations, without assuming an undeclared `Group` instance on
   endomorphism `LieEquiv`s.

   After9A.1b, compare its pinned **based** diagram lift with this full lift group
   and its simple-generator equations. For an unbased root automorphism consume
   the RootSystems contract **gap:root-automorphism-based-factorization** above.
   Its factors w and δ both preserve the root lattice. For a specified compatible
   integral full-datum automorphism, use its actual Y action and the integral Weyl
   action to define the residual Y action. A real action on the root span alone
   does not choose an action on a central integral summand.

   - Compare signed cover lifts through the supplied factorization a=wδ,
     retaining their character ambiguity and any multiplication defect of
     separately chosen lifts. It does not split the cover-lift projection.
   - Transport the root-line action through the actual product wδ and the toral
     action through the supplied Y map; compare these maps under change of base.
   - The lift of the identity root automorphism can still act by a nontrivial
     character. Keep this kernel in the comparison rather than identifying a
     lift with its underlying root automorphism.

   **Checks.**

   - In rank zero on zero spaces, Aut(P)=W=D=1, so the root action is 1=1·1.
   - In A₁, the supplied factorization has |Aut(P)|=2=2·1. The nontrivial
     character of the root lattice multiplies both root lines by −1 while
     fixing the Cartan line, so forgetting the lift loses information.
   - In A₂, |Aut(P)|=12=6·2 and δs₁δ⁻¹=s₂ for the base reversal δ.
     Thus (1,δ)(s₁,1) acts as s₂δ, not s₁δ; this checks the transport order.
   - For A₁ with one central lattice direction, extensions fixing that direction
     or negating it give the same root action but toral values h and −h.
     The specified full-Y map distinguishes them.

   *Needs:* RootSystems contract **gap:root-automorphism-based-factorization**;
   Mathlib `RootPairing.Aut` and `RootPairing.weylGroup`; §9A.1a's integral
   lattice and cover construction; §9A.1b's pinned diagram lift for its comparison.

   Export transport
   under every specified order/section and full-Y comparison. Full-Y maps
   require the actual compatible Y action; no integral central splitting is
   inferred. Include empty/reducible ADE, rank1, A2's negative-section test,
   component permutations and D4 triality. This signed ADE extension, a
   compact finite Tits lift, `N_K(T)→W`, and a topological covering group have
   different bases/kernels. None is identified with another by a “double
   cover” label, and no VOA or compact normalizer section is a premise here.

   Prove finiteness of the positive-definite lattice isometry group by its faithful permutation
   action on the finite norm-two root set, which spans the lattice, and finiteness of the lift
   group from this image and its finite character kernel. The kernel has order `2^rank(Q)`;
   this counts characters of the actual free root lattice, not arbitrary sign functions.

   **9A.1b. Pinned fixed Lie algebras and signed ADE folding.**
   Starting from9A.1a, construct the fixed Lie algebra of each finite ADE diagram
   automorphism, its actual integral fixed lattice, its split characteristic-zero
   root system and its normalized folded presentation. Include disconnected and
   empty diagrams and a compatible action on the full reductive datum. Keep the
   integral fixed lattice, its scalar extension, and a normalized folded
   Chevalley lattice distinct. This construction is algebraic and precedes9B's
   group comparison. Specify the fixed carrier, maps, inverses and basic laws
   as follows.

   **Pinned action and actual fixed carrier.** For the ordered diagram `(Q,B,o)`
   of9A.1a let γ permute the simple vertices and preserve B. Put
   `q_γ(a)=Σ_{{i,j} a bond, i<j, γi>γj} a_i a_j` and
   `s_γ(a)=(-1)^q_γ(a)`. Prove
   `ε(a,b)s_γ(a+b)=s_γ(a)s_γ(b)ε(γa,γb)`. Define the cover map
   `(a,t)↦(γa,t s_γ(a))`, fixing τ and sending each pinned simple lift to the
   specified lift over its image. Construct its inverse, identity and
   composition equations, including order/section-change conjugacy with9A.1a's
   specified transports. On the integral Lie carrier it gives
   `H_h↦H_(γh)` and `x_a↦s_γ(a)x_(γa)`. Prove the sign-quotient, bracket,
   root-index and pinning equations. The lift's kth iterate is identity when
   `γ^k=1`: it fixes all simple lifts and τ, hence every normal word. Projection
   proves its exact order equals that of γ. The identity/rank0 order is1.
   An arbitrary kernel-fixing lift need not have this order.

   For any actual Lie equivalence φ, use native
   `LinearMap.fixedSubmodule φ.toLinearMap` as the underlying module and extend
   it to native `LieSubalgebra` by bracket closure. Export membership, inclusion,
   kernel `ker(φ-id)`, bracket/evaluation laws, intertwining maps and equivalences,
   functoriality, scalar-extension maps and the relevant inverse diagrams.
   Reuse native `TauCeti.serreDiagramAut`, all H/E/F generator laws,
   `serreDiagramAut_iterate_eq_id` and `serreLift_comp_serreDiagramAut`.
   Endomorphism `LieEquiv`s here have no Group instance: state order relations
   through function iterates. Compare the signed pinned action with native
   `geckLieEquivOfEquiv` using its supplied base-preserving root-pairing
   equivalence and finite crystallographic characteristic-zero domain
   hypotheses, and prove equivariance of the actual9A.1a comparison maps.
   Do not replace these implemented automorphisms by privately assumed copies.

   When consuming native `DynkinType.diagramAut`, display both lattice maps:
   its weight map forwards roots by γ but its coweight map is the transpose
   map, carrying coroot indices backwards. The geometric forward action on Y
   is the inverse of that coweight map. Prove the literal root, coroot and
   pairing equations before using it in the full-Y construction. Check D4
   triality, where γ and γ⁻¹ differ, as well as involutions. Native Geck module
   and group pinning providers are comparison inputs with their actual lattice
   and carrier hypotheses; their existence does not compute a fixed Lie algebra.

   **Signed orbit modules and brackets.** On each orbit
   `a,γa,...,γ^(l-1)a` define `c_0=1`,
   `c_(r+1)=c_r s_γ(γ^r a)` and monodromy `μ=c_l∈{±1}`. Construct maps and
   inverse maps from fixed coefficient tuples to `Ann_A(μ-1)` over every
   commutative ring A: the inverse sends t to the tuple `(c_r t)_r`. A positive
   cycle contributes A, a negative cycle A[2]. For Q's Cartan permutation the
   distinct simple-orbit sums are an integral basis. Together with positive
   root-cycle sums they give the actual integral fixed-module basis. Prove
   independence, spanning, coordinate formulas, change-of-representative maps
   and the bracket coefficients in that basis. Negative cycles have no integral
   fixed vector; their A[2] vectors after base change must not disappear.
   Compute the fixed bracket by restricting the ambient bracket and expanding
   its actual finite signed sums, including the opposite-root Cartan cases.

   For a permutation orbit of connected components, choose one component and
   construct its return automorphism, restriction and diagonal-transport inverse;
   prove their Lie and pinning equations and change-of-choice comparisons.
   Perform this reduction before the connected root-space and generation
   calculations. It handles arbitrary component cycles and combined internal
   symmetries, not only action orders2/3.

   Over a characteristic-zero field K, use the Gram dictionary to identify the
   restriction of a root to the fixed Cartan with
   `p(a)=k⁻¹Σ_(r=0)^(k-1)γ^r a`. Construct the nonzero weights arising from
   positive-monodromy root orbits and prove their distinctness and one-dimensional
   weight spaces. Identify the zero-weight space with the fixed Cartan and
   prove it is a split Cartan subalgebra. Projecting every ambient root is not
   the fixed root system: even A has negative-monodromy roots whose projections
   would add doubled short roots of a nonreduced restricted system. Prove the
   complete actual-root/weight-space correspondence, including negatives,
   reflection and root/coroot equations, before identifying a Dynkin type.

   **Folded frame, finite Cartan and presentation.** For a simple orbit O put
   `d_O=Σ_(j∈O)B(α_j,α_i)` for i∈O. The induced graph on O is a regular finite
   forest, so its degree is0 or1 and `d_O=2` or1. Reducible diagrams can give a
   union of adjacent pairs. Set `c_O=2/d_O∈{1,2}` and define
   `H'_O=c_OΣ_(i∈O)H_i`, `E'_O=Σ_(i∈O)x_(α_i)`,
   `F'_O=c_OΣ_(i∈O)x_(-α_i)`; simple negative sections are inverse lifts.
   Prove fixedness, `[E'_O,F'_O]=H'_O`, all mixed E/F and Cartan equations, with
   the integer matrix having **H rows and E columns**
   `C_(O,P)=c_OΣ_(i∈O)B(α_i,α_j)`, j∈P.
   With `S_O=Σ_(i∈O)α_i` and `β_O=p(α_i)=S_O/|O|`, prove independence,
   `B(β_O,β_O)=d_O/|O|`, and
   `C_(O,P)=2B(β_O,β_P)/B(β_O,β_O)`. Its off-diagonal entries are nonpositive
   integers, its zero pattern is symmetric, and multiplying row O by
   `d_O/(2|O|)` gives the positive-definite projected Gram matrix. Construct the
   associated finite root pairing and its simple base, rather than just naming
   a matrix. The ambient `RootPairing.Base.cartanMatrix` uses roots as rows;
   translate it by the actual transpose to the H-row convention as in
   LieHighestWeight Layer7.

   Prove the exact higher Serre powers and construct `TauCeti.IsSerreSystem`
   for these actual fixed vectors. The resulting native `serreLift` maps into
   the actual fixed Lie subalgebra, with H/E/F value equations. Prove its
   surjectivity by constructing every signed orbit root vector as a rational
   combination of bracket words in E′/F′, and the fixed Cartan from their
   brackets. Retain all nonzero factors2/3. Prove generation using the concrete
   comparisons below; a dimension match or existence of the Serre map alone
   is insufficient. Then consume Layer7's separately owned split-field
   injectivity/straightening theorem, componentwise in the reducible case, to
   obtain the equivalence from that same lift. Establish Killing nondegeneracy
   and its Cartan/opposite-root pairings from the constructed root decomposition.
   For each connected folded component prove simplicity by decomposing an ideal
   into Cartan/weight components, using opposite brackets and nonzero root-string
   coefficients to propagate a nonzero root component through the connected
   root system; a nonzero Cartan component produces such a root component.
   Construct the actual Cartan, split weight decomposition and triangularizability.
   Thus finite dimensionality, Killing nondegeneracy, Cartan triangularizability
   and connected simplicity are conclusions before applying Layer7, not added
   assumptions in place of the missing folding proof. Reducible inputs assemble
   their simple ideals; the full fixed central summand is not declared simple.
   Keep integral injectivity/equality as a separate question.

   **Uniform A and D constructions.** For A_n in the standard vertex order set
   m=n+1 and use the actual trace-zero matrix frame
   `e_i=E_(i,i+1)`, `f_i=E_(i+1,i)`, `h_i=E_(i,i)-E_(i+1,i+1)`.
   For the interval root a=α_i+...+α_j of height l construct the signed matrix
   comparison `x_a=E_(i,j+1)`, `x_-a=(-1)^(l-1)E_(j+1,i)`, its integral basis
   inverse and all overlap/opposite brackets. Changes of vertex order consume
   the earlier specified sign transport. Let J have antidiagonal entries
   `J_(i,m+1-i)=(-1)^(i-1)`. Prove `Jᵀ=(-1)^(m-1)J`,
   `J²=(-1)^(m-1)I` and that `θ(X)=-JXᵀJ⁻¹` is the pinned reversal on H/E/F.
   Equality with the signed lift follows on generators with the tracked root
   signs. Its fixed equation is `XᵀJ⁻¹+J⁻¹X=0`; trace0 follows since2 is
   invertible. Construct the fixed-carrier/skew-adjoint-carrier equivalence and
   its inverse. Native `skewAdjointMatricesLieSubalgebraEquiv F P h` maps
   X to `P⁻¹XP` and has target form `PᵀFP`, with actual invertibility of P;
   retain that direction in the frame value equations. For m=2r an explicit
   signed-permutation form change gives
   native `LieAlgebra.Symplectic.sp`, hence C_r. For m=2r+1 the form is split
   symmetric with r hyperbolic pairs and one line. Give the explicit scalar
   similarity and basis change to native `LieAlgebra.Orthogonal.JB/typeB`;
   retain the nonzero scalar and basis maps. Do not replace that split carrier
   by identity-Gram `Orthogonal.so` over ℚ. Prove an actual matrix root basis,
   its H/E/F dictionary and bracket-word generation, covering the adjacent
   middle pair of even A as well as the orthogonal-orbit case of odd A.

   For D_n, n≥4, use native `Orthogonal.JD/typeD` on the hyperbolic basis
   `u_1,...,u_n,v_1,...,v_n`. Let R exchange u_n,v_n and fix the other vectors.
   Construct its orthogonality and the pinning-preserving conjugation action:
   the fork matrices are
   `E_(n-1,n)-E_(2n,2n-1)` and `E_(n-1,2n)-E_(n,2n-1)`, with matched
   negative and Cartan generators. Its plus/minus spaces are orthogonal,
   nondegenerate and have dimensions2n-1 and1. The plus space has its actual
   basis of n-1 hyperbolic pairs and `w=u_n+v_n` of norm2; after reindexing its
   Gram matrix is exactly native `JB`. Restriction/block extension gives mutually
   inverse Lie maps from the fixed typeD algebra to native `typeB (Fin(n-1))`,
   the minus-line skew-adjoint algebra being zero. Prove the source signed-frame
   comparison, all root-basis images and rational bracket generation. Native
   `typeBEquivSo'` is an additional existing scalar/form comparison when a
   split-signature carrier is wanted. A norm1 alternative requires scalar
   similarity: divide `H^(n-1)⊕<2>` by2 and replace v_i by2v_i; it is not a
   rational isometry of the original norm2 and norm1 forms. No square root of2
   is needed. Identity-Gram `so` needs an actual suitable field/form comparison;
   `soIndefiniteEquiv` assumes a square root of−1 and is not such a comparison
   over ℚ. Treat D4's conjugate involutions by their numbered permutation;
   triality is the separate order-three case below.

   **Exceptional fixed Lie algebras, types and components.** For the pinned
   order-three triality of the split D₄ Lie algebra over ℚ and pinned order-two
   reversal of split E₆, prove that the normalized simple-orbit generators E′, F′
   and their opposite brackets generate the whole fixed Lie algebra. Prove the
   Serre relations for the resulting G₂ and F₄ Cartan matrices and construct
   Lie algebra isomorphisms from their split Chevalley presentations to these
   fixed algebras, sending every simple generator to the specified orbit generator.
   Use the signed root-space decomposition and root-height induction as a proof
   route, followed by the dimension comparison; dimension alone does not prove
   generation. Prove compatibility with relabelling roots and changing the pinning.
   The integral fixed lattice and its scalar extension retain the distinctions
   specified below; these rational identifications assert no modular fixed-point
   base-change theorem.

   **Checks.**

   - D₄ has 24 roots; triality has 6 fixed roots and 6 root orbits of length 3,
     so the fixed dimension is 12+2=14, agreeing with G₂.
   - E₆ has 72 roots; the pinned reversal contributes 24 fixed root vectors and
     24 two-element root orbits, so the fixed dimension is 48+4=52, agreeing with F₄.
   - Replacing all E′ and F′ by zero gives generated dimension 0, despite the
     same ambient dimensions 14 and 52. Generation must be proved separately.

   *Needs:* §9A.1a signed brackets and root-shell theorem; §9A.1b normalized
   orbit generators and component-return maps; RootSystems Layers 5–6 finite
   root systems and oriented root/coroot reindexings.

   Derive the connected type dictionary with its actual bounds:
   `A_(2r-1)→C_r` (r≥2), `A_(2r)→B_r` (r≥1,B1=A1),
   `D_(r+1)→B_r` (r≥3), D4 triality→G2 and E6 reversal→F4; identity actions
   retain their ADE component. Use RootSystems' valid-type reindexing in low
   rank, in particular C2=B2 and B1=A1, with actual oriented root/coroot maps
   rather than an invalid validity witness for `DynkinType.C 2` or `B 1`.
   Assemble these identifications using the earlier
   component-return maps. Include empty Q,
   identity, reducible mixtures and every non-simply-laced finite type.

   Export projection, distinct-orbit sum and full-k-sum as separate maps:
   `fullSum_k(a)=|Stab(a)|·distinctSum(a)=(k/|orbit(a)|)·distinctSum(a)=k·p(a)`.
   Full sums are a uniform scale of projected roots; distinct sums rescale
   different orbits differently and can give the dual type. Construct lattice
   image/index, root-length and coroot maps for each choice, without equating
   Q^γ, p(Q), their duals or the character/cocharacter lattices of a group.
   For connected nontrivial folds with orthogonal simple orbits and two root
   lengths, identify fixed simple vertices with long projected simple roots.
   Use the general formula `B(β_O,β_O)=d_O/|O|` for adjacent even-A orbits,
   rank1, identity actions and component permutations. In particular A4 reversal
   has no fixed vertex but has two projected root lengths, so the unrestricted
   fixed-vertex assertion is false in that case.
   Include A3 (outer orbit first, matrix `[[2,-2],[-1,2]]`), A4
   `[[2,-1],[-2,2]]`, A5's two paired orbits and fixed middle vertex with its
   full-sum factor2, and D4 triality `[[2,-3],[-1,2]]`. Track the A3 combinations
   `x_(abc)`, `x_(ab)-x_(bc)`, `x_a+x_c`, `x_b` under the specified section and
   sign dictionary; paired negative vectors and invariant Cartan complete the
   basis, with the signs fixed by the displayed equations.

   **Integral and full-Y comparisons.** The actual integral fixed lattice is
   bracket-closed. For the Q-based carrier only, construct the comparison
   `A⊗_ℤ(g_ℤ^γ)→(A⊗_ℤg_ℤ)^γ` on the orbit basis. Its extra factors are exactly
   A[2] from negative cycles, so it is an isomorphism when A has no2-torsion;
   if there are no negative cycles it is an isomorphism for every A. Do not
   identify this lattice with a chosen normalized folded Chevalley form.
   For A2 exchange prove the integral basis e=xα+xβ, f=x−α+x−β,
   h=Hα+Hβ satisfies `[e,f]=h`, `[h,e]=e`, `[h,f]=-f`; the normalized A1 frame
   E=e,F=2f,H=2h has index4. Construct the rational equivalence and the actual
   integral lattice inclusion/index, retaining root-string factors2/3.

   For full Y retain its actual integral automorphism γY with
   `γY(a∨)=(γa)∨` and `⟨γa,γY y⟩=⟨a,y⟩`. Use a positive common finite
   exponent k for both the diagram and Y action, not merely the diagram order.
   The root action is the pinned signed one; the Cartan fixed module is
   `ker(γY-id)`. In actual finite free bases construct unimodular maps U,V and
   a diagonal D with `U(γY-I)V=D`. Consume native PID submodule Smith normal
   forms through image/kernel bases; those forms alone do not include a
   divisibility-chain normalization, and a nonsingular-matrix-only theorem
   does not apply to a matrix with kernel. Retain all nonzero diagonal entries
   d_i and zero positions, with the specified basis maps; no canonical invariant
   factor ordering is needed for this comparison. Over A construct the actual
   kernel equivalence to one free A per zero position and `Ann_A(d_i)` per
   nonzero position. The integral fixed lattice maps to the free factors;
   the annihilator factors are exactly the Cartan base-change obstruction,
   in addition to any negative root-cycle A[2]. Prove the pairing/bracket
   diagrams on all these factors. Flat scalar extension and invertibility of
   the actual full action order give sufficient isomorphism hypotheses.
   Preserve the root-free order-three example
   `γY=[[0,-1],[1,-1]]`: γY-I has diagonal factors1,3, integral invariants0,
   and F3 has the fixed vector(1,-1) despite2 invertible.

   Over characteristic zero construct the action-compatible center/derived
   decomposition of the full reductive Lie algebra and its fixed central
   summand, separately from the folded semisimple Serre presentation. A root-free
   full-Y torus is not the empty Q-carrier. No integral central splitting,
   bad-characteristic simplicity, equality with a group fixed scheme or
   global-form comparison is inferred. Those9B comparisons consume the actual
   Lie construction and retain their group-scheme/field hypotheses; special
   isogenies in characteristics2/3 do not make a long/short swap an ordinary
   integral Cartan symmetry. Root-automorphism/W semidirect products, compact
   normalizer splitting and a VOA construction are separate from this adapter.



**9A.1c. Numbered Geck frame and split-field adapter.** The constructor owner here
also owns the normalized interface used by ChevalleyGroups C0–C1. On the actual
native `DynkinType.lieAlgebra t ht`, construct the named all-root frame from its
Geck basis, a specified equivalence `Fin t.numRoots ≃ {α : Weight ℚ H L // α.IsNonZero}`,
and a separate extension at zero for `IsChevalleySystem`. Prove the simple E/F and
coroot value equations, involution normalization, integer structure constants,
root-string constants and their opposite-root signs. Compare with the full-Y
integral Lie lattice of9A.1 by an integral basis map and inverse; a rational Lie
isomorphism alone does not identify integral lattices. In the nonsymmetric types,
`Base.cartanMatrix i j = α_i(h_j)` gives the **transpose** in the native H-row/E-column
Serre relations. Consume LieHighestWeight Layer7's actual split-field generating
Serre lift and its assigned injectivity/straightening theorem. This step neither
uses group existence nor assumes distribution theory. All9A.1a/b signed ADE,
section-change, full lift-group and folded fixed-Lie constructions remain separate
live constructions, with their actual comparison maps and characteristic restrictions.


2. In the native `UniversalEnvelopingAlgebra ℚ` of this rational Lie algebra,
   use `TauCeti.UniversalEnvelopingAlgebra.kostantForm` with **all** root
   vectors and `H_(y_j)` for a chosen ℤ-basis `(y_j)` of the full Y. Thus its
   generators are `e_α^(m)/m!` and `Ring.choose H_(y_j) m`, including m=0.
   Use the existing native divided-power, Cartan integer-translate, subring
   functoriality, invariant-lattice and rational-base-change APIs. The native
   `LieAlgebra.Basis.kostantForm` supplies its simple-generator special case;
   compare it only after checking the actual toral lattice. Rational spanning
   is not the integral PBW theorem.
3. Fix orders on Φ⁻ and Φ⁺ and construct the actual ordered basis
   `F^(a) · Π_j binom(H_(y_j),b_j) · E^(c)`, indexed by nonnegative root and
   toral multi-indices. Prove integral spanning by a terminating straightening
   procedure and independence by the rational PBW leading terms. Export finite
   integral multiplication coefficients, the product values of basis vectors,
   triangular factorization as ℤ-modules, and order filtrations. Include
   `E_α^(a)E_α^(b)=binom(a+b,a)E_α^(a+b)`, the Cartan-binomial product law,
   `binom(H_y,m)E_α^(r)=E_α^(r)binom(H_y+r⟨α,y⟩,m)`, and the opposite-root
   rule
   `E_α^(a)F_α^(b)=Σ_(r≤min(a,b)) F_α^(b−r)binom(H_(α∨)−a−b+2r,r)E_α^(a−r)`.
   Supply every different-root Chevalley straightening coefficient, including
   non-simply-laced constants without inverting bad primes. Consume native
   `TauCeti.UniversalEnvelopingAlgebra.instHopfAlgebraKostantForm` and its
   `kostantForm_comul`, `kostantForm_counit`, `kostantForm_antipode` comparisons
   from `Kostant.HopfAlgebra`, specialized to all root vectors and the full Y
   basis. Use `kostantFormComul_dividedPower`, `kostantFormComul_ringChoose`
   from `Kostant.Comultiplication` and the formulas in `Kostant.Antipode`:
   root divided powers and toral binomials have the sum coproduct
   over a+b=m, counit zero for m>0 and one for m=0; antipode sends a root
   divided power to `(−1)^m` times itself and `binom(H_y,m)` to
   `binom(−H_y,m)`. Use Layer0's left-factor-first Hopf coproduct convention throughout.
4. Prove invariance under a change of ℤ-basis of Y by the integral binomial
   identities for arbitrary integer linear combinations, and compare admissible
   root orders/pinning changes by explicit integral maps. Central isogenies use
   their actual maps on X,Y: a rational Lie isomorphism need not identify the
   integral forms. Base change this free ℤ-module algebra and its basis to every
   commutative ring A, retaining multiplication, triangularity, Hopf structure
   and filtration. After specialization the divided/toral symbols mean these
   base-changed elements, never factorial division or an assumed BinomialRing
   structure on A. The associated graded order algebra is the divided-power
   algebra on the integral Lie lattice; it becomes the usual symmetric/PBW
   algebra after rational comparison, not an unqualified symmetric algebra over ℤ.

5. Before9B's matrix construction, consume the characteristic-zero split Lie
   highest-module and finite-dimensionality construction of
   [LieHighestWeight Layers3–4](../RepresentationTheory/LieHighestWeight/README.md).
   Supply its rational split-Chevalley descent and extend the derived action by
   the prescribed central character in the actual X. For each dominant λ∈X
   construct a full finite free admissible ℤ-lattice generated from the highest
   line by the9A divided powers, prove its stability and weight decomposition,
   and choose finitely many such modules whose combined weights generate X.
   This supplies9B's faithful torus/finite matrix data and nilpotent root
   exponentials. Prove the resulting group-scheme/root-datum comparison in9B;
   do not assume the rational G-module classification of10B to construct G.
   The10B integral Weyl modules are compared with these earlier lattices after
   the group action and rational induction have been constructed.


   **The split-field producer used here.** Supply this extension beside the existing
   native highest-module API, once, under9A.5; do not introduce a second Verma or
   irreducible-quotient definition. For a split Killing-semisimple Lie algebra over
   any characteristic-zero field K and dominant integral highest weight, construct
   the top-normalized contravariant form on the PBW Verma module from its Serre
   anti-involution. On each finite-dimensional weight space its Gram matrix has
   entries in K; identify its radical with the maximal proper highest-weight
   submodule. Kernel formation for these finite matrices commutes with field
   extension. Taking the direct weight sum proves
   `Kbar ⊗ L_K(λ) ≃ L_Kbar(λ)` with highest-line and generator equations. Consume
   native closed-field finite-dimensionality only on the right, then descend
   finite generation of the left vector space by faithful field extension. Extend
   componentwise for a reducible derived algebra and by the specified character
   on the central Lie directions. This producer precedes9B and10B; it consumes
   PBW, Verma quotients and native finite-dimensionality, not algebraic-group
   highest-weight classification or the group being constructed.

   Prove admissible-lattice finite generation by the ordered divided-power
   straightening and the finite root-string bounds in these modules, and its
   torsion-freeness inside the rational module; over ℤ it is finite free. The
   highest line fixes the lattice `U_ℤ v⁺`, rather than an arbitrary integral
   lattice. Weightwise stability includes all full-Y binomials. To obtain a
   finite faithful weight family for a general reductive X, choose a strictly
   dominant element σ in the root lattice of each nonempty component. For each
   of finitely many generators λ of X use λ+Nσ dominant for N sufficiently large,
   together with σ; their weights generate X. Root-free components instead use
   the characters of the torus directly. This requires no integral splitting of
   Y into central and coroot summands. An empty root set with nonzero X gives
   `D(X)`, and X=0 gives the trivial group.


The integral straightening/basis construction in 9A is an input to the following
explicit group construction. Its proof does not assume 9C's distribution
comparison for a group that is still being constructed.

#### 9A.1a-L Acceptance statement for the lift kernel

Define `CoverLifts.liftSubgroup` as the subgroup of Aut(E)×A consisting of pairs
that fix the included ℤˣ pointwise and cover the prescribed action of A on Q for
an actual extension 1→ℤˣ→E→Q→1. Its carrier is `CoverLifts.LiftGroup`, and
`CoverLifts.projection` is the second projection. The theorem
`CoverLifts.exists_characterKernelEquiv` states that, when the extension is central,
there exists a multiplicative equivalence Hom(Q,ℤˣ)→ker(projection) whose value on
χ acts by e↦ι(χ(π(e)))e. This specifies the equivalence and the action together;
centrality is an explicit hypothesis. The inverse sends a lift f to the unique
character satisfying ι(χ(π(e)))=f(e)e⁻¹; kernel-fixing makes this independent of
the lift e of a quotient element.

- API: projection is a homomorphism with image the liftable acting elements;
  no surjectivity onto arbitrary A is asserted.
- API: the kernel equivalence is multiplicative and fixes the prescribed twist
  formula; identity and inverse characters give identity and inverse twists.
- API: an isomorphism of central extensions transports the subgroup and projection
  and intertwines the character equivalence.

**Checks.**

- On ℤˣ×ℤ, χ(n)=(−1)ⁿ sends (s,n) to (s(−1)ⁿ,n), so (1,1) maps to (−1,1);
  the trivial character fixes (1,1). Both project to the identity action on ℤ.
- For the quaternion cover Q₈→C₂×C₂, the character negative on i and positive
  on j gives i↦−i, j↦j and ij↦−ij, respecting the noncommutative product.
- For Q=1 the character group and projection kernel each have one element;
  allowing automorphisms that move kernel elements would be a different construction.

*Needs:* Mathlib `GroupExtension`, `MulAut` and `MonoidHom.ker`; the centrality
hypothesis and the actual injection and quotient maps of the extension.

### 9A.6 Integral PBW acceptance statement

`IntegralPBW.integral_pbw` asserts linear independence over ℤ and spanning of the
specified ordered monomials in the full reductive integral form. The input
`IntegralPBW.ReductiveChevalleyFrame` bundles a finite reduced crystallographic
root pairing, a ℤ-basis of the full cocharacter lattice Y, its toral map, root
vectors, and a rational ambient basis indexed by toral and root directions.
Its equations are toral commutativity, the root-weight equation, the opposite-root
coroot equation, the integral root-string constants of absolute value p+1 and
vanishing when the sum is neither zero nor a root. This is a specified frame,
not a hypothesis asserting PBW (Humphreys, §26; the full central-torus extension
uses the commuting binomial directions of §9A.2).

- API: transport the frame under based-root-datum isomorphisms and changes of
  enumeration, retaining the actual toral and root basis vectors.
- API: its ambient basis implies root and toral generation; the opposite-root
  and root-string equations fix the normalizations used by the integral form.

**Checks.**

- Empty roots and Y=0 give the zero Lie algebra and an empty ambient basis.
- Empty roots and Y=ℤ give the one-dimensional abelian Lie algebra with one
  toral generator; discarding central toral directions gives the wrong dimension 0.
- In A₁, [e,f]=h and [h,e]=2e; setting e=f=0 with h≠0 violates both the
  ambient-basis requirement and the opposite-root equation 0=h.

Define `IntegralPBW.integralSubring` using native all-root Kostant form and all
Y-basis vectors; `IntegralPBW.IntegralForm` is its carrier. Define
`IntegralPBW.rootDividedPower` and `IntegralPBW.toralBinomial` by native divided
powers and binomials, with native membership proofs.

- API: all-root and toral generators belong to this subring; use the native
  universal property and rational base-change comparison after generation.
- API: divided powers multiply with binomial coefficients; toral binomials retain
  integral values on every integral weight, including central weights.

**Checks.**

- For zero roots and zero torus the subring is ℤ inside ℚ, not the zero ring.
- For one toral generator h, the first terms are 1,h,h(h−1)/2; at weight −1
  they evaluate to 1,−1,1, so ordinary powers are the wrong basis.
- The divided powers are e⁽⁰⁾=1, e⁽¹⁾=e and e⁽²⁾=e²/2, and
  e⁽¹⁾e⁽¹⁾=2e⁽²⁾. In characteristic 2 the coefficient becomes 0 after integral
  base change; division by 2 in the target field is not the definition.

`IntegralPBW.PBWExponent` is the product of natural-number exponent families for
negative roots, the full torus, and positive roots. Define
`IntegralPBW.orderedIntegralMonomial` by multiplying the corresponding divided
powers and toral binomials in increasing index order, negatives first.

- API: the zero exponent gives 1; reindexing transports the order and basis;
  multiplication has integral structure coefficients and commutes with arbitrary
  commutative-ring specialization.
- API: integral PBW gives a free ℤ-module and a base-changed basis over every
  commutative coefficient ring, without a good-prime restriction.

**Checks.**

- Empty root and toral indices give one exponent tuple and monomial 1.
- For a rank-one torus the tuple n gives binomial(h,n), including n=0 and n=2.
- In A₁ the tuple (1,0,1) gives fe; changing to ef adds h since ef=fe+h.
  This distinguishes the prescribed order even though both families span rationally.

*Needs:* §9A.1 full normalized frame; §9A.2 all-root Kostant form;
§9A.3 straightening; Mathlib `RootPairing`, `Module.Basis`, `LinearIndependent`;
Tau Ceti `TauCeti.UniversalEnvelopingAlgebra.kostantForm`.

### 9B. Pinned groups and their explicit carriers

**One constructor.** This phase owns the canonical integral Lie-to-group
construction for every finite reduced **based reductive root datum**
`𝓡=(X,Φ,Y,Φ∨)` with finite free perfectly paired X,Y. It includes arbitrary
central tori and isogeny types. RootSystems owns the datum, numbering, reflection
and diagram APIs;9A owns its full-Y integral Lie/Kostant construction. Here
`pinnedModel 𝓡` is constructed from the finite faithful weight family and
admissible lattices of9A.5 using the native Kostant toral closure. It is not a
choice from the later existence theorem, and is not a second group selected
from an arbitrary concrete realization. Fix finite presentations, weight bases
and orders as construction data, and prove change-of-data isomorphisms below.
The simply connected and adjoint Dynkin instances are specializations of this
one construction, not separate engines. ChevalleyGroups C0–C7 consumes it for
explicit realization comparisons and point-group theory.

The existence and pinned classification endpoints are Conrad, *Reductive Group
Schemes*, Theorems 6.1.16–6.1.17, pp. 196–197, over a nonempty base scheme.
The chart and Kostant-closure comparison in §9B.1 is an additional theorem about
this specified construction, not a conclusion of flatness or of the abstract existence theorem.

**Checks.**

- A root-free rank-one datum gives Gₘ, of dimension 1, with no root maps.
- In simply connected A₁, the root maps at 1 are [[1,1],[0,1]] and
  [[1,0],[1,1]] and generate a group scheme of dimension 3 with the torus.
- Keeping weights 1,−1 on ℤ² but replacing both root operators by zero gives
  identity root maps and a torus of dimension 1. The full normalized frame and
  root-datum comparison exclude this input; torus conjugation alone does not.

Every interface record that feeds the pinned model therefore carries, beyond the
eigenvalue and weight-generation equations, the identification of its root operators
with the §9A.1c normalized frame: the opposite-root brackets `[E_α,E_(−α)]=H_α` for
every root and the root-string equations. In simply connected A₁ the matrix units give
`[E₁₂,E₂₁]=diag(1,−1)`, which zero operators cannot produce, while eigenvalue data
alone is satisfied by both choices.

*Needs:* §9A.1c normalized full frame; §9A.5 faithful integral realization;
§9B.1 chart comparisons for the specified coordinate algebra.

**9B.0. Relative notions and actual carriers.** For every commutative base R,
use the split reductive definition with a specified immersion `D_R(X)→G`,
affine smooth G, reductive geometric fibres, constant roots and coroots in X,Y,
and **free rank-one root lines** realizing those same data in every fibre.
A pinning chooses generators of those lines for the simple roots and the
corresponding Borel. A nontrivial invertible module L in `GL(R⊕L)` shows that
split fibrewise maximal torus alone is insufficient; twice an integral generator
is not a pinning in characteristic2. These conditions and base-change maps
are part of the interface over disconnected bases too.

For the fixed integral representation write its actual native inputs as
`e:I→L`, `h:κ→L`, `ρ:U_ℚ(L)→ₐ[ℚ]End_ℚ(V)`, an additive lattice M stable under
`kostantForm e h`, nilpotent represented root operators, `b:Basis (Fin n) ℤ M`
and integral weights `wt:Fin n→κ→ℤ`. Choose κ as coordinates on **X**, with
Cartan operators from its dual basis in Y. The root character α in X supplies
its exponent vector. Define the coordinate Hopf algebra to be exactly
`CommHopfAlgCat.quotient (GeneralLinear.coordinateHopfAlgebra ℤ n)
(kostantToralDefiningIdeal e h ρ M hM hnil b wt)` and its scheme to be native
`kostantToralGroupScheme`. Points are native convolution homomorphisms
`WithConv (O(G) →ₐ[ℤ] A)`, with `kostantToralSchemePointMulEquiv` and
`kostantToralPointsSubgroup` as explicit scheme/matrix comparisons. Root maps
and torus maps come from `kostantToralRootSubgroupPoints` and
`kostantToralWeightTorusPoints`; prove the weight/eigenvector hypotheses of the
native torus-conjugation theorem from9A. The subgroup point type is not
identified with the subgroup generated by generator **points** merely by its
name. In all universes keep the specified finite coordinate algebra small and
allow A in a separate universe through the native point functor.

**9B.1. Flatness, integral charts, fibres and specialization.** Consume
`TauCeti.UniversalEnvelopingAlgebra.isTorsionFree_kostantToralCoordinateHopfAlgebra` for these
actual parameters. It gives scalar torsion-freeness and flatness over ℤ.
It does not give smoothness, generated-point equality, arbitrary base-change
commutation of generated subgroup schemes, or specialization equality.
Construct these remaining results here. First compute the finite rank-two
integral collection polynomials from9A root strings, retaining constants2/3
and the rank-one SL₂ Gauss relation. For each positive root order construct
ordered multiplication, its coordinate functions and polynomial inverse on U±
using the positive-height filtration; prove uniqueness by its successive
root-coordinate quotients. Construct `U⁻×D(X)×U⁺→G`. In the weight basis,
leading block minors define the ambient LDU open. Prove on its coordinate
localization that multiplication identifies this open in G with the displayed
product: construct mutually inverse commutative ℤ-algebra maps between
the localized coordinate algebra of G and the polynomial/Laurent coordinate
ring of the displayed product, using integral collection and the actual
generator relations. Include the determinant localization and all torus units.
Prove the resulting inverse scheme maps are natural under base change and
agree on chart overlaps. These chart maps are ordinary algebra maps: the big
cell is not a subgroup. Compare group multiplication in these coordinates on
the open locus of pairs whose product also lies in the chart. The global group,
root-subgroup and torus morphisms retain their Hopf-algebra compatibilities. The field Bruhat argument used in
ChevalleyGroups C3/C4 is a consistency check, not the only supplied input to
this integral inverse. Highest-weight coefficients are used only where they
are actual functions of the chosen representation; the standard SL₂ coefficient
does not descend to PGL₂, whereas these block minors do.

Prove the Weyl-translated chart cover in every geometric fibre by rank-one
collection and finite Weyl reduction, then the corresponding scheme cover:
the uncovered closed locus has empty fibres over every prime, hence is empty.
The charts prove smoothness, dimension `rank X + |Φ|`, geometrically connected
reductive fibres, maximality/self-centralizer of the torus, root lines and the
Borel. Extract the root datum and generator pinning from these coordinates.
Only after this verification apply Layer7's structure theory of a **given**
split reductive group. It does not presuppose9B's existence/classification.
Construct specialization comparison with the subgroup scheme generated by the
reduced root maps and torus over every field: its charts are the same integral
coordinate charts after reduction, and the inverses agree on overlaps. Prove
that these charts cover both schemes, and glue the inverse maps. This is the
missing producer behind the comparison; flatness alone never substitutes for it.
Over every field derive generation of points by root maps and the **whole**
torus `Hom(X,kˣ)`; simply connected semisimple points are generated by roots
alone, by the rank-one coroot formulas. No claim about generation over every
commutative ring, or surjectivity of a central isogeny on every field's points,
follows. Retain the adjoint A₁ over ℚ test and its nonsquare determinant class.

**9B.2. Representation and root-datum comparisons.** For any other specified
full admissible realization D, let Λ(D) be its actual weight span, not its
saturation in the full weight lattice P. Require `Q⊆Λ(D)⊆P` in the semisimple
faithful-Lie case and use its actual root datum. Construct the direct sum of
D and the chosen canonical realization E of that datum. Prove its defining
maps factor through the block-diagonal subgroup GL(D)×GL(E). Its coordinate
algebra is generated by both sets of matrix coefficients together with the
inverse determinant of each summand. On the block-diagonal locus these inverses
are det(E)·(det(D)det(E))⁻¹ and det(D)·(det(D)det(E))⁻¹, so they belong to the
ambient determinant localization. Construct the projections on coordinate
Hopf algebras by sending each matrix coefficient to the corresponding block
coefficient and each inverse determinant to the inverse determinant of that
block. Prove these maps factor through the two defining ideals and satisfy
the Hopf identities; a block projection on arbitrary GL matrices is not used.
For the root-free datum X=ℤ, retain the faithful character model of Gₘ as a
boundary test: these generators must recover ℤ[t,t⁻¹], including t⁻¹. The chart coordinates above
agree under both projections, with the same X-characters and root parameters;
construct inverse maps on the chart localizations and their Weyl translates,
verify overlap equality and glue. This gives integral group-scheme
isomorphisms matching roots, torus and pinning, natural in A and compatible
with lattice/basis changes. Their composites are identity by the same chart
identities. A rational intertwiner or equality of dimensions alone is not this
proof. Thus existing Geck, spin, tripled D₄, minuscule/doubled E₆, E₇ and
short-root G₂/F₄ carriers remain useful represented realizations with explicit
comparisons, while there is only one canonical group per pinned datum.

For inclusions `Λ(D)⊆Λ(E)` construct the canonical central isogeny
`G_E→G_D`, its scheme kernel `D(Λ(E)/Λ(D))`, root equations and torus restriction
map. Prove the map using the compatible local chart coordinates and fppf central
quotient, with the required finite presentation/descent hypotheses from Layers0/3/4;
equality of lattices gives an isomorphism. This comparison is not integral
central splitting, nor surjectivity on arbitrary rational points. For a general
full-X reductive datum retain its compatible central characters throughout.

**9B.3. Pinned isomorphisms and exceptional maps.** Construct the isomorphism
for a based root-datum isomorphism by its actual X,Y maps on the chart
coordinates; prove inverse, uniqueness, composition and all base-change laws.
This owns the scheme-level diagram automorphism. Its Lie comparison consumes
9A.1c and the native Serre diagram action; the character pullback is the inverse
of the geometric diagram action. D₄ order3 detects inverse mistakes.

For B₂/C₂ and F₄ in characteristic2 and G₂ in characteristic3, retain all
explicit polynomial constructions: the rank-two symplectic exterior-square
subquotient; short-root G₂'s7-dimensional and F₄'s26-dimensional modules over
the prime field, the stable short-root ideal I of the represented Chevalley
Lie algebra, and a fixed normalized identification `𝔤/I≃V` with its actual
zero-weight basis. Construct the polynomial action on that quotient, its
multiplicativity and generator equations over `𝔽_p[t]`, not just `𝔽_p`.
Use the **prime-field generated subgroup's** defining ideal to prove restriction,
then9B.1/2 specialization and realization isomorphisms to transfer the map to
`pinnedModel`. Verify its square is Frobenius and its scheme kernel is
infinitesimal, noncentral; prove `CommHopfAlgCat.IsIsogeny` with its full
hypotheses. This scheme producer uses chart/ideal relations, not ChevalleyGroups
C5's point-map classification or C7 as an assumed theorem. C5 independently
constructs the field-point map from the presentation and checks the specified
integral character action; C7 compares it with this scheme map on all roots,
torus and A-points. Long **source** root parameters have exponent1 and short
source parameters exponent p; native root-isogeny exponents are indexed on
pullback roots. Preserve signs, the B₂/𝔽₈ rejected reversed table, and the
rank-one/±simple equations. This is not a second exceptional-isogeny owner.

Section 9B includes explicit construction, base change, all roots,
convolution points and field maps, pinning, simple connectivity/adjoint centre,
pinned isomorphism, special isogenies, and numbered symmetries on every listed
realization. Layer9C distributions/Frobenius and Layer10 rational/positive-
characteristic representations remain unchanged consumers, never prerequisites
of the integral constructor. Layers8's general relative/pseudo-reductive theory
and11's spectral/topological programme are not restricted to this split model.

- **Elementary generators and all ring points.** For each commutative ring A,
  define E_G(A) inside the constructed G(A) as the subgroup generated by
  all x_α(a), and GE_G(A) as the subgroup generated by E_G(A) and T(A).
  Here T(A) denotes the image of the pinned torus embedding in G(A).
  Use native subgroups of Layer0's same points group, with inclusions and
  ring-functorial restrictions compatible with all base-change maps. Prove
  `t x_α(a) t⁻¹=x_α(α(t)a)`, so T(A) normalizes E_G(A) and
  GE_G(A)=E_G(A)T(A). Consume 9B.1's integral Weyl-translated chart cover:
  the chart Ω=U⁻D(X)U⁺ has its actual inverse, and each translate uses
  a Weyl representative built from `x_α(1)x_(−α)(−1)x_α(1)`.
  Derive GE_G(k)=G(k) over every field, agreeing with9B.1, and extend
  this to every local ring A: the closed point of Spec A lands in one
  translated chart, so the entire A-point factors through that open;
  its chart coordinates lie in E_G(A)T(A). Over a general commutative
  ring retain GE_G(A) as a subgroup of the represented whole points group.
  Compare the canonical faithful matrix realization as a closed immersion,
  whose kernel on A-points is trivial. For another realization D with
  finite-index weight span Λ(D)⊂X use9B.2's central isogeny and its scheme kernel
  D(X/Λ(D)); prove it maps E_G(A) onto E_(G_D)(A), while recording the
  induced torus/GE image without asserting pointwise surjectivity.
  In SL₂(ℚ)→PGL₂(ℚ), the nonsquare determinant classes in ℚˣ/(ℚˣ)²
  detect this distinction despite generation of both field-points groups
  by their roots and whole tori.

#### 9C. Algebraic distributions and Frobenius

For a smooth affine group scheme G of finite type over ℤ constructed in 9B,
write I for the identity augmentation ideal. Construct the finite order jets
`O(G)/I^(n+1)`, their finite free ℤ-duals and the filtered union of those duals,
with its convolution algebra, coalgebra and antipode from Layer0's Hopf maps.
These are distributions supported at the identity, not analytic distributions.
Prove finite freeness of the jets, the order inclusions and convolution estimates,
and arbitrary-ring base change level by level. For a constructed split reductive
G, use the big-cell open neighbourhood `U⁻×T×U⁺→G` to give the distribution
triangular factorization, root-subgroup coefficient distributions and the full
Y-toral binomial basis. Construct the rational comparison with U(Lie(G_ℚ)),
pinning the root derivative and H_y, and identify the integral form of9A with
`Dist_ℤ(G)`. Hence `A⊗_ℤ U_ℤ≃Dist_A(G_A)` for every commutative A, with actual
basis and order equations. Dist(T) includes every central toral direction.
For G=𝔾_m the root set is empty but the answer is the binomial algebra on its
cocharacter generator, not ℤ alone. For adjoint A₁, retain α∨=2y in Y: the
coroot-only form must not silently replace the full toral lattice. An isogeny
induces the specified distribution map; assert an isomorphism only with a proved
hypothesis such as invertibility of its finite kernel's order.

In characteristic p>0 first use the **relative** Frobenius G→G^(p), with its
actual scalar-twist comparison; the pinned ℤ/F_p form identifies the target when
an endomorphism is desired. Construct the induced Hopf map on distributions.
On every root divided-power basis it kills indices not divisible by p and
sends index pm to m; on `binom(H_(y_j),n)` it has the same rule. Give iterated
p^r formulas, the map on every ordered basis element and the toral formulas for
all y∈Y. Prove surjectivity and identify its kernel both by these basis equations
and as the ideal generated by the augmentation ideal of the Frobenius-kernel
distributions. For the r-th Frobenius kernel prove its distribution algebra is the
finite sub-Hopf algebra with all root and toral indices <p^r, of dimension
`p^(r dim G)`. Compare the first kernel with the restricted enveloping algebra
of the actual restricted Lie algebra. The full hyperalgebra is infinite and is
not that finite restricted algebra; ordinary division by p! is never performed.

Construct the positive and negative raising-index algebra maps on the unipotent
parts by their **simple-root** divided-power values `E_i^(m)↦E_i^(pm)` and
`F_i^(m)↦F_i^(pm)`, proving the divided-power relations and their Frobenius
section equations. Their nonsimple-root values are determined by the actual
relations, not an additional all-root index-multiplication assertion. They are
not asserted to be Hopf maps or to combine unmodified with a toral map into a
unital section on all Dist(G).

For the full split reductive group over an algebraically closed field of
characteristic p, construct the toral idempotent
`μ₀=Π_j binom(H_(y_j)−1,p−1)`. It projects rational T-modules onto weights in
pX. Construct the corner algebra `μ₀Dist(G)μ₀` with unit μ₀ and the unital
map φ from Dist(G) to this corner, with `Dist(F)φ=id` after inclusion. Its
simple-root and toral values are
`φ(E_i^(m))=E_i^(pm)μ₀`, `φ(F_i^(m))=F_i^(pm)μ₀` and
`φ(Π_j binom(H_(y_j),b_j))=(Π_j binom(H_(y_j),pb_j))μ₀`.
Prove the integer-linear toral and mixed relations for the actual coroots in Y,
basis/pinning transport and the corner unit law. Viewed in Dist(G) this map is
multiplicative and linear with φ(1)=μ₀, generally not unital; it is not a second
Hopf structure. This is the full reductive construction of
[Gros–Kaneda](https://arxiv.org/html/1712.06835), including central torus and
non-simply-connected derived groups. Construct its F_p-form by the displayed
pinned-generator formulas and prove its base change to every characteristic-p
field: multiplicativity and the section equations descend from a faithfully
flat algebraic-closure extension. Retain the relative Frobenius scalar twist
and the specified pinned split form in this comparison.

On a rational G-module construct the contracted rational module on μ₀M, with
weights pλ relabelled λ and action through φ. Prove integration using the
actual `(Dist(G),T)` module interface of10A, functoriality and compatibility with
Frobenius pullback, in particular `(F* N)^φ≃N` on rational modules on the
identified Frobenius target. The functor is exact. It is not claimed monoidal:
for T=𝔾_m, weights1 and p−1 can both contract to zero while their tensor
contracts nontrivially. Retain the positive/negative maps separately. The geometric
Frobenius splitting of flags, its trace normalization and Schubert compatibility
are applications owned by SchubertGeometry; none is a proof premise of9A–9C.

**Checks.**

- `𝔾_m` over `ℤ`: `O=ℤ[t,t⁻¹]`, `I=(t−1)`, and the order-`n` jet is free of rank `n+1`
  on `(t−1)^k`, `k≤n`; its dual basis is the binomial distributions `binom(H,k)` with
  `binom(H,k)(t^m)=binom(m,k)`. Convolution gives `H·H=H+2·binom(H,2)` (values
  `m²=m+2·binom(m,2)`), so `binom(H,2)=(H²−H)/2` lies in `Dist_ℤ(𝔾_m)` but not in the
  polynomial ring `ℤ[H]`: identifying `Dist_ℤ(G)` with `U_ℤ(Lie G)` fails already in
  rank one.
- `𝔾_a` over `ℤ`: `O=ℤ[x]`, `I=(x)`, and the dual basis of `x^k` is the divided powers
  `γ_k` with `γ_j·γ_k=binom(j+k,j)γ_(j+k)`, so `γ₁²=2γ₂` and `γ₂` is not a quotient
  by `2` inside `ℤ[γ₁]`. Over `𝔽_p` the relative Frobenius `x↦x^p` sends `γ_k` to
  `γ_(k/p)` when `p∣k` and to `0` otherwise (`γ_p↦γ₁`, `γ₁↦0`). The group-scheme
  kernel is `α_p`, whose distribution algebra has basis `γ₀,…,γ_(p−1)` and dimension
  `p=p^(1·1)`. The kernel of the distribution map is instead the span of all `γ_k`
  with `p∤k`, equivalently the ideal generated by the augmentation ideal of
  `Dist(α_p)` (Jantzen, 1985 preprint, I.7.2–I.7.3 and I.7.8–I.7.9, pp. 136–138,
  144–146, applied to `x↦x^p`). Indeed, for `k=pm+r`, `0<r<p`, the product
  `γ_r γ_(pm)=binom(pm+r,r)γ_k=γ_k` over `𝔽_p`. At `p=2` this kernel has the
  infinite basis `γ₁,γ₃,…`, whereas `Dist(α₂)` has basis `γ₀,γ₁`: `γ₀↦γ₀≠0`
  and `γ₃↦0`. At `p=3`, `γ₃↦γ₁` and `γ₄↦0`; generally `γ_(p+1)` lies in the
  map's kernel but outside `Dist(α_p)`.
- The central isogeny `SL₂→PGL₂` restricts on tori to `t↦s=t²`, so `H↦2H′` and
  `binom(H,2)↦4·binom(H′,2)+H′`. Over `𝔽₂` the first image is `0` and the second is
  `H′`: the distribution map is surjective but not injective, as the kernel order `2`
  is not invertible.
- Toral idempotent: for `T=𝔾_m` and `p=2`, `μ₀=binom(H−1,1)=H−1` acts on weight `λ` by
  `λ−1`, that is by `0,1,0` on `λ=1,2,3` modulo `2`, projecting onto even weights. For
  general `p`, `binom(λ−1,p−1)≡1` when `p∣λ` and `≡0` otherwise, by Lucas.
- Contraction is not monoidal: for `p=3` the weights `1` and `2` give `binom(0,2)=0`
  and `binom(1,2)=0`, so both lines contract to zero, while their tensor product has
  weight `3` and `binom(2,2)=1`.

### Examples

The root-free rank-one model is Gₘ; simply connected A₁ is SL₂ with two nonconstant root maps. The zero-root-operator input gives dimension 1 instead of 3.

### Dependencies

*Needs:* RootSystems Layers 5–6; native Kostant form and toral closure; §§9A.1–9A.5 before §9B; §9B before distributions in §9C.

## Layer 10: rational representations, highest weights and regular functions

#### 10A. The rational category and actual torus lattice

Use Layer1's existing right O(G)-comodules and their actual coefficient maps,
tensor/dual/Hom and finite-dimensional full subcategory. Construct the rational
scheme-action comparison, subobjects, quotients, exact sequences, invariants,
restriction, and scalar extension at their stated field hypotheses. An action
on G(k) alone, especially over finite k, is not this rational representation.
For a split torus T with character lattice X, identify O(T)=k[X] and construct
the finite weight-support decomposition of every finite-dimensional rational
module, with integral X labels, direct sums, tensor convolution and dual
negation. The formal character lies in ℤ[X]. For split reductive G its Weyl
normalizer action and root-distribution maps retain the actual X,Y pairing,
central weights and all character-lattice restrictions. Lie toral eigenvalues
mod p do not recover the weights.

Differentiate a rational action through9C: `E_α^(n)` is the coefficient of t^n
in the action of x_α(t), and `binom(H_y,n)` acts on weight λ by
`binom(⟨λ,y⟩,n)`. Construct the integration comparison using a rational T-action
with those toral equations, root weight shifts and local finiteness, verifying
actual group/root relations. For finite modules the finite weight set supplies
the root-action finiteness; for general modules require a directed union of
finite-dimensional compatible submodules. Do not identify all abstract finite
Dist(G)-modules with rational G-modules: already Dist(𝔾_m) permits p-adic
binomial characters without an integer rational character. Full X-integrality
and T-compatibility are part of the integration interface.

**Checks.**

- For `𝔾_m`, the comodule `k` with coaction `v↦v⊗t^λ` has weight `λ`, and
  `binom(H,n)` acts by `binom(λ,n)`: `λ=3`, `n=2` gives `3`. The standard module of
  `SL₂` has formal character `t+t⁻¹`, its dual the negated weights (the same
  character), and its tensor square `t²+2+t⁻²` by convolution.
- Over `k=𝔽_q` the characters `t↦t` and `t↦t^q` of `𝔾_m` agree on `𝔾_m(𝔽_q)` but
  are distinct rational characters, `1≠q` in `X=ℤ`, with distinct formal characters:
  an action on `G(k)` alone is not the rational representation.
- Weights `λ` and `λ+p` give the same eigenvalue of `H` in characteristic `p`, while
  `binom(H,p)` separates them: for `p=2`, `binom(0,2)=0` and `binom(2,2)=1`.
- A `Dist(𝔾_m)`-module without rational character: over a field of characteristic 2
  let `α=−1/3=1+4+16+…∈ℤ₂` and let `binom(H,n)` act by `binom(α,n)` modulo 2. By
  Lucas, `binom(α,2^r)` is the `r`-th binary digit of `α`, alternating `1,0,1,0,…`,
  whereas for an integer `λ` the sequence `binom(λ,2^r)` modulo 2 is eventually `0`
  (`λ≥0`) or eventually `1` (`λ<0`). No `λ∈X` matches, so this module is not the
  differential of a rational character.

#### 10B. Induction, Weyl modules and simple heads

For a split connected reductive G over a field fix B⁺ and its opposite B⁻,
with positive roots from B⁺. Consume §1.1’s
canonical arbitrary-base algebraic induction: the actual cotensor equalizer for the
coordinate bialgebra map, its native comodule coaction and natural reciprocity maps.
Specialize to k and transport by its antipode/inversion comparison from
`F(hg)=hF(g)` with right translation to `f(gh)=h⁻¹f(g)` with left translation.
Construct the field regular-function and group-scheme dictionaries and identify counit
evaluation in Frobenius reciprocity (Milne 2017, §22.29, pp. 470–471). The generic induction engine is §1.1; the induced/Weyl/highest-weight and integral applications remain here. Put `∇(λ)=Ind_(B⁻)^G k_λ`: its functions satisfy
`f(gb)=λ(b)^(−1)f(g)` and G acts by `a·f(g)=f(a^(−1)g)`. For λ∈X⁺ prove
finite dimensionality, highest weight λ and its one-dimensional B⁺-highest
line, and simple socle L(λ). For λ∉X⁺ prove the corresponding induced module
zero (Milne, Definition 22.21 and Proposition 22.27, pp. 468–470,
transported from B⁺ to B⁻). Construct `Δ(λ)=∇(−w₀λ)*`, its distinguished generating highest line,
unique simple head L(λ), and the normalized nonzero map Δ(λ)→∇(λ) with image
L(λ). Prove the classification of finite-dimensional rational simples by X⁺,
absolute simplicity and End_G(L(λ))=k for split G (Milne, Theorem 22.2
and §§22.3–22.5, pp. 463–464). Give arbitrary-field base
change/descent proofs for these split objects; do not extend this last scalar
endomorphism assertion to arbitrary nonsplit groups. State induced/Weyl base
change and integral Weyl lattices with their actual freeness and action equations,
not simplicity at every specialization. Their characters are the Weyl characters;
characteristic-zero complete reducibility makes Δ=∇=L there. In characteristic p
retain distinct heads, socles and extensions: characters do not identify modules.

Construct the pinned integral group anti-involution τ fixing T and interchanging
simple positive/negative root subgroups, with its distribution anti-involution.
The contravariant dual `D_τ M=Hom_k(M,k)`, acted on by
`(g·φ)(m)=φ(τ(g)m)`, is distinct from the ordinary dual. Construct
`D_τΔ(λ)≃∇(λ)`, natural biduality and the perfect integral evaluation
pairing with the dual. Construct the top-normalized integral contravariant
form on Δ; after field specialization its radical is the maximal proper
submodule and its quotient is L. This latter form need not remain nondegenerate
in characteristic p. Put `σ(g)=τ(g)^(−1)`; the contravariant dual is the
ordinary dual with action twisted by this automorphism. Export the exact
highest/lowest line, torus-weight and extremal-vector equations under ordinary
duality, τ and opposition. In particular the ordinary dual remains
`Δ(λ)*≃∇(−w₀λ)`; a same-label identification requires the displayed twist,
not an implicit self-duality assertion. The ordinary-dual convention is Milne,
§22a, “The highest weight of the contragredient representation”, p. 471;
the integral Weyl lattice and top-normalized contravariant form are
Fang–Lim–Tan, arXiv:1904.13040v2, §2.1, pp. 2–3. This reference treats
split connected reductive integral models and retains the torus action in
its distribution description.

Prove root-subgroup generation, highest-weight order and Weyl-orbit convex-hull
bounds in `(X⊗ℝ)`, retaining central coordinates. A unique highest line does not
by itself imply generation or simplicity. In a module generated by a
one-dimensional highest line prove the unique maximal proper submodule/head
by the top-weight argument; use generation, not bare cyclicity. Prove simple
highest-weight uniqueness through the cyclic span of two chosen highest vectors
in their direct sum and its two projections. Preserve disconnected/nonreduced
rational categories from Layer1; this dominant-weight classification is for the
stated split connected reductive hypothesis.

For split simply connected semisimple G in characteristic p>0, let
`ρ=½Σ_(α>0)α`, which is in this group's actual X. Construct the algebraic
Steinberg theorem before any flag splitting/Schubert cohomology:
`Δ((p−1)ρ)≃L((p−1)ρ)≃∇((p−1)ρ)`, of dimension `p^|Φ⁺|`.
Give the truncated negative-root PBW model, root-distribution actions and the
nonzero extremal-vector equation, together with a normalized nondegenerate
contravariant pairing for the pinned Chevalley anti-involution. Prove its
F_p-form/base-change and all-prime cases, including p=2. For a general reductive
G use its derived simply connected cover when this module is needed; do not
assume `(p−1)ρ∈X(G)` or that the same module descends. SchubertGeometry owns
central-isogeny flag transport, anticanonical trace and the geometric splitting.
The Steinberg proof uses9A/9C and10A/10B algebra, not that later splitting,
vanishing or standard-monomial theorem.

The induced, Weyl and dual constructions have the following APIs.

- Induced modules have their actual evaluation/cotensor reciprocity maps,
  commute with field extension, and have a unique simple socle at a dominant
  weight. The Weyl module is generated by its chosen top line and has that
  same simple as its unique head; the normalized map from Weyl to induced
  module sends the chosen top vector to the chosen top vector.
- The pinned anti-involution fixes T, exchanges x_α(a) and x_−α(a) for
  simple roots, reverses multiplication and squares to the identity. Its
  distribution map reverses products and respects the divided powers.
- Contravariant duality preserves each torus weight, reverses arrows and
  short exact sequences, and has the evaluation biduality isomorphism;
  ordinary duality negates weights. These maps commute with field extension.
- The integral contravariant form has value 1 on the chosen highest vector
  paired with itself, satisfies (uv,w)=(v,τ(u)w), and induces the normalized
  map to the contravariant dual. The evaluation pairing with the full dual
  is perfect even when this form becomes degenerate after specialization.

**Checks for induced modules.**

- For G=T=Gₘ and λ=3, f(t)=t⁻³ satisfies f(tb)=b⁻³f(t), while
  (a·f)(t)=f(a⁻¹t)=a³f(t). The induced module is one-dimensional of
  weight +3, not −3.
- For SL₂ and λ=1, ∇(1) has weights 1,−1, each of multiplicity 1;
  its highest line and simple socle give the two-dimensional standard module.
- For SL₂ and λ=−1, ∇(−1)=0; at λ=0 it is k, of dimension 1.
  A definition that attaches a nonzero highest module to every integer fails.

**Checks for Weyl modules and their simple heads.**

- For Gₘ and λ=3, w₀=1, so ∇(−3)* has weight +3 and dimension 1;
  using ∇(3)* would give weight −3.
- For SL₂ in characteristic zero, Δ(2) has weights 2,0,−2 and
  dimension 3; its head and the image in ∇(2) also have dimension 3.
- For SL₂ in characteristic 2, Δ(2) has dimension 3 but its simple
  head L(2) has weights 2,−2 and dimension 2. The normalized map to
  ∇(2) has one-dimensional kernel, excluding universal simplicity.

**Checks for the anti-involution and contravariant duality.**

- In SL₂ take τ(g)=gᵗ: τ(I+aE₁₂)=I+aE₂₁ and τ(diag(t,t⁻¹))
  =diag(t,t⁻¹). With u=I+E₁₂ and v=I+E₂₁, τ(uv)=[[2,1],[1,1]]
  =τ(v)τ(u), whereas τ(u)τ(v)=[[1,1],[1,2]].
- For the Gₘ character t³, τ fixes t, so D_τ has weight +3;
  the ordinary dual has weight −3. At t=2 over ℚ these scalars are
  8 and 1/8, and σ sends 2 to 1/2.
- For the standard GL₃ module, D_τ has highest weight (1,0,0),
  while the ordinary dual has highest weight (0,0,−1). Biduality
  sends each basis vector eᵢ to evaluation at eᵢ, so its matrix is I₃.

**Checks for the contravariant form.**

- For the rank-zero group and λ=0, the Weyl lattice is ℤ and the
  normalized form is (a,b)↦ab, with Gram matrix [1].
- For SL₂ and λ=1, the basis v,Fv gives Gram matrix diag(1,1);
  reduction modulo 2 remains nondegenerate of rank 2.
- For SL₂ and λ=2, the divided-power basis v,Fv,F⁽²⁾v gives
  diag(1,2,1). Its rank is 3 over ℚ and 2 over 𝔽₂, with radical
  𝔽₂Fv; the evaluation pairing with the integral dual still has matrix I₃.

*Needs:* §1.1 algebraic induction and reciprocity; §6.2 for the characteristic-zero
comparison; Layer 7 Borels and root generation; §§9A–9C integral PBW, pinned
models and their distributions; §10A rational weight/distribution compatibility.
The duality comparisons use the constructed pinning and the integral Weyl
lattice, not an assumed self-duality of every rational representation.

#### 10C. Binary forms and the source's characteristic-p exercises

Use the actual rational SL₂ action on `R_n=k[x,y]_n`,
`(g·f)(u,v)=f(du−bv,−cu+av)` for `g=[[a,b],[c,d]]`. For B⁺ upper triangular,
the unique B⁺-stable line is k y^n of weight n, and `R_n≃∇(n)`;
`R_n*≃Δ(n)` has the generating highest line k δ_(x^n).
Prove indecomposability through simple socle/head, not a false semisimplicity
argument. In characteristic zero R_n is simple. In characteristic p>0 write
`n=Σ n_j p^j`, `0≤n_j<p`; prove via Lucas coefficients and the rank-one
simple-module construction that
`dim L(n)=Π_j(n_j+1)`, and that the rational submodule generated by y^n is its
simple socle. Thus highest-line generation of R_n, simplicity of R_n and
`n=(a+1)p^m−1` for some `0≤a<p,m≥0` are equivalent. Include n=0 explicitly.
Generation here means the smallest rational subcomodule, not only a G(k)-orbit
span over a finite field.

Compute char3,n4: the socle spans x⁴,x³y,xy³,y⁴ and misses x²y². Compute
char2,n2: y² generates only span(x²,y²), whereas xy generates all R₂ as a
rational module. This separates bare cyclicity from generation by the highest
line. On R_n* prove highest-line generation for every n; at n=p the additional
B⁺-stable line k δ_(x^(p−1)y) shows uniqueness can fail. Retain the source's
ambiguous divisibility phrase as a source discrepancy; never promote it to
`p∤n` as a highest-line criterion. Give proper submodules for positive multiples
of p and treat the zero-degree exception separately. Root and torus action
formulas, dual-basis signs and all source exercises are applications of the same
rational category.

**Checks.**

- In characteristic `0`, or for `p>n`, `R_n` is simple of dimension `n+1`; `n=0` is
  the trivial module in every characteristic, with `Π_j(n_j+1)=1`.
- `p=3`, `n=4=1+1·3`: `dim L(4)=2·2=4`, with weights `±1±3`, so the socle of `R₄` is
  spanned by `x⁴,x³y,xy³,y⁴` and misses the weight-zero vector `x²y²`; `R₄` has
  dimension 5 and is not simple, and `4=(a+1)3^m−1` has no solution with `0≤a<3`.
- `p=2`, `n=2`: `g·y²=c²u²+a²v²` has no `uv` term, so `y²` generates `span(x²,y²)`,
  while `g·(xy)=−cd·u²+(ad+bc)·uv−ab·v²` at `g=1`, `[[1,1],[0,1]]` and
  `[[1,0],[1,1]]` gives three independent vectors, so `xy` generates all of `R₂`:
  cyclicity and highest-line generation differ.
- `n=p=2` on `R₂*`: the `uv`-coefficient of `g⁻¹·x²=(au+bv)²` is `2ab=0`, so the
  functional `δ_(xy)` spans a second `B⁺`-stable line, of weight 0; in characteristic
  `≠2` that coefficient is nonzero for `b≠0` and the highest line `kδ_(x²)` is the
  only `B⁺`-stable line.

#### 10D. Algebraic Peter–Weyl and polynomial monoid actions

For linearly reductive affine groups over a field construct the cosemisimple
regular coefficient-coalgebra decomposition. Over an algebraically closed field,
identify it with `⊕_[V simple] V*⊗V` by
`φ⊗v ↦ (g↦φ(gv))`, with the action
`(a,b)·f(g)=f(a^(−1)gb)`. Hence the first factor acts on V* and the second on V.
For split connected reductive G in characteristic zero index these summands by
λ∈X⁺ using10B. Keep regular O(G), not all set-valued, continuous or L² functions.
Export the coefficient equations, Schur/Frobenius reciprocity multiplicities,
unit/tensor-product multiplication, counit φ(v), antipode/dual and
`Δc_(φ,v)=Σ_j c_(φ,e_j)⊗c_(e_j*,v)` with the left factor first. For a nonsplit
field retain the actual simple coefficient coalgebras and End_G(V)-balanced
bimodule/coequalizer comparison and descent; do not assume every irreducible has
scalar commutant. No compact Haar/Peter–Weyl theorem substitutes for this algebraic
construction. In positive characteristic no direct sum of simple coefficients
is asserted to exhaust O(G).

##### Right-unipotent invariants, Cartan multiplication and the rank-one quotient

For a split connected reductive group over an algebraically closed field of
characteristic zero, fix the same positive Borel `B⁺=T⋉N⁺`, actual character
lattice and normalized highest lines as 10B. Under 10D's coefficient map
`φ⊗v ↦ (g↦φ(gv))` and action `(a,b)f(g)=f(a⁻¹gb)`, construct the right
group-scheme-invariant algebra comparison
`O(G)^(1×N⁺) ≃ ⊕_(λ∈X⁺) V(λ)*⊗V(λ)^(N⁺)`.
Here invariants mean the coaction equalizer, not invariance only on rational
points. Right `T` acts on the highest line with weight λ; the left summand is
`V(λ)*`, and rewriting it as a sum of simples uses the explicit dual reindexing
λ↦−w₀λ. Choose actual highest vectors, including the unit at weight zero, and
construct the unique Cartan inclusion `V(λ+μ)→V(λ)⊗V(μ)` sending the chosen
highest vector to their tensor. Prove its associativity/unit compatibilities
and that multiplication of coefficient functions is its dual on the left
factors and the chosen highest-line product on the right. This fixes the
scalar coherences; unrelated choices of one-dimensional identifications do
not define the algebra. Prove compatibility with all central characters and
the existing flag-minor/section-ring applications. This simple-coefficient
direct sum stays in the stated characteristic-zero lane; it does not assert
semisimplicity of positive-characteristic rational representations.

Over **every field** k, give the separate explicit `SL₂/N⁺` construction.
For `g=[[a,b],[c,d]]`, `ad−bc=1`, right multiplication by
`n(t)=[[1,t],[0,1]]` changes `(b,d)` to `(b+at,d+ct)` and fixes `(a,c)`.
On coordinates the right coaction is
`a↦a⊗1`, `c↦c⊗1`, `b↦b⊗1+a⊗t`, `d↦d⊗1+c⊗t`.
The first-column morphism maps to `U=A²_k\{0}`. Construct its Zariski
`N⁺`-torsor charts using the sections
`s_a=[[a,0],[c,a⁻¹]]` on D(a) and
`s_c=[[a,−c⁻¹],[c,0]]` on D(c), with fibre coordinates
`u_a=b/a` and `u_c=d/c`. On the overlap prove
`s_c=s_a n(−1/(ac))` and `u_c=u_a+1/(ac)`, and prove the represented fppf
quotient universal property from these charts. Compute its global functions
by the Čech equalizer/localization intersection
`k[a,c]_a ∩ k[a,c]_c = k[a,c]` inside `k(a,c)`; explicitly prove the intersection
using the coprime variables. Prove the right coaction invariants on each
torsor chart are exactly its base ring by translation in an independent
indeterminate, which remains valid over finite fields and in positive
characteristic. Thus `O(SL₂)^(N⁺)=k[a,c]`, but the geometric quotient is the
quasiaffine punctured plane, not its affinization `Spec k[a,c]=A²_k`.
Identify the degree-n polynomials in `(a,c)` under left translation with10C's
actual contragredient binary-form module `∇(n)`. The actual right torus
`diag(t,t⁻¹)⊂SL₂` scales the first column by t and acts on degree-n functions
by the character `t↦t^n`, including n=0; arbitrary scalar matrices are not
being treated as elements of SL₂. Over characteristic zero compare this with the
preceding Cartan algebra; over positive characteristic retain10C's simple
socle, generation and nonsimplicity distinctions. In the preceding
characteristic-zero general-group lane, apply the coefficient and
multiplication comparisons to
GroebnerGeometry G5's
polynomial flag-minor/standard-monomial construction. First prove that its
polynomial flag-minor algebra is `O(Mat_n)^(1×N⁺)` for the actual right
upper-unipotent matrix action. Then prove that localization at the full
determinant identifies this algebra with `O(GL_n)^(1×N⁺)`, using the
invariant determinant and the actual coordinate-ring inclusion. Include
n=0, with determinant 1 and invariant algebra k. Minors in the first d
columns use G5's increasing row subsets and the right matrix action, while the left
action on polynomial coordinates is contragredient. Construct the row/column
and dual-action comparison explicitly. Do not assert the original flag
algebra is its toric initial algebra.

**Checks.**

- For `𝔾_m` the simples are the characters `t^λ`, each coefficient coalgebra is `k·t^λ`
  with `Δ(t^λ)=t^λ⊗t^λ`, and their sum over `λ∈ℤ` is all of `O(𝔾_m)`. The two-sided
  action is `(a,b)·t^λ=a^(−λ)b^λ`, so the first factor acts through the dual
  character; the convention `f(agb⁻¹)` would put the dual on the second factor, and
  the two differ already at `λ=1`.
- For `SL₂` and `V=k²` the four coefficients `c_(e_i*,e_j)` are the matrix entries
  `a,b,c,d`, and `Δa=a⊗a+b⊗c` is the displayed sum with the left factor first. Over
  `𝔽₂` the module `R₂` of 10C has simple socle of dimension 2 and is not semisimple, so
  its coefficient coalgebra is not contained in the sum of the simple coefficient
  coalgebras, which therefore do not exhaust `O(SL₂)`.
- On the `SL₂/N⁺` overlap, `s_a·n(t)=[[a,at],[c,ct+a⁻¹]]`, and `t=−1/(ac)` gives
  `[[a,−c⁻¹],[c,0]]=s_c`; for `g=[[a,b],[c,d]]`, `u_c−u_a=d/c−b/a=(ad−bc)/(ac)=1/(ac)`.
- `1/a∈k[a,c]_a` is not in `k[a,c]_c`, and the intersection inside `k(a,c)` is
  `k[a,c]`; the origin of `Spec k[a,c]=𝔸²` is the image of no point of `SL₂`, whose
  first columns are nonzero, so the quotient is quasi-affine and not `𝔸²`. The torus
  `diag(t,t⁻¹)` sends `(a,c)` to `(ta,tc)` and acts on `a^ic^(n−i)` by `t^n`.
- Polynomiality: `det` has weight `(1,…,1)∈ℕⁿ` and is polynomial, `det⁻¹` has weight
  `(−1,…,−1)` and is rational but not polynomial; for `n=1` the character `t^λ` of
  `GL₁` is polynomial exactly when `λ≥0`; for `n=0`, `k[End(0)]=k=k[GL₀]` and every
  rational module is polynomial.

For the complex rank-one torsor and its cocycle, compare
[Hedén §§1,3](https://arxiv.org/html/1407.7638v2).

For GL(V), construct its polynomial representation comparison with actions of
the algebraic endomorphism monoid End(V). A finite rational action extends
uniquely exactly when its coefficient coaction factors through
`k[End(V)]⊂k[GL(V)]=k[x_ij,det^(−1)]`; prove that the factorization preserves
unit and multiplication, using the actual coordinate bialgebra maps. Treat
zero dimensions and all determinant inverses correctly. Construct homogeneous
polynomial coefficient coalgebras and their finite Schur-algebra duals, compare
Schur/Cartan modules with the same rational category, and prove over every field that a finite rational GL_n-module is polynomial
exactly when every actual T-weight is in ℕ^n. For n>0 identify homogeneous
degree d by the scalar-torus character t^d and the coefficient coalgebra; treat
the zero module and n=0 separately. For simples the
polynomial condition is the actual nonnegative dominant GL-weight condition;
prove it, rather than imposing semisimplicity on arbitrary characteristic-p
polynomial modules. Mixed positive/negative determinant twists remain rational,
and their regular coefficient localization uses all powers of det^(−1).

The generic category, integral/toral and algebraic highest-module constructions
here precede SchubertGeometry's geometric line-bundle/coordinate/section-ring
comparisons. With its opposite-Borel convention the geometric
`G×^(B⁻)k_λ` has H⁰=∇(λ); the positive-Borel bundle with associated character
−λ instead has H⁰=∇(−w₀λ)=Δ(λ)*. Geometric very ampleness, Schubert bases,
coherent vanishing and compatible Frobenius splitting are owned by that
application, not used as unnamed assumptions to establish this generic algebra.

---

### Examples

For SL₂ the dominant weight n has Weyl dimension n+1. At n=0 the module is the trivial line; positive-characteristic heads need not have that dimension.

### Dependencies

*Needs:* §1.1 induction; Layers 4, 7 and 9; each additional character or invariant-theory supplier named in the relevant subsection.

## Layer 11: regular-semisimple spectral quotients and finite Weyl monodromy

This lane constructs the Lie-algebra spectral quotient and its based topology for every
connected reductive algebraic group over `ℂ`, with a specified maximal algebraic torus.
Construct it after Layers8–9 have supplied the group/root-datum and pinned root maps.
Section 11.0 supplies the group-specific smooth/holomorphic dictionary.
The finite-arrangement construction in 11B is independent of the group application
and runs once RootSystems' finite Coxeter presentation is available.

### 11.0 The group-specific analytic dictionary

For a smooth affine finite-type complex group G=Spec H, use §3A.5's classical
complex points and smooth charts. Transport its topology and atlas to native
Hopf points, preserving convolution, counit and antipode. Prove that the regular
group operations give a complex Lie group and identify its Lie algebra with
counit-valued derivations on H. The comparison takes a tangent vector to its
left-invariant derivation; with Δ=μ* it preserves brackets D*E−E*D.
At the identity e, let O_alg=H_(ker ε) and let O_hol be the local ring of
holomorphic germs in the smooth charts of §3A.5, using the native complex
smooth-sheaf stalk and its evaluation map. Finite-dimensional complex analyticity
identifies these sections with holomorphic functions. Construct the local map
O_alg→O_hol by taking the germ of a regular function, and its induced complex
linear map c:m_alg/m_alg²→m_hol/m_hol². Prove c is an isomorphism: in algebraic
étale coordinates and their induced analytic charts, both sides have basis the
classes of the coordinates minus
their values at e, and c sends each such class to itself. This is the cotangent
consequence of SGA 1 XII, Theorem 1.1, pp. 239–240; only the smooth-chart local
rings are needed here, not a general ringed analytification functor.

- API: dualizing c gives the restriction isomorphism from residue-valued
  derivations of O_hol to those of O_alg, and hence to counit-valued derivations
  of H. Its inverse on every germ f is D(f)=Σᵢvᵢ∂ᵢf(e) in smooth coordinates;
  prove independence of coordinates by the chain rule and both inverse equations.
- API: on algebraic fractions the inverse satisfies
  D(a/s)=D(a)/ε(s)−ε(a)D(s)/ε(s)² for ε(s)≠0, independently of the representative.
  This compatibility equation does not by itself define D on all holomorphic germs.
- API: the comparison is natural under homomorphisms of smooth affine finite-type
  complex groups, including faithful closed representations, and preserves the
  left-invariant bracket (Milne, Theorem 10.23 and §§10.28–10.29, pp. 193, 195–196).
  These comparisons supply the spectral charts and the corresponding oper applications.

**Checks.**

- For Gₐ, Δt=t⊗1+1⊗t and a tangent scalar v acts by v·d/dt; its bracket is 0.
  At 0, c sends [t] to [t], while [t²]=0 on both sides; with v=1 the
  inverse sends exp(t) to 1 and t² to 0. A fraction-only rule misses exp(t).
- Replacing the local coordinate t by u=2t sends tangent coefficient 1 to 2;
  for f=exp(t)=exp(u/2) the value remains 2·(1/2)=1. Rescaling the
  comparison itself by 2 would instead send [t] to 2[t] and violate its defining map.
- For Gₘ, ε(t)=1 and D(t)=1 give D(t⁻¹)=−1. Reversing the quotient-rule
  sign fails already on this unit.
- In SL₂, E=E₁₂ and F=E₂₁ give [E,F]=diag(1,−1); right-invariant vector
  fields would give the opposite sign and are excluded by the convention.

*Needs:* Layers 0–2 dictionaries and tangent spaces; §3A.5 classical complex
points, smooth charts and regular-map comparison; native augmentation cotangent
and derivation duality from the Tau Ceti supplier contract; Mathlib’s complex
smooth-sheaf stalk and evaluation; finite-dimensional holomorphic analyticity.

**11A. Plane configurations, geometric braids and their basepoints.** Construct
injective ordered complex tuples, their permutation quotient, the disc comparison,
and the finite covering and braid/permutation maps below on the native topological
and braid carriers. These supply the plane configuration interface used by arithmetic
fundamental-group applications. Use subtype topology on `PConf_n(ℂ)={z:Fin n→ℂ | Function.Injective z}` and quotient
topology on `Conf_n(ℂ)=PConf_n(ℂ)/S_n`. Transport that quotient topology when comparing to
the finite-subset carrier; no discrete topology on `Finset ℂ` is intended. Permutations act
on tuples by `(σ·z)_i=z_(σ⁻¹ i)`.

Choose an actual ordered base configuration, for example `z_i=i`, and its unordered image.
The homeomorphism `z↦z/sqrt(1+|z|²)` to the open unit disc, with inverse
`w↦w/sqrt(1−|w|²)`, induces equivariant ordered/unordered homeomorphisms. Prove their inverse,
continuity, noncollision and cover equations. Transport basepoints to a chosen disc
configuration by the resulting actual image or a specified path. Construct the based
comparison with native `TauCeti.BraidGroup n`, and restrict to native
`BraidGroup.pureSubgroup n` for ordered configurations. Prove that the induced map of the
ordered cover is the subgroup inclusion and the covering permutation is native `permHom`.

For a lifted loop, its coordinate graphs in `ℂ×[0,1]` are collision-free strands; evaluation
of such strands gives the inverse loop. Prove both constructions respect endpoint
permutations and relative homotopies. Pin multiplication: Mathlib's fundamental-group
product is `p*q=q.trans p`. Choose strand stacking to match that product and check an
explicit product of two elementary half-twists; if another stacking convention is used,
construct the time-reversal/opposite-group comparison. This roadmap pins the positive
half-twist by its own Hurwitz convention: on an ordered pair of free generators of the
punctured-disc fundamental group, the elementary half-twist acts by `(a,b)↦(aba⁻¹,a)`.
Prove that the strand model's elementary generator acts this way, inverting it first if
the chosen stacking produces the mirror rule, and prove the permutation square after that
transport. Closure and Markov equivalence are not substitutes for this based
loop/strand theorem.

**Checks for the half-twist convention.**

- The product of the generators is preserved: `aba⁻¹·a=ab`. The swap `(a,b)↦(b,a)`
  sends `ab` to `ba` and is an involution, whereas the square of the half-twist
  is conjugation by `ab`, `(a,b)↦((ab)a(ab)⁻¹,(ab)b(ab)⁻¹)`, which moves `a` in the
  free group on `a,b`; so the swap is not the half-twist. In the quotient `S₃`,
  take `a=(12)` and `b=(23)`, composing right to left: `ab=(123)` and `ba=(132)`,
  while the Hurwitz pair `((13),(12))` still has product `(123)`.
- The mirror rule `(a,b)↦(b,b⁻¹ab)` is the inverse: applied to `(aba⁻¹,a)` it returns
  `(a,b)`. The two rules differ on `a` (`aba⁻¹` against `b`), so a strand model that
  produces the mirror is detected on one generator and corrected by inversion.
- For `n=1` there is one generator and no half-twist; for `n=0` the fundamental group
  is trivial. Neither case admits a nontrivial convention choice.

Give evenly covered neighborhoods using pairwise disjoint coordinate discs and the free
finite `S_n` action, with actual covering maps. Prove the exact sequence
`1→P_n→B_n→S_n→1`. The headline `BraidMonodromy.permutation_extension_nonsplit`
states that native `TauCeti.BraidGroup.permHom n` has no group-homomorphic section
for n≥2. It is nonsplit for `n≥2`: the sign of native `permHom` is the parity of
native `ArtinGroup.exponentSum`. A homomorphic section would lift a transposition to an
order-two element, whose integer exponent sum is zero, contradicting odd parity. Prove
the sign/exponent equation on generators and extend by native homomorphism extensionality.
No generic Artin torsion-freeness theorem is needed. The quotient is trivial for `n=0,1`.
For n=2 the map is ℤ→ℤ/2; a section would send the nontrivial element to an
odd integer a with 2a=0, whereas the latter equation forces a=0. For n=3,
every proposed lift of (12) likewise has odd exponent sum, while its square
has exponent sum twice that odd integer and cannot be the identity.
Do not confuse this sequence with the pure forget-last-point sequence, which has a plane
section. Do not apply a covering theorem requiring simply connected total space to
`PConf_n(ℂ)`, which is not simply connected for `n≥2`.

**11B. The finite Weyl-arrangement theorem.** Start with a finite reduced crystallographic
real root pairing and a base, and its complexified root-hyperplane complement. Give the
chosen finite-dimensional realization, duality and real form explicitly; an identification
of a Cartan dual `𝔱*` with the Cartan requires an explicit linear-duality map.
The standard-coordinate comparison consumes native `rootPairingBaseChange` with its actual
dot-product and faithful scalar-extension hypotheses. Prove basis/dual-basis transport
from arbitrary finite-dimensional real realizations to that model and independence of the
chosen coordinates. Retain a `W`-fixed central vector summand in nonessential realizations.
Write `V_reg={v∈V_ℂ | α(v)≠0 for every root α}`, `B_W=V_reg/W`; construct the actual action,
quotient topology and quotient morphisms. Root and coroot spaces use their native dual
representations: `weylGroupRootRep` is a `W`-representation, whereas
`weylGroupCorootRep` is a `W.op`-representation.

Prove nonemptiness and path connectedness of the complex complement and the freeness of
`W` on it. For freeness, a `w` fixing `x+iy` fixes both real vectors. Some real linear
combination `x+c y` avoids every root hyperplane, since each root is nonzero on at least one
of `x,y`; finite real chamber freeness then gives `w=1`. Construct the finite covering
`V_reg→B_W` and local charts, with their transition permutations.

Build the finite face/chamber Salvetti model and its equivariant comparison with the
complex complement (Ernst, *Cell Complexes for Arrangements with Group Actions*,
arXiv:0905.4434v1, Definition 5.1, pp. 27–28, Theorem 5.11 and its proof,
pp. 32–35, and Theorem 6.1, p. 41): specify its cells by real arrangement faces with incident chambers,
construct a good open-star cover and its contractible intersections, and prove the
homotopy or sufficient two-skeleton comparison using the based van Kampen and CW-cell
interfaces of [AlgebraicTopology Stages 1 and 4](../AlgebraicTopology/README.md). Construct
maps from the realization of the Salvetti complex to V_reg and back, together
with W-equivariant homotopies of both composites to the identity; these induce
the quotient comparison. Apply the essential-arrangement construction on the
root span and contract the W-fixed central vector summand separately.
In the quotient, prove
there is one vertex, one oriented one-cell for each simple wall and exactly the rank-two
alternating-word relations of length `m_ij`. Both generation and completeness of the
relations are targets (Ernst, Theorem 6.10, p. 46). This gives a generator-characterized based isomorphism
`π₁(B_W,[b]) ≃ TauCeti.ArtinGroup (coxeterMatrixOfBase P base)` at a specified chamber point,
with explicit basepoint-change transport for any other basepoint.

- Changing the chosen chamber point transports each fundamental group by a
  specified path and commutes with the covering homomorphism; changing that
  path changes the identification by the corresponding inner automorphism.
- A product of root pairings gives a product of complements, quotient spaces
  and Salvetti homotopy types. A W-fixed complex vector summand contracts
  equivariantly and contributes no fundamental group.
- The reflection-wall loop downstairs has a lift joining b to its simple
  reflection; its image in W is that reflection. Squares lie in the pure
  kernel, and the inclusion of that kernel is induced by V_reg→B_W.

**Checks for the complement and covering.**

- With no roots in ℝᵈ, V_reg=ℂᵈ and W=1; both fundamental groups are
  zero and the covering degree is 1. At d=0 the complement has one point,
  not zero points.
- In A₁, V_reg=ℂˣ, the quotient coordinate is u=z², and the covering
  has degree 2. The loop u(t)=exp(2πit) lifts from 1 to −1 via exp(πit);
  on fundamental groups the covering sends 1 to 2.
- In A₁×A₁, the covering is (z,w)↦(z²,w²), of degree 4; its map on
  fundamental groups ℤ²→ℤ² is (a,b)↦(2a,2b). Adding a central ℂ
  factor leaves degree 4 and fundamental group ℤ², not ℤ³.

**Checks for the Salvetti comparison and presentation.**

- The rank-zero model is a point, with one vertex and no edges; its
  fundamental group is zero, agreeing with the empty-root complement.
- The A₁ model before quotient has two vertices and two edges, hence
  fundamental group ℤ. Its W-quotient has one vertex and one loop;
  the two-edge cycle upstairs traverses the quotient loop twice.
- For A₁×A₁ the quotient two-skeleton has one vertex, two edges and
  one square, with relation ab=ba and fundamental group ℤ². For A₂
  the attaching word instead gives aba=bab; for B₂ it gives
  abab=baba and for G₂ ababab=bababa, of lengths 3, 4 and 6 on
  each side. Replacing every rank-two face by an A₂ hexagon fails
  the B₂ and G₂ checks.

*Needs:* RootSystems Layers 2 and 4 for the finite Coxeter and chamber
structure; AlgebraicTopology Stages 1 and 4 for CW realization and the
van Kampen theorem; the native homotopy equivalences, finite covering and
fundamental-group maps.
The central-factor contraction uses scalar multiplication on a vector space.

Consume [RootSystems Layer2](../RepresentationTheory/RootSystems/README.md)'s
`weylCoxeterSystem`, with its exact spanning/reduced/characteristic-zero hypotheses and
coordinate transports. Native `weylCoxeterHom` supplies the map and surjectivity, but its
injectivity remains that lower written target. The Artin-to-W map is the native
`ArtinGroup.toCoxeterGroup` followed by the actual Weyl identification, not a private
presentation of a new group. Prove the geometric covering square, reflection-generator
normalization, and identify `π₁(V_reg,b)` with its kernel. Outside type A this is the pure
finite-type Artin group, not an ordinary `BraidGroup.pureSubgroup n`.

Include reducible products, exceptional types and the actual matrices with entries4 and6.
The empty-root case is a contractible central vector space with trivial groups. Rank1 is
`ℂ*` with sign quotient and square cover. Type A agrees with 11A. B and C share the Weyl
arrangement, but retain their different root data. This lane asserts finite real Weyl
arrangements; it commissions no affine, infinite-type or general complex-reflection
asphericity statement.

**11C. Algebraic invariant quotient and the discriminant base.** For the stated complex
reductive `G,T`, use Layer2's actual tangent Lie algebra `𝔤`, torus Lie subalgebra `𝔱`, root
spaces and adjoint action. Prove that the Lie-algebra regular-semisimple locus consists
of the conjugates of `𝔱_reg`, that its centralizer is the conjugate torus, and that
intersections with `𝔱_reg` are exactly `W`-orbits. Regular alone is insufficient: the
centralizer of a regular nilpotent in `GL₂` is `ℂ*×ℂ`, not a torus. Keep this locus
separate from regular semisimple **group elements**, whose root hypertori lead to a
different toric arrangement.

Construct `χ:𝔤→Spec ℂ[𝔤]^G` and the restriction isomorphism
`ℂ[𝔤]^G ≃ ℂ[𝔱]^W`, with actual polynomial restriction maps. First construct the canonical
characteristic-zero splitting `𝔤=𝔷(𝔤)⊕[𝔤,𝔤]` and the corresponding symmetric-algebra tensor
isomorphism. Apply [LieHighestWeight Layer7](../RepresentationTheory/LieHighestWeight/README.md)'s
Lie Chevalley restriction only to the Killing-semisimple summand, at its actual hypotheses;
the Killing form of all `𝔤` need not be nondegenerate. Prove the infinitesimal-to-group
invariant comparison in each finite homogeneous rational subrepresentation: connectedness,
root-subgroup exponentials and torus weights in characteristic zero show Lie-fixed equals
`G`-fixed. Prove central invariants factor because the group action on `𝔷(𝔤)` is trivial.
Consume the finite-W invariant-algebra and quotient construction of
[ReflectionInvariantTheory](../ReflectionInvariantTheory/README.md), retaining degree-one
central coordinates, to obtain the actual affine quotient and its discriminant complement.
No canonical choice of polynomial invariant generators is asserted.

The base is the image of `𝔱_reg` in `𝔱/W`, the **discriminant complement**. It is not the
smooth locus of the full invariant quotient, which is already an affine space in this
setting. Construct all scheme morphisms before comparing their complex points via §§3A.5 and 11.0. Prove the coarse orbit-space homeomorphism
`𝔤_rs/G ≃ₜ 𝔱_reg/W`. This is a coarse quotient; the stack `[𝔤_rs/G]` retains torus inertia.

**Checks for 11C.**

- For `𝔤𝔩₂`, `ℂ[𝔤]^G=ℂ[tr,det]` restricts to `ℂ[t₁+t₂,t₁t₂]=ℂ[𝔱]^(S₂)`; the splitting is
  `𝔤𝔩₂=ℂ·I⊕𝔰𝔩₂` with `tr` the degree-one central coordinate, and the discriminant is
  `tr²−4det=(t₁−t₂)²`.
- The regular nilpotent `[[0,1],[0,0]]` has `χ=(0,0)`, the value at `0`, lies over the
  discriminant locus and is not in `𝔤_rs`; its centralizer `{[[x,y],[0,x]]}` is
  `ℂ*×ℂ`. The element `diag(1,2)` has `χ=(3,2)`, discriminant `1≠0`, and centralizer
  `T`.
- `𝔱/W` for `𝔤𝔩₂` is `𝔸²`, smooth everywhere, and the base is the proper open subset
  `tr²−4det≠0`; for a torus `G=T`, `W=1`, `𝔤_rs=𝔤`, `χ` is the identity and the base
  is all of `𝔱`.

**11D. Cameral product, local trivializations and homogeneous fiber.** Construct the
pullback `E={(x,t)∈𝔤_rs×𝔱_reg | χ(x)=[t]}` and the map
`(G/T)×𝔱_reg→E`, `([g],t)↦(Ad_g(t),t)`. Prove that it is an algebraic isomorphism and a
homeomorphism/holomorphic isomorphism on complex points, including the coset-valued inverse.
The right `W` action is `([g],t)·w=([g n_w],w⁻¹t)` for a representative `n_w∈N_G(T)`.
Prove independence of representatives and the action law: the multiplication defect lies
in `T` and vanishes in `G/T`. No homomorphic splitting of `N_G(T)→W` is assumed; already
in compact `SU₂`, a nontrivial Weyl lift can have order4.

Prove `𝔤_rs ≃ ((G/T)×𝔱_reg)/W` through `[g,t]↦Ad_g(t)`, with the algebraic descent and
complex quotient topologies explicitly compared. A local section of the finite W-cover
trivializes `χ_rs:𝔤_rs→𝔱_reg/W` with fiber `G/T`. Supply actual inverse maps and transition
functions, continuity, and holomorphicity. The root-coordinate differential is
`(X mod 𝔱,Y)↦[X,t]+Y`; prove it is an isomorphism and apply §3A.5’s analytic inverse theorem through §11.0’s tangent comparison. A set-theoretic orbit bijection alone does not prove these statements.
For SL₂ at t=H=diag(1,−1), the E₁₂, E₂₁ and H coordinates of this
map have coefficients −2, 2 and 1, so its determinant is −4≠0 over ℂ;
reversing [X,t] to [t,X] gives the wrong two root signs.

Construct `G/T→G/B` as a locally trivial bundle with contractible fiber `B/T≃U`, using
Layer7's ordered root coordinates. Consume the actual flag CW structure with only even
real-dimensional cells from [LieGroups Layer8](../RepresentationTheory/LieGroups/README.md). Prove connectedness
and `π₁(G/T)=0` through that bundle and the based LES. This includes arbitrary connected
complex reductive global forms; it does not assume `G` is simply connected, or infer a
topological theorem merely from algebraic simple connectedness. Use
[SmoothBundlesConnections B1.4](../SmoothBundlesConnections/README.md)'s actual closed-subgroup
quotient and principal projection when changing analytic models.

Apply [DGFloer Layer1.2](../DGFloer/README.md)'s based fiber sequence to the actual spectral
projection and chosen `x₀=Ad₁(t₀)`. Retain the terms
`π₂(B_W)→π₁(G/T)→π₁(𝔤_rs)→π₁(B_W)→π₀(G/T)` and their basepoints. The middle map induced
by `χ_rs` is an isomorphism because the fiber is connected and simply connected. No
vanishing of `π₂(B_W)` is needed. The generic bundle/LES supplier must construct the connecting maps and prove exactness;
a Serre-fibration lifting predicate alone does not supply those theorems.

**Checks for 11D.**

- In `SL₂` with `t=H=diag(1,−1)` and `n_w=[[0,1],[−1,0]]`: the points `([1],H)` and
  `([n_w],−H)=([1],H)·w` have the same image `H` in `𝔤_rs` and the distinct images
  `(H,H)` and `(H,−H)` in `E`, as the fiber of `E→𝔤_rs` over `H` is the `W`-orbit
  `{H,−H}`. Since `n_w²=−1∈T`, `([g],t)·w·w=([g],t)` in `(G/T)×𝔱_reg` although the
  lift has order 4.
- The action uses `w⁻¹t`, not `wt`: invariance of `[g,t]↦Ad_g(t)` needs
  `Ad_(gn_w)(w⁻¹t)=Ad_g(t)`. With `wt` instead one gets `Ad_g(w²t)`, which for `A₂`,
  `w=s₁s₂` of order 3 and generic `t` differs from `Ad_g(t)`; the error is invisible in
  `A₁`, where `w=w⁻¹`.
- For `SL₂`, `G/B=ℙ¹` and `π₁(G/T)=0`; `B_W=ℂ*` has `π₁=ℤ`, so `π₁(𝔤_rs)≅ℤ`, matching
  the two-strand braid group of 11E. For `PGL₂` the variety `G/T` is the same and is
  simply connected although `π₁(PGL₂(ℂ))=ℤ/2`: the statement concerns `G/T`, not `G`.

**11E. Matrices, trace-zero centering and boundary cases.** Use native `Matrix.charpoly`,
its diagonal and conjugation equations and the actual trace-zero special-linear Lie
subalgebra. The maps are `A↦charpoly A`, `z↦∏_i(X−z_i)` and `z↦diagonal z`; prove the
regular-semisimple/separable-polynomial and distinct-configuration comparisons with actual
inverses. For GL_n versus SL_n conjugacy, determinant-normalize an invertible conjugator
by a diagonal centralizer element; no nth-root choice is required. Local simple-root
branches and spectral projectors `P_i(A)=∏_(j≠i)(A−λ_j I)/(λ_i−λ_j)` give the type-A
trivialization. Prove their idempotence, orthogonality, rank1, completeness and local frame
maps at precisely the simple-spectrum hypothesis.

For `n>0`, centroid `c(z)=n⁻¹∑_i z_i` gives equivariant inverse maps
`z↦(c(z),(z_i−c(z))_i)` and `(c,w)↦(w_i+c)_i`. Prove the ordered homeomorphism
`PConf_n(ℂ)≃ₜℂ×PConf_n^0(ℂ)`, its descent to unordered configurations and all cover/basepoint
squares. The contractible central factor induces the SL_n/GL_n configuration π₁ comparison.
For `n=0`, both configuration spaces are points and no reciprocal0 is used. For `n=1`,
centered configurations and `𝔰𝔩₁` are points, while the uncentered spaces are `ℂ`. For
`n=2`, identify centered ordered configurations with `ℂ*` via `(z,−z)`, unordered projection
with `z↦z²`, and match native `B₂≃ℤ`, its sign quotient and the square-generated pure subgroup.


**Checks for 11E.**

- For `A=diag(1,2)`, `charpoly A=(X−1)(X−2)`, `P₁=(A−2I)/(1−2)=diag(1,0)` and
  `P₂=diag(0,1)`: idempotent, orthogonal, of rank 1, summing to `I`. For `A=diag(1,1)`
  the denominator `λ₁−λ₂` vanishes, so the simple-spectrum hypothesis is used.
- Centering at `n=2`: `(1,3)↦(2,(−1,1))`, with inverse by addition; centered ordered
  configurations are the pairs `(z,−z)`, `z∈ℂ*`, the unordered projection is `z↦z²`,
  and on `π₁` it is `ℤ→ℤ`, `1↦2`: the pure subgroup of `B₂≅ℤ` is `2ℤ`, of index 2,
  with `permHom` the sign. For `n=0` there is one configuration and no `ℂ` factor;
  for `n=1`, `PConf₁(ℂ)=ℂ`, the centered space is a point and `𝔰𝔩₁=0`.
- Determinant normalization: `g=diag(2,1)` centralizes `A=diag(1,2)` and has
  determinant 2; multiplying by the centralizing element `diag(1/2,1)` gives a
  conjugator of determinant 1 without extracting a root.

**11F. Root-system and root-datum local systems.** Construct the associated locally
constant family `(𝔱_reg×Φ)/W` with its discrete root fiber, actual roots/coroots, pairing,
reflection and root-addition data. Also associate the full `X,Y` lattices and their perfect
pairing; do not replace them by the root/coroot lattices. Trivialize on finite-cover charts,
prove transition and descent equations, and pull back by `χ_rs` to compare with the roots
of the actual centralizer Cartan through `Ad_g`, independent of all representatives.

Pin the direction of monodromy. For the left deck action, native
`IsQuotientCoveringMap.fundamentalGroupToMulOpposite` lands in `W.op`. If the based lift ends
at `w·t₀`, composing with inverse/opposite gives ordinary W-valued monodromy `w⁻¹`; associated
root transport is `α↦w⁻¹α`. Prove concatenation and half-twist equations before comparing
with the Artin-to-W map. State the inverse/transpose transport on coroots so the pairing is
preserved; never silently erase native `.op`. Central isogenies transport the Lie algebra,
flags and essential arrangement through actual differential/quotient maps but need not
identify full character/cocharacter lattices. Central torus **Lie** summands are complex
vector spaces, and contribute no extra π₁.

**Checks for 11F.**

- In `A₁`, the loop `u(θ)=e^(iθ)` in `𝔱_reg/W` (coordinate `u=z²`) lifts from `H` to
  `−H`; the left deck monodromy lands in `W.op`, the ordinary `W`-valued monodromy is
  `w⁻¹=w`, the nontrivial element, and the transport is `α↦−α`, `α∨↦−α∨`, with the
  pairing `⟨−α,−α∨⟩=2` preserved. A trivial local system is excluded because the
  cover `z↦z²` is connected.
- In `A₂`, transporting roots by `w=s₁` but coroots by the identity breaks the
  pairing: `⟨s₁α₂,α₂∨⟩=⟨α₁+α₂,α₂∨⟩=−1+2=1≠2`, whereas transporting both by the same
  `w` gives `2`.
- The central isogeny `SL₂→PGL₂` identifies the Lie algebras, `𝔱_reg` and the
  arrangement, while the character lattices `ℤϖ⊋ℤα` differ. For `𝔤𝔩₂=ℂ·I⊕𝔰𝔩₂` the
  regular-semisimple locus is `ℂ×(𝔰𝔩₂)_rs`, so the central summand contributes no
  `π₁`, and `π₁((𝔤𝔩₂)_rs)≅ℤ` agrees with the two-strand configuration space of 11E.

**11G. Prerequisite and scope comparisons.** The order is §11A's configuration/native
braid contract and RootSystems' Coxeter/chamber theory → finite arrangement topology;
independent Layers 8–9 and §§3A.5/11.0 → 11C invariant/spectral maps; Layer 7 and
LieGroups Layer 8 flag cells → homogeneous-fiber connectedness and simple connectedness;
the based DGFloer Layer 1.2 fiber sequence → the `χ_rs`-induced π₁ isomorphism; finite
cover → actual root-datum monodromy. LieHighestWeight Layer 7 Lie invariants and
ReflectionInvariantTheory finite invariants enter 11C with the explicit comparisons
stated there. No edge
returns to those lower targets. This constructs Lie-algebra regular-semisimple topology
over `ℂ`; it does not assert the corresponding statements for group-element toric
arrangements, disconnected groups, bad characteristic, compact-normalizer splittings,
infinite or affine Weyl arrangements, or arbitrary complex reflection groups. Their
carriers and hypotheses are different. In particular a list of all braid lengths3 is
not the full B3 presentation, whose short/long pair has length4.

References for these constructions include Brieskorn's finite-reflection-complement
presentation, Salvetti's face/chamber model, and the based covering and van Kampen
contracts cited above. The arrangement presentation and all comparison maps remain
construction targets until proved; references are not replacements for those proofs.

### Examples

For A₁ the regular Cartan is ℂˣ and its Weyl quotient is z↦z². A positive loop downstairs interchanges the two square-root lifts.

### Dependencies

*Needs:* Layers 0–2 and 8–9; §11.0 analytic dictionary; §11A configurations; the finite Coxeter and topological suppliers named in §§11B–11G.

## Worked examples

Concrete Hopf algebras / group schemes that exercise and validate the definitions:
`𝔾_a`, `𝔾_m`, `μ_n`/`μ_p`, `GLₙ`, `SLₙ`, `PGLₙ`, `SOₙ`, `Sp₂ₙ`, and tori. Prove they are
reductive where applicable via `R_u = 1` / root data (the definition that works in all
characteristics), and *additionally* via complete reducibility only in characteristic 0
or for linearly reductive groups. Exercise the diagonalizable/Cartier-duality theory on
the multiplicative-type examples. Use `GLₙ` as a test case for the general theory, not as its
source.

For every n≥0 consume native `TauCeti.SpecialLinear.coordinateHopfAlgebra ℤ n`
and `coordinateMap` from `TauCeti.Algebra.AlgebraicGroup.SpecialLinear.Basic`.
Its determinant-kernel quotient of the native GL coordinate Hopf algebra
is the single SL carrier. Construct the explicit algebra presentation
`O(SL_n)≃ₐ[ℤ]ℤ[x_ij | i,j∈Fin n]/(det(X)−1)` by removing the redundant
determinant localization, with both maps and generator equations.
On the native images x_ij of GL's matrix coordinates prove
`Δ(x_ij)=Σ_k x_ik⊗x_kj`, `ε(x_ij)=δ_ij` and
`S(x_ij)=adjugate(X)_ij`, consuming native Hopf laws and determinant-one
identities. Consume `SpecialLinear.pointsMulEquiv`, `pointsNatIso` and
`pointsMulEquiv_mapValue` to identify ℤ-algebra maps to every commutative
ring A with native `Matrix.SpecialLinearGroup (Fin n) A`. Export the
explicit generator/convolution equations and naturality squares: multiplication
is matrix multiplication, counit is the identity and antipode is inversion.
For n≥1 compare with9B at `SpecialLinear.diagonalRootDatum (n−1)`,
identifying X with ℤ^n/ℤ(1,…,1), simple roots ε_i−ε_(i+1) and pinned
root maps `x_(ε_i−ε_j)(a)=I+aE_ij`. In9B.2 take the standard representation,
whose weights span all of X, and compare the two defining Hopf ideals in
native O(GL_n); construct the pinned isomorphism, compatible with9B.3's
based-datum comparison. Check field root-generation against native
transvection reduction. Include n=0 and n=1 as the trivial-group cases;
for n=1 the datum has X=0.

## Mathematical conventions for applications

- The functor of points is the notion of points, not `GroupLike` and not only `k`-points.
- A faithful representation is a closed immersion; on coordinate rings this requires the
  matrix coefficients together with the determinant inverse, equivalently the coefficients
  of `V ⊕ Vˇ`, to generate `A`.
- Geometric notions (connectedness, unipotence, reductivity) are defined after base change
  to `k̄`.
- Keep typeclass hypotheses separate; admit non-smooth and non-reduced groups such as `μ_p`,
  and make smoothness explicit where required.
- Keep the Hopf-algebra, group-object, and functor-of-points views synchronized by explicit
  equivalences, as well as the representation–comodule dictionary.
- Kevin Buzzard's example-design caution: use `GLₙ` to test the general theory, not as its
  source.

## Downstream consumers

The downstream consumers include p-adic representation theory of `G(K)` (smooth and
admissible representations, Hecke algebras; Shurui Liu and others), the Langlands programme,
automorphic forms (Kevin Buzzard), and FLT. The dynamic parabolic API and BN-pair results
are useful interfaces for p-adic consumers before the full root-data classification exists.

The finite groups of Lie type consume Layer 9 through fixed points of Steinberg endomorphisms
on the points of pinned Chevalley–Demazure groups, or on explicit carriers identified with
those points. Their CFSG milestone L5 needs constructions rather than existence theorems.

## References

- I. V. Arzhantsev, *Invariant Ideals and Matsushima’s Criterion*,
  arXiv:math/0506430v1 (2005), Proposition 2.2, p. 2: reductive coset affineness.
- M. Fang, K. J. Lim, K. M. Tan, *Jantzen filtration of Weyl modules, product
  of Young symmetrizers and denominator of Young’s seminormal basis*,
  arXiv:1904.13040v2 (2020), §2.1, pp. 2–3: integral Weyl lattices and forms.
- D. C. Ernst, *Cell Complexes for Arrangements with Group Actions*,
  revised M.S. thesis, arXiv:0905.4434v1 (2009), Definition 5.1,
  pp. 27–28, Theorem 5.11, pp. 32–35, Theorem 6.1, p. 41, and
  Theorem 6.10, p. 46: the Salvetti and finite reflection-quotient comparisons.
- E. Brieskorn, *Die Fundamentalgruppe des Raumes der regulären Orbits einer
  endlichen komplexen Spiegelungsgruppe*, Invent. Math. 12 (1971), 57–61: the
  finite-reflection-complement presentation that Ernst's Theorem 6.10 states
  without proof (Ernst cites Brieskorn's survey *Sur les groupes de tresses*,
  Séminaire Bourbaki 1971/72, exposé 401, LNM 317 (1973)).

- A. Grothendieck et al., *Revêtements étales et groupe fondamental* (SGA 1),
  retyped edition, arXiv:math/0206203v2, Exposé XII by M. Raynaud, §§1–3,
  pp. 239–247: complex points, charts and properness.
- J.-P. Serre, *Géométrie algébrique et géométrie analytique* (1956),
  §2 no. 5, pp. 8–9: the classical topology and regular maps.
- J. S. Milne, *Algebraic Groups* (2017): a scheme-theoretic reference.
- W. C. Waterhouse, *Introduction to Affine Group Schemes*: Hopf algebras, comodules,
  closed subgroups, the unipotent radical.
- A. Borel, *Linear Algebraic Groups*; T. A. Springer, *Linear Algebraic Groups*.
- J. C. Jantzen, *Representations of Algebraic Groups I*, MPIM preprint 1985 (9):
  §1.1 uses this edition's I.3.3–I.3.9 and I.4.14–I.4.16, pp. 53–60, 77–79a.
- J. E. Humphreys, *Introduction to Lie Algebras and Representation Theory* (1972),
  §26: integral enveloping forms and PBW; central toral directions are treated in §9A here.
- B. Conrad, *Reductive Group Schemes* (SGA3 exposition); **SGA3**, Exposé XIX.
- B. Conrad, O. Gabber, G. Prasad, *Pseudo-reductive Groups* (relative theory).


## Discussion references

- [Algebraic groups discussion on Lean Zulip](https://leanprover.zulipchat.com/#narrow/channel/217875-Is%20there%20code%20for%20X%3F/topic/Algebraic%20groups): Hopf algebras, affine group schemes and convolution points.
- [Class and definition discussion for p-adic representations](https://leanprover.zulipchat.com/#narrow/channel/116395-maths/topic/class%20and%20def%20%28p-adic%20reps%29): separate hypotheses, dynamic parabolics and BN-pair interfaces.

## Acknowledgements

This roadmap builds directly on earlier discussions on the [Lean Zulip](https://leanprover.zulipchat.com/). In particular, Kevin Buzzard's guidance informs the separate typeclass hypotheses, Layer 0 interface statements, and use of GLn as a test example rather than as the source of the general theory:

- [#Is there code for X? > Algebraic groups](https://leanprover.zulipchat.com/#narrow/channel/217875-Is%20there%20code%20for%20X%3F/topic/Algebraic%20groups)
  (Michael Rothgang, Bryan Gin-ge Chen, Yaël Dillies), on the Hopf/group-scheme dictionary
  and the convolution-product work in mathlib4#39281.
- [#maths > class and def (p-adic reps)](https://leanprover.zulipchat.com/#narrow/channel/116395-maths/topic/class%20and%20def%20%28p-adic%20reps%29)
  (Kevin Buzzard, Shurui Liu, Stepan Nesterov), on dynamic parabolics, BN-pairs, and
  downstream p-adic representation consumers.

Thanks to everyone who contributed to those discussions and to the recurring guidance on
keeping typeclass assumptions separate.

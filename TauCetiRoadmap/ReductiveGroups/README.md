# Roadmap: reductive algebraic groups

**Summary.** Build the general theory of reductive algebraic groups from native
Hopf algebras, schemes and comodules: orbit geometry, structure and classification,
pinned integral groups, rational highest weights, and regular-semisimple spectral
monodromy. The library includes nonsmooth finite-type groups where appropriate and
retains every characteristic in its integral and reductive structure theorems.

## Scope and ownership

This roadmap owns the algebraic-group dictionaries, general orbit geometry, the
structure and classification targets, and the integral, representation-theoretic
and spectral constructions in Layers 0–11. The SL polynomial presentation concerns
the existing determinant-kernel coordinate algebra; it introduces no second SL group.
Layer 7a owns Lang's theorem for the `q`-Frobenius of a smooth geometrically connected
group over a finite field and the abstract fixed-coset lifting lemma; Layer 7g owns their
Steinberg-endomorphism extension. Layer 1.1 owns rational cohomology and cotensor induction
over flat commutative Hopf algebras and their field/group-scheme adapters.
Layer 3A.5 owns the classical topology and smooth complex-manifold
charts on complex points, with the separated and proper topological comparisons, and
the group/tangent dictionary, algebraic orbit smoothness and the holomorphic orbit-map
and stabilizer comparison on that carrier; Layer 11 consumes these comparisons. Layer 11A owns the based comparison between the fundamental
group of the plane configuration space and the native braid group. Layer 9B owns the
special isogenies in characteristics two and three and the three explicit toral-closure
carriers it specifies. ReductiveGroupsPartII extends this roadmap and consumes it;
nothing here is imported from it.

Generic fpqc descent of quasi-coherent modules and sheaves belongs to
SchemeAndStackFoundations §1.1; its §§1.5, 1.13–1.15 supply quotient sheaves,
group spaces and torsors. ModularCurves §§0E–0F supply effective affine descent
and finite-locally-free affine Weil restriction. This roadmap owns the comparisons
with Hopf/points carriers and group-specific representability statements, not those
foundations. The generic isometry subgroup is `TauCeti.BilinForm.isometryGroup`;
Layer 9A specializes it to the ADE lattice and constructs the new lift action.
The generic finite-index induction dimension formula is `TauCeti.finrank_indFDRep`;
Layer 7c uses its complex specialization.

The embedding theorem and the matrix-coefficient criterion for faithfulness of a
finite-dimensional comodule, the fppf homogeneous quotient sheaf of an affine group by a
closed subgroup, and the implication from linear reductivity of the geometric fibre to
reductivity are proved in the pinned Tau Ceti; they are consumed in the supplier contracts
below and are not targets. The relative Hopf reductivity predicate, its isomorphism
invariance and arbitrary base change, and the diagonalizable group-scheme anti-equivalence
are also supplied by Tau Ceti; Layers 4 and 9D retain their additional comparisons.

Suggested.lean is the acceptance module: it states the headline theorems that are statable
at the pins. The native affine Hopf dictionary, point functors and comodule reconstruction
are supplied interfaces, as specified below.

The marker `⚠` identifies a common mathematical trap, followed immediately by its correction.

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
  and the cartesian/`Over` variants, so view 2 is expressible.
- **Algebra categories:** `Mathlib/Algebra/Category/CoalgCat/ComonEquivalence.lean`
  (coalgebras ≃ comonoids), `Mathlib/Algebra/Category/CommAlgCat/{Basic,FiniteType,Monoidal}.lean`.
- **Scheme-side group theory:** `Mathlib/AlgebraicGeometry/Group/Abelian.lean` (the
  rigidity theorem
  `AlgebraicGeometry.isCommMonObj_of_isProper_of_geometricallyIntegral`:
  a proper, geometrically integral group scheme over a field is commutative;
  both hypotheses concern the structural morphism to that field) and `…/Group/Smooth.lean`.
- **Affine group schemes and Hopf algebras:** `Mathlib/AlgebraicGeometry/Group/Affine.lean`
  provides `hopfSpec.fullyFaithful` and `essImage_hopfSpec` for affine group schemes over
  `Spec R`; use this dictionary for the corresponding Layer 0 targets.
- **Smoothness ingredient:** `Mathlib/RingTheory/Nilpotent/GeometricallyReduced.lean`.
- **Combinatorial prerequisites** (not ready-made algebraic-group infrastructure; they
  supply abstract root systems/Weyl groups; extracting a *root datum from a group* still
  needs substantial glue): `Mathlib/LinearAlgebra/RootSystem/*` (root pairings, bases,
  Cartan matrices) and `Mathlib/GroupTheory/Coxeter/*`.
- **Representation theory to mine for patterns** (finite-group / module flavour; it does
  *not* generalize directly without building comodules and rational representations first):
  `Mathlib/RepresentationTheory/{FDRep,Character,Tannaka,Maschke,Semisimple,Irreducible}.lean`.

### From Tau Ceti

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
  field. The remaining Layer 1 targets are the rational-representation/comodule dictionary
  and the Tannakian transport.
- **Embedding theorem and faithfulness.**
  `TauCeti/Algebra/AlgebraicGroup/Representation/Embedding.lean` proves
  `TauCeti.Comodule.exists_coordinateBialgHom_surjective`: for a field `k` and a commutative
  Hopf `k`-algebra `H` of finite type, in independent universes, the regular comodule has a
  finite-dimensional subcomodule with a basis whose coordinate bialgebra map `O(GLₙ) → H` is
  surjective; `TauCeti.Comodule.exists_isClosedImmersion_coordinateGroupSchemeHom` restates
  this, with `k` and `H` in one universe, as a closed immersion of the represented group
  scheme into `GLₙ`; and `TauCeti.AffineGroupSchemeCat.exists_isClosedImmersion_generalLinear`
  gives, for an affine group scheme over `Spec k` with locally finite type structure
  morphism, a closed immersion into `GeneralLinear.groupScheme k n` for some `n`.
  `Representation/Faithful/Basic.lean` defines `TauCeti.Comodule.IsFaithful` (some finite
  basis makes the coordinate group-scheme morphism a closed immersion; `k`, `H` and the
  comodule in one universe) and proves
  `coordinateBialgHom_surjective_iff_matrixCoefficientSubalgebra_sup_antipode_eq_top`
  (over any commutative ring, `O(GLₙ) → H` is surjective exactly when the matrix coefficients
  together with their antipode images generate `H`),
  `isClosedImmersion_coordinateGroupSchemeHom_iff_of_bases` (independence of the basis) and
  `isFaithful_iff_matrixCoefficientSubalgebra_prod_dual_eq_top` (faithfulness exactly when
  the coefficients of `V ⊕ Vˇ` generate `H`). These are consumed; Layer 1 restates none of
  them.
  [`TauCeti.Tannaka.pointsFunctorIsoTensorAutFunctor`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/GroupFunctor.lean) already reconstructs the points
  functor of a commutative Hopf algebra over a field from tensor automorphisms, with
  its explicit universe lift. Layer1 transports this natural isomorphism through the
  representation/comodule and scheme/group-functor dictionaries.
- Tau Ceti `Borel.Basic` and `Reductive.Basic` provide predicates on finite-type
  commutative Hopf algebras. `TauCeti.reductiveCommHopfAlgProperty k H`, for
  `H : FiniteTypeCommHopfAlgCat.{u, u} k`, means: `H` is smooth and geometrically connected,
  and every normal Hopf ideal of the base change to an algebraic closure whose quotient is
  geometrically connected, smooth and unipotent is the augmentation ideal.
  `TauCeti.HopfIdeal.IsBorelOverAlgClosed k H I` means that `k` is algebraically closed and
  `I` is minimal, in the contravariant Hopf-ideal order, among Hopf ideals whose quotient is
  smooth, geometrically connected and geometrically solvable; `TauCeti.HopfIdeal.conjugate I g`
  (`HopfIdeal/Conjugation.lean`) is the Hopf ideal of the conjugate `gKg⁻¹` of the subgroup
  `K` cut out by `I` by the rational point `g : WithConv (H →ₐ[k] k)`. `Borel/Conjugation.lean`
  proves conjugacy of Borel subgroups only under the hypothesis that every Borel subgroup
  conjugates into a given candidate (`exists_conjugate_eq_of_isBorelOverAlgClosed`); the
  unconditional theorem is Layer 7's target. `Reductive/LinearlyReductive.lean` proves
  `TauCeti.reductiveCommHopfAlgProperty.of_smooth_of_geometricallyConnected_of_baseChange_linearlyReductive`:
  a smooth, geometrically connected finite-type Hopf algebra whose base change to an algebraic
  closure is linearly reductive (`TauCeti.linearlyReductiveCommHopfAlgProperty`, every
  finite-dimensional comodule with carrier in the base universe is completely reducible) is
  reductive; the characteristic-zero converse is Layer 6's target. The dynamic modules
  provide cocharacter-defined parabolic,
  Levi, unipotent point subgroups and a pointwise Levi decomposition. Their documentation
  does not establish representability of arbitrary dynamic subfunctors or the algebraic
  intersection/transporter results below. `Frobenius.Points` and `Frobenius.FixedPoints`
  provide pointwise Frobenius maps and fixed-point comparisons; they do not prove finiteness
  for every endomorphism or Lang–Steinberg.
- Mathlib's root-system and Coxeter modules provide abstract combinatorial structures.
  Tau Ceti has concrete torus, GL, SL, and symplectic root-data carriers. These are
  reusable instances, not general root extraction or classification.

- **Relative reductivity.** `TauCeti/Algebra/AlgebraicGroup/Reductive/Over.lean`
  supplies `TauCeti.reductiveCommHopfAlgPropertyOver`, its
  `ObjectProperty.IsClosedUnderIsomorphisms` instance and
  `TauCeti.reductiveCommHopfAlgPropertyOver.baseChange`. Over any commutative ring R,
  in one universe, this means smoothness and reductivity of every algebraically closed
  geometric fibre of a finite-type commutative Hopf algebra. No reducedness or Noetherian
  hypothesis on R is imposed. Consume it also for ℤ → 𝔽₂ and ℤ → ℤ[ε]/(ε²).
- **Diagonalizable schemes.** `TauCeti/Algebra/AlgebraicGroup/DiagonalizableGroup/Equivalence.lean`
  supplies `TauCeti.DiagonalizableGroup.DiagonalizableGroupSchemeCat`,
  `TauCeti.DiagonalizableGroup.schemeEquivalence` and
  `TauCeti.DiagonalizableGroup.schemeEquivalence.functorCompιIso` over every field k,
  with finitely generated commutative groups in k's universe. The last isomorphism
  identifies the equivalence's forward functor, followed by inclusion, with the existing
  group-scheme functor M ↦ Spec k[M]. This includes nonreduced diagonalizable schemes.

- **Cofree comodules.** `TauCeti/Algebra/Coalgebra/Comodule/Cofree.lean` supplies
  `TauCeti.Comodule.cofree`, `TauCeti.Comodule.Hom.cofreeUnit`,
  `TauCeti.Comodule.Hom.cofreeEquiv` and `TauCeti.ComoduleCat.cofree` over a
  commutative ring. `Comodule/Abelian.lean` supplies the abelian category and exact
  forgetful functor when the coalgebra is flat; `Comodule/Corestrict.lean` supplies
  corestriction along a coalgebra map. Layer 1.1 builds injective resolutions,
  derived invariants and cotensor induction on these carriers.
- **Analytic local inversion.** `TauCeti/Analysis/Analytic/Inverse.lean` supplies
  `AnalyticAt.exists_openPartialHomeomorph` for an analytic map between Banach
  spaces over a complete nontrivially normed field whose strict derivative at the
  specified point is a continuous linear equivalence. Layer 3A.5 uses it over ℂ
  in étale-coordinate presentations, alongside Mathlib's manifold charts.

### Native tangent and smoothness interfaces

The counit-derivation carrier is `Derivation R H (TauCeti.Bialgebra.CounitAlgebra R H R)`.
`Derivation.instLieAlgebraCounitAlgebra` in
`TauCeti/Algebra/AlgebraicGroup/Tangent/Lie/Basic.lean` gives its convolution-commutator
bracket for commutative rings R, H and a bialgebra structure. The Hopf case
has the differential `TauCeti.tangentKerMap` in `Tangent/Map.lean`.
`TauCeti.Bialgebra.CotangentSpace` and `Derivation.cotangentLinearEquiv` in
`Tangent/Cotangent.lean` identify this carrier with the dual of I/I²;
`Derivation.tangentScalarExtensionEquiv` requires that cotangent module finite
and projective. `Derivation.adjointComodule` and
`Derivation.adjointCoordinateBialgHom` in `Tangent/Representation.lean` supply
the fixed-module adjoint representation under those hypotheses, with a basis
for the coordinate map. These are supplied objects, not new definitions here.
`TauCeti.smoothCommHopfAlgProperty_of_charZero` in
`TauCeti/Algebra/AlgebraicGroup/Smooth/CharZero.lean` supplies Cartier's theorem
for finite-type commutative Hopf algebras over characteristic-zero fields.

### From TauCetiRoadmap.SchemeAndStackFoundations

Section 1.1 supplies effective fpqc descent of quasi-coherent modules and the
stack of sheaves; §§1.5, 1.13–1.15 supply quotient sheaves, group spaces and torsors.
Section 0.7 supplies the dimension theory used by Layer 3A. These contracts do not
assert representability of every algebraic-group quotient.
Sections 0.8 and 4.12 supply, respectively, étale coordinates for smooth morphisms
and Chow's lemma for separated finite-type schemes over a Noetherian base; §0.3
supplies relative projective space. Layer 3A.5 uses the latter two locally on an
affine finite-type complex base in its properness comparison.

### From TauCetiRoadmap.ModularCurves

Sections 0E–0F supply affine descent and affine Weil restriction for a finite
locally free base morphism and an affine finitely presented source, including
arbitrary base change. Layer 9D transports the represented unit functor through
the affine/Hopf dictionary; it needs no second Weil-restriction construction.

### Native quotient and isometry interfaces

Use `TauCeti.CommHopfAlgCat.fppfQuotientSheaf` from
`TauCeti/Algebra/AlgebraicGroup/Fppf/Quotient/Basic.lean` for a commutative Hopf
algebra and a normal Hopf ideal, and `CommHopfAlgCat.fppfHomogeneousQuotient` from
`Fppf/Quotient/Homogeneous/Basic.lean` for an arbitrary closed subgroup, with its
projection, its universal property for right-invariant maps and the torsor square of
`Homogeneous/Torsor.lean`. Each underlying sheaf is the sheafification of
the pointwise coset presheaf; neither makes a representability assertion.
`TauCeti.HopfIdeal.coinvariants` (`HopfIdeal/Coinvariants/Basic.lean`) is the subalgebra of
functions invariant under right translation by the subgroup. Use
`TauCeti.BilinForm.isometryGroup` and `TauCeti.BilinForm.mem_isometryGroup_iff`
from `TauCeti/LinearAlgebra/BilinearForm/Isometry.lean` for the subgroup of linear
automorphisms preserving a bilinear form. No definiteness or ADE hypothesis is
needed to construct that subgroup.

**Checks.**
- The constant S₃ over ℂ is proper but has six geometric components:
  (12)(23)=(123) and (23)(12)=(132), so geometric integrality cannot be omitted.
- The trivial group has one geometric point and commutator 1; an abelian variety
  over a field satisfies properness and geometric integrality.
- In the fppf quotient 𝔾_m/μ₂, the square class of 2 over ℚ lifts after
  ℚ→ℚ(√2), with (√2)²=2; there is no rational square root. A pointwise
  surjectivity assertion would therefore misstate the sheaf quotient.

## How to read the build

Layers 0–3 construct the dictionaries and geometric structure; Layers 4–7 develop
structure theory, and Layer 8 specifies split data and pinnings. Layer 9 constructs the
integral pinned models before Layer 9D proves classification and relative extensions, followed
by rational representations in Layer 10 and spectral monodromy in Layer 11.
Suggested.lean states the statable headline theorems on pinned native carriers;
its module docstring identifies the missing carriers for the other endpoints.
The fppf topology, sheafification, torsors and generic descent are consumed from
the exact supplier contracts above. Quotient representability is proved separately
with the hypotheses stated at each group-specific application.

## Layer 0: the functor of points and the three-way dictionary

- **R-points as a group.** Keep `R` a commutative `k`-algebra and let the values `G(R)` be
  allowed to be noncommutative. Consume Tau Ceti's `WithConv`,
  `CommHopfAlgCat.pointsFunctor`, and `FiniteTypeCommHopfAlgCat.pointsFunctor`; prove
  convolution, identity, inverse, and naturality lemmas at their exact hypotheses where
  the named interfaces need them; do not introduce a parallel `AlgPoints` structure. The convolution is
  `(f * g)(a) = ∑ f(a₁) g(a₂)`, with counit identity and antipode inverse, not composition.
  `GroupLike k A` is not the points functor: group-like elements form a commutative group,
  whereas `GLₙ(R)` can be noncommutative (Milne, Algebraic Groups (2017), §1.a and
  Proposition 1.21, pp. 11–12). *Needs:* Tau Ceti's `WithConv` points and points functors;
  Mathlib's convolution product.
- **The three model interfaces.** For affine group schemes over `Spec R`, package Mathlib's
  `hopfSpec.fullyFaithful` and `essImage_hopfSpec` as the anti-equivalence between
  commutative Hopf `R`-algebras and affine group objects over `Spec R`. Keep finite-type and
  smoothness as transported predicates, not objects built into either category. Prove the
  counit and unit identifications explicitly: `Γ(Spec A) ≃ A` as Hopf algebras and
  `Spec Γ(G) ≃ G` as group objects for affine `G`, compatible with Mathlib's instances and
  structural maps. Prove the third equivalence with representable group-valued functors
  using Yoneda and Tau Ceti's `CommHopfAlgCat.pointsFunctor`; identify the points of `Spec A`
  with algebra homomorphisms by existing `Spec.mapMulEquiv`, and prove compatibility of the
  group laws and naturality in the test algebra. Pin the scheme, Hopf carrier, and test-algebra
  universes to a common `u` (`w=v=u` in `pointsFunctor` / `GrpCat.{max v w}` and
  `R S T : Type u` for `Spec.mapMulEquiv`); no heterogeneous-universe convention is intended.
  Complete the finite-type and points comparisons and the
  unit/counit compatibility on these native instances. `Scheme.Over` carries
  the structural morphism. *Needs:* Mathlib's affine group/Hopf dictionary;
  Tau Ceti's points functors; Yoneda.
- **Base change and descent.** Consume Tau Ceti's finite-type Hopf-category and base-change
  functors, including compatibility of points under base change. Keep geometric notions
  after extension to `k̄`. Consume SchemeAndStackFoundations §1.1 and §§1.13–1.15, ModularCurves §0E,
  and the native fppf quotient sheaf. Construct the Hopf/points descent adapters
  and prove the group-specific representability theorems of Layer 3. *Needs:* Tau Ceti's
  base-change functors and `CommHopfAlgCat.baseChangePointsMulEquiv`; SchemeAndStackFoundations
  §1.1, §§1.13–1.15; ModularCurves §0E; the native fppf quotient sheaves.

### Examples

**Checks.**
- For `𝔾_a = Spec k[t]` with `Δ(t) = t⊗1 + 1⊗t`, two points `f, g : k[t] → R` with
  `f(t) = a`, `g(t) = b` have convolution `(f * g)(t) = a + b`. A pointwise product of
  algebra maps would give `ab` and is not a group law on points.
- For `𝔾_m = Spec k[t, t⁻¹]`, `Δ(t) = t⊗t` gives `(f * g)(t) = ab`, the counit `ε(t) = 1`
  is the identity point and the antipode `S(t) = t⁻¹` gives the inverse `a⁻¹`.
- In `GL₂(ℤ)` the points with matrices `[[1,1],[0,1]]` and `[[1,0],[1,1]]` have products
  `[[2,1],[1,1]]` and `[[1,1],[1,2]]` in the two orders, so the points group is not
  commutative, whereas the group-like elements of `O(GL₂)` are the powers of `det` and
  commute: `GroupLike` is not the points functor.
- Under `essImage_hopfSpec`, an elliptic curve over `k` is a group object over `Spec k`
  that is not affine, so it is not in the essential image of `hopfSpec`; `Spec k[t]`
  with the additive Hopf structure is, and `Γ` recovers `k[t]` with `Δ(t) = t⊗1 + 1⊗t`.

### Dependencies

Mathlib's affine group/Hopf dictionary and Yoneda; Tau Ceti's points functors and base
change; SchemeAndStackFoundations §1.1, §§1.13–1.15 and ModularCurves §0E for the descent
adapters.

## Layer 1: representations = comodules

- **Comodules and their finite-dimensional category.** Consume Tau Ceti's
  comodule structures, category, finite/rigid categories, tensor products, duals, and
  matrix-coefficient APIs. Complete the rational-representation/comodule comparison and
  regular representation at the exact field and finite-type hypotheses; do not define
  parallel comodule structures.
- **Finite-dimensional subcoalgebras.** Consume Tau Ceti's proved fundamental-theorem
  interfaces: `exists_finiteDimensional_subcoalgebra_mem` and
  `iUnion_finiteDimensional_subcoalgebras_eq_univ` for subcoalgebras, and
  `exists_finite_subcomodule_mem` and `iUnion_finiteSubcomodules_eq_univ` for comodules.
  Use the elementwise and directed-union declarations at their exact field/module hypotheses;
  over a field the required module freeness is automatic. Reuse the finite
  coefficient-subcoalgebra API. Any stronger coefficient-ring or category-level versions
  remain explicit new targets (Milne, Proposition 4.7 and Theorem 4.9, pp. 86–87). *Needs:*
  Tau Ceti's finite-subcoalgebra and finite-subcomodule theorems.
- **The dictionary and faithful representations.** Relate rational representations to
  comodules and matrix coefficients: for an affine group scheme `G` of finite type over a
  field `k`, a finite-dimensional rational representation `ρ : G → GL(V)` is the same as a
  finite-dimensional right `k[G]`-comodule, and `ρ` is a closed immersion exactly when
  `ρ* : k[GL(V)] → k[G]` is surjective. Consume the supplied criterion
  (`TauCeti.Comodule.IsFaithful` and its three characterizations in the supplier contract):
  faithfulness is generation of `k[G]` by the matrix coefficients of `V` together with their
  antipode images, equivalently by the coefficients of `V ⊕ Vˇ`; and consume the supplied
  embedding theorem (`TauCeti.AffineGroupSchemeCat.exists_isClosedImmersion_generalLinear`,
  `TauCeti.Comodule.exists_coordinateBialgHom_surjective`): every affine group scheme of
  finite type over `k` is a closed subgroup of some `GLₙ` (Milne, Theorem 4.9 and
  Corollary 4.10, p. 87). The only target here is the transport of these statements along the
  rational-representation/comodule dictionary and Layer 0's scheme/Hopf equivalence, with the
  one-universe hypothesis of the group-scheme forms made explicit. Faithfulness is not
  injectivity on field-valued points. *Needs:* the supplied declarations above; Layer 0's
  dictionary.

  **Checks.**
  - For the standard character of `𝔾_m`, the coefficient `t` generates `k[t]`, not
    `k[t, t⁻¹]`; adjoining its antipode image `t⁻¹` generates `k[t, t⁻¹]`. The criterion with
    the antipode term accepts the character as faithful; without that term it would reject it.
  - For `μ_p` in characteristic `p`, the standard character has coefficient `t` with
    `t⁻¹ = t^(p−1)`, so the criterion holds and `μ_p → GL₁` is a closed immersion, although
    `μ_p(k̄) = {1}`: injectivity on geometric points is the wrong notion.
  - For the trivial group `H = k` and the zero comodule, the empty basis gives the
    coordinate morphism `Spec k → GL₀ = Spec k`, an isomorphism, so the zero comodule is
    faithful; a criterion demanding a nonzero module would exclude the trivial group.
- **Tannakian reconstruction dictionaries.** Consume native
  `TauCeti.Tannaka.pointsFunctorIsoTensorAutFunctor k H` for `[Field k]`,
  `[CommRing H]`, `[HopfAlgebra k H]` in the common universe. Preserve the actual
  `pointsFunctor ⋙ GrpCat.uliftFunctor ≅ tensorAutFunctor`, its coefficient-algebra
  naturality and component/reconstructed-point equations. Transport it through the
  rational-representation/comodule equivalence and Layer0's scheme/group-functor
  equivalences; construct those remaining adapters and their compatibility with the
  faithful-representation/closed-immersion maps. No second native reconstruction
  theorem or unlifted equality of these functors is intended (Milne, Theorem 4.14, p. 88,
  for the generation of all representations from a faithful one). *Needs:* the native
  reconstruction isomorphism; Layer 0's three equivalences; the comodule dictionary above.

### 1.1 Rational cohomology and algebraic induction

For a commutative ring R and a flat commutative Hopf R-algebra H, prove that the
native category of all right H-comodules has enough injectives. Given a comodule M,
embed its underlying module into an injective module I and compose its coaction
M → M ⊗ H with M ⊗ H → I ⊗ H. The counit splits the first map as a module map,
flatness makes the second injective, and the exact forgetful functor with its cofree
right adjoint makes I ⊗ H injective. No finiteness or flatness condition is placed
on M (Jantzen, Part I, 1985 preprint, §3.9, p. 60).

Define rational cohomology as the right derived functors of the invariant submodule
Mᴴ = ker(ρ_M − (m ↦ m ⊗ 1)). Construct the augmented cofree resolution and prove
that its invariant complex computes these functors. In degree n this complex is
Cⁿ(H,M)=M ⊗ H^⊗n: cofaces apply ρ_M at the beginning, Δ in each Hopf position,
and append 1 at the end; the differential is the alternating sum in that order.
Prove the cosimplicial identities and d²=0. The resolution is split exact on
underlying modules by the counit, and its terms are acyclic for invariants;
cofree does not mean injective for arbitrary coefficient modules
(Jantzen, Part I, 1985 preprint, §§4.2, 4.7(a), 4.14–4.16, pp. 69–70, 72–73, 77–79a).
*Needs:* native abelian/comodule/cofree interfaces in the supplier contract;
Mathlib's module injectives, right derived functors and cochain-complex homology.

The cohomology and cofree-resolution API includes:
- H⁰(H,M)=Mᴴ, naturally in M; for every R-module N, the cofree comodule N ⊗ H
  has H⁰=N and Hⁿ=0 for n>0, with degree-zero identification given by the counit.
- A coefficient morphism acts on the first tensor factor; identities and composition
  are preserved. Every short exact coefficient sequence gives the long exact
  cohomology sequence with its connecting maps.
- The tensor permutation M ⊗ H^⊗n → H^⊗n ⊗ M is a chain isomorphism when the
  target cofaces are transported by that permutation. Hopf factors and coface
  numbers keep their order, so there is no sign change; coefficient and connecting
  maps commute with this comparison (the same §§4.14–4.16).

**Checks.**
- For H=ℤ[t,t⁻¹] and the weight-one line, d⁰(1)=1⊗(t−1); moving the coefficient
  last gives (t−1)⊗1. The next differential sends t−1 to
  t⊗(t−1)−(t⊗t−1⊗1)+(t−1)⊗1=0.
- For the trivial group over ℤ the differentials in degrees 0,1,2 are 0,id,0.
  With M=ℤ/2, H⁰=ℤ/2 and all positive cohomology vanishes: nonflat coefficients
  are allowed. The cofree module ℤ is acyclic but not injective, since the map
  2ℤ → ℤ taking 2 to 1 cannot extend to ℤ.
- For M=0 every term and cohomology group is zero; for the regular comodule H,
  H⁰=R and H¹=0. For the trivial group the coefficient map ℤ → ℤ/2 sends 3 to 1
  in H⁰ and commutes with the differential id in degree one.

For flat commutative Hopf R-algebras H,K, a Hopf map q:H → K and a right
K-comodule M, define induction as the equalizer in M ⊗ H of ρ_M ⊗ id and
id ⊗ ((q ⊗ id)Δ_H), with common codomain M ⊗ K ⊗ H and associators understood.
Flatness of H makes id ⊗ Δ_H restrict to a right H-coaction on this equalizer.
Prove reciprocity
Hom_H(N,Ind_q M) ≃ Hom_K(Corestrict_q N,M): the forward map composes with
id ⊗ ε_H, and its inverse takes u to (u ⊗ id)ρ_N. This applies to arbitrary
Hopf maps; the closed-subgroup case is the surjective coordinate-map specialization.
The equalizer proof uses only the Hopf-map identities, so needs no surjectivity
(Jantzen, Part I, 1985 preprint, §§3.3–3.7, pp. 53–57, for the subgroup formulation).
*Needs:* native corestriction and cofree comodules; tensor equalizers and flatness;
Layer 0's Hopf/points dictionary for the function interpretation.

The induction API includes:
- Reciprocity is natural in N and M, with the two displayed maps inverse; induction
  is right adjoint to corestriction and is left exact. Identity and composite Hopf
  maps give identity and transitivity isomorphisms compatible with counit evaluation.
- On points of every R-algebra, the equalizer describes functions F with
  F(hg)=hF(g), acted on by (a·F)(g)=F(ga). The antipode sends F to
  f(g)=F(g⁻¹), with f(gh)=h⁻¹f(g) and (a·f)(g)=f(a⁻¹g). Prove that this
  involution intertwines actions and reciprocity, including evaluation at 1.
- Over a field, transport cohomology and induction through Layer 1's rational
  representation dictionary and Layer 0's subgroup dictionary, preserving coefficient
  maps, connecting maps and adjunction maps for Layers 6A and 10B.

**Checks.**
- For `Ind₁^{C₂}ℤ` both function conventions give rank two; the nonidentity swaps
  the delta basis, and the constant function 1 evaluates to 1 under reciprocity.
- For C₂⊂S₃ and trivial coefficients, the equalizer has rank three. Inversion sends
  the indicator of C₂(123) to that of (132)C₂; right translation by a three-cycle
  cycles the three basis functions. This detects reversing neither cosets nor action.
- For q=id and the integral sign comodule of C₂, induction is the sign module:
  evaluation gives rank one and the nonidentity acts by −1. For q=id on the trivial
  group it is the identity on every R-module, including ℤ/2 and 0.
- For the nonsurjective unit map ℤ → ℤ[t,t⁻¹], induction is the invariant
  submodule: the weight-one line gives 0 and the trivial line gives ℤ. Surjectivity
  of q is not a prerequisite for the equalizer or reciprocity.
- Over a field, `Ind_B^{SL₂} k=k`, the regular functions on ℙ¹; this specialization
  uses the homogeneous-space identification, not a restriction on the generic definition.

### Examples

**Checks.**
- The regular comodule of `𝔾_a` on `k[t]` has the finite subcomodule `k + kt`, whose
  coordinate map `O(GL₂) → k[t]` is onto: it realizes `𝔾_a` as the matrices
  `[[1, t], [0, 1]]`. The embedding theorem's subcomodule can be taken two-dimensional.
- For the constant group `S₃` over `ℂ`, the two-dimensional irreducible representation is
  faithful: its four matrix coefficients generate the six-dimensional algebra `k[S₃]`,
  because their pairwise products are the coefficients of `V ⊗ V = 1 ⊕ sign ⊕ V`. The sign
  character is not faithful: its coefficient algebra is the span of `1` and `sign`, of
  dimension two, and its kernel is `A₃`. In characteristic 3 the augmentation plane
  contains the invariant vector `(1,1,1)` and is not simple. In characteristic 2
  the sign character is trivial, its coefficient algebra has dimension 1 and its kernel is S₃.
- Tannakian reconstruction for `𝔾_m`: the tensor automorphisms of the fibre functor on
  graded vector spaces are the scalars `t ∈ Rˣ` acting by `t^n` in degree `n`, recovering
  `𝔾_m(R) = Rˣ`; without the tensor compatibility one obtains an independent scalar in each
  degree, which overshoots.

### Dependencies

Layer 0; Tau Ceti's comodule categories, finite-subcoalgebra theorems, embedding and
faithfulness theorems, Tannakian reconstruction and cofree/corestriction interfaces;
Mathlib's module injectives and derived functors.

## Layer 2: Lie algebra and the adjoint representation

Use the native counit-derivation Lie algebra, differential and adjoint comodule
in the group/Hopf dictionary of Layer 0. For each affine group scheme of finite
type over a field, identify these constructions with its tangent space at the
identity, and transport their naturality through the scheme/Hopf equivalence.
All comparisons commute with group homomorphisms and coefficient-field extensions.
For smooth groups, identify tangent dimension with group dimension. The bracket convention is XY−YX
in GLₙ (Milne, §10.b–§10.e, especially 10.6, 10.14, Theorem 10.23 and
Propositions 10.28–10.29, pp. 188–196).
*Needs:* Layer 0's dictionary and its structural-map comparisons; the native
cotangent, tangent, differential, adjoint and smoothness interfaces in the
supplier contracts.

### Examples

**Checks.**
- The trivial group has tangent space 0; for 𝔾_a and 𝔾_m it is k with
  zero bracket. The two groups have the same Lie algebra, so this does not
  identify the groups.
- In GL₂, [E₁₂,E₂₁]=diag(1,−1), and conjugation by diag(t,1) sends
  E₁₂ to tE₁₂. Reversing the adjoint convention would give t⁻¹E₁₂.
- In characteristic p, μ_p has dimension 0 but tangent dimension 1;
  t=1+ε satisfies t^p=1 when ε²=0. The Frobenius of 𝔾_a has zero
  differential, even though the morphism is nonconstant. In characteristic 2,
  Lie(SL₂) contains the scalar identity because its trace is 2=0.

### Dependencies

Layer 0; the named native tangent and adjoint modules. Smoothness is required for equality of geometric
and tangent dimensions, not for constructing the tangent Lie algebra.

## Layer 3: subgroups, quotients, components
- **Hopf ideals ↔ closed subgroup schemes:** an ideal `I` with `Δ(I) ⊆ I⊗A + A⊗I`,
  `ε(I)=0`, `S(I) ⊆ I`; the quotient Hopf algebra `A/I`; the anti-equivalence between
  closed subgroup schemes of `Spec A` and Hopf ideals of `A`, with the kernel of a Hopf
  homomorphism a Hopf ideal (Milne, Definition 3.10, Propositions 3.11 and 3.15,
  pp. 67–68); kernels of group homomorphisms as fibres over the identity. Prove that a
  homomorphism of affine group schemes of finite type over a field is a monomorphism exactly
  when it is a closed immersion (Milne, Theorem 5.34, p. 107).
  Identify the Lie algebra of the scheme-theoretic kernel of a group homomorphism
  with the kernel of its differential, without assuming smoothness of the kernel
  (Milne, 10.14, p. 190). *Needs:* Layer 0's dictionary; Layer 2's tangent comparison; the
  quotient Hopf algebra and scheme-kernel construction in this section. For Frobenius on
  𝔾_a in characteristic p the kernel α_p has tangent space k, matching the kernel
  of the zero differential, while its geometric dimension is 0.
- **Normality and quotients:** normal = Hopf ideal stable under the adjoint coaction
  (needs the conjugation/adjoint morphism at Hopf level). The quotient `G/H` is first the
  native **fppf sheaf quotient** (`CommHopfAlgCat.fppfHomogeneousQuotient` for any closed
  `H`, `TauCeti.CommHopfAlgCat.fppfQuotientSheaf` for normal `H`); whether it is represented
  by a scheme (and when by an *affine* one, e.g. `H` reductive, by Matsushima in Layer 6B)
  is a **theorem with hypotheses**, not automatic. Prove that every normal closed subgroup
  of an affine group scheme of finite type over a field is the kernel of a quotient map to
  an affine group scheme, that the quotient sheaf is then represented by it, and the short
  exact sequences and isomorphism theorems this gives (Milne, Theorem 5.14 and
  Proposition 5.18, pp. 102–103). *Needs:* the native fppf quotient sheaves; Layer 1's
  faithful representations (the quotient is constructed inside a representation);
  SchemeAndStackFoundations §§1.13–1.15 for torsors.
- **Identity component `G°` and component group `π₀(G)`:** `G°` is the connected
  component of the identity; it is a closed normal subgroup scheme, its formation commutes
  with extension of the base field, and it is geometrically connected (Milne,
  Proposition 1.34, p. 16). For a group scheme over a field, connected and geometrically
  connected therefore agree, because of the rational point `e`; the distinction between
  `k` and `k̄` survives in `π₀(G) = G/G°`, whose `k`-points need not exhaust its geometric
  points. `π₀(G)` is a finite étale group scheme and `G°` is the unique connected normal
  subgroup with étale quotient (Milne, Proposition 5.58, p. 114); no smoothness or
  perfectness hypothesis is needed for this. *Needs:* Layer 0's dictionary; the quotient
  construction above; Mathlib's connected components and idempotents.
  ⚠ Reserve the term **connected–étale sequence** for *finite* group schemes; here use
  "identity component and component group", and "connected" always means the geometric
  notion.

### Examples

**Checks.**
- In `k[t, t⁻¹]` the ideal `(tⁿ − 1)` is a Hopf ideal: `Δ(tⁿ − 1) = (tⁿ − 1)⊗tⁿ +
  1⊗(tⁿ − 1)`, `ε(tⁿ − 1) = 0` and `S(tⁿ − 1) = −t⁻ⁿ(tⁿ − 1)`; it cuts out `μ_n`. Over `ℚ`
  the ideal `(t − 2)` has `ε(t − 2) = −1 ≠ 0` and is not a Hopf ideal: the point `2` is not
  a subgroup.
- In `GL₂` the Hopf ideal of the upper-triangular Borel is not stable under the adjoint
  coaction: conjugation by `[[0,1],[1,0]]` carries it to the lower-triangular Borel. The
  ideal `(det − 1)` of `SL₂` is stable, since `det` is a conjugation invariant.
- `𝔾_m → 𝔾_m`, `t ↦ t²`, has kernel `μ₂` and the represented quotient `𝔾_m/μ₂ ≅ 𝔾_m`;
  the point `2 ∈ ℚˣ` of the quotient lifts over `ℚ(√2)` but not over `ℚ`, so the quotient
  sheaf is not the pointwise quotient of points.
- `μ₃` over `ℚ` has two connected components over `ℚ` (`t = 1` and `t² + t + 1 = 0`) but
  three geometric points; `μ₃° = Spec ℚ` and `π₀(μ₃)` is the étale group `μ₃` itself, with
  one `ℚ`-point and three `ℚ̄`-points. Over `ℝ`, `SO₂` (the circle `x² + y² = 1`) is
  connected and geometrically connected (it becomes `𝔾_m` over `ℂ`), while
  `Spec ℝ[x]/(x² + 1)` is connected but not geometrically connected and has no `ℝ`-point,
  so it is not a group scheme over `ℝ`.

### Dependencies

Layers 0–2; the native fppf quotient sheaves; SchemeAndStackFoundations §§1.13–1.15.

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
the supplied Cartier smoothness theorem and its scheme comparison when starting from the
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

Suggested.lean uses `OrbitAcceptance.Points` for these rational points,
`OrbitAcceptance.orbitMorphism` for μ_x, and `OrbitAcceptance.geometricOrbit`,
`OrbitAcceptance.orbitClosure`, `OrbitAcceptance.orbitBoundary` and
`OrbitAcceptance.orbitDimension` for O_x, Z_x, Z_x\O_x and native Krull dimension.
Their APIs are the action, translation, image, closure and dimension laws in
§§3A.1–3A.3. The headline signatures are
`OrbitAcceptance.orbit_locallyClosed`, `OrbitAcceptance.exists_reduced_orbit_model`,
`OrbitAcceptance.boundary_dimension_lt`, `OrbitAcceptance.exists_closed_orbit_in_closure`
and `OrbitAcceptance.exists_closed_orbit`. All require an algebraically closed
field, smooth affine quasi-compact G, and separated finite-type X; the last
requires a nonempty set of rational points. The other existence assertion starts
with a specified rational point. Finite type is expressed by locally finite type
and quasi-compactness, with smoothness supplying local finite type for G.
(Milne, Algebraic Groups (2017), Proposition 1.65(b,c), pp. 26–27, and
Proposition 1.66, pp. 27–28; the nonreduced target has the same underlying
space as its reduction.) *Needs:* native scheme group actions and Chevalley;
SchemeAndStackFoundations §0.7; reduced locally closed subschemes.

**Checks.**
- For 𝔾_m acting on ℙ¹ by t·[x:y]=[tx:y], the orbit of [1:1] is
  ℙ¹\{[0:1],[1:0]}, of dimension 1; its boundary has two points and dimension 0.
  Its reduced orbit model is 𝔾_m, and its closure contains both closed fixed orbits.
- For the trivial group on Spec k[ε]/(ε²), the unique orbit is the unique
  point of dimension 0, its reduced model is Spec k, and its empty boundary
  has dimension −∞<0. The model is not the nonreduced ambient scheme.
- For the constant S₃ acting on itself by left translation, the geometric
  orbit has six points, dimension 0, and empty boundary of dimension −∞;
  connectedness of G is unnecessary. On the empty X there are zero rational
  points and no closed-orbit existence conclusion.

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

**3A.5 Properness and the complex comparison.** If X is proper over k,
the closed orbit model is proper; in particular apply the existing
SchemeAndStackFoundations0.3 relative-Proj/projective-space carrier and
the projective-morphism properness theorem to projective X. Consume native
`IsProper (Proj.toSpecZero 𝒜)` at its `Algebra.FiniteType (𝒜 0) A`
hypothesis and transport through the actual projective-space/closed-immersion
maps.

**Classical complex points.** For every locally finite-type ℂ-scheme X, construct
the classical topology on X(ℂ), the set of ℂ-morphisms Spec ℂ → X. On an affine
presentation it is the zero-locus subspace topology in ℂⁿ. Prove independence of
the presentation using polynomial coordinate maps, compatibility with principal
opens, and gluing along any affine open cover, including infinite covers. Scheme
morphisms act by composition on points and give a functor to topological spaces
(SGA 1, Exposé XII, §§1.1–1.2, revised edition, pp. 239–241, on underlying spaces).
The construction admits singular, nonreduced and nonseparated schemes; it does not
assign a manifold structure to all of them.

Its API includes:
- Open and closed immersions induce the corresponding topological embeddings,
  and the point functor preserves fibre products, via the actual projection maps.
  Reduction induces a homeomorphism on complex points (SGA 1, XII.1.1–1.2 and
  Proposition 2.1, pp. 239–242).
- Separated schemes have Hausdorff complex points. A proper morphism gives a
  relatively separated topological map whose restriction over every Hausdorff
  open subset of the target has compact inverse images of compact subsets;
  in particular a proper ℂ-scheme has compact complex points
  (SGA 1, XII, Propositions 3.1(viii) and 3.2(v), pp. 244–247).
- For a smooth ℂ-scheme, construct complex charts locally in its dimension,
  using étale coordinates and the analytic inverse theorem. Transition functions
  and scheme maps between smooth schemes are holomorphic; étale maps become local
  biholomorphisms and smooth maps between smooth schemes become holomorphic
  submersions. A fixed-dimensional manifold carrier requires constant dimension;
  otherwise use the open-and-closed loci of each dimension
  (SGA 1, XII, Proposition 3.1(iii)–(iv), pp. 244–245).

*Needs:* Mathlib's affine scheme charts, complex polynomial continuity, topological
gluing and manifold charts; SchemeAndStackFoundations §0.8's étale coordinates;
the native analytic inverse theorem in the supplier contract. A route for the
proper comparison uses Chow's lemma and projective-space compactness; its algebraic
inputs are SchemeAndStackFoundations §4.12's Chow lemma, applied over affine
finite-type complex opens of the base, and §0.3's projective geometry.

**Checks.**
- 𝔸¹(ℂ)=ℂ and D(t)(ℂ)=ℂ∖{0}; t↦t² takes 2 to 4 and has derivative 2 at 1,
  hence a local inverse there. At 0 its derivative is 0, so it is not étale there.
- Spec ℂ[ε]/(ε²) and its reduction each have exactly one complex point, and the
  reduction map is a homeomorphism. Their algebraic local rings have dimensions
  2 and 1 over ℂ: the point topology does not assert a ringed-space isomorphism.
- The empty scheme has no points and ℙ⁰ has one compact point; ℙ¹(ℂ) is compact,
  whereas the sequence 1,2,3,… in 𝔸¹(ℂ) escapes every compact subset.
- The line with doubled origin has two origins with no disjoint neighbourhoods,
  so the separatedness hypothesis matters. A disjoint union of a point and 𝔸¹
  has local dimensions 0 and 1 and no single fixed-dimensional chart model.

The closed orbit in a projective X therefore has compact complex points. To obtain the
orbit's complex manifold, prove that the reduced orbit
model is smooth: over the perfect field ℂ its nonempty smooth locus
meets each component, and translations spread it to the whole orbit.
Consume native `Scheme.Hom.dense_smoothLocus_of_perfectField` and its
open smooth locus, restricting to the reduced component loci as needed.
Apply these smooth charts, component by component when dimensions differ, to the orbit and to
`G` itself, a smooth closed subscheme of some `GLₙ` by Layer 1: `G(ℂ)` is a
complex manifold, and multiplication, unit and inverse are holomorphic because
they are induced by scheme morphisms, so `G(ℂ)` is a complex Lie group whose Lie algebra is
identified with Layer 2's tangent Lie algebra by the chart at the identity. This
complex Lie-group dictionary is owned here and consumed by Layer 11. Compare it
with LieGroups Layer 2's closed-subgroup theorem for the stabilizer `H(ℂ)`,
which is closed in `G(ℂ)`. Pin H=Stab_G(x), the actual map G(ℂ)→O_x(ℂ) and its
fibres. Consume SmoothBundlesConnections B1.0 for regular fibres and fibre
products of submersions and Mathlib's submersion normal form, and
SmoothBundlesConnections B1.1/B1.4 for the principal-bundle and
homogeneous-space quotient; no constant-rank theorem beyond the submersion case,
and no torus, conjugacy or Weyl theorem, is needed. Prove the complex orbit map
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
represented. **Checks.**
- The classical topology gives ℂ for 𝔸¹ and the continuous map z↦z² on 𝔾_m; at z=2
  its value is 4, and at z=1 its derivative is multiplication by 2.
- Spec ℂ[ε]/(ε²) has one complex point but is not smooth over ℂ; its cotangent
  space has dimension 1 while its underlying point has dimension 0. The smooth-chart
  and algebraic-tangent comparison does not apply to it.
- The trivial group gives a one-point complex Lie group and zero tangent space;
  𝔾_a gives addition on ℂ and tangent bracket zero.

The compact manifold can be disconnected. A closed orbit
in affine X need not be compact, and an arbitrary projective orbit
need not be closed or compact.

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
and LieGroups retains finite-dimensional analytic quotient/manifold theory.
NilpotentOrbits' adjoint orbit and SchubertGeometry's highest-line/flag
comparison consume or compare with this earlier phase without becoming
its prerequisites.

### Examples

**Checks.**
- `𝔾_m` acting on `𝔸¹` by scaling has the orbits `{0}` (closed, dimension 0) and
  `𝔸¹ ∖ {0}` (dimension 1, boundary `{0}` of dimension 0 < 1); the closed orbit here is
  the unique orbit of minimal dimension.
- `𝔾_a` acting on `𝔸²` by `(x, y) ↦ (x + ay, y)` has the orbits `{y = c}` for `c ≠ 0`
  (closed, dimension 1) and the points `(x, 0)` (closed, dimension 0). Every orbit is
  closed, with empty boundary of dimension `−∞`, and closed orbits of two different
  dimensions coexist: a closed orbit need not have the globally smallest dimension.
- `GL₂` acting on `𝔸²` has the orbits `{0}` and `𝔸² ∖ {0}`, whose boundary `{0}` has
  dimension 0 < 2; the induced action on `P(V*) = ℙ¹` is transitive, so its unique orbit is
  closed, and the restriction `r : V → H⁰(ℙ¹, O(1))` is the identification of the
  two-dimensional `V` with the sections of `O(1)`, so `r ≠ 0` with zero kernel.

### Dependencies

Layers 0–1 and Layer 3's group-object vocabulary; SchemeAndStackFoundations §§0.3, 0.7,
0.8, 2.6, 4.12 and AlgebraicVectorBundles; SmoothBundlesConnections B1.0, B1.1, B1.4; LieGroups
Layer 2; Mathlib's Chevalley constructibility, Jacobson and residue-field theorems,
`topologicalKrullDim`, submersion normal form and analytic inverse function theorem.


## Layer 4: Jordan decomposition, diagonalizable groups, tori
- **Jordan decomposition.** For a locally finite automorphism `α` of a vector space over
  a perfect field, construct the unique commuting factorization `α = α_s α_u` with `α_s`
  semisimple and `α_u` locally unipotent (Milne, Theorem 9.17, p. 170). For an affine
  group scheme `G` of finite type over a perfect field `k` and `g ∈ G(k)`, construct the
  unique `g_s, g_u ∈ G(k)` with `g = g_s g_u = g_u g_s` such that `ρ(g_s) = ρ(g)_s` and
  `ρ(g_u) = ρ(g)_u` for every finite-dimensional representation `ρ` (Milne, Theorem 9.18,
  p. 170); prove functoriality under homomorphisms. Over an imperfect field state only the
  geometric decomposition over `k̄`. *Needs:* Layer 1's comodule dictionary and the regular
  representation; Mathlib's Jordan–Chevalley decomposition of a single endomorphism.
- **Diagonalizable groups and groups of multiplicative type:** consume the native
  scheme anti-equivalence specified in the supplier contract. Develop its character-group
  comparison and exactness in both directions and stability of diagonalizability under subgroups and quotients (Milne,
  Theorems 12.8–12.9, p. 233); the equivalent conditions of Milne, Theorem 12.12, p. 234
  (every representation is a sum of characters, equivalently `k[G]` is spanned by group-like
  elements); `μ_n = D(ℤ/n)`, `𝔾_m = D(ℤ)`; the non-smooth example `μ_p` in characteristic `p`.
  Groups of multiplicative type are those that become diagonalizable over `k̄`, classified
  by finitely generated abelian groups with a continuous Galois action (Milne,
  Theorem 12.23, p. 240). (*Cartier duality* proper is the duality of **finite locally free**
  commutative group schemes, a related but distinct statement to develop separately.)
  *Needs:* the native diagonalizable scheme equivalence; Layer 0's dictionary; Layer 1's comodules; Mathlib's group algebras and
  `GroupLike`.
- **Tori:** split and non-split; the **character lattice** `X*(T)` and **cocharacter
  lattice** `X_*(T)` with their perfect pairing `⟨χ, λ⟩`, defined by `χ ∘ λ : 𝔾_m → 𝔾_m`,
  `t ↦ t^⟨χ,λ⟩`: the input to root data. Prove that a torus is split exactly when its
  Galois action on `X*` is trivial, and that `X*` and `X_*` are free of the same rank with
  the pairing perfect. *Needs:* the diagonalizable-group dictionary above; Mathlib's
  `RootPairing` vocabulary for the pairing.

### Examples

**Checks.**
- In `GL₂(ℚ)`, `g = [[2,1],[0,2]]` has `g_s = 2·I` and `g_u = [[1,1/2],[0,1]]`;
  the standard representation sees these as its own Jordan parts. In characteristic 2
  this displayed matrix has determinant 0 and is not a GL₂ point. Over the imperfect field
  `k = 𝔽₂(a)`, `g = [[0,1],[a,0]]` has characteristic polynomial `x² − a = (x − √a)²`, so
  `g_s = √a·I` exists only over `k(√a)`: the perfectness hypothesis cannot be dropped.
- `D(0) = 1`, `D(ℤ) = 𝔾_m`, `D(ℤ/n) = μ_n`, and the exact sequence `0 → ℤ → ℤ → ℤ/n → 0`
  (multiplication by `n`) corresponds to `1 → μ_n → 𝔾_m → 𝔾_m → 1` with `t ↦ tⁿ`;
  `X*(μ_n) = ℤ/n` (the characters `tⁱ`, `i mod n`). In characteristic `p`,
  `D(ℤ/p) = Spec k[t]/((t − 1)^p)` is nonreduced with one point; a dictionary built on
  reduced groups would send `ℤ/p` to the trivial group and lose `X* = ℤ/p`.
- For `𝔾_m` the pairing of the character `t ↦ tᵃ` with the cocharacter `t ↦ tᵇ` is `ab`.
  The norm-one torus `T = {x² + y² = 1}` over `ℝ` has `T_ℂ ≅ 𝔾_m` via `x + iy`, and complex
  conjugation acts on `X*(T) = ℤ` by `−1`, so `T` is not split; `𝔾_m` over `ℝ` has the same
  rank with trivial Galois action.

### Dependencies

Layers 0–1; Mathlib's Jordan–Chevalley decomposition, group algebras and group-like
elements; RootSystems for the pairing vocabulary.

## Layer 5: solvable and unipotent groups; the unipotent radical
- **Unipotent groups** (correct, comodule definition): `G` is unipotent iff every nonzero
  representation has a nonzero fixed vector, equivalently every finite-dimensional
  representation is unipotent (Milne, 6.45, p. 135, and Proposition 14.3, p. 280). Prove the
  equivalent conditions: `G` embeds as a closed subgroup of the upper-triangular unipotent
  `Uₙ` for some `n`; `k[G]` is coconnected (Milne, Theorem 14.5, p. 281); and that a
  unipotent group has a central normal series with quotients subgroups of `𝔾_a`, hence is
  nilpotent (Milne, Proposition 14.21, p. 284). Prove stability under subgroups, quotients
  and extensions. *Needs:* Layer 1's comodules and the embedding theorem; Layer 3's quotients.
  - ⚠ "No nontrivial characters" is **not** equivalent to unipotent (e.g. `SLₙ` has no
    nontrivial characters but is semisimple). The implication is one-way: a *connected
    unipotent* group has no nontrivial characters; the converse needs solvability.
  - ⚠ A naïve `IsUnipotent` that tests nilpotence of `ρ(g) − id` only on geometric points
    is wrong for nonsmooth groups: `μ_p(k̄) = {1}`, so every such test passes for `μ_p`,
    which is not unipotent. The correct definition uses comodules (Layer 1).
- **Lie–Kolchin and solvable groups.** A smooth connected solvable group over an
  algebraically closed field is trigonalizable: it stabilizes a line in every nonzero
  representation and embeds in the upper-triangular `Bₙ` (Milne, Theorem 16.30, p. 334).
  For a smooth connected solvable `G` over a perfect field construct the largest normal
  unipotent subgroup `G_u`, smooth and connected with `G/G_u` a torus, and over `k̄` the
  decomposition `G = G_u ⋊ T` for a maximal torus `T` (Milne, Theorem 16.33, p. 335).
  *Needs:* the unipotent theory above; Layer 4's tori; Layer 3's quotients.
- **The unipotent radical `R_u(G)`** (the hard core, SGA3/Borel level): for a smooth
  connected `G` over an algebraically closed field, the largest connected normal unipotent
  smooth subgroup; it exists because extensions and quotients of unipotent groups are
  unipotent (Milne, Proposition 6.42 and 6.46, pp. 134–135). ⚠ Over **imperfect** fields
  the geometric unipotent radical `R_u(G_{k̄})` need *not* descend to `k`; this is exactly
  where pseudo-reductive groups appear. **Assume `k` perfect first** (so descent is fine), or
  define reductivity by the geometric condition without constructing a descended subgroup;
  distinguish the `k`-unipotent radical `R_(u,k)(G)` of Layer 9D from the geometric one in
  general. *Needs:* the unipotent theory above; Layer 3's normal subgroups and quotients;
  Layer 0's base change.

### Examples

**Checks.**
- `𝔾_a` is unipotent: in the standard representation `a ↦ [[1,a],[0,1]]`, `ρ(a) − id` is
  nilpotent, and the coaction of `k[t]` on `k + kt` fixes `1`. `α_p = ker(Frob : 𝔾_a → 𝔾_a)`
  in characteristic `p` is unipotent and nonsmooth. `μ_p` is not unipotent: its character
  `t` is a group-like element different from `1`, so the one-dimensional comodule `k_t` has
  no nonzero fixed vector, although `μ_p(k̄) = {1}`.
- `SL₂` has no nontrivial character (its coordinate ring has no group-like elements other
  than `1`) but `diag(2, 1/2) − id` is invertible in the standard representation over `ℚ`,
  so `SL₂` is not unipotent: the character test is one-way.
- Lie–Kolchin needs both hypotheses: the constant group `S₃` over `ℂ` is solvable with an
  irreducible two-dimensional representation (not connected); `SO₂` over `ℝ` is connected
  and commutative but rotation by `90°` has no real eigenvector (not algebraically closed).
- Unipotent radicals: `R_u(𝔾_a ⋊ 𝔾_m) = 𝔾_a`; `R_u(SL₂) = 1`; `R_u(GLₙ) = 1` for all n, while for n>0 the
  radical `R(GLₙ) = 𝔾_m` is the centre, so the two radicals differ; for n=0 both are 1. For `K/k` purely
  inseparable of degree `p`, `Res_(K/k) 𝔾_m` has geometric unipotent radical of dimension
  `p − 1` with no `k`-form (Layer 9D).

### Dependencies

Layers 1, 3 and 4; Milne Chapters 6, 14 and 16 as cited.

## Layer 5P: the shared polynomial-unipotent exponential and logarithm

Construct this characteristic-zero helper here, from Layers2–5, before the Levi-complement machinery of6A or the ordered-root/Bruhat construction of7C. It is the single polynomial exponential/logarithm package:6A.1 consumes its commutative-unipotent/vector-layer restriction, while7C consumes its full unipotent variety and subgroup comparison. Neither application is a premise, and there is no separate duplicate exponential engine. Keep all of Layer5's arbitrary-field unipotent scope; the finite-factorial argument of this subsection is specifically characteristic zero.

In characteristic zero construct the finite polynomial exp/log maps on a faithful upper-unitriangular realization of each smooth finite-type affine group with geometrically unipotent points used here, before presuming connectedness. Consume the actual faithful-comodule/upper-unitriangular embedding of Layer5 under its reducedness and algebraic-closure hypotheses, and prove the smooth/reduced and field-descent adapters rather than dropping them. For the finite-type closed subgroup schemes needed here, consume `TauCeti.smoothCommHopfAlgProperty_of_charZero` and transport its smoothness statement through the Layer 0 dictionary; transport it to the reducedness hypothesis of the faithful embedding. Do not assert that arbitrary closed subgroups of smooth groups in characteristic p are smooth. For d-by-d strict upper-triangular X and unipotent1+Z use exp(X)=sum_(0≤j<d)X^j/j! and log(1+Z)=sum_(1≤j<d)(−1)^(j+1)Z^j/j. Native [`IsNilpotent.exp`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/RingTheory/Nilpotent/Exp.lean#L50) supplies the finite exponential and its functoriality; construct the finite logarithm and inverse identities, not an unrelated analytic local logarithm. Prove restriction to the actual subgroup and its Lie algebra using its defining Hopf ideal: the invariant derivation attached to a tangent vector preserves that ideal and its finite Taylor exponential preserves the subgroup; conversely log(g) is tangent to the polynomial one-parameter subgroup g^t, whose integer values are powers of g and whose equations vanish identically in characteristic zero. Prove naturality for subgroup maps, independence of the faithful realization, compatibility with algebraic field extensions, and equivariance under every automorphism, in particular conjugation by T. This identifies U+ with its actual nilpotent Lie algebra as affine varieties, not as additive groups. Apply the Hopf-ideal argument also to a smooth closed subgroup with geometrically unipotent points before its connectedness is known: the faithful upper-unitriangular native theorem requires reducedness and finite type, not an extra connectedness assumption. Thus its exp/log restrictions identify it with its actual Lie subspace without presupposing component triviality. Over C compare these polynomials with the Lie exponential and prove their analytic maps inverse; hence U+(C) is contractible and simply connected. This uses no Bruhat, Iwasawa or highest-weight classification theorem. Do not use this characteristic-zero argument for arbitrary unipotent groups in characteristic p.
*Needs:* Layers 2–5; `TauCeti.smoothCommHopfAlgProperty_of_charZero`; Mathlib `IsNilpotent.exp`.

### Examples

**Checks.**
- For `N = [[0,a],[0,0]]`, `N² = 0`, so `exp(N) = I + N` and `log(I + N) = N`; the
  one-parameter subgroup of `u = I + E₁₂` is `u^t = I + tE₁₂`, with `log u = E₁₂`.
- For `X = E₁₂ + E₂₃` in `3×3` matrices, `X² = E₁₃` and `exp(X) = I + X + E₁₃/2`: the
  divided power `1/2` is needed, so the construction is characteristic zero and fails over
  `𝔽₂`.
- For `d = 1` the strictly upper-triangular algebra is zero and `exp(0) = 1`: the empty
  product case of the unipotent variety is the trivial group.

### Dependencies

Layers 2–5; the supplied characteristic-zero smoothness theorem; Mathlib's finite
exponential of a nilpotent element.

## Layer 6: reductive and semisimple groups
- **Reductive:** smooth, connected, with `R_u(G_{k̄})` trivial; the native predicate is
  `TauCeti.reductiveCommHopfAlgProperty`. **Semisimple:** radical `R(G)` (maximal connected
  normal solvable smooth, geometric) trivial (Milne, 6.44 and 6.46, p. 135). Develop the
  radical, the centre `Z(G)`, the derived group `G_der`, **central isogenies**, and the
  simply connected and adjoint forms: these are not optional for the classification. Prove
  that for reductive `G` the radical is the maximal central torus: over a perfect field
  it is `(Z(G)_red)°`; over an arbitrary field it is the descent of the geometric
  central torus. Prove that descent, rather than assuming reduction over an imperfect
  field commutes with base change (Milne, §19.a, p. 400, and Corollary 17.62(b)–(c), pp. 372–373). Prove
  that `G_der` is semisimple with `G = R(G)·G_der`, and that `Z(G)` is of multiplicative
  type (Conrad, Reductive Group Schemes, Theorem 3.3.4, p. 98, over a field). *Needs:*
  Layer 5's radicals; Layer 4's tori and multiplicative type; Layer 3's quotients.
- **Alternative characterization, linearly reductive:** every f.d. representation is completely
  reducible; the native predicates are `TauCeti.Coalgebra.IsLinearlyReductive` and
  `TauCeti.linearlyReductiveCommHopfAlgProperty` (Milne, Definition 12.52, p. 248).
  ⚠ Reductive groups are **not** linearly reductive in characteristic `p`
  (rational representations are generally not semisimple). The implication from linear
  reductivity of the geometric fibre to reductivity, for smooth geometrically connected
  groups, is supplied by
  `TauCeti.reductiveCommHopfAlgProperty.of_smooth_of_geometricallyConnected_of_baseChange_linearlyReductive`
  and is not restated. The target is the converse in **characteristic 0**: a reductive
  group is linearly reductive, so that reductive ⇔ linearly reductive for smooth connected
  affine groups there (Milne, Theorem 22.42, p. 477; the headline signature is
  `StructureAcceptance.linearlyReductive_of_reductive`), and its corollary that an arbitrary
  affine group of finite type in characteristic 0 is linearly reductive iff `G°` is
  reductive (Milne, Corollary 22.43, p. 478). Over an algebraically closed field of
  characteristic `p`, prove that a **smooth connected affine** group is linearly reductive
  iff it is a torus (Nagata; Milne, Proposition 12.54 and Remark 12.56, pp. 248–249).
  Provide both definitions and the char-0 equivalence so downstream work can pick either.
  *Needs:* Layer 1's comodules; Layer 5's unipotent groups; the supplied implication; the
  Reynolds-operator or Casimir argument for complete reducibility of semisimple Lie algebra
  representations in characteristic zero (LieHighestWeight) for the proof route.

### Examples

**Checks.**
- For `n > 0`, `GLₙ` is reductive but not semisimple: `R(GLₙ) = 𝔾_m` (the scalars) and `R_u(GLₙ) = 1`;
  `G_der = SLₙ`, `Z(SLₙ) = μ_n`, and `SLₙ → PGLₙ` is a central isogeny with kernel `μ_n`:
  `SLₙ` is the simply connected and `PGLₙ` the adjoint form. For n=0, GL₀=1,
  R(GL₀)=1 and GL₀ is semisimple.
- For SL_p in characteristic p, R(SL_p)=1 whereas Z(SL_p)°=μ_p has coordinate
  ring k[ε]/(ε^p). Its reduced neutral component is 1. For GL₂ the maximal central
  torus and reduced neutral centre are both 𝔾_m.
- In characteristic `p`, `SL₂` is reductive but not linearly reductive: the degree-`p`
  binary forms `R_p` have the proper submodule spanned by `x^p` and `y^p` with no
  complement (Layer 10C). In characteristic 0, `R_n` is simple for every `n`.
- `𝔾_a` is neither reductive (`R_u = 𝔾_a`) nor linearly reductive (the standard
  representation `[[1,a],[0,1]]` is indecomposable and not simple). A torus is linearly
  reductive in every characteristic; the constant group `ℤ/p` in characteristic `p` is
  not linearly reductive (its regular representation `k[x]/(x^p − 1) = k[u]/(u^p)` is
  indecomposable), although its identity component is the trivial torus: the criterion
  "`G°` a torus" is for connected groups, or needs `p ∤ |π₀(G)|`.

### Dependencies

Layers 1, 3, 4, 5; the supplied linear-reductivity implication; LieHighestWeight for the
characteristic-zero complete reducibility input.

## Layer 6A: characteristic-zero Levi complements for general affine groups

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
   and rational H-module V consume Layer 1's rational cohomology construction for a flat
   commutative coordinate Hopf algebra and an arbitrary right comodule, specialized to the
   field k; its cofree-resolution, enough-injectives and derived-invariants API consumes the
   native comodule/cofree foundations of Layer 1, and no later relative, spectral or
   arithmetic layer is an input. Preserve its arbitrary-module generality. Transport its
   complex `V ⊗ k[H]^(⊗n)` by the tensor permutation to
   `Cⁿ_alg(H,V)=k[H]^(⊗n)⊗V`, with C⁰=V and tensor unit in degree0.
   Here V^H is defined by `coact(v)=v⊗1`, not only by invariance under H(k). For
   finite-dimensional V construct the identification with regular maps Hⁿ→V; no
   complex of arbitrary functions on H(k) is substituted. With the left point action
   and left-factor-first Hopf convention, the inhomogeneous differential is
   `dc(g₁,…,g_(n+1))=g₁·c(g₂,…,g_(n+1))`
   `+Σ_(j=1)^n(−1)^j c(g₁,…,g_j g_(j+1),…,g_(n+1))`
   `+(−1)^(n+1)c(g₁,…,g_n)`.
   Transport Layer 1's d²=0, H⁰=V^H, coefficient functoriality, connecting maps
   and derived-invariants comparisons through these exact coface/convention maps.
   Construct the normalized-subcomplex comparison and extension-of-field compatibility
   needed here. Consume the native abelian `TauCeti.ComoduleCat` for flat coordinate
   coalgebras and `Comodule.cofree`, `Comodule.Hom.cofreeUnit`,
   `Comodule.Hom.cofreeEquiv` and `ComoduleCat.cofree`; Layer 1 constructs
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
*Needs:* Layers 0–1 (including Layer 1's rational cohomology), 3, 5, 5P and 6; the native
fixed-map lemmas named above.

### Examples

**Checks.**
- For `𝔾_m` acting on `V = 𝔾_a` by weight one, a regular 1-cocycle `a(ts) = a(t) + t·a(s)`
  satisfies `a(1) = 0` and `a(t) = c(t − 1)` for `c = a(t)`'s linear coefficient, which is the
  coboundary of `v = c`: `H¹_alg(𝔾_m, V) = 0`, and the two Levi complements `T` and `uTu⁻¹`
  of the Borel of `GL₂` are conjugate by exactly one `u ∈ U(k)`, since `C_U(T) = 1`.
- For `G = L × 𝔾_a`, every `u ∈ U(k) = k` centralizes `L`, so all conjugators coincide on
  the single complement and `U(k)/C_U(L)(k)` has one element: conjugators are not unique.
- For `U = 1` the theorem returns `L = G = Q` with the trivial extension; for `Q = 1`,
  `G = U` is unipotent and `L = 1`.

### Dependencies

Layers 0–1 (including §1.1), 3, 5, 5P, 6;
the native cofree and fixed-point comodule interfaces.

## Layer 6B: complex reductive coset affineness

- **Complex reductive coset affineness.** For a smooth connected affine reductive
  complex algebraic group A and a closed subgroup H with reductive identity component, construct
  the fpqc quotient A/H and prove it is the affine scheme Spec(O(A)^H).
  Include disconnected H by exact invariants under H° and averaging over the finite
  component group H/H° in characteristic zero (Milne, Corollary 22.43, p. 478).
  Build the Reynolds map using Layer6's characteristic-zero complete reducibility,
  finite generation of the invariant algebra, and the closed-orbit quotient and
  torsor identification; expose the quotient map, universal property and base
  changes at the exact stated hypotheses. In particular apply this to GL_n/G
  for every faithful closed reductive G→GL_n. This is the Matsushima construction
  owned here; FormalConnectionsOpers F6 consumes it and owns its loop-Grassmannian
  reduction-locus/ind-stage application. Keep the general quotient discussion and
  its hypotheses, without asserting arbitrary closed-subgroup quotients affine. The quotient
  sheaf is the native `CommHopfAlgCat.fppfHomogeneousQuotient` and the invariant algebra is
  `TauCeti.HopfIdeal.coinvariants`; the theorem is that the former is represented by `Spec`
  of the latter. *Needs:* Layer 6's characteristic-zero complete reducibility; Layer 3's
  quotient sheaves and torsors; Layer 3A's closed orbits; Layer 1's faithful representations.

### Examples

**Checks.**
- For the disconnected-subgroup extension, `GL₁/O₁ = 𝔾_m/μ₂ ≅ 𝔾_m` via `t ↦ t²`, and `ℂ[t, t⁻¹]^(±1) = ℂ[t², t⁻²]`: the quotient is
  `Spec` of the invariants.
- In that same extension, `GLₙ/Oₙ` is the open affine subscheme of invertible symmetric
  matrices via `g ↦ ggᵗ`: `(gh)(gh)ᵗ=ggᵗ` for h∈Oₙ. For g=diag(2,1) and
  h=[[0,1],[1,0]], both values are diag(4,1), whereas gᵗg and (gh)ᵗ(gh) are
  diag(4,1) and diag(1,4). For n=1 this is the previous check; the zero symmetric
  matrix is excluded when n>0, and for n=0 both quotient and target are a point.
- `SL₂/N⁺` for the unipotent `N⁺` has invariant algebra `k[a, c]` but is the punctured
  plane `𝔸² ∖ {0}`, not `Spec k[a, c] = 𝔸²` (Layer 10D): the reductivity hypothesis on the
  subgroup cannot be dropped.

### Dependencies

Layers 1, 3, 3A, 6; the native homogeneous quotient sheaf and coinvariants.

## Layer 7: structure theory
- **Borel subgroups and maximal tori.** Over an algebraically closed field a Borel
  subgroup is a maximal smooth connected solvable closed subgroup (Milne, Definition 17.6,
  p. 353; natively `TauCeti.HopfIdeal.IsBorelOverAlgClosed`). Prove that any two Borel
  subgroups are conjugate by a rational point and that `G/B` is complete (Milne,
  Theorem 17.9, p. 354). The headline signature is
  `StructureAcceptance.exists_conjugate_eq_of_isBorelOverAlgClosed`, stated for every
  finite-type affine group: its Borel subgroups are those of the smooth identity component
  of its reduction, to which the smooth connected case is applied. Prove that any two
  maximal tori are conjugate (Milne, Theorem 17.10, p. 354) and that any two Borel
  subgroups of a connected reductive group contain a common maximal torus. Prove the Bruhat
  decomposition `G(k) = ⨆_{w∈W} B(k) w B(k)` and the double-coset identification `B\G/B ≃ W`
  here (Milne, §21.h, p. 446; Theorem 21.45, p. 438, for Tits systems). These algebraic
  prerequisites are consumed by Layer 7b. The route to conjugacy is the Borel fixed-point
  theorem for the action of one Borel on the complete variety `G/B'` of another, built on
  Layer 3A's closed orbits and Layer 5's Lie–Kolchin theorem. *Needs:* Layer 5's Lie–Kolchin
  and solvable groups; Layer 3A's orbit theorems; Layer 3's quotients; Layer 4's tori; the
  native Borel predicate and conjugation of Hopf ideals.
- **Parabolic subgroup schemes and Levi decompositions.** For a connected smooth
  affine reductive group of finite type over a field `k`, define its parabolic
  `k`-subgroups `P` as the smooth closed subgroups with `G/P` complete, and prove over `k̄`
  that these are exactly the subgroups containing a Borel (Milne, Definition 17.15 and
  Theorem 17.16, p. 356); define their Levi complements (Conrad–Feng, Definition H.1.1,
  p. 238). Prove that the geometric unipotent
  radical of `P` descends to a smooth connected `k`-split normal subgroup `U`,
  and that a reductive `k`-subgroup `L` exists with `P=L⋉U`. Prove that conjugation
  by `U(k)` acts simply transitively on the Levi `k`-subgroups of this fixed `P`, and that
  every maximal `k`-torus of `P` lies in exactly one of them (Conrad–Feng,
  Proposition 12.3.1, p. 127).
  These targets hold over every field; they include the algebraically closed case.
  Build the cocharacter description `P=P_G(λ)`, `U=U_G(λ)`, `L=Z_G(λ)` and its
  scheme-level comparison with the pointwise dynamic APIs (Conrad, Reductive Group
  Schemes, Theorem 4.1.7, p. 112, for the representability, smoothness and multiplication
  isomorphism of the dynamic subgroups; Conrad–Feng,
  [*Reductive Groups over Fields*](https://math.stanford.edu/~conrad/249BW16Page/handouts/AMSalggroups2.pdf),
  Proposition 12.3.1 and Appendix H).
  Layer 7b owns the additional finite-field intersection, transporter, and rational-point
  comparisons; its common-Levi statements take the specified `F`-stable complement as input.
  *Needs:* the Borel theory above; Layer 5's unipotent radicals; Layer 4's cocharacters and
  tori; Tau Ceti's dynamic point subgroups.
- **Root datum** `(X*(T), Φ, X_*(T), Φ^∨)` of `(G, T)` with its **Weyl group**: do the
  **split** case first (split maximal torus, or work over `k̄`), consuming
  `LinearAlgebra/RootSystem/*` and `GroupTheory/Coxeter/*`; construct the roots as the
  nonzero weights of `T` on `Lie(G)`, the rank-one subgroups `G_α` with their coroots
  (Milne, Theorem 21.11, p. 428), and prove that `N_G(T)/T` is generated by the reflections
  `s_α` and acts on `X*(T)` as the Weyl group of the root datum (Milne, Theorem 21.37,
  p. 435); then add the **absolute root
  datum with Galois action** and the **relative root system** for non-split groups.
  *Needs:* Layer 2's adjoint representation and Layer 4's torus weights; RootSystems
  Layers 1–4; Mathlib's `RootPairing`.
- **Bruhat decomposition** and **BN-pairs / Tits systems** (Milne, Theorem 21.45,
  p. 438). Keep the **dynamic** approach
  to parabolics/Levi/unipotent radical as a route that avoids full root data,
  useful for consumers that require only a BN-pair. *Needs:* the Borel and root-datum
  targets above; Layer 7C's ordered root coordinates for the cells.

### Examples

**Checks.**
- In `SL₂` over `k̄` the Borel subgroups are the stabilizers of lines in `k̄²`. The
  upper- and lower-triangular Borels are conjugate by `w = [[0,1],[−1,0]]`:
  `w [[a,b],[0,d]] w⁻¹ = [[d,0],[−b,a]]`. The quotient `G/B⁺ = ℙ¹` is complete.
- Over `ℝ`, the diagonal torus and `SO₂` are maximal tori of `SL₂` that are not conjugate
  by any element of `SL₂(ℝ)` (one has unbounded, the other compact real points), although
  they become conjugate over `ℂ`: conjugacy of maximal tori needs the algebraically closed
  field.
- `SL₂` has the two Bruhat cells `B` and `BwB = {c ≠ 0}`, matching `|W| = 2`; `GL₃` has
  six cells and exactly four parabolic subgroups containing `B⁺` (`B⁺`, the two
  block-triangular groups and `GL₃`), one for each subset of the two simple roots.
- In the Borel `B = T ⋉ U` of `GL₂` the Levi complements are the conjugates `uTu⁻¹`,
  `u ∈ U(k)`, and `uTu⁻¹ = T` only for `u = 1`: the action of `U(k)` is simply transitive,
  and `T` is the unique Levi complement containing `T`.
- For `(SL₂, T)` with `T = {diag(t, t⁻¹)}`, `X* = ℤe` with `e(diag(t,t⁻¹)) = t`, the root is
  `α = 2e`, the coroot is the identity cocharacter and `⟨α, α∨⟩ = 2`; for `PGL₂` the root
  `α` generates `X*` and `α∨` is twice a generator of `X_*`. The two root data have the
  same Dynkin diagram `A₁` and are not isomorphic.

### Dependencies

Layers 2–5 and 3A; Layer 7C for the ordered coordinates of the cells; RootSystems
Layers 1–4; Tau Ceti's Borel, reductive and dynamic interfaces; Mathlib's root pairings
and Coxeter groups.

## Layer 7C: ordered unipotent factors and the contraction proof of Bruhat coordinates

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

Before this topological step, provide the actual analytic connected/path-connected and locally path-connected adapters for H_w and J_w: apply Layer5P to these smooth closed subgroups and their root Lie subspaces to obtain inverse polynomial maps and their continuous analytic maps. This supplies the relevant Euclidean-space topology directly; no unproved general algebraic-to-analytic connected-component comparison is assumed. The preceding torus/component argument remains a separate proof of the source's algebraic connectedness claim. Construct the analytic homogeneous quotient of H_w×J_w by the actual closed discrete stabilizer Γ of1. Use the preceding surjective local-diffeomorphism orbit map, prove its fibres are stabilizer cosets and construct the quotient identification with U+(C). Give evenly covered neighborhoods using an identity neighborhood V with V^−1V∩Γ={1}. The connected total space is therefore a connected covering of the simply connected U+(C), so Γ is trivial. Apply native [`IsCoveringMap.existsUnique_continuousMap_lifts`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Topology/Homotopy/Lifting.lean#L477) to the identity of the base with its chosen identity lift; use [`IsCoveringMap.eq_of_comp_eq`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Topology/Covering/Basic.lean#L367) on the preconnected total space for the other inverse. Construct the homeomorphism from this data as a 7C.4 target: for a covering map `p : E → X` whose base `X` is simply connected and locally path-connected, whose total space `E` is preconnected, and with a chosen lift `e₀` of a basepoint `x₀`, the unique lift of the identity through `p` sending `x₀` to `e₀` is a two-sided inverse of `p`, by the two cited Mathlib lemmas; conclude that `p` is a homeomorphism. It is not necessary to assume the total space simply connected. Inverting the J coordinate gives the multiplication isomorphism H_w×J_w→U+ as a complex manifold; interchanging H and J gives J_w×H_w as well. The independent exp/log restrictions also show the factors contractible; this is not inferred from simple connectedness of the base. Retain the algebraic alternative check: a zero-dimensional smooth unipotent subgroup is finite étale, and in characteristic zero a finite unipotent subgroup is trivial.

Export regular polynomial inverses, not only analytic bijections. In characteristic zero use the positive-root-height filtration of the nilpotent Lie algebra and its finite BCH polynomial. To invert exp(X)exp(Y), at height1 split log(u) using the A_w/I_w projections; at height r subtract the BCH terms already determined at smaller heights and split the remaining height-r coefficient. Brackets strictly raise height, so the unknown height-r terms enter only as X_r+Y_r. This finite recursion gives polynomial maps with two-sided inverse and T-equivariance equations; repeat in the other order. It uses no presumed product decomposition. Over arbitrary split fields construct the corresponding ordered root-subgroup collection/inverse maps by the root-height filtration and rank-two commutator laws, with additive root-coordinate quotients and explicit parameter recovery; do not divide by factorials there. Prove the root/intersection equality, smoothness and connectedness by those actual maps at that generality. All-field group-form/base-change comparisons remain part of Layer7, not inferred from the C-covering proof.

**7C.5 Stabilizers, cell coordinates and existence without a circular premise.** For the actual right flag quotient G/B+, prove
`Stab_(U+)(n_w B+)=U+∩n_w B+ n_w^−1=H_w`.
The Borel's torus quotient and unipotence eliminate its torus part; prove that comparison on the actual subgroup, not by dimension alone. The orbit is the homogeneous space U+/H_w of right cosets, not generally a quotient group. Use the complement-FIRST factorization J_w×H_w→U+ to construct the isomorphism j↦j n_w B+ onto this orbit. Construct its regular inverse by the actual orbit/fppf quotient and factor maps; a bijection of closed points alone is insufficient. The Lie/root coordinate cardinality gives complex dimension |I_w|=ell(w), and real dimension2ell(w). The complement's left action is simply transitive.

Derive existence from the early rank-one group maps and generation by B+ and the negative simple-root subgroups. The UNION of the candidate B+ n_w B+ double cosets is stable: prove the rank-one multiplication inclusion into the two neighboring indices w,s_i w, then its minimal-parabolic two-cell equality. Individual cells need not be stable under a negative simple subgroup, and s_i w=w never holds for left multiplication in W. The union contains1 and is stable under the generating subgroups, so covers G. This is a proof of the covering, not an invocation of the final Bruhat theorem. For disjointness, the coordinate orbit above has exactly one T-fixed point: conjugation on J_w and the positive cocharacter force j=1. Distinct normalizer classes have distinct points n_w B+, using N_G(T)∩B+=T. Thus the candidate orbits have unique Weyl labels. Fix one lift n_w per label; arbitrary lifts are not intrinsically unique. The unique expression g=j n_w b now follows with j∈J_w, b∈B+. Construct right/left quotient and Borel-opposition transport before applying this convention to SchubertGeometry's negative-Borel cells.

Export the parabolic projection to G/P+ with its actual minimal W/W_P representatives, stabilizer/root subsets, affine coordinates and fibre maps; compare P/Q orbits with W_P\W/W_Q without treating different coset conventions as equal labels. In typeA give the actual upper-unipotent/upper-triangular reduction, block-parabolic flag and Grassmannian maps with their universal subspaces. The GL2 big-cell map is a↦u(a)n_0B+, or equivalently u(a)B−; u(a)B+ is constant. On P1 with the line model B+ stabilizing[e1], the former chart is a↦[a:1], with inverse x/y on y≠0. Keep this explicit rank-one chart and the A2 factor-order and non-normal-stabilizer regressions as Checks below. The generic flag CW/cohomology and coherent-line comparisons stay at their existing LieGroups/Schubert owners.
*Needs:* Layers 2–5 and 5P; Layer 3A's orbit theorems; Layer 7's root subgroups and
Borel theory; RootSystems Layers 1–4; Mathlib's covering-map lifting lemmas.

### Examples

**Checks.**
- In type `A₁`, `W = {e, s}`: `H_e = U⁺`, `J_e = 1`, `H_s = 1`, `J_s = U⁺ = U_α`; the big
  cell chart is `a ↦ u(a) n₀ B⁺`, with `u(a) B⁺` constant.
- In type `A₂` with `w = s₁`, `H_w` has the roots `α₂` and `α₁ + α₂` and `J_w = U_(α₁)`,
  so `|I_w| = ℓ(w) = 1`; the subgroup `H_(w₀ w)` has the root `α₂` and overlaps `H_w`,
  so it is not the complement.
- The rank-one identity at `a = b = 1`: `x_α(1) x_(−α)(1) = [[2,1],[1,1]]`, and
  `x_(−α)(1/2) α∨(2) x_α(1/2) = [[1,0],[1/2,1]] · [[2,1],[0,1/2]] = [[2,1],[1,1]]`.
- For `w = s₁s₂` in `A₂`, `A_w = {α₂}` and `H_w = U_(α₂)` is not normal in `U⁺`:
  `x_(α₁)(1) x_(α₂)(1) x_(α₁)(−1) = x_(α₂)(1) x_(α₁+α₂)(±1) ∉ U_(α₂)`. So `U⁺/H_w` is a
  homogeneous space and not a quotient group, and `J_w × H_w → U⁺` is a bijection of
  varieties, not a semidirect product with `H_w` normal. For `w = s₁`, by contrast,
  `H_(s₁) = U_(α₂)U_(α₁+α₂)` is normal with quotient `U_(α₁)`.

### Dependencies

Layers 2–5, 5P, 3A and 7; RootSystems Layers 1–4; Mathlib's covering-map lifting and
uniqueness lemmas.

## Layer 7a: finite fields, Frobenius and rational points

This layer owns Lang's theorem for the `q`-Frobenius, its quotient and `H¹` consequences,
and the abstract fixed-coset lifting lemma; Layer 7g owns their extension to Steinberg
endomorphisms. Nothing in this layer is imported from a roadmap that consumes this one.

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
schemes, and functoriality on these finite groups.

**Lang's theorem.** For a smooth geometrically connected affine group scheme `G₀` of finite
type over `F_q`, with `q`-Frobenius `F` on `G = G₀ ×_{F_q} k`, the Lang map `G(k) → G(k)`,
`x ↦ x⁻¹F(x)`, is surjective; so is `x ↦ xF(x)⁻¹`, by composing with inversion. Route: let
`G` act on itself by `(x, g) ↦ g⁻¹xF(g)`; an orbit of minimal dimension is closed (3A.4),
its twisted stabilizer is finite, and the dimension-of-fibres theorem gives orbit
 dimension dim G. Indeed, write f(g)=xF(g)x⁻¹, choose m with F^m fixing x, and put
 y=xF(x)⋯F^(m−1)(x). Then f^m=Int(y)F^m; y is fixed by F^m and has finite order r,
 so f^(mr)=F^(mr), whose fixed points are finite. Thus Fix(f) is finite.
 Since G is irreducible, its closed full-dimensional orbit is all of G
(Milne, Theorem 17.96, p. 383, whose Steinberg endomorphisms include the `q`-Frobenius by
Definition 17.95, p. 382). Derive the consequences: `H¹(F_q, G₀) = 1` for Galois cohomology
with coefficients in `G₀(k)`; every `F`-stable `G(k)`-torsor has a fixed point; and for an
exact sequence `1 → G' → G → G'' → 1` of smooth groups over `F_q` with `G'` geometrically
connected, `G(F_q) → G''(F_q)` is surjective. *Needs:* 3A.4's closed orbits; SchemeAndStackFoundations §0.7's dimension-of-fibres
theorem; finiteness of Frobenius fixed points above; Layer 0's points comparison.

**Fixed-coset lifting.** Let `H` be a group, `σ` an automorphism of `H` and `J ≤ H` a
`σ`-stable subgroup, not necessarily normal, on which `x ↦ x⁻¹σ(x)` is surjective. Prove
that every `σ`-stable left coset `hJ` (one with `σ(h) ∈ hJ`) contains a `σ`-fixed element,
and that `H^σ/J^σ → (H/J)^σ` is a bijection: if `σ(h) = hj`, choose `x ∈ J` with
`j = xσ(x)⁻¹`, so that `σ(hx) = hx`; and if `h, h' ∈ H^σ` with `h' = hj` then `σ(j) = j`.
This abstract argument proves the stated group-level generalization of Dudas–Michel,
Lemma 7.6(i), p. 25; its separate H¹ comparison in (ii) requires normality, whereas
this coset bijection does not. Apply this with `H = G(k)`, `σ = F` and `J = P(k)` for every `F`-stable closed subgroup
`P` to which Lang's theorem applies. For every
F-stable closed subgroup used by this layer, prove the application adapter: finite type,
smoothness, geometric connectedness, and compatibility of its restricted Frobenius with the
q-Frobenius structure. Establish these hypotheses separately for each
parabolic, unipotent radical, or connected centralizer to which the theorem is applied. Smoothness
is retained as an explicit hypothesis and a convenient adapter condition; this makes no
claim that point-level Lang fails for nonsmooth connected groups. *Needs:* Lang's theorem
above; Layer 3's closed subgroups; Layer 7's parabolics and Levis for the applications.

Consume
`FiniteTypeCommHopfAlgCat.baseChangePointsMulEquiv` for the comparison
`G₀×_{F_q}k`-points `≃ Hom_{F_q}(O(G₀),k)` when `k/F_q` is a field extension.
Identify `G₀(F_q)` with `Hom_{F_q}(O(G₀),F_q)` by the points functor. The `q`-power
map is `F_q`-linear on `F_q`-algebras. For a `ℤ`-model, identify the iterated prime-power
point map with this construction.

### Examples

**Checks.**
- For 𝔾_a over 𝔽₂ and θ∈𝔽₄ with θ²+θ+1=0, the Lang value is
  θ²−θ=1 and the derivative of t²−t is 1. By contrast, t↦t² on 𝔾_m
  in characteristic 2 is surjective with derivative 0 and stabilizer μ₂; arbitrary orbit
  maps need not be separable. The q-power convention is the one in x⁻¹F(x).
- For the disconnected constant C₂, Frobenius is the identity and every
  Lang value is 1; the other element is missed.
- The trivial group has one Lang value, 1, and its unique coset has a fixed lift.
- Fixed-coset lifting needs its hypothesis: in `H = F̄_qˣ` with `σ` the `q`-power map,
  `q` odd, and `J = {±1}`, the Lang map of `J` is `x ↦ x^(q−1) = 1` and misses `−1`; the
  coset `{a, −a}` with `a^(q−1) = −1` (so `a ∈ F_(q²) ∖ F_q`) is `σ`-stable, since
  `σ(a) = −a`, and contains no `σ`-fixed element. With `J = H` the hypothesis holds by
  Lang's theorem for `𝔾_m` and the unique coset is `H`.
- For `G = SL₂` over `F_q`, `|G^F| = q(q² − 1)`, finite; the Borel `B⁺` is `F`-stable with
  `B⁺(F_q)` of order `q(q − 1)`, and `(G/B⁺)^F = ℙ¹(F_q)` has `q + 1` points, equal to
  `|G^F|/|B⁺(F_q)|`, as fixed-coset lifting predicts.

### Dependencies

Layers 0 and 3 for the point comparison and subgroup hypotheses; Layer 3A and SchemeAndStackFoundations §0.7 for
the proof of Lang's theorem; Layer 7 for the reductive examples.

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
and compatibility proved in this layer. (Dudas–Michel, Propositions 8.7 and 8.9, pp. 31–32.)
*Needs:* Layer 7's parabolics, Levis and Bruhat decomposition; Layer 7a's rational points;
Tau Ceti's dynamic point subgroups.

### Examples

**Checks.**
- In `GL₃` let `P` stabilize `⟨e₁⟩` and `Q` stabilize `⟨e₂, e₃⟩`, with common Levi
  `L = M = diag(GL₁, GL₂)` containing the diagonal torus. Then `P ∩ Q = L`, the three
  unipotent factors `L∩V`, `M∩U`, `U∩V` are trivial, and `(P∩Q)·U = P` is parabolic with
  Levi `L`.
- For `P = Q = B`, the formula gives `P ∩ Q = T ⋉ U` with `L∩M = T` and `U∩V = U`; for
  opposite Borels `P = B⁺`, `Q = B⁻` sharing `T`, `P ∩ Q = T` and all unipotent factors are
  trivial.
- In `GL₂`, `P = B⁺` with Levi `L = T` and `Q = uB⁻u⁻¹` with Levi `M = uTu⁻¹`, for
  `u = [[1,1],[0,1]]`: `L ∩ M` is the centre, which contains no maximal torus, so the
  common-torus hypothesis fails; and indeed `P ∩ Q` is the stabilizer of the lines `⟨e₁⟩`
  and `u⟨e₂⟩ = ⟨e₁ + e₂⟩`, the two-dimensional torus `M` itself, whereas the right side of
  the factorization, `(L∩M) ⋉ 1`, is one-dimensional: the hypothesis cannot be dropped.

### Dependencies

Layers 7 and 7a; Dudas–Michel §8.

## Layer 7c: Harish–Chandra functors and biadjunctions

Let `Λ` be a commutative ring in which `p` is invertible, and let `P=L⋉U` be an
`F`-stable parabolic with `F`-stable Levi complement. Work in the categories of all left
modules over the finite group algebras (equivalently, Mathlib's `Rep Λ G^F` and
`Rep Λ L^F` at `[CommRing Λ]`); the finitely generated and finite-dimensional subcategories
are consequences where their hypotheses apply. Define

    R^G_{L⊂P}(M) = Λ[G^F/U^F] ⊗_{Λ L^F} M
    *R^G_{L⊂P}(N) = Λ[U^F\G^F] ⊗_{Λ G^F} N ≃ N^{U^F}.

The first permutation module is a `(ΛG^F,ΛL^F)`-bimodule; the second is a
`(ΛL^F,ΛG^F)`-bimodule. The actions of `L^F` come from `P^F=L^F⋉U^F`. Prove the displayed
invariant identification using the averaging idempotent
`e_U=|U^F|⁻¹∑_{u∈U^F}u`. Prove that rational points of each connected unipotent radical form a finite p-group; hence
`p∈Λˣ` implies `|U^F|∈Λˣ`.

First prove the induction-side adapter, naturally in every left `ΛL^F`-module `M`:

    Λ[G^F/U^F] ⊗_{ΛL^F} M ≃
      Ind_{P^F}^{G^F}(Inf_{L^F}^{P^F} M).

The left side uses the right `L^F`-action on `G^F/U^F`; the right side is ordinary
finite-group induction from `P^F`. Use `P^F=L^F⋉U^F` and the section/cocycle model for
nontrivial `M`. The restriction-side adapter identifying
`Λ[U^F\G^F] ⊗_{ΛG^F} N` with `N^{U^F}` is proved in Layer 7d, where it is first used.

Prove inflation/invariants adjunctions, exactness, and the finite-index biadjunctions

    R^G_{L⊂P} ⊣ *R^G_{L⊂P} ⊣ R^G_{L⊂P}.

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
formula is subgroup index times the dimension of M, by
`TauCeti.finrank_indFDRep`. For S₃ and its order-two subgroup with the trivial
one-dimensional module, the dimensions are 3=3·1. For nontrivial `M`, a coset-function presentation of induction must use the section
cocycle; the coset permutation action itself carries only the trivial module.
(Dudas–Michel, Definition 9.2, p. 35, and Proposition 9.4, p. 36.) *Needs:* Layers 7a–7b; Mathlib's
`Rep.ind` adjunctions; Tau Ceti's `indFDRep` and `finrank_indFDRep`.

### Examples

**Checks.**
- For `GL₂(F_q)` with `P = B`, `L = T`, Harish–Chandra induction of the trivial `T^F`-module
  is the permutation module on `G^F/B^F`, of dimension `q + 1`; Harish–Chandra restriction of
  the trivial `G^F`-module is the trivial one-dimensional `T^F`-module.
- `|U^F| = q` for the Borel of `GL₂`, so `Λ = ℤ[1/p]` carries the idempotent
  `e_U = q⁻¹ Σ_u u`; over `Λ = F_p` it does not exist, and the invariants/coinvariants
  comparison fails: `p ∈ Λˣ` cannot be dropped.
- For `L = G`, `U = 1`, both functors are the identity and the biadjunction is trivial.

### Dependencies

Layers 7a–7b; Mathlib's induction and coinduction adjunctions; Tau Ceti's finite-dimensional
induction.

## Layer 7d: rational transport and the specialized Mackey theorem

For `F`-stable Levis `L,M` in `F`-stable parabolics `P,Q`, define `ad_x(V)` for an `M`-module as the `xMx⁻¹`-module with action
`(xmx⁻¹)·v := m·v`; use this direction throughout. Define

    S(L,M) = {x∈G | L∩xMx⁻¹ contains a maximal torus of G}.

Prove the geometric transporter equivalence `L\S(L,M)/M ≃ P\G/Q` and the rational
bijection

    L^F\S(L,M)^F/M^F ≃ P^F\G^F/Q^F.

The rational proof consumes Layer 7a's Lang theorem and fixed-coset lifting, after Layers
7a/7b establish their exact finite-type, smooth,
geometrically-connected, F-stable subgroup and restricted-Frobenius hypotheses. It also uses
the fixed-point/orbit and component-group lemmas of this layer, and connectedness of the actual
stabilizers `P∩xQx⁻¹` and `L∩xMx⁻¹`. Prove both smoothness and geometric connectedness of
each stabilizer, as required by Layer 7a's Lang adapter; do not infer either property from
equality of point groups. Consume Layer 7b's intersection and restricted-Frobenius facts.

Use the source permutation-bimodule route for the parabolic Mackey theorem. Reuse Layer 7c's
induction-side adapter and prove the restriction-side bimodule equivalence

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
compatibility with the pinned conjugation convention. This supplies parabolic Mackey from explicit bisets.
(Dudas–Michel, Theorem 9.6, p. 37, and Lemmas 9.9–9.11, pp. 38–39.) *Needs:* Layers 7a–7c.

### Examples

**Checks.**
- In `GL₂` with `L = M = T` and `P = Q = B`, `S(T, T) = N_G(T)`, so `L\S(L,M)/M = W`
  has two elements, as does `B\G/B`; the rational version matches `B^F\G^F/B^F`, which has
  the two orbits `{B^F}` and its complement in the `q + 1` points of `G^F/B^F`.
- For `u = [[1,1],[0,1]]`, `T ∩ uTu⁻¹` is the centre of `GL₂`, which contains no maximal
  torus, so `u ∉ S(T, T)` and contributes no Mackey term.
- Mackey for `L = M = T` in `GL₂` gives `*R ∘ R(θ) ≅ θ ⊕ θ^w`, of dimension two: the
  `U^F`-invariants of the `(q + 1)`-dimensional principal series are two-dimensional,
  one for each Bruhat cell.

### Dependencies

Layers 7a–7c; Dudas–Michel §9.

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
(Dudas–Michel, Theorem 10.1, p. 41; Howlett–Lehrer; Dipper–Du.) *Needs:* Layers 7a–7d.

### Examples

**Checks.**
- For `L = G` both functors are the identity and the isomorphisms are identities.
- In `GL₃` with `P`, `Q` the stabilizers of a line and of a plane and common Levi
  `diag(GL₁, GL₂)`, the two permutation modules have the same dimension `q² + q + 1`
  (points and lines of `ℙ²(F_q)`), consistent with the theorem; `P^F` and `Q^F` are not
  conjugate in `G^F` (the worked example below), so the isomorphism is not induced by a
  conjugation.
- In `GL₂`, the two Borels `B⁺`, `B⁻` containing `T` are conjugate by the Weyl element
  `w ∈ G^F`, so there the common-Levi isomorphism is the conjugation isomorphism; a proof
  that only used conjugacy of `P` and `Q` would stop at `GL₂` and fail for `GL₃`.

### Dependencies

Layers 7a–7d.

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
*Needs:* Layers 7c and 7e; Tau Ceti's `indTrivialEquiv` and `indTrivialIso`;
InductionRestriction Layer 2.1.

### Examples

**Checks.**
- For `S₃`, `H = ⟨(12)⟩` and `g = (12)`: `g` fixes exactly one of the three cosets of `H`
  (it swaps `(13)H` and `(23)H`), so the left side is `1 · 2 = 2`; the right side is
  `|C_G(g)| · |g^G ∩ H| = 2 · 1 = 2`.
- For `g = 1` the identity reads `|G/H| · |H| = |G| · 1`.
- `GL₃(F_2)`, of order `168`, has the two index-seven subgroups `P^F` and `Q^F` of the
  worked example, of order `24` each; they are not conjugate but have the same permutation
  character, the classical smallest instance of nonconjugate almost-conjugate subgroups.

### Dependencies

Layers 7c and 7e; InductionRestriction Layer 2.1.

## Layer 7g: Steinberg endomorphisms and extension of Layers 7a–7f

Let `σ:G→G` be a surjective algebraic-group endomorphism of a connected reductive group over
an algebraic closure of a finite field. A Steinberg endomorphism here means that some positive
power `σ^m` is the geometric Frobenius attached to an `F_{q′}`-structure on `G`. State the
characteristic, finite-type, smoothness, and connectedness assumptions; include diagram
automorphism twists and special isogenies only when this power condition is proved. Prove point
and algebraic compatibility needed to construct the finite group `G^σ`. For each stable closed
subgroup `H`, specify the restricted endomorphism `σ|_H` and verify that its positive power is
the restricted geometric Frobenius from the induced `F_{q′}`-structure. Layer 7a's Lang theorem
covers only the `q`-Frobenius; the Lang–Steinberg theorem for every Steinberg endomorphism
(Milne, Definition 17.95 and Theorem 17.96, pp. 382–383) and its restricted-subgroup
applications are targets here.

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

Layer 9's pinned Chevalley–Demazure groups supply explicit inputs, but do not by themselves
discharge the Steinberg fixed-point and representation-theory targets. *Needs:* Layers 7a–7f;
Layer 9's pinned groups and special isogenies.

### Examples

**Checks.**
- For `Sp₄` in characteristic two with `τ² = Frob₂`, the endomorphism `σ = τ^(2m+1)`
  satisfies `σ² = Frob_(2^(2m+1))`, so it is a Steinberg endomorphism and `G^σ` is finite.
- For `SL₃` the composite of the graph automorphism with `Frob_q` squares to `Frob_(q²)`
  and has fixed group `SU₃(q)`.
- On a positive-dimensional connected group, the identity endomorphism is not a Steinberg endomorphism: no power of it is a Frobenius,
  and its fixed group `G(F̄_p)` is infinite; conjugation by a rational point has finite
  order and fails for the same reason. On the trivial group, the identity is its
  Frobenius and its fixed group has exactly one element.

### Dependencies

Layers 7a–7f and 9.

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

## Layer 8: split groups and pinnings

### 8.1 Split reductive data

A split reductive group over a nonempty affine base is a smooth affine group scheme of finite
presentation with connected reductive geometric fibres, together with a split maximal
 torus T≃D_S(M) for a finite free lattice M. Require the roots and
 coroots to be constant sections of M and M∨ and each root space to be free of rank one.
 These conditions are part of the relative split datum, even on disconnected bases. Over fields use Layer 6's predicate; over rings use the
native relative Hopf predicate through Layer 0's dictionary. This specifies input data,
not existence for a given root datum (Conrad, Definition 5.1.1, p. 136).

**API.**
- Isomorphisms of split data identify the maximal tori and their character lattices.
- Base change to a nonempty base retains the specified torus and its splitting,
  including nonreduced bases; over the empty base the group is empty and the root datum
  cannot be recovered from its fibres.
- The root datum retains both lattices and the central directions, not just a Dynkin diagram.

**Checks.**
- A split torus of rank r has X=Y=ℤʳ and no roots; r=0 gives the trivial group.
- In SL₂, the root is twice the fundamental weight; in PGL₂, the root generates X.
  The common A₁ diagram therefore does not determine the split datum.
- Base-changing SL₂ from ℤ to 𝔽₂ gives dimension 3 and centre μ₂ of length 2;
  the definition does not require the centre to be smooth.

### 8.2 Pinnings

A pinning of split data is a positive system in the constant root datum, its associated
Borel containing T, and a generator of each simple-root line; equivalently use the corresponding normalized simple-root
parameterizations. Transport these data under isomorphism and base change (Conrad,
Definition 6.1.1 and Remark 6.1.2, pp. 186–187). Existence and classification are Layer 9D's targets.

**API.**
- A pinned isomorphism preserves the torus, Borel and every labelled simple-root parameter.
- Base change takes each chosen root-line generator to the corresponding generator.
- Changing generators rescales the parameters; their labels and scalars are retained.

**Checks.**
- For SL₂, x_α(t)=[[1,t],[0,1]] has tangent E₁₂; over ℤ/4 it still has tangent E₁₂.
- Over ℚ, x_α(2t) has tangent 2E₁₂ and gives a different pinning.
- For a torus the simple-root index set is empty; a pinning adds no root vectors.
- Over Spec(k×k), taking B⁺ on one SL₂ component and B⁻ on the other gives signs
  (+,−), not a single constant positive system; such a Borel is not a pinning of the
  fixed constant root datum.

### Examples

The A₁ construction uses its full root datum and the pinning data above, constructs
SL₂/ℤ in 9B, then classifies the result in 9D. Its classification is not an input
to its construction.

### Dependencies

Layers 0, 4, 6 and Layer 7's root datum and root subgroup constructions; the native
relative reductivity predicate; RootSystems Layers 5–6.

## Layer 9: pinned Chevalley–Demazure group schemes over `ℤ`

This lane is the exception to the standing "work over a field `k`" hypothesis: its whole
point is a group scheme over `ℤ` that is then base-changed. It is narrower than the relative
theory of Layer 9D because it constructs the split case over `ℤ`. This construction serves a
specific prerequisite rather than generalizing the relative theory, and it must not wait
behind pseudo-reductive groups.

Finite groups of Lie type are the fixed points of a Steinberg endomorphism on the
`𝔽̄_p`-points of a pinned simply connected group, or on an explicit carrier identified with
those points; Chevalley existence alone specifies no carrier, so this layer constructs the
pinned group schemes and, in 9B, the explicit carriers and special isogenies.
The root data start from `DynkinType.simplyConnectedRootDatum` in [the root-systems
roadmap](../RepresentationTheory/RootSystems/README.md). Layer 7g supplies the Steinberg
fixed-point and representation-theory interfaces that consume them.

#### 9A. The full reductive integral enveloping form

Fix a finite reduced root datum `(X, Φ, Y, Φ∨, ⟨−,−⟩)` with its perfect
character/cocharacter pairing and positive roots. Pinned group outputs use §§8.1–8.2;
the rational Lie algebra and its root vectors are constructed below. Use the actual free
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
   [LieHighestWeight Layer7](../RepresentationTheory/LieHighestWeight/README.md)
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
   On the actual ordered cover of9A.1a, let A be
   `TauCeti.BilinForm.isometryGroup` of the integral lattice form. Its members
   preserve the norm-2 shell, hence act on the roots by the norm-shell theorem.
   For A₁, the maps n↦n and n↦−n both preserve B(1,1)=2, whereas n↦2n
   gives B(2,2)=8 and is not an isometry. For the empty lattice A is trivial. Construct the subgroup of
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
   and its simple-generator equations. For an unbased root automorphism use
   [RootSystems4A](../RepresentationTheory/RootSystems/README.md)'s actual
   Weyl/based factorization, while retaining the character ambiguity and
   any multiplication defect of separately chosen lifts. Export transport
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
   group comparison. The definitions, maps, inverses and basic laws below are the
   specification.

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
   [LieHighestWeight Layer7](../RepresentationTheory/LieHighestWeight/README.md).

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

   **Exceptional fixed algebras, types and components.** For the pinned D₄
   triality automorphism and E₆ diagram involution of the rational signed Lie
   algebra, construct their fixed Cartan and signed-orbit root decomposition.
   Prove that the normalized folded simple positive and negative vectors
   generate the entire fixed Lie algebra and satisfy the Serre relations of
   G₂ and F₄, respectively. Identify the oriented Cartan matrices and the
   root/coroot maps. Combine generation with the split-field Serre
   injectivity comparison to obtain Lie algebra isomorphisms over ℚ, and
   prove compatibility with changes of root indexing and pinning.
   *Needs:* 9A.1a's integral bracket and norm-shell theorem; 9A.1b's
   signed invariant vectors and normalized folded generators; RootSystems'
   finite root realizations; LieHighestWeight Layer 7's Serre comparison.

   **Checks.**
   - D₄ has 24 roots; triality has 6 fixed roots and 6 root orbits of size 3,
     giving 12 invariant root lines and a 2-dimensional fixed Cartan: 12+2=14.
   - E₆ has 72 roots; reversal has 24 fixed roots and 24 paired root orbits,
     giving 48 invariant root lines and fixed Cartan dimension 4: 48+4=52.
   - The identity on D₄ fixes all 24 root lines and its rank-4 Cartan, hence
     dimension 28, not 14. Dimension alone does not prove generation.

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
   basis.

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

The integral straightening/basis construction in 9A is an input to the following
explicit group construction. Its proof does not assume 9C's distribution
comparison for a group that is still being constructed.

#### 9B. Pinned groups and their explicit carriers

Use the split data and pinnings of §§8.1–8.2 as the output specification.
- **The Chevalley–Demazure construction.** For each root datum, an explicitly constructed
  split reductive group scheme over `ℤ` realizing it, via a Chevalley basis and the Kostant
  `ℤ`-form of the enveloping algebra. Constructed, not asserted to exist.
- **Base change** along `ℤ → k` for any commutative ring `k`, and the compatibility of the
  pinning with it.
- **Root subgroup maps.** `x_α : 𝔾_a → G` for each root `α`, the Chevalley commutator
  relations they satisfy, and the equations pinning them against the pinning. Downstream
  work states its conventions against these, so they are part of the interface, not an
  implementation detail.

##### 9B.1 Integral open cells

For the constructed pinned split reductive ℤ-group G, form U⁺ and U⁻ from
the ordered positive and negative root groups. Construct the open immersion
U⁻×T×U⁺→G, (u₋,t,u₊)↦u₋tu₊, its image Ω and its inverse on Ω. Prove
the two inverse equations, independence of root ordering as subgroup schemes,
and arbitrary-base-change compatibility (Conrad, Reductive Group Schemes,
Theorem 5.1.13, pp. 143–145). For each Weyl element choose a reduced word
and its representative n_w from the pinned factors x_α(1)x_(−α)(−1)x_α(1).
Prove that the opens n_wΩ cover G: each geometric fibre is covered by its
opposite Bruhat cells, and the cell indexed by w lies in n_wΩ. This is a
scheme-open cover, not a union formula for points over arbitrary rings.
*Needs:* §9A's integral construction; §9B's root groups and torus;
Layer 7's field Bruhat decomposition and the root-coordinate products.

- The inverse supplies unique root coordinates and a torus coordinate on Ω.
- Left translation by n_w⁻¹ followed by that inverse supplies the chart on n_wΩ.
- Over a local ring A an A-point lies in one chart, because an open of
  Spec A containing the closed point is all of Spec A.

**Checks.**
- In SL₂, Ω=D(a) for g=[[a,b],[c,d]]; the inverse gives u₋(c/a),
  diag(a,a⁻¹), u₊(b/a). Their product has lower-right entry (1+bc)/a=d.
- The other Weyl translate is D(c). The identity ad−bc=1 gives (a,c)=A,
  so one is a unit over a local ring. All 48 determinant-one matrices over
  ℤ/4 satisfy this test.
- For root-free data Ω=T=G. Over ℤ, [[2,1],[3,2]] has determinant 1
  but neither 2 nor 3 is a unit, excluding a single-chart assertion for all rings.

##### 9B.2 Central quotients and realizations

For Ψ=(X,Φ,Y,Φ∨), let Λ⊂X have finite index and contain ℤΦ. Restrict
the coroot pairings to Λ and put Y_Λ=Hom(Λ,ℤ). Construct the root datum
Ψ_Λ and the central isogeny f:G_Ψ→G_Λ inducing Λ↪X on characters.
Its kernel is the diagonalizable group D(X/Λ); its torus restriction is
D(X)→D(Λ), and it identifies corresponding root subgroup parameters.
Prove finite flatness and the fppf quotient identification, compatible with
arbitrary base change (Conrad, Theorem 6.1.16(1), pp. 196–197 and §6.1's
central-kernel criterion). For a matrix realization D, prove its scheme kernel
is D(X/Λ) and its represented image is this quotient before making this
comparison: finite-index weight span alone is not a kernel theorem.
*Needs:* §9A's full weight lattices; §9B's pinned construction; Layer 4's
contravariant diagonalizable-group dictionary; Layer 3's fppf quotients.

- The scheme kernel retains its nonreduced fibres.
- Unchanged root parameters give surjectivity on the elementary subgroups
  over every commutative ring.
- The image of the torus, and hence of roots together with the torus, retains
  the obstruction to lifting points through D(X)→D(Λ).

**Checks.**
- For Λ=X the quotient lattice is zero, D(0)=1 and f is an isomorphism.
- For SL₂→PGL₂, Λ=2ℤ⊂ℤ=X gives kernel μ₂; diag(2,1) represents a
  rational PGL₂ point of determinant square class 2 with no SL₂(ℚ) lift.
- In characteristic 2 that kernel has algebra k[t]/((t−1)²), of length 2
  despite its single geometric point. For t↦t² on 𝔾_m the same index and
  kernel calculation holds with no roots.

##### 9B.3 Pinned comparison

An isomorphism of based root data of two pinned split reductive ℤ-groups
induces a unique pinned group isomorphism. Its torus character map is
contravariant and its simple root parameters are unchanged under the matching
of roots. Prove identity, composition and arbitrary-base-change compatibility
(Conrad, Theorem 6.1.17, p. 197). Compare matrix realizations by their actual
torus characters and pinned simple root maps after identifying their coordinate
Hopf ideals. *Needs:* §9B's pinned construction; Layer 7's root extraction and §§8.1–8.2's split data and pinnings; §9B.2's full lattices.

- Equality on torus characters and pinned simple root maps determines the comparison.
- The inverse datum isomorphism induces the inverse group isomorphism.
- A realization with full weight lattice gives the same pinned model once its
  defining Hopf ideal has been identified.

**Checks.**
- The identity datum fixes every torus character and x_α(a).
- In SL₂(ℚ), conjugation by diag(2,1/2) sends x_α(a) to x_α(4a);
  preserving T and B does not suffice to preserve the pinning.
- SL₂ and PGL₂ have Dynkin type A₁ but lattices of index 2; the central
  isogeny of §9B.2 is not an isomorphism of these pinned groups.

##### Elementary subgroups and further pinned constructions

- **Elementary generators and all ring points.** For each commutative ring A,
  define E_G(A) inside the constructed G(A) as the subgroup generated by
  all x_α(a), and GE_G(A) as the subgroup generated by E_G(A) and T(A).
  Here T(A) denotes the image of the pinned torus embedding in G(A).
  Use native subgroups of Layer0's same points group, with inclusions and
  ring-functorial restrictions compatible with all base-change maps. Prove
  `t x_α(a) t⁻¹=x_α(α(t)a)`, so T(A) normalizes E_G(A) and
  GE_G(A)=E_G(A)T(A). Use §9B.1's integral Weyl-translated chart cover:
  the chart Ω=U⁻D(X)U⁺ has its actual inverse, and each translate uses
  a Weyl representative built from `x_α(1)x_(−α)(−1)x_α(1)`.
  Derive GE_G(k)=G(k) over every field, agreeing with9B.1, and extend
  this to every local ring A: the closed point of Spec A lands in one
  translated chart, so the entire A-point factors through that open;
  its chart coordinates lie in E_G(A)T(A). Over a general commutative
  ring retain GE_G(A) as a subgroup of the represented whole points group.
  Compare the canonical faithful matrix realization as a closed immersion,
  whose kernel on A-points is trivial. For a realization D identified with
  §9B.2's quotient, with ℤΦ⊂Λ(D)⊂X of finite index, use its central isogeny and scheme kernel
  D(X/Λ(D)); prove it maps E_G(A) onto E_(G_D)(A), while recording the
  induced torus/GE image without asserting pointwise surjectivity.
  In SL₂(ℚ)→PGL₂(ℚ), the nonsquare determinant classes in ℚˣ/(ℚˣ)²
  detect this distinction despite generation of both field-points groups
  by their roots and whole tori.

  *Needs:* §9B.1's open cells and integral Weyl representatives; §9B.2's
  central quotient and root-parameter equations; Layer 0's point groups.

  **Checks.**
  - For the root-free torus 𝔾_m over ℚ, E_G(ℚ)={1} and GE_G(ℚ)=ℚˣ;
    the element 2 requires the torus generators.
  - In SL₂(ℤ/4), [[0,1],[3,0]] lies in D(c) and is the standard Weyl
    word x_α(1)x_(−α)(−1)x_α(1), so the identity cell alone is insufficient.
  - In SL₂→PGL₂ over ℚ, each root parameter lifts unchanged, while the
    torus class of diag(2,1) does not lift. Elementary surjectivity and
    surjectivity of all rational points are distinct claims.

- **Points over an algebraically closed field** as a group, functorially in the field, so
  that a field endomorphism induces a group endomorphism of the points. The `q`-power
  Frobenius is the case a consumer asks for first.
- **Diagram automorphisms.** Apply §9B.3 to a based diagram automorphism;
  its unique pinned group automorphism has the specified action on simple root
  parameters. No additional isomorphism theorem is needed.
- **Special isogenies in characteristics two and three.** For `B₂ = C₂` and `F₄` in
  characteristic two and `G₂` in characteristic three, construct the exceptional isogeny `τ`
  of the pinned group scheme over the prime field `𝔽_p`, with `τ² = Frob_p`, exchanging the
  long and short root subgroups. Write `γ ↦ γ'` for the length-swapping bijection of the
  roots induced by the diagram symmetry of the Dynkin diagram with the arrow reversed. The
  pinning equations are `τ(x_β(t)) = x_(β')(t)` for a long root `β` (so `β'` is short) and
  `τ(x_α(t)) = x_(α')(t^p)` for a short root `α` (so `α'` is long); on characters `τ*` sends
  a short root to the corresponding long root and a long root to `p` times the corresponding
  short root, and `τ` restricted to the torus is the map dual to this lattice endomorphism.
  Prove multiplicativity, the equations on all root subgroups and the square relation
  `τ² = Frob_p`, and that the kernel of `τ` is the infinitesimal subgroup scheme whose Lie
  algebra is the short-root ideal below. This is a statement about group schemes and belongs
  here rather than in any consumer. The three carriers on which it is constructed are:
  1. the rank-two symplectic carrier, where `τ` is the native
     `TauCeti.SpStd.specialIsogeny`, with `SpStd.specialIsogeny_specialIsogeny` the square
     relation and `SpStd.specialIsogeny_rootSubgroupPoints_inl_zero`,
     `specialIsogeny_rootSubgroupPoints_inl_last`, `specialIsogeny_rootSubgroupPoints_inr_zero`
     and `specialIsogeny_rootSubgroupPoints_inr_last` the pinning equations on the four
     numbered simple root subgroups, in exactly the exponent convention above; it acts on
     the four-dimensional subquotient `ker φ ⧸ ⟨ω⟩` of the exterior square of the standard
     module by `2×2` minors;
  2. the short-root `G₂` carrier over `𝔽₃`: the closed subgroup scheme of `GL₇` over `𝔽₃`
     generated by the reductions modulo three of the root subgroups and torus of the Kostant
     toral closure of the seven-dimensional module `V(ϖ₁)` (the admissible lattice generated
     from a highest weight vector by the divided-power lowering operators of 9A);
  3. the short-root `F₄` carrier over `𝔽₂`: the closed subgroup scheme of `GL₂₆` over `𝔽₂`
     generated the same way from the toral closure of the twenty-six-dimensional module
     `V(ϖ₄)`, whose integral form has a rank-two zero-weight summand; an ordered integral
     weight basis, including a basis of that summand, is part of the data.
  For the `G₂` and `F₄` carriers construct `τ` as follows. Let `V` be the module, `𝔤 ⊂ End V`
  the represented Chevalley Lie algebra (the span of the Chevalley basis matrices) and
  `I ⊂ 𝔤` the short-root ideal, spanned by the short root vectors and the short coroots; `I`
  is an ideal exactly in characteristic `p`, where the short coroots span a line for `G₂`
  and a plane for `F₄`. Prove that `I` is stable under the carrier, that `𝔤 ⧸ I` has the long
  roots as weights with the zero weight of the same multiplicity as in `V`, and fix a linear
  identification `C : 𝔤 ⧸ I ≃ V` relabelling weights along `τ*`, with each basis vector
  normalized against the numbered pinning. Then `τ(g)` is the matrix of `g` acting on
  `𝔤 ⧸ I`, read back in `V` through `C`; since `det g = 1`, `g⁻¹` is the adjugate and every
  entry of `τ(g)` is a polynomial in the entries of `g`. Prove that `τ` preserves the
  carrier's points, is multiplicative, satisfies the pinning equations on the numbered simple
  root subgroups and squares to Frobenius, by computation or structurally. The prime field is
  the base because the isogeny exists only in characteristic `p` and because the closed
  subgroup scheme generated over `𝔽_p` by the reduced root subgroups and torus is only known
  to be contained in the base change of the integral toral closure, non-flat base change
  possibly adding equations. *Needs:* 9A's Chevalley lattice, divided powers and admissible
  lattices; 9B's pinned root subgroups and torus; Layer 3's closed subgroup schemes and
  kernels; Layer 2's Lie algebra; the native rank-two symplectic carrier.
- **Explicit carriers with numbered symmetries.** Construct the toral-closure carriers
  that have no native counterpart: the short-root `G₂` and `F₄` carriers above, and the tripled
  `D₄` carrier, the toral closure of `8ᵥ ⊕ 8ₛ ⊕ 8꜀` inside `GL₂₄`, carrying triality as a
  numbered symmetry, a signed permutation of the weight basis permuting the three summands,
  the way the doubled `E₆` carrier `V(ϖ₁) ⊕ V(ϖ₆)` inside `GL₅₄` carries its graph
  automorphism. The spin module alone cannot carry triality linearly, because triality
  permutes the three eight-dimensional representations and fixes none of them, nor their
  sum `8ₛ ⊕ 8꜀`. Each carrier comes with its numbered simple root subgroups, weight torus,
  pinning equations against `DynkinType.simplyConnectedRootDatum`, Frobenius, and the span
  statement that its weights generate the full character lattice (for the short-root
  modules because the short roots of `G₂` and `F₄` generate the root lattice, which is the
  weight lattice there). *Needs:* 9A's admissible lattices and 9B's pinned construction;
  Layer 7g's Steinberg endomorphisms for the fixed-point consumers.

  **Checks.**
  - On characters of `B₂` with short simple root `α` and long simple root `β`,
    `τ*(α) = β` and `τ*(β) = 2α`, so `(τ*)²` is multiplication by `2` on both, the action of
    `Frob₂`; on root subgroups, `x_β(t) ↦ x_(β')(t) ↦ x_β(t²)` and
    `x_α(t) ↦ x_(α')(t²) ↦ x_α(t²)`, again `Frob₂`.
  - In `G₂`, two short roots at angle `60°` have a long sum and Chevalley constant `±3`
    (the `a`-string through `b` is `b − 2a, b − a, b, b + a`), so the span of the short root
    vectors and short coroots is a Lie ideal exactly in characteristic three; in `F₄` the
    corresponding constant is `±2` (the string is `b − a, b, b + a`), giving characteristic two.
  - The tripled `D₄` carrier has dimension `24 = 8 + 8 + 8`, and none of the three
    eight-dimensional summands has a zero weight; triality permutes the summands
    cyclically, so each of its weight orbits has size three, whereas a diagram symmetry
    preserving the vector summand `8ᵥ` is the fork exchange, of order at most two.

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
*Needs:* 9A's integral form and basis; 9B's big cell; Layer 0's Hopf maps; Layer 10A's
rational torus modules for the contraction functor.

### Examples

**Checks.**
- For `G = 𝔾_m` with cocharacter generator `y`, `Dist_ℤ(G)` is the binomial algebra on `H_y`
  and `binom(H_y, 2)` acts on the weight `3` by `binom(3, 2) = 3`; the answer is not `ℤ`.
- In the Kostant form of `SL₂`, `E^(1)E^(1) = 2E^(2)` and the opposite-root rule at
  `a = b = 1` reads `EF = FE + H`, the relation `[E, F] = H`.
- In characteristic `p`, the Frobenius map on `Dist(SL₂)` sends `E^(p)` to `E^(1)` and
  `E^(1)` to `0`; the first Frobenius kernel has distribution algebra of dimension `p³`,
  spanned by `F^(a) binom(H, b) E^(c)` with `a, b, c < p`.

### Dependencies

Layers 0, 2, 3, 4 and Layer 7's field structure theory; §§8.1–8.2 only; RootSystems Layers 5–6; LieHighestWeight Layers 3–4 and 7;
IntegralLattices; Tau Ceti's Kostant form, Serre presentation and Geck constructions.

## Layer 9D: classification, relative groups and forms
- The **isomorphism** and **existence theorems**: split reductive groups ↔ root data
  (Conrad, Reductive Group Schemes, Theorems 6.1.16–6.1.17, pp. 196–197, over any
  non-empty base; Milne, Theorem 23.25, p. 492, for the isogeny theorem over a field);
  classification of split semisimple groups up to central isogeny by Dynkin diagrams,
  and of split simply connected or adjoint semisimple groups up to isomorphism (Milne,
  Theorem 23.58, p. 501); central isogenies and the isogeny theorem; Chevalley existence,
  realized by Layer 9's construction over `ℤ` (Milne, Theorem 23.74, p. 511). *Needs:*
  Layer 7's root data; §§8.1–8.2's split data and pinnings; Layer 4's diagonalizable groups for the central
  kernels; Layer 9's split models; RootSystems Layers 5–6 for the Dynkin classification.
- **Relative reductive groups over an affine Noetherian base.** For `S=Spec R`, `R`
  any commutative Noetherian ring, a reductive S-group means a smooth affine group scheme
  of finite presentation with connected reductive geometric fibers; semisimple means all
  those fibers are semisimple. Transport the native relative reductivity predicate to scheme group objects and prove
  that comparison. Consume its isomorphism invariance and arbitrary base change at their
  full commutative-ring generality. Define the semisimple fibre predicate and prove its
  isomorphism and base-change invariance; prove products and fpqc descent for both
  predicates with the actual comparison maps. Construct the relative center and derived subgroup, prove
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
  classification of split pinned models over connected bases and the isomorphism, base
  change and pinning-change equations. Extend the field-level subgroup/quotient and multiplicative-type comparisons of
  Layers3–4 to these bases in this lane: use the supplied sheaf coequalizers and effective
  affine descent, and prove the representability statements for these group constructions,
  with their base-change maps. Field-only quotient results do not imply these relative
  theorems. Use Layer0's actual affine/Hopf dictionaries and the independent Layer9 split
  integral models. This relative extension is not a prerequisite of Layer9.

  For each fixed split reductive model G₀ over S, construct its automorphism sheaf and its
  inner/outer and pinned-automorphism interfaces, and the actual `Isom(G₀,G)` torsor.
  Prove the equivalence between étale forms of G₀ and torsors under this automorphism sheaf
  by effective affine descent, with inverse functors and the resulting nonabelian H¹
  classification. Use SchemeAndStackFoundations §1.1 and §§1.13–1.15 and ModularCurves §0E
  for the sheaf, torsor and effective affine descent operations; prove their
  compatibility with the specified group automorphism and Isom sheaves here. This classifies forms with that specified split type; it asserts
  no chosen global splitting or Borel on every base. Include a nonsplit real torus and
  SL₂ versus PGL₂ as tests of the Galois/root-datum and global-form distinctions.
  (Conrad, Reductive Group Schemes, Definition 3.1.1, p. 81, for the fibrewise definition;
  Theorem 3.3.4, p. 98, for the centre of multiplicative type and the reductive quotient;
  Theorems 6.1.16–6.1.17, pp. 196–197, for the relative isogeny and isomorphism theorems.)
  *Needs:* Layer 0's dictionaries and base change; Layers 3–4 for the field-level
  comparisons; Layer 9's split integral models; SchemeAndStackFoundations §1.1,
  §§1.13–1.15 and ModularCurves §0E.

- **Pseudo-reductive basic theory over arbitrary fields.** For any field k, start with
  smooth connected affine finite-type k-groups. Construct the maximal smooth connected
  normal k-unipotent subgroup `R_(u,k)(G)`, its uniqueness, characteristicity, functorial
  isomorphism transport and represented quotient, using Layer3 quotients and Layer5's
  unipotent constructions. Define pseudo-reductive to mean this subgroup is trivial.
  Prove reductive implies pseudo-reductive and equality of the two notions over perfect
  fields. For a finite separable extension K/k, prove that the k-unipotent radical commutes
  with extension to K, hence pseudo-reductivity is preserved and reflected by that
  extension. Do not claim pseudo-reductivity survives arbitrary inseparable extension. Identify the radical
  after algebraic closure and the obstruction to descending it. Keep the schematic center
  without an unproved smoothness assertion.

  Consume the finite-locally-free affine Weil-restriction construction, point adjunction,
  products and base change of ModularCurves §0F. Transport the represented
  unit functor and its multiplication/inverse through Layer 0's Hopf dictionary. For every nontrivial finite purely
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
  (Conrad–Feng, *Reductive Groups over Fields*, Appendix F: the definition of
  pseudo-reductivity and Proposition F.5.10, p. 218; Theorem F.3.7, p. 208, for the
  compatibility of the `k`-split unipotent radical with separable extensions; Conrad–Gabber–Prasad,
  *Pseudo-reductive Groups*, 2nd ed., Definition 1.1.1 and Proposition 1.1.9, for the
  separable-extension compatibility of `R_(u,k)`.) *Needs:* Layer 3's quotients; Layer 5's
  unipotent groups; Layer 0's Hopf dictionary; ModularCurves §0F for Weil restriction.

### Examples

**Checks.**
- `SL₂` and `PGL₂` over `ℤ` realize the simply connected and adjoint root data of type `A₁`;
  the isomorphism theorem distinguishes them although their Dynkin diagrams agree, by the
  index-two lattice inclusion of 9B.2–9B.3.
- Over `ℝ` the split torus `𝔾_m` and the norm-one torus `x² + y² = 1` have the same
  geometric root datum (rank one, no roots) and are classified as forms of `𝔾_m` by
  `H¹(Gal(ℂ/ℝ), Aut(𝔾_m)) = H¹(ℤ/2, ℤ/2) = ℤ/2`: exactly two forms, the split and the
  anisotropic one.
- For `K = k(a^(1/p))`, `Res_(K/k) 𝔾_m` has dimension `p`, `k`-points `Kˣ`, and after base
  change to `k̄` becomes `(k̄[t]/(t^p))ˣ = 𝔾_m × (1 + nilradical)`, with unipotent kernel of
  dimension `p − 1`; the `k`-unipotent radical is trivial, so the group is pseudo-reductive
  and not reductive. For `K = k` it is `𝔾_m`, reductive.
- The centre of `SL_p` in characteristic `p` is `μ_p`, nonsmooth, while the centre of
  `GL_p` is the smooth torus `𝔾_m`: the relative centre is of multiplicative type but not
  always smooth. For SL₂ over ℤ[ε]/(ε²), every geometric fibre has
  dimension 3 and the group is reductive; the base itself is nonreduced.

### Dependencies

Layers 0, 3, 4, 5, 7, 8.1–8.2 and 9; RootSystems Layers 5–6; SchemeAndStackFoundations §1.1 and
§§1.13–1.15; ModularCurves §§0E–0F.

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

#### 10B. Induction, Weyl modules and simple heads

For a split connected reductive G over a field fix B⁺ and its opposite B⁻,
with positive roots from B⁺. Consume Layer 1.1's cotensor induction and adapters: the equalizer for the
coordinate bialgebra map, its native comodule coaction and natural reciprocity maps,
specialized to k, in the convention `f(gh)=h⁻¹f(g)` with left translation.
Construct the field regular-function and group-scheme dictionaries and identify counit
evaluation in Frobenius reciprocity. The induced/Weyl/highest-weight and integral
applications are this layer's. Put `∇(λ)=Ind_(B⁻)^G k_λ`: its functions satisfy
`f(gb)=λ(b)^(−1)f(g)` and G acts by `a·f(g)=f(a^(−1)g)`. For λ∈X⁺ prove
finite dimensionality, highest weight λ and its one-dimensional B⁺-highest
line, and simple socle L(λ). For λ∉X⁺ prove the corresponding induced module
zero. Construct `Δ(λ)=∇(−w₀λ)*`, its distinguished generating highest line,
unique simple head L(λ), and the normalized nonzero map Δ(λ)→∇(λ) with image
L(λ). Prove the classification of finite-dimensional rational simples by X⁺,
absolute simplicity and End_G(L(λ))=k for split G (Milne, Theorem 22.2 and
22.4–22.5, pp. 463–464; Proposition 22.27 and Theorem 22.48, pp. 470 and 479,
transported from B⁺ to B⁻ by the longest Weyl element for the induced-module convention). Give arbitrary-field base
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
not an implicit self-duality assertion.

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
B⁺-stable line k δ_(x^(p−1)y) shows uniqueness can fail. Give proper submodules for positive multiples
of p and treat the zero-degree exception separately. Root and torus action
formulas, dual-basis signs and all source exercises are applications of the same
rational category.

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
[GroebnerGeometry G5](../GroebnerGeometry/README.md)'s
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
*Needs:* Layer 1's comodules and cotensor induction; 9A–9C's integral form and
distributions; 10A–10C; GroebnerGeometry G5 for the flag-minor comparison.

### Examples

**Checks.**
- For `SL₂` in characteristic `p`, `dim L(p) = 2` (digits `n₀ = 0`, `n₁ = 1`, so
  `(0 + 1)(1 + 1) = 2`) while `dim ∇(p) = p + 1`: `∇(p)` is not simple.
- `∇(0) = Δ(0) = k`; for `n < 0`, `∇(n) = 0`, as `H⁰(ℙ¹, O(n)) = 0` for the corresponding
  line bundle.
- The Steinberg module of `SL₂` is `L(p − 1) = ∇(p − 1) = Δ(p − 1)` of dimension `p`, which
  is `p^|Φ⁺|` with `|Φ⁺| = 1` and also the digit formula `(p − 1) + 1`.

### Dependencies

Layers 1, 4, 7 and 9; LieHighestWeight Layers 3–4; GroebnerGeometry G5; SchubertGeometry
only as a consumer.

---

## Layer 11: regular-semisimple spectral quotients and finite Weyl monodromy

This lane constructs the Lie-algebra spectral quotient and its based topology for every
connected reductive algebraic group over `ℂ`, with a specified maximal algebraic torus.
Construct it after Layers 9 and 9D have supplied the group/root-datum and pinned root maps.
The classical topology, complex-manifold charts, complex Lie-group structure on
`G(ℂ)`, holomorphic action maps and orbit comparisons are Layer 3A.5's; the
analytic inverse function theorem used below is Mathlib's `ContDiffAt.to_localInverse` at
order `ω` on finite-dimensional complex charts. The algebraic classification and integral
construction have no dependency on this lane, and no roadmap that consumes Layers 0–9 is a
supplier of it. The finite-arrangement construction in 11B is independent of the group
application and runs once RootSystems' finite Coxeter presentation is available. All of
11A–11G below is normative.

**11A. Plane configurations, geometric braids and their basepoints.** This roadmap owns the
based comparison between the plane configuration spaces and the native braid group. Use
subtype topology on `PConf_n(ℂ)={z:Fin n→ℂ | Function.Injective z}` and quotient
topology on `Conf_n(ℂ)=PConf_n(ℂ)/S_n`; no discrete topology on `Finset ℂ` is intended.
The elementary carriers are `PlaneBraidAcceptance.OrderedPlane` and
`PlaneBraidAcceptance.UnorderedPlane`. Permutations act by `(σ·z)_i=z_(σ⁻¹ i)` via
`PlaneBraidAcceptance.permute` and `PlaneBraidAcceptance.planePermutationAction`.
The standard points are `PlaneBraidAcceptance.planeBase` and
`PlaneBraidAcceptance.unorderedBase`; `PlaneBraidAcceptance.plane_braid` states
existence of the based group equivalence on these carriers.

**API.**
- The action preserves distinctness, and the quotient identifies exactly permutation orbits.
- The subtype and quotient topologies make the order-forgetting projection continuous.
- The chosen ordered basepoint projects to the chosen unordered basepoint for every n.

**Checks.**
- For n=0 the ordered and unordered configurations are points and the braid group is 1;
  for n=1 both configuration spaces are ℂ and their fundamental groups are 1.
- For n=2 the base tuple is (0,1); the transposition sends it to (1,0), with the same
  unordered image. The tuple (0,0) fails injectivity and is excluded.
- For n=3, (012) sends (0,1,2) to (2,0,1); using the permutation rather than its inverse
  would give (1,2,0) and reverse the stipulated left action.

Give evenly covered neighborhoods using
pairwise disjoint coordinate discs and the free finite `S_n` action, so that
`PConf_n(ℂ)→Conf_n(ℂ)` is a finite covering map.

Choose an actual ordered base configuration, for example `z_i=i`, and its unordered image.
Prove the generator-characterized based isomorphism `π₁(Conf_n(ℂ),[b]) ≃ TauCeti.BraidGroup n`:
the standard generator `σ_i` is the class of the loop exchanging `z_i` and `z_(i+1)` by a
counterclockwise half-turn about their midpoint while fixing the other points; its image
under the native `BraidGroup.permHom n` is the adjacent transposition, and its square is the
class of the loop in which `z_(i+1)` encircles `z_i` once counterclockwise. Prove that the
induced map on the ordered cover identifies `π₁(PConf_n(ℂ),b)` with the native
`BraidGroup.pureSubgroup n` and the covering permutation with `permHom`. Route: the
forget-last-point map `PConf_n(ℂ)→PConf_(n−1)(ℂ)` is a locally trivial fibration with fibre
the plane minus `n−1` points, which deforms onto a wedge of circles; induct to prove the
ordered spaces aspherical with the pure braid presentation, pass to the `S_n`-cover and
compare the adjacent exchanges with the Artin relations, both generation and completeness
of the relations being targets (Birman–Brendle, arXiv math/0409205v2, §1.1 (1) and §1.2 (2),
pp. 4–5, for the definitions and the covering sequence, and p. 69 for the Fox–Neuwirth
presentation theorem; Fox–Neuwirth, *The braid groups*, Math. Scand. 10 (1962), 119–126,
§7, pp. 123–126, and Fadell–Neuwirth, *Configuration spaces*, Math. Scand. 10 (1962),
§II, pp. 111–112). *Needs:* Mathlib's fundamental group, covering maps and `IsQuotientCoveringMap`;
Tau Ceti's braid group, `permHom` and `pureSubgroup`; AlgebraicTopology's based van Kampen
theorem.

For a lifted loop, its coordinate graphs in `ℂ×[0,1]` are collision-free strands; evaluation
of such strands gives the inverse loop. Prove both constructions respect endpoint
permutations and relative homotopies. Pin multiplication: Mathlib's fundamental-group
product is `p*q=q.trans p`. Choose strand stacking to match that product and check an
explicit product of two elementary half-twists; if another stacking convention is used,
construct the time-reversal/opposite-group comparison. The positive half-twist is the
counterclockwise exchange above; prove the permutation square after this convention is
fixed. Closure and Markov equivalence are not substitutes for this based loop/strand theorem.

Prove the exact sequence
`1→P_n→B_n→S_n→1`. It is nonsplit for `n≥2` (`PlaneBraidAcceptance.permutation_nonsplit`): the sign of native `permHom` is the parity of
native `ArtinGroup.exponentSum`. A homomorphic section would lift a transposition to an
order-two element, whose integer exponent sum is zero, contradicting odd parity. Prove
the sign/exponent equation on generators and extend by native homomorphism extensionality.
For n=2 the map is ℤ→C₂ by parity, its kernel is 2ℤ, and a section would send
 the nonidentity to an integer m with 2m=0 and odd parity, impossible.
No generic Artin torsion-freeness theorem is needed. The quotient is trivial for `n=0,1`.
Do not confuse this sequence with the pure forget-last-point sequence, which has a plane
section. Do not apply a covering theorem requiring simply connected total space to
`PConf_n(ℂ)`, which is not simply connected for `n≥2`.

**11B. The finite Weyl-arrangement theorem.** Start with a finite reduced crystallographic
real root pairing and a base, and its complexified root-hyperplane complement. Give the
chosen finite-dimensional realization, duality and real form explicitly; an identification
of a Cartan dual `𝔱*` with the Cartan requires an explicit linear-duality map.
Standard-coordinate prototypes consume native `rootPairingBaseChange` with its actual
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
complex complement: specify its cells by real arrangement faces with incident chambers,
construct a good open-star cover and its contractible intersections, and prove the
homotopy or sufficient two-skeleton comparison using the based van Kampen and CW-cell
interfaces of [AlgebraicTopology](../AlgebraicTopology/README.md). In the quotient, prove
there is one vertex, one oriented one-cell for each simple wall and exactly the rank-two
alternating-word relations of length `m_ij`. Both generation and completeness of the
relations are targets. This gives a generator-characterized based isomorphism
`π₁(B_W,[b]) ≃ TauCeti.ArtinGroup (coxeterMatrixOfBase P base)` at a specified chamber point,
with explicit basepoint-change transport for any other basepoint.

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
setting. Construct all scheme morphisms before comparing their complex points via
Layer 3A.5's charts and point-map comparison. Prove the coarse orbit-space homeomorphism
`𝔤_rs/G ≃ₜ 𝔱_reg/W`. This is a coarse quotient; the stack `[𝔤_rs/G]` retains torus inertia.

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
`(X mod 𝔱,Y)↦[X,t]+Y`; prove it is an isomorphism and apply Mathlib's analytic inverse
function theorem (`ContDiffAt.to_localInverse` at order `ω`) in the 3A.5 charts. A
set-theoretic orbit bijection alone does not prove these statements.

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

**11G. Prerequisite and scope comparisons.** The order is 11A's configuration/native
braid comparison and RootSystems' Coxeter/chamber theory → finite arrangement topology;
independent RG8/9 and the 3A.5 complex Lie-group dictionary → 11C invariant/spectral
maps; RG7+LG8 flag cells →
homogeneous-fiber connectedness and simple connectedness; the based DGF LES → the
`χ_rs`-induced π₁ isomorphism; finite cover → actual root-datum monodromy. LHW Lie invariants
and RIT finite invariants enter 11C with the explicit comparisons stated there. No edge
returns to those lower targets. This constructs Lie-algebra regular-semisimple topology
over `ℂ`; it does not assert the corresponding statements for group-element toric
arrangements, disconnected groups, bad characteristic, compact-normalizer splittings,
infinite or affine Weyl arrangements, or arbitrary complex reflection groups. Their
carriers and hypotheses are different. In particular a list of all braid lengths3 is
not the full B3 presentation, whose short/long pair has length4.

References for these constructions include Brieskorn's finite-reflection-complement
presentation, Salvetti's face/chamber model, Birman–Brendle's survey for the configuration
space definition of the braid groups, and the based covering and van Kampen
contracts cited above. The arrangement presentation and all comparison maps remain
construction targets until proved; references are not replacements for those proofs.

### Examples

**Checks.**
- For `𝔰𝔩₂`, `𝔱_reg = {diag(t, −t) : t ≠ 0} ≅ ℂ*`, `W = ℤ/2` acts by `t ↦ −t`, the
  quotient `B_W ≅ ℂ*` via `t ↦ t²`, and `π₁(B_W) = ℤ` is the Artin group of `A₁`, free on one
  generator; the characteristic polynomial `X² − t²` has discriminant `4t²`, so the base is
  exactly `{t² ≠ 0}`.
- For `𝔤𝔩₂`, `𝔱_reg = {z₁ ≠ z₂}` and `B_W = Conf₂(ℂ) ≅ ℂ × ℂ*` by the centroid and
  `(z₁ − z₂)²`, so `π₁ = ℤ = B₂`, and the pure subgroup is generated by the square of the
  half-twist, matching the `n = 2` case of 11E.
- The regular nilpotent `[[0,1],[0,0]]` in `𝔤𝔩₂` has centralizer `{aI + bN} ≅ ℂ* × ℂ`, not a
  torus, so it is regular but not regular semisimple; the scalar matrix `I` is semisimple with
  centralizer `GL₂`, so it is not regular. Only `𝔤_rs` has torus centralizers.

### Dependencies

Layers 2, 3A, 7, 8 and 9; RootSystems Layer 2; LieHighestWeight Layer 7;
ReflectionInvariantTheory; AlgebraicTopology; DGFloer Layer 1.2; LieGroups Layer 8;
SmoothBundlesConnections B1.4; Mathlib's covering-map, fundamental-group and
inverse-function theorems; Tau Ceti's braid and Artin groups.

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
In Suggested.lean, `SpecialLinearAcceptance.determinantRelation` is the actual
polynomial det(X)−1 and `SpecialLinearAcceptance.exists_coordinatePresentation`
asserts existence of the algebra equivalence with both generator equations.
The native determinant-kernel construction and polynomial quotient are defined
also for n=0 and n=1.

**Checks.**
- At n=0 the empty determinant is 1, so the relation is 0 and the algebra is ℤ.
- At n=1 the relation is x−1, so x maps to 1 and the algebra is ℤ.
- At n=2 the relation is ad−bc−1. Over ℤ/4 the matrix with rows (1,1),(0,1)
  has determinant 1; its inverse has upper-right entry −1=3, testing the antipode sign.
*Needs:* native SL coordinate algebra and its coordinate map; polynomial
quotients and the universal property of determinant localization (Milne,
Algebraic Groups, §2.a, the matrix-group coordinate descriptions).

## Conventions in examples

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
those points: [CFSGStatement](../CFSGStatement/README.md) consumes Layer 9's pinned groups,
the special isogenies and the three explicit carriers of 9B, which its carrier plan
designates; its milestone L5 needs constructions rather than existence theorems.
ReductiveGroupsPartII extends this roadmap and consumes Layers 0–9, in particular Layer 7a's
Lang theorem and fixed-coset lifting. FormalConnectionsOpers consumes Layers 0–9 and 6B's
coset affineness; InverseGaloisAndArithmeticFundamentalGroups consumes Layers 0, 3 and 6;
NilpotentOrbits and SchubertGeometry consume Layer 3A's orbit theorems and Layer 7's
structure theory.

IntegralHeckeAndGaloisDeterminants §0.7 consumes Layer 1.1's arbitrary-base rational
cohomology, cotensor induction and antipode dictionary. ComplexComparisonPartII
C-1.1 consumes Layer 3A.5's classical topology and smooth charts; its analytic
ring-sheaf construction and coherent comparisons retain the nilpotent structure
that the point topology forgets. Their comparisons identify the point carriers
by the identity on X(ℂ), including scheme maps, restrictions and fibre products.

## References

- J. S. Milne, [*Algebraic Groups* (2017)](https://www.jmilne.org/math/Books/iAG2017.pdf),
  Propositions 1.65–1.66, pp. 26–27; §3 (Hopf ideals), §4 (the embedding theorem), §5
  (quotients), §6 (radicals), §9 (Jordan decomposition), §10.b–§10.e, pp. 188–196, §12
  (diagonalizable and linearly reductive groups), §14 (unipotent groups), §16 (Lie–Kolchin),
  §17 (Borel subgroups, Lang's theorem), §21 (root data and Bruhat), §22 (Theorem 22.42) and
  §23 (isogeny, isomorphism and existence theorems), at the theorem numbers and pages cited in
  the layers.
- B. Conrad and T. Feng, [*Reductive Groups over Fields*](https://math.stanford.edu/~conrad/249BW16Page/handouts/AMSalggroups2.pdf),
  Proposition 12.3.1, p. 127; Appendix F (pseudo-reductive groups), pp. 208–218; Appendix H
  (Levi subgroups), p. 238.
- J. S. Birman and T. E. Brendle, [*Braids: a survey*](https://arxiv.org/abs/math/0409205),
  arXiv math/0409205v2, §§1.1–1.2, pp. 4–5, and p. 69.
- R. H. Fox and L. Neuwirth, *The braid groups*, Math. Scand. 10 (1962), 119–126; E. Fadell
  and L. Neuwirth, *Configuration spaces*, Math. Scand. 10 (1962), 111–118 (cited by title).
- W. C. Waterhouse, *Introduction to Affine Group Schemes*: Hopf algebras, comodules,
  closed subgroups, the unipotent radical.
- A. Borel, *Linear Algebraic Groups*; T. A. Springer, *Linear Algebraic Groups*.
- J. C. Jantzen, *Representations of Algebraic Groups*.
  For Layer 1.1, *Representations of Algebraic Groups I*, SFB/MPI 85-9 (1985),
  §§3.3–3.9 and 4.2–4.16, pp. 53–60 and 69–79a,
  [institutional preprint](https://archive.mpim-bonn.mpg.de/id/eprint/607/1/preprint_1985_9.pdf);
  page numbers there differ from the published editions.
- A. Grothendieck and M. Raynaud, *Revêtements étales et groupe fondamental (SGA 1)*,
  [revised edition, arXiv:math/0206203v2](https://arxiv.org/abs/math/0206203v2),
  Exposé XII, §§1.1–1.2 and Propositions 2.1, 3.1–3.2, pp. 239–247.
- B. Conrad, [*Reductive Group Schemes*](https://math.stanford.edu/~conrad/papers/luminysga3.pdf),
  Theorems 5.1.13 and 6.1.16–6.1.17, pp. 143–145 and 196–197;
  **SGA3**, Exposé XIX.
- B. Conrad, O. Gabber, G. Prasad, *Pseudo-reductive Groups*, 2nd ed., Definition 1.1.1 and
  Proposition 1.1.9 (the `k`-unipotent radical and separable extensions).


## Design references

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

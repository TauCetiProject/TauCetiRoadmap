# Roadmap: reductive algebraic groups

**Summary.** Build the general theory of reductive algebraic groups from native
Hopf algebras, schemes and comodules: orbit geometry, structure and classification,
pinned integral groups, rational highest weights, and regular-semisimple spectral
monodromy. The library includes nonsmooth finite-type groups where appropriate and
retains every characteristic in its integral and reductive structure theorems.

## Scope and ownership

This roadmap owns the algebraic-group dictionaries, general orbit geometry, the
structure and classification targets, and the integral, representation-theoretic
and spectral constructions in Layers 0–11. The integral construction is made for the full root
datum: Layer 9 builds the pinned split reductive group scheme over `ℤ` of every finite reduced
root datum, arbitrary central tori and isogeny types included. The SL polynomial presentation of
9B.4 concerns the existing determinant-kernel coordinate algebra; it introduces no second SL group.
Layer 7a owns Lang's theorem for the `q`-Frobenius of a smooth geometrically connected
group over a finite field and the fixed-coset bijection `H^σ/J^σ ≃ (H/J)^σ`, built on the pinned
fixed-lift lemma; Layer 9E owns their Steinberg-endomorphism extension. Layer 1.1 owns rational
cohomology over flat commutative Hopf algebras, the comparison of comodule invariants with
point-fixed vectors, and the exactness, transitivity and points description of cotensor
induction, whose construction and reciprocity are pinned, together with their rational
group-scheme adapters; the point-representation/comodule equivalence itself is pinned. The topology on
the points of a scheme with values in a topological algebra is a pinned Tau Ceti carrier, the
chart topology `TauCeti.SchemePointTopology.topology` built on the affine evaluation topology
`TauCeti.PointTopology.topology`, with the topological group of points of an affine group;
with values in `ℂ` it is the classical topology on complex points. It is consumed in Layer 3A.5,
which owns what that library does not state. For every local topological algebra `R` whose
units are open with continuous inversion, Layer 3A.5 proves that affine open charts are open
embeddings of point spaces, that scheme morphisms act continuously, that open and closed
immersions give open and closed embeddings, and that separated, locally finite-type and
finite-type schemes have Hausdorff, locally compact and second-countable points under the
corresponding hypotheses on `R` (3A.5b). For `R = ℂ` it proves the fibre-product, reduction and
proper comparisons for every locally finite-type `ℂ`-scheme (3A.5c), constructs the smooth charts
of every smooth `ℂ`-scheme (3A.5d) and the complex Lie-group structure on `G(ℂ)` for every group
scheme `G` of finite type over `ℂ`, affine or not, with its tangent dictionary in the affine case
(3A.5e), and proves the holomorphic orbit-map and stabilizer comparisons (3A.5f). Layer 3A.5 is
the single owner of these objects; Layer 11 consumes them. ReductiveGroupsPartII RG2.0.1 states
the general-`R` comparisons again under its own names; it is a consumer of Layer 3A.5, not a
second supplier of them. LieGroups Layer 7's lower analytic dictionary (the subspace topology
and complex atlas on `G(ℂ) ⊂ GL(V)(ℂ)` for a smooth connected affine reductive `G` with a
faithful closed immersion `G → GL(V)`, and its tangent algebra identified with Layer 2's
`Lie(G)`) is the affine reductive case of 3A.5e, which differs only in allowing every group
scheme of finite type over `ℂ`; 3A.5e proves that the two complex structures agree, and LieGroups
Layer 7 is a consumer of 3A.5e, not a second supplier of it.
ComplexComparisonPartII C-1.1 builds its scheme analytification on the complex points and owns
the identification of the analytification's underlying space with this topology; for
3A.5c–3A.5e it is a consumer. FormalConnectionsOpers §2.4 consumes 3A.5c–3A.5d, and its §4.3
consumes 3A.5e and transports it to the Hopf-point carrier; no target of FormalConnectionsOpers
is an input here. SchubertGeometry S9 consumes 3A.5c–3A.5d and 3A.5f for its flag varieties.
Layer 11A owns the topological ordered and unordered configuration spaces of `n` points of the
plane and of the open unit disc, the homeomorphism of the plane onto the disc and the
`S_n`-equivariant homeomorphisms it induces between them, the based comparison identifying the
fundamental group of the unordered plane configuration space with the native
`TauCeti.BraidGroup n` (Artin's theorem), and the identification of the ordered cover with
`TauCeti.BraidGroup.pureSubgroup n` and of its covering permutation with
`TauCeti.BraidGroup.permHom`. GeometricTopology Layer 4.2.8 consumes these. Configuration spaces
of a general Hausdorff space and the algebraic configuration schemes over `ℤ` are not owned
here. The special isogenies of the
short-root `G₂` and `F₄` carriers and the tripled `D₄` carrier with its triality are pinned Tau
Ceti declarations (supplier contracts); Layer 9B owns their identification with the pinned
simply connected group schemes and the kernels of the special isogenies. ChevalleyGroups C4
(the integral big cell `U⁻ × T_D × U ≅ Ω_D`, the cover of `G_D` by its Weyl translates and the
points over a field as the group generated by the root subgroups and `T_D(k)`) and C6 (the comparison map on elementary subgroups, its
extension by the torus, and the cokernel `ℚˣ/ℚˣ²` of `SL₂(ℚ) → PGL₂(ℚ)`) are the semisimple
Chevalley-datum cases of §§9B.1–9B.3 and of *Elementary generators and all ring points*; these
differ in being stated for every root datum, central tori and root-free data included, and in
their ring-point statements, which hold for every commutative ring, local rings included, where
C4 and C6 take points over fields.
ChevalleyGroups takes its group scheme from 9B through its C2 and is a consumer of these items,
not a second supplier of them; nothing of ChevalleyGroups is an input here.
ReductiveGroupsPartII extends this roadmap and consumes it;
nothing here is imported from it. ReductiveGroupsPartII RG2.3.7 states Lang's theorem
again under its own name; it is a consumer of Layer 7a, not a second supplier of it.
IntegralHeckeAndGaloisDeterminants §0.7 states the rational cohomology and induction of
Layer 1.1; it is a consumer of Layer 1.1 and is not imported here.
AdelicAlgebraicGroups AA.3.1 states the characteristic-zero Levi decomposition of Layer 6A
again, for closed subgroups, and is a consumer of Layer 6A.

Generic fpqc descent of quasi-coherent modules and sheaves belongs to
SchemeAndStackFoundations §1.1; its §§1.5, 1.13–1.15 supply quotient sheaves,
group spaces and torsors. ModularCurves §0E supplies effective affine descent; the Weil
restriction of the multiplicative group is Tau Ceti's (supplier contracts). This roadmap owns the comparisons
with Hopf/points carriers and group-specific representability statements, not those
foundations. Layers 3 and 4 own, over a field, four results. The first is the criterion that a
homomorphism of affine group schemes of finite type is a monomorphism exactly when it is a
closed immersion. The second is stability of diagonalizability under quotient groups, and the
third the converse direction of Milne's Theorem 12.12. The fourth is the completion of the
anti-equivalence of groups of multiplicative type with Galois modules: splitting over a finite
separable extension, and the character functor as one equivalence over every field. The
character-group comparison and exactness for diagonalizable groups, the definition of
multiplicative type, and the morphism classification over perfect fields are pinned Tau Ceti
(supplier contracts). So is the classification of groups split by a given finite Galois
extension. Layer 9D owns the relative forms of these results over an arbitrary affine base
`S = Spec R`, groups of multiplicative type there included. Cartier duality of finite locally
free commutative group schemes belongs to ModularCurves §0B and is distinct from the character
duality of diagonalizable groups. The generic isometry subgroup is
`TauCeti.BilinForm.isometryGroup`;
Layer 9A specializes it to the ADE lattice and constructs the new lift action.
The generic finite-index induction dimension formula is `TauCeti.finrank_indFDRep`;
Layer 7c uses its complex specialization.

The embedding theorem and the matrix-coefficient criterion for faithfulness of a
finite-dimensional comodule, the fppf homogeneous quotient sheaf of an affine group by a
closed subgroup, and the implication from linear reductivity of the geometric fibre to
reductivity are proved in the pinned Tau Ceti; they are consumed in the supplier contracts
below and are not targets. The relative Hopf reductivity predicate, its isomorphism
invariance and arbitrary base change, and the diagonalizable group-scheme anti-equivalence
and closed-subgroup stability of diagonalizability are also supplied by Tau Ceti;
Layers 4 and 9D retain their additional comparisons. The native k-unipotent
radical, its maximality, uniqueness and isomorphism transport, and the
counit-derivation kernel–differential comparison are also library inputs;
Layers 3, 5 and 9D retain the scheme transports, radical descent and quotient comparisons.
The pinned Tau Ceti also proves the algebraic orbit geometry of Layer 3A (geometric orbits and
their translations, local closedness, the locally closed orbit scheme, the boundary-dimension
bound, closed orbits in every orbit closure, proper and smooth orbit schemes, scheme stabilizers
and the smoothness of orbit projections in characteristic zero), the structure of the radical
and derived group of a reductive group, the characteristic-zero implication from reductivity to
linear reductivity, the affine direction of Matsushima's criterion with its universal property
and base change, and the conjugacy of Borel subgroups over an algebraically closed field. It
further proves the affine Hopf-algebra/group-scheme anti-equivalence with its points,
finite-type and smoothness comparisons and the Yoneda description of the points functor
(Layer 0), the point-representation/comodule equivalence (Layer 1.1), the classification of
closed subgroup schemes by Hopf ideals, normality of a Hopf ideal in conjugation coordinates
and the scheme kernel of a homomorphism (Layer 3), the
Jordan decomposition of points over a perfect extension and the anti-equivalence of tori over a
perfect field with Galois lattices, together with the diagonalizable and multiplicative-type
results listed in the supplier contracts (Layer 4), the centre, derived group, central isogenies
and simply connected and adjoint predicates (Layer 6), the dynamic Levi quotient and the free action
of the dynamic unipotent subgroup on dynamic Levis (Layer 7), the fixed-lift lemma and the
geometric-Frobenius description of rational points (Layer 7a), the signed ADE shell Lie
algebras with their cover lifts, fixed bases and folded Serre frames (9A.1a–9A.1b), and the
explicit `G₂`, `F₄` and tripled `D₄` carriers (9B). These are consumed in the supplier
contracts; Layers 0, 1.1, 3, 3A, 4, 6, 6B, 7, 7a, 9A and 9B retain only what they do not
prove. The pinned orbit theorems are stated over an algebraically closed field; 3A.2 owns the
local closedness of orbits over a field that is not algebraically closed.
The finite root combinatorics, chambers, the Weyl Coxeter presentation, simple transitivity
of the Weyl group on bases and on open chambers, the Cartan–Killing classification and the
numbered integral root data are pinned Tau Ceti declarations, listed in the supplier
contracts; they are not RootSystems targets here. The Weyl/based factorization of root
automorphisms is RootSystems §5.1's; §9A.1a-L consumes it on the ADE root lattice and adds only
its lift to the sign cover, retaining the separate full-Y action.

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
  `Spec R`, which Tau Ceti's pinned anti-equivalence packages (supplier contracts).
- **Smoothness ingredient:** `Mathlib/RingTheory/Nilpotent/GeometricallyReduced.lean`.
- **Classical-topology and chart inputs:** `AlgebraicGeometry.Smooth.exists_isStandardSmooth`
  (`Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean`) supplies, around every point of the source
  of a smooth morphism, affine opens on which the morphism is standard smooth; these are the
  local standard-smooth presentations behind the charts of Layer 3A.5d. `TopCat.GlueData` and
  `IsProperMap` supply topological gluing and proper continuous maps; `IsProperMap` includes
  continuity and imposes no Hausdorff hypothesis on either space.
  Over the complex model, `smoothSheafCommRing` and
  `smoothSheafCommRing.eval` (`Mathlib/Geometry/Manifold/Sheaf/Smooth.lean`) are the sheaf of
  holomorphic functions on a complex manifold and the evaluation of its germs at a point, and
  `smoothSheafCommRing.isUnit_stalk_iff` (`…/Sheaf/LocallyRingedSpace.lean`) makes a germ a unit
  exactly when its value is nonzero.
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
  scheme into `GLₙ`; `TauCeti.Comodule.isClosedImmersion_coordinateGroupSchemeHom_iff` (same file,
  over any commutative ring, with the comodule in that universe too) makes the group-scheme
  morphism of a comodule with a specified finite basis a closed immersion exactly when its
  coordinate bialgebra map is surjective; and
  `TauCeti.AffineGroupSchemeCat.exists_isClosedImmersion_generalLinear`
  gives, for an affine group scheme over `Spec k` with locally finite type structure
  morphism, a closed immersion into `GeneralLinear.groupScheme k n` for some `n`.
  `Representation/Faithful/Basic.lean` defines `TauCeti.Comodule.IsFaithful` (some finite
  basis makes the coordinate group-scheme morphism a closed immersion; `k`, `H` and the
  comodule in one universe) and proves
  `coordinateBialgHom_surjective_iff_matrixCoefficientSubalgebra_sup_antipode_eq_top`
  (over any commutative ring, `O(GLₙ) → H` is surjective exactly when the matrix coefficients
  together with their antipode images generate `H`; Milne, §4a, p. 83, and Theorem 4.9,
  p. 87),
  `isClosedImmersion_coordinateGroupSchemeHom_iff_of_bases` (independence of the basis) and
  `isFaithful_iff_matrixCoefficientSubalgebra_prod_dual_eq_top` (faithfulness exactly when
  the coefficients of `V ⊕ Vˇ` generate `H`). These are consumed; Layer 1 restates none of
  them.
  `TauCeti.Tannaka.pointsFunctorIsoTensorAutFunctor`
  (`TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/GroupFunctor.lean`) already reconstructs the points
  functor of a commutative Hopf algebra over a field from tensor automorphisms, with
  its explicit universe lift. Layer 1 transports this natural isomorphism through the
  representation/comodule and scheme/group-functor dictionaries.
- Tau Ceti `Borel.Basic` and `Reductive.Basic` provide predicates on finite-type
  commutative Hopf algebras. `TauCeti.reductiveCommHopfAlgProperty k H`, for
  `H : FiniteTypeCommHopfAlgCat.{u, u} k`, means: `H` is smooth and geometrically connected,
  and every normal Hopf ideal of the base change to an algebraic closure whose quotient is
  geometrically connected, smooth and unipotent is the augmentation ideal.
  `TauCeti.HopfIdeal.IsBorelOverAlgClosed k H I` means that `k` is algebraically closed and
  `I` is minimal, in the contravariant Hopf-ideal order, among Hopf ideals whose quotient is
  smooth, geometrically connected and geometrically solvable;
  `TauCeti.HopfIdeal.exists_minimal_isBorelCandidate` (`Borel/Existence.lean`) gives existence:
  over every field, a finite-type `H` has a Hopf ideal minimal among those with such a quotient,
  a Borel subgroup when `k` is algebraically closed; `TauCeti.HopfIdeal.conjugate I g`
  (`HopfIdeal/Conjugation.lean`) is the Hopf ideal of the conjugate `gKg⁻¹` of the subgroup
  `K` cut out by `I` by the rational point `g : WithConv (H →ₐ[k] k)`.
  `Borel/Conjugacy/Existence.lean` proves `TauCeti.HopfIdeal.IsBorelOverAlgClosed.exists_conjugate_eq`:
  any two Borel subgroups of a finite-type affine group over an algebraically closed field are
  conjugate by a rational point, `I.conjugate g = J`, with no smoothness, reducedness or
  connectedness hypothesis on the ambient group. `Reductive/LinearlyReductive.lean` proves
  `TauCeti.reductiveCommHopfAlgProperty.of_smooth_of_geometricallyConnected_of_baseChange_linearlyReductive`:
  a smooth, geometrically connected finite-type Hopf algebra whose base change to an algebraic
  closure is linearly reductive (`TauCeti.linearlyReductiveCommHopfAlgProperty`, every
  finite-dimensional comodule with carrier in the base universe is completely reducible) is
  reductive. `Reductive/CompleteReducibility.lean` proves the converse in characteristic zero:
  `TauCeti.reductiveCommHopfAlgProperty.linearlyReductive` (over every field of characteristic
  zero, with `H` in the universe of `k`), `TauCeti.Comodule.isCompletelyReducible_of_reductive`
  for arbitrary, not necessarily finite-dimensional, comodules, and
  `TauCeti.reductiveCommHopfAlgProperty_iff_linearlyReductive` for geometrically connected `H`.
  On the Lie-algebra side, `TauCeti.exists_isCompl_of_isKilling`
  (`TauCeti/Algebra/Lie/HighestWeight/CompleteReducibility.lean`) is Weyl's theorem: over a field
  of characteristic zero, every Lie submodule of a finite-dimensional module over a
  finite-dimensional Lie algebra with nondegenerate Killing form has a complement. Applying it to
  a group representation needs the algebraic differential and the comparison of group-invariant
  with Lie-invariant subspaces, not just a Lie action.
  The dynamic modules (`Algebra/AlgebraicGroup/Dynamic/`) provide, for a cocharacter
  `l : H →ₐc[R] LaurentPolynomial R` of an affine group over any commutative ring `R`, the
  cocharacter-defined parabolic, Levi and unipotent point subgroups and the pointwise Levi
  decomposition `TauCeti.Cocharacter.leviDecompositionMulEquiv`. They also represent the three
  subgroups by Hopf ideals, with no smoothness, finite-type, field or reductivity hypothesis:
  `TauCeti.Cocharacter.parabolicDefiningHopfIdeal` (`Dynamic/Representability.lean`),
  `BialgHom.unipotentDefiningHopfIdeal` (`Dynamic/Unipotent/Representability.lean`) and
  `TauCeti.Cocharacter.leviDefiningHopfIdeal` (`Dynamic/Levi/Representability.lean`). The first is
  generated by the negative-degree coefficients of universal conjugation by `l`, and
  `TauCeti.Cocharacter.parabolicPointsIso` identifies the points of its quotient with the
  parabolic point functor. The three
  quotients are smooth when `H` is smooth of finite type over a Noetherian ring:
  `BialgHom.smoothCommHopfAlgProperty_quotient_parabolicDefiningHopfIdeal`,
  `BialgHom.smoothCommHopfAlgProperty_quotient_unipotentDefiningHopfIdeal` and
  `BialgHom.smoothCommHopfAlgProperty_quotient_leviDefiningHopfIdeal` (`Dynamic/Smooth.lean`).
  Multiplication `U(l) × Z(l) → P(l)` is an isomorphism of underlying schemes,
  `BialgHom.parabolicCoordinateAlgEquiv` (`Dynamic/LeviDecomposition/Coordinate.lean`), an algebra
  equivalence `O(P) ≃ O(U) ⊗ O(Z)` over any base; it is not a Hopf map for the product group
  law. These modules do not identify `P(l)` with a parabolic in the sense of
  `TauCeti.HopfIdeal.IsParabolic`, `U(l)` with its unipotent radical or `Z(l)` with a Levi
  complement, and they contain none of the intersection and transporter results below.
- **Solvable groups, the quotient by the unipotent radical and pseudo-reductivity.**
  `Solvable/LieKolchin.lean` proves the Lie–Kolchin theorem: for a field `k` that is
  algebraically closed and a Hopf algebra `H` of finite type that is reduced, with connected
  spectrum and solvable group of rational points, every nonzero finite-dimensional comodule has
  a weight vector (`TauCeti.Comodule.hasNonzeroWeightVector_of_isSolvable`) and every
  finite-dimensional comodule has a basis with upper-triangular coefficient matrix and
  group-like diagonal entries
  (`TauCeti.Comodule.exists_basis_coefficientMatrix_isUpperTriangular_of_isSolvable`). Over
  `k̄` a reduced group of finite type is smooth, so this is Milne, Theorem 16.30, p. 334.
  Under the same hypotheses `TauCeti.FiniteTypeCommHopfAlgCat.torus_coinvariants_unipotentRadical`
  (`Solvable/UnipotentRadical.lean`) makes the quotient `G/R_u(G)`, represented by the right
  coinvariants of the radical's defining ideal, a torus.
  `TauCeti.Comodule.exists_basis_coefficientMatrix_isUpperTriangular_of_geometricallySolvable`
  gives the same triangular basis, still over an algebraically closed field and for a reduced `H`
  of finite type, with geometric connectedness and geometric solvability as the hypotheses, the
  conditions in the definition of a Borel candidate.
  `TauCeti.geometricallyUnipotentPointsCommHopfAlgProperty` (`Unipotent/Basic.lean`) asks that
  every point with values in an algebraic closure act unipotently in every finite-dimensional
  representation; it does not detect infinitesimal non-unipotence. For a reduced finite-type Hopf
  algebra over an algebraically closed field,
  `TauCeti.geometricallyUnipotentPointsCommHopfAlgProperty.iff_exists_isClosedImmersion_upperUnitriangularGroupScheme`
  (`Unipotent/Embedding.lean`) identifies it with the existence of a closed immersion into an
  upper-unitriangular group `Uₙ`.
  `PseudoReductive/Basic.lean` defines `TauCeti.pseudoReductiveCommHopfAlgProperty` (smooth,
  geometrically connected, with trivial `k`-unipotent radical) over every field and proves
  `TauCeti.reductiveCommHopfAlgProperty.pseudoReductive` (reductive implies pseudo-reductive),
  `TauCeti.pseudoReductiveCommHopfAlgProperty_iff_reductive` (equality over an algebraically
  closed field), `TauCeti.FiniteTypeCommHopfAlgCat.pseudoReductive_coinvariants_unipotentRadical`
  (for smooth geometrically connected `G` over any field, `G/R_(u,k)(G)` is pseudo-reductive),
  `TauCeti.FiniteTypeCommHopfAlgCat.reductive_coinvariants_unipotentRadical` (over an
  algebraically closed field the same quotient is reductive) and
  `TauCeti.AdditiveGroup.not_pseudoReductiveCommHopfAlgProperty_coordinateHopfAlgebra` (`𝔾_a` is
  not pseudo-reductive). Its module states that equality of the two notions over perfect fields
  is not proved there. `Solvable/LinearlyReductive.lean` proves
  `TauCeti.linearlyReductiveCommHopfAlgProperty_iff_torus_of_isSolvable`: over an algebraically
  closed field, in every characteristic, a reduced connected group of finite type with solvable
  rational points is linearly reductive exactly when it is a torus;
  `TauCeti.torusCommHopfAlgProperty.linearlyReductive` (`MultiplicativeType/LinearlyReductive.lean`)
  makes every torus, split or not, linearly reductive.
- **Weil restriction of the multiplicative group.** `TauCeti.Algebra.WeilRestriction`
  (`RingTheory/WeilRestriction/Basic.lean`) is the Weil restriction along an algebra `B` over `A`
  that is finitely generated and projective as an `A`-module. For `Res_(B/A) 𝔾_m`, with coordinate
  Hopf algebra the Weil restriction of `B[T, T⁻¹]`,
  `TauCeti.Algebra.WeilRestriction.multiplicativeGroupPoints` identifies the points over a
  commutative `A`-algebra `T` with `(B ⊗_A T)ˣ`, naturally in `T`; the instances
  `TauCeti.Algebra.WeilRestriction.instSmooth` and
  `TauCeti.Algebra.WeilRestriction.instIsCocomm` make it smooth and commutative; and
  `TauCeti.Algebra.WeilRestriction.geometricallyConnectedCommHopfAlgProperty_multiplicativeGroup`
  makes it geometrically connected when `A` is a field and `B` finite-dimensional. Neither
  pseudo-reductivity nor the failure of reductivity of `Res_(K/k) 𝔾_m` for purely inseparable
  `K/k` is proved there.
- **Unipotent matrix groups: exponential, logarithm and contractibility.**
  `Algebra/AlgebraicGroup/GeneralLinear/Unipotent/` treats a closed subgroup `H ⊆ GLₙ` cut out by
  a Hopf ideal `I` over a commutative `ℚ`-algebra `R`, with no smoothness, connectedness or
  reducedness hypothesis on `H`. For a unipotent `g ∈ H(R)` over a rational domain the
  polynomial curve `t ↦ exp(t log g)` lies in `H` over every rational value algebra
  (`TauCeti.GeneralLinear.expSMulHom_log_mem_hopfIdealPointsSubgroup`, `OneParameter.lean`);
  for a nilpotent `X ∈ Lie H` the curve `t ↦ exp(tX)` lies in `H`
  (`TauCeti.GeneralLinear.expSMulHom_mem_hopfIdealPointsSubgroup`, `Exponential.lean`); over a
  rational domain `exp X ∈ H` exactly when `X ∈ Lie H`
  (`TauCeti.GeneralLinear.nilpotentExpUnit_mem_hopfIdealPointsSubgroup_iff`), `log g ∈ Lie H`
  (`TauCeti.GeneralLinear.log_mem_map_lieSubalgebra`, `Tangent.lean`), and
  `TauCeti.GeneralLinear.expEquivHopfIdealPoints` is the bijection between the nilpotent
  elements of `Lie H` and the unipotent points of `H`. Over a field `K` with a ring topology and
  continuous real scalar multiplication, such as `ℝ` or `ℂ`,
  `TauCeti.GeneralLinear.contractibleSpace_hopfIdealPointsSubgroup` (`Contractible.lean`) makes
  the point group of such an `H` contractible, in the subspace topology from the units of the
  matrix algebra, when every `K`-point is unipotent.
- **Binary forms and polynomial representations of `GLₙ`.**
  `Algebra/AlgebraicGroup/SpecialLinear/BinaryForm/Basic.lean` defines the binary forms
  `TauCeti.SpecialLinear.binaryForms R d` of degree `d` as a subcomodule of the polynomial
  functions on the standard representation of `SL₂` over a commutative ring `R`, on which
  `[[a,b],[c,d]]` acts by `f(x, y) ↦ f(dx − by, ay − cx)`. Over a domain a binary form spans a line
  stable under the upper-triangular `B⁺` exactly when it is a multiple of `yᵈ`
  (`TauCeti.SpecialLinear.exists_lTensor_coact_eq_tmul_iff_mem_span`). Over a field,
  `TauCeti.SpecialLinear.binaryFormsSocle` is the simple socle, generated by `yᵈ` and contained
  in every nonzero subrepresentation; in characteristic `p` its dimension is `∏ⱼ (dⱼ + 1)` over
  the base-`p` digits of `d` (`TauCeti.SpecialLinear.finrank_binaryFormsSocle_eq_prod_digits`),
  and the binary forms are simple exactly when `d + 1 = (a + 1)pᵐ` with `a < p`
  (`TauCeti.SpecialLinear.isAtom_binaryForms_iff_of_charP`). In characteristic zero they are
  simple in every degree (`TauCeti.SpecialLinear.isAtom_binaryForms_of_charZero`).
  `BinaryForm/Frobenius.lean` defines, in characteristic `p`, the rational subrepresentation
  `TauCeti.SpecialLinear.frobeniusBinaryForms` of the degree-`pm` forms in `xᵖ` and `yᵖ`, nonzero
  in every degree and proper for `m > 0`, so binary forms of positive degree divisible by `p` are
  not simple (`TauCeti.SpecialLinear.not_isAtom_binaryForms_mul_char`); in degree zero it is all
  of the binary forms. `BinaryForm/Dual.lean` proves that
  the annihilator of the socle is the unique maximal proper subrepresentation of the dual
  (`TauCeti.SpecialLinear.isCoatom_dualAnnihilator_comap_binaryFormsSocle`), that the
  coordinate functional `δ_(xᵈ)` generates the dual
  (`TauCeti.SpecialLinear.eq_top_of_lcoeff_comp_subtype_mem`), and that in characteristic `p`
  the functional `δ_(x^(p−1)y)` spans a second `B⁺`-stable line of the dual of the degree-`p`
  forms. It does not identify the binary forms or their duals with induced or Weyl modules.
  `Algebra/AlgebraicGroup/GeneralLinear/Polynomial.lean` proves, over a field, that a rational
  `GLₙ` coaction extends uniquely to the matrix monoid exactly when it takes values in the
  polynomial coordinates (`TauCeti.GeneralLinear.existsUnique_matrixMonoidComodule_iff`), and,
  for a finite basis, exactly when every coefficient is polynomial
  (`TauCeti.GeneralLinear.existsUnique_matrixMonoidComodule_iff_coefficientMatrix`); the
  extension is a comodule over the coordinate bialgebra, so it satisfies the unit and
  multiplication laws, and it agrees with the original action on the points over every
  commutative value algebra (`TauCeti.GeneralLinear.endOfPoint_matrixMonoidComodule`).
- **Finite-field Frobenius.** `Frobenius.Points` and `Frobenius.FixedPoints`
  provide pointwise Frobenius maps and fixed-point comparisons for a `ℤ`-bialgebra carrier.
  `Frobenius/FiniteField.lean` provides, for a Hopf algebra `H` over a finite field `K` with
  `q` elements and a commutative `K`-algebra `A`, the `q^n`-Frobenius
  `TauCeti.FiniteField.frobeniusPoints K n` on the convolution group `WithConv (H →ₐ[K] A)`,
  post-composition with `a ↦ a^(q^n)` (`TauCeti.FiniteField.frobeniusPoints_apply_apply`), its
  naturality in `H` (`TauCeti.FiniteField.mapDomain_comp_frobeniusPoints`), the identification
  of the `q`-Frobenius-fixed points over a domain `A` with the `K`-rational points
  `TauCeti.FiniteField.rationalPointsMulEquiv` and its naturality
  (`TauCeti.FiniteField.coe_rationalPointsMulEquiv_mapDomain`), the finiteness
  `TauCeti.FiniteField.finite_fixedSubgroup_frobeniusPoints` of the points fixed by a positive
  iterate when `H` is of finite type and `A` a domain, the fixed points of a closed subgroup
  scheme as its points fixed in the ambient group
  (`BialgHom.map_fixedSubgroup_frobeniusPoints_of_surjective`), and the geometric Frobenius
  `TauCeti.FiniteField.geometricFrobeniusBialgHom` of a base change `k ⊗[K] H`, identified with
  the `q`-Frobenius on points by
  `TauCeti.FiniteField.baseChangePointsMulEquiv_symm_comp_mapDomain_geometricFrobeniusBialgHom`.
  No splitting, `ℤ`-model or reductivity is assumed of `H`. These are consumed by Layer 7a; an
  endomorphism with a Frobenius power (Lang–Steinberg) is not among them.
- Mathlib's root-system and Coxeter modules provide abstract combinatorial structures.
  Tau Ceti has concrete torus, GL, SL, and symplectic root-data carriers. These are
  reusable instances, not general root extraction or classification.
- **Finite root systems.** Under finite root indices, a characteristic-zero domain,
  crystallographicity and reducedness, `TauCeti/LinearAlgebra/RootSystem/` supplies the
  finite root/reflection API: `TauCeti.posRoots` (`Positive.lean`),
  `TauCeti.exists_mem_support_height_reflectionPerm_lt` (`Lowering.lean`),
  `TauCeti.weylGroup_eq_closure_simple` (`SimpleReflections.lean`), `TauCeti.inversions`
  (`Inversions/Basic.lean`) and `TauCeti.longestElement` (`LongestElement.lean`, which also
  needs spanning). `TauCeti.weylCoxeterSystem`, `TauCeti.weylCoxeterHom_injective` and
  `TauCeti.length_weylCoxeterSystem_eq` (`Coxeter/Presentation.lean`) make the Weyl group a
  Coxeter system on the simple reflections of a base, with Coxeter length the inversion count;
  no spanning hypothesis is used. `RootPairing.Base.existsUnique_map_eq` (`Weyl/Bases.lean`)
  gives exactly one Weyl element carrying any base to any other. Over a linearly ordered
  strict ordered ring, `RootPairing.dominantChamber` (`Chamber.lean`), `TauCeti.openWeylChamber`
  and `TauCeti.weylGroupEquivOpenWeylChambers` (`Weyl/Chamber.lean`) give the chambers and
  the bijection from the Weyl group to the open chambers, the latter under the explicit
  hypothesis that the open dominant chamber is nonempty. Over such a ring, with the coroots
  reduced as well, `TauCeti.stabilizer_eq_closure_wallReflections` (`FundamentalDomain.lean`)
  generates the stabilizer of a dominant weight by the simple reflections in the walls through
  it, and `TauCeti.existsUnique_mem_orbit_inter_dominantChamber` (same file, for a root system)
  makes the closed dominant chamber a strict fundamental domain: every Weyl orbit meets it exactly
  once. `TauCeti.exists_smul_eq_of_mem_openWeylChambers` and
  `TauCeti.openWeylChambers.stabilizer_eq_bot` (`Weyl/Chamber.lean`) give transitivity and, for a
  nonempty open dominant chamber, freeness of the Weyl action on the open chambers, and
  `TauCeti.inversions_longestElement` makes the inversion set of `TauCeti.longestElement` all the
  positive roots. `TauCeti.existsUnique_dynkinType`
  (`FiniteType/Classification.lean`) gives, with spanning and irreducibility over a nonempty
  index set, the unique valid `TauCeti.DynkinType` of a base; `TauCeti.HasCartanType.of_base`
  (`Weyl/CartanType.lean`) makes the Cartan type independent of the base, and
  `TauCeti.nonempty_equiv_of_hasCartanType` (`Isomorphism.lean`) gives rigidity for two
  bases of the same type. `TauCeti.DynkinType.Valid` restricts the ranks to A≥1, B≥2, C≥3, D≥4 and
  the five exceptional types. `TauCeti.DynkinType.simplyConnectedRootDatum`
  (`SimplyConnectedRootDatum/Assembly.lean`) and `TauCeti.DynkinType.rationalRootSystem`
  (`SimplyConnectedRootDatum/Rational.lean`) are the numbered integral and rational
  realizations of each valid type. These are consumed at the pin, not as RootSystems
  targets.

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
  Over every commutative ring R, `TauCeti.DiagonalizableGroup.groupScheme`
  (`DiagonalizableGroup/Scheme/Basic.lean`) is the group scheme `Spec R[M]` over `Spec R` of a
  finitely generated commutative group `M` in R's universe; Layer 9D uses it as `D_S(M)`.
  `TauCeti.DiagonalizableGroup.schemePointsMulEquiv` (`DiagonalizableGroup/Scheme/Points.lean`)
  identifies its points with values in `Spec A`, for a commutative `R`-algebra `A` in the same
  universe, with the characters `M →* Aˣ`.
  `TauCeti/Algebra/AlgebraicGroup/DiagonalizableGroup/ClosedSubgroup.lean`,
  `TauCeti.DiagonalizableGroup.groupLikeSpannedProperty.of_surjective` and
  `TauCeti.DiagonalizableGroup.groupLikeSpannedProperty.quotient` supply stability
  under surjective morphisms of finite-type coordinate Hopf algebras over every
  field k, including every Hopf-ideal quotient. Contravariantly these are closed
  subgroups; they do not assert stability under quotient groups.
- **Diagonalizable groups and groups of multiplicative type.** Under
  `TauCeti/Algebra/AlgebraicGroup/`:
  - `DiagonalizableGroup/CharacterLattice.lean` supplies
    `TauCeti.DiagonalizableGroup.geometricCharacterGroupEquiv`, over a field `k`: the geometric
    character group of `k[M]` is `M`. With it,
    `TauCeti.DiagonalizableGroup.smul_geometricCharacterGroup_eq_self` makes the absolute Galois
    action on it trivial.
  - `DiagonalizableGroup/Exact.lean` supplies
    `TauCeti.DiagonalizableGroup.isShortExact_mapDomainBialgHom_iff`, over every nonzero
    commutative ring `R`, for commutative groups that need not be finitely generated:
    `D(N) → D(M) → D(L)` is short exact exactly when `1 → L → M → N → 1` is (Milne, Theorem
    12.9(b), p. 233).
  - `DiagonalizableGroup/Scheme/Basic.lean` supplies the functor `M ↦ D_R(M)` to group schemes
    over `Spec R`. `TauCeti.DiagonalizableGroup.schemeFunctor_faithful` makes it faithful when
    `R` is nonzero, and `TauCeti.DiagonalizableGroup.fullyFaithfulSchemeFunctor` makes it fully
    faithful when `Spec R` is connected: `Hom(D_R(M), D_R(N)) = Hom(N, M)`.
  - `TauCeti/Algebra/Coalgebra/Comodule/MonoidAlgebra/Basic.lean` supplies
    `TauCeti.Comodule.isInternal_weightSpace`, over every commutative semiring: a comodule over
    `R[M]` is the direct sum of its weight spaces. This is the implication from diagonalizable
    to "every representation is a sum of characters" (Milne, Theorem 12.12, (a) ⇒ (b), p. 234).
  - `MultiplicativeType/Basic.lean` supplies `TauCeti.multiplicativeTypeCommHopfAlgProperty`: a
    finite-type commutative Hopf algebra over a field whose base change to an algebraic closure
    is spanned by group-like elements (Milne, Definition 12.17, p. 236). With it,
    `TauCeti.multiplicativeTypeCommHopfAlgProperty_iff_exists_iso_coordinateRing` makes that base
    change some `k̄[M]`. `TauCeti/AlgebraicGeometry/AffineGroupScheme/MultiplicativeType.lean`
    supplies the scheme form `TauCeti.multiplicativeTypeAffineGroupSchemeProperty`.
  - `Torus/Basic.lean` supplies `TauCeti.splitTorusCommHopfAlgProperty`, over a commutative ring
    (isomorphic to the coordinate Hopf algebra of a split torus of finite rank), and
    `TauCeti.torusCommHopfAlgProperty`, over a field (split after base change to an algebraic
    closure). For a group of multiplicative type over a field,
    `TauCeti.MultiplicativeTypeCommHopfAlgCat.characterCocharacterPairing` and
    `TauCeti.MultiplicativeTypeCommHopfAlgCat.characterCocharacterPairing_galois_invariant`
    (`MultiplicativeType/Cocharacter.lean`) are the evaluation pairing between geometric
    characters and geometric cocharacters and its invariance under the diagonal absolute Galois
    action; they concern geometric, not `k`-rational, characters.
  - For a group `H` of multiplicative type over a field `k`, three pinned results hold.
    `TauCeti.multiplicativeTypeCommHopfAlgProperty.geometricCharacterMap_injective`
    (`MultiplicativeType/Faithful.lean`, every field): a homomorphism into `H` from any affine
    group is determined by its pullback on geometric characters.
    `TauCeti.multiplicativeTypeCommHopfAlgProperty.existsUnique_geometricCharacterMap_eq`
    (`MultiplicativeType/Character/Descent.lean`, `k` perfect): every Galois-equivariant map of
    geometric characters comes from a unique such homomorphism.
    `TauCeti.multiplicativeTypeCommHopfAlgProperty.exists_finiteDimensional_groupLikeSpanned_baseChange`
    (`MultiplicativeType/Splitting.lean`): `H` splits over a finite extension of `k`, not
    asserted separable. Separately,
    `TauCeti.multiplicativeTypeCommHopfAlgProperty.linearlyReductive`
    (`MultiplicativeType/LinearlyReductive.lean`) makes `H` linearly reductive.
  - `GroupAlgebra/Galois/` treats a finite Galois extension `L/k` and a `Gal(L/k)`-module `M`,
    with `k[M]^Γ` the invariants of the semilinear action on `L[M]`. Over every field, the
    following are pinned.
    `TauCeti.GaloisDescent.multiplicativeTypeCommHopfAlgProperty_descendedCoordinateRing`: for
    finitely generated `M`, torsion included, `k[M]^Γ` is of multiplicative type.
    `TauCeti.GaloisDescent.groupAlgebraInvariantsGeometricCharacterEquiv`: its geometric
    characters are `M` with the given action.
    `TauCeti.GaloisDescent.characterGroupAlgebraInvariantsEquiv`: a commutative Hopf algebra
    split by `L` is `k[M]^Γ` for its own character module.
    `Representation.groupAlgebraInvariantsBialgHomEquiv`: equivariant maps of exponent groups
    correspond bijectively to Hopf maps of the descended algebras. Together these are Milne's
    Theorem 12.23, p. 240, for groups split by a given finite Galois extension.
  None of these modules proves that quotients of diagonalizable groups are diagonalizable, the
  converse implication of Milne's Theorem 12.12, or that a group of multiplicative type splits
  over a finite separable extension. They also do not package the character functor as one
  equivalence over every field. These are Layer 4's targets.

- **Cofree comodules.** `TauCeti/Algebra/Coalgebra/Comodule/Cofree.lean` supplies
  `TauCeti.Comodule.cofree`, `TauCeti.Comodule.Hom.cofreeUnit`,
  `TauCeti.Comodule.Hom.cofreeEquiv` and `TauCeti.ComoduleCat.cofree` over a
  commutative ring. `Comodule/Abelian.lean` supplies the abelian category and exact
  forgetful functor when the coalgebra is flat; `Comodule/Corestrict.lean` supplies
  corestriction along a coalgebra map. Layer 1.1 constructs derived invariants on these
  carriers and their rational group-scheme adapters.
- **Points action and cotensor induction.** `TauCeti/Algebra/Coalgebra/Comodule/PointsAction.lean`
  supplies `TauCeti.Comodule.endOfPoint`, the action of a point `g : H →ₐ[R] A` on `A ⊗[R] V`
  for any comodule `V` over a coalgebra `H` over a commutative semiring `R`, its naturality in
  `A` (`TauCeti.Comodule.rTensor_comp_endOfPoint`) and the representation
  `TauCeti.Comodule.pointsRepresentation` of the convolution monoid of points over a
  bialgebra; `TauCeti/Algebra/AlgebraicGroup/Representation/PointsAction/Basic.lean` supplies
  `TauCeti.Comodule.pointsAction`, the action by automorphisms over a Hopf algebra.
  `TauCeti/Algebra/Coalgebra/Comodule/Induced.lean` supplies, for a coalgebra map
  `f : C →ₗc[R] D` over a commutative ring with `C` flat, the induced comodule
  `TauCeti.Comodule.induced`, Frobenius reciprocity `TauCeti.Comodule.inducedEquiv`, natural
  in both variables (`TauCeti.Comodule.inducedEquiv_comp`,
  `TauCeti.Comodule.inducedEquiv_inducedMap_comp`), and functoriality
  `TauCeti.Comodule.inducedMap`, `TauCeti.Comodule.inducedMap_id`,
  `TauCeti.Comodule.inducedMap_comp`. `TauCeti/Algebra/Coalgebra/Comodule/Fixed.lean` supplies
  the invariant subcomodule `TauCeti.Comodule.fixedSubcomodule`, the vectors `v` with
  `coact v = v ⊗ 1` for a coalgebra with a distinguished element `1`, and the induced maps
  `TauCeti.Comodule.Hom.fixedMap`. Layer 1.1 consumes these and does not restate them.
- **Analytic local inversion.** `TauCeti/Analysis/Analytic/Inverse.lean` supplies
  `AnalyticAt.exists_openPartialHomeomorph` for an analytic map between Banach
  spaces over a complete nontrivially normed field whose strict derivative at the
  specified point is a continuous linear equivalence. Layer 3A.5 uses it over ℂ
  for the smooth charts of 3A.5d and the local sections of the orbit map in 3A.5f.
  `DifferentiableOn.analyticOnNhd_of_finiteDimensional`
  (`TauCeti/Analysis/Complex/CauchyIntegralPolydisc.lean`) makes a function on a
  finite-dimensional complex normed space with complete codomain, complex differentiable on an
  open set, analytic on that set.
- **Van Kampen and Serre fibrations.** `TauCeti.isPushout_fundamentalGroup`
  (`TauCeti/AlgebraicTopology/FundamentalGroup/VanKampen/Basic.lean`) is the based two-set
  Seifert–van Kampen theorem: if the interiors of `A` and `B` cover the space and `A`, `B` and
  `A ∩ B` are path connected and contain the basepoint, the square of fundamental groups induced
  by the inclusions is a pushout of groups.
  `TauCeti.TopCat.mem_serreFibrations_proj`
  (`TauCeti/Topology/Homotopy/SerreFibration/FiberBundle.lean`) makes the projection of every
  fibre bundle a Serre fibration, with no paracompactness hypothesis; the connecting maps and
  exactness of the homotopy sequence are not part of it.

### Native unipotent radical

For every field k and finite-type commutative Hopf algebra H in its universe,
`TauCeti/Algebra/AlgebraicGroup/Unipotent/Radical/Construction.lean` supplies
`TauCeti.FiniteTypeCommHopfAlgCat.unipotentRadicalDefiningIdeal`,
`TauCeti.FiniteTypeCommHopfAlgCat.isUnipotentRadicalCandidate_unipotentRadicalDefiningIdeal`,
`TauCeti.FiniteTypeCommHopfAlgCat.unipotentRadicalDefiningIdeal_le` and
`TauCeti.FiniteTypeCommHopfAlgCat.eq_unipotentRadicalDefiningIdeal_iff`.
The ideal is least among those cutting out smooth geometrically connected
normal unipotent subgroups: ideal inclusion reverses subgroup inclusion.
`TauCeti.FiniteTypeCommHopfAlgCat.unipotentRadical` is its quotient Hopf algebra;
`TauCeti.FiniteTypeCommHopfAlgCat.unipotentRadicalSpec` and
`TauCeti.FiniteTypeCommHopfAlgCat.unipotentRadicalSpecι` give its scheme realization
and closed inclusion. `Unipotent/Radical/Isomorphism.lean` supplies
`TauCeti.FiniteTypeCommHopfAlgCat.unipotentRadicalIsoOfIso` and
`TauCeti.FiniteTypeCommHopfAlgCat.unipotentRadicalCoordinateMap_comp_unipotentRadicalIsoOfIso_hom`,
with identity and composition compatibility. For every field extension `K/k`,
`TauCeti.FiniteTypeCommHopfAlgCat.unipotentRadicalDefiningIdeal_baseChange_le`
(`Unipotent/Radical/BaseChange.lean`) puts the defining ideal of the radical of the base change
inside the base change of the defining ideal: the base-changed radical lies in the radical of the
base change. These are k-radicals; beyond that inclusion this contract makes no
inseparable-base-change assertion. Layers 5 and 9D compare their represented quotients and base
changes.

### Native tangent and smoothness interfaces

The counit-derivation carrier is `Derivation R H (TauCeti.Bialgebra.CounitAlgebra R H R)`.
`Derivation.instLieAlgebraCounitAlgebra` in
`TauCeti/Algebra/AlgebraicGroup/Tangent/Lie/Basic.lean` gives its convolution-commutator
bracket for commutative rings R, H and a bialgebra structure. The Hopf case
has the differential `TauCeti.tangentKerMap` in `Tangent/Map.lean`. For a morphism `φ` of
commutative bialgebras over R, `TauCeti.derivationCompLieHom φ` in `Tangent/Lie/Map.lean` is the
differential on counit-valued derivations as a morphism of Lie algebras over the coefficient
algebra, and `TauCeti.derivationCompLieHom_id` and `TauCeti.derivationCompLieHom_comp` are its
functoriality.
`TauCeti.Bialgebra.CotangentSpace` and `Derivation.cotangentLinearEquiv` in
`Tangent/Cotangent.lean` identify this carrier with the dual of I/I²; over a field,
`TauCeti.Bialgebra.cotangentLinearEquivZariski` in `Tangent/Scheme.lean`, with its value
`TauCeti.Bialgebra.cotangentLinearEquivZariski_toCotangent` on the class of an element of the
augmentation ideal, identifies I/I² with the Zariski cotangent space of `Spec H` at the
augmentation point, a statement about algebraic local rings, not holomorphic germs;
`Derivation.tangentScalarExtensionEquiv` requires that cotangent module finite
and projective. `Derivation.adjointComodule` and
`Derivation.adjointCoordinateBialgHom` in `Tangent/Representation.lean` supply
the fixed-module adjoint representation under those hypotheses, with a basis
for the coordinate map. `Derivation.adRepresentation` in `Tangent/Adjoint.lean` is the linear
adjoint action of the points of a commutative Hopf algebra on its counit-valued derivations; by
itself it does not supply the scheme morphism to `GL` of the tangent space. These are supplied
objects, not new definitions here.
`TauCeti.smoothCommHopfAlgProperty_of_charZero` in
`TauCeti/Algebra/AlgebraicGroup/Smooth/CharZero.lean` supplies Cartier's theorem
for finite-type commutative Hopf algebras over characteristic-zero fields.
`TauCeti/Algebra/AlgebraicGroup/HopfIdeal/Quotient/Kernel/Tangent.lean` supplies
`TauCeti.CommHopfAlgCat.lieSubalgebra_kernelHopfIdeal` and
`TauCeti.CommHopfAlgCat.kernelLieEquiv`: for commutative rings R and B, an
R-algebra structure on B and a coordinate Hopf map H → K, the derivation Lie
algebra of K modulo the kernel Hopf ideal is the kernel of the differential
from the counit-valued derivations of K to those of H. No smoothness, field or
finite-type hypothesis is required. Layer 3 transports this equivalence to
scheme tangent spaces through Layers 0 and 2.

### Native orbit geometry

For a group object `G` acting on `X` in schemes over a base (`GrpObj G`, `ModObj G X`),
`TauCeti.orbitMap` and `TauCeti.translation` (`TauCeti/CategoryTheory/Monoidal/Cartesian/Action.lean`)
are the orbit morphism of a section and the translation isomorphisms, and `TauCeti.stabilizer`
(`Cartesian/Stabilizer/Basic.lean`) is the scheme-theoretic stabilizer, the fibre of the orbit
morphism over the section, with `TauCeti.stabilizer.fiberSmulIso` identifying the fibres over
translates. `TauCeti/AlgebraicGeometry/GroupAction/Orbit/Basic.lean` defines
`TauCeti.SchemeAction.orbit`, `TauCeti.SchemeAction.orbitClosure` and
`TauCeti.SchemeAction.orbitBoundary`: the image of all scheme points under the orbit morphism,
its closure and its boundary, with no finiteness hypothesis. Over an algebraically closed field
`k`, for `G` and `X` locally of finite type over `k` with quasi-compact underlying spaces, and
with no smoothness, reducedness, separatedness or connectedness hypothesis, the same directory
proves: `TauCeti.SchemeAction.orbit_inter_closedPoints` (the closed points of an orbit are the
translates of the base point by rational points of `G`), `TauCeti.SchemeAction.isLocallyClosed_orbit`,
`TauCeti.SchemeAction.isClosed_orbitBoundary` and
`TauCeti.SchemeAction.topologicalKrullDim_orbitBoundary_lt` (`LocallyClosed.lean`, for a
reducible orbit closure as well: the boundary is closed of strictly smaller dimension); the orbit
scheme `TauCeti.SchemeAction.orbitScheme`, the locally
closed image of the orbit morphism, with its immersion `TauCeti.SchemeAction.orbitι`, whose image
is the orbit (`TauCeti.SchemeAction.range_orbitι`), and the surjective factorization
`TauCeti.SchemeAction.toOrbit` (`Orbit/Scheme.lean`), reduced when `G` is reduced;
`TauCeti.SchemeAction.exists_isClosed_orbit_subset_orbitClosure`,
`TauCeti.SchemeAction.topologicalKrullDim_orbit_lt_of_mem_orbitBoundary` (the orbit of a rational
point of the boundary has strictly smaller dimension),
`TauCeti.SchemeAction.exists_isClosed_orbit` (for nonempty `X`) and the closed-orbit lemma
`TauCeti.SchemeAction.isClosed_orbit_of_forall_mem_orbitClosure` (`ClosedOrbit.lean`);
`TauCeti.SchemeAction.isProper_orbitToBase_iff` and
`TauCeti.SchemeAction.exists_isProper_orbit_subset_orbitClosure` for proper `X`
(`Orbit/Proper.lean`); smoothness of the orbit scheme of a reduced `G`, and
`TauCeti.SchemeAction.smooth_orbitClosureToBase_of_isClosed` for a closed orbit
(`Orbit/Smooth.lean`); `TauCeti.SchemeAction.smooth_toOrbit_iff` (the orbit projection of a
reduced `G` is smooth exactly when the stabilizer is) and, for affine `G` in characteristic zero,
`TauCeti.SchemeAction.smooth_toOrbit_of_charZero` (`Orbit/Stabilizer.lean`) and
`TauCeti.SchemeAction.smooth_stabilizer` (`Stabilizer.lean`); and
`TauCeti.SchemeAction.orbitBaseChangeIso` for extensions of algebraically closed fields
(`Orbit/BaseChange.lean`). These are the orbit theorems of Layer 3A; they are consumed, not
restated.

### Native reductive structure

For `H : FiniteTypeCommHopfAlgCat.{u, u} k` over any field `k`, with
`TauCeti.reductiveCommHopfAlgProperty k H`:
`TauCeti.reductiveCommHopfAlgProperty.torus_solvableRadical` and
`TauCeti.reductiveCommHopfAlgProperty.isCentral_solvableRadicalDefiningIdeal`
(`Solvable/Radical/Reductive.lean`) make the solvable radical
`TauCeti.FiniteTypeCommHopfAlgCat.solvableRadical` a central torus (over every field it is the
quotient by `TauCeti.FiniteTypeCommHopfAlgCat.solvableRadicalDefiningIdeal`, which
`TauCeti.FiniteTypeCommHopfAlgCat.eq_solvableRadicalDefiningIdeal_iff`, in
`Solvable/Radical/Construction.lean`, characterizes as the least Hopf ideal cutting out a smooth,
geometrically connected, normal subgroup with solvable geometric points, so that its subgroup is
the greatest such);
`TauCeti.reductiveCommHopfAlgProperty.semisimple_derived` (`Derived/Semisimple.lean`) makes the
scheme-theoretic derived subgroup semisimple (`TauCeti.semisimpleCommHopfAlgProperty`);
`TauCeti.semisimpleCommHopfAlgProperty_iff_reductive_and_moduleFinite_centerCoordinate`
(`Semisimple/Center/Criterion.lean`) characterizes semisimple groups as the reductive ones with
finite centre; and `TauCeti.reductiveCommHopfAlgProperty.torus_of_geometricallySolvable`
(`Reductive/Solvable.lean`) makes a solvable reductive group a torus
(`TauCeti.torusCommHopfAlgProperty`). Over an algebraically closed field of characteristic zero,
`TauCeti.reductiveCommHopfAlgProperty.solvableRadicalDefiningIdeal_eq_identityComponent_centerDefiningIdeal`
(`Solvable/Radical/Center.lean`) identifies the radical with the identity component of the
centre; over an algebraically closed field,
`TauCeti.FiniteTypeCommHopfAlgCat.semisimple_coinvariants_solvableRadical`
(`Semisimple/RadicalQuotient.lean`) makes the quotient of a smooth connected group by its radical
semisimple. `TauCeti.FiniteTypeCommHopfAlgCat.identityComponent`
(`Connected/GroupScheme.lean`) is the identity component of a finite-type group over an
algebraically closed field, and `TauCeti.FiniteTypeCommHopfAlgCat.baseChangeFunctor` is extension
of scalars. These are consumed by Layer 6, not restated.

The classical examples are reductive in the library, for the standard models over a field `k`:
`TauCeti.GeneralLinear.reductiveCommHopfAlgProperty_finiteTypeCoordinateHopfAlgebra`
(`Algebra/AlgebraicGroup/GeneralLinear/Reductive/Basic.lean`),
`TauCeti.SpecialLinear.reductiveCommHopfAlgProperty_finiteTypeCoordinateHopfAlgebra`
(`SpecialLinear/Reductive/Basic.lean`) and
`TauCeti.Symplectic.reductiveCommHopfAlgProperty_finiteTypeCoordinateHopfAlgebra`
(`Symplectic/Reductive/Basic.lean`) for `GLₙ`, `SLₙ` and `Sp₂ₘ` over every field and every
`n`, `m`; `TauCeti.ProjectiveGeneralLinear.reductiveCommHopfAlgProperty_coordinateHopfAlgebra`
(`ProjectiveGeneralLinear/Semisimple.lean`) for `PGLₙ` over every field; and
`TauCeti.SpecialOrthogonal.reductiveCommHopfAlgProperty_finiteTypeCoordinateHopfAlgebra`
(`SpecialOrthogonal/Reductive.lean`) for the standard `SOₙ` over every field with `2 ≠ 0`. The
worked examples consume them.

### Native group-scheme dictionaries, Jordan decomposition and tori

- **The affine dictionary (Layer 0).** Over every commutative ring `S`,
  `TauCeti.commHopfAlgCatOpEquivAffineGroupSchemeCat S : (CommHopfAlgCat S)ᵒᵖ ≌ AffineGroupSchemeCat S`
  (`AlgebraicGeometry/AffineGroupScheme/Equivalence.lean`) is the anti-equivalence by `Spec`, with
  `TauCeti.commHopfAlgCatOpEquivAffineGroupSchemeCat.functorCompιIso` identifying its forward functor
  with Mathlib's `hopfSpec`; `TauCeti.AffineGroupSchemeCat.hopfSpecCoordinateHopfAlgebraIso`
  identifies an affine group scheme with the Hopf spectrum of its coordinate Hopf algebra, and
  `CommRingCat.globalSectionsHopfSpecIso` (`GlobalSections.lean`) the global sections of a Hopf
  spectrum with the original Hopf algebra. `TauCeti.AffineGroupSchemeCat.algebraPointsFunctorIsoCoordinatePointsFunctor`
  (`Points.lean`) is a natural isomorphism of group-valued functors from the scheme points of an
  affine group scheme to the convolution points of its coordinate Hopf algebra, with no
  finite-type or smoothness hypothesis. `TauCeti.algebraFiniteType_iff_locallyOfFiniteType_hopfSpec`
  and `TauCeti.finiteTypeCommHopfAlgCatOpEquivFiniteTypeAffineGroupSchemeCat` (`FiniteType.lean`),
  and `TauCeti.algebraSmooth_iff_smooth_hopfSpec` (`Smooth.lean`), transport finite type and
  smoothness. `TauCeti.CommHopfAlgCat.pointsFunctor_faithful`,
  `TauCeti.CommHopfAlgCat.pointsFunctor_full` and `TauCeti.CommHopfAlgCat.essImage_pointsFunctor`
  (`Algebra/AlgebraicGroup/CommHopfAlgCat/Yoneda.lean`) make the points functor fully faithful,
  with essential image the group-valued functors whose underlying functor is corepresentable;
  fullness and the essential image are stated with the Hopf algebra and the value algebras in
  the universe of the base ring.
- **Point representations (Layer 1.1).** For a commutative Hopf algebra `H` over a commutative
  ring `R` and an `R`-module `V`, in independent universes,
  `TauCeti.HopfAlgebra.pointRepresentationEquivComodule`
  (`Algebra/AlgebraicGroup/Representation/Comodule/Basic.lean`) is a bijection between natural
  actions of the point groups on the scalar extensions `A ⊗ V` and right `H`-comodule structures
  on `V`, recovering the coaction at the universal point, with no finiteness, freeness, flatness
  or nontriviality hypothesis; `TauCeti.pointRepresentationCategoryEquivalence`
  (`Comodule/Equivalence.lean`) upgrades it to an equivalence of categories, and
  `TauCeti.fgPointRepresentationCategoryEquivalence` (same file) restricts it to finitely
  generated point representations and finitely generated comodules, which over a field are the
  finite-dimensional ones.
- **Closed subgroups and kernels (Layer 3).** `TauCeti.HopfIdeal`
  (`Algebra/HopfAlgebra/HopfIdeal/Basic.lean`) is a two-sided ideal `I` with
  `Δ(I) ⊆ I ⊗ H + H ⊗ I`, on which the counit vanishes and which the antipode preserves; its
  quotient instances need no reducedness or smoothness. `TauCeti.HopfIdeal.IsNormal`
  (`Algebra/AlgebraicGroup/HopfIdeal/Normal/Basic.lean`) asks that the coordinate map of
  conjugation carry `I` into the right tensor ideal `H ⊗ I`, the first tensor factor being the
  conjugating element. Over every commutative ring `R`,
  `TauCeti.CommHopfAlgCat.hopfIdealOrderIsoClosedSubgroup`
  (`Algebra/AlgebraicGroup/HopfIdeal/Scheme/Classification.lean`) is an order isomorphism from
  the Hopf ideals of `H`, ordered by reverse inclusion, to the closed subgroup schemes of
  `Spec H` (Milne, Definition 3.10 and Propositions 3.12 and 3.15, pp. 67–68, over a field); its
  inverse is the defining ideal, not the vanishing ideal of the field-valued points.
  `TauCeti.CommHopfAlgCat.kernelSpec` and `TauCeti.CommHopfAlgCat.isPullback_kernelSpec`
  (`HopfIdeal/Scheme/Kernel.lean`) give the kernel of a homomorphism as the closed subgroup cut out
  by the kernel Hopf ideal and as the fibre over the identity section, a pullback of group schemes.
  Over a field `k`, for a morphism `f : H ⟶ K` of commutative Hopf `k`-algebras,
  `TauCeti.CommHopfAlgCat.image` and `TauCeti.CommHopfAlgCat.imageι`
  (`Algebra/AlgebraicGroup/HopfIdeal/Quotient/Image/Basic.lean`) are the quotient `H/ker f` and its
  injective morphism to `K`, through which `f` factors; geometrically, `Spec (H/ker f)` is the
  closed image of the group `Spec K` in `Spec H`. `TauCeti.CommHopfAlgCat.faithfullyFlat_imageι`
  (`HopfIdeal/Quotient/Image/FaithfullyFlat.lean`) makes `imageι f` faithfully flat when `H` and
  `K` are of finite type in the universe of `k` and `K` is geometrically reduced
  (`[Algebra.IsGeometricallyReduced k K]`); a nonreduced source such as `μ_p` in characteristic `p`
  is outside it. `TauCeti.AlgHom.faithfullyFlatDescentMulEquiv`
  (`Algebra/AlgebraicGroup/FaithfullyFlatDescent.lean`) identifies, for a Hopf algebra over a
  commutative semiring and commutative rings `A → B` with `B` faithfully flat over `A`
  (`[Module.FaithfullyFlat A B]`), the convolution group of `A`-points with the `B`-points whose two
  restrictions to `B ⊗_A B` agree. Over an algebraically closed field `k`, for
  `H : FiniteTypeCommHopfAlgCat.{u, u} k`, `TauCeti.FiniteTypeCommHopfAlgCat.identityComponentSpec`
  and `TauCeti.FiniteTypeCommHopfAlgCat.identityComponentSpecι`
  (`Algebra/AlgebraicGroup/Connected/GroupScheme.lean`) are the identity-component group scheme
  and its closed immersion into `Spec H`, with no smoothness hypothesis, and
  `TauCeti.HopfIdeal.identityComponent` (`HopfIdeal/IdentityComponent.lean`) is the Hopf ideal of
  `H` cutting out the identity component of the closed subgroup cut out by a Hopf ideal.
  `TauCeti.FiniteTypeAffineGroupSchemeCat.instFiniteConnectedComponents`
  (`AlgebraicGeometry/AffineGroupScheme/Components/Finite.lean`) gives the underlying space of a
  finite-type affine group scheme over a Noetherian ring finitely many connected components; it
  does not construct the étale component group scheme `π₀`.
- **Jordan decomposition (Layer 4).** For a commutative Hopf algebra `H` over a field `k` and a
  perfect extension field `K`, with `k`, `H` and `K` in one universe,
  `TauCeti.HopfAlgebra.Point.jordanDecomposition`, `TauCeti.HopfAlgebra.Point.jordanDecomposition_spec`
  and `TauCeti.HopfAlgebra.Point.isSemisimple_isUnipotent_unique`
  (`Algebra/AlgebraicGroup/Representation/JordanDecomposition/Basic.lean`) give the unique
  commuting factorization `g = g_s g_u` of a `K`-point whose factors act semisimply and
  unipotently in every finite-dimensional comodule, and
  `TauCeti.HopfAlgebra.Point.jordanDecomposition_mapDomain` (`Naturality.lean`) its compatibility
  with homomorphisms, `TauCeti.HopfAlgebra.Point.jordanDecomposition_mapValue`
  (`ScalarExtension.lean`) its compatibility with extension between perfect value fields, and
  `TauCeti.HopfAlgebra.Point.jordanDecomposition_mul_of_commute` (`Commuting.lean`) the
  decomposition of a product of commuting points as the product of their factors. No finite type
  is assumed of `H`.
- **Tori (Layer 4).** For a torus over a field `k`,
  `TauCeti.TorusCommHopfAlgCat.instCharacterCocharacterPairingIsPerfPair` and
  `TauCeti.TorusCommHopfAlgCat.finrank_cocharacterLattice_eq_characterLattice`
  (`Algebra/AlgebraicGroup/Torus/Cocharacter/Basic.lean`) make the character–cocharacter pairing
  perfect and the two lattices free of the same rank. `TauCeti.TorusCommHopfAlgCat.characterLatticeFunctor`
  (`Torus/CharacterLattice/Functoriality.lean`), from coordinate Hopf algebras of tori to
  continuous integral Galois lattices, is faithful and essentially surjective over every field and,
  by `TauCeti.TorusCommHopfAlgCat.characterLatticeFunctor_isEquivalence`
  (`Torus/CharacterLattice/Equivalence.lean`), an equivalence over a perfect field (Milne,
  Theorem 12.23, p. 240, for tori). `TauCeti.splitTorusCommHopfAlgProperty_coordinateRing` and
  `TauCeti.torusCommHopfAlgProperty.iff_multiplicativeType_and_geometricallyConnected_and_geometricallyReduced`
  (`Torus/Characterization.lean`) make `k[M]` a split torus for torsion-free `M` and characterize
  tori as the geometrically connected, geometrically reduced groups of multiplicative type.
- **Centre, derived group and isogenies (Layer 6).** `TauCeti.CommHopfAlgCat.centerDefiningIdeal`
  (`Algebra/AlgebraicGroup/Center/Basic.lean`, over a field) cuts out the centre, representing the
  universally central points; `TauCeti.CommHopfAlgCat.derivedDefiningIdeal`
  (`Derived/Basic.lean`, over a commutative semiring) the derived subgroup, the smallest closed
  subgroup containing the image of the commutator morphism;
  `TauCeti.CommHopfAlgCat.IsCentralIsogeny` (`Isogeny/Basic.lean`, over a commutative ring) is a
  finite faithfully flat coordinate morphism with central kernel, and
  `TauCeti.CommHopfAlgCat.IsIsogeny` (same file) is the same condition without centrality, the
  one the special isogenies of 9B satisfy, whose kernels are infinitesimal and noncentral; and
  `TauCeti.simplyConnectedSemisimpleCommHopfAlgProperty` (`SimplyConnected/Basic.lean`) and
  `TauCeti.adjointSemisimpleCommHopfAlgProperty` (`Adjoint/Basic.lean`) are the simply connected
  and adjoint semisimple predicates over a field.
- **Dynamic Levi quotient (Layer 7).** For a cocharacter `λ` of an affine group over any
  commutative ring, `BialgHom.parabolicLeviFppfQuotientIso`
  (`Algebra/AlgebraicGroup/Dynamic/Levi/Quotient.lean`) identifies the fppf quotient
  `P(λ)/U(λ)` with `Z(λ)`, and `BialgHom.injOn_conjugate_leviDefiningHopfIdeal`
  (`Dynamic/Conjugation.lean`) shows that distinct rational points of `U(λ)` conjugate `Z(λ)` to
  distinct Levi subgroups of `P(λ)`; no field, smoothness or reductivity hypothesis is used.

### Native Tits systems, normalizers and fixed lifts

- **Tits systems.** `TauCeti.TitsSystem` (`GroupTheory/TitsSystem/Basic.lean`) is a Tits system
  `(G, B, N, S)` in an abstract group, with `S` a generating set of involutions in
  `N/(B ∩ N)` satisfying the multiplication axiom `sBw ⊆ BwB ∪ BswB` and `sBs ⊄ B`;
  `TauCeti.TitsSystem.existsUnique_mem_bruhatCell` (`Bruhat/Uniqueness.lean`) is the Bruhat
  decomposition of `G` into the double cosets indexed by the Weyl quotient. `TauCeti.glTitsSystem`
  and `TauCeti.slTitsSystem` (`LinearAlgebra/Matrix/{GeneralLinearGroup,SpecialLinearGroup}/Diagonal/TitsSystem.lean`)
  are the standard Tits systems of `GLₙ₊₁(k)` and `SLₙ₊₁(k)` with `N` the normalizer of the
  diagonal torus's rational points, over a field whose unit group is nontrivial.
- **Normalizers of split tori.** For a surjective bialgebra map `π : O(G) → R[X]` presenting a
  closed diagonalizable subgroup over a commutative ring `R`,
  `BialgHom.normalizerPoints` (`Algebra/AlgebraicGroup/DiagonalizableGroup/Normalizer/Character.lean`)
  is the subgroup of rational points whose conjugation preserves its defining Hopf ideal, the
  rational points of the scheme normalizer; `BialgHom.normalizerHopfIdeal` (`Normalizer/Scheme.lean`)
  is that normalizer as a closed subgroup scheme, over any commutative ring.
- **Fixed lifts (Layer 7a).** `MonoidHom.exists_fixed_inv_mul_of_surjective_commutatorMap` and
  `MonoidHom.exists_fixed_lift_of_surjective_commutatorMap` (`GroupTheory/FixedSubgroup/Lang.lean`)
  correct an element `n` with `n F(n)⁻¹` in the image of an `F`-equivariant `ι : T → G`, whose
  Lang map `t ↦ t f(t)⁻¹` is surjective, to an `F`-fixed element of the same coset `ι(T) n`, and
  lift fixed points through an equivariant surjection with such a kernel. This is the right-coset
  form, with Mathlib's Lang map `t ↦ t / F t`; Layer 7a states its coset bijection in the
  left-coset form `x ↦ x⁻¹σ(x)`, and the two Lang maps have the same image up to inversion.
  `TauCeti.FiniteField.rationalPointsMulEquivFixedSubgroupGeometricFrobenius`
  (`Algebra/AlgebraicGroup/Frobenius/FiniteField.lean`) identifies `G₀(F_q)` with the points of
  the base change over a domain fixed by the geometric Frobenius.

### Native signed ADE Lie algebras and explicit carriers

- **The ordered sign cover and the shell Lie algebra (9A.1a).** For a Gram matrix `B` on a
  linearly ordered finite set, `Matrix.SignCover` (`LinearAlgebra/Matrix/OrderedSignCover.lean`) is
  the central extension of the lattice by `ℤˣ` with the ordered sign cocycle, with central sign
  `Matrix.SignCover.tau` and commutator formula `Matrix.commutatorElement_signCover` for symmetric
  `B` with even diagonal. `Matrix.SignCover.inv_canonicalSection` gives the inverse lift
  `(a,1)⁻¹=ε(a,a)(−a,1)`, and `Matrix.forall_canonicalSection_signFactorSet_mul_iff_of_isSimplyLaced`
  (`OrderedSignCover/SimplyLaced.lean`) makes the section `a↦(a,1)` a homomorphism exactly when
  the simply laced diagram has no bonds. `Matrix.SignCover.reindex`
  (`OrderedSignCover/Reindex.lean`) relabels the cover under a change of order or a diagram
  automorphism by the inversion sign, with the coboundary identity
  `Matrix.negOnePow_orderedSignForm_mul_inversionSign_add` and exact order
  `Matrix.SignCover.orderOf_reindex` (`OrderedSignCover/Order.lean`).
  `Matrix.IsSymm.add_mem_normTwoShell_iff` (`LinearAlgebra/Matrix/NormTwoShell/Basic.lean`) puts
  `a+b` in the norm-two shell exactly when `B(a,b)=−1`. `Matrix.ShellLieAlgebra` (`Algebra/Lie/NormTwoShell/Basic.lean`) is the
  carrier `Q × (Φ →₀ ℤ)` on the norm-two shell `Φ`, with the signed bracket, alternation and
  antisymmetry for symmetric `B` with even diagonal and the Jacobi identity
  `Matrix.ShellLieAlgebra.lie_jacobi` and Lie ring `Matrix.ShellLieAlgebra.lieRing` for positive
  definite `B` with even diagonal. `Matrix.ShellLieAlgebra.isSerreSystem` and
  `Matrix.ShellLieAlgebra.serreLift_surjective` (`Serre.lean`) give the Serre relations and a
  surjection from the Serre presentation over `ℤ` for a simply laced Cartan matrix;
  `Matrix.ShellLieAlgebra.normalizedBasis` (`ChevalleyBasis.lean`) the inverse-lift-normalized
  Chevalley basis; `Matrix.FullShellLieAlgebra` (`FullCartan/Basic.lean`) the same algebra with
  Cartan part a full cocharacter group `Y`; `Matrix.ShellLieAlgebra.coverLieEquiv` and
  `Matrix.ShellLieAlgebra.coverEquiv_eq_refl_iff` (`CoverLift.lean`) the Lie isomorphism of a
  kernel-fixing cover homomorphism over a lattice isometry and its faithfulness;
  `Matrix.ShellLieAlgebra.reindexLieEquiv` (`Reindex.lean`) the relabelling by a reordering or a
  diagram automorphism; and `TauCeti.typeAShellLieEquiv` (`TypeA.lean`) the isomorphism with
  `sl (Fin (r + 1)) ℤ` in type `A_r`. The integral-lattice dictionary is
  `TauCeti.IntegralLattice.integralForm` (`LinearAlgebra/IntegralLattice/Basic.lean`), the
  integer-valued form on the carrier of a full lattice in a rational vector space with a symmetric
  bilinear form integral on it, with
  `TauCeti.IntegralLattice.rationalizationIsometry`, `TauCeti.IntegralLattice.ofIntegralForm` and
  `TauCeti.IntegralLattice.ofIntegralForm.carrierIsometry` (`IntegralLattice/Rationalization.lean`):
  the base change of that form to `ℚ` is isometric to the ambient form, and a symmetric integral
  form on a finite free `ℤ`-module is the integral form of a lattice in its rationalization.
- **Fixed lattices and folding (9A.1b).** For a diagram automorphism `σ`,
  `Matrix.ShellLieAlgebra.fixedBasis` (`FixedBasis.lean`) is the integral basis of the fixed
  submodule of the pinned action, by orbit sums of vertices and signed sums over root cycles of
  monodromy `1`; `TauCeti.WeightedCycle.fixedEquivTorsion` (`LinearAlgebra/WeightedCycle/Basic.lean`)
  identifies the fixed coefficients of one cycle, which are `A` for monodromy `1` and `A[2]` for
  monodromy `−1`; `Module.Basis.fixedSubmoduleBaseChange_surjective_iff`
  (`WeightedCycle/Family/BaseChange.lean`) and
  `Matrix.ShellLieAlgebra.fixedSubmoduleBaseChange_surjective_iff` (`NormTwoShell/BaseChange.lean`)
  make scalar extension of the fixed lattice surjective exactly when there is no negative cycle or
  the coefficient ring has no `2`-torsion. `SimpleGraph.IsAcyclic.exists_graphCartanMatrix_sum_orbit`
  (`Combinatorics/SimpleGraph/OrbitCartan.lean`) gives the orbit column sum `d_O ∈ {1, 2}`;
  `Matrix.foldedCartanMatrix` (`LinearAlgebra/Matrix/Cartan/Folding/Basic.lean`) is the folded
  Cartan matrix with `H` rows and `E` columns; `Matrix.ShellLieAlgebra.isSerreSystem_folded`
  (`NormTwoShell/Folding.lean`) makes the folded frame a fixed Serre system for it; and
  `TauCeti.D4Triality.invariantRoot` (`NormTwoShell/TrialityD4.lean`) lists the twelve signed
  invariant root vectors of `D₄` triality.
- **Explicit carriers (9B).** `TauCeti.G2ShortRoot.PrimeField.specialIsogenyHom`, with the
  Frobenius square `TauCeti.G2ShortRoot.PrimeField.specialIsogenyHom_comp_self` and the pinning
  equations `TauCeti.G2ShortRoot.PrimeField.specialIsogeny_rootSubgroupPoints`
  (`Algebra/Lie/G2/ShortRoot/PrimeField/SpecialIsogeny.lean`), is the special isogeny of the
  short-root `G₂` carrier in `GL₇` over `𝔽₃`, which is reductive by
  `TauCeti.G2ShortRoot.PrimeField.reductiveCommHopfAlgProperty_finiteTypeCarrierAlgebra`
  (`Reductive.lean`); `TauCeti.F4ShortRoot.PrimeField.specialIsogenyHom`, with
  `TauCeti.F4ShortRoot.PrimeField.specialIsogenyHom_comp_self` and
  `TauCeti.F4ShortRoot.PrimeField.specialIsogeny_rootSubgroupPoints`
  (`Algebra/Lie/F4/ShortRoot/PrimeField/QuotientSpecialIsogeny.lean`), is that of the short-root
  `F₄` carrier in `GL₂₆` over `𝔽₂`, reductive by
  `TauCeti.F4ShortRoot.PrimeField.reductiveCommHopfAlgProperty_finiteTypeCoordinateHopfAlgebra`.
  `TauCeti.D4Tripled.groupScheme` (`Algebra/Lie/D4/Tripled/GroupScheme.lean`) is the tripled
  twenty-four-dimensional `D₄` toral closure in `GL₂₄` over `ℤ`, with
  `TauCeti.D4Tripled.trialityAutomorphism` and `TauCeti.D4Tripled.trialityAutomorphism_pow_three`
  (`Triality/Basic.lean`). `TauCeti.UniversalEnvelopingAlgebra.kostantElementarySubgroup`
  (`Kostant/RootSubgroup/Elementary/Basic.lean`) is the elementary group `E(A)` generated by the
  Kostant root subgroups on an admissible lattice, functorial in `A`, and
  `TauCeti.UniversalEnvelopingAlgebra.kostantToralGroupScheme`
  (`Kostant/RootSubgroup/Scheme/ToralClosure/Basic.lean`) the closed subgroup scheme of `GLₙ`
  over `ℤ` generated by those root subgroups and a weight torus. Its inputs are a Lie algebra `L`
  over `ℚ` with vectors `e : I → L` and `h : κ → L`, `κ` finite, a representation
  `ρ : U_ℚ(L) →ₐ[ℚ] End_ℚ(V)`, an additive lattice `M ⊆ V` stable under
  `TauCeti.UniversalEnvelopingAlgebra.kostantForm e h` on which every `ρ(e i)` is nilpotent, a
  basis `b : Basis (Fin n) ℤ M` and integral weights `wt : Fin n → κ → ℤ`. Its coordinate Hopf
  algebra is `CommHopfAlgCat.quotient (TauCeti.GeneralLinear.coordinateHopfAlgebra ℤ n) J`
  (`Algebra/AlgebraicGroup/HopfIdeal/Quotient/Basic.lean`,
  `GeneralLinear/Coordinate/HopfAlgebra.lean`), with
  `J = TauCeti.UniversalEnvelopingAlgebra.kostantToralDefiningIdeal e h ρ M hM hnil b wt` the
  largest Hopf ideal killed by every root-subgroup coordinate map and by the weight-torus
  coordinate map. In `ToralClosure/Points.lean`,
  `TauCeti.UniversalEnvelopingAlgebra.kostantToralSchemePointMulEquiv` identifies the convolution
  points `WithConv (O(G) →ₐ[ℤ] A)` of that quotient with the scheme points over `Spec A`, for
  `A : Type`, `TauCeti.UniversalEnvelopingAlgebra.kostantToralPointsSubgroup` is the subgroup of
  `GLₙ(A)` formed by those points, and
  `TauCeti.UniversalEnvelopingAlgebra.kostantToralRootSubgroupPoints` and
  `TauCeti.UniversalEnvelopingAlgebra.kostantToralWeightTorusPoints` are the root-subgroup
  homomorphisms `A → G(A)` and the weight-torus homomorphism `(κ → Aˣ) → G(A)`; that subgroup
  contains the subgroup generated by their images, and no equality is asserted.
  `TauCeti.UniversalEnvelopingAlgebra.isTorsionFree_kostantToralCoordinateHopfAlgebra`
  (`ToralClosure/Flat.lean`) makes the coordinate Hopf algebra torsion-free, hence flat, over
  `ℤ`; it gives no smoothness, no commutation of the generated subgroup scheme with base change
  and no equality on specialization. None of these carriers is identified in the library with
  the pinned simply connected group of its type.
- **The special linear group (9B.4).** For every commutative ring `R` and every `n ≥ 0`,
  `TauCeti.SpecialLinear.coordinateHopfAlgebra R n`, with quotient map
  `TauCeti.SpecialLinear.coordinateMap R n` (`Algebra/AlgebraicGroup/SpecialLinear/Basic.lean`), is
  the quotient of the general linear coordinate Hopf algebra, the localization
  `R[x_ij][det⁻¹]`, by the determinant-kernel Hopf ideal, which
  `TauCeti.SpecialLinear.definingHopfIdeal_toIdeal` shows is generated by `det − 1`.
  `TauCeti.SpecialLinear.pointsMulEquiv` is a group isomorphism from the convolution group of its
  `A`-points to `Matrix.SpecialLinearGroup (Fin n) A` for every commutative `R`-algebra `A`, natural
  in `A` by `TauCeti.SpecialLinear.pointsMulEquiv_mapValue` and `TauCeti.SpecialLinear.pointsNatIso`.
  In `StandardComodule.lean`, `TauCeti.SpecialLinear.coefficientMatrix_basisFun` identifies the
  coefficient matrix of the standard comodule `Rⁿ` with the image of the generic matrix of `GLₙ`,
  `TauCeti.SpecialLinear.map_antipode_coefficientMatrix` makes its antipode the adjugate, and
  `TauCeti.SpecialLinear.ofConv_coefficientMatrix` evaluates an `A`-point on it as the matrix of
  that point. `TauCeti.Comodule.comul_coefficientMatrix_eq_sum` and
  `TauCeti.Comodule.counit_coefficientMatrix`
  (`Algebra/Coalgebra/Comodule/MatrixCoefficient/Matrix.lean`) give the comultiplication of a
  coefficient entry as a matrix product across the two tensor factors, for a comodule with a
  finite basis, and its counit as the identity-matrix entry, for any basis.
  `TauCeti.SpecialLinear.diagonalRootDatum r` (`SpecialLinear/DiagonalTorus/RootDatum.lean`) is the
  root datum of `SL_(r+1)` relative to its diagonal torus, the simply connected datum of type `A_r`
  on the lattices `Fin r →₀ ℤ` and `Fin r → ℤ`, with `Fin r` lifted by `ULift` to a chosen
  universe. No polynomial presentation of the coordinate algebra without the determinant
  localization, and no comparison with the pinned group of Layer 9, is in the library.

### Native complex-point topology

`TauCeti/Topology/Algebra/PointTopology/` puts a topology on the points of a scheme over `k`
with values in a topological `k`-algebra `R`; Layer 3A.5 uses it for every local `R` whose units
are open with continuous inversion, and takes `k = R = ℂ` with its usual topology for the
complex comparisons. For an affine scheme `Spec A`, `TauCeti.PointTopology.topology`
(`Basic.lean`) is the
coarsest topology on `A →ₐ[k] R` making every evaluation `x ↦ x a` continuous, with no finiteness
or separation hypothesis; `TauCeti.PointTopology.isEmbedding_eval_generators` embeds the points
in `ι → R` by any generating family `a : ι → A`, as a closed subspace when `R` is T1
(`TauCeti.PointTopology.isClosedEmbedding_eval_generators`), so the topology is the zero-locus
topology of every presentation and depends on none; `TauCeti.PointTopology.polynomialHomeomorph`
and `TauCeti.PointTopology.mvPolynomialHomeomorph` identify the points of the affine line and of
affine space with `R` and `σ → R`. `TauCeti.PointTopology.continuous_comap` and
`TauCeti.PointTopology.isClosedEmbedding_comap_of_surjective` (`Functoriality.lean`) make a
coordinate-algebra map continuous on points and a surjection a closed embedding over a T1 ring;
`TauCeti.PointTopology.isEmbedding_localization` and
`TauCeti.PointTopology.isOpenEmbedding_localization` (`Localization.lean`) make the points of a
localization away from `f` an open subspace, the points at which `f` is a unit, when
`Units.val : Rˣ → R` is an embedding and the units of `R` are open, as for `R = ℂ`;
`TauCeti.PointTopology.relativeTensorProductHomeomorph` (`FiberProduct.lean`) identifies the
points of `A ⊗[C] B` with the fibre product of point spaces; `TauCeti.PointTopology.instT2Space`,
`TauCeti.PointTopology.instSecondCountableTopology` and
`TauCeti.PointTopology.locallyCompactSpace_of_finiteType` (`Separation.lean`, `Basic.lean`)
transport Hausdorffness, and for `A` of finite type second countability and local compactness,
from `R`. For a Hopf algebra `H`, `TauCeti.PointTopology.isTopologicalGroup` (`Group.lean`) makes
the convolution group `WithConv (H →ₐ[k] R)` a topological group, with
`BialgHom.continuous_mapDomain` and `AlgHom.continuous_mapValue` the continuity of the maps
induced by a bialgebra map and by a continuous change of coefficients. For a scheme `X` with
structure morphism `f : X ⟶ Spec k`, `TauCeti.SchemePointTopology.Points f` (`Scheme.lean`) is the
set of morphisms `Spec R → X` over `Spec k`, and `TauCeti.SchemePointTopology.topology` is the
finest topology for which every affine open chart `Spec A → X` is continuous from the affine
topology (`TauCeti.SchemePointTopology.continuous_chartPoint`,
`TauCeti.SchemePointTopology.isOpen_iff`, `TauCeti.SchemePointTopology.continuous_iff`); over a
local `R` every point lies in some affine open chart
(`TauCeti.SchemePointTopology.exists_mem_range_chartPoint`), and on an affine scheme the two
topologies agree (`TauCeti.SchemePointTopology.affineHomeomorph`). The library does not state
that an affine open chart is an open embedding of point spaces, nor the continuity of a scheme
morphism on points, nor a scheme-level fibre-product, immersion, reduction, separatedness,
local-compactness or properness comparison; these are the targets of Layer 3A.5. The topology
and the topological group are consumed, not restated.

Split maximal tori and pinnings over a commutative ring `R`, for a finite-type coordinate Hopf
algebra, consumed by Layer 8:
- `TauCeti.SplitMaximalTorus` (`TauCeti/Algebra/AlgebraicGroup/SplitTorus/Maximal.lean`): a
  surjective coordinate map onto the Hopf algebra of the split torus of rank `r` whose kernel is
  a maximal torus on every geometric fibre, with transport along an isomorphism
  (`TauCeti.SplitMaximalTorus.comapOfIso`) and base change along `R → S`
  (`TauCeti.SplitMaximalTorus.baseChange`). It does not ask for free root spaces or for constant
  roots and coroots, and it carries no root datum.
- `TauCeti.HopfIdeal.IsBorelOver` (`Borel/Over.lean`): a Hopf ideal whose quotient is smooth
  over `R` and which cuts out a Borel subgroup on every geometric fibre, stable under base
  change (`TauCeti.HopfIdeal.IsBorelOver.baseChange`). It records no positive system.
- `TauCeti.Pinning` (`Pinning/Basic.lean`), for `H` smooth over `R` with
  `ConnectedSpace (PrimeSpectrum R)`: relative reductivity, a split maximal torus, a Borel
  ideal containing it, and for every simple root an `R`-linear equivalence from `R` onto its
  root space. The simple roots are read off from the torus and the Borel
  (`TauCeti.SplitMaximalTorus.IsSimpleRoot`: the adjoint weights whose weight space lies in the
  Lie algebra of the Borel and which are not sums of two such); no root datum is an input, the
  root spaces of the other roots are not asked to be free, and a disconnected or empty spectrum
  is excluded by the instance.
- `TauCeti.Pinning.comapOfIso` and `TauCeti.Pinning.comapOfIso_rootVector`
  (`Pinning/Isomorphism.lean`): transport of a pinning along an isomorphism of coordinate Hopf
  algebras, the root vectors being carried by its differential.
  `TauCeti.Pinning.rootSpaceBaseChangeEquiv` (`Pinning/BaseChange.lean`) compares one
  scalar-extended simple root space with a root space of a second, independently given pinning;
  the library has no base change of a pinning as a whole.

Layer 8 keeps what these omit: the split datum with constant roots and coroots and free root
spaces, pinnings over disconnected bases through a constant positive system, base change of
pinnings, and the equivalence with normalized simple-root parameterizations.

### From TauCetiRoadmap.SchemeAndStackFoundations

Section 1.1 supplies effective fpqc descent of quasi-coherent modules and the
stack of sheaves; §§1.5, 1.13–1.16 supply quotient sheaves, group spaces, torsors, and
contracted products and twisting with the classification of forms by nonabelian H¹.
Section 0.7 supplies the dimension theory, including the dimension of fibres, used by
Layer 7a. These contracts do not assert representability of every algebraic-group quotient.
Section 0.8 supplies étale coordinates for smooth morphisms; §4.12 supplies Chow's lemma.
Section 0.9 supplies limits of schemes along affine transition maps, Noetherian approximation and
finite-presentation descent of schemes and morphisms along limits of quasi-compact
quasi-separated schemes, with properties such as smoothness and being an isomorphism descending
to a finite stage; Layer 9D uses it for the reduction to a Noetherian base and, affine-locally,
to descend finite group-law diagrams.

### From TauCetiRoadmap.ModularCurves

Section 0E supplies affine descent for a finite locally free base morphism and an affine
finitely presented source, including arbitrary base change. Layer 9D takes `Res_(K/k) 𝔾_m`
from Tau Ceti's `TauCeti.Algebra.WeilRestriction` (supplier contracts) and needs no
Weil-restriction construction from this supplier.

### From TauCetiRoadmap.RootSystems

[RootSystems](../RepresentationTheory/RootSystems/README.md) §5.1 supplies the Weyl/based
factorization of root automorphisms: for a finite reduced crystallographic root pairing over a
characteristic-zero domain, `R = ℤ` included, and a base, the Weyl group complements the
subgroup of automorphisms preserving the base. Precisely, with `D` the automorphisms preserving
the simple support of the base: `W` is normal in `Aut(P)`, `W ∩ D = {1}`, every automorphism
factors uniquely as `wδ` with `w ∈ W` and `δ ∈ D`, and `(w, δ) ↦ wδ` is an equivalence
`W ⋊ D ≃ Aut(P)` with product `(w, δ)(v, η) = (wδ(v), δη)`; §5.1 also supplies the
reflection-conjugation law `a s_α a⁻¹ = s_(aα)` and transport under change of base (Milne, C.22
and Proposition C.53, pp. 612, 624). §5.2 identifies that based subgroup, for a
spanning system, with the Cartan-preserving permutations of the simple roots. §9A.1a-L consumes
both on the ADE root lattice and does not rederive them.

### Native quotient and isometry interfaces

Use `TauCeti.CommHopfAlgCat.fppfQuotientSheaf` from
`TauCeti/Algebra/AlgebraicGroup/Fppf/Quotient/Basic.lean` for a commutative Hopf
algebra and a normal Hopf ideal, and `CommHopfAlgCat.fppfHomogeneousQuotient` from
`Fppf/Quotient/Homogeneous/Basic.lean` for an arbitrary closed subgroup, with its
projection, its universal property for right-invariant maps
(`CommHopfAlgCat.fppfHomogeneousQuotientHomEquiv`) and the torsor square
`G × N ≅ G ×_(G/N) G` of `Homogeneous/Torsor.lean`
(`CommHopfAlgCat.isPullback_fppfHomogeneousQuotientTorsor`). Each underlying sheaf is the
sheafification of the pointwise coset presheaf; neither definition makes a representability
assertion.
`TauCeti.HopfIdeal.coinvariants` (`HopfIdeal/Coinvariants/Basic.lean`) is the subalgebra of
functions invariant under right translation by the subgroup. For a geometrically reduced
finite-type Hopf algebra over a field and a normal Hopf ideal,
`TauCeti.CommHopfAlgCat.coinvariantsFppfQuotientIso` (`Fppf/Quotient/Coinvariants.lean`)
represents the fppf quotient sheaf by the coinvariant Hopf algebra
`TauCeti.CommHopfAlgCat.coinvariants`. For an arbitrary closed subgroup,
`TauCeti.HopfIdeal.fppfHomogeneousQuotientToCoinvariantsPoints`
(`Fppf/Quotient/Homogeneous/Coinvariants.lean`) is the map from the homogeneous quotient to the
fppf sheaf of points of `Spec` of the coinvariants induced by restricting points.
`TauCeti.HopfIdeal.isIso_fppfHomogeneousQuotientToCoinvariantsPoints_of_isLinearlyReductive`
makes it an isomorphism when the ambient Hopf algebra is geometrically reduced and of finite
type over a field and the subgroup is linearly reductive, with no normality, smoothness or
connectedness hypothesis on the subgroup; in characteristic zero
`TauCeti.HopfIdeal.isIso_fppfHomogeneousQuotientToCoinvariantsPoints_of_reductive` does the same
for a reductive closed subgroup of any finite-type group,
`TauCeti.HopfIdeal.isIso_fppfHomogeneousQuotientToCoinvariantsPoints_ker_of_reductive` for a
closed immersion of a reductive group, and
`TauCeti.Comodule.isIso_fppfHomogeneousQuotientToCoinvariantsPoints_ker_coordinateBialgHom` for
`GLₙ/G` with `G → GLₙ` a faithful representation of a reductive `G`.
`TauCeti.HopfIdeal.fppfHomogeneousQuotientIsoCoinvariantsPoints` packages the isomorphism,
`TauCeti.HopfIdeal.coinvariantsPointsHomEquiv` is its universal property for right-invariant maps,
`TauCeti.HopfIdeal.finiteType_coinvariants_of_isLinearlyReductive` is finite generation of the
invariants, and `TauCeti.HopfIdeal.fppfHomogeneousQuotientBaseChangeIso`
(`Homogeneous/BaseChange.lean`) identifies the quotient after any field extension `K/k` with
`Spec (K ⊗[k] O(G)^N)`. Use
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
integral pinned models before Layer 9D proves classification and relative extensions.
Layer 9E then applies the explicit §9B carriers to Steinberg fixed points.
Within representation theory the order is §9C distributions and Frobenius section →
§10A rational integration → §10A.1 contraction; §9C does not use integration.
Layer 11 constructs spectral monodromy.
Suggested.lean states the statable headline theorems on pinned native carriers;
its module docstring identifies the missing carriers for the other endpoints.
The fppf topology, sheafification, torsors and generic descent are consumed from
the exact supplier contracts above. Quotient representability is proved separately
with the hypotheses stated at each group-specific application.

Citations of this roadmap in its earlier layer numbering map as follows (old → new):
- Layer 8, *classification and existence* (the isomorphism, isogeny and existence theorems,
  relative reductive groups with the schemes of maximal tori and of Borel subgroups, central
  isogenies and the simply connected and adjoint forms, and pseudo-reductive groups) → Layer 9D.
- Layer 8's bullet *Relative reductive groups over an affine Noetherian base* → Layer 9D's
  bullet *Relative reductive groups over an arbitrary affine base*, which drops the
  Noetherian hypothesis.
- Layer 7g, *Steinberg endomorphisms and extension of Layers 7a–7f* → Layer 9E.
- Layer 9B's bullets *Split reductive group schemes over a base* and *Pinnings* → §§8.1–8.2,
  the present Layer 8, *split groups and pinnings*.
- All other layer and section numbers, including 3A.1–3A.7, 5P, 6A, 6B, 7C, 7a–7f, 9A–9C
  and 10–11, are unchanged.

## Layer 0: the functor of points and the three-way dictionary

- **R-points as a group.** Keep `R` a commutative `k`-algebra and let the values `G(R)` be
  allowed to be noncommutative. Consume Tau Ceti's `WithConv`,
  `CommHopfAlgCat.pointsFunctor`, and `FiniteTypeCommHopfAlgCat.pointsFunctor`; prove
  convolution, identity, inverse, and naturality lemmas at their exact hypotheses where
  the named interfaces need them; do not introduce a parallel `AlgPoints` structure. The convolution is
  `(f * g)(a) = ∑ f(a₁) g(a₂)`, with counit identity and antipode inverse, not composition
  (Milne, §3.5, p. 66, for these equations).
  `GroupLike k A` is not the points functor: group-like elements form a commutative group,
  whereas `GLₙ(R)` can be noncommutative (Milne, Algebraic Groups (2017), §1.a and
  Proposition 1.21, pp. 11–12). *Needs:* Tau Ceti's `WithConv` points and points functors;
  Mathlib's convolution product.
- **The three model interfaces.** The anti-equivalence between commutative Hopf `R`-algebras and
  affine group schemes over `Spec R` (`TauCeti.AffineGroupSchemeCat`, the full subcategory of
  group objects over `Spec R` with affine underlying scheme), its unit and counit
  identifications, the natural isomorphism between scheme points and convolution points, the
  transport of finite type and smoothness, and the Yoneda description of the points functor are
  pinned (supplier contracts, *Native group-scheme dictionaries*; Milne, Proposition 3.6 and
  Corollary 3.7, pp. 66–67, for finitely generated Hopf algebras over a field) and consumed;
  Layer 0 restates none of them and states no further target here. Finite type and smoothness
  stay transported predicates, not objects built into either category, and the later layers
  use the pinned forms with scheme, Hopf carrier and test algebras in one universe, as the
  pinned fullness and essential-image theorems require. *Needs:* the pinned affine dictionary.
- **Base change and descent.** Consume Tau Ceti's finite-type Hopf-category and base-change
  functors, including compatibility of points under base change. Keep geometric notions
  after extension to `k̄`. Consume SchemeAndStackFoundations §1.1 and §§1.13–1.15, ModularCurves §0E,
  and the native fppf quotient sheaf (Milne, §5j, Definition 5.65 and Proposition 5.68,
  p. 116, for flat sheaves and sheafification). Construct the Hopf/points descent adapters
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
- For the zero test algebra, in which `0 = 1`, there is exactly one algebra map `O(G) → 0`, so
  `G(0)` is the one-element group; the points functor is not restricted to nonzero algebras.
- For `𝔾_a`, the point over `k[ε]/(ε²)` with `t ↦ ε` is the same algebra map in all three
  views; its image under `k[ε]/(ε²) → k` is the identity point, so `k`-points do not detect it.
  For the trivial group, with coordinate ring `k`, each view has exactly one point over every
  test algebra.
- Base change of `μ₂` from `ℤ` to `𝔽₂` sends `t² − 1` to `(t − 1)²`: the coordinate algebra
  stays two-dimensional and becomes nonreduced. Base change to `ℚ` gives a reduced algebra of
  dimension 2, so reducedness of one fibre does not give smoothness of every fibre.
- For `k = 𝔽_p(s)` and `K = k(s^{1/p})`, `αₚ` base-changes from `k[t]/(tᵖ)` to `K[t]/(tᵖ)`,
  still of dimension `p`: an inseparable extension does not remove nilpotents.

### Dependencies

Tau Ceti's affine group-scheme dictionary, points functors and base change (supplier
contracts); SchemeAndStackFoundations §1.1, §§1.13–1.15 and ModularCurves §0E for the descent
adapters.

## Layer 1: representations = comodules

- **Comodules and their finite-dimensional category.** Consume Tau Ceti's
  comodule structures, category, finite/rigid categories, tensor products, duals, and
  matrix-coefficient APIs. Complete the rational-representation/comodule comparison and
  regular representation at the exact field and finite-type hypotheses; do not define
  parallel comodule structures. For an affine group scheme `G` over a field `k`, transport
  the pinned point-representation/comodule equivalence (supplier contracts, *Native
  group-scheme dictionaries*) through Layer 0's scheme/points comparison, on arbitrary
  `k`-vector spaces and on the finite-dimensional subcategory: for `ρ(v) = ∑ vᵢ ⊗ aᵢ` and a
  point `g : O(G) → R`, the action on `R ⊗ V` sends `1 ⊗ v` to `∑ g(aᵢ) ⊗ vᵢ`, and the
  morphisms are exactly the linear maps commuting with these actions for every test algebra
  `R`, not only on `k`-points. Identify the regular representation, `(g·f)(x) = f(xg)`, with
  the comultiplication coaction on `O(G)`; compare the tensor unit (trivial action), tensor
  products (diagonal action) and, on finite-dimensional objects, duals
  (`(g·ℓ)(v) = ℓ(g⁻¹v)`), preserving evaluation and coevaluation (Milne, Remark 4.1,
  pp. 84–85).
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
    faithful; a criterion demanding a nonzero module would exclude the trivial group. The zero
    comodule is faithful for no nontrivial group, since its coordinate morphism factors
    through `GL₀ = 1`.
  - For `αₚ` in characteristic `p`, `a ↦ [[1, a], [0, 1]]` is a faithful representation: its
    coefficient `t` generates `k[t]/(tᵖ)`, so it is a closed embedding of `αₚ` in `GL₂`.
- **Tannakian reconstruction dictionaries.** Consume native
  `TauCeti.Tannaka.pointsFunctorIsoTensorAutFunctor k H` for `[Field k]`,
  `[CommRing H]`, `[HopfAlgebra k H]` in the common universe. Preserve the actual
  `pointsFunctor ⋙ GrpCat.uliftFunctor ≅ tensorAutFunctor`, its coefficient-algebra
  naturality and component/reconstructed-point equations. Transport it through the
  rational-representation/comodule equivalence and Layer 0's scheme/group-functor
  equivalences; construct those remaining adapters and their compatibility with the
  faithful-representation/closed-immersion maps. No second native reconstruction
  theorem or unlifted equality of these functors is intended (Milne, Theorem 4.14, p. 88,
  for the generation of all representations from a faithful one). *Needs:* the native
  reconstruction isomorphism; Layer 0's three equivalences; the comodule dictionary above.

### 1.1 Rational cohomology and algebraic induction

For an affine group scheme G over R with flat coordinate Hopf algebra, extend
Layer 1's action/comodule dictionary to arbitrary R-modules. The comodule-to-action
direction is pinned: `TauCeti.Comodule.endOfPoint` (`Coalgebra/Comodule/PointsAction.lean`)
lets a point g∈G(S) act S-linearly on S⊗M by pushing the coaction coefficients through g,
with no hypothesis on M; `TauCeti.Comodule.pointsRepresentation` is the resulting
representation of the convolution monoid of points, `TauCeti.Comodule.pointsAction`
(`AlgebraicGroup/Representation/PointsAction/Basic.lean`) its upgrade to automorphisms over a
Hopf algebra, and `TauCeti.Comodule.rTensor_comp_endOfPoint` its naturality in the R-algebra
S. The inverse direction is pinned as well: `TauCeti.HopfAlgebra.pointRepresentationEquivComodule`
recovers the coaction from a natural family of actions by evaluation at the universal point
id : O(G) → O(G), the two constructions are inverse, and
`TauCeti.pointRepresentationCategoryEquivalence` makes this an equivalence of categories, with
no finiteness, freeness or flatness hypothesis (supplier contracts). The target here is the
comparison of invariants: a vector m ∈ M lies in the comodule invariants Mᴴ exactly when, for
every R-algebra S and every g ∈ G(S), the point g fixes 1 ⊗ m in S ⊗ M, and it suffices to test
the universal point; transport the constructions below through this equivalence, with no
flatness or finiteness assumption on M (Jantzen, Part I, 1985 preprint, §2.8, pp. 36–39, and
§2.10(1)–(2), p. 41, for invariants).
*Needs:* the pinned points action and point-representation equivalence above; Layer 0's
group-scheme/points dictionary and Layer 1's comodule dictionary.

**Checks.**
- For the weight-one line of 𝔾_m over ℤ, 1↦1⊗t evaluates at 2∈ℚˣ to
  multiplication by 2; evaluating at the universal point recovers 1⊗t.
- On this line, the actions of 2 then 3 multiply to 6, the action of their
  product; 1 acts by 1, excluding the zero action.
- For the trivial group, the coaction on ℤ/2 is m↦m⊗1 and every point acts
  by the identity. The zero module has the unique coaction and action.
- For μ_p over 𝔽_p and its weight-one line, 1↦1⊗t, every 𝔽̄_p-point acts trivially because
  μ_p(𝔽̄_p)=1, yet the invariants are 0 because t≠1 in 𝔽_p[t]/(t^p−1); the universal point t
  detects this, so the invariants comparison cannot test field-valued points only.

For a commutative ring R and a flat commutative Hopf R-algebra H, prove that the
native category of all right H-comodules has enough injectives. Given a comodule M,
embed its underlying module into an injective module I and compose its coaction
M → M ⊗ H with M ⊗ H → I ⊗ H. The counit splits the first map as a module map,
flatness makes the second injective, and the exact forgetful functor with its cofree
right adjoint makes I ⊗ H injective. No finiteness or flatness condition is placed
on M (Jantzen, Part I, 1985 preprint, §3.9, p. 60).

Define rational cohomology as the right derived functors of the invariant submodule
Mᴴ = ker(ρ_M − (m ↦ m ⊗ 1)), which is the pinned `TauCeti.Comodule.fixedSubcomodule`
(`Coalgebra/Comodule/Fixed.lean`), functorial through `TauCeti.Comodule.Hom.fixedMap`.
Construct the augmented cofree resolution and prove
that its invariant complex computes these functors. In degree n this complex is
Cⁿ(H,M)=M ⊗ H^⊗n: cofaces apply ρ_M at the beginning, Δ in each Hopf position,
and append 1 at the end; the differential is the alternating sum in that order.
Prove the cosimplicial identities and d²=0. The resolution is split exact on
underlying modules by the counit, and its terms are acyclic for invariants;
cofree does not mean injective for arbitrary coefficient modules
(Jantzen, Part I, 1985 preprint, §§4.2, 4.7(a), 4.14–4.16, pp. 69–70, 72–73, 77–79a).
*Needs:* native abelian/comodule/cofree and invariant-subcomodule interfaces in the supplier
contract; Mathlib's module injectives, right derived functors and cochain-complex homology.

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

Induction is pinned. For a coalgebra map f : C → D over R with C flat and a right
D-comodule M, `TauCeti.Comodule.induced` (`Coalgebra/Comodule/Induced.lean`) is the cotensor
product M □_D C, the equalizer in M ⊗ C of ρ_M ⊗ id and id ⊗ ((f ⊗ id)Δ_C), as a
subcomodule of the cofree comodule M ⊗ C. `TauCeti.Comodule.inducedEquiv` is reciprocity
Hom_C(N,Ind_f M) ≃ Hom_D(N,M), with N a D-comodule by corestriction: the forward map composes
with counit evaluation, and the inverse takes u to (u ⊗ id)ρ_N. It is natural in N
(`TauCeti.Comodule.inducedEquiv_comp`) and in M
(`TauCeti.Comodule.inducedEquiv_inducedMap_comp`), and `TauCeti.Comodule.inducedMap`, with
`TauCeti.Comodule.inducedMap_id` and `TauCeti.Comodule.inducedMap_comp`, is functoriality in M.
A Hopf map q : H → K of flat commutative Hopf R-algebras is the case f = q, with no
surjectivity; the closed-subgroup case is the surjective coordinate-map specialization
(Jantzen, Part I, 1985 preprint, §§3.3–3.7, pp. 52–58, for the subgroup formulation). These
are consumed, not restated. *Needs:* the pinned induction above; Layer 0's Hopf/points
dictionary for the function interpretation.

The induction API, beyond the pinned construction and reciprocity, includes:
- Induction, the right adjoint of corestriction, is left exact. Identity and composite Hopf
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
- For q=id on ℤ[t,t⁻¹] and the weight-one character, inversion sends the function with
  F(t)=t to the function with f(t)=t⁻¹; both evaluate to 1 at the identity.
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
  Right translation by `a` sends `t` to `t + a`; the opposite convention would give `t − a`.
- For the weight-three line of `𝔾_m`, with coaction `v ↦ v ⊗ t³`, a unit `a` acts by `a³`,
  so `2` acts by `8`, not `1/8`. The dual line has scalar `1/8`, and evaluation pairs
  `(1/8)ℓ` with `8v` to `ℓ(v)`; the lines of weights 1 and 2 tensor to weight 3, with scalar
  `2 · 4 = 8`.
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
  degree, which overshoots. The tensor unit has weight 0 and every reconstructed point acts
  on it by 1, so tensor compatibility excludes arbitrary scalar automorphisms of the unit.
- For the trivial group the tensor-automorphism group is trivial; the universe lift changes
  the carrier universe and keeps this one-element group.

### Dependencies

Layer 0; Tau Ceti's comodule categories, finite-subcoalgebra theorems, embedding and
faithfulness theorems, Tannakian reconstruction, cofree/corestriction interfaces, points
action and cotensor induction;
Mathlib's module injectives, right derived functors and cochain-complex homology.

## Layer 2: Lie algebra and the adjoint representation

Use the native counit-derivation Lie algebra, differential and adjoint comodule
in the group/Hopf dictionary of Layer 0. For each affine group scheme of finite
type over a field, identify these constructions with its tangent space at the
identity, and transport their naturality through the scheme/Hopf equivalence.
All comparisons commute with group homomorphisms and coefficient-field extensions.
Prove that the transported differential is the scheme tangent map, and that the adjoint
comodule is the algebraic representation Ad : G → GL(Lie G) whose action on points is the
differential of the scheme conjugation morphism; for every homomorphism f : G → H prove
df(Ad_G(g)v) = Ad_H(f(g))(df(v)), and prove that the differential of Ad is ad on the
tangent Lie algebra (Milne, Theorem 10.23, p. 193).
For smooth groups, identify tangent dimension with group dimension. The bracket convention is XY−YX
in GLₙ (Milne, §10.b–§10.e, especially 10.6, 10.14, Theorem 10.23 and
Propositions 10.28–10.29, pp. 188–196).
*Needs:* Layer 0's dictionary and its structural-map comparisons; Layer 1's rational
representations, for Ad; the native cotangent, tangent, differential, adjoint and smoothness
interfaces in the supplier contracts.

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

Layer 0; Layer 1's rational representations, for Ad; the named native tangent and adjoint
modules. Smoothness is required for equality of geometric
and tangent dimensions, not for constructing the tangent Lie algebra.

## Layer 3: subgroups, quotients, components
- **Hopf ideals ↔ closed subgroup schemes:** an ideal `I` with `Δ(I) ⊆ I⊗A + A⊗I`,
  `ε(I)=0`, `S(I) ⊆ I`, and the quotient Hopf algebra `A/I` (Milne, Definition 3.10,
  Propositions 3.11 and 3.15, pp. 67–68). The order-reversing bijection between Hopf ideals of
  `A` and closed subgroup schemes of `Spec A`, over every commutative ring, and the kernel of a
  homomorphism as the closed subgroup cut out by the kernel Hopf ideal and as the fibre over the
  identity section are pinned (`TauCeti.CommHopfAlgCat.hopfIdealOrderIsoClosedSubgroup`,
  `TauCeti.CommHopfAlgCat.isPullback_kernelSpec`, supplier contracts) and consumed. Prove that a
  homomorphism of affine group schemes of finite type over a field is a monomorphism exactly
  when it is a closed immersion (Milne, Theorem 5.34, p. 107; for affine groups, Corollary 3.35,
  p. 75). Route, for affine groups: factor `H → G` through its image, a closed subgroup, with
  `H → image` faithfully flat (Theorem 3.34, p. 75). This needs that a finitely generated Hopf
  algebra is faithfully flat over each Hopf subalgebra (Theorem 3.31, p. 73). A faithfully flat
  homomorphism with trivial kernel is then an isomorphism, by faithfully flat descent of points.
  This route needs no quotient `G/H` by a subgroup that is not normal. *Needs:* the pinned image
  factorization `TauCeti.CommHopfAlgCat.image`, `TauCeti.CommHopfAlgCat.imageι` and its faithful
  flatness for a geometrically reduced source, `TauCeti.CommHopfAlgCat.faithfullyFlat_imageι`
  (supplier contracts, *Closed subgroups and kernels*). The extension of that faithful flatness
  to nonreduced sources, such as `μ_p → GL₁` in characteristic `p`, whose source
  `k[t]/(t^p − 1)` is not geometrically reduced, is part of this target. Also needed are the
  pinned descent of points `TauCeti.AlgHom.faithfullyFlatDescentMulEquiv` (same contract) and the
  scheme kernels of this section.
  Transport the native kernel–differential Lie equivalence through Layer 0's
  scheme/Hopf dictionary and Layer 2's tangent comparison: for a group morphism
  f:G→H, its inclusion Lie(ker f)→Lie(G) agrees with the inclusion ker(df)→Lie(G).
  No kernel smoothness is assumed (Milne, 10.14, p. 190). When ker f is smooth, deduce
  dim ker(df) = dim ker f, with the scheme dimension of ker f, not the dimension of its reduced
  point set (Milne, Proposition 1.37, p. 18). *Needs:* Layer 0's
  dictionary; Layer 2's tangent comparison; the native kernel Lie equivalence
  in the supplier contract; the scheme-kernel construction in this section. For Frobenius on
  𝔾_a in characteristic p the kernel α_p has tangent space k, matching the kernel
  of the zero differential, while its geometric dimension is 0. For the identity
  of 𝔾_a both kernels have tangent dimension 0; for 𝔾_a→1 both have tangent
  dimension 1 and the comparison is the identity on k.
- **Normality and quotients:** normal = Hopf ideal stable under the adjoint coaction
  (needs the conjugation/adjoint morphism at Hopf level), the pinned `TauCeti.HopfIdeal.IsNormal`:
  the conjugation coordinate map carries the ideal into `H ⊗ I` (supplier contracts). The quotient `G/H` is first the
  native **fppf sheaf quotient** (`CommHopfAlgCat.fppfHomogeneousQuotient` for any closed
  `H`, `TauCeti.CommHopfAlgCat.fppfQuotientSheaf` for normal `H`); whether it is represented
  by a scheme (and when by an *affine* one, e.g. `H` reductive, by the pinned affine direction
  of Matsushima's criterion and its extension in Layer 6B)
  is a **theorem with hypotheses**, not automatic. For a geometrically reduced group the
  quotient by a normal closed subgroup is represented by its coinvariant Hopf algebra, by the
  pinned `TauCeti.CommHopfAlgCat.coinvariantsFppfQuotientIso`. Prove that every normal closed
  subgroup of an affine group scheme of finite type over a field, nonreduced groups included,
  is the kernel of a quotient map to an affine group scheme, that the quotient sheaf is then
  represented by it, and the short exact sequences and isomorphism theorems this gives (Milne,
  Theorem 5.14 and Proposition 5.18, pp. 102–103). No perfectness, smoothness or
  characteristic hypothesis is imposed. The quotient map `q : G → Q` is faithfully flat with
  scheme kernel `N`, and every homomorphism `G → K` that is trivial on `N` factors uniquely
  through `q` (Milne, Theorem 5.13, p. 101). The identification of `Q` with the fppf quotient
  carries its projection to `q` and its kernel inclusion to `N → G`; it is not an
  identification with `G(k)/N(k)`. Extension of the base field preserves `Q`, `q` and this
  kernel comparison, by the universal property of the sheaf quotient and faithfully flat
  descent. The headline
  `StructureAcceptance.isIso_coinvariantsQuotient_of_isNormal` states the representation in
  coinvariant form: for a normal Hopf ideal `I` of a finite-type commutative Hopf algebra `O(G)`
  over a field, the map from the fppf homogeneous quotient `G/N` to the fppf sheaf of points of
  `Spec O(G)^N`, with `O(G)^N` the right `I`-coinvariants, is an isomorphism, and `O(G)` is
  faithfully flat over `O(G)^N` (Milne, Propositions 5.21 and 5.25, pp. 104–105, for the
  universal property and faithful flatness of the quotient map). For `μ_p ⊂ μ_{p²}` in
  characteristic `p`, with `O(μ_{p²}) = k[t]/(t^{p²} − 1)`, the coinvariants are `k[t^p]`, the
  quotient is `μ_p` and `O(μ_{p²})` is free of rank `p` over it; for `N = G` the coinvariants are
  `k`, and for `N = 1` they are all of `O(G)`. *Needs:* the native fppf quotient sheaves
  and the pinned geometrically reduced case; Layer 1's faithful representations (the quotient
  is constructed inside a representation); SchemeAndStackFoundations §§1.13–1.15 for torsors;
  ModularCurves §0E's affine faithfully flat descent for the base-change statement.
- **Identity component `G°` and component group `π₀(G)`:** `G°` is the connected
  component of the identity; it is an open and closed normal subgroup scheme with the
  inherited scheme structure, its formation commutes
  with extension of the base field, and it is geometrically connected (Milne,
  Proposition 1.34, p. 16). For a group scheme over a field, connected and geometrically
  connected therefore agree, because of the rational point `e`; the distinction between
  `k` and `k̄` survives in `π₀(G) = G/G°`, whose `k`-points need not exhaust its geometric
  points. `π₀(G)` is a finite étale group scheme and `G°` is the unique connected normal
  subgroup with étale quotient (Milne, Proposition 5.58, p. 114); no smoothness or
  perfectness hypothesis is needed for this. The geometric points of `π₀(G)` are the
  connected components of `G_k̄`, with the continuous action of the absolute Galois group and
  the multiplication induced from `G`. Prove (Milne, Proposition 2.37 and Definition 2.38,
  pp. 51–52):
  - the sequence `1 → G° → G → π₀(G) → 1` is exact as fppf sheaves, with faithfully flat
    projection, and every homomorphism from `G` to a finite étale `k`-group factors uniquely
    through `π₀(G)`;
  - `G°`, `π₀(G)` and this sequence commute with every field extension, inseparable ones
    included, and with finite products;
  - the degree of `π₀(G)` is the number of geometric connected components of `G`, so `π₀(G)`
    is trivial exactly when `G` is geometrically connected, that is, when `O(G) ⊗_k k̄` has no
    idempotents other than `0` and `1`;
  - `G°` keeps the nilpotents of `G`, and its reduction is in general a different subgroup
    scheme; when `G` is smooth, so is its open subgroup `G°`.

  *Needs:* Layer 0's dictionary; the quotient construction above; the pinned identity
  component `TauCeti.FiniteTypeCommHopfAlgCat.identityComponent` over an algebraically closed
  field (supplier contracts, *Native reductive structure*); ModularCurves §0E for descent
  along the field extension; Mathlib's connected components and idempotents.
  ⚠ Reserve the term **connected–étale sequence** for *finite* group schemes; here use
  "identity component and component group", and "connected" always means the geometric
  notion.

### Examples

**Checks.**
- In `k[t, t⁻¹]` the ideal `(tⁿ − 1)` is a Hopf ideal: `Δ(tⁿ − 1) = (tⁿ − 1)⊗tⁿ +
  1⊗(tⁿ − 1)`, `ε(tⁿ − 1) = 0` and `S(tⁿ − 1) = −t⁻ⁿ(tⁿ − 1)`; it cuts out `μ_n`. Over `ℚ`
  the ideal `(t − 2)` has `ε(t − 2) = −1 ≠ 0` and is not a Hopf ideal: the point `2` is not
  a subgroup.
- The inclusion `(t² − 1) ⊆ (t − 1)` of Hopf ideals of `k[t, t⁻¹]` becomes the inclusion
  `1 ⊆ μ₂` of subgroups: the classification reverses order. In characteristic 2,
  `k[t, t⁻¹]/(t² − 1) = k[u]/(u²)` with `u = t − 1`; its single geometric point does not make
  `μ₂` the trivial subgroup scheme.
- In `GL₂` the Hopf ideal of the upper-triangular Borel is not stable under the adjoint
  coaction: conjugation by `[[0,1],[1,0]]` carries it to the lower-triangular Borel. The
  ideal `(det − 1)` of `SL₂` is stable, since `det` is a conjugation invariant.
- `𝔾_m → 𝔾_m`, `t ↦ t²`, has kernel `μ₂` and the represented quotient `𝔾_m/μ₂ ≅ 𝔾_m`;
  the point `2 ∈ ℚˣ` of the quotient lifts over `ℚ(√2)` but not over `ℚ`, so the quotient
  sheaf is not the pointwise quotient of points.
- In characteristic `p`, for `G = αₚ × αₚ` with coordinate ring `k[x, y]/(xᵖ, yᵖ)` and `N` its
  first factor, the coinvariants are `k[y]/(yᵖ)`, `Q = αₚ` and `q(x, y) = y`: a nonreduced
  ambient group, unipotent rather than multiplicative, for every `p` including 2 and 3.
- For the constant group `S₃` and `N = A₃` the quotient has order 2. The subgroup generated by
  `(12)` is not normal, since conjugation by `(123)` carries it to the subgroup generated by
  `(23)`.
- For `𝔾_m`, `G° = 𝔾_m` and `π₀ = 1`, although the real points `ℝˣ` have two connected
  components: real Lie-group components do not replace algebraic ones. For the constant group
  `S₃`, `G° = 1` and `π₀(G) = S₃` has degree 6, and `(12)(23) = (123) ≠ (132) = (23)(12)`:
  the component group need not be commutative.
- Over `𝔽₂`, `μ₂ = Spec 𝔽₂[u]/(u²)` is its own identity component, with `π₀` trivial of
  degree 1; its reduction, with coordinate ring `𝔽₂`, is the trivial subgroup. Over `𝔽₃`,
  `μ₂` is étale and `π₀(μ₂) = μ₂` has degree 2.
- Over `k = 𝔽_p(s)`, `G = αₚ × (ℤ/2)_k` has `G° = αₚ` and `π₀(G) = (ℤ/2)_k`, of degrees `p`
  and 2. Over the purely inseparable extension `k(s^{1/p})` these become the respective base
  changes, still of dimension 0 and degrees `p` and 2.
- `μ₃` over `ℚ` has two connected components over `ℚ` (`t = 1` and `t² + t + 1 = 0`) but
  three geometric points; `μ₃° = Spec ℚ` and `π₀(μ₃)` is the étale group `μ₃` itself, with
  one `ℚ`-point and three `ℚ̄`-points. Over `ℝ`, `SO₂` (the circle `x² + y² = 1`) is
  connected and geometrically connected (it becomes `𝔾_m` over `ℂ`), while
  `Spec ℝ[x]/(x² + 1)` is connected but not geometrically connected and has no `ℝ`-point,
  so it is not a group scheme over `ℝ`.

### Dependencies

Layers 0–2; the native fppf quotient sheaves, closed-subgroup classification and scheme kernels,
and the pinned image factorization, its faithful flatness for a geometrically reduced source and
the faithfully flat descent of points, and the identity component over an algebraically closed
field (supplier contracts); SchemeAndStackFoundations §§1.13–1.15; ModularCurves §0E.

## Layer 3A: algebraic actions, orbit boundaries and projective closed orbits

This phase precedes Borel subgroups, reductive classification and Borel–Weil. Its algebraic
orbit geometry, §§3A.1–3A.4, is the pinned orbit library of the supplier contracts (*Native orbit
geometry*), consumed at its own hypotheses: an algebraically closed field `k`, a group scheme `G`
locally of finite type over `k` with quasi-compact underlying space, and a scheme `X` with the
same finiteness, with an actual algebraic `G`-action. `G` need not be smooth, reduced or
connected, and `X` need not be separated, irreducible or reduced. Empty `X` has no
orbit-existence assertion. Over a nonclosed field apply the geometric statements after the
specified algebraic closure; do not turn a geometric orbit or closed point into a `k`-rational
one without a descent argument. No reductivity hypothesis belongs in the orbit-existence theorem.
The targets of this layer are local closedness of orbits over an arbitrary field (§3A.2) and
the projective, complex and representation-theoretic statements of §§3A.5–3A.7.

**3A.1 Actual action and orbit maps.** The action is native `GrpObj` and `ModObj` in the
cartesian monoidal category of schemes over `Spec k`, with native unit and associativity laws;
the native `CategoryTheory.Hom.group` and `Hom.mulAction` give the action on test-scheme points.
For `x ∈ X(k)` the orbit map `μ_x : G → X`, `g ↦ gx`, is `TauCeti.orbitMap`, the translations
`t_g` are `TauCeti.translation`, and the geometric orbit `O_x`, its closure `Z_x` and its boundary
`Z_x ∖ O_x` are `TauCeti.SchemeAction.orbit`, `TauCeti.SchemeAction.orbitClosure` and
`TauCeti.SchemeAction.orbitBoundary`. `TauCeti.SchemeAction.orbit_inter_closedPoints` identifies
the closed points of `O_x` with the `G(k)`-orbit of `x`; the image of all scheme points is not
literally a set of `k`-valued points. The stabilizer is the scheme fibre `TauCeti.stabilizer`
over `x`, with its subgroup structure and the fibre translation isomorphisms
`TauCeti.stabilizer.fiberSmulIso`; a set-theoretic stabilizer does not supply the
scheme-theoretic kernel or a smoothness proof.

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

**3A.2 Local closedness and the reduced orbit model.** `TauCeti.SchemeAction.isLocallyClosed_orbit`
makes `O_x` open in `Z_x` and locally closed in `X` (Milne, Algebraic Groups (2017),
Proposition 1.65(b,c), pp. 26–27): the orbit is constructible by Chevalley's theorem and `G(k)` acts
transitively on its closed points. Its scheme model is the orbit scheme
`TauCeti.SchemeAction.orbitScheme`, the locally closed scheme image of `μ_x`, with the immersion
`TauCeti.SchemeAction.orbitι` onto `O_x` and the surjective factorization
`TauCeti.SchemeAction.toOrbit`; it is reduced when `G` is reduced, even if `X` is not, and
`TauCeti.SchemeAction.orbitBaseChangeIso` compares it under extension of algebraically closed
fields. No representability theorem for `G/H` is a premise.

The target here is the same statement over every field `k`: for `G` and `X` locally of finite
type over `k` with quasi-compact underlying spaces, an algebraic action, and `x ∈ X(k)`, the
orbit `O_x` is locally closed in `X`. Smoothness and affineness of `G`, separatedness of `X`
and algebraic closedness of `k` are not assumed (Milne, Proposition 1.65(b), pp. 26–27,
applied to the orbit map, which is equivariant for left translation). One route passes to an
algebraic closure `k̄`: the orbit map of the base change is the base change of the orbit map,
and the image of a base-changed morphism is the preimage of the original image, so the orbit of
`x` in `X_k̄` is the preimage of `O_x`; the projection `|X_k̄| → |X|` is an open surjection,
because every scheme over a field is universally open over it, and a subset whose preimage
under an open surjection is locally closed is itself locally closed (Milne, proof of
Proposition 1.65(b), p. 27). Construct the reduced locally closed subscheme on `O_x` and its
immersion into `X` over `k`, with the restricted action and its comparison with the orbit
scheme after base change to `k̄`. The local closedness is the headline `StructureAcceptance.orbit_locallyClosed` of
`Suggested.lean`, stated on `TauCeti.SchemeAction.orbit` with `G` and `X` locally of finite
type and quasi-compact over `Spec k`. *Needs:* the pinned
`TauCeti.SchemeAction.isLocallyClosed_orbit` and `TauCeti.SchemeAction.orbit`; Mathlib's base
change of schemes along a field extension and universal openness of schemes over a field.

**Checks.**
- Without smoothness, separatedness or algebraic closedness: `αₚ` acting trivially on
  `Spec k` has the one-point orbit; `𝔾_m` scaling the line with doubled origin has at `x = 1`
  the open orbit `𝔾_m`; over `ℝ`, `μ₃` acting on `𝔸¹ = Spec ℝ[t]` by multiplication has at
  `x = 1` the orbit consisting of the closed points `(t − 1)` and `(t² + t + 1)`, a closed
  two-point set although `μ₃` has one real point, and its preimage in `𝔸¹_ℂ` is the three cube
  roots of unity, the orbit of 1 under `μ₃(ℂ)`.
- Quasi-compactness of `G` is needed: the constant group `ℤ` over `ℚ`, locally of finite type
  but not quasi-compact, translating `𝔸¹`, has at `x = 0` the orbit consisting of the closed
  points `t = n` for `n ∈ ℤ`. It is dense in `𝔸¹` but not open in it, since every nonempty
  open subset contains the generic point.

**3A.3 Finite dimensions, including disconnected groups.**
`TauCeti.SchemeAction.topologicalKrullDim_orbitBoundary_lt` gives `dim(Z_x ∖ O_x) < dim O_x` in
native `topologicalKrullDim`, with the empty boundary of dimension `⊥`, for disconnected `G` and
reducible `Z_x` (Milne, Proposition 1.66 and its proof, pp. 27–28, for group varieties); the
boundary is closed (`TauCeti.SchemeAction.isClosed_orbitBoundary`). Every boundary orbit `O_y`
of a rational point `y` therefore has strictly smaller dimension
(`TauCeti.SchemeAction.topologicalKrullDim_orbit_lt_of_mem_orbitBoundary`); a closed orbit need
not have the globally smallest dimension. SchemeAndStackFoundations §0.7 supplies the
comparison of topological Krull dimension with scheme dimension.

**3A.4 Existence of closed orbits.** The closed-orbit lemma
`TauCeti.SchemeAction.isClosed_orbit_of_forall_mem_orbitClosure` closes an orbit of minimal
dimension among the orbits of rational points of its closure;
`TauCeti.SchemeAction.exists_isClosed_orbit_subset_orbitClosure` gives a closed orbit of a
rational point inside every orbit closure, and `TauCeti.SchemeAction.exists_isClosed_orbit` a
closed orbit in every nonempty `X` (Milne, Proposition 1.66, pp. 27–28). Uniqueness is not
claimed. The argument gives closed orbits in nonproper `X` and supplies compactness only with
properness (3A.5).

**3A.5 Properness and the complex comparison.** This section is the single owner of complex
points, their classical topology, the smooth charts of smooth `ℂ`-schemes and the complex
Lie-group structure on `G(ℂ)`. Its items 3A.5a–3A.5f state these at the generality given in each,
and other roadmaps cite them by item number.

**3A.5a Proper orbits.** For proper `X`,
`TauCeti.SchemeAction.isProper_orbitToBase_iff` makes an orbit scheme proper exactly when the
orbit is closed, and `TauCeti.SchemeAction.exists_isProper_orbit_subset_orbitClosure` gives a
proper closed orbit in every orbit closure; for reduced `G` it is smooth (`Orbit/Smooth.lean`).
For projective `X` apply SchemeAndStackFoundations §0.3's relative-Proj/projective-space carrier
and the projective-morphism properness theorem: consume native `IsProper (Proj.toSpecZero 𝒜)` at
its `Algebra.FiniteType (𝒜 0) A` hypothesis and transport through the actual
projective-space/closed-immersion maps.

**3A.5b Points with values in a local topological algebra.** Let `k` be a commutative ring and `R`
a local topological `k`-algebra whose units are open, with `Units.val : Rˣ → R` an embedding,
that is, with inversion continuous on the units. For a `k`-scheme `X`, give `X(R)`, the
morphisms `Spec R → X` over `Spec k`, the pinned chart topology
`TauCeti.SchemePointTopology.topology` (supplier contract *Native complex-point topology*).
Prove what the library leaves open. Each affine open chart `Spec A → X` is an open embedding of
`A(R)` into `X(R)`, so the topology is glued from any affine open cover, including infinite
covers, and it is the unique topology in which each chart is an open subspace carrying its
affine topology. A morphism of `k`-schemes acts continuously on `R`-points by composition,
giving a functor to topological spaces. An open immersion induces an open embedding; a closed
immersion induces a closed embedding when `R` is Hausdorff. If `X` is separated over `k` and
`R` is Hausdorff, then `X(R)` is Hausdorff; if `X` is locally of finite type over `k` and `R`
is Hausdorff and locally compact, then `X(R)` is locally compact (Conrad, *Weil and
Grothendieck approaches to adelic points*, Proposition 3.1 and its proof, p. 4, for `X` locally
of finite type over `R` itself; `X(R)` over `k` is `(X ×_k Spec R)(R)` over `R`). If `X` is of
finite type over `k` and `R` is second countable, then `X(R)` is second countable: it is the
union of the open images of the points of finitely many affine charts, each second countable by
the pinned `TauCeti.PointTopology.instSecondCountableTopology`. The
open-embedding step reduces to the principal opens of a chart, which are the pinned
`TauCeti.PointTopology.isOpenEmbedding_localization`, and uses no finiteness; the covering of
`X(R)` by charts is `TauCeti.SchemePointTopology.exists_mem_range_chartPoint`, which needs `R`
local. The affine cases are the pinned `TauCeti.PointTopology.continuous_comap`,
`TauCeti.PointTopology.isClosedEmbedding_comap_of_surjective`,
`TauCeti.PointTopology.instT2Space` and
`TauCeti.PointTopology.locallyCompactSpace_of_finiteType`, with the chart continuity
`TauCeti.SchemePointTopology.continuous_chartPoint`; Hausdorffness for separated `X` follows
from the closed diagonal and the fibre-product comparison of the affine charts,
`TauCeti.PointTopology.relativeTensorProductHomeomorph`. *Needs:* the pinned point topology of
the supplier contract; Mathlib's affine opens, open and closed immersions and separated
morphisms.

**Checks.**
- For a field `R` with the indiscrete topology, inversion is continuous but the units
  `R ∖ {0}` are not open, and the chart `D(t)(R) = R ∖ {0} → 𝔸¹(R) = R` of the principal open
  `D(t)` is not an open embedding: the hypothesis that the units are open is needed.
- For `R = ℤ_p`, the units `ℤ_p ∖ pℤ_p` are open and inversion is continuous. The chart
  `D(t)(ℤ_p) = ℤ_pˣ` is open in `𝔸¹(ℤ_p) = ℤ_p`, and the point `t ↦ p` of `𝔸¹(ℤ_p)` lies
  outside it.
- For a discrete field `R`, both hypotheses on units hold, and `X(R)` is discrete for `X`
  locally of finite type, since each affine `U(R)` is a subspace of a discrete `Rⁿ`. For
  `X = Spec k[t₁, t₂, …]`, which is not of finite type, `X(R) = R^ℕ` with the product topology
  is not discrete.

**3A.5c Classical complex points.** For every ℂ-scheme `X` locally of finite type, the
classical topology on `X(ℂ)`, the set of ℂ-morphisms `Spec ℂ → X` over ℂ, is the case
`k = R = ℂ` of the topology of 3A.5b, with ℂ in its usual topology: the units of ℂ are open
(`Units.isOpenEmbedding_val`), inversion is continuous on them, and ℂ is Hausdorff and locally
compact. On an affine `X = Spec A` it is the evaluation topology on `A →ₐ[ℂ] ℂ`
(`TauCeti.SchemePointTopology.affineHomeomorph`), which every finite presentation embeds as
the closed zero locus in `ℂⁿ` (`TauCeti.PointTopology.isClosedEmbedding_eval_generators`), so
it is independent of the presentation; the points of a principal open `D(f)` form the open
subspace where `f` is a unit; and on a general `X` a set is open exactly when its preimage in
every affine open chart is (`TauCeti.SchemePointTopology.isOpen_iff`). The carrier admits
singular, nonreduced and nonseparated schemes and assigns a manifold structure to none of them.
Over ℂ the general statements of 3A.5b give the open-embedding charts, the functor to
topological spaces, the embeddings induced by open and closed immersions, Hausdorff points for
separated `X`, locally compact points, and second-countable points for `X` of finite type
(SGA 1, Exposé XII, §§1.1–1.2, revised edition, pp. 239–241, on underlying spaces; Serre,
GAGA, §2 no. 5, pp. 8–9, for the affine-chart topology).

Its API includes:
- The point functor preserves fibre products, via the actual projection maps; the affine
  case is the pinned `TauCeti.PointTopology.relativeTensorProductHomeomorph`.
  Reduction induces a homeomorphism on complex points (SGA 1, XII.1.1–1.2 and
  Proposition 2.1, pp. 239–242).
- A proper morphism gives a relatively separated topological map whose restriction over every
  Hausdorff open subset of the target has compact inverse images of compact subsets, so the
  induced map is proper in Mathlib's sense (`IsProperMap`); in
  particular a proper ℂ-scheme has compact Hausdorff complex points (SGA 1, XII,
  Propositions 3.1(viii) and 3.2(v), pp. 244–247).

*Needs:* the pinned complex-point topology of the supplier contract; 3A.5b; Mathlib's affine
scheme charts, the open embedding `Units.isOpenEmbedding_val` of the units of ℂ, topological
gluing (`TopCat.GlueData`) and proper maps (`IsProperMap`). A route for the proper comparison
uses Chow's lemma and projective-space compactness; its algebraic inputs are
SchemeAndStackFoundations §4.12's Chow lemma, applied over affine finite-type complex opens of
the base, and §0.3's projective geometry.

**Checks.**
- Spec ℂ[ε]/(ε²) and its reduction each have exactly one complex point, and the
  reduction map is a homeomorphism. Their algebraic local rings have dimensions
  2 and 1 over ℂ: the point topology does not assert a ringed-space isomorphism.
- The empty scheme has no points and ℙ⁰ has one compact point; ℙ¹(ℂ) is compact,
  whereas the sequence 1,2,3,… in 𝔸¹(ℂ) escapes every compact subset.
- The line with doubled origin has two origins with no disjoint neighbourhoods,
  so the separatedness hypothesis matters.
- 𝔸⁰(ℂ) is one point, the unit ideal gives no points, and 𝔸¹(ℂ)=ℂ with its usual
  topology: in the chart of 𝔸¹ the disc |t|<1 is open but not Zariski open, a single
  point is not open, and 1/n converges to 0, which the discrete topology would deny.
- An uncountable disjoint union of copies of Spec ℂ is locally of finite type and
  has discrete complex points that are not second countable, so the countability
  statement needs finite type.

**3A.5d Smooth charts.** For every smooth ℂ-scheme `X`, construct complex charts on `X(ℂ)`
locally in its dimension. Each chart is the restriction of an étale coordinate map `U → 𝔸ᵈ`, on
a Zariski open `U` and built from a local standard-smooth presentation, to an open subset of
`U(ℂ)` on which it is injective; by the analytic inverse theorem it is a homeomorphism onto an
open subset of `ℂᵈ`. Transition functions and scheme maps between smooth schemes are
holomorphic; étale maps become local biholomorphisms and smooth maps between smooth schemes
become holomorphic submersions. Neither separatedness nor quasi-compactness is assumed. A
fixed-dimensional manifold carrier requires constant dimension; otherwise use the
open-and-closed loci of each dimension (SGA 1, XII, Proposition 3.1(iii)–(iv), pp. 244–245).
*Needs:* 3A.5c; SchemeAndStackFoundations §0.8's étale coordinates; the native analytic inverse
theorem in the supplier contract; Mathlib's local standard-smooth presentations
(`AlgebraicGeometry.Smooth.exists_isStandardSmooth`) and manifold charts.

**Checks.**
- 𝔸¹(ℂ)=ℂ and D(t)(ℂ)=ℂ∖{0}; t↦t² takes 2 to 4 and has derivative 2 at 1,
  hence a local inverse there. At 0 its derivative is 0, so it is not étale there.
- `Spec ℂ[ε]/(ε²)` has one complex point but is not smooth over ℂ; its cotangent
  space has dimension 1 while its underlying point has dimension 0, so the smooth-chart
  and algebraic-tangent comparison does not apply to it.
- A disjoint union of a point and 𝔸¹ has local dimensions 0 and 1 and no single
  fixed-dimensional chart model.
- ℙ¹(ℂ) has the charts z and w with w=1/z on their overlap; at z=2, w=1/2 and
  dw/dz=−1/4, a holomorphic transition with nonzero derivative.
- The node xy=0 has tangent dimension 2 at (0,0) and 1 along each punctured axis;
  it is not smooth at the origin, which receives no one-dimensional chart.

**3A.5e The complex Lie group `G(ℂ)`.** Let `G` be a group scheme of finite type over ℂ, affine
or not; this includes every affine and every quasi-projective one. `G` is smooth (Milne,
Corollary 8.39, p. 158; for affine `G` the pinned
`TauCeti.AlgebraicGeometry.smooth_of_grpObj_of_charZero`) and separated (Milne,
Proposition 1.22, p. 12), and since left translations by `G(ℂ)` act transitively on its closed
points it is equidimensional of dimension `d = dim G`. By 3A.5c–3A.5d, `G(ℂ)` is a Hausdorff,
second-countable complex manifold modelled on `ℂᵈ`; through the fibre-product comparison
`(G ×_ℂ G)(ℂ) = G(ℂ) × G(ℂ)`, multiplication, unit and inverse are holomorphic because they are
induced by scheme morphisms, so `G(ℂ)` is a complex Lie group, and a homomorphism of group
schemes induces a holomorphic homomorphism. For affine `G`, the chart at the identity identifies
the Lie algebra of `G(ℂ)` with Layer 2's tangent Lie algebra, as Lie algebras: prove this for
`GLₙ` and restrict along Layer 1's closed embedding `G → GLₙ`, which induces injective maps of
both Lie algebras compatible with the identification. For any closed immersion `G → GL(V)`,
3A.5b makes `G(ℂ) → GL(V)(ℂ)` a closed topological embedding, and the injectivity of
`Lie(G) → 𝔤𝔩(V)` makes it a holomorphic immersion; so the chart structure on `G(ℂ)` is that of a
closed embedded complex submanifold of `GL(V)(ℂ)`, which is unique given its underlying set.
Prove this, and conclude that for smooth connected reductive `G` it coincides with the subspace
topology and complex atlas of LieGroups Layer 7's lower analytic dictionary. This complex
Lie-group dictionary is owned here and consumed by Layer 11 and by the roadmaps named under
*Downstream consumers*.

The identification is also intrinsic at the identity `e` of a smooth affine `G = Spec H`. Let
`O_alg = H_(ker ε)` and let `O_hol` be the local ring of holomorphic germs in the charts of
3A.5d, the stalk at `e` of Mathlib's `smoothSheafCommRing` with its evaluation
`smoothSheafCommRing.evalHom` (over `ℂ` these smooth sections are the holomorphic functions).
Construct the local map `O_alg → O_hol` taking a regular function to its germ and the induced
complex linear map `c : m_alg/m_alg² → m_hol/m_hol²`, and prove that `c` is an isomorphism: in
algebraic étale coordinates and their induced analytic charts both sides have as basis the
classes of the coordinates minus their values at `e`, and `c` sends each such class to itself
(the cotangent form of SGA 1, XII, Theorem 1.1, pp. 239–240; only the local rings of the smooth
charts enter, not a general ringed analytification functor). The tangent comparison sends a
tangent vector to its left-invariant derivation and, with `Δ = μ*`, preserves the bracket
`D*E − E*D`.
- Dualizing `c` gives the restriction isomorphism from residue-valued derivations of `O_hol` to
  those of `O_alg`, hence to the counit-valued derivations of `H`. Its inverse on a germ `f` is
  `D(f) = Σᵢ vᵢ ∂ᵢf(e)` in smooth coordinates; prove independence of the coordinates by the chain
  rule, and both inverse equations.
- On algebraic fractions the inverse satisfies `D(a/s) = D(a)/ε(s) − ε(a)D(s)/ε(s)²` for
  `ε(s) ≠ 0`, independently of the representative; this rule alone does not define `D` on all
  holomorphic germs.
- The comparison is natural under homomorphisms of smooth affine finite-type complex groups,
  faithful closed representations included, and preserves the left-invariant bracket (Milne,
  Theorem 10.23 and §§10.28–10.29, pp. 193, 195–196).

*Needs:* 3A.5b–3A.5d; Layer 1's faithful representation; Layer 2's tangent Lie algebra; the
native analytic inverse theorem; the native augmentation cotangent
`TauCeti.Bialgebra.CotangentSpace` and derivation duality `Derivation.cotangentLinearEquiv`;
Mathlib's `smoothSheafCommRing` stalk and evaluation.

**Checks.**
- The trivial group gives a one-point complex Lie group and zero tangent space;
  𝔾_a gives addition on ℂ and tangent bracket zero.
- An elliptic curve `E` over ℂ is a group scheme of finite type that is not affine; `E(ℂ)` is a
  compact connected one-dimensional complex Lie group, compact by 3A.5c since `E` is proper.
- For the closed immersion `𝔾_m → GL₂`, `t ↦ diag(t, t⁻¹)`, the image is the closed set
  `b = c = 0`, `ad = 1` of `GL₂(ℂ)` with the subspace topology of `ℂˣ`, and the differential
  sends `1` to `diag(1, −1) ≠ 0`, so the chart structure and LieGroups Layer 7's subspace
  structure are both that of `ℂˣ`. The injective holomorphic homomorphism `ℂ → (ℂˣ)²`,
  `z ↦ (e^z, e^(√2 z))`, comes from no scheme morphism and is not a topological embedding: the
  points `2πin` diverge while their images `(1, e^(2πi√2 n))` accumulate at `(1, 1)` along a
  subsequence, so the closedness supplied by 3A.5b is what the comparison uses.
- For `𝔾_a`, `Δt = t⊗1 + 1⊗t` and a tangent scalar `v` acts by `v·d/dt`, with bracket `0`. At
  `0`, `c` sends `[t]` to `[t]`, while `[t²] = 0` on both sides; with `v = 1` the inverse sends
  `exp(t)` to `1` and `t²` to `0`, which a rule defined only on fractions does not reach.
- Replacing the coordinate `t` by `u = 2t` sends the tangent coefficient `1` to `2`, and for
  `f = exp(t) = exp(u/2)` the value is still `2·(1/2) = 1`; rescaling `c` itself by `2` would
  send `[t]` to `2[t]`.
- For `𝔾_m`, `ε(t) = 1` and `D(t) = 1` give `D(t⁻¹) = −1`; the opposite sign in the quotient
  rule fails already on this unit.
- In `SL₂`, `E = E₁₂` and `F = E₂₁` give `[E, F] = diag(1, −1)`; right-invariant vector fields
  would give the opposite sign and are excluded by the convention.

**3A.5f Complex orbits.** Let an affine group scheme `G` of finite type over ℂ act on `X` as in
3A.1, and let `x ∈ X(ℂ)`. The closed orbit in a projective `X` has compact complex points by
3A.5a and 3A.5c. To obtain the orbit's complex manifold, apply the charts of 3A.5d, component by
component when dimensions differ, to the orbit scheme, which is smooth when `G` is reduced
(`Orbit/Smooth.lean`), as it is over ℂ. Compare 3A.5e
with LieGroups Layer 2's closed-subgroup theorem for the stabilizer `H(ℂ)`,
which is closed in `G(ℂ)`. Pin `H = Stab_G(x)` (`TauCeti.stabilizer`), the actual map
`G(ℂ) → O_x(ℂ)` and its fibres. Consume SmoothBundlesConnections B1.0 for regular fibres and fibre
products of submersions and Mathlib's submersion normal form, and
SmoothBundlesConnections B1.1/B1.4 for the principal-bundle and
homogeneous-space quotient, applied first to the underlying real manifolds; no constant-rank
theorem beyond the submersion case, and no torus, conjugacy or Weyl theorem, is needed. As `G`
is affine and ℂ has characteristic zero, the orbit projection `TauCeti.SchemeAction.toOrbit`
onto the orbit scheme is smooth
(`TauCeti.SchemeAction.smooth_toOrbit_of_charZero`, from smoothness of the stabilizer by
Cartier's theorem); 3A.5d then makes the complex orbit map a holomorphic submersion. Construct
holomorphic local sections by the analytic inverse theorem, and prove the induced biholomorphic
homogeneous-space identification `G(ℂ)/H(ℂ) ≃ O_x(ℂ)`. It does not assume an algebraic quotient
`G/H` was already represented.
*Needs:* 3A.5a and 3A.5c–3A.5e; the pinned orbit geometry; LieGroups Layer 2;
SmoothBundlesConnections B1.0, B1.1 and B1.4; the native analytic inverse theorem;
SchemeAndStackFoundations §0.3 for projective `X`.

**Checks.**
- For `𝔾_m` acting on `ℙ¹` by `t·[x:y] = [tx:y]`, the stabilizer of `[1:1]` is trivial and the
  orbit map `t ↦ [t:1]` is a biholomorphism of `ℂ ∖ {0}` onto the open orbit; the stabilizer of
  `[0:1]` is all of `𝔾_m`, and its orbit is a point.
- For two identity maps of `ℝ`, the fibre product is the diagonal, with tangent space
  `{(v, v)}` of dimension `1 + 1 − 1 = 1`. For two squaring maps at `(0, 0)` the derivative
  ranges sum to `{0}`, not `ℝ`, and the crossing `x² = y²` fails the transversality hypothesis
  of the regular-fibre-product supplier.
- For the additive group of `ℂ` acting on `ℂ` by translation, `H = 1` and the
  quotient-to-orbit map is `z ↦ z`, with complex derivative 1 and real rank 2: the comparison
  is holomorphic, not merely a smooth quotient of real manifolds.

The compact manifold can be disconnected. A closed orbit
in affine X need not be compact, and an arbitrary projective orbit
need not be closed or compact.

**3A.6 Projective representation and restriction maps.** For a nonzero
finite-dimensional rational G-module V retain the original G and its
homomorphism ρ:G→GL(V). Construct the dual action
(g·ℓ)(v)=ℓ(ρ(g⁻¹)v) on V*, its regular action on P(V*) and the O(1)
linearization. Consume the generic relative-Proj/tautological line and
projective-space H⁰ calculation from SchemeAndStackFoundations §§0.3 and 2.6
and AlgebraicVectorBundles: the relative Proj with its twisting sheaf O(1) of §0.3 and the
computation `H⁰(ℙⁿ_A, O(d)) = Sym^d(A^(n+1))` for `d ≥ 0` of §2.6. Prove the actual natural identification
H⁰(P(V*),O(1))≃V (using finite-dimensional double duality) and its
equivariance. Choose a closed orbit X in P(V*) by 3A.4; construct the
G-equivariant restriction r:V→H⁰(X,O(1)|X), including multiplication,
pullback and section evaluation in trivializations. At x=[ℓ] choose
v with ℓ(v)≠0, proving r≠0. Its kernel is a rational G-submodule;
for irreducible V it is zero. When using point-group representations,
first prove the rational-submodule versus G(k)-stable-subspace adapter
by the density of k-points of the smooth group. Do not replace G by
GL(V), assume H⁰(X,O(1)) irreducible, or assume restriction surjective.
H⁰ finiteness uses the existing proper/coherent theorem, the finiteness of
the cohomology of a coherent sheaf on a scheme proper over a Noetherian ring
(SchemeAndStackFoundations §2.6), separately from this kernel argument. Any
comparison with holomorphic sections uses the specified proper coherent
comparison later; no Borel–Weil or cohomological vanishing premise enters
the injection. For connected reductive G, identifying H with a parabolic and the line with a
dominant-weight associated bundle is the later Layer 7/SchubertGeometry
application, not an input to generic orbit existence.
The input is a rational `G`-module; a bare continuous action of a compact group such as `U(n)`
is not one, and no algebraic action theorem is applied to it here. Converting a continuous
representation of a compact group into a rational representation of its complexification is
LieGroups Layer 7's (bullets *Representations and holomorphic descent* and *Compact-real-form
pairs and algebraic morphisms*), and applying this section to the result is its consumers'.
*Needs:* Layer 1's rational representations and comodules; the pinned closed orbits of 3A.4;
SchemeAndStackFoundations §§0.3 and 2.6 and AlgebraicVectorBundles for the relative Proj and
its `H⁰`.

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

The generic algebraic orbit geometry is the pinned Tau Ceti library.
SchemeAndStackFoundations retains generic constructibility/dimension/projective/coherent
geometry, and LieGroups finite-dimensional analytic quotient/manifold theory. NilpotentOrbits'
adjoint orbit and SchubertGeometry's highest-line/flag comparison consume or compare with this
earlier phase without becoming its prerequisites.

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
- An elliptic curve `E` acting on itself by translation has the single orbit `E`, closed,
  with empty boundary of dimension `−∞ < 1`: the dimension and closed-orbit statements need
  no affineness of `G`. `𝔾_m` acting on itself by translation has one closed orbit and no
  fixed point, so "closed orbit" does not mean "fixed point".

### Dependencies

Layers 0–2 and Layer 3's group-object vocabulary; the pinned orbit geometry of the supplier
contracts; SchemeAndStackFoundations §§0.3, 0.7, 0.8, 2.6, 4.12 and AlgebraicVectorBundles;
SmoothBundlesConnections B1.0, B1.1, B1.4; LieGroups Layer 2; Mathlib's affine scheme charts,
topological gluing, submersion normal form, base change of schemes along field extensions and
universal openness of schemes over a field, and the native analytic inverse function theorem.


## Layer 4: Jordan decomposition, diagonalizable groups, tori
- **Jordan decomposition.** For an affine group `G` over a field `k` and a perfect extension
  field `K`, the unique commuting factorization `g = g_s g_u` of `g ∈ G(K)` with `ρ(g_s) = ρ(g)_s`
  and `ρ(g_u) = ρ(g)_u` for every finite-dimensional representation `ρ`, and its compatibility
  with homomorphisms, are pinned (`TauCeti.HopfAlgebra.Point.jordanDecomposition`,
  `TauCeti.HopfAlgebra.Point.isSemisimple_isUnipotent_unique`,
  `TauCeti.HopfAlgebra.Point.jordanDecomposition_mapDomain`, supplier contracts; Milne,
  Theorem 9.18, p. 170, which takes `K = k` perfect, and §§9.19–9.21, p. 171, for homomorphisms
  and the choice of a faithful representation) and consumed. So are the componentwise
  decomposition of a product of commuting points,
  `TauCeti.HopfAlgebra.Point.jordanDecomposition_mul_of_commute` (the parts of an automorphism
  are polynomials in it, Milne, Theorem 9.11, pp. 168–169), and the compatibility with every
  homomorphism `K → L` of perfect value fields,
  `TauCeti.HopfAlgebra.Point.jordanDecomposition_mapValue`. Over an imperfect field `k`
  it applies with `K` the perfect closure or `k̄`, and the parts of a `k`-point need not be
  `k`-points (Checks). The remaining target is the unique commuting factorization of a locally
  finite automorphism of a possibly infinite-dimensional vector space over a perfect field,
  compatible with every finite-dimensional stable subspace (Milne, Theorem 9.17, p. 170), applied
  to the regular representation of `G`. *Needs:* the pinned point Jordan decomposition; Layer 1's
  comodule dictionary and the regular representation; Mathlib's Jordan–Chevalley decomposition of
  a single endomorphism.
- **Diagonalizable groups and groups of multiplicative type.** The following are pinned and
  consumed (supplier contracts), not restated: the scheme anti-equivalence and closed-subgroup
  stability of diagonalizable groups; the points comparison `D(M)(R) = Hom(M, Rˣ)` for every
  commutative `k`-algebra `R`, `TauCeti.DiagonalizableGroup.schemePointsMulEquiv`, under which
  `M → N` induces `D(N) → D(M)` by precomposition (Milne, Proposition 12.3, pp. 231–232); the
  character-group comparison
  `TauCeti.DiagonalizableGroup.geometricCharacterGroupEquiv` with trivial Galois action; and
  exactness in both directions, `TauCeti.DiagonalizableGroup.isShortExact_mapDomainBialgHom_iff`
  (Milne, Theorems 12.8–12.9(a)–(b), p. 233). Also pinned are the weight decomposition
  `TauCeti.Comodule.isInternal_weightSpace` (Theorem 12.12, (a) ⇒ (b), p. 234) and the
  definition `TauCeti.multiplicativeTypeCommHopfAlgProperty` of multiplicative type
  (Definition 12.17, p. 236). For such groups, faithfulness of the character functor over every
  field and fullness over a perfect field are pinned, as is the classification of the groups
  split by a given finite Galois extension (Milne, Theorem 12.23, p. 240, in that case). Four
  targets remain.
  - Quotient groups of diagonalizable groups are diagonalizable (Milne, Theorem 12.9(c),
    p. 233). The quotient map makes `O(Q)` a Hopf subalgebra of `k[M]`, and a subcoalgebra of a
    coalgebra spanned by group-like elements is spanned by the group-like elements it contains.
    With it, identify the pinned exact sequence of group algebras for `0 → M′ → M → M″ → 0`
    with the Layer 3 fppf sequence `1 → D(M″) → D(M) → D(M′) → 1`, kernel and represented
    quotient included (Milne, Theorem 12.9(b)–(c), pp. 233–234).
  - The converse direction of Milne, Theorem 12.12, pp. 234–235: if every finite-dimensional
    representation of an affine group `G` over `k` is a sum of characters, then `O(G)` is
    spanned by its group-like elements. Apply the hypothesis to the finite-dimensional
    subcomodules of the regular representation; a vector spanning a `G`-stable line of `O(G)` is
    a scalar multiple of a group-like element.
  - Every group of multiplicative type over `k` splits over a finite separable extension of `k`
    (Milne, Theorem 12.18, (a) ⇔ (d), p. 237, and Corollaries 12.19–12.20, p. 238). Route: start
    from the pinned finite splitting field
    `TauCeti.multiplicativeTypeCommHopfAlgProperty.exists_finiteDimensional_groupLikeSpanned_baseChange`.
    Then descend the splitting along its purely inseparable part, since a group of
    multiplicative type that splits over a purely inseparable extension is already split
    (Corollary 12.20).
  - The character functor `G ↦ X*(G)` is an anti-equivalence, over every field `k`, from groups
    of multiplicative type to finitely generated abelian groups with a continuous action of
    `Gal(k_s/k)`, and it matches short exact sequences (Milne, Theorem 12.23, p. 240). Base
    change restricts the Galois action, and a purely inseparable extension of `k` leaves the
    morphisms between groups of multiplicative type unchanged (Corollary 12.25, p. 240). Route:
    combine the separable splitting above with the pinned finite Galois descent of
    `TauCeti/Algebra/AlgebraicGroup/GroupAlgebra/Galois/`. Over an imperfect field the descent
    goes through `k_s`, not `k̄`, which is not Galois over `k`. This is why the pinned fullness
    `TauCeti.multiplicativeTypeCommHopfAlgProperty.existsUnique_geometricCharacterMap_eq` assumes
    `k` perfect.
  (*Cartier duality* proper is the duality of **finite locally free** commutative group schemes,
  a related but distinct statement owned by ModularCurves §0B.) *Needs:* the pinned diagonalizable
  and multiplicative-type theory and finite Galois descent (supplier contracts); Layer 0's
  dictionary; Layer 1's comodules; Layer 3's quotient maps for the first target; Mathlib's group
  algebras and `GroupLike`.
  **Checks.**
  - In characteristic `p`, the coordinate surjection `k[t,t⁻¹] → k[t]/(t^p−1)` presents
    `μ_p ⊂ 𝔾_m`. The target has group-like basis `1, t, …, t^(p−1)` and length `p`, but only one
    geometric point; closed-subgroup stability does not require reducedness.
  - Quotients: in characteristic `p`, `μ_{p²}/μ_p` has coordinate ring the coinvariants `k[t^p]`,
    spanned by the group-like elements `t^(pj)`. It is `μ_p = D(ℤ/p)`, whose character group
    `pℤ/p²ℤ ≅ ℤ/p` is the subgroup of `X*(μ_{p²}) = ℤ/p²` killed by restriction to `μ_p`, as
    exactness requires.
  - Converse of 12.12, a non-example: for `𝔾_a`, the representation `a ↦ [[1,a],[0,1]]` has the
    single stable line `⟨e₁⟩`, so it is not a sum of characters. Likewise the only group-like
    element of `O(𝔾_a) = k[a]` is `1`, whose span `k` is not `k[a]`. Both conditions fail
    together, as the equivalence requires.
  - Separable splitting over an imperfect field: for `k = 𝔽₂(a)` and `b² + b = a`, the extension
    `k(b)/k` is separable of degree 2. The norm-one torus of `k(b)/k` has `X* = ℤ` with the
    nontrivial automorphism acting by `−1`, so it is not split over `k`. It stays nonsplit over
    the purely inseparable `k(√a)`, by Corollary 12.20, and splits over `k(b)`. A splitting field
    taken inside `k̄` with no separability control can be `k(b, √a)`, of degree 4; its separable
    part `k(b)` is the one Galois descent uses.
  - The anti-equivalence over `ℝ`: `μ₄` is diagonalizable, so `X*(μ₄) = ℤ/4` with trivial action.
    The constant group `ℤ/4` is of multiplicative type with `X* = μ₄(ℂ) ≅ ℤ/4`, on which complex
    conjugation acts by `−1`. They are not isomorphic over `ℝ`: `μ₄(ℝ) = {±1}` has two points
    and the constant group has four. A functor to bare abelian groups, without the Galois
    action, would identify them.
- **Tori:** split and non-split (Milne, Definition 12.14, p. 236); the **character lattice**
  `X*(T)` and **cocharacter lattice** `X_*(T)` with their perfect pairing `⟨χ, λ⟩`, defined by
  `χ ∘ λ : 𝔾_m → 𝔾_m`, `t ↦ t^⟨χ,λ⟩`: the input to root data. That `X*` and `X_*` are free of
  the same rank with the pairing perfect, and that the character-lattice functor is an
  anti-equivalence of tori over a perfect field with continuous Galois lattices, are pinned
  (`TauCeti.TorusCommHopfAlgCat.instCharacterCocharacterPairingIsPerfPair`,
  `TauCeti.TorusCommHopfAlgCat.finrank_cocharacterLattice_eq_characterLattice`,
  `TauCeti.TorusCommHopfAlgCat.characterLatticeFunctor_isEquivalence`, supplier contracts) and
  consumed. Prove, over every field, that the characters defined over `k` are the Galois-fixed
  geometric characters, and that a group of multiplicative type, in particular a torus, is split
  exactly when its Galois action on `X*` is trivial (Milne, §12g, pp. 239–240). Prove that a
  group of multiplicative type is a torus exactly when `X*` is torsion-free, and that the
  pairing is natural: `⟨f*χ, λ⟩ = ⟨χ, f_*λ⟩` for `f : T → T′`. For a diagonalizable `D(M)`, with
  `p` the characteristic exponent of `k`, prove that `D(M)` is smooth exactly when `M` has no
  `p`-torsion, so every `D(M)` is smooth in characteristic zero, and a split torus exactly when
  `M` is torsion-free (Milne, Remark 12.5, p. 232, and Definition 12.14, p. 236). The
  torsion-free direction of the last statement is pinned
  (`TauCeti.splitTorusCommHopfAlgProperty_coordinateRing`), as is the characterization of tori
  as the geometrically connected and geometrically reduced groups of multiplicative type
  (`TauCeti.torusCommHopfAlgProperty.iff_multiplicativeType_and_geometricallyConnected_and_geometricallyReduced`).
  On tori, the anti-equivalence of the previous bullet over every field restricts
  to the pinned perfect-field equivalence. *Needs:* the pinned torus lattices and
  character-lattice equivalence; the anti-equivalence of the previous bullet; Layer 0's
  smoothness dictionary for the smoothness criterion; Mathlib's `RootPairing` vocabulary for the
  pairing.

### Examples

**Checks.**
- In `GL₂(ℚ)`, `g = [[2,1],[0,2]]` has `g_s = 2·I` and `g_u = [[1,1/2],[0,1]]`;
  the standard representation sees these as its own Jordan parts. In characteristic 2
  this displayed matrix has determinant 0 and is not a GL₂ point. Over the imperfect field
  `k = 𝔽₂(a)`, `g = [[0,1],[a,0]]` has characteristic polynomial `x² − a = (x − √a)²`, so
  `g_s = √a·I` exists only over `k(√a)`: the perfectness hypothesis cannot be dropped.
  The identity, in the rank-zero group as well, has parts `(1, 1)`; a factorization into
  arbitrary commuting factors would also allow `(h, h⁻¹)`. In characteristic 2, `g = I + E₁₂`
  has `g² = I` but `g_s = I` and `g_u = g`: finite order does not force semisimplicity in the
  defining characteristic.
- `D(0) = 1`, `D(ℤ) = 𝔾_m`, `D(ℤ/n) = μ_n`, and for `n ≥ 1` the exact sequence
  `0 → ℤ → ℤ → ℤ/n → 0` (multiplication by `n`) corresponds to `1 → μ_n → 𝔾_m → 𝔾_m → 1`
  with `t ↦ tⁿ` (at `n = 0` neither sequence is exact, while `D(ℤ/0) = D(ℤ) = 𝔾_m` still holds);
  `X*(μ_n) = ℤ/n` (the characters `tⁱ`, `i mod n`). Over `ℂ`, `D(ℤ/2) = μ₂` has two reduced
  points; replacing `M` by its torsion-free quotient would give the trivial group. In
  characteristic `p`, `D(ℤ/p) = Spec k[t]/((t − 1)^p)` is nonreduced with one point and tangent
  dimension 1, so it is not smooth, as `ℤ/p` has `p`-torsion; a dictionary built on
  reduced groups would send `ℤ/p` to the trivial group and lose `X* = ℤ/p`.
- For `𝔾_m` the pairing of the character `t ↦ tᵃ` with the cocharacter `t ↦ tᵇ` is `ab`.
  The norm-one torus `T = {x² + y² = 1}` over `ℝ` has `T_ℂ ≅ 𝔾_m` via `x + iy`, and complex
  conjugation acts on `X*(T) = ℤ` by `−1`, so `T` is not split; `𝔾_m` over `ℝ` has the same
  rank with trivial Galois action. The characters of `T` defined over `ℝ`, the Galois-fixed
  ones, form `0` although `T` has rank 1; the pairing stays invariant since `(−m)(−n) = mn`.
  The rank-zero torus has zero lattices with the perfect pairing `0 × 0 → ℤ`.
- In characteristic `p`, `μ_p` is of multiplicative type with `X* = ℤ/p`, which is not
  torsion-free, so `μ_p` is not a torus; its cocharacter group is `0`, and no perfect lattice
  pairing exists for it.

### Dependencies

Layers 0–1 and Layer 3's quotient maps; Tau Ceti's point Jordan decomposition, torus lattices
and character-lattice equivalence, diagonalizable and multiplicative-type theory and finite
Galois descent of group algebras (supplier contracts); Mathlib's Jordan–Chevalley
decomposition, group algebras and group-like elements; Mathlib's `RootPairing` vocabulary for
the pairing.

## Layer 5: solvable and unipotent groups; the unipotent radical
- **Unipotent groups** (correct, comodule definition): `G` is unipotent iff every nonzero
  representation has a nonzero fixed vector, equivalently every finite-dimensional
  representation is unipotent (Milne, 6.45, p. 135, and Proposition 14.3, p. 280). Prove the
  equivalent conditions: `G` embeds as a closed subgroup of the upper-triangular unipotent
  `Uₙ` for some `n`; `k[G]` is coconnected (Milne, Theorem 14.5, p. 281); and that a
  unipotent group has a central normal series with quotients subgroups of `𝔾_a`, hence is
  nilpotent (Milne, Proposition 14.21, p. 284). Prove stability under subgroups, quotients
  and extensions (Milne, Corollary 14.7, p. 282), and that `G` is unipotent exactly when `G_K`
  is, for every field extension `K/k` (Corollary 14.9, p. 282). For smooth `G`, prove the
  comodule definition equivalent to unipotence of every geometric point in every
  finite-dimensional representation, the native
  `TauCeti.geometricallyUnipotentPointsCommHopfAlgProperty` (Corollary 14.12, p. 283). Prove that
  every homomorphism from a unipotent group to a group of multiplicative type is trivial
  (Corollary 14.18, p. 284). *Needs:* Layer 1's comodules and the embedding theorem; Layer 3's
  quotients; Layer 0's base change; Layer 4's groups of multiplicative type.
  - ⚠ "No nontrivial characters" is **not** equivalent to unipotent (e.g. `SLₙ` has no
    nontrivial characters but is semisimple). The implication is one-way: a *connected
    unipotent* group has no nontrivial characters; the converse needs solvability. Prove the
    converse for smooth connected solvable groups over an algebraically closed field, through a
    faithful triangular representation (Milne, Theorem 16.30, p. 334, and Corollary 14.18,
    p. 284); over other fields the criterion uses geometric characters.
  - ⚠ A naïve `IsUnipotent` that tests nilpotence of `ρ(g) − id` only on geometric points
    is wrong for nonsmooth groups: `μ_p(k̄) = {1}`, so every such test passes for `μ_p`,
    which is not unipotent. The correct definition uses comodules (Layer 1).
- **Solvable groups.** The Lie–Kolchin theorem (Milne, Theorem 16.30, p. 334) is consumed from
  Tau Ceti and not restated: over an algebraically closed field a smooth connected group with
  solvable points stabilizes a line in every nonzero representation and puts every
  finite-dimensional representation in upper-triangular form
  (`TauCeti.Comodule.hasNonzeroWeightVector_of_isSolvable` and
  `TauCeti.Comodule.exists_basis_coefficientMatrix_isUpperTriangular_of_isSolvable`, supplier
  contracts); applied to the faithful representation of the embedding theorem it embeds the group
  in the upper-triangular `Bₙ`. For smooth `G`, prove that termination of the scheme-theoretic
  derived series, iterating the pinned derived subgroup
  `TauCeti.CommHopfAlgCat.derivedDefiningIdeal`, is equivalent to solvability of the group of
  geometric points, so that the pinned theorem applies to solvable groups in the scheme sense.
  Over `k̄` the quotient `G/G_u` by the native unipotent radical is a torus
  (`TauCeti.FiniteTypeCommHopfAlgCat.torus_coinvariants_unipotentRadical`). Prove,
  over `k̄`, the decomposition `G = G_u ⋊ T` for a maximal torus `T`, with every subgroup of
  multiplicative type conjugate into `T` by a point of `G_u(k̄)` (Milne, Theorem 16.33(d),
  p. 336). For a smooth connected solvable `G` over a perfect field `k`, prove that `G/G_u` is a
  torus and that `G_u` commutes with extension of `k` (Milne, Theorem 16.33(a)–(c),
  pp. 335–336), by the base-change comparison of the next item, since a torus over `k` is a
  group that becomes a split torus over `k̄`.
  *Needs:* the unipotent theory above; the pinned Lie–Kolchin theorem and torus quotient;
  Layer 4's tori; Layer 3's quotients; for the perfect-field case, the next item.
- **Radical descent and quotient comparison.** For a smooth connected G over any field k,
  identify the subgroup scheme cut out by the native k-radical ideal with the greatest smooth
  connected normal unipotent k-subgroup of G, as subgroup schemes and not only on k-points:
  every smooth connected normal unipotent k-subgroup factors uniquely through the radical
  inclusion, and every automorphism of G preserves the radical (Milne, Proposition 6.42 and
  6.46, pp. 134–135, and Corollary 14.8, p. 282). Prove that this radical commutes with
  separable algebraic extensions of k (Milne, Proposition 19.9, p. 399); for an arbitrary
  extension only the pinned inclusion of the base-changed k-radical in the radical of the base
  change holds (`TauCeti.FiniteTypeCommHopfAlgCat.unipotentRadicalDefiningIdeal_baseChange_le`).
  For a smooth connected G over a perfect field k, compare the native k-unipotent radical with
  the geometric radical: the base change of its closed inclusion to k̄ identifies with the
  native radical inclusion of G over k̄. Over k̄ the represented quotient G/R_u(G)
  is reductive and over every field the quotient by the k-radical is pseudo-reductive,
  both pinned (`TauCeti.FiniteTypeCommHopfAlgCat.reductive_coinvariants_unipotentRadical`,
  `TauCeti.FiniteTypeCommHopfAlgCat.pseudoReductive_coinvariants_unipotentRadical`). Prove that
  over a perfect field k the quotient G/R_u(G) is reductive, by base change of the right
  coinvariants to k̄ and the radical comparison, and that this quotient identification commutes
  with arbitrary extension of k (Milne, Remark 17.94(a), p. 382, and
  Propositions 19.9 and 19.11, pp. 399–400). Over an imperfect field the radical of G over k̄ need not descend;
  Layer 9D treats the native k-radical and the pseudo-reductive distinction.
  *Needs:* the native radical and its maximality; the pinned quotient theorems; the unipotent
  theory above; Layer 3's normal quotients; Layer 0's base-change comparisons.

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
- The pinned Lie–Kolchin theorem needs both hypotheses: the constant group `S₃` over `ℂ` is
  solvable with an irreducible two-dimensional representation (not connected); `SO₂` over `ℝ`
  is connected and commutative but rotation by `90°` has no real eigenvector (not
  algebraically closed).
- In the upper-triangular `B₂ ⊂ GL₂` the stable line `ke₁` has character `a` and the quotient
  has character `d`; at `diag(2, 3)` over `ℚ̄` these are `2` and `3`, so a stable line need not
  be fixed pointwise.
- The radical ideal of 𝔾_a is zero, giving radical 𝔾_a; that of SL₂ is
  the augmentation ideal, giving the identity subgroup. The ideal inequalities
  reverse subgroup inclusions; the unit ideal would instead give an empty scheme.
- Unipotent radicals: `R_u(𝔾_a ⋊ 𝔾_m) = 𝔾_a`; `R_u(SL₂) = 1`; `R_u(GLₙ) = 1` for all n, while for n>0 the
  radical `R(GLₙ) = 𝔾_m` is the centre, so the two radicals differ; for n=0 both are 1.
  `R_u(SL₂) = 1` in every characteristic although `SL₂` contains the non-normal
  one-dimensional unipotent `U₂`: maximality is among normal subgroups. For `K/k` purely
  inseparable of degree `p`, `Res_(K/k) 𝔾_m` has geometric unipotent radical of dimension
  `p − 1` with no `k`-form (Layer 9D), while its `k`-unipotent radical has dimension `0`.

### Dependencies

Layers 0, 1, 3 and 4; Tau Ceti's Lie–Kolchin theorem and its theorems on the quotient by the
unipotent radical (supplier contracts); Milne Chapters 6, 14 and 16 as cited.

## Layer 5P: the shared polynomial-unipotent exponential and logarithm

Construct this characteristic-zero helper here, from Layers 2–5, before the Levi-complement
machinery of 6A or the ordered-root/Bruhat construction of 7C. It is the single polynomial
exponential/logarithm package: 6A.1 consumes its commutative-unipotent/vector-layer
restriction, while 7C consumes its full unipotent variety and subgroup comparison. Neither
application is a premise, and there is no separate duplicate exponential engine. Keep all of
Layer 5's arbitrary-field unipotent scope; the finite-factorial argument of this subsection is
specifically characteristic zero.

The matrix-level theory is pinned and consumed, not restated. Mathlib's `IsNilpotent.exp`
(`Mathlib/RingTheory/Nilpotent/Exp.lean`) and Tau Ceti's `IsNilpotent.log`, with the inverse
identities `IsNilpotent.log_exp` and `IsNilpotent.exp_log` (`TauCeti/RingTheory/Nilpotent/Log.lean`),
give the finite exponential `exp(X) = ∑_{j<d} Xʲ/j!` of a strictly upper-triangular `d × d`
matrix `X` and the finite logarithm `log(1 + Z) = ∑_{1≤j<d} (−1)^{j+1} Zʲ/j` of a unipotent
`1 + Z`, over every rational algebra, with no analytic convergence. `TauCeti.UpperUnitriangular.expCoordinateEquiv`
(`Algebra/AlgebraicGroup/UpperUnitriangular/Exponential.lean`) makes them inverse isomorphisms of
affine schemes between the strictly upper-triangular matrices and `Uₙ`. For a closed subgroup
`H ⊆ GLₙ` cut out by a Hopf ideal over a rational ring or domain, the supplier contract
*Unipotent matrix groups* lists the pinned facts: the polynomial curves `exp(tX)` for nilpotent
`X ∈ Lie H` and `exp(t log g)` for unipotent `g ∈ H` lie in `H` scheme-theoretically,
`log g ∈ Lie H`, `TauCeti.GeneralLinear.expEquivHopfIdealPoints` is the bijection between the
nilpotent elements of `Lie H` and the unipotent points of `H`, and over `ℝ` or `ℂ` the point group
of an `H` whose points are all unipotent is contractible
(`TauCeti.GeneralLinear.contractibleSpace_hopfIdealPointsSubgroup`), hence simply connected. None
of these assumes `H` smooth, connected or reduced.

The targets are the transfer from matrices to groups. For each smooth finite-type affine group
with geometrically unipotent points used here, before presuming connectedness, choose a faithful
upper-unitriangular realization: consume the faithful-comodule embedding of Layer 5 under its
reducedness and algebraic-closure hypotheses, and prove the smooth/reduced and field-descent
adapters rather than dropping them. For the finite-type closed subgroup schemes needed here,
consume `TauCeti.smoothCommHopfAlgProperty_of_charZero` and transport its smoothness statement
through the Layer 0 dictionary to the reducedness hypothesis of the faithful embedding. Do not
assert that arbitrary closed subgroups of smooth groups in characteristic `p` are smooth. Prove
that the pinned point bijection of the realized subgroup comes from an isomorphism of affine
schemes between the subgroup and its Lie subspace, restricting `TauCeti.UpperUnitriangular.expCoordinateEquiv`
along the defining Hopf ideals (Milne, 14.31 and Proposition 14.32, pp. 288–289); it identifies
`U⁺` with its nilpotent Lie algebra as affine varieties, not as additive groups. Export
`exp : Lie(U) → U` and `log : U → Lie(U)` as inverse scheme morphisms, with the derivative of
`exp` at `0` the identity. For commuting `X`, `Y` prove `exp(X + Y) = exp(X) exp(Y)` (at matrix
level Mathlib's `IsNilpotent.exp_add_of_commute`); for general `X`, `Y` retain the
noncommutative product. Prove independence of the faithful realization, naturality for
every homomorphism `f : U → V` of these groups, `f ∘ exp = exp ∘ df` and `df ∘ log = log ∘ f`,
subgroup maps included, compatibility with algebraic field extensions, and equivariance under
every automorphism, in particular conjugation by `T`. The Hopf-ideal argument applies to a smooth
closed subgroup with geometrically unipotent points before its connectedness is known, so its
exp/log restrictions identify it with its Lie subspace without presupposing component
triviality. Over `ℂ`, prove that the polynomial exponential agrees with the Lie-group exponential
of `GLₙ(ℂ)`, so that the two analytic maps are inverse; contractibility and simple
connectedness of `U⁺(ℂ)` are the pinned theorem above applied to the realization. This uses no
Bruhat, Iwasawa or highest-weight classification theorem. Do not use this characteristic-zero
argument for arbitrary unipotent groups in characteristic `p`.
*Needs:* Layers 2–5; `TauCeti.smoothCommHopfAlgProperty_of_charZero`; Mathlib `IsNilpotent.exp`
and `IsNilpotent.exp_add_of_commute`; Tau Ceti's `IsNilpotent.log`,
`TauCeti.UpperUnitriangular.expCoordinateEquiv` and the unipotent
matrix-group theorems of the supplier contracts.

### Examples

**Checks.**
- For `N = [[0,a],[0,0]]`, `N² = 0`, so `exp(N) = I + N` and `log(I + N) = N`; the
  one-parameter subgroup of `u = I + E₁₂` is `u^t = I + tE₁₂`, with `log u = E₁₂`.
- For `X = E₁₂ + E₂₃` in `3×3` matrices, `X² = E₁₃` and `exp(X) = I + X + E₁₃/2`: the
  divided power `1/2` is needed, so the construction is characteristic zero and fails over
  `𝔽₂`.
- In `U₃` over `ℚ`, `X = E₁₂` and `Y = E₂₃` do not commute: `exp(X) exp(Y)` has `(1,3)`-entry
  `1`, whereas `exp(X + Y)` has `(1,3)`-entry `1/2`, so additivity needs the commuting
  hypothesis.
- For `d = 1` the strictly upper-triangular algebra is zero and `exp(0) = 1`: the empty
  product case of the unipotent variety is the trivial group.

### Dependencies

Layers 2–5; the supplied characteristic-zero smoothness theorem; Mathlib's finite
exponential of a nilpotent element; Tau Ceti's finite logarithm, exponential coordinates on
`Uₙ` and the unipotent matrix-group theorems (supplier contracts).

## Layer 6: reductive and semisimple groups
- **Reductive:** smooth, connected, with `R_u(G_{k̄})` trivial; the native predicate is
  `TauCeti.reductiveCommHopfAlgProperty`. **Semisimple:** radical `R(G)` (maximal connected
  normal solvable smooth, geometric) trivial (Milne, 6.44 and 6.46, p. 135); the native
  predicate is `TauCeti.semisimpleCommHopfAlgProperty`. The radical, the centre `Z(G)`
  (`TauCeti.CommHopfAlgCat.centerDefiningIdeal`), the derived group `G_der`
  (`TauCeti.CommHopfAlgCat.derivedDefiningIdeal`), **central isogenies**
  (`TauCeti.CommHopfAlgCat.IsCentralIsogeny`) and the simply connected and adjoint predicates
  (`TauCeti.simplyConnectedSemisimpleCommHopfAlgProperty`,
  `TauCeti.adjointSemisimpleCommHopfAlgProperty`) are pinned definitions (supplier contracts);
  this layer owns their structure theorems, which the classification needs. The
  pinned reductive-structure theorems of the supplier contracts make the radical of a reductive
  group a central torus over every field, identify it with the identity component of the
  centre over an algebraically closed field of characteristic zero, make `G_der` semisimple,
  and characterize semisimple groups as the reductive ones with finite centre (Milne,
  Proposition 19.10, p. 400); they are not restated. Prove that both predicates are invariant
  under isomorphism and under every field extension (Milne, Propositions 19.5 and 19.13,
  pp. 398–400). For a smooth connected `G` over a perfect field, prove `R(G)_k̄ = R(G_k̄)` and
  that `G/R(G)`, with its represented quotient map, is semisimple (Milne, Propositions
  19.1–19.2, pp. 397–398), by base change to `k̄` and the pinned
  `TauCeti.FiniteTypeCommHopfAlgCat.semisimple_coinvariants_solvableRadical`, as Layer 5 does for
  `R_u`. Prove that over a perfect field the radical is `(Z(G)_red)°`, and over an arbitrary
  field the descent of the geometric central torus. Prove that descent, rather than assuming
  reduction over an imperfect field commutes with base change (Milne, §19.a, p. 400, and
  Corollary 17.62(b)–(c), pp. 372–373). Prove that `G = R(G)·G_der`, the multiplication map
  `R(G) × G_der → G` being a central isogeny, and that `Z(G)` is of multiplicative
  type (Conrad, Reductive Group Schemes, Theorem 3.3.4, p. 98, over a field). *Needs:*
  Layer 5's radicals; Layer 4's tori and multiplicative type; Layer 3's quotients; the pinned
  reductive-structure theorems.
- **Alternative characterization, linearly reductive:** every f.d. representation is completely
  reducible; the native predicates are `TauCeti.Coalgebra.IsLinearlyReductive` and
  `TauCeti.linearlyReductiveCommHopfAlgProperty` (Milne, Definition 12.52, p. 248). For
  linearly reductive `G`, construct the Reynolds projection `V → V^G` of every rational
  `G`-module along the sum of its simple submodules with nontrivial action (Milne, §12l,
  p. 249): it is natural for module maps and linear over the invariants of a `G`-algebra, but it
  is not multiplicative.
  ⚠ Reductive groups are **not** linearly reductive in characteristic `p`
  (rational representations are generally not semisimple). Both implications for smooth
  geometrically connected groups in **characteristic 0** are pinned and not restated:
  `TauCeti.reductiveCommHopfAlgProperty.of_smooth_of_geometricallyConnected_of_baseChange_linearlyReductive`
  (linear reductivity of the geometric fibre implies reductivity, in every characteristic) and
  `TauCeti.reductiveCommHopfAlgProperty.linearlyReductive` (a reductive group is linearly
  reductive in characteristic 0; Milne, Theorem 22.42, p. 477), assembled in
  `TauCeti.reductiveCommHopfAlgProperty_iff_linearlyReductive`, which assumes only geometric
  connectedness, smoothness being automatic by Cartier's theorem. The first target is the
  corollary for groups that need not be connected: an affine group `G` of finite type over a
  field of characteristic 0 is linearly reductive iff its identity component `G°` is reductive
  (Milne, Corollary 22.43, p. 478). Its headline signature is
  `StructureAcceptance.linearlyReductive_iff_reductive_identityComponent`, which takes the
  identity component after extension to an algebraic closure `k̄`, where the native
  `TauCeti.FiniteTypeCommHopfAlgCat.identityComponent` is defined; `(G_k̄)° = (G°)_k̄` and
  reductivity is a geometric condition, so this is the statement over `k`. Route: `G°` is
  normal of finite index, a restriction to it of a completely reducible representation is
  completely reducible, and averaging over the finite group `G/G°` lifts complete reducibility
  from `G°` to `G` in characteristic 0. The second target is Nagata's theorem: over an
  algebraically closed field of characteristic `p > 0`, a **smooth connected affine** group is
  linearly reductive iff it is a torus (Kohls, *A user friendly proof of Nagata's
  characterization of linearly reductive groups in positive characteristics*, pp. 271–278, which
  proves the smooth case). Milne, Remark 12.56, p. 249, states the theorem without proof and
  attributes it to Nagata. Its 2017 printing reads "`G°` is a torus" for every affine group,
  which `μ_p` refutes; the statement here assumes smoothness. Milne, Proposition 12.54, p. 248,
  proves only the commutative case: a commutative group is linearly reductive iff it is of
  multiplicative type. Its headline signature is `StructureAcceptance.linearlyReductive_iff_torus`,
  stated over every field of characteristic `p > 0` for smooth geometrically connected groups,
  with the native `TauCeti.torusCommHopfAlgProperty` (a split torus after base change to an
  algebraic closure). Both sides are geometric: linear reductivity is insensitive to extension of
  the base field (Milne, footnote to Proposition 12.54, p. 248), so the statement reduces to the
  algebraically closed case. Tori are linearly reductive
  (`TauCeti.torusCommHopfAlgProperty.linearlyReductive`) and the solvable case, a reduced
  connected group with solvable rational points over an algebraically closed field, is
  `TauCeti.linearlyReductiveCommHopfAlgProperty_iff_torus_of_isSolvable`, both pinned; the target
  is the general smooth connected case.
  *Needs:* Layer 1's comodules; Layer 3's identity component and quotients; Layer 4's tori;
  Layer 5's unipotent groups; the pinned implications above.

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
- Over `ℂ`, `O₂ = SO₂ ⋊ ℤ/2` is disconnected with identity component `SO₂ ≅ 𝔾_m`, which is
  reductive, and `O₂` is linearly reductive; so is the finite constant group `S₃`, whose identity
  component is trivial. The characteristic-zero criterion needs no connectedness, while the
  constant `ℤ/p` above shows that it fails in characteristic `p`.
- In characteristic `p`, `μ_p` is connected and linearly reductive (it is diagonalizable) but
  not smooth, and it is not a torus; `𝔾_m` is smooth, connected, linearly reductive and a torus;
  `SL₂` and `𝔾_a` are smooth and connected, and neither linearly reductive nor tori. Nagata's
  criterion needs the smoothness hypothesis.
- In characteristic `p`, the constant group `ℤ/ℓ` for a prime `ℓ ≠ p` is smooth and linearly
  reductive (Maschke) but has `ℓ` components and is not a torus: Nagata's criterion needs
  connectedness. Over `𝔽_p` the norm-one torus of `𝔽_(p²)/𝔽_p` is nonsplit and linearly
  reductive; it is a torus, a group that becomes a split torus over an algebraic closure.
- For `𝔾_m` acting on `k[x, x⁻¹]` by weights, the Reynolds projection sends `xᵐ` to `0` for
  `m ≠ 0` and `1` to `1`. It sends `x·x⁻¹ = 1` to `1`, whereas the product of the projections of
  `x` and `x⁻¹` is `0`: it is not multiplicative.

### Dependencies

Layers 1, 3, 4, 5; the pinned reductive-structure and linear-reductivity theorems and the
pinned centre, derived group, central isogeny and simply connected and adjoint predicates of the
supplier contracts.

## Layer 6A: characteristic-zero Levi complements for general affine groups

Let k be a field of characteristic zero and G a smooth connected affine k-group
of finite type. Here G need not be reductive or be a parabolic in another
reductive group. Consume Layer 5's geometric unipotent radical U=R_u(G),
its k-descent and smooth connectedness, and Layer 3's represented quotient
q:G→Q=G/U; prove Q reductive with this actual quotient map. A Levi complement
is a closed k-subgroup L⊂G for which q|L:L→Q is a group-scheme isomorphism.
Construct such L, prove it connected and reductive, and construct the actual
semidirect-product group scheme U⋊L, with L acting on U by conjugation.
On every commutative k-algebra A its multiplication is
`(u,l)(u',l')=(u(lu'l⁻¹),ll')`; the isomorphism U⋊L→G sends `(u,l)` to ul.
Its inverse sends g to `(g s(q(g))⁻¹,s(q(g)))`, where
`s:Q→G` is the splitting with image L. Construct these as scheme morphisms
and prove both inverse identities, not just a bijection on k-points.
The headline signature is `StructureAcceptance.exists_levi_complement`: for smooth
geometrically connected `G` of finite type in characteristic zero there is a Hopf ideal `J` of
`O(G)` such that the quotient map composed with the inclusion of the right coinvariants of the
`k`-unipotent radical's defining ideal is bijective, that is, `O(Q) → O(G)/J = O(L)` is an
isomorphism (McNinch §3.1, p. 6; in characteristic `p` the Greenberg transform of `SL₂` over the
length-two Witt vectors has no such `J`, McNinch (3.2.1), p. 7). The `k`-unipotent radical is
the geometric one since `k` is perfect, and a connected group is geometrically connected.

Build the following algebraic splitting machinery before proving this theorem.
It uses Layers 0–1's same affine/Hopf and native right-comodule carriers,
Layer 3's quotients and Layer 5's unipotent structure, followed by the pinned
characteristic-zero implication from reductivity to linear reductivity,
`TauCeti.reductiveCommHopfAlgProperty.linearlyReductive`.
It uses neither the parabolic Levi theorem of Layer 7 nor an integration of an
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
   restricting G. From Layer 0's faithfully-flat torsor/descent machinery prove
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
   `Cⁿ_alg(H,V)=k[H]^(⊗n)⊗V`, with C⁰=V and tensor unit in degree 0.
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
   normalization and field transports and the reductive averaging application below. For reductive Q in characteristic zero, obtain the native
   `Coalgebra.IsLinearlyReductive` hypothesis from
   `TauCeti.reductiveCommHopfAlgProperty.linearlyReductive` and
   `TauCeti.linearlyReductiveCommHopfAlgProperty_iff`, and consume
   `Comodule.Hom.exists_fixed_preimage_of_isLinearlyReductive`,
   `fixedMap_surjective_of_isLinearlyReductive` and
   `exact_fixedMap_of_isLinearlyReductive` from
   `TauCeti.Algebra.Coalgebra.Comodule.LinearlyReductive.Fixed`.
   These already lift invariant vectors in arbitrary rational modules by
   Layer 1's finite-subcomodule reduction and an equivariant splitting of its
   finite-dimensional image; retain this comparison with the scheme-level
   invariants. Construct the resulting Reynolds splittings/acyclicity
   comparison, and prove `Hⁿ_alg(Q,V)=0` for n>0. This algebraic averaging
   uses rational representations over k, not a Haar probability measure on Q(k).
3. **Vector extensions and explicit sign conventions.** For a smooth affine
   extension `1→V→E→H→1` by a vector group with the specified rational
   H-action, construct a regular normalized section s using item 1. Define
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
   conjugating V₀(k)-point to U(k) by item 1, and then induct in the
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
`Lie(G)≃Lie(U)⋊Lie(L)` and compare with Layer 2; a general Lie-algebra splitting
is not used to assert an algebraic complement. Keep the full reductive
central torus, arbitrary unipotent dimension, U=1 and Q=1 cases.

Give explicit tests on a torus acting on a vector group, upper-triangular
invertible matrices, a connected reductive group (U=1), a connected unipotent
group (L=1), and L×G_a. In the last example all of U centralizes the same
complement, disproving uniqueness of the conjugating element. Under k=ℂ
compare this exact algebraic decomposition with the underlying holomorphic
group of Layer 3A.5e and use LieGroups Layer 7 only for the already reductive factor's
compact real form. There is no asserted Levi splitting for all groups in
positive characteristic; Layer 7's separate all-field parabolic theorem
retains its hypotheses and is not replaced by this characteristic-zero lane.
The regular extension/cohomology route is discussed in
[McNinch §§2.2–2.3,3.1,4.1,4.3–4.5,5.1–5.2](https://arxiv.org/html/1007.2777v1).
*Needs:* Layers 0–1 (including Layer 1's rational cohomology), 3, 5 and 5P; Layer 3A.5e for
`k = ℂ`; the pinned characteristic-zero linear reductivity of reductive groups; the native
fixed-map lemmas named above.

### Examples

**Checks.**
- For `𝔾_m` acting on `V = 𝔾_a` by weight one, a regular 1-cocycle `a(ts) = a(t) + t·a(s)`
  satisfies `a(1) = 0` and `a(t) = c(t − 1)` for `c = a(t)`'s linear coefficient, which is the
  coboundary of `v = c`: `H¹_alg(𝔾_m, V) = 0`, and the two Levi complements `T` and `uTu⁻¹`
  of the Borel of `GL₂` are conjugate by exactly one `u ∈ U(k)`, since `C_U(T) = 1`.
- Explicitly, in `𝔾_a ⋊ 𝔾_m` with product `(x, t)(y, s) = (x + ty, ts)`, conjugating
  `L = {(0, t)}` by `(a, 1)` gives `{(a(1 − t), t)}`, so the complements correspond bijectively
  to `U(k) = k`. In the Borel of `GL₂`, with `Q = 𝔾_m²`, conjugating the diagonal torus by
  `u(b) = I + bE₁₂` gives `{[[s, b(t − s)], [0, t]]}`.
- For `G = L × 𝔾_a`, every `u ∈ U(k) = k` centralizes `L`, so all conjugators coincide on
  the single complement and `U(k)/C_U(L)(k)` has one element: conjugators are not unique.
  `L` is the only complement, since a complement is the graph of a homomorphism `L → 𝔾_a`,
  trivial for reductive `L` in characteristic zero.
- For `U = 1` the theorem returns `L = G = Q` with the trivial extension; for `Q = 1`,
  `G = U` is unipotent and `L = 1`. In the Hopf coordinates of the headline: for `U = 1` the
  radical's defining ideal is the augmentation ideal, its right coinvariants are all of `O(G)`
  and `J = 0`; for `G = U` the coinvariants are `k`, `J` is the augmentation ideal and
  `k → O(G)/J = k` is bijective, whereas `J = 0` fails for `𝔾_a` since `k → k[x]` is not
  surjective.
- Sign convention: for `H = 𝔾_m` acting on `V = 𝔾_a` with weight one and `c = 0`, the
  product `(v, s)(w, t) = (v + sw, st)` is the semidirect product, and `b(t) = t − 1`, the
  coboundary of `v = 1`, has `db(s, t) = s(t − 1) − (st − 1) + (s − 1) = 0`, as a 1-cocycle
  must; the sign-reversed rule `g·b(h) − b(gh) − b(g)` gives `2 − 2s ≠ 0`. Associativity of
  the displayed product is exactly `c(g, h) + c(gh, k) = g·c(h, k) + c(g, hk)`, the `n = 2`
  case of the displayed differential.

### Dependencies

Layers 0–1 (including §1.1), 3, 5, 5P, and 3A.5e for `k = ℂ`; the pinned characteristic-zero
linear reductivity of reductive groups; the native cofree and fixed-point comodule interfaces.

## Layer 6B: complex reductive coset affineness

- **Reductive coset affineness.** The affine direction of Matsushima's criterion is pinned
  (supplier contracts, *Native quotient and isometry interfaces*): over a field of characteristic
  zero, for
  a finite-type affine group `A` and a reductive, hence connected, closed subgroup `H`,
  `TauCeti.HopfIdeal.isIso_fppfHomogeneousQuotientToCoinvariantsPoints_of_reductive` identifies
  the fppf homogeneous quotient `CommHopfAlgCat.fppfHomogeneousQuotient` with the sheaf of points
  of `Spec(O(A)^H)`, where `O(A)^H` is `TauCeti.HopfIdeal.coinvariants`;
  `TauCeti.Comodule.isIso_fppfHomogeneousQuotientToCoinvariantsPoints_ker_coordinateBialgHom`
  applies it to `GL_n/G` for every faithful representation `G → GL_n` of a reductive `G`; the
  universal property, the finite generation of the invariants and the base change along every
  field extension are pinned as well. They are consumed, not restated. This layer owns the
  extension to closed subgroups `H` whose identity component is reductive, `H` itself possibly
  disconnected, over every field of characteristic zero and in particular over `ℂ`: for such `H`
  prove that the comparison map `TauCeti.HopfIdeal.fppfHomogeneousQuotientToCoinvariantsPoints`
  is an isomorphism, so that `A/H` is affine (over an algebraically closed field of
  characteristic zero, Arzhantsev, *Invariant Ideals and Matsushima's Criterion*,
  arXiv:math/0506430v1, Proposition 2.2, p. 2). Route: Layer 6's
  `StructureAcceptance.linearlyReductive_iff_reductive_identityComponent` makes such an `H`
  linearly reductive (Milne, Corollary 22.43, p. 478), and
  `TauCeti.HopfIdeal.isIso_fppfHomogeneousQuotientToCoinvariantsPoints_of_isLinearlyReductive`
  applies, `O(A)` being geometrically reduced by Cartier's theorem. Expose for these `H` the
  quotient map, the universal property, the finite generation of `O(A)^H`, the torsor
  comparison `A × H ≅ A ×_(A/H) A`, `(a, h) ↦ (a, ah)`, and the base changes at the stated
  hypotheses, through the pinned `TauCeti.HopfIdeal.fppfHomogeneousQuotientIsoCoinvariantsPoints`,
  `TauCeti.HopfIdeal.coinvariantsPointsHomEquiv`,
  `TauCeti.HopfIdeal.finiteType_coinvariants_of_isLinearlyReductive`,
  `CommHopfAlgCat.isPullback_fppfHomogeneousQuotientTorsor` and
  `TauCeti.HopfIdeal.fppfHomogeneousQuotientBaseChangeIso`. Beyond these, prove for such `H`
  that the quotient map `q : A → A/H` is faithfully flat with pullback identifying `O(A/H)` with
  `O(A)^H`, and that for every `k`-scheme `Y` composition with `q` identifies morphisms
  `A/H → Y` with `H`-invariant morphisms `A → Y`, by comparing morphisms of schemes with
  morphisms of their fppf sheaves of points. For every `k`-scheme `S`, identify
  `(A/H) ×_k S` with `A_S/H_S`, compatibly with the torsor and invariant-algebra comparisons;
  over `S = Spec R` this is `O(A)^H ⊗_k R ≅ (O(A) ⊗_k R)^(H_R)`, and the pinned base change is
  the case of a field `R`. The Reynolds projection of Layer 6 on `O(A)` fixes `O(A)^H` and is
  `O(A)^H`-linear but not multiplicative; the coordinate map of `q` is the inclusion of the
  invariants, not this projection. With the pinned connected case this extension
  is the Matsushima construction that FormalConnectionsOpers §3A.5 consumes; that roadmap owns
  its loop-Grassmannian reduction-locus/ind-stage application. Keep the general quotient
  discussion and its hypotheses, without asserting arbitrary closed-subgroup quotients affine.
  *Needs:* Layer 6's characteristic-zero criterion for disconnected groups and its Reynolds
  projection; the pinned homogeneous-quotient theorems; Cartier's theorem
  `TauCeti.smoothCommHopfAlgProperty_of_charZero`; Layer 0's base change and descent for the
  comparison over a general `k`-scheme.

### Examples

**Checks.**
- For the disconnected-subgroup extension, `GL₁/O₁ = 𝔾_m/μ₂ ≅ 𝔾_m` via `t ↦ t²`, and `ℂ[t, t⁻¹]^(±1) = ℂ[t², t⁻²]`: the quotient is
  `Spec` of the invariants. Averaging over `μ₂` sends `t` to `0` and `t²` to itself, and `q` has
  degree 2. For the constant `S₃` and a transposition subgroup `C₂`, the invariant algebra is
  `ℂ³` and each of the three fibres of `q` has two points.
- In that same extension, `GLₙ/Oₙ` is the open affine subscheme of invertible symmetric
  matrices via `g ↦ ggᵗ`: `(gh)(gh)ᵗ=ggᵗ` for h∈Oₙ. For g=diag(2,1) and
  h=[[0,1],[1,0]], both values are diag(4,1), whereas gᵗg and (gh)ᵗ(gh) are
  diag(4,1) and diag(1,4). For n=1 this is the previous check; the zero symmetric
  matrix is excluded when n>0, and for n=0 both quotient and target are a point.
- For `H = 1` the invariants are `O(A)`, `q` is the identity and `A × 1 → A ×_A A` is the
  diagonal isomorphism; for `H = A` with `A°` reductive the invariants are `k`, the quotient is
  `Spec k`, and `(a, h) ↦ (a, ah)` has inverse `(a, b) ↦ (a, a⁻¹b)`.
- For `A = SL₂` with coordinates `a, b, c, d`, `ad − bc = 1`, and the diagonal torus `H = T`, the
  right-`T`-invariants `x = ab`, `y = cd` and `z = ad` satisfy `xy = z(z − 1)`, so `SL₂/T` is the
  affine surface `Spec k[x, y, z]/(xy − z(z − 1))`.
- For `A = 𝔾_a × 𝔾_m` and `H = 𝔾_m`, right translation fixes `x` and sends `t` to `ts`, so
  `k[x, t, t⁻¹]^H = k[x]` and `A/H = 𝔾_a`, although `A` has a one-dimensional unipotent
  radical. Over `R = k[ε]/(ε²)` the invariants are `R[x]`, retaining the nilpotent `ε`.
- `SL₂/N⁺` for the unipotent `N⁺` has invariant algebra `k[a, c]` but is the punctured
  plane `𝔸² ∖ {0}`, not `Spec k[a, c] = 𝔸²` (Layer 10D): the reductivity hypothesis on the
  subgroup cannot be dropped.
  Likewise for the upper Borel `B ⊂ SL₂` the quotient is `ℙ¹`, of dimension 1, whose only
  regular functions are the constants, so it is not `Spec O(SL₂)^B`, a point.

### Dependencies

Layers 0, 6; the native homogeneous quotient sheaf, coinvariants and pinned Matsushima theorems of
the supplier contracts.

## Layer 7: structure theory
- **Borel subgroups and maximal tori.** Over an algebraically closed field a Borel
  subgroup is a maximal smooth connected solvable closed subgroup (Milne, Definition 17.6,
  p. 353; natively `TauCeti.HopfIdeal.IsBorelOverAlgClosed`). Over an arbitrary field `k` a
  Borel `k`-subgroup is a closed subgroup that becomes a Borel subgroup over `k̄`, the pinned
  `TauCeti.HopfIdeal.IsBorel`; existence of one is not asserted for every `k`-group. Any two
  Borel subgroups of a
  finite-type affine group, smooth or not, are conjugate by a rational point: this is the
  pinned `TauCeti.HopfIdeal.IsBorelOverAlgClosed.exists_conjugate_eq` (Milne, Theorem 17.9(b),
  p. 354), consumed and not restated. Prove that `G/B` is complete (Milne, Theorem 17.9,
  p. 354) and that any two Borel subgroups of a connected reductive group contain a common
  maximal torus. Prove `StructureAcceptance.exists_conjugate_eq_of_isMaximalTorus`: over an
  algebraically closed field `k`, any two maximal tori of a finite-type affine group `G`, in the
  sense of the pinned `TauCeti.HopfIdeal.IsMaximalTorus` (`Torus/Maximal.lean`, a torus closed
  subgroup contained in no larger one), are conjugate by a rational point, `I.conjugate g = J`
  (Milne, Theorem 17.10, p. 354, for smooth connected `G`). No smoothness or connectedness is
  assumed: a torus is smooth and connected, so the tori of `G` are those of the smooth connected
  subgroup `(G_red)°`, an algebraic subgroup because `k` is perfect (Milne, Corollary 1.39,
  p. 18), whose rational points are rational points of `G`. The pinned
  `TauCeti.HopfIdeal.exists_conjugate_eq_of_isMaximalTorus` (`Torus/Conjugation.lean`) has the
  same conclusion under the additional hypotheses that each of the two tori can be conjugated
  into one fixed maximal torus, which its `GLₙ`, `SLₙ` and symplectic instances discharge for
  those groups; the target removes these hypotheses. A route: every maximal torus
  lies in a Borel subgroup (`TauCeti.HopfIdeal.IsMaximalTorus.exists_isBorelOverAlgClosed_le`,
  `Borel/Torus.lean`), any two Borel subgroups are conjugate (the pinned theorem above), and two
  maximal tori of one Borel subgroup are conjugate by a rational point of it (Layer 5's
  solvable decomposition, Milne, Theorem 16.33(d), pp. 335–336). Equivalently, the pinned
  `TauCeti.HopfIdeal.IsBorelOverAlgClosed.exists_le_conjugate_of_isBorelCandidate`
  (`Borel/Conjugacy/Containment.lean`) conjugates every smooth geometrically connected solvable
  closed subgroup, each of the two tori in particular, into one prescribed Borel subgroup.
  The Bruhat decomposition is
  the bullet *Bruhat decomposition* below. These algebraic prerequisites are consumed by
  Layer 7b. The route to completeness of `G/B` and to the
  conjugacy of maximal tori is the Borel fixed-point theorem for a Borel subgroup acting on a
  complete homogeneous space, built on the pinned closed orbits of Layer 3A and the pinned
  Lie–Kolchin theorem. *Needs:* the pinned Lie–Kolchin theorem
  (`TauCeti.Comodule.exists_basis_coefficientMatrix_isUpperTriangular_of_isSolvable`) and
  Layer 5's solvable decomposition; the pinned orbit theorems and Borel conjugacy; Layer 3's quotients; Layer 4's tori; the native Borel and
  maximal-torus predicates, the pinned containment of maximal tori in Borel subgroups, and
  conjugation of Hopf ideals.
- **Parabolic subgroup schemes and Levi decompositions.** For a connected smooth
  affine reductive group of finite type over a field `k`, its parabolic `k`-subgroups `P` are
  the pinned `TauCeti.HopfIdeal.IsParabolic` (`Parabolic/Basic.lean`): the smooth closed
  subgroups whose base change to `k̄` contains a Borel subgroup, with
  `TauCeti.HopfIdeal.IsParabolicOverAlgClosed` the geometric form; the library supplies that
  Borel subgroups are parabolic, that a smooth closed subgroup containing a parabolic is
  parabolic, invariance under conjugation by rational points, and over `k̄` that every
  parabolic has a conjugate containing a prescribed Borel
  (`TauCeti.HopfIdeal.isParabolicOverAlgClosed_iff_exists_conjugate_le`). Prove the
  completeness characterization: a smooth closed subgroup `P` is parabolic exactly when `G/P`
  is complete (Milne, Definition 17.15 and Theorem 17.16, p. 356), with `G/P` the quotient
  sheaf of Layer 3, represented by a separated scheme for every closed subgroup of the smooth
  affine `G` (Milne, Theorem 7.18, p. 143), as for `G/B` above; define the Levi complements of
  `P` (Conrad–Feng, Definition H.1.1, p. 238). Prove that the geometric unipotent
  radical of `P` descends to a smooth connected `k`-split normal subgroup `U`, the
  `k`-unipotent radical cut out by the pinned
  `TauCeti.FiniteTypeCommHopfAlgCat.unipotentRadicalDefiningIdeal` of `O(P)`,
  and that a reductive `k`-subgroup `L` exists with `P=L⋉U` (Conrad–Feng, §H.1, p. 238). In
  the form of Layer 6A's complement, this headline,
  `StructureAcceptance.exists_levi_complement_of_isParabolic`, reads: `U` is the `k`-unipotent
  radical of `P`, and there is a Hopf ideal `J` of `O(P)` such that the composite
  `O(P)^U → O(P) → O(P)/J = O(L)` of the inclusion of the right coinvariants of its defining
  ideal with the quotient map is bijective, that is, `L = V(J)` maps isomorphically onto
  `P/U`; for `P = G` the radical is trivial and `J = 0`, and for the Borel `B = T ⋉ U` of
  `GL₂` over any field `O(B)^U = k[a^{±1}, d^{±1}]` and `J` cuts out `T`. Prove that conjugation
  by `U(k)` acts simply transitively on the Levi `k`-subgroups of this fixed `P`, and that
  every maximal `k`-torus of `P` lies in exactly one of them (Conrad–Feng,
  Proposition 12.3.1, p. 127). For the dynamic Levi subgroups of a fixed cocharacter, freeness of
  the conjugation action of the rational points of `U_G(λ)` is the pinned
  `BialgHom.injOn_conjugate_leviDefiningHopfIdeal`, and the identification of the fppf quotient
  `P_G(λ)/U_G(λ)` with `Z_G(λ)` is the pinned `BialgHom.parabolicLeviFppfQuotientIso` (supplier
  contracts); the target is transitivity on all Levi `k`-subgroups and the comparison of the
  dynamic subgroups with `TauCeti.HopfIdeal.IsParabolic` below.
  These targets hold over every field; they include the algebraically closed case. Prove that
  the quotient projection `P → P/U`, the splitting `P/U ≅ L` and the multiplication
  isomorphism `U ⋊ L → P` with its inverse are compatible with field extension and with
  conjugation by rational points. The characteristic-zero Levi theorem of Layer 6A is not used
  for these arbitrary-field statements.
  Representability, smoothness and the multiplication isomorphism `U_G(λ) × Z_G(λ) → P_G(λ)` of
  the dynamic subgroups of a cocharacter `λ` (Conrad, Reductive Group Schemes, Theorem 4.1.7,
  p. 112) are pinned and consumed: `TauCeti.Cocharacter.parabolicDefiningHopfIdeal`,
  `BialgHom.unipotentDefiningHopfIdeal`, `TauCeti.Cocharacter.leviDefiningHopfIdeal`, the three
  `BialgHom.smoothCommHopfAlgProperty_quotient_*DefiningHopfIdeal` theorems and
  `BialgHom.parabolicCoordinateAlgEquiv` (supplier contracts). Prove the cocharacter description:
  for connected reductive `G` and a cocharacter `λ`, the Hopf ideal of `P_G(λ)` satisfies
  `TauCeti.HopfIdeal.IsParabolic`, that of `U_G(λ)` cuts out its `k`-unipotent radical and that of
  `Z_G(λ)` a Levi complement, and every parabolic `k`-subgroup is `P_G(λ)` for some `λ` over `k`
  (Conrad–Feng,
  [*Reductive Groups over Fields*](https://math.stanford.edu/~conrad/249BW16Page/handouts/AMSalggroups2.pdf),
  Example H.1.2, p. 238, which recalls from the end of §6.3 that every parabolic `k`-subgroup is
  some `P_G(λ)`; Proposition 12.3.1, p. 127).
  Layer 7b owns the additional finite-field intersection, transporter, and rational-point
  comparisons; its common-Levi statements take the specified `F`-stable complement as input.
  *Needs:* the Borel theory above; the pinned parabolic predicate; Layer 5's unipotent
  radicals; Layer 4's cocharacters and tori; Tau Ceti's dynamic point subgroups.
- **Root datum** `(X*(T), Φ, X_*(T), Φ^∨)` of `(G, T)` with its **Weyl group**: do the
  **split** case first (split maximal torus, or work over `k̄`), consuming
  `LinearAlgebra/RootSystem/*` and `GroupTheory/Coxeter/*`; construct the roots as the
  nonzero weights of `T` on `Lie(G)`, the rank-one subgroups `G_α` with their coroots
  (Milne, Theorem 21.11, p. 428), prove that these lattices, roots and coroots satisfy the
  axioms of a reduced root datum, compatibly with field extension and with isomorphisms of
  pairs `(G, T)` (Milne, Corollary 21.12 and §§21.17–21.18, pp. 430–432), and prove that
  `N_G(T)/T` is generated by the reflections
  `s_α` and acts on `X*(T)` as the Weyl group of the root datum (Milne, Theorem 21.37,
  p. 435). Prove that for a Borel subgroup `B ⊇ T` the roots of `T` on `Lie(B)` form a
  positive system of `Φ` whose simple roots are a base of the same datum, this assignment being
  a bijection from the Borel subgroups containing `T` to the positive systems of `Φ` (Milne,
  Theorem 21.32, pp. 434–435); then add the **absolute root
  datum with Galois action** and the **relative root system** for non-split groups, the latter
  for a maximal split torus, possibly nonreduced and with root spaces of dimension greater than
  one (Conrad–Feng, §§12.1–12.3).
  *Needs:* Layer 2's adjoint representation and Layer 4's torus weights;
  Tau Ceti's finite root-system API and Weyl Coxeter presentation (supplier contracts); Mathlib's `RootPairing`.
- **Bruhat decomposition.** Let `G` be a connected reductive group over a field `k`, `T` a split
  maximal torus and `B ⊇ T` a Borel subgroup, with `N = N_G(T)` the scheme normalizer and
  `S` the reflections in the simple roots of the base determined by `B`. Prove that
  `(G(k), B(k), N(k), S)` is a Tits system (Milne, Example 21.47, p. 439, and
  Proposition 21.75, p. 448), in the native `TauCeti.TitsSystem`. The headline
  `StructureAcceptance.exists_titsSystem_of_isBorel` states this with `T` presented by a
  surjective bialgebra map `π : O(G) → k[X]` whose kernel is a maximal torus, `B` given by
  `TauCeti.HopfIdeal.IsBorel` with `I ≤ ker π`, `subgroupB` the rational points of `B`
  (`TauCeti.CommHopfAlgCat.quotientPointsSubgroup`) and `subgroupN` the rational points of the
  scheme normalizer (`BialgHom.normalizerPoints`). The Bruhat decomposition
  `G(k) = ⨆_{w∈W} B(k) w B(k)` and the double-coset identification `B(k)\G(k)/B(k) ≃ W` follow
  from the pinned `TauCeti.TitsSystem.existsUnique_mem_bruhatCell` (Milne, Theorem 21.45, p. 438)
  and are not restated; prove that the Weyl quotient `N(k)/T(k)` is the Weyl group of the root
  datum of `(G, T)`, and that over an algebraically closed field `N(k)` is the normalizer of
  `T(k)` in `G(k)`, since `T(k)` is dense in `T`. The pinned `TauCeti.glTitsSystem`, with `N` the
  normalizer of the rational diagonal torus, and `TauCeti.slTitsSystem`, with `N` the
  determinant-one monomial matrices, are its `GLₙ₊₁` and `SLₙ₊₁` cases over a field with
  nontrivial unit group; in both `N` is the group of rational points of the scheme normalizer.
  The scheme-theoretic cells `B w B` and the cellular decomposition of `G/B` are Layer 7C's
  (Milne, §21.h, p. 446, and Theorem 21.73, p. 447). Keep the **dynamic** approach to parabolics/Levi/unipotent radical as a
  route that avoids full root data, useful for consumers that require only a BN-pair.
  *Needs:* the Borel and root-datum targets above; Layer 7C's ordered root coordinates for the
  cells; the pinned Tits systems, normalizer points and Borel predicate (supplier contracts).

  **Checks.**
  - Over `𝔽₂`, the diagonal torus `T` of `GL₂` has `T(𝔽₂) = 1`, so the normalizer of `T(𝔽₂)` in
    `GL₂(𝔽₂) ≅ S₃` is the whole group and `B(𝔽₂) = {[[1,b],[0,1]]}`, of order two, is not normal
    in it: the abstract normalizer fails axiom (T1). The scheme normalizer has `N(𝔽₂)` the two
    monomial matrices, `B(𝔽₂) ∩ N(𝔽₂) = 1`, `W` of order two, and `6 = |B| + |BsB| = 2 + 4`.
  - For `G = T = B = 𝔾_m`, `N = G`, the Weyl quotient is trivial and `S` is empty: the Tits system
    has one cell.
  - Over `𝔽₃` the rational diagonal torus of `SL₂` is the centre `{±1}`, whose normalizer is all of
    `SL₂(𝔽₃)`, of order 24, while `N(𝔽₃)` is the four determinant-one monomial matrices
    `diag(a, a⁻¹)` and `[[0, b], [−b⁻¹, 0]]`; with `B(𝔽₃)` of order 6, `B ∩ N = T(𝔽₃)` of order 2
    and `24 = |B| + |BsB| = 6 + 18`.
  - Over an algebraically closed field, with `B` upper triangular in `GL₂` and `T` the
    conjugate of the diagonal torus by `g = [[1,0],[1,1]]`, so `T ⊄ B`, the intersection
    `B(k) ∩ N_G(T)(k)` is the scalars times `⟨[[−1,1],[0,1]]⟩`, which conjugation by
    `g·diag(a,d)·g⁻¹` with `a ≠ ±d` does not preserve: containment `T ⊆ B` is needed.
  - For the constant group `ℤ/3`, which is not connected, `B = T = 1` and the Weyl quotient
    `ℤ/3` is not generated by involutions: connectedness, part of reductivity, is needed.

### Examples

**Checks.**
- In `SL₂` over `k̄` the Borel subgroups are the stabilizers of lines in `k̄²`. The
  upper- and lower-triangular Borels are conjugate by `w = [[0,1],[−1,0]]`:
  `w [[a,b],[0,d]] w⁻¹ = [[d,0],[−b,a]]`. The quotient `G/B⁺ = ℙ¹` is complete. The
  conjugating point is not unique: `wt` works for every `t` in the diagonal torus, so the
  theorem asserts existence only.
- In `GL₂` the upper and lower triangular Borels meet in the diagonal torus, a common maximal
  torus of dimension 2, and `GL₂/B = ℙ¹` has dimension 1.
- For the constant group `ℤ/2` the identity component is trivial, so the only Borel subgroup
  is trivial; reading Borel as maximal solvable without connectedness would admit `ℤ/2`
  itself. For `μ_p` in characteristic `p`, `G_red` is trivial and again the only Borel
  subgroup is trivial.
- Over `ℝ` the upper triangular subgroup of `SL₂` is smooth, connected and solvable, but
  `TauCeti.HopfIdeal.IsBorelOverAlgClosed` fails because `ℝ` is not algebraically closed, so
  the conjugacy theorem says nothing there; the anisotropic `SO₃` over `ℝ` has no Borel
  `ℝ`-subgroup at all.
- Over `ℝ`, the diagonal torus and `SO₂` are maximal tori of `SL₂` that are not conjugate
  by any element of `SL₂(ℝ)` (one has unbounded, the other compact real points), although
  they become conjugate over `ℂ`: conjugacy of maximal tori needs the algebraically closed
  field.
- In `PGL₂` over `k̄` of characteristic `≠ 2`, the image `V₄` of `diag(±1, ±1)` and
  `[[0, ±1], [±1, 0]]` is a commutative subgroup of semisimple elements, hence diagonalizable,
  and is its own centralizer, as the diagonal torus `T` is: both are maximal among
  diagonalizable subgroups, of dimensions `0` and `1`, so they are not conjugate. Conjugacy holds
  for maximal tori, not for maximal diagonalizable subgroups, and `V₄` lies in no torus.
- For `G = GL₂ × μ_p` over `k̄` of characteristic `p`, which is not smooth, every torus lies in
  `G_red = GL₂ × {1}`, so the maximal tori are the `T × {1}` with `T` a maximal torus of `GL₂`,
  and any two are conjugate by a point of `GL₂(k̄)`. For the constant group `S₃`, which is not
  connected, the only torus is trivial. Neither smoothness nor connectedness is needed.
- `SL₂` has the two Bruhat cells `B` and `BwB = {c ≠ 0}`, matching `|W| = 2`; `GL₃` has
  six cells and exactly four parabolic subgroups containing `B⁺` (`B⁺`, the two
  block-triangular groups and `GL₃`), one for each subset of the two simple roots.
- In the Borel `B = T ⋉ U` of `GL₂` the Levi complements are the conjugates `uTu⁻¹`,
  `u ∈ U(k)`, and `uTu⁻¹ = T` only for `u = 1`: conjugating `diag(s,t)` by `I + aE₁₂` gives
  upper entry `a(t − s)`. The action of `U(k)` is simply transitive,
  and `T` is the unique Levi complement containing `T`.
- For `λ(t) = diag(t,1)` in `GL₂`, conjugation by `λ(t)` sends `E₁₂` to `tE₁₂` and `E₂₁` to
  `t⁻¹E₂₁`, so `P_G(λ)` is the upper triangular Borel and `−λ` gives the opposite one. The
  computation holds over `𝔽₂` on the group scheme `𝔾_m`, although `𝔾_m(𝔽₂)` has one element.
- For `(SL₂, T)` with `T = {diag(t, t⁻¹)}`, `X* = ℤe` with `e(diag(t,t⁻¹)) = t`, the root is
  `α = 2e`, the coroot is the identity cocharacter and `⟨α, α∨⟩ = 2`; for `PGL₂` the root
  `α` generates `X*` and `α∨` is twice a generator of `X_*`. The two root data have the
  same Dynkin diagram `A₁` and are not isomorphic. The pairing is 2 in characteristic 2 as
  well, where the differential of `t ↦ t²` is zero: the root is an integral character, not
  its differential.
- For `𝔾_m` the unique Borel subgroup and maximal torus are `G` itself, `G/B` is a point, `Φ`
  is empty, both lattices are `ℤ` and `W = 1`; discarding the lattices would confuse this
  datum with that of the trivial group.

### Dependencies

Layers 2–5 and §§3A.1–3A.5 (the pinned orbit theorems and the complex charts); Layer 7C for the
ordered coordinates of the cells; Tau Ceti's Tits systems, normalizer points and finite root-system API and Weyl Coxeter presentation (supplier contracts); Tau Ceti's Lie–Kolchin theorem and its Borel, reductive and dynamic interfaces; Mathlib's root pairings
and Coxeter groups.

## Layer 7C: ordered unipotent factors and the contraction proof of Bruhat coordinates

Build this phase inside Layer 7, before consuming its final Bruhat decomposition. Keep the actual connected smooth affine reductive group G, maximal torus T, B+=T⋉U+, opposite B− and full character/cocharacter lattices. For split G over a field construct the root subgroups and their rank-one maps on this actual group, with their closed immersions, tangent root lines, torus-conjugation equations and positive-root generation of U+. These early root maps are a construction from the given group, not an application of the later classification of split groups or of 9B's separately constructed Chevalley group. Use Layers 2–5's tangent, solvable and unipotent theory and Tau Ceti's finite root/reflection API in the supplier contracts. Prove the root-string commutator and positive-height filtration laws needed for ordered collection. Keep every root type, isogeny and central torus. For a nonsplit group use the geometric statement after the specified algebraic closure and retain its actual descent data; no unqualified assertion about k-rational orbits or lifts follows. The generic all-field Bruhat target retains its generality; the complex contraction/cover proof below is a separate characteristic-zero proof route and does not supply a positive-characteristic exponential argument.

For the all-field early root-map phase, construct the scheme-theoretic centralizer of ker(α) in the given split group and its connected rank-one derived subgroup. Retain its actual central-isogeny lattice: the simply connected SL₂ map may have a kernel and is not declared an embedding of SL₂ for every group form. Construct its two smooth additive root groups as T-contracted subgroups and prove their parameterizations by Ga, their torus weights and their tangent maps. Prove the rank-one open multiplication chart and central isogeny by the actual rank-one coordinate equations, including
`x_α(a)x_−α(b)=x_−α(b/(1+ab)) α∨(1+ab) x_α(a/(1+ab))`
on the open set `1 + ab ≠ 0`, and `n_α(a)=x_α(a)x_−α(−a^−1)x_α(a)` for a≠0. This is the rank-one calculation inside the given group, not the final all-rank Bruhat decomposition. Prove the finite root-string conjugation and commutator polynomials by collecting in each rank-two subsystem using these actual parameterizations; keep the integer constants and signs determined by the chosen pinning, including their reductions in bad characteristic, and prove base-change compatibility. Construct the positive-height filtration by the closed subgroups generated by root groups of height at least r, prove its successive additive root-coordinate quotients, and prove generation by induction on height. This is the lower all-field supplier for ordered collection and the two-cell rank-one calculation. All of these construction and inverse obligations belong to this phase; later 9B existence/classification, or the desired final group decomposition, is not a hidden supplier.

**7C.1 Consume the shared lower exponential.** Use Layer 5P's actual polynomial exp/log isomorphism and its closed-subgroup, Lie, field-extension and automorphism comparisons. Its inputs are Layers 2–5, so this use precedes both Levi splitting and the final Bruhat theorem. In the ℂ route `U⁺(ℂ)` is contractible and simply connected by the pinned
`TauCeti.GeneralLinear.contractibleSpace_hopfIdealPointsSubgroup` applied through Layer 5P's
realization. The all-field root-height collection route above remains independent of this characteristic-zero helper.

**7C.2 The two specified root subsets.** With W acting on the left, fix a normalizer representative n_w and put
`A_w={β∈Φ+ : w^−1β∈Φ+}` and `I_w={β∈Φ+ : w^−1β∈Φ−}`.
Prove these partition Φ+, are closed under root addition when the sum is a root, and define their actual root Lie subalgebras. Define the closed intersection H_w=U+∩n_w U+ n_w^−1, with its scheme equalizer and Lie intersection, before asserting connectedness. Define J_w=U+∩n_w U− n_w^−1 similarly. In characteristic zero prove their Lie algebras are the sums over A_w and I_w, using the actual root decomposition and tangent intersection; prove the scheme stabilizers smooth at the stated hypotheses. The two Lie algebras are complementary in Lie(U+). With n_0 a longest representative, I_w=A_(w w0), so J_w=H_(w w0) after the root/intersection comparison. It is generally not H_(w0 w). Normalizer lifts differing by T give the same subgroups; provide the change-of-lift equations on all coordinates.

At e and w0 obtain H_e=U+, J_e=1 and H_w0=1, J_w0=U+. At a simple reflection s_i, H_(s_i) has all positive root directions except α_i and J_(s_i)=U_(α_i). At s_i w0, H_(s_i w0)=U_(α_i). These assertions do not identify H_(s_i) with a negative one-parameter root subgroup. In A2 with w=s1, H_w has roots α2,α1+α2, whereas H_(w0 w) has root α2 and overlaps it; the correct complementary subgroup has root α1. Include rank 0, a pure torus, empty root systems and products, with empty coordinate products equal to the identity.

**7C.3 Actual action, derivative and closed rank-drop locus.** Work first over C without assuming either intersection connected or the desired product decomposition. Use the algebraic H_w×J_w action `(h,j)·u=h u j^−1`. If using h u j instead, use H_w×J_w^op and state its multiplication; ordinary right multiplication is not a left action of the ordinary direct product. In left-trivialized tangent coordinates the derivative at(1,1) of this action at u is
`L_u:(X,Y)↦Ad(u^−1)X−Y`.
Construct this actual bundle morphism, its coordinate matrix and every maximal minor in a chosen basis; show change of basis preserves its rank. Domain and target dimensions both equal dim U+. At 1 the Lie direct sum makes L_1 invertible. The locus Z where its rank is smaller than dim U+ is the common zero locus of these regular maximal minors, and therefore closed. Prove conjugation by T transports the action, derivative and stabilizer, so Z is T-stable. Scheme stabilizer dimension and orbit dimension are related by the smooth characteristic-zero orbit-map calculation; finite rank alone is not an orbit-closure theorem.

Choose an actual positive integral cocharacter c∈Y, for example `2ρ∨ = ∑_{β>0} β∨`, and prove every positive root pairs positively with it. The symbol ρ as a weight is not itself presumed a cocharacter, and the compact real torus cannot provide this contraction. Through exp/log, conjugation by c(z) sends each root coordinate X_β to z^〈β,c〉X_β and extends regularly to `𝔸¹ × U⁺`, with value `1` at `z = 0`. For every nonempty closed T-stable subset S of U+ prove `1 ∈ S` by this extension (or by the analytic limit for a classically closed S). Thus Z must be empty, since `1 ∉ Z`.

Consume the pinned orbit local-closedness `TauCeti.SchemeAction.isLocallyClosed_orbit` and dimension comparisons of Layer 3A, at the action just constructed. U+ is irreducible, being identified with affine Lie(U+) by the independent polynomial exponential. Every full-dimensional locally closed orbit is open in U+: its closure is all U+, and it is open in its closure. Two nonempty open orbits in this irreducible variety intersect, hence are the same. Therefore the action is transitive. Do not replace irreducibility/local-closedness by the assertion that connected spaces cannot have disjoint open subsets. Export the actual orbit map, stabilizer and full-rank equations, not merely transitivity as an unexplained assumption.

**7C.4 Components, the actual covering, and polynomial inverses.** H_w and J_w are closed finite-type algebraic subgroups stable under T. Their finite sets of connected components are fixed by the connected complex algebraic torus: construct the action on components, prove it continuous/algebraic into the finite discrete component set, and prove the orbit of each component is constant. Each component is closed in U+, so the contraction lemma forces it to contain 1. Distinct components are disjoint, hence both subgroups are connected. The same proof applies to any closed T-stable subgroup of U+ at these hypotheses; it is not a claim about arbitrary closed subgroups of a connected Lie group.

Before this topological step, provide the actual analytic connected/path-connected and locally path-connected adapters for H_w and J_w: apply Layer 5P to these smooth closed subgroups and their root Lie subspaces to obtain inverse polynomial maps and their continuous analytic maps. This supplies the relevant Euclidean-space topology directly; no unproved general algebraic-to-analytic connected-component comparison is assumed. The preceding torus/component argument remains a separate proof of the source's algebraic connectedness claim. Construct the analytic homogeneous quotient of H_w×J_w by the actual closed discrete stabilizer Γ of 1. Use the preceding surjective local-diffeomorphism orbit map, prove its fibres are stabilizer cosets and construct the quotient identification with U+(C). Give evenly covered neighborhoods using an identity neighborhood V with V^−1V∩Γ={1}. The connected total space is therefore a connected covering of the simply connected U+(C), so Γ is trivial. Apply native `IsCoveringMap.existsUnique_continuousMap_lifts` (`Mathlib/Topology/Homotopy/Lifting.lean`) to the identity of the base with its chosen identity lift; use `IsCoveringMap.eq_of_comp_eq` (`Mathlib/Topology/Covering/Basic.lean`) on the preconnected total space for the other inverse. Construct the homeomorphism from this data as a 7C.4 target: for a covering map `p : E → X` whose base `X` is simply connected and locally path-connected, whose total space `E` is preconnected, and with a chosen lift `e₀` of a basepoint `x₀`, the unique lift of the identity through `p` sending `x₀` to `e₀` is a two-sided inverse of `p`, by the two cited Mathlib lemmas; conclude that `p` is a homeomorphism. It is not necessary to assume the total space simply connected. Inverting the J coordinate gives the multiplication isomorphism H_w×J_w→U+ as a complex manifold; interchanging H and J gives J_w×H_w as well. The same pinned contractibility theorem, applied to the closed subgroups `H_w` and `J_w`, whose points are all unipotent, shows the factors contractible; this is not inferred from simple connectedness of the base. Retain the algebraic alternative check: a zero-dimensional smooth unipotent subgroup is finite étale, and in characteristic zero a finite unipotent subgroup is trivial.

Export regular polynomial inverses, not only analytic bijections. In characteristic zero use the positive-root-height filtration of the nilpotent Lie algebra and its finite BCH polynomial. To invert exp(X)exp(Y), at height 1 split log(u) using the A_w/I_w projections; at height r subtract the BCH terms already determined at smaller heights and split the remaining height-r coefficient. Brackets strictly raise height, so the unknown height-r terms enter only as X_r+Y_r. This finite recursion gives polynomial maps with two-sided inverse and T-equivariance equations; repeat in the other order. It uses no presumed product decomposition. Over arbitrary split fields construct the corresponding ordered root-subgroup collection/inverse maps by the root-height filtration and rank-two commutator laws, with additive root-coordinate quotients and explicit parameter recovery; do not divide by factorials there. Prove the root/intersection equality, smoothness and connectedness by those actual maps at that generality. All-field group-form/base-change comparisons remain part of Layer 7, not inferred from the C-covering proof.

**7C.5 Stabilizers, cell coordinates and existence without a circular premise.** For the actual right flag quotient G/B+, prove
`Stab_(U+)(n_w B+)=U+∩n_w B+ n_w^−1=H_w`.
The Borel's torus quotient and unipotence eliminate its torus part; prove that comparison on the actual subgroup, not by dimension alone. The orbit is the homogeneous space U+/H_w of right cosets, not generally a quotient group. Use the complement-FIRST factorization J_w×H_w→U+ to construct the isomorphism j↦j n_w B+ onto this orbit. Construct its regular inverse by the actual orbit/fppf quotient and factor maps; a bijection of closed points alone is insufficient. The Lie/root coordinate cardinality gives complex dimension `|I_w| = ℓ(w)`, and real dimension `2ℓ(w)`. The complement's left action is simply transitive.

Derive existence from the early rank-one group maps and generation by B+ and the negative simple-root subgroups. The UNION of the candidate B+ n_w B+ double cosets is stable: prove the rank-one multiplication inclusion into the two neighboring indices w,s_i w, then its minimal-parabolic two-cell equality. Individual cells need not be stable under a negative simple subgroup, and s_i w=w never holds for left multiplication in W. The union contains `1` and is stable under the generating subgroups, so covers G. This is a proof of the covering, not an invocation of the final Bruhat theorem. For disjointness, the coordinate orbit above has exactly one T-fixed point: conjugation on J_w and the positive cocharacter force j=1. Distinct normalizer classes have distinct points n_w B+, using N_G(T)∩B+=T. Thus the candidate orbits have unique Weyl labels. Fix one lift n_w per label; arbitrary lifts are not intrinsically unique. The unique expression g=j n_w b now follows with j∈J_w, b∈B+ (Milne, Theorem 21.80, p. 450). Construct right/left quotient and Borel-opposition transport before applying this convention to SchubertGeometry's negative-Borel cells.

Export the parabolic projection to G/P+ with its actual minimal W/W_P representatives, stabilizer/root subsets, affine coordinates and fibre maps; compare P/Q orbits with W_P\W/W_Q without treating different coset conventions as equal labels. In type A give the actual upper-unipotent/upper-triangular reduction, block-parabolic flag and Grassmannian maps with their universal subspaces. The `GL₂` big-cell map is a↦u(a)n_0B+, or equivalently u(a)B−; u(a)B+ is constant. On P1 with the line model B+ stabilizing [e1], the former chart is a↦[a:1], with inverse x/y on y≠0. Keep this explicit rank-one chart and the A2 factor-order and non-normal-stabilizer regressions as Checks below. The generic flag CW/cohomology and coherent-line comparisons stay at their existing LieGroups/Schubert owners.
*Needs:* Layers 2–5 and 5P; the pinned orbit theorems of Layer 3A; Layer 7's root subgroups and
Borel theory; Tau Ceti's finite root-system API and Weyl Coxeter presentation (supplier contracts); Mathlib's covering-map lifting lemmas.

### Examples

**Checks.**
- In type `A₁`, `W = {e, s}`: `H_e = U⁺`, `J_e = 1`, `H_s = 1`, `J_s = U⁺ = U_α`; the big
  cell chart is `a ↦ u(a) n₀ B⁺`, with `u(a) B⁺` constant.
- In type `A₂` with `w = s₁`, `H_w` has the roots `α₂` and `α₁ + α₂` and `J_w = U_(α₁)`,
  so `|I_w| = ℓ(w) = 1`; the subgroup `H_(w₀ w)` has the root `α₂` and overlaps `H_w`,
  so it is not the complement, whereas `A_(s₁w₀) = {α₁} = I_(s₁)`, confirming
  `J_w = H_(ww₀)`.
- The rule `(h,j)·u = huj⁻¹` is a left action: `((h,j)(h',j'))·u = hh'u(jj')⁻¹` equals
  `(h,j)·((h',j')·u) = hh'uj'⁻¹j⁻¹`. The rule `huj` is not: in `A₂` at `w = w₀`, where
  `J_(w₀) = U⁺`, the two bracketings for `j = x_(α₁)(1)` and `j' = x_(α₂)(1)` differ by the
  commutator `x_(α₁+α₂)(±1) ≠ 1`.
- At `u = 1` and `w = s₁` in `A₂` the derivative `L_1(X,Y) = X − Y`, with `X` in the span of
  the root lines of `α₂`, `α₁ + α₂` and `Y` in that of `α₁`, covers all three positive root
  lines, so `L_1` is invertible; domain and target both have dimension `|Φ⁺| = 3`.
- In `A₂`, `2ρ∨ = 2(α₁∨ + α₂∨)` pairs with `α₁`, `α₂`, `α₁ + α₂` to `2`, `2`, `4`; in `A₁`,
  `2ρ∨ = α∨` pairs with `α` to `2`. The half sum `ρ∨ = α∨/2` is not a cocharacter of `SL₂`,
  whose cocharacter lattice is `ℤα∨`, so only `2ρ∨` is used.
- The stabilizer identity gives `U⁺` at `w = e` and `U⁺ ∩ B⁻ = 1` at `w = w₀`; the big cell
  has dimension `ℓ(w₀) = |Φ⁺|`, which is 3 for `SL₃` and equals `dim G/B⁺`. In `GL₂` with
  `n₀ = [[0,−1],[1,0]]`, `u(a)n₀e₁ = ae₁ + e₂`, so the chart `a ↦ u(a)n₀B⁺` is `a ↦ [a:1]`.
- The rank-one identity at `a = b = 1`: `x_α(1) x_(−α)(1) = [[2,1],[1,1]]`, and
  `x_(−α)(1/2) α∨(2) x_α(1/2) = [[1,0],[1/2,1]] · [[2,1],[0,1/2]] = [[2,1],[1,1]]`.
- For `w = s₁s₂` in `A₂`, `A_w = {α₂}` and `H_w = U_(α₂)` is not normal in `U⁺`:
  `x_(α₁)(1) x_(α₂)(1) x_(α₁)(−1) = x_(α₂)(1) x_(α₁+α₂)(±1) ∉ U_(α₂)`. So `U⁺/H_w` is a
  homogeneous space and not a quotient group, and `J_w × H_w → U⁺` is a bijection of
  varieties, not a semidirect product with `H_w` normal. For `w = s₁`, by contrast,
  `H_(s₁) = U_(α₂)U_(α₁+α₂)` is normal with quotient `U_(α₁)`.

### Dependencies

Layers 2–5, 5P, §§3A.1–3A.5 (the pinned orbit theorems and the complex charts) and 7; Tau Ceti's finite root-system API and Weyl Coxeter presentation (supplier contracts); Mathlib's covering-map lifting and
uniqueness lemmas.

## Layer 7a: finite fields, Frobenius and rational points

This layer owns Lang's theorem for the `q`-Frobenius, its quotient and `H¹` consequences,
and the fixed-coset bijection built on the pinned fixed-lift lemma; Layer 9E owns their
extension to Steinberg endomorphisms. Nothing in this layer is imported from a roadmap that consumes this one.

Let `q=p^f`, `k=F̄_q`, and let `G₀` be a connected reductive group scheme of finite type over
`F_q`, with base change `G=G₀×_{F_q}k`. Define the q-power Frobenius `F` on `G` from the
`F_q`-structure: on the coordinate algebra it is the scalar extension of the `q`-power map
on functions of `G₀`, the pinned `TauCeti.FiniteField.geometricFrobeniusBialgHom`, and on
points it is the pinned `TauCeti.FiniteField.frobeniusPoints F_q 1`, post-composition with
`a ↦ a^q`, the two identified by
`TauCeti.FiniteField.baseChangePointsMulEquiv_symm_comp_mapDomain_geometricFrobeniusBialgHom`.
This definition applies to any `F_q`-form of the geometric group; the carrier is not
restricted to the split form. The canonical group equivalence `G^F ≃ G₀(F_q)`, its
compatibility with morphisms and the description of the fixed points of an `F`-stable closed
subgroup scheme are the pinned `TauCeti.FiniteField.rationalPointsMulEquiv`,
`TauCeti.FiniteField.coe_rationalPointsMulEquiv_mapDomain` and
`BialgHom.map_fixedSubgroup_frobeniusPoints_of_surjective`, with
`TauCeti.FiniteField.rationalPointsMulEquivFixedSubgroupGeometricFrobenius` the same equivalence
for the geometric Frobenius on the coordinate algebra, and finiteness of `G^F`, of the
fixed points of every positive iterate `F^n`, and of the rational points of `F`-stable closed
subgroup schemes is the pinned `TauCeti.FiniteField.finite_fixedSubgroup_frobeniusPoints`
(`O(G₀)` of finite type, values in a domain). These are consumed, not restated. Reserve
“split q-Frobenius” for the case that `G₀` is split. State separately the standard
field-Frobenius and Steinberg hypotheses in every result.

Tau Ceti's `TauCeti.Bialgebra.iterateFrobeniusPoints` supplies the iterated prime-power
point map for its `ℤ`-bialgebra carrier, and `TauCeti.Bialgebra.frobeniusFixedPointsMulEquiv`
identifies points fixed by that map with points over the Frobenius-fixed coefficient ring;
for a `ℤ`-model and `q = p^n` the pinned
`TauCeti.FiniteField.baseChangePointsMulEquiv_symm_frobeniusPoints` identifies the
`q^m`-Frobenius with the iterated prime-power map.

**Lang's theorem.** For a smooth geometrically connected affine group scheme `G₀` of finite
type over `F_q`, with `q`-Frobenius `F` on `G = G₀ ×_{F_q} k`, the Lang map `G(k) → G(k)`,
`x ↦ x⁻¹F(x)`, is surjective; so is `x ↦ xF(x)⁻¹`, by composing with inversion. Route: let
`G` act on itself by `(x, g) ↦ g⁻¹xF(g)`; an orbit of minimal dimension is closed (3A.4, the
pinned `TauCeti.SchemeAction.isClosed_orbit_of_forall_mem_orbitClosure`),
its twisted stabilizer is finite, and the dimension-of-fibres theorem gives orbit
 dimension dim G. Indeed, write f(g)=xF(g)x⁻¹, choose m with F^m fixing x, and put
 y=xF(x)⋯F^(m−1)(x). Then f^m=Int(y)F^m; y is fixed by F^m and has finite order r,
 so f^(mr)=F^(mr), whose fixed points are finite. Thus Fix(f) is finite.
 Since G is irreducible, its closed full-dimensional orbit is all of G
(Milne, Theorem 17.96, p. 383, whose Steinberg endomorphisms include the `q`-Frobenius by
Definition 17.95, p. 382). For any algebraically closed extension K of F_q,
base-change this surjective finite-type morphism from F̄_q to K; each nonempty
finite-type fibre over the algebraically closed K has a K-point. Thus the
point-level statement holds over K even when K/F_q is not algebraic; the
finite-order argument above is used only over F̄_q.
`StructureAcceptance.lang_surjective` states this endpoint on the native
finite-type coordinate Hopf algebra H, with smoothness and geometric
connectedness explicit: the Frobenius of a point `g : O(G₀) → K` is the composite `F ∘ g`
with F:K→K, F(a)=a^q and q=Nat.card F_q. This value equation fixes the
Frobenius convention, it specifies the same map as the pinned
`TauCeti.FiniteField.frobeniusPoints F_q 1` by
`TauCeti.FiniteField.frobeniusPoints_apply_apply`, and it imposes no reductivity hypothesis.
Derive the consequences: `H¹(F_q, G₀) = 1` for Galois cohomology
with coefficients in `G₀(k)` (Milne, Corollary 17.98, p. 383); every `F`-stable `G(k)`-torsor has a fixed point; and for an
exact sequence `1 → G' → G → G'' → 1` of smooth groups over `F_q` with `G'` geometrically
connected, `G(F_q) → G''(F_q)` is surjective. *Needs:* the pinned closed orbits of 3A.4; SchemeAndStackFoundations §0.7's dimension-of-fibres
theorem; the pinned finiteness of Frobenius-fixed points
`TauCeti.FiniteField.finite_fixedSubgroup_frobeniusPoints`; Layer 0's points comparison.

**Fixed-coset lifting.** Let `H` be a group, `σ` an automorphism of `H` and `J ≤ H` a
`σ`-stable subgroup, not necessarily normal, on which `x ↦ x⁻¹σ(x)` is surjective. That every
`σ`-stable coset contains a `σ`-fixed element is the pinned
`MonoidHom.exists_fixed_inv_mul_of_surjective_commutatorMap` (supplier contracts), stated for
right cosets `Jn` with `n σ(n)⁻¹ ∈ J` and Mathlib's Lang map `t ↦ t σ(t)⁻¹`; the two Lang maps
have the same image, `x⁻¹σ(x)` being `y σ(y)⁻¹` for `y = x⁻¹`, and inversion carries the left
coset `hJ` to the right coset `Jh⁻¹`. Prove, in the left-coset convention used by Layers 7b–7f,
that every `σ`-stable left coset `hJ` (one with `σ(h) ∈ hJ`) contains a `σ`-fixed element, by
transport along inversion, and that `H^σ/J^σ → (H/J)^σ` is a bijection: if `h, h' ∈ H^σ` with
`h' = hj` then `σ(j) = j`. This abstract argument proves the stated group-level generalization
of Dudas–Michel, Lemma 7.6(i), p. 25; its separate H¹ comparison in (ii) requires normality,
whereas this coset bijection does not. Apply this with `H = G(k)`, `σ = F` and `J = P(k)` for every `F`-stable closed subgroup
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
  maps need not be separable. The q-power convention is the one in x⁻¹F(x). On
  𝔽₂-valued inputs the Lang map of 𝔾_a is identically 0, so surjectivity is a statement
  about geometric points.
- For 𝔾_m over 𝔽₂ and the same θ, θ⁻¹F(θ)=θ, while θF(θ)⁻¹=θ².
  For SL₂ the upper-unitriangular matrix u(θ) gives u(θ)⁻¹F(u(θ))=u(1).
  Thus the convention is checked on multiplicative and noncommutative groups. For 𝔾_m over
  𝔽₃ the Lang map is t↦t², and a square root of −1 in 𝔽₉ maps to −1, which no point of
  𝔾_m(𝔽₃) reaches.
- For 𝔾_a over 𝔽₃ with η²=−1 in 𝔽₉, η³−η=η. For any
  algebraically closed extension K and a∈K, T^q−T−a has degree q≥2
  and a root, including transcendental a; finite order of a is unnecessary.
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

Layers 0 and 3 for the point comparison and subgroup hypotheses; the pinned closed orbits of Layer 3A and SchemeAndStackFoundations §0.7 for
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
- For `P = Q = B`, the formula gives `P ∩ Q = T ⋉ U` with `L∩M = T` and `U∩V = U`; a
  formula omitting the factor `U∩V` would return `T`, of dimension 2 instead of 3 for the
  Borel of `GL₂`. For opposite Borels `P = B⁺`, `Q = B⁻` sharing `T`, `P ∩ Q = T` and all
  unipotent factors are trivial; `W_L = W_M = 1`, so `P\G/Q ≃ W` has two elements, matching
  the two `B⁺`-orbits on `G/B⁻ = ℙ¹`.
- In `GL₃` let `P` stabilize the line `⟨e₁⟩` and `Q` the plane `⟨e₁, e₂⟩`, with Levis
  `L = GL₁ × GL₂` and `M = GL₂ × GL₁` containing the diagonal torus. Then `L∩M = T`, `P∩Q`
  is the upper Borel `B`, and `L∩V`, `M∩U`, `U∩V` are the root groups at the positions
  `(2,3)`, `(1,2)`, `(1,3)`, of total dimension `3 = dim R_u(B)`; dropping `L∩V` leaves
  dimension 5, not 6. The double cosets `W_L\S₃/W_M` with `W_L = ⟨(23)⟩`, `W_M = ⟨(12)⟩`
  have sizes 4 and 2, so `P\G/Q` has two elements: a line lies in a plane or not.
- For `GL₂(𝔽_q)`, `|B^F| = (q − 1)²q = |T^F|·|U^F|`, and the projection `B^F → T^F` has
  kernel `U^F` of order `q`.
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
are consequences where their hypotheses apply. Define (Dudas–Michel, Definition 9.2,
Remark 9.3 and Proposition 9.4(i), pp. 35–36)

    R^G_{L⊂P}(M) = Λ[G^F/U^F] ⊗_{Λ L^F} M
    *R^G_{L⊂P}(N) = Λ[U^F\G^F] ⊗_{Λ G^F} N ≃ N^{U^F}.

The first permutation module is a `(ΛG^F,ΛL^F)`-bimodule; the second is a
`(ΛL^F,ΛG^F)`-bimodule. The actions of `L^F` come from `P^F=L^F⋉U^F`. Prove the displayed
invariant identification using the averaging idempotent
`e_U=|U^F|⁻¹∑_{u∈U^F}u`: the identification is `[U^F g] ⊗ n ↦ e_U·(g·n)`, with inverse
`v ↦ [U^F] ⊗ v`, and the projector `n ↦ e_U·n` is idempotent with image `N^{U^F}` and commutes
with module maps and the `L^F`-action, so the comparison of coinvariants with invariants is
natural, also for modules that are not free. On a morphism `f`, induction sends
`gU^F ⊗ m` to `gU^F ⊗ f(m)` and restriction is `f` on `U^F`-invariant vectors; prove
well-definedness on the balanced tensor relations, functoriality and equivariance. A
`Λ`-basis of `M` of size `d` gives a basis of `R^G_{L⊂P}(M)` of size `[G^F:P^F]d`, one copy of
`M` for each coset of `P^F`, acted on through the section cocycle when `M` is nontrivial.
Prove that rational points of each connected unipotent radical form a finite p-group; hence
`p∈Λˣ` implies `|U^F|∈Λˣ` (Dudas–Michel, proof of Proposition 9.4, p. 36). Restriction is
exact by the averaging comparison, and induction because `Λ[G^F/U^F]` is free as a right
`ΛL^F`-module.

First prove the induction-side adapter, naturally in every left `ΛL^F`-module `M`:

    Λ[G^F/U^F] ⊗_{ΛL^F} M ≃
      Ind_{P^F}^{G^F}(Inf_{L^F}^{P^F} M).

The left side uses the right `L^F`-action on `G^F/U^F`; the right side is ordinary
finite-group induction from `P^F`. Use `P^F=L^F⋉U^F` and the section/cocycle model for
nontrivial `M`. The restriction-side adapter identifying
`Λ[U^F\G^F] ⊗_{ΛG^F} N` with `N^{U^F}` is proved in Layer 7d, where it is first used.

Prove inflation/invariants adjunctions, exactness, and the finite-index biadjunctions

    R^G_{L⊂P} ⊣ *R^G_{L⊂P} ⊣ R^G_{L⊂P}.

(Dudas–Michel, Proposition 9.4(ii)–(iii), p. 36.)
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
- For the finite-group adapter `1 ⊂ C₂` with `U = 1` and `Λ = ℤ`, induction of the trivial line
  is `ℤ²` and the nonidentity element acts by `[[0,1],[1,0]]`, of trace 0, whereas two trivial
  lines give trace 2. For `GL₂(𝔽₂) = S₃` with `P^F = U^F = C₂`, `L^F = 1` and `Λ = ℤ[1/2]`,
  induction of `Λ` has rank 3 and a transposition, fixing one coset and exchanging two, has
  trace 1, not 3.
- For `U^F = 1` and `Λ = ℚ`, restriction on `N = Λ²` has projector `I₂` and rank 2: it does
  not take `G^F`-invariants. For `GL₂(𝔽₂)`, `U^F = C₂` and the regular module `Λ[S₃]` over
  `ℤ[1/2]`, averaging pairs the six basis vectors into three `U^F`-orbits, the invariants have
  rank 3, and `[U^F] ⊗ 1 ↦ (1 + u)/2`, which the inverse sends back to `[U^F] ⊗ 1`, not to
  twice it.
- On the sign representation of `S₃` over `ℤ[1/2]` the nontrivial element of `U^F = C₂` acts
  by `−1`, so `e_U` acts by 0 and restriction is zero; on the trivial line restriction has
  rank 1.
- Over `𝔽₂` the augmentation `𝔽₂[C₂] → 𝔽₂` is surjective but sends the invariant vector
  `1 + u` to 0, so invariants are not exact when `p` is not invertible.
- Over the zero coefficient ring every module is zero and both functors and all averaging
  maps are zero; the basis-size statements assert the specified indexed bases, not
  uniqueness of rank over this ring.

### Dependencies

Layers 7a–7b; Mathlib's induction and coinduction adjunctions; Tau Ceti's finite-dimensional
induction.

## Layer 7d: rational transport and the specialized Mackey theorem

For `F`-stable Levis `L,M` in `F`-stable parabolics `P,Q`, define `ad_x(V)` for an `M`-module as the `xMx⁻¹`-module with action
`(xmx⁻¹)·v := m·v`; use this direction throughout. Define

    S(L,M) = {x∈G | L∩xMx⁻¹ contains a maximal torus of G}.

Conjugation transport keeps the underlying `Λ`-module and linear maps, has inverse transport by
`x⁻¹`, and transport by `x` followed by `y` is transport by `yx`. Prove that `S(L,M)` is stable
under left multiplication by `L` and right multiplication by `M`, that inversion identifies it
with `S(M,L)`, that `S(T,T) = N_G(T)` for a maximal torus `T`, and that `S(G,M) = G`.

Prove the geometric transporter equivalence `L\S(L,M)/M ≃ P\G/Q` and the rational
bijection

    L^F\S(L,M)^F/M^F ≃ P^F\G^F/Q^F,

both induced by the inclusion of `S(L,M)` into `G` (Dudas–Michel, Lemma 9.10, pp. 38–39).

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
- For `G = T = 𝔾_m` and `L = M = T`, `S(T,T) = T` and `T\S(T,T)/T` has one element. For
  `G = GL₂`, `L = G` and `M = T`, `S(G,T) = G` and `G\S(G,T)/T` has one element; restricting
  the transporter to `N_G(T)` would wrongly exclude `u = [[1,1],[0,1]]`.
- At `x = 1` a complex character of `C₃` with value `ζ` on a generator, `ζ` a primitive cube
  root of unity, still has value `ζ`: transport does not dualize. In `S₃` with
  `M = ⟨(123)⟩` and `x = (12)`, a character with value `ζ` at `(123)` transports to one with
  value `ζ` at `(132)`, hence `ζ⁻¹` at `(123)`; the unchanged character is the wrong model.
- In `GL₃` over `ℂ` with `M` diagonal and `x` the permutation matrix with `xe₁ = e₂`,
  `xe₂ = e₃`, `xe₃ = e₁`, so that `x·diag(a,b,c)·x⁻¹ = diag(c,a,b)`, the character
  `diag(a,b,c) ↦ a` transports to `diag(a,b,c) ↦ b`, of value 3 at `diag(2,3,5)`. Pulling back
  by `x` instead of `x⁻¹` would give `c = 5`, as would the transposed matrix with the correct
  direction, so the matrix convention is part of the Check. Transporting twice by `x` gives
  `c`, three times `a`.

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
- In GL₂(𝔽₃), put w=[[0,1],[1,0]] and t=diag(2,1). The left-G-equivariant
  map gU⁺↦gw⁻¹U⁻ intertwines right t with right wtw⁻¹=diag(1,2),
  as in the twisted conjugation comparison above: both give twU⁻ at g=1.
  Without that twist the cosets twU⁻ and wtU⁻ have second columns (2,0)
  and (1,0), hence differ. With the identity identification of T, common-Levi
  independence instead uses this section's averaging intertwiner.
- For `P = Q`, `e_U = e_V`, so `t = z_U = s = e_U` and the bimodule isomorphism is the
  identity of `Λ[G^F]e_U`.
- For `GL₂(𝔽₂) ≅ S₃` with `U = ⟨(12)⟩`, `V = ⟨(13)⟩` and `L^F = T^F = 1` over `ℤ[1/2]`, the
  corner `e_U·ℚ[S₃]·e_U` has dimension 2, the number of double cosets `U\S₃/U` (of sizes 2
  and 4). On the trivial summand `z_U = 1`; on the two-dimensional irreducible, where `e_U`
  and `e_V` project onto the fixed lines of two reflections at angle `π/3`, `z_U = e_Ue_Ve_U`
  acts on the image of `e_U` by `cos²(π/3) = 1/4`. So `z_U` is a unit with inverse `(1, 4)` on
  the two summands, the only denominator being `2²`, and `s = e_Ve_Uz_U⁻¹` satisfies
  `ts = e_U` and `st = e_V`. Over `ℤ` the idempotent `e_U` does not exist.
- The betweenness identity needs its hypothesis. With unit vectors `u, v, w` spanning the
  fixed lines of the three reflections of `S₃`, with pairwise inner products `−1/2`, `e_Ue_V`
  acts on the two-dimensional irreducible as `−1/2` times the rank-one map `|u⟩⟨v|`, while for
  `W = ⟨(23)⟩`, where `W∩U = W∩V = 1`, `e_Ue_We_V` is `1/4` times that map: the identity fails
  because `W ≠ (W∩U)(W∩V)`. For `W = U` it holds trivially.
- In `GL₃` the proper Levi `GL₁ × GL₂` has semisimple rank 1 and the torus 0, against 2 for
  `GL₃`; `L = G` is the case handled directly.
- The rational witness is needed: the nonsplit maximal torus `T'` of `GL₂` with
  `T'^F = 𝔽_(q²)ˣ` is geometrically conjugate to `T` but is the Levi of no `F`-stable
  parabolic, and `|T'^F| = q² − 1` differs from `|T^F| = (q − 1)²`, so no `g ∈ G^F`
  conjugates one to the other.

### Dependencies

Layers 7a–7d.

## Layer 7f: trivial-module specialization and Gassmann interface

For the trivial `L^F`-module, inflation is trivial and Harish–Chandra induction is the
permutation representation on left cosets `G^F/P^F`. Layer 7e therefore gives isomorphic
complex permutation representations for common-Levi parabolics. Build the comparison as a
`Representation.Equiv` between the two permutation representations, using the Layer 7c
`Ind∘Inf` adapter and the pinned `TauCeti.indTrivialEquiv`
(`RepresentationTheory/Induction/Permutation.lean`), which identifies the induced trivial
representation with the permutation representation on left cosets; its `Rep`-category form
`TauCeti.indTrivialIso` is Mathlib's `Rep.mkIso` of it. Under `[Finite G^F]` and a field `k` with
`[CharZero k]`, consume the pinned `TauCeti.almostConjugate_iff_nonempty_equiv_ofMulAction`
(`RepresentationTheory/CharacterTable/FixedPointCount.lean`) to obtain
`(P^F).AlmostConjugate (Q^F)` in `G^F`, for the pinned predicate `Subgroup.AlmostConjugate`
(`GroupTheory/AlmostConjugate.lean`): the two subgroups meet every conjugacy class in the same
number of elements. The criterion rests on the pinned fixed-coset identity
`Subgroup.natCard_fixedBy_mul_natCard` (`GroupTheory/QuotientGroup/Basic.lean`): for a subgroup
`H` of a group `G` and `g ∈ G`, the number of cosets in `G ⧸ H` fixed by `g`, times `|H|`, is
`|C_G(g)|` times the number of elements of `H` conjugate to `g`, with no finiteness hypothesis
under the convention that `Nat.card` of an infinite type is zero. The subgroup form with induced
trivial representations is the pinned
`TauCeti.nonempty_equiv_ind_trivial_iff_forall_natCard_fixedBy_eq`. This layer owns only the
Harish–Chandra-to-permutation adapter and the finite-reductive application.
*Needs:* Layers 7c and 7e; Tau Ceti's `TauCeti.indTrivialEquiv`,
`TauCeti.almostConjugate_iff_nonempty_equiv_ofMulAction` and `Subgroup.AlmostConjugate`.

### Examples

**Checks.**
- For `S₃`, `H = ⟨(12)⟩` and `g = (12)`: `g` fixes exactly one of the three cosets of `H`
  (it swaps `(13)H` and `(23)H`), so the left side is `1 · 2 = 2`; the right side is
  `|C_G(g)| · |g^G ∩ H| = 2 · 1 = 2`.
- For `g = 1` the identity reads `|G/H| · |H| = |G| · 1`. For a 3-cycle in `S₃` with
  `H = ⟨(12)⟩` both sides are `0 · 2 = 3 · 0`. Replacing `|C_G(g)|` by the class size `|g^G|`
  gives `3 · 1 = 3 ≠ 2` at a transposition.
- The trivial-module adapter identifies `Λ[G^F/U^F] ⊗_{ΛL^F} Λ` with `Λ[G^F/P^F]`: for
  `GL₂(𝔽₂)` and its upper Borel this has rank 3, agreeing with the Layer 7c induction Check,
  and for `P = G` it has rank 1. For `H = G`, `G/G` is a point, both permutation
  representations are the trivial line, and the conversion between `TauCeti.indTrivialIso`
  and `TauCeti.indTrivialEquiv` is the identity of a one-dimensional space.
- `GL₃(F_2)`, of order `168`, has the two index-seven subgroups `P^F` and `Q^F` of the
  worked example, of order `24` each; they are not conjugate but have the same permutation
  character, the classical smallest instance of nonconjugate almost-conjugate subgroups.

### Dependencies

Layers 7c and 7e; Tau Ceti's permutation-representation and almost-conjugacy declarations
(`RepresentationTheory/Induction/Permutation.lean`,
`RepresentationTheory/CharacterTable/FixedPointCount.lean`, `GroupTheory/AlmostConjugate.lean`)
and the line and hyperplane stabilizers of
`LinearAlgebra/Matrix/GeneralLinearGroup/LineHyperplane.lean`.

#### Worked example: `GL₃` over every finite field

For every `q`, let `P` stabilize the line `⟨e₁⟩`, `Q` stabilize the plane `⟨e₂,e₃⟩`, and
`L=diag(GL₁,GL₂)`. Both parabolics are F-stable with common Levi `L`, so Layer 7e gives
isomorphic complex permutation modules. They are not conjugate as finite subgroups:
every conjugate of `P` preserves a line, whereas `Q` has no common invariant line. A line
inside `⟨e₂,e₃⟩` is moved by `GL₂(F_q)`, including `q=2`; a line outside that plane is
moved by a lower-block unipotent. Both facts about the finite groups are pinned at `n = Fin 3`
and coordinate index `0`: `TauCeti.almostConjugate_lineStabilizer_hyperplaneStabilizer` (over a
finite field) and `TauCeti.conj_smul_lineStabilizer_ne_hyperplaneStabilizer` (for at least
three coordinates), for `TauCeti.lineStabilizer` and `TauCeti.hyperplaneStabilizer` in
`LinearAlgebra/Matrix/GeneralLinearGroup/LineHyperplane.lean`. What this example tests is that
the Layer 7e isomorphism, through this layer's adapter, reproduces the pinned almost-conjugacy;
it does not replace the general theorem.

#### References for Layers 7a–7f and 9E

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
not existence for a given root datum (Conrad, Definition 5.1.1, p. 136). The torus is the
pinned `TauCeti.SplitMaximalTorus`, with its transport `TauCeti.SplitMaximalTorus.comapOfIso`
and base change `TauCeti.SplitMaximalTorus.baseChange`; the constancy of roots and coroots and
the freeness of the root spaces are the conditions this section adds to it.

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
- Over a base with a non-free invertible module L, GL(R⊕L) contains the split torus
  𝔾_m×𝔾_m of the two summands, but its root spaces are L and its dual, which are not free; a
  split fibrewise maximal torus alone therefore does not make split data.

### 8.2 Pinnings

A pinning of split data is a positive system in the constant root datum, its associated
Borel containing T, and a generator of each simple-root line; equivalently use the corresponding normalized simple-root
parameterizations. Transport these data under isomorphism and base change (Conrad,
Definition 6.1.1 and Remark 6.1.2, pp. 186–187). Existence and classification are Layer 9D's targets.
Over a connected affine base the pinning is the pinned `TauCeti.Pinning`, whose Borel is a
`TauCeti.HopfIdeal.IsBorelOver` ideal and whose simple roots are read off from the torus and the
Borel, and transport along an isomorphism is `TauCeti.Pinning.comapOfIso`, with
`TauCeti.Pinning.comapOfIso_rootVector` for the root vectors; these are consumed. The targets
here are the comparison of that index set with the simple roots of the positive system of the
split datum of §8.1, pinnings over a disconnected base, where the positive system is constant
and `TauCeti.Pinning` does not apply, base change of a pinning along a ring map, and the
equivalence with normalized simple-root parameterizations.

**API.**
- A pinned isomorphism preserves the torus, Borel and every labelled simple-root parameter; over
  a connected base this is `TauCeti.Pinning.comapOfIso` with its root-vector formula, and over a
  disconnected base it is a target of this section.
- Base change takes each chosen root-line generator to the corresponding generator.
- Changing generators rescales the parameters; their labels and scalars are retained.

**Checks.**
- For SL₂, x_α(t)=[[1,t],[0,1]] has tangent E₁₂; over ℤ/4 it still has tangent E₁₂.
- Over ℚ, x_α(2t) has tangent 2E₁₂ and gives a different pinning.
- Over 𝔽₂, twice a root-line generator is 0: the parameterization x_α(2t), a pinning over ℚ,
  reduces to the constant map and is not a pinning in characteristic 2.
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
relative reductivity predicate; Tau Ceti's Cartan–Killing classification and numbered root data (supplier contracts).

## Layer 9: pinned Chevalley–Demazure group schemes over `ℤ`

This lane is the exception to the standing "work over a field `k`" hypothesis: its whole
point is a group scheme over `ℤ` that is then base-changed. It is narrower than the relative
theory of Layer 9D because it constructs the split case over `ℤ`. This construction serves a
specific prerequisite rather than generalizing the relative theory, and it must not wait
behind pseudo-reductive groups.

Finite groups of Lie type are the fixed points of a Steinberg endomorphism on the
`𝔽̄_p`-points of a pinned simply connected group, or on an explicit carrier identified with
those points; Chevalley existence alone specifies no carrier, so this layer constructs the
pinned group schemes and, in 9B, identifies with them the explicit carriers and special
isogenies that Tau Ceti pins (supplier contracts).
The root data start from the native `TauCeti.DynkinType.simplyConnectedRootDatum` of the
supplier contracts. Layer 9E supplies the Steinberg
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
   The full reductive Chevalley frame is the following specified data: the finite reduced
   crystallographic root pairing, a ℤ-basis `(y_j)` of the full Y with the toral map `y↦H_y`,
   and the root vectors `e_α`, which together form a basis of the rational Lie algebra indexed by
   toral and root directions. Its equations are `[H_y,H_z]=0`, the root-weight and opposite-root
   equations above, `[e_α,e_β]=±(p+1)e_(α+β)` with pinned signs when `α+β∈Φ`, where p is the
   largest integer with `β−pα∈Φ`, and `[e_α,e_β]=0` when `α+β∉Φ∪{0}`. The frame is data
   satisfying these equations, not a hypothesis asserting the integral PBW theorem of item 3.

   **Checks.**
   - With no roots and `Y=0` the Lie algebra is zero and the frame basis is empty. With no roots
     and `Y=ℤ` it is the one-dimensional abelian algebra on one toral vector; discarding the
     central toral direction would give the wrong dimension 0.
   - In A₁, `[e,f]=h` and `[h,e]=2e`; the assignment `e=f=0` with `h≠0` violates both the
     basis requirement and the opposite-root equation, which would read `0=h`.

   **9A.1a. Signed ADE lattice presentation and its integral comparison.**
   For a finite, possibly disconnected or empty, ADE diagram with a specified order on its
   vertices, with simple-root lattice `Q=⊕_i ℤ α_i` and Gram pairing `B` (diagonal 2,
   off-diagonal minus the number of bonds), the signed construction is pinned and consumed
   (supplier contracts, *Native signed ADE Lie algebras and explicit carriers*): the Gram lattice
   `(Q,B)` as an integral lattice in `ℚ⊗Q` through the integral-lattice dictionary
   `TauCeti.IntegralLattice.ofIntegralForm`,
   `TauCeti.IntegralLattice.ofIntegralForm.carrierIsometry`,
   `TauCeti.IntegralLattice.integralForm` and `TauCeti.IntegralLattice.rationalizationIsometry`;
   the norm-two shell `Φ={a∈Q:B(a,a)=2}` with its height induction
   (`Matrix.PosDef.normTwoShell_nonneg_induction`), the criterion that `a+b∈Φ` iff `B(a,b)=−1`
   for `a,b∈Φ` (`Matrix.IsSymm.add_mem_normTwoShell_iff`), and its identification with the roots
   of the numbered realization `TauCeti.DynkinType.simplyConnectedRootDatum`
   (`TauCeti.DynkinType.norm_rootLattice_eq_two_iff`); the ordered sign cover `Matrix.SignCover`
   of `Q` by `ℤˣ`, with the cocycle `ε(a,b)=(−1)^(Σ_(i>j) bond(i,j)a_i b_j)`, the central sign
   `Matrix.SignCover.tau`, the commutator formula `Matrix.commutatorElement_signCover` and its
   `GroupExtension` packaging, the inverse lift `(a,1)⁻¹=ε(a,a)(−a,1)`
   (`Matrix.SignCover.inv_canonicalSection`), and the criterion that the section `u_a=(a,1)` is a
   homomorphism exactly when the diagram has no bonds
   (`Matrix.forall_canonicalSection_signFactorSet_mul_iff_of_isSimplyLaced`); the change of order
   on the cover, `Matrix.SignCover.reindex`, by the inversion sign `σ(a)` over the bonds whose
   relative order changes, with `ε(a,b)σ(a+b)=ε′(a,b)σ(a)σ(b)`
   (`Matrix.negOnePow_orderedSignForm_mul_inversionSign_add`); the signed Lie ring
   `Matrix.ShellLieAlgebra` on `Q⊕(Φ→₀ℤ)` with
   `[x_a,x_b]=ε(a,b)x_(a+b)` when `a+b∈Φ` and `[x_a,x_(−a)]=ε(a,−a)H_a`, its Jacobi identity over
   ℤ (`Matrix.ShellLieAlgebra.lie_jacobi`), its Serre relations and the surjection
   `Matrix.ShellLieAlgebra.serreLift_surjective` from the Serre presentation over ℤ; the
   inverse-lift normalization `Matrix.ShellLieAlgebra.normalizedBasis`, a Chevalley basis with
   structure constants ±1 and `[e_a,e_(−a)]=H_a`; the Cartan subalgebra
   `Matrix.ShellLieAlgebra.cartanSubalgebra` over a ring in which 2 is regular; the relabelling
   `Matrix.ShellLieAlgebra.reindexLieEquiv` for a change of order or a diagram automorphism; the
   lift `Matrix.SignCover.map` of every lattice isometry to the sign cover by its quadratic
   coboundary, and the Lie isomorphism `Matrix.ShellLieAlgebra.coverLieEquiv` of a compatible
   lift; the full-Cartan algebra `Matrix.FullShellLieAlgebra` with Cartan part a cocharacter
   group `Y`; and the type-A comparison `TauCeti.typeAShellLieEquiv` with
   `sl (Fin (r + 1)) ℤ`. None of these is restated here.

   The targets are the comparisons the library does not state. Over a field `K` of
   characteristic zero, prove that `TauCeti.serreLift` onto `K ⊗ Matrix.ShellLieAlgebra B` is an
   isomorphism, by the split-field presentation/injectivity comparison of
   [LieHighestWeight Layer 7](../RepresentationTheory/LieHighestWeight/README.md), preserving its
   Cartan-matrix orientation; compute the Killing form on the Cartan as
   `Σ_(a∈Φ)B(h,a)B(k,a)` and prove it nondegenerate, and by invariance prove the nonzero pairing
   of opposite root spaces, assembling components. Compare with
   Frenkel–Kac, §2.3, equations (2.3)–(2.6) and Proposition 2.2, pp. 40–41: with the transpose of
   ε and a normalized sign function c with `c(a)c(−a)=ε(a,−a)`, the basis map sends `x_a` to
   `c(a)E_a`; the integral, disconnected and empty statements go beyond that source's complex
   simple case.

   Two descriptions of the cover are also targets. First, the presentation of
   `Matrix.SignCover` by the ordered simple lifts and the central τ of order 2 with their bond
   commutators, proved through unique normal words; a simple lift satisfies no square relation.
   Second, the lifted-generator form of the bracket: on the quotient of the free ℤ-module on the
   inverse image `Φ̂` of Φ by `[τe]+[e]=0`, with its section-basis equivalence to `Φ→₀ℤ`, the
   bracket of lifts e and f over roots a and b with `a+b∈Φ` is the vector indexed by the group
   product `ef`, and for `b=−a` it is `H_(πe)` if `ef=1` and `−H_(πe)` if `ef=τ`. In particular an
   arbitrary negative-root section is not an inverse lift.

   Compare **integrally** with 9A.1's pinned Chevalley lattice by explicit unit-sign
   root-basis maps and inverse maps. For each positive nonsimple root, subtract a suitable simple
   root and track the resulting bracket word, whose ADE root-string coefficient is a unit ±1.
   Prove word/choice consistency and identify the Cartan and all root basis images. A rational
   equivalence alone does not establish an integral equivalence. The simply-laced isometry
   `Q→Q∨`, `α_i↦h_i`, identifies the Cartan lattice of the shell algebra with the coroot lattice,
   not with X or the full Y. With the actual root/coroot maps
   into a general reductive datum, use `Matrix.FullShellLieAlgebra` on the full Y, with
   `[H_y,x_a]=⟨a,y⟩x_a` and the normalized opposite bracket `H_(a∨)`, and prove the comparison
   with the actual full-Y frame and its unit basis inverse for all diagrams. Do not assume an
   integral center/derived splitting. Base change these identities and the basis to every
   commutative ring, with root-free data giving the full abelian toral algebra; simplicity in bad
   characteristic is a separate assertion. The 9B group and 9C distribution comparisons consume
   this construction and are not premises for its Lie laws.
   *Needs:* the pinned signed shell construction (supplier contracts); LieHighestWeight Layer 7;
   9A.1's Chevalley lattice.

   **Checks.**
   - For A2 ordered `α₁<α₂`, `ε(α₁+α₂,−α₁−α₂)=−1`, so under the type-A comparison
     `x_(α₁+α₂)↦E₁₃` but `x_(−α₁−α₂)↦−E₃₁`; a comparison that sent every section vector
     `x_(−a)` to `E_(q,p)` without sign would fail to preserve `[x_a,x_(−a)]`.
   - In the same A2 order `ε(a,b)=(−1)^(a₂b₁)`, so `ε(α₁,α₂)=1`, `ε(α₂,α₁)=−1` and
     `[x_(α₁),x_(α₂)]=x_(α₁+α₂)=−[x_(α₂),x_(α₁)]`, which under `x_(α₁)↦E₁₂`, `x_(α₂)↦E₂₃` is
     `[E₁₂,E₂₃]=E₁₃`. The inverse lift `(α₁+α₂,1)⁻¹=(−α₁−α₂,−1)` is τ times the section
     `u_(−α₁−α₂)`, and `[x_(−α₂),x_(−α₁)]=−x_(−α₁−α₂)↦E₃₁` agrees with `[E₃₂,E₂₁]=E₃₁`.
   - In A2, `u_(α₁)u_(α₂)=(α₁+α₂,1)` and `u_(α₂)u_(α₁)=(α₁+α₂,−1)`, so their commutator is
     `τ=τ^(B(α₁,α₂))`. In A₁ and A₁×A₁ there are no bonds, `ε≡1`, the cover is the direct
     product `Q×ℤˣ` and the section is a homomorphism; for the empty diagram the cover is `ℤˣ`.
   - Jacobi with `b=−a`: for `a=α₁`, `c=α₂` in A2 the terms `[x_(α₁),[x_(−α₁),x_(α₂)]]`,
     `[x_(−α₁),[x_(α₂),x_(α₁)]]` and `[x_(α₂),[x_(α₁),x_(−α₁)]]` are `0`, `−x_(α₂)` and
     `x_(α₂)`: `α₂−α₁∉Φ`; `ε(α₂,α₁)=−1` and `ε(−α₁,α₁+α₂)=1`; and
     `[x_(α₂),H_(α₁)]=−B(α₁,α₂)x_(α₂)`.
   - Change of order: reversing A2 gives `ε′(a,b)=(−1)^(a₁b₂)` and `σ(a)=(−1)^(a₁a₂)`, and at
     `(α₁,α₂)` both `ε′/ε` and `σ(α₁)σ(α₂)/σ(α₁+α₂)` equal −1. Reversing A₃ gives
     `ε(α₁,α₃)=ε′(α₁,α₃)=1` and `σ(α₁+α₃)=1`; counting the non-bond pair `{1,3}` in σ would
     predict the ratio −1, which is wrong.
   - In A2, `α₁+α₂` has norm `2+2−2=2` and is a root, while `α₁−α₂` has norm 6 and is not;
     `B(α₁,α₂)=−1` with `α₁+α₂∈Φ`, and `B(α₁,−α₂)=1` with `α₁−α₂∉Φ`.
   - For A₁, `Φ={±α}`, the Cartan Killing pairing is `Σ_(a∈Φ)B(α,a)²=8` on `H_α`, nonzero, and the
     integral comparison is the identity on the frame `H_α, x_α, x_(−α)`.
   - For the empty diagram the shell algebra is zero; with a root-free datum of rank `r` the
     full-Y algebra is the abelian algebra `Y`, not zero, and the comparison sends it to the toral
     algebra of 9A.1.

   **9A.1a-L. The group of all kernel-fixing ADE cover lifts.**
   On the ordered cover of 9A.1a, let A be `TauCeti.BilinForm.isometryGroup` of the integral
   lattice form. Pinned and consumed (supplier contracts): the faithful permutation action of the
   isometries on the norm-two shell (`Matrix.normTwoShellPermHom_injective`) and finiteness of the
   isometry group for positive definite B with diagonal 2
   (`Matrix.PosDef.finite_orthogonalGroup_of_diagonal_eq_two`); the lift of every isometry g to a
   kernel-fixing cover homomorphism over g by its quadratic coboundary (`Matrix.SignCover.map`);
   the section signs `s_φ(a)`, defined by `φ(u_a)=ι(s_φ(a))u_(ga)` for the section `u_a=(a,1)`,
   their coboundary identity and functoriality, and the character property over the identity
   (`Matrix.SignCover.sectionSign_add_of_right_eq`); and the Lie isomorphism
   `H_h↦H_(gh)`, `x_a↦s_φ(a)x_(ga)` of a compatible pair (`Matrix.ShellLieAlgebra.coverLieEquiv`),
   functorial and faithful over ℤ (`Matrix.ShellLieAlgebra.coverEquiv_eq_refl_iff`).

   The target is the group of **all** compatible lifts, not one selected lift per isometry:
   construct the subgroup of `MulAut(Cover) × A` of pairs `(φ,g)` with `φ∘ι=ι` and `π∘φ=g∘π`,
   with closure, inverse and identity by these equations, its projection to A, surjective by the
   pinned lift, and its kernel, the character group `Hom(Q,{±1})` acting by `(a,s)↦(a,sχ(a))`,
   packaged as a native `GroupExtension` (`Mathlib/GroupTheory/GroupExtension/Defs.lean`) with
   both inverse maps and all evaluation equations. Export the action on the cover with its values
   on simple lifts, section values, τ, products, inverses and root fibres, and the conjugation of
   the lift group under the changes of order of 9A.1a. For a general central extension first project
   onto the subgroup of liftable automorphisms; only the pinned ADE coboundary lift makes that
   subgroup all of A. Normalized set sections differ by arbitrary normalized sign functions,
   whereas two homomorphic cover lifts of the same g differ by a character; do not conflate these.
   Kernel characters fix the Cartan and multiply each root line by χ(a). Transport the
   inverse-lift normalization of `Matrix.ShellLieAlgebra.normalizedBasis` through each lift
   rather than reading it off negative-section labels, and construct the scalar-extension actions
   with their comparison diagrams; characteristic 2 can collapse sign characters, so
   faithfulness is not asserted after every base change. State
   composition through native Lie-equivalence composition or explicit action equations, without
   assuming a `Group` instance on endomorphism `LieEquiv`s.

   The kernel step holds for every central extension `1→ℤˣ→E→Q→1`, with injection ι and
   projection π, and every group A acting on Q. The pairs `(φ,a)` of an automorphism φ of E and
   an element a of A with `φ∘ι=ι` and `π∘φ=a∘π` form a subgroup of native `MulAut E × A`; its
   projection to A is a homomorphism whose image is the liftable elements of A; and its kernel
   (native `MonoidHom.ker`) is equivalent as a group to `Hom(Q,ℤˣ)`. A character χ acts by
   `e↦ι(χ(π(e)))e`, and a kernel lift f goes to the unique χ with `ι(χ(π(e)))=f(e)e⁻¹`, which
   does not depend on the lift e of `π(e)` because f fixes ι. Centrality is needed for the twist
   to be multiplicative. The equivalence is multiplicative and sends identity and inverse
   characters to identity and inverse twists, and an isomorphism of central extensions (native
   `GroupExtension.Equiv`) transports the subgroup and its projection and intertwines the
   character equivalences. The ADE statement above is this step on `Matrix.SignCover`, with
   surjectivity onto A from the pinned coboundary lift.

   **Checks.**
   - On `ℤˣ×ℤ` the character `χ(n)=(−1)ⁿ` sends `(s,n)` to `(s(−1)ⁿ,n)`, so `(1,1)↦(−1,1)`, while
     the trivial character fixes `(1,1)`; both project to the identity action on ℤ.
   - For the quaternion cover `Q₈→C₂×C₂`, the character negative on i and positive on j gives
     `i↦−i`, `j↦j` and `ij↦−ij`, respecting the noncommutative product.
   - For `Q=1` the character group and the projection kernel each have one element; allowing
     automorphisms that move kernel elements would be a different construction.

   After 9A.1b, compare its pinned **based** diagram lift with this full lift group
   and its simple-generator equations. The Weyl/based factorization g=w∘d of a root
   automorphism, with w in W and d preserving the specified base, is RootSystems
   §5.1's, applied to the integral ADE realization of §9A.1a over ℤ through the
   identification of A with the root automorphisms of the norm-two shell; RootSystems
   §5.2 identifies the based factors d with 9A.1b's diagram automorphisms γ. This
   roadmap adds only the lift: compare each lift of g with the product of a lift of w
   and the pinned 9A.1b lift of d, retaining the character ambiguity and any
   multiplication defect of separately chosen lifts. This comparison does not split the
   cover-lift projection, and a lift of the identity root automorphism can still act by a
   nontrivial character. Both w and d preserve the root lattice. For a specified compatible
   automorphism of the full integral datum, transport the root-line action through the
   product w∘d and the toral action through its actual Y map, define the Y action of d from
   that map and the integral Weyl action of w, and compare these maps under change of base;
   a real action on the root span alone does not choose an action on a central integral
   summand.
   *Needs:* RootSystems §§5.1–5.2; Mathlib `RootPairing.Aut` and `RootPairing.weylGroup`;
   §9A.1a's root-shell/lattice identification, and §9A.1b only for the pinned based lift
   comparison; for the kernel step, Mathlib `GroupExtension`, `GroupExtension.Equiv`,
   `MulAut` and `MonoidHom.ker`.
   **Checks.** The factorizations themselves are RootSystems §5.1's checks. In A₁ the
   lift group has order 4=|A|·2: over g=−1 the two lifts send u_α to u_(−α) and to
   ι(−1)u_(−α), and their ratio is the nontrivial character of ℤα. In A₂, where
   −1=w₀∘flip, the lifts of −1 form one coset of the kernel, of order 2²=4; the
   product of any lift of w₀ with the pinned lift of the flip lies in it, and changing
   the lift of w₀ changes that product by a character. In rank 0 the lift group, A and
   the character kernel are trivial. The nontrivial A₁ character fixes the Cartan line
   and multiplies both root lines by −1, so forgetting the lift loses information. In A₂
   the base reversal δ satisfies δs₁δ⁻¹=s₂, so the product of the pinned lift of δ with a
   lift of s₁ lies over s₂δ, not s₁δ. For A₁ with one central direction in Y, the
   extensions of a root automorphism that fix or negate that direction have the same root
   action but send the central toral vector to itself and to its negative; only the
   specified full-Y map distinguishes them. Export transport
   under every specified order/section and full-Y comparison. Full-Y maps
   require the actual compatible Y action; no integral central splitting is
   inferred. Include empty/reducible ADE, rank 1, A2's negative-section test,
   component permutations and D4 triality. This signed ADE extension, a
   compact finite Tits lift, `N_K(T)→W`, and a topological covering group have
   different bases/kernels. None is identified with another by a “double
   cover” label, and no VOA or compact normalizer section is a premise here.

   Finiteness of the isometry group is pinned; prove finiteness of the lift group from that
   image and its finite character kernel. The kernel has order `2^rank(Q)`; this counts
   characters of the actual free root lattice, not arbitrary sign functions.

   **9A.1b. Pinned fixed Lie algebras and signed ADE folding.**
   Starting from 9A.1a, construct the fixed Lie algebra of each finite ADE diagram
   automorphism, its split characteristic-zero root system and its normalized folded
   presentation. Include disconnected and empty diagrams and a compatible action on the full
   reductive datum. Keep the integral fixed lattice, its scalar extension, and a normalized folded
   Chevalley lattice distinct. This construction is algebraic and precedes 9B's group comparison.

   **Pinned action and actual fixed carrier.** For the ordered diagram `(Q,B,o)` of 9A.1a and a
   permutation γ of the simple vertices preserving B, the pinned action is the relabelling
   `Matrix.ShellLieAlgebra.reindexLieEquiv`, `H_h↦H_(γh)` and `x_a↦s_γ(a)x_(γa)` with the
   inversion sign `s_γ(a)=(−1)^(Σ_{{i,j} a bond, i<j, γi>γj} a_i a_j)`, which fixes the simple
   pinning; its exact order equals that of γ (`Matrix.ShellLieAlgebra.orderOf_reindex`), whereas
   an arbitrary kernel-fixing lift need not have this order. On the cover the action is
   `Matrix.SignCover.reindex`, `(a,t)↦(γa,t s_γ(a))`, by the coboundary identity
   `ε(a,b)s_γ(a+b)=s_γ(a)s_γ(b)ε(γa,γb)`; it fixes τ, sends each simple lift to the simple lift
   over its image, and has the order of γ (`Matrix.SignCover.orderOf_reindex`). These are pinned
   and consumed (supplier contracts).

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
   hypotheses, and prove equivariance of the actual 9A.1a comparison maps.
   Do not replace these implemented automorphisms by privately assumed copies.

   When consuming native `DynkinType.diagramAut`, display both lattice maps:
   its weight map forwards roots by γ but its coweight map is the transpose
   map, carrying coroot indices backwards. The geometric forward action on Y
   is the inverse of that coweight map. Prove the literal root, coroot and
   pairing equations before using it in the full-Y construction. Check D4
   triality, where γ and γ⁻¹ differ, as well as involutions. Native Geck module
   and group pinning providers are comparison inputs with their actual lattice
   and carrier hypotheses; their existence does not compute a fixed Lie algebra.

   **Signed orbit modules and brackets.** The integral fixed module of the pinned action is
   pinned: on each root cycle `a,γa,...,γ^(l−1)a` the coefficients are `c_0=1`,
   `c_(r+1)=c_r s_γ(γ^r a)` with monodromy `μ=c_l∈{±1}`; the fixed coefficients of one cycle
   over a commutative ring A are A for `μ=1` and A[2] for `μ=−1`
   (`TauCeti.WeightedCycle.fixedEquivTorsion`); the orbit sums of simple vertices and the signed
   sums over root cycles of monodromy 1 form an integral basis of the fixed submodule
   (`Matrix.ShellLieAlgebra.fixedBasis`); and the fixed Cartan vectors have centralizer exactly
   the fixed Cartan (`Matrix.ShellLieAlgebra.exists_fixed_cartan_eq_iff`). The target is the fixed
   bracket in this basis: restrict the ambient bracket and expand its finite signed sums,
   including the opposite-root Cartan cases, and give the change-of-representative maps.

   For a permutation orbit of connected components, choose one component and
   construct its return automorphism, restriction and diagonal-transport inverse;
   prove their Lie and pinning equations and change-of-choice comparisons.
   Perform this reduction before the connected root-space and generation
   calculations. It handles arbitrary component cycles and combined internal
   symmetries, not only action orders 2/3.

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

   **Folded frame, finite Cartan and presentation.** For a simple orbit O, the column sum
   `d_O=Σ_(j∈O)B(α_j,α_i)` (i∈O) is 2 or 1, the induced graph on O being a regular finite forest
   (`SimpleGraph.IsAcyclic.exists_graphCartanMatrix_sum_orbit`); with `c_O=2/d_O∈{1,2}`, the
   folded Cartan matrix with **H rows and E columns** `C_(O,P)=c_OΣ_(i∈O)B(α_i,α_j)`, j∈P, is
   `Matrix.foldedCartanMatrix`, and the folded frame `H'_O=c_OΣ_(i∈O)H_i`,
   `E'_O=Σ_(i∈O)x_(α_i)`, `F'_O=c_OΣ_(i∈O)x_(−α_i)` is a Serre system for it, fixed by the
   pinned action, with its `TauCeti.serreLift` landing in the fixed vectors
   (`Matrix.ShellLieAlgebra.isSerreSystem_folded`,
   `Matrix.ShellLieAlgebra.reindex_serreLift_folded`). These are pinned and consumed; reducible
   diagrams can give a union of adjacent pairs.
   With `S_O=Σ_(i∈O)α_i` and `β_O=p(α_i)=S_O/|O|`, prove independence,
   `B(β_O,β_O)=d_O/|O|`, and
   `C_(O,P)=2B(β_O,β_P)/B(β_O,β_O)`. Its off-diagonal entries are nonpositive
   integers, its zero pattern is symmetric, and multiplying row O by
   `d_O/(2|O|)` gives the positive-definite projected Gram matrix. Construct the
   associated finite root pairing and its simple base, rather than just naming
   a matrix. The ambient `RootPairing.Base.cartanMatrix` uses roots as rows;
   translate it by the actual transpose to the H-row convention as in
   [LieHighestWeight Layer 7](../RepresentationTheory/LieHighestWeight/README.md).

   Prove that the folded `serreLift` is surjective onto the fixed Lie subalgebra over ℚ by
   constructing every signed orbit root vector as a rational
   combination of bracket words in E′/F′, and the fixed Cartan from their
   brackets. Retain all nonzero factors 2/3. Prove generation using the concrete
   comparisons below; a dimension match or existence of the Serre map alone
   is insufficient. Then consume Layer 7's separately owned split-field
   injectivity/straightening theorem, componentwise in the reducible case, to
   obtain the equivalence from that same lift. Establish Killing nondegeneracy
   and its Cartan/opposite-root pairings from the constructed root decomposition.
   For each connected folded component prove simplicity by decomposing an ideal
   into Cartan/weight components, using opposite brackets and nonzero root-string
   coefficients to propagate a nonzero root component through the connected
   root system; a nonzero Cartan component produces such a root component.
   Construct the actual Cartan, split weight decomposition and triangularizability.
   Thus finite dimensionality, Killing nondegeneracy, Cartan triangularizability
   and connected simplicity are conclusions before applying Layer 7, not added
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
   signs. Its fixed equation is `XᵀJ⁻¹+J⁻¹X=0`; trace 0 follows since 2 is
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
   nondegenerate and have dimensions `2n − 1` and `1`. The plus space has its actual
   basis of n-1 hyperbolic pairs and `w=u_n+v_n` of norm 2; after reindexing its
   Gram matrix is exactly native `JB`. Restriction/block extension gives mutually
   inverse Lie maps from the fixed typeD algebra to native `typeB (Fin(n-1))`,
   the minus-line skew-adjoint algebra being zero. Prove the source signed-frame
   comparison, all root-basis images and rational bracket generation. Native
   `typeBEquivSo'` is an additional existing scalar/form comparison when a
   split-signature carrier is wanted. A norm 1 alternative requires scalar
   similarity: divide `H^(n-1)⊕<2>` by 2 and replace `v_i` by `2v_i`; it is not a
   rational isometry of the original norm 2 and norm 1 forms. No square root of 2
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
   signed invariant vectors, normalized folded generators and component-return maps;
   Tau Ceti's numbered finite root realizations; LieHighestWeight Layer 7's Serre comparison.

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
   retain their ADE component. Use the valid types of `TauCeti.DynkinType.Valid` in low
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
   rank 1, identity actions and component permutations. In particular A4 reversal
   has no fixed vertex but has two projected root lengths, so the unrestricted
   fixed-vertex assertion is false in that case.
   Include A3 (outer orbit first, matrix `[[2,-2],[-1,2]]`), A4
   `[[2,-1],[-2,2]]`, A5's two paired orbits and fixed middle vertex with its
   full-sum factor 2, and D4 triality `[[2,-3],[-1,2]]`. Track the A3 combinations
   `x_(abc)`, `x_(ab)-x_(bc)`, `x_a+x_c`, `x_b` under the specified section and
   sign dictionary; paired negative vectors and invariant Cartan complete the
   basis.

   **Integral and full-Y comparisons.** The actual integral fixed lattice is
   bracket-closed. For the Q-based carrier, the comparison `A⊗_ℤ(g_ℤ^γ)→(A⊗_ℤg_ℤ)^γ` is
   pinned: it is injective, and surjective exactly when there is no negative cycle or A has no
   2-torsion (`Matrix.ShellLieAlgebra.fixedSubmoduleBaseChange_surjective_iff`). Do not
   identify this lattice with a chosen normalized folded Chevalley form.
   For A2 exchange prove the integral basis e=xα+xβ, f=x−α+x−β,
   h=Hα+Hβ satisfies `[e,f]=h`, `[h,e]=e`, `[h,f]=-f`; the normalized A1 frame
   E=e,F=2f,H=2h has index 4. Construct the rational equivalence and the actual
   integral lattice inclusion/index, retaining root-string factors 2/3.

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
   `γY=[[0,-1],[1,-1]]`: γY-I has diagonal factors 1,3, integral invariants 0,
   and F3 has the fixed vector `(1, −1)` although 2 is invertible.

   Over characteristic zero construct the action-compatible center/derived
   decomposition of the full reductive Lie algebra and its fixed central
   summand, separately from the folded semisimple Serre presentation. A root-free
   full-Y torus is not the empty Q-carrier. No integral central splitting,
   bad-characteristic simplicity, equality with a group fixed scheme or
   global-form comparison is inferred. Those 9B comparisons consume the actual
   Lie construction and retain their group-scheme/field hypotheses; special
   isogenies in characteristics 2/3 do not make a long/short swap an ordinary
   integral Cartan symmetry. Root-automorphism/W semidirect products, compact
   normalizer splitting and a VOA construction are separate from this adapter.

   **9A.1c. Numbered Geck frame and split-field adapter.** This layer owns the normalized frame
   interface; ChevalleyGroups C0–C1 consume it. On the native
   `TauCeti.DynkinType.lieAlgebra t ht`, construct the named all-root frame from its Geck basis,
   a specified equivalence `Fin t.numRoots ≃ {α : LieModule.Weight ℚ H L // α.IsNonZero}`, and a
   separate extension at the zero weight for `TauCeti.IsChevalleySystem`, whose family is indexed
   by all weights. Prove the simple E/F and coroot value equations, the involution
   normalization, integer structure constants, root-string constants and their opposite-root
   signs. Compare with the full-Y integral Lie lattice of 9A.1 by an integral basis map and its
   inverse; a rational Lie isomorphism alone does not identify integral lattices. In the
   nonsymmetric types `RootPairing.Base.cartanMatrix i j = α_i(h_j)` gives the **transpose** of
   the native H-row/E-column Serre matrix. Consume LieHighestWeight Layer 7's split-field
   generating Serre lift and its injectivity/straightening theorem. This step neither uses group
   existence nor assumes distribution theory. The signed ADE, section-change, full lift-group and
   folded fixed-Lie constructions of 9A.1a–9A.1b remain separate constructions, with their actual
   comparison maps and characteristic restrictions.

   **Checks.**
   - In A₁ the Geck frame is e, f, h with `[e,f]=h`, `[h,e]=2e`, `[h,f]=−2f`. The involution
     normalization is the signed one of `TauCeti.DynkinType.chevalleyInvolution`, `e↦−f`,
     `f↦−e`, `h↦−h`, as `TauCeti.IsChevalleySystem` requires `ω(x_α)=−x_(−α)`; the unsigned
     exchange `e↦f` is not that normalization.
   - In B₂ with α₁ long and α₂ short, `⟨α₁,α₂∨⟩=−2` and `⟨α₂,α₁∨⟩=−1`, so
     `RootPairing.Base.cartanMatrix 1 2 = α₁(h₂) = −2`. The Serre relation `ad(e₂)³e₁=0` with
     `ad(e₂)²e₁≠0` matches the α₂-string α₁, α₁+α₂, α₁+2α₂ through α₁, whereas `ad(e₁)²e₂=0`
     matches the string α₂, α₁+α₂ through α₂; the transpose would predict a root α₂+2α₁, which
     B₂ does not have.
   - The integral comparison with 9A.1 is a unit-sign basis map: in A₂ the word for
     `x_(α₁+α₂)` is `[x_(α₁),x_(α₂)]` with coefficient `ε(α₁,α₂)=1`. Rescaling one root vector
     by 2 is a Lie isomorphism over ℚ that does not preserve the integral lattice.


2. In the native `UniversalEnvelopingAlgebra ℚ` of this rational Lie algebra,
   use `TauCeti.UniversalEnvelopingAlgebra.kostantForm` with **all** root
   vectors and `H_(y_j)` for a chosen ℤ-basis `(y_j)` of the full Y. Thus its
   generators are `e_α^(m)/m!` and `Ring.choose H_(y_j) m`, including m=0.
   Use the existing native divided-power, Cartan integer-translate, subring
   functoriality, invariant-lattice and rational-base-change APIs. The native
   `LieAlgebra.Basis.kostantForm` supplies its simple-generator special case;
   compare it only after checking the actual toral lattice. Rational spanning
   is not the integral PBW theorem. Each toral binomial `binom(H_y,m)` acts on a weight space of
   weight λ∈X by the integer `binom(⟨λ,y⟩,m)`, central weights included.
3. Fix orders on Φ⁻ and Φ⁺ and construct the actual ordered basis
   `F^(a) · Π_j binom(H_(y_j),b_j) · E^(c)`, indexed by nonnegative root and
   toral multi-indices. Prove integral spanning by a terminating straightening
   procedure and independence by the rational PBW leading terms (J. E. Humphreys,
   *Introduction to Lie Algebras and Representation Theory* (1972), §26, for the semisimple
   case; the central toral directions enter as the commuting binomials in `H_(y_j)`). Export
   finite integral multiplication coefficients, the product values of basis vectors,
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
   `binom(−H_y,m)`. Use Layer 0's left-factor-first Hopf coproduct convention throughout.
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

   **Checks.**
   - In A₁ the Cartan translate at `m=r=1` reads `HE=E(H+2)`, that is `[H,E]=2E` with
     `⟨α,α∨⟩=2`. An opposite-root rule with `binom(H+2,1)` in place of `binom(H,1)` would give
     `[E,F]=H+2` and fail on the standard representation. After base change to a field of
     characteristic 2 the product `E^(1)E^(1)=2E^(2)` is 0 while `E^(2)` is still a basis
     vector: `E^(2)` is the base-changed element, not `E²/2`.
   - For the root-free datum with `Y=ℤ` the Kostant form is the ℤ-span of the `binom(H,m)`,
     m≥0: `binom(H,1)²=2binom(H,2)+binom(H,1)` has integer coefficients, while
     `binom(H,2)=(H²−H)/2` is not in `ℤ[H]`. For the ℤ-basis change `y′=y₁+y₂` of `Y=ℤ²`,
     Vandermonde's identity `binom(H_(y′),m)=Σ_i binom(H_(y₁),i)binom(H_(y₂),m−i)` shows that the
     two Kostant forms coincide.
   - With no roots and `Y=0` there is one exponent tuple, the monomial 1, and the Kostant form is
     `ℤ` inside `ℚ`, not the zero ring. For a rank-one torus the exponent n gives `binom(H,n)`,
     including n=0 and n=2. In A₁ the basis vectors of total degree two are `F^(2)`, `F·H`,
     `F·E`, `binom(H,2)`, `H·E`, `E^(2)`;
     the exponent (1,0,1) gives `FE`, and `EF=FE+H` is an integral combination of basis vectors,
     so straightening terminates with integer coefficients and the prescribed order matters even
     though both orders span rationally.

5. Before 9B's matrix construction, consume the characteristic-zero split Lie
   highest-module and finite-dimensionality construction of
   [LieHighestWeight Layers 3–4](../RepresentationTheory/LieHighestWeight/README.md).
   Supply its rational split-Chevalley descent and extend the derived action by
   the prescribed central character in the actual X. For each dominant λ∈X
   construct a full finite free admissible ℤ-lattice generated from the highest
   line by the 9A divided powers, prove its stability and weight decomposition,
   and choose finitely many such modules whose combined weights generate X.
   This supplies 9B's faithful torus/finite matrix data and nilpotent root
   exponentials. Prove the resulting group-scheme/root-datum comparison in 9B;
   do not assume the rational G-module classification of 10B to construct G.
   The 10B integral Weyl modules are compared with these earlier lattices after
   the group action and rational induction have been constructed.

   **The split-field producer used here.** Supply this extension once, here, beside the existing
   native highest-module API; do not introduce a second Verma or irreducible-quotient
   definition. For a split Killing-semisimple Lie algebra over any characteristic-zero field K
   and a dominant integral highest weight λ, construct the top-normalized contravariant form on
   the PBW Verma module from its Serre anti-involution. On each finite-dimensional weight space
   its Gram matrix has entries in K; identify its radical with the maximal proper highest-weight
   submodule. Kernel formation for these finite matrices commutes with field extension, and
   taking the direct weight sum proves `K̄ ⊗_K L_K(λ) ≃ L_K̄(λ)` with highest-line and generator
   equations. Consume native closed-field finite-dimensionality only on the right, then descend
   finite generation of the left vector space by faithful field extension. Extend
   componentwise for a reducible derived algebra and by the specified character on the central
   Lie directions. This producer precedes 9B and 10B; it consumes PBW, Verma quotients and native
   finite-dimensionality, not algebraic-group highest-weight classification or the group being
   constructed.

   Prove finite generation of the admissible lattice by the ordered divided-power
   straightening and the finite root-string bounds in these modules, and its torsion-freeness
   inside the rational module; over ℤ it is finite free. The highest line fixes the lattice
   `U_ℤv⁺`, rather than an arbitrary integral lattice, and weightwise stability includes all
   full-Y binomials. For a finite faithful weight family for a general reductive X, choose an
   element σ of the root lattice that is strictly dominant on every nonempty component. For each
   of finitely many generators λ of X take `λ+Nσ` dominant for N sufficiently large, together
   with σ; the weights of these modules generate X. Root-free components use the characters of
   the torus directly. This requires no integral splitting of Y into central and coroot
   summands. An empty root set with nonzero X gives `D(X)`, and `X=0` gives the trivial group.

   **Checks.**
   - For SL₂ the lattice `U_ℤv⁺` of the standard module is `ℤv⁺⊕ℤFv⁺` with `F^(2)v⁺=0`; the
     lattice `ℤv⁺⊕ℤ(Fv⁺/2)` is not stable, since `E(Fv⁺/2)=v⁺/2`.
   - The weights ±ϖ of the standard SL₂-module generate `X=ℤϖ`, whereas the adjoint module
     alone has weights 0, ±2ϖ and generates only `2ℤϖ`, the character lattice of PGL₂. For GL₂
     the standard module's weights e₁, e₂ generate `X=ℤ²`, and the determinant alone does not.

The integral straightening/basis construction in 9A is an input to the following
explicit group construction. Its proof does not assume 9C's distribution
comparison for a group that is still being constructed.

#### 9B. Pinned groups and their explicit carriers

Use the split data and pinnings of §§8.1–8.2 as the output specification.
- **The Chevalley–Demazure construction.** For each root datum, an explicitly constructed
  split reductive group scheme over `ℤ` realizing it, via a Chevalley basis and the Kostant
  `ℤ`-form of the enveloping algebra. Constructed, not asserted to exist. The closed subgroup
  scheme of `GLₙ` over `ℤ` generated by the Kostant root subgroups on an admissible lattice and a
  weight torus is the pinned `TauCeti.UniversalEnvelopingAlgebra.kostantToralGroupScheme`
  (supplier contracts); the target is that, for a Chevalley system and a full admissible lattice
  whose weights generate `X`, it is a split reductive group scheme with root datum `Ψ`.
- **Base change** along `ℤ → k` for any commutative ring `k`, and the compatibility of the
  pinning with it.
- **Root subgroup maps.** `x_α : 𝔾_a → G` for each root `α`, the Chevalley commutator
  relations they satisfy, and the equations pinning them against the pinning. Downstream
  work states its conventions against these, so they are part of the interface, not an
  implementation detail.

**One constructor.** This section owns the canonical integral construction from Lie data to
group scheme for every finite reduced **based reductive root datum** `𝓡 = (X, Φ, Y, Φ∨)` with
`X` and `Y` finite free and perfectly paired, arbitrary central tori and every isogeny type
included; §9A owns the full-`Y` integral Lie algebra and Kostant form it starts from. The pinned
model of `𝓡` is built from the finite faithful weight family and the admissible lattices of
§9A.5 by the native Kostant toral closure. It is neither a group chosen by Layer 9D's existence
theorem nor a group picked out from an arbitrary concrete realization. The finite
presentations, weight bases and orders are construction data, and the change-of-data
isomorphisms are targets of §§9B.2–9B.3. The simply connected and adjoint Dynkin instances are
specializations of this one construction, not separate constructions. The existence and pinned
classification endpoints are Conrad, *Reductive Group Schemes*, Theorems 6.1.16–6.1.17,
pp. 196–197, over a nonempty base scheme; the chart and toral-closure comparison of §9B.1 is a
further theorem about this specified construction and follows neither from flatness nor from the
abstract existence theorem.

The input data of the pinned model carry, beyond the eigenvalue and weight-generation
equations, the identification of the represented root operators with the normalized frame of
§9A.1c: `[E_α, E_(−α)] = H_α` for every root, and the root-string equations. In simply connected
`A₁` the matrix units satisfy `[E₁₂, E₂₁] = diag(1, −1)`, which zero operators cannot, while the
eigenvalue data hold for both choices.
*Needs:* §9A.1c's normalized full frame; §9A.5's faithful integral realization; §9B.1's chart
comparisons for the specified coordinate algebra.

**Checks.**
- A root-free datum of rank one gives `𝔾_m`, of dimension `1`, with no root maps.
- In simply connected `A₁` the root maps at `1` are `[[1, 1], [0, 1]]` and `[[1, 0], [1, 1]]`;
  together with the torus they generate a group scheme of dimension `3`.
- Keeping the weights `1, −1` on `ℤ²` but replacing both root operators by zero gives identity
  root maps and a toral closure of dimension `1`. The normalized frame and the root-datum
  comparison exclude this input; the torus-conjugation equation alone does not.

**9B.0. Relative notions and actual carriers.** Over every commutative base the split and
pinned notions are those of §§8.1–8.2, with their base-change maps, over disconnected bases too.
For the fixed integral representation the native inputs are `e : I → L`, `h : κ → L`,
`ρ : U_ℚ(L) →ₐ[ℚ] End_ℚ(V)`, an additive lattice `M` stable under
`TauCeti.UniversalEnvelopingAlgebra.kostantForm e h`, nilpotent represented root operators, a
basis `b : Basis (Fin n) ℤ M` and integral weights `wt : Fin n → κ → ℤ`. Take `κ` to index
coordinates on `X`, with Cartan operators from the dual basis in `Y`; the root character `α ∈ X`
supplies its exponent vector. The coordinate Hopf algebra is exactly
`CommHopfAlgCat.quotient (TauCeti.GeneralLinear.coordinateHopfAlgebra ℤ n)
(TauCeti.UniversalEnvelopingAlgebra.kostantToralDefiningIdeal e h ρ M hM hnil b wt)` and its
scheme is `TauCeti.UniversalEnvelopingAlgebra.kostantToralGroupScheme`. Points are the
convolution groups `WithConv (O(G) →ₐ[ℤ] A)`, with
`TauCeti.UniversalEnvelopingAlgebra.kostantToralSchemePointMulEquiv` and
`TauCeti.UniversalEnvelopingAlgebra.kostantToralPointsSubgroup` as the scheme and matrix
comparisons. Root and torus maps are
`TauCeti.UniversalEnvelopingAlgebra.kostantToralRootSubgroupPoints` and
`TauCeti.UniversalEnvelopingAlgebra.kostantToralWeightTorusPoints`; prove from §9A the weight and
eigenvector hypotheses of the native torus-conjugation theorem
`TauCeti.UniversalEnvelopingAlgebra.kostantToralWeightTorusPoints_conj_rootSubgroupPoints`. The
point subgroup is not identified with the subgroup generated by the generator points merely by
its name. The finite coordinate algebra stays small in every universe, and `A` ranges over a
separate universe through the native point functor.
*Needs:* §§8.1–8.2's split data and pinnings; §9A's Kostant form and admissible lattices; the
pinned toral closure (supplier contracts).

**Checks.**
- The root-free datum `X = ℤ` gives the coordinate algebra `ℤ[t, t⁻¹]` and the points `Aˣ` for
  every `A`; there are no root maps.
- Simply connected `A₁` gives `ℤ[a, b, c, d]/(ad − bc − 1)` with `x_α(s) = [[1, s], [0, 1]]`,
  `x_(−α)(s) = [[1, 0], [s, 1]]` and torus `t ↦ diag(t, t⁻¹)`; the conjugation equation is
  `t x_α(s) t⁻¹ = x_α(t² s)`, with exponent `⟨α, α∨⟩ = 2`. In adjoint `A₁` the torus is
  `D(ℤα) = 𝔾_m`, acting on the root coordinate with exponent `1`. A sign error in the pairing
  would give `t⁻² s`.

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

For the toral-closure model of §9B.0 these charts come first: they prove that the model is
split reductive, and the Bruhat-cell argument above applies to it only afterwards. Consume
`TauCeti.UniversalEnvelopingAlgebra.isTorsionFree_kostantToralCoordinateHopfAlgebra` for the
actual parameters. It gives torsion-freeness and flatness over ℤ; it does not give smoothness,
equality with the subgroup generated by the generator points, commutation of generated subgroup
schemes with arbitrary base change, or specialization equality, which are constructed here.
Compute the finite rank-two integral collection polynomials from §9A's root strings, keeping
the constants 2 and 3 and the rank-one SL₂ Gauss relation. For each order on the positive roots
construct the ordered multiplication on U^±, its coordinate functions and its polynomial
inverse by the positive-height filtration, with uniqueness by successive root-coordinate
quotients. In the weight basis the leading block minors define the ambient LDU open; on its
coordinate localization construct mutually inverse commutative ℤ-algebra maps between the
localized coordinate algebra of G and the polynomial–Laurent coordinate ring of U⁻×D(X)×U⁺,
from integral collection and the actual generator relations, including the determinant
localization and all torus units. The inverse scheme maps are natural under base change and
agree on chart overlaps. They are maps of algebras, since the big cell is not a subgroup; group
multiplication is compared in these coordinates on the open locus of pairs whose product lies in
the chart, and the global group, root-subgroup and torus morphisms keep their Hopf
compatibilities. A field Bruhat argument is a consistency check here, not a substitute for this
integral inverse. Highest-weight matrix coefficients enter only where they are functions on the
chosen representation: the standard SL₂ coefficient does not descend to PGL₂, whereas the block
minors do.

Prove the Weyl-translated cover of every geometric fibre by rank-one collection and finite Weyl
reduction, then the scheme cover: the uncovered closed locus has empty fibre over every prime,
hence is empty. The charts prove smoothness, relative dimension rank X+|Φ|, geometrically
connected reductive fibres, maximality and self-centralizing of the torus, the root lines and the
Borel subgroup, and they extract the root datum and the generator pinning. Only after this
verification does Layer 7's structure theory of a given split reductive group apply; it
presupposes neither Layer 9D's existence theorem nor its classification. Over every field
compare the base change with the subgroup scheme generated by the reduced root maps and the
torus: its charts are the integral charts after reduction, the inverses agree on overlaps, the
charts cover both schemes and the inverse maps glue. Flatness alone never gives this comparison.
Over every field the points are generated by the root maps and the whole torus Hom(X,kˣ), and
simply connected semisimple points by the root maps alone, by the rank-one coroot formulas. No
generation statement over every commutative ring, and no surjectivity of a central isogeny on
the points over every field, follows; the adjoint A₁ test over ℚ with its nonsquare
determinant class remains.
*Needs:* §9A's root strings and integral form; §9B.0's carrier and the pinned torsion-freeness;
Layer 7's structure theory only after the charts.

**Checks.**
- In SL₂, Ω=D(a) for g=[[a,b],[c,d]]; the inverse gives u₋(c/a),
  diag(a,a⁻¹), u₊(b/a). Their product has lower-right entry (1+bc)/a=d.
- The other Weyl translate is D(c). The identity ad−bc=1 gives (a,c)=A,
  so one is a unit over a local ring. All 48 determinant-one matrices over
  ℤ/4 satisfy this test.
- For root-free data Ω=T=G. Over ℤ, [[2,1],[3,2]] has determinant 1
  but neither 2 nor 3 is a unit, excluding a single-chart assertion for all rings.
- Over 𝔽₂ the chart of SL₂ has 2·1·2=4 points, its translate 4 and their overlap 2, so
  the union has 6=|SL₂(𝔽₂)| points. The dimension rank X+|Φ| is 3 for SL₂ and 2 for the
  root-free X=ℤ².
- The reduced subgroup generated by the root maps and the torus over 𝔽_p has the same
  charts after reduction; for SL₂ over 𝔽₂ it has the same 6 points, so specialization
  agrees. Flatness alone does not give this: the flat ℤ-group scheme μ₂ has 2 points over ℚ
  and 1 over 𝔽₂.

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

Compare a further full admissible realization D with the canonical model. Let Λ(D) be its
actual weight span, not the saturation of that span in the weight lattice P; in the semisimple
case with faithful Lie action require ℤΦ⊆Λ(D)⊆P, and use the root datum on Λ(D). Let E be the
canonical realization of that datum and form D⊕E. Its defining maps factor through the
block-diagonal subgroup GL(D)×GL(E), and its coordinate algebra is generated by both sets of
matrix coefficients together with the inverse determinant of each summand. On the
block-diagonal locus these inverses are det(E)·(det(D)det(E))⁻¹ and det(D)·(det(D)det(E))⁻¹,
so they lie in the ambient determinant localization. The projections on coordinate Hopf
algebras send each matrix coefficient to the corresponding block coefficient and each inverse
determinant to the inverse determinant of its block; prove that they factor through the two
defining ideals and satisfy the Hopf identities, without a block projection on arbitrary
matrices. The chart coordinates of §9B.1 agree under both projections, with the same characters
of X and the same root parameters; construct inverse maps on the chart localizations and their
Weyl translates, check equality on overlaps and glue. The result is an integral group-scheme
isomorphism matching roots, torus and pinning, natural in A and compatible with changes of
lattice and basis, whose composites are identities by the same chart identities; a rational
intertwiner or an equality of dimensions does not prove it. The Geck, spin, tripled D₄,
minuscule and doubled E₆, E₇ and short-root G₂ and F₄ carriers are thereby represented
realizations with explicit comparisons, and there is one canonical group for each pinned datum.

For an inclusion Λ(D)⊆Λ(E) of weight spans construct the canonical central isogeny G_E→G_D, its
scheme kernel D(Λ(E)/Λ(D)), its root equations and its torus restriction, from the compatible
chart coordinates and the fppf central quotient, with the finite-presentation and descent
hypotheses of Layers 0, 3 and 4; equal lattices give an isomorphism. This comparison is neither
an integral central splitting nor surjectivity on rational points. A general full-X reductive
datum keeps its compatible central characters throughout.
*Needs:* §9B.0's carriers; §9B.1's charts and their Weyl translates; Layers 0, 3 and 4's finite
presentation, fppf quotients and diagonalizable groups.

**Checks.**
- For Λ=X the quotient lattice is zero, D(0)=1 and f is an isomorphism.
- For SL₂→PGL₂, Λ=2ℤ⊂ℤ=X gives kernel μ₂; diag(2,1) represents a
  rational PGL₂ point of determinant square class 2 with no SL₂(ℚ) lift.
- In characteristic 2 that kernel has algebra k[t]/((t−1)²), of length 2
  despite its single geometric point. For t↦t² on 𝔾_m the same index and
  kernel calculation holds with no roots.
- With D the standard module of GL₂ and E its determinant character, the block projection
  sends det(D)⁻¹ to det(E)·(det(D)det(E))⁻¹=det·det⁻², which is det⁻¹ on the block locus. For
  the root-free datum X=ℤ the generators t and t⁻¹ recover ℤ[t,t⁻¹], whereas t alone gives
  ℤ[t], the coordinate ring of 𝔸¹ and not of 𝔾_m.
- For D the standard module of SL₂ and E=D⊕D, Λ(E)=Λ(D) and the comparison is the identity
  on charts.

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

For the canonical model construct the isomorphism induced by a based root-datum isomorphism
from its maps on X and Y acting on the chart coordinates of §9B.1, and prove its inverse,
uniqueness, composition and base-change laws there. This is the scheme-level diagram
automorphism used below. Its Lie-algebra comparison uses §9A.1c and the native Serre diagram
action, and the pullback on characters is the inverse of the geometric diagram action: an
automorphism of order three detects an inverse taken for the forward map, one of order two
cannot. *Needs:* §9A.1c's normalized frame; §9B.1's chart coordinates.

**Checks.**
- The identity datum fixes every torus character and x_α(a).
- In SL₂(ℚ), conjugation by diag(2,1/2) sends x_α(a) to x_α(4a);
  preserving T and B does not suffice to preserve the pinning.
- SL₂ and PGL₂ have Dynkin type A₁ but lattices of index 2; the central
  isogeny of §9B.2 is not an isomorphism of these pinned groups.
- Conjugation by diag(t,t⁻¹) in SL₂ fixes the torus pointwise and sends x_α(1) to x_α(t²),
  so it preserves the pinning only when t²=1, when it is central and acts trivially: the
  pinned automorphism inducing the identity datum is the identity.
- For the triality σ of D₄ with x_(α₁)↦x_(α₃)↦x_(α₄)↦x_(α₁), so that σ(α₁∨(t))=α₃∨(t), the
  pullback α₃∘σ takes the value 2^⟨α₃,α₃∨⟩=4 at α₁∨(2), whereas the inverse-direction model
  α₃∘σ⁻¹ evaluates α₃ at σ⁻¹(α₁∨(2))=α₄∨(2) and gives 2^⟨α₃,α₄∨⟩=1, since α₃ and α₄ are
  orthogonal. For the order-two reversal of the A₂ base the two conventions agree.

##### 9B.4 The special linear group

For every `n ≥ 0` the single carrier of `SLₙ` is the pinned determinant-kernel quotient
`TauCeti.SpecialLinear.coordinateHopfAlgebra ℤ n` of the general linear coordinate Hopf algebra,
with quotient map `TauCeti.SpecialLinear.coordinateMap ℤ n` (supplier contracts, *The special
linear group*); no second SL group is introduced. Write `x_ij` for the image in `O(SLₙ)` of the
matrix coordinate `(i, j)` of `GLₙ` and `X = (x_ij)`. The Hopf structure on these coordinates and
the points are pinned and consumed, not restated. `X` is the coefficient matrix of the standard
comodule (`TauCeti.SpecialLinear.coefficientMatrix_basisFun`), so `Δ(x_ij) = Σ_k x_ik ⊗ x_kj` and
`ε(x_ij) = δ_ij` are `TauCeti.Comodule.comul_coefficientMatrix_eq_sum` and
`TauCeti.Comodule.counit_coefficientMatrix` rewritten by it, and `S(x_ij) = adjugate(X)_ij` is
`TauCeti.SpecialLinear.map_antipode_coefficientMatrix`. For every commutative ring `A`,
`TauCeti.SpecialLinear.pointsMulEquiv` is a group isomorphism from the convolution group of
`A`-points to `Matrix.SpecialLinearGroup (Fin n) A`, natural in `A`
(`TauCeti.SpecialLinear.pointsNatIso`, `TauCeti.SpecialLinear.pointsMulEquiv_mapValue`), and a
point takes `x_ij` to the `(i, j)` entry of its matrix
(`TauCeti.SpecialLinear.ofConv_coefficientMatrix`). So convolution is matrix multiplication, the
counit is the identity point and composition with the antipode is matrix inversion.

- **Polynomial presentation.** Construct the `ℤ`-algebra isomorphism
  `O(SLₙ) ≃ₐ[ℤ] ℤ[x_ij | i, j ∈ Fin n]/(det X − 1)`, with both maps and their values on the
  generators, by removing the determinant localization. The class of `det X` in the polynomial
  quotient is `1`, hence a unit, so the universal property of localization extends the quotient
  map of `ℤ[x_ij]` to `ℤ[x_ij][det⁻¹]`; the extension kills `det − 1`, which generates the
  defining ideal (`TauCeti.SpecialLinear.definingHopfIdeal_toIdeal`), so it factors through
  `O(SLₙ)`, and the map back sends each generator `x_ij` to its class. The statement includes
  `n = 0` and `n = 1` (Milne, Algebraic Groups, §2.a, the matrix-group coordinate descriptions).
  *Needs:* the pinned SL carrier and `TauCeti.SpecialLinear.definingHopfIdeal_toIdeal`; Mathlib's
  `MvPolynomial`, ideal quotients and `IsLocalization.Away`.
- **Comparison with the pinned group.** For `n ≥ 1` compare with 9B's pinned group for the datum
  `TauCeti.SpecialLinear.diagonalRootDatum (n − 1)`: identify its character lattice `X` with
  `ℤⁿ/ℤ(1, …, 1)`, its simple roots with `ε_i − ε_(i+1)` and its pinned root maps with
  `x_(ε_i − ε_j)(a) = I + a E_ij`. In 9B.2 take the standard representation `ℤⁿ`, whose weights
  `ε_1, …, ε_n` span all of `X`, compare the two defining Hopf ideals in the native `O(GLₙ)`, and
  construct the pinned isomorphism, compatible with 9B.3's based-datum comparison. Over a field
  `k`, compare the generation of `SLₙ(k)` by root subgroups and torus (*Elementary generators and
  all ring points*, `GE_G(k) = G(k)`) with Mathlib's transvection reduction
  `Matrix.Pivot.exists_list_transvec_mul_diagonal_mul_list_transvec`. At `n = 1` the group is
  trivial and the datum `diagonalRootDatum 0` has `X = 0` and no roots. *Needs:* §9B's pinned
  construction and root subgroup maps; §9B.2's realizations and central quotients; §9B.3's
  pinned comparison; Layer 0's point groups; the pinned `TauCeti.SpecialLinear.diagonalRootDatum`,
  `TauCeti.SpecialLinear.pointsMulEquiv` and `TauCeti.SpecialLinear.ofConv_coefficientMatrix`;
  for the field comparison, §9B's *Elementary generators and all ring points* and Mathlib's
  transvection reduction.

**Checks.**
- At `n = 0` the empty determinant is `1`, so the relation is `0` and the algebra is `ℤ`; the
  points group `Matrix.SpecialLinearGroup (Fin 0) A` has one element.
- At `n = 1` the relation is `x − 1`, so `x` maps to `1` and the algebra is `ℤ`; the pinned group
  of `diagonalRootDatum 0`, whose character lattice is `0`, is trivial as well.
- At `n = 2` the relation is `ad − bc − 1`. Over `ℤ/4` the matrix with rows `(1, 1), (0, 1)` has
  determinant `1` and inverse with upper-right entry `−1 = 3`, the value of `S(b) = −b`. The
  wrong sign `S(b) = b` would give `[[1, 1], [0, 1]]` as its own inverse, but its square
  `[[1, 2], [0, 1]]` is not the identity over `ℤ/4`; over `ℤ/2` the two signs agree, so that ring
  cannot test the sign.
- At `n = 2` the lattice `ℤ²/ℤ(1, 1)` is generated by the class of `ε_1` and the simple root
  `ε_1 − ε_2` is twice that class, so `ℤΦ` has index `2` in `X`. The standard representation
  realizes `SL₂`; the adjoint representation, whose weights `0, ±(ε_1 − ε_2)` span only `ℤΦ`,
  realizes `PGL₂` in 9B.2, and is the wrong realization for this comparison.

##### Elementary subgroups and further pinned constructions

- **Elementary generators and all ring points.** The elementary group `E(A)` generated by the
  Kostant root subgroups on an admissible lattice, functorial in `A`, is the pinned
  `TauCeti.UniversalEnvelopingAlgebra.kostantElementarySubgroup`. For each commutative ring A,
  define E_G(A) inside the constructed G(A) as the subgroup generated by
  all x_α(a), compared with `E(A)` through the matrix realization, and GE_G(A) as the subgroup
  generated by E_G(A) and T(A).
  Here T(A) denotes the image of the pinned torus embedding in G(A).
  Use native subgroups of Layer 0's same points group, with inclusions and
  ring-functorial restrictions compatible with all base-change maps. Prove
  `t x_α(a) t⁻¹=x_α(α(t)a)`, so T(A) normalizes E_G(A) and
  GE_G(A)=E_G(A)T(A). Use §9B.1's integral Weyl-translated chart cover:
  the chart Ω=U⁻D(X)U⁺ has its actual inverse, and each translate uses
  a Weyl representative built from `x_α(1)x_(−α)(−1)x_α(1)`.
  Derive GE_G(k)=G(k) over every field, agreeing with 9B.1, and extend
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
  These isogenies are pinned on three explicit carriers, with multiplicativity, the pinning
  equations on the numbered simple root subgroups in exactly the exponent convention above and
  the square relation `τ² = Frob_p` (supplier contracts):
  1. the rank-two symplectic carrier, where `τ` is the native
     `TauCeti.SpStd.specialIsogeny`, with `SpStd.specialIsogeny_specialIsogeny` the square
     relation and `SpStd.specialIsogeny_rootSubgroupPoints_inl_zero`,
     `specialIsogeny_rootSubgroupPoints_inl_last`, `specialIsogeny_rootSubgroupPoints_inr_zero`
     and `specialIsogeny_rootSubgroupPoints_inr_last` the pinning equations; it acts on the
     four-dimensional subquotient `ker φ ⧸ ⟨ω⟩` of the exterior square of the standard module by
     `2×2` minors;
  2. the short-root `G₂` carrier over `𝔽₃`, the closed subgroup scheme of `GL₇` generated by the
     numbered root subgroups and weight torus of `V(ϖ₁)`, with
     `TauCeti.G2ShortRoot.PrimeField.specialIsogenyHom`,
     `TauCeti.G2ShortRoot.PrimeField.specialIsogenyHom_comp_self` and
     `TauCeti.G2ShortRoot.PrimeField.specialIsogeny_rootSubgroupPoints`;
  3. the short-root `F₄` carrier over `𝔽₂`, the closed subgroup scheme of `GL₂₆` generated the
     same way from `V(ϖ₄)`, with `TauCeti.F4ShortRoot.PrimeField.specialIsogenyHom`,
     `TauCeti.F4ShortRoot.PrimeField.specialIsogenyHom_comp_self` and
     `TauCeti.F4ShortRoot.PrimeField.specialIsogeny_rootSubgroupPoints`.
  The `G₂` and `F₄` carriers are reductive over their prime fields (supplier contracts). The
  targets are: the kernel of `τ` is the infinitesimal subgroup scheme whose Lie algebra is the
  short-root ideal `I ⊂ 𝔤`, spanned by the short root vectors and the short coroots, which is an
  ideal exactly in characteristic `p`, where the short coroots span a line for `G₂` and a plane
  for `F₄`; and each carrier is identified with the base change to `𝔽_p` of 9B's pinned simply
  connected group of its type, so that `τ` transfers to that group scheme. The prime field is the
  base of the carriers because the isogeny exists only in characteristic `p` and because the
  closed subgroup scheme generated over `𝔽_p` by the reduced root subgroups and torus is only
  known to be contained in the base change of the integral toral closure, non-flat base change
  possibly adding equations. On the `G₂` and `F₄` carriers `τ` is the polynomial action on the
  quotient `𝔤/I` of the represented Chevalley Lie algebra by its stable short-root ideal, read in
  the module through a fixed normalized identification `𝔤/I ≃ V` with its actual zero-weight
  basis; its multiplicativity and generator equations hold over `𝔽_p[t]`, not only over `𝔽_p`.
  The defining ideal of the subgroup generated over the prime field gives the restriction, and
  §9B.1's specialization comparison and §9B.2's realization isomorphisms transfer `τ` to the
  pinned model. Prove that `τ` is an isogeny in the sense of
  `TauCeti.CommHopfAlgCat.IsIsogeny`, finite and faithfully flat on coordinate algebras, and that
  its scheme kernel is infinitesimal and not central. This scheme-level construction uses chart
  and ideal relations; a classification of maps of field points is not an input to it. The
  reversed exponent table, exponent `p` on long and `1` on short source parameters, fails the
  commutator relations; over `𝔽₂` every parameter satisfies `s² = s`, so the `B₂` test of this
  is run over `𝔽₈`. This is a statement about group schemes and belongs here rather
  than in any consumer. *Needs:* the pinned carriers and isogenies; 9A's Chevalley lattice and
  admissible lattices; 9B's pinned root subgroups and torus; Layer 3's closed subgroup schemes and
  kernels; Layer 2's Lie algebra; §§9B.1–9B.2's specialization and realization comparisons.
- **Explicit carriers with numbered symmetries.** The short-root `G₂` and `F₄` carriers above
  and the tripled `D₄` carrier `TauCeti.D4Tripled.groupScheme`, the toral closure of
  `8ᵥ ⊕ 8ₛ ⊕ 8꜀` inside `GL₂₄` over `ℤ` carrying triality `TauCeti.D4Tripled.trialityAutomorphism`
  as a numbered symmetry of order three, a signed permutation of the weight basis permuting the
  three summands, are pinned with their numbered simple root subgroups, weight tori, pinning
  equations and Frobenius (supplier contracts), the way the doubled `E₆` carrier
  `V(ϖ₁) ⊕ V(ϖ₆)` inside `GL₅₄` carries its graph automorphism. The spin module alone cannot
  carry triality linearly, because triality permutes the three eight-dimensional representations
  and fixes none of them, nor their sum `8ₛ ⊕ 8꜀`. The target is the identification of each
  carrier with 9B's pinned simply connected group of its type, using the span statement that its
  weights generate the full character lattice (for the short-root modules because the short roots
  of `G₂` and `F₄` generate the root lattice, which is the weight lattice there). *Needs:* the
  pinned carriers; 9A's admissible lattices and 9B's pinned construction; no fixed-point theorem
  is an input to these identifications.

  **Checks.**
  - On characters of `B₂` with short simple root `α` and long simple root `β`,
    `τ*(α) = β` and `τ*(β) = 2α`, so `(τ*)²` is multiplication by `2` on both, the action of
    `Frob₂`; on root subgroups, `x_β(t) ↦ x_(β')(t) ↦ x_β(t²)` and
    `x_α(t) ↦ x_(α')(t²) ↦ x_α(t²)`, again `Frob₂`.
  - A table with exponent `2` on both long and short source parameters would make `τ²` the
    square of `Frob₂`. The kernel of `τ` on `Sp₄` over `𝔽₂` is not central: on its part
    `{x_α(s) : s² = 0}` in a short root group the torus acts through the short root character.
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
with its convolution algebra, coalgebra and antipode from Layer 0's Hopf maps.
These are distributions supported at the identity, not analytic distributions.
Prove finite freeness of the jets, the order inclusions and convolution estimates,
and arbitrary-ring base change level by level. For a constructed split reductive
G, use the big-cell open neighbourhood `U⁻×T×U⁺→G` to give the distribution
triangular factorization, root-subgroup coefficient distributions and the full
Y-toral binomial basis. Construct the rational comparison with U(Lie(G_ℚ)),
pinning the root derivative and H_y, and identify the integral form of 9A with
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

*Needs:* 9A's integral form and basis; 9B's big cell; Layer 0's Hopf maps.
The distribution algebra and Frobenius section precede rational integration.

**Checks.**
- `𝔾_m` over `ℤ`: `O = ℤ[t, t⁻¹]`, `I = (t − 1)`, and the order-`n` jet is free of rank `n + 1`
  on `(t − 1)^k`, `k ≤ n`; its dual basis consists of the binomial distributions `binom(H, k)`
  with `binom(H, k)(t^m) = binom(m, k)`. Convolution gives `H·H = H + 2·binom(H, 2)` (values
  `m² = m + 2·binom(m, 2)`), so `binom(H, 2) = (H² − H)/2` lies in `Dist_ℤ(𝔾_m)` but not in the
  polynomial ring `ℤ[H]`: without the binomials, the enveloping algebra of the integral Lie
  algebra is already too small in rank one.
- `𝔾_a` over `ℤ`: `O = ℤ[x]`, `I = (x)`, and the dual basis of the `x^k` consists of the divided
  powers `γ_k` with `γ_j·γ_k = binom(j + k, j)γ_(j+k)`, so `γ₁² = 2γ₂` and `γ₂ ∉ ℤ[γ₁]`. Over
  `𝔽_p` the relative Frobenius `x ↦ x^p` sends `γ_k` to `γ_(k/p)` when `p ∣ k` and to `0`
  otherwise (`γ_p ↦ γ₁`, `γ₁ ↦ 0`). The group-scheme kernel is `α_p`, whose distribution algebra
  has basis `γ₀, …, γ_(p−1)` and dimension `p = p^(1·1)`. The kernel of the distribution map is
  instead the span of all `γ_k` with `p ∤ k`, equivalently the ideal generated by the
  augmentation ideal of `Dist(α_p)` (Jantzen, Part I, 1985 preprint, §§7.2–7.3 and 7.8–7.9,
  pp. 136–138 and 144–146, applied to `x ↦ x^p`): for `k = pm + r` with `0 < r < p`,
  `γ_r γ_(pm) = binom(pm + r, r)γ_k = γ_k` over `𝔽_p`. At `p = 2` this kernel has the infinite
  basis `γ₁, γ₃, …`, whereas `Dist(α₂)` has basis `γ₀, γ₁`, with `γ₀ ↦ γ₀ ≠ 0` and `γ₃ ↦ 0`; in
  general `γ_(p+1)` lies in the kernel of the map but outside `Dist(α_p)`.
- The central isogeny `SL₂ → PGL₂` restricts on tori to `t ↦ s = t²`, so `H ↦ 2H′` and
  `binom(H, 2) ↦ 4·binom(H′, 2) + H′`. Over `𝔽₂` the first image is `0` and the second is `H′`:
  the distribution map is surjective but not injective, the kernel order `2` not being
  invertible.
- Toral idempotent: for `T = 𝔾_m` and `p = 2`, `μ₀ = binom(H − 1, 1) = H − 1` acts on the weight
  `λ` by `λ − 1`, that is by `0, 1, 0` on `λ = 1, 2, 3` modulo `2`, projecting onto even weights.
  For general `p`, `binom(λ − 1, p − 1) ≡ 1` when `p ∣ λ` and `≡ 0` otherwise, by Lucas's theorem.

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

Layers 0, 2, 3, 4 and Layer 7's field structure theory; §§8.1–8.2 only; Tau Ceti's Cartan–Killing
classification and numbered root data (supplier contracts); RootSystems §§5.1–5.2 for §9A.1a-L;
LieHighestWeight Layers 3–4 and 7; IntegralLattices; Tau Ceti's Kostant form, its toral closure
with that closure's flatness over `ℤ`, Serre presentation
and Geck constructions, its signed ADE shell Lie algebras and explicit `G₂`, `F₄` and tripled
`D₄` carriers, and its special linear coordinate Hopf algebra with its points, coordinate Hopf
formulas and diagonal root datum (supplier contracts); for §9B.4, Mathlib's `MvPolynomial`, ideal
quotients, `IsLocalization.Away` and transvection reduction. Within the layer, §§9A.1–9A.5
precede §9B, and §9B precedes the distributions of §9C.

## Layer 9D: classification, relative groups and forms
- The **isomorphism** and **existence theorems**: split reductive groups ↔ root data
  (Conrad, Reductive Group Schemes, Theorems 6.1.16–6.1.17, pp. 196–197, over any
  non-empty base; Milne, Theorem 23.25, p. 492, for the isogeny theorem over a field);
  classification of split semisimple groups up to central isogeny by Dynkin diagrams,
  and of split simply connected or adjoint semisimple groups up to isomorphism (Milne,
  Theorem 23.58, p. 501); central isogenies and the isogeny theorem; Chevalley existence,
  realized by Layer 9's construction over `ℤ` (Milne, Theorem 23.74, p. 511). Every reduced
  root datum with finite free character and cocharacter lattices occurs, the root-free and
  rank-zero data included (Milne, Theorem 23.55, p. 501). For split groups with specified split
  maximal tori over a nonempty base `S`, an isomorphism of root data lifts to an isomorphism of
  split groups that is unique up to the action of `(T/Z_G)(S)`; a compatible pinning makes the
  lift unique (Conrad, Theorem 6.1.17, p. 197; over a field, Milne, Theorem 23.25 and
  Remark 23.26, pp. 492–493). For a general isogeny the isogeny theorem keeps the
  characteristic-exponent powers on the roots: the induced map of root data sends each root to
  a power of the characteristic exponent times the corresponding root (Milne, Theorem 23.25).
  Compare root-datum extraction and Layer 9's realization in both directions on the full datum,
  retaining the lattice maps, roots, coroots and pinning; simply connected and adjoint forms
  are distinguished by their full lattices. *Needs:*
  Layer 7's root data; §§8.1–8.2's split data and pinnings; for the central kernels `D_S(M)`, the
  pinned `TauCeti.DiagonalizableGroup.groupScheme` and this layer's multiplicative-type theory
  over `S` (below); Layer 9's split models; Tau Ceti's `TauCeti.existsUnique_dynkinType`,
  `TauCeti.HasCartanType.of_base` and `TauCeti.nonempty_equiv_of_hasCartanType` for the
  Dynkin classification.
- **Relative reductive groups over an arbitrary affine base.** For `S=Spec R`, `R`
  any commutative ring, a reductive S-group means a smooth affine group scheme
  of finite presentation with connected reductive geometric fibers; semisimple means all
  those fibers are semisimple. Transport the native relative reductivity predicate to scheme group objects and prove
  that comparison. Consume its isomorphism invariance and arbitrary base change at their
  full commutative-ring generality. Define the semisimple fibre predicate and prove its
  isomorphism and base-change invariance; prove products and fpqc descent for both
  predicates with the actual comparison maps. Construct the relative center and derived subgroup, prove
  the derived subgroup semisimple and the center of multiplicative type, identify their
  pullbacks along every base map `S′ → S` with the center and derived subgroup of `G_(S′)`,
  compatibly with their inclusion and quotient maps, and state
  smoothness only where it holds; for example the center of SL_p need not be smooth in
  characteristic p. Construct central isogenies and the simply-connected and adjoint
  semisimple forms, their kernels and their base-change compatibilities.

  Construct the smooth scheme of maximal tori and the smooth projective scheme of Borels,
  with their functor-of-points descriptions, pullback equations and étale-local sections;
  the Borel scheme carries the relatively ample determinant line bundle of the Lie algebra of
  its universal Borel subgroup. Construct root subgroup and relative root-space
  decompositions after an étale splitting cover, and descend the character/cocharacter
  perfect pairing and root datum as étale locally constant sheaves. Prove the split root
  datum is locally constant in the étale topology and that the group is étale-locally a split group from Layer 9. The identification
  retains the full root datum, not merely its Dynkin diagram. Prove the based-root-datum
  classification of split pinned models over every nonempty base `S`, with a specified
  constant character lattice and a fixed based root datum on all connected components, and
  the identity, composition, isomorphism, base-change and pinning-change equations. An
  isomorphism here respects that splitting datum: automorphisms of the datum that vary from
  component to component are not identified with a single automorphism of the fixed datum.
  Extend the field-level subgroup/quotient and multiplicative-type comparisons of
  Layers 3–4 to these bases in this lane: use the supplied fppf sheaf coequalizers and effective
  affine descent, and prove representability of the center, derived group, maximal-torus and
  Borel functors specified here, with their base-change maps. Field-only quotient results do
  not imply these relative theorems. Use Layer 0's actual affine/Hopf dictionaries and the
  independent Layer 9 split integral models. This relative extension is not a prerequisite
  of Layer 9.

  The multiplicative-type theory over `S` is owned here. For a finitely generated abelian group
  `M`, `D_S(M) = Spec(R[M])` is the pinned `TauCeti.DiagonalizableGroup.groupScheme` (supplier
  contracts), whose fibres over `S` are Layer 4's diagonalizable groups. Three of its properties
  are pinned and consumed, not restated. First, `M ↦ D_S(M)` is fully faithful over a connected
  base, `TauCeti.DiagonalizableGroup.fullyFaithfulSchemeFunctor`, and faithful over every
  nonempty one. Second, it is exact in both directions over every nonempty affine base,
  `TauCeti.DiagonalizableGroup.isShortExact_mapDomainBialgHom_iff`. Third, over a field `k`,
  `D_k(M)` is of multiplicative type,
  `TauCeti.DiagonalizableGroup.multiplicativeTypeAffineGroupSchemeProperty_groupScheme`. An
  `S`-group is of multiplicative type when it is isomorphic to some `D_(S_i)(M_i)` on the members
  of an fppf cover `{S_i}` of `S` (Conrad, Reductive Group Schemes, Definition B.1.1, p. 280).
  Prove that over `S = Spec k` this is the pinned `TauCeti.multiplicativeTypeAffineGroupSchemeProperty`,
  which asks for diagonalizability over `k̄`. A group split over `k̄` is split over a finite
  extension, by the pinned
  `TauCeti.multiplicativeTypeCommHopfAlgProperty.exists_finiteDimensional_groupLikeSpanned_baseChange`,
  and a finite extension is an fppf cover of `Spec k`. Conversely, a nonempty fppf cover of
  `Spec k` has a point whose residue field is finite over `k`, and that field embeds in `k̄`.
  Prove that a monomorphism from an `S`-group of multiplicative type to an affine `S`-group of
  finite presentation is a closed immersion (Lemma B.1.3, p. 281); this is the relative form of
  Layer 3's monomorphism criterion. Prove that an fppf closed subgroup of an `S`-group of
  multiplicative type is of multiplicative type (Corollary B.3.3, p. 290). Each proof reduces,
  by limit arguments, to a noetherian and then local base (the proofs of Lemma B.1.3, p. 281,
  and Corollary B.3.3, p. 290).

  Define the locally constant abelian sheaves on the small étale site of `S` whose geometric
  fibres are finitely generated abelian groups. This extends EtaleCohomologyFoundations F.0.1,
  whose lisse sheaves have finite fibres, to lattice fibres. Prove that `H ↦ Hom_(S-gp)(H, 𝔾_m)`
  is an anti-equivalence from `S`-groups of multiplicative type to these sheaves, so that every
  such group splits étale-locally on `S` (Proposition B.3.4, pp. 290–291). Over `S = Spec k` this
  anti-equivalence is Layer 4's classification by Galois modules (Milne, Theorem 12.23, p. 240).
  Prove that when `S = Spec R` is a normal scheme, every `S`-group of multiplicative type is
  isotrivial on the members of a Zariski cover of `S`, and isotrivial when `S` is moreover
  irreducible (Corollary B.3.6, p. 293). So for irreducible normal `S` and a geometric point `s`, `H ↦ Hom_(S-gp)(H, 𝔾_m)_s` is
  an anti-equivalence to discrete `π₁(S, s)`-modules that are finitely generated as abelian
  groups. Here `π₁` is EtaleCohomologyFoundations F.0.2's étale fundamental group, and the
  comparison extends its `VanishingCycles.lisseMonodromyEquiv` from finite to finitely generated
  fibres for sheaves trivialized by a finite étale cover. This theory supplies the centre of
  multiplicative type, the scheme of maximal tori, the étale-local splitting and the descended
  character and cocharacter sheaves above.

  Prove the finite-presentation comparison for relative groups, with no Noetherian hypothesis
  on `R`. If `R` is a filtered colimit of rings `Rᵢ`, a reductive group over `Spec R` and any
  finite diagram of its finitely presented group schemes and maps descend to some stage, with
  the specified equations after enlarging the stage. Apply SchemeAndStackFoundations §0.9 to
  the multiplication, inverse and unit diagrams, and retain reductivity at a stage by openness
  of the locus of reductive geometric fibres (Conrad, Reductive Group Schemes,
  Proposition 3.1.9 and Corollary 3.1.11, pp. 85–88). Identify the pullbacks of the center,
  derived group, scheme of maximal tori and scheme of Borels at that stage with those over `R`
  by their base-change isomorphisms; two such choices agree after passage to a common stage.

  Extend the reductive and semisimple predicates and the constructions above to an arbitrary
  scheme `S`: a group scheme affine over `S` is reductive, or semisimple, when its restriction
  to every affine open of `S` is, using the Hopf presentations over the affine opens, and the
  invariance statements above hold for
  base change along every scheme morphism `S′ → S`. Prove the affine-local gluing comparison:
  for an open cover of `S`, the relative center, derived subgroup, scheme of maximal tori and
  scheme of Borels constructed on its members restrict to the corresponding constructions on
  the overlaps, satisfy the cocycle equation and glue to the schemes representing these
  functors over `S`. The gluing is independent of the cover and compatible with every pullback
  `S′ → S`. The Borel scheme is glued as a scheme, not as an affine scheme.

  For each fixed split reductive model G₀ over S, construct its automorphism sheaf and its
  inner/outer and pinned-automorphism interfaces, and the actual `Isom(G₀,G)` torsor.
  Prove the equivalence between étale forms of G₀ and torsors under this automorphism sheaf
  by effective affine descent, with inverse functors and the resulting nonabelian H¹
  classification. Use SchemeAndStackFoundations §1.1 and §§1.13–1.16 and ModularCurves §0E
  for the sheaf, torsor, twisting and effective affine descent operations; prove their
  compatibility with the specified group automorphism and Isom sheaves here. This classifies forms with that specified split type; it asserts
  no chosen global splitting or Borel on every base. Include a nonsplit real torus and
  SL₂ versus PGL₂ as tests of the Galois/root-datum and global-form distinctions.
  (Conrad, Reductive Group Schemes, Definition 3.1.1, p. 81, for the fibrewise definition;
  Theorem 3.3.4, p. 98, for the centre of multiplicative type and the reductive quotient;
  Theorem 5.3.1, pp. 160–161, for the derived group; Theorems 3.2.6 and 5.2.11, pp. 94–95 and
  157–158, for the schemes of maximal tori and of Borels;
  Theorems 6.1.16–6.1.17, pp. 196–197, for the relative isogeny and isomorphism theorems.)
  *Needs:* Layer 0's dictionaries and base change; Layers 3–4 for the field-level
  comparisons; Layers 5–7 for the geometric radicals, the reductivity predicate over fields and
  root-datum extraction on the fibres; Layer 9's split integral models;
  SchemeAndStackFoundations §0.9 for the finite-presentation comparison, §1.1 for descent and
  gluing along open covers, §§1.13–1.16 and ModularCurves §0E. For the multiplicative-type
  theory over `S`: the pinned
  `TauCeti.DiagonalizableGroup.groupScheme`, `TauCeti.DiagonalizableGroup.fullyFaithfulSchemeFunctor`,
  `TauCeti.DiagonalizableGroup.isShortExact_mapDomainBialgHom_iff`,
  `TauCeti.multiplicativeTypeAffineGroupSchemeProperty` and the finite splitting field of a group
  of multiplicative type (supplier contracts); SchemeAndStackFoundations §0.9 for the reduction
  to a noetherian base; EtaleCohomologyFoundations F.0.1 for étale module sheaves and their
  stalks; and F.0.2 for the étale fundamental group and its monodromy equivalence.

- **Pseudo-reductive basic theory over arbitrary fields.** For any field k, the basic theory
  is pinned and consumed (supplier contracts): the native k-unipotent radical with its
  isomorphism transport, the predicate `TauCeti.pseudoReductiveCommHopfAlgProperty` (smooth,
  geometrically connected, trivial k-unipotent radical), reductive implies pseudo-reductive
  (`TauCeti.reductiveCommHopfAlgProperty.pseudoReductive`), equality over an algebraically closed
  field (`TauCeti.pseudoReductiveCommHopfAlgProperty_iff_reductive`), pseudo-reductivity of the
  represented quotient `G/R_(u,k)(G)` of a smooth geometrically connected `G`
  (`TauCeti.FiniteTypeCommHopfAlgCat.pseudoReductive_coinvariants_unipotentRadical`), and the
  failure for `𝔾_a`. Prove equality of the two notions over perfect fields, by Galois descent of
  the geometric unipotent radical (Layer 5's radical comparison). For a finite separable
  extension K/k, prove that the k-unipotent radical commutes with extension to K, hence
  pseudo-reductivity is preserved and reflected by that extension; extend both statements, with
  the radical base-change isomorphism, to every separable algebraic extension. Do not claim
  pseudo-reductivity survives arbitrary inseparable extension: for an inseparable extension
  K/k prove only that `R_(u,k)(G)_K` is contained in the K-unipotent radical of `G_K`.
  Identify the radical after algebraic closure and the obstruction to descending it. Keep the
  schematic center without an unproved smoothness assertion.

  For every nontrivial finite purely inseparable extension K/k, take `Res_(K/k) 𝔾_m` to be the
  pinned Weil restriction of the multiplicative group, with points
  `TauCeti.Algebra.WeilRestriction.multiplicativeGroupPoints` (`(K ⊗_k A)ˣ` over every
  commutative k-algebra A), and with smoothness, commutativity and geometric connectedness
  supplied by `TauCeti.Algebra.WeilRestriction.instSmooth`,
  `TauCeti.Algebra.WeilRestriction.instIsCocomm` and
  `TauCeti.Algebra.WeilRestriction.geometricallyConnectedCommHopfAlgProperty_multiplicativeGroup`.
  Prove it pseudo-reductive and not reductive. On an algebraic closure, identify `K ⊗_k k̄` as a
  local algebra with residue field k̄; the units have quotient `𝔾_m` and unipotent kernel
  `1 + nilradical` of dimension `[K:k] − 1`, so the group is not reductive. Prove the kernel
  filtration by powers of the nilradical and its additive successive quotients. Prove the
  k-unipotent radical is trivial using the Weil adjunction and the absence of characters of
  unipotent groups, rather than deducing it from the geometric fibre. Give coordinate
  calculations for `K = k(a^(1/p))`, and recover `𝔾_m` when K = k. Develop homomorphism,
  product, central-subgroup and quotient API at the hypotheses proved here; no general closure
  under inseparable base change is implicit. These are basic-theory and example targets. They
  neither assume nor substitute for a full classification of pseudo-reductive groups over all
  imperfect fields.
  (Conrad–Feng, *Reductive Groups over Fields*, Appendix F: the definition of
  pseudo-reductivity and Proposition F.5.10, p. 218; Theorem F.3.7, p. 208, for the
  compatibility of the `k`-split unipotent radical with separable extensions; Conrad–Gabber–Prasad,
  *Pseudo-reductive Groups*, 2nd ed., Definition 1.1.1 and Proposition 1.1.9, for the
  separable-extension compatibility of `R_(u,k)`; Milne, 6.47 and 6.48, p. 136, for a
  pseudo-reductive group that is not reductive and whose geometric unipotent radical is not
  defined over `k`.) *Needs:* the pinned pseudo-reductive theory
  and Weil restriction of `𝔾_m`; Layer 5's radical comparison; Layer 0's Hopf dictionary.

### Examples

**Checks.**
- `SL₂` and `PGL₂` over `ℤ` realize the simply connected and adjoint root data of type `A₁`;
  the isomorphism theorem distinguishes them although their Dynkin diagrams agree, by the
  index-two lattice inclusion of 9B.2–9B.3.
- The root-free data of ranks 0 and 1 have the same empty Dynkin diagram and realize the
  trivial group and `𝔾_m`, of dimensions 0 and 1: the diagram does not see the central torus.
- Over `ℝ` the split torus `𝔾_m` and the norm-one torus `x² + y² = 1` have the same
  geometric root datum (rank one, no roots) and are classified as forms of `𝔾_m` by
  `H¹(Gal(ℂ/ℝ), Aut(𝔾_m)) = H¹(ℤ/2, ℤ/2) = ℤ/2`: exactly two forms, the split and the
  anisotropic one.
- For `K = k(a^(1/p))`, `Res_(K/k) 𝔾_m` has dimension `p`, `k`-points `Kˣ`, and after base
  change to `k̄` becomes `(k̄[t]/(t^p))ˣ = 𝔾_m × (1 + nilradical)`, with unipotent kernel of
  dimension `p − 1`; the `k`-unipotent radical is trivial, so the group is pseudo-reductive
  and not reductive. For `K = k` it is `𝔾_m`, reductive.
- For `k = 𝔽₂(t)` and `K = k(√t)`, `K ⊗_k k̄ = k̄[ε]/(ε²)`; its units are the `c(1 + aε)`, and
  the product of `c(1 + aε)` and `d(1 + bε)` is `cd(1 + (a + b)ε)`, so the unipotent kernel is
  `𝔾_a`, while the `k`-unipotent radical is trivial. For `k = 𝔽₃(t)` and `K = k(t^(1/3))`, `K ⊗_k k̄ = k̄[ε]/(ε³)`, and the
  product of `1 + aε + bε²` and `1 + cε + dε²` has `ε²`-coordinate `b + d + ac`: the
  two-dimensional kernel has a filtration with two additive one-dimensional quotients, but its
  group law in the coordinates `(a, b)` is not coordinatewise addition.
- The centre of `SL_p` in characteristic `p` is `μ_p`, nonsmooth, while the centre of
  `GL_p` is the smooth torus `𝔾_m`: the relative centre is of multiplicative type but not
  always smooth. For SL₂ over ℤ[ε]/(ε²), every geometric fibre has
  dimension 3 and the group is reductive; the base itself is nonreduced.
- For R=𝔽₂[x₀,x₁,…], the ideals (x₀,…,xₙ) strictly increase, so R is not
  Noetherian. SL₂,R is the base change of SL₂,ℤ: it is smooth of relative
  dimension 3 with connected reductive geometric fibres. Its centre is μ₂,R,
  finite locally free of rank 2 but nonsmooth: t²−1=(t−1)² and its derivative
  is 2t=0. Both the group and centre belong to this arbitrary-base lane.
- For `𝔾_m` over `Spec ℤ` the center is `𝔾_m`, the derived group is trivial, and the
  scheme of maximal tori and the Borel scheme are both `Spec ℤ`; all four pull back unchanged
  to `ℤ/4`. For `SL₂` over `Spec ℤ` the derived group is `SL₂` and the Borel scheme is `ℙ¹_ℤ`,
  with 3 rational points on the `𝔽₂`-fibre; the center `μ₂` has length 2 and tangent
  dimension 1 on that fibre, so smoothness of `G` does not give smoothness of its center.
- For `R = k[x₁, x₂, …]`, `GL₂,R` has center `𝔾_m,R`, derived group `SL₂,R` and Borel scheme
  `ℙ¹_R`, of relative dimensions 1, 3 and 1, all pulled back from `k`. Descending to
  `k[x₁, …, xₙ]` by the finite-presentation comparison and extending back to `R` gives the
  same three schemes.
- Over `S = Spec(k × k)` the fixed pinned `GL₂` datum realizes `GL₂` on both components: the
  center has ranks `(1, 1)`, the derived groups have dimensions `(3, 3)` and the Borel fibres
  are `(ℙ¹, ℙ¹)`. Replacing one component by `SL₂` gives character ranks `(2, 1)`, which no
  fixed split datum realizes.
- On the two standard charts of `ℙ¹_k`, the center of `GL₂` is the scalar matrices `aI`, which
  the transition `t ↦ t⁻¹` leaves unchanged; the glued center is `𝔾_m` over `ℙ¹_k` and the glued
  Borel scheme is `ℙ¹ × ℙ¹ → ℙ¹_k`, of relative dimension 1.
- For the zero ring the base is empty, there are no geometric fibres, and the
  unique group scheme is reductive and semisimple by the fibrewise conditions;
  classification by a specified root datum still requires a nonempty base, since the
  root data of ranks 0 and 1 both realize this one group scheme.
- Over `S = Spec ℤ` every group of multiplicative type is split: `Spec ℤ` is normal and
  irreducible, its étale fundamental group is trivial because every number field other than `ℚ`
  is ramified at some prime, so the locally constant character sheaf is constant (Conrad,
  Reductive Group Schemes, Corollary B.3.6, p. 293). Over `S = Spec ℤ[1/2]` the norm-one torus
  `x² + y² = 1` has character sheaf `ℤ` with `π₁` acting through `Gal(ℚ(i)/ℚ)` by `−1`; it splits
  over `ℤ[1/2, i]` by `x + iy` and not over `ℤ[1/2]`. Its fibre over `𝔽₅` is split, since
  `−1 = 2²` there, so splitting over the base cannot be read off a single closed fibre.
- Inside `D_S(ℤ) = 𝔾_m` over `S = Spec ℤ`, the closed subgroup `μ_2 = Spec ℤ[t]/(t² − 1)` is
  flat and of multiplicative type, `D_S(ℤ/2)`. The closed subscheme `H` cut out by `t² − 1` and
  `2(t − 1)` contains the identity section and is a subgroup, since `2(u − 1) = 2(v − 1) = 0`
  gives `2(uv − 1) = 2u(v − 1) + 2(u − 1) = 0`; with `s = t − 1` its coordinate ring is
  `ℤ[s]/(s², 2s)`, which has `2`-torsion, so `H` is not flat over `ℤ`: its fibre over `ℚ` is
  trivial and its fibre over `𝔽₂` is `μ_2`. It is not of multiplicative type, and the fppf
  hypothesis of the subgroup statement excludes it.
- Over the disconnected base `S = Spec(k × k)`, `D_S(ℤ)` is `𝔾_m` on each of the two points,
  so its endomorphisms are the pairs `(t ↦ tᵃ, t ↦ tᵇ)`, a group `ℤ × ℤ`, while `End(ℤ) = ℤ`.
  The functor `M ↦ D_S(M)` is faithful there but not full, which is why the pinned full
  faithfulness assumes a connected base. Over the zero ring every `D_S(M)` is empty and the
  functor is not faithful: `ℤ → ℤ`, `n ↦ 2n`, and the identity give the same map.

### Dependencies

Layers 0, 3, 4, 5, 6, 7, 8.1–8.2 and 9; Tau Ceti's Cartan–Killing classification and numbered root data (supplier contracts); SchemeAndStackFoundations §§0.9, 1.1 and
1.13–1.16; ModularCurves §0E; EtaleCohomologyFoundations F.0.1–F.0.2; Tau Ceti's diagonalizable
group schemes and multiplicative-type theory, pseudo-reductive theory and Weil restriction of
`𝔾_m` (supplier contracts).

## Layer 9E: Steinberg endomorphisms and extension of Layers 7a–7f

Let `σ:G→G` be a surjective algebraic-group endomorphism of a connected reductive group over
an algebraic closure of a finite field. A Steinberg endomorphism here means that some positive
power `σ^m` is the q′-power Frobenius attached to an `F_{q′}`-structure on `G`. State the
characteristic, finite-type, smoothness, and connectedness assumptions; include diagram
automorphism twists and special isogenies only when this power condition is proved. Prove point
and algebraic compatibility needed to construct the finite group `G^σ`. For each stable closed
subgroup `H`, specify the restricted endomorphism `σ|_H` and verify that its positive power is
the restricted q′-power Frobenius from the induced `F_{q′}`-structure. Layer 7a's Lang theorem
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
§9B's pinned groups, explicit carriers and special isogenies.

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
- The standard `q`-Frobenius is Steinberg with `m = 1` and `G^σ = G(𝔽_q)`; `GL₁^σ` has `q − 1`
  elements. For `𝔾_a` with `σ = F` the Lang map `x ↦ x^q − x` is surjective with kernel `𝔽_q`
  of order `q`.
- The unitary twist `σ(g) = (F(g)ᵀ)⁻¹` on `GL_n` has `σ² = F_(q²)`, so `m = 2`. Its fixed
  points on `GL₁` are the `q + 1` solutions of `a^(q+1) = 1`, while `GL₁^(σ²)` has `q² − 1`
  elements: `G^σ` is not `G^(σ^m)`. On the diagonal torus of `GL₂` the restriction
  `σ|_T(diag(a,b)) = diag(a^(−q), b^(−q))` squares to `F_(q²)|_T`, and `T^σ` has `(q + 1)²`
  elements.
- The inversion `g ↦ g⁻¹` of `𝔾_m` is not Steinberg although its fixed-point set `μ₂` is
  finite: its square is the identity, whose fixed points `𝔾_m(F̄_q)` are infinite, whereas
  every power of a Frobenius has finitely many fixed points.

### Dependencies

Layers 7a–7f and 9A–9D.

## Layer 10: rational representations, highest weights and regular functions

#### 10A. The rational category and actual torus lattice

Use Layer 1's existing right O(G)-comodules and their actual coefficient maps,
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

Differentiate a rational action through 9C: `E_α^(n)` is the coefficient of t^n
in the action of x_α(t), and `binom(H_y,n)` acts on weight λ by
`binom(⟨λ,y⟩,n)`. Construct the integration comparison using a rational T-action
with those toral equations, root weight shifts and local finiteness, verifying
actual group/root relations. For finite modules the finite weight set supplies
the root-action finiteness; for general modules require a directed union of
finite-dimensional compatible submodules. Do not identify all abstract finite
Dist(G)-modules with rational G-modules: already Dist(𝔾_m) permits p-adic
binomial characters without an integer rational character. Full X-integrality
and T-compatibility are part of the integration interface.

*Needs:* Layer 1's rational actions and comodules; Layer 4's split torus/character
comparison; §9B's group/root relations; §9C's distributions, toral equations and
root coefficient operators. No contraction functor is an input to integration.

**Checks.**
- For `𝔾_m`, the comodule `k` with coaction `v↦v⊗t^λ` has weight `λ`, and `binom(H,n)` acts by
  `binom(λ,n)`: `λ=3`, `n=2` gives `3`. The standard module of `SL₂` has formal character
  `t+t⁻¹`, its dual the negated weights (the same character), and its tensor square `t²+2+t⁻²`
  by convolution.
- Over `k=𝔽_q` the characters `t↦t` and `t↦t^q` of `𝔾_m` agree on `𝔾_m(𝔽_q)` but are distinct
  rational characters, `1≠q` in `X=ℤ`, with distinct formal characters: an action on `G(k)`
  alone is not the rational representation.
- Weights `λ` and `λ+p` give the same eigenvalue of `H` in characteristic `p`, while
  `binom(H,p)` separates them: for `p=2`, `binom(0,2)=0` and `binom(2,2)=1`.
- A `Dist(𝔾_m)`-module without rational character: over a field of characteristic 2 let
  `α=−1/3=1+4+16+…∈ℤ₂` and let `binom(H,n)` act by `binom(α,n)` modulo 2. By Lucas,
  `binom(α,2^r)` is the `r`-th binary digit of `α`, alternating `1,0,1,0,…`, whereas for an
  integer `λ` the sequence `binom(λ,2^r)` modulo 2 is eventually `0` (`λ≥0`) or eventually `1`
  (`λ<0`). No `λ∈X` matches, so this module is not the differential of a rational character.

##### 10A.1 Frobenius contraction of rational modules

For a split reductive G in characteristic p>0, construct the contracted rational
module on μ₀M using §9C's corner map φ and this section's integration comparison.
Its weights pλ are relabelled λ; verify the toral equations, root weight shifts
and local finiteness before integrating. For arbitrary rational M, take its directed
union of finite rational submodules. Prove functoriality, exactness and
(F* N)^φ≃N, with N on the identified relative Frobenius target. Keep the pinned
split form and scalar-twist identification explicit over a nonperfect field
(Gros–Kaneda, arXiv:1712.06835v2, §2(2.1), p. 6, for the algebraically closed
case; descent along a faithfully flat algebraic closure uses §9C's pinned F_p-form).
The geometric splitting of flags, trace normalization and Schubert compatibility
are applications in SchubertGeometry, not premises of distributions or integration.
*Needs:* §9C's Frobenius map, toral idempotent and corner section;
§10A's rational (Dist(G),T) integration comparison.

**Checks.**
- On 𝔾_m, a weight p line contracts to a weight 1 line: binom(H,p) acts
  by binom(p,p)=1. A weight 1 line contracts to zero.
- At p=2 two weight 1 lines each contract to zero, but their tensor has
  weight 2 and contracts to a weight 1 line. Contraction is not monoidal.
- For every p, weights 1 and p−1 both contract to zero while their tensor, of
  weight p, contracts to a weight 1 line: at p=3, μ₀=binom(H−1,2) acts on the
  weights 1, 2 and 3 by binom(0,2)=0, binom(1,2)=0 and binom(2,2)=1.
- The zero module contracts to zero; Frobenius pullback of the weight −1 line
  has weight −p and contracts back to weight −1, including its torus action.

#### 10B. Induction, Weyl modules and simple heads

For a split connected reductive G over a field fix B⁺ and its opposite B⁻,
with positive roots from B⁺. Consume Layer 1.1's cotensor induction and adapters: the equalizer for the
coordinate bialgebra map, its native comodule coaction and natural reciprocity maps,
specialized to k, in the convention `f(gh)=h⁻¹f(g)` with left translation.
Construct the field regular-function and group-scheme dictionaries and identify counit
evaluation in Frobenius reciprocity (Milne, 22.29, pp. 470–471). The induced/Weyl/highest-weight
and integral applications are this layer's. Put `∇(λ)=Ind_(B⁻)^G k_λ`: its functions satisfy
`f(gb)=λ(b)^(−1)f(g)` and G acts by `a·f(g)=f(a^(−1)g)`. For λ∈X⁺ prove
finite dimensionality, highest weight λ and its one-dimensional B⁺-highest
line, and simple socle L(λ). For λ∉X⁺ prove the corresponding induced module
zero (Milne, Definition 22.21 and Proposition 22.27, pp. 468–470, transported from B⁺
to B⁻). Construct `Δ(λ)=∇(−w₀λ)*`, its distinguished generating highest line,
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
not an implicit self-duality assertion. The ordinary-dual convention is Milne,
§22a, “The highest weight of the contragredient representation”, p. 471; the
integral Weyl lattice and top-normalized contravariant form are Fang–Lim–Tan,
arXiv:1904.13040v2, §2.1, pp. 2–3, which treats split connected reductive integral
models and retains the torus action in its distribution description.

Prove root-subgroup generation, highest-weight order and Weyl-orbit convex-hull
bounds in `(X⊗ℝ)`, retaining central coordinates. A unique highest line does not
by itself imply generation or simplicity. In a module generated by a
one-dimensional highest line prove the unique maximal proper submodule/head
by the top-weight argument; use generation, not bare cyclicity. Prove simple
highest-weight uniqueness through the cyclic span of two chosen highest vectors
in their direct sum and its two projections. Preserve disconnected/nonreduced
rational categories from Layer 1; this dominant-weight classification is for the
stated split connected reductive hypothesis.

The induced, Weyl and dual constructions carry the following further equations.

- The normalized map `Δ(λ)→∇(λ)` sends the chosen highest vector of `Δ(λ)` to the chosen
  highest vector of `∇(λ)`.
- The pinned anti-involution τ fixes T, sends `x_α(a)` to `x_(−α)(a)` for every simple root α
  and every a, reverses multiplication and squares to the identity. Its distribution map
  reverses products and sends `E_α^(n)` to `E_(−α)^(n)` for simple α.
- Contravariant duality `D_τ` preserves each torus weight, reverses arrows and short exact
  sequences, and commutes with field extension, as does its evaluation biduality isomorphism;
  ordinary duality negates weights.
- The integral contravariant form takes the value 1 on the chosen highest vector paired with
  itself, satisfies `(uv,w)=(v,τ(u)w)`, and induces the normalized map `Δ(λ)→D_τΔ(λ)≃∇(λ)`.
  The evaluation pairing with the full dual stays perfect when this form becomes degenerate
  after specialization.

For split simply connected semisimple G in characteristic p>0, let
`ρ=½Σ_(α>0)α`, which is in this group's actual X. Construct the algebraic
Steinberg theorem before any flag splitting/Schubert cohomology:
`Δ((p−1)ρ)≃L((p−1)ρ)≃∇((p−1)ρ)`, of dimension `p^|Φ⁺|`
(Riche, *Lectures on modular representation theory of reductive algebraic groups*,
Chapter 1, §2.9.1, p. 50, and Remark 1.23, p. 27; also Jantzen,
*Representations of Algebraic Groups*, 2nd ed., Part II, §§3.18–3.19).
Riche's statement uses linkage over an algebraically closed field; it certifies
this endpoint, not the truncated-PBW proof route below. The pinned F_p-form
and arbitrary-field base change are additional descent targets.
Give the truncated negative-root PBW model, root-distribution actions and the
nonzero extremal-vector equation, together with a normalized nondegenerate
contravariant pairing for the pinned Chevalley anti-involution. Prove its
F_p-form/base-change and all-prime cases, including p=2. For a general reductive
G use its derived simply connected cover when this module is needed; do not
assume `(p−1)ρ∈X(G)` or that the same module descends. SchubertGeometry owns
central-isogeny flag transport, anticanonical trace and the geometric splitting.
The Steinberg proof uses 9A/9C and 10A/10B algebra, not that later splitting,
vanishing or standard-monomial theorem.

*Needs:* Layer 1.1's algebraic induction and reciprocity; Layer 6's characteristic-zero
linear reductivity for `Δ=∇=L`; Layer 7's Borels and root-subgroup generation; §§9A–9C's
integral form, pinned models and distributions; §10A's rational weight/distribution
compatibility.

**Checks.**
- For `G=T=𝔾_m` and `λ=3`, `f(t)=t⁻³` satisfies `f(tb)=b⁻³f(t)`, while
  `(a·f)(t)=f(a⁻¹t)=a³f(t)`: the induced module is one-dimensional of weight `+3`, not `−3`.
  As `w₀=1`, `∇(−3)*` has weight `+3`, whereas `∇(3)*` would have weight `−3`.
- For `SL₂` and `λ=1`, `∇(1)` has weights `1` and `−1`, each of multiplicity one, and is the
  standard module in every characteristic.
- For `SL₂` in characteristic zero, `Δ(2)` has weights `2,0,−2` and dimension 3, as do its head
  and its image in `∇(2)`. In characteristic 2, `Δ(2)` still has dimension 3 but its head `L(2)`
  has weights `2,−2` and dimension 2, so the normalized map `Δ(2)→∇(2)` has one-dimensional
  kernel and Weyl modules are not universally simple.
- In `SL₂` take `τ(g)=gᵗ`: `τ(I+aE₁₂)=I+aE₂₁` and `τ(diag(t,t⁻¹))=diag(t,t⁻¹)`. With
  `u=I+E₁₂` and `v=I+E₂₁`, `τ(uv)=[[2,1],[1,1]]=τ(v)τ(u)`, whereas `τ(u)τ(v)=[[1,1],[1,2]]`.
- For the `𝔾_m` character `t³`, τ is the identity, so `D_τ` has weight `+3` and the ordinary
  dual weight `−3`; at `t=2` over ℚ these act by `8` and `1/8`, and σ sends `2` to `1/2`. For
  the standard `GL₃` module, `D_τ` has highest weight `(1,0,0)` and the ordinary dual
  `(0,0,−1)`; biduality sends each `eᵢ` to evaluation at `eᵢ`, with matrix `I₃`.
- For the rank-zero group and `λ=0` the Weyl lattice is `ℤ` and the normalized form is
  `(a,b)↦ab`. For `SL₂` and `λ=1` the basis `v, Fv` has Gram matrix `diag(1,1)`, still
  nondegenerate modulo 2. For `λ=2` the divided-power basis `v, Fv, F^(2)v` has Gram matrix
  `diag(1,2,1)`, of rank 3 over `ℚ` and 2 over `𝔽₂` with radical `𝔽₂Fv`, while the evaluation
  pairing with the integral dual still has matrix `I₃`.
- For SL₂ at p=2, (p−1)ρ=1 and Δ(1)=∇(1)=k² has dimension 2=2¹;
  the two root operators connect its weight 1 and weight −1 lines, so the
  rational module is simple even though those weights have the same Lie toral eigenvalue.
- At p=3, the SL₂ Steinberg module has basis x²,xy,y² and dimension 3=3¹;
  for the trivial semisimple group the empty positive-root set gives dimension p⁰=1.
- For PGL₂ at p=2, ρ is not in X=ℤα (ρ=α/2). The SL₂ module has a
  nontrivial schematic μ₂ action and does not descend, although μ₂ has only
  one geometric point.

#### 10C. Binary forms and the source's characteristic-p exercises

The binary forms are pinned and consumed (supplier contracts, *Binary forms and polynomial
representations of `GLₙ`*): Tau Ceti's `TauCeti.SpecialLinear.binaryForms` is the rational `SL₂`
module `R_n = k[x,y]_n` with `(g·f)(x,y) = f(dx − by, ay − cx)` for `g = [[a,b],[c,d]]`; over a
field `k y^n` is its unique `B⁺`-stable line, of weight `n`; its socle, generated by `y^n`, is
simple and lies in every nonzero submodule, so `R_n` is indecomposable; in characteristic
`p > 0`, with `n = Σ n_j p^j` and `0 ≤ n_j < p`, the socle has dimension `Π_j (n_j + 1)`
(`TauCeti.SpecialLinear.finrank_binaryFormsSocle_eq_prod_digits`), and highest-line generation
of `R_n` and simplicity of `R_n` both hold exactly when `n = (a+1)p^m − 1` for some `0 ≤ a < p`
and `m ≥ 0` (`TauCeti.SpecialLinear.isAtom_binaryForms_iff_of_charP`), including `n = 0`. In
characteristic zero `R_n` is simple for every `n`
(`TauCeti.SpecialLinear.isAtom_binaryForms_of_charZero`). In characteristic `p` and degree
`n = pm`, the forms in `x^p` and `y^p` are a nonzero rational submodule
(`TauCeti.SpecialLinear.frobeniusBinaryForms`), proper when `m > 0`, so `R_n` is not simple for
positive multiples `n` of `p` (`TauCeti.SpecialLinear.not_isAtom_binaryForms_mul_char`); in
degree zero this submodule is all of `R_0 = k`. On the dual, the annihilator of the socle is the
unique maximal proper submodule, `δ_(x^n)` generates `R_n*` for every `n`, and at `n = p` the
functional `δ_(x^(p−1)y)` spans a second `B⁺`-stable line.
Generation there means the smallest rational subcomodule, not only a `G(k)`-orbit span over a
finite field. The pinned module computes the examples in characteristic 3 and degree 4 (the
socle spans `x⁴, x³y, xy³, y⁴` and misses `x²y²`) and in characteristic 2 and degree 2 (`y²`
generates only the span of `x²` and `y²`, whereas `xy` generates all of `R₂`), which separates
bare cyclicity from generation by the highest line.

The targets are the identifications with the modules of 10B. Prove `R_n ≃ ∇(n)` and
`R_n* ≃ Δ(n)`, carrying the unique `B⁺`-stable line of `R_n` and the generating highest line
`k δ_(x^n)` of `R_n*` to the normalized highest lines of 10B, and prove that the socle of `R_n` is
`L(n)`, so that `dim L(n) = Π_j (n_j + 1)` by the pinned digit formula and the rank-one
simple-module construction. Root and torus action formulas, dual-basis signs and all source
exercises are applications of the same rational category.

**Checks.**
- In characteristic `0`, or for `p > n`, `R_n` is simple of dimension `n + 1`; `n = 0` is the
  trivial module in every characteristic, with `Π_j (n_j + 1) = 1`.
- `p = 3`, `n = 4 = 1 + 1·3`: `dim L(4) = 2·2 = 4`, with weights `±4, ±2`, so the socle of `R₄`
  is spanned by `x⁴, x³y, xy³, y⁴` and misses the weight-zero vector `x²y²`; `R₄` has dimension 5
  and is not simple, and `4 = (a+1)3^m − 1` has no solution with `0 ≤ a < 3`.
- `p = 2`, `n = 2`: `g·y² = c²x² + a²y²` has no `xy` term, so `y²` generates the span of `x²`
  and `y²`, while `g·(xy) = −cd·x² + (ad + bc)·xy − ab·y²` at `g = 1`, `[[1,1],[0,1]]` and
  `[[1,0],[1,1]]` gives three independent vectors, so `xy` generates all of `R₂`: cyclicity and
  highest-line generation differ.
- `n = p = 2` on `R₂*`: the `xy`-coefficient of `g⁻¹·x² = (ax + by)²` is `2ab = 0`, so the
  functional `δ_(xy)` spans a second `B⁺`-stable line, of weight 0; in characteristic `≠ 2` that
  coefficient is nonzero for `b ≠ 0` and the highest line `k δ_(x²)` is the only `B⁺`-stable
  line.

#### 10D. Algebraic Peter–Weyl and polynomial monoid actions

For linearly reductive affine groups over a field construct the cosemisimple
regular coefficient-coalgebra decomposition. Over an algebraically closed field,
identify it with `⊕_[V simple] V*⊗V` by
`φ⊗v ↦ (g↦φ(gv))`, with the action
`(a,b)·f(g)=f(a^(−1)gb)`. Hence the first factor acts on V* and the second on V.
For split connected reductive G in characteristic zero index these summands by
λ∈X⁺ using 10B. Keep regular O(G), not all set-valued, continuous or L² functions.
Export the coefficient equations, Schur/Frobenius reciprocity multiplicities,
unit/tensor-product multiplication, counit φ(v), antipode/dual and
`Δc_(φ,v)=Σ_j c_(φ,e_j)⊗c_(e_j*,v)` with the left factor first. For a nonsplit
field retain the actual simple coefficient coalgebras and End_G(V)-balanced
bimodule/coequalizer comparison and descent; do not assume every irreducible has
scalar commutant. No compact Haar/Peter–Weyl theorem substitutes for this algebraic
construction. In positive characteristic no direct sum of simple coefficients
is asserted to exhaust O(G).

**Checks.**
- For `𝔾_m` the simples are the characters `t^λ`, each coefficient coalgebra is `k·t^λ` with
  `Δ(t^λ)=t^λ⊗t^λ`, and their sum over `λ∈ℤ` is all of `O(𝔾_m)`. The two-sided action is
  `(a,b)·t^λ=a^(−λ)b^λ t^λ`, so the first factor acts through the dual character; the
  convention `f(agb⁻¹)` would put the dual on the second factor, and the two differ already at
  `λ=1`.
- For `SL₂` and `V=k²` the four coefficients `c_(e_i*,e_j)` are the matrix entries `a,b,c,d`,
  and `Δa=a⊗a+b⊗c` is the displayed sum with the left factor first. Over `𝔽₂` the module `R₂`
  of 10C has simple socle of dimension 2 and is not semisimple, so its coefficient coalgebra is
  not contained in the sum of the simple coefficient coalgebras, which therefore do not exhaust
  `O(SL₂)`.

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
Identify the degree-n polynomials in `(a,c)` under left translation with 10C's
actual contragredient binary-form module `∇(n)`. The actual right torus
`diag(t,t⁻¹)⊂SL₂` scales the first column by t and acts on degree-n functions
by the character `t↦t^n`, including n=0; arbitrary scalar matrices are not
being treated as elements of SL₂. Over characteristic zero compare this with the
preceding Cartan algebra; over positive characteristic retain 10C's simple
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

For `GLₙ` over a field, the extension criterion is pinned and consumed (supplier contracts): a
rational coaction extends uniquely to a comodule over the coordinate bialgebra of the matrix
monoid, `k[Mat_n] ⊂ k[GLₙ] = k[x_ij, det^(−1)]`, exactly when it takes values in polynomial
coordinates (`TauCeti.GeneralLinear.existsUnique_matrixMonoidComodule_iff`), equivalently when
every coefficient of a finite basis is polynomial
(`TauCeti.GeneralLinear.existsUnique_matrixMonoidComodule_iff_coefficientMatrix`); the extension
satisfies the unit and multiplication laws and agrees with the original action on points
(`TauCeti.GeneralLinear.endOfPoint_matrixMonoidComodule`), with `n = 0` included. Transport this
to `GL(V)` and `End(V)` for a finite-dimensional `V` through a basis, prove independence of the
basis, and identify the comodules over `k[End(V)]` with the actions of the monoid scheme `End(V)`
on its points over every commutative `k`-algebra. Construct homogeneous
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
distributions; 10A–10C; Tau Ceti's binary forms and matrix-monoid extension criterion
(supplier contracts); GroebnerGeometry G5 for the flag-minor comparison.

**Checks.**
- On the `SL₂/N⁺` overlap, `s_a·n(t)=[[a,at],[c,ct+a⁻¹]]`, and `t=−1/(ac)` gives
  `[[a,−c⁻¹],[c,0]]=s_c`; for `g=[[a,b],[c,d]]`, `u_c−u_a=d/c−b/a=(ad−bc)/(ac)=1/(ac)`.
- `1/a∈k[a,c]_a` is not in `k[a,c]_c`, and the intersection inside `k(a,c)` is `k[a,c]`; the
  origin of `Spec k[a,c]=A²_k` is the image of no point of `SL₂`, whose first columns are
  nonzero, so the quotient is quasi-affine and not `A²_k`. The torus `diag(t,t⁻¹)` sends `(a,c)`
  to `(ta,tc)` and acts on `a^ic^(n−i)` by `t^n`.
- Polynomiality: for `n≥1`, `det` has weight `(1,…,1)∈ℕⁿ` and is polynomial, while `det⁻¹` has
  weight `(−1,…,−1)` and is rational but not polynomial; for `n=1` the character `t^λ` of `GL₁`
  is polynomial exactly when `λ≥0`; for `n=0`, `k[End(0)]=k=k[GL₀]` and every rational module is
  polynomial.

### Examples

**Checks.**
- For `SL₂` in characteristic `p`, `dim L(p) = 2` (digits `n₀ = 0`, `n₁ = 1`, so
  `(0 + 1)(1 + 1) = 2`) while `dim ∇(p) = p + 1`: `∇(p)` is not simple.
- `∇(0) = Δ(0) = k`; for `n < 0`, `∇(n) = 0`, as `H⁰(ℙ¹, O(n)) = 0` for the corresponding
  line bundle.
- The Steinberg module of `SL₂` is `L(p − 1) = ∇(p − 1) = Δ(p − 1)` of dimension `p`, which
  is `p^|Φ⁺|` with `|Φ⁺| = 1` and also the digit formula `(p − 1) + 1`.

### Dependencies

Layers 1, 4, 6, 7 and 9; LieHighestWeight Layers 3–4; GroebnerGeometry G5; SchubertGeometry
only as a consumer.

---

## Layer 11: regular-semisimple spectral quotients and finite Weyl monodromy

This lane constructs the Lie-algebra spectral quotient and its based topology for every
connected reductive algebraic group over `ℂ`, with a specified maximal algebraic torus.
Construct it after Layers 9 and 9D have supplied the group/root-datum and pinned root maps.
Layer 3A.5 supplies, on the pinned classical topology on complex points, the complex-manifold
charts (3A.5d) and complex Lie-group structure on G(ℂ) (3A.5e),
holomorphic action maps and orbit comparisons on that carrier (3A.5f); the
analytic inverse function theorem used below is Mathlib's `ContDiffAt.to_localInverse` at
order `ω` on finite-dimensional complex charts. The algebraic classification and integral
construction have no dependency on this lane, and no roadmap that consumes Layers 0–9 is a
supplier of it. The finite-arrangement construction in 11B is independent of the group
application and uses the pinned Weyl Coxeter presentation `TauCeti.weylCoxeterSystem`. All of
11A–11G below is normative.

**11A. Plane configurations, geometric braids and their basepoints.** This roadmap owns the
ordered and unordered configuration spaces of the plane and of the open unit disc, the
equivariant homeomorphisms between them, and the based comparison between the plane
configuration spaces and the native braid group. Use
subtype topology on `PConf_n(ℂ)={z:Fin n→ℂ | Function.Injective z}` and quotient
topology on `Conf_n(ℂ)=PConf_n(ℂ)/S_n`. A consumer that models an unordered configuration as
an `n`-element subset of `ℂ` transports this quotient topology along `[z]↦{z_1,…,z_n}`; no
discrete topology on `Finset ℂ` is intended.
The elementary carriers are `PlaneBraidAcceptance.OrderedPlane` and
`PlaneBraidAcceptance.UnorderedPlane`. Permutations act by `(σ·z)_i=z_(σ⁻¹ i)` via
`PlaneBraidAcceptance.permute` and `PlaneBraidAcceptance.planePermutationAction`.
The standard points are `PlaneBraidAcceptance.planeBase` and
`PlaneBraidAcceptance.unorderedBase`. For `i<n−1`, `PlaneBraidAcceptance.halfTwist n i t`
is the configuration at time `t` in which the points `i` and `i+1` have turned through the
angle `πt` counterclockwise about `i+1/2`, the others fixed:
`z_i=i+1/2−exp(πtI)/2` and `z_(i+1)=i+1/2+exp(πtI)/2`, where `I=√−1`.
`PlaneBraidAcceptance.halfTwist_injective` keeps its points distinct, and
`PlaneBraidAcceptance.halfTwistLoop n i` is the resulting based loop of unordered
configurations. `PlaneBraidAcceptance.plane_braid` states the based group equivalence
`π₁(Conf_n(ℂ),[b]) ≃ TauCeti.BraidGroup n` sending the class of `halfTwistLoop n i` to the
native generator `TauCeti.BraidGroup.sigma i`; this is Artin's theorem in generator-characterized
form. `PConf_n(ℂ)` is path connected, being the complement of the finitely many complex
hyperplanes `z_i=z_j`, so basepoint change along a path gives an isomorphism of the
fundamental group of `Conf_n(ℂ)` at the class of every `z∈PConf_n(ℂ)` with
`TauCeti.BraidGroup n`; this is a target as well.

**API.**
- The action preserves distinctness, and the quotient identifies exactly permutation orbits.
- The subtype and quotient topologies make the order-forgetting projection continuous.
- Since `PConf_n(ℂ)` is open in `ℂⁿ` and stable under permutations, the quotient map of `ℂⁿ`
  by Mathlib's `arrowAction` of `S_n` restricts to an open quotient map from `PConf_n(ℂ)` onto
  its image, which is therefore homeomorphic to `Conf_n(ℂ)`.
- The chosen ordered basepoint projects to the chosen unordered basepoint for every n.
- The half-twist configuration is the base configuration at time 0 and the base
  configuration with the points `i` and `i+1` exchanged at time 1; it is continuous in `t`.
  The moving points stay at distance 1/2 from `i+1/2` on opposite sides, and every fixed
  point is an integer at distance at least 3/2 from it, so the configuration is injective
  and the loop closes in the quotient.

**Checks.**
- For n=0 the ordered and unordered configurations are points and the braid group is 1;
  for n=1 both configuration spaces are ℂ and their fundamental groups are 1.
- For n=2 the base tuple is (0,1); the transposition sends it to (1,0), with the same
  unordered image. The tuple (0,0) fails injectivity and is excluded.
- For n=3, (012) sends (0,1,2) to (2,0,1); using the permutation rather than its inverse
  would give (1,2,0) and reverse the stipulated left action.
- For n=2, i=0 and t=1/2 the half-twist is (1/2−I/2, 1/2+I/2): the point that started at 1
  is in the upper half-plane, so the turn is counterclockwise; the clockwise convention
  would put it at 1/2−I/2. At t=1 the configuration is (1,0), the transposition of (0,1).
- For n=3 and i=0 the fixed point 2 is at distance 3/2 from the midpoint 1/2, three times
  the radius 1/2 of the turning points, so no collision occurs; for i=1 the fixed point 0
  is likewise at distance 3/2 from 3/2.

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
§7, pp. 122–126, and Fadell–Neuwirth, *Configuration spaces*, Math. Scand. 10 (1962),
§II, Theorem 3, p. 114, for the forget-last-point fibration, and Theorem 1, Theorem 2 and
Corollary 2.1, pp. 111–113, for the fundamental sequence of fibrations and asphericity). *Needs:* Mathlib's fundamental group, covering maps and `IsQuotientCoveringMap`;
Tau Ceti's braid group, `permHom` and `pureSubgroup`; AlgebraicTopology's based van Kampen
theorem, whose two-set form is the pinned `TauCeti.isPushout_fundamentalGroup`.

Construct the ordered and unordered configuration spaces of the open unit disc
`D={w∈ℂ | |w|<1}` in the same way. The homeomorphism `z↦z/sqrt(1+|z|²)` of `ℂ` onto `D`, with
inverse `w↦w/sqrt(1−|w|²)`, induces `S_n`-equivariant homeomorphisms between the ordered
configuration spaces and between the unordered ones. Prove their inverse, continuity,
noncollision and cover equations. Transport basepoints to a chosen disc configuration by the
resulting actual image or by a specified path.

For a lifted loop, its coordinate graphs in `ℂ×[0,1]` are collision-free strands; evaluation
of such strands gives the inverse loop. Prove both constructions respect endpoint
permutations and relative homotopies. Pin multiplication: Mathlib's fundamental-group
product is `p*q=q.trans p`. Choose strand stacking to match that product and check an
explicit product of two elementary half-twists; if another stacking convention is used,
construct the time-reversal/opposite-group comparison. The positive half-twist is the
counterclockwise exchange above; prove the permutation square after this convention is
fixed. Closure and Markov equivalence are not substitutes for this based loop/strand theorem.

Prove the exact sequence
`1→P_n→B_n→S_n→1`. It is nonsplit for `n≥2`, and this is a target: for every `n≥2`, native
`TauCeti.BraidGroup.permHom n` has no group-homomorphic section. The sign of native `permHom` is
the parity of native `ArtinGroup.exponentSum`. A homomorphic section would lift a transposition
to an order-two element, whose integer exponent sum is zero, contradicting odd parity. Prove
the sign/exponent equation on generators and extend by native homomorphism extensionality.
For n=2 the map is ℤ→C₂ by parity, its kernel is 2ℤ, and a section would send
 the nonidentity to an integer m with 2m=0 and odd parity, impossible. For n=3, every
proposed lift of (12) likewise has odd exponent sum, while its square has exponent sum twice
that odd integer and so is not the identity.
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
prove the homotopy or sufficient two-skeleton comparison using the based van Kampen
and CW-cell interfaces of [AlgebraicTopology Stages 1 and 4](../AlgebraicTopology/README.md).
The homotopy comparison consists of maps from the realization of the Salvetti complex to
`V_reg` and back, together with `W`-equivariant homotopies of both composites to the identity;
these induce the quotient comparison. Apply the construction to the essential arrangement on
the root span and contract the `W`-fixed central vector summand separately.
One route uses Salvetti's explicit cell embeddings and homotopy (Part One,
pp. 608–611, Theorem 1); the reflection-equivariant comparison is stated in
Callegaro, §2.2, Theorems 2.4–2.5, p. 272. The explicit source homotopy, rather
than an unspecified good-cover lemma, supplies this route's comparison. In the quotient, prove
there is one vertex, one oriented one-cell for each simple wall and exactly the rank-two
alternating-word relations of length `m_ij`. Both generation and completeness of the
relations are targets. This gives a generator-characterized based isomorphism
`π₁(B_W,[b]) ≃ TauCeti.ArtinGroup (coxeterMatrixOfBase P base)` at a specified chamber point,
with explicit basepoint-change transport for any other basepoint (Brieskorn, *Die
Fundamentalgruppe des Raumes der regulären Orbits einer endlichen komplexen
Spiegelungsgruppe*, Satz, p. 57, for the complete presentation, restated in his Bourbaki
exposé *Sur les groupes de tresses*, Proposition 1, p. 25; Salvetti, Part Two, pp. 611–616,
for the two-skeleton presentation route).
The source presentation is for finite real reflection groups; this layer uses
its crystallographic subclass. A W-fixed central summand is a contractible factor.
The headline `ReflectionArrangementAcceptance.nonempty_mulEquiv_artinGroup` states the existence of
this isomorphism at the class of every regular point: a finite reduced crystallographic root
pairing `P` over `ℂ` whose coroot space is an arbitrary finite-dimensional complex vector space
with its module topology (`IsModuleTopology`), with a base, Mathlib's Weyl group
`P.weylGroup` acting on the coroot space through its opposite group (Mathlib's action of
`(Aut P)ᵐᵒᵖ` on the coroot space, the action underlying `weylGroupCorootRep`), whose image in
the linear automorphisms is the subgroup generated by the coreflections
`y ↦ y − ⟨α_i, y⟩ α_i^∨` (the pinned `RootPairing.range_weylGroup_coweightHom`), the complement
`ReflectionArrangementAcceptance.RegularCoroots` of the root hyperplanes there and its orbit space
`ReflectionArrangementAcceptance.RegularOrbits` with the quotient topology. Such a `P` is the
complexification of its rational form on the spans of its roots and coroots (Mathlib's
`RootPairing.restrictScalarsRat`), since the rational pairing between those spans is
nondegenerate, and the subspace on which every root vanishes is a `W`-fixed contractible factor;
the basis/dual-basis transport above reduces an arbitrary real realization to this statement, and
the standard-coordinate model `ℂ^κ` is the case of a chosen basis. Applied to the flipped pairing
the headline gives the same statement for the complement of the coroot hyperplanes in the root
space. The generator characterization and basepoint transport are the further targets of this
section.

**API.**
- The action of `P.weylGroup.op` on the coroot space preserves
  `ReflectionArrangementAcceptance.RegularCoroots`: for every root `α_j` and coreflection
  `s_i^∨`, `⟨α_j, s_i^∨ y⟩ = ⟨s_i α_j, y⟩`, and `s_i α_j` is again a root, so the coreflections
  permute the nonvanishing conditions. That the image of the Weyl group in the linear
  automorphisms of the coroot space is the subgroup generated by the coreflections is the
  pinned `RootPairing.range_weylGroup_coweightHom` and is not a target.
- For finite `ι`, a finite crystallographic pairing over `ℂ`, the Weyl group is finite: it
  permutes the finite set of coroots, fixes pointwise the subspace on which every root vanishes,
  and the coroot space is the direct sum of that subspace and the span of the coroots. The
  pinned `RootPairing.finite_weylGroup_of_span_eq_top` (Tau Ceti) assumes that the roots span,
  which this model does not.
- The action on `ReflectionArrangementAcceptance.RegularCoroots` is free: only the identity
  fixes a point at which no root vanishes.
- The orbit map from `ReflectionArrangementAcceptance.RegularCoroots` to
  `ReflectionArrangementAcceptance.RegularOrbits` is a finite covering map whose fibres are the
  orbits, each of cardinality the order of the group; both spaces are nonempty and path
  connected, so the fundamental group at the class of a regular point is independent of that
  point up to the basepoint-change isomorphism.

**Checks.**
- Rank one: `κ` a point, roots `±2` and coroots `±1` under the product pairing `⟨x, y⟩ = xy`.
  The coreflection is `y ↦ y − 2y = −y`, so the group is `{±1}`; the regular coroots are
  `ℂ ∖ {0}`; the orbit space is homeomorphic to `ℂ ∖ {0}` by `z ↦ z²`; and its fundamental group
  is `ℤ`, the Artin group of the `1 × 1` Coxeter matrix. Quotienting all of `ℂ` instead of the
  complement gives `ℂ/{±1} ≅ ℂ`, which is simply connected.
- No roots (`ι` empty): the regular coroots are all of `ℂ^κ`, the Weyl group is generated by
  the empty family of reflections, hence trivial, and the orbit space is `ℂ^κ`; both fundamental
  groups are trivial.
- Type `A₁ × A₁` on `ℂ²` with the dot product, roots `±2e₁`, `±2e₂` and coroots `±e₁`, `±e₂`:
  the regular coroots are `(ℂ*)²`, the group is the sign-change group `(ℤ/2)²`, the orbit space is
  homeomorphic to `(ℂ*)²` by squaring both coordinates, and the fundamental group is `ℤ²`, the
  Artin group with `m₁₂ = 2`.
- Type `A₂`: the regular coroots form the complement of three lines through `0` in `ℂ²`, whose
  first homology is `ℤ³`, one generator for each line; the Artin group
  `⟨g₁, g₂ | g₁g₂g₁ = g₂g₁g₂⟩` has abelianization `ℤ`. So omitting the quotient by the group
  computes the pure braid group on three strands, not the Artin group.
- Type `B₂` with the dot product, roots `±e₁`, `±e₂`, `±e₁ ± e₂`: the point `(1, 1)` is not
  regular, since `e₁ − e₂` vanishes there, and the coreflection `y ↦ (y₂, y₁)` fixes it; the point
  `(1, 2)` is regular, with values `1, 2, 3, −1` on the positive roots, and its orbit is the eight
  distinct points `(±1, ±2)`, `(±2, ±1)`, so the action there is free and the cover has eight
  sheets.

Consume the native `TauCeti.weylCoxeterSystem`, with its finite, reduced, crystallographic
and characteristic-zero-domain hypotheses, and transport it along the chosen coordinates.
Native `TauCeti.weylCoxeterHom` supplies the map and surjectivity, and
`TauCeti.weylCoxeterHom_injective` its injectivity. The Artin-to-W map is the native
`ArtinGroup.toCoxeterGroup` followed by the actual Weyl identification, not a private
presentation of a new group. Prove the geometric covering square, reflection-generator
normalization, and identify `π₁(V_reg,b)` with its kernel. Outside type A this is the pure
finite-type Artin group, not an ordinary `BraidGroup.pureSubgroup n`. The normalization is: the
loop in `B_W` around the `i`-th simple wall has a lift joining `b` to `s_i·b`, so its image in
`W` is `s_i`; its square lies in the pure kernel, and the inclusion of that kernel is induced by
`V_reg→B_W`. Changing the chosen chamber point transports each fundamental group along a
specified path and commutes with the covering homomorphism; changing that path changes the
identification by the corresponding inner automorphism. A product of root pairings gives the
product of the complements, of the quotient spaces and of the Salvetti homotopy types.

Include reducible products, exceptional types and the actual matrices with entries 4 and 6.
The empty-root case is a contractible central vector space with trivial groups. Rank 1 is
`ℂ*` with sign quotient and square cover. Type A agrees with 11A. B and C share the Weyl
arrangement, but retain their different root data. This lane asserts finite real Weyl
arrangements; it commissions no affine, infinite-type or general complex-reflection
asphericity statement.

**Checks.**
- With no roots in a real space of dimension `d`, `V_reg=ℂᵈ`, `W=1` and the covering has
  degree 1; at `d=0` the complement is one point, not empty.
- In `A₁×A₁` the covering is `(z,w)↦(z²,w²)`, of degree 4, and its map on fundamental groups
  `ℤ²→ℤ²` is `(a,b)↦(2a,2b)`. Adding a central `ℂ` factor leaves degree 4 and fundamental
  group `ℤ²`, not `ℤ³`.
- The rank-zero Salvetti model is a point, with one vertex and no edges; its fundamental group
  is trivial, agreeing with the empty-root complement.
- The `A₁` Salvetti model before the quotient has two vertices and two edges, so its
  fundamental group is `ℤ`; its `W`-quotient has one vertex and one loop, and the two-edge cycle
  upstairs traverses the quotient loop twice.
- For `A₁×A₁` the quotient two-skeleton has one vertex, two edges and one square, with relation
  `ab=ba` and fundamental group `ℤ²`. For `A₂` the attaching word gives `aba=bab`, for `B₂`
  `abab=baba` and for `G₂` `ababab=bababa`, of lengths 3, 4 and 6 on each side. Replacing every
  rank-two face by an `A₂` hexagon fails the `B₂` and `G₂` checks.

**11C. Algebraic invariant quotient and the discriminant base.** For the stated complex
reductive `G,T`, use Layer 2's actual tangent Lie algebra `𝔤`, torus Lie subalgebra `𝔱`, root
spaces and adjoint action. Prove that the Lie-algebra regular-semisimple locus consists
of the conjugates of `𝔱_reg`, that its centralizer is the conjugate torus, and that
intersections with `𝔱_reg` are exactly `W`-orbits. Regular alone is insufficient: the
centralizer of a regular nilpotent in `GL₂` is `ℂ*×ℂ`, not a torus. Keep this locus
separate from regular semisimple **group elements**, whose root hypertori lead to a
different toric arrangement.

Construct `χ:𝔤→Spec ℂ[𝔤]^G` and the restriction isomorphism
`ℂ[𝔤]^G ≃ ℂ[𝔱]^W`, with actual polynomial restriction maps. First construct the canonical
characteristic-zero splitting `𝔤=𝔷(𝔤)⊕[𝔤,𝔤]` and the corresponding symmetric-algebra tensor
isomorphism. Apply [LieHighestWeight Layer 7](../RepresentationTheory/LieHighestWeight/README.md)'s
Lie Chevalley restriction only to the Killing-semisimple summand, at its actual hypotheses;
the Killing form of all `𝔤` need not be nondegenerate. Prove the infinitesimal-to-group
invariant comparison in each finite homogeneous rational subrepresentation: connectedness,
root-subgroup exponentials and torus weights in characteristic zero show Lie-fixed equals
`G`-fixed. Prove central invariants factor because the group action on `𝔷(𝔤)` is trivial.
Consume the finite-group invariant algebra of
[ReflectionInvariantTheory §1](../ReflectionInvariantTheory/README.md) and its real reflection
invariant package of §3 (polynomial invariants, the finite quotient map, the Jacobian and
discriminant, and one degree-one invariant for each central fixed direction), complexified,
to obtain the actual affine quotient and its discriminant complement.
No canonical choice of polynomial invariant generators is asserted.

The base is the image of `𝔱_reg` in `𝔱/W`, the **discriminant complement**. It is not the
smooth locus of the full invariant quotient, which is already an affine space in this
setting. Construct all scheme morphisms before comparing their complex points via
Layer 3A.5d's charts and 3A.5c's point-map comparison. Prove the coarse orbit-space homeomorphism
`𝔤_rs/G ≃ₜ 𝔱_reg/W`. This is a coarse quotient; the stack `[𝔤_rs/G]` retains torus inertia.

**Checks.**
- For `𝔤𝔩₂`, `ℂ[𝔤]^G=ℂ[tr,det]` restricts to `ℂ[t₁+t₂,t₁t₂]=ℂ[𝔱]^(S₂)`; the splitting is
  `𝔤𝔩₂=ℂ·I⊕𝔰𝔩₂` with `tr` the degree-one central coordinate, and the discriminant is
  `tr²−4det=(t₁−t₂)²`.
- The regular nilpotent `[[0,1],[0,0]]` has `χ=(0,0)`, the value at `0`, so it lies over the
  discriminant locus and is not in `𝔤_rs`; its centralizer `{[[x,y],[0,x]]}` is `ℂ*×ℂ`. The
  element `diag(1,2)` has `χ=(3,2)`, discriminant `1≠0`, and centralizer `T`.
- `𝔱/W` for `𝔤𝔩₂` is `𝔸²`, smooth everywhere, and the base is the proper open subset
  `tr²−4det≠0`; for a torus `G=T`, `W=1`, `𝔤_rs=𝔤`, `χ` is the identity and the base is all
  of `𝔱`.

**11D. Cameral product, local trivializations and homogeneous fiber.** Construct the
pullback `E={(x,t)∈𝔤_rs×𝔱_reg | χ(x)=[t]}` and the map
`(G/T)×𝔱_reg→E`, `([g],t)↦(Ad_g(t),t)`. Prove that it is an algebraic isomorphism and a
homeomorphism/holomorphic isomorphism on complex points, including the coset-valued inverse.
The right `W` action is `([g],t)·w=([g n_w],w⁻¹t)` for a representative `n_w∈N_G(T)`.
Prove independence of representatives and the action law: the multiplication defect lies
in `T` and vanishes in `G/T`. No homomorphic splitting of `N_G(T)→W` is assumed; already
in compact `SU₂`, a nontrivial Weyl lift can have order 4.

Prove `𝔤_rs ≃ ((G/T)×𝔱_reg)/W` through `[g,t]↦Ad_g(t)`, with the algebraic descent and
complex quotient topologies explicitly compared. A local section of the finite W-cover
trivializes `χ_rs:𝔤_rs→𝔱_reg/W` with fiber `G/T`. Supply actual inverse maps and transition
functions, continuity, and holomorphicity. The root-coordinate differential is
`(X mod 𝔱,Y)↦[X,t]+Y`; prove it is an isomorphism and apply Mathlib's analytic inverse
function theorem (`ContDiffAt.to_localInverse` at order `ω`) in the 3A.5d charts. A
set-theoretic orbit bijection alone does not prove these statements. For `SL₂` at
`t=H=diag(1,−1)`, the `E₁₂`, `E₂₁` and `H` coordinates of this map have coefficients `−2`, `2`
and `1`, so its determinant is `−4≠0`; reversing `[X,t]` to `[t,X]` gives the wrong two root
signs.

Construct `G/T→G/B` as a locally trivial bundle with contractible fiber `B/T≃U`, using
Layer 7's ordered root coordinates. Consume the actual flag CW structure with only even
real-dimensional cells from [LieGroups Layer 8](../RepresentationTheory/LieGroups/README.md). Prove connectedness
and `π₁(G/T)=0` through that bundle and the based LES. This includes arbitrary connected
complex reductive global forms; it does not assume `G` is simply connected, or infer a
topological theorem merely from algebraic simple connectedness. Use
[SmoothBundlesConnections B1.4](../SmoothBundlesConnections/README.md)'s actual closed-subgroup
quotient and principal projection when changing analytic models.

Apply [DGFloer Layer 1.2](../DGFloer/README.md)'s based fiber sequence, with its connecting
maps, exactness at `π₁` and `π₀` and naturality for commuting based squares, applied to locally
trivial bundles through the pinned `TauCeti.TopCat.mem_serreFibrations_proj` (supplier
contracts), which needs no paracompactness, to the actual spectral
projection and chosen `x₀=Ad₁(t₀)`. Retain the terms
`π₂(B_W)→π₁(G/T)→π₁(𝔤_rs)→π₁(B_W)→π₀(G/T)` and their basepoints. The middle map induced
by `χ_rs` is an isomorphism because the fiber is connected and simply connected. No
vanishing of `π₂(B_W)` is needed. The generic bundle/LES supplier must construct the connecting maps and prove exactness;
a Serre-fibration lifting predicate alone does not supply those theorems.

**Checks.**
- In `SL₂` with `t=H=diag(1,−1)` and `n_w=[[0,1],[−1,0]]`: the points `([1],H)` and
  `([n_w],−H)=([1],H)·w` have the same image `H` in `𝔤_rs` and the distinct images `(H,H)` and
  `(H,−H)` in `E`, as the fiber of `E→𝔤_rs` over `H` is the `W`-orbit `{H,−H}`. Since
  `n_w²=−1∈T`, `([g],t)·w·w=([g],t)` in `(G/T)×𝔱_reg` although the lift has order 4.
- The action uses `w⁻¹t`, not `wt`: invariance of `[g,t]↦Ad_g(t)` needs
  `Ad_(gn_w)(w⁻¹t)=Ad_g(t)`. With `wt` instead one gets `Ad_g(w²t)`, which for `A₂`, `w=s₁s₂`
  of order 3 and generic `t` differs from `Ad_g(t)`; the error is invisible in `A₁`, where
  `w=w⁻¹`.
- For `GL₃` the Bruhat cells of the three-dimensional flag variety have complex dimensions
  `ℓ(w)=0,1,1,2,2,3`, so every real cell dimension is even. For a torus `G=T`, `W=1`,
  `Φ⁺=∅` and `G/B` is one point.
- For `SL₂`, `G/B=ℙ¹` and `π₁(G/T)=0`; `B_W=ℂ*` has `π₁=ℤ`, so `π₁(𝔤_rs)≅ℤ`, matching the
  two-strand braid group of 11E. For `PGL₂` the variety `G/T` is the same and is simply
  connected although `π₁(PGL₂(ℂ))=ℤ/2`: the statement concerns `G/T`, not `G`.

**11E. Matrices, trace-zero centering and boundary cases.** Use native `Matrix.charpoly`,
its diagonal and conjugation equations and the actual trace-zero special-linear Lie
subalgebra. The maps are `A↦charpoly A`, `z↦∏_i(X−z_i)` and `z↦diagonal z`; prove the
regular-semisimple/separable-polynomial and distinct-configuration comparisons with actual
inverses. For GL_n versus SL_n conjugacy, determinant-normalize an invertible conjugator
by a diagonal centralizer element; no nth-root choice is required. Local simple-root
branches and spectral projectors `P_i(A)=∏_(j≠i)(A−λ_j I)/(λ_i−λ_j)` give the type-A
trivialization. Prove their idempotence, orthogonality, rank 1, completeness and local frame
maps at precisely the simple-spectrum hypothesis.

For `n>0`, centroid `c(z)=n⁻¹∑_i z_i` gives equivariant inverse maps
`z↦(c(z),(z_i−c(z))_i)` and `(c,w)↦(w_i+c)_i`. Prove the ordered homeomorphism
`PConf_n(ℂ)≃ₜℂ×PConf_n^0(ℂ)`, its descent to unordered configurations and all cover/basepoint
squares. The contractible central factor induces the SL_n/GL_n configuration π₁ comparison.
For `n=0`, both configuration spaces are points and no reciprocal of `0` is used. For `n=1`,
centered configurations and `𝔰𝔩₁` are points, while the uncentered spaces are `ℂ`. For
`n=2`, identify centered ordered configurations with `ℂ*` via `(z,−z)`, unordered projection
with `z↦z²`, and match native `B₂≃ℤ`, its sign quotient and the square-generated pure subgroup.

**Checks.**
- For `A=diag(1,2)`, `charpoly A=(X−1)(X−2)`, `P₁=(A−2I)/(1−2)=diag(1,0)` and `P₂=diag(0,1)`:
  idempotent, orthogonal, of rank 1, summing to `I`. For `A=diag(1,1)` the denominator
  `λ₁−λ₂` vanishes, so the simple-spectrum hypothesis is used.
- Centering at `n=2`: `(1,3)↦(2,(−1,1))`, with inverse by addition; centered ordered
  configurations are the pairs `(z,−z)`, `z∈ℂ*`, the unordered projection is `z↦z²`, and on
  `π₁` it is `ℤ→ℤ`, `1↦2`: the pure subgroup of `B₂≅ℤ` is `2ℤ`, of index 2, with `permHom` the
  sign. For `n=0` there is one configuration and no `ℂ` factor; for `n=1`, `PConf₁(ℂ)=ℂ`, the
  centered space is a point and `𝔰𝔩₁=0`.
- Determinant normalization: `g=diag(2,1)` centralizes `A=diag(1,2)` and has determinant 2;
  multiplying by the centralizing element `diag(1/2,1)` gives a conjugator of determinant 1
  without extracting a root.


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

**Checks.**
- In `A₁`, the loop `u(θ)=e^(iθ)` in `𝔱_reg/W` (coordinate `u=z²`) lifts from `H` to `−H`; the
  left deck monodromy lands in `W.op`, the ordinary `W`-valued monodromy is `w⁻¹=w`, the
  nontrivial element, and the transport is `α↦−α`, `α∨↦−α∨`, with the pairing `⟨−α,−α∨⟩=2`
  preserved. A trivial local system is excluded because the cover `z↦z²` is connected.
- In `A₂`, transporting roots by `w=s₁` but coroots by the identity breaks the pairing:
  `⟨s₁α₂,α₂∨⟩=⟨α₁+α₂,α₂∨⟩=−1+2=1≠2`, whereas transporting both by the same `w` gives `2`.
- The central isogeny `SL₂→PGL₂` identifies the Lie algebras, `𝔱_reg` and the arrangement,
  while the character lattices `ℤϖ⊋ℤα` differ. For `𝔤𝔩₂=ℂ·I⊕𝔰𝔩₂` the regular-semisimple
  locus is `ℂ×(𝔰𝔩₂)_rs`, so the central summand contributes no `π₁`, and
  `π₁((𝔤𝔩₂)_rs)≅ℤ` agrees with the two-strand configuration space of 11E.

**11G. Prerequisite and scope comparisons.** The order is 11A's configuration/native
braid comparison and Tau Ceti's Weyl Coxeter presentation and chambers → finite arrangement topology;
independent Layers 8–9 and the 3A.5e complex Lie-group dictionary → 11C invariant/spectral
maps; Layer 7 and LieGroups Layer 8 flag cells →
homogeneous-fiber connectedness and simple connectedness; DGFloer Layer 1.2's based fiber sequence → the
`χ_rs`-induced π₁ isomorphism; finite cover → actual root-datum monodromy. LHW Lie invariants
and RIT §§1 and 3 finite invariants enter 11C with the explicit comparisons stated there. No edge
returns to those lower targets. This constructs Lie-algebra regular-semisimple topology
over `ℂ`; it does not assert the corresponding statements for group-element toric
arrangements, disconnected groups, bad characteristic, compact-normalizer splittings,
infinite or affine Weyl arrangements, or arbitrary complex reflection groups. Their
carriers and hypotheses are different. In particular a list of all braid lengths 3 is
not the full B₃ presentation, whose short/long pair has length 4.

The finite-reflection presentation is Brieskorn (1971), Satz, p. 57, restated in Brieskorn
(Bourbaki exposé 401), Proposition 1, p. 25; the
face/chamber comparison is Salvetti, Part One, pp. 608–611, Theorem 1, with the
reflection-equivariant statement in Callegaro, §2.2, Theorems 2.4–2.5, p. 272.
Birman–Brendle, §§1.1–1.2, pp. 4–5, fixes the configuration-space convention;
the based covering and van Kampen contracts above supply its topological interfaces. The arrangement presentation and all comparison maps remain
construction targets until proved; references are not replacements for those proofs.

### Examples

**Checks.**
- For `𝔰𝔩₂`, `𝔱_reg = {diag(t, −t) : t ≠ 0} ≅ ℂ*`, `W = ℤ/2` acts by `t ↦ −t`, the
  quotient `B_W ≅ ℂ*` via `t ↦ t²`, and `π₁(B_W) = ℤ` is the Artin group of `A₁`, free on one
  generator; the characteristic polynomial `X² − t²` has discriminant `4t²`, so the base is
  exactly `{t² ≠ 0}`. The positive loop s↦exp(2πis) in the square-coordinate
  base lifts from 1 to s↦exp(πis), ending at −1; two turns end at 1.
  Thus the covering subgroup is 2ℤ and monodromy is reduction modulo 2.
- For `𝔤𝔩₂`, `𝔱_reg = {z₁ ≠ z₂}` and `B_W = Conf₂(ℂ) ≅ ℂ × ℂ*` by the centroid and
  `(z₁ − z₂)²`, so `π₁ = ℤ = B₂`, and the pure subgroup is generated by the square of the
  half-twist, matching the `n = 2` case of 11E.
- The regular nilpotent `[[0,1],[0,0]]` in `𝔤𝔩₂` has centralizer `{aI + bN} ≅ ℂ* × ℂ`, not a
  torus, so it is regular but not regular semisimple; the scalar matrix `I` is semisimple with
  centralizer `GL₂`, so it is not regular. Only `𝔤_rs` has torus centralizers.

### Dependencies

Layers 2, 3A, 7, 8 and 9; Tau Ceti's Weyl Coxeter presentation and chambers;
LieHighestWeight Layer 7;
ReflectionInvariantTheory §§1 and 3; AlgebraicTopology Stages 1 and 4; DGFloer Layer 1.2;
LieGroups Layer 8; SmoothBundlesConnections B1.4; Mathlib's covering-map, fundamental-group and
inverse-function theorems; Tau Ceti's braid and Artin groups.

## Worked examples

Concrete Hopf algebras / group schemes that exercise and validate the definitions:
`𝔾_a`, `𝔾_m`, `μ_n`/`μ_p`, `GLₙ`, `SLₙ`, `PGLₙ`, `SOₙ`, `Sp₂ₙ`, and tori. They are the test
objects of the layers' Checks, not separate targets. Their reductivity, through `R_u = 1` (the
definition that works in all characteristics), is pinned: over every field for `GLₙ`, `SLₙ`,
`PGLₙ` and `Sp₂ₙ`
(`TauCeti.GeneralLinear.reductiveCommHopfAlgProperty_finiteTypeCoordinateHopfAlgebra`,
`TauCeti.SpecialLinear.reductiveCommHopfAlgProperty_finiteTypeCoordinateHopfAlgebra`,
`TauCeti.ProjectiveGeneralLinear.reductiveCommHopfAlgProperty_coordinateHopfAlgebra`,
`TauCeti.Symplectic.reductiveCommHopfAlgProperty_finiteTypeCoordinateHopfAlgebra`), and over
every field of characteristic other than `2` for `SOₙ`
(`TauCeti.SpecialOrthogonal.reductiveCommHopfAlgProperty_finiteTypeCoordinateHopfAlgebra`).
Complete reducibility tests reductivity only in characteristic 0 or for linearly reductive
groups (Layer 6's Checks), and the multiplicative-type examples test Layer 4's diagonalizable
theory. Use `GLₙ` as a test case for the general theory, not as its source.

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
those points: [CFSGStatement](../CFSGStatement/README.md) consumes Layer 9's pinned groups and
9B's identification with them of the special isogenies and the three explicit carriers, which
its carrier plan designates and Tau Ceti pins; its supplier contract *From
TauCetiRoadmap.ReductiveGroups* and its Layer 1.1 need constructions rather than existence
theorems. [ChevalleyGroups](../ChevalleyGroups/README.md) takes its group scheme from
Layer 9 (9A and 9B) through its C2, and its C4 and C6 are the semisimple Chevalley-datum cases
of §§9B.1–9B.3 and of *Elementary generators and all ring points*.
[LieGroups](../RepresentationTheory/LieGroups/README.md) Layer 7 consumes Layers 0–4, 6 and 7C,
and its lower analytic dictionary is the affine reductive case of 3A.5e.
ReductiveGroupsPartII extends this roadmap and consumes Layers 0–9, in particular Layer 7a's
Lang theorem and fixed-coset lifting, and Layer 3A.5b's point-topology comparisons for local
topological algebras (in its RG2.0.1). Layer 3A.5 is the single owner of complex points, their
classical topology, smooth charts and the complex Lie group `G(ℂ)`, and three roadmaps cite it
by item: ComplexComparisonPartII (its C-1.1) consumes 3A.5c–3A.5e; FormalConnectionsOpers
consumes 3A.5c–3A.5d (its §2.4) and 3A.5e (its §4.3); SchubertGeometry consumes 3A.5c–3A.5d and
3A.5f (its S9). FormalConnectionsOpers also consumes Layers 0–9 and 6B's coset affineness
(in its §3A.5); Layer 11 consumes no target of FormalConnectionsOpers.
InverseGaloisAndArithmeticFundamentalGroups consumes Layers 0, 3 and 6;
NilpotentOrbits and SchubertGeometry consume the orbit theorems of Layer 3A, which are pinned
Tau Ceti declarations, and Layer 7's structure theory.
GeometricTopology Layer 4.2.8 and InverseGaloisAndArithmeticFundamentalGroups IG.5.1 consume
11A's plane and disc configuration spaces, Artin's theorem and the ordered-cover
identification.


The rational-cohomology and cotensor-induction interfaces of Layer 1.1 are outputs
for IntegralHeckeAndGaloisDeterminants §0.7.


## References

- J. S. Milne, [*Algebraic Groups* (2017)](https://www.jmilne.org/math/Books/iAG2017.pdf),
  Propositions 1.65–1.66, pp. 26–27; §3 (Hopf ideals), §4 (the embedding theorem), §5
  (quotients), §6 (radicals), §9 (Jordan decomposition), §10.b–§10.e, pp. 188–196, §12
  (diagonalizable and linearly reductive groups), §14 (unipotent groups), §16 (Lie–Kolchin),
  §17 (Borel subgroups, Lang's theorem), §21 (root data and Bruhat), §22 (Theorem 22.42) and
  §23 (isogeny, isomorphism and existence theorems), at the theorem numbers and pages cited in
  the layers.
- I. B. Frenkel and V. G. Kac, [*Basic representations of affine Lie algebras and dual resonance models*](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0062/LOG_0009.pdf),
  Invent. Math. 62 (1980), §2.3, equations (2.3)–(2.6), Proposition 2.2, pp. 40–41.
- M. Gros and M. Kaneda, *Un scindage du morphisme de Frobenius sur l'algèbre des
  distributions d'un groupe réductif*, arXiv:1712.06835v2 (2018), theorem on p. 2
  and §2(2.1), p. 6.
- E. Brieskorn, [*Die Fundamentalgruppe des Raumes der regulären Orbits einer endlichen
  komplexen Spiegelungsgruppe*](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0012/LOG_0010.pdf),
  Invent. Math. 12 (1971), 57–61, Satz, p. 57.
- E. Brieskorn, [*Sur les groupes de tresses*](https://www.numdam.org/item/SB_1971-1972__14__21_0.pdf),
  Séminaire Bourbaki, exposé 401 (1971–1972), LNM 317 (1973), Proposition 1, p. 25, which
  restates the 1971 theorem and attributes its proof there.
- M. Salvetti, [*Topology of the complement of real hyperplanes in Cⁿ*](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0088/LOG_0035.pdf),
  Invent. Math. 88 (1987), Part One, pp. 608–611, Theorem 1; Part Two, pp. 611–616.
- F. Callegaro, [*Salvetti complex, spectral sequences and cohomology of Artin groups*](https://www.numdam.org/item/AFST_2014_6_23_2_267_0.pdf),
  Ann. Fac. Sci. Toulouse 23 (2014), §2.2, Theorems 2.4–2.5, p. 272.
- D. C. Ernst, *Cell Complexes for Arrangements with Group Actions*, revised M.S. thesis,
  arXiv:0905.4434v1 (2009), Definition 5.1, pp. 27–28, Theorem 5.11, pp. 32–35, Theorem 6.1,
  p. 41, and Theorem 6.10, p. 46 (the Salvetti and finite reflection-quotient comparisons;
  Theorem 6.10 states Brieskorn's presentation without proof).
- B. Conrad and T. Feng, [*Reductive Groups over Fields*](https://math.stanford.edu/~conrad/249BW16Page/handouts/AMSalggroups2.pdf),
  Proposition 12.3.1, p. 127; Appendix F (pseudo-reductive groups), pp. 208–218; Appendix H
  (Levi subgroups), p. 238.
- G. J. McNinch, [*Levi decompositions of a linear algebraic group*](https://arxiv.org/abs/1007.2777),
  arXiv:1007.2777v1 (2010), §3.1, p. 6; (3.2.1), p. 7; §§2.2–2.3, 3.1, 4.1, 4.3–4.5 and 5.1–5.2.
- M. Kohls, *A user friendly proof of Nagata's characterization of linearly reductive groups in
  positive characteristics*, Linear Multilinear Algebra 59 (2011), 271–278,
  doi:10.1080/03081080903402939 (Nagata's theorem for smooth groups; cited by its locator).
- J. S. Birman and T. E. Brendle, [*Braids: a survey*](https://arxiv.org/abs/math/0409205),
  arXiv math/0409205v2, §§1.1–1.2, pp. 4–5, and p. 69.
- R. H. Fox and L. Neuwirth, *The braid groups*, Math. Scand. 10 (1962), 119–126; E. Fadell
  and L. Neuwirth, *Configuration spaces*, Math. Scand. 10 (1962), 111–118, §II.
- W. C. Waterhouse, *Introduction to Affine Group Schemes*, Graduate Texts in Mathematics,
  Springer (1979): Hopf algebras, comodules, closed subgroups, the unipotent radical; Chapters
  1–3, pp. 3–27, for affine group schemes as representable functors and Hopf algebras and for
  representations as comodules (Layers 0–1).
- A. Borel, *Linear Algebraic Groups*, 2nd ed., Springer (1991), Chapter IV, *Borel subgroups;
  reductive groups*, pp. 147–202 (Layer 7); T. A. Springer, *Linear Algebraic Groups*, 2nd ed.,
  Birkhäuser (1998; reprinted 2009), Chapter 6, *Parabolic subgroups, Borel subgroups,
  solvable groups*, pp. 98–113 (Layer 7).
- J.-P. Serre, *Géométrie algébrique et géométrie analytique* (1956), §2 no. 5, pp. 8–9 (the
  classical topology and regular maps).
- I. V. Arzhantsev, *Invariant Ideals and Matsushima's Criterion*, arXiv:math/0506430v1 (2005),
  Proposition 2.2, p. 2 (reductive coset affineness).
- M. Fang, K. J. Lim and K. M. Tan, *Jantzen filtration of Weyl modules, product of Young
  symmetrizers and denominator of Young's seminormal basis*, arXiv:1904.13040v2 (2020), §2.1,
  pp. 2–3 (integral Weyl lattices and forms).
- J. E. Humphreys, *Introduction to Lie Algebras and Representation Theory* (1972), §26
  (integral enveloping forms and PBW).
- S. Riche, [*Lectures on modular representation theory of reductive algebraic groups*](https://riche.perso.math.cnrs.fr/curso-riche-total.pdf),
  Chapter 1, §2.9.1, p. 50, and Remark 1.23, p. 27.
- J. C. Jantzen, *Representations of Algebraic Groups*, 2nd ed. (2003),
  Part II, §§3.18–3.19, for the algebraic Steinberg module.
  For Layer 1.1, *Representations of Algebraic Groups I*, SFB/MPI 85-9 (1985),
  §§3.3–3.9 and 4.2–4.16, pp. 52–60 and 69–79a,
  [institutional preprint](https://archive.mpim-bonn.mpg.de/id/eprint/607/1/preprint_1985_9.pdf);
  page numbers there differ from the published editions.
- A. Grothendieck and M. Raynaud, *Revêtements étales et groupe fondamental (SGA 1)*,
  [revised edition, arXiv:math/0206203v2](https://arxiv.org/abs/math/0206203v2),
  Exposé XII, §§1.1–1.2 and Propositions 2.1, 3.1–3.2, pp. 239–247.
- B. Conrad, [*Weil and Grothendieck approaches to adelic points*](https://math.stanford.edu/~conrad/papers/adelictop.pdf),
  Enseign. Math. 58 (2012), 61–97, Proposition 3.1 and its proof, p. 4 (page numbers of the
  author's version).
- B. Conrad, [*Reductive Group Schemes*](https://math.stanford.edu/~conrad/papers/luminysga3.pdf),
  Definition 3.1.1, p. 81; Theorem 3.3.4, p. 98; Theorem 4.1.7, p. 112; Definition 5.1.1,
  p. 136; Theorem 5.1.13, pp. 143–145; Definition 6.1.1 and Remark 6.1.2, pp. 186–187;
  Theorems 6.1.16–6.1.17, pp. 196–197; Appendix B: Definition B.1.1, p. 280, Lemma B.1.3,
  p. 281, Corollary B.3.3, p. 290, Proposition B.3.4, pp. 290–291, and Corollary B.3.6, p. 293;
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

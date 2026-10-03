# Roadmap: analytic toric geometry

This roadmap constructs algebraic and complex-analytic toric varieties from finite regular
rational fans. Tau Ceti implements the algebraic cone-to-fan layer and the affine analytic charts.
This roadmap completes that layer and builds on it the glued complex manifold, torus actions,
orbit strata, normal-crossings boundary components, toric maps, properness, and the
algebraic--analytic comparison.

The public API has one toric dialect. Cones are Mathlib `PointedCone`s with additional
predicates, affine charts are schemes built from monoid algebras, and gluing uses the common
scheme and `TopCat.GlueData` carriers. Basis-dependent coordinates are theorems, not definitions
of the global objects.

Suggested homes: `TauCeti/Geometry/Toric/Algebraic/`, which holds Tau Ceti's algebraic supplier,
and `TauCeti/Geometry/Toric/Analytic/`, which holds its affine analytic charts. Every Tau Ceti
toric declaration named below is in the namespace `TauCeti.Toric`; the manifold declarations of
Layer 3G are named in full.

## Scope and completion criterion

The scope is smooth complex toric geometry for **finite regular rational fans**. Restricting to
finite fans makes all algebraic realizations quasi-compact and avoids an ambiguous notion of
local finiteness: every cone contains the origin, and every affine toric chart contains the dense
torus, so neither the cone family near the origin nor the affine-chart cover can be locally finite
in the naive sense.

Singular toric analytic spaces, infinite fans, general analytification, coherent toric sheaves,
intersection theory, symplectic moment maps, and special deformation retractions are outside the
roadmap.

The roadmap is complete when Tau Ceti supplies all of the following.

1. An algebraic API for rational salient polyhedral cones, primitive rays, regularity, finite
   fans, fan morphisms, dual semigroups, affine toric schemes, face localizations, fan gluing,
   torus actions, and algebraic toric maps.
2. Every regular cone has an analytic affine chart on the complex points of its algebraic affine
   scheme. Its topology comes from a finite monomial embedding and is independent of the chosen
   semigroup generators. A basis extending the primitive ray generators gives a biholomorphism
   with `C^k x (C^*)^(n-k)`, independent of the extending basis.
3. Every finite regular fan has a Hausdorff second-countable complex manifold obtained by gluing
   its affine analytic charts along face localizations, by the open-gluing theorem for complex
   manifolds of the ComplexManifolds roadmap. Character functions, chart inclusions, and the torus
   action are holomorphic.
4. Cones correspond naturally to torus orbits. For a nonempty fan, the complement of the dense
   torus is a finite union of closed embedded complex hypersurfaces indexed by rays, with reduced
   multiplicity one and the local coordinate-hyperplane simple-normal-crossings form.
5. A fan morphism induces a holomorphic toric map. Identity, composition, products, open subfans,
   and restrictions agree definitionally or by named natural isomorphisms. For finite source and
   target fans with a nonempty source, the cone-by-cone support criterion characterizes
   properness.
6. The analytic realization is naturally biholomorphic, as a toric space, to the global complex
   points of the algebraic fan scheme, its morphisms `Spec C -> X_Sigma` over `Spec C`. This
   comparison commutes with affine charts, characters, orbit strata, boundary components, and
   toric maps.
7. A nonempty finite regular fan is complete exactly when its analytic realization is compact.
   The standard fans for affine space, the algebraic torus, projective space, products, and a star
   subdivision satisfy the expected comparison and properness theorems.

## Ownership and dependencies

- **Tau Ceti implements the cone-to-fan algebraic supplier.** `TauCeti/Geometry/Toric/Algebraic/`
  supplies integral lattices, toric cones, rays and primitive generators, regular cones, finite
  fans with subfans, products and subdivisions, fan morphisms, dual semigroups, affine toric
  schemes, face localizations, and the toric scheme of a regular fan with its toric maps. Layer 0
  names the declarations that every later layer uses and states the remaining algebraic targets
  on them. No layer restates them.
- **Matching external declarations are consumed immediately.** Before implementing a remaining
  Layer 0 target, search Mathlib, Tau Ceti, and active pull requests, and compare with the Toric
  project. If the exact object and laws exist in Mathlib or Tau Ceti, import them instead.
  Otherwise implement the target in Tau Ceti on the objects that Layer 0 names. Analytic work
  never pauses for external upstreaming, and this roadmap does not assign work to another
  project.
- **Mathlib owns convex-cone vocabulary.** Use `PointedCone`, `PointedCone.FG`,
  `PointedCone.DualFG`, `PointedCone.IsFaceOf`, `PointedCone.Face`,
  `ConvexCone.Salient`, cone hulls, maps, duals, and the face lattice. A toric cone is a predicate
  on that carrier, not a replacement carrier.
- **The Toric project is prior work, not a dependency.** Yaël Dillies's Toric project formalizes
  tori, diagonalizable group schemes, the `AlgebraicGeometry.ToricVariety` class in
  `Toric.ToricVariety.Defs`, and affine toric varieties from affine monoids in
  `Toric.ToricVariety.FromMonoid`. Neither Tau Ceti nor this repository depends on it, so nothing
  here consumes it: the dense torus is Tau Ceti's `ComplexTorus` and `denseTorusScheme`, and the
  affine toric schemes are Tau Ceti's `affineToricScheme`. Its design is the model for the
  algebraic torus action of Layer 0, item 7.
- **The ComplexManifolds roadmap owns the gluing of complex manifolds.** Mathlib owns the manifold
  vocabulary: `ChartedSpace`, `StructureGroupoid`, `HasGroupoid`, `IsManifold`, `ContMDiff`,
  `PartialDiffeomorph`, `IsLocalDiffeomorph` and `Diffeomorph`. Milestone 5 of the
  [ComplexManifolds roadmap #279](https://github.com/TauCetiProject/TauCetiRoadmap/pull/279),
  compatible open gluing, owns the atlas on the glued space of a `TopCat.GlueData`, its manifold
  theorem, the chart inclusions as open local diffeomorphisms, and its uniqueness and
  functoriality. Its ownership contract names this roadmap as a consumer of that open-gluing
  interface. Tau Ceti implements the part that this roadmap uses,
  `TauCeti.chartedSpaceOfIsOpenEmbedding` with its manifold and chart-inclusion theorems
  (Layer 3G), and builds the complex atlas of the realization from it (Layer 3, item 2). This
  roadmap states no gluing construction of its own.
- **General scheme analytification is not claimed.** The comparison is toric and chartwise. It
  identifies affine functor-of-points carriers, proves compatibility on face localizations, and
  glues those comparisons.

## Pinned conventions

These conventions are acceptance conditions.

- An integral lattice is a finite free `Z`-module `N`, a finite-dimensional real vector space
  `N_R`, an additive map `i : N -> N_R`, and an `R`-linear equivalence
  `R tensor[Z] N ≃ N_R` sending `1 tensor n` to `i(n)`. Injectivity, discreteness, spanning, and
  equality of the integral and real ranks are consequences. An injective dense map with full
  real span is not accepted as a lattice.
- A toric cone is a Mathlib `PointedCone R N_R` satisfying finite generation, generation by
  finitely many lattice vectors, and `ConvexCone.Salient`. Salience is the condition
  `sigma inter (-sigma) = {0}`; Mathlib's name `PointedCone` alone does not assert it.
- Rays are one-dimensional Mathlib faces. Their primitive lattice generators are derived by an
  existence-and-uniqueness theorem. A cone record does not store an arbitrary generator list.
- Regularity includes the toric-cone hypothesis and says that all primitive ray generators occur
  in one integral basis. It is never a standalone property of an irrational or nonsalient cone.
  The analytic layer consumes such a basis and proves independence from its choice.
- A fan is a finite set of toric cones, closed under faces, whose pairwise intersections are
  faces of both cones. A fan morphism is an integral lattice map, its compatible real-linear map,
  and the theorem that each source cone maps into a target cone.
- The dual semigroup is the additive submonoid of integral characters nonnegative on the cone.
  The affine chart is the spectrum of its complex monoid algebra. Face inclusions act through
  localization and affine open immersions.
- The dense complex torus is represented coordinate-freely by multiplicative characters of the
  integral character lattice. It becomes `(C^*)^n` only after choosing a basis.
- Affine complex points are algebra homomorphisms from the complex monoid algebra to `C`. Their
  topology is induced by evaluation on a finite semigroup generating family. Independence from
  that family is proved before any regular-coordinate homeomorphism.
- A mixed chart is `C^k x (C^*)^l`. A mixed monomial map has natural-number exponents from
  noninvertible source coordinates and integer exponents from invertible source coordinates.
  No noninvertible source coordinate may contribute to an invertible target coordinate.
- Gluing uses `TopCat.GlueData.glued`. The analytic realization is not a second tagged quotient.
- Global algebraic complex points of a scheme `X` over `Spec C` mean morphisms `Spec C -> X`
  over `Spec C`, Mathlib's `Scheme.Hom.IsOver`, not the underlying prime-ideal space of `X`. A
  bare scheme morphism `Spec C -> X` is not a complex point: on an affine chart it is a ring
  homomorphism from the coordinate ring to `C`, which need not be `C`-linear.
- The toric boundary is a finite ray-indexed family of closed embedded complex hypersurfaces.
  Its simple-normal-crossings conclusion is a complex local biholomorphism, represented by a
  complex `PartialDiffeomorph`, under which the components are coordinate hyperplanes. A merely
  topological `PartialHomeomorph` does not establish this conclusion.
- A fan may have no cones, and `Fan.subfan` accepts every face-closed set of cones of a fan, the
  empty set included. The empty fan is regular, its realization is empty, and it is not complete.
  A nonempty fan contains the zero cone, `Fan.bot_mem`. The global dense torus, the properness
  criterion, and the equivalence of completeness with compactness are stated for nonempty fans,
  with the hypothesis `Nonempty Φ.cones` that `Fan.denseTorusι` takes.
- Properness is stated only for finite fans with a nonempty source. For every target cone `tau`,
  the inverse image of `tau` under the real-linear map equals the support of the source cones
  mapped into `tau`.

## Existing foundations to consume

At the dependency pin, the following anchors already exist.

- Tau Ceti's toric development: the algebraic supplier named in Layer 0, in
  `TauCeti/Geometry/Toric/Algebraic/`, and the affine analytic charts, their face localizations
  and the chart diagram of a regular fan named in Layers 1--4, in
  `TauCeti/Geometry/Toric/Analytic/`.
- Mathlib's ordered-cone hierarchy, including finite generation, dual finite generation,
  simpliciality, salience, faces, maps, and the face lattice.
- Finite free modules, scalar extension, `Basis`, `Module.Dual`, `Finsupp`, matrices, additive
  submonoids, monoid algebras, localizations, affine schemes, and scheme gluing.
- Complex differentiability, finite products, open subspaces, complex manifolds, local
  diffeomorphisms, and structure groupoids.
- `TopCat.GlueData`, its canonical open embeddings, its open-set criterion, and its colimit
  universal property.
- Proper maps, compactness, local compactness, quotient maps, and second-countability tools.

## Layer 0: the algebraic supplier

This layer closes the algebraic prerequisite chain. Tau Ceti implements it in
`TauCeti/Geometry/Toric/Algebraic/`, and every later layer states its targets on the declarations
named here. Each item gives the specification, then Tau Ceti's declarations for it, then the
targets that remain. The remaining targets are the general toric case of what Tau Ceti proves
for regular cones and regular fans, and `Suggested.lean` states them on Tau Ceti's objects.

1. **Integral lattices.** The integral-lattice predicate is an `R`-linear equivalence
   `R tensor[Z] N ≃ N_R` whose restriction to `1 tensor N` is the chosen lattice map, with
   injectivity, discreteness, spanning, equality of integral and real ranks, and naturality under
   integral linear maps. Tau Ceti: `IsIntegralLattice`, stated as Mathlib's `IsBaseChange` with
   the equivalence form `isIntegralLattice_iff`; `IsIntegralLattice.injective`,
   `IsIntegralLattice.isZLattice`, `IsIntegralLattice.span_range_eq_top` and
   `IsIntegralLattice.finrank_eq`; the unique real extension `IsIntegralLattice.extend` of a map of
   lattices; `isIntegralLattice_congr`; and `IsIntegralLattice.prod`.
2. **Toric cones.** `IsToricCone i sigma` on a Mathlib `PointedCone` is finite generation,
   lattice rationality, and salience, preserved under faces, intersections, products, injective
   integral maps, and lattice equivalences. Tau Ceti: `IsLatticeRational` and `IsToricCone`, whose
   fields are lattice rationality and salience, with finite generation derived as
   `IsToricCone.fg`; `IsToricCone.of_isFaceOf`, `IsToricCone.prod`, `IsToricCone.map` and
   `isToricCone_map_equiv_iff`. The remaining target: for an integral lattice, the intersection of
   two toric cones is a toric cone. The integral-lattice hypothesis is necessary, by
   `not_isToricCone_sqrtTwoCone_inf`.
3. **Rays.** Rays are one-dimensional Mathlib faces, each with a unique primitive generator. The
   ray type is finite, the primitive rays generate the cone, and primitive generators are natural
   under lattice equivalences. Tau Ceti: `ToricRay`, `IsPrimitiveGenerator`,
   `IsToricCone.existsUnique_primitiveGenerator`, `primitiveGenerator`, `ToricRay.finite_of_fg`,
   `IsToricCone.hull_primitiveGenerator` and `primitiveGenerator_map_equiv`.
4. **Regular cones.** Regularity is the conjunction of `IsToricCone` with the existence of an
   integral basis containing every primitive ray generator. Regular cones are simplicial, faces
   and products of regular cones are regular, and two extending bases are related by a pinned
   block form. Tau Ceti: `IsRegularCone`, `IsRegularCone.isSimplicial`,
   `IsRegularCone.of_isFaceOf`, `IsRegularCone.prod`, and the block form `[[1, B], [0, D]]` with `D`
   unimodular, `IsExtendingBasis.isUnit_det_toMatrix_compl`.
5. **Fans.** A finite fan is a finite set of toric cones closed under faces with pairwise
   intersections a face of each, with support, completeness, open subfans, products,
   subdivisions, and fan morphisms satisfying identity, composition, and support functoriality.
   Tau Ceti: `Fan`, which records that `sigma ⊓ tau` is a face of `sigma` and derives the other
   half as `Fan.inf_isFaceOf_right`; `Fan.IsRegular`, `Fan.support` and `Fan.IsComplete`; the
   open subfan `Fan.subfan` of a face-closed set of cones, with its inclusion
   `Fan.subfanInclusion`; `Fan.prod`; `Fan.IsSubdivision`; `FanHom` with `FanHom.id`,
   `FanHom.comp` and their laws; `FanHom.mapsTo_support`; and the least target cone of a source
   cone, `FanHom.leastCone`.
6. **Dual semigroups.** The dual semigroup is the additive submonoid of integral characters
   nonnegative on a cone, with finite generation, face-localization, functoriality, and the
   regular-coordinate equivalence with `N^k x Z^(n-k)`. Tau Ceti: `dualSemigroup`, the face
   formula `dualSemigroup_inf_ker_eq_sup`, `dualSemigroupMap`, `regularDualSemigroupEquiv`, and
   finite generation for regular cones, `IsRegularCone.fg_dualSemigroup`. The remaining target is
   Gordan's lemma: the dual semigroup of every toric cone is finitely generated.
7. **Affine toric schemes.** The affine toric scheme is the spectrum of the complex monoid
   algebra, with its dense torus and torus action. Tau Ceti: `affineCoordinateRing`,
   `affineToricScheme`, `affineToricSchemeMap` with its identity and composition laws, and the
   dense torus `denseTorusScheme`. The remaining target is the torus action.
8. **Face localizations.** Every face inclusion gives a localization map and an affine open
   immersion, with identity, composition, pairwise-overlap, and cocycle laws. Tau Ceti:
   `faceAffineCoordinateRingMap` and `faceAffineToricSchemeMap` with their identity and
   composition laws; for a face cut out by a character, the localization
   `isLocalization_away_affineCoordinateRingMap_inf_ker` and the open immersion
   `isOpenImmersion_affineToricSchemeMap_inf_ker`; the overlaps `Fan.affineToricOverlapLeft` and
   `Fan.affineToricOverlapRight`; and, for every face of a regular cone,
   `IsRegularCone.isOpenImmersion_faceAffineToricSchemeMap`. The remaining target is the
   separation lemma, that every face of a toric cone is cut out by a character of its dual
   semigroup, which makes every face morphism of a toric cone an open immersion.
9. **The fan scheme.** The affine schemes of a finite fan glue along these open immersions, with
   the torus action, cone opens, algebraic toric maps, and, for a nonempty fan, the global dense
   torus, satisfying identity, composition, products, open-subfan restriction, and naturality of
   the affine inclusions. Tau Ceti, for a regular fan: the chart diagram
   `Fan.affineToricDiagram` and its colimit `Fan.algebraicRealization`; the open chart inclusions
   `Fan.affineToricChartι`, whose ranges are the cone opens, with the gluing relation
   `Fan.affineToricChartι_eq_affineToricChartι_iff`; the dense torus of a nonempty fan,
   `Fan.denseTorusι`; the toric maps `FanHom.algebraicMap` with `FanHom.algebraicMap_id`,
   `FanHom.algebraicMap_comp` and the chart formula
   `FanHom.affineToricChartι_comp_algebraicMap`; and the open subscheme of a subfan,
   `Fan.isOpenImmersion_subfanInclusion_algebraicMap` with
   `Fan.range_subfanInclusion_algebraicMap`. The remaining targets are four. The fan scheme is a
   scheme over `Spec C`, by descending the structure morphisms of its affine charts, and the
   chart inclusions and the toric maps are morphisms over `Spec C`. By the separation lemma, the
   chart diagram of every finite fan is locally directed, which extends the fan scheme and its
   toric maps to every finite fan. The affine torus actions glue to the global torus action. The
   fan scheme of `Fan.prod` is the fibre product over `Spec C` of the two fan schemes.

**Source spine:** Cox--Little--Schenck, Chapters 1 and 3; Fulton, Chapter 1 and §2.1; and, as prior
work, the Toric project.

## Layer 1: characters and mixed monomial maps

Tau Ceti implements this layer in `TauCeti/Geometry/Toric/Analytic/`.

1. Define evaluation of an integral character on the complex torus without choosing a basis.
   Prove its multiplicative laws, separation of points, compatibility with lattice maps, and its
   Laurent-monomial formula after choosing a basis. Tau Ceti: the coordinate-free torus
   `ComplexTorus N`, `characterEvaluation`, `exists_characterEvaluation_ne`, `complexTorusMap`
   and `complexTorus_apply_eq_prod_zpow`.
2. For a semigroup homomorphism, construct the contravariant map on affine complex points. Prove
   compatibility with the monoid-algebra map, continuity for monomial-embedding topologies, and
   independence from chosen generators. Tau Ceti: `AffineSemigroupComplexPoint.comap`,
   `AffineSemigroupComplexPoint.comap_apply` and `AffineSemigroupComplexPoint.continuous_comap`.
3. Define typed mixed exponent data for maps
   `C^k x (C^*)^l -> C^k' x (C^*)^l'`. Prove preservation of the invertible-coordinate locus,
   holomorphy there, identity, composition **on that locus**, products, Jacobian formulas, and
   biholomorphicity for the appropriate unimodular block matrices. No composition theorem is
   stated on ambient points with a zero torus coordinate, where integer-power conventions break
   exponent arithmetic. Tau Ceti: `MixedExponent`, `mixedChartDomain`, `mixedMonomialMap`,
   `mapsTo_mixedMonomialMap`, `contDiffOn_mixedMonomialMap`, `MixedExponent.comp` with
   `mixedMonomialMap_comp` on `mixedChartDomain`, `MixedExponent.prod` with
   `mixedMonomialMap_prod`, the Jacobian blocks `hasDerivAt_mixedMonomialMap_fst_boundary` and its
   three companions, and `mixedMonomialOpenPartialHomeomorph`.
4. Prove that localization along a face gives an open complex subspace and a biholomorphism onto
   its image. Verify the cocycle equations for successive face inclusions. Tau Ceti:
   `faceAffinePointMap` with `faceAffinePointMap_comp`, and, for a face of a regular cone,
   `IsRegularCone.isOpenEmbedding_faceAffinePointMap` and
   `IsRegularCone.faceAffinePointPartialDiffeomorph`.

**Source spine:** Cox--Little--Schenck, §§1.1--1.3 and §3.1; Fulton, §§1.2--1.3.

## Layer 2: affine analytic charts of regular cones

Tau Ceti implements this layer in `TauCeti/Geometry/Toric/Analytic/`. The carrier of every chart
is `AffineSemigroupComplexPoint (dualSemigroup hi sigma)`, the complex points of the affine toric
scheme.

1. Put the finite-monomial-embedding topology on the affine complex-point carrier. Prove
   independence from the generating family, Hausdorffness, local compactness, and second
   countability. Tau Ceti: `affinePointTopology`, `affinePointTopology_eq`,
   `t2Space_affinePointTopology`, `locallyCompactSpace_affinePointTopology` and
   `secondCountableTopology_affinePointTopology`.
2. For a regular cone of dimension `k` in a rank-`n` lattice, use an extending basis to construct
   a biholomorphism with `C^k x (C^*)^(n-k)`. Prove its coordinate functions are the expected
   characters. Tau Ceti: `regularAffinePointHomeomorph`, and for a cone with an extending basis
   `coneChartEquiv`, `coneChartHomeomorph` and `coneChartEquiv_fst_apply`.
3. Install the named complex `ChartedSpace` and prove `IsManifold`. Show that changing the
   extending basis preserves the complex structure through the corresponding mixed monomial
   biholomorphism. Tau Ceti: `coneChartedSpace`, `isManifold_coneChartedSpace` and
   `contMDiff_id_coneChartedSpace`.
4. Identify the dense torus as an open submanifold and the orbit associated to every face as a
   locally closed complex submanifold. Compute its dimension and closure relation. Tau Ceti:
   `isOpen_orbit_complexTorus_default` and `dense_orbit_complexTorus_default`; the stratum
   `affineConeOrbit` of a face, with `isLocallyClosed_affineConeOrbit`,
   `isManifold_affineConeOrbitChartedSpace` and `affineConeOrbit_subset_closure_iff`. Its
   dimension, `finrank_affineConeOrbit_model`, landed after this repository's Tau Ceti pin.
5. Prove that face localization is an open holomorphic embedding and agrees on carriers with
   complex points of the algebraic open immersion. Tau Ceti:
   `IsRegularCone.isLocalDiffeomorph_faceAffinePointMap` and `faceAffinePointMap_eq_comp`.

**Source spine:** Fulton, §§1.2 and 2.1; Cox--Little--Schenck, §§1.2, 3.1, and 3.3.

## Layer 3G: the gluing theorem

Milestone 5 of the
[ComplexManifolds roadmap #279](https://github.com/TauCetiProject/TauCetiRoadmap/pull/279),
compatible open gluing, owns the complex structure on a space glued from complex manifolds along
`TopCat.GlueData`, with its uniqueness and functoriality, and names this roadmap as a consumer.
Tau Ceti implements the part that Layer 3 uses in `TauCeti/Geometry/Manifold/Gluing.lean`, which
landed after this repository's Tau Ceti pin.

1. A space covered by open embeddings of charted spaces receives the transported charts,
   `TauCeti.chartedSpaceOfIsOpenEmbedding`. The chart inclusions `D.ι i` of
   `D : TopCat.GlueData` form such a cover, by `TopCat.GlueData.ι_isOpenEmbedding` and
   `TopCat.GlueData.ι_jointly_surjective`.
2. These charts form a complex manifold when the pieces are complex manifolds glued along
   holomorphic maps, `TauCeti.isManifold_chartedSpaceOfIsOpenEmbedding`. The gluing hypothesis is
   a local deck transformation: whenever `φ j x = φ k y`, some map `T` holomorphic at `x`
   satisfies `φ k ∘ T = φ j` near `x`. The two-sided overlap compatibility of Milestone 5, that
   `D.f i j` and `x |-> D.f j i (D.t i j x)` are open local diffeomorphisms for an atlas on the
   overlap, implies it.
3. Every embedding of a piece is then holomorphic,
   `TauCeti.contMDiff_chartedSpaceOfIsOpenEmbedding`, and a biholomorphism onto its open image,
   `TauCeti.partialDiffeomorphOfIsOpenEmbedding`.

This roadmap states no gluing construction of its own. Layer 3, item 2 consumes this one through
Tau Ceti's complex atlas of the realization.

**Source spine:** Lee, Chapter 1 (the smooth manifold chart lemma).

## Layer 3: finite-fan analytic gluing

The fans of this layer are regular, `Fan.IsRegular`.

1. Form the `TopCat.GlueData` diagram of affine charts and face-localization overlaps. Derive its
   symmetry and cocycle equations from the fan intersection axiom and Layer 0 localization laws.
   Tau Ceti implements the chart diagram `Fan.analyticAffineChartDiagram`, the overlap loci
   `Fan.analyticOverlapOpens`, the transitions `Fan.analyticOverlapTransition`, and the
   triple-overlap and cocycle laws `Fan.analyticOverlapHomeomorph_mem` and
   `Fan.analyticOverlapHomeomorph_cocycle`. The gluing data assembled from them,
   `Fan.analyticGlueData`, with the realization `Fan.analyticRealization` and the chart
   inclusions `Fan.analyticAffineChartι`, landed after this repository's Tau Ceti pin.
   `Suggested.lean` assembles the same gluing data from the pinned pieces under those names.
2. Make the realization a complex manifold. Each affine chart carries the complex structure of
   Layer 2, item 3, `coneChartedSpace` for an extending basis and a generating family, which by
   Tau Ceti's `contMDiff_id_coneChartedSpace` depends on neither. Two affine charts are glued along
   the chart of their intersection cone by face localizations, which are biholomorphisms onto
   their open images by Layer 2, item 5, so the gluing theorem of Layer 3G applies. Tau Ceti: the
   complex atlas `Fan.analyticChartedSpace`, modelled on `C^n` for `n` the rank of the lattice;
   `Fan.isManifold_analyticRealization`; and every affine chart inclusion as a biholomorphism onto
   its open image, for the structure of any extending basis and generating family,
   `Fan.analyticAffineChartPartialDiffeomorph` with `Fan.contMDiff_analyticAffineChartι`. These
   landed after this repository's Tau Ceti pin, and `Suggested.lean` states the first two under
   those names. The remaining target: every cone-orbit chart, `affineConeOrbitChartedSpace`,
   agrees on overlaps.
3. Prove Hausdorffness from the fan intersection property and closedness of the generated gluing
   relation. The proof must separate points in noncommon faces rather than store separation in a
   fan record. Tau Ceti's `Fan.t2Space_analyticRealization` landed after this repository's Tau
   Ceti pin.
4. Prove second countability from finiteness of the chart family and second countability of each
   affine chart. Prove local compactness and finite dimensionality. Tau Ceti's
   `Fan.secondCountableTopology_analyticRealization` and
   `Fan.locallyCompactSpace_analyticRealization` landed after this repository's Tau Ceti pin.
5. For an open subfan, `Fan.subfan` of a face-closed set of cones, which may be empty, construct
   the continuous map from its realization to the ambient realization. The subfan chart of a cone
   and the corresponding ambient chart have the same underlying affine complex-point carrier.
   Their chosen bundled topologies are canonically identified by the identity-on-points chart
   homeomorphism `subfanAnalyticChartMap`, using independence of the finite monomial generating
   family (`affinePointTopology_eq`). These chart comparisons commute with the face maps of the
   two chart diagrams, so they glue to the subfan map. On each chart the map is explicit:
   composed with the inclusion of the chart of a cone of the subfan, it is the chart comparison
   followed by the inclusion of the chart of the same cone in the ambient realization. This chart
   computation identifies the glued map. Prove functoriality for nested open subfans, that its
   image is the union of the ambient charts of the subfan's cones, and that it is an open
   embedding.
6. Prove that the open-subfan map of item 5 is an open holomorphic embedding: the same map is
   holomorphic for the complex structures of item 2. On the chart of a cone of the subfan it is
   the chart comparison, the identity on points, followed by the ambient chart inclusion. For one
   extending basis and one generating family, `Fan.analyticAffineChartPartialDiffeomorph` makes
   the subfan and ambient chart inclusions biholomorphisms onto their open images, so the map is a
   local biholomorphism.

**Source spine:** Fulton, §§1.4 and 2.4; Cox--Little--Schenck, §§3.1 and 3.4; Oda, Chapter I.

## Layer 4: torus actions, strata, and the boundary

1. Glue the affine torus actions and prove the group law, joint continuity, holomorphy, and
   equivariance of chart inclusions and character functions. The torus is Tau Ceti's
   `ComplexTorus N`, and on each affine chart the glued action is Tau Ceti's action on complex
   points, computed in regular coordinates by `coneChartEquiv_smul_fst` and
   `coneChartEquiv_smul_snd`.
2. Prove the orbit--cone correspondence as an order-reversing equivalence between cones and
   torus orbits. Compute stabilizers and quotient tori using sublattices. Tau Ceti proves it on a
   single affine chart, `faceEquivOrbitRelQuotient` with `mem_stabilizer_distinguishedPoint_iff`.
   The orbit of a cone in the realization is the image, under the inclusion of the chart of the
   cone, of its stratum `affineConeOrbit` as a face of itself.
3. For each ray, construct the invariant closed embedded complex hypersurface. For a nonempty
   fan, prove that the finite union of these components is exactly the complement of the dense
   torus, the orbit of the zero cone. Prove that every component has reduced multiplicity one.
4. At every point, construct a regular affine chart, the finite set of boundary components
   through the point, and an injection from those components to coordinate indices. Make this a
   complex local biholomorphism and prove that a point of the chart lies in a component exactly
   when the corresponding holomorphic coordinate vanishes.
5. Deduce transversality and the intersection formula indexed by cones. Prove naturality under
   fan isomorphisms, products, and open subfans.

**Source spine:** Fulton, §§2.1--2.2 and §3.1; Cox--Little--Schenck, §§3.2--3.3 and §4.1.

## Layer 5: toric maps and properness

1. Glue the affine mixed monomial maps attached to a fan morphism. On the chart of a cone
   `sigma` the glued map is `AffineSemigroupComplexPoint.comap` of the map of dual semigroups
   `dualSemigroupMap`, into the chart of the least target cone `FanHom.leastCone`: the analytic
   counterpart of Tau Ceti's `FanHom.affineToricChartι_comp_algebraicMap`. Prove holomorphy,
   identity, composition, product compatibility, and, for a nonempty source fan, uniqueness from
   the dense torus.
2. Describe preimages of affine cone charts and orbit strata cone by cone. Prove restriction and
   base-change results for open subfans. For the inclusion `Fan.subfanInclusion` of an open
   subfan the glued map is the open-subfan map of Layer 3, item 5.
3. For finite source and target fans with a nonempty source, prove that the analytic map is
   proper exactly when, for every target cone, its real-linear inverse image equals the support of
   the source cones mapped into that cone. The source must be nonempty: the inclusion of the empty
   subfan of a nonempty fan is proper, but `0` lies in the inverse image of every target cone and
   in no source cone.
4. Deduce that a nonempty finite regular fan is complete exactly when its realization is compact,
   and that a star subdivision induces a proper map because the supports agree. A subdivision
   `Fan.IsSubdivision` induces, through `Fan.IsSubdivision.toFanHom`, a holomorphic map to the
   original realization, not an asserted isomorphism.
5. Prove that a fan isomorphism induces a biholomorphism, with inverse induced by the inverse fan
   morphism.

**Source spine:** Fulton, §2.4; Cox--Little--Schenck, §3.3 and Theorem 3.4.11.

## Layer 6: global algebraic--analytic comparison

1. For every cone, compare algebra homomorphisms from its complex monoid algebra to `C` with
   morphisms `Spec C -> U_sigma` over `Spec C`. Prove compatibility with the independent
   monomial-embedding topology.
2. Prove that complex points, for the structure morphism of Layer 0, item 9, preserve the finite
   affine-open gluing used to construct the fan scheme `Fan.algebraicRealization`. Identify the
   resulting topological gluing with `TopCat.GlueData.glued` and show that both overlap maps are
   the same face-localization maps.
3. Glue the affine comparisons to a torus-equivariant homeomorphism from the complex points of
   `X_Sigma` to the analytic realization, which on every affine chart is the identity of complex
   points. Prove it and its inverse are holomorphic.
4. Prove naturality for fan morphisms, which act by `FanHom.algebraicMap` and by the glued map
   of Layer 5, and for characters, products, orbit inclusions, and boundary components. For a
   nonempty fan, the comparison identifies analytic compactness with algebraic completeness
   through the common finite-fan support criterion.

**Source spine:** Cox--Little--Schenck, Chapters 1 and 3; Fulton, Chapters 1--2; Gunning--Rossi,
Chapter I.

## Dependency order

| Track | Depends on | Feeds |
| --- | --- | --- |
| L0 algebraic supplier | Mathlib and Tau Ceti's algebraic toric modules | every later layer |
| L1 character and mixed-monomial calculus | L0, Mathlib complex analysis | L2, L5--L6 |
| L2 affine regular charts | L0--L1, Mathlib's manifolds | L3--L6 |
| L3G gluing theorem, ComplexManifolds | Mathlib manifolds, `TopCat.GlueData` | L3 items 2, 6 |
| L3 finite-fan gluing | L2, L3G | L4--L6 |
| L4 orbit and boundary theory | L2--L3 | L6 and downstream geometry |
| L5 maps and properness | L1--L3 | L6 and compactness applications |
| L6 global comparison | L0--L5 | reusable analytic realization |

After L0 fixes the carriers, L1's character calculus and the generator-independence part of L2
can proceed in parallel. L3G is Milestone 5 of the ComplexManifolds roadmap, and Tau Ceti
implements the part that L3 uses; it depends on nothing in this roadmap.
Within L3, items 3--5 are topological and use only the glued space of item 1, so they proceed in
parallel with item 2; item 6 needs item 2. L4 and L5 can proceed independently after L3. L6
joins those tracks.

## Acceptance checks

- The map `ℤ² -> ℝ`, `(a,b) |-> a + √2 b`, is rejected as an integral lattice even though it
  is injective and has full real span. It cannot produce two competing primitive generators of
  the same ray.
- The full line in a rank-one real lattice is a Mathlib `PointedCone` but fails the toric-cone
  salience predicate. Its dual semigroup gives a point; it is never accepted as the cone of an
  affine toric curve with a dense one-dimensional torus.
- The affine ray cone produces `C`, the zero cone produces `C^*`, and face localization is the
  ordinary inclusion `C^* -> C`.
- A rank-`n` regular cone of dimension `k` produces a chart biholomorphic to
  `C^k x (C^*)^(n-k)`. Two extending bases give the same atlas.
- A mixed monomial with a negative exponent in a noninvertible source coordinate is rejected by
  its type. Identity and composition agree with matrix block composition on `mixedChartDomain`;
  no equality is claimed at ambient points with zero torus coordinates.
- The fan with only the zero cone produces the coordinate-free complex torus. A basis identifies
  it with `(C^*)^n`, and changing basis acts by the corresponding Laurent monomial map.
- The standard complete fan produces complex projective space with its standard affine charts;
  the comparison respects homogeneous-coordinate monomials.
- Product fans realize as products of complex manifolds, with matching character and orbit
  formulas.
- A star subdivision gives the expected proper toric map through the finite-fan support
  criterion.
- The empty subfan of a nonempty regular fan is a regular fan whose realization is empty, and the
  open-subfan map of Layer 3, item 5 accepts it. Its inclusion is proper, while `0` lies in the
  inverse image of every ambient cone and in no cone of the empty subfan, so it fails the support
  condition. Its realization is compact, and it is not complete. The nonemptiness hypothesis of
  the properness and compactness criteria excludes exactly this case.
- The boundary is proved to be a finite ray-indexed family of closed embedded complex
  hypersurfaces through a holomorphic coordinate-hyperplane local normal form. A
  `PartialHomeomorph` or a stored SNC assertion is insufficient.
- The global comparison starts from the morphisms `Spec C -> X_Sigma` over `Spec C`, agrees on
  every affine chart and overlap, and is natural for toric maps. An unrelated homeomorphism of
  final carriers is insufficient.
- No public declaration introduces a competing convex-cone, semigroup-algebra, scheme, gluing
  quotient, or biholomorphism carrier, a second copy of a Tau Ceti toric object, or a second
  gluing construction for manifolds.

## References

- William Fulton, *Introduction to Toric Varieties*, Annals of Mathematics Studies 131,
  Princeton University Press, 1993, especially Chapters 1--2.
- David Cox, John Little, and Henry Schenck, *Toric Varieties*, Graduate Studies in Mathematics
  124, American Mathematical Society, 2011, especially Chapters 1, 3, and 4.
- Tadao Oda, *Convex Bodies and Algebraic Geometry*, Ergebnisse der Mathematik 15,
  Springer, 1988, Chapter I.
- Robert Gunning and Hugo Rossi, *Analytic Functions of Several Complex Variables*, Prentice-Hall,
  1965, Chapter I.
- John M. Lee, *Introduction to Smooth Manifolds*, second edition, Graduate Texts in Mathematics
  218, Springer, 2013, Chapter 1.
- Yaël Dillies et al., [*Toric varieties in Lean*](https://github.com/YaelDillies/Toric), prior
  work on tori, monoid algebras, affine monoids, and the `ToricVariety` class, cited but not a
  dependency.

# Roadmap: algebraic topology of spaces and manifolds

**Summary.** This roadmap develops the map-level algebraic topology needed to calculate spaces from open
covers, CW structures, fibrations, and manifold decompositions.  It starts at Mathlib's singular
chains, fundamental groupoid, topological pairs, cubical homotopy groups, and classical CW
complexes.  It ends with reusable van Kampen, relative homology, excision, cellular comparison,
duality, Euler-characteristic, Hurewicz, Whitehead, ordinary Eilenberg–MacLane (EM)
representability, and relative obstruction theorems.

The point is a coherent library, not a collection of answers for particular spaces.  Every
calculation is induced by maps, chain maps, or natural transformations.  Homology groups are not
stored as fields asserting the desired answer, and a list of cell counts is not accepted in place
of an actual CW structure.

Suggested homes are `TauCeti/AlgebraicTopology/FundamentalGroupoid/`,
`TauCeti/AlgebraicTopology/Singular/`, `TauCeti/AlgebraicTopology/Cellular/`,
`TauCeti/AlgebraicTopology/Cohomology/`, and `TauCeti/AlgebraicTopology/Homotopy/`.

## Scope and ownership

The roadmap is complete when Tau Ceti supplies all of the following, with naturality and the
stated coefficient generality.

1. The fundamental-groupoid functor sends an open cover to the appropriate colimit and yields
   based van Kampen and presentation corollaries without connectedness assumptions on
   intersections.
2. Relative singular homology is a functor on `TopPair`, obtained through `SSetPair`, and satisfies
   the long exact sequence, homotopy invariance, excision, Mayer--Vietoris, dimension, and
   additivity axioms, including local-coefficient pair/triple sequences,
   transported homotopy invariance, excision and Mayer--Vietoris.
3. Mathlib's `CWComplex` and `RelCWComplex` structures have cellular chain complexes whose
   homology is naturally isomorphic to singular homology, including module-valued local
   systems with attaching-path transport. Cofibration, mapping-cylinder,
   cellular-approximation, and skeletal-induction APIs make those comparisons usable.
4. Mapping tori, finite covers, finite open covers, and fibre bundles have reusable chain-level
   tools: Wang and transfer sequences, coefficient-sensitive Kunneth theorems, Cartan--Leray and
   Serre spectral sequences, torus calculations, and a finite-open-cover Čech double complex.
5. Singular cohomology, cup and cap products, twisted relative fundamental
   classes, both local-coefficient Poincare--Lefschetz forms and their oriented
   integral corollaries, and Euler characteristic are available with naturality.
6. On Tau Ceti's based pairs, relative homotopy groups and Hurewicz maps, absolute Hurewicz
   holds in every universe and relative Hurewicz for a simply connected subspace; Hurewicz
   modulo a Serre class holds for simply connected spaces; homological
   Whitehead is proved for CW complexes and then for spaces of CW type.  The cubical and
   Kan-simplicial models of homotopy groups are naturally compared rather than allowed to form
   separate incompatible APIs.
7. Singular and cellular restriction towers are compared with cochains on the whole
   CW pair, using Tau Ceti's lim/lim¹ and Milnor sequences, with
   cofinal-shift naturality and the specified-homotopy-square maps of Layer 6.0.

8. Ordinary cohomology in positive degree is represented on spaces of CW type by every
   Eilenberg–MacLane space, and on CW pairs by this roadmap's functorial abelian
   Eilenberg–MacLane models (Layer 8.8c);
   nonabelian classifying spaces, universal classes, loop comparisons,
   and primary relative obstruction cochains have explicit normalization and transport maps.

The scope includes ordinary cohomology on arbitrary CW complexes and the tools needed for
compact manifolds and finite CW-type spaces.  It
does not include generalized cohomology theories, spectra, bordism, or surgery obstruction
groups.  Those theories consume this roadmap's chain, CW, duality, and homotopy interfaces.

### Ownership boundaries

- Tau Ceti already proves, at the revision the supplier contracts are read at, a part of
  this subject that this roadmap consumes and does not restate: the no-retraction and
  Brouwer fixed-point theorems, the chain transfer of a finite covering with its degree and
  deck-sum formulas, Lusternik–Schnirelmann categorical covers and their unnormalized count,
  based top pairs with their relative homotopy groups, exact sequence, basepoint change,
  cell-dimension connectivity and Hurewicz maps, absolute Hurewicz for spaces in `Type` and
  relative Hurewicz when both spaces are highly connected, ordinary Whitehead for spaces of CW
  type, spaces of CW type and of finite CW type, simple connectivity at infinity, proper
  homotopy equivalences, the Euler characteristic of spaces of finite CW type with its
  homotopy invariance and product, covering, Mayer–Vietoris and standard values, the field
  and hereditary-ring Künneth theorems, the hereditary-ring universal coefficient sequence,
  barycentric subdivision with its prism homotopy (also with local coefficients), the
  small-chain theorem, the pair and triple sequences and homotopy invariance with local
  coefficients, the Wang sequence of the mapping torus of a homeomorphism, the homology of tori
  as exterior powers, the ordered Čech double complex with its quasi-isomorphism to singular
  chains and its spectral sequence, the coefficient Bockstein, the constant-coefficient cup and
  cap products with their naturality, associativity, unit and graded commutativity,
  the local homology system of a manifold, Hatcher's Lemma 3.27 (p.236) and the description of the
  top homology of a compact manifold by transport-invariant local classes with module
  coefficients over any ring, integral homological orientations and integral fundamental
  classes of closed manifolds, the based van Kampen presentations, the cube, ball and disk
  homeomorphisms and the cube quotient of the sphere, lifted CW structures on covering spaces,
  incidence numbers as local degrees, real projective space with its CW structure and
  incidences, neighbourhood-deformation-retract (NDR) data, closed embeddings and separation of pushouts and sequential colimits
  with their finite-stage factorization, homotopy groups of Kan complexes with their
  comparison to cubical ones, Moore's theorem with the abelian Moore comparison, and the ends
  of a space. It also proves the degree-one Hurewicz isomorphism of a path-connected space,
  the invariance of singular homology with constant and local coefficients under weak
  homotopy equivalences, CW approximation of path-connected spaces with its lifts, the
  spectral sequence of a filtered complex with its filtered-space instance on singular
  chains, Hurewicz fibrations with their lifting functions, mapping-path fibrations and
  fibre transport, the torsion Serre classes, the killing tower of homotopy groups, the
  finite CW structure of complex projective space on its sphere-quotient carrier and the
  comparison of the circle with Milnor's classifying space of ℤ.
  Mathlib has the compact-generation coreflection and the quotient topology of
  projective space. The supplier contracts name each declaration and file; the layers below
  build only what those files lack.
- The [universal-covers roadmap](../../Completed/UniversalCovers/README.md) owns universal-cover
  construction, deck transformations, quotient covers, basepoint change, and induced maps on
  homotopy groups.  This roadmap consumes those maps, extends the higher-homotopy API with
  relative groups and comparison theorems, and does not construct another universal cover.
- The [geometric-topology roadmap](../GeometricTopology/README.md) owns smooth and PL
  triangulations, manifold boundaries and collars, gluing, connected sum, cobordism carriers,
  and geometric surgery.  This roadmap owns algebraic topology of CW pairs and proves results
  about any space of CW type. The finite-dimensional Hausdorff second-countable
  smooth-manifold CW comparison consumes GeometricTopology §11.3's smooth triangulation;
  compact manifolds have finite CW type. Layer 8.13 consumes geometric topology's Layer 1
  tubular neighbourhood theorem and owns, for boundaryless sigma-compact Hausdorff
  second-countable sources, an arbitrary compact boundaryless target manifold and an
  arbitrary closed embedded submanifold, the smoothing of continuous maps relative to a
  closed set, the parametric transversality theorem and relative transversality.
  TangentialBordism B1.6 consumes these three for boundaryless sources and extends them to
  sources with corners (facewise transversality), together with its own Sard theorem in
  unequal dimensions on manifolds with corners; nothing in this roadmap consumes
  TangentialBordism. DeRhamCohomologyAndDuality Layer 5 states the analogue for families
  against maps into a vector space by its own route and consumes nothing here.
- The [differential-geometry roadmap](../DifferentialGeometry/README.md) owns the
  Mathlib-compatible manifold orientation and degree API (its layers 2 and 10),
  and the outward-normal-first boundary orientation of Layer 5.1, which the
  [Heegaard Floer roadmap](../HeegaardFloer/README.md) also consumes.  This roadmap consumes it to
  compare smooth orientations with sections of the homological orientation
  system using DifferentialGeometry Layer 2 and DifferentialGeometry Layer 5.1, construct twisted relative fundamental classes and
  their oriented integral specializations, and own the chain-level proof and
  consequences of manifold duality. Layer 6.3 builds its local-homology determinant-sign
  calculation from relative chains and excision.
- The differential-geometry roadmap consumes this roadmap's singular chains and cochains, relative
  cohomology, subdivision and small chains (Layers 2, 3 and 6), and needs Layer 6's universal
  coefficients, cup product and cochain Mayer–Vietoris sequence for the de Rham theorem. It owns
  smooth singular chains, integration over them and the de Rham comparison. Layer 6.3 consumes
  DifferentialGeometry Layer 2's tangent-orientation API and DifferentialGeometry Layer 5.1's outward-first boundary orientation; DifferentialGeometry Layer 9.3 consumes
  Layer 6.3's homological orientation system, chart-normalized point generators, chosen local
  section, relative twisted class datum and compact-support class factory. DifferentialGeometry Layer 9.3 owns the
  smooth/constant-system/real-coefficient conversions and the integration comparison.
  After this independent Layer 6.3 class construction, Layer 6.5 compares its
  homological degree characterization with DifferentialGeometry Layer 10's smooth mapping degree.
  DifferentialGeometry Layer 9.3 and DifferentialGeometry Layer 10 do not consume Layer 6.5's degree comparison; neither is a
  prerequisite for the Layer 6.3 orientation-system or fundamental-class construction.
- The [profinite-cohomology roadmap](../ProfiniteCohomology/README.md) owns continuous
  cohomology of profinite groups.  The singular cohomology here is cohomology of topological
  spaces; neither development introduces a second version of the other's objects.
- Milnor's classifying space, its K(G,1) property, the uniqueness of K(G,1) spaces of CW
  type, its functoriality, the cellular and presentation models and the identification of
  its singular and local-coefficient (co)homology with Mathlib's group (co)homology are Tau
  Ceti's and are consumed through the supplier contracts; the
  [ClassifyingSpaces](../ClassifyingSpaces/README.md) roadmap builds on the same
  declarations, and Layer 8.8 and §8.14 consume its items 1.1 and 1.2 for the pointed
  classification of maps into an aspherical space, and nothing else of it. Layer 8.8 owns only
  the nerve model:
  Layer 8.8a the raw nerve/bar construction and its K(G,1) property, Layer 8.8b its
  comparison with Milnor's model normalized to the identity on π₁, obtained from Tau Ceti's
  uniqueness theorem, and the transport of the native group-(co)homology identifications
  along that comparison. The raw bar also supplies the abelian input used by Layer 8.8c.
- The ordinary Serre and Eilenberg–MacLane machinery is owned here wherever the pinned
  Tau Ceti does not already prove it. Tau Ceti proves the degree-one Hurewicz isomorphism,
  absolute Hurewicz for spaces in `Type`, relative Hurewicz for highly connected pairs,
  Whitehead's theorem, the homology invariance of weak equivalences and CW approximation
  of path-connected spaces (supplier contracts); every layer consumes them and no layer
  restates them. Layer 4.10 consumes the native weak-equivalence invariance and owns its
  connected-map refinement with local coefficients, CW approximation of arbitrary spaces
  and of pairs. Layer 5.0 consumes the native spectral sequence of a filtered complex and
  owns its homological regrading under degreewise filtration bounds, its
  decreasing-filtration reindexing and its complete-convergence form. Layer 5.5 owns
  homotopy lifting for a Serre fibration against every relative CW pair, the fibration
  homotopy long exact sequence (LES) on native `TauCeti.TopCat.serreFibrations`, the free
  path fibration and its pullbacks, fibre transport for Serre fibrations, and the
  homological and cohomological Serre spectral sequences on singular chains, over CW and
  arbitrary bases, built on the native filtered-space spectral sequence. The
  Serre-fibration morphism property itself, with its disc and cube characterizations,
  base change and the covering-map, product-projection and locally-trivial-bundle
  instances, is Tau Ceti's (supplier contracts) and is not restated. Layer 8.8c owns the
  single functorial abelian K(A,n) family, whose degree-one model aliases Layer 8.8a's
  generic bar construction and whose n≥2 models are the fixed Dold–Kan Γ(A[n])
  realizations, with the coefficient-natural normalized π_n identification, including the
  comparison of Γ(A[1]) with the abelian nerve. Layer 8.8d consumes the native torsion
  Serre classes and owns Hurewicz modulo a class. Layer 8.8 owns the generic
  discrete-group bar/CW/cover proof. Layer 8.3 consumes the native degree-one Hurewicz
  isomorphism π₁(X)ᵃᵇ ≅ H₁(X;ℤ) and the native absolute theorem and owns their comparison
  with the sphere normalization of Layer 4.4, and Layer 8.10 consumes the 8.8c family and
  that degree-one isomorphism. The 8.8c constructor uses only Layers 4.7, 4.10 and
  8.1–8.8a, with 5.5's based path fibration for its loop identification, preceding
  representability and obstruction theory.
  [DGFloer](../DGFloer/README.md) Layer 1 consumes these ordinary targets for its cubical
  transports and comparisons; GeneralizedCohomology G2 and G5, TopologicalKTheory T1.5
  and ComplexKahlerGeometry K8 consume them directly. DGFloer's standing Moore-loop
  conventions and its Layer 2 item 3 consume 8.11b's fixed-interval loops for their
  carrier comparisons.
- The compact-generation coreflection itself is Mathlib's `GeneratedByTopCat.adj`, taken
  for the family of all spaces of `CompHaus`, with its coreflectivity, created colimits and
  limits (supplier contracts). Layer 4.8 owns its identification with Mathlib's
  `CompactlyGenerated`, and on that coreflection the convenient products, exponentials, CW
  comparisons and the foundational pointed suspension–loop adjunction.
  Pointed cones, Puppe sequences and stabilization are consumers of this
  foundation and of this roadmap's cofibration and relative-homotopy results; supply
  runs from this roadmap to those applications. Layer 4.4 owns the
  additional raw-quotient comparisons
  and their interval-last normalization. Layer 4.9 owns the single
  simplicial-realization product comparison, consumed by 8.10 and 8.11b; it rests on
  Layer 4.7's realization CW structure, Layer 4.5's Kelley product CW structure and this
  coreflection, with no ordinary representability or Eilenberg–MacLane family input.
  [GeneralizedCohomology G2.1](../GeneralizedCohomology/README.md) consumes that
  comparison for its pointed smash/quotient versions and monoidal diagrams.
- The generic algebra of countable towers of modules is Tau Ceti's
  (`TauCeti.ModuleTower`, `TauCeti.ComplexTower`; supplier contracts): the product
  difference map, lim and lim¹, the six-term sequence, Mittag–Leffler vanishing,
  Milnor sequences for towers of complexes of every shape, cofinal subsequences and the
  derived limit as the shifted cone of the difference map. Layer 6.0 owns the one
  generic tower construction the library lacks, the maps of shifted cones induced by
  tower maps whose squares commute up to specified homotopies, with their composition
  and second-homotopy laws; it has no topological prerequisite, and its algebraic
  consumers take it from 6.0 (DerivedModuleAlgebra §1.1's localization of the derived
  limit consumes it for its exact-functor comparison). Layer 6.0 also owns the singular and cellular restriction-tower
  adapters and their limit comparisons; Layer 6.1 extends these comparisons to direct
  local-system cochains.
- TopologicalSheafCohomology §§1.1–1.2 owns raw Čech refinements, the comparison
  of ordered and tuple complexes, refinement homotopies and the cohomology colimit.
  CharacteristicClasses §C1.2b owns the constant-coefficient Čech/singular comparison;
  ImplicitAtlases §0.7 uses the shared sheaf-coefficient theory for its atlas engine.
  Compact closed-pair Čech theory, continuity and cube-module extensions are outside
  this base roadmap's singular-cohomology completion criterion.
- [Topological K-theory](../TopologicalKTheory/README.md) T1.6 consumes the
  earlier CW/Whitehead tools for its named fixed-rank infinite Grassmannian
  carriers, their final/weak CW topology and universal bundles.
  [CharacteristicClasses C1.5](../CharacteristicClasses/README.md) consumes
  Layers 4 and 6 for the finite-projective/cellular/cup comparisons on the
  rank-one RP∞ and CP∞ carriers, and CharacteristicClasses C1.5a consumes Layer 8.8's
  bar model of ℤ/2 with its normalized π₁ identification, Layer 8.10's ordinary models
  and representability and Layer 8.12's native circle comparison for its identification
  of those carriers as the ordinary EM spaces K(ℤ/2,1) and K(ℤ,2), with the generator
  normalizations on them. No layer here consumes those carriers, comparisons or
  that identification. CharacteristicClasses C1.2a consumes the compactly
  supported local-coefficient cochains of the supported-cellular supplement
  after Layer 6.2 (their support colimit, enlargement and cofinality
  comparisons, proper pullback, open extension and jointly proper homotopy
  invariance) for its support excision and collared-pair triangle; no layer
  here consumes that excision or that triangle.
- Layer 8.13 owns the smoothing and transversality targets and the transverse circle
  classifying map of an integral degree-one class. The projective-hyperplane adapter
  (the Thom classes of the hyperplane normal lines of RP^N and CP^N and their
  single-point intersection counts), the Gysin comparison i_*[N]=PD_M(f*u) of a
  transverse preimage and the resulting representation of mod 2 classes of codimension
  one and integral classes of codimensions one and two by embedded submanifolds need
  Thom, Euler and Gysin maps and the projective carriers with their classes;
  CharacteristicClasses C2.4a consumes Layers 6.4, 8.7, 8.10, 8.12 and 8.13 for them, and no
  layer here consumes them. Layer 8.16 owns its statement for every Serre fibration
  S³→S² whose fibres have vanishing third homology; CharacteristicClasses C7.6 consumes it
  for the Hopf projection of its principal circle bundle S³→CP¹, and no layer here
  consumes that bundle model.
- The high-dimensional differential-topology and homotopy-sphere roadmap consumes Hurewicz,
  Whitehead, duality, finite CW type, and the homology of spheres from this roadmap.  Stable
  homotopy, framed bordism, and the Kervaire--Milnor calculation live there.

## Conventions

These choices are part of the specification.

- **Use genuine CW models.** A CW complex here carries both the native
  `CWComplex` structure and `T2Space` on its carrier. Finite CW type is Tau
  Ceti's `TauCeti.FiniteCWType`: a homotopy equivalence to a CW complex C⊆K
  with finitely many cells in a Hausdorff space K of the same universe; general
  CW type is the same condition without finiteness, Tau Ceti's `TauCeti.CWType`.
  Statements about spaces of CW type take that class as a hypothesis.
  Retain and install the model's topology, Hausdorff, CW and finiteness
  witnesses when using a finite model.
  Hausdorffness of an original space is not transported to a chosen model
  by homotopy equivalence. A bare native CW instance without separation
  does not supply the cellular comparison or Whitehead hypotheses.

- **Use Mathlib's categories.**  Spaces and maps live in `TopCat`; pairs live in `TopPair` and
  `SSetPair`; chains live in `ChainComplex`; exact sequences use the existing homological-complex,
  `ShortComplex`, and exactness APIs.  Do not bundle a space together with claimed homology.
- **Keep maps visible.**  Every induced map is the image of a continuous map, a pair map, or a
  chain map.  A result expressed only as unrelated equivalences in each degree is incomplete.
- **Work at natural coefficient generality.**  Singular chains and relative homology take a
   coefficient object in the appropriate preadditive category.  Module-valued corollaries state
   the ring and module hypotheses they use.  Field isomorphisms, principal ideal domain (PID) or hereditary-ring short
   exact sequences, and general-ring spectral sequences are separate theorems.  Integral
   specialization occurs only where orientations, torsion, degree, or Euler characteristic
   require it.
- **Use groupoids before groups.**  Van Kampen is first a colimit theorem for the fundamental
  groupoid on a set of basepoints.  The familiar based group theorem is derived under explicit
  path-connectedness hypotheses.  Disconnected intersections never acquire arbitrary paths.
- **Use actual CW structures.**  Cellular chains use `CWComplex.cell` and characteristic maps;
  relative statements use `RelCWComplex`.  Attaching degrees define differentials, and the proof
  that consecutive differentials compose to zero comes from the filtration exact couple.
- **Pin reduced and unreduced conventions.**  Reduced homology is the kernel of augmentation in
  degree zero and agrees with ordinary homology in positive degrees.  Relative homology of
  `(X, empty)` agrees naturally with ordinary homology.  All connecting morphisms use the
  homological grading convention `d : C_(n+1) -> C_n`.
- **Pin signs once.**  The singular boundary uses the alternating deletion convention.  The
  Mayer--Vietoris map from an intersection is `(i_U, -i_V)`, the cochain differential is induced
  by precomposition with the chain differential, and cup/cap signs follow the
  Alexander--Whitney convention. Pin cap to Hatcher's front-face/back-face formula
  `σ⌢φ=φ(σ|[v₀,…,v_k])·σ|[v_k,…,v_n]`. In the local-coefficient version,
  pair coefficients at v₀ and transport the result along [v₀,v_k] to the
  first vertex of the surviving back face. Its boundary identity is
  `∂(c⌢φ)=(−1)^k(∂c⌢φ−c⌢δφ)` for φ of degree k.
  Convention-checking examples below must compute with these signs.
- **Treat homotopy models by comparison.**  Mathlib's cubical `HomotopyGroup` remains a public
  interface.  Kan-simplicial homotopy groups are also constructed because they interact well
  with `TopCat.toSSet`; a natural comparison identifies the two, including induced maps,
  basepoint change, suspension, and relative boundary morphisms.
- **Base relative homotopy in the subspace.**  Relative homology remains a functor on unbased
  `TopPair`, but relative homotopy uses Tau Ceti's based top pair `TauCeti.BasedTopPair`, with
  `pair : TopPair` and `basepoint : pair.snd`. Its morphisms are pair maps whose subspace
  component preserves that point. Relative cubes, groups, boundary maps, the long exact
  sequence, basepoint change, functoriality, and relative Hurewicz all take this based carrier;
  no declaration chooses a point from a bare pair.
- **Finiteness is a hypothesis.**  Euler characteristic is Tau Ceti's alternating cell count
  `TauCeti.cwEulerChar` of a finite CW complex and its transport `TauCeti.eulerChar` to spaces of
  finite CW type.  Additivity and multiplicativity state the necessary cofibration, excision,
  and finite-generation hypotheses.

## Exact supplier contracts

### From Mathlib and Tau Ceti

The development starts from these pinned APIs, read at the revisions the content
repository's manifest records: Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5` and
Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`. Every declaration, module and file
named in this section is cited as it is at those revisions.

- `CompactlyGenerated`, `CompactlyGenerated.compactlyGeneratedToTop` and
  `CompactlyGenerated.fullyFaithfulCompactlyGeneratedToTop` in
  `Mathlib/Topology/Category/CompactlyGenerated.lean` supply the category and
  its fully faithful inclusion, without a separation axiom. The topology
  `TopologicalSpace.compactlyGenerated`, `eq_compactlyGenerated`,
  `continuous_from_compactlyGenerated` and
  `continuous_from_uCompactlyGeneratedSpace` in
  `Mathlib/Topology/Compactness/CompactlyGeneratedSpace.lean` supply the compact-test
  topology and continuity criterion. Layer 4.8 identifies this category with Mathlib's
  coreflective category of generated spaces (next item) and builds the pointed
  constructions on it; it does not redefine the topology.
- Generated spaces in `Mathlib/Topology/Convenient/`: for a family of spaces `X i`, the
  generated topology `TopologicalSpace.generatedBy`, coinduced by all continuous maps from the
  `X i`, written as one coinduced topology from a sigma type by
  `TopologicalSpace.generatedBy_eq_coinduced` (`GeneratedBy.lean`); the full subcategory
  `GeneratedByTopCat X` of `TopCat` with the adjunction `GeneratedByTopCat.adj`, whose left
  adjoint is the inclusion and whose right adjoint `TopCat.toGeneratedByTopCat` retopologizes
  a space by the generated topology, with invertible unit, and the instances `Coreflective`,
  `CreatesColimits`, `HasLimits` and `HasColimits` (`Category.lean`); and, when every `X i` is
  locally compact and every product `X i × X j` is generated by the family, the currying
  bijection `Topology.ContinuousMapGeneratedBy.curryEquiv` and the evaluation
  `Topology.ContinuousMapGeneratedBy.ev` (`HomSpace.lean`). With Mathlib's instances that
  sequential spaces and Hausdorff weakly locally compact spaces are compactly generated
  (`Mathlib/Topology/Compactness/CompactlyGeneratedSpace.lean`) and that delta-generated spaces
  are sequential (`DeltaGeneratedSpace.lean`), and Tau Ceti's instance
  `TauCeti.instDeltaGeneratedSpaceCWComplex` that a Hausdorff CW complex is delta-generated
  (`Topology/CWComplex/Classical/DeltaGenerated.lean`), these are what Layer 4.8 consumes for
  the family of all spaces of `CompHaus`; it constructs no second coreflection.
- `TopCat`, `TopCat.toSSet`, `SSet.chainComplex`, `singularChainComplexFunctor`, and
  `singularHomologyFunctor`.
- `TopPair`, `TopPair.ofSubset`, `TopPair.incl`, `TopPair.diag`, and the
  `TopPair.HomologyPretheory` classes already present at the dependency pin.
- `TopPair.singularHomology`, `TopPair.singularHomologyMap`,
  `TopPair.singularHomologyMap_id`, `TopPair.singularHomologyMap_comp` and
  `TopPair.singularHomologyFunctor` in
  `TauCeti/AlgebraicTopology/Singular/Relative.lean`, and
  `TopPair.singularHomologyInclIso` with its quotient-induced component
  `TopPair.singularHomologyInclIso_hom_app` in
  `TauCeti/AlgebraicTopology/Singular/Empty.lean`. For spaces in universe w,
  these use a preadditive category C with w-small coproducts and
  `CategoryWithHomology C`, and a coefficient object R of C. The natural
  isomorphism goes from absolute homology to relative homology of (X,∅);
  its inverse gives the reverse comparison. No abelian-category hypothesis
  is added to these declarations; short exact chain sequences use one separately.
- `FundamentalGroupoid`, `FundamentalGroup`, induced maps, homotopy invariance, and Mathlib's
  covering and homotopy-lifting APIs.
- Native `FundamentalGroup.cast_map_prod_mul` and `FundamentalGroup.instCommGroup` in
  `TauCeti.AlgebraicTopology.FundamentalGroup.TopologicalMonoid`: for a space with a
  continuous multiplication and a two-sided unit, the class of the pointwise product of
  two loops at `1` is their product in `FundamentalGroup`, and that group is commutative.
  Layer 1.6 consumes both and adds only naturality and the comparison with
  `FundamentalGroup.mul_def`.
- Tau Ceti's native local coefficient system and its constant/pullback/
  transport API in `TauCeti.AlgebraicTopology.LocalCoefficient`, absolute
  twisted chains in `TauCeti.AlgebraicTopology.Singular.Twisted.Basic`, and
  `TopPair.twistedChainComplex`/`twistedHomology` in its `Twisted.Relative`
  module. Ordinary relative chains use `TopPair.singularChainComplexFunctor`
  from `TauCeti.AlgebraicTopology.Singular.Relative`; ordinary cohomology uses
  `TopCat.singularCohomology` from `TauCeti.AlgebraicTopology.Cohomology.Basic`.
  Native `LocalCoefficientSystem.twistedCochainComplex` and
  `TopPair.twistedCochainComplex` in `Cohomology.Twisted.Basic`/`Relative`
  apply Hom to L-twisted chains, so they compute dual-system cochains.
  Consume those constructions with their dual-system convention, and build
  direct L-valued cochains without assuming fibrewise reflexivity.
  Consume these carriers and extend their APIs for the comparisons below.
- Native relative quotient colimits and short exact sequences in `Singular.Relative`,
  pair/triple sequences in `Singular.Triple`, `singularHomologyPretheory` in
  `Singular.HomologyPretheory`, and the `DiskSphere`, `DiscretePair` and
  `Additivity` modules. Consume their constant-coefficient objects and proofs,
  extending the comparisons and local-coefficient theory below. The long exact
  sequence of a pair (Hatcher, §2.1, pp.117 and 127) is the short exact sequence
  `TopPair.shortExact_singularChainComplexShortComplex`, the connecting morphism
  `TopPair.singularHomologyδ`, exactness at the three terms
  `TopPair.singularHomology_exact_subspace`, `TopPair.singularHomology_exact_space` and
  `TopPair.singularHomology_exact_relative`, and naturality
  `TopPair.singularHomologyδ_naturality` (`Singular/Relative.lean`). That of a triple
  B⊆A⊆X, from `0 → C_n(A,B) → C_n(X,B) → C_n(X,A) → 0` (Hatcher, §2.1, pp.118 and 128),
  is `TauCeti.TopTriple.shortExact_singularChainComplexShortComplex`,
  `TauCeti.TopTriple.singularHomologyδ`, `TauCeti.TopTriple.singularHomology_exact_inner`,
  `TauCeti.TopTriple.singularHomology_exact_total`,
  `TauCeti.TopTriple.singularHomology_exact_outer` and
  `TauCeti.TopTriple.singularHomologyδ_naturality` (`Singular/Triple.lean`). Both
  connecting morphisms are Mathlib's `CategoryTheory.ShortComplex.ShortExact.δ` of these
  short exact sequences, so the description of δ as the class of the boundary of a
  relative cycle is `CategoryTheory.ShortComplex.ShortExact.δ_eq`. §§3.3, 5.2 and 8.4
  consume these sequences.
- Native `FundamentalGroupoid.CoverGeneration`, groupoid `Pushout`,
  `FundamentalGroup.VanKampen` and `WedgeSum`, and `FundamentalGroupoid.Circle`:
  cover generation, two-open-set groupoid/group pushouts, the wide-groupoid
  van Kampen equivalence, wedge-of-circles free groups and the disconnected
  two-arc circle test. Extend their naturality and example computations.
- Native `TopCat.eilenbergZilberHomotopyEquiv`, Alexander–Whitney and shuffle
  maps in `Singular.EilenbergZilber`/`AlexanderWhitney`/`Shuffle`, and the native
  homology cross product `TopCat.singularHomologyCross` in `Singular.CrossProduct`:
  the map `H_p(X;R) ⊗ H_q(Y;S) → H_n(X × Y;R ⊗ S)` for `p + q = n`, with its value on
  cycle classes (`homologyπ_tensorHom_singularHomologyCross`), its naturality in the
  spaces (`singularHomologyCross_naturality`) and in the coefficients
  (`singularHomologyCross_coefficient_naturality`), and its comparison with the
  algebraic cross product of the singular chain complexes under Alexander–Whitney
  (`singularHomologyCross_comp_homologyMap_alexanderWhitney`). The pin states these
  for a preadditive monoidal category with homology and the colimit-preservation
  hypotheses that `ModuleCat` satisfies by instance search. The local-coefficient,
  relative and spectral-sequence extensions use these maps.
- The Künneth theorems in `Singular.Kunneth.Basic` and `Singular.Kunneth.Sequence`:
  `TopCat.singularHomologyKunnethIso`, the isomorphism from the degree-n part of
  `H_*(X;M) ⊗ H_*(Y;N)` to `H_n(X × Y;M ⊗ N)` given by the native cross products, for
  semisimple coefficient modules (in particular over a field), with
  `TopCat.isIso_singularHomologyKunneth_of_projective` and
  `TopCat.isIso_singularHomologyKunneth_of_projective_homology` when the homology is
  projective; and over a hereditary commutative ring the short exact Künneth sequence
  `TopCat.singularHomologyKunnethUnitShortComplex_shortExact` with its Tor term and the
  splitting `TopCat.singularHomologyKunnethUnitSplitting`, which depends on chosen splittings
  of the cycles and is not natural. Layer 5.1 consumes these and adds the spectral sequence
  over a general ring.
- The universal coefficient sequence in `Cohomology.UniversalCoefficient`: over a
  hereditary commutative ring, for projective R and every M, the exact sequence
  `TopCat.exact_singularExtToCohomology_singularKronecker` from `Ext¹(H_n(X;R),M)` to
  `H^(n+1)(X;R,M)` and onto `Hom(H_(n+1)(X;R),M)` through the Kronecker map
  (`TopCat.singularKronecker_surjective`), natural in X, and the non-natural decomposition
  `TopCat.singularUniversalCoefficientEquiv`. Layer 6.1 consumes it and adds the local-system,
  relative and general-ring forms. The Kronecker map itself is `TopCat.singularKronecker`, with
  its naturality `TopCat.singularKronecker_naturality` (`Cohomology.Kronecker`); with the
  naturality `HomotopyGroup.hurewicz_map` of the absolute Hurewicz map it fixes the class of
  §8.10.
- The Euler characteristic in `Cellular.EulerCharacteristic`: the alternating cell count
  `TauCeti.cwEulerChar` of a finite CW complex (`TauCeti.cwEulerChar_def`), its Euler–Poincaré
  equality `finsum_finrank_singularHomology_of_finite_cwComplex`, the Euler characteristic
  `TauCeti.eulerChar` of a space of finite CW type, independent of the model
  (`TauCeti.eulerChar_eq_cwEulerChar`) and homotopy invariant
  (`ContinuousMap.HomotopyEquiv.eulerChar_eq`), with
  `TauCeti.eulerChar_eq_finsum_finrank_singularHomology` over every division ring; the
  product formulas `TauCeti.cwEulerChar_prod`, `TauCeti.eulerChar_prod` and
  `TauCeti.eulerChar_pi` (`Product`); the covering formulas
  `TauCeti.cwEulerChar_preimage_of_card_fiber` and `TauCeti.eulerChar_eq_mul_of_isCoveringMap`
  (`Covering`); the open-cover formula `TauCeti.eulerChar_union_add_eulerChar_inter`
  (`MayerVietoris`) and the subcomplex formulas of `Subcomplex`; and the standard values
  `TauCeti.eulerChar_sphere`, `TauCeti.eulerChar_torus` and
  `TauCeti.eulerChar_complexProjectiveSpace`. No other cellular Euler invariant is
  introduced; Layer 7 adds the bundle formula, the relative and local-system Euler–Poincaré
  equalities and stratification additivity.
- Brouwer's theorem in `Singular.BrouwerFixedPoint`: `TauCeti.noRetraction_diskBoundary`,
  `TauCeti.brouwerFixedPoint_topCatDisk`, `TauCeti.brouwerFixedPoint_compactConvex` (every
  continuous self-map of a nonempty compact convex subset of a finite-dimensional real normed
  space, possibly with empty interior, has a fixed point),
  `TauCeti.brouwerFixedPoint_compactConvex_continuousOn`, `TauCeti.brouwerFixedPoint_closedBall`
  and `TauCeti.brouwerFixedPoint_compactConvex_finiteSpan`. This roadmap restates none of them.
- Milnor's classifying space in `ClassifyingSpace`: `TauCeti.classifyingSpace` and
  `TauCeti.classifyingSpaceBasepoint` (`Basic`); `TauCeti.isEilenbergMacLaneSpaceOne_classifyingSpace`
  and `TauCeti.exists_isEilenbergMacLaneSpaceOne`, for every group and with no hypothesis on it
  (`EilenbergMacLane`); `TauCeti.IsEilenbergMacLaneSpaceOne.nonempty_homotopyEquiv`, two K(G,1)
  spaces of CW type (`TauCeti.CWType`, in one universe) are homotopy equivalent, and
  `TauCeti.IsAspherical.exists_homotopyEquiv`, realizing a prescribed isomorphism of fundamental
  groups up to basepoint change along a path (`Uniqueness`); `MonoidHom.classifyingSpaceMap` with
  its identity and composition laws (`Functoriality`), `TauCeti.classifyingSpaceHomotopyFunctor`
  into the pointed homotopy category and
  `TauCeti.fundamentalGroupFunctor_map_bijective_cellularClassifyingSpace`, pointed maps out of
  the cellular model into a space with vanishing higher homotopy are classified by π₁
  (`HomotopyFunctor`); `TauCeti.classifyingSpaceSingularCohomologyIsoGroupCohomology`, landing
  in `groupCohomology (Rep.trivial k G M) n` for a k-module M (the trivial representation
  only), with its coefficient naturality and Bockstein compatibility (`Cohomology`),
  `TauCeti.classifyingSpaceSingularHomologyIsoGroupHomology` (`Homology`),
  `TauCeti.classifyingSpaceLocalSystem` with `TauCeti.classifyingSpaceTwistedHomologyIsoGroupHomology`,
  group homology of A for every representation A, and
  `TauCeti.classifyingSpaceTwistedCohomologyIsoGroupCohomology`, whose source is the
  Hom-of-twisted-chains cohomology with values in a k-module N and whose target is
  `groupCohomology ((Rep.ihom A).obj (Rep.trivial k G N)) n`, group cohomology of the dual
  representation Hom(A,N) rather than of A (`LocalCoefficients`); the free resolution
  `TauCeti.universalGSpaceResolution` (`Resolution`); the
  cellular model `TauCeti.cellularClassifyingSpace` with `TauCeti.cellularClassifyingSpaceHomotopyEquiv`
  (`Cellular`, `Comparison`) and `TauCeti.PresentationComplex` (`PresentationComplex`); and, for any
  quotient covering map with contractible total space,
  `IsQuotientCoveringMap.singularCohomologyIsoGroupCohomology`, again into the trivial
  representation `Rep.trivial k G M` (`Cohomology.GroupCohomology`). The
  nerve model of Layer 8.8 is not among them: that layer builds it, proves it is a K(G,1) and
  compares it with Milnor's model, and restates none of these.
- The transfer of a finite covering in `Singular.Transfer.Basic`/`Degree`/`PermutationLocalSystem`
  and `Singular.Coinvariants`: `IsCoveringMap.singularTransfer`, the chain map sending a simplex
  to the sum of its lifts (`IsCoveringMap.ιChainComplex_singularTransfer_f`), the degree formula
  `IsCoveringMap.singularTransfer_comp_chainComplexMap` (`p_* ∘ transfer = d • id` when every
  fibre has d points) and its locally constant form, the deck-sum formula
  `IsQuotientCoveringMap.chainComplexMap_comp_singularTransfer`, the permutation local system of
  a finite cover, and the coinvariant comparison of a free finite group action.
- Lusternik–Schnirelmann covers in `Topology.Homotopy.LusternikSchnirelmann`:
  `TauCeti.LSCategoricalCover X A n` (n open sets covering A, each with nullhomotopic inclusion
  into X), with restriction, concatenation, padding, pullback and pushforward, and
  `TauCeti.lsCategoryCount X A`, the infimum in ℕ∞ of the sizes of such covers, with
  `TauCeti.lsCategoryCount_le_iff`, monotonicity, union subadditivity, the deformation
  inequality `TauCeti.lsCategoryCount_le_of_homotopic_id`, the values on ∅ and contractible
  spaces, and finiteness on compact locally contractible spaces.
- Relative homotopy in `Topology.Category.BasedTopPair` and `AlgebraicTopology.Homotopy.Relative`:
  `TauCeti.BasedTopPair`, `TauCeti.RelHomotopyGroup` with its group structure in degrees at
  least two, commutativity in degrees at least three, the exact sequence of a based pair,
  basepoint change, the group- and module-valued functors with the abelianization in degree
  two (`TauCeti.RelHomotopyGroup.abelianizationFunctor`), the cell-dimension connectivity of
  relative CW complexes (`TauCeti.subsingleton_relHomotopyGroup_of_isEmpty_cell`) with its
  transport along weak equivalences, and the relative Hurewicz map
  `TauCeti.RelHomotopyGroup.hurewicz`, natural and compatible with the absolute Hurewicz map
  `HomotopyGroup.hurewicz`. In `AlgebraicTopology.Homotopy.Hurewicz`: absolute Hurewicz
  `HomotopyGroup.bijective_hurewicz` for spaces in `Type`, surjectivity of the relative map
  `TauCeti.RelHomotopyGroup.surjective_hurewicz`, and its bijectivity
  `TauCeti.RelHomotopyGroup.bijective_hurewicz_of_subsingleton_homotopyGroup` when the subspace
  and the space are both (n−1)-connected, again for spaces in `Type`.
- The fundamental group acting on homotopy groups, in
  `Topology/Homotopy/HomotopyGroup/FundamentalGroupAction.lean`: the action
  `TauCeti.homotopyGroupMulAction` of π₁(X,x) on π_n(X,x) by transport around loops
  (conjugation when n=1), by group automorphisms in positive dimensions
  (`TauCeti.homotopyGroupMulDistribMulAction`), the transport
  `TauCeti.homotopyGroupTransportQuotient` along a homotopy class of paths with its identity
  and composition laws, and the orbits of the action as the free homotopy classes
  (`TauCeti.homotopyGroup_mem_orbit_iff_exists_homotopyAlong`); in `BasepointChange.lean`,
  the change of basepoint along a path `TauCeti.homotopyGroupEquivOfPath`, a group
  isomorphism `TauCeti.homotopyGroupMulEquivOfPath` in positive dimensions. Consumed by
  §§8.9, 8.10 and 8.14.
- Ordinary Whitehead and CW type: `TauCeti.CWType` (`Topology.CWComplex.Classical.CWType`) and
  `TauCeti.FiniteCWType` (`Topology.CWComplex.Classical.FiniteCWType`), with the finite CW type
  of compact triangulable spaces `TauCeti.IsTriangulable.finiteCWType`
  (`Topology.Triangulable.FiniteCWType`), the weak homotopy
  equivalence predicate `ContinuousMap.IsWeakHomotopyEquivalence`
  (`Topology.Homotopy.HomotopyGroup.WeakHomotopyEquivalence`: every point of the target is joined
  to the image, and every induced map on homotopy groups at every point is bijective), and
  Whitehead's theorem `ContinuousMap.IsWeakHomotopyEquivalence.homotopyEquiv` for spaces of CW
  type, whose forward map is the given map
  (`ContinuousMap.IsWeakHomotopyEquivalence.homotopyEquiv_toFun`), in
  `AlgebraicTopology.Homotopy.Whitehead`, with the two halves of Hatcher's Proposition 4.22 for
  sources of CW type in the same file: maps into the target lift through a weak homotopy
  equivalence up to homotopy (`ContinuousMap.IsWeakHomotopyEquivalence.exists_comp_homotopic`),
  and two maps whose composites with it are homotopic are homotopic
  (`ContinuousMap.IsWeakHomotopyEquivalence.homotopic_of_comp_homotopic`). A weak homotopy
  equivalence induces isomorphisms on singular homology with coefficients in any ring
  (`ContinuousMap.IsWeakHomotopyEquivalence.isIso_singularHomologyMap`,
  `AlgebraicTopology.Singular.Homotopy.WeakHomotopyEquivalence`). §8.10 consumes these three.
  Simple connectivity at infinity is
  `TauCeti.SimplyConnectedAtInfinity` (`AlgebraicTopology.Homotopy.SimplyConnectedAtInfinity`).
  Proper homotopy equivalences are `ContinuousMap.HasProperHomotopyInverse`
  (`Topology.Homotopy.Proper`: a proper map with a proper homotopy inverse and both homotopies
  proper on the whole cylinder).
- Local homology and orientations in `AlgebraicTopology.Singular.LocalHomology`, for a
  Hausdorff space M modelled on a real normed space E of finite dimension n (a manifold
  without boundary), M and E in one universe. In `System`: the local homology system
  `TauCeti.localHomologySystem`, the groups H_k(M,M∖{x};R) with their transport
  `TauCeti.localHomologyTransport` along path classes, for coefficients R in any abelian
  category with coproducts; with values in `ModuleCat S` it is a
  `TauCeti.LocalCoefficientSystem`. In `Compact`, for a compact subset A and coefficients in
  a module N over any ring: vanishing of H_k(M,M∖A;N) for k>n
  (`TauCeti.isZero_localHomology_of_isCompact`, Hatcher Lemma 3.27(b), p.236), detection of a
  degree-n class by its local images (`TauCeti.eq_zero_of_forall_localHomologyRestriction_eq_zero`)
  and the unique gluing of locally represented families of local classes
  (`TauCeti.existsUnique_localHomologyRestriction_eq_of_isCompact`, Hatcher Lemma 3.27(a), p.236),
  with the transport-invariant form `TauCeti.existsUnique_localHomologyRestriction_eq_of_invariant`
  in `Section`, and for compact M the vanishing of H_k(M;N) for k>n
  (`TauCeti.isZero_singularHomology_of_compactSpace`), consumed by Layer 8.15. In
  `TopHomology`, for compact M and module coefficients: H_n(M;N) is the
  limit of the local homology system (`TauCeti.isLimitLocalHomologySystemCone`), and for
  compact connected M restriction to a point is injective
  (`TauCeti.localHomologySystemCone_π_app_injective`) with image the local classes fixed by
  transport along every loop (`TauCeti.mem_range_localHomologySystemCone_π_app_iff`).
  Integrally: local orientations, `TauCeti.HomologicalOrientation M E n`, and for a compact
  oriented manifold its integral fundamental class
  `TauCeti.HomologicalOrientation.fundamentalClass`, the unique class with the given local
  images. Layer 6.3 consumes all of these for boundaryless manifolds and constant module
  coefficients, and builds only the twisted-coefficient, boundary and corner extensions.
- Tau Ceti's native `FundamentalGroupoid.cechDiagram`, `cechCocone` and
  `isColimitCechCocone` in `FundamentalGroupoid.Cech.Diagram`/`Colimit`, using
  the `Grpd` category and native nonempty finite-intersection `CechIndex`.
  Its map/refinement modules supply functoriality; consume the colimit and
  extend the group-presentation and example consequences below.
- Native `TopPair.excisionMap` and its singular-homology isomorphism theorems
  in `Singular.Excision`, and `TopCat.mayerVietorisδ`/`mayerVietoris_exact₁`–`₃`
  in `Singular.MayerVietoris.Basic`. Consume these maps and extend them to local
  coefficients.
- Subdivision, small chains and local-coefficient sequences. Barycentric subdivision
  `TauCeti.singularSubdivision` (`Singular/Subdivision/Basic.lean`) and the prism homotopy
  `TauCeti.singularSubdivisionHomotopy` from the identity to it (`Subdivision/Homotopy.lean`),
  with the twisted operators `TauCeti.LocalCoefficientSystem.twistedSubdivisionChainMap` and
  `TauCeti.LocalCoefficientSystem.twistedSubdivisionHomotopy`, natural in the space and the
  coefficient system (`Singular/Twisted/Subdivision.lean`). The subcomplex
  `TopCat.smallSingularSubcomplex` of simplices subordinate to a family of sets and the
  small-chain theorem `TauCeti.smallSingularChainHomotopyEquiv` for an open cover
  (`Subdivision/Small/Chains.lean`, `Small/Equiv.lean`; Hatcher, Proposition 2.21, p.119), with
  the relative form `TopPair.isIso_homologyMap_restrictι_smallSingularSubcomplex`
  (`Small/Relative.lean`), for constant coefficients. The twisted pair sequence
  `TopPair.shortExact_twistedChainComplexShortComplex` with its connecting map
  `TopPair.twistedHomologyδ` and exactness (`Singular/Twisted/Relative.lean`), natural in maps of
  pairs (`TopPair.twistedHomologyδ_naturality`, `Twisted/Functoriality.lean`) and in coefficient
  morphisms; the twisted triple sequence
  `TauCeti.TopTriple.shortExact_twistedChainComplexShortComplex` with its connecting map
  `TauCeti.TopTriple.twistedHomologyδ`, natural in coefficient morphisms
  (`Twisted/Triple.lean`); and twisted homotopy invariance, the chain homotopies
  `TopCat.Homotopy.twistedChainComplexHomotopy` and `TopPair.Homotopy.twistedChainComplexHomotopy`
  after transport of the coefficient system along the homotopy, with
  `ContinuousMap.HomotopyEquiv.isIso_twistedHomologyMap` (`Twisted/HomotopyInvariance/Basic.lean`,
  `Relative.lean`). The pin has no twisted small-chain theorem, twisted excision or twisted
  Mayer–Vietoris sequence; Layer 3 adds them.
- Mapping tori, tori and Čech complexes. The Wang sequence of the mapping torus
  `TauCeti.MappingTorus φ` of a self-homeomorphism φ (`Singular/MappingTorus/`): the chain
  endomorphism `TauCeti.MappingTorus.wangEndomorphism`, `id − φ_*`, the mapping-cone model
  `TauCeti.MappingTorus.wangMappingConeMap` with its naturality
  `TauCeti.MappingTorus.wangMappingConeMap_naturality` and
  `TauCeti.MappingTorus.wangMappingConeMapOfSemiconj` for maps intertwining two monodromies
  (`Basic`, `Naturality`), the connecting map `TauCeti.MappingTorus.wangδ`, exactness
  `TauCeti.MappingTorus.wang_exact₁`–`₃` and the cokernel identification
  `TauCeti.MappingTorus.wangCokernelEquiv` (`Wang`). The homology of the torus `ι → S¹` as
  exterior powers of its first homology over every commutative ring,
  `TauCeti.bijective_pontryaginExteriorPower_torus` and `TauCeti.torusExteriorPowerEquiv`
  (`Singular/Torus/Exterior.lean`), natural under morphisms of commutative monoid objects
  (`TopCat.pontryaginExteriorPower_naturality`, `Singular/Pontryagin/Exterior.lean`). The
  ordered Čech double complex `TauCeti.cechDoubleComplex` of a family of opens indexed by a
  linearly ordered type, on tuples i₀<…<i_p, with alternating Čech differential (on two
  indices a<b it is (−i_a, i_b)) and the total-complex sign of Mathlib's
  `HomologicalComplex₂.total` (`Singular/Cech.lean`), its maps along maps of covers
  `TauCeti.cechSingularChainsMap` (`Cech/Map.lean`), the quasi-isomorphism
  `TauCeti.quasiIso_cechTotalAugmentation` of its augmented total complex with singular chains
  for an open cover (`Cech/OrderedQuasiIso.lean`), and its spectral sequence
  `TauCeti.cechSpectralSequence` with first page `TauCeti.cechSpectralSequenceFirstPageXIso`
  and abutment `TauCeti.cechSpectralSequenceAbutmentIso` (`Cech/SpectralSequence.lean`), for
  constant coefficients in an abelian category. Layer 5 consumes these and adds only what
  §§5.2, 5.4, 5.6 and 5.7 name.
- Constant-coefficient cohomology operations. Absolute and relative singular cochains
  (`Cohomology/Basic.lean`, `Cohomology/Relative.lean`); the coefficient Bocksteins
  `TopCat.singularCohomologyBockstein` and `TopPair.singularCohomologyBockstein` of a short
  exact sequence of coefficients, with the exact coefficient sequences
  (`TopCat.singularCohomology_exact_coefficient₁`–`₃`) and naturality in maps, pairs and
  coefficient sequences (`TopCat.singularCohomologyBockstein_naturality`,
  `TopPair.singularCohomologyBockstein_naturality`; `Cohomology/Bockstein.lean`), and for local
  systems with projective fibres the Bockstein of a sequence of value modules
  `TauCeti.LocalCoefficientSystem.twistedCohomologyBockstein` (`Cohomology/Twisted/Bockstein.lean`);
  the cup product `TopCat.singularCup` with `TopCat.singularCup_naturality`,
  `TopCat.singularCup_assoc`, its unit and graded commutativity `TopCat.singularCup_gradedComm`
  (`Cohomology/Cup.lean`, `GradedCommutativity.lean`), and the cohomology cross product with its
  diagonal comparison `TauCeti.singularCross_diagonal` (`Cohomology/CrossProduct.lean`); the
  cap product `TopCat.singularCap` with `TopCat.singularCap_naturality`,
  `TopCat.singularCap_assoc` and `TauCeti.singularCap_unit` (`Cap/Basic.lean`,
  `Cap/Associativity.lean`, `Cap/Unit.lean`). Layer 6 consumes these and adds the cap boundary
  formula, the direct-local-system, relative and local-coefficient forms, and the
  cup–Bockstein Leibniz signs.
- Native `TauCeti.cellularChainComplex`, `cellularChainGroupIso` and
  `TauCeti.cellularSingularHomologyIso` in `Cellular.Chains`/`Coproduct`/`Comparison`.
  They use relative CW skeleta, T2 ambient spaces, abelian-category coefficients
  and exact cell-indexed coproducts. The homology comparison needs the inclusion
  of the (n+1)-skeleton to induce an isomorphism on Hₙ; the pin supplies this for
  every finite-dimensional relative CW complex
  (`TauCeti.isIso_singularHomologyMap_skeletonBasePairToComplex_succ_of_finiteDimensional`)
  and, when sequential colimits are exact in the coefficient category, as in
  `ModuleCat R`, for every relative CW complex
  (`TauCeti.isIso_singularHomologyMap_skeletonBasePairToComplex_succ_of_hasExactColimitsOfShape`).
  Layer 4 extends that carrier to chosen chain representatives and local systems.
- The Serre-fibration API in `TauCeti.Topology.Homotopy.SerreFibration.Basic`,
  `.FiberBundle` and `.RelativeCube`: `TauCeti.TopCat.serreFibrations`, the
  `MorphismProperty` of `TopCat.{u}` defined as the right lifting property against the
  bottom inclusions `Dⁿ ⟶ Dⁿ ⊗ I` for every n ≥ 0, with no surjectivity built in; its
  composition, isomorphism, base-change, retract and product instances;
  `TauCeti.TopCat.mem_serreFibrations_iff` (homotopy lifting for every closed unit ball)
  and `TauCeti.TopCat.mem_serreFibrations_iff_cube` (for every cube `Fin n → I`);
  `TauCeti.TopCat.mem_serreFibrations_pullbackFst`, `TauCeti.TopCat.mem_serreFibrations_fst`
  and `IsCoveringMap.mem_serreFibrations`;
  `TauCeti.TopCat.mem_serreFibrations_of_exists_trivialization` and
  `TauCeti.TopCat.mem_serreFibrations_proj` (a locally trivial map, or the projection of
  a `FiberBundle`, is a Serre fibration, with no paracompactness hypothesis on the base:
  the disc case of Hatcher Proposition 4.48, p.379, whose relative-CW form follows with
  §5.5's lifting against relative CW pairs); and `TauCeti.TopCat.exists_lift_openBox_of_mem_serreFibrations`
  (lifting with a prescribed lift on the bottom and the sides of a finite cube). Layer 5
  consumes these as stated and does not restate them.
- The tower algebra in `TauCeti.Algebra.Category.ModuleCat.Tower`: `TauCeti.ModuleTower`
  (functors `ℕᵒᵖ ⥤ ModuleCat R` over an associative unital ring), the difference map
  `TauCeti.ModuleTower.shift`, δ(x)ₙ = xₙ − φₙ(xₙ₊₁), with kernel `TauCeti.ModuleTower.lim`
  and cokernel `TauCeti.ModuleTower.limOne`, their functoriality, the connecting map
  `TauCeti.ModuleTower.connecting` of the six-term sequence with
  `TauCeti.ModuleTower.connecting_naturality`, and
  `TauCeti.ModuleTower.subsingleton_limOne_of_isMittagLeffler`; towers of complexes
  `TauCeti.ComplexTower` of an arbitrary complex shape with their Milnor sequences
  (`TauCeti.ComplexTower.limOneToHomology_injective`,
  `TauCeti.ComplexTower.exact_limOneToHomology_homologyToLim`,
  `TauCeti.ComplexTower.homologyToLim_surjective`) and their naturality
  (`TauCeti.ComplexTower.homologyToLim_naturality`,
  `TauCeti.ComplexTower.limOneToHomology_naturality`), under degreewise surjectivity
  of the difference map; the cofinal comparisons `TauCeti.ModuleTower.limSubsequenceEquiv`,
  `TauCeti.ModuleTower.limOneSubsequenceEquiv` and
  `TauCeti.ComplexTower.limComplexSubsequenceIso`; and the homotopy limit
  `TauCeti.ModuleTower.homotopyLimitFunctor`, the shifted cone of δ on the product
  complex for strict maps of complexes of towers, which preserves quasi-isomorphisms,
  with the derived limit `TauCeti.ModuleTower.derivedLimit` and its identification
  `TauCeti.ModuleTower.derivedLimitIsoLimComplex` with the limit complex when every
  lim¹ vanishes. Layer 6.0 consumes these and adds only what they do not contain.
- Native `TopCat.singularCap` and singular cup products in `Cohomology.Cap.Basic`
  and `Cohomology.Cup`. Consume their Alexander–Whitney maps and pairings,
  extending to direct local-system cochains, relative products and duality.
- Abstract and classical `CWComplex`/`RelCWComplex`, subcomplexes, skeleta,
  `CWComplex.FiniteDimensional`, `CWComplex.FiniteType`, and `CWComplex.Finite`.
- Existing `TauCeti.MappingCylinder`, its `incl`, `proj`, `proj_comp_incl`,
  `isClosedEmbedding_incl` and `homotopyEquiv`, and
  `TauCeti.MappingCylinder.hasHomotopyExtensionProperty_range_incl` in
  `Topology.Homotopy.MappingCylinder` / `Extension.MappingCylinder`.
  Consume the homotopy extension property (HEP), relative-CW and strong-deformation-retraction APIs in
  `Extension.Basic` / `CWComplex` / `DeformationRetract`.
- Cofibration and CW tools: Strøm's product theorem for closed cofibrations and its cylinder
  case `TauCeti.HasHomotopyExtensionProperty.zero_one_prod_univ_union_univ_prod`
  (`Topology/Homotopy/Extension/Prod.lean`), homotopy inverses relative to subspaces with the
  homotopy extension property `TauCeti.HasHomotopyExtensionProperty.exists_inverse_homotopicRel`
  and relative to base points `TauCeti.HasHomotopyExtensionProperty.exists_basedInverse_homotopicRel`
  (`Extension/HomotopyEquivRel.lean`), the relative cylinder CW structure
  `TauCeti.relCWComplexCylinder` (`Topology/CWComplex/Classical/Cylinder.lean`) and cellular
  approximation `TauCeti.exists_isCellular_homotopicRel` and `TauCeti.exists_isCellular_homotopic`
  (`CellularApproximation.lean`).
- CW approximation of path-connected spaces in `AlgebraicTopology.Homotopy.CWApproximation.Basic`:
  `TauCeti.cwApproximation` with `TauCeti.cwApproximationMap`, the instance
  `TauCeti.cwType_cwApproximation` and `TauCeti.isWeakHomotopyEquivalence_cwApproximationMap`
  for a path-connected target, consumed by Layer 8.15; with its lifts
  `TauCeti.cwApproximationLift`, unique up to homotopy (`CWApproximation.Naturality`), and
  the local-coefficient form
  `ContinuousMap.IsWeakHomotopyEquivalence.isIso_twistedHomologyMap` of the homology
  invariance of weak homotopy equivalences
  (`AlgebraicTopology.Singular.Homotopy.WeakHomotopyEquivalence`), consumed by §4.10.
- Degree-one Hurewicz in `AlgebraicTopology/Homotopy/Hurewicz/One/`: for a path-connected
  space X and a point x, the isomorphism `TauCeti.HurewiczOne.hurewiczHomologyAddEquiv` from
  the abelianization of π₁(X,x) to H₁(X;ℤ), sending the class of a loop to the class of the
  singular 1-simplex it traces (`Basic.lean`, stated in universe zero; Hatcher 2A.1), its
  naturality in pointed maps `TauCeti.HurewiczOne.homologyMap_hurewiczHomologyAddEquiv`
  (`Naturality.lean`), and its comparison with the cubical Hurewicz homomorphism
  `HomotopyGroup.hurewiczHom` in degree one, whose value at 1 on the class of a loop is minus
  that class (`HomotopyGroup.hurewiczHom_hom_one_eq_neg_hurewicz₁`, `Comparison.lean`).
  Consumed by §§8.3 and 8.10.
- The spectral sequence of a filtered complex in
  `Algebra/Homology/SpectralSequence/Filtered/`: for an increasing filtration of a cochain
  complex indexed by ℤ, the spectral sequence `CochainComplex.spectralSequence` of
  `CochainComplex.filtrationFunctor`, its first page and first differential
  `CochainComplex.spectralSequence_first_page_d_eq` (`FirstPage.lean`), the abutment
  `CochainComplex.filtrationAbutmentIso` with its image filtration and strong convergence
  for finite filtrations (`Convergence.lean`), and for module coefficients exhaustion of the
  abutment filtration `CochainComplex.exists_mem_range_filtrationAbutmentFiltrationι`, the
  page-to-graded identification
  `CochainComplex.filtrationSpectralSequencePageXIsoGradedOfExhaustive` and the comparison
  theorem `CochainComplex.isIso_homologyMap_of_isIso_spectralSequence_page_of_exhaustive`
  for exhaustive filtrations (`Exhaustive.lean`), with naturality
  `CochainComplex.filtrationFunctorMap` (`Naturality.lean`). Its topological instance is the
  filtered-space spectral sequence of singular chains, `TauCeti.singularChainFiltration` and
  `TauCeti.filteredSpaceSpectralSequence` for an increasing family of subsets, with first
  page `TauCeti.filteredSpaceSpectralSequenceFirstPageXIso` the relative homology of
  consecutive stages, first differential
  `TauCeti.filteredSpaceSpectralSequence_first_page_d_eq` the triple connecting map, abutment
  `TauCeti.filteredSpaceAbutmentIso` and strong convergence for finite filtrations
  `TauCeti.filteredSpaceSpectralSequencePageXIsoGradedOfFinite`
  (`AlgebraicTopology/Singular/FilteredSpace.lean`). Consumed by §§5.0, 5.5 and 5.7.
- Path fibrations in `Topology/Homotopy/MappingPath/`: `TauCeti.LiftingFunction`,
  `TauCeti.IsHurewiczFibration` with
  `TauCeti.isHurewiczFibration_iff_nonempty_liftingFunction`, the mapping-path fibre
  projection `TauCeti.MappingPathFiber.isHurewiczFibration_proj`, its base-change
  description `TauCeti.MappingPathFiber.pullbackHomeomorph`, its homotopy invariance
  `ContinuousMap.Homotopy.mappingPathFiberHomotopyEquiv`, and the mapping-path space
  `TauCeti.MappingPathSpace` with its constant-path inclusion a homotopy equivalence
  (`TauCeti.MappingPathSpace.homotopyEquiv`, by the shrinking homotopy
  `TauCeti.MappingPathSpace.shrinkHomotopy`) compatible with the endpoint map
  (`TauCeti.MappingPathSpace.endpoint_comp_incl`). Consumed by §5.5.
- Hurewicz fibrations in `Topology/Homotopy/HurewiczFibration/` and
  `Topology/MappingSpace/Fibration.lean`: every Hurewicz fibration is a Serre fibration,
  `TauCeti.IsHurewiczFibration.mem_serreFibrations` (`Basic.lean`); restriction
  `C(K,X)→C(A,X)` along a closed cofibration `A⊆K` of a locally compact `K` is a Hurewicz
  fibration of compact-open mapping spaces,
  `TauCeti.HasHomotopyExtensionProperty.isHurewiczFibration_restrict`; relative lifting for
  NDR pairs `TauCeti.IsHurewiczFibration.exists_lift_of_ndrPair` (`RelativeLifting.lean`);
  fibre transport `TauCeti.LiftingFunction.transport` with its homotopy invariance and
  composition laws (`Transport.lean`), the comparison of the fibres over a path
  `TauCeti.PathPullback.fiberHomotopyEquiv` (`PathPullback.lean`), the identification of the
  homotopy fibre of the fibre inclusion with the loop space of the base
  `TauCeti.FiberInclusionPathFiber.loopFiberHomotopyEquiv` (`FiberInclusion.lean`), and the
  fibre-homology local system `TauCeti.fiberLocalSystem` of a Hurewicz fibration with a
  lifting function (`AlgebraicTopology/Singular/Fibration/LocalSystem.lean`). Consumed by
  §5.5.
- Serre classes in `AlgebraicTopology/SerreClass/`: the torsion class
  `AddCommGrpCat.isTorsion` and, for each `d`, the class
  `AddCommGrpCat.isKilledBySomePower d` of groups annihilated by a power of `d`, with
  Mathlib's `IsSerreClass` instances and their tensor and Tor closure; and, for finite
  groups, the torsion of the positive-degree homology of Milnor's classifying space,
  `TauCeti.isAddTorsion_classifyingSpace_singularHomology` and
  `TauCeti.isKilledBySomePower_classifyingSpace_singularHomology`
  (`ClassifyingSpace/Torsion.lean`). From Mathlib, the morphisms modulo a Serre class
  (`CategoryTheory/Abelian/SerreClass/MorphismProperty.lean`):
  `CategoryTheory.ObjectProperty.isoModSerre` (kernel and cokernel in the class),
  `CategoryTheory.ObjectProperty.epiModSerre` (cokernel in the class) and
  `CategoryTheory.ObjectProperty.monoModSerre` (kernel in the class), with their closure
  under composition, the two-out-of-three property of the first, and stability under
  retracts and base change. Consumed by §8.8d.
- The killing tower `TauCeti.killHomotopyGroups n X x` of a pointed Hausdorff space
  (`AlgebraicTopology/Homotopy/KillHomotopyGroups.lean`) with
  `TauCeti.bijective_homotopyGroupMap_killHomotopyGroupsIncl` (`π_k` unchanged for `k<n`),
  `TauCeti.subsingleton_homotopyGroup_killHomotopyGroups` (`π_k=0` for `k≥n`),
  `TauCeti.killHomotopyGroupsCWComplex` and `TauCeti.cwType_killHomotopyGroups` (a Hausdorff
  CW source without cells above dimension `n`),
  `TauCeti.isEilenbergMacLaneSpaceOne_killHomotopyGroups` (`n=2`) and the extension theorems
  `TopCat.Hom.exists_killHomotopyGroupsIncl_comp_eq` and
  `TauCeti.exists_mapOfEq_comp_killHomotopyGroupsFundamentalGroupMulEquiv` into a target with
  vanishing homotopy from dimension `n` on. Consumed by §8.8c.
- The circle as a classifying space: `AddCircle.isEilenbergMacLaneSpaceOne`, a real circle
  of nonzero period is a K(ℤ,1) (`UniversalCover/Circle/EilenbergMacLane.lean`), its finite
  CW type `TauCeti.finiteCWType_addCircle` (`Topology/CWComplex/Classical/Circle.lean`), and
  the homotopy equivalence `TauCeti.circleHomotopyEquivClassifyingSpace` of Mathlib's
  `Circle` with Milnor's classifying space of `Multiplicative ℤ`, whose forward map induces
  the identity of ℤ on fundamental groups (`ClassifyingSpace/Circle.lean`). Consumed by
  §8.12.
- Complex projective space: the carrier `TauCeti.ComplexProjectiveSpace n`, the quotient of
  the unit sphere of `EuclideanSpace ℂ (Fin (n+1))` by unit scalars
  (`Topology/ComplexProjectiveSpace/Basic.lean`), with its finite CW structure
  `TauCeti.ComplexProjectiveSpace.cwComplex`, one cell in each even dimension 0,2,…,2n and
  none in odd dimensions, and its characteristic maps
  `TauCeti.ComplexProjectiveSpace.cellMap`
  (`Topology/CWComplex/Classical/ComplexProjective.lean`). Consumed by §4.6.
- Smoothing and transversality inputs of Layer 8.13: Mathlib's Whitney embedding
  `exists_embedding_euclidean_of_compact` (`Mathlib/Geometry/Manifold/WhitneyEmbedding.lean`)
  and relative smooth approximation `Continuous.exists_contMDiff_approx_and_eqOn`
  (`Mathlib/Geometry/Manifold/SmoothApprox.lean`); Tau Ceti's slice-chart implicit function
  theorem `HasStrictFDerivAt.exists_isSliceChart_preimage_zero`
  (`Analysis/Calculus/ImplicitFunctionTheorem.lean`) and flat Morse–Sard theorem
  `TauCeti.addHaar_image_criticalPoints_eq_zero` (`Analysis/Calculus/Sard/OutermostStratum.lean`),
  which imposes no relation between the source and target dimensions.
- The two-periodic resolution of a finite cyclic group in Mathlib's
  `RepresentationTheory.Homological.GroupCohomology.FiniteCyclic`
  (`Rep.FiniteCyclicGroup.groupCohomologyπEven`, `Rep.FiniteCyclicGroup.groupCohomologyπOdd`),
  with Tau Ceti's surjectivity of both maps in the module of the same name, consumed by
  Layer 8.15.
- Van Kampen presentations in `AlgebraicTopology/FundamentalGroup/VanKampen/`: for sets U_i
  containing x₀ whose interiors cover X, surjectivity of the inclusion-induced map from the
  free product of the π₁(U_i,x₀) when every pairwise intersection is path connected
  (`TauCeti.vanKampenWideLift_surjective`, `Basic.lean`), its kernel, the normal closure of the
  pairwise overlap relators, when every triple intersection is path connected
  (`TauCeti.ker_vanKampenWideLift_of_isPathConnected_triple`), and the resulting presentation
  `TauCeti.vanKampenCoverQuotientEquiv` (`Presentation/Cover.lean`); the two-set forms
  `TauCeti.ker_vanKampenLift` and `TauCeti.vanKampenQuotientEquiv` (`Presentation/Basic.lean`).
  Consumed by §§1.3–1.4.
- Cube, ball and disk maps: the cube-to-sup-ball homeomorphism `TauCeti.cubeHomeomorphClosedBall`,
  t↦(2t_j−1)_j (`TauCeti.coe_cubeHomeomorphClosedBall_apply`;
  `Analysis/Normed/Module/Ball/Homeomorph.lean`); the radial homeomorphism
  `TauCeti.diskHomeomorphClosedBall` from `TopCat.disk n` onto the sup-norm closed unit ball,
  y↦(‖y‖₂/‖y‖∞)y through `EuclideanSpace.equiv`, carrying the boundary sphere onto the sup-norm
  unit sphere, and the composite `TauCeti.diskHomeomorphCube` with
  `TauCeti.diskHomeomorphCube_mem_boundary_iff` (`AlgebraicTopology/Disk.lean`); and, for
  n≥1, the pointed homeomorphism `TauCeti.cubeQuotientHomeomorphSphere` from Iⁿ/∂Iⁿ onto the
  unit sphere of `EuclideanSpace ℝ (Fin (n+1))`, induced by the disk map
  x↦(2√(1−‖x‖²)x, 2‖x‖²−1) (`TauCeti.closedBallToSphere`) after the inverse of
  `TauCeti.diskHomeomorphCube`, with pole e_last, and `HomotopyGroup.sphereEquiv` identifying
  generalized loops with pointed maps out of (Sⁿ,e_last)
  (`AlgebraicTopology/Sphere/CubeQuotient.lean`). Consumed by §§2.5 and 4.4.
- Cellular structures: for a covering map p:E→B and a CW complex C in a Hausdorff space B, the
  lifted CW complex `TauCeti.cwComplexPreimage` on p⁻¹(C), whose n-cells are the pairs of an
  n-cell of C and a point over its centre (`TauCeti.cellPreimageEquiv`), finite for finite C and
  finite fibres (`TauCeti.finite_cwComplexPreimage`; `Topology/CWComplex/Classical/Covering.lean`);
  incidence numbers as local degrees of attaching maps,
  `TauCeti.singularHomologyπ_cellAttachingMap_eq_cellularIncidence_smul`
  (`AlgebraicTopology/Cellular/LocalDegree.lean`); the product CW structure
  `TauCeti.cwComplexProd` of two finite CW complexes on the ordinary product
  (`Topology/CWComplex/Classical/Product.lean`); real projective space
  `TauCeti.RealProjectiveSpace n`, the antipodal quotient of Sⁿ
  (`AlgebraicTopology/UniversalCover/RealProjective/Basic.lean`), with its CW structure
  `TauCeti.RealProjectiveSpace.cwComplex`, one cell in each dimension 0,…,n
  (`Topology/CWComplex/Classical/RealProjective.lean`), and its incidences: the i-cell occurs in
  the boundary of the (i+1)-cell with coefficient 0 for even i
  (`TauCeti.RealProjectiveSpace.cellularIncidence_cwComplex_eq_zero_of_even`) and ±2 over ℤ for
  odd i (`TauCeti.RealProjectiveSpace.cellularIncidence_cwComplex_eq_two_or_eq_neg_two_of_odd`;
  `AlgebraicTopology/Cellular/RealProjective/Basic.lean`); and the cellular differential of a
  sphere with one cell attached by a map of degree m, which is m times a unit independent of
  the map (`TauCeti.exists_cellularDifferential_sphereMappingCone_eq_smul`;
  `AlgebraicTopology/Cellular/SphereMappingCone/Basic.lean`). Consumed by §§4.1, 4.2, 4.5 and 4.6.
- Pushouts, colimits and NDR data: NDR data `TauCeti.NDRPair` (a control function vanishing
  exactly on the subspace and a deformation fixing it), which exist exactly for closed
  subspaces with the homotopy extension property (`TauCeti.nonempty_ndrPair_iff`;
  `Topology/Homotopy/Extension/NDRPair.lean`); in `Topology/Category/TopCat/`, the cobase
  change of a closed embedding is a closed embedding
  (`TauCeti.TopCat.isClosedEmbedding_of_isPushout`, `ClosedEmbedding.lean`), attaching a normal
  space along a closed subspace of a normal space gives a normal space
  (`TauCeti.TopCat.normalSpace_of_isPushout`), a directed colimit of T1 spaces along injective
  maps is T1 (`TauCeti.TopCat.t1Space_of_isColimit`) and a sequential colimit of normal spaces
  along closed embeddings is normal (`TauCeti.TopCat.normalSpace_of_isColimit`, `Normal.lean`),
  the stages of a directed colimit along closed embeddings embed as closed subspaces
  (`TauCeti.TopCat.isClosedEmbedding_ι_of_isColimit`, `ClosedEmbedding.lean`),
  and in a sequential colimit of T1 spaces along injective maps every compact subset lies in
  the image of a stage (`TauCeti.TopCat.exists_subset_range_ι_of_isCompact`) and, when the
  stages embed, every map from a compact space factors through a stage
  (`TauCeti.TopCat.exists_lift_of_compactSpace`, `Compact.lean`); a categorical relative CW
  complex on a Hausdorff space has Hausdorff target (`TopCat.RelativeCWComplex.t2Space`,
  `Topology/CWComplex/Abstract/Hausdorff.lean`). Consumed by §4.5.
- Projective spaces: Mathlib's quotient topology on `Projectivization 𝕜 V`,
  `Projectivization.instTopologicalSpace`, with `Projectivization.isQuotientMap_mk'`,
  `Projectivization.continuous_iff` and, for a continuous action of the units on V, the open
  quotient map `Projectivization.isOpenQuotientMap_mk'`
  (`Mathlib/Topology/Algebra/Projectivization.lean`), with the Hausdorff criterion for open
  quotient maps `t2Space_iff_of_isOpenQuotientMap` (`Mathlib/Topology/Separation/Hausdorff.lean`);
  Mathlib states no Hausdorff instance on this topology, and §4.6 proves it for
  `Projectivization ℝ (Fin (n+1) → ℝ)`; Tau
  Ceti's affine-chart atlas `Projectivization.instChartedSpace` and manifold structure
  `Projectivization.instIsManifold` of `Projectivization 𝕜 (Fin (n+1) → 𝕜)`, for every
  nontrivially normed field and every order of smoothness
  (`Geometry/Manifold/Instances/Projectivization.lean`). At the pins that atlas is built on Tau
  Ceti's own copy of the quotient topology (`Topology/Algebra/Projectivization.lean`), which
  declares the same instance name as Mathlib's, so the two modules are not imported together.
  Consumed by §4.6.
- Kan complexes and simplicial groups: homotopy groups of Kan complexes `SSet.KanComplex.π` with
  their group structure in positive degrees and induced maps `SSet.KanComplex.π.map`
  (`AlgebraicTopology/SimplicialSet/KanComplex/HomotopyGroup.lean`); the Kan property of
  singular simplicial sets `TopCat.kanComplex_toSSet_obj` (`SimplicialSet/KanComplex.lean`);
  the natural comparison with cubical homotopy groups `TopCat.toSSetPiEquivHomotopyGroup` with
  `TopCat.toSSetPiEquivHomotopyGroup_map`, which reverses products, so that in every positive
  degree it is a group isomorphism onto the opposite of Mathlib's `HomotopyGroup`
  (`TopCat.toSSetPiMulEquivHomotopyGroupMulOpposite`) and in degrees at least two onto
  Mathlib's group itself (`TopCat.toSSetPiMulEquivHomotopyGroup`;
  `AlgebraicTopology/Homotopy/SingularSet.lean`); Moore's theorem that a simplicial group is
  Kan, `SSet.kanComplex_of_group` and
  `CategoryTheory.SimplicialObject.kanComplex_comp_forget_grpCat`
  (`KanComplex/SimplicialGroup.lean`); and for a simplicial module G, natural in G,
  `CategoryTheory.SimplicialObject.piAddEquivNormalizedMooreComplexHomology`,
  π_(n+1)(G,0)≃H_(n+1)(NG), and
  `CategoryTheory.SimplicialObject.piZeroEquivNormalizedMooreComplexHomology`,
  π₀(G)≃H₀(NG) (`KanComplex/MooreComplex.lean`). Consumed by §8.2.
- Ends: `TauCeti.EndComponents X`, decreasing components of complements of compact sets,
  eventually disjoint from every compact set, modulo mutual cofinal containment, for every
  topological space X, with its inverse-limit description `TauCeti.endComponentsEquivSections`
  along a monotone sequence of compact sets cofinal among all compact sets, and
  `TauCeti.natCard_endComponents_real` (`Topology/Connected/Ends.lean`). Consumed by §8.5.
- `HomotopyGroup`, based cubes, `ContinuousMap.HomotopyEquiv`, mapping cones and pointed cones,
  category-theoretic colimits, chain homotopies, homology functors, and exact couples.

### From TauCetiRoadmap.UniversalCovers

Universal-cover construction, deck transformations, quotient covers, basepoint change
and the induced maps on homotopy groups (the completed roadmap). Layer 8 consumes the
induced-map and basepoint API with its path-connectedness hypotheses; nothing here
constructs another universal cover.

### From TauCetiRoadmap.GeometricTopology

§11.3, the Cairns–Whitehead smooth triangulation of a smooth manifold with its realization
homeomorphism, consumed by 8.7 for CW type of smooth manifolds; Layer 1's
boundary, collar and two-sided tube conventions, consumed by 6.3–6.4 for the compact
codimension-0 excision comparisons; Layer 1's tubular neighbourhood theorem, consumed by
8.13's smoothing and relative-transversality targets for the smooth retraction onto a
compact embedded target; Layer 11's ordered-complex realization, cited by 4.7
only as a consumer route. Every use keeps the smooth, Hausdorff and second-countable
hypotheses of those items.

### From TauCetiRoadmap.DifferentialGeometry

Layer 2 (tangent orientations, `orientationAt`, `Orientation.map`, Layer 2.2 pullback
along local diffeomorphisms) and Layer 5.1 (the outward-normal-first boundary
orientation), consumed by 6.3. The sphere comparison with the coordinate-local
generator is constructed in §§2.5 and 6.3 here; Layer 10's smooth
mapping degree, consumed only by 6.5's comparison; 10.5 consumes Tau Ceti's Brouwer theorem
(supplier contracts), not a theorem of this roadmap. Layer 9.3 consumes 6.3's classes and is not a supplier of them.

### From TauCetiRoadmap.ClassifyingSpaces

Layer 1, items 1.1 and 1.2, the classification of pointed maps into an aspherical space
(Hatcher, Proposition 1B.9, p.90), with that roadmap's hypotheses: the source X is a
path-connected Hausdorff CW complex with an arbitrary base point x, the target (Y,y) is a
pointed space with `TauCeti.IsAspherical Y y` and no CW structure, and X and Y lie in
independent universes. Item 1.1 realizes every homomorphism π₁(X,x)→π₁(Y,y) by a map
sending x to y; item 1.2 makes two such maps inducing the same homomorphism homotopic
relative to {x}. Consumed by 8.8 with target the nerve model Bπ, aspherical by 8.8a, and by
the case n=1 of 8.14. Nothing else of that roadmap is consumed, and it consumes nothing of
this one.

Each use below retains the supplier's hypotheses and names the needed portion. The
roadmaps that build on this one are not suppliers of it; the Downstream consumers section
lists what each of them takes.

## How to read the build

Layers 1 and 2 establish groupoid and chain interfaces; Layer 3 supplies local-coefficient
excision, Layer 4 CW and raw-quotient comparisons in convenient pointed topology, and Layer 5 product,
cover and bundle tools. Layer 6 builds topological tower comparisons, cohomology and duality,
ending with the product-ball intersection theorem; Layer 7
adds the bundle formula to Tau Ceti's Euler characteristic. Layer 8 reaches Hurewicz, Whitehead, representability
and obstruction theory, then smooth representatives of low-codimension homology classes and
the homotopy applications. Item-specific inputs separate the independent tower and
product foundations from later applications.

Other roadmaps cite this one in the form "AlgebraicTopology Stage k item m" and by
heading anchors `stage-k-…`. Stage k is Layer k, with the same title, and item m of Stage k
is §k.m. The former Stage anchors correspond to the Layer anchors as follows; a link by a
former anchor is read as a link to the Layer in the same row.

| Former anchor (Stage numbering) | Anchor now | Section now |
| --- | --- | --- |
| `#stage-1-van-kampen-through-the-fundamental-groupoid` | `#layer-1-van-kampen-through-the-fundamental-groupoid` | Layer 1 |
| `#stage-2-relative-singular-chains-and-homology` | `#layer-2-relative-singular-chains-and-homology` | Layer 2 |
| `#stage-3-subdivision-excision-and-mayer--vietoris` | `#layer-3-subdivision-excision-and-mayer--vietoris` | Layer 3 |
| `#stage-4-cw-pairs-cellular-homology-and-cofibrations` | `#layer-4-cw-pairs-cellular-homology-and-cofibrations` | Layer 4 |
| `#stage-5-bundles-covers-products-and-finite-cover-descent` | `#layer-5-bundles-covers-products-and-finite-cover-descent` | Layer 5 |
| `#stage-6-cohomology-products-and-manifold-duality` | `#layer-6-cohomology-products-and-manifold-duality` | Layer 6 |
| `#stage-7-euler-characteristic-and-finite-decompositions` | `#layer-7-euler-characteristic-and-finite-decompositions` | Layer 7 |
| `#stage-8-relative-homotopy-hurewicz-whitehead-and-ordinary-representability` | `#layer-8-relative-homotopy-hurewicz-whitehead-and-ordinary-representability` | Layer 8 |

Items map to sections as follows.

- Stage 1 items 1–6 are §§1.1–1.6.
- Stage 2 items 1 and 4–6 are §§2.1 and 2.4–2.6; Stage 2 item 2, the relative homology
  functor and its comparison with absolute homology, is Tau Ceti's
  `TopPair.singularHomologyFunctor` and `TopPair.singularHomologyInclIso`; Stage 2 item 3,
  the long exact sequences of a pair and of a triple with their connecting morphisms and
  naturality squares (`TopPair.singularHomologyδ_naturality`,
  `TauCeti.TopTriple.singularHomologyδ_naturality`), is Tau Ceti's; and Stage 2 item 7,
  the no-retraction and Brouwer fixed-point theorems with the finite-span form, is Tau Ceti's
  `TauCeti.noRetraction_diskBoundary` and `TauCeti.brouwerFixedPoint_*` (supplier contracts).
- Stage 3 items 1–5 are §§3.1–3.5.
- Stage 4 items 1–8 are §§4.1–4.8; item 8 is compact generation and the pointed adjunction.
  §4.9 is the realization of a product of simplicial sets, and §4.10 is connected maps,
  weak equivalences and CW approximation.
- Stage 5 items 1–7 are §§5.1–5.7; the Serre-fibration predicate used by item 5 is Tau
  Ceti's (supplier contracts). §5.0 is the spectral sequence of a filtered complex.
- Stage 6 items 0–5 are §§6.0–6.5; of item 0, the generic tower algebra other than the
  homotopy-square maps is Tau Ceti's `TauCeti.ModuleTower` (supplier contracts). §6.6 is
  the product-ball intersection theorem `productBallImages_intersect` with its
  boundary-degree form.
- Stage 7 items 1–4 are §§7.1–7.4.
- Stage 8 items 1–16 are §§8.1–8.16, with 8.8a/8.8b and 8.11a/8.11b as subdivisions; §8.8c
  (the functorial abelian Eilenberg–MacLane models) and §8.8d (Serre classes and Hurewicz
  modulo a class) are sections of their own after §8.8. §8.13
  is the section of smooth representatives in codimensions one and two: the smoothing of
  maps into compact manifolds, parametric and relative transversality, and the transverse
  circle classifying map of an integral degree-one class with its bordism independence.
  §8.14 holds the ordinary homotopy
  applications (the finite-dimensional Whitehead criterion, based maps from an
  (n−1)-connected CW complex into a space with no homotopy above degree n, aspherical
  surfaces); §8.15 the classifying spaces of finite groups and their free actions, including the
  non-freeness of C_p×C_p actions on spheres; §8.16 the essential map T³→S² invisible to
  homotopy groups and reduced homology.

## Layer 1: van Kampen through the fundamental groupoid

This layer is independent of Layers 2--8.

### 1.1 Cover diagrams

*Needs:* Native fundamental-groupoid Čech diagrams and their colimit; open-cover generation.

For an open cover `U : i -> Opens X`, consume the native Cech diagram of all nonempty finite
   intersections, with inclusion functors between their fundamental groupoids.  State the cover
   using native `TopologicalSpace.IsOpenCover U` and its union/supremum cover criterion.
### 1.2 Cover naturality

*Needs:* Native maps/refinements of fundamental-groupoid Čech diagrams.

Consume native cover generation by subdivision of paths: every morphism in `FundamentalGroupoid X` is a composite of
   morphisms lying in cover members. Derive from the native colimit that two
   such composites agree exactly under the Cech relations.
### 1.3 Based presentations

*Needs:* §1.1; native fundamental groups, path/basepoint change and van Kampen presentations.

Consume the native cocone to `FundamentalGroupoid X` and its colimit universal property.
   The based presentation is Tau Ceti's (supplier contracts): if U_i are sets containing the
   basepoint x₀ whose interiors cover X, in particular open sets covering X, and every pairwise
   intersection is path connected, the homomorphism from the free product of the π₁(U_i,x₀) to
   π₁(X,x₀) induced by the inclusions is surjective (`TauCeti.vanKampenWideLift_surjective`);
   if moreover every triple intersection is path connected, its kernel is the normal subgroup
   generated by the elements i_ij(ω)·i_ji(ω)⁻¹ for ω in π₁(U_i∩U_j,x₀), where i_ij is induced by
   U_i∩U_j⊆U_i (`TauCeti.ker_vanKampenWideLift_of_isPathConnected_triple`,
   `TauCeti.vanKampenCoverQuotientEquiv`; Hatcher, Theorem 1.20, p.43). Consume these and add
   their naturality under maps of covered spaces and under refinement of covers, through the
   groupoid colimit of §1.1. The pairwise hypothesis is needed: the circle
   covered by two open arcs through x₀ has an intersection with two components, each
   π₁(U_i,x₀) is trivial, and the trivial free product does not map onto π₁(S¹,x₀)=ℤ; the
   groupoid colimit of §1.1 over both components recovers ℤ.
### 1.4 Two-open pushouts

*Needs:* Native two-open groupoid and based-group pushouts; explicit path-connectedness hypotheses.

Consume native groupoid and fundamental-group two-open-set pushouts and the based theorem when the two opens and their
   intersection are path connected and contain the basepoint (Brown, 6.7.2, p.240; Hatcher,
   Theorem 1.20, p.43), with its presentation `TauCeti.ker_vanKampenLift` and
   `TauCeti.vanKampenQuotientEquiv`.  Derive iterated finite-cover and
   group-presentation corollaries.
### 1.5 Circle and wedge calculations

*Needs:* Native circle and wedge-of-circles groupoid calculations.

Consume the native groupoid calculation on a circle covered by two arcs with disconnected intersection and
   on a wedge of circles.  The first check must use more than one basepoint and the second must
   consume the native wedge-of-circles free-group equivalence and recover its presentation maps
   (Brown, 6.7.5, p.248, for π₁(S¹) from the two-arc cover with the two basepoints ±1; Brown,
   §6.7, Exercise 2, p.249, and Hatcher, Example 1.21, p.43, for wedges of circles).

### 1.6 Fundamental groups of topological groups

*Needs:* Native `FundamentalGroup.cast_map_prod_mul` and `FundamentalGroup.instCommGroup`;
no covering or CW input.

For a topological space G with a continuous multiplication and a two-sided unit, the
   library already proves that the class of the pointwise product of two loops at `1` is
   their product in `FundamentalGroup G 1` (`FundamentalGroup.cast_map_prod_mul`) and that
   `FundamentalGroup G 1` is a commutative group (`FundamentalGroup.instCommGroup`), by
   Mathlib's Eckmann–Hilton argument; this covers every topological group with no
   connectedness or covering-space hypothesis. Consume both declarations and add only what
   they do not state. Prove naturality: for a continuous map f:G→H with f(1)=1 and
   f(xy)=f(x)f(y), the induced map on `FundamentalGroup` at `1` is a group homomorphism
   that sends the class of the pointwise product γ·δ to the pointwise product of the
   images, with `cast_map_prod_mul` as the input on both sides. Prove the comparison with
   native `FundamentalGroup.mul_def`, whose multiplication is reversed path composition:
   the pointwise product γ·δ is path-homotopic both to γ followed by δ and to δ followed
   by γ, so the two orders of concatenation agree with the pointwise product and with each
   other (Hatcher, §3.C, Exercise 5, p.291).

**Checks.**

- On the circle group `U(1)` the loops z↦zᵐ and z↦zⁿ at `1` have pointwise product
  z↦z^(m+n), and `cast_map_prod_mul` sends the pair (m,n) to m+n in π₁(U(1),1)=ℤ; a
  model identifying the pointwise product with the concatenation in the other order gives
  the same value only because ℤ is abelian, which is what `instCommGroup` asserts.
- Naturality under the squaring map z↦z² of `U(1)`: the class m goes to 2m whether one
  first forms the pointwise product (m+n ↦ 2m+2n) or first applies the map and then
  multiplies (2m+2n); a model that applied the induced map only to one factor would give
  2m+n.
- On `SO(3)` the fundamental group at the identity is ℤ/2, so the commutativity statement
  is nontrivial only in that it holds for every topological group: the non-identity class
  squares to the identity, and the pointwise product of a non-contractible loop with itself
  is contractible, as the double cover by `SU(2)` shows.

The proof spine is Brown, *Topology and Groupoids*: the cover-diagram colimit of §1.1 is
§6.7, Exercise 6, p.250, for a cover consisting of the pairwise intersections of a subcover,
and Theorem 6.7.2, p.240, is the two-set case used in §1.4; subdivision by a Lebesgue number
(Brown 3.6.4, p.91) gives generation, the square-grid subdivision of a homotopy gives
relations, and the universal property identifies the colimit.  Hatcher, *Algebraic
Topology*, Theorem 1.20 (Section 1.2, p.43) supplies the based corollaries.


### Examples

The two-arc circle cover has two intersection components and fundamental group ℤ; replacing the intersection by one point gives the wrong trivial group.

### Dependencies

*Needs:* Mathlib fundamental groupoids, path homotopies and covering maps; the pinned van Kampen contracts above.
## Layer 2: relative singular chains and homology

### 2.1 Relative chain quotients

*Needs:* Native TopPair/SSetPair relative chains, cokernels and short exact sequences.

Consume native relative singular chains on `TopPair`, obtained by applying the `SSetPair` relative-chain
   construction to `TopCat.toSSet`. Consume its cokernel colimit and exhibit the relative complex both as the quotient
   `C_*(X) / C_*(A)` with the boundary induced from `C_*(X)` (Hatcher, §2.1, p.115) and in
   its natural short-exact-sequence form, and prove the two forms naturally isomorphic.
### 2.4 Homology axioms

*Needs:* Native singular homology pretheory and the absolute/empty-pair comparison in the supplier contracts.

Consume native `singularHomologyPretheory` and its homotopy invariance, dimension and additivity,
   extending its interfaces and proving reduced/unreduced comparison for the homology-pretheory classes
   (Hatcher, Theorem 2.10, p.111, for homotopy invariance; Corollary 2.25, p.126, for wedge
   additivity; Section 2.3, pp.160–162, for the axioms and the reduced/unreduced comparison).
### 2.5 Coordinate orientations

*Needs:* Native disk/sphere homology, relative chains and shuffle maps; no manifold duality.

Consume the native `(D^n,S^(n-1))`, point, discrete-space and disjoint-union calculations,
   extending their natural comparisons and local-coefficient instances.  These calculations
   fix the degree-zero and connecting-map conventions used in every downstream layer.
   Own the integral coordinate cube reference class: [I,∂I] is the class of
   t↦t with boundary [1]−[0]; [I^n,∂I^n] is its coordinate-order n-fold
   native Eilenberg–Zilber shuffle product, projected to relative chains.
   Prove its cycle/generator property and boundary-facet signs. The
   cube-to-sup-ball homeomorphism t↦(2t_j−1)_j from Iⁿ onto the sup-norm closed
   unit ball in Fin n→ℝ is Tau Ceti's `TauCeti.cubeHomeomorphClosedBall`, and the
   sup-ball-to-disk homeomorphism x↦(‖x‖_∞/‖x‖₂)x for x≠0 and 0↦0 is the inverse of
   Tau Ceti's radial `TauCeti.diskHomeomorphClosedBall`, through the coordinate
   linear equivalence to EuclideanSpace; their composite is the inverse of
   `TauCeti.diskHomeomorphCube`, and the native boundary statements carry each
   boundary sphere onto the next, for all n≥0 (supplier contracts). Consume these
   formulas. Their positive diagonal and radial factors preserve the ordered
   coordinate orientation. Define the sup-ball and Euclidean-disk reference
   classes by the actual pair-map pushforwards of the cube class; prove their
   comparisons. Own the coordinate-disk comparison coefficient: the actual
   value of native `singularHomologyDiskBoundaryPairIso` on the coordinate disk
   class, proved to be a unit; at dimension zero it is 1 by augmentation.
   This early normalization supplies cellular generators, independently of
   Layer 4.4's quotient homeomorphisms. Layer 4.4
   consumes these same maps and classes, with no earlier input from Layer 4.
   Layer 4 uses this early class for cell orientations; Layer 6 later proves
   equality with the coordinate-oriented ball's canonical relative fundamental
   class. This reference construction uses only native chains/shuffles and
   relative homology, without Layer 6 manifold duality. Own the sphere's
   normalized reference class using the positive local chart at q=e₀,
   v↦(sqrt(1−‖v‖²),v), with positively scaled chart cube and outward-first
   local generator. For n≥1, use native sphere homology/excision to define
   the unique absolute class with this positive local image. For n=0,
   define instead the unique reduced reference class whose ordinary-homology
   image has this positive local image and augmentation zero. On
   S⁰={q,−q}, its ordinary image is s₀=[q]−[−q], with local images +1 at q
   and −1 at −q. Prove these two local-image formulas and the augmentation
   formula; the positive local image together with augmentation zero gives
   uniqueness. A single local image does not determine an ordinary H₀ class.
   Use native reduced homology as the augmentation kernel and its canonical
   inclusion into ordinary homology. Layer 4.4 compares its actual quotient
   maps and separately chosen based generator with this earlier two-case
   reference, retaining the opposite zero-sphere sign of that based generator.
   Prove the shuffle comparison: after the actual coordinate
   product identifications, the signed triangulation chain equals the native
   iterated `TopCat.shuffle` of the n positive interval chains, factor order
   0,…,n−1. Prove the permutation/inversion sign equality, including n=0.
   These are coordinate-normalized constructions from the native disk/sphere
   calculation and shuffle maps: the boundary signs follow from the product
   boundary formula (Hatcher, Proposition 3B.1, pp.269–270), and the generator
   property by iterating the interval relative boundary isomorphism and
   that shuffle boundary identity. The relative product formula is also
   recorded after Theorem 3B.6, p.276; the early construction uses only
   the native relative chains and shuffles named above. The sphere class is obtained by
   excision and the local-image characterization (Lemma 3.27, p.236). The normalization
   comparisons are the constructions here, not an additional claim attributed to those
   source statements.

**Checks.**

- For n=1 the class of t↦t in H₁(I,∂I;ℤ) has boundary [1]−[0]; the reversed
  parametrization t↦1−t has boundary [0]−[1], its negative, so the class records the
  orientation of the interval.
- For n=2 the shuffle product of two interval chains is the (1,2)-shuffle triangle minus
  the (2,1)-shuffle triangle; the diagonal edges cancel and the boundary is
  right−left−top+bottom. Swapping the two coordinates multiplies the class by the
  permutation sign −1; an unsigned sum over shuffles would not be a relative cycle.
- For n=0 the cube is a point with empty boundary; its class has augmentation 1, the
  sup-ball and disk homeomorphisms are the point maps, and the disk comparison
  coefficient is 1. A convention sending the point class to −1 would contradict the
  augmentation normalization used by every later degree-zero calculation.
- For the sphere, the two local images of s₀=[q]−[−q] are +1 at q and −1 at −q with
  augmentation 0; the class [q]+[−q] has the same local image at q but augmentation 2 and
  is excluded.

### 2.6 Local systems

*Needs:* Native fundamental groupoids, local coefficient systems and twisted relative chains.

Consume the native `LocalCoefficientSystem R X`, a functor from Mathlib's fundamental
   groupoid to the coefficient-module category, with the pin's convention: a simplex σ
   carries its chain coefficient at
   σ(e₀); its zeroth face transports that coefficient along [e₀,e₁], while
   other faces retain the first vertex. Consume native twisted chains, relative
   homology, map pullbacks, basepoint/monodromy formulas and constant-system
   comparison, and the native pair and triple short exact sequences with their connecting
   maps and exactness and the native absolute and relative homotopy invariance with the
   coefficient system transported along the homotopy (supplier contracts; Hatcher, §3.H,
   p.333: the pair sequence, excision and additivity for homology with local coefficients,
   and homotopy invariance through the pullback of the coefficient bundle along the
   homotopy). The native triple sequence is natural in coefficient morphisms; add its
   naturality, and that of its connecting map
   `H_n(X,A;L)→H_(n−1)(A,B;L|A)`, under maps of triples f:(X,A,B)→(X′,A′,B′) with the
   pulled-back system f*L′. This uses the existing groupoid object and does not depend on
   Layer 1's van Kampen theorem.

**Checks.**

- For the triple (X,A,∅) the triple sequence is the pair sequence of (X,A), and its
  connecting map is the native pair connecting map; a model whose triple connecting map
  differed by a sign would already disagree here.
- For the triple (X,X,A) the outer pair term `H_n(X,X;L)` is 0, so the map
  `H_n(X,A;L)→H_n(X,A;L)` of the sequence is the identity and the connecting map, with
  source `H_n(X,X;L)=0`, vanishes.
- On S¹ with the sign system ε, whose monodromy is u=−1, and the triple (S¹,{p},∅), the
  connecting map `H₁(S¹,{p};ε)→H₀({p};ε)=ℤ` sends the class of the loop σ with coefficient c
  to (u−1)c=−2c, so `H₀(S¹;ε)=ℤ/2`; a model ignoring the transport along σ would give 0 and
  `H₀=ℤ`. The rotation r by π is a map of triples (S¹,{p},∅)→(S¹,{−p},∅) with r*ε≅ε; it
  sends the class of cσ to that of c(r∘σ), and both connecting maps give −2c, so the
  naturality square commutes with this value on both sides.

The source spine is Eilenberg--Steenrod, *Foundations of Algebraic Topology*, Chapters I--III,
and Hatcher, Sections 2.1--2.2 and 3.H.  The Lean proof should pass through short exact sequences
of chain complexes and Mathlib's homology functor, rather than reconstructing an elementwise
exact sequence in every application.


### Examples

For I, ∂[I]=[1]−[0]; for the ordered square the diagonal cancels and the boundary is right−left−top+bottom; H₀(∅)=0.

### Dependencies

*Needs:* Native singular chains, topological pairs and relative homology; the coefficient and sign conventions above.
## Layer 3: subdivision, excision, and Mayer--Vietoris

This layer consumes Layer 2.

Ordinary and twisted barycentric subdivision with their prism homotopies, and the
ordinary small-chain theorem, are Tau Ceti's (supplier contracts). This layer adds the
local-coefficient forms: twisted subdivision on relative chains, the twisted
small-chain theorem, twisted excision and the twisted Mayer–Vietoris sequence, each natural
in space maps and coefficient-system morphisms and compatible with the pair/triple
connecting maps. Transport along paths in each contractible simplex gives the subdivision
coefficients.

### 3.1 Subdivision and the prism

*Needs:* §2.6; native singular subdivision and prism formulas, with local transport.

Barycentric subdivision of singular simplices, with its boundary formula and the prism
   operator giving a chain homotopy from the identity to subdivision, with the barycentric
   cone formulas `Sd λ = b_λ·Sd(∂λ)` and `T λ = b_λ·(λ − T∂λ)` and the identity
   `∂T + T∂ = id − Sd` (Hatcher, Section 2.1, pp.121–122), is Tau Ceti's, with constant and
   with local coefficients (supplier contracts). Add the relative twisted form: for a pair
   (X,A) and a local system L on X, a simplex with image in A has every simplex of its
   subdivision and of its prism in A, so the twisted subdivision and prism operators preserve
   the twisted chains of A with L|A and descend to `C_*(X,A;L)`, with the same identity, and
   commute with the pair connecting map. §3.3 consumes this descent.

**Checks.**

- On the 1-simplex σ=[v₀,v₁] with barycentre b the cone formula gives Sd σ=[b,v₁]−[b,v₀],
  whose boundary ([v₁]−[b])−([v₀]−[b])=[v₁]−[v₀] is ∂σ, the barycentre cancelling; a model
  with Sd σ=[b,v₁]+[b,v₀] has boundary [v₁]+[v₀]−2[b]≠∂σ and is not a chain map.
- On a 0-simplex [v], Sd is the identity and T[v] is the constant 1-simplex [v,v], whose
  boundary is [v]−[v]=0, so ∂T+T∂=0=id−Sd in degree 0; T[v] is nonzero in unnormalized
  chains and zero only after normalization.
- On σ=[v₀,v₁], Tσ=[b,v₀,v₁]−[b,v₁,v₁]+[b,v₀,v₀]; termwise ∂Tσ=σ−[b,v₁]+[b,v₀]−[v₁,v₁]+[v₀,v₀]
  and T∂σ=[v₁,v₁]−[v₀,v₀], so ∂Tσ+T∂σ=σ−Sd σ. A model dropping the two degenerate terms of
  Tσ gives ∂T+T∂=σ−Sd σ+[v₁,v₁]−[v₀,v₀], wrong in unnormalized chains, and a model with the
  opposite sign convention `Sd − id` differs from this value by 2(σ−Sd σ)≠0 over ℤ.
- Relative descent: for the pair (I,{0}) and σ the constant simplex at 0, Sd σ and Tσ are
  again constant at 0, hence in the chains of A={0}, and the relative class is 0 on both
  sides. A subdivision that coned every simplex from a fixed point of X∖A, here 1, would
  send σ to a simplex leaving A and would not descend to `C_*(I,{0})`.
### 3.2 Small chains

*Needs:* §3.1; compactness of the standard simplex and the Lebesgue-number lemma.

For constant coefficients the small-chain theorem is Tau Ceti's
   `TauCeti.smallSingularChainHomotopyEquiv`, with the relative form
   `TopPair.isIso_homologyMap_restrictι_smallSingularSubcomplex` (supplier contracts; Hatcher,
   Proposition 2.21, p.119). Prove the twisted small-chain theorem (Hatcher, Proposition 2.21,
   p.119, and §3.H, p.333, for local coefficients): for an open cover U of X and a local
   system L on X, the L-twisted chains supported on simplices subordinate to U form a
   subcomplex whose inclusion into `C_*(X;L)` is a chain-homotopy equivalence, natural in maps
   of covered spaces and in coefficient morphisms, with the relative form for a pair. The
   route iterates the native twisted subdivision and prism operators, which make every
   simplex subordinate after finitely many subdivisions, as in the constant case.

**Checks.**

- For the one-member cover U={X} every simplex is subordinate and the inclusion is the
  identity of `C_*(X;L)`.
- For the cover of [0,1] by [0,0.3), (0.2,0.8) and (0.7,1], one subdivision of the identity
  simplex leaves [0,1/2] in no member, and two subdivisions give [0,1/4], [1/4,1/2],
  [1/2,3/4] and [3/4,1], each in a member; a uniform number of subdivisions independent of
  the cover would be wrong.
- For the sign system ε on S¹, with monodromy u=−1, and a loop σ at p with coefficient c,
  the subdivision is
  `c′[b,v₁]−c′[b,v₀]` with c′ the transport of c to b along the first half of σ, and its
  boundary is (u−1)c[p]=−2c[p], the boundary of cσ. Transporting c to b backwards along
  the second half gives u⁻¹c′=−c′ instead, negates the subdivided chain, and gives
  boundary +2c[p]: not a chain map.
### 3.3 Local-coefficient excision

*Needs:* Tau Ceti's pair sequence (supplier contracts); §§2.6 and 3.2; native ordinary excision.

Consume native excision for `TopPair` and extend to local coefficients: if the closure of the excised set lies in the interior of the
   subspace, the induced map on relative homology is an isomorphism (Hatcher, Theorem 2.20,
   p.119; §3.H, p.333, for local coefficients).  Include maps of excision
   data and compatibility with the pair connecting morphism.
### 3.4 Local Mayer–Vietoris

*Needs:* §§3.2 and 3.3 and the native ordinary Mayer–Vietoris connecting map.

Consume native Mayer--Vietoris for a binary open cover and extend its natural
   long exact sequence to local coefficients: Hatcher derives it from the short exact sequence
   of chain complexes `0→C(U∩V)→C(U)⊕C(V)→C(U+V)→0` and the small-chain theorem (§2.2,
   pp.149–150), and the same derivation applies to local coefficients with §3.2's twisted
   small chains (Hatcher, §3.H, p.333, for iterated subdivision with local coefficients).
   Prove that
   its first map is `(i_U, -i_V)` under the pinned sign convention.
### 3.5 Sphere calculations

*Needs:* §3.4; disk/sphere normalization of §2.5.

Check Mayer--Vietoris on `S^1` from two arcs and on `S^n` from two hemispherical
   neighbourhoods, including the connecting isomorphism in top degree (Hatcher, Example
   2.46, p.150; the two-arc circle has intersection two contractible arcs, so the
   connecting map identifies H₁(S¹) with the kernel ℤ of H₀(arc⊓arc)→H₀(arc)⊕H₀(arc)).

Hatcher, Proposition 2.21, p.119, and the proof of excision in Section 2.1 give the small-chain proof;
Section 2.2 gives Mayer--Vietoris.  Eilenberg--Steenrod supplies the natural formulation for
pairs.


### Examples

For the two arcs of S¹, the intersection map sends (a,b) to (a+b,−a−b); its kernel is ℤ generated by (1,−1), giving H₁(S¹)=ℤ.

### Dependencies

*Needs:* Layer 2 local systems and relative chains; native subdivision, excision and Mayer–Vietoris.
## Layer 4: CW pairs, cellular homology, and cofibrations

This layer consumes Layers 2 and 3. Use the native cellular complex and its
relative-CW carrier, with its Hausdorff and exact-coproduct hypotheses; module
coefficients satisfy the categorical exactness assumptions. Extend its API below.
The coreflection portion of §4.8 (the compact-generation functor, its adjunction and
counit comparisons) uses only Mathlib and Tau Ceti and precedes §§4.4 and 4.5, which consume it;
the rest of §4.8 consumes §4.4. §4.9 consumes §§4.5, 4.7 and 4.8. §4.10 consumes Layers 2–3,
§4.5's mapping cylinders and Tau Ceti's homotopy groups, with no input from Layer 8.

### 4.1 Cellular chain groups

*Needs:* Native relative CW skeleta, cell coproducts and cellular chain groups; Mathlib's
covering maps and their lifting of maps from simply connected spaces.

Use Mathlib's characteristic maps and skeleta and native `cellularChainGroup`
   in degree n as the relative homology of consecutive skeleta. Consume
   `cellularChainGroupIso` to identify it with cell-indexed coproducts. In modules,
   identify it naturally with finitely supported coefficient-module-valued
   functions on `RelCWComplex.cell C n`, with the relative base explicit.
   For coefficient module R this is the free R-module on the cells. Use
   finite-support rather than finite-cell assumptions in the general definition.
   Lifted CW structures are Tau Ceti's: for a covering map p:X̃→X of a Hausdorff CW
   complex X, `TauCeti.cwComplexPreimage` makes X̃ a CW complex whose n-cells are the
   pairs of an n-cell of X and a point over its centre (`TauCeti.cellPreimageEquiv`), each
   characteristic map lifting that of X (Hatcher, Appendix, Exercise 1, p.529; supplier
   contracts). Add that its skeleta are the preimages of the skeleta of X and, for
   surjective p, that its dimension is that of X: a covering map may miss components, and
   the inclusion of S¹ into S¹⊔S² is a covering map whose lifted structure has dimension 1
   over a base of dimension 2. §§8.14 and 8.15 consume this for universal and intermediate
   covers.
### 4.2 Cellular differentials

*Needs:* Native cellular differentials and triple connecting maps; §2.5 cell orientations.

Consume native `cellularDifferential` and its triple connecting-map description,
   including `d²=0`, and the identification of its matrix entries with local degrees of
   attaching maps, `TauCeti.singularHomologyπ_cellAttachingMap_eq_cellularIncidence_smul`:
   the image of the boundary-sphere class of an (n+1)-cell under its attaching map, read in
   the local homology at a point of an open n-cell, is the incidence number times the local
   class of that cell (Hatcher, cellular boundary formula, p.140, with Lemma 2.34, p.137, for
   the skeletal pairs). Prove naturality for cellular maps.
### 4.3 Cellular comparison at chain level and with local coefficients

*Needs:* Native cellular comparison in every CW dimension (supplier contracts); compact simplex factorization and filtered module colimits for the chain-level and local-system extensions.

Consume native `TauCeti.cellularSingularHomologyIso`, which holds in every CW
   dimension once sequential colimits are exact in the coefficient category, as
   they are in `ModuleCat R`
   (`TauCeti.isIso_singularHomologyMap_skeletonBasePairToComplex_succ_of_hasExactColimitsOfShape`);
   its value on cellular cycles is the map induced by the inclusion of the
   n-skeleton pair (Hatcher, Theorem 2.35, p.139; §3.H, p.333, for cellular homology with
   local coefficients). Construct the skeletal filtration exact
   couple and prove the cellular-to-singular comparison as a natural equivalence
   in the filtered derived or chain-homotopy category. Normalize oriented cell
   generators by pushing forward Layer 2.5's
   coordinate-oriented ball class through the characteristic map; reversing
   the orientation negates that generator. Construct chosen chain
   representatives, with naturality only up to specified chain homotopies; do
   not claim a strict natural transformation from cellular chains to ordinary
   singular chains. Extend the comparison to `RelCWComplex` and subcomplex pairs.
   Extend items 1–3 to Layer 2's module-valued local systems,
   with attaching-path transport and relative comparison. The degree-n chain
   module is the direct sum over n-cells of their integral orientation module
   tensored with the coefficient fibre at a chosen cell point, with the ring
   acting on the coefficient factor. A chosen cell orientation identifies that
   summand with the fibre; arbitrary coefficient fibres need not be free.

**Checks.**

- For A=X, both relative complexes have zero homology in every degree.
- For a point relative to ∅, both sides give M in degree 0 and zero above.
- For the standard CW structure on RP² with integral coefficients, d₂=2 and d₁=0;
  both sides give H₁=ℤ/2 and H₂=0, excluding a zero attaching differential.


### 4.4 Pointed quotients and suspension

*Needs:* §2.5 and native pointed quotients; §4.8 for the coreflection comparisons.

Own the pointed quotient carrier X/B: collapse
   B together with a separately added point in X⊔*, with the quotient topology,
   actual collapse map, universal mapping property and subspace naturality.
   Thus X/∅ means X₊. Item 5 consumes this carrier for relative comparisons.

   Own the single chosen based sphere identifications: the disk quotient
   Dⁿ/∂Dⁿ≅Sⁿ, the cube quotient Iⁿ/∂Iⁿ≅Sⁿ, the smash Sᵐ∧Sⁿ≅S^(m+n) and the
   reduced suspension ΣSⁿ≅S^(n+1), for all n,m≥0. Use native `TopCat.disk n`, its actual boundary-inclusion image,
   and native `TopCat.sphere n` (the lifted metric sphere); its basepoint
   is the positive first-coordinate pole p. The disk/cube quotient's basepoint
   is the collapsed boundary together with the added point. For n=0 the
   boundary is empty: D⁰⊔* is sent bijectively to S⁰ with its disk point at −p
   and its added point at p. For n>0, the cube-to-sphere map is the same
   cubical sphere quotient used by item 8.6. Tau Ceti's
   `TauCeti.cubeQuotientHomeomorphSphere` (supplier contracts) is a pointed homeomorphism
   Iⁿ/∂Iⁿ≅Sⁿ onto the same metric sphere for n≥1, but with pole e_last, and its disk map
   x↦(2√(1−‖x‖²)x, 2‖x‖²−1) sends the coordinate cube class to (−1)^(n+1) times the
   outward-first sphere class of §2.5: near the centre it is x↦(2x,−1), and at −e_last the
   frame (−e_last, e₀,…,e_(n−1)) has determinant (−1)^(n+1). Define this item's cube and disk
   quotients for n≥1 as that native map followed by the linear isometry
   A(x₀,…,x_n)=(x_n,−x₀,x₁,…,x_(n−1)), which carries e_last to p and has determinant
   (−1)^(n+1), so that the generator coefficient is +1 in every dimension; prove both
   coefficient formulas. Construct the coordinate-order
   cube-to-disk homeomorphism as the composite of Layer 2.5's
   cube-to-sup-ball and sup-ball-to-disk homeomorphisms,
   with their boundary maps; the induced quotient homeomorphism commutes with both
   chosen sphere homeomorphisms and the actual collapse maps. These
   equations determine the two quotient homeomorphisms from the same q.


   Use the same pointed quotient to construct the compact based smash carrier
   (X×Y)/(X×{y₀}∪{x₀}×Y) and reduced suspension
   (X×I)/(X×∂I∪{x₀}×I), with the collapsed locus at the added point.
   The bare smash model is used here for compact Hausdorff inputs,
   including spheres; the raw suspension also applies to pointed Hausdorff CW
   spaces because X×I and its quotient are compactly generated. Own the
   three Kelley comparisons of these raw quotients: for the compact based smash,
   for the compact reduced suspension and for the reduced suspension of a pointed
   Hausdorff CW complex, compare the raw quotient Z
   with kZ using only Layer 4.8's coreflection, compact and CW
   compact-generation/locally-compact-product API. Pin their inverse to the
   actual inclusion/coreflection counit, with quotient/basepoint naturality.
   Layer 4.8 owns the comparison of these kified raw quotients with the pointed
   convenient smash and suspension, and consumes the k-counit comparisons of this
   item for it.
   RiemannianGeometry R3 consumes the raw reduced-suspension quotient map and the
   reduced-suspension sphere homeomorphism.

   Own their quotient maps and continuity/universal-property API.
   The smash identification sends Sᵐ∧Sⁿ to S^(m+n), with m coordinates
   followed by n coordinates; the suspension identification sends
   Σ_right Sⁿ to S^(n+1), with the interval coordinate last. Prove their
   compatibility through I/∂I≃S¹, their basepoint equations, and the diagrams
   with cube concatenation as exact equations: the composite cube pair map
   Iᵐ×Iⁿ→Sᵐ∧Sⁿ→S^(m+n) equals the based cube-to-sphere pair map of I^(m+n), and
   the composite Iⁿ×I→Σ_right Sⁿ→S^(n+1) equals the based cube-to-sphere pair map
   of I^(n+1). The surjective cube maps determine these homeomorphisms uniquely.
   Include associativity (with the dimension reassociation) and unit diagrams,
   whose nonbasepoint of S⁰ is −p, and
   the factor-interchange degree (−1)^(mn). These are actual based
   homeomorphisms, before homotopy, James or stable-spectrum constructions;
   item 8.11b supplies the homology/cohomology suspension machinery and owns
   the two-step suspension homeomorphism, from its CB/B quotient followed by
   collapse of the basepoint meridian to the same raw interval-last quotient,
   with identity formula on (x,t) representatives.
   GeneralizedCohomology G2.1 consumes these quotients for its categorical
   monoidal adapters.

   Pin the based sphere reference generator in H_n(Sⁿ,{p};ℤ) independently:
   for n≥1 it is the image of the Layer 2.5 positive-local-chart/outward-first
   sphere class, and for n=0 it is [−p]−[p], using native
   `reducedSingularHomologySphereZeroIso_inv_ι`, transported through
   `diskBoundaryHomeomorph` and its coordinate linear isometry (which
   commutes with negation), and the reduced/pole-pair comparison. Prove that the disk/cube quotient, smash and right-suspension
   maps send their coordinate-order relative reference classes to this
   generator with coefficient +1; a homeomorphism alone does not establish
   the generator comparison. Define the right-suspension reference by the
   ordered cube shuffle, with the last interval oriented by [1]−[0]; this
   uses Layer 2.5's early native shuffles, not Layer 5's product packaging.
   Compare with native `reducedSingularHomologyTopCatSphereIso` through
   diskBoundaryHomeomorph and its actual recursive choices: prove the
   comparison is a unit ε_n∈ℤˣ, expressed through those choices, rather
   than asserting a fixed numerical sign for `Classical.arbitrary` poles.
   Retain the normalized reference independently of that generator. Own the
   native sphere unit and its comparison with the early disk coefficient:
   in dimension n+1 the disk coefficient is ε_n for n≥1 and −ε_0 for n=0.
   The latter minus sign follows from the native reduced pair boundary; ε_0=1
   exactly when its transported native `Classical.arbitrary` zero-sphere pole
   is p. Layer 2.5 owns the disk coefficient itself; this item derives its
   relation to the sphere normalization. The radial
   D^(n+1)-boundary→Sⁿ comparison has coefficient +1 for n≥1; for n=0
   the oriented interval boundary [p]−[−p] is minus the chosen reduced
   generator. RiemannianGeometry R3 consumes these homeomorphisms and the explicit
   generator comparisons, without constructing a second sphere-suspension
   identification.
   Derive these quotient-sign comparisons from §2.5's coordinate shuffle class,
   the quotient/relative-homology comparison (Hatcher, Proposition 2.22,
   p.124), the product boundary formula (Proposition 3B.1, pp.269–270), and
   the ordered-product interchange sign (Theorem 3.11, p.210). For n≥1,
   compute the local degree at an interior image different from the collapsed
   pole, then use the sphere local-image comparison of §2.5 to identify
   the absolute generator; the collapsed boundary fixes the based map. In degree 0
   compute in the augmentation kernel directly, giving the displayed minus
   sign instead of applying the connected-sphere argument.
   Own the relative CW structure of the native disk: the actual `TopCat.disk n`
   relative to its boundary subset has one n-cell and no other
   relative cells, using the fixed Layer 2.5 sup-ball/disk comparison and
   characteristic map. Export the homeomorphism from that subset's subtype
   to native `TopCat.diskBoundary n`.
   Include n=0 with empty boundary. Own the coproduct relative CW construction
   for arbitrary disjoint unions of these pairs, preserving cell labels,
   characteristic maps, the base and the actual disjoint-union topology.
   Export the homeomorphism from the coproduct base subtype to
   Σ i,TopCat.diskBoundary(n_i), transporting the actual attaching maps
   to the C(B,Z) pushout input. MorseTheory M2 consumes these disk pairs.

**Checks.**

- X/∅ is X with an added basepoint; its reduced homology is H_n(X) in every degree,
  matching H_n(X,∅)≅H_n(X), and for X=∅ it is the one-point space with reduced
  homology 0. A model collapsing ∅ to a point of X would need a point of ∅.
- For B=X the quotient is a single point and both H̃_n(X/X) and H_n(X,X) vanish; a model
  collapsing B to a point distinct from the added basepoint would give S⁰ with H̃₀=ℤ.
- For (D⁰,∅) the quotient map sends the disk point to −p and the added point to p, and
  the point class of D⁰ goes to the based generator [−p]−[p]; for (I,∂I) the class of
  t↦t goes to the winding +1 generator of H₁(S¹,{p}) and the reflected parametrization
  to −1, so the identification is not merely a homeomorphism up to sign.
- Smash S⁰∧Sⁿ≅Sⁿ is the unit diagram with the nonbasepoint of S⁰ at −p; interchanging the
  factors of Sᵐ∧Sⁿ acts on the reference generator by (−1)^(mn), which is −1 for m=n=1
  and +1 for m=2, n=1, excluding a sign-free interchange law.
- For n=1 the native cube quotient runs from e_last through the half-plane x₀<0 to −e_last
  and back through x₀>0, counterclockwise, so its coefficient is +1, and A(x₀,x₁)=(x₁,−x₀)
  is a rotation. For n=2 near the centre it is (x₁,x₂)↦(2x₁,2x₂,−1), and the frame
  (−e₂,e₀,e₁) has determinant −1, so the native coefficient is −1; A(x₀,x₁,x₂)=(x₂,−x₀,x₁) has
  determinant −1 and restores +1. Adopting the native map with only a rotation of its pole
  would reverse the generator in every even dimension.

### 4.5 Cofibrations and CW transport

Here NDR means neighborhood deformation retract, specified by the data of Tau Ceti's
`TauCeti.NDRPair`: a control function vanishing exactly on the subspace and a deformation
fixing it; such data exist exactly for closed subspaces with the homotopy extension property
(`TauCeti.nonempty_ndrPair_iff`; supplier contracts).

*Needs:* Native relative CW structures, mapping cylinders and HEP; §4.8 for kified products; closed cofibrations.

Consume existing `TauCeti.HasHomotopyExtensionProperty` and
   `TauCeti.hasHomotopyExtensionProperty_base` for native relative CW
   inclusions as closed cofibrations. Consume the existing mapping cylinder,
   projection equivalence and inclusion HEP; construct the relative and double
   mapping cylinders and skeletal induction. Cellular approximation, relative to the base of
   a relative CW pair, is Tau Ceti's `TauCeti.exists_isCellular_homotopicRel` and, for CW
   complexes, `TauCeti.exists_isCellular_homotopic` (Hatcher, Theorem 4.8, p.349).
   Consume existing
   `TauCeti.HasHomotopyExtensionProperty.exists_strong_deformation_retraction`
   when the inclusion is a homotopy equivalence.
   Own the relative CW pushout: for a Hausdorff native relative CW pair (Y,B),
   a Hausdorff space Z and a continuous attaching map a:B→Z, use the actual
   TopCat pushout Z∪_aY with its quotient topology. That Z→Z∪_aY is a closed
   embedding is Tau Ceti's `TauCeti.TopCat.isClosedEmbedding_of_isPushout`, B→Y being
   a closed embedding, and a categorical relative CW complex on a Hausdorff space has
   Hausdorff target (`TopCat.RelativeCWComplex.t2Space`). Construct native
   `RelCWComplex` relative to the image of Z, and exhibit Z→Z∪_aY as a categorical
   relative CW complex to obtain Hausdorffness. Its n-cells are exactly the relative
   n-cells of (Y,B), with characteristic maps composed with Y→Z∪_aY.
   Prove their interior embeddings, boundary formulas, closure-finiteness
   relative to Z, weak topology and naturality for commuting attachment
   diagrams. Z needs no CW structure. Use skeletal disk adjunctions to prove
   the remaining topology statements. If the input spaces are compactly
   generated, prove the raw relative CW pushout is compactly generated;
   otherwise identify its Kelley coreflection with the compactly generated
   pushout of kZ←kB→kY, retaining the canonical continuous bijection to
   the raw pushout and its comparison maps.
   Own the homotopy-pushout gluing comparison: pushouts along a closed
   cofibration B→Y are homotopy pushouts. For an actual commuting map of
   attachment diagrams that is a homotopy equivalence on B,Y,Z, construct
   the induced homotopy equivalence of pushouts, requiring closed cofibrations
   for both source and target attaching inclusions; if the gluing square only
   commutes by a specified homotopy, use the double mapping cylinder and
   retain that homotopy in the comparison. Prove the versions for homotopic
   attaching maps and for changing the base by a specified homotopy
   equivalence, with maps, inverses and homotopies relative to each
   prescribed closed CW/cofibration subspace on which the input maps and
   inverse homotopies are fixed, with their compatible relative HEP data. In particular,
   homotopic attachments to the same Z give equivalences restricting to id_Z
   and inverse homotopies fixing Z (Milnor, *Morse Theory*, 1963, Lemmas 3.6–3.7).
   The cylinder homotopy extension for closed cofibrations, HEP for ({0,1}×X)∪(I×A) in I×X
   when A⊆X is closed with HEP, is Tau Ceti's
   `TauCeti.HasHomotopyExtensionProperty.zero_one_prod_univ_union_univ_prod`, the case
   (I,{0,1})×(X,A) of Strøm's product theorem (Strøm, *Note on cofibrations II*, Math.
   Scand. 22 (1968), Theorem 6, p.135); the constructions below use it in the native I×X
   order with the full prescribed endpoint and subspace data.
   Own the one-sided extension of homotopy inverses to pairs (X,A),(X′,A′). Require both
   inclusions to be closed cofibrations, f:X→X′ to carry A into A′, and
   both f and its restriction f₀:A→A′ to be homotopy equivalences.
   Given g₀:A′→A and H₀:g₀f₀≃id_A, construct g:X′→X and H:gf≃id_X
   with g|A′=g₀ and H|A×I=H₀ as actual maps into A. Construct the other
   inverse homotopy. Route: for any K₀:f₀g₀≃id_(A′), Brown's theorem on homotopy
   equivalences of maps of cofibrations with its addendum (Brown, *Topology and Groupoids*,
   7.4.2 and its Addendum, pp.285–286) extends g₀ to a homotopy
   inverse g of f whose homotopy gf≃id_X restricts on A×I to the track composite
   −g₀f₀H₀+g₀K₀(f₀×1)+H₀ (left summand first), not to H₀ itself. Choose K₀ by Vogt's
   proposition (Vogt 1972, Proposition, p.627), so that f₀H₀ and K₀(f₀×1) are homotopic
   relative to the ends of I;
   applying g₀, the composite is then homotopic to H₀ relative to the ends, and the cylinder
   homotopy extension above, for (I,{0,1})×(X,A), deforms the homotopy on X×I, relative
   to X×{0,1}, until its restriction to A×I is exactly H₀.
   Own the tower homotopy equivalence for closed-cofibration sequences: for sequences of Hausdorff
   spaces with closed-cofibration bonding inclusions and strictly commuting
   levelwise equivalences f_n, construct the actual mapping telescopes and
   their homotopy equivalences to the raw final-topology colimits.
   Construct strictly compatible left inverses and compatible left-inverse
   homotopies by the one-sided pair extension. Apply the same construction a
   second time to that left-inverse tower to prove the induced colimit map
   is a two-sided homotopy equivalence. No inverse data are required as input.
   For levelwise equivalences whose squares commute up to specified
   homotopies, construct the induced mapping-telescope map and prove it
   is a homotopy equivalence. A raw colimit map requires strict commuting
   maps. Prove the relative version when the maps and inverse homotopies
   fix a specified common closed-cofibration subspace at every stage.
   That every compact subset of the final-topology union lies in a finite stage, and every
   map from a compact space into it factors through one, is Tau Ceti's
   `TauCeti.TopCat.exists_subset_range_ι_of_isCompact` and
   `TauCeti.TopCat.exists_lift_of_compactSpace`: the stages are Hausdorff, hence T1, and
   closed-cofibration bonds are closed embeddings, so the stages embed in the union
   (`TauCeti.TopCat.isClosedEmbedding_ι_of_isColimit`). Consume these,
   and compare dimension-filtered classical native CW unions
   with the categorical RelativeCWComplex colimit by their actual maps and
   weak topologies.
   Own the CW structure on the union of a subcomplex tower: for a sequence of Hausdorff native CW
   complexes W_k with closed embeddings onto CW subcomplexes, and specified
   compatible cell labels and characteristic maps, construct native
   `CWComplex` on the raw final-topology union. New cells may have arbitrary
   dimensions in any stage order. Its n-cells are the disjoint union of the
   new n-cells at each stage, including those of W_0; each W_k embeds as
   its specified subcomplex. A cell's closure lies in its birth stage W_k
   and meets finitely many cells there. Prove closure-finiteness, that the cellwise weak
   topology equals the stage final topology, and the comparison
   with the categorical `RelativeCWComplex` after reindexing by dimension.
   Prove the union is Hausdorff, indeed normal: each stage W_k is normal by Hatcher
   Proposition A.3, p.522, whose cellwise ε-neighborhood construction runs over its
   dimension skeleta, and Tau Ceti's `TauCeti.TopCat.normalSpace_of_isColimit` makes the
   union of normal stages along closed embeddings normal, while
   `TauCeti.TopCat.t1Space_of_isColimit` closes its singletons. Export `T2Space`
   and `NormalSpace`, independently of the later paracompactness theorem.
   Retain actual stage maps, characteristic maps and cellular naturality.
   MorseTheory M2 uses this union theorem for its critical-level tower.
   Own the CW model of a relative CW pushout: when Z has a specified Hausdorff CW
   model h:Z_c→Z with its inverse and homotopies, transport the attachment
   through that model by the gluing comparison. Construct an absolute CW
   model by cellwise cellular approximation and skeletal reindexing,
   retaining Z_c as a CW subcomplex, the new relative cell dimensions and
   the exact original cell labels and characteristic maps of Z_c. Its
   n-cells are the sum of Z_c's n-cells, with characteristic maps composed
   with Z_c→W, and the new relative n-cells; reindexing never changes the
   original cells or their parametrizations. Retain the actual cell-index
   equivalence and those characteristic-map equations under successive attachments.
   Construct the pair equivalence (W,Z_c)→(Z∪_aY,Z) restricting exactly to h on Z_c.
   Construct its inverse and homotopies; no arbitrary prescribed two-sided
   homotopy data on Z_c are required. In unbounded cell dimension use the
   induced pushout comparison maps, which restrict exactly to the previous
   skeletal comparison: cellular approximation changes the attaching map,
   and the homotopic-attachment equivalence is identity on the existing base.
   Apply the tower homotopy equivalence to these strictly commuting
   comparisons for the infinite passage.
   When Z itself is CW and h=id,
   the comparison and its homotopies fix Z. Prove the raw/classical and
   categorical RelativeCellComplex/RelativeCWComplex carrier comparisons;
   no cellularity of the original attaching map is assumed. CharacteristicClasses C2.0 uses
   these generic targets for disk-bundle attachments, and MorseTheory M2
   consumes the pushout, CW-model, compatible gluing and tower targets for
   its finite/infinite sublevel CW induction.
   The based homotopy inverse of a basepoint-preserving homotopy equivalence, with both
   homotopies relative to the base points, is Tau Ceti's
   `TauCeti.HasHomotopyExtensionProperty.exists_basedInverse_homotopicRel`, for base points
   with the homotopy extension property, in particular 0-cells of Hausdorff CW complexes
   (Hatcher, Proposition 0.19, p.16); Layer 8.5 and TopologicalKTheory T7.0 take it from there.
   The relative cylinder CW structure on X×I relative to (X×{0,1})∪(B×I), with the cell
   coordinates first and the interval coordinate last, is Tau Ceti's
   `TauCeti.relCWComplexCylinder`; Layers 8.9–8.10 consume it.
   Own the Kelley product CW structure: for finite CW complexes the product-cell structure
   on the ordinary product is Tau Ceti's `TauCeti.cwComplexProd`; for arbitrary Hausdorff CW
   X and Y construct the product-cell native CW structure on k(X×Y), with factor coordinates
   in that order, product characteristic maps, subcomplexes and cellular
   map naturality. Own compatible subcomplex neighborhoods: for subcomplexes A,B
   choose compatible open radial neighborhoods U,V with deformation
   retractions of U,V,U∩V,U∪V onto A,B,A∩B,A∪B respectively, using
   the same cellwise parameters. Prove the weak-topology continuity, the
   exact intersection/union identities and relative/subcomplex naturality.
   Layer 5.5 uses these neighborhoods for Serre preimage excision.
   AffineMorseLefschetz A4 consumes this subcomplex-neighborhood interface
   on its actual triangulated compact algebraic pairs, including singular
   subcomplexes. A4 owns the simultaneous triangulation, barycentric-neighborhood
   construction and comparison with these generic deformation-retraction laws.
   Prove its weak topology is the compactly generated
   product topology (Hatcher, Theorem A.6, p.524), and its comparison with the
   ordinary product when either factor is locally compact. Consume the
   single k coreflection/CW compact-generation API of §4.8.
   Construct the cellular approximation of the actual diagonal X→k(X×X)
   and its homotopy, using this product structure. Layer 5.5 consumes that
   diagonal in the multiplicative Serre construction; §4.9 owns
   the distinct simplicial-realization product comparison.
   Own the pair-quotient comparisons in homology and cohomology:
   for closed CW/cofibration-NDR pairs (X,B), the actual collapse map induces
   H_n(X,B;M)≃H̃_n(X/B;M) and H^n(X,B;M)≃H̃^n(X/B;M), for every n≥0,
   for constant modules over any coefficient ring (Hatcher, Proposition 2.22, p.124, for
   homology of good pairs, and §3.1, Exercise 8(b), p.205, for cohomology); extend homology to the
   abelian-category coefficient generality and exactness assumptions of Layer 2. For local
   coefficients require a specified system on the quotient and its pullback
   identification on X; do not assert descent of an arbitrary system on X.
   Use item 4’s pointed pushout carrier X←B→*; for B empty it is X
   with an added basepoint. Construct the natural
   comparison with the mapping-cone homotopy cofiber, with the cone coordinate
   last and B at cone parameter 1. Own the mapping-cone exact-sequence comparisons in homology
   and cohomology, the commuting diagrams for singular chains and raw relative cochains, retaining the actual
   quotient/inclusion maps and the extend-then-d boundary convention. These
   comparisons use Layers 2–3 and native cochain algebra, independently of
   Layer 6's product packaging and Layer 8's suspension construction. Item 8.11b
   owns their cup/suspension compatibility and the explicit cone sign formulas.

**Checks.**

- Attaching one 1-cell to a point along the constant map S⁰→* gives S¹ with one 0-cell
  and one 1-cell, χ=1−1=0 and H₁=ℤ; a model that re-adds the two 0-cells of B=S⁰ as new
  cells has 3−1=2, and a model that drops the point of Z and keeps B's two 0-cells has
  2−1=1.
- Attaching a 2-cell to S¹ along a degree-m map gives the cells of S¹ plus one 2-cell with
  d₂=m: for m=0 the pushout is S¹∨S² with H₂=ℤ, for m=2 it is RP² with H₁=ℤ/2 and H₂=0.
- For the empty pair (Y,B)=(∅,∅), or for (B,B), the pushout is Z itself with no new cells
  and identity comparison maps; the Kelley product of a point with Y is Y with its own cells.
- For the pair-quotient comparison with B=∅, the collapse X₊→X₊ is the identity and
  H̃_n(X₊)=H_n(X,∅)=H_n(X); for B=X both sides vanish.
- One-sided extension with X=A=X′=A′=S¹, f=g₀=id and H₀(x,t)=e^(2πit)x, the rotation loop
  that generates π₁ of the identity component of C(S¹,S¹), which is ℤ: with K₀ constant the
  addendum's restriction −H₀+K₀+H₀ is homotopic relative to the ends to the constant
  homotopy, which is not homotopic relative to the ends to H₀, so no deformation relative to
  X×{0,1} reaches H₀; Vogt's choice K₀=H₀ gives −H₀+H₀+H₀, homotopic to H₀ relative to the
  ends.

### 4.6 Projective spaces

*Needs:* §§4.1–4.5; Mathlib's projectivization topology with its open quotient map
`Projectivization.isOpenQuotientMap_mk'` and the Hausdorff criterion for open quotient maps
`t2Space_iff_of_isOpenQuotientMap`; Tau Ceti's projective atlas,
`TauCeti.RealProjectiveSpace` with its CW structure and incidences, the degree-m
two-cell differential, and `TauCeti.ComplexProjectiveSpace` with its CW structure
(supplier contracts).

Real projective n-space is native `Projectivization ℝ (Fin (n+1) → ℝ)`, with Mathlib's
   quotient topology `Projectivization.instTopologicalSpace`, coinduced from the nonzero
   vectors, and its quotient-map and continuity API (supplier contracts);
   ComplexKahlerGeometry K7 takes that topology from Mathlib. The affine-chart atlas
   (ratios by a nonzero coordinate) and the boundaryless manifold structure, of every order
   of smoothness, are Tau Ceti's `Projectivization.instChartedSpace` and
   `Projectivization.instIsManifold`. The antipodal sphere quotient
   `TauCeti.RealProjectiveSpace n`, its finite CW structure
   `TauCeti.RealProjectiveSpace.cwComplex` with one cell in each dimension 0,…,n, and its
   incidences are Tau Ceti's too: the cellular differential is ±2 in positive even degree
   and 0 in odd degree (Hatcher, Example 2.42, p.144: the attaching map composed with the
   collapse has degree `1 + (−1)^k`); the sign records the chosen characteristic maps and
   cell generators. Prove that Mathlib's quotient topology on
   `Projectivization ℝ (Fin (n+1) → ℝ)` is Hausdorff, which no pinned library states on
   Mathlib's instance (Tau Ceti's `Projectivization.instT2Space` is on its own copy of the
   topology): the quotient map from the nonzero vectors is an open quotient map
   (`Projectivization.isOpenQuotientMap_mk'`), and the relation "v and w span the same line"
   is closed in the square of the nonzero vectors, being the common zero set of the
   continuous 2×2 minors `v_i w_j − v_j w_i` of the coordinates, so the Hausdorff criterion
   for open quotient maps (`t2Space_iff_of_isOpenQuotientMap`) applies; this is Tau Ceti's
   argument repeated on Mathlib's instance, with the coordinate functionals in place of a
   separating dual. Own the homeomorphism from `TauCeti.RealProjectiveSpace n` to
   `Projectivization ℝ (Fin (n+1) → ℝ)` induced by v↦[v] on the unit sphere, a continuous
   bijection from a compact space onto that Hausdorff space, and its smooth local comparison
   with the affine charts, transporting the CW structure to Mathlib's carrier. The chart and CW
   comparisons use only Layers 2–4 and native manifold calculus, independently
   of Layer 6. For RP² construct the rank-one integral sign system from the
   antipodal double cover and compute its monodromy −1 around the generating
   loop by lifting that loop to a path from x to −x. Separately prove the
   linear-algebra orientation calculation on S²: the outward-first ambient
   bases `(x,v₁,v₂)` and `(−x,−v₁,−v₂)` in ℝ³ have determinants of opposite
   signs. This compares orientations at different points; a tangent-plane
   −identity in one fixed basis does not. Layer 6.3 consumes this determinant
   calculation to identify the sign system with the homological orientation
   system. This supplies
   RiemannianGeometry R4.7's single real projective carrier; its quotient
   metric remains owned there. For RP² calculate the sign-system cellular differential:
   d₂=0 and d₁=±2, while for constant integral coefficients d₂=±2 and d₁=0.
   Construct the sign system directly from the quotient's local lifts and
   their transition signs, without using Layer 5's general covering theory. For a sphere Sᵏ,
   k≥1, with one (k+1)-cell attached by a map of degree `m`, the cellular differential is `m`
   times a unit independent of the map (`TauCeti.exists_cellularDifferential_sphereMappingCone_eq_smul`);
   prove that with §4.3's oriented cell generators and §2.5's sphere class the unit is +1, so
   the differential is multiplication by `m`.
   Complex projective n-space is Tau Ceti's carrier `TauCeti.ComplexProjectiveSpace n`, the
   quotient of the unit sphere of `EuclideanSpace ℂ (Fin (n+1))` by unit scalars, with its
   finite CW structure `TauCeti.ComplexProjectiveSpace.cwComplex`: one cell in each even
   dimension 0,2,…,2n and none in odd dimensions, with the characteristic maps
   `TauCeti.ComplexProjectiveSpace.cellMap`, the closed unit disc D²ᵏ⊂ℂᵏ mapping onto ℂPᵏ by
   z↦[z:√(1−|z|²)] and attaching its boundary S²ᵏ⁻¹ along the quotient map onto ℂPᵏ⁻¹
   (Hatcher, Example 0.6; supplier contracts). Every statement of this roadmap about complex
   projective space is made on this sphere-quotient carrier. The comparison of the carrier
   with `Projectivization ℂ (Fin (n+1) → ℂ)` under Mathlib's quotient topology, and the
   transport of the CW structure and its characteristic maps along that comparison, are
   ComplexKahlerGeometry K7's.

**Checks.**

- Complex projective space: ℂP⁰ is a point with one 0-cell; ℂP¹ has one 0-cell and one
  2-cell, the disc D² mapping by z↦[z:√(1−|z|²)] with its boundary circle collapsed to the
  point [1:0], so it is S² with χ=2; in general the n+1 even cells give χ(ℂPⁿ)=n+1, Tau
  Ceti's `TauCeti.eulerChar_complexProjectiveSpace`, and all cellular differentials vanish
  because no two cells have adjacent dimensions. For n=0 the unit sphere of ℂ is the
  circle, a single orbit of the unit scalars, and the quotient is one point, whereas a
  quotient by ±1 alone would leave a circle.
- Hausdorffness of the quotient topology: the lines through v=(1,2) and w=(2,4) in ℝ² have
  every minor zero (1·4−2·2=0) and are one point of RP¹, while v=(1,0) and w=(0,1) have minor
  1·1−0·0=1 and are distinct points; the antipodal pair ±(1,0) is one point, so the Hausdorff
  separation is between lines, not between vectors.
- Hausdorffness needs the nonzero vectors: the quotient of all of ℝ^(n+1) by unit scaling is
  not Hausdorff, since a saturated open set containing the origin contains a ball and so meets
  every line, so the class of the origin is separated from no other point; the criterion is
  applied to the open quotient map from the nonzero vectors, where the origin is absent.
- RP²: the sign system from the antipodal cover has monodromy −1 around the generator of
  π₁=ℤ/2, the constant system +1; with the sign system d₂=0 and d₁=±2, so H₂(RP²;ε)=ℤ,
  H₁=0 and H₀=ℤ/2, while constant integral coefficients give H₂=0, H₁=ℤ/2, H₀=ℤ.
- RP¹≅S¹: the antipodal sign system is the Möbius system with d₁=±2 (the two ends of the
  1-cell attach with opposite transported signs), so H₁(RP¹;ε)=0 although H₁(RP¹;ℤ)=ℤ; the
  sign system is a datum of the cover, not the orientation system of the orientable RP¹.
- On S²⊂ℝ³ the outward-first bases (x,v₁,v₂) and (−x,−v₁,−v₂) have determinants of
  opposite sign because det(−A)=(−1)³det A; on S¹⊂ℝ² negation preserves the determinant,
  consistent with RP¹ orientable and RP² not.

### 4.7 Simplicial realizations

*Needs:* Native simplicial sets and geometric realization; §§2.5 and 4.1–4.5; native CW weak topology.

Own the realization CW structure for every native simplicial set K: on
   `SSet.toTop.obj K`, construct one cell per `K.nonDegenerate n`, with the
   realized simplex as characteristic map. Own an orientation-preserving
   homeomorphism from the native
   sup-norm cell ball to Δ^n, carrying Layer 2.5's ball class to the relative
   ordered identity-simplex class with coefficient +1. Fix the map radially:
   send 0 to the centroid c=(1/(n+1),…,1/(n+1)); for nonzero z in the
   sup-norm unit ball set w=(-Σz_j,z_0,…,z_(n−1)), r=‖z‖∞ and
   m=max_i(−w_i)>0, and use weights c_i+r w_i/((n+1)m). This uses the
   ordered tangent basis e_(j+1)−e_0 and positive radial scaling. In degree
   zero use the unique point map. Prove it is a homeomorphism of pairs and
   fixes the stated positive homology class. The characteristic
   map is realized σ composed with this fixed homeomorphism; compare it
   with 8.2's +1 cube-to-simplex map. Prove Hausdorffness, closure
   finiteness and the weak topology (May, *Simplicial Objects in Algebraic Topology*, §14,
   Theorem 14.1: the realization of a simplicial set is a CW complex with one n-cell for each
   nondegenerate n-simplex). Realized simplicial maps are cellular
   and sub-simplicial inclusions identify actual CW subcomplexes. Bar,
   Dold–Kan and singular realizations consume this one construction.
   AffineMorseLefschetz A4 consumes it through GeometricTopology Layer 11's
   ordered-complex/simplicial-set realization and transported CW comparison
   for its ambient triangulated algebraic pair and subcomplexes. Prove
   the general paracompactness of Hausdorff CW complexes used by bundle suppliers (Hatcher,
   *Vector Bundles and K-Theory*, Appendix to Chapter 1, Proposition 1.20, p.36: every CW
   complex is paracompact).
   Own the cell-neighborhood local contraction API for arbitrary Hausdorff
   CW complexes: for x∈U open construct a smaller open V containing x
   and a homotopy V×I→U from inclusion to the constant x, compatible with
   the cell weak topology. CharacteristicClasses C1.2 consumes this for its locally acyclic
   singular-cochain sheaf resolution; it does not presume a good cover.

**Checks.**

- Δ[0] realizes to a point with one 0-cell; Δ[1] has two nondegenerate vertices and one
  nondegenerate edge, realizing to I with χ=1; counting all simplices including the
  degenerate ones would give infinitely many cells.
- ∂Δ[2] has three vertices and three edges, realizes to S¹ with χ=0 and H₁=ℤ; the quotient
  Δ[2]/∂Δ[2] has one vertex and one 2-simplex, realizes to S² with H₂=ℤ.
- The orientation homeomorphism for n=1 sends 0 to the centroid (1/2,1/2), z=1 to e₁ and
  z=−1 to e₀, so the interval class with boundary [1]−[−1] goes to the ordered simplex
  class with boundary [e₁]−[e₀], coefficient +1; the reflected map would give −1. For n=2
  the point z=(1,0) goes to (0,2/3,1/3) on the face opposite e₀, so the boundary is
  carried to the boundary.

Hatcher, Chapter 0, pp.5–17, supplies cell complexes and the homotopy extension property
(Propositions 0.16 and 0.19, pp.15–16); Section 2.2 (Lemma 2.34, p.137, Theorem 2.35, p.139,
and the cellular boundary formula, p.140) supplies cellular homology and Theorem 4.8 (p.349)
cellular approximation.
Whitehead, *Elements of Homotopy Theory*, Chapters II--IV, supplies cofibrations, mapping
cylinders, and skeletal induction.  The categorical implementation follows Mathlib's actual
skeleta and their colimit maps rather than a parallel cell-filtration record.

### 4.8 Compact generation and the pointed adjunction

The compact-generation functor k is Mathlib's coreflection `GeneratedByTopCat.adj` for the
family of all spaces of `CompHaus.{u}`, with the same universe u of compact Hausdorff test
spaces as `CompactlyGenerated.{u, w}` (supplier contracts). Prove that a space is generated by
this family exactly when it is u-compactly generated (`UCompactlyGeneratedSpace.{u}`): by
`TopologicalSpace.generatedBy_eq_coinduced` the generated topology is coinduced by the single
map from the sigma type of pairs (S, g) of a compact Hausdorff S and a continuous g:S→X, which
is the definition of `TopologicalSpace.compactlyGenerated`, so the two topologies on every space
are equal. Hence `CompactlyGenerated.{u, w}` and this `GeneratedByTopCat` are the same full
subcategory of `TopCat.{w}`, and transporting `GeneratedByTopCat.adj` along that identification
makes k a right adjoint of `CompactlyGenerated.compactlyGeneratedToTop`, sending X to X with
`TopologicalSpace.compactlyGenerated`; the counit kX→X is the identity on points.
Use pointed objects in this category, products k(X×Y), compact-open mapping spaces
followed by k, and the smash quotient. Reduced suspension is X∧S¹ with the interval
coordinate last; loops are based interval maps. Prove the suspension–loop adjunction
on actual pointed maps and on pointed homotopy classes. Pin its map formula:
the adjoint of f sends x to the based loop (t↦f([x,t])). The unpointed currying
bijection is Mathlib's `Topology.ContinuousMapGeneratedBy.curryEquiv` for this family, whose
members are locally compact and whose pairwise products are again compact Hausdorff, hence
generated by the family; prove these two hypotheses and read the bijection through the
coreflection. The exponential-law route uses compact tests; its ordinary compact-open comparisons
retain local compactness of the evaluation source, and the ordinary exponential
homeomorphism retains the Hausdorff hypotheses on both source factors
(Hatcher, Propositions A.14–A.16, pp.530–531). The CW comparisons use
Hatcher, Appendix, pp.523–524 and Theorem A.6, p.524.

- Prove the identification of the two full subcategories and transport the adjunction,
  its triangle identities, the invertible unit, `Coreflective`, `CreatesColimits` and
  `HasLimits` to `CompactlyGenerated`: colimits are computed in `TopCat` and limits are k of
  the limits in `TopCat`.
- The counit kX→X is a homeomorphism exactly when X is compactly generated
  (`eq_compactlyGenerated`). Derive it for Hausdorff CW complexes from Tau Ceti's
  `TauCeti.instDeltaGeneratedSpaceCWComplex` and Mathlib's instances that delta-generated
  spaces are sequential and sequential spaces compactly generated, and for Hausdorff locally
  compact spaces from Mathlib's weakly-locally-compact instance.
- Prove the pointed exponential law and relative homotopy compatibility. Own the three
  comparisons of raw quotients with their convenient counterparts: the compact based smash
  with the convenient smash, the compact reduced suspension with the convenient suspension,
  and the reduced suspension of a pointed Hausdorff CW complex with the convenient
  suspension, each through the Kelley coreflection of the raw quotient supplied by 4.4.
  Transport the adjunction through those comparisons, preserving basepoints and interval
  order, naturality and homotopies relative to a specified based subspace.

**Checks.**

- For a point, k(*)=* and both triangle composites are id; an empty-space model gives ∅ instead.
- For I=[0,1], the counit sends 0 to 0 and 1 to 1; reversing it exchanges the two endpoints.
- For S⁰ pointed at one vertex, S⁰∧S¹≅S¹ and adjunction identifies degree +1
  with the loop t↦exp(2πit), of winding +1; reflection gives winding −1.
- The two-point Sierpiński space has opens ∅,{1},{0,1}; its compact generation
  has the same three opens and is still not Hausdorff. Compact generation alone
  cannot supply the separation hypothesis of the CW comparisons.
- Convenient products give k(∅×I)=∅, k(*×I)=I and k(I×I)=I²;
  the last retains both coordinates, excluding a projection as the comparison.
- Exponentials give C(∅,I)=*, C(*,I)=I and C(S⁰,I)=I². Under evaluation,
  the pair (0,1) takes the two vertices to 0 and 1; a constant-map model loses it.
- Pointed smash gives *∧S¹=* and S⁰∧S¹=S¹; reduced suspension gives
  Σ*=*, ΣS⁰=S¹ and ΣS¹=S², with reduced H₂ respectively 0,0,ℤ.
  An unreduced suspension of the point is an interval, not this one-point quotient.

*Needs:* Mathlib `GeneratedByTopCat.adj` with its instances,
`TopologicalSpace.generatedBy_eq_coinduced`, `Topology.ContinuousMapGeneratedBy.curryEquiv`,
`CompactlyGenerated`, `CompactlyGenerated.compactlyGeneratedToTop`,
`TopologicalSpace.compactlyGenerated`, compact-open topology, quotient topology,
and native continuous maps and homotopies. CW comparison additionally uses Tau Ceti's
`TauCeti.instDeltaGeneratedSpaceCWComplex`. The coreflection portion uses no other item
of this layer; §§4.4 and 4.5 consume it. The raw-quotient comparisons use §4.4,
whose construction needs only that coreflection portion, not the transported
adjunction. No Hurewicz, EM model or stabilization is an input.

### 4.9 Realization of a product of simplicial sets

*Needs:* §4.7's realization CW structure, §4.5's Kelley product CW structure and §4.8's
coreflection with its CW and locally compact product comparisons; native simplicial sets
and geometric realization. No ordinary representability or Eilenberg–MacLane family
input.

Own the simplicial-realization product comparison: for native simplicial
   sets K and L, the canonical continuous bijection |K×L|→|K|×|L| is a
   homeomorphism onto k(|K|×|L|), natural in K and L and compatible with
   the projections, the diagonal and the degreewise basepoints of pointed
   simplicial sets. Prove it on §4.7's realization CW structures, which take no
   input from this item: each
   pair of nondegenerate simplices gives the product cell |Δ[n]|×|Δ[m]|,
   whose shuffle triangulation realizes Δ[n]×Δ[m] by a homeomorphism of
   compact Hausdorff spaces, and both sides carry the same colimit topology
   over these cells, that of §4.5's Kelley product CW structure on k(|K|×|L|).
   Its identification of |A•×A•| with k(|A•|×|A•|) for a simplicial abelian group A•
   precedes §§8.10 and 8.11b, which consume it for realized
   addition and the EM loop adapters. GeneralizedCohomology G2.1 consumes it
   for its pointed smash/quotient versions and monoidal/cofibre diagrams,
   so no second realization-product comparison is built there.

**Checks.**

- K=L=Δ[0]: both sides are a point. K=∅: both sides are empty for every L.
- K=L=Δ[1]: Δ[1]×Δ[1] has four vertices, five nondegenerate edges (the four sides and the
  diagonal) and two nondegenerate triangles, the two shuffles; its realization is the
  square I×I cut along the diagonal, with χ=4−5+2=1, and the comparison is the identity of
  the square. Counting only the four sides and one 2-cell describes the product cell
  |Δ[1]|×|Δ[1]| of §4.5, of which the shuffle triangulation is a subdivision.
- The projections of the comparison are the realizations of the two simplicial
  projections: on the diagonal edge of Δ[1]×Δ[1] both are the identity of I, so the
  diagonal edge is sent to the diagonal of the square and not to a side.

### 4.10 Connected maps, weak equivalences and CW approximation

*Needs:* Tau Ceti's weak homotopy equivalences with their homology invariance for constant
and local coefficients, CW approximation of path-connected spaces with its lifts, and
`TauCeti.CWType` (supplier contracts); §2.6 and §4.5's mapping cylinders; Mathlib
`ZerothHomotopy` and disjoint unions of CW complexes. No input from Layer 8.

Consume the
   native weak-equivalence invariance: a weak homotopy equivalence in the
   native sense `ContinuousMap.IsWeakHomotopyEquivalence` induces isomorphisms
   on singular homology with coefficients in any ring
   (`ContinuousMap.IsWeakHomotopyEquivalence.isIso_singularHomologyMap`; Hatcher,
   Proposition 4.21, p.356, for coefficient groups) and with any local
   coefficient system on the target
   (`ContinuousMap.IsWeakHomotopyEquivalence.isIso_twistedHomologyMap`), on arbitrary
   spaces. Own its connected-map refinement: the homology comparison of a k-connected map
   on native simplicial singular and twisted chains, by the direct
   Eilenberg-subcomplex route of tom Dieck 9.5.1: formulate connectivity by
   relative disc/sphere compression and homotopy lifting, without Layer 8.1's
   relative homotopy-group construction or Layer 8.3's Hurewicz theorem. For
   a k-connected mapping-cylinder pair generate the subcomplex by simplices
   carrying their k-skeleton into the subspace; construct face-compatible
   homotopies P(σ), fixing compressed simplices and relative faces, and the
   prism chain equivalence; transport local coefficients along P at vertices,
   with face/prism compatibility. The complexes agree through degree k, giving
   homology isomorphisms below k and surjectivity in k. For a weak equivalence
   compress compatibly in every degree to obtain the coefficient-chain
   homotopy equivalence and its Hom/cohomology comparison, for maps of pairs
   and their exact sequences; thus a weak equivalence induces local-coefficient
   homology and cohomology isomorphisms on arbitrary spaces. CharacteristicClasses C1.2 consumes
   these exact maps for its singular-realization counit, not a second proof.
   Consume native CW approximation of path-connected spaces: the CW complex
   `TauCeti.cwApproximation`, built by attaching cells degree by degree
   to kill kernels and add generators of the native homotopy groups (Hatcher,
   Proposition 4.13), with `TauCeti.isWeakHomotopyEquivalence_cwApproximationMap`, its
   lifts `TauCeti.cwApproximationLift`, natural and unique up to homotopy
   (Hatcher, Proposition 4.18), and the native compression lemma (Hatcher, Lemma 4.6). Own
   `exists_cwApproximation`: every space, path-connected or not, admits a
   weak equivalence from a space of CW type, by approximating each path
   component (Hatcher, Proposition 4.13). Own the pair form (Hatcher, Example 4.14); the
   n-connected CW models of a pair (X,A) with A a nonempty CW complex (Hatcher,
   Proposition 4.17), unique up to homotopy equivalence rel A (Hatcher, Corollary 4.19);
   and the n-connected-pair form: an n-connected CW pair (X,A) is homotopy equivalent
   rel A to a CW pair whose relative cells all have dimension greater than n (Hatcher,
   Proposition 4.15). Layers 5.5, 8.3, 8.8c, 8.8d and
   8.11b consume these targets; GeneralizedCohomology G2.1 and DGFloer Layer 1
   consume them rather than rebuilding them.

**Checks.**

- The empty space is approximated by the empty complex.
- The Warsaw circle, path connected with all homotopy groups trivial, is approximated by a
  point although it is not contractible.
- Two points are approximated by two points, which a single path-connected approximation
  cannot do.


### Examples

The degree-m two-cell attachment has differential multiplication by m. At m=0 its kernel is ℤ; at m=2 its cokernel is ℤ/2; for a point the only cell is in degree zero.

### Dependencies

*Needs:* Layers 2–3; native CW cells, relative skeleta and homotopies; Layer 4.8 only for kified products and suspension.
## Layer 5: bundles, covers, products, and finite-cover descent

Fibrations in this layer are Tau Ceti's Serre fibrations,
`TauCeti.TopCat.serreFibrations` on `TopCat` morphisms, with its disc and cube
characterizations, base change and the covering-map, product-projection and
locally-trivial-bundle instances (supplier contracts); this layer restates none of them.
Homotopy lifting for a Serre fibration against every relative CW pair, the fibration
homotopy sequence and the Serre spectral sequences are §5.5's. §5.0 is homological
algebra on native filtered complexes and consumes no topology; Layer 6.0's lim¹ sequence
supplies its complete-convergence form.

This layer consumes Layers 2--4, with one exception: the product maps of item 1 (the
Alexander--Whitney and Eilenberg--Zilber maps, the shuffle map, and the chain homotopies between
them) consume only Layer 2 and can proceed alongside Layers 3 and 4.  The Kunneth spectral
sequence and theorems of item 1, and items 2--7, consume all of Layers 2--4.

### 5.0 Spectral sequence of a filtered complex

*Needs:* Tau Ceti `CochainComplex.filtrationFunctor`, `CochainComplex.spectralSequence`,
`CochainComplex.filtrationAbutmentIso` and
`CochainComplex.filtrationSpectralSequencePageXIsoGradedOfExhaustive` (supplier
contracts); Mathlib `HomologicalComplex.extend`; Layer 6.0's Milnor/lim¹ sequence for
complete convergence only.

Consume the native spectral sequence of an
   increasing filtration `F : ℤ → Subobject K` of a cochain complex indexed by ℤ (supplier
   contracts): `CochainComplex.filtrationFunctor` and `CochainComplex.spectralSequence`
   (`Algebra/Homology/SpectralSequence/Filtered/SpectralObject.lean`), whose page-2 object at
   `(p,q)` is `H^(p+q)(F_(q+1)/F_q)` with first differential the connecting map of
   `F_q/F_(q−1)→F_(q+1)/F_(q−1)→F_(q+1)/F_q`
   (`CochainComplex.spectralSequence_first_page_d_eq`); the abutment
   `CochainComplex.filtrationAbutmentIso` with the image filtration `F_q H^n=im(H^n(F_q)→H^n(K))`
   and graded pieces the limit objects E∞; strong convergence for finite filtrations; and, for
   module coefficients and exhaustive filtrations, exhaustion of the abutment filtration
   (`CochainComplex.exists_mem_range_filtrationAbutmentFiltrationι`), the identification of a
   page with the graded piece once the cohomology of the lower stage and of the quotient by the
   upper stage vanish (`CochainComplex.filtrationSpectralSequencePageXIsoGradedOfExhaustive`),
   the comparison theorem
   (`CochainComplex.isIso_homologyMap_of_isIso_spectralSequence_page_of_exhaustive`) and
   naturality under filtered maps (`CochainComplex.filtrationFunctorMap`). Own what these leave.

   *Homological regrading.* For an increasing filtration of a module chain complex over a ring
   with degreewise lower bounds `∀ n, ∃ s(n), F_(s(n)) C_n=0` and exhaustion `⋃_p F_p C_n=C_n`,
   regrade `C^(−n)=C_n` with the same differential. The native finite-filtration results need
   `F_a=⊥` in every degree at once; a degreewise bound is weaker, and the lower bound concerns
   the filtration in each chain degree, not merely the degrees in which the complex is nonzero.
   The homological `E^r_(p,q)` is native page r+1 at bidegree (a,b)=(1−2p−q,p−1), so
   deg=a+b=−(p+q) and the graded piece is `F_p C/F_(p−1) C`; prove that the induced filtration
   `F_p H_n=im(H_n(F_p C)→H_n(C))` is exhaustive and bounded below in each degree, hence
   separated, and that `E∞_(p,q)≃F_p H_(p+q)/F_(p−1) H_(p+q)` naturally (Weibel, Classical
   Convergence Theorem 5.5.1(2); no finite upper filtration bound is required).

   *Decreasing filtrations.* For a decreasing cochain filtration F^p use the increasing
   functor G_t=F^(−t); its cohomological E_r^(p,q) is native page r+1 at (a,b)=(2p+q+1,−p−1),
   so deg=p+q and the graded piece is `F^p/F^(p+1)`. Prove the quotient-page identifications
   and the representative-boundary differential formula, retaining the mapping-cone and
   reindexing signs.

   *Complete convergence.* Own the cohomological form of Weibel's Complete Convergence
   Theorem 5.5.10 for complete exhaustive decreasing cochain filtrations with regular spectral
   sequence: prove weak convergence with its induced cohomology filtration and E∞ graded
   identification, and strong convergence under the theorem's degreewise spectral boundedness
   after cohomological reindexing, using Layer 6.0's Milnor/lim¹ sequence; the first-quadrant
   case is regular and degreewise bounded. Cup pairings come from actual filtered cochain maps,
   independently of convergence. §5.5's Serre sequences and §5.7's cover-descent sequence
   consume this single construction; ComplexKahlerGeometry K8's column-filtration adapter
   and DGFloer Layer 1's cubical transports consume it as well.

**Checks.**

- The two-step filtration `0=F_(−1)⊆F_0=A[0]⊆F_1=C` of the complex C with `C_1=C_0=ℤ` and
  differential multiplication by 2, with `A[0]` the degree-zero part: `E¹_(0,0)=ℤ`,
  `E¹_(1,0)=ℤ`, `d¹` is multiplication by 2, so `E²=E∞` is `ℤ/2` in total degree 0 and 0 in
  degree 1, matching `H_0(C)=ℤ/2` and `H_1(C)=0`.
- The filtration by degree, `F_p C_n=C_n` for n≤p and 0 for n>p, of a complex nonzero in
  infinitely many degrees is exhaustive with no stage equal to C, yet in total degree n the
  abutment filtration reaches `H_n(C)` at p=n and `E∞_(n,0)=H_n(C)` is its only nonzero
  graded piece, as the degreewise statement requires.
- Non-example: the filtration `F_p=C` for every p is exhaustive but not bounded below in any
  degree; every page vanishes while `H_*(C)` need not, so the lower bound cannot be dropped.

### 5.1 Eilenberg–Zilber and Künneth

*Needs:* §2.6 and native Alexander–Whitney/shuffle maps; bounded-below free complexes and Tor for Künneth.

Consume native Alexander--Whitney, shuffle and Eilenberg--Zilber chain-homotopy
   equivalences for singular chains, and the native homology cross product
   `TopCat.singularHomologyCross` with its cycle-class formula, its naturality in the
   spaces and in the coefficients, and its Alexander–Whitney comparison; the cross
   product of this roadmap is that native map followed by the coefficient change along
   the unitor `R ⊗_R R ≅ R`, and no second cross product is defined. Extend their natural/local-coefficient and relative APIs.  Over every commutative
   ring `R`, construct the first-quadrant Kunneth spectral sequence
   `E^2_(p,q) = directSum_(i+j=q) Tor^R_p(H_i(X;R),H_j(Y;R))` converging naturally to
   `H_(p+q)(X times Y;R)` (Stacks, Lemma 15.65.4, Tag 0H7Z, for complexes with bounded
   cohomology, in cohomological indexing with `Tor^R_(−p)`).  Prove convergence from the
   bounded-below, degreewise-free singular chain complexes: in total degree n, every term,
   differential and abutment involves only chains of degree at most n+2, so the
   brutal truncations above degree n+2, which are bounded and free, reduce degree n to the
   bounded case.  The field isomorphism
   `directSum_(i+j=n) H_i(X;k) tensor H_j(Y;k) ~= H_n(X times Y;k)` by the native cross products,
   and over a PID or hereditary commutative ring the short exact sequence to product homology
   and then to `directSum_(i+j=n-1) Tor^R_1(H_i(X;R),H_j(Y;R))` with its non-natural splitting,
   are Tau Ceti's `TopCat.singularHomologyKunnethIso`,
   `TopCat.singularHomologyKunnethUnitShortComplex_shortExact` and
   `TopCat.singularHomologyKunnethUnitSplitting` (supplier contracts); identify the edge map of
   the spectral sequence with that Künneth map, so that the spectral sequence collapses to them.
   State and prove the general-ring collapse corollaries under explicit flatness or
   projectivity hypotheses.
### 5.2 Wang sequence

*Needs:* Tau Ceti's pair sequences (supplier contracts) and native excision for good pairs; Tau Ceti's Wang sequence
for homeomorphisms.

For the mapping torus of a self-homeomorphism φ the Wang sequence, its mapping-cone model with
   endomorphism `id − φ_*`, its exactness and its naturality under maps intertwining two
   monodromies are Tau Ceti's (supplier contracts). Add the sequence for arbitrary continuous
   maps, at the generality of Hatcher, Example 2.48, p.151: for continuous f,g:X→Y let Z be
   the quotient of `X×I ⊔ Y` by (x,0)∼f(x) and (x,1)∼g(x), with i:Y→Z. Prove the natural
   long exact sequence
   `… → H_n(X) → H_n(Y) → H_n(Z) → H_(n−1)(X) → …` whose first map is `f_* − g_*` and whose
   second is `i_*`, by comparing the pair sequences of (X×I,X×∂I) and (Z,Y) along the
   quotient map, Y being a deformation retract of a neighbourhood in Z, natural under
   maps of the data (a:X→X′, b:Y→Y′ with b∘f=f′∘a and b∘g=g′∘a). With f the identity of X=Y,
   Z is the mapping torus of the continuous self-map g and the first map is `id − g_*`; for g
   a homeomorphism, identify Z with Tau Ceti's mapping torus and the sequence with the native
   Wang sequence.

**Checks.**

- X=Y=S¹, f=id and g a reflection: `id − g_*` is 0 on H₀ and multiplication by 2 on H₁=ℤ,
  so H₁(Z)=ℤ/2⊕ℤ, the Klein bottle, in agreement with the native Wang sequence; the map
  `id + g_*`, which is 0 on H₁ and 2 on H₀, would give H₁(Z)=ℤ.
- X=Y=S¹, f=id and g(z)=z², not a homeomorphism: `id − g_*` is −1 on H₁ and 0 on H₀, so
  H₁(Z)=ℤ and H₂(Z)=0, whereas `id + g_*`, which is 3 on H₁ and 2 on H₀, would give
  H₁(Z)=ℤ/3.
- X=Y=S¹, f=id and g constant: `id − g_*` is the identity on H₁ and 0 on H₀, so H₁(Z)=ℤ and
  H₂(Z)=0; Z is a disc with its centre glued to a boundary point, homotopy equivalent to S¹.
- f=g=id: the first map is 0 and H_n(Z)=H_n(Y)⊕H_(n−1)(X), as for Z=X×S¹.
### 5.3 Finite covers and transfer

*Needs:* Tau Ceti's transfer `IsCoveringMap.singularTransfer` and its degree and deck-sum
formulas; §2.6; native group homology and filtered complexes for Cartan–Leray.

The chain transfer of a finite covering, the sum of the lifts of each simplex, with
   `p_* transfer = d * id` when every fibre has `d` points, the locally constant degree form,
   the deck-sum formula for the quotient covering of a free finite group action, the
   permutation local system of a nonregular finite cover and the coinvariant comparison are
   Tau Ceti's (supplier contracts)
   (Hatcher, Section 3.G, p.321, the transfer paragraph preceding Proposition 3G.1;
   Proposition 3G.1 itself is the corollary that over a field whose characteristic does not
   divide `d` the pullback is injective with image the deck invariants, for a cover defined
   by a group action).
   Use native `IsCoveringMap`; general finite covers include zero-sheet covers.
   For the regular-cover quotient-chain and Cartan--Leray package additionally
   give an actual surjectivity proof for p:E→B and a left deck G-action simply
   transitive on every fibre. Compare this datum with native
   `IsQuotientCoveringMap p G` via
   `isQuotientCoveringMap_iff_isCoveringMap_and`, retaining its continuity,
   orbit and free-action witnesses. This surjectivity condition includes the
   empty-base case; do not replace it by an unnecessary nonempty-base hypothesis.
   For finite G, starting from the native deck-sum formula, identify the
   quotient chain complex `C_*(E;M)_G` naturally with `C_*(B;M)` for constant
   R-module coefficients M. Build the deck chain complex in native `Rep R G`,
   its forgetful comparison and native coinvariants-functor quotient map. If
   q_E:C_*(E;M)→C_*(E;M)_G is the canonical coinvariant projection and
   φ:C_*(E;M)_G→C_*(B;M) is the comparison, require the square equation
   `q_E ≫ φ = p_*` after the stated forgetful identification. Thus φ is induced
   by p_*, not an unspecified natural isomorphism.
   The coefficient representation on H_q(E;M) is the direct left action
   ρ(g)=(deck g)_*. Construct the Cartan--Leray spectral sequence with
   `E²_(p,q) = H_p(G; H_q(E;M))`, the native `groupHomology` of the deck
   representation on `H_q(E;M)`, converging to `H_(p+q)(B;M)`, including its
   filtration/edge naturality (Brown, *Cohomology of Groups*, Chapter VII).
   Compute it using native `groupHomology.inhomogeneousChains`; its first
   boundary term is ρ(g₀⁻¹), so do not invert the deck representation again.
   For cohomological deck comparisons the induced left action is
   `(g⋅φ)=(deck g⁻¹)^*φ`; compare its bar differential with native
   `groupCohomology.inhomogeneousCochains` and the fixed local-system transport.
   Only when `|G|` is invertible in R, or under a separately stated exactness
   hypothesis, derive the homology coinvariant isomorphism and the normalized
   transfer identification with invariants. For a nonsurjective cover quotient
   chains compute the covered open-and-closed image of p, not all of B; apply
   the surjective package after restricting the base to that image. For a
   nonregular finite cover use the native permutation local system. For a disconnected
   base state the general transfer formulas componentwise with their locally
   constant fibre cardinalities. On a nonempty base a finite regular datum has
   degree |G|; no such numerical equality is required when B is empty.

**Checks.**

- For the identity cover, each simplex has one lift and transfer is id; its composite is 1·id.
- For the two-sheet cover of a point over ℤ, 1 maps to (1,1) and then to 2.
  Over 𝔽₂ it still maps to (1,1)≠(0,0), even though projection gives 0=2·1;
  the sum-of-lifts law excludes a zero transfer in this characteristic.
- For ∅→B with degree 0, the sum of lifts is empty and the transfer is zero;
  for B=∅ the entire complex is zero regardless of a vacuous degree witness.


### 5.4 Torus homology

*Needs:* §5.1 and native circle homology; product maps.

The homology of a finite product of circles as the exterior powers of its first homology,
   by the Pontryagin product over every commutative ring and natural under morphisms of
   commutative monoid objects, is Tau Ceti's (supplier contracts; Hatcher, §3.C, Exercise 11,
   p.292, for the integral Pontryagin ring, and Example 3.16, p.216, for the cohomology ring
   over every commutative ring). Add the integer-matrix form: an n×n integer matrix
   A=(a_ij) defines the continuous homomorphism
   `φ_A(z₁,…,z_n)=(∏_j z_j^(a_1j),…,∏_j z_j^(a_nj))` of Tⁿ=(S¹)ⁿ; prove that φ_A induces A on
   H₁(Tⁿ;ℤ)≅ℤⁿ in the basis of the coordinate circles, so that it induces `⋀ᵏA` on
   H_k(Tⁿ;R)≅⋀ᵏRⁿ for every commutative ring R, through the native naturality. This is a
   theorem about the product maps, not a separately declared answer for a torus.

**Checks.**

- A=diag(2,1) on T²: φ_A(z₁,z₂)=(z₁²,z₂) induces multiplication by det A=2 on
  H₂(T²;ℤ)=ℤ; the permanent of A is also 2, so this does not separate the two, which the
  next check does.
- A the swap of the two coordinates of T²: `⋀²A=det A=−1` on H₂, the degree of the
  orientation-reversing swap, while a model by the permanent of A gives +1.
- A=0: φ_A is constant, inducing 0 on H_k for k≥1 and the identity `⋀⁰A=1` on H₀.
### 5.5 Serre applications

*Needs:* Tau Ceti `TauCeti.TopCat.serreFibrations`, `TauCeti.TopCat.mem_serreFibrations_pullbackFst`, `TauCeti.TopCat.mem_serreFibrations_of_exists_trivialization`, `TauCeti.TopCat.mem_serreFibrations_proj` and `TauCeti.TopCat.exists_lift_openBox_of_mem_serreFibrations`, Tau Ceti's Hurewicz and mapping-path fibrations and its filtered-space spectral sequence (supplier contracts); §§4.5, 4.10 and 5.0; §6.0–6.2 only for the cohomological and multiplicative versions.

Use Tau Ceti's Serre-fibration predicate `TauCeti.TopCat.serreFibrations`, its
   base change `TauCeti.TopCat.mem_serreFibrations_pullbackFst` and its bundle
   instances `TauCeti.TopCat.mem_serreFibrations_of_exists_trivialization` and
   `TauCeti.TopCat.mem_serreFibrations_proj`, with no paracompactness hypothesis.

   **Homotopy lifting and the fibration sequence.**
   Own the fibration homotopy long exact sequence, including components. Use
   `TauCeti.TopCat.mem_serreFibrations_iff` and `TauCeti.TopCat.mem_serreFibrations_iff_cube`
   for disc/cube lifting, pullbacks and maps of fibrations. Own the comparison between
   native disc/cube Serre testing and homotopy lifting for every Hausdorff CW
   parameter in the displayed universe: prove the finite disc-cylinder pair
   homeomorphism from bottom to bottom∪boundary-cylinder, use it for
   prescribed boundary and bottom lifts, and extend cellwise over a native
   relative CW pair of arbitrary dimension and cell set, gluing through
   attaching quotient diagrams and the product weak-topology lemma for the
   compact interval; empty pairs and 0-cells are included. This relative-CW
   lifting, not disc testing alone, fixes basepoint tracks for the finite
   sphere/cube representatives and their homotopies. Construct the sequence
   and its boundary directly by relative lifting and endpoint restriction,
   prove representative/lift independence by a further relative cube lift,
   and prove naturality for commuting based squares, pinning concatenation
   comparisons to native mul_spec's reversed transAt order. Retain group laws
   and pointed-set exactness at π₁ and components, with no module carrier
   there. These constructions use Layers 1–4's homotopy, disc and CW-pair
   APIs and not Layer 8.1's relative-pair sequence; neither sequence depends
   on the other's construction. Prove separately Hatcher's relative form,
   `relHomotopyGroup_map_bijective_of_mem_serreFibrations`: for a Serre
   fibration p:E→B, a point b∈B and a point e of the fibre F=p⁻¹(b), p induces
   bijections π_(n+1)(E,F,e)→π_(n+1)(B,{b},b) of native relative homotopy sets
   for every n≥0 (Hatcher, Theorem 4.41), by the native relative cube lifting
   `TauCeti.TopCat.exists_lift_openBox_of_mem_serreFibrations`. With the native
   exact sequence of the pair (E,F) it identifies the fibration sequence with
   the pair sequence; neither construction consumes it.
   Own fibre transport for Serre fibrations: lifted homotopies
   compare the fibres over the ends of a base path, giving the component
   action and the fibre π_n local system on the base that Layer 8.9's lifting
   obstructions consume. For a Hurewicz fibration with a lifting function the transport
   `TauCeti.LiftingFunction.transport`, its invariance under path homotopy and its composition
   law, the endpoint-fibre comparison `TauCeti.PathPullback.fiberHomotopyEquiv` and the
   fibre-homology local system `TauCeti.fiberLocalSystem` are Tau Ceti's; the Serre-fibration
   construction lifts only over cubes, by relative cube lifting, and agrees with the native one
   on Hurewicz fibrations. Every-fibre weak contractibility, including
   nonemptiness, gives a weak equivalence by this sequence and component
   lifting; homotopy equivalence additionally uses CW-type witnesses and
   Layer 8.5. A chosen fibre alone gives no conclusion on unrelated base
   components.

   **Path fibrations.**
   Consume the native fixed-interval path-space fibrations (supplier contracts): the
   lifting-function structure
   `TauCeti.LiftingFunction`, the Hurewicz-fibration predicate
   `TauCeti.IsHurewiczFibration` with
   `TauCeti.isHurewiczFibration_iff_nonempty_liftingFunction`, the mapping-path
   fibre of f:X→Y at a point with its source projection a Hurewicz fibration
   for test spaces in every universe
   (`TauCeti.MappingPathFiber.isHurewiczFibration_proj`), its description as
   the base change of the fixed-end path fibration along f
   (`TauCeti.MappingPathFiber.pullbackHomeomorph`) and its homotopy invariance
   `ContinuousMap.Homotopy.mappingPathFiberHomotopyEquiv`. Consume as well that every
   Hurewicz fibration is a Serre fibration, `TauCeti.IsHurewiczFibration.mem_serreFibrations`;
   that the two-endpoint evaluation of the compact-open path space `C(I,X)` to X×X is a
   Hurewicz fibration, being restriction along the closed cofibration {0,1}⊆I of the compact
   interval (`TauCeti.HasHomotopyExtensionProperty.isHurewiczFibration_restrict`) followed by
   the homeomorphism `C({0,1},X)≅X×X`; and that the constant-path inclusion of the source into
   the mapping-path space `TauCeti.MappingPathSpace` of f is a homotopy equivalence by the
   shrinking homotopy γ(t)↦γ(st) (`TauCeti.MappingPathSpace.homotopyEquiv`,
   `TauCeti.MappingPathSpace.shrinkHomotopy`), compatible with the endpoint map
   (`TauCeti.MappingPathSpace.endpoint_comp_incl`); for the map from a point this contracts the
   based path space. Own what the native files leave: the explicit concatenation lifting
   function of the two-endpoint evaluation, the fibre of the based path space over x as native
   `Path x₀ x` and over x₀ the native loop space, and the identification of the mapping path
   space of f with the pullback of the free path fibration along f×id, so that its endpoint
   projection is a Serre fibration by `TauCeti.TopCat.mem_serreFibrations_pullbackFst` with
   the homotopy fibres of f as fibres.
   GeneralizedCohomology G2.10 consumes the native predicate and these lifting
   functions for its convenient-category replacements; no second lifting
   construction is built.

   **Homological Serre spectral sequence.**
   Own the homological Serre spectral sequence for every path-connected CW
   base B, using Layers 1–4 and the actual filtration `E_p=p⁻¹(B^(p))`, with
   `E_(−1)` empty. Take its spectral sequence to be the native filtered-space spectral
   sequence `TauCeti.filteredSpaceSpectralSequence` of the family p↦p⁻¹(B^(p)), on the native
   filtration `TauCeti.singularChainFiltration`, whose first page is, in §5.0's homological
   indexing, `E¹_(p,q)=H_(p+q)(E_p,E_(p−1);R)` (`TauCeti.filteredSpaceSpectralSequenceFirstPageXIso`), whose first
   differential is the connecting map of the triple (`E_(p+1),E_p,E_(p−1)`)
   (`TauCeti.filteredSpaceSpectralSequence_first_page_d_eq`) and whose abutment is `H_*(E;R)`
   (`TauCeti.filteredSpaceAbutmentIso`). The native strong convergence covers finite
   filtrations, that is finite-dimensional B; for arbitrary B prove that singular chains are
   exhausted by this filtration using compact simplex images and the cellular filtration
   comparison, and apply §5.0's degreewise convergence; identify
   `E²_(p,q)=H_p(B;H_q(F;R))` with the actual path-transport monodromy local
   system `H_q(F;R)`, and prove convergence to `H_(p+q)(E;R)`: in each total
   degree the first-quadrant filtration is finite, exhaustive and separated,
   with graded pieces E∞ and their extension data (Hatcher, *Spectral Sequences in Algebraic
   Topology*, Chapter 1, Theorem 1.3, p.8, for trivial monodromy, with the filtration of the
   abutment and the stable terms, and the local-coefficient version, p.17). No finite-type or
   dimension bound is imposed on B or F. Prove naturality under maps of
   fibrations and coefficient maps, and the componentwise version; the sequences apply to
   locally trivial bundles through the bundle instances above.

   **Cohomological and multiplicative Serre spectral sequence.**
   Own the cohomological Serre spectral sequence on the same skeletal
   filtration, using the actual dual filtered cochain complex and its
   relative quotients, including the cellular/singular filtration comparison;
   do not identify cohomology pages by naive duality of homology pages. It
   has `E₂^(p,q)=H^p(B;H^q(F;M))` with path-transport local coefficients and
   converges to H^(p+q)(E;M). Prove first-quadrant strong convergence, with
   finite, exhaustive and separated abutment filtration in each total degree
   and E∞ its actual graded module, completeness of the cochain inverse
   filtration and vanishing of the inverse-limit obstruction, with the same
   absence of finite-type or dimension restriction, and the coefficient and
   fibration naturality and componentwise forms. For a commutative ring R and
   local-system pairing M⊗_R N→P own the multiplicative comparison: consume
   §4.5's CW structure on k(B×B), its product-cell filtration
   (B×B)_m=⋃_(i+j≤m)B^i×B^j and cellular approximation D of Δ_B. Own a
   compatible filtered CW approximation q:E′→E with CW subcomplexes E′_p and
   q_p:E′_p→E_p weak equivalences, including relative pair comparisons and
   filtered local-cochain maps that are quasi-isomorphisms on the relative
   filtration quotients by §4.10. First pull back p×p along k(B×B)→B×B
   and then along D; no map from an arbitrary non-CW E×E into k(B×B) is
   assumed. Lift the diagonal-to-D homotopy only on the CW source E′, cell
   by cell with the fixed faces, construct its product-filtered cup map and
   transport through those filtered comparisons; do not lift on a general
   non-CW total space or assert that the ordinary Alexander–Whitney product
   is filtered on E_p. Own Serre preimage subcomplex excision: preimages of
   CW subcomplexes A,B under a Serre fibration over a CW base form an
   excisive couple for native singular/twisted chains and relative-cochain
   products. Consume §4.5's compatible open neighborhoods of A,B and
   their intersection/union, prove each preimage inclusion over the
   deformation retraction is a weak equivalence by the fibration sequence
   and component path lifting, and apply §4.10's weak-equivalence
   coefficient-chain/Hom comparison and Layer 3 open excision to the
   intersection/union diagram. Construct the actual small-chain
   quasi-isomorphism C(E_A)+C(E_B)→C(E_(A∪B)) and the relative cochain map,
   with chosen inverses/homotopies only up to specified natural homotopy, and
   use it, iterated over the finite product-skeletal union in each m, to
   define the product-filtered cup on a small-chain/relative model; do not
   evaluate the ordinary cross cochain unconditionally on arbitrary simplices
   in that closed union. Consume the native product and base-change stability of
   `TauCeti.TopCat.serreFibrations` (supplier contracts), transport
   categorical products to the concrete E×E carrier through its invariance under
   isomorphisms and TopCat's product isomorphism, and use
   `TauCeti.TopCat.mem_serreFibrations_pullbackFst` for pullbacks. Identify g^*(M⊠N) with
   q^*(M⊗N) by inverse transport along the lifted diagonal-to-g homotopy,
   using Layer 2.6's path-natural local-system comparison, and retain that
   identification in cups. Own comparison prisms raising the base filtration
   by at most one, giving independence/naturality of the pairings from E₂
   onward and preserving the actual abutment cup product. For fixed choices
   construct all E_r pairings; the E₂ pairing is (−1)^(q p′) times the local
   coefficient cup pairing in every bidegree, and in trivial-monodromy tensor
   coordinates (a⊗x)(b⊗y)=(−1)^(q p′)(ab⊗xy), with x in fibre degree q and b
   in base degree p′. State d_r:E_r^(p,q)→E_r^(p+r,q−r+1) and
   d_r(uv)=d_r(u)v+(−1)^(p+q)u d_r(v), and prove multiplicative
   abutment/extension compatibility. For a field k, a simply connected base
   and degreewise finite-dimensional H^q(F;k), own the natural E₂
   graded-algebra identification H^*(B;k)⊗_k H^*(F;k), proving the local
   tensor/cohomology comparison that gives the algebra and not just the
   vector space; for the ring sequence take constant R and its
   multiplication. Additive page calculations do not determine the cup ring.

   **Arbitrary bases.**
   Own the arbitrary-base versions of both sequences: for a Serre fibration
   over an arbitrary path-connected space, pull back along §4.10's CW
   approximation of the base, prove the induced total-space map is a weak
   equivalence by the fibration homotopy sequence including components,
   identify its local-coefficient homology and cohomology maps and the base
   comparison through §4.10, and transport the spectral sequence, its
   E² page, convergence and abutment filtration to the original fibration.
   Prove independence of the CW approximation by comparison refinements and
   naturality from E² onward, and give the disconnected-base version.
   The homological constructions use only Layers 1–4, §4.10 and §5.0; the
   cohomological constructions additionally use Layer 6.0–6.2's independent
   foundational tower/cochain/cup portion and §5.0's cohomological form,
   with no manifold duality or EM representability input.
   GeneralizedCohomology G5 consumes the CW-base and arbitrary-base
   sequences and this multiplicative supplier for rational K(ℤ,n);
   TopologicalKTheory T1.5 consumes the based homotopy sequence; DGFloer
   Layer 1 consumes these sequences for its cubical transports. Apply their
   naturality and componentwise versions.
   Under trivial monodromy, identify the `E²` page with
   `H_p(B;R) tensor_R H_q(F;R)` under the stated Kunneth hypotheses, but
   do not infer collapse or product homology. Recover the product calculation
   for an actual product fibration; more generally, obtain it from a
   Leray–Hirsch hypothesis or separately proved vanishing of differentials
   and resolution of extensions. Derive Euler-characteristic multiplicativity
   when base and fibre have finite CW type.

**Checks.**

- The empty map ∅ → B is a Serre fibration of the native predicate, which builds in
  no surjectivity. Every fibre is empty, so `E²_(p,q)=H_p(B;H_q(∅;R))=0`, converging to
  `H_*(∅;R)=0`; an `E²` page computed from a nonempty model fibre would be wrong here.
- The inclusion {1} → S¹ is not a Serre fibration: the loop `t ↦ exp(2πit)` has no lift.
  An `E²` page built from the fibre over 1 would be `H_p(S¹;ℤ)`, with `E²_(1,0)=ℤ`,
  while the total space has `H₁=0`; the fibration hypothesis is not removable.
- The projection S¹×S² → S² and the Hopf map S³ → S² are locally trivial with fibre
  S¹, hence Serre fibrations. Over ℤ both `E²` pages are ℤ in bidegrees (0,0), (0,1),
  (2,0) and (2,1). The product has H₂=ℤ, so `d²:E²_(2,0)→E²_(0,1)` is 0; S³ has
  H₁=H₂=0, so that `d²` is an isomorphism. Trivial monodromy does not give collapse.
- Relative form: for the covering ℝ→S¹ and n=0 both sides are ℤ, the relative classes
  being paths from an integer to 0; for p the identity of B both sides are the relative
  groups of (B,{b}); and for the map [0,1]→S¹, t↦e^(2πit), which is not a Serre fibration,
  the fibre over 1 is {0,1} and π₁([0,1],{0,1},0) has two elements while π₁(S¹)=ℤ, so the
  fibration hypothesis is needed.
### 5.6 Finite-cover double complex

*Needs:* §2.6; Tau Ceti's ordered Čech double complex.

For constant coefficients in an abelian category the ordered Čech double complex
   `directSum_(i_0<...<i_p) C_q(U_(i_0...i_p);R)` is Tau Ceti's `TauCeti.cechDoubleComplex`,
   with maps along maps of covers (supplier contracts): the Čech differential is
   `Σ_k (−1)^k d_k` with `d_k` restricting to the intersection with the `k`-th index dropped,
   and the total differential is `δ + (−1)^p ∂` on the `(p,q)` term. Add its form with
   coefficients in a local system L on X: the column p is the sum of the twisted chains
   `C_q(U_(i_0…i_p);L|U_(i_0…i_p))`, with the same differentials, natural in maps of covered
   spaces and coefficient morphisms, and equal to the native complex for a constant system.

**Checks.**

- For the one-element cover U₀=X the double complex is the single column C_*(X;R) with zero
  Čech differential; the total complex is C_*(X;R) and its homology is H_*(X;R).
- For X=U₀⊔U₁ with U₀∩U₁=∅ the p=1 column is C_*(∅)=0 and the total complex is
  C_*(U₀)⊕C_*(U₁), whose homology is H_*(U₀)⊕H_*(U₁)=H_*(X) by additivity; a model indexed
  by weakly increasing tuples i₀≤…≤i_p would add the diagonal columns C_*(U₀∩U₀)=C_*(U₀) in
  every p and change the total complex.
- For a cover by three opens with all intersections nonempty and a chain c of U₀∩U₁∩U₂,
  δc=(c|U₁₂, −c|U₀₂, c|U₀₁) and the U₂-component of δδc is c−c=0, whereas an unsigned
  model gives 2c≠0 over ℤ; on the two-open cover, δc has components −c on U₀ and +c on U₁,
  the negative of the pinned Mayer–Vietoris map (i_U,−i_V), with the same kernel. For a
  1-simplex c of U₀∩U₁ in position (1,1), D²c=∂δc−δ∂c=0 because δ commutes with ∂,
  while the total differential δ+∂ without the column sign gives D²c=2δ∂c, nonzero over ℤ
  and zero only in characteristic 2.
### 5.7 Cover-descent spectral sequence

*Needs:* §§3.2, 5.0 and 5.6.

For constant coefficients the quasi-isomorphism of the augmented total complex with
   singular chains (`TauCeti.quasiIso_cechTotalAugmentation`) and the spectral sequence with
   `E^1_(p,q) = directSum H_q(U_(i_0...i_p);R)` and abutment the homology of X are Tau Ceti's
   (supplier contracts). Prove the local-coefficient form for §5.6's twisted double complex:
   the augmented total complex is naturally quasi-isomorphic to `C_*(X;L)`, and its spectral
   sequence, bounded by the cover cardinality, has
   `E^1_(p,q) = directSum H_q(U_(i_0...i_p);L)` and converges naturally.
   The route is §3.2's twisted small-chain equivalence (Hatcher,
   Proposition 2.21, pp.119–120) and §5.0's filtered-complex
   spectral sequence: for each small simplex, the cover indices containing
   its image form a nonempty finite simplex, whose augmented chain complex
   contracts by adjoining one such index. Thus the augmented horizontal rows
   are exact. The other filtration has the displayed vertical homology page;
   finite cover cardinality bounds its columns and makes convergence finite
   in each total degree.

**Checks.**

- For the cover of a point by two copies of itself, the augmented horizontal
  row is 0→R→R²→R→0 with maps c↦(−c,c) and (a,b)↦a+b.
  Its cokernel before augmentation is R, and the augmented row is exact;
  hence total H₀=R, not R². This holds also for the zero ring, where all terms are 0.

Eilenberg--Zilber and Eilenberg--Mac Lane's acyclic-model proof, Hatcher Section 3.B (Theorem
3B.5, p.274, and Theorem 3B.6, p.275), form the product source spine; §§5.6–5.7 give the separate cover-descent derivation.  The
mapping-torus calculation follows the mapping-cone derivation of the Wang sequence; transfer
follows Hatcher Section 3.G, and the bundle filtration follows Serre's skeletal construction.


### Examples

The two-sheet point cover sends a generator to the two lifted generators; projection gives 2, while the zero map gives 0. For the trivial bundle S¹×S¹ the Betti ranks are 1,2,1.

### Dependencies

*Needs:* Layer 2 for product chain maps; Layers 3–4 for filtrations and cellular comparisons; Tau Ceti's Serre-fibration API for bundle lifting.
## Layer 6: cohomology, products, and manifold duality

The homotopy-square maps, topological tower adapters, raw cochain, coefficient and cup
constructions in 6.0–6.2 are foundational: construct them from Layers 2–4, Tau Ceti's tower
algebra and the independent product maps in 5.1 before using any Serre sequence, manifold
duality or EM representability. §5.5's multiplicative cohomological Serre sequence
consumes only that portion, including 6.0's topological adapters to Tau Ceti's Milnor/lim¹
sequences for complete inverse cochain filtrations.

### 6.0 Restriction towers and homotopy-square maps

*Needs:* Tau Ceti `TauCeti.ModuleTower`, `TauCeti.ComplexTower` with its Milnor sequences,
their naturality and cofinal comparisons, and `TauCeti.ModuleTower.homotopyLimitFunctor`
(supplier contracts); Mathlib `CochainComplex.mappingCone`, `Homotopy` and
`HomologicalComplex.extend`. The topological adapters also need Layers 2–3 relative
singular chains and Layer 4 cellular complexes; the homotopy-square maps need nothing
topological. The direct local-system version is constructed in §6.1 from its raw
cochains before its cohomology comparison.

**Homotopy-square maps.** Let R be an associative unital ring and let K and L be towers
of ℤ-graded cochain complexes of R-modules, with transitions φᴷₙ : Kₙ₊₁ → Kₙ and
φᴸₙ : Lₙ₊₁ → Lₙ. A homotopy-commutative tower map (f,h) consists of chain maps
fₙ : Kₙ → Lₙ and specified homotopies hₙ from φᴸₙ ∘ fₙ₊₁ to fₙ ∘ φᴷₙ, so that
φᴸₙ ∘ fₙ₊₁ − fₙ ∘ φᴷₙ = d∘hₙ + hₙ∘d. Write holim K for the shifted mapping cone of the
difference map δ, δ(x)ₙ = xₙ − φᴷₙ(xₙ₊₁), on the product complex ∏ₙ Kₙ, the object of
`TauCeti.ModuleTower.homotopyLimitFunctor` read through the exchange of towers of complexes
with complexes of towers. The product map ∏ₙ fₙ commutes with δ up to the homotopy
x ↦ (hₙ(xₙ₊₁))ₙ, and a square commuting up to a specified homotopy induces a map of
mapping cones. Define holim(f,h) : holim K → holim L to be that map: its component on
the product factor is ∏ₙ fₙ, and its correction term is built from the hₙ, with the sign
forced by Mathlib's mapping-cone differential. Prove:

- With every hₙ = 0, so that the squares commute strictly, holim(f,0) is the map that
  `TauCeti.ModuleTower.homotopyLimitFunctor` assigns to the strict tower map f.
- Identities go to identities, and holim(g,k) ∘ holim(f,h) = holim(g∘f, k⋆f + g⋆h),
  where the composite homotopy at n is kₙ ∘ fₙ₊₁ + gₙ ∘ hₙ.
- A family of second homotopies between two choices of the hₙ, compatible with the
  differentials, induces a homotopy between the two cone maps. No independence from the
  choice of the hₙ is asserted.
- The composite of holim(f,h) with the projection to the product complex is the product
  of the fₙ, so on cohomology holim(f,h) is compatible with the maps of
  `lim Hᵏ(Kₙ) → lim Hᵏ(Lₙ)` induced by the Hᵏ(fₙ), which form a strict map of towers
  because each square commutes on cohomology.
- If every fₙ is a quasi-isomorphism, so is holim(f,h): compare the two fibre sequences
  of δ by the five lemma, using that products of modules are exact.

**Topological adapters.** For a Hausdorff CW pair (X,A), a commutative ring R and an
R-module M, form the restriction towers of ordinary singular and cellular cochains of
(Xⁿ,A∩Xⁿ), using Hom of the corresponding R-chain complexes into M. The bond from n+1 to
n is restriction along the skeletal inclusion. Identify the inverse limits with the
respective cochain complexes of (X,A): singular simplices have compact image in finite
subcomplexes, and cellular cochains are products indexed by cells (Hatcher, Proposition
A.1, p.520, and the cellular cochain description in Theorem 3.5, p.203).

- Prove degreewise surjectivity of restriction by extending coefficients by
  zero on simplices or cells outside the smaller skeleton. This extension is
  a graded splitting, not in general a cochain map. Apply Tau Ceti's Milnor
  sequence for `TauCeti.ComplexTower` with its injection and projection, in every
  integer degree after extension by zero; in degree k its left term is lim¹ H^(k−1).
- Prove naturality for cellular maps of pairs and coefficient homomorphisms, from
  `TauCeti.ComplexTower.homologyToLim_naturality` and
  `TauCeti.ComplexTower.limOneToHomology_naturality`, and compatibility with cofinal
  skeletal subsequences, from `TauCeti.ComplexTower.limComplexSubsequenceIso` and
  `TauCeti.ModuleTower.limOneSubsequenceEquiv`. The chosen cellular/singular comparison
  maps commute with restriction only up to specified homotopies: feed them, with those
  homotopies, to the homotopy-square maps above. Preserve those homotopies in
  compositions; compatible second homotopies give homotopic comparisons.
- For a strict tower of topological pairs and pair maps, form the induced
  relative singular chain tower. When its chain transitions are degreewise
  surjective, apply Tau Ceti's Milnor sequence in the chain shape, with left term
  lim¹ H_(j+1). Levelwise excision quasi-isomorphisms of such towers induce
  isomorphisms on the homology of the limit complexes, by the naturality of the Milnor
  sequences and the five lemma; no identification with chains on an inverse-limit space
  is asserted. When surjectivity is absent, extend the chains to ℤ-graded complexes with
  `HomologicalComplex.extend` and use the homotopy limit, retaining its possible
  homological degree −1 term lim¹ H₀.

**Checks.**

- On a point, the skeletal tower is constant: the limit map sends a cochain a
  to (a,a,…) and gives H⁰=M, with lim¹=0. Tau Ceti's difference map on the
  constant ℤ coefficient tower sends (3,1,0,…) to (2,1,0,…), not its negative.
- On the one-vertex one-edge circle, the cellular degree-one restriction
  tower is 0←M←M←⋯, with identity bonds after the first. Its limit is M;
  the degree-zero tower is constantly M and lim¹ H⁰=0, giving H¹(S¹;M)=M.
- For I with its two vertices, the degree-zero cochain (0,1) on the 0-skeleton
  has coboundary 0 there; after extension to I its value on the positive edge
  under δ is 1−0=1. Extension by zero cannot be asserted to commute with δ.
- For the countable wedge of circles, the cellular degree-one limit is ∏ℕ M,
  not ⊕ℕ M: with M=ℤ, the all-ones cochain is present and has infinite support.
- For the pair (X,X), every relative cochain term and its limit are 0. For
  the auxiliary zero-bond ℤ tower the difference map is id, so lim=lim¹=0
  despite failure of surjectivity of the bonds.
- The multiplication-by-2 ℤ tower cannot be treated as Mittag–Leffler:
  its images are 2ᵏℤ. A preimage of (1,0,1,0,…) under δ would force
  3x₀+1 divisible by every 4ᵏ and hence 3x₀=−1, impossible in ℤ.
- Let every Kₙ = Lₙ be the contractible complex R → R (identity, degrees −1 and 0) with
  identity transitions, let fₙ = n·id and let s be the identity from degree 0 to degree −1,
  so that id = d∘s + s∘d. The squares fail to commute by (n+1)·id − n·id = id, so hₙ = s.
  The uncorrected product map does not commute with δ:
  (δ∘∏f − ∏f∘δ)(x)ₙ = (n xₙ − (n+1) xₙ₊₁) − (n xₙ − n xₙ₊₁) = −xₙ₊₁, which the
  correction term built from s cancels.
- In the same example take g = f and k = h. The composite g∘f = n²·id fails to commute
  by ((n+1)² − n²)·id = (2n+1)·id, and the composite homotopy kₙ∘fₙ₊₁ + gₙ∘hₙ =
  (n+1)s + ns = (2n+1)s matches it; keeping only kₙ∘fₙ₊₁ = (n+1)s would cover a
  failure of (n+1)·id, which is wrong for n ≥ 1.
- Let K be the constant tower ℤ in degree 0 and L the multiplication-by-3 tower of ℤ in
  degree −1, with f = 0. Every family of integers rₙ is a homotopy hₙ = rₙ, since all
  differentials vanish, and the only second homotopy is 0, since L vanishes in degree −2. On
  H⁰, holim K has lim = ℤ and holim L has lim¹ ≅ ℤ₃/ℤ, through (aₙ) ↦ Σ 3ⁿaₙ. With
  h = 0 the class 1 goes to 0; with every rₙ = 1 it goes to the class of ±(1,1,1,…),
  which corresponds to ±Σ 3ⁿ = ∓1/2 mod ℤ, nonzero. The cone map depends on the
  chosen homotopies, not only on the strict maps fₙ.


Items 1–4 consume Layers 2–3 and the product maps of Layer 5 item 1; the cellular
comparisons and RP² checks also consume Layer 4; item 1 uses item 0 for its
infinite-dimensional skeletal-limit passage. Item 5 consumes Layer 4 and
items 1–4. Their manifold statements also
consume DifferentialGeometry Layer 2's tangent-orientation API, DifferentialGeometry Layer 5.1's outward-first boundary orientation,
and geometric topology's boundary/collar conventions. Item 3 constructs its local
homological determinant-sign comparison before DifferentialGeometry Layer 10's smooth mapping-degree theory.

Every manifold theorem in this layer uses a finite-dimensional Mathlib manifold carrier with
Hausdorffness, second countability or the resulting paracompactness, and the chosen boundary model
stated explicitly.  A global fundamental class assumes compactness.  A conclusion identifying top
homology with one copy of the coefficient ring also assumes connectedness.


### 6.1 Direct local-system cochains

*Needs:* §§2.6, 3.3–3.4, 4.3 and 6.0; native Hom complexes and Ext.

Absolute and relative singular cochains with constant coefficients, Hom of singular chains,
   are Tau Ceti's (supplier contracts). Define direct cochains with values in Layer 2's local
   coefficient systems: a degree-k cochain
   assigns to σ a value in L(σ(e₀)); the zeroth face term is transported back
   along [e₁,e₀] and other terms retain e₀. Relative cochains vanish on A.
   This is the first-vertex version of Hatcher §3.H's lift-valued cochains
   (pp.333–334), using its local transport discussion (pp.330–331); the
   module description on a universal cover is in pp.328–329. Derive the
   coboundary by restricting a lift and transporting its value back to the
   first vertex; inverse transport and the functor laws give δ²=0. This
   construction on the native fundamental groupoid applies to arbitrary
   spaces and does not assume that a universal cover or a locally trivial
   bundle realizing the functor exists.
   Identify cochains with coefficients in the dual system L* with Hom of
   twisted chains with L into R; recovering L by double dual requires the
   displayed fibrewise reflexivity, for example finite projectivity.
   Construct cellular cochains with local coefficients as the product over
   k-cells of Hom from the integral cell-orientation module to the coefficient
   fibre, and prove the relative cellular-to-singular cohomology comparison,
   naturally in cellular maps and coefficient morphisms. Use the skeletal
   filtration and cellular relative cohomology. For arbitrary CW dimension,
   identify direct singular cochains with the inverse limit of their
   restrictions to finite-dimensional skeleta: compact simplex images lie
   in finite subcomplexes, and degreewise restrictions are surjective by
   extension by zero on the other simplices. Apply §6.0's restriction-tower adapter to Tau Ceti's Milnor sequence;
   for each n the tower H^(n−1)(X^k;L) is eventually constant by the cellular
   relative long exact sequence, so lim¹ vanishes and the degree-n comparison
   passes to X. The cellular derivation uses the skeletal exact sequence
   (Hatcher, Theorem 3.5, p.203, and §3.H, p.334) with §6.0's inverse-limit
   comparison; it does not infer the local-coefficient result by dualizing
   constant-coefficient duality. Prove the relative version over subcomplex pairs as well;
 no freeness or reflexivity of
   arbitrary coefficient fibres is assumed. For finite free integral fibres
   prove that the Layer 4 chain-homotopy comparison dualizes, identifying
   L*-cochains with Hom of L-chains; use fibrewise reflexivity only to recover
   L. On RP²'s Layer 4.6 sign system ε compute δ⁰=±2 and δ¹=0, so independently
   of duality `H⁰(RP²;ε)=0`, `H¹(RP²;ε)=ℤ/2` and `H²(RP²;ε)=ℤ`.
   Prove functoriality,
   the long exact sequence, homotopy invariance, additivity, the Mayer--Vietoris sequence of a
   binary open cover (dual to Layer 3's), and constant-system comparison.  For
   integral coefficients, and more generally over a PID or hereditary ring, the natural
   short exact sequence
   `0 -> Ext^1_R(H_(n-1)(X;R),M) -> H^n(X;M) -> Hom_R(H_n(X;R),M) -> 0` and its non-natural
   splitting are Tau Ceti's `TopCat.exact_singularExtToCohomology_singularKronecker` and
   `TopCat.singularUniversalCoefficientEquiv` (supplier contracts); prove their relative and
   direct-local-system forms.  Over a general commutative ring, construct the spectral
   sequence `E_2^(p,q) = Ext^p_R(H_q(X;R),M)` converging to `H^(p+q)(X;M)`, and derive collapse
   theorems only from displayed projectivity or injectivity hypotheses.
   For constant coefficients the short exact sequences of absolute and relative cochain
   complexes of a short exact sequence of coefficient modules, the coefficient long exact
   sequences and the Bocksteins `TopCat.singularCohomologyBockstein` and
   `TopPair.singularCohomologyBockstein`, natural in spaces, pairs and coefficient-sequence
   maps, are Tau Ceti's (supplier contracts). Add their direct-local-system forms, using
   degreewise freeness of singular chains, the compatibility of the Bockstein with the pair
   connecting maps, and the cup-product Leibniz signs of the Bockstein when compatible
   coefficient pairings are given. Include `0 -> Z ->[times 2] Z -> F2 -> 0`
   and `0 -> Z -> R -> R/Z -> 0`, with coefficient maps and connecting
   normalization explicit. SmoothBundlesConnections B6.1 consumes this generic
   construction and proves its good-cover/analytic comparison; it does not
   supply a second singular coefficient theory.

**Checks.**

- For the constant system with fibre M the direct cochains are Hom(C_*(X;R),M), and on the
  one-vertex one-edge circle the cellular coboundary is a↦a−a=0, so H⁰=H¹=M; a model that
  transported along the edge even for the constant system would still give 0 here, which is
  why the next check uses a nontrivial monodromy.
- For the rank-one system on that circle whose transport along the edge e (from e₀ to e₁)
  is multiplication by a unit u, the pinned backward transport of the zeroth face gives
  δ⁰(a)(e)=u⁻¹a−a, and the identification with Hom of twisted chains for the dual system,
  whose monodromy is u⁻¹, gives (u⁻¹−1)a, in agreement; a model transporting forward along
  [e₀,e₁] gives ua−a. For R=ℤ and u=−1 (the sign system) both models give −2a, so RP² does
  not separate them; for R=ℤ/5 and u=2 they give 2a (as 2⁻¹=3) versus a.
- For R=ℤ and the constant fibre ℤ/2 on a point the direct cochains are ℤ/2 in degree 0,
  while the dual system has fibre Hom(ℤ/2,ℤ)=0 and its Hom-of-twisted-chains cochains
  vanish; the two constructions agree only under fibrewise reflexivity, as for the fibre ℤ.
### 6.2 Products and category

*Needs:* §5.1 and §6.1; native cup/cap operations; relative excisive triads for multiple-relative products.

The constant-coefficient cup product by Alexander--Whitney, its comparison with the cross
   product, and the cap product, with naturality, associativity, the unit law and graded
   commutativity, are Tau Ceti's (`TopCat.singularCup`, `TopCat.singularCup_gradedComm`,
   `TauCeti.singularCross_diagonal`, `TopCat.singularCap`, `TopCat.singularCap_assoc`,
   `TauCeti.singularCap_unit`; supplier contracts; Hatcher, §3.2, Lemma 3.6, p.206, for the
   coboundary of a cup product and Theorem 3.11, p.210, for graded commutativity). Prove the
   cap boundary formula (Hatcher, the cap product, pp.239–240, with its boundary formula on
   p.240), and define cap products with tensor pairings of local
   coefficient systems with the same laws.
   Construct both same-pair caps
   `H^k(X;L)⊗H_n(X,A;L')→H_(n−k)(X,A;L⊗L')` and
   `H^k(X,A;L)⊗H_n(X,A;L')→H_(n−k)(X;L⊗L')`,
   proving descent to relative chains and compatibility with connecting maps.
   Own local-coefficient cups with every specified R-linear pairing
   L⊗_R L′→L″ for a commutative ring R. Use 6.1's first-vertex cochains:
   for σ and degrees p,q pair the front-face value with the back-face value
   transported from vertex p to vertex 0 by the inverse initial path. Prove
   the actual cochain rule d(a∪b)=da∪b+(−1)^p a∪db for degree-p a,
   coefficient/pairing naturality, cup units,
   associativity and graded commutativity under the corresponding pairing
   hypotheses, including relative forms on the excisive couples below.
   Construct the absolute-relative module action and same-pair relative cup
   product for every pair. For products with different relative subsets and
   target their union, require an excisive couple, an NDR triad, or the stated
   open-complement compact-support hypotheses; prove the small-chain/excision
   comparison before using that multiple-relative cup or cross product.
   Include its graded/local-coefficient signs and compatibility with the
   absolute, pair and coefficient connecting maps. Arbitrary closed-subset
   unions do not receive an unqualified singular relative product.

   #### Categorical covers and Lusternik–Schnirelmann bounds

   `singularCohomology` and `cupProduct` are the native R-valued singular cohomology
   and Alexander–Whitney product specialized to multiplication in the commutative ring R.
   `LSPositiveCupProduct` records an iterated product of strictly positive-degree classes;
   `lsCupLength` is the supremum of lengths with a nonzero product, with supremum ∅=0.
   `lsCupLength_add_one_le_categoryCount` states that on a nonempty space X
   `lsCupLength X R+1≤TauCeti.lsCategoryCount X Set.univ`, over every commutative coefficient
   ring. Categorical covers and their unnormalized count are Tau Ceti's
   `TauCeti.LSCategoricalCover` and `TauCeti.lsCategoryCount` (supplier contracts): a
   categorical open need only contract in X, not in itself, and the count is the infimum in ℕ∞
   of the sizes of categorical covers, ∞ when there is none. Since a bound by the infimum is a
   bound by every cover size, the theorem says equivalently that a cover of X by n open sets,
   each with nullhomotopic inclusion into X, has `lsCupLength X R+1≤n`.

   - Prove that the positive-product predicate uses the actual cup operation and
     sums degrees; transport witnesses through multiplicative pullbacks.
   - Prove restriction of cup length along maps with a left homotopy inverse and its
     coefficient naturality under the stated nonvanishing hypotheses.
   - Prove the lower bound using relative lifts and excisive relative cup products.

   **Checks.**

   - On a point H⁰=R, H¹=0, cup-length=0 and the count is 1; degree-zero units
     are excluded from positive-product witnesses, preventing spurious infinite length.
   - On S¹ with nonzero R, H¹=R has a nonzero one-factor witness, H²=0, so
     cup-length=1 and every categorical cover has at least 2 members. A single categorical
     open equal to S¹ is impossible: the identity of S¹ is not nullhomotopic.
   - On ∅ the empty open family is a categorical cover with 0 members and the count is 0,
     so the bound fails there; this is why X is nonempty. The zero coefficient ring has
     cup-length=0, and the bound reads 1≤n.
   - On the torus T²=S¹×S¹ over ℤ, let a,b∈H¹ be the classes dual to the two circle
     factors. Then `cupProduct` gives a∪b a generator of H²(T²;ℤ)=ℤ and b∪a=−(a∪b), the
     sign (−1)^(1·1) of graded commutativity (Hatcher, Example 3.7, p.207, and Theorem 3.11,
     p.210). A product that swapped its factors without the sign would force 2(a∪b)=0 in the
     torsion-free group ℤ; the cup-length of T² is 2, and the bound gives a count of at least 3.
   - The class 1∈H⁰(X;R) of the constant cochain 1 is a two-sided unit: 1∪a=a and a∪1=a
     after the identifications of degrees 0+q and q+0 with q. A zero pairing fails this on a
     point, where H⁰=R and 1∪1=1≠0 for nonzero R.
   - On RP² over 𝔽₂ the nonzero class w∈H¹ has w∪w the nonzero class of H²(RP²;𝔽₂)
     (Hatcher, p.212: H*(RP²;𝔽₂)=𝔽₂[w]/(w³)), so the cup-length over 𝔽₂ is 2, while over ℤ,
     with H¹(RP²;ℤ)=0 and H²(RP²;ℤ)=ℤ/2, only single factors are nonzero and it is 1. On S¹
     over 𝔽₂ the square of the generator vanishes because
     H²(S¹)=0. This separates `cupProduct` from the zero pairing and shows that squares of
     odd-degree classes need not vanish in characteristic 2.

   On a nonempty space the normalized category is the count of X minus one; the
   theorem says that cup length is at most the normalized category. Empty spaces keep the
   unnormalized count 0, with no chosen point and no +1 formula, and disconnected manifold
   theorems use the unnormalized count rather than assuming that one categorical open can
   meet different clopen components. On a compact locally contractible space the native
   neighbourhood construction gives a finite categorical cover, so the count is finite.

   For a cover by r categorical
   opens, use native singular homotopy invariance and the positive-degree
   cohomology of a point to prove that classes restrict to zero on their
   designated opens. For **every commutative R**, construct the native point
   singular-chain augmentation and the section represented by its unique
   vertex. Identify its alternating-constant chain complex with R in degree 0
   by the native extra-degeneracy contraction, and export that chain-homotopy
   equivalence. Apply the contravariant Hom/linear-Yoneda
   cochain construction to the chain maps and homotopies, obtaining the
   cochain-homotopy equivalence with R in degree 0 and the vanishing of the
   point's singular cohomology in every positive degree. Prove the
   degree 0 augmentation/unit normalization and coefficient naturality. This
   direct calculation uses neither a hereditary-ring universal coefficient theorem nor an Ext collapse
   for general R. Lift classes to relative cohomology and use the **open excisive**
   multiple-relative product and small-chain comparison already owned by 6.2;
   the product lands in H*(X,X;R)=0. Give the cochain/support proof and the
   finite-product induction, not an unqualified product for arbitrary closed
   subsets. Coefficients and cohomology are the existing singular ones; there
   is no second cohomology ring. The bound generalizes Hatcher, §3.2, Exercise 2, p.229,
   from two contractible opens to any number of opens nullhomotopic in X; the relative
   cup product it uses is Hatcher, §3.2, p.209.

   Basic checks: empty and point conventions; finite discrete coproducts;
   the two-open categorical cover and nonzero top class of Sⁿ with R=ℤ
   (or any nontrivial R), n≥1, giving
   normalized category 1; and the cup-product lower bounds on finite products
   of positive-dimensional spheres using Layer 5 item 1 and 6.2. No product
   upper-bound theorem or general Bott/closed-geodesic multiplicity theorem
   is inferred from these checks.

   This supplement uses native homotopy/open-set/extended-cardinality
   foundations, Tau Ceti's categorical covers, Layers 2–3, Layer 5 item 1 and ordinary
   6.1–6.2, plus the direct point-chain contraction. It is independent of the manifold
   duality/linking consequences in 6.3–6.5 and is consumed by MorseTheory M4's
   arbitrary-function critical bound. Morse theory and geodesic minimax are not prerequisites.

   #### Supported cellular comparison

   This is a separate supported-cellular supplement after ordinary 6.2. First
   prove countability of cells for the connected locally finite finite-dimensional
   CW carriers used below; Layer 8.5 consumes that countability result as a
   prerequisite, not as a second construction. On a finite-dimensional locally
   finite Hausdorff CW pair (X,A), construct finite cell-carriers and their local
   finiteness. Use the filtered refinement category of triples (K,B,L), where
   K,L are compact, B is a cofinite CW subcomplex and K⊆X\B⊆L. Prove its
   compact/cofinite-subcomplex projections final and its actual relative cochain
   maps C_K(X,A)→C^*(X,A∪B)→C_L(X,A); their composite is support enlargement.
   No functorial choice B(K) is assumed. This supplement consumes ordinary
   Layer 4 cellular data and ordinary 6.1–6.2, owns the compactly supported
   local-coefficient cochain foundation below, and returns a supported-cellular
   comparison used by the proper Layer 8.5 route. Ordinary 6.3–6.5, Layer 7 and
   ordinary Layer 8 remain independent of this supplement. CharacteristicClasses
   C1.2a consumes the foundation for its support excision and collared-pair
   triangle, and the comparison of that triangle with the supported CW-pair
   triangle below is made there; neither is an input here.

   *Compactly supported cochains with local coefficients.* For a locally
   compact Hausdorff X, a closed A⊆X, a commutative ring R and a module-valued
   local system L on X, with no finite-rank, projectivity, freeness or field
   assumption on the fibres, use 6.1's first-vertex cochains. For compact K⊆X
   let C_K^*(X,A;L)=C^*(X,A∪(X∖K);L) be the subcomplex of cochains vanishing
   on simplices in A∪(X∖K); for K⊆K′ the identity map of pairs
   (X,A∪(X∖K′))→(X,A∪(X∖K)) restricts cochains, giving the support-enlargement
   map C_K^*→C_(K′)^*, with the identity and composition laws, commuting with
   morphisms of local systems. Define C_c^*(X,A;L) as the degreewise filtered
   colimit over compact K ordered by inclusion and H_c^n(X,A;L) as its
   cohomology; since filtered colimits in `ModuleCat R` are exact,
   H_c^n(X,A;L)=colim_K H^n(X,A∪(X∖K);L). Prove that a cofinal family of
   compact sets gives the same colimit, that a countable exhaustion may be
   used exactly when it is proved cofinal, and that these comparisons commute
   with local-system morphisms and with the constant-system specialization
   L=R, which recovers the constant-coefficient object naturally; there is no
   second cohomology theory. For a proper map of closed pairs f:(X,A)→(Y,B)
   and a coefficient morphism α:f^*L_Y→L_X, the preimage of a compact K is
   compact, and 6.1's cochain pullback followed by α induces
   C_K^*(Y,B;L_Y)→C_(f⁻¹K)^*(X,A;L_X) and the pullback
   f^*:H_c^*(Y,B;L_Y)→H_c^*(X,A;L_X), with identity, composition and
   coefficient-change laws. For an open V⊆X, with the restricted system,
   construct the extension H_c^*(V;L|_V)→H_c^*(X;L) by local-coefficient
   excision on compact supports inside V, binding its chain representatives to
   the chosen excision comparison and proving independence and composition.
   Construct the supported cup and mixed-support products for a pairing
   L⊗L′→L″ from 6.2's local-coefficient cups. Prove jointly proper homotopy
   invariance: for H:I×X→Y with H(I×A)⊆B and H itself proper, pull L_Y back
   to I×X, identify the two endpoint pullback systems by transport along
   t↦H(t,x), naturally in x by 6.1's homotopy transport, and show that the
   cochain prism with these transports is a homotopy between the two pullbacks
   after that identification; for compact K⊆Y the compact projection
   P_K=pr_X(H⁻¹(K)) enlarges the source support, and the prism of a simplex
   outside P_K lies outside K, so the homotopy passes to the colimit. A
   further coefficient morphism must be compatible over the whole pulled-back
   system; properness of the separate slices alone is not enough; a homotopy
   fixed on A gives the relative statement with identity transport.

   **Checks.**

   - Constant L=R recovers the constant-coefficient object; for compact X every K may be
     taken to be X and H_c^*=H^*.
   - H_c^1(ℝ;ℤ)=ℤ while H^1(ℝ;ℤ)=0, and the open extension from (0,1) to ℝ is an
     isomorphism in degree one.
   - The proper maps x↦x+1, x↦x³ and x↦x² of ℝ act on H_c^1(ℝ;ℤ)=ℤ by 1, 1 and 0, the
     last because x² folds both ends of ℝ to +∞.
   - The homotopy H(t,x)=(1−t)x+tx² of ℝ is proper on every slice (the identity at t=0, a
     quadratic with positive leading coefficient for t∈(0,1]) but not jointly proper, since
     H⁻¹(0) contains the unbounded family (t,−(1−t)/t) for t∈(0,1]; its ends act on
     H_c^1(ℝ;ℤ)=ℤ by 1 and by 0, so slicewise properness cannot replace joint properness.

   Construct Cᶜᵉˡˡ,ⁿ_c(X,A;ℤ) as the direct sum on the actual relative n-cells' orientation-dual modules. The ordinary cochain group is a product. Prove the incidence transpose preserves finite support by local finiteness of coface carriers. Relative ordinary cellular/singular cohomology for (X,A∪B), finite excluded cells and filtered exactness give the natural all-degree comparison H^n(C_c^cell(X,A))≅H_c^n(X,A). Every finite cell support occurs after a finite coface-star refinement. Include the differential, restriction, connecting and coefficient comparisons.

   For proper cellular maps prove row-finiteness of the ordinary chain matrix and the resulting finite-support pullback. Given a target cofinite B, choose compact L containing its complement and a source cofinite refinement avoiding f⁻¹L, so it maps into B; do not assume f⁻¹B is a subcomplex. Prove comparison naturality through common refinements. Degreewise extension by zero gives the supported CW-pair short exact cochain sequence and exact triangle. This primary cellular specialization consumes ordinary 6.1–6.2 and the supported cochain foundation above, without classifier, duality or Layer 8.5 input. CharacteristicClasses C1.2a compares this triangle with its collared-pair support-excision triangle; that comparison is not an input to the primary pair LES.

### 6.3 Homological orientation and fundamental classes

*Needs:* §§2.5–2.6, 3.3–3.4, 4.4 and 6.1; DifferentialGeometry Layers 2 and 5.1; native local manifold charts and collars; Tau Ceti's local homology system with its compact-set and top-homology lemmas, local orientations, `TauCeti.HomologicalOrientation` and integral fundamental class.

For boundaryless manifolds the local homology system with its transport along paths, for
   coefficients in any abelian category and so for modules over every ring, Hatcher's
   Lemma 3.27 (p.236) for compact subsets and the top homology of a compact manifold as the
   transport-invariant families of local classes, both with constant module coefficients over
   every ring, and integrally the local orientations and their chart generators,
   `TauCeti.HomologicalOrientation M E m`, and the integral fundamental class
   `TauCeti.HomologicalOrientation.fundamentalClass` of a compact oriented manifold are Tau
   Ceti's (supplier contracts). The native system with values in `ModuleCat S` is already a
   `TauCeti.LocalCoefficientSystem` and is used directly as a Layer 2.6 coefficient system.
   The constructions below consume these and add twisted (non-constant) coefficient
   systems, boundary and corners, and the compact-support class factory.
   On a boundaryless m-manifold U the integral orientation local system
   `or_U(x)=H_m(U,U\{x};ℤ)` is the native `TauCeti.localHomologySystem` in degree m with
   integral coefficients, with its native transport.
   Own the boundaryless interior construction for every finite-dimensional real model
   with corners I on E, with `finrank ℝ E=m`. Use Mathlib's `I.interior M` and
   `ModelWithCorners.isOpen_interior`. Choose a continuous linear equivalence
   `E ≃L[ℝ] EuclideanSpace ℝ (Fin m)`, reparameterize I, and construct the Euclidean
   boundaryless atlas on a fresh copy of the interior subtype, inheriting M's smoothness.
   Keep M's original charted-space instance. Prove the inclusion into M smooth and its
   underlying homeomorphism onto the interior. Prove that this inclusion of the
   recharted interior carrier is a local diffeomorphism, for every boundary model.
   In the original I-chart at x and the carrier chart reparameterized by
   e:E≃L[ℝ]EuclideanSpace ℝ (Fin m), identify its manifold derivative with e.symm.
   Prove the chartwise inverse is smooth and use this to pull back tangent orientations.
   For boundaryless M construct the diffeomorphism of the recharted carrier onto all of
   M, including its smooth inverse; this is the map used for ordinary class transport.
   Own the induced maps on local homology, orientation systems, sections and compact
   classes, with the canonical coefficient pullback isomorphisms explicit. Transport
   back to the original topological carrier M before exposing the boundaryless class API.
   Prove independence of the linear equivalence, recharted copy, charts and orientation
   lift as equality of the transported integral classes, using their normalized local
   images and compact-support uniqueness. Perform each uniqueness argument on a
   fresh Euclidean carrier and transport the resulting equality through its pair
   isomorphism; do not install that Euclidean atlas or apply the factory directly
   on the original general-model carrier. Include m=0, when the Euclidean model space
   is a singleton and its basis index `Fin 0` is empty. These constructions are this roadmap's;
   DifferentialGeometry Layer 9.3 consumes their classes and proves integration compatibility.
   For positive-dimensional smooth manifolds with boundary over the standard
   half-space model `𝓡∂ (n+1)`, define the ambient orientation system by the
   fundamental-groupoid transport of the interior system specified below (the
   half-space orientation local system). Use its single
   interior-inclusion equivalence, constructed by finite local inward pushes
   relative to compact interior data, for all restrictions and comparisons.
   This construction needs neither compactness of M nor a global collar.
   Ordinary local top homology at a boundary point is not
   its orientation fibre. Construct the natural pairing `or_M⊗or_M≃ℤ`, normalized
   by o⊗o↦1 for each local generator o; simultaneous sign changes preserve it.
   For every boundaryless m-manifold U and R-module system L construct the
   local top-homology functor `T_L:FundamentalGroupoid U→ModuleCat R`, with
   fibre `H_m(U,U\{x};L)` and transport defined by excision on coordinate
   balls; for constant L it is the native `TauCeti.localHomologySystem`, and the
   construction is needed only for twisted L. Prove independence of balls, path-homotopy
   invariance and gluing, agreement with the native system for constant L,
   and construct its natural identification `T_L≃L⊗_ℤ or_U`, using the
   R-action on L. Pin the inverse comparison to the coefficient-extension
   map `ℓ⊗[c]↦[c·ℓ]`: trivialize L on a coordinate ball about x by transport
   from x, multiply an integral relative cycle by ℓ in this trivialization,
   and use excision. Prove independence of the ball and representative,
   compatibility with path transport, bilinearity over ℤ and R-linearity
   in ℓ, and naturality in L. On a coordinate ball under its transport
   trivialization require equality with the coefficient map z↦z·ℓ on chains
   and homology; for constant integral coefficients require `[c·1]=[c]`.
   For each open inclusion B→U prove the excision map carries `[c·ℓ]` on B
   to `[c·ℓ]` on U; this local restriction law pins the construction even for
   globally nontrivial systems. For every ring homomorphism use native exact
   restriction of scalars to compare twisted chains and homology; pin its
   chain map on every simplex/fibre generator to the same simplex and coefficient.
   The integer-to-R restriction comparison gives the same normalization for
   every R. This actual coefficient multiplication fixes the sign of the comparison.
   Define a section on an open V⊆U by pointwise local
   classes s(x), with the following local condition: each x∈V lies in a
   coordinate ball B⊂V and there is a class in `H_m(U,U\B;L)` whose local
   image at every y∈B is s(y). Prove that these sections correspond exactly
   to transport-compatible sections of T_L restricted to V, expressed as
   natural transformations from the constant rank-one R-module functor.
   For L=or_U the canonical section is the preimage of 1 under the composite
   `T_or≃or_U⊗or_U≃ℤ`; it makes no choice of orientation.
   Before duality, extend the compact-support local-homology lemma to twisted
   coefficients. For constant module coefficients over any ring it is Tau Ceti's
   `TauCeti.isZero_localHomology_of_isCompact`,
   `TauCeti.eq_zero_of_forall_localHomologyRestriction_eq_zero` and
   `TauCeti.existsUnique_localHomologyRestriction_eq_of_isCompact` (supplier contracts),
   consumed as stated. Prove the twisted case: for a boundaryless m-manifold U, compact K⊂U
   and a module-valued local system L that need not be constant, `H_i(U,U\K;L)=0` for i>m,
   and the degree-m group injects into its local images at points of K. Prove existence as
   well: every section satisfying this ball-local condition over a neighborhood of K
   comes from exactly one relative class with those local images at K. Prove it by
   trivializing L on coordinate balls, where the native constant-coefficient lemma applies,
   then Layer 3's twisted excision/Mayer–Vietoris and compact finite-cover induction, as in
   Hatcher Lemma 3.27, p.236.
   Compare this homological system with DifferentialGeometry Layer 2's
   tangent orientation via chart local generators and Jacobian signs. Prove the
   converse as an equivalence: smooth orientations correspond bijectively to
   transport-compatible sections of or_U whose value in each fibre is an integral
   generator. Express such sections as natural transformations from the constant
   rank-one integer module functor, with this generator condition. Construct the
   inverse from the local signs in coordinate charts, prove its local constancy
   and compatibility on overlaps, and prove the two inverse identities. Include
   restriction, smooth open-embedding pullback and orientation-negation compatibility;
   in particular smooth orientability agrees with triviality of this integral system. In ℝ^m
   pin the standard local generator to the affine simplex with ordered vertices
   `v₀=−∑_i e_i`, `v_i=e_i` for 1≤i≤m, containing 0 in its interior.
   Its ordered edge determinant is positive; use its relative class modulo
   ℝ^m\{0}, including the positive point class for m=0. Transport this
   normalization through charts in every dimension before the boundary comparison.
   First prove the linear sign law: an invertible real linear map on ℝ^m
   acts on the normalized local generator by the sign of its determinant. For m>0,
   prove in relative homology that the affine symmetry
   swapping two vertices fixes the barycenter 0 and therefore gives a linear
   reflection with determinant −1 and local-generator action −1.
   Prove that every positive-determinant equivalence is joined to the identity by a
   path through invertible linear maps; composing with that fixed
   reflection gives the negative-determinant component. The paths give homotopies
   of punctured pairs and identify every linear action.
   Then build the punctured homotopy from a map to its linearization and deduce
   the sign law for a C¹ map on an open neighborhood
   of x with invertible derivative at x. Use the native inverse-function theorem to
   choose a ball inside an injectivity neighborhood. On that ball use
   `H_s(y)=f(x)+(f(x+s(y−x))−f(x))/s` for s>0 and
   `H_0(y)=f(x)+Df(x)(y−x)`. Prove joint continuity at s=0 from the Fréchet estimate
   and avoidance of f(x) off x for all s∈[0,1], then pass to local homology by
   excision. In m=0 prove the positive point formula directly; the empty determinant
   is +1. These lemmas supply chart overlap signs.
   Own the comparison with `Manifold.Orientation` (DifferentialGeometry Layer 2): select the local point generator
   as the signed image of the actual ordered-simplex identity class under the chart pair map.
   Define the model-orientation sign as the unit ±1 comparing the chosen Euclidean model
   orientation with the standard ordered-coordinate orientation, including m=0.
   The sign is the product of this model-orientation sign and the lift's chart sign
   at the base point x in its own chart; transition-Jacobian signs enter
   when comparing two charts.
   Prove the unsigned chart-overlap determinant law at one fixed local-homology
   fibre on every manifold, including nonorientable ones; derive its oriented signed
   version from the orientation cocycle. Prove quotient-lift
   independence, and transport between different fibres only by the orientation local-system map.
   Prove invariance of the raw signed coefficient under simultaneous model-orientation and
   chart-sign reversal before quotient descent. Prove chart-simplex witness independence,
   then derive the arbitrary-lift chart formula from those two facts and the chosen raw
   representative; equality of already-descended generators is a consequence of this route.
   Build the raw chart coefficient of a lift l at a chart anchor a and a point y of that
   chart's source, as the model-orientation sign times the lift's chart sign at y in the
   chart at a. Prove its constancy on
   connected neighborhoods inside that source from continuity of the discrete sign.
   Own the local-image formula for the chart-simplex support class at every y in the
   simplex interior, using the
   unique simplex preimage of y, and the recentering/excision comparison between
   anchors at the same local fibre. First localize the unsigned pair-map image of the
   ordered identity class: its image is the unsigned ordered chart class at y.
   Multiply the support class by the raw coefficient at the original center and use
   coefficient constancy to identify its local image with the coefficient at y times
   the recentered ordered chart class. These imply the signed local image throughout
   each compact partition support; a formula only at the chart anchor is insufficient.
   Prove the chart-simplex interior image open and derive that the point generator at y
   is the raw chart coefficient times the ordered chart class, for every anchor a, every
   lift representing o and every y in that chart source; then that the signed local image
   of the chart-simplex support class is the point generator on the whole interior.
   Use these results in the locally represented section and in the comparison with DifferentialGeometry's orientations.
   Use DifferentialGeometry's `Orientation.map`/`orientationAt` for arbitrary-chart changes, and first reparameterize
   a general finite-dimensional real model to the Euclidean basis model before using the
   Euclidean interior-atlas constructor. This comparison, owned here, also defines the oriented local
   section and feeds relative twisted class datum and compact-support uniqueness
   factory; it does not introduce a second local-system or class carrier. DifferentialGeometry Layer 9.3 consumes this
   exact chosen datum and owns only the conversion from its smooth carrier to this one and the integration formulas;
   it must not construct a competing tangent-orientation system, point generator, or compact class.
   The chart-generator normalization, transition determinant, quotient-lift independence, section
   local representation, and zero-dimensional signed point normalization are targets of
   §6.3, not facts supplied merely by naming the structures. Prove naturality of the
   homological orientation system and its tangent comparison under smooth open embeddings and
   local diffeomorphisms, using excision and the derivative orientation map. In particular this
   supplies the pullback comparison along S²→RP². Own the pure class laws:
   sign reversal, naturality under these oriented open embeddings, support enlargement
   `(U,U∖K′)→(U,U∖K)` for K⊆K′, and finite disjoint compact-support additivity.
   Prove the latter by choosing disjoint open neighborhoods of the disjoint compact
   supports in the T2 manifold, applying Layer 3.3 excision, and applying Layer 2.4–2.5
   additivity for the resulting disjoint union of pairs. In every degree identify
   this composite isomorphism with the disjoint-support component map, using the explicit
   two restriction pair maps, then apply the local-image characterization. Include
   the finite-family induction and the empty family. Use one coefficient-correct pair map with the canonical
   `pullbackConstantIso` in these laws. DifferentialGeometry owns only the smooth and real-coefficient
   conversions and integration identities. Own the shared dimension-zero orientation
   sign of o at x, a unit of ℤ:
   for every finite-dimensional model I on E with finrank ℝ E=0, compare
   DifferentialGeometry's `orientationAt` of o at x with the orientation of the unique empty ordered
   tangent basis of E. Prove independence of the identification with Euclidean
   0-space. Define the positive point class [x]₊ as the relative homology class of
   the constant singular 0-simplex at x with coefficient 1. Prove chart/lift
   independence and that the dimension-zero ordered chart image at x is [x]₊
   for every chart anchor and simplex witness. Identify the general-model sign with
   its Euclidean presentation through the fresh carrier. In that presentation,
   for any lift l representing o, prove that the dimension-zero raw chart coefficient
   of l at x equals the integer value of the orientation sign of o at x.
   State the signed specialization: the point generator of o at x is the orientation
   sign of o at x times [x]₊; keep the raw-anchor chart formula as its separate lemma.
   DifferentialGeometry Layer 9.3 consumes this single sign definition for its signed point integrals.
   Prove canonical
   identifications `or_U|_V≃or_V` for opens
   V and `or_U|_K≃or_K` for codimension-0 compact submanifolds K with boundary.
   In RP² compare these local generators with Layer 4.6's sign system, using
   DifferentialGeometry §5.1's outward-first boundary orientation and the sphere
   comparisons of §§2.5, 4.6 and 6.3. Transport Layer 6.1's independent sign-system
   cohomology calculation across this identification to obtain
   `H⁰(RP²;or)=0`, `H¹(RP²;or)=ℤ/2` and `H²(RP²;or)=ℤ`.
   For the following smooth-boundary classes take the standard half-space model
   `𝓡∂ m` with m>0, with Hausdorff and second-countable M; a general
   corner boundary is not a manifold. Use the native smooth local product
   charts from TauCeti's Boundary/Collar/Local and their diffeomorphisms in
   Boundary/Collar/Diffeomorph. For compact M its boundary is compact by
   ModelWithCorners.isClosed_boundary. Verify that these product charts give
   TauCeti.IsLocallyCollared for the injective boundary inclusion; their
   collars meet the boundary exactly at parameter zero. Apply the existing
   compact-domain Brown theorem TauCeti.IsLocallyCollared.isCollared to get
   a topological IsCollar c for the whole boundary. Its open embedding
   c:∂M×[0,1)→M has c(x,0)=x and open image U. Use its inverse coordinates,
   smaller-width restrictions and deformation retraction of U onto ∂M.
   These class comparisons use a topological global collar and smooth local
   charts; GeometricTopology Layer 1 owns the stronger global smooth collar and gluing API.
   On the half-space ambient carrier, define `or_M` exactly once as the half-space
   orientation local system, by groupoid transport
   from the fresh Euclidean interior. All boundary restrictions and coefficient
   comparisons are restrictions or pullbacks of this same system. First prove that
   the actual interior inclusion induces an equivalence of fundamental groupoids. Each boundary
   point has a path into the interior in a local product chart. For fullness and
   faithfulness, push compact images of paths and path homotopies into the interior
   by a finite composition of boundary-chart pushes with nonnegative inward depth.
   Prove each push preserves the interior, is homotopic to the identity, and can be
   chosen fixed near prescribed compact data lying in the interior, including
   endpoints and the boundary values of a path homotopy. Use these relative
   homotopies to prove the endpoint-fixed path-class statements. This argument
   applies without compactness of M and uses only finite local chart pushes.
   Pin the restriction
   comparison val*or_M≃or_C and its tangent-generator normalization; do not
   install a second Euclidean ChartedSpace on M to define or_M. For a compact
   K⊂C, construct the native twisted support-pair
   map (C,C∖K;or_C)→(M,M∖val(K);or_M): first change coefficients by this
   inverse of κ:val*or_M≃or_C, then apply TopPair.twistedHomologyMap to the open
   embedding pair map. Prove the induced homology map an isomorphism by
   excision, identify its pointwise local maps and transported section, and
   prove independence of the recharting equivalence. For a compact subset of
   int M use K_C=val⁻¹(K) and identify val(K_C)=K. Do not use the
   boundaryless-target naturality theorem on the boundary ambient M.
   Derive the twisted compact-boundary fundamental class
   `[M,∂M]∈H_m(M,∂M;or_M)` by applying this to the canonical section on
   the interior with K the complement of an open boundary collar, then using
   the collar comparison. Characterize it uniquely by canonical interior
   local images. Construct the identity-ambient pair map
   (M,∂M)→(M,U), with its boundary map given by collar parameter zero, and
   prove that its induced homology map is an isomorphism from the collar
   deformation retraction of U onto ∂M and the pair exact sequences. This is
   a relative-homology comparison, not a homeomorphism of pairs. Construct
   the codimension-one local-system isomorphism
   (or_M)|_(∂M)≃or_(∂M) on the half-space orientation local system, including
   nonorientable M. Its inverse is the local product-chart cross product
   `[−∂r]×o_∂`, with the outward-oriented normal interval first. Native local
   product charts use boundary × inward-normal order, whose r-increasing
   interval class is `[r↑]`. Thus this inverse is
   `(-1)^m (o_∂×[r↑])` in native factor order. In each smooth local
   product chart, compute the class by relative excision and compare the two orders:
   swapping the inward normal past the m−1 boundary directions contributes
   `(-1)^(m-1)`, and reversing it from inward to outward contributes `-1`.
   Thus the total conversion from boundary × inward-normal to outward-normal ×
   boundary is `(-1)^m`. Its inward coordinate r≥0 gives outward vector −∂r;
   prove that the inverse chart derivative sends this to DifferentialGeometry Layer 5.1's
   IsOutwardPointing normal. Use the doubled normal interval only as an ambient
   local-excision model across r=0; it is not a subset of M. Do not use ordinary
   local top homology of M at a boundary point for this class. Check the sign on
   D¹, where `∂[D¹]=[+1]−[−1]`, and on D², where the outward-first boundary is
   the counterclockwise class `∂_*[D²,S¹]=[S¹]`.
   Use the Brown topological collar only for the global pair comparison
   (M,∂M)→(M,U); its parameter-zero identity does not determine the smooth
   normal sign. Prove independence of local chart and chart-box height `ε`, and
   naturality,
   and pin its oriented specialization: restricted interior point generators map
   to DifferentialGeometry Layer 5.1 boundaryOrientation point generators. With exactly this identification
   prove `∂_*[M,∂M]=[∂M]` for m>0. A chosen orientation gives the
   integral relative class through the orientation-induced trivialization `or_M≃ℤ`.
   Pin every interior local image by the following actual map. For a linear
   equivalence e:E≃L[ℝ]EuclideanSpace ℝ (Fin m), let C be
   the recharted interior carrier of M for e and val:C→M its smooth open embedding.
   Pull o back to C by DifferentialGeometry Layer 2.2 using the local-diffeomorphism property of val; take C's
   Euclidean point generator and push it to H_m(M,M∖{x};ℤ) with the open-embedding
   local-homology map of val at the unique carrier point over x. Prove this
   open-excision map an isomorphism, and prove the resulting interior local class
   independent of e. For compact K⊂C, likewise use the support open-embedding homology
   map of val on (C,C∖K)→(M,M∖val(K)); prove it an isomorphism by excision and pin its
   local images and support-enlargement compatibility. These maps apply even
   when M has boundary: they use the inclusion onto the open interior, not
   the diffeomorphism of the recharted carrier onto M. Prove that they agree with the boundaryless
   transport when that hypothesis holds, and use these maps for every
   interior compact-support comparison below. Empty boundary gives the absolute class.
   After constructing these Layer 6.3 classes and the boundary map, compare the
   outward-first sphere and coordinate-ball classes with the normalized classes
   supplied by Layer 2, item 5. Consume the native
   `reducedSingularHomologySphereIso` and
   `reducedSingularHomologyTopCatSphereIso` from
   `TauCeti.AlgebraicTopology.Singular.Sphere`, and the native
   `singularHomologyDiskBoundaryPairIso` and its connecting-map normalization
   from `TauCeti.AlgebraicTopology.Singular.DiskSphere`. Layer 2, item 5 owns
   coordinate disk native comparison coefficient; Layer 4.4 owns the unit `εₙ`
   and the radial/native-sphere bridge. Prove the induced maps on the Layer 6.3
   classes, recording each relative sign. This is a compatibility calculation for
   the orientation classes constructed here; Layer 6.3 does not choose or replace
   the native sphere/disk generators or restate Layer 2, item 5. Include
   S⁰ by verifying both local images of the Layer 6.3 class, and consume the
   S⁰ normalization of Tau Ceti's native generator. Verify ∂[D¹]=[+1]−[−1] for the positively
   oriented interval. For the positively oriented plane disk also verify
   ∂_*[D²,S¹]=[S¹], with S¹ counterclockwise by the outward-first convention.

   For the downstream comparison with Layer 2 item 5, write q=e₀ for the
   positive-chart comparison pole and p=eₙ for the fixed last-coordinate
   comparison pole in the standard oriented coordinates (e₀,…,eₙ). The
   native generator is defined by its actual recursive choices; it
   does not choose p. The cyclic coordinate permutation ρₙ(e₀)=eₙ,
   ρₙ(eᵢ)=eᵢ₋₁ (1≤i≤n) sends q to p and has determinant (-1)ⁿ. At q
   the outward-first local frame is (e₁,…,eₙ); at p the ordered last-pole
   chart frame is (e₀,…,eₙ₋₁), so its local generator cᵖₙ is (-1)ⁿ times
   the outward-first generator λᵖₙ. The coordinate map sends the q-frame to
   the ordered p-frame, while sₙ has coefficient +1 in λᵖₙ and therefore
   (-1)ⁿ in cᵖₙ. Let aₙ∈ℤˣ be the coefficient of the native
   sphere generator ιₙ(g̃ₙ) in cᵖₙ, computed using its actual recursive
   choices and comparison with the fixed p-chart. Write σₙ for the Layer 6
   comparison unit, to distinguish it from Layer 4.4's εₙ. The target is
   sₙ=σₙιₙ(g̃ₙ), with σₙ=(-1)ⁿaₙ; prove `σₙ=εₙ` for n≥1, with εₙ
   the unit from Layer 4.4's radial/native-sphere bridge.

   At n=0, q=p, but the native generator's selected pole need not be q. Let
   p₀ be the point of TopCat.sphere 0 obtained by applying the inverse of
   diskBoundaryHomeomorph 1 to the Classical.arbitrary point used by
   reducedSingularHomologySphereIso_zero on the unit sphere of
   EuclideanSpace ℝ (ULift (Fin 1)); this is the actual choice in the definition of reducedSingularHomologyTopCatSphereIso 0. Compare p₀ directly
   with q, the positive first-coordinate pole of `TopCat.sphere 0`, on this same sphere carrier, without
   a second coordinate transport. Prove the exhaustive dichotomy p₀=q or p₀=−q
   from the one-dimensional unit-vector coordinates, then compute the coefficient
   in each case. The native
   zero-sphere law gives
   ι₀(g̃₀)=[−p₀]−[p₀], with augmentation zero and local
   images +1 at −p₀ and −1 at p₀. Consume §2.5's
   two-case normalization: uniqueness from the positive local image applies
   to the absolute class for n≥1, while at n=0 the reduced reference has
   augmentation-zero ordinary image s₀=[q]−[−q]. For this downstream equality,
   verify both local images (+1 at q and −1 at −q) and augmentation zero in
   ordinary H₀(S⁰;ℤ), using the canonical reduced-to-ordinary inclusion and
   the native pole formula above. A single local image alone does not
   determine an ordinary H₀ class. Thus
   s₀=σ₀ι₀(g̃₀), where σ₀=−1 if p₀=q and σ₀=+1 if p₀=−q; equivalently
   σ₀=−ε₀, with ε₀ the Layer 4.4 unit determined by the same actual pole.
   This comparison consumes the native arbitrary-pole generator and
   laws; it does not replace that API by a new pole-parameterized generator.
   At n=1, ρ₁ is a reflection and cᵖ₁ is clockwise, opposite the
   counterclockwise outward-first circle generator. Thus the D² boundary has
   coefficient +1 in λᵖ₁ and −1 in cᵖ₁, and σ₁=−a₁. The value a₁ is
   computed from Tau Ceti's native generator itself, not from a separately chosen pole p.

   Deduce `H_i(U;L)=0` for i>m by
   compact support of singular cycles and the pair/triple sequence (the route
   of Hatcher, Proposition 3.29, p.239), and prove `H_i(M,∂M;L)=0` for i>m and injectivity
   into interior local images for compact boundary manifolds using collars.
   For connected noncompact U prove also the top degree, `H_m(U;R)=0` for every commutative
   ring R (Hatcher, Proposition 3.29, p.239), consumed by §8.14; this top-degree vanishing
   is what the compact-support lemma alone does not give.

**Checks.**

- On ℝ^m the system is constant with fibre ℤ and the standard local generator is the
  class of the simplex with ordered vertices v₀=−∑e_i, v_i=e_i; its edge matrix is I+J
  with determinant 1+m>0. For m=1 it is the segment [−1,1] with boundary [1]−[−1].
- A reflection acts on the local generator by −1 and the identity by +1; for m=0 the
  empty determinant is +1 and the point class is fixed. A law using the absolute value
  of the determinant would give +1 for the reflection and make every manifold orientable.
- On S¹ the system is trivial; on RP² its monodromy around the generator is −1, agreeing
  with the 4.6 sign system, so H₂(RP²;or)=ℤ while H₂(RP²;ℤ)=0; the pairing or⊗or≃ℤ
  sends o⊗o and (−o)⊗(−o) to 1 and o⊗(−o) to −1.
- For the boundary comparison, on D¹ the interior generator [−1,1] has boundary [+1]−[−1],
  +1 where the outward normal is +∂r and −1 where it is −∂r, and an inward-normal-first
  convention would negate both; on D² the outward-first boundary class is the
  counterclockwise circle. The native boundary × inward-normal order differs from
  outward-normal × boundary by (−1)^m, which is −1 for D¹ and +1 for D², so the two
  disks together pin the reversal sign and the swap sign separately.

### 6.4 Poincaré–Lefschetz duality

`IsFundamentalClass` says that a class μ in H_n(M;R) is a fundamental class: for every point
x its image in the local homology H_n(M,M∖{x};R) generates that R-module (Hatcher, p.236).
`poincareDuality_of_isFundamentalClass` states closed-manifold duality over every commutative
ring R: for a compact Hausdorff topological n-manifold M charted on
`EuclideanSpace ℝ (Fin n)` and a fundamental class μ, cap with μ is bijective
H^p(M;R)→H_q(M;R) whenever p+q=n (Hatcher, Theorem 3.30, p.241). No connectedness is assumed.
With R=ℤ and μ the native `TauCeti.HomologicalOrientation.fundamentalClass` this is the
oriented integral form. `poincareDuality_twoTorsionCoefficients` is the case of a ring with
2=0 and M connected, where no orientation datum is needed: every manifold is R-orientable
for such R (Hatcher, p.235), so a fundamental class exists (Hatcher, Theorem 3.26, p.236) and
the existential selects it. The class comes from Tau Ceti's
`TauCeti.mem_range_localHomologySystemCone_π_app_iff` (supplier contracts): a loop at x acts
on H_n(M,M∖{x};R)≅R through the integral transport, by ±1, and −1=1 when 2=0, so every local
class at x is the restriction of a global class; for a generator at x the global class has
as local image at each y the transport of that generator along a path, again a generator, so
it is a fundamental class. That lemma takes the model space in the universe of M, so for M
outside `Type` the route lifts `EuclideanSpace ℝ (Fin n)` by `ULift`. The twisted, boundary
and compact-triad forms below are prose targets.

*Needs:* §§6.1–6.3; boundary collars and excisive Mayer–Vietoris; native `TopCat.singularCap`.

Prove both Poincare--Lefschetz isomorphisms by cap with that class for
   every coefficient-module local system L:
   `H^k(M;L)≃H_(m−k)(M,∂M;L⊗or_M)` and
   `H^k(M,∂M;L)≃H_(m−k)(M;L⊗or_M)`. Include naturality for oriented/local-
   system isomorphisms; for an R-module system the twist means `L⊗_ℤ or_M`
   with R acting on L. Include
   excision and restriction comparisons on compact codimension-0 pieces K
   embedded in boundaryless U, where K carries an actual Mathlib manifold-
   with-boundary structure and smooth embedding. Use the pair-map zigzag
   `(K,∂K)→(U,U\int K)←(U,U\K)`, with the two isomorphisms proved by
   excision and a two-sided tube around the boundaryless compact ∂K in U from
   GeometricTopology Layer 1. Trivialize its normal line by DifferentialGeometry Layer 5.1's outward-pointing field;
   use half-space charts and compactness of ∂K to shrink the tube to a
   uniform positive radius before proving that its positive/negative sides
   lie outside/inside K. This supplies the exterior collar without
   presupposing a manifold
   structure on U\int K. Prove cap compatibility
   and agreement with `or_U|_K≃or_K`; there is no direct pair map
   `(K,∂K)→(U,U\K)`.
   Also own the compact-triad Poincaré–Lefschetz theorem: for a compact m-manifold K
   with boundary faces ∂₀K,∂₁K covering ∂K, with their actual compatible
   collars and common codimension-two edge (rounded from GeometricTopology's corner model),
   cap with [K,∂K] gives H^k(K,∂₁K;L)≃H_(m−k)(K,∂₀K;L⊗or_K),
   and the swapped-face form, for every module-valued local system L.
   Derive the excisive boundary triad from its face collars: choose open
   neighborhoods deformation retracting onto the faces, with intersection
   deformation retracting onto their common edge and union deformation
   retracting onto ∂K; these supply Layer 6.2's excisive-couple/NDR data. Define the actual
   relative cap map through these comparisons. Prove the general form by
   the five lemma comparing the cohomology sequence of (K,∂K,∂₁K) with
   the homology sequence of (K,∂₀K). Use the existing whole-boundary
   duality on K, the corresponding compact-boundary duality on ∂₀K,
   and excision H^*(∂K,∂₁K;L)≃H^*(∂₀K,∂₀K∩∂₁K;L).
   Normalize the middle square using ∂_*[K,∂K]=[∂K] and the pinned
   degree-k cap identity ∂(z⌢φ)=(−1)^k(∂z⌢φ−z⌢δφ), retaining the
   outward face/edge orientation and local-system transport. This is
   Hatcher Theorem 3.43's five-lemma route (p.254); the local-system extension is
   proved here with these transports. Include restriction to compact face
   pairs, nested rounded cuts,
   coefficient change and boundary connecting diagrams. AffineMorseLefschetz A4.0 consumes
   this single compact triad theorem in its collar exhaustion; it does not
   infer it from only the two absolute/whole-boundary forms.
   Empty boundary gives Poincare duality (Hatcher, Theorem 3.30, p.241). Then derive the
   field-coefficient and integral orientable corollaries, and recover
   `poincareDuality_twoTorsionCoefficients` as the case of a ring with 2=0, where the
   orientation system acts trivially.  State connectedness in the corollary identifying top
   homology with the coefficient ring.

**Checks.**

- S¹ with R=𝔽₂: H⁰=𝔽₂→H₁=𝔽₂ and H¹=𝔽₂→H₀=𝔽₂ are both bijective for μ the generator;
  for μ=0 every cap is zero, so the existential statement is not satisfied by the zero
  class. A point (n=0) has μ=1 and cap H⁰=R→H₀=R equal to a↦a.
- RP² with R=𝔽₂ has Betti numbers 1,1,1 and cap with μ matches H^p with H_(2−p); with
  R=ℤ, H⁰(RP²;ℤ)=ℤ but H₂(RP²;ℤ)=0, and with R=ℤ/4 (where 2≠0) H⁰=ℤ/4 but
  H₂(RP²;ℤ/4)=ker(2:ℤ/4→ℤ/4)≅ℤ/2, so neither dropping nor weakening 2=0 to
  nilpotence is admissible.
- For the Lefschetz form on D² with R any ring, H⁰(D²)=R→H₂(D²,S¹)=R and
  H²(D²,S¹)=R→H₀(D²)=R are isomorphisms while H¹(D²)=0 and H₁(D²,S¹)=0; a statement
  pairing H^k(M) with H_(m−k)(M) rather than H_(m−k)(M,∂M) would fail at k=0, where
  H₂(D²)=0.
- RP² with R=ℤ/4: H₂(RP²;ℤ/4)=ker(2)={0,2}, and the image of 2 in H₂(RP²|x;ℤ/4)=ℤ/4 is 2,
  which does not generate, so RP² has no ℤ/4-fundamental class and the theorem asserts
  nothing; without the hypothesis it would claim H⁰=ℤ/4 ≅ H₂=ℤ/2.
- S¹ with R=ℤ: the class of the identity loop has local image a generator at every point,
  and both caps H⁰→H₁ and H¹→H₀ are isomorphisms ℤ→ℤ; twice that class has local image 2,
  not a generator, and its caps are multiplication by 2.
- Two points (n=0) with R=ℤ: a fundamental class is (u₁,u₂) with both entries units, and cap
  H⁰=ℤ²→H₀=ℤ² is (a,b)↦(u₁a,u₂b), bijective; the class (1,0) fails at the second point.
  For the zero ring every class is fundamental and both sides vanish.

### 6.5 Linking forms and degree

*Needs:* §§4.3 and 6.1–6.4; DifferentialGeometry Layer 10 only for smooth degree comparison.

Derive the homological characterization and duality formulas for the shared manifold degree and
   the intersection pairing.  For a closed connected oriented `n`-manifold of finite CW type,
   for n≥1 and 0≤i<n construct the nonsingular torsion linking pairing
   `Tor H_i(M;Z) times Tor H_(n-i-1)(M;Z) -> AddCircle (1 : ℚ)`.  Prove finiteness of the torsion
   groups, naturality under orientation-preserving diffeomorphisms, and the symmetry law
   `lambda_i(x,y) = (-1)^((i+1)(n-i)) lambda_(n-i-1)(y,x)` with the pinned cap-product sign.
   Derive universal-coefficient consequences through the natural duality maps, and do not define a
   competing degree invariant.
   Specify the pairing by the following Bockstein construction. Write
   a=n−i and b=i+1, and let α∈Tor H^a(M;ℤ), β∈Tor H^b(M;ℤ) be the
   inverse cap-duals of x,y. Choose u∈H^(a−1)(M;ℚ/ℤ) with δu=α for
   0→ℤ→ℚ→ℚ/ℤ→0 and set λ_i(x,y)=⟨u∪β,[M]⟩. Prove independence
   of u: the ambiguity lifts to rational cohomology and cups trivially
   with torsion β. The coefficient sequence and its Bockstein are Tau Ceti's
   `TopCat.singularCohomologyBockstein` (Hatcher, §3.E, p.303); cap duality is §6.4
   (Theorem 3.30, p.241),
   and nonsingularity follows from the universal coefficient sequence
   (Theorem 3.2, p.195), divisibility of ℚ/ℤ, and finite generation.
   Derive the sign using the mixed-coefficient Bockstein identity of Conway–Friedl–Herrmann,
   *Linking forms revisited*, Lemma 2.6, pp.503–504, which holds on every
   space, and the cup symmetry (their equation (2.2), p.499). For lifts
   δu=α, δv=β of degrees a−1,b−1, these give
   ⟨u∪β,[M]⟩=(−1)^a⟨α∪v,[M]⟩ and then the factor
   (−1)^(a(b−1)); the product is (−1)^(ab)=(−1)^((n−i)(i+1)).
   Their Lemma 2.5, p.502, gives the same construction and nonsingularity
   on rational homology spheres. For general closed manifolds, the argument
   above restricts to torsion and quotients the Bockstein lift ambiguity by
   the image of rational cohomology; no rational-homology-sphere hypothesis
   is imported into the general target.

**Checks.**

- On RP³ (n=3, i=1) the torsion subgroup of H₁ is ℤ/2 and the pairing sends the pair of
  generators to 1/2 in ℚ/ℤ; it is nonsingular, which a pairing with value 0 is not. The
  exponent (i+1)(n−i)=4 is even, so linking on a 3-manifold is symmetric.
- Let L(5,q) be S³ modulo (z,w)↦(ζz,ζ^q w), ζ=exp(2πi/5),
  with the quotient orientation from S³. In the generator supplied by
  Conway–Friedl–Herrmann, Proposition 1.2, p.494, self-linking is −q/5:
  −1/5 for L(5,1) and −2/5 for L(5,2). On their oppositely oriented
  manifolds the same generators have +1/5 and +2/5. Thus the positive
  value +1/5 is tied to a specified orientation, not an unmarked lens space.
  Both have H₁=ℤ/5 and H₂=0; the nonzero squares modulo 5 are {1,4},
  and their negatives are again {1,4}, so no change of generator or
  orientation turns the first form into the second. Homology alone does
  not distinguish them.
- On S³, or on any integral homology sphere, the torsion subgroups are zero and the pairing is
  the unique zero pairing on 0×0. At (n,i)=(5,2) the exponent is 9, so λ₂ is skew and every self-linking is
  2-torsion in ℚ/ℤ, as on the Wu manifold SU(3)/SO(3), whose Tor H₂=ℤ/2 has self-linking
  1/2 by nonsingularity; a model with exponent i(n−i−1) would make 3-manifold linking skew,
  which L(5,1)'s self-linking ±1/5 (with 2/5≠0) refutes.

The proof spine is Hatcher Sections 3.1--3.3 for cohomology operations and duality, and Dold,
*Lectures on Algebraic Topology*, Chapters VII--VIII for natural products and local coefficients.
Collars fix the boundary sign; orientation is never reconstructed from a hand-written chart list.

### 6.6 Product-ball intersection

*Needs:* §2.5's coordinate-oriented reference classes and local coordinate generator; native
excision (supplier contracts); §5.1's relative cross products; §6.3's determinant-sign theorem;
§6.5's shared degree normalization.

For p,q ≥ 0 let D_p and D_q be the
   closed unit balls in the coordinate-oriented Euclidean spaces ℝ^p and
   ℝ^q, with S_p={x:‖x‖=1} and S_q={y:‖y‖=1}. In dimension 0 the
   ball is a point and this boundary is empty. Prove
   `productBallImages_intersect`: continuous f:D_p→D_p×D_q and
   g:D_q→D_p×D_q satisfying f(x)=(x,0) on S_p and g(y)=(0,y) on S_q
   have a common image point. No embedding, differentiability or
   transversality is assumed. In particular, this is an intersection in
   the original product of balls, before taking any boundary quotient.
   The statement on the native Euclidean closed-ball carriers is the Layer 6
   headline of `Suggested.lean`; its proof is the relative-homology computation
   below, whose inputs are the relative cross product and the relative Künneth
   isomorphism for CW pairs (Hatcher, Theorem 3B.6 and its relative form, pp.275–276) and
   §2.5's local coordinate generator.

   Supply the more general boundary-degree form on the same carriers.
   Assume f(S_p)⊆S_p×{0} and g(S_q)⊆{0}×S_q. The first projection f₁
   and second projection g₂ are maps of disk-boundary pairs; define their
   integer coefficients d_f,d_g on H_p(D_p,S_p;ℤ) and H_q(D_q,S_q;ℤ)
   using §2.5's coordinate-oriented reference classes and their native
   `diskBoundaryPair` comparison. Prove that d_f·d_g≠0 implies the images
   intersect. The fixed-boundary case has d_f=d_g=1. Boundary-to-axis
   containment alone is insufficient: for p,q ≥ 1 the constant maps
   f=(a,0), g=(0,b), with ‖a‖=‖b‖=1, have disjoint images and both
   coefficients zero. For a dimension-0
   factor use H_0(point,∅;ℤ)=ℤ and coefficient 1; retain all cases with
   one or both dimensions zero. Export compatibility with relative
   homotopies of these pair maps and with oriented linear isometries of
   the balls, including the explicit reference-class signs.

   Give the actual relative-homology calculation. Set
   B=(S_p×D_q)∪(D_p×S_q) and
   F(x,y)=(f₁(x)−g₁(y),f₂(x)−g₂(y)) in ℝ^p×ℝ^q.
   If F vanishes on B, the required intersection is already present.
   Otherwise use the homotopy
   H_t(x,y)=(f₁(x)−(1−t)g₁(y),(1−t)f₂(x)−g₂(y)).
   For t>0 its first component has norm at least t on S_p×D_q,
   and its second has norm at least t on D_p×S_q. At t=0 use the
   stated nonvanishing on B. Thus it is a homotopy of maps from
   (D_p×D_q,B) to (ℝ^p×ℝ^q,(ℝ^p×ℝ^q)∖{0}). Using relative external
   products, excision and the local coordinate generator, prove the
   product-relative/local comparison: [D_p,S_p] cross [D_q,S_q] maps
   to the local generator in coordinate order p then q. Prove that
   identity on the p block and minus identity on the q block acts on
   this generator by (−1)^q, using §6.3's determinant-sign theorem.
   With these comparisons compute the coefficient of F as that of
   H₁=(f₁,−g₂), namely
   (−1)^q·d_f·d_g in the order p coordinates followed by q coordinates.
   This is the coefficient of the induced relative homology map, using
   the shared degree normalization, rather than a second degree API.
   If the images were disjoint, F would factor through the punctured
   target and this relative map would be zero, a contradiction. Compare
   the coefficient with signed intersections when smooth transverse
   representatives are supplied. The continuous theorem requires neither
   that extra hypothesis nor a claim that intersections created by
   collapsing boundaries lift to intersections of the original images.

**Checks.**

- For p=0 the ball D_0 is a point with empty boundary, f is an arbitrary point (0,z), and
  the theorem says that a self-map g₂ of D_q fixing S_q pointwise hits z: otherwise z is
  interior and radial projection from z retracts D_q onto S_q, which Tau Ceti's
  `TauCeti.noRetraction_diskBoundary` excludes. A proof that assumed p,q ≥ 1 misses this case.
- The constant maps f=(a,0), g=(0,b) with ‖a‖=‖b‖=1 above satisfy the containment
  hypotheses with d_f=d_g=0 and disjoint images, so the nonvanishing of d_f·d_g cannot be
  weakened to boundary-to-axis containment.


### Examples

On a point the positive-degree cup groups vanish and cup-length is 0, while category count is 1. On S¹ with nonzero coefficients they are 1 and 2; on ∅ the count is 0.

### Dependencies

*Needs:* Layers 2–3 and Layer 5.1 product maps; Tau Ceti's tower algebra for 6.0; Layer 4 for cellular comparisons; DifferentialGeometry Layers 2 and 5.1 for manifold orientations.
## Layer 7: Euler characteristic and finite decompositions

This layer consumes every one of Layers 2--6.  Layer 1 is not a prerequisite.

### 7.1 Finite CW models

*Needs:* Tau Ceti's `TauCeti.cwEulerChar`, `TauCeti.eulerChar` and their Euler–Poincaré and
invariance theorems (supplier contracts).

The Euler characteristic of a finite CW complex is Tau Ceti's alternating cell count
   `TauCeti.cwEulerChar` (`TauCeti.cwEulerChar_def`), and that of a space of finite CW type is
   `TauCeti.eulerChar`, independent of the chosen Hausdorff finite model
   (`TauCeti.eulerChar_eq_cwEulerChar`), invariant under homotopy equivalence
   (`ContinuousMap.HomotopyEquiv.eulerChar_eq`) and equal to the alternating sum of the
   dimensions of singular homology over every division ring
   (`TauCeti.eulerChar_eq_finsum_finrank_singularHomology`). The original space need not be
   Hausdorff to have such a model. Consume these; no second cellular Euler invariant is
   defined. Extend the Euler–Poincaré equality to the relative alternating sums of finite CW
   pairs and to local systems of finite rank, χ(X;L)=rank(L)·χ(X), by the
   cellular chains of §4.3, whose degree-p module is a sum of c_p copies of the fibre. The
   argument is the algebraic one of Hatcher, Theorem 2.44, p.146 (a finite chain complex and
   its homology have the same alternating sum of ranks), applied to §4.3's relative and
   twisted cellular chains, which are this roadmap's construction.

**Checks.**

- A point has one 0-cell and χ=1; a zero module is not substituted for its homology.
- The one-vertex, one-edge circle gives χ=1−1=0; a subdivided circle gives 2−2=0, the
  model independence of `TauCeti.eulerChar_eq_cwEulerChar`.
- The zero-cell empty structure gives χ=0; S² with one 0-cell and one 2-cell gives 1+1=2.
- On the circle with the Möbius rank-one system the cellular differential d₁ is ±2, so over ℚ
  both twisted homology groups vanish and χ(S¹;L)=0=1·χ(S¹); over 𝔽₂ the system is trivial,
  both groups are 𝔽₂ and the sum is again 0.

### 7.2 Homotopy, product and bundle formulas

*Needs:* §7.1; §5.5 for bundles.

Homotopy invariance (Hatcher, Theorem 2.44, p.146) and the product formula
χ(X×Y)=χ(X)χ(Y) (Hatcher, §2.2, Exercise 20, p.157) are Tau Ceti's
`ContinuousMap.HomotopyEquiv.eulerChar_eq`, `TauCeti.cwEulerChar_prod`, `TauCeti.eulerChar_prod`
and `TauCeti.eulerChar_pi` (supplier contracts).

`finsum_finrank_singularHomology_fiberBundle` states the bundle formula: for a fibre bundle
with base B and fibre F of finite CW type and any field k, the alternating sum of the
dimensions of H_i(E;k) for the total space E is χ(B)χ(F), with no hypothesis on the monodromy
and no finite CW model of E assumed (Klein–Malkiewich–Ramzi, pp.1–2, for fibration sequences
of finite complexes; their Theorem A, p.2, extends it to finitely dominated F and B). Derive it from §5.5's homological Serre sequence over k,
applied to the bundle projection, a Serre fibration by Tau Ceti's
`TauCeti.TopCat.mem_serreFibrations_proj`: on a finite CW model of each base component, the
cellular chain group with coefficients in the local system H_q(F;k) has dimension
c_p(B)·dim H_q(F;k), regardless of monodromy, so the E²-page has alternating sum
χ(B)·χ_k(F), and χ_k(F)=χ(F) by the Euler–Poincaré equality of §7.1. The bounded spectral
sequence preserves this alternating sum to the abutment. When E itself has finite CW type
the left side is `TauCeti.eulerChar E` by §7.1.

**Checks.**

- I and a point give 2−1=1 and 1, respectively; homotopy invariance identifies them.
- S²×S² has cells in degrees 0,2,2,4, giving 1+2+1=4=2·2.
- The circle bundle S³→S² has χ(S³)=1−1=0=2·0, even though its Serre
  differential is nonzero; the argument preserves Euler sums, not product homology.
- For the mapping torus of a reflection of S¹, monodromy acts by −1 on H₁,
  but the total space is the Klein bottle with χ=1−2+1=0=0·0; over 𝔽₂ its Betti numbers
  are 1,2,1 and over ℚ they are 1,1,0, both with alternating sum 0.
- For empty base or empty fibre the total space is empty and both sides are 0.

### 7.3 Cover multiplicativity and additivity

*Needs:* §7.1.

Finite-cover multiplicativity χ(X̃)=dχ(X) (Hatcher, §2.2, Exercise 22, p.157), the
subcomplex formula χ(X)=χ(A)+χ(B)−χ(A∩B) for subcomplexes A, B of a finite CW complex
X=A∪B (Exercise 21, p.157) and the open-cover formula χ(U∪V)+χ(U∩V)=χ(U)+χ(V), which
follows from the Mayer–Vietoris sequence (Hatcher, §2.2, p.149) and Theorem 2.44, p.146,
are Tau Ceti's `TauCeti.cwEulerChar_preimage_of_card_fiber`,
`TauCeti.eulerChar_eq_mul_of_isCoveringMap`, the subcomplex formulas of
`Cellular.EulerCharacteristic.Subcomplex` and `TauCeti.eulerChar_union_add_eulerChar_inter`
(supplier contracts).
Prove cellular-stratification additivity from the relative cellular filtration: for a
finite filtration of a finite CW complex by subcomplexes, χ is the sum of the relative
alternating cell counts of the successive pairs.

**Checks.**

- S¹ filtered by a point and the whole circle: the relative counts are 1 and −1 (one
  relative 1-cell), summing to χ(S¹)=0.
- S² filtered by a point, the equator and the sphere: the relative counts are 1, −1 and 2,
  summing to χ(S²)=2; a formula that dropped the middle pair would give 3.

### 7.4 Standard Euler values

*Needs:* §7.1.

The standard values χ(Sⁿ)=1+(−1)ⁿ, χ(Tⁿ)=0 for n>0 and χ(CPⁿ)=n+1 are Tau Ceti's
   `TauCeti.eulerChar_sphere`, `TauCeti.eulerChar_torus` and
   `TauCeti.eulerChar_complexProjectiveSpace` (supplier contracts); this roadmap restates none.

### Examples

A point has χ=1, S¹ has χ=0, S² has χ=2 and S¹×S¹ has χ=0; the empty complex has χ=0.

### Dependencies

*Needs:* Native finite-CW Euler comparison; Layer 5 for product, cover and bundle multiplicativity; Layer 6 for duality examples.
## Layer 8: relative homotopy, Hurewicz, Whitehead, and ordinary representability

This layer consumes Layers 2--4, the universal-covers roadmap's induced-map and basepoint API,
and the smooth triangulation of GeometricTopology §11.3 for the manifold corollaries.
Items 8–16 additionally consume ordinary Layer 6 cohomology and the item-level suppliers above;
items 1–7 are independent of those later constructions.

### 8.1 Relative homotopy and cellular connectivity

*Needs:* Tau Ceti's based pairs and relative homotopy groups (supplier contracts); §4.8 for kified products.

Based top pairs, basepoint-preserving maps of pairs, relative homotopy groups
   `π_n(X,A,a₀)`, their boundary maps and the long exact sequence of every based topological
   pair, with no closedness, NDR or cofibration requirement (Hatcher, §4.1, pp.343–345), are
   Tau Ceti's `TauCeti.BasedTopPair` and `TauCeti.RelHomotopyGroup` (supplier contracts). So
   are basepoint change, functoriality, the low-degree algebra (a pointed set in degree 1, a
   group in degree 2 that is commutative when π₁(A,a₀) is trivial, with its abelianization as
   the ℤ-module available in degree 2, and a commutative group and ℤ-module from degree 3), and
   relative CW connectivity from cell dimension (Hatcher, Corollary 4.12, p.351, from
   Theorem 4.8, p.349) with its transport along weak equivalences of the subspace and the
   space. The empty-subspace pair admits no based carrier. RiemannianGeometry R3 applies that
   transport to CharacteristicClasses C2.0's bundle-cell relative CW models, compared with
   MorseTheory M5's actual Morse–Bott negative-disk attachments; the sphere Freudenthal
   theorem belongs to the downstream stable-homotopy development.
   Own the Kelley-product comparison of homotopy groups for pointed topological spaces X,Y
   as the composite of the map induced by k(X×Y)→X×Y and existing
   Tau Ceti `HomotopyGroup.prodEquiv` / `prodMulEquiv` from
   `Topology/Homotopy/HomotopyGroup/Product.lean`. Prove the first map is
   a bijection on classes because cubes and their homotopy cylinders are
   compact Hausdorff. Retain q=0 as a pointed-set bijection and q≥1 as a
   group isomorphism, naturality and actual projection/inclusion maps.
   No Hausdorff assumption is needed for this comparison. TopologicalKTheory T7.0 uses
   it on 4.5's Kelley product CW structure; compact generation supplies its
   product-valued map x↦(x,*).

**Checks.**

- (I,{0},0) is a based pair; (I,∅) admits no basepoint and is refused, as is any pair
  whose chosen point lies in X∖A.
- (D²,S¹,p): the long exact sequence with D² contractible gives π₂(D²,S¹,p)≅π₁(S¹,p)=ℤ,
  and π₁(D²,S¹,p) is the one-point set; the based pair (X,{x₀},x₀) recovers the absolute
  groups π_n(X,x₀), and (X,X,x₀) has every relative group trivial.
- For RP² relative to its circle RP¹ (one 2-cell attached by degree 2, so λ=2), the
  relative connectivity statement gives π₁(RP²,RP¹,a)=0, and the inclusion is surjective
  on π₁ (ℤ→ℤ/2) but not injective, exactly the range q=λ−1; for (S²,∗) with λ=2 the
  relative π₁ vanishes and the inclusion is bijective on π₀.
- Kelley comparison for X=Y=S¹: S¹ is locally compact, so k(S¹×S¹)→S¹×S¹ is a homeomorphism
  and the comparison sends the class of the diagonal loop to (1,1) in π₁(S¹)×π₁(S¹)=ℤ²; a
  comparison through one projection would give (1,0). For q=0 and X=S⁰ it is the bijection of
  the four components of k(S⁰×S⁰) with π₀(S⁰)×π₀(S⁰).

### 8.2 Kan and cubical comparison

*Needs:* Native simplicial sets, Kan fillers and realization; Tau Ceti's Kan homotopy
groups, cubical comparison, simplicial-group Kan property and abelian Moore comparison
(supplier contracts); §§4.4–4.7.

Homotopy groups of Kan simplicial sets, `SSet.KanComplex.π` with their group structure and
   induced maps (May, *Simplicial Objects*, §3; for simplicial groups, Moore, Séminaire Cartan
   1954/55, exposé 18, Définition 4, p.18-07), the Kan property `TopCat.kanComplex_toSSet_obj`
   of `TopCat.toSSet.obj X`, and the comparison `TopCat.toSSetPiEquivHomotopyGroup` with
   cubical homotopy groups, natural in based maps, are Tau Ceti's (supplier contracts). The
   comparison reverses products: a Kan product runs its first factor before its second in the
   last cube direction, Mathlib's `HomotopyGroup` product runs its second factor first, so in
   every positive degree the comparison is a group isomorphism onto the opposite group
   (`TopCat.toSSetPiMulEquivHomotopyGroupMulOpposite`), and onto Mathlib's group itself from
   degree two, where that group is commutative. Consume them with this convention and add
   compatibility with boundary maps and basepoint change.
   Pin the Kan/cubical comparison by the
   ordered-simplex orientation: a Kan spherical simplex σ realizes to the
   cubical class whose normalized Hurewicz image is the actual relative
   simplex class σ_*[Δ^n,∂Δ^n] in H_n(X,{x₀}), transported to absolute
   H_n(X) for n≥1 by the pair sequence. An unnormalized even-dimensional
   singular simplex need not itself be an absolute cycle. Construct the orientation comparison
   between I^n/∂I^n and Δ^n/∂Δ^n, with Δ^n oriented by its ordered vertices;
   it sends the Layer 2.5 coordinate cube class to the relative identity
   simplex class with coefficient +1. Prove its Hurewicz compatibility and
   the corresponding Moore/realization comparison, without an independent sign.
   Every simplicial group is a native `SSet.KanComplex` by Tau Ceti's
   `SSet.kanComplex_of_group` and `CategoryTheory.SimplicialObject.kanComplex_comp_forget_grpCat`
   (Moore, exposé 18, Théorème 3, p.18-04; Stacks, Lemma 14.31.6, Tag 08NZ). For simplicial
   abelian groups, and simplicial modules, G, the Moore comparison π_n(G)≃H_n(NG), natural
   in G and including components in degree zero, is Tau Ceti's
   `CategoryTheory.SimplicialObject.piAddEquivNormalizedMooreComplexHomology` and
   `CategoryTheory.SimplicialObject.piZeroEquivNormalizedMooreComplexHomology`.
   Own the nonabelian Moore comparison. For general simplicial groups set N_n=⋂_(i=1)^n ker d_i
   with differential d₀, matching native `normalizedMooreComplex` in the
   abelian case. Prove π_n(G)≃ker(d₀|N_n)/d₀(N_(n+1)) for n≥1,
   with normality of the boundary subgroup and commutativity of the quotient;
   π₀(G) is the possibly nonabelian group G₀/d₀(N₁) (Moore, exposé 18, Théorème 4 and
   Théorème 5, pp.18-06–18-08, which index the faces from the other end, with the kernel of
   the last face and the image of the last face of the next degree; May, *Simplicial
   Objects*, §17). Own
   the realization-unit theorem: Mathlib's actual `sSetTopAdj.unit.app K`
   from a Kan K to `TopCat.toSSet.obj (SSet.toTop.obj K)` induces a bijection
   on components and the normalized based π_n isomorphisms in every positive
   degree. Prove it by compatible finite-simplex restrictions, subdivision,
   Kan filling and relative simplicial approximation (owned here, including subcomplexes
   and homotopies fixed there); fix the sphere orientation
   through Layer 4.4, with item 8.6's cubical representative comparison. Item 8.8c consumes these classical results to compute
   π_n|Γ(A[n])|. GeneralizedCohomology G2.1 consumes this unit theorem in
   its Quillen comparison, rather than reconstructing its underlying weak-equivalence proof.

**Checks.**

- For the constant simplicial group on a discrete group G₀, every face is the identity, so
  N_n=0 for n≥1, π₀=G₀/d₀(N₁)=G₀ and π_n=0 for n≥1; for G₀=S₃ this π₀ is nonabelian, so a
  model that abelianized π₀ would be wrong.
- For the nerve of S₃ the Kan π₁ at the vertex is S₃: the 2-simplex (g,h) has faces d₂=g,
  d₀=h, d₁=hg, so the class of g followed by h is hg, and the comparison with the cubical
  π₁ of the realization sends the 1-simplex g to the loop g. Native
  `CategoryTheory.SingleObj.comp_as_mul` fixes this order. The reversed product gh
  is rejected: for g=(12), h=(23), hg=(132) sends 1 to 3 whereas gh=(123) sends 1 to 2.
- On S¹∨S¹, whose π₁ is free on the classes a and b of the two circles, the Kan product of
  the singular 1-simplices of a and b is sent to Mathlib's product [b]·[a], which runs a
  before b; a comparison treated as a homomorphism onto Mathlib's group would send it to
  [a]·[b], a different element of the free group.
- For the free simplicial abelian group on the simplicial circle Δ¹/∂Δ¹, the normalized
  Moore complex has N₀=ℤ, N₁=ℤ(e−s₀v) (the kernel of d₁ on ℤ{e,s₀v}) with d₀(e−s₀v)=0, and
  N₂=0, so π₀=π₁=ℤ and π_n=0 for n≥2, matching H_*(S¹;ℤ); the unnormalized complex has
  ℤ² in degree 1 and ℤ³ in degree 2 with the same homology, and the identification
  π_n≅H_n(NG) uses the normalized one.
### 8.3 Absolute Hurewicz

*Needs:* §§2.5 and 8.2; Tau Ceti's degree-one Hurewicz isomorphism with its naturality and its comparison with the cubical map (supplier contracts); §4.10 for the connected-map comparison.

The absolute Hurewicz map `HomotopyGroup.hurewicz`, a class p sent to p_* of the
   cube generator, is Tau Ceti's, and so is the absolute Hurewicz theorem
   `HomotopyGroup.bijective_hurewicz` for spaces in `Type` (supplier contracts). Compare that
   map with the sphere normalization: a generalized cubical loop g descends through the
   Layer 4.4 quotient q to a pointed sphere map ḡ, and the native class of g equals
   ḡ_*[S^n] on the outward-first normalized generator; own this comparison and its sign in
   every degree. In degree one it factors through
   abelianization, and for a path-connected pointed X the induced map π₁(X)ᵃᵇ→H₁(X;ℤ) is an
   isomorphism: this is Tau Ceti's `TauCeti.HurewiczOne.hurewiczHomologyAddEquiv`, which
   sends a loop to the class of the singular 1-simplex it traces and is proved on singular
   chains (Hatcher 2A.1), natural in pointed maps by
   `TauCeti.HurewiczOne.homologyMap_hurewiczHomologyAddEquiv` (supplier contracts). Consume
   it. The native cubical map in degree one is the negative of that loop class: by
   `HomotopyGroup.hurewiczHom_hom_one_eq_neg_hurewicz₁` its value at 1 on the class of a loop
   is minus the class of the singular 1-simplex the loop traces. Pin the degree-one sign of
   the comparison with the sphere normalization on the counterclockwise loop t↦e^(2πit) of
   S¹, computing from Layer 4.4's quotient I/∂I→S¹ and the outward-first generator.
   DGFloer Layer 1 item 1 consumes this exact isomorphism through its cubical/simplicial
   chain comparison. For arbitrary spaces consume §4.10's
   direct Eilenberg-subcomplex connected-map comparison; it uses face-compatible compression
   and prisms, not this Hurewicz theorem. Prove the absolute theorem in every universe: an
   `(n-1)`-connected pointed space has reduced integral homology zero below `n` and
   `pi_n(X) ~= H_n(X;Z)` for `n>=2`, by the native map (Hatcher, Theorem 4.37, p.371, for the
   pair of X and its basepoint; Theorem 4.32, p.366, states the vanishing and an abstract
   isomorphism).
   `hurewicz_bijective` states the isomorphism: for X in any universe u and n≥0, if
   π_k(X,x) is trivial for every k<n+2, then the native map π_(n+2)(X,x)→H_(n+2)(X;ℤ), with ℤ
   lifted to u and evaluated at 1, is bijective.

**Checks.**

- On S¹ the loop t↦e^(2πikt) maps to k times the normalized generator [S¹], the constant
  loop (k=0) to 0; a model normalized by the inward generator sends the degree-one loop to
  −[S¹].
- On S¹∨S¹, π₁ is free on a,b and H₁=ℤ²; the Hurewicz map sends a^m b^n to (m,n) and the
  commutator aba⁻¹b⁻¹ to 0, so it factors through abelianization; a map that was not a
  homomorphism to an abelian group could not send the commutator to 0.
- On S² the identity represents the generator of π₂(S²)=ℤ and maps to +[S²] under the
  outward-first normalization of 8.6, while the antipodal map, of degree (−1)³=−1, maps to
  −[S²]; a model normalized by the opposite generator sends the identity to −[S²].
### 8.4 Relative Hurewicz

*Needs:* §8.1 relative homotopy; Tau Ceti's relative homology and pair sequence (supplier contracts); §8.3's normalized Hurewicz map.

Tau Ceti's relative Hurewicz map `TauCeti.RelHomotopyGroup.hurewicz`, its surjectivity
`TauCeti.RelHomotopyGroup.surjective_hurewicz` and its bijectivity when A and X are both
highly connected are the inputs (supplier contracts); this item generalizes the last.
For n≥2 and any based pair (X,A,a₀), assume A is nonempty and simply connected
and the pair is (n−1)-connected: every path component of X meets A and
π_i(X,A,a₀)=0 for 1≤i<n (Hatcher, §4.1, p.346, where the condition in degree 0 is on
path components). Prove H_i(X,A;ℤ)=0 for 0≤i<n and that the
native relative Hurewicz map π_n(X,A,a₀)→H_n(X,A;ℤ) is an isomorphism (Hatcher,
Theorem 4.37, p.371, whose quotient π′_n(X,A,a₀) is π_n(X,A,a₀) itself because π₁(A) is
trivial; Theorem 4.32, p.366, states the vanishing and an abstract isomorphism), in every
universe. The native bijectivity assumes A and X themselves
(n−1)-connected; here only A is simply connected and the pair is (n−1)-connected. No cofibration or closedness assumption is imposed.
`relativeHurewicz_bijective` states the isomorphism with n+2 in place of n: for a based pair
`X : TauCeti.BasedTopPair` in any universe whose subspace is simply connected, with every point
of the space joined by a path to a point of the subspace and `TauCeti.RelHomotopyGroup (Fin k) X`
(which is π_(k+1)(X,A,a₀)) trivial for k<n+1, the native relative map
π_(n+2)(X,A,a₀)→H_(n+2)(X,A;ℤ), with ℤ lifted to the universe and evaluated at 1, is bijective.
Deduce that H_i(A;ℤ)→H_i(X;ℤ) is an isomorphism for 0≤i<n−1 and is
surjective for i=n−1. In degree two, the pair sequence and π₁(A)=0 make
π₂(X)→π₂(X,A) surjective; thus π₂(X,A) is abelian, and its abelianization
map is an isomorphism before identifying it with relative homology.

**Checks.**

- For (ℝ,(0,1),1/2), the inclusion induces isomorphisms on all homotopy and
  homology groups: both spaces contract to 1/2. Every relative group is 0,
  so Hurewicz is 0→0 for all n≥2 although (0,1) is not closed.
- For (Dⁿ,Sⁿ⁻¹), n≥3, the first relative group and relative homology in
  degree n are ℤ and the positive disk class maps to +1; below n both are 0.
- For (S²,{p}), n=2, π₂=H₂=ℤ and Hurewicz sends 1 to 1. Without simple
  connectivity of A the statement fails: (D²,S¹∨S¹), with the wedge embedded
  as two tangent circles in the disk, has π₂ the nonabelian free group F₂
  and H₂=ℤ²; the map is abelianization, not an isomorphism.
- The degree-0 condition is on path components, not components. Let X be the closed
  topologist's sine curve, the closure in ℝ² of the graph of sin(1/x) over (0,1], and A the
  segment {0}×[−1,1] with a₀∈A. X is connected and A is contractible, and every based
  relative sphere has path-connected image through a₀, so it lies in A and
  π_i(X,A,a₀)=π_i(A,A,a₀)=0 for all i≥1. The graph is a second path component of X that
  misses A, so H₀(X,A;ℤ)=ℤ≠0. A model of (n−1)-connectedness that asked only that every
  connected component of X meet A would accept this pair and contradict the vanishing of
  H₀(X,A;ℤ); the path-component condition rejects it.

### 8.5 Whitehead and proper homotopy

Proper homotopy equivalences are Tau Ceti's `ContinuousMap.HasProperHomotopyInverse`: a proper
map with a proper homotopy inverse and both homotopies proper on the whole cylinders
(supplier contracts). `HasProperHomotopyExtensionProperty` quantifies over actual
proper maps and jointly proper boundary homotopies, with equality to the prescribed
initial map. `properStrongDeformationRetract_of_inverse` rectifies a proper homotopy
equivalence given by a subspace inclusion to a proper strong deformation retraction; its
hypotheses spell out the components of `ContinuousMap.HasProperHomotopyInverse` for the
inclusion: properness of the inclusion, a proper map g:X→A and proper homotopies
g∘incl≃id_A on I×A and incl∘g≃id_X on I×X.

- Prove compatibility of proper inverse data with composition and homotopy transport.
- Prove proper extension for the cylinder-boundary pair and strongly locally finite CW pairs.
- Prove the rectification fixes the subspace at every time and preserves joint properness.

**Checks.**

- For A=X, r=id and H(t,x)=x; inverse images of compact K are I×K, compact.
- For X=I and A={0}, r(x)=0 and H(t,x)=(1−t)x fix A, with H(0,x)=x and H(1,x)=0.
- For X=ℝ and A={0}, the constant retraction has preimage ℝ of {0}, which is
  noncompact; an ordinary contraction is not a proper inverse.
- `HasProperHomotopyExtensionProperty ∅` holds: K(t,x)=f(x) is f composed with the
  projection I×X→X, proper because I is compact, so K is proper, and there is no
  condition on A×I.
- `HasProperHomotopyExtensionProperty X` (A=X) holds with K(t,x)=H(t,x), proper because
  I×X and I×A are homeomorphic.
- For X=I and A={0} the predicate holds with K(t,x)=H(t−x,0) for x≤t and K(t,x)=f(x−t)
  for x≥t: both pieces give H(0,0)=f(0) on the diagonal, K(0,x)=f(x) and K(t,0)=H(t,0);
  each piece is the composite of a map from a compact set to a Hausdorff space with f or H,
  so it is proper, and a map proper on each set of a finite closed cover is proper.
- Negative control: for X=I and A={0,1,1/2,1/3,…}, A is closed but the predicate fails.
  Take Y=I×{0}∪A×I⊂I×I, f(x)=(x,0) and H(t,a)=(a,t); both are proper (compact source,
  Hausdorff target) and H(0,a)=f(a). A proper extension K would make (x,t)↦K(t,x) a
  retraction of I×I onto Y, and there is none (Hatcher, Chapter 0, p.14). A predicate
  asking only for closedness of A, or for an ordinary homotopy extension, is excluded by
  the same example.

*Needs:* §§4.5 and 8.3–8.4; Tau Ceti's Whitehead theorem, `TauCeti.CWType`,
`TauCeti.SimplyConnectedAtInfinity` and `ContinuousMap.HasProperHomotopyInverse`; proper version
additionally §6.2's supported-cellular supplement with its compactly supported cochains.

Ordinary Whitehead is Tau Ceti's `ContinuousMap.IsWeakHomotopyEquivalence.homotopyEquiv` for
   spaces of CW type, with forward map the given map
   (`ContinuousMap.IsWeakHomotopyEquivalence.homotopyEquiv_toFun`); its hypothesis is bijectivity
   on path components and on every positive homotopy group at every basepoint (Hatcher, Theorem 4.5,
   p.346). Combine relative Hurewicz with the mapping cylinder to prove homological
   Whitehead for simply connected CW complexes (Hatcher, Corollary 4.33, p.367), and then
   `homologicalWhitehead` for simply connected spaces of CW type (`TauCeti.CWType`): a map
   inducing isomorphisms on integral homology in every degree is the forward map of a
   homotopy equivalence. A Hausdorff CW complex has CW type, so the CW-complex case is the
   instance of this statement. Integral coefficients in the signatures use the universe lift
   of ℤ, not a restriction to small spaces.

   - Transport the homology hypothesis through both model equivalences and apply the CW
     complex theorem to the transported map.
   - Prove that the resulting homotopy equivalence has forward map the given map, not merely
     that some equivalence exists.

   **Checks.**

   - The identity of a point is a homology isomorphism and the conclusion is the identity
     equivalence; the inclusion of a point into S² is not a homology isomorphism in degree 2.
   - For S³ and the Poincaré homology sphere P, the map P→S³ collapsing the complement of a
     ball is a homology isomorphism, but P is not simply connected (π₁ of order 120) and the
     map is not a homotopy equivalence: simple connectivity of the source is needed.
   - On S² the antipodal map has degree −1, induces ±1 on H₂=ℤ and is a homotopy
     equivalence; a map of degree 2 induces multiplication by 2, not an isomorphism, and is
     not one.

   Simple connectivity at infinity is Tau Ceti's `TauCeti.SimplyConnectedAtInfinity`: for every
   compact K⊂X there is a compact L⊃K such that every continuous circle in X∖L is
   nullhomotopic in X∖K (supplier contracts). FourManifolds consumes it from Tau Ceti.
   The set of ends, decreasing components U_i of complements of compact sets, eventually
   disjoint from every compact set, modulo mutual cofinal containment, is Tau Ceti's
   `TauCeti.EndComponents`, on every topological space, with its agreement with the inverse
   limit of component sets along a monotone cofinal sequence of compact sets
   (`TauCeti.endComponentsEquivSections`; supplier contracts). On connected noncompact
   finite-dimensional locally finite CW spaces construct cofinal compact neighborhoods with
   finitely many complementary components at each level, absorbing bounded
   components when needed. *Connected at infinity* means that, beyond some
   larger compact set, every two points join in the complement of a prescribed
   smaller compact set; prove it equivalent to one end on these spaces.
   Own the stable fundamental group at an end, in the image sense of
   Freedman–Quinn, *Topology of 4-Manifolds*, §7.7: choose
   a defining component sequence and a proper reference ray for basepoints
   and whiskering; after cofinal refinement the groups
   im(π₁U_(i+1)→π₁U_i) map isomorphically to one another. Retain that common
   group π₁α, change-of-ray conjugacy and cofinal defining-sequence comparisons.
   Do not require the full bonding maps themselves to be isomorphisms.
   With finitely many ends prove simply connected at infinity equivalent to
   stability with trivial π₁α at every end: cofinal nullhomotopies stay in
   the specified component, and finitely many end neighborhoods plus absorption
   of bounded components give the uniform compact condition. Prove the same
   comparisons for manifolds through a specified locally finite CW
   homeomorphism or finite-component compact-neighborhood exhaustion;
   an ordinary CW-type homotopy equivalence alone is not an end comparison.
   This generic end API precedes FourManifolds' proper product theorem and constructs
   no surgery or smoothing data.
   **Checks.**

   - For ℝ, complements of [−r,r] have two contractible rays: the end set has
     cardinality 2, connectedness at infinity is false, simple connectivity at
     infinity is true, and the two stable end groups are (0,0). Every circle
     stays in one ray and contracts there; requiring a single end would give
     the wrong simple-connectivity predicate.
   - For ℝ², complements of closed radius-r disks, r>0, retract radially to S¹:
     there is one end, connectedness at infinity is true, the stable end group
     is ℤ with identity bonding maps, and simple connectivity at infinity is
     false. With K the closed unit disk, every larger compact L is contained
     inside some circle of radius R>1; that circle lies outside L and has
     winding 1 in ℝ²\K, so cannot bound a disk there. A contraction would
     give winding 0, excluding the confusion between one end and trivial end group.
   - For ℝ³, complements of closed balls retract radially to S²: there is one
     end, connectedness at infinity and simple connectivity at infinity are
     both true, and the stable end group is 0. Given compact K, take a ball
     L containing K; every loop outside L contracts outside L since π₁(S²)=0,
     hence also outside K. Thus the one-end values agree with ℝ² while the
     simple-connectivity and group values differ.

   Also own the proper Whitehead theorem for finite-dimensional,
   locally finite CW complexes X,Y that are simply connected and simply
   connected at infinity: a proper continuous map f:X→Y has a proper inverse
   and two joint proper homotopies exactly when its integral ordinary homology
   maps and compact-support cohomology pullbacks are isomorphisms in every
   degree. Use native `IsProperMap`; on these locally compact Hausdorff spaces
   it is equivalent to compact-preimage properness. A proper homotopy means
   the map I×X→Y is proper, not merely that each time slice is proper.
   Consume the supported-cellular supplement's compactly supported
   local-coefficient cochains, their enlargement and cofinality comparisons,
   proper pullback and jointly proper homotopy invariance. The primary
   two-acyclicity proof uses the supported cellular pair LES and the absolute
   comparisons; no collared-pair support excision is a prerequisite of the
   proper Whitehead theorem. These inputs are independent of bundle/classifier
   developments and manifold duality. Own the proper cellular approximation
   and proper homotopy-extension theorem on strongly locally finite CW pairs,
   including the product pair (I×X, (∂I×X)∪(I×A)) and its relative
   cylinder comparisons. Export `properStrongDeformationRetract_of_inverse` at the
   generality of its statement: for a subspace A of a locally compact Hausdorff space X
   with `HasProperHomotopyExtensionProperty A` and proper inclusion, a proper inverse
   of its inclusion, with joint proper inverse homotopies as in
   `ContinuousMap.HasProperHomotopyInverse`, yields a proper retraction r:X→A and a joint
   proper homotopy id_X≃inclusion∘r stationary on A. A subcomplex A of a strongly locally
   finite CW complex X is the instance: proper homotopy extension for the pair
   (Farrell–Taylor–Wagoner, Theorem 1.6) is `HasProperHomotopyExtensionProperty A`. Rectify the inverse on
   A by proper extension, then use proper extension on the displayed product
   pair to make the inverse homotopy stationary; retain both extension maps
   and their proper controls. Prove the proper cylinder-boundary extension
   corollary from proper extension for (X,A), using a proper retraction to
   (0×X)∪(I×A) and compact-square reparametrization. Thus the final strong deformation
   retraction theorem does not take the product-pair property as a hypothesis;
   properness of the inclusion supplies closedness of A. This is the proper
   analogue of the native
   ordinary strong-deformation-retraction theorem, not an implication from
   ordinary homotopy equivalence.
   After proper cellular approximation, construct the actual locally finite finite-dimensional mapping cylinder M_f and its closed collared bottom X. Prove its projection to Y and slide homotopy proper on the whole cylinder. Ordinary homology isomorphisms give H_*(M_f,X;ℤ)=0; compact-support pullback isomorphisms give H_c^*(M_f,X;ℤ)=0 through the supported pair sequence. Identify relative cellular chains with the algebraic cone, with d(y,x)=(d_Yy+f_*x,−d_Xx), and its finite-support dual with the corresponding shifted cochain cone; retain the relative comparison and all signs. Do not collapse the noncompact X to a topological cone point and assume that quotient locally compact.

   Apply §6.2's countability of cells and prove, over ℤ, Farrell–Taylor–Wagoner
   Theorem 4.2's locally finite contraction for the ordinary direct-sum based
   cellular chain complex C and its finite-support dual C∨, both acyclic. These
   are neither Borel–Moore chains nor the full product dual. For the algebraic
   lemma, first use finite dimension and exactness to split the bounded acyclic
   free complexes C and C∨. A contraction t on C∨ induces a continuous
   contraction on its full dual completion Ĉ=(C∨)*, the product on the original
   basis. Given a coordinate-tail neighborhood U at infinity in C_(n+1), use
   continuity of t* to choose a tail V in C_n. For a cycle x∈V, z=t*(x) is a
   completed filling in U. Ordinary acyclicity gives a finite filling y′ of x;
   completed-dual acyclicity fills z−y′ by w in Ĉ. Since the differential on C
   is row-finite, truncate w to a finite-support w1 so d(w−w1) lies in U, and
   set y=y′+d(w1). Then dy=x and y=z−d(w−w1) lies in U. This is the controlled
   filling Lemma 4.3. Inductively set r_n(e)=e−s_(n−1)d(e); the previous
   contraction identity makes it a cycle. Row finiteness of d and s_(n−1)
   sends basis elements outside a sufficiently large finite set into any
   prescribed cycle tail. Choose controlled finite fillings along a cofinal
   exhaustion of the countable basis, so each output coordinate occurs in
   only finitely many fillings. Their linear extension gives row- and
   column-finite s_n with ds_n+s_(n−1)d=id. Then separately own the geometric proper
   Hurewicz/Whitehead realization at infinity yielding Corollary 4.9's
   actual proper inverse and two jointly proper homotopies under the stated
   hypotheses of simple connectivity and simple connectivity at infinity. No finite-domination-to-finite-CW
   or one-end assumption is added.
   Follow Farrell–Taylor–Wagoner, *The Whitehead theorem in the proper
   category*, Compositio 27 (1973), §§1–4, especially Theorem 4.2 and
   Corollary 4.9 ([primary paper](https://www.numdam.org/item/CM_1973__27_1_1_0.pdf)).
   This proper extension uses the supported cochain foundation; ordinary
   Whitehead above retains its arbitrary CW-type scope without that input.
### 8.6 Sphere normalization

*Needs:* §§2.5, 4.4 and 8.3.

Consume Layer 4.4's single pointed orientation-normalized cube quotient
   homeomorphism and its generator comparison, for n≥1, and prove
   compatibility with cubical representatives. Its quotient q collapses precisely
   ∂I^n to the positive first-coordinate pole and sends Layer 2.5's ordered
   cube class to the normalized sphere class after absolute-to-relative comparison.
   Use Layer 2.5's independently pinned positive-hemisphere-chart sphere
   class and disk normalization, together with Layer 4.4's degree +1 equation
   and its explicit n=0 versus n≥1 radial boundary/native-sphere comparison.
   Layer 6.3 identifies the canonical outward-first fundamental class with
   this earlier reference.
   Pin the sphere basepoint
   to the positive first-coordinate pole and export the boundary-generator comparison
   (Hatcher, Section 4.1, p.340: maps (Iⁿ,∂Iⁿ)→(X,x₀) and the quotient Iⁿ/∂Iⁿ=Sⁿ).
### 8.7 Smooth-manifold CW type

`compactManifoldFiniteCWType` states that a compact Hausdorff second-countable smooth
manifold with the Euclidean model has finite CW type, Tau Ceti's `TauCeti.FiniteCWType`: a
homotopy equivalence to a finite CW complex in a Hausdorff space of the same universe; and
`compactManifoldWithBoundaryFiniteCWType` states the same for the half-space model.
`nonempty_homotopyEquiv_sphere_of_homologySphere` states the recognition corollary: a simply
connected space of CW type (`TauCeti.CWType`) whose integral homology vanishes outside degrees
`0` and `n` and is `ℤ` in degree `n ≥ 2` is homotopy equivalent to the unit sphere of
`ℝ^(n+1)`.

*Needs:* GeometricTopology §11.3's smooth triangulation, Tau Ceti's `TauCeti.FiniteCWType` and the
finite CW type of compact triangulable spaces `TauCeti.IsTriangulable.finiteCWType`
(`Topology/Triangulable/FiniteCWType.lean`), and §4.5; §§8.3–8.5 for recognition.

Prove that every finite-dimensional Hausdorff second-countable smooth manifold
   with the Euclidean or half-space model, with or without boundary, has
   countable locally finite CW type by consuming the Cairns–Whitehead smooth triangulation
   of GeometricTopology §11.3 and its realization homeomorphism.
   The CW structure so obtained has dimension m, the dimension of the smooth
   triangulation; export this dimension-m structure as such, since the finite-stage
   projective factorizations that CharacteristicClasses builds on §8.13 consume the
   dimension bound and not only the CW type.
   The compact case has finite CW type (`compactManifoldFiniteCWType`,
   `compactManifoldWithBoundaryFiniteCWType`): the smooth triangulation makes the manifold a
   compact triangulable space, and Tau Ceti's `TauCeti.IsTriangulable.finiteCWType` gives the
   Hausdorff finite CW model.
   Include the boundary-pair forms and
   finitely many prescribed interior marked points outside the relative boundary locus. As a reusable corollary, prove that a simply connected integral homology
   `n`-sphere, `n>=2`, is homotopy equivalent to the standard `S^n`
   (`nonempty_homotopyEquiv_sphere_of_homologySphere`): by 8.3, Hurewicz identifies
   `π_n(X)` with `H_n(X;ℤ)≅ℤ` (X is `(n−1)`-connected by Hatcher, Theorem 4.32, p.366, applied
   inductively, and the map is the Hurewicz isomorphism of Theorem 4.37, p.371, for the pair of
   X and a point), a generator is represented by a
   map `S^n→X` inducing an isomorphism on every integral homology group, and 8.5's
   homological Whitehead theorem on the CW models makes it a homotopy equivalence (Hatcher,
   Corollary 4.33, p.367).

**Checks.**

- For `n=0` a compact 0-manifold is a finite discrete set and its model has that many
  0-cells; the empty manifold has the empty model.
- Compactness cannot be dropped. ℕ with the discrete topology is a noncompact Hausdorff
  second-countable smooth 0-manifold whose H₀(ℕ;ℤ) is free of infinite rank, while a finite
  CW complex has finitely generated homology, so ℕ has no finite CW type; in dimension 2,
  ℝ²∖(ℤ×{0}) is an open subset of ℝ² whose H₁ is free of infinite rank, one generator for
  a small circle about each removed point, so it has none either. A noncompact manifold
  can still have finite CW type: ℝ and the open disk are contractible and have the point as
  a model although neither has a finite triangulation, so compactness is sufficient, not
  necessary.
- For the closed interval with the half-space model the triangulation model has two
  0-cells and one 1-cell, with χ=2−1=1, and the closed disk with the half-space model is
  compact with a finite model of χ=1, homotopy equivalent to the point; a model that
  forgot the boundary and used the interior would be the open disk, which is not compact
  and lies outside both theorems.
- For the recognition corollary, `S^n` itself with the identity model satisfies the
  hypotheses and the conclusion is the identity equivalence. The Poincaré homology sphere
  has the integral homology of `S^3` but fundamental group of order 120, so simple
  connectivity excludes it. For `n=0` the hypotheses read `H_k=0` for `k≠0` and `H_0≅ℤ`,
  the homology of a point (a simply connected space is path-connected, so `H_0≅ℤ` holds
  anyway); a simply connected space of CW type with that homology is contractible by the
  homological Whitehead theorem of 8.5, while `S^0` has two points, so the conclusion fails
  and `n ≥ 2` is a hypothesis. For `n=1` the hypotheses are contradictory (simple
  connectivity forces `H_1=0`).

### 8.8 Nonabelian classifying spaces

`groupClassifyingSpaceBasepoint` is the unique realized nerve vertex in
`groupClassifyingSpace`; `groupClassifyingSpace_isEMOne` states that this based
realization is a K(G,1) for every discrete group G, without assuming commutativity.

*Needs:* §4.7, ordinary §6.1, native nerve and universal covers; Tau Ceti's Milnor model, its uniqueness theorem and its group-(co)homology identifications (supplier contracts) for the model comparison; ClassifyingSpaces Layer 1, items 1.1 and 1.2, for the pointed classification.

**Nonabelian classifying spaces.**
   Own the single generic bar/nerve construction for every discrete group π (Hatcher,
   Example 1B.7, p.89: the Δ-complex `BG` with simplices the tuples of group elements and
   its contractible cover `EG`). Use native `CategoryTheory.nerve`, `SingleObj π`,
   and `SSet.toTop`; construct the contractible free π-space Eπ, its covering
   Eπ→Bπ; consume Layer 4.7's single realization CW structure on both. Prove its native
   `TauCeti.IsEilenbergMacLaneSpaceOne π` property and identify its π₁ with π,
   naturally in group homomorphisms. Pin the bar edge labelled g to g under
   Mathlib's `SingleObj` composition and `FundamentalGroup.mul_def` conventions: both
   compose the later traversal on the left. Prove the oriented-edge identification
   is compatible with the native group operation.
   Separate the raw bar construction (8.8a), which feeds 8.8c's abelian
   K(A,1) specialization, from the normalized comparison with Milnor's model (8.8b).
   The comparison itself is Tau Ceti's: `TauCeti.IsEilenbergMacLaneSpaceOne.nonempty_homotopyEquiv`
   applied to `groupClassifyingSpace_isEMOne`, to
   `TauCeti.isEilenbergMacLaneSpaceOne_classifyingSpace` and to the CW type of both models
   (Layer 4.7's realization CW structure for the nerve, Tau Ceti's for Milnor's model) gives a
   homotopy equivalence `c_G : Bπ ≃ classifyingSpace π`. 8.8b owns only its normalization: by
   `TauCeti.IsAspherical.exists_homotopyEquiv` with the prescribed isomorphism of fundamental
   groups, choose `c_G` and its inverse homotopies so that κ_bar ∘ π₁(c_G)=κ_model after the
   basepoint change along the path that theorem provides, so the induced group map is the
   identity on G, and make the equivalence pointed by that path.
   State the conversion between the left deck action and the native
   Deck≃π₁ᵐᵒᵖ convention explicitly, including the inversion isomorphism
   G→Gᵐᵒᵖ where used. Prove group-homomorphism naturality up to pointed
   homotopy, against `MonoidHom.classifyingSpaceMap`, and the induced naturality on
   cohomology. Keep the existing bar-label inversion below.
   The raw bar supplies the object used by 8.8c's abelian
   specialization.
   Item 8.8c aliases the abelian specialization as K(A,1);
   the generic CW/cover proof of the bar model is supplied only here. For each connected
   pointed Hausdorff CW complex X obtain `[X,Bπ]_*≃Hom(π₁X,π)` from ClassifyingSpaces
   Layer 1, items 1.1 and 1.2, with target Bπ (aspherical by 8.8a), composed with 8.8a's
   identification π₁(Bπ)≃π, and prove that forgetting basepoints
   gives the conjugation-orbit description of `[X,Bπ]` (Hatcher, Proposition 1B.9, p.90);
   Tau Ceti's `TauCeti.fundamentalGroupFunctor_map_bijective_cellularClassifyingSpace` is the
   special case of maps out of its cellular model and is not the statement for every X.
   Treat disconnected X componentwise. Identify `H^n(Bπ;A)`, the cohomology of Bπ with §6.1's
   direct cochains in the local system of `A : Rep ℤ π` (the `LocalCoefficientSystem ℤ Bπ`
   induced by the covering Eπ→Bπ, on which π acts through the deck action), with Mathlib's
   `groupCohomology A n` for every `A : Rep ℤ π`: the direct cochains are the π-equivariant
   A-valued cochains of the contractible free π-space Eπ, and the nerve's cellular chain
   complex of Eπ is the bar resolution, compared with `TauCeti.universalGSpaceResolution` up
   to augmentation-preserving chain homotopy, which gives the chain comparison with native
   `inhomogeneousCochains`. Tau Ceti's identifications are special cases of this one, and
   are proved to agree with it: through the nerve's own covering Eπ→Bπ,
   `IsQuotientCoveringMap.singularCohomologyIsoGroupCohomology`, whose only hypothesis is the
   contractible total space, and, transported along `c_G`,
   `TauCeti.classifyingSpaceSingularCohomologyIsoGroupCohomology` identify `H^n(Bπ;M)` with
   `groupCohomology (Rep.trivial ℤ π M) n`, the trivial representation on M only;
   `TauCeti.classifyingSpaceTwistedCohomologyIsoGroupCohomology`, transported along `c_G` and
   the pullback of `TauCeti.classifyingSpaceLocalSystem`, identifies the Hom-of-twisted-chains
   cohomology `H^n(Bπ;A,N)` with `groupCohomology` of the dual representation Hom(A,N), so it
   yields `groupCohomology A' n` only for `A' = Hom(A,N)`, and it agrees with the direct
   identification exactly under §6.1's fibrewise reflexivity, for N=ℤ when the fibre of A is
   free of finite rank.
   For Layer 6's first-vertex direct cochains the zeroth face uses inverse
   transport: pin the comparison with native inhomogeneous cochains by
   ψ(g₁,…,g_k)=φ(g₁⁻¹,…,g_k⁻¹). Prove differential, coefficient and
   change-of-group naturality with this formula. Own the all-degree discrete
   homogeneous/inhomogeneous comparison, extending the existing low-degree
   `ContCohomology.GroupCohomologyIso` API. Consume the existing all-degree
   finite-discrete existence comparison
   `TauCeti.ContCohomology.nonempty_continuousCohomology_addEquiv_groupCohomology`
   from `ContCohomology.DiscreteGroup`; this item adds the actual natural
   cochain comparison for arbitrary discrete groups. Transport native
   `TauCeti.TopPairing.cup` for discrete group/coefficient topologies to
   the group-cohomology cup product. Prove the standard inhomogeneous formula
   P(ψ(g₁,…,g_p), (g₁⋯g_p)·χ(g_(p+1),…,g_(p+q))) and agreement with
   the Layer 6 singular cup under the displayed label inversion.

**Checks.**

- For the trivial group, the bar has one vertex and only degenerate higher simplices;
  its realization is a point, with π₁=1 and π₂=0.
- For ℤ, the normalized generator edge represents +1 in π₁=ℤ; reversing it gives −1.
- For S₃, π₁ has six elements and is nonabelian: (12)(23)≠(23)(12).
  Replacing the group by its abelianization would give only two elements and fails the target.
- For π=ℤ/2 and A=ℤ/2 with trivial action, `groupCohomology A n` is ℤ/2 in every degree n,
  and so is the direct-cochain `H^n(Bπ;A)`; the dual identification with N=ℤ lands in
  `groupCohomology` of Hom(ℤ/2,ℤ)=0, which vanishes in every degree, so for this A it
  identifies a different group and is not an identification of `H^n(Bπ;A)`. For A=ℤ with
  trivial action Hom(ℤ,ℤ)=ℤ and the two agree, as for every free finite-rank fibre.

### 8.8c Functorial abelian Eilenberg–MacLane models

*Needs:* §§4.7 and 4.10, §§8.1–8.7 and 8.8a; §5.5's based path fibration for the loop
identification; Mathlib's Dold–Kan equivalence; Tau Ceti's presentation complex, killing
tower and cellular classifying space (supplier contracts). No input from §§8.9–8.12.

Own the single functorial abelian
   model in each degree n≥1, with the normalized maps induced by homomorphisms
   A→A′ recorded as a coefficient-natural family. For n=1 set K(A,1)=B(Multiplicative A), an
   alias of 8.8a's `groupClassifyingSpace` of `Multiplicative A`, which
   owns the contractible Eπ, covering, CW structure and fundamental-group
   edge normalization. For n≥2 use the realization of the simplicial abelian
   group Γ(A[n]) from Mathlib's Dold–Kan equivalence, with A[n] the
   nonnegative chain complex concentrated in degree n, and Layer 4.7's single
   realization CW structure. Construct the coefficient-natural identification
   π_n≃A through 8.2's simplicial-group Kan/Moore theorem and actual Kan
   realization-unit comparison, followed by the degree-n homology map of the
   native Dold–Kan counit NΓ(A[n])≅A[n], so the distinguished class of the
   normalized simplex labelled a maps to a; pin the positive sphere
   orientation by 8.6. In degree one compare Γ(A[1]) with the abelian nerve
   as simplicial abelian groups, with the edge labelled a corresponding to a,
   and use the bar carrier throughout. Prove all other positive homotopy
   groups vanish. The construction uses only 8.1–8.8a, not 8.9–8.12's
   obstruction or representability results. For a directed union A=⋃A_i of
   subgroups prove the simplicial inclusions are subcomplexes with union the
   chosen model, so H_*(K(A,n))=colim H_*(K(A_i,n)) by compact supports. No
   statement about arbitrary topological filtered colimits is made: the
   topological colimit of S¹→S¹→⋯ under degree-2 maps is indiscrete and is
   not K(ℤ[1/2],1). Tau Ceti's `TauCeti.IsEilenbergMacLaneSpaceOne` supplies the
   degree-one property interface.
   Own a second, comparison CW construction of K(A,n) from a presentation of
   A: for n≥2 a wedge of positively oriented n-spheres for its generators
   with (n+1)-cells attached along its relations, and for n=1 the
   group-presentation 2-complex `TauCeti.PresentationComplex`, followed by
   the pinned killing tower `TauCeti.killHomotopyGroups` from dimension n+1,
   respectively 2, on (supplier contracts): on a pointed
   Hausdorff space it attaches cells of dimensions ≥n+2, respectively ≥3,
   preserves π_n and the lower groups
   (`TauCeti.bijective_homotopyGroupMap_killHomotopyGroupsIncl`), kills the
   groups from its starting dimension on
   (`TauCeti.subsingleton_homotopyGroup_killHomotopyGroups`), and for a
   Hausdorff CW source without cells above that dimension is a CW complex
   (`TauCeti.killHomotopyGroupsCWComplex`, `TauCeti.cwType_killHomotopyGroups`);
   for n=1 the result is the pinned `TauCeti.cellularClassifyingSpace`. The
   limit's homotopy groups are those pinned theorems, not a target here. Own
   the part of Hatcher's Lemma 4.31 (p.366) skeletal extension that is not pinned:
   realize a supplied homomorphism on π_n by maps of the generator spheres
   and extend over the presentation cells using their null relations, with
   based maps, homotopies and coefficient normalization; the extension over
   the tower's cells into a target whose homotopy groups vanish from
   dimension n+1 on is the pinned
   `TopCat.Hom.exists_killHomotopyGroupsIncl_comp_eq`, and for n=1 its
   fundamental-group form is the pinned
   `TauCeti.exists_mapOfEq_comp_killHomotopyGroupsFundamentalGroupMulEquiv`.
   These use Layer
   4's cell attachments and 8.1–8.7's relative homotopy/Hurewicz/Whitehead
   machinery. Give the coefficient-normalized comparison of the presentation
   model with the chosen bar/Dold–Kan model by skeletal extension and
   Whitehead; the functorial carrier stays that single model.
   Own uniqueness (Hatcher, Proposition 4.30, p.366): for the chosen K(A,n) and any
   path-connected
   Z with π_n Z≅A and all other homotopy groups zero, with π₀ included
   explicitly, a map K(A,n)→Z realizing a given isomorphism on π_n exists,
   constructed on the presentation model and precomposed with a based
   homotopy inverse of the normalized comparison, and is a weak equivalence;
   when Z has CW type it is a homotopy equivalence by 8.5 and §4.10. The
   normalized identification uses 8.2's ordered-simplex/cube orientation
   comparison: a spherical n-simplex labelled a has image under 8.3's
   Hurewicz map the relative class σ_*[Δ^n,∂Δ^n], transported to absolute
   homology by the point-pair sequence, while its normalized Moore class maps
   to a under the Dold–Kan counit, which does not act directly on the
   topological singular class; this fixes the constructor's sign. Item 8.10
   proves the universal-class evaluation e_a↦a; this item
   consumes no such class. By §4.10 every K(A,n) has the homology of the
   chosen model. Identify ΩK(A,n) with K(A,n−1) for n≥2 by applying
   uniqueness to the fibre of §5.5's based path fibration over K(A,n),
   with the coefficient-natural connecting isomorphism on π_(n−1); 8.11b's
   loop comparison is the independent adjunction-side construction. Item
   8.10 consumes this fixed constructor and normalized identification;
   GeneralizedCohomology G2 and DGFloer Layer 1 consume them as well, without
   constructing another abelian model.

**Checks.**

- A=0: every K(0,n) of the family is a point, the bar and Γ(0[n]) having one simplex in
  each degree, all degenerate above degree 0.
- A=ℤ, n=1: the family's model is the bar model of ℤ, a K(ℤ,1) with the edge labelled 1
  representing +1 in π₁; the presentation model of ℤ with one generator and no relation is
  the circle, and the comparison sends the bar edge labelled 1 to the generating loop.
- The homomorphism 2:ℤ→ℤ induces a map K(ℤ,n)→K(ℤ,n) that is multiplication by 2 on π_n;
  a family functorial only up to an unspecified automorphism of A could give −2.
- The directed union ℤ[1/2]=⋃ 2^(−i)ℤ gives H₁(K(ℤ[1/2],1))=colim(ℤ→ℤ→⋯)=ℤ[1/2] along
  multiplication by 2, while the topological colimit of the circles under degree-2 maps is
  indiscrete with H₁=0.

### 8.8d Serre classes and Hurewicz modulo a class

*Needs:* Mathlib `IsSerreClass`, `CategoryTheory.ObjectProperty.isoModSerre`,
`CategoryTheory.ObjectProperty.epiModSerre` and `Tor`; Tau Ceti's torsion Serre classes, the torsion
of the homology of Milnor's classifying space of a finite group, `HomotopyGroup.hurewiczHom`
and `TauCeti.classifyingSpace` (supplier contracts); §4.10's CW approximation; §5.3's
transfer; §5.5's homological Serre spectral sequence and path fibrations; §§8.3, 8.4, 8.8b
and 8.8c.

A Serre class is
   a class of abelian groups closed under subgroups, quotients and extensions:
   Mathlib's `IsSerreClass` (`CategoryTheory/Abelian/SerreClass/Basic.lean`) on
   `AddCommGrpCat`. Serre's axioms for ⊗, Tor and the homology of K(A,1) are a
   separate hypothesis on such a class, the record `SatisfiesSerreAxioms` below,
   stated wherever it is used. Consume the native instances: the torsion groups
   `AddCommGrpCat.isTorsion`, equivalently G⊗ℚ=0, and, for a fixed integer
   d≥1, the groups `AddCommGrpCat.isKilledBySomePower d` annihilated by some
   power of d, with their native closure under ⊗ and Tor; record that
   the groups annihilated by one fixed dᵐ, for d≥2 and m≥1, do not form a
   class, since they are not closed under extensions. For the K(A,1) axiom
   consume the native finite case on Milnor's classifying space,
   `TauCeti.isAddTorsion_classifyingSpace_singularHomology` and
   `TauCeti.isKilledBySomePower_classifyingSpace_singularHomology`,
   where the group order annihilates the
   positive-degree homology through the group-homology transfer and the
   native identification of H_*(BG) with group homology, and transport it to the bar model
   along 8.8b's comparison, which rests on the native uniqueness of K(G,1) spaces of
   CW type, `TauCeti.IsEilenbergMacLaneSpaceOne.nonempty_homotopyEquiv`.
   For the torsion class reduce by 8.8c's directed-union
   property to finite A. That route
   gives no uniform exponent for the class of groups annihilated by a power of d:
   for A=⊕_ℕ ℤ/d the finite subgroups have orders dⁱ with i unbounded. For
   d^mA=0 write A instead as a direct sum of cyclic groups of orders dividing
   d^m (Prüfer's theorem on bounded abelian groups); transfer gives the
   exponent on each cyclic summand, the Künneth formula on finite sums keeps
   it, since tensor products and Tor of groups annihilated by d^m are
   annihilated by d^m, and the directed union over finite sums preserves the
   uniform exponent d^m. A C-isomorphism of abelian groups, a homomorphism whose kernel and
   cokernel lie in C, is Mathlib's `CategoryTheory.ObjectProperty.isoModSerre` on
   `AddCommGrpCat`, and a C-epimorphism, one whose cokernel lies in C, is
   `CategoryTheory.ObjectProperty.epiModSerre`; their closure under composition and the
   two-out-of-three property of C-isomorphisms are Mathlib's (supplier contracts). Own the
   record `SatisfiesSerreAxioms` of Serre's tensor, Tor and K(A,1) axioms on a class, taken
   on Milnor's classifying
   space of the group, and the mod-C
   comparison of fibre, base and total space in §5.5's homological
   Serre sequence over a simply connected CW base. Prove H̃_*(K(A,n);ℤ)∈C
   for A∈C and every n by induction through §5.5's based path fibration
   over 8.8c's model, whose fibre is ΩK(A,n)≃K(A,n−1). Own Hurewicz modulo a
   Serre class for simply connected spaces, `hurewicz_isCIso`: for a Serre class C satisfying
   Serre's axioms, if π_i(X)∈C for
   2≤i<n then H_i(X;ℤ)∈C for 0<i<n and the native Hurewicz homomorphism
   π_n(X)→H_n(X;ℤ) is a C-isomorphism, with the C-epimorphism statement in
   degree n+1; for C=0 this is the absolute Hurewicz theorem, and for n=2 the
   hypothesis on homotopy groups is empty. Serre 1953, Chapter III, Theorem 1, states all three
   clauses; Hatcher, *Spectral Sequences in Algebraic Topology*, Theorem 1.8 (p. 14), proves the
   C-isomorphism clause for the finitely generated, torsion and finite classes, and the
   vanishing clause is a step of its joint proof of Theorems 1.7 and 1.8 (p. 16). Prove it on
   §4.10's CW
   approximation through the tower of
   §5.5 mapping-path fibrations with fibres the loop spaces of 8.8c's
   models, using 8.3 and 8.4 at the first stage. DGFloer Layer 1 consumes
   this theorem and the Serre-sequence inputs for its mod-2 vanishing and
   Whitehead-tower applications, which stay there; GeneralizedCohomology G5
   consumes the torsion instance for its rational stable Hurewicz theorem.

**Checks.**

- For C the class of zero groups, a C-isomorphism is a bijective homomorphism and a
  C-epimorphism a surjective one, so Hurewicz modulo C is the absolute Hurewicz theorem; a
  notion testing only the kernel would accept the non-surjective inclusion ℤ→ℚ.
- For C the torsion groups, multiplication by 2 on ℤ is a C-isomorphism (kernel 0, cokernel
  ℤ/2) but not an isomorphism, and ℤ→0 is a C-epimorphism but not a C-isomorphism (its kernel
  ℤ is not torsion); for C the finitely generated groups the inclusion ℤ→ℚ is not a
  C-epimorphism, its cokernel ℚ/ℤ not being finitely generated.
- Serre's three axioms hold for the zero class, the reduced homology of the classifying
  space of the trivial group being zero, and for the torsion class, where
  `H_(2k−1)(K(ℤ/m,1);ℤ)=ℤ/m` and the positive even-degree groups vanish.
- The `K(A,1)` field ranges over degrees n+1≥1: `H_0(K(A,1);ℤ)=ℤ` is not torsion, so a version
  including degree zero would exclude the torsion class.


### 8.9 Relative obstruction theory

*Needs:* §§4.4–4.5, 6.1 and 8.1; Tau Ceti `TauCeti.TopCat.serreFibrations`, the action `TauCeti.homotopyGroupMulAction` and the transport `TauCeti.homotopyGroupEquivOfPath` (supplier contracts); §5.5 for relative-CW homotopy lifting and fibre transport.

**Relative obstruction cochains.**
    The untwisted bundle case follows Hatcher, *Vector Bundles and K-Theory*,
    §3.3, pp.99–102: Lemma 3.18 (p.100) gives the cocycle and Proposition 3.19
    (p.101) gives the difference-cochain and lower-skeleton extension criterion.
    That source assumes simple fibres and trivial base action on their homotopy
    groups. The n-simple, arbitrary-monodromy Serre-fibration version below is
    the local-system extension constructed here from §5.5's
    homotopy lifting against relative CW pairs, its fibre transport and §6.1's cellular cochains; it is not asserted
    by the untwisted reference.
    For each relative CW complex (X,B), n≥1 and path-connected target Y with
    π₁(Y,y₀) acting trivially on π_n(Y,y₀) by Tau Ceti's `TauCeti.homotopyGroupMulAction`
    (Y is n-simple; for n=1 the action is conjugation, so π₁Y is abelian), and a map on
    X^n∪B, construct its relative cellular (n+1)-cochain with coefficient π_nY
    by its characteristic-map boundary classes. Use the outward-first
    orientation induced by Layer 2.5's coordinate-oriented ball reference
    class, identified with Layer 6's canonical relative fundamental class,
    transported to the cell by Layer 4.4, and its
    degree +1 boundary-sphere homeomorphism. Choose the positive first-coordinate
    boundary point; transport the based class from f(φ_e(v₀)) to the fixed
    y₀ along a specified path γ in Y by Tau Ceti's `TauCeti.homotopyGroupEquivOfPath γ`.
    Prove choice independence using the trivial π₁ action on π_n: transports along two
    paths with the same ends differ by the action of a loop class at y₀, by the composition
    law of `TauCeti.homotopyGroupTransportQuotient`, with the degree-one commutativity
    hypothesis explicit.
    In the simply connected specialization, every obstruction and difference
    construction explicitly assumes that Y is simply connected, including path
    connectedness; this premise belongs to the construction itself. For Y=S²⊔{*}
    based at the isolated point, π₂(Y,*)=0 while a sphere in the other component
    has class 1 in ℤ and cannot be transported to *. The general n-simple and
    local-system targets retain their stated hypotheses.
    These oriented, transported boundary classes define c(f)(e); prove the
    cochain is a cocycle. Prove that this fixed
    map on X^n∪B extends to X^(n+1)∪B exactly when the cochain is zero.
    For maps agreeing on X^(n−1)∪B construct the difference n-cochain by
    gluing their cell disks along their common boundary. Pin its orientation
    so `δd(f₀,f₁)=c(f₁)−c(f₀)`; prove addition, symmetry and naturality.
    Realize every prescribed relative difference cochain by changing the map
    on n-cells while fixing X^(n−1)∪B. Consequently `[c(f)]=0` exactly when
    a map agreeing with f on X^(n−1)∪B extends over X^(n+1)∪B; choose the
    negative of a coboundary preimage to cancel c under the pinned difference
    convention. A zero class does not assert extension of the fixed n-skeleton.
    Prove the full local-coefficient lifting/section version for Layer 5's
    Serre fibrations with path-connected n-simple fibres: use fibre π_n and
    its transport along base paths as a module-valued functor on the fundamental
    groupoid, concretely `LocalCoefficientSystem ℤ X`. For a lifting problem
    along a given map b:X→Z, place the cell coefficient at b(φ_e(0)); transport
    the boundary-point class along b∘φ_e on the reversed radial segment from
    v₀ to 0. The base map is defined on the whole cell, even when its section
    is defined only on the boundary. Allow arbitrary base monodromy, and prove
    the same cocycle,
    difference, realization and two distinct extension criteria. In n=1 require
    abelian fibre π₁; in degree zero use component-set extension data, without
    an abelian obstruction class. Include pullback, relative subcomplex and
    homotopy naturality. When the fibre is (n−1)-connected, prove the resulting
    first obstruction class is independent of the chosen n-skeleton extension;
    no such independence is asserted without those connectivity hypotheses.

**Checks.**

- X=D² with cells e⁰,e¹,e², B=∅, n=1, Y=S¹ and f the identity on X¹=S¹: the obstruction
  cochain on e² is the class of f on the attaching circle in π₁(S¹)=ℤ, namely 1≠0, and
  indeed the identity of S¹ does not extend over D²; for Y=S² the group π₁(S²)=0 forces
  c(f)=0 and every map S¹→S² extends.
- Difference sign: with X as above, f₀ the identity and f₁ of degree k on X¹=S¹,
  agreeing at e⁰, the difference cochain is d(f₀,f₁)(e¹)=k−1 while c(f₀)(e²)=1 and
  c(f₁)(e²)=k, so δd(e²)=k−1=c(f₁)−c(f₀); the opposite convention would give 1−k. If e²
  is attached by degree m instead, the values are m and km and δd(e²)=m(k−1).
- Y=S²⊔{∗} based at ∗: π₂(Y,∗)=0, so a cochain with these coefficients vanishes, yet a
  2-cell mapped onto the sphere component cannot be transported to ∗; the path-connectedness
  hypothesis on Y is part of the construction.
- Y=RP² with n=2 is not n-simple: the generator of π₁(RP²)=ℤ/2 acts on π₂(RP²)≅π₂(S²)=ℤ
  as the antipodal map of S², of degree −1, so transporting a boundary class along the two
  path classes from a point to y₀ gives values differing by sign, and the obstruction
  cochain would depend on the chosen paths; for Y=S² the action is trivial and the two
  transports agree.

### 8.10 Ordinary representability

*Needs:* §§4.5, 6.1, 8.3, 8.8c and 8.9; §4.9's realization product comparison and §4.8; for `ordinaryEMRepresentability` on an arbitrary space, Tau Ceti's lifting through weak homotopy equivalences from sources of CW type, weak-equivalence invariance of singular homology, the universal coefficient sequence, the naturality of the Hurewicz and Kronecker maps and the action of π₁ on π_n (supplier contracts).

**Ordinary cohomology representability.**
    Consume 8.8c's single functorial abelian CW/bar/Dold–Kan K(A,n) constructors
    for every abelian A and n≥1; this item consumes the constructor and its homotopy
    groups, rather than rebuilding its models. Export the functorial
    Eilenberg–MacLane family and the model it yields, with its normalized identification and the
    natural maps induced by homomorphisms A→A′. Own the universal class
    `ι_(A,n)∈H^n(K(A,n);A)`: under Hurewicz, degree-one abelianization and universal
    coefficients its evaluation is the identity A→A. Fix degree-one identification
    by the bar's oriented one-simplex labelled a. Construct the pullback map
    `[f]↦f*ι_(A,n)` and prove it is a bijection, for every CW complex X of arbitrary
    dimension and any number of components, with `H^n(X;A)` (Hatcher, Theorem 4.57,
    p.393). Prove surjectivity
    by realizing cellular cocycles on n-cells and extending over all higher cells;
    prove injectivity by realizing cellular coboundaries as homotopies, using the
    Layer 4.5 relative cylinder CW structure and weak topology. There is no finite-CW
    hypothesis, and no passage from finite subcomplex bijections that suppresses
    phantom-map issues. Prove naturality in X and A, compatibility with normalized
    homotopy-group identifications, zero, addition and inverses. Obtain addition
    from the simplicial abelian models. Consume §4.9's
    simplicial-realization product comparison, identifying |A•×A•|
    with k(|A•|×|A•|); that target uses only Layer 4 and precedes
    ordinary representability. Consume
    Layer 4.8's right adjoint k in i⊣k, counit and CW compact-
    generation comparison, on native `CompactlyGenerated`,
    `UCompactlyGeneratedSpace` and `TopologicalSpace.compactlyGenerated`.
    Consume those named suppliers in their stipulated shapes. Route paired maps
    from compactly generated X through this product comparison before applying
    realized addition, and compare back to ordinary TopCat homotopy classes on
    CW sources. Prove the pullback map is an additive equivalence.
    For n≥2 the distinguished class on |Γ(A[n])| is represented by the
    normalized cellular cocycle e_a↦a on the actual counit-labelled n-cells.
    For n=0 use discrete A; its universal H⁰ class is the identity function on A,
    not an identification H₀(A)≃A. Identify `[X,A_discrete]` with functions from
    `ZerothHomotopy X` to A and with H⁰(X;A). For every CW pair (X,B), prove
    relative representability by maps sending B to 0 and homotopies fixed on B,
    including the quotient `(X/B,*)`; for B empty use X with an added basepoint.
    Export the pointed/reduced version and the comparison with unreduced groups.

`ordinaryEMRepresentability` states the absolute theorem in degree n+1, n≥0, for every
Eilenberg–MacLane space and not only for the family's models. Let A be an abelian group and K
a space with a point k at which π_i(K,k) is trivial for every i≠n+1 (for i=0 this says that K
is path connected), and let e:π_(n+1)(K,k)≅A. The class ι∈H^(n+1)(K;A) is fixed by requiring
that its Kronecker evaluation on the Hurewicz image of every a∈π_(n+1)(K,k) be e(a): it is the
fundamental class of Hatcher's Theorem 4.57 (p.393), the inverse of the Hurewicz isomorphism
read through universal coefficients (p.394). For every space X of CW type (`TauCeti.CWType`;
X may be empty or have any number of path components) every class of H^(n+1)(X;A) is f*ι for a
map f:X→K, and two maps with equal pullbacks of ι are homotopic. No CW structure, separation
axiom or finiteness is assumed of K. The homotopy classes are free ones: π₁(K) acts trivially
on π_(n+1)(K) by `TauCeti.homotopyGroupMulAction`, for n=0 because A is abelian (Hatcher,
p.394). Chains have the coefficients ℤ
lifted to the universe of K, and cochains take values in A. To prove it, write d=n+1. The
family's model K₀ of K(A,d), with identification e₀, has one vertex and no cells in dimensions
1 to d−1. Extend e⁻¹∘e₀ over its d- and (d+1)-cells (Hatcher, Lemma 4.31, p.366) and then over
its higher cells, whose attaching spheres are nullhomotopic in K because π_i(K)=0 for i>d. The
resulting based map φ:K₀→K induces e⁻¹∘e₀ on π_d and is a weak homotopy equivalence. Tau Ceti's
lifting through weak equivalences transports homotopy classes of maps out of X. Its homology
invariance and the universal coefficient sequence make φ* an isomorphism on H^d(-;A), and the
naturality of the Hurewicz and Kronecker maps makes φ* send the normalized class of K to that of
K₀. So the theorem for K₀ gives the theorem for K, and for X of CW type it follows from the CW
case through a homotopy equivalence to a CW complex. Degree zero, where K(A,0) is A discrete, is
the separate statement above and is not part of `ordinaryEMRepresentability`.

**Checks.**

- A=ℤ, n=1: K(ℤ,1) is the bar model of S¹, the universal class evaluates to 1 on the
  oriented 1-simplex labelled 1, and f↦f*ι is the degree map [S¹,S¹]→H¹(S¹;ℤ)=ℤ; the zero
  class would make the pullback map constant.
- X=∅: [∅,K(A,n)] has one element and Hⁿ(∅;A)=0; X=S¹⊔S¹, n=1: both sides are ℤ×ℤ,
  computed componentwise.
- n=0: K(A,0) is A discrete, and [X,A] is the set of functions π₀X→A, which is H⁰(X;A);
  the universal H⁰ class is the identity function on A, not an identification of H₀(A)
  with A: for A=ℤ, H₀(A;ℤ) is the free abelian group on the set ℤ.
- `ordinaryEMRepresentability` on a space that is not a model: K the unit circle in ℂ with
  k=1, A=ℤ, n=0, and e the winding number, sending t↦exp(2πit) to 1. Its Hurewicz image
  generates H₁(K;ℤ)=ℤ, so ι is the generator on which that image evaluates to 1, and f*ι
  is the degree of f:S¹→K times the corresponding generator of H¹(S¹;ℤ)=ℤ. The opposite
  identification −e gives −ι, which also represents but evaluates to −1; the zero class
  pulls every map back to 0 and is not onto ℤ.
- The vanishing above degree n+1 is needed: K=S², A=ℤ, n=1 has π₂(S²)=ℤ but π₃(S²)=ℤ≠0.
  [S³,S²]=π₃(S²)=ℤ while H²(S³;ℤ)=0, so the Hopf map and a constant map have the same
  pullback of every class and no class of H²(S²;ℤ) can represent.
- The vanishing below degree n+1 is needed: K=S¹×CP∞, A=ℤ, n=1 has π₂=ℤ but π₁=ℤ≠0.
  For X=S¹ the free classes are [S¹,S¹]×[S¹,CP∞]=ℤ×0=ℤ while H²(S¹;ℤ)=0.
- Path-connectedness, the degree-zero clause, is needed: K=S¹⊔{p} with k on the circle,
  A=ℤ, n=0 has π₁(K,k)=ℤ and π_i(K,k)=0 for i≥2. For X a point, [X,K] has two
  elements and H¹(X;ℤ)=0 has one.
- K a point: every homotopy group is trivial, so an e exists exactly for A=0, and then ι=0,
  [X,K] has one element and H^(n+1)(X;0)=0 for every X, X=∅ included. For A=ℤ no e exists
  and nothing is claimed.
- The source needs CW type. The Warsaw circle W, the closed topologist's sine curve closed
  up by an arc from (0,−1) to (1,sin 1), has every homotopy group trivial, so H¹(W;ℤ)=0.
  Collapsing the limit segment {0}×[−1,1] gives a map q:W→S¹ that is not nullhomotopic: a
  nullhomotopy would lift q to ℝ by the covering homotopy property; the lift is constant
  on the connected segment, but along the arc and the graph it changes by a full turn as
  x→0, while those points accumulate on the segment. So q and a constant map have equal
  pullbacks and are not homotopic, and W has no CW type.
- For n=0 the hypotheses on K are Tau Ceti's `TauCeti.IsEilenbergMacLaneSpaceOne` for
  `Multiplicative A` (asphericity and π₁≅A). For K=RP∞ and A=ℤ/2, ι is the nonzero class
  of H¹(RP∞;ℤ/2)=ℤ/2, and [RP²,RP∞] has two elements, the constant map and the inclusion,
  matching H¹(RP²;ℤ/2)=ℤ/2; the nonabelian K(S₃,1) has no abelian A with e and is outside
  the theorem.

### 8.11 Mapping spaces and EM loops

`finiteSourceMappingCWType` states the absolute compact-source conclusion of Milnor
Theorem 3, p.276: for compact Hausdorff X and any space Y of CW type (`TauCeti.CWType`, a
homotopy equivalence to a CW complex Z⊆K in a Hausdorff space K of the same universe), the
compact-open space C(X,Y) has CW type. Milnor states Theorem 3 for a
compact n-ad with no separation axiom and no metrizability; the Hausdorff hypothesis on X is
kept because the proof's function-space steps (continuity of evaluation and the exponential
law carrying homotopies into C(X,Y)) are available for compact Hausdorff sources (Hatcher,
Appendix, Propositions A.14–A.16, pp.530–531). No separation axiom is imposed on Y: the model
is the CW complex Z with the subspace topology of the Hausdorff space K, postcomposition with
the model equivalence and its inverse is continuous on compact-open spaces for every Y, and
the homotopies between their composites and the identities induce homotopies
C(X,Y)×I→C(X,Y) and C(X,Z)×I→C(X,Z) as adjoints of (f,t,x)↦H(t,f(x)), which needs only
continuity of evaluation on C(X,Y)×X and C(X,Z)×X; so C(X,Y)≃C(X,Z), and 8.11a's
compact-source theorem applies to Z. The ambient space K is not a substitute for Z. For
Y the Sierpiński space the conclusion holds with Z a point. The relative n-ad and
based-loop forms below retain the relative data.

*Needs:* §4.8 and §4.5 for mapping-space CW type; §§4.9, 4.10, 8.5 and 8.10 for EM loops.

**Mapping-space CW type and ordinary EM loops.**
    **8.11a. Mapping-space and based-loop CW type.** This independent block uses the earlier CW/pair
    foundations and Layer 4.8 only; it has no input from 8.10 or 8.11b.
    Prove the compact-source theorem, the absolute form of Milnor 1959 Theorem 3, p.276:
    for every compact Hausdorff X, metrizable or not, and every CW complex Z in a Hausdorff
    space, the compact-open space C(X,Z) has CW type. Prove the finite-CW-source pair
    specialization of Theorem 3 and Corollary 3, p.276, for n-ads: mapping spaces from a
    finite CW pair into a Hausdorff CW pair, with prescribed relative/basepoint values,
    have based CW type in the compact-open/Kelley topology. Own the full inputs
    in their relative n-ad forms. Replace any CW n-ad by the weak realization
    K_w of a native abstract simplicial n-ad, with actual homotopy equivalences,
    using skeletal simplicial approximation and mapping cylinders (Hatcher, Theorem 2C.5,
    p.182, in the absolute case). Construct
    the metric realization K_m on the same finite-support barycentric points
    with distance d(a,b)=Σ_v |a_v−b_v|, bounded by 2, and prove Dowker's
    K_w≃K_m comparison, relative to the subcomplexes (Milnor, proof of
    Theorem 2, pp.274–276). A metric absolute neighborhood retract (ANR) Y
    means that every closed embedding Y→T into a metric space has an open
    neighborhood N of its image and a retraction N→Y restricting to the
    inverse embedding on that image. A metric absolute neighborhood extensor
    (ANE) Y means that every continuous map A→Y from a closed subset A of a
    metric space T extends to some open neighborhood of A in T. Develop
    their APIs without a separability assumption. Own the Kuratowski–Wojdysławski closed
    embedding of every metric space T into the convex hull of its image in the Banach space of
    bounded continuous real functions on T (Dugundji, *An extension of Tietze's theorem*,
    Pacific J. Math. 1 (1951), §7, p.363); keep the convex-hull carrier rather than imposing
    completeness or separability. Own Dugundji's extension theorem for continuous maps from
    closed subsets of metric spaces into convex subsets of normed spaces, with values in the
    convex hull of the image (Dugundji, Theorem 4.1, p.357, and Corollary 4.2, p.358), using
    native `PartitionOfUnity` and locally finite barycentric combinations. Use these
    inputs to prove ANR⇔ANE (Dugundji, Theorem 7.1, p.363). Construct an open neighborhood of the diagonal
    of an ANR with a continuous homotopy joining each pair of its points,
    constant on the diagonal; deduce that maps close in this neighborhood
    are homotopic, with the relative version, rather than assuming a uniform
    global distance bound. Prove homeomorphism invariance, open-
    neighborhood and finite-product properties, and relative finite n-ad forms.
    Prove K_m is a metric ANR by its star/nerve extension construction. Prove
    that maps from a compact source into a metric ANR form a metric ANR: for
    every compact space X, with no metrizability or separation axiom on X, and
    every metric ANR Y, the compact-open space C(X,Y), whose topology is that of
    the sup metric sup_x d(f(x),g(x)), is a metric ANR. Route: embed Y by the
    Kuratowski–Wojdysławski embedding as a closed subset of a convex set H in a
    normed space E, and let r:U→Y retract an open neighborhood U of Y in H (the
    ANR property). The maps X→H form a convex subset C(X,H) of the normed space
    of maps X→E with the sup norm, so every map from a closed subset of a metric
    space into C(X,H) extends to the whole space (Dugundji, Corollary 4.2,
    p.358). Because X is compact, the maps into U form an open subset C(X,U) of
    C(X,H), and postcomposition with r is a continuous retraction of C(X,U) onto
    C(X,Y). Hence a map from a closed subset A of a metric space into C(X,Y)
    extends into C(X,H), restricts to an extension on the open preimage of
    C(X,U), and postcomposition with r returns it to C(X,Y): C(X,Y) is a metric
    ANE, so a metric ANR. For a compact metric source prove the relative
    forms, with finite-CW subcomplex constraints, prescribed values and the
    constant map, by currying neighborhood extensions through the tube lemma.
    Construct domination of metric ANRs by native simplicial complexes using
    numerable open covers and nerves (Dugundji, Theorem 7.5, p.365, applied to
    the identity map of the ANR).
    Domination of X by K consists of maps u:X→K and v:K→X with a
    specified homotopy v∘u≃id_X, relative to the marked subspaces for n-ads;
    no homotopy u∘v≃id_K is required. Prove invariance under homotopy
    equivalences, composition of dominations, and restriction to the marked
    subspaces. Finally prove that domination by a CW complex implies CW type
    by the homotopy-idempotent mapping telescope (Hatcher, Proposition A.11,
    p.528), retaining these maps and relative homotopies. These inputs establish the
    compact-source theorem independently of any weak-equivalence upgrade: for compact
    Hausdorff X, postcomposition with the homotopy equivalences Z≃K_w≃K_m gives
    C(X,Z)≃C(X,K_w)≃C(X,K_m) through the exponential law for homotopies; C(X,K_m) is a
    metric ANR, hence dominated by a simplicial complex, hence of CW type.

    Apply it to (I,{0,1})→(X,{x₀}) with x₀ a 0-cell to obtain
    CW type of the based loop space; compare native fixed-interval loops with the Kelley
    mapping carrier. Own the interval-product comparison
    k(Y×I)≅k(Y)×I from Layer 4.8's compact-test/product API,
    and prove k preserves homotopy equivalences, including
    their relative forms; transport the CW-type witnesses through it.

**Metric realization.**

**Checks.**

- Δ⁰ has one barycentric point, distance 0, and both realizations are a point;
  adding an extra zero-weight point would give two points instead.
- In Δ¹ the points (1−t,t) and (1−s,s) have distance 2|t−s|; in particular
  the vertex distance is 2, and t=1/2 is distance 1 from either vertex.
- In the countable wedge of intervals with vertices v₀,v₁,… and edges
  [v₀,v_j], set x_j=(1−1/j)v₀+(1/j)v_j for j≥1. Then d(x_j,v₀)=2/j→0
  in K_m. In K_w the neighborhood with t<1/(2j) on edge j contains v₀
  and no x_j, so x_j does not converge there. A homeomorphism claimed to
  be the identity between these topologies would fail this test.

**ANR and ANE.**

**Checks.**

- The closed Euclidean line ℝ×{0}⊂ℝ² has the global retraction
  (x,y)↦(x,0), restricting to (x,0)↦(x,0). For an extension witness,
  {−1,1}→ℝ with values −1,1 extends by t↦t on ℝ. Convexity and the
  stated extension theorem give the all-ambient ANE assertion for ℝ.
- S¹⊂ℝ² retracts from 1/2<‖z‖<3/2 by z↦z/‖z‖: 1↦1 and i↦i.
  For any map f:A→S¹ with A closed in a metric T, extend into ℝ² and
  restrict to the open set 1/2<‖F‖<3/2 before normalizing. This gives an
  ANE witness; extending normalization to z=0 would require division by 0.
- The Cantor set C⊂[0,1] is neither ANR nor ANE. Any neighborhood of 0
  in ℝ contains [0,ε) and some c=2/3^k with 0<c<ε. A retraction to C
  would send the connected interval [0,c] to a connected subset containing
  both 0 and c, impossible since connected subsets of C are singletons.
  An extension of id_C to a neighborhood would be that same retraction.
- Maps from a non-metrizable compact source: C(βℕ,[0,1]) with the sup metric is the set of
  bounded sequences with values in [0,1], a convex subset of ℓ^∞, hence an absolute
  extensor by Dugundji's corollary and an ANR; it is not separable (the 0–1 sequences are
  pairwise at distance 1 and uncountable), so an ANR API that assumed separability would
  not apply to it.

**Domination.**

**Checks.**

- u=v=id_X has v∘u=id_X, with constant homotopy; this works for ∅ too,
  using the empty maps, and imposes no nonemptiness.
- The maps I→*→I with the second map selecting 0 have composite 0;
  H(x,t)=tx gives H(x,0)=0 and H(x,1)=x, so they dominate I by a point.
- The proposed constant composite S¹→*→S¹ induces 0 on H₁=ℤ, whereas
  id induces 1; no required homotopy exists. Dropping the composite-homotopy
  condition would incorrectly give every space CW type by domination by *.

    **8.11b. Ordinary EM loop comparison.** Construct coefficient-natural pointed
    maps K(A,n)→ΩK(A,n+1) for every n≥0 inducing the identity on A. Use the
    native fixed-interval loop carrier and `HomotopyGroup.pathLoopSpaceMulEquiv`
    in positive degrees, with the loop coordinate last. In degree zero use
    `HomotopyGroup.zerothHomotopyLoopSpaceEquivFundamentalGroup` and the pinned
    bar-edge identification. DGFloer's standing Moore conventions and its
    Layer 2 item 3 consume this fixed-interval convention for their carrier
    comparisons, preserving constant loops and addition.
    Define ordinary cohomology suspension here, including its unreduced
    cone adapter. For any CW space B form the actual unreduced cone CB by
    adjoining an apex to B×I and collapsing B×{0} to it. Define Σ_uB=CB/B
    by Layer 4.5's pointed collapse of B×{1}; when B is empty its two apices
    remain distinct. Let σ_right:H^n(B;M)→H̃^(n+1)(Σ_uB;M) be (−1)^n
    times the cone-pair connecting map, transported by that quotient comparison.
    For a pointed CW complex with 0-cell basepoint, collapse its basepoint
    meridian and pass to reduced cohomology. Own the actual
    two-step suspension homeomorphism to Layer 4.4's interval-last raw
    quotient, sending every representative (b,t) to that same (b,t) class,
    with the collapsed meridian at the same basepoint. Prove naturality and
    transport the suspension/connecting maps through this homeomorphism
    using Layer 4.4's CW reduced-suspension Kelley comparison, then Layer 4.8's
    comparison with the convenient suspension. This gives the reduced suspension
    ΣB=B∧S¹ with S¹ last; σ_right is the positive cross product with the
    interval generator u with ⟨u,[I,∂I]⟩=+1; the chain boundary is [1]−[0]. In degree zero the unreduced construction
    kills constant functions and factors through H⁰(B)/im H⁰(CB); do not
    identify the suspension of a constant ordinary H⁰ class with a circle class.
    Define the reflected cone with B at 0/apex 1 and interval first, its
    suspension Σ_u,left B, and σ_left as minus its cone-pair connecting map.
    On pointed reduced classes it is the positive product u×a.
    Distinguish these from the full ordinary suspension for B₊=B⊔{*}:
    ordinary cohomology suspension on the pointed B₊ gives isomorphisms
    H^n(B;M)→H̃^(n+1)(Σ(B₊);M), including the degree-zero constant classes.
    The actual quotient q_+:Σ_uB→Σ(B₊) identifies the two apices; prove
    q_+^*σ_plus=σ_u for both coordinate orders. When B is empty this is
    the collapse of the two-apex space to a point. The pointed mapping-cone
    collapse used in spectral cofibers has target Σ(B₊), and its pullback
    kills constant degree-zero classes as the ordinary pair boundary does.
    For the mapping cone M_right(i)=X∪_(B×{1})CB of B→X, let
    c_right:M_right(i)→Σ_uB be the actual collapse of X. Define M_left(i) and c_left
    using the reflected interval-first cone. Under Layer 4.5's actual pair-to-
    mapping-cone comparison prove δ_(X,B)=(−1)^(n+1)c_right^*σ_right
    and δ_(X,B)=c_left^*σ_left. After composing each collapse with q_+,
    prove the same formulas using σ_plus with target Σ(B₊); this is the
    adapter for based mapping cones C(B₊→X₊). Reflection t↦1−t has degree−1 and moving
    the interval first contributes (−1)^n, so their composite on ΣS^n
    has degree (−1)^(n+1). Prove both the cone-pair and ordinary-pair formulas
    by actual chain comparisons and the interval/endpoints test at n=0 with
    the class 1 at endpoint 1. Prove coefficient, pair-map, relative-cup and
    suspension compatibility under Layer 6's excisive-triad hypotheses;
    cup products require the stated commutative-ring hypotheses.
    Pin δ(i^*a∪b)=(−1)^p a∪δb and δ(b∪i^*a)=δb∪a for
    degree-p a, using actual pair module maps and the local-system pairing.
    Under the pointed-smash reassociation with coordinates (X,Y,I), prove
    σ_right(a×b)=a×σ_right(b); moving I past degree-q b gives
    σ_right(a)×b=(−1)^qσ_right(a×b). State the actual smash/interchange
    comparison maps; this is cross-product compatibility, not a claim that
    suspension preserves the ordinary cup ring.
    Prove σ sends the distinguished universal class to the class whose adjoint
    induces identity under the native last-coordinate shift. Consume
    Layer 4.8's foundation-only suspension–loop adjunction
    transported through Layer 4.4's raw-quotient comparisons
    and §4.9's simplicial-realization product comparison for addition.
    Only after 8.11a's independent CW-type proof, consume
    §4.10's CW approximation and 8.5 to upgrade the EM loop weak
    equivalences to pointed homotopy equivalences. Own the bijection induced
    by these weak equivalences on maps from arbitrary CW sources via cellular
    lifting, independently of that upgrade. Prove coefficient/addition/adjunction
    naturality and the relative/basepoint versions.
    Generalized cohomology and spectra consume these ordinary interfaces.

**Checks.**

- For X=point, evaluation identifies C(X,Y) with Y; Y=S² gives H₂=ℤ on both sides.
- For X=∅, C(X,Y) is a point even when Y=∅, so the resulting CW model has one 0-cell.
- Based loops in S¹ have components indexed by winding number ℤ; the constant loop lies
  in component 0, while the once-positive loop lies in component 1. A connected model loses this distinction.
- For X=βℕ, compact Hausdorff and not metrizable, and Y=S⁰, the space C(βℕ,S⁰) is discrete,
  since X is compact and S⁰ discrete, with one point for each clopen subset of βℕ, that is
  for each subset of ℕ: its model is a CW complex with 2^ℵ₀ 0-cells. The compact-source
  theorem covers it; a route through compact metric sources only would not, and no model
  with countably many cells exists.
- For Z=S¹⊂K=ℝ² and X=S¹, C(S¹,Z) has components indexed by degree, ℤ, while C(S¹,K) is
  contractible: the model is Z with its subspace topology, and replacing it by the ambient
  Hausdorff space changes the answer.


### 8.12 Classical EM comparisons

*Needs:* §§8.8 and 8.10; Tau Ceti's circle Eilenberg–MacLane instance, the finite CW type of the circle, its comparison with Milnor's classifying space of ℤ and the realization of isomorphisms of fundamental groups between aspherical spaces of CW type (supplier contracts).

**Native circle comparison of the degree-one model.** Consume the native
    homotopy equivalence `TauCeti.circleHomotopyEquivClassifyingSpace` of
    Mathlib's `Circle` with Milnor's classifying space of `Multiplicative ℤ`,
    whose forward map induces the identity of ℤ on fundamental groups, and the native
    `TauCeti.IsAspherical.exists_homotopyEquiv`, which realizes a prescribed
    isomorphism of fundamental groups between aspherical spaces of CW type. Compare the
    degree-one ordinary model K(ℤ,1) of 8.10's family, the bar model for ℤ,
    with native `AddCircle.isEilenbergMacLaneSpaceOne` at period 1 and
    basepoint 0: apply the native realization theorem to the bar model and
    to `AddCircle` at period 1, both K(ℤ,1) spaces of CW type (the latter by
    the native `TauCeti.finiteCWType_addCircle`), with the identity of ℤ, obtaining the
    pointed homotopy equivalence sending the bar
    edge labelled +1 to the loop t↦t mod ℤ, 0≤t≤1, so that 8.10's
    distinguished degree-one class corresponds to the circle class pairing
    to +1 with that loop. Prove compatibility with 8.10's normalized
    homotopy-group identification and coefficient change along every additive
    homomorphism ℤ→A, including reduction ℤ→ℤ/m for each m≥1.
    CharacteristicClasses C1.5a consumes this comparison,
    8.8's bar model of ℤ/2 with its normalized π₁ identification and 8.10's K(ℤ,2) model and
    representability for its identification of the rank-one infinite
    projective carriers RP∞ and CP∞ as K(ℤ/2,1) and K(ℤ,2), with the generator
    normalizations on them; no projective carrier,
    characteristic-class definition or finite-projective comparison is
    constructed here.

**Checks.**

- The loop t↦t mod ℤ, 0≤t≤1, of `AddCircle` at period 1 pairs to +1 with the circle
  class; the reversed loop t↦−t mod ℤ pairs to −1, and the equivalence that sends the bar
  edge labelled +1 to the reversed loop induces −1 on π₁=ℤ, not the identity.
- Reduction ℤ→ℤ/m sends the degree-one class to a generator of H¹(S¹;ℤ/m)=ℤ/m, and the
  zero homomorphism ℤ→A sends it to 0.
- The period matters only through its nonvanishing: `AddCircle` at period 0 is ℝ, which is
  contractible and is not a K(ℤ,1).

Hatcher Theorem 4.32 (§4.2, p.366) gives the Hurewicz isomorphisms and Theorem 4.37 (§4.2,
p.371) the bijectivity of the Hurewicz map itself, and Theorem 4.5 (§4.1, p.346) gives Whitehead; Whitehead, Chapters
IV--VII, gives the relative and cellular forms.  May, *Simplicial Objects in Algebraic Topology*,
§3 (homotopy groups of Kan complexes), §§14–16 (the realization and its comparison with
topological spaces) and §17 (Theorem 17.1 and Proposition 17.4, simplicial groups and the Moore
complex), supply the Kan-group construction and comparison route.
Hatcher Section 4.3 supplies ordinary representability and obstruction theory;
[*Vector Bundles and K-Theory*, §3.3, pp.99–102, Lemma 3.18 and Proposition 3.19](https://pi.math.cornell.edu/~hatcher/VBKT/VB.pdf)
supplies the untwisted case of the relative section obstruction and difference-cochain construction. The
local-coefficient extension retains the stated fibre transport rather than assuming
trivial monodromy.

### 8.13 Smooth representatives in codimensions one and two

*Needs:* §8.7's finite CW type of compact smooth manifolds, §§8.10 and 8.12 for the circle classifying map, GeometricTopology Layer 1 tubular neighbourhoods, Mathlib's Whitney embedding and relative smooth approximation, and Tau Ceti's slice-chart implicit function theorem and flat Morse–Sard theorem (supplier contracts).

This section owns the differential-topology targets behind the representation of
low-codimension homology classes by embedded submanifolds: the smoothing of maps into
compact manifolds, parametric and relative transversality, and the transverse circle
classifying map of an integral degree-one class. The representation theorem itself
(Thom 1954, Chapter II: on a compact boundaryless smooth Hausdorff second-countable
m-manifold M every class in H_(m−1)(M;𝔽₂), m ≥ 1, and for oriented M every class in
H_(m−1)(M;ℤ), m ≥ 1, and H_(m−2)(M;ℤ), m ≥ 2, is the push-forward of the fundamental
class of a compact boundaryless smoothly embedded submanifold) needs the Thom classes
and Gysin maps of vector bundles and, in the mod 2 and degree-two cases, the finite
projective carriers RP^N and CP^N with their hyperplane classes; it is stated where
those are owned, and CharacteristicClasses C2.4a consumes §6.4's Poincaré duality, §8.7's
smooth triangulation of dimension m with its dimension bound, §§8.10 and 8.12 and the
targets of this section for it.

Represent
a degree-one integral class of a compact boundaryless smooth Hausdorff second-countable
manifold M by a map
to the native Circle, with generator normalized by the positive loop
t↦exp(2πit), 0 ≤ t ≤ 1: M has finite CW type by §8.7, the circle is a K(ℤ,1) (supplier
contracts), §8.10 represents the class and §8.12 fixes the normalization. Allow empty
and disconnected M. Then smooth the classifying map
and make it transverse to 1∈Circle
by the two general targets that follow, applied to the
compact target Circle and its closed embedded
submanifold {1}. Both targets are stated for an arbitrary compact target
manifold and an arbitrary closed embedded submanifold: this roadmap
owns the smoothing of continuous maps into compact manifolds, the
parametric transversality theorem and relative transversality
(DifferentialGeometry 8.3 approximates smooth simplices and 10.2 is Sard
in equal dimensions only; Mathlib approximates maps into normed spaces
and embeds compact manifolds in Euclidean space). TangentialBordism
B1.6 consumes all three for boundaryless sources and extends them to
sources with corners, facewise.

*Smoothing of maps into compact manifolds.* For a boundaryless
sigma-compact Hausdorff second-countable smooth manifold M, a compact
boundaryless Hausdorff second-countable smooth manifold P over a
finite-dimensional real model, a closed set A⊆M, an open U⊇A and a
continuous map f:M→P smooth on U, prove that there is a smooth g:M→P
homotopic to f relative to A, in particular equal to f on A (Lee,
Theorem 6.26, whose target is an arbitrary boundaryless manifold; the
compact case is what the embedding theorem at the pins supports). Route:
embed P as a closed submanifold of a Euclidean space V by Mathlib's
`exists_embedding_euclidean_of_compact`, and take GeometricTopology
Layer 1's tubular neighbourhood of the image: an open W⊆V containing P
with a smooth retraction r:W→P that restricts to the identity on P and
is a submersion on W. Choose a continuous positive ε on M such that the
open ball of radius ε(x) about f(x) lies in W: ε(x)=dist(f(x),V∖W) when
W≠V, and ε=1 when W=V (P a point and V=ℝ⁰, the only case in which V∖W is
empty and Mathlib's infimum distance to the empty set is 0).
Approximate the composite M→V by a smooth map g̃ that agrees with it on
A and stays within ε, using Mathlib's
`Continuous.exists_contMDiff_approx_and_eqOn` (which needs sigma-compact
Hausdorff M and smoothness of f on a neighbourhood of A); the ball is
convex, so the segment from f(x) to g̃(x) stays in W. Then g=r∘g̃, and r
applied to that segment is the homotopy relative to A. *Needs:* Mathlib
`exists_embedding_euclidean_of_compact` and
`Continuous.exists_contMDiff_approx_and_eqOn`; GeometricTopology Layer 1
tubular neighbourhoods. Checks: for f already smooth and A=M the target
returns g=f; a smooth g homotopic to f has the degree of f, so for
P=M=Circle the constant map at 1 yields a g of degree 0, never the
identity; for the compact targets Circle, RP^N and CP^N the route's data are
explicit, namely Circle as the unit circle in ℂ with W=ℂ∖{0} and
r(z)=z/|z|, RP^N as the rank-one orthogonal projections x·xᵀ in the
symmetric matrices and CP^N as the rank-one Hermitian projections z·z*
in the Hermitian matrices, with W the matrices whose largest eigenvalue
is simple and r the projection onto the top eigenline (a simple
eigenvalue and its eigenprojection depend smoothly on the matrix), and
these r are the identity on P and submersions on W; a wrong model that
approximated f in V without retracting would leave W and need not even
land in P.

*Relative transversality.* For M as in the smoothing target, a compact
boundaryless Hausdorff second-countable smooth manifold P, a closed
embedded submanifold Z⊆P, a smooth f:M→P, a closed A⊆M and an open U⊇A
on which f is already transverse to Z, prove that there is a smooth
g:M→P, equal to f on A and homotopic to f relative to A, transverse to Z
on all of M (Lee, Theorem 6.36, in its relative form). Route: prove
first the parametric transversality theorem (Lee, Theorem 6.35): for an
open S in a finite-dimensional real space and a smooth F:M×S→P
transverse to Z, the parameters s whose slice F(−,s) is not transverse
to Z form a Lebesgue-null set. They are the critical values of the
projection to S of the transverse preimage F⁻¹(Z), an embedded
submanifold of M×S of dimension w=dim M+dim S−codim Z (Lee, Theorem
6.30). Near each of its points a slice chart of Z presents Z as the zero
set of a submersion g onto ℝ^(codim Z); transversality makes the
derivative of g∘F, read in a chart of M×S, surjective there, and Tau Ceti's
`HasStrictFDerivAt.exists_isSliceChart_preimage_zero` flattens F⁻¹(Z)
onto an open subset of ℝ^w. Countably many such pieces cover F⁻¹(Z)
(M×S is second countable); on each the projection is a smooth map from
an open subset of ℝ^w to S, whose critical values are null by Tau
Ceti's flat Morse–Sard theorem `TauCeti.addHaar_image_criticalPoints_eq_zero`,
which imposes no relation between w and dim S. DifferentialGeometry
10.2's manifold Sard theorem (`TauCeti.isNullSet_image_criticalPoints`)
requires equal model dimensions, which hold here only when
dim M = codim Z. Then take the
embedding e:P→V and the tubular retraction r:W→P of the smoothing
target, a radius δ>0 such that the δ-neighbourhood of e(P) lies in W
(positive by compactness of e(P) when W≠V, any δ when W=V), the open
δ-ball S about 0 in V, a smooth cutoff β:M→[0,1] vanishing on a
neighbourhood of A and equal to 1 off U, and the family
F(x,s)=r(e(f(x))+β(x)·s). Where β(x)>0 the map s↦F(x,s) is an affine
diffeomorphism onto a ball inside W followed by the submersion r, hence
a submersion, so F is transverse to Z there; where β(x)=0 the point x
lies in U, every slice passes through f(x) with derivative df_x (a zero
of β≥0 is a minimum, so dβ_x=0), and f is transverse to Z at x by
hypothesis, so F and every slice are transverse there. Choose s outside
the null set and put g=F(−,s); the path t↦F(−,ts) is the homotopy
relative to A, and g=f on A because β vanishes there. *Needs:* the
smoothing target's embedding and tubular retraction; Tau Ceti
`HasStrictFDerivAt.exists_isSliceChart_preimage_zero` and
`TauCeti.addHaar_image_criticalPoints_eq_zero`. Checks: for M a point,
P=Circle, Z={1}, S the open interval (−π,π) and F(pt,s)=exp(is), F is a
submersion in s and so transverse to Z; F⁻¹(Z) is the single point
(pt,0), of dimension 0+1−1=0, its projection to S has the critical
value 0, and indeed F(−,0) hits 1 with zero derivative and is not
transverse while every F(−,s) with s≠0 misses Z; the bad set {0} is null
but nonempty, and the equal-dimension Sard theorem does not apply
because dim F⁻¹(Z)=0≠1=dim S. For Z={1}⊂Circle, M=Circle, f the
identity and A=∅ the target returns a g for which 1 is a regular value, as it already is for f; f
constant at 1 is not transverse to {1}, and for P=Circle the family
r(f(x)+β(x)s) with β=1 rotates and rescales the constant map, so for
every s outside the null set g⁻¹(1)=∅ is the empty representative of the
zero class; for Z=RP^(N−1)⊂RP^N and Z=CP^(N−1)⊂CP^N the target returns a g
transverse to the hyperplane, to which CharacteristicClasses applies its hyperplane
adapter; a model that dropped the
transversality hypothesis on U would fail for f constant at a point of a
proper submanifold Z with A=M, where no perturbation is allowed and f is
not transverse.

For each transverse circle classifying map f, construct N=f⁻¹(1), its
native smooth embedding i:N→M, and the derivative-induced normal-bundle
isomorphism νN≃(f|N)*ν{1}; the zero class has the empty representative, and
no connectedness is imposed on N. For oriented M orient N by normal-first
order νN then TN in a smooth splitting of TM|N, proving independence
of the splitting. The circle normal is framed by the positively oriented normal of
1∈Circle. Export the embedding,
compactness and normal comparison as data
and theorems on the native carriers. The integral codimension-one classifying
map, with the pullback of the generator and the surjective derivative on
the fibre over 1, is the Layer 8 headline
`exists_transverse_circle_classifying_map` of `Suggested.lean`. The
fundamental-class identity i_*[N]=PD_M(f* u), which uses the pullback of the relative
Thom class and tubular excision, and the projective-hyperplane adapter (the section of
the dual tautological line cut out by a coordinate functional, the identification of
the hyperplane normal with that line and the single-point intersection counts on RP^1
and CP^1) are not targets of this section; CharacteristicClasses consumes the
embedding and normal comparison above for them.

Prove transverse-pullback naturality of this comparison and its independence of the
classifying map. For a homotopy between two smooth circle classifying maps f₀ and f₁
transverse to 1, extend the homotopy constantly to the boundaryless
sigma-compact manifold ℝ×M, apply the smoothing and relative-transversality
targets above with A=(ℝ∖(0,1))×M, on a neighbourhood of which the extended
homotopy is the smooth transverse endpoint map, and restrict to [0,1]×M.
Construct the resulting
compact embedded bordism in I×M between N₀=f₀⁻¹(1) and N₁=f₁⁻¹(1). With interval-first
ambient orientation
and normal rank c=1, multiply its normal-first inverse-image orientation
by (−1)^c to obtain boundary −N₀ disjoint-union N₁ under the
outward-normal-first convention. This
proves independence of the chosen classifying-map representative in
the specified embedded-bordism sense. It does not identify all smooth
submanifolds with their homology classes.

### 8.14 Finite-dimensional Whitehead, maps out of (n−1)-connected complexes, aspherical surfaces

*Needs:* §4.1's lifted CW structures, §6.1's universal coefficients, §6.3's noncompact top-degree vanishing, §§8.1–8.5, 8.7, 8.8 and 8.10, Tau Ceti's action of π₁ on π_n (supplier contracts), the universal-covers roadmap's induced maps on covers, and ClassifyingSpaces Layer 1, items 1.1 and 1.2, for the case n=1 of the classification of maps.

These are consequences of
the existing ordinary CW, cover, relative homotopy and cohomology
constructions, on their carriers. For connected Hausdorff CW
complexes X,Y of dimension ≤ n, prove that an actual map f:X→Y inducing
isomorphisms on π_i for 1 ≤ i ≤ n is a homotopy equivalence (Hatcher,
Section 4.2, Exercise 13, p. 390). Retain both dimension bounds and the
component condition; n=0 is the connected discrete case. Use the induced
universal-cover map on the CW structures lifted by §4.1,
relative Hurewicz on its mapping cylinder, homology vanishing above n and
homological Whitehead for the covers, then ordinary Whitehead. This
finite-dimensional criterion does not weaken ordinary Whitehead for
general CW spaces.

For n ≥ 1, a pointed (n−1)-connected CW source X and a pointed
path-connected target Y with π_iY=0 for i>n, prove that the actual
induced-map function [X,Y]_*→Hom(π_nX,π_nY) is a bijection, natural in
both variables (Hatcher, Section 4.2, Exercise 17, p. 390). For n=1 use
the nonabelian group-homomorphism target and obtain the bijection from
ClassifyingSpaces Layer 1, items 1.1 and 1.2, whose target is an arbitrary
aspherical space (Hatcher, Proposition 1B.9, p. 90); only the naturality
is proved here. In higher degrees use
high-cell replacement of X, the actual cell extension/homotopy procedure,
Hurewicz and the universal coefficient theorem; do not assume that Y is simply connected or
that its universal cover has no lower homotopy. For unbased classes
retain the action of π₁Y on π_nY, Tau Ceti's `TauCeti.homotopyGroupMulAction`, whose orbits
are the free homotopy classes (`TauCeti.homotopyGroup_mem_orbit_iff_exists_homotopyAlong`).
Deduce the existing EM uniqueness comparison
with its prescribed group isomorphism.

As a surface case, prove that every smooth closed connected
surface with infinite fundamental group has contractible universal cover,
hence is K(π₁,1) (Hatcher, Section 4.2, Exercise 16, p. 390). The cover
is noncompact because it is infinite-sheeted over a compact base. Use
§6.3's noncompact top-degree vanishing on the cover (Hatcher,
Proposition 3.29, p. 239), the 2-dimensional CW structure lifted by
§4.1 from §8.7's triangulation, and Hurewicz/Whitehead;
include the nonorientable branch. This consumes the existing
surface/cover/duality machinery and does not depend on 3-dimensional
geometrization.

### 8.15 Classifying spaces of finite groups and free actions

*Needs:* the finite-cyclic periodic resolution, Tau Ceti's CW approximation, compact-manifold homology vanishing, universal coefficient sequence and group-cohomology identification of Milnor's model (supplier contracts); §§4.1, 5.1 and 8.8b.

Consume the two-periodic resolution of a finite cyclic group with its
comparison maps, Mathlib's and Tau Ceti's
`RepresentationTheory.Homological.GroupCohomology.FiniteCyclic` (supplier contracts),
§5.1's algebraic tensor/Künneth maps, and §8.8b's normalized comparison with Tau Ceti's
Milnor model and its identification
`TauCeti.classifyingSpaceSingularCohomologyIsoGroupCohomology` with group cohomology of
the trivial representation (supplier contracts). For a prime p and trivial 𝔽_p coefficients prove
dim H^d(BC_p;𝔽_p)=1 and dim H^d(B(C_p×C_p);𝔽_p)=d+1 for every d ≥ 0,
through the actual comparison and Künneth maps. Reuse those owners'
cochains and resolutions.

For a connected finite-dimensional CW complex X with universal cover X̃,
put G=π₁X. Prove X and X̃×BG have isomorphic abstract homotopy groups in
every degree. If G contains a nonidentity element of finite order, prove
they are not homotopy equivalent (Hatcher, Section 4.2, Exercise 26,
p. 391). Choose a prime-order subgroup and lift any proposed equivalence
to the corresponding covers, retaining its induced group isomorphism and
transported subgroup. The product cover retracts onto BC_p; its nonzero
cohomology in unbounded degrees contradicts the finite-dimensional CW
structure lifted to the cover of X by §4.1. No map realizing
all abstract isomorphisms is supplied by their existence.

For every prime p and n ≥ 0 prove that no continuous action of C_p×C_p
on the standard S^n is free (Hatcher, Section 4.2, Exercise 28, p. 391);
the conclusion for native continuous actions on the actual Euclidean
sphere, including S⁰, is the Layer 8 headline
`elementaryAbelianPair_sphere_action_has_stabilizer` of `Suggested.lean`.
Finite freeness supplies the actual quotient covering S^n→M and the local
Euclidean charts of the compact Hausdorff quotient M. The cohomological
bound H^k(M;𝔽_p)=0 for k>n is Tau Ceti's topological vanishing
H_k(M;𝔽_p)=0 for k>n of a compact manifold,
`TauCeti.isZero_singularHomology_of_compactSpace` (supplier contracts; Hatcher, Lemma 3.27,
p.236), applied to the Hausdorff locally Euclidean quotient with no smooth atlas, equivariant
triangulation or CW structure on M, composed with the universal-coefficient
identification H^k(M;𝔽_p)≅Hom(H_k(M;𝔽_p),𝔽_p) over the field 𝔽_p from
the universal coefficient sequence (supplier contracts; §6.1). For n>1 attach one (n+1)-cell to a CW
approximation of M along S^n→M, a generator of π_nM, then higher cells to
form its K(C_p×C_p,1); carry this out through Tau Ceti's CW approximation
`TauCeti.cwApproximationMap` of the path-connected quotient M and the
normalized comparison. The relative cohomology sequence of the single
cell, injectivity of restriction from the cells of dimension at least n+2,
and the bound above imply dim H^(n+1)(B(C_p×C_p);𝔽_p) ≤ 1, contradicting
n+2. Handle S¹ by the cyclic deck group of a connected finite circle cover
and S⁰ by its two-point cardinality. No smoothness, linearity or
cellularity of the original action is assumed. Reuse the native cyclic
resolution and the existing tensor-complex comparison; no new general
resolution theory or spectral sequence is needed for this argument.

### 8.16 An essential map invisible to homotopy and reduced homology

*Needs:* §§2.5, 4.4 and 6.5 for the collapse and its degree; Tau Ceti's Serre fibrations and product CW structure (supplier contracts) and §5.5's homotopy lifting against CW complexes.

On the
actual product T³=S¹×S¹×S¹ choose an oriented embedded chart ball and
construct the quotient collapse q:T³→S³ of degree +1, based at its
collapsed complement. Let p:S³→S² be a Serre fibration (`TauCeti.TopCat.serreFibrations`)
every fibre of which has vanishing third integral homology, and put f=p∘q.
Both spheres are the §2.5 unit spheres
with their reference classes, so that the degree +1 of q and the H₃ map
below refer to the §2.5 generators. Prove that all induced positive
homotopy-group maps and all induced reduced integral homology maps of f
are zero, while f is not homotopic, even unbased, to a constant map
(Hatcher, Section 4.2, Exercise 34, p. 392, for the Hopf map). Use torus asphericity and
the sphere homology groups for the vanishings. If f had a nullhomotopy,
lift it through p with initial lift q, by §5.5's homotopy lifting for Serre fibrations
against Hausdorff CW complexes, T³ carrying the product CW structure of three circles
(`TauCeti.cwComplexProd`, §4.5). The endpoint lands
in one fibre and has zero H₃ map, contradicting degree +1. Construct
the collapse, orientation, lift and endpoint factorization explicitly.
This uses the existing quotient, degree, torus-cover and fibration-lifting
interfaces. The Hopf projection is the intended instance: it is locally trivial with
fibre S¹, hence a Serre fibration by
`TauCeti.TopCat.mem_serreFibrations_of_exists_trivialization`, and H₃(S¹;ℤ)=0. Its
construction as the projection of the principal circle bundle S³→CP¹ followed by an
identification CP¹≅S² needs that bundle model; CharacteristicClasses C7.6 consumes this
section for that instance.

**Checks.**

- For p the Hopf projection the fibres are circles, H₃(S¹;ℤ)=0, and f=p∘q is the map of
  Hatcher's exercise; the lifted endpoint T³→S¹⊂S³ induces 0 on H₃ while q induces the
  identity of ℤ.
- The fibration hypothesis is needed: for p a constant map, which is not a Serre fibration
  because a nonconstant path in S² has no lift, f=p∘q is constant.
- The collapse alone does not suffice: q:T³→S³ has degree +1 and is detected by H₃, so it
  is the composite with p, which kills H₃(S³) in H₃(S²)=0, that is invisible to reduced
  homology.

Hatcher Section 4.2's exercises 13, 16, 17, 26, 28 and 34 state the applications
of §§8.14–8.16, and Thom 1954, Chapter II, the representability theorems that §8.13's
targets serve.

### Examples

Identity maps on ∅, a point, S¹ and S² induce identity maps on components and all homotopy groups. The map ∅→point fails component surjectivity; degree two on S¹ gives 2ℤ≠ℤ on π₁.

### Dependencies

*Needs:* Layers 2–4 for relative homotopy and cellular induction; Layer 6 for cohomology; the named supplier sections in each item for EM and bundle applications.

## Downstream consumers

CharacteristicClasses consumes cohomology, compact supports and the tower comparison;
DGFloer consumes the raw bar and CW foundations and the ordinary Serre and
Eilenberg–MacLane targets; DifferentialGeometry consumes singular
integration inputs and the homological fundamental classes. Stable and geometric
applications use the ordinary interfaces without supplying their foundations.

The objects consumers cite are carried by the following sections.

- DGFloer (the loop-space ring computation) and RiemannianGeometry (the shortest-geodesic
  family) consume
  §4.4's reduced-suspension sphere homeomorphism `ΣSⁿ≅S^(n+1)` with the interval-last
  coordinate order and its Kelley comparison of the compact reduced suspension with the
  convenient suspension.
- MorseTheory (M2) and CharacteristicClasses (C2.0's sphere-bundle base) consume §4.5's
  relative CW pushout and its CW model; CharacteristicClasses (C2.0's fibre cube) also
  consumes §2.5's sup-ball-to-disk homeomorphism `v↦(‖v‖∞/‖v‖₂)·v`, the inverse of Tau Ceti's
  `TauCeti.diskHomeomorphClosedBall`.
- GeneralizedCohomology (the quaternionic Hopf comparison) consumes §4.4's disk quotient
  `Dⁿ/∂Dⁿ≅Sⁿ`.
- BanachAlgebras (A8) and DifferentialGeometry (10.5) take the Brouwer fixed-point theorem,
  including its finite-span form `TauCeti.brouwerFixedPoint_compactConvex_finiteSpan`, from
  Tau Ceti (supplier contracts); citations of AlgebraicTopology §2.7 map to that native file.
- AffineMorseLefschetz (A4) takes the based top pair and its relative homotopy sequence from
  Tau Ceti's `TauCeti.BasedTopPair` and `TauCeti.RelHomotopyGroup`, which §8.1 consumes.
- MorseTheory (M4) consumes §6.2's cup length `lsCupLength` and its bound
  `lsCupLength_add_one_le_categoryCount`, and takes categorical covers and their count
  from Tau Ceti's `TauCeti.LSCategoricalCover` and `TauCeti.lsCategoryCount`; the normalized
  category is that count minus one on nonempty spaces.
- DerivedModuleAlgebra §1.1's localization of the derived limit consumes §6.0's
  homotopy-square maps for its exact-functor comparison.
- FuchsianOrbifolds (Layer 5) and HeegaardFloer consume §8.7's
  `compactManifoldFiniteCWType`, whose conclusion is Tau Ceti's `TauCeti.FiniteCWType`, and
  the Euler characteristic `TauCeti.eulerChar` of that space (§7.1); their citations of a
  finite-CW-type model structure and of a finite-CW Euler characteristic of this roadmap map
  to these two Tau Ceti declarations.
- GeneralizedCohomology (G2.1) consumes §4.7's realization CW structure on every
  simplicial set, §8.2's Kan property of simplicial groups, Moore comparison and
  realization-unit theorem, §8.10's ordinary representability (`ordinaryEMRepresentability`
  with its normalized class, and the family and relative forms) and 8.11b's ordinary
  EM loop comparison.
- HeegaardFloer consumes §6.4's compact-triad Poincaré–Lefschetz theorem with its
  degree, cap-boundary sign and coefficient-pairing conventions.
- TangentialBordism (B1.6) consumes §8.13's smoothing of maps into compact manifolds,
  parametric transversality and relative transversality for boundaryless sources, and
  extends them to sources with corners itself.
- DGFloer (Layer 1) consumes §4.10's connected-map comparison and CW approximation, §5.0's
  regradings of the filtered-complex spectral sequence, §5.5's fibration homotopy sequence
  and Serre spectral sequences, §8.3's degree-one Hurewicz isomorphism, §8.8c's abelian
  K(A,n) family and §8.8d's Hurewicz modulo a class, for its cubical transports and
  comparisons; its standing Moore-loop conventions and Layer 2 item 3 consume 8.11b's
  fixed-interval loops.
- GeneralizedCohomology consumes §4.9's simplicial-realization product comparison and
  §4.10's CW approximation (G2.1), §5.5's path fibrations and lifting functions (G2.10),
  §8.8c's abelian K(A,n) family (G2), and §5.5's Serre spectral sequences with §8.8d's
  torsion instance of Hurewicz modulo a class (G5).
- TopologicalKTheory consumes §5.5's based homotopy long exact sequence (T1.5), the CW and
  Whitehead tools of Layers 4 and 8.5 (T1.6), and §4.5's Kelley product CW structure and
  based homotopy inverses with §8.1's Kelley-product comparison of homotopy groups (T7.0).
- ComplexKahlerGeometry consumes §4.6's cell structure of complex projective space on the
  sphere-quotient carrier, which K7 compares with `Projectivization ℂ (Fin (n+1) → ℂ)`, and
  §5.0's regrading of decreasing filtrations (K8).
- CharacteristicClasses consumes §4.7's local contraction and §4.10's weak-equivalence
  comparison (C1.2), §6.2's compactly supported local-coefficient cochains (C1.2a),
  Layers 4 and 6 (C1.5), §§8.8, 8.10 and 8.12 (C1.5a, the identification of RP∞ and CP∞ as
  K(ℤ/2,1) and K(ℤ,2)), §4.5's relative CW pushout (C2.0), and §§6.4, 8.7, 8.10, 8.12, 8.13
  and 8.16 for the projective-hyperplane adapter, the embedded representatives of
  low-codimension homology classes and the Hopf instance of §8.16.
- BordismFormalGroups consumes §5.5's Serre fibrations and path–loop fibration, §8.3's
  Hurewicz theorem, §8.7's finite CW type of compact smooth manifolds, §8.8's bar model
  and §§8.8c–8.10's Eilenberg–MacLane models and universal class.

Consumers also cite former Lean names of this roadmap. `Suggested.lean` declares only the
headline theorems, so each former name maps to the section that carries its object:

- `reducedSuspensionSphereHomeomorph` and `compactReducedSuspensionCarrierComparison`
  (DGFloer, RiemannianGeometry): §4.4, the reduced-suspension sphere homeomorphism and the
  Kelley comparison of the compact reduced suspension.
- `diskQuotientSphereHomeomorph` (GeneralizedCohomology): §4.4, the disk quotient
  `Dⁿ/∂Dⁿ≅Sⁿ`.
- `supBallEuclideanDiskHomeomorph` (GeneralizedCohomology, CharacteristicClasses): §2.5, the
  sup-ball-to-disk homeomorphism, the inverse of Tau Ceti's `TauCeti.diskHomeomorphClosedBall`.
- `relativeCWPushout` and `relativeCWPushoutCWModel` (MorseTheory, CharacteristicClasses):
  §4.5, the relative CW pushout and its CW model.
- `ordinaryPairQuotient`, `ordinaryPairQuotientComparison`,
  `ordinaryPairQuotientCohomologyComparison` and `diskBoundarySubset` (GeneralizedCohomology):
  §4.5, the pair-quotient comparisons `H_n(X,B;M)≃H̃_n(X/B;M)` and
  `H^n(X,B;M)≃H̃^n(X/B;M)` for closed cofibration pairs, applied to the disk and its
  boundary sphere through §4.4's native `TopCat.disk n` and boundary inclusion.
- `ordinaryEMUniversalClass` and `ordinaryEMRelativeRepresentability`
  (GeneralizedCohomology): §8.10, the universal class, which is the class ι of
  `ordinaryEMRepresentability` for the family's model, and relative ordinary
  representability.
- `ordinaryEMLoopComparison` and `ordinaryCohomologySuspension` (GeneralizedCohomology): 8.11b,
  the EM loop comparison and the cohomology suspension.
- `projectiveEMComparisons` (GeneralizedCohomology): §8.12 for the comparison of the
  degree-one model with the circle; CharacteristicClasses C1.5a consumes it for the
  identification of `RP^∞` and `CP^∞` as `K(ℤ/2,1)` and `K(ℤ,2)` with their comparison maps.
- `poincareDualityMap_isIso` (the homotopy-sphere roadmap): §6.4,
  `poincareDuality_of_isFundamentalClass`, bijectivity of cap with a fundamental class.
- `relativeHurewicz` (the homotopy-sphere roadmap): §8.4, Tau Ceti's relative Hurewicz map
  `TauCeti.RelHomotopyGroup.hurewicz` and `relativeHurewicz_bijective`, the theorem that it is
  an isomorphism for a simply connected subspace.
- `finiteCWEulerCharacteristic` (FuchsianOrbifolds): §7.1, Tau Ceti's
  `TauCeti.eulerChar` of a space of finite CW type.
- `normalizedLSCategory` (MorseTheory): §6.2, Tau Ceti's `TauCeti.lsCategoryCount` minus one
  on nonempty spaces.
- `RelativeTwistedClassDatum` (DeRhamCohomologyAndDuality): §6.3, the relative twisted class
  datum built from the chosen local section of the homological orientation system.
- `diskBoundaryRelCW` (MorseTheory): §4.4, the relative CW structure of `TopCat.disk n`
  relative to its boundary, with one n-cell.
- `homotopyPushoutGluingComparison` (MorseTheory, CharacteristicClasses): §4.5, the
  homotopy-pushout gluing comparison along closed cofibrations.
- `cofibrationTowerHomotopyEquivalence` (MorseTheory, DGFloerPartII): §4.5, the tower homotopy
  equivalence for closed-cofibration sequences and its mapping-telescope form.
- `cwSubcomplexTowerUnion` (MorseTheory): §4.5, the CW structure on the union of a subcomplex
  tower.
- `cwProductKelley` (TopologicalKTheory): §4.5, the Kelley product CW structure on k(X×Y).
- `cwSubcomplexNeighborhoods` (ComplexKahlerGeometry): §4.5, the compatible subcomplex
  neighbourhoods with their deformation retractions.
- `basedHomotopyInverseOfEquivalence` (TopologicalKTheory): §4.5, Tau Ceti's
  `TauCeti.HasHomotopyExtensionProperty.exists_basedInverse_homotopicRel`.
- `simplicialRealizationCW` (GeneralizedCohomology, ComplexKahlerGeometry,
  CharacteristicClasses): §4.7, the realization CW structure on every simplicial set.
- `relativeCWConnectivityOfCellDimension` (GeneralAlgebraicKTheoryPartII): §8.1, Tau Ceti's
  `TauCeti.subsingleton_relHomotopyGroup_of_isEmpty_cell`.
- `homotopyGroupKelleyProduct` (TopologicalKTheory): §8.1, the Kelley-product comparison of
  homotopy groups.
- `simplicialGroupKan` (GeneralizedCohomology): §8.2, Tau Ceti's `SSet.kanComplex_of_group`.
- `simplicialGroupMooreHomotopyIso` (GeneralizedCohomology): §8.2, the Moore comparison, whose
  abelian case is Tau Ceti's
  `CategoryTheory.SimplicialObject.piAddEquivNormalizedMooreComplexHomology` and whose
  nonabelian form §8.2 owns.
- `kanRealizationUnitHomotopyIso` (GeneralizedCohomology): §8.2, the realization-unit theorem.
- `endComponents` (FourManifolds): §8.5, Tau Ceti's `TauCeti.EndComponents`.
- `stableFundamentalGroupAtEnd` (FourManifolds): §8.5, the stable fundamental group at an end.
- `properWhiteheadSimplyConnectedCW` (FourManifolds): §8.5, the proper Whitehead theorem for
  finite-dimensional locally finite CW complexes that are simply connected and simply
  connected at infinity.
- `compactTriadPoincareLefschetz` (AffineMorseLefschetz, HeegaardFloer,
  K3SurfacesAndSymplecticBoundedness): §6.4, the compact-triad Poincaré–Lefschetz theorem.
- `basedLoopCWType` (RiemannianGeometry, Poincare3D, GeneralAlgebraicKTheoryPartII): 8.11a,
  the CW type of the based loop space.

### Dependency order

In the table below, bare references to Layer 6 mean the ordinary 6.0–6.5
cohomology and duality part. They do not include the separate supported-cellular
supplement or the categorical Lusternik–Schnirelmann supplement unless named explicitly.

| Layer | Depends on | Can proceed alongside |
| --- | --- | --- |
| 1 van Kampen | Mathlib  | 2--8 |
| 2 relative homology | Mathlib  | 1 |
| 3 subdivision/excision | 2 | 1 |
| 4 CW/cellular and raw quotient comparisons | 2--3, native cochain algebra, Layer 4.8 for kified CW products; Layer 4.4 for normalized raw quotient comparisons; 2.5 supplies sphere reference shuffles; general cohomological product/suspension compatibility belongs to 8.11b | 1 |
| 4.9 realization of a product of simplicial sets | 4.5 Kelley product CW structure, 4.7 realization CW structure, 4.8 coreflection | 1, 5–8 |
| 4.10 connected maps/weak equivalences/CW approximation | 2--4, Tau Ceti's homotopy groups, weak-equivalence invariance and CW approximation of path-connected spaces, and 4.5's mapping-cylinder/cofibration API | 1 |
| 5.0 filtered-complex spectral sequence | Tau Ceti's filtered-complex spectral sequence; 6.0's Milnor/lim¹ sequence for complete convergence | 1--4, 6.0 |
| 5 product maps (item 1) | 2 | 1, 3, 4 |
| 5 bundles/covers/finite covers | 2--4; Tau Ceti Serre-fibration API; homotopy LES, path fibrations and homology SS from 1–4, 4.10 and 5.0; cohomology SS additionally from independent 6.0–6.2 | 1 |
| 6.0 homotopy-square maps | Tau Ceti tower algebra and Mathlib mapping cones only | 1–5, 7–8 |
| 6.0 topological tower adapters | 2–4; Tau Ceti tower algebra; 6.0 homotopy-square maps | 5, 7–8 |
| 6.1--6.4 cohomology/duality | 6.0 for 6.1 skeletal limits; 2--3, Layer 5 item 1 product maps, DifferentialGeometry Layer 2 tangent orientations, DifferentialGeometry Layer 5.1 outward-first boundary conventions and §2.5's local sphere comparison, native smooth local boundary charts plus the compact-domain Brown topological collar, and Layer 4.4's εₙ/radial native-sphere bridge used by 6.3; Layer 4 for cellular comparisons/RP² | 1 |
| categorical-cover/cup-length supplement after 6.2 | native opens/homotopies/ENat; 2–3, 5.1 and ordinary 6.1–6.2, plus the direct point-chain contraction; no manifold duality or Morse input | 6.3–6.5 |
| supported-cellular comparison after ordinary 6.2 | ordinary 4 cellular data, ordinary 6.1–6.2; owns the compactly supported local-coefficient cochains, proves countability and the finite-support cellular/singular comparison | ordinary 6.3–6.5, Layer 7 and ordinary 8 proceed independently; proper 8.5 uses the needed support interfaces |
| 6.5 linking/degree consequences | 2--4 and ordinary 6.1--6.4; DifferentialGeometry Layer 10's smooth mapping-degree comparison only after the independent Layer 6.3 classes | 1 |
| 6.6 product-ball intersection | 2.5 reference classes and local generator, native excision, 5.1 relative cross products, the 6.3 determinant sign and the 6.5 degree normalization | 1, 7–8 |
| 7 Euler characteristic | 2--6; Tau Ceti's Euler characteristic and standard values | 1 |
| 8.1–8.7 Hurewicz/Whitehead | 2--4, 4.10 for 8.3's connected-map comparison, and the cited external roadmaps; proper 8.5 additionally the supported-cellular supplement's compactly supported cochains, proper pullback, jointly proper homotopy invariance, cellular comparison and countability | 1, 5; ordinary Hurewicz/Whitehead also alongside ordinary 6–7 |
| 8.8a raw bar/abelian input | 4, ordinary 6, native nerve/realization and universal-cover APIs; ClassifyingSpaces items 1.1 and 1.2 for the pointed classification of maps into Bπ | 8.8c's abelian K(A,1) specialization |
| 8.8b normalized model comparison | Layer 8.8a bar model; Tau Ceti's Milnor model, uniqueness theorem and group-(co)homology identifications (supplier contracts) | 8.9 |
| 8.8c abelian EM family | 4.7, 4.10, 8.1–8.8a, 8.2's Kan/Moore comparison and 5.5's based path fibration for the loop identification; no 8.9–8.12 input | 7 |
| 8.8d Serre classes/Hurewicz modulo a class | 4.10, 5.3 transfer, 5.5 Serre sequences and path fibrations, 8.3–8.5, 8.8b, 8.8c; Tau Ceti's torsion Serre classes | 7 |
| 8.9 primary relative obstructions | 4, 5.5 fibre transport, ordinary 6 cellular cochains, 8.1–8.7 | 8.8b |
| 8.10 ordinary representability | 4, ordinary 6, 8.3 including the degree-one Hurewicz isomorphism, 8.6, 8.8c, 8.9, 4.9's simplicial-realization product comparison and Layer 4.8 kification and Layer 4.4 normalized comparisons; for arbitrary Eilenberg–MacLane spaces Tau Ceti's weak-equivalence lifting, homology invariance, universal coefficients and Hurewicz/Kronecker naturality | 7 |
| 8.11a mapping-space and based-loop CW type | Earlier CW/pair foundations (4) and Layer 4.8 compact-generation/product API and Layer 4.4 normalized comparisons; no 8.10 or the EM loop comparison input | 7 |
| 8.11b ordinary EM loops | 4.10's CW approximation, 8.5, 8.10, 8.11a, Layer 4.8 compact generation and foundational adjunction, with Layer 4.4 normalized comparisons, 4.9's simplicial-realization product comparison | 7 |
| 8.12 classical EM comparisons | 8.8a, 8.8b, 8.10 and Tau Ceti's `AddCircle` Eilenberg–MacLane instance and circle comparison; no projective carrier | 7 |
| 8.13 smooth low-codimension representatives | 8.7 finite CW type, 8.10 and 8.12 for the circle classifying map, and its own smoothing of maps into compact manifolds, parametric transversality and relative transversality (Mathlib `exists_embedding_euclidean_of_compact` and `Continuous.exists_contMDiff_approx_and_eqOn`, GeometricTopology Layer 1 tubular neighbourhoods, Tau Ceti's slice-chart implicit function theorem and flat Morse–Sard theorem) | 7 and 8.11b |
| 8.14–8.16 applications | 4.1 lifted CW structures, 6.1 universal coefficients, 6.3 noncompact top-degree vanishing and Tau Ceti's compact-manifold vanishing, 8.1–8.8 and 8.10; 8.14 additionally ClassifyingSpaces items 1.1 and 1.2 for its case n=1; 8.16 additionally 4.4, 6.5 and 5.5's homotopy lifting for Serre fibrations | 7 and 8.13 |

In particular, Layer 1 is independent; the chain `2 -> 3 -> 4` is strict; Layers 2--4 all feed
Layer 5, except that Layer 2 alone feeds the product maps of Layer 5 item 1; and every layer from
2 through 6 feeds Layer 7.  No implementation may reverse one of these arrows by assuming a
downstream comparison theorem as input.

## Worked examples

- A two-open-set cover with disconnected intersection is handled by the groupoid colimit and
  yields the correct based theorem only after explicit basepoints are chosen.
- Relative homology of `(D^n,S^(n-1))` and the connecting morphism to the sphere generator have
  the pinned sign.
- Mayer--Vietoris is derived from excision and agrees with the map induced by inclusions; it is
  not supplied as an unrelated exact sequence.
- The cellular differential of a two-cell attachment of degree `m` is multiplication by `m`,
  and cellular homology compares naturally with singular homology.  At chain level the comparison
  is a filtered/derived equivalence or is natural up to displayed chain homotopy, not a strictly
  natural choice of singular representatives.
- The field, PID or hereditary-ring, and general-ring Kunneth and universal-coefficient theorems
  have distinct statements; neither short exact sequence is advertised over an arbitrary ring.
- Transfer for a constant-degree-`d` finite cover satisfies `p_* transfer = d * id` on chains and
  on homology, including the induced map on `H_0`, even for zero sheets. A surjective regular
  cover also satisfies the deck-sum
  formula and has the stated Cartan--Leray spectral sequence; the torus calculation is natural
  under integer matrices.
- The Serre spectral sequence starts from an explicit Serre fibration, exposes the monodromy local
  system, is natural under maps of fibrations, and proves finite-CW bundle Euler multiplicativity.
  Trivial monodromy makes the `E^2` coefficients constant but does not imply collapse: the Hopf
  fibration and the product `S^1 times S^2 -> S^2` are a required comparison, with identical
  constant-coefficient `E^2` pages and different abutments.
- Natural-number-indexed cap product and Poincare duality carry the complementary-degree
  hypothesis `p <= n`.  In particular no above-dimension cohomology group of a connected closed
  manifold is identified with `H_0` by truncated subtraction.
- Poincare--Lefschetz duality uses the boundary orientation from the shared manifold API and
  produces the correct sign in the cap-product boundary formula.
- Nonorientable checks use RP²'s orientation system: `H^0(RP²;or)=0`
  corresponds to `H_2(RP²;ℤ)=0`, and `H^2(RP²;or)≃ℤ` to `H_0(RP²;ℤ)`.
  Both sides are computed independently by Layer 4.6 and Layer 6.1
  cellular calculations on the single Layer 4.6 carrier, with the coefficient
  identification proved in Layer 6.3. The twisted relative fundamental class has canonical local images and
  boundary equal to the outward-first class of the boundary.
- The singular and cellular skeletal restriction towers have degreewise surjective
  restriction maps, and their limits are the cochains of the whole pair; Tau Ceti's
  Milnor maps and the homotopy-square maps of 6.0 transport along the
  cellular/singular comparison with its chosen homotopies. On the point tower
  δ(3,1,0,…) = (2,1,0,…) and lim¹ = 0; on the one-vertex circle the degree-one limit
  is M and H¹(S¹;M) = M.
- Torsion linking has complementary degrees, target `AddCircle (1 : ℚ)`, the displayed symmetry
  sign, and nonsingularity under the stated finite-generation hypotheses.
- Euler characteristic gives the standard values on spheres, tori, and complex projective
  spaces and proves both additivity and finite-cover multiplicativity from earlier maps.
- Homological Whitehead produces a homotopy inverse to the given homology equivalence between
  simply connected CW-type spaces; it does not merely assert that some unrelated equivalence
  exists.
- The relative-homotopy API does not make `pi_2(X,A)` a `Z`-module in general.  Its
  degree-two Hurewicz theorem derives the needed commutativity from connectivity, while the direct
  module-valued carrier starts in degree three.
- Every relative-homotopy group, induced map, boundary morphism, long exact sequence, and Hurewicz
  map takes a based top pair; its point lies in the subspace and all maps preserve it. The API
  cannot construct `pi_n(X,A)` from an unbased `TopPair` or from an empty subspace.

- Ordinary representability's pullback map is bijective on arbitrary CW complexes and
  spaces of CW type, including disconnected and infinite-dimensional ones, for every
  Eilenberg–MacLane space of positive degree, and additive on the family's models for every
  abelian coefficient group. Degree zero uses component functions; relative maps fix the subcomplex.
- The normalized universal class evaluates to the identity on the distinguished homotopy
  group, and the ordinary loop comparison induces that identity with the pinned suspension sign.
- A fixed n-skeleton extends exactly when its obstruction cochain vanishes. Vanishing of
  its cohomology class permits alteration of the n-skeleton relative to the lower skeleton
  and the specified subcomplex. Fibre transport and difference signs agree with these maps.
- Every integral degree-one class of a compact boundaryless smooth manifold has a smooth
  circle-valued classifying map transverse to 1, whose fibre over 1 is a compact embedded
  codimension-one submanifold with framed normal; homotopic transverse classifying maps
  have fibres joined by an embedded bordism.
- The continuous product-ball maps of §6.6 meet in the original product of balls, with no
  smoothness or transversality hypothesis, and the boundary-degree form detects the
  intersection through the coefficient (−1)^q·d_f·d_g.

## References

- Ronald Brown, *Topology and Groupoids*, 3rd ed., Booksurge, 2006, Theorem 6.7.2 (p.240),
  6.7.5 (p.248), §6.7 Exercises 2 (p.249) and 6 (p.250), the Lebesgue covering lemma
  3.6.4 (p.91), and 7.4.2 with its Addendum (pp.285–286) for homotopy inverses of maps of
  cofibrations.
- Samuel Eilenberg and Norman Steenrod, *Foundations of Algebraic Topology*, Princeton
  University Press, 1952, Chapters I--III.
- Allen Hatcher, [*Algebraic Topology*](https://pi.math.cornell.edu/~hatcher/AT/AT.pdf),
  Chapter 0, Sections 1.2, 1.B, 2.1--2.3, 2.A, 2.C, 3.1--3.3, 3.B, 3.C, 3.G--3.H, 4.1--4.3 (with §4.2
  Exercises 13, 16, 17, 26, 28 and 34, pp.390–392), and the Appendix (with its Exercise 1,
  p.529).
- René Thom, *Quelques propriétés globales des variétés différentiables*, Commentarii
  Mathematici Helvetici 28 (1954), 17--86, Chapter II, for the representability of mod 2
  classes of codimension one and of integral classes of codimension one and two by
  embedded submanifolds.
- John M. Lee, *Introduction to Smooth Manifolds*, 2nd ed., Springer GTM 218, 2012,
  Theorems 6.26, 6.30, 6.35 and 6.36, for Whitney approximation into manifolds, transverse
  preimages, and parametric and relative transversality.
- Allen Hatcher, [*Spectral Sequences in Algebraic Topology*](https://pi.math.cornell.edu/~hatcher/SSAT/SSch1.pdf),
  Chapter 1, Theorem 1.3 (p.8) and the local-coefficient version (p.17), and Theorem 1.8
  (p. 14) with the joint proof of Theorems 1.7 and 1.8 (p. 16) for Hurewicz modulo the
  finitely generated, torsion and finite classes.
- Allen Hatcher, [*Vector Bundles and K-Theory*](https://pi.math.cornell.edu/~hatcher/VBKT/VB.pdf),
  Appendix to Chapter 1, Proposition 1.20 (p.36), and §3.3, Lemma 3.18 (p.100) and
  Proposition 3.19 (p.101).
- George W. Whitehead, *Elements of Homotopy Theory*, Springer GTM 61, 1978,
  Chapters II--VII.
- Albrecht Dold, *Lectures on Algebraic Topology*, Springer, 1972, Chapters VII--VIII.
- J. Peter May, [*Simplicial Objects in Algebraic Topology*](https://www.math.uchicago.edu/~may/BOOKS/Simp.pdf),
  University of Chicago Press, 1967, §3 for homotopy groups of Kan complexes, §14, Theorem 14.1,
  for the CW structure of the geometric realization of a simplicial set, and §17 for
  simplicial groups and the Moore complex.
- John C. Moore, [*Homotopie des complexes monoïdaux, I*](https://www.numdam.org/item/SHC_1954-1955__7_2_A8_0/),
  Séminaire Henri Cartan 7 (1954–1955), no. 2, exposé 18, pp. 1–8: Théorème 3 (p.18-04, a
  simplicial group satisfies the extension condition), Théorème 4, Définition 4 and
  Théorème 5 (pp.18-06–18-08, the homotopy groups of a simplicial group from its Moore
  complex and their commutativity).
- The Stacks project authors, [*The Stacks project*, Chapter 14: Simplicial Methods](https://stacks.math.columbia.edu/download/simplicial.pdf),
  Lemma 14.31.6 ([Tag 08NZ](https://stacks.math.columbia.edu/tag/08NZ)): a simplicial group
  is a Kan complex.
- The Stacks project authors, [*The Stacks project*, Chapter 15: More on Algebra](https://stacks.math.columbia.edu/download/more-algebra.pdf),
  Lemma 15.65.4 ([Tag 0H7Z](https://stacks.math.columbia.edu/tag/0H7Z)): the Künneth
  spectral sequence of two complexes with bounded cohomology over a ring.
- Jean-Pierre Serre, *Homologie singulière des espaces fibrés. Applications*, Annals of
  Mathematics 54 (1951), 425--505, for the homology spectral sequence of a fibration.
- John McCleary, *A User's Guide to Spectral Sequences*, 2nd ed., Cambridge University Press,
  2001, Chapters 1--2.
- Charles Weibel, *An Introduction to Homological Algebra*, Cambridge University Press, 1994,
  Chapters 3 and 5, for `Tor`, `Ext`, and the Kunneth and universal-coefficient spectral sequences,
  and Theorems 5.5.1 and 5.5.10 for the classical and complete convergence of the spectral
  sequence of a filtered complex.
- Tammo tom Dieck, *Algebraic Topology*, EMS Textbooks in Mathematics, European Mathematical
  Society, 2008, Theorem 9.5.1, for the homology comparison of connected maps.
- Jean-Pierre Serre, *Groupes d'homotopie et classes de groupes abéliens*, Annals of
  Mathematics 58 (1953), 258--294, Chapter I for the axioms on classes and Chapter III,
  Theorem 1, for Hurewicz modulo a class.
- Kenneth Brown, *Cohomology of Groups*, Springer GTM 87, 1982, Chapter VII, for the
  Cartan--Leray spectral sequence and transfer comparison.

- John Milnor, *Morse Theory*, Annals of Mathematics Studies 51, Princeton University Press,
  1963, Lemmas 3.6 and 3.7.
- Arne Strøm, [*Note on cofibrations II*](https://journals.msp.org/mscand/article/download/2424/2423),
  Mathematica Scandinavica 22 (1968), 130–142, Theorem 6 (p.135).
- R. M. Vogt, [*A note on homotopy equivalences*](https://www.ams.org/journals/proc/1972-032-02/S0002-9939-1972-0293632-8/S0002-9939-1972-0293632-8.pdf),
  Proceedings of the American Mathematical Society 32 (1972), 627–629, Proposition (p.627).
- James Dugundji, [*An extension of Tietze's theorem*](https://msp.org/pjm/1951/1-3/pjm-v1-n3-p04-s.pdf),
  Pacific Journal of Mathematics 1 (1951), 353–367, Theorem 4.1 (p.357), Corollary 4.2
  (p.358), §7 (p.363) for the Kuratowski–Wojdysławski embedding, Theorem 7.1 (p.363), and
  Theorem 7.5 (p.365) for the factorization of maps into an ANR through a polytope.
- F. Thomas Farrell, Laurence R. Taylor and John B. Wagoner, [*The Whitehead theorem in the
  proper category*](https://www.numdam.org/item/CM_1973__27_1_1_0.pdf), Compositio Mathematica
  27 (1973), 1–23, §§1–4, Theorem 4.2 and Corollary 4.9.
- Michael H. Freedman and Frank Quinn, *Topology of 4-Manifolds*, Princeton University Press,
  1990, §7.7.
- John Milnor, [On Spaces Having the Homotopy Type of a CW-Complex](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/milnorcw.pdf), Theorem 2, p.273, for the n-ad CW-type comparison, and Theorem 3 and Corollary 3, p.276, for function-space and based-loop CW type; its countable class W₀ is distinct from the general class W used here.
- John R. Klein, Cary Malkiewich and Maxime Ramzi, [*On the multiplicativity of the Euler
  characteristic*](https://arxiv.org/abs/2211.04992v2), arXiv:2211.04992v2 (2023),
  Introduction, pp.1–2, for fibration sequences of finite complexes, and Theorem A, p.2, for
  finitely dominated fibre and base; page numbers are those of the arXiv version.

- Anthony Conway, Stefan Friedl and Gerrit Herrmann, [*Linking forms revisited*](https://intlpress.com/site/pub/files/_fulltext/journals/pamq/2016/0012/0004/PAMQ-2016-0012-0004-a003.pdf), Pure and Applied Mathematics Quarterly 12 (2016), 493–515, Proposition 1.2, p.494, Lemma 2.5, p.502, and Lemma 2.6, pp.503–504.

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
   holds in every universe and relative Hurewicz for a simply connected subspace; homological
   Whitehead is proved for CW complexes and then for spaces of CW type.  The cubical and
   Kan-simplicial models of homotopy groups are naturally compared rather than allowed to form
   separate incompatible APIs.
7. Singular and cellular restriction towers are compared with cochains on the whole
   CW pair, using Tau Ceti's lim/lim¹ and Milnor sequences, with
   cofinal-shift naturality and the specified-homotopy-square maps of Layer 6.0.

8. Ordinary cohomology is represented on arbitrary CW complexes and CW pairs by the shared
   Eilenberg–MacLane models; nonabelian classifying spaces, universal classes, loop comparisons,
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
  and the integral local homology system, homological orientations and integral fundamental
  classes of closed manifolds. The supplier contracts name each declaration and file; the
  layers below build only what those files lack.
- The [universal-covers roadmap](../../Completed/UniversalCovers/README.md) owns universal-cover
  construction, deck transformations, quotient covers, basepoint change, and induced maps on
  homotopy groups.  This roadmap consumes those maps, extends the higher-homotopy API with
  relative groups and comparison theorems, and does not construct another universal cover.
- The [geometric-topology roadmap](../GeometricTopology/README.md) owns smooth and PL
  triangulations, manifold boundaries and collars, gluing, connected sum, cobordism carriers,
  and geometric surgery.  This roadmap owns algebraic topology of CW pairs and proves results
  about any space of CW type. The finite-dimensional Hausdorff second-countable
  smooth-manifold CW comparison consumes geometric topology's smooth triangulation;
  compact manifolds have finite CW type.
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
  declarations, and nothing of it is consumed here. Layer 8.8 owns only the nerve model:
  Layer 8.8a the raw nerve/bar construction and its K(G,1) property, Layer 8.8b its
  comparison with Milnor's model normalized to the identity on π₁, obtained from Tau Ceti's
  uniqueness theorem, and the transport of the native group-(co)homology identifications
  along that comparison. The raw bar also supplies the abelian input used by DGFloer
  Layer 1 item 4.
- [DGFloer](../DGFloer/README.md) Layer 1 item 4 owns the single functorial
  abelian K(A,n) family: its degree-one model aliases Layer 8.8's generic bar
  construction, and n≥2 uses the fixed Dold–Kan Γ(A[n]) realization. It owns
  the coefficient-natural normalized π_n identification, including comparison
  of Γ(A[1]) with the abelian nerve. Layer 8.8 owns the generic discrete-group
  bar/CW/cover proof and consumes no DGFloer EM constructor. Layer 8.10
  consumes that abelian family and DGFloer Layer 1 item 1's degree-one Hurewicz.
  DGFloer's constructor uses only Layers 8.1–8.7 and 8.8a, preceding representability and
  obstruction theory. Its Layer 1 item 2 owns homotopy lifting for a Serre fibration
  against every relative CW pair, the fibration homotopy long exact sequence (LES) and
  the ordinary Serre spectral sequences. The Serre-fibration morphism property itself,
  with its disc and cube characterizations, base change and the covering-map,
  product-projection and locally-trivial-bundle instances, is Tau Ceti's
  `TauCeti.TopCat.serreFibrations` (supplier contracts): this roadmap and DGFloer both
  consume it, neither restates it, and 5.5 applies DGFloer's sequence targets to it.
  DGFloer's CW approximation is used in 8.11b.
  The standing Moore-loop comparison and Layer 2 item 3 supply loop carriers.
- Layer 4.8 is the single owner of the compact-generation coreflection, convenient
  products, exponentials, CW comparisons and the foundational pointed suspension–loop
  adjunction. Pointed cones, Puppe sequences and stabilization are consumers of this
  foundation and of this roadmap's cofibration and relative-homotopy results; supply
  runs from this roadmap to those applications. Layer 4.4 owns the
  additional raw-quotient comparisons
  and their interval-last normalization. GeneralizedCohomology G2.1 owns the
  simplicial-realization product comparison from these foundations,
  without ordinary representability.
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
- [Topological K-theory](../TopologicalKTheory/README.md) T1.6 owns the named
  fixed-rank infinite Grassmannian carriers, their final/weak CW topology and
  universal bundles. [CharacteristicClasses C1.5](../CharacteristicClasses/README.md)
  owns the finite-projective/cellular/cup comparisons on their rank-one RP∞
  and CP∞ carriers. Layer 8.12 consumes that construction/comparison portion
  and owns only their identification as ordinary EM spaces. Those portions
  use earlier CW/cohomology tools and do not consume Layer 8.12.
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
  Statements that must elaborate without `TauCeti.CWType` take that model C⊆K and
  the homotopy equivalence as explicit hypotheses, which is the same condition.
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
  topology and continuity criterion. Layer 4.8 packages these into the categorical
  coreflection and pointed constructions; it does not redefine the topology.
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
  extending the comparisons and local-coefficient theory below.
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
  relative and general-ring forms.
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
  `AlgebraicTopology.Homotopy.Whitehead`. Simple connectivity at infinity is
  `TauCeti.SimplyConnectedAtInfinity` (`AlgebraicTopology.Homotopy.SimplyConnectedAtInfinity`).
  Proper homotopy equivalences are `ContinuousMap.HasProperHomotopyInverse`
  (`Topology.Homotopy.Proper`: a proper map with a proper homotopy inverse and both homotopies
  proper on the whole cylinder).
- Local homology and orientations in `AlgebraicTopology.Singular.LocalHomology`: the integral
  local homology system of a topological manifold with its transport along paths, local
  orientations, `TauCeti.HomologicalOrientation M E n`, and for a compact oriented manifold its
  integral fundamental class `TauCeti.HomologicalOrientation.fundamentalClass`, the unique class
  with the given local images. Layer 6.3 consumes these for boundaryless manifolds and integral
  coefficients.
- Tau Ceti's native `FundamentalGroupoid.cechDiagram`, `cechCocone` and
  `isColimitCechCocone` in `FundamentalGroupoid.Cech.Diagram`/`Colimit`, using
  the `Grpd` category and native nonempty finite-intersection `CechIndex`.
  Its map/refinement modules supply functoriality; consume the colimit and
  extend the group-presentation and example consequences below.
- Native `TopPair.excisionMap` and its singular-homology isomorphism theorems
  in `Singular.Excision`, and `TopCat.mayerVietorisδ`/`mayerVietoris_exact₁`–`₃`
  in `Singular.MayerVietoris.Basic`, with subdivision and small-chain suppliers.
  Consume these maps and extend them to local coefficients.
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
  the disc case of Hatcher Proposition 4.48, whose relative-CW form follows with DGFloer
  Layer 1 item 2's lifting against relative CW pairs); and `TauCeti.TopCat.exists_lift_openBox_of_mem_serreFibrations`
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
- `HomotopyGroup`, based cubes, `ContinuousMap.HomotopyEquiv`, mapping cones and pointed cones,
  category-theoretic colimits, chain homotopies, homology functors, and exact couples.

### From TauCetiRoadmap.UniversalCovers

Universal-cover construction, deck transformations, quotient covers, basepoint change
and the induced maps on homotopy groups (the completed roadmap). Layer 8 consumes the
induced-map and basepoint API with its path-connectedness hypotheses; nothing here
constructs another universal cover.

### From TauCetiRoadmap.GeometricTopology

The smoothing-and-triangulation comparison, item 1 (smooth triangulation and its
realization homeomorphism), consumed by 8.7 for CW type of smooth manifolds; Layer 1's
boundary, collar and two-sided tube conventions, consumed by 6.3–6.4 for the compact
codimension-0 excision comparisons; Layer 11's ordered-complex realization, cited by 4.7
only as a consumer route. Every use keeps the smooth, Hausdorff and second-countable
hypotheses of those items.

### From TauCetiRoadmap.DifferentialGeometry

Layer 2 (tangent orientations, `orientationAt`, `Orientation.map`, Layer 2.2 pullback
along local diffeomorphisms) and Layer 5.1 (the outward-normal-first boundary
orientation), consumed by 6.3. The sphere comparison with the coordinate-local
generator is constructed in §§2.5 and 6.3 here; Layer 10's smooth
mapping degree, consumed only by 6.5's comparison; 10.5 consumes Tau Ceti's Brouwer theorem
(supplier contracts), not a theorem of this roadmap. Layer 9.3 consumes 6.3's classes and is not a supplier of them.

### From TauCetiRoadmap.DGFloer

Layer 1 item 1 (degree-one Hurewicz), consumed by 8.3 and 8.10; item 2 (CW approximation,
homotopy lifting for a Serre fibration against every relative CW pair, the fibration
homotopy long exact sequence and the homological and cohomological Serre spectral
sequences, all on Tau Ceti's `TauCeti.TopCat.serreFibrations`), consumed by 5.5, 8.3,
8.9, 8.11b and 8.12; item 3 (the spectral sequence of a filtered
complex), consumed by 5.5; item 4 (the functorial abelian K(A,n) family with its
normalized π_n identification), consumed by 8.10; Layer 2 item 3 (fixed-interval loop
comparisons), consumed by 8.11b. Each is used with its path-connectedness and CW
hypotheses.

### From TauCetiRoadmap.GeneralizedCohomology

G2.1's realization product comparison identifying the realization of a product of
simplicial sets with the Kelley product of the realizations, consumed by 8.10 and 8.11b
for addition in represented cohomology; it is used in its foundation-only form, before
any represented theory.

### From TauCetiRoadmap.TopologicalKTheory

T1.6's fixed-rank infinite Grassmannian carriers with their final/weak CW topology and
universal bundles, consumed by 8.12 for the rank-one RP∞ and CP∞ carriers; T7.0 is a
consumer of 4.5 and 8.1.

### From TauCetiRoadmap.CharacteristicClasses

C1.2a's compact-support interfaces S0–S4 (support enlargement, cofinality, proper
pullback, jointly proper homotopy invariance), consumed by the supported cellular
comparison after 6.2 and by proper Whitehead in 8.5, with S5 as a separate compatibility
check; C1.5's finite-stage projective comparisons and classes, consumed by 8.12; C1.2b
and C2.0 are consumers.

### From TauCetiRoadmap.ComplexKahlerGeometry

K7's complex projective spaces CPⁿ with their complex orientation, consumed only by 8.12's
identification of CP∞ as K(ℤ,2) and its generator normalization ⟨h,[CP¹]⟩=+1. The value
χ(CPⁿ)=n+1 is Tau Ceti's (supplier contracts), not a consumption of K7.

Each use below retains the supplier's hypotheses and names the needed portion.

## How to read the build

Layers 1 and 2 establish groupoid and chain interfaces; Layer 3 supplies local-coefficient
excision, Layer 4 CW and raw-quotient comparisons in convenient pointed topology, and Layer 5 product,
cover and bundle tools. Layer 6 builds topological tower comparisons, cohomology and duality; Layer 7
adds the bundle formula to Tau Ceti's Euler characteristic. Layer 8 reaches Hurewicz, Whitehead, representability
and obstruction theory. Item-specific inputs separate the independent tower and
product foundations from later applications.

Other roadmaps cite this one in the form "AlgebraicTopology Stage k item m" and by
heading anchors `stage-k-…`. Stage k is Layer k, with the same title, so the anchor
`stage-k-<title>` is the anchor `layer-k-<title>`, and item m of Stage k is §k.m:

- Stage 1 items 1–6 are §§1.1–1.6.
- Stage 2 items 1 and 3–6 are §§2.1 and 2.3–2.6; Stage 2 item 2, the relative homology
  functor and its comparison with absolute homology, is Tau Ceti's
  `TopPair.singularHomologyFunctor` and `TopPair.singularHomologyInclIso`, and Stage 2 item 7,
  the no-retraction and Brouwer fixed-point theorems with the finite-span form, is Tau Ceti's
  `TauCeti.noRetraction_diskBoundary` and `TauCeti.brouwerFixedPoint_*` (supplier contracts).
- Stage 3 items 1–5 are §§3.1–3.5.
- Stage 4 items 1–8 are §§4.1–4.8; item 8 is compact generation and the pointed adjunction.
- Stage 5 items 1–7 are §§5.1–5.7; the Serre-fibration predicate used by item 5 is Tau
  Ceti's (supplier contracts).
- Stage 6 items 0–5 are §§6.0–6.5; of item 0, the generic tower algebra other than the
  homotopy-square maps is Tau Ceti's `TauCeti.ModuleTower` (supplier contracts).
- Stage 7 items 1–4 are §§7.1–7.4.
- Stage 8 items 1–12 are §§8.1–8.12, with 8.8a/8.8b and 8.11a/8.11b as subdivisions.

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

*Needs:* §1.1; native fundamental groups and path/basepoint change.

Consume the native cocone to `FundamentalGroupoid X` and its colimit universal property,
   including naturality under maps of covered spaces and refinement of covers.
   Derive the based presentation: if X is covered by path-connected open sets U_i, each
   containing the basepoint x₀, with path-connected pairwise intersections, the homomorphism
   from the free product of the π₁(U_i,x₀) to π₁(X,x₀) induced by the inclusions is surjective;
   if moreover every triple intersection is path connected, its kernel is the normal subgroup
   generated by the elements i_ij(ω)·i_ji(ω)⁻¹ for ω in π₁(U_i∩U_j,x₀), where i_ij is induced by
   U_i∩U_j⊆U_i (Hatcher, Theorem 1.20, p.43). The pairwise hypothesis is needed: the circle
   covered by two open arcs through x₀ has an intersection with two components, each
   π₁(U_i,x₀) is trivial, and the trivial free product does not map onto π₁(S¹,x₀)=ℤ; the
   groupoid colimit of §1.1 over both components recovers ℤ.
### 1.4 Two-open pushouts

*Needs:* Native two-open groupoid and based-group pushouts; explicit path-connectedness hypotheses.

Consume native groupoid and fundamental-group two-open-set pushouts and the based theorem when the two opens and their
   intersection are path connected and contain the basepoint.  Derive iterated finite-cover and
   group-presentation corollaries.
### 1.5 Circle and wedge calculations

*Needs:* Native circle and wedge-of-circles groupoid calculations.

Consume the native groupoid calculation on a circle covered by two arcs with disconnected intersection and
   on a wedge of circles.  The first check must use more than one basepoint and the second must
   consume the native wedge-of-circles free-group equivalence and recover its presentation maps.

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
### 2.3 Pair and triple sequences

*Needs:* Native pair/triple short exact sequences and their connecting maps.

Consume the native short exact sequence of chain complexes for a pair and its natural long
   exact sequence, with its connecting morphism (the class of the boundary of a relative
   cycle) and naturality square (Hatcher, §2.1, p.117).  Do the same for triples
   `B subset A subset X`, from the short exact sequence `0 → C_n(A,B) → C_n(X,B) → C_n(X,A) → 0`
   (Hatcher, §2.1, p.118).
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
   Prove its cycle/generator property and boundary-facet signs. Own
   the cube-to-sup-ball homeomorphism t↦(2t_j−1)_j from Iⁿ to the native
   sup-norm closed unit ball in Fin n→ℝ. Own the sup-ball-to-disk homeomorphism
   x↦(‖x‖_∞/‖x‖₂)x for x≠0 and 0↦0, using the native coordinate linear
   equivalence to EuclideanSpace. Pin these actual formulas and boundary
   images for all n≥0. Their positive radial factors preserve the ordered
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
   the native relative chains and shuffles named above. The radial formula has inverse y↦(‖y‖₂/‖y‖∞)y away from 0;
   finite-dimensional norm bounds give continuity at 0, while both denominators
   are positive off 0. The sphere class is obtained by excision and the
   local-image characterization (Lemma 3.27, p.236). The normalization and
   radial comparisons are the constructions here, not an additional claim
   attributed to those source statements.

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
   comparison; extend their naturality and remaining APIs. Construct the pair/triple short
   exact sequences and their natural long exact sequences. Prove homotopy
   invariance with the coefficient-system identification transported along the
   homotopy, including relative homotopies (Hatcher, §3.H, p.333: the pair sequence, excision
   and additivity for homology with local coefficients, and homotopy invariance through the
   pullback of the coefficient bundle along the homotopy). This uses the existing groupoid
   object and does not depend on Layer 1's van Kampen theorem.

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

Every subdivision, prism, small-chain, excision and Mayer–Vietoris construction
in this layer includes Layer 2's local coefficient systems. Transport along
paths in each contractible simplex gives its subdivision coefficients; prove
naturality in both space maps and coefficient-system morphisms, and compatibility
with the pair/triple connecting maps.

### 3.1 Subdivision and the prism

*Needs:* §2.6; native singular subdivision and prism formulas, with local transport.

Define affine subdivision of the standard simplex and barycentric subdivision of singular
   simplices in every degree.  Prove the boundary formula and construct the prism operator giving
   a chain homotopy from subdivision to the identity, with the barycentric cone formulas
   `Sd λ = b_λ·Sd(∂λ)` and `T λ = b_λ·(λ − T∂λ)` and the identity `∂T + T∂ = id − Sd`
   (Hatcher, Section 2.1, pp.121–122).

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
### 3.2 Small chains

*Needs:* §3.1; compactness of the standard simplex and the Lebesgue-number lemma.

For an open cover, prove that every singular simplex becomes subordinate after sufficiently
   many subdivisions.  Turn the small chains into a subcomplex and prove its inclusion is a
   natural chain-homotopy equivalence.
### 3.3 Local-coefficient excision

*Needs:* §§2.3, 2.6 and 3.2; native ordinary excision.

Consume native excision for `TopPair` and extend to local coefficients: if the closure of the excised set lies in the interior of the
   subspace, the induced map on relative homology is an isomorphism (Hatcher, Theorem 2.20,
   p.119; §3.H, p.333, for local coefficients).  Include maps of excision
   data and compatibility with the pair connecting morphism.
### 3.4 Local Mayer–Vietoris

*Needs:* §3.3 and the native ordinary Mayer–Vietoris connecting map.

Consume native Mayer--Vietoris for a binary open cover and extend its natural
   long exact sequence to local coefficients (Hatcher, §2.2, p.149; §3.H, p.333).  Prove that
   its first map is `(i_U, -i_V)` under the pinned sign convention.
### 3.5 Sphere calculations

*Needs:* §3.4; disk/sphere normalization of §2.5.

Check Mayer--Vietoris on `S^1` from two arcs and on `S^n` from two hemispherical
   neighbourhoods, including the connecting isomorphism in top degree (Hatcher, Example
   2.46, p.150; the two-arc circle has intersection two contractible arcs, so the
   connecting map identifies H₁(S¹) with the kernel ℤ of H₀(arc⊓arc)→H₀(arc)⊕H₀(arc)).

Hatcher, Proposition 2.21 and the proof of excision in Section 2.1 give the small-chain proof;
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
counit comparisons) uses only Mathlib and precedes §§4.4 and 4.5, which consume it;
the rest of §4.8 consumes §4.4.

### 4.1 Cellular chain groups

*Needs:* Native relative CW skeleta, cell coproducts and cellular chain groups.

Use Mathlib's characteristic maps and skeleta and native `cellularChainGroup`
   in degree n as the relative homology of consecutive skeleta. Consume
   `cellularChainGroupIso` to identify it with cell-indexed coproducts. In modules,
   identify it naturally with finitely supported coefficient-module-valued
   functions on `RelCWComplex.cell C n`, with the relative base explicit.
   For coefficient module R this is the free R-module on the cells. Use
   finite-support rather than finite-cell assumptions in the general definition.
### 4.2 Cellular differentials

*Needs:* Native cellular differentials and triple connecting maps; §2.5 cell orientations.

Consume native `cellularDifferential` and its triple connecting-map description,
   including `d²=0`; identify its matrix entries with degrees of attaching maps
   (Hatcher, cellular boundary formula, p.140, with Lemma 2.34, p.137, for the skeletal
   pairs), and prove naturality for cellular maps.
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
   cubical sphere quotient used by item 8.6. Construct the coordinate-order
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
   GeneralizedCohomology supplies its categorical monoidal adapters.

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

### 4.5 Cofibrations and CW transport

Here NDR means neighborhood deformation retract, specified by the usual function
and deformation data for a pair.

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
   TopCat pushout Z∪_aY with its quotient topology. Prove that Z→Z∪_aY is
   a closed embedding, that the pushout is Hausdorff, and construct native
   `RelCWComplex` relative to its image. Its n-cells are exactly the relative
   n-cells of (Y,B), with characteristic maps composed with Y→Z∪_aY.
   Prove their interior embeddings, boundary formulas, closure-finiteness
   relative to Z, weak topology and naturality for commuting attachment
   diagrams. Z needs no CW structure. Use skeletal disk adjunctions to prove
   the separation and topology statements. If the input spaces are compactly
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
   inverse homotopy. Use the relative mapping-cylinder/HEP construction and
   the cylinder homotopy extension for this one-sided pair data.
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
   Prove that every compact subset, or map from a compact Hausdorff space,
   in the final-topology union factors through a finite stage, and compare dimension-filtered classical native CW unions
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
   Prove the union is Hausdorff, indeed normal, by Hatcher Proposition A.3's
   cellwise ε-neighborhood construction over the union's dimension skeleta;
   its singletons are closed by the stage final topology. Export `T2Space`
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
   (Hatcher, Proposition 0.19); Layer 8.5 and TopologicalKTheory T7.0 take it from there.
   The relative cylinder CW structure on X×I relative to (X×{0,1})∪(B×I), with the cell
   coordinates first and the interval coordinate last, is Tau Ceti's
   `TauCeti.relCWComplexCylinder`; Layers 8.9–8.10 consume it.
   Own the Kelley product CW structure: for arbitrary Hausdorff CW X and Y construct
   the product-cell native CW structure on k(X×Y), with factor coordinates
   in that order, product characteristic maps, subcomplexes and cellular
   map naturality. Own compatible subcomplex neighborhoods: for subcomplexes A,B
   choose compatible open radial neighborhoods U,V with deformation
   retractions of U,V,U∩V,U∪V onto A,B,A∩B,A∪B respectively, using
   the same cellwise parameters. Prove the weak-topology continuity, the
   exact intersection/union identities and relative/subcomplex naturality.
   DGFloer 1.2 uses these neighborhoods for Serre preimage excision.
   AffineMorseLefschetz A4 consumes this subcomplex-neighborhood interface
   on its actual triangulated compact algebraic pairs, including singular
   subcomplexes. A4 owns the simultaneous triangulation, barycentric-neighborhood
   construction and comparison with these generic deformation-retraction laws.
   Prove its weak topology is the compactly generated
   product topology (Hatcher Appendix A.6), and its comparison with the
   ordinary product when either factor is locally compact. Consume the
   single k coreflection/CW compact-generation API of §4.8.
   Construct the cellular approximation of the actual diagonal X→k(X×X)
   and its homotopy, using this product structure. DGFloer 1.2 consumes that
   diagonal in the multiplicative Serre construction; G2.1 retains ownership
   of the distinct simplicial-realization product comparison.
   Own the pair-quotient comparisons in homology and cohomology:
   for closed CW/cofibration-NDR pairs (X,B), the actual collapse map induces
   H_n(X,B;M)≃H̃_n(X/B;M) and H^n(X,B;M)≃H̃^n(X/B;M), for every n≥0,
   for constant modules over any coefficient ring; extend homology to the
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

### 4.6 Projective spaces

*Needs:* §§4.1–4.5; native projectivization and its quotient topology.

Construct real projective n-space using native `Projectivization ℝ (Fin (n+1) → ℝ)`.
   Own the generic quotient topology on native `Projectivization 𝕜 V`
   for division-ring modules V with a topology on V, induced by nonzero vectors modulo
   scalar multiplication, with its continuity and quotient-map APIs above. ComplexKahlerGeometry K7 consumes that topology. Build the real
   finite projective-coordinate atlas (ratios by a nonzero coordinate) and
   boundaryless C^∞ Mathlib manifold structure; prove its
   homeomorphism and smooth local comparison with the antipodal sphere quotient.
   Construct its finite CW structure, with one cell in each dimension 0,…,n,
   and show the cellular differential is ±2 in positive even degree and 0 in
   odd degree (Hatcher, Example 2.42, p.144: the attaching map composed with the collapse
   has degree `1 + (−1)^k`); the sign records the chosen characteristic maps and cell generators. The chart and CW
   constructions use only Layers 2–4 and native manifold calculus, independently
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
   their transition signs, without using Layer 5's general covering theory. Calculate a two-cell
   complex whose attaching map has degree `m`; its cellular differential must
   be multiplication by `m`.

**Checks.**

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

Define the compact-generation functor k using native
`TopologicalSpace.compactlyGenerated`, with the same universe of compact Hausdorff
test spaces as `CompactlyGenerated`. Bundle it as the right adjoint to the native
fully faithful inclusion into `TopCat`; the counit kX→X is the identity on points.
Use pointed objects in this category, products k(X×Y), compact-open mapping spaces
followed by k, and the smash quotient. Reduced suspension is X∧S¹ with the interval
coordinate last; loops are based interval maps. Prove the suspension–loop adjunction
on actual pointed maps and on pointed homotopy classes. Pin its map formula:
the adjoint of f sends x to the based loop (t↦f([x,t])). The categorical
coreflection is derived from the native compact-test continuity criterion. The
exponential-law route uses compact tests; its ordinary compact-open comparisons
retain local compactness of the evaluation source, and the ordinary exponential
homeomorphism retains the Hausdorff hypotheses on both source factors
(Hatcher, Propositions A.14–A.16, pp.530–531). The CW comparisons use
Hatcher, Appendix, pp.523–524 and Theorem A.6.

- Use the native compact-test continuity criterion to construct the natural
  adjunction and prove its triangle identities.
- Prove the counit is a homeomorphism for Hausdorff CW complexes and locally compact
  Hausdorff spaces; colimits are created by the inclusion and limits are kified.
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

*Needs:* Mathlib `CompactlyGenerated`, `CompactlyGenerated.compactlyGeneratedToTop`,
`TopologicalSpace.compactlyGenerated`, compact-open topology, quotient topology,
and native continuous maps and homotopies. CW comparison additionally uses the
native weak topology of CW complexes. The coreflection portion uses no other item
of this layer; §§4.4 and 4.5 consume it. The raw-quotient comparisons use §4.4,
whose construction needs only that coreflection portion, not the transported
adjunction. No Hurewicz, EM model or stabilization is an input.


### Examples

The degree-m two-cell attachment has differential multiplication by m. At m=0 its kernel is ℤ; at m=2 its cokernel is ℤ/2; for a point the only cell is in degree zero.

### Dependencies

*Needs:* Layers 2–3; native CW cells, relative skeleta and homotopies; Layer 4.8 only for kified products and suspension.
## Layer 5: bundles, covers, products, and finite-cover descent

Fibrations in this layer are Tau Ceti's Serre fibrations,
`TauCeti.TopCat.serreFibrations` on `TopCat` morphisms, with its disc and cube
characterizations, base change and the covering-map, product-projection and
locally-trivial-bundle instances (supplier contracts). Homotopy lifting for a Serre
fibration against every relative CW pair, and the fibration homotopy sequence, are
DGFloer Layer 1 item 2's. This layer restates none of them.

This layer consumes Layers 2--4, with one exception: the product maps of item 1 (the
Alexander--Whitney and Eilenberg--Zilber maps, the shuffle map, and the chain homotopies between
them) consume only Layer 2 and can proceed alongside Layers 3 and 4.  The Kunneth spectral
sequence and theorems of item 1, and items 2--7, consume all of Layers 2--4.

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
   `H_(p+q)(X times Y;R)`.  Prove convergence from the bounded-below, degreewise-free singular
   chain complexes.  The field isomorphism
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

*Needs:* §5.1; native mapping cones and their homology sequence.

Derive the Wang long exact sequence for a mapping torus from a mapping-cone model.  Identify
   its endomorphism as `id - f_*`, and prove naturality under commuting squares of monodromies
   (Hatcher, Example 2.48, p.151, with one of the two maps the identity: the sequence there has
   the map `f_* − g_*`, which becomes `id − g_*`).
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

Calculate homology of finite products of circles as exterior powers, naturally under integer
   matrices acting on the first homology (Hatcher, Theorem 3B.6, p.275, applied inductively
   to `T^(n-1) × S^1`; the exterior-algebra description is Example 3.16, p.216).  This is a
   theorem about the product and Kunneth maps, not a separately declared answer for a torus.
### 5.5 Serre applications

*Needs:* Tau Ceti `TauCeti.TopCat.serreFibrations`, `TauCeti.TopCat.mem_serreFibrations_pullbackFst`, `TauCeti.TopCat.mem_serreFibrations_of_exists_trivialization` and `TauCeti.TopCat.mem_serreFibrations_proj`; DGFloer Layer 1 items 2–3; §6.1–6.2 only for the cohomological pairing version.

Use Tau Ceti's Serre-fibration predicate `TauCeti.TopCat.serreFibrations`, its
   base change `TauCeti.TopCat.mem_serreFibrations_pullbackFst` and its bundle
   instances `TauCeti.TopCat.mem_serreFibrations_of_exists_trivialization` and
   `TauCeti.TopCat.mem_serreFibrations_proj`, with no paracompactness hypothesis.
   Consume DGFloer Layer 1 item 2's homotopy LES and its Serre spectral
   sequences over arbitrary CW bases and over arbitrary bases, applied to
   locally trivial bundles through those instances, with actual skeletal filtration,
   monodromy local system `H_q(F;R)`, `E²_(p,q)=H_p(B;H_q(F;R))`,
   strong convergence and abutment filtration (Hatcher, *Spectral Sequences in Algebraic
   Topology*, Chapter 1, Theorem 1.3, p.8, for trivial monodromy, with the filtration of the
   abutment and the stable terms, and the local-coefficient version, p.17). Consume its named
   cohomological counterparts and multiplicative/local-pairing APIs for the
   corresponding applications. The homological constructions use only
   Layers 1–4 and DGFloer Layer 1 item 3's filtered-complex API; they do not
   consume this item. Their cohomological counterparts additionally use
   Layer 6.0–6.2's independent foundational tower/cochain/cup portion. Apply their
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
### 5.6 Finite-cover double complex

*Needs:* §2.6; finite alternating-face sums and total complexes.

For an ordered finite open cover, construct the double complex
   `directSum_(i_0<...<i_p) C_q(U_(i_0...i_p);R)`.  Define the alternating Cech differential by
   dropping one index and the vertical singular differential with the total-complex sign:
   the Čech differential is `Σ_k (−1)^k d_k` with `d_k` restricting to the intersection
   with the `k`-th index dropped, and the total differential is `δ + (−1)^p ∂` on the
   `(p,q)` term.

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
  1-simplex c of U₀∩U₁ in position (1,1), D²c=−∂δc+δ∂c=0 because δ commutes with ∂,
  while the total differential δ+∂ without the column sign gives D²c=2δ∂c, nonzero over ℤ
  and zero only in characteristic 2.
### 5.7 Cover-descent spectral sequence

*Needs:* §§3.2 and 5.6; the filtered-complex spectral sequence.

Use Layer 3's small-chain theorem to prove that the augmented total complex is naturally
   quasi-isomorphic to singular chains.  Construct its first-quadrant spectral sequence,
   bounded by the cover cardinality, with
   `E^1_(p,q) = directSum H_q(U_(i_0...i_p);R)` and prove natural convergence.
   This is a construction from the small-chain equivalence (Hatcher,
   Proposition 2.21, pp.119–120) and DGFloer Layer 1 item 3's filtered-complex
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
duality or EM representability. DGFloer 1.2's multiplicative cohomological Serre sequence
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

Define absolute and relative singular cochains by applying hom to singular chains.  Extend
   the construction to Layer 2's local coefficient systems: a degree-k cochain
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
   For every short exact sequence of coefficient modules, use degreewise freeness
   of singular chains to construct the short exact sequence of absolute and
   relative cochain complexes on arbitrary `TopCat`/`TopPair`, and derive the
   coefficient long exact sequence and Bockstein. Prove naturality in spaces,
   pairs and coefficient-sequence maps, and compatibility with pair connecting
   maps, and cup-product Leibniz signs when compatible coefficient pairings
   are given. Include `0 -> Z ->[times 2] Z -> F2 -> 0`
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

Use Alexander--Whitney to define cup products and Eilenberg--Zilber to compare them with cross
   products.  Define cap products, including tensor pairings of local coefficient systems, and
   prove naturality, associativity, the unit law, graded signs, and the boundary formula
   (Hatcher, §3.2, Lemma 3.6, p.206, for the coboundary of a cup product and Theorem 3.11,
   p.210, for graded commutativity; the cap product, pp.239–240, with its boundary formula on
   p.240).
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
   `lsCupLength_add_one_le_of_categoricalCover` states that a cover of a nonempty space X by
   n open sets, each with nullhomotopic inclusion into X, has `lsCupLength X R+1≤n`, over every
   commutative coefficient ring. Categorical covers and their unnormalized count are Tau
   Ceti's `TauCeti.LSCategoricalCover` and `TauCeti.lsCategoryCount` (supplier contracts): a
   categorical open need only contract in X, not in itself, and the count is the infimum in ℕ∞
   of the sizes of categorical covers, ∞ when there is none. Since a bound by every cover
   size is a bound by their infimum, the theorem is equivalent to
   `lsCupLength X R+1≤TauCeti.lsCategoryCount X Set.univ`, the form that uses the native count.

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
   direct calculation uses neither a hereditary-ring UCT nor an Ext collapse
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
   Layer 4 cellular data, ordinary 6.1–6.2, and CharacteristicClasses C1.2a's S0–S4 interfaces;
   it returns a supported-cellular comparison used by the proper Layer 8.5
   route. Check compatibility with CharacteristicClasses S5 in a separate target; the primary
   supported pair LES does not depend on S5. Ordinary 6.3–6.5, Layer 7 and
   ordinary Layer 8 remain independent of this supplement. It is not an input to
   CC's support definition or generic collared-pair proof.

   Construct Cᶜᵉˡˡ,ⁿ_c(X,A;ℤ) as the direct sum on the actual relative n-cells' orientation-dual modules. The ordinary cochain group is a product. Prove the incidence transpose preserves finite support by local finiteness of coface carriers. Relative ordinary cellular/singular cohomology for (X,A∪B), finite excluded cells and filtered exactness give the natural all-degree comparison H^n(C_c^cell(X,A))≅H_c^n(X,A). Every finite cell support occurs after a finite coface-star refinement. Include the differential, restriction, connecting and coefficient comparisons.

   For proper cellular maps prove row-finiteness of the ordinary chain matrix and the resulting finite-support pullback. Given a target cofinite B, choose compact L containing its complement and a source cofinite refinement avoiding f⁻¹L, so it maps into B; do not assume f⁻¹B is a subcomplex. Prove comparison naturality through common refinements. Degreewise extension by zero gives the supported CW-pair short exact cochain sequence and exact triangle. This primary cellular specialization consumes ordinary 6.1–6.2 and CharacteristicClasses C1.2a S0–S4, without classifier, duality or Layer 8.5 input. In a separate compatibility target, for CW pairs supplied with CC's S5 controlled collar data, including (M_f,X), compare this triangle with the S5 supported collared-pair triangle; that comparison is not an input to the primary pair LES.

### 6.3 Homological orientation and fundamental classes

*Needs:* §§2.5–2.6, 3.3–3.4, 4.4 and 6.1; DifferentialGeometry Layers 2 and 5.1; native local manifold charts and collars; Tau Ceti's local homology system, local orientations, `TauCeti.HomologicalOrientation` and integral fundamental class.

For boundaryless manifolds and integral coefficients, the local homology system with its
   transport along paths, local orientations and their chart generators,
   `TauCeti.HomologicalOrientation M E m`, and the integral fundamental class
   `TauCeti.HomologicalOrientation.fundamentalClass` of a compact oriented manifold are Tau
   Ceti's (supplier contracts); the constructions below consume them and add the local
   system as a coefficient system for Layer 2.6, arbitrary coefficient rings, boundary and
   corners, and the compact-support class factory.
   On a boundaryless m-manifold U define the integral orientation local
   system by `or_U(x)=H_m(U,U\{x};ℤ)`, with the excision transport below.
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
   is a singleton and its basis index `Fin 0` is empty. These are AT constructions;
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
   balls. Prove independence of balls, path-homotopy invariance and gluing,
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
   Before duality, prove the local-coefficient compact-support local-homology
   lemma: for boundaryless m-manifold U, compact K⊂U and every module-valued
   local system L, `H_i(U,U\K;L)=0` for i>m, and the degree-m group injects
   into its local images at points of K. Prove existence as well: every
   section satisfying this ball-local condition over a neighborhood of K
   comes from exactly one relative class with those local images at K. Prove this
   compact-support lemma by trivialization on coordinate balls, Layer 3's twisted
   excision/Mayer–Vietoris and compact finite-cover induction, as in Hatcher Lemma 3.27.
   Compare this homological system with DG Layer 2's
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
   Own the comparison with `Manifold.Orientation` (DG Layer 2): select the local point generator
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
   Use these results in the locally represented section and DG's comparison.
   Use DG's `Orientation.map`/`orientationAt` for arbitrary-chart changes, and first reparameterize
   a general finite-dimensional real model to the Euclidean basis model before using the
   Euclidean interior-atlas constructor. This AT-owned comparison also defines the oriented local
   section and feeds relative twisted class datum and compact-support uniqueness
   factory; it does not introduce a second local-system or class carrier. DifferentialGeometry Layer 9.3 consumes this
   exact chosen datum and owns only its smooth-to-AT carrier conversion and integration formulas;
   it must not construct a competing tangent-orientation system, point generator, or compact class.
   The chart-generator normalization, transition determinant, quotient-lift independence, section
   local representation, and zero-dimensional signed point normalization are mathematical targets
   of this AT milestone, not facts supplied merely by naming the structures. Prove naturality of the
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
   `pullbackConstantIso` in these laws. DG owns only the smooth and real-coefficient
   conversions and integration identities. Own the shared dimension-zero orientation
   sign of o at x, a unit of ℤ:
   for every finite-dimensional model I on E with finrank ℝ E=0, compare
   DG's `orientationAt` of o at x with the orientation of the unique empty ordered
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
   charts; GT Layer 1 owns the stronger global smooth collar and gluing API.
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
   provider's S⁰ normalization. Verify ∂[D¹]=[+1]−[−1] for the positively
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
   images +1 at −p₀ and −1 at p₀. Consume Layer 2, item 5's corrected
   two-case normalization: uniqueness from the positive local image applies
   to the absolute class for n≥1, while at n=0 the reduced reference has
   augmentation-zero ordinary image s₀=[q]−[−q]. For this downstream equality,
   verify both local images (+1 at q and −1 at −q) and augmentation zero in
   ordinary H₀(S⁰;ℤ), using the canonical reduced-to-ordinary inclusion and
   the native pole formula above. A single local image alone does not
   determine an ordinary H₀ class. Thus
   s₀=σ₀ι₀(g̃₀), where σ₀=−1 if p₀=q and σ₀=+1 if p₀=−q; equivalently
   σ₀=−ε₀, with ε₀ the Layer 4.4 unit determined by the same actual pole.
   This comparison consumes the present native arbitrary-pole generator and
   laws; it does not replace that API by a new pole-parameterized generator.
   At n=1, ρ₁ is a reflection and cᵖ₁ is clockwise, opposite the
   counterclockwise outward-first circle generator. Thus the D² boundary has
   coefficient +1 in λᵖ₁ and −1 in cᵖ₁, and σ₁=−a₁. The value a₁ is
   computed from the actual provider generator, not from a provider-selected p.

   Deduce `H_i(U;L)=0` for i>m by
   compact support of singular cycles and the pair/triple sequence (the route
   of Hatcher, Proposition 3.29, p.239), and prove `H_i(M,∂M;L)=0` for i>m and injectivity
   into interior local images for compact boundary manifolds using collars.

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
the existential selects it. The twisted, boundary and compact-triad forms below are prose
targets.

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
   GT Layer 1. Trivialize its normal line by DifferentialGeometry Layer 5.1's outward-pointing field;
   use half-space charts and compactness of ∂K to shrink the tube to a
   uniform positive radius before proving that its positive/negative sides
   lie outside/inside K. This supplies the exterior collar without
   presupposing a manifold
   structure on U\int K. Prove cap compatibility
   and agreement with `or_U|_K≃or_K`; there is no direct pair map
   `(K,∂K)→(U,U\K)`.
   Also own the compact-triad Poincaré–Lefschetz theorem: for a compact m-manifold K
   with boundary faces ∂₀K,∂₁K covering ∂K, with their actual compatible
   collars and common codimension-two edge (rounded from the GT corner model),
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
   Hatcher Theorem 3.43's five-lemma route; the local-system extension is
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
   with torsion β. The coefficient sequence is §6.1's construction
   (Hatcher, §3.E, p.303); cap duality is §6.4 (Theorem 3.30, p.241),
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
   pairs and to local systems of finite rank, χ(X;L)=rank(L)·χ(X), by the cellular chains of
   §4.3, whose degree-p module is a sum of c_p copies of the fibre.

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
and no finite CW model of E assumed. Derive it from §5.5's homological Serre sequence over k,
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

Finite-cover multiplicativity χ(X̃)=dχ(X) and the open-cover formula
χ(U∪V)+χ(U∩V)=χ(U)+χ(V) (Hatcher, Theorem 2.44, p.146, with Section 2.2, Exercises 21 and
22, p.157) are Tau Ceti's `TauCeti.cwEulerChar_preimage_of_card_fiber`,
`TauCeti.eulerChar_eq_mul_of_isCoveringMap` and `TauCeti.eulerChar_union_add_eulerChar_inter`,
and the subcomplex formulas of `Cellular.EulerCharacteristic.Subcomplex` (supplier contracts).
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
and geometric topology's smooth-triangulation result for the manifold corollaries.
Items 8–12 additionally consume ordinary Layer 6 cohomology and the item-level suppliers above;
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

*Needs:* Native simplicial sets, Kan fillers and realization; §§4.4–4.7.

Construct homotopy groups of Kan simplicial sets (May, *Simplicial Objects*, §3; for
   simplicial groups, Moore, Séminaire Cartan 1954/55, exposé 18, Définition 4, p.18-07), prove
   `TopCat.toSSet.obj X` is Kan, and compare these groups naturally with cubical homotopy groups.
   Prove compatibility with induced maps, boundary maps, and basepoint change.
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
   Prove that every simplicial group is a native `SSet.KanComplex` (Moore, exposé 18,
   Théorème 3, p.18-04; Stacks, Lemma 14.31.6, Tag 08NZ).
   Own the natural Moore comparison:
   for simplicial abelian groups G, π_n(G)≃H_n(NG), including components in
   degree zero. For general simplicial groups set N_n=⋂_(i=1)^n ker d_i
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
   through Layer 4.4, with item 8.6's cubical representative comparison. DGFloer item 4 consumes these classical results to compute
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
- For the free simplicial abelian group on the simplicial circle Δ¹/∂Δ¹, the normalized
  Moore complex has N₀=ℤ, N₁=ℤ(e−s₀v) (the kernel of d₁ on ℤ{e,s₀v}) with d₀(e−s₀v)=0, and
  N₂=0, so π₀=π₁=ℤ and π_n=0 for n≥2, matching H_*(S¹;ℤ); the unnormalized complex has
  ℤ² in degree 1 and ℤ³ in degree 2 with the same homology, and the identification
  π_n≅H_n(NG) uses the normalized one.
### 8.3 Absolute Hurewicz

*Needs:* §§2.5 and 8.2; DGFloer Layer 1 items 1–2 for degree-one and connected-map comparison.

The absolute Hurewicz map `HomotopyGroup.hurewicz`, a class p sent to p_* of the
   cube generator, is Tau Ceti's, and so is the absolute Hurewicz theorem
   `HomotopyGroup.bijective_hurewicz` for spaces in `Type` (supplier contracts). Compare that
   map with the sphere normalization: a generalized cubical loop g descends through the
   Layer 4.4 quotient q to a pointed sphere map ḡ, and the native class of g equals
   ḡ_*[S^n] on the outward-first normalized generator. In degree one it factors through
   abelianization; DGFloer Layer 1 item 1 owns the theorem that this exact map is an
   isomorphism, through its chain comparison. For arbitrary spaces consume DGFloer 1.2's
   direct Eilenberg-subcomplex connected-map comparison; it uses face-compatible compression
   and prisms, not this Hurewicz theorem. Prove the absolute theorem in every universe: an
   `(n-1)`-connected pointed space has reduced integral homology zero below `n` and
   `pi_n(X) ~= H_n(X;Z)` for `n>=2`, by the native map (Hatcher, Theorem 4.32, p.366).

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

*Needs:* §8.1 relative homotopy and §2.3 relative homology; §8.3's normalized Hurewicz map.

Tau Ceti's relative Hurewicz map `TauCeti.RelHomotopyGroup.hurewicz`, its surjectivity
`TauCeti.RelHomotopyGroup.surjective_hurewicz` and its bijectivity when A and X are both
highly connected are the inputs (supplier contracts); this item generalizes the last.
For n≥2 and any based pair (X,A,a₀), assume A is nonempty and simply connected
and the pair is (n−1)-connected: every component of X meets A and
π_i(X,A,a₀)=0 for 1≤i<n. Prove H_i(X,A;ℤ)=0 for 0≤i<n and that the
native relative Hurewicz map π_n(X,A,a₀)→H_n(X,A;ℤ) is an isomorphism (Hatcher,
Theorem 4.32, p.366), in every universe. The native bijectivity assumes A and X themselves
(n−1)-connected; here only A is simply connected and the pair is (n−1)-connected. No cofibration or closedness assumption is imposed.
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

*Needs:* §§4.5 and 8.3–8.4; Tau Ceti's Whitehead theorem, `TauCeti.CWType`,
`TauCeti.SimplyConnectedAtInfinity` and `ContinuousMap.HasProperHomotopyInverse`; proper version
additionally the supported comparison in §6.2 and CharacteristicClasses C1.2a.

Ordinary Whitehead is Tau Ceti's `ContinuousMap.IsWeakHomotopyEquivalence.homotopyEquiv` for
   spaces of CW type, with forward map the given map
   (`ContinuousMap.IsWeakHomotopyEquivalence.homotopyEquiv_toFun`); its hypothesis is bijectivity
   on components and on every positive homotopy group at every basepoint (Hatcher, Theorem 4.5,
   p.346). Combine relative Hurewicz with the mapping cylinder to prove homological
   `homologicalWhitehead` for simply connected CW complexes (Hatcher, Corollary 4.33, p.367),
   then `homologicalWhitehead_cwType` for simply connected spaces of CW type, given as
   homotopy equivalences to CW complexes C⊆K and D⊆L in Hausdorff spaces of the same universe,
   the condition `TauCeti.CWType`. Integral coefficients in the signatures use the universe lift
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
   On connected noncompact finite-dimensional locally finite CW spaces own
   the set of ends: decreasing nonempty components U_i of complements of
   compact sets, eventually disjoint from every compact set, modulo mutual
   cofinal containment. Prove agreement with the inverse limit of component
   sets of a cofinal exhaustion. Construct cofinal compact neighborhoods with
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
   Consume CharacteristicClasses C1.2a's generic compact-relative support diagram,
   S0–S3 enlargement/cofinality comparisons and proper pullback, and S4
   jointly proper homotopy invariance. The primary
   two-acyclicity proof uses the AT supported cellular pair LES and the absolute
   comparisons; keep CC's supported collared-pair triangle as an independent
   compatibility target, not a prerequisite of the proper Whitehead theorem.
   These inputs are independent of CC's bundle/classifier developments and
   manifold duality. Own the proper cellular approximation
   and proper homotopy-extension theorem on strongly locally finite CW pairs,
   including the product pair (I×X, (∂I×X)∪(I×A)) and its relative
   cylinder comparisons. Export `properStrongDeformationRetract_of_inverse`:
   for a closed strongly locally finite CW subcomplex A⊂X, a proper inverse
   of its inclusion, with joint proper inverse homotopies as in
   `ContinuousMap.HasProperHomotopyInverse`, yields a proper retraction r:X→A and a joint
   proper homotopy id_X≃inclusion∘r stationary on A. Rectify the inverse on
   A by proper extension, then use proper extension on the displayed product
   pair to make the inverse homotopy stationary; retain both extension maps
   and their proper controls. Prove the proper cylinder-boundary extension
   corollary from proper extension for (X,A), using a proper retraction to
   (0×X)∪(I×A) and compact-square reparametrization. Thus the final SDR
   export does not require callers to supply the product-pair property again;
   properness of the inclusion supplies closedness of A. This is the proper
   analogue of the native
   ordinary strong-deformation-retraction theorem, not an implication from
   ordinary homotopy equivalence.
   After proper cellular approximation, construct the actual locally finite finite-dimensional mapping cylinder M_f and its closed collared bottom X. Prove its projection to Y and slide homotopy proper on the whole cylinder. Ordinary homology isomorphisms give H_*(M_f,X;ℤ)=0; compact-support pullback isomorphisms give H_c^*(M_f,X;ℤ)=0 through the supported pair sequence. Identify relative cellular chains with the algebraic cone, with d(y,x)=(d_Yy+f_*x,−d_Xx), and its finite-support dual with the corresponding shifted cochain cone; retain the relative comparison and all signs. Do not collapse the noncompact X to a topological cone point and assume that quotient locally compact.

   Apply the previously owned countability result and prove, over ℤ, FTW
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
   column-finite s_n with ds_n+s_(n−1)d=id. This is Layer 8.5 work, not
   an imported lemma. Then separately own the geometric proper
   Hurewicz/Whitehead realization at infinity yielding Corollary 4.9's
   actual proper inverse and two jointly proper homotopies under the stated
   simply-connected/SC-at-infinity hypotheses. No finite-domination-to-finite-CW
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
connected space of CW type, given by a homotopy equivalence to a CW complex C⊆K in a
Hausdorff space, whose integral homology vanishes outside degrees `0` and `n` and is `ℤ` in
degree `n ≥ 2` is homotopy equivalent to the unit sphere of `ℝ^(n+1)`.

*Needs:* GeometricTopology smooth triangulation, Tau Ceti's `TauCeti.FiniteCWType` and the
finite CW type of compact triangulable spaces `TauCeti.IsTriangulable.finiteCWType`
(`Topology/Triangulable/FiniteCWType.lean`), and §4.5; §§8.3–8.5 for recognition.

Prove that every finite-dimensional Hausdorff second-countable smooth manifold
   with the Euclidean or half-space model, with or without boundary, has
   countable locally finite CW type by consuming GeometricTopology's
   smoothing-and-triangulation comparison item 1 and its realization homeomorphism.
   The compact case has finite CW type (`compactManifoldFiniteCWType`,
   `compactManifoldWithBoundaryFiniteCWType`): the smooth triangulation makes the manifold a
   compact triangulable space, and Tau Ceti's `TauCeti.IsTriangulable.finiteCWType` gives the
   Hausdorff finite CW model.
   Include the boundary-pair forms and
   finitely many prescribed interior marked points outside the relative boundary locus. As a reusable corollary, prove that a simply connected integral homology
   `n`-sphere, `n>=2`, is homotopy equivalent to the standard `S^n`
   (`nonempty_homotopyEquiv_sphere_of_homologySphere`): by 8.3, Hurewicz identifies
   `π_n(X)` with `H_n(X;ℤ)≅ℤ` (Hatcher, Theorem 4.32, p.366), a generator is represented by a
   map `S^n→X` inducing an isomorphism on every integral homology group, and 8.5's
   homological Whitehead theorem on the CW models makes it a homotopy equivalence (Hatcher,
   Corollary 4.33, p.367).

**Checks.**

- For `n=0` a compact 0-manifold is a finite discrete set and its model has that many
  0-cells; the empty manifold has the empty model. A model built from the triangulation of
  a noncompact manifold (ℝ with its integer-vertex triangulation) is countable but not
  finite, which is why compactness is a hypothesis.
- For the closed interval with the half-space model the finite model has two 0-cells and
  one 1-cell, and for the closed disk it is the point: the boundary form is not the
  closed form, since the open disk (Euclidean model, noncompact) has the point as a model
  but no finite triangulation.
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

*Needs:* §4.7, ordinary §6.1, native nerve and universal covers; Tau Ceti's Milnor model, its uniqueness theorem and its group-(co)homology identifications (supplier contracts) for the model comparison.

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
   Separate the raw bar construction (8.8a), which feeds DGFloer's abelian
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
   The raw bar supplies the object used by DGFloer Layer 1 item 4's abelian
   specialization.
   DGFloer Layer 1 item 4 aliases the abelian specialization as K(A,1);
   the generic CW/cover proof is supplied only here. For each connected
   pointed CW complex X prove `[X,Bπ]_*≃Hom(π₁X,π)` and that forgetting basepoints
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


### 8.9 Relative obstruction theory

*Needs:* §§4.4–4.5, 6.1 and 8.1; Tau Ceti `TauCeti.TopCat.serreFibrations`; DGFloer Layer 1 item 2 for relative-CW homotopy lifting and fibre transport.

**Relative obstruction cochains.**
    The untwisted bundle case follows Hatcher, *Vector Bundles and K-Theory*,
    §3.3, pp.99–102: Lemma 3.18 (p.100) gives the cocycle and Proposition 3.19
    (p.101) gives the difference-cochain and lower-skeleton extension criterion.
    That source assumes simple fibres and trivial base action on their homotopy
    groups. The n-simple, arbitrary-monodromy Serre-fibration version below is
    the local-system extension constructed here from DGFloer Layer 1 item 2's
    homotopy lifting against relative CW pairs, DGFloer's fibre transport and §6.1's cellular cochains; it is not asserted
    by the untwisted reference.
    For each relative CW complex (X,B), n≥1 and path-connected target Y with
    π₁Y acting trivially on π_nY (so π₁Y is abelian when n=1), and a map on
    X^n∪B, construct its relative cellular (n+1)-cochain with coefficient π_nY
    by its characteristic-map boundary classes. Use the outward-first
    orientation induced by Layer 2.5's coordinate-oriented ball reference
    class, identified with Layer 6's canonical relative fundamental class,
    transported to the cell by Layer 4.4, and its
    degree +1 boundary-sphere homeomorphism. Choose the positive first-coordinate
    boundary point; transport the based class from f(φ_e(v₀)) to the fixed
    y₀ along a specified path in Y. Prove choice independence using the trivial
    π₁ action on π_n, with the degree-one commutativity hypothesis explicit.
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

### 8.10 Ordinary representability

*Needs:* §§4.5, 6.1, 8.3 and 8.9; DGFloer Layer 1 items 1 and 4; GeneralizedCohomology G2.1 product comparison and §4.8.

**Ordinary cohomology representability.**
    Consume DGFloer's single functorial abelian CW/bar/Dold–Kan K(A,n) constructors
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
    from the simplicial abelian models. Consume GeneralizedCohomology G2.1's
    foundational `realizationProductKelleyComparison`, identifying |A•×A•|
    with k(|A•|×|A•|); that portion consumes only Layers 4 and 8.2 and the convenient
    category, preceding HA and ordinary representability. Consume
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

**Checks.**

- A=ℤ, n=1: K(ℤ,1) is the bar model of S¹, the universal class evaluates to 1 on the
  oriented 1-simplex labelled 1, and f↦f*ι is the degree map [S¹,S¹]→H¹(S¹;ℤ)=ℤ; the zero
  class would make the pullback map constant.
- X=∅: [∅,K(A,n)] has one element and Hⁿ(∅;A)=0; X=S¹⊔S¹, n=1: both sides are ℤ×ℤ,
  computed componentwise.
- n=0: K(A,0) is A discrete, and [X,A] is the set of functions π₀X→A, which is H⁰(X;A);
  the universal H⁰ class is the identity function on A, not an identification of H₀(A)
  with A: for A=ℤ, H₀(A;ℤ) is the free abelian group on the set ℤ.

### 8.11 Mapping spaces and EM loops

`finiteSourceMappingCWType` states the absolute compact-source conclusion of Milnor
Theorem 3, p.276: for compact Hausdorff X and any space Y with a homotopy equivalence to a CW
complex C⊆K in a Hausdorff space K, the compact-open space C(X,Y) is homotopy equivalent to a
CW complex in a Hausdorff space of the same universe; hypothesis and conclusion are the
condition `TauCeti.CWType`. Milnor states Theorem 3 for a
compact n-ad with no separation axiom; the Hausdorff hypothesis on X is kept because the
proof's function-space steps (continuity of evaluation and the exponential law carrying
homotopies into C(X,Y)) are available for compact Hausdorff sources (Hatcher, Appendix,
Propositions A.14–A.16, pp.530–531). No separation axiom is imposed on Y: the model's
carrier K is a Hausdorff CW complex, postcomposition with the model equivalence and its
inverse is continuous on compact-open spaces for every Y, and the homotopies between
their composites and the identities induce homotopies C(X,Y)×I→C(X,Y) and
C(X,K)×I→C(X,K) as adjoints of (f,t,x)↦H(t,f(x)), which needs only continuity of
evaluation on C(X,Y)×X; so C(X,Y)≃C(X,K) and Milnor's theorem applies to K. For Y the
Sierpiński space the conclusion holds with K a point. The relative n-ad and based-loop
forms below retain the relative data.

*Needs:* §4.8 and §4.5 for mapping-space CW type; §§8.5 and 8.10, DGFloer Layer 1 item 2 and Layer 2 item 3 for EM loops.

**Mapping-space CW type and ordinary EM loops.**
    **8.11a. Mapping-space and based-loop CW type.** This independent block uses the earlier CW/pair
    foundations and Layer 4.8 only; it has no input from 8.10 or 8.11b.
    Prove the finite-CW-source pair specialization
    of Milnor 1959 Theorem 3 and Corollary 3, p.276, for n-ads: mapping spaces from a finite CW pair
    into a Hausdorff CW pair, with prescribed relative/basepoint values,
    have based CW type in the compact-open/Kelley topology. Own the full inputs
    in their relative n-ad forms. Replace any CW n-ad by the weak realization
    K_w of a native abstract simplicial n-ad, with actual homotopy equivalences,
    using skeletal simplicial approximation and mapping cylinders. Construct
    the metric realization K_m on the same finite-support barycentric points
    with distance d(a,b)=Σ_v |a_v−b_v|, bounded by 2, and prove Dowker's
    K_w≃K_m comparison, relative to the subcomplexes (Milnor, proof of
    Theorem 2, pp.274–276). A metric absolute neighborhood retract (ANR) Y
    means that every closed embedding Y→Z into a metric space has an open
    neighborhood N of its image and a retraction N→Y restricting to the
    inverse embedding on that image. A metric absolute neighborhood extensor
    (ANE) Y means that every continuous map A→Y from a closed subset A of a
    metric space Z extends to some open neighborhood of A in Z. Develop
    their APIs without a separability assumption. Own the Kuratowski–Wojdysławski closed
    embedding of every metric space Z into the convex hull of its image in the Banach space of
    bounded continuous real functions on Z (Dugundji, *An extension of Tietze's theorem*,
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
    maps from a compact metric source into a metric ANR have metric ANR type
    using the compact-open/uniform metric and the tube lemma to curry
    neighborhood extensions; include finite-CW subcomplex constraints,
    prescribed values and the constant map. Construct domination of metric
    ANRs by native simplicial complexes using numerable open covers and nerves.
    Domination of X by K consists of maps u:X→K and v:K→X with a
    specified homotopy v∘u≃id_X, relative to the marked subspaces for n-ads;
    no homotopy u∘v≃id_K is required. Prove invariance under homotopy
    equivalences, composition of dominations, and restriction to the marked
    subspaces. Finally prove that domination by a CW complex implies CW type
    by the homotopy-idempotent mapping telescope (Hatcher, Proposition A.11,
    p.528), retaining these maps and relative homotopies. These inputs establish the function-space CW-type theorem
    independently of any weak-equivalence upgrade.

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
  For any map f:A→S¹ with A closed in a metric Z, extend into ℝ² and
  restrict to the open set 1/2<‖F‖<3/2 before normalizing. This gives an
  ANE witness; extending normalization to z=0 would require division by 0.
- The Cantor set C⊂[0,1] is neither ANR nor ANE. Any neighborhood of 0
  in ℝ contains [0,ε) and some c=2/3^k with 0<c<ε. A retraction to C
  would send the connected interval [0,c] to a connected subset containing
  both 0 and c, impossible since connected subsets of C are singletons.
  An extension of id_C to a neighborhood would be that same retraction.

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
    bar-edge identification. Compare with DGFloer's standing Moore conventions
    and Layer 2 item 3, preserving constant loops and addition.
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
    For the mapping cone M_AT(i)=X∪_(B×{1})CB of B→X, let
    c_AT:M_AT(i)→Σ_uB be the actual collapse of X. Define M_G(i) and c_G
    using the reflected interval-first cone. Under Layer 4.5's actual pair-to-
    mapping-cone comparison prove δ_(X,B)=(−1)^(n+1)c_AT^*σ_right
    and δ_(X,B)=c_G^*σ_left. After composing each collapse with q_+,
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
    and G2.1's foundation-only realization-product comparison for addition.
    Only after 8.11a's independent CW-type proof, consume
    DGFloer 1.2's CW approximation and 8.5 to upgrade the EM loop weak
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


### 8.12 Classical EM comparisons

*Needs:* §§8.8 and 8.10; TopologicalKTheory T1.6 and CharacteristicClasses C1.5 for projective models.

**Classical EM comparisons.** Consume T1.6's
    rank-one RP∞ and CP∞ carriers with their final/weak CW topology, and
    CharacteristicClasses C1.5's finite-stage and cellular/cup comparisons with
    Layer 4.6's RPⁿ and ComplexKahlerGeometry K7's CPⁿ. Own their identification as K(ℤ/2,1)
    and K(ℤ,2), respectively, and the coefficient-natural EM comparison maps.
    Pin the complex degree-two universal generator h by ⟨h,[CP¹]⟩=+1 for
    ComplexKahlerGeometry K7's complex orientation. The real degree-one class is the unique
    nonzero class for the double-cover generator. Compare with native
    `AddCircle.isEilenbergMacLaneSpaceOne` at period 1 and basepoint 0, with
    t↦t mod ℤ, 0≤t≤1, corresponding to +1. Prove finite-stage restriction
    compatibility and coefficient change along every additive homomorphism
    ℤ→A, including reduction ℤ→ℤ/m for each m≥1. No new infinite-projective
    carrier, characteristic-class definition or finite-projective comparison
    is constructed here.

**Checks.**

- RP∞: π₁=ℤ/2 and π_n=0 for n≥2, from the contractible double cover S∞; the finite stage
  RP¹≅S¹ has π₁=ℤ and is not a K(ℤ/2,1).
- CP∞: π₂=ℤ and the other groups vanish, from the circle bundle S∞→CP∞; the finite stage
  CP¹≅S² has π₃=ℤ and is not a K(ℤ,2).
- ⟨h,[CP¹]⟩=+1 for the complex orientation and −1 for the conjugate orientation; the
  reduction ℤ→ℤ/2 sends h to the nonzero class of H²(CP∞;ℤ/2)=ℤ/2. The real degree-one
  class is the unique nonzero element of H¹(RP∞;ℤ/2)=ℤ/2, and its restriction to
  RP¹≅S¹ is nonzero, detecting the antipodal double cover.

Hatcher Theorem 4.32 (§4.2, p.366) gives absolute Hurewicz, and Theorem 4.5 (§4.1, p.346) gives Whitehead; Whitehead, Chapters
IV--VII, gives the relative and cellular forms.  May, *Simplicial Objects in Algebraic Topology*,
Chapters 3 and 12, supplies the Kan-group construction and comparison route.
Hatcher Section 4.3 supplies ordinary representability and obstruction theory;
[*Vector Bundles and K-Theory*, §3.3, pp.99–102, Lemma 3.18 and Proposition 3.19](https://pi.math.cornell.edu/~hatcher/VBKT/VB.pdf)
supplies the untwisted case of the relative section obstruction and difference-cochain construction. The
local-coefficient extension retains the stated fibre transport rather than assuming
trivial monodromy.

### Examples

Identity maps on ∅, a point, S¹ and S² induce identity maps on components and all homotopy groups. The map ∅→point fails component surjectivity; degree two on S¹ gives 2ℤ≠ℤ on π₁.

### Dependencies

*Needs:* Layers 2–4 for relative homotopy and cellular induction; Layer 6 for cohomology; the named supplier sections in each item for EM and bundle applications.

## Downstream consumers

CharacteristicClasses consumes cohomology, compact supports and the tower comparison;
DGFloer consumes the raw bar and CW foundations; DifferentialGeometry consumes singular
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
  consumes §2.5's sup-ball-to-disk homeomorphism `v↦(‖v‖∞/‖v‖₂)·v`.
- GeneralizedCohomology (the quaternionic Hopf comparison) consumes §4.4's disk quotient
  `Dⁿ/∂Dⁿ≅Sⁿ`.
- BanachAlgebras (A8) and DifferentialGeometry (10.5) take the Brouwer fixed-point theorem,
  including its finite-span form `TauCeti.brouwerFixedPoint_compactConvex_finiteSpan`, from
  Tau Ceti (supplier contracts); citations of AlgebraicTopology §2.7 map to that native file.
- AffineMorseLefschetz (A4) takes the based top pair and its relative homotopy sequence from
  Tau Ceti's `TauCeti.BasedTopPair` and `TauCeti.RelHomotopyGroup`, which §8.1 consumes.
- MorseTheory (M4) consumes §6.2's cup length `lsCupLength` and its bound
  `lsCupLength_add_one_le_of_categoricalCover`, and takes categorical covers and their count
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
  realization-unit theorem, §8.10's ordinary representability and 8.11b's ordinary
  EM loop comparison.
- HeegaardFloer consumes §6.4's compact-triad Poincaré–Lefschetz theorem with its
  degree, cap-boundary sign and coefficient-pairing conventions.

Consumers also cite former Lean names of this roadmap. `Suggested.lean` declares only the
headline theorems, so each former name maps to the section that carries its object:

- `reducedSuspensionSphereHomeomorph` and `compactReducedSuspensionCarrierComparison`
  (DGFloer, RiemannianGeometry): §4.4, the reduced-suspension sphere homeomorphism and the
  Kelley comparison of the compact reduced suspension.
- `diskQuotientSphereHomeomorph` (GeneralizedCohomology): §4.4, the disk quotient
  `Dⁿ/∂Dⁿ≅Sⁿ`.
- `supBallEuclideanDiskHomeomorph` (GeneralizedCohomology, CharacteristicClasses): §2.5, the
  sup-ball-to-disk homeomorphism.
- `relativeCWPushout` and `relativeCWPushoutCWModel` (MorseTheory, CharacteristicClasses):
  §4.5, the relative CW pushout and its CW model.
- `ordinaryPairQuotient`, `ordinaryPairQuotientComparison`,
  `ordinaryPairQuotientCohomologyComparison` and `diskBoundarySubset` (GeneralizedCohomology):
  §4.5, the pair-quotient comparisons `H_n(X,B;M)≃H̃_n(X/B;M)` and
  `H^n(X,B;M)≃H̃^n(X/B;M)` for closed cofibration pairs, applied to the disk and its
  boundary sphere through §4.4's native `TopCat.disk n` and boundary inclusion.
- `ordinaryEMUniversalClass`, `ordinaryEMRepresentability` and
  `ordinaryEMRelativeRepresentability` (GeneralizedCohomology): §8.10, the universal class
  and absolute and relative ordinary representability.
- `ordinaryEMLoopComparison` and `ordinaryCohomologySuspension` (GeneralizedCohomology): 8.11b,
  the EM loop comparison and the cohomology suspension.
- `projectiveEMComparisons` (GeneralizedCohomology): §8.12, the identification of `RP^∞` and
  `CP^∞` as `K(ℤ/2,1)` and `K(ℤ,2)` with their comparison maps.

### Dependency order

In the table below, bare references to Layer 6 mean the ordinary 6.0–6.5
cohomology/duality lane. They do not include the separate supported-cellular
supplement or the categorical LS supplement unless named explicitly.

| Layer | Depends on | Can proceed alongside |
| --- | --- | --- |
| 1 van Kampen | Mathlib  | 2--8 |
| 2 relative homology | Mathlib  | 1 |
| 3 subdivision/excision | 2 | 1 |
| 4 CW/cellular and raw quotient comparisons | 2--3, native cochain algebra, Layer 4.8 for kified CW products; Layer 4.4 for normalized raw quotient comparisons; 2.5 supplies sphere reference shuffles; general cohomological product/suspension compatibility belongs to 8.11b | 1 |
| 5 product maps (item 1) | 2 | 1, 3, 4 |
| 5 bundles/covers/finite covers | 2--4; Tau Ceti Serre-fibration API; DGFloer 1.2 homotopy LES/homology SS from 1–4 and DGFloer Layer 1 item 3, cohomology SS additionally from independent 6.0–6.2 | 1 |
| 6.0 homotopy-square maps | Tau Ceti tower algebra and Mathlib mapping cones only | 1–5, 7–8 |
| 6.0 topological tower adapters | 2–4; Tau Ceti tower algebra; 6.0 homotopy-square maps | 5, 7–8 |
| 6.1--6.4 cohomology/duality | 6.0 for 6.1 skeletal limits; 2--3, Layer 5 item 1 product maps, DifferentialGeometry Layer 2 tangent orientations, DifferentialGeometry Layer 5.1 outward-first boundary conventions and §2.5's local sphere comparison, native smooth local boundary charts plus the compact-domain Brown topological collar, and Layer 4.4's εₙ/radial native-sphere bridge used by 6.3; Layer 4 for cellular comparisons/RP² | 1 |
| categorical-cover/cup-length supplement after 6.2 | native opens/homotopies/ENat; 2–3, 5.1 and ordinary 6.1–6.2, plus the direct point-chain contraction; no manifold duality or Morse input | 6.3–6.5 |
| supported-cellular comparison after ordinary 6.2 | ordinary 4 cellular data, ordinary 6.1–6.2, CharacteristicClasses C1.2a S0–S4; proves countability and finite-support cellular/singular comparison. CharacteristicClasses S5 compatibility is a separate check | ordinary 6.3–6.5, Layer 7 and ordinary 8 proceed independently; proper 8.5 uses the needed support interfaces |
| 6.5 linking/degree consequences | 2--4 and ordinary 6.1--6.4; DifferentialGeometry Layer 10's smooth mapping-degree comparison only after the independent Layer 6.3 classes | 1 |
| 7 Euler characteristic | 2--6; Tau Ceti's Euler characteristic and standard values | 1 |
| 8.1–8.7 Hurewicz/Whitehead | 2--4 and the cited external roadmaps; proper 8.5 additionally CharacteristicClasses C1.2a S0–S3 support colimits/proper pullback and S4 jointly proper homotopy invariance and the supported-cellular comparison/countability supplement; CharacteristicClasses S5 is a compatibility target only | 1, 5; ordinary Hurewicz/Whitehead also alongside ordinary 6–7 |
| 8.8a raw bar/abelian input | 4, ordinary 6, native nerve/realization and universal-cover APIs | DGFloer Layer 1 item 4 abelian K(A,1) specialization |
| 8.8b normalized model comparison | Layer 8.8a bar model; Tau Ceti's Milnor model, uniqueness theorem and group-(co)homology identifications (supplier contracts) | 8.9 |
| 8.9 primary relative obstructions | 4, DGFloer 1.2 fibre transport, ordinary 6 cellular cochains, 8.1–8.7 | 8.8b |
| 8.10 ordinary representability | 4, ordinary 6, 8.3/8.6, 8.9, DGFloer Layer 1 items 1 and 4, GeneralizedCohomology G2.1 foundational product comparison and Layer 4.8 kification and Layer 4.4 normalized comparisons | 7 |
| 8.11a mapping-space and based-loop CW type | Earlier CW/pair foundations (4) and Layer 4.8 compact-generation/product API and Layer 4.4 normalized comparisons; no 8.10 or the EM loop comparison input | 7 |
| 8.11b ordinary EM loops | 8.5, 8.10, 8.11a, DGFloer Layer 1 item 2 and standing/Layer 2 item 3 loop comparison, Layer 4.8 compact generation and foundational adjunction, with Layer 4.4 normalized comparisons, G2.1 foundation-only realization-product comparison | 7 |
| 8.12 classical EM comparisons | 8.8b, 8.10, TopologicalKTheory T1.6 carrier construction and DGFloer 1.2 Serre LES via CharacteristicClasses C1.1 bundle adapter/C1.5 finite comparisons and universal sphere-bundle portion | 7 |

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

- Ordinary representability's pullback map is bijective on arbitrary CW complexes,
  including disconnected and infinite-dimensional ones, and additive for every abelian
  coefficient group. Degree zero uses component functions; relative maps fix the subcomplex.
- The normalized universal class evaluates to the identity on the distinguished homotopy
  group, and the ordinary loop comparison induces that identity with the pinned suspension sign.
- A fixed n-skeleton extends exactly when its obstruction cochain vanishes. Vanishing of
  its cohomology class permits alteration of the n-skeleton relative to the lower skeleton
  and the specified subcomplex. Fibre transport and difference signs agree with these maps.

## References

- Ronald Brown, *Topology and Groupoids*, 3rd ed., Booksurge, 2006, Theorem 6.7.2 (p.240),
  §6.7 Exercise 6 (p.250) and the Lebesgue covering lemma 3.6.4 (p.91).
- Samuel Eilenberg and Norman Steenrod, *Foundations of Algebraic Topology*, Princeton
  University Press, 1952, Chapters I--III.
- Allen Hatcher, [*Algebraic Topology*](https://pi.math.cornell.edu/~hatcher/AT/AT.pdf),
  Chapter 0, Sections 1.2, 2.1--2.3, 3.1--3.3, 3.B, 3.C, 3.G--3.H, 4.1--4.3, and the Appendix.
- Allen Hatcher, [*Spectral Sequences in Algebraic Topology*](https://pi.math.cornell.edu/~hatcher/SSAT/SSch1.pdf),
  Chapter 1, Theorem 1.3 (p.8) and the local-coefficient version (p.17).
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
- Jean-Pierre Serre, *Homologie singulière des espaces fibrés. Applications*, Annals of
  Mathematics 54 (1951), 425--505, for the homology spectral sequence of a fibration.
- John McCleary, *A User's Guide to Spectral Sequences*, 2nd ed., Cambridge University Press,
  2001, Chapters 1--2.
- Charles Weibel, *An Introduction to Homological Algebra*, Cambridge University Press, 1994,
  Chapters 3 and 5, for `Tor`, `Ext`, and the Kunneth and universal-coefficient spectral sequences.
- Kenneth Brown, *Cohomology of Groups*, Springer GTM 87, 1982, Chapter VII, for the
  Cartan--Leray spectral sequence and transfer comparison.

- John Milnor, *Morse Theory*, Annals of Mathematics Studies 51, Princeton University Press,
  1963, Lemmas 3.6 and 3.7.
- Arne Strøm, [*Note on cofibrations II*](https://journals.msp.org/mscand/article/download/2424/2423),
  Mathematica Scandinavica 22 (1968), 130–142, Theorem 6 (p.135).
- James Dugundji, [*An extension of Tietze's theorem*](https://msp.org/pjm/1951/1-3/pjm-v1-n3-p04-s.pdf),
  Pacific Journal of Mathematics 1 (1951), 353–367, Theorem 4.1 (p.357), Corollary 4.2
  (p.358), §7 (p.363) for the Kuratowski–Wojdysławski embedding, and Theorem 7.1 (p.363).
- F. Thomas Farrell, Laurence R. Taylor and John B. Wagoner, [*The Whitehead theorem in the
  proper category*](https://www.numdam.org/item/CM_1973__27_1_1_0.pdf), Compositio Mathematica
  27 (1973), 1–23, §§1–4, Theorem 4.2 and Corollary 4.9.
- Michael H. Freedman and Frank Quinn, *Topology of 4-Manifolds*, Princeton University Press,
  1990, §7.7.
- John Milnor, [On Spaces Having the Homotopy Type of a CW-Complex](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/milnorcw.pdf), Theorem 2, p.273, for the n-ad CW-type comparison, and Theorem 3 and Corollary 3, p.276, for function-space and based-loop CW type; its countable class W₀ is distinct from the general class W used here.

- Anthony Conway, Stefan Friedl and Gerrit Herrmann, [*Linking forms revisited*](https://intlpress.com/site/pub/files/_fulltext/journals/pamq/2016/0012/0004/PAMQ-2016-0012-0004-a003.pdf), Pure and Applied Mathematics Quarterly 12 (2016), 493–515, Proposition 1.2, p.494, Lemma 2.5, p.502, and Lemma 2.6, pp.503–504.

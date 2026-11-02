# Roadmap: algebraic topology of spaces and manifolds

**Summary.** This roadmap develops the map-level algebraic topology needed to calculate spaces from open
covers, CW structures, fibrations, and manifold decompositions.  It starts at Mathlib's singular
chains, fundamental groupoid, topological pairs, cubical homotopy groups, and classical CW
complexes.  It ends with reusable van Kampen, relative homology, excision, cellular comparison,
duality, Euler-characteristic, Hurewicz, Whitehead, ordinary Eilenberg–MacLane
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
6. Relative homotopy groups, Hurewicz, Whitehead, and homological Whitehead are proved for CW
   complexes and then for spaces of CW type.  The cubical and Kan-simplicial models of homotopy
   groups are naturally compared rather than allowed to form separate incompatible APIs.
7. Countable towers have the generic lim/lim¹, exact-sequence, Mittag--Leffler
   and integer-graded Milnor APIs, including cofinal-shift naturality, the
   derived-limit cone and its maps for specified homotopy-commuting squares.

8. Ordinary cohomology is represented on arbitrary CW complexes and CW pairs by the shared
   Eilenberg–MacLane models; nonabelian classifying spaces, universal classes, loop comparisons,
   and primary relative obstruction cochains have explicit normalization and transport maps.

The scope includes ordinary cohomology on arbitrary CW complexes and the tools needed for
compact manifolds and finite CW-type spaces.  It
does not include generalized cohomology theories, spectra, bordism, or surgery obstruction
groups.  Those theories consume this roadmap's chain, CW, duality, and homotopy interfaces.

### Ownership boundaries

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
- [ClassifyingSpaces](../ClassifyingSpaces/README.md) owns Milnor and
  presentation models, their pointed CW-type uniqueness and the cellular/bar
  projective-resolution comparisons. Layer 8.8 keeps its own native nerve model
  and compares it with those models with identity-on-π₁ normalization. Its
  normalized model comparison consumes only the ClassifyingSpaces Stages 3/4
  model, uniqueness and resolution interfaces. Layer 8.8a owns the raw nerve/bar
  construction; Layer 8.8b owns only its normalized comparison with those
  ClassifyingSpaces models. The raw bar also supplies the abelian input used by
  DGFloer Layer 1 item 4.
- [DGFloer](../DGFloer/README.md) Layer 1 item 4 owns the single functorial
  abelian K(A,n) family: its degree-one model aliases Layer 8.8's generic bar
  construction, and n≥2 uses the fixed Dold–Kan Γ(A[n]) realization. It owns
  the coefficient-natural normalized π_n identification, including comparison
  of Γ(A[1]) with the abelian nerve. Layer 8.8 owns the generic discrete-group
  bar/CW/cover proof and consumes no DGFloer EM constructor. Layer 8.10
  consumes that abelian family and DGFloer Layer 1 item 1's degree-one Hurewicz.
  DGFloer's constructor uses only Layers 8.1–8.7 and 8.8a, preceding representability and
  obstruction theory. Its Layer 1 item 2 owns the fibration homotopy long exact
  sequence and the ordinary Serre spectral sequences, stated on the library's
  Serre-fibration carrier. Layer 5.0 here provides the cube-lifting predicate on
  `TopCat` morphisms, its pullback and locally-trivial-bundle theorems, and the
  comparison identifying that predicate with the library carrier; 5.5 transports
  DGFloer's sequences along that comparison to its bundles. DGFloer's CW
  approximation is used in 8.11b.
  The standing Moore-loop comparison and Layer 2 item 3 supply loop carriers.
- Layer 4.0 owns the compact-generation coreflection, CW comparison and pointed
  suspension–loop adjunction needed here. HomotopySpheres consumes these foundations
  for its Puppe sequences and stabilization; there is no reverse supplier edge.
  GeneralizedCohomology G2.1 supplies the simplicial-realization product comparison;
  it uses Layer 4.0 and the CW/realization foundations, without ordinary representability.
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
  `CWComplex` structure and `T2Space` on its carrier. Finite CW type means
  an actual homotopy equivalence to a Hausdorff finite CW model; general
  CW type likewise means a homotopy equivalence to a Hausdorff CW model.
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
   the ring and module hypotheses they use.  Field isomorphisms, PID or hereditary-ring short
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
  `TopPair`, but relative homotopy uses a based top pair containing `pair : TopPair` and
  `basepoint : pair.snd`. Its morphisms are pair maps whose subspace component preserves that
  point. Relative cubes, groups, boundary maps, the long exact sequence, basepoint change,
  functoriality, and relative Hurewicz all take this based carrier; no declaration chooses a point
  from a bare pair.
- **Finiteness is a hypothesis.**  Euler characteristic is defined for finite CW structures and
  extended to finite-CW-type spaces by transport and invariance.  Additivity and multiplicativity
  state the necessary cofibration, excision, and finite-generation hypotheses.

## Exact supplier contracts

### From Mathlib and Tau Ceti

The development starts from these pinned APIs.

- `TopCat`, `TopCat.toSSet`, `SSet.chainComplex`, `singularChainComplexFunctor`, and
  `singularHomologyFunctor`.
- `TopPair`, `TopPair.ofSubset`, `TopPair.incl`, `TopPair.diag`, and the
  `TopPair.HomologyPretheory` classes already present at the dependency pin.
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
  maps in `Singular.EilenbergZilber`/`AlexanderWhitney`/`Shuffle`; the missing
  local-coefficient and Kunneth extensions use these maps.
- Native Euler–Poincare and finite-generation results in
  `Cellular.EulerCharacteristic.Basic`/`Singular`, including
  `finsum_finrank_singularHomology_of_finite_cwComplex`; transport the native
  alternating cell count to finite-CW-type spaces rather than introducing
  another cellular Euler invariant.
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
  `cellularSingularHomologyIso` in `Cellular.Chains`/`Coproduct`/`Comparison`.
  They use relative CW skeleta, T2 ambient spaces, abelian-category coefficients
  and exact cell-indexed coproducts; the homology comparison requires
  a finite-dimensional relative CW complex. Layer 4 extends that carrier to
  arbitrary CW dimension, chosen chain representatives and local systems.
- Native `TopCat.singularCap` and singular cup products in `Cohomology.Cap.Basic`
  and `Cohomology.Cup`. Consume their Alexander–Whitney maps and pairings,
  extending to direct local-system cochains, relative products and duality.
- Abstract and classical `CWComplex`/`RelCWComplex`, subcomplexes, skeleta,
  `CWComplex.FiniteDimensional`, `CWComplex.FiniteType`, and `CWComplex.Finite`.
- Existing `TauCeti.MappingCylinder`, its `incl`, `proj`, `proj_comp_incl`,
  `isClosedEmbedding_incl` and `homotopyEquiv`, and
  `TauCeti.MappingCylinder.hasHomotopyExtensionProperty_range_incl` in
  `Topology.Homotopy.MappingCylinder` / `Extension.MappingCylinder`.
  Consume the HEP, relative-CW and strong-deformation-retraction APIs in
  `Extension.Basic` / `CWComplex` / `DeformationRetract`.
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
along local diffeomorphisms and Layer 2.4's outward-first sphere orientation) and Layer
5.1 (the outward-normal-first boundary orientation), consumed by 6.3; Layer 10's smooth
mapping degree, consumed only by 6.5's comparison, and 10.5, which consumes 2.7's Brouwer
theorem. Layer 9.3 consumes 6.3's classes and is not a supplier of them.

### From TauCetiRoadmap.DGFloer

Layer 1 item 1 (degree-one Hurewicz), consumed by 8.3 and 8.10; item 2 (CW approximation,
the fibration homotopy long exact sequence and the homological and cohomological Serre
spectral sequences on the library's Serre-fibration carrier), consumed by 5.5, 8.3, 8.9,
8.11b and 8.12 through 5.0's comparison; item 3 (the spectral sequence of a filtered
complex), consumed by 5.5; item 4 (the functorial abelian K(A,n) family with its
normalized π_n identification), consumed by 8.10; Layer 2 item 3 (fixed-interval loop
comparisons), consumed by 8.11b. Each is used with its path-connectedness and CW
hypotheses.

### From TauCetiRoadmap.ClassifyingSpaces

Stage 3 items 11–15 (maps out of a cellular K(G,1), uniqueness, CW structures on
coverings, agreement of the models, homotopy functoriality) and Stage 4 items 16–18
(chain-level comparison, group homology, bar-resolution comparison), consumed only by
8.8b's normalized model comparison.

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

K7.1's complex projective model and K7.2's finite CW structure on CPⁿ, consumed only by
7.4's Euler-characteristic check χ(CPⁿ)=n+1.

Each use below retains the supplier's hypotheses and names the needed portion.

## How to read the build

Layers 1 and 2 establish groupoid and chain interfaces; Layer 3 supplies local-coefficient
excision, Layer 4 CW comparison and convenient pointed topology, and Layer 5 product,
cover and bundle tools. Layer 6 builds tower algebra, cohomology and duality; Layer 7
transports Euler characteristic. Layer 8 reaches Hurewicz, Whitehead, representability
and obstruction theory. Item-specific inputs separate the independent tower and
product foundations from later applications.

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
   other (Hatcher, Section 3.C, p.281, for H-spaces).

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

The proof spine is Brown, *Topology and Groupoids*, Theorem 6.7.2 (p.240): subdivision by a
Lebesgue number (Brown 3.6.4, p.91) gives generation, the square-grid subdivision of a homotopy
gives relations, and the universal property identifies the colimit.  Hatcher, *Algebraic
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
   `C_*(X) / C_*(A)` and in its natural short-exact-sequence form, and prove the two forms
   naturally isomorphic.
### 2.2 Relative homology

*Needs:* §2.1; native homology functors and coefficient functoriality.

Define the relative homology functor for coefficient objects in the natural preadditive
   category.  Prove functoriality, compatibility with composition, and the comparison
   `H_*(X, empty) ~= H_*(X)` (Hatcher, Section 2.1, pp.115–117: relative chains, the long
   exact sequence of a pair, Theorem 2.16, p.117, and the absolute case `A = ∅`).
### 2.3 Pair and triple sequences

*Needs:* Native pair/triple short exact sequences and their connecting maps.

Consume the native short exact sequence of chain complexes for a pair and its natural long
   exact sequence, with its connecting morphism and naturality square.  Do the same for triples
   `B subset A subset X`.
### 2.4 Homology axioms

*Needs:* Native singular homology pretheory; §2.2 reduced/relative comparison.

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
   homotopy, including relative homotopies. This uses the existing groupoid object and does
   not depend on Layer 1's van Kampen theorem.

### 2.7 Brouwer fixed point

*Needs:* Native disk/sphere relative homology and normed-space topology; §2.5 orientation comparison.

Own the single generic no-retraction and finite-dimensional Brouwer
   theorem. DifferentialGeometry 10.5 consumes it and supplies its degree
   proof comparison. Own the fixed-point theorem for every nonempty compact
   convex subset C of a real finite-dimensional normed space E:
   `brouwerFixedPoint_compactConvex` states that each continuous self-map of
   the actual subtype C has a fixed point. A function-level form takes a map
   with `ContinuousOn f C` and `MapsTo f C C` and yields a fixed point in C.
   No full-dimensional or nonempty ambient-interior hypothesis
   is imposed. Give closed-ball (including radius 0), simplex, singleton,
   transport along affine homeomorphisms and homeomorphic-domain
   specializations, with native
   Function.IsFixedPt and the compact fixed-point locus obtained from the
   native `isClosed_fixedPoints` in Mathlib/Dynamics/FixedPoints/Topology.
   First prove that the disk does not retract onto its boundary (Hatcher, Corollary 2.15,
   p.114), using the already-proved native
   `TauCeti.reducedSingularHomologyTopCatSphereIso`,
   `TauCeti.TopCat.contractibleSpace_disk` and
   `TauCeti.isZero_reducedSingularHomologyFunctor_of_contractibleSpace`.
   These native sphere/vanishing prerequisites precede this theorem;
   its proof does not consume Layer 3's later Mayer–Vietoris computation.
   Apply reduced H_(n−1) with integral coefficients to the retraction
   equation: for n≥1 the identity of ℤ would factor through the zero
   module. The empty boundary at dimension 0 is treated directly.
   A fixed-point-free disk map gives its continuous
   retraction along the ray from f(x) through x; pin that construction and
   its boundary identity, and derive the fixed-point theorem for the native
   `TopCat.disk n`.
   For general C work inside affineSpan ℝ C, choose a point c of the native
   intrinsicInterior, and construct the homeomorphism of C with the closed unit
   ball of the direction space by the continuous positive radial reach
   `sSup {t : ℝ | 0 ≤ t ∧ c + t • u ∈ C}` of C from c in the unit direction u.
   Prove this reach is finite, positive, attained and continuous on the
   direction-space unit sphere, and that the radial homeomorphism takes
   t•u to c+(t*reach(u))•u for 0≤t≤1. Prove its comparison with the
   inverse of Mathlib's native `gauge` on
   {v:(affineSpan ℝ C).direction | c+(v:E)∈C}; use its existing convex-gauge
   continuity and homogeneity API. Prove the boundary/intrinsicFrontier comparison;
   dimension 0 is a singleton. Own the homeomorphism from the unit closed ball
   of a finite-dimensional real normed space E of rank k to the actual lifted
   `TopCat.disk k`. Take as data a continuous
   linear equivalence e:E≃L[ℝ]EuclideanSpace ℝ (Fin k) and use
   x↦(‖x‖/‖e(x)‖)e(x), with value 0 at 0, followed by the native ULift
   homeomorphism. Pin its forward and inverse formulas, its value at 0 and its
   norm identity; the last identifies boundaries. Compose this with the
   direction-space homeomorphism to apply the native-disk theorem to general C.
   Export the finite-span form: when C lies in a
   specified finite-dimensional submodule V of an arbitrary real normed
   ambient space, restrict its subtype and map to V, apply the theorem there,
   and transport the fixed point back. Finite convex hulls use the span of
   their finitely many vertices. This uses existing sphere/disk APIs
   independently of manifold duality. Analytic
   Schauder compact-map approximation and Lomonosov's operator theorem are
   owned by BanachAlgebras A8 and consume this finite-dimensional theorem.
   Follow the native fixed-point vocabulary: fixed points are `Function.IsFixedPt`,
   the fixed-point locus is `Function.fixedPoints f`, closed by `isClosed_fixedPoints`,
   and the radial reach is compared with Mathlib's `gauge`. Use the direction-space
   radial construction here without duplicating the native closed-locus lemmas. Also
   state the closed-unit-ball form: a continuous self-map of `closedBall (0:E) 1` has a
   fixed point; prove it from the continuous-map theorem.

**Checks.**

- For C the closed ball of radius r about c=0, the reach is r in every unit direction,
  the radial homeomorphism is scaling by r, and Mathlib's `gauge` of C is ‖v‖/r, so the
  reach equals the reciprocal gauge of the direction; a reach defined as the inradius
  would also give r here but fails the next check.
- For C a triangle with c its centroid and u the direction of a vertex v, the reach is
  ‖v−c‖, twice the reach in the direction −u (the centroid divides each median 2:1); the
  map is not a scaling, and a constant-reach model is not surjective onto C.
- For C a singleton {c}, the direction space is zero, its unit sphere is empty, the
  homeomorphism is the point map and every self-map fixes c; for C a segment in a plane,
  the affine span is a line and the intrinsic interior is the open segment, while the
  ambient interior of C is empty and would supply no centre c.
- On the disk, a fixed-point-free f would give the retraction x↦ the point where the ray
  from f(x) through x meets the boundary; its composite with the inclusion is the identity
  of the boundary, so reduced H_(n−1) of the sphere (ℤ for n≥1) would factor through
  reduced H_(n−1) of the contractible disk, which is 0.

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
   subspace, the induced map on relative homology is an isomorphism.  Include maps of excision
   data and compatibility with the pair connecting morphism.
### 3.4 Local Mayer–Vietoris

*Needs:* §3.3 and the native ordinary Mayer–Vietoris connecting map.

Consume native Mayer--Vietoris for a binary open cover and extend its natural
   long exact sequence to local coefficients.  Prove that its first map is `(i_U, -i_V)` under the pinned sign convention.
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

### 4.0 Compact generation and the pointed adjunction

Define the compact-generation functor k using native
`TopologicalSpace.compactlyGenerated`, with the same universe of compact Hausdorff
test spaces as `CompactlyGenerated`. Bundle it as the right adjoint to the native
fully faithful inclusion into `TopCat`; the counit kX→X is the identity on points.
Use pointed objects in this category, products k(X×Y), compact-open mapping spaces
followed by k, and the smash quotient. Reduced suspension is X∧S¹ with the interval
coordinate last; loops are based interval maps. Prove the suspension–loop adjunction
on actual pointed maps and on pointed homotopy classes. The exponential-law route
uses compact tests and the compact-open evaluation law (Hatcher, Appendix,
pp.523–524 and Propositions A.14–A.16, pp.530–531).

- Prove continuity into kX from every compact test object is equivalent to continuity
  into X, and derive the natural adjunction and its triangle identities.
- Prove the counit is a homeomorphism for Hausdorff CW complexes and locally compact
  Hausdorff spaces; colimits are created by the inclusion and limits are kified.
- Prove the pointed exponential law and relative homotopy compatibility. Own the three
  comparisons of raw quotients with their convenient counterparts: the compact based smash
  with the convenient smash, the compact reduced suspension with the convenient suspension,
  and the reduced suspension of a pointed Hausdorff CW complex with the convenient
  suspension, each through the Kelley coreflection of the raw quotient supplied by 4.4.
  Transport the adjunction through those comparisons, preserving basepoints and interval
  order.

**Checks.**

- For a point, k(*)=* and both triangle composites are id; an empty-space model gives ∅ instead.
- For I=[0,1], the counit sends 0 to 0 and 1 to 1; reversing it exchanges the two endpoints.
- For S⁰ pointed at one vertex, S⁰∧S¹≅S¹ and adjunction identifies degree +1
  with the loop t↦exp(2πit), of winding +1; reflection gives winding −1.

*Needs:* Mathlib `CompactlyGenerated`, `compactlyGeneratedToTop`,
`TopologicalSpace.compactlyGenerated`, compact-open topology, quotient topology,
and native continuous maps and homotopies. CW comparison additionally uses the
native weak topology of CW complexes; no Hurewicz, EM model or stabilization is an input.


This layer consumes Layers 2 and 3. Use the native cellular complex and its
relative-CW carrier, with its Hausdorff and exact-coproduct hypotheses; module
coefficients satisfy the categorical exactness assumptions. Extend its API below.

### 4.1 Cellular chain groups

`cellularSingularComparison` states the relative comparison in arbitrary dimension
for every commutative ring and coefficient module on a Hausdorff relative CW pair.


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
### 4.3 Arbitrary-dimensional cellular comparison

*Needs:* Native finite-dimensional cellular comparison; compact simplex factorization and filtered module colimits.

Consume native `cellularSingularHomologyIso` for finite-dimensional relative
   CW complexes and extend it to arbitrary CW dimension. Prove compact singular
   simplex images lie in finite subcomplexes, identify singular chains with the
   filtered colimit over skeleta, and pass to homology using exact filtered
   colimits in module categories (or displayed exactness assumptions in
   categorical coefficient generality). Construct the skeletal filtration exact
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

*Needs:* §2.5 and native pointed quotients; §4.0 for Kelley comparisons.

Consume native finite-CW Euler--Poincare and finite-generation results;
   extend their coefficient hypotheses, naturality and local-coefficient consequences.
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
   with kZ using only Layer 4.0's coreflection, compact and CW
   compact-generation/locally-compact-product API. Pin their inverse to the
   actual inclusion/coreflection counit, with quotient/basepoint naturality.
   Layer 4.0 owns the comparison of these kified raw quotients with the pointed
   convenient smash and suspension, and consumes the k-counit comparisons of this
   item for it.
   HomotopySpheres consumes these comparisons for its pointed cones and Puppe sequences.
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
   generator. HomotopySpheres §3A/§3B and RiemannianGeometry R3 consume these
   homeomorphisms and the explicit generator comparisons, without constructing
   a second sphere-suspension identification.
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

*Needs:* Native relative CW structures, mapping cylinders and HEP; §4.0 for kified products; closed cofibrations.

Consume existing `TauCeti.HasHomotopyExtensionProperty` and
   `TauCeti.hasHomotopyExtensionProperty_base` for native relative CW
   inclusions as closed cofibrations. Consume the existing mapping cylinder,
   projection equivalence and inclusion HEP; construct the relative and double
   mapping cylinders, cellular approximation, relative
   cellular approximation rel subcomplex for relative CW pairs, and skeletal induction.
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
   and inverse homotopies fixing Z (Milnor Lemmas 3.6–3.7).
   Own the cylinder homotopy extension for closed cofibrations: for closed A⊆X with
   native HEP, prove HEP for (∂I×X)∪(I×A) in I×X. Use the native
   retraction characterization of HEP and the square homeomorphism carrying
   {0}×I∪I×∂I to {0}×I (Strøm's product theorem), retaining the full
   prescribed endpoint and subspace data in the native I×X order.
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
   Own the based homotopy inverse of a basepoint-preserving equivalence: for a homotopy equivalence whose
   continuous map strictly preserves the chosen basepoints, between
   Hausdorff CW complexes with marked 0-cell basepoints,
   construct a based inverse and unit/counit homotopies rel those points.
   Use HEP (Hatcher Proposition 0.19), retaining the strict
   basepoint equation of the input map. Layer 8.5 and TopologicalKTheory T7.0 consume it.
   Own the relative cylinder CW structure: for a relative CW pair (X,B), construct native
   `RelCWComplex` on X×I relative to (X×{0,1})∪(B×I), with original cell
   coordinates first and interval coordinate last. Prove the product weak
   topology using compactness and local compactness of I; endpoint maps are
   the actual inclusions. Layers 8.9–8.10 consume this cylinder construction.
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
   single k coreflection/CW compact-generation API of Layer 4.0.
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
   odd degree; the sign records the chosen characteristic maps and cell generators. The chart and CW
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
   finiteness and the weak topology. Realized simplicial maps are cellular
   and sub-simplicial inclusions identify actual CW subcomplexes. Bar,
   Dold–Kan and singular realizations consume this one construction.
   AffineMorseLefschetz A4 consumes it through GeometricTopology Layer 11's
   ordered-complex/simplicial-set realization and transported CW comparison
   for its ambient triangulated algebraic pair and subcomplexes. Prove
   the general paracompactness of Hausdorff CW complexes used by bundle suppliers.
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


### Examples

The degree-m two-cell attachment has differential multiplication by m. At m=0 its kernel is ℤ; at m=2 its cokernel is ℤ/2; for a point the only cell is in degree zero.

### Dependencies

*Needs:* Layers 2–3; native CW cells, relative skeleta and homotopies; Layer 4.0 only for kified products and suspension.
## Layer 5: bundles, covers, products, and finite-cover descent

### 5.0 Serre fibrations and locally trivial bundles

Define a Serre fibration p:E→B to mean: for every n≥0, every continuous
H:Iⁿ×I→B and g:Iⁿ→E with p∘g=H(−,0), there is a continuous lift
Ĥ:Iⁿ×I→E with p∘Ĥ=H and Ĥ(−,0)=g. This is a predicate on actual
`TopCat` morphisms, with no surjectivity built into the definition. Prove its
relative CW-pair lifting form and that every locally trivial bundle projection
has this property (Hatcher Proposition 4.48, pp.379–380).

- Identity maps and composites are Serre fibrations; the lifting property is
  invariant under isomorphisms over the base.
- Pullback along any continuous map preserves the property: the lift into the
  pullback is the pair of the prescribed base map and the original lift.
- Local trivializations give cube lifts by finite subdivisions of the compact
  parameter cube; no paracompactness of the base or global trivialization is assumed.
- Compare with the library's Serre-fibration carrier, the morphism property on `TopCat`
  used by DGFloer Layer 1 item 2: a morphism satisfies this predicate exactly when it
  belongs to that property, through its cube-lifting characterization; 5.5 transports
  DGFloer's homotopy long exact sequence and Serre spectral sequences to the bundles of
  this item along that comparison. Nothing here restates those sequences.

**Checks.**

- For point×point→point, every lift is the unique constant map, so both equations
  read *=* in n=0 and n=1, and both the predicate and the library property hold.
- For B×F→B and g(z)=(H(z,0),a(z)), take Ĥ(z,t)=(H(z,t),a(z));
  projection is exactly H and evaluation at 0 is exactly g.
- The inclusion {0}→I fails: the path H(t)=t starting at 0 would require
  p(Ĥ(1))=1 although its only possible value is 0. The empty projection ∅→B
  satisfies cube lifting vacuously, demonstrating why surjectivity is separate.

*Needs:* Mathlib `TopCat`, `ContinuousMap`, `unitInterval`, products, pullbacks,
`FiberBundle` and local trivializations; Layer 4 relative CW skeletal induction
for the extension from cubes to CW pairs. The cube/bundle theorem is independent
of the spectral sequence which consumes it.


This layer consumes Layers 2--4, with one exception: the product maps of item 1 (the
Alexander--Whitney and Eilenberg--Zilber maps, the shuffle map, and the chain homotopies between
them) consume only Layer 2 and can proceed alongside Layers 3 and 4.  The Kunneth spectral
sequence and theorems of item 1, and items 2--7, consume all of Layers 2--4.

### 5.1 Eilenberg–Zilber and Künneth

*Needs:* §2.6 and native Alexander–Whitney/shuffle maps; bounded-below free complexes and Tor for Künneth.

Consume native Alexander--Whitney, shuffle and Eilenberg--Zilber chain-homotopy
   equivalences for singular chains. Extend their natural/local-coefficient and relative APIs.  Over every commutative
   ring `R`, construct the first-quadrant Kunneth spectral sequence
   `E^2_(p,q) = directSum_(i+j=q) Tor^R_p(H_i(X;R),H_j(Y;R))` converging naturally to
   `H_(p+q)(X times Y;R)`.  Prove convergence from the bounded-below, degreewise-free singular
   chain complexes.  For a field `k`, prove that the cross product gives
   `directSum_(i+j=n) H_i(X;k) tensor H_j(Y;k) ~= H_n(X times Y;k)`.  For a PID, and more
   generally a hereditary commutative coefficient ring, prove the natural short exact sequence
   from that tensor sum to product homology and then to
   `directSum_(i+j=n-1) Tor^R_1(H_i(X;R),H_j(Y;R))`; prove that it splits, and record that no
   splitting is natural.  State and prove the general-ring collapse corollaries under explicit
   flatness or projectivity hypotheses.
### 5.2 Wang sequence

*Needs:* §5.1; native mapping cones and their homology sequence.

Derive the Wang long exact sequence for a mapping torus from a mapping-cone model.  Identify
   its endomorphism as `id - f_*`, and prove naturality under commuting squares of monodromies.
### 5.3 Finite covers and transfer

`finiteCoverTransfer_exists` states existence of a chain transfer for a finite
constant-degree cover with its projection composite equal to the degree times identity.
The same existential statement fixes its value on every simplex to the sum of all lifts, including in positive characteristic.


*Needs:* Native covering maps and simplex lifting; §2.6; native group homology and filtered complexes for Cartan–Leray.

For a finite covering with constant fibre cardinality `d`,
   construct transfer on chains by summing lifts and prove `p_* transfer = d * id`
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
   For finite G prove `transfer p_* = sum_(g in G) g_*` and identify the
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
   nonregular finite cover encode the sheets by the permutation local system
   and prove transfer and composition through that system. For a disconnected
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

*Needs:* §5.0; DGFloer Layer 1 items 2–3; §6.1–6.2 only for the cohomological pairing version.

Use Layer 5.0's Serre-fibration predicate, pullback theorem and cube lifting
   theorem for locally trivial bundles, with no paracompactness hypothesis.
   Consume DGFloer Layer 1 item 2's homotopy LES and its Serre spectral
   sequences over arbitrary CW bases and over arbitrary bases, transported
   to 5.0's bundles along 5.0's comparison, with actual skeletal filtration,
   monodromy local system `H_q(F;R)`, `E²_(p,q)=H_p(B;H_q(F;R))`,
   strong convergence and abutment filtration. Consume its named
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

Eilenberg--Zilber and Eilenberg--Mac Lane's acyclic-model proof, Hatcher Section 3.B (Theorem
3B.5, p.274, and Theorem 3B.6, p.275), and McCleary, *A User's Guide to Spectral Sequences*, Chapters 1--2, form the source spine.  The
mapping-torus calculation follows the mapping-cone derivation of the Wang sequence; transfer
follows Hatcher Section 3.G, and the bundle filtration follows Serre's skeletal construction.


### Examples

The two-sheet point cover sends a generator to the two lifted generators; projection gives 2, while the zero map gives 0. For the trivial bundle S¹×S¹ the Betti ranks are 1,2,1.

### Dependencies

*Needs:* Layer 2 for product chain maps; Layers 3–4 for filtrations and cellular comparisons; Layer 5.0 for bundle lifting.
## Layer 6: cohomology, products, and manifold duality

The tower, raw cochain, coefficient and cup constructions in 6.0–6.2 are foundational:
construct them from Layers 2–4 and the independent product maps in 5.1 before
using any Serre sequence, manifold duality or EM representability. DGFloer 1.2's
multiplicative cohomological Serre sequence consumes only that portion,
including 6.0's Milnor/lim¹ comparison for complete inverse cochain filtrations.

### 6.0 Countable inverse-system algebra

`towerDifference` is the product difference; `towerDifference_surjective` and
`towerDifference_surjective_of_mittagLeffler` state its surjectivity, respectively
for surjective bonding maps and for eventual stabilization of every bonding-image tower.


*Needs:* Native module categories, products, kernels, cokernels, countable towers and integer-graded mapping cones; no topology or duality input.

**Countable inverse-system algebra.** Use functors `ℕᵒᵖ ⥤ ModuleCat R`,
   including abelian groups through their canonical ℤ-module structure. Consume
   Mathlib's `Functor.IsMittagLeffler` on the underlying type functor, with
   `Functor.eventualRange`, `Functor.isMittagLeffler_iff_eventualRange` and
   `Functor.surjective_toEventualRanges`.
   Define δ on the product by
   `δ(x)_n=x_n−f_n(x_(n+1))`; identify ker δ with the categorical inverse
   limit and define lim¹ as coker δ. Own functoriality under tower maps,
   shift/cofinal-subsequence comparison, product compatibility, the six-term
   inverse-limit/lim¹ sequence and vanishing for surjective or Mittag–Leffler
   countable towers. State the complex-level theory and its naturality for
   towers in `CochainComplex (ModuleCat R) ℤ`. For degreewise surjective
   countable towers prove the product-complex short exact sequence and Milnor
   cochain sequence `0→lim¹ H^(k−1)(C_n)→H^k(lim C_n)→lim H^k(C_n)→0`
   in every integer degree k. Extend ℕ-indexed chains/cochains by zero using
   `HomologicalComplex.extend` with `ComplexShape.embeddingDownNat` or
   `embeddingUpIntGE 0`, and prove their nonnegative homology/cohomology
   comparison. Reindex homological degree j as cohomological degree−j to derive
   the chain sequence
   `0→lim¹ H_(j+1)(C_n)→H_j(lim C_n)→lim H_j(C_n)→0`.
   Prove naturality in integer-graded chain maps and compatibility with
   reindexing, chain isomorphisms and cofinal shifts/zigzags. Construct the derived inverse limit as the
   shifted mapping cone of δ on the product complex, using native ℤ-indexed
   `CochainComplex.mappingCone`. The derived inverse
   limit's possible cohomological degree-1 group lim¹H₀ (homological degree−1)
   is retained in this integer-graded carrier.
   Homotopy-commuting product squares induce actual cone maps, retaining the
   specified square homotopies in their composition laws. Compatible second
   homotopies of the square data induce homotopies of cone maps; no independence
   from arbitrary choices of square homotopy is asserted. For degreewise surjective towers compare this
   cone with ker δ, hence with the ordinary limit complex. Prove levelwise
   quasi-isomorphisms between these surjective towers induce
   isomorphisms on the homology-group inverse limits and lim¹ terms and hence
   on limit-complex homology. This is the shared generic tower API.
   CharacteristicClasses C3 consumes the cochain Milnor sequence and
   Mittag–Leffler vanishing; AffineMorseLefschetz A4 consumes the integer-graded
   Milnor sequences, strict-map/cofinal-shift naturality and limit-homology
   comparison for levelwise excision quasi-isomorphisms; CStarClassification
   CL8 consumes lim¹ and its functoriality for KK telescopes. The derived-limit
   cone and homotopy-square constructions supply the comparison theory for
   homotopy-compatible towers as part of this layer's own scope.
   Item 0 uses native module/category/complex algebra independently of the
   manifold, product and orientation developments below.

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

**Checks.**

- For the constant ℤ tower with identity bonds, δ(3,1,0,…)=(2,1,0,…).
  The opposite difference would give (−2,−1,0,…); ker δ consists of constant sequences.
- For zero bonding maps on ℤ, δ=id, so ker δ=0 and coker δ=0. The images stabilize
  at 0 after one step although no bonding map is surjective.
- For multiplication-by-2 bonds on ℤ, the images 2ᵏℤ do not stabilize.
  The alternating target (1,0,1,0,…) would force 3x₀+1 to be divisible by every
  4ᵏ, hence 3x₀=−1, impossible in ℤ; surjectivity without Mittag–Leffler is false.


### 6.1 Direct local-system cochains

*Needs:* §§2.6, 3.3–3.4, 4.3 and 6.0; native Hom complexes and Ext.

Define absolute and relative singular cochains by applying hom to singular chains.  Extend
   the construction to Layer 2's local coefficient systems: a degree-k cochain
   assigns to σ a value in L(σ(e₀)); the zeroth face term is transported back
   along [e₁,e₀] and other terms retain e₀. Relative cochains vanish on A.
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
   extension by zero on the other simplices. Apply item 0's Milnor sequence;
   for each n the tower H^(n−1)(X^k;L) is eventually constant by the cellular
   relative long exact sequence, so lim¹ vanishes and the degree-n comparison
   passes to X. Prove the relative version over subcomplex pairs as well;
 no freeness or reflexivity of
   arbitrary coefficient fibres is assumed. For finite free integral fibres
   prove that the Layer 4 chain-homotopy comparison dualizes, identifying
   L*-cochains with Hom of L-chains; use fibrewise reflexivity only to recover
   L. On RP²'s Layer 4.6 sign system ε compute δ⁰=±2 and δ¹=0, so independently
   of duality `H⁰(RP²;ε)=0`, `H¹(RP²;ε)=ℤ/2` and `H²(RP²;ε)=ℤ`.
   Prove functoriality,
   the long exact sequence, homotopy invariance, additivity, the Mayer--Vietoris sequence of a
   binary open cover (dual to Layer 3's), and constant-system comparison.  For
   integral coefficients, and more generally over a PID or hereditary ring, prove the natural
   short exact sequence
   `0 -> Ext^1_R(H_(n-1)(X;R),M) -> H^n(X;M) -> Hom_R(H_n(X;R),M) -> 0`; prove that it splits and
   that the splitting is not natural.  Over a general commutative ring, construct the spectral
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
   prove naturality, associativity, the unit law, graded signs, and the boundary formula.
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
   `LSCategoricalCover` bundles finitely many actual open subsets covering a specified
   subset, each with a nullhomotopic inclusion into the ambient space.
   `lsCategoryCount` is the infimum of their cardinalities in ℕ∞, with infimum ∅=∞.
   `LSPositiveCupProduct` records an iterated product of strictly positive-degree classes;
   `lsCupLength` is the supremum of lengths with a nonzero product, with supremum ∅=0.
   `lsCupLength_add_one_le_categoryCount` states cup-length+1≤category count on every
   nonempty space, over every commutative coefficient ring.

   - Prove cover restriction, finite union subadditivity and homotopy invariance;
     every inclusion contraction is in the ambient space.
   - Prove that the positive-product predicate uses the actual cup operation and
     sums degrees; transport witnesses through multiplicative pullbacks.
   - Prove the lower bound using relative lifts and excisive relative cup products.

   **Checks.**

   - On a point H⁰=R, H¹=0, cup-length=0 and category count=1; degree-zero units
     are excluded from positive-product witnesses, preventing spurious infinite length.
   - On S¹ with nonzero R, H¹=R has a nonzero one-factor witness, H²=0, so
     cup-length=1 and category count=2. A single categorical open equal to S¹ is impossible.
   - On ∅ the empty open family is a cover and category count=0; on a nonempty
     contractible space the minimum is 1. The zero coefficient ring has cup-length=0.


   After the foundational products of 6.2, construct `LSCategoricalCover X A n` from n
   actual bundled opens in X covering A⊆X and native
   `ContinuousMap.Nullhomotopic` witnesses for their inclusions into X. A
   categorical open need only contract in X; do not require that open itself to
   be contractible. Use `TopologicalSpace.Opens`, the induced subtype topology
   and native continuous homotopies. Own restriction of covers, finite
   concatenation, pullback along continuous maps with the specified ambient
   homotopies, and the empty-index case.

   Define `lsCategoryCount X A : ℕ∞` as the infimum of those finite cover
   sizes, with infimum of the empty set equal to∞. Prove that a finite value n
   is attained by an n-element cover; prove monotonicity in A, finite-union
   subadditivity, and the ambient deformation inequality: if g:X→X is
   homotopic to the identity and g(A)⊆B, then
   `lsCategoryCount X A≤lsCategoryCount X B`. Prove whole-space homotopy
   invariance and homeomorphism transport, empty-set value 0, positivity for
   nonempty A, and the point/discrete-space calculations. For a finite
   coproduct prove that the whole-space unnormalized count is the sum of the
   counts of its components, including empty components and ∞ cases.

   On a nonempty space define the normalized category as the category count
   `lsCategoryCount X X` minus one, and prove that the count is the normalized
   category plus one. In the connected
   case this is the convention cat(point)=0. Empty spaces use the unnormalized
   count 0; do not give an empty space a chosen point or apply the +1 formula
   there. Disconnected manifold theorems use the unnormalized sum, rather than
   assuming one categorical open can meet different clopen components.

   Consume Mathlib's `LocallyContractibleSpace` in its actual sense: each
   neighborhood contains a smaller neighborhood whose inclusion is
   nullhomotopic. Restrict that nullhomotopy to the interior of the smaller
   neighborhood and compose into X. Compactness then gives a finite open
   categorical cover, so `lsCategoryCount X X<∞`. Do not infer an open
   intrinsically contractible neighborhood basis from this weaker predicate.

   For a commutative coefficient ring R, use 6.2's existing singular cup
   product to define `lsCupLength X R : ℕ∞` as the supremum of lengths of
   nonzero finite products of positive-degree classes, with supremum of the
   empty collection 0. Export a finite-product witness API, restriction,
   coefficient/product naturality with the stated nonvanishing hypotheses,
   and the lower bound: on nonempty X,
   `lsCupLength X R+1≤lsCategoryCount X X`, equivalently cup-length at most the
   normalized category. For a cover by r categorical
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
   is no second cohomology ring.

   Basic checks: empty and point conventions; finite discrete coproducts;
   the two-open categorical cover and nonzero top class of Sⁿ with R=ℤ
   (or any nontrivial R), n≥1, giving
   normalized category 1; and the cup-product lower bounds on finite products
   of positive-dimensional spheres using Layer 5 item 1 and 6.2. No product
   upper-bound theorem or general Bott/closed-geodesic multiplicity theorem
   is inferred from these checks.

   This supplement uses native homotopy/open-set/extended-cardinality
   foundations, Layers 2–3, Layer 5 item 1 and ordinary 6.1–6.2, plus the direct
   point-chain contraction. It is independent of the manifold duality/linking
   consequences in 6.3–6.5 and is consumed by MorseTheory M4's arbitrary-function
   critical bound. Morse theory and geodesic minimax are not prerequisites.

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

*Needs:* §§2.5–2.6, 3.3–3.4, 4.4 and 6.1; DifferentialGeometry Layers 2 and 5.1; native local manifold charts and collars.

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
   DifferentialGeometry Layer 2.4's outward-first S² orientation. Transport Layer 6.1's independent sign-system
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

`poincareDuality_twoTorsionCoefficients` states the closed-manifold case over every
commutative ring R with 2=0: for a compact connected Hausdorff topological n-manifold M
charted on `EuclideanSpace ℝ (Fin n)`, there is a class μ in H_n(M;R) such that cap with μ
is bijective H^p(M;R)→H_q(M;R) whenever p+q=n. Every manifold is R-orientable for such R
(Hatcher, p.235), so the existential selects a generator of H_n(M;R)≅R (Hatcher, Theorem
3.26, p.236) and no orientation datum is needed (Hatcher, Theorem 3.30, p.241). The twisted, boundary and oriented-integral
forms below are prose targets.

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

### 6.5 Linking forms and degree

*Needs:* §§4.3 and 6.1–6.4; DifferentialGeometry Layer 10 only for smooth degree comparison.

Derive the homological characterization and duality formulas for the shared manifold degree and
   the intersection pairing.  For a closed connected oriented `n`-manifold of finite CW type,
   construct the nonsingular torsion linking pairing
   `Tor H_i(M;Z) times Tor H_(n-i-1)(M;Z) -> AddCircle (1 : ℚ)`.  Prove finiteness of the torsion
   groups, naturality under orientation-preserving diffeomorphisms, and the symmetry law
   `lambda_i(x,y) = (-1)^((i+1)(n-i)) lambda_(n-i-1)(y,x)` with the pinned cap-product sign.
   Derive universal-coefficient consequences through the natural duality maps, and do not define a
   competing degree invariant.

**Checks.**

- On RP³ (n=3, i=1) the torsion subgroup of H₁ is ℤ/2 and the pairing sends the pair of
  generators to 1/2 in ℚ/ℤ; it is nonsingular, which a pairing with value 0 is not. The
  exponent (i+1)(n−i)=4 is even, so linking on a 3-manifold is symmetric.
- L(5,1) and L(5,2) both have H₁=ℤ/5 and H₂=0, but the self-linking of a generator is ±1/5
  for L(5,1) and ±2/5 for L(5,2); since 2 is not a square modulo 5, no change of generator
  or of orientation identifies the two forms, so the linking form separates the two lens
  spaces while homology does not; a model depending only on the torsion group would give
  equal forms.
- On S³, or on any integral homology sphere, the torsion subgroups vanish and the pairing is
  empty. At (n,i)=(5,2) the exponent is 9, so λ₂ is skew and every self-linking is
  2-torsion in ℚ/ℤ, as on the Wu manifold SU(3)/SO(3), whose Tor H₂=ℤ/2 has self-linking
  1/2 by nonsingularity; a model with exponent i(n−i−1) would make 3-manifold linking skew,
  which L(5,1)'s self-linking ±1/5 (with 2/5≠0) refutes.

The proof spine is Hatcher Sections 3.1--3.3 for cohomology operations and duality, and Dold,
*Lectures on Algebraic Topology*, Chapters VII--VIII for natural products and local coefficients.
Collars fix the boundary sign; orientation is never reconstructed from a hand-written chart list.


### Examples

On a point the positive-degree cup groups vanish and cup-length is 0, while category count is 1. On S¹ with nonzero coefficients they are 1 and 2; on ∅ the count is 0.

### Dependencies

*Needs:* Layers 2–3 and Layer 5.1 product maps; native module/category algebra for 6.0; Layer 4 for cellular comparisons; DifferentialGeometry Layers 2 and 5.1 for manifold orientations.
## Layer 7: Euler characteristic and finite decompositions

This layer consumes every one of Layers 2--6.  Layer 1 is not a prerequisite.

### 7.1 Finite CW models

`finiteCWEulerCharacteristic` is the finite alternating sum of the numbers of cells.
`finiteCWEulerCharacteristic_eq_of_homotopyEquiv` states its invariance on finite
Hausdorff CW complexes. `finiteCWEulerCharacteristic_product` states χ(X×Y)=χ(X)χ(Y),
for finite Hausdorff CW carriers and an actual finite CW structure on the product;
`finiteCWEulerCharacteristic_cover` states χ(E)=dχ(B) for a finite constant-degree-d
cover between such carriers. Transport through the model equivalences gives the CW-type forms.

*Needs:* Native finite-CW Euler–Poincaré comparison and actual Hausdorff models.

Consume the native alternating cell count and Euler--Poincare equality
   with alternating homology rank over a field for finite CW complexes.  Transport it to spaces of
   finite CW type and prove independence of the chosen Hausdorff finite
   CW model, installing its actual witnesses for the native cellular
   comparison. The original space need not be Hausdorff merely to possess
   such a model. The cell-count definition can be made on a bare native
   finite CW structure, but its homotopy invariance and agreement with
   singular homology require a Hausdorff carrier.

**Checks.**

- A point has one 0-cell and χ=1; a zero module is not substituted for its homology.
- The one-vertex, one-edge circle gives χ=1−1=0; a subdivided circle gives 2−2=0.
- The zero-cell empty structure gives χ=0; S² with one 0-cell and one 2-cell gives 1+1=2.


### 7.2 Homotopy and product invariance

*Needs:* §7.1, §5.1 and §5.5 for bundles.

Prove homotopy invariance, product multiplicativity, and multiplicativity for fibre bundles
   with finite-CW base and fibre.  The bundle theorem must be derived from Layer 5's chain or
   spectral-sequence machinery.
### 7.3 Cover multiplicativity

*Needs:* §5.3 and §7.1.

Prove finite-cover multiplicativity from transfer and additivity for finite excisive
   decompositions from Mayer--Vietoris (Hatcher, Theorem 2.44, p.146, with Section 2.2,
   Exercises 21 and 22, p.157: χ(X)=χ(A)+χ(B)−χ(A∩B) for subcomplexes and χ(X̃)=dχ(X) for a
   d-sheeted cover; the cover case also follows by lifting a finite CW structure cellwise).
   Prove cellular-stratification additivity from the relative cellular filtration.
### 7.4 Standard Euler values

*Needs:* §§7.1–7.3; ComplexKahlerGeometry K7 for projective spaces.

State cofibration, compactness, and finiteness assumptions explicitly.  Establish the standard
   checks `chi(S^n)=1+(-1)^n`, `chi(T^n)=0` for `n>0`, and
   `chi(CP^n)=n+1`. The complex-projective check consumes
   ComplexKahlerGeometry K7.1's projective model and K7.2's finite CW structure.
   K7.1 consumes ComplexManifolds Milestones 1–3's complex-manifold,
   real-restriction and atlas transport, K3.0's holomorphic calculus and K1's
   complex orientation. K7.2's CW construction consumes K7.1 and Layer 4;
   its separate projective cup calculation consumes ordinary Layer 6.
   No complex-projective construction is required in Layer 4, and the Euler
   cell-count check does not consume K7's later Hodge or Serre-duality results.


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

*Needs:* Native based homotopy groups, §4.5 and cellular approximation; §4.0 for kified products.

Define based top pair from a `TopPair` and an actual point of its subspace, together with
   basepoint-preserving maps of pairs. Extend cubical `HomotopyGroup` with pointed maps,
   functoriality, basepoint change, relative homotopy groups `pi_n(X,A,a_0)`, and the boundary maps
   and long exact sequence of that based pair. State relative groups for NDR pairs/cofibrations,
   rather than attaching them to arbitrary inclusions without hypotheses. The empty-subspace pair
   admits no such based carrier.
   Keep the low-degree algebra honest: use pointed-set and group carriers in the ranges where
   relative homotopy is not abelian, and expose a `ModuleCat Z` carrier only in degrees at least
   three.  In particular, `pi_2(X,A)` is group-valued in general; its abelianization, not the
   unmodified group, is the module-valued source available without connectivity assumptions.
   Own relative CW connectivity from cell dimension: for a nonempty native relative
   CW pair (X,A) in a Hausdorff ambient space, with every relative cell of
   dimension at least λ≥2, Layer 4.5's relative cellular approximation and
   cofibration API give π_i(X,A,a)=0 for 1≤i<λ at every a∈A. In degree 0,
   prove every point of X can be joined to A by a path. Prove the component
   map is bijective, inclusion induces π_q(A,a)≅π_q(X,a) for 1≤q≤λ−2,
   and is surjective for q=λ−1. Include the pointed-set relative degree 1;
   the endpoint surjectivity also holds for λ=1 as a component statement.
   Prove naturality of the induced isomorphisms under based maps of pairs.
   Export its transport: let (X_c,A_c)
   be that native CW pair, and let g:X_c→Y, f:A_c→B commute with the two
   inclusions, where B⊆Y is a subspace. If f and g induce bijections on
   every π_q (including components), at every a∈A_c and its images
   (equivalently, at one chosen a in each path component), the same inclusion
   range holds on (Y,B). The actual commuting
   square transports the bijection/surjection; component bijectivity and
   basepoint change give the result at every b∈B as a corollary of the
   pointwise prototype. If relative groups of the
   target pair are used, take its cofibration/NDR data as a separate hypothesis.
   In particular, based homotopy equivalences of pairs supply these hypotheses.
   RiemannianGeometry R3 applies the transport theorem to
   CharacteristicClasses C2.0's bundle-cell relative CW models, compared with
   MorseTheory M5's actual Morse–Bott negative-disk attachments; the sphere Freudenthal theorem belongs to the downstream stable-homotopy development.
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

### 8.2 Kan and cubical comparison

*Needs:* Native simplicial sets, Kan fillers and realization; §§4.4–4.7.

Construct homotopy groups of Kan simplicial sets, prove
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
   Prove that every simplicial group is a native `SSet.KanComplex`.
   Own the natural Moore comparison:
   for simplicial abelian groups G, π_n(G)≃H_n(NG), including components in
   degree zero. For general simplicial groups set N_n=⋂_(i=1)^n ker d_i
   with differential d₀, matching native `normalizedMooreComplex` in the
   abelian case. Prove π_n(G)≃ker(d₀|N_n)/d₀(N_(n+1)) for n≥1,
   with normality of the boundary subgroup and commutativity of the quotient;
   π₀(G) is the possibly nonabelian group G₀/d₀(N₁). Own
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
  d₀=h, d₁=gh, so the class of g followed by h is gh, and the comparison with the cubical
  π₁ of the realization sends the 1-simplex g to the loop g. A model composing in the other
  order sends (g,h) to hg; for g=(12), h=(23) these are the distinct 3-cycles (123) and (132).
- For the free simplicial abelian group on the simplicial circle Δ¹/∂Δ¹, the normalized
  Moore complex has N₀=ℤ, N₁=ℤ(e−s₀v) (the kernel of d₁ on ℤ{e,s₀v}) with d₀(e−s₀v)=0, and
  N₂=0, so π₀=π₁=ℤ and π_n=0 for n≥2, matching H_*(S¹;ℤ); the unnormalized complex has
  ℤ² in degree 1 and ℤ³ in degree 2 with the same homology, and the identification
  π_n≅H_n(NG) uses the normalized one.
### 8.3 Absolute Hurewicz

*Needs:* §§2.5 and 8.2; DGFloer Layer 1 items 1–2 for degree-one and connected-map comparison.

Own the general absolute Hurewicz map for every n≥1. A native generalized
   cubical loop g descends through the Layer 4.4 quotient q to a pointed sphere
   map ḡ; define h[g]=ḡ_*[S^n] on the outward-first normalized generator.
   Prove independence of representatives, group law and naturality. In degree
   one it factors through abelianization; DGFloer Layer 1 item 1 owns the
   theorem that this exact map is an isomorphism, through its chain comparison.
   For arbitrary spaces consume DGFloer 1.2's direct Eilenberg-subcomplex
   connected-map comparison; it uses face-compatible compression and prisms,
   not this Hurewicz theorem. Prove the absolute theorem: an `(n-1)`-connected pointed
   space has reduced integral homology zero below `n` and `pi_n(X) ~= H_n(X;Z)` for `n>=2`.

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

*Needs:* §8.1 relative homotopy and §2.3 relative homology; based NDR/cofibration data.

Prove relative Hurewicz for a based cofibration/NDR pair.  If `A` and `X` are simply connected
   and `pi_i(X,A)=0` for `i<n`, prove `H_i(X,A;Z)=0` below `n` and that relative Hurewicz is an
   isomorphism in degree `n`.  Derive the exact isomorphism and surjectivity range for
   `H_i(A)->H_i(X)` from the pair sequence.  In degree two, first derive commutativity of
   `pi_2(X,A)` from these connectivity hypotheses, prove that the map to its abelianization is an
   isomorphism, and only then identify it with relative homology.
### 8.5 Whitehead and proper homotopy

`HasProperHomotopyInverse` requires a proper inverse and jointly proper homotopies
on the full cylinders. `HasProperHomotopyExtensionProperty` quantifies over actual
proper maps and jointly proper boundary homotopies, with equality to the prescribed
initial map. `properStrongDeformationRetract_of_inverse` rectifies a proper homotopy
equivalence given by a subspace inclusion to a proper strong deformation retraction.

- Prove compatibility of proper inverse data with composition and homotopy transport.
- Prove proper extension for the cylinder-boundary pair and strongly locally finite CW pairs.
- Prove the rectification fixes the subspace at every time and preserves joint properness.

**Checks.**

- For A=X, r=id and H(t,x)=x; inverse images of compact K are I×K, compact.
- For X=I and A={0}, r(x)=0 and H(t,x)=(1−t)x fix A, with H(0,x)=x and H(1,x)=0.
- For X=ℝ and A={0}, the constant retraction has preimage ℝ of {0}, which is
  noncompact; an ordinary contraction is not a proper inverse.

*Needs:* §§4.5 and 8.3–8.4; proper version additionally the supported comparison in §6.2 and CharacteristicClasses C1.2a.

Prove `ordinaryWhitehead` for the actual map between Hausdorff CW complexes: it induces a bijection on components and on every positive homotopy group at every basepoint. Use cellular approximation and skeletal
   induction.  Combine relative Hurewicz with the mapping cylinder to prove homological
   `homologicalWhitehead` for simply connected CW complexes, then extend both results to spaces of CW type. `CWTypeModel` bundles an actual Hausdorff CW model and a homotopy equivalence; `ordinaryWhitehead_cwType` and `homologicalWhitehead_cwType` retain those models explicitly. Integral coefficients in the signatures use the universe lift of ℤ, not a restriction to small spaces.

   - Compose the witness with an actual homotopy equivalence of original spaces.
   - Transport a model along a homeomorphism, retaining its Hausdorff and CW witnesses.
   - Derive Whitehead for the specified map by transporting it through both model equivalences.

   **Checks.**

   - The identity model of ∅ has zero components; it cannot be replaced by a point with one component.
   - I admits a point model through its contraction, with H₀=ℤ and H₁=0 on each side.
   - S¹ cannot have a point model: its π₁=ℤ differs from 0, despite both being connected.

   First own the single predicate *simply connected at infinity*: for every
   compact K⊂X there is a compact L⊃K such that every continuous circle in
   X\L is nullhomotopic in X\K. A nullhomotopy stays in that complement;
   connectedness/number of ends is a separate condition. On locally compact,
   second-countable spaces prove equivalence with any cofinal compact-exhaustion
   formulation, exhaustion independence, homeomorphism invariance and invariance
   under proper homotopy equivalence. FourManifolds consumes this predicate.
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
   `HasProperHomotopyInverse`, yields a proper retraction r:X→A and a joint
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

`FiniteCWTypeModel X` bundles a Hausdorff finite CW model of `X` with a homotopy
equivalence to it, extending the CW-type witness of 8.5. `compactManifoldFiniteCWType`
states that a compact Hausdorff second-countable smooth manifold with the Euclidean model
has such a model, and `compactManifoldWithBoundaryFiniteCWType` states the same for the
half-space model. `simplyConnectedHomologySphere_homotopyEquiv_sphere` states the
recognition corollary: a simply connected space of CW type whose integral homology
vanishes outside degrees `0` and `n` and is `ℤ` in degree `n ≥ 2` is homotopy equivalent
to the unit sphere of `ℝ^(n+1)`.

*Needs:* GeometricTopology smooth triangulation and §4.5; §§8.3–8.5 for recognition.

Prove that every finite-dimensional Hausdorff second-countable smooth manifold
   with the Euclidean or half-space model, with or without boundary, has
   countable locally finite CW type by consuming GeometricTopology's
   smoothing-and-triangulation comparison item 1 and its realization homeomorphism.
   The compact case has finite CW type (`compactManifoldFiniteCWType`,
   `compactManifoldWithBoundaryFiniteCWType`): a finite smooth triangulation gives a
   Hausdorff finite CW model and the realization homeomorphism is the equivalence.
   Include the boundary-pair forms and
   finitely many prescribed interior marked points outside the relative boundary locus. As a reusable corollary, prove that a simply connected integral homology
   `n`-sphere, `n>=2`, is homotopy equivalent to the standard `S^n`
   (`simplyConnectedHomologySphere_homotopyEquiv_sphere`): by 8.3, Hurewicz identifies
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
  connectivity excludes it; for `n=0` a simply connected space with the homology of `S^0`
  would be contractible while `S^0` has two points, which is why `n ≥ 2` is a hypothesis;
  for `n=1` the hypotheses are contradictory (simple connectivity forces `H_1=0`).

### 8.8 Nonabelian classifying spaces

`groupClassifyingSpaceBasepoint` is the unique realized nerve vertex in
`groupClassifyingSpace`; `groupClassifyingSpace_isEMOne` states that this based
realization is a K(G,1) for every discrete group G, without assuming commutativity.

*Needs:* §4.7, ordinary §6.1, native nerve and universal covers; ClassifyingSpaces Stages 3–4 only for the model comparison.

**Nonabelian classifying spaces.**
   Own the single generic bar/nerve construction for every discrete group π. Use native `CategoryTheory.nerve`, `SingleObj π`,
   and `SSet.toTop`; construct the contractible free π-space Eπ, its covering
   Eπ→Bπ; consume Layer 4.7's single realization CW structure on both. Prove its native
   `TauCeti.IsEilenbergMacLaneSpaceOne π` property and identify its π₁ with π,
   naturally in group homomorphisms. Pin the bar edge labelled g to g under
   Mathlib's `SingleObj` composition and `FundamentalGroup.mul_def` conventions: both
   compose the later traversal on the left. Prove the oriented-edge identification
   is compatible with the native group operation.
   Compare this bar model pointedly with ClassifyingSpaces' Milnor and
   presentation models, using its Stage 3 items 11–15 and Stage 4 items 16–18.
   Separate the raw bar construction (8.8a), which feeds DGFloer's abelian
   K(A,1) specialization, from the normalized ClassifyingSpaces model comparison
   (8.8b). The latter uses only the actual ClassifyingSpaces Stages 3/4 model, uniqueness and
   resolution interfaces.
   Construct the maps and inverse homotopies normalized by
   κ_bar ∘ π₁(c_G)=κ_model, so the induced group map is the identity on G.
   State the conversion between the left deck action and the native
   Deck≃π₁ᵐᵒᵖ convention explicitly, including the inversion isomorphism
   G→Gᵐᵒᵖ where used. Prove group-homomorphism naturality up to pointed
   homotopy and the induced naturality on cohomology. For each A:Rep R G,
   prove that pullback along c_G and the coefficient-normalized comparison
   identify both local-system cohomology maps with the identity on native
   groupCohomology; compare the augmentation-preserving resolution maps
   up to chain homotopy. Keep the existing bar-label inversion below.
   The raw bar supplies the object used by DGFloer Layer 1 item 4's abelian
   specialization. The normalized comparison uses the ClassifyingSpaces Stages 3/4
   interfaces named above.
   DGFloer Layer 1 item 4 aliases the abelian specialization as K(A,1);
   the generic CW/cover proof is supplied only here. For each connected
   pointed CW complex X prove `[X,Bπ]_*≃Hom(π₁X,π)` and that forgetting basepoints
   gives the conjugation-orbit description of `[X,Bπ]`. Treat disconnected X
   componentwise. Use the exact classifying-space and local-coefficient comparison
   to identify `H*(Bπ;A)` with Mathlib's `groupCohomology A n` for every
   `A : Rep ℤ π`, through its native `inhomogeneousCochains` complex. Construct
   the corresponding `LocalCoefficientSystem ℤ Bπ` and chain comparison.
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


### 8.9 Relative obstruction theory

*Needs:* §§4.4–4.5, 6.1 and 8.1; DGFloer Layer 1 item 2 for fibre transport.

**Relative obstruction cochains.**
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

*Needs:* §§4.5, 6.1, 8.3 and 8.9; DGFloer Layer 1 items 1 and 4; GeneralizedCohomology G2.1 product comparison and §4.0.

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
    dimension and any number of components, with `H^n(X;A)`. Prove surjectivity
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
    Layer 4.0's right adjoint k in i⊣k, counit and CW compact-
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
Theorem 3, p.276: for compact Hausdorff X and Hausdorff Y equipped with a `CWTypeModel`,
the compact-open space C(X,Y) has an actual `CWTypeModel`. Milnor states Theorem 3 for a
compact n-ad with no separation axiom; the Hausdorff hypothesis on X is kept because the
proof's function-space steps (continuity of evaluation and the exponential law carrying
homotopies into C(X,Y)) are available for compact Hausdorff sources (Hatcher, Appendix,
Propositions A.14–A.16, pp.530–531). The relative n-ad and based-loop
forms below retain the relative data.

*Needs:* §4.0 and §4.5 for mapping-space CW type; §§8.5 and 8.10, DGFloer Layer 1 item 2 and Layer 2 item 3 for EM loops.

**Mapping-space CW type and ordinary EM loops.**
    **8.11a. Mapping-space and based-loop CW type.** This independent block uses the earlier CW/pair
    foundations and Layer 4.0 only; it has no input from 8.10,
    the EM loop comparison below, or the EM loop comparison.
    Prove the finite-CW-source pair specialization
    of Milnor 1959 Theorem 3 and Corollary 3, p.276, for n-ads: mapping spaces from a finite CW pair
    into a Hausdorff CW pair, with prescribed relative/basepoint values,
    have based CW type in the compact-open/Kelley topology. Own the full inputs
    in their relative n-ad forms. Replace any CW n-ad by the weak realization
    K_w of a native abstract simplicial n-ad, with actual homotopy equivalences,
    using skeletal simplicial approximation and mapping cylinders. Construct
    the metric realization K_m on the same finite-support barycentric points
    (the bounded ℓ¹ metric topology), and prove Dowker's K_w≃K_m comparison,
    relative to the subcomplexes. Develop the metric ANR/ANE neighborhood-
    retraction/extension API using actual closed embeddings and open
    neighborhoods in arbitrary metric ambient spaces, without a separability
    assumption. Own the Arens–Eells/Wojdysławski closed embedding of every
    metric space into a convex subset of a normed real vector space; keep the
    convex-hull carrier rather than imposing completeness or separability.
    Own Dugundji's extension theorem for continuous maps from closed subsets
    of metric spaces into convex subsets of normed spaces, using native
    `PartitionOfUnity` and locally finite barycentric combinations. Use these
    inputs to prove ANR⇔ANE. Construct an open neighborhood of the diagonal
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
    Finally prove the CW-domination criterion by an explicit homotopy-idempotent
    mapping telescope, with dominating maps and homotopies fixed on the
    relative n-ad. These inputs establish the function-space CW-type theorem
    independently of any weak-equivalence upgrade.
    Apply it to (I,{0,1})→(X,{x₀}) with x₀ a 0-cell to obtain
    CW type of the based loop space; compare native fixed-interval loops with the Kelley
    mapping carrier. Own the interval-product comparison
    k(Y×I)≅k(Y)×I from Layer 4.0's compact-test/product API,
    and prove k preserves homotopy equivalences, including
    their relative forms; transport the CW-type witnesses through it.
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
    using Layer 4.4's CW reduced-suspension Kelley comparison, then Layer 4.0's
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
    Layer 4.0's pointed compactly generated suspension–loop adjunction
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
[*Vector Bundles and K-Theory*, Section 3.3](https://pi.math.cornell.edu/~hatcher/VBKT/VB.pdf)
supplies the relative section obstruction and difference-cochain construction. The
local-coefficient extension retains the stated fibre transport rather than assuming
trivial monodromy.

### Examples

Identity maps on ∅, a point, S¹ and S² induce identity maps on components and all homotopy groups. The map ∅→point fails component surjectivity; degree two on S¹ gives 2ℤ≠ℤ on π₁.

### Dependencies

*Needs:* Layers 2–4 for relative homotopy and cellular induction; Layer 6 for cohomology; the named supplier sections in each item for EM and bundle applications.

## Downstream consumers

HomotopySpheres consumes Layer 4.0 and Layer 8; CharacteristicClasses consumes
cohomology, compact supports and the tower comparison; DGFloer consumes the raw bar,
CW and Serre-fibration foundations; DifferentialGeometry consumes singular integration
inputs and the homological fundamental classes. Stable and geometric applications use
the ordinary interfaces without supplying their foundations.

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
- BanachAlgebras (A8) consumes §2.7's finite-span form of the Brouwer fixed-point
  theorem, `brouwerFixedPoint_compactConvex` restricted to a finite-dimensional submodule.
- AffineMorseLefschetz (A4) consumes §8.1's based top pair.
- MorseTheory (M4) consumes §6.2's categorical cover, category count, normalized category
  and cup length.
- FuchsianOrbifolds (Layer 5), HeegaardFloer and HomotopySpheres consume §8.7's
  `compactManifoldFiniteCWType` and `FiniteCWTypeModel`, and §7.1's
  `finiteCWEulerCharacteristic` transported through that model.

### Dependency order

In the table below, bare references to Layer 6 mean the ordinary 6.0–6.5
cohomology/duality lane. They do not include the separate supported-cellular
supplement or the categorical LS supplement unless named explicitly.

| Layer | Depends on | Can proceed alongside |
| --- | --- | --- |
| 1 van Kampen | Mathlib  | 2--8 |
| 2 relative homology | Mathlib  | 1 |
| 3 subdivision/excision | 2 | 1 and 6.0 tower algebra |
| 4 CW/cellular and raw quotient comparisons | 2--3, native cochain algebra, Layer 4.0 for kified CW products and raw quotient/k-counit comparisons; 2.5 supplies sphere reference shuffles; general cohomological product/suspension compatibility belongs to 8.11b | 1 |
| 5 product maps (item 1) | 2 | 1, 3, 4 |
| 5 bundles/covers/finite covers | 2--4; Layer 5.0 Serre carrier/bundle API; DGFloer 1.2 homotopy LES/homology SS from 1–4 and DGFloer Layer 1 item 3, cohomology SS additionally from independent 6.0–6.2 | 1 |
| 6.0 tower algebra | native module/category/complex algebra | 1--8 |
| 6.1--6.4 cohomology/duality | 6.0 for 6.1 skeletal limits; 2--3, Layer 5 item 1 product maps, DifferentialGeometry Layer 2 tangent orientations, DifferentialGeometry Layer 2.4 sphere and DifferentialGeometry Layer 5.1 outward-first boundary conventions, native smooth local boundary charts plus the compact-domain Brown topological collar, and Layer 4.4's εₙ/radial native-sphere bridge used by 6.3; Layer 4 for cellular comparisons/RP² | 1 |
| categorical-cover/cup-length supplement after 6.2 | native opens/homotopies/ENat; 2–3, 5.1 and ordinary 6.1–6.2, plus the direct point-chain contraction; no manifold duality or Morse input | 6.3–6.5 |
| supported-cellular comparison after ordinary 6.2 | ordinary 4 cellular data, ordinary 6.1–6.2, CharacteristicClasses C1.2a S0–S4; proves countability and finite-support cellular/singular comparison. CharacteristicClasses S5 compatibility is a separate check | ordinary 6.3–6.5, Layer 7 and ordinary 8 proceed independently; proper 8.5 uses the needed support interfaces |
| 6.5 linking/degree consequences | 2--4 and ordinary 6.1--6.4; DifferentialGeometry Layer 10's smooth mapping-degree comparison only after the independent Layer 6.3 classes | 1 |
| 7 Euler characteristic | 2--6 and ComplexKahlerGeometry K7 for CPⁿ | 1 |
| 8.1–8.7 Hurewicz/Whitehead | 2--4 and the cited external roadmaps; proper 8.5 additionally CharacteristicClasses C1.2a S0–S3 support colimits/proper pullback and S4 jointly proper homotopy invariance and the supported-cellular comparison/countability supplement; CharacteristicClasses S5 is a compatibility target only | 1, 5; ordinary Hurewicz/Whitehead also alongside ordinary 6–7 |
| 8.8a raw bar/abelian input | 4, ordinary 6, native nerve/realization and universal-cover APIs | DGFloer Layer 1 item 4 abelian K(A,1) specialization |
| 8.8b normalized model comparison | Layer 8.8a bar model; ClassifyingSpaces Stage 3 items 11–15 and Stage 4 items 16–18 | 8.9 |
| 8.9 primary relative obstructions | 4, DGFloer 1.2 fibre transport, ordinary 6 cellular cochains, 8.1–8.7 | 8.8b |
| 8.10 ordinary representability | 4, ordinary 6, 8.3/8.6, 8.9, DGFloer Layer 1 items 1 and 4, GeneralizedCohomology G2.1 foundational product comparison and Layer 4.0 kification | 7 |
| 8.11a mapping-space and based-loop CW type | Earlier CW/pair foundations (4) and Layer 4.0 compact-generation/product API only; no 8.10 or the EM loop comparison input | 7 |
| 8.11b ordinary EM loops | 8.5, 8.10, 8.11a, DGFloer Layer 1 item 2 and standing/Layer 2 item 3 loop comparison, Layer 4.0 compact-generation/product API and its pointed adjunction, G2.1 foundation-only realization-product comparison | 7 |
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
- The tower difference map, six-term sequence, Mittag--Leffler vanishing,
  integer-graded Milnor sequences and cofinal shifts satisfy their naturality
  diagrams. The derived-limit cone compares with ordinary limits of degreewise
  surjective towers; homotopy-square cone maps retain their chosen homotopies.
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

- Ronald Brown, *Topology and Groupoids*, 3rd ed., Booksurge, 2006, Theorem 6.7.2 (p.240) and
  the Lebesgue covering lemma 3.6.4 (p.91).
- Samuel Eilenberg and Norman Steenrod, *Foundations of Algebraic Topology*, Princeton
  University Press, 1952, Chapters I--III.
- Allen Hatcher, [*Algebraic Topology*](https://pi.math.cornell.edu/~hatcher/AT/AT.pdf),
  Chapter 0, Sections 1.2, 2.1--2.3, 3.1--3.3, 3.B, 3.C, 3.G--3.H, 4.1--4.3, and the Appendix.
- George W. Whitehead, *Elements of Homotopy Theory*, Springer GTM 61, 1978,
  Chapters II--VII.
- Albrecht Dold, *Lectures on Algebraic Topology*, Springer, 1972, Chapters VII--VIII.
- J. Peter May, *Simplicial Objects in Algebraic Topology*, University of Chicago Press, 1967,
  for Kan complexes, simplicial homotopy groups, and comparison with realization.
- Jean-Pierre Serre, *Homologie singulière des espaces fibrés. Applications*, Annals of
  Mathematics 54 (1951), 425--505, for the homology spectral sequence of a fibration.
- John McCleary, *A User's Guide to Spectral Sequences*, 2nd ed., Cambridge University Press,
  2001, Chapters 1--2.
- Charles Weibel, *An Introduction to Homological Algebra*, Cambridge University Press, 1994,
  Chapters 3 and 5, for `Tor`, `Ext`, and the Kunneth and universal-coefficient spectral sequences.
- Kenneth Brown, *Cohomology of Groups*, Springer GTM 87, 1982, Chapter VII, for the
  Cartan--Leray spectral sequence and transfer comparison.

- John Milnor, [On Spaces Having the Homotopy Type of a CW-Complex](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/milnorcw.pdf), Theorem 2, p.273, for the n-ad CW-type comparison, and Theorem 3 and Corollary 3, p.276, for function-space and based-loop CW type; its countable class W₀ is distinct from the general class W used here.

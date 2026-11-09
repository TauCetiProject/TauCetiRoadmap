# Roadmap: algebraic topology of spaces and manifolds

**Summary.** This roadmap develops the map-level algebraic topology needed to calculate spaces
from open covers, CW structures, fibrations, and manifold decompositions.  It starts at Mathlib's
singular chains, fundamental groupoid, topological pairs, cubical homotopy groups, and classical
CW complexes, and at Tau Ceti's native singular, twisted, cellular, Hurewicz and Whitehead
theory.  It ends with reusable van Kampen, relative homology, excision, cellular comparison,
duality, Euler-characteristic, Hurewicz, Whitehead, ordinary Eilenberg–MacLane
representability, and relative obstruction theorems.  Its headline theorems are Poincaré duality
for closed manifolds (with `ℤ/2` coefficients, and with integer coefficients under an
orientation), relative Hurewicz with only the subspace simply connected, homological Whitehead,
finite CW type of compact manifolds, the `K(π,1)` property of the bar model, Hurewicz modulo a
Serre class, representability of ordinary cohomology by Eilenberg–MacLane spaces, and CW type of
mapping spaces out of finite complexes.

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
6. Relative homotopy groups, Hurewicz, Hurewicz modulo a Serre class, Whitehead, and homological
   Whitehead are proved for CW complexes and then for spaces of CW type.  The cubical and Kan-simplicial models of homotopy
   groups are naturally compared rather than allowed to form separate incompatible APIs.
7. Countable towers have the generic lim/lim¹, exact-sequence, Mittag--Leffler
   and integer-graded Milnor APIs, including cofinal-shift naturality, the
   derived-limit cone and its maps for specified homotopy-commuting squares.

8. Ordinary cohomology is represented on arbitrary CW complexes and CW pairs by its own
   functorial abelian Eilenberg–MacLane models; nonabelian classifying spaces, universal classes, loop comparisons,
   and primary relative obstruction cochains have explicit normalization and transport maps.

The scope includes ordinary cohomology on arbitrary CW complexes and the tools needed for
compact manifolds and finite CW-type spaces.  It
does not include generalized cohomology theories, spectra, bordism, or surgery obstruction
groups.  Those theories consume this roadmap's chain, CW, duality, and homotopy interfaces.

Ownership against the other roadmaps, by section:

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
  system using DG2 and DG5.1, construct twisted relative fundamental classes and
  their oriented integral specializations, and own the chain-level proof and
  consequences of manifold duality. Stage 6.3 builds its local-homology determinant-sign
  calculation from relative chains and excision.
- The differential-geometry roadmap consumes this roadmap's singular chains and cochains, relative
  cohomology, subdivision and small chains (Stages 2, 3 and 6), and needs Stage 6's universal
  coefficients, cup product and cochain Mayer–Vietoris sequence for the de Rham theorem. It owns
  smooth singular chains, integration over them and the de Rham comparison. AT6.3 consumes
  DG2's tangent-orientation API and DG5.1's outward-first boundary orientation. DG9.3 is
  Poincaré duality on de Rham cohomology alone, by induction from DG6.2 and DG6.4; it consumes
  nothing of AT6.3. The consumer of AT6.3's homological orientation system, chart-normalized
  point generators, chosen local section, relative twisted class datum (a relative class with
  prescribed local images) and compact-support class factory is DeRhamCohomologyAndDuality
  §4.1, which owns the integration comparison `∫_N η = ⟨ℐ_K[η], [N]_K⟩` together with the
  smooth/constant-system/real-coefficient conversions it needs, and builds no second class
  carrier. After this independent AT6.3 class construction, Stage6.5 compares its
  homological degree characterization with DG10's smooth mapping degree.
  DG9.3 and DG10 do not consume AT6.5's degree comparison; neither is a
  prerequisite for the AT6.3 orientation-system or fundamental-class construction.
- The [profinite-cohomology roadmap](../ProfiniteCohomology/README.md) owns continuous
  cohomology of profinite groups.  The singular cohomology here is cohomology of topological
  spaces; neither development introduces a second version of the other's objects.
- [ClassifyingSpaces](../ClassifyingSpaces/README.md) consumes Stage 8.8a's
  native nerve/bar model, with its CW structure, K(π,1) property and π₁
  identification, and owns the Milnor and presentation models, their pointed
  CW-type uniqueness, the cellular/bar projective-resolution comparisons and
  the identity-on-π₁ normalized comparison of the nerve/bar model with those
  models (its Stage 3, the comparison of the models); no stage here consumes
  those models or that comparison. Stage8.8a
  owns the raw nerve/bar construction; Stage8.8b owns only the bar model's own
  normalized pointed interface. The raw bar also supplies the abelian input
  used by Stage 8.8c.
- The ordinary Serre and Eilenberg–MacLane machinery is owned here wherever the
  pinned Tau Ceti does not already prove it. Tau Ceti proves the degree-one and
  absolute Hurewicz theorems, relative Hurewicz for highly connected pairs,
  Whitehead's theorem, the homology invariance of weak equivalences and CW
  approximation of path-connected spaces (the native declarations are listed
  in the Inventory below); every stage consumes them and no stage restates
  them. Stage 4.8 consumes the native weak-equivalence invariance and owns its
  connected-map refinement with local coefficients, CW approximation of
  arbitrary spaces and of pairs; Stage 5.0 owns the generic spectral sequence of a filtered
  chain complex; Stage 5.5 owns the fibration homotopy long exact sequence on
  native `TauCeti.TopCat.serreFibrations`, the fixed-interval path-space
  fibrations and the homological and cohomological Serre spectral sequences on
  singular chains, over CW and arbitrary bases; Stage 8.8c owns the single
  functorial abelian K(A,n) family, whose degree-one model aliases Stage 8.8a's
  generic bar construction and whose n≥2 models are the fixed Dold–Kan Γ(A[n])
  realizations, with the coefficient-natural normalized π_n identification
  including the comparison of Γ(A[1]) with the abelian nerve; Stage 8.8d
  consumes the native torsion Serre classes and owns Hurewicz modulo a class.
  Stage 8.8 owns the generic discrete-group bar/CW/cover proof; Stage 8.3
  consumes the native degree-one Hurewicz isomorphism π₁(X)ᵃᵇ ≅ H₁(X;ℤ) and
  the native higher-degree theorem and owns their comparison with the sphere
  normalization of Stage 4.4, and Stage 8.10 consumes the 8.8c family and that
  degree-one isomorphism. The 8.8c constructor uses only
  8.1–8.8a, preceding representability and obstruction theory.
  [DGFloer](../DGFloer/README.md) Layer 1 consumes these ordinary targets for
  its cubical transports and comparisons; GeneralizedCohomology G2 and G5,
  TopologicalKTheory T1.5 and ComplexKahlerGeometry K8 consume them directly.
  A citation of DGFloer Layer 1 for one of these ordinary targets resolves
  here: item 2's CW approximation of arbitrary spaces and its connected-map
  homology comparison (connectedMapHomologyComparison) are Stage 4.8; item 2's
  fibration homotopy sequence, Serre preimage excision and homological,
  cohomological and multiplicative Serre spectral sequences
  (arbitraryCWSerreSpectralSequence, arbitraryBaseSerreSpectralSequence and
  their cohomological counterparts) are Stage 5.5; item 3, the spectral
  sequence of a filtered complex, is Stage 5.0; item 4's Serre classes and
  Hurewicz modulo a class are Stage 8.8d and its functorial abelian K(A,n)
  family is Stage 8.8c. Item 4's mod-2 vanishing theorem and its
  Whitehead-tower applications are not targets of this roadmap.
  DGFloer's standing Moore-loop conventions and its Layer 2 item 3 consume
  8.11b's fixed-interval loops for their carrier comparisons; 8.11b owns the
  based suspension–loop adjunction on those native loops.
- Stage 4.5 owns the compact-generation interface: the coreflection k from
  `TopCat` onto Mathlib's `CompactlyGenerated`, given by
  `TopologicalSpace.compactlyGenerated` and right adjoint to the inclusion,
  with its counit, the CW and locally compact product comparisons and the
  interval-product comparison, consumed by 4.4's raw-to-kified quotient
  comparisons, 4.5's kified CW product, 8.10 and 8.11a/b. Stage 4.5 also owns
  the single simplicial-realization product comparison consumed by 8.10 and
  8.11b; it rests on Stage 4's realization CW structure and kified CW product,
  with no ordinary representability, EM-family or HA input.
  [GeneralizedCohomology G2.1](../GeneralizedCohomology/README.md) consumes
  that comparison for its pointed smash/quotient versions and monoidal
  diagrams. The homotopy-sphere roadmap consumes the compact-generation
  interface and 8.11b's adjunction for its pointed constructions and supplies
  nothing here.
- [Topological K-theory](../TopologicalKTheory/README.md) T1.6 consumes the
  earlier CW/Whitehead tools for its named fixed-rank infinite Grassmannian
  carriers, their final/weak CW topology and universal bundles.
  [CharacteristicClasses C1.5](../CharacteristicClasses/README.md) consumes
  Stages 4 and 6 for the finite-projective/cellular/cup comparisons on the
  rank-one RP∞ and CP∞ carriers, and consumes Stage 8.8b's normalized ℤ/2
  model, Stage 8.10's ordinary models and representability and Stage 8.12's
  native circle comparison for its identification of those carriers as
  ordinary EM spaces (its C1.5a, the classical Eilenberg–MacLane
  comparisons). No stage here consumes those carriers, comparisons or
  that identification. CharacteristicClasses C1.2a consumes the compactly
  supported local-coefficient cochains of the supported-cellular supplement
  after Stage 6.2 (their support colimit, enlargement and cofinality
  comparisons, proper pullback, open extension and jointly proper homotopy
  invariance) for its support excision and collared-pair triangle; no stage
  here consumes that excision or that triangle.
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
  `TopPair`, but relative homotopy uses Tau Ceti's native `TauCeti.BasedTopPair`, a `TopPair`
  together with a point of its subspace, whose morphisms are pair maps whose subspace component
  preserves that point. Relative cubes, groups, boundary maps, the long exact sequence, basepoint
  change, functoriality, and relative Hurewicz all take this based carrier; no declaration chooses
  a point from a bare pair.
- **Finiteness is a hypothesis.**  Euler characteristic is defined for finite CW structures and
  extended to finite-CW-type spaces by transport and invariance.  Additivity and multiplicativity
  state the necessary cofibration, excision, and finite-generation hypotheses.

## Exact supplier contracts

### From Mathlib

The development starts from these Mathlib interfaces at the pin.

- `TopCat`, `TopCat.toSSet`, `SSet.chainComplex`, `singularChainComplexFunctor`, and
  `singularHomologyFunctor`.
- `TopPair`, `TopPair.ofSubset`, `TopPair.incl`, `TopPair.diag`, and the
  `TopPair.HomologyPretheory` classes already present at the dependency pin.
- `FundamentalGroupoid`, `FundamentalGroup`, induced maps, homotopy invariance, and Mathlib's
  covering and homotopy-lifting APIs.
- Abstract and classical `CWComplex`/`RelCWComplex`, subcomplexes, skeleta,
  `CWComplex.FiniteDimensional`, `CWComplex.FiniteType`, and `CWComplex.Finite`.
- `HomotopyGroup`, based cubes, `ContinuousMap.HomotopyEquiv`, mapping cones and pointed cones,
  category-theoretic colimits, chain homotopies, homology functors, and exact couples.
- Mathlib's quotient topology on projective space in `Topology/Algebra/Projectivization.lean`:
  `Projectivization.instTopologicalSpace` on `Projectivization 𝕜 V` for a division ring 𝕜 and a
  topological 𝕜-module V, with `Projectivization.isQuotientMap_mk'`,
  `Projectivization.continuous_mk'`, `Projectivization.continuous_iff`,
  `Projectivization.continuous_mk`, `Projectivization.continuous_map`, and, under
  `ContinuousConstSMul 𝕜ˣ V`, `Projectivization.isOpenMap_mk'` and
  `Projectivization.isOpenQuotientMap_mk'`. Tau Ceti's
  `TauCeti/Topology/Algebra/Projectivization.lean` proves for the same quotient topology the
  instances `Projectivization.instT2Space`, `instCompactSpace`, `instPathConnectedSpace` and
  `instSecondCountableTopology`, and the affine charts
  `Projectivization.affineOpenPartialHomeomorph`; it declares that topology again under Mathlib's
  name, so at the pins it cannot be imported beside `Mathlib`, and Stage 4.6 transfers those
  proofs to Mathlib's instance rather than building a third topology.
- Isomorphisms and epimorphisms modulo a Serre class: `ObjectProperty.isoModSerre` (kernel and
  cokernel in the class) and `ObjectProperty.epiModSerre` (cokernel in the class) for a Serre
  class `P` with `P.IsSerreClass`, with their multiplicativity, two-out-of-three property,
  stability under retracts and (co)base change
  (`CategoryTheory/Abelian/SerreClass/MorphismProperty.lean`). Stage 8.8d applies them in
  `AddCommGrpCat` to Hurewicz homomorphisms through `AddCommGrpCat.ofHom`.

The following Mathlib pull requests determine interface shapes.  Import every declaration present
at the dependency pin.  Implement the rest in Tau Ceti with the same object and map shapes, and
replace local code by imports whenever a later pin supplies it.

- [mathlib4#41603](https://github.com/leanprover-community/mathlib4/pull/41603): the
  fundamental groupoid as a cosheaf and van Kampen as a colimit theorem.
- [mathlib4#41285](https://github.com/leanprover-community/mathlib4/pull/41285): relative
  simplicial homology through `SSetPair`.
- [mathlib4#38369](https://github.com/leanprover-community/mathlib4/pull/38369): the remaining
  Eilenberg--Steenrod axiom-class interfaces for `TopPair.HomologyPretheory`.
- [mathlib4#42435](https://github.com/leanprover-community/mathlib4/pull/42435): homotopy groups
  of Kan simplicial sets.
- [mathlib4#30109](https://github.com/leanprover-community/mathlib4/pull/30109) and
  [mathlib4#29792](https://github.com/leanprover-community/mathlib4/pull/29792): the lattice of
  CW subcomplexes and the colimit universal property of skeleta.
- [mathlib4#28246](https://github.com/leanprover-community/mathlib4/pull/28246): simple
  connectivity of spheres of dimension greater than one.

### From Tau Ceti

Tau Ceti's native carriers and theorems at the pin, which the stages consume and do not restate.

- Tau Ceti's native `LocalCoefficientSystem` and its constant/pullback/
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
  and exact cell-indexed coproducts; the homology comparison holds for
  finite-dimensional complexes with any abelian coefficients and for every
  complex when sequential colimits are exact in the coefficient category,
  hence for module coefficients. Stage 4 extends that carrier to chosen chain
  representatives and local systems.
- Native `TopCat.singularCap` and singular cup products in `Cohomology.Cap.Basic`
  and `Cohomology.Cup`. Consume their Alexander–Whitney maps and pairings,
  extending to direct local-system cochains, relative products and duality.
- Existing `TauCeti.MappingCylinder`, its `incl`, `proj`, `proj_comp_incl`,
  `isClosedEmbedding_incl` and `homotopyEquiv`, and
  `TauCeti.MappingCylinder.hasHomotopyExtensionProperty_range_incl` in
  `Topology.Homotopy.MappingCylinder` / `Extension.MappingCylinder`.
  Consume the HEP, relative-CW and strong-deformation-retraction APIs in
  `Extension.Basic` / `CWComplex` / `DeformationRetract`.
- Tau Ceti's native Hurewicz, Whitehead and approximation theorems, which the stages consume
  and never restate: the degree-one Hurewicz isomorphism
  `TauCeti.HurewiczOne.hurewiczHomologyAddEquiv` for a path-connected space
  (`AlgebraicTopology/Homotopy/Hurewicz/One/Basic.lean`, stated in universe zero), the absolute
  Hurewicz map `HomotopyGroup.hurewiczHom` and isomorphism `HomotopyGroup.hurewiczAddEquiv` for
  a space whose homotopy groups vanish below the degree
  (`AlgebraicTopology/Homotopy/Hurewicz/Absolute.lean`), the relative Hurewicz map
  `TauCeti.RelHomotopyGroup.hurewicz` and its bijectivity
  `TauCeti.RelHomotopyGroup.bijective_hurewicz_of_subsingleton_homotopyGroup` when both the
  subspace and the space are highly connected
  (`AlgebraicTopology/Homotopy/Hurewicz/Relative.lean`), Whitehead's theorem
  `ContinuousMap.IsWeakHomotopyEquivalence.homotopyEquiv` for spaces of CW type
  `TauCeti.CWType` (`AlgebraicTopology/Homotopy/Whitehead.lean`,
  `Topology/CWComplex/Classical/CWType.lean`), the homology invariance of weak equivalences
  with constant and local coefficients
  `ContinuousMap.IsWeakHomotopyEquivalence.isIso_singularHomologyMap` and
  `ContinuousMap.IsWeakHomotopyEquivalence.isIso_twistedHomologyMap`
  (`AlgebraicTopology/Singular/Homotopy/WeakHomotopyEquivalence.lean`), CW approximation of
  path-connected spaces `TauCeti.cwApproximation` with
  `TauCeti.isWeakHomotopyEquivalence_cwApproximationMap` and its lifts
  `TauCeti.cwApproximationLift`, unique up to homotopy
  (`AlgebraicTopology/Homotopy/CWApproximation/`), and the connectivity of a relative CW pair
  from the dimensions of its cells, `TauCeti.surjective_homotopyGroupMap_of_isEmpty_cell`,
  `TauCeti.injective_homotopyGroupMap_of_isEmpty_cell` and their `_of_comp_eq` transports
  along commuting squares (`AlgebraicTopology/Homotopy/Relative/CellDimension.lean`).
- Native cell attachment and killing of homotopy groups: attaching (n+1)-cells keeps π_k for
  k<n and is onto on π_n (`TauCeti.bijective_homotopyGroupMap_cellAttachmentIncl`,
  `TauCeti.surjective_homotopyGroupMap_cellAttachmentIncl`), and attaching them along loops whose
  classes normally generate π_n kills π_n (`TauCeti.subsingleton_homotopyGroup_cellAttachment`), in
  `AlgebraicTopology/Homotopy/CellAttachment.lean`; the killing tower
  `TauCeti.killHomotopyGroups` with its bijection below the starting dimension, its vanishing
  from it on, its CW structure `TauCeti.killHomotopyGroupsCWComplex` on a Hausdorff CW complex
  without cells above that dimension, and the extension of maps into spaces whose higher homotopy
  vanishes `TopCat.Hom.exists_killHomotopyGroupsIncl_comp_eq`
  (`AlgebraicTopology/Homotopy/KillHomotopyGroups.lean`). Stage 8.8c consumes both.
- Native relative homotopy: based pairs `TauCeti.BasedTopPair`
  (`Topology/Category/BasedTopPair.lean`) and the relative homotopy sets
  `TauCeti.RelHomotopyGroup` with their boundary maps, exact sequence and group structure in
  degrees at least two (`AlgebraicTopology/Homotopy/Relative/`).
- Native action of the fundamental group on the homotopy groups
  (`Topology/Homotopy/HomotopyGroup/FundamentalGroupAction.lean`): transport along a homotopy
  class of paths `TauCeti.homotopyGroupTransportQuotient` with its identity and composition
  laws, the left action `TauCeti.homotopyGroupMulAction` of `FundamentalGroup X x` on
  `HomotopyGroup N X x`, by group automorphisms in positive dimension
  (`TauCeti.homotopyGroupMulDistribMulAction`), its equivariance under based maps
  (`TauCeti.map_fundamentalGroup_smul`) and its triviality on a simply connected space
  (`TauCeti.fundamentalGroup_smul_eq_self`); Stages 8.9 and 8.10 consume them.
- The native cellular comparison `TauCeti.cellularSingularHomologyIsoUniv` holds in every CW
  dimension once the inclusion of the `(n+1)`-skeleton induces an isomorphism on `H_n`, which
  `TauCeti.isIso_singularHomologyMap_skeletonBasePairToComplex_succ_of_hasExactColimitsOfShape`
  proves whenever sequential colimits are exact in the coefficient category
  (`AlgebraicTopology/Cellular/Comparison.lean`); Mathlib's `AB5 (ModuleCat R)` instance
  (`Algebra/Category/ModuleCat/AB.lean`) supplies that for every module category.
- Native Künneth theorems: `TopCat.singularHomologyKunnethUnitIso` over a commutative
  semisimple ring, in particular a field, and the Künneth short exact sequence with its
  splitting when the coefficient ring has projective dimension at most one
  (`AlgebraicTopology/Singular/Kunneth/Basic.lean` and `Sequence.lean`).
- Native towers of modules: the shift `TauCeti.ModuleTower.shift`, `TauCeti.ModuleTower.lim`
  and `TauCeti.ModuleTower.limOne`, surjectivity of the shift for surjective transitions
  `TauCeti.ModuleTower.shift_surjective`, Mittag-Leffler vanishing
  `TauCeti.ModuleTower.subsingleton_limOne_of_isMittagLeffler`, the six-term sequence and the
  Milnor sequences of towers of complexes (`Algebra/Category/ModuleCat/Tower/`).
- Native Lusternik–Schnirelmann category: `TauCeti.LSCategoricalCover` and the unnormalized
  count `TauCeti.lsCategoryCount` with its monotonicity, subadditivity, deformation
  inequality, homotopy invariance, discrete, contractible and finite-coproduct laws
  (`Topology/Homotopy/LusternikSchnirelmann.lean`).
- Native Euler characteristic of spaces of finite CW type: `TauCeti.FiniteCWType`
  (`Topology/CWComplex/Classical/FiniteCWType.lean`), `TauCeti.eulerChar`, its independence
  of the model `TauCeti.eulerChar_eq_cwEulerChar` and homotopy invariance
  `ContinuousMap.HomotopyEquiv.eulerChar_eq`
  (`AlgebraicTopology/Cellular/EulerCharacteristic/FiniteCWType.lean`), and finite CW type of
  compact triangulable spaces `TauCeti.IsTriangulable.finiteCWType`
  (`Topology/Triangulable/FiniteCWType.lean`).
- Native local homology with constant coefficients: `TauCeti.localHomology`, vanishing above
  the dimension, and the compact-support existence and uniqueness theorems
  `TauCeti.exists_localHomologyRestriction_eq_of_isCompact` and
  `TauCeti.localHomology_ext_of_isCompact` (`AlgebraicTopology/Singular/LocalHomology/Compact.lean`),
  homological orientations `TauCeti.HomologicalOrientation` and the integral fundamental class
  `TauCeti.HomologicalOrientation.fundamentalClass` of a compact oriented manifold
  (`AlgebraicTopology/Singular/LocalHomology/Orientation/` and `FundamentalClass.lean`).
  Stage 6.3 consumes these for constant coefficients and owns the local-system extension.
- Native proper homotopy: `ContinuousMap.HasProperHomotopyInverse`
  (`Topology/Homotopy/Proper.lean`) and `TauCeti.SimplyConnectedAtInfinity` with its
  compact-exhaustion characterization and invariance under proper homotopy equivalence
  (`AlgebraicTopology/Homotopy/SimplyConnectedAtInfinity.lean`).
- Native Serre classes: the torsion class `AddCommGrpCat.isTorsion` and, for each `d`, the
  class `AddCommGrpCat.isKilledBySomePower d` of groups annihilated by a power of `d`, with
  Mathlib's `IsSerreClass` instances and their tensor and Tor closure
  (`AlgebraicTopology/SerreClass/`).
- Native no-retraction and Brouwer theorems: `TauCeti.noRetraction_diskBoundary` (the disk
  boundary is not a retract of the disk, stated as emptiness of retracts, n=0 included),
  `TauCeti.brouwerFixedPoint_topCatDisk`, `TauCeti.brouwerFixedPoint_compactConvex`,
  `TauCeti.brouwerFixedPoint_compactConvex_continuousOn`, `TauCeti.brouwerFixedPoint_closedBall`
  and `TauCeti.brouwerFixedPoint_compactConvex_finiteSpan`
  (`AlgebraicTopology/Singular/BrouwerFixedPoint.lean`).
- Native cofibration and CW theorems: Strøm's cylinder theorem
  `TauCeti.HasHomotopyExtensionProperty.zero_one_prod_univ_union_univ_prod`
  (`Topology/Homotopy/Extension/Prod.lean`), homotopy inverses relative to cofibered subspaces
  `TauCeti.HasHomotopyExtensionProperty.exists_inverse_homotopicRel` and relative to points
  `TauCeti.HasHomotopyExtensionProperty.exists_basedInverse_homotopicRel`
  (`Extension/HomotopyEquivRel.lean`), the cobase change of a closed embedding along a pushout
  in `TopCat`, `TauCeti.TopCat.isClosedEmbedding_of_isPushout`
  (`Topology/Category/TopCat/ClosedEmbedding.lean`), the relative cylinder CW structure
  `TauCeti.relCWComplexCylinder` (`Topology/CWComplex/Classical/Cylinder.lean`), cellular
  approximation `TauCeti.exists_isCellular_homotopicRel` and
  `TauCeti.exists_isCellular_homotopic` (`CellularApproximation.lean`), and the finite CW
  structure `TauCeti.ComplexProjectiveSpace.cwComplex` of the native sphere-quotient carrier
  `TauCeti.ComplexProjectiveSpace` (`ComplexProjective.lean`,
  `Topology/ComplexProjectiveSpace/Basic.lean`).
- Native finite-cover, mapping-torus and Čech tools: the transfer `IsCoveringMap.singularTransfer`
  with its degree formulas `IsCoveringMap.singularTransfer_comp_chainComplexMap` and
  `IsCoveringMap.singularTransfer_comp_chainComplexMap_eq_locallyConstantNsmul`, its
  composition law `IsCoveringMap.singularTransfer_comp` and the permutation local system
  `IsCoveringMap.singularChainComplexPermutationIso` and
  `IsCoveringMap.singularHomologyPermutationIso` (`AlgebraicTopology/Singular/Transfer/`); the
  Wang sequence `TauCeti.MappingTorus.wang_exact₁`, `TauCeti.MappingTorus.wang_exact₂`,
  `TauCeti.MappingTorus.wang_exact₃` and its naturality
  `TauCeti.MappingTorus.wangMappingConeMap_naturality` (`Singular/MappingTorus/`); the
  Čech–singular bicomplex `TauCeti.TopCat.openCoverSingularBicomplex`, its augmentation
  quasi-isomorphism `TauCeti.TopCat.quasiIso_openCoverSingularTotalAugmentation` and the
  spectral sequence `TauCeti.cechSpectralSequence` with
  `TauCeti.cechSpectralSequenceFirstPageXIso` and `TauCeti.cechSpectralSequenceAbutmentIso`
  (`Singular/Cech/`).
- Native path fibrations (`Topology/Homotopy/MappingPath/`): `TauCeti.LiftingFunction`,
  `TauCeti.IsHurewiczFibration` with `TauCeti.isHurewiczFibration_iff_nonempty_liftingFunction`,
  the mapping-path fibre projection `TauCeti.MappingPathFiber.isHurewiczFibration_proj`, its
  base-change description `TauCeti.MappingPathFiber.pullbackHomeomorph` and its homotopy
  invariance `ContinuousMap.Homotopy.mappingPathFiberHomotopyEquiv`.
- Native filtered-space spectral sequence and fibre local system:
  `TauCeti.filteredSpaceSpectralSequence` of an increasing `ℤ`-indexed family of subsets of a
  space, with its first page `TauCeti.filteredSpaceSpectralSequenceFirstPageXIso` (the relative
  singular homology of consecutive stages), its first differential
  `TauCeti.filteredSpaceSpectralSequence_first_page_d_eq` (the connecting map of the triple of
  three consecutive stages), its abutment `TauCeti.filteredSpaceAbutmentIso` (the singular
  homology of the space) and strong convergence for a finite filtration
  `TauCeti.filteredSpaceSpectralSequencePageXIsoGradedOfFinite`
  (`AlgebraicTopology/Singular/FilteredSpace.lean`); and the fibre-homology local system
  `TauCeti.fiberLocalSystem` of a Hurewicz fibration with a chosen lifting function, on
  normalized cubical chains (`AlgebraicTopology/Singular/Fibration/LocalSystem.lean`). Stage 5.5
  consumes both.
- Native spectral sequence of a filtered cochain complex of modules
  (`Algebra/Homology/SpectralSequence/Filtered/`): `CochainComplex.spectralSequence` with its
  first page `CochainComplex.spectralSequenceFirstPageXIsoCokernel` and first differential
  `CochainComplex.spectralSequence_first_page_d_eq`, the abutment
  `CochainComplex.filtrationAbutmentIso` with its image filtration, exhaustiveness
  `CochainComplex.exists_mem_range_filtrationAbutmentFiltrationι`, strong convergence for finite
  filtrations `CochainComplex.filtrationSpectralSequencePageXIsoGradedOfFinite` and, under the
  stated vanishing of incoming terms, for exhaustive ones
  `CochainComplex.filtrationSpectralSequencePageXIsoGradedOfExhaustive`, the comparison theorems
  `CochainComplex.isIso_homologyMap_of_isIso_spectralSequence_page` and
  `CochainComplex.isIso_homologyMap_of_isIso_spectralSequence_page_of_exhaustive`, naturality
  `CochainComplex.filtrationFunctorMap`, and the E∞ graded-piece identification
  `CategoryTheory.Abelian.SpectralObject.EInftyIsoCokernel`
  (`Algebra/Homology/SpectralObject/Abutment.lean`). Stage 5.0 consumes them.
- Native cohomology algebra: universal coefficients over a hereditary commutative ring
  `TopCat.singularUniversalCoefficientEquiv` with
  `TopCat.exact_singularExtToCohomology_singularKronecker`
  (`Cohomology/UniversalCoefficient.lean`), the Kronecker evaluation `TopCat.singularKronecker`
  (`Cohomology/Kronecker.lean`), the absolute and relative Bockstein
  `TopCat.singularCohomologyBockstein` and `TopPair.singularCohomologyBockstein`
  (`Cohomology/Bockstein.lean`), the cochain Mayer–Vietoris connecting maps
  `TopCat.singularCohomologyMayerVietorisδ` and `TopCat.singularCohomologyPairMayerVietorisδ`
  (`Cohomology/MayerVietoris/`), the cross product `TauCeti.singularCross` and the
  Eilenberg–Zilber cohomology isomorphism `TauCeti.singularEilenbergZilberCohomologyIso`
  (`Cohomology/CrossProduct.lean`), and graded commutativity `TopCat.singularCup_gradedComm`
  (`Cohomology/GradedCommutativity.lean`).
- Native local orientations: `Orientation.localOrientation` with its naturality
  `Orientation.localOrientation_map` under continuous linear equivalences
  (`Singular/LocalHomology/Orientation/Linear.lean`), the oriented-chart generator
  `OpenPartialHomeomorph.localOrientationOfOrientedChart` and the comparison with Mathlib's
  `Manifold.Orientation`, `TauCeti.localOrientationOfManifoldOrientation` (`Chart.lean`),
  `Topology.IsOpenEmbedding.localOrientationEquiv` (`OpenEmbedding.lean`) and path transport
  `TauCeti.localOrientationTransport` (`Transport.lean`).
- Native simplicial comparisons: `TopCat.toSSetPiMulEquivHomotopyGroup`, the Kan homotopy
  groups of the singular simplicial set against the cubical ones in degrees at least two
  (`AlgebraicTopology/Homotopy/SingularSet.lean`), and `ChainComplex.doldKanPiAddEquivHomology`
  (`DoldKan/HomotopyGroups.lean`).
- Native classifying spaces: `IsQuotientCoveringMap.singularCohomologyIsoGroupCohomology` for
  every contractible free quotient cover (`Cohomology/GroupCohomology.lean`), Milnor's
  `TauCeti.classifyingSpace` with `TauCeti.classifyingSpaceSingularCohomologyIsoGroupCohomology`
  and `TauCeti.classifyingSpaceTwistedCohomologyIsoGroupCohomology`
  (`ClassifyingSpace/Cohomology.lean`, `LocalCoefficients.lean`), the torsion `K(A,1)` axioms
  for finite groups `TauCeti.isAddTorsion_classifyingSpace_singularHomology` and
  `TauCeti.isKilledBySomePower_classifyingSpace_singularHomology` (`Torsion.lean`), the
  uniqueness theorems `TauCeti.IsEilenbergMacLaneSpaceOne.nonempty_homotopyEquiv` and
  `TauCeti.IsAspherical.exists_homotopyEquiv` (`Uniqueness.lean`) and the circle comparison
  `TauCeti.circleHomotopyEquivClassifyingSpace` (`Circle.lean`).
- Former names of this roadmap's own declarations that the native declarations replace, so
  that roadmaps citing them can follow: BasedTopPair is `TauCeti.BasedTopPair`;
  relativeCWConnectivityOfCellDimension and its transport are the `_of_isEmpty_cell` theorems
  of `CellDimension.lean`; hurewicz_degreeOne is `TauCeti.HurewiczOne.hurewiczHomologyAddEquiv`;
  hurewicz_connected is `HomotopyGroup.hurewiczAddEquiv`; whitehead is
  `ContinuousMap.IsWeakHomotopyEquivalence.homotopyEquiv`; towerDifference and countableLimOne
  are `TauCeti.ModuleTower.shift` and `TauCeti.ModuleTower.limOne`; LSCategoricalCover,
  lsCategoryCount and its API are the native declarations of the same names in `TauCeti`, and
  normalizedLSCategory is the count of the whole space minus one, stated in prose below;
  HasProperHomotopyInverse is `ContinuousMap.HasProperHomotopyInverse`;
  SimplyConnectedAtInfinity is `TauCeti.SimplyConnectedAtInfinity`; FiniteCWTypeModel,
  finiteCWEulerCharacteristic and FiniteCWTypeModel.eulerCharacteristic are
  `TauCeti.FiniteCWType` and `TauCeti.eulerChar`; RelativeTwistedClassDatum and
  embeddingIntegralLocalMap are described in prose in Stage 6.3; noRetraction_diskBoundary,
  brouwerFixedPoint_topCatDisk, brouwerFixedPoint_compactConvex,
  brouwerFixedPoint_compactConvex_continuousOn and brouwerFixedPoint_compactConvex_finiteSpan
  are the `TauCeti` declarations of the same names; closedCofibrationCylinderHomotopyExtension
  is `TauCeti.HasHomotopyExtensionProperty.zero_one_prod_univ_union_univ_prod`;
  basedHomotopyInverseOfEquivalence is
  `TauCeti.HasHomotopyExtensionProperty.exists_basedInverse_homotopicRel` applied through the
  0-cell extension lemma of Stage 4.5; ordinaryEMUniversalClass is the normalized universal
  class ι whose existence is the first conjunct of `ordinaryEMRepresentability` (Stage 8.10);
  simplicialRealizationCW is Stage 4.7's realization CW structure, stated in prose there;
  supBallEuclideanDiskHomeomorph is Stage 2.5's sup-ball-to-Euclidean-disk homeomorphism;
  diskQuotientSphereHomeomorph is Stage 4.4's disk-quotient sphere homeomorphism, and
  diskBoundaryRelCW with its boundary subset diskBoundarySubset is Stage 4.4's disk-boundary
  relative CW structure; homotopyPushoutGluingComparison, cofibrationTowerHomotopyEquivalence,
  cwSubcomplexTowerUnion and cwSubcomplexNeighborhoods are Stage 4.5's homotopy-pushout gluing
  comparison, cofibration-tower homotopy equivalence, CW-subcomplex tower union and subcomplex
  neighbourhoods; poincareDualityMap_isIso is Stage 6.4's duality by cap with a fundamental
  class, stated as `poincareDuality_zmodTwo` and `poincareDuality_int`, and
  compactTriadPoincareLefschetz is Stage 6.4's compact triad duality; relativeHurewicz is
  `TauCeti.RelHomotopyGroup.hurewicz`; homotopyGroupKelleyProduct is Stage 8.1's Kelley product
  comparison of homotopy groups; simplicialGroupKan, simplicialGroupMooreHomotopyIso and
  kanRealizationUnitHomotopyIso are Stage 8.2's Kan property of simplicial groups, Moore
  comparison and Kan realization-unit comparison; endComponents, stableFundamentalGroupAtEnd and
  properWhiteheadSimplyConnectedCW are Stage 8.5's ends, stable fundamental group at an end and
  proper Whitehead theorem; mapsToGroupClassifyingSpaceEquiv is Stage 8.8b's bijection
  `[X,Bπ]_*≃Hom(π₁X,π)`; ordinaryEMRelativeRepresentability is Stage 8.10's relative
  representability of CW pairs; ordinaryEMLoopComparison (with ordinaryEMLoopComparison_pi) and
  ordinaryCohomologySuspension are 8.11b's EM loop comparison and its suspension σ_right;
  projectiveEMComparisons is CharacteristicClasses C1.5a, which consumes 8.12's native circle
  comparison; relativeCWPushout_base_isClosedEmbedding is
  `TauCeti.TopCat.isClosedEmbedding_of_isPushout` applied to the base of a relative CW pair;
  twistedRelativeSingularChainComplex and twistedRelativeHomology are `TopPair.twistedChainComplex`
  and `TopPair.twistedHomology`; and Stage 4 item 8, *Compact generation and the pointed adjunction*, is Stage
  4.5's compact-generation interface and 8.11b's based suspension–loop adjunction.

### From other roadmaps

- **[UniversalCovers](../../Completed/UniversalCovers/README.md)** (completed): universal-cover
  construction, deck transformations, quotient covers, basepoint change and induced maps on
  homotopy groups, consumed by Stage 8.
- **[GeometricTopology](../GeometricTopology/README.md)**: 12.1 (Whitehead's smooth
  triangulation of smooth manifolds, with or without boundary) and Layer 11 (the realization
  homeomorphism and CW structure of a triangulation), consumed by Stage 8.7, and its manifold
  boundary and collar conventions, consumed by Stage 6.
- **[DifferentialGeometry](../DifferentialGeometry/README.md)**: the tangent-orientation API of
  Layer 2 with the orientation double cover of 2.4, the outward-normal-first boundary orientation
  of Layer 5.1, consumed by Stages 6.3–6.4, and the smooth mapping degree of Layer 10, compared
  with the homological degree in Stage 6.5.

## How to read the build

Stage 1 is the fundamental-groupoid van Kampen theorem and is independent of the rest.  Stages
2–4 build relative singular homology, subdivision, excision and Mayer–Vietoris, and the CW,
cellular, quotient and cofibration toolkit, in that strict order; Stage 4.8 adds the
connected-map comparisons and CW approximation of arbitrary spaces.  Stage 5 builds the product
maps, Künneth and transfer, the spectral sequence of a filtered complex (item 0) and the Serre
spectral sequences of fibrations (item 5); its product maps (item 1) need only Stage 2.  Stage 6
builds towers and `lim¹`, cohomology, cup and cap products, local orientations, fundamental
classes and Poincaré–Lefschetz duality, with two supplements after 6.2: the supported-cellular
cochains and the cup-length bound for the Lusternik–Schnirelmann category.  Stage 7 is the Euler
characteristic.  Stage 8 builds relative homotopy, Hurewicz and Whitehead with their proper
forms, finite CW type of compact manifolds, classifying spaces and the abelian Eilenberg–MacLane
family, Hurewicz modulo a Serre class, obstruction theory, ordinary representability,
mapping-space CW type and Eilenberg–MacLane loops.  Each stage ends with its examples and its
dependency table; in those tables a bare reference to Stage 6 means the ordinary 6.0–6.5
cohomology and duality lane, not the supported-cellular or categorical supplements unless they
are named.  The chain `2 -> 3 -> 4` is strict; Stages 2–4 all feed Stage 5, except that Stage 2
alone feeds the product maps of Stage 5 item 1; and every stage from 2 through 6 feeds Stage 7.
No implementation may reverse one of these arrows by assuming a downstream comparison theorem as
input.

## Stage 1: van Kampen through the fundamental groupoid

This stage is independent of Stages 2--8.

1. For an open cover `U : i -> Opens X`, consume the native Cech diagram of all nonempty finite
   intersections, with inclusion functors between their fundamental groupoids.  State the cover
   using native `TopologicalSpace.IsOpenCover U` and its union/supremum cover criterion.
2. Consume native cover generation by subdivision of paths: every morphism in `FundamentalGroupoid X` is a composite of
   morphisms lying in cover members. Derive from the native colimit that two
   such composites agree exactly under the Cech relations.
3. Consume the native cocone to `FundamentalGroupoid X` and its colimit universal property,
   including naturality under maps of covered spaces and refinement of covers.
4. Consume native groupoid and fundamental-group two-open-set pushouts and the based theorem when the two opens and their
   intersection are path connected and contain the basepoint.  Derive iterated finite-cover and
   group-presentation corollaries.
5. Consume the native groupoid calculation on a circle covered by two arcs with disconnected intersection and
   on a wedge of circles.  The first check must use more than one basepoint and the second must
   consume the native wedge-of-circles free-group equivalence and recover its presentation maps.

6. For a topological space G with a continuous unital multiplication, construct pointwise
   multiplication on native based path-homotopy classes and prove that
   `FundamentalGroup G 1` is abelian. In particular this applies to every topological group,
   with no connectedness or covering-space hypothesis. Use the native product of path classes
   followed by the map induced by multiplication G×G→G; prove both unit laws and the
   interchange law with concatenation. Apply native Eckmann–Hilton and retain the existing
   fundamental-group product, unit and inverse definitionally. Identify pointwise and existing
   multiplication and prove naturality for actual continuous unital multiplicative maps.
   Account explicitly for native `FundamentalGroup.mul_def`, whose multiplication is reversed
   path composition. This construction uses native paths and groupoid maps independently of
   covers, manifold structures and the later CW stages. The construction and its comparison
   laws are targets of this stage, not headlines: the homomorphism from the fundamental group
   of G×G at (1,1) to that of G at 1 induced by the multiplication, the two unit laws of the
   pointwise product, the interchange law between the pointwise product and concatenation, the
   identification of the pointwise product with the existing product, naturality for
   continuous unital multiplicative maps, commutativity, and the resulting commutative-group
   instance whose underlying group is the existing one.

The proof spine is Brown, *Topology and Groupoids*, Section 6.7 (Theorem 6.7.2 and its proof):
subdivision by a Lebesgue number gives generation, the rectangular-grid subdivision of a homotopy
gives relations, and the universal property identifies the colimit; Sections 8.4 and 9.1
(Theorems 8.4.1 and 9.1.2) give the presentation corollaries.  Hatcher, *Algebraic Topology*, Section 1.2 supplies the based corollaries.

### Examples

- A two-open-set cover with disconnected intersection is handled by the groupoid colimit and
  yields the correct based theorem only after explicit basepoints are chosen.

### Dependencies

| Stage | Depends on | Can proceed alongside |
| --- | --- | --- |
| 1 van Kampen | Mathlib at the pin and the shape of mathlib4#41603 | 2--8 |

## Stage 2: relative singular chains and homology

1. Consume native relative singular chains on `TopPair`, obtained by applying the `SSetPair` relative-chain
   construction to `TopCat.toSSet`. Consume its cokernel colimit and exhibit the relative complex both as the quotient
   `C_*(X) / C_*(A)` and in the exact-sequence form selected by #41285, and prove the two forms
   naturally isomorphic.
2. Define the relative homology functor for coefficient objects in the natural preadditive
   category.  Prove functoriality, compatibility with composition, and the comparison
   `H_*(X, empty) ~= H_*(X)`.
3. Consume the native short exact sequence of chain complexes for a pair and its natural long
   exact sequence, with its connecting morphism and naturality square.  Do the same for triples
   `B subset A subset X`.
4. Consume native `singularHomologyPretheory` and its homotopy invariance, dimension and additivity,
   extending its interfaces and proving reduced/unreduced comparison in the interface shape of #38369.
5. Consume the native `(D^n,S^(n-1))`, point, discrete-space and disjoint-union calculations,
   extending their natural comparisons and local-coefficient instances.  These calculations
   fix the degree-zero and connecting-map conventions used in every downstream stage.
   Own the integral coordinate cube reference class: [I,∂I] is the class of
   t↦t with boundary [1]−[0]; [I^n,∂I^n] is its coordinate-order n-fold
   native Eilenberg–Zilber shuffle product, projected to relative chains.
   Prove its cycle/generator property and boundary-facet signs. Own the
   cube-to-sup-ball homeomorphism t↦(2t_j−1)_j from Iⁿ to the native
   sup-norm closed unit ball in Fin n→ℝ. Own the sup-ball-to-Euclidean-disk
   homeomorphism x↦(‖x‖_∞/‖x‖₂)x for x≠0 and 0↦0, using the native coordinate linear
   equivalence to EuclideanSpace. Pin these actual formulas and boundary
   images for all n≥0. Their positive radial factors preserve the ordered
   coordinate orientation. Define the sup-ball and Euclidean-disk reference
   classes by the actual pair-map pushforwards of the cube class; prove their
   comparisons. Own the coordinate disk comparison coefficient, the actual
   value of native singularHomologyDiskBoundaryPairIso on the coordinate disk
   class, and prove it is a unit; at dimension zero it is 1 by augmentation.
   This early normalization supplies cellular generators, independently of
   Stage 4.4's quotient homeomorphisms. Stage 4.4
   consumes these same maps and classes, with no earlier input from Stage 4.
   Stage 4 uses this early class for cell orientations; Stage 6 later proves
   equality with the coordinate-oriented ball's canonical relative fundamental
   class. This reference construction uses only native chains/shuffles and
   relative homology, without Stage 6 manifold duality. Own the sphere's
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
   inclusion into ordinary homology. Stage 4.4 compares its actual quotient
   maps and separately chosen based generator with this earlier two-case
   reference, retaining the opposite zero-sphere sign of that based generator.
   Prove that, after the actual coordinate product identifications, the signed
   triangulation chain of the cube equals the native
   iterated `TopCat.shuffle` of the n positive interval chains, factor order
   0,…,n−1. Prove the permutation/inversion sign equality, including n=0.
6. Define a local coefficient system as a functor from Mathlib's fundamental groupoid to the
   coefficient-module category. A simplex σ carries its chain coefficient at
   σ(e₀); its zeroth face transports that coefficient along [e₀,e₁], while
   other faces retain the first vertex. Consume native twisted chains, relative
   homology, map pullbacks, basepoint/monodromy formulas and constant-system
   comparison; extend their naturality and remaining APIs. Construct the pair/triple short
   exact sequences and their natural long exact sequences. Prove homotopy
   invariance with the coefficient-system identification transported along the
   homotopy, including relative homotopies. This uses the existing groupoid object and does
   not depend on Stage 1's van Kampen theorem.

7. Consume the native no-retraction theorem `TauCeti.noRetraction_diskBoundary`:
   `TopCat.diskBoundary n` is not a retract of `TopCat.disk n` for every n,
   including n=0 with empty boundary; and the native Brouwer theorems
   `TauCeti.brouwerFixedPoint_topCatDisk` on Mathlib's disk,
   `TauCeti.brouwerFixedPoint_compactConvex` for every nonempty compact
   convex subset C of a finite-dimensional real normed space E, acting on the
   subtype C with no full-dimensional or nonempty-interior hypothesis, its
   function-level form `TauCeti.brouwerFixedPoint_compactConvex_continuousOn`
   for ContinuousOn f C and MapsTo f C C, `TauCeti.brouwerFixedPoint_closedBall`
   for closed balls of radius ≥0, and
   `TauCeti.brouwerFixedPoint_compactConvex_finiteSpan` for C inside a
   finite-dimensional submodule V of an arbitrary real normed space, as used
   for finite convex hulls (`AlgebraicTopology/Singular/BrouwerFixedPoint.lean`),
   all with native `Function.IsFixedPt`. The native proof applies reduced
   integral H_(n−1) to a retraction equation, retracts a fixed-point-free disk
   map along the ray from f(x) through x, and reaches a general C through a
   point of its native intrinsicInterior and a homeomorphism of C with a
   closed ball of the direction space of its affine span. DifferentialGeometry
   10.5 consumes these theorems and supplies its degree comparison; the
   operator-theory roadmaps consume the function-level form, and BanachAlgebras
   A8's Schauder approximation and Lomonosov theorem consume the
   finite-dimensional theorem. Own only what the native file leaves implicit
   and a consumer uses: the radial description of C from a point c of its
   intrinsic interior by the reach
   `reach(u) = sup {t : ℝ | 0 ≤ t ∧ c + t•u ∈ C}` for unit directions u of
   the direction space, finite, positive, attained and continuous on the unit
   sphere, the radial homeomorphism t•u ↦ c+(t*reach(u))•u from the unit ball
   onto C for 0≤t≤1, its comparison with the inverse of Mathlib's native
   `gauge` on {v:(affineSpan ℝ C).direction | c+(v:E)∈C} through the existing
   convex-gauge continuity and homogeneity API, and the boundary/intrinsicFrontier
   comparison, with dimension0 a singleton; the unit-ball-to-disk
   homeomorphism x↦(‖x‖/‖e(x)‖)e(x), with value0 at0, of a rank-k E along a
   continuous linear equivalence e:E≃L[ℝ]EuclideanSpace ℝ (Fin k), followed by
   the native ULift homeomorphism, with its inverse radial formula, centre and
   norm equality identifying boundaries; the boundary identity of the ray
   retraction; transport of fixed points along affine homeomorphisms, the
   simplex and singleton specializations, and the compact fixed-point locus
   from the native `isClosed_fixedPoints` in Mathlib/Dynamics/FixedPoints/Topology.
   These use existing sphere/disk APIs independently of manifold duality.
   Compare the compact-convex statement with
   [the Lean community Brouwer interface](https://lean-lang.org/eval/problems/brouwer_fixed_point/),
   the [Zulip homology/Sperner discussion](https://leanprover-community.github.io/archive/stream/113489-new-members/topic/Brouwer%27s.20fixed.20point.20theorem.3F.html),
   [QICLean's compact-convex development](https://sirui-lu.com/QICLean/docs/QICLean/Topology/CompactConvexFixedPoint.html)
   and [Brendan Murphy's homological Brouwer development](https://github.com/Shamrock-Frost/BrouwerFixedPoint)
   as migration material for the function-level API and the convex-body
   transport, not as second homology or fixed-point APIs. The adapter to
   Mathlib [#36770](https://github.com/leanprover-community/mathlib4/pull/36770)'s
   `BrouwerFixedPoint E` closed-unit-ball class takes
   f:closedBall(0:E)1→closedBall(0:E)1 and Continuous f and yields
   ∃x,Function.IsFixedPt f x; it is `TauCeti.brouwerFixedPoint_closedBall` at
   radius1, and for real inner-product E it supplies that PR's class field
   with no assumption of a Brouwer instance. Adopt the upstream class
   interface when it lands.

The source spine is Eilenberg--Steenrod, *Foundations of Algebraic Topology*, Chapters I--III,
and Hatcher, Sections 2.1--2.2 and 3.H.  The Lean proof should pass through short exact sequences
of chain complexes and Mathlib's homology functor, rather than reconstructing an elementwise
exact sequence in every application.

### Examples

- Relative homology of `(D^n,S^(n-1))` and the connecting morphism to the sphere generator have
  the pinned sign.

### Dependencies

| Stage | Depends on | Can proceed alongside |
| --- | --- | --- |
| 2 relative homology | Mathlib at the pin and the shapes of mathlib4#41285 and mathlib4#38369 | 1 |

## Stage 3: subdivision, excision, and Mayer--Vietoris

This stage consumes Stage 2.

Every subdivision, prism, small-chain, excision and Mayer–Vietoris construction
in this stage includes Stage 2's local coefficient systems. Transport along
paths in each contractible simplex gives its subdivision coefficients; prove
naturality in both space maps and coefficient-system morphisms, and compatibility
with the pair/triple connecting maps.

1. Define affine subdivision of the standard simplex and barycentric subdivision of singular
   simplices in every degree.  Prove the boundary formula and construct the prism operator giving
   a chain homotopy from subdivision to the identity.
2. For an open cover, prove that every singular simplex becomes subordinate after sufficiently
   many subdivisions.  Turn the small chains into a subcomplex and prove its inclusion is a
   natural chain-homotopy equivalence.
3. Consume native excision for `TopPair` and extend to local coefficients: if the closure of the excised set lies in the interior of the
   subspace, the induced map on relative homology is an isomorphism.  Include maps of excision
   data and compatibility with the pair connecting morphism.
4. Consume native Mayer--Vietoris for a binary open cover and extend its natural
   long exact sequence to local coefficients.  Prove that its first map is `(i_U, -i_V)` under the pinned sign convention.
5. Check Mayer--Vietoris on `S^1` from two arcs and on `S^n` from two hemispherical
   neighbourhoods, including the connecting isomorphism in top degree.

Hatcher, Proposition 2.21 and the proof of excision in Section 2.1 give the small-chain proof;
Section 2.2 gives Mayer--Vietoris.  Eilenberg--Steenrod supplies the natural formulation for
pairs.

### Examples

- Mayer--Vietoris is derived from excision and agrees with the map induced by inclusions; it is
  not supplied as an unrelated exact sequence.

### Dependencies

| Stage | Depends on | Can proceed alongside |
| --- | --- | --- |
| 3 subdivision/excision | 2 | 1 and 6.0 tower algebra |

## Stage 4: CW pairs, cellular homology, and cofibrations

This stage consumes Stages 2 and 3. Use the native cellular complex and its
relative-CW carrier, with its Hausdorff and exact-coproduct hypotheses; module
coefficients satisfy the categorical exactness assumptions. Extend its API below.

1. Use Mathlib's characteristic maps and skeleta and native `cellularChainGroup`
   in degree n as the relative homology of consecutive skeleta. Consume
   `cellularChainGroupIso` to identify it with cell-indexed coproducts. In modules,
   identify it naturally with finitely supported coefficient-module-valued
   functions on `RelCWComplex.cell C n`, with the relative base explicit.
   For coefficient module R this is the free R-module on the cells. Use
   finite-support rather than finite-cell assumptions in the general definition.
2. Consume native `cellularDifferential` and its triple connecting-map description,
   including `d²=0`; identify its matrix entries with degrees of attaching maps,
   and prove naturality for cellular maps.
3. Consume native `cellularSingularHomologyIso` and `cellularSingularHomologyIsoUniv`,
   which hold for every relative CW complex, of any dimension, once sequential
   colimits are exact in the coefficient category, hence for every module
   category by Mathlib's `AB5` instance; for other abelian coefficient
   categories state the displayed exactness assumption. Construct the skeletal filtration exact
   couple and prove the cellular-to-singular comparison as a natural equivalence
   in the filtered derived or chain-homotopy category. Normalize oriented cell
   generators by pushing forward Stage 2.5's
   coordinate-oriented ball class through the characteristic map; reversing
   the orientation negates that generator. Construct chosen chain
   representatives, with naturality only up to specified chain homotopies; do
   not claim a strict natural transformation from cellular chains to ordinary
   singular chains. Extend the comparison to `RelCWComplex` and subcomplex pairs.
   Extend items 1–3 to Stage 2's module-valued local systems,
   with attaching-path transport and relative comparison. The degree-n chain
   module is the direct sum over n-cells of their integral orientation module
   tensored with the coefficient fibre at a chosen cell point, with the ring
   acting on the coefficient factor. A chosen cell orientation identifies that
   summand with the fibre; arbitrary coefficient fibres need not be free.
4. Consume native finite-CW Euler--Poincare and finite-generation results;
   extend their coefficient hypotheses, naturality and local-coefficient consequences.
   Own the earlier pointed quotient carrier `ordinaryPairQuotient`: collapse
   B together with a separately added point in X⊔* (the collapsed subset
   `ordinaryCofiberSupport` and relation `ordinaryCofiberSetoid`), with the
   quotient topology, basepoint `ordinaryPairQuotientPoint`, actual collapse map
   `ordinaryPairQuotientMap` and its pair form `ordinaryPairQuotientPairMap`,
   universal mapping property and subspace naturality.
   Thus X/∅ means X₊. Item 5 consumes this carrier for relative comparisons.

   **Checks.**
   - For B=∅ the quotient is X₊, the disjoint union of X and an isolated basepoint, so
     H̃₀(X/∅)≅H₀(X)=H₀(X,∅); a carrier that collapsed B without adding a point would give X/∅=X
     and lose one copy of the coefficients in reduced H̃₀.
   - For B=X nonempty the whole space and the added point form one class, so X/X is a point and
     its reduced homology vanishes, as H_*(X,X) does; a carrier collapsing B separately from the
     added point would give two points and H̃₀≅ℤ≠0.
   - For (Dⁿ,Sⁿ⁻¹) with n≥1 the quotient is homeomorphic to Sⁿ with the collapsed boundary as
     basepoint, so H̃_n(Dⁿ/Sⁿ⁻¹)≅ℤ≅H_n(Dⁿ,Sⁿ⁻¹); for n=0 the boundary is empty and D⁰/∅ is the
     two-point space S⁰, with H̃₀(S⁰)≅ℤ≅H₀(D⁰).

   Own the single chosen based sphere identifications for all n,m≥0: the
   disk-quotient sphere homeomorphism, the cube-quotient homeomorphism, the
   smash homeomorphism and the right reduced-suspension sphere homeomorphism
   Σ_right Sⁿ ≅ S^(n+1), the homeomorphism that DGFloer and RiemannianGeometry
   cite as reducedSuspensionSphereHomeomorph. Use native `TopCat.disk n`, its actual boundary-inclusion image,
   and native `TopCat.sphere n` (the lifted metric sphere); its basepoint
   is the positive first-coordinate pole p. The disk/cube quotient's basepoint
   is the collapsed boundary together with the added point. For n=0 the
   boundary is empty: D⁰⊔* is sent bijectively to S⁰ with its disk point at −p
   and its added point at p. For n>0, the cube-to-sphere map is the same
   cubical sphere quotient used by item 8.6. Construct the coordinate-order
   cube-to-disk homeomorphism as the composite of Stage 2.5's
   cube-to-sup-ball and sup-ball-to-Euclidean-disk homeomorphisms,
   with their boundary maps; the induced quotient homeomorphism commutes with both
   chosen sphere homeomorphisms and the actual collapse maps. These
   equations determine the two quotient homeomorphisms from the same q.


   Use the same pointed quotient to construct the compact based smash carrier
   (X×Y)/(X×{y₀}∪{x₀}×Y) and reduced suspension
   (X×I)/(X×∂I∪{x₀}×I), with the collapsed locus at the added point.
   The bare smash model is used here for compact Hausdorff inputs,
   including spheres; the raw suspension also applies to pointed Hausdorff CW
   spaces because X×I and its quotient are compactly generated. Own the
   comparisons of the raw quotient Z with kZ for the compact smash carrier,
   for the compact reduced suspension (the comparison DGFloer cites
   as compactReducedSuspensionCarrierComparison)
   and for the reduced suspension of a pointed Hausdorff CW space, using only
   Stage 4.5's compact-generation interface: the coreflection, its counit and
   the compact, CW and locally compact product comparisons. Pin their inverse to
   the actual inclusion/coreflection counit, with quotient/basepoint naturality.
   RiemannianGeometry R3 consumes the raw
   reduced-suspension quotient map and that sphere homeomorphism.

   Own their quotient maps and continuity/universal-property API.
   The smash homeomorphism sends Sᵐ∧Sⁿ to S^(m+n), with m coordinates
   followed by n coordinates; the right reduced-suspension homeomorphism sends
   Σ_right Sⁿ to S^(n+1), with the interval coordinate last. Prove their
   compatibility through I/∂I≃S¹, their basepoint equations, and the diagrams
   with cube concatenation as exact equations: sphereSmashCubePairMap m n
   equals basedCubeSpherePairMap (m+n), and
   reducedSuspensionSphereCubePairMap n equals basedCubeSpherePairMap (n+1).
   The surjective cube maps determine these homeomorphisms uniquely.
   Include associativity (with the dimension reassociation) and unit diagrams,
   whose nonbasepoint of S⁰ is −p, and
   the factor-interchange degree (−1)^(mn). These are actual based
   homeomorphisms, before homotopy, James or stable-spectrum constructions;
   item 8.11b supplies the homology/cohomology suspension machinery and owns
   the two-step suspension homeomorphism from its CB/B quotient followed by
   collapse of the basepoint meridian to the same raw interval-last quotient,
   with identity formula on (x,t) representatives.
   GeneralizedCohomology G2.1 consumes these quotients for its categorical
   monoidal adapters.

   Pin the based sphere reference generator in H_n(Sⁿ,{p};ℤ) independently:
   for n≥1 it is the image of the Stage 2.5 positive-local-chart/outward-first
   sphere class, and for n=0 it is [−p]−[p], using native
   `reducedSingularHomologySphereZeroIso_inv_ι`, transported through
   `diskBoundaryHomeomorph` and its coordinate linear isometry (which
   commutes with negation), and the reduced/pole-pair comparison. Prove that the disk/cube quotient, smash and right-suspension
   maps send their coordinate-order relative reference classes to this
   generator with coefficient +1; a homeomorphism alone does not establish
   the generator comparison. Define the right-suspension reference by the
   ordered cube shuffle, with the last interval oriented by [1]−[0]; this
   uses Stage 2.5's early native shuffles, not Stage 5's product packaging.
   Compare with native `reducedSingularHomologyTopCatSphereIso` through
   diskBoundaryHomeomorph and its actual recursive choices: prove the
   comparison is a unit ε_n∈ℤˣ, expressed through those choices, rather
   than asserting a fixed numerical sign for `Classical.arbitrary` poles.
   Retain the normalized reference independently of that generator. Own the
   native sphere unit and its comparison with the early disk coefficient:
   in dimension n+1 the disk coefficient is ε_n for n≥1 and −ε_0 for n=0.
   The latter minus sign follows from the native reduced pair boundary; ε_0=1
   exactly when its transported native `Classical.arbitrary` zero-sphere pole
   is p. Stage 2.5 owns the disk coefficient itself; this item derives its
   relation to the sphere normalization. The radial
   D^(n+1)-boundary→Sⁿ comparison has coefficient +1 for n≥1; for n=0
   the oriented interval boundary [p]−[−p] is minus the chosen reduced
   generator. The homotopy-sphere roadmap and RiemannianGeometry R3 consume these
   homeomorphisms and the explicit generator comparisons, without constructing
   a second sphere-suspension identification.
   Own the disk-boundary relative CW structure: the actual TopCat.disk n
   relative to the image of its boundary inclusion has one n-cell and no other
   relative cells, using the fixed Stage2.5 sup-ball/disk comparison and
   characteristic map. Export the homeomorphism from that subset's subtype
   to native `TopCat.diskBoundary n`.
   Include n=0 with empty boundary. Own the coproduct relative CW construction
   for arbitrary disjoint unions of these pairs, preserving cell labels,
   characteristic maps, the base and the actual disjoint-union topology.
   Export the homeomorphism from the coproduct base subtype to
   Σ i,TopCat.diskBoundary(n_i), transporting the actual attaching maps
   to the C(B,Z) pushout input. MorseTheory M2 consumes these disk pairs.
5. Consume existing `TauCeti.HasHomotopyExtensionProperty` and
   `TauCeti.hasHomotopyExtensionProperty_base` for native relative CW
   inclusions as closed cofibrations. Consume the existing mapping cylinder,
   projection equivalence and inclusion HEP, and the native cellular approximation
   theorems `TauCeti.exists_isCellular_homotopicRel`, homotopic relative to the base of a
   relative CW pair, and `TauCeti.exists_isCellular_homotopic`
   (`Topology/CWComplex/Classical/CellularApproximation.lean`); construct the relative
   and double mapping cylinders, cellular approximation relative to an arbitrary
   subcomplex through the induced relative structure, and skeletal induction.
   Consume existing
   `TauCeti.HasHomotopyExtensionProperty.exists_strong_deformation_retraction`
   when the inclusion is a homotopy equivalence.
   Own the relative CW pushout, the carrier `relativeCWPushoutCarrier`: for a
   Hausdorff native relative CW pair (Y,B),
   a Hausdorff space Z and a continuous attaching map a:B→Z, use the actual
   TopCat pushout Z∪_aY of the inclusion `relativeCWPushoutInclusion` and a,
   with its quotient topology. That Z→Z∪_aY is a closed embedding is the
   native cobase change of the closed embedding B→Y,
   `TauCeti.TopCat.isClosedEmbedding_of_isPushout`
   (`Topology/Category/TopCat/ClosedEmbedding.lean`), applied with Mathlib's
   `Topology.RelCWComplex.isClosedBase`. Prove that the
   pushout is Hausdorff (`relativeCWPushout_t2Space`), and construct native
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

   **Checks (`relativeCWPushoutCarrier`).**
   - For B=∅ the attaching map is empty and the pushout is the disjoint union Z⊔Y, with Z and Y
     both open and closed; a construction that collapsed B to a point would add a spurious
     point, and one that took Y/B alone would lose Z.
   - For B=Y (a relative CW pair with no cells) the pushout of the identity of Y along a is Z
     itself: the map Z→Z∪_aY is a homeomorphism, and the relative CW structure on the pushout
     relative to Z has no cells.
   - For (Y,B)=(D¹,S⁰) and Z a point the pushout is D¹ with its two ends identified, a circle,
     Hausdorff with one relative 1-cell; attaching the same pair to a two-point Z along a
     bijection S⁰→Z instead gives an interval, so the result depends on a and not only on
     (Y,B).
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
   and inverse homotopies fixing Z (Milnor, *Morse Theory*, Lemmas 3.6–3.7).
   Consume the native cylinder theorem
   `TauCeti.HasHomotopyExtensionProperty.zero_one_prod_univ_union_univ_prod`
   (`Topology/Homotopy/Extension/Prod.lean`; Strøm's product theorem, *Note on
   cofibrations II*, Theorem 6): for closed A⊆X with native HEP, the subset
   ({0,1}×X)∪(I×A) of I×X has HEP, in the native I×X order.
   Own `homotopyInversePairExtension_left` for pairs (X,A),(X′,A′). Require both
   inclusions to be closed cofibrations, f:X→X′ to carry A into A′, and
   both f and its restriction f₀:A→A′ to be homotopy equivalences.
   Given g₀:A′→A and H₀:g₀f₀≃id_A, construct g:X′→X and H:gf≃id_X
   with g|A′=g₀ and H|A×I=H₀ as actual maps into A. Construct the other
   inverse homotopy. Route: g₀ is a two-sided homotopy inverse of f₀, since
   it is a left inverse of a homotopy equivalence. Choose K₀:f₀g₀≃id_(A′)
   with f₀H₀≃K₀f₀ and H₀g₀≃g₀K₀ relative to the ends (Vogt, *A note on
   homotopy equivalences*, Proposition, p. 627). Brown's extension theorem for
   maps of cofibrations (Brown, *Topology and Groupoids*, 7.4.2 and its
   Addendum, pp. 285–286) extends g₀ to a homotopy inverse g of f with
   fg≃id extending K₀ and gf≃id extending the track sum
   H₀+g₀K₀f₀−g₀f₀H₀; that sum is homotopic to H₀ relative to the ends,
   because g₀K₀f₀≃H₀(g₀f₀×1) by the choice of K₀, and H₀(g₀f₀×1)≃g₀f₀H₀ by
   the interchange of tracks (Vogt, Lemma 1, p. 627). The native cylinder theorem (Strøm, Theorem 6) for
   the pair (X×I, X×∂I∪A×I) then deforms gf≃id relative to X×∂I until it
   restricts to H₀ on A×I. The H₀ clause is the point: the Addendum alone
   gives the modified sum, not H₀.
   Own the cofibration-tower homotopy equivalence: for sequences of Hausdorff
   spaces with closed-cofibration bonding inclusions and strictly commuting
   levelwise equivalences f_n, construct the actual mapping telescopes and
   their homotopy equivalences to the raw final-topology colimits.
   Construct strictly compatible left inverses and compatible left-inverse
   homotopies by `homotopyInversePairExtension_left`. Apply the same construction a
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
   Own the CW-subcomplex tower union: for a sequence of Hausdorff native CW
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
   Own the relative CW pushout's CW model (the target MorseTheory and
   CharacteristicClasses cite as relativeCWPushoutCWModel): when Z has a
   specified Hausdorff CW
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
   Apply the cofibration-tower homotopy equivalence to these strictly commuting
   comparisons for the infinite passage.
   When Z itself is CW and h=id,
   the comparison and its homotopies fix Z. Prove the raw/classical and
   categorical RelativeCellComplex/RelativeCWComplex carrier comparisons;
   no cellularity of the original attaching map is assumed. CC C2.0 uses
   these generic targets for disk-bundle attachments, and MorseTheory M2
   consumes the pushout, CW-model, compatible gluing and tower targets for
   its finite/infinite sublevel CW induction.
   Consume the native based-inverse theorem
   `TauCeti.HasHomotopyExtensionProperty.exists_basedInverse_homotopicRel`
   (`Topology/Homotopy/Extension/HomotopyEquivRel.lean`; Hatcher Proposition
   0.19): for points x₀, y₀ whose singletons have HEP and a homotopy
   equivalence e with e(x₀)=y₀, a based inverse with unit and counit
   homotopies rel those points, and its subspace form
   `TauCeti.HasHomotopyExtensionProperty.exists_inverse_homotopicRel` for a
   homeomorphism of cofibered subspaces. Own the 0-cell lemma that applies it
   to Hausdorff CW complexes with marked 0-cell basepoints: the singleton of a
   point of an open 0-cell is a subcomplex, so its inclusion has HEP by the
   native relative-CW theorem. Stage 8.5 and TopologicalKTheory T7.0 consume
   the composite.
   Consume the native relative cylinder CW structure `TauCeti.relCWComplexCylinder`
   (`Topology/CWComplex/Classical/Cylinder.lean`): for a relative CW pair (C,D), native
   `RelCWComplex` on C×I relative to (C×{0,1})∪(D×I), with original cell
   coordinates first and interval coordinate last and no 0-cells; endpoint maps are
   the actual inclusions. Own its naturality in cellular maps of pairs. Stages 8.9–8.10
   consume this cylinder structure.
   Own the Kelley CW product (the structure TopologicalKTheory cites as
   cwProductKelley): for arbitrary Hausdorff CW X and Y construct
   the product-cell native CW structure on k(X×Y), with factor coordinates
   in that order, product characteristic maps, subcomplexes and cellular
   map naturality. Own the subcomplex neighbourhoods: for subcomplexes A,B
   choose compatible open radial neighborhoods U,V with deformation
   retractions of U,V,U∩V,U∪V onto A,B,A∩B,A∪B respectively, using
   the same cellwise parameters. Prove the weak-topology continuity, the
   exact intersection/union identities and relative/subcomplex naturality.
   Stage 5.5 uses these neighborhoods for Serre preimage excision.
   AffineMorseLefschetz A4 consumes this subcomplex-neighborhood interface
   on its actual triangulated compact algebraic pairs, including singular
   subcomplexes. A4 owns the simultaneous triangulation, barycentric-neighborhood
   construction and comparison with these generic deformation-retraction laws.
   Prove its weak topology is the compactly generated
   product topology (Hatcher Appendix A.6), and its comparison with the
   ordinary product when either factor is locally compact, using the
   compact-generation interface stated below.
   Construct the cellular approximation of the actual diagonal X→k(X×X)
   and its homotopy, using this product structure. Stage 5.5 consumes that
   diagonal in the multiplicative Serre construction.
   Own the simplicial-realization product comparison: for native simplicial
   sets K and L, the canonical continuous bijection |K×L|→|K|×|L| is a
   homeomorphism onto k(|K|×|L|), natural in K and L and compatible with
   the projections, the diagonal and the degreewise basepoints of pointed
   simplicial sets. Prove it on Stage 4.7's realization CW structures: each
   pair of nondegenerate simplices gives the product cell |Δ[n]|×|Δ[m]|,
   whose shuffle triangulation realizes Δ[n]×Δ[m] by a homeomorphism of
   compact Hausdorff spaces, and both sides carry the same colimit topology
   over these cells.
   *Compact generation.* Own the compact-generation interface this stage, 4.4
   and Stage 8 use, on Mathlib's `CompactlyGenerated`, its inclusion
   `CompactlyGenerated.compactlyGeneratedToTop` and `UCompactlyGeneratedSpace`.
   Package `TopologicalSpace.compactlyGenerated` as the coreflection k, right
   adjoint to the inclusion, whose counit kX→X is the identity map of the
   underlying set, continuous because the k-topology is finer. Prove:
   realizations and Hausdorff CW complexes are compactly generated; for
   compactly generated X and Y, k(X×Y) is their product in the compactly
   generated category, and for Hausdorff X and Y it has the same compact
   subsets, with the same subspace topologies, as X×Y;
   k(X×Y)=X×Y when X is compactly generated and Y is locally compact
   Hausdorff, and symmetrically; since k(Y×I)=k(kY×I), because both
   topologies have the same compact Hausdorff test maps, this gives the
   interval-product comparison k(Y×I)≅k(Y)×I for every space Y; and k preserves the
   quotient maps and colimits of the cell filtrations above. Without a
   compact-generation hypothesis on the other factor the product clause fails:
   for an uncountable set X with the cocountable topology every compact subset
   is finite, so kX is discrete while X is not, and k(X×pt)≠X×pt.
   Its identification of |A•×A•| with
   k(|A•|×|A•|) precedes 8.10 and 8.11b, which consume it for realized
   addition and the EM loop adapters. GeneralizedCohomology G2.1 consumes it
   for its pointed smash/quotient versions and monoidal/cofiber diagrams,
   so no second realization-product comparison is built there.
   Own `ordinaryPairQuotientComparison` and `ordinaryPairQuotientCohomologyComparison`:
   for Hausdorff relative CW pairs (X,B), the actual collapse map induces
   H_n(X,B;M)≃H̃_n(X/B;M) and H^n(X,B;M)≃H̃^n(X/B;M), for every n≥0 (Hatcher,
   Proposition 2.22 for good pairs, which CW pairs with nonempty B are by Proposition A.5, and
   its cohomological counterpart),
   for constant modules over any coefficient ring. Prove the same two comparisons for every
   closed cofibered pair, B closed in X with the native
   `TauCeti.HasHomotopyExtensionProperty B` and no CW structure: the inclusion of the cone CB
   (with cone point, so that C∅ is a point) into the mapping cone X∪CB has the extension
   property as the cobase change of B→X, so the collapse X∪CB→X/B is a homotopy equivalence
   (Hatcher, Proposition 0.17, p. 15), and H_n(X,B)≅H̃_n(X∪CB) for every pair (Hatcher,
   Section 2.1, p. 125, after Proposition 2.22). Extend homology to the
   abelian-category coefficient generality and exactness assumptions of Stage 2. For local
   coefficients require a specified system on the quotient and its pullback
   identification on X; do not assert descent of an arbitrary system on X.
   Use item 4’s pointed pushout carrier X←B→*; for B empty it is X
   with an added basepoint. Construct the natural
   comparison with the mapping-cone homotopy cofiber, with the cone coordinate
   last and B at cone parameter 1. Own the
   homology and cohomology exact-sequence comparisons with the mapping cone, the commuting diagrams for singular chains and raw relative cochains, retaining the actual
   quotient/inclusion maps and the extend-then-d boundary convention. These
   comparisons use Stages 2–3 and native cochain algebra, independently of
   Stage 6's product packaging and Stage 8's suspension construction. Item 8.11b
   owns their cup/suspension compatibility and the explicit cone sign formulas.
6. Construct real projective n-space using native `Projectivization ℝ (Fin (n+1) → ℝ)`.
   Consume Mathlib's quotient topology on `Projectivization 𝕜 V` and its continuity and
   open-quotient API from the Inventory, together with the Hausdorff, compact,
   path-connected and second-countable instances and affine charts that Tau Ceti proves for
   that topology; this item adds only the projective manifold structure, the CW structures
   and the sign system. For complex projective n-space consume the native carrier
   `TauCeti.ComplexProjectiveSpace n`, the quotient of the unit sphere of
   `EuclideanSpace ℂ (Fin (n+1))` by unit scalars (`Topology/ComplexProjectiveSpace/Basic.lean`),
   with its native finite CW structure `TauCeti.ComplexProjectiveSpace.cwComplex`
   (`Topology/CWComplex/Classical/ComplexProjective.lean`): one cell in each even
   dimension 0,2,…,2n and none in odd dimensions, with the standard characteristic
   maps `TauCeti.ComplexProjectiveSpace.cellMap`, the closed unit disc D²ᵏ ⊂ ℂᵏ
   mapping onto ℂPᵏ by z ↦ [z : √(1−|z|²)] and attaching its boundary S²ᵏ⁻¹ along
   the quotient map onto ℂPᵏ⁻¹ (Hatcher, Example 0.6). Own the homeomorphism of that
   carrier with native `Projectivization ℂ (Fin (n+1) → ℂ)` under Mathlib's quotient
   topology, sending the class of a unit vector to its line, and the transport of the
   CW structure and characteristic maps along it. ComplexKahlerGeometry K7 consumes
   that topology and this cell structure. On the real affine charts (ratios by a nonzero coordinate) build the
   boundaryless C^∞ Mathlib manifold structure; prove its
   homeomorphism and smooth local comparison with the antipodal sphere quotient.
   Construct its finite CW structure, with one cell in each dimension 0,…,n,
   and show the cellular differential is ±2 in positive even degree and 0 in
   odd degree; the sign records the chosen characteristic maps and cell generators. The chart and CW
   constructions use only Stages 2–4 and native manifold calculus, independently
   of Stage 6. For RP² construct the rank-one integral sign system from the
   antipodal double cover and compute its monodromy −1 around the generating
   loop by lifting that loop to a path from x to −x. Separately prove the
   linear-algebra orientation calculation on S²: the outward-first ambient
   bases `(x,v₁,v₂)` and `(−x,−v₁,−v₂)` in ℝ³ have determinants of opposite
   signs. This compares orientations at different points; a tangent-plane
   −identity in one fixed basis does not. Stage 6.3 consumes this determinant
   calculation to identify the sign system with the homological orientation
   system. This supplies
   RiemannianGeometry R4.7's single real projective carrier; its quotient
   metric remains owned there. For RP² calculate the sign-system cellular differential:
   d₂=0 and d₁=±2, while for constant integral coefficients d₂=±2 and d₁=0.
   Construct the sign system directly from the quotient's local lifts and
   their transition signs, without using Stage 5's general covering theory. Calculate a two-cell
   complex whose attaching map has degree `m`; its cellular differential must
   be multiplication by `m`.

7. Own the realization CW structure of every native simplicial set K: on
   `SSet.toTop.obj K`, construct one cell per `K.nonDegenerate n`, with the
   realized simplex as characteristic map. Own an orientation-preserving
   homeomorphism from the native sup-norm cell ball to Δ^n (the homeomorphism
   of pairs that StableHomotopyKTheory and FuchsianOrbifolds cite as
   standardCellBallToOrderedSimplex), carrying Stage 2.5's ball class to the relative
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
   AffineMorseLefschetz A4 consumes it through GeometricTopology Layer11's
   ordered-complex/simplicial-set realization and transported CW comparison
   for its ambient triangulated algebraic pair and subcomplexes. Prove
   the general paracompactness of Hausdorff CW complexes used by bundle suppliers.
   Own the cell-neighborhood local contraction API for arbitrary Hausdorff
   CW complexes: for x∈U open construct a smaller open V containing x
   and a homotopy V×I→U from inclusion to the constant x, compatible with
   the cell weak topology. CC C1.2 consumes this for its locally acyclic
   singular-cochain sheaf resolution; it does not presume a good cover.
8. **Connected maps, weak equivalences and CW approximation.** Consume the
   native weak-equivalence invariance: a weak homotopy equivalence in the
   native sense `ContinuousMap.IsWeakHomotopyEquivalence` induces isomorphisms
   on singular homology with coefficients in any ring and with any local
   coefficient system on the target
   (`ContinuousMap.IsWeakHomotopyEquivalence.isIso_singularHomologyMap`,
   `ContinuousMap.IsWeakHomotopyEquivalence.isIso_twistedHomologyMap`
   in `AlgebraicTopology/Singular/Homotopy/WeakHomotopyEquivalence.lean`), on arbitrary
   spaces; Hatcher, Proposition 4.21, states the constant-coefficient case, and the
   local-coefficient case is the native theorem. Own its connected-map
   refinement: the homology comparison of a k-connected map
   on native simplicial singular and twisted chains, by the direct
   Eilenberg-subcomplex route of tom Dieck 9.5.1: formulate connectivity by
   relative disc/sphere compression and homotopy lifting, without Stage 8.1's
   relative homotopy-group construction or Stage 8.3's Hurewicz theorem. For
   a k-connected mapping-cylinder pair generate the subcomplex by simplices
   carrying their k-skeleton into the subspace; construct face-compatible
   homotopies P(σ), fixing compressed simplices and relative faces, and the
   prism chain equivalence; transport local coefficients along P at vertices,
   with face/prism compatibility. The complexes agree through degree k, giving
   homology isomorphisms below k and surjectivity in k. For a weak equivalence
   compress compatibly in every degree to obtain the coefficient-chain
   homotopy equivalence and its Hom/cohomology comparison, for maps of pairs
   and their exact sequences; thus a weak equivalence induces local-coefficient
   homology and cohomology isomorphisms on arbitrary spaces. CC C1.2 consumes
   these exact maps for its singular-realization counit, not a second proof.
   Consume native CW approximation of path-connected spaces: the CW complex
   `TauCeti.cwApproximation X x`, built by attaching cells degree by degree
   to kill kernels and add generators of the native homotopy groups (Hatcher
   4.13), with `TauCeti.isWeakHomotopyEquivalence_cwApproximationMap`, its
   lifts `TauCeti.cwApproximationLift`, natural and unique up to homotopy
   (Hatcher 4.18), and the native compression lemma. Own
   `exists_cwApproximation`: every space, path-connected or not, admits a
   weak equivalence from a space of CW type, by approximating each path
   component; own the pair form (Hatcher Example 4.14) and the n-connected
   CW-model and n-connected-pair forms. CC C1.2 owns the weak-equivalence theorem for
   its specific singular-realization counit. Stages 5.5, 8.3, 8.8c, 8.8d and
   8.11b consume these targets; GeneralizedCohomology G2.1 and DGFloer Layer 1
   consume them rather than rebuilding them.

Hatcher, Chapter 0 (cell complexes and the homotopy extension property), Theorem 4.8 (cellular
approximation) and Section 2.2 (cellular homology) supply the CW-pair inputs.
Whitehead, *Elements of Homotopy Theory*, Chapters II--IV, supplies cofibrations, mapping
cylinders, and skeletal induction.  The categorical implementation follows Mathlib's actual
skeleta and their colimit maps rather than a parallel cell-filtration record.

### Examples

- The cellular differential of a two-cell attachment of degree `m` is multiplication by `m`,
  and cellular homology compares naturally with singular homology.  At chain level the comparison
  is a filtered/derived equivalence or is natural up to displayed chain homotopy, not a strictly
  natural choice of singular representatives.

### Dependencies

| Stage | Depends on | Can proceed alongside |
| --- | --- | --- |
| 4 CW/cellular and raw quotient comparisons | 2--3, native cochain algebra, 4.5's compact-generation interface for kified CW products and raw quotient/k-counit comparisons; 2.5 supplies sphere reference shuffles; general cohomological product/suspension compatibility belongs to 8.11b | 1 |
| 4.8 connected maps/weak equivalences/CW approximation | 2--4, native homotopy groups and 4.5's mapping-cylinder/cofibration API | 1 |

## Stage 5: bundles, covers, products, and finite-cover descent

This stage consumes Stages 2--4, with one exception: the product maps of item 1 (the
Alexander--Whitney and Eilenberg--Zilber maps, the shuffle map, and the chain homotopies between
them) consume only Stage 2 and can proceed alongside Stages 3 and 4.  The Kunneth spectral
sequence and theorems of item 1, and items 2--7, consume all of Stages 2--4.  Item 0 is
homological algebra on native filtered complexes and consumes no topology; Stage 6.0's lim¹
sequence supplies its complete-convergence form.

0. **Spectral sequence of a filtered complex.** Consume the native spectral
   sequence of an increasing ℤ-indexed filtration of a cochain complex of
   modules over a ring and its convergence theory in
   `Algebra/Homology/SpectralSequence/Filtered/` and
   `Algebra/Homology/SpectralObject/Abutment.lean`: the spectral object
   `CochainComplex.spectralObject` of `CochainComplex.filtrationFunctor` and its
   spectral sequence `CochainComplex.spectralSequence`; the first page as the
   cohomology of the graded pieces `CochainComplex.spectralSequenceFirstPageXIsoCokernel`
   and the first differential as the connecting map of the triple of three
   consecutive stages `CochainComplex.spectralSequence_first_page_d_eq`; the
   abutment `CochainComplex.filtrationAbutmentIso`, whose filtration is the image
   filtration `F_q H^n=im(H^n(F_q)→H^n(K))`
   (`CochainComplex.toFiltrationAbutmentFiltration_comp_filtrationAbutmentIso_hom`),
   with E∞ its graded piece
   (`CategoryTheory.Abelian.SpectralObject.EInftyIsoCokernel`); exhaustiveness of
   that filtration for an exhaustive filtration
   (`CochainComplex.exists_mem_range_filtrationAbutmentFiltrationι`); strong
   convergence for a finite filtration
   (`CochainComplex.filtrationSpectralSequencePageXIsoGradedOfFinite`) and, for an
   exhaustive filtration, the identification of the page-r object at (p,q) with
   the graded piece once the stage F_(q−r+2) has vanishing H^(p+q+1) and the
   graded pieces F_(i+1)/F_i with i≥q+r−1 have vanishing H^(p+q−1)
   (`CochainComplex.filtrationSpectralSequencePageXIsoGradedOfExhaustive`); the
   comparison theorems `CochainComplex.isIso_homologyMap_of_isIso_spectralSequence_page`
   and `CochainComplex.isIso_homologyMap_of_isIso_spectralSequence_page_of_exhaustive`;
   and naturality for maps of filtered complexes `CochainComplex.filtrationFunctorMap`
   through `CochainComplex.spectralObjectMap`. Own only what the pins lack.
   First, the homological adapter: regrade C^(−n)=C_n with the same
   differential, so that the homological E_r^(p,q) is native page r+1 at native
   bidegree (a,b)=(1−2p−q,p−1), deg=a+b=−(p+q), i₁=p−1 and i₂=p, and
   `E¹_(p,q)=H_(p+q)(F_p C/F_(p−1) C)` with d¹ the connecting map of the triple;
   for a decreasing cochain filtration F^p use G_t=F^(−t), whose cohomological
   E_r^(p,q) is native page r+1 at (a,b)=(2p+q+1,−p−1), deg=p+q, i₁=−p−1 and
   i₂=−p; retain the mapping-cone/reindexing signs. Second, Weibel's Classical
   Convergence Theorem 5.5.1(2) in the generality the native exhaustive theorem
   does not reach: for an increasing filtration of a module chain complex with
   degreewise lower bounds `∀ n, ∃ s(n), F_(s(n)) C_n=0` and exhaustion
   `⋃_p F_p C_n=C_n`, but with no bound on the filtration degrees of the
   graded pieces in a fixed total degree, the differentials leaving (p,q) vanish
   from some page on, so E_(r+1)^(p,q) is a quotient of E_r^(p,q) for large r;
   identify the colimit of these quotients with the native E∞ object, hence with
   `F_p H_(p+q)/F_(p−1) H_(p+q)`, naturally, and prove that the induced filtration
   is exhaustive and bounded below, hence separated and complete in its lower
   direction. The lower bound concerns the filtration in each chain degree, not
   merely the degrees in which the complex is nonzero. Third, the cohomological
   form of Weibel's Complete Convergence Theorem 5.5.10 for complete exhaustive
   decreasing cochain filtrations with regular spectral sequence: weak
   convergence with its induced cohomology filtration/E∞ graded identification,
   and strong convergence under the theorem's degreewise spectral boundedness
   after cohomological reindexing, using Stage 6.0's Milnor/lim¹ sequence; the
   first-quadrant case is regular and degreewise bounded and is the native
   exhaustive theorem. Cup pairings come from actual filtered cochain maps,
   independently of convergence. Item 5's Serre sequences,
   ComplexKahlerGeometry K8's column-filtration adapter and DGFloer Layer 1's
   cubical transports consume this single construction.

   **Checks.**
   - For the two-step filtration 0⊂F_0 C⊂F_1 C=C of the complex ℤ→ℤ (multiplication by 2,
     from degree 1 to degree 0) with F_0 C the degree-0 term, E¹ has ℤ in (0,0) and in (1,0)
     and d¹ is multiplication by 2, so E²=E∞ is ℤ/2 in (0,0) and 0 in (1,0), the homology of
     C; a d¹ read in the opposite direction would put ℤ/2 in total degree 1 instead.
   - For the filtration of ⊕_(k≥0) (ℤ·x_k→ℤ·y_k), x_k in degree 1 mapping to y_k in degree 0,
     with x_k in filtration k+1 and y_k in filtration 0, the degreewise lower bound and
     exhaustion hold, d^(k+1) hits y_k from (k+1,−k), and no single page agrees with E∞ at
     (0,0) in total degree 0; the colimit of the quotients is 0=H_0, which the native
     exhaustive theorem cannot see because the graded pieces in degree 1 are nonzero in every
     filtration.
   - For the constant filtration F_p C=C, for every p, of C=ℤ in degree 0 (exhaustive, with no
     lower bound) the graded pieces vanish, so E¹=E∞=0 while H_0=ℤ: the abutment filtration is
     not separated, and the lower bound is needed.
1. Consume native Alexander--Whitney, shuffle and Eilenberg--Zilber chain-homotopy
   equivalences for singular chains. Extend their natural/local-coefficient and relative APIs.  Over every commutative
   ring `R`, construct the first-quadrant Kunneth spectral sequence
   `E^2_(p,q) = directSum_(i+j=q) Tor^R_p(H_i(X;R),H_j(Y;R))` converging naturally to
   `H_(p+q)(X times Y;R)`.  Prove convergence from the bounded-below, degreewise-free singular
   chain complexes.  For a field `k`, and any commutative semisimple ring, the cross product
   gives `directSum_(i+j=n) H_i(X;k) tensor H_j(Y;k) ~= H_n(X times Y;k)`: this is native,
   `TopCat.singularHomologyKunnethUnitIso`, and is consumed, not restated.  For a PID, and
   more generally a commutative ring over which every module has projective dimension at most
   one, consume the native short exact sequence `TopCat.singularHomologyKunnethShortComplex`
   from that tensor sum to product homology and then to
   `directSum_(i+j=n-1) Tor^R_1(H_i(X;R),H_j(Y;R))` with its splitting, and record that no
   splitting is natural.  State and prove the general-ring collapse corollaries under explicit
   flatness or projectivity hypotheses.
2. Consume the native Wang long exact sequence of a mapping torus,
   `TauCeti.MappingTorus.wang_exact₁`, `TauCeti.MappingTorus.wang_exact₂` and
   `TauCeti.MappingTorus.wang_exact₃`, derived from a mapping-cone model with endomorphism
   `𝟙 - φ_*`, and its naturality `TauCeti.MappingTorus.wangMappingConeMap_naturality` under
   maps intertwining the monodromies (`AlgebraicTopology/Singular/MappingTorus/`). Own its
   local-coefficient form and its comparison with item 5's Serre sequence over the circle.
3. Consume the native transfer `IsCoveringMap.singularTransfer` of a covering map with
   finite fibres, the chain map summing the lifts of a simplex, with its degree formula
   `IsCoveringMap.singularTransfer_comp_chainComplexMap`, `p_* ∘ transfer = d • id` on
   chains and on homology when every fibre has `d` points, its locally constant form
   `IsCoveringMap.singularTransfer_comp_chainComplexMap_eq_locallyConstantNsmul` over a
   disconnected base, its composition law `IsCoveringMap.singularTransfer_comp` for towers
   of finite coverings, and the permutation local system of a finite cover with
   `IsCoveringMap.singularChainComplexPermutationIso` and
   `IsCoveringMap.singularHomologyPermutationIso` (`AlgebraicTopology/Singular/Transfer/`).
   General finite covers include zero-sheet covers, and the native degree formula covers
   the induced map on `H_0`.
   For the regular-cover quotient-chain and Cartan--Leray package additionally
   give an actual surjectivity proof for p:E→B and a left deck G-action simply
   transitive on every fibre. Compare this datum with native
   `IsQuotientCoveringMap p G` via Mathlib's
   `isQuotientCoveringMap_iff_isCoveringMap_and` (`Topology/Covering/Quotient.lean`), retaining its continuity,
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
   ρ(g)=(deck g)_*, packaged as the native `Rep R G` of that action on the
   homology of the singular complex of E. Construct the Cartan--Leray spectral sequence with
   `E^2_(p,q) = groupHomology (H_q(E;M) as Rep R G) p`
   converging to `H_(p+q)(B;M)`, including its filtration/edge naturality.
   Compute it using native `groupHomology.inhomogeneousChains`; its first
   boundary term is ρ(g₀⁻¹), so do not invert the deck representation again.
   For cohomological deck comparisons the induced left action is
   `(g⋅φ)=(deck g⁻¹)^*φ`; compare its bar differential with native
   `groupCohomology.inhomogeneousCochains` and the fixed local-system transport.
   Only when `|G|` is invertible in R, or under a separately stated exactness
   hypothesis, derive the homology coinvariant isomorphism and the normalized
   transfer identification with invariants. For a nonsurjective cover quotient
   chains compute the covered open-and-closed image of p, not all of B; apply
   the surjective package after restricting the base to that image. The
   permutation local system of a nonregular finite cover and the locally
   constant degree over a disconnected base are the native theorems above; own
   the comparison of the deck-sum formula with the permutation system for a
   regular cover. On a nonempty base a finite regular datum has
   degree |G|; no such numerical equality is required when B is empty.
4. Calculate homology of finite products of circles as exterior powers, naturally under integer
   matrices acting on the first homology.  This is a theorem about the product and Kunneth maps,
   not a separately declared answer for a torus.
5. Consume native `TauCeti.TopCat.serreFibrations` and its pullbacks,
   `TauCeti.TopCat.mem_serreFibrations_of_exists_trivialization` for locally
   trivial TopCat morphisms, and `TauCeti.TopCat.mem_serreFibrations_proj`
   with `FiberBundle.hasHomotopyLiftingProperty_proj_cube` for locally
   trivial `FiberBundle` projections without a paracompactness hypothesis.
   Own the fibration homotopy long exact sequence, including components. Use
   `mem_serreFibrations_iff`/`mem_serreFibrations_iff_cube` for disc/cube
   lifting, pullbacks and maps of fibrations. Own the comparison between
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
   there. These constructions use Stages 1–4's homotopy, disc and CW-pair
   APIs and not Stage 8.1's relative-pair sequence; neither sequence depends
   on the other's construction. Own fibre transport: lifted homotopies
   compare the fibres over the ends of a base path, giving the component
   action and the fibre π_n local system on the base that Stage 8.9's lifting
   obstructions consume. For a Hurewicz fibration with a chosen lifting
   function the fibre-homology local system b↦H_t(p⁻¹b) is native,
   `TauCeti.fiberLocalSystem` (`Singular/Fibration/LocalSystem.lean`, on
   normalized cubical chains): consume it there, and own only its extension to
   Serre fibrations, by transport through relative cube lifting, and the
   agreement of the two on Hurewicz fibrations through the cubical–simplicial
   homology comparison. Every-fibre weak contractibility, including
   nonemptiness, gives a weak equivalence by this sequence and component
   lifting; homotopy equivalence additionally uses CW-type witnesses and
   Stage 8.5. A chosen fibre alone gives no conclusion on unrelated base
   components.
   Consume the native fixed-interval path-space fibrations
   (`Topology/Homotopy/MappingPath/`): the lifting-function structure
   `TauCeti.LiftingFunction`, the Hurewicz-fibration predicate
   `TauCeti.IsHurewiczFibration` with
   `TauCeti.isHurewiczFibration_iff_nonempty_liftingFunction`, the mapping-path
   fibre of f:X→Y at a point with its source projection a Hurewicz fibration
   for test spaces in every universe
   (`TauCeti.MappingPathFiber.isHurewiczFibration_proj`), its description as
   the base change of the fixed-end path fibration along f
   (`TauCeti.MappingPathFiber.pullbackHomeomorph`) and its homotopy invariance
   `ContinuousMap.Homotopy.mappingPathFiberHomotopyEquiv`. Own what the native
   files leave: the two-endpoint evaluation of the compact-open path space
   `C(I,X)` to X×X with its concatenation lifting function, membership of these
   Hurewicz fibrations in `serreFibrations`, contraction of the based path
   space by the reparametrization γ(st), its fibre over x as native `Path x₀ x`
   and over x₀ the native loop space, the identification of the mapping path
   space of f with the pullback of the free path fibration along f×id, so that
   its endpoint projection is a Serre fibration by
   `mem_serreFibrations_pullbackFst` with the homotopy fibres of f as fibres,
   and the constant-path inclusion of X as a homotopy equivalence over Y.
   GeneralizedCohomology G2.10 consumes the native predicate and these lifting
   functions for its convenient-category replacements; no second lifting
   construction is built.
   Own the homological Serre spectral sequence for every path-connected CW
   base B, using Stages 1–4 and the actual filtration `E_p=p⁻¹(B^(p))`, with
   `E_(−1)` empty. Consume the native spectral sequence of this filtered
   space, `TauCeti.filteredSpaceSpectralSequence` of the family p↦E_p
   (`Singular/FilteredSpace.lean`), with its first page the relative homology
   H_n(E_p,E_(p−1)), its first differential the connecting map of the triple
   (E_(p+1),E_p,E_(p−1)), its abutment H_n(E) and its strong convergence when
   the filtration is finite, read through item 0's homological regrading. Own
   what it leaves: prove that singular chains are exhausted by this
   filtration using compact simplex images and cellular filtration
   comparison, so that convergence holds over infinite-dimensional bases; identify
   `E²_(p,q)=H_p(B;H_q(F;R))` with the actual path-transport monodromy local
   system `H_q(F;R)`, and prove convergence to `H_(p+q)(E;R)`: in each total
   degree the first-quadrant filtration is finite, exhaustive and separated,
   with graded pieces E∞ and their extension data. No finite-type or
   dimension bound is imposed on B or F. Prove naturality under maps of
   fibrations and coefficient maps, and the componentwise version.
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
   Stage 4.5's CW structure on k(B×B), its product-cell filtration
   (B×B)_m=⋃_(i+j≤m)B^i×B^j and cellular approximation D of Δ_B. Own a
   compatible filtered CW approximation q:E′→E with CW subcomplexes E′_p and
   q_p:E′_p→E_p weak equivalences, including relative pair comparisons and
   filtered local-cochain maps that are quasi-isomorphisms on the relative
   filtration quotients by Stage 4.8. First pull back p×p along k(B×B)→B×B
   and then along D; no map from an arbitrary non-CW E×E into k(B×B) is
   assumed. Lift the diagonal-to-D homotopy only on the CW source E′, cell
   by cell with the fixed faces, construct its product-filtered cup map and
   transport through those filtered comparisons; do not lift on a general
   non-CW total space or assert that the ordinary Alexander–Whitney product
   is filtered on E_p. Own Serre preimage subcomplex excision: preimages of
   CW subcomplexes A,B under a Serre fibration over a CW base form an
   excisive couple for native singular/twisted chains and relative-cochain
   products. Consume Stage 4.5's compatible open neighborhoods of A,B and
   their intersection/union, prove each preimage inclusion over the
   deformation retraction is a weak equivalence by the fibration sequence
   and component path lifting, and apply Stage 4.8's weak-equivalence
   coefficient-chain/Hom comparison and Stage 3 open excision to the
   intersection/union diagram. Construct the actual small-chain
   quasi-isomorphism C(E_A)+C(E_B)→C(E_(A∪B)) and the relative cochain map,
   with chosen inverses/homotopies only up to specified natural homotopy, and
   use it, iterated over the finite product-skeletal union in each m, to
   define the product-filtered cup on a small-chain/relative model; do not
   evaluate the ordinary cross cochain unconditionally on arbitrary simplices
   in that closed union. Consume native `IsStableUnderProductsOfShape` and
   `IsStableUnderBaseChange` instances for `serreFibrations`, transport
   categorical products to the concrete E×E carrier through native
   `RespectsIso` and TopCat's product isomorphism, and use
   `mem_serreFibrations_pullbackFst` for pullbacks. Identify g^*(M⊠N) with
   q^*(M⊗N) by inverse transport along the lifted diagonal-to-g homotopy,
   using Stage 2.6's path-natural local-system comparison, and retain that
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
   Own the arbitrary-base versions of both sequences: for a Serre fibration
   over an arbitrary path-connected space, pull back along Stage 4.8's CW
   approximation of the base, prove the induced total-space map is a weak
   equivalence by the fibration homotopy sequence including components,
   identify its local-coefficient homology and cohomology maps and the base
   comparison through Stage 4.8, and transport the spectral sequence, its
   E² page, convergence and abutment filtration to the original fibration.
   Prove independence of the CW approximation by comparison refinements and
   naturality from E² onward, and give the disconnected-base version.
   The homological constructions use only Stages 1–4, 4.8 and item 0; the
   cohomological constructions additionally use Stage 6.0–6.2's independent
   foundational tower/cochain/cup portion and item 0's cohomological form,
   with no manifold duality, EM representability or GeneralizedCohomology
   input. GeneralizedCohomology G5 consumes the CW-base and arbitrary-base
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
6. Consume the native Čech–singular bicomplex `TauCeti.TopCat.openCoverSingularBicomplex` of
   a family of opens, with the alternating face-map Čech differential and the singular
   boundary (`AlgebraicTopology/Singular/Cech/DoubleComplex.lean`), and its ordered form,
   which for an ordered finite cover has `directSum_(i_0<...<i_p) C_q(U_(i_0...i_p);R)` in
   bidegree (p,q). Own its local-coefficient form.
7. Consume the native quasi-isomorphism of the augmented total complex onto singular
   chains, `TauCeti.TopCat.quasiIso_openCoverSingularTotalAugmentation`, proved from
   Stage 3's small-chain theorem (`Cech/QuasiIso.lean`), and the native spectral sequence
   `TauCeti.cechSpectralSequence` with its first page
   `TauCeti.cechSpectralSequenceFirstPageXIso`,
   `E^1_(p,q) = directSum H_q(U_(i_0...i_p);R)` over the (p+1)-element index sets, and its
   abutment `TauCeti.cechSpectralSequenceAbutmentIso` (`Cech/SpectralSequence.lean`). Own
   the bound by the cover cardinality, naturality under refinements and maps of covered
   spaces, and the local-coefficient version.

Eilenberg--Zilber and Eilenberg--Mac Lane's acyclic-model proof, Hatcher Sections 3.B and 4.G,
and McCleary, *A User's Guide to Spectral Sequences*, Chapters 1--2, form the source spine.  The
mapping-torus calculation follows the mapping-cone derivation of the Wang sequence; transfer
follows Hatcher Section 3.G, and the bundle filtration follows Serre's skeletal construction.

### Examples

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

### Dependencies

| Stage | Depends on | Can proceed alongside |
| --- | --- | --- |
| 5.0 filtered-complex spectral sequence | native filtered spectral-object algebra; 6.0's Milnor/lim¹ sequence for complete convergence | 1--4, 6.0 |
| 5 product maps (item 1) | 2 | 1, 3, 4 |
| 5 bundles/covers/finite covers | 2--4; native Serre carrier/bundle API; homotopy LES, path fibrations and homology SS from 1–4, 4.8 and 5.0; cohomology SS additionally from independent 6.0–6.2 | 1 |

## Stage 6: cohomology, products, and manifold duality

The tower, raw cochain, coefficient and cup constructions in 6.0–6.2 are foundational:
construct them from Stages 2–4 and the independent product maps in 5.1 before
using any Serre sequence, manifold duality or EM representability. Stage 5.5's
multiplicative cohomological Serre sequence and Stage 5.0's complete-convergence
theorem consume only that portion, including 6.0's Milnor/lim¹ comparison for
complete inverse cochain filtrations.

0. **Countable inverse-system algebra.** Use functors `ℕᵒᵖ ⥤ ModuleCat R`,
   including abelian groups through their canonical ℤ-module structure. Consume
   Mathlib's `Functor.IsMittagLeffler` on the underlying type functor and its
   [eventual-range/surjectivity API](https://github.com/leanprover-community/mathlib4/blob/master/Mathlib/CategoryTheory/CofilteredSystem.lean),
   following the [inverse-system design discussion](https://leanprover.zulipchat.com/#narrow/stream/116395-maths/topic/Properties%20on%20%60fintype_inverse_systems%60).
   Consume the native shift `TauCeti.ModuleTower.shift`,
   `δ(x)_n=x_n−f_n(x_(n+1))`, its kernel `TauCeti.ModuleTower.lim`, which is
   the categorical inverse limit, its cokernel `TauCeti.ModuleTower.limOne`,
   functoriality under tower maps, product compatibility, the six-term
   inverse-limit/lim¹ sequence and vanishing for surjective
   (`TauCeti.ModuleTower.shift_surjective`) or Mittag–Leffler
   (`TauCeti.ModuleTower.subsingleton_limOne_of_isMittagLeffler`) countable
   towers, and the native Milnor sequences of towers of complexes of any shape
   whose shift is surjective in every degree. Own the shift/cofinal-subsequence
   comparison and its naturality. State the complex-level theory for
   towers in `CochainComplex (ModuleCat R) ℤ`: for degreewise surjective
   countable towers the native product-complex short exact sequence and Milnor
   cochain sequence `0→lim¹ H^(k−1)(C_n)→H^k(lim C_n)→lim H^k(C_n)→0`
   hold in every integer degree k. Extend ℕ-indexed chains/cochains by zero using
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
   homotopy-compatible towers as part of this stage's own scope.
   Item 0 uses native module/category/complex algebra independently of the
   manifold, product and orientation developments below.

Items 1–4 consume Stages 2–3 and the product maps of Stage 5 item 1; the cellular
comparisons and RP² checks also consume Stage 4; item 1 uses item 0 for its
infinite-dimensional skeletal-limit passage. Item 5 consumes Stage 4 and
items 1–4. Their manifold statements also
consume DG2's tangent-orientation API, DG5.1's outward-first boundary orientation,
and geometric topology's boundary/collar conventions. Item 3 constructs its local
homological determinant-sign comparison before DG10's smooth mapping-degree theory.

Every manifold theorem in this stage uses a finite-dimensional Mathlib manifold carrier with
Hausdorffness, second countability or the resulting paracompactness, and the chosen boundary model
stated explicitly.  A global fundamental class assumes compactness.  A conclusion identifying top
homology with one copy of the coefficient ring also assumes connectedness.

1. Define absolute and relative singular cochains by applying `Hom` to singular chains.  Extend
   the construction to Stage 2's local coefficient systems: a degree-k cochain
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
   prove that the Stage 4 chain-homotopy comparison dualizes, identifying
   L*-cochains with Hom of L-chains; use fibrewise reflexivity only to recover
   L. On RP²'s Stage 4.6 sign system ε compute δ⁰=±2 and δ¹=0, so independently
   of duality `H⁰(RP²;ε)=0`, `H¹(RP²;ε)=ℤ/2` and `H²(RP²;ε)=ℤ`.
   For constant coefficients consume the native
   functoriality, long exact sequence, homotopy invariance and additivity of
   `TopCat.singularCohomology`, the native cochain Mayer–Vietoris connecting
   maps `TopCat.singularCohomologyMayerVietorisδ` of a binary open cover and
   `TopCat.singularCohomologyPairMayerVietorisδ` of a pair of open covers, with
   their exactness (`Cohomology/MayerVietoris/`), the native universal
   coefficient theorem over a hereditary commutative ring,
   `TopCat.singularUniversalCoefficientEquiv`, a linear equivalence
   `H^(n+1)(X;M) ≃ Ext^1_R(H_n(X;R),M) × Hom_R(H_(n+1)(X;R),M)` whose second
   component is the Kronecker map, with the exactness
   `TopCat.exact_singularExtToCohomology_singularKronecker` and a section that
   is not natural (`Cohomology/UniversalCoefficient.lean`), and the native
   Bockstein `TopCat.singularCohomologyBockstein` and
   `TopPair.singularCohomologyBockstein`, the connecting morphisms of the short
   exact sequences of absolute and relative cochain complexes that degreewise
   freeness of singular chains gives for every short exact sequence of
   coefficient modules (`Cohomology/Bockstein.lean`). Own the local-coefficient
   forms of all of these and the constant-system comparison, the record that
   no splitting of the universal coefficient sequence is natural, and, over a
   general commutative ring, the spectral sequence
   `E_2^(p,q) = Ext^p_R(H_q(X;R),M)` converging to `H^(p+q)(X;M)`, with
   collapse theorems only from displayed projectivity or injectivity
   hypotheses. Own naturality of the Bockstein in spaces, pairs and
   coefficient-sequence maps, its compatibility with pair connecting maps, and
   the cup-product Leibniz signs when compatible coefficient pairings are
   given. Include `0 -> Z ->[times 2] Z -> F2 -> 0`
   and `0 -> Z -> R -> R/Z -> 0`, with coefficient maps and connecting
   normalization explicit. SmoothBundlesConnections B6.1 consumes this generic
   construction and proves its good-cover/analytic comparison; it does not
   supply a second singular coefficient theory.
2. Consume the native Alexander–Whitney cup product `TopCat.singularCup` (here
   `cupProduct` with the degree pin), with its native associativity and unit laws
   and its graded commutativity `TopCat.singularCup_gradedComm`
   (`Cohomology/GradedCommutativity.lean`), the native cross product
   `TauCeti.singularCross` and the Eilenberg–Zilber cohomology isomorphism
   `TauCeti.singularEilenbergZilberCohomologyIso` comparing them
   (`Cohomology/CrossProduct.lean`). Define cap products (`capProduct` on the
   native `TopCat.singularCap`, with the complementary-degree hypothesis
   `p ≤ q`, valued in `SingularHomology`, the module `H_n(X;M)` of Mathlib's
   singular homology functor, and taking classes of `singularCohomology`, the
   native `TopCat.singularCohomology` with coefficients in the ring), including tensor pairings of local coefficient systems, and prove
   for the caps and for the local-coefficient cups below naturality,
   associativity, the unit law, graded signs, and the boundary formula.
   Construct both same-pair caps
   `H^k(X;L)⊗H_n(X,A;L')→H_(n−k)(X,A;L⊗L')` and
   `H^k(X,A;L)⊗H_n(X,A;L')→H_(n−k)(X;L⊗L')`,
   proving descent to relative chains and compatibility with connecting maps.

   **Checks (`capProduct`).**
   - On chains, for the ordered 2-simplex σ=[v₀,v₁,v₂] and the 1-cochain φ dual to its front
     edge [v₀,v₁] (value 1 there and 0 on every other 1-simplex), σ⌢φ is the back edge [v₁,v₂];
     the back-face convention φ(σ|[v₁,v₂])·σ|[v₀,v₁] gives 0 instead.
   - Capping with the unit 1∈H⁰(X;R) (p=0) is the identity of H_q(X;R) for every q, since
     σ⌢1=σ on chains; a convention keeping the front face instead of the back face would send σ
     to its first vertex and change the degree.
   - For p=q the cap a⌢c lies in H₀(X;R) and its augmentation is the Kronecker pairing ⟨a,c⟩,
     since σ⌢φ=φ(σ)·σ|[v_q]; on S¹ with c the fundamental class and a the class with ⟨a,c⟩=1,
     a⌢c is the class of a point, and −a gives minus that class. For p>q the target degree q−p
     would be truncated to 0 by natural-number subtraction; the hypothesis p≤q excludes those
     degrees.
   Own local-coefficient cups with every specified R-linear pairing
   L⊗_R L′→L″ for a commutative ring R. Use 6.1's first-vertex cochains:
   for σ and degrees p,q pair the front-face value with the back-face value
   transported from vertex p to vertex0 by the inverse initial path. Prove
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

   After the foundational products of6.2, consume Tau Ceti's native
   `TauCeti.LSCategoricalCover X A n`, a cover of A⊆X by n actual bundled
   opens in X with native `ContinuousMap.Nullhomotopic` witnesses for their
   inclusions into X. A categorical open need only contract in X; it need not
   itself be contractible. Its native API supplies restriction of covers,
   finite concatenation, padding, pullback along maps with a left homotopy
   inverse, pushforward along open embeddings and the empty-index case.

   Consume the native unnormalized count `TauCeti.lsCategoryCount X A : ℕ∞`,
   the infimum of those finite cover sizes, with infimum of the empty set
   equal to∞, and its native laws: a finite value n is attained by an
   n-element cover; monotonicity in A; finite-union subadditivity; the
   ambient deformation inequality `TauCeti.lsCategoryCount_le_of_homotopic_id`,
   for g:X→X homotopic to the identity with g(A)⊆B; whole-space homotopy
   invariance and homeomorphism transport; empty-set value0; positivity for
   nonempty A; the point, contractible and discrete-space calculations; and
   additivity of the whole-space count over a finite coproduct, including
   empty components and∞ cases.

   On a nonempty space the normalized category is the whole-space count minus
   one, so the count is the normalized category plus one. In the connected
   case this is the convention cat(point)=0. Empty spaces use the unnormalized
   count0; do not give an empty space a chosen point or apply the +1 formula
   there. Disconnected manifold theorems use the unnormalized sum, rather than
   assuming one categorical open can meet different clopen components.

   Consume Mathlib's `LocallyContractibleSpace` in its actual sense: each
   neighborhood contains a smaller neighborhood whose inclusion is
   nullhomotopic, which the native
   `TauCeti.exists_isOpen_superset_lsCategoryCount_le_encard` turns into
   categorical opens. Compactness then gives a finite open categorical cover,
   so the whole-space count is finite. Do not infer an open intrinsically
   contractible neighborhood basis from this weaker predicate.

   For a commutative coefficient ring R, use 6.2's existing singular cup
   product to define the finite positive-degree products `LSPositiveCupProduct`
   and `lsCupLength X R : ℕ∞` as the supremum of lengths of
   nonzero finite products of positive-degree classes, with supremum of the
   empty collection0. Export a finite-product witness API, restriction,
   coefficient/product naturality with the stated nonvanishing hypotheses,
   and the lower bound `lsCupLength_add_one_le_categoryCount`: on nonempty X,
   `lsCupLength X R+1≤TauCeti.lsCategoryCount X Set.univ`, equivalently the cup
   length is at most the normalized category. For a cover by r categorical
   opens, use native singular homotopy invariance and the positive-degree
   cohomology of a point to prove that classes restrict to zero on their
   designated opens. For **every commutative R**, construct the native point
   singular-chain augmentation and the section represented by its unique
   vertex. Identify its alternating-constant chain complex with R in degree0
   by the native extra-degeneracy contraction, giving the point's
   singular-chain homotopy equivalence with R in degree0. Apply the
   contravariant Hom/linear-Yoneda
   cochain construction to the chain maps and homotopies, obtaining the
   cochain-homotopy equivalence with R in degree0 and the vanishing of the
   point's singular cohomology in every positive degree. Prove the
   degree0 augmentation/unit normalization and coefficient naturality. This
   direct calculation uses neither a hereditary-ring UCT nor an Ext collapse
   for general R. Lift classes to relative cohomology and use the **open excisive**
   multiple-relative product and small-chain comparison already owned by6.2;
   the product lands in H*(X,X;R)=0. Give the cochain/support proof and the
   finite-product induction, not an unqualified product for arbitrary closed
   subsets. Coefficients and cohomology are the existing singular ones; there
   is no second cohomology ring.

   **Checks (`lsCupLength`).**
   - A point: its positive-degree cohomology vanishes, so there is no nonzero product of
     positive-degree classes and the cup length is 0, the supremum of the empty set; the count
     is 1 and the bound reads 1≤1. A definition admitting degree-zero factors would make the
     unit 1=1⌣⋯⌣1 a nonzero product of every length, so every nonempty space would have
     infinite cup length, contradicting the bound.
   - The empty space has H⁰(∅;R)=0 and cup length 0, while its native count is 0; the bound
     0+1≤0 fails, which is why `lsCupLength_add_one_le_categoryCount` assumes X nonempty. A
     k-point discrete space, k≥1, has cup length 0 and count k, since only subsets of singletons
     are categorical there.
   - Sⁿ, n≥1, with R=ℤ (or any nontrivial R): the generator of Hⁿ is a nonzero one-fold product
     and its square lies in H²ⁿ=0, so the cup length is 1; the two-open categorical cover by the
     complements of the poles gives count 2 (normalized category 1), and the bound 2≤2 is sharp.
   - The torus T²=S¹×S¹ over ℤ: the pullbacks a,b of the two circle generators satisfy that a⌣b
     generates H²(T²;ℤ)≅ℤ (Stage 5 item 1 and 6.2), so the cup length is 2 and the count is at
     least 3. The same argument bounds finite products of positive-dimensional spheres.
   No product upper-bound theorem or general Bott/closed-geodesic multiplicity theorem is
   inferred from these checks.

   This supplement uses native homotopy/open-set/extended-cardinality
   foundations, Stages2–3, Stage5 item1 and ordinary6.1–6.2, plus the direct
   point-chain contraction. It is independent of the manifold duality/linking
   consequences in6.3–6.5 and is consumed by MorseTheory M4's arbitrary-function
   critical bound. Morse theory and geodesic minimax are not prerequisites.

   #### Supported cellular comparison

   This is a separate supported-cellular supplement after ordinary6.2. First
   prove countability of cells for the connected locally finite finite-dimensional
   CW carriers used below; Stage8.5 consumes that countability result as a
   prerequisite, not as a second construction. On a finite-dimensional locally
   finite Hausdorff CW pair (X,A), construct finite cell-carriers and their local
   finiteness. Use the filtered refinement category of triples (K,B,L), where
   K,L are compact, B is a cofinite CW subcomplex and K⊆X\B⊆L. Prove its
   compact/cofinite-subcomplex projections final and its actual relative cochain
   maps C_K(X,A)→C^*(X,A∪B)→C_L(X,A); their composite is support enlargement.
   No functorial choice B(K) is assumed. This supplement consumes ordinary
   Stage4 cellular data and ordinary6.1–6.2, owns the compactly supported
   local-coefficient cochain foundation below, and returns a supported-cellular
   comparison used by the properStage8.5 route. Ordinary6.3–6.5, Stage7 and
   ordinaryStage8 remain independent of this supplement. CharacteristicClasses
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
   fixed on A gives the relative statement with identity transport. Checks:
   constant L=R recovers the earlier constant-coefficient object; for compact
   X every K may be taken to be X and H_c^*=H^*; H_c^1(ℝ;ℤ)=ℤ while
   H^1(ℝ;ℤ)=0, and the open extension from (0,1) to ℝ is an isomorphism in
   degree one; the proper maps x↦x+1, x↦x³ and x↦x² of ℝ act on
   H_c^1(ℝ;ℤ)=ℤ by 1, 1 and 0, the last because x² folds both ends of ℝ to
   +∞; the contraction (t,x)↦(1−t)x of ℝ is proper on every slice but not
   jointly proper, and H_c^1(ℝ;ℤ)≠H_c^1(pt;ℤ) shows that slicewise properness
   cannot replace joint properness.

   Construct the compactly supported cellular n-cochains `C_c^cell,n(X,A;ℤ)` as the direct sum on the actual relative n-cells' orientation-dual modules. The ordinary cochain group is a product. Prove the incidence transpose preserves finite support by local finiteness of coface carriers. Relative ordinary cellular/singular cohomology for (X,A∪B), finite excluded cells and filtered exactness give the natural all-degree comparison H^n(C_c^cell(X,A))≅H_c^n(X,A). Every finite cell support occurs after a finite coface-star refinement. Include the differential, restriction, connecting and coefficient comparisons.

   For proper cellular maps prove row-finiteness of the ordinary chain matrix and the resulting finite-support pullback. Given a target cofinite B, choose compact L containing its complement and a source cofinite refinement avoiding f⁻¹L, so it maps into B; do not assume f⁻¹B is a subcomplex. Prove comparison naturality through common refinements. Degreewise extension by zero gives the supported CW-pair short exact cochain sequence and exact triangle. This primary cellular specialization consumes ordinary6.1–6.2 and the supported cochain foundation above, without classifier, duality or AT8.5 input. CharacteristicClasses C1.2a compares this triangle with its collared-pair support-excision triangle; that comparison is not an input to the primary pair LES.

3. On a boundaryless m-manifold U define the integral orientation local
   system by `or_U(x)=H_m(U,U\{x};ℤ)`, with the excision transport below.
   For constant coefficients consume the native local homology
   `TauCeti.localHomology`, its path transport, the compact-support existence
   and uniqueness theorems `TauCeti.exists_localHomologyRestriction_eq_of_isCompact`
   and `TauCeti.localHomology_ext_of_isCompact`, the homological orientations
   `TauCeti.HomologicalOrientation` and the integral fundamental class
   `TauCeti.HomologicalOrientation.fundamentalClass` of a compact oriented
   manifold; this item owns the local-system versions of these constructions
   and their comparison with the native ones under the constant system.
   Own the boundaryless interior construction for every finite-dimensional real model
   with corners I on E, with `finrank ℝ E=m`. Use Mathlib's `I.interior M` and
   `ModelWithCorners.isOpen_interior`. Choose a continuous linear equivalence
   `E ≃L[ℝ] EuclideanSpace ℝ (Fin m)`, reparameterize I, and construct the Euclidean
   boundaryless atlas on a fresh copy of the interior subtype, inheriting M's smoothness.
   Keep M's original charted-space instance. Prove the inclusion into M smooth and its
   underlying homeomorphism onto the interior. Prove that the inclusion of the fresh copy
   into M is a local diffeomorphism for every boundary model.
   In the original I-chart at x and the carrier chart reparameterized by
   e:E≃L[ℝ]EuclideanSpace ℝ (Fin m), identify its manifold derivative with e.symm.
   Prove the chartwise inverse is smooth and use this to pull back tangent orientations.
   For boundaryless M construct the diffeomorphism from the fresh copy onto all of M, including its
   smooth inverse; this is the map used for ordinary class transport.
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
   DeRhamCohomologyAndDuality §4.1 consumes their classes and proves integration compatibility.
   For positive-dimensional smooth manifolds with boundary over the standard
   half-space model `𝓡∂ (n+1)`, define the ambient orientation system by the
   fundamental-groupoid transport of the interior system specified below, the
   half-space orientation system. Use its single
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
   local system L (stated, like the native constant-coefficient theorems, for a
   Hausdorff space charted on a real normed space of dimension m, with no smooth
   structure and no second countability), `H_i(U,U\K;L)=0` for i>m, and the degree-m group injects
   into its local images at points of K (`compactSupportTopClass_unique`, on the
   supported twisted homology `supportedTwistedHomology` of the pair `(U, U\K)`,
   with the local image `twistedSupportLocalMap` induced by the pair map
   `supportLocalPairMap` into `puncturedPair`, on the native relative twisted homology
   `TopPair.twistedHomology` of the native twisted relative chains
   `TopPair.twistedChainComplex`). Prove existence as well
   (`compactSupportTopClass_exists`): every locally represented section
   `LocallyRepresentedTopSection` satisfying this ball-local condition over a neighborhood of K
   comes from exactly one relative class with those local images at K. Prove this
   compact-support lemma by trivialization on coordinate balls, Stage3's twisted
   excision/Mayer–Vietoris and compact finite-cover induction, as in Hatcher Lemma3.27.

   **Checks (`LocallyRepresentedTopSection`).**
   - On U=ℝ^m with constant L=ℤ and V=U, the family x↦(the pinned local generator translated to
     x) is locally represented: for a ball B about x, the translate of the pinned affine simplex
     scaled to contain B in its interior is one class of `H_m(U,U\B;ℤ)` whose local image at
     every y∈B is the generator at y. The zero family is locally represented by the zero class.
   - On U=ℝ with L=ℤ and V=U, the family equal to the generator at x>0 and to its negative at
     x≤0 is not locally represented: a class supported in an open B∋0 restricts to the interval
     component of B through 0, where restriction to each point is an isomorphism compatible with
     transport, so its local images just left and right of 0 have the same sign.
   - For m=0, U is discrete and `H_0(U,U\{x};L)=L_x`; every family of values is locally
     represented, with B={x} and the class s(x) itself.
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
   The determinant-sign action of linear maps on local orientations is native:
   `Orientation.localOrientation` selects, from an orientation of a
   finite-dimensional real normed space, a generator of its local homology at
   0, and `Orientation.localOrientation_map` carries it along continuous linear
   equivalences to the generator of the transported orientation, and
   `Orientation.localOrientation_neg` says that the opposite orientation
   selects the opposite generator, so an orientation-reversing linear map
   negates it (`Singular/LocalHomology/Orientation/Linear.lean`). Own the comparison of
   that native generator with the affine simplex class above: for m>0 swapping
   two vertices negates the ordered simplex class in relative homology, since
   the affine symmetry swapping two vertices fixes the barycenter 0 and is a
   linear reflection of determinant −1.
   Then build the punctured linearization homotopy and deduce the same
   determinant-sign action on local generators for a C¹ map on an open neighborhood
   of x with invertible derivative at x. Use the native inverse-function theorem to
   choose a ball inside an injectivity neighborhood. On that ball use
   `H_s(y)=f(x)+(f(x+s(y−x))−f(x))/s` for s>0 and
   `H_0(y)=f(x)+Df(x)(y−x)`. Prove joint continuity at s=0 from the Fréchet estimate
   and avoidance of f(x) off x for all s∈[0,1], then pass to local homology by
   excision. In m=0 prove the positive point formula directly; the empty determinant
   is +1. These lemmas supply chart overlap signs.
   Consume the native comparison with `Manifold.Orientation` (DG Layer 2): the
   oriented-chart generator `OpenPartialHomeomorph.localOrientationOfOrientedChart`, the
   local orientation `TauCeti.localOrientationOfManifoldOrientation` selected by a manifold
   orientation, independent of the quotient presentation (`Orientation/Chart.lean`), the
   identification of local orientations along open embeddings
   `Topology.IsOpenEmbedding.localOrientationEquiv` (`OpenEmbedding.lean`) and their path
   transport `TauCeti.localOrientationTransport` (`Transport.lean`). Own the identification
   of the native generator with the signed image of the actual ordered-simplex identity
   class under the chart pair map, and the sign bookkeeping below.
   Define modelOrientationSign as the unit ±1 comparing the chosen Euclidean model
   orientation with the standard ordered-coordinate orientation, including m=0.
   The sign is the product of this model-orientation sign and the lift's chart sign
   `l.sign x ⟨x, mem_chart_source⟩` at the base point x; transition-Jacobian signs enter
   when comparing two charts.
   Prove the unsigned chart-overlap determinant law at one fixed local-homology
   fibre on every manifold, including nonorientable ones; derive its oriented signed
   version from the orientation cocycle. Prove quotient-lift
   independence, and transport between different fibres only by the orientation local-system map.
   Prove invariance of the raw signed coefficient under simultaneous model-orientation and
   chart-sign reversal before quotient descent. Prove chart-simplex witness independence,
   then derive the arbitrary-lift chart formula from those two facts and the chosen raw
   representative; equality of already-descended generators is a consequence of this route.
   Build the raw chart coefficient of a lift l at any chart anchor a and point y of its
   source, the model-orientation sign times `l.sign a ⟨y,hy⟩`. Prove its constancy on
   connected neighborhoods inside that source from continuity of the discrete sign.
   Own the local-image formula of the chart-simplex support class at every y in the
   simplex interior, using the
   unique simplex preimage of y, and the recentering/excision comparison between
   anchors at the same local fibre. First localize the unsigned pair-map image of the
   ordered identity class: its image is the unsigned ordered chart class at y.
   Multiply the support class by the raw coefficient at the original center and use
   coefficient constancy to identify its local image with the coefficient at y times
   the recentered ordered chart class. These imply the signed local image throughout
   each compact partition support; a formula only at the chart anchor is insufficient.
   Prove the chart-simplex interior image open and derive that the point generator at y
   is the raw chart coefficient at y times the ordered chart class, for every anchor a,
   every lift representing o and every y in that chart source, and then the signed
   local-image formula of the support class on the whole interior.
   Use these results in the locally represented section and DG's comparison.
   Use DG's `Orientation.map`/`orientationAt` for arbitrary-chart changes, and first reparameterize
   a general finite-dimensional real model to the Euclidean basis model before using the
   Euclidean interior-atlas constructor. This AT-owned comparison also defines the oriented local
   section and feeds the relative twisted class datum (a relative class with
   prescribed local images, consumed by DeRhamCohomologyAndDuality) and the
   compact-support uniqueness
   factory; it does not introduce a second local-system or class carrier.
   DeRhamCohomologyAndDuality §4.1 consumes this
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
   supports in the T2 manifold, applying Stage3.3 excision, and applying Stage2.4–2.5
   additivity for the resulting disjoint union of pairs. In every degree identify
   this composite isomorphism with disjointSupportComponentMap, using the explicit
   two restriction pair maps, then apply the local-image characterization. Include
   the finite-family induction and the empty family. Use one coefficient-correct pair map with the canonical
   `pullbackConstantIso` in these laws. DG owns only the smooth and real-coefficient
   conversions and integration identities. Own the shared dimension-zero unit orientationSignAt o x:ℤˣ:
   for every finite-dimensional model I on E with finrank ℝ E=0, compare
   DG's orientationAt o x with the orientation of the unique empty ordered
   tangent basis of E. Prove independence of the identification with Euclidean
   0-space. Define positivePointClass x=[x]₊ as the relative homology class of
   the constant singular 0-simplex at x with coefficient 1. Prove chart/lift
   independence and that the ordered chart image at x is positivePointClass x
   for every chart anchor and simplex witness. Identify the general-model sign with
   its Euclidean presentation through the fresh carrier. In that presentation,
   for any lift l representing o, prove that the raw chart coefficient of l at a and x
   equals the integer value of orientationSignAt o x.
   State the signed specialization
   pointGenerator o x=orientationSignAt o x • positivePointClass x; keep the
   raw-anchor identity pointGenerator_zero as its separate chart-formula lemma.
   DeRhamCohomologyAndDuality §4.1 consumes this single sign definition through its local
   tangent-orientation generators.
   Prove canonical
   identifications `or_U|_V≃or_V` for opens
   V and `or_U|_K≃or_K` for codimension-0 compact submanifolds K with boundary.
   In RP² compare these local generators with Stage 4.6's sign system, using
   DG5.1's outward-first orientation of S² as the boundary of the closed 3-ball. Transport
   Stage 6.1's independent sign-system
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
   charts; GT Layer1 owns the stronger global smooth collar and gluing API.
   On the half-space ambient carrier, define `or_M` exactly once, by groupoid
   transport from the fresh Euclidean interior. All boundary restrictions and coefficient
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
   (or_M)|_(∂M)≃or_(∂M) on the half-space orientation system, including
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
   prove that the inverse chart derivative sends this to DG5.1's
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
   to DG5.1 boundaryOrientation point generators. With exactly this identification
   prove `∂_*[M,∂M]=[∂M]` for m>0. A chosen orientation gives the
   integral relative class through the orientation-induced trivialization `or_M≃ℤ`.
   Pin every interior local image by the following actual map. For a linear
   equivalence e:E≃L[ℝ]EuclideanSpace ℝ (Fin m), let C be
   the fresh Euclidean copy of the interior and val:C→M its smooth open embedding.
   Pull o back to C by DG2.2, val being a local diffeomorphism; take C's Euclidean
   pointGenerator and push it to H_m(M,M∖{x};ℤ) with the local pair map of the
   open embedding val, the native constant-coefficient pullback followed by
   pair functoriality, at the unique carrier point over x. Prove this open-excision map an
   isomorphism, and prove the resulting interior local class independent of e.
   For compact K⊂C, likewise use the open-embedding map induced by val on
   (C,C∖K)→(M,M∖val(K)); prove it an isomorphism by excision and pin its
   local images and support-enlargement compatibility. These maps apply even
   when M has boundary: they use the inclusion onto the open interior, not
   a diffeomorphism onto M. Prove that they agree with the boundaryless
   transport when that hypothesis holds, and use these maps for every
   interior compact-support comparison below. Empty boundary gives the absolute class.
   After constructing these AT6.3 classes and the boundary map, compare the
   outward-first sphere and coordinate-ball classes with the normalized classes
   supplied by Stage 2, item 5. Consume the native
   `reducedSingularHomologySphereIso` and
   `reducedSingularHomologyTopCatSphereIso` from
   `TauCeti.AlgebraicTopology.Singular.Sphere`, and the native
   `singularHomologyDiskBoundaryPairIso` and its connecting-map normalization
   from `TauCeti.AlgebraicTopology.Singular.DiskSphere`. Stage 2, item 5 owns
   the coordinate disk comparison coefficient; Stage 4.4 owns the unit `εₙ`
   and the radial/native-sphere bridge. Prove the induced maps on the AT6.3
   classes, recording each relative sign. This is a compatibility calculation for
   the orientation classes constructed here; Stage 6.3 does not choose or replace
   the native sphere/disk generators or restate Stage 2, item 5. Include
   S⁰ by verifying both local images of the AT6.3 class, and consume the
   provider's S⁰ normalization. Verify ∂[D¹]=[+1]−[−1] for the positively
   oriented interval. For the positively oriented plane disk also verify
   ∂_*[D²,S¹]=[S¹], with S¹ counterclockwise by the outward-first convention.

   For the downstream comparison with Stage 2 item 5, write q=e₀ for the
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
   choices and comparison with the fixed p-chart. Write σₙ for the Stage 6
   comparison unit, to distinguish it from Stage 4.4's εₙ. The target is
   sₙ=σₙιₙ(g̃ₙ), with σₙ=(-1)ⁿaₙ; prove `σₙ=εₙ` for n≥1, with εₙ
   the unit from Stage 4.4's radial/native-sphere bridge.

   At n=0, q=p, but the native generator's selected pole need not be q. Let
   p₀ be the point of TopCat.sphere 0 obtained by applying the inverse of
   diskBoundaryHomeomorph 1 to the Classical.arbitrary point used by
   reducedSingularHomologySphereIso_zero on the unit sphere of
   EuclideanSpace ℝ (ULift (Fin 1)); this is the actual choice in the
   definition of reducedSingularHomologyTopCatSphereIso 0. Compare p₀ directly
   with q=e₀, the positive-chart comparison pole fixed above, on this same sphere carrier, without
   a second coordinate transport. Prove the exhaustive dichotomy p₀=q or p₀=−q
   from the one-dimensional unit-vector coordinates, then compute the coefficient
   in each case. The native
   zero-sphere law gives
   ι₀(g̃₀)=[−p₀]−[p₀], with augmentation zero and local
   images +1 at −p₀ and −1 at p₀. Consume Stage 2, item 5's corrected
   two-case normalization: uniqueness from the positive local image applies
   to the absolute class for n≥1, while at n=0 the reduced reference has
   augmentation-zero ordinary image s₀=[q]−[−q]. For this downstream equality,
   verify both local images (+1 at q and −1 at −q) and augmentation zero in
   ordinary H₀(S⁰;ℤ), using the canonical reduced-to-ordinary inclusion and
   the native pole formula above. A single local image alone does not
   determine an ordinary H₀ class. Thus
   s₀=σ₀ι₀(g̃₀), where σ₀=−1 if p₀=q and σ₀=+1 if p₀=−q; equivalently
   σ₀=−ε₀, with ε₀ the Stage 4.4 unit determined by the same actual pole.
   This comparison consumes the present native arbitrary-pole generator and
   laws; it does not replace that API by a new pole-parameterized generator.
   At n=1, ρ₁ is a reflection and cᵖ₁ is clockwise, opposite the
   counterclockwise outward-first circle generator. Thus the D² boundary has
   coefficient +1 in λᵖ₁ and −1 in cᵖ₁, and σ₁=−a₁. The value a₁ is
   computed from the actual provider generator, not from a provider-selected p.

   Deduce `H_i(U;L)=0` for i>m by
   compact support of singular cycles and the pair/triple sequence (the route
   of Proposition 3.29), and prove `H_i(M,∂M;L)=0` for i>m and injectivity
   into interior local images for compact boundary manifolds using collars.
4. Prove both Poincare--Lefschetz isomorphisms by cap with that class for
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
   GT Layer 1. Trivialize its normal line by DG5.1's outward-pointing field;
   use half-space charts and compactness of ∂K to shrink the tube to a
   uniform positive radius before proving that its positive/negative sides
   lie outside/inside K. This supplies the exterior collar without
   presupposing a manifold
   structure on U\int K. Prove cap compatibility
   and agreement with `or_U|_K≃or_K`; there is no direct pair map
   `(K,∂K)→(U,U\K)`.
   Also own the compact-triad Poincaré–Lefschetz duality: for a compact m-manifold K
   with boundary faces ∂₀K,∂₁K covering ∂K, with their actual compatible
   collars and common codimension-two edge (rounded from the GT corner model),
   cap with [K,∂K] gives H^k(K,∂₁K;L)≃H_(m−k)(K,∂₀K;L⊗or_K),
   and the swapped-face form, for every module-valued local system L.
   Derive the excisive boundary triad from its face collars: choose open
   neighborhoods deformation retracting onto the faces, with intersection
   deformation retracting onto their common edge and union deformation
   retracting onto ∂K; these supply Stage6.2's excisive-couple/NDR data. Define the actual
   relative cap map through these comparisons. Prove the general form by
   the five lemma comparing the cohomology sequence of (K,∂K,∂₁K) with
   the homology sequence of (K,∂₀K). Use the existing whole-boundary
   duality on K, the corresponding compact-boundary duality on ∂₀K,
   and excision H^*(∂K,∂₁K;L)≃H^*(∂₀K,∂₀K∩∂₁K;L).
   Normalize the middle square using ∂_*[K,∂K]=[∂K] and the pinned
   degree-k cap identity ∂(z⌢φ)=(−1)^k(∂z⌢φ−z⌢δφ), retaining the
   outward face/edge orientation and local-system transport. This is
   Hatcher Theorem3.43's five-lemma route; the local-system extension is
   proved here with these transports. Include restriction to compact face
   pairs, nested rounded cuts,
   coefficient change and boundary connecting diagrams. AffineA4.0 consumes
   this single compact triad theorem in its collar exhaustion; it does not
   infer it from only the two absolute/whole-boundary forms.
   Empty boundary gives Poincare duality (Hatcher, Theorem 3.30); with `ℤ/2` coefficients,
   where every closed manifold is orientable, this is `poincareDuality_zmodTwo`, cap with a
   class whose local images generate. Then derive the field-coefficient
   and integral orientable corollaries. The integral one is `poincareDuality_int`: for a
   compact Hausdorff space M charted on a real normed space of dimension n with a native
   homological orientation `TauCeti.HomologicalOrientation`, capping with its native
   fundamental class `TauCeti.HomologicalOrientation.fundamentalClass`, moved from the
   coefficients `ULift ℤ` to `ℤ`, is a bijection `H^p(M;ℤ)→H_(n−p)(M;ℤ)` for every p≤n.  State connectedness in the corollary identifying top
   homology with the coefficient ring.
5. Derive the homological characterization and duality formulas for the shared manifold degree and
   the intersection pairing.  For a closed connected oriented `n`-manifold of finite CW type,
   construct the nonsingular torsion linking pairing
   `Tor H_i(M;Z) times Tor H_(n-i-1)(M;Z) -> AddCircle (1 : ℚ)`.  Prove finiteness of the torsion
   groups, naturality under orientation-preserving diffeomorphisms, and the symmetry law
   `lambda_i(x,y) = (-1)^((i+1)(n-i)) lambda_(n-i-1)(y,x)` with the pinned cap-product sign.
   Derive universal-coefficient consequences through the natural duality maps, and do not define a
   competing degree invariant.

The proof spine is Hatcher Sections 3.1--3.3 for cohomology operations and duality, and Dold,
*Lectures on Algebraic Topology*, Chapters VII--VIII for natural products and local coefficients.
Collars fix the boundary sign; orientation is never reconstructed from a hand-written chart list.

### Examples

- Natural-number-indexed cap product and Poincare duality carry the complementary-degree
  hypothesis `p <= n`.  In particular no above-dimension cohomology group of a connected closed
  manifold is identified with `H_0` by truncated subtraction.
- Poincare--Lefschetz duality uses the boundary orientation from the shared manifold API and
  produces the correct sign in the cap-product boundary formula.
- Nonorientable checks use RP²'s orientation system: `H^0(RP²;or)=0`
  corresponds to `H_2(RP²;ℤ)=0`, and `H^2(RP²;or)≃ℤ` to `H_0(RP²;ℤ)`.
  Both sides are computed independently by Stage 4.6 and Stage 6.1
  cellular calculations on the single Stage 4.6 carrier, with the coefficient
  identification proved in Stage 6.3. The twisted relative fundamental class has canonical local images and
  boundary equal to the outward-first class of the boundary.
- Integral Poincaré duality needs the orientation: `RP²` carries no homological orientation in
  dimension 2 (its integral local orientations admit no transport-compatible choice, and
  `H_2(RP²;ℤ)=0` has no class with generating local images), and indeed `H^0(RP²;ℤ)≅ℤ` while
  `H_2(RP²;ℤ)=0`; with `ℤ/2` coefficients both are `ℤ/2`, as `poincareDuality_zmodTwo` requires.
  For the circle, capping the generator of `H^1(S^1;ℤ)` with the fundamental class gives a
  generator of `H_0(S^1;ℤ)`, and capping `1∈H^0` gives the fundamental class itself.
- The tower difference map, six-term sequence, Mittag--Leffler vanishing,
  integer-graded Milnor sequences and cofinal shifts satisfy their naturality
  diagrams. The derived-limit cone compares with ordinary limits of degreewise
  surjective towers; homotopy-square cone maps retain their chosen homotopies.
- Torsion linking has complementary degrees, target `AddCircle (1 : ℚ)`, the displayed symmetry
  sign, and nonsingularity under the stated finite-generation hypotheses.

### Dependencies

| Stage | Depends on | Can proceed alongside |
| --- | --- | --- |
| 6.0 tower algebra | native module/category/complex algebra | 1--8 |
| 6.1--6.4 cohomology/duality | 6.0 for 6.1 skeletal limits; 2--3, Stage 5 item 1 product maps, DG2 tangent orientations, the DG2.4 orientation double cover and the DG5.1 outward-first boundary convention, native smooth local boundary charts plus the compact-domain Brown topological collar, and Stage 4.4's εₙ/radial native-sphere bridge used by 6.3; Stage 4 for cellular comparisons/RP² | 1 |
| categorical-cover/cup-length supplement after6.2 | native opens/homotopies/ENat; 2–3, 5.1 and ordinary6.1–6.2, plus the direct point-chain contraction; no manifold duality or Morse input | 6.3–6.5 |
| supported-cellular comparison after ordinary6.2 | ordinary4 cellular data, ordinary6.1–6.2; owns the compactly supported local-coefficient cochains, proves countability and the finite-support cellular/singular comparison | ordinary6.3–6.5, Stage7 and ordinary8 proceed independently; proper8.5 uses the needed support interfaces |
| 6.5 linking/degree consequences | 2--4 and ordinary6.1--6.4; DG10's smooth mapping-degree comparison only after the independent AT6.3 classes | 1 |

## Stage 7: Euler characteristic and finite decompositions

This stage consumes every one of Stages 2--6.  Stage 1 is not a prerequisite.

1. Consume the native alternating cell count `TauCeti.cwEulerChar` and Euler--Poincare
   equality with alternating homology rank over a division ring for finite CW complexes, and
   the native transport to spaces of finite CW type: `TauCeti.FiniteCWType`, the Euler
   characteristic `TauCeti.eulerChar`, its independence of the chosen Hausdorff finite CW model
   `TauCeti.eulerChar_eq_cwEulerChar` and its homotopy invariance
   `ContinuousMap.HomotopyEquiv.eulerChar_eq`. The original space need not be Hausdorff merely
   to possess such a model; the cell count is defined on a bare native finite CW structure, but
   its homotopy invariance and agreement with singular homology require a Hausdorff carrier,
   which the native class carries.
2. Prove product multiplicativity, consuming the native product CW structure of finite
   complexes and `TauCeti.cwEulerChar_prod`, and multiplicativity for fibre bundles
   with finite-CW base and fibre.  The bundle theorem must be derived from Stage 5's chain or
   spectral-sequence machinery.
3. Prove finite-cover multiplicativity from transfer and additivity for finite excisive
   decompositions from Mayer--Vietoris.  Prove cellular-stratification additivity from the
   relative cellular filtration.
4. State cofibration, compactness, and finiteness assumptions explicitly.  Establish the standard
   checks `chi(S^n)=1+(-1)^n`, `chi(T^n)=0` for `n>0`, and
   `chi(CP^n)=n+1`. The complex-projective check consumes Stage 4.6's cell
   structure of complex projective space on the native `Projectivization`
   carrier, one cell in each even dimension 0,2,…,2n, so the alternating cell
   count is n+1; it consumes no complex-manifold, Hodge or Serre-duality
   input. ComplexKahlerGeometry K7 consumes Stage 4.6's projective carrier and
   cell structure, and its separate projective cup calculation consumes
   ordinary Stage 6.

### Examples

- Euler characteristic gives the standard values on spheres, tori, and complex projective
  spaces and proves both additivity and finite-cover multiplicativity from earlier maps.

### Dependencies

| Stage | Depends on | Can proceed alongside |
| --- | --- | --- |
| 7 Euler characteristic | 2--6, with 4.6's CPⁿ cell structure for the CPⁿ check | 1 |

## Stage 8: relative homotopy, Hurewicz, Whitehead, and ordinary representability

This stage consumes Stages 2--4, the universal-covers roadmap's induced-map and basepoint API,
and geometric topology's smooth-triangulation result for the manifold corollaries.
Items 8–12 additionally consume ordinary Stage 6 cohomology and the item-level suppliers above;
items 1–7 are independent of those later constructions.

1. Consume the native based pairs `TauCeti.BasedTopPair`, a `TopPair` with an actual point of
   its subspace, with basepoint-preserving maps of pairs, and the native relative homotopy sets
   `TauCeti.RelHomotopyGroup`, `pi_n(X,A,a_0)` on relative cubes, with their induced maps,
   boundary maps, exact sequence of pointed sets, group structure in degrees at least two and
   commutativity in degrees at least three. Extend them with basepoint change and the
   module-valued carrier in degrees at least three, and state relative groups for NDR
   pairs/cofibrations where hypotheses are needed. The empty-subspace pair admits no based
   carrier.
   Keep the low-degree algebra honest: use pointed-set and group carriers in the ranges where
   relative homotopy is not abelian, and expose a `ModuleCat Z` carrier only in degrees at least
   three.  In particular, `pi_2(X,A)` is group-valued in general; its abelianization, not the
   unmodified group, is the module-valued source available without connectivity assumptions.
   Consume the native connectivity of a CW pair from its cell dimensions: for a native relative
   CW pair (X,A) in a Hausdorff ambient space whose relative cells all have dimension at least
   λ, `TauCeti.subsingleton_relHomotopyGroup_of_isEmpty_cell` gives π_i(X,A,a)=0 for
   1≤i<λ at every a∈A, `TauCeti.surjective_homotopyGroupMap_of_isEmpty_cell` and
   `TauCeti.injective_homotopyGroupMap_of_isEmpty_cell` give that the inclusion induces
   π_q(A,a)≅π_q(X,a) for q≤λ−2 and a surjection for q=λ−1, including the component
   statements in degree zero, and the `_of_comp_eq` forms transport these along a commuting
   square g:X→Y, f:A→B of maps inducing bijections on every π_q. Own naturality of the induced
   isomorphisms under based maps of pairs and the basepoint-change corollary at every b∈B. If
   relative groups of the target pair are used, take its cofibration/NDR data as a separate
   hypothesis. In particular, based homotopy equivalences of pairs supply these hypotheses.
   RiemannianGeometry R3 applies the transported range to
   CharacteristicClasses C2.0's bundle-cell relative CW models, compared with
   MorseTheory M5's actual Morse–Bott negative-disk attachments; the sphere Freudenthal
   theorem itself is owned by the homotopy-sphere roadmap.
   Own the Kelley product comparison of homotopy groups for pointed topological spaces X,Y
   as the composite of the map induced by k(X×Y)→X×Y and existing
   Tau Ceti `HomotopyGroup.prodEquiv` / `prodMulEquiv` from
   `Topology/Homotopy/HomotopyGroup/Product.lean`. Prove the first map is
   a bijection on classes because cubes and their homotopy cylinders are
   compact Hausdorff. Retain q=0 as a pointed-set bijection and q≥1 as a
   group isomorphism, naturality and actual projection/inclusion maps.
   No Hausdorff assumption is needed for this comparison. TopK T7.0 uses
   it on Stage 4.5's Kelley CW product; compact generation supplies its product-valued
   map x↦(x,*).

2. Consume the native homotopy groups `SSet.KanComplex.π` of Kan simplicial sets
   (`AlgebraicTopology/SimplicialSet/KanComplex/HomotopyGroup.lean`), the native Kan
   property `TauCeti.kanComplex_toSSet_obj` of `TopCat.toSSet.obj X`
   (`SimplicialSet/KanComplex.lean`), and the native comparison
   `TopCat.toSSetPiMulEquivHomotopyGroup` with cubical homotopy groups in degrees at least
   two (`AlgebraicTopology/Homotopy/SingularSet.lean`), with its degree-one form through
   the opposite group. Own compatibility with induced maps, boundary maps, and basepoint
   change.
   Pin the Kan/cubical comparison by the
   ordered-simplex orientation: a Kan spherical simplex σ realizes to the
   cubical class whose normalized Hurewicz image is the actual relative
   simplex class σ_*[Δ^n,∂Δ^n] in H_n(X,{x₀}), transported to absolute
   H_n(X) for n≥1 by the pair sequence. An unnormalized even-dimensional
   singular simplex need not itself be an absolute cycle. Construct the cube-to-simplex orientation comparison
   between I^n/∂I^n and Δ^n/∂Δ^n, with Δ^n oriented by its ordered vertices;
   it sends the Stage 2.5 coordinate cube class to the relative identity
   simplex class with coefficient +1. Prove its Hurewicz compatibility and
   the corresponding Moore/realization comparison, without an independent sign.
   Own the Kan property of simplicial groups: every simplicial group is a native `SSet.KanComplex`.
   For a Dold–Kan simplicial module Γ(K) consume the native Moore comparison
   `ChainComplex.doldKanPiAddEquivHomology`, π_(n+1)(Γ(K))≃H_(n+1)(K) at the zero
   vertex (`AlgebraicTopology/DoldKan/HomotopyGroups.lean`). Own the natural Moore
   comparison for every simplicial abelian group G, π_n(G)≃H_n(NG), including
   components in degree zero. For general simplicial groups set N_n=⋂_(i=1)^n ker d_i
   with differential d₀, matching native `normalizedMooreComplex` in the
   abelian case. Prove π_n(G)≃ker(d₀|N_n)/d₀(N_(n+1)) for n≥1,
   with normality of the boundary subgroup and commutativity of the quotient;
   π₀(G) is the possibly nonabelian group G₀/d₀(N₁). Own
   the Kan realization-unit comparison: Mathlib's actual `sSetTopAdj.unit.app K`
   from a Kan K to `TopCat.toSSet.obj (SSet.toTop.obj K)` induces a bijection
   on components and the normalized based π_n isomorphisms in every positive
   degree. Prove it by compatible finite-simplex restrictions, subdivision,
   Kan filling and relative simplicial approximation (owned here, including subcomplexes
   and homotopies fixed there); fix the sphere orientation
   through Stage 4.4, with item 8.6's cubical representative comparison. Item 8.8c consumes these classical results to compute
   π_n|Γ(A[n])|. GeneralizedCohomology G2.1 consumes this unit theorem in
   its Quillen comparison, rather than reconstructing its underlying weak-equivalence proof.
3. Consume the native absolute Hurewicz map `HomotopyGroup.hurewiczHom` for every n≥1,
   which sends the class of a generalized cubical loop p to the image under p of the
   generator of `H_n(Iⁿ,∂Iⁿ)`, with its group law and naturality, and compare it with the
   sphere form: a loop g descends through the Stage 4.4 quotient q to a pointed sphere map
   g̅, and h[g]=g̅_*[S^n] on the outward-first normalized generator; own this comparison and
   its sign. Consume the native degree-one Hurewicz theorem
   `TauCeti.HurewiczOne.hurewiczHomologyAddEquiv`: for a path-connected pointed X the
   induced map π₁(X)ᵃᵇ → H₁(X;ℤ) is an isomorphism, sending a loop to its positively
   oriented singular circle class, proved on singular chains (Hatcher 2A.1), natural in
   pointed maps by the native `TauCeti.HurewiczOne.homologyMap_hurewiczHomologyAddEquiv`.
   DGFloer Layer 1 item 1 consumes this exact isomorphism through its cubical/simplicial
   chain comparison.
   For arbitrary spaces consume Stage 4.8's direct Eilenberg-subcomplex
   connected-map comparison; it uses face-compatible compression and prisms,
   not this Hurewicz theorem. Consume the native absolute theorem
   `HomotopyGroup.hurewiczAddEquiv`: an `(n-1)`-connected pointed space has
   `pi_n(X) ~= H_n(X;Z)` for `n>=2` through the Hurewicz map; its reduced integral
   homology vanishes below `n` by the native relative vanishing
   `TauCeti.isZero_singularHomology_ofSubset_of_relHomotopyGroup` applied to the pair
   `(X, {x})`.
4. Consume the native relative Hurewicz map `TauCeti.RelHomotopyGroup.hurewicz` on
   `TauCeti.RelHomotopyGroup`, the native vanishing `H_i(X,A;Z)=0` below `n` when the relative
   homotopy sets vanish below `n`, its surjectivity in degree `n`
   (`TauCeti.RelHomotopyGroup.surjective_hurewicz`) and its bijectivity
   `TauCeti.RelHomotopyGroup.bijective_hurewicz_of_subsingleton_homotopyGroup` when both `A`
   and `X` are `(n-1)`-connected, which in degree two is the full relative Hurewicz theorem for
   simply connected `A` and `X`.  Own the form for `n≥3` with only `A` simply connected and
   `pi_i(X,A)=0` for `i<n`, which the native file leaves open:
   `relHurewicz_bijective_of_simplyConnected_subspace` states that for path-connected `X`,
   simply connected `A` with `a ∈ A` and trivial relative sets `pi_i(X,A,a)` for `1≤i<n`,
   the native relative Hurewicz map is bijective in degree `n` (Hatcher, Theorem 4.37).
   Path connectedness of `X` is a hypothesis, since a path component of `X` missing `A`
   contributes its absolute homology to `H_n(X,A)` and nothing to `pi_n(X,A,a)`.  Derive
   the exact isomorphism and surjectivity range for
   `H_i(A)->H_i(X)` from the pair sequence.  In degree two, the native
   `TauCeti.RelHomotopyGroup.mul_comm_of_subsingleton` gives commutativity of `pi_2(X,A)`
   from simple connectivity of `A`; prove that the map to its abelianization is an
   isomorphism, and only then identify it with relative homology.
5. Consume Whitehead's theorem for spaces of CW type, the native
   `ContinuousMap.IsWeakHomotopyEquivalence.homotopyEquiv`, whose forward map is the given weak
   equivalence, together with its lifting and uniqueness API (Hatcher 4.22).  Own
   `homologicalWhitehead`: combine relative Hurewicz with the mapping cylinder to prove that a
   map between simply connected spaces of CW type inducing isomorphisms on integral homology is
   the forward map of a homotopy equivalence (Hatcher, Corollary 4.33, for CW complexes; spaces of
   CW type follow by transport along the models).
   First consume the native predicate `TauCeti.SimplyConnectedAtInfinity`: for every
   compact K⊂X there is a compact L⊃K such that every continuous circle in
   X\L is nullhomotopic in X\K. A nullhomotopy stays in that complement;
   connectedness/number of ends is a separate condition. Its native API gives
   the equivalence with any cofinal compact-exhaustion formulation, exhaustion
   independence, homeomorphism invariance and invariance under proper homotopy
   equivalence. FourManifolds consumes this predicate for its recognition theorem for
   contractible four-manifolds simply connected at infinity.
   On connected noncompact finite-dimensional locally finite CW spaces own
   the ends: decreasing nonempty components U_i of complements of
   compact sets, eventually disjoint from every compact set, modulo mutual
   cofinal containment. Prove agreement with the inverse limit of component
   sets of a cofinal exhaustion. Construct cofinal compact neighborhoods with
   finitely many complementary components at each level, absorbing bounded
   components when needed. Connectedness at infinity means that, beyond some
   larger compact set, every two points join in the complement of a prescribed
   smaller compact set; prove it equivalent to one end on these spaces.
   Own the stable fundamental group at an end in the exact image sense of
   Freedman and Quinn, *Topology of 4-Manifolds*, §7.7: choose
   a defining component sequence and a proper reference ray for basepoints
   and whiskering; after cofinal refinement the groups
   im(π₁U_(i+1)→π₁U_i) map isomorphically to one another. Retain that common
   group π₁α, change-of-ray conjugacy and cofinal defining-sequence comparisons.
   Do not require the full bonding maps themselves to be isomorphisms.
   With finitely many ends prove `TauCeti.SimplyConnectedAtInfinity` equivalent to
   stability with trivial π₁α at every end: cofinal nullhomotopies stay in
   the specified component, and finitely many end neighborhoods plus absorption
   of bounded components give the uniform compact condition. Prove the same
   comparisons for manifolds through a specified locally finite CW
   homeomorphism or finite-component compact-neighborhood exhaustion;
   an ordinary CW-type homotopy equivalence alone is not an end comparison.
   This generic end API precedes Four's proper product theorem and constructs
   no surgery or smoothing data.
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
   cylinder comparisons; `HasProperHomotopyExtensionProperty` is the predicate
   and `HasProperHomotopyExtensionProperty.cylinderBoundary` the product-pair
   corollary. Export `properStrongDeformationRetract_of_inverse`:
   for a closed strongly locally finite CW subcomplex A⊂X, a proper inverse
   of its inclusion, with joint proper inverse homotopies as in the native
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

   **Checks (`HasProperHomotopyExtensionProperty`).**
   - A=∅ has the property in every X: the stationary homotopy K(t,x)=f(x) extends, and it is
     proper because I is compact and f is proper.
   - A=X has the property: the prescribed homotopy H is itself the extension.
   - The comb pair X=[0,1], A={0}∪{1/k : k≥1} fails it: X is compact, so every map out of X and
     out of I×A into the Hausdorff target Y=(I×A)∪({0}×X)⊂ℝ² is proper, and the property would
     extend the identity of Y to a retraction I×X→Y, which does not exist since A is not a
     cofibration (Hatcher, Chapter 0, the example preceding Example 0.15).
   After proper cellular approximation, construct the actual locally finite finite-dimensional mapping cylinder M_f and its closed collared bottom X. Prove its projection to Y and slide homotopy proper on the whole cylinder. Ordinary homology isomorphisms give H_*(M_f,X;ℤ)=0; compact-support pullback isomorphisms give H_c^*(M_f,X;ℤ)=0 through the supported pair sequence. Identify relative cellular chains with the algebraic cone, with d(y,x)=(d_Yy+f_*x,−d_Xx), and its finite-support dual with the corresponding shifted cochain cone; retain the relative comparison and all signs. Do not collapse the noncompact X to a topological cone point and assume that quotient locally compact.

   Apply the previously owned countability result and prove, over ℤ, FTW
   Theorem4.2's locally finite contraction for the ordinary direct-sum based
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
   filling Lemma4.3. Inductively set r_n(e)=e−s_(n−1)d(e); the previous
   contraction identity makes it a cycle. Row finiteness of d and s_(n−1)
   sends basis elements outside a sufficiently large finite set into any
   prescribed cycle tail. Choose controlled finite fillings along a cofinal
   exhaustion of the countable basis, so each output coordinate occurs in
   only finitely many fillings. Their linear extension gives row- and
   column-finite s_n with ds_n+s_(n−1)d=id. This is AT8.5 work, not
   an imported lemma. Then separately own the geometric proper
   Hurewicz/Whitehead realization at infinity yielding Corollary4.9's
   actual proper inverse and two jointly proper homotopies under the stated
   simply-connected/SC-at-infinity hypotheses. No finite-domination-to-finite-CW
   or one-end assumption is added.
   Follow Farrell–Taylor–Wagoner, *The Whitehead theorem in the proper
   category*, Compositio27 (1973), §§1–4, especially Theorem4.2 and
   Corollary4.9 ([primary paper](https://www.numdam.org/item/CM_1973__27_1_1_0.pdf)).
   This proper extension uses the supported cochain foundation; ordinary
   Whitehead above retains its arbitrary CW-type scope without that input.
6. Consume Stage 4.4's single pointed orientation-normalized cube quotient
   homeomorphism and its generator comparison, for n≥1, and prove
   compatibility with cubical representatives. Its quotient q collapses precisely
   ∂I^n to the positive first-coordinate pole and sends Stage 2.5's ordered
   cube class to the normalized sphere class after absolute-to-relative comparison.
   Use Stage 2.5's independently pinned positive-hemisphere-chart sphere
   class and disk normalization, together with Stage 4.4's degree +1 equation
   and its explicit n=0 versus n≥1 radial boundary/native-sphere comparison.
   Stage 6.3 identifies the canonical outward-first fundamental class with
   this earlier reference.
   Pin the sphere basepoint
   to the positive first-coordinate pole and export the boundary-generator comparison.
7. Prove that every finite-dimensional Hausdorff second-countable smooth manifold
   with the Euclidean or half-space model, with or without boundary, has
   countable locally finite CW type by consuming GeometricTopology 12.1 (Whitehead's smooth
   triangulation) and Layer 11's realization homeomorphism and CW structure.
   The compact case has finite CW type, `compactManifoldFiniteCWType` on the Euclidean
   model and `compactManifoldWithBoundaryFiniteCWType` on the half-space model `𝓡∂ n`,
   n≥1, both stated on the native class `TauCeti.FiniteCWType` and proved through the native
   `TauCeti.IsTriangulable.finiteCWType`; include the boundary-pair forms and
   finitely many prescribed interior marked points outside the relative boundary locus. As a reusable corollary, prove that a simply connected integral homology
   `n`-sphere, `n>=2`, is homotopy equivalent to the standard `S^n`.

8. **Nonabelian classifying spaces (`groupClassifyingSpace`, its vertex
   `groupClassifyingSpaceBasepoint`, `groupClassifyingSpace_isEMOne`).**
   Own the single generic bar/nerve construction for every discrete group π. Use native `CategoryTheory.nerve`, `SingleObj π`,
   and `SSet.toTop`; construct the contractible free π-space Eπ, its covering
   Eπ→Bπ; consume Stage 4.7's single realization CW structure on both. Prove its native
   `TauCeti.IsEilenbergMacLaneSpaceOne π` property and identify its π₁ with π,
   naturally in group homomorphisms. Pin the bar edge labelled g to g under
   Mathlib's `SingleObj` composition and `FundamentalGroup.mul_def` conventions: both
   compose the later traversal on the left. Prove the oriented-edge identification
   is compatible with the native group operation.

   **Checks (`groupClassifyingSpace`).**
   - For the trivial group the nerve of `SingleObj` is the nerve of the terminal category, a
     point in every degree, so the realization is a point with trivial π₁.
   - For G=ℤ the bar model is a K(ℤ,1) of CW type and so is homotopy equivalent to S¹ by the
     native uniqueness `TauCeti.IsEilenbergMacLaneSpaceOne.nonempty_homotopyEquiv` and the native
     circle comparison; a model built from the constant simplicial set on the underlying set of
     ℤ would be a discrete space with trivial π₁.
   - For G=ℤ/2 the bar model is a K(ℤ/2,1), so H₁(;ℤ)≅ℤ/2, H₂(;ℤ)=0 and H_k(;ℤ/2)≅ℤ/2 in every
     degree k≥0, the homology of RP^∞; the edge labelled the generator is the nontrivial loop at
     `groupClassifyingSpaceBasepoint`.
   Separate the raw bar construction (8.8a), which feeds 8.8c's abelian
   K(A,1) specialization, from the bar model's normalized pointed interface
   (8.8b). The latter uses only 8.8a, Stage 4 and 8.5.
   For a Hausdorff CW K(G,1) Z with a chosen identification κ_Z:π₁Z≅G,
   construct through the mapping bijection below the pointed map c_G:Z→Bπ
   normalized by κ_bar ∘ π₁(c_G)=κ_Z, so the induced group map is the
   identity on G; it is a weak equivalence, hence a pointed homotopy
   equivalence by 8.5 with a pointed homotopy inverse, unique up to pointed
   homotopy.
   State the conversion between the left G-action on Eπ and the native
   Deck≃π₁ᵐᵒᵖ convention explicitly, including the inversion isomorphism
   G→Gᵐᵒᵖ where used. Prove group-homomorphism naturality of c_G up to
   pointed homotopy and the induced naturality on cohomology. Keep the
   existing bar-label inversion below.
   The raw bar supplies the object used by 8.8c's abelian
   specialization. ClassifyingSpaces consumes 8.8a's bar model and owns its
   normalized comparison with the Milnor and presentation models, the
   resulting identification of the local-coefficient cohomology comparisons
   and the comparison of the augmentation-preserving resolution maps; no
   item here consumes those.
   Item 8.8c aliases the abelian specialization as K(A,1);
   the generic CW/cover proof is supplied only here. For each connected
   pointed CW complex X prove `[X,Bπ]_*≃Hom(π₁X,π)` and that forgetting basepoints
   gives the conjugation-orbit description of `[X,Bπ]`. Treat disconnected X
   componentwise. Consume the native identification of the cohomology of the
   base of a contractible free quotient cover with group cohomology,
   `IsQuotientCoveringMap.singularCohomologyIsoGroupCohomology`
   (`Cohomology/GroupCohomology.lean`), and apply it to the bar covering once
   |Eπ| is contractible, so that `H*(Bπ;M)` is Mathlib's `groupCohomology` of
   the trivial representation; for Milnor's model the native
   `TauCeti.classifyingSpaceSingularCohomologyIsoGroupCohomology` and its
   local-coefficient form
   `TauCeti.classifyingSpaceTwistedCohomologyIsoGroupCohomology` are the same
   statements. Own the local-coefficient identification on the bar model,
   `H*(Bπ;A)` with `groupCohomology A n` for every `A : Rep ℤ π`, through its
   native `inhomogeneousCochains` complex: construct the corresponding
   `LocalCoefficientSystem ℤ Bπ` and chain comparison.
   For Stage 6's first-vertex direct cochains the zeroth face uses inverse
   transport: pin the comparison with native inhomogeneous cochains by
   ψ(g₁,…,g_k)=φ(g₁⁻¹,…,g_k⁻¹). Prove differential, coefficient and
   change-of-group naturality with this formula. Own the all-degree discrete
   homogeneous/inhomogeneous comparison, extending the existing low-degree
   `ContCohomology.GroupCohomologyIso` API. Consume the existing all-degree
   finite-discrete existence comparison
   `TauCeti.ContCohomology.nonempty_continuousCohomology_addEquiv_groupCohomology`
   from `ContCohomology.DiscreteGroup`; this item adds the actual natural
   cochain comparison for arbitrary discrete groups. Transport native
   `TauCeti.TopPairing.cup` for discrete group/coefficient topologies to a cup
   product on group cohomology. Prove the standard inhomogeneous formula
   P(ψ(g₁,…,g_p), (g₁⋯g_p)·χ(g_(p+1),…,g_(p+q))) and agreement with
   the Stage 6 singular cup under the displayed label inversion.
   **8.8c. Functorial abelian Eilenberg–MacLane models.** Own the single functorial abelian
   model in each degree n≥1, with the normalized maps induced by homomorphisms
   A→A′ recorded as a coefficient-natural family. For n=1 set K(A,1)=B(Multiplicative A), an
   alias of 8.8a's native `|nerve (SingleObj (Multiplicative A))|`, which
   owns the contractible Eπ, covering, CW structure and fundamental-group
   edge normalization. For n≥2 use the realization of the simplicial abelian
   group Γ(A[n]) from Mathlib's Dold–Kan equivalence, with A[n] the
   nonnegative chain complex concentrated in degree n, and Stage 4.7's single
   realization CW structure. Construct the coefficient-natural identification
   π_n≃A through 8.2's simplicial-group Kan/Moore theorem and actual Kan
   realization-unit comparison, followed by the degree-n homology map of the
   native Dold–Kan counit NΓ(A[n])≅A[n], so the distinguished class of the
   normalized simplex labelled a maps to a; pin the positive sphere
   orientation by 8.6. In degree one compare Γ(A[1]) with the abelian nerve
   as simplicial abelian groups, with the edge labelled a corresponding to a,
   and use the bar carrier throughout. Prove all other positive homotopy
   groups vanish. The construction uses only 8.1–8.8b, not 8.9–8.12's
   obstruction or representability results. For a directed union A=⋃A_i of
   subgroups prove the simplicial inclusions are subcomplexes with union the
   chosen model, so H_*(K(A,n))=colim H_*(K(A_i,n)) by compact supports. No
   statement about arbitrary topological filtered colimits is made: the
   topological colimit of S¹→S¹→⋯ under degree-2 maps is indiscrete and is
   not K(ℤ[1/2],1). Native `IsEilenbergMacLaneSpaceOne` supplies the
   degree-one property interface.
   Own a second, comparison CW construction of K(A,n) from a presentation of
   A: for n≥2 a wedge of positively oriented n-spheres for its generators
   with (n+1)-cells attached along its relations, and for n=1 the
   group-presentation 2-complex, followed by killing successive higher
   homotopy groups by cells in dimensions ≥n+2, respectively ≥3. The killing
   step is native: `TauCeti.killHomotopyGroups (n+1)` of the presentation
   complex keeps π_k for k≤n (`TauCeti.bijective_homotopyGroupMap_killHomotopyGroupsIncl`),
   kills π_k for k≥n+1 (`TauCeti.subsingleton_homotopyGroup_killHomotopyGroups`)
   and is a Hausdorff CW complex (`TauCeti.killHomotopyGroupsCWComplex`,
   `TauCeti.cwType_killHomotopyGroups`), in `Homotopy/KillHomotopyGroups.lean`;
   consume it and do not rebuild the tower. Own Hatcher's
   Lemma 4.31 skeletal extension: realize a supplied homomorphism on π_n by
   maps of the generator spheres and extend over the presentation cells using
   their null relations; the extension over every higher cell, using the
   target's vanishing higher homotopy, is the native
   `TopCat.Hom.exists_killHomotopyGroupsIncl_comp_eq`. Own the based maps,
   homotopies and coefficient normalization. These use Stage
   4's cell attachments and 8.1–8.7's relative homotopy/Hurewicz/Whitehead
   machinery. Give the coefficient-normalized comparison of the presentation
   model with the chosen bar/Dold–Kan model by skeletal extension and
   Whitehead; the functorial carrier stays that single model.
   Own uniqueness (Hatcher 4.30): for the chosen K(A,n) and any path-connected
   Z with π_n Z≅A and all other homotopy groups zero, with π₀ included
   explicitly, a map K(A,n)→Z realizing a given isomorphism on π_n exists,
   constructed on the presentation model and precomposed with a based
   homotopy inverse of the normalized comparison, and is a weak equivalence;
   when Z has CW type it is a homotopy equivalence by 8.5 and Stage 4.8. The
   normalized identification uses 8.2's ordered-simplex/cube orientation
   comparison: a spherical n-simplex labelled a has image under 8.3's
   Hurewicz map the relative class σ_*[Δ^n,∂Δ^n], transported to absolute
   homology by the point-pair sequence, while its normalized Moore class maps
   to a under the Dold–Kan counit, which does not act directly on the
   topological singular class; this fixes the constructor's sign. Item 8.10
   proves the downstream universal-class evaluation e_a↦a; this item
   consumes no such class. By Stage 4.8 every K(A,n) has the homology of the
   chosen model. Identify ΩK(A,n) with K(A,n−1) for n≥2 by applying
   uniqueness to the fibre of Stage 5.5's based path fibration over K(A,n),
   with the coefficient-natural connecting isomorphism on π_(n−1); 8.11b's
   loop comparison is the independent adjunction-side construction. Item
   8.10, GeneralizedCohomology G2 and DGFloer Layer 1 consume this fixed
   constructor and normalized identification without constructing another
   abelian model.
   **8.8d. Serre classes and Hurewicz modulo a class.** A Serre class is
   Mathlib's `IsSerreClass` on abelian groups, closed under subgroups,
   quotients and extensions, together with Serre's axioms for ⊗, Tor and the
   homology of K(A,1). Consume the native instances: the torsion groups
   `AddCommGrpCat.isTorsion`, equivalently G⊗ℚ=0, and, for a fixed integer
   d≥1, the groups `AddCommGrpCat.isKilledBySomePower d` annihilated by some
   power of d, with their native closure under ⊗ and Tor; record that
   the groups annihilated by one fixed dᵐ, for d≥2 and m≥1, do not form a
   class, since they are not closed under extensions. For the K(A,1) axiom
   consume the native finite case on Milnor's classifying space,
   `TauCeti.isAddTorsion_classifyingSpace_singularHomology` and
   `TauCeti.isKilledBySomePower_classifyingSpace_singularHomology`
   (`ClassifyingSpace/Torsion.lean`), where the group order annihilates the
   positive-degree homology through the group-homology transfer and the
   native identification of H_*(BG) with group homology, and transport it to the bar model by the native uniqueness of K(G,1) spaces of
   CW type, `TauCeti.IsEilenbergMacLaneSpaceOne.nonempty_homotopyEquiv`
   (`Uniqueness.lean`). For the torsion class reduce by 8.8c's directed-union
   property to finite A. That route
   gives no uniform exponent for the class of groups annihilated by a power of d:
   for A=⊕_ℕ ℤ/d the finite subgroups have orders dⁱ with i unbounded. For
   d^mA=0 write A instead as a direct sum of cyclic groups of orders dividing
   d^m (Prüfer's theorem on bounded abelian groups); transfer gives the
   exponent on each cyclic summand, the Künneth formula on finite sums keeps
   it, since tensor products and Tor of groups annihilated by d^m are
   annihilated by d^m, and the directed union over finite sums preserves the
   uniform exponent d^m. Consume Mathlib's isomorphisms and epimorphisms
   modulo a Serre class, `ObjectProperty.isoModSerre` (kernel and cokernel in
   C) and `ObjectProperty.epiModSerre` (cokernel in C), with their
   multiplicativity and two-out-of-three property
   (`CategoryTheory/Abelian/SerreClass/MorphismProperty.lean`), applied in
   `AddCommGrpCat` through `AddCommGrpCat.ofHom`. Own the record
   `SatisfiesSerreAxioms` of Serre's
   tensor, Tor and K(A,1) axioms on a class, taken on Milnor's classifying
   space of the group, and the mod-C
   comparison of fibre, base and total space in Stage 5.5's homological
   Serre sequence over a simply connected CW base. Prove H̃_*(K(A,n);ℤ)∈C
   for A∈C and every n by induction through Stage 5.5's based path fibration
   over 8.8c's model, whose fibre is ΩK(A,n)≃K(A,n−1). Own Hurewicz modulo a
   Serre class for simply connected spaces, `hurewicz_isoModSerre` (Serre 1953,
   Chapter III, Theorem 1): for a Serre class C satisfying those axioms, if
   π_i(X)∈C for 2≤i<n then H_i(X;ℤ)∈C for 0<i<n, the native Hurewicz
   homomorphism π_n(X)→H_n(X;ℤ) is an isomorphism modulo C, and the one in
   degree n+1 is an epimorphism modulo C; for C=0 this is the absolute Hurewicz theorem, and for n=2 the
   hypothesis on homotopy groups is empty. Prove it on Stage 4.8's CW approximation through the tower of
   Stage 5.5 mapping-path fibrations with fibres the loop spaces of 8.8c's
   models, using 8.3 and 8.4 at the first stage. DGFloer Layer 1 consumes
   this theorem and the Serre-sequence inputs for its mod-2 vanishing and
   Whitehead-tower applications, which stay there; GeneralizedCohomology G5
   consumes the torsion instance for its rational stable Hurewicz theorem.

   **Checks (`SatisfiesSerreAxioms`).**
   - The zero class satisfies all three axioms: 0⊗0=0, Tor(0,0)=0, and Milnor's classifying space
     of the trivial group is contractible; for it `hurewicz_isoModSerre` is the absolute Hurewicz
     theorem.
   - The torsion class satisfies them: tensor products and Tor of torsion groups are torsion
     (the native closure), and the positive-degree homology of the classifying space of a
     torsion group is torsion (finite groups natively, directed unions in general).
   - The class of finite abelian groups satisfies them: ⊗ and Tor of finite groups are finite,
     and the positive-degree integral homology of the classifying space of a finite group is
     finitely generated in each degree and annihilated by the group order.
   - Non-example: for d≥2 and m≥1 the groups annihilated by one fixed d^m are not a Serre class
     at all, since the extension 0→ℤ/d^m→ℤ/d^(2m)→ℤ/d^m→0 leaves the class.
9. **Relative obstruction cochains.**
    For each relative CW complex (X,B), n≥1 and path-connected target Y with
    π₁Y acting trivially on π_nY in the native action `TauCeti.homotopyGroupMulAction`
    (so π₁Y is abelian when n=1), and a map on
    X^n∪B, construct its relative cellular (n+1)-cochain with coefficient π_nY
    by its characteristic-map boundary classes. Use the outward-first
    orientation induced by Stage 2.5's coordinate-oriented ball reference
    class, identified with Stage 6's canonical relative fundamental class,
    transported to the cell by Stage 4.4, and its
    degree +1 boundary-sphere homeomorphism. Choose the positive first-coordinate
    boundary point; transport the based class from f(φ_e(v₀)) to the fixed
    y₀ along a specified path in Y, by the native transport along a homotopy class of
    paths `TauCeti.homotopyGroupTransportQuotient`. Prove choice independence using the
    trivial π₁ action on π_n, with the degree-one commutativity hypothesis explicit.
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
    Prove the full local-coefficient lifting/section version for Stage 5's
    Serre fibrations with path-connected n-simple fibres: use fibre π_n and
    its transport along base paths as a module-valued functor on the fundamental
    groupoid, concretely `LocalCoefficientSystem ℤ X`, with the fibre transport built from
    the native `TauCeti.homotopyGroupTransportQuotient` and its composition law. For a lifting problem
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
10. **Ordinary cohomology representability (`ordinaryEMRepresentability`).**
    Consume 8.8c's single functorial abelian CW/bar/Dold–Kan K(A,n) constructors
    for every abelian A and n≥1; this item consumes the constructor and its homotopy
    groups, rather than rebuilding its models. Each model is an `OrdinaryEMModel`: a
    path-connected Hausdorff CW space with a normalized identification of π_n with A and
    all other positive homotopy groups zero; export 8.8c's family through that
    record with its normalized identification and the
    natural maps induced by homomorphisms A→A′. Own the universal class
    `ι_(A,n)∈H^n(K(A,n);A)`: under Hurewicz, degree-one abelianization and universal
    coefficients its evaluation is the identity A→A. In `ordinaryEMRepresentability`,
    stated for every model K of `OrdinaryEMModel A (n+1)`, this is the requirement that
    the Kronecker evaluation `TopCat.singularKronecker` of ι on the Hurewicz image
    `HomotopyGroup.hurewiczHom` of each γ∈π_(n+1)(K) is the element of A that the
    model's identification assigns to γ; it excludes −ι and ι composed with a
    nontrivial automorphism of A, and determines ι, since the Hurewicz map onto
    H_(n+1)(K;ℤ) is surjective and `H^(n+1)(K;A)≅Hom(H_(n+1)(K;ℤ),A)` for a model
    (Hatcher, Theorem 4.57, there for basepoint-preserving maps of CW complexes;
    π₁(K) acts trivially on them: for n≥1 the model is simply connected and the
    native `TauCeti.fundamentalGroup_smul_eq_self` applies, and for the degree-one model the
    native action on π₁ is conjugation (`TauCeti.pi1MulEquivFundamentalGroup_smul`) in the
    abelian group A; the free form follows componentwise). Fix degree-one identification
    by the bar's oriented one-simplex labelled a. Construct the pullback map
    `[f]↦f*ι_(A,n)` on free homotopy classes `continuousHomotopyClasses`, the quotient by
    the homotopy relation `continuousHomotopySetoid` (the map
    `ordinaryEMPullback`, descended by native homotopy invariance), and prove it is a
    bijection, for every CW complex X of arbitrary
    dimension and any number of components, with `H^n(X;A)`. Prove surjectivity
    by realizing cellular cocycles on n-cells and extending over all higher cells;
    prove injectivity by realizing cellular coboundaries as homotopies, using the
    Stage 4.5 relative cylinder CW structure and weak topology. There is no finite-CW
    hypothesis, and no passage from finite subcomplex bijections that suppresses
    phantom-map issues. Prove naturality in X and A, compatibility with normalized
    homotopy-group identifications, zero, addition and inverses. Obtain addition
    from the simplicial abelian models. Use Stage 4.5's simplicial-realization
    product comparison, identifying |A•×A•| with k(|A•|×|A•|), together
    with its stated compact-generation facts on native `CompactlyGenerated`,
    `UCompactlyGeneratedSpace` and `TopologicalSpace.compactlyGenerated`;
    that target uses only Stage 4 and precedes HA and ordinary
    representability. Route paired maps
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

    **Checks (`OrdinaryEMModel`).**
    - The circle with its CW structure and the identification π₁(S¹)≅ℤ sending the standard loop
      to 1 is a model for (ℤ,1): its universal cover ℝ is contractible, so πⱼ(S¹)=0 for j≥2.
    - The 2-sphere with π₂(S²)≅ℤ is not a model for (ℤ,2): π₃(S²)≅ℤ by the Hopf fibration, so the
      vanishing field fails; a record asking only for vanishing below n would accept it.
    - A point is a model for (0,n) for every n≥1; a two-point discrete space is not, since it is
      not path connected, although every homotopy group at either point vanishes.
    - RP^∞ with π₁≅ℤ/2 is a model for (ℤ/2,1), and its universal class in H¹(RP^∞;ℤ/2) is the
      nonzero class.

    **Checks (`ordinaryEMPullback`).**
    - The class of the identity of K goes to ι itself, by functoriality of singular
      cohomology; a pullback twisted by an automorphism of A would fail this.
    - For n≥1 the class of a constant map X→K goes to 0, since it factors through a point and
      H^n(pt;A)=0; for n=0 the constant map at k goes to the constant function with value ι(k),
      so the vanishing is a positive-degree statement.
    - For a map h:X′→X and f:X→K the class of f∘h goes to h^* of the image of the class of f,
      so the pullback map is natural in X; for K=S¹, A=ℤ and n=1 the class of the degree-d map
      S¹→S¹ goes to d times the generator.
11. **Mapping-space CW type and ordinary EM loops.**
    **8.11a. Early mapping-space CW type (`finiteSourceMappingCWType`,
    `basedLoopCWType`).** This independent block uses the earlier CW/pair
    foundations, including Stage 4.5's compact-generation interface, only; it
    has no input from 8.10 or the EM loop comparison below.
    Own `finiteSourceMappingCWType`, the finite-CW-source pair specialization
    of Milnor 1959 Theorem 3 for n-ads (and Corollary 3 for based loops): mapping spaces from a finite CW pair
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
    `basedLoopCWType`; compare native fixed-interval loops with the Kelley
    mapping carrier. Use Stage 4.5's interval-product comparison
    k(Y×I)≅k(Y)×I to prove that k preserves homotopy equivalences, including
    their relative forms; transport the CW-type witnesses through it.
    **8.11b. Ordinary EM loop comparison.** Construct coefficient-natural pointed
    maps K(A,n)→ΩK(A,n+1) for every n≥0 inducing the identity on A. Use the
    native fixed-interval loop carrier and `HomotopyGroup.pathLoopSpaceMulEquiv`
    in positive degrees, with the loop coordinate last. In degree zero use
    `HomotopyGroup.zerothHomotopyLoopSpaceEquivFundamentalGroup` and the pinned
    bar-edge identification. DGFloer's standing Moore conventions and its
    Layer 2 item 3 consume this fixed-interval convention for their carrier
    comparisons, preserving constant loops and addition.
    Define the ordinary cohomology suspension here, including its unreduced
    cone adapter. For any CW space B form the actual unreduced cone CB by
    adjoining an apex to B×I and collapsing B×{0} to it. Define Σ_uB=CB/B
    by Stage 4.5's pointed collapse of B×{1}; when B is empty its two apices
    remain distinct. Let σ_right:H^n(B;M)→H̃^(n+1)(Σ_uB;M) be (−1)^n
    times the cone-pair connecting map, transported by that quotient comparison.
    For a pointed CW complex with 0-cell basepoint, collapse its basepoint
    meridian and pass to reduced cohomology. Own the actual two-step
    homeomorphism to Stage 4.4's interval-last raw
    quotient, sending every representative (b,t) to that same (b,t) class,
    with the collapsed meridian at the same basepoint. Prove naturality and
    transport the suspension/connecting maps through this homeomorphism
    using Stage 4.4's raw-to-kified comparison for the reduced suspension of a
    pointed Hausdorff CW space. This gives the reduced suspension
    ΣB=B∧S¹ with S¹ last; σ_right is the positive cross product with the
    interval generator u with ⟨u,[I,∂I]⟩=+1; the chain boundary is [1]−[0]. In degree zero the unreduced construction
    kills constant functions and factors through H⁰(B)/im H⁰(CB); do not
    identify the suspension of a constant ordinary H⁰ class with a circle class.
    Define the reflected cone with B at 0/apex 1 and interval first, its
    suspension Σ_u,left B, and σ_left as minus its cone-pair connecting map.
    On pointed reduced classes it is the positive product u×a.
    Distinguish these from the full ordinary suspension for B₊=B⊔{*}:
    the ordinary cohomology suspension on the pointed B₊ gives isomorphisms
    H^n(B;M)→H̃^(n+1)(Σ(B₊);M), including the degree-zero constant classes.
    The actual quotient q_+:Σ_uB→Σ(B₊) identifies the two apices; prove
    q_+^*σ_plus=σ_u for both coordinate orders. When B is empty this is
    the collapse of the two-apex space to a point. The pointed mapping-cone
    collapse used in spectral cofibers has target Σ(B₊), and its pullback
    kills constant degree-zero classes as the ordinary pair boundary does.
    For the mapping cone M_AT(i)=X∪_(B×{1})CB of B→X, let
    c_AT:M_AT(i)→Σ_uB be the actual collapse of X. Define M_G(i) and c_G
    using the reflected interval-first cone. Under Stage 4.5's actual pair-to-
    mapping-cone comparison prove δ_(X,B)=(−1)^(n+1)c_AT^*σ_right
    and δ_(X,B)=c_G^*σ_left. After composing each collapse with q_+,
    prove the same formulas using σ_plus with target Σ(B₊); this is the
    adapter for based mapping cones C(B₊→X₊). Reflection t↦1−t has degree−1 and moving
    the interval first contributes (−1)^n, so their composite on ΣS^n
    has degree (−1)^(n+1). Prove both the cone-pair and ordinary-pair formulas
    by actual chain comparisons and the interval/endpoints test at n=0 with
    the class 1 at endpoint 1. Prove coefficient, pair-map, relative-cup and
    suspension compatibility under Stage 6's excisive-triad hypotheses;
    cup products require the stated commutative-ring hypotheses.
    Pin δ(i^*a∪b)=(−1)^p a∪δb and δ(b∪i^*a)=δb∪a for
    degree-p a, using actual pair module maps and the local-system pairing.
    Under the pointed-smash reassociation with coordinates (X,Y,I), prove
    σ_right(a×b)=a×σ_right(b); moving I past degree-q b gives
    σ_right(a)×b=(−1)^qσ_right(a×b). State the actual smash/interchange
    comparison maps; this is cross-product compatibility, not a claim that
    suspension preserves the ordinary cup ring.
    Own the based suspension–loop adjunction on the native fixed-interval loop
    carrier: for pointed spaces B and Y, currying in the last coordinate is a
    bijection, natural in B and Y, from based maps out of the raw interval-last
    reduced suspension of B to Y onto based maps from B into the based loops of Y
    with the compact-open topology, and it induces a bijection of based homotopy
    classes. No compact-generation hypothesis enters: the interval is compact
    Hausdorff, so the exponential law holds for every B, and the product of the
    suspension quotient map with the interval is again a quotient map.
    Prove σ sends the distinguished universal class to the class whose adjoint
    induces identity under the native last-coordinate shift, using this
    adjunction and Stage 4.5's simplicial-realization product comparison for
    addition.
    Only after 8.11a's independent CW-type proof, consume
    Stage 4.8's CW approximation and 8.5 to upgrade the EM loop weak
    equivalences to pointed homotopy equivalences. Own the bijection induced
    by these weak equivalences on maps from arbitrary CW sources via cellular
    lifting, independently of that upgrade. Prove coefficient/addition/adjunction
    naturality and the relative/basepoint versions.
    Generalized cohomology and spectra consume these ordinary interfaces.
12. **Native circle comparison of the degree-one model.** Consume the native
    homotopy equivalence `TauCeti.circleHomotopyEquivClassifyingSpace` of
    Mathlib's `Circle` with Milnor's classifying space of `Multiplicative ℤ`,
    whose forward map induces the identity of ℤ on fundamental groups
    (`ClassifyingSpace/Circle.lean`), and the native
    `TauCeti.IsAspherical.exists_homotopyEquiv`, which realizes a prescribed
    isomorphism of fundamental groups between aspherical spaces of CW type
    (`Uniqueness.lean`). Compare the
    degree-one ordinary model K(ℤ,1) of 8.10's family, the bar model for ℤ,
    with native `AddCircle.isEilenbergMacLaneSpaceOne` at period 1 and
    basepoint 0: apply the native realization theorem to the bar model and
    to `AddCircle` at period 1, both K(ℤ,1) spaces of CW type (the latter by
    the native `TauCeti.finiteCWType_addCircle`), with the identity of ℤ, obtaining the pointed homotopy equivalence sending the bar
    edge labelled +1 to the loop t↦t mod ℤ, 0≤t≤1, so that 8.10's
    distinguished degree-one class corresponds to the circle class pairing
    to +1 with that loop. Prove compatibility with 8.10's normalized
    homotopy-group identification and with the coefficient maps induced by
    homomorphisms ℤ→A. CharacteristicClasses consumes this comparison,
    8.8b's normalized ℤ/2 model and 8.10's K(ℤ,2) model and
    representability for its identification of the rank-one infinite
    projective carriers as ordinary EM spaces; no projective carrier,
    characteristic-class definition or finite-projective comparison is
    constructed here.

Hatcher Section 4.1 gives Whitehead's theorem (Theorem 4.5) and Section 4.2 the absolute
Hurewicz theorem (Theorem 4.32); Whitehead, Chapters
IV--VII, gives the relative and cellular forms.  May, *Simplicial Objects in Algebraic Topology*,
Chapters 3 and 12, supplies the Kan-group construction and comparison route.
Hatcher Section 4.3 supplies ordinary representability (Theorem 4.57) and obstruction theory;
[*Vector Bundles and K-Theory*, Section 3.3](https://pi.math.cornell.edu/~hatcher/VBKT/VB.pdf)
supplies the relative section obstruction and difference-cochain construction. The
local-coefficient extension retains the stated fibre transport rather than assuming
trivial monodromy.

### Examples

- Homological Whitehead produces a homotopy inverse to the given homology equivalence between
  simply connected CW-type spaces; it does not merely assert that some unrelated equivalence
  exists.
- The proposed relative-homotopy API does not make `pi_2(X,A)` a `Z`-module in general.  Its
  degree-two Hurewicz theorem derives the needed commutativity from connectivity, while the direct
  module-valued carrier starts in degree three.
- Every relative-homotopy group, induced map, boundary morphism, long exact sequence, and Hurewicz
  map takes a native `TauCeti.BasedTopPair`; its point lies in the subspace and all maps preserve
  it. The API
  cannot construct `pi_n(X,A)` from an unbased `TopPair` or from an empty subspace.
- Ordinary representability's pullback map is bijective on arbitrary CW complexes,
  including disconnected and infinite-dimensional ones, and additive for every abelian
  coefficient group. Degree zero uses component functions; relative maps fix the subcomplex.
- The normalized universal class evaluates to the identity on the distinguished homotopy
  group, and the ordinary loop comparison induces that identity with the pinned suspension sign.
- A fixed n-skeleton extends exactly when its obstruction cochain vanishes. Vanishing of
  its cohomology class permits alteration of the n-skeleton relative to the lower skeleton
  and the specified subcomplex. Fibre transport and difference signs agree with these maps.

### Dependencies

| Stage | Depends on | Can proceed alongside |
| --- | --- | --- |
| 8.1–8.7 Hurewicz/Whitehead | 2--4 and the cited external roadmaps; proper8.5 additionally the supported-cellular supplement's compactly supported cochains, proper pullback, jointly proper homotopy invariance, cellular comparison and countability | 1, 5; ordinary Hurewicz/Whitehead also alongside ordinary6–7 |
| 8.8a raw bar/abelian input | 4, ordinary6, native nerve/realization and universal-cover APIs | 8.8c's abelian K(A,1) specialization |
| 8.8b normalized bar-model interface | 8.8a bar model, 4, 8.5 | 8.9 |
| 8.8c abelian EM family | 4.7, 4.8, 8.1–8.8a, 8.2's Kan/Moore comparison and 5.5's based path fibration for the loop identification; no 8.9–8.12 input | 7 |
| 8.8d Serre classes/Hurewicz modulo a class | 4.8, 5.3 transfer, 5.5 Serre sequences and path fibrations, 8.3–8.5, 8.8c | 7 |
| 8.9 primary relative obstructions | 4, 5.5 fibre transport, ordinary6 cellular cochains, 8.1–8.7 | 8.8b |
| 8.10 ordinary representability | 4, ordinary6, 8.3 including its degree-one Hurewicz isomorphism, 8.6, 8.8c, 8.9, 4.5's simplicial-realization product comparison and compact-generation facts | 7 |
| 8.11a mapping-space and based-loop CW type | Earlier CW/pair foundations (4), including 4.5's compact-generation interface, only; no 8.10 input | 7 |
| 8.11b ordinary EM loops | 4.8's CW approximation, 8.5, 8.10, 8.11a, 4.5's compact-generation interface and simplicial-realization product comparison | 7 |
| 8.12 native circle comparison | 8.8a, 8.10 and the native `AddCircle` EM instance; no projective carrier or external comparison | 7 |

## Downstream consumers

- **DifferentialGeometry** consumes the singular chains and cochains, relative cohomology,
  subdivision and small chains (Stages 2, 3 and 6) and Stage 6's universal coefficients, cup
  product and cochain Mayer–Vietoris sequence for its de Rham theorem.
- **DeRhamCohomologyAndDuality §4.1** consumes Stage 6.3's homological orientation system,
  chart-normalized point generators, chosen local section, relative twisted class datum and
  compact-support class factory, and its single sign definition.
- **DGFloer** Layer 1 consumes Stage 4.8's connected-map comparisons and CW approximation, Stage
  5.0's filtered-complex spectral sequence, Stage 5.5's fibration sequences and Serre spectral
  sequences, Stage 8.3's degree-one Hurewicz isomorphism, Stage 8.8c's abelian `K(A,n)` family and
  Stage 8.8d's Hurewicz modulo a Serre class; its Moore-loop conventions and Layer 2 item 3
  consume Stage 8.11b's fixed-interval loops; it consumes Stage 4.4's sphere and suspension
  homeomorphisms.
- **ClassifyingSpaces** consumes Stage 8.8a's nerve/bar model with its CW structure, `K(π,1)`
  property and `π₁` identification.
- **GeneralizedCohomology** consumes Stage 4.4's pointed quotients (G2.1), Stage 4.5's
  simplicial-realization product comparison (G2.1), Stage 4.8's comparisons (G2.1), Stage 5.5's
  path-fibration lifting functions (G2.10) and Serre spectral sequences (G5), Stage 8.2's unit
  theorem (G2.1), Stage 8.8c's family (G2) and Stage 8.8d's torsion instance (G5).
- **TopologicalKTheory** consumes Stage 5.5's based homotopy sequence (T1.5), the CW and
  Whitehead tools of Stages 4 and 8 (T1.6), and Stage 4.5's based homotopy inverse and Stage
  8.1's Kelley product comparison (T7.0).
- **CharacteristicClasses** consumes Stage 4.7's cell-neighbourhood contraction and Stage 4.8's
  weak-equivalence maps (C1.2), the supported-cellular supplement's compactly supported
  local-coefficient cochains after Stage 6.2 (C1.2a), Stages 4 and 6, 8.8b, 8.10 and 8.12
  (C1.5), Stage 4.5's relative CW pushouts (C2.0) and Stage 6.0's cochain Milnor sequence (C3).
- **ComplexKahlerGeometry** consumes Stage 4.6's projective carrier and cell structure (K7),
  Stage 5.0's filtered-complex spectral sequence and the ordinary Serre and Eilenberg–MacLane
  targets (K8).
- **RiemannianGeometry** consumes Stage 4.4's sphere quotients and suspension homeomorphism and
  Stage 8.1's transported connectivity range (R3), and Stage 4.6's real projective carrier
  (R4.7).
- **MorseTheory** consumes Stage 4.4's disk pairs and Stage 4.5's union theorem and relative CW
  pushouts (M2), and the categorical supplement after Stage 6.2 (M4).
- **SmoothBundlesConnections** B6.1 consumes Stage 6.1's coefficient connecting maps.
- **AffineMorseLefschetz** A4 consumes Stage 4.5's subcomplex-neighbourhood interface, Stage
  4.7's realization CW structure, Stage 6.0's integer-graded Milnor sequence and Stage 6.4's
  compact triad duality.
- **FourManifolds** consumes Stage 8.5's simple connectivity at infinity and proper end API.
- The **homotopy-sphere roadmap** consumes Stage 4.5's compact-generation interface, Stage
  8.11b's suspension–loop adjunction, Hurewicz, Whitehead, duality, finite CW type and the
  homology of spheres.

## References

- Ronald Brown, *Topology and Groupoids*, 3rd ed., Booksurge, 2006, Section 6.7 (Theorem 6.7.2),
  Section 7.4 (7.4.2 and its Addendum, pp. 285–286, homotopy equivalences of maps between
  cofibrations) and Sections 8.4 and 9.1 (Theorems 8.4.1 and 9.1.2).
- Rainer M. Vogt, *A note on homotopy equivalences*, Proceedings of the American Mathematical
  Society 32 (1972), 627–629, Proposition and Lemma 1, p. 627, for adjusting the second
  inverse homotopy of a homotopy equivalence.
- Samuel Eilenberg and Norman Steenrod, *Foundations of Algebraic Topology*, Princeton
  University Press, 1952, Chapters I--III.
- Allen Hatcher, [*Algebraic Topology*](https://pi.math.cornell.edu/~hatcher/AT/AT.pdf),
  Chapter 0, Sections 1.2, 2.1--2.2, 3.1--3.3, 3.B, 3.G--3.H, 4.1--4.3 and 4.G, and the
  Appendix.
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

- Arne Strøm, *Note on cofibrations II*, Mathematica Scandinavica 22 (1968), Theorem 6, for
  products of cofibered pairs with a closed subspace.
- John Milnor, *Morse Theory*, Annals of Mathematics Studies 51, Princeton University Press,
  1963, Lemmas 3.6–3.7, for attachments along homotopic maps.
- Tammo tom Dieck, *Algebraic Topology*, EMS Textbooks in Mathematics, European Mathematical
  Society, 2008, Theorem 9.5.1, for the homology comparison of connected maps.
- Jean-Pierre Serre, *Groupes d'homotopie et classes de groupes abéliens*, Annals of
  Mathematics 58 (1953), 258--294, Theorem 1, for Hurewicz modulo a class.
- Michael Freedman and Frank Quinn, *Topology of 4-Manifolds*, Princeton Mathematical Series 39,
  Princeton University Press, 1990, §7.7, for the fundamental group at an end.
- John Milnor, [On Spaces Having the Homotopy Type of a CW-Complex](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/milnorcw.pdf), Section 2, Theorem 3 and Corollary 3, for arbitrary-CW and n-ad function-space CW type (the
  proof of Corollary 3 refers to Theorem 3 as Theorem 4, a misprint: the paper has no Theorem 4); its countable class W₀ is distinct from the general class W used here.

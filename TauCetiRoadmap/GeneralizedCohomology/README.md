# Roadmap: generalized cohomology, spectra and orientations

**Summary.** This roadmap builds the stable algebraic topology needed to use cohomology
theories rather than only singular cohomology: integer-graded reduced and relative theories and
their products (G1); a concrete spectral model, symmetric spectra of pointed simplicial sets
with the stable model structure of Hovey, Shipley and Smith, its comparison with spaces and
sequential spectra, Eilenberg–Mac Lane spectra, the multiplicative infinite-loop machine,
general classifying spaces, mapping-path replacements and the quasicategorical and monoidal
foundations these models need (G2); Brown representability, the comparison theorem on
arbitrary CW complexes, telescopes, the Milnor sequence, phantom maps, Postnikov covers,
localization and completion (G3); generalized Leray–Hirsch, Thom and Euler theory with real,
complex and quaternionic orientations (G4); and finite Spanier–Whitehead duality, Thom spectra,
the canonical ring spectra and orientations, and rational Hurewicz theorems (G5). The pointed
simplicial sets, symmetric sequences and symmetric spectra are Tau Ceti's; the CW, homotopy-group
and ordinary-homology substrate is AlgebraicTopology's. The headline theorems are the stable
model structure and its comparisons, Freudenthal suspension, Brown representability, the
comparison theorem, the Milnor sequence, the Thom isomorphism, Spanier–Whitehead duality, the
Hurewicz–Dold theorem for numerable bundles, and the stable and unstable rational Hurewicz
theorems. [Suggested.lean](Suggested.lean) is the acceptance test: it states the headline
theorems that are statable against the pinned Mathlib and Tau Ceti and names the others with
the carrier each lacks. Implementation homes are `TauCeti/AlgebraicTopology/Spectra/` and
`TauCeti/AlgebraicTopology/GeneralizedCohomology/`.

## Scope and ownership

This roadmap owns the axiomatic generalized theories of G1, the spectral model and its
represented theories of G2, the infinite and representability theory of G3, the generalized
bundle theory of G4 and the duality, Thom-spectrum and rational theory of G5. All CW statements
include arbitrary cell sets and unbounded dimension in the chosen universe. Finite or countable
hypotheses occur only on results that use them. Spaces of CW type are included by comparison,
and the spectrum-defined extension to arbitrary spaces uses singular simplicial sets. No
dimension axiom is imposed on generalized theories. The construction of a spectrum does not
substitute for its homotopy theory: naive colimits of homotopy groups do not define stable
equivalences of arbitrary symmetric spectra.

**Already in the pinned libraries, consumed rather than planned again.**

- Tau Ceti's pointed simplicial sets `TauCeti.PointedSSet`, with their degreewise smash
  product, its symmetric monoidal closed structure, simplicial tensors and cotensors, the
  simplicial circle and the suspension–loop adjunction; the finite-bijection groupoid
  `TauCeti.FiniteBijection`, symmetric sequences `TauCeti.SymmetricSequence` with Day
  convolution and its wedge formula, the sphere `TauCeti.SymmetricSequence.sphere`, symmetric
  spectra `TauCeti.SymmetricSpectrum` as modules over it, free spectra and evaluation, limits and
  colimits, the sphere monoids for higher-dimensional spheres, the point-set smash product and
  function spectra. G2.1 and G2.2 build the homotopy theory of these carriers, not the carriers.
- Tau Ceti's Hurewicz fibrations `TauCeti.IsHurewiczFibration`, their universal lifting
  functions, mapping-path spaces `TauCeti.MappingPathSpace` and fibres
  `TauCeti.MappingPathFiber`, the path and loop comparisons of the fibres, the fibre inclusion
  and fibre transport homotopy equivalences, and the relative lifting theorem for NDR pairs.
  G2.10 owns only what these lack.
- Tau Ceti's marked simplicial sets `TauCeti.MarkedSSet` with their limits, colimits and
  mapping spaces, joins `SSet.join`, slices `SSet.slice`, Cartesian edges
  `SSet.Edge.IsCartesian`, Cartesian fibrations `SSet.CartesianFibration`, equivalence edges
  `SSet.Edge.IsEquivalence` and the core `SSet.core`. G2.11 owns the model structures,
  straightening and the theorems about these objects, not the objects.
- Mathlib's quotient topology on `Projectivization` over a division ring, used for quaternionic
  projective space in G4.0.

**Owned here and consumed elsewhere.** G2.1's Kan–Quillen model structure and G2.11's enriched,
quasicategorical, straightening, coherent-diagram, stable and operadic foundations are owned
here, together with the reduced mapping cone and Puppe sequence of G1.3, the pointed smash of
compactly generated spaces, the topological Freudenthal theorem and the stabilized sphere colimit
of G2.5, and the complex graded Clifford conventions of G5.5. The roadmaps listed under
Downstream consumers take these from here rather than planning them again.

**Left to the roadmaps named in the supplier contracts.** Singular chains, ordinary
homology and cohomology, CW topology, homotopy groups, compact generation, the realization
product comparison, the pointed quotient, smash and suspension carriers of compact Hausdorff and
CW inputs, the based suspension–loop adjunction, the ordinary Eilenberg–Mac Lane models and
Serre classes remain in AlgebraicTopology. Vector bundles, classifiers, bundle-level Bott
periodicity and the eight stable Bott equivalences remain in TopologicalKTheory; ordinary
characteristic classes and the classical Eilenberg–Mac Lane comparisons of RP∞ and CP∞ remain
in CharacteristicClasses. BordismFormalGroups consumes G2–G5 and owns formal group laws,
orientation changes and coefficient-ring universality, so G4.5 states no formal-group
universality.

**Moved identifiers.** The realization product comparison is AlgebraicTopology Stage 4.5's
single simplicial-realization product comparison; G2.1 builds only its pointed smash and quotient
versions. The G2.1, G2.2 and G2.10 carriers below are Tau Ceti's.

- G2.1 realizationProductKelleyComparison → AlgebraicTopology Stage 4.5, simplicial-realization
  product comparison.
- G2.10 IsHurewiczFibration, MappingPathSpace and MappingPathFiber → Tau Ceti
  `TauCeti.IsHurewiczFibration`, `TauCeti.MappingPathSpace` and `TauCeti.MappingPathFiber`.
- G2.10 mappingPathFiberConstHomeomorphPath and mappingPathFiberConstHomeomorphLoopSpace → Tau Ceti
  `TauCeti.mappingPathFiberConstHomeomorphPath` and `TauCeti.mappingPathFiberConstHomeomorphLoopSpace`.
- G2.10 zeroSetSDR_liftingInclusion → Tau Ceti
  `TauCeti.HasHomotopyLiftingProperty.zeroSetSDR_liftingInclusion`.
- G2.1 and G2.2 pointed simplicial sets, finite bijections, symmetric sequences and symmetric spectra
  → Tau Ceti `TauCeti.PointedSSet`, `TauCeti.FiniteBijection`, `TauCeti.SymmetricSequence` and
  `TauCeti.SymmetricSpectrum`.

## Conventions

- Work in explicitly fixed universes. The category of u-small CW objects has a
  set of cells in `Type u`, and theory values for Brown's theorem are u-small.
  Prove the solution-set bounds so the representing CW object is in that same
  universe, and prove universe-lift comparisons. Do not use a proper-class
  wedge in a construction. The pointed CW category has chosen cell structures,
  a 0-cell basepoint, all continuous based maps, and pointed homotopy classes.
  Its products are CW products in the compactly generated category of
  AlgebraicTopology Stage 4.5, with k the coreflection: prove the weak
  product CW structure agrees with k(X×Y). All products, wedges, smash and
  relative-product unions below use that topology and its comparison maps.
- Based spaces carry a point and maps preserve it. For CW models use a chosen
  0-cell as basepoint; for general models use the derived singular extension.
  `X₊` means a **disjoint** basepoint; it is distinct from one-point
  compactification. Form mapping cones for arbitrary pointed maps; identify
  them with subset quotients only for cofibration/NDR pairs.
- Write `ΣX = S¹ ∧ X`, with the suspension coordinate on the left, and orient
  `S¹` by the increasing interval parameter. `Σ` on spectra is the derived
  suspension, made invertible in the stable homotopy category. `Σⁿ` uses every
  integer n, with native `HasShift C ℤ`, inverse and composition isomorphisms.
  Use native `Pretriangulated`/`IsTriangulated` for the cofiber triangles.
  A reduced cone uses A×[0,1], with A attached at t=0 and its t=1 end
  collapsed. The increasing collapse c:C_f→ΣA sends (a,t) to [t,a].
  Suspension in cohomology is σ(a)=ι×a with the positively oriented interval
  unit class ι on S¹ on the left. For the ordinary pair-to-mapping-cone
  comparison normalize `δ_(X,A)(a)=c*σ(a)`. Pin the relative cycle map:
  for ([0,1],{0,1}) a positive interval lifts to the closed cycle consisting
  of that interval plus the increasing cone over 1 minus the cone over 0;
  a=1 at endpoint 1 then evaluates +1 after collapse. Distinguish the cone
  pair (CA,A): extending 1 at the attached end to 0 at the apex gives its
  cochain boundary −1 on the positive interval. Its connecting map is
  `δ_(CA,A)=−σ` under CA/A≃ΣA, whereas the actual pair-to-mapping-cone
  map contributes the additional sign in the displayed formula.
  AT uses its apex0/attached-end1 cone and last interval coordinate. Its
  `ordinaryCohomologySuspension` agrees with a×ι and obeys
  `σ_AT(a)=(−1)^n τ*σ(a)` for |a|=n and the block swap τ:X∧S¹→S¹∧X.
  Use interval reflection t↦1−t for the cone comparison, retaining AT's
  actual reference chains and quotient/pair maps. Prove the respective
  chain signs −1 and (−1)^n on cells/spheres, and the graded external-product
  block-symmetry identity on arbitrary spaces. Prove the relation
  `δ_(X,A)=(−1)^(n+1)c_AT*σ_AT` for AT's increasing collapse. Prove the
  HA comparison intertwines extend-then-d through these actual maps;
  the cone-pair and ordinary-pair boundaries are not identified literally.
  For an unpointed pair use Σ(A₊), so the reduced suspension represents
  full Hⁿ(A), including degree0 constants. AT separately supplies the
  unreduced suspension and its quotient identifying the two apices;
  its pullback kills the constant degree0 class and agrees with this
  pointed pair triangle. Retain the empty-A branch.
  Normalize the homology boundary by the same ordered interval and AT's
  pair chain boundary. These tests and adapter maps pin the signs.
- For a spectrum E, `π_n E = [Σⁿ S,E]`,
  `Eⁿ(X,A) = [Σ∞ C(A₊→X₊),ΣⁿE]`, and
  `E_n(X,A) = π_n(E ∧ᴸ Σ∞ C(A₊→X₊))`. For a based space use reduced
  suspension spectra and based cofibers. In particular `Eⁿ(*) = π_(−n) E`;
  the coefficient grading must not be reversed silently.
- Cohomology takes arbitrary wedges to **products**; homology takes them to
  **direct sums**. Colimits in spectra are homotopy colimits when forming
  telescopes or deriving a functor. A strict levelwise limit is not a homotopy
  limit without a comparison theorem and its hypotheses.
- Products are induced by the derived smash and a chosen unital associative,
  homotopy-commutative spectrum multiplication. A strict ring-spectrum model
  is used where module-model categories are constructed. Homotopy-commutative
  multiplication is sufficient for the graded ring on groups; it is not an
  assertion that the model is an E∞ ring or that every homotopy ring rectifies
  to a strictly commutative ring. Permuting sphere coordinates supplies the
  Koszul sign `(-1)^(pq)` for **integer** degrees p,q.
- For a group, functor, structure map or quotient introduced here, supply maps,
  identity/composition laws, naturality, change of representative/model and
  the relevant universal property. For a spectral construction supply stable
  equivalence invariance and the stated topological/simplicial comparison.


## Exact supplier contracts

### From Mathlib

- `SSet`, `SSet.boundary`, `SSet.horn`, `SSet.KanComplex`, `SSet.Quasicategory`, the inner
  fibrations and the internal hom of simplicial sets; `SSet.modelCategoryQuillen.I` and
  `SSet.modelCategoryQuillen.J` with their cofibration and fibration classes
  (`AlgebraicTopology/SimplicialSet/CategoryWithFibrations.lean`). Mathlib has no class of weak
  equivalences of simplicial sets and no `ModelCategory SSet`; G2.1 builds them.
- `HomotopicalAlgebra.ModelCategory`, `HomotopicalAlgebra.ReedyStructure`, categorical
  localization, `HasShift`, `Pretriangulated` and `IsTriangulated`; `CategoryTheory.Under`,
  `Action`, `Mon`, `Mod`, `CommMon`, `DayFunctor`, `EnrichedCat`, `EnrichedFunctor`,
  `ForgetEnrichment`, `CategoryTheory.SimplicialCategory`, `SimplicialThickening` and
  `SimplicialNerve`.
- `TopCat`, `TopCat.toSSet`, `CompactlyGenerated` with `CompactlyGenerated.compactlyGeneratedToTop`
  and `TopologicalSpace.compactlyGenerated`, `Topology.CWComplex` and `Topology.RelCWComplex`
  (`Topology/CWComplex/Classical/Basic.lean`), `HomotopyGroup`, `LoopSpace`, `Path`,
  `OnePoint`, `Bundle.Trivialization`, `FiberBundle`, `VectorBundle` and `PartitionOfUnity`.
- `TopPair.HomologyPretheory` with `IsExtraordinaryEilenbergSteenrod`
  (`AlgebraicTopology/EilenbergSteenrod.lean`): the shape of the unreduced homology theories of G1
  and the carrier of the homology form of the comparison theorem in G3.3.
- `FormalGroup` and `FormalGroup.IsComm` (`RingTheory/FormalGroup/Basic.lean`), `CliffordAlgebra`,
  `Quaternion`, `Projectivization` with its quotient topology over a division ring,
  `CStarModule`, `WithCStarModule`, `LinearPMap` and the continuous functional calculus classes.

### From Tau Ceti

- Pointed simplicial sets: `TauCeti.PointedSSet`
  (`AlgebraicTopology/SimplicialSet/Pointed/Basic.lean`) as `Under Δ[0]`, its comparison with
  simplicial objects in `Pointed`, the smash product with
  `TauCeti.PointedSSet.monoidalCategory` and `TauCeti.PointedSSet.symmetricCategory`
  (`Pointed/Smash/Basic.lean`), its closed structure `TauCeti.PointedSSet.monoidalClosed`
  (`Pointed/Closed.lean`), simplicial tensors and cotensors (`Pointed/Tensor.lean`), the circle
  `TauCeti.PointedSSet.circle` (`Pointed/Circle.lean`) and
  `TauCeti.PointedSSet.suspensionLoopAdjunction` (`Pointed/Suspension.lean`).
- Symmetric spectra: `TauCeti.FiniteBijection` (`CategoryTheory/FiniteBijection.lean`),
  `TauCeti.SymmetricSequence` with Day convolution, its wedge formula and its closed symmetric
  monoidal structure (`AlgebraicTopology/Spectra/SymmetricSequence.lean`),
  `TauCeti.SymmetricSequence.sphere` and `TauCeti.SymmetricSpectrum`
  (`Spectra/SymmetricSpectrum.lean`), free spectra and `freeEvaluationAdjunction`
  (`Spectra/Free.lean`), levelwise limits and colimits (`Spectra/Limits.lean`,
  `Spectra/Colimits.lean`), mapping spaces (`Spectra/MappingSpace.lean`), the sphere monoids
  `TauCeti.SymmetricSequence.sphereMonoid` and their modules (`Spectra/SphereMonoid.lean`), and
  structure maps (`Spectra/StructureMap.lean`). The point-set smash product and function spectra
  are `CategoryTheory.Mod.monoidalCategory`, `CategoryTheory.Mod.symmetricCategory` and
  `CategoryTheory.Mod.internalHom` on these modules. Tau Ceti has no stable equivalences.
- Fibrations and path spaces: `TauCeti.IsHurewiczFibration` with its Serre comparison, composition
  and base change (`Topology/Homotopy/HurewiczFibration/Basic.lean`), its universe comparison
  (`HurewiczFibration/Universe.lean`), lifting functions and
  `TauCeti.isHurewiczFibration_iff_nonempty_liftingFunction`
  (`Topology/Homotopy/MappingPath/LiftingFunction.lean`), `TauCeti.MappingPathSpace`
  (`MappingPath/Basic.lean`), `TauCeti.MappingPathFiber` with its endpoint, path and loop
  comparisons (`MappingPath/Fiber.lean`), the path fibration (`MappingPath/PathFibration.lean`),
  the fibre inclusion and loop homotopy equivalence (`HurewiczFibration/FiberInclusion.lean`), fibre
  transport (`HurewiczFibration/Transport.lean`),
  `TauCeti.HasHomotopyLiftingProperty.zeroSetSDR_liftingInclusion`
  (`Topology/Homotopy/Lifting/Relative.lean`) and
  `TauCeti.IsHurewiczFibration.exists_lift_of_ndrPair`
  (`HurewiczFibration/RelativeLifting.lean`), and `TauCeti.TopCat.serreFibrations`.
- Quasicategories: `TauCeti.MarkedSSet` (`AlgebraicTopology/SimplicialSet/Marked/Basic.lean`),
  marked edges containing the degenerate edges, with limits and colimits (`Marked/Limits.lean`)
  and the mapping functors `TauCeti.MarkedSSet.mapFlat` and `TauCeti.MarkedSSet.mapSharp`
  (`Marked/MappingSpace.lean`); `SSet.join` (`SimplicialSet/Join/Basic.lean`); `SSet.slice`
  (`SimplicialSet/Slice.lean`); `SSet.Edge.IsCartesian` and `SSet.CartesianFibration`
  (`Quasicategory/Cartesian.lean`); `SSet.Edge.IsEquivalence` and `SSet.core`
  (`Quasicategory/Core.lean`).
- Homotopy: `HomotopyGroup.hurewiczHom` (`AlgebraicTopology/Homotopy/Hurewicz/Basic.lean`), the
  Hurewicz homomorphism `π_(n+1)(X,x) → (R ⟶ H_(n+1)(X;R))`.
- Clifford and Lie data for G4.0 and G5.5: `TauCeti.Complexification`, `TauCeti.realCliffordForm`,
  `TauCeti.realSpinFourEquivQuaternionUnitaryProd`, `TauCeti.Lie.EmbeddedLieSubgroupData` and the
  embedded-unitary Lie subgroup data.

### From TauCetiRoadmap.AlgebraicTopology

- Stages 2–5 and 8: CW cells, skeleta and cellular approximation, homotopy groups and Whitehead's
  theorem, ordinary pair and triple homology and products. Singular chains and ordinary homology
  and cohomology remain there.
- Stage 4.4: the pointed quotient carrier, the compact based smash and reduced suspension
  carriers for compact Hausdorff inputs and pointed Hausdorff CW spaces, and their raw-to-kified
  comparisons.
- Stage 4.5: the compact-generation interface, the coreflection k given by
  `TopologicalSpace.compactlyGenerated`, right adjoint to
  `CompactlyGenerated.compactlyGeneratedToTop`, with its counit, the CW and locally compact product
  comparisons and the interval-product comparison; the single simplicial-realization product
  comparison |K×L| ≃ k(|K|×|L|); `ordinaryPairQuotientComparison` and
  `ordinaryPairQuotientCohomologyComparison`, with the pair-to-mapping-cone comparison.
- Stage 4.7's realization CW structure `simplicialRealizationCW`; Stage 4.8's abstract CW
  approximation and Stage 5.5's ordinary Serre homology and cohomology spectral sequences with
  their multiplicative convergence; Stage 5.0's spectral sequence of a filtered complex.
- Stage 6.0: countable inverse towers, `lim = ker(1−shift)`, `lim¹ = coker(1−shift)`, exactness,
  Mittag–Leffler and cofinal-shift maps. G3 builds the topological telescope and the
  mapping-spectrum comparison, not another algebraic tower carrier.
- Stage 8.2: the Kan property of simplicial groups and the Moore and Kan realization-unit
  comparisons (`simplicialGroupKan`, `simplicialGroupMooreHomotopyIso`,
  `kanRealizationUnitHomotopyIso`).
- Stage 8.8c's functorial abelian Eilenberg–Mac Lane models, `ordinaryEMUniversalClass`,
  `ordinaryEMRepresentability`, `ordinaryEMRelativeRepresentability`, `ordinaryEMLoopComparison`
  and `ordinaryCohomologySuspension` on arbitrary CW spaces; Stage 8.8d's Serre classes, including
  torsion, and Hurewicz modulo a class; Stage 8.10's ordinary representability; Stage 8.11b's
  based suspension–loop adjunction on the native fixed-interval loops.

### From TauCetiRoadmap.TopologicalKTheory

- T1, T5–T7: numerable vector bundles and classifiers, T1.5's smooth real and complex
  Grassmannian graph-chart upgrade and rank-one projective diffeomorphisms, T1.6's stable
  classifiers BO, BSO and their Whitney sums, bundle-level real and complex Bott isomorphisms,
  T7.0's based shear inverse on BO, and T7.1's eight stable Bott equivalences read on ℤ×BO with
  the real coefficient groups.

### From TauCetiRoadmap.CharacteristicClasses

- C1–C3: C1.1b's numerable join carrier and universal bundle, C1.2's weak equivalence
  |Sing X| → X and ordinary compact supports, C1.5's finite torus classifier, C1.5a's classical
  Eilenberg–Mac Lane comparisons (the map f_h whose restriction to complex-oriented CP¹ pairs
  to +1), C2.1's disc and sphere quotients and ordinary Thom classes, C2.4's ordinary embedding
  Gysin map and C2.5's fibrewise graph embedding and tubular comparison, with the chosen
  ordinary class conventions.

### From TauCetiRoadmap.ComplexKahlerGeometry

- K1 and K7.1: the complex orientation of K1 and K7.1's native CP complex and real atlases.
  G4.0b compares its HP¹ ≃ S⁴ adapter with K7's CP¹ ≃ S², and G5.7 uses K7.1's projective stage
  charts.

### From TauCetiRoadmap.ComplexManifolds

- Milestones 1–2: restriction of scalars and the canonical real orientation of a complex
  manifold, as consumed by ComplexKahlerGeometry K1.

### From TauCetiRoadmap.SmoothBundlesConnections

- B1.4: proper free-action smooth quotients and the principal-bundle and submersion comparisons.

### From TauCetiRoadmap.RepresentationTheory

- SpinRepresentations Layer 7: real Clifford algebras and the native Spin(3) data.
- LieGroups Layer 2: closed matrix subgroups and the sphere fibrations of the classical groups.
- CompactGroups Layer 0: normalized Haar measure and averaging.

### From TauCetiRoadmap.SpinGeometry

- G1.3: `cliffordScalarTrace` and its ℂ-linear extension, their normalized regular-module trace
  formulas and algebra-isomorphism transport. G5.5 proves positivity and faithfulness for its
  mixed Cartan adjoint.
- G4.1: the Spin-cover frame and form adapters.

### From TauCetiRoadmap.GeometricTopology

- Layer 1: smooth embeddings and tubular neighbourhoods, finite-dimensional normal bundles, tubes
  and the collapse comparison, and the smoothing-and-triangulation comparison with its relative
  collar extension.

### From TauCetiRoadmap.HilbertModules

- H2, H4–H6: adjointable maps and module compact operators, countable generation and Kasparov
  stabilization, continuous fields, and closed module operators with their regularity and
  functional calculus.

### From TauCetiRoadmap.CStarAlgebras

- C5: the minimal and maximal C*-tensor products and their comparison, direct sums and
  inductive limits, and the path, cone, suspension and mapping-cone constructions.

### From TauCetiRoadmap.OperatorTheory

- SelfAdjointSpectralTheory Parts C–D (SA-D15–D17): closed operators on `LinearPMap`, their
  resolvents and self-adjointness criteria.

## How to read the build

G1 states the axiomatic theories on the pointed CW substrate of AlgebraicTopology, independently
of any spectral model. G2 equips Tau Ceti's symmetric spectra with the stable model structure,
compares them with spaces and sequential spectra, constructs the represented theories, the
Eilenberg–Mac Lane spectra, the multiplicative infinite-loop machine, the general classifying
spaces and the mapping-path replacements, and closes with the quasicategorical and monoidal
foundations of G2.11 that G5.7 and the downstream equivariant roadmaps instantiate. G3 proves
Brown representability and the infinite comparisons, using G1 for the axioms and G2 for the
spectra. G4 proves the generalized Leray–Hirsch and Thom theorems from G1 and G3, with the
quaternionic adapters of G4.0 built first. G5 constructs duality, Thom spectra, the canonical
ring spectra and their orientations, and the rational comparisons, from G2–G4. Each layer ends
with its examples and its dependencies.

## G1. Reduced, relative and multiplicative theories

G1 starts with the pointed topological/CW suppliers. It states and develops
axiomatic theories independently of their G2 spectral representation.

### 1.1 Theory categories (G1.1)

Define integer-graded reduced cohomology theories on
pointed CW spaces and unreduced theories on CW pairs, valued in native
`AddCommGrpCat` or `ModuleCat` when coefficients are specified. Fields are
actual functors, natural connecting maps and equations/exactness properties:
homotopy invariance, cofiber exactness, suspension and arbitrary wedge.
Give the relative triple sequence and its commutative morphism diagrams.
Shape unreduced homology after native `TopPair.HomologyPretheory` and its
Eilenberg–Steenrod axiom interfaces, restricted to CW pairs and extended
by the comparison. Define its homological degree−1 boundary and direct-sum
wedge axiom; the cohomological version follows the corresponding opposite
category with its integer grading. Define maps of theories to preserve the boundary
and suspension identifications, not merely degreewise natural maps.

*Needs:* AlgebraicTopology Stages 2–4 (pointed CW pairs and cofibrations); Mathlib `TopPair.HomologyPretheory`.

**Checks.**

- Ordinary cohomology satisfies the axioms and, on the wedge W of countably many circles, gives `H̃¹(W;ℤ) = ∏_ℕ ℤ`, an uncountable group; a wedge axiom with direct sums would predict the countable `⊕_ℕ ℤ`, so cohomology must send wedges to products.
- No dimension axiom is imposed: complex K-theory satisfies the axioms with `KU⁰(*) = ℤ`, `KU¹(*) = 0` and `KU⁻²(*) = π₂KU = ℤ ≠ 0`.
- A degreewise natural map need not be a map of theories: multiplication by `(−1)ⁿ` on `H̃ⁿ(−;ℤ)` commutes with every pullback, but with `f_n = (−1)ⁿ` one has `f_(n+1)∘σ = (−1)ⁿ⁺¹σ` and `σ∘f_n = (−1)ⁿσ`, so it fails to commute with suspension and is excluded.

### 1.2 Reduced/unreduced comparison (G1.2)

Construct `Eⁿ(X) ≃ Ẽⁿ(X₊)` and
`Eⁿ(X,A) ≃ Ẽⁿ(X/A)` for CW cofibration pairs, taking X/∅=X₊. For arbitrary maps use their
mapping-cone group instead of a subset-relative notation. For a nonempty
pointed X prove the split augmentation sequence
`Eⁿ(X) ≃ Eⁿ(*) ⊕ Ẽⁿ(X)`; prove the analogous homological statement.
Construct inverse functors between the reduced and relative axiomatic
theories and their natural isomorphisms. The reduced theory has a nonunital
internal algebra; the unreduced unit and augmentation are actual compatible
maps, not an informal adjunction of a unit to an unspecified graded group.
Prove the equivalence preserves multiplicative theories, using the actual
homeomorphism X₊∧Y₊≃(X×Y)₊. Prove equivalence between the ring-valued
relative definition with suspension laws and these reduced external-product
axioms, including unit, augmentation, boundary and all comparison diagrams.

*Needs:* 1.1; AlgebraicTopology Stage 4.4's pointed quotient carrier.

**Checks.**

- For X empty, `Eⁿ(∅) = 0` and `X₊` is a point, so `Ẽⁿ(∅₊) = 0`, matching the convention X/∅ = X₊.
- For X a point the split sequence reads `Eⁿ(*) ≅ Eⁿ(*) ⊕ Ẽⁿ(*)` with `Ẽⁿ(*) = 0`.
- For X = S⁰, `Eⁿ(S⁰) = Eⁿ(*)²` and `Ẽⁿ(S⁰) = Eⁿ(*)`, so the splitting is `Eⁿ(*)² ≅ Eⁿ(*) ⊕ Eⁿ(*)`; a comparison without the augmentation splitting would lose a summand.

### 1.3 Cofibers and open covers (G1.3)

Own the reduced mapping cone C_f of an arbitrary pointed map
f:X→Y of compactly generated pointed spaces and its Puppe sequence
X→Y→C_f→ΣX→ΣY→⋯, built on AlgebraicTopology Stage 4.4's pointed quotient
and reduced suspension carriers and Stage 4.5's compact generation. Prove
the comparison with pair/triple exact sequences, and derive
Mayer–Vietoris with the ordered-cover map `(restriction,−restriction)`
from E*(U)⊕E*(V) to E*(U∩V). Its connecting map is the one from
this ordered homotopy-pushout triangle, normalized by the fixed ordinary
pair comparison. For a∈Eᵖ(X), b∈Eᑫ(U∩V), prove
`δ_MV(a|_(U∩V)∪b)=(−1)^p a∪δ_MV(b)` and the corresponding
right action without a sign; prove the ordered-cover swap rule.
Extend a CW theory through singular CW replacement, prove weak-equivalence
invariance there, and establish excision/open-cover MV for that extension.
State the comparison with the original theory on CW-type spaces.

*Needs:* 1.1–1.2; AlgebraicTopology Stages 4.4–4.5 (pointed quotient and suspension carriers, compact generation and the pair-to-mapping-cone comparison).

**Checks.**

- For S¹ covered by two open arcs U, V whose intersection is two arcs, the ordinary MV map `H⁰(U) ⊕ H⁰(V) = ℤ² → H⁰(U∩V) = ℤ²`, `(a, b) ↦ (a − b, a − b)`, has cokernel ℤ, which δ_MV identifies with `H¹(S¹) = ℤ`.
- Swapping the ordered cover (U, V) negates the restriction difference, so δ_MV changes sign, as the swap rule states.
- For the cover (X, ∅) every connecting map vanishes and the sequence reduces to identities.

### 1.4 External and internal products (G1.4)

A multiplicative theory includes natural biadditive maps
`Ẽᵖ(X) × Ẽᑫ(Y) → Ẽ^(p+q)(X∧Y)`, with
associativity, unit, interchange, graded symmetry and suspension laws
as actual axioms: σ(a)×b=σ(a×b) and a×σ(b)=(-1)^p σ(a×b) for |a|=p,
after the displayed sphere/block permutations. Derive the relative products
`Eᵖ(X,A) × Eᑫ(Y,B) → E^(p+q)(X×Y,A×Y∪X×B)` for cofibration pairs
and compatibility with pullback and restriction. Internal cup is pullback
by the reduced diagonal. Define the graded coefficient ring, module actions
and change-of-ring/theory maps on these actual carriers.

*Needs:* 1.1–1.3.

**Checks.**

- For ordinary cohomology the external product of the suspension generators of `H̃¹(S¹;ℤ)` is the generator of `H̃²(S¹∧S¹;ℤ) = H̃²(S²;ℤ)`.
- Graded symmetry: the twist of S¹∧S¹ has degree −1 on S², matching the Koszul sign `(−1)^(1·1)`, and the twist of S²∧S² has degree +1, matching `(−1)^(2·2)`.
- The unit `1 ∈ E⁰(*)` acts as the identity under the internal product on `E*(X)`; a zero or degree-shifted pairing fails this.

### 1.5 Unique smash lift (G1.5)

Prove the cofiber sequence
`X∨Y → X×Y → X∧Y` for well-pointed CW models, together with its
natural split on theory groups and after stable suspension, and its extension by derived
replacement. The product class restricts to zero on the wedge. Prove the
collapse pullback is injective using the Puppe continuation and the split
surjectivity on the preceding groups; consequently the external class is
the unique lift of the pullback-and-cup class. A vanishing wedge restriction
alone gives existence and does not prove uniqueness. Prove the convenient
comparison `(U×V)⁺≃U⁺∧V⁺` for locally compact Hausdorff U,V, and its
compact based-space version obtained by deleting the respective basepoints;
do not identify disjoint basepoint addition with this compactification.

*Needs:* 1.4; AlgebraicTopology Stages 4.4–4.5 (the smash carrier and k-products).

**Checks.**

- For X = Y = S¹ and ordinary cohomology, `H̃²(S¹×S¹) = ℤ`, `H̃²(S¹∨S¹) = 0`, and the collapse S¹×S¹ → S² induces an isomorphism on `H̃²`, so the lift of a×b is unique.
- For U = V = ℝ, `(U×V)⁺ = (ℝ²)⁺ = S² = U⁺∧V⁺`, whereas `(ℝ²)₊` with a disjoint basepoint is not compact.

### 1.6 Boundary module identities (G1.6)

For `a∈Eᵖ(X)` and `b∈Eᑫ(A)` prove
`δ(i* a ∪ b)=(-1)^p a∪δb` in `E^(p+q+1)(X,A)` and
`δ(b∪i* a)=δb∪a`, with the absolute/relative actions displayed. Give the
analogous two-variable relative/external formulas on their correctly typed
triples. Do not state an untyped derivation law whose factors inhabit
incompatible absolute or relative groups.

*Needs:* 1.4.

**Checks.**

- For the pair (D¹, S⁰), degree p = 0 and a = 1, the identity reads `δ(i*1 ∪ b) = δb`, with sign `(−1)⁰ = 1`.

### 1.7 Sphere and circle tests (G1.7)

Suspension identifies
`Ẽⁿ(S^r) ≃ E^(n−r)(*)` for r≥0. Construct the suspension-of-unit class
σ in `E¹(S¹)` and prove
`Eⁿ(S¹) ≃ Eⁿ(*) ⊕ E^(n−1)(*)` as graded coefficient modules and rings,
with the second summand a square-zero ideal. Prove σ²=0 by the nullhomotopy
of the reduced diagonal `S¹→S¹∧S¹`; odd-degree graded commutativity alone
proves only 2σ²=0. Prove the bimodule/Koszul action on the shifted summand.

*Needs:* 1.1–1.6.

**Checks.**

- For E = HF₂, graded commutativity gives only `2σ² = 0`, which is vacuous mod 2; the nullhomotopy of the reduced diagonal S¹ → S¹∧S¹ gives `σ² = 0`.
- For E = KU, `KU⁰(S¹) = KU⁰(*) ⊕ KU⁻¹(*) = ℤ` and `KU¹(S¹) = KU¹(*) ⊕ KU⁰(*) = ℤ`.
- For r = 0, `Ẽⁿ(S⁰) ≅ Eⁿ(*)`, the degenerate case of the sphere identification.

### Examples

- Spheres: `Ẽⁿ(S^r) ≃ E^(n−r)(*)` for r ≥ 0, and the circle ring `E*(S¹) ≃ E*(*) ⊕ E^(*−1)(*)` with square-zero second summand.
- The coefficient grading `Eⁿ(*) = π_(−n)E`, tested with KU: `KU⁻²(*) = π₂KU = ℤ`.
- Mayer–Vietoris for the two-arc cover of S¹ and the relative products for (Dⁿ, Sⁿ⁻¹).

### Dependencies

G1 uses AlgebraicTopology Stages 2–4, 4.4 and 4.5 for the pointed CW substrate, pairs, cofibrations and the pair-to-mapping-cone comparison, and Mathlib's `TopPair.HomologyPretheory` for the shape of homology theories. It uses no spectral model.

## G2. A concrete spectral model and represented theories

### 2.1 Pointed simplicial substrate and the Kan–Quillen model (G2.1)

Consume Tau Ceti's
pointed simplicial sets `TauCeti.PointedSSet`, the undercategory of Δ[0], with their
comparison with simplicial objects in `Pointed`, the degreewise smash product (the quotient
of X×Y by X∨Y) with unit S⁰ and its symmetric monoidal closed structure, the simplicial
tensors and cotensors, the simplicial circle Δ[1]/∂Δ[1] with its boundary collapsed to the
chosen point, and the suspension–loop adjunction. Build their homotopy theory here.
First build the unpointed Kan–Quillen model structure on `SSet` from Mathlib's boundary and
horn generating classes `SSet.modelCategoryQuillen.I` and `SSet.modelCategoryQuillen.J`.
Define a simplicial weak equivalence to mean that its realization induces a bijection on
path components and isomorphisms on all based homotopy groups; prove the equivalent
Kan-group criterion after fibrant replacement. Follow the design of Riou's topcat
model-category project. Supply the lifting, smallness, factorization and model axioms and
the induced pointed model structure on `Under Δ[0]`. On topological spaces use the
weak-homotopy (Serre) model with its explicit compactly generated adapter.
Consume AlgebraicTopology Stage 4.7's `simplicialRealizationCW`, Stage 8.2's
`simplicialGroupKan`, `simplicialGroupMooreHomotopyIso` and `kanRealizationUnitHomotopyIso`,
and CharacteristicClasses C1.2's weak equivalence |Sing X|→X; AlgebraicTopology Stage 4.8
supplies its abstract CW-approximation comparison. Use those unit and counit results to
prove realization ⊣ Sing is a Quillen equivalence (Quillen, *Homotopical Algebra*, Chapter II,
Section 3). Consume AlgebraicTopology Stage 4.5's simplicial-realization product comparison
|K×L| ≃ k(|K|×|L|) with its compact-generation facts; Stages 8.10 and 8.11b use that same
comparison for their realization and loop adapters. Build its pointed smash and quotient
versions |X∧Y| ≃ k(|X|∧|Y|) and the monoidal and cofiber diagrams. This pointed adapter uses
only AlgebraicTopology Stages 4, 4.5 and 8.2; it does not depend on HA, G3 Brown or the
other G2 targets.

*Needs:* Tau Ceti `TauCeti.PointedSSet`; Mathlib `SSet.modelCategoryQuillen`; AlgebraicTopology Stages 4.5, 4.7, 4.8 and 8.2; CharacteristicClasses C1.2.

**Checks.**

- Δ[1] → Δ[0] is a weak equivalence although Δ[1] is not a Kan complex: the horn `Λ²₀ → Δ[1]` sending the vertices 0, 1, 2 to 0, 1, 0 has no filler, since its missing edge would go from 1 to 0.
- ∂Δ[1] → Δ[0] is not a weak equivalence: its realization has two path components.
- ∂Δ[2] → Δ[2] is a cofibration but not a weak equivalence, since |∂Δ[2]| is a circle with π₁ = ℤ; the inner horn Λ²₁ → Δ[2] is a trivial cofibration.
- The realization of `(Δ[1]/∂Δ[1])^∧2` is S², and `S⁰ ∧ X ≅ X` for every pointed X.

### 2.2 Symmetric sphere modules (G2.2)

Consume Tau Ceti's finite-bijection groupoid
`TauCeti.FiniteBijection`, with objects n and hom sets `Fin n ≃ Fin m`, symmetric sequences
`TauCeti.SymmetricSequence` with Day convolution and its induction/wedge formula
`(A⊗B)_n = ∨_(p+q=n) (Σ_n)₊ ∧_(Σ_p×Σ_q) (A_p∧B_q)`, the commutative sphere monoid
`TauCeti.SymmetricSequence.sphere` with `S_n=(S¹)^∧n`, coordinate-permutation actions and
block-concatenation multiplication, and symmetric spectra `TauCeti.SymmetricSpectrum` as
modules over it, so that unit, associativity and the full `Σ_p×Σ_n` equivariance of iterated
structure maps are actual laws. Consume likewise the free spectra and evaluation
adjunctions, levelwise limits and colimits, the smash product over S as the balanced
coequalizer with internal function spectra, and, for each integer k≥1, the sphere monoid
S^(k) with levels (S^k)^∧n and n-block actions and its module category. Prove the G2.3–4
construction, model, positive-flat and commutative transfer theorems for these specified
sphere monoids, including closure and suspension/loop stability (Hovey, Shipley and Smith,
Sections 1–2). Their k=1 instance is the chosen carrier;
G2.5 constructs the actual comparison, not a second retained homotopy
category with unrelated operations.

*Needs:* 2.1; Tau Ceti `TauCeti.SymmetricSpectrum` and its sphere monoids.

**Checks.**

- Level 0 of the sphere spectrum is S⁰, not the one-point space; level n is `(S¹)^∧n` with Σ_n permuting coordinates, and the transposition acts on `|S¹∧S¹| = S²` with degree −1.
- The Day square of the sphere sequence has level 2 equal to a wedge of four copies of S²: one each from (p, q) = (0, 2) and (2, 0), and two from (1, 1), one for each coset of `Σ₁×Σ₁` in Σ₂; the levelwise smash `S₂ ∧ S₂ = S⁴` is not the Day product.
- The free spectrum `F₀S⁰` is the sphere spectrum, and `F₁S¹` has level n a wedge of n copies of Sⁿ (Hovey, Shipley and Smith, Example 3.1.10).

### 2.3 Stable model structure (G2.3)

Construct the level model structures and the
stable projective model structure using the native `ModelCategory` and
small-object/localization machinery. Prove smallness, the generating
factorizations, lifting/retract/two-out-of-three properties, and the stable
existence theorem. Define the weak-equivalence class before stable
localization: use level-projective cofibrant replacements and require the
induced derived level-mapping simplicial sets into every level-fibrant
Ω-spectrum to be weak equivalences. Define Ω-spectra by Kan levels and
weak-equivalence adjoints `E_n→ΩE_(n+1)`. Prove the identification of stable
fibrant objects, functorial replacements and mapping-space computation of
localized morphisms. Prove independence of the replacements.

*Needs:* 2.1–2.2; Mathlib `HomotopicalAlgebra.ModelCategory`.

**Checks.**

- λ : F₁S¹ → F₀S⁰, adjoint to the identity of S¹, is a stable equivalence but not a level equivalence: at level 0 its source is a point and its target is S⁰ (Hovey, Shipley and Smith, Example 3.1.10, p. 23).
- λ is not an isomorphism of naive homotopy groups: naive π₀ of F₁S¹ is an infinite direct sum of copies of ℤ, while π₀ of F₀S⁰ is ℤ; so naive π_* isomorphisms cannot define the stable equivalences.
- Every level equivalence is a stable equivalence, and S → * is not one: mapping into the Ω-spectrum HZ gives ℤ against 0 on π₀.

### 2.4 Stable category and operations (G2.4)

Form the native categorical localization
at stable equivalences, prove locally small morphisms, additive/abelian
hom groups and biproducts. Construct suspension/desuspension, distinguished
cofiber triangles, mapping-spectrum LES, and triangulated coherence.
Prove the pushout-product and monoid axioms needed for the derived smash,
show the sphere is its unit and prove closed symmetric monoidal structure.
Construct CW-spectrum approximation from integer-shifted sphere cells;
compare free-spectrum cells with their stable sphere shifts. Prove spectral
Whitehead, that the sphere is a compact generator, and the finite-subcomplex
filtered-hocolimit decomposition, with all cell/replacement structure maps.
Strict associative spectral rings and their module categories have the
indicated transferred model structures; prove that relative smash and
function modules derive correctly. Construct the positive flat model
and its monoidal/commutative-ring comparisons, prove that its commutative
cofibrant replacements have flat underlying spectra, and prove the point-set
smash of flat spectra computes derived smash. For every explicit Thom/K/HA
multiplication either prove the named raw model flat or use that actual
positive-flat replacement and transport the multiplication/unit; the resulting
product comparison uses this theorem, not an unverified cofibrancy assumption. For the canonical commutative Thom
examples construct the positive stable model and its commutative-ring
transfer and comparisons. State which monoidal/cofibrancy hypotheses each
comparison uses; this does not rectify an arbitrary homotopy ring. Homotopy ring objects and strict
associative models are distinguished in the APIs.
Construct the simplicial tensors, cotensors and mapping spaces for the
stable projective and positive-flat stable models. Prove SM7, including
pushout-products of positive-flat cofibrations with simplicial
monomorphisms and the trivial-cofibration conclusions when either input
is trivial, including spectral stable-trivial cofibrations. Construct the
level/latching and stable-localization comparisons used in that proof.
Use Mathlib `CommMon` over this constructed closed symmetric monoidal
spectral carrier for commutative spectral rings.

*Needs:* 2.3; Mathlib `Pretriangulated` and categorical localization.

**Checks.**

- `[S, S] = π₀S = ℤ`, generated by the identity, and `π_n S = 0` for n < 0.
- The cofiber S/2 of multiplication by 2 on S has `π₀(S/2) = ℤ/2` and `π₋₁(S/2) = 0`, from the long exact sequence.
- Suspension is invertible: `Σ⁻¹ΣS ≅ S`, and `π₁ΣS = ℤ`.

### 2.5 Sphere/space comparisons (G2.5)

Construct `Σ∞` and derived `Ω∞`, prove their
adjunction and compare derived maps from suspension spectra with maps into
Ω-spectrum levels, with enough level shifts to accommodate negative degrees.
For every m≥1 build topological S^(m)-symmetric spectra as native
sphere modules in the convenient based category, with stable/positive-flat
and commutative-ring models. This includes m=2,3,4 used below. Pin an increasing interval homeomorphism
|Δ[1]/∂Δ[1]|≃ℝ⁺ and its smash powers
|(Δ[1]/∂Δ[1])^∧n|≃(ℝ^n)⁺. Prove Σ_n-equivariance and all ordered
block/unit diagrams, retaining the left coordinate and orientations.
For S^(m), use n blocks of m increasing real coordinates and construct
|((Δ[1]/∂Δ[1])^∧m)^∧n|≃(ℝ^(mn))⁺ with those block actions.
For m=2,3,4 label each block (1,i), (1,i,j), (1,i,j,k), respectively.
These are ordered real coordinate positions; MSp^(4)'s geometric
fourth-coordinate map uses −k as specified in G5.4.
Levelwise Sing is lax symmetric monoidal: construct the actual
Sing X∧Sing Y→Sing(X∧Y), and restrict sphere-module scalars along
the adjoint sphere-monoid maps S_sim^(m)→Sing S_top^(m). This
defines SingSp^(m) on spectra and commutative rings for every m≥1. Its left adjoint is monoidal realization
using the pinned sphere homeomorphism. Prove the stable and positive-flat
Quillen equivalences, commutative-ring comparison, stable-equivalence
invariance and semistability/true-π transport under their replacement
hypotheses. These adapters carry every topological Thom/operator/Γ model
into the single retained simplicial category. Prove the homotopy, smash,
cofiber and suspension diagrams with AlgebraicTopology Stage 4.5's compactly
generated spaces. Own here the pointed smash X∧Y=k((X×Y)/(X∨Y)) of compactly
generated pointed spaces with its unit S⁰, extending AlgebraicTopology Stage 4.4's
compact and CW carriers, and use G1.3's mapping cone and Puppe sequence and
Stage 8.11b's suspension–loop adjunction.
Prove general Freudenthal for (k−1)-connected pointed CW spaces, k≥1:
π_iX→π_(i+1)ΣX is an isomorphism for 1≤i≤2k−2 and surjective
at i=2k−1, with the π₁ group branch at k=1 (Hatcher, *Algebraic Topology*,
Corollary 4.24, p. 360). Build the
required CW homotopy-excision theorem: an (m,n)-connected homotopy
pushout square, m,n≥1, is (m+n−1)-cartesian (Hatcher, Theorem 4.23, p. 360).
Applying it to the two cones gives the (2k−1)-connected unit X→ΩΣX. Prove the
iterated and stable ranges, and own the stabilized sphere colimit
colim_k π_(n+k)(S^k) with its Freudenthal stabilization. Construct
the sequential Bousfield–Friedlander/symmetric Quillen comparison and its
derived inverse, including explicit unit/counit equivalences (Hovey, Shipley
and Smith, Theorem 4.3.2). Construct
the monoidal stable comparison for stabilization with S² and S⁴.
Construct the following Φ_s, δ_k^(m) and L_m first in convenient
topological spectra, then their simplicial enriched versions and comparison
diagrams through SingSp^(m). Own the actual imaginary-coordinate-loop
functors here: for s≥2,
(Φ_sE)_n=Map_*(S^n_last,E_n), lowering S^s indexing to S^(s−1).
Permutations act by conjugation on loops and the given block action on E.
Construct structure maps using the real/last-coordinate sphere shuffle
followed by E's structure, and the lax symmetric monoidal unit/product
maps via concatenation of loop coordinates. Its left adjoint P_s has
(P_sF)_n=S^n∧F_n, with the diagonal coordinate action and structure
pairing the added S¹ with the S^(s−1) input before F's structure.
Prove this actual adjunction on sphere modules. Φ_s carries commutative
monoids by its lax symmetric monoidal structure. Prove P_s⊣Φ_s is
a weak monoidal Quillen equivalence on the positive-flat models: the
derived product RΦ_sE∧ᴸRΦ_sF→RΦ_s(E∧ᴸF) and sphere unit are stable
equivalences. Construct and prove the induced Quillen equivalence on
commutative rings, with its derived unit/counit. For complex models pin
S^(ℝ^n)∧S^(iℝ^n)≃S^(ℂ^n); against the interleaved complex orientation
its permutation sign is (−1)^(n(n−1)/2). For quaternionic models remove
k, then j, then i; after uncurrying the looped blocks are ordered i,j,k.
Define L_1=id and L_m=Φ_2⋯Φ_m for m≥2, with
(L_mE)_n=Map_*(S^((m−1)n),E_n), under these exact shuffles.
Thus L_2=Φ_2 and L_4=Φ_2Φ_3Φ_4. L_m's loop sphere has n blocks
of dimension m−1 and the Σ_n block action. The permutation from m coordinate groups of size n to n groups
of size m has sign (−1)^(binom(m,2)binom(n,2)); thus the three i,j,k
loop groups contribute (−1)^(n(n−1)/2), while all four 1,i,j,k groups
contribute+1. Prove these signs in the actual coordinate maps.
For all m,k≥1 define δ_k^(m) from S^(m)-modules to S^(km)-modules:
(δ_k^(m)E)_n=E_(kn), with the iterated S^(km) structure and the
block-permutation Σ_n→Σ_(kn). Construct the natural comparison
χ_(m,k):L_mE→L_(km)δ_k^(m)E. At level n it is
Map(S^((m−1)n),E_n)→Map(S^((km−1)n),E_(kn)), obtained from
the ((k−1)n)-fold E structure. Pin the coordinate recipe: label the
kn original m-blocks (a,b,c), a<n,b<k,c<m; retain (a,0,0) as the
n real suspension coordinates. The new loop inputs are the remaining
labels in lexicographic (a,b,c) order. Evaluate the old map on (a,0,c),
c>0, then insert the b>0 coordinates in the iterated-structure order
(b,a,c), and apply E's level block permutation from that new-block-prefix
order to (a,b,c). Prove the actual labelled shuffle and its determinant
signs, the sphere unit and all permutation/product/structure diagrams.
Prove χ_(m,k) lax symmetric monoidal and a stable equivalence for
m-semistable E (the canonical map from the naïve system
colim_n π_(j+mn)E_n to derived stable π_j is an isomorphism for every j),
including the corresponding semistability-preservation theorem, or through
positive Ω^(m) replacements. Construct its actual
commutative-ring comparison. The m=1 branch is X→L_kδ_kX; the
m=2,k=2 branch supplies MU→L_4δ_2^(2)MU^(2).
Restrictions retain these block actions; a bare subsequence is not the
comparison.
Prove the adjoint/prolongation zigzag, its derived equivalence and true-π
comparison. Prove semistability and raw colimit computations for the
canonical Thom models, or compute through actual positive Ω replacements;
arbitrary symmetric spectra do not acquire a naïve-π comparison by this
notation. Prove the positive/flat commutative-ring comparison and specify
the functor carrying commutative monoids. G5 consumes this single route;
the comparison retains its actual block actions and monoidal maps.
Identify
`π_n S` with the stabilized sphere colimit above for n≥0 using the
Ω replacement or sphere semistability from item 6, and prove vanishing in
negative degrees. No new private stable-stem type is retained.

*Needs:* 2.1–2.4; AlgebraicTopology Stages 4.4, 4.5 and 8.11b.

**Checks.**

- Freudenthal for X = S², k = 2: `π₂S² = ℤ → π₃S³ = ℤ` is an isomorphism (i = 2 = 2k − 2), and `π₃S² = ℤ → π₄S³ = ℤ/2` is onto but not injective (i = 3 = 2k − 1).
- For k = 1 and X = S¹ the isomorphism range is empty and `π₁S¹ = ℤ → π₂S² = ℤ` is surjective.
- The grid sign `(−1)^(binom(m,2)·binom(n,2))` is −1 for m = n = 2, one transposition, and +1 for m = 4, since binom(4,2) = 6.
- The complex sign `(−1)^(n(n−1)/2)` is −1 for n = 2, where (x₁, x₂, y₁, y₂) ↦ (x₁, y₁, x₂, y₂) is one transposition, and −1 for n = 3, with three inversions.

### 2.6 True versus naïve homotopy (G2.6)

Define spectral π_n by stable sphere maps.
For a fibrant Ω-spectrum, prove the eventual level-group computation with
the correct shift and abelian-group range. Include positive Ω-fibrant
spectra, computing in sufficiently large positive levels with the same
shift and abelian-group bounds. Define semistability, prove when
the sequential colimit `colim_k π_(n+k)(E_k)` computes true π_n and require
a nonsemistable counterexample F₁S¹. Ordinary sequential spectra
have their own proved stable-colimit comparison; do not transfer that
statement to arbitrary symmetric spectra by forgetting permutation actions.

*Needs:* 2.3–2.5.

**Checks.**

- F₁S¹ is not semistable: its naive π₀ is an infinite direct sum of copies of ℤ while its true π₀ is ℤ (Hovey, Shipley and Smith, Definition 5.6.1, p. 61, and Example 3.1.10).
- The sphere spectrum is semistable: `colim_k π_k(S^k) = ℤ = π₀S`.
- Every Ω-spectrum is semistable, and for HZ the eventual level groups `π_(n+k)|Z̃[Sᵏ]|` are ℤ for n = 0 and 0 otherwise.

### 2.7 Represented theories and ordinary adapters (G2.7)

First complete G2.10
(raw part after G2.1, fibration-LES application after AT5.5), then
AT8.8c's fixed abelian models, before this item.
Prove that the displayed
formulas in the conventions satisfy every G1 axiom and product/sign law.
Their spectral maps induce natural maps of theories. Assemble the ordinary
coefficient comparison into a concrete HA for any abelian A: its n-th pointed simplicial level is
the reduced free A-module Ã[Sⁿ] on Sⁿ=(S¹)^∧n, with coordinate actions.
Define structure maps by x∧Σ a_i y_i↦Σ a_i(x∧y_i); for a commutative ring A
define multiplication by the bilinear smash of generators. Prove the full
symmetric-module/ring laws. Compare these levels with AT8.8c's single
K(A,n) models via Dold–Kan and AT's loop/ordinary representability adapters,
prove stable π is A concentrated in degree zero, and compare HA theories
with AT's reduced/absolute/relative singular theories, including Stage 4.5's
required quotient comparison and the normalized pair boundary. Prove
every adjoint Ã[Sⁿ]→ΩÃ[S^(n+1)] is a weak equivalence: use the
reduced-free-module cofiber short exact sequence, the simplicial-abelian
Kan-fibration theorem and contraction of Ã[CSⁿ]. For a commutative
ring A give the unit x↦1·x on each sphere level, identify product/unit with AT's ordinary products. Construct ordinary
stable Hurewicz `E→HZ∧ᴸE` from the sphere unit, and the homology/cohomology
pairings and coefficient-change maps needed for G5. For an A-module M
construct HM by the same reduced-free-M construction and the actual
HA-module action, with all structure/unit diagrams. Compare module
ordinary theories and coefficient changes. The left structure map versus
AT's last-coordinate `ordinaryEMLoopComparison` uses the cyclic block
permutation with sign(−1)^n on π_n; retain the fixed reference class.

*Needs:* 2.3–2.5 and 2.10; AlgebraicTopology Stages 4.5, 5.5, 8.8c and 8.11b.

**Checks.**

- `π_n HA = A` for n = 0 and 0 otherwise; for A = ℤ, level 1 realizes to K(ℤ,1) ≃ S¹ and level 2 to K(ℤ,2) ≃ CP∞.
- `HA⁰(*) = A` and `HAⁿ(*) = 0` for n ≠ 0: the dimension axiom, which KU fails.
- The cyclic permutation of n + 1 coordinates has sign `(−1)ⁿ`: a transposition for n = 1 and an even 3-cycle for n = 2, as in the comparison with the last-coordinate loop structure.

### 2.8 Multiplicative infinite-loop construction (G2.8)

Define Γ-objects using
the skeleton of finite based sets and based maps, fixing Γ^op to be
that category. Use native functors; a Γ-space is a based functor from
this category to convenient based spaces. Transport its associated
spectra to pointed SSet by G2.5's single SingSp comparison. Construct its prolongation to based simplicial sets,
assembly maps and associated symmetric spectrum, with actual permutation
actions. Special means its n-to-1 Segal maps are weak equivalences;
very special adds a group-valued π₀. Prove group completion, the Ω-spectrum
theorem and natural/model-invariant comparison with G2's connective
symmetric spectra. Develop the topologically enriched nerve/realization
and permutative-category input: coherent ⊕, zero and symmetry induce the
Segal maps, with the actual group-completion universal property. For
bipermutative inputs with ⊗, unit and both distributivity coherences,
construct the multiplicative machine and its unital E∞ multiplication.
Construct its Barratt–Eccles operad from the nerves of permutation
translation categories, with free actions, contractible terms and actual
block-substitution/unit equations. Build the corresponding algebra/free-
algebra APIs and operadic model transfer and change-of-operad comparison,
using G2's pushout-product/monoid/cofibrancy hypotheses. Compare/rectify it to a commutative symmetric ring using the positive
model hypotheses. Supply strictification/rectification constructions
and comparisons; no multiplicative coherence is inferred from group laws.
Construct the natural comparison of the derived free commutative algebra
on a positive-flat cofibrant spectrum V with the wedge of extended powers
`(V∧ᴸ⋯∧ᴸV)_(hΣ_m)`, including m=0, unit, operadic multiplication and
replacement maps. Construct relative free-cell pushout filtrations over
flat commutative bases and their underlying derived-colimit comparisons,
including transfinite compositions. Compare the operadic and positive
commutative free cells under this same construction.
Construct commutative spectral localization at a homogeneous even-degree
class, its unit and universal property among rings in which that class
is invertible, in the homotopy category of commutative spectral rings.
Construct central point-set representatives and the semistability/replacement
comparisons used by the telescope. Identify its underlying module with the shifted multiplication
telescope, and prove coefficient, module and multiplicative comparisons.
This lane uses G2.1–4 and precedes G5's periodic K-ring construction.

*Needs:* 2.1–2.4.

**Checks.**

- For a commutative monoid M the Γ-space n₊ ↦ Mⁿ is special, and very special exactly when M is a group: ℕ is special but not very special, and its group completion has π₀ = ℤ.
- For a discrete abelian group A the associated spectrum is HA, with π₀ = A and no other homotopy.
- For the zero monoid the associated spectrum is contractible, the degenerate case of the machine.

### 2.9 General topological-group classifiers (G2.9)

Extend the same CC C1.1b
numerable join carrier and universal-bundle construction to arbitrary
topological groups, retaining its actual local sections and numerable
pullback classification; do not replace it by the discrete-group carrier.
For well-pointed groups construct the topologically enriched bar model,
prove its universal-bundle/classifier comparison with the join and its
product-preserving realization comparison in the convenient category.
Include continuous group homomorphisms, products, subgroup-associated
bundles, chosen trivializations and clutching on spheres. Distinguish
actual trivializations (maps) from their homotopy classes. After choosing
one reference trivialization, identify the set of actual trivializations
with the continuous gauge maps C(X,G), and its homotopy quotient with
[X,G]; prove the change-of-reference action. This provides
the general-G source examples and G5's strictly functorial Spin models;
CC retains its ordinary classes and compact-Lie computations.
Prove sphere clutching with its actual hypotheses. For n≥1, a chosen
fibre frame over the basepoint of S^(n+1) gives π_n(G,e); forgetting
that frame quotients by the π₀G conjugation action. For S¹ use conjugacy
classes in π₀G. For path-connected G identify this with unbased [S^n,G];
for disconnected G distinguish its component choices and π₁ action
from the bundle-clutching quotient. Prove all normalization, gauge,
homotopy and based/unbased comparison maps.
For G=GL_k(ℝ), use polar/Gram–Schmidt deformation to O(k), retaining
determinant components, and prove this complete low-rank table for the
identity basepoint (π₀ is a group here):

| k | π₀ | π₁ | π₂ | π₃ |
| --- | --- | --- | --- | --- |
| 0 | 0 | 0 | 0 | 0 |
| 1 | ℤ/2 | 0 | 0 | 0 |
| 2 | ℤ/2 | ℤ | 0 | 0 |
| 3 | ℤ/2 | ℤ/2 | 0 | ℤ |
| 4 | ℤ/2 | ℤ/2 | 0 | ℤ⊕ℤ |
| k≥5 | ℤ/2 | ℤ/2 | 0 | ℤ |

Prove it from the Stiefel group fibrations, the sphere groups and
G4.0's calibrated native Spin(3)/Spin(4) quaternionic homeomorphisms
and vector-action equations, together with the LieGroups sphere fibrations. Pin Spin(4)'s generators by (q_L,q_R):v↦q_L v q_R^−1.
A determinant-negative component acts on π₁ at k=2 by negation,
on π₃ at k=4 by swapping these factors, and trivially on the other
displayed nonzero higher groups. For n≥1 and k≥1 identify unbased
[S^n,GL_k(ℝ)] with ℤ/2×π_nSO(k) AS SETS. For pointwise multiplication
construct its group isomorphism with π_nSO(k)⋊_αℤ/2 instead: split the
determinant components by the constant reflection
r_k=diag(−1,1,…,1), and let α be conjugation by r_k on the based
homotopy group. In the convention (a,ε) represented by h·r_k^ε,
prove (a,ε)(b,η)=(a+α^ε(b),ε+η), including identification of
pointwise multiplication in the based kernel with the π_n group law.
Use the displayed conjugation actions to compute the infinite dihedral
group for [S¹,GL_2(ℝ)] and the factor-swap semidirect product
(ℤ⊕ℤ)⋊ℤ/2 for [S³,GL_4(ℝ)]; the other displayed higher-group cases
have trivial action. Compare choices of reflection and basepoint by
their actual homotopies/conjugation maps. For S⁰, pointwise multiplication
gives (π₀GL_k(ℝ))², hence four classes for k≥1, whereas unframed
clutching over S¹ gives only the two conjugacy classes in π₀GL_k(ℝ).
Retain the trivial k=0 case. Prove the stabilization maps: on π₁,
SO(2)→SO(3) is reduction modulo2; on π₃, SO(3)→SO(4) is the
diagonal ℤ→ℤ⊕ℤ and SO(4)→SO(5) is addition, with these Spin
generators. Subsequent displayed stable maps are isomorphisms. Derive the unframed sphere-bundle
sets by those orbit actions; unbased maps into GL_k have two target
components for connected spheres when k≥1 and are not that orbit set.
Include S⁰ separately (two component choices) and the trivial k=0
branch. The general classifier/bar construction precedes the table;
its low-rank computations consume G4.0's Sp/Spin/sphere comparisons.

*Needs:* CharacteristicClasses C1.1b; TopologicalKTheory T1.5–T1.6; G4.0a; RepresentationTheory LieGroups Layer 2.

**Checks.**

- k = 1: ℝˣ has two contractible components, so π₀ = ℤ/2 and π₁ = 0; k = 2: SO(2) = S¹ gives π₁ = ℤ and π₃ = 0.
- k = 3: SO(3) ≅ RP³ gives π₁ = ℤ/2 and π₃ = ℤ; k = 4: SO(4) ≅ (S³×S³)/±1 gives π₃ = ℤ⊕ℤ, and the reflection r₄ conjugates v ↦ q_L v q_R⁻¹ to v ↦ q_R v q_L⁻¹, swapping the factors.
- On π₃, SO(3) → SO(4) is the diagonal and SO(4) → SO(5) is addition, so the composite is multiplication by 2; `[S¹, GL₂(ℝ)] ≅ ℤ ⋊ ℤ/2`, the infinite dihedral group.

### 2.10 Mapping-path replacements and homotopy fibres (G2.10)

Consume Tau Ceti's raw path
theory: `TauCeti.IsHurewiczFibration` with its continuity and homotopy lifting property for
test spaces of a chosen universe, its universe comparison, Serre comparison
`TauCeti.IsHurewiczFibration.mem_serreFibrations` into `TauCeti.TopCat.serreFibrations`,
composition, base change and the product projections; lifting functions with
`TauCeti.isHurewiczFibration_iff_nonempty_liftingFunction`; `TauCeti.MappingPathSpace` with
the constant-path inclusion, projection, endpoint and shrinking homotopy;
`TauCeti.MappingPathFiber` with its endpoint homeomorphism, the fibre comparisons with
native `Path` and `LoopSpace`, and the homotopy equivalence with the loop space along a
reference path; the endpoint and path fibrations; the fibre-inclusion loop homotopy
equivalence of a Hurewicz fibration; fibre transport along a supplied path; and the relative
lifting theorems `TauCeti.HasHomotopyLiftingProperty.zeroSetSDR_liftingInclusion` and
`TauCeti.IsHurewiczFibration.exists_lift_of_ndrPair`. Build here only what these lack.
Retain the raw carrier and topology when passing to G2.1's compactly generated category:
build its k-ification and the projection, endpoint, fibre, pullback and exponential-law
comparisons. Raw compact-open evaluation and currying use the locally compact interval;
arbitrary-domain mapping-space adjunctions use the compactly generated category's k-products
and function objects. Include empty fibres, arbitrary chosen k, based maps and reference
paths when supplied, map homotopies, pullback, naturality and homotopy-choice comparisons.
Compare these explicit replacements with the derived homotopy fibre in the designated
topological model, using the native Serre predicate through the Hurewicz-to-Serre
comparison. Then apply AlgebraicTopology Stage 5.5's fibration homotopy exact sequence to
these replacements; only this LES application consumes Stage 5.5's sequence. The LES
comparison follows Stage 5.5 and precedes G2.7's HA/ordinary comparison.

**Numerable bundles.** Consume native `Bundle.Trivialization` and `FiberBundleCore` for
general topological bundles. Given a supplied continuous topological-group action and a
continuous overlap G-valued cocycle, construct joint coordinate changes and their inverses
without imposing compact-open Homeo(F) group hypotheses for arbitrary F. Prove
`numerableFiberBundle_hurewicz`: a map p:Z→B that is trivial with fibre F over the base sets
of a family of local trivializations admitting a subordinate partition of unity is a
Hurewicz fibration for test spaces in every universe. The sets where the partition functions
are positive form a numerable open cover; over each of them p is a product projection, and a
map that is a fibration over every member of a numerable open cover is a fibration (May,
*A Concise Course in Algebraic Topology*, Chapter 7, Section 4, Theorem, p. 51); construct
the continuous universal path-lifting function by that local-to-global patching, with
refinement, zero-duration continuity and all parameter and universe comparisons.
Paracompact Hausdorff bases supply such partitions of unity. This is a construction target,
not a theorem inferred from local triviality alone. Arbitrary-base bundles have the separate
native Serre theorem. Empty F needs no choice of a point; projection surjectivity still
requires Nonempty F. These statements give no global homotopy equivalence from a single
contractible fibre.

*Needs:* 2.1; Tau Ceti's Hurewicz fibrations and mapping-path spaces; Mathlib `Bundle.Trivialization` and `PartitionOfUnity`; AlgebraicTopology Stage 5.5.

**Checks.**

- A product projection B×F → B satisfies the hypothesis of `numerableFiberBundle_hurewicz` with one trivialization and the constant partition of unity 1.
- The Möbius band over the circle is trivial over two open arcs carrying a two-function partition of unity, so its projection is a Hurewicz fibration.
- The inclusion {0, 1} → [0, 1] is not locally trivial and is not a Hurewicz fibration: the path from 0 to 1 has no lift starting at 0.

### 2.11 Enriched, quasicategorical and monoidal foundations (G2.11)

These
simplicial-set, quasicategorical and operadic foundations are
construction targets of this item, stated below the spectra they
enhance and before any equivariant or chromatic application. Work in
explicit nested universes and prove change-of-universe comparisons
for the small and accessible models. BordismFormalGroups F6.5 and
EllipticCohomology consume these targets in their stated shapes; G5.7
instantiates them on its specified G2 models.

**Categorical model and functor spaces.** Reuse native
`EnrichedCat SSet`, `EnrichedFunctor`, `ForgetEnrichment`,
`CategoryTheory.SimplicialCategory`, `SimplicialThickening`,
`SimplicialNerve`, `SSet.Quasicategory`, inner fibrations,
inner-anodyne maps and internal hom. Extend native horn-filling
and nerve/quasicategory APIs to the required universes, preserving
their predicates and constructors. Construct the ordinary category
of the native enriched bundles with strict enriched functors;
native `ForgetEnrichment.enrichedOrdinaryCategory` supplies their
compatible ordinary enrichment for the nerve. Prove its comparison
with that ordinary-enriched presentation; the native bicategory
alone is not the category carrying the model structure. Construct
the rigidification/coherent-nerve adjunction and prove the locally-Kan
coherent nerve is a quasicategory.

Construct the Bergner model on this category: weak equivalences
are weak equivalences on mapping simplicial sets and essentially
surjective on π₀-categories. Use free composition on enriched graphs
to prove local presentability. Generate cofibrations by adjoining
objects and free mapping-simplex boundary cells; define fibrations
by lifting against generated trivial cofibrations and construct
functorial factorizations by model recognition. Prove left properness
by the enriched word filtration of pushouts of free cells and
filtered unions. Establish the following invertibility property
before characterizing these fibrations locally.
For the fixed Cartesian Kan–Quillen base prove the properties
of HTTA.3.2's excellent-base criterion: combinatoriality, product
stability of monomorphism cofibrations, filtered-colimit stability
of weak equivalences and the monoidal model axiom. Prove also
the Dwyer–Kan invertibility property: if i:[1]→C is a
free-enriched-cell cofibration classifying an edge invertible in
Ho(C), then C→C∐_[1]J is a Dwyer–Kan equivalence, with
J the walking isomorphism. Also construct the homotopy-invariant
version using a cofibrant interval replacement for [1]→J.
Construct the cofibrant interval/homotopy-inverse resolution and
its mapping-space comparison by the enriched word/bar filtration.
These fixed-base proofs precede their use in enriched model
recognition and internal-hom theorems; no arbitrary excellent
enrichment base is assumed. Now prove the local-fibration
characterization: mapping-space Kan fibrations with lifting of
homotopy equivalences of objects, and locally Kan fibrant objects.
Include Bergner's characterization for the fixed Kan base without
assuming the target is fibrant, by the enriched interval lifting
argument and free-cell tests.

**Enriched diagram foundations before straightening.** For every
combinatorial simplicial model category M and small simplicial
category C, construct its enriched projective and injective diagram
models, with free/evaluation and enriched Kan-extension adjunctions,
generating factorizations, simplicial mapping ends and replacements.
For ordinary indices reuse native
`Enriched.FunctorCategory.enrichedHom`, `enrichedHomπ` and
`homEquiv`, with their native end construction. Extend it to
simplicial enriched indices and prove agreement on the ordinary
specialization. Use the preceding fixed Kan-base properties in HTTA.3.3. Construct
projective generators by free/evaluation adjunctions. For injective
structures prove the objectwise cofibrations have a small weakly
saturated generating set by the accessible enriched-functor-category
argument, then apply model recognition to objectwise weak equivalences.
Prove the pointwise tensor/cotensor mapping axiom for both models.
Construct simplicially enriched functorial factorizations for M
and these diagram models by the enriched small-object argument.
At a generating cofibration i, parameterize all lifting squares
by their simplicial mapping pullback and attach i tensored with
that square complex. The simplicial model axiom makes these
attachments cofibrations, and trivial cofibrations for a trivial
generator. Choose a regular cardinal for all generator sources
and targets tensored with Δ[n]; transfinite composition then has the required
vertex lifting property. Prove that both factorizations and their
natural maps are enriched functors, including the induced enriched
cofibrant/fibrant replacements. This supplies the enriched diagonal
factorizations for path objects, not only ordinary functorial choices.
The projective structure supplies the internal-hom and rectification
comparisons; injective existence is asserted here only for this
Kan enrichment and these verified hypotheses. Prove invariance
under a Dwyer–Kan equivalence of indexing categories
by the free-cell filtration and enriched bar resolution, using
cofibrant replacements of the indices where required. Construct
small full model chunks closed under these enriched replacements
and finite product/coproduct-map factorization operations for the
relevant small diagram categories;
prove existence by accessible closure and prove independence and
filtered enlargement comparisons. This controls the size of the
simplicial categories of fibrant-cofibrant objects. Construct
the enriched Yoneda embedding into the projective Kan-presheaf
model on C^op, with its enriched evaluation identity. After locally
Kan replacement, representables are fibrant-cofibrant by the
free/evaluation adjunction. Enlarge their image to a small chunk
with the same essential image in the model homotopy category.
This embeds any small enriched category, up to Dwyer–Kan
equivalence, in such a bifibrant chunk, as required by the
internal-hom and localization tests. This is enriched Yoneda;
the later space-valued infinity-categorical Yoneda comparison
is derived from it after coherent rectification.

Prove the Joyal-free internal-hom comparison of HTTA.3.4 in
the Bergner homotopy category. Construct the actual enriched
evaluation map from (U^C)^cf×C to U^cf and prove the natural
bijections
`Hom_Ho(sCat)(D,(U^C)^cf)≃Hom_Ho(sCat)(D×C,U^cf)`
on every small compatible chunk. Projective replacement and
path objects built from the enriched diagonal factorizations
identify both sides with weak-equivalence classes
of (D×C)-diagrams; enriched Yoneda and chunk enlargement give
the full-faithful essential-image comparison for arbitrary targets.
This stage is a Hom_Ho-set/weak-exponential theorem. Its mapping-
Kan-space upgrade is constructed after the product/homotopy-colimit
theorem and frames below; it is not used to prove that earlier theorem.

Construct the enriched localization C[W⁻¹] by pushing out a
coproduct of [1]→E, with [1]→E→J the preceding cofibrant
interval factorization. Prove replacement invariance by left
properness and the Hom_Ho universal property: the map
`Hom_Ho(sCat)(C[W⁻¹],D)→Hom_Ho(sCat)(C,D)` is injective,
with image exactly the classes sending W to equivalences.
Prove injectivity using the doubled-interval localization cylinder.
The derived mapping-space version is proved after the frames below.
Construct ordinary projective/injective diagram models on the
combinatorial Bergner category by accessible model recognition,
with functorial replacements and their model homotopy limits and
colimits, before the following Grothendieck and product comparisons.
For a small poset A and diagram a↦C_a, construct its enriched
Grothendieck category: objects (a,x) and mapping simplicial set
C_b(p_ab x,y) when a≤b, empty otherwise, with composition induced
by p. Compare its forgotten ordinary category, functorially in
the diagram, with native `CategoryTheory.Grothendieck` on the
underlying Cat-valued diagram, including object/base/fiber,
transport and restriction maps. Invert the arrows
(a,x)→(b,p_ab x). Prove this localized
total category models hocolim_A C_a (HTTA.3.5): build an A-filtered
free-cell cofibrant replacement, and compare each initial-segment
localization with its terminal C_a by the categorical mapping
cylinder. Prove that localization commutes with product by a fixed
enriched D when W is extended as (w,id_d), using the internal-hom
comparison and the Hom_Ho localization property: test maps
into arbitrary targets using enriched Yoneda/chunk embedding and
the full-faithful essential-image criterion. All tests here are
Hom_Ho sets. Deduce product by D
preserves these poset-indexed homotopy colimits. This is a derived
comparison, not a monoidal model assertion about the Bergner product.

Use native `HomotopicalAlgebra.ReedyStructure` and its
`HomotopicalAlgebra.ReedyStructure.op` construction for opposite structures.
Construct the simplex Reedy structure from native simplex epi/mono
factorization, following the design of
[`SimplexCategory.reedyStructure`](https://github.com/leanprover-community/mathlib4/blob/1e75e9dd53d483fa01eff9ac7d4ea0472ce9d1fa/Mathlib/AlgebraicTopology/Reedy/SimplexCategory.lean).
Construct their Reedy model structures, latching/matching objects
and functorial frames on the Bergner model and its ordinary
projective diagram models, with objectwise latching/matching
comparisons. The resulting derived
mapping Kan spaces take model homotopy colimits in the source
to homotopy limits, and model homotopy limits in the target to
homotopy limits. Prove this by Reedy
replacement and the end/bar mapping formula, including the action
of Kan spaces through frames. No simplicial enrichment of the
Bergner model is presumed. The Reedy lifting property makes
a cofibrant cosimplicial frame's tensor and mapping functor a
Quillen adjunction from Kan–Quillen simplicial sets to this model.
Use the prior product/homotopy-colimit theorem to prove
`(W⊗^L K)×^L Y≃(W×^L Y)⊗^L K` by skeletal induction
on K: coproducts, boundary-cell homotopy pushouts and sequential
skeletal unions are poset-indexed. This needs no arbitrary-index
reduction and does not use the homotopy-limit theorem being proved.
Now upgrade the weak-exponential Hom_Ho bijection to derived
mapping Kan spaces. For a cosimplicial frame D^• define the raw
mapping simplicial set H(D^•,V)_n=Hom(D^n,V). It is Kan for
fibrant V and sends trivial fibrations in V to trivial Kan
fibrations without a fibrancy assumption on their targets.
For X,Z fibrant and an evaluation span Z×Y←P→X with
P→Z×Y a trivial fibration, impose no fibrancy assumption on Y.
Choose a frame C^• and a compatible Reedy-cofibrant frame
W^•→C^•×Y for C×^L Y. Form the actual pullback
`H(C^•,Z)×_(H(W^•,Z×Y))H(W^•,P)`.
Its projection to H(C^•,Z) is a trivial Kan fibration; evaluation
gives its map to H(W^•,X). Thus both ends and the pullback are
Kan, even though the two raw complexes involving Z×Y and P
need not be. This represents the actual natural derived evaluation
map from Map(C,Z) to Map(C×^L Y,X). Test it against every
Kan K, using the preceding tensor/product comparison and the
Hom_Ho exponential bijection, to prove it is an equivalence.
Use functorial compatible frame replacements on parameter diagrams
for these actual mapping transformations. Prove likewise the
derived mapping-space localization property: the map from
Map(C[W⁻¹],D) identifies it with the components of Map(C,D)
carrying W to equivalences, by the Hom_Ho property tested on
Kan parameters and the prior product/localization comparison.
Thus the space-level versions are retained after their prerequisites.

Prove M^cf→M_f[W⁻¹] is a Dwyer–Kan equivalence using
the earlier enriched cofibrant replacement on fibrant objects,
its enriched natural comparison to the identity and the interval
product/localization homotopies. The same proof applies on the
compatible chunks and their projective diagram models, before
using these comparisons in the following evaluation spans.

Prove the enriched diagram homotopy-limit theorem of HTTA.3.6.
Let A=A₀∪{∞} be a small poset with largest element ∞ and
let a↦C_a be a cofibrantly replaced diagram whose value C_∞
presents hocolim_(A₀)C_a. Choose a common small chunk U of M
such that U^(C_a) is a chunk of the projective model M^(C_a)
for every a∈A, using the earlier simultaneous enriched closure.
Set F_a=(U^(C_a))_f, with objectwise
weak equivalences W_a, and Z_a=F_a[W_a⁻¹]. Restriction makes
Z a strict A^op-diagram. Set X=U_f[W⁻¹] and Y_a=C_a.
Construct the strict two-variable evaluation spans before deriving
any mapping comparison: for b≤a define
`P(a,b)=(F_a×C_b)[{(w,id_c):w∈W_a}⁻¹]`.
Their maps into Z_a×Y_b come from product/localization, and
their maps into X evaluate after C_b→C_a; evaluation inverts
the indicated arrows. These maps are functorial on
B={(a,b):b≤a}⊂A^op×A. The product comparison makes the
left map a weak equivalence. On the diagonal the actual evaluation
identifies Z_a as a weak exponential of X by Y_a, using the
earlier chunk/internal-hom and replacement/localization comparisons.

Replace X and the A^op-diagram Z objectwise fibrantly, retaining
their evaluation spans. Simultaneously factor the strict B-map
P→(Z×Y)×X as a trivial cofibration followed by a projective
fibration in the ordinary B-diagram model. Write its middle
diagram again as P. Then P(a,b)→Z_a×Y_b is a pointwise
trivial fibration: it is a fibration by fibrancy of X and a weak
equivalence by two-out-of-three. Its map to X is still an actual
natural evaluation. No Y_a fibrancy is required.

For each cofibrant test object D choose a frame D^• and a
projective-Reedy cofibrant replacement, natural in c,
`W_c^•→D^•×Y_c`. These are frames for D×^L Y_c.
Use three independent indices
`T={(a,b,c):c≤b≤a}⊂A^op×A×A^op`.
Its arrows to (a₁,b₁,c₁) satisfy a₁≤a, b≤b₁ and c₁≤c.
Construct the actual T-diagram
`E(a,b,c)=H(D^•,Z_a)×_(H(W_c^•,Z_a×Y_b))H(W_c^•,P(a,b))`.
The map into the base uses W_c^•→D^•×Y_c→D^•×Y_b.
Its projection α to G(a)=H(D^•,Z_a) is pointwise a trivial
Kan fibration, so E is Kan. Evaluation gives a natural map β
to G′(c)=H(W_c^•,X). Raw H complexes in the pullback need
not be Kan; G, G′ and E are. All variances are now covariant
on T; no diagonal of the two-variable P is called a diagram.

Prove both comparisons by derived right Kan extension in the
ordinary Kan-space diagram models, using injective replacements,
along π_a:T→A^op. At a₀ its comma index is T_(a≤a₀).
The inclusion of Q={a=a₀} has right adjoint
r(a,b,c)=(a₀,b,c), hence is homotopy initial for these limits.
Q is contractible by (b,c)→(a₀,c)←(a₀,a₀).
The projection q:Q→(A_(≤a₀))^op, q(b,c)=c, has right
adjoint c↦(a₀,c), hence is homotopy initial; its target has
initial object a₀. Prove these homotopy-initiality statements by
the adjunction comma contractions and the model right-Kan formula.
The unit G→Ran_(π_a)π_a^*G and α give
Ran_(π_a)E≃G. The cone G′(a)→G′(c) for c≤a gives
the natural comparison G′→Ran_(π_a)π_c^*G′, also an equivalence.
Evaluation of the first limit at (a₀,a₀,a₀) is an equivalence
by α and contractibility of Q; evaluation of the second is an
equivalence by q and its initial object. At that diagonal β
is the framed weak-exponential equivalence already proved. The
evaluation square therefore makes Ran_(π_a)β an equivalence.
The adjunction units, that cone and the restriction maps give
naturality in a₀, yielding a natural zigzag of objectwise weak
equivalences between G and G′ in the ordinary diagram model,
rather than just separately equivalent values. Now apply the model
mapping-space/hocolimit formula to D×^L hocolim Y_a and the
prior product/hocolimit comparison. Mapping out of every D proves
that Z_∞ presents the homotopy limit of Z|_(A₀)^op.
Then pass through sufficiently filtered enlargements of chunks,
proving closure of model homotopy-limit diagrams at the chosen
cardinal by accessibility. Prove the enriched mapping-space
recognition criterion
for a model homotopy limit when an essentially-surjective comparison
from a known homotopy-limit model is supplied. These are the
localization, homotopy-limit and index-invariance inputs to the
straightening proofs; none uses Joyal, marked models, Cat∞ colimits
or the later coherent-diagram rectification.

Define a simplicial-set map to be a categorical equivalence
exactly when its rigidification is a Dwyer–Kan equivalence.

**Unmarked straightening and the categorical model.** Build
unmarked left/right fibration models over a simplicial set.
Use monomorphism cofibrations and weak equivalences defined by
Dwyer–Kan equivalences of the rigidified left-cone pushouts over
the base in the covariant case, and right-cone pushouts dually.
Prove these models left proper and combinatorial by Bergner model
recognition. Prove SM7 with tensor X×K: monomorphisms give the
cofibration pushout-product axiom, and the appropriate endpoint
section X→X×Δ[n] is left/right anodyne, so X×Δ[n]→X
is a weak equivalence. Use left properness and the simplicial
cell filtration for the trivial pushout-product cases (HTT 2.1.4).
With Kan-valued projective diagrams construct St⊣Un and prove
it a Quillen adjunction before testing Quillen equivalence:
the free cone-cell construction sends monomorphisms to projective
cofibrations, and its mapping-hom description sends rigidified-cone
equivalences to projective weak equivalences (HTT 2.2.1.2, first clause).
Construct unmarked unstraightening's actual simplicial enrichment.
Set J^n=(Δ[n]⋆{y})∐_(Δ[n]){x} and
Q^n=C[J^n](x,y). Construct Q^•→Δ^• using the largest-element
map on the nerve of nonempty subsets, with its quotient comparison.
Its precomposition K→Sing_Q K preserves products and units.
Prove the external-product formula
`Un(F⊠K)≅Un(F)×Sing_Q K` from the simplex definition.
Thus K×Un(F)→Un(F⊠K) is an actual tensor strength.
A K-parametrized F⊠K→G induces Un(F)×K→Un(G);
prove these maps preserve identities and composition by the
product/unit laws, giving actual maps of enriched hom objects.
This is the construction of HTT 2.2's simfun, not a claim that
straightening is strictly simplicial. The source slice model has
every object cofibrant; no such condition is imposed on the
projective diagram target.
Prove the enriched Quillen-equivalence criterion for Kan–Quillen
simplicial model categories C,D and a Quillen adjunction F⊣G,
with an explicitly enriched right functor G and every object of
C cofibrant. Construct the mate
`β_(K,V):F(K⊗V)→K⊗F(V)` of
`K⊗V→K⊗GF(V)→G(K⊗F(V))`, using the unit and
G's enriched tensor strength. On cofibrant V both K-functors
are left Quillen; β is the identity at Δ[0], so coproduct,
homotopy-pushout and skeletal induction prove it is a weak
equivalence for every Kan–Quillen-cofibrant K. Construct
`Hom_D(F(V),Y)→Hom_C(V,G(Y))` by applying enriched G and
precomposing with η_V. For cofibrant V and fibrant Y, testing
on K identifies this map with precomposition by β under the
ordinary adjunction, giving the derived mapping equivalence.
Prove that F⊣G is then a Quillen equivalence exactly when G on bifibrant enriched
categories is a Dwyer–Kan equivalence, by the actual derived
mapping comparison, unit/counit and essential image. Verify this
enriched right-functor/strength structure on unstraightening and
use the criterion (HTT's weakcompatequiv), with this typed mate.
Prove it is a Quillen equivalence (HTT 2.2.1.2), first over simplices
by the explicit rigidification contraction and index invariance,
then over all bases by pushout and filtered-union induction using
the preceding enriched Grothendieck/localization and homotopy-limit
theorems. Prove the right-fibration model's equivalences are detected
fiberwise by the mapping Kan-space and horn-lifting tests. Prove
the adjunction's derived unit/counit and base-change comparisons.
Prove its mapping-space comparison by straightening the right
fibration X_/y→X: its simplicial presheaf is weakly equivalent
both to C[X](−,y) and, objectwise, to the right mapping Kan
spaces Hom^R_X(−,y). These constructions use the existing
Kan–Quillen model, horn filtrations and the preceding enriched
diagram/localization theory, not the Joyal or marked models being
constructed. This is the route of HTT 2.2.1–2.2.4.
Right mapping spaces of products are products; use this comparison
and inner-anodyne replacement to prove
`C[S×T]→C[S]×C[T]` is a Dwyer–Kan equivalence for all S,T.
The extension to arbitrary S,T uses the native inner-anodyne
pushout-product/horn filtration, not diagram rectification.

From the preceding mapping-space comparison prove that a map
between quasicategories is a categorical equivalence exactly
when it is fully faithful and essentially surjective. Prove
fully faithful functors reflect equivalence edges. Use these
criteria before the following slice-invariance and fibrancy proofs.

Consume Tau Ceti's joins `SSet.join` and slices `SSet.slice`, with
their simplicial universal properties. Prove the relative slice projection for an inner
fibration is a left/right fibration by the join horn filtration
(HTT 2.1.2), and prove the equivalence-edge outer-horn theorem
HTT 1.2.4.3: an edge is an equivalence exactly when every Λ^n_0
horn whose first edge is that edge fills, with the dual criterion.
Consume Tau Ceti's Cartesian edges `SSet.Edge.IsCartesian`, defined
by the slice trivial-fibration test over an inner fibration, and
Cartesian fibrations `SSet.CartesianFibration`, inner fibrations
admitting Cartesian lifts of every base edge with specified target
endpoint; define coCartesian edges and fibrations dually.
For quasicategories prove the mapping-space homotopy-pullback
criterion by the slice Kan fibers. In particular Cartesian edges
over Δ[0] are exactly equivalences. Prove mapping-space fiber
comparisons for Cartesian lifts and their fiberwise equivalence
criterion. Prove equivalences of quasicategories induce equivalences
on slices under any fixed diagram (HTT 1.2.9.3/2.4.5): attach the
diagram's simplices, identify the fibers over each object with
mapping Kan spaces, and pass through towers of Kan fibrations.
Use these horn/slice results before applying HTT 2.4.6 to Joyal
fibrancy. These results concern native quasicategories directly;
they do not presuppose the Joyal or marked model structures.

For these categorical equivalences apply model
recognition (HTT Proposition A.2.6.15) with monomorphism cofibrations: prove
accessibility of this class through the accessible rigidification
and Bergner weak-equivalence tests; prove the lifting/factorization
hypotheses using boundary/horn cell filtrations and the preceding
mapping-space comparison. This constructs the Joyal model and
the rigidification/nerve Quillen equivalence. Prove its fibrant
objects are exactly the quasicategories by the preceding special
outer-horn and slice-invariance theorems, applied as in HTT 2.4.6:
adjoin an inverse edge, use inner-horn filtrations and the
mapping-space equivalence
test to prove lifting against categorical trivial cofibrations.
Prove the Cartesian Joyal pushout-product property by the
boundary/horn filtration and the product comparison above.
Prove categorical fibrations between quasicategories are inner
fibrations lifting equivalence edges, with functorial replacements.
Consume Tau Ceti's core `SSet.core`, the subcomplex of simplices
all of whose edges are equivalences `SSet.Edge.IsEquivalence`; prove
it is the maximal Kan complex of a quasicategory and construct the
core functor spaces.
Define Cat∞ as the native coherent nerve of
the simplicial category of small quasicategories with these core
functor spaces. Its colimits are constructed below through the
marked categorical simplicial model and general diagram comparison.

**Marked fibrations and Kan extensions.** Consume Tau Ceti's marked
simplicial sets `TauCeti.MarkedSSet`, whose marked 1-simplices contain
the degenerate ones, with mark-preserving maps, limits, colimits and
the mapping functors `TauCeti.MarkedSSet.mapFlat` and
`TauCeti.MarkedSSet.mapSharp`.
Use the preceding slice-category Cartesian-edge definition and
mapping-space characterization, with coCartesian edges dually.
Use the preceding Cartesian/coCartesian fibration predicates.
Prove composition, base change, contractibility of lift
choices and the fiberwise equivalence criterion. For each simplicial
set S construct the Cartesian and coCartesian marked models over S.
Specify weak equivalences by marked mapping Kan-space tests into
all such Cartesian/coCartesian fibrations over S and cofibrations
by underlying monomorphisms. Construct the marked anodyne generators,
weakly saturated closure and functorial lifting/factorization APIs,
proving these descriptions agree. Fibrant objects mark exactly
the corresponding Cartesian or coCartesian edges.

Specialize the Cartesian model to S=Δ[0] and identify marked
objects over Δ[0] with marked simplicial sets. The preceding
Cartesian-edge/equivalence theorem constructs the marked
categorical model,
with fibrant objects C marked precisely at their equivalences,
monomorphism cofibrations and the indicated marked mapping-space
weak-equivalence test. Construct its marking/forgetting Quillen
comparison with the Joyal model. Equip the marked categorical
and marked fibration models with Kan–Quillen simplicial tensors
K^♯×(−), the adjoint cotensors and marked mapping Kan complexes;
prove the simplicial model pushout-product axiom by marked-anodyne
product closure. Prove local presentability and accessible model
recognition in each case, then instantiate the earlier enriched
projective-diagram construction for these marked models. Construct
the straightening/unstraightening adjunction, using rigidification and
the relative coherent nerve, between the coCartesian model over S
and projective simplicial diagrams C[S]→marked simplicial sets;
use C[S]^op in the Cartesian case. Define straightening on each
simplex by its cone/relative mapping simplicial sets, then glue by
the simplex category. Construct its tensor comparison
`St⁺(X×K^♯)→St⁺(X)⊠K^♯` by the cone's two product
projections followed by the point comparison T_Q(K^♯)→K^♯.
Verify markings and the unit/associativity laws on the actual
mapping simplices, and prove the comparison is a weak equivalence
by the marked product-cell filtration and the images of basic
marked anodyne cells (HTT spek3–spek5). Adjunction gives the
strength K^♯×Un⁺(F)→Un⁺(F⊠K^♯): explicitly use the
tensor comparison, the counit St⁺Un⁺F→F and a K-parametrized
map F⊠K^♯→G to obtain Un⁺F×K^♯→Un⁺G. Verify the
unit/composition laws, producing an actual Kan-enriched Un⁺
for the stated sharp tensors, as in HTT's marked straightening
proof; St⁺ need not be simplicial. Prove the adjunction Quillen
using the cofibration/anodyne images and this tensor comparison,
then prove it a Quillen equivalence:
check unit/counit on simplices by the mapping-simplex filtration,
extend across marked anodyne cells and homotopy colimits using
the earlier enriched localization/homotopy-limit theorem, and prove
derived unit/counit equivalences on all fibrant diagrams. Verify
the marked straightening tensor comparison and use the preceding
enriched Quillen-equivalence criterion. This
identifies the fibration model with the strict enriched diagram
model, naturally under base change. Construct the remaining model
diagram comparison before identifying its coherent functor category.

**Coherent model diagrams and stable enhancements.** Prove
`C[S×Δ[n]]→C[S]×C[Δ[n]]` is a Dwyer–Kan equivalence,
using the already constructed mapping-space/Joyal product comparison.
Together with the Bergner/Joyal Quillen equivalence this gives,
for every Dwyer–Kan equivalence C[S]→C, the actual categorical
equivalence
`N((M^C)^cf)≃Fun(S,N(M^cf))` of HTT 4.2.4.4.
Construct its evaluation map, derived unit/counit and all
higher-simplex comparisons. Prove naturality in commuting squares
of base and enriched index maps, including diagrams of groups,
and compatibility with derived restriction and left/right
Kan-extension adjunctions, using the respective projective/injective
replacements and units/counits; compare with their coherent
universal properties after constructing coherent Kan extensions below.
State base-change equivalences
only under their required cofinality or exact-square conditions;
use the product comparison for S×Δ[n] to identify transformations
and mapping spaces. This is a general model-diagram theorem,
instantiated for Kan complexes, marked categorical and fibration
models, G2 spectra and the transferred algebra/module models below.
Verify the hypotheses in each instance. For G2 spectra prove local
presentability from the sphere-module/presheaf presentation and
accessibility of the stable equivalence localization; combine its
generating cofibrations with the simplicial tensor/cotensor
adjunction to prove the model mapping axiom: first check the level
structure, then use closure of Ω-spectrum local objects under
Kan cotensors to pass through stable localization. This gives
the required combinatorial simplicial model. For the marked models
use their preceding anodyne recognition and simplicial axiom; for
algebra/module models use the word-cell transfer below.

Define a cone on p:K→C using Δ[0]⋆K and a cocone
using K⋆Δ[0], with categories C_/p and C_p/ respectively.
Define infinity categorical limits as terminal cone objects and
colimits as initial cocone objects
and prove the mapping-space criterion (HTT 4.2.4.3), including
naturality in the cone diagram. Define a pointed infinity category
by a zero object, both initial and terminal. Define it to be stable
when it has finite limits and colimits and a square is a pushout
exactly when it is a pullback.

Prove the homotopy (co)limit comparison of HTT 4.2.4.1: use the
enriched derived mapping-end/bar formula to identify maps from a
homotopy colimit with maps of its coherent diagram into a constant
diagram; dually treat homotopy limits. The preceding rectification
theorem identifies these with the infinity categorical cone universal
properties, including diagrams on arbitrary small simplicial sets.
Apply it to the marked categorical model, with its Kan simplicial
enrichment, to construct Cat∞ colimits. Prove its comparison with
the quasicategory/core-functor presentation and with the derived
Joyal model through the marking/forgetting Quillen equivalence;
do not assume the Joyal internal hom is a Kan simplicial enrichment.
Construct relative localization (C,W) by the categorical homotopy
pushout replacing the marked edges by walking equivalences. Prove
its functor-space universal property and preservation of colimits
of relative diagrams. Prove Δ[0]/Δ[1] generate Cat∞ under small
colimits by spines, finite cell attachment and filtered unions;
construct the slice colimits and their model comparisons.

Construct the enriched Dwyer–Kan localization by hammock mapping
spaces and composition, with simplicial-category fibrant replacement.
Prove its coherent nerve has the localization universal property
and compare cofibrant-object localization with N(M^cf). For G2's
model define Sp∞=N(Sp_model^cf). The general diagram theorem
and derived (co)limit comparison identify its zero and finite
limits/colimits with G2/G3's model homotopy (co)limits, naturally
in coherent diagrams. Identify its suspension/loop adjunction with
G2's stable-model Quillen equivalence; prove the derived unit/counit
equivalences and the pushout/pullback-square comparison. Thus Sp∞
is stable. Prove Fun(BG,Sp∞) is stable with pointwise finite
limits/colimits and compare it exactly with G2's projective
BG-diagrams by this same general rectification theorem. The monoidal
part of this comparison is constructed below after the monoidal
enhancement. Derived smash is exact separately by the stable model
comparison.
These are the stable enhancements used below, not consequences
inferred solely from the triangulated homotopy category.

Apply general model-diagram rectification to the earlier marked
straightening Quillen equivalence, obtaining its identification
with Fun(S,Cat∞), natural under pullback and on every higher
base simplex. Apply it also to unmarked Kan-valued straightening,
identifying right fibrations with Fun(S^op,Spaces); prove a right
fibration with contractible fibers is an equivalence. These supply
the mapping-simplex and Grothendieck comparisons of HTT §§2.1,
2.4,3.2–3.3 before the descent and Kan-extension constructions.

Prove strict pullback along a coCartesian fibration preserves
categorical equivalences, by the marked straightening comparison
and the simplex-wise mapping-space test. It already preserves
monomorphisms and colimits, hence is left Quillen on Joyal slices.
Deduce its derived pullback preserves Cat∞ colimits. Prove descent
of coCartesian fibrations across a colimit of bases by gluing their
straightened functors; identify the total-space colimit and every
pullback. Together with Δ[0]/Δ[1] generation and localization's
colimit property this supplies the actual base-descent theorem
used in the monoidal localization below.

Using the preceding slice/join cone and (co)limit definitions,
define left/right Kan extensions by their functor-space universal
properties. Prove the pointwise comma-category
formulas, the existence theorem when those pointwise (co)limits
exist, composition, base change under the stated cofinality conditions,
and the criterion for an extension to be absolute. Define adjunctions
by the corresponding representable mapping-space pairing and build
their unit/counit, triangle comparisons and contractible space of
choices. Prove a fully faithful right adjoint exhibits localization:
precomposition identifies functors out of the target with functors
inverting the unit maps, including higher natural transformations
(HTT Proposition 5.2.7.12). Construct accessible
presheaf localizations by cell inversion of a small set of maps,
with the objectwise local mapping-space criterion; establish the
cardinal bounds and accessible adjoints needed below.

Construct the following monoidal/fibration sub-lane before using
the quotient product. Work on native simplicial sets and nerves;
Fin_* is the finite-object full subcategory of native `Pointed`,
with its small skeleton (Fin(n+1),0). Define active/inert maps and
construct their factorization and the inert projections. Use the
Cartesian/coCartesian edge, lift and fiberwise-equivalence APIs
constructed above.
Use the preceding marked straightening equivalence and its
naturality in the base for these relative coherent nerves and
simplicial Grothendieck constructions. Include mapping simplices
over all Δ[n] and their descent, not just chosen edge lifts.
Define monoidal enhancements as coCartesian fibrations over
N(Fin_*) with Segal fibers C^n; define monoidal functors by
preserving all coCartesian edges and lax functors by preserving
inert ones. Construct their functor/natural-transformation spaces
over this base, and prove equivalences are detected on underlying
objects. Define an infinity operad by the inner-fibration,
inert-lift and Segal conditions, including the product decomposition
of mapping spaces over a specified Fin_* map. Construct its
colors, multi-operation spaces, units and substitution. Construct
the operadic nerve of a locally Kan colored simplicial operad and
prove these axioms by the colored mapping-space/horn comparison.
Define operadic functors by inert preservation. This gives the
general definitions needed for LM below without requiring every
infinity operad to be a coCartesian monoidal category.

For G2's monoidal model, use the full subcategory of cofibrant
objects together with the tensor unit and its isomorphic copies.
Prove tensor closure and preservation of weak equivalences in
each variable, including maps to/from the possibly noncofibrant
unit: compare with Q1→1 and use the model's unit axiom.
Construct the ordinary operator category with objects tuples
(X₁,…,X_n) and arrows over f in Fin_* given by maps from the
ordered tensor over f⁻¹(j) into the j-th target. Extend native
monoidal coherence to symmetric coherence: normalize tensor words
by a bracketing and a permutation, prove independence using the
hexagon, symmetry and braid/Coxeter relations, and prove that two
structural maps agree when their permutations agree; prove the
converse in the free symmetric monoidal category on labeled words.
Use this theorem to define composition and reordering in the operator
category and prove all category laws. Take its ordinary
nerve over N(Fin_*) and localize at the fiberwise weak-equivalence
tuples.
Prove the resulting map to N(Fin_*) is coCartesian with fibers
the corresponding products of DK localizations. For comparison
with the full model, use absolute right Kan extensions presenting
the left-derived multi-Quillen tensor functors; construct them by
functorial cofibrant replacement and verify the unit comparison.
Check composition of these extensions on Δ[2], then use mapping-
simplex gluing/descent for general bases. Prove the unit-adjoined
cofibrant and full-model localizations agree over N(Fin_*), with
the full-model functor lax and the unit-adjoined restriction
monoidal. This constructs
the monoidal enhancement of G2's derived smash without requiring
a strictly monoidal fibrant replacement.

Apply the same unit-adjoined localization to G2's projective
BG-diagram model with diagonal smash. Prove its pushout-product
axiom on free G-cell generators: the diagonal G-action on G×G
is free, so the pushout product is a coproduct of free cells with
the underlying spectral pushout product. The trivial-action unit
need not be projectively cofibrant. Construct its projectively
cofibrant replacement EG₊∧S→S from G2.9's free contractible
bar carrier and its free G-CW realization;
prove the unit axiom on cofibrant diagrams by its underlying weak
equivalence and the spectral unit axiom. Use this replacement in
the unit-adjoined/full-model comparison, not an assumed cofibrant
trivial-action unit. Prove the induced monoidal enhancement agrees
with pointwise smash on Fun(BG,Sp∞), through the general diagram
comparison on all tensor tuples, units and higher operator simplices.
Thus the earlier exact projective/coherent comparison is monoidal,
naturally in group restriction, before BordismFormalGroups F6.5's
Tate lane consumes it.

For a small stable enhancement C and full stable D, construct the
quotient C/D at maps whose cofibers belong to D. Prove exactness,
replacement invariance, the exact-functor universal property, and
the filtered mapping-space formula
`Map_(C/D)(X,Y)≃colim_(Z∈D_/Y) Map_C(X,cofib(Z→Y))`.
Construct the infinity category of presheaves Fun(C^op,Spaces)
with values in Kan spaces, using the general model-diagram
theorem for the Kan–Quillen projective diagram model. Prove the space-valued Yoneda theorem,
mapping-space formulas and objectwise limits/colimits. Define
Ind_κ(C) as its full subcategory of κ-filtered colimits of
representables; construct its universal property for κ-filtered
colimit-preserving functors, the compact-representable comparison,
and the case κ=ω. Prove Ind_κ(C) is stable for small stable C:
use the lim-colim mapping formula and exactness of filtered
colimits of spaces. Compute finite limits objectwise and construct
finite colimits by common filtered presentations of finite coherent
diagrams in C. Verify their universal properties by that formula.
The represented zero is initial and terminal within Ind_κ(C);
it is not the empty initial presheaf. Identify fibers, cofibers and
suspension by these constructions, rather than asserting closure
under objectwise presheaf colimits.
This uses space-valued presheaves, rather than set-valued ordinary
Ind or a purported strict spectral composition on arbitrary
mapping Kan complexes. Compare with G2's concrete mapping spectra
on fibrant-cofibrant diagrams through their derived mapping spaces.
For a tensor ideal D, construct the monoidal DK quotient by
localizing the total monoidal nerve at tuples of cofiber-in-D maps.
Tensor stability of that class, the family localization just proved
and Segal fibers identify its underlying quotient with C/D.
The functor-category universal property over N(Fin_*), restricted
to functors preserving inert edges, proves the lax monoidal
universal property, including natural transformations.

Construct the coCartesian symmetric monoidal enhancement
Ind(C)^⊗→N(Fin_*) by operadic left Kan extension of the
Yoneda embedding, first for ordinary filtered Ind(C). Construct Day
convolution on
space-valued presheaves: its n-input value is the left Kan extension
of the external product along the n-fold tensor C^n→C.
Construct the relative operadic left Kan extension by the active
overcategories and their colimit cones, prove compatibility with
composition of active maps, and use the marked straightening
theorem to assemble its coCartesian fibration over N(Fin_*).
Prove its inert fibers are products, the Segal equivalences, unit
and symmetry, and the universal property for functors preserving
the indicated colimits separately. Restrict to Ind using the
tensor closure of representables and the formula
`(colim_i yX_i)⊗(colim_j yY_j)=colim_(i,j)y(X_i⊗Y_j)`.
Prove Yoneda is monoidal and exact into Ind(C); construct the
finite colimit comparisons through common filtered presentations.
Deduce tensor preserves finite colimits and, by filtered unions
of finite sums, all small colimits separately. Prove this enhancement
is characterized by that universal property (HA Proposition 4.8.1.10 and
Corollary 4.8.1.14; Remark 4.8.1.13 for Day convolution on presheaves).
This proves all higher
coherence as a coCartesian construction, not an objectwise formula.

Construct relative adjunctions over a simplicial base from the
marked comma fibrations representing the fiberwise mapping-space
pairings. If the left functor preserves coCartesian transport and
has fiberwise right adjoints, construct its relative right adjoint
by representing these pairings over every base simplex. Define its
transport maps as adjoint mates; these maps need not be invertible
for active arrows. Use the straightening equivalence to assemble
the functor and its unit/counit over the whole base.
Apply this to a monoidal L^⊗ whose underlying L has a right
adjoint R. Its multi-fiber adjoints are products of R. Prove the
relative right adjoint R^⊗ over N(Fin_*) preserves inert edges,
by the product/projection comparison and the relative unit/counit
(HA 7.3.2.6/7). Its active maps recover the mates of tensors of
counits. Construct the naturality of this relative adjunction in
functor spaces, so these mates include all higher simplices.
Apply it to fixed points and to the fully faithful right adjoint
`Ind(C/D)→Ind(C)` of monoidal localization. Construct the
latter adjoint using the local presheaf model and the filtered
cofiber mapping formula, and prove its unit/counit/full faithfulness.
Prove Ind extends lax functors by its operadic left Kan
extension, and that colim:Ind(E)→E is monoidal whenever E
has the indicated filtered colimits and tensor preserves them
separately. Deduce the universal exact lax-monoidal approximation
killing D as `C/D→Ind(C)→Ind(E)→E`. Prove its universal
property in the actual exact/lax functor spaces and that the space
of compatible lax structures is contractible. These are the
infinity categorical adjoint and monoidal Ind constructions;
ordinary monoidal localization does not supply them.

Construct the simplicial category whose objects are these small
coCartesian Segal fibrations over N(Fin_*) and whose mapping
Kan complexes are the cores of their inert-preserving relative
functor quasicategories. Prove Kan-ness, composition and units;
take its native coherent nerve to obtain the infinity category
of symmetric monoidal infinity categories and lax functors. This
is not the category with all maps over N(Fin_*) or the functor
category whose natural transformations encode only strong monoidal
maps. Construct A with
objects (C,D,F₁,F₂,α), where C,D are symmetric monoidal,
F₁:C→D is lax monoidal, F₂:C→D is an underlying functor,
and α:F₁→F₂ is an underlying natural transformation. Construct B
with the same objects carrying also a lax structure on F₂ and a
lax monoidal α. Define their morphisms and all higher simplices
by the universal evaluation/relative-functor fibrations and their
arrow categories. In both A and B a morphism has strong symmetric
monoidal ambient maps u:C→C′, v:D→D′, equivalences of squares
vF_i≃F_i′u, and the compatibility with α. In A the F₁
square is lax monoidal and the F₂ square is underlying; in B
both square equivalences and compatibility are lax monoidal. Use their relative
functor-space pullbacks and the Cartesian/coCartesian Grothendieck
construction to assemble varying source/target categories. Prove
this definition's functor-space universal property, including every
higher compatibility, and construct B→A forgetting the refinements.
Prove small limits in this B are computed objectwise: strong ambient
transport preserves every operadic coCartesian edge, so the limit
fibration has coCartesian lifts computed componentwise, with product
Segal fibers. The square equivalences induce the limiting functors
and α; prove B→A preserves these limits. In particular apply
this theorem to Kan-indexed diagrams
of equivalences. No such limit-creation assertion is made for
arbitrary lax ambient maps. Replace B→A by a
categorical fibration, naturally in base change. For a Kan
parameter space S→A whose objects satisfy the preceding universal
approximation, its pullback has the contractible fibers proved by
that universal property. Prove a categorical fibration over a Kan
complex is Cartesian, using equivalence-edge lifting; with these
groupoidal fibers it is a right fibration, and with contractible
fibers it is a trivial Kan fibration. Its space of sections is
therefore contractible (HTT 3.3.1.8,2.4.2.4,2.1.3.4). This
constructs the actual parameterized refinement and its total space,
including higher transformations and base change.

Construct the two-colored associative algebra/module operad, whose
lax images are the unital actions BordismFormalGroups F6.5 consumes
for Tate. Construct its ordered input profiles explicitly: an A-output
has an ordered word of A-inputs; an M-output has an ordered
word of A-inputs followed by its sole M-input. Permutations
relabel the input slots. Construct slot substitution, permutations,
units and the colored operator nerve LM^⊗. Prove its infinity
operad axioms; it is not required to be a coCartesian monoidal
category. Define its algebras as inert-preserving functors
LM^⊗→C^⊗ over N(Fin_*). Construct restriction along
Assoc^⊗→LM^⊗, recording the associative algebra A, and
evaluation at the module color, recording its underlying M.
Construct the fiber over A and compare it with the derived strict
left-module category through the rectification below; compare the
total category with strict algebra/module pairs. These are the
specified comparison targets, including maps and higher
transformations. Prove unit, composition, base-change
and group-restriction comparisons in these operadic functor spaces.

Construct the separate operadic rectification comparison with
G2's strict associative rings and left modules. Use its simplicial
stable-projective spectral model and its pushout-product and monoid
axioms. Prove its sphere is cofibrant: identify it with the free
spectrum F₀(S⁰), use the level-projective free/evaluation Quillen
adjunction and cofibrancy of S⁰, then note stable left Bousfield
localization keeps these cofibrations. This precedes rectification;
no cofibrant unit is asserted for the positive-flat model. For the
two-colored associative/module operad, prove its operation sets
are Σ-free by their ordered-word permutation torsors. Use this
Σ-cofibrant operad directly. Construct its free algebra/module
word filtrations, including nullary unit cells, and its transferred
combinatorial simplicial model of strict pairs. Prove the model
hypotheses by the pushout-product/free-cell filtration. Construct
cofibrant algebra/module bar resolutions and the coherent operadic
nerve comparison; their word-cell and mapping-end computations
prove the derived unit/counit and identify the localization of
strict pairs with Alg_LM(Sp∞), as in HA 4.1.8/4.3.3. For a
supplied algebra A use a cofibrant strict representative and prove
the module-fiber comparison is independent of that choice. Compare
G2's positive-flat and this cofibrant-unit model through the same derived
ring/module comparisons, with their actual Quillen hypotheses.
For BG, apply the general model-diagram theorem to these
transferred algebra/module simplicial models, verifying its
combinatorial hypotheses by the preceding free-cell construction,
and compare with
Fun(BG,Alg_LM(Sp∞))≃Alg_LM(Fun(BG,Sp∞)); prove this
equivalence from the operadic functor definition and pointwise
operations. The earlier bar comparison of spectra alone is not
used to rectify rings/modules. This theorem applies to supplied
strict/coherent associative data, not to an arbitrary homotopy ring.
This is the reusable coherent-module API consumed by
Elliptic E2's finite-action towers.

*Needs:* 2.1–2.5 and 2.9; Tau Ceti's marked simplicial sets, joins, slices, Cartesian edges and cores; Mathlib `SSet.Quasicategory`, `EnrichedCat` and `HomotopicalAlgebra.ReedyStructure`.

**Checks.**

- The nerve of the poset [1] is a quasicategory but not a Kan complex; its only equivalence edges are the identities, so its core is the discrete simplicial set on two vertices.
- Over Δ[0] the Cartesian edges are exactly the equivalences: in the nerve of a groupoid every edge is Cartesian over Δ[0].
- In the nerve of [1] the edge 0 → 1 is not an equivalence, and the horn Λ²₀ with first edge 0 → 1 and second edge the identity of 0 has no filler, as HTT Proposition 1.2.4.3 predicts.

### Examples

- The sphere spectrum, HA, F₁S¹ and the map λ : F₁S¹ → F₀S⁰ distinguish naive and derived homotopy.
- Freudenthal on S¹ and S², and the stabilized sphere colimit.
- The low-rank homotopy table of GL_k(ℝ) and the numerable Möbius band.

### Dependencies

G2.1 uses Tau Ceti's pointed simplicial sets, Mathlib's generating classes of simplicial sets, AlgebraicTopology Stages 4.5, 4.7, 4.8 and 8.2 and CharacteristicClasses C1.2. G2.2 uses Tau Ceti's symmetric spectra. G2.3 and G2.4 use G2.1–2.2. G2.5 uses G2.1–2.4 and AlgebraicTopology Stages 4.4, 4.5 and 8.11b. G2.6 uses G2.3–2.5. G2.7 uses G2.10's homotopy-fibre comparison and AlgebraicTopology Stages 4.5, 5.5 and 8.8c. G2.8 uses G2.1–2.4. G2.9 uses CharacteristicClasses C1.1b, TopologicalKTheory T1.5–T1.6, RepresentationTheory LieGroups Layer 2 and G4.0a. G2.10 uses G2.1, Tau Ceti's path theory and AlgebraicTopology Stage 5.5. G2.11 uses G2.1–2.5 and G2.9 and precedes G5.7.

## G3. Brown representation, arbitrary CW and infinite comparisons

### 3.1 Brown on arbitrary CW (G3.1)

Prove set-valued pointed Brown representability
on **connected** pointed CW complexes: the functor takes arbitrary wedges
to products, homotopy pushouts to weak pullbacks, and the point to a
singleton (Hatcher, *Algebraic Topology*, Theorems 4E.1 and 4E.2,
pp. 448–449; Cohen, *Bundles, Manifolds, and Homotopy*, Theorem 10.3, p. 282). Give the representing space and universal class by cell
attachment and kernel killing, with the solution-set bounds in the chosen
universe. Use the telescope of the countable construction and derive
surjectivity onto its inverse-limit compatible classes from wedge/exactness;
a strict inverse limit is not the representing construction.
For an integer-graded additive theory, represent Ẽ^(q+1) on connected CW
spaces and use Ẽ^q(X)≃Ẽ^(q+1)(ΣX) and suspension–loop adjunction to
represent Ẽ^q on **all** pointed CW spaces, including disconnected ones.
Prove naturality and the usual Yoneda uniqueness of representing spaces.
Consume AT's based-loop-CW-type comparison. Prove the displayed
bijection with [X,ΩK_(q+1)] is additive, with loop concatenation agreeing
with the theory addition by the co-H-space/Eckmann–Hilton argument.
Identify the basepoint components separately: connected representing
spaces give the Ω₀ branch; the additive disconnected extension retains
all components indexed by the coefficient group.

*Needs:* G1; 3.4; AlgebraicTopology's based-loop CW-type comparison.

**Checks.**

- `H̃¹(−;ℤ)` on connected pointed CW complexes is represented by S¹ = K(ℤ,1) and `H̃²(−;ℤ)` by CP∞ = K(ℤ,2).
- The point axiom h(*) = singleton follows from the wedge axiom applied to the empty wedge.
- `H̃⁰(S⁰;ℤ) = ℤ`, so the disconnected extension must retain all components of the representing loop space, indexed by the coefficient group.

### 3.2 Integer-graded representing spectra and operations (G3.2)

Choose actual
maps ΣE_n→E_(n+1) representing the suspension adjoints between the chosen
representing spaces; prove their Ω equivalences. The connected Brown
representatives have adjoints into Ω₀K_(n+1); looping that equivalence
gives the all-component additive representing levels and full Ω-spectrum
maps, without dropping their coefficient-group components. A sequential spectrum
needs these maps, not an unstated higher-coherence axiom. Transport by
pointed Sing and G2's sequential/symmetric Quillen equivalence, and prove
representation on all relative/reduced groups.
Prove the presentation E≃hocolim_n Σ^(−n)Σ∞E_n after the specified
sequential/Ω replacement, and its free-spectrum version. Prove diagonal
cofinality presentations for derived twofold and threefold smash products.
Construct the restriction tower of stable maps from the desuspended
suspension spectra of the representing levels. Prove its Milnor exact
sequence and use it to state the existence, ambiguity and obstruction to
lifting stable operations and universal external-product classes to spectral
maps. Name the exact stagewise-phantom kernel; compare it with intrinsic
finite-source phantoms rather than asserting their equality without proof.
Prove associativity and symmetry defects of lifted products lie in the
corresponding restriction kernel, and prove honest stable ring laws when
that kernel vanishes (including explicit Mittag–Leffler hypotheses).
For a supplied coherent spectral-ring product prove its axiomatic-theory
comparison without this ambiguity. Additive Brown representation and
ordinary product axioms do not imply a strict associative or E∞ refinement.
Natural transformations on all spectra are induced by unique spectral
maps, by Yoneda; the preceding restriction-kernel ambiguity concerns data
given only on spaces/representing levels.

*Needs:* 3.1; G2.3–2.5.

**Checks.**

- The Ω-spectrum levels of KU alternate ℤ×BU and U, and those of HZ are the K(ℤ, n).
- A sequential spectrum needs actual maps ΣE_n → E_(n+1); for HZ these are adjoint to the equivalences K(ℤ,n) ≃ ΩK(ℤ,n+1).

### 3.3 Arbitrary-CW comparison theorem (G3.3)

A natural morphism of theories that
commutes with suspension/boundaries and is an isomorphism on coefficient
groups in every integer degree is an isomorphism on all CW pairs (Hatcher,
*Algebraic Topology*, Proposition 3.17, p. 217, for cohomology; the homology
proof is the same). For ℤ-graded homology theories on Mathlib's
`TopPair.HomologyPretheory`, valued in an abelian category and satisfying
`IsExtraordinaryEilenbergSteenrod` (homotopy invariance, excision,
additivity and the pair sequence), a morphism that is an isomorphism on a
point in every degree is an isomorphism on every Hausdorff space with a
Mathlib `Topology.CWComplex` structure, of arbitrary dimension and cell set:
this is `homologyComparison`. The pair form follows from it by the five
lemma on the pair sequence. Prove
the finite cell step, arbitrary wedges of cells, relative skeletal step,
unbounded-dimensional passage using item 4 and transport to CW-type spaces. Include
naturality with arbitrary attaching maps and coefficient-module actions.
Neither finite generation of the cell set nor connectivity of E is assumed.

*Needs:* G1; 3.4 for the unbounded-dimensional passage; Mathlib `TopPair.HomologyPretheory` and `Topology.CWComplex`.

**Checks.**

- On compact metric spaces, the natural map from singular to Steenrod homology is an isomorphism on a point but not on the Warsaw circle, which is not a CW complex: the CW hypothesis of `homologyComparison` is needed.
- The coefficient map HZ → HQ is not an isomorphism on a point, and indeed `H₁(S¹;ℤ) → H₁(S¹;ℚ)` is not one.
- For the empty CW complex both sides vanish by additivity over the empty family.

### 3.4 Telescope and Milnor (G3.4)

For a countable sequence of pointed spaces form
its actual mapping-cylinder homotopy telescope. Its alternating open
cylinder cover and G1 MV/disjoint-union axioms produce the exact
sequence below. Take A to be the even pieces and B the odd pieces.
On overlap i the ordered restriction difference is
(−1)^i(a_i−f_i*a_(i+1)). Normalize its product identification by
ε((b_i))=((−1)^i b_i), so the group map becomes exactly 1−shift.
Its coker-to-MV comparison sends [b] to [εb]; hence the lim¹ injection
is δ_MV∘ε, not the unnormalized δ_MV. Carry this identification through
the spectral triangle comparison, with the positive interval at overlap0
fixing the global sign. This uses no point-set difference
map of spaces or a G2 dependency. For spectra construct the actual
cofiber of 1−shift on the wedge; compare this triangle with the topological
construction after suspension spectra. Apply the single AT tower algebra to prove
`0→lim¹ E^(q−1)(X_i)→E^q(hocolim X_i)→lim E^q(X_i)→0`
(Hatcher, *Algebraic Topology*, Theorem 3F.8, p. 314, for CW unions).
The inverse-limit map is restriction. The lim¹ injection is the ε-normalized ordered-MV connecting map, and
in the spectral comparison the cofiber connecting map for
`∨Σ∞X_i --(1−shift)→ ∨Σ∞X_i → Σ∞Tel`, factored through the
coker of `(a_i)↦(a_i−f_i*a_(i+1))`; use the left-suspension/cone convention
above. Prove agreement with AT 6.0, naturality, cofinal-shift comparisons
and coefficient-module actions. For sequential inclusions of
CW subcomplexes prove telescope≃union. For arbitrary CW dimension use the
countable dimension filtration; an uncountable CW complex need not admit
a countable filtration by finite subcomplexes.

*Needs:* G1; AlgebraicTopology Stage 6.0; G2.4 for the spectral version.

**Checks.**

- For a constant tower lim¹ vanishes, so `E^q(Tel) = E^q(X)`.
- For the tower ℤ ← ℤ ← ℤ ← ⋯ with bonding maps multiplication by 2, 3, 4, …, lim = 0 and lim¹ ≅ `Ext¹(ℚ, ℤ) ≠ 0`.
- A tower of surjections is Mittag–Leffler and has lim¹ = 0.

### 3.5 Increasing open covers (G3.5)

If X is the union of an increasing countable
family of open sets U_i, prove the canonical telescope map is a weak
equivalence after convenient/singular replacement. Compact spheres and
their homotopies lie in one U_i; prove the exact compact-family comparison.
Deduce the Milnor sequence for the spectrum-defined extension, compare it
with any original theory on CW-type opens/union, and prove MV/disjoint-union
axioms imply the same sequence for that CW-replacement extension. For
a direct open-MV proof use a numerable exhaustion, with a continuous
f:X→[0,∞) whose increasing sublevels refine the U_i, and construct the
alternating open telescope cover. For a numerable bundle cover, prove
Dold's countable disjoint-refinement lemma: a countable numerable cover V_n,
each V_n a disjoint union of trivializing opens, with refinement maps and
an actual subordinate partition. Its finite unions give the required
exhaustion. The proof uses the disjoint-union axiom and finite trivializing-
piece complexity, not a finite-CW hypothesis on those opens.

*Needs:* 3.4; G1.3.

### 3.6 Phantom and mapping-spectrum control (G3.6)

For a countable CW-spectrum
filtration `P_i→P_(i+1)` by the G2 CW-spectrum cells prove
`0→lim¹[ΣP_i,E]→[hocolim P_i,E]→lim[P_i,E]→0` with natural group maps.
Identify the kernel as stagewise phantom maps. When P_i are finite and
exhaust all compact subobjects, compare it with vanishing on every finite
spectrum. For an arbitrary CW spectrum define phantom maps by restrictions
to all finite subspectra; supply the finite-subobject/filtered-hocolimit
comparison and state precisely when a countable lim¹ description applies.
Do not identify arbitrary spectral maps with a bare inverse limit of
unstable maps. Prove sufficient Mittag–Leffler/surjectivity conditions for
vanishing. Construct the nonzero phantom
`S_ℚ=Tel(S --2→ S --3→ S --4→ ⋯) → ΣHZ`: its restriction groups
[S,ΣHZ] vanish, while the lim¹ term of [ΣS,ΣHZ] is identified with
Ext¹_ℤ(ℚ,ℤ)≠0. Exhibit the constant-one class in the tower's coker:
a hypothetical preimage forces factorial residue congruences incompatible
with a fixed integer. Prove this Ext/lim¹ identification and nonvanishing and
show the map is intrinsically phantom by compactness.

*Needs:* 3.4; G2.4; G2.7.

**Checks.**

- `[S, ΣHZ] = π₋₁HZ = 0`, while the lim¹ term of `[ΣS, ΣHZ]` along multiplication by 2, 3, 4, … is `Ext¹(ℚ, ℤ) ≠ 0`, so the map `S_ℚ → ΣHZ` is a nonzero phantom.
- For a finite spectrum P every phantom map out of P is zero, since P is compact.

### 3.7 Continuity and finite-source formulas (G3.7)

Finite cell spectra are compact:
stable maps out of them commute with filtered homotopy colimits. Prove the
corresponding homology filtered-colimit theorem and the finite-CW
suspension-spectrum mapping formula `colim_k[Σ^kX,E_(n+k)]` for finite
pointed CW X and a sequential spectrum E, or a symmetric spectrum after
semistable/Ω replacement, with k chosen so n+k≥0 and the groups are in
their abelian range. On infinite sources use the preceding mapping
LES, not that finite-source formula without phantom corrections. Prove
finite-skeleton and completion comparisons for projective/Thom examples;
no general canonical splitting of a Milnor short exact sequence is claimed.

*Needs:* 3.6; G2.6.

### 3.8 Spectral homotopy limits and Postnikov covers (G3.8)

Construct derived
products in G2's model, functorial tower replacements and
spectrumTowerHomotopyLimit E as the derived fibre of1−shift on
∏_r E_r. Its r-th coordinate is pr_r−f_r pr_(r+1), using the
stable addition, not subtraction of arbitrary pointed-set level maps.
Prove comparison with the model homotopy limit, naturality, cofinality
and the exact homotopy Milnor sequence
`0→lim¹ π_(n+1)E_r→π_n holim E_r→lim π_n E_r→0` in every
integer n. Identify these kernel/cokernel arrows with AT6.0's single
abelian tower carrier; prove the actual product/fibre and connecting
comparisons rather than only invoking the algebraic sequence.
For every integer k construct the functorial
spectrumConnectiveCover E k=τ_(≥k)E with its map to E: π_n
vanishes for n<k and the map is an isomorphism for n≥k. Use
functorial cellular factorization with sphere cells in degrees≥k,
proving attachment/smallness and homotopy-colimit comparisons in
G2's model. Prove derived smash of an a-connective and a b-connective
spectrum is(a+b)-connective by their cellular models and the sphere
smash comparison. Construct spectrumPostnikovTruncation E k=τ_(<k)E,
its map from E and the natural exact triangle τ_(≥k)E→E→τ_(<k)E.
Prove its π_n comparison for n<k and vanishing for n≥k. Compare
choices and construct the compatible derived spectral functors.
Prove the full mapping-space universal properties: the connective
cover is right adjoint to inclusion of k-connective spectra, and
truncation is left adjoint to inclusion of spectra with no homotopy
in degrees≥k. Maps from k-connective objects to those truncated
objects form a contractible mapping space, including parameter
homotopies. Prove idempotence, shift/unit and tower composition laws.
For a connective ring R and an R-module E, construct the coherent
R-module structure on τ_(≥k)E by connectivity/coreflection, and prove
the cover map R-linear. Rectify through G2's module model and verify
all action coherences; for k>0 this is not a unital ring structure.
For connective commutative spectral rings construct the structured zeroth
Postnikov refinement on Mathlib `CommMon` over G2.4's constructed
symmetric monoidal spectral carrier.
Use its positive-flat commutative-ring model and the same HA of G2.7
for a native commutative coefficient ring A. Consume G2.5's identification
of sphere homotopy with the stabilized sphere colimit of G2.5; identify π₀S
with ℤ using AT's positive sphere-degree class, compatibly with product
and unit. Construct the commutative model's simplicial enrichment,
tensors/cotensors and functorial replacements. Transfer G2.4's spectral
SM7 through the forgetful cotensor and fibration/trivial-fibration
comparisons to prove the commutative corner-map property.
First prove connectiveSpectrumMapsToHA: for connective V the actual
simplicial map, defined by π₀, from the derived `Map_Sp(V,HA)` to
the constant simplicial set `Hom_AddCommGrp(π₀V,A)` is a weak equivalence.
Use this section's additive mapping-space truncation and G2.7's HA,
with cofibrant source and fibrant target replacements; prove coefficient
naturality and the replacement comparisons.
Reuse G2.8's single free/operadic and relative free-cell comparisons.
Prove an m-fold homotopy symmetric power of a k-connective spectrum
is mk-connective for k≥0. Using G2.8's comparison, prove homotopy
orbits and filtered homotopy colimits preserve k-connectivity.
Construct connective commutative-cell presentations and their weak
equivalences to connective rings. Degree-zero generators use a specified
positive-flat cofibrant K₀≃S: the derived free algebra has polynomial
π₀ and its maps to HA are the discrete choices in A. Degree-one relation
cells impose the specified π₀ relations; higher free generators and
degree-d attaching cells for d≥2 have contractible HA mapping fillers.
Prove these claims on the actual mapping pushouts/pullbacks using SM7,
then pass through transfinite composites by Kan mapping towers and
sphere compactness. Construct by π₀ the actual natural simplicial map
from the derived `Map_CAlg(R,HA)`, using a cofibrant source and fibrant
HA target, to `Hom_CommRing(π₀R,A)` and prove it a weak equivalence,
with the right side a discrete Kan space. Retain its bifunctor
naturality, composition and replacement comparisons.
On specified connective positive-flat cofibrant commutative models
construct connectiveCommRingPostnikovZero R=P0R and a strictly
natural commutative-ring map `R→P0R`. Use functorial small-object
factorization with the commutative model's generating trivial
cofibrations and free commutative cells on
`F_m(∂Δ[k]₊)→F_m(Δ[k]₊)`, m≥1 and k−m≥2, where F_m is G2's
spectral free/evaluation adjoint. Prove smallness, positive-flat
cofibrancy, the stable sphere comparison and the relative free-cell
connectivity bounds. The high cells preserve connectivity and π₀;
the lifting properties give positive Ω-fibrancy and, by G2.6's
positive-level group formula, kill every positive stable homotopy group.
Prove P0 preserves weak equivalences between these models. For a raw
connective R use the earlier functorial
cofibrant replacement cR→R and export the natural span
`R←cR→P0(cR)`. Identify the underlying spectrum of P0(cR), under cR, with
spectrumPostnikovTruncation R 1=τ_(≤0)R by the additive universal
property and its homotopy-group comparison. Construct a commutative
equivalence `P0(cR)≃H(π₀R)` between specified replacements, natural
in Ho(CAlg), with the identity on π₀. The preceding actual mapping-space
comparison supplies its derived uniqueness. Strict functoriality is
asserted for P0 on the specified models; the HA comparison is
Ho-natural, without an asserted strictly natural point-set map R→HA.
Prove spectrumPostnikovConvergence: E→holim_(k→∞)τ_(<k)E
is an equivalence by eventual π-stability and the above Milnor sequence.
Likewise hocolim_(k→∞)τ_(≥−k)E→E is an equivalence. Neither statement
assumes E bounded below. Generic constructors precede specialized
KO covers, ABP characteristic maps and String/bordism coefficients.

*Needs:* G2.4, G2.7 and G2.8; 3.4; AlgebraicTopology Stage 6.0.

**Checks.**

- `τ_(≥0)KU = ku` with `π_* ku = ℤ[β]`, |β| = 2.
- For HA, `τ_(≥k)HA = HA` for k ≤ 0 and 0 for k > 0.
- The map `τ_(≥k)E → E` is an isomorphism on π_n for n ≥ k and `π_n τ_(≥k)E = 0` for n < k.

### 3.9 Integral localization and derived prime completion (G3.9)

For a
multiplicative set S⊂Z construct S^(-1)S as the sphere localization
and spectrumIntegerLocalization E S=E∧S^(-1)S, with actual unit,
functorial telescope and localization universal property. Prove
π_n(S^(-1)E)=S^(-1)π_n E for every integer n, smashing/localization
idempotence and compatible ring/module structures using G2.8's
coherent commutative localization. For a prime p, the complement of
(p) gives spectrumPrimeLocalization E p=E_(p) and
π_n E_(p)=π_n E⊗Z_(p), without connectivity restrictions.
Choose a degree-p sphere representative and its coherent powers;
construct E/p^r as its derived multiplication cofiber, with the
transition E/p^(r+1)→E/p^r induced by(p,id). Construct
spectrumDerivedPrimeCompletion E p=holim_(r≥1)E/p^r using item8.
Prove its map/unit, independence, idempotence and universal property
among spectra with derived function spectrum F^R(S[1/p],E)≃0,
equivalently contractible mapping spaces from every integer shift
Σ^j S[1/p]. An unshifted mapping-space test alone is insufficient. Identify it
with F^R(Σ^(−1)M(Z[1/p]/Z),E) by the actual Moore/telescope duality
comparison. Prove the natural Hom/Ext exact sequence
`0→Ext¹_Z(Z[1/p]/Z,π_nE)→π_n E^∧_p→
  Hom_Z(Z[1/p]/Z,π_(n−1)E)→0`, via a countable free presentation
and its Moore cofibre, and compare it with the cofiber/tower Milnor
sequence. For degreewise finitely generated π_*E prove
π_n E^∧_p=π_n E⊗Z_p; no such tensor formula is claimed for arbitrary
homotopy groups. Construct the completed monoidal/module/ring
comparisons through the derived completed smash
`(E^∧_p∧F^∧_p)^∧_p`; an ordinary smash of complete spectra need
not be complete. Do not assign a commutative ring structure to every
multiplication cofiber E/p^r. For the bounded-below, degreewise finite
type spectra used by HF_p Adams, prove comparison of derived prime
completion with the actual HF_p nilpotent/Adams completion and its
convergence hypotheses. These two completions are not identified
without hypotheses on general unbounded spectra. Degreewise finite
generation plus these comparisons supply the localized/completed
arithmetic descent used by TB, rather than undefined E_(p) notation.

*Needs:* 3.8; G2.8's commutative localization.

**Checks.**

- `HZ^∧_p` has π₀ = ℤ_p = ℤ ⊗ ℤ_p, the finitely generated case of the coefficient formula.
- `HQ^∧_p ≃ 0`, although ℚ ⊗ ℤ_p = ℚ_p ≠ 0: the tensor formula needs finite generation.
- The rationalization of the sphere is `S_ℚ ≃ HQ`, with π₀ = ℚ and no other homotopy.

### 3.10 Unstable skeletal mapping-space continuity (G3.10)

For a CW pair(X,A)
with arbitrary cell sets/dimension, use its actual increasing skeletal
cofibrations and convenient mapping spaces into a supplied Y. Prove
`Map(X,Y)≃holim_m Map(X^m,Y)` and its based/relative versions,
constructing restriction-fibration replacements from the homotopy
extension property and G2.10's mapping-path carriers. The same
statement holds with a specified fixed restriction on A; use the
relative skeleta A∪(relative cells of dimension≤m) for that branch.
Construct the pointed-set π0 Milnor sequence, proving surjectivity
onto compatible component families. Over a chosen coherent reference
family, identify the fibre by the nonabelian lim¹ of the groups
π1 Map(X^m,Y) in those components: it is the orbit set of
`(g_m)·(h_m)=(g_m h_m r_m(g_(m+1))^(-1))` on their product.
Prove choice/conjugation/naturality comparisons, and the positive
mapping-homotopy-group Milnor sequences with the actual higher
loops and connecting maps. When the tower groups are abelian,
identify this orbit set with AT6.0's existing coker(1−shift); do
not replace a nonabelian component problem by an additive lim¹.
Finite-source stabilization formulas and all-CW lift classification
use these unstable maps; the spectral/cohomological Milnor sequences
alone do not supply them. This sublane uses only the earlier
convenient-space/CW foundations, before Brown or stable Spin data.

*Needs:* G2.10; AlgebraicTopology Stages 4–5.

### Examples

- K(ℤ,1) = S¹ and K(ℤ,2) = CP∞ representing ordinary cohomology.
- The phantom map `S_ℚ → ΣHZ` and the lim¹ of the tower multiplied by 2, 3, 4, ….
- `HQ^∧_p ≃ 0` and `τ_(≥0)KU = ku`.

### Dependencies

G3.4's telescope and Milnor construction uses G1 and AlgebraicTopology Stage 6.0 and precedes G3.1 and G3.3; its spectral version uses G2. G3.1 uses G1 and the CW substrate; G3.2 and G3.6 use G2.3–2.5. G3.8 uses G2.4, G2.7 and G2.8; G3.9 follows G3.8. G3.10 uses G2.10 and AlgebraicTopology Stages 4–5.

## G4. Generalized Leray–Hirsch, Thom and Euler theory

### 4.0 Quaternionic bundle and manifold adapters (G4.0)

The topological block
G4.0a and the smooth finite-dimensional block G4.0b below are separate
exports; spectral/classifier consumers need only G4.0a. G4.0a: Use native `Quaternion ℝ` with
continuous multiplication/conjugation and its Euclidean norm. Fibres are
finite-dimensional **right** ℍ-modules, expressed as left modules over
`(Quaternion ℝ)ᵐᵒᵖ`; transition maps commute with the right action. Use
native real VectorBundle ℝ total spaces and local trivializations, with
fibrewise Module ℍᵐᵒᵖ structure and trivializations linear for that action.
Native VectorBundle requires a commutative normed field, so it is not
instantiated with ℍᵐᵒᵖ. Use the corresponding principal Sp(r)-associated
bundle comparison. Use native Projectivization ℍᵐᵒᵖ for right lines and
consume Mathlib's quotient topology on `Projectivization` over a division ring,
`Projectivization.instTopologicalSpace`, and add only
the quaternionic charts/CW and the pinned Grassmannian homeomorphism. Define the Hermitian form
`h(v,w)=Σ_i conjugate(v_i) w_i`, right-linear in w, and construct numerable
bundle metrics by real partitions of unity. The compact group Sp(r) is the
native `unitary (Matrix (Fin r) (Fin r) (Quaternion ℝ))`, with both inverse
equations and the subspace topology. Prove it closed and prove the
entrywise bound ‖gᵢⱼ‖≤1 from g* g=1; boundedness in the finite
product norm selected by Matrix.Norms.Elementwise and
finite-dimensional real compactness then give compactness. Its Lie charts are
the separate G4.0b target below.
Construct the first-column fibration Sp(r−1)→Sp(r)→S^(4r−1),
prove Sp(r) connected and simply connected for r≥1, and use covering
lifting/uniqueness to construct the Spin homomorphism below. For G2.9's
low-dimensional compact Spin comparisons consume native
TauCeti.realSpinThreeEquivQuaternionUnitary and its actual quaternion
conjugation action theorem, and
TauCeti.realSpinFourEquivQuaternionUnitaryProd. Consume
SpinRepresentations L7's Spin(3) continuity/sphere comparison; prove the
Spin(4) map and inverse continuous using its finite Clifford algebra
maps and compact-to-Hausdorff comparison. Construct the calibrated
ℝ⁴≃ℍ isometry carrying the coordinate basis to (1,i,j,k), determine
the native factor order by its generator formulas and prove the resulting
rightHom vector action is v↦q_L v q_R^−1. Pin the full adapter: if
(n₁,n₂) is the native product and u=(1+j)/√2, set
(q_L,q_R)=(u n₂ u^−1,u^−1 n₁ u). This includes inner conjugations
as well as swapping the factors. Prove it intertwines the native odd/even
Clifford multiplication and vector projection, testing all coordinate
generator pairs; a factor swap alone fails already on ι(e₀)ι(e₁).
Compare the corresponding homomorphisms/homeomorphisms; those calibrated factors pin
the G2.9 diagonal/addition/swap generators.
Do not use the commutative-scalar
`Matrix.unitaryGroup` alias or algebraic Sp(2r,ℝ).
Build quaternionicFrameBundle and quaternionic Stiefel spaces. Define
Gr_ℍ(r,N) as the subtype of native Submodule ℍᵐᵒᵖ (Fin N→ℍ)
with native finrank ℍᵐᵒᵖ equal r, with the quotient topology induced
by the span map from full-rank ordered right r-frames. Prove the actual
GL_r(ℍ)-full-frame and Sp(r)-orthonormal-frame quotient comparisons
by continuous quaternionic Gram–Schmidt; use native matrix units for
GL_r(ℍ), not Module.Grassmannian's commutative-ring quotient-rank carrier.
Construct these Grassmannians,
local charts, tautological bundles, orthogonal complements, clutching,
pullback, sum and their identity/composition laws. For a rank-r quaternionic
subbundle E⊂B×ℍ^N construct the continuous finite-Grassmannian classifier
b↦E_b and its actual tautological pullback isomorphism. Pull back the
finitely many coordinate graph charts to obtain a finite trivializing
cover of E; this finite-type conclusion imposes no finite-CW condition
on B. Compare the real/complex versions with TopK T1's finite embedding
and graph-chart interfaces. Prove the finite Stiefel
connectivity bounds and the numerable fixed-rank classification over
paracompact Hausdorff bases. Construct quaternionicUniversalBundle r on
the fixed-rank final-topology Grassmannian, its Schubert CW structure and
compactly generated colimit comparison, following TopK T1.5–6's real/complex
construction. Compare its Sp(r) frame classifier with CC C1.1b's join carrier via
G2.9's general-topological extension, before requiring a smooth Sp model.
Define quaternionicProjectiveSpace n as the native `Projectivization` of
(Fin (n+1)→ℍ) over ℍᵐᵒᵖ, with Mathlib's quotient topology
`Projectivization.instTopologicalSpace`.
Upgrade native Projectivization.equivSubmodule to the homeomorphism
with Gr_ℍ(1,n+1) carrying [v] to span(v). G4.0b later transports
the smooth graph-chart structure onto this single HP carrier; the
present topological construction is independent of that upgrade. Use its same inclusion
maps to define quaternionicProjectiveInfinity. Construct the
characteristic maps giving one cell in dimensions 0,4,…,4n and each 4j
at infinity, along with the actual tautological bundle and inclusions.
Construct the topological block homeomorphism from Hermitian unit vectors
Σ_i ‖v_i‖²=1 in ℍ^n to the native Euclidean unit sphere S^(4n−1),
in ordered blocks (1,i,j,k). Pin the characteristic map on the round
closed disk in ℍ^n by x↦[x,√(1−Σ_i‖x_i‖²)], with the nonnegative
real coordinate last; its boundary is the Hopf quotient to HP^(n−1).
Compose with AT2.5's supBallEuclideanDiskHomeomorph orientation-preserving radial
homeomorphism to type these characteristic/attaching maps on native
RelCWComplex cells. For n=1 construct the actual characteristic
quotient homeomorphism χ:D4/∂D4≃HP1 induced by that characteristic map.
With q_AT:D4/∂D4≃S4 the actual AT4.4
`diskQuotientSphereHomeomorph`, define the based homeomorphism
quaternionicHopfSphereHomeomorph = χ∘q_AT⁻¹ : S4≃HP1.
Prove it sends AT's positive sphere reference class to the positive
(1,i,j,k) characteristic-cell class. Own the radial homeomorphism
quaternionDiskQuotientOnePointHomeomorph : D4/∂D4≃ℍ⁺,
x↦x/√(1−‖x‖²) on the disk interior and boundary↦∞, with inverse
y↦y/√(1+‖y‖²). Prove continuity at∞, quotient/inverse laws and
its degree+1 comparison in the ordered (1,i,j,k) coordinates.
Here D4/∂D4 is AT's actual
`ordinaryPairQuotient (TopCat.disk 4) (diskBoundarySubset 4)`,
with the disk identified through the ordered ℍ≃ℝ4 isometry.
Construct quaternionicAffineOnePointHomeomorph : ℍ⁺≃HP1,
y↦[y:1], ∞↦[1:0], with inverse [v0:v1]↦v0*v1⁻¹ when v1≠0.
Follow native `OnePoint.equivProjectivization` at ℍᵐᵒᵖ, transported
by coordinate unop to the same right-H carrier, and upgrade its
equivalence using Mathlib's quotient topology on `Projectivization`. Prove right-scalar
normalization, continuity and the exact equation
χ=quaternionicAffineOnePointHomeomorph∘
quaternionDiskQuotientOnePointHomeomorph, including the collapsed
point. This owns the positive HP1 affine-chart orientation comparison.
Consume AT4.4's disk-quotient sphere adapter. Also consume native
`onePointHyperplaneHomeoUnitSphere` from
Mathlib.Topology.Compactification.OnePoint.Sphere with fixed unit
normal e0 in ℝ5 and the ordered quaternion-to-e0-perpendicular
linear-coordinate equivalence. Its finite chart at0 lands at−e0;
its derivative there is the identity onto e0⊥, so the outward-first
sphere orientation gives degree−1. Prove this signed reference-class
comparison and construct the actual based transition homeomorphism
between this stereographic route and q_AT. The stereographic route
does not define quaternionicHopfSphereHomeomorph. The generic native
`onePointEquivSphereOfFinrankEq` exists but its arbitrary coordinate
choices alone do not calibrate this sign. No G4.0b smooth
chart or Riemannian metric enters this topological comparison.
Restrict scalars via native `Quaternion.ofComplex`, with i mapped to the
chosen quaternion i, and via ℝ: rank r becomes complex rank 2r and real
rank 4r. Prove coherent sum, metric, transition and Thom comparisons,
the canonical standard real orientation using repeated ordered blocks
(1,i,j,k). Name quaternionSpToSODirect for that direct real map;
name quaternionSpToUComplex and its real composite quaternionSpToSOComplex
for the right-complex basis (1,j), hence real coordinates (1,i,j,−k).
Prove SOComplex=F_r SODirect F_r^−1 with
F_r=diag(1,1,1,−1)^r, retaining the corresponding Spin-cover lift adapters. Consume native
CliffordAlgebra.isCoveringMap_realCliffordSpinDoubleCoverZero_rightHom
for nonzero rank with native
CliffordAlgebra.instCompactSpaceRealCliffordSpinGroupZero supplying its
CompactSpace hypothesis, and SpinGeometry G4.1's frame/negative-form comparisons. For right complex restriction, use the
complex basis (1,j) on each quaternionic block; its real basis is
(1,i,j,−k), so the complex orientation differs by (−1)^r. Carry this
factor into the Thom/characteristic and suspension-coordinate maps.
Construct the Sp(r)→Spin(4r) lift using SpinGeometry G4.1's native-cover
frame/negative-form adapters, with unit, block-sum,
stabilization and permutation compatibility. Group-complete direct sum of
quaternionic bundles on finite CW/compact CW-type pairs and construct
relative/clutching groups for G5's KSp comparison; scalar forgetting gives
the actual additive natural maps to TopK's K/KO groups. No quaternionic
tensor product is asserted to supply a commutative unital bundle K-ring.
This substrate uses the ordinary bundle/CW suppliers and precedes G4's
generalized orientation proofs and G5's Thom models.

G4.0b: construct smooth real manifold structures on the same finite
carriers. Choose the actual complement and identity slice chart supplied by
TauCeti.Lie.exists_isSliceChart_of_isClosed_subgroup, applied to
isClosed_unitarySubgroup_units. Construct the named embedded-Lie data
with Subgroup.chartedSpaceOfIsSliceChart and its native Lie-group,
smooth-inclusion and immersion theorems. Retain this chart construction
definitionally: native
Subgroup.contMDiff_iff_comp_subtypeVal_chartedSpaceOfIsSliceChart
then checks smooth maps into this chosen operator-topology subgroup
by their ambient composite. Transport this criterion to the exported
default-topology carrier as specified below. Its named model is
(lieSubalgebraOfSubgroup (unitarySubgroup (Matrix … ℍ)ˣ)).toSubmodule,
identified ℝ-linearly with skewAdjoint.submodule ℝ (Matrix … ℍ)
by restricting native unitsLieAlgebraLieEquiv, using
unitsLieAlgebraLieEquiv_symm_mem_lieSubalgebraOfSubgroup_iff_mem_skewAdjoint
and EmbeddedLieSubgroupData.lieEquivLieSubalgebraOfSubgroup.
The bare skewAdjoint AddSubgroup is not the real model submodule.
Do not use the model-hidden IsEmbeddedLieSubgroup existence proposition
as this data, or rebuild the generic closed-subgroup theorem. Consume
SmoothBundlesConnections B1.4's proper free-action smooth G/H and
principal-bundle/submersion theorem. The ambient group for Sp(N) is
the native units of Matrix (Fin N) (Fin N) ℍ. Select local native
Matrix.linftyOpNormedRing, Matrix.linftyOpNormedAlgebra,
Matrix.linftyOpTopologicalSpace and Matrix.linftyOpContinuousStar
instances. Prove the identity homeomorphism and norm equivalence with
G4.0a's default entrywise matrix topology and the finite product norm
selected by Matrix.Norms.Elementwise;
use the explicit real block-coordinate linear equivalence to compare with
the fixed Euclidean norm. No native quaternionic L² matrix operator norm
is assumed; do not introduce a transported normed-ring topology or instantiate
commutative-scalar Matrix.GeneralLinearGroup with ℍ. Pin the subgroup
of units to unitarySubgroup (Matrix … ℍ)ˣ and transport its embedded
Lie data to the native unitary (Matrix … ℍ) carrier through
Unitary.toUnits and its actual inverse, with their smooth/topological
comparisons. Compare Sp(N)'s charts with its G4.0a subspace topology.
Identify the skew-Hermitian Lie model with real dimension N(2N+1)
by ordering the diagonal entries in increasing index, each with
coordinates (i,j,k), then the strict-upper pairs in lexicographic order,
each with coordinates (1,i,j,k). Transport through those fixed
coordinates to EuclideanSpace ℝ (Fin (N*(2N+1))). The exported
ChartedSpace/IsManifold/LieGroup instances on Sp(N), the native unitary group of N×N
quaternionic matrices,
use G4.0a's default subspace topology and this Euclidean model, by the
explicit identity homeomorphism and model linear/homeomorphic comparison;
they are not exported with hidden local operator-norm topology arguments.
Export quaternionFrameGroup_contMDiff_iff: a map f:M→Sp(N)
is smooth for this designated Euclidean model exactly when its actual
ambient real-coordinate map is smooth. Use the fixed ambient
EuclideanSpace ℝ (Fin N × Fin N × Fin 4), indexed lexicographically
by row, column, then (re,imI,imJ,imK); it has dimension 4N².
Derive the iff from the native chosen-slice theorem through Unitary.toUnits,
the identity homeomorphism, norm equivalence and fixed model changes.
Gram–Schmidt sections, block embeddings, the Sp(1) diffeomorphism and
B1.4 quotient assembly consume this exported criterion, without requiring
an operator-norm instance in their statements.
For 0≤r≤N,
identify orthonormal r-frames with Sp(N)/Sp(N−r), of dimension
r(4N−2r+1), and right r-planes with Sp(N)/(Sp(r)×Sp(N−r)),
of dimension 4r(N−r). Prove these finite carriers compact Hausdorff,
second-countable and boundaryless. Construct Grassmannian graph charts in
Hom_ℍ(V,V^⊥), identified through chosen orthonormal bases with the fixed
real model EuclideanSpace ℝ (Fin (4r(N−r))); quaternionic Gram–Schmidt
gives local Stiefel charts
over each graph chart with Sp(r) fibre. Prove smooth real transitions
and compare these structures with B1.4's quotient charts/submersions
and G4.0a's full-rank/orthonormal-frame quotient topologies.
Prove tautological and orthogonal-complement bundles smooth, orthogonal
complementation a diffeomorphism Gr_ℍ(r,N)≃Gr_ℍ(N−r,N), and
stabilization/direct-sum maps smooth. Consume TopK T1.5's smooth
graph-chart upgrade of its existing finite real/complex Grassmannian
carriers, with its smooth orthogonal-complement diffeomorphisms,
stabilization/sum and scalar-forgetting maps, its rank-one
diffeomorphisms to the native RP and CP manifold structures and its
interleaved real model transport of K7.1's CP atlas; reuse its
bundles/classifiers and define no second real or complex Grassmannian
manifold here. Those carriers are the smooth targets of the
scalar-forgetting maps Gr_ℍ(r,N)→Gr_ℂ(2r,2N)→Gr_ℝ(4r,4N) owned
here; prove these maps smooth in the quaternionic and supplied graph
charts.
This composite uses real coordinates (1,i,j,−k); name direct real
forgetting using (1,i,j,k) separately and prove its comparison by
diag(1,1,1,−1)^N on the ambient real space, carrying the (−1)^r
fibre-orientation adapter into its Thom maps.
Put the smooth real 4n-manifold structure on the designated native
quaternionicProjectiveSpace n through its pinned rank-one homeomorphism, including
the n=0 point and smooth tautological bundle. Pin a diffeomorphism from
its rank-one Stiefel carrier to the native unit sphere in
EuclideanSpace ℝ (Fin (4n+4)), with repeated blocks (1,i,j,k), and
construct the smooth Hopf quotient S^(4n+3)→HP^n as the Sp(1)
quotient submersion. Pin the acting Sp(1) to the 1×1 quaternionic unitary group,
and compare it by the 1×1-entry group homeomorphism/diffeomorphism with
unitary ℍ used in the native Spin comparisons. For HP use the last
coordinate line: embed Sp(n)×Sp(1) in that ordered block decomposition
and pin the cyclic coordinate permutation comparing it to the general
first-r-plane Gr convention. Prove the Sp(n+1)/(Sp(n)×Sp(1))
diffeomorphism and its agreement with G4.0a's actual attaching maps.
Construct HP^1≃S⁴ as a diffeomorphism using the two affine charts,
pinning its positive reference class by the (1,i,j,k) chart; compare
AT's RP¹≃S¹ and K7's CP¹≃S² sphere adapters for the same exercise.
These targets require no Riemannian metric. RiemannianGeometry R1
consumes these carriers/submersions for normalized round Hopf quotient
metrics, O'Neill and curvature/comparison theorems; DGFloer consumes
the same HP carrier rather than constructing another one.

*Needs:* TopologicalKTheory T1.5–T1.6; Tau Ceti's Spin(4) and embedded-unitary Lie data; SmoothBundlesConnections B1.4; ComplexKahlerGeometry K7.

**Checks.**

- Sp(1), the unit quaternions, is S³ ≅ SU(2), and Sp(N) has real dimension N(2N + 1): 3 for N = 1 and 10 for N = 2.
- HP¹ ≃ S⁴, and HP⁰ is a point.
- With Spin(4) acting by v ↦ q_L v q_R⁻¹, the reflection v ↦ −v̄ conjugates the pair (q_L, q_R) to (q_R, q_L).

### 4.1 Relative Leray–Hirsch (G4.1)

For a numerable locally trivial bundle of CW-type
pairs `(F,F₀)→(V,V₀)→B`, a chosen finite homogeneous free basis of
`E*(F,F₀)` over E*(*) and classes u_i in `E^{d_i}(V,V₀)` restricting to
that basis on every fibre, prove the graded module isomorphism
`⊕_i E^{q−d_i}(B) → E^q(V,V₀)`,
`(a_i)↦Σ π*a_i∪u_i` for every integer q.
Construct its inverse and naturality under pullback, pair maps, change of
basis and maps of theories. Prove the trivial-product step, compatibility
of comparison maps with MV/connecting maps, finite-CW induction and
arbitrary-CW wedge/skeletal/Milnor passage. Prove the numerable-cover
gluing/CW-replacement extension and the countable-open-exhaustion route:
G3.5's Dold refinement and the disjoint-union axiom supply a countable
numerable exhaustion by finite unions of disjoint trivializing pieces.
This argument does not require finite-CW models for those pieces. The relative F₀ is retained
throughout; freeness or a finite basis is not inferred from numerability.

*Needs:* G1; G3.3–3.5.

**Checks.**

- For the trivial bundle X×CPⁿ → X and ordinary cohomology, `H*(X×CPⁿ) ≅ H*(X) ⊗ ℤ[x]/(x^(n+1))`, a free H*(X)-module on 1, x, …, xⁿ.
- For the empty base both sides vanish.

### 4.2 Thom spaces and their comparisons (G4.2)

Use CharacteristicClasses C2.1's
disc/sphere quotient of the native bundle total space, with TopologicalKTheory
supplying its metric finite-bundle data. Prove the comparison with TopK T5's
compact-support/Koszul model, using that one quotient carrier; prove its convenient/simplicial cofiber adapter,
`D(ξ)/S(ξ)` versus deleted-vector relative theory, and
`Th(ε^r⊕ξ)≃S^r∧Th ξ=Σ^rTh ξ`. Include the zero-rank convention `Th(0_B)=B₊`.
For compact Hausdorff B prove the bundle-total-space one-point
compactification comparison; for noncompact B keep the disc/sphere quotient
and distinguish support conditions. External bundles satisfy
`Th(ξ⊠η)≃Th ξ∧Th η` with natural/coherent product maps.

*Needs:* CharacteristicClasses C2.1; G1.2.

**Checks.**

- The Thom space of the zero bundle is `Th(0_B) = B₊`.
- The Thom space of the trivial rank-r bundle over a point is S^r, and `Th(ε^r ⊕ ξ) ≃ S^r ∧ Th(ξ)`.
- The Thom space of the tautological line over RP^n is RP^(n+1).

### 4.3 Orientation data and Thom isomorphism (G4.3)

For a rank-r real bundle ξ an
E-orientation is a chosen `U∈E^r(Dξ,Sξ)` whose restriction to each fibre,
after a chosen local trivialization, is a unit in E⁰(*); the Thom
isomorphism below is Cohen, *Bundles, Manifolds, and Homotopy*,
Theorem 10.40, p. 330. State the local
transition compatibility and the relevant orientation local system; an
untwisted orientation is not automatic for arbitrary real bundles.
Prove `a↦π*a∪U` is an isomorphism
`E^q(B)→E^(q+r)(Dξ,Sξ)` for numerable CW-type bundles, in every q.
Prove pullback, suspension, direct-sum/external multiplicativity for compatible
orientation choices, change by units and comparison with ordinary Thom.
Integral ordinary HZ-orientability agrees with ordinary real orientability;
mod-2 ordinary orientation is canonical for all real bundles. For an
E-module spectrum M, prove the cohomological and homological module Thom
isomorphisms using the action by this E-Thom class, including cap/zero-section
compatibility. M need not have its own unital ring structure; this is the
interpretation used for the shifted KO-module KSp.

*Needs:* 4.1–4.2; G1.4.

**Checks.**

- Every real bundle is HF₂-orientable, while the Möbius line bundle over S¹ is not HZ-orientable, since its first Stiefel–Whitney class is nonzero.
- Complex bundles are HZ- and KU-orientable.
- The Thom class of the trivial rank-r bundle over a point is the suspension generator of `Ẽ^r(S^r)`.

### 4.4 Euler and relative-square identities (G4.4)

Define e_U(ξ) by zero-section
pullback of U, prove naturality, direct-sum multiplication, trivial-positive-
rank vanishing and the nonzero-section consequence. Prove
`U∪U=π*e_U(ξ)∪U` in `E^(2r)(Dξ,Sξ)` and state the zero-section and
diagonal maps producing it. Changing U changes e accordingly. Do not
infer that Euler vanishing alone always produces a section; ordinary
primary obstruction hypotheses remain in CharacteristicClasses.

*Needs:* 4.3.

**Checks.**

- The Euler class of a bundle with a nowhere-zero section vanishes; in particular e(ε) = 0.
- For the tangent bundle of S², `e(TS²)` is twice the positive generator of `H²(S²;ℤ)`, since χ(S²) = 2.
- For an oriented bundle of odd rank, reversing the fibre orientation gives `e = −e`, so 2e = 0.

### 4.5 R/C/H orientations (G4.5)

Define real/complex/quaternionic orientation
data for E to be a chosen reduced class on RP∞/CP∞/HP∞ of degree 1/2/4
restricting to the suspension of the unit on KP¹=S¹/S²/S⁴. These data
are hypotheses when proving orientation-dependent results; their existence
or obstruction for each canonical theory is proved in G5.5. Use CC C1.5's RP∞/CP∞ universal line models
and G4.0's quaternionicProjectiveInfinity model. Orient CP¹ by
ℂ⁺ via (x,y)↦x+iy and HP¹ by ℍ⁺ with ordered real basis (1,i,j,k).
For HP¹ transport the positive S4 reference class through G4.0a's
actual quaternionicHopfSphereHomeomorph = χ∘q_AT⁻¹; its separate
stereographic route has degree−1 and is not this orientation adapter.
Prove the correspondence with normalized,
natural coherent Thom classes for real/complex/quaternionic bundles,
including line Thom identification, finite projective filtration, splitting
and passage to infinite bases. Specify the tautological-versus-dual sign by
the ordinary comparison: with γ the complex tautological line, the HZ Euler
class restricts to − the positively oriented generator on CP¹; a chosen
generalized normalized complex class is x_E=e_E(γ*)=e_E(O(1)); it is
not asserted equal to −e_E(γ). In the ordinary HZ comparison explicitly
identify x_G^HZ=−x_CC=h_AT, where CC C1.5's x_CC=c₁(γ) pairs to −1
and CharacteristicClasses C1.5a's map f_h, whose restriction to
complex-oriented CP¹ pairs to +1, pins h_AT.
For a quaternionic Thom family normalized against the standard real
(1,i,j,k) trivializations, pin for every E
x_H^E=−e_E^std(γ_H)=−e_E^std(γ_H*)=e_E^c(γ_H), where U^c=(−1)^r U^std
is normalized against the right-complex-induced coordinates. Here c
denotes this coordinate normalization, not an assumed complex orientation
of E. The
transported right-H Riesz isomorphism γ_H≃γ_H* preserves the standard
module orientation; duality alone does not change its Euler sign.
The graph identification has degree−1 against U^std and degree+1
against U^c, so for the MSp sphere-unit convention below the normalized
projective class is graph*U^can(γ_H*). Include these signs in the
normalized-Thom-family uniqueness comparison.
The formal inverse relation for generalized Euler classes belongs to
BordismFormalGroups. Prove the projective-bundle theorem for a rank-r
K-bundle V, d=1/2/4 and supplied normalized K-orientation:
E*(P(V)) is a free E*(B)-module on 1,x,…,x^(r−1), where x restricts
to the chosen universal projective class. Define the coefficients a_i(V)
by the monic relation Σ_(i=0)^r(−1)^i π*a_i(V)x^(r−i)=0, a₀=1;
prove a_i=0 for i>r, naturality, splitting injection and Whitney sum.
Pin their line convention a₁(L)=x_L. For quaternionic V with the chosen
coherent standard Thom family prove e_E^std(V)=(−1)^r a_r(V) and
e_E^c(V)=a_r(V), by the splitting injection and Euler multiplicativity;
these use that same family and do not require E complex-orientable.
In the complex case x_L=e_E(L*),
so these are the dual-normalized Chern classes a_i(V)=c_i^E(V*).
The ordinary comparison is a_i^HZ(V)=(−1)^i c_i^CC(V); standard
generalized c₁^E(L)=e_E(L), while c₁^E(γ*)=x and c₁^E(γ) is its
formal inverse, not x. Give the real/quaternionic dual transport and
characteristic-class comparison using G4.0's fixed right-module signs.
Prove E*(KP^n)=E*[x]/(x^(n+1)) with |x|=d. For KP∞ prove the
skeletal maps are surjective, lim¹ vanishes and the completed grading is
E^q(KP∞)≃∏_(j≥0)E^(q−dj)(*)x^j, with its continuous multiplication.
This explicit completion calculation is here; formal laws/universality
remain in BordismFormalGroups. Use the flag/projective splitting injection
to prove uniqueness of normalized natural Thom families with the supplied
projective class and Whitney coherence and the Euler
coefficient comparisons; no uniqueness follows from fibre normalization
alone without that comparison.
For K=ℝ,ℂ,ℍ construct the graph homeomorphism from KP^n minus a
chosen point to the total space of the dual tautological line over
KP^(n−1). Pin the graph map: a line through (v,z), with v≠0, determines
L=vK and the K-linear map f:L→K, f(vq)=zq. For right quaternionic L,
Hom_ℍ(L,ℍ) is a left module by target multiplication; its right-module
transport is f·q=conjugate(q)f. Retain this transport in every bundle
and Thom map, rather than treating the left dual as a right module.
Use a metric
to compare the appropriate underlying real dual and tautological bundles,
recording when this comparison is conjugate-linear and its orientation
sign. The complex-oriented Thom identification uses O(1)=γ*, and its
fibre generator is the chosen complex-oriented CP¹ generator. Construct
the finite KP^n/line-Thom comparison, its stabilization
maps and the infinite-base homotopy equivalence by the actual CW filtration;
the compact-base compactification proof cannot be reused at infinite base.
Prove the associated generalized characteristic classes, sum/naturality/
line-normalization laws and quaternionic real/complex comparison factors.
In ordinary integral cohomology, with Cξ the right-complex restriction
and Rξ the ordered real bundle, prove c_(2j+1)(Cξ)=0,
e(Rξ)=(−1)^r c_(2r)(Cξ). Pin x_H^HZ=−e(γ_H)=c₂(Cγ_H)=h
for the positive HP¹ chart; the right-dual/Riesz graph comparison carries
the fibre conjugation sign. Prove a_i^HZ(ξ)=c_(2i)(Cξ),
p_i(Rξ)=(−1)^i Σ_(j=0)^i a_j(ξ)a_(i−j)(ξ), a₀=1,
and w_(4i)(Rξ)=ρ₂a_i(ξ), with all other SW degrees zero.
In particular p₁(Rξ)=−2c₂(Cξ).
In quaternionic rank1 this is p₁=2e for the specified right-module
orientation; translate sources using the complex-induced real orientation.
Compute the ordinary integral universal quaternionic rings on G4.0a's
**same** fixed-rank classifier BSp(r):
`H*(BSp(r);Z)=Z[a_1,…,a_r]`, |a_i|=4i and
`a_i=c_(2i)(Cγ_r)`. Give generator/restriction/Whitney maps and the
literal comparison with CC C1's Sp(r) frame join classifier. Prove
torsion-freeness and the polynomial presentation through the existing
quaternionic Schubert cells and the universal sphere fibration
`S^(4r−1)→BSp(r−1)→BSp(r)` for r≥1. Identify its total space
with the actual associated sphere bundle S(γ_r), via G4.0a's
first-column Sp(r−1) stabilizer fibration and universal frame/join
comparison, retaining the bundle map to BSp(r) and ordinary
Euler/Gysin sequence. The ordered real orientation gives
`e^std(γ_r)=(−1)^r a_r`; prove its regularity and the graded Gysin
induction, including r=0 with Euler1 and BSp(0)=point. Do not infer
the ring from cellular ranks alone. Export bspCohomologyIntegral and
bspTorusRestrictionChern on these chosen carriers. For the standard
block subgroup Sp(1)^r and its complex-circle torus, with x_j the native
standard-character c1, prove
`a_i↦(−1)^i elementarySymmetric_i(x_1²,…,x_r²)` and restriction
injective over Z and after arbitrary coefficient base change using the
proved torsion-free cohomology/UCT comparisons. Each quaternionic
complex restriction has weights x_j,−x_j. Prove the stable ring
`H*(BSp;Z)=Z[a_1,a_2,…]` via the designated inclusions and
eventual-degree/Milnor comparison. The stable torus restriction lands
in the **degreewise inverse limit** of H*(BT^r;Z), with x_(r+1)↦0;
a_1 restricts to the compatible sums −Σ_(j≤r)x_j², not to a
finite-support polynomial in infinitely many degree2 variables.
Compare HP∞=BSp(1), a_1=h and the ordinary real/symplectic classes
already fixed above. This ordinary-ring sublane uses only the earlier
classifier/CW, ordinary Thom/Gysin and Chern APIs; no bordism coefficient,
odd-primary operation or formal-group universality calculation enters it.
Do not impose these ordinary Chern/Pontryagin identities on general E.
If E also has a chosen complex orientation, its complex roots of a
quaternionic line are t and [−1]_F(t), rather
than t and −t; the actual inverse-law consequences belong to
BordismFormalGroups. For a quaternionic Thom orientation specifically
induced from complex right restriction with the (−1)^r normalization,
prove the corresponding top-Euler identity against that chosen E-class.
The power-series tensor Euler laws and coefficient universality belong to
BordismFormalGroups; a chosen orientation is not its universal coefficient
theorem or an unspecified equivalence of categories.

*Needs:* 4.0–4.4.

**Checks.**

- Ordinary cohomology HZ is complex oriented with the additive formal group law x + y, while KU has a multiplicative law, of the form x + y + u·xy with u a unit of π₂KU.
- HZ is not oriented for all real bundles (the Möbius bundle), while HF₂ is.
- `H*(HP∞;ℤ) = ℤ[a₁]` with |a₁| = 4, the quaternionic projective-bundle theorem for a point base.

### Examples

- HP¹ ≃ S⁴ and the quaternionic Hopf line.
- The Möbius bundle, HZ-nonorientable and HF₂-orientable, and the Euler class of TS².
- `E*(KPⁿ) = E*[x]/(x^(n+1))` for K = ℝ, ℂ, ℍ.

### Dependencies

G4.0a uses TopologicalKTheory T1.5–T1.6 and Tau Ceti's Spin(4) and quaternionic data and precedes G2.9's computations. G4.0b adds SmoothBundlesConnections B1.4, the embedded-unitary Lie data, TopologicalKTheory T1.5's smooth Grassmannian upgrade and ComplexKahlerGeometry K7's sphere adapter. G4.1–4.4 use G1 and G3 for the cell and cover proofs and G2 for the concrete examples; G4.2 uses CharacteristicClasses C2.1.

## G5. Finite duality, Thom spectra and rational Hurewicz

### 5.0 Stable Spin classifier, before Thom/ABS (G5.0)

Construct
stableBSpin as the actual compactly generated mapping telescope of
G2.9's designated bar classifiers BSpin(n+3). Own the coordinate
stabilization homomorphisms here: use the native quadratic isometry
v↦(0,v), with the new coordinate first, and native spinGroupMap/
CliffordAlgebra.map. Prove their continuity and compatibility with
the corresponding SO block inclusions. Own the Spin block-sum
homomorphism Spin(p)×Spin(q)→Spin(p+q), using the two native
Clifford embeddings and commutation of their even images. Prove
continuity, unit/composition/associativity and permutation coherence,
with all associated-bundle identifications. Consume SpinGeometry G4.1's
native covers, not a nonexistent stabilization export. Use that same
product-preserving bar carrier for every finite rank, with its associated
real rank-n universal bundle and comparison to CC C1's numerable join
classifier; prove continuity and coherent stabilization of the maps and
bundle isomorphisms. Prove these Lie groups well-pointed via actual
unit-neighbourhood cofibrations, use item1 of GT's
[smoothing-and-triangulation comparison](../GeometricTopology/README.md#the-smoothing-and-triangulation-comparison)
for compact-manifold finite CW type for the finite Spin groups/products, and prove the
proper bar realization has CW type via its degeneracy cofibrations and finite-product CW
comparison. Supply compatible CW models/cellular approximations of
the stabilization maps, preserving their bar comparisons and homotopies.
Construct the telescope CW comparison, basepoint,
cofinal-rank equivalences and finite-rank maps
spinClassifyingSpaceToStableBSpin. Compose the finite native Spin→SO
covers with TopologicalKTheory's sole stable BSO classifier/bundle
comparison to construct stableBSpinToBSO. Its underlying rank-zero
real class is the compatible diagram [γ_n]−[ε^n], not a purported
finite-rank universal bundle on the telescope. Compare its stabilization
with the same oriented BO model; do not build another BSO carrier.
Prove the homotopy-cartesian finite-rank lift comparisons for n≥1
and for the separate geometric μ2 rank0 branch, and the stable
homotopy-fibre sequence Bμ2→stableBSpin→BSO, with the actual native
double-cover classifying maps. At ranks1,2 include their distinct
low-rank groups; native Spin(0) is trivial, while the geometric μ2
rank0 structure branch has its separate map through positive-rank
stabilization. Prove each branch's comparison rather than identifying
these two rank0 groups.

Export stableSpinClassifierEquiv on every CW base and CW pair:
for a supplied stable oriented real classifier, the actual space of
stable Spin lifts is its derived mapping-space fibre, with projection
homotopies, relative boundary lifts and homotopies over that classifier.
Prove agreement with stabilized principal Spin/frame data, pullback,
isomorphism and stabilization; include the empty base and rank0.
Construct the unit/block-sum maps and the compatible associativity,
permutation homotopies from the stabilized Clifford/bundle constructions.
Export the actual based telescope homotopy
stableBSpinToBSO_blockSum:
stableBSpinToBSO∘μ_Spin ≃ μ_BSO∘(stableBSpinToBSO×stableBSpinToBSO),
where μ_BSO is TopK T1.6c's designated
`stableOrientedGrassmannianWhitneySum`. Build it from the specified
finite-stage group/bundle comparisons together with their oriented
stabilization and block-sum coherence homotopies on the two-index
telescope, then its cofinal diagonal comparison. On the equal-rank k
diagonal consume the proved finite restriction ε_k·Whitney,
ε_k=(−1)^(k(k−1)/2), and retain that orientation in the actual
tautological pullback and Spin/frame comparisons. The coordinate
interleaving is i↦2i, j↦2j+1. Natural ordered frames for simultaneous
prepend differ by (−1)^k; the normalized based-lift restrictions
instead satisfy the strict oriented diagonal identity because
ε_k ε_(k+1)(−1)^k=1. Consume TopK's actual finite rank/ambient
squares and its comparison with the natural stable Whitney class,
including a fresh-trivial-line rotation for k≡2,3 mod4. This path
changes the underlying plane and is not pointwise unit-relative at
a finite stage. Retain the based stable normalization, orientation-
preserving stabilized bundle comparisons and parameter-boundary
law homotopies.
Apply their closed-CW homotopy-extension rectification and paired-
tower/product comparison, retaining unit-relative endpoints and
associativity/commutativity comparison prisms. The resulting based
telescope homotopy is actual data; finite-stage agreement without
these coherences does not rule out phantom errors.
Prove agreement with the finite-rank
structure operations before applying any characteristic class.
For arbitrary CW X use actual coherent skeletal finite-rank models
and G3.10's unstable mapping-space/Milnor comparison, including the
appropriate component and lim1 term.
Only for finite X identify maps into stableBSpin with the cofinal
finite-rank colimit of [X,BSpin(n)]; a general all-CW classification
is not obtained by this finite-source formula.
Prove stableBSpin_isThreeConnected from the finite cover/LES and
stabilization connectivity, beginning with Spin3's quaternion sphere
and the actual lower-rank sphere fibrations. This construction and
classification sublane uses G2.9/G3/CC finite classifiers/Spin finite
covers/TopK's stable bundle comparison, before G5's Thom spectra, ABS,
TB coefficient calculations and String data.

As a separate inverse/coherence supplement, consume TopK T7.0's
`stableOrientedGrassmannianInverse` and its left/right block-sum
nullhomotopies. That supplier uses the based shear
(x,y)↦(x,μ(x,y)) on AT4.5's k-CW product: its map on positive
homotopy groups is (a,b)↦(a,a+b), and full CW Whitehead with the
pointed upgrade supplies an actual based homotopy inverse.
Projecting that inverse at (x,*) constructs the BO inverse and its
cancellation homotopies; the BSO map is its based covering lift.
These maps are constructed before any coefficient or Bott-table
calculation. Lift its composition with
stableBSpinToBSO using CC's actual Spin obstruction and
stableSpinClassifierEquiv: `w2(−ξ)=w2(ξ)+w1(ξ)^2`, so it vanishes
for this oriented Spin class. Fix the unit lift. Prove the based lift
space contractible on the3-connected universal source. Derive BSO's
based inverse-of-sum homotopy from TopK's left/right cancellation
and Whitney associativity/commutativity homotopies. Compose it with
stableBSpinToBSO_blockSum, and lift on the finite powers BSpin^r
with the unit fixed. Export the resulting unit, left/right
cancellation, double-inverse, inverse-of-sum and naturality homotopies,
with their compatible comparison prisms from the coherent stage
diagrams. These based lift spaces on3-connected finite powers control
lift choices; they do not supply a missing BSO homotopy. Unbased
lift spaces retain their automorphisms. No finite-rank complement
over infinite BSpin is presumed. Constructor,
classification and3-connectivity above precede this inverse
supplement and remain independent of it.

As a separate low-homotopy supplement, consume TopologicalKTheory T7.1's
eight stable Bott equivalences on ℤ×BO and its real coefficient groups,
through TopK's exact stable bundle comparison. Export
stableBSpin_homotopyGroupsThroughEight: π1,π2,π3,π5,π6,π7 vanish,
π4≅Z and π8≅Z, with actual basepoints and stabilization maps. Pin
π4's generator by the Spin lift of G4.0a's quaternionic Hopf line
on its cell-characteristic/compactification HP1 carrier. Consume
G4.0a's actual characteristic-quotient/sphere homeomorphism and
G4.5's positive (1,i,j,k) orientation convention;
this uses no G4.0b smooth HP diffeomorphism. Retain the actual
tautological clutching map, calibrated Spin lift, CW/classifier
comparisons and stabilization. Define h_S4:S4→HP1 to be the actual
quaternionicHopfSphereHomeomorph, and define χ_H:HP1→stableBSpin
from that Hopf-line Spin lift. The π4 generator is the based class
of χ_H∘h_S4. Export stableBSpin_hopfGenerator_cTwo as the correctly
typed equation `⟨c2(Cγ_H),(h_S4)_*[S4]⟩=+1` in H4(HP1;Z),
with c2(Cγ_H) in H^4(HP1;Z), on these fixed carriers and orientations.
StringOrientation consumes this sign when it proves λ=−c2;
this supplement neither defines λ nor presumes String's connected
cover theorem. It precedes those String calculations and does not
use MSpin/ko coefficient or ABS conclusions as a Bott proof.

*Needs:* G2.9; TopologicalKTheory T1.6, T7.0 and T7.1; CharacteristicClasses' Spin obstruction.

**Checks.**

- π_i of stable BSpin for i = 1, …, 8 is 0, 0, 0, ℤ, 0, 0, 0, ℤ, as stableBSpin_homotopyGroupsThroughEight states; BSpin is 3-connected.
- `w2(−ξ) = w2(ξ) + w1(ξ)²`, which vanishes for an oriented Spin class.

### 5.1 Finite spectra and Spanier–Whitehead duality (G5.1)

Finite cell spectra are
generated from integer suspensions of S by finitely many cofiber attachments;
finite spectra include retracts (for the duality: Cohen, *Bundles,
Manifolds, and Homotopy*, Theorem 10.43, p. 334). Construct `DP=Fᴿ(P,S)`, evaluation and
coevaluation with both triangle identities. Prove finite spectra dualizable,
biduality, duality of smash and suspension, natural reversal of maps and
exact triangles. Prove `DP∧ᴸE ≃ Fᴿ(P,E)` for finite P and every spectrum E,
without imposing connectivity on E. Derive
`E^q(P)≃E_(−q)(DP)`, including product/pairing compatibilities.
Prove the equivalence of finite-retract, compact and dualizable descriptions
in the stable category. Infinite suspension spectra do not acquire duality
merely from the existence of a function spectrum.

*Needs:* G2.4; G3.7.

**Checks.**

- `D(Σⁿ S) ≃ Σ⁻ⁿ S`, and `D(S ∨ S) ≃ S ∨ S`.
- `E^q(S) = π_(−q)E = E_(−q)(S) = E_(−q)(DS)`, the duality isomorphism for P = S.
- D(0) = 0 for the zero spectrum.

### 5.2 Geometric duality adapter (G5.2)

Obtain a smooth Euclidean embedding for a
compact boundaryless smooth M from Mathlib's actual embedding theorem and
its dimension/separation hypotheses. Use GeometricTopology's general normal
bundle and tube, and construct the unframed collapse `S^N→Th ν` here by
collapsing the tube complement (Atiyah duality: Cohen, Theorem 10.46).
Prove continuity at infinity and compare
two embeddings after stabilization via the isotopy/normal-bundle comparison.
Construct the stable normal Thom object and the coevaluation/evaluation proving
`DΣ∞M₊ ≃ Σ^(−N)Σ∞Th ν`. Prove independence of embedding, stabilization
and metric, and compatibility with generalized Thom orientations and
cap/fundamental-class duality. Do not substitute a stably trivial tangent
framing for arbitrary ν. GeometricTopology supplies the general normal
bundle, tube and transversality APIs; this milestone owns the unframed
Thom collapse and stabilized embedding/normal comparison for duality.

*Needs:* 5.1; GeometricTopology Layer 1.

**Checks.**

- For M a point, `Th(−TM) = S = D(M₊)`.
- For M = Sⁿ with stably trivial tangent bundle, `D(Sⁿ₊) ≃ Σ⁻ⁿΣ∞Sⁿ₊ ≃ S ∨ S⁻ⁿ`.

### 5.3 Thom spectra from diagrams (G5.3)

Define the category of compatible
numerable bundle diagrams: its objects carry actual rank-r_i bundles ξ_i over CW-type B_i with specified
stabilization pullback isomorphisms and r_i increasing cofinally. Its
morphisms carry base maps and compatible bundle isomorphisms; define
identity/composition, homotopies, stabilization and cofinal reindexing.
From a diagram form the prespectrum indexed by ranks r_i via actual
suspension/Thom maps, and construct its prolongation to all integer
levels: its stable object is the homotopy colimit of
`Σ^(−r_i)Σ∞Th ξ_i` with those maps. Prove the cofinal-rank/prolongation
comparisons with the ordinary sequential model rather than treating a
rank jump as a single suspension. Require
along each base map B_i→B_j, pullback ξ_j≅ε^(r_j−r_i)⊕ξ_i, with the trivial block on the left; compare
the other order through the block-swap map and its orientation sign. Include
arbitrary compatible maps of such diagrams, homotopies and cofinal reindexing.
Transport it by G2's sequential/symmetric comparison into the chosen model
and prove stable-type invariance, its finite-stage/stable-group formula and
homology Thom comparison. A colimit of unrelated Thom spaces is not a Thom
spectrum. For multiplicative models require a genuinely coherent
symmetric bundle diagram with permutation actions and block-sum maps,
rather than only multiplication on cohomology groups. Build its symmetric
Thom ring spectrum directly and prove the module/ring diagrams on Thom
spaces. Supply the comparison with the sequential additive model. A bare
sequential multiplication up to homotopy retains G3's phantom ambiguity.

*Needs:* G2.4; G2.9; G4.2.

**Checks.**

- The diagram of rank-zero bundles gives the sphere spectrum.
- `π₀MO = ℤ/2` and `π₀MU = ℤ`.
- Over the empty base the Thom spectrum is the zero spectrum, since the Thom space of a bundle over ∅ is a point.

### 5.4 Canonical examples and maps (G5.4)

Construct S and HA as in G2. Construct
MO, MSO, MU, MSpin and MSp as commutative symmetric Thom ring spectra
from explicit universal structured-bundle models with their permutation
and block-sum actions. Include the classical finite ambient Grassmannian
models, their cofinal stabilized classifier comparison and all compatible Thom maps; transport
across the real/complex/quaternionic suspension-coordinate comparisons
with the positive-model monoidal/commutative-ring hypotheses from G2.
Pin the coherent Grassmannian models in K^∞⊗_ℝ ℝ^n for K=ℝ,ℂ,ℍ,
with Σ_n acting on the ℝ^n factor; block concatenation identifies the
two ambient summands with K^∞⊗_ℝ ℝ^(p+q) without an arbitrary pairing
K^∞⊕K^∞≃K^∞. Pin MSO's frame-quotient action
f↦(1⊗P_σ)fP_σ^−1: on orientation data it is
o↦sgn(σ)(1⊗P_σ)_*o. Prove its unit equivariance and block-swap
commutativity; transporting the plane orientation without this twist
fails those equations for odd permutations.
Compare these models and bundles with CC/TopK's O/SO/U carriers and
G4.0's Sp carrier. For Spin use G5.0's already designated finite-rank
product-preserving bar models, associated real bundles, stabilization
maps and stable classifier comparisons. The canonical MSpin ring uses the native Spin(0)={1} and
MSpin₀=S⁰; for n≥1 use the chosen double-cover groups. Retain the
geometric μ₂ rank0 branch for structured bundle diagrams and prove its
positive-rank cofinal/stable comparison, without treating it as the ring's
level0 unit. Spin's finite stages use the bar filtration, not a supposed
free homogeneous finite ambient Spin quotient.
Construct the required topological Pin(n) extension using the
native real Clifford algebra with Q(v)=+Σ_i v_i² (Pin⁺): generate its unit subgroup by norm-one
vectors and central−1, and use the parity-twisted conjugation on vectors.
This is a subgroup of Clifford units, not native pinGroup for that
positive form: star(ιv)·ιv=−Q(v), so its unitary predicate excludes
positive unit vectors. Prove the even-part comparison with native Spin.
For n≥1 prove the central double cover Pin(n)→O(n) and even Spin restriction;
Prove continuity and the chosen low-rank central-kernel convention.
Compare the positive and TopK T7 negative even algebras by
e_i e_j↦−f_i f_j, Cl(n,0)⁰≃Cl(0,n)⁰, and identify their Spin actions
and vector covers. Supply graded Morita comparison through the
exterior module for Cl(n,0) graded-tensored with Cl(0,n), retaining
the inverse degree/Clifford/Bott convention. Prove compatibility with the
chosen SpinGeometry cover. Permutations act through conjugation by Pin(n) lifts, whose
central-sign choices give the same conjugation; prove the action on
bundle/Thom data and all unit/block-sum coherence. Include low-rank
central-kernel conventions and comparison with CC's join model.
Consume G2.5's actual Φ/L_k imaginary-loop functors and their proved
positive commutative-ring comparisons for the S²/S⁴-indexed models. Abstract
stable bundle classes or join classifiers alone do not provide strict
multiplication. TangentialBordism's
ξ-normal lifts consume these diagrams and do not supply this construction. Prove the
spectral maps for forgetting oriented/spin/complex/symplectic structures
commute with stabilization, product and the chosen ordinary Thom maps.
Compare the bar SO model with the oriented-Grassmannian model by the
mixed free space E_bar SO(n)×V_n(ℝ∞⊗ℝ^n); both projections induce
levelwise equivalences of associated Thom spaces. Pin their twisted
permutation/unit/block-sum diagrams, giving a commutative-ring zigzag.
Spin→SO is a map between the bar Thom models followed by this zigzag.
Define MU^(2)_n=Th γ_ℂ^n and MSp^(4)_n=Th γ_ℍ^n with the
stated ambient/block models. Pin the quaternionic→complex ambient
identification ℍ^∞⊗_ℝℝ^n→ℂ^∞⊗_ℝℝ^(2n) by
e_m q⊗x_a↦e_m z₁⊗x_(2a)+e_m z₂⊗x_(2a+1), with q=z₁+jz₂.
Thus labels (m,a,b) go to (m,2a+b), with b=0 the 1-component and
b=1 the j-component. Prove this isometry's finite-stage/cofinal,
unit, block-sum and δ_2 block-permutation diagrams; grouping by b*n+a
would give a different action. For MSp^(4), pin its sphere-unit and
stabilization parameter map from standard ℝ⁴ to the trivial right-H
line by (a,b,c,d)↦a+bi+cj−dk, the real coordinates induced by the
right-complex basis (1,j). Use this identification in every block and
all unit/structure/permutation diagrams. Its Thom orientation relative
to G4.0a's standard (1,i,j,k) orientation differs by (−1)^n in rank n;
carry this conversion into universal Thom classes, coefficients and
forget maps. Quaternionic→complex then intertwines the actual S⁴
unit over the identity real sphere scalar, and sends pi0 unit to +1.
A naive standard-H unit followed by complex coordinate forgetting has
fibre degree−1 and is not this unital map. Spectral quaternionic
real/spin forgetting, before comparison with the route through MU,
uses quaternionSpToSOComplex and its Ad_x Spin lift, with the same
complex-induced coordinate embedding; prove its actual conjugation/reflection adapter to G4.0a's
standard real Sp→SO/Spin maps and its agreement with forgetting through MU.
Complex→oriented real first gives
MU^(2)→δ_2^(1)MSO; applying L_2
gives MU→L_2δ_2MSO←MSO. Quaternionic→complex similarly compares
MSp^(4)→δ_2^(2)MU^(2), then applies L_4 and χ_(2,2), giving
MSp→L_4δ_2^(2)MU^(2)←MU. Prove G2.5's change-index
zigzags. Prove the composition diagrams, all coordinate/orientation signs
and equivalences; do not assert a level map MU_n→MSO_n between these
differently indexed Thom spaces.
Give generalized theories on **spaces and pairs**, not only coefficients at
a point. Apply G2.8's multiplicative machine to the skeletal enriched
topological categories: objects r≥0, endomorphism spaces
U(r) or O(r), and no morphisms between different ranks. Block sum is
literal r+s; tensor is rs with the lexicographic Kronecker convention,
using basis index (i,j)↦i·s+j. The ordered block/permutation matrices
specify symmetry. The (r+s)⊗t block distributivity is literal;
r⊗(s+t) uses (i,j)↦i·s+j if j<s and
(i,j)↦r·s+i·t+(j−s) otherwise, in the target block order.
Prove every bipermutative equation and its comparison with the nonskeletal inner-product category.
Construct connective ku/ko as commutative spectral rings and compare
their group-completed classifying spaces with ℤ×BU/BO. Invert the
chosen degree2/degree8 Bott classes by G2.8's commutative localization
to construct KU/KO, with multiplication, unit, module categories and
agreement with TopK's tensor/coefficients. Construct the actual
spectrum structure maps and space-level Bott equivalences, consuming
TopologicalKTheory T7.1's eight stable Bott equivalences on ℤ×BO and supplying the complex
Ω²(ℤ×BU)≃ℤ×BU comparison with the chosen Bott class.
Use G3.8's generic coreflection to identify τ_(≥0)KO with this ko
and τ_(≥0)KU with this ku via their canonical maps, and compare
positive KO-cover coordinates with the real Bott loop chain. This
specialization follows construction of the models; it is not an
input to the earlier generic cover functor.
Prove agreement with TopK's bundle/compact-support/relative theories on
finite CW pairs and compact Hausdorff pairs of CW homotopy type. For
infinite CW spaces use represented K=[Σ∞X₊,Σ^qKU/KO], and compare
it with finite-skeleton bundle groups through the skeletal Milnor sequence;
for general compact Hausdorff spaces retain TopK's bundle theory and give
comparison maps only under the stated CW hypotheses. The Cantor-set test
distinguishes bundle K⁰ from the singular represented theory.
Define quaternionic KSp:=Σ⁴KO as a KO-module, so KSp^q=KO^(q+4).
Multiplication by the degree−8 real Bott unit gives the specified
isomorphism to KO^(q−4). Pin the quaternionic rank-one generator at a
point by [ℍ]=a·b⁻¹, with precisely TopK T7's Cl(0,4) generator
a∈KO⁻⁴ (raw volume acts by −1 on the even part) and its
b∈KO⁻⁸, satisfying a²=4b, c(a)=2u² and c(b)=u⁴.
Name kspRealForget:Σ⁴KO→KO as multiplication by a, and
kspComplexForget:Σ⁴KO→KU as multiplication by u² after Σ⁴c.
Prove these are the actual coherent module forgetting maps in the
quaternionic-bundle comparison, not just coefficient matches; they send
[ℍ] to 4 and 2 respectively. Retain the Bott/Morita adapters before
comparing a positive-Clifford model to this named negative-Clifford a.
Build its quaternionic-bundle comparison on
finite CW pairs with G4.0's bundle groups; it is not declared an
independent unital ring under quaternionic tensor product.

*Needs:* 5.3; G2.5; G2.8; TopologicalKTheory T7.1.

**Checks.**

- `π₀MU = ℤ`, `π₂MU = ℤ` and the odd homotopy of MU vanishes.
- `π_*KU = ℤ[β^(±1)]` with |β| = 2, and π_i KO for i = 0, …, 7 is ℤ, ℤ/2, ℤ/2, 0, ℤ, 0, 0, 0.
- `π_n HA = A` for n = 0 and 0 otherwise, as in G2.7.

### 5.5 Orientation example interfaces (G5.5)

Give the actual chosen canonical Thom
orientation and comparison maps for every example in this table. Prove
negative claims from their obstruction/coefficient computation, not a lack
of a named map. H(A) denotes a commutative coefficient ring A.

| Theory | Structures with the supplied Thom orientation |
| --- | --- |
| H(A) | oriented real, complex and quaternionic bundles; all real bundles when 2=0 in A |
| HZ | oriented real, complex and quaternionic; the real-all-bundles orientation fails since the RP² degree-2 attachment obstructs the required unit class |
| MO | all real, hence oriented real, complex, spin and quaternionic through forgetful maps |
| MSO | oriented real, hence complex, spin and quaternionic through forgetful maps |
| MU | complex and quaternionic via their underlying complex bundles |
| MSpin | spin and quaternionic via G4.0a's direct standard-orientation lift Sp→Spin; an arbitrary complex bundle requires its actual spin lift |
| MSp | quaternionic bundles |
| KU | complex, hence quaternionic bundles |
| KO and its shifted module KSp | spin, hence quaternionic bundles via G4.0a's direct standard-orientation lift, using the KO spin Thom orientation target below |

**Structured ordinary complex augmentation and scalar change.** Use the
single commutative Thom model MU of item4, TopK T1.5's finite complex
Grassmannians and T1.6a's fixed-rank Gr_r∞ carriers, with their Schubert
characteristic maps and pinned ambient/rank inclusions. Build the Thom
CW structure by bundle trivializations over the characteristic discs;
a base cell of real dimension d gives a Thom cell of dimension d+2r.
Construct levelwise and cofinal comparisons with item4's ℂ^∞⊗ℝⁿ
ambient and actual bundle/Thom structure maps, with strict compatibility
at the bottom sphere-unit cell. Retain the stabilization, permutation,
product and positive-flat commutative-model comparisons of these maps.
For zero-based pivots τ₀<⋯<τ_(r−1), prove the complex Schubert-cell
dimension is Σ_(i<r)(τ_i−i). After rank-r Thom desuspension the degree
is 2Σ_(i<r)(τ_i−i): the bottom τ_i=i gives degree 0 and every other
cell has degree≥2. Deduce MU connective and its unit cofiber 2-connective.
Deduce muCoefficientZeroIso:π₀MU≃ℤ from this unit and G3.8's positive
sphere-degree normalization.
Normalize the MU Thom class in G2.5's interleaved complex coordinates
`(e₀,ie₀,…,e_(r−1),ie_(r−1))`, matching CharacteristicClasses' canonical
complex real orientation and G4.5's rank-one normalization.
Prove its actual G2.5 comparison from grouped real/imaginary coordinates,
whose permutation sign is ε_r=(−1)^(r(r−1)/2). Retain the mixed block
shuffle in Whitney products, with
`ε_(r+s)=ε_r ε_s (−1)^(rs)`, and the unit/stabilization diagrams.
The chosen normalized class restricts to +Σ^(2r)1 on each ordered fibre.
Apply G3.8's P0 to the specified connective cofibrant model cMU.
Choose once a commutative comparison `P0(cMU)→Hℤ` between the specified
replacements inducing muCoefficientZeroIso, and compose it with
`cMU→P0(cMU)` to construct complexThomOrientation_to_HZ.
Give its actual commutative-ring representative, the comparison zigzags
to the designated MU and Hℤ, and its contractible full derived
mapping-space uniqueness. Prove it carries the normalized MU Thom
class to this item's ordinary Thom class over the full base, using
the ordinary Thom isomorphism and fibre unit+1 on each component.
Prove pullback, stabilization, external/Whitney product, zero-section
and relative-boundary diagrams with these same coordinate comparisons.
In particular, `x_MU=e_MU(γ*)` maps to
`e_HZ(γ*)=−e_HZ(γ)=−c₁^CC(γ)=h_AT` under G4.5's convention.

Construct restriction and derived extension of module scalars along
this fixed structured map on G2's actual module categories. Prove the
free/forgetful Quillen and coefficient-model invariance comparisons
with compatible cofibrant/flat replacements. For a cofibrant spectrum
E the free cMU-module cMU∧E is cofibrant; construct its balanced-tensor
cancellation and derived-associativity comparison. Transport this to
freeMU_HZ_baseChange for every spectrum E:
`Hℤ⊗_MU^L(MU∧^LE)≃Hℤ∧^LE`.
Prove its unit, naturality, integer shifts, cofibers and external products.
For E=Σ∞Y₊ and actual CW-pair quotients identify its homotopy groups
and connecting maps with G2.7's single ordinary integral homology theory.
Scalar change of an arbitrary MU-module is not identified with ordinary
homology of its underlying spectrum.
Export muHZThomEulerBaseChange: for a numerable complex rank-r bundle
ν over a CW-type base, scalar change carries its chosen MU Thom-module
isomorphism and actual zero-section map to the normalized Hℤ Thom-module
isomorphism and cap action of `c_r^CC(ν)=e_HZ(ν)`, consuming
CharacteristicClasses C3.2's top-Chern/Euler comparison in its canonical
complex real orientation. State the two
homological suspensions as `MU∧B₊→Σ^(2r)(MU∧B₊)` and
`Hℤ∧B₊→Σ^(2r)(Hℤ∧B₊)`; retain the bundle Thom object and actual
coefficient-model maps in the derived comparison square. The target
suspension lowers homology degree by 2r. Include r=0/Euler1, empty
bases, all components, naturality and relative cofibers.

**G5.5-ABS: bundle ABS orientation.** Construct the KO Thom orientation
for a real spin bundle by the actual
real graded Clifford-module/Koszul family, with local Spin equivariance,
stabilization, product and the Bott unit. Consume TopK T7's algebraic ABS
coefficient comparison and supply this missing bundle/spectrum refinement
here. SpinGeometry G5.0/G6.0 supplies the actual real spinor bundle,
Clifford-graded Dirac operator and analytic KO class. TangentialBordism
B3.0 owns the geometric α map, its normalized Dirac comparison and
complexification/Â genus; Index retains its analytical numerical
index and Rokhlin theorems. These are consumers of this orientation,
not inputs to its construction.
Pin U_KO^std and U_MSpin^std on quaternionic bundles by the direct
lift in G4.0a. The spectral MSp→MSpin→KO composite uses the
complex-induced coordinate lift and supplies U_KO^c; prove globally
U_KO^c=(−1)^r U_KO^std over BSp(r) and every pullback base.
With positive Clifford generators indexed from zero, take
x=e₃e₇⋯e_(4r−1)∈Pin⁺(4r); its twisted adjoint is F_r and
the complex-induced lift is Ad_x of the direct lift. Prove the actual
bundlewise ABS module isomorphism m↦x·m in the positive-Clifford
operator model. In TopK's negative Cl(0,4r) module convention use
x⁻=f₃f₇⋯f_(4r−1); prove its twisted adjoint is F_r and its
Ad_(x⁻) intertwines Ad_x under eᵢeⱼ↦−fᵢfⱼ. This even-algebra
comparison does not send an odd x to an odd element. The corresponding
module isomorphism in each convention has grading and Clifford
multiplication signs (−1)^r, with the grading operator correcting
the odd-r Clifford sign. Grading reversal is additive negation in ABS,
giving this equality of Thom classes over the whole base, with sum,
stabilization and the chosen Morita comparisons. A fibrewise equality
alone does not determine the global class. Apply the same actual
conjugacy to compare the two MSpin Thom families: stabilize by one
real line and compensate an odd reflection on that line, so the total
map is orientation-preserving and has an actual Spin lift. Use its
inner-conjugation homotopy and the degree−1 map on the added S¹
suspension coordinate to prove U_MSpin^c=(−1)^r U_MSpin^std
stably, including the even-r identity and all stabilization diagrams.
For arbitrary bases including BSp(r), use the actual constant Pin
operator/module isomorphism, or compose this global MSpin identity
with the ABS ring map to obtain the global KO identity. Equality on
separate finite skeleta is not used to discard a possible lim¹ class.
Pin the spectral ABS route as an E∞ map, using the coherent real
Clifford/operator model and a multiplicative comparison with G2.8's KO.
For 𝕜=ℝ,ℂ take H_n=L²(ℝ^n;𝕜), graded by reflection, and Cl_𝕜(n,0)
with self-adjoint positive generators. The operator C*-Clifford is a
separate *-algebra model. In the real case construct an actual real
algebra isomorphism to native Cl(n,0) intertwining its * with native
reversion. In the complex case use ℂ⊗_ℝ Cl(n,0), with involution
conjugation⊗reversion, or the complexified quadratic-form algebra with
its corresponding conjugate-linear involution; prove the actual
complex algebra/* comparison. Native
CliffordAlgebra.star negates odd vector generators; do not replace that
global instance. Construct the finite-dimensional C*-norm/matrix models
and graded tensor isomorphisms, with the complex graded conventions below.
For complex compact and spatial APIs consume CStarAlgebras C5 and
HilbertModules H2, H4–H6. Own here the complex graded Clifford conventions:
ℤ/2-graded C*-algebras, graded Hilbert modules, graded tensor products and
adjointable operators built on HilbertModules H1–H4; complex Clifford
algebras with odd self-adjoint generators, e_i²=1 and e_ie_j=−e_je_i for
distinct i; the matrix model Cl₂→M₂(ℂ) with e₁↦[[0,1],[1,0]] and
e₂↦[[0,i],[−i,0]], graded by conjugation with diag(1,−1); and the swapped
two-odd-factor period reduction Cl₁⊗̂Cl₁→Cl₂, e⊗1↦e₂ and 1⊗e↦e₁, with its
sign adapter (−1)^(pq) to the unswapped reduction and to the ordered
geometric Clifford coordinates and Bott class. Build the real and
finite-Clifford extensions here.
**G5.5-Classifiers: operator classifying spaces.** Define
K_op,n=Hom_gr,𝕜,*(C₀(ℝ;𝕜),Cl_𝕜(n,0) graded-⊗_𝕜 K(H_n)),
with point-norm topology and zero homomorphism as basepoint. For ℂ
prove Cl_ℝ(n,0) graded-⊗̂_ℝ K(H_n)≅Cl_ℂ(n,0) graded-⊗̂_ℂ K(H_n),
respecting conjugation⊗reversion and the given scalar action. Build the
remaining graded compact-operator/spatial-tensor and odd self-adjoint
multiplier functional-calculus adapters for these specific Hilbert/Clifford
models. Prove the functional-calculus identification with compact-resolvent
odd self-adjoint regular Clifford-linear operators on their essential
support in H_n⊗Cl(n,0). Degenerate homomorphisms have a complementary
zero representation; the zero homomorphism has empty support. Use the
topology induced by all f(D), not an unjustified norm topology on bounded
transforms. Construct the bounded transform and real/complex graded
Clifford family index, with finite-rank perturbation/stabilization and
homotopy/pullback laws; ordinary ungraded kernel dimension is insufficient.
Compare it with TopK's finite-dimensional ABS classes and Morita degree.
For n≥1 prove [X,K_op,n]_unbased≃KO^n(X) or KU^n(X) for finite
CW X; the based version gives reduced groups and relative pairs are included, via stabilized Fredholm/spectral cutoffs
and contractible Clifford-linear frame choices. Prove every positive
adjoint K_op,n→ΩK_op,n+1 is a weak equivalence and π_iK_op,n equals
KO^(n−i)(*) or KU^(n−i)(*) at the zero basepoint. Include π₀K_op,1=0
and π₀K_op,4=ℤ in the real case. These give the spectral coefficients
and Bott invertibility; K_op,0=S⁰ is the separate non-Ω unit level.
**Mixed-signature operator classifiers.** Construct
realMixedCliffordOperatorClassifier p q as the point-norm space
`Hom_gr,ℝ,*(C₀(ℝ;ℝ),Cl(p,q) graded-⊗_ℝ K(U_(p,q)))`, using an
infinite ample graded real Hilbert universe with both parities, also when
p=q=0. Construct its real C*-Clifford algebra: positive generators are
self-adjoint, negative generators are skew-adjoint; compare the underlying
algebra to native `CliffordAlgebra (TauCeti.realCliffordForm p q)` and
its adjoint to reversion composed with the sign change on negative
coordinates. This adjoint equals native global Clifford star when p=0;
for p>0 the positive generators have the opposite adjoint sign. Keep the
C*-model on a separate `def` type synonym with an explicit underlying
algebra equivalence; do not install this adjoint on the native abbreviation.
For mixed signature complexification pin the involution to
conjugation graded-⊗(β∘reverse), where β changes the negative coordinates.
Pin the real spectral order: x≤y iff y−x is self-adjoint with nonnegative
real spectrum; use the unitization/quasispectrum form for nonunital
Clifford/compact/adjointable synonyms. Identify it with the pullback of
the complex spectral order and construct their `PartialOrder` and
nonnegative-spectrum interfaces. Construct their `StarOrderedRing`
instances after the descended square root and real CFC below. On native real
Hilbert operators H→L[ℝ]H retain `ContinuousLinearMap.instLoewnerPartialOrder`
and the existing `NonnegSpectrumClass ℝ`; prove spectral positivity
equivalent to native `IsPositive`, using `IsPositive.spectrumRestricts`
and realHilbertContinuousFunctionalCalculus's descended square root
for the converse, after the Hilbert complexification/bounded transport
below. After the real CFC is built, install the named global
realHilbertOperatorStarOrderedRing instance using native
`ContinuousLinearMap.instStarOrderedRingRCLike` and the existing
Loewner order.
Use the specified real algebra order for module pairing positivity.
Give the actual graded compact operators, tensor/multiplier and continuous
functional-calculus constructors. For signature addition pin the
coordinate shuffle (x,y,x′,y′)↦(x,x′,y,y′), with positive x,x′ and
negative y,y′. Its determinant is (−1)^(p′q); retain this reference-
volume/Koszul sign in the graded tensor, Bott and Morita comparisons:
ω_(p+p′,q+q′)=(−1)^(p′q)·(ω_(p,q) graded-⊗ω_(p′,q′)).
For the neutral block Cl(c,c) specify the module Λ(ℝ^c), with its
exterior-degree parity, e_i↦ε_i+ι_i and f_i↦ε_i−ι_i in ordered
coordinates (e_1,…,e_c,f_1,…,f_c). Here ε_i is wedge by the ith
positive basis vector and ι_i its adjoint contraction. The ordered
Λ(ℝ^c) graded-⊗Λ(ℝ^c′)≃Λ(ℝ^(c+c′)) map sends vacuum⊗vacuum
to vacuum with sign +1. Its reference-volume formula accounts for the
coordinate shuffle once, without an extra scalar in the index product.
Test Cl(1,1) graded-⊗Cl(1,1): the volume shuffle has determinant −1,
while the exterior vacuum tensor map still has sign +1.
**G5.5-Transfer: finite-Clifford modules.** Construct the real finite-Clifford
Hilbert-module interface on native
complete normed real vector spaces, with right A-action expressed through
opposite scalars, an A-valued real-sesquilinear pairing with
⟨xa,yb⟩=a*⟨x,y⟩b, positivity, norm
recovery ‖x‖²=‖⟨x,x⟩_A‖, and compatible module/algebra gradings.
Here A is the finite real C*-Clifford Cl(p,q) just constructed. Native
`CStarModule` requires complex scalars on both A and E; reuse
H1's right-module form `CStarModule A_Cᵐᵒᵖ E_C`, constructed once below
with its explicit pairing and norm comparisons, reading the pairing through
`MulOpposite.unop`.
Use a `WithCStarModule`-style type synonym for the trace-induced real
Hilbert norm, with the identity linear homeomorphism and norm comparison
to the A-module norm; competing norm/star instances stay on their
designated synonyms. Build adjointable maps, finite-rank θ_(x,y), compact
completion and finite matrix-factor/complexification comparisons.
Consume SpinGeometry G1.3's `cliffordScalarTrace` and its
normalized regular-trace formula through the explicit underlying algebra
equivalence realMixedCliffordCStarModelEquiv. Pin A_C:=ℂ⊗_ℝA, with
the conjugation⊗(β∘reverse) involution fixed above. Its τ_C is exactly
SpinG1.3's ℂ-linear trace τ_ℂ transported along the ℂ base change of
realMixedCliffordCStarModelEquiv; it is not a second trace construction.
Consume G1.3's
ordered-product/native-exterior-basis comparison and scalar coefficient
pairing for the orthogonal coordinate basis of realCliffordForm p q.
For the mixed Cartan adjoint β∘reverse above, prove this transported
basis is orthonormal for the trace pairing, and the trace is faithful,
positive and even, with τ(a*a)=Σ_I|a_I|². Before constructing the module
trace norm, prove τ(a)≥0 for every spectrally positive a, with equality
only for a=0, and the corresponding statement for τ_C on A_C. Use the
transported normalized regular-trace formula: positive a makes L_a
self-adjoint on the trace inner-product algebra, with spectrum spec(a),
so its trace is nonnegative and zero only when L_a=0. Prove these
statements over both real and complex scalars. Construct its induced real inner product and
the uniform equivalent-norm/completion comparisons.
Construct realFiniteCliffordContinuousFunctionalCalculus for these finite
Clifford algebras and their compact/multiplier/adjointable operator
algebras. Their trace-induced real Hilbert spaces consume the single
native-operator instance realHilbertContinuousFunctionalCalculus
constructed below. Complexify the algebra with its actual C*-norm and
conjugation; use the single complex-module construction below to compare
the real module with its fixed points. Descend conjugation-commuting
real-valued functions from native complex CFC. Install the native real
`IsometricContinuousFunctionalCalculus`
and nonunital interfaces on the designated real models, extending the
preceding spectral order to their compact/multiplier/adjointable models
and proving norm, positivity, composition and tensor/compact compatibility.
**G5.5-RealHilbert: scalar Hilbert foundations.** For a complete real
inner-product space H construct
RealHilbertComplexification H as a separate synonym of
native `TauCeti.Complexification H`, retaining its complex linear
structure but installing the Hilbert inner product
⟨x+iy,x′+iy′⟩=(x,x′)+(y,y′)+i((x,y′)−(y,x′)), with norm
√(‖x‖²+‖y‖²). Do not install this norm on the native Taylor-norm carrier.
Prove the real embedding is isometric, conjugation J(x+iy)=x−iy is an
antilinear isometry, and this space is complete. Construct the identity
complex continuous-linear equivalence with the native Taylor model,
proving ‖z‖_T≤‖z‖_H≤√2·‖z‖_T. Transport native
`ContinuousLinearMap.complexify` through it for bounded maps, retaining
composition and adjoints, and prove equality of operator norms from
the Hilbert formula. Then construct realHilbertContinuousFunctionalCalculus
on native H→L[ℝ]H for every complete real inner-product space H:
transport bounded operators to this Hilbert complexification, use native
complex CFC and conjugation descent, and install one native real
isometric CFC instance. Prove a bounded complex-linear S is T_C for
a unique bounded real T exactly when S commutes with J. For self-adjoint
T prove `(spectrum ℝ T).image Complex.ofReal = spectrum ℂ T_C`,
using conjugation-fixed inverses at real scalars and the real spectrum
of complex self-adjoint operators; retain the zero Hilbert space case. It precedes the native positivity converse
and `instStarOrderedRingRCLike` above; all trace-induced real Hilbert
spaces use this same instance. For a densely defined real `LinearPMap` D define D_C(x+iy)=Dx+iDy on the actual
complexified domain; prove graph/closure transport and
(D_C)†=(D†)_C, including equality of domains. For closed self-adjoint D
this supplies the complex Hilbert operator used below.
On this Hilbert synonym pin H1–2's transported scalar structure:
`CStarModule ℂᵐᵒᵖ H_C` has `op z • v=z•v` and
`unop (inner ℂᵐᵒᵖ v w)=⟨v,w⟩_ℂ`, derived from native
`instCStarModuleComplex`; keep it local to the designated synonym.
Export scalarComplexHilbertModuleAdjointComparison: for densely
defined T, H6's representing-vector module adjoint equals native
`LinearPMap.adjoint` with the same domain, by scalar Riesz and density.
Hence native self-adjointness is equivalent to the H6 scalar-module
condition. Specialize H6 to coefficient ℂ and prove scalar regularity
from H6's symmetric-operator criterion and
[SelfAdjointSpectralTheory SA-D15–D17](../OperatorTheory/SelfAdjointSpectralTheory/README.md)'s
closed/dense range and nonreal resolvents. Descend H6's actual scalar
C₀(ℝ) calculus to real-valued conjugation-intertwining functions, proving
nondegeneracy, bounded-transform and real resolvent formulas (1+D²)⁻¹
and D(1+D²)⁻¹. Export this real Hilbert closed descent as
realHilbertClosedFunctionalCalculus. Prove J f(D_C) J=conj(f)(D_C)
through resolvents and density, so real-valued functions preserve the
real fixed space; also retain conjugation and domain laws for bounded
transforms. This scalar regularity uses no real finite-Clifford module
theorem and precedes the operator-transfer exports below.
Export realFiniteCliffordAdjointableComparison: every bounded A-linear
operator on the resulting real Hilbert space is A-adjointable, with the
same adjoint and operator norm. Prove this using A-linearity and testing the A-valued adjoint
identity against every right scalar through the faithful trace pairing.
Prove the resulting injective *-homomorphism L_A(E)→B(H_τ) is isometric,
giving equality of operator norms.
Export realFiniteCliffordCompactComparison: A-linear real-compact
operators are exactly K_A(E). Finite-rank A-operators have finite real
rank; in the converse average real finite-rank approximants over the
finite signed Clifford-monomial unitary group and use finite A-module
Parseval frames to express the averages as sums of θ_(x,y).
**G5.5-Regularity: real/complex regular operators.** Define the real
A-module adjoint of a densely defined A-linear D on
its actual A-invariant domain: y lies in dom(D*) exactly when there is
z with ⟨Dx,y⟩_A=⟨x,z⟩_A for every x in dom(D), and set D*y=z.
Prove uniqueness by density and the pairing's nondegeneracy. Define
real semiregularity by dense domains of D and D*; define real regularity
by semiregularity, a closed graph and dense range of 1+D*D on its
actual composition domain. Construct the complexified pairing and
the complete normed `CStarModule A_Cᵐᵒᵖ E_C`, with its C*-module norm
and identity equivalent-norm comparison to the Hilbert complexification
of E's trace-induced real Hilbert space. After `unop`, its pairing is
⟨x+iy,x′+iy′⟩=⟨x,x′⟩+⟨y,y′⟩+i(⟨x,y′⟩−⟨y,x′⟩),
with the inclusions A→A_C and central complex scalar understood.
Prove τ_C(⟨z,z⟩)=(‖z‖²_H:ℂ), and derive the uniform norm-equivalence
constants from this identity and the faithful finite-dimensional trace.
For the complexified operator
prove `(D_C)*=(D*)_C` with equal domains, graph/closure and domain
density comparisons, and `1+(D_C)*D_C=(1+D*D)_C` including composition
domains. Prove dense-range equivalence through the real/imaginary
projections. Preserve module grading, conjugation and the underlying
norm-comparison maps. Export realFiniteCliffordRegularComplexificationComparison:
real regularity is equivalent to H6 regularity of D_C on this actual
complex module. These module-adjoint comparisons use the full A-valued
pairing and its complexification, not only its scalar trace.
Export realFiniteCliffordRegularOperatorComparison: a closed densely
defined self-adjoint A-linear real operator with A-invariant domain is
real module-regular, with the same module adjoint/domain as its real
Hilbert adjoint; real-compact resolvent implies K_A-compact resolvent.
Obtain (1+D²)⁻¹ and D(1+D²)⁻¹ from
realHilbertClosedFunctionalCalculus, and prove they commute with every
bounded right A-action. Transfer these bounded A-linear operators through
realFiniteCliffordAdjointableComparison, and through
realFiniteCliffordCompactComparison when they are real-compact,
retaining range((1+D²)⁻¹)⊆dom(D²), range(D(1+D²)⁻¹)⊆dom(D),
and the inverse identities on the composition domain, to prove real
regularity.
Then apply realFiniteCliffordRegularComplexificationComparison and
construct realFiniteCliffordClosedFunctionalCalculus: consume H6's
actual C₀(ℝ) calculus of the now-H6-regular D_C and descend
its conjugation-invariant real functions. Prove equality with the preceding
real Hilbert-space calculus, strong/strict convergence, bounded-transform,
compact and essential-support laws, including zero representation. This
module calculus follows regularity and precedes Spin's analytic use.
Construct realFiniteCliffordHilbertModuleStabilization for every
countably generated graded Hilbert A-module: an even A-linear unitary
E⊕Std_A≃Std_A, where Std_A=U_(p,q) graded-⊗A is the countably infinite
standard module with both parities. This is the real finite-Clifford
extension of H4's stabilization. For p+q≥1 choose an odd unitary generator
u, reduce to the even module E₀ over A₀=Cl⁰(p,q), prove
E=E₀⊕E₀u and countable generation of E₀, then apply the real/complex/
quaternionic matrix-factor comparisons and Gram–Schmidt to the factor
Hilbert spaces. Do not require an A-orthonormal basis of an arbitrary
Hilbert A-module. For p=q=0 stabilize the two real parity spaces
separately. Give support/universe comparisons and the actual isomorphism
K_A(Std_A)≃K(U_(p,q)) graded-⊗A, whose elementary action is
(k⊗a)(u⊗c)=(−1)^(|a||u|)ku⊗ac. Its graded flip
k⊗a↦(−1)^(|k||a|)a⊗k gives the displayed A graded-⊗K(U_(p,q))
operator model; prove both action/tensor comparisons and their signs.
Prove even-unitary frame-choice
contractibility in the strong (equivalently strict on these unitaries)
topology, and numerable parameter/pullback compatibility, including
conjugation of compacts in point norm and stabilization of the
functional-calculus essential support. These generic targets precede
geometric section modules; Spin constructs its own A-valued L² section
pairing and consumes these comparisons and stabilization afterward.
The zero-signature classifier represents KO⁰ and is not the sphere-
module's separate unit level K_op,0=S⁰. First construct
realMixedCliffordBottTransport: let d=p−q and choose k with
r=d+8k≥1. Construct the actual graded-Morita/operator comparison to
K_op,r. Under this comparison π₀ is identified with KO^r; the forward
coefficient identification π₀→KO^d sends its corresponding y∈KO^r
to b^k y∈KO^d, with TopK's fixed b∈KO_8=KO^(−8). Its inverse sends
x∈KO^d to b^(−k)x∈KO^r and then applies the inverse operator comparison.
Prove independence of k and check these mutually inverse identifications
against the finite ABS calibrations below, rather than presupposing the
classifier's degree.
Prove independence of k, ordered exterior-module cancellation for
Cl(c,0) graded-⊗Cl(0,c), eight-periodic Morita maps, product/unit,
Hilbert stabilization and parameter/pair naturality, including the
normalized real/complex coefficient diagrams. Export the operator-level
Morita insertion (p,q)→(p+c,q+c), by placing Cl(c,c) as the second
signature summand and tensoring its specified exterior module. Pin the
coordinate map (x,y,e,f)↦(x,e,y,f), its volume sign (−1)^(cq), and
the even exterior-vacuum intertwiner with unit sign +1. Prove compact-
operator/functional-calculus and index compatibility, product/unit and
iterated insertion coherence; the signature degree p−q is unchanged. This is an algebraic/operator export, before
any geometric embedding/excision square.
Then construct realMixedCliffordIndexClassification in degree d=p−q.
Construct realMixedCliffordIndexClassification_map to
Ω^m R(KO)_(d+m) for every m≥max(0,−d),
compatibly in m: actual Bott transport or Clifford suspension, ordered
Morita cancellation, then the K_op/KO zigzag, with inverses constructed
after pointed CW replacement. Prove this composite gives the stated
coefficient identification and all parameter/pair diagrams. Here R(KO)
is G2's ordinary stable fibrant Ω-spectrum replacement of the underlying
KO spectrum, with an actual replacement map; d+m is a nonnegative level.
Its level zero is the derived KO⁰ classifier, not the unchanged unit
level of a merely positive-fibrant commutative spectrum.
Its π_i is KO^(d−i); finite-CW based/unbased/relative maps represent
the corresponding reduced/unreduced KO^d. Extend the derived mapping
comparison to all CW pairs using G3.10, retaining Milnor/phantom terms.
Establish these operator comparisons before their Dirac or geometric
ABS consumers. In particular realNegativeCliffordFamilyIndex n uses
the Cl(0,n)-affiliated classifier and takes values in KO^(−n), or KO_n
at a point. Its parity-twisted right action has positive external
generators; the affiliated algebra and that external action are not the
same signature. Identify its bounded-transform/finite-kernel quotient
with TopK's ABS modules, including nonzero spectral pairs extending the
positive external action to Cl(n+1,0). Calibrate algebraically: an even
or odd real line gives ±1; a free rank-one graded Cl(0,1) module, with
positive external Cl(1,0) after the parity twist, gives η, and its graded
square gives η². The graded Cl4 kernel module with four-dimensional even
part and external volume −1 gives a; the Cl8 generator with external
volume +1 on its even part gives b. Prove these finite-module comparisons
against TopK's fixed coefficient generators, including the even/odd
finite support at p=q=0 in the ample classifier. Spin's circle/torus
Dirac calculations and TB's geometric squares consume these algebraic
comparisons and Morita insertion afterward; neither is a G input.
The multiplication is tensoring homomorphisms after the coalgebra map
of C₀(ℝ) defined by the odd sum D⊗1+1⊗D'; prove its functional
calculus, coassociativity/counit, graded symmetry and continuity. The
unit/Bott family uses Clifford multiplication by v and the Gaussian
rank-one projection in H_n. Coordinate/Hilbert tensor shuffles give
Σ_n actions; prove all sphere-module and commutative-ring equations,
semistability and the TopK coefficient/Bott comparison, including the
positive/negative graded-Morita degree convention above.
Construct the even Clifford-linear isometry groups of H_n⊗Cl(n,0)
with strong operator topology and their Spin embeddings. Prove their
positive-rank contractibility (consume H5's complex strong-topology
theorem and prove the real/quaternionic Clifford-commutant cases),
free universal-bundle comparison and
coherent bar-to-associated-Thom zigzag; normalize level0 to the sphere
unit and prove the positive-level commutative-ring comparison. The
Spin-equivariant extension of the operator unit over this Thom model
constructs the actual coherent ABS map. Compare with G5.4's bar MSpin
through those multiplicative zigzags.
Pin the configuration intermediary, rather than inferring a coherent
comparison from the family index alone. For a based finite set A and
real/complex inner-product universe U, Λ(A,U) is the tuple of mutually
orthogonal finite-dimensional subspaces U_a for a≠*; a based map merges
them by orthogonal sum and deletes the basepoint fibre. Give the actual
Grassmannian/final topology. Prolong Λ to a based space T by its finite-set
coend; collisions sum labels and a label at the basepoint disappears.
Use U_n=Sym(𝕜^n) with z^α/√α! orthonormal, its permutation
action and the canonical isometry U_p⊗U_q≃U_(p+q). The ring-spectrum
levels are Λ(S^n,U_n), with coordinate/product and the constant-label
sphere unit. Prove connectivity and their connective ko/ku comparison.
Compare the skeletal bipermutative Γ machine to this model by the
bar resolution over finite orthogonal subspace embeddings; positive-rank
infinite Stiefel fibres are contractible. The resolution is an algebra
over the topological realization |Barratt–Eccles| of G2.8's simplicial
operad, not a strictly commutative ring.
Permutation-translation nerves act on frame tensors by their actual
Kronecker shuffle matrices; construct the coherent edges/operations,
operadic substitution and unit equations. Give the Γ-machine output
this same operad action, and restrict the strictly commutative Λ model
along |Barratt–Eccles|→Com. Prove both resolution projections are operad-
algebra maps and stable equivalences, including tensor, sum and sphere
assembly. Apply the stated cofibrant operadic/positive rectification
comparisons after SingSp in the simplicial positive-flat operadic model,
restricting the Sing|Barratt–Eccles| action along the actual unit
Barratt–Eccles→Sing|Barratt–Eccles|
to obtain the commutative-ring zigzags. No strict frame
tensor commutativity is assumed.
Treat rank0 as the sphere unit, not a purported level map from ℤ×BU/BO
to S⁰.
Define a monoidal Σ_n-equivariant isometric embedding U_n→H_n^even
by normalized monomial z^α↦the product Hermite function h_(2α).
Construct normalized Hermite functions from native Polynomial.hermite
by h_j(x)=π^(−1/4)(j!)^(−1/2)He_j(√2x)exp(−x²/2).
Prove the full Hermite basis complete/orthonormal in H_n; the 2α
subsequence gives an embedding into the even part, not an asserted
surjection. Prove its Gaussian unit and Fubini/tensor/permutation equations. Map a configuration
[v_j,W_j] to f↦Σ_j f(c(v_j))⊗P_(W_j), using those embedded even
labels. Prove the *-homomorphism, grading, collision/basepoint continuity
and all ring/unit/sphere equations. Its coefficient/classification
comparison uses the graded family-index theorem above. Identify the
image of the actual Bott class and its inverse. Prove the configuration
map induces π_k isomorphisms for every k≥0 via its graded family-index
and connective comparison, explicitly the real η,η²,α degrees1,2,4.
Pin the complex Bott representative to TopK's β=[γ]−1 on CP¹:
its D₀-to-D∞ clutching has s₀=z·s∞ and γ=O(−1). The positive
tautological-dual class [γ*]−1 is −β on CP¹; retain this sign
in the geometric/operator and normalized Thom adapters. Pin the real
degree8 class to TopK's chosen Clifford/real-Bott generator through
the specified Morita sign adapters.
Apply G2.8's
commutative localization universal property, and prove the resulting
localized map is a stable equivalence. This supplies the commutative-ring
equivalence between the chosen Γ/Bott KU/KO and K_op, before transporting
ABS. Retain finite CW pairs and then use G3 for arbitrary CW.
Compare the real orientation's necessary condition 2·1=0, the complex-line
spin obstruction and the quaternionic lift with the given ordinary/K-theory
conventions. For MU/KU's quaternionic orientations multiply the pulled-back
right-complex Thom class by (−1)^r to normalize its restriction against
the ordered quaternionic block orientation; prove this renormalization
respects direct sum and the chosen S⁴ coordinate comparison. Carry the
corresponding conjugacy of SO/Spin forgetting maps and signs into
MSp→MU→MSO, MSp→MSpin→KO and the orientation comparison
diagrams. The latter composite yields U^c, while the table's direct-lift
KO/MSpin family is U^std; use the global Pin-twisted ABS theorem above
when converting these conventions. A bundle class that is already spin
may use the spin Thom
isomorphism even when the theory has no orientation for all complex bundles.
Construct Thom orientation ring maps to HA. Their complex/MU instance
for A=ℤ is the same complexThomOrientation_to_HZ constructed above;
for a commutative coefficient ring A compose with G2.7's coefficient
change Hℤ→HA through the specified comparison zigzags and fibrant
coefficient-model maps. Construct the actual unital
multiplicative ABS map MSpin→KO, with the KO bundle Thom family and
coefficient ABS comparisons. For supplied coherent multiplicative
orientation data construct the generic unital spectral ring map; distinguish
an additive orientation from those coherence hypotheses. The geometric bordism-to-homology map,
its low-degree/rational image, ABS α comparison, MO/MSO/MU coefficient
rings and formal-group universal theorems remain with their named consumers.

*Needs:* 5.4; G4.3–4.5; HilbertModules H2, H4–H6; CStarAlgebras C5; SpinGeometry G1.3; OperatorTheory SelfAdjointSpectralTheory Parts C–D.

**Checks.**

- The matrices `e₁ = [[0,1],[1,0]]` and `e₂ = [[0,i],[−i,0]]` are self-adjoint with `e₁² = e₂² = 1` and `e₁e₂ = diag(−i, i) = −e₂e₁`, and both are odd for conjugation by diag(1, −1).
- The sign adapter is coherent: `pq + (p+q)r` and `qr + p(q+r)` both equal pq + pr + qr modulo 2 for p, q, r ∈ {0, 1}.
- For n = 0 the operator classifier has the zero homomorphism as basepoint and represents KO⁰ of a point, ℤ.

### 5.6 Rational spectral Hurewicz (G5.6)

Construct rationalization by the telescope
inverting the positive integers, with explicit unit/map and its universal
property. Consume AT8.8d's torsion Serre-class Hurewicz
theorem and supply the rational sphere argument needed
to prove `π_n S⊗ℚ=0` for n>0. Supply the required rational
H*(K(ℤ,n);ℚ) computation, consuming AT5.5's CW-base and arbitrary-base
homological and cohomological Serre spectral sequences, with their
degreewise first-quadrant convergence. Their skeletal filtration and
CW-approximation construction are owned solely by AT5.5 and AT4.8,
using AT1–4, the AT6.0–6.2 foundational Milnor/cochain/cup portion
and AT5.0's filtered-complex sequence, and precede AT8.8d and this
path-loop application. Consume the
actual filtered-cochain E₂=H^p(B;H^qF), native/local tensor-cup pairings
on E_r, Leibniz differentials and multiplicative strong convergence;
dualizing homology pages does not construct this cohomology sequence.
State H*(K(ℤ,n);ℚ) for n≥1 as exterior on the normalized degree-n
generator when n is odd and polynomial when n is even. Prove the rational differential
and convergence comparisons used by this computation.
Pass from the rational sphere computation to the stable groups using the single Freudenthal/stable-sphere
comparison; the n=0 group is ℚ. Prove `S_ℚ≃Hℚ` via the EM comparison,
and hence `π_nE⊗ℚ≃H_n(E;ℚ)` naturally for every spectrum E. Prove smash,
product and stable Hurewicz compatibility and the corresponding finite-type
dimension/graded-dual consequences. Combine with the Thom homology
comparison to supply the rational Hurewicz input for structured bordism.
TangentialBordism proves its CP^(2j)/partition basis and rational oriented
bordism polynomial ring; those calculations are not inferred from this
generic comparison alone. Unstable rational Hurewicz requires its distinct
connectivity and degree range, not the all-degree stable statement.
For a pointed space X whose homotopy groups vanish below degree k≥2,
reduce by CW approximation (AlgebraicTopology Stage 4.8) to a
(k−1)-connected pointed CW space and combine G2.5's general Freudenthal
comparison with this stable theorem to prove that the Hurewicz map
π_i(X)⊗ℚ→H_i(X;ℚ) is an isomorphism for 1≤i≤2k−2 (trivially for i=1)
and a surjection at i=2k−1, with the stabilization/Hurewicz diagram;
for k≤1 only the degree-one surjectivity of the Hurewicz theorem
remains. This is `rationalHurewicz`, stated on Tau Ceti's
`HomotopyGroup.hurewiczHom` as a kernel of finite-order elements and a
rationally spanning image. In the Freudenthal stable range k≥n+3 the
same comparison makes π_(k+n+1)(S^k) a torsion group:
`stableStem_isOfFinOrder` (Hatcher, *Spectral Sequences in Algebraic
Topology*, Theorem 1.21, p. 32, proves finiteness; Cohen, *Bundles,
Manifolds, and Homotopy*, Theorem 10.19, p. 294).

*Needs:* G2.5; G2.7; AlgebraicTopology Stages 4.8, 5.5 and 8.8d; Tau Ceti `HomotopyGroup.hurewiczHom`.

**Checks.**

- For X = S² and k = 2, `π₂S² ⊗ ℚ = ℚ → H₂(S²;ℚ) = ℚ` is an isomorphism, and in degree 3 = 2k − 1 the map `π₃S² ⊗ ℚ = ℚ → H₃ = 0` is onto but not injective.
- For X = S³ and k = 3, `π₄S³ = ℤ/2` is torsion and `H₄(S³;ℚ) = 0`; in the stable range `π_(k+n+1)(Sᵏ)` is torsion, as `stableStem_isOfFinOrder` states, while `π₃S² = ℤ` lies outside that range.
- `H*(K(ℤ,3);ℚ)` is exterior on a degree-3 class and `H*(K(ℤ,2);ℚ) = ℚ[x]` with |x| = 2.

### 5.7 Coherent module families, Borel cochains and oriented supports (G5.7)

Start from G2's specified commutative ring-spectrum and module models for
R=MU,Hℤ. Check their actual unit and pushout-product hypotheses, then apply
G2.11's unit-adjoined monoidal-localization and
relative-adjoint constructions to build the symmetric monoidal stable
enhancement `Mod_R∞` and its derived relative tensor `⊗_R`. Localize G2.4's
derived function modules through G2.11's DK-localization and
representable-pairing adjunctions to construct the internal module function
spectrum `F_R` and prove the tensor/internal-Hom adjunction. Construct its
unit and counit (evaluation), triangle identities, and mapping spectra,
with associativity, unit and symmetry coherences. Dual-pair coevaluation
is required only for the specified dualizable objects.
Extend these constructions pointwise to
`A_R(B)=Fun(Sing B,Mod_R∞)` for each CW-type B. The mapping object is
`Map_{A_R(B)}(P,Q):=Γ_B F_R(P,Q)`; prove it represents module maps and
is compatible with restriction and sections. Construct the corresponding
relative-tensor and unit comparisons. Apply the fixed G5.5 MU→Hℤ
representative and its ring/module comparison zigzags to obtain the
strong-monoidal derived functor `Φ_B:A_MU(B)→A_HZ(B)`, including its
tensor, unit, restriction and colimit maps. Verify each model hypothesis
used by these constructions rather than treating LM fibres alone as
symmetric monoidal.

**Continuous action adapter.** Put T=(Circle)^ℓ, including ℓ=0.
Use native `ContAction TopCat T` for continuous unbased T-spaces and
equivariant maps, with CW-type convenient models for geometric comparisons
and specified equivariant NDR/cylinder pair replacements. Within this
adapter, define the named, instance-reducible identity witness
topCatIdentityForget once in a single module:
`HasForget₂ TopCat TopCat` with `forget₂ := 𝟭 TopCat` and
`forget_comp := rfl`; consuming files enable its local instance attribute.
Then obtain
`HasForget₂ (ContAction TopCat T) TopCat` by the native `ContAction` and
`Action` transitive forgetful instances; do not assume the identity
instance is synthesized globally. Construct pointed-convenient and singular
adapters, retaining product, unit and action equations. Put
`G=Sing(T)` on native [`TopCat.toSSet`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/AlgebraicTopology/SingularSet.lean), with its pointwise simplicial group structure; verify the
face, degeneracy, multiplication, inverse and unit equations. Use AlgebraicTopology Stage 8.2's Kan property of
simplicial groups (`simplicialGroupKan`)
and G2.1's Kan–Quillen geometric/singular comparison. Let `C_G` be the
one-object simplicial category with endomorphism group G. Take
`S=N_hc(C_G)`, on native
[`SimplicialNerve` and its coherent simplex carriers](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/AlgebraicTopology/SimplicialNerve.lean).
First derive the DK counit `ε:𝔠[S]→C_G` from G2.11's Bergner
fibrancy of locally Kan C_G and its rigidification/nerve Quillen
equivalence; all simplicial sets are Joyal-cofibrant. Its DK mapping
comparison and G2.11's coherent mapping-space theorem give
`hS≃π₀C_G`. Thus every edge of S is invertible, and the inner- and
equivalence-edge outer-horn theorems prove S Kan. This does not assume
S Kan to obtain the counit. Apply ε in G2.11's HTT 4.2.4.4 diagram
comparison, natural on index maps, transformations and higher simplices.

**Principal and associated total-space comparison.** For a numerable
locally trivial right principal T-bundle `P→B`, put `X=Sing(P)` with left
action `g·x=x·g⁻¹`. Construct the singular Kan-fibration adapter using
AT5.5's native locally-trivial Serre bridge and relative finite-CW
horn lifting, and apply it to `Sing(P)→Sing(B)`. Pull back P over each
singular simplex of B, choose a section of that
trivial principal bundle, and use its continuous principal division map.
This proves the actual degreewise quotient isomorphism `X/G≅Sing(B)`.
Prove projective cofibrancy of X by filtering over the nondegenerate
simplices of Sing(B): the chosen lifts attach free cells
`G×∂Δ[n]→G×Δ[n]` with the boundary maps determined by division.
This explicit free-cell filtration proves cofibrancy. The ordinary orbit
functor
is left Quillen for the projective G-simplicial-set model, since its
right adjoint gives trivial action and preserves underlying Kan
fibrations and trivial fibrations. Thus its derived value yields
`hocolim_C_G X≃X/G≅Sing(B)`.

Rectify X along ε to `F_X:S→Spaces`. View Kan complexes as the
full space-valued subcategory of Cat∞ and use G2.11's marked
coCartesian straightening over S, with projective marked diagrams on
𝔠[S], directly. Construct its restriction to Kan-valued diagrams:
every total edge factors as a coCartesian lift followed by an
invertible vertical edge in a Kan fibre, so every edge is coCartesian
and the fibration is a left fibration with those same fibres. Use the
marked tensor strength and enriched Quillen-equivalence criterion for
the derived mapping-space comparison. Identify the unstraightening of
constant Z naturally with `S×Z` by base change along S→* and the
unit/counit at the point. For Kan S and Kan-valued F, the total E_F is
Kan. The graph and marked-straightening equivalences give
`Map(E_F,Z)≃Map_/S(E_F,S×Z)≃Nat(F,const Z)`.
Export the cocone as the image of id_(E_F); this constructs the natural
equivalence `E_F≃colim_S F`, including higher parameters and actual
fibrant/cofibrant replacements. To transport the orbit cocone, take
projective cofibrant replacements of its entire arrow diagram,
including its target, the trivial-action Sing(B). G2.11's naturality
along C_G→* identifies its target rectification with constant Sing(B).
HTT 4.2.4.1 then gives the actual global comparison
`E_X≃hocolim_C_G X→Sing(B)` from that cocone.
For the universal bundle `ET→BT`, X is Kan and contractible; hence
`F_X→*` is an equivalence. Apply the marked fibrewise-equivalence
criterion to `E_X→id_S` to prove `E_X→S` is an equivalence. Export the
actual span
`S←E_X→Sing(BT)` of equivalences with cocones and all higher naturality,
including its contractible space of inverse choices. For a general P
or a finite classifier stage, retain `E_X→S` as its classifying map;
no contractibility of X or equivalence of B with S is assumed.

For a left T-space F put `Y=X×Sing(F)` with diagonal left action
`g·(x,f)=(xg⁻¹,gf)`. Construct its projective free-cell filtration over
the singular simplices of `P×_T F`: simplex lifts in P and principal
division identify each pullback with `G×Δ[n]`. Prove the actual quotient
`Y/G≅Sing(P×_T F)`. Under rectification and total-space comparison the
projection Y→X gives a global map E_Y→E_X and a commutative comparison
square with `Sing(P×_T F)→Sing(B)`, including the cocone homotopies and
higher parameters. Under left straightening this is the associated
action bundle pulled back along E_X→S, not just an identification of
its separate fibres. Retain naturality in F, bundle maps and torus
homomorphisms. Include based/sectioned objects, zero sections, relative
cofibers and the actual Thom-line bundle maps in this same square.

For each numerable locally trivial bundle `p:E→B`, construct the actual
Kan fibration Sing(p), its straightening, and the global comparison
with its unstraightening, natural in bundle maps and their higher
parameters. Identify it with the C_G-action construction when p is the
specified T-associated bundle. For arbitrary bundles use their own
straightening over Sing(B). Compare the enriched module diagrams with
`A_R(BT)` along the universal span and export
continuousTorusAction_coherentMUComparison,
continuousTorusAction_coherentHZComparison and
continuousTorusAction_coherentRComparison for the specified models.
Consume CC C1.5's fixed finite principal bundles
`E_n=(S^(2n+1))^ℓ→B_n=(CP^n)^ℓ`, their inclusions and colimit universal
comparison. Apply the nonuniversal total-space square at each n and
compare it with the universal square along inclusions, retaining the
entire coherent tower. The right action on each sphere factor is
`(z_i)·(t_i)=z_i t_i`; the associated quotient for a left T-space is
`(e·t,y)~(e,t·y)`. The diagonal left action uses the inverse as above.
Construct torusAction_freeMU_moduleBundle, and its R-module version,
sending Y to `P_R(Y)=R∧ᴸΣ∞Y₊` with that coherent action. Retain
equivariant NDR-pair and mapping-cylinder cofibers, products, sums,
model invariance and the actual fibre/associated-bundle comparisons.

**Borel cochains and finite-base coefficient change.** For an equivariant
pair (Y,A) use the cofiber of Σ∞A₊→Σ∞Y₊, comparing with Y/A under
the stated NDR hypotheses. Define `D_R(Y,A)=F_R(P_R(Y,A),R)`, with
contragredient transport. Construct fibrewiseHZ_functionSpectrum_borelComparison
and fibrewiseR_functionSpectrum_borelComparison from the actual bar/Borel maps:
`Γ_BT D_R(Y,A)≃F(Σ∞(ET×_T Y,ET×_T A),R)`. For compact supports, `Γ_BT C_c,R(U)` denotes fibrewise-supported Borel cochains from the supported finite-stage models; it is not compact-support cohomology of the total Borel space `ET×_T U`.
Prove the corresponding finite B_n formulas, integer shifts, relative
boundaries and cup/module action of R-cochains on the base. For Hℤ
compare with G2.7/AT's single ordinary Borel cochain theory. Separately
export fibrewiseMU_to_HZ_homologyComparison, identifying the coefficient
change of P_MU(Y,A) with P_HZ(Y,A) and ordinary homology by G5.5;
P and D are different objects.
Prove finiteBaseSectionsScalarComparison over any specified finite CW
base, for the actual Φ and coherent module families, by finite-cell
section pullbacks and exactness of Φ. Construct the canonical function
module comparison `Φ F_MU(P,Q)→F_HZ(ΦP,ΦQ)` and prove it an equivalence
when P has a specified dual pair, including finite-cell/retract modules.
Combine these for finite B_n mapping spectra; retain naturality on
cofiber triangles and actual maps, not just homotopy groups.

**Coherent Thom and Euler family.** For R=MU,Hℤ and a locally trivial
complex vector bundle ν→C of rank m, specify a continuous T-action by
complex-linear bundle maps covering the action on C. Form its Borel bundle
`ET×_T ν→ET×_T C` and retain the induced maps. Construct its sphere-module
line functor over `C_hT:=ET×_T C` and its
actual Thom-colimit comparison. The universal normalized Thom cocone
of G4.3–5/G5.4–5 induces an equivalence of that module-line diagram
with constant Σ^(2m)R. Prove that the colimit adjunction sends the pointwise tensor of Thom classes to the Thom-diagonal/external product. Construct the natural transformation on the full Borel groupoid by its mapping-space adjunction; fibre class equality alone is not the construction. Push forward along C_hT→BT
to export fibrewiseThomOrientationComparison and the actual natural
zero-section map
`e_ν:P_R(C)→Σ^(2m)P_R(C)` in A_R(BT).
When C is T-fixed its underlying P_R(C) family is constant; e_ν still
retains its BT-coherent information. Restrict to every B_n and retain
ν_n over C×B_n in that case. Construct the Φ comparison on these full
diagrams from the fixed G5.5 orientation map. Identify the Hℤ image
with the canonical ordinary family by the full-base Thom mapping
comparison on ν_T and its actual homotopy, then restrict the same
homotopy to the finite tower. The standard coordinate character uses
CC's tautological O(−1) convention, with Hℤ Euler class −h_i.
Include m=0, empty C, pullback, products and relative maps.

**Compact support objects and excision.** Consume CC C1.2's ordinary
compact-support pair package and identify the Hℤ refinement with
that same ordinary theory. For locally compact paracompact T-spaces
define C_c,R(U) by the homotopy colimit, over invariant compact K⊂U,
of the R-module cochains of the actual relative cofiber (U,U\K).
Prove invariant supports cofinal by compact T-saturation.
For a smooth T-manifold U use specified smooth T-action data, and nested
compact T-invariant collared domains L_j with interiors covering U and
finite CW boundary-pair models obtained from GeometricTopology's
**The smoothing-and-triangulation comparison**, item1 **Smooth implies PL**,
including the relative collar extension for these compact pieces. Use [SmoothBundlesConnections B1.4](../SmoothBundlesConnections/README.md)
for proper free-action smooth quotients and submersion comparisons, and
TopK T1.5 and [ComplexKahlerGeometry K7.1](../ComplexKahlerGeometry/README.md)
for the actual smooth projective-space stage charts; these are inputs,
not duplicated geometric owners. Prove the coherent comparison
`C_c,R(U)≃hocolim_j F_R(R∧Σ∞(L_j/∂L_j),R)`.
Construct the transition maps by actual support collapse/excision and
prove cofinal-exhaustion independence. Construct the mixed support product
`D_R(U)⊗_R C_c,R(U)→C_c,R(U)` from the relative diagonal, including
its finite Borel base-cochain action and Hℤ/CC comparison.
Use native `OnePoint` models for the specified tame U⁺ cases. Use AT6.4's compact-domain pair
zigzag and GT's exterior collars to compare with relative support
cofibers. For a vector bundle over compact C with a specified invariant
metric, prove the radius-exhaustion identification with its Thom
compactification; for U=int W with W compact equivariantly collared
prove the W/∂W identification. For an open j:U→V
construct `j_!:C_c,R(U)→C_c,R(V)` by excision on supports; for a proper
map f construct the opposite-direction proper pullback, with its
actual compact-preimage maps. Build the localization triangle for
specified compactifications `V=K\A`, `Z=L\(A∩L)` and `U=K\(A∪L)`, where
A,L⊂K form a T-invariant common CW/NDR excisive triad, by the quotient cofiber
`L/(A∩L)→K/A→K/(A∪L)`; use `K₊` and `L₊` for empty collapsed
subspaces, and extend through compatible compact exhaustions.
Include corners/rounded compact-pair models, connecting maps and their
suspension signs. The geometry supplying such presentations is data.

**Vertical support duality.** Specify an equivariant complex bundle V of
complex rank `(d+a)/2` over U and an equivariant real bundle isomorphism
`TU⊕ε^a_ℝ≃V_ℝ`, with trivial T-action on the ordered trivial summand.
Include the induced Borel construction and maps as part of the bundle data.
Given a stable choice of N with N+a even and compatible vertical
identifications `ν_v⊕T_v≃ε^N` and `ν_v⊕V_ℝ≃ε^(N+a)`, orient the normal
Thom line by `L(ν_v)≃L(V)^(−1)⊗L(ε^(N+a))` using this specified
isomorphism and G5.5's interleaved convention. Record the block-order
conversion between `ν_v⊕T_v` and `T_v⊕ν_v`, with sign
`(−1)^((N−d)d)`, and include the isomorphism, inverse and complement
choices in the coherence data. Construct the oriented equivalence
compactSupportModuleDuality:C_c,R(U)≃Σ^(−d)P_R(U), d=dim U,
for R=MU and its ordinary coefficient change. Extend G5.2's geometric
adapter to compact collared boundary pairs by smooth doubling, relative
normal collapse and the specified Thom orientation on the original pair.
Obtain the finite CW models of these compact doubled families from the
same GT smooth-triangulation item1 and relative collar extension. For each
finite-stage proper smooth submersion with compact fibres, consume
CC C2.5's graph embedding and fibrewise tube. Own only the stabilized relative extension over the tower and compact
parameter simplices, and its spectral collapse comparison. Construct the
parametric comparison
over B_n from fibre-preserving embeddings into B_n×ℝ^N, vertical normal
bundles with `ν_v⊕T_v≃ε^N`, and vertical tubes; prove the stable relative
embedding/tube and collapse homotopies. The shift is vertical dimension d.
Extend coordinate maps near the prescribed neighbourhood by the chosen
retractions and charts; make the cutoff depend only on base and parameter
points. Stabilization increases the real rank by an even number, appending
the ordered complex block in the last ambient coordinates.
For an open inclusion `j:U→V`, construct `j_!` by support excision
independently of stable-complex compatibility. Identify it under vertical
duality with the R-homology inclusion only when specified stable-complex
data on V restricts under `TV|_U≃TU⊕ν` to the data on U and ν, with its
Thom-line orientation coherence. For proper T-equivariant smooth embeddings of finite-dimensional Hausdorff
second-countable manifolds with a specified coherent
R-Thom orientation of the normal bundle, construct equivariantNormalTube:
choose a smooth positive-definite ambient metric from DG12.1, average its pullbacks
with RepresentationTheory/CompactGroups Layer0's normalized Haar measure,
and prove smoothness and positive definiteness in bundle charts. Apply
GT's metric-dependent normal-exponential tube and diffeomorphism
naturality with the transported metric. Construct the compatible extended
distance by native `EMetricSpace.ofRiemannianMetric` for this same
averaged metric; use GT's T3 argument from the manifold hypotheses.
Prove the normal complement and
exponential map T-equivariant and choose a T-invariant positive radius
by choosing a positive smooth minorant of the orbitwise minimum radius
and averaging that minorant; retain shrinking on invariant compact supports. With that tube construct the
compact-support Gysin map and its PT/cap comparison, with codimension shift. Compare its Hℤ map with CC C2.4 and AT cap/Poincaré–Lefschetz maps.
Identify the Gysin map under duality with the covariant R-homology map only
when the ambient stable-complex data restricts to the source data plus the
normal Thom data with the stated orientation coherence. Prove Φ compatibility on finite boundary-pair objects using duality, then
on their support colimit. For finite B_n identify sections with supported
cochains of E_n×_T U using compactness and the cofinal domain exhaustion,
and prove the filtered-colimit comparison.

**Tower and mapping interfaces.** Construct the actual restriction
towers of sections and mapping spectra over B_n, and prove their
homotopy limits compute those over BT by the classifier colimit and
coherent-diagram comparison. For supported objects retain the order
`holim_n hocolim_j Γ_Bn D_R(L_j/∂L_j)`.
Apply G3.8's Milnor exact sequence in every integer degree t, with kernel
`lim¹_n π_(t+1)` and quotient `lim_n π_t`, to these section and
mapping-spectrum towers. Construct the comparison identifying the limit
in `Mod_R∞` with the required homotopy limit, including cofinal shifts and
boundary diagrams; use G3.6 for the mapping-tower phantom kernel rather
than duplicating either generic result.
State Mittag–Leffler vanishing only with its actual degreewise hypotheses.
Export the coefficient maps of these towers and their mapping limits.
At BT export the canonical Φ/limit comparison map; its finite-base
equivalences do not assert that Φ commutes with the infinite limit.
For constant finite-free P and T-fixed C, put Q=P_R(C) and retain a
specified finite-free presentation of Q as additional data. Construct
torusFiniteFreeMappingEulerInterface: the mapping spectrum
in A_R(BT), its restriction tower, the map induced by postcomposition
with the coherent e_ν, and the finite-stage coefficient squares.
Retain specified presentations as data rather than infer freeness
from compactness of C.

**Extensions with specified nullhomotopies.** For an actual cofiber
triangle A→B→C→ΣA in A_R(BT), or over a finite B_n, construct
fibrewiseModuleExtension_classification. Identify the space of sections
of B→C over id_C with the path space from its connecting map δ to zero
in the derived mapping space Map(C,ΣA). A specified path constructs
`[i,s]:A⊕C≃B` under A and over C. Prove the mapping-space equivalence,
dependence on the path, pullback/coefficient compatibility and its
finite filtered-diagram form with compatible paths and finite direct sums
formed within one common filtration level. These maps and paths use the full coherent mapping space.

*Needs:* G2.11; G3.6 and G3.8; G4.3; 5.1–5.5; CharacteristicClasses C1.2, C1.5, C2.4 and C2.5; GeometricTopology Layer 1; SmoothBundlesConnections B1.4; RepresentationTheory CompactGroups Layer 0.

**Checks.**

- For ℓ = 0 the torus is trivial and the coherent family reduces to the nonequivariant module of G2.
- For the free circle action on S¹ itself, the homotopy quotient is a point.

### Examples

- `D(Sⁿ₊) ≃ S ∨ S⁻ⁿ`, MU with `π₀MU = ℤ`, KU and KO with their Bott periodicities.
- Rational Hurewicz for S², S³ and K(ℤ,2), and the torsion stable stems.
- The ℓ = 0 case of the torus families.

### Dependencies

G5.0 uses G2.9 and TopologicalKTheory T1.6, T7.0 and T7.1. G5.1–5.3 use G2–G4 and GeometricTopology Layer 1. G5.4 uses G2.5, G2.8 and TopologicalKTheory T7.1. G5.5 uses G4.3–4.5, HilbertModules H2 and H4–H6, CStarAlgebras C5, SpinGeometry G1.3 and OperatorTheory SelfAdjointSpectralTheory Parts C–D. G5.6 uses G2.5, G2.7 and AlgebraicTopology Stages 5.5 and 8.8d. G5.7 uses G2.11, G3.6, G3.8, G4.3, G5.1–5.5, CharacteristicClasses C1.2, C1.5, C2.4 and C2.5, GeometricTopology Layer 1, SmoothBundlesConnections B1.4, TopologicalKTheory T1.5, ComplexKahlerGeometry K7.1 and RepresentationTheory CompactGroups Layer 0.

## Downstream consumers

- BordismFormalGroups consumes G2–G5 and the G2.11 foundations, and owns formal group laws,
  projective power-series coordinates, orientation changes and coefficient-ring universality on
  native `FormalGroup`, with the power-series Euler laws.
- EllipticCohomology consumes G2–G5 and the G2.11 foundations, and owns tmf, Tmf, TMF and their
  orientations.
- EnhancedDerivedSheaves consumes G2.1–2.7, G2.11 and G3.8–3.9.
- DGFloer consumes G2.10's homotopy-fibre comparison (its Layer 1 item 4 and Layer 2) and G4.0b's
  smooth HP carrier.
- RiemannianGeometry consumes G4.0b's carriers and submersions in R1.
- SpinGeometry consumes G5.5's real Hilbert and finite-Clifford functional calculus, regularity,
  stabilization and negative-Clifford family index in its G5.0 and G6.0; G5.5 uses only SpinGeometry
  G1.3, which precedes them.
- TangentialBordism consumes G5's compatible bundle-diagram interface (bundles, stabilization
  isomorphisms, coherent block-sum and permutation maps and their universal classifier adapters)
  for ξ-normal structures, the mapping-path carrier for normal-classifier lifting, the
  orientations of G5.4–5.5 and the rational comparison of G5.6; it owns geometric cycles,
  structured Pontryagin–Thom, coefficient and characteristic-number calculations, rational
  bordism generators, the geometric projective-bundle transfers and the geometric α map.
- StringOrientation consumes the mapping-path carrier for BString and G5.0's low-homotopy
  supplement with its Hopf-generator sign when it proves λ = −c₂; it owns BString and string data.
- HigherToposTheory consumes G2.1's Kan–Quillen model structure and the G2.11 foundations rather
  than planning them again.
- GeneralAlgebraicKTheory and StableHomotopyKTheory consume G2.3–2.7: the stable model
  structures, the derived symmetric monoidal category and the sequential comparison.

## References

- Hovey, Shipley and Smith, [*Symmetric spectra*](https://arxiv.org/abs/math/9801077),
  JAMS 13 (2000), §§1–5: the chosen model, smash, stable equivalences, comparison
  and semistability. Adopt native Mathlib category, model and localization vocabulary.
- Mandell, May, Schwede and Shipley, [*Model categories of diagram spectra*](https://math.uchicago.edu/~may/PAPERS/mmssLMSDec30.pdf):
  positive model structures, commutative rings and multiplicative diagram comparisons.
- Brooke Shipley, [*A convenient model category for commutative ring spectra*](https://www.math.uic.edu/~bshipley/com4.pdf):
  the flat/convenient commutative model and underlying-spectrum replacements.
- Stefan Schwede, [*Symmetric spectra*](https://www.math.uni-bonn.de/~schwede/SymSpec-v3.pdf),
  Chapter I, Examples 1.17–1.20 and the multiplicative comparisons: canonical Thom
  models and the actual real/imaginary-coordinate loop construction.
- Elmendorf and Mandell, [*Rings, modules, and algebras in infinite loop space theory*](https://arxiv.org/abs/math/0403403):
  the multiplicative machine and comparison/rectification, beyond Segal's additive construction.
- McDuff and Segal, [*Homology fibrations and the group-completion theorem*](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/mcduff-segal.pdf):
  the group-completion proof used with the Γ/permutative input.
- Michael Joachim, [*A symmetric ring spectrum representing KO-theory*](https://doi.org/10.1016/S0040-9383(99)00063-4),
  Topology 40 (2001), 299–308: the positive-Ω operator-model homotopy type.
- Hebestreit–Sagave, [*Homotopical and operator algebraic twisted K-theory*](https://doi.org/10.1007/s00208-020-02066-6),
  §§6–7: the Clifford/operator ABS construction and multiplicative comparison
  of its Spin Thom model; G5 uses only the untwisted real/complex field models.
- Graeme Segal, [*Categories and cohomology theories*](https://ncatlab.org/nlab/files/SegalCategoriesAndCohomologyTheories.pdf):
  Γ-spaces, group completion and the infinite-loop machine; G2.8 includes
  the full multiplicative/rectification and localization targets needed here.
- Ralph L. Cohen, [*Bundles, Manifolds, and Homotopy*](https://math.stanford.edu/~ralph/bookR4.pdf),
  Chapter 10: Brown representation, represented theories, orientations and
  finite stable duality; the exact generality in this roadmap is definitive.
- Haynes Miller, [*Notes on Cobordism*](https://math.mit.edu/~hrm/papers/cobordism.pdf),
  Chapter 1 §§2–5 and Chapter 2 §§1–2: Thom/spectrum and orientation interfaces.
- Hatcher, [*Algebraic Topology*](https://pi.math.cornell.edu/~hatcher/AT/AT.pdf),
  §§4.1, 4.3 and 4.E: CW, ordinary EM/Brown and unstable prerequisites.
- Joël Riou's [topcat-model-category project](https://github.com/joelriou/topcat-model-category)
  and Mathlib [#41744](https://github.com/leanprover-community/mathlib4/pull/41744),
  [#44464](https://github.com/leanprover-community/mathlib4/pull/44464) and
  [#41735](https://github.com/leanprover-community/mathlib4/pull/41735): follow
  their model/properness/subdivision/homotopy-pullback design, building missing
  constructions in Tau Ceti under the stated ownership.
- Lurie, [*Higher Topos Theory*](https://www.math.ias.edu/~lurie/papers/HTT.pdf),
  §§1.2.4, 1.2.9, 2.1.2, 2.2.1–2.2.5, 2.4.5–2.4.6, 3.1–3.3, 4.2.4, 4.3, 5.2.7,
  5.3.5, A.2.6, A.3.2–A.3.6, and [*Higher Algebra*](https://www.math.ias.edu/~lurie/papers/HA.pdf),
  §§4.1.8, 4.3.3, 4.8.1, 7.3.2: the categorical models, natural marked
  straightening, model-diagram rectification and (co)limit comparison, Kan
  extensions, Ind, operadic rectification, monoidal Ind and relative adjoints
  constructed in G2.11.
- Nikolaus–Scholze, [*On topological cyclic homology*](https://arxiv.org/abs/1707.01799),
  §I.3 and Appendix A: the coherent stable quotient/Ind construction and
  universal lax-monoidal approximation of G2.11.
- Native foundations: Mathlib's `SSet`, simplicial boundary, horn and Kan constructions,
  `CategoryTheory.Under`, `Action`, `Mon`, `Mod`, `DayFunctor`,
  `HomotopicalAlgebra.ModelCategory` and categorical localization, and Tau Ceti's pointed
  simplicial sets and symmetric spectra with their point-set smash product. The pins supply no
  stable equivalences, stable model structure or Brown representation.
- Hatcher, *Algebraic Topology*: Proposition 3.17 (p. 217), Theorem 3F.8 (p. 314), Theorem 4.23
  and Corollary 4.24 (p. 360), Theorems 4E.1–4E.2 (pp. 448–449) and Theorem 4D.10 (p. 442).
- Hatcher, [*Spectral Sequences in Algebraic Topology*](https://pi.math.cornell.edu/~hatcher/SSAT/SSATpage.html),
  Theorem 1.21 (p. 32): finiteness of the homotopy groups of spheres outside the Hopf range.
- May, [*A Concise Course in Algebraic Topology*](https://www.math.uchicago.edu/~may/CONCISE/ConciseRevised.pdf),
  Chapter 7, Section 4, Theorem (p. 51): fibrations over numerable covers.
- Cohen, *Bundles, Manifolds, and Homotopy*, Theorems 10.3 (p. 282), 10.16 (p. 290), 10.19 (p. 294),
  10.40 (p. 330) and 10.43 (p. 334): Brown representability, Ω-spectra, Serre's theorem, the
  generalized Thom isomorphism and Spanier–Whitehead duality.
- Quillen, *Homotopical Algebra*, Lecture Notes in Math. 43 (1967), Chapter II, Section 3: the
  model category of simplicial sets and its comparison with spaces.
- Hovey, Shipley and Smith, *Symmetric spectra*: Example 3.1.10 (p. 23), Theorem 3.4.4 (p. 35),
  Theorem 4.3.2 (p. 42) and Definition 5.6.1 (p. 61).

The ordinary, topological and stable-sphere contracts above have single owners; their spectral
comparison maps are built here.

# Roadmap: high-dimensional differential topology and homotopy spheres

**Summary.** This roadmap develops the reusable smooth topology behind the Kervaire--Milnor groups of
homotopy spheres.  It constructs the simply connected smooth h-cobordism theorem, stable
homotopy groups of spheres, real Bott periodicity, the framing applications of stable oriented bundle classification,
smooth framing comparisons with the supplied Pontryagin–Thom theorem, surgery obstruction groups, and the Kervaire--Milnor exact
sequence.  The first complete low-dimensional calculation is `Theta_6 = 0`, followed by the
direct smooth recognition theorem for compact smooth homotopy six-spheres. It also computes
Θ₇ ≅ ℤ/28, compares its Eells–Kuiper and quaternionic bundle models, and proves
nonstandardness of the E₈ plumbing boundaries in every dimension 4k−1 with k > 1.

Every object is geometric or functorial.  `Theta_n` is formed from oriented smooth homotopy
spheres and h-cobordisms; convenient models for `A_n` and `P_n` arise from almost-framed cycles
and stably framed fillings and are compared with the historical Kervaire--Milnor and Wall
definitions.  Exactness is proved map by map.  No record is permitted to carry the desired group
calculations or exactness as input fields.

Suggested homes are `TauCeti/Geometry/Manifold/HCobordism/`,
`TauCeti/Geometry/Manifold/HomotopySphere/`, `TauCeti/AlgebraicTopology/StableHomotopy/`,
`TauCeti/AlgebraicTopology/FramedBordism/`, `TauCeti/Topology/VectorBundle/Classifying/`, and
`TauCeti/Geometry/Manifold/Surgery/Obstruction/`.

## Scope and ownership

The roadmap is complete when Tau Ceti proves the following connected development.

1. The shared collared-cobordism and handle APIs support Morse handle decompositions, Whitney
   moves, cancellation, and the simply connected smooth h-cobordism theorem in cobordism
   dimension at least six.
2. A Type-0 finite-atlas and handle code gives a small skeleton of compact second-countable
   smooth manifolds.  Every manifold in an arbitrary universe has a coded realization
   diffeomorphic to it, and changing the code does not change any geometric quotient class.
3. Oriented smooth homotopy `n`-spheres form the geometric group Θₙ for n ≥ 1 under
   connected sum, with inverse given by orientation reversal and an explicit inverse
   h-cobordism.
4. Stable sphere homotopy groups are constructed from suspension in compactly generated spaces.
   The James construction,
   Freudenthal theorem, EHP sequence, composition, and Toda brackets provide a reproducible
   calculation route rather than a table oracle.
5. Stable `O`/`SO`, the loop comparison with the shared `BSO` classifier, real Bott periodicity,
   and stable `J` are constructed in the same convenient category. The fixed-rank/stable
   classifiers and generic bundle classification are consumed from TopologicalKTheory T1.5–T1.6;
   their tangent/normal, clutching and smooth framing comparisons are constructed here.
6. The smooth tangent/normal framing comparison identifies the supplied finite and stable
   Pontryagin–Thom maps with the sphere models used here, preserving the Thom augmentation,
   products, boundary signs and the change-of-framing action of stable J.
7. Almost-framed bordism, the geometric `P_n` groups, Wall's simply connected surgery
   obstruction groups, and the Kervaire--Milnor sequence are defined and proved equivalent in
   the ranges in which their names are identified.
8. The complete chain through the sixth stable stem proves
   `pi_6^S ~= Z/2{nu^2}`, computes its Kervaire invariant, and combines this with the
   Kervaire--Milnor sequence to prove `Theta_6 = 0`.
9. A compact Hausdorff second-countable smooth six-manifold homotopy equivalent to the standard
   sphere has an orientation-preserving diffeomorphism to it after matching orientations, with
   the manifold orientations and derivative-preservation equation visible in the theorem.
10. The standard positive-dimensional sphere S^n admits a smooth tangent framing exactly
    when n∈{1,3,7}, with explicit frames and a complete Hopf-invariant exclusion; S⁰ has its
    trivial rank-zero tangent bundle.

The classification applications concern smooth manifolds of dimension at least five and the stable topology used
to classify their homotopy spheres. Section 3C also determines which standard
spheres admit a smooth tangent framing in every positive dimension.  Low-dimensional Poincare theorems, general non-simply-
connected surgery, pseudo-isotopy, and a calculation of every `Theta_n` are outside its stated
endpoint.

The division of ownership is as follows.

- The [algebraic-topology roadmap](../AlgebraicTopology/README.md) owns relative singular
  homology, excision, cellular comparison, Poincare duality, Hurewicz, Whitehead, and finite CW
  type.  This roadmap consumes those theorems in handle, surgery, framing-obstruction, and
  recognition arguments.  Its exact supplier contract consists of the representative
  `relativeHurewicz`, `homologicalWhitehead`, `poincareDualityMap_isIso`, and
  `compactManifoldFiniteCWType` declarations.  This roadmap owns the sphere-specific stable comparisons and low stable-stem calculations.
- The [geometric-topology roadmap](../GeometricTopology/README.md) owns manifolds with
  boundary and corners, collars, boundary gluing, standard handles, handle attachment, tubular
  neighbourhoods, connected sum, general framed surgery, the collared oriented-cobordism
  carrier, and smooth triangulation.  This roadmap uses those same objects.  It introduces no
  second boundary, collar, gluing, handle, surgery, connected-sum, cobordism, or triangulation
  type.
- [DifferentialGeometry Layers 2 and 10](../DifferentialGeometry/README.md) own chosen
  manifold orientations and degree. Consume its source-indexed chart-sign carrier, reversal,
  orientation-at-point and derivative-preservation laws, extending these to the collar
  comparisons below. Retain Tau Ceti's existing orientation-preserving groupoid and orientability
  API from `TauCeti.Geometry.Manifold.Orientation`; do not duplicate it.
- The [Heegaard Floer roadmap](../HeegaardFloer/README.md), Lanes M/F0, supplies the distinct
  trajectory and Morse–Smale inputs for handle decompositions, Whitney moves and cancellation.
  The finite-dimensional Sard, smooth-map and degree inputs use DifferentialGeometry.
- The [completed universal-covers roadmap](../../Completed/UniversalCovers/README.md) owns basepoint change, covering
  maps, and induced maps on homotopy groups.  The simple-connectivity and homotopy-equivalence
  arguments here consume those interfaces.
- [TopologicalKTheory T1.5–T1.6](../TopologicalKTheory/README.md) owns the finite real/oriented
  Grassmannian carriers, fixed-rank `BO(n)`/`BSO(n)`, stable `BO`/`BSO` colimits, universal
  bundle diagrams and finite-CW/numerable classification, including stabilization and
  clutching naturality and the simple connectivity of BSO in T1.6c. Use these actual carriers and maps. This roadmap owns stable `O`/`SO`,
  `Omega BSO ~=_h SO`, smooth tangent/normal framing applications and the full real Bott loop
  chain. Distinct homogeneous-space models have named comparisons respecting universal
  bundles, basepoints, stabilization and clutching, rather than a second classifier.
  The order is the early convenient-space substrate in 3A, T1.5–T1.6, then 4A–4B here,
  then TopologicalKTheory T7's real KO/ABS applications. The early classifier construction
  consumes neither this Bott theorem nor T7's later inverses/applications.
- The spin-representation section of the
  [representation-theory roadmap](../RepresentationTheory/README.md) owns the algebraic
  eightfold periodicity of real Clifford algebras and supplies the Clifford-module comparison
  input used in Stage 4B.  This roadmap owns the topological loop-space equivalences, stable
  `SO` table, and its framing/classifier comparisons on the shared TopologicalKTheory
  carriers; algebraic Clifford periodicity alone does not discharge them.
- [RiemannianGeometry R1–R3](../RiemannianGeometry/README.md)
  owns the normalized sphere Freudenthal theorem (R3 item 4), invariant and
  normal-homogeneous metrics, Jacobi fields, finite broken-geodesic
  manifolds, energy-band compactness, and their path-space comparisons. Stage 4B consumes
  these constructions for its selected metrics and owns the Bott-specific calculations.
- [MorseTheory M5](../MorseTheory/README.md)
  owns finite-dimensional Morse–Bott normal-Hessian and negative-bundle attachment.
  Stage 4B verifies its hypotheses and computes the actual negative bundles in the Bott chain.
- Mathlib supplies the carrier `CompactlyGenerated.{u,w}` and its fully faithful inclusion
  `i : CompactlyGenerated ⥤ TopCat`.  This roadmap packages `TopologicalSpace.compactlyGenerated` as the right
  adjoint `k` in the coreflection `i ⊣ k`, including the counit `i (k X) ⟶ X`, together with
  compactly generated products and mapping spaces, pointed closed structure, and the
  limit/colimit comparisons needed below.  It does not silently use ordinary `TopCat` products
  or limits where compact generation is required for an exponential law.

- [TangentialBordism B1, B3.2(b–c), B5.2](../TangentialBordism/README.md) owns
  relative facewise transversality, the Spin-surface refinement and filling criterion, and
  honest-rank finite Pontryagin–Thom. [StringOrientation S2.2–S2.3](../StringOrientation/README.md)
  owns the general coefficient and stable framed Pontryagin–Thom theorem and the
  normalized third sphere stem. Section 9.1 retains the EHP/framed-fibre generator comparison; Section 5 retains
  the distinct smooth tangent/normal dictionary, honest-framing cancellation and generator comparisons.
- [TopologicalKTheory T1.5a](../TopologicalKTheory/README.md) owns finite Stiefel
  connectivity, the normalized sphere-bundle boundary and the finite π₁SO calculation.
  Section 4A retains its smooth unit tangent and matrix-model comparisons.
- [IndexTheory I7.2 and I7.5](../IndexTheory/README.md) owns the geometric signature
  and chiral Spin index theorems; Section 9A owns their filling and Bott-normalization applications.
- [GeneralizedCohomology G5 item 6](../GeneralizedCohomology/README.md) owns rational
  sphere vanishing, and [DGFloer Layer 1 item 4](../DGFloer/README.md) owns Hurewicz
  modulo a Serre class. Section 9A specializes these to integral finiteness of the sphere stems.

## Conventions

These conventions apply throughout the layers.

- **Manifolds are types with Mathlib instances.**  Use `TopologicalSpace`, separation and
  countability classes, `ChartedSpace`, `IsManifold`, compactness, and connectedness.  Carry
  orientation and framing data explicitly.  An orientation is the shared
  `Manifold.Orientation I M ι`, including its local chart compatibility; an arbitrary function
  from points to linear orientations is not an orientation.  Do not introduce a bundled manifold
  record whose fields assert these properties.  On a collared manifold, the boundary orientation
  is determined from the ambient orientation by the collar derivative and the outward-normal-first
  convention; an unrelated orientation on the boundary carrier is insufficient.
- **Geometric quotients use a small skeleton.**  A smooth atlas code of dimension `n` consists of finitely many
  charts on `EuclideanSpace R (Fin n)`, transition maps in the smooth groupoid, finite
  triangulation or handle data, and the exact cover and cocycle laws.  Its realization is the
  quotient of the disjoint union of chart domains.  Prove that every compact Hausdorff
  second-countable smooth manifold in `Type u` is diffeomorphic to a realization and that two
  codes for the same manifold represent the same bordism class.  Thus the cycle and quotient
  carriers live in Type 0 without quantifying over all types in a universe.
  Source and target equations, identity, inverse, cocycle, cover/surjectivity, and separation laws
  are fields of this code or theorems of the pre-existing gluing code; they are not prose promises
  attached to an otherwise unconstrained quotient relation.  The realization carries the
  canonical quotient topology, each domain map is an open embedding, and its `ChartedSpace` atlas
  is generated by the inverse quotient charts. Transitions agree with the coded maps in
  `OpenPartialHomeomorph.EqOnSource` (`≈`), with exact source/target overlap equations;
  values outside the overlap are unconstrained. Require each listed chart domain nonempty,
  while allowing zero charts to realize the empty manifold. Realize a proper open chart
  such as `(-1,1)`, as well as a global Euclidean chart, before using the skeleton.
  Choosing unrelated topology or charted-space instances on the quotient does not implement this
  skeleton.
- **Stable topology uses one convenient category.**  Based mapping objects are compact-open
  mapping spaces followed by compact generation in `CompactlyGenerated.{u,w}`.  Products,
  smash products, loop spaces, suspensions, James constructions, stable classical groups,
  classifying spaces, and their filtered colimits are formed there.  Prove comparison
  homeomorphisms with Mathlib's ordinary spaces for locally compact Hausdorff and CW inputs and
  prove that the forgetful functor preserves every limit or colimit used below.
- **Dimensions are explicit.**  A smooth h-cobordism of boundary dimension `n` has total
  dimension `n+1`.  The simply connected theorem assumes total dimension at least six.  Every
  cancellation lemma states the handle indices, ambient level dimension, and codimension
  inequalities it needs.
- **`Theta_n` is geometric.**  A cycle is an oriented closed smooth manifold equipped with a
  homotopy equivalence to the standard `S^n`; the marking is used to prove the sphere condition,
  not retained as extra moduli.  The relation is oriented h-cobordism on the shared cobordism
  carrier. For n ≥ 1 the quotient group structure descends from geometric
  connected sum (Kervaire–Milnor, Theorem 1.1, p.504, and §2, pp.505–507).
  Only the comparison with oriented diffeomorphism classes below assumes n ≥ 5.
  Dimension zero is excluded from this connected-sum group convention.
- **Stable groups are colimits of standard groups.**  Sphere stabilization is induced by
  suspension; stable `SO` is induced by block inclusion.  Both are literal colimits with
  canonical inclusions and their universal properties.  Transition maps, stable-range
  comparisons, products, and `J` commute by proved diagrams.  A family of abstract groups with
  the expected values is not an implementation.
- **Use the shared classifying spaces for stable bundles.** Consume TopologicalKTheory
  T1.5–T1.6's actual oriented Grassmannian `BSO`, universal bundle and stabilization maps.
  Construct the comparison with the classifying model of the stable principal `SO` object,
  including the universal bundle and its basepoint; an abstract equivalence alone is insufficient.
  Stable bundle equivalence is stabilization by trivial real bundles.  A stable framing is a
  chosen smooth vector-bundle equivalence
  `TM directSum epsilon^r ~= M times R^(n+r)`, not a proposition asserting that one exists and not
  a family of equivalences between fixed model spaces.  An honest framing similarly trivializes
  the actual tangent bundle.  Construct the source with Mathlib's canonical tangent bundle,
  `Bundle.Trivial`, and fibrewise bundle product; a framing must not carry replacement topology,
  `FiberBundle`, `VectorBundle`, or smooth-bundle instances for that source. Require the
  global linear trivialization and its inverse to be smooth for the canonical total-space
  structures. Membership in the designated trivialization atlas is not required: a global
  smooth frame need not be a single manifold chart. Check the Lie-group framing of `S³`,
  its stabilization, and the outward-normal stable framing of a standard sphere.
- **Tangent and normal framings are related by an embedding.**  For an embedding
  `M -> R^(n+k)`, prove `TM directSum nu ~= trivial` and make the tangent/normal framing
  correspondence independent of stabilization and isotopy.  Do not identify the two framings
  definitionally. Restriction to a codimension-one submanifold consumes a chosen smooth
  normal-line framing and a smooth splitting `TM ⊕ ℝ ≅ f*TN` whose first summand is the
  actual derivative of `f`; the dimension equation is explicit. Smoothness is imposed on the
  forward and inverse maps of the canonical total bundles, not on a family of matrices between
  fixed model spaces: the latter would incorrectly trivialize `TM`. The outward normal of
  `S² -> R³` is a example, without assuming that `TS²` is trivial. General embeddings do not
  supply a trivial normal line. Boundary restrictions use the collar's outward normal.
  The outward-normal-first ordering and its permutation into the fixed stabilization
  convention are part of the construction. Incoming comparisons reverse that normal line.
- **Stable and honest framings remain distinct.**  A cycle carrying only a trivialization after
  adding trivial summands is called stably framed or s-parallelizable.  An honestly parallelizable filling is obtained only after the absolute bundle cancellation and prescribed
  stable-class lift produce an honest tangent trivialization. Compare its gauge-normalized
  stabilization with the prescribed stable frame, retaining the actual moving boundary path.
  Product structure is on an explicitly returned proper subcollar, not the entire supplied collar.
- **Product near a boundary carries a proper width.** Every collar product witness, for a
  filling, a defect exterior or the lateral face of a defect tube, returns a width
  `0 < ε < 1` and asserts equality of trivializations only on total-bundle vectors whose base
  has collar time `s < ε` in the supplied collar coordinates. Nothing is asserted near the
  missing width-one end of a half-open collar. A smaller positive width keeps the same boundary
  or lateral frame; reparametrizing by `c_ε(s,b) = c(εs,b)` multiplies the collar normal by the
  positive factor `ε`, and every framing comparison carries that factor.
- **Pontryagin--Thom is constructed in both directions.**  The collapse map uses a chosen
  tubular neighbourhood and a normal framing; independence is a theorem.  The inverse uses
  smooth approximation, a regular value, and the induced framed submanifold.  The two bordisms
  witnessing inverse laws are required.  Collapse and Thom-space augmentation are continuous
  pointed maps with the collapsed complement and sphere basepoints displayed.  Pointed convenient
  spaces and maps use the under-category of `CompactlyGenerated`, the normal rank `k` is the
  codimension of the displayed embedding `M -> R^(n+k)`, the collapse is the map determined by the
  displayed tubular diffeomorphism, and the augmentation is the pointed Thom equivalence followed
  by the standard suspended augmentation.  Arbitrary maps satisfying only continuity and a
  basepoint equation are insufficient. An allowed smooth tubular neighbourhood has normal derivative
  inducing the identity on the actual normal quotient and compresses the normal bundle onto its
  disc domain by a strictly positive radial factor; the framed Thom equivalence is
  constructed from the displayed normal trivialization and is not a separately chosen pointed
  isomorphism. Each of these three requirements excludes a fibre reflection that would reverse
  the sign of the collapse with the framed cycle unchanged.
- **Every quotient relation has geometric witnesses.**  H-cobordism, framed bordism,
  almost-framed bordism, the stable-filling relation, and both historical relations are
  `Nonempty` types of the specified collared cobordisms and compatible bundle data.  A named
  `Prop` with an unspecified body, or an unconstrained `Setoid`, does not define one of these
  quotients.
- **Exactness is expressed by maps.**  Define each homomorphism in the Kervaire--Milnor sequence,
  prove its independence from choices, prove consecutive composites vanish, and identify each
  kernel with the preceding image.  Do not store an indexed exact sequence as fields of a
  bespoke record.
- **Separate three uses of `P`.**  The EHP map `P`, the geometric surgery-obstruction group
  `P_n`, and the subgroup `bP_(n+1) <= Theta_n` receive distinct qualified Lean names.  `P_n` is
  not definitionally a Wall `L`-group; their comparison is a theorem.
- **Pin surgery normalizations.**  In dimension `4k`, the geometric invariant on a
  parallelizable filling is `signature/8`.  In dimension `4k+2`, it is the Arf invariant of the
  middle-dimensional quadratic refinement.  Boundary orientation is outward-normal-first.
- **Smooth recognition has honest hypotheses.**  The final direct theorem states compactness,
  Hausdorffness, second countability, boundarylessness, the six-dimensional manifold model, and
  a homotopy equivalence.  It does not invoke an unrestricted proposition whose typeclasses omit
  those assumptions.

## Exact supplier contracts

**From Mathlib.** Use the following native carriers and maps at their stated hypotheses.

- `HomotopyGroup`, based cubes, `ContinuousMap.HomotopyEquiv`, `Quotient`,
  `TopologicalSpace.coinduced`, homotopy lifting, and fundamental groupoids. The pointed
  cone, suspension and mapping-cone comparisons are specified in Section 3A.2.
- Singular homology, `TopPair`, Mathlib's CW-complex structures, metric spheres, and the
  algebraic-topology roadmap's relative Hurewicz, Whitehead, duality, and finite-CW-type results.
- `ModelWithCorners`, `ChartedSpace`, `IsManifold`, tangent bundles, smooth maps,
  `Diffeomorph`, and `exists_embedding_euclidean_of_compact`.
- `Matrix.orthogonalGroup`, `Matrix.specialOrthogonalGroup`, Lie groups, topological groups,
  vector bundles, pullbacks, direct sums, quotient spaces, `CompactlyGenerated.{u,w}`,
  categorical filtered colimits, and `AddCommGrpCat`.  Mathlib's compactly generated category
  supplies the carrier, its fully faithful inclusion and `TopologicalSpace.compactlyGenerated`
  (`Mathlib/Topology/Compactness/CompactlyGeneratedSpace.lean`, line 67); the categorical coreflector (the
  right adjoint of that inclusion), its adjunction, and the Cartesian closed API are targets here,
  not inferred instances.
- Geometric topology's boundary, collar, gluing, tubular-neighbourhood, connected-sum, handle,
  surgery, cobordism, and triangulation outputs; DifferentialGeometry's orientations, degree
  and Sard theorem; and Heegaard Floer's distinct trajectory and Morse–Smale inputs.

**From Tau Ceti.** `TauCeti.IsOrientedAtlas` and
`TauCeti.orientationPreservingGroupoid` in `TauCeti/Geometry/Manifold/Orientation.lean`
provide the atlas orientation language. `TauCeti.isManifold_boundary` and
`TauCeti.isSmoothEmbedding_subtypeVal_boundary` in
`TauCeti/Geometry/Manifold/Boundary/Charts.lean`, lines 321 and 374, give the boundary
model and its smooth inclusion for a finite-dimensional half-space model and differentiability
order k ≠ 0. `TauCeti.simplyConnectedSpace_sphere_euclideanSpace` in
`TauCeti/AlgebraicTopology/Sphere/SimplyConnected.lean`, line 408, gives simple connectivity
of Sⁿ for n ≥ 2. Full collared cobordism and product/gluing data are the geometric contracts below.
`TauCeti.MappingCylinder` and `TauCeti.MappingCylinder.homotopyEquiv` in
`TauCeti/Topology/Homotopy/MappingCylinder.lean`, lines 81 and 399, give the ordinary
unreduced mapping cylinder and its equivalence with the target. Its defining quotient
identifies (1,a) with f(a); it does not collapse the basepoint meridian or the free end.
Section 3A.2 constructs the pointed quotient comparisons from these primitives.

**From TauCetiRoadmap.GeometricTopology.** Layer 1 supplies collars, boundary gluing,
normal tubes, connected sum and handles; Layer 6 supplies oriented cobordisms in general dimension;
The smoothing-and-triangulation comparison, item 1, supplies smooth triangulation.

**What GeometricTopology must provide (gap:collared-oriented-bordism):** a carrier of compact
oriented bordisms with specified closed oriented incoming M₀ and outgoing M₁, allowing empty
and disconnected manifolds. Each element has two disjoint boundary embeddings whose images
cover the whole boundary, induced orientation −M₀ ⊔ M₁, and positive collars. Composition
and product cylinders preserve these data. The carrier for a given pair may be empty; no
existence assertion is made for arbitrary M₀ and M₁.
In particular the empty cylinder has no boundary components and the cylinder on M ⊔ N has
exactly the two prescribed components at each end. General collar existence does not specify
these endpoint identifications. Section 6A owns the sphere-specific closed defect exterior,
half-space chart comparison, proper defect tube and its lateral/endpoint equations; these
are adapters over Layer 1, not new general cobordism carriers.

**From TauCetiRoadmap.DifferentialGeometry.** Layers 2 and 5.1 supply orientations,
pointwise comparison, reversal and outward-normal-first boundary orientation; Layers 3
and 10 supply flows, finite-dimensional Sard and degree. Relative smooth approximation
with protected faces uses TangentialBordism B1.
**From TauCetiRoadmap.HeegaardFloer.** Lanes M and F0 supply Morse–Smale trajectory
and transversality inputs for handle cancellation, in their relative compact setting.
**From TauCetiRoadmap.AlgebraicTopology.** Stages 2–4, 6 and 8 supply relative chains,
CW comparison, duality, Hurewicz and Whitehead; use `relativeHurewicz`,
`homologicalWhitehead`, `poincareDualityMap_isIso` and `compactManifoldFiniteCWType`.
Completed/UniversalCovers supplies covering maps and basepoint transport.

**From TauCetiRoadmap.TopologicalKTheory.** T1.5a gives the finite Stiefel sphere fibrations,
determinant components of O(r), connectivity and π₁SO, including SO(0), SO(1) points, π₁SO(2)=ℤ and π₁SO(r)=ℤ/2 for r≥3.
T1.5–T1.6 give the actual fixed-rank/stable Grassmannian classifiers, universal bundles,
clutching and stabilization diagrams; T1.6c gives simple connectivity of the actual BSO. T2.5 and T3–T4 give positive Adams operations,
compact-pair exactness and complex Bott classes; T7 gives the geometric real Bott ring
and complexification c(a)=2u², c(b)=u⁴. Section 4B's loop proof uses only the early
classifiers, RiemannianGeometry R1–R3 and MorseTheory M5, not T7.
**From TauCetiRoadmap.RiemannianGeometry.** R3 item 4 supplies the normalized sphere
suspension comparison: π_q(Sᵐ)→π_(q+1)(S^(m+1)) is an isomorphism for
q≤2m−2 and a surjection at q=2m−1, m≥2. Section 3A.4 transports its actual map
to the convenient suspension and colimit models. R1–R3 also supply the metric, Jacobi
and finite broken-geodesic inputs of Section 4B.
**From TauCetiRoadmap.CharacteristicClasses.** C6.2–C6.3 give the normalized multiplicative
Chern character; C7.3 gives the native sphere tangent/hyperplane comparison; C7 gives
formal L and Â polynomials. These polynomials alone assert no equality with a geometric index.
**From TauCetiRoadmap.SpinRepresentations.** L7 supplies the real Clifford algebra table
with its native signature convention. **From TauCetiRoadmap.SpinGeometry.** G4 gives
Spin lifts and G6 item 5 their circle and torus conventions.

**From TauCetiRoadmap.TangentialBordism.** B1's relative approximation/transversality fixes
a closed subset only when every fixed face is already transverse there; it gives neat inverse
images and product-collar comparisons. B5.2 gives the marked-sphere finite PT bijection for
normal rank c≥1 and cycle dimension d≥0, both inverse bordisms, pinch addition,
domain-reflection inverse and normal stabilization. B3.2(b–c) gives the geometric refinement
q, its polarization, and the Spin filling criterion Arf(q)=0. Its declared
gap:finite-quadratic-arf specifies the needed finite nonsingular quadratic algebra over 𝔽₂:
basis-independent Arf invariant, orthogonal sums, hyperbolic/anisotropic decomposition and
Arf zero exactly when a q-zero Lagrangian exists, including the zero-dimensional form.
B4.1–2 and B4.7 give ordinary operations and convergent Adams towers for the finite-type
bounded-below sphere calculation in 9A.
**From TauCetiRoadmap.StringOrientation.** S2.2–S2.3 give coefficient PT for bundle diagrams,
its multiplicativity and the stable framed specialization Ω⁽fr⁾ₙ ≅ π⁽S⁾ₙ; Section 5 constructs
only its comparison with the chosen smooth tangent/normal and unstable sphere models.
S2.3 also supplies π₃⁽S⁾≅ℤ/24 with its quaternionic Hopf generator and the native
π_(n+3)(Sⁿ) form for n≥5; Section 9.1 compares that generator with the EHP and framed-fibre models.

**From TauCetiRoadmap.IndexTheory.** I7.2 supplies σ(M)=⟨L(TM),[M]⟩ for every closed
oriented smooth 4k-manifold. I7.5 with the trivial complex line twist supplies
indℂ(D⁺)=⟨Â(TM),[M]⟩∈ℤ for a closed Spin manifold, with its chosen orientation and Spin
structure. In dimension eight these give σ=(7p₂−p₁²)/45 and
Â₂=(7p₁²−4p₂)/5760=(p₁²−4σ)/896. They are independent of the homotopy-sphere classification.
**From TauCetiRoadmap.GeneralizedCohomology.** G5 item 6 supplies π⁽S⁾ᵢ⊗ℚ=0 for i>0
and π⁽S⁾₀⊗ℚ=ℚ. **From TauCetiRoadmap.DGFloer.** Layer 1 item 4 supplies the Serre-class
Hurewicz theorem; apply the class of finitely generated abelian groups to finite simply
connected spheres, then the finite-to-stable comparison of 3A.4, to get finitely generated stems.

Mathlib's `ContinuousMap.HomotopyEquiv.NonemptyDiffeomorphSphere`
(`Mathlib/Geometry/Manifold/PoincareConjecture.lean`, line 41) includes Hausdorffness,
but not compactness or second countability. The direct recognition theorem in Layer 10
carries all three hypotheses explicitly.

## How to read the build

Layers 1–2 construct h-cobordism and its homotopy-sphere quotient. Layer 3 constructs
pointed and stable sphere topology, including the standard-sphere framing theorem; Layer 4
constructs the group/loop Bott and J comparisons. Layer 5 transports the supplied PT and
Spin results through actual smooth framings. Layers 6–8 construct the almost-framed and
filling groups, surgery and the exact comparisons. Layer 9 computes Θ₆ and Layer 10 proves
smooth recognition; the separate Layer 9A computes Θ₇ and the E₈ applications. Section
identifiers 3A–3C, 4A–4C, 5.0, 5.0b, 6A–6C and 7A–7C name these same sublayers.

`Suggested.lean` states `sphere_parallelizable_iff`, `orthogonalGroup_bottPeriodicity`,
`orthogonalGroup_secondHomotopyGroup`, `orthogonalGroup_thirdHomotopyGroup`,
`orthogonalGroup_fourthHomotopyGroup`, `orthogonalGroup_fifthHomotopyGroup`,
`orthogonalGroup_sixthHomotopyGroup`, `orthogonalGroup_seventhHomotopyGroup`,
`orthogonalGroup_eighthHomotopyGroup`,
`sphere_homotopyGroup_sixthStem`, `sphere_homotopyGroup_seventhStem`,
`smoothPoincareSix_oriented` and `smoothPoincareSix`.
`Sphere n` is the native unit sphere in ℝⁿ⁺¹, and `OrthogonalGroup n` is
`Matrix.orthogonalGroup (Fin n) ℝ`. `PreservesOrientedAtlases f A B` requires every transition
from an A-chart transported along f to a B-chart to belong to
`TauCeti.orientationPreservingGroupoid`. The supplied atlas/pointwise orientation comparison
identifies this with derivative preservation. The module docstring identifies the missing
carriers for the other headlines; their full statements remain below.

## Layer 1: h-cobordisms and the high-dimensional theorem

This stage consumes geometric topology, DifferentialGeometry orientations/Sard, and the
Heegaard-Floer trajectory and Morse–Smale foundations.

### 1.1 H-cobordism witnesses

*Needs:* GeometricTopology Layer 6 and gap:collared-oriented-bordism; AlgebraicTopology homotopy equivalences.

On the existing oriented collared-cobordism carrier, define an h-cobordism W by requiring
both boundary inclusions to be homotopy equivalences.  Prove invariance under equivalence,
reversal, composition, and boundary connected sum.  Prove that h-cobordism induces an
equivalence relation on closed oriented manifolds.

### 1.2 Morse handles

*Needs:* MorseTheory M3; HeegaardFloer Lane M; GeometricTopology Layer 1 handle attachments.

From Morse functions on a compact cobordism, build a finite ordered handle decomposition.
Prove independence under reordering of disjoint critical levels, creation/cancellation of a
cancelling pair, and handle slides.  Identify attaching spheres, belt spheres, and their
algebraic intersection matrices. The handle and deformation-retract inputs are
Milnor, Theorems 3.13–3.14 and Corollary 3.15, pp.31–32; ordered critical levels
use Theorem 4.8, p.44. The translation to the shared handle and collar data is an adapter here.

### 1.3 Handle trading

*Needs:* 1.1–1.2; AlgebraicTopology relative homology and simple connectivity.

For a compact smooth h-cobordism W of dimension n+1≥6 with W and both ends
simply connected, prove handle trading: remove indices `0,1,n,n+1`, use relative homology and
simple connectivity to put the remaining boundary operators into elementary form, and realize
the elementary row and column operations by handle slides (Milnor, Theorems 7.6,
7.8 and 8.1, pp.92, 97 and 100, with the self-indexing decomposition of Theorem 4.8).

### 1.4 Local Whitney moves

*Needs:* GeometricTopology Layer 1 tubes and isotopies; a displayed embedded framed Whitney disc with disjoint interior.

Prove the local Whitney move.  If two transverse intersections of opposite sign are joined by
an embedded framed Whitney disc whose interior misses both submanifolds, construct an ambient
isotopy removing the pair and prove its support and framing properties
(Milnor, Theorem 6.6 and the local-disc construction in its proof, pp.71–76).

### 1.5 Whitney discs in codimension at least three

*Needs:* 1.4; simple connectivity of the level manifold; general position with p,q≥3.

Let V be a simply connected smooth manifold of dimension p+q, and let P,Q be closed
transverse complementary submanifolds with p,q≥3, P oriented and the normal bundle of Q
oriented. For two opposite-sign intersections, require specified embedded arcs between
them in P and Q whose interiors avoid all other intersections. Their union is the Whitney
loop; use simple connectivity to contract it and construct a framed Whitney disc with
interior disjoint from P∪Q (Milnor, Theorem 6.6 and its remark, pp.71–72). Prove
the complement and relative general-position steps (Lemmas 6.10–6.12, pp.78–79).
When both submanifolds are connected, derive the required arcs by deleting the other
intersection points. Ambient simple connectivity alone does not supply arcs in disconnected P or Q.

### 1.6 The five-dimensional level

*Needs:* 1.2–1.4; the two embedded arcs of 1.5; injectivity of π₁(V∖Q)→π₁(V); relative general position and piping.

Treat the six-dimensional cobordism boundary case separately.  For index-two/index-three
cancellation the level V is five-dimensional and (dim P,dim Q)=(2,3). Require the
opposite-sign pair and the arcs avoiding other intersections as above, and require the
inclusion π₁(V∖Q)→π₁(V) to be injective. For simply connected V this means
π₁(V∖Q)=0. Use this condition for the contraction off Q and the piping argument
(Milnor, Theorem 6.6, p.71, and its proof, pp.73–89).
For the attaching/belt-sphere instance, prove the gradient-flow identification of
V∖Q with the incoming level minus the attaching circle; removing that circle in a
simply connected five-manifold preserves π₁ by codimension four. This proves the
required complement condition (Milnor, proof of Theorem 6.4, pp.72–73, the λ=2 case).
The three-sphere Q itself has codimension two, so codimension-three general position
cannot replace this argument.

### 1.7 The smooth product theorem

*Needs:* 1.3–1.6; compact simply connected h-cobordism of total dimension at least six; Milnor, Theorem 9.1, p.107.

Cancel adjacent handles and prove the simply connected smooth h-cobordism theorem for total
dimension at least six.  Produce a diffeomorphism rel the incoming boundary with a product
cobordism, and deduce an orientation-preserving diffeomorphism between the two boundaries.

Milnor, *Lectures on the h-Cobordism Theorem*, Theorem 9.1, p.107, is the product theorem;
Sections 3–8 supply its proof inputs: Morse handles,
algebraic simplification, Whitney discs, and cancellation occur in that order.  Smale,
*Generalized Poincare's Conjecture in Dimensions Greater Than Four*, supplies the simply
connected specialization and its smooth-recognition application.

### Examples

The h-cobordism predicate has the following API on the shared oriented collared carrier.

- Both specified boundary inclusions are homotopy equivalences; reversal exchanges them.
- Gluing along the identified boundary composes witnesses and retains the exterior collars.
- A product cylinder represents reflexivity, with orientation −M at time zero and +M at time one.

**Checks.**

- For M×I, each boundary retraction has composite id_M, so both inclusions are equivalences.
- A disc viewed from the empty incoming boundary has π₀(∅)=∅ and π₀(Dⁿ)={*}; it is a bordism but not an h-cobordism.
- The empty cylinder has zero boundary components; the cylinder on M⊔N has two incoming and two outgoing components. Requiring connected traces would reject the latter.

For the handle and Whitney constructions, a cancelling pair with intersection matrix [1]
has zero relative homology. Two oppositely signed intersections contribute +1−1=0,
but this algebraic equality is used only after producing the framed Whitney disc.
The level-dimension-five case has dimensions 2+3=5 and is not covered by p,q≥3.

**Checks for the Whitney hypotheses.**

- In S³×S³, P=(S³×{a})⊔(−S³×{b}) and Q={c}×S³ have intersection signs +1,−1 but no arc in P joining the two points; their componentwise counts remain (1,−1), although the total is 0.
- A local opposite-sign pair on the same components has the two arcs and a nullhomotopic Whitney loop; the move changes its intersection count from 2 to 0 while preserving signed sum 0.
- In the five-dimensional level, Q has codimension 5−3=2; the incoming attaching circle has codimension 5−1=4. The latter complement has π₁=0 and its gradient-flow identification supplies the former complement condition.

### Dependencies

*Needs:* GeometricTopology Layers 1 and 6, including gap:collared-oriented-bordism;
DifferentialGeometry Layers 2, 3 and 10; HeegaardFloer M/F0; AlgebraicTopology Stages 2–4, 6 and 8.
The simply connected theorem assumes a compact smooth h-cobordism, simply connected
boundary and total dimension n+1≥6; no such dimension bound is imposed on the predicate.

## Layer 2: oriented homotopy spheres and `Theta_n`

### 2.1 Finite codes and homotopy spheres

*Needs:* GeometricTopology, The smoothing-and-triangulation comparison, item 1; AlgebraicTopology finite CW type; native smooth atlases and sphere simple connectivity.

Build the finite-atlas/handle skeleton fixed above and its realization functor.  Define an
oriented smooth homotopy `n`-sphere code as a coded closed oriented smooth `n`-manifold with
a homotopy equivalence to Mathlib's standard metric sphere.  Prove essential surjectivity for
arbitrary `M : Type u`, code-change invariance, compactness, connectedness for n≥1, simple
connectivity for `n>=2`, integral homology, and finite CW type from the cited dependencies.

### 2.2 Connected sum

*Needs:* GeometricTopology Layer 1; 2.1; Kervaire–Milnor Lemma 2.1, p.505.

Instantiate geometric topology's connected sum on homotopy spheres.  Prove closure and descend
its existing choice-independence, associativity, commutativity, sphere identity, and
orientation laws to h-cobordism classes.

### 2.3 The inverse h-cobordism

*Needs:* 2.1–2.2; GeometricTopology Layer 1 product and handle gluing; Kervaire–Milnor §2, pp.505–507.

Construct the inverse cobordism: start from the punctured cylinder on `Sigma`, attach the
standard connecting handle, and prove its outgoing boundary is
`Sigma # (-Sigma)` while the incoming boundary is the standard sphere.  Orientation reversal
alone is not the inverse proof.

### 2.4 The quotient group

*Needs:* 2.1–2.3; Kervaire–Milnor Theorem 1.1, p.504; Layer 1 only for the n≥5 diffeomorphism comparison.

Define `Theta_n` as the Type-0 quotient of coded oriented homotopy spheres by the geometric
h-cobordism relation and give it an `AddCommGroup` structure for n ≥ 1.  Supply the quotient
constructor, induction principle, and lift theorem.  Prove that equality in `Theta_n` is
equivalent to oriented diffeomorphism for n ≥ 5 by Layer 1 and that the class assigned to
an arbitrary-universe manifold is independent of its small code.

Kervaire–Milnor, *Groups of Homotopy Spheres I*, Theorem 1.1, p.504,
Lemma 2.1 and the inverse construction in §2, pp.505–507, fix the definitions,
orientation conventions, connected-sum operation, and inverse argument.

### Examples

The finite atlas realization has its own API.

- The quotient topology makes every coded chart an open embedding, with exactly the coded overlaps.
- Identity, inverse and cocycle equations identify the chart transitions on their actual sources.
- A diffeomorphism to any coded realization gives the same h-cobordism class after changing code.

**Checks.**

- Zero chart domains give the empty realization, of cardinality 0; a listed empty chart is rejected by the nonempty-domain law.
- One chart with domain (−1,1) realizes that interval with that chart image, whereas a chart with domain ℝ realizes ℝ. A construction replacing every domain by the full model fails the first image equation.
- Two copies of ℝ identified by the identity have one point over each real number, not two; omitting the overlap relation gives the wrong quotient.

The oriented homotopy-sphere code and its quotient Θₙ, n≥1, have the following API.

- Forgetting the code returns a closed oriented smooth manifold with an actual homotopy equivalence to Sⁿ; the equivalence is not an extra marking in the quotient.
- Connected sum descends to addition, the standard sphere is zero, and reversing orientation gives the inverse by the punctured-cylinder witness.
- Quotient induction and descent use geometric h-cobordisms; for n≥5, equality is also equivalent to an oriented diffeomorphism.

**Checks.**

- For n=3 and n=4 the cylinder gives [Σ]+[Sⁿ]=[Σ], and the punctured-cylinder witness gives [Σ]+[−Σ]=0 without a smooth four-sphere classification.
- Sⁿ has top reduced integral homology ℤ; a point has zero reduced homology and is not a positive-dimensional homotopy-sphere code.
- Replacing a sphere homotopy equivalence by its composite with a reflection changes its degree from +1 to −1 but not the underlying oriented cycle. Retaining that marking as moduli would create a spurious distinction.

The native `Sphere` model has two points at n=0, the unit circle at n=1, and smooth tangent
rank n at every point. Its API is the native sphere topology, manifold structure and tangent
bundle; the empty frame at n=0 does not satisfy the positive-dimensional framing theorem's hypothesis.

### Dependencies

*Needs:* GeometricTopology Layer 1 connected sum and The smoothing-and-triangulation comparison, item 1;
AlgebraicTopology finite CW comparison and sphere homology; Layer 1 for the h-cobordism
relation and, only in n≥5, its product theorem; Tau Ceti sphere simple connectivity for n≥2.
Kervaire–Milnor Theorem 1.1 and §2, pp.504–507, give the group law in its positive-dimensional range.

## Layer 3: stable sphere homotopy, the James construction, and EHP

### 3A. Pointed constructions and stabilization

#### 3A.1 Compact-generation adjunction

*Needs:* Native compactly generated topology and category; the displayed universe of compact Hausdorff test spaces.

Complete Mathlib's `CompactlyGenerated.{u,w}` interface without replacing its existing
fully faithful inclusion `i : CompactlyGenerated ⥤ TopCat`: package `TopologicalSpace.compactlyGenerated` as
the right adjoint `k : TopCat ⥤ CompactlyGenerated`, prove `i ⊣ k`, and expose the counit
`i (k X) ⟶ X`.  Prove that colimits used below are created and preserved by `i`, while limits
are computed by applying `k` to the corresponding `TopCat` limit; in particular, define the
convenient product as `k` of the ordinary product.  Define compact-open exponentials followed
by `k`, prove the exponential law, and develop pointed objects, based internal homs, and the
required sequential colimits.  Prove comparison theorems with ordinary `TopCat` for CW
complexes and locally compact Hausdorff sources.  All subsequent loop spaces, James
constructions, stable classical groups, and classifying spaces use this one carrier.

#### 3A.2 Pointed cones and Puppe sequences

*Needs:* 3A.1; AlgebraicTopology Stage 4.5 cofibrations and contractible collapse, and Stage 8 relative homotopy.

Build reduced suspension, based loop space, smash product, mapping cone, cofiber sequences,
and Puppe sequences in the same pointed category as the algebraic-topology roadmap's relative
homotopy groups.  Prove the suspension--loop adjunction on maps and on pointed homotopy classes.
Own the earlier co-H law on reduced suspension with its explicit quotient
collapsing both ends AND the marked meridian. Pinch at1/2, reflect the
interval for inverse, and prove unit/associativity/inverse homotopies by
continuous variable-duration loop reparametrizations through the adjunction.
Inverse cancellation runs an initial fraction of a loop and retraces it;
zero-duration endpoints use the compact-interval pasting proof. On double
suspension prove the two coordinate pinches have one unit and satisfy
interchange on the four rectangles, hence Eckmann–Hilton commutativity.
Retain strict basepoint tracks and naturality. This early construction uses
3A.1's actual k-products/exponentials and no EM-loop weak-equivalence upgrade,
CW-type theorem, EHP or stable stem. Ordinary compact-open comparisons keep
their real evaluation hypotheses; compactness of I alone does not make
arbitrary ordinary mapping spaces Cartesian closed.
Use cone coordinates (a,t) with base at1 and apex at0. Define the reduced
cone by collapsing A×{0} and the entire basepoint meridian {a₀}×I,
and the reduced mapping cone C_f by gluing its base through the actual
based f:A→X. Supply its based universal property, homotopies and map
naturality. Compare these pointed quotients with ordinary quotient models
through3A.1; no unreduced apex is silently identified with x₀.
Prove based nullhomotopies of g∘f are exactly extensions of g:X→Y
across C_f, with F([a,t])=H(1−t,a), and deduce full kernel=image for
[C_f,Y]_*→[X,Y]_*→[A,Y]_* as pointed sets. For closed cofibration
inclusions, use AT4.5 pushout/contractible-collapse to construct the based
equivalence C_i→X/A and both inverse homotopies. For well-pointed
Hausdorff compactly generated A,X, prove X→C_f is a closed cofibration,
with the actual product, union and pushout HEP/NDR construction and
well-pointedness of the new spaces. Identify C_f/X with reduced ΣA,
construct the next homotopy-cofiber comparisons with ΣX and ΣC_f,
and iterate with explicit connecting maps and interval-reversal signs.
Construct pointed mapping-cylinder replacements for arbitrary based maps,
retaining their basepoint meridians and homotopies. Prove ordinary CW and
closed-HEP comparisons under their actual hypotheses; keep raw TopCat
quotients and convenient k constructions related by specified maps.
Apply the based cone extension criterion at every stage to obtain the long
exact Puppe sequence into every pointed Y, meaning the image is the full
preimage of the constant class. Give group structures only at the stages
supplied by suspension/loop adjunctions. AT8.11b consumes these maps for
its distinct cup/suspension sign comparisons; it is not a premise of this
elementary pointed exactness theorem. Preserve pointed homotopy and
relative-subspace naturality, including the one-point and disconnected cases.

#### 3A.3 Suspension and stable stems

*Needs:* 3A.2; native HomotopyGroup and filtered colimits of abelian groups.

Define suspension homomorphisms on sphere homotopy groups and the stable stem as their
sequential colimit in `AddCommGrpCat`.  Export its structure maps and universal property.
Prove functoriality, composition products, graded-commutativity in the stable range, and
independence of the starting representative.

#### 3A.4 Freudenthal comparison

*Needs:* 3A.2–3; RiemannianGeometry R3 item 4; AlgebraicTopology Stage 4.4 raw sphere suspension.

Transport RiemannianGeometry R3 item 4's normalized sphere suspension along the based
ordinary-to-convenient comparisons of 3A.2. Prove that the square with this roadmap's
suspension homomorphism commutes, retaining the interval-last orientation and degree +1.
Thus for n≥2 the same map π_q(Sⁿ)→π_(q+1)(S^(n+1)) is an isomorphism for
q≤2n−2 and a surjection for q=2n−1; the k-th stem is represented by π_(n+k)(Sⁿ)
for n≥k+2. The new target is the comparison with the chosen colimit maps.

The compact-generation functor's API is categorical: identity and composition on maps,
the counit to the original topology, the adjunction with inclusion and the stated limit/colimit
comparisons. It is built on the native topology, not a second definition of compact generation.

**Checks.**

- On a point, k(*)=* and the counit has one-point fibres; on ∅ it has zero-point domain.
- On ℝ, the compactly generated and usual topologies agree, and the counit is the identity homeomorphism.
- The convenient product of two compact intervals has the ordinary square topology; the two evaluation composites both send (f,x) to f(x). This checks the comparison maps, not an exponential law for arbitrary ordinary mapping spaces.

The pointed cone, suspension and cofiber API consists of quotient evaluation, based universal
properties, induced maps and homotopies, the suspension–loop adjunction and the Puppe maps.

**Checks.**

- The reduced cone and reduced suspension of the one-point based space are points, whereas leaving the marked meridian uncollapsed gives an interval in the cone.
- For the null map S⁰→*, the reduced mapping cone is S¹, and the connecting quotient has degree +1 in the chosen cone orientation.
- With F([a,t])=H(1−t,a), t=1 gives H(0,a)=g(f(a)) on the glued base and t=0 gives the constant value at the apex. Replacing 1−t by t interchanges these required values.

**Checks for the reduced cone.**

- C(*) has one point, since the only meridian is collapsed; the ordinary cone on a point is an interval and fails this quotient law.
- In C(S⁰) the nonbasepoint meridian is an interval whose base endpoint survives, while its apex is the basepoint; collapsing both ends would instead make a circle.
- For every based A, the cone contraction sends [a,t] at parameter u to [a,(1−u)t]; u=0 is the identity and u=1 is the apex, with the marked meridian fixed throughout.

**Checks for reduced suspension and its pinch.**

- Σ(*) is a point and Σ(S⁰)=S¹; identifying neither end would give an interval in the second example.
- The suspension of a degree-two circle map has degree 2 on S²; a constant induced map would have degree 0.
- On ΣS⁰, interval reflection has degree −1 and pinch followed by fold has degree 2; this distinguishes inverse from identity and addition from projection.

**Checks for smash products.**

- S⁰∧S⁰ has two points, with exactly the pair of nonbasepoints surviving away from the basepoint; the Cartesian product has four.
- X∧* is a point, even for X=S¹; leaving one coordinate axis uncollapsed would retain a circle.
- S¹∧S¹ is S², and interchanging its two coordinates has degree −1; an unsigned interchange fails the product orientation.

**Checks for mapping cones and the connecting quotient.**

- For f:S⁰→*, C_f is S¹ and its first integral homology is ℤ; the unreduced native mapping cylinder is contractible and has H₁=0.
- For f=id on S¹, C_f is contractible and has H₁=0; replacing it by ΣS¹ would give H₂=ℤ.
- The quotient C_f/X for f:S⁰→* is the identity of S¹, with degree +1 in the cone convention; changing the connecting orientation would give −1.

**Checks for pointed mapping cylinders.**

- The reduced mapping cylinder of id_* is a point; the raw cylinder is an interval before its marked meridian is collapsed.
- For id_(S⁰) it is a point disjoint from an interval, so π₀ has two elements and the target retraction is bijective on π₀.
- For S⁰→* it is an interval and contractible, while the corresponding mapping cone has H₁=ℤ; collapsing its free end as well would confuse these two constructions.

The loop-space API retains constant loops, concatenation, reversal and the based adjunction.

**Checks for loops.**

- Ω(*) has one point; allowing nonconstant basepoint tracks would not be a based loop construction.
- The winding-one and winding-two loops in S¹ represent 1 and 2 in π₀ΩS¹=ℤ, so concatenation adds rather than multiplies winding.
- Reversing winding one gives −1, and concatenating the two gives 0; ignoring parameter reversal fails the inverse law.

The stable-stem API includes suspension maps, colimit inclusions, composition products,
basepoint transport and the stable-range comparison.

**Checks.**

- For n=8, k=6 the comparison uses 14≤14; for n=9, k=7 it uses 16≤16.
- At n=7, k=6 the inequality is 13≤12, false, so the stated stable-range comparison cannot be applied.
- The unit has degree 1 in π⁽S⁾₀=ℤ, whereas the constant map has degree 0; a zero-map colimit comparison would conflate them.

*Needs:* Native compactly generated topology/category; AlgebraicTopology Stage 4 cofibrations,
Stage 8 relative homotopy and ordinary sphere connectivity; Completed/UniversalCovers
basepoint transport. Item 2 uses item 1's actual products and mapping spaces; item 3 uses
item 2's suspension maps; item 4 is the Freudenthal comparison for those maps.

### 3B. James construction proof spine

Use a path-connected well-pointed CW complex for the literal homotopy-equivalence theorem;
well-pointed means that the basepoint inclusion is a closed cofibration. Do not assume simple
connectivity. For a general pointed compactly generated space `X`, construct functorially a
well-pointed CW approximation `QX -> X` inducing all homotopy-group and path-component
isomorphisms, by geometric realization of the pointed singular complex and a based
cofibration replacement. Prove its naturality and independence up to based weak equivalence.
Define the derived word and suspension-loop models by `J(QX)` and `Omega Sigma(QX)`.
The connected theorem for this generality assumes `pi_0(X)=*` and is a weak equivalence
between those derived models; construct the comparison with the raw models and upgrade to
a based homotopy equivalence when `X` is well-pointed of CW type. In particular, topological
connectedness alone supplies neither a universal-cover CW argument nor this raw upgrade.
Retain the raw word functor for all pointed spaces and its component map; all uses of
"connected" in the James/EHP theorem specify the path-component condition. Build the needed
CW-type comparison for the loop-suspension model before using Whitehead upstairs.

#### 3B.1 Reduced words

*Needs:* 3A.1–2; the stated pointed CW or derived replacement model.

Define the reduced product `J X` as finite words in a pointed space modulo deletion of the
basepoint.  Define its word-length filtration `J_0 X subset J_1 X subset ...`, multiplication,
unit `X -> J X`, functoriality, and compatibility with CW structures.

#### 3B.2 Word filtration

*Needs:* 3B.1; AlgebraicTopology cellular attachment and smash products.

Identify each filtration quotient `J_r X / J_(r-1) X` with the `r`-fold smash power of `X`.
Prove the attaching and connectivity estimates needed for passage to the union.

#### 3B.3 The James map

*Needs:* 3A.2; 3B.1–2; AlgebraicTopology Künneth with Tor.

Construct the James map `J X -> Omega Sigma X` by concatenating the adjoints of suspended
letters and prove multiplicativity up to homotopy. State the Bott–Samelson tensor-algebra
calculation over a field, or over a commutative coefficient ring when the reduced homology
of `X` is free over that ring. For arbitrary integral coefficients use the chain-level
filtration and smash-power homology with its Künneth/Tor terms. Prove compatibility with
the James map; connectedness alone does not remove these terms.

#### 3B.4 Connected James equivalence

*Needs:* 3B.1–3; universal covers, CW type and homological Whitehead with the stated path-connectivity hypotheses.

Prove the full path-connected James theorem in the literal and derived senses just specified. Compute
`pi_1(J X) -> pi_1(Omega Sigma X)`, construct the induced map of universal covers, and lift
the word filtration to prove an integral homology isomorphism on those covers.  Apply the
algebraic-topology roadmap's simply connected homological Whitehead theorem upstairs, then
descend the equivariant homotopy inverse to obtain `J X ~=_h Omega Sigma X`.  Equivalently,
one may prove the same argument through Whitehead with local coefficients, but ordinary
homology alone is insufficient.  Include `X = S^1`, where both fundamental groups are
`Z`, as a comparison theorem.  This connected theorem supplies the low-dimensional EHP
sequence. Also check `X = M(ℤ/2,2)`: the smash square contributes
`Ĥ₅(X ∧ X;ℤ) ≅ Tor₁(ℤ/2,ℤ/2) ≅ ℤ/2`; the James stable splitting retains that
summand, whereas the unqualified tensor algebra on reduced integral homology misses it.

#### 3B.5 James–Hopf comparison

*Needs:* 3B.1–4; sphere connectivity; the ordered length-two subword map.

Construct the James--Hopf map by sending a word to the ordered products of its length-two
subwords.  Identify its adjoint on spheres and prove the fibre/connectivity statement needed
for the EHP range.

The CW approximation and James word model have the following APIs.

- Approximation is natural, induces bijections on components and all based homotopy groups, and is independent up to based weak equivalence.
- The word model preserves maps, has the empty word as unit, concatenates words and deletes exactly the basepoint letters.
- The length filtration has the stated smash-power quotients, and the James map respects multiplication up to a specified based homotopy.

**Checks for the approximation.**

- Q(*) has one component and all positive homotopy groups zero; Q(S¹) has π₁=ℤ, so replacing every connected space by a point fails.
- A discrete two-point based space retains two components under Q, not one; the connected James theorem does not apply.
- On S¹, both sides of the literal James equivalence have π₁=ℤ, and the induced generator maps to 1, not 0.

**Checks for words and their maps.**

- The word (x,*,y) reduces to (x,y), of length two; deleting arbitrary letters would give the wrong quotient.
- J₀X is a point and J₁X/J₀X≅X; at X=* every filtration quotient is a point.
- For X=M(ℤ/2,2), the smash-square degree-five Tor group is ℤ/2; the integral tensor algebra alone has no such degree-five term.

**Checks for the word filtration.**

- J₀X consists of the empty word, and J₁(S¹)/J₀(S¹)=S¹ has H₁=ℤ; starting the filtration at length two gives the wrong first quotient.
- J₂(S¹)/J₁(S¹)=S¹∧S¹=S² has H₂=ℤ; a Cartesian-square quotient would retain degree-one classes.
- At X=*, every quotient is a point, with zero reduced homology, including length two.

The James map sends a letter to its suspended adjoint and the empty word to the constant
loop; concatenated words map to concatenated loops up to the specified based homotopy.

**Checks for the James map.**

- For X=*, the unique word and the unique loop agree; no extra unit circle occurs.
- For X=S¹, the one-letter loop represents 1 in π₁ΩS²=π₂S²=ℤ; the zero map would give 0.
- The product of two such classes represents 2 in π₁ΩS², not 1; retaining only the first letter fails multiplicativity.

The James–Hopf map's API fixes the order of length-two subwords, its pointed naturality and
the sphere fibre/connectivity comparison. On a one-letter word its output is empty, on
(x,y) its output is the single pair (x,y), and on (x,y,z) its output has three ordered pairs;
these distinguish it from concatenation and from an unordered symmetric-square map.

*Needs:* Section 3A; AlgebraicTopology Stages 4–6 cellular chains, Künneth including Tor,
CW comparison and Whitehead; Completed/UniversalCovers; DGFloer Layer 1 item 2 CW approximation.
The literal theorem uses path-connected well-pointed CW input, and the raw upgrade requires CW type.

### 3C. EHP, Hopf invariants and secondary composition

#### 3C.1 EHP maps

*Needs:* 3A.4 and 3B.5; AlgebraicTopology fibration LES and Whitehead products.

For n≥2, define E as suspension, H from the James–Hopf map and P as the
connecting map, with its Whitehead-product comparison. Prove the integral metastable
sequence, beginning with

    π_(3n−2)(Sⁿ) →ᴱ π_(3n−1)(S^(n+1)) →ᴴ π_(3n−1)(S^(2n+1)) →ᴾ π_(3n−3)(Sⁿ) →ᴱ … .

It is exact at every term after the first displayed term; no incoming arrow or exactness
at that first term is asserted. In particular, for 3≤q≤3n−2 its segments are

    π_(q+1)(S^(2n+1)) →ᴾ π_(q−1)(Sⁿ) →ᴱ π_q(S^(n+1)) →ᴴ π_q(S^(2n+1)) →ᴾ π_(q−2)(Sⁿ).

The pair (J(Sⁿ),Sⁿ) is (2n−1)-connected, and its relative homotopy maps to
π_i(J(Sⁿ)/Sⁿ)≅π_i(S^(2n)) for i≤3n−2. Transport the pair sequence through
these comparisons and suspension on S^(2n), and identify H with the James–Hopf map.
This gives a finite exact sequence integrally, not an unrestricted fibre sequence
(Hatcher, *Algebraic Topology*, Proposition 4.28 and §4.J, pp.474–475).
Choose the sign of P so that P(ι_(2n+1))=[ι_n,ι_n], with the Whitehead square
oriented by the product-cell attaching map. For n=2 fix [ι₂,ι₂]=2η₂, where
H(η₂)=1 (Hatcher, §4.J, p.474 and Corollary 4J.4).

#### 3C.2 Hopf and sign comparisons

*Needs:* 3C.1; oriented cup products on the mapping cone; sphere degree.

Prove compatibility of `E`, `H`, and `P` with suspension, composition, negation, and the pinned
Whitehead-product sign.  Calculate the Hopf invariant of the classical Hopf maps.

#### 3C.3 Toda brackets

*Needs:* 3A.2 pointed cone extension; two specified adjacent nullhomotopies.

For based maps A →ᶠ B →ᵍ C →ʰ D with gf and hg based nullhomotopic, define
⟨h,g,f⟩⊆[ΣA,D] as the set obtained by varying both nullhomotopies in the two-cone
construction. The outer map is written first. Keep the two composition actions in the
general pointed setting; when A is a suspension and the resulting homotopy groups are
abelian, the bracket is a coset with indeterminacy

    h ∘ [ΣA,C] + [ΣB,D] ∘ Σf .

Prove the action/coset law, naturality, suspension and the composition identities used in
low stems. In particular, for sphere maps with A=Sᵐ and m≥2 the displayed abelian
formula applies. Choosing one pair of nullhomotopies selects a representative, not the
whole bracket (Hatcher, *Algebraic Topology*, §4.2, p.387, and Exercise 39, p.392;
his notation lists the maps in the opposite order).

#### 3C.4 Barratt–Toda comparison

*Needs:* 3C.1–3; the same Whitehead-product and suspension sign conventions.

Prove the Barratt--Toda formula relating Whitehead products to `P`, `E`, and `H`.  This makes
each low-stem EHP differential a theorem rather than a lookup.

#### 3C.5 Hopf invariant one and smooth sphere frames

*Needs:* 3A.2; AlgebraicTopology cup/cross products; TopologicalKTheory T2.5/T3–T4; CharacteristicClasses C6.2–3/C7.3; SpinRepresentations L7.

**Hopf invariant one and parallelizable standard spheres.** For d≥2 and
a based continuous f:S^(2d−1)→S^d define the integral Hopf invariant by
`u cup u=H(f)v` in its actual two-cell mapping cone C_f, with integral
cell generators u in degree d and v in degree 2d. Pin their signs to the
sphere orientations. The EHP comparison follows item 2 and this definition;
the exclusion and sphere theorem use the cone and cup product directly.
Prove H(f) odd implies d∈{2,4,8}. Construct H=1 representatives
in those dimensions by applying this item's Hopf construction to its
Clifford tangent frames and correcting the source orientation if needed.

Supply the full Adams–Atiyah exclusion using TopologicalKTheory
T2.5's positive Adams operations, T3–T4's compact-pair exactness and
complex Bott generators, and CharacteristicClasses C6.2–3's absolute
multiplicative Chern character and sphere normalization. Prove
`ch(β_l)=(-1)^l U_(2l)` for ordered Bott products from β=O(−1)−1,
using its rank-one normalization and external multiplicativity. If d is odd, graded
commutativity and torsion-freeness give H(f)=0. For d=2r, r≥1, use
3A.2 cone quotient C_f/S^(2r)≅S^(4r), with its top orientation v,
and T4.8's vanishing odd K-groups of even spheres to prove
`0→Kred(S^(4r))→Kred(C_f)→Kred(S^(2r))→0` exact.
Construct an integral basis x,y: y is the image of β_(2r), and x lifts
`(-1)^r β_r`. Thus ch(x)=u+c v for a rational c and ch(y)=v;
their independent leading terms prove injectivity on this free group.
Prove `x²=H(f)y`, `xy=y²=0`, and
`ψ^s(x)=s^r x+b_s y`, `ψ^s(y)=s^(2r)y` for integers s≥1.
These are identities in the integral K-group, using its freeness to
descend the rational character calculation. The congruence
`ψ²(x)≡x² mod2` makes b₂ odd when H(f) is odd. Commuting ψ² and ψ³ gives
`3^r(3^r−1)b₂=2^r(2^r−1)b₃`, hence `2^r` divides `3^r−1`.
Prove ν₂(3^r−1)=1 for odd r and =2+ν₂(r) for even r;
the resulting inequality forces r∈{1,2,4}. This supplies the exclusion
in every dimension, rather than extrapolating from a finite stem table.

For each n≥1 prove the smooth tangent bundle of the standard S^n is
trivial exactly when n∈{1,3,7} (`sphere_parallelizable_iff`, phrased as `n` smooth tangent
vector fields linearly independent at every point; it is false at `n = 0`, where the empty
frame trivializes the rank-zero bundle, so `n ≥ 1` is a hypothesis). Consume CharacteristicClasses C7.3's
actual smooth isomorphism between the native sphere tangent bundle and
the bundle with fibre x^⊥, including its inverse and radial-normal
extension. From an arbitrary smooth tangent frame, use smooth
Gram–Schmidt and a fixed change of basis at e₀ to obtain
orthogonal matrices A_x with first column x and A_(e₀)=I. Construct
the continuous multiplication μ(x,y)=A_x y with both strict units e₀.
Construct the join quotient and its sphere homeomorphism by
`[x,y,t]↦(sqrt(1−t)x,sqrt(t)y)`. Construct the unreduced suspension
sphere homeomorphism and its based degree-one comparison with the
chosen reduced suspension model. Descend μ to its Hopf map
`S^n*S^n≅S^(2n+1)→ΣS^n≅S^(n+1)`. Using AlgebraicTopology's
integral cup/cross/relative products on the oriented product of disks
and 3A.2's cone comparison, prove H=±1 from the two unit restrictions.
Apply the exclusion. Export n=2^j−1, j≥1, as a
weaker necessary condition. Treat S⁰ separately: its rank-zero tangent
bundle is trivial.

Construct the three positive examples using SpinRepresentations L7's
full real Clifford classification table on native TauCeti.realCliffordForm,
with Cliff(p,q)=CliffordAlgebra (TauCeti.realCliffordForm p q).
Use Cliff(0,1)≅ℂ, Cliff(0,3)≅ℍ×ℍ and
Cliff(0,7)≅M₈(ℝ)×M₈(ℝ) to construct real modules of dimensions 2,4,8.
For their generator actions A_i prove
squares −I and anticommutation. Average a positive inner product over
the finite signed monomial group generated by the A_i, proving its
finiteness and the invariance of this metric; then A_i is skew-adjoint.
Choose an orthonormal basis to transport to the standard Euclidean model.
On its unit sphere prove the vectors A_i x are a smooth orthonormal
basis of x^⊥ and construct the resulting actual tangent trivialization
and inverse by inner-product coordinates. The finite-module metric
adapter is part of this target; the abstract algebra table alone does
not supply it. Algebraic Clifford classification retains its L7 owner.

James, *Reduced Product Spaces*, Annals of Mathematics 62 (1955), Sections 1--6, supplies the
filtered reduced product and equivalence with `Omega Sigma X`.  Whitehead, *Elements of Homotopy
Theory*, Chapters VII--XI, supplies Freudenthal, Whitehead products, and EHP.  Toda,
*Composition Methods in Homotopy Groups of Spheres*, Chapters I--V, fixes compositions,
secondary operations, suspension sequences, and the low-stem calculation.

Adams and Atiyah, [*K-theory and the Hopf invariant*](https://doi.org/10.1093/qmath/17.1.31),
Quarterly Journal of Mathematics 17 (1966), 31–38, supplies the integral Adams-operation
exclusion. Hatcher, [*Vector Bundles and K-Theory*, §2.3](https://pi.math.cornell.edu/~hatcher/VBKT/VB.pdf),
gives the sphere-framing/H-space and K-theory route. The positive Adams-operation
and complex Bott constructions precede this application; they use neither its
Hopf exclusion nor its tangent classification.

The EHP and secondary-operation APIs retain their degree shifts, domains, naturality,
suspension comparisons and indeterminacy. The source and target of each arrow are those
in 3C.1, and the order and nullhomotopies for brackets are those in 3C.3.

**Checks for EHP.**

- At n=2,q=4 the segment is ℤ →ᴾ ℤ →ᴱ ℤ/2 →ᴴ 0, with P(a)=2a and E(b)=b mod 2; im P=2ℤ=ker E and im E=ℤ/2=ker H.
- Negating the generator of π₅(S⁵) changes P(1)=2η₂ to P(−1)=−2η₂. The kernel 2ℤ is unchanged; replacing P by zero would make exactness false.
- At n=2 the sequence starts at π₄(S²)→π₅(S³); a preceding P from π₆(S⁵) is outside the stated integral range. The comparison needs i≤4, whereas that extra term needs i=5.

**Checks for Toda brackets.**

- Take A=B=C=D=Sᵐ, m≥3, and f=g=h=0. Both composition subgroups are zero and ⟨0,0,0⟩={0}.
- For the same spheres take f=g=id and h=0. The composite gf has degree 1≠0, so this triple has no defined bracket.
- For the same spheres take f=g=0 and h=id. Then ⟨id,0,0⟩ lies in π_(m+1)(Sᵐ)=ℤ/2, its indeterminacy is id∘π_(m+1)(Sᵐ)+0=ℤ/2, and it is {0,η_m}. A singleton choice {0} fails this Check (the group is Hatcher, Corollary 4J.4, p.474).

The Hopf invariant and the frame-to-Hopf comparison have their own API.

- The oriented cone generators determine H by u²=Hv; changing the top generator reverses H.
- Precomposition by degree a multiplies H by a, while postcomposition by degree b multiplies it by b².
- A positive-dimensional smooth sphere framing produces a Hopf map of invariant ±1; the Clifford frames realize the three allowed dimensions.

**Checks.**

- The constant map has H=0 and the complex Hopf map has H=1; target reflection still gives H=1, while source reflection gives −1.
- For d odd, u²=−u² in the torsion-free top group, so H=0; d=3 cannot give odd H.
- In the Adams-operation divisibility test r=1,2,4 give ν₂(3ʳ−1)=1,3,4 respectively, while r=3 gives 1<3 and r=6 gives 3<6.

### Examples

For `sphere_parallelizable_iff`, n=1,3,7 gives respectively 1,3,7 independent fields
from real Clifford modules of dimension 2,4,8. At n=2 the Euler number is 2, hence no
frame; at n=0 the empty frame exists and the disjunction is false, explaining the explicit
positive-dimension hypothesis. For each Clifford field Aᵢx, skew adjointness gives
⟨x,Aᵢx⟩=0 and Aᵢ²=−I gives ‖Aᵢx‖²=1; reversing the Clifford signature loses that calculation.

### Dependencies

*Needs:* Sections 3A and 3B for EHP; AlgebraicTopology cup/cross products and relative
cohomology for Hopf invariants; TopologicalKTheory T2.5, T3–T4 and CharacteristicClasses
C6.2–C6.3 for the Adams-operation route; CharacteristicClasses C7.3 and SpinRepresentations
L7 for actual smooth sphere frames. The cone route to Hopf exclusion uses no later stem table.

## Layer 4: stable `SO`, `BSO`, vector bundles, Bott periodicity, and `J`

### 4A. Stable orthogonal groups and classifying spaces

#### 4A.1 Stable matrix groups

*Needs:* Native orthogonal matrix groups; 3A.1; TopologicalKTheory T1.5a sphere fibrations.

Define `O(r)` and `SO(r)` from Mathlib's matrix groups, their block inclusions into rank
`r+1`, and stable `O` and `SO` as filtered colimits of topological groups internal to the
compactly generated category.  Export the inclusions and colimit universal properties and
compare their underlying spaces with the corresponding compactly generated colimits.  Use the
sphere fibration `SO(r) -> SO(r+1) -> S^r` to prove the finite-to-stable comparison range on
homotopy groups.

#### 4A.2 Loop and classifier comparison

*Needs:* 4A.1; TopologicalKTheory T1.5–T1.6 actual universal bundles and stabilization.

Consume TopologicalKTheory T1.5–T1.6's finite oriented Grassmannians, tautological bundles,
fixed-rank `BSO(r)` ambient colimits, stable `BSO` and universal bundle diagrams, with their
actual coordinate stabilization maps. Construct the map from the 4A.1 stable `SO` model
to `Omega BSO` and prove the loop equivalence, including components, basepoints and
finite-rank/stable compatibility. Compare any distinct homogeneous model by actual maps,
universal-bundle pullback isomorphisms and both homotopies.

#### 4A.3 Smooth stable framings

*Needs:* TopologicalKTheory T1.6; relative smooth bundle approximation on protected collars.

Use T1.6's stable oriented bundle classification over finite CW bases and its separate
numerable fixed-rank classification at their stated hypotheses. Construct here the smooth
tangent/normal-bundle comparison: a continuous stable trivialization of a smooth bundle
has a smooth representative with smooth inverse, and homotopies admit the required
relative smoothing with protected closed collars. Prove the comparison commutes with
pullback, Whitney sum, added trivial lines and the chosen classifying maps. Retain
explicit mutually inverse maps between stable smooth bundle classes and `[K,BSO]`
for smooth bases with the displayed finite-CW model; the generic topological classifier
and its proof remain the T1.6 supplier.

#### 4A.4 Null classification and chosen framing

*Needs:* 4A.2–3; TopologicalKTheory T1.6 stable classification with its finite-CW hypotheses.

Prove that the classifying map is null exactly when a chosen stabilization is trivializable.
Express this as existence of a stable framing and retain the chosen trivialization as data.

#### 4A.5 Clutching on spheres

*Needs:* 4A.2; n≥2; TopologicalKTheory T1.6 clutching naturality and basepoint transport.

Using TopologicalKTheory T1.6c's simple connectivity of the shared BSO,
for `n>=2`, compare pointed and unpointed classes from `S^n`
and construct the clutching equivalences
`[S^n,BSO]_* ~= pi_n(BSO) ~= pi_(n-1)(SO)`.

Steenrod, *The Topology of Fibre Bundles*, Chapters 5--7 and 12, and Husemoller, *Fibre
Bundles*, Chapters 3--4 and 8--9, supply the universal-bundle and clutching proof spine.

#### 4A early finite orthogonal and sphere-loop comparisons

For r≥1 specialize TopologicalKTheory T1.5a's finite Stiefel/frame-bundle
carrier, local sections, sphere-bundle LES and connectivity to the matrix SO(r) model.
Transport its π₁ computation and the stabilization ℤ→ℤ/2 in rank two. Construct the
smooth quaternion-conjugation dictionary S³/{±1}≃SO(3), preserving the actual projection,
kernel, basepoint and covering maps. Retain the raw winding, stable parity and free/based
frame-loop translation maps; the general finite Stiefel calculation is the supplier's.

#### The unit tangent circle bundle of S²

 On the actual round unit sphere in
oriented Euclidean R³, identify the native tangent space at x with x⊥ by
the derivative of the sphere inclusion, retaining the metric and smooth
bundle comparison. Its unit tangent sphere bundle is thereby identified
with the finite orthonormal two-frame carrier consisting of (x,v) with
‖x‖=‖v‖=1 and ⟨x,v⟩=0. Construct this as an isomorphism of the actual
smooth sphere bundles, rather than introducing an unrelated carrier with
the same defining equations.

Construct the smooth map (x,v)↦[x,v,x×v] into the existing matrix SO(3)
model, using the ordered columns and the cross product for the specified
orientation of R³. Prove orthogonality, determinant+1 and the inverse
given by the first two columns; for an SO(3) matrix its third column is
their cross product. Establish both inverse equations, continuity and
smoothness through the native tangent, Stiefel and matrix-group charts.
The resulting diffeomorphism UTS²≃SO(3) preserves projection to S²,
where SO(3) projects to its first column. Compare this projection with
the preceding last-column sphere bundle by the orientation-preserving
column permutation `[x,v,x×v]↦[v,x×v,x]` and its action on frames. Identify
the circle fibre and its action by rotating the last two columns,
including the chosen unit basepoint and fibre orientation.

Compose with the preceding quaternion-conjugation quotient homeomorphism
SO(3)≃S³/{±1} and Stage4.6 of AlgebraicTopology's native real-projective
quotient comparison to obtain UTS²≃RP³. Prove the antipodal/projective
quotient map and basepoint equations on representatives. These are actual
total-space homeomorphisms and bundle comparisons; equality of fundamental
groups or a homotopy equivalence does not discharge them. Their construction
uses finite Euclidean sphere/tangent/frame charts and the existing quaternion
quotient, independently of stable Bott periodicity and the BSO classifier.

For the first-two-stem output of9.1, export its low unstable adapters explicitly: n>=4 uses Freudenthal j=n+2<=2n-2; n=3 uses the quaternionic Hopf LES pi5S3≃pi6S4 because pi6S7=pi5S7=0; n=2 uses the complex Hopf LES pi4S2≃pi4S3 because higher Circle groups vanish, then the first stable stem. n0/n1 give zero. Keep the actual pointed maps, native sphere/circle models and group structures. HS3B's connected James theorem and3C's valid-range EHP and nonvanishing/composition proofs are indispensable before9.1; the first-two-stem phase does not assume the nu/Z24 table or all later stems.

The stable orthogonal groups and smooth classifier comparison have the following API.

- Block inclusions preserve multiplication, identity and basepoints, and determine the colimit inclusions.
- The loop/classifier comparison preserves the universal bundle and clutching maps, with its two inverse homotopies.
- Relative smoothing preserves protected collar data, direct sums and the given smooth total-bundle structures.

**Checks.**

- O(0) and SO(1) are singletons; O(1) has exactly the two matrices [1] and [−1]. Confusing O with SO loses a component.
- A 2π rotation in SO(2) has winding 1 and stable class 1 mod 2; a 4π rotation has winding 2 and stable class 0.
- TS²⊕ℝ is trivial of rank 3 but TS² has Euler number 2; the stable classifier must not return an honest tangent frame without cancellation hypotheses.

**Checks for the stable classifier and framing comparison.**

- A trivial oriented line over a point has constant classifying map and a positive smooth frame; a reflected frame has determinant −1 and is not an oriented trivialization.
- TS² has Euler number 2 but its stabilized class is zero since TS²⊕ℝ≅ℝ³; the comparison must retain the added line.
- The quaternionic Hopf line over S⁴ has nonzero second Chern class of absolute value 1 and hence a nontrivial stable real class; declaring every classifying map null would incorrectly give its Pontryagin class 0 instead of absolute value 2.

For the unit tangent comparison, (e₁,e₂) maps to the identity matrix [e₁,e₂,e₃],
with determinant +1. The cyclic column permutation has sign (−1)²=+1. Using
[e₁,e₂,−e₃] instead gives determinant −1 and is excluded from SO(3).

*Needs:* TopologicalKTheory T1.5a–T1.6; Section 3A; DifferentialGeometry smooth bundle
and collar comparison; CharacteristicClasses C7.3 tangent/hyperplane adapter; AlgebraicTopology
Stage 4.6 projective quotient. The finite comparisons do not use Bott periodicity.

### 4B. Full real Bott proof spine

#### 4B.1 Bott-chain models

*Needs:* 4A; 3A.1; the actual stable homogeneous-space inclusions.

Construct the stable homogeneous spaces and fibrations in the real Bott chain
`BO x Z, O, O/U, U/Sp, BSp x Z, Sp, Sp/U, U/O`.  Identify base components and prove that the
finite-dimensional inclusions induce equivalences in increasing connectivity ranges.

#### 4B.2 Geodesic normalization

*Needs:* RiemannianGeometry R1–R2; the invariant products on 4B.1 models.

Consume RiemannianGeometry R1's bi-invariant and normal-homogeneous metrics,
submersion and curvature formulas, and R2's Jacobi-field and exponential-derivative API.
Specify the invariant products and normalization on each compact classical group and
symmetric space in the Bott chain. Identify geodesics, endpoint conditions, Jacobi fields
and conjugate points, and prove compatibility with inclusions in matrix rank.

#### 4B.3 Finite broken geodesics

*Needs:* RiemannianGeometry R3; 4B.2; matrix-rank and subdivision comparison.

Consume R3's single broken-geodesic manifold for the chosen metric, its deformation
comparison with energy sublevels in the actual compactly generated path space, and
compact-family capture. Prove compatibility with the finite-dimensional rank inclusions
on these instances, including subdivision and cutoff maps.

#### 4B.4 Normal Hessians and negative bundles

*Needs:* 4B.2–3; MorseTheory M5 with its normal nondegeneracy hypotheses.

Consume MorseTheory M5's finite-dimensional Morse–Bott normal-Hessian and negative-bundle
attachment theorem. For each critical manifold of the symmetric-space broken-geodesic
energy, calculate normal Hessian, index and nullity from item 2's Jacobi fields. Prove
normal nondegeneracy and identify the actual negative normal disc and sphere bundles.

#### 4B.5 Energy-band attachments

*Needs:* 4B.3–4; RiemannianGeometry R3 compact-energy-band deformation.

Consume R3's compact-energy-band verification and prove the Bott-specific deformation
hypotheses between critical values. Apply M5 to attach the calculated negative disc
bundles. Prove compatibility as subdivision and matrix rank increase; no
infinite-dimensional Palais–Smale assertion replaces these finite comparison theorems.

#### 4B.6 Increasing connectivity

*Needs:* 4B.2–5; RiemannianGeometry R3 finite energy-band comparison; AlgebraicTopology Stage 8 relative-cell connectivity; Bott, Theorems I–II and equations (7.4), (7.6), (8.2), (8.5), (8.7), (8.9).

Use Bott's trace-metric normalization and the path component through the torus path
specified below. For each row, let F be its minimum-geodesic manifold and let
F→Path(P,Q;M) send a geodesic to its parametrized path. Prove that every nonminimal
critical manifold in that component has index at least λ, with equality attained.
Here r is a positive integer, except that the first row requires r≥2.

| Ambient symmetric space M | Minimum manifold F | Torus coordinates of the chosen path | λ | Source |
| --- | --- | --- | --- | --- |
| SO(2r) | SO(2r)/U(r) | r entries 1/2 | 2r−2 | Bott (7.4), p.333 |
| SO(4r)/U(2r) | U(2r)/Sp(r) | r entries 1/2 | 4r−2 | Bott (8.2), p.335 |
| U(4r)/Sp(2r) | Sp(2r)/(Sp(r)×Sp(r)) | r zeros followed by r ones | 4r+4 | Bott (8.5), p.335 |
| Sp(r) | Sp(r)/U(r) | r entries 1/2 | 2r+2 | Bott (7.6), p.334 |
| Sp(r)/U(r) | U(r)/O(r) | r entries 1/2 | r+1 | Bott (8.7), p.336 |
| U(2r)/O(2r) | O(2r)/(O(r)×O(r)) | r zeros followed by r ones | r+1 | Bott (8.9), p.336 |

The torus parametrizations are those of Bott §§7–8, transported through 4B.2's actual
matrix maps; the first path starts at the identity and ends at −I. In each row the
inclusion is an isomorphism on π_j for 1≤j≤λ−2 and surjective for
1≤j≤λ−1 (Bott, Theorem I, p.313). Pass to all components by the specified
basepoint transports and the rank/determinant components, not by identifying a single
path component with the whole loop space. Since λ tends to infinity with r,
compact-family capture gives the stable equivalences on every fixed homotopy group.
The other two steps Ω(BO×ℤ)≃O and Ω(BSp×ℤ)≃Sp on each integer component
come from the universal bundles with contractible total space, not a further Morse
index estimate (Bott, p.314, immediately before the Corollary to Theorem II).
Construct their finite-rank bundle comparisons in 4B.1 before passing to the colimit.

**Checks for the rank bounds.**

- At r=2 the six values of λ in table order are 2,6,12,6,3,3. Thus the first map is surjective on π₁, while the second is an isomorphism through π₄ and surjective on π₅; neither gives an isomorphism in its last surjective degree.
- For SO(2r) at r=1 the expression 2r−2 is 0; this row is excluded, and no positive-degree connectivity follows from that value. The other five rows at r=1 give 2,8,4,2,2.
- For a desired π₅ isomorphism one needs λ≥7. At r=8 the six values are 14,30,36,18,9,9, all ≥7; a rank-independent bound would not imply convergence in all degrees.

#### 4B.7 Eight loop equivalences

*Needs:* 4B.1–6; 4A finite-to-stable comparison; Bott §§2–8.

Pass through the stable-range comparison and obtain the seven loop equivalences
`Omega R_i ~= R_(i+1)` and the closing equivalence `Omega R_7 ~= R_0`, with components
specified.  Compose them to prove eightfold real Bott periodicity.  On the finite groups this
is `orthogonalGroup_bottPeriodicity`: for `n ≥ k + 11`, `π_(k+9)(O(n)) ≅ π_(k+1)(O(n))` at the
identity, the bound being the range `n ≥ i + 2` in which `O(n) → O(n+1)` is bijective on `π_i`.

#### 4B.8 All stable orthogonal groups

*Needs:* 4B.7; Hatcher Introduction pp.1–2 and Proposition 1.14 p.25 for the table and clutching normalization.

Derive the stable homotopy table of `O` and `SO`, not merely its two desired entries.  Check
`pi_0(O)=Z/2`, `pi_1(SO)=Z/2`, `pi_2(SO)=0`, `pi_3(SO)=Z`,
`pi_4(SO)=pi_5(SO)=pi_6(SO)=0`, and `pi_7(SO)=Z`, with period eight.
In finite rank, `orthogonalGroup_fifthHomotopyGroup` gives π₅(O(n),1)=0 for n≥7,
and `orthogonalGroup_sixthHomotopyGroup` gives π₆(O(n),1)=0 for n≥8.
The remaining positive-degree base statements are
`orthogonalGroup_secondHomotopyGroup` (π₂=0 for n≥4),
`orthogonalGroup_thirdHomotopyGroup` (π₃≅ℤ for n≥5),
`orthogonalGroup_fourthHomotopyGroup` (π₄=0 for n≥6),
`orthogonalGroup_seventhHomotopyGroup` (π₇≅ℤ for n≥9), and
`orthogonalGroup_eighthHomotopyGroup` (π₈≅ℤ/2 for n≥10), all at the identity.
Together with periodicity and the component/degree-one inputs from T1.5a, these
determine every residue class; periodicity in positive degree alone does not identify
π₈ with a component set. All finite positive-degree statements use i≤n−2
and Bott's table (Bott, Corollary to Theorem II and the following calculation, pp.314–315)
(Hatcher, *Vector Bundles and K-Theory*, Introduction, pp.1–2, and §1.2,
Proposition 1.14, p.25, for the clutching comparison).

#### 4B.9 Clifford comparison

*Needs:* 4B.7; SpinRepresentations L7 real Clifford classes.

Compare the topological Bott maps with the Clifford-module Bott classes supplied by the
representation-theory roadmap.  This comparison prevents two unrelated periodicity APIs.

Bott, *The Stable Homotopy of the Classical Groups*, Annals of Mathematics 70 (1959),
Sections 2--8, is normative for the geodesic, index, and stable-loop argument.  Milnor,
*Morse Theory*, Chapter 24, supplies the path-space Morse-theory formulation.  The loop proof includes the broken-geodesic comparison, Morse–Bott attachment
and increasing-connectivity estimate for all eight entries.

The Bott-chain spaces and maps have an API of base components, inclusion compatibility,
loop equivalences and their composites; the full eight-entry table is a consequence.

**Checks.**

- The degree-zero O entry is ℤ/2 and degree-one SO entry is ℤ/2; replacing O by its identity component at degree zero gives 0 and fails.
- At k=0,n=11, periodicity compares π₉O(11) and π₁O(11), both ℤ/2; 9≤11−2 is equality.
- At ranks 4,5,6,7,8,9,10 the groups in degrees 2,3,4,5,6,7,8 are respectively 0,ℤ,0,0,0,ℤ,ℤ/2; each has i=n−2. In particular the infinite cyclic entries exclude the zero-table model.
- At ranks 4 and 8, the degree-three and degree-seven bounds 5≤4 and 9≤8 fail; no stable-table assertion is made at those excluded ranks.

*Needs:* Section 4A's actual finite-to-stable maps; RiemannianGeometry R1–R3;
MorseTheory M5; the algebraic Clifford comparison from SpinRepresentations L7.

### 4C. Stable `J`

#### 4C.1 Unstable sphere action

*Needs:* Native SO matrix action on spheres; 3A.2 suspension–loop adjunction.

From the action of `SO(r)` on `S^(r-1)`, construct the unstable clutching map into
self-equivalences of the sphere and its adjoint homomorphism on homotopy groups.

#### 4C.2 Stable J

*Needs:* 4C.1; 3A.3 suspension colimits; 4A.1 block inclusions.

Prove compatibility with block inclusion on `SO`, suspension on sphere maps, basepoint change,
and composition.  Pass to colimits to define stable `J_n : pi_n(SO) -> pi_n^S`.

#### 4C.3 Change of framing

*Needs:* 4C.2 and 4A.5; Section 5.1 smooth PT comparison.

Identify `J` with the change in Pontryagin--Thom class caused by changing a stable framing by
an element of `pi_n(SO)`.  Prove compatibility with the `BSO` clutching description.

The stable J API includes additive and stabilization laws, compatibility with clutching,
and the change-of-framing action proved after the smooth PT comparison in Layer 5.

**Checks.**

- The constant identity gauge gives J(0)=0; it changes no framing class.
- The nontrivial stable rotation loop gives η∈π⁽S⁾₁=ℤ/2; its double gives 0.
- The degree-seven Bott generator has e-invariant ±1/240 in Layer 9A, whereas its realified complex counterpart 2b has ±1/120. Halving an equality in ℚ/ℤ is not a unique operation.

### Examples

The orthogonal vanishing headlines apply at n=7,i=5 and n=8,i=6 since both have i=n−2;
the groups have one element. At smaller ranks the range inequality fails, so the theorem
makes no assertion there. The degree-zero O(1) component check and the degree-seven Bott
generator distinguish the stable table from a zero-table model.

### Dependencies

*Needs:* Sections 3A and 4A–4B for stable J and Bott; Layer 5 for the framing-action
comparison only. Defining J by the sphere action precedes that comparison, so it is not
circular. The seventh-degree numerical calibration belongs to Layer 9A.

## Layer 5: stable framings and Pontryagin--Thom

### 5.0 Finite ambient spheres and honest normal rank

Use TangentialBordism B5.2's marked-sphere, honest-rank PT theorem with c≥1 and d≥0.
Its cycles are compact closed framed d-submanifolds of S^(c+d) missing infinity;
its embedded traces miss the marked axis and carry product end collars. Retain its
empty/disconnected cases, ordered rank-c frames, both inverse witnesses, pinch addition,
derivative-transported domain reflection and finite suspension comparison. The c=0 case
is a based-set construction and is not used in the positive-rank group statement.

The classical correspondence is Milnor, *Topology from the Differentiable Viewpoint*,
§7, Theorems A–C, pp.43–44, with compact boundaryless ambient manifold and actual normal
frames. The marked-relative extension and the fixed product-collar comparisons are the
additional B5.2/B1 contracts; the unbased statement alone does not supply them.

Its application API preserves:

- The empty cycle and disjoint union as the constant class and sphere pinch sum.
- The actual derivative normal frame under regular inverse image and collapse, in both directions.
- The source-reflection inverse and the comparison of finite suspension with an added normal vector.

**Checks.**

- The empty cycle has degree 0; assigning a positive generator to it violates the unit law.
- One point with positive derivative framing has degree +1, whereas reversing that derivative has degree −1.
- For the Hopf map S³→S², domain reflection changes H from +1 to −1; target reflection gives (−1)²H=+1 and is not the unstable inverse.

*Needs:* TangentialBordism B5.2 and B1 relative transversality; Layer 3A's pointed sphere models;
DifferentialGeometry Layer 10 degree. No Bott or stable-stem calculation is used.

### 5.0b. Early framed curves, surfaces and the first two offsets

Construct these earlier finite-rank computations independently of Stage9,
Bott periodicity, stable J, surgery classification or a table of stems.
Use TopologicalKTheory T1.5a and the 4A matrix-model comparison for the
finite SO sphere-bundle LES, π₁SO(c)=ℤ/2 for c≥3 and its low-degree
connectivity, together with SpinGeometry G4 and its actual Spin covers.

For c≥3 identify honest rank-c normally framed curves in S^(c+1)
modulo collared framed bordism by Z/2. The bounding framed disc fixes
the zero reference. Relative general position in the ambient cylinder
of dimension c+2≥5 supplies separated/unknotted curves and embedded
oriented surface traces; the two-dimensional relative SO(c) obstruction
extends their framing exactly when the total calibrated parity is zero.
Construct the pair-of-pants parity law and both obstruction directions.
Under5.0 this computes π_(c+1)(S^c). For c=2 construct the integral
linking/push-off invariant and compare it with the Hopf invariant under 5.0.
The complex Hopf fibration gives π₃(S³)≅π₃(S²) since π₃(S¹)=π₂(S¹)=0;
degree on S³ then proves completeness of the integral invariant and π₃(S²)=ℤ. Identify the positively normalized Hopf regular fibre as1
and its finite suspensions as the parity generator, using the actual
normal derivative and suspension comparison, not a generator label.

For c≥4 identify honest rank-c normally framed surfaces in S^(c+2)
modulo collared framed bordism by Z/2. Extract the induced stable
spin structure from the ambient trivialization and the GIVEN normal
frame. Consume SpinGeometry G4 and TangentialBordism B3.2's actual
curve-restriction quadratic refinement q on H1(S;F2); no existence
of a spin structure is inferred for an arbitrary bundle. Use B3.2(b)'s calibration q=0 on a bounding circle, polarization and
nonsingularity, and B3.2(c)'s actual Spin filling iff Arf=0. In particular a
Spin filling has a q-zero boundary-kernel Lagrangian. These are imported
geometric theorems, not consequences of an algebraic Arf table alone.
Relate spin bordism to stable framing bordism in dimensions≤2 by the
relative obstruction construction: π1Spin(N)=π2Spin(N)=0 for N≥3
makes the compatible stable frame extend over these three-dimensional
fillings relative their prescribed boundary frame. This is a low-cell
comparison, not the assertion that all spin manifolds are framed.
Embed the trace relatively into the ambient cylinder, using the actual
Whitney dimension bound c+3≥7, then cancel stabilizing normal
vectors relatively using the finite Stiefel connectivity in dimensions
2 and3. Prove both existence and compatibility with the given honest
boundary framings; do not identify honest frames merely because their
stable classes agree without this relative cancellation.
The product Lie framing on the torus has q(a)=q(b)=1, hence Arf1;
the framing induced by a bounding solid torus is a different reference
and need not have Arf1. Prove the finite PT external-product/smash and
composition comparison that identifies this torus with η², including
the Hopf-fibre calibration. This gives the actual group and its marked
generator for π_(c+2)(S^c), c≥4, without using a later stable table.

Handle the two exceptional ranks by explicit Hopf fibrations and their
based LES. The complex Hopf fibration S1→S3→S2 gives
π4S2≅π4S3, since π4S1=π3S1=0 by the universal covering R→S1.
The quaternionic Hopf fibration S3→S7→S4 gives
π5S3≅π6S4, since π6S7=π5S7=0 by sphere connectivity.
Construct the local projective charts, actual bundle maps/basepoints
and connecting/generator comparisons, not merely these abstract group
isomorphisms. Thus the second-offset Z/2 claim has c≥2; c=1 has
π3S1=0. The zeroth-offset degree computation is Z for c≥1 by the
signed zero-dimensional framed fibre; c=0 retains its separate
component/based-set convention. The full existing Freudenthal, EHP,
Hopf, stable PT and later low-stem programmes remain required in their
own scopes and consume these early computations where appropriate.

The finite-framing/Spin comparison has an API of induced Spin lift, boundary restriction,
relative extension, honest normal-rank cancellation and PT product/generator comparisons.
The Spin refinement and filling criterion themselves are TangentialBordism B3.2(b–c).
Atiyah, *Riemann surfaces and spin structures*, §4, Proposition 4.1 and Theorem 3′, p.58,
gives the mod-two-index boundary criterion; the geometric q/Arf and surgery dictionary is
part of the cited B3.2(b–c) supplier, not inferred from Atiyah's count alone.

**Checks.**

- The bounding disc circle has q=0, and the Lie circle has q=1; on the Lie torus q(a)=q(b)=q(a+b)=1 and Arf=1.
- S² has zero H₁ and Arf=0. Two Lie tori have Arf 1+1=0 and bound after the supplied Spin surgery construction.
- For c=4, a three-dimensional filling embeds relatively in ambient dimension 7, and the normal-frame cancellation uses a 3-connected Stiefel fibre; c=3 gives only 2-connectivity and does not instantiate this relative three-dimensional assertion.

*Needs:* Section 5.0; TopologicalKTheory T1.5a; SpinGeometry G4; TangentialBordism
B1 and B3.2(b–c); AlgebraicTopology relative duality and the fibration LES from DGFloer
Layer 1 item 2. Honest-rank cancellation applies to the relative pair of dimension at most 3
and uses connectivity at least 3; it is a separate lifting argument over that pair.

### 5.1 Smooth stable tangent and normal comparison

#### 5.1.1 Stable tangent and normal framings

*Needs:* GeometricTopology Layer 1 normal bundles; native Euclidean embedding; smooth Whitney sums.

For a compact smooth manifold embedded in a sufficiently large Euclidean space, construct the
stable normal bundle and prove `TM directSum nu ~= trivial`.  Give mutually inverse operations
between stable tangent and stable normal framings; prove independence under adding trivial
directions, isotopy of embeddings, and passage to a larger ambient Euclidean space.

#### 5.1.2 Bundle-diagram dictionary

*Needs:* 5.1 item 1; StringOrientation S2.2–S2.3; shared collared bordisms.

Construct the dictionary from these smooth stable normal framings to
StringOrientation S2.2–S2.3's contractible bundle-diagram lifts. Prove it preserves
collared bordisms, disjoint union, orientation reversal and stabilization, including
empty and disconnected traces. This transports the supplied stable PT isomorphism
to the tangent-framed model used for almost-framed cycles.

#### 5.1.3 Comparison of collapse representatives

*Needs:* 5.0; 5.1 items 1–2; the supplied finite normal tubes and augmentation.

Compare its collapse on a fixed normal frame φ with the finite collapse of 5.0:
the framed Thom equivalence sends a finite normal vector v to
(base(v),φ(v)), and infinity to the basepoint. The augmentation then sends (x,v)
to v. For compact M the intermediate space is Th(ν)≃M₊∧Sᵏ, not generally Sᵏ.
Prove equality of the representatives through the supplied normal tubes whose
derivative is the identity on the normal quotient, using positive radial compression.
Prove naturality under shrinking, isotopy and stabilization.

#### 5.1.4 Products and J action

*Needs:* 5.1 items 1–3; 4C sphere-action J; StringOrientation S2.2 multiplicativity.

Transport the product, suspension and boundary comparisons. For a stably normally
framed standard Sⁿ with n≥1 and a based gauge g:Sⁿ→SO(r), after a common stabilization,
let φ·g send a normal vector v at x to g(x)φₓ(v). Prove
PT(φ·g)−PT(φ)=J([g]), where 4C uses the same action (x,v)↦g(x)v on the
one-point compactified normal coordinate and the fixed oriented Sⁿ factor.
Retain the tangent/normal derivative and summand-order comparisons; a gauge on an
arbitrary manifold is not an element of πₙSO without an additional comparison.

Its comparison API includes:

- Tangent-to-normal and normal-to-tangent conversion are mutually inverse on stable framing classes.
- The comparison preserves disjoint union and the empty framed manifold, hence the supplied group law.
- The framed Thom equivalence and augmentation commute with stabilization and the chosen PT maps.

**Checks.**

- For one positive point in ℝ, the framed Thom/augmentation composite has degree +1; reflecting φ gives −1.
- Compression v↦−v has negative factor and is excluded; a tube with normal derivative −1 is also excluded with φ fixed.
- For two points, Th(ν) is Sᵏ∨Sᵏ; its augmentation folds the two summands and has signed count 2, so replacing the Thom space itself by Sᵏ loses a summand.

*Needs:* Section 5.0, StringOrientation S2.2–S2.3; Section 4A smooth framing comparison;
Section 4C for the change-of-framing formula; GeometricTopology Layer 1 normal tubes.
The classical finite collapse and inverse are Milnor §7, Theorems A–C, pp.43–44;
the stable coefficient theorem is the named StringOrientation contract.

### Examples

The finite empty cycle, positive point and reflected point have degrees 0,+1,−1.
The Lie torus and the torus Spin structure with q(a)=q(b)=0 have Arf 1 and 0 respectively.
The stable sphere normal frame gives TS²⊕ℝ≅ℝ³, not TS²≅ℝ².

### Dependencies

*Needs:* TangentialBordism B1, B3.2 and B5.2; StringOrientation S2.2–S2.3;
TopologicalKTheory T1.5a; Sections 3A and 4A, and 4C only for the J action. The finite
and low-dimensional comparisons precede stable Bott and Layer 9's higher-stem computation.

## Layer 6: almost-framed groups, geometric `P_n`, and the exact sequence

### 6A. Almost-framed bordism and comparison

#### 6A.1 Almost-framed cycles and defect traces

*Needs:* GeometricTopology Layer 1; gap:collared-oriented-bordism; Sections 4A and 5.1.

In the Kervaire–Milnor range `n ≥ 5`, define a geometric almost-framed `n`-cycle as a
connected closed oriented smooth manifold `M`, an embedded defect disc, and a stable
tangent framing of the punctured manifold which is product-
compatible near the new boundary. Require this punctured framing to induce the restriction
of the chosen orientation of `M`. The defect disc's source is smoothly diffeomorphic,
as a manifold with boundary, to the standard closed disc. The closed exterior has its own half-space
manifold-with-boundary model and boundary identification with the defect sphere, not the
ambient boundaryless chart model. The ambient map is a smooth proper embedding with an
interior collar and non-surjective image.  Its exterior collar has target open in the closed
complement of the disc interior (or is the exterior half of a two-sided ambient collar); it is
not required to have ambient-open image in the original manifold.  A closed set merely
homeomorphic to a ball is not enough.  Define bordisms using a properly embedded defect arc,
its genuine tubular neighbourhood, named endpoint embeddings identifying that track with the
two chosen defect discs and collars. Model this track as a proper product tube with named
endcaps, their endpoint-disc identifications, and a lateral face. Only the lateral face
has an exterior collar; an endcap interior lies in the ambient trace boundary. The closed
lateral width parameter `s ∈ [0,1]` is matched at its two ends with `c_X(ε_X s, b)` and
`c_Y(ε_Y s, b)`, where `0 < ε_X, ε_Y < 1` lie strictly below the product widths of the two
cycles, so the included slice `s = 1` stays inside each half-open endpoint collar. The
lateral product condition returns its own width `0 < μ < 1` and asserts equality only on
total-bundle vectors based at collar time `s < μ`. Construct the standard `Dⁿ × I ⊂ M × I`
tube with these faces, with lateral collar `(s,t,b) ↦ (t, c_X(εs,b))` for one common width
`ε` below the product width of `X`, and derive reflexivity from it.
Include product compatibility of the complement framing on the lateral collar and a stable
framing off that neighbourhood whose endpoint
pullbacks equal the two displayed complement framings after one common stabilization.

#### 6A.2 Almost-framed quotient

*Needs:* 6A.1; Layer 2 connected sum; relative collar gluing in dimension n≥5.

Prove independence of defect discs, collars, representatives, and stabilization.  Prove the
bordism relation and connected-sum abelian-group laws in dimension `n ≥ 5`; call the
resulting exported group the almost-framed bordism group `A_n`. Filling-group instances and the maps
consuming these groups carry their dimension range explicitly. No degree-zero group is
asserted on a carrier that requires a positive-dimensional defect disc.

#### 6A.3 Historical normal-frame model

*Needs:* 6A.1; Kervaire–Milnor §§3–6; Section 5.1 tangent/normal comparison.

Separately define the historical Kervaire--Milnor carrier: a closed oriented `n`-manifold with
their stable normal frame field on the complement of one chosen top cell, modulo their
framed-bordism relation on the punctured representatives.  Pin the collar, stabilization, and
top-cell conventions rather than hiding them in the quotient.  The top cell is again a smooth
embedded collared closed disc with proper image, and the normal framing converted to tangent
data is product-compatible on its exterior collar; `topCell = univ` must be impossible.

#### 6A.4 Comparison of almost-framed models

*Needs:* 6A.1–3; actual defect-disc and top-cell bordisms, with common stabilizations.

Construct the forward map by converting the tangent framing to a normal framing and collapsing
the chosen defect disc to the top cell.  Construct the inverse by choosing an embedded top-cell
disc, converting normal to tangent data on its complement, and restoring the defect collar.
Prove independence of the cell and disc choices, prove both composites by explicit framed
bordisms, and prove compatibility with connected sum, orientation reversal, and the defect map.
Only after this group isomorphism may notation `A_n` refer to either model.

The defect-disc exterior adapter has the following API over the shared embedded-disc and collar constructions.

- The exterior has the half-space boundary model, with boundary the defect sphere and its induced reversed orientation.
- A proper product tube has named endcaps and a lateral exterior collar whose endpoint maps agree with the specified smaller endpoint collars.
- Restriction, positive collar reparametrization and common shrinking preserve the framing equations; no exterior collar is imposed on the endcap interiors.

**Checks.**

- A hemispherical defect in Sⁿ has a disc exterior with one boundary sphere; requiring the exterior collar image to be open in the whole sphere wrongly rejects it.
- In the radial exterior model c(s,x)=(1−s)x, ε=1/2 gives endpoint radius 1−ε=1/2>0; ε=1 gives radius 0 and is forbidden.
- The cylinder defect Dⁿ×I has two endcaps and one lateral face. Its endpoint collar derivatives scale the normal by ε>0, not by 1; treating an endcap as a lateral exterior face gives the wrong ambient boundary model.

The almost-framed cycle, its trace and its historical comparison have the following API.

- The complement frame induces the chosen orientation and is equal to the specified product frame on a proper collar.
- Traces retain the defect arc, endpoint discs and equality of endpoint frames after a common stabilization; cylinders, reversal and gluing give the equivalence relation.
- The tangent/normal conversion and top-cell conversion induce inverse maps of quotient groups and commute with connected sum and defect deletion.

**Checks.**

- The punctured standard Sⁿ has defect a proper disc and exterior Dⁿ; a purported defect equal to the whole sphere is excluded by the proper-image condition.
- For a product trace the two endpoint frames agree after the same stabilization. Replacing one by a gauge of nonzero obstruction does not satisfy that endpoint equation.
- Reversing an oriented cycle changes its induced orientation sign from +1 to −1. Keeping the original complement frame would violate orientation compatibility.

**Checks for the almost-framed quotient and historical comparison.**

- The standard sphere with its boundary-induced stable frame maps to 0 in both quotient presentations; the disc nullbordism realizes both zero classes.
- The product trace has two endpoint discs, and conversion tangent→normal→tangent returns the original stable framing class at both ends; dropping one endpoint would not witness the same relation.
- The hemisphere exterior has one boundary sphere in both presentations, while allowing the top cell to be the whole sphere would give zero boundary components and violate the comparison.

*Needs:* GeometricTopology Layer 1 and gap:collared-oriented-bordism; Layers 2, 4A and 5;
Kervaire–Milnor §3 for the stable framing obstruction and §§5–6 for its geometric comparison.
The defect adapters are targets here; no absent named supplier carrier is assumed.

### 6B. Parallelizable fillings and comparison

#### 6B.1 Stably framed fillings

*Needs:* Native boundary subtype; 6A exterior adapter; 5.1 stable frames and the supplied collar.

Define a stably framed filling cycle of dimension `n` as a compact connected oriented smooth `n`-manifold whose
boundary is identified orientation-preservingly with a homotopy `(n-1)`-sphere, together with a
stable tangent framing product-compatible on a returned proper subcollar of the supplied
collar. Call this carrier stably framed or s-parallelizable, not parallelizable.  The boundary carrier is identified with the actual
Mathlib boundary subtype of the filling, and the collar restricts at zero to that
identification.  Pin it as a diffeomorphism from the open subtype `[0,1) × boundary` of the
relative cylinder to the displayed open collar neighbourhood.  Construct the product
framing only from the collar derivative, normal line, and boundary framing; product
compatibility is equality with the ambient trivialization after pullback over the actual
returned width `0<epsilon<1` in that half-open source. A construction allowed to return
the ambient framing itself makes this condition
circular and does not count.

#### 6B.2 Three-face filling bordisms

*Needs:* 6B.1; Layer 1 h-cobordisms; GeometricTopology corner gluing and induced face orientations.

A filling bordism is a collared, oriented, framed `(n+1)`-manifold with corners whose rounded
boundary is decomposed into three named faces: the incoming filling, the outgoing filling, and
a vertical collared oriented h-cobordism between their boundary homotopy spheres.  Store all
three smooth embeddings, require the horizontal faces to be disjoint, require their union with
the vertical face to cover the boundary, and identify the two horizontal--vertical
intersections exactly with the two endpoint sphere embeddings.  The incoming endpoint carries
the reversed induced boundary orientation and the outgoing endpoint the given orientation.
Pull the trace framing back to both horizontal faces after one common stabilization and require
equality with the incoming framing after reversing the added normal line and with the
outgoing framing directly. Require all three face orientations to be induced from the
trace through their actual derivative/normal splittings, with incoming minus and outgoing
plus. The trace framing induces the trace orientation. The vertical h-cobordism has the
negative of the trace-induced face orientation, so its own endpoints have incoming minus
and outgoing plus; reverse its added normal line as well. This is the transposition of
the time and boundary-normal directions at the corners. Its restriction to the vertical face is
product-compatible on that face's collar.  Corner rounding must preserve these face maps,
orientation identifications, and framing equations.  Construct the product cylinder, including
its vertical boundary cylinder and both corners, as the reflexivity witness.  Use these
witnesses to prove equivalence and make boundary connected sum into an abelian-group operation.

#### 6B.3 Honest frame and collar normalization

*Needs:* 6B.1–2; MorseTheory M3; TopologicalKTheory T1.5a/T1.6; 4A relative smooth gauge approximation.

Restrict an honest framing of `TW` to `T(∂W) ⊕ ε_normal`, keeping the normal
as a boundary stabilization slot. This is a stable boundary framing and does not imply
an honest framing of `T(∂W)`. Construct the collar-normalized stabilization of an honest
ambient frame after adding one extra trivial line. First make its collar pullback constant
in collar time on a smaller collar: identify tangent fibres by the actual derivative of
the product collar, evaluate the pulled-back frame at a smooth reparametrization of time
which is zero near the boundary and unchanged off a wider collar, and interpolate those
evaluation times to obtain a path of fibrewise isomorphisms. This uses product tangent
transport, not the derivative of the reparametrization, which would be singular.
Then in collar coordinates write a vector as `(t + sν, a)`, with `ν` the outward collar normal and `t` tangent to the boundary.
Rotate the normal and extra line through a quarter turn, so that the normalized frame is
`(f(t − aν), s)` at the boundary, before the fixed permutation putting the normal first.
Additional stabilization coordinates are unchanged. Use a smooth cutoff on a narrower
collar to extend this rotation by the identity off the original collar. Prove forward and
inverse smoothness, the displayed evaluation law, orientation/permutation signs, and the
resulting global homotopy from the block stabilization to this normalized endpoint.
The boundary frame is `(t,a) ↦ f(t − aν)`, with its one normal stabilization retained.
The normalization homotopy moves the boundary framing.

Return a real width `0<epsilon<1` as part of the product-collar witness and require equality of
the actual derivative-pulled and product-normal trivializations only on total-space vectors
based over `0<=s<epsilon`. Choose a wider cutoff collar with `epsilon<delta<1`; all
interpolation and rotation changes are the identity for `s>=delta`. The supplied ambient
manifold, boundary identification and orientations stay fixed. If a unit-width object is
needed, restrict and reparametrize by `c_epsilon(s,b)=c(epsilon*s,b)`; its collar derivative
scales the normal by positive `epsilon`. Prove that the boundary-frame evaluation and
normal-coordinate equations transport by this positive rescaling, retaining the fixed
ordering and signs. Restrict the entire global homotopy for its moving boundary path.
For two such widths use a common smaller width and a cutoff isotopy to prove comparison,
gluing, corner rounding and the geometric quotient class independent of this choice.
Test every normalization target on the radial collar `c(s,x)=(1-s)x` of `D^7`, whose
image is the punctured disc: normalization holds on the returned proper subcollar and
extends smoothly across the centre after the cutoff. Product structure on the whole
radial collar would force the normal column on opposite rays to have the same nonzero
limit at the centre and contradict linearity. Keep this example in addition to
the stable boundary framing of `S^6`.

For compact connected `W^n` with nonempty boundary and `n>=2`, construct an
absolute finite handle decomposition with no top-index handles, rather than
taking that property of an arbitrary decomposition. Extend the prescribed
collar-height function over the smooth double, apply MorseTheory M3's
relative Morse approximation fixing a protected collar, and restrict to `W`.
In the finite relative handle graph,
choose a spanning forest rooted at the boundary components, cancel its
interior `0/1` handle pairs and retain the edges between rooted components;
dualize to an absolute decomposition with no `n`-handles. Export the actual
finite CW comparison `K -> W`, its inverse and homotopies, with
`dim K<=n-1`. First use the finite SO sphere-fibration connectivity and the
corresponding BSO stabilization range to cancel the tangent bundle's stable
trivialization over this model and obtain an honest oriented ambient frame.
Separately lift the ratio between that frame's stabilization and the
prescribed stable frame along `SO(n) -> SO(n+s)` over `K`; construct the
resulting global homotopy, so the prescribed stable framing class is lifted,
not merely the underlying bundle. Choose one common finite stabilization
for these data and comparisons. Make the homotopy constant near its parameter
endpoints and apply relative smooth `GL+` gauge and path approximation,
keeping the endpoint frames and preserving a positive invertibility reserve
on the compact base and parameter cylinder. Use the actual collar extensions
and open matrix charts to obtain a jointly smooth endpoint-constant path
before constructing a smooth framed cylinder; smoothness of each slice and
jointly continuous evaluation alone are insufficient. Combine this global
homotopy with the explicit normalization homotopy above. Package the honest
frame and comparison with its normalized stabilization as
a collar-normalized parallelizable filling cycle. Retain the boundary path
obtained by pulling back the comparison to the collar, its endpoint laws and
normal-line transport. No collar-fixed homotopy to the unmodified block
stabilization is required. A separate relative lifting theorem with fixed
boundary data must retain its actual obstructions; it is not used to obtain
these filling representatives.

#### 6B.4 Disc and historical filling comparison

*Needs:* 6B.1–3; Kervaire–Milnor §§5–6; the retained moving boundary path.

Construct the standard `D⁷` representative from its constant ambient frame before proving
the historical comparison. Identify its actual boundary with `S⁶` and compute the induced
stable boundary frame `(t,a) ↦ t − a x`, up to the stated fixed target permutation.
Verify the normal/extra-line rotation, its cutoff extension, and the moving boundary path
explicitly. This construction requires no honest tangent frame of `S⁶`.

Separately encode Kervaire–Milnor's historical honestly parallelizable `P_n` cycles and
their relative cobordisms. Map a historical representative to its collar-normalized
stabilization with the normalization path. In the reverse direction retain the honest
ambient frame and use the recorded boundary transport. Prove invariance under stabilization,
collar shrinking and choices of cutoff, and prove both composites by cobordisms. For gluing,
insert the recorded boundary path as a framed collar cylinder before identifying endpoints;
prove identity, concatenation, reversal, and pullback laws for those transports, and compare
incoming/outgoing/vertical corner permutations. Prove that defect deletion has the needed
normalized representative by the absolute stable-class lifting of item 3. Finally prove
compatibility with boundary connected sum, orientation reversal and boundary, then identify
the resulting quotient with `P_n`. The meaning of `bP` remains bounding an honestly
parallelizable manifold.

Before defining defect deletion on quotient classes, construct the following map on
connected almost-framed representatives. Extend the open-exterior framing to the closed
exterior using its product witness on the returned proper subcollar and prove that
restriction recovers the given framing. Give the closed exterior its inherited orientation and prove the extended framing
induces it. In dimension at least two, prove the exterior connected, and identify its
boundary with the defect sphere with the reversed boundary orientation. Package these
specific data as a stably framed filling cycle, then prove witness compatibility and the
required Stage 6B normalization comparison before descending the map. Transport endpoint
framings along its recorded boundary path when composing the deletion witness with a
historical filling or gluing witness. No component is discarded.

The stably framed filling and three-face filling bordism have the following API.

- Boundary identification is a diffeomorphism onto the actual boundary subtype, with outward-normal orientation.
- Product compatibility uses the derivative-pulled tangent bundle and a returned width strictly between 0 and 1.
- The three face maps, their exact intersections and their stabilized framing restrictions are preserved by composition and corner rounding.

**Checks for fillings.**

- D⁷ with the constant ambient frame has boundary S⁶ and stable boundary frame (t,a)↦t−ax; this is rank 7, not a frame of TS⁶ of rank 6.
- A closed parallelizable torus has zero boundary components and cannot be a filling of a homotopy sphere; the required boundary identification rejects it.
- Reversing the boundary orientation without reversing its collar normal multiplies the orientation sign by −1 and fails the boundary-identification law.

**Checks for three-face bordisms.**

- W×I has two disjoint horizontal faces and vertical face ∂W×I, with exactly two corner intersections ∂W×{0,1}.
- For orientation dt followed by the W orientation, the horizontal faces have signs −,+; the vertical boundary orientation differs by one transposition of dt and the normal, hence sign −1.
- Omitting the vertical face in the disc cylinder leaves ∂Dⁿ×(0,1) uncovered; the boundary-cover equation fails.

The honest filling normalization and historical comparison have the following API.

- Absolute cancellation over the spine of dimension at most n−1 gives an honest frame and a lift of the prescribed stable framing class, for compact connected Wⁿ with nonempty boundary and n≥2.
- The normal/extra-line rotation gives a smooth global homotopy and retains its moving boundary path.
- Collar shrinking and positive normal rescaling commute with that path, gluing and the inverse historical comparison.

**Checks.**

- On the ordered normal/extra plane, the quarter-turn matrix sends (s,a) to (−a,s), has determinant +1, and at the boundary gives (f(t−aν),s). A reflection matrix has determinant −1 and is excluded.
- For the radial disc collar, ε=1/2 has nonzero endpoint radius 1/2 and normal derivative −x/2 after reparametrization; ε=1 reaches the centre and is excluded.
- Opposite radial rays have outward normals x and −x. A product-normal column on the whole punctured collar would have incompatible opposite limits at the centre; a cutoff at δ<1 avoids that false global condition.

For the historical map, the disc frame and its collar-normalized stabilization give the same
class via the recorded path; reversing the path gives the inverse transport, while a constant
path with different endpoint frames fails its endpoint law. This comparison does not assert
relative cancellation with an arbitrarily fixed boundary framing.

*Needs:* Sections 6A, 4A and 5; MorseTheory M3 relative approximation, GeometricTopology
Layer 1 handles/collars; TopologicalKTheory T1.5a finite connectivity and T1.6 stabilization;
Kervaire–Milnor §§5–6. The proper-collar rotation and prescribed stable-class lift are
separate comparison targets, not consequences of the statement that a stable bundle is trivial.

#### 6B finite E8 plumbing family

Construct for every k>=1 the signed E8 tree plumbing P^(4k) of eight disk
bundles of TS^(2k), on explicit disjoint local disks with actual
coordinate-switch derivatives, corner rounding and collars. Pin the core
orientations and normal Euler numbers to obtain the negative E8 matrix,
not merely an unspecified plumbing with that name. Identify its middle
intersection form, determinant1 and signature-8 with the actual integral
Cartan model. Construct its deformation retraction/CW comparison with the
wedge of eight core S^(2k). On every core compare the restricted tangent
bundle with TS^(2k) plus TS^(2k), use the radial sphere stable frame and
prove these actual tangent restrictions stably trivial. The wedge comparison
then gives a chosen stable frame on all of P. Use finite-rank Stiefel
cancellation at rank4k over its2k-dimensional spine to construct an honest
tangent frame. Supply collar-product comparison for that chosen frame;
do not assert an arbitrary prescribed boundary stable frame destabilizes.
For k>=2, dual handles give the actual boundary-to-filling pi1 isomorphism;
P is simply connected. The unimodular pair sequence and duality make its
boundary an integral homology sphere, hence a homotopy sphere by the actual
simply connected Hurewicz/Whitehead comparison. For this boundary dimension4k-1>=7, remove two disjoint smooth balls.
The resulting simply connected smooth cobordism between standard spheres
has both boundary inclusions homotopy equivalences by the pair sequence
and Hurewicz/Whitehead. Apply the actual smooth h-cobordism theorem
(cobordism dimension>=6) to obtain a twisted-double-disc description.
Extend its boundary diffeomorphism homeomorphically over the disc by the
radial Alexander trick, proving continuity and the inverse at the center;
this supplies an actual homeomorphism with the standard sphere. Keep k=1
as a separate homology3-sphere branch. This geometric producer precedes
7C's signature/8 realization and uses no Theta7 or analytic index theorem.
Its all-k smooth nonstandardness and special seven-dimensional bundle model
are separate later outputs of9A below.

The E₈ plumbing family's API includes the oriented core embeddings and coordinate-switch
maps, the intersection form, the spine comparison, an actual smooth frame and its collar
normalization. Boundary homotopy-sphere recognition is stated only for k≥2.

**Checks.**

- The eight-core intersection matrix is −E₈, of determinant 1 and signature −8; its obstruction coordinate is −8/8=−1. The positive tree has signature +8 and gives the opposite orientation convention.
- At k=2 the spine has dimension 4 and the tangent rank is 8; the stable-to-honest cancellation is within the finite connectivity range.
- At k=1 the boundary is a homology three-sphere with nontrivial fundamental group; homology and determinant 1 alone cannot trigger the simply connected boundary conclusion.

*Needs:* Section 6B framing normalization; GeometricTopology Layer 1 plumbing by handle
gluing; AlgebraicTopology pair sequence, duality and Hurewicz/Whitehead; TopologicalKTheory
T1.5a; Layer 1 only for the high-dimensional twisted-disc comparison. No index theorem is used here.

### 6C. Maps and exactness

#### 6C.1 Deletion, inclusion and boundary

*Needs:* 6A–6B actual normalizations; Layer 2 sphere cycles; 4A stable framing obstruction.

Define the maps first on the convenient carriers: delete the defect-disc interior to obtain a
stable filling, give a punctured homotopy sphere its canonical stable framing, and take the
oriented boundary of a stable filling.  Descend them to the three quotients.  Prove every map
is independent of choices and additive, then prove that the comparison isomorphisms from 6A
and 6B make these maps commute with the historical `p`, `i`, and `b`.  Only after these diagrams
commute write them as `p : A_n -> P_n`, `i : Theta_n -> A_n`, and
`b : P_n -> Theta_(n-1)`.

#### 6C.2 Geometric exactness

*Needs:* 6C.1; 6A–6B geometric witnesses; n≥6.

Prove, map by map for `n>=6`, exactness of
`... -> A_(n+1) -> P_(n+1) -> Theta_n -> A_n -> P_n -> Theta_(n-1) -> ...`.
At each term, construct the geometric filling or cobordism witnessing the reverse inclusion
from kernel to image.

#### 6C.3 The boundary subgroup

*Needs:* 6C.1–2; honestly parallelizable fillings and connected sum.

Define `bP_(n+1)` as the subgroup of `Theta_n` represented by homotopy spheres bounding
parallelizable manifolds.  Prove it is precisely the image of the boundary map and prove
closure under connected sum and orientation reversal.

Kervaire–Milnor §4, pp.510–512, defines the parallelizable-boundary subgroup and
proves its framing-coset criterion; §§5–6, pp.512–521, supply the surgery inputs.
The almost-framed and filling quotient presentations and their exact sequence in 6C.2
are comparison targets here, with the actual deletion, extension and gluing witnesses
of 6A–6B, rather than quotations of a sequence written in those sections.

The deletion, inclusion and boundary maps, and the subgroup bP, have the following API.

- Each map has the displayed source and target, respects the witness relations and is additive.
- Defect deletion uses the whole connected exterior with its reversed boundary orientation and its normalized frame.
- The subgroup bPₙ₊₁ is the image of the boundary homomorphism Pₙ₊₁→Θₙ; exactness is an equality of kernels and images, with geometric witnesses in the reverse direction.

**Checks.**

- The standard disc has standard sphere boundary, so its boundary class in Θₙ₋₁ is 0; this does not claim every filling has zero P-class.
- Deleting the defect in a standard sphere produces a disc with the reversed defect-boundary orientation, giving degree −1 against the outward orientation of the deleted disc.
- A boundary-connected sum of fillings has boundary the connected sum of their boundaries; on the negative E₈ and its reverse the obstruction coordinates are −1,+1 and their sum is 0.

**Checks for the boundary subgroup.**

- The standard Sⁿ bounds Dⁿ⁺¹, so its zero class belongs to bPₙ₊₁.
- In dimension seven the negative E₈ boundary belongs to bP₈ and has coordinate −1 in Θ₇=ℤ/28; replacing bP₈ by the zero subgroup loses this element.
- Reversing that filling gives coordinate +1, and their connected sum has coordinate 0; closure uses the actual oriented boundary-connected sum.

**Checks for defect deletion.**

- Deleting a hemispherical disc in Sⁿ gives Dⁿ with one boundary sphere, with degree −1 against the deleted disc's outward boundary.
- Deleting a defect and then reversing the cycle reverses the filling orientation; its signature coordinate, when defined, changes from a to −a.
- A purported defect equal to the whole sphere would leave an empty exterior with zero components; it is excluded by the proper-image condition before defining the map.

**Checks for sphere inclusion and filling boundary.**

- Inclusion sends the standard sphere to 0 in Aₙ, and boundary sends Dⁿ⁺¹ to 0 in Θₙ.
- In dimension seven inclusion sends the negative E₈ boundary to 0 in A₇=0, while boundary sends its filling to −1 in Θ₇=ℤ/28; confusing these two maps loses their distinct targets.
- On the sum of the negative E₈ filling and its reverse, boundary gives −1+1=0, agreeing with addition of the two boundary classes.

### Examples

The normalized D⁷ frame uses one boundary stabilization slot, and its proper radial subcollar
has width 1/2 and endpoint radius 1/2. The negative E₈ filling has signature −8 and obstruction
−1; for k=1 the boundary assertion stops at integral homology sphere, while k≥2 gives the
simply connected hypothesis needed for a homotopy sphere.

### Dependencies

*Needs:* Layers 1–2, 4A and 5; Sections 6A–6B for the maps in 6C; AlgebraicTopology
relative duality. The exact segment in 6C has n≥6, independently of the n≥1 group law for Θₙ.

## Layer 7: Wall surgery and the obstruction calculation

This stage consumes geometric topology's surgery operation, AlgebraicTopology's relative
homology and duality, and Stages 4--6's framings and `P_n` cycles.

### 7A. Normal maps and surgery below the middle dimension

#### 7A.1 Degree-one normal maps

*Needs:* AlgebraicTopology Poincaré pairs; 4A stable normal bundles; 5.1 framing comparison.

Define a degree-one normal map `(f,b) : M -> X`: a degree-one map of oriented manifolds or
Poincare pairs together with stable normal-bundle data covering it.  Define normal bordism and
prove functoriality under composition, boundary, and products.

#### 7A.2 Surgery kernels

*Needs:* 7A.1; TangentialBordism B1 transversality; AlgebraicTopology finite CW type and duality.

Decompose a normal map by transversality to cells/handles of the target.  Identify its surgery
kernels in homotopy and homology and prove they are finitely generated with the duality pairing
needed in the middle dimension.

#### 7A.3 Below-middle surgery

*Needs:* 7A.2; GeometricTopology Layer 5 surgery and traces; framed sphere representatives.

Realize a chosen kernel generator below the middle dimension by a framed embedded sphere.
Apply the shared geometric surgery operation, construct its trace, and prove its effect on
homotopy, fundamental group, homology, normal data, and stable framing.

#### 7A.4 Connectivity improvement

*Needs:* 7A.2–3; finite generation of the kernels; Wall Theorem 1.2.

Iterate this operation to make a simply connected normal map `k`-connected below the middle
dimension, keeping boundary and collar data fixed.  Prove termination from finite CW type.

The degree-one normal-map and normal-bordism API includes the stable normal bundle map,
relative fundamental-class degree, boundary restrictions, composition and the surgery-kernel maps.
The targets in this layer have simply connected target Poincaré pairs and a boundary homotopy
equivalence; the surgery improvement and obstruction criterion have total dimension at least five,
with the even middle-dimensional criterion in dimension 2q≥6.

**Checks.**

- The identity normal map has degree 1 and zero kernel; the constant map on a positive-dimensional closed target has degree 0 and is excluded.
- A degree-two sphere map sends the fundamental class to twice the generator and is not a degree-one normal map even if bundle data are supplied.
- For a boundary equivalence, the relative boundary kernel is 0; an arbitrary map of boundaries with nonzero homology kernel does not instantiate the relative surgery theorem.

*Needs:* GeometricTopology Layer 5 surgery and Layer 1 traces; AlgebraicTopology Stages 2–6
relative homology/duality and finite CW type; Sections 4A, 5 and 6B; Wall Theorems 1.2 and 5.6/6.4.

### 7B. Middle-dimensional algebra

#### 7B.1 Quadratic kernel

*Needs:* 7A; middle-dimensional duality and framed self-intersection.

On the remaining kernel construct the `epsilon`-symmetric intersection pairing and its
quadratic refinement from framed self-intersections.  Prove nonsingularity, basis-change
invariance, orthogonal-sum behavior, and invariance under normal bordism.

#### 7B.2 Even obstruction forms

*Needs:* 7B.1; finite free integral modules and hyperbolic stabilization.

For `n=2*q`, define the even-dimensional obstruction carrier to be nonsingular
`(-1)^q`-quadratic forms on finite free `Z`-modules, modulo isometry and hyperbolic
stabilization.  Define its addition and inverse by orthogonal sum and sign reversal.

#### 7B.3 Odd obstruction formations

*Needs:* 7B.1; displayed q-zero Lagrangians; Ranicki §2 elementary-zero relations.

For `n=2*q+1`, define instead a `(-1)^q`-quadratic formation: the surgery kernel together with
the two lagrangians coming from the two boundary/handle presentations.  Quotient formations by
isomorphism, elementary modification, and hyperbolic stabilization.  Prove addition and inverse
on this quotient.  Do not encode an odd obstruction as the Witt class of a form.
In both parity branches the pairing and quadratic refinement are functions on the whole finite
free module.  Their symmetry, polarization, scalar, nonsingularity, and parity laws are data;
each displayed lagrangian is isotropic, a direct summand, equal to its orthogonal complement,
and a zero locus for the quadratic refinement.  Define stable equivalence as the equivalence
relation generated by form/formation isometries, addition of displayed hyperbolic summands, and
addition/removal of every elementary-zero formation in the odd case: either the two
lagrangians are complementary, or they share a common lagrangian complement. Prove
compatibility with orthogonal sum and compare this presentation with
[Ranicki, *Foundations of algebraic surgery*, §2](https://arxiv.org/abs/math/0111315).
Elementary transvections alone do not supply these zero relations. The quotient may
not use a freely chosen setoid.

#### 7B.4 Wall-group comparison

*Needs:* 7B.2–3; Wall Theorems 5.6 and 6.4.

Define `L_n(Z)` by the parity split above and prove that both presentations agree with Wall's
simply connected surgery obstruction in their respective dimensions.

#### 7B.5 Even-dimensional vanishing

*Needs:* 7B.1–2; 7A surgery; Wall Theorem 5.6, p.50, in dimension 2q≥6.

Prove the surgery obstruction vanishes exactly when the even-dimensional kernel has a
lagrangian.  Realize a lagrangian by disjoint framed embedded spheres and perform middle-
dimensional surgeries to turn the normal map into a homotopy equivalence.

#### 7B.6 Odd-dimensional vanishing

*Needs:* 7B.3; 7A surgery; Wall Theorem 6.4, p.68, in dimension 2q+1≥5.

In odd dimensions prove the corresponding zero criterion in terms of an elementary, stably
hyperbolic formation and realize its elementary modifications geometrically.

#### 7B.7 Geometric realization

*Needs:* 7A; 7B.2–3; Wall Theorems 5.8 and 6.5 in dimensions 2q≥6 and 2q+1≥7.

Prove realization: in even dimensions plumb handles to realize a prescribed nonsingular
quadratic kernel; in odd dimensions build a normal cobordism realizing a prescribed formation.
Prove additivity and identify the trace decomposition with the relevant sum.

#### 7B.8 Comparison with geometric fillings

*Needs:* 6B; 7B.4–7; the actual zero-obstruction bordisms and realization maps.

Compare the resulting obstruction on a geometric `P_n` cycle with Stage 6B's standard
Kervaire--Milnor group.  Prove injectivity by completing a zero-obstruction filling to a framed
cobordism and surjectivity by realization.

The even form and odd formation presentations have distinct APIs.

- Forms carry a whole-module pairing and quadratic refinement with nonsingularity, symmetry and polarization; isometries and hyperbolic stabilization preserve the class.
- Formations additionally retain both q-zero direct-summand Lagrangians and the elementary-zero relations, rather than only the underlying form.
- Orthogonal sum and sign reversal descend to the obstruction groups and agree with geometric trace sum and reversal.

**Checks for forms.**

- The zero module has determinant 1 by the empty determinant convention, signature 0 and Arf 0, and represents the neutral class.
- The integral hyperbolic plane has matrix [[0,1],[1,0]], determinant −1 and signature 0; its mod-two refinement q(x,y)=xy has Arf 0.
- Over 𝔽₂ the plane with q(a)=q(b)=1 has q(a+b)=1 and Arf 1, so it has no nonzero q-zero line. Ignoring the refinement would identify it with the hyperbolic plane.

**Checks for formations.**

- (H(ℤ);L,L*) is zero by complementary Lagrangians, and (H(ℤ);L,L) is zero by their common complement L*.
- For q(x,y)=xy, the proposed line generated by e+f has q(e+f)=1, so it is not a q-zero Lagrangian; an arbitrary transvection is not a valid zero relation.
- On the zero module both Lagrangians are zero and the formation class is 0; its orthogonal sum with a formation leaves that class unchanged.

The geometric obstruction API gives bordism invariance, zero iff the specified relative normal
bordism contains a homotopy equivalence, and realization, not a hypothesis asserting the desired
answer. Even realization uses 2q≥6 (Wall Theorem 5.8, p.54); odd realization uses
2q+1≥7 (Theorem 6.5, pp.68–69). The five-dimensional zero criterion uses Theorem 6.4,
p.68; it is not an application of the odd realization theorem outside its range.

*Needs:* Section 7A; AlgebraicTopology middle-dimensional duality; TangentialBordism
B3.2(a)'s gap:finite-quadratic-arf for the quadratic algebra; Section 6B for the P-group comparison;
Wall Theorems 5.6, 5.8, 6.4 and 6.5; Ranicki §2 for the formation presentation.

### 7C. Computation of the simply connected groups

#### 7C.1 Odd groups

*Needs:* 7B formations; Wall Theorem 13A.1, p.172; odd n≥5.

First prove that both `(H(ℤ);L,L*)` and `(H(ℤ);L,L)` represent zero, using the
complementary and common-complement relations respectively. In odd dimensions over
the simply connected coefficient ring `Z`, prove every relevant
quadratic formation is elementary after hyperbolic stabilization and obtain `P_n=0` for odd
`n>=5`.

#### 7C.2 Signature coordinate

*Needs:* 7B forms and realization; 6B E₈ plumbing; Wall Theorem 13A.1, p.172; k≥2.

In dimension `4k`, identify the obstruction with the signature of the even unimodular middle
form divided by eight.  Prove divisibility by eight, classify the Witt group, construct the
`E_8` plumbing realization, and obtain `P_(4k) ~= Z` for `k>=2` with the stated normalization.

#### 7C.3 Arf coordinate

*Needs:* TangentialBordism B3.2(a), gap:finite-quadratic-arf; 7B forms; Wall Theorem 13A.1, p.172; k≥1.

Consume the pure algebra substage of
[TangentialBordism B3.2(a)](../TangentialBordism/README.md)
with its declared gap:finite-quadratic-arf for the finite quadratic Arf invariant, basis independence, hyperbolic/anisotropic decomposition and
the zero-Arf/zero-quadratic-Lagrangian criterion, including dimension zero. Own the
integral Wall-form reduction to that shared `F₂` refinement and its comparison here.
Realize both classes geometrically and obtain `P_(4k+2) ~= Z/2` for `k>=1`.
This calculation uses B3.2(a)'s algebra; Section 5 separately consumes B5.2's finite PT and B3.2(b–c)'s Spin geometry.

#### 7C.4 Defect map and surgery

*Needs:* 6C.1; 7A traces and 7B comparison.

Prove that framed surgery on an almost-framed cycle produces precisely the class carried by
`p : A_n -> P_n`.  Interior surgery is a trace cobordism, not an additional quotient relation.

Wall, *Surgery on Compact Manifolds*, 2nd ed., Theorems 5.6 (p.50) and 6.4 (p.68)
give the even and odd relative surgery obstruction criteria; Theorems 5.8 (p.54) and
6.5 (pp.68–69) give realization in dimensions 2k≥6 and 2k+1≥7 respectively.
The trivial-fundamental-group calculation is Theorem 13A.1, p.172. These are distinct
inputs: the table alone proves no geometric realization or comparison.  Kervaire--Milnor, Sections 5--8,
fixes the signature/8 and Arf normalizations and the plumbing representatives.  A citation to the
final `L`-group table does not replace this decomposition.

### Examples

The simply connected obstruction groups have coordinates σ/8 in dimensions 4k, Arf in
4k+2, and 0 in odd dimensions. On the negative E₈ form σ/8=−1, on its reverse +1,
and on the hyperbolic plane 0; the anisotropic 𝔽₂ plane has Arf 1. These distinguish both
normalizations and the two parity presentations (Wall Theorem 13A.1, p.172).

### Dependencies

*Needs:* Sections 7A–7B; TangentialBordism B3.2(a)'s declared finite quadratic Arf contract;
Section 6B plumbing and framings. The odd Pₙ vanishing is for odd n≥5, the integral
signature coordinate for 4k has k≥2, and the Arf coordinate for 4k+2 has k≥1.

## Layer 8: the Kervaire--Milnor comparison with stable homotopy

### 8.1 Forgetting a closed frame

*Needs:* 5.1 PT; 6A almost-framed cycles; framed connecting handles.

Use Pontryagin–Thom on a closed framed representative to construct the always-defined
forgetting homomorphism `π_n^S → A_n`: choose a defect disc and retain the framing off it.
Prove independence of the representative, defect, collar and stabilization. For the empty
representative first adjoin the standard boundary-framed Sⁿ, using its framed ball
nullbordism, so the map sends the empty class to zero and has a genuine disc to choose. Framed
disconnected representatives are normalized by framed connecting 1-handles; prove this
normalization independent and compatible with addition before using connected `A_n` cycles.

### 8.2 Extension obstruction and exactness

*Needs:* 4A clutching; 4C J; 5.1 PT; 6A defect traces.

Construct the extension obstruction `A_n → π_(n-1)(SO)` from the framing on the defect
sphere, with its orientation and stabilization conventions. Prove the exact sequence
`π_n(SO) →^J π_n^S → A_n → π_(n-1)(SO)` at its intermediate terms. A cycle in the
obstruction kernel admits an extension across its defect; only for such cycles apply PT
to the resulting closed framing. Changing that extension changes its stable class by
`im J_n`, so the canonical inverse lands in `coker J_n`. Prove the resulting canonical
isomorphism `coker J_n ≅ ker(A_n → π_(n-1)(SO))`.

### 8.3 The cokernel comparison

*Needs:* 8.2; the hypothesis πₙ₋₁SO=0; 6C exactness.

If `π_(n-1)(SO)=0`, identify all of `A_n` with that kernel and hence with `coker J_n`.
Transport Stage 6's exact segment through this isomorphism and identify both boundary
images with the corresponding `bP` subgroups. The sixth-dimensional application uses
the independently proved `π_5(SO)=0`; no arbitrary almost-framed cycle receives a
preferred element of `π_n^S`.

### 8.4 Kervaire invariant

*Needs:* 7B–7C quadratic refinement and Arf; 5.1 PT; 8.2–3.

Define the Kervaire invariant on an almost-framed `(4k+2)`-manifold as the Arf invariant of
the surgery-normalized middle-dimensional quadratic form.  Prove bordism invariance,
compatibility with Pontryagin--Thom, and equality with the map from `coker J` to `P_(4k+2)`.

Kervaire–Milnor, Lemmas 4.2–4.5 and the remarks following Theorem 4.1, pp.510–512,
give the parallelizable-boundary criterion and the coset of framing choices modulo im J
for homotopy spheres. Section 8.2's exact sequence for all almost-framed cycles is an
additional comparison target: construct the extension and defect-trace witnesses using
4A, 4C, 5.1 and 6A; it is not the literal statement of those lemmas.
Browder, Theorem 1.4, p.162, gives the quadratic polarization; Theorem 3.2,
pp.166–168, identifies its Arf invariant with the framed Kervaire invariant for a
framed 2q-manifold with q odd. Section 8.4 transports that comparison through
7B–7C's surgery normalization and 5.1's PT map.

The forgetting map, extension obstruction and Kervaire invariant have the following API.

- A closed framed representative maps to an almost-framed class independently of the defect disc and connecting handles.
- The obstruction is the actual clutching class of the exterior frame; its kernel consists exactly of classes whose frame extends after stabilization.
- PT on extensions is well defined modulo im J, and the surgery-normalized Arf invariant agrees with the resulting map to P₄ₖ₊₂.

**Checks.**

- A constant defect clutching map has obstruction 0 and extends over the disc; a nonzero clutching class does not extend in that stable group.
- Changing an extension by g changes its stable class by J(g), hence changes its coset in coker J by 0. Omitting that quotient loses choice independence.
- The hyperbolic middle refinement has Kervaire invariant 0; the framed product with q(a)=q(b)=1 has invariant 1. The zero map to P₄ₖ₊₂ fails the second value.

**Checks for forgetting a closed frame.**

- The empty framed cycle represents 0; adjoining a boundary-framed sphere still gives 0 after choosing a defect.
- In dimension seven, the two framed sphere classes differing by J₇(1) have the same image after forgetting the frame near a disc; their difference is 1 mod 240 in π₇⁽S⁾, although their images in A₇ are both 0.
- In dimension six, im J₆=0 and A₆=ℤ/2; forgetting sends ν² to the nonzero class, so a constant zero map fails.

**Checks for the extension obstruction.**

- The standard boundary-framed sphere has constant clutching map, hence obstruction 0.
- In dimension eight, the realization in 9A.2 has Bott obstruction 240, whose J-image is 240 mod 240=0; replacing every obstruction by 0 loses this realization.
- An obstruction coordinate 1 in π₇SO has J-image 1 mod 240≠0, so it cannot be the obstruction of a closed almost-framed eight-cycle in the exact sequence.

**Checks for the Kervaire invariant.**

- On the zero middle module the empty symplectic sum gives Arf 0.
- A hyperbolic plane with q(a)=q(b)=0 has Arf 0, while the plane with q(a)=q(b)=1 has Arf 1.
- Two anisotropic planes have total Arf 1+1=0; a rule testing whether any summand is anisotropic would incorrectly return 1.

### Examples

In dimension six π₅SO=0, so the obstruction kernel is all of A₆. In a dimension where the
obstruction group is nonzero the theorem identifies only the kernel with coker J, not all
almost-framed classes; this distinction prevents assigning a PT class to a nonextendable frame.

### Dependencies

*Needs:* Layers 3–7, specifically the PT dictionary of 5, defect/collar comparison of 6A–6B
and Wall refinement of 7B–7C. Kervaire–Milnor Lemmas 4.2–4.5, pp.510–512, and Browder Theorems 1.4 and 3.2,
pp.162, 166–168, give the indicated classical inputs; exactness is asserted in the dimension ranges of 6C.

## Layer 9: explicit computation through the sixth stem and `Theta_6`

This stage is an explicit theorem chain.  None of the displayed groups may enter as an axiom or
as a field of a low-stem data record.

### 9.1 First three Hopf stems

*Needs:* 3B–3C EHP/Hopf maps; 5.0b first two offsets; StringOrientation S2.3 normalized third stem.

Construct the stable Hopf classes `eta` and `nu` from the complex and quaternionic Hopf
fibrations. Use 5.0b's framed calculations and their suspension comparisons to obtain
π₁⁽S⁾≅ℤ/2{η} and π₂⁽S⁾≅ℤ/2{η²}. Import π₃⁽S⁾≅ℤ/24{ν} from
StringOrientation S2.3. Compare its quaternionic Hopf generator with the chosen EHP
representative and the normal derivative framing of a Hopf regular fibre, preserving
the sphere orientation and PT product convention. This comparison fixes the sign of ν
used in 9.3 and 9.5; a second computation of the third-stem group is not a target here.

### 9.2 Fourth and fifth stems

*Needs:* 9.1; 3C EHP and Barratt–Toda identities.

Work through Toda's suspension-sequence diagonals in stems four and five.  Compute every
occurring `E`, `H`, and `P` map from the Barratt--Toda and Hopf-invariant formulas and prove
`pi_4^S=0` and `pi_5^S=0`.

### 9.3 The sixth stem and its representative

*Needs:* 9.1–2; 3A.4 Freudenthal; 3C composition and nonvanishing.

Normalize the unstable representative before entering the colimit.  Write
`nu_4 : S^7 -> S^4` for the quaternionic Hopf map and define the class called `nu^2` by
`nu_4 o Sigma^3(nu_4) : S^10 -> S^4`, with the composition order fixed by this displayed
formula.  Prove that its stabilization is independent of this representative, has order two,
and is nonzero by the indicated EHP/Toda calculation.  Show all other generators in the
relevant unstable groups either desuspend to the computed `P` image or die under suspension.
Freudenthal identifies the resulting colimit from `pi_(n+6)(S^n)` for `n>=8`, giving
`pi_6^S ~= Z/2{nu^2}`; in unstable form, `sphere_homotopyGroup_sixthStem` states
`π_(n+6)(S^n, x) ≅ ℤ/2` for `n ≥ 8` and every base point `x`.

### 9.4 Compatible stem table

*Needs:* 9.1–3 and their suspension comparisons.

Record the chain as one compatible table of groups, generators, and suspension maps for stems
zero through six.  Each table entry links to the theorem calculating it; the table itself is
generated documentation, not proof input.

### 9.5 The framed product and Arf

*Needs:* 9.1 and 9.3; 5.1 PT product; 7B–7C quadratic refinement; 3C Hopf normalization.

Construct a chosen stable framing `φ_ν` of the actual `S³` whose Pontryagin–Thom
class is the normalization of `ν` fixed in Steps 1 and 3. Produce it from a regular
fibre of the quaternionic Hopf map, with an explicit normal-to-tangent framing comparison.
On the closed product `S³ × S³`, use `φ_ν × φ_ν` and Stage 5's PT product theorem to
identify its stable class with the selected composition `ν²`, including the summand
permutations. Identify the factor generators `a,b` in middle homology, prove their
symplectic intersection matrix, and calculate the geometric framed refinement
`q(a)=q(b)=1` from the factor normal framings and the Hopf-invariant-one calculation
of Stage 3. Prove this framing/refinement comparison before using its Arf value. Use the shared
algebraic Arf theorem to conclude Kervaire invariant one. Compare this class with the regular-value representative
of `ν_4 ∘ Σ³ν_4` by the PT inverse bordism, and prove that
`coker(J_6) → P_6` sends it to the nonzero Wall class. Thus
`KI : π_6^S → ℤ/2` is an isomorphism. This construction uses an already closed product,
so requires neither a homotopy-five-sphere cap nor `Theta_5=0`.
Browder, Theorems 1.4 and 3.2, pp.162, 166–168, supplies the quadratic/Arf
comparison. Snaith, Example 8.3, gives existence of an Arf-one framing on S³×S³;
it does not identify that framing with the prescribed Hopf-fibre product. The equality
for φ_ν×φ_ν is the additional target here, using the explicit restriction to both
factor spheres and their Hopf-invariant-one normal data.

### 9.6 Almost-framed dimension six

*Needs:* 4B degree-five/six entries; 8.3; 9.3 and 9.5.

Bott periodicity gives `pi_5(SO)=0` and `pi_6(SO)=0`.  Use Stage 8 to prove
`A_6 ~= coker(J_6) ~= pi_6^S ~= Z/2`, with the comparison sending the framed `nu^2`
representative to the nonzero class.

### 9.7 Vanishing of Θ₆

*Needs:* 6C exact segment; 7C P₇=0 and P₆=ℤ/2; 9.5–6.

Stage 7 gives `P_7=0` and `P_6~=Z/2`; Stage 8 identifies the map
`coker(J_6) -> P_6` with the Kervaire invariant, hence with an isomorphism.  In the exact
segment
`P_7 -> Theta_6 -> coker(J_6) -> P_6`, the left image `bP_7` is zero and the right kernel is
zero.  Conclude `Theta_6=0`.

Toda, Chapters I--V, is normative for the unstable representative, its composition order, and
its stabilization in Steps 1--4.  Kervaire--Milnor, Sections 4--6, supplies the geometric refinement and the
comparison with `P_6`, while Browder, *The Kervaire Invariant of Framed Manifolds and its
Generalization*, supplies the framed quadratic refinement, Arf invariant, and Pontryagin--Thom
comparison.  The EHP/Toda and geometric comparison targets specify how the table and its generators
are reconstructed.

The Hopf generators and ν² representative have their own API: suspension compatibility,
composition with the displayed degree shifts, their orders and the framed-product comparison.

**Checks.**

- ν₄∘Σ³ν₄ has source S¹⁰ and target S⁴ since Σ³ν₄:S¹⁰→S⁷; reversing this composition has incompatible source and target.
- For the framed S³×S³, the symplectic generators have q(a)=q(b)=1, so Arf=q(a)q(b)=1 in 𝔽₂. Replacing it by a bounding hyperbolic frame would give 0.
- The two-element sixth stem has 2ν²=0 and ν²≠0; at n=8 the stable representative is π₁₄(S⁸), since 14=2·8−2.

### Examples

In P₇→Θ₆→ℤ/2→ℤ/2, the left group is 0 and the right map sends 1 to 1. Its kernel
has one element, so exactness forces Θ₆=0. Replacing the right map by zero would give
kernel of order 2 and would not prove recognition.

### Dependencies

*Needs:* Layer 3's EHP/Toda maps; Layer 4's Bott/J; Layer 5's PT product comparison;
Layers 6–8's exactness and normalized Arf map. The sixth-stem headline is the stable-range
form of the calculation, with all basepoints related by the supplied transport.

## Layer 9A: the seventh stem, seven-sphere models and the E8 cap obstruction

This branch retains every earlier stage and the independent dimension-six
recognition theorem. It is not a premise for the calculations through stem6.
Each numerical output below is a theorem to construct from the specified
models; none may be stored as an assumed field of a group/classification record.

### 9A.1 Seventh stem and primitive real J

*Needs:* TangentialBordism B4.1–2/B4.7; DGFloer 1.4; GeneralizedCohomology G5.6; 3A,4C; TopologicalKTheory T7; CharacteristicClasses C6.

**Seventh-stem upper bound and stable J.** Extend the actual sphere-spectrum
computation to stem7. Use the mod-p Adams towers on the shared HF_p
objects, actual graded Steenrod bar/cobar resolution, native spectral
sequence page/Ext carriers and the bounded-below finite-type completion
comparison. TB B4.1–2/7 supply ordinary operations and those general tower
interfaces; the sphere calculation itself belongs here and uses neither
MO/MSO/MSpin coefficient rings nor Theta7. Construct the actual finite
low-degree resolution matrices, cycle/boundary representatives, every
incoming/outgoing differential and vanishing-line bounds needed around
stems7 and8. Prove the resulting complete associated-graded stem7 has
total order at most16 at2, at most3 at3 and at most5 at5; do not mistake
uncomputed E2 towers for these abutment bounds. At primes p>=7 use the normalized dual-Steenrod cobar directly:
words made only of tau0 have t-s=0, and a word containing any other
positive generator has t-s>=2p-3>8. Thus the needed positive E2
groups vanish; actual convergence excludes the completed abutment.
Prove finite generation of each stable sphere group by DGFloer Layer 1 item 4 applied to the Serre class
of finitely generated abelian groups on a finite sphere in a genuine
Freudenthal range. GeneralizedCohomology G5 item 6
then makes
positive stems finite. Prove the finite-primary completion/localization
comparisons and absence of hidden infinite filtrations before assembling
the integral bound240. These generic ordinary operations/Adams inputs
precede the MSO/MSpin coefficient calculations and use no such tables. Retain the explicit matrices/differentials as reusable
low-stem algebra APIs and compare to the existing Toda/EHP normalization.

Construct the complex e-invariant of a torsion stable odd-sphere class
from its actual two-cell mapping cone, its reduced KU extension, the
normalized rational Chern character and independence of an integral lift.
Prove additivity, stable naturality and its target Q/Z; do not divide an
e-invariant equation by2 in Q/Z. For the actual real Bott generator
b in KO-degree8, compare4C's real J clutching map with the real/complex
bundle clutching and mapping-cone character calculation to compute
e_C(J_7(b))=+/-1/240, with its generator sign specified by that construction.
The primitive real comparison uses TopK's c(b)=u^4; the formula for a
complex J generator alone would concern its realification2b and cannot
determine this value by halving. Thus J_7(b) has order divisible by240.
Combine the upper bound with this actual class to prove
pi_7^S=Z/240 generated by J_7(b), J_7 surjective and ker(J_7)=240Z on
pi_7(SO)=Z with the corresponding Bott clutching generator.
Its finite-range headline `sphere_homotopyGroup_seventhStem` is
π_(n+7)(Sⁿ,x)≅ℤ/240 for every n≥9 and every basepoint x
(Toda, Chapter XIV, stable-stem table); n+7≤2n−2 is the Freudenthal bound.

### 9A.2 Exact image and Θ₇

*Needs:* 9A.1; 6A–6C, 7C and 8.2; TopologicalKTheory T7; CharacteristicClasses C6–C7; IndexTheory I7.2.

**Exact kernel realization and Theta7.** Extend8.2's framing-obstruction
sequence by its following actual J map and prove exactness at pi_7(SO):
pi_8^S -> A_8 -> pi_7(SO) -> pi_7^S. A punctured stable frame has
obstruction whose J class is zero; conversely a stable-J nullbordism,
through5's actual framed PT and6A/6B's defect/collar comparisons, constructs
the closed almost-framed8 representative with that specified obstruction.
This converse is the required realization of every240z, not only a
divisibility implication. Construct the actual top-cell relative KO
comparison for such a closed representative. Its lower Pontryagin
classes vanish and p2 number is+/-6 times its Bott obstruction, by
TopK complexification/CC Newton-character normalization. IndexTheory I7.2's
L₂ signature theorem gives sigma=+/-224z for obstruction240z.
Conversely exactness realizes obstruction240 and hence signature+/-224.
Under7C's actual P8=Z map sigma/8, the image of A8 is therefore EXACTLY
28Z. Use pi_6(SO)=0,8's A7=cokerJ7 and item1's surjectivity to get A7=0.
Then6C's geometric exactness P8->Theta7->A7 gives the actual group
isomorphism Theta7=Z/28, with the negative E8 boundary the class −1 under sigma/8 in
signature/8 coordinates. Retain all map/orientation/comparison witnesses;
this does not follow just from an order bound or a congruence.

### 9A.3 Eells–Kuiper and the quaternionic bundle

*Needs:* 9A.2; IndexTheory I7.2/I7.5; SpinGeometry G4; CharacteristicClasses C6–C7; Layer 1 for smooth recognition.

**Eells–Kuiper and an actual S3-bundle model.** For a smooth homotopy
seven-sphere the Spin structure is unique. Item2 supplies a parallelizable
filling, so a Spin filling exists. For any chosen Spin8 filling W define
mu=(<p1(W)^2,[W,boundary]>-4sigma(W))/896 in Q/Z. Use the actual
H4(W,boundary;Q)->H4(W;Q) isomorphism to define this rational relative
pairing. Prove independence by gluing the Spin fillings with their
unique boundary comparison. On a closed Spin8 manifold
(p1^2-4sigma)/896=(7p1^2-4p2)/5760=Ahat_2 is an integer, using
IndexTheory I7.2 and I7.5 with trivial twist. This is not a Spin
bordism coefficient calculation. For a parallelizable filling mu is
-sigma/224, so item2 identifies mu with the injective1/28-valued invariant
of the actual Theta7 group, with its orientation sign.

On the native quaternionic S3 and ordered real H4 carrier construct the
SO4 clutching map v->x^h v x^j, its actual sphere/disk bundles over S4,
and the Spin4 left/right-factor comparison. For h+j=1 prove the sphere
bundle is a simply connected integral homology7-sphere by the actual
bundle LES and Euler/Gysin sequence. Derive e=h+j and p1=2(h-j) from
the normalized two half-spin c2 classes, with the actual positive S4
generator and fibre orientation, not an arbitrary signed matrix convention.
Take h=2,j=-1. The disk bundle has intersection[1], sigma1 and relative
p1-square36, so mu=(36-4)/896=1/28. The negative E8 filling has p1=0,
sigma-8 and the same mu. Item2/this invariant's INJECTIVITY now gives
equality of the oriented homotopy-sphere classes. Construct the resulting
h-cobordism witness and apply1's actual smooth high-dimensional theorem
to obtain an orientation-preserving diffeomorphism of the two native
smooth boundaries. Numerical mu equality by itself is not that theorem.

Independently, remove two disjoint smooth7-disks from a homotopy7-sphere,
prove the remaining simply connected cylinder-end cobordism is an
h-cobordism and apply the dimension7 theorem to obtain the actual
twisted-double-disk diffeomorphism D7 union_g D7. Retain its boundary
parameterizations. If g extended over D7 the sphere would be standard,
contrary to the nonzero class; prove this implication by the actual gluing
map. The lower-dimensional or merely homology-sphere case is excluded.

### 9A.4 All-dimensional E₈ cap obstruction

*Needs:* 6B E₈ family; TopologicalKTheory T7; CharacteristicClasses C6–C7; IndexTheory I7.2; native Bernoulli 2-adic valuation.

**Every k>1 E8 boundary is nonstandard, without a full bP-order premise.**
Use6B's chosen actual plumbing frame. A hypothetical standard smooth
boundary identification caps P^(4k) by an actual D^(4k). Prove the tangent
restriction/collar and relative fundamental-class maps on the resulting
closed M, with sigma(M)=-8. The frame makes its reduced stable tangent
class relative to P. Identify KO(M,P) with KOtilde(S^(4k)) through the
actual collared pair/cofiber M/P and its degree-one collapse. All lower
p_i, i<k, vanish by the relative cohomology restriction isomorphisms.
TopK's geometric real Bott ring and c(a)=2u^2,c(b)=u^4 show p_k number
is an integer multiple of a_k(2k-1)!, with a_k=1 for even k and2 for odd k.
Prove this through the actual sphere Chern character and Newton identity;
an unnamed additive periodicity table does not suffice.

Using IndexTheory I7.2 to identify the geometric signature,
derive from CharacteristicClasses C7's regular formal x/tanhx sequence the indecomposable
L_k coefficient s_k=(-1)^(k-1)2^(2k)(2^(2k-1)-1)B_(2k)/(2k)! by formal
logarithmic differentiation, the Bernoulli generating identity and Newton
descent. Therefore sigma is an INTEGER multiple of
d_k=+/-a_k2^(2k-1)(2^(2k-1)-1)B_(2k)/k. For k=2 retain the direct
integral7p2=-360 contradiction. For k>=3 the actual native
Bernoulli.padicValRat_bernoulli at prime2 gives v2(B_(2k))=-1;
hence v2(d_k)=2k-2-v2(k)+v2(a_k)>=4 (check k3,k4 explicitly and use
v2(k)<=k-1 for k>=5). A nonzero integer multiple cannot equal-8, whose
valuation is3. Supply every nonzero/prime/positive-k hypothesis and retain
the source-independent signature/Bott arithmetic maps. This all-k proof
requires no unproved general order formula for bP_(4k); every original
stable J, almost-framed, surgery and Kervaire–Milnor target remains required
separately in its own scope.

The complex e-invariant has an API of integral-lift independence, additivity, suspension
naturality and the Bott/J comparison into ℚ/ℤ. The Eells–Kuiper invariant has a separate API:
relative Pontryagin pairing on a Spin filling, independence by closed Spin gluing, addition,
orientation reversal and compatibility with the Θ₇ coordinate.

**Checks for the e-invariant.**

- Changing a rational lift r by an integer m changes its class in ℚ/ℤ by 0, whereas a shift by 1/2 need not vanish.
- The value 1/240 has exact order 240; 240·(1/240)=1=0 in ℚ/ℤ and 120·(1/240)=1/2≠0.
- The equation 2x=1/120 has solutions 1/240 and 121/240 in ℚ/ℤ, so complex realification alone does not determine the primitive real J value.

**Checks for Eells–Kuiper and the bundle model.**

- On the negative E₈ filling, p₁²=0 and σ=−8 give μ=32/896=1/28; reversing orientation gives −1/28.
- The quaternionic clutching pair (h,j)=(2,−1) gives e=1, p₁=6, σ=1 and relative p₁²=36, hence μ=(36−4)/896=1/28. The pair (1,0) gives μ=(4−4)/896=0.
- For h+j=0 the Euler number is 0 and the Gysin sequence has a nonzero middle group, so that sphere bundle is not a homotopy seven-sphere. The assumption h+j=1 cannot be dropped.

The Θ₇ and E₈ comparison API includes actual filling, quotient and h-cobordism maps,
not only numerical cardinalities. These comparisons use IndexTheory's closed-manifold theorems;
the formal characteristic series alone cannot imply them.

### Examples

For Bott obstruction 240, p₂=±6·240=±1440; with p₁=0 the signature theorem gives
σ=7p₂/45=±224, and σ/8=±28. Exact realization, not divisibility alone, makes the
image exactly 28ℤ. For a hypothetical cap of the negative E₈ plumbing at k=2,
7p₂=45·(−8)=−360 has no integral solution, since −360≡4 mod 7.
For k=3, d₃=±992/63 has 2-adic valuation 5; for k=4, d₄=±2032/15 has valuation 4.
Any nonzero integer multiple has valuation at least 4 and cannot equal −8 of valuation 3.
The Bernoulli denominator computation uses k≥2, so B₂ and the k=1 boundary branch do not enter.

### Dependencies

*Needs:* TangentialBordism B4.1–2/B4.7 for Adams towers; DGFloer Layer 1 item 4 for
finite generation; GeneralizedCohomology G5 item 6 for rational vanishing; Sections 3A,
4C, 5, 6A–6C, 7C and 8 for the actual stable and filling maps; TopologicalKTheory T7
and CharacteristicClasses C6–C7 for Bott/characteristic normalization; IndexTheory I7.2
and I7.5 for signature and untwisted Spin index integrality. The order bound is
16·3·5=240, and rational rank 0 plus finite generation excludes a free summand.

## Layer 10: smooth recognition in dimension six

### 10.1 Orientation of a homotopy six-sphere

*Needs:* Native sphere simple connectivity; AlgebraicTopology top homology; DifferentialGeometry Layer 2.

Let `M` be a compact Hausdorff second-countable boundaryless smooth six-manifold and
`h : M ~=_h S^6`.  Use `h` to prove connectedness and simple connectivity and to transport a
chosen generator of top integral homology to an orientation of `M`.
This is the orientation/local-fundamental-class comparison from DifferentialGeometry
Layer 2 and AlgebraicTopology Stage 6, applied to H₆(M;ℤ)≅ℤ; it is not a separate
orientation theorem attributed to Milnor.

### 10.2 From the small code to h-cobordism

*Needs:* Layer 2 essential surjectivity and quotient induction; 9.7 Θ₆=0.

Apply the essential-surjectivity theorem of Stage 2 to choose a Type-0 finite-atlas code for
`M`.  Map it into the literal quotient by taking its class, prove independence of the
code, and regard the result as the oriented class of `M` in `Theta_6`.  From `Theta_6=0`,
construct an oriented h-cobordism from `M` to the standard sphere.
The finite-code realization and extraction of a quotient witness are adapters of 2.1
and 2.4. The classical relation is Kervaire–Milnor §2, pp.505–507; its conversion
to a diffeomorphism in 10.3 uses Milnor, Theorem 9.1, p.107.

### 10.3 Orientation-preserving diffeomorphism

*Needs:* Layer 1 product theorem in total dimension 7; 10.2; native coordinate reflection.

Apply Stage 1's six-dimensional-boundary case of the h-cobordism theorem to obtain a
diffeomorphism `e : M ~=_m S^6`.  Package orientation preservation as the equation saying that
`e.deriv` sends the chosen `Manifold.Orientation` on `M` to the standard orientation on `S^6`.
If the equation has the opposite sign, compose with a fixed coordinate reflection and prove
the derivative equation for the composite.

### 10.4 Direct recognition signatures

*Needs:* 10.1–3; the actual atlas-preservation predicate and explicit topology/manifold hypotheses.

State the direct reusable theorem with every topology, manifold, and orientation hypothesis
visible and return the subtype consisting of a diffeomorphism together with that derivative
equation (`smoothPoincareSix_oriented`).  State the un-oriented `Nonempty Diffeomorph` result
(`smoothPoincareSix`) only as a separate corollary obtained by forgetting the equation.

The atlas-preservation predicate has the following API: transport by identity preserves
an oriented atlas, composition preserves positive transition determinants, and reversing exactly
one orientation reverses the sign. The two recognition statements use this predicate on the
actual compact Hausdorff second-countable six-manifold and native sphere carriers.

**Checks.**

- The identity on S⁶ with the same oriented atlas has transition determinant sign +1.
- A coordinate reflection has degree −1 and derivative orientation sign −1, so it does not preserve the same orientation at both ends.
- Reversing the target orientation changes that sign to +1 for the reflection; for arbitrary chosen orientations the theorem can select either component of the diffeomorphism space.

### Examples

For the standard sphere the h-cobordism is its cylinder and recognition returns the identity
when orientations agree. If the initial map reverses orientations, composing with a reflection
multiplies signs (−1)(−1)=+1. A seven-dimensional half-space manifold has six-dimensional
smooth boundary by the pinned Tau Ceti theorem at differentiability order ∞≠0, but that
boundary theorem alone gives neither an h-cobordism nor a diffeomorphism to S⁶.

### Dependencies

*Needs:* Layer 2 small-code comparison; Layer 9 Θ₆=0; Layer 1's theorem in total dimension
7; DifferentialGeometry Layer 2's atlas/pointwise orientation comparison; native sphere
reflection. The statement is in every universe and keeps compactness, Hausdorffness,
second countability and smoothness explicitly.

## Downstream consumers

TopologicalKTheory T7 uses Layer 4B's real loop periodicity for its KO applications;
AlgebraicTopology Stage 4.5 uses the compact-generation comparison of 3A.1. The internal
classification applications use the following order, with the finite inputs of Layer 5
separated from the stable Bott comparison.

| Track | Depends on | Feeds |
| --- | --- | --- |
| 1 h-cobordism | geometric topology, DifferentialGeometry orientations/Sard, HF Morse data, algebraic topology | 2, 10 |
| 2 small skeleton and `Theta_n` | 1, triangulation, geometric connected sum | 6, 9--10 |
| 3 James/EHP/stable stems | algebraic topology, compactly generated substrate | 5, 8--9 |
| 3C.5 Hopf exclusion and sphere frames | 3A.2, AlgebraicTopology cup/cross/relative products, TopologicalKTheory T2.5/T3–T4, CharacteristicClasses C6.2–3/C7.3, SpinRepresentations L7 | standard-sphere parallelizability |
| 4 `SO`/`BSO`/Bott/`J` | 3A convenient substrate, TopologicalKTheory T1.5–T1.6 classifiers, bundles, Lie groups | 5--6, 8--9, TopologicalKTheory T7 |
| 5 smooth PT comparisons | TangentialBordism B1/B3.2/B5.2; StringOrientation S2.2–S2.3; 3A and 4A; 4C for the J action | 6, 8--9 |
| 6 `A_n`, `P_n`, exactness | 1--2, 4--5 | 7--9 |
| 7 Wall surgery | algebraic topology, geometric surgery, TangentialBordism B3.2 pure algebra, 4--6 | 8--9 |
| 8 stable comparison | 3--7 | 9 |
| 9 sixth-stem calculation | 3--8 | 10 |
| 9A seventh stem, Θ₇ and E₈ | 3–8; TangentialBordism B4; DGFloer 1.4; GeneralizedCohomology G5.6; TopologicalKTheory T7; CharacteristicClasses C6–C7; IndexTheory I7.2/I7.5 | seven-sphere classification and exotic E₈ boundaries |
| 10 smooth recognition | 1--2, 9 | endpoint |

Stages 1, 3, and 4 can begin independently against their cited foundations.  Stage 5 joins the
stable-homotopy and vector-bundle tracks.  The geometric `A_n`/`P_n` definitions and their
comparison with the historical Kervaire--Milnor models begin in Stage 6; the Wall comparison
occurs in Stage 7 after the obstruction groups and surgery theorem have been constructed.

## Worked examples

For a standard disc D⁷, the constant ambient frame induces the stable boundary frame
(t,a)↦t−ax on S⁶. Choosing collar width ε=1/2 gives endpoint radius 1/2 and normal
scale 1/2. The construction retains a seventh slot; it asserts no tangent frame of S⁶.

For the negative E₈ plumbing in dimension eight, determinant 1 and signature −8 give
obstruction −1 and μ=−(−8)/224=1/28. The quaternionic clutching pair (2,−1) gives
p₁²=36 and σ=1, hence the same μ=(36−4)/896=1/28. Section 9A.3 uses injectivity
of the invariant and an actual h-cobordism to turn that equality into a diffeomorphism.

For the sixth-sphere calculation the exact segment has left term 0 and right map the
identity on ℤ/2. Both the left image and right kernel are zero, giving Θ₆=0 and the
compact smooth recognition theorem of Layer 10.

## References

- John Milnor, [*Topology from the Differentiable Viewpoint*](https://www.ux1.eiu.edu/~cidelman/Classes/4855%20and%205220/Supplementary%20Texts/MilnorTopDiffVpt.pdf),
  §7, Theorems A–C, pp.43–44: compact finite-ambient framed correspondence.
- Michael Atiyah, [*Riemann surfaces and spin structures*](https://doi.org/10.24033/asens.1205),
  Annales scientifiques de l'École Normale Supérieure 4 (1971), §4, Proposition 4.1
  and Theorem 3′, p.58: Spin boundary criterion in the mod-two-index formulation.

- Stephen Smale, [*Generalized Poincare's Conjecture in Dimensions Greater Than
  Four*](https://doi.org/10.2307/1970239), Annals of Mathematics 74 (1961), 391--406.
- John Milnor, *Lectures on the h-Cobordism Theorem*, Princeton University Press, 1965.
- Michel Kervaire and John Milnor,
  [*Groups of Homotopy Spheres: I*](https://doi.org/10.2307/1970128), Annals of Mathematics
  77 (1963), 504--537.
- Allen Hatcher, [*Algebraic Topology*](https://pi.math.cornell.edu/~hatcher/AT/AT.pdf),
  2002, §4.2, p.387 and Exercise 39, p.392 (Toda brackets); §4.J, pp.474–475
  (integral metastable EHP), Corollary 4J.4, p.474 (the first sphere stem).
- I. M. James, *Reduced Product Spaces*, Annals of Mathematics 62 (1955), 170--197.
- Norman Steenrod, [*A Convenient Category of Topological
  Spaces*](https://doi.org/10.1307/mmj/1028999711), Michigan Mathematical Journal 14 (1967),
  133--152.
- Lev Pontryagin, *Smooth Manifolds and Their Applications in Homotopy Theory*, American
  Mathematical Society Translations, Series 2, 11 (1959), 1--114, Chapter II §§1--4.
- René Thom, [*Quelques propriétés globales des variétés
  différentiables*](https://doi.org/10.1007/BF02566923), Commentarii Mathematici Helvetici 28
  (1954), 17--86, Chapters I--II.
- George W. Whitehead, *Elements of Homotopy Theory*, Springer GTM 61, 1978.
- Hirosi Toda, *Composition Methods in Homotopy Groups of Spheres*, Princeton University Press,
  1962, Chapters I--V.
- Raoul Bott, [*The Stable Homotopy of the Classical
  Groups*](https://doi.org/10.2307/1970106), Annals of Mathematics 70 (1959), 313--337.
- Norman Steenrod, *The Topology of Fibre Bundles*, Princeton University Press, 1951, and Dale
  Husemoller, *Fibre Bundles*, 3rd ed., Springer GTM 20, 1994.
- Morris Hirsch, *Differential Topology*, Springer GTM 33, 1976, and Antoni Kosinski,
  *Differential Manifolds*, Academic Press, 1993.
- C. T. C. Wall, *Surgery on Compact Manifolds*, 2nd ed., AMS, 1999, Theorems 5.6, 5.8, 6.4, 6.5 and 13A.1, pp.50, 54, 68–69, 172.
- William Browder, [*The Kervaire Invariant of Framed Manifolds and its
  Generalization*](https://doi.org/10.2307/1970686), Annals of Mathematics 90 (1969), 157--186.

- Victor Snaith, [*The Arf–Kervaire invariant of framed manifolds*](https://arxiv.org/abs/1001.4751),
  Definition 3.1 and §3.1 for compact-source collapse, and Example 8.3 for the Arf-one product.
  Stage 9 additionally proves that its chosen product framing represents the normalized `ν²`.

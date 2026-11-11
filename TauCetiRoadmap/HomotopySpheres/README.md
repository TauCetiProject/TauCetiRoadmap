# Roadmap: high-dimensional differential topology and homotopy spheres

**Summary.** This roadmap develops the reusable smooth topology behind the Kervaire--Milnor groups of
homotopy spheres.  It constructs the simply connected smooth h-cobordism theorem, stable
homotopy groups of spheres, real Bott periodicity, smooth framing applications of stable
oriented bundle classification,
framed bordism and Pontryagin--Thom, surgery obstruction groups, and a geometric exact sequence for homotopy spheres.  The first complete low-dimensional calculation is `Theta_6 = 0`, followed by the
direct smooth recognition theorem for compact smooth homotopy six-spheres.

Every object is geometric or functorial.  `Theta_n` is formed from oriented smooth homotopy
spheres and h-cobordisms; convenient models for `A_n` and `P_n` arise from almost-framed cycles
and stably framed fillings. The comparison with Kervaire–Milnor identifies the classical
boundary subgroup and quotient embedding. The comparison with Wall identifies the geometric
filling groups with surgery obstruction groups.  Exactness is proved map by map.  No record is permitted to carry the desired group
calculations or exactness as input fields.

Suggested homes are `TauCeti/Geometry/Manifold/HCobordism/`,
`TauCeti/Geometry/Manifold/HomotopySphere/`, `TauCeti/AlgebraicTopology/StableHomotopy/`,
`TauCeti/AlgebraicTopology/FramedBordism/`, `TauCeti/Geometry/Manifold/VectorBundle/Framing/`, and
`TauCeti/Geometry/Manifold/Surgery/Obstruction/`.

## Scope and ownership

The roadmap is complete when Tau Ceti proves the following connected development.

1. The shared collared-cobordism and handle APIs support Morse handle decompositions, Whitney
   moves, cancellation, and the simply connected smooth h-cobordism theorem in cobordism
   dimension at least six.
2. A Type-0 finite-atlas and handle code gives a small skeleton of compact Hausdorff
   second-countable smooth manifolds. Every such manifold in an arbitrary universe has a coded realization
   diffeomorphic to it, and changing the code does not change any geometric quotient class.
3. Oriented smooth homotopy `n`-spheres form the geometric group `Theta_n` for every `n` under
   connected sum (Kervaire–Milnor, Theorem 1.1, p. 504). Orientation reversal gives the inverse,
   and equality is oriented diffeomorphism for `n ≥ 5`.
4. Stable sphere homotopy groups are constructed from suspension in compactly generated spaces.
   The James construction,
   Freudenthal theorem, EHP sequence, composition, and Toda brackets provide a reproducible
   calculation route rather than a table oracle.
5. Stable `O`/`SO`, their loop comparison with the shared `BSO`, real Bott periodicity and
   stable `J` are constructed in one convenient category. TopologicalKTheory T1.5–T1.6 supplies
   the fixed-rank/stable classifiers and bundle classification. This roadmap supplies their
   clutching, smoothing and tangent/normal framing comparisons.
6. The supplied framed Pontryagin–Thom isomorphism is compared with the tangent and normal
   framing models used here. Its collapse factors through `Th(nu) ~= Sigma^k M_+` before
   augmentation to `S^k`; the comparisons give the product, boundary and framing-change laws.
7. Almost-framed bordism and the geometric filling groups form an exact sequence with
   `Theta_n`. The filling groups agree with Wall’s simply connected obstruction groups in the
   specified dimension ranges.
8. The complete chain through the sixth stable stem proves
   `pi_6^S ~= Z/2{nu^2}`, computes its Kervaire invariant, and combines this with the
   geometric exact sequence to prove `Theta_6 = 0`.
9. A compact Hausdorff second-countable smooth six-manifold homotopy equivalent to the standard
   sphere has an orientation-preserving diffeomorphism to it after matching orientations, with
   the manifold orientations and derivative-preservation equation visible in the theorem.

This roadmap concerns smooth manifolds of dimension at least five and the stable topology used
to classify their homotopy spheres.  Low-dimensional Poincare theorems, general non-simply-
connected surgery, pseudo-isotopy, and a calculation of every `Theta_n` are outside its stated
endpoint.

## Exact supplier contracts

### From Mathlib

Use native manifolds and smooth maps, `exists_embedding_euclidean_of_compact`, metric spheres,
based cubes and homotopy groups, matrix orthogonal groups, `QuadraticMap` and its isometry
equivalences, and the `CompactlyGenerated` carrier and `GeneratedByTopCat.adj`.

### From Tau Ceti

Use boundary charts and the manifold structure on the intrinsic boundary from
`TauCeti.Geometry.Manifold.Boundary.Charts`. Use oriented atlases, their covering and chart
compatibility laws, and the orientation-preserving groupoid from
`TauCeti.Geometry.Manifold.Orientation.OrientedAtlas`.

### From TauCetiRoadmap.AlgebraicTopology

Use relative homology, excision, cellular comparison, Poincaré duality, Hurewicz, Whitehead,
van Kampen and finite CW type. In particular, use `relativeHurewicz`, `homologicalWhitehead`,
`poincareDualityMap_isIso` and `compactManifoldFiniteCWType`. Use §4.8 for compact generation,
pointed products and exponentials, smash, suspension, loop adjunction and CW comparisons.
[AlgebraicTopology](../AlgebraicTopology/README.md)

### From TauCetiRoadmap.GeometricTopology

Use boundary and corner constructions, collars, gluing, tubular neighbourhoods, connected
sum, elementary handle attachment, geometric surgery and triangulation. Use §1.2 for embedded
ball complements with their intrinsic boundary identification and radial collar, and §4.3.1
for the finite nonsingular quadratic Arf algebra. Own the oriented cobordism carrier, boundary
orientation law, defect-tube faces, handle calculus and h-cobordism theorem here.
[GeometricTopology](../GeometricTopology/README.md)

### From TauCetiRoadmap.DifferentialGeometry

Use Layers 2 and 10 for source-indexed manifold orientations, reversal, orientation at a point,
derivative preservation, Sard and degree. Apply the orientation API to collars and their
outward normal. [DifferentialGeometry](../DifferentialGeometry/README.md)

### From TauCetiRoadmap.HeegaardFloer

Use Lanes M/F0 for the distinct trajectory and Morse–Smale inputs to the handle comparison.
[HeegaardFloer](../HeegaardFloer/README.md)

### From TauCetiRoadmap.UniversalCovers

Use basepoint change, covering maps and their maps on homotopy groups in the connected
James comparison. [UniversalCovers](../../Completed/UniversalCovers/README.md)

### From TauCetiRoadmap.TopologicalKTheory

Use T1.5–T1.6 for finite Grassmannians, fixed-rank and stable `BO` and `BSO`, their universal
bundle diagrams and finite-CW/numerable classification with the positive-rank and signed
rank-zero qualifications. Supply comparisons on universal bundles, basepoints, stabilization
and clutching maps for each alternative homogeneous model used here. T7 consumes the Bott
comparison for real KO and ABS. [TopologicalKTheory](../TopologicalKTheory/README.md)

### From TauCetiRoadmap.CharacteristicClasses

Use C1.1a for the finite oriented cover behind the classifier and C2.0 for the pointed Thom
model, including rank zero. [CharacteristicClasses](../CharacteristicClasses/README.md)

### From TauCetiRoadmap.SpinRepresentations

Use SpinRepresentations Layer 7 for the algebraic eightfold Clifford periodicity and the
Clifford-module comparison with the topological Bott maps.
[SpinRepresentations](../RepresentationTheory/SpinRepresentations/README.md)

### From TauCetiRoadmap.RiemannianGeometry

Use R1–R3 for invariant and normal-homogeneous metrics, Jacobi fields, broken-geodesic
manifolds, energy-band compactness and the path-space comparisons.
[RiemannianGeometry](../RiemannianGeometry/README.md)

### From TauCetiRoadmap.MorseTheory

Use M5 for the finite-dimensional Morse–Bott normal Hessian and negative-bundle attachment.
Compute the Bott-specific Hessians, indices, nullities and actual negative bundles here.
[MorseTheory](../MorseTheory/README.md)

### From TauCetiRoadmap.GeneralizedCohomology

Use G4 item 2 for the Thom suspension, rank-zero and compact-base one-point compactification
comparisons. [GeneralizedCohomology](../GeneralizedCohomology/README.md)

### From TauCetiRoadmap.TangentialBordism

Use B5.2 for the finite-rank collapse and regular-value inverse and B5.5 for the stable
framed Pontryagin–Thom map. [TangentialBordism](../TangentialBordism/README.md)

### From TauCetiRoadmap.StringOrientation

Use S2.3 for the stable isomorphism `Ω_n^fr ≅ π_n^S`. The framing, boundary and product
comparison formulas used in this roadmap are specified in §5.1.
[StringOrientation](../StringOrientation/README.md)

### From TauCetiRoadmap.IntegralLattices

Use 1I for the divisibility of the signature by eight and 6A for the indefinite
classification of even unimodular integral lattices.
[IntegralLattices](../IntegralLattices/README.md)

## Conventions

These choices apply throughout the development.

- **Manifolds are types with Mathlib instances.**  Use `TopologicalSpace`, separation and
  countability classes, `ChartedSpace`, `IsManifold`, compactness, and connectedness.  Carry
  orientation and framing data explicitly.  An orientation is the shared
  `Manifold.Orientation I M ι`, including its local chart compatibility; an arbitrary function
  from points to linear orientations is not an orientation.  Do not introduce a bundled manifold
  record whose fields assert these properties.  On a collared manifold, the boundary orientation
  is determined from the ambient orientation by the collar derivative and the outward-normal-first
  convention; an unrelated orientation on the boundary carrier is insufficient.
- **Geometric quotients use a small skeleton.**  A finite smooth atlas code consists of finitely many
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
  classifying spaces, and their filtered colimits are formed there.  Use AlgebraicTopology §4.8’s comparisons with ordinary spaces and its
  limit and colimit formulas. For the stable group colimits prove the specific comparisons
  with the colimits of underlying spaces.
- **Dimensions are explicit.**  A smooth h-cobordism of boundary dimension `n` has total
  dimension `n+1`.  The simply connected theorem assumes total dimension at least six.  Every
  cancellation lemma states the handle indices, ambient level dimension, and codimension
  inequalities it needs.
- **`Theta_n` is geometric.**  A cycle is an oriented closed smooth manifold equipped with a
  homotopy equivalence to the standard `S^n`; the marking is used to prove the sphere condition,
  not retained as extra moduli.  The relation is oriented h-cobordism on the shared cobordism
  carrier. Connected sum gives the group in every dimension. The oriented diffeomorphism
  comparison uses `n ≥ 5`.
- **Stable groups are colimits of standard groups.**  Sphere stabilization is induced by
  suspension; stable `SO` is induced by block inclusion.  Both are literal colimits with
  canonical inclusions and their universal properties.  Transition maps, stable-range
  comparisons, products, and `J` commute by proved diagrams.  A family of abstract groups with
  the expected values is not an implementation.
- **Use the shared classifiers for stable bundles.** `BSO` is TopologicalKTheory T1.6's
  stable oriented Grassmannian with its universal bundle diagram. A principal-`SO` or other
  homogeneous model has a named comparison with that classifier and its actual bundle maps.
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
  `S² -> R³` is a regression example, without assuming that `TS²` is trivial. General embeddings do not
  supply a trivial normal line. Boundary restrictions use the collar's outward normal.
  Define the normal-first permutation by sending `(v,s)` to the vector with coordinate
  zero equal to `s` and successor coordinates those of `v`. In codimension-one restriction
  the normal vector `(0,1)` of the splitting goes to the first added coordinate. Prove that
  reversal negates that coordinate and fixes the others, and check the boundary formula
  `(t+sν,a) ↦ (s,f(t−aν))` for the collar-normalized ambient frame.
- **Stable and honest framings remain distinct.**  A cycle carrying only a trivialization after
  adding trivial summands is called stably framed or s-parallelizable. An honestly parallelizable
  filling requires an actual tangent frame from absolute lifting and its collar-normalized stabilization comparison, including the returned proper
  subcollar, moving boundary path and positive normal-rescaling transport.
- **Product near a boundary carries a proper width.** Every collar product witness returns
  `0 < ε < 1` and equality on total-bundle vectors based at `s < ε` in the supplied collar.
  This convention applies to fillings, cobordism faces and defect exteriors. Shrinking uses a
  common smaller width and preserves the boundary frame. Reparametrization additionally
  transports the normal line by its positive derivative factor.
- **Pontryagin–Thom uses the shared collapse and inverse.** The collapse uses a chosen tubular
  neighbourhood and a normal framing. Consume TangentialBordism’s regular-value construction
  and StringOrientation’s stable inverse laws. Compare those constructions with the explicit
  normal-coordinate and tangent-framing formulas below.  Collapse and Thom-space augmentation are continuous
  pointed maps with the collapsed complement and sphere basepoints displayed.  Pointed convenient
  spaces and maps use the under-category of `CompactlyGenerated`, the normal rank `k` is the
  codimension of the displayed embedding `M -> R^(n+k)`, the collapse is the map determined by the
  displayed tubular diffeomorphism, and the augmentation is the pointed Thom equivalence followed
  by the standard suspended augmentation.  Arbitrary maps satisfying only continuity and a
  basepoint equation are insufficient.
- **Every quotient relation has geometric witnesses.**  H-cobordism, framed bordism,
  almost-framed bordism, the stable-filling relation, and the top-cell and honestly parallelizable comparison relations are
  `Nonempty` types of the specified collared cobordisms and compatible bundle data.  A named
  `Prop` with an unspecified body, or an unconstrained `Setoid`, does not define one of these
  quotients.
- **Exactness is expressed by maps.**  Define each homomorphism in §6.3,
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

## How to read the build

Layers 1–2 establish the geometric sphere quotient, §§3.1–3.3 develop stable sphere homotopy,
and Layer 4 uses TopologicalKTheory T1.5–T1.6 before supplying Bott comparisons to its T7.
Layer 5 joins the stable homotopy and framing branches. Layers 6–8 define the geometric maps,
compute the Wall groups and compare with stable homotopy. Layers 9–10 compute the sixth stem
and apply the resulting sphere classification to smooth recognition.

## Layer 1: h-cobordisms and the high-dimensional theorem

This layer consumes geometric topology, DifferentialGeometry orientations/Sard, and the
Heegaard-Floer trajectory and Morse–Smale foundations.

### 1.1 Collared oriented cobordisms and discs

On the supplied manifold, gluing and orientation carriers, define a compact oriented
collared manifold with boundary. Its boundary identification is a diffeomorphism onto the
intrinsic boundary. Equip it with a collar diffeomorphism from the half-open product
`[0,1) × ∂W` to an open neighbourhood of that boundary in the manifold, with the
outward-normal-first orientation law for its derivative. Allow empty and disconnected
manifolds and boundaries. Construct incoming and outgoing boundary identifications,
reversal, product cylinders and gluing with the induced orientation equations.

Use GeometricTopology §1.2’s closed exterior of a standard embedded ball, with its smooth
boundary identification and exterior radial collar. Prove the induced exterior orientation
law. For an embedded defect tube specify the lateral exterior collar, including its
restrictions to the endpoint discs.

Define an h-cobordism by requiring both boundary inclusions to be homotopy equivalences.

**API.**

- Construct product, reversal and gluing of collared cobordisms with the induced boundary
  identifications and outward-normal-first orientation equations.
- Prove invariance of the two inclusion equivalences under equivalence, reversal, composition
  and boundary connected sum.
- Use cylinders, reversal and gluing to prove that oriented h-cobordism is an equivalence relation.

*Needs:* GeometricTopology §§1.1–1.2 and DifferentialGeometry Layer 2.

### 1.2 Morse handles

From Morse functions on a compact cobordism, build a finite ordered handle decomposition.
Prove reordering for disjoint critical levels, creation and cancellation of a cancelling
pair, and the effect of a handle slide on attaching spheres, belt spheres and their
intersection matrix (Milnor, §3, Theorem 5.4 and §7).

*Needs:* §1.1, GeometricTopology’s elementary handle attachment and HeegaardFloer M/F0.

### 1.3 Handle trading

In a simply connected h-cobordism of boundary dimension `n ≥ 5`, remove indices
`0,1,n,n+1`. Use vanishing relative homology and simple connectivity to reduce the remaining
boundary operators and realize the elementary row and column operations by handle slides
(Milnor, proof of Theorem 9.1, p. 107).

*Needs:* §§1.1–1.2, AlgebraicTopology’s relative homology and Hurewicz theorem.

### 1.4 Local Whitney move

Given a framed Whitney disc for a pair of transverse intersections of opposite sign, with
interior disjoint from both submanifolds, construct the ambient isotopy that removes the pair.
Prove the support, smoothness and framing laws of the local move (Milnor, proof of Theorem 6.6).

*Needs:* GeometricTopology’s tubular neighbourhoods and DifferentialGeometry’s orientations.

### 1.5 Whitney discs in codimension at least three

For complementary submanifolds of dimensions `p,q ≥ 3` in a simply connected level, construct
framed Whitney discs. Establish the complement-connectivity and general-position lemmas
giving interiors disjoint from both submanifolds (Milnor, Theorem 6.6, p. 71).

*Needs:* §1.4, GeometricTopology’s general position and AlgebraicTopology’s fundamental group.

### 1.6 Index-two/index-three cancellation

For total cobordism dimension `d ≥ 6` the level has dimension `d−1` and the complementary
spheres have dimensions `(2,d−3)`. For the attaching and belt spheres, use the trajectory
diffeomorphism `V₀ ∖ S_L ≅ V ∖ S_R` and the attaching circle’s codimension `d−2 ≥ 4` to show
`π₁(V ∖ S_R) = 1` (Milnor, proof of Theorem 6.4, pp. 72–73). Apply the complement
fundamental-group clause of the Whitney move (Theorem 6.6, p. 71).

*Needs:* §§1.2–1.4 and HeegaardFloer M/F0 for the trajectory comparison.

### 1.7 The simply connected product theorem

Cancel adjacent handles and obtain a diffeomorphism from the incoming end times the closed
unit interval to the cobordism, relative to the incoming inclusion. Deduce the oriented
diffeomorphism of the ends. The signature `exists_diffeomorph_prod_Icc_of_hCobordism`
uses the intrinsic boundary and a clopen incoming part, with the two inclusion homotopy
equivalences. The product theorem and smooth Poincaré application are Milnor’s Theorems
9.1 and 9.2 (pp. 107–108).

*Needs:* §§1.1–1.6 and AlgebraicTopology’s relative homology and Whitehead theorem.

### Examples

**Checks.**

- The incoming boundary of an oriented product cylinder has the opposite induced orientation
  and its relative product diffeomorphism is the identity.
- The empty boundary has the empty collar, and the standard disc exterior in a sphere has the
  hemisphere’s radial collar with the opposite orientation on the shared boundary.
- Index-two/index-three cancellation uses sphere dimensions `(2,3)` in total dimension six
  and `(2,4)` in total dimension seven.

### Dependencies

GeometricTopology, DifferentialGeometry Layer 2, HeegaardFloer M/F0 and AlgebraicTopology.

## Layer 2: oriented homotopy spheres and `Theta_n`

### 2.1 Oriented homotopy spheres and their group

1. Build the finite-atlas/handle skeleton fixed above and its realization functor.  Define an
   oriented smooth homotopy `n`-sphere code as a coded closed oriented smooth `n`-manifold with
   a homotopy equivalence to Mathlib's standard metric sphere.  Prove essential surjectivity for
   the compact Hausdorff second-countable manifolds above in arbitrary universes, code-change
   invariance, compactness, connectedness, simple
   connectivity for `n>=2`, integral homology, and finite CW type from the cited dependencies.
2. Instantiate geometric topology's connected sum on homotopy spheres.  Prove closure and descend
   its existing choice-independence, associativity, commutativity, sphere identity, and
   orientation laws to h-cobordism classes.
3. Construct the inverse cobordism: start from the punctured cylinder on `Sigma`, attach the
   standard connecting handle, and prove its outgoing boundary is
   `Sigma # (-Sigma)` while the incoming boundary is the standard sphere.  Orientation reversal
   alone is not the inverse proof.
4. Define `Theta_n` as the Type-0 quotient of coded oriented homotopy spheres by the geometric
   h-cobordism relation and give it the abelian group structure under connected sum of Kervaire–Milnor, Thm. 1.1.  Supply the quotient
   constructor, induction principle, and lift theorem.  Prove that equality in `Theta_n` is
   equivalent to oriented diffeomorphism for `n ≥ 5` by Layer 1 and that the class assigned to
   an arbitrary-universe manifold is independent of its small code.

**API.**

- Construct the class of an oriented homotopy sphere in any universe and lift functions or
  homomorphisms constant on the displayed h-cobordism relation.
- Identify the class of a connected sum with the sum of the two classes and the class of
  the reversed sphere with the additive inverse.
- For `n ≥ 5`, identify equality of classes with existence of an oriented diffeomorphism.

Kervaire–Milnor, *Groups of Homotopy Spheres I*, Theorem 1.1 and Lemmas 2.1–2.4 (pp. 504–507)
give the group, connected-sum operation and inverse cobordism.

*Needs:* Layer 1, GeometricTopology and smooth triangulation.

### Examples

**Checks.**

- Connected sum is the group operation on h-cobordism classes in dimensions three and four.
- The standard sphere represents zero.
- The punctured-cylinder construction exhibits `Σ # (−Σ)` as zero.

### Dependencies

Layer 1, GeometricTopology and smooth triangulation.

## Layer 3: stable sphere homotopy, the James construction, and EHP

### 3.1 Pointed constructions and stabilization

1. Use AlgebraicTopology §4.8 for the coreflection on `CompactlyGenerated`, the product
   `k(X × Y)`, compact-open exponentials followed by `k`, the exponential homeomorphism,
   smash, reduced suspension, the suspension–loop adjunction and the CW comparisons.
   The ordinary compact-open comparison for a Hausdorff outer source and locally compact
   Hausdorff inner source is Hatcher, Proposition A.16 (p. 531).
2. Construct pointed mapping cones and cofiber and Puppe sequences in that category, and
   identify the connecting maps with the suspension–loop adjunction.
3. Define suspension homomorphisms on sphere homotopy groups and the stable stem as their
   sequential colimit in `AddCommGrpCat`.  Export its structure maps and universal property.
   Prove functoriality, composition products, graded-commutativity in the stable range, and
   independence of the starting representative.
4. Prove Freudenthal: for `n>=2`, suspension
   `pi_q(S^n) -> pi_(q+1)(S^(n+1))` is an isomorphism for `q<=2*n-2` and a surjection for
   `q=2*n-1`.  Deduce that the `k`th stem is represented by `pi_(n+k)(S^n)` for `n>=k+2`
   (Hatcher, Corollary 4.24, p. 360).

**API.**

- Define the structure maps of the suspension colimit and the unique homomorphism extending any compatible family.
- Identify stable products and transport them through the finite-range suspension isomorphisms.

*Needs:* AlgebraicTopology §4.8 and its relative homotopy and CW foundations.

### 3.2 James construction proof spine

1. Define the reduced product `J X` as finite words in a connected well-pointed CW complex modulo deletion of the
   basepoint.  Define its word-length filtration `J_0 X subset J_1 X subset ...`, multiplication,
   unit `X -> J X`, functoriality, and compatibility with CW structures.
2. Identify each filtration quotient `J_r X / J_(r-1) X` with the `r`-fold smash power of `X`.
   Prove the attaching and connectivity estimates needed for passage to the union.
3. Construct the James map `J X -> Omega Sigma X` by concatenating the adjoints of suspended
   letters and prove multiplicativity up to homotopy. State the Bott–Samelson tensor-algebra
   calculation over a field, or over a commutative coefficient ring when the reduced homology
   of `X` is free over that ring. For arbitrary integral coefficients use the chain-level
   filtration and smash-power homology with its Künneth/Tor terms. Prove compatibility with
   the James map; connectedness alone does not remove these terms.
4. Prove the James theorem for connected well-pointed CW complexes. A comparison on more
   general connected spaces requires a derived construction and a comparison with their
   based CW replacements.  Compute
   `pi_1(J X) -> pi_1(Omega Sigma X)`, construct the induced map of universal covers, and lift
   the word filtration to prove an integral homology isomorphism on those covers.  Apply the
   algebraic-topology roadmap's simply connected homological Whitehead theorem upstairs, then
   descend the equivariant homotopy inverse to obtain `J X ~=_h Omega Sigma X`.  Equivalently,
   one may prove the same argument through Whitehead with local coefficients, but ordinary
   homology alone is insufficient.  Include `X = S^1`, where both fundamental groups are
   `Z`, as a regression theorem.  This connected theorem supplies the low-dimensional EHP
   sequence. Also check `X = M(ℤ/2,2)`: the smash square contributes
   `Ĥ₅(X ∧ X;ℤ) ≅ Tor₁(ℤ/2,ℤ/2) ≅ ℤ/2`; the James stable splitting retains that
   summand, whereas the unqualified tensor algebra on reduced integral homology misses it.
5. Construct the James--Hopf map by sending a word to the ordered products of its length-two
   subwords.  Identify its adjoint on spheres and prove the fibre/connectivity statement needed
   for the EHP range.

James, [*Reduced Product Spaces*](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/jamesred.pdf),
Theorems 1.11 and 1.12 give the original reduced-product multiplication and integral homology
calculation; Theorem 5.6 gives the homotopy comparison for his special complexes.

**API.**

- Give the filtration inclusions, word multiplication and the smash-power quotient maps.
- Compare the James and James–Hopf maps with their adjoints and compute their actions on the filtration.

*Needs:* §3.1, AlgebraicTopology’s homological Whitehead and Künneth comparisons, and UniversalCovers.

### 3.3 EHP and secondary composition

1. For spheres, define `E` as suspension, `H` from the James--Hopf map, and `P` from the relevant
   Whitehead product.  Prove the fibre sequence in its valid range and derive the natural long
   exact EHP sequence with all degree shifts written explicitly.
2. Prove compatibility of `E`, `H`, and `P` with suspension, composition, negation, and the pinned
   Whitehead-product sign.  Calculate the Hopf invariant of the classical Hopf maps.
3. Define three-fold Toda brackets only when the adjacent composites are null.  Record their
   indeterminacy as the sum of the two composition subgroups; prove naturality, suspension, and
   the composition identities used in low stems.
4. Prove the Barratt--Toda formula relating Whitehead products to `P`, `E`, and `H`.  This makes
   each low-stem EHP differential a theorem rather than a lookup.

Whitehead, *Elements of Homotopy Theory*, Chapter X, and Toda, *Composition Methods in
Homotopy Groups of Spheres*, supply the Whitehead-product, EHP and secondary-composition
comparisons.

*Needs:* §§3.1–3.2, AlgebraicTopology’s relative homotopy and UniversalCovers.

### Examples

**Checks.**

- In the ordinary compact-open comparison take `X = ℚ` and `Y = [0,1]`.
- The circle’s James map induces `ℤ ≅ π₂(S²)` on fundamental groups; the integral homology
  of the Moore space smash square retains its degree-five Tor term.
- For `π₁₄(S⁸)` the suspension index satisfies `14 ≤ 2 · 8 − 2`.

### Dependencies

AlgebraicTopology, UniversalCovers and Mathlib compactly generated spaces.

## Layer 4: stable `SO`, `BSO`, vector bundles, Bott periodicity, and `J`

### 4.1 Stable orthogonal groups and classifying spaces

1. Define `O(r)` and `SO(r)` from Mathlib's matrix groups, their block inclusions into rank
   `r+1`, and stable `O` and `SO` as filtered colimits of topological groups internal to the
   compactly generated category.  Export the inclusions and colimit universal properties and
   compare their underlying spaces with the corresponding compactly generated colimits.  Use the
   sphere fibration `SO(r) -> SO(r+1) -> S^r` to prove the finite-to-stable comparison range on
   homotopy groups.
2. Import the fixed-rank and stable oriented Grassmannians and universal bundle diagrams
   from TopologicalKTheory T1.5–T1.6, using the positive-rank finite oriented cover of
   CharacteristicClasses C1.1a. Use its stabilization maps and chosen basepoints. Construct
   `Omega BSO ~=_h SO` for that shared `BSO` in the pointed convenient category. Compare
   any auxiliary principal/homogeneous model by named maps preserving universal bundles,
   basepoints, stabilization and the induced clutching maps.
3. Consume T1.6's mutually inverse classification maps over finite CW bases and its numerable
   classification over paracompact Hausdorff bases, with the stated rank qualifications.
   Retain oriented isomorphisms and the supplier's separate signed rank-zero datum.
   Apply the pullback, Whitney-sum and homotopy-invariance laws to smooth tangent/normal
   bundles. Construct the smoothing comparisons between continuous bundle trivializations
   and smooth stable framings, including homotopies and collar-relative variants in their
   explicit ranges; do not define a second stable bundle classifier.
4. Prove that the classifying map is null exactly when a chosen stabilization is trivializable.
   Express this as existence of a stable framing and retain the chosen trivialization as data.
5. Prove `BSO` simply connected.  For `n>=2`, compare pointed and unpointed classes from `S^n`
   and construct the clutching equivalences
   `[S^n,BSO]_* ~= pi_n(BSO) ~= pi_(n-1)(SO)`.

Steenrod, *The Topology of Fibre Bundles*, §§5–7 and 12, and Husemoller, *Fibre
Bundles*, Chapters 3--4 and 8--9, supply the universal-bundle and clutching proof spine.

**API.**

- Give the colimit inclusions from the orthogonal matrix groups and the induced homotopy-group maps.
- Compare clutching, classifying-map pullback and smooth stable trivializations.

*Needs:* §3.1, CharacteristicClasses C1.1a and TopologicalKTheory T1.5–T1.6.

### 4.2 Full real Bott proof spine

1. Construct the stable homogeneous-space comparisons and fibrations in the real Bott chain
   `BO x Z, O, O/U, U/Sp, BSp x Z, Sp, Sp/U, U/O`, using TopologicalKTheory's shared `BO`
   for the first term. A distinct homogeneous `BO` model must be compared with that carrier
   and its universal bundle and stabilization maps. Identify base components and prove that
   the finite-dimensional inclusions induce equivalences in increasing connectivity ranges.
2. Consume RiemannianGeometry R1's bi-invariant and normal-homogeneous metrics,
   submersion and curvature formulas, and R2's Jacobi-field and exponential-derivative API.
   Specify the invariant products and normalization on each compact classical group and
   symmetric space in the Bott chain. Identify geodesics, endpoint conditions, Jacobi fields
   and conjugate points, and prove compatibility with inclusions in matrix rank.
3. Consume R3's single broken-geodesic manifold for the chosen metric, its deformation
   comparison with energy sublevels in the actual compactly generated path space, and
   compact-family capture. Prove compatibility with the finite-dimensional rank inclusions
   on these instances, including subdivision and cutoff maps.
4. Consume MorseTheory M5's finite-dimensional Morse–Bott normal-Hessian and negative-bundle
   attachment theorem. For each critical manifold of the symmetric-space broken-geodesic
   energy, calculate normal Hessian, index and nullity from item 2's Jacobi fields. Prove
   normal nondegeneracy and identify the actual negative normal disc and sphere bundles.
5. Consume R3's compact-energy-band verification and prove the Bott-specific deformation
   hypotheses between critical values. Apply M5 to attach the calculated negative disc
   bundles. Prove compatibility as subdivision and matrix rank increase; no
   infinite-dimensional Palais–Smale assertion replaces these finite comparison theorems.
6. Derive the increasing-connectivity estimate for the inclusion of minimal geodesics.  State
   the index lower bound as an explicit function of matrix rank and show that all other critical
   attachments occur above that range.
7. Pass through the stable-range comparison and obtain the seven loop equivalences
   `Omega R_i ~= R_(i+1)` and the closing equivalence `Omega R_7 ~= R_0`, with components
   specified.  Compose them to prove eightfold real Bott periodicity. The finite-rank signature
   `nonempty_realBottPeriodicity` uses `0 < i`, `i + 2 ≤ n` and `i + 10 ≤ N` for
   the groups in degrees `i` and `i + 8` of `SO(n)` and `SO(N)`.
8. Derive the stable homotopy table of `O` and `SO`, not merely its two desired entries.  Check
   `pi_0(O)=Z/2`, `pi_1(SO)=Z/2`, `pi_2(SO)=0`, `pi_3(SO)=Z`,
   `pi_4(SO)=pi_5(SO)=pi_6(SO)=0`, and `pi_7(SO)=Z`, with period eight. The targets
   `stableSOHomotopy_five_subsingleton` and `stableSOHomotopy_six_subsingleton` use
   the representatives `SO(7)` and `SO(8)` respectively.
9. Compare the topological Bott maps with the Clifford-module Bott classes supplied by the
   representation-theory roadmap.  This comparison prevents two unrelated periodicity APIs.

Bott, *The Stable Homotopy of the Classical Groups*, Annals of Mathematics 70 (1959),
Sections 2--8, is normative for the geodesic, index, and stable-loop argument.  Milnor,
*Morse Theory*, §24, supplies the path-space Morse-theory formulation.  The proof is not
complete if it omits the broken-geodesic comparison, Morse--Bott attachment, or
increasing-connectivity estimate, postulates the eight-periodic table, or proves only `pi_5` and
`pi_6` vanish.

*Needs:* §4.1, RiemannianGeometry R1–R3, MorseTheory M5 and SpinRepresentations Layer 7.

### 4.3 Stable `J`

1. From the action of `SO(r)` on the one-point compactification `S^r` of `ℝ^r`, construct
   the based sphere action and its unstable homomorphism on homotopy groups. Compare with
   the construction on `∂(D^(i+1) × D^r)` in Hatcher,
   [*Vector Bundles and K-Theory*](https://pi.math.cornell.edu/~hatcher/VBKT/VB.pdf), §4.1,
   Proposition 4.1 (p. 108).
2. Prove compatibility with block inclusion on `SO`, suspension on sphere maps, basepoint change,
   and composition.  Pass to colimits to define stable `J_n : pi_n(SO) -> pi_n^S`.
3. Identify `J` with the change in Pontryagin--Thom class caused by changing a stable framing by
   an element of `pi_n(SO)`.  Prove compatibility with the `BSO` clutching description.

**API.**

- Give the action-induced homomorphism and prove that block stabilization corresponds to suspension.
- Identify the induced homomorphism in stable homotopy with change of framing.

*Needs:* §§3.1, 4.1 and TangentialBordism B5.2 for the finite-rank framing comparison.

### Examples

**Checks.**

- The degree-one groups at ranks three and eleven give `π₁(SO(3)) ≅ π₉(SO(11)) ≅ ℤ/2`.
- The degree-one group of `SO(2)` is `ℤ`, outside the source rank bound.
- The groups in degrees five at rank seven and six at rank eight vanish.

### Dependencies

Layer 3, TopologicalKTheory T1.5–T1.6, RiemannianGeometry R1–R3 and MorseTheory M5.

## Layer 5: stable framings and Pontryagin--Thom

### 5.1 Framed bordism and the stable comparison

1. For a compact smooth manifold embedded in a sufficiently large Euclidean space, construct the
   stable normal bundle and prove `TM directSum nu ~= trivial`.  Give mutually inverse operations
   between stable tangent and stable normal framings; prove independence under adding trivial
   directions, isotopy of embeddings, and passage to a larger ambient Euclidean space.
2. Define framed bordism using the shared collared-cobordism carrier, with a stable normal framing
   product-compatible near each boundary collar.  Prove equivalence-relation and abelian-group
   laws under disjoint union, including orientation and framing reversal. The common collared
   trace and its boundary may be empty or disconnected. A collar is a diffeomorphism between
   `[0,1) × B` and its actual open neighbourhood, so `B = ∅` is allowed even when the
   ambient manifold is nonempty. Put connectedness and nonempty-boundary hypotheses only on
   the particular filling or sphere theorem that uses them. Construct the empty, disconnected,
   and connected product cylinders with their actual boundary identifications.
3. Use CharacteristicClasses C2.0’s pointed Thom model and GeneralizedCohomology G4 item 2’s
   comparisons. If the rank-`k`
   normal bundle `nu` of `M` is framed, prove the pointed equivalences
   `Th(nu) ~= M_+ smash S^k ~= Sigma^k M_+`, natural under pullback and stabilization.
   Construct this equivalence from the displayed normal trivialization: on a finite normal
   vector `v` it sends its Thom class to the compactification class of
   `(base(v), framing(v))`, and it sends infinity to the suspension basepoint. It is not
   a separately chosen pointed isomorphism, and the Thom space is not in general a sphere.
4. Consume TangentialBordism B5.2 for the finite-rank framed collapse and its inverse.
   Match its tubular derivative with the identity on the actual normal quotient and its
   disc compression with a positive radial scaling. The framed Thom augmentation sends
   finite coordinates `(x,v)` to `v` and infinity to the basepoint. Compare the two finite
   representatives under changing the tube, compression, and the stabilization rank.
5. Use TangentialBordism B5.5’s stable framed Pontryagin–Thom map. Identify its finite
   representatives with the stabilization of item 4, and compare pinch with disjoint union.
6. Check the finite-rank class of a positively framed point in the line has degree `+1`,
   and reflection of its frame gives degree `−1`. Use the quotient normal coordinate and
   standard positive trivialization.

7. Use StringOrientation S2.3’s isomorphism `Ω_n^fr ≅ π_n^S` and prove the product,
   suspension, boundary and change-of-framing formulas, including the stable `J` comparison
   from §4.3.

Pontryagin, *Smooth Manifolds and Their Applications in Homotopy Theory*, Chapter II §§1--4,
supplies the framed-manifold group, collapse construction, and suspension law.  Thom,
*Quelques propriétés globales des variétés différentiables*, Chapters I--II, supplies smooth
approximation and realization by submanifolds.  Kosinski, *Differential Manifolds*, Chapters
VIII--X, gives the modern Pontryagin--Thom proof.  Hirsch, *Differential Topology*, Chapters
2--4, supplies
approximation, transversality, embeddings, and tubular neighbourhoods.  Every independence
statement above is part of the theorem, not quotient-by-choice automation.
[Snaith, §3.1, printed p. 8](https://arxiv.org/pdf/1001.4751#page=8) fixes the Thom
identification induced by the normal trivialization and the following augmentation.

The sphere-source collapse has a compact source manifold as an explicit hypothesis.
Use the chosen normal-disc quotient model of the Thom space: the tubular coordinate maps
to its corresponding Thom class, the zero section maps to the zero-section class, and the
complement of the open tube (including ambient infinity) maps to the Thom basepoint.
State these as evaluation laws. The framed-cycle application supplies compactness; a
noncompact source does not instantiate this classical collapse theorem.

**API.**

- Convert tangent to normal framings and back on a displayed embedding and stabilization.
- Evaluate collapse, augmentation and the regular-value comparison on the zero section and outside the open tube.
- Prove the product, boundary and change-of-framing laws on the supplied stable isomorphism.

*Needs:* Layers 1, 3 and 4, CharacteristicClasses C2.0, GeneralizedCohomology G4 item 2,
TangentialBordism B5.2 and B5.5, and StringOrientation S2.3.

### Examples

**Checks.**

- A positively framed point in the line has degree `+1`; its reflected frame has degree `−1`.
- The normal zero section maps to the zero vector under Thom suspension and augmentation.
- The collapsed complement, including ambient infinity, maps to the sphere basepoint.

### Dependencies

Layers 1, 3 and 4, CharacteristicClasses C2.0, GeneralizedCohomology G4 item 2,
TangentialBordism B5.2 and B5.5, and StringOrientation S2.3.

## Layer 6: almost-framed groups, geometric `P_n`, and the exact sequence

### 6.1 Almost-framed bordism and comparison

1. In the Kervaire–Milnor range `n ≥ 5`, define a geometric almost-framed `n`-cycle as a
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
   has an exterior collar; an endcap interior lies in the ambient trace boundary. The tube's
   closed lateral width parameter `s ∈ [0,1]` is matched at its endpoints to
   `c_X(ε_X s,b)` and `c_Y(ε_Y s,b)`, where `0 < ε_X, ε_Y < 1` lie strictly below the
   corresponding cycle product widths. Thus the included lateral width-one slice stays
   inside each supplied half-open endpoint collar. Transport its derivative by
   `(u,v) ↦ (εu,v)`, including the positive normal rescaling in the endpoint framing
   comparison; use the induced inverse rescaling when returning to the original coordinates.
   The lateral product condition itself returns a proper width `0 < μ < 1` and asserts
   equality only on total-bundle vectors based at `0 < s < μ`. Shrinking retains the same
   lateral framing. No matching or product condition extends an endpoint collar to width one.
   Construct the standard `Dⁿ × I ⊂ M × I` tube with these faces before proving reflexivity.
   In particular, construct the product witness for a hemispherical defect in `S⁶` with
   full radial exterior collar `c(s,b)=(1-s)b` in `D⁶`, not a pre-shrunk input. Its lateral
   collar is `(s,t,b) ↦ (t,c(εs,b))`, with a common proper width below the cycle product
   width, and remains embedded at `s=1`. Return the product complement frame with its
   derivative and endpoint equations; derive reflexivity from this cylinder construction.
   Include product compatibility of the complement framing on the lateral collar and a stable
   framing off that neighbourhood whose endpoint
   pullbacks equal the two displayed complement framings after one common stabilization.
2. Prove independence of defect discs, collars, representatives, and stabilization.  Prove the
   bordism relation and connected-sum abelian-group laws in dimension `n ≥ 5`; call the
   resulting exported group `A_n`. Filling-group instances and the maps
   consuming these groups carry their dimension range explicitly. No degree-zero group is
   asserted on a carrier that requires a positive-dimensional defect disc.
3. Separately define a normal-frame top-cell model: a closed oriented `n`-manifold with
   a stable normal frame field on the complement of one chosen top cell, modulo the
   framed-bordism relation on the punctured representatives.  Pin the collar, stabilization, and
   top-cell conventions rather than hiding them in the quotient.  The top cell is again a smooth
   embedded collared closed disc with proper image, and the normal framing converted to tangent
   data is product-compatible on its exterior collar; `topCell = univ` must be impossible.
4. Construct the forward map by converting the tangent framing to a normal framing and collapsing
   the chosen defect disc to the top cell.  Construct the inverse by choosing an embedded top-cell
   disc, converting normal to tangent data on its complement, and restoring the defect collar.
   Prove independence of the cell and disc choices, prove both composites by explicit framed
   bordisms, and prove compatibility with connected sum, orientation reversal, and the defect map.
   Only after this group isomorphism may notation `A_n` refer to either model.

**API.**

- Send a punctured manifold with its product framing to its class, and compare the tangent and normal models.
- Prove invariance under the geometric relation and evaluate connected sum and reversal on classes.

*Needs:* §§1.1, 2.1, 4.1, 5.1 and GeometricTopology §1.2.

### 6.2 Parallelizable fillings and comparison

1. Define a stably framed filling cycle as a compact connected oriented smooth `n`-manifold whose
   boundary is identified orientation-preservingly with a homotopy `(n-1)`-sphere, together with a
   stable tangent framing product-compatible on a returned proper subcollar of the chosen
   collar. Call this carrier stably framed or s-parallelizable, not parallelizable.  The boundary carrier is identified with the actual
   Mathlib boundary subtype of the filling, and the collar restricts at zero to that
   identification.  Pin it as a diffeomorphism from the open subtype `[0,1) × boundary` of the
   relative cylinder to the displayed open collar neighbourhood.  Construct the product
   framing only from the collar derivative, normal line, and boundary framing; product
   compatibility is equality with the ambient trivialization on all actual total-bundle
   vectors whose base has collar time `s < ε`, for a returned `0 < ε < 1`. There is no
   equality requirement near the missing width-one endpoint of the supplied collar.  A construction allowed to return the ambient framing itself makes this condition
   circular and does not count.
2. A filling bordism is a collared, oriented, framed `(n+1)`-manifold with corners whose rounded
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
3. Restrict an honest framing of `TW` to `T(∂W) ⊕ ε_normal`, keeping the normal
   as a boundary stabilization slot. This is a stable boundary framing and does not imply
   an honest framing of `T(∂W)`. Construct the collar-normalized stabilization of an honest
   ambient frame after adding one extra trivial line. Return a width `0 < ε < 1` and a
   slightly larger cutoff width `ε < δ < 1`; all product claims refer only to `s < ε` in
   the original collar coordinates. First make its collar pullback constant
   in collar time on a smaller collar: identify tangent fibres by the actual derivative of
   the product collar, evaluate the pulled-back frame at a smooth reparametrization of time
   which is zero near the boundary and unchanged off a wider collar, and interpolate those
   evaluation times to obtain a path of fibrewise isomorphisms. This uses product tangent
   transport, not the derivative of the reparametrization, which would be singular.
   Then in collar coordinates write a vector as `(t + sν, a)`, with `ν` the outward collar
   normal and `t` tangent to the boundary.
   Rotate the normal and extra line through a quarter turn, so that the normalized frame is
   `(f(t − aν), s)` at the boundary, before the fixed permutation putting the normal first.
   Additional stabilization coordinates are unchanged. Use a smooth cutoff on a narrower
   collar to extend this rotation by the identity off the original collar. Prove forward and
   inverse smoothness, the displayed evaluation law, orientation/permutation signs, and the
   resulting global homotopy from the block stabilization to this normalized endpoint.
   The boundary frame is `(t,a) ↦ f(t − aν)`, with its one normal stabilization retained.
   The normalization homotopy moves the boundary framing. Return the proper width with the
   endpoint's product witness; a product theorem on the entire supplied collar is not a target.
   Restriction to any smaller positive width preserves the same boundary frame and its equations.

   If a caller reparametrizes as `c_ε(s,b)=c(εs,b)`, prove its derivative is `dc_(εs,b)`
   composed with `(u,v) ↦ (εu,v)` and its outward normal is `ν_ε=εν`. Transport the boundary
   stable frame by the positive rescaling `(v,a) ↦ (v,εa)`, so its evaluation is
   `f(v−aν_ε)`. Record this rescaling's smooth inverse, path to the identity, compatibility
   with stabilization and the restricted global comparison homotopy. The product witness here
   uses the original collar parameters; it does not silently identify these reparametrized
   normal fields.

   An absolute handle decomposition of a compact connected `W^n` with nonempty boundary
   gives a spine of dimension at most `n−1`. Use stable-range cancellation to lift the
   homotopy class of its prescribed stable frame to an honest ambient frame after common
   stabilization, not just to prove that some honest frame exists. Combine that global
   homotopy with the explicit normalization homotopy. Package the honest frame and comparison
   with its normalized stabilization as collar-normalized parallelizable filling cycle.
   Retain the boundary path obtained by pulling back the comparison to the collar, its endpoint
   laws, and the normal-line transport. No collar-fixed homotopy to the unmodified block
   stabilization is required. A separate relative lifting theorem with fixed boundary data must
   retain its actual obstructions; it is not used to obtain these filling representatives.
4. Construct the standard `D⁷` representative from its constant ambient frame before proving
   the comparison with honestly parallelizable cycles. Identify its actual boundary with `S⁶` and compute the induced
   stable boundary frame `(t,a) ↦ t − a x`, up to the stated fixed target permutation.
   Verify the normal/extra-line rotation, its cutoff extension, and the moving boundary path
   explicitly. Include the full radial input collar `c(s,x)=(1−s)x` onto `D⁷ \ {0}` and
   construct normalization on a returned proper subcollar. This tests arbitrary supplied collars,
   rather than only one preselected narrow collar. No global frame is required to be product
   along all radial rays down to the centre. This construction requires no honest tangent frame
   of `S⁶`.

   Define the honestly parallelizable comparison cycles and their relative cobordisms.
   Map an honestly parallelizable representative to its collar-normalized
   stabilization with the normalization path. In the reverse direction retain the honest
   ambient frame and use the recorded boundary transport. Prove invariance under stabilization,
   collar shrinking (using a common smaller width), positive normal rescaling and choices of
   cutoff, and prove both composites by cobordisms. For gluing,
   insert the recorded boundary path as a framed collar cylinder before identifying endpoints;
   prove identity, concatenation, reversal, and pullback laws for those transports, and compare
   incoming/outgoing/vertical corner permutations. Prove that defect deletion has the needed
   normalized representative by the absolute stable-class lifting of item 3. Finally prove
   compatibility with boundary connected sum, orientation reversal and boundary, then identify
   the resulting quotient with `P_n`. The meaning of `bP` remains bounding an honestly
   parallelizable manifold.

Before defining defect deletion on quotient classes, construct the following map on
connected almost-framed representatives. Extend the open-exterior framing to the closed
exterior using its product witness on a returned proper subcollar and prove that restriction
recovers the given framing. Use a common smaller width for all endpoint and gluing comparisons;
carry the positive normal-rescaling transport if collars are reparametrized. Give the closed exterior its inherited orientation and prove the extended framing
induces it. In dimension at least two, prove the exterior connected, and identify its
boundary with the defect sphere with the reversed boundary orientation. Package these
specific data as a stably framed filling cycle, then prove witness compatibility and the
required §6.2 normalization comparison before descending the map. Transport endpoint
framings along its recorded boundary path when composing the deletion witness with a
parallelizable filling or gluing witness. No component is discarded.

**API.**

- Send the stably framed cycle to its normalized parallelizable representative with its boundary transport.
- Evaluate boundary and boundary connected sum, and prove invariance under collar changes.

*Needs:* §§1.1, 2.1, 4.1, 5.1, 6.1 and the relative homotopy of the disc and its sphere.

### 6.3 Maps and exactness

1. Define the maps first on the convenient carriers: delete the defect-disc interior to obtain a
   stable filling, give a punctured homotopy sphere its canonical stable framing, and take the
   oriented boundary of a stable filling.  Descend them to the three quotients.  Prove every map
   is independent of choices and additive, then prove that the comparison isomorphisms from §§6.1–6.2 make these maps commute with the maps on the normal-frame and honestly parallelizable models.  Only after these diagrams
   commute write them as `p : A_n -> P_n`, `i : Theta_n -> A_n`, and
   `b : P_n -> Theta_(n-1)`.
2. Prove, map by map for `n>=6`, the geometric exact segment:
   `... -> A_(n+1) -> P_(n+1) -> Theta_n -> A_n -> P_n -> Theta_(n-1) -> ...`.
   At each term, construct the geometric filling or cobordism witnessing the reverse inclusion
   from kernel to image.
3. Define `bP_(n+1)` as the subgroup of `Theta_n` represented by homotopy spheres bounding
   parallelizable manifolds.  Prove it is precisely the image of the boundary map and prove
   closure under connected sum and orientation reversal.

The cycles and exact sequence above are defined here. For the classical comparison,
Kervaire–Milnor, Theorem 4.1 and Lemmas 4.2–4.5 (pp. 510–512), identify the kernel of
`Θ_n → coker J_n` with `bP_(n+1)`; their Theorem 5.1 (p. 512) gives the odd-index
vanishing of `bP`.

**API.**

- Descend defect deletion, punctured-sphere framing and oriented boundary to homomorphisms.
- Show that each composite vanishes and construct a geometric preimage for each kernel class.

*Needs:* §§1.1, 2.1, 6.1–6.2.

### Examples

**Checks.**

- The product hemispherical defect cylinder gives reflexivity in `A_6` with its supplied full
  radial collar.
- Deleting the defect of a standard framed sphere yields the standard disc filling, and the
  boundary map sends that filling to the standard sphere class.
- For the constant frame on `D⁷`, the normalized boundary frame sends `(t,a)` to `t − ax`,
  with the specified target permutation and outward-normal convention.
- Applying the boundary map to the defect-deletion image reverses the boundary orientation of
  the deleted disc and gives zero in `Theta_(n−1)`.

### Dependencies

Layers 1–5.

## Layer 7: Wall surgery and the obstruction calculation

This layer consumes geometric topology's surgery operation, AlgebraicTopology's relative
homology and duality, and Layers 4--6's framings and `P_n` cycles.

### 7.1 Normal maps and surgery below the middle dimension

1. Define a degree-one normal map `(f,b) : M -> X`: a degree-one map of oriented manifolds or
   Poincare pairs together with stable normal-bundle data covering it.  Define normal bordism and
   prove functoriality under composition, boundary, and products.
2. Decompose a normal map by transversality to cells/handles of the target.  Identify its surgery
   kernels in homotopy and homology and prove they are finitely generated with the duality pairing
   needed in the middle dimension.
3. Realize a chosen kernel generator below the middle dimension by a framed embedded sphere.
   Apply the shared geometric surgery operation, construct its trace, and prove its effect on
   homotopy, fundamental group, homology, normal data, and stable framing.
4. Iterate this operation to make a simply connected normal map `k`-connected below the middle
   dimension, keeping boundary and collar data fixed.  Prove termination from finite CW type.

**API.**

- Compute the surgery kernel of a degree-one normal map and its boundary normal data.
- Track the trace under composition, products and below-middle surgery.

*Needs:* §§1.1–1.3, 5.1, AlgebraicTopology’s relative homotopy, duality and finite CW type, and GeometricTopology’s surgery.

### 7.2 Middle-dimensional algebra

1. On the remaining kernel construct the `epsilon`-symmetric intersection pairing and its
   quadratic refinement from framed self-intersections.  Prove nonsingularity, basis-change
   invariance, orthogonal-sum behavior, and invariance under normal bordism.
2. For `n=2*q`, define the even-dimensional obstruction carrier to be nonsingular
   `(-1)^q`-quadratic forms on finite free `Z`-modules, modulo isometry and hyperbolic
   stabilization.  Define its addition and inverse by orthogonal sum and sign reversal. The Lean prototype
   `EvenWallForm` carries the integral pairing and the native quadratic map, with
   `EvenWallForm.Isometry` combining a quadratic isometry and preservation of the pairing.
3. For `n=2*q+1`, define instead a `(-1)^q`-quadratic formation: the surgery kernel together with
   the two Lagrangians coming from the two boundary/handle presentations, as in
   `OddWallFormation`. Quotient formations
   by isometry, hyperbolic stabilization and the two trivial formations described below.  Prove addition and inverse
   on this quotient.  Do not encode an odd obstruction as the Witt class of a form.
   In both parity branches the pairing and quadratic refinement are functions on the whole finite
   free module.  Their quadratic refinement uses Mathlib’s `QuadraticMap`. The integral pairing satisfies
   symmetry, unimodularity and the diagonal identity, and its reduction is the polar form;
   each displayed lagrangian is isotropic, a direct summand, equal to its orthogonal complement,
   and a zero locus for the quadratic refinement.  Define stable equivalence as the equivalence
   relation generated by form/formation isometries, addition of displayed hyperbolic summands, and
   addition/removal of every elementary-zero formation in the odd case: either the two
   lagrangians are complementary, or they share a common lagrangian complement. Prove
   compatibility with orthogonal sum and compare this presentation with
   [Ranicki, *Foundations of algebraic surgery*, §2](https://arxiv.org/abs/math/0111315).
   Elementary transvections alone do not supply these zero relations. The quotient may
   not use a freely chosen setoid.
4. Define `L_n(Z)` by the parity split above, with `EvenWallGroup` and `OddWallGroup`
   the additive presentations. Compare the stabilization quotient with the
   additive presentation on form or formation generators, imposing the isometry, orthogonal
   sum and hyperbolic-plane relations for forms and the corresponding sum, isometry and
   two trivial-formation relations for formations. Prove that these groups agree with Wall's
   simply connected surgery obstruction in their respective dimensions (Wall §13A, Ranicki §2).
5. Prove the surgery obstruction vanishes exactly when the even-dimensional kernel has a
   lagrangian.  Realize a lagrangian by disjoint framed embedded spheres and perform middle-
   dimensional surgeries to turn the normal map into a homotopy equivalence.
6. In odd dimensions prove the corresponding zero criterion in terms of an elementary, stably
   hyperbolic formation and realize its elementary modifications geometrically.
7. Prove realization: in even dimensions plumb handles to realize a prescribed nonsingular
   quadratic kernel; in odd dimensions build a normal cobordism realizing a prescribed formation.
   Prove additivity and identify the trace decomposition with the relevant sum.
8. Compare the resulting obstruction on a geometric `P_n` cycle with §6.2’s honestly parallelizable comparison group.  Prove injectivity by completing a zero-obstruction filling to a framed
   cobordism and surjectivity by realization.

**API.**

- Construct the integral pairing and quadratic refinement and compare their values by polarization.
- Transport the Lagrangians under isometry and orthogonal sum; identify the two elementary-zero cases.
- Give the quotient maps from generators and their additive universal properties.

*Needs:* §§6.2, 7.1, GeometricTopology’s surgery, and Mathlib quadratic maps.

### 7.3 Computation of the simply connected groups

1. First prove that both `(H(ℤ);L,L*)` and `(H(ℤ);L,L)` represent zero, using the
   complementary and common-complement relations respectively. In odd dimensions over
   the simply connected coefficient ring `Z`, prove every relevant
   quadratic formation is elementary after hyperbolic stabilization and obtain `P_n=0` for odd
   `n>=5`. The target for the algebraic quotient is `oddWallGroup_subsingleton`.
2. In dimension `4k`, use IntegralLattices 1I and 6A. Stabilize by a hyperbolic plane
   to apply indefinite classification and deduce that signature divided by eight is an
   isomorphism from the even Witt group to `ℤ`. Construct the `E₈` plumbing realization
   and obtain `P_(4k) ≅ ℤ` for `k ≥ 2`. The algebraic computation is
   `nonempty_evenWallGroup_two_mul_addEquiv_int`.
3. Use GeometricTopology §4.3.1’s nonsingular finite quadratic Arf algebra on
   `QuadraticForm (ZMod 2) V`: symplectic-basis Arf, basis independence,
   hyperbolic/anisotropic classification and the zero-quadratic Lagrangian criterion,
   including dimension zero. Prove the integral Wall-form reduction to that algebra here.
   Realize both classes geometrically and obtain `P_(4k+2) ≅ ℤ/2` for `k ≥ 1`. The algebraic computation is
   `nonempty_evenWallGroup_two_mul_add_one_addEquiv_zmod_two`.
4. Prove that framed surgery on an almost-framed cycle produces precisely the class carried by
   `p : A_n -> P_n`.  Interior surgery is a trace cobordism, not an additional quotient relation.

Wall, *Surgery on Compact Manifolds*, 2nd ed., Chapters 1–6 and §13A, is the source spine: normal maps,
surgery kernels, below-middle improvement, quadratic forms, realization, and the simply
connected obstruction calculation must appear in that order.  Kervaire–Milnor, Lemmas 7.2–7.4, Lemma 8.4 and Theorem 8.5, give the corresponding
plumbing, signature and boundary calculations.  A citation to the
final `L`-group table does not replace this decomposition.

*Needs:* §§6.2–6.3, 7.1–7.2, GeometricTopology §4.3.1 and IntegralLattices 1I and 6A.

### Examples

**Checks.**

- The rank-one form `⟨1⟩` fails the diagonal identity of `EvenWallForm 0`, since its
  diagonal at a basis vector is odd.
- The integral hyperbolic plane satisfies the diagonal law and has signature zero.
- The `E₈` lattice has signature eight and represents `1` under signature divided by eight.
- The two-dimensional quadratic refinements with symplectic basis values `(0,0)` and
  `(1,1)` have Arf invariants zero and one.
- Both complementary and common-complement hyperbolic formations represent zero.

### Dependencies

Layers 1 and 4–6, AlgebraicTopology, GeometricTopology §4.3.1 and IntegralLattices 1I and 6A.

## Layer 8: the Kervaire--Milnor comparison with stable homotopy

### 8.1 The comparison with stable homotopy

1. Use Pontryagin–Thom on a closed framed representative to construct the always-defined
   forgetting homomorphism `π_n^S → A_n`: choose a defect disc and retain the framing off it.
   Prove independence of the representative, defect, collar and stabilization. Framed
   disconnected representatives are normalized by framed connecting 1-handles; prove this
   normalization independent and compatible with addition before using connected `A_n` cycles.
2. Construct the extension obstruction `A_n → π_(n-1)(SO)` from the framing on the defect
   sphere, with its orientation and stabilization conventions. Prove the exact sequence
   `π_n(SO) →^J π_n^S → A_n → π_(n-1)(SO)` at its intermediate terms. A cycle in the
   obstruction kernel admits an extension across its defect; only for such cycles apply PT
   to the resulting closed framing. Changing that extension changes its stable class by
   `im J_n`, so the canonical inverse lands in `coker J_n`. Prove the resulting canonical
   isomorphism `coker J_n ≅ ker(A_n → π_(n-1)(SO))`.
3. If `π_(n-1)(SO)=0`, identify all of `A_n` with that kernel and hence with `coker J_n`.
   Transport Layer 6's exact segment through this isomorphism and identify both boundary
   images with the corresponding `bP` subgroups. The sixth-dimensional application uses
   the independently proved `π_5(SO)=0`; no arbitrary almost-framed cycle receives a
   preferred element of `π_n^S`.
4. Define the Kervaire invariant on an almost-framed `(4k+2)`-manifold as the Arf invariant of
   the surgery-normalized middle-dimensional quadratic form.  Prove bordism invariance,
   compatibility with Pontryagin--Thom, and equality with the map from `coker J` to `P_(4k+2)`.

The extension obstruction on a punctured sphere uses Kervaire–Milnor, Theorem 3.1 (p. 508).
The classical quotient embedding `Theta_n/bP_(n+1) ↪ coker J_n` is their Theorem 4.1
(pp. 510–512). Prove that §6.3’s geometric maps induce that embedding. Browder’s framed
quadratic refinement supplies the Arf comparison with Pontryagin–Thom.

*Needs:* Layers 3–7.

### Examples

**Checks.**

- The chosen stable frame on the standard sphere extends across the defect disc and has
  zero extension obstruction.
- A framing change by the zero element of `π_n(SO)` gives the same stable class.
- In degree six `π₅(SO)=π₆(SO)=0`, so the kernel comparison identifies `A₆` with the
  full sixth stem.

### Dependencies

Layers 3–7.

## Layer 9: explicit computation through the sixth stem and `Theta_6`

### 9.1 The sixth stem and the sixth homotopy sphere group

This layer is an explicit theorem chain.  None of the displayed groups may enter as an axiom or
as a field of a low-stem data record.

1. Construct the stable Hopf classes `eta` and `nu` from the complex and quaternionic Hopf
   fibrations.  Use the Hopf-invariant calculation, EHP, and composition relations to prove
   `pi_1^S ~= Z/2{eta}`, `pi_2^S ~= Z/2{eta^2}`, and
   `pi_3^S ~= Z/24{nu}`.
2. Work through Toda's suspension-sequence diagonals in stems four and five.  Compute every
   occurring `E`, `H`, and `P` map from the Barratt--Toda and Hopf-invariant formulas and prove
   `pi_4^S=0` and `pi_5^S=0`.
3. Normalize the unstable representative before entering the colimit.  Write
   `nu_4 : S^7 -> S^4` for the quaternionic Hopf map and define the class called `nu^2` by
   `nu_4 o Sigma^3(nu_4) : S^10 -> S^4`, with the composition order fixed by this displayed
   formula.  Prove that its stabilization is independent of this representative, has order two,
   and is nonzero by the indicated EHP/Toda calculation.  Show all other generators in the
   relevant unstable groups either desuspend to the computed `P` image or die under suspension.
   Freudenthal identifies the resulting colimit from `pi_(n+6)(S^n)` for `n>=8`, giving
   `pi_6^S ~= Z/2{nu^2}`. The Lean signature `nonempty_sixthStableStem` uses
   the sphere of dimension eight.
4. Record the chain as one compatible table of groups, generators, and suspension maps for stems
   zero through six.  Each table entry links to the theorem calculating it; the table itself is
   generated documentation, not proof input.
5. Construct a chosen stable framing `φ_ν` of the actual `S³` whose Pontryagin–Thom
   class is the normalization of `ν` fixed in Steps 1 and 3. Produce it from a regular
   fibre of the quaternionic Hopf map, with an explicit normal-to-tangent framing comparison.
   On the closed product `S³ × S³`, use `φ_ν × φ_ν` and Layer 5's PT product theorem to
   identify its stable class with the selected composition `ν²`, including the summand
   permutations. Identify the factor generators `a,b` in middle homology, prove their
   symplectic intersection matrix, and calculate the geometric framed refinement
   `q(a)=q(b)=1` from the factor normal framings and the Hopf-invariant-one calculation
   of Layer 3. Prove this framing/refinement comparison before using its Arf value. Use the shared
   algebraic Arf theorem to conclude Kervaire invariant one. Compare this class with the regular-value representative
   of `ν_4 ∘ Σ³ν_4` by the PT inverse bordism, and prove that
   `coker(J_6) → P_6` sends it to the nonzero Wall class. Thus
   `KI : π_6^S → ℤ/2` is an isomorphism. This construction uses an already closed product,
   so requires neither a homotopy-five-sphere cap nor `Theta_5=0`.
6. Bott periodicity gives `pi_5(SO)=0` and `pi_6(SO)=0`.  Use Layer 8 to prove
   `A_6 ~= coker(J_6) ~= pi_6^S ~= Z/2`, with the comparison sending the framed `nu^2`
   representative to the nonzero class.
7. Layer 7 gives `P_7=0` and `P_6~=Z/2`; Layer 8 identifies the map
   `coker(J_6) -> P_6` with the Kervaire invariant, hence with an isomorphism.  In the exact
   segment
   `P_7 -> Theta_6 -> coker(J_6) -> P_6`, the left image `bP_7` is zero and the right kernel is
   zero.  Conclude `Theta_6=0`.

Toda, Chapters I--V, is normative for the unstable representative, its composition order, and
its stabilization in Steps 1--4.  Kervaire–Milnor §8 (pp. 531–536) supplies the refinement `c(M)`; §8.1 here compares
with `P_6`. Browder, *The Kervaire Invariant of Framed Manifolds and its
Generalization*, supplies the framed quadratic refinement, Arf invariant, and Pontryagin--Thom
comparison.  The proof above explains how the cited table is reconstructed; importing the table
as unexplained data does not meet the roadmap.

*Needs:* Layers 3–8.

### Examples

**Checks.**

- The representative `ν²` has order two in `π₁₄(S⁸)`.
- The product framing has symplectic basis refinement values `(1,1)`, giving Kervaire
  invariant one.
- Its image generates `P₆`, while `P₇=0` and both adjacent exactness terms force
  `Theta_6=0`.

### Dependencies

Layers 3–8.

## Layer 10: smooth recognition in dimension six

### 10.1 Smooth recognition

1. Let `M` be a compact Hausdorff second-countable boundaryless smooth six-manifold and
   `h : M ~=_h S^6`.  Use `h` to prove connectedness and simple connectivity and to transport a
   chosen generator of top integral homology to an orientation of `M`.
2. Apply the essential-surjectivity theorem of Layer 2 to choose a Type-0 finite-atlas code for
   `M`. Take its class in the geometric quotient and prove independence of the code, and regard the result as the oriented class of `M` in `Theta_6`.  From `Theta_6=0`,
   construct an oriented h-cobordism from `M` to the standard sphere.
3. Apply Layer 1’s h-cobordism theorem in total dimension seven to obtain a
   diffeomorphism `e : M ~=_m S^6`.  Package orientation preservation as the equation saying that
   `e.deriv` sends the chosen `Manifold.Orientation` on `M` to the standard orientation on `S^6`.
   If the equation has the opposite sign, compose with a fixed coordinate reflection and prove
   the derivative equation for the composite.
4. State `exists_orientationPreserving_diffeomorph_sphere_six` with both chosen oriented
   atlases and the positive derivative sign on each overlap, expressed by membership in Tau
   Ceti’s orientation-preserving groupoid. The corollary `nonempty_diffeomorph_sphere_six`
   chooses orientations from the top homology classes and forgets the orientation equation.

*Needs:* Layers 1–2 and 9.

### Examples

**Checks.**

- With matching orientations, the standard sphere’s identity preserves the chosen orientation.
- With opposite orientations a single coordinate reflection gives the positive derivative
  sign relative to the two chosen atlases.
- A disconnected six-manifold cannot satisfy the homotopy-equivalence hypothesis.

### Dependencies

Layers 1–2 and 9.

## Dependency order

| Track | Depends on | Feeds |
| --- | --- | --- |
| 1 h-cobordism | geometric topology, DifferentialGeometry orientations/Sard, HF Morse data, algebraic topology | 2, 10 |
| 2 small skeleton and `Theta_n` | 1, triangulation, geometric connected sum | 6, 9--10 |
| 3 James/EHP/stable stems | algebraic topology, compactly generated substrate | 5, 8--9 |
| 4 `SO`/shared `BSO`/Bott/`J` | §3.1, TopologicalKTheory T1.5–T1.6, bundles, Lie groups | 5--6, 8--9 |
| 5 Pontryagin--Thom | 3–4, CharacteristicClasses C2.0, GeneralizedCohomology G4, TangentialBordism B5.2 and B5.5, StringOrientation S2.3 | 6, 8--9 |
| 6 `A_n`, `P_n`, exactness | 1--2, 4--5 | 7--9 |
| 7 Wall surgery | algebraic topology, geometric surgery, GeometricTopology §4.3.1, IntegralLattices 1I and 6A, 4–6 | 8--9 |
| 8 stable comparison | 3--7 | 9 |
| 9 sixth-stem calculation | 3--8 | 10 |
| 10 smooth recognition | 1--2, 9 | endpoint |

## Worked examples

**Checks.**

- The h-cobordism proof treats index-two/index-three cancellation in a six-dimensional
  cobordism by its own piping and complement-fundamental-group argument.
- `Sigma # (-Sigma)` is shown h-cobordant to the standard sphere by a constructed cobordism;
  orientation reversal is not merely declared to be an inverse.
- The geometric quotients use a Type-0 finite-atlas/handle skeleton, with essential surjectivity
  for arbitrary universes and invariance under changing the code; its source/target, groupoid,
  cover, cocycle, and separation laws are present in the actual code.
- The geometric h-cobordism quotient and the framed, almost-framed and filling bordism quotients
  have the maps of the Kervaire–Milnor sequence. The degree-six calculation uses these
  maps on the geometric groups.

- The standard closed disc in the standard sphere instantiates the embedded-disc contract, and
  its exterior collar is checked in the closed complement of the disc interior rather than as an
  ambient-open subset of the sphere.
- Zero charts realize the empty manifold; an empty listed chart is rejected. A single proper
  nonempty open chart and a global Euclidean chart both realize their specified domains,
  with transitions agreeing on the exact overlaps.
- The Lie-group framing of `S³` and its stabilization satisfy smooth bundle compatibility
  without designated-atlas membership. The standard disk in a sphere has a half-space-model
  exterior and boundary identification, and the product defect tube has a lateral exterior
  collar with no exterior collar imposed on its endcaps.
- Product bordisms instantiate every boundary witness used here, including empty and
  disconnected traces: for a closed oriented cycle,
  `∂(M × [0,1]) = (-M) ⊔ M`; for a filling they have incoming and outgoing horizontal faces,
  the vertical product on its boundary, the two exact corner intersections, and endpoint framing
  restrictions after a common stabilization.  Punctured-sphere and defect-track regressions check
  the endpoint disc/collar equations and exclude a relation that ignores either endpoint frame.
- `J X ~= Omega Sigma X` is derived for every connected `X` using universal covers or local
  coefficients, and its `X=S^1` fundamental-group case is a regression theorem.  The EHP
  sequence follows from the resulting maps and connectivity theorem.
- All stable topology is formed in `CompactlyGenerated`, reusing Mathlib's fully faithful
  inclusion and proving its compact-generation right adjoint, counit, exponential law, and
  limit/colimit comparisons before James, loop-space, or Bott arguments use them.
- Bott periodicity supplies all eight stable `SO` congruence classes through loop equivalences.
  Its proof includes the broken-geodesic approximations, compact-family comparison, Morse--Bott
  Hessian and negative-bundle attachments, and increasing-connectivity estimate.  A proof of
  only `pi_5(SO)=pi_6(SO)=0` does not pass.
- The shared TopologicalKTheory classifier and universal bundles are used with their actual
  basepoints, stabilization and clutching maps; the group/loop and smooth-framing comparisons
  commute with them. The full real Bott chain is retained without a classifier/Bott cycle.
- The normalization product witness returns `0 < ε < 1` and equality only below that width,
  including for the disc's full radial input collar. Shrinking, positive normal rescaling and
  the moving boundary path preserve the filling class and the gluing/corner comparisons.
- A zero smooth bundle class is equivalent to the existence of a chosen stable framing.
- The comparison with Pontryagin–Thom identifies a framed rank-`k` Thom space with
  `M_+ smash S^k`, then uses the augmentation to obtain the map to `S^k`; it also includes
  continuous pointed collapse and augmentation maps, collapse-map independence, the regular-value
  inverse, both inverse bordisms, and the change-of-framing formula for stable `J`.
- The defect-disc and normal-frame models for `A_n`, and the stable and honestly parallelizable
  models for `P_n`, are each related by inverse maps compatible with addition, boundary and
  defect. The absolute lifting comparison retains the collar width, boundary path and
  normal-line transport; the standard `D⁷` tests these data before comparing `P_n` with Wall’s
  simply connected group.
- Wall's obstruction theorem includes normal-map decomposition, below-middle surgery,
  even-dimensional whole-module quadratic forms, odd-dimensional formations with lawful
  lagrangian submodules, vanishing, realization, and group computation.
- The sixth-stem result records the intermediate stem-zero-through-six computations, the EHP
  maps, the normalized representative `nu_4 o Sigma^3(nu_4)`, its order,
  the framed `S³ × S³` product comparison, and its nonzero Kervaire invariant.
- `Theta_6=0` refers to the geometric group of homotopy spheres and uses the proved maps
  `P_7 -> Theta_6 -> coker(J_6) -> P_6`.
- Smooth recognition concludes a diffeomorphism to Mathlib's standard metric sphere under
  explicit compactness, separation, countability, and manifold hypotheses, together with the
  derivative equation preserving `Manifold.Orientation`; the plain `Nonempty Diffeomorph`
  statement is a corollary.

## Downstream consumers

FourManifolds and PositiveScalarCurvature use the handle and surgery interfaces.
TopologicalKTheory uses the real Bott comparisons in its real K-theory development.

## References

- Stephen Smale, [*Generalized Poincare's Conjecture in Dimensions Greater Than
  Four*](https://doi.org/10.2307/1970239), Annals of Mathematics 74 (1961), 391--406.
- John Milnor, *Lectures on the h-Cobordism Theorem*, Princeton University Press, 1965.
- Michel Kervaire and John Milnor,
  [*Groups of Homotopy Spheres: I*](https://doi.org/10.2307/1970128), Annals of Mathematics
  77 (1963), 504--537.
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
- C. T. C. Wall, *Surgery on Compact Manifolds*, 2nd ed., AMS, 1999, Chapters 1–6 and §13A.
- William Browder, [*The Kervaire Invariant of Framed Manifolds and its
  Generalization*](https://doi.org/10.2307/1970686), Annals of Mathematics 90 (1969), 157--186.

- Victor Snaith, [*The Arf–Kervaire invariant of framed manifolds*](https://arxiv.org/abs/1001.4751),
  Definition 3.1 and §3.1 for compact-source collapse, and Example 8.3 for the Arf-one product.
  Layer 9 additionally proves that its chosen product framing represents the normalized `ν²`.

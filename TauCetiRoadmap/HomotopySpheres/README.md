# Roadmap: high-dimensional differential topology and homotopy spheres

This roadmap develops the reusable smooth topology behind the Kervaire--Milnor groups of
homotopy spheres.  It constructs the simply connected smooth h-cobordism theorem, stable
homotopy groups of spheres, real Bott periodicity, stable oriented bundle classification,
framed bordism and Pontryagin--Thom, surgery obstruction groups, and the Kervaire--Milnor exact
sequence.  The first complete low-dimensional calculation is `Theta_6 = 0`, followed by the
direct smooth recognition theorem for compact smooth homotopy six-spheres.

Every object is geometric or functorial.  `Theta_n` is formed from oriented smooth homotopy
spheres and h-cobordisms; convenient models for `A_n` and `P_n` arise from almost-framed cycles
and stably framed fillings and are compared with the historical Kervaire--Milnor and Wall
definitions.  Exactness is proved map by map.  No record is permitted to carry the desired group
calculations or exactness as input fields.

Suggested homes are `TauCeti/Geometry/Manifold/HCobordism/`,
`TauCeti/Geometry/Manifold/HomotopySphere/`, `TauCeti/AlgebraicTopology/StableHomotopy/`,
`TauCeti/AlgebraicTopology/FramedBordism/`, `TauCeti/Topology/VectorBundle/Classifying/`, and
`TauCeti/Geometry/Manifold/Surgery/Obstruction/`.

## Scope and completion criterion

The roadmap is complete when Tau Ceti proves the following connected development.

1. The shared collared-cobordism and handle APIs support Morse handle decompositions, Whitney
   moves, cancellation, and the simply connected smooth h-cobordism theorem in cobordism
   dimension at least six.
2. A Type-0 finite-atlas and handle code gives a small skeleton of compact second-countable
   smooth manifolds.  Every manifold in an arbitrary universe has a coded realization
   diffeomorphic to it, and changing the code does not change any geometric quotient class.
3. Oriented smooth homotopy `n`-spheres form the geometric group `Theta_n` for `n>=5` under
   connected sum, with inverse given by orientation reversal and an explicit inverse
   h-cobordism.
4. Stable sphere homotopy groups are constructed from suspension in compactly generated spaces.
   The James construction,
   Freudenthal theorem, EHP sequence, composition, and Toda brackets provide a reproducible
   calculation route rather than a table oracle.
5. Stable `SO`, `BSO`, oriented stable vector bundles, real Bott periodicity, and stable `J` are
   constructed in the same convenient category, with all comparison and classification theorems
   needed for manifold framings.
6. Pontryagin--Thom gives a natural group isomorphism between framed bordism and stable
   homotopy.  Its collapse map factors through
   `Th(nu) ~= Sigma^k M_+` before the augmentation to `S^k`, and both constructions and both
   inverse proofs are present.
7. Almost-framed bordism, the geometric `P_n` groups, Wall's simply connected surgery
   obstruction groups, and the Kervaire--Milnor sequence are defined and proved equivalent in
   the ranges in which their names are identified.
8. The complete chain through the sixth stable stem proves
   `pi_6^S ~= Z/2{nu^2}`, computes its Kervaire invariant, and combines this with the
   Kervaire--Milnor sequence to prove `Theta_6 = 0`.
9. A compact Hausdorff second-countable smooth six-manifold homotopy equivalent to the standard
   sphere has an orientation-preserving diffeomorphism to it after matching orientations, with
   the manifold orientations and derivative-preservation equation visible in the theorem.

This roadmap concerns smooth manifolds of dimension at least five and the stable topology used
to classify their homotopy spheres.  Low-dimensional Poincare theorems, general non-simply-
connected surgery, pseudo-isotopy, and a calculation of every `Theta_n` are outside its stated
endpoint.

## Ownership and dependencies

- The [algebraic-topology roadmap](../AlgebraicTopology/README.md) owns relative singular
  homology, excision, cellular comparison, Poincare duality, Hurewicz, Whitehead, and finite CW
  type.  This roadmap consumes those theorems in handle, surgery, framing-obstruction, and
  recognition arguments.  Its exact supplier contract consists of the representative
  `relativeHurewicz`, `homologicalWhitehead`, `poincareDualityMap_isIso`, and
  `compactManifoldFiniteCWType` declarations.  The implementation imports and `#check`s that
  module.  This roadmap owns stable homotopy, framed bordism, and the low stable-stem calculation.
- The [geometric-topology roadmap](../GeometricTopology/README.md) owns manifolds with
  boundary and corners, collars, boundary gluing, standard handles, handle attachment, tubular
  neighbourhoods, connected sum, general framed surgery, the collared oriented-cobordism
  carrier, and smooth triangulation.  This roadmap uses those same objects.  It introduces no
  second boundary, collar, gluing, handle, surgery, connected-sum, cobordism, or triangulation
  type.
- The [Heegaard Floer roadmap](../HeegaardFloer/README.md) owns the shared manifold orientation
  and degree API and, in Lanes M/F0, finite-dimensional Sard, Morse functions, stable and
  unstable manifolds, and Morse--Smale transversality.  This roadmap consumes them to prove
  handle decompositions, Whitney and cancellation results, and Pontryagin--Thom transversality.
- The [universal-covers roadmap](../UniversalCovers/README.md) owns basepoint change, covering
  maps, and induced maps on homotopy groups.  The simple-connectivity and homotopy-equivalence
  arguments here consume those interfaces.
- The spin-representation section of the
  [representation-theory roadmap](../RepresentationTheory/README.md) owns the algebraic
  eightfold periodicity of real Clifford algebras and supplies the Clifford-module comparison
  input used in Stage 4B.  This roadmap owns the topological loop-space equivalences, stable
  `SO` table, and bundle-classification consequences; algebraic Clifford periodicity alone does
  not discharge them.
- Mathlib supplies the carrier `CompactlyGenerated.{u,w}` and its fully faithful functor to
  `TopCat`.  This roadmap supplies the missing reflector, compactly generated products and
  mapping spaces, pointed closed structure, and filtered-colimit comparison needed below.  It
  does not silently use ordinary `TopCat` products or colimits where an exponential law is
  required.

`Suggested.lean` keeps two supplier-interface mirrors only under
`TauCetiRoadmap.HomotopySpheres.Internal`: `OrientationSupplierMirror` for the
Heegaard-Floer-owned orientation contract and `GeometricTopologySupplierMirror` for the
GeometricTopology-owned collared-boundary contract.  These namespaces are compilation scaffolds,
not exported targets.  Their exact deletion gate is:

1. import the supplier modules exposing `Manifold.Orientation`,
   `Manifold.Orientation.Agrees`, `Manifold.Diffeomorph.PreservesOrientation`,
   `CollaredOrientedManifold`, `SmoothEmbeddedClosedDisk`, `CollarOpen`, and `CollarSource`;
2. replace each occurrence of an internal mirror name by that exact supplier declaration; and
3. delete both internal namespaces whole.

No implementation module may export either mirror or retain it beside the supplier import.

## Encoding and convention choices

These choices are acceptance conditions for every stage.

- **Manifolds are types with Mathlib instances.**  Use `TopologicalSpace`, separation and
  countability classes, `ChartedSpace`, `IsManifold`, compactness, and connectedness.  Carry
  orientation and framing data explicitly.  An orientation is the shared
  `Manifold.Orientation I M ι`, including its local chart compatibility; an arbitrary function
  from points to linear orientations is not an orientation.  Do not introduce a bundled manifold
  record whose fields assert these properties.  On a collared manifold, the boundary orientation
  is determined from the ambient orientation by the collar derivative and the outward-normal-first
  convention; an unrelated orientation on the boundary carrier is insufficient.
- **Geometric quotients use a small skeleton.**  A `SmoothAtlasCode n` consists of finitely many
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
  is generated by the inverse quotient charts with transition maps equal to those in the code.
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
  carrier.  The quotient group structure descends from geometric connected sum.
- **Stable groups are colimits of standard groups.**  Sphere stabilization is induced by
  suspension; stable `SO` is induced by block inclusion.  Both are literal colimits with
  canonical inclusions and their universal properties.  Transition maps, stable-range
  comparisons, products, and `J` commute by proved diagrams.  A family of abstract groups with
  the expected values is not an implementation.
- **Use classifying spaces for stable bundles.**  `BSO` is the stable oriented Grassmannian or
  the classifying space obtained from the stable principal `SO` object, with a universal bundle.
  Stable bundle equivalence is stabilization by trivial real bundles.  A stable framing is a
  chosen smooth vector-bundle equivalence
  `TM directSum epsilon^r ~= M times R^(n+r)`, not a proposition asserting that one exists and not
  a family of equivalences between fixed model spaces.  An honest framing similarly trivializes
  the actual tangent bundle.  Construct the source with Mathlib's canonical tangent bundle,
  `Bundle.Trivial`, and fibrewise bundle product; a framing must not carry replacement topology,
  `FiberBundle`, `VectorBundle`, or smooth-bundle instances for that source.
- **Tangent and normal framings are related by an embedding.**  For an embedding
  `M -> R^(n+k)`, prove `TM directSum nu ~= trivial` and make the tangent/normal framing
  correspondence independent of stabilization and isotopy.  Do not identify the two framings
  definitionally.
- **Stable and honest framings remain distinct.**  A cycle carrying only a trivialization after
  adding trivial summands is called stably framed or s-parallelizable.  The name
  `ParallelizableFilling` is used only after the relative destabilization theorem has produced
  an honest tangent trivialization compatible with the chosen boundary collar.
- **Pontryagin--Thom is constructed in both directions.**  The collapse map uses a chosen
  tubular neighbourhood and a normal framing; independence is a theorem.  The inverse uses
  smooth approximation, a regular value, and the induced framed submanifold.  The two bordisms
  witnessing inverse laws are required.  Collapse and Thom-space augmentation are continuous
  pointed maps with the collapsed complement and sphere basepoints displayed.  Pointed convenient
  spaces and maps use the under-category of `CompactlyGenerated`, the normal rank `k` is the
  codimension of the displayed embedding `M -> R^(n+k)`, the collapse is the map determined by the
  displayed tubular diffeomorphism, and the augmentation is the pointed Thom equivalence followed
  by the standard suspended augmentation.  Arbitrary maps satisfying only continuity and a
  basepoint equation are insufficient.
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

## Inventory: consume Mathlib and sibling roadmaps

The development starts from these current APIs and cited roadmap targets.

- `HomotopyGroup`, based cubes, `ContinuousMap.HomotopyEquiv`, pointed cones, suspensions,
  mapping cones, homotopy lifting, and fundamental groupoids.
- Singular homology, `TopPair`, Mathlib's CW-complex structures, metric spheres, and the
  algebraic-topology roadmap's relative Hurewicz, Whitehead, duality, and finite-CW-type results.
- `ModelWithCorners`, `ChartedSpace`, `IsManifold`, tangent bundles, smooth maps,
  `Diffeomorph`, and `exists_embedding_euclidean_of_compact`.
- `Matrix.orthogonalGroup`, `Matrix.specialOrthogonalGroup`, Lie groups, topological groups,
  vector bundles, pullbacks, direct sums, quotient spaces, `CompactlyGenerated.{u,w}`,
  categorical filtered colimits, and `AddCommGrpCat`.  Mathlib's compactly generated category
  does not yet supply the reflector or Cartesian closed API needed here; those are targets, not
  inferred instances.
- Geometric topology's boundary, collar, gluing, tubular-neighbourhood, connected-sum, handle,
  surgery, cobordism, and triangulation outputs, plus Heegaard Floer's orientation, degree,
  Morse, Sard, and transversality outputs.

These open Mathlib pull requests determine target shapes.  Consume declarations already present,
build the missing interface in Tau Ceti now in the same shape, and replace it by imports when it
lands.

- [mathlib4#35376](https://github.com/leanprover-community/mathlib4/pull/35376) develops
  `Manifold.Orientation`, orientability, orientation lifts, and degree.  Follow its orbit-quotient
  `OrientationLift` carrier and `orientationAt` accessor exactly; do not replace it with a local
  record of tangent-fibre choices.
- [mathlib4#31350](https://github.com/leanprover-community/mathlib4/pull/31350) proposes the
  collared bordism and boundary-identification shape consumed here through geometric topology.
- [mathlib4#28246](https://github.com/leanprover-community/mathlib4/pull/28246) proves simple
  connectivity of spheres above dimension one.
- [mathlib4#42435](https://github.com/leanprover-community/mathlib4/pull/42435) supplies the
  target direction for Kan-simplicial homotopy groups consumed through algebraic topology.

Mathlib's `Geometry/Manifold/PoincareConjecture.lean` supplies intended vocabulary, but
`ContinuousMap.HomotopyEquiv.NonemptyDiffeomorphSphere` does not carry the separation,
countability, and compactness hypotheses required by the smooth theorem.  Stage 10 proves a
correctly scoped result directly.

The consumer modules import the algebraic-topology modules containing the four declarations named
above and literally `#check` them before defining any homotopy-sphere target. The import gate is
part of the integration check: local substitutes, copied declarations, and a prose-only dependency
do not satisfy it. `Suggested.lean` names this gate without placing algebraic-topology declarations
in the homotopy-sphere namespace.

## Stage 1: h-cobordisms and the high-dimensional theorem

This stage consumes the shared geometric-topology and Heegaard-Floer foundations.

1. On the existing oriented collared-cobordism carrier, define `IsHCobordism W` by requiring
   both boundary inclusions to be homotopy equivalences.  Prove invariance under equivalence,
   reversal, composition, and boundary connected sum.  Prove that h-cobordism induces an
   equivalence relation on closed oriented manifolds.
2. From Morse functions on a compact cobordism, build a finite ordered handle decomposition.
   Prove independence under reordering of disjoint critical levels, creation/cancellation of a
   cancelling pair, and handle slides.  Identify attaching spheres, belt spheres, and their
   algebraic intersection matrices.
3. Prove handle trading in an h-cobordism: remove indices `0,1,n,n+1`, use relative homology and
   simple connectivity to put the remaining boundary operators into elementary form, and realize
   the elementary row and column operations by handle slides.
4. Prove the local Whitney move.  If two transverse intersections of opposite sign are joined by
   an embedded framed Whitney disc whose interior misses both submanifolds, construct an ambient
   isotopy removing the pair and prove its support and framing properties.
5. In a simply connected level manifold, construct the needed Whitney discs for complementary
   submanifolds of dimensions `p,q>=3`.  Prove the complement-connectivity and general-position
   lemmas used to make their interiors disjoint.
6. Treat the six-dimensional cobordism boundary case separately.  For index-two/index-three
   cancellation the level is five-dimensional and `(p,q)=(2,3)`.  State the complement
   fundamental-group hypothesis, construct piping arcs which kill the offending meridians,
   prove that handle trading gives those hypotheses for attaching and belt spheres, and only then
   construct the embedded framed Whitney disc.  The `p,q>=3` theorem does not cover this case.
7. Cancel adjacent handles and prove the simply connected smooth h-cobordism theorem for total
   dimension at least six.  Produce a diffeomorphism rel the incoming boundary with a product
   cobordism, and deduce an orientation-preserving diffeomorphism between the two boundaries.

Milnor, *Lectures on the h-Cobordism Theorem*, Chapters 2--8, is the proof spine: Morse handles,
algebraic simplification, Whitney discs, and cancellation occur in that order.  Smale,
*Generalized Poincare's Conjecture in Dimensions Greater Than Four*, supplies the simply
connected specialization and its smooth-recognition application.

## Stage 2: oriented homotopy spheres and `Theta_n`

1. Build the finite-atlas/handle skeleton fixed above and its realization functor.  Define an
   oriented smooth homotopy `n`-sphere code as a coded closed oriented smooth `n`-manifold with
   a homotopy equivalence to Mathlib's standard metric sphere.  Prove essential surjectivity for
   arbitrary `M : Type u`, code-change invariance, compactness, connectedness, simple
   connectivity for `n>=2`, integral homology, and finite CW type from the cited dependencies.
2. Instantiate geometric topology's connected sum on homotopy spheres.  Prove closure and descend
   its existing choice-independence, associativity, commutativity, sphere identity, and
   orientation laws to h-cobordism classes.
3. Construct the inverse cobordism: start from the punctured cylinder on `Sigma`, attach the
   standard connecting handle, and prove its outgoing boundary is
   `Sigma # (-Sigma)` while the incoming boundary is the standard sphere.  Orientation reversal
   alone is not the inverse proof.
4. Define `Theta_n` as the Type-0 quotient of coded oriented homotopy spheres by the geometric
   h-cobordism relation and give it an `AddCommGroup` structure for `n>=5`.  Supply the quotient
   constructor, induction principle, and lift theorem.  Prove that equality in `Theta_n` is
   equivalent to oriented diffeomorphism in this range by Stage 1 and that the class assigned to
   an arbitrary-universe manifold is independent of its small code.

Kervaire--Milnor, *Groups of Homotopy Spheres I*, Sections 1--2, fixes the definitions,
orientation conventions, connected-sum operation, and inverse argument.

## Stage 3: stable sphere homotopy, the James construction, and EHP

### 3A. Pointed constructions and stabilization

1. Complete Mathlib's `CompactlyGenerated.{u,w}` interface: construct the compact-generation
   reflector from `TopCat`, prove the adjunction and full faithfulness, define compactly
   generated products and compact-open exponentials, and prove the exponential law.  Develop
   pointed objects, based internal homs, and the required sequential colimits.  Prove comparison
   theorems with ordinary `TopCat` for CW complexes and locally compact Hausdorff sources.  All
   subsequent loop spaces, James constructions, stable classical groups, and classifying spaces use
   this one carrier.
2. Build reduced suspension, based loop space, smash product, mapping cone, cofiber sequences,
   and Puppe sequences in the same pointed category as the algebraic-topology roadmap's relative
   homotopy groups.  Prove the suspension--loop adjunction on maps and on pointed homotopy classes.
3. Define suspension homomorphisms on sphere homotopy groups and the stable stem as their
   sequential colimit in `AddCommGrpCat`.  Export its structure maps and universal property.
   Prove functoriality, composition products, graded-commutativity in the stable range, and
   independence of the starting representative.
4. Prove Freudenthal: for `n>=2`, suspension
   `pi_q(S^n) -> pi_(q+1)(S^(n+1))` is an isomorphism for `q<=2*n-2` and a surjection for
   `q=2*n-1`.  Deduce that the `k`th stem is represented by `pi_(n+k)(S^n)` for `n>=k+2`.

### 3B. James construction proof spine

1. Define the reduced product `J X` as finite words in a pointed space modulo deletion of the
   basepoint.  Define its word-length filtration `J_0 X subset J_1 X subset ...`, multiplication,
   unit `X -> J X`, functoriality, and compatibility with CW structures.
2. Identify each filtration quotient `J_r X / J_(r-1) X` with the `r`-fold smash power of `X`.
   Prove the attaching and connectivity estimates needed for passage to the union.
3. Construct the James map `J X -> Omega Sigma X` by concatenating the adjoints of suspended
   letters.  Prove it is multiplicative up to homotopy and induces the tensor-algebra
   isomorphism in reduced homology.
4. Prove the full connected James theorem.  Compute
   `pi_1(J X) -> pi_1(Omega Sigma X)`, construct the induced map of universal covers, and lift
   the word filtration to prove an integral homology isomorphism on those covers.  Apply the
   algebraic-topology roadmap's simply connected homological Whitehead theorem upstairs, then
   descend the equivariant homotopy inverse to obtain `J X ~=_h Omega Sigma X`.  Equivalently,
   one may prove the same argument through Whitehead with local coefficients, but ordinary
   homology alone is insufficient.  Include `X = S^1`, where both fundamental groups are
   `Z`, as a regression theorem.  This connected theorem supplies the low-dimensional EHP
   sequence.
5. Construct the James--Hopf map by sending a word to the ordered products of its length-two
   subwords.  Identify its adjoint on spheres and prove the fibre/connectivity statement needed
   for the EHP range.

### 3C. EHP and secondary composition

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

James, *Reduced Product Spaces*, Annals of Mathematics 62 (1955), Sections 1--6, supplies the
filtered reduced product and equivalence with `Omega Sigma X`.  Whitehead, *Elements of Homotopy
Theory*, Chapters VII--XI, supplies Freudenthal, Whitehead products, and EHP.  Toda,
*Composition Methods in Homotopy Groups of Spheres*, Chapters I--V, fixes compositions,
secondary operations, suspension sequences, and the low-stem calculation.

## Stage 4: stable `SO`, `BSO`, vector bundles, Bott periodicity, and `J`

### 4A. Stable orthogonal groups and classifying spaces

1. Define `O(r)` and `SO(r)` from Mathlib's matrix groups, their block inclusions into rank
   `r+1`, and stable `O` and `SO` as filtered colimits of topological groups internal to the
   compactly generated category.  Export the inclusions and colimit universal properties and
   compare their underlying spaces with the corresponding compactly generated colimits.  Use the
   sphere fibration `SO(r) -> SO(r+1) -> S^r` to prove the finite-to-stable comparison range on
   homotopy groups.
2. Construct finite oriented Grassmannians and their tautological bundles, stabilization by a
   trivial line, `BSO` as the compactly generated filtered colimit, and the universal stable
   oriented real bundle.  Prove `Omega BSO ~=_h SO` in the same pointed category, including
   components and basepoints.
3. Define stable isomorphism of oriented real vector bundles by adding trivial summands.  Over a
   finite CW complex `K`, construct mutually inverse maps between stable bundle classes and
   `[K,BSO]`; prove naturality under pullback, compatibility with Whitney sum, and homotopy
   invariance.
4. Prove that the classifying map is null exactly when a chosen stabilization is trivializable.
   Express this as existence of a stable framing and retain the chosen trivialization as data.
5. Prove `BSO` simply connected.  For `n>=2`, compare pointed and unpointed classes from `S^n`
   and construct the clutching equivalences
   `[S^n,BSO]_* ~= pi_n(BSO) ~= pi_(n-1)(SO)`.

Steenrod, *The Topology of Fibre Bundles*, Chapters 5--7 and 12, and Husemoller, *Fibre
Bundles*, Chapters 3--4 and 8--9, supply the universal-bundle and clutching proof spine.

### 4B. Full real Bott proof spine

1. Construct the stable homogeneous spaces and fibrations in the real Bott chain
   `BO x Z, O, O/U, U/Sp, BSp x Z, Sp, Sp/U, U/O`.  Identify base components and prove that the
   finite-dimensional inclusions induce equivalences in increasing connectivity ranges.
2. Construct the invariant metrics on the compact classical groups and homogeneous symmetric
   spaces.  Identify their geodesics, endpoint conditions, Jacobi fields, and conjugate points,
   and prove compatibility with the inclusions in matrix rank.
3. For an energy cutoff and a subdivision fine enough below that cutoff, construct the
   finite-dimensional manifold of broken geodesics.  Prove that geodesic interpolation gives a
   deformation equivalence with the corresponding path-space sublevel and that every compact
   family of paths enters one common approximation.  This is the comparison with the actual
   compactly generated path space; it is not supplied by finite-dimensional Morse theory.
4. Develop the required finite-dimensional Morse--Bott theorem.  For every critical manifold of
   the broken-geodesic energy, construct its normal Hessian, calculate index and nullity from
   Jacobi fields, prove nondegeneracy normal to the critical manifold, and identify the negative
   normal disc and sphere bundles.
5. Prove compactness of each finite approximation and the deformation lemma between critical
   values.  Attach the negative disc bundles at critical levels and prove compatibility as the
   subdivision and matrix rank increase.  No infinite-dimensional Palais--Smale assertion may
   replace these finite comparison theorems.
6. Derive the increasing-connectivity estimate for the inclusion of minimal geodesics.  State
   the index lower bound as an explicit function of matrix rank and show that all other critical
   attachments occur above that range.
7. Pass through the stable-range comparison and obtain the seven loop equivalences
   `Omega R_i ~= R_(i+1)` and the closing equivalence `Omega R_7 ~= R_0`, with components
   specified.  Compose them to prove eightfold real Bott periodicity.
8. Derive the stable homotopy table of `O` and `SO`, not merely its two desired entries.  Check
   `pi_0(O)=Z/2`, `pi_1(SO)=Z/2`, `pi_2(SO)=0`, `pi_3(SO)=Z`,
   `pi_4(SO)=pi_5(SO)=pi_6(SO)=0`, and `pi_7(SO)=Z`, with period eight.
9. Compare the topological Bott maps with the Clifford-module Bott classes supplied by the
   representation-theory roadmap.  This comparison prevents two unrelated periodicity APIs.

Bott, *The Stable Homotopy of the Classical Groups*, Annals of Mathematics 70 (1959),
Sections 2--8, is normative for the geodesic, index, and stable-loop argument.  Milnor,
*Morse Theory*, Chapter 24, supplies the path-space Morse-theory formulation.  The proof is not
complete if it omits the broken-geodesic comparison, Morse--Bott attachment, or
increasing-connectivity estimate, postulates the eight-periodic table, or proves only `pi_5` and
`pi_6` vanish.

### 4C. Stable `J`

1. From the action of `SO(r)` on `S^(r-1)`, construct the unstable clutching map into
   self-equivalences of the sphere and its adjoint homomorphism on homotopy groups.
2. Prove compatibility with block inclusion on `SO`, suspension on sphere maps, basepoint change,
   and composition.  Pass to colimits to define stable `J_n : pi_n(SO) -> pi_n^S`.
3. Identify `J` with the change in Pontryagin--Thom class caused by changing a stable framing by
   an element of `pi_n(SO)`.  Prove compatibility with the `BSO` clutching description.

## Stage 5: stable framings and Pontryagin--Thom

1. For a compact smooth manifold embedded in a sufficiently large Euclidean space, construct the
   stable normal bundle and prove `TM directSum nu ~= trivial`.  Give mutually inverse operations
   between stable tangent and stable normal framings; prove independence under adding trivial
   directions, isotopy of embeddings, and passage to a larger ambient Euclidean space.
2. Define framed bordism using the shared collared-cobordism carrier, with a stable normal framing
   product-compatible near each boundary collar.  Prove equivalence-relation and abelian-group
   laws under disjoint union, including orientation and framing reversal.
3. Construct one-point compactification of a vector bundle and its Thom space.  If the rank-`k`
   normal bundle `nu` of `M` is framed, prove the pointed equivalences
   `Th(nu) ~= M_+ smash S^k ~= Sigma^k M_+`, natural under pullback and stabilization.  It is not
   in general a sphere.
4. Choose a tubular neighbourhood and define the collapse map
   `S^(n+k) -> Th(nu)`.  Compose the framed Thom equivalence with the map
   `Sigma^k M_+ -> Sigma^k S^0 = S^k` induced by the augmentation `M_+ -> S^0`; this composite,
   not the Thom space alone, is the Pontryagin--Thom representative.  Prove continuity at the
   collapsed complement, independence under shrinking or changing the tubular neighbourhood,
   invariance under framed isotopy, and compatibility with disjoint union and stabilization.
5. For the inverse, apply relative smooth approximation to a stable sphere map, choose a regular
   value using Sard and transversality, and give its inverse image the induced compact smooth
   structure and stable normal framing.  Prove independence from approximation and regular value
   by a relative transverse homotopy.
6. Starting with a framed manifold, identify the regular-value inverse of the corrected composite
   `S^(n+k) -> Th(nu) -> S^k` with it by a framed bordism.  Starting with a stable map, identify
   the collapse composite of its inverse image with the original stable class by a homotopy.
   Prove these are natural inverse group homomorphisms.
7. Conclude Pontryagin--Thom `Omega_n^fr ~= pi_n^S` and prove product, suspension, boundary, and
   change-of-framing formulas, including the formula involving stable `J` from Stage 4C.

Pontryagin, *Smooth Manifolds and Their Applications in Homotopy Theory*, Chapter II §§1--4,
supplies the framed-manifold group, collapse construction, and suspension law.  Thom,
*Quelques propriétés globales des variétés différentiables*, Chapters I--II, supplies smooth
approximation and realization by submanifolds.  Kosinski, *Differential Manifolds*, Chapters
VIII--X, gives the modern Pontryagin--Thom proof.  Hirsch, *Differential Topology*, Chapters
2--4, supplies
approximation, transversality, embeddings, and tubular neighbourhoods.  Every independence
statement above is part of the theorem, not quotient-by-choice automation.

## Stage 6: almost-framed groups, geometric `P_n`, and the exact sequence

### 6A. Almost-framed bordism and comparison

1. Define a geometric almost-framed `n`-cycle as a closed oriented smooth manifold `M`, an
   embedded defect disc, and a stable tangent framing of the punctured manifold which is product-
   compatible near the new boundary.  Its source is smoothly diffeomorphic, as a manifold with
   boundary, to the standard closed disc; the ambient map is a smooth proper embedding with an
   interior and exterior smooth collar and non-surjective image.  A closed set merely homeomorphic
   to a ball is not enough.  Define bordisms using a properly embedded defect arc, its genuine
   tubular neighbourhood, and a stable framing off that neighbourhood whose endpoint pullbacks
   are the two displayed complement framings.
2. Prove independence of defect discs, collars, representatives, and stabilization.  Prove the
   bordism relation and connected-sum abelian-group laws; call the resulting exported group
   `AlmostFramedBordism n`.
3. Separately define the historical Kervaire--Milnor carrier: a closed oriented `n`-manifold with
   their stable normal frame field on the complement of one chosen top cell, modulo their
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

### 6B. Parallelizable fillings and comparison

1. Define a `StableFramedFillingCycle n` as a compact connected oriented smooth `n`-manifold whose
   boundary is identified orientation-preservingly with a homotopy `(n-1)`-sphere, together with a
   stable tangent framing product-compatible on a fixed collar.  Call this carrier stably framed
   or s-parallelizable, not parallelizable.  The boundary carrier is identified with the actual
   Mathlib boundary subtype of the filling, and the collar restricts at zero to that
   identification.  Pin it as a partial diffeomorphism with source `[0,1) × boundary`, open in the
   relative cylinder, and target the displayed open collar neighbourhood.  Construct the product
   framing only from the collar derivative, normal line, and boundary framing; product
   compatibility is equality with the ambient trivialization after pullback to that half-open
   source.  A construction allowed to return the ambient framing itself makes this condition
   circular and does not count.
2. Two cycles are equivalent when a framed cobordism with corners has horizontal boundary the
   two fillings and vertical boundary an oriented h-cobordism of their homotopy-sphere
   boundaries.  Prove equivalence and make boundary connected sum into an abelian-group operation.
3. Prove the relative destabilization theorem used here.  If `W^n` is compact and connected,
   `n>=6`, has nonempty boundary and a fixed collar, and its stable tangent framing is the product
   framing on that collar, choose a handle decomposition relative to the collar with no
   `n`-handles.  Its spine has dimension at most `n-1`; apply the stable-range injectivity of
   `BSO(n) -> BSO` (equivalently the bundle-cancellation argument of Kervaire--Milnor Lemmas
   3.4--3.5) relative to the collar.  Obtain an honest tangent trivialization whose stabilization
   is homotopic through global smooth bundle trivializations to the given framing relative to the
   collar.  Retain that relative homotopy as data on every historical honest `P_n` representative;
   an unrelated honest framing does not discharge the comparison.  State the converse by
   stabilization.
4. Separately encode Kervaire--Milnor's historical `P_n` cycles: their s-parallelizable compact
   `n`-manifolds with homotopy-sphere boundary, their stated relative cobordism relation, and their
   boundary-connected-sum operation.  Give the maps in both directions using the relative
   destabilization theorem, compare collar and corner conventions, prove both composites, and
   prove compatibility with addition, orientation reversal, and boundary.  Only then identify the
   convenient stable-filling quotient with `P_n`.

### 6C. Maps and exactness

1. Define the maps first on the convenient carriers: delete the defect-disc interior to obtain a
   stable filling, give a punctured homotopy sphere its canonical stable framing, and take the
   oriented boundary of a stable filling.  Descend them to the three quotients.  Prove every map
   is independent of choices and additive, then prove that the comparison isomorphisms from 6A
   and 6B make these maps commute with the historical `p`, `i`, and `b`.  Only after these diagrams
   commute write them as `p : A_n -> P_n`, `i : Theta_n -> A_n`, and
   `b : P_n -> Theta_(n-1)`.
2. Prove, map by map for `n>=6`, exactness of
   `... -> A_(n+1) -> P_(n+1) -> Theta_n -> A_n -> P_n -> Theta_(n-1) -> ...`.
   At each term, construct the geometric filling or cobordism witnessing the reverse inclusion
   from kernel to image.
3. Define `bP_(n+1)` as the subgroup of `Theta_n` represented by homotopy spheres bounding
   parallelizable manifolds.  Prove it is precisely the image of the boundary map and prove
   closure under connected sum and orientation reversal.

Kervaire--Milnor, Sections 3--6, is normative for `A_n`, `P_n`, the boundary subgroup, and the
exact sequence.  The comparison theorems are explicit targets because a locally convenient
defect-disc or collared model is not definitionally the historical model.

## Stage 7: Wall surgery and the obstruction calculation

This stage consumes geometric topology's surgery operation, AlgebraicTopology's relative
homology and duality, and Stages 4--6's framings and `P_n` cycles.

### 7A. Normal maps and surgery below the middle dimension

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

### 7B. Middle-dimensional algebra

1. On the remaining kernel construct the `epsilon`-symmetric intersection pairing and its
   quadratic refinement from framed self-intersections.  Prove nonsingularity, basis-change
   invariance, orthogonal-sum behavior, and invariance under normal bordism.
2. For `n=2*q`, define the even-dimensional obstruction carrier to be nonsingular
   `(-1)^q`-quadratic forms on finite free `Z`-modules, modulo isometry and hyperbolic
   stabilization.  Define its addition and inverse by orthogonal sum and sign reversal.
3. For `n=2*q+1`, define instead a `(-1)^q`-quadratic formation: the surgery kernel together with
   the two lagrangians coming from the two boundary/handle presentations.  Quotient formations by
   isomorphism, elementary modification, and hyperbolic stabilization.  Prove addition and inverse
   on this quotient.  Do not encode an odd obstruction as the Witt class of a form.
   In both parity branches the pairing and quadratic refinement are functions on the whole finite
   free module.  Their symmetry, polarization, scalar, nonsingularity, and parity laws are data;
   each displayed lagrangian is isotropic, a direct summand, equal to its orthogonal complement,
   and a zero locus for the quadratic refinement.  Define stable equivalence as the equivalence
   relation generated by form/formation isometries, addition of displayed hyperbolic summands, and
   explicit elementary transvections of the second lagrangian in the odd case.  The quotient may
   not use a freely chosen setoid.
4. Define `L_n(Z)` by the parity split above and prove that both presentations agree with Wall's
   simply connected surgery obstruction in their respective dimensions.
5. Prove the surgery obstruction vanishes exactly when the even-dimensional kernel has a
   lagrangian.  Realize a lagrangian by disjoint framed embedded spheres and perform middle-
   dimensional surgeries to turn the normal map into a homotopy equivalence.
6. In odd dimensions prove the corresponding zero criterion in terms of an elementary, stably
   hyperbolic formation and realize its elementary modifications geometrically.
7. Prove realization: in even dimensions plumb handles to realize a prescribed nonsingular
   quadratic kernel; in odd dimensions build a normal cobordism realizing a prescribed formation.
   Prove additivity and identify the trace decomposition with the relevant sum.
8. Compare the resulting obstruction on a geometric `P_n` cycle with Stage 6B's standard
   Kervaire--Milnor group.  Prove injectivity by completing a zero-obstruction filling to a framed
   cobordism and surjectivity by realization.

### 7C. Computation of the simply connected groups

1. In odd dimensions over the simply connected coefficient ring `Z`, prove every relevant
   quadratic formation is elementary after hyperbolic stabilization and obtain `P_n=0` for odd
   `n>=5`.
2. In dimension `4k`, identify the obstruction with the signature of the even unimodular middle
   form divided by eight.  Prove divisibility by eight, classify the Witt group, construct the
   `E_8` plumbing realization, and obtain `P_(4k) ~= Z` for `k>=2` with the stated normalization.
3. In dimension `4k+2`, classify nonsingular quadratic forms over `F_2` by Arf invariant, realize
   both classes geometrically, and obtain `P_(4k+2) ~= Z/2` for `k>=1`.
4. Prove that framed surgery on an almost-framed cycle produces precisely the class carried by
   `p : A_n -> P_n`.  Interior surgery is a trace cobordism, not an additional quotient relation.

Wall, *Surgery on Compact Manifolds*, 2nd ed., Chapters 2--6, is the source spine: normal maps,
surgery kernels, below-middle improvement, quadratic forms, realization, and the simply
connected obstruction calculation must appear in that order.  Kervaire--Milnor, Sections 5--8,
fixes the signature/8 and Arf normalizations and the plumbing representatives.  A citation to the
final `L`-group table does not replace this decomposition.

## Stage 8: the Kervaire--Milnor comparison with stable homotopy

1. Given an almost-framed cycle, use the framing off its defect disc and Pontryagin--Thom to
   define its stable sphere class.  Show that changing the extension over the disc changes the
   class by `im J`.
2. Prove the exact sequence
   `pi_n(SO) ->^J pi_n^S -> A_n -> pi_(n-1)(SO)` by identifying the last map with the obstruction
   to extending the stable framing.  Prove exactness directly at all four terms.
3. When the last `SO` group vanishes, identify `A_n` canonically with `coker J_n`.  Transport the
   Stage 6 exact segment through this isomorphism and identify both boundary images with the
   corresponding `bP` subgroups.
4. Define the Kervaire invariant on an almost-framed `(4k+2)`-manifold as the Arf invariant of
   the surgery-normalized middle-dimensional quadratic form.  Prove bordism invariance,
   compatibility with Pontryagin--Thom, and equality with the map from `coker J` to `P_(4k+2)`.

Kervaire--Milnor, Sections 3--6, is normative for the stable-framing obstruction sequence and
its comparison with `A_n`, `P_n`, and `Theta_n`.  Browder, §§1--3, supplies the framed Arf
invariant and its Pontryagin--Thom interpretation.

## Stage 9: explicit computation through the sixth stem and `Theta_6`

This stage is an explicit theorem chain.  None of the displayed groups may enter as an axiom or
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
   `pi_6^S ~= Z/2{nu^2}`.
4. Record the chain as one compatible table of groups, generators, and suspension maps for stems
   zero through six.  Each table entry links to the theorem calculating it; the table itself is
   generated documentation, not proof input.
5. Apply Pontryagin--Thom and a regular value to the normalized map above to obtain its framed
   six-manifold.  Construct a framed bordism from it to the capped two-vertex plumbing of two
   tangent `D^3`-bundles over `S^3`: prove that the plumbing boundary is a homotopy `5`-sphere,
   cap it using the Stage 6 comparison, and track the framing across the cap.  On the resulting
   closed manifold identify the two middle-dimensional generators `a,b`, prove their intersection
   matrix is the standard symplectic matrix, and calculate the framed quadratic refinement
   `q(a)=q(b)=1`.  Hence its Arf and Kervaire invariants are one.  Finally prove that this geometric
   class is the Pontryagin--Thom class of `nu_4 o Sigma^3(nu_4)` and that the comparison
   `coker(J_6) -> P_6` sends it to the nonzero Wall class.  Therefore
   `KI : pi_6^S -> Z/2` is an isomorphism.
6. Bott periodicity gives `pi_5(SO)=0` and `pi_6(SO)=0`.  Use Stage 8 to prove
   `A_6 ~= coker(J_6) ~= pi_6^S ~= Z/2`, with the comparison sending the framed `nu^2`
   representative to the nonzero class.
7. Stage 7 gives `P_7=0` and `P_6~=Z/2`; Stage 8 identifies the map
   `coker(J_6) -> P_6` with the Kervaire invariant, hence with an isomorphism.  In the exact
   segment
   `P_7 -> Theta_6 -> coker(J_6) -> P_6`, the left image `bP_7` is zero and the right kernel is
   zero.  Conclude `Theta_6=0`.

Toda, Chapters I--V, is normative for the unstable representative, its composition order, and
its stabilization in Steps 1--4.  Kervaire--Milnor, Sections 4--6, supplies the plumbing and the
comparison with `P_6`, while Browder, *The Kervaire Invariant of Framed Manifolds and its
Generalization*, supplies the framed quadratic refinement, Arf invariant, and Pontryagin--Thom
comparison.  The proof above explains how the cited table is reconstructed; importing the table
as unexplained data does not meet the roadmap.

## Stage 10: smooth recognition in dimension six

1. Let `M` be a compact Hausdorff second-countable boundaryless smooth six-manifold and
   `h : M ~=_h S^6`.  Use `h` to prove connectedness and simple connectivity and to transport a
   chosen generator of top integral homology to an orientation of `M`.
2. Apply the essential-surjectivity theorem of Stage 2 to choose a Type-0 finite-atlas code for
   `M`.  Map it into the literal quotient with `homotopySphereClassOf`, prove independence of the
   code, and regard the result as the oriented class of `M` in `Theta_6`.  From `Theta_6=0`,
   construct an oriented h-cobordism from `M` to the standard sphere.
3. Apply Stage 1's six-dimensional-boundary case of the h-cobordism theorem to obtain a
   diffeomorphism `e : M ~=_m S^6`.  Package orientation preservation as the equation saying that
   `e.deriv` sends the chosen `Manifold.Orientation` on `M` to the standard orientation on `S^6`.
   If the equation has the opposite sign, compose with a fixed coordinate reflection and prove
   the derivative equation for the composite.
4. State the direct reusable theorem with every topology, manifold, and orientation hypothesis
   visible and return the subtype consisting of a diffeomorphism together with that derivative
   equation.  State the un-oriented `Nonempty Diffeomorph` result only as a separate corollary
   obtained by forgetting the equation.

## Dependency order and parallel work

| Track | Depends on | Feeds |
| --- | --- | --- |
| 1 h-cobordism | geometric topology, Heegaard Floer, algebraic topology | 2, 10 |
| 2 small skeleton and `Theta_n` | 1, triangulation, geometric connected sum | 6, 9--10 |
| 3 James/EHP/stable stems | algebraic topology, compactly generated substrate | 5, 8--9 |
| 4 `SO`/`BSO`/Bott/`J` | compactly generated substrate, bundles, Lie groups | 5--6, 8--9 |
| 5 Pontryagin--Thom | 3--4, tubular neighbourhoods, transversality | 6, 8--9 |
| 6 `A_n`, `P_n`, exactness | 1--2, 4--5 | 7--9 |
| 7 Wall surgery | algebraic topology, geometric surgery, 4--6 | 8--9 |
| 8 stable comparison | 3--7 | 9 |
| 9 sixth-stem calculation | 3--8 | 10 |
| 10 smooth recognition | 1--2, 9 | endpoint |

Stages 1, 3, and 4 can begin independently against their cited foundations.  Stage 5 joins the
stable-homotopy and vector-bundle tracks.  The geometric `A_n`/`P_n` definitions and their
comparison with the historical Kervaire--Milnor models begin in Stage 6; the Wall comparison
occurs in Stage 7 after the obstruction groups and surgery theorem have been constructed.

## Acceptance checks

- The h-cobordism proof treats index-two/index-three cancellation in a six-dimensional
  cobordism by its own piping and complement-fundamental-group argument.
- `Sigma # (-Sigma)` is shown h-cobordant to the standard sphere by a constructed cobordism;
  orientation reversal is not merely declared to be an inverse.
- The geometric quotients use a Type-0 finite-atlas/handle skeleton, with essential surjectivity
  for arbitrary universes and invariance under changing the code; its source/target, groupoid,
  cover, cocycle, and separation laws are present in the actual code.
- `Suggested.lean` exposes the geometric h-cobordism witness relation, the literal
  `HomotopySphereClass` quotient and `Theta_n`, framed/almost-framed/stable-filling witness
  relations and quotients, the maps `Theta_n -> A_n -> P_n` and `P_(n+1) -> Theta_n`, exactness at
  the displayed segment, and the resulting `Theta_6 = 0`. None is represented by an arbitrary
  `AddCommGrpCat` with the intended answer hidden in its body.
- `J X ~= Omega Sigma X` is derived for every connected `X` using universal covers or local
  coefficients, and its `X=S^1` fundamental-group case is a regression theorem.  The EHP
  sequence follows from the resulting maps and connectivity theorem.
- All stable topology is formed in `CompactlyGenerated`, with the reflector, exponential law,
  and comparison theorems proved before James, loop-space, or Bott arguments use them.
- Bott periodicity supplies all eight stable `SO` congruence classes through loop equivalences.
  Its proof includes the broken-geodesic approximations, compact-family comparison, Morse--Bott
  Hessian and negative-bundle attachments, and increasing-connectivity estimate.  A proof of
  only `pi_5(SO)=pi_6(SO)=0` does not pass.
- The `BSO` classifier is natural for pullback and Whitney sum, and a zero class is equivalent to
  the existence of a chosen stable framing.
- Pontryagin--Thom identifies a framed rank-`k` Thom space with
  `M_+ smash S^k`, then uses the augmentation to obtain the map to `S^k`; it also includes
  continuous pointed collapse and augmentation maps, collapse-map independence, the regular-value
  inverse, both inverse bordisms, and the change-of-framing formula for stable `J`.
- The defect-disc model for `A_n` and the collared filling model for `P_n` are each proved
  isomorphic to the historical Kervaire--Milnor groups by explicit forward and inverse maps
  compatible with addition, boundary, and defect.  Stable and honest parallelizability are
  connected only by the stated relative destabilization theorem.  `P_n` is then proved
  isomorphic to the normalized simply connected Wall group, not defined to be it.
- Wall's obstruction theorem includes normal-map decomposition, below-middle surgery,
  even-dimensional whole-module quadratic forms, odd-dimensional formations with lawful
  lagrangian submodules, vanishing, realization, and group computation.
- The sixth-stem result records the intermediate stem-zero-through-six computations, the EHP
  maps, the normalized representative `nu_4 o Sigma^3(nu_4)`, its order, the plumbing comparison,
  and its nonzero Kervaire invariant.
- `Theta_6=0` refers to the geometric group of homotopy spheres and uses the proved maps
  `P_7 -> Theta_6 -> coker(J_6) -> P_6`.
- Smooth recognition concludes a diffeomorphism to Mathlib's standard metric sphere under
  explicit compactness, separation, countability, and manifold hypotheses, together with the
  derivative equation preserving `Manifold.Orientation`; the plain `Nonempty Diffeomorph`
  statement is a corollary.

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
- C. T. C. Wall, *Surgery on Compact Manifolds*, 2nd ed., AMS, 1999, Chapters 2--6.
- William Browder, [*The Kervaire Invariant of Framed Manifolds and its
  Generalization*](https://doi.org/10.2307/1970686), Annals of Mathematics 90 (1969), 157--186.

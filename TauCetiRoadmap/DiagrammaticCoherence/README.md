# Roadmap: diagrammatic coherence for monoidal categories and duality

**Summary.** Build on native monoidal categories, chosen duals and braid groups,
TemperleyLieb’s general monoidal presentations, PivotalSpherical’s structures
and the shared relative geometry of KhovanovHomology and GeometricTopology.
Construct free categories, independent geometric diagram categories and
evaluation functors, proving soundness, completeness and universal properties
for six structures:

| Structure | Geometric equality | Endpoint |
| --- | --- | --- |
| Monoidal | Planar isotopy of progressive diagrams | Joyal–Street; structural Mac Lane coherence as a specialization |
| Braided monoidal | Progressive spatial isotopy with front-facing coupons | Joyal–Street; the braid category on one object |
| Rigid (autonomous) | Planar isotopy with iterated-dual/winding data | Joyal–Street autonomous coherence |
| Pivotal | Planar isotopy with pivotal rotation of marked coupons | Freyd–Yetter pivotal coherence |
| Braided and pivotal | Projection-regular spatial isotopy with front-facing marked coupons | Freyd–Yetter braided-pivotal coherence |
| Ribbon (tortile) | Framed, oriented three-dimensional tangle isotopy | Shum coherence and the Reshetikhin–Turaev evaluation functor |

The programme includes arbitrary sets of object generators and arbitrary-arity
morphism generators, including zero inputs or outputs. The category-generated
and one-object cases are specializations with explicit comparison functors.
For every row, prove that the independently defined geometric category is free
for the stated structure, not just that selected pictures evaluate equally.

Suggested homes: `TauCeti/CategoryTheory/Monoidal/Diagram/` for syntax,
presentations and evaluations, and `TauCeti/Topology/Tangle/` for geometric
models and their generic-position proofs. Keep general geometric suppliers in
their existing manifold, embedding and isotopy namespaces. No linearity,
semisimplicity, field, dagger or finiteness-of-generators hypothesis is standing;
individual diagrams and expressions are finite.

## Scope and ownership

The six rows are the coherence endpoints. Symmetric/compact-closed coherence,
independent balanced or traced coherence, spherical graphical coherence,
Frobenius/surface-bordism presentations, higher categorical coherence and the
higher tangle hypothesis are outside this roadmap. Balanced/ribbon definitions
are consumed when constructing the last row; they are not extra coherence
endpoints. The finite-dimensional geometric machinery needed for these six
rows is in scope, with general dimension in the supplier statements and only
planar and three-dimensional diagram applications.

| Supplier or consumer | Boundary |
| --- | --- |
| Mathlib `CategoryTheory/Monoidal/Free/{Basic,Coherence}` | Consume `FreeMonoidalCategory`, `project`, and the proved thin structural category. Add arbitrary morphism generators and geometric models; do not reprove structural Mac Lane coherence behind new names. |
| Mathlib `CategoryTheory/Monoidal/{Functor,NaturalTransformation,Braided/*,Rigid/*}` | Consume strong monoidal functors, `NatTrans.IsMonoidal`, braidings, chosen duals, `ExactPairing` and mate maps. |
| [PivotalSpherical, Layers 0–2, 7 and 10](../PivotalSpherical/README.md) | Owns double duals, pivotal structures/functors, traces, representation-category rigidity, balanced/ribbon structures and their algebraic relationships. This roadmap owns their free constructions and graphical coherence. The functor-level compatibility of the Drinfeld comparison is constructed in Layer 0.3 here. |
| [GeometricTopology, Layers 1–4](../GeometricTopology/README.md) | Owns general manifold/embedding/isotopy foundations, knot presentations and braid groups. Its closed Reidemeister comparison is shared with Khovanov G. This roadmap constructs boundary- and coupon-labelled tangles and their Morse-word presentation against those same realization and isotopy definitions. |
| [KhovanovHomology, G](../KhovanovHomology/README.md#g-plane-geometry-relative-extension-and-smooth-link-comparison) | Owns the common finite-dimensional relative jet/multijet general-position floor, relative ambient extension and finite-labelled smooth projection/Reidemeister comparison. Consume these in their shared manifold namespaces, independent of Khovanov complexes. G0 adds strip/boundary/coupon adapters, height/progressive constraints and framing sections; the closed coupon-free specialization compares with G's supported plane-event words and GT's presentations. |
| [DifferentialGeometry, Layers 3 and 10.2](../DifferentialGeometry/README.md), [MorseTheory, M1 and M3](../MorseTheory/README.md) | Supply flows, Sard, Morse normal forms and approximation at their actual hypotheses, also used by Khovanov G's common floor. G0 constructs the diagram-specific normal forms and adapters. |
| [TemperleyLieb, Layer 2](../TemperleyLieb/README.md) | Owns the generic monoidal presentation/congruence construction. C0 pins its consumer interface and extends it to the other five structures, using one shared API in the general category-theory namespace. TL owns its matching diagrams, extra relations, linearization and special self-duality; its TL presentation is not a premise of free rigid or pivotal coherence. |
| [QuantumGroups, Q8](../QuantumGroups/README.md) | Its braided representation examples are consumers of the general evaluation theorem. No quantum-group construction is a premise of coherence. |

At the pins, Mathlib supplies the object-generated structural category, not a
category freely generated by arbitrary coupons. Tau Ceti supplies Artin braid
groups and smooth closed-link embeddings, not the collared, coupon-labelled,
framed tangle categories here. PivotalSpherical owns the pivotal and ribbon
structures absent at these pins; their free geometric models belong here.
TemperleyLieb Layer 2 owns the generic monoidal presentation, including its
strong-monoidal universal property. The other five presentation structures and
the functor-level Drinfeld compatibility are extensions owned here.

## Conventions

Object generators and coupon generators range over independent universes
Type u and Type v; target objects and morphisms have independent universes
as in `Category`. Only each diagram is finite, not the generating types.
There are no standing coefficient assumptions; scalar examples state their
field, and §8.2 states the commutative-ring and unit hypotheses it uses.

- Diagrams run from bottom to top; inputs and outputs are ordered left to
  right. `f ≫ g` means f below g. Tensor places the first factor on the left.
  Boundaries have fixed collars, positions and tangent/framing data, so
  stacking and juxtaposition are well defined up to the stated equivalence.
- In space use standard oriented coordinates `(x,y,z)`, height y and
  projection `(x,y,z)↦(x,y)`, with larger z over. A front-facing coupon is
  an oriented embedded two-cell whose projection remains an
  orientation-preserving embedding, including its marked ports. In C2
  require this throughout isotopy and retain lower input/upper output
  collars. In C5 impose the same front-facing condition, permitting in-plane
  rotations with the stated mate transport. This excludes a spatial full
  turn of a multiport coupon which would otherwise insert a double braid.
  C6 allows spatial coupon turns, carrying ribbon attachments and normals;
  its move theorem must account for edge-on projections and back views.
- Start with sets/types of generating objects and generating coupons. A
  coupon has ordered input and output lists/words, a marked reading corner
  and a source/target type. For duality signatures the types are formal
  tensor/unit/left-dual/right-dual expressions. No generating coupon
  equation is implicit. Presentations by additional typed equations are
  a subsequent congruence quotient in C0.
- Structural maps are associators, unitors, the appropriate braiding and
  inverses, evaluations/coevaluations, and pivotal/twist maps in the rows
  where those structures exist. A label on a rotated coupon is its specified
  mate, with the resulting boundary type. Rotation never changes a generator
  into an unrelated generator or imposes an equation on arbitrary labels.
- Rigid boundary normal forms use words of letters `(a,n)`, n∈ℤ. Right
  dual reverses the word and increases n by one; left dual reverses it and
  decreases n by one. Prove the normalization from formal dual expressions
  and its categorical comparison maps. Planar turning of a strand transports
  these labels; orientation alone does not encode iterated duals. In pivotal
  and ribbon normal forms use letters `(a,ε)`, ε∈ℤ/2, with the comparison
  supplied by the chosen pivotal structure, never by declaring `A=A**` in
  an arbitrary target.
- Pin the winding sign by the cup `η_(X,Xᘁ):𝟙→X⊗Xᘁ`: its left endpoint
  has level n and its right endpoint level n+1. Compare this convention
  with tangent turning in the chosen coordinates and with both cap formulas.
- Smooth progressive means the height derivative is strictly positive in
  each directed edge parameter, including its fixed endpoint collars. For a
  compact parameter family of finite compact edges this continuous derivative
  has a common positive lower bound. The PL version has positive slope on each
  segment. Planar and progressive isotopies retain these conditions. Define
  C5's geometric regular equivalence independently: spatial isotopies of
  embeddings for which each edge's plane projection stays an immersion
  and every coupon stays front-facing, relative to the boundary collars.
  This permits tangencies of distinct projected branches and triple points,
  but excludes projected cusps. Prove that its generic events give exactly
  planar deformations, Morse-height changes, Reidemeister II/III and
  coupon-sliding/mate moves. Neither an R1 deletion nor loss of turning data
  is built into this equivalence. The generating-move theorem is G0/C5's
  target, not its definition.
- Framed tangles in C6 are oriented one-manifolds with a nonzero normal
  vector field up to the appropriate relative homotopy, equivalently thin
  ribbons with marked coupons. A positive ribbon twist is θ, and a negative
  twist is θ⁻¹, with the normal-field and crossing witnesses of Layer 1.4.
  The ribbon-element convention of an algebra example may be its inverse and is compared by a theorem, not a notational identification.
- Geometric equivalence is defined by relative isotopies of the actual
  embeddings/coupon ribbons. Combinatorial equivalence is generated by an
  independently stated, typed list of local moves. Neither is defined by
  equality of evaluations or by derivability from categorical axioms.
- Freeness uses strong structure-preserving functors into arbitrary,
  possibly non-strict targets. State an equivalence of groupoids between
  such functors with monoidal natural isomorphisms and interpretations of
  the signature with objectwise isomorphisms commuting with coupons.
  Prove extension computation rules and uniqueness up to the resulting
  coherent isomorphism. Strict targets/strict functors are separate
  specializations, not standing hypotheses.

## Exact supplier contracts

**From Mathlib.** In `Mathlib/CategoryTheory/Monoidal/Free/Basic.lean`,
`CategoryTheory.FreeMonoidalCategory.projectObj` and
`CategoryTheory.FreeMonoidalCategory.project` interpret structural objects and
arrows in any monoidal category; `FreeMonoidalCategory.subsingleton_hom` in
`Mathlib/CategoryTheory/Monoidal/Free/Coherence.lean` concerns only that
object-generated category. Use `Functor.Monoidal` from
`Mathlib/CategoryTheory/Monoidal/Functor.lean`, `Functor.Braided` from
`Mathlib/CategoryTheory/Monoidal/Braided/Basic.lean` and `NatTrans.IsMonoidal`
from `Mathlib/CategoryTheory/Monoidal/NaturalTransformation.lean` for strong
functors and their transformations. Use `ExactPairing`, `rightAdjointMate`,
`leftAdjointMate` from `Mathlib/CategoryTheory/Monoidal/Rigid/Basic.lean`, and
`rightDualFunctor`, `leftDualFunctor` from
`Mathlib/CategoryTheory/Monoidal/Rigid/Functor.lean`, with their actual
opposite and monoidal-opposite codomains. No strict target is assumed.

**From Tau Ceti.** `TauCeti.BraidGroup`, `TauCeti.BraidGroup.sigma`,
`TauCeti.BraidGroup.exponentSum_sigma` in
`TauCeti/GroupTheory/SpecificGroups/Braid/Basic.lean` and
`TauCeti.BraidWord.toBraid_append` in
`TauCeti/GroupTheory/SpecificGroups/Braid/Word.lean` fix the Artin generators
and multiplication order. `TauCeti.BraidWord.overPair_closure` and
`TauCeti.BraidWord.crossingSign_closure` in
`TauCeti/KnotTheory/BraidWord/PDCode.lean` send a positive letter to a
left-input-over crossing of sign +1. `TauCeti.SmoothLinkEmbedding` in
`TauCeti/KnotTheory/SmoothLink/Basic.lean` is a finite family of disjoint
smooth circle embeddings. `SmoothEmbedding.SmoothAmbientIsotopic` in
`TauCeti/Geometry/Manifold/SmoothEmbedding/SmoothAmbientIsotopy/Basic.lean`
provides ambient transport; Layer 1 adds the stated relative constraints.

**From TauCetiRoadmap.TemperleyLieb.** Layer 2's “Monoidal presentations
(reusable infrastructure)” supplies tensor-word generators, typed congruence,
the presented monoidal category and its universal property for strong
monoidal functors into non-strict targets. Its additional circle-centrality
relation for Temperley–Lieb diagrams is not a relation of our free categories.

**From TauCetiRoadmap.PivotalSpherical.** Layers 0–2 supply dual comparisons,
double duals, pivotal structures and functors, and the two traces; Layer 7
supplies rigidity of finite-dimensional representations. Layer 10's “central
equivalence” fixes the braid/pivotal-to-twist formula and its inverse, and its
ribbon node imposes dual compatibility. Layer 0.3 below proves this formula's
compatibility with strong braided functors, including its functor groupoids.

**From TauCetiRoadmap.GeometricTopology.** Layers 1–2 supply collars,
tubular neighborhoods, gluing and locally flat embeddings. Layer 3 supplies
the smooth-family map to diffeomorphisms of a compact manifold; Layer 4
supplies geometric knot presentations. Use only finite-dimensional smooth/PL
cases with the boundary and local-flatness hypotheses specified there.

**From TauCetiRoadmap.KhovanovHomology.** Section G's common relative
finite-dimensional jet/multijet floor supplies submersive evaluation and
generic parameters. Its ambient-extension target retains compact parameter
families, fixed open germs, common compact spatial support and finite-time
confinement; its finite-labelled smooth link comparison supplies the closed,
coupon-free specialization. Our Layer 1 constructs the additional collared
edge/coupon/framing adapters against that same API.

**From TauCetiRoadmap.DifferentialGeometry and TauCetiRoadmap.MorseTheory.**
DifferentialGeometry §§3.2, 3.3, 3.5 and 10.2 supply maximal/time-dependent
flows and Sard with their finite-dimensional hypotheses. MorseTheory M1 and
M3 supply nondegenerate normal forms and relative Morse approximation.
One-parameter birth/death and coupon normal forms are Layer 1 targets here.

## How to read the build

Layer 0 supplies the algebraic presentations and functor comparisons; Layer 1
supplies independent geometry and its relative presentation machinery.
Layers 2–7 prove the six coherence endpoints in order: monoidal, braided,
rigid, pivotal, braided-pivotal and ribbon. Layer 8 assembles evaluation,
closure and scalar normalization from those results. The labels C0, G0 and
C1–C7 name these same layers. The geometric carriers and several supplier
structures are not expressible at the pins by a few simple definitions;
`Suggested.lean` records the missing carriers separately for every headline,
without replacing a geometric theorem by a syntax lemma.

## Layer 0: signatures, syntax, congruences and interpretations (C0)

### 0.1 Signatures and structural extensions

Construct tensor signatures and their maps, with explicit object and coupon
carriers, ordered ports, empty boundary words and source/target functions.
Construct the appropriate formal object expressions and typed raw morphism
expressions for each of the six rows. Reuse the native object-generated
structural syntax, or compare an equivalent word-normalized presentation to
it. Include substitution of a diagram/expression into a coupon, renaming,
composition, tensor, identities and all relevant structural operations.
Prove typing, associativity of substitution and its unit laws; do not silently
turn a tensor-signature generator `A⊗B→C` into a unary generator on an
independent atom named `A⊗B`.

The signature and expression API includes:

- A signature map transports each coupon's ordered source and target words,
  including the empty word, and commutes with substitution.
- Substitution preserves types, composes associatively and has identity
  substitution as a two-sided unit; each structural operation commutes with it.
- Object normalization has comparison isomorphisms compatible with tensor and
  unit; the dual extensions reverse tensor order and preserve integer levels.

**Checks.**

- With no object or coupon generators, the empty word interprets as the unit;
  its structural identity evaluates to 1, not to a nonexistent strand.
- A coupon with boundary (A,B) → (C) has two inputs and one output; regarding
  (A,B) as one new atom would change the input port count from 2 to 1.
- Over finite-dimensional ℚ-vector spaces, a nullary coupon labelled 2 has
  source and target the unit and value 2; an empty diagram has value 1.

*Needs:* Mathlib structural objects and monoidal functors;
TemperleyLieb Layer 2's monoidal presentation; PivotalSpherical Layers 0–1
and 10 for the dual/pivotal/ribbon extensions. The tensor-signature scope is
Joyal–Street I, Theorems 1.2 and 3.7; the extra duality signatures are the
extension specified after Layer 8 (Selinger §§4.1–4.7).

### 0.2 Congruences and quotients

Consume TemperleyLieb Layer 2's generic presented-monoidal-category
construction for the monoidal case. Extend its shared contract to the other
five structures. Construct the least typed congruence generated by a
specified family of equations,
closed under composition/tensor, mates and the structural operations available
in that row. Give induction, substitution and quotient universal properties,
and construct the actual quotient category with its required structure.
Separate the raw syntax, the categorical-axiom quotient, and the quotient by
extra user equations. Use this one shared presented-category construction;
algebraic tensor ideals are TL's linear analogue, not an assumption here.

The extended congruence API includes:

- Given typed extra equations, the least compatible relation contains those
  equations and admits induction by reflexivity, symmetry, transitivity and
  the available operations; only the chosen structure's equations are imposed.
- A structure-preserving interpretation descends exactly when it respects the
  specified equations; quotienting twice agrees with adjoining both families.
- Substitution descends when it sends each defining equation to an equation
  in the receiving congruence, and the resulting quotient functor preserves
  the specified structure.

**Checks.**

- In the monoidal row, two nullary generators evaluated as 2 and 3 over ℚ
  remain different with no extra relation: their values differ by 1.
- Adding the equation that these two generators agree excludes that
  interpretation, since 2 ≠ 3; it does not assert 2 = 3 in every target.
- In the braided row the inverse pair has exponent sum 1−1 = 0 and equals
  the identity; two positive crossings have exponent 2 and are not identified
  with the identity of exponent 0.

*Needs:* §0.1; TemperleyLieb Layer 2's congruence and quotient universal
property; the axioms of the selected structure (Selinger §§3.1, 3.3, 4.1,
4.2, 4.6, 4.7).

### 0.3 Interpretations and Drinfeld compatibility

Construct interpretations and their extension to raw terms using native
`Functor.Monoidal`, `Functor.Braided` and the rigid/pivotal/ribbon preservation
comparisons. For rigid functors consume PivotalSpherical Layers 0–1’s chosen-dual
comparison from the image `ExactPairing`, with its naturality, tensor/unit
and mate compatibility; extend its iterated-dual use to these presentations.
For ribbon functors add preservation of the twist; reuse
PivotalSpherical's pivotal-functor API. Define composition of interpretations,
change of signature and the monoidal natural isomorphisms between extensions.
Prove soundness for each axiom and additional relation. Establish the
algebraic free/universal property before comparing to geometric diagrams.
For a strong braided functor F between rigid braided categories, let
δ_X : F(X*) ≅ (FX)* be its canonical chosen-right-dual comparison. The
induced bidual comparison is
κ_X = δ_(X*) ≫ ((δ_X)*)⁻¹ : F(X**) ≅ (FX)**.
Let b_X : X** ≅ X be the curl comparison in PivotalSpherical Layer 10's
central equivalence (the factor after the pivotal map in its equation (3)),
and write u_X = b_X⁻¹ : X ≅ X**. Construct the natural comparison κ and
prove the equation F(u_X) ≫ κ_X = u_(FX), with both sides maps
FX → (FX)**. Equivalently, F(b_X) = κ_X ≫ b_(FX).
Prove this directly from the pairing-preservation equations, braided
naturality and the formula for b, without presupposing geometric coherence.
For corresponding pivotal structures j and twists θ_X = j_X ≫ b_X,
deduce F(θ_X) = θ_(FX) if and only if F(j_X) ≫ κ_X = j_(FX).
Establish compatibility with identity and composite functors and monoidal
natural isomorphisms, giving the equivalence of twist-preserving and
pivotal-preserving braided functor groupoids used in Layer 7. The structural
equivalence is PivotalSpherical Layer 10's; this functor-level extension is
a target here, not an assumed declaration.

The interpretation and comparison API includes:

- Extension preserves composition and tensor using the target's actual strong
  constraints, and evaluates each generator at its assigned morphism.
- The chosen-dual comparison preserves both evaluation and coevaluation;
  these equations determine it uniquely and imply the mate comparison.
- For composable strong braided functors F and G, bidual comparisons obey
  κ_(GF),X = G(κ_F,X) ≫ κ_G,FX; identity comparisons are identities.
  Monoidal natural isomorphisms commute with these comparisons, so restriction
  and extension give inverse equivalences on the interpretation groupoids.

**Checks.**

- For the identity functor on finite-dimensional vector spaces with the same
  dual choices, δ and κ are identities; on ℚ² both Drinfeld paths send the
  vector (2,3) to the functional φ ↦ 2φ(e₁)+3φ(e₂).
- For the identity underlying functor between two choices of duality on
  tagged one-dimensional vector spaces, let source pairing scalars be 1
  and target pairing scalars at X and X* be 2 and 3, with reciprocal
  coevaluations. Then δ_X=1/2, δ_(X*)=1/3, κ_X=2/3 and u_(FX)=2/3.
  Both Drinfeld paths have value 2/3; omitting the inverse dual comparison
  would instead give 1/6. Also κ_X b_(FX)=(2/3)(3/2)=1=F(b_X).
- On the unit, both paths in the Drinfeld equation have scalar value 1;
  replacing κ by twice the identity would give 2 on the left and 1 on the right.
- In the symmetric representation category with central order-three pivotal
  modification, the identity functor from the standard to the modified
  structure has F(j_χ)=1, j_(Fχ)=ω and F(θ_χ)=1, θ_(Fχ)=ω. Both preservation
  conditions fail, whereas they both hold for identity between equal choices.

*Needs:* §§0.1–0.2; Mathlib `ExactPairing` and braided strong functors;
PivotalSpherical Layers 0–1 for chosen dual and pivotal functor comparisons
and Layer 10's central equivalence with its fixed curl formula.

### Examples

Unary generators with the relations of a category recover the
category-generated case. A coupon A⊗B → 𝟙 still has two ports, and a
nullary coupon still carries its label after word normalization.

### Dependencies

Mathlib monoidal, braided and rigid APIs; TemperleyLieb Layer 2;
PivotalSpherical Layers 0–2 and 10. No geometric coherence theorem is an
input to the algebraic comparison.

## Layer 1: geometric diagrams, gluing and generic presentations (G0)

### 1.1 Finite diagrams

Construct finite directed incidence data with
ordered coupon ports, boundary vertices, interval edges and vertex-free
circle components. Allow disconnected diagrams, the empty diagram and
coupons of every finite arity. Labels/turning/framing are extra data on this
same incidence carrier. Construct planar and spatial realizations by embedded
edges and disjoint marked coupons, with collared attachment maps and no
unintended intersections. Supply reparameterization, finite relabelling,
restriction to a subrectangle, rescaling, insertion and gluing. Prove
associativity and unit/tensor/interchange laws geometrically; where the
representatives differ by collar/rescaling choices, construct the relative
isotopies. Define each diagram category on the resulting quotient, without
using a coherence theorem as its construction.

For incidence data, the API includes restriction to a union of whole cells,
finite relabelling with transported port order, disjoint union, and matching
boundary-port gluing. Realization sends each edge to an embedded interval or
circle and each coupon to an embedded marked disk, and commutes with these
operations when their collars match. Gluing includes subdivision invariance,
associativity up to relative isotopy and interchange for disjoint rectangles.

**Checks.**

- Incidence: the empty diagram has 0 edges and 0 coupons; a nullary coupon
  has 0 ports and 1 coupon; a vertex-free circle has 1 circular edge and 0
  vertices. Thus none of these three objects is silently discarded.
- Realization: the empty image is empty; the nullary coupon is one labelled
  disk (evaluation 2 for label 2 over ℚ); a vertex-free unit circle has
  radius 1 and one component, even though it has no vertices.
- Gluing: stacking two identity intervals yields one interval after
  subdivision suppression; juxtaposing them gives two components; gluing
  with an empty boundary diagram leaves the component count unchanged.

*Needs:* §0.1 for labels; GeometricTopology Layers 1–2 for collars and
embedding/gluing carriers. Joyal–Street I, Theorems 1.2 and 3.7, concern
progressive tensor diagrams; Reshetikhin–Turaev §4.2, pp.8–9, gives the
ribbon-graph model. The combined collared realization and its comparisons
are targets here.

For projection movies use small flat coupons with affine oriented frames.
Prove a relative shrinking/flattening comparison with embedded coupon
two-cells, including attachment germs and parameter families, preserving
the front-facing condition in C2/C5 and the ribbon normals in C6. In this
normal form a generic C6 edge-on coupon event is an isolated rank drop of
its affine projection; do not assume that an arbitrary curved surface has
only isolated singular projection times.

The coupon normalization target retains finite ordered ports, a reading
corner and chosen parameterizations of the coupon disks. For a compact
smooth family and a subfamily already in flat normal form, construct a
relative deformation to small affine coupons, transporting attachment germs
and preserving external boundary collars. Keep the subfamily fixed.
Construct the port-compatible local disk charts, controlled shrinkings and
extension of their velocity to adjacent edge collars as intermediate targets;
then apply the shared ambient extension. Prove independence of the radius,
charts and shrinking choices up to the same relative isotopy. The
front-facing version uses graph charts over the projection plane and
positive projected Jacobian; the ribbon version transports the normal field.
This is the relative-family extension of the rigid-rectangle reduction in
Reshetikhin–Turaev's proof of Lemma 5.3, p.15, not a theorem about arbitrary
surface projections supplied by that lemma.

Its API preserves the incidence, boundary words, coupon labels and normal
homotopy classes, commutes with gluing away from the normalization support,
and supplies comparison isotopies between any two choices.

**Checks.**

- An already flat square with affine derivative diag(1,1) has determinant
  1; its relative normalization can be the identity with four corner images
  unchanged, instead of imposing an unnecessary motion.
- For the graph (x,y,ε(x²+y²)) on a unit disk, vertical flattening gives
  height (1−t)ε(x²+y²); the projected Jacobian is 1 for every t, so it stays
  front-facing and the marked center stays (0,0,0).
- A rotating affine coupon has projected determinant cos(πt): values 1, 0,
  −1 at t=0, 1/2, 1. The middle value is an edge-on event in C6 and excludes
  the entire path from C2/C5's front-facing isotopies.

*Needs:* §1.1 incidence and realization; GeometricTopology Layer 1's collars
and tubular neighborhoods; KhovanovHomology G's relative ambient extension,
with its fixed-germ, support and confinement hypotheses.

### 1.2 Smooth and PL comparison

Restrict this comparison to finite
edge/coupon diagrams in ℝ² and ℝ³. Use PL realizations to obtain finite
piecewise linear pictures and smooth collared realizations for generic
projection. Prove relative approximation/smoothing, invariance under
subdivision and independence of the smoothing choice, including one-parameter
families and marked coupons. Consume GT's general embedding/isotopy and
extension statements; construct any additional boundary/coupon-relative
version needed here in their general namespaces. For compact source and
fixed collars, prove the needed C¹-openness estimates so perturbations stay
embeddings, keep disjoint coupons and preserve nonzero framings. A generic
map of the trace need not remain level preserving: prove that the chosen
perturbations give a family of embeddings, not merely an embedded cobordism.
Use Khovanov G's relative ambient extension; add the boundary/coupon and
framing adapters, retaining its fixed-germ, compact-support and confinement
hypotheses. Do not rebuild its general flow/extension construction.

For the relative smooth–PL bridge, build subdivision-compatible polygonal
approximation of each edge inside disjoint tubular neighborhoods, keeping
collar germs fixed, and relative smoothing of its finitely many corners.
After coupon normalization, retain affine coupons and smooth their incident
edge collars compatibly. For a compact one-parameter family subdivide the
parameter interval into finitely many neighborhoods on which these choices
are controlled; compare choices on overlaps by small relative isotopies.
Construct the same comparison between two smoothings. Ambient extension is
applied to these families of embeddings with unchanged evolution parameter.
This route supplies the coupon/boundary extension: Roseman Proposition 8.1,
p.309, is about closed 1-manifolds and their generic projections, while
KhovanovHomology G supplies the labelled closed-link polygonal–smooth bridge.
Neither alone supplies this relative diagram statement.

The comparison API preserves port order and framing homotopy class, commutes
with subdivision and collared gluing up to the specified relative isotopies,
and induces mutually inverse smooth/PL diagram-category equivalences.

**Checks.**

- Subdividing a straight interval at 1/2 changes its edge count from 1 to 2
  but its image and endpoints remain [0,1] and {0,1}; smoothing yields the
  same single interval up to subdivision comparison.
- For two disjoint compact pieces at distance 1, individual displacement
  less than 1/4 leaves their distance greater than 1/2. For a framing of
  minimum norm 1, normal-section error less than 1/2 leaves norm greater
  than 1/2; zero separation or zero framing has no such guarantee.
- A circle has boundary cardinality 0 and fits Roseman's closed-source
  hypothesis. An interval with one coupon has 2 external endpoints and a
  marked two-cell: its required relative comparison is supplied here.

*Needs:* §1.1; KhovanovHomology G's polygonal–smooth and ambient-extension
targets; GeometricTopology Layers 1–2. Retain compact source/family, fixed
collars, smooth endpoints and locally flat PL realizations.

### 1.3 Jets and generic families

Consume Khovanov G's common finite-order
jet/multijet evaluation, polynomial/bump interpolation, incidence/Sard/Baire
and relative configuration-space machinery. Extend that same API with the
chart-change and prescribed-collar interfaces for smooth maps of
finite-dimensional manifolds needed here. Keep its supplier statements in
general finite dimension; specialize only the diagram strata to edges and
coupons in ℝ²/ℝ³. This is an extension of one shared general-position floor,
not another transversality development. Retain its submersion, regularity,
fixed-germ and compactness hypotheses.

Construct the new adapters: strips with collared endpoints, finite embedded
coupon two-cells with corners and attachment germs, progressive/height
constraints, front-facing constraints and nonzero normal sections. Prove
perturbation extension for these constraints, and show that their allowed
families are open in the relative C¹ topology: on each compact family use
positive lower bounds for directed height derivatives, projected coupon
Jacobian determinants and framing lengths, together with uniform embedding
and disjointness neighborhoods. If the height lower bound is m > 0, a
height-derivative error less than m/2 leaves derivative greater than m/2.
The claim concerns derivative-positive progressive edges, not merely
strictly monotone height functions. For a parameter manifold P
and s distinct source points of a d-dimensional source, use the
same-parameter multijet domain of dimension `dim P+s*d`; apply that count
to the specified bad stratum. For mixed edge/coupon configurations replace
s*d by the sum of the source-stratum dimensions. Distinguish jet-space
codimension from presentation-space codimension, and total from spatial
jets when an event needs parameter derivatives.

Specialize to compact one-parameter families of the diagrams in the table,
relative to endpoint presentations. Prove they have finitely many exceptional
parameters with one permitted local event each. Establish local finiteness,
including near configuration diagonals, before using compactness to conclude
finiteness. Build the normal forms for a height birth/death, exchange of
feature heights, projected cusp, double-point tangency, triple point and
coupon/strand projection interactions, planar coupon rotations and, only
in C6, edge-on coupon/back-view transitions; prove all more-degenerate or
simultaneous events can be avoided under the relevant constraints. For
ordinary projected curves the three Reidemeister events have, respectively,
zero planar derivative at one point, tangency of two distinct projected
branches and coincidence of three distinct projected points. Framings,
progressiveness and rigid winding may forbid or modify some of these events;
each row below specifies its admissible event list.

The constraint-adapter API provides restriction and gluing of fixed collar
germs, perturbations supported away from those germs, and uniform bounds
for the derivative-positive, front-facing, embedded and normally framed
subspaces. Generic replacements exist relative to endpoints already in the
required generic presentation. The extension of KhovanovHomology G to these
stratified diagram configurations is an owned target here; Golubitsky–Guillemin,
Chapter II §4, Theorem 4.13, is the general multijet-transversality input,
not the relative coupon statement. Roseman §§3–7 and Proposition 8.1,
p.309, supply the closed-knot event method and its curve specialization.

**Checks.**

- The arc (0,s) has height derivative 1. A perturbation of derivative norm
  less than 1/2 keeps height derivative above 1/2. The embedded cubic arc
  (s,s³) instead has minimum height derivative 0; replacing its height by
  s³−εs gives derivative −ε at 0 for every ε>0. A cutoff supported away
  from the endpoints preserves collars, so even strict monotonicity is an
  invalid substitute for the positive-derivative hypothesis.
- For a one-parameter family of edges, the distinct two-point configuration
  has dimension 1+2=3, not 2(1+1)=4. Equality of the two planar values has
  codimension 2; adding tangency gives total codimension 3 and isolated
  generic events. Three projected values have configuration dimension 4
  and equality codimension 4, again giving isolated generic events.
- The height family s³−ts has no critical points for t<0 and two for t>0,
  at s=±√(t/3); at t=3 their heights are −2 and 2. At t=0 the derivative
  and second derivative vanish at 0 but the third derivative is 6. This
  birth/death is allowed in the non-progressive rows and excluded in C1/C2.
- The times 1/n are infinitely many isolated points in (0,1] and accumulate
  at 0; their inclusion in a compact interval does not make them finite.
  The event theorem must supply local finiteness also at collisions and
  endpoints before compactness yields a finite subdivision.

*Needs:* §§1.1–1.2; KhovanovHomology G's fixed-order jet interpolation,
submersive evaluation, incidence/Baire and relative extension targets;
DifferentialGeometry §10.2 and MorseTheory M1, M3. All diagrams and
parameter families in this application are compact and smooth.

### 1.4 Typed local move templates

Fix the positive crossing of two
upward strands by their paths `(−cos(πt),t,sin(πt))` and
`(cos(πt),t,−sin(πt))`, 0≤t≤1, in the coordinates above;
smooth/rescale to the fixed collars. The left input goes over. Compare its
right-handed sign with Khovanov G and GT's crossing conventions. With input
`A⊗B`, depth reversal represents `c_(B,A)⁻¹`; the inverse of
`c_(A,B)` instead has input `B⊗A`. Prove that the θ curl has framing +1
in this convention and that the inverse curl has framing −1.
Define local replacements by gluing the following port-labelled primitive
pictures into a collared rectangle, with the listed boundary words. The
expressions specify the port connections; suppressed associators/unitors
are the native structural comparisons, not extra generators to guess.

| Move family | Typed template and availability |
| --- | --- |
| Independent features | `(f⊗id) ≫ (id⊗g) = (id⊗g) ≫ (f⊗id)`; tensor/interchange with the indicated disjoint ports, in every row. |
| Rebracketing and empty ports | Native associator/unitor pictures and their coherence; in every row. |
| Crossing inverse | `c_(A,B) ≫ c_(A,B)⁻¹ = id` and its other composite; C2, C5, C6. The second crossing is not `c_(B,A)`. |
| Triple crossing and cables | Yang–Baxter on `A⊗B⊗C`, both hexagon cable expansions, and unit crossings; C2, C5, C6. |
| Naturality past crossing | `(f⊗g) ≫ c_(A',B') = c_(A,B) ≫ (g⊗f)` for any available `f:A→A'`, `g:B→B'`, including cups, caps and twists when defined; endpoints can be tensor words or the unit; C2, C5, C6. |
| Extrema cancellation | The two snake pictures for each `ExactPairing A B`, with `η:𝟙→A⊗B`, `ε:B⊗A→𝟙`; C3–C6, retaining winding labels in C3. |
| Coupon through bend | Mate slides, e.g. `(id_(B*)⊗f) ≫ ε_B = (f*⊗id_A) ≫ ε_A`, and the coevaluation counterpart for `f:A→B`; C3–C6 with the actual chosen dual comparisons. |
| Rotation | A half-turn is the corresponding mate. Full-turn transport uses `f ≫ j_B = j_A ≫ f**`, the monoidal comparison for `j_(A⊗B)` and `j_𝟙`; C4–C6. C3 uses integer winding, without j. |
| Twist and curl | In C6 a blackboard curl and its recorded framing correction compare with an explicit θ/θ⁻¹ twist feature. Give the corresponding framed R1 word, `f ≫ θ_B = θ_A ≫ f`, `θ_(A⊗B)=(θ_A⊗θ_B) ≫ c_(A,B) ≫ c_(B,A)` and `θ_𝟙=id`. C5 uses only the derived curl formulas, without framed R1. |
| Spatial coupon turn | C6 only: record an edge-on transition with its rear-view port/marking dictionary. A full turn of `f:A→B` compares `θ_A ≫ f` with `f ≫ θ_B`; expand tensor-word twists by balance, and derive the half-turn/oriented variants using mates and ribbon compatibility. Prove these are exactly the geometric coupon-turn events. |
| Ribbon compatibility | A twist transported through a bend changes to the dual twist, `θ_(A*)=(θ_A)*`; C6 only. The positive/negative curl words are those of the fixed braided-pivotal/twist comparison from PivotalSpherical Layer 10. |

Define mates and iterated-dual crossings by the relevant local pictures
and prove their expression formulas. Every oriented and reflected variant
used in a move is a target with its own typed boundary and reduction to
these templates. For framed pictures crossing/curl changes also update
the recorded normal framing; in C5 only regular variants are permitted.
This combinatorial move relation is independent of geometric isotopy.
Proving that these templates exhaust a generic geometric isotopy, with
the correct restrictions in each row, is the geometric move theorem.

The move-template API supplies source and target boundary words, gluing into
any compatible collared context, reversal of moves and transport by
orientation/duality with explicit mate labels. The basic ribbon templates
are Reshetikhin–Turaev Lemmas 5.2–5.3, p.13, Figure 8, pp.14–15; the
regular/ribbon distinction is Selinger Lemma 4.27 and §§4.6–4.7.

Pin the framing sign as follows. On the vertical strand (0,t,0), the ordered
normal plane is (e_z,e_x), so (e_y,e_z,e_x) has determinant +1. A positive
full twist has normal n(t)=sin(2πt)e_x+cos(2πt)e_z, constant near the collars
after reparameterizing t. Its degree in that normal plane is +1; reversing
t reverses the degree. Compare the blackboard push-off convention to this
model before using the curl equation. For two upward crossing tangents,
our writhe sign is sign(det(v_over,v_under,e_z)); the fixed crossing has
v_over=(π,1,0), v_under=(−π,1,0) and determinant 2π > 0. The positive
categorical crossing therefore has writhe +1. Its blackboard curl has
framing +1 and evaluates to θ; the mirrored curl has framing −1 and
evaluates to θ⁻¹. Construct the dictionary to native positive Artin
generators and KhovanovHomology G/GeometricTopology Layer 4 supported plane
pictures by requiring this crossing to have exponent +1 and writhe +1,
and its depth reversal exponent −1 and writhe −1.

**Checks.**

- At t=1/2 the crossing positions are (0,1/2,1) and (0,1/2,−1): the
  left input is over. At t=0 and 1 the strand permutation is (12).
  Depth reversal retains this permutation but changes crossing exponent
  from +1 to −1 and writhe from +1 to −1.
- The positive normal loop has coordinates (1,0), (0,1), (−1,0), (0,−1),
  (1,0) in (e_z,e_x) at quarter times, degree +1; the constant normal has
  degree 0. Their endpoint normals agree, but their relative homotopy
  classes do not. A positive twist followed by its inverse has degree 0.
- For scalar coupons f=2 and g=3 over ℚ, both independent-feature paths
  evaluate to 6. For a crossing and its inverse, the exponents are 1−1=0;
  replacing the inverse by the opposite positive crossing gives 2, not 0.
- In the modified order-three pivotal example, θ_χ=ω and
  θ_(χ*)=ω⁻¹ while (θ_χ)*=ω. The last template is therefore unavailable
  in C5 and is a genuine additional relation in C6.

*Needs:* §§0.1–0.3 and 1.1–1.3; PivotalSpherical Layer 10 for the exact
curl/twist formula; the chosen-dual and monoidal structural comparisons.

### 1.5 Morse words

Construct diagrams cut into one-feature horizontal
slabs, including crossings, extrema, coupons and recorded ribbon twists.
Prove existence of such a decomposition and the effect of changing cut levels,
rescaling slabs or commuting independent features. Give explicit typed
boundary words for every local move and a realization of each move by the
specified geometric isotopy. Conversely, derive the finite move list from a
generic isotopy. Merely listing moves that look valid proves no completeness.
The closed coupon-free specialization agrees with Khovanov G's relative
projection/Reidemeister theorem and GT Layer 4's geometric presentations,
including the supported move-word and crossing-sign dictionaries and the
framing-forgetful maps. General-dimension Roseman moves, embedded surfaces and
relations between isotopies are not further endpoints here.

The Morse-word API assigns ordered boundary words at every cut, recovers
the glued diagram, and compares refinements by inserting identity slabs.
Composition is concatenation with matching boundaries; tensor uses disjoint
rectangles and the independent-feature moves. Prove that the realization
map identifies exactly move-equivalent words, rather than defining geometric
equivalence by that condition (Reshetikhin–Turaev Lemmas 5.2–5.3, p.13;
Roseman Proposition 8.1, p.309, for the closed curve input).

**Checks.**

- The identity strand cut at 1/3 and 2/3 gives three identity slabs whose
  composite is one identity, with 0 exceptional events.
- A nullary coupon contributes one feature to an empty-to-empty word and
  evaluates to its label 2, whereas the empty word of slabs evaluates to 1.
- Two disjoint coupons labelled 2 and 3 can exchange heights: the words
  have two features in opposite orders and both evaluate to 6. Two
  overlapping crossings of a three-strand braid cannot be exchanged by
  this rule: their endpoint permutations (123) and (132) differ.

*Needs:* §§1.1–1.4 for gluing, relative genericity, normal forms and each
move's realizing isotopy; KhovanovHomology G's supported closed-link
projection theorem and GeometricTopology Layer 4's presentations.

### Examples

The empty diagram, a nullary coupon, a vertex-free circle and a collared
interval test four distinct incidence possibilities. The constant movie
has no events; a transverse two-branch tangency has one event, while
accumulating times 1/n test the required local-finiteness theorem.

### Dependencies

Layer 0 for typed labels; GeometricTopology Layers 1–4;
KhovanovHomology G; DifferentialGeometry §§3.2, 3.3, 3.5, 10.2;
MorseTheory M1 and M3. The arbitrary coupon, collar and framing extensions
in §§1.1–1.5 are inputs built here, not consequences assigned to closed-link
sources without proof.

## Layer 2: monoidal coherence — progressive planar diagrams (C1)

### 2.1 The planar comparison

Construct the planar progressive diagram category of a tensor signature and
the functor from C0's monoidal-axiom quotient to it. Every geometric diagram
must admit an elementary layering, including nullary coupons and scalar
components, and its expression must be independent of the layering. Prove
that progressive planar isotopy is generated by independent-feature
interchange and the structural changes of bracketing/unit insertion. Relate
these to bifunctoriality and native associator/unitor coherence; prove both
soundness and completeness, then full faithfulness and essential
surjectivity of the comparison functor. Establish the strong-monoidal
universal property for arbitrary-arity labelled diagrams.

On a signature with only object generators compare to
`FreeMonoidalCategory` and recover its thinness theorem through the native
normalization functor. On an arbitrary signature, do not claim all parallel
maps are equal: distinct coupon composites remain different. Prove naturality
of evaluation under signature substitution, invariance under subdividing a
wire, and computation rules for every elementary diagram. Supply a usable
strict word model with an explicit strong monoidal equivalence from the
parenthesized model and a comparison of evaluations in non-strict targets.
Prove this strictification and its compatibility with signature substitution.

The planar category and comparison API includes:

- Stacking and juxtaposition descend to the isotopy quotient and preserve
  substitution; subdivision changes neither the morphism nor its evaluation.
- The realization functor is fully faithful and essentially surjective,
  and restriction to generators gives the strong-monoidal universal property.
- Word normalization gives a strong monoidal equivalence to the parenthesized
  model, compatible with interpretations in every non-strict target.

**Checks.**

- With no object or coupon generators the empty diagram evaluates to id_𝟙, scalar 1;
  introducing a nullary generator labelled 2 gives a second morphism of
  value 2, so structural thinness does not extend to arbitrary coupons.
- Tensoring an identity interval with an empty diagram gives boundary length
  1, whereas tensoring two identity intervals gives length 2. Unit insertion
  must not add a strand.
- Two scalar coupons 2 and 3 in independent rectangles give value 6 in
  either height order; two unary coupons on one strand, represented on ℚ²
  by matrices E₁₂ and E₂₁, give E₁₁ and E₂₂ in opposite orders. Only the
  independent exchange is a permitted move.

*Needs:* Layer 0's monoidal presentation and interpretations; Layer 1's
progressive planar realization, gluing and move theorem; native structural
coherence. This is Joyal–Street I, Theorem 1.2, and Planar diagrams,
Theorem 1.5 (also Selinger Theorem 3.1).

### Examples

The thin object-generated category and a signature with two independent
nullary labels distinguish structural coherence from equality of all arrows.

### Dependencies

Layers 0–1; TemperleyLieb Layer 2; Mathlib's structural coherence theorem.

## Layer 3: braided coherence — progressive spatial diagrams (C2)

### 3.1 The spatial comparison and braid category

Add positive and negative crossings to progressive planar presentations and
construct their spatial realizations, including the over/under data and
coupon markings. Throughout geometric isotopy require derivative-positive wires,
front-facing coupons and their lower/upper port collars, as specified above.
Prove the progressive generic-projection theorem with its
complete local list: independent exchanges, crossing cancellation, braid
Reidemeister III and naturality slides of a cable past a coupon. Cable
slides apply to arbitrary port counts, including zero, and must carry the
correct source/target permutations. Derive the move equations from inverse
braidings, both hexagons and naturality; prove the converse geometric
realizations. Construct the free braided category and its equivalence to
progressive spatial diagrams, with evaluation and functoriality as in C1.

For one generating object and no coupons, identify the category with the
braid category: objects n, endomorphisms native `TauCeti.BraidGroup n`, no
morphisms between distinct strand counts. Build horizontal juxtaposition,
block crossings and the colored version (strand labels move with the strand).
Prove the Artin-word/geometric-braid comparison against the native generator
and multiplication conventions. State the comparison as an equivalence with
the appropriate monoidal object normalization, not as an untyped equality
of hom-sets. Nontrivial pure braids remain distinct; the strand permutation
alone is not a complete invariant. Bottom-to-top concatenation `f ≫ g`
corresponds to `[f] * [g]`, matching native `BraidWord.toBraid_append`.
Do not assume a general braid-word
normal-form algorithm to prove the diagram theorem unless constructing it
is separately required by the chosen proof.

The braided category API includes:

- Positive and negative crossings are inverse isomorphisms with exchanged
  boundary order; cable crossings satisfy both hexagons and coupon naturality.
- Realization and evaluation commute with signature substitution, and the
  equivalence preserves the specified braiding, not an assumed symmetry.
- The one-color coupon-free category has endomorphism group
  `TauCeti.BraidGroup n` at boundary length n; juxtaposition adds lengths
  and colored crossings transport the ordered strand labels.

**Checks.**

- At n=0 and n=1 the coupon-free endomorphism groups each contain only the
  identity, with exponent 0; neither has an Artin generator.
- On two strands the square of the positive generator has permutation id
  but exponent 2, unlike the identity's exponent 0. Hence the comparison
  cannot identify a braid with its strand permutation alone.
- The crossing model of §1.4 sends (A,B) to (B,A), has exponent +1 and
  writhe +1; its inverse starts at (B,A) and has exponent −1. On three
  strands the adjacent products have permutations (123) and (132), so
  concatenation cannot be made commutative by normalization.

*Needs:* Layers 0–2; Layer 1's progressive spatial/coupon genericity;
Mathlib braidings and Tau Ceti's Artin presentation and word evaluation.
The geometric endpoint is Joyal–Street I, Theorem 3.7 (Selinger Theorem
3.7 and Caveat 3.8); the colored braid comparison is its coupon-free case.

### Examples

The pure braid with two positive crossings distinguishes braiding from
symmetry; a nullary coupon tests naturality with a zero-width cable.

### Dependencies

Layers 0–2 and Tau Ceti's braid groups, with the multiplication convention
of `TauCeti.BraidWord.toBraid_append`.

## Layer 4: rigid coherence — planar duality and winding (C3)

### 4.1 Winding normalization and planar duality

Extend C0's syntax by chosen right and left duals, their pairings and mates,
with exactly the rigid axioms. Construct object normalization to integer
winding words, reversing tensor order under duals, and prove the canonical
comparison maps and their compatibility with evaluation, coevaluation and
mates. Compare to Mathlib's `rightDualFunctor`/`leftDualFunctor` and monoidal
opposite conventions. No pivotal comparison `A≅A**` is installed.

Construct admissibly labelled planar diagrams of this signature, with tangent
turning/endpoint data implementing the integer dual levels. Give explicit
rules for label transport through extrema and rotation of a marked coupon.
Closed components are legal only with compatible labels; do not grant a
bare circle a rigid trace by forgetting winding. Cups and caps, all their
boundary orientations, and snake cancellations give the elementary
presentation. Complete the planar generic-isotopy list, including sliding
coupons through bends with the corresponding mates, and prove that precisely
these moves follow from the rigid axioms. Prove the comparison of C0's free
rigid category with these planar diagrams and its rigid universal property.
Establish the one-sided right/left autonomous versions and their comparison
on the objects they generate, retaining the formal dual labels.

Give reduction/expansion formulas for duals of composite objects and coupon
composites, compatibility of the chosen-dual functor comparisons under
composition, and change-of-choice equivalences for pairings. Distinguish
admissible diagrams whose unlabelled planar pictures agree but whose winding
boundary data differ; an unlabelled isotopy cannot erase iterated duals.

The winding and rigid-diagram API includes:

- Right dual reverses a word and adds 1 to each integer; left dual reverses
  and subtracts 1. Both reverse concatenation and fix the empty word.
  The mixed composites cancel; same-handed composites retain shifts by ±2.
- Normalization supplies comparison maps from formal expressions and
  respects both evaluation/coevaluation pairings, mates and substitution.
- The planar comparison is a rigid equivalence, natural under changes of
  chosen pairings, and the one-sided comparisons retain their formal labels.

**Checks.**

- The right and left duals of the empty word are both empty, of length 0;
  inserting a formal unit must not create a letter.
- For [(a,0),(b,2)], right dual gives [(b,3),(a,1)] and left dual of that
  gives [(a,0),(b,2)]. Two right duals instead give [(a,2),(b,4)], so parity
  reduction would lose information before any pivotal structure is supplied.
- The cup at level n has endpoints (n,n+1), and its cap consumes them in
  reverse order (n+1,n). On a one-dimensional vector space with pairing
  ε(e*⊗e)=1 and η(1)=e⊗e*, each snake sends e to e. Setting ε=0 instead
  sends e to 0 and fails `ExactPairing`.
- A circular traversal changes the integer tangent turn by +2 or −2 in
  half-turn units. Neither equals 0 in ℤ, so a bare closed wire labelled
  by one rigid atom is inadmissible; both equal 0 modulo 2 in the pivotal row.

*Needs:* Layer 0's rigid presentation and dual comparisons; Layer 1's
planar geometry, turning labels and move theorem; Mathlib chosen pairings
and dual functors. The PL input is Joyal–Street, Planar diagrams, Theorem
2.7; the smooth comparison is §1.2 (Selinger Theorem 4.5, Caveat 4.6 and
Proposition 4.7 for the one-sided version).

### Examples

A two-letter mixed-dual cancellation and a same-handed double dual have
different integer labels even when their unlabelled boundaries coincide.

### Dependencies

Layers 0–1 and their monoidal specialization in Layer 2; Mathlib rigid
categories and PivotalSpherical Layer 0's dual comparison API. No pivotal
structure is an input to the rigid coherence theorem.

## Layer 5: pivotal coherence — planar rotation (C4)

### 5.1 Pivotal reduction and two closures

Consume the chosen pivotal structure from PivotalSpherical and compare the
integer winding-word model to its parity-word reduction by explicit pivotal
isomorphisms. Construct pivotal syntax/diagrams and prove coherence of that
reduction, including transport of arbitrary coupon types and the unit and
tensor constraints. A full turn of a coupon represents the double mate,
identified using naturality of the pivotal isomorphism; a half turn represents
the appropriate single mate. Marking and label transport remain part of the
rotation operation.

Prove the complete planar isotopy presentation, including extrema
birth/death, allowed rotations, independent-feature exchanges and coupon
slides. Show its equations are exactly the rigid equations plus monoidal
naturality of the pivotal structure; use the redundant dual-compatibility
identity already proved by PivotalSpherical rather than adding it as a new
axiom. Construct the free pivotal category on the full signature and the
planar-diagram equivalence, and establish its pivotal universal property.
Recover the category-generated Freyd–Yetter theorem by imposing the original
category's identity/composition relations on unary coupons.

Construct the two closures of an endomorphism and identify their evaluations
with native left/right pivotal traces. Planar isotopy preserves the respective
closure; it does not make the two closures equal in a general pivotal
category. Include a concrete non-spherical pivotal example distinguishing
them. Use `FDRep ℂ (Multiplicative (ZMod 3))`, with generator z and
character χ(z)=ω, where ω is
a primitive cube root of unity. Consume PivotalSpherical Layer 7's rigidity
and standard pivotal structure, and Layer 1's torsor action to modify that
structure by the central action of z. Keep the modified pivotal structure
an explicit value/local instance, so the registered canonical symmetric
instance cannot replace it. With PivotalSpherical Layer 2's convention,
left closure is η_(X*,X) ≫ (id_(X*) ⊗ f) ≫ ε_(X,X*) and right closure is
η_(X,X*) ≫ (f ⊗ id_(X*)) ≫ ε_(X*,X); the pairings involving (X*,X)
are the pivotal ones. Thus j_χ = ω·id gives left dimension ω⁻¹ and right
dimension ω: the pivotal coevaluation contributes j⁻¹ and the pivotal
evaluation contributes j. This is an example, not spherical
coherence as a new target.

The pivotal diagram and closure API includes:

- Parity reduction of integer labels carries its chosen pivotal comparison,
  including tensor/unit and coupon transport, and commutes with substitution.
- A half-turn evaluates to the indicated mate; a full turn evaluates to the
  double mate transported by j, with the coupon's mark retained.
- Left and right closure evaluate to their respective traces; cyclicity and
  invariance under planar isotopy do not identify the two trace operations.

**Checks.**

- The levels 0 and 2 reduce to parity 0, but their identification evaluates
  to j_X; for the modified character χ it has scalar ω, not scalar 1.
- On that character the left circle evaluates to ω⁻¹ and the right circle
  to ω, with ω³=1 and ω≠1. For the unit character both circles have value 1.
- A coupon 2·id_χ has mate 2·id_(χ*) and double mate 2·id_(χ**).
  Full-turn naturality has scalar 2ω on both sides, whereas replacing its
  label by the unrelated coupon 3·id would give 3ω.

*Needs:* Layers 0, 1 and 4; PivotalSpherical Layers 0–2 for pivotal
structures, redundant dual compatibility and traces, and Layer 7 for the
finite-dimensional representation example. Freyd–Yetter Theorem 4.4
supplies the category-generated case; arbitrary port counts are an
extension here (Selinger Theorem 4.14 and Caveat 4.15).

### Examples

The explicit central order-three action yields different left and right
circles; rotating the marked coupon transports its label rather than
changing it to another generator.

### Dependencies

Layers 0–1 and 4; PivotalSpherical Layers 0–2 and 7. The representation
example is a Check, not a prerequisite for the general pivotal theorem.

## Layer 6: braided-pivotal coherence — regular isotopy (C5)

### 6.1 Regular isotopy and the derived twist

Combine the actual braiding and pivotal structure, with no extra compatibility
axiom beyond those structures. Use C4's oriented/parity-labelled diagrams
with crossings. Construct their typed local move calculus and the independent
projection-immersion/front-facing spatial-isotopy model specified above,
then prove that the two equivalences agree.
Transport the rigid label data before applying pivotal simplification; a
three-dimensional isotopy of unframed wires is not the claimed equivalence.

Prove the complete move theorem for this model, including all oriented
Reidemeister II/III variants, mate/coupon slides and the allowed height
changes. Derive these variants from the positive-generator equations and
explicit duality/pivotal operations; state and prove each required
orientation/rotation reduction. Establish the free braided-pivotal category,
its regular-diagram equivalence and its strong braided-pivotal universal
property. Prove the category-generated Freyd–Yetter case as a specialization.

Use PivotalSpherical's specified braided-pivotal-to-balanced construction to
identify the curl operators with its twist and inverses/mates. State their
formulas and types. Preserve distinct left/right curls when the missing
ribbon compatibility would equate them. Reuse C4's central order-three
example with its symmetric braiding: compute `θ_χ=ω·id`,
`θ_(χ*)=ω⁻¹·id` and `(θ_χ)*=ω·id`. The linear dual does not conjugate
the scalar, so these exhibit `θ_(A*) ≠ (θ_A)*`. Use this to rule out
accidentally imposing framed ribbon isotopy in this row. The ribbon relation
in C6 is a genuine additional relation, not a consequence of the two hexagons
and pivotal naturality.

The regular-diagram API includes:

- The quotient admits braiding, duals and pivotal rotation with typed
  gluing/substitution, and realization gives the braided-pivotal equivalence.
- Projection-regular isotopy preserves the turning number of each closed
  projected immersed strand; crossing tangencies and triple points remain
  allowed, while cusps and uncorrected R1 deletion do not.
- The derived twist agrees with the fixed formula of PivotalSpherical
  Layer 10, is natural and balanced, and is not assumed compatible with duals.

**Checks.**

- A planar circle has tangent rotation number 1; adding a positive planar
  curl gives 2. Removing that curl crosses a projected cusp and is not a
  regular isotopy between these immersed curves.
- On the modified order-three character, the two traces remain ω⁻¹ and ω;
  θ_χ=ω, θ_(χ*)=ω⁻¹ and (θ_χ)*=ω. Thus braided-pivotal does not imply
  either spherical or ribbon in this example.
- For χ⊗χ in this symmetric example, the double braid is 1 and the
  balance equation is ω²=(ω·ω)·1. Twist naturality for a scalar coupon 2
  gives 2ω=ω2, including the case of a one-dimensional dual coupon.

*Needs:* Layers 0–1 and 3–5; PivotalSpherical Layer 10's central
braided-pivotal/balanced equivalence. Freyd–Yetter Theorems 3.8 and 4.4
and Selinger Theorem 4.23, Caveat 4.24 concern the regular calculus;
the arbitrary-arity extension uses the coupon move targets of Layer 1.

### Examples

An immersed circle with an added curl and the central order-three twist
separate regular from framed isotopy and balanced from ribbon structure.

### Dependencies

Layers 0–1, 3–5; PivotalSpherical Layer 10. The framed quotient of Layer 7
is not used to prove the regular move theorem.

## Layer 7: Shum coherence — framed oriented tangles (C6)

### 7.1 Framed tangles and the ribbon comparison

Consume PivotalSpherical Layer 10's ribbon-category definition and its induced pivotal
structure. Add the typed relation `θ_(A*)=(θ_A)*` to C5, with the balance law
and its compatibility already constructed from the chosen pivotal/braided
convention. Construct the corresponding free ribbon category. Compare this
pivotal-generated presentation to the primitive-twist ribbon structure and
its induced pivotal structure using PivotalSpherical Layer 10's central equivalence and C0's
equivalence between twist- and pivotal-preserving braided functors. The
comparison must include functor groupoids, not only structures on objects.

Independently construct framed oriented tangles with the labelled coupons,
boundary collars and orientations of G0. Identify nonzero normal fields with
sufficiently thin ribbon neighborhoods and prove independence of width and
auxiliary metric. Prove compatibility with stacking, tensor, duality and
relative isotopy, and compare smooth and PL models. Construct a blackboard
Morse presentation with recorded integral framing corrections and prove the
framing bookkeeping, including how a projected curl changes blackboard
framing. Deleting a curl without changing recorded framing is not an allowed
move.

Prove the framed Reidemeister/Morse theorem with its full coupon and
orientation variants. Include edge-on/back-view coupon events and the full
coupon-turn relation, derived from twist naturality, tensor balance, unit
twist and mates. Prove the local curl/explicit-twist comparison with its
recorded framing change. Relate C5's extra ribbon relation to the local framed
isotopy which it represents; give both its typed word and geometric isotopy.
Conversely decompose every framed isotopy into these local moves and the
structural moves already constructed. Prove that the C5 quotient by this
relation is equivalent to the independently defined framed tangle category.
This is the free-ribbon theorem for the full tensor signature, not an
assumption about the geometric quotient.

Specialize to one object and no coupons to obtain Shum's theorem:
the free ribbon category on X is equivalent to framed oriented tangles. Objects normalize to finite words of
positive/negative oriented points, and endomorphisms of the empty word are
framed oriented links. Give the category-generated version, and prove
comparison with Shum's doubled-strand/framing-number description. Keep
closed-component framing, boundary framing and turning data separate while
proving this comparison; regular isotopy is finer than framed isotopy.

The framed-tangle and comparison API includes:

- A normal field determines a thin ribbon neighborhood; positive changes
  of width and auxiliary metric induce canonical relative isotopy classes,
  compatible with gluing and tensor.
- The Morse presentation records total framing as blackboard writhe plus
  the integral correction. A curl change of +1 must be accompanied by a
  correction change of −1 to keep the same framed tangle.
- The free ribbon comparison preserves oriented boundary words, coupons,
  twist and mates, and induces the stated universal equivalence of functor
  groupoids; its one-object, coupon-free case is Shum's equivalence.

**Checks.**

- The vertical strand with normal (0,0,1) has degree 0; §1.4's positive
  rotating normal has degree +1 and the same endpoint normals. Widths
  1/10 and 1/20 preserve that degree; zero width does not give a ribbon.
- The presentations (writhe,correction)=(0,0) and (1,−1) have total framing
  0 and agree under framed R1. The presentation (1,0) has total framing 1
  and differs by θ; deleting its curl without correction is invalid.
- With no coupons, the empty boundary has identity the empty link; a
  zero-framed unknot colored by the unit evaluates to 1. Coloring by a
  standard two-dimensional vector space gives 2, so closed components
  cannot be discarded even when the source and target words are empty.

*Needs:* Layers 0–1 and 6, especially §0.3's functor groupoid comparison;
PivotalSpherical Layer 10's ribbon structure; §1.2 smooth/PL and §1.4
framing/coupon dictionaries. Shum Theorem 6.1 is the category-generated
endpoint; the arbitrary-arity extension is owned here (Selinger Theorem
4.30 and Caveat 4.31). Reshetikhin–Turaev Lemmas 5.2–5.3, p.13 and Figure
8, pp.14–15, supply ribbon/coupon presentation inputs, not the whole
relative smooth-family proof.

### Examples

The unit-colored unknot, a one-strand full twist and a coupon turned
through an edge-on view test closed components, normal degree and the
spatial coupon dictionary separately.

### Dependencies

Layers 0–1 and 6; PivotalSpherical Layer 10. Quantum representations are
consumers of this universal theorem, not suppliers.

## Layer 8: evaluation, closure and reusable consequences (C7)

### 8.1 Evaluation and target functoriality

For each of the six structures, construct the evaluation functor in any target
carrying exactly that structure, with formulas on generators, structural
pieces, composition, tensor and duality. Prove independence of Morse cuts,
label-preserving isotopy, chosen dual comparisons and representatives.
Establish functoriality in the target via strong structure-preserving
functors, and in the signature via substitution. Prove compatibility of all
six evaluations under the valid forgetful/quotient comparison functors;
there is no forgetful interpretation which deletes framing while leaving
an arbitrary twist unchanged.

The evaluation API includes formulas on each structural generator and each
coupon, preservation of composition/tensor using the target constraints,
and coherent comparison under signature substitution and strong functors.

**Checks.**

- A straight strand evaluates to id_V and either snake to id_V; on ℚ²
  both send (2,3) to (2,3). A zero evaluation pairing sends it to (0,0)
  and is excluded by the snake axioms.
- A crossing followed by its inverse evaluates to id_(V⊗W); in the free
  two-strand braided model the exponent is 0, whereas two positive
  crossings have exponent 2.
- A positive/negative ribbon twist pair evaluates to θ_Vθ_V⁻¹=id_V;
  for a scalar twist q this is q·q⁻¹=1. A nullary coupon labelled 2 still
  evaluates to 2 after substitution into the empty-to-empty boundary.

*Needs:* Layer 0's universal interpretations and the corresponding
coherence theorem of Layers 2–7. The general evaluation is obtained from
those universal properties; Reshetikhin–Turaev Theorem 5.1, pp.12–13,
is the ribbon Hopf-algebra instance.

### 8.2 Closure, mirrors and scalar normalization

In the ribbon row this is the general Reshetikhin–Turaev functor. Construct
colored tangle evaluations with different objects on different components
and arbitrary intertwiners on coupons. A closed diagram evaluates in
`End(𝟙_C)`; identify closure with the native pivotal trace and show that
cutting and reclosing a component gives the same value, with the right/left
choices and comparisons explicitly specified. Show that reversing a color's
orientation uses its dual. Construct the mirror-category comparison with
`c^mirror_(A,B)=c_(B,A)⁻¹` and `θ^mirror_A=θ_A⁻¹`, including
duality and boundary maps.

A category whose unit endomorphisms are identified with a commutative
field/ring, compatibly with its scalar action through the monoidal unit,
gives scalar-valued framed link invariants. For a color V with scalar twist
a unit and invertible quantum dimension, construct the writhe-corrected,
unknot-normalized invariant of ordinary oriented knot diagrams and prove
its invariance under the geometric realization comparison. Include the
zero-framing formulation and its equivalence to the diagram correction.
Keep those scalar/invertibility hypotheses on this normalization theorem;
the general evaluation functor needs none of them. GeometricTopology keeps
its existing knot types and polynomial algorithms, and QuantumGroups supplies
quantum examples without either being needed for the general theorem.

Define the normalized invariant explicitly. Let R be a commutative ring
with a fixed multiplicative identification End(𝟙_C) ≃* R compatible with
the scalar action,
let V have θ_V=q·id_V for a unit q∈Rˣ, and let its quantum dimension d be
a unit of R. For a one-component oriented knot diagram D with blackboard
framing and our signed writhe w(D)∈ℤ, put
N_V(D)=d⁻¹ q^(−w(D)) RT_V(D).
Prove a positive R1 changes (w,RT) to (w+1,q·RT), a negative R1 to
(w−1,q⁻¹·RT), and R2/R3 leave this expression fixed. No division is
performed without these unit hypotheses. The zero-framing interpretation
is the same expression by the framing correction of Layer 7. General
unrenormalized RT evaluation retains arbitrary ribbon targets.

The closure and mirror API includes:

- Closing an endomorphism gives its chosen left/right pivotal trace; the
  ribbon-induced pivotal structure makes these equal, and recutting a
  colored closed component preserves the resulting scalar.
- Orientation reversal uses the chosen dual with its actual pairing maps.
  Reflection sends the braiding and twist to the displayed mirror structures
  and carries boundary and coupon labels by the corresponding comparisons.
- For scalar twist and unit dimension, N_V is an invariant of the ordinary
  oriented knot type and sends the unknot to 1; its definition does not
  impose any such normalization on arbitrary colored links or coupons.

**Checks.**

- Over ℚ with standard vector-space pivotal structure, V=ℚ² has d=2,
  q=1 and unknotted RT value 2, giving N_V=1. The zero object has d=0
  and is excluded; treating its inverse as total-field 0 would give 0,
  not the required normalized value 1.
- For q=2, d=3 and RT value 6 at writhe 1, the corrected value is
  (1/3)(1/2)6=1. Positive R1 gives writhe 2 and RT value 12, yielding
  (1/3)(1/4)12=1; negative R1 gives writhe 0 and RT value 3, again 1.
  These are the local scalar transformation checks under the stated hypotheses.
- The Hopf link closure of c_(V,W) ≫ c_(W,V) evaluates to the trace of
  that double braid; in ordinary vector spaces of dimensions 2 and 3
  it is Tr(id_(V⊗W))=6. An empty link has value 1 instead.
- Mirroring changes (w,q) to (−w,q⁻¹); at w=1, q=2 the correction
  factor in the mirrored category is (1/2)^1=1/2, equal to the original
  2^(−1)=1/2. Reflecting only the diagram in the same target instead gives
  correction factor 2.
  In the standard ribbon vector-space example left and right closure of
  2·id_(ℚ²) both have value 4.

*Needs:* §8.1; Layer 7's framing dictionary and framed presentation;
PivotalSpherical Layers 2 and 10 for traces and ribbon-induced sphericity;
GeometricTopology Layer 4's ordinary knot presentation and KhovanovHomology
G's geometric Reidemeister comparison. The local source inputs are
Reshetikhin–Turaev Theorem 5.1 and Lemmas 5.2–5.3, pp.12–13; the general
normalization follows from the scalar twist and dimension hypotheses.

Give examples evaluating a straight strand, each snake, a crossing and its
inverse, a positive/negative twist, the two pivotal circles and a framed
Hopf link. Compute the Hopf-link value as the trace of the double braiding.
For the object-only braided example detect a nontrivial pure braid, and for
the rigid example retain dual winding. These checks expose unwanted symmetry,
sphericity, pivotality or trivial-twist axioms.

### Examples

The checks above evaluate all elementary pieces, both pivotal circles and
the Hopf closure. The winding and pure-braid examples in Layers 3–4 test
that evaluation has not acquired unwanted pivotality or symmetry.

### Dependencies

Layer 0 and the selected geometric coherence endpoint from Layers 2–7;
PivotalSpherical Layers 2 and 10 for closures; GeometricTopology Layer 4
and KhovanovHomology G for the ordinary-knot normalization. Each evaluation
row needs only its own structural target, not the stronger rows.

## Downstream consumers

Representation categories such as those of QuantumGroups Q8 are concrete
targets for the general evaluation functors. Colored tangle and link
invariants use Layer 8 without supplying any premise of the coherence
theorems. Their category-specific constructions and computations remain
with their existing owners.

The order is C0 and G0's underlying diagram/gluing floor, then C1, then C2
and C3, then C4, then C5, then C6, with the corresponding parts of C7 developed
with each row. Khovanov G's shared jet/extension floor, G0's adapters and
relative smoothing support the geometric completeness steps, and are not
replaced by an assumption that
all isotopies are already generic. Algebraic soundness can be built before
those geometric steps. C6 consumes PivotalSpherical's ribbon structure;
C0–C5 do not require quantum representations or knot invariants.

For every row deliver: the actual syntax and independently defined geometry;
composition/tensor/duality API; a full typed move list; soundness and
completeness; a structure-preserving equivalence; extension computation and
uniqueness; substitution/renaming and additional-relation quotients; and the
comparison to arbitrary non-strict targets. Any proof by an elementary-move
normal form must prove existence and independence of the form. No claim of
decidable equality of knots or arbitrary diagrams is required.

Selinger's Caveats 4.15, 4.24 and 4.31 record that the cited pivotal,
braided-pivotal and ribbon proofs establish category-generated cases, rather
than all arbitrary-arity tensor signatures. Here the arbitrary-arity
extension is an explicit target: either prove its complete coupon-move list
using G0, or construct a reduction to the category-generated model and prove
that it respects tensor decomposition, coupon ports, substitution and
isotopy in both directions. Merely replacing each tensor word by a new atom
loses its decomposition and is not such a reduction. Nullary coupons and
closed components must be included in that proof. State precisely which
result each source proves; a citation does not discharge this extension.

## References

- Joyal–Street, [*The geometry of tensor calculus I*](https://doi.org/10.1016/0001-8708(91)90003-P),
  *Advances in Mathematics* 88 (1991), 55–112, Theorem 1.2 for planar
  monoidal diagrams and Theorem 3.7 for braided diagrams. Their progressive
  diagrams and tensor schemes supply C1–C2's starting model.
- Joyal–Street, [*Planar diagrams and tensor algebra*](http://science.mq.edu.au/~street/PlanarDiags.pdf),
  unpublished manuscript (1988), Theorem 1.5 and Theorem 2.7
  (the latter headed “Theorem 7” on manuscript p.2.33): autonomous
  diagrams and their winding conventions, with PL diagrams. This is
  Selinger's reference [21]. Their separate [*The geometry of tensor
  calculus II*](http://science.mq.edu.au/~street/GTCII.pdf) is the draft
  [19], not the source of that numbered theorem; its general pivotal
  assertion is discussed in Selinger's Caveat 4.15.
- Freyd–Yetter, [*Coherence theorems via knot theory*](https://doi.org/10.1016/0022-4049(92)90018-B),
  *J. Pure Appl. Algebra* 78 (1992), 49–76: Theorem 4.4 supplies the
  category-generated pivotal/braided-pivotal cases; Theorem 3.8 develops the
  underlying autonomous regular-diagram calculus.
- Shum, [*Tortile tensor categories*](https://doi.org/10.1016/0022-4049(92)00039-T),
  *J. Pure Appl. Algebra* 93 (1994), 57–110, Theorem 6.1:
  free tortile categories on categories, with doubled tangles and framing.
- Yetter, [*Functorial Knot Theory*](https://doi.org/10.1142/4542),
  World Scientific (2001), Chapters 7–9, Theorem 9.1 and Lemma 9.12:
  tangle models and the ribbon relation argument.
- Selinger, [*A survey of graphical languages for monoidal categories*](https://arxiv.org/abs/0908.3347),
  §§3.1,3.3,4.1,4.2,4.6,4.7; Theorems 3.1,3.7,4.5,4.14,4.23,4.30
  and Caveats 4.6,4.15,4.24,4.31: a guide to precisely these six rows and
  the scope of the existing proofs. Its bibliography identifies the two
  Joyal–Street sources separately.
- Reshetikhin–Turaev, [*Ribbon graphs and their invariants derived from quantum groups*](https://doi.org/10.1007/BF02096491),
  *Commun. Math. Phys.* 127 (1990), 1–26, §4.2 pp.8–9,
  Theorem 5.1 pp.12–13, Lemmas 5.2–5.3 p.13 and Figure 8 pp.14–15:
  elementary ribbon/coupon generators and their relations; the functor
  follows from checking those relations once completeness is established.
- Golubitsky–Guillemin, [*Stable Mappings and Their Singularities*](https://doi.org/10.1007/978-1-4615-7904-5),
  Chapter II, §4, Theorem 4.13: jets/multijets and genericity. Adapt the
  theorem to relative, same-parameter families and prove the adaptations.
- Roseman, [*Elementary moves for higher dimensional knots*](https://www.impan.pl/shop/publication/transaction/download/product/89060),
  *Fund. Math.* 184 (2004), 291–310, §§3–7 and Proposition 8.1, p.309:
  projected traces, Morse functions on multiple-point/branch loci and the
  curve specialization. Use its method for G0; its unlabelled knot theorem
  does not itself supply the coupon/height/framing completeness required here.

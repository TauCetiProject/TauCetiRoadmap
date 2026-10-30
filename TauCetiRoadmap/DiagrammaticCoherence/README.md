# Diagrammatic coherence for monoidal categories and duality

Build the syntax, free categories, diagram categories, evaluation functors and
geometric presentation theorems for six structures:

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
| [PivotalSpherical, Layers 0–2, 7 and 10](../PivotalSpherical/README.md) | Owns double duals, pivotal structures/functors, traces, representation-category rigidity, balanced/ribbon structures and their algebraic relationships. This roadmap owns their free constructions and graphical coherence. Reuse its implemented APIs listed below. |
| [GeometricTopology, Layers 1–4](../GeometricTopology/README.md) | Owns general manifold/embedding/isotopy foundations, knot presentations and braid groups. Its closed Reidemeister comparison is shared with Khovanov G. This roadmap constructs boundary- and coupon-labelled tangles and their Morse-word presentation against those same realization and isotopy definitions. |
| [KhovanovHomology, G](../KhovanovHomology/README.md#g-plane-geometry-relative-extension-and-smooth-link-comparison) | Owns the common finite-dimensional relative jet/multijet general-position floor, relative ambient extension and finite-labelled smooth projection/Reidemeister comparison. Consume these in their shared manifold namespaces, independent of Khovanov complexes. G0 adds strip/boundary/coupon adapters, height/progressive constraints and framing sections; the closed coupon-free specialization compares with G's supported plane-event words and GT's presentations. |
| [DifferentialGeometry, Layers 3 and 10.2](../DifferentialGeometry/README.md), [MorseTheory, M1 and M3](../MorseTheory/README.md) | Supply flows, Sard, Morse normal forms and approximation at their actual hypotheses, also used by Khovanov G's common floor. G0 constructs the diagram-specific normal forms and adapters. |
| [HeegaardFloer proposal #957, M5](https://github.com/TauCetiProject/TauCetiRoadmap/pull/957) | Related ordinary-Cerf consumer of local polynomial/cutoff partial-jet machinery. Share Khovanov G's general-position floor rather than introduce a third engine. Its general Cerf theorem and downstream Floer theory are not prerequisites here: the one-dimensional edge-height events are G0's specializations of the shared floor and Morse normal forms. |
| [Temperley–Lieb proposal #58, Layer 2](https://github.com/TauCetiProject/TauCetiRoadmap/pull/58) | Owns the generic monoidal presentation/congruence construction. C0 pins its consumer interface and extends it to the other five structures, using one shared API in the general category-theory namespace. TL owns its matching diagrams, extra relations, linearization and special self-duality; its TL presentation is not a premise of free rigid or pivotal coherence. |
| [QuantumGroups, Q8](../QuantumGroups/README.md), [ribbon-representation proposal #1705, Q9](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1705) | Supply examples of representation categories and the ribbon category `RepUqg`. They consume C6–C7's general evaluation theorem. No quantum-group construction is a premise of coherence. |

Existing Tau Ceti material to consume, inspected on
[upstream main at `302238ea`](https://github.com/TauCetiProject/TauCeti/tree/302238ea98ea621d689041f67e935f0b4eb1285e):
the roadmap repository's pinned Tau Ceti revision predates these pivotal APIs.
The prototype imports only pinned Mathlib material; the inventory below records
implemented upstream suppliers, not imports available at that older pin.

- `TauCeti.CategoryTheory.Monoidal.Pivotal.{Basic,Functor,Trace,LeftDual}`:
  `TauCeti.PivotalCategory`, `pivotalIsoApp`, the chosen pivotal pairing,
  `CategoryTheory.Functor.IsPivotal`, and trace preservation.
- `TauCeti.CategoryTheory.Monoidal.Braided.Balanced` and
  `TauCeti.CategoryTheory.Monoidal.Pivotal.{Balanced,OfBalanced}`:
  `TauCeti.BalancedCategory`, `balancedOfBraidedPivotal`, and its inverse
  construction. Use the actual braiding/pivotal choices in every comparison.
- `TauCeti.GroupTheory.SpecificGroups.Braid.{Basic,Word}`:
  `TauCeti.BraidGroup`, its Artin presentation, strand permutation, exponent
  sum and word-evaluation API. Construct the geometric braid-category
  comparison here, using this group rather than defining another Artin group.
- `TauCeti.KnotTheory.SmoothLink.{Basic,AmbientIsotopy}` and
  `TauCeti.Geometry.Manifold.SmoothEmbedding.SmoothAmbientIsotopy.Basic`:
  geometric links and the general ambient-isotopy witness. The existing
  `TauCeti.KnotTheory.PDCode.Oriented.Reidemeister.Equivalence` defines
  combinatorial moves and proves Jones invariance for them; its source
  explicitly leaves the geometric Reidemeister theorem unproved.

Mathlib's object-generated free monoidal category and its coherence theorem
are not an arbitrary tensor-signature presentation or a diagram-isotopy
completeness theorem. Likewise, defining a quotient by Reidemeister moves
is not a proof that it agrees with geometric isotopy.

## Conventions and generality

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
- Progressive means every wire is monotone in height. Planar and progressive
  isotopies preserve the relevant marking/admissibility conditions. Define
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
  twist is θ⁻¹. Fix a model crossing in coordinates and use it consistently
  for c. The ribbon-element convention of an algebra example may be its
  inverse and is compared by a theorem, not a notational identification.
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

## C0. Signatures, syntax, congruences and interpretations

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

Consume TL Layer 2's generic presented-monoidal-category construction for
the monoidal case; its shared contract is specified in this paragraph and
pinned by the prototype. Merge proposal #58 before this roadmap; reconcile
the prototype's names with its implementation into one shared API rather
than installing a second presentation construction. Extend it to the other
five structures. Construct the least typed congruence generated by a
specified family of equations,
closed under composition/tensor, mates and the structural operations available
in that row. Give induction, substitution and quotient universal properties,
and construct the actual quotient category with its required structure.
Separate the raw syntax, the categorical-axiom quotient, and the quotient by
extra user equations. Use this one shared presented-category construction;
algebraic tensor ideals are TL's linear analogue, not an assumption here.

Construct interpretations and their extension to raw terms using native
`Functor.Monoidal`, `Functor.Braided` and the rigid/pivotal/ribbon preservation
comparisons. For rigid functors construct the chosen-dual comparison from the
image `ExactPairing`, with naturality, tensor/unit, mate and iterated-dual
compatibility. For ribbon functors add preservation of the twist; reuse
PivotalSpherical's pivotal-functor API. Define composition of interpretations,
change of signature and the monoidal natural isomorphisms between extensions.
Prove soundness for each axiom and additional relation. Establish the
algebraic free/universal property before comparing to geometric diagrams.
For braided rigid functors prove that preserving the specified twist is
equivalent to preserving its corresponding pivotal structure. Consume the
object-level `pivotalBalancedEquiv` and the functor-level Drinfeld/dual
comparison `map_drinfeldIso_hom_comp_mapRightDualIso_hom`; establish the
induced equivalence of functor groupoids used by C6's two presentations.

The accompanying Lean prototype pins the shared monoidal signature and raw
evaluation floor against Mathlib's actual structural category. Its admitted
soundness target is about a syntactically generated congruence, not a relation
defined to mean semantic equality. The README specifies the other five
extensions and the independently constructed geometry.

## G0. Geometric diagrams, gluing and generic presentations

**G0.1. Finite diagrams.** Construct finite directed incidence data with
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

For projection movies use small flat coupons with affine oriented frames.
Prove a relative shrinking/flattening comparison with embedded coupon
two-cells, including attachment germs and parameter families, preserving
the front-facing condition in C2/C5 and the ribbon normals in C6. In this
normal form a generic C6 edge-on coupon event is an isolated rank drop of
its affine projection; do not assume that an arbitrary curved surface has
only isolated singular projection times.

**G0.2. Smooth and PL comparison.** Restrict this comparison to finite
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

**G0.3. Jets and generic families.** Consume Khovanov G's common finite-order
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
families are open at the estimates being used. For a parameter manifold P
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

**G0.4. Typed local move templates.** Fix the positive crossing of two
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

**G0.5. Morse words.** Construct diagrams cut into one-feature horizontal
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

## C1. Monoidal coherence: progressive planar diagrams

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

## C2. Braided monoidal coherence: progressive spatial diagrams

Add positive and negative crossings to progressive planar presentations and
construct their spatial realizations, including the over/under data and
coupon markings. Throughout geometric isotopy require monotone wires,
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

## C3. Rigid coherence: planar duality and winding

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

## C4. Pivotal coherence: planar rotation

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
instance cannot replace it. Compute the two dimensions as ω and ω⁻¹ with
the chosen left/right convention. This is an example, not spherical
coherence as a new target.

## C5. Braided-pivotal coherence: regular isotopy

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

## C6. Shum coherence: framed oriented tangles

Consume PivotalSpherical's `RibbonCategory` definition and its induced pivotal
structure. Add the typed relation `θ_(A*)=(θ_A)*` to C5, with the balance law
and its compatibility already constructed from the chosen pivotal/braided
convention. Construct the corresponding free ribbon category. Compare this
pivotal-generated presentation to the primitive-twist ribbon structure and
its induced pivotal structure using `pivotalBalancedEquiv` and C0's
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
`FreeRibbon(X) ≌ FramedOrientedTangle`. Objects normalize to finite words of
positive/negative oriented points, and endomorphisms of the empty word are
framed oriented links. Give the category-generated version, and prove
comparison with Shum's doubled-strand/framing-number description. Keep
closed-component framing, boundary framing and turning data separate while
proving this comparison; regular isotopy is finer than framed isotopy.

## C7. Evaluation, closure and reusable consequences

For each of the six structures, construct the evaluation functor in any target
carrying exactly that structure, with formulas on generators, structural
pieces, composition, tensor and duality. Prove independence of Morse cuts,
label-preserving isotopy, chosen dual comparisons and representatives.
Establish functoriality in the target via strong structure-preserving
functors, and in the signature via substitution. Prove compatibility of all
six evaluations under the valid forgetful/quotient comparison functors;
there is no forgetful interpretation which deletes framing while leaving
an arbitrary twist unchanged.

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

Give examples evaluating a straight strand, each snake, a crossing and its
inverse, a positive/negative twist, the two pivotal circles and a framed
Hopf link. Compute the Hopf-link value as the trace of the double braiding.
For the object-only braided example detect a nontrivial pure braid, and for
the rigid example retain dual winding. These checks expose unwanted symmetry,
sphericity, pivotality or trivial-twist axioms.

## Proof obligations, order and acceptance

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

## References and source locations

- Joyal–Street, [*The geometry of tensor calculus I*](https://doi.org/10.1016/0001-8708(91)90003-P),
  *Advances in Mathematics* 88 (1991), 55–112, especially the planar
  monoidal theorem and Theorem 3.7 for braided diagrams. Their progressive
  diagrams and tensor schemes supply C1–C2's starting model.
- Joyal–Street, [*Planar diagrams and tensor algebra*](https://science.mq.edu.au/~street/PlanarDiags.pdf),
  unpublished manuscript (1988), especially Theorem 2.7: autonomous
  diagrams and their winding conventions, with PL diagrams. This is
  Selinger's reference [21]. Their separate [*The geometry of tensor
  calculus II*](https://maths.mq.edu.au/~street/GTCII.pdf) is the draft
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
  *Commun. Math. Phys.* 127 (1990), 1–26, Lemmas 5.2–5.3 and Figure 8:
  elementary ribbon/coupon generators and their relations; the functor
  follows from checking those relations once completeness is established.
- Golubitsky–Guillemin, [*Stable Mappings and Their Singularities*](https://doi.org/10.1007/978-1-4615-7904-5),
  Chapter II, §4, Theorem 4.13: jets/multijets and genericity. Adapt the
  theorem to relative, same-parameter families and prove the adaptations.
- Roseman, [*Elementary moves for higher dimensional knots*](https://www.impan.pl/shop/publication/transaction/download/product/89060),
  *Fund. Math.* 184 (2004), 291–310, §§3–7 and Proposition 8.1:
  projected traces, Morse functions on multiple-point/branch loci and the
  curve specialization. Use its method for G0; its unlabelled knot theorem
  does not itself supply the coupon/height/framing completeness required here.

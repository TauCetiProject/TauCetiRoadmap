# Khovanov homology of classical links

Construct ordinary integral Khovanov cohomology as a usable invariant of oriented classical
links: actual resolution circles and saddle maps, a finite bigraded complex, Reidemeister chain
homotopy equivalences, coefficient and based-link APIs, certified computations, and
boundary-fixed cobordism maps with their overall sign ambiguity. Its graded Euler characteristic
recovers the Jones polynomial with the normalization specified below.

The definitive specification is this README. `Suggested.lean` suggests interfaces and is not an
exhaustive checklist.

## Scope, conventions, and suppliers

The diagram input is the existing `TauCeti.OrientedPDCode n`, with native `PDCode.IsPlanar` for
the classical planar theory. Retain the underlying diagram, crossing order, orientation, and all
components meeting no crossing. Use the native half-edge and perfect-matching encoding,
smoothing operations, crossing signs, and `OrientedPDCode.jonesPolynomial`. Construct the actual
finite circle sets and the saddle correspondences acting on them, with cardinality comparison to
the native loop counts.

Consume [GeometricTopology Layer
4](../GeometricTopology/README.md#layer-4-knot-theory-done-properly-owned-here) for geometric link
and diagram carriers and presentation definitions, and Layer 1 for collars, tubes and gluing. G
constructs the finite-labelled relative smooth `ℝ³` comparison required here, with parametrizations,
fixed germs and supported plane-event words. This is the corresponding case and relative
finite-family extension of Layer 4's geometric-to-diagram hard edge. Its inputs from Layer 4 are the
carrier and presentation definitions; construct the additional labelled, relative and actual-plane
comparisons in G. K3 uses the native Jones definition and state weights. GeometricTopology owns
braid closure and the other Jones algorithms and their agreements; Layer 6 supplies generic
link-cobordism carriers. This roadmap constructs the Khovanov complexes and maps, formal local
tangle calculus, relative movie theorem and their specialized geometric adapters. Consume
[DifferentialGeometry](../DifferentialGeometry/README.md) Layer 2 for manifold, pullback and product
orientations and Layer 5 for boundary conventions; construct the link/surface/chart sign comparisons
here. Consume [ConformalMapping](../ConformalMapping/README.md) L5 for Jordan separation and
filled-hull topology and construct the finite polygonal/native-face adapters in G. Khovanov–Seidel
braid actions belong to ZigzagPreprojective.

Use native `TauCeti.SmoothLinkEmbedding I M n` for the finite geometric link family, including
the empty link, and its simultaneous `SmoothAmbientIsotopic` relation. Transport component
labels and orientations explicitly. Use one simultaneous ambient-isotopy witness for the entire
finite family. Use `ℝ³` for the classical ambient-isotopy comparisons here. Its inclusion in
`S³` is an explicit chart comparison, with the avoidance data required in K7.

Use Mathlib's `ModuleCat`, `GradedObject`, `HomologicalComplex`, `CochainComplex`, homotopy, cone,
homology, tensor and finite-module APIs. Consume [DGAInfinity](../DGAInfinity/README.md)'s generic
cochain infrastructure where its interfaces extend the native library. K5 constructs its ordinary
bounded-free derived-tensor comparison over every commutative base; compare with DGAInfinity's
DG-module lane on the hypotheses actually supplied there, without using field-only A∞
strictification over a general ring. Build the
finite-cube totalization and diagram-specific adapters here, including the actual resolution cube.
Generalize the algebraic cube lemmas to additive categories with the finite biproducts they use. K5
constructs the complex-level universal-coefficient, dual Hom/Ext and Künneth theorems for bounded
finite free integral cochain complexes in the native abelian/module framework, then their
quantum-component/scalar-extension adapters. K6 owns the finite free complex/Smith-normal-form
comparison and certificate interface.

| Item | Convention |
| --- | --- |
| Complex | Cochains, differential of bidegree `(1,0)`, shape `ComplexShape.up ℤ` |
| Coefficients | Integral construction; scalar extension to every commutative ring `R` |
| Quantum generators | `1` has degree `+1`; `X` has degree `−1`; `X²=0` |
| Quantum shift | `(M⟨k⟩)ⱼ=Mⱼ₋ₖ`; thus `⟨k⟩` raises degrees by `k` |
| State subset | `S` is the set of B/1 resolutions; native Boolean state is true on its complement |
| Normalization | State cochain degree `|S|−n₋`; quantum shift `|S|+n₊−2n₋` |
| Cube sign | At `a∉S`, `(-1)^(#{b∈S : b<a})` |
| Tensor symmetry | Unsigned on quantum degrees; Koszul signs from cochain degrees |
| Jones variable | Native `T=√t`; compare by the Laurent substitution `T↦−q` |
| Empty link | Complex `R` in bidegree `(0,0)` |
| Unknot | `R` in bidegrees `(0,1)` and `(0,−1)` |
| Reduced unknot | `R` in bidegree `(0,0)`, with a marked component |
| Cobordisms | Smooth oriented compact surfaces in `ℝ³×[0,1]`, with marked boundary links and collars |
| Plane orientation | Standard orientation of `ℝ²`; a crossing-free circle's `true` bit means counterclockwise and `false` clockwise |
| Surface boundary | Outward-normal-first, `∂Σ=−L₀ ⊔ L₁`; at a regular slice `(u,v)` is positive for a surface tangent vector with `dt(u)>0` |

Native cochain shifts include their differential signs. Prove the dictionary from the explicit
normalized state formula to those shifts; keep the degreewise sign correction. The original
paper's braces lower quantum degrees, so its `{k}` is our `⟨−k⟩`. The surface slice convention
is `(time, link)`; Jacobsson uses `(link, time)`. Translate that reversal explicitly in every
geometric orientation comparison. The ordinary theory here is the original paper's `c=0`
coefficient specialization. Its marked-component reduction is constructed in K5. Keep the small
integral construction in `ModuleCat.{0} ℤ`. For coefficients `R : Type u`, use
`Z_u=ULift.{u} ℤ` as the integral coefficient ring in `Type u`. Lift the finite integral
state-module carriers with native `ModuleCat.uliftFunctor ℤ`, then transport their scalar
action along `ULift.ringEquiv : Z_u ≃+* ℤ`. Perform the large-coefficient tensor, Tor,
Ext and Hom comparisons in `ModuleCat.{u} Z_u`. The integer action on `R` uses the ring map
`Z_u→R`. Construct the universe/ring-equivalence transport and its homology, tensor, Tor, Ext
and coefficient-action comparisons, including compatibility with the original small integral
model. Native module tensor/Koszul structures are used with ring and module universes matched;
no native monoidal instance on mismatched `ModuleCat.{u} ℤ` is assumed. After scalar extension,
use `ModuleCat.{u} R` for the native cochain tensor and braiding.

### K1. Resolution circles and local planar calculus

For a native state `s`, construct the finite set of crossing-bearing resolved circles as the
quotient of half-edges by the equivalence relation generated by the native arc matching and
`smoothingTurn (smoothingChoice s)`. Adjoin `Fin crossinglessComponentCount`. Prove the finite
and decidable/effective quotient APIs, representative independence, and the equivalence to
directed `SameCycle(statePerm)` classes modulo reversal. Each undirected circle contributes
exactly two directed traversal cycles, including degenerate two-edge components; prove the
reversal action is free using both perfect matchings. Obtain the cardinal identity with
`stateLoopCount` and reuse its existing positivity results.

Construct transport under half-edge and crossing relabelling, reading a crossing from another
slot, mirror, disjoint union, and permutations of isolated-circle labels. Prove identity and
composition laws. Supply the finite isolated-component bijection in every adapter to an actual
diagram.

Construct the original oriented link's component type as the native `SameCycle` quotient of
`componentPermOutgoing`, together with `Fin crossinglessComponentCount`. Prove its finite cardinal
is the native `componentCount`. Decorate the crossing-free labels by a function to `Bool` whose
multiset is `crossinglessComponents`, and prove independence and permutation transport of that
choice. Construct actual component bijections for all native moves, including those turning a
crossing-free circle into a crossing-bearing component, and prove identity/composition. G supplies
the realized plane geometry, orientation and component data; K4 constructs the comparison words
between native moves and supported plane events. Retain each generator's parameters in a move-data
type and finite path words, with a forgetful map to native `IsReidemeisterMove` and
`ReidemeisterEquiv`. Component and complex transports retain the chosen move data and path. Marks
may lie on an arc or on a crossing-free labelled circle. Construct their selected resolved circle; G
supplies the geometric point comparison. Based moves carry their chosen mark with explicit transport
and slide comparisons, including its position under arc subdivision.

For adjacent states isolate the four local half-edges, identify the unchanged circle classes,
and construct the changed-circle correspondence. Prove that smoothing a genus-zero native
rotation system preserves the required noncrossing condition. Deduce that a classical planar
cube edge is exactly a merge of two circles or a split of one. Prove the four-endpoint matching
classification, including the third exterior pairing that gives a one-to-one change for
nonplanar codes. Derive this noncrossing consequence from the native Euler-characteristic
definition of `IsPlanar`.

Give this implication a finite combinatorial proof. On each connected ribbon graph, contract a
spanning tree, retaining its cyclic orders, boundary cycles and inverse vertex-expansion data.
For the resulting one-vertex chord diagram prove that the maximal boundary-cycle count is
equivalent to a noninterleaving matching, by recursive chord deletion. In particular, two
interleaved bands have one boundary cycle, and each additional band raises the count by at
most 1; an interleaved pair therefore prevents the required `m+1` count for `m` bands. Prove
these boundary-count lemmas directly. Translate the native Euler equality through these
contractions, construct its planar disc/band model, and expand the tree again. Prove smoothing
and the local exterior-matchings dictionary preserve this model. This constructs the
planar/noncrossing interface by finite disc/band operations.

Use the resulting explicit finite PL disc/band models for the local diagram carrier. An open
model has a finite piecewise-affine realization in an oriented closed disc, with labelled ports
on its boundary in the specified cyclic order and standard boundary collars. Its arcs meet the
boundary exactly at those ports. Crossing patches contain exactly their prescribed transverse
double points with over/under labels; the remaining arc interiors and isolated circles are
embedded and pairwise disjoint. Prove gluing, relabelling and full-resolution comparisons for
these actual finite models. The empty-boundary case is the finite PL plane-diagram carrier. G
constructs the comparison of these models with arbitrary generic smooth diagrams.

Define partial resolution at a selected crossing in this local plane/boundary calculus, with its
unoriented finite arc and boundary data; prove its compatibility with the native complete state
smoothing. Prove preservation of the constructed planar model. After every other crossing has
been resolved, prove the exact four-endpoint consequence: the exterior pairing for this planar
cube edge is never the opposite-slot pairing. Use this full-resolution hypothesis in the planar
saddle proof. Construct the separate vertex-resolution operation, which decreases the crossing
count. For a selected crossing of a `PDCode (n+1)`, construct each resolved `PDCode n` by
suppressing the degree 2 vertices and counting every newly detached crossing-free circle. Relabel
the remaining crossings explicitly and prove its planarity, complete state and gluing
comparisons. K5 owns the separate orientation choices for its oriented skein inputs.

Build a finite local planar calculus with explicit boundary endpoints, matchings, isolated
circles, composition by gluing, and arbitrary exterior planar closures. Prove the circle and
saddle constructions commute with closure and gluing. Classify the two-crossing face
configurations needed in K3 and the one-, two-, and three-crossing local configurations needed
in K4. G compares these models with actual smooth plane diagrams, proving each matching and
cyclic-order dictionary.

### K2. The rank-two Frobenius object and circle tensors

Over a commutative ring `R`, use the underlying native dual-number algebra `TrivSqZeroExt R R`, with
`1=(1,0)` and `X=(0,1)`. Write `W=DualNumber R`, the same native carrier `TrivSqZeroExt R R`, with
`X=ε`. Keep the chosen coalgebra on a type synonym or as a local instance, since it is not a
canonical coalgebra on every native dual-number algebra. Construct it with

```
Δ(1)=1⊗X+X⊗1,     Δ(X)=X⊗X,
ε(1)=0,            ε(X)=1.
```

Prove the multiplication table, unit, coassociativity, counitality, cocommutativity, and the
actual native `Coalgebra.IsFrobenius` instance. Export both Frobenius identities identifying
`Δ∘m` with the two mixed composites. Construct the rank-two basis and the perfect pairing
`ε(ab)`, including its dual basis and base-change laws. Retain this chosen Frobenius structure
throughout.

Construct its quantum-graded object `V` in native `GradedObject ℤ (ModuleCat R)` and the
explicit graded direct-sum/underlying-algebra comparison. Multiplication and coproduct have
degree `−1`, unit and counit degree `+1`; export these as maps between the appropriately shifted
graded objects. `W=V⟨−1⟩` has degree-zero unit and multiplication, and `X` degree `−2`. Use
these degrees when packaging the graded maps on `V`.

For every finite circle set construct the indexed tensor, its empty tensor, insertion and
deletion of a factor, reindexing equivalences, and coherence under composition and disjoint
union. Use native graded-object tensor products and their unsigned braiding. Construct the
finite free enhanced-state basis indexed by labellings with `1` and `X`; its quantum degree is
the sum of the label degrees. Prove the comparison with Finsupp on labellings and all
tensor/multiplication/coproduct coefficient formulas.

Assign maps to K1's merge/split correspondences by `m`/`Δ` on the affected factors and identity
on the others. Prove representative, circle-order, and tensor-parenthesization independence.
Prove the disjoint, associative, coassociative and mixed-saddle relations on actual K1
configurations, retaining the correspondence on unaffected circles.

Construct the integral formal local cobordism category for each finite cyclically ordered, based
boundary-port set `B`. Its objects are the finite planar crossingless arc-and-circle diagrams
with boundary `B`, retaining the plane placement and boundary collars. Use finite combinatorial
abstract surface presentations with these marked boundaries, generated by the fixed planar
identity, birth, death and untwisted saddle templates. Retain the compatible seam/collar
orientation data needed to stay in the orientable planar-surgery-generated category. Construct
composition and planar insertion on presentations; prove that their collar matching preserves
admissibility and orientability, and that all surfaces used in the resolution cubes and
elementary movie maps admit such presentations. Retain admissible orientable seam data in its
evaluation domain. Give each template and composite finite triangle adjacency tables with
labelled boundary collars. Generate presentation equivalence by marking-preserving combinatorial
isomorphisms, stellar subdivision of a triangle, subdivision of an edge in its one or two
incident triangles, the inverse moves, and the two-triangle diagonal flip, with their explicit
relative-boundary versions. Carry each boundary subdivision through its collar and the matching
seam marking; keep the prescribed outer collar germ fixed. Prove gluing and planar insertion
respect this generated equivalence, with compatible finite refinements of matched seams. Prove
the identity, associativity, collar-rescaling and planar-insertion laws and the unit/counit
zigzags, saddle associativity/coassociativity, Frobenius and disjoint-interchange identities by
explicit finite move certificates for the small templates. Retain the triangle orientation and
matched-seam profiles, prove admissibility is preserved by every operation, and construct these
profiles for every resolution and movie template. These are two-dimensional surface-presentation
relations established before the movie theorem.

Define formal `χ` on each surface presentation by its finite cell count. Check invariance under
every generating subdivision, inverse and flip by its local vertex/edge/triangle counts, and
prove the seam-gluing formula and connected-component/boundary incidence laws.

Linearize each morphism set over `ℤ` using finite-support formal sums and quotient by the
composition- and planar-insertion-stable subgroup generated by `S`, `T`, and `4Tu`. Here a
closed sphere component is zero, a closed torus component is twice the surface with that
component removed, and `C₁₂+C₃₄=C₁₃+C₂₄` for any four specified pairwise disjoint interior
discs, including discs on different surface components. Here `Cᵢⱼ` removes discs `i,j` and joins
their boundaries by the prescribed orientation-compatible untwisted tube; retain all four
labelled discs and seam profiles in the relation data. Construct the quotient category and prove
these operations descend. For `|B|=2r`, give a surface morphism quantum degree `χ−r`. Prove
identity degree zero, vertical/planar degree additivity and homogeneity of the three local
relations. The abstract-interior formal category, its generated equivalence and this independent
combinatorial grading precede K3. K7 constructs the separate geometric Euler comparison.

Construct quantum shifts of formal objects and their graded morphisms, then the subcategory of
quantum-degree-zero morphisms. Use native `CategoryTheory.Mat_` on that subcategory for the
finite additive envelope, with `Mat_.embedding`, `Mat_.lift` and its finite biproducts.

### K3. Signed cubes, complexes, and Euler characteristic

A finite commutative cube is a functor from the native preorder category on the subsets of its
finite crossing set. Construct its signed height-totalization using finite biproducts and the
chosen crossing order. Prove the differential squares to zero by pairing the two routes around
every face. Provide functoriality for cube maps, face restriction, zero-dimensional cubes,
height shifts, biproducts, and mapping-cone descriptions. Prove the crossing-reordering chain
isomorphism with subset-permutation signs and its identity/composition laws. Use the height
totalization to obtain the actual cochain complex.

Use a quantum-indexed family in `GradedObject ℤ (CochainComplex (ModuleCat R) ℤ)` as the primary
bigraded complex. Define its underlying ordinary complex using native `GradedObject.total`.
The enhanced-state `Finsupp` complex is a comparison model: construct `quantumComplexDirectSumIso`
between it and that total complex, and transport maps, homotopies and homology through this
isomorphism. `Khⁱʲ` and quantumwise UCT use the component complexes; unreduced ordinary homology
uses the total, with its stated comparison to `khovanovHomology` in the prototype.
Use native `GradedObject.Monoidal.tensorObj` for quantum convolution and
`GradedObject.Monoidal.braiding` over `TauCeti.koszulBraidedCategory R`. Supply their actual
`HasTensor` and coproduct-preservation hypotheses from module tensors and the cochain totalization,
with finite quantum support for these complexes. This swaps quantum indices without a quantum
sign; its underlying factor maps use the native cochain Koszul signs. Construct the
degree-exchange comparison with a cochain complex of quantum-graded modules, retaining maps,
shifts, homotopies and totalization. Apply the signed cube construction to K1/K2 for diagrams
satisfying `PDCode.IsPlanar`; all circle merge/split, complex and differential assertions retain
that hypothesis. The unnormalized complex has height-`r` term `⊕[|S|=r] V(Circle(S))⟨r⟩`. The
normalized complex has

```
Cⁱ(D;R) = ⊕[|S|−n₋=i] V(Circle(S))⟨|S|+n₊−2n₋⟩.
```

Give explicit evaluation formulas for every differential block on enhanced states and prove
equivalence of the tensor and finite-free computational models. Establish cochain support in
`[−n₋,n₊]`, finite quantum support, finite free terms and coefficient base change. Define the
quantum-component homology `Khⁱʲ(D;R)` through native homology functors. Prove integral finite
generation, finite-dimensionality over a field, and vanishing outside the finite support. State
homology finiteness over other rings with the necessary Noetherian hypotheses.

Define the integral graded Euler polynomial by rational ranks, and the field version by
dimensions. Prove Euler–Poincaré quantum component by quantum component. For a nonempty diagram,
prove the exact native comparison

```
χ_q Kh(D;ℤ) = (q+q⁻¹) · eval(T↦−q, D.jonesPolynomial).
```

Use native state-weight formulas and prove the crossingwise substitution and all-state product
identity. The native loop exponent is the truncated `k−1`; justify `k≥1` before multiplying by
the extra loop factor. Nonempty means `n+crossinglessComponentCount>0`. Prove the separate empty
comparison `χ=1` and the unlink tensor formula. This state-sum comparison consumes the native
Jones definition and weights; GeometricTopology owns its other algorithms and polynomial
invariance. K5 proves the value at `q=1` after constructing the required component-parity and
mod 2 intersection lemmas.

Construct the finite open-diagram carrier using K1's actual finite PL embeddings in the oriented
disc, with exactly the marked boundary ports in their given cyclic order, boundary collars and
specified crossing patches. Retain local crossing signs, component data and the boundary
marking, and prove the empty-boundary comparison with K1's closed PL carrier. Construct its
normalized finite formal cube and bounded cochain complex in the native `CochainComplex`
category of the degree-zero additive envelope, with the existing A-to-B convention, cube signs
and quantum shifts. Construct planar insertion of these complexes by finite totalization, with
differential sign `(-1)^(r₁+⋯+rᵢ₋₁)` on the differential in factor `i`, where `r_j` is that
factor's normalized cochain degree `|S_j|−n₋(T_j)`, not its cube height. For an ordered list of
crossing blocks, construct the insertion-to-native-cube identification with state sign
`(-1)^(Σ_(i<j) n₋(T_i)|S_j|)`. Prove its action on maps, shifts and homotopies, and compatibility
with associativity, boundary relabelling and crossing-order transport. For every event use the
source and target identifications for that same slot order; their signs change when an event
changes a block's negative crossing count. Keep the planar-insertion slot order fixed. Raw crossing-block
permutations use the subset-permutation cube isomorphism. After normalization, comparison with
the cochain Koszul symmetry includes the constant sign `(-1)^(a b)` for blocks with negative
crossing counts `a,b`; prove this shift/tensor identity here. For a block permutation the constant
is `(-1)^(Σ_(inverted pairs i,j) a_i a_j)`. Prove composition and insertion coherence with these
constants, rather than identifying raw cube reordering with normalized Koszul braiding.

For every planar closing exterior, glue first and evaluate the resulting closed formal category
by the actual K2 Frobenius object. Construct its finite component and incoming/outgoing boundary
incidence data. On each connected closed-boundary surface presentation prove `g=(2−χ−b)/2` is a
nonnegative integer, where `b` is its total boundary-circle count. Prove this from the
admissible oriented template generation, with explicit changes of boundary cycles, components
and cell counts under the seam gluings. Construct the finite gluing-incidence graph and prove
that, for each connected gluing graph `Γ`, `g_out=Σg_v+|E(Γ)|−|V(Γ)|+1` and `b_out=Σb_v−2|E(Γ)|`
when its seams are whole boundary circles. Include the interval-seam/boundary-cycle updates
needed before closure.

For a component with `p` incoming and `q` outgoing circles assign `Δ_q ∘ (m∘Δ)^g ∘ m_p`, with
`m₀=η`, `Δ₀=ε` and the one-factor maps identities. Tensor over components using the marked
boundary correspondences. Prove invariance under the generated presentation equivalence from its
preserved component, boundary and cell-count data. Prove the commutative-Frobenius normal-form
gluing identity: contract a spanning tree of each incidence graph using the Frobenius, unit and
counit equations, and show every remaining edge contributes one handle operator `m∘Δ`. This
proves functoriality, the elementary-template values, permutation coherence and closure/gluing
compatibility directly from the stated construction. Prove the value has quantum degree `χ`.
Show it kills `S,T,4Tu` over `ℤ`, using the perfect-pairing neck-cutting identity
`a=ε(Xa)·1+ε(a)·X` for arbitrary labelled discs. Extend by `Mat_.lift` and cochain totalization,
identifying the complex, maps and homotopies with the native-PD/enhanced-state construction.

### G. Plane geometry, relative extension and smooth link comparison

Construct the smooth plane-diagram adapter from K1's finite PL models: a native code with an
actual finite plane realization of its arcs and crossing patches, compatible with the cyclic
orders and over/under data. The spatial projection is `(x,y,z)↦(x,y)`; the strand with larger
`z` is over. Prove the crossing-sign dictionary in these coordinates, including the comparison
with the geometric presentation interface and the native right-handed trefoil. Require exactly
the recorded transverse double points, with no additional intersections, triple points or
tangencies; away from crossing patches the realized arcs and isolated circles are disjoint.
Prove the equivalence with a generic smooth immersion of the finite oriented circle family after
the controlled smoothing construction. Construct relative polygonalization and smoothing of
these finitely many arcs, using compactness and Layer 1 tubular charts, preserving the crossing
patches, isolated-circle labels and actual complement regions. Use continuous/PL ambient
isotopies for the polygonal-to-smooth comparison and retain a chosen controlled smooth rounding;
construct smooth ambient isotopies between such roundings by G's relative extension. Consume
ConformalMapping L5's Jordan separation and filled-hull API to construct the finite
polygonal/plane-graph complement dictionary, including PL-disc and boundary-orientation
comparisons. Construct the finite diagonal/ear triangulations and their effective cell
refinements using that separation theorem. For a connected crossing-bearing component identify
native face cycles with its complement regions; for disconnected components retain the
containing-region and nesting data, rather than identify all individual face cycles with global
regions. Include bridges, loops, parallel edges and isolated circles. Define a simple oriented
polygonal circle to be counterclockwise when its signed shoelace sum `Σ det(vᵢ,vᵢ₊₁)` is
positive in standard oriented `ℝ²`. Prove nonvanishing, the reversal law, cyclic subdivision
invariance and the boundary-orientation dictionary. Define the counterclockwise convention for
its controlled smooth roundings by transport and prove independence of the chosen admissible
rounding. Retain its unbounded region and the relative placement and nesting of split components
and crossing-free circles. Describe these regions and placements through the realized
complement, including the empty diagram and its unbounded region. Export the forgetful map to
the native code, component labels, the outer-face dictionary for crossing-bearing components,
and transport under actual plane ambient isotopies. Retain the actual ambient-isotopy witness
when a relabelling or slot rotation is realized geometrically.

For every native circle constructor prove the bit translation from its outgoing-slot orientation
data, local frame and bounded-side placement. In particular, in the arc-left-to-right circle-clasp
frame with first slot 0 west and second slot 1 west, `o=true` traverses the upper arc left-to-right
and lower arc right-to-left: the small-lune circle is clockwise, while the enclosing-circle
placement is counterclockwise. Reverse these conclusions for `o=false`, retaining the placement data
in every comparison between constructor parameters and plane-adapter bits. Construct the orientation
translations and component maps needed for each supported geometric event. G owns these frame, bit
and placement dictionaries; K4 owns their comparison words with native moves. In particular, a raw
native circle generator need not be a single supported plane R2 event in every chosen realization.
Retain unaffected component bijections and explicit changed-component incidences in that dictionary.
Construct explicit geometric comparison movies when changing the outer region or component nesting.

Own a common finite-dimensional relative general-position floor for the one-parameter link
comparison in G and two-parameter movie comparison in K7. For each fixed finite jet order and
sheet bound construct finite-jet and multijet evaluation maps for compact smooth families of the
given link or surface embeddings. The collision strata and normal forms specific to each theorem
are constructed in its milestone. Build finite polynomial/bump perturbations in one common
finite-dimensional parameter space for those fixed jet-order and sheet bounds, and prove
evaluation is a submersion at every distinct-point configuration. Derive the polynomial degree
bound by finite jet interpolation at those points. Exhaust the critical/failure loci in
countable configuration charts by compact pieces. Construct each bad-stratum incidence manifold
and its projection to the common parameter space; prove the equivalence between
slice-transversality failure and projection criticality. Use native
`TauCeti.interior_image_criticalPoints_eq_empty` on its finite-dimensional charts, with the
sufficient regularity bound `dim(source)^2+1` met by smoothness. Compact critical-piece images
are closed with empty interior and hence nowhere dense. Apply finite-dimensional Baire, via
`dense_iInter_of_isOpen`, to obtain a single generic parameter in every sufficiently small
parameter ball. Prove this simultaneous choice for all the configuration charts. Treat
coincident-point strata and mixed configurations with prescribed collar jets separately,
checking the corresponding relative transversality conditions. Construct the local
projection/family adapters against native smooth charts, bump functions, finite-dimensional
implicit-function and Sard theorems and their actual hypotheses. Construct this entirely
finite-dimensional floor independently of the Khovanov maps and movie relations.

Own the relative ambient-extension adapter used in these comparisons. Consume the native
finite-dimensional maximal-integral-curve smoothness, flow-domain openness and escape APIs, with
DifferentialGeometry Layer 3.2/3.3/3.5 in finite dimensions and GeometricTopology Layer 1 tubular
neighborhoods. For joint finite-dimensional parameter dependence, adjoin stationary parameter
coordinates and the evolution-time coordinate to the vector field, retaining its finite-time
confinement and endpoint extension hypotheses. For compact smooth families of embeddings fixed on
specified open germs, construct parameter-dependent tubular/slice extensions of their velocity using
finite local inverse-function charts, partitions of unity and compact cutoffs. Prove one compact
spatial support and joint smoothness, and construct the time extension from endpoint-constant germs.
Prove the time-dependent flow exists on the entire compact parameter interval using that support and
the maximal-flow continuation/escape criterion. Bundle the native `Diffeotopy`, with the original
velocity equation along every component, and prove identity on fixed germs and simultaneous
component transport. Construct the jointly smooth inverse by reverse evolution and uniqueness. For
the suspended field `(1,V)`, prove confinement on each compact time band. Its time component is
constant; the coordinate preserved by `Diffeotopy` is evolution time, distinct from physical movie
height. Include the parameter-family version and subdivision/composition laws. K7 constructs the
separate boundary jet/collar and cylindrical-end adapters before applying this boundaryless flow
construction.

Construct the relative finite-labelled smooth one-parameter projection/Reidemeister theorem in `ℝ³`,
with the data described above. Its endpoints are realized G plane diagrams with finite component
labels and orientation-compatible parametrizations. For one simultaneous native smooth ambient
isotopy, make the parameter constant near its endpoints and use G's relative genericity and
extension to construct a small generic perturbation preserving those endpoints and any prescribed
generic fixed germs. Prove the planar-isotopy/R1/R2/R3 local normal forms, with all orientations and
over-strand possibilities, and a finite event subdivision. Export an actual supported plane-move
word with component and endpoint transports. Prove the converse by constructing simultaneous smooth
ambient realizations of those supported moves. Construct generic representatives and chosen
comparison isotopies for arbitrary finite labelled smooth links, and prove the polygonal-to-smooth
bridge with its relative parametrization laws. Compare this labelled relative theorem with
GeometricTopology's geometric and diagram presentation definitions. Export its oriented, framing-forgotten, single-component specialization after forgetting the
component label, and construct the comparison of its presentations.

Construct G's chosen smooth geometric closure of every native finite braid word: strands run
upward in increasing rightward positions, with disjoint nested return arcs on the left. Build
the corresponding plane diagram and spatial PL realization with crossing heights, then its
controlled smooth rounding as a finite native `SmoothLinkEmbedding`, retaining the component
labelling and orientation-compatible parametrizations. Prove its native PD closure comparison,
including unused strands and the empty-word/empty-strand cases. The single-component case
admits the subsequent GT knot-presentation comparison; the general closure is a labelled link.

For each orientation-preserving smooth diffeomorphism of the standard circle, construct an
increasing smooth period-one lift `F:ℝ→ℝ`, and interpolate by `(1−ρ(t))x+ρ(t)F(x)` with
endpoint-constant `ρ`. Prove positive derivative, descent to the native circle and jointly
smooth inverse by the finite-dimensional inverse-function theorem. Reuse native
`SmoothEmbedding.compDiffeomorph`. Apply the relative extension to a finite family of these
embedded circle isotopies simultaneously. Export one ambient `Diffeotopy` satisfying the
pointwise native `SmoothAmbientIsotopic` equation for all component parameters. Retain the
chosen lifts and paths as comparison data, with component permutations recorded separately.

### K4. Reidemeister chain homotopies and link invariance

Construct the local formal Reidemeister chain maps, inverses and homotopies in K3's
quantum-degree-zero additive category, for every oriented first, second and third move, their
mirrors, placement variants and inverses. Prove the closed Frobenius-evaluation comparison with
degree `(0,0)` maps and degree `(-1,0)` homotopies on the native-PD complexes. Establish the
formal homotopy identities before applying closed evaluation. Include crossing-free components,
relabelling and rotation of local slots. Use the actual native local moves and their
face/locality hypotheses. Retain the planar locality condition on clasp insertions used as
second moves.

Construct the planar-restricted native move relation. Prove planarity in both directions for
every native generator, supplying the arc-insertion first-move and different-rotation-component
clasp lemmas with the hypotheses needed to restrict the native relation to planar codes. For a
clasp joining different rotation components retain a placement-chosen planar closure and prove
its local comparison directly by the formal local surface identities. Cover all eight native
generators: relabelling, slot rotation, arc first move, circle first move, arc/arc clasp,
arc/circle clasp, two-circle clasp and triangle third move. For arc first insertion prove face
count increases by 1 and graph-component count is unchanged. For the different-graph-component
clasp prove face count is unchanged and graph-component count decreases by 1; reuse native
`faceCount_insertClasp_of_face_ne` for the face identity and use the two identities in the
native Euler criterion. Keep graph components separate from link components. Retain the exact
clasp-side face equation and the full `HasReidemeisterThreeTriangle` hypotheses, including its
over-strand constraint. For a second move involving two parts of one arc, construct the derived
kink–clasp–inverse-kink sequence with its local exterior comparison and the native distinct-arc
hypotheses. Own the dictionary between GeometricTopology's diagram relation, native
`IsReidemeisterMove`, and the plane-diagram adapter's geometric moves. Include the placement
hypotheses and actual move words needed to compare their equivalence relations, retaining each
plane event's geometric witness. For every local plane move retain its actual changing disc, the
specified diagram inside it and the identification of the unchanged exterior. Require that the
disc contains no additional split component or isolated circle. Supply this actual empty-disc
witness in addition to the intrinsic face condition. Separate abstract code planarity from
admissibility of a move in a fixed plane realization; when only an existence comparison is
required, supply compatible placements and their comparison movies explicitly.

Construct the formal deformation retractions using the local surface relations and native
homotopy/cone APIs. Prove their closed cancellation comparisons: after Frobenius evaluation the
first move gives `C(D′)≃C(D)⊕Cone(id)` with its actual grading shifts and surviving summand
`C(D)`, while the second removes the two contractible summands and retains the closure. For the
third construct the formal comparison maps and homotopies and prove the compatible
surviving-complex/cone comparison after evaluation. Use the formal surface identities for formal
cancellations and the evaluated rank-two module for the separate closed cancellation comparison.
Prove the equations on generators and all quantum/cochain shifts. Carry every admissible
exterior K1 closure and its cube maps throughout. Prove each oriented variant and
crossing-reordering sign with its explicit parameter transport.

Deduce homotopy equivalences for finite move sequences and graded homology isomorphisms, then
invariance under simultaneous smooth ambient isotopy in `ℝ³` using G's theorem and plane-diagram
dictionary. For a native `SmoothLinkEmbedding` in `ℝ³`, choose a generic realized diagram and a
simultaneous pointwise ambient comparison, using G's reparametrization theorem when oriented
component images were initially matched. Define its complex and homology from that presentation
and prove any two choices give graded chain-homotopy equivalences and graded module
isomorphisms. Export a chosen generic representative for each native smooth link with chosen
comparison equivalences. Prove identity and concatenation/composition laws for those specified
comparison words in the homotopy category, retaining them in the maps. Before K7's
movie relations, this is invariance of the complex up to homotopy and of homology up to
isomorphism. K7 constructs the projective comparison-map laws while retaining boundary motions.

### K5. Exact sequences, coefficients, symmetry, and based links

For a selected crossing, put it first in the crossing order and decompose its cube into the 0
and 1 faces. Prove the unnormalized short exact sequence with 1-face term `C̄(D₁)⟨1⟩[-1]`,
middle `C̄(D)`, and quotient `C̄(D₀)`, including the shift differential sign. Construct the
saddle map and the cone comparison with its sign on the 1-face summand. Export the resulting
long exact sequence and translate every normalized version by the actual `n₊,n₋` of the three
oriented diagrams. The coherent smoothing inherits the original orientation; choose an
orientation on every component of the other smoothing. Retain the crossing-free Boolean labels
as explicit orientation/placement data, derived from G when a geometric realization is used;
the unnormalized complex does not depend on those choices. For face `r∈{0,1}`, set
`a_r=n₋(D)−n₋(D_r)−r` and
`b_r=r+n₊(D)−2n₋(D)−n₊(D_r)+2n₋(D_r)`.
The normalized face term is `C(D_r)[a_r]⟨b_r⟩`. On a residual state `S′`, its identification
with the full cube face has sign `(-1)^((n₋(D)−n₋(D_r))|S′|)`: the face differential has
sign `(-1)^r`, whereas the shifted differential has sign `(-1)^(a_r)`. Prove this signed
identification, the 1-face inclusion/0-face quotient maps and the resulting connecting-map
signs for the actual chosen orientations.

Construct the complex-level algebra for bounded finite free `ℤ`-cochain complexes. For an abelian
group `M`, prove the natural sequences

```
0 → Hⁱ(C)⊗M → Hⁱ(C⊗M) → Tor₁(Hⁱ⁺¹(C),M) → 0,
0 → Ext¹(H¹⁻ⁱ(C),M) → Hⁱ(Hom(C,M)) → Hom(H⁻ⁱ(C),M) → 0.
```

Use native `TauCeti.linearHomComplex` with target the cochain complex concentrated in degree zero at
`M`, and construct the identification `Hom(C,M)ⁱ=Hom(C⁻ⁱ,M)`. Its differential is `f↦(-1)^(i+1) f
d_C`; the dual complex is the case `M=ℤ`. When `M` underlies `R`, construct its `R`-action on
this integral Hom complex through native `linearHomComplexPostcomp` applied to multiplication by
each scalar; prove that it agrees with the pointwise action and the induced homology action.
For two bounded finite free integral complexes prove

```
0 → ⊕[p+q=i] Hᵖ(C)⊗Hᑫ(D) → Hⁱ(C⊗D)
  → ⊕[p+q=i+1] Tor₁(Hᵖ(C),Hᑫ(D)) → 0.
```

Construct the canonical comparison maps and prove exactness, naturality and chain-homotopy
compatibility. Define `Zⁱ=ker dⁱ` and `Bⁱ=im dⁱ⁻¹`, prove these submodules finite free, and split
`0→Zⁱ→Cⁱ→Bⁱ⁺¹→0` using projectivity of `Bⁱ⁺¹`. Use the resulting decomposition into two-term free
presentations to prove exactness and existence of splittings. The presentations `0→Bⁱ→Zⁱ→Hⁱ(C)→0`
need not split. Compare their tensor kernels and Hom cokernels with native derived Tor and
`CategoryTheory.Abelian.Ext`, using the `ModuleCat` `HasExt` instance and the two-term projective
presentations. The free presentation resolves the first tensor variable: construct its comparison
with native `CategoryTheory.Tor'` and the finite-resolution balancing comparison with
`CategoryTheory.Tor`, which derives the second variable, naturally in both inputs. Prove the
sequences split without a natural simultaneous choice. For `M` the additive group of a commutative
ring `R`, prove the coefficient and Hom/Ext sequences and their chosen splittings are `R`-linear.
Construct the `R`-actions on the native Tor and Ext groups through functoriality of the coefficient
module, and prove the comparison maps preserve those actions. Apply the construction to finite
quantum summands; tensor quantum degrees add and dual quantum degrees reverse. Export the
coefficient sequence with terms `Khⁱʲ(D;ℤ)⊗R` and `Tor₁(Khⁱ⁺¹ʲ(D;ℤ),R)`. Prove the disjoint-union
cochain tensor equivalence: when the first crossing block precedes the second, its enhanced-state
sign is `(-1)^(n₋(D₁)·|S₂|)`. Prove the crossing-reordering comparison and bind factor symmetry to
native `TauCeti.koszulBraiding` and `TauCeti.koszulSymmetricCategory`, with unsigned quantum
symmetry. More precisely, let `σ₁₂:C(D₁⊔D₂)→C(D₁)⊗C(D₂)` have the displayed state sign,
let `ρ` reorder the two crossing blocks with subset sign `(-1)^(|S₁||S₂|)`, and let `β` be
the native cochain braiding. Prove
`σ₂₁ ρ = (-1)^(n₋(D₁)n₋(D₂)) β σ₁₂`, including the corresponding block-permutation
coherence from K3. Apply the displayed integral Künneth sequence.

Construct the mirror equivalence with the finite free graded dual complex. Over a field deduce
`Khⁱʲ(mirror D)≅Kh⁻ⁱ,⁻ʲ(D)ᵛ`. Over `ℤ` give the Hom/Ext exact sequence; the torsion comparison
reverses cochain degree with the additional `+1`, with both the Hom and Ext terms. Prove full
orientation reversal and the single-component reversal regrading. With `l` half the original
signed crossing count between the selected component and all other components, reversing that
component increases `n₋` by `2l` and decreases `n₊` by `2l`; new bidegrees are old bidegrees
minus `(2l,6l)`. Construct this integer diagram linking count here: prove that the
mixed-crossing sum is even by the finite genus-zero native rotation-system mod 2
cycle/face-boundary calculus. Build the incidence and face-boundary comparison, including loops
and parallel edges, and prove that the selected union of link components bounds a face 2-chain.
Translate this to mod 2 plane-curve intersection parity through G's realization dictionary. Prove
its Reidemeister and relabelling invariance, orientation-reversal law and additivity over the
other components. Use this explicit diagram invariant and its proved intersection-sign
normalization in the regrading formula. For disconnected diagrams apply the native face
calculation componentwise and use G's containing-region data in its geometric comparison.

After the planar merge/split floor, construct the oriented Seifert smoothing and its
outgoing-half-edge permutation. Prove from the native crossing-sign/A/B definitions that it uses
B precisely at negative crossings. Compare its successor permutation to the original component
permutation by one outgoing-continuation transposition per crossing, proving `s−n+c` even for
`s` Seifert circles, `n` crossings and `c` components, including isolated circles. Since
`|S|+k(S)` has constant parity along every planar cube edge, deduce every quantum degree is
congruent to `c` modulo 2.

Prove the normalized enhanced-state Euler sum `E(D)=Σ_S (−1)^(|S|+n₋) 2^k(S)` equals `2^c`.
Prove crossing-change invariance by the actual A/B state bijection. Construct the oriented
planar smoothings and use the proved parity to obtain the normalized recurrence
`E(D)=−(−1)^c[(-1)^c_A E(D_A)+(-1)^c_B E(D_B)]`. Prove the component-count alternatives: for
strands on different components both smoothings have `c−1` components, and otherwise their
counts are `{c,c+1}`. Induct on crossings from the unlink value, explicitly accounting for
reorientations of the smoothings. Deduce nonvanishing over `ℤ` and `ℚ`, including the empty
case, before the K6 support-length arguments.

Construct the quantum-graded algebra `W` as the native graded family with `R` in degrees `0`
and `−2`, zero elsewhere, generator `X` in degree `−2` and `X²=0`. Its underlying algebra is
`DualNumber R`, while the Frobenius circle module is `V=W⟨1⟩`. Construct graded `W`-modules as
quantum-graded `R`-modules with this homogeneous action, the degree-zero balanced graded tensor
product, unit/associativity and scalar/opposite comparisons. In particular the commutativity
is unsigned in quantum degrees. These carriers precede the graded periodic resolution and
the based connected-sum calculation.

For a mark on an arc or crossing-free labelled circle construct its selected resolution circle
and the `X` chain action of quantum degree `−2`. Prove its square is zero and its compatibility
with every saddle. Define the reduced complex as `(X·C)⟨1⟩`, prove its identification with
`(C/X·C)⟨−1⟩`, and export the short exact sequence

```
0 → C̃⟨−1⟩ → C → C̃⟨1⟩ → 0.
```

Prove based Reidemeister invariance and transport of the mark. For a slide across one crossing,
construct the signed reverse-saddle homotopy `H` of cochain degree `−1` and quantum degree `−2` with
`X_p+X_q=dH+Hd`. Verify `Δm=X⊗id+id⊗X`, `mΔ=2X`, full signed-cube cancellation with unaffected
edges, and the additional identities `H²=0` and `H X_p=X_q H`.

Use native `TauCeti.dualNumberProjectiveResolution R` of `dualNumberResidue R` over `W=DualNumber
R`. Reuse its projectivity and augmentation quasi-isomorphism, its term identifications
`dualNumberProjectiveResolutionXIso`, and its multiplication-by-`ε` differential and augmentation
formulas. Construct the quantum-graded lift, reindexing chain degree `n≥0` as cochain degree `−n`
and assigning its free generator quantum degree `−2n`. Prove the reindexing/forgetful comparison,
homogeneous differential and exactness by transport from that native resolution. For a dot action
`a`, its direct-sum total tensor with `C` has terms `m[X]^n` and differential
`D_a(m[X]^n)=d(m)[X]^n+(-1)^p a(m)[X]^(n−1)` for `m∈C^p`, omitting the second term at `n=0`. Prove
termwise graded `W`-freeness of `C` via its selected circle and that each total cochain degree uses
finite sums.

Set `a=X_p` and `b=−X_q`. Define `K(m[X]^n)=(-1)^p H(m)[X]^(n−1)` for `n>0`, zero for `n=0`. Prove
`id+K` is a homogeneous chain isomorphism from `D_a` to `D_b`, with inverse `id−K`: its remaining
equations are `dH+Hd=a−b`, `Ha=−bH` and `K²=0`. Prove the canonical augmentations to `C/aC` and
`C/bC` are quasi-isomorphisms by the finite filtration of bounded, termwise `W`-free `C`. Prove
their cones are contractible as bounded-above free `R`-complexes by descending projective
splittings, quantum component by quantum component. Choose homogeneous homotopy inverses and obtain
actual reduced chain maps, inverses and homotopies through these augmentations, the
periodic-resolution isomorphism and the shifted image/quotient identifications. Retain the target
action twist `X↦−X`. Verify compatibility of the local actions and `H` with each exterior operation,
and deduce exterior naturality in the homotopy category, where the augmentation inverses are unique.
Prove identity/concatenation laws for the chosen mark-slide words. Construct comparisons of marks on
the same component and the reduced/unreduced exact-sequence comparisons, including their
action-twist signs and commuting homotopies.

Retain the marked component in the invariant of a multicomponent link. Construct oriented based connected sum on the native codes,
together with G's plane-placement, labelled mark and comparison data. A crossing-bearing mark is
an actual marked arc, represented by its outgoing half-edge; a crossing-free mark is a labelled
occurrence of the orientation multiset, not merely a Boolean value. Supply a compatible exposed
plane placement: the marked arcs/circle portions lie on the specified exterior faces or
appropriate common complementary region, and a standard untwisted rectangular band is embedded
in that actual region with oriented ends and empty interior. An intrinsic native face is not by
itself this band witness. Construct any needed based comparison movies from the original plane
placements. The operation is parameterized by these data; prove independence through based
comparison maps with their retained band and outer-region data.

For two crossing-bearing marks, form the native oriented disjoint union, choose the first marked
outgoing endpoint `p` and the second marked incoming endpoint `q`, and apply native
`PDCode.reconnect p q`. The unchanged half-edge orientation is compatible because the new pairs
are outgoing/incoming. Retain the native crossing/over-strand blocks. If exactly one selected
component is crossing-free, remove that labelled circle occurrence and lengthen the other marked
arc, retaining the disjoint-union crossing matching. If both selected components are
crossing-free, remove the two marked occurrences and insert the one oriented output-circle
occurrence fixed by the band presentation. Construct the actual occurrence-label bijections,
output mark and untouched-component maps in every case. Prove planarity for these constructors,
their comparison with the standard geometric oriented connected sum, component count decrease by
one, and `n₊,n₋` additivity for the actual input/output codes. Reuse native disjoint-union sign
and planarity lemmas and construct the oriented reconnection and connected-sum adapters here.

For every resolution prove the actual circle-set bijection: the selected circle from each input
is merged to the selected output circle, and all other circles are retained. With native `W=DualNumber R`
in cochain degree zero and quantum degrees `|1|=0, |X|=−2`, use the graded module and balanced
tensor carriers constructed above. Each resolution
module is a finite free graded `W`-module via its selected circle. Prove the actual graded chain
isomorphism

`(C(D₁) ⊗_W C(D₂))⟨−1⟩ ≅ C(D₁#D₂)`.

Its statewise map multiplies the two selected-circle labels and is the identity on the other
labelled-circle factors. When the first diagram's crossings precede the second's, include the
state sign `(-1)^(n₋(D₁)·|S₂|)` comparing the signed normalized cube with the standard cochain
tensor differential; prove its compatibility with other crossing orders. Prove that the map is
balanced, invertible, `W`-linear and quantum-degree zero after the displayed shift, including
every crossing-free case. Under interchange of the two based factors, retain the same
normalization constant `(-1)^(n₋(D₁)n₋(D₂))` between raw crossing-block reordering and the
cochain Koszul symmetry on the balanced tensor; prove its compatibility with the connected-sum
map and the quantum shift.

After forgetting quantum degrees, construct the finite semi-free filtration of these bounded
complexes of finite free `W`-modules by successive cones of shifted free modules. Prove K-flatness
and K-projectivity from this filtration, reusing native bounded-above projective-complex
K-projectivity. Choose the native `HasDerivedCategory.standard (ModuleCat W)` localization,
with the universe/smallness hypotheses of that declaration. Define the derived tensor of
bounded-above module complexes there by bounded-above projective/K-projective resolutions.
Construct its functorial maps and the canonical comparison isomorphisms between choices, unique
when required to commute with the specified augmentation comparisons; prove unit, composition
and balanced-tensor laws. For the present bounded free factors, prove explicitly that
`P₁⊗_W C₂→C₁⊗_W C₂` from an augmentation is a quasi-isomorphism, and its second-variable
version, by the finite filtration. This identifies their ordinary tensor with the derived
tensor just constructed. This ordinary-module comparison is owned here over every commutative `R`; it does not
use an enveloping A∞ algebra or a field-only strictification theorem. Regard `W` as the degree-zero
ordinary DG algebra using DGAInfinity Layer 1, and construct its `Wᵒᵖ≅W` right/left-module adapter.
Compare the resulting finite semi-free module and tensor with DGAInfinity Layer 5 on that
contract's supplied hypotheses. Retain the graded chain isomorphism and its graded homology maps
as the separately constructed quantum comparison.

### K6. Certified computations and applications

Make the circle quotient, finite enhanced-state basis, differential and maps effective.
Construct integer matrices and a Smith-normal-form certificate API that proves cycles,
boundaries and the homology invariant factors, with explicit comparison to the abstract complex.
Compute over fields by certified row reduction and verify coefficient and Euler comparisons.
Basis permutations and certificate choices must preserve the answer.

Pin concrete native PD codes or specified braid closures for the empty link, unknots, unlinks,
the positive and negative Hopf links, and both trefoils; prove their planarity, orientations and
realization comparisons. Give every nonzero bigraded group and prove all others vanish. In the
conventions above the positive trefoil has free groups `ℤ` at `(0,1),(0,3),(2,5),(3,9)` and
torsion `ℤ/2` at `(3,7)`; use native `rightHandedTrefoilPDCode` for this comparison. Its reduced
groups are `ℤ` at `(0,2),(2,6),(3,8)` and zero elsewhere. The negative trefoil follows with the
integral mirror torsion shift. The positive two-crossing Hopf closure has free `ℤ` at
`(0,0),(0,2),(2,4),(2,6)`. Verify these identifications from the actual diagrams and matrices,
not solely from their Jones polynomials. Include the reduced computations and the tensor/UCT
tests that distinguish rational ranks from integral torsion.

For `m≥0`, define the native diagram for `T(2,m)` as `TauCeti.BraidWord.closure` of
`List.replicate m (0,1) : BraidWord 2`; for `m<0` use `|m|` copies of `(0,−1)`.
Use native `crossingSign_closure`, `writhe_closure` and the `nextCrossing` arc equations:
for positive word length, `(k,1)` joins `(k+1,0)` and `(k,2)` joins `(k+1,3)`, cyclically.
Prove planarity by the two-strand strip with positions increasing rightward and strands running
upward. Put the outside closing arcs on the left, with their explicit nonintersecting nested
placement; at `m=0` the resulting crossing-free circles are counterclockwise, as required by
native `closure_nil` and its all-true bits. For every `m`, compare this diagram with G's chosen
labelled smooth geometric closure, through G's plane-to-spatial PL and controlled smooth
rounding adapters, retaining orientations and the left closing arcs. When `|m|` is odd,
construct the native-word/GT presented-braid-word adapter and prove that native `closure`
agrees with GT's `closes` function and its knot realization. Prove that single-component
spatial PL/smooth comparison. For even `m`, retain the two-component labelled-link carrier
of G rather than infer a multi-component GT knot carrier. None of these word, diagram or
plane/spatial comparisons is a type identification.
Each crossing swaps the two strand positions; prove the component count is two for even `m`
and one for odd `m`, using native `closure_nil` separately at `m=0`. Construct the recurrence of
complexes from K5's crossing cone and K4's cancellation and prove the following unreduced
integral formula. For `m≥2`, each listed free group is `ℤ`, each listed torsion group is `ℤ/2`,
and all other groups vanish:

| Condition | Bidegrees |
| --- | --- |
| Free, every `m≥2` | `(0,m−2)`, `(0,m)` |
| Free, `1≤r≤⌊(m−1)/2⌋` | `(2r,m+4r−2)`, `(2r+1,m+4r+2)` |
| Torsion, `1≤r≤⌊(m−1)/2⌋` | `(2r+1,m+4r)` |
| Additional free, even `m` | `(m,3m−2)`, `(m,3m)` |

`T(2,1)` is the unknot. `T(2,0)` is the two-component unlink: its free groups have ranks `1,2,1` at
`(0,−2),(0,0),(0,2)`. For `m<0`, use the proved oriented mirror comparison with `T(2,−m)`: free
summands at `(i,j)` go to `(−i,−j)` and torsion summands at `(i,j)` go to `(−i+1,−j)`. Prove these
identifications from the recurrence and matrices, including the separate zero and one-crossing
cases. The original paper's displayed torus family is left-handed in these conventions; translate
its specialized integral formula through this mirror comparison. For adequate diagrams define both
adequacy conditions by the actual extreme-resolution merges and prove nonvanishing at the two
extreme cochain degrees. Prove homology is nonzero for every link: at `q=1` its Euler characteristic
is nonzero, including the separate empty case. Define integral cochain support length from `Kh(D;ℤ)`
as the largest supported cochain degree minus the smallest, using finiteness and this nonemptiness.
Deduce that this length is bounded by crossing number and an adequate `n`-crossing diagram realizes
crossing number `n`. Construct the required presentation-minimum adapter: use G's proved
generic-presentation theorem to define the least crossing count among planar oriented PD codes
realizing the link, and prove its minimum, isotopy and diagram-comparison laws. Use this
presentation minimum as the crossing-number definition, retaining the actual realization witnesses.
Construct these minimum and realization comparisons against the actual native carriers.

### K7. Movies and projective cobordism maps

The objects of the movie category are realized G plane diagrams, carrying the corresponding
native labelled smooth links and their orientation-compatible parametrizations. Thus the
prescribed endpoint projections are already generic. Use G's generic representative and
comparison-isotopy theorem to compare with arbitrary smooth links, retaining the chosen generic
endpoints. Construct the marked, collared link-surface adapter to the geometric owner's
`S³×[0,1]` cobordisms with those objects. Retain boundary parametrizations by the source and
target native finite link families and product collars matching those parametrizations. Define
the equivalence by boundary-fixed ambient isotopies preserving the prescribed collar germs.
Construct identities, collar-compatible composition and its comparison isotopies, retaining
simultaneous component labels and the incoming/outgoing boundary orientation signs. Prove the
category laws by collar rescaling and prove composition is well-defined on the isotopy quotient.
Construct the forgetful comparison with geometric cobordisms using Layer 1 gluing. Construct
these decorations and relative equivalences against the generic cobordism carrier. Boundary
markings here are the component-labelled boundary parametrizations; the based-link point of K5
is separate data. For neat geometric surfaces construct collar straightening rel the marked
boundary. Use the actual collar coordinates and the transverse normal-coordinate derivative to
build a boundary-preserving local displacement and its smooth parameter-family extension; prove
the required inverse-function and cutoff estimates in those coordinates. Construct the
boundary/collar extension data used by G's ambient extension, including the matching jets and
open collar coordinate formulas. For a product-collared surface in `ℝ³×[0,1]`, attach constant
cylindrical ends at both boundary links, constructing a proper smooth boundaryless embedding in
`ℝ³×ℝ` with closed image. Prove the compact-family version. Extend fixed-collar embedding
isotopies constantly over the ends, so velocity is zero on open neighborhoods of physical
heights 0 and 1 and on the tails. Apply the closed-submanifold tube/slice construction to this
extended surface, and the velocity extension to its compact moving core. Choose its ambient
compact support away from the fixed hyperplane neighborhoods and extend the field by zero there.
Apply the native finite-dimensional flow API and DG3.2/3.3/3.5 in boundaryless `ℝ⁴`, prove
finite-band confinement and construct the smooth
inverse evolution. Uniqueness fixes the open hyperplane neighborhoods and proves forward and
inverse evolution preserve the closed slab. Restrict the jointly smooth total maps to the slab's
product boundary model to bundle the actual native `Diffeotopy`; its generic spatial
`ModelWithCorners` permits this model. Prove it realizes the original isotopy and fixes the
marked collars. For isotopies between product-collared surfaces, straighten relative to their
endpoint collar germs and fixed marked boundary. Prove the relative-family version and compare
boundary-fixed isotopy with the fixed-collar equivalence, retaining choices and their comparison
isotopies. Construct the category of compact surfaces in `ℝ³×[0,1]` by affine-chart restriction
of this adapter. Supply the point at infinity, the chart, and avoidance of its cylinder; prove
that pullback preserves embeddings, boundary identifications, collars, isotopies, identities and
gluing. Retain these chart data under composition. Identify the round `S³` with `{(v,w)∈ℝ³×ℝ :
‖v‖²+w²=1}` in the standard coordinate order and fix infinity `p=(0,0,0,1)`. Use the explicit
chart `φ(v,w)=v/(1−w)`, with inverse `y↦(2y/(1+‖y‖²),(‖y‖²−1)/(1+‖y‖²))`. Prove the denominators
are nonzero on the specified domains and construct the restricted smooth diffeomorphism. Compare
it with Mathlib's `stereographic'` through its actual orthonormal-coordinate identification:
the comparison is `1/2` times an orthogonal map `U` (native `stereographic` has numerator `2`).
Construct `U` from the chosen bases and track its determinant; its sign is not fixed by the
positive scale. Prove the restricted smoothness and inverse laws. Orient `S³` outward-normal-first
in standard oriented `ℝ⁴` and `ℝ³`
by its standard basis. Prove this chart preserves orientation: at the south pole the tangent
basis `(e₀,e₁,e₂)` is positive and the derivative is `1/2` times the identity; extend the sign
over its connected domain. Transport link and surface orientations through this chart. Fix this
point and chart for the category. All surface traces avoid its infinity cylinder. Require the
chosen ambient comparison isotopies to fix a neighborhood of that cylinder, so their
restrictions are actual affine ambient diffeotopies. Using G's relative velocity extension,
prove that a compact surface-isotopy trace which avoids the cylinder admits such a witness while
retaining the boundary and collar conditions.

A local event means any R1, R2, R3, birth, death or saddle event in its specified changing disc. Two
local events are distant when their actual changing discs are disjoint, each modification is
the identity outside its own disc, and the other disc lies in that unchanged exterior before and
after the event. Retain the common exterior and boundary identifications.

Construct finite movies on G's plane-diagram adapter from actual planar isotopies and these local
events, with explicit source/target diagrams, orientations, boundary markings and composition.
Construct their realization as geometric cobordisms and prove presentation/completeness:
boundary-fixed ambient isotopic cobordisms are represented by sequences of the fifteen Carter–Saito
movie moves, interchanges of distant local events, and the following planar-isotopy relations.
Include identity/concatenation, stationary reparametrization and homotopy rel endpoints of
planar-isotopy paths through generic diagrams; every path and homotopy stays stationary on
the specified endpoint collar neighborhoods. Include conjugating a local event by a planar
isotopy that transports its changing disc, and shrinking or enlarging that disc through an
annulus carrying only the unchanged identity strands and no new components, with the same
supported event and boundary identification. Construct the rel-boundary isotopies of traces witnessing these
relations and prove their compatibility with collars, markings and composition. A general loop
of planar isotopies is not identified with the constant path without the stated homotopy or
another proved trace relation. Use Jacobsson §3.2's numbering, including the
time reversals, mirror/crossing variants, additional strand-position variants of moves 6 and 15, the
reductions for move 7, and compatible orientations. Define each relation as a local schema in a
specified changing disc, over every admissible exterior with that disc empty of additional
components. Give a pair of explicit finite words in the elementary movie generators with matching
source/target plane diagrams, collars and boundary identifications. Export the numbered fifteen-type
classification and all variant transports. Construct the dictionary between Jacobsson's and
Bar-Natan's numbering and variants, including Jacobsson move 7 versus Bar-Natan MM10 for the
quadruple-point move. Construct the separate CS1993/CRS1997 word presentation dictionary with its
precise generator and relation correspondences. Birth and death events specify the actual
complementary region and local disc; plane-adapter crossing-free bits have the counterclockwise
meaning fixed above. Use G's placement-sensitive translation of native circle-constructor bits and
K4's supported move dictionary; retain the unaffected and changed component incidences. Build this
relative movie theorem using local generic projection/transversality and compactness with fixed
collars; prove each local normal form, list every oriented and time-reversed movie relation, and
retain its boundary identification. Prove this presentation theorem for the specified decorated
geometric category.

Define the movie Euler count as `#births−#saddles+#deaths`. Prove invariance under every movie
relation, distant-local-event interchange and actual planar isotopy, and additivity under
concatenation and disjoint union. Using geometric presentation and completeness, descend this
count to `χ(Σ)` for the marked surface category, independently of Khovanov maps. Construct the
finite relative cell model supplied by the movie's 0-,1-,2-handles, prove its comparison with the
surface and the incoming boundary, and identify the count with the alternating rational homology
ranks of the compact surface; each boundary link has Euler characteristic 0. Use native
singular/cellular homology through [AlgebraicTopology](../AlgebraicTopology/README.md)'s Stage 4
cellular comparison and finite-CW Euler–Poincaré theorem, constructing the movie-handle
comparison here, obtaining `χ(Σ)` and its handle-count formula. Start from one 0-cell and
one 1-cell for each incoming circle; prove that each local movie handle attaches the cell of its
index with the actual attaching map. This relative cell construction uses the movie normal forms
and Layer 1 gluing.

Apply G's common relative finite-jet, incidence, Hermite-interpolation, Sard and Baire floor to
the surface and isotopy families here. Construct all movie-specific bad strata and verify the
distinct-point, coincident-point and fixed-collar hypotheses. Prove compact-set openness of
embedding and collar conditions and use G's relative ambient-extension construction for the
small perturbations, with the fixed infinity cylinder avoided. Prove the codimension estimates,
finite determinacy and coordinate reductions for every movie normal form. Derive a finite event
subdivision from those forms and compactness. The two-parameter completeness proof consumes G's
one-parameter comparison.

Births and deaths act by unit and counit, saddles by the K2 maps on resolutions, and Reidemeister
events by K4's local formal chain maps inserted in the fixed planar-insertion slot order.
These inserted local maps are the movie generators; construct their compatibility with K4's
native comparison-word maps through the stated transports and homotopies. Prove they are chain
maps and compose under movie concatenation.
Construct the homogeneous map of a planar isotopy from its induced crossing, circle and boundary
correspondences, with identity and composition laws, and prove independence of the path with that
fixed correspondence. Prove elementary-event naturality under these planar-isotopy and relabelling
isomorphisms, including crossing-order signs. Prove maps of every pair of distant local events,
including Reidemeister-versus-Reidemeister and Reidemeister-versus-Morse pairs, commute exactly
after canonical raw crossing-reorder identifications and associators in the fixed planar-insertion
slot order. Here canonical reindexing means the subset-permutation cube transport, not an
unqualified replacement by the normalized cochain braiding; a change of slot order retains K3/K5's
`(-1)^(a b)` normalization constants. Transport this interchange law and naturality through
totalization, arbitrary exteriors and closed evaluation. All these local event maps have cochain
degree zero, so their disjoint interchange in that fixed order has no additional map-degree
Koszul sign. Prove the maps descend through every planar-isotopy relation above using path
homotopy, composition, disc transport and support restriction; keep the stronger fixed-correspondence
map independence as its own theorem. For a cobordism `Σ`, the induced map has bidegree `(0,χ(Σ))`. For each of the fifteen
movie-relation schemata and every required oriented, mirrored, time-reversed and strand-placement
variant, construct its two finite local formal chain maps `F_L,F_R` and an integral finite
formal-matrix homotopy `H` and one sign `ε∈{−1,1}` satisfying `F_L−εF_R=dH+Hd`. Both maps have the
same quantum degree `δ`; `H` has cochain degree `−1` and quantum degree `δ`. Equivalently these are
quantum-degree-zero maps and homotopies into the target shifted by `⟨−δ⟩`. Verify the identities
from the actual local templates and the two-dimensional formal relations, with coefficient/matrix
certificates for every schema; the reversible multi-crossing clips are included. Construct the
explicit homotopy witnesses from the local templates. Prove the identity before gluing an exterior,
then transport it under every admissible planar insertion, including an arbitrary exterior complex,
with the totalization homotopy sign `(-1)^(r₁+⋯+rᵢ₋₁)` in the replaced factor, where each
preceding `r_j` is its normalized cochain degree as in K3. Retain one common
integral sign for the entire local complex and every exterior closure. Extend the verified integral
identity to every commutative coefficient ring.

Only after these homogeneous relation homotopies are proved, forget the quantum grading to
obtain the stated native underlying homotopy-category functor and its quotient by a common sign.
The induced bigraded homology maps retain their proved degree. The formal `δ` is computed from
the earlier combinatorial surface grading; the comparison with the actual surface's movie/handle
Euler count is proved by K7's separate geometric construction. Cite Bar-Natan for this
chain-level theorem; use Jacobsson for the homology statement and its conventions. For the final
target use the native homotopy category of underlying `ModuleCat R` cochains, retaining the
finite quantum grading as object data through the induced-category construction. The final
target uses underlying cochain homotopy classes; retain the homogeneous local relation witnesses
in its construction. Form the quotient identifying a morphism with its negative and prove
composition descends. Construct the quotient as a category with its descended composition.
Obtain the boundary-fixed functor to this projective homotopy category and its bigraded homology
maps modulo one global sign. In characteristic 2 the sign ambiguity disappears.

The isotopies in this theorem fix the boundary link data; motions of boundary links act through
their specified comparison maps. The geometric domain here retains the affine chart,
equivalently the point at infinity in the `S³` presentation, and its collar throughout.
Construct the `ℝ³` cobordism functor on this specified affine domain. Prove that every closed
embedded surface with `χ(Σ)≠0` has zero map, by its quantum degree and the empty-link complex.
Evaluate the explicitly standard unknotted torus by its Frobenius handle movie as `±2`; retain
that specified standard embedding in the evaluation theorem. Prove compatibility with disjoint
union and keep these ordinary-theory evaluations separate from a polynomial-coefficient
deformation.

## Dependency order and acceptance

K1 supplies finite circles, components, PL disc/band and local closure calculus. K2 constructs the
graded Frobenius object and generated formal surface category with independent cell-count grading.
K3 constructs formal open complexes, normal-form closed evaluation and the native-PD state-sum
comparison. G constructs actual plane/smooth adapters, consumes CM L5 separation and GT
carrier/presentation definitions, and proves the common finite-jet/relative extension and relative
finite-family one-parameter comparison. K4 combines formal Reidemeister homotopies with G for link
invariance. K5 proves the bounded finite free complex-level coefficient/dual/tensor theorems,
constructs quantum/parity/linking and based-link adapters, and proves reduced mark comparison by its
explicit periodic-resolution isomorphism and augmentation homotopies. K6 certifies computations and
applications. K7 proves the relative two-parameter movie presentation and independent geometric
Euler comparison, and homogeneous formal relation homotopies, interchange and naturality before
descending to the projective target. The native Jones definition feeds K3 independently of geometric
Jones invariance.

Acceptance includes the full signed differential and reordering API; planarity and circle-set
comparisons; all local Reidemeister homotopies; the nonempty/empty native Jones identities;
integral torsion and reduced examples; UCT, Künneth and mirror Ext checks; and a boundary-fixed
projective cobordism functor with every movie relation. Suggested signatures alone do not prove
any of these targets.

## References

- M. Khovanov, [A categorification of the Jones polynomial](https://arxiv.org/abs/math/9908171),
  for the Frobenius object, cubes, Reidemeister constructions, ordinary coefficient
  specialization, examples and adequacy. Translate its grading shifts explicitly.
- M. Khovanov, [Patterns in knot cohomology I](https://arxiv.org/abs/math/0201306), §3,
  for the marked-module and reduced construction over `ℚ` for knots. Construct the integral
  finite-link comparison and its periodic-resolution proof in K5.
- M. Jacobsson, [An invariant of link cobordisms from Khovanov homology](https://arxiv.org/abs/math/0206303),
  for the boundary-fixed, overall-sign homology theorem and numbered movie conventions.
  The chain-level theorem and its local proof floor use Bar-Natan's construction.
- D. Bar-Natan, [Khovanov's homology for tangles and cobordisms](https://www.math.toronto.edu/~drorbn/papers/Cobordism/),
  for local cancellation, cone homotopies and projective homotopy-category functoriality.
- M. Golubitsky and V. Guillemin,
  [Stable Mappings and Their Singularities](https://doi.org/10.1007/978-1-4615-7904-5),
  §II.4, Theorem 4.13, for multijet transversality. Construct the relative finite-parameter,
  fixed-collar and collision-stratum adapters in G and K7.
- M. W. Hirsch, [Differential Topology](https://doi.org/10.1007/978-1-4684-9449-5),
  Ch. 8 §1, Theorems 1.3–1.4, for compact-submanifold isotopy extension. Construct G's
  finite-family support and K7's collar/slab adapters explicitly.
- W. B. R. Lickorish, *An Introduction to Knot Theory*, Ch. 1, for the PL Reidemeister
  theorem. G constructs its smooth, labelled, relative comparison.
- D. Roseman,
  [Reidemeister-type moves for surfaces in four-dimensional space](https://doi.org/10.4064/-42-1-347-380),
  for the surface-projection moves; K7 includes their height-sensitive movie refinements.
- J. S. Carter and M. Saito,
  [Reidemeister Moves for Surface Isotopies and Their Interpretation as Moves to
Movies](https://doi.org/10.1142/S0218216593000167),
  J. Knot Theory Ramifications 2 (1993), 251–284,
  for the fifteen geometric movie schemata in Jacobsson's numbering; and
  *Knotted Surfaces and Their Diagrams* for the geometric presentation.
- J. S. Carter, J. H. Rieger and M. Saito,
  [A combinatorial description of knotted surfaces and their
isotopies](https://doi.org/10.1006/aima.1997.1618),
  for the word presentation. Construct its dictionary to the chosen movie schemata;
  retain the precise generator and relation correspondence.

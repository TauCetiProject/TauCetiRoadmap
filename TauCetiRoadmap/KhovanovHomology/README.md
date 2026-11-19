# Roadmap: Khovanov homology of classical links

**Summary.** Khovanov homology assigns to an oriented link diagram `D` with `n` crossings a
bigraded group `Khⁱʲ(D)`. Each of the `2ⁿ` ways of smoothing the crossings leaves a finite set of
circles; each circle carries a copy of the rank-two Frobenius algebra `ℤ[X]/(X²)`, the vertex
modules are their tensor products, and merging or splitting circles along the edges of the cube of
smoothings, with signs, gives a cochain complex. This roadmap constructs this ordinary integral
theory for classical links, with coefficients in every commutative ring, and makes it a usable
invariant: actual resolution circles and saddle maps, a finite bigraded complex, Reidemeister
chain homotopy equivalences, coefficient, duality and based-link theory, computations with
integral torsion, and maps induced by link cobordisms. Diagrams are planar oriented PD-codes, and
the grading is Bar-Natan's: a state with `|S|` crossings smoothed the second way sits in cochain
degree `|S| − n₋` with quantum shift `|S| + n₊ − 2n₋`, and `X` has quantum degree `−1`.

The headline theorems are these.

- *Invariance.* If two planar oriented diagrams are related by Reidemeister moves, then for every
  commutative ring `R` and every quantum degree `j` their Khovanov complexes are chain homotopy
  equivalent. Through generic projections the same holds for ambient isotopic smooth links in `ℝ³`.
- *Euler characteristic.* The graded Euler characteristic of `Kh(D; ℤ)` is `(q + q⁻¹)` times the
  Jones polynomial at `t^(1/2) = −q`; at `q = 1` it equals `2^c` for a `c`-component link, so
  `Kh(D; ℤ)` is never zero.
- *Integral computations.* The positive torus link `T(2, m)`, `m ≥ 2`, has integral homology `ℤ`
  in explicit bidegrees and `ℤ/2` in the bidegrees `(2r + 1, m + 4r)` with `1 ≤ r ≤ (m − 1)/2`; for
  the right-handed trefoil, `ℤ/2` sits in `(3, 7)`. An adequate diagram with `n` crossings has the
  fewest crossings among all diagrams of its link.
- *Functoriality.* A link cobordism `Σ ⊂ ℝ³ × [0, 1]` induces a map `Kh(L₀) → Kh(L₁)` of
  bidegree `(0, χ(Σ))`, well defined up to one overall sign on boundary-fixed isotopy classes and
  compatible with composition; in characteristic two the sign disappears.

Alongside these come mirror duality, the universal coefficient and Künneth sequences, orientation
reversal, the skein exact sequence, and the reduced theory at a marked point with its
connected-sum formula.

Tau Ceti supplies the floor: PD-codes, planarity, Reidemeister moves and the Jones polynomial;
the resolution circles and the Frobenius algebra; the signed cube complex; and the normalized
Khovanov complex with its homology and the Jones comparison. GeometricTopology supplies smooth
links, diagrams and Reidemeister's theorem (its Layer 4) and collars and tubes (Layer 1); this
roadmap proves their labelled, relative extension. DifferentialGeometry and ConformalMapping
supply orientations, flows and Jordan separation for the plane geometry. DGAInfinity supplies the
DG modules against which the connected-sum tensor product is compared, and AlgebraicTopology
supplies the cellular Euler characteristic of a cobordism. Foams and DiagrammaticCoherence build on
the formal surface category and the plane geometry constructed here.

## How to read the build

Layers 1–3 are combinatorial and algebraic. Layer 1 has the circles, components and marks of a
diagram and the local planar calculus of diagrams with boundary; Layer 2 the Frobenius object,
circle tensors and the formal category of surfaces modulo the sphere, torus and four-tube
relations; Layer 3 the signed cube complex, Khovanov homology, its Euler characteristic, and the
complexes of diagrams with boundary with their closed evaluation. Layer 8, the plane geometry,
uses only Layer 1 and the differential-topology suppliers; it is placed before Layer 4, the first
layer that uses it. Layer 8 realizes PD-codes in the plane and in `ℝ³`, builds a common
finite-dimensional general-position and ambient-extension floor, and proves the relative labelled
Reidemeister theorem. Layer 4 proves Reidemeister invariance, first for diagrams and then for
smooth links. Layer 5 proves the coefficient, duality and symmetry theorems, the parity and Euler
value, and the reduced and connected-sum theory. Layer 6 computes: certificates, the small links,
the torus links `T(2, m)` and the crossing-number application. Layer 7 proves the movie
presentation of link cobordisms and the functoriality theorem. The Jones polynomial enters Layer 3
through Tau Ceti's state-sum definition, independently of its geometric invariance. Each
subsection's *Needs:* line lists its inputs, so that a target proved by another route is not
blocked behind an unrelated section.

The finished roadmap provides the full signed differential and crossing-reordering interface; the
planarity and circle-set comparisons; all the local Reidemeister homotopies; the Jones identities
for nonempty and empty diagrams; the integral torsion and reduced examples; the universal
coefficient, Künneth and mirror Hom/Ext comparisons; and a boundary-fixed projective cobordism
functor respecting every movie relation.

## Conventions

1. **Diagrams.** A diagram is a `TauCeti.OrientedPDCode n` whose underlying code satisfies
   `TauCeti.PDCode.IsPlanar`. It keeps its crossing order, its orientation and all its
   crossing-free components, and every statement about circles, merges, splits, complexes or
   differentials carries the planarity hypothesis. Half-edges, arc matchings, smoothings, crossing
   signs and the Jones polynomial are Tau Ceti's: `TauCeti.PDCode.smoothingTurn`,
   `TauCeti.PDCode.smoothingChoice`, `TauCeti.OrientedPDCode.crossingSign` and
   `TauCeti.OrientedPDCode.jonesPolynomial`.
2. **Gradings and signs.**

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

   At a positive crossing the `A`-smoothing (`true`, the `0`-resolution) is the oriented
   smoothing, as in Tau Ceti's `TauCeti.OrientedPDCode.seifertState`; at a negative crossing it is the
   other one.
3. **Shifts.** Native cochain shifts include their differential signs. The dictionary from the
   explicit normalized state formula to those shifts keeps the degreewise sign correction
   `(-1)^(i·n₋)` of Tau Ceti's `TauCeti.OrientedPDCode.khovanovComplexShiftIso`. Khovanov's
   original braces lower quantum degrees (Khovanov, *A categorification of the Jones polynomial*,
   §2.1), so his `{k}` is our `⟨−k⟩`; Bar-Natan's `{k}` and `[s]`
   are our `⟨k⟩` and the cochain shift (Bar-Natan, *On Khovanov's categorification*, §3.1,
   Definitions 3.2–3.3). The ordinary theory here is the specialization `c = 0` of Khovanov's
   coefficient ring `ℤ[c]` (Khovanov, *A categorification of the Jones polynomial*, §7).
4. **Surfaces.** The surface slice convention is `(time, link)`; Jacobsson uses `(link, time)`.
   Every geometric orientation comparison translates this reversal explicitly.
5. **Universes.** The integral complex lives in `ModuleCat.{0} ℤ`. For coefficients `R : Type u`
   the integral coefficient ring in `Type u` is `Z_u = ULift.{u} ℤ`: lift the finite integral
   state modules with Mathlib's `ModuleCat.uliftFunctor` and transport their scalar action along
   `ULift.ringEquiv : Z_u ≃+* ℤ`. The large-coefficient tensor, `Tor`, `Ext` and `Hom` comparisons
   are made in `ModuleCat.{u} Z_u`, and the integer action on `R` uses the ring map `Z_u → R`.
   Native module tensor and Koszul structures are used with ring and module universes matched; no
   monoidal instance on a mismatched `ModuleCat.{u} ℤ` is assumed. After scalar extension, the
   cochain tensor and braiding are those of `ModuleCat.{u} R`.
6. **Names.** A backticked name without a library prefix is declared in `Suggested.lean`, in the
   namespace `TauCetiRoadmap.KhovanovHomology`; every other target of this roadmap is described in
   prose. Library declarations are written with their full names.

## Layer 1: resolution circles and local planar calculus

### 1.1 Resolution circles of a state

For a state `s : Fin n → Bool` of a PD-code `D`, the crossing-bearing circles are
`TauCeti.PDCode.CrossingCircle D s`, the quotient of the half-edges by the equivalence relation
generated by `TauCeti.PDCode.CircleStep D s`, which follows either the arc matching `D.edgePair`
or the smoothing `D.smoothingTurn (D.smoothingChoice s)`. The resolution circles are
`TauCeti.PDCode.ResolvedCircle D s`, the crossing-bearing circles together with
`Fin D.crossinglessComponentCount`, one label for each crossing-free component. The facts used
below are Tau Ceti's:

- the circle type is finite with decidable equality, and two half-edges give the same circle
  exactly when they are related by the generated relation, independently of the representatives;
- `TauCeti.PDCode.crossingCircleEquiv` identifies the crossing-bearing circles with the directed
  traversal classes of `TauCeti.PDCode.statePerm D s` modulo reversal; reversal has no fixed class
  (`TauCeti.PDCode.isPerfectMatching_stateCycleReversal`, using both perfect matchings), so every
  circle, the degenerate circles through two half-edges included, carries exactly two directed
  cycles (`TauCeti.PDCode.two_mul_card_crossingCircle`);
- the number of resolution circles is the native loop count,
  `TauCeti.PDCode.card_resolvedCircle : Fintype.card (D.ResolvedCircle s) = D.stateLoopCount s`,
  and it is at least one when `D` has a crossing (`TauCeti.PDCode.one_le_card_resolvedCircle`).

*Needs:* Tau Ceti `TauCeti.PDCode.CircleStep`, `TauCeti.PDCode.CrossingCircle`,
`TauCeti.PDCode.ResolvedCircle`, `TauCeti.PDCode.crossingCircleEquiv`,
`TauCeti.PDCode.two_mul_card_crossingCircle`, `TauCeti.PDCode.card_resolvedCircle`,
`TauCeti.PDCode.one_le_card_resolvedCircle`.

**Checks.**
- For the closure of the positive two-strand braid `σ₁³` (the right-handed trefoil, three
  positive crossings), the all-`A` state has two circles, each state with one `B`-smoothing has
  one, each state with two has two, and the all-`B` state has three. A count of directed traversal
  cycles instead of circles would give four and six at the two extreme states.
- For the one-crossing kink, the smoothing that cuts off the loop has two circles and the other
  has one. The cut-off loop meets only two half-edges, joined both by an arc and by the
  smoothing; both of its directed cycles are fixed points of the state permutation, and it is one
  circle, not two.

### 1.2 Transport of circles

A transport of resolution circles is Tau Ceti's `TauCeti.PDCode.SmoothingEquiv D s D' s'`: a
bijection of half-edges intertwining the arc matchings and the smoothings, with a bijection of the
crossing-free labels. It has identities, inverses and composites
(`TauCeti.PDCode.SmoothingEquiv.refl`, `.symm`, `.trans`) with their laws, and it induces the
bijection of resolution circles `TauCeti.PDCode.SmoothingEquiv.resolvedCircleCongr`, compatible
with identities, inverses and composites and with the circles through each crossing. Its
instances cover relabelling of half-edges and crossings (`TauCeti.PDCode.SmoothingEquiv.relabel`),
reading a crossing from another slot (`TauCeti.PDCode.SmoothingEquiv.rotateCrossing`), the mirror,
which exchanges each state with its complement (`TauCeti.PDCode.SmoothingEquiv.mirror`), and
permutations of the crossing-free labels (`TauCeti.PDCode.SmoothingEquiv.crossinglessPerm`); the
same transports for all states at once are `TauCeti.PDCode.ResolutionEquiv`, and disjoint union is
`TauCeti.PDCode.disjointUnionResolvedCircleEquiv`. Every adapter to an actual diagram in this
roadmap supplies the bijection of crossing-free circles explicitly, as the structure requires.

*Needs:* Tau Ceti `TauCeti.PDCode.SmoothingEquiv` and its instances listed above,
`TauCeti.PDCode.ResolutionEquiv`, `TauCeti.PDCode.disjointUnionResolvedCircleEquiv`.

**Checks.**
- The mirror transport pairs the state `s` of `D` with the complementary state of the mirror. For
  the trefoil of §1.1, the all-`A` state of `D` (two circles) is carried to the all-`B` state of the
  mirror, which also has two circles; a transport keeping the state would compare two circles
  with the three of the mirror's all-`A` state, and no bijection exists.

### 1.3 Link components and words of moves

The components of an oriented PD-code are Tau Ceti's `TauCeti.OrientedPDCode.Component`: the
classes of outgoing half-edges under `TauCeti.OrientedPDCode.componentPermOutgoing`, together with
the crossing-free labels; their number is the native component count
(`TauCeti.OrientedPDCode.card_component`). They are transported by
`TauCeti.OrientedPDCode.componentEquiv`, with identities and composites, and in particular along
relabelling and mirror (`TauCeti.OrientedPDCode.relabelComponentEquiv`,
`TauCeti.OrientedPDCode.mirrorComponentEquiv`). The crossing-free labels are decorated by
`TauCeti.OrientedPDCode.CrossinglessLabeling`, a function to `Bool` whose multiset is the
orientation multiset `crossinglessComponents`; such labellings exist, and any two differ by a
permutation of the labels.

Construct component bijections for every generator of `TauCeti.OrientedPDCode.IsReidemeisterMove`:
relabelling, reading a crossing from another slot, the first move on an arc
(`TauCeti.OrientedPDCode.reidemeisterOne`) and on a crossing-free circle
(`TauCeti.OrientedPDCode.adjoinKink`), the second move between two arcs, an arc and a circle, and
two circles (`TauCeti.OrientedPDCode.insertClasp`, `TauCeti.OrientedPDCode.insertCircleClasp`,
`TauCeti.OrientedPDCode.adjoinTwoCircleClasp`), and the third move
(`TauCeti.OrientedPDCode.reidemeisterThree`). The moves that turn a crossing-free circle into a
crossing-bearing component carry that circle's label to the new component's traversal class.
Prove the identity and composition laws.

Define the *move data* of a generator: the generator together with all its parameters (the
half-edges, Booleans, the clasp's face or component witness, the triangle hypothesis). Define finite
*move words*, sequences of move data traversed forwards or backwards with matching endpoints, with
a forgetful map to `TauCeti.OrientedPDCode.IsReidemeisterMove` on each letter and to
`TauCeti.OrientedPDCode.ReidemeisterEquiv` on each word; prove that every Reidemeister equivalence
is the image of a word. Component transports, and later the complex transports of Layer 4, are
defined on words and keep the chosen data and path. Layer 8 supplies the realized plane geometry,
orientations and component data; Layer 4 constructs the comparison words between native moves and
supported plane events.

*Needs:* Tau Ceti `TauCeti.OrientedPDCode.Component`, `TauCeti.OrientedPDCode.componentEquiv`,
`TauCeti.OrientedPDCode.CrossinglessLabeling`, `TauCeti.OrientedPDCode.IsReidemeisterMove` and its
constructors, `TauCeti.OrientedPDCode.ReidemeisterEquiv`; Mathlib `Relation.EqvGen`.

**Checks.**
- The first move on a crossing-free circle replaces a crossing-free component by a
  crossing-bearing one: the component count stays one, while the crossing-free count drops from
  one to zero. A component bijection that sent crossing-free labels to crossing-free labels
  would have no target.
- The trefoil closure of §1.1 has one component and the closure of `σ₁²` (the Hopf link) has two:
  `TauCeti.OrientedPDCode.componentPermOutgoing` has one and two orbits.

### 1.4 Marks and based moves

A mark on a PD-code is Tau Ceti's `TauCeti.PDCode.Mark D`: an arc, given by a half-edge up to the
arc matching (`TauCeti.PDCode.Mark.onArc`), or a crossing-free label
(`TauCeti.PDCode.Mark.onCircle`). In each state it selects the resolution circle through it,
`TauCeti.PDCode.Mark.resolvedCircle`, compatibly with saddles, transports
(`TauCeti.PDCode.SmoothingEquiv.markCongr`) and disjoint unions.

Construct *based moves*: move data (§1.3) together with a mark on the source, and the transported
mark on the target, given explicitly for every generator, including the position of the mark when
a move subdivides the marked arc (the first move on an arc and the second move cut arcs into
pieces; the mark goes to a specified piece). Construct the *slide* comparison of two marks on the
two arcs meeting at a crossing along one strand, as data used by §5.9. Prove the identity and
composition laws for based words. Layer 8 supplies the comparison of a mark with a point of the
realized link.

*Needs:* §1.3; Tau Ceti `TauCeti.PDCode.Mark`, `TauCeti.PDCode.Mark.resolvedCircle`,
`TauCeti.PDCode.SmoothingEquiv.markCongr`.

### 1.5 Adjacent states, merges and splits

For two states `s`, `t` that differ exactly at the crossing `c`, the circles through `c` are
`TauCeti.PDCode.circlesAt D s c`, at most two of them, two exactly when slots `0` and `2` of `c`
lie on different circles (`TauCeti.PDCode.card_circlesAt_eq_two_iff`). The circles avoiding `c`
are identified across the edge by `TauCeti.PDCode.unchangedCircleEquiv`, and the saddle
correspondence `TauCeti.PDCode.saddleResolvedCircleMap` maps the circles of `s` onto those of `t`.
Three exterior pairings of the four endpoints at `c` are possible: two circles merge, one circle
splits, or, for a nonplanar code, one circle becomes one circle; at most three circles pass
through `c` in the two smoothings together
(`TauCeti.PDCode.card_circlesAt_add_card_circlesAt_le_three`). For a planar code, defined by the
Euler characteristic of its ribbon graph, every cube edge is a merge or a split
(`TauCeti.PDCode.IsPlanar.card_circlesAt_eq_two_or_card_circlesAt_eq_two`), the circle count
changes by exactly one along it, and the parity of `#B-smoothings + #circles` is the same at every
vertex (`TauCeti.PDCode.IsPlanar.card_false_add_stateLoopCount_mod_two_eq`). The finite
combinatorial characterization of planarity is Tau Ceti's as well: a connected code is planar
exactly when the bands of a spanning-tree contraction of its ribbon graph do not interleave
(`TauCeti.PDCode.isPlanar_iff_isNoncrossingMatching`), from the boundary-count lemmas for
one-vertex chord diagrams (two interleaved bands have one boundary cycle, and each further band
raises the count by at most one, so `m` bands with an interleaved pair have fewer than `m + 1`
boundary cycles).

*Needs:* §1.1; Tau Ceti `TauCeti.PDCode.circlesAt`, `TauCeti.PDCode.unchangedCircleEquiv`,
`TauCeti.PDCode.saddleResolvedCircleMap`,
`TauCeti.PDCode.card_circlesAt_add_card_circlesAt_le_three`,
`TauCeti.PDCode.IsPlanar.card_circlesAt_eq_two_or_card_circlesAt_eq_two`,
`TauCeti.PDCode.IsPlanar.card_false_add_stateLoopCount_mod_two_eq`,
`TauCeti.PDCode.isPlanar_iff_isNoncrossingMatching`.

**Checks.**
- The one-crossing code whose two arcs join opposite slots (`0` with `2`, `1` with `3`) has one
  vertex, two edges and one face, so Euler characteristic `0`, and is not planar. Each of its two
  states has exactly one circle, so its only cube edge is a one-to-one change: the third exterior
  pairing, which a definition of the edge maps by "merge if the count drops, split otherwise"
  would misread as a split.
- In the trefoil of §1.1 every edge changes the circle count by one, and `#B + #circles` is
  `0 + 2`, `1 + 1`, `2 + 2`, `3 + 3`, always even.

### 1.6 Disc/band models of planar codes

On each connected component of the ribbon graph of a planar code, contract a spanning tree
(`TauCeti.PDCode.nonempty_spanningTreeContraction`), retaining the cyclic orders, boundary cycles
and the inverse vertex-expansion data. The contracted one-vertex chord diagram is noncrossing
(§1.5); construct its planar *disc/band model*, a disc with untwisted bands attached along
noninterleaved boundary arcs, and expand the tree again, obtaining a disc/band model of the whole
code whose boundary cycles are the faces. Prove that smoothing a crossing and the local
exterior-matching dictionary of §1.5 preserve this model.

These models are the local diagram carriers. An *open model* is a finite piecewise-affine
realization in an oriented closed disc, with labelled ports on its boundary in a specified cyclic
order and standard boundary collars; its arcs meet the boundary exactly at the ports, each
crossing patch contains exactly its prescribed transverse double point with its over/under label,
and the remaining arc interiors and isolated circles are embedded and pairwise disjoint. Prove
the gluing, relabelling and full-resolution comparisons for these finite models. The case of
empty boundary is the finite PL plane-diagram carrier. Layer 8 compares these models with
arbitrary generic smooth diagrams.

*Needs:* §1.5; Tau Ceti `TauCeti.PDCode.nonempty_spanningTreeContraction`,
`TauCeti.PDCode.isPlanar_iff_isNoncrossingMatching`, `TauCeti.PDCode.toPermutationTriple`;
Mathlib affine maps and convex hulls in `ℝ²`.

**Checks.**
- The standard trefoil code is connected with three crossings, so its ribbon graph has three
  vertices and six edges; a spanning tree has two edges, and the contracted chord diagram has four
  bands and five boundary cycles, the five faces of the trefoil diagram (`3 − 6 + 5 = 2`). Four
  bands with an interleaved pair would have at most three boundary cycles.

### 1.7 Partial resolution and vertex resolution

Define partial resolution at a selected crossing in the local calculus of §1.6, with its
unoriented finite arc and boundary data, and prove its compatibility with the complete state
smoothing of §1.1 and that it preserves the disc/band model. After every other crossing has been
resolved, prove the four-endpoint consequence: for a planar code the exterior pairing at a cube
edge is never the opposite-slot pairing. This is the local form of the merge-or-split theorem of
§1.5 that the planar saddle constructions use.

The vertex resolution, which removes a crossing, is Tau Ceti's
`TauCeti.PDCode.resolveCrossing D c t`: for a crossing `c` of a `PDCode (n + 1)` and a smoothing
`t` it is a `PDCode n`, with the degree-two vertices suppressed, every newly detached
crossing-free circle counted (`TauCeti.PDCode.detachedCircleCount`), and the remaining crossings
relabelled by `c.succAbove`; it is planar when `D` is (`TauCeti.PDCode.IsPlanar.resolveCrossing`),
and its resolution circles are those of the corresponding states of `D`
(`TauCeti.PDCode.resolveCrossingResolvedCircleEquiv`). Prove its gluing comparison with the local
calculus of §1.8: the vertex resolution of `D` at `c` is the closure of the partial resolution of
the one-crossing disc around `c`. Layer 5 owns the orientation choices of the oriented skein
inputs.

*Needs:* §§1.5–1.6, §1.8 for the gluing comparison; Tau Ceti `TauCeti.PDCode.resolveCrossing`,
`TauCeti.PDCode.detachedCircleCount`, `TauCeti.PDCode.IsPlanar.resolveCrossing`,
`TauCeti.PDCode.resolveCrossingResolvedCircleEquiv`.

### 1.8 The local planar calculus

Build a finite local planar calculus: objects are finite sets of boundary endpoints with a cyclic
order; a diagram is an open model of §1.6, its crossingless resolutions are matchings of the
endpoints together with isolated circles; diagrams compose by gluing along matched boundary
pieces, and a closed diagram arises from an arbitrary exterior planar closure. Prove that the
circle construction of §1.1 and the saddle correspondences of §1.5 commute with closure and with
gluing. Classify the local configurations used later: the two-crossing face configurations of
Layer 3 and the one-, two- and three-crossing configurations of the Reidemeister moves in Layer 4.
Layer 8 compares these models with actual smooth plane diagrams and proves each matching and
cyclic-order dictionary.

*Needs:* §§1.5–1.7.

**Checks.**
- Four endpoints on the boundary of a disc have two crossingless matchings. Closing one of them
  by the same matching in the exterior disc gives two circles, and closing it by the other gives
  one: the circles are the cycles of the glued matching. Counting the arcs of one half instead
  gives two in both cases.

### Examples

- The closure of `σ₁³`, of `σ₁²` and of `σ₁` on two strands: one, two and one components; their
  cube edges are all merges or splits.
- The one-crossing nonplanar code of §1.5, whose single cube edge is neither a merge nor a split.

### Dependencies

Tau Ceti: PD-codes and oriented PD-codes, planarity through the Euler characteristic and the
chord-diagram criterion, resolution circles, their transports, components and marks, the
adjacent-state analysis and vertex resolution. Mathlib: quotients, finite types, equivalence
relations generated by a relation, and affine geometry of `ℝ²`.

## Layer 2: the rank-two Frobenius object, circle tensors and the formal surface category

### 2.1 The Frobenius algebra on the dual numbers

Over a commutative ring `R`, the algebra on each circle is Mathlib's `DualNumber R`, written
`R[ε]`, the trivial square-zero extension `TrivSqZeroExt R R` with `1 = (1, 0)` and `X = ε =
(0, 1)`. Its chosen coalgebra structure is Tau Ceti's `TauCeti.Khovanov.coalgebra`, installed only
as a scoped instance in `TauCeti.Khovanov`, since it is not a canonical coalgebra on every
dual-number algebra:

```
Δ(1) = 1⊗X + X⊗1,     Δ(X) = X⊗X,
ε(1) = 0,              ε(X) = 1.
```

It is coassociative, counital and cocommutative (`TauCeti.Khovanov.isCocomm`), and satisfies the
Frobenius equation (`TauCeti.Khovanov.isFrobenius`, Mathlib's `Coalgebra.IsFrobenius`, whose two
identities say that `Δ ∘ m` equals both mixed composites). Its Frobenius form `(a, b) ↦ ε(ab)` is
the perfect trace pairing (`TauCeti.Khovanov.mul_compr₂_counit`), the basis `X, 1` is dual to the
basis `1, X` (`TauCeti.Khovanov.counit_basis_mul_basis_rev`), the neck-cutting expansion
`a = ε(Xa)·1 + ε(a)·X` holds for every `a`
(`DualNumber.khovanov_counit_eps_mul_smul_one_add_counit_smul_eps`), and base change is a coalgebra
isomorphism `S ⊗ R[ε] ≃ S[ε]` (`TauCeti.Khovanov.baseChangeCoalgEquiv`). This chosen Frobenius
structure is kept throughout (Khovanov, *A categorification of the Jones polynomial*, §2.2, at
`c = 0`).

*Needs:* Mathlib `DualNumber`, `TrivSqZeroExt`, `Coalgebra.IsFrobenius`; Tau Ceti
`TauCeti.Khovanov.coalgebra`, `TauCeti.Khovanov.isFrobenius`,
`TauCeti.Khovanov.mul_compr₂_counit`, `TauCeti.Khovanov.baseChangeCoalgEquiv`.

**Checks.**
- The handle operator is `m ∘ Δ`: it sends `1` to `2X` and `X` to `0`, so the closed torus
  `ε ∘ m ∘ Δ ∘ η` evaluates to `2` and the closed sphere `ε ∘ η` to `ε(1) = 0`.
- Neck cutting on the basis: `ε(X·1)·1 + ε(1)·X = 1` and `ε(X·X)·1 + ε(X)·X = X`. With the counit
  `ε(1) = 1, ε(X) = 0` instead, the form `ε(ab)` would vanish on `X` against both basis vectors,
  so it would be degenerate and the algebra would not be Frobenius for it.

### 2.2 The quantum grading

The quantum grading of `R[ε]` is Tau Ceti's `TauCeti.Khovanov.quantumGrading`, with `1` in degree
`1` and `X` in degree `−1`, and `V = TauCeti.Khovanov.quantumGradedObject R` is the corresponding
object of `GradedObject ℤ (ModuleCat R)`, whose direct sum is `R[ε]`. Multiplication and
comultiplication have degree `−1` and unit and counit degree `+1`; as degree-zero maps between
shifted graded objects they are `TauCeti.Khovanov.quantumMul`, `TauCeti.Khovanov.quantumComul`,
`TauCeti.Khovanov.quantumUnit` and `TauCeti.Khovanov.quantumCounit`. The shifted object
`W = V⟨−1⟩` has degree-zero unit and multiplication, with `X` in degree `−2`
(`TauCeti.Khovanov.instGradedAlgebraShiftOne`); these degrees are the ones used when packaging the
graded maps on `V`.

*Needs:* §2.1; Mathlib `GradedObject`; Tau Ceti `TauCeti.Khovanov.quantumGrading`,
`TauCeti.Khovanov.quantumGradedObject`, `TauCeti.Khovanov.quantumMul`,
`TauCeti.Khovanov.quantumComul`, `TauCeti.Khovanov.quantumUnit`,
`TauCeti.Khovanov.quantumCounit`.

**Checks.**
- `V` has graded rank `q + q⁻¹`; `m(1 ⊗ 1) = 1` goes from degree `2` to degree `1` and
  `Δ(X) = X ⊗ X` from degree `−1` to degree `−2`, both of degree `−1`. With `1` and `X` in degrees
  `0` and `2`, multiplication would preserve degree and comultiplication would have degree `+2`,
  so no shift depending only on the height `|S|` would make every cube edge homogeneous.

### 2.3 Circle tensors and the enhanced-state basis

For a finite set `ι` of circles, the circle tensor is Tau Ceti's
`TauCeti.Khovanov.CircleTensor R ι`, the tensor power of `R[ε]` indexed by `ι`, with the
enhanced-state basis `TauCeti.Khovanov.circleBasis` indexed by labellings `ι → Bool` (`false` for
`1`, `true` for `X`) and the quantum grading `TauCeti.Khovanov.circleQuantumGrading` in which a
labelling has degree `TauCeti.Khovanov.labelingQuantumDegree`, the sum of its label degrees. The
empty tensor is `R`, reindexing along an equivalence of circle sets maps basis vectors to basis
vectors, disjoint unions are tensor products (`PiTensorProduct.tmulEquiv`, with its coefficient
formula), the multiplication along a map of circle sets (`PiTensorProduct.fiberwiseMul`) and the
comultiplication defined as its adjoint for the Frobenius pairing
(`TauCeti.Khovanov.fiberwiseSplit`) have explicit coefficient formulas on the basis, and base change
`TauCeti.Khovanov.circleBaseChange` respects the basis. The comparison with finitely supported
functions on labellings is the basis itself.

Construct the insertion and deletion of a factor, `CircleTensor R ι ⊗ R[ε] ≅ CircleTensor R
(Option ι)` and its inverse, and prove their coherence with reindexing, composition and disjoint
union. Compare the graded circle tensor with the iterated native graded-object tensor of `V`
(`CategoryTheory.GradedObject.Monoidal.tensorObj`) for every finite circle set, with the unsigned braiding of
the graded tensor acting by reindexing.

*Needs:* §2.2; Mathlib `PiTensorProduct`, `PiTensorProduct.tmulEquiv`,
`CategoryTheory.GradedObject.Monoidal.tensorObj`; Tau Ceti `TauCeti.Khovanov.CircleTensor`,
`TauCeti.Khovanov.circleBasis`, `TauCeti.Khovanov.circleQuantumGrading`,
`PiTensorProduct.fiberwiseMul`, `TauCeti.Khovanov.fiberwiseSplit`,
`TauCeti.Khovanov.circleBaseChange`.

**Checks.**
- Three circles: the graded rank is `(q + q⁻¹)³ = q³ + 3q + 3q⁻¹ + q⁻³`, with the all-`1`
  labelling alone in degree `3`. A grading that counted `X` labels instead would put the all-`1`
  labelling in degree `0` and the all-`X` one in degree `3`, giving `1 + 3q + 3q² + q³`, which is
  not symmetric under `q ↦ q⁻¹` as the mirror duality of §5.4 requires.

### 2.4 Merge and split maps on resolutions

Along a cube edge of a planar code (§1.5) the edge map is Tau Ceti's
`TauCeti.PDCode.resolutionEdgeMap`: the merge `TauCeti.PDCode.resolutionMergeMap` (multiplication
on the two merged factors) or the split `TauCeti.PDCode.resolutionSplitMap` (comultiplication on
the split factor), the identity on the other factors through the unchanged-circle
correspondence. Both have quantum degree `−1`. Because they are defined along the saddle map of
circle sets, they do not depend on representatives, circle orders or tensor parenthesizations;
they are compatible with the transports of §1.2 and with base change; and the two routes around
every square face of the cube agree, in all merge, split and mixed configurations
(`TauCeti.PDCode.resolutionEdgeMap_comp_resolutionEdgeMap_comm`), with the unaffected circles
retained.

*Needs:* §§1.5, 2.3; Tau Ceti `TauCeti.PDCode.resolutionEdgeMap`,
`TauCeti.PDCode.resolutionMergeMap`, `TauCeti.PDCode.resolutionSplitMap`,
`TauCeti.PDCode.resolutionEdgeMap_comp_resolutionEdgeMap_comm`.

**Checks.**
- A merge sends `X ⊗ X` to `0` and `1 ⊗ X` to `X`; a split sends `1` to `1 ⊗ X + X ⊗ 1` and `X` to
  `X ⊗ X`. Splitting and then merging the same two circles multiplies by the handle operator:
  `1 ↦ 2X`.

### 2.5 Formal surface presentations

For each finite, cyclically ordered, based set `B` of boundary ports, construct the integral
*formal local cobordism category*. Its objects are the finite planar crossingless arc-and-circle
diagrams with boundary `B` (§1.8), with their plane placement and boundary collars. Its morphisms
are finite combinatorial presentations of abstract surfaces with these marked boundaries,
generated by the planar identity, birth, death and untwisted saddle templates, and retaining the
seam and collar orientation data that keep them in the orientable, planar-surgery-generated
category. Every template and composite carries finite triangle adjacency tables with labelled
boundary collars.

- Construct composition and planar insertion of presentations, and prove that their collar
  matching preserves admissibility and orientability.
- Generate *presentation equivalence* by marking-preserving combinatorial isomorphisms, stellar
  subdivision of a triangle, subdivision of an edge in its one or two incident triangles, their
  inverses and the two-triangle diagonal flip, with their relative-boundary versions; carry each
  boundary subdivision through its collar and the matching seam marking, and keep the prescribed
  outer collar germ fixed.
- Prove that gluing and planar insertion respect this equivalence, with compatible finite
  refinements of matched seams.
- Prove the identity, associativity, collar-rescaling and planar-insertion laws, the unit/counit
  zigzags, saddle associativity and coassociativity, the Frobenius relations and the
  disjoint-interchange identities, by explicit finite move certificates for the small templates.
- Prove that admissibility, the triangle orientation and the matched-seam profiles are preserved
  by every operation, and construct such profiles for every surface used in the resolution cubes
  of Layer 3 and the elementary movie maps of Layer 7.

These are two-dimensional relations between surface presentations, established before the movie
theorem.

*Needs:* §1.8; Mathlib `CategoryTheory.Category`, finite types.

### 2.6 The formal Euler characteristic

Define the formal Euler characteristic `χ` of a surface presentation by its finite cell count
`#vertices − #edges + #triangles`. Prove its invariance under every generating subdivision, its
inverse and the flip, by the local vertex, edge and triangle counts. Prove the seam-gluing formula
and the connected-component and boundary-incidence laws.

*Needs:* §2.5.

**Checks.**
- The boundary of a tetrahedron presents a sphere with `4 − 6 + 4 = 2`; stellar subdivision of
  one triangle adds one vertex, three edges and two triangles net, keeping `2`; the diagonal flip
  changes no count. The birth template (a disc) has `χ = 1`, the saddle between one circle and two
  (a pair of pants) `χ = −1`.

### 2.7 The relations `S`, `T` and `4Tu`, and the quantum grading

Linearize each morphism set over `ℤ` by finitely supported formal sums, and quotient by the
subgroup generated by the relations `S`, `T` and `4Tu`, made stable under composition and planar
insertion: a closed sphere component is zero; a closed torus component is twice the surface with
that component removed; and `C₁₂ + C₃₄ = C₁₃ + C₂₄` for four specified pairwise disjoint interior
discs, possibly on different surface components, where `Cᵢⱼ` removes the discs `i`, `j` and joins
their boundaries by the prescribed orientation-compatible untwisted tube. The relation data keep
all four labelled discs and their seam profiles. Construct the quotient category and prove that
composition and planar insertion descend (Bar-Natan, *Khovanov's homology for tangles and
cobordisms*, §4.1).

For `|B| = 2r`, give a surface morphism the quantum degree `χ − r`. Prove that identities have
degree zero, that degree is additive under composition and planar insertion, and that the three
relations are homogeneous. This combinatorial grading, the abstract-interior formal category and
its generated equivalence come before Layer 3; Layer 7 constructs the separate geometric Euler
comparison.

*Needs:* §§2.5–2.6; Mathlib `Finsupp`, `CategoryTheory.Preadditive`, quotient categories.

**Checks.**
- With no boundary (`r = 0`), the birth has degree `1`, the merge and split saddles `−1`, the
  sphere `2` and the torus `0`, matching the degrees of `η`, `m`, `Δ` in §2.2; the sphere relation
  is homogeneous because both sides are zero. On four boundary points (`r = 2`) the identity of a
  crossingless matching is two strips, `χ = 2`, of degree `0`, and the saddle between the two
  matchings is a disc, `χ = 1`, of degree `−1`.
- Each `Cᵢⱼ` removes two discs from the same surface and glues in an annulus, so all four terms of
  `4Tu` have `χ` two less than the original surface and the relation is homogeneous.

### 2.8 Shifts and the additive envelope

Construct quantum shifts of formal objects and graded morphisms, and the subcategory of
quantum-degree-zero morphisms. Its finite additive envelope is Mathlib's `CategoryTheory.Mat_` of
that subcategory, with `CategoryTheory.Mat_.embedding`, `CategoryTheory.Mat_.lift` and its finite
biproducts.

*Needs:* §2.7; Mathlib `CategoryTheory.Mat_`, `CategoryTheory.Mat_.embedding`,
`CategoryTheory.Mat_.lift`.

### Examples

- On one circle the merge-split composite is multiplication by `2X`; on the empty circle set the
  circle tensor is `R` in degree `0`.
- The torus and sphere relations of §2.7 against the closed values of §2.1: the torus is `2`, the
  sphere `0`, so the evaluation of Layer 3 respects `S` and `T`.

### Dependencies

Layer 1 (§§1.5 and 1.8). Tau Ceti: the Khovanov coalgebra on the dual numbers with its Frobenius
structure, quantum grading and graded maps, circle tensors with their basis, merge and split, and
the merge and split maps on resolutions with their face relations. Mathlib: dual numbers,
coalgebras and the Frobenius class, piecewise tensor products, graded objects and their monoidal
structure, preadditive and quotient categories, and `CategoryTheory.Mat_`.

## Layer 3: signed cubes, complexes and Euler characteristic

### 3.1 Signed cube totalization

A finite commutative cube in a preadditive category `C` with finite biproducts is a functor
`F : Finset ι ⥤ C` from the subsets of a finite linearly ordered set. Its signed height
totalization is Tau Ceti's `CategoryTheory.Functor.cubeComplex`, with the vertex `S` in degree
`|S|` and the edge `S → S ∪ {a}` carrying the sign `(-1)^(#{b ∈ S : b < a})`; its differential
squares to zero because the two routes around every face carry opposite signs. It is functorial
and additive in the cube (`CategoryTheory.NatTrans.cubeComplexMap`,
`CategoryTheory.cubeComplexFunctor`), its degree-zero term is the vertex `∅`
(`CategoryTheory.Functor.cubeComplexXZeroIso`), it is the mapping cone of the map between the two
faces in the direction of any index (`CategoryTheory.Functor.cubeComplexMappingConeIso`), and a
reordering of the indices gives an isomorphism acting on the vertex `S` by the sign of the
permutation of `S` (`CategoryTheory.Functor.cubeComplexReindexIso`), with its identity and
composition laws (`CategoryTheory.Functor.cubeComplexReindexIso_refl`,
`CategoryTheory.Functor.cubeComplexReindexIso_trans`). The dual of a cube of modules is
`CategoryTheory.Functor.dualCube`.

Construct the restriction of a cube to an arbitrary face `{S : A ⊆ S ⊆ A ∪ B}`, a cube indexed by
`B`, and identify its totalization, under the native cochain shift by the height `|A|` (which
multiplies the differential by `(-1)^|A|`), with the signed totalization of that face inside the
whole cube, the vertex `S` carrying the sign `(-1)^(#{(a, b) : a ∈ A, b ∈ S ∖ A, a > b})`; the
mapping-cone isomorphism above is the case of a single direction.

*Needs:* Mathlib preadditive categories with finite biproducts, `CochainComplex`; Tau Ceti
`CategoryTheory.Functor.cubeComplex`, `CategoryTheory.cubeComplexFunctor`,
`CategoryTheory.Functor.cubeComplexMappingConeIso`,
`CategoryTheory.Functor.cubeComplexReindexIso`.

**Checks.**
- For indices `1 < 2`, `A = {2}` and `B = {1}`: the restricted cube has the single edge
  `{2} → {1, 2}` with sign `+1`, which the shift turns into `−1`, while inside the whole cube that
  edge adds `1` to `{2}` with sign `+1`; the vertex sign `−1` on `{1, 2}` (the pair `2 > 1`)
  reconciles them. For `A = {1}`, `B = {2}` the two signs already agree (`−1` both ways) and no
  vertex sign is needed. A sign counting pairs with `a < b` would get both cases wrong.
- A square cube `∅ → {1}, {2} → {1, 2}` with all maps the identity of `ℤ` has differential
  `(1, 1)` out of degree `0` and `(−1, 1)` into degree `2` (the edge `{1} → {1, 2}` has sign `−1`
  since `1 < 2`); the composite is `−1 + 1 = 0`. Without the sign the composite would be `2`.

### 3.2 The Khovanov bracket and the normalized complex

For a planar code `D`, the cube of resolutions in quantum degree `j` is Tau Ceti's
`TauCeti.PDCode.resolutionCube D hD R j`: the vertex `S` is the degree `j − |S|` piece of the
circle tensor of the state `TauCeti.PDCode.cubeState S` (true off `S`), and the edges are the maps
of §2.4. Its totalization is the unnormalized complex `TauCeti.PDCode.khovanovBracket D hD R`,
whose height-`r` term is `⊕[|S| = r] V(Circle(S))⟨r⟩`. The normalized complex is
`TauCeti.OrientedPDCode.khovanovComplex D hD R`, an object of
`GradedObject ℤ (CochainComplex (ModuleCat R) ℤ)`, the primary bigraded complex of this roadmap,
with

```
Cⁱ(D; R) = ⊕[|S|−n₋=i] V(Circle(S))⟨|S|+n₊−2n₋⟩.
```

Tau Ceti supplies its terms as finite biproducts of quantum pieces
(`TauCeti.OrientedPDCode.khovanovComplexXIso`), the signed saddle differential on each summand
(`TauCeti.OrientedPDCode.ι_khovanovComplex_d`), the comparison with the native cochain shift of
the bracket with its sign `(-1)^(i·n₋)` (`TauCeti.OrientedPDCode.khovanovComplexShiftIso`),
cochain support in `[−n₋, n₊]` (`TauCeti.OrientedPDCode.khovanovComplex_isStrictlyGE` and
`TauCeti.OrientedPDCode.khovanovComplex_isStrictlyLE`), finite quantum support
(`TauCeti.PDCode.finite_quantumSupport_khovanovBracket`), finite free terms, and base change of
the cube of resolutions along a ring map (`TauCeti.PDCode.resolutionCubeBaseChangeIso`). All
circle, merge, split, complex and differential statements carry the planarity hypothesis.

*Needs:* §§1.5, 2.4, 3.1; Tau Ceti `TauCeti.PDCode.resolutionCube`,
`TauCeti.PDCode.khovanovBracket`, `TauCeti.OrientedPDCode.khovanovComplex`,
`TauCeti.OrientedPDCode.khovanovComplexShiftIso`, `TauCeti.OrientedPDCode.ι_khovanovComplex_d`,
`TauCeti.PDCode.resolutionCubeBaseChangeIso`.

**Checks.**
- For the right-handed trefoil closure of §1.1 (`n₊ = 3`, `n₋ = 0`) the integral ranks of the
  cochain modules, summed over quantum degrees, are `4, 6, 12, 8` in degrees `0, 1, 2, 3`: the
  states with `0, 1, 2, 3` `B`-smoothings have `2, 1, 2, 3` circles, and there are `1, 3, 3, 1` of
  them. Their alternating sum `4 − 6 + 12 − 8 = 2` is the value at `q = 1` of §5.6.
- A normalization with cochain degree `|S| + n₋` instead would put the left-handed trefoil
  (`n₋ = 3`) in degrees `3` to `6`, and the mirror duality of §5.4 would fail.

### 3.3 The total complex and the enhanced-state model

Define the underlying ordinary complex of the bigraded complex as its native total object under
`CategoryTheory.GradedObject.total` in cochain complexes. Construct the enhanced-state model: the cochain complex
whose degree-`i` term is the free module on the enhanced states of cochain degree `i` (Tau Ceti's
`TauCeti.PDCode.EnhancedState`, with degrees `TauCeti.OrientedPDCode.stateCochainDegree` and
`TauCeti.OrientedPDCode.enhancedQuantumDegree`), with the differential given on each enhanced
state by an explicit evaluation formula for every block (merge and split coefficients from §2.3,
the cube sign of §3.1). Prove that this differential preserves quantum degree, construct its
quantum subcomplexes, and construct the comparison isomorphism between the enhanced-state complex
and the total complex of `TauCeti.OrientedPDCode.khovanovComplex`, compatible with the inclusions
of the quantum summands. Transport maps, homotopies and homology along it; the bigraded groups
and the quantumwise universal coefficients of §5.2 use the quantum components, and the unreduced
ordinary homology uses the total complex, with its direct-sum decomposition into the bigraded
homology.

Use the native graded tensor `CategoryTheory.GradedObject.Monoidal.tensorObj` for quantum convolution and
`CategoryTheory.GradedObject.Monoidal.braiding` over `TauCeti.koszulBraidedCategory R`, supplying their actual
`CategoryTheory.GradedObject.HasTensor` and coproduct-preservation hypotheses from module tensors and the
cochain totalization, with finite quantum support for these complexes. This swaps quantum indices
without a quantum sign; its underlying factor maps use the native cochain Koszul signs. Construct
the degree-exchange comparison with a cochain complex of quantum-graded modules, compatible with
maps, shifts, homotopies and totalization.

*Needs:* §3.2; Mathlib `CategoryTheory.GradedObject.total`, `CategoryTheory.GradedObject.Monoidal.tensorObj`,
`CategoryTheory.GradedObject.Monoidal.braiding`, `CategoryTheory.GradedObject.HasTensor`; Tau Ceti
`TauCeti.PDCode.EnhancedState`, `TauCeti.OrientedPDCode.enhancedQuantumDegree`,
`TauCeti.koszulBraidedCategory`.

### 3.4 Khovanov homology and its finiteness

Khovanov homology in bidegree `(i, j)` is Tau Ceti's
`TauCeti.OrientedPDCode.khovanovHomology D hD R i j`, the cohomology in degree `i` of the quantum
component `j` of the normalized complex, through Mathlib's homology functors. Prove:

- it vanishes for `i` outside `[−n₋, n₊]` and for `j` outside the finite quantum support;
- for `R` Noetherian it is a finitely generated `R`-module; in particular over `ℤ` it is a finitely
  generated abelian group, and over a field it is finite-dimensional;
- the total homology is the direct sum of the bigraded groups (§3.3).

*Needs:* §§3.2–3.3; Tau Ceti `TauCeti.OrientedPDCode.khovanovHomology`; Mathlib
`HomologicalComplex.homology`, `IsNoetherianRing`, `Module.Finite`.

### 3.5 The graded Euler characteristic and the Jones polynomial

The graded Euler characteristic is Tau Ceti's `TauCeti.OrientedPDCode.khovanovEulerChar`, whose
coefficient of `qʲ` is the alternating sum of the ranks of `Khⁱʲ(D; R)` (rational ranks over `ℤ`,
dimensions over a field). Over a Noetherian ring with the rank-nullity property it is computed
quantum component by quantum component by Euler–Poincaré
(`TauCeti.OrientedPDCode.homologyEulerChar_khovanovComplex`) and equals the enhanced state sum
`TauCeti.OrientedPDCode.enhancedStateSum` (`TauCeti.OrientedPDCode.khovanovEulerChar_eq_enhancedStateSum`).
For a nonempty diagram, that is `n + crossinglessComponentCount > 0`,

```
χ_q Kh(D; ℤ) = (q+q⁻¹) · eval(T↦−q, D.jonesPolynomial),
```

which is `TauCeti.OrientedPDCode.khovanovEulerChar_eq_mul_eval₂_jonesPolynomial` (Khovanov, *A
categorification of the Jones polynomial*, §4.2, Proposition 9, and §7.2, Proposition 27). The
comparison runs through the native state weights: the native loop exponent is the truncated
`k − 1`, and `k ≥ 1` for a nonempty diagram justifies multiplying by the extra loop factor
`q + q⁻¹`. The empty diagram has `χ = 1` (`TauCeti.OrientedPDCode.khovanovEulerChar_empty`), and a
crossing-free unlink with `k` components has `(q + q⁻¹)ᵏ`
(`TauCeti.OrientedPDCode.enhancedStateSum_eq_pow`). This comparison uses the native Jones
definition and weights only; GeometricTopology owns the other Jones algorithms and the geometric
invariance of the polynomial, and §5.6 proves the value at `q = 1`.

*Needs:* §3.4; Tau Ceti `TauCeti.OrientedPDCode.khovanovEulerChar`,
`TauCeti.OrientedPDCode.khovanovEulerChar_eq_mul_eval₂_jonesPolynomial`,
`TauCeti.OrientedPDCode.khovanovEulerChar_empty`, `TauCeti.OrientedPDCode.enhancedStateSum`.

**Checks.**
- For the right-handed trefoil, `J = t + t³ − t⁴` and `T ↦ −q` gives `t ↦ q²`, so
  `(q + q⁻¹)(q² + q⁶ − q⁸) = q + q³ + q⁵ − q⁹`, which is
  `TauCeti.enhancedStateSum_rightHandedTrefoilPDCode` and agrees with the ranks of §6.3: `q + q³`
  in cochain degree `0`, `q⁵` in degree `2` and `−q⁹` in degree `3`.
- For the positive Hopf link, the closure of `σ₁²`, `J = −t^(1/2) − t^(5/2) = −T − T⁵`; `T ↦ −q`
  gives `q + q⁵` and `χ_q = 1 + q² + q⁴ + q⁶`, the four free summands of §6.3 in cochain degrees
  `0, 0, 2, 2`. The substitution `T ↦ q` would give `−(1 + q² + q⁴ + q⁶)`, which no homology
  concentrated in even cochain degrees has.

### 3.6 Formal complexes of diagrams with boundary

Construct the finite open-diagram carrier from the finite PL embeddings in the oriented disc of
§1.6: exactly the marked boundary ports in their cyclic order, boundary collars and the specified
crossing patches, retaining local crossing signs, component data and the boundary marking. Prove
the empty-boundary comparison with the closed PL carrier of §1.6. Construct its normalized finite
formal cube and bounded cochain complex in the native `CochainComplex` category of the
degree-zero additive envelope of §2.8, with the `A`-to-`B` convention, cube signs and quantum
shifts of the conventions.

Construct planar insertion of these complexes by finite totalization, with differential sign
`(-1)^(r₁+⋯+rᵢ₋₁)` on the differential in factor `i`, where `rⱼ` is that factor's normalized
cochain degree `|Sⱼ| − n₋(Tⱼ)`, not its cube height (Bar-Natan, *Khovanov's homology for tangles
and cobordisms*, §5, Theorem 2). For an ordered list of crossing blocks construct the
identification of the insertion with the native cube, with state sign
`(-1)^(Σ_(i<j) n₋(Tᵢ)|Sⱼ|)`. Prove its action on maps, shifts and homotopies, and its
compatibility with associativity, boundary relabelling and crossing-order transport. For every
event use the source and target identifications for the same slot order; their signs change when
an event changes a block's negative crossing count. The planar-insertion slot order is fixed. Raw
permutations of crossing blocks use the reordering isomorphism of §3.1. After normalization, the
comparison with the cochain Koszul symmetry includes the constant sign `(-1)^(a b)` for blocks with
negative crossing counts `a`, `b`; prove this shift/tensor identity here, and for a block
permutation the constant `(-1)^(Σ_(inverted pairs i,j) aᵢ aⱼ)`. Prove composition and insertion
coherence with these constants, rather than identifying raw cube reordering with normalized
Koszul braiding.

*Needs:* §§1.6, 1.8, 2.8, 3.1; Mathlib `CochainComplex`, `HomologicalComplex₂.total`.

**Checks.**
- Two one-crossing blocks with `n₋ = 1` each, inserted in this order: on the state with both
  crossings `B`-smoothed (`|S₁| = |S₂| = 1`) the identification sign is `(-1)^(1·1) = −1`, while on
  the state with only the second crossing `B`-smoothed it is `−1` too and with only the first it
  is `+1`. A sign depending on cube heights `|Sⱼ|` alone, `(-1)^(|S₁||S₂|)`, would give `+1` on the
  state with only the second crossing `B`-smoothed.

### 3.7 Closed evaluation by the Frobenius object

For every planar closing exterior, glue first and evaluate the resulting closed formal category
by the Frobenius object of §2.1. Construct the finite component and incoming/outgoing
boundary-incidence data of each glued presentation. On each connected surface presentation with
closed boundary prove that `g = (2 − χ − b)/2` is a nonnegative integer, where `b` is its total
number of boundary circles, from the admissible oriented template generation of §2.5, with the
explicit changes of boundary cycles, components and cell counts under the seam gluings. Construct
the finite gluing-incidence graph `Γ` and prove that, for each connected `Γ`,
`g_out = Σ g_v + |E(Γ)| − |V(Γ)| + 1` and `b_out = Σ b_v − 2|E(Γ)|` when its seams are whole boundary
circles, together with the interval-seam and boundary-cycle updates needed before closure.

To a component with `p` incoming and `q` outgoing circles assign `Δ_q ∘ (m∘Δ)^g ∘ m_p`, with
`m₀ = η`, `Δ₀ = ε` and the one-factor maps identities, and tensor over components using the marked
boundary correspondences. Prove invariance under the presentation equivalence of §2.5 from its
preserved component, boundary and cell-count data. Prove the commutative-Frobenius normal-form
gluing identity: contract a spanning tree of each incidence graph using the Frobenius, unit and
counit equations, and show that every remaining edge contributes one handle operator `m∘Δ`. This
proves functoriality, the values on the elementary templates, permutation coherence and the
closure and gluing compatibility directly from the construction. Prove that the value has quantum
degree `χ`, and that it kills `S`, `T` and `4Tu` over `ℤ`, using the neck-cutting identity
`a = ε(Xa)·1 + ε(a)·X` for arbitrary labelled discs. Extend by `CategoryTheory.Mat_.lift` and
cochain totalization, and identify the resulting complexes, maps and homotopies with the native
complexes of §3.2 (Bar-Natan, *Khovanov's homology for tangles and cobordisms*, §7, Proposition
7.2, and §9.1).

*Needs:* §§2.1, 2.5–2.8, 3.2, 3.6; Mathlib `CategoryTheory.Mat_.lift`.

**Checks.**
- A closed torus has `χ = 0`, `b = 0`, so `g = 1`, and evaluates to `ε ∘ (m∘Δ) ∘ η = 2`; a sphere
  has `g = 0` and evaluates to `ε(1) = 0`; a closed surface of genus two evaluates to `0`, since
  `(m∘Δ)²(1) = m∘Δ(2X) = 0`. The pair of pants (`χ = −1`, `b = 3`) has `g = 0`; a formula
  `g = (2 − χ + b)/2` would give it genus `3`.
- Cutting the neck of a torus: the identity of `V` is `a ↦ ε(Xa)·1 + ε(a)·X`, whose trace over
  the basis `1, X` is `ε(X) + ε(X) = 2`, the torus value. The formula with the two counits
  exchanged, `a ↦ ε(a)·1 + ε(Xa)·X`, sends `1` to `X` and `X` to `1`, so it is not the identity and
  its trace is `0`.

### Examples

- The trefoil: the cochain ranks `4, 6, 12, 8` of §3.2, the Euler characteristic of §3.5, and the
  homology of §6.3.
- The empty diagram and the unknot: the complexes `R` in bidegree `(0, 0)` and `R` in `(0, ±1)`.

### Dependencies

Layers 1 (§§1.5, 1.6, 1.8) and 2. Tau Ceti: the signed cube complex with its mapping-cone,
reordering and dual constructions; the cube of resolutions, the bracket, the normalized complex,
its support, base change and homology; the enhanced state sum, the graded Euler characteristic and
the Jones comparison; the Koszul braiding of cochain complexes. Mathlib: cochain complexes and
their homology, graded objects with their total object and monoidal structure, and
`CategoryTheory.Mat_`. The Jones polynomial enters only through Tau Ceti's state-sum definition.

## Layer 8: plane geometry, relative extension and smooth link comparison

This layer uses only Layer 1 and the differential-topology suppliers, and comes before Layer 4 in
the build. Its smooth links are Tau Ceti's `TauCeti.SmoothLinkEmbedding I M n` (the empty link
included) with the simultaneous ambient-isotopy relation `TauCeti.SmoothLinkEmbedding.SmoothAmbientIsotopic`;
component labels and orientations are transported explicitly, and one simultaneous
ambient-isotopy witness serves the whole finite family. The ambient space of the classical
comparisons is `ℝ³`; its inclusion in `S³` is an explicit chart comparison, with the avoidance data
of §7.2.

### 8.1 Plane realizations of PD-codes

Construct the smooth plane-diagram adapter from the finite PL models of §1.6: a realized plane
diagram is a native code together with an actual finite realization of its arcs and crossing
patches in `ℝ²`, compatible with the cyclic orders and the over/under data. The spatial projection
is `(x, y, z) ↦ (x, y)`, and at a crossing the strand with larger `z` is over. Prove the
crossing-sign dictionary in these coordinates (a crossing is positive exactly when the determinant
of the over-strand and under-strand directions is positive), with its comparison with
GeometricTopology's presentation interface and with the native `TauCeti.rightHandedTrefoilPDCode`.
Require exactly the recorded transverse double points, with no other intersections, triple points
or tangencies; away from the crossing patches the realized arcs and isolated circles are disjoint.

Prove the equivalence of these realizations with generic smooth immersions of the finite oriented
circle family, after a controlled smoothing. Construct relative polygonalization and smoothing of
the finitely many arcs, by compactness and GeometricTopology's Layer 1 tubular charts, preserving
the crossing patches, the isolated-circle labels and the actual complement regions. The
polygonal-to-smooth comparison uses continuous or PL ambient isotopies and keeps a chosen
controlled smooth rounding; smooth ambient isotopies between two roundings come from the relative
extension of §8.5.

*Needs:* §1.6; GeometricTopology Layer 1 (tubular neighbourhoods) and Layer 4 (diagram
presentations); Tau Ceti `TauCeti.OrientedPDCode`, `TauCeti.OrientedPDCode.crossingSign`,
`TauCeti.rightHandedTrefoilPDCode`; Mathlib `EuclideanSpace ℝ (Fin 2)`, smooth immersions.

**Checks.**
- An over-strand along `(1, 0)` at height `z = 1` crossing an under-strand along `(0, 1)` at
  `z = 0` has determinant `1` and is positive; exchanging the heights makes it negative. A
  dictionary taking the strand with smaller `z` as over would reverse every sign and realize
  `TauCeti.rightHandedTrefoilPDCode`, of writhe `3`, as a left-handed trefoil.

### 8.2 Complement regions, faces and orientation

Using ConformalMapping's Layer 5 Jordan separation and filled-hull theory (`TauCeti.filledHull`),
construct the finite dictionary between a realized polygonal diagram, its plane graph and its
complement regions, with the PL-disc and boundary-orientation comparisons. Construct finite
diagonal (ear) triangulations of polygonal regions and their effective cell refinements from that
separation theorem. For a connected crossing-bearing component identify the native face cycles
(`TauCeti.PDCode.face`) with its complement regions; for disconnected diagrams keep the
containing-region and nesting data instead of identifying individual face cycles with global
regions. Bridges, loops, parallel edges and isolated circles are included.

A simple oriented polygonal circle with vertices `v₁, …, vₖ` is *counterclockwise* when its signed
shoelace sum `Σ det(vᵢ, vᵢ₊₁)` is positive in the standard orientation of `ℝ²`. Prove that the sum
never vanishes, changes sign under reversal, and is invariant under cyclic relabelling and
subdivision, and prove the boundary-orientation dictionary. Define the counterclockwise convention
for controlled smooth roundings by transport and prove its independence of the admissible rounding.
Keep the unbounded region and the relative placement and nesting of split components and
crossing-free circles, described through the realized complement, the empty diagram and its
unbounded region included. Export the forgetful map to the native code, the component labels, the
outer-face dictionary for crossing-bearing components, and transport under actual plane ambient
isotopies; when a relabelling or a slot rotation is realized geometrically, keep the actual
ambient-isotopy witness.

*Needs:* §8.1; ConformalMapping Layer 5 (Jordan separation, filled hulls); Tau Ceti
`TauCeti.filledHull`, `TauCeti.PDCode.face`; Mathlib `Matrix.det`, `Finset.sum`.

**Checks.**
- The square `(0,0), (1,0), (1,1), (0,1)` has shoelace sum `0 + 1 + 1 + 0 = 2 > 0` and is
  counterclockwise; reversed, the sum is `−2`. Subdividing the edge from `(1,0)` to `(1,1)` at
  `(1, ½)` replaces `det((1,0),(1,1)) = 1` by `½ + ½`.

### 8.3 Orientation bits of crossing-free circles

For every native circle constructor (Tau Ceti's `TauCeti.OrientedPDCode.adjoinCircle`, the circle
moves `TauCeti.OrientedPDCode.adjoinKink`, `TauCeti.OrientedPDCode.insertCircleClasp`,
`TauCeti.OrientedPDCode.adjoinTwoCircleClasp`, and the braid closure of §8.7), prove the
translation of its orientation bit from its outgoing-slot orientation data, its local frame and the
placement of its bounded side. In the arc-left-to-right circle-clasp frame, with the first slot
`0` west and the second slot `1` west, `o = true` traverses the upper arc left to right and the
lower arc right to left: the small-lune circle is clockwise, while the enclosing-circle placement
is counterclockwise; for `o = false` both conclusions are reversed. Every comparison between
constructor parameters and plane-adapter bits keeps the placement data. Construct the orientation
translations and component maps for each supported geometric event, keeping the unaffected
component bijections and the explicit changed-component incidences. This layer owns these frame,
bit and placement dictionaries; Layer 4 owns their comparison words with native moves. A raw native
circle generator need not be a single supported plane second-move event in every chosen
realization. Construct explicit geometric comparison movies for changes of the outer region or of
the nesting of components.

*Needs:* §§1.3, 8.2; Tau Ceti `TauCeti.OrientedPDCode.adjoinCircle` and the circle-move
constructors.

### 8.4 Relative general position

Construct a common finite-dimensional relative general-position floor for the one-parameter link
comparison of §8.6 and the two-parameter movie comparison of §7.5. For each fixed finite jet
order and sheet bound, construct the finite-jet and multijet evaluation maps for compact smooth
families of the given link or surface embeddings; the collision strata and normal forms specific to
each theorem are constructed in its own section. Build finite polynomial and bump perturbations in
one common finite-dimensional parameter space for those bounds, and prove that evaluation is a
submersion at every distinct-point configuration, deriving the polynomial degree bound by finite
jet interpolation at those points (Golubitsky–Guillemin, *Stable Mappings and Their
Singularities*, §II.4, Theorem 4.13, for multijet transversality).

Exhaust the critical and failure loci in countably many configuration charts by compact pieces.
Construct each bad-stratum incidence manifold and its projection to the parameter space, and prove
that failure of slice transversality is equivalent to criticality of the projection. Apply Tau
Ceti's Morse–Sard theorem `TauCeti.interior_image_criticalPoints_eq_empty` on these
finite-dimensional charts, with the sufficient regularity bound `dim(source)² + 1`, met by
smoothness; compact critical pieces then have closed images with empty interior, hence nowhere
dense. Apply finite-dimensional Baire (`dense_iInter_of_isOpen`) to obtain one generic parameter in
every sufficiently small parameter ball, simultaneously for all the configuration charts. Treat
coincident-point strata and mixed configurations with prescribed collar jets separately, checking
the corresponding relative transversality conditions. Construct the local projection and family
adapters against native smooth charts, bump functions, and the finite-dimensional implicit-function
and Sard theorems with their actual hypotheses. This floor is entirely finite-dimensional and
independent of the Khovanov maps and movie relations.

*Needs:* Tau Ceti `TauCeti.interior_image_criticalPoints_eq_empty`; Mathlib
`dense_iInter_of_isOpen`, `ContDiffBump`, the implicit-function theorem; DifferentialGeometry
Layer 3; GeometricTopology Layer 1.

### 8.5 Relative ambient extension

Construct the relative ambient-extension adapter. Consume the finite-dimensional
maximal-integral-curve smoothness, flow-domain openness and escape results of DifferentialGeometry
§§3.2, 3.3 and 3.5 and GeometricTopology's Layer 1 tubular neighbourhoods. For joint
finite-dimensional parameter dependence, adjoin stationary parameter coordinates and the
evolution-time coordinate to the vector field, keeping its finite-time confinement and endpoint
extension hypotheses. For compact smooth families of embeddings fixed on specified open germs,
construct parameter-dependent tubular and slice extensions of their velocity, using finite local
inverse-function charts, partitions of unity and compact cutoffs. Prove one compact spatial
support and joint smoothness, and construct the extension in time from endpoint-constant germs.
Prove that the time-dependent flow exists on the whole compact parameter interval, from that
support and the maximal-flow continuation and escape criterion.

Bundle the result as Tau Ceti's `TauCeti.Diffeotopy`, with the original velocity equation along
every component, the identity on the fixed germs and simultaneous component transport. Construct
the jointly smooth inverse by reverse evolution and uniqueness. For the suspended field `(1, V)`,
prove confinement on each compact time band; its time component is constant, and the coordinate
preserved by the diffeotopy is evolution time, distinct from the physical height of a movie.
Include the parameter-family version and the subdivision and composition laws (Hirsch,
*Differential Topology*, Ch. 8, §1, Theorems 1.3–1.4). Layer 7 constructs the separate boundary
jet, collar and cylindrical-end adapters before applying this boundaryless flow construction.

*Needs:* DifferentialGeometry §§3.2, 3.3, 3.5; GeometricTopology Layer 1; Tau Ceti
`TauCeti.Diffeotopy`; Mathlib smooth partitions of unity and the inverse-function theorem.

### 8.6 The relative labelled Reidemeister theorem

Prove the relative finite-labelled smooth one-parameter projection theorem in `ℝ³`. Its endpoints
are realized plane diagrams (§8.1) with finite component labels and orientation-compatible
parametrizations. Given one simultaneous smooth ambient isotopy, make its parameter constant near
the endpoints and use §§8.4–8.5 to construct a small generic perturbation preserving the endpoints
and any prescribed generic fixed germs. Prove the local normal forms of planar isotopy and of the
first, second and third moves, with all orientations and over-strand possibilities, and a finite
event subdivision. Export an actual supported plane-move word with its component and endpoint
transports. Prove the converse by constructing simultaneous smooth ambient realizations of the
supported moves. Construct generic representatives and chosen comparison isotopies for arbitrary
finite labelled smooth links, and prove the polygonal-to-smooth bridge with its relative
parametrization laws (Lickorish, *An Introduction to Knot Theory*, Ch. 1, for the PL theorem).
Compare this labelled relative theorem with GeometricTopology's geometric and diagram presentation
definitions, and export its oriented, framing-forgotten, single-component specialization after
forgetting the component label, with the comparison of its presentations.

*Needs:* §§8.1–8.5; GeometricTopology Layer 4 (diagrams and Reidemeister's theorem); Tau Ceti
`TauCeti.SmoothLinkEmbedding`, `TauCeti.SmoothLinkEmbedding.SmoothAmbientIsotopic`.

### 8.7 Geometric braid closures

Construct the chosen smooth geometric closure of every native braid word `TauCeti.BraidWord`:
strands run upward at increasing rightward positions, with disjoint nested return arcs on the
left. Build the corresponding plane diagram and spatial PL realization with crossing heights, and
then its controlled smooth rounding as a finite native `TauCeti.SmoothLinkEmbedding`, keeping the
component labelling and orientation-compatible parametrizations. Prove its comparison with the
native PD closure `TauCeti.BraidWord.closure`, including unused strands and the cases of the
empty word and of no strands. The single-component case admits GeometricTopology's knot
presentation comparison; the general closure is a labelled link.

*Needs:* §§8.1–8.2; Tau Ceti `TauCeti.BraidWord.closure`, `TauCeti.BraidWord.closure_nil`,
`TauCeti.SmoothLinkEmbedding`.

**Checks.**
- The closure of the empty word on `k` strands is `TauCeti.OrientedPDCode.unlink` of `k` copies
  of `true` (`TauCeti.BraidWord.closure_nil`); geometrically each strand goes up on the right and
  returns down on the left, so each circle is counterclockwise, which is the meaning of `true` in
  the conventions. Return arcs on the right would make every bit clockwise.

### 8.8 Reparametrizing circles

For each orientation-preserving smooth diffeomorphism of the standard circle, construct an
increasing smooth period-one lift `F : ℝ → ℝ`, and interpolate by `(1 − ρ(t))x + ρ(t)F(x)` with
endpoint-constant `ρ`. Prove positive derivative, descent to the native circle and a jointly
smooth inverse by the finite-dimensional inverse-function theorem, and reuse Tau Ceti's
`TauCeti.SmoothEmbedding.compDiffeomorph`. Apply the relative extension of §8.5 to a finite family
of these embedded circle isotopies at once, and export one ambient `TauCeti.Diffeotopy` satisfying
the pointwise `TauCeti.SmoothLinkEmbedding.SmoothAmbientIsotopic` equation for all component parameters. Keep the
chosen lifts and paths as comparison data, with component permutations recorded separately.

*Needs:* §8.5; Tau Ceti `TauCeti.SmoothEmbedding.compDiffeomorph`, `TauCeti.Diffeotopy`,
`TauCeti.SmoothLinkEmbedding.SmoothAmbientIsotopic`.

### Examples

- The plane realization of `TauCeti.rightHandedTrefoilPDCode`: three positive crossings and five
  complement regions, one of them unbounded, matching its five faces (`3 − 6 + 5 = 2`).
- The closure of `σ₁³` on two strands as a smooth knot, and of the empty word on two strands as the
  two-component unlink with both circles counterclockwise.

### Dependencies

Layer 1 (§§1.3, 1.6). GeometricTopology Layers 1 and 4; DifferentialGeometry Layer 2 and §§3.2,
3.3, 3.5; ConformalMapping Layer 5. Tau Ceti: smooth links and their ambient isotopy,
diffeotopies, smooth embeddings and their reparametrization, the Morse–Sard theorem, filled hulls,
braid closures. Mathlib: Baire category, bump functions, the implicit- and inverse-function
theorems, and affine geometry of `ℝ²` and `ℝ³`.

## Layer 4: Reidemeister chain homotopies and link invariance

### 4.1 Local formal Reidemeister maps

In the quantum-degree-zero additive category of §2.8, construct the local formal chain maps, their
inverses and the homotopies for every oriented first, second and third move, their mirrors,
placement variants and inverses, on the formal complexes of §3.6. Establish the formal homotopy
identities before applying closed evaluation (Bar-Natan, *Khovanov's homology for tangles and
cobordisms*, §4.3). Then prove the closed comparison through the Frobenius evaluation of §3.7:
maps of degree `(0, 0)` and homotopies of degree `(−1, 0)` between the native complexes
`TauCeti.OrientedPDCode.khovanovComplex` of the two diagrams. Include crossing-free components,
relabelling and the rotation of local slots. Use the actual native local moves of §1.3 with their
face and locality hypotheses, and keep the planar locality condition on clasp insertions used as
second moves.

*Needs:* §§1.3, 1.8, 2.7–2.8, 3.6–3.7; Tau Ceti `TauCeti.OrientedPDCode.IsReidemeisterMove` and its
constructors, `TauCeti.OrientedPDCode.khovanovComplex`; Mathlib `Homotopy`, `HomotopyEquiv`.

### 4.2 The planar move relation

Construct the planar-restricted move relation: the generators of
`TauCeti.OrientedPDCode.IsReidemeisterMove` between planar codes. Planarity holds in both
directions for every generator: for relabelling, slot rotation, the first move on an arc and on a
circle, the three clasps and the third move these are Tau Ceti's `TauCeti.PDCode.isPlanar_relabel`,
`TauCeti.PDCode.isPlanar_rotateCrossing`, `TauCeti.PDCode.isPlanar_reidemeisterOne`,
`TauCeti.PDCode.isPlanar_adjoinKink_iff`, `TauCeti.PDCode.isPlanar_insertClasp_iff_face_eq_or_not_mem_orbit`,
`TauCeti.PDCode.isPlanar_insertCircleClasp_iff`, `TauCeti.PDCode.isPlanar_adjoinTwoCircleClasp` and
`TauCeti.PDCode.isPlanar_reidemeisterThree_iff`. Deduce that a Reidemeister equivalence between
planar codes passes through planar codes only, so that the planar relation and
`TauCeti.OrientedPDCode.ReidemeisterEquiv` agree on planar codes. Graph components of the
underlying ribbon graph are kept separate from link components throughout; the clasp generator
keeps its exact clasp-side face equation, and the third move the full
`TauCeti.PDCode.HasReidemeisterThreeTriangle` hypothesis, including its over-strand constraint.

For a clasp joining two different graph components, keep a placement-chosen planar closure and
prove its local comparison directly by the formal surface identities of §2.7. For a second move
between two parts of one arc, construct the derived sequence kink, clasp, inverse kink, with its
local exterior comparison and the distinct-arc hypotheses of the native clasp.

*Needs:* §§1.3, 2.7; Tau Ceti the planarity lemmas listed above,
`TauCeti.PDCode.faceCount_insertClasp_of_face_ne`, `TauCeti.PDCode.not_isPlanar_insertClasp_of_face_ne`.

**Checks.**
- The first move on an arc adds one vertex and two edges and one face, so `V − E + F` is unchanged;
  a clasp between two different graph components adds two vertices and four edges, keeps the
  faces and lowers the number of graph components by one, so `V − E + F` drops by `2`, exactly as
  twice the component count does. A clasp inserted across two different faces of one component
  keeps the components and lowers `V − E + F` by `2`, so the result is not planar
  (`TauCeti.PDCode.not_isPlanar_insertClasp_of_face_ne`).

### 4.3 The dictionary of moves

Construct the dictionary between GeometricTopology's diagram relation, the native
`TauCeti.OrientedPDCode.IsReidemeisterMove` and the geometric moves of the plane-diagram adapter of
§8.1, with the placement hypotheses and actual move words needed to compare the three equivalence
relations and the geometric witness of each plane event. Every local plane move keeps its actual
changing disc, the specified diagram inside it and the identification of the unchanged exterior;
the disc contains no further split component or isolated circle, and this empty-disc witness is
supplied in addition to the intrinsic face condition. Abstract planarity of a code is kept separate
from admissibility of a move in a fixed plane realization; when only an existence comparison is
required, supply compatible placements and their comparison movies explicitly.

*Needs:* §§4.2, 8.1–8.3; GeometricTopology Layer 4 (the diagram relation).

### 4.4 Cancellation and the closed comparisons

Construct the formal deformation retractions from the local surface relations of §2.7 and Mathlib's
homotopy and mapping-cone constructions, and prove their closed cancellation comparisons. After
Frobenius evaluation, the first move gives `C(D′) ≃ C(D) ⊕ Cone(id)`, with its actual grading
shifts and surviving summand `C(D)`; the second move removes two contractible summands and keeps
the closure; for the third move construct the formal comparison maps and homotopies and prove the
compatible comparison of the surviving complexes and cones after evaluation. The formal
cancellations use the formal surface identities, and the separate closed cancellation uses the
evaluated rank-two module. Prove the equations on generators and all quantum and cochain shifts,
carry every admissible exterior closure of §1.8 and its cube maps, and prove each oriented variant
and the crossing-reordering signs with explicit parameter transport.

*Needs:* §§3.1, 3.6–3.7, 4.1–4.2; Mathlib `HomotopyEquiv`,
`CochainComplex.mappingCone`.

**Checks.**
- For the positive kink, the closure of `σ₁` on two strands (`n₊ = 1`), the complex has integral
  ranks `4` and `2` in cochain degrees `0` and `1` (two circles, then one); the unknot has rank `2`
  in degree `0`, and `Cone(id)` of a rank-two module has ranks `2` and `2`, so the ranks agree
  (`4 = 2 + 2`, `2 = 2`). The homology of both is `ℤ` in `(0, ±1)`.

### 4.5 Invariance for diagrams

Deduce chain homotopy equivalences along finite move words, and the graded homology isomorphisms.
Prove *Reidemeister invariance*,
`nonempty_homotopyEquiv_khovanovComplex_of_reidemeisterEquiv`: if `D` and `D'` are planar oriented
PD-codes with `TauCeti.OrientedPDCode.ReidemeisterEquiv D D'`, then for every commutative ring `R`
and every quantum degree `j` the complexes `D.khovanovComplex hD R j` and
`D'.khovanovComplex hD' R j` are chain homotopy equivalent; in particular
`Khⁱʲ(D; R) ≅ Khⁱʲ(D'; R)` for all `i`, `j` (Khovanov, *A categorification of the Jones
polynomial*, §4.2, Theorem 1, and §7.1, Theorem 2; Bar-Natan, *Khovanov's homology for tangles and
cobordisms*, §4.2, Theorem 1). The equivalences are attached to move words (§1.3): prove the
identity and concatenation laws for the specified comparison words in the homotopy category, and
keep the words in the maps. Before the movie relations of Layer 7 this is invariance of the
complex up to homotopy and of homology up to isomorphism; Layer 7 constructs the projective laws of
the comparison maps.

*Needs:* §§1.3, 4.1–4.4; Tau Ceti `TauCeti.OrientedPDCode.ReidemeisterEquiv`,
`TauCeti.OrientedPDCode.khovanovComplex`; Mathlib `HomotopyEquiv`,
`HomotopyEquiv.toHomologyIso`.

**Checks.**
- The closure of `σ₁σ₁⁻¹` on two strands and the crossing-free two-component unlink are related
  by a second move; both have integral homology of ranks `1, 2, 1` in bidegrees `(0, −2)`,
  `(0, 0)`, `(0, 2)`. The positive and negative kinks and the crossing-free unknot all have `ℤ` in
  `(0, 1)` and `(0, −1)`. Without the normalization shifts of the conventions the positive kink
  (`n₊ = 1`) would have its homology in quantum degrees `0` and `−2`, the unknot's lowered by
  `n₊ − 2n₋ = 1`.

### 4.6 Invariance for smooth links

Prove invariance under simultaneous smooth ambient isotopy in `ℝ³`, using the relative labelled
Reidemeister theorem of §8.6 and the move dictionary of §4.3. For a native
`TauCeti.SmoothLinkEmbedding` in `ℝ³`, choose a generic realized diagram and a simultaneous
pointwise ambient comparison, using the reparametrization theorem of §8.8 when the oriented
component images were matched first. Define the Khovanov complex and homology of the smooth link
from that presentation, and prove that any two choices give graded chain homotopy equivalences
and graded module isomorphisms. Export a chosen generic representative for each native smooth link
with its chosen comparison equivalences, and prove the identity and composition laws for the
specified comparison words in the homotopy category.

*Needs:* §§4.3, 4.5, 8.6, 8.8; Tau Ceti `TauCeti.SmoothLinkEmbedding`,
`TauCeti.SmoothLinkEmbedding.SmoothAmbientIsotopic`.

### Examples

- The kink and second-move unknots and unlinks of the Checks above, and the right-handed trefoil
  presented as the closure of `σ₁³` and as `TauCeti.rightHandedTrefoilPDCode`: two planar
  three-crossing codes of the same knot, all crossings positive, with the homology of §6.3.

### Dependencies

Layers 1–3 and 8. Tau Ceti: Reidemeister moves and equivalence of oriented PD-codes, the planarity
lemmas for every generator, the normalized Khovanov complex, smooth links and ambient isotopy.
GeometricTopology Layer 4 (the diagram relation). Mathlib: homotopy equivalences of complexes,
mapping cones and their homology.

## Layer 5: exact sequences, coefficients, symmetry and based links

### 5.1 The skein exact sequence

For a selected crossing `c` of a planar code, put `c` first in the crossing order (§3.1) and
decompose the cube of resolutions into its `0`- and `1`-faces in the direction of `c`. The faces
are the cubes of the two vertex resolutions `D₀`, `D₁` of §1.7. Prove the unnormalized short exact
sequence of complexes

```
0 → C̄(D₁)⟨1⟩[−1] → C̄(D) → C̄(D₀) → 0,
```

with the differential sign of the shift, construct the saddle map `C̄(D₀) → C̄(D₁)⟨1⟩` and the
comparison of `C̄(D)` with its mapping cone, with its sign on the `1`-face summand, and export the
long exact sequence of homology.

Translate every normalized version through the actual `n₊`, `n₋` of the three oriented diagrams.
The coherent smoothing inherits the orientation of `D`; on the other smoothing choose an
orientation of every component, keeping the crossing-free Boolean labels as explicit orientation
and placement data (derived from Layer 8 when a geometric realization is used); the unnormalized
complex does not depend on these choices. For the face `r ∈ {0, 1}` set
`a_r = n₋(D) − n₋(D_r) − r` and `b_r = r + n₊(D) − 2n₋(D) − n₊(D_r) + 2n₋(D_r)`. The normalized face
term is `C(D_r)[a_r]⟨b_r⟩`. On a residual state `S′` its identification with the full cube face has
the sign `(-1)^((n₋(D) − n₋(D_r))|S′|)`: the face differential has sign `(-1)^r`, whereas the shifted
differential has sign `(-1)^(a_r)`. Prove this signed identification, the inclusion of the
`1`-face and the quotient onto the `0`-face, and the resulting signs of the connecting maps for the
chosen orientations.

*Needs:* §§1.7, 3.1–3.2; Tau Ceti `TauCeti.PDCode.resolveCrossing`,
`TauCeti.PDCode.resolveCrossingResolvedCircleEquiv`,
`CategoryTheory.Functor.cubeComplexMappingConeIso`; Mathlib `CochainComplex.mappingCone`,
`CategoryTheory.ShortComplex.ShortExact.δ`.

**Checks.**
- For the positive kink (`n₊ = 1`, `n₋ = 0`) resolved at its crossing, `D₀` is the oriented
  smoothing, a crossing-free two-component unlink, and `D₁` is a crossing-free unknot, so
  `a₀ = 0`, `b₀ = 1`, `a₁ = −1`, `b₁ = 2`. The `0`-face term `C(D₀)⟨1⟩` has homology of ranks
  `1, 2, 1` in bidegrees `(0, −1)`, `(0, 1)`, `(0, 3)`; the `1`-face term `C(D₁)[−1]⟨2⟩` has `ℤ` in
  `(1, 1)` and `(1, 3)`; the connecting map, a merge, is onto the latter, and the long exact
  sequence leaves `ℤ` in `(0, ±1)`, the homology of the unknot.

### 5.2 Universal coefficients for bounded finite free complexes

Construct the complex-level algebra for bounded complexes of finite free `ℤ`-modules. For an
abelian group `M`, prove the natural short exact sequences

```
0 → Hⁱ(C)⊗M → Hⁱ(C⊗M) → Tor₁(Hⁱ⁺¹(C),M) → 0,
0 → Ext¹(H¹⁻ⁱ(C),M) → Hⁱ(Hom(C,M)) → Hom(H⁻ⁱ(C),M) → 0.
```

The Hom complex is Mathlib's `CochainComplex.linearHomComplex` with target the complex concentrated
in degree zero at `M`; construct the identification `Hom(C, M)ⁱ = Hom(C⁻ⁱ, M)`, with differential
`f ↦ (−1)^(i+1) f d_C`; the dual complex is the case `M = ℤ`. When `M` underlies a commutative ring
`R`, construct its `R`-action on this integral Hom complex through Tau Ceti's
`TauCeti.linearHomComplexPostcomp` applied to multiplication by each scalar, and prove that it
agrees with the pointwise action and with the induced action on homology.

Define `Zⁱ = ker dⁱ` and `Bⁱ = im dⁱ⁻¹`, prove these submodules finite free, and split
`0 → Zⁱ → Cⁱ → Bⁱ⁺¹ → 0` by projectivity of `Bⁱ⁺¹`; the resulting decomposition into two-term free
presentations proves exactness and the existence of splittings, while the presentations
`0 → Bⁱ → Zⁱ → Hⁱ(C) → 0` need not split. Compare their tensor kernels and Hom cokernels with
Mathlib's derived `CategoryTheory.Tor` and `CategoryTheory.Abelian.Ext`, using the `CategoryTheory.HasExt` instance of
`ModuleCat` and the two-term projective presentations. The free presentation resolves the first
tensor variable: construct its comparison with `CategoryTheory.Tor'` and the finite-resolution
balancing comparison with `CategoryTheory.Tor`, which derives the second variable, naturally in
both inputs. Prove that the sequences split, with no natural simultaneous choice of splitting. For
`M` the additive group of a commutative ring `R`, prove that the coefficient and Hom/Ext sequences
and their chosen splittings are `R`-linear, with the `R`-actions on Mathlib's `Tor` and `Ext`
defined through functoriality in the coefficient module, and that the comparison maps preserve
them. The Hom/Ext sequence for chain complexes in an abelian category with split cycles is Tau
Ceti's (`TauCeti.ChainComplex.extToHomology`, `TauCeti.ChainComplex.extToHomology_injective`,
`TauCeti.ChainComplex.exact_extToHomology_kronecker`); the cochain form above is its reindexing.

Construct the universe transport of Convention 5: the lift of the finite integral state modules
from `ModuleCat.{0} ℤ` to `ModuleCat.{u} Z_u`, with `Z_u = ULift.{u} ℤ` acting through
`ULift.ringEquiv`, and its comparisons for homology, tensor products, `Tor`, `Ext` and the
coefficient action, compatible with the integral model in `ModuleCat.{0} ℤ`.

Apply these to the finite quantum summands of §3.2: tensor quantum degrees add and dual quantum
degrees reverse. Export the coefficient sequence for Khovanov homology, with terms
`Khⁱʲ(D; ℤ) ⊗ R` and `Tor₁(Khⁱ⁺¹ʲ(D; ℤ), R)`, using the base change of §3.2.

*Needs:* §3.2; Mathlib `CochainComplex.linearHomComplex`, `CategoryTheory.Tor`,
`CategoryTheory.Tor'`, `CategoryTheory.Abelian.Ext`, `Module.Free`; Tau Ceti
`TauCeti.linearHomComplexPostcomp`, `TauCeti.ChainComplex.extToHomology`,
`TauCeti.PDCode.resolutionCubeBaseChangeIso`.

**Checks.**
- For the right-handed trefoil and `R = 𝔽₂`, the `ℤ/2` in `Kh³'⁷(ℤ)` contributes `𝔽₂` to
  `Kh³'⁷(𝔽₂)` through the tensor term and to `Kh²'⁷(𝔽₂)` through the `Tor` term, so `Kh(𝔽₂)` has
  dimension one in each of `(0,1)`, `(0,3)`, `(2,5)`, `(2,7)`, `(3,7)`, `(3,9)`. With `Tor₁(Hⁱ⁻¹)`
  in place of `Tor₁(Hⁱ⁺¹)` the extra class would land in `(4, 7)`, outside the support `[0, 3]`.

### 5.3 Disjoint union, Künneth and the symmetry of blocks

For two bounded finite free integral complexes prove

```
0 → ⊕[p+q=i] Hᵖ(C)⊗Hᑫ(D) → Hⁱ(C⊗D)
  → ⊕[p+q=i+1] Tor₁(Hᵖ(C),Hᑫ(D)) → 0,
```

constructing the canonical comparison maps and proving exactness, naturality and compatibility
with chain homotopies. Prove the disjoint-union cochain tensor equivalence: when the crossing
block of `D₁` precedes that of `D₂`, its enhanced-state sign is `(-1)^(n₋(D₁)·|S₂|)`. Prove the
crossing-reordering comparison and bind the symmetry of factors to Tau Ceti's
`TauCeti.koszulBraiding` and `TauCeti.koszulSymmetricCategory`, with unsigned quantum symmetry.
Precisely, let `σ₁₂ : C(D₁ ⊔ D₂) → C(D₁) ⊗ C(D₂)` have the displayed state sign, `ρ` reorder the two
crossing blocks with subset sign `(-1)^(|S₁||S₂|)`, and `β` be the native cochain braiding; prove
`σ₂₁ ρ = (-1)^(n₋(D₁)n₋(D₂)) β σ₁₂`, with the corresponding block-permutation coherence of §3.6.
Apply the integral Künneth sequence to `Kh(D₁ ⊔ D₂)` (Khovanov, *A categorification of the Jones
polynomial*, §7.4, Proposition 33 and Corollary 12).

*Needs:* §§3.2–3.3, 3.6, 5.2; Tau Ceti `TauCeti.OrientedPDCode.disjointUnion`,
`TauCeti.koszulBraiding`, `TauCeti.koszulSymmetricCategory`; Mathlib `CategoryTheory.Tor`.

**Checks.**
- The two-component crossing-free unlink has `Kh = V ⊗ V`, ranks `1, 2, 1` in quantum degrees
  `−2, 0, 2`, the tensor square of the unknot's `1, 1` in `−1, 1`. For two right-handed trefoils,
  the `Tor` term contributes `Tor₁(ℤ/2, ℤ/2) = ℤ/2` in total bidegree `(3 + 3 − 1, 7 + 7) = (5, 14)`.

### 5.4 The mirror image

Construct the equivalence of the complex of the mirror with the finite free graded dual complex:
in quantum degree `j` the unnormalized complex of `D.mirror` is the totalization of the dual of the
degree-`(n − j)` cube of `D` (Tau Ceti's `TauCeti.PDCode.mirrorKhovanovBracketIso`), and the
normalized form reverses both degrees (Khovanov, *A categorification of the Jones polynomial*,
§7.3, Proposition 32). Over a field `F` deduce *mirror duality*,
`nonempty_khovanovHomology_mirror_iso_dual`: for a planar oriented PD-code `D`,
`Khⁱʲ(D.mirror; F)` is the dual of `Kh⁻ⁱ'⁻ʲ(D; F)`. Over `ℤ` give the Hom/Ext exact sequence of
§5.2; the torsion comparison reverses the cochain degree with the additional `+1`, in both the
Hom and the Ext terms (Khovanov, *loc. cit.*, Corollary 11): free summands of `Kh(D; ℤ)` in
`(i, j)` correspond to free summands of `Kh(D.mirror; ℤ)` in `(−i, −j)`, and torsion summands in
`(i, j)` to torsion summands in `(1 − i, −j)`.

*Needs:* §§3.2, 5.2; Tau Ceti `TauCeti.OrientedPDCode.mirror`, `TauCeti.PDCode.isPlanar_mirror`,
`TauCeti.PDCode.mirrorKhovanovBracketIso`, `CategoryTheory.Functor.dualCube`; Mathlib
`Module.Dual`.

**Checks.**
- The left-handed trefoil, the closure of `σ₁⁻³`, has integral homology `ℤ` in `(0, −1)`,
  `(0, −3)`, `(−2, −5)`, `(−3, −9)` and `ℤ/2` in `(−2, −7)`: the right-handed values of §6.3 with
  free summands negated and the torsion at `(3, 7)` moved to `(1 − 3, −7)`. Negating the torsion
  bidegree as well would put it at `(−3, −7)`, where the left-handed trefoil has nothing.

### 5.5 Orientation reversal and the linking count

Prove that reversing the orientation of every component leaves the complex unchanged (all
crossing signs are kept; Tau Ceti's `TauCeti.OrientedPDCode.reverse`), and prove the regrading for
reversing a single component. Let `l` be half the signed count of the crossings between the
selected component and all the other components; reversing that component increases `n₋` by `2l`
and decreases `n₊` by `2l`, so the new bidegrees are the old ones minus `(2l, 6l)` (Khovanov, *A
categorification of the Jones polynomial*, §7.2, Proposition 28, in that paper's grading).

Construct this integer diagram linking count. Prove that the sum of the mixed crossing signs is
even, by the finite mod-2 cycle and face-boundary calculus of a genus-zero native rotation system:
build the incidence and face-boundary comparison, with loops and parallel edges, and prove that
the selected union of link components bounds a face 2-chain. Translate this into mod-2 parity of
plane-curve intersections through the realization dictionary of Layer 8. Prove its Reidemeister
and relabelling invariance, its law under orientation reversal and its additivity over the other
components, and use this explicit diagram invariant, with its intersection-sign normalization, in
the regrading formula. For disconnected diagrams apply the face calculation componentwise and use
the containing-region data of §8.2 in the geometric comparison.

*Needs:* §§1.3, 1.5, 3.2, 8.2; Tau Ceti `TauCeti.OrientedPDCode.reverse`,
`TauCeti.OrientedPDCode.crossingSign`, `TauCeti.PDCode.face`.

**Checks.**
- The positive Hopf link (closure of `σ₁²`, `l = 1`) has `ℤ` in `(0, 0)`, `(0, 2)`, `(2, 4)`,
  `(2, 6)`. Reversing one component gives the negative Hopf link, with `ℤ` in `(−2, −6)`,
  `(−2, −4)`, `(0, −2)`, `(0, 0)`: the old bidegrees minus `(2, 6)`. A shift by `(2l, 2l)` would
  give `(−2, −2)`, where the negative Hopf link has nothing.

### 5.6 Quantum parity and the value at `q = 1`

The parity input is Tau Ceti's: the oriented Seifert smoothing `TauCeti.OrientedPDCode.seifertState`,
whose value is `A` exactly at positive crossings (`TauCeti.OrientedPDCode.seifertState_eq_true_iff`), so it
uses `B` exactly at negative ones; the comparison of its successor permutation with the component
permutation by one transposition per crossing; the parity `s − n + c` even for `s` Seifert circles,
`n` crossings and `c` components, isolated circles included
(`TauCeti.OrientedPDCode.even_seifertCircleCount_sub_crossingCount_add_componentCount`); the
constant parity of `|S| + k(S)` along planar cube edges; and the congruence of every quantum degree
to `c` modulo two (`TauCeti.OrientedPDCode.enhancedQuantumDegree_mod_two`; Khovanov, *A
categorification of the Jones polynomial*, §7.2, Proposition 30).

Prove the *value at `q = 1`*, `eval₂_one_enhancedStateSum`: for a planar oriented PD-code `D` with
`c` components, the normalized enhanced-state Euler sum `E(D) = Σ_S (−1)^(|S|+n₋) 2^k(S)`, which is
`TauCeti.OrientedPDCode.enhancedStateSum` at `q = 1`, equals `2^c`. Route: prove invariance under
changing a crossing by the actual `A`/`B` state bijection; construct the oriented planar
smoothings `D_A`, `D_B` and use the parity above to obtain the normalized recurrence
`E(D) = −(−1)^c [(−1)^(c_A) E(D_A) + (−1)^(c_B) E(D_B)]`; prove the component-count alternatives
(for strands on different components both smoothings have `c − 1` components, otherwise their
counts are `c` and `c + 1`); and induct on crossings from the unlink value, accounting explicitly
for the reorientations of the smoothings. Deduce that `Kh(D; ℤ)` and `Kh(D; ℚ)` are nonzero, the
empty diagram included, before the support-length arguments of §6.5.

*Needs:* §§1.5, 1.7, 3.5; Tau Ceti `TauCeti.OrientedPDCode.seifertState`,
`TauCeti.OrientedPDCode.enhancedQuantumDegree_mod_two`, `TauCeti.OrientedPDCode.enhancedStateSum`,
`TauCeti.OrientedPDCode.homologyEulerChar_khovanovComplex`; Mathlib `LaurentPolynomial.eval₂`.

**Checks.**
- `E` is `2` for every knot diagram computed here (unknot, kinks, trefoils, `T(2, 5)`, `T(2, 7)`)
  and `4` for the positive and negative Hopf links and the two-component unlink; for the empty
  diagram it is `1`. For the trefoil, `E = 4 − 6 + 12 − 8 = 2` from §3.2. Without the sign
  `(−1)^(|S|+n₋)` the sum would be `30`.
- The recurrence at the positive kink: `D_A` is the two-component unlink (`c_A = 2`, `E = 4`),
  `D_B` the unknot (`c_B = 1`, `E = 2`), and `−(−1)¹[(−1)²·4 + (−1)¹·2] = 2`.

### 5.7 Graded `W`-modules and the action at a mark

Construct the quantum-graded algebra `W` as the native graded family with `R` in degrees `0` and
`−2` and zero elsewhere, with generator `X` in degree `−2` and `X² = 0`; its underlying algebra is
`DualNumber R`, and the Frobenius circle module is `V = W⟨1⟩` (compare §2.2). Construct graded
`W`-modules as quantum-graded `R`-modules with a homogeneous action, the degree-zero balanced
graded tensor product, its unit and associativity comparisons, and the scalar and opposite
comparisons; its commutativity is unsigned in quantum degrees. These carriers come before the
graded periodic resolution of §5.9 and the connected sum of §5.11.

For a mark on an arc or on a crossing-free labelled circle (§1.4), its selected resolution circle
gives an action of `X` on the complex, a chain map of quantum degree `−2` (multiplication by `X` on
the selected factor). Prove that its square is zero and that it commutes with every saddle.

*Needs:* §§1.4, 2.2, 3.2; Mathlib `GradedObject`, `DualNumber`; Tau Ceti
`TauCeti.PDCode.Mark.resolvedCircle`.

### 5.8 The reduced complex

Define the reduced complex `C̃ = (X·C)⟨1⟩` at a mark, prove its identification with
`(C/X·C)⟨−1⟩`, and export the short exact sequence

```
0 → C̃⟨−1⟩ → C → C̃⟨1⟩ → 0.
```

The reduced theory is that of Khovanov, *Patterns in knot cohomology I*, §3, for knots over `ℚ`;
the integral finite-link construction and the proof by periodic resolutions are this layer's.

*Needs:* §5.7.

**Checks.**
- The reduced unknot is `R` in bidegree `(0, 0)`: `X·V = R·X` in degree `−1`, shifted by `⟨1⟩`.
  The reduced right-handed trefoil is `ℤ` in `(0, 2)`, `(2, 6)`, `(3, 8)` and zero elsewhere, and
  has no torsion. The shift `⟨−1⟩` in the definition would move the unknot to `(0, −2)`.

### 5.9 Invariance of the reduced complex and mark slides

Prove based Reidemeister invariance of the reduced complex, with the transport of the mark along
based words (§1.4). For a slide of the mark across one crossing, from the arc `p` to the arc `q`,
construct the signed reverse-saddle homotopy `H` of cochain degree `−1` and quantum degree `−2`
with `X_p + X_q = dH + Hd`, verifying `Δm = X ⊗ id + id ⊗ X`, `mΔ = 2X`, the full signed-cube
cancellation with the unaffected edges, and the further identities `H² = 0` and `H X_p = X_q H`.

Use Tau Ceti's `TauCeti.dualNumberProjectiveResolution R` of the residue module
`TauCeti.dualNumberResidue R` over `W = DualNumber R`: its projectivity, its augmentation
quasi-isomorphism, its term identifications `TauCeti.dualNumberProjectiveResolutionXIso`, and its
multiplication-by-`ε` differential and augmentation formulas. Construct its quantum-graded lift,
reindexing chain degree `n ≥ 0` as cochain degree `−n` and placing its free generator in quantum
degree `−2n`, and prove the reindexing and forgetful comparison, the homogeneity of the
differential and exactness by transport from the native resolution. For a dot action `a`, the
direct-sum total tensor with `C` has terms `m[X]^n` and differential
`D_a(m[X]^n) = d(m)[X]^n + (−1)^p a(m)[X]^(n−1)` for `m ∈ Cᵖ`, the second term omitted at `n = 0`.
Prove that `C` is termwise graded `W`-free through its selected circle and that each total cochain
degree involves finite sums only.

Set `a = X_p` and `b = −X_q`, and define `K(m[X]^n) = (−1)^p H(m)[X]^(n−1)` for `n > 0` and `0` for
`n = 0`. Prove that `id + K` is a homogeneous chain isomorphism from `D_a` to `D_b`, with inverse
`id − K`; the remaining equations are `dH + Hd = a − b`, `Ha = −bH` and `K² = 0`. Prove that the
canonical augmentations to `C/aC` and `C/bC` are quasi-isomorphisms, by the finite filtration of
the bounded termwise `W`-free complex `C`, and that their cones are contractible as bounded-above
free `R`-complexes by descending projective splittings, one quantum component at a time. Choose
homogeneous homotopy inverses and obtain actual reduced chain maps, inverses and homotopies
through these augmentations, the periodic-resolution isomorphism and the shifted image and
quotient identifications of §5.8, keeping the twist `X ↦ −X` of the target action. Verify that the
local actions and `H` are compatible with each exterior operation, and deduce exterior
naturality in the homotopy category, where the augmentation inverses are unique. Prove the
identity and concatenation laws for mark-slide words, construct the comparisons between marks on
the same component, and the comparisons of the reduced and unreduced exact sequences, with their
action-twist signs and commuting homotopies.

*Needs:* §§1.4, 4.5, 5.7–5.8; Tau Ceti `TauCeti.dualNumberProjectiveResolution`,
`TauCeti.dualNumberProjectiveResolutionXIso`, `TauCeti.dualNumberResidue`; Mathlib
`CategoryTheory.ProjectiveResolution`, `HomotopyEquiv`.

**Checks.**
- On `V ⊗ V`: `Δm(1 ⊗ 1) = 1 ⊗ X + X ⊗ 1 = (X ⊗ id + id ⊗ X)(1 ⊗ 1)`,
  `Δm(1 ⊗ X) = X ⊗ X = (X ⊗ id + id ⊗ X)(1 ⊗ X)` and `Δm(X ⊗ X) = 0`; and `mΔ(1) = 2X`,
  `mΔ(X) = 0`. So `X_p + X_q` is the null-homotopic composite through the saddle, while
  `X_p − X_q` is not of this form: on `1 ⊗ 1` it is `X ⊗ 1 − 1 ⊗ X`, which `Δm` never produces.

### 5.10 Based connected sum of codes

In a link of several components the marked component is kept as part of the invariant. Construct
the oriented based connected sum on native codes, with the plane-placement, labelled mark and
comparison data of Layer 8. A crossing-bearing mark is an actual marked arc, represented by its
outgoing half-edge; a crossing-free mark is a labelled occurrence of the orientation multiset, not
merely a Boolean value. Supply a compatible exposed plane placement: the marked arcs or circle
portions lie on the specified exterior faces or a common complementary region, and a standard
untwisted rectangular band is embedded in that actual region with oriented ends and empty
interior; an intrinsic native face is not by itself this band witness. Construct the needed based
comparison movies from the original plane placements. The operation is parameterized by these
data; prove its independence through based comparison maps that keep the band and outer-region
data.

For two crossing-bearing marks, form the oriented disjoint union
`TauCeti.OrientedPDCode.disjointUnion`, choose the first marked outgoing endpoint `p` and the second
marked incoming endpoint `q`, and apply the reconnection `TauCeti.OrientedPDCode.reconnect p q`;
the orientation of the unchanged half-edges is compatible because the new pairs are
outgoing/incoming, and the crossing and over-strand blocks are kept. If exactly one selected
component is crossing-free, remove that labelled circle occurrence and lengthen the other marked
arc, keeping the crossing matching of the disjoint union. If both are crossing-free, remove the two
marked occurrences and insert the one oriented output-circle occurrence fixed by the band
presentation. Construct the occurrence-label bijections, the output mark and the maps of the
untouched components in every case. Prove planarity of these constructions (from Tau Ceti's
`TauCeti.PDCode.isPlanar_disjointUnion`), their comparison with the standard geometric oriented
connected sum, the decrease of the component count by one, and additivity of `n₊` and `n₋` for the
actual input and output codes.

*Needs:* §§1.3–1.4, 8.1–8.3; Tau Ceti `TauCeti.OrientedPDCode.disjointUnion`,
`TauCeti.OrientedPDCode.reconnect`, `TauCeti.PDCode.isPlanar_disjointUnion`.

### 5.11 The connected-sum isomorphism and the derived tensor product

For every resolution prove the actual circle-set bijection: the selected circle of each input is
merged into the selected output circle, and all other circles are kept. With `W = DualNumber R` in
cochain degree zero and quantum degrees `|1| = 0`, `|X| = −2`, each resolution module is a finite
free graded `W`-module through its selected circle (§5.7). Prove the graded chain isomorphism

`(C(D₁) ⊗_W C(D₂))⟨−1⟩ ≅ C(D₁#D₂)`.

Its statewise map multiplies the two selected-circle labels and is the identity on the other
labelled-circle factors. When the crossings of the first diagram precede those of the second,
include the state sign `(-1)^(n₋(D₁)·|S₂|)` comparing the signed normalized cube with the standard
cochain tensor differential, and prove compatibility with the other crossing orders. Prove that the
map is balanced, invertible, `W`-linear and of quantum degree zero after the displayed shift, in
every crossing-free case as well. Under interchange of the two based factors, keep the same
normalization constant `(-1)^(n₋(D₁)n₋(D₂))` between raw crossing-block reordering and the cochain
Koszul symmetry on the balanced tensor product, and prove its compatibility with the connected-sum
map and the quantum shift.

After forgetting quantum degrees, construct the finite semi-free filtration of these bounded
complexes of finite free `W`-modules by successive cones of shifted free modules, and prove
K-flatness and K-projectivity from it, using Mathlib's K-projectivity of bounded-above complexes of
projectives. In Mathlib's localization `HasDerivedCategory.standard (ModuleCat W)`, with the
universe and smallness hypotheses of that declaration, define the derived tensor product of
bounded-above module complexes by bounded-above projective (K-projective) resolutions. Construct
its functorial maps and the canonical comparison isomorphisms between choices, unique when they
commute with the specified augmentation comparisons, and prove the unit, composition and
balanced-tensor laws. For the bounded free factors here prove directly, by the finite filtration,
that `P₁ ⊗_W C₂ → C₁ ⊗_W C₂` induced by an augmentation is a quasi-isomorphism, and its
second-variable version; this identifies their ordinary tensor product with the derived one. This
ordinary-module comparison is made here over every commutative `R`, without an enveloping `A∞`
algebra or a strictification theorem valid only over fields. Regard `W` as a degree-zero ordinary
DG algebra through DGAInfinity Layer 1, construct its adapter `Wᵒᵖ ≅ W` between right and left
modules, and compare the resulting finite semi-free module and tensor product with DGAInfinity
Layer 5 under that layer's hypotheses. The graded chain isomorphism and its graded homology maps
stay the separately constructed quantum comparison.

*Needs:* §§5.7, 5.9–5.10; Mathlib `HasDerivedCategory.standard`, `CochainComplex.mappingCone`,
`TensorProduct`; DGAInfinity Layers 1 and 5.

**Checks.**
- For two crossing-free unknots, `V ⊗_W V = W⟨2⟩` since `V = W⟨1⟩`, and `(V ⊗_W V)⟨−1⟩ = V`, the
  complex of the unknot, as the connected sum requires. Without the shift `⟨−1⟩` the connected sum
  of two unknots would have homology in quantum degrees `2` and `0`.

### Examples

- The skein sequence at the crossing of a kink (§5.1), the `𝔽₂`-homology of the trefoil (§5.2),
  the mirror pair of trefoils (§5.4), the two orientations of the Hopf link (§5.5), the values
  `E = 2^c` (§5.6) and the reduced trefoil (§5.8).

### Dependencies

Layers 1–4 and 8. Tau Ceti: vertex resolution, the mapping cone of a cube, the mirror of the cube
of resolutions and dual cubes, reversal and disjoint union of oriented codes, reconnection,
Seifert states and the parity of quantum degrees, the enhanced state sum, marks, the Koszul
braiding of cochain complexes, the post-composition action on Hom complexes, the Hom/Ext
universal coefficient sequence for chain complexes, and the periodic projective resolution over
the dual numbers. Mathlib: `Tor`, `Ext`, Hom complexes, mapping cones, homology sequences,
projective resolutions and derived categories. DGAInfinity Layers 1 and 5.

## Layer 6: certified computations and applications

### 6.1 Effective complexes and certificates

Make the circle quotient of §1.1, the finite enhanced-state basis and the differential of §3.3, and
the maps of Layers 4 and 5, effective. Construct integer matrices for the differentials and a
Smith-normal-form certificate interface that proves the cycles, the boundaries and the invariant
factors of the homology, with an explicit comparison to the abstract complex of §3.2. Over a field,
compute by certified row reduction, and verify the coefficient comparisons of §5.2 and the Euler
comparisons of §3.5. Prove that permutations of the basis and the choice of certificate do not
change the answer.

*Needs:* §§1.1, 3.2–3.3, 3.5, 5.2; Mathlib `Matrix`, `Module.Free`, `Submodule.IsPrincipal`.

**Checks.**
- In quantum degree `7` the trefoil complex has rank `3` in cochain degrees `2` and `3` (the three
  states with two `B`-smoothings, each with its two circles labelled `1`, and the all-`B` state
  with one of its three circles labelled `X`) and nothing in degree `1`. The differential is a
  `3 × 3` integer matrix of determinant `±2` with Smith form `diag(1, 1, 2)`: it is injective, and
  its cokernel `ℤ/2` is the torsion in `(3, 7)`. Over `ℚ` it is invertible and nothing survives;
  over `𝔽₂` it has rank `2`, leaving one class in each of `(2, 7)` and `(3, 7)`.

### 6.2 The small links

Fix concrete native PD-codes or specified braid closures for the empty link, the unknots, the
crossing-free unlinks, the positive and negative Hopf links and both trefoils, and prove their
planarity, orientations and realization comparisons (§8.7). Give every nonzero bigraded group and
prove that all others vanish. For the empty diagram, the crossing-free unknot and the crossing-free
unlinks these are Tau Ceti's: `R` in `(0, 0)`
(`TauCeti.OrientedPDCode.khovanovComplexHomologyEmptyIso`), `R` in `(0, ±1)`
(`TauCeti.OrientedPDCode.khovanovComplexHomologyUnknotIso`), and in cochain degree zero the
quantum pieces of the circle tensor, of rank the coefficient of `qʲ` in `(q + q⁻¹)ᵏ`
(`TauCeti.OrientedPDCode.coeff_pow_eq_finrank_homology_khovanovComplex`).

*Needs:* §§3.4, 8.7; Tau Ceti `TauCeti.OrientedPDCode.empty`, `TauCeti.OrientedPDCode.unknot`,
`TauCeti.OrientedPDCode.unlink`, `TauCeti.BraidWord.closure`.

### 6.3 Trefoils and Hopf links

In the conventions above, the positive trefoil, the native `TauCeti.rightHandedTrefoilPDCode`, has
integral homology `ℤ` in `(0, 1)`, `(0, 3)`, `(2, 5)`, `(3, 9)` and `ℤ/2` in `(3, 7)`, and zero
elsewhere; its reduced homology is `ℤ` in `(0, 2)`, `(2, 6)`, `(3, 8)` and zero elsewhere. The
negative trefoil follows by the integral mirror comparison of §5.4, with its torsion shift. The
positive two-crossing Hopf closure, of `σ₁²`, has `ℤ` in `(0, 0)`, `(0, 2)`, `(2, 4)`, `(2, 6)` and
zero elsewhere. Verify these from the actual diagrams and matrices of §6.1, not from their Jones
polynomials alone, and include the reduced computations and the tensor and universal-coefficient
tests that distinguish rational ranks from integral torsion (§5.2).

*Needs:* §§5.2, 5.4, 5.8, 6.1; Tau Ceti `TauCeti.rightHandedTrefoilPDCode`.

**Checks.**
- The Jones polynomial cannot see the torsion: the rational ranks of the trefoil give
  `q + q³ + q⁵ − q⁹`, the same Euler characteristic as `ℤ` in `(0,1)`, `(0,3)`, `(2,5)`, `(3,9)`
  with or without the `ℤ/2`; over `𝔽₂` the torsion appears as the two extra classes of §5.2.

### 6.4 Two-strand torus links

For `m ≥ 0`, the native diagram of `T(2, m)` is `TauCeti.BraidWord.closure` of
`List.replicate m (0, 1) : BraidWord 2`, with all crossings positive; for `m < 0` it uses `|m|`
copies of `(0, −1)`. Use `TauCeti.BraidWord.crossingSign_closure`, `TauCeti.BraidWord.writhe_closure`
and the arc equations of `TauCeti.BraidWord.nextCrossing`: for positive word length, slot `1` of
crossing `k` is joined to slot `0` of crossing `k + 1`, and slot `2` of crossing `k` to slot `3` of
crossing `k + 1`, cyclically. Prove planarity from the two-strand strip, with positions increasing
rightward, strands running upward, and the closing arcs on the left in their explicit
nonintersecting nested placement; at `m = 0` the crossing-free circles are counterclockwise, as
required by `TauCeti.BraidWord.closure_nil` and its all-`true` bits. For every `m` compare this
diagram with the labelled smooth closure of §8.7, through its plane-to-spatial PL and controlled
smooth rounding adapters, keeping the orientations and the left closing arcs. When `|m|` is odd,
prove that the native closure agrees with the knot that GeometricTopology §4.2 realizes from it
(GeometricTopology compares braid closures through that realization, §4.2.3), with the
single-component spatial PL and smooth comparison; for even `m`, keep the two-component labelled
link of §8.7 rather than a knot carrier. None of these word, diagram or plane and spatial
comparisons is an identification of types. Each crossing swaps the two strand positions, so the
component count is two for even `m` and one for odd `m` (with `TauCeti.BraidWord.closure_nil`
separately at `m = 0`).

Construct the recurrence of complexes from the skein cone of §5.1 and the cancellation of §4.4, and
prove *the integral homology of `T(2, m)`*, `khovanovHomology_closure_replicate`: for `m ≥ 2`,
`Khⁱʲ(T(2, m); ℤ)` is `ℤ` in the bidegrees of `torusLinkFreeBidegrees m`, `ℤ/2` in those of
`torusLinkTorsionBidegrees m`, and zero elsewhere:

| Condition | Bidegrees |
| --- | --- |
| Free, every `m≥2` | `(0,m−2)`, `(0,m)` |
| Free, `1≤r≤⌊(m−1)/2⌋` | `(2r,m+4r−2)`, `(2r+1,m+4r+2)` |
| Torsion, `1≤r≤⌊(m−1)/2⌋` | `(2r+1,m+4r)` |
| Additional free, even `m` | `(m,3m−2)`, `(m,3m)` |

`T(2, 1)` is the unknot, and `T(2, 0)` is the two-component unlink, with free groups of ranks
`1, 2, 1` in `(0, −2)`, `(0, 0)`, `(0, 2)`. For `m < 0` use the oriented mirror comparison of §5.4
with `T(2, −m)`: free summands in `(i, j)` go to `(−i, −j)` and torsion summands in `(i, j)` to
`(−i + 1, −j)`. Prove these identifications from the recurrence and the matrices, the zero- and
one-crossing cases included. Khovanov's displayed family (*A categorification of the Jones
polynomial*, §6.2, Proposition 26, and §7.6, Proposition 35) is the left-handed one in these
conventions; its specialized integral formula is translated through this mirror comparison.

*Needs:* §§4.4, 5.1, 5.4, 6.1, 8.7; Tau Ceti `TauCeti.BraidWord.closure`,
`TauCeti.BraidWord.crossingSign_closure`, `TauCeti.BraidWord.writhe_closure`,
`TauCeti.BraidWord.nextCrossing`, `TauCeti.BraidWord.closure_nil`; GeometricTopology §§4.2
and 4.2.3 (realization of diagrams and braid closures).

**Checks.**
- `m = 2`: no `r` qualifies, and the table gives `(0, 0)`, `(0, 2)`, `(2, 4)`, `(2, 6)`, the
  positive Hopf link of §6.3. `m = 3`: `r = 1` gives `(2, 5)`, `(3, 9)` and torsion `(3, 7)`, the
  trefoil. `m = 4`: `(0, 2)`, `(0, 4)`, `(2, 6)`, `(3, 10)`, `(4, 10)`, `(4, 12)` and torsion
  `(3, 8)`. `m = 5`: `(0, 3)`, `(0, 5)`, `(2, 7)`, `(3, 11)`, `(4, 11)`, `(5, 15)` and torsion
  `(3, 9)`, `(5, 13)`. Each was recomputed from the cube of resolutions with these conventions;
  reading Khovanov's displayed list without the mirror would put the `m = 3` torsion in `(−2, −7)`.
- The graded Euler characteristic of `T(2, 4)` from the table is `q² + q⁴ + q⁶ + q¹²`, the two
  degree-`10` classes in cochain degrees `3` and `4` cancelling.

### 6.5 Adequate diagrams and the crossing number

Define adequacy by the extreme resolutions: a PD-code is `IsAdequate` when, in the all-`A` state and
in the all-`B` state, the two arcs of the smoothing at every crossing lie on two different circles
(`TauCeti.PDCode.circlesAt` has two elements). Equivalently every cube edge out of the all-`A`
vertex is a merge and every cube edge into the all-`B` vertex is a split. Prove that for an
adequate planar diagram `Kh(D; ℤ)` is nonzero in the two extreme cochain degrees `−n₋` and `n₊`:
in degree `−n₋` the labelling of the all-`A` circles by `X` is a cycle that is not a boundary, and in
degree `n₊` the labelling of the all-`B` circles by `1` is not in the image of any split (Khovanov,
*A categorification of the Jones polynomial*, §7.7, Proposition 36, with Definitions 3–5 after
Lickorish–Thistlethwaite and Thistlethwaite). The homology of every link is nonzero, by the value
at `q = 1` of §5.6, the empty diagram included.

Define the integral cochain support length of `Kh(D; ℤ)` as its largest supported cochain degree
minus its smallest, using finiteness (§3.4) and nonvanishing. Construct the presentation-minimum
adapter: using the generic-presentation theorem of §8.6, define the crossing number of a smooth
link as the least crossing count among the planar oriented PD-codes realizing it, and prove its
minimum, isotopy and diagram-comparison laws, keeping the actual realization witnesses and
comparing against the native carriers. Deduce that the support length is at most the crossing
number, and prove *crossing minimality of adequate diagrams*,
`le_of_isAdequate_of_reidemeisterEquiv`: if `D` is an adequate planar oriented PD-code with `n`
crossings, every oriented PD-code Reidemeister equivalent to `D` has at least `n` crossings, so an
adequate `n`-crossing diagram realizes crossing number `n` (Khovanov, *loc. cit.*, Proposition 37
and Corollary 13, after Thistlethwaite).

*Needs:* §§3.4, 4.5, 5.6, 8.6; Tau Ceti `TauCeti.PDCode.circlesAt`,
`TauCeti.OrientedPDCode.ReidemeisterEquiv`.

**Checks.**
- The standard trefoil is adequate: its all-`A` state has two circles and each crossing meets both,
  and its all-`B` state has three circles, each crossing meeting two of them; its homology is
  nonzero in cochain degrees `0` and `3`. The one-crossing kink is not adequate: in one extreme
  state its crossing meets a single circle, and correspondingly its homology vanishes in one of the
  cochain degrees `−n₋`, `n₊`.
- A definition of adequacy by the all-`A` state alone would accept the positive kink, whose
  homology vanishes in cochain degree `n₊ = 1`, so it would not give a lower bound on the crossing
  number.

### Examples

- The table of §6.4 for `m = 2, …, 7`, and the reduced trefoil of §6.3.
- The figure-eight knot, the closure of `σ₁σ₂⁻¹σ₁σ₂⁻¹` on three strands, an adequate four-crossing
  diagram: its integral homology is supported in cochain degrees `−2` to `2`, with `ℤ/2` in
  `(−1, −3)` and `(2, 3)`.

### Dependencies

Layers 3–5 and 8. Tau Ceti: braid words and their closures with crossing signs, writhe and arc
equations, the trefoil code, the empty, unknot and unlink codes and their homology, and the circles
through a crossing. GeometricTopology §§4.2 and 4.2.3 (realization of diagrams and braid closures). Mathlib: integer
matrices
and finitely generated abelian groups.

## Layer 7: movies and projective cobordism maps

### 7.1 Collared link cobordisms

Construct the carrier of link cobordisms: for smooth links `L₀`, `L₁` (finite families
`TauCeti.SmoothLinkEmbedding` with component labels and parametrizations), a *link cobordism* is a
compact smooth oriented surface embedded in `S³ × [0, 1]` (and, through §7.3, in `ℝ³ × [0, 1]`),
meeting the two ends exactly in `L₀ × {0}` and `L₁ × {1}`, with boundary parametrizations by the
source and target link families and product collars matching those parametrizations. The boundary
orientation is outward-normal-first, `∂Σ = −L₀ ⊔ L₁` (Conventions). Define equivalence by
boundary-fixed ambient isotopies preserving the prescribed collar germs. Construct identities,
collar-compatible composition and its comparison isotopies, keeping simultaneous component labels
and the incoming and outgoing boundary orientation signs; prove the category laws by collar
rescaling and that composition is well defined on the isotopy quotient. Construct the forgetful
comparison with plain embedded surfaces using GeometricTopology's Layer 1 gluing, and these
decorations and relative equivalences against that plain carrier. The boundary markings here are
the component-labelled boundary parametrizations; the based-link point of Layer 5 is separate
data.

The objects of the movie category of §7.4 are the realized plane diagrams of §8.1, carrying the
corresponding native labelled smooth links and their orientation-compatible parametrizations, so
their prescribed endpoint projections are generic; the generic representatives and comparison
isotopies of §8.6 compare them with arbitrary smooth links, keeping the chosen generic endpoints.

*Needs:* §§8.1, 8.6; GeometricTopology Layer 1 (collars and gluing along the boundary);
DifferentialGeometry Layer 2 (orientations) and Layer 5 (boundary orientation); Tau Ceti
`TauCeti.SmoothEmbedding`, `TauCeti.SmoothLinkEmbedding`.

**Checks.**
- The product cobordism `L × [0, 1]` with its product collars is the identity, and composing it
  with any `Σ` and rescaling the collars recovers `Σ` up to the equivalence; with
  `∂Σ = L₀ ⊔ L₁` instead of `−L₀ ⊔ L₁`, the product cylinder of an oriented knot would not be an
  oriented cobordism from the knot to itself.

### 7.2 Collars, cylindrical ends and ambient extension

For neat embedded surfaces construct collar straightening relative to the marked boundary: from the
actual collar coordinates and the transverse normal-coordinate derivative, build a
boundary-preserving local displacement and its smooth parameter-family extension, proving the
required inverse-function and cutoff estimates in those coordinates. Construct the boundary and
collar extension data used by the ambient extension of §8.5, including the matching jets and the
open collar coordinate formulas.

For a product-collared surface in `ℝ³ × [0, 1]`, attach constant cylindrical ends at both boundary
links, giving a proper smooth boundaryless embedding in `ℝ³ × ℝ` with closed image, with its
compact-family version. Extend fixed-collar embedding isotopies constantly over the ends, so that
the velocity vanishes on open neighbourhoods of the physical heights `0` and `1` and on the tails.
Apply the closed-submanifold tube and slice construction to the extended surface and the velocity
extension of §8.5 to its compact moving core; choose its ambient compact support away from the
fixed hyperplane neighbourhoods and extend the field by zero there. Apply the finite-dimensional
flow results of DifferentialGeometry §§3.2, 3.3 and 3.5 in boundaryless `ℝ⁴`, prove finite-band
confinement and construct the smooth inverse evolution. Uniqueness fixes the open hyperplane
neighbourhoods and shows that forward and inverse evolution preserve the closed slab; restrict the
jointly smooth total maps to the product boundary model of the slab to obtain an actual
`TauCeti.Diffeotopy` (its generic spatial model with corners allows this model), and prove that it
realizes the original isotopy and fixes the marked collars. For isotopies between product-collared
surfaces, straighten relative to their endpoint collar germs and fixed marked boundary; prove the
relative-family version, and compare boundary-fixed isotopy with the fixed-collar equivalence,
keeping the choices and their comparison isotopies.

*Needs:* §§7.1, 8.5; DifferentialGeometry §§3.2, 3.3, 3.5; GeometricTopology Layer 1 (tubular
neighbourhoods); Tau Ceti `TauCeti.Diffeotopy`.

### 7.3 The affine chart

Construct the category of compact surfaces in `ℝ³ × [0, 1]` by affine-chart restriction of §§7.1–7.2,
supplying the point at infinity, the chart and the avoidance of its cylinder, and prove that
pullback preserves embeddings, boundary identifications, collars, isotopies, identities and gluing,
keeping these chart data under composition. Identify the round `S³` with
`{(v, w) ∈ ℝ³ × ℝ : ‖v‖² + w² = 1}` in the standard coordinate order and fix the point at infinity
`p = (0, 0, 0, 1)`. Use the chart `φ(v, w) = v/(1 − w)`, with inverse
`y ↦ (2y/(1 + ‖y‖²), (‖y‖² − 1)/(1 + ‖y‖²))`; prove that the denominators are nonzero on the specified
domains and construct the restricted smooth diffeomorphism. Compare it with Mathlib's
`stereographic'` through its actual orthonormal-coordinate identification: the comparison is `1/2`
times an orthogonal map `U` (Mathlib's `stereographic` has numerator `2`); construct `U` from the
chosen bases and track its determinant, whose sign the positive scale does not fix. Prove the
restricted smoothness and inverse laws.

Orient `S³` outward-normal-first in standard oriented `ℝ⁴`, and `ℝ³` by its standard basis. Prove
that the chart preserves orientation: at the south pole the tangent basis `(e₀, e₁, e₂)` is
positive and the derivative is `1/2` times the identity; extend the sign over the connected domain.
Transport link and surface orientations through this chart. Fix this point and chart for the
category. All surface traces avoid the infinity cylinder, and the chosen ambient comparison
isotopies fix a neighbourhood of it, so that their restrictions are actual affine ambient
diffeotopies. Using the relative velocity extension of §8.5, prove that a compact surface-isotopy
trace avoiding the cylinder admits such a witness, with the boundary and collar conditions.

*Needs:* §§7.1–7.2, 8.5; Mathlib `stereographic'`, `EuclideanSpace`, `Metric.sphere`;
DifferentialGeometry Layer 2.

**Checks.**
- The inverse lands on the sphere: `‖2y‖² + (‖y‖² − 1)² = (1 + ‖y‖²)²`, and
  `φ` of it is `(2y/(1 + ‖y‖²)) / (2/(1 + ‖y‖²)) = y`. At the south pole `(0, 0, 0, −1)` the chart is
  `v ↦ v/2` to first order, so its derivative is `½·id`. The chart `v/(1 + w)` would instead send
  the south pole to infinity.

### 7.4 Local events and movies

A *local event* is a first, second or third Reidemeister move, a birth, a death or a saddle in a
specified changing disc. Two local events are *distant* when their actual changing discs are
disjoint, each modification is the identity outside its own disc, and the other disc lies in that
unchanged exterior before and after the event; the common exterior and boundary identifications
are kept. Construct finite movies on the plane-diagram adapter of §8.1, from actual planar
isotopies and these local events, with explicit source and target diagrams, orientations, boundary
markings and composition. Birth and death events specify the actual complementary region and local
disc, and the crossing-free bits of the plane adapter have the counterclockwise meaning of the
conventions; use the placement-sensitive translation of native circle constructors of §8.3 and the
move dictionary of §4.3, keeping the unaffected and changed component incidences. Construct the
realization of movies as link cobordisms (§7.1).

*Needs:* §§4.3, 7.1, 8.1–8.3.

### 7.5 The movie presentation theorem

Prove presentation and completeness for the decorated category of §7.1: boundary-fixed ambient
isotopic cobordisms are represented by movies related by sequences of the fifteen Carter–Saito
movie moves, interchanges of distant local events, and the following planar-isotopy relations:
identity and concatenation, stationary reparametrization, and homotopy relative to the endpoints of
planar-isotopy paths through generic diagrams, every path and homotopy stationary on the specified
endpoint collar neighbourhoods; conjugation of a local event by a planar isotopy that transports
its changing disc; and shrinking or enlarging that disc through an annulus carrying only the
unchanged identity strands and no new components, with the same supported event and boundary
identification (Carter–Saito, *Reidemeister moves for surface isotopies and their interpretation as
moves to movies*; Jacobsson, *An invariant of link cobordisms from Khovanov homology*, §4.2, the
theorem of Carter–Saito as reformulated there). Construct the boundary-relative isotopies of traces
witnessing these relations and prove their compatibility with collars, markings and composition.
A general loop of planar isotopies is not identified with the constant path without the stated
homotopy or another proved trace relation.

Use Jacobsson's numbering (*loc. cit.*, §3.2), with the time reversals, the mirror and crossing
variants, the additional strand-position variants of moves 6 and 15, the reductions for move 7 and
compatible orientations. Define each relation as a local schema in a specified changing disc, over
every admissible exterior with that disc empty of further components, given by a pair of explicit
finite words in the elementary movie generators with matching source and target plane diagrams,
collars and boundary identifications. Export the numbered classification into fifteen types and all
variant transports. Construct the dictionary between Jacobsson's and Bar-Natan's numbering and
variants, including Jacobsson's move 7 against Bar-Natan's MM10 for the quadruple-point move
(Bar-Natan, *Khovanov's homology for tangles and cobordisms*, §8.3), and the separate dictionary
with the word presentation of Carter–Rieger–Saito, with its precise generator and relation
correspondences. The surface-projection moves are Roseman's, with their height-sensitive movie
refinements here.

Build this relative movie theorem from local generic projection and transversality and
compactness with fixed collars. Apply the common relative finite-jet, incidence, interpolation,
Sard and Baire floor of §8.4 to the surface and isotopy families here; construct all movie-specific
bad strata and verify the distinct-point, coincident-point and fixed-collar hypotheses. Prove
compact-set openness of the embedding and collar conditions, and use the relative extension of
§8.5 for the small perturbations, avoiding the fixed infinity cylinder. Prove the codimension
estimates, the finite determinacy and the coordinate reductions for every movie normal form, and
derive a finite event subdivision from those forms and compactness; list every oriented and
time-reversed movie relation with its boundary identification. The two-parameter completeness
proof uses the one-parameter comparison of §8.6.

*Needs:* §§7.1–7.4, 8.4–8.6.

### 7.6 The movie Euler count

Define the movie Euler count as `#births − #saddles + #deaths`. Prove its invariance under every
movie relation, distant interchange and actual planar isotopy, and its additivity under
concatenation and disjoint union. Using the presentation and completeness of §7.5, descend it to
`χ(Σ)` on the marked surface category, independently of the Khovanov maps. Construct the finite
relative cell model given by the 0-, 1- and 2-handles of a movie, starting from one 0-cell and one
1-cell for each incoming circle, and prove that each local movie handle attaches the cell of its
index with the actual attaching map, using the movie normal forms and GeometricTopology's Layer 1
gluing. Prove its comparison with the surface and the incoming boundary, and identify the count
with the alternating sum of the rational singular homology ranks of the compact surface; each
boundary link has Euler characteristic `0`. Use Tau Ceti's cellular comparison
`TauCeti.cellularSingularHomologyIso` and finite-CW Euler–Poincaré theorem
`TauCeti.eulerChar_eq_finsum_finrank_singularHomology`, as developed in AlgebraicTopology §§4.3
and 7.1, constructing the movie-handle comparison here and obtaining `χ(Σ)` and its handle-count
formula.

*Needs:* §§7.4–7.5; AlgebraicTopology §§4.3, 7.1; GeometricTopology Layer 1; Tau Ceti
`TauCeti.cellularSingularHomologyIso`, `TauCeti.eulerChar_eq_finsum_finrank_singularHomology`.

**Checks.**
- Birth then death: `1 − 0 + 1 = 2`, the sphere. One saddle from an unknot to a two-component
  unlink: `0 − 1 + 0 = −1`, the pair of pants. Birth, a splitting saddle, a merging saddle and a
  death: `1 − 2 + 1 = 0`, the torus. Counting saddles positively would give the torus `4`.

### 7.7 Maps of movies

Births and deaths act by the unit and counit, saddles by the maps of §2.4 on resolutions, and
Reidemeister events by the local formal chain maps of §4.1 inserted in the fixed planar-insertion
slot order; these inserted local maps are the movie generators. Construct their compatibility with
the native comparison-word maps of §4.5 through the stated transports and homotopies; prove that
they are chain maps and compose under concatenation of movies. Construct the homogeneous map of a
planar isotopy from its induced crossing, circle and boundary correspondences, with identity and
composition laws, and prove its independence of the path for a fixed correspondence. Prove
naturality of elementary events under these planar-isotopy and relabelling isomorphisms, with
crossing-order signs.

Prove that the maps of every pair of distant local events, Reidemeister against Reidemeister and
Reidemeister against Morse events included, commute exactly after the canonical raw
crossing-reordering identifications and associators in the fixed slot order. Canonical reindexing
here means the subset-permutation cube transport of §3.1, not an unqualified replacement by the
normalized cochain braiding; a change of slot order keeps the normalization constants `(-1)^(a b)`
of §§3.6 and 5.3. Transport this interchange law and naturality through totalization, arbitrary
exteriors and closed evaluation. All local event maps have cochain degree zero, so their disjoint
interchange in the fixed order has no further Koszul sign. Prove that the maps descend through
every planar-isotopy relation of §7.5, by path homotopy, composition, disc transport and support
restriction, keeping the stronger independence for a fixed correspondence as its own theorem. For a
cobordism `Σ` the induced map has bidegree `(0, χ(Σ))`.

For each of the fifteen movie-relation schemata and every required oriented, mirrored,
time-reversed and strand-placement variant, construct its two finite local formal chain maps
`F_L`, `F_R`, an integral finite formal-matrix homotopy `H` and one sign `ε ∈ {−1, 1}` with
`F_L − εF_R = dH + Hd`. Both maps have the same quantum degree `δ`, and `H` has cochain degree `−1`
and quantum degree `δ`; equivalently these are quantum-degree-zero maps and homotopies into the
target shifted by `⟨−δ⟩`. Verify the identities from the actual local templates and the
two-dimensional formal relations of §2.5, with coefficient and matrix certificates for every
schema, the reversible multi-crossing clips included, and construct the explicit homotopy
witnesses from the local templates. Prove each identity before gluing an exterior, then transport
it under every admissible planar insertion, an arbitrary exterior complex included, with the
totalization homotopy sign `(-1)^(r₁+⋯+rᵢ₋₁)` in the replaced factor, where each preceding `rⱼ` is
its normalized cochain degree as in §3.6. Keep one common integral sign for the entire local
complex and every exterior closure, and extend the integral identity to every commutative
coefficient ring.

*Needs:* §§2.4–2.7, 3.1, 3.6–3.7, 4.1, 4.5, 5.3, 7.4–7.6.

### 7.8 The projective functor

Only after the homogeneous relation homotopies of §7.7 are proved, forget the quantum grading to
obtain the native underlying homotopy-category functor and its quotient by a common sign; the
induced bigraded homology maps keep their proved degree. The formal `δ` is computed from the
combinatorial surface grading of §2.7, and its comparison with the movie and handle Euler count of
the actual surface is §7.6. The final target is Mathlib's homotopy category of underlying
`ModuleCat R` cochain complexes, keeping the finite quantum grading as object data through the
induced-category construction, with morphisms the underlying cochain homotopy classes and the
homogeneous local relation witnesses kept in its construction. Form the quotient identifying a
morphism with its negative, prove that composition descends, and construct the quotient category.
Obtain the boundary-fixed functor from link cobordisms to this projective homotopy category, and
its bigraded homology maps modulo one global sign (Bar-Natan, *Khovanov's homology for tangles and
cobordisms*, §8.1, Theorem 4, for the chain-level statement; Jacobsson, *An invariant of link
cobordisms from Khovanov homology*, §4.2, Theorem 2, for the homology statement and its
conventions). In characteristic two the sign ambiguity disappears.

*Needs:* §§7.5–7.7; Mathlib `HomotopyCategory`, `CategoryTheory.InducedCategory`,
`CategoryTheory.Quotient`.

### 7.9 Boundary motions and closed surfaces

The isotopies in §7.8 fix the boundary link data; motions of boundary links act through their
specified comparison maps of §4.6. The geometric domain keeps the affine chart, equivalently the
point at infinity of the `S³` presentation, and its collar throughout. Construct the `ℝ³`
cobordism functor on this specified affine domain. Prove that every closed embedded surface with
`χ(Σ) ≠ 0` induces the zero map, by its quantum degree and the complex of the empty link (§3.4).
Evaluate the explicitly standard unknotted torus, through its Frobenius handle movie, as `±2`,
keeping that specified standard embedding in the evaluation theorem. Prove compatibility with
disjoint union, and keep these ordinary-theory evaluations separate from any polynomial-coefficient
deformation.

*Needs:* §§2.1, 3.4, 7.6–7.8.

**Checks.**
- The standard torus movie (birth, split, merge, death) is `ε ∘ m ∘ Δ ∘ η = 2` on the empty link's
  `R`, of quantum degree `χ = 0`; a sphere (birth, death) has `χ = 2` and is the map `R → R` of
  quantum degree `2`, necessarily zero since the empty link's homology lives in quantum degree `0`,
  and indeed `ε(1) = 0`.

### Examples

- The cylinder over the unknot (the identity), the saddle from the unknot to the two-component
  unlink (`χ = −1`, the comultiplication on homology, of degree `−1`), the sphere (`0`) and the
  standard torus (`±2`).

### Dependencies

Layers 2–5 and 8. GeometricTopology Layer 1; DifferentialGeometry Layer 2, §§3.2, 3.3, 3.5 and
Layer 5; AlgebraicTopology §§4.3 and 7.1. Tau Ceti: smooth embeddings and links, diffeotopies, the
cellular comparison and the Euler characteristic of finite CW complexes. Mathlib: the stereographic
projection, homotopy categories, induced and quotient categories.

## Downstream consumers

- [Foams](../Foams/README.md) uses the finite planar calculus of §§1.6 and 1.8, the formal surface
  category modulo `S`, `T` and `4Tu` of §§2.5–2.8, the closed evaluation of §3.7, and the plane
  realizations, complement and boundary-orientation dictionaries, controlled smoothing and relative
  extension of §§8.1, 8.2 and 8.5.
- [DiagrammaticCoherence](../DiagrammaticCoherence/README.md) uses the relative general-position
  floor, the relative ambient extension and the labelled smooth projection and Reidemeister
  comparison of §§8.4–8.6, and the polygonal–smooth bridge of §8.1.
- [SpectralSequencesAndConvergencePartII](../SpectralSequencesAndConvergencePartII/README.md) uses
  the universal coefficient and Künneth sequences for bounded finite free `ℤ`-complexes and the
  comparison of `CategoryTheory.Tor'` with `CategoryTheory.Tor` of §§5.2–5.3.
- [DerivedModuleAlgebra](../DerivedModuleAlgebra/README.md) compares its derived tensor product
  with the bounded resolution model over the dual numbers of §5.11.

## Scope and ownership

**This roadmap owns** the ordinary integral Khovanov theory of classical links built on the Tau
Ceti floor listed below: move words, component bijections and based moves (§§1.3–1.4); the
disc/band models, PL disc models, partial resolution and local planar calculus (§§1.6–1.8);
insertion and deletion of circle factors and the comparison with iterated graded tensors (§2.3);
the formal surface category with its Euler characteristic, relations, grading and additive
envelope (§§2.5–2.8); face restriction of cubes (§3.1); the total complex, the enhanced-state model
and the graded tensor structure (§3.3); finiteness of Khovanov homology (§3.4); the complexes of
diagrams with boundary and their closed evaluation (§§3.6–3.7); all of Layer 8; Reidemeister
invariance for diagrams and smooth links (Layer 4); the skein sequence, the complex-level
universal coefficient, Hom/Ext and Künneth theorems for bounded finite free integral complexes
with their `Tor'`/`Tor` comparisons, block symmetry, mirror duality, orientation reversal and the
diagram linking count, the value at `q = 1`, graded `W`-modules, the action at a mark, the reduced
complex and its invariance, based connected sum and the connected-sum isomorphism with its derived
tensor comparison (Layer 5); certificates, the computations of small links and of `T(2, m)`, and the
crossing-number application (Layer 6); and the carrier of collared link cobordisms in `S³ × [0, 1]`
and `ℝ³ × [0, 1]`, the movie presentation, the movie Euler count and the projective cobordism
functor (Layer 7).

**Already in the library and used by name.** Tau Ceti has, and this roadmap consumes without
planning again: oriented PD-codes, planarity through the Euler characteristic and its chord-diagram
criterion, Reidemeister moves and equivalence with the planarity of every generator, the Jones
polynomial through its state weights, components and crossing-free labellings, resolution circles
with their count and transports, marks, the adjacent-state analysis and the merge-or-split theorem
for planar codes, vertex resolution, Seifert states and the parity of quantum degrees (§§1.1–1.2,
1.5, 1.7, 5.6); the Khovanov coalgebra on the dual numbers with its Frobenius structure, quantum
grading, graded maps, circle tensors with their basis, merge, split, base change and disjoint union,
and the merge and split maps on resolutions with their face relations (§§2.1–2.4); the signed cube
complex with its mapping cone, reordering and dual (§3.1); the cube of resolutions, the bracket, the
normalized complex with its support, base change and mirror comparison, Khovanov homology, the
enhanced state sum, the graded Euler characteristic and Khovanov's theorem comparing it with the
Jones polynomial, and the homology of the empty diagram, the unknot and the crossing-free unlinks
(§§3.2, 3.4–3.5, 5.4, 6.2); the Koszul braiding of cochain complexes, the post-composition action on
Hom complexes, the Hom/Ext universal coefficient sequence for chain complexes and the periodic
projective resolution over the dual numbers (§§3.3, 5.2, 5.9); smooth links and their ambient
isotopy, diffeotopies, reparametrization of smooth embeddings, the Morse–Sard theorem, filled hulls
and braid closures (Layer 8); and the cellular comparison and Euler–Poincaré theorem of finite CW
complexes (§7.6). The exact declarations are listed under the supplier contracts.

**Owned elsewhere.**

- [GeometricTopology](../GeometricTopology/README.md) owns the geometric link and diagram carriers
  and presentation definitions, Reidemeister's theorem (§4.2), braid closures (§4.2.3), the other
  Jones algorithms with their agreements and the geometric invariance of the Jones polynomial (Layer
  4), and collars, tubes and gluing (Layer 1). Layer 8 here is the corresponding finite-labelled,
  relative extension of its geometric-to-diagram comparison: its inputs from GeometricTopology are
  the carrier and presentation definitions, and the additional labelled, relative and actual-plane
  comparisons are built here. GeometricTopology §4.8.1 develops adequate diagrams on the Kauffman
  bracket and proves crossing minimality of adequate knot diagrams through coloured Jones
  polynomials; §6.5 here differs in proving it for adequate diagrams of links of any number of
  components through the support of integral Khovanov homology, with adequacy stated through the
  extreme resolutions, which is GeometricTopology's state-graph condition (a crossing meeting a
  single circle of an extreme state is a loop of its state graph). GeometricTopology Layer 6 states
  concordance; the general collared link cobordisms are §7.1's.
- [DifferentialGeometry](../DifferentialGeometry/README.md) owns manifold, pullback and product
  orientations (Layer 2), boundary orientation (Layer 5) and flows (§§3.2, 3.3, 3.5); the link,
  surface and chart sign comparisons are built here.
- [ConformalMapping](../../Completed/ConformalMapping/README.md) owns Jordan separation and the
  filled-hull topology (Layer 5); the finite polygonal and native-face adapters are §8.2's.
- [DGAInfinity](../DGAInfinity/README.md) owns DG algebras and modules (Layer 1) and derived DG
  modules (Layer 5), with its generic cochain infrastructure where it extends the native library.
  §5.11 builds the ordinary bounded-free derived-tensor comparison over every commutative base and
  compares it with DGAInfinity's DG-module theory under the hypotheses supplied there, without a
  strictification of `A∞` structures valid only over fields.
- [AlgebraicTopology](../AlgebraicTopology/README.md) develops the cellular comparison and the Euler
  characteristic of finite CW complexes (§§4.3, 7.1); the movie-handle cell model is §7.6's.
- [ZigzagPreprojective](../ZigzagPreprojective/README.md) owns the Khovanov–Seidel braid actions
  (its Layer 8).

## Exact supplier contracts

### From Mathlib

- *Algebra.* `DualNumber`, `TrivSqZeroExt`, `Coalgebra`, `Coalgebra.IsFrobenius` (the two
  Frobenius identities `Δ ∘ m = (m ⊗ id) ∘ α ∘ (id ⊗ Δ)` and its mirror), `PiTensorProduct`,
  `PiTensorProduct.tmulEquiv`, `TensorProduct`, `Module.Free`, `Module.Finite`, `Module.Dual`,
  `IsNoetherianRing`, `HasRankNullity`, `LaurentPolynomial`, `LaurentPolynomial.eval₂`, `ZMod`,
  `ULift.ringEquiv`, `Matrix`, `Relation.EqvGen`.
- *Categories and complexes.* `ModuleCat`, `ModuleCat.uliftFunctor`, `CategoryTheory.GradedObject`
  with `CategoryTheory.GradedObject.total`, `CategoryTheory.GradedObject.Monoidal.tensorObj`,
  `CategoryTheory.GradedObject.Monoidal.braiding` and `CategoryTheory.GradedObject.HasTensor`;
  `CochainComplex`, `ComplexShape.up`, `HomologicalComplex.homology`,
  `HomologicalComplex.homologyEulerChar`, `HomologicalComplex₂.total`, `Homotopy`, `HomotopyEquiv`
  (two chain maps with homotopies from their composites to the identities), `HomotopyEquiv.toHomologyIso`,
  `CochainComplex.mappingCone`, `HomotopyCategory`, `CochainComplex.linearHomComplex`,
  `CategoryTheory.Tor`, `CategoryTheory.Tor'`, `CategoryTheory.Abelian.Ext`,
  `CategoryTheory.ProjectiveResolution`, `HasDerivedCategory.standard` (with its universe and
  smallness hypotheses), `CategoryTheory.Mat_`, `CategoryTheory.Mat_.embedding`,
  `CategoryTheory.Mat_.lift`, `CategoryTheory.InducedCategory`, `CategoryTheory.Quotient`.
- *Analysis and topology.* `EuclideanSpace`, `Metric.sphere`, `stereographic'`, `ContDiffBump`,
  `dense_iInter_of_isOpen` (Baire: a countable intersection of dense open sets is dense).

### From Tau Ceti

- *PD-codes.* `TauCeti.PDCode`, `TauCeti.OrientedPDCode`, `TauCeti.PDCode.IsPlanar` (Euler
  characteristic of the ribbon graph), `TauCeti.PDCode.face`, `TauCeti.PDCode.toPermutationTriple`,
  `TauCeti.PDCode.nonempty_spanningTreeContraction`,
  `TauCeti.PDCode.isPlanar_iff_isNoncrossingMatching`, `TauCeti.PDCode.isPlanar_mirror`,
  `TauCeti.PDCode.isPlanar_disjointUnion`, `TauCeti.PDCode.smoothingTurn`,
  `TauCeti.PDCode.smoothingChoice`, `TauCeti.PDCode.statePerm`, `TauCeti.PDCode.stateLoopCount`,
  `TauCeti.OrientedPDCode.crossingSign`, `TauCeti.OrientedPDCode.mirror`,
  `TauCeti.OrientedPDCode.reverse`, `TauCeti.OrientedPDCode.disjointUnion`,
  `TauCeti.OrientedPDCode.reconnect`, `TauCeti.OrientedPDCode.adjoinCircle`,
  `TauCeti.OrientedPDCode.unlink`, `TauCeti.OrientedPDCode.empty`, `TauCeti.OrientedPDCode.unknot`,
  `TauCeti.OrientedPDCode.jonesPolynomial`, `TauCeti.rightHandedTrefoilPDCode`.
- *Reidemeister moves.* `TauCeti.OrientedPDCode.IsReidemeisterMove`,
  `TauCeti.OrientedPDCode.ReidemeisterEquiv`, the constructors
  `TauCeti.OrientedPDCode.reidemeisterOne`, `TauCeti.OrientedPDCode.adjoinKink`,
  `TauCeti.OrientedPDCode.insertClasp`, `TauCeti.OrientedPDCode.insertCircleClasp`,
  `TauCeti.OrientedPDCode.adjoinTwoCircleClasp`, `TauCeti.OrientedPDCode.reidemeisterThree`,
  `TauCeti.PDCode.HasReidemeisterThreeTriangle`, and the planarity lemmas
  `TauCeti.PDCode.isPlanar_relabel`, `TauCeti.PDCode.isPlanar_rotateCrossing`,
  `TauCeti.PDCode.isPlanar_reidemeisterOne`, `TauCeti.PDCode.isPlanar_adjoinKink_iff`,
  `TauCeti.PDCode.isPlanar_insertClasp_iff_face_eq_or_not_mem_orbit`,
  `TauCeti.PDCode.isPlanar_insertCircleClasp_iff`, `TauCeti.PDCode.isPlanar_adjoinTwoCircleClasp`,
  `TauCeti.PDCode.isPlanar_reidemeisterThree_iff`, `TauCeti.PDCode.faceCount_insertClasp_of_face_ne`,
  `TauCeti.PDCode.not_isPlanar_insertClasp_of_face_ne`.
- *Circles, components and marks.* `TauCeti.PDCode.CircleStep`, `TauCeti.PDCode.CrossingCircle`,
  `TauCeti.PDCode.ResolvedCircle`, `TauCeti.PDCode.crossingCircleEquiv`,
  `TauCeti.PDCode.isPerfectMatching_stateCycleReversal`, `TauCeti.PDCode.two_mul_card_crossingCircle`,
  `TauCeti.PDCode.card_resolvedCircle`, `TauCeti.PDCode.one_le_card_resolvedCircle`,
  `TauCeti.PDCode.SmoothingEquiv` with `.refl`, `.symm`, `.trans`, `.resolvedCircleCongr`,
  `.relabel`, `.rotateCrossing`, `.mirror`, `.crossinglessPerm`, `TauCeti.PDCode.ResolutionEquiv`,
  `TauCeti.PDCode.disjointUnionResolvedCircleEquiv`, `TauCeti.PDCode.circlesAt`,
  `TauCeti.PDCode.card_circlesAt_eq_two_iff`, `TauCeti.PDCode.unchangedCircleEquiv`,
  `TauCeti.PDCode.saddleResolvedCircleMap`,
  `TauCeti.PDCode.card_circlesAt_add_card_circlesAt_le_three`,
  `TauCeti.PDCode.IsPlanar.card_circlesAt_eq_two_or_card_circlesAt_eq_two`,
  `TauCeti.PDCode.IsPlanar.card_false_add_stateLoopCount_mod_two_eq`,
  `TauCeti.PDCode.resolveCrossing`, `TauCeti.PDCode.detachedCircleCount`,
  `TauCeti.PDCode.IsPlanar.resolveCrossing`, `TauCeti.PDCode.resolveCrossingResolvedCircleEquiv`,
  `TauCeti.OrientedPDCode.Component`, `TauCeti.OrientedPDCode.card_component`,
  `TauCeti.OrientedPDCode.componentPermOutgoing`, `TauCeti.OrientedPDCode.componentEquiv`,
  `TauCeti.OrientedPDCode.relabelComponentEquiv`, `TauCeti.OrientedPDCode.mirrorComponentEquiv`,
  `TauCeti.OrientedPDCode.CrossinglessLabeling`, `TauCeti.PDCode.Mark`, `TauCeti.PDCode.Mark.onArc`,
  `TauCeti.PDCode.Mark.onCircle`, `TauCeti.PDCode.Mark.resolvedCircle`,
  `TauCeti.PDCode.SmoothingEquiv.markCongr`, `TauCeti.OrientedPDCode.seifertState`,
  `TauCeti.OrientedPDCode.seifertState_eq_true_iff`,
  `TauCeti.OrientedPDCode.even_seifertCircleCount_sub_crossingCount_add_componentCount`.
- *The Frobenius algebra and circle tensors.* `TauCeti.Khovanov.coalgebra` (a scoped instance in
  `TauCeti.Khovanov`), `TauCeti.Khovanov.isCocomm`, `TauCeti.Khovanov.isFrobenius`,
  `TauCeti.Khovanov.mul_compr₂_counit`, `TauCeti.Khovanov.counit_basis_mul_basis_rev`,
  `DualNumber.khovanov_counit_eps_mul_smul_one_add_counit_smul_eps`,
  `TauCeti.Khovanov.baseChangeCoalgEquiv`, `TauCeti.Khovanov.quantumGrading`,
  `TauCeti.Khovanov.quantumGradedObject`, `TauCeti.Khovanov.quantumMul`,
  `TauCeti.Khovanov.quantumComul`, `TauCeti.Khovanov.quantumUnit`,
  `TauCeti.Khovanov.quantumCounit`, `TauCeti.Khovanov.instGradedAlgebraShiftOne`,
  `TauCeti.Khovanov.CircleTensor`, `TauCeti.Khovanov.circleBasis`,
  `TauCeti.Khovanov.circleQuantumGrading`, `TauCeti.Khovanov.labelingQuantumDegree`,
  `PiTensorProduct.fiberwiseMul`, `TauCeti.Khovanov.fiberwiseSplit`,
  `TauCeti.Khovanov.circleBaseChange`, `TauCeti.PDCode.EnhancedState`,
  `TauCeti.PDCode.resolutionMergeMap`, `TauCeti.PDCode.resolutionSplitMap`,
  `TauCeti.PDCode.resolutionEdgeMap`, `TauCeti.PDCode.resolutionEdgeMap_comp_resolutionEdgeMap_comm`.
- *Cubes and the Khovanov complex.* `CategoryTheory.Functor.cubeComplex`,
  `CategoryTheory.NatTrans.cubeComplexMap`, `CategoryTheory.cubeComplexFunctor`,
  `CategoryTheory.Functor.cubeComplexXZeroIso`, `CategoryTheory.Functor.cubeComplexMappingConeIso`,
  `CategoryTheory.Functor.cubeComplexReindexIso` with `CategoryTheory.Functor.cubeComplexReindexIso_refl`
  and `CategoryTheory.Functor.cubeComplexReindexIso_trans`, `CategoryTheory.Functor.dualCube`,
  `TauCeti.PDCode.cubeState`, `TauCeti.PDCode.resolutionCube`, `TauCeti.PDCode.khovanovBracket`,
  `TauCeti.PDCode.resolutionCubeBaseChangeIso`, `TauCeti.PDCode.finite_quantumSupport_khovanovBracket`,
  `TauCeti.PDCode.mirrorKhovanovBracketIso`, `TauCeti.OrientedPDCode.stateCochainDegree`,
  `TauCeti.OrientedPDCode.enhancedQuantumDegree`, `TauCeti.OrientedPDCode.khovanovComplex` (the
  normalized complex, an object of `GradedObject ℤ (CochainComplex (ModuleCat R) ℤ)` for a planar
  code), `TauCeti.OrientedPDCode.khovanovComplexXIso`, `TauCeti.OrientedPDCode.ι_khovanovComplex_d`,
  `TauCeti.OrientedPDCode.khovanovComplexShiftIso`,
  `TauCeti.OrientedPDCode.khovanovComplex_isStrictlyGE`,
  `TauCeti.OrientedPDCode.khovanovComplex_isStrictlyLE`, `TauCeti.OrientedPDCode.khovanovHomology`,
  `TauCeti.OrientedPDCode.khovanovComplexHomologyEmptyIso`,
  `TauCeti.OrientedPDCode.khovanovComplexHomologyUnknotIso`,
  `TauCeti.OrientedPDCode.coeff_pow_eq_finrank_homology_khovanovComplex`,
  `TauCeti.OrientedPDCode.enhancedQuantumDegree_mod_two`.
- *Euler characteristic and the Jones polynomial.* `TauCeti.OrientedPDCode.enhancedStateSum`,
  `TauCeti.OrientedPDCode.enhancedStateSum_eq_pow`, `TauCeti.enhancedStateSum_rightHandedTrefoilPDCode`,
  `TauCeti.OrientedPDCode.khovanovEulerChar`, `TauCeti.OrientedPDCode.homologyEulerChar_khovanovComplex`,
  `TauCeti.OrientedPDCode.khovanovEulerChar_eq_enhancedStateSum`,
  `TauCeti.OrientedPDCode.khovanovEulerChar_eq_mul_eval₂_jonesPolynomial` (for a nonempty planar
  code, over a Noetherian ring with the rank-nullity property),
  `TauCeti.OrientedPDCode.khovanovEulerChar_empty`.
- *Homological algebra.* `TauCeti.koszulBraiding`, `TauCeti.koszulBraidedCategory`,
  `TauCeti.koszulSymmetricCategory`, `TauCeti.linearHomComplexPostcomp`,
  `TauCeti.ChainComplex.extToHomology`, `TauCeti.ChainComplex.extToHomology_injective`,
  `TauCeti.ChainComplex.exact_extToHomology_kronecker` (the Hom/Ext sequence for a chain complex with
  split cycle inclusions and projective cycles), `TauCeti.dualNumberProjectiveResolution`,
  `TauCeti.dualNumberProjectiveResolutionXIso`, `TauCeti.dualNumberResidue`.
- *Braids, smooth links and geometry.* `TauCeti.BraidWord`, `TauCeti.BraidWord.closure`,
  `TauCeti.BraidWord.crossingSign_closure`, `TauCeti.BraidWord.writhe_closure`,
  `TauCeti.BraidWord.nextCrossing`, `TauCeti.BraidWord.closure_nil`, `TauCeti.SmoothLinkEmbedding`,
  `TauCeti.SmoothLinkEmbedding.SmoothAmbientIsotopic`, `TauCeti.SmoothEmbedding`, `TauCeti.SmoothEmbedding.compDiffeomorph`,
  `TauCeti.Diffeotopy`, `TauCeti.interior_image_criticalPoints_eq_empty` (Morse–Sard on
  finite-dimensional charts), `TauCeti.filledHull`, `TauCeti.cellularSingularHomologyIso`,
  `TauCeti.eulerChar_eq_finsum_finrank_singularHomology`.

### From TauCetiRoadmap.GeometricTopology

Layer 1 (§§1.1, 1.3 and 1.5: collars, gluing along the boundary, tubular neighbourhoods) and Layer 4
(§4.2: diagrams, their realization as links and Reidemeister's theorem; §4.2.3: braid closures). They
are consumed in §§7.1–7.2 and 7.6 (Layer 1) and in §§4.3, 6.4 and 8.1–8.6 (Layer 4).

### From TauCetiRoadmap.DifferentialGeometry

Layer 2 (orientations of manifolds, pullbacks and products), §§3.2, 3.3 and 3.5 (maximal flows,
completeness and time-dependent flows in finite dimensions) and Layer 5 (boundary orientation),
consumed in §§7.1–7.3 and 8.4–8.5.

### From TauCetiRoadmap.ConformalMapping

Layer 5 (Jordan separation and filled hulls of Jordan curves), consumed in §8.2.

### From TauCetiRoadmap.DGAInfinity

Layer 1 (DG algebras and modules, and ordinary algebras as degree-zero DG algebras) and Layer 5
(derived modules and semi-free modules), consumed in §5.11 under their stated hypotheses.

### From TauCetiRoadmap.AlgebraicTopology

§4.3 (the cellular comparison) and §7.1 (the Euler characteristic of finite CW complexes and its
Euler–Poincaré theorem), consumed in §7.6 through the Tau Ceti declarations listed above.

## References

- M. Khovanov, [A categorification of the Jones polynomial](https://arxiv.org/abs/math/9908171),
  Duke Math. J. 101 (2000): §2.1 (grading shifts, translated in Convention 3), §2.2 (the Frobenius
  algebra), §4.2 (Theorem 1 and Proposition 9), §§6.2 and 7.6 (Propositions 26 and 35, the
  `(2, n)` torus links), §7 (the specialization `c = 0`; Theorem 2, Propositions 27–33 and
  Corollaries 11–12), §7.7 (adequate diagrams, Propositions 36–37 and Corollary 13).
- M. Khovanov, [Patterns in knot cohomology I](https://arxiv.org/abs/math/0201306), §3, for the
  module structure over the dual numbers at a marked point and the reduced theory over `ℚ` for
  knots; the integral finite-link comparison and its periodic-resolution proof are §5.9's.
- M. Jacobsson, [An invariant of link cobordisms from Khovanov homology](https://arxiv.org/abs/math/0206303),
  Algebr. Geom. Topol. 4 (2004), 1211–1251: §3.2 (numbered movie moves), §4.2 (Theorem 2, the
  boundary-fixed homology statement up to an overall sign, and the reformulated theorem of
  Carter–Saito). The chain-level theorem and its local proof follow Bar-Natan's construction.
- D. Bar-Natan, [Khovanov's homology for tangles and cobordisms](https://www.math.toronto.edu/~drorbn/papers/Cobordism/),
  Geom. Topol. 9 (2005), 1443–1499: §4.1 (the relations `S`, `T`, `4Tu`), §§4.2–4.3 (Theorem 1,
  invariance, with local cancellation and cone homotopies), §5 (Theorem 2, planar composition), §7
  (Proposition 7.2, the evaluation), §8 (Theorem 4, projective functoriality, and the movie moves)
  and §9.1 (neck cutting).
- D. Bar-Natan, [On Khovanov's categorification of the Jones polynomial](https://arxiv.org/abs/math/0201043),
  Algebr. Geom. Topol. 2 (2002), 337–370: §3.1, Definitions 3.2–3.3 (the shifts `{k}` and `[s]` and
  the normalization of the complex).
- M. Golubitsky and V. Guillemin,
  [Stable Mappings and Their Singularities](https://doi.org/10.1007/978-1-4615-7904-5),
  §II.4, Theorem 4.13, for multijet transversality; the relative finite-parameter, fixed-collar and
  collision-stratum adapters are §§7.5 and 8.4.
- M. W. Hirsch, [Differential Topology](https://doi.org/10.1007/978-1-4684-9449-5),
  Ch. 8 §1, Theorems 1.3–1.4, for compact-submanifold isotopy extension; the finite-family support
  and the collar and slab adapters are §§7.2 and 8.5.
- W. B. R. Lickorish, *An Introduction to Knot Theory*, Ch. 1, for the PL Reidemeister theorem; its
  smooth, labelled, relative comparison is §8.6.
- D. Roseman,
  [Reidemeister-type moves for surfaces in four-dimensional space](https://doi.org/10.4064/-42-1-347-380),
  for the surface-projection moves; their height-sensitive movie refinements are §7.5's.
- J. S. Carter and M. Saito,
  [Reidemeister Moves for Surface Isotopies and Their Interpretation as Moves to Movies](https://doi.org/10.1142/S0218216593000167),
  J. Knot Theory Ramifications 2 (1993), 251–284, for the fifteen geometric movie schemata in
  Jacobsson's numbering; and *Knotted Surfaces and Their Diagrams* for the geometric presentation.
- J. S. Carter, J. H. Rieger and M. Saito,
  [A combinatorial description of knotted surfaces and their isotopies](https://doi.org/10.1006/aima.1997.1618),
  for the word presentation; its dictionary with the chosen movie schemata, with the precise
  generator and relation correspondence, is §7.5's.

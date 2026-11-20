# Roadmap: smooth orbifolds with finite isotropy

**Summary.** This roadmap builds smooth orbifolds with their full finite isotropy, ineffective
isotropy included. An orbifold is presented by a proper étale Lie groupoid `Γ ⇉ Γ₀`: Hausdorff
second-countable finite-dimensional object and arrow manifolds, source and target local
diffeomorphisms, and `(s, t)` proper. Every arrow is kept, so the isotropy groups are finite and may
act trivially: the point `[*/K]` keeps its group `K` and is not the ordinary point. Presentations are
compared by Morita equivalence, maps are principal bibundles, and the underlying space is the coarse
space `|Γ|`, the orbit space with its quotient topology. On this carrier the roadmap develops the
local theory (linear charts, finite-chart atlases, averaging, effective reduction, frame bundles and
the coarse diffeology), triangulations of the coarse space, orbibundles and invariant differential
forms, the classifying space `BΓ` and its comparison with `|Γ|`, weighted integration, Thom classes
and rational duality, together with globally collared domains with labelled faces and parameter
boxes, for families and cobordisms.

Its headline theorems are these.

- *Linear charts.* If `Γ` is a proper étale presentation and `x` an object, the isotropy group `Γ_x` is
  finite, and near `x` the groupoid is isomorphic to `Γ_x` acting linearly on a ball in the tangent
  space `T_xΓ₀`, every isotropy arrow kept, including those acting as the identity.
- *Triangulation.* If a compact Lie group acts smoothly on a second-countable Hausdorff manifold,
  its orbit space is triangulable (Yang; Verona); consequently the coarse space of every proper étale
  presentation has triangulations subordinate to any chart atlas.
- *The rational comparison and de Rham theorem.* For a proper étale presentation `Γ`, the coarse map
  `q : BΓ → |Γ|` induces an isomorphism of cohomology rings `H*(|Γ|; R) ≅ H*(BΓ; R)` for `R = ℚ` and
  `R = ℝ`, though not over `ℤ`, and the forms on `Γ₀` invariant under the arrows compute
  `H*(BΓ; ℝ)`.
- *Weighted integration and duality.* For an oriented `Γ`, integrating a compactly supported invariant
  top form chart by chart as `|G|⁻¹ ∫_U`, with `G` the full chart group, is well defined and satisfies
  Stokes on collared domains, and `∫_[*/K] 1 = 1/|K|`. If `Γ` is moreover compact, connected and
  boundaryless, its coarse space satisfies rational Poincaré duality, and the weighted fundamental
  class `(1/k)[|Γ|]`, with `k` the generic order of the ineffective kernel, evaluates on de Rham
  classes as the weighted integral.

The roadmap stands on these suppliers. LieGroupoidsPoisson provides Lie groupoids, smooth functors,
groupoid actions and principal bibundles with their Morita composition. SmoothBundlesConnections
provides slices of proper actions, frame bundles, connections and curvature. DifferentialGeometry
provides forms, orientations, integration, Stokes and the de Rham theorem on manifolds.
AlgebraicTopology and CharacteristicClasses provide singular cochains, realizations and compact
generation, Milnor's counit theorem, classifying spaces and the universal Chern–Weil map. For
action groupoids of group actions the layers use Tau Ceti's local theory. HamiltonianReduction and
ConvexityToric apply the roadmap to their Hamiltonian quotients, and Layer 7 compares the elliptic
charts of FuchsianOrbifolds with the generic ones.

The guide to the layers is below.

## How to read the build

Layer 1 sets up presentations, maps, weak fibre products, action presentations and collared domains. Layer 2 proves
the local theory: linear charts, atlases, the ineffective kernel, averaging and cutoffs, frame
bundles and the coarse diffeology. Layer 3 triangulates the coarse space and builds the covers used
for descent. Layer 4 builds orbibundles, invariant forms and `BΓ`, and proves the rational and
de Rham comparisons, the collared version, supports, the represented bundle and the simplicial
Chern–Weil comparison. Layer 5 integrates, proves Stokes, duality and the Thom isomorphism. Layer 6
proves functoriality, families and cobordism laws, and Layer 7 works out the required examples and
the comparisons with neighbouring roadmaps. The build order departs from the numbering in one place:
§1.6 is built after §§2.1, 2.2 and 2.4. Each *Needs:* line lists what its statement and its route
use, so that a target proved by another route is not blocked behind an unrelated section.

Other roadmaps cite the former numbering of this roadmap, in blocks O1–O7, which maps as follows.
Block `Ok` is Layer k, and item `n` of block `Ok`, also written `Ok.n`, is §k.n for `k = 1, …, 5`:
O1.4 is §1.4, O2 item 6 is §2.6, O4 item 1 is §4.1, O4.2 is §4.2, and O5 items 1, 4 and 5 are
§§5.1, 5.4 and 5.5. The collared pairs O4-P are §4.4a. The lettered blocks keep their letters in the
headings: O4-N is §4.3, O4-S §4.4, O4-R §4.5, O4-K §4.7, O4-W §4.8, O4-T §§4.9–4.9c, O5-L §5.3,
O5-A and O5-P §5.4, and O5-T §5.5. The two paragraphs of O6 are §§6.1–6.2, and the five items of O7
are §§7.1–7.5.

## Conventions

1. **Presentations.** A *presentation* is a Lie groupoid `Γ ⇉ Γ₀` in the sense of
   LieGroupoidsPoisson §G0.2, written on its native categorical groupoid carrier, whose object and
   arrow manifolds are finite dimensional, Hausdorff and second countable, whose source and
   target are local diffeomorphisms (*étale*), and whose map `(s, t) : Γ → Γ₀ × Γ₀` is proper in
   Mathlib's sense `IsProperMap`. Dimensions are constant on each connected component of `Γ₀` and
   may differ between components. A Mathlib manifold has a single model space, so such a
   presentation is read as the disjoint union, with no arrows between the parts, of Lie groupoids
   of §G0.2 of constant dimension, one for each dimension (§2.5). The isotropy group `Γ_x` of an
   object is the group of arrows `x → x`; it is finite (§2.1). Composition is written as in
   LieGroupoidsPoisson: for arrows `h` then `g`, the product is `gh = h ≫ g`.
2. **Retained arrows.** Every arrow is kept. Two distinct arrows can induce the same germ of
   diffeomorphism of the object manifold, and the arrows inducing identity germs form the
   *ineffective kernel* (§2.3). The *effective reduction* divides it out; it has the same coarse
   space but is in general not Morita equivalent to the original: for a nontrivial finite group
   `K`, the point presentation `[*/K]` keeps isotropy `K` and is not equivalent to a point with
   trivial isotropy.
3. **Coarse space.** The coarse space `|Γ|` is the orbit quotient `Γ₀/Γ` with its quotient
   topology, and `q` denotes the coarse map to it from objects or from `BΓ`. `[N/K]` denotes the
   presentation of the quotient of a manifold `N` by a finite group `K` (the action groupoid
   `K ⋉ N`), and `BΓ` the classifying space of Layer 4.
4. **Maps.** A map of orbifolds is a principal bibundle (LieGroupoidsPoisson §G3.5), equivalently a
   refinement span of smooth functors together with its 2-isomorphisms (§1.2); a continuous map of
   coarse spaces alone is not such data. Two presentations are equivalent when they are Morita
   equivalent.
5. **Orientation.** An orientation of a presentation is an orientation of `Γ₀` preserved by every
   arrow, isotropy included. An oriented boundaryless presentation therefore has
   orientation-preserving local isotropy.
6. **Collared domains and faces.** The boundary and corner carrier is the full restriction of a
   boundaryless presentation to `D = {x | ρ_i(x) ≥ 0 for all i}`, for a finite family of
   arrow-invariant smooth functions `ρ_i` whose differentials at each point, over the indices
   active there, are linearly independent, with a given compatible family of invariant collars;
   products `Γ × [0,1]^k` with ordered boxes are included. §1.6 constructs these global corner
   groupoids and their charts. Each labelled face is preserved individually: actions permuting the
   faces of a quadrant are outside this carrier. The reflection loci of a boundaryless quotient
   chart are not designated faces. Boundaries are oriented outward-normal first
   (DifferentialGeometry §5.1).
7. **Cohomology and coefficients.** The cohomology of a presentation is the ordinary singular
   cohomology `H*(BΓ;R)` of its classifying space; it is not Chen–Ruan cohomology. The rational
   comparison with the coarse space concerns constant coefficients `ℚ` or `ℝ` and the
   orientation local system of a *locally orientable* presentation, one in which every isotropy
   group acts trivially on its local orientation line; for those, §4.6 constructs the descended
   coarse local system and the identification of its pullback. These comparisons do not identify
   integral coefficients or isotropy-sensitive local systems with coarse ones. When isotropy
   reverses orientation the descent hypothesis fails: for the reflection of `ℝ` and the sign
   coefficients, the local cohomology `H*(B(ℤ/2); ℚ_sign)` vanishes, and no rank-one coarse
   orientation local system is asserted.
8. **Weighted integration.** Integration on an orbifold weights each chart by the full order of its
   isotropy group, ineffective kernel included (§5.1); it is not ordinary integration over the
   generally infinite-dimensional space `BΓ`. In particular `∫_[*/K] 1 = 1/|K|`. Rational classes
   are taken over `ℚ` and forms over `ℝ`; a statement over another coefficient ring assumes every
   isotropy order occurring to be invertible in it.
9. **Averaging.** Finite averaging is Mathlib's `Representation.averageMap`, over a coefficient
   ring in which the group order is invertible. Integral invariants are not claimed to be exact.
10. **Diffeology.** Diffeologies are Mathlib's `DiffeologicalSpace`, with plots `IsPlot` on the
    Euclidean spaces `EuclideanSpace ℝ (Fin n)`, smooth maps `DSmooth` and the D-topology
    `dTopology`. The diffeology of §2.6 is the smooth finite-quotient diffeology; it is not the
    continuous diffeology, whose plots are all continuous maps and whose D-topology is
    delta-generated.
11. **Names.** The declarations of `Suggested.lean` live in the namespace `TauCetiRoadmap.Orbifolds`.
    Every other target of this README is named in prose.

## Layer 1: Presentations, maps and finite-action models

### 1.1 Proper étale presentations

Define the Hausdorff proper étale presentations of Convention 1 as a predicate on
LieGroupoidsPoisson §G0.2's Lie groupoids: Hausdorff second-countable finite-dimensional object
and arrow manifolds, source and target local diffeomorphisms, and `(s, t)` proper (`IsProperMap`).
Prove that the class is closed under restriction to open subsets of objects (the full
subgroupoid on an open `U ⊆ Γ₀`), under finite products and under isomorphisms of Lie groupoids, and
that it is closed under the equivalences that stay inside étale groupoids: an étale Lie groupoid
with Hausdorff second-countable object and arrow manifolds that is Morita equivalent to a proper
étale presentation is itself proper (Moerdijk, *Orbifolds as Groupoids*, §2.7, p. 7). Equivalence
alone does not preserve étaleness (see the Checks). The topological parts of
the first two closure properties are Tau Ceti's: for a native groupoid with topologies on objects
and total arrows, the full subgroupoid on an open set has locally homeomorphic source and target
and proper `(s, t)` (`TauCeti.isLocalHomeomorph_source_fullSubcategory`,
`TauCeti.isLocalHomeomorph_target_fullSubcategory`, `TauCeti.isProperMap_source_target_fullSubcategory`),
and so does a product (`TauCeti.isLocalHomeomorph_source_prod`, `TauCeti.isLocalHomeomorph_target_prod`,
`TauCeti.isProperMap_source_target_prod`); the smooth statements are the targets.

The action presentations are LieGroupoidsPoisson §G0.3's action groupoids, on Mathlib's
`CategoryTheory.ActionCategory G X` with objects identified with `X` through
`CategoryTheory.ActionCategory.objEquiv` (not definitionally), and orbit space
`MulAction.orbitRel.Quotient G X`. Use Tau Ceti's dictionary: the total arrow space is
`G × X` by label and source (`CategoryTheory.ActionCategory.totalEquiv`, and topologically
`TauCeti.ActionGroupoid.arrowHomeomorph`), with source `(g, x) ↦ x`, target `(g, x) ↦ g • x`, unit
`(1, x)`, inverse labelled `g⁻¹` and composition labelled by the product; the source is a local
homeomorphism for discrete `G`, the target when `G` acts by homeomorphisms, and `(s, t)` is proper
exactly when the action is proper (`TauCeti.ActionGroupoid.isProperMap_source_target_iff`); for a
discrete group acting smoothly, the arrow space is a manifold and source and target are local
diffeomorphisms (`TauCeti.ActionGroupoid.isLocalDiffeomorph_source`,
`TauCeti.ActionGroupoid.isLocalDiffeomorph_target`). The isotropy group of `x` is the stabilizer,
`CategoryTheory.ActionCategory.stabilizerMulEquivAut : stabilizer G x ≃* Aut (objEquiv G X x)`,
with multiplication `gh = h ≫ g`, compared with Mathlib's `CategoryTheory.ActionCategory.stabilizerIsoEnd` by
`CategoryTheory.ActionCategory.toEnd_stabilizerMulEquivAut` and with the opposite of Mathlib's
vertex group by `CategoryTheory.ActionCategory.stabilizerMulEquivVertexGroupMulOpposite`. Every
label is kept, also for elements acting trivially. Prove that a finite group acting smoothly on a
manifold gives a proper étale presentation in the sense above.

*Needs:* LieGroupoidsPoisson §§G0.2–G0.4; Tau Ceti's topological closure and action-groupoid
statements named above (supplier contracts); Mathlib `IsProperMap`,
`CategoryTheory.ActionCategory`, `MulAction.orbitRel.Quotient`.

**Checks.**
- `[*/K]` (the action groupoid of a finite group `K` on a point) is proper étale, with one object,
  arrow space `K` and isotropy `K`; a definition that identified arrows inducing the same germ on
  objects would collapse it to the point with trivial isotropy.
- `ℤ` acting on `ℝ` by translation gives an étale groupoid with proper `(s, t)` (the action is
  properly discontinuous) and trivial isotropy; `ℤ` acting on the circle by an irrational rotation
  is étale with free action, but `(s, t)` is not proper: the arrows between two fixed small
  neighbourhoods are infinite in number, while properness would make them finite.
- The pair groupoid `ℝ × ℝ ⇉ ℝ` is equivalent, by smooth functors and smooth natural isomorphisms,
  to the one-point groupoid, which is proper étale, but its source map `ℝ² → ℝ` is not a local
  diffeomorphism: closure under equivalences holds only among étale groupoids, as stated.

### 1.2 Generalized maps, Morita equivalence and the coarse space

Consume LieGroupoidsPoisson §G0.4's smooth functors and smooth natural isomorphisms and §G3.5's
principal bibundles, their balanced composition, associators and unitors and their coherence.
On the proper étale Hausdorff presentations of §1.1, construct the comparison between refinement
spans of smooth functors (a smooth functor `Γ' → Γ` that is an essential equivalence, followed by a
smooth functor `Γ' → Δ`) and principal bibundles, with its composition and refinement laws, and
descent of equivariant objects along essential equivalences. These adapters extend the existing
carriers rather than define a second theory of functors or bibundles.

Prove that generalized maps induce continuous maps of coarse spaces compatibly with composition.
That a Morita equivalence induces a homeomorphism of coarse spaces and isomorphisms of the isotropy
groups at corresponding points is LieGroupoidsPoisson §G3.5's, the coarse space being its orbit
space. The coarse space of a proper étale presentation is Hausdorff, second countable, locally
compact and paracompact. For a native groupoid with continuous source, open target and closed
image of `(s, t)`, Tau Ceti proves the quotient map to the isomorphism classes open
(`TauCeti.isOpenQuotientMap_isomorphismClassesMk`), the quotient Hausdorff
(`TauCeti.t2Space_isomorphismClasses`) and, for locally compact second-countable objects,
paracompact (`TauCeti.paracompactSpace_isomorphismClasses`); second countability and local
compactness pass along the open quotient map by Mathlib's `Topology.IsOpenQuotientMap.secondCountableTopology`
and `IsOpenQuotientMap.locallyCompactSpace`. A proper étale presentation satisfies those
hypotheses: `t` is open, being a local diffeomorphism, and `(s, t)` is proper, hence closed.

*Needs:* §1.1; LieGroupoidsPoisson §G0.4 and §G3.5; Tau Ceti's coarse-space statements named
above.

**Checks.**
- The unit groupoid of a manifold `M` and the Čech groupoid of an open cover of `M` (objects the
  disjoint union of the open sets, arrows the pairwise intersections) are Morita equivalent through
  the refinement span given by the inclusion functor, and both have coarse space `M`. A
  smooth functor that is an equivalence of Lie groupoids would not suffice to compare them: there is
  no smooth functor `M → ⊔ U_i` in general.
- The effective reduction of `[*/K]` is the point; the two have the same coarse space and
  non-isomorphic isotropy, so they are not Morita equivalent, as §G3.5's isotropy statement
  predicts.

### 1.3 Weak fibre products

For smooth functors `f : Γ → Λ` and `g : Δ → Λ` of proper étale presentations, construct the weak
fibre product: its objects are the triples `(x, h, y)` with `x ∈ Γ₀`, `y ∈ Δ₀` and `h : f(x) → g(y)`
an arrow of `Λ`, and its arrows are the pairs of arrows of `Γ` and `Δ` commuting with `h` (Moerdijk,
*Orbifolds as Groupoids*, §2.3, p. 5). It is built from SmoothBundlesConnections B1.0's transverse
fibre products. State the transversality of the
object and arrow maps that is required; a submersion hypothesis on `f` or `g` is a sufficient case.
Under these hypotheses prove that the weak fibre product is a proper étale presentation, that it
has the universal property up to natural isomorphism, the composition and base-change laws, and
Morita independence. A pullback whose fibre is a singular nodal curve is not asserted to be a
smooth orbifold by this theorem.

*Needs:* §1.1; §1.2; SmoothBundlesConnections B1.0 (transverse fibre products); LieGroupoidsPoisson
§G0.4.

### 1.4 Presentations of locally free proper actions

For a proper, locally free (finite-stabilizer) smooth action of a finite-dimensional Lie group `G`
on a manifold `M`, construct an étale presentation of `M/G` from a countable family of slices
(SmoothBundlesConnections B1.4), keeping the actual group elements that transport one slice to
another. Construct its Morita bibundle to the action groupoid `G ⋉ M` and prove that the result is
independent of the slices up to refinement. This is the general action case, which
HamiltonianReduction R3 applies to its Hamiltonian levels. An ineffective orbifold is not assumed
to be a global quotient of a compact Lie group through an effective frame construction.

*Needs:* §1.1; §1.2; SmoothBundlesConnections B1.4; LieGroupoidsPoisson §G0.3 and §G3.5.

**Checks.**
- For `G = S¹` acting on `S³ ⊂ ℂ²` by `λ · (z, w) = (λ^a z, λ^b w)` with `a`, `b` coprime positive
  integers, the action is locally free with stabilizers `ℤ/a` at `(1, 0)`, `ℤ/b` at `(0, 1)` and
  trivial elsewhere; the slice presentation has isotropy groups of exactly these orders, and its
  coarse space is a sphere. A presentation built from germs of slice maps would agree here (the
  action is effective on slices), but for `λ · (z, w) = (λ² z, λ² w)` the stabilizer `ℤ/2` acts
  trivially on every slice, and only the retained group elements keep it.

### 1.5 Topological action groupoids of equivariant families

Using LieGroupoidsPoisson §G3.1's algebraic fibred action carrier, construct for a groupoid `Γ` and
an arbitrary topological space `Z` the continuous equivariant families `p : Z → Γ₀`, with their
continuous action map on `Γ ×_{s, p} Z` and continuous intertwining maps, the topological action
groupoid, and its base change along continuous maps of object charts. The topological action
groupoid is Tau Ceti's category of elements of the corresponding functor: its total arrow space is
the fibre product `Γ ×_{s,p} Z` (`CategoryTheory.Functor.Elements.totalHomeomorph`), its source is a
local homeomorphism when that of `Γ` is and `p` is continuous
(`CategoryTheory.Functor.Elements.isLocalHomeomorph_source`), its target is continuous exactly when
the action map is (`CategoryTheory.Functor.Elements.continuous_target_iff`) and is a local
homeomorphism for a groupoid (`CategoryTheory.Functor.Elements.isLocalHomeomorph_target`), and
`(s, t)` is proper under the Hausdorff hypotheses of
`CategoryTheory.Functor.Elements.isProperMap_source_target`. The targets here are the intertwining
maps and the base change along maps of object charts, with its fibre-product homeomorphisms. The
smooth case uses the manifold and transversality hypotheses of §1.3 and is separate from this
topological construction.

*Needs:* LieGroupoidsPoisson §G3.1; Tau Ceti's category-of-elements statements named above.

### 1.6 Globally collared domains with labelled faces

Construct the carrier of Convention 6. Its objects are `D = {x | ρ_i(x) ≥ 0 for all i}` and its
arrows the full restriction of a boundaryless presentation to `D`; prove that `D` is saturated, that
composition is inherited and that `(s, t)` stays proper. Using the active `ρ_i` as coordinates and the
given collars, construct quadrant charts on objects and arrows; prove that source and target are
face-preserving local diffeomorphisms in these charts and that all structure maps are smooth on the
relative corner domains. Construct restrictions, neat intersections of faces, changes and
refinements of the data, and products with ordered boxes `[0,1]^k`. Average local straightening
data where needed (§2.4), preserving each labelled face and the collar compatibility equations.
These are explicit globally collared orbifolds with faces; arbitrary corner actions are not part
of this carrier.

The collars are part of the datum: inward maps `c_i : F_i × [0, ε_i) → D` on stated neighbourhoods
of the faces `F_i = {ρ_i = 0}`, with `c_i(x, 0) = x`, `ρ_i(c_i(x, t)) = t` and `ρ_j(c_i(x, t)) = ρ_j(x)`
for `j ≠ i`. They commute on common domains and are equivariant for the actual arrows, including
their restrictions to every labelled intersection. The radii `ε_i` may be positive invariant
functions. This roadmap owns the box products, the face restrictions and the averaged
straightening maps; their orientation conventions are fixed in §3.5 and their integral laws in §5.2.

Define the full topological restriction to the closed union `∂D = ⋃_i F_i` and its nerve, using the
charts of faces and their intersections rather than assuming that the union is a single smooth
object chart. Construct compatible invariant NDR (neighbourhood deformation retract) and collar
data for the pairs `(N_pΓ_D, N_pΓ_∂D)` in every nerve degree, compatible with all structure maps, and
the comparison of the closed subspace with the relative pair after fat realization. The
retraction of the corner union is built from the commuting collars and continuous quadrant face
coordinates; it is not the theorem on saturated open restrictions. These maps make
`(BΓ_D, BΓ_∂D)` a good pair, as §4.4a uses.

*Needs:* §1.1; §2.1 and §2.4 (the finite linearization and the finite averages used for
straightening); §2.2 (the retained-arrow atlas on which the charts are built); LieGroupoidsPoisson
§G0.4; DifferentialGeometry §5.5b (manifolds with corners and their faces). This section is built
after §§2.1, 2.2 and 2.4, none of which uses it; it keeps its number.

**Checks.**
- For `Γ` the unit groupoid of `ℝ²` and `ρ_1 = x`, `ρ_2 = y`, `D` is the closed quadrant, with two
  labelled faces meeting in the corner `0`, and the collars `c_1((0, y), t) = (t, y)`,
  `c_2((x, 0), t) = (x, t)` satisfy all the equations and commute. For `ℤ/2` acting by `(x, y) ↦ (y, x)`
  the functions `x` and `y` are not invariant, and the swap permutes the faces: it is excluded,
  whereas the invariant `ρ = x + y` with `ℤ/2` acting gives one labelled face preserved by the action.

### Examples

- The unit groupoid of a manifold, the action groupoid `[ℝ^n/G]` of a finite linear action, the point
  `[*/K]` and the trivial gerbe `K × N ⇒ N` are proper étale presentations (§1.1).
- The product `Γ × [0,1]^k` of a boundaryless presentation with a box is a globally collared domain
  with `2k` labelled faces (§1.6), the parameter coordinates carrying trivial isotropy.

### Dependencies

External: LieGroupoidsPoisson §§G0.2–G0.4, G3.1 and G3.5; SmoothBundlesConnections B1.0 and B1.4;
DifferentialGeometry §5.5b (manifolds with corners and their faces); Tau Ceti's topological
groupoid statements and Mathlib's action categories. §§1.1–1.5 come first and use nothing from
later layers. §1.6 is built after §§2.1, 2.2 and 2.4 (finite linearization, retained-arrow atlas
and averages), and
precedes the face-kernel comparison of §2.3 and every later use of collared domains.

## Layer 2: Retained-arrow charts, averaging and effective reduction

### 2.1 Linear charts with retained arrows

Prove that every object of a proper étale presentation has a linear chart in which all arrows are
kept: for each `x ∈ Γ₀` there are an invariant open neighbourhood `U` of `x`, a ball `B` in `T_xΓ₀`
for an inner product invariant under the isotropy group `Γ_x`, and an isomorphism of Lie groupoids
`Γ|U ≅ Γ_x ⋉ B` for the linear action of `Γ_x` on `T_xΓ₀` by derivatives, sending `x` to `0` and each
isotropy arrow to its own label, even when it acts as the identity on all of `U`. The isotropy group
is finite and its representation on `T_xΓ₀` detects the ineffective kernel (§2.3): an arrow acts
trivially near `x` exactly when its derivative at `x` is the identity. The proof works for
non-faithful actions (Moerdijk, *Orbifolds as Groupoids*, §3.4, p. 8).

The route combines two halves, both Tau Ceti's. The topological half: for a native groupoid with Hausdorff arrow
space, locally homeomorphic source and target, proper `(s, t)` and continuous units and
composition, every hom set is finite (`TauCeti.finite_hom_of_proper_source_target`), the arrows
near `x` lie in disjoint open bisections through the isotropy arrows
(`TauCeti.exists_disjoint_bisections_of_proper_source_target`), and on an open neighbourhood `U` of
`x` the isotropy group acts continuously with a fully faithful functor `Aut x ⋉ U ⥤ Γ` that is the
inclusion on objects, every isotropy arrow keeping its own label
(`TauCeti.exists_isotropy_action_of_proper_source_target`). The linear half is finite Bochner
linearization: for a finite group `G` acting by `C^n` maps (`n ≥ 1`) on a boundaryless manifold with
a common fixed point `x`, a chart `c` at `x` with `c(x) = 0` and `dc_x = id` is averaged to
`A(y) = |G|⁻¹ ∑_g L_g⁻¹ c(g · y)`, with `L_g = d(g)_x`, which satisfies `A(h · y) = L_h A(y)` and
`dA_x = id` (`ContRepresentation.bochnerAverage`, `ContRepresentation.bochnerAverage_smul`); the
inverse function theorem then gives an invariant chart in which the action is linear, with target a
ball for the averaged inner product (`TauCeti.exists_equivariant_contMDiff_chart`,
`TauCeti.exists_equivariant_contMDiff_chart_target_eq_sumOfConjugatesInnerSublevel`). The target
of this section is the assembly for a presentation: prove that the local action of
`exists_isotropy_action_of_proper_source_target` is by diffeomorphisms when `Γ` is a Lie groupoid
and its functor is an isomorphism of Lie groupoids onto `Γ|U`, shrink `U` simultaneously so that
all multiplication identities hold and properness excludes further arrows near `(x, x)`, and
compose with the linear chart.

*Needs:* §1.1; Tau Ceti's local isotropy action and Bochner linearization statements named above;
LieGroupoidsPoisson §G0.4 (local bisections).

**Checks.**
- For `[ℝ^n/G]` with `G` finite acting linearly, the chart at `0` is the identity: `U = ℝ^n`, `Γ_0 = G`.
  At a point `v ≠ 0` the isotropy group is the stabilizer `G_v` and the chart is `G_v` acting on a
  small ball around `v`, not `G`.
- For `[*/K]` the chart is `K ⋉ {0}`, the zero representation of `K`: every element acts as the
  identity and is kept. A chart of germs would have trivial group.

### 2.2 Finite-chart atlases with retained arrows

Construct atlas data from finitely many charts at a time: finite group actions on charts, with
overlap-arrow torsors (for two charts, the set of arrows from points of one to points of the other,
with its free actions of the two chart groups), their composition and the natural transformations
between them. The overlap data include the condition that the resulting arrow relation be
separated and proper. Construct the presenting smooth groupoid of such an atlas, prove it proper
étale, prove the refinement laws, and prove the two comparisons (atlas to groupoid and groupoid to
atlas) inverse to each other up to Morita equivalence. Replacing the overlaps by germs of chart
diffeomorphisms would erase the ineffective isotropy and is not this chart model. Prove the local
change-of-chart and stabilizer-conjugation formulas, restriction, products and independence of the
chosen local linearization.

*Needs:* §1.1; §1.2; §2.1.

**Checks.**
- The atlas of `[*/K]` with one chart `{0}` and group `K` has one overlap torsor, `K` itself with its
  left and right translation actions; the presenting groupoid is `[*/K]` again. An atlas recording
  only germs of chart maps would give the point.

### 2.3 Ineffective kernel and effective reduction

Define the ineffective kernel of a presentation as the arrows inducing the identity germ of
diffeomorphism of `Γ₀` near their source. Prove that in a linear chart of §2.1 it is a finite normal
subgroup of the chart group acting trivially on the connected chart; construct the effective
quotient presentation, and prove that it has the same coarse space as the original (but is not
asserted to be Morita equivalent to it). Prove that the order of the kernel is locally constant,
hence constant on each connected component of the orbifold; keep the actual kernel groups, with
their conjugation along arrows and their monodromy. Prove that the full isotropy group equals the
kernel on a dense open principal set, by the fixed-subspace calculation for a faithful finite linear
action. For finite group actions use Tau Ceti's statements: the germ kernel
`TauCeti.MulAction.germKernel`; the stabilizer equals the kernel on a dense set for a finite group
acting by `C¹` maps on a Hausdorff connected boundaryless manifold
(`TauCeti.dense_setOf_stabilizer_eq_ker_of_contMDiff`), and on an open set for a finite group acting
continuously on a Hausdorff space (`TauCeti.isOpen_setOf_stabilizer_eq_ker`); the germ
kernel is the kernel of the action on a connected manifold (`TauCeti.germKernel_eq_ker`); the
effective quotient functor of an action groupoid (`TauCeti.effectiveActionFunctor`) and the
homeomorphism of orbit spaces with those of the faithful quotient (`TauCeti.effectiveOrbitHomeomorph`).
The target is the groupoid-level statement, assembled from these through the charts of §§2.1–2.2.
The trivial gerbe `K × N ⇒ N`, every element of `K` acting trivially on a manifold `N`, is a
required example: its kernel is `K` at every point and its effective reduction is the unit
groupoid of `N`.

On a face or a labelled intersection of a collared domain (§1.6), prove that the ineffective
kernel of the face presentation equals the ambient ineffective kernel. If an arrow `g` fixes the
germ of the face, its derivative is the identity on the tangent space of the face; it preserves
each active `ρ_i`, so it is the identity on the normal quotient, and `dg = Id + N` with `N` mapping
normal directions to tangent directions and `N² = 0`. Since `g` has finite order `m`,
`0 = (Id + N)^m − Id = mN`, so `N = 0` over `ℝ` (Tau Ceti's
`Module.End.eq_one_of_pow_eq_one_of_sub_one_sq_eq_zero`), and the linear chart of §2.1 gives the
ambient identity germ (Tau Ceti's `OpenPartialHomeomorph.eventually_smul_eq_iff_on_ker` is the
chart form). The converse is restriction. Hence the same kernel order `k` occurs on every incident
labelled face, corners included, and conjugation identifies these kernel groups along arrows.

*Needs:* §2.1; §2.2; §1.6 (for the face statement); Tau Ceti's germ-kernel, effective-quotient and
square-zero statements named above.

**Checks.**
- For `ℤ/4` acting on `ℂ` through `i ↦ −1` (the generator acts as `z ↦ −z`), the kernel is `{0, 2}` of
  order `2`, the effective reduction is `[ℂ/(ℤ/2)]`, and the principal set is `ℂ ∖ {0}`, where the
  stabilizer is exactly the kernel. Taking the kernel at a point to be its stabilizer would report
  all of `ℤ/4` at `0`.
- On the half-plane `{x ≥ 0}` with `ρ = x`, the shear `(x, y) ↦ (x, y + x)` preserves `ρ`, fixes the
  face `{x = 0}` pointwise and has derivative `Id + N` with `N ≠ 0`, `N² = 0`, yet is not the identity
  germ: it has infinite order. The finite order of isotropy arrows is what forces `N = 0`; a face
  statement without it would be false.

### 2.4 Averaging

Reuse Mathlib's `GroupAlgebra.average`, `Representation.invariants`, `Representation.averageMap`
and `Representation.isProj_averageMap` for finite representations over a coefficient ring in which
the order of the group is invertible, and Tau Ceti's `Representation.IntertwiningMap.map_averageMap`
(an intertwining map commutes with averaging). Prove the change-of-group compatibilities needed
here and exactness of invariants by averaging lifts: if `f` is a surjective intertwining map of
representations of a finite group `G` over a commutative ring in which `|G|` is invertible, every
invariant vector of the target is the image of an invariant vector. Positive
degree cohomology of a finite group vanishes when its order is a unit
(`groupCohomology.subsingleton_of_isUnit_natCard`), with chain-level contraction
`TauCeti.groupCohomology.averagingHomotopy`; consume AlgebraicTopology §8.8's bar and
group-cohomology comparison to state the contraction with the native bar and action conventions.
Invariant smooth partitions of unity for properly discontinuous actions
(`SmoothPartitionOfUnity.exists_isSubordinate_smul_invariant`) and averaged metrics for finite
groups (`TauCeti.averageRiemannianMetric`) are Tau Ceti's; construct their versions on a presentation
from the charts of §2.2. These statements carry their coefficient and order hypotheses; integral
invariants are not claimed to be exact.

Construct affine averaging of connections on a fixed equivariant bundle: after choosing a
connection `∇₀`, differences of connections are `End(E)`-valued one-forms (SmoothBundlesConnections
B3.1), so average the pulled-back connections in this affine space and prove independence of `∇₀`,
invariance, the Leibniz rule and the refinement laws. Mathlib's linear `averageMap` alone is not
this affine construction.

Construct a smooth cutoff function on the objects of every Hausdorff second-countable proper étale
presentation: `c ≥ 0` with `∑_{s(g) = x} c(t(g)) = 1` for every `x` and `s : supp(c ∘ t) → Γ₀` proper.
Use a locally finite saturated cover of the paracompact coarse space and compactly supported bump
functions on object charts meeting every orbit; sum and normalize their translates, and prove
smoothness and local finiteness from the support of the cutoff and properness of `(s, t)`. For
properly discontinuous group actions use Tau Ceti's cutoff
(`TauCeti.MulAction.exists_isCutoff_contMDiff`) and the contraction of group cochains with
coefficients in functions on the space (`TauCeti.groupCohomology.cutoffHomotopy`). Construct the
insertion and averaging contraction of the positive-degree augmented nerve cochain complex of a
presentation, with its restriction and refinement laws. For forms, its kernel in degree zero is
exactly the arrow-invariant forms; keep the nerve pullback and total-complex signs. This global
construction on a proper groupoid is stronger than finite averaging and uses no integration.

*Needs:* §2.2; Mathlib's averaging; Tau Ceti's averaging, group-cohomology, partition, metric and
cutoff statements named above; AlgebraicTopology §8.8; SmoothBundlesConnections B3.1.

**Checks.**
- For `G = ℤ/2` acting on `V = ℤ²` by swapping coordinates, over `ℤ`, the surjection `V → ℤ`,
  `(a, b) ↦ a + b`, onto the trivial representation is intertwining, the invariants of `V` are
  `{(a, a)}`, and their image is `2ℤ`: invariants are not exact over `ℤ`, where `|G| = 2` is not a unit.
  Over `ℚ` the invariant `(1/2, 1/2)` maps to `1`, as the lifting statement asserts.
- For `G` acting on a point, the cutoff is the constant `1/|Γ_x|`, so that the sum over the `|G|` arrows
  with source `x` is `1`; a cutoff normalized as `1` would sum to `|G|`.

### 2.5 Frame bundles and the effective quotient presentation

For each dimension `n`, let `Γ₀^(n)` be the union of all connected components of the object manifold
of dimension `n`, and `Γ^(n)` the full restriction of the groupoid to it, with every arrow between
its objects. Prove that `Γ₀^(n)` is saturated, open and closed, and that `Γ ≅ ⊔_n Γ^(n)` as a
groupoid. Construct an invariant positive metric and the orthonormal frame bundle `E_n → Γ₀^(n)`.
Lift the arrows to `Γ_eff^(n)`, the effective reduction of `Γ^(n)` (§2.3), prove that its action on
frames is free and proper, and construct the smooth quotient `F_n = E_n / Γ_eff^(n)` as a manifold.
The residual right `O(n)` action on `F_n` is proper and locally free (LieGroups Layer 2's smooth
`O(n)`).
Prove that `Γ_eff^(n)` is Morita equivalent to `F_n ⋊ O(n)` and that `F_n / O(n) ≅ |Γ^(n)|`. Assemble
`E = ⊔_n E_n`, `F = ⊔_n F_n` and `|Γ| ≅ ⊔_n F_n / O(n)`; no single `O(n)` acts across components of
different dimensions. For an ineffective presentation this construction is applied to its
effective reduction only, for coarse purposes: the kernel fixes every object frame and cannot be
discarded in the original groupoid, its bundles or its integration. Injectivity of the tangent
representation of an effective finite smooth action and the identification of its kernel with the
germ kernel (Tau Ceti's `TauCeti.injective_tangentRepresentation` and
`TauCeti.ker_tangentRepresentation`) make the effective action on frames free.

*Needs:* §2.1; §2.3; §2.4 (invariant metrics); SmoothBundlesConnections B1.4 (free proper
quotients) and B2.5 (frame bundles); LieGroups Layer 2 (the orthogonal groups).

**Checks.**
- For `ℤ/m` rotating `ℝ²`, `F_2 = (ℝ² × O(2))/(ℤ/m)` and `F_2/O(2) ≅ ℝ²/(ℤ/m)`; `O(2)` acts on `F_2` with
  stabilizer `ℤ/m` over the origin and freely elsewhere. With the ineffective `ℤ/m × ℤ/2` (the second
  factor acting trivially), the frame action is not free, which is why the construction passes to
  the effective reduction.

### 2.6 The coarse diffeology

Use Mathlib's diffeology: `DiffeologicalSpace`, `Diffeology.IsPlot`, `Diffeology.DSmooth`,
`Diffeology.dTopology`, `Diffeology.IsDTopologyCompatible` and `DiffeologicalSpace.ofCorePlotsOn`.
Use Tau Ceti's local theory: the manifold diffeology, whose plots are the smooth maps and
whose D-topology is the manifold topology (`TauCeti.manifoldDiffeology`,
`TauCeti.dTopology_manifoldDiffeology`); the quotient diffeology on a quotient, whose plots are the
maps that locally lift to plots (`TauCeti.Diffeology.isPlot_quotient_iff`), whose projection is a
subduction (`TauCeti.Diffeology.isSubduction_quotient_mk`), with the descent criterion for `DSmooth`
maps out of the quotient (`TauCeti.Diffeology.dSmooth_quotient_lift_iff`) and with D-topology the
quotient topology when the source is D-topology compatible
(`TauCeti.Diffeology.instIsDTopologyCompatibleQuotient`); the products of quotient maps
(`TauCeti.Diffeology.isSubduction_prodMap_quotient_mk`,
`TauCeti.Diffeology.instIsDTopologyCompatibleProdOrbitRelQuotient`); and local finite-quotient charts
for proper smooth actions of discrete groups
(`TauCeti.Diffeology.exists_slice_isInduction_orbitRelQuotientMap_of_contMDiff`). The targets are
open restrictions and common refinements of these models, proving topology compatibility for them
rather than assuming that the D-topology preserves arbitrary products or subspaces. §3.4 constructs
the separate quadrant model.

Glue the finite-chart quotient diffeologies to a diffeology on the coarse space of a presentation.
Prove Morita independence and functoriality for the generalized maps of §1.2, including natural
isomorphisms and compositions. Construct the local identifications with linear quotients for the
effective reduction. Compare this coarse local-model notion with the effective formulation by
finite linear subgroups in Eltschig's diffeological development (References). The comparison
concerns the underlying coarse smooth space; the retained-arrow presentation stays the orbifold
carrier, since identical coarse diffeologies do not determine the ineffective isotropy, its
representations or the weighted integral. Make the comparison in fixed dimension `n`, one
`Γ_eff^(n)` at a time, not on a disjoint union of mixed dimensions.

*Needs:* §1.2; §2.1; §2.2; §2.3; §2.5 (the dimension decomposition); Mathlib's and Tau Ceti's
diffeology statements named above.

**Checks.**
- For `ℤ/2` acting on `ℝ` by `x ↦ −x`, the map `x ↦ x²` descends to a `DSmooth` map on the quotient,
  while `|x|`, also invariant and continuous, does not, because it is not smooth on `ℝ`; a criterion
  asking only for continuity of the descended map would accept both.
- `[*/K]` and the point have the same coarse diffeology, the point, while their integrals of `1` are
  `1/|K|` and `1`: the coarse diffeology does not determine the orbifold.

### Examples

- For the trivial gerbe `K × N ⇒ N`, §2.1 gives charts `K ⋉ B` with `K` acting trivially, §2.3 gives
  kernel `K` and effective reduction `N`, and §2.6 gives `N` with its manifold diffeology.
- For a finite subgroup `G ⊂ O(n)`, the chart of §2.1 at `0` is the given action on a ball, the frame
  construction of §2.5 gives `F_n = (B × O(n))/G`, and the coarse diffeology is the quotient
  diffeology of the ball.

### Dependencies

Layer 1 (§§1.1–1.2; §1.6 for the face statement of §2.3). §2.1 precedes §2.2, which precedes §1.6
and the face part of §2.3. §2.4's cutoff contraction is consumed by §4.9's form comparison. §2.5 and
§2.6 are boundaryless constructions. External: Tau Ceti's topological groupoid, linearization,
germ-kernel, averaging, cutoff and diffeology statements; Mathlib's representation theory and
diffeology; SmoothBundlesConnections B1.4, B2.5 and B3.1; LieGroups Layer 2; AlgebraicTopology §8.8.

## Layer 3: Coarse triangulation, finite covers and boundary models

This layer triangulates the coarse space and builds the locally finite covers and Čech complexes
that Layer 4 uses for descent and Layer 5 for duality. It uses neither descent nor duality: the
triangulation is established first and those comparisons are proved on it.

### 3.1 Triangulating the orbit space of a compact Lie group action

Prove Yang's theorem: if a compact Lie group `K` acts smoothly on a second-countable Hausdorff,
equivalently separable metrizable, smooth manifold `M` without boundary, then the orbit space `M/K`
is triangulable, that is homeomorphic to the realization of an abstract simplicial complex (Tau
Ceti's `TauCeti.IsTriangulable`) (Yang, Bull. AMS 69 (1963), Theorem, p. 407). No hypothesis on the
stabilizers is made. The action is proper because `K` is compact. This is
`isTriangulable_orbitRel_quotient`, stated with Mathlib's `LieGroup`, `IsManifold` and
`ContMDiffSMul` on finite-dimensional real models.

Prove it in the stratified form that §§3.2–3.4 use. For a closed subgroup `H` of `K` let `M_(H)` be
the set of points whose stabilizer is conjugate to `H`, and call the connected components of the
sets `M_(H)/K` the orbit-type strata of `M/K`. The triangulation can be chosen so that every
orbit-type stratum is a union of open simplices, equivalently so that the conjugacy class of the
stabilizer is constant on each open simplex (Verona, Manuscripta Math. 30 (1980), Definition 3.1 and
Corollaries 3.7–3.8, pp. 437–443; Illman, Math. Ann. 262 (1983), §7, p. 499).
`isTriangulable_orbitRel_quotient` states triangulability only, which does not give this (see the
Checks).

The route is Verona's. Yang's own proof rests on a triangulation theorem of Cairns for regular
locally polyhedral spaces that is false (Verona, p. 426; Illman, p. 488), and it is not used here.
SmoothBundlesConnections B1.4's equivariant linear charts and slice theorem give, near each orbit, a
slice on which the compact stabilizer acts orthogonally. Prove from them that only finitely many
orbit types meet each compact set, that the orbit-type strata are smooth manifolds forming a locally
finite stratification of `M/K` with the frontier condition (Yang, Lemma 1, p. 405, and the proof of
the Theorem, pp. 407–408), and construct control data for it, so that `M/K` is a Thom–Mather space in
the sense of AlgebraicTopologyPartII §§16.1a–16.1b, whose strata have dimension at most `dim M`. Then
prove Verona's theorem, a target here in full: every Thom–Mather space whose strata have bounded
dimension has a triangulation in which each stratum is a union of open simplices (Verona, §1, p. 428,
Theorem 3.5 and Corollary 3.7, pp. 440–442). Its proof removes a stratum of least
dimension, triangulates its tube as a mapping cylinder and inducts; the step reduces to
triangulating a smooth fibre bundle compatibly with a given triangulation of its base (Verona,
Lemma 3.4, p. 439, from a theorem of Putz), which is a target here as well and uses
GeometricTopology §11.3's smooth triangulations.

Apply the theorem to each frame action `(F_n, O(n))` of §2.5 and take the disjoint union over
`n`; through `|Γ^(n)| ≅ F_n/O(n)` this triangulates the coarse space of every presentation. The
`O(n)`-stabilizer of a frame over `x` is the image of the effective isotropy group of `x` under its
faithful tangent representation, so the orbit types of the frame action are the conjugacy classes
in `O(n)` of these representations.

*Needs:* SmoothBundlesConnections B1.4 (invariant metrics, equivariant linear charts and slices for
actions of compact Lie groups); AlgebraicTopologyPartII §§16.1a–16.1b (smooth stratified spaces and
control data); §2.5 (for the application to frame actions); GeometricTopology §11.1 (simplicial
complexes, subdivision and geometric realization) and §11.3 (smooth triangulations); Tau Ceti
`TauCeti.IsTriangulable`.

**Checks.**
- For `S¹` acting on `S³ ⊂ ℂ²` by `λ · (z, w) = (λ^a z, λ^b w)`, `a`, `b` coprime positive integers, the
  action is locally free, with stabilizers `ℤ/a` and `ℤ/b` on the two coordinate circles, and the orbit
  space is homeomorphic to `S²`, the boundary of a tetrahedron. For `ℝ` acting freely on the torus by
  an irrational linear flow, every orbit is dense, so the orbit space has the indiscrete topology on
  uncountably many points and is not Hausdorff, hence not triangulable: compactness of `K` is used.
- For `ℤ/m` with `m ≥ 2` rotating `ℝ³` about the `z`-axis, `(w, z) ↦ (w^m/|w|^(m−1), z)`, with
  `w = x + iy`, identifies the orbit space with `ℝ³`; its orbit-type strata are the axis and its
  complement. Composing a linear triangulation of `ℝ³` with the homeomorphism
  `(x, y, z) ↦ (x, y + z², z)` gives a triangulation of the orbit space in which the axis corresponds
  to the parabola `{(0, −t², t)}`. The parabola contains no segment and is uncountable, while the
  vertices are countable, so it meets open simplices of positive dimension of every linear subdivision
  without containing them, and on those the stabilizer jumps between `ℤ/m` and the trivial group:
  triangulability alone does not give the stratified form.

### 3.2 Atlas-subordinate triangulations of the coarse space

Transport the stratified triangulation of §3.1 to `|Γ|`, in which every orbit-type stratum of the
frame actions is a union of open simplices, and construct stellar refinements subordinate to a given
chart atlas (§2.2), which keep that property: every closed simplex and every sufficiently small
closed star lies in a designated chart. Prove that the isotropy group is constant on each open
simplex, that passing to a face gives an inclusion of isotropy subgroups, and that changing charts
conjugates them. Prove that each simplex and each star lifts homeomorphically into its chart,
compatibly with restriction to faces and smaller stars, and lift these to the original, possibly
ineffective, charts with their full groups (Moerdijk–Pronk, *Simplicial cohomology of orbifolds*,
§1.2). Prove that the triangulation is locally finite and that a compact coarse space has finitely
many simplices.

*Needs:* §3.1; §2.2; §2.3 (to pass from effective to full chart groups).

### 3.3 Open-star covers and their Čech complexes

On each coarse component of dimension `n`, construct the locally finite cover by open stars of the
vertices of the barycentric subdivision. It has multiplicity at most `n + 1`. Construct its actual
diagram of intersections and refinements; chart models of every set of the cover; contractible
lifted intersections with equivariant contractions wherever these are used; centred charts fixed by
the isotropy group for the point-local models; and the isotropy maps with commuting restrictions.

Its Čech complexes take products for cochains and direct sums for chains. Fix a total order on the
vertices and use first the cochains indexed by strictly increasing tuples, equivalently the
alternating normalized complex; the multiplicity bound makes it vanish in horizontal degree above
`n`. For cochains indexed by all ordered tuples, repetitions included, construct the
normalization and alternation chain maps and the homotopies between them before applying that
bound. Construct the small-chain augmentations, the homotopies between the complexes of a cover and
of a refinement, and the comparisons with singular and with cellular chains. A compact coarse space
gives a finite cover and a finite CW model.

For an open `U` of the coarse space, apply §§3.1–3.3 again to the restriction `Γ|q⁻¹U`, whose
frame manifold in dimension `n` is the open `O(n)`-invariant part of `F_n`; such a `U` need not be a
subcomplex of the triangulation of `|Γ|`. There is no dimension bound uniform over components of
unbounded dimension, so the construction is made component by component and assembled through the
product and sum decompositions over components. The finite CW model of the coarse space is not a
CW model of `BΓ`, which keeps the integral cohomology of the finite isotropy groups.

*Needs:* §3.2; AlgebraicTopology Layer 3 (small chains and subdivision) and Layer 4 (cellular
chains and their comparison with singular chains).

### 3.4 Face-adapted triangulations and the quadrant diffeology

For the globally collared domains of §1.6, construct triangulations relative to the faces. Use the
compatible collars to form the double of the domain along its labelled faces, a boundaryless
presentation on which the reflections in the faces act and commute with the arrows, and apply the
stratified form of §3.1 to it with these reflections adjoined. A labelled face is the fixed locus
of its reflection. The stabilizer of a frame over a point of the face, in `O(n)` times the group the
reflections generate, contains an element whose component in the reflection group is that
reflection, a property of the orbit type since conjugation does not change that component, and no
stabilizer over a point off the face does; so every orbit-type stratum meeting the face lies in it,
and the face is a union of open simplices (for one face and a compact Lie group acting on a
manifold with boundary, Illman, Math. Ann. 262 (1983), §7, pp. 499–500). Prove that after
refinement every labelled face is a subcomplex, and that a compact domain gives finite CW pairs.
The smoothness statement below is not deduced from §3.1.

Construct the quadrant diffeology on these models: a map from a Cartesian test space is a plot when
it is locally the restriction of a smooth map into the ambient object manifold. Prove that its
D-topology is the given relative topology, and prove the smooth-extension criterion: a map out of a
quadrant model is `DSmooth` exactly when it is smooth in the manifold-with-corners sense of the
charts (for the corner `[0, ∞)^n ⊂ ℝ^n` and for manifolds with corners, Gürer and Iglesias-Zemmour,
Indag. Math. 30 (2019), §2, Theorem 1, and §3, Theorem). Prove the laws for face-preserving gluing,
refinement and finite products. Parameter coordinates carry trivial isotropy, and maps exchanging
faces are excluded.

*Needs:* §1.6; §3.1; §2.6 (the diffeology conventions); GeometricTopology §1.1 (smooth
collars); Mathlib `DiffeologicalSpace`, `DSmooth`, `dTopology`.

### 3.5 Product orientations and face signs

On the products, face restrictions and collar maps of §1.6, construct the outward-normal-first
orientation of each labelled face (DifferentialGeometry §5.1's convention) and the product
orientation of `Γ × [0,1]^k`, with the base first and the box coordinates in their given order, and
prove how these orientations transform when the face indices are relabelled. Prove that the two
induced orientations of each codimension-two face cancel, and compute the signs of the two ends of
an interval factor. The integral Stokes identities that use these signs are §5.2. Reflection strata
of a boundaryless quotient remain singular strata of the coarse space and are not designated
faces. Smooth transverse parameter families (§6.2) use this carrier with its collar hypotheses.

*Needs:* §1.6; DifferentialGeometry Layer 2 (orientations) and §5.1 (the outward-first boundary
orientation).

**Checks.**
- For an oriented `Γ` of dimension `m` and the cylinder `Γ × [0,1]`, oriented base first, the end
  `t = 1` carries `(−1)^m` times the orientation of `Γ` and the end `t = 0` carries `(−1)^(m+1)`
  times it; for `m = 0` this is `∂[0,1] = {1} − {0}`, which is what Stokes needs for
  `∫₀¹ f′ = f(1) − f(0)`. An inward-normal-first convention reverses both signs, and dropping the
  factor `(−1)^m` gives the wrong sign whenever `m` is odd.
- On the square `[0,1]²` each vertex lies on two edges, and the two orientations it receives as a
  boundary point of those edges are opposite, so `∂∂[0,1]² = 0`. Orienting one edge inward-first
  instead makes two of the vertex contributions add up rather than cancel.

### Examples

- For `Γ` the unit groupoid of a manifold, §§3.1–3.3 reduce to a smooth triangulation and its
  open-star cover, with trivial isotropy throughout.
- For `ℤ/m` acting on `ℝ²` by rotations, the coarse space is homeomorphic to `ℝ²`, and the origin is
  an orbit-type stratum by itself, so it is a vertex of every stratified triangulation (§3.1); the
  isotropy group is `ℤ/m` on that vertex and trivial on every other open simplex, since the action
  is free away from the origin.
- For `[*/ℤ/m]` the coarse space is a point, a finite CW complex, while `BΓ` has
  `H²ⁱ(BΓ;ℤ) ≅ ℤ/m` for every `i ≥ 1`: the coarse CW model and the classifying space are kept apart.

### Dependencies

Layer 1 (§1.6 for §§3.4–3.5) and Layer 2 (§§2.1–2.3, 2.5, 2.6). External: SmoothBundlesConnections
B1.4; AlgebraicTopologyPartII §§16.1a–16.1b (Thom–Mather spaces); GeometricTopology §§1.1, 11.1 and
11.3 (collars, simplicial complexes, realization, smooth triangulations); AlgebraicTopology Layers
3–4; DifferentialGeometry Layer 2 and §5.1; Mathlib's diffeology.

## Layer 4: Orbibundles, forms and the classifying-space comparison

The classifying space `BΓ` keeps all the finite isotropy and has, for instance, the integral
cohomology of `BK` over a point `[*/K]`; the coarse space forgets it. This layer builds bundles and
invariant forms on presentations, constructs `BΓ` and its coarse map `q : BΓ → |Γ|`, and proves that
`q` is an isomorphism on cohomology with coefficients `ℚ` or `ℝ`, that invariant forms compute the
real cohomology of `BΓ`, and that Chern–Weil forms of orbibundles represent the characteristic
classes of their represented bundles on `BΓ`. The sections carry the letters O4-N, O4-S, O4-P, O4-R,
O4-K, O4-W and O4-T by which other roadmaps cite them.

### 4.1 Orbibundles

Define real and complex orbibundles of finite rank, and principal orbibundles, as ordinary smooth
bundles on the objects with a smooth action of the arrows, coherent with composition and units.
Construct pullbacks along refinement spans and generalized maps (§1.2), tensor products, duals and
exterior powers, metrics, connections, sections, and their invariance under Morita equivalence.
The fibres carry nontrivial representations of the ineffective kernel. The coarse total space
need not be a vector bundle, and the invariant sections need not contain an invariant local frame.
Construct invariant connections from ordinary local frames, SmoothBundlesConnections B3.1's affine
action and existence of connections, §2.4's finite averages and invariant partitions of unity,
without assuming such frames. Use SmoothBundlesConnections B4.1 for curvature, the Bianchi identity
and pullback of connections; the descent equations on the orbifold are proved here.

*Needs:* §1.2; §2.4; SmoothBundlesConnections B2 (associated bundles and fibre metrics), B3.1 and
B4.1.

**Checks.**
- Over `[*/(ℤ/2)]`, the sign representation on `ℝ` is an orbibundle with no nonzero invariant
  section, so its invariant sections contain no frame, although the bundle on the single object is
  trivial; a definition requiring invariant local frames would exclude it.

### 4.2 Invariant forms

Define the invariant forms of a presentation as the forms `ω` on `Γ₀` with `s^*ω = t^*ω` on the arrow
manifold, with the exterior derivative, wedge product, contractions where defined and pullbacks of
the underlying manifold (DifferentialGeometry Layers 0–1). For action groupoids of discrete monoids
these forms are Tau Ceti's `TauCeti.ActionGroupoid.invariantForms`, with their exterior derivative,
wedge products and pullbacks. Prove Morita descent and the chain-level maps. Supports are measured
in the coarse space. A pullback of compactly supported forms requires the displayed coarse map to be
proper on the relevant support. Construct extension by zero of compactly supported forms from open
suborbifolds, restriction, the relative complexes, Mayer–Vietoris and their support maps. For the
map from `ℝ` to a point, pulling back the function `1` does not preserve compact support, so no
compact-support statement for arbitrary maps is used.

*Needs:* §1.2; DifferentialGeometry Layers 0–1 and 7 (Mayer–Vietoris); Tau Ceti's invariant forms
on action groupoids.

**Checks.**
- For `[ℝ/(ℤ/2)]` with `x ↦ −x`, the invariant 0-forms are the even functions and the invariant
  1-forms are `g(x) dx` with `g` odd; `d(x²) = 2x dx` is invariant, and `dx` is not. Testing
  invariance only along the identity arrows would keep `dx`.

### 4.3 The fat classifying model (O4-N)

The classifying space `BΓ` is Tau Ceti's `TauCeti.fatClassifyingSpace`: the fat realization
(`TauCeti.fatRealization`) of the topological nerve `TauCeti.topologicalNerve`, whose space of
`p`-simplices is the space of strings of `p` composable arrows with its inherited topology and whose
face maps are the actual ones. Define the coarse map `q : BΓ → |Γ|` by sending a point of a simplex to
the orbit of any of its vertices; for action groupoids it is Tau Ceti's
(`TauCeti.ActionGroupoid.coarseMap`). For a saturated open `U ⊆ |Γ|`, prove that `q⁻¹(U)` is exactly
the fat realization of the nerve of the full restriction `Γ|U`, as a subspace with the same quotient
topology, from Tau Ceti's criterion for levelwise open embeddings
(`TauCeti.fatRealization.isOpenEmbedding_map_of_range_eq_preimage`). This open-restriction equality
is the primary statement.

Consume §4.9's good-degeneracy (NDR) lemmas for these manifold nerves, the canonical weak
equivalence from the fat to the thin realization and the comparison with the realization of the
diagonal of the objectwise singular complex, and apply their naturality, product and
realization-of-diagonal laws to the fat model and its coarse restriction maps. A realization of a
discrete nerve is not substituted for these manifold nerves.

Prove realization descent for the Čech nerve of a numerable surjective submersion: from local
sections, a subordinate locally finite partition of unity and the barycentric contraction,
construct the weak equivalence of the augmentation and its homotopies. Apply the comparison of
bisimplicial realizations to common refinements of principal bibundles, including the auxiliary
Lie groupoids of pullbacks along submersions that they require, and obtain weak equivalences for
Morita equivalences with coherence for refinement and composition. The auxiliary groupoids need
not be étale; the good-degeneracy and numerability hypotheses of their nerves are proved here for
exactly this use. Compare a finite-action chart with the Borel construction `EG ×_G U`: for every
invariant contractible `U`, the projection `EG ×_G U → BG` is a weak equivalence, its fibre being
contractible, by the fibration comparison constructed here. A point `x` fixed by `G` with an
equivariant contraction to `x` is a sufficient local model; it moreover identifies `G` with `Γ_x`
and gives an equivalence with `BΓ_x`. No converse about fixed points is used.

*Needs:* §1.2; §4.9 (the generic fat/thin comparison block only); Tau Ceti's fat realization,
topological nerve and open-restriction criterion; AlgebraicTopology §4.7.

**Checks.**
- For the unit groupoid of a manifold `M`, every string of composable arrows is a string of
  identities, and `BΓ` is the fat realization of the constant simplicial space `M`, which is
  homotopy equivalent to `M`, and `q` is that equivalence; the thin realization is `M` itself. For
  `[*/K]`, the nerve is the bar construction, `BΓ ≃ BK`, and `q` is the map to a point.

### 4.4 Locally finite descent and the rational comparison (O4-S)

On every coarse component of dimension `n` and every open subset, apply §3.3's locally finite
open-star construction of bounded multiplicity to that restriction, using full restricted
subgroupoids and the actual preimage maps of §4.3. Form the two augmented Čech–singular cochain
double complexes, with products over strictly increasing intersections, horizontal degrees `0`
through `n` after §3.3's normalization, and total differential `d_tot = δ + (−1)^p d`. Construct the
small-chain and subdivision augmentations, the maps for common refinements and the cochain
homotopies. The finite horizontal filtration proves the quasi-isomorphisms without any cohomology
of an exhaustion or inverse limit. Local finite-group averaging (§2.4) and the centred contractions
of §3.3 identify `q^*` on each local cohomology group over `ℚ` and `ℝ`. Prove the ring isomorphism
(for `ℚ`, Moerdijk, *Orbifolds as Groupoids*, §4.4, p. 12)

    q^* : H*(|Γ|; R) ≅ H*(BΓ; R),   R = ℚ or ℝ,

and the corresponding comparison of chains and homology, using direct-sum totalizations of chains
rather than a shortcut through coefficient duality. Prove compatibility with cup products and the
Alexander–Whitney map, with total product sign `(−1)^(q p′)`. Apply the same theorem to `|Γ| ∖ K` for
every closed `K`, and the long exact sequences of pairs with the five lemma, to obtain the relative
isomorphism for `(|Γ|, |Γ| ∖ K)`. Where dimensions vary, apply the product and sum decompositions over
components. This finite-atlas descent uses AlgebraicTopology's generic chains; its local and
comparison steps are proved here.

*Needs:* §3.3; §4.3; §2.4; AlgebraicTopology Layers 2–3 (relative chains, small chains,
Mayer–Vietoris) and §5.1 (Eilenberg–Zilber and Alexander–Whitney).

**Checks.**
- For `[*/K]`, `H*(BK; ℚ)` is `ℚ` in degree `0` and zero above, matching the coarse point; with `ℤ`
  coefficients `H²(B(ℤ/2); ℤ) = ℤ/2` while the point has none, so the theorem fails integrally, as the
  restriction to `ℚ` and `ℝ` says.

### 4.4a Collared pairs (O4-P)

For every carrier of §1.6, construct the actual map of pairs `q_D : (BΓ_D, BΓ_∂D) → (|D|, |∂D|)` and
prove that it induces isomorphisms on homology and on cohomology over `ℚ` and `ℝ`, and with the
descended orientation coefficients under the local-orientability hypothesis of Convention 7. Use
§3.4's face-adapted star covers on `D` and on the closed union of faces, their intersection maps
and §1.6's comparison of closed faces with their NDR realizations. The lifted intersections and
their restrictions to boundary stars have the contractible or averaged-acyclic finite-action
models constructed there. The same finite horizontal augmentations give both absolute
comparisons; then apply the natural long exact sequence of the pair and the five lemma. Construct
the compatibilities with the boundary map, cup and cap products, refinement and all labelled
faces. This is a theorem about the closed pair, not an application of the saturated-open
equality of §4.3. §2.3's equality of ambient and face kernels gives the same `k` on the boundary
and in the interior, as every later weighted boundary equation uses.

*Needs:* §1.6; §2.3; §3.4; §4.3; §4.4.

### 4.5 Forms and descent (O4-R)

On the covers of §4.4, construct the Čech double complex of invariant forms, the finite averaged
Poincaré contractions on the sets of the cover and the homotopies built from locally finite
partitions of unity. Use Tau Ceti's invariant Poincaré lemma: on an open star-convex set
invariant under a group acting by a continuous linear representation, a closed invariant form of
positive degree is the exterior derivative of an invariant form
(`StarConvex.exists_invariant_contDiffOn_forall_extDeriv_eq`; for a finite group on a convex set,
`Convex.exists_invariant_contDiffOn_forall_extDerivWithin_eq`). Construct the zigzag from invariant
forms to the Čech complex of constants and to §4.4's singular cochains, with actual maps, products,
and homotopies for common refinements and pullbacks. Use the bounded horizontal filtration on
noncompact opens as well. When forms on the manifold nerve are used, construct levelwise
integration over smooth singular simplices and its comparison through realization and
Eilenberg–Zilber. A singular simplex of the coarse space is not assumed to lift globally to a
smooth one. The result is the orbifold de Rham isomorphism `H*(Ω_inv(Γ)) ≅ H*(|Γ|; ℝ) ≅ H*(BΓ; ℝ)`,
compatible with products; §4.9 proves the same isomorphism on the nerve and compares the two.

*Needs:* §4.2; §4.4; §2.4; DifferentialGeometry §§8.4–8.5 (integration over smooth simplices and the
de Rham theorem); Tau Ceti's invariant Poincaré lemmas.

**Checks.**
- For `ℤ/m` rotating `ℝ²`, the invariant de Rham complex has cohomology `ℝ` in degree `0` and zero
  above, as does the disc `ℝ²/(ℤ/m)`; for the free quotient `S¹ = ℝ/ℤ` presented by `ℤ ⋉ ℝ`, the
  invariant 1-form `dx` is closed and not the derivative of an invariant function, giving
  `H¹ = ℝ`, as for the circle.

### 4.6 Relative pairs, coarse-compact supports and the orientation line

Relative pairs use the collared domains of §1.6 and Layer 3. Define cohomology with
coarse-compact support on the classifying space by

    H*_{c,q}(BΓ; R) = colim_{K ⊆ |Γ| compact} H*(BΓ, BΓ ∖ q⁻¹K; R),

with the actual relative restriction maps. §4.4 proves `q^*` for each closed `K` before this colimit
over compact `K` is taken. For fixed `K` the form model is the mapping fibre complex
`Cone(Ω_inv(X) → Ω_inv(X ∖ K))[−1]`, with its native cone and shift signs and its comparison map to
relative cochains; it is not the complex of smooth forms supported in `K`. Construct these maps for
every `K`, then the colimit over compact `K` and its comparison with compactly supported invariant
forms, by partitions of unity and extension by zero. Prove all the squares for enlargement of
supports, restriction and pullback along maps proper on supports. The map `q` need not be proper,
and this is not ordinary compact support on `BΓ`. A pullback with compact supports requires the
displayed coarse map to be proper on that support. Products of full cochains and sums of compact
supports are kept apart, and no exchange of the cohomology of an exhaustion with a limit is part of
this construction. For locally orientable presentations (Convention 7) construct the descended
coarse orientation line, a rank-one local system on `|Γ|` whose pullback to `BΓ` is identified with
the orientation local system, and the same comparisons with these coefficients; the hypothesis
that isotropy acts trivially on orientations is kept throughout.

*Needs:* §1.6; §3.3; §4.2; §4.4; §4.5.

### 4.7 The represented bundle (O4-K)

From an orbibundle (an arrow-equivariant bundle on `Γ₀`), construct the actual topological vector or
principal bundle `E_B → BΓ`, from the pullbacks to the vertices of the nerve and the identifications
along arrows. Prove local triviality and numerability on the fat realization through the covers by
local sections and barycentric coordinates, compatibility with the comparison to the diagonal
singular model of §4.9, and the laws for pullback, refinement and Morita equivalence. Nontrivial
representations of the ineffective kernel remain in `E_B`. Consume TopologicalKTheory's numerable
bundles and classifying maps and CharacteristicClasses' ordinary characteristic classes on this
represented bundle. State precise
conditions for a bundle on `BΓ` to descend to a coarse bundle; a rational cohomology isomorphism
alone is not descent.

*Needs:* §4.1; §4.3; §4.9 (the diagonal model); CharacteristicClasses C1.1b; TopologicalKTheory T1.1
and T1.6.

### 4.8 The simplicial Chern–Weil comparison (O4-W)

For an invariant connection on an orbibundle, pull the bundle back to each vertex of `N_pΓ` and use
the actual bundle isomorphisms along composite arrows to identify these pullbacks with the pullback
to vertex `0`. On `Δ^p × N_pΓ` form the barycentric affine connection `∑_i t_i ∇_i` (SmoothBundlesConnections
B3.1 and B4.1). For an invariant connection the arrow isomorphisms identify every `∇_i` with `∇_0`,
and the barycentric connection is constant in the simplex directions. Prove compatibility with every
face and degeneracy, including the gauge transformation at vertex `0`, and apply CharacteristicClasses
C4.1's invariant polynomials to its curvature. Construct the Chern–Simons forms of a change of
connection and their face, degeneracy and higher-parameter transgression identities. Integrate over
oriented simplices to the total complex, with §4.4's differential and product signs, and compare with
singular cochains.

Construct the numerable classifying map of `E_B` to the stable ordinary classifier. On each component
of fixed object dimension and bundle rank, choose Stiefel or Grassmann stages `N(p)` on its
finite-dimensional simplicial cover, growing with `p` and, where needed, with the finite subdiagram
under comparison. Construct classifying maps to finite stages and comparisons of connections, using
the finite-dimensional paracompact cover and its order bound, relative extension over faces and
common refinements; prove their compatibility with stabilization, faces, degeneracies and higher
concordances. No single finite universal bundle is asserted to classify `E_B` over the whole infinite
realization. Apply CharacteristicClasses C4.3's universal Chern–Weil map in each degree, with its
stable compatibility, and the explicit affine transgression to prove that the resulting total class
is the pullback of the ordinary universal characteristic class. This section owns the bridge from
the simplicial construction to the universal one; it is not deduced from agreement on small charts.
Prove the refinement, Morita, product and support-compatible laws. Integral characteristic classes
and representations of the kernel remain in `E_B` even when their real Chern–Weil images vanish.

*Needs:* §4.1; §4.4; §4.7; SmoothBundlesConnections B3.1 and B4.1; CharacteristicClasses C4.1 and
C4.3.

**Checks.**
- For the line bundle of a nontrivial character `χ` of a finite group `K` over `[*/K]`, every invariant
  connection is flat (the object is a point), so all Chern–Weil forms vanish, while the first Chern
  class of `E_B` is a nonzero torsion class in `H²(BK; ℤ)` (§7.1): the real comparison holds, and the
  integral class is not seen by forms, as stated.

### 4.9 Thin and diagonal models and the fat–thin comparison (O4-T)

§§4.9–4.9c treat Hausdorff second-countable proper étale presentations, ineffective isotropy
included, together with the globally collared corner models of §1.6, their labelled faces and
intersections, and the closed restrictions to unions of faces. §4.3 constructs the primary fat
carrier and its coarse restriction maps first; this section then constructs the comparison of
good-degeneracy (proper simplicial) spaces on the underlying nerves, and §4.3 consumes the
resulting natural comparison maps. Three models are kept distinct: the fat realization
`B_fat(S) = BΓ` of §4.3, the thin realization `B_top(S)` and the diagonal singular CW model `BS`
below. The later supplement on local contractibility, sheaves, forms and principal torus bundles
(§§4.9a–4.9c) is stated for boundaryless nerve manifolds, and separately for the torus bar spaces;
its singular, cohomology and form maps are compared with §§4.4–4.5's by actual cochain homotopies.
The finite-star argument of §4.4 does not depend on this later route, so the early fat carrier,
this generic comparison and the boundaryless supplement are distinct steps.

For a presenting proper étale groupoid `S` construct its topological nerve `N•S`: `N_pS` is the space of
composable `p`-tuples with its manifold, or subspace, topology. Work in the compactly generated
category of AlgebraicTopology §4.8, with its coreflection, products, mapping spaces and sequential
colimits; no second carrier of compactly generated spaces is defined. Define the thin realization
`B_top(S) = |N•S|` in compactly generated spaces and its coarse map `q : B_top(S) → |S|`. For every
saturated open `V ⊆ |S|` prove the identity `q⁻¹(V) = B_top(S|V)`. This identity is not asserted for
preimages under the diagonal model below.

Apply the singular functor levelwise. It preserves the fibre products that define the nerve, which
identifies its levels with the singular nerve levels; the resulting bisimplicial set is `Sing(N•S)`,
and `D = diag Sing(N•S)`. Set `BS = |D|` with AlgebraicTopology §4.7's realization and CW structure.
Define the natural simplicial map `ε₀ : D → Sing(B_top(S))` sending an `n`-simplex `σ : Δⁿ → N_nS` to
`t ↦ [σ(t), t]`, prove the face and degeneracy identities, and prove that its realization
`ε : BS → |Sing(B_top(S))|` is a weak equivalence, by identifying the realization of the diagonal of a
bisimplicial set with its iterated realization. Prove the lemma on proper simplicial spaces used
here: realization preserves levelwise weak equivalences between simplicial spaces in which each
latching inclusion `L_nX → X_n` is a closed cofibration in compactly generated spaces. For `N•S`,
`L_nS` is the finite union of the degeneracy images; each degeneracy inserts a unit arrow, and the
units form a set that is open by étaleness and closed by Hausdorffness, so `L_nS` is clopen and
`L_nS → N_nS` is a closed cofibration. For `p ↦ |Sing(N_pS)|` the latching object is the finite
union of the degeneracy-image subcomplexes, and its inclusion is the inclusion of a subcomplex.
Apply CharacteristicClasses C1.2b's theorem that the counit `|Sing X| → X` is a weak equivalence
levelwise to `N_pS`. These generic fat–thin and diagonal comparisons apply to the collared corner
and face models above, with their relative pairs, independently of §§4.9a–4.9c, and they export
compatibility with the collars, closed faces, products, saturated restrictions and refinements;
the clopen latching argument holds for the face restrictions as well, and this block uses no local
stalk or sheaf lemma.

Prove the same comparison after restriction to every saturated open `V`, under the same properness
hypotheses; both source models being CW complexes, the comparison is a homotopy equivalence by
Whitehead's theorem. The orbit projection on each `N_pS` induces `D → Sing(|S|)`; its realization
followed by the counit defines `p : BS → |S|`, and `p = q ∘ c ∘ ε` on the nose, where
`c : |Sing(B_top(S))| → B_top(S)` is the counit. For the local argument use `q⁻¹(V) = B_top(S|V)` and the
restricted weak-equivalence square; `p⁻¹(V)` is not identified with `|diag Sing N•(S|V)|` without a
comparison for small singular simplices.

Prove the comparison of presentations and Morita equivalences for this model by the double nerve of
an atlas refinement or a Morita bibundle: its augmented Čech resolutions have local sections and
numerable covers. Prove that they realize to equivalences by the theorem on augmented numerable Čech
resolutions, and compare the double and single nerves by diagonal and iterated realization. A
levelwise covering map alone is not a weak equivalence. State and prove the local hypotheses used:
properness, étaleness, Hausdorff second-countable object and arrow manifolds and numerable atlas
refinements. Since `Sing` preserves the fibre products defining `N_pS`, `D` is also the diagonal nerve
of the simplicial groupoid `Sing(S)`; this is the model `BG = δ*(NG)` of van den Berg and Moerdijk
(*Univalent completion*, §2.3). These groupoid adapters are targets here, not assumed realization
interfaces.

Use ordinary singular cohomology (AlgebraicTopology §6.1). Prove the bisimplicial Eilenberg–Zilber
theorem: for `Y_{p,q} = Sing_q(N_pS)`, construct the natural Alexander–Whitney and shuffle maps between
the normalized chains of `diag(Y)` and the total complex of the normalized bicomplex, and prove that
they form a chain homotopy equivalence (Tau Ceti defines the bisimplicial Alexander–Whitney map
`CategoryTheory.SimplicialObject.diagAlexanderWhitney`). Its cohomological spectral sequence has
`E₁^{p,q} = H^q(N_pS; R)` and converges in each degree to `H^{p+q}(BS; R)`; prove convergence of this
first-quadrant spectral sequence and its product and naturality statements. This is the comparison
with the total complex that replaces an unsupported direct descent over `|S|`.

*Needs:* §1.6; §4.3; AlgebraicTopology §§4.7–4.9, 5.1 and 6.1; CharacteristicClasses C1.2b; Tau Ceti's
bisimplicial Alexander–Whitney map.

**Checks.**
- For `S = [*/K]`, `N_pS = K^p` is discrete, `L_pS` is the set of tuples with some entry `1`, open and
  closed, `B_top(S)` is the bar realization of `BK` and `BS` is the realization of the diagonal of the
  levelwise constant bisimplicial set, again a model of `BK`; the comparison `ε` is a homotopy
  equivalence of `K(K, 1)` spaces. For a non-Hausdorff arrow space the unit set need not be closed
  and the latching inclusions need not be cofibrations, which is why Hausdorffness is assumed.

### 4.9a The topology of nerve realizations (O4-T)

Prove a topology lemma for every proper étale Lie groupoid whose object and arrow spaces are
Hausdorff second-countable manifolds, and apply it to `S`, to every restriction `S|V`, to the finite
action groupoids `G ⋉ B` of §4.9b, to the action groupoid `S ⋉ P` of §4.9c, to the countable atlas
refinement `S[U]` and to `S[U] ⋉ P|U`; prove the last two eligible by the base-change square of
proper maps and the countable atlas. The étale lemma is not applied to the one-object groupoid of a
torus `T`, whose source map is not étale when `dim T > 0`; the torus bar realizations have their
separate argument below.

*Paracompactness.* Give `B_top(S)` its weak compactly generated realization topology and prove it
paracompact Hausdorff through the skeletal filtration. Write each skeletal stage as the pushout
`X_n = X_(n−1) ∪_{f_n} Y_n`, with `Y_n = N_nS × Δ^n` and closed attaching subspace
`A_n = (L_nS × Δ^n) ∪ (N_nS × ∂Δ^n)`; as in §4.9, `L_nS` is clopen, so the nondegenerate locus is clopen
too, which the boundary collars below need. The second-countable Hausdorff manifold `N_nS` times the
compact simplex is normal and Lindelöf, and `A_n` is closed. Prove the pushout lemma: if `X` and `Y` are
normal T1, `A ⊆ Y` is closed and `f : A → X` is continuous, then `X ∪_f Y` is normal T1 and `X` embeds in it
as a closed subspace. For disjoint closed `F`, `G` in the pushout, choose a Urysohn function on `X` that is
`0` on `F ∩ X` and `1` on `G ∩ X`; on the closed subset `A ∪ F_Y ∪ G_Y` of `Y`, paste its composite with
`f` with the values `0` on `F_Y` and `1` on `G_Y`, check agreement on overlaps from `F ∩ G = ∅`, and
extend by Tietze to `Y`; this gives a continuous separating function on the pushout. Prove the closed
embedding and T1 statements directly from the pushout topology. So every stage is normal T1.

Prove the weak-colimit version. The raw skeletal colimit is normal T1: for disjoint closed `F`, `G`,
construct compatible functions `X_n → [0, 1]` that are `0` on `F ∩ X_n` and `1` on `G ∩ X_n`, extending at
each step from the closed subset `X_n ∪ (F ∩ X_(n+1)) ∪ (G ∩ X_(n+1))` of the next normal stage by Tietze;
the prescriptions agree on overlaps and the weak final topology makes the resulting function
continuous. The colimit is Lindelöf, as a quotient of the countable coproduct of the Lindelöf spaces
`Y_n`. Compact subsets of the raw colimit lie in a finite stage: otherwise choose distinct points `x_n`
of the compact set outside `X_n`, along increasing stage indices; each stage meets this set, and each
of its subsets, in finitely many points, hence in a closed set by T1, so the weak topology makes the
chosen set closed and discrete, contradicting compactness. Since the stages are k-spaces, this
criterion proves that the raw weak topology is already compactly generated, so the compactly
generated realization is this normal Lindelöf T1 space. Normal T1 gives regular and Hausdorff, and
a regular Lindelöf space is paracompact (Tau Ceti's
`TauCeti.paracompactSpace_of_regularSpace_lindelofSpace`), so the realization is paracompact
Hausdorff.

Give the same closed-attachment and colimit proof for the torus bar realizations of §4.9c, whose
levels are compact Hausdorff manifolds with closed latching inclusions; this proves them
paracompact Hausdorff, without a collar of their union of degeneracy subtori and without local
contractibility of the torus bar space.

*Local contractibility.* For the eligible étale nerves construct small neighbourhoods by collars.
Given a point and an open neighbourhood `W` of it in the realization, prove inductively that each
finite stage has a contractible neighbourhood of the point inside `W ∩ X_n`, starting from manifold
chart neighbourhoods and using the boundary collars of nondegenerate simplices at each attachment.
Pull this neighbourhood back along every later attaching map; use paracompactness and a partition
of unity on each attaching locus to choose a positive continuous collar depth, so that every
extension stays inside `W` and over the preceding contractible neighbourhood. Group all collar
branches under the inherited neighbourhood; the nondegenerate locus being clopen, the ordinary
collars of simplex boundaries apply. Prove that the resulting recursive neighbourhood is open in the
weak topology and lies in `W`. Contract each collar to the neighbourhood of the preceding stage, then
contract there, and concatenate the stagewise contractions on the intervals `[2^(−n−1), 2^(−n)]`. For
continuity work in compactly generated spaces: since `[0, 1]` is locally compact Hausdorff,
`− × [0, 1]` is left adjoint to the compact-open mapping-space functor and preserves colimits, so the
canonical comparison `(colim X_n) × [0, 1] ≅ colim (X_n × [0, 1])` is a homeomorphism, by AlgebraicTopology
§4.8's compactly generated products applied to the skeletal diagram (not an ordinary formula for
final topologies of products). Define the stagewise homotopies compatibly on the skeletal inclusions
with matching endpoints, check that each restriction to a finite stage is continuous and constant
near the accumulating parameter value `t = 0`, and conclude continuity of the induced homotopy.
This proves local contractibility under the stated hypotheses.

*Needs:* §4.9; AlgebraicTopology §4.8 (compactly generated products and colimits) and §4.7
(paracompactness of CW complexes); Mathlib's Urysohn lemma and Tietze extension theorem for normal
spaces; Tau Ceti's `TauCeti.paracompactSpace_of_regularSpace_lindelofSpace`.

### 4.9b The rational coarse comparison and the orbifold de Rham theorem on the nerve (O4-T)

For rational coarse cohomology take saturated open slice neighbourhoods `V` with `S|V` Morita
equivalent to a finite group `G` acting linearly on a ball `B` (§2.1). Prove the homeomorphism
`B_top(G ⋉ B) ≅ EG ×_G B` of the action groupoid with the Borel construction, by identifying
`N_n(G ⋉ B) = G^n × B` with the diagonal quotient of `E_nG × B`, `E_nG = G^(n+1)`. The radial contraction
of `B` is `G`-equivariant, so `EG ×_G B ≃ BG`, and finite-group averaging gives `H^j(BG; ℚ) = 0` for
`j > 0` and `H^0 = ℚ`. The quotient `B/G` is radially contractible too, but it is not the model for the
stalk of `B_top(S)`. The required stalk calculation is

    H_sing^j(B_top(S|V); ℚ) ≅ H^j(B(S|V); ℚ) ≅ H^j(B(G ⋉ B); ℚ) ≅ H^j(EG ×_G B; ℚ),

through the restricted realization–counit comparison and the Morita invariance of cohomology; it is
`ℚ` for `j = 0` and zero for `j > 0`, ineffective finite isotropy included. Paracompactness and local
contractibility of `B_top(S)` come from §4.9a; the finite-isotropy slice models compute cohomology
stalks only and give no topology of the whole realization.

Construct a countable numerable saturated basis of slices of `|S|`. This section owns the local stalk
calculation on the realization of the original groupoid, the resolution of the constant sheaf by
singular cochains and its acyclicity there, and the derived direct image and Leray argument for
`q : B_top(S) → |S|`. CharacteristicClasses C1.2b supplies the Čech–singular comparison and the locally
acyclic resolution by singular cochains on a Hausdorff space of CW type; that CW-type hypothesis does
not transfer stalkwise local acyclicity to the original groupoid space, so verify the comparison
hypotheses on both spaces and apply the generic comparison only after the local stalk and topology
arguments. Construct the Leray spectral sequence of `q` from the derived direct image of the constant
rational sheaf; the slice basis computes the stalks of `R^j q_* ℚ`: `ℚ` in degree `0` and zero for `j > 0`.
With the sheaf–singular comparison on both spaces the Leray sequence gives
`q^* : H*(|S|; ℚ) ≅ H*(B_top(S); ℚ)`, ineffective isotropy included. A Čech spectral sequence is used
only for a cover all of whose finite intersections have been proved to keep the slice model, and
`p⁻¹(V)` is not identified with a restricted diagonal realization. Applying CharacteristicClasses
C1.2b's counit theorem to `c : |Sing(B_top(S))| → B_top(S)`, together with `ε` and the rational coarse
comparison, proves that `p^* = (q ∘ c ∘ ε)^*` is an isomorphism.

For the orbifold de Rham theorem on the nerve, let `Ω^q(S) = Ω^q(S₀)^S` be §4.2's complex of invariant
forms and form the bicomplex `C^{p,q} = Ω^q(N_pS)`, with horizontal differential the alternating sum of
the nerve pullbacks, vertical differential the de Rham differential, and total differential
`d_h + (−1)^p d_v` on bidegree `(p, q)`. Consume §2.4's cutoff and its explicit averaging contraction of
the augmented nerve, with the same counting-measure convention; check its naturality for
restriction and refinement along the nerve maps used here and the bidegree and total-complex
signs; its kernel in degree zero is the complex of invariant forms `Ω^q(S)`. Vertically, consume
DifferentialGeometry §§8.4–8.5's integration over smooth simplices, Stokes, de Rham theorem and
smooth-to-continuous singular comparison on each `N_pS`; check that the face maps are smooth and
assemble DifferentialGeometry's natural comparison into this bicomplex, without reproving the
manifold de Rham theorem. Compare the resulting total complex with the singular-cochain total
complex of §4.9 by this levelwise comparison and the bisimplicial Eilenberg–Zilber theorem. This
proves `H*(Ω(S)) ≅ H*(BS; ℝ)`. This section owns the assembly of the bicomplex, the averaging
contraction on the proper groupoid, products and naturality for atlases and Morita equivalences;
invariant partitions of unity and finite-isotropy averaging remain explicit parts of these proofs.

*Needs:* §2.1; §2.4; §4.2; §4.9; §4.9a; CharacteristicClasses C1.2b; DifferentialGeometry §§8.4–8.5;
Mathlib's sheaf cohomology and derived functors where the Leray argument uses them.

**Checks.**
- For `G = ℤ/2` acting on `B = (−1, 1)` by `x ↦ −x`, `N_n(G ⋉ B) = (ℤ/2)^n × B`, and `EG ×_G B` is a bundle over
  `BG = ℝP^∞` with contractible fibre, with rational cohomology `ℚ` in degree `0` only, like the stalk of
  the coarse space `[0, 1)`; with `𝔽₂` coefficients it is `𝔽₂[w]`, nonzero in every degree, so the
  rational hypothesis is used.

### 4.9c Principal torus bundles and their classifier (O4-T)

Fix a compact connected abelian Lie group `T` with a given continuous isomorphism `T ≃ (S¹)^m`,
`m ≥ 0`, given by a basis of characters. Prove independence of the choice of basis and naturality for
the specified torus homomorphisms. ConvexityToric's applications take this datum from their own
character lattice; no theorem on periods or isogenies is proved here, and §4.7's general
represented bundle is unchanged.
The fat principal `T`-bundle and the thin bundle below are compared by the canonical equivariant nerve
map: once both are proved locally trivial, its map into the pullback over the same base is an
isomorphism of principal bundles, so pulling back to `BS` gives the same represented bundle and the
same integral character classes. No general theorem on pullbacks of realizations is assumed. Where
dimensions vary, apply the construction componentwise with the countable coproduct and product
laws for cochains. The horizontal form contraction uses §2.4's cutoff on proper groupoids with
counting Haar measure. None of these generic constructions uses an input from ConvexityToric or
HamiltonianReduction, which apply them to their own presentations and character data.

*The transition functor.* For an orbifold principal torus bundle `P → S`, choose a countable numerable
cover `U → S₀` by trivializing charts and form the refinement `S[U]`, with objects `U` and arrows
`U ×_{S₀} S₁ ×_{S₀} U`, its source, target and composition induced by those of `S`. The chosen local
sections `s_i` give the continuous transition functor `F : S[U] → T` to the one-object groupoid of `T`:
for an arrow represented by `(g, u₀, u₁)`, define `F` by the unique equation
`g · s_i(u₀) = s_j(u₁) · F(g, u₀, u₁)`, the left `S`-action commuting with the right `T`-action. Prove
continuity and `F(g₂ g₁) = F(g₂) F(g₁)` for composable arrows.

Prove that `B S[U] → BS` is a weak equivalence by the double-nerve and Morita argument of §4.9; `U → S₀`
is not itself a levelwise weak equivalence. Use the theorem on numerable Čech resolutions of a map
with local sections: the augmented Čech nerve realizes to a homotopy equivalence, proved with the
partition-of-unity contraction or with the contractible fibre nerve and an extra degeneracy; compare
the double nerve with the two groupoid nerves by diagonal and iterated realization. This gives a
homotopy equivalence of the CW models. Let `φ : S[U] → S` be the projection and
`Bφ = |diag Sing(N•φ)|`. The classifier `κ` defined below is intrinsic; the bundle comparison below and
CharacteristicClasses C1.1b's uniqueness show that the class of the transition-functor classifier
`κ_ref` does not depend on the refinement, including comparisons through common refinements.

*The bundle on the thin realization.* Let `S ⋉ P` be the action groupoid and `E_S = |N•(S ⋉ P)| → B_top(S)`.
Prove that `S ⋉ P` is proper étale with Hausdorff second-countable object and arrow manifolds: its
source is the pullback of the étale source of `S`, and properness follows by pulling compact
source–target data back along `P → S₀`. Apply §4.9a to `E_S` and `B_top(S)`. The levelwise quotient
`N_n(S ⋉ P)/T ≅ N_nS` is canonical; prove that the quotient commutes with the realization colimit in
compactly generated spaces, so `E_S/T ≅ B_top(S)`, and that the induced `T`-action is free.

Prove that `E_S → B_top(S)` is a numerable principal `T`-bundle by an explicit torus argument, separate
from the étale-nerve lemma. `E_S` is paracompact Hausdorff, hence normal. Each orbit `eT` is closed and
isomorphic to `T`. In the character basis `T ≅ (S¹)^m`, extend the coordinate characters on `eT` to
bounded complex functions `f_j` on `E_S` by Tietze extension of real and imaginary parts, and average
`F_j(x) = ∫_T χ_j(t)⁻¹ f_j(x · t) dt` with normalized Haar measure; prove continuity,
`F_j(x · g) = χ_j(g) F_j(x)` and `F_j(e) = 1`. On the invariant neighbourhood where all `F_j` are nonzero,
normalizing their phases gives an equivariant map `u` into `T`; the map `x ↦ x · u(x)⁻¹` is constant on
orbits and descends continuously through the quotient map, giving a local section and a product
trivialization. These neighbourhoods cover the quotient, and paracompactness gives numerability.
The case `m = 0` is included. Write `c_S = c_{B_top(S)}` and let `E_join → B_join(T)` be CharacteristicClasses
C1.1b's Milnor universal bundle; define `κ : BS → B_join(T)` as the classifying map of the numerable
bundle `(c_S ∘ ε_S)^* E_S`, and prove the comparison with atlases and transition functors below for this
intrinsic classifier.

Over the refinement `S[U]` the levelwise nerve identity is
`N•(S[U] ⋉ P|U) = N•S[U] ×_{N•S} N•(S ⋉ P)`. The induced `T`-equivariant map from `E_{S[U]}` to the
pullback of `E_S` over `B_top(S[U])` is a map of principal `T`-bundles over the same base, hence an
isomorphism; prove that the map and the comparison are those induced by the levelwise identity,
using local trivializations rather than a general theorem on pullbacks of realizations. The
transition functor `F` also gives a strict levelwise isomorphism of `T`-bundles from
`N•(S[U] ⋉ P|U)` to the pullback along `F` of the universal bundle of the torus bar construction; after
realization the induced equivariant map of principal bundles over the same base is again an
isomorphism. The simplex maps describe transport; the levelwise bundle isomorphism gives the
comparison.

*The torus bar bundle.* The torus bar groupoid is not étale, and its universal bundle has its own
topology: its bar levels `T^n` and total-space levels `T^(n+1)` are compact Hausdorff manifolds whose
degeneracy and latching inclusions (finite unions of coordinate subtori) are closed. The
closed-attachment lemma of §4.9a proves the weak colimit Hausdorff and paracompact, with no collar of
the latching subtori assumed. The total bar realization is contractible by the extra degeneracy, the
`T`-action is free with quotient `B_top(T)`, and the same averaged-character argument gives numerable
principal charts. Pull this bar bundle back along `c_{B_top(T)} : |Sing(B_top(T))| → B_top(T)`, and on this
CW base define `κ_T : |Sing(B_top(T))| → B_join(T)` to classify the pulled-back bar bundle, with the
bundle isomorphism `κ_T^* E_join ≅ c_{B_top(T)}^* E_T` over the same CW base; classification supplies this
isomorphism, weak contractibility of total spaces alone does not. CharacteristicClasses C1.1b supplies
join classification and the classification of numerable bundles on CW bases; C1.5 supplies the finite
torus models and the normalized dual-character generators.

*The refinement classifier.* Choose a homotopy inverse `r : BS → B S[U]` of the refinement equivalence
and set `κ_ref = κ_T ∘ |Sing(B_top(F))| ∘ ε_{S[U]} ∘ r`. Prove `κ_ref ≃ κ` by the following bundle
comparison and C1.1b's uniqueness on `BS`. Write `E_T` for the torus bar bundle and use the same counit
notation for `S[U]` and `T`. The strict nerve maps and the local trivializations give
`E_{S[U]} ≅ B_top(F)^* E_T` and `E_{S[U]} ≅ B_top(φ)^* E_S` as bundles over `B_top(S[U])`. Naturality of `ε` and of
the counit, with `Bφ ∘ r ≃ id` on the CW model `BS`, gives the chain of pullbacks

    κ_ref^* E_join ≅ (B_top(F) ∘ c_{S[U]} ∘ ε_{S[U]} ∘ r)^* E_T
                   ≅ (c_{S[U]} ∘ ε_{S[U]} ∘ r)^* E_{S[U]}
                   ≅ (B_top(φ) ∘ c_{S[U]} ∘ ε_{S[U]} ∘ r)^* E_S
                   ≅ (c_S ∘ ε_S ∘ Bφ ∘ r)^* E_S ≅ (c_S ∘ ε_S)^* E_S ≅ κ^* E_join,

the last step by homotopy invariance of numerable bundles on the CW base. No general statement on
pullbacks of realizations is used.

*Restriction to objects.* Let `j_S : S₀ → B_top(S)` be the inclusion of the zero skeleton and
`ι : Sing(S₀) → diag Sing(N•S)` send an `n`-simplex `σ` to its total degeneracy, the string of `n` identity
arrows at `σ`; it is a strict simplicial map, and set `ĵ_S = |ι|`. The degeneracy relation gives
`ε ∘ ĵ_S = |Sing(j_S)|` on the nose, and naturality of the counit gives `c ∘ ε ∘ ĵ_S = j_S ∘ c_{S₀}`. Prove
`j_S^* E_S = P` from the unique normal form of nondegenerate simplices: an arrow `(g, p)` of the action
groupoid is an identity exactly when `g` is, so the preimage of the zero skeleton is `P`. It follows that
`ĵ_S^* κ^* E_join ≅ c_{S₀}^* P` over `|Sing(S₀)|`. This comparison uses the global `E_S` and the strict object
map and needs no Čech descent and no refinement-compatible choice of homotopy inverse for the object
inclusion. The chosen `r` enters only `κ_ref`; any two homotopy inverses are homotopic, and `κ_ref ≃ κ`
shows that its bundle class is independent of `r` and of the atlas. The intrinsic `κ` and its Chern
classes use neither choice.

*The finite torus model and the character classes.* Let `ET_model → BT_model` be CharacteristicClasses
C1.5's colimit of `ET_N = (S^(2N+1))^m → BT_N = (CP^N)^m`, with its weak, CW and compactly generated
comparisons. Consume C1.5's comparison `b_T : BT_model → B_join(T)`, its homotopy equivalence and
`b_T^* E_join ≅ ET_model`; no second equivalence of universal models is constructed here. Choose a
homotopy inverse `r_T` and set `κ_model = r_T ∘ κ`. Prove `b_T ∘ κ_model ≃ κ` and
`κ_model^* ET_model ≅ κ^* E_join`, and identify this composite with the intrinsic `κ` and with `κ_ref` by the
chain of pullbacks above and C1.1b's uniqueness on `BS`. Independence of `r_T` and compatibility with
objects and refinements follow through the same bundle maps. Transport C1.5's dual-character classes
`h_i = −u_i` to `B_join(T)` through `(b_T^*)⁻¹` and pull them back by `κ`, equivalently take `κ_model^* h_i`;
take their rational images and, through `p^*`, their rational images on the coarse space. Under the
Chern–Weil comparison of §4.8, specialized to each dual-character line, prove that the curvature class
is the real image of this integral class, with SmoothBundlesConnections B6.1–B6.3's `2π` and
dual-character conventions. Prove agreement with the intrinsic Milnor classifier, with the
restriction to objects and with every refinement. Rationality concerns these Chern classes, not
arbitrary real classes of two-forms. Layer 5 owns integration with full isotropy and Stokes; this
classifying, cohomological and bundle argument does not use them.

*Needs:* §2.4; §4.7; §4.8; §4.9; §4.9a; §4.9b; CharacteristicClasses C1.1b, C1.2b and C1.5;
SmoothBundlesConnections B6.1–B6.3.

**Checks.**
- For `S = [*/(ℤ/n)]` and `T = S¹`, a principal `S¹`-bundle over `S` is the bundle `S¹` with `ℤ/n` acting
  through a character `χ`; `E_S` is `E(ℤ/n) ×_{ℤ/n} S¹ → B(ℤ/n)`, and the class pulled back by `κ` from the
  dual-character generator is the element of `H²(B(ℤ/n); ℤ) ≅ ℤ/n` corresponding to `±χ` (the sign is
  CharacteristicClasses C1.5's); it is torsion, so its rational image vanishes, as does the curvature
  of every invariant connection. Ignoring the isotropy action would give the trivial bundle and the
  class `0`.
- For `m = 0`, `T` is trivial, `B_join(T)` is contractible and every classifier is constant; the averaged
  character argument is empty and the bundle is the identity of the base.

### Examples

- For `[*/K]` the four models of this layer are: `BΓ` the fat bar realization, `B_top(S)` the thin bar
  realization, `BS` the diagonal model, all homotopy equivalent to `BK`, and the coarse space a point;
  `q^*` is an isomorphism with `ℚ` coefficients and, for `K` nontrivial, not with `ℤ` coefficients.
- For the unit groupoid of a manifold `M`, all four models are homotopy equivalent to `M`, the
  invariant forms are the forms on `M`, and §§4.5 and 4.9b reduce to the manifold de Rham theorem.

### Dependencies

Layers 1–3 (§§1.2, 1.6, 2.1, 2.3, 2.4, 3.3, 3.4). §4.3 constructs the fat carrier and its coarse
restriction maps first; the generic block of §4.9 uses that carrier and owns the fat–thin and
diagonal comparisons for the boundaryless and collared models, which §4.3 then consumes. §§4.4–4.8
use Layer 3's covers and §2.4's averaging for the local-to-global comparison, §4.4a and the simplicial
characteristic-class bridge. §§4.9a–4.9c add the boundaryless topology, sheaf, nerve-form and torus
comparisons and compare them with §§4.4–4.8 without ConvexityToric's integration. External:
LieGroupoidsPoisson; SmoothBundlesConnections B2–B4 and B6.1–B6.3; DifferentialGeometry Layers 0–1, 7
and §§8.4–8.5; AlgebraicTopology Layers 2–4, §§5.1 and 6.1; CharacteristicClasses C1.1b, C1.2b, C1.5,
C4.1 and C4.3; TopologicalKTheory T1.1 and T1.6.

## Layer 5: Weighted integration, Thom classes and rational duality

Integration on an orbifold weights each chart by the full order of its isotropy group, the
ineffective kernel included; it is an operation on the presentation, not ordinary integration on
the infinite-dimensional space `BΓ`. This layer defines it, proves Stokes on collared domains, and
proves rational Poincaré duality on the coarse space together with the theorem that the weighted
fundamental class of `BΓ` evaluates as the weighted integral.

### 5.1 The orientation line and weighted integration

Construct the arrow-invariant orientation line of a presentation and the transport of
orientations along arrows, from DifferentialGeometry's orientation double cover. For an oriented
presentation and a compactly supported invariant top form `ω`, define the integral on a chart
`U/G` as `|G|⁻¹ ∫_U ω`, where `G` is the full finite group of the chart, ineffective kernel
included, and extend by invariant partitions of unity (§2.4). Prove the chart-change formula and
the isotropy-index formula (if the translates `gV` of an open `V ⊆ U` are equal to `V` or
disjoint from it, and `H = {g : gV = V}`, then for an invariant form supported in `G · V` the chart
integral `|G|⁻¹ ∫_U ω` equals `|H|⁻¹ ∫_V ω`, the `[G : H]` translates contributing equally), independence of the partition and of refinements, Morita
invariance, additivity, and the product and Fubini formulas (Adem–Leida–Ruan, Chapters 1–2).
Rational classes are integrated over `ℚ` and forms over `ℝ`; a version with another coefficient
ring states that every isotropy order occurring is invertible in it.

The finite-group arithmetic behind the chart weight is part of this section. For a finite group
`G` the chart weight is `|G|⁻¹ ∈ ℚ`, counted with `Nat.card`; for a function `f` on a finite
`G`-set `X` the chart integral with counting measure is `|G|⁻¹ ∑ₓ f(x)`, and the integral of the
constant `a` over `[*/G]` is `|G|⁻¹ · a`, so `∫_[*/G] 1 = 1/|G|`. The weight of a point `x` of a
`G`-set is `|G_x|⁻¹`, `G_x` its stabilizer.

- The finite local weight formula: for `G` and `X` finite and `f` constant on orbits,
  `|G|⁻¹ ∑ₓ f(x) = ∑_{orbits} |G_x|⁻¹ f(x)`, the right side summed over one chosen point `x` of
  each orbit. This is orbit–stabilizer, `|G · x| = |G| / |G_x|`, summed over orbits: a point with
  isotropy `G_x` counts with weight `1/|G_x|`.
- If `f` is constant on orbits and `x`, `y` lie in one orbit, then `|G_x|⁻¹ f(x) = |G_y|⁻¹ f(y)`,
  since conjugate stabilizers have equal order; so the orbit sum does not depend on the chosen
  points.

*Needs:* §2.1; §2.2; §2.4 (invariant partitions of unity); DifferentialGeometry Layer 2
(orientations) and Layer 5 (integration of compactly supported top forms); Mathlib
`MulAction.stabilizer`, `MulAction.orbitRel.Quotient`, `Nat.card`.

**Checks.**
- `∫_[*/K] 1 = 1/|K|` for every finite group `K`, including one acting trivially. A definition
  that weights by the effective quotient of the chart group would give `1` for every `K`.
- For `G = ℤ/2` acting on `X = {a, b, c}` by exchanging `a` and `b` and fixing `c`, with `f ≡ 1`:
  the chart integral `|G|⁻¹ ∑ₓ f(x)` is `3/2`, and the orbit sum is `1` (the orbit `{a, b}`, trivial
  stabilizer) plus `1/2` (the orbit `{c}`, stabilizer `ℤ/2`), again `3/2`. Counting orbits without
  weights gives `2`.
- For `ℤ/2` acting freely on the circle of length `2π` by the half-turn, the weighted integral of
  the length form is `½ · 2π = π`, the length of the quotient circle: on a free quotient the weighted
  integral is the ordinary integral over the quotient manifold.
- For `ℤ/m` rotating the unit disc, the weighted integral of the area form is `π/m`, the area of a
  fundamental sector.

### 5.2 Stokes on collared domains

Prove the integral Stokes identity on the globally collared domains of §1.6 and on their box
products, with the face orientations and signs fixed in §3.5: for a compactly supported invariant
form `η` of degree one less than the dimension, `∫_D dη` is the signed sum of the weighted integrals
of `η` over the labelled faces. The proof works chart by chart from DifferentialGeometry's Stokes
theorem for manifolds with corners, the chart weights of §5.1 being the same on a face as in the
interior because the ineffective kernel of a face is the ambient one (§2.3). The identity includes
both interval-end signs and the cancellation along faces of codimension two. Prove invariance
under refinement and change of variables. The trivial gerbe `K × N ⇒ N` has integral
`(1/|K|) ∫_N`, and `[*/K]` has `∫ 1 = 1/|K|`; these are orbifold integrals, not integrals over the
infinite CW complex `BK`.

*Needs:* §1.6; §2.3; §3.5; §5.1; DifferentialGeometry Layer 5 (Stokes' theorem).

### 5.3 Local homology of a finite linear quotient (O5-L)

Prove the relative rational homology of an orientation-preserving finite linear ball quotient: if
a finite group `G` acts linearly on `ℝ^n` preserving orientation, `B` is the open unit ball of a
`G`-invariant inner product, `B̄` the closed ball and `S` its boundary sphere, then
`H_i(B/G, (B ∖ 0)/G; ℚ)` is `ℚ` for `i = n`, with a
generator determined by the orientation, and zero otherwise; the same holds for the pair
`(B̄/G, S/G)`. The proof uses an
admissible equivariant subdivision, equivariant chains and finite averaging (the transfer to
invariants over `ℚ`). Prove the corresponding calculations for the half-space and the labelled
corner models of §1.6, relative to the union of their faces. An isotropy element that reverses
orientation violates the hypothesis, and calling the coarse singular locus a boundary does not
restore it.

*Needs:* §2.4; §3.2; §1.6 (for the half-space and corner pairs); AlgebraicTopology Layers 2–3
(relative homology, excision, subdivision).

**Checks.**
- For `G = ℤ/2` acting on `ℝ` by `x ↦ −x`, which reverses orientation, the quotient pair is
  `([0, 1), (0, 1))`, two contractible spaces, and its relative homology vanishes in every degree:
  there is no top generator, which is why the hypothesis is imposed.
- For `G = ℤ/m` rotating `ℝ²`, the quotient pair is a disc relative to a punctured disc, with
  `H₂ = ℚ`; the orientation-preserving case has its single top class.

### 5.4 Compact classes and rational duality (O5-A, O5-P)

**Compact classes (O5-A).** Prove the compact-class lemma for rational homology manifolds on the
locally finite coarse complexes of Layer 3, from §5.3 and only AlgebraicTopology's generic
excision, Mayer–Vietoris, cap product and coefficient maps. The lemma is stated for coarse
components that are rational homology manifolds; by §5.3 a boundaryless coarse component of
dimension `n` of a locally orientable presentation (Convention 7), whose isotropy preserves local
orientations, is one. For a compact `K` in such a component `X`, prove that `H_i(X, X ∖ K; ℚ) = 0` for `i > n`, that restriction in
degree `n` to the point-local classes along `K` is injective, and that every compatible section of
local orientations over `K` is the restriction of a unique class. Construct the class map and its
restriction and additivity laws by subdividing compact neighbourhoods and gluing with relative
Mayer–Vietoris. Existence of the class is a target and is not inferred from matching stalks.
Prove the version with coefficients in the coarse orientation local system of §4.6, under its
local-orientability hypothesis. This is the local-to-global step beyond AlgebraicTopology's
theorem for manifolds.

**Duality (O5-P).** From these compact classes prove rational cap-product duality by
Mayer–Vietoris induction on the adapted neighbourhoods, with direct limits over compact supports.
Prove Poincaré duality for compact boundaryless oriented coarse spaces and Poincaré–Lefschetz
duality for the compact collared pairs of §1.6, the collars giving the class relative to the
boundary. Construct their fundamental classes, cap maps and perfect cup pairings over `ℚ` and
over `ℝ`.

For a compact connected oriented component whose ineffective kernel has generic order `k` (§2.3),
**define** the weighted fundamental class of `BΓ` by `q_*[Γ]_orb = (1/k) [|Γ|]` through the rational
comparison of §4.4, and for a collared pair through §4.4a. Prove its compatibility with the
boundary map, using that the faces have the same kernel order (§2.3). The substantive theorem is
the normalization: evaluating a de Rham class, transported to `BΓ` by §4.5, on the weighted
fundamental class gives the weighted integral of §5.1. Prove it by comparing the local generator
of §5.3 with DifferentialGeometry's oriented chart generator, then by partitions, refinement and
compact gluing. The equation for the weighted class is its definition and does not replace this
theorem. A noncompact component is handled through the compact-support comparisons; no ordinary
noncompact fundamental class is asserted.

*Needs:* §3.3; §4.4; §4.4a; §4.5; §4.6; §5.1; §5.3; AlgebraicTopology Layer 3 (excision and
Mayer–Vietoris) and Layer 6 (cap products, fundamental classes and duality for manifolds).

**Checks.**
- For `[*/K]` (compact, dimension `0`, generic kernel order `k = |K|`) the weighted class is
  `(1/|K|)` times the point class, and evaluating the constant function `1` gives `1/|K|`, the
  integral of §5.1. Taking `k = 1`, the order of the effective isotropy, would give `1`.
- For the trivial gerbe `K × N ⇒ N` over a compact oriented manifold `N`, the weighted class is
  `(1/|K|)[N]` and evaluation on a top form `ω` gives `(1/|K|) ∫_N ω`, matching §5.2.
- For `ℤ/m` rotating the sphere `S²` about an axis, the action is effective (`k = 1`) and the coarse
  space is a sphere with fundamental class `[S²/ℤ/m]`; the area form integrates to `4π/m`, a
  `1/m` share of the upstairs area, as the chart weights require.

### 5.5 Thom classes, tubular neighbourhoods and Gysin maps (O5-T)

For an oriented orbibundle of rank `r` use its represented ordinary bundle `π_B : E_B → BΓ` (§4.7).
The Thom isomorphism targets the pair `(E_B, E_B ∖ 0_B)`, equivalently the disc and sphere bundle
pair built from it, and is `a ↦ π_B^* a ∪ u` with degree shift `r`; the restriction of `u` to each
oriented fibre is the generator. Construct its form representative with compact vertical support,
the Euler class as the pullback along the zero section, and the laws for orientation reversal,
products and excision. Combine compact vertical support with coarse-compact base support to prove
`∫_E π^*α ∧ Φ = ∫_Γ α`; in a chart `U/G` both sides carry the same factor `1/|G|`, so the weights
cancel, while passing to the effective reduction introduces its own kernel factor.

Prove the equivariant tubular neighbourhood theorem for a representable proper smooth embedding
with a given oriented normal orbibundle: construct invariant metrics, compatible normal
exponential maps and a positive invariant radius function, and prove the global comparison of the
normal bundle with an open neighbourhood, independent of charts and refinements. On the collared
carrier require the embedding to be neat, with collars compatible on the labelled faces. Define the
Gysin map from these tubular data and Thom excision. For proper oriented submersions with compact
fibres, define integration along the fibres with stated vertical and base supports. Prove
transverse base change, the projection formula, products and refinement laws. A generalized map
alone supplies neither tubular data nor a Gysin map.

*Needs:* §4.1; §4.6; §4.7; §5.1; §1.6 (for the collared case); §2.4 (invariant metrics);
CharacteristicClasses C2.1 (Thom classes of ordinary bundles); DifferentialGeometry Layer 5.

**Checks.**
- Over `[*/K]` with `K` acting trivially on `ℝ^r`, a compactly supported Thom form `Φ` with fibre
  integral `1` gives `∫_E π^*1 ∧ Φ = (1/|K|) · 1 = ∫_[*/K] 1`: the weights cancel as stated. A
  version that weighted only the base would give `1` on the left and `1/|K|` on the right.
- Over `[*/(ℤ/2)]` with `ℤ/2` acting on `ℝ` by the sign, the bundle is not orientable as an
  orbibundle (the isotropy reverses the fibre orientation), and no Thom class over `ℚ` is
  asserted: `E_B ≃ B(ℤ/2)` and `E_B ∖ 0_B` is contractible, so the rational cohomology of the Thom
  pair vanishes in every degree, as the twisted form `H*(B(ℤ/2); ℚ_sign) = 0` predicts.

### Examples

- Integration over the trivial gerbe `K × N ⇒ N` is `(1/|K|) ∫_N`, while its effective reduction
  is the unit groupoid of `N`, with integral `∫_N`: effective reduction keeps the coarse space and
  changes the integral by the factor `k = |K|`.
- The football `S²/(ℤ/m)` and the teardrop with one cone point of order `m` are compact oriented
  effective orbifolds with coarse space a sphere; their duality pairings are those of `S²` over `ℚ`.

### Dependencies

Layer 1 (§1.6), Layer 2 (§§2.1–2.4), Layer 3 (§§3.2–3.3, 3.5) and Layer 4 (§§4.1, 4.4, 4.4a, 4.5–4.7).
The descended orientation line of §4.6 precedes the orientation-line version of §5.4; the carrier
and collar data of §1.6 precede §5.3; §5.3 precedes the compact classes of §5.4 and they precede its
duality; the tubular neighbourhood theorem precedes the Gysin maps of §5.5. External:
DifferentialGeometry Layers 2 and 5; AlgebraicTopology Layers 2, 3 and 6; CharacteristicClasses
C2.1.

## Layer 6: Maps, families and comparison laws

### 6.1 Functoriality, projection formulas and cobordisms

Prove that bundles, invariant forms and the cohomology comparisons of Layer 4 are functorial for
generalized maps (§1.2) and their 2-isomorphisms, with the actual common-refinement maps and the
higher composition laws that families need. Prove the relative and compact-support projection
formulas under their stated properness and orientation hypotheses. Construct parameter products
and their restrictions to every face, and prove the naturality of Stokes (§5.2), of the Thom
isomorphism and of the Gysin maps (§5.5), and the corresponding laws for collared cobordisms.

A *collared cobordism* from `Γ_0` to `Γ_1` is an oriented carrier `W` of §1.6 with two disjoint
designated unions of faces, incoming and outgoing, actual identifications of their face
presentations with `Γ_0` and `Γ_1`, and compatible collars; any other faces and the support
restrictions on them are specified as part of the datum. With the outward-normal-first convention
its boundary is `∂W = −Γ_0 ⊔ Γ_1` on the designated faces. Require a closed coarse support that is
compact, or proper over a stated compact parameter support, that meets the designated faces in
compact sets and avoids every other face. For closed forms in the degree to which Stokes applies,
prove that the supported integrals over `Γ_1` and over `Γ_0` are equal, with these signs; relative
cohomology and the class maps use §4.4a and keep the same support data. Integration and the
cohomology comparisons use the retained-arrow presentation throughout, even when a coarse model is
obtained through effective reduction.

*Needs:* §1.2; §1.6; §3.5; §4.1–§4.6 (with §4.4a); §5.1; §5.2; §5.5.

**Checks.**
- The cylinder `[0,1] × Γ`, oriented with the interval first, is a collared cobordism from `Γ` to
  `Γ`: its ends carry `−Γ` at `0` and `+Γ` at `1`, and equality of the two end integrals of a closed
  form is Stokes. Oriented with the base first, as the box products of §1.6 are, the ends carry
  `(−1)^(m+1) Γ` and `(−1)^m Γ` (§3.5), so for `dim Γ = m` odd the orientation must be reversed
  before the cylinder is a cobordism from `Γ` to `Γ`.

### 6.2 Families of presentations

For a given continuous equivariant family `p : Z → Γ₀`, construct the topological action groupoid of
§1.5, its pullbacks to object charts and its overlap maps. For a given complex or nodal family keep
its actual local models, including `xy = a` where they are specified. After pullback to an object
chart the actual fibre is recovered; the fibre of the coarse forgetful map can be its quotient by
automorphisms. Smooth transverse families use the weak fibre products of §1.3. For given nodal
families keep the singular fibres and their separate carrier of complex-domain families, and
construct the compatibility of the presentation maps without asserting that a nodal fibre is a
smooth orbifold. Deformation of the domain, stability and slicing of maps, and virtual obstruction
or perturbation data are further constructions belonging to their own theories and are not
supplied by a presentation.

*Needs:* §1.3; §1.5; §3.4 (collared parameter families).

### Examples

- A smooth family of presentations over an interval with trivial isotropy in the parameter is a
  collared cobordism between its two ends, with signs as in the Check of §6.1.
- For the family `xy = a` over the parameter `a`, the fibre over `a = 0` is a nodal curve; §6.2 keeps
  it as a singular fibre and does not assert that it is an orbifold.

### Dependencies

Layers 1, 3, 4 and 5 (§§1.2, 1.3, 1.5, 1.6, 3.4, 3.5, 4.1–4.6, 5.1, 5.2, 5.5). No external input
beyond those of the cited sections.

## Layer 7: Required examples and overlap comparisons

These comparisons use the completed constructions of Layers 1–5 and are prerequisites of none of
them.

### 7.1 Manifolds, linear quotients and points with isotropy

Work out three basic presentations in full: the unit groupoid of a manifold, a finite effective
linear quotient `[ℝ^n/G]`, and a point with an arbitrary finite isotropy group `[*/K]`. On each,
test the classifying and coarse comparison (§§4.3–4.4), the isotropy groups, bundles and
integration, including a nontrivial representation of the ineffective kernel on the fibre over a
point (§4.1).

*Needs:* Layers 1–5.

**Checks.**
- For `[*/K]` with `K` acting on `V = ℂ` by a nontrivial character `χ`, the orbibundle is not the
  pullback of a bundle on the coarse point, its represented bundle is the line bundle `EK ×_K ℂ_χ`
  over `BK`, and its first Chern class corresponds to `±χ` under `H²(BK;ℤ) ≅ Hom(K, U(1))` (the
  sign is CharacteristicClasses C1.5's convention), so it is nonzero while its real image vanishes.
  Discarding the kernel representation would give the trivial line, with first Chern class zero.

### 7.2 Trivial finite gerbes

For a finite group `K` and an oriented manifold `N`, the trivial gerbe `K × N ⇒ N` (every element
of `K` acting trivially) has ineffective kernel `K` at every point. Compute its weighted fundamental
class `(1/|K|)[N]` (§5.4), the product and interval signs of §3.5 on it, and the comparison of its
characteristic classes (§4.8). Its effective reduction is the unit groupoid of `N`: the coarse
space is the same, and the weighted class, the integral and the bundles carrying a nontrivial
`K`-representation are not.

*Needs:* §2.3; §3.5; §4.7; §4.8; §5.4.

### 7.3 Hamiltonian quotients and effective reduction

HamiltonianReduction R3 and ConvexityToric Layer 4 consume Layers 1–5 and make the comparisons on
their own models: R3 identifies its possibly ineffective level presentation, its slice groupoid,
refinement bibundles and restricted symplectic form with the action presentation of §1.4 and the
invariant forms of §4.2, and ConvexityToric Layer 4 identifies its level principal torus bundle with
the carriers of §§4.1–4.9c before evaluating classes, reduced volumes and Duistermaat–Heckman
integrals on effective and ineffective presentations alike. Both roadmaps also mention a later
comparison, by the former block O7, of their forms, classes and completed models with other
Hamiltonian carriers: it is not planned here, since it would take their carriers as inputs, and
their own identifications above are what their applications use. The comparison with the effective
reduction that those applications use is generic and is proved here. On a connected component of
the coarse space where the ineffective kernel has order `k` (§2.3), compare a presentation with its
effective reduction only through actual coarse, form and bundle data: the invariant forms of the two
agree, since the kernel acts trivially near every point, and for compactly supported invariant top
forms `∫_effective = k · ∫_full`, each chart group `G` being replaced by its quotient by a kernel of
order `k`; a bundle that sees the isotropy need not descend to the effective reduction.

*Needs:* §2.3; §5.1.

**Checks.**
- On the trivial gerbe `K × N ⇒ N`, the full integral of a top form is `(1/|K|) ∫_N` and the
  effective one is `∫_N`, so `∫_effective = |K| · ∫_full` with `k = |K|`; the reverse ratio would
  make the effective reduction smaller.

### 7.4 Fuchsian elliptic charts

Compare the finite elliptic quotient charts of a Fuchsian group with the corresponding
finite-action orbifold charts of §2.1, including their orientations and the normalization of area
(the weighted integral of §5.1 of the hyperbolic area form). Cusp compactification and the
hyperbolic area and signature calculations remain in FuchsianOrbifolds.

*Needs:* §2.1; §5.1; FuchsianOrbifolds Layer 1 (elliptic stabilizers and their quotient charts) and
Layer 2 item 1 (hyperbolic area).

### 7.5 Complex-domain chart groupoids

For any given stable chart groupoid of complex domains with finite isotropy, compare its complex
orientation with Layer 5 and its actual universal family, pulled back to charts, with §6.2. The
input includes the actual deformation charts specific to the moduli problem and their properness
proof. A prestable object with positive-dimensional automorphism group is not an orbifold merely by
naming its coarse quotient, and a nonregular space of stable maps does not acquire a virtual class
from these regular orbifold constructions.

*Needs:* Layer 5; §6.2; ComplexKahlerGeometry §1.1 (the complex orientation).

### Examples

The sections of this layer are themselves the examples of the roadmap; §7.1 and §7.2 are the two
families every earlier layer is tested on.

### Dependencies

Layers 1–6, FuchsianOrbifolds Layer 1 and Layer 2 item 1, and ComplexKahlerGeometry §1.1. Nothing
in Layers 1–6 depends on this layer.

## Scope and ownership

**This roadmap owns** the proper étale subtheory of Lie groupoids and everything built on it above:
proper étale presentations, their generalized maps and coarse spaces on the orbifold carrier, weak
fibre products, action presentations of locally free proper actions, topological action groupoids
of families and globally collared domains (Layer 1); linear charts with retained arrows,
finite-chart atlases, the ineffective kernel and effective reduction on presentations, averaging,
cutoffs and the nerve contraction on proper groupoids, frame bundles and the coarse diffeology
(Layer 2); Yang's triangulation theorem in its stratified form, the triangulation of Thom–Mather
spaces that proves it and its relative form, atlas-subordinate triangulations, open-star covers and
face orientations (Layer 3); orbibundles, invariant forms, the coarse map and
the comparisons of `BΓ` with `|Γ|`, the relative and compactly supported versions, the represented
bundle, the simplicial Chern–Weil comparison and the thin, diagonal and torus-classifier models
(Layer 4); weighted integration, Stokes, local homology, compact classes, rational duality, Thom
classes, tubular neighbourhoods and Gysin maps (Layer 5); functoriality, families and cobordisms
(Layer 6); and the examples and comparisons of Layer 7.

**Already in the libraries and consumed.** The pinned Tau Ceti library states, for native
groupoids with topologies on objects and total arrows and for action groupoids of group actions,
the following, used above under the names given in the supplier contracts: closure of the
topological proper étale conditions under open restriction and products (§1.1); the action-groupoid
dictionary, including the stabilizer as isotropy group with all labels kept (§1.1); openness,
Hausdorffness and paracompactness of the coarse quotient (§1.2); the category of elements of a
groupoid action with its topology (§1.5); finiteness of isotropy, disjoint bisections and the local
action of the isotropy group with retained labels, and Bochner linearization of finite group actions
on manifolds (§2.1); germ kernels, generic stabilizers, effective quotients of action groupoids and
the square-zero lemma behind the face statement (§2.3); naturality of averaging, vanishing of
finite-group cohomology over coefficients in which the order is a unit, invariant partitions of
unity, averaged metrics, cutoffs and the cutoff contraction for group actions (§2.4); faithfulness of
the tangent representation of an effective action (§2.5); the manifold and quotient diffeologies,
subductions, products and local finite-quotient charts (§2.6); the topological nerve, the fat
realization and the fat classifying space with the open-restriction criterion, and the coarse map
of an action groupoid (§4.3); invariant forms on action groupoids (§4.2); the invariant Poincaré
lemmas (§4.5); the bisimplicial Alexander–Whitney map (§4.9); the predicate of triangulability of
a space (§3.1); and the paracompactness of regular Lindelöf spaces (§4.9a). Mathlib supplies action
categories, orbit quotients, proper maps, finite averaging and diffeological spaces. The targets of
the sections cited are what remains: the groupoid-level and smooth statements built from these.

**Owned elsewhere and consumed here.**

- *Lie groupoids, smooth functors, groupoid actions, principal bibundles, Morita composition and
  the Morita invariance of orbit spaces and isotropy groups*: LieGroupoidsPoisson §§G0.0–G0.4, G3.1
  and G3.5. This roadmap builds the proper étale subtheory and
  its finite-chart reconstruction on those carriers and defines no second functor or bibundle
  theory.
- *Transverse fibre products, slices of proper actions, quotients, frame bundles, connections,
  curvature and the rank-one integral–real comparison*: SmoothBundlesConnections B1.0, B1.4, B2, B3.1,
  B4.1 and B6.1–B6.3. The arbitrary proper étale atlas and its frame construction are built here.
- *Forms, orientations, the outward-first boundary orientation, integration, Stokes and the de Rham
  theorem on manifolds*: DifferentialGeometry Layers 0–2, §5.1, Layer 5 and §§8.4–8.5.
- *Singular chains and cochains, relative and small chains, subdivision, cup and cap products,
  realizations of simplicial sets, compact generation, Eilenberg–Zilber for products, bar
  constructions and finite-group cohomology, duality for manifolds*: AlgebraicTopology Layers 2–4,
  §§4.7–4.9, 5.1, 6.1–6.4 and 8.8. This roadmap owns the extension of the compact-class lemma and of
  local-to-global duality to rational homology manifolds (§5.4) and the descent adapters for finite
  atlases (§4.4); no theorem on sheaf cohomology of arbitrary singular spaces is an input.
- *Join bundles and classification of numerable bundles, Milnor's counit theorem and the
  Čech–singular comparison on CW type, finite torus models and dual-character generators, Thom
  classes of ordinary bundles, invariant polynomials and the universal Chern–Weil map*:
  CharacteristicClasses C1.1b, C1.2b, C1.5, C2.1, C4.1 and C4.3. The simplicial and universal
  comparison for orbifolds and the proper-groupoid topology, cochain and torus adapters are built
  here (§§4.8–4.9c).
- *Ordinary vector bundles and their classifiers*: TopologicalKTheory T1.1 and T1.6. *Orthogonal
  groups*: LieGroups Layer 2. *Simplicial complexes and their realization, smooth triangulations of
  manifolds and smooth collars*: GeometricTopology §§11.1, 11.3 and 1.1; the orbit-type
  stratification of orbit spaces with its control data, the stratum-compatible triangulation of
  Thom–Mather spaces and the quotient-compatible triangulations of coarse spaces are built here
  (Layer 3). *Smooth stratified spaces, control data and Thom–Mather spaces*: AlgebraicTopologyPartII
  §§16.1a–16.1b. *Complex orientations*: ComplexKahlerGeometry §1.1.
- *Fuchsian orbifolds*: FuchsianOrbifolds keeps its elliptic and cusp quotients and its area and
  signature calculations; §7.4 compares its elliptic charts (its Layer 1) and their hyperbolic area
  (its Layer 2 item 1) with the generic ones.
- *Moduli problems*: deformation of domains, stability and slicing of maps, and virtual classes
  belong to their own theories (§§6.2, 7.5).

**Owned elsewhere and applying this roadmap.** HamiltonianReduction R3 owns its possibly
ineffective Hamiltonian level presentation, its restricted symplectic form, its moment, kernel and
descent application, and their identification with the action presentation of §1.4 and the
invariant forms of §4.2. ConvexityToric Layer 4 owns its level principal torus bundle, its effective
and ineffective Duistermaat–Heckman, reduced-volume and character–Chern normalization applications
of §§4.3–4.9c and Layer 5, with its own character datum, and the identification of its bundle with
the carriers here. Both consume this roadmap, and this roadmap takes no input from either: no second
moment map, symplectic reduction or toric classification is constructed here (§7.3).

Other roadmaps cite sections of this roadmap by the labels of its former numbering:

| Former label | Now |
|---|---|
| O1 | Layer 1 |
| O1.4 | §1.4 |
| O2 | Layer 2 |
| O2.4 | §2.4 |
| O3 | Layer 3 |
| O4 | Layer 4 |
| O4.2 | §4.2 |
| O5 | Layer 5 |
| O6 | Layer 6 |
| O7 | Layer 7 |

## Exact supplier contracts

### From Mathlib

- `IsProperMap` (`Mathlib/Topology/Maps/Proper/Basic.lean`): the properness of `(s, t)` in
  Convention 1.
- `CategoryTheory.ActionCategory`, `CategoryTheory.ActionCategory.objEquiv` and
  `CategoryTheory.ActionCategory.stabilizerIsoEnd` (`Mathlib/CategoryTheory/Action.lean`): the action
  groupoid of a monoid action, its objects identified with the points (not definitionally) and the
  stabilizer submonoid as endomorphism monoid of an object (§1.1).
- `MulAction.stabilizer`, `MulAction.orbitRel` and `MulAction.orbitRel.Quotient`: stabilizers, the
  orbit relation and the orbit space with its quotient topology (§§1.1, 3.1, 5.1); `Nat.card` for
  group orders.
- `Topology.IsOpenQuotientMap.secondCountableTopology` and `IsOpenQuotientMap.locallyCompactSpace`: second
  countability and local compactness pass along open quotient maps (§1.2).
- `GroupAlgebra.average`, `Representation.invariants`, `Representation.averageMap`,
  `Representation.averageMap_invariant`, `Representation.averageMap_id` and
  `Representation.isProj_averageMap` (`Mathlib/RepresentationTheory/Invariants.lean`): averaging over
  a finite group whose order is invertible in the coefficient ring, a projection onto the invariants
  (§2.4).
- `DiffeologicalSpace`, `Diffeology.IsPlot`, `Diffeology.DSmooth`, `Diffeology.dTopology`,
  `Diffeology.IsDTopologyCompatible` and `DiffeologicalSpace.ofCorePlotsOn`
  (`Mathlib/Geometry/Diffeology/Basic.lean`): diffeologies with plots on Euclidean spaces, smooth maps,
  the D-topology, compatibility of a topology with the D-topology, and construction from core plots
  (§§2.6, 3.4).
- `LieGroup`, `IsManifold` and `ContMDiffSMul` (`Mathlib/Geometry/Manifold/Algebra/SMul.lean` for the
  last): Lie groups, smooth manifolds and smooth actions, in the statement of §3.1.

### From Tau Ceti

Paths are under `TauCeti/`. All declarations below are proved at the pin. Unless stated otherwise,
a *native topological groupoid* is a `CategoryTheory.Groupoid C` with `TopologicalSpace C` on objects
and `TopologicalSpace (Quiver.Total C)` on total arrows, and "proper étale" is passed as explicit
hypotheses: `(s, t)` proper (`IsProperMap`), source and target local homeomorphisms, Hausdorff arrows,
and continuous units and composition where needed.

- *Open restriction and products* (§1.1): `TauCeti.isLocalHomeomorph_source_fullSubcategory`,
  `TauCeti.isLocalHomeomorph_target_fullSubcategory` (the full subgroupoid on an open set of objects
  has locally homeomorphic source and target, given continuity of the other endpoint map) and
  `TauCeti.isProperMap_source_target_fullSubcategory` (no openness needed)
  (`Topology/CategoryTheory/FullSubcategory.lean`); `TauCeti.isLocalHomeomorph_source_prod`,
  `TauCeti.isLocalHomeomorph_target_prod`, `TauCeti.isProperMap_source_target_prod`
  (`Topology/CategoryTheory/Prod.lean`).
- *Action groupoids* (§1.1): `CategoryTheory.ActionCategory.totalEquiv` (total arrows are `G × X` by
  label and source), `CategoryTheory.ActionCategory.stabilizerMulEquivAut` (the stabilizer of `x` is
  `Aut x`, multiplication `gh = h ≫ g`), `CategoryTheory.ActionCategory.toEnd_stabilizerMulEquivAut`
  (compatibility with Mathlib's `stabilizerIsoEnd`) and
  `CategoryTheory.ActionCategory.stabilizerMulEquivVertexGroupMulOpposite` (the stabilizer is the
  opposite of Mathlib's vertex group) (`CategoryTheory/Groupoid/ActionCategory/Basic.lean`);
  `TauCeti.ActionGroupoid.arrowHomeomorph` (the arrow space is homeomorphic to `G × X`) and
  `TauCeti.ActionGroupoid.isProperMap_source_target_iff` (`(s, t)` is proper exactly when the action is
  proper) (`Topology/CategoryTheory/ActionGroupoid/Basic.lean`);
  `TauCeti.ActionGroupoid.isLocalDiffeomorph_source` and `TauCeti.ActionGroupoid.isLocalDiffeomorph_target`
  (for a discrete group acting smoothly, the arrow manifold has locally diffeomorphic source and
  target) (`Geometry/Manifold/GroupAction/ActionGroupoid.lean`).
- *The coarse quotient* (§1.2), on `Quotient (isIsomorphicSetoid C)`:
  `TauCeti.isOpenQuotientMap_isomorphismClassesMk` (continuous source and open target: the quotient
  map is open), `TauCeti.t2Space_isomorphismClasses` (moreover closed image of `(s, t)`: Hausdorff) and
  `TauCeti.paracompactSpace_isomorphismClasses` (moreover locally compact second-countable objects:
  paracompact) (`Topology/CategoryTheory/IsomorphismClasses.lean`).
- *Categories of elements* (§1.5), in `CategoryTheory.Functor.Elements`
  (`Topology/CategoryTheory/Elements.lean`): `totalHomeomorph` (arrows are `Γ ×_{s,p} Z`),
  `isLocalHomeomorph_source` (source of `Γ` a local homeomorphism and continuous anchor),
  `continuous_target_iff` (target continuous iff the action map is), `isLocalHomeomorph_target`
  (groupoid case) and `isProperMap_source_target` (Hausdorff total space, continuous anchor and
  target).
- *Local isotropy* (§2.1), in `Topology/CategoryTheory/Etale.lean`:
  `TauCeti.finite_hom_of_proper_source_target` (proper `(s, t)` and locally homeomorphic source: hom
  sets finite); `TauCeti.exists_disjoint_bisections_of_proper_source_target` (Hausdorff arrows, proper
  `(s, t)`, locally homeomorphic source and target: disjoint open bisections through the isotropy
  arrows containing every arrow with both ends near `x`); and
  `TauCeti.exists_isotropy_action_of_proper_source_target` (moreover continuous units and
  composition: an open `U ∋ x` with a continuous action of `Aut x` and a fully faithful functor
  `Aut x ⋉ U ⥤ C`, the inclusion on objects, keeping every label).
- *Bochner linearization* (§2.1): `ContRepresentation.bochnerAverage` and
  `ContRepresentation.bochnerAverage_smul` (the averaged chart is equivariant;
  `Analysis/Calculus/BochnerLinearization.lean`); `TauCeti.exists_equivariant_contMDiff_chart` and
  `TauCeti.exists_equivariant_contMDiff_chart_target_eq_sumOfConjugatesInnerSublevel` (a finite group
  acting by `C^n` maps, `n ≥ 1`, on a boundaryless manifold over `ℝ` or `ℂ` with complete model has an
  invariant linearizing chart at a common fixed point, with target a ball for the averaged inner
  product; `Geometry/Manifold/GroupAction/Linearization.lean`).
- *Germ kernels and effective quotients* (§2.3): `TauCeti.MulAction.germKernel`
  (`Topology/Algebra/GroupAction/GermKernel.lean`); `TauCeti.dense_setOf_stabilizer_eq_ker_of_contMDiff`
  and `TauCeti.germKernel_eq_ker` (finite group acting by `C¹` maps on a Hausdorff connected
  boundaryless manifold; `Geometry/Manifold/GroupAction/GermKernel.lean`);
  `TauCeti.isOpen_setOf_stabilizer_eq_ker` (finite group acting continuously on a Hausdorff space;
  `Topology/Algebra/GroupAction/GenericStabilizer.lean`);
  `TauCeti.effectiveActionFunctor` (`CategoryTheory/Groupoid/ActionCategory/Effective.lean`);
  `TauCeti.effectiveOrbitHomeomorph` (`Topology/Algebra/GroupAction/Effective.lean`);
  `Module.End.eq_one_of_pow_eq_one_of_sub_one_sq_eq_zero` (over a division ring with `n ≠ 0`, `f^n = 1`
  and `(f − 1)² = 0` give `f = 1`; `LinearAlgebra/End/SquareZero.lean`) and
  `OpenPartialHomeomorph.eventually_smul_eq_iff_on_ker` (`Analysis/Calculus/GroupAction/FaceKernel.lean`).
- *Averaging, group cohomology, partitions and cutoffs* (§2.4):
  `Representation.IntertwiningMap.map_averageMap` (`RepresentationTheory/Invariants.lean`);
  `groupCohomology.subsingleton_of_isUnit_natCard` (finite group, order a unit: positive-degree
  cohomology vanishes; `RepresentationTheory/Homological/GroupCohomology/Corestriction.lean`) and
  `TauCeti.groupCohomology.averagingHomotopy` (`…/GroupCohomology/Averaging.lean`);
  `TauCeti.groupCohomology.cutoffHomotopy` (`…/GroupCohomology/Cutoff.lean`; cochains of a group with
  coefficients in functions on a space, for a weight with `∑ᶠ c(g • x) = 1`);
  `SmoothPartitionOfUnity.exists_isSubordinate_smul_invariant` (properly discontinuous actions;
  `Geometry/Manifold/PartitionOfUnity/Invariant.lean`); `TauCeti.averageRiemannianMetric` (average
  over the full finite group; `Geometry/Manifold/Riemannian/Invariant.lean`);
  `TauCeti.MulAction.exists_isCutoff_contMDiff` (properly discontinuous `C^n` action on a Hausdorff
  σ-compact finite-dimensional real manifold; `Geometry/Manifold/GroupAction/Cutoff.lean`).
- *Tangent representations* (§2.5): `TauCeti.injective_tangentRepresentation` (faithful finite-stabilizer
  `C¹` action on a Hausdorff connected boundaryless manifold) and `TauCeti.ker_tangentRepresentation`
  (`Geometry/Manifold/GroupAction/TangentRepresentation.lean`).
- *Diffeology* (§2.6): `TauCeti.manifoldDiffeology` and `TauCeti.dTopology_manifoldDiffeology`
  (finite-dimensional real boundaryless model; `Geometry/Diffeology/Manifold.lean`);
  `TauCeti.Diffeology.isPlot_quotient_iff`, `TauCeti.Diffeology.isSubduction_quotient_mk`,
  `TauCeti.Diffeology.dSmooth_quotient_lift_iff`, `TauCeti.Diffeology.instIsDTopologyCompatibleQuotient`
  (any setoid; `Geometry/Diffeology/Quotient.lean`); `TauCeti.Diffeology.isSubduction_prodMap_quotient_mk`,
  `TauCeti.Diffeology.instIsDTopologyCompatibleProdOrbitRelQuotient` (`Geometry/Diffeology/Prod.lean`);
  `TauCeti.Diffeology.exists_slice_isInduction_orbitRelQuotientMap_of_contMDiff` (discrete group acting
  properly and smoothly; `Geometry/Diffeology/Slice.lean`).
- *Triangulability* (§3.1): `TauCeti.IsTriangulable` (homeomorphic to the realization of an abstract
  simplicial complex; `Topology/Triangulable/Basic.lean`).
- *Paracompactness* (§4.9a): `TauCeti.paracompactSpace_of_regularSpace_lindelofSpace` (a regular
  Lindelöf space is paracompact, no Hausdorff hypothesis; `Topology/Compactness/Paracompact.lean`).
- *Invariant forms* (§4.2): `TauCeti.ActionGroupoid.invariantForms`, for action groupoids of discrete
  monoids, with exterior derivative, wedge products and pullbacks
  (`Geometry/Manifold/GroupAction/ActionGroupoid/InvariantForm.lean`).
- *Nerves and classifying spaces* (§4.3): `TauCeti.topologicalNerve` and `TauCeti.fatClassifyingSpace`
  (any category with a topology on total arrows; `Topology/CategoryTheory/Nerve.lean`);
  `TauCeti.fatRealization` and `TauCeti.fatRealization.isOpenEmbedding_map_of_range_eq_preimage`
  (`AlgebraicTopology/FatRealization.lean`); `TauCeti.ActionGroupoid.coarseMap`
  (`Topology/CategoryTheory/ActionGroupoid/Nerve.lean`).
- *Invariant Poincaré lemmas* (§4.5): `StarConvex.exists_invariant_contDiffOn_forall_extDeriv_eq` and
  `Convex.exists_invariant_contDiffOn_forall_extDerivWithin_eq`
  (`Analysis/Calculus/DifferentialForm/Invariant.lean`).
- *Bisimplicial Alexander–Whitney map* (§4.9): `CategoryTheory.SimplicialObject.diagAlexanderWhitney`
  (`AlgebraicTopology/SimplicialObject/Bisimplicial.lean`); the Eilenberg–Zilber equivalence for it is
  a target of §4.9.
- *Singular cohomology*: `TopCat.singularCohomology`, the ordinary cohomology of Convention 7.

### From TauCetiRoadmap.LieGroupoidsPoisson

- §G0.0 and §G0.2: the native categorical groupoid with topologies on objects and on total arrows,
  and Lie groupoids with smooth structures on both; this roadmap's presentations (Convention 1) are
  these, with the Hausdorff, étale and properness hypotheses added. §G0.3: unit and action groupoids
  with their total-arrow topology and smooth structure. §G0.4: smooth functors, smooth natural
  isomorphisms, local bisections and isotropy groups.
- §G3.1: groupoid actions on maps `p : X → Γ₀`, in particular the algebraic fibred action carrier and
  its equivalence with functors to types, consumed in §1.5.
- §G3.5: principal and biprincipal bibundles, their balanced composition, associators and unitors
  with their coherence, Morita equivalence, and the homeomorphism of orbit spaces and isomorphisms
  of isotropy groups that a Morita equivalence induces, consumed in §1.2. The composition convention
  `gh = h ≫ g` (first `h`, then `g`) is LieGroupoidsPoisson's.
- Transverse fibre products of smooth maps are SmoothBundlesConnections B1.0's, which
  LieGroupoidsPoisson §G0.1 also consumes; §1.3 uses them through that interface.

### From TauCetiRoadmap.SmoothBundlesConnections

- B1.0: regular fibres and transverse fibre products (§1.3).
- B1.4: invariant metrics for compact group actions, equivariant linear charts at fixed points,
  slices for proper actions, the free proper quotient theorem and finite-isotropy local quotient
  charts (§§1.4, 2.5, 3.1).
- B2 (B2.5 in particular): associated bundles, fibre metrics and frame bundles (§2.5, §4.1).
- B3.1: principal connections, the affine action of `ad(P)`-valued one-forms and existence by
  partitions of unity (§2.4, §4.1); B4.1: curvature, the exterior covariant derivative and Bianchi
  (§4.1, §4.8).
- B6.1–B6.3: the comparison of integral and real classes and the rank-one curvature law with its
  `2π` and dual-character conventions (§4.9).

### From TauCetiRoadmap.DifferentialGeometry

- Layers 0–2: differential forms on manifolds, the exterior derivative and wedge product, pullback,
  orientations and the orientation double cover (§§4.2, 5.1).
- §5.1: the boundary interface and the outward-normal-first boundary orientation (§3.5, §5.2).
- Layer 5: integration of compactly supported top forms and Stokes' theorem on manifolds with
  boundary and corners (§§5.1–5.2).
- §§8.4–8.5: integration over smooth singular chains, the de Rham homomorphism and the de Rham
  theorem, natural in smooth maps (§4.5, §4.9).

### From TauCetiRoadmap.AlgebraicTopology

- Layers 2–3: relative singular chains, excision, subdivision, small chains and Mayer–Vietoris
  (§§3.3, 4.4, 5.3–5.4).
- Layer 4: cellular chains and their comparison with singular chains (§3.3); §4.7: the CW structure
  on the realization of a simplicial set (§4.9); §4.8: the compactly generated category, its
  coreflection, products, mapping spaces, and colimits computed in topological spaces (§4.9);
  §4.9: realization of products of simplicial sets.
- §5.1: Eilenberg–Zilber and Künneth for singular chains (§§4.4, 4.9).
- §6.1: singular cochains with constant and local coefficients, consumed as ordinary singular
  cohomology (§4.9); Layer 6 (§§6.2–6.4): cup and cap products, fundamental classes and
  Poincaré–Lefschetz duality for manifolds (§5.4).
- §8.8: the bar construction of a discrete group and its identification of the cohomology of `BG`
  with group cohomology (§2.4).

### From TauCetiRoadmap.AlgebraicTopologyPartII

§16.1a: smooth stratified spaces, Hausdorff, locally compact and second countable, with a locally
finite stratification by locally closed smooth manifolds satisfying the frontier condition; §16.1b:
control data and Thom–Mather spaces. §3.1 equips the orbit space of a compact Lie group action with
this structure and triangulates it.

### From TauCetiRoadmap.CharacteristicClasses

- C1.1b: numerable join bundles, Milnor's universal bundle `E_join → B_join(T)` and the
  classification of numerable principal bundles, with uniqueness of classifying maps up to homotopy
  (§4.9).
- C1.2b: Milnor's theorem that the counit `|Sing X| → X` is a weak equivalence, and the Čech–singular
  comparison and locally acyclic singular-cochain sheaf resolution on spaces of CW type (§4.9).
- C1.5: the finite torus models `ET_N = (S^(2N+1))^m → BT_N = (CP^N)^m`, their colimit, the comparison
  `b_T` with `B_join(T)` and the dual-character generators `h_i = −u_i` (§4.9).
- C2.1: Thom classes of ordinary oriented vector bundles (§5.5).
- C4.1: invariant homogeneous polynomials, curvature evaluation and connection transgression;
  C4.3: the universal Chern–Weil map on finite Stiefel approximations and its stable compatibility
  (§4.8).

### From TauCetiRoadmap.TopologicalKTheory

T1.1 and T1.6: ordinary numerable vector bundles on paracompact bases and their classifying maps
into Grassmannians, applied to the represented bundle `E_B` (§§4.7–4.8).

### From TauCetiRoadmap.RepresentationTheory.LieGroups

Layer 2: the orthogonal groups `O(n)` as Lie groups and their smooth matrix actions, used with
SmoothBundlesConnections' frame bundles (§2.5).

### From TauCetiRoadmap.GeometricTopology

§11.1: simplicial complexes with subdivision and geometric realization; §11.3: smooth
triangulations of manifolds; §1.1: smooth collars (§§3.1, 3.4).

### From TauCetiRoadmap.ComplexKahlerGeometry

§1.1: the complex orientation of a complex manifold and its comparison with the manifold
orientation, for complex-chart examples (§7.5). A complex deformation family, a nodal domain and a
properness or slice theorem specific to a moduli problem are further geometric data, not supplied
by a generic presentation.

### From TauCetiRoadmap.FuchsianOrbifolds

Layer 1: the finite elliptic quotient charts of a Fuchsian group; Layer 2 item 1: hyperbolic area,
whose weighted integral is compared in §7.4.

## References

- I. Moerdijk, [*Orbifolds as Groupoids: an Introduction*](https://arxiv.org/abs/math/0203100),
  §§2–4, for retained-arrow presentations, generalized maps, local charts and the coarse
  comparison.
- I. Moerdijk and D. Pronk, *Orbifolds, Sheaves and Groupoids*, K-Theory 12 (1997), 3–21, for the
  effective specialization; its theorem on faithful slices is not substituted for the ineffective
  chart theorem of §2.1.
- I. Moerdijk and D. Pronk,
  [*Simplicial Cohomology of Orbifolds*](https://arxiv.org/abs/q-alg/9708021), §1.2, for adapted
  simplex and star lifts and atlas refinements.
- B. van den Berg and I. Moerdijk, *Univalent completion*, Math. Ann. (2018), §2.3, for the
  classifying space of a simplicial groupoid as the diagonal of its nerve.
- C. T. Yang, *The triangulability of the orbit space of a differentiable transformation group*,
  Bull. AMS 69 (1963), 405–408, for the statement of §3.1 and the manifold structure of the
  orbit-type strata; the last step of its proof rests on a theorem of Cairns that is false.
- A. Verona, *Triangulation of stratified fibre bundles*, Manuscripta Math. 30 (1980), 425–445, for
  the stratum-compatible triangulation of abstract prestratified spaces and of orbit spaces (§3.1).
- S. Illman, *The equivariant triangulation theorem for actions of compact Lie groups*, Math. Ann.
  262 (1983), 487–501, for the gap in Yang's proof and the doubling along the boundary (§§3.1, 3.4).
- S. Gürer and P. Iglesias-Zemmour, *Differential forms on manifolds with boundary and corners*,
  Indag. Math. 30 (2019), 920–929, for the diffeology of corners (§3.4).
- A. Adem, J. Leida and Y. Ruan, *Orbifolds and Stringy Topology*, Cambridge, 2007, Chapters 1–2,
  for ineffective groupoids, bundles, forms and weighted integration.
- Mathlib's diffeology, `Mathlib/Geometry/Diffeology/Basic.lean` (`DiffeologicalSpace`,
  `Diffeology.IsPlot`, `Diffeology.DSmooth`, `Diffeology.dTopology`,
  `DiffeologicalSpace.ofCorePlotsOn`), which originates in
  [its first Mathlib development](https://github.com/leanprover-community/mathlib4/pull/26484).
- [The D-topology development proposed for Mathlib](https://github.com/leanprover-community/mathlib4/pull/27274)
  describes a generated-plot and coinduced-topology direction compatible with §2.6, which follows
  it and constructs the lemmas needed for the smooth quotient models. Its continuous diffeology
  takes all continuous maps as plots and has a delta-generated D-topology; it is not the smooth
  finite-quotient diffeology of §2.6.
- Eltschig's [lean-catdg](https://github.com/peabrainiac/lean-catdg) development, in particular its
  [locally modelled diffeological spaces](https://github.com/peabrainiac/lean-catdg/blob/1ee4a2614b033dd1b4aded95759eb31eb9b0fbf4/CatDG/Diffeology/LocallyModelled.lean),
  an existing development of effective coarse local models. §2.6 reuses the native definitions
  and constructs the comparison; its effective coarse notion does not replace the retained-arrow
  orbifold and the general ineffective bundle theory here.

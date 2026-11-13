# Roadmap: homotopy of posets, finite spaces and subgroup complexes

**Summary.** Build the homotopy theory of finite spaces and of posets, and apply it to the posets
of `p`-subgroups of a finite group. The carriers are Mathlib's topological spaces with their
specialization preorder `Specialization X`, Mathlib's upper-set topology `WithUpperSet P`,
Mathlib's `ContinuousMap.Homotopic`, `ContinuousMap.HomotopicRel` and
`ContinuousMap.HomotopyEquiv`, Mathlib's nerve and its realization `SSet.toTop.obj (nerve P)`,
Tau Ceti's order complex `TauCeti.AbstractSimplicialComplex.orderComplex P` (the nonempty finite
chains of a preorder `P`), its weak realization `AbstractSimplicialComplex.Realization`, the
realized maps of monotone maps, and Tau Ceti's `ContinuousMap.IsWeakHomotopyEquivalence`; for
groups, Mathlib's `Subgroup G`, `IsPGroup` and `Sylow`. The end theorems are: two maps between
finite spaces are homotopic exactly when a fence of pointwise comparable maps joins them; a beat
point of a finite `T₀` space can be removed by a strong deformation retraction; and a homotopy
equivalence between finite `T₀` spaces without beat points is a homeomorphism (Stong's
classification, Layer 1); for a finite `T₀` space `X`, sending a point of the realization of the
order complex of `Specialization X` to the largest vertex of its carrier is a weak homotopy
equivalence onto `X`, and for a simplicial complex on a finite vertex type the carrier map onto
the face poset with its upper-set topology is a weak homotopy equivalence (McCord's theorems,
Layer 2); the realization of the order complex of a partial order is homeomorphic to the
realization of its nerve; comparable monotone maps realize to homotopic maps; a preorder with a
monotone `f` and an `x₀` such that `x ≤ f x ≥ x₀` for every `x` has a contractible realization;
and Quillen's fibre lemma, the case of posets of Quillen's Theorem A: a monotone map of partial
orders all of whose fibres `f⁻¹(Q≤q)` have contractible realizations realizes to a homotopy
equivalence (Layer 3); for a finite group `G` and a prime `p`, the inclusion of the poset
`A_p(G)` of nontrivial elementary abelian `p`-subgroups into the poset `S_p(G)` of nontrivial
`p`-subgroups realizes to a homotopy equivalence; `S_p(G)` has a contractible realization when
`G` has a nontrivial normal `p`-subgroup; as a finite space with its upper-set topology `S_p(G)`
is contractible exactly when `G` has a nontrivial normal `p`-subgroup; when `p` divides `|G|`,
the realization of `S_p(G)` is disconnected exactly when `G` has a strongly `p`-embedded
subgroup; for solvable `G`, a contractible realization of `A_p(G)` forces a nontrivial normal
`p`-subgroup; and the Euler characteristic of `S_p(G)` is congruent to `1` modulo the `p`-part
of `|G|` (Layer 4).

Suggested homes: `TauCeti/Topology/FiniteSpace/` for Layers 1–2,
`TauCeti/AlgebraicTopology/SimplicialComplex/OrderComplex/` for Layer 3 and
`TauCeti/GroupTheory/SubgroupComplex/` for Layer 4.

## Scope and ownership

**Owned here.** The homotopy theory of finite spaces: fences of comparable maps, beat points,
strong deformation retractions onto the complement of a beat point, cores and Stong's
classification (Layer 1); McCord's weak homotopy equivalences between finite spaces and
realizations of order complexes, in both directions (Layer 2); the homotopy theory of posets
through their order complexes: the comparison of the order complex with the nerve, the homotopy
property of comparable maps, conical contractibility and Quillen's fibre lemma (Layer 3); the
subgroup posets `S_p(G)` and `A_p(G)` with the conjugation action of `G`, the Brown–Quillen
homotopy equivalence, contractibility in the presence of a nontrivial normal `p`-subgroup, Stong's
finite-space form of it, Quillen's connectivity criterion through strongly `p`-embedded
subgroups, Quillen's theorem for solvable groups, and Brown's homological Sylow theorem
(Layer 4). A search of the roadmaps on main, of the open pull requests and of the maintainers'
packages for beat points, finite spaces in the sense of McCord and Stong, McCord's theorem,
Quillen's fibre lemma, the posets of `p`-subgroups, Brown's poset, Quillen's complex, subgroup
complexes, strongly `p`-embedded subgroups and the homological Sylow theorem finds no other owner.
StableHomotopyKTheoryPartII's "McCord model" is Kuhn's model of a different construction, and the
uses of Mathlib's `AlexandrovDiscrete` in TotallyDistributiveTopoi concern frames and sheaf topoi,
not homotopy.

**Left to StableHomotopyKTheory.** Quillen's Theorem A for realized nerves of small categories,
`quillenTheoremA`, and its opposite-category dual (StableHomotopyKTheory §2.31). The fibre lemma
3.4 is its case of a monotone map of partial orders, read through the homeomorphism of 3.1 and the
identification of the comma category `CostructuredArrow f.functor q` with the subposet
`{p // f p ≤ q}`; this roadmap restates neither Theorem A nor the classifying space of a category.

**Left to HomotopyTheoryOfCategories.** Basic localizers, asphericity and the minimal localizer
`W∞` (HomotopyTheoryOfCategories 2.1), and Theorem A for an arbitrary basic localizer,
`mem_of_isAsphericalFunctor` (HomotopyTheoryOfCategories 2.4). Target 3.4 (b) is its case of a
monotone map of partial orders; this roadmap restates neither the localizers nor Theorem A.

**Left to LocalFiniteGroupTheory.** The `p`-core `pCore p H` with its universal property
`le_pCore` (LocalFiniteGroupTheory L1), so that `O_p(G) = pCore p ⊤` is nontrivial exactly when
`G` has a nontrivial normal `p`-subgroup; elementary abelian groups `IsElementaryAbelian p E` and
the `p`-rank `pRank p G` (LocalFiniteGroupTheory L4). The posets of 4.1 are written with these
notions; this roadmap defines neither the `p`-core, nor elementary abelian groups, nor the
`p`-rank.

**Supplied by Tau Ceti.** Order complexes and their functoriality
(`TauCeti/AlgebraicTopology/SimplicialComplex/OrderComplex.lean`), weak realizations of abstract
simplicial complexes and their carriers (`Realization/Basic.lean`), realized simplicial maps
(`Realization/Map.lean`), the Euler characteristic of a realization as the alternating count of
faces (`Realization/CWComplex/EulerCharacteristic.lean`) and weak homotopy equivalences
(`TauCeti/Topology/Homotopy/HomotopyGroup/WeakHomotopyEquivalence.lean`). This roadmap owns only
the theorems about them stated below.

**Out of scope.** Joins of posets and Quillen's join formula `A_p(G × H) ≃ A_p(G) ∗ A_p(H)`
(Quillen 1978, Propositions 1.9 and 2.6), which need joins of realizations; the homology of
`A_p(G)` in Quillen's analysis of groups of Lie type and of `p`-solvable groups beyond 4.6; the
Bouc poset of radical subgroups and the equivariant homotopy types of Thévenaz–Webb; simple
homotopy types of finite spaces (Barmak–Minian 2008); and the group cohomology that the subgroup
posets compute, such as Webb's formula and Brown's theorem on the `p`-fractional part of the
Euler characteristic of a group of finite virtual cohomological dimension, which needs group
cohomology rings that Mathlib does not have.

## Conventions

1. **The specialization order is Mathlib's.** For a topological space `X`,
   `Specialization.toEquiv a ≤ Specialization.toEquiv b ↔ b ⤳ a`: the open sets are the upper
   sets, and for an Alexandrov-discrete `X` (every finite `X`) Mathlib's
   `Specialization.homeoWithUpperSetTopologyorderIso` is a homeomorphism onto
   `WithUpperSet (Specialization X)`. Stong, McCord, Barmak and Minian order a finite space so
   that the open sets are the down sets; their `≤` is the opposite of Mathlib's. Order complexes
   do not see the difference (a chain of `P` is a chain of `Pᵒᵈ`), and a finite space is
   contractible exactly when its opposite is. Witness: in Mathlib's Sierpiński space (`Prop`,
   `{True}` open), `True ⤳ False`, so `Specialization.toEquiv False ≤ Specialization.toEquiv True`:
   the open point is the top.
2. **Order complexes and realizations.** The order complex of a preorder has the nonempty finite
   chains as faces; its realization is Tau Ceti's weak realization, a subspace of `P →₀ ℝ` with
   the final topology of its closed simplices; the carrier of a point is the face whose open
   simplex contains it. A monotone `f : P →o Q` gives `orderComplexMap f` and
   `(orderComplexMap f).realizationMap`. Witness: for `Fin 2`, the order complex has the faces
   `{0}`, `{1}`, `{0, 1}` and its realization is an interval; for the two-element discrete order
   it has two faces and two points.
3. **Subgroup posets.** `S_p(G)` is `PSubgroupPoset G p` and `A_p(G)` is `ElemAbelianPoset G p`,
   ordered by inclusion of subgroups; `G` acts by conjugation, `H ↦ gHg⁻¹`. Both are empty when
   `p` does not divide `|G|`, and the empty space is not contractible. Witness: for `G = 𝔖₃`,
   `S₂(𝔖₃)` is the three subgroups of order `2`, pairwise incomparable, and `S₃(𝔖₃)` is the
   single point `𝔄₃`.
4. **The `p`-part.** `|G|_p = p ^ (Nat.card G).factorization p`. Witness: `|𝔄₅|₂ = 4`,
   `|𝔄₅|₃ = 3`, `|𝔄₅|₅ = 5` and `|𝔄₅|₇ = 1`.
5. **Euler characteristics** are alternating counts of nonempty chains, `Σ (-1)^(#σ + 1)`, the
   value Tau Ceti's `AbstractSimplicialComplex.eulerChar_realization` gives the Euler
   characteristic of the realization. Witness: for `Fin 2`, `2 − 1 = 1`; for the four-point
   poset `a, b < c, d`, whose order complex is a square, `4 − 4 = 0`.

## Exact supplier contracts

**From Mathlib** (at the pins; file names are relative to `Mathlib/`).

- Specialization and upper-set topologies: `Specialization`, `Specialization.toEquiv`,
  `Specialization.instPreorder`, `Specialization.instPartialOrder`,
  `Specialization.homeoWithUpperSetTopologyorderIso` (`Topology/Specialization`), `Specializes`,
  `T0Space`, `AlexandrovDiscrete`, `Finite.toAlexandrovDiscrete` (`Topology/AlexandrovDiscrete`),
  `WithUpperSet`, `WithUpperSet.toUpperSet` (`Topology/Order/UpperLowerSetTopology`).
- Homotopy: `ContinuousMap`, `ContinuousMap.id`, `ContinuousMap.comp`, `ContinuousMap.Homotopic`,
  `ContinuousMap.HomotopicRel` (`Topology/Homotopy/Basic`), `ContinuousMap.HomotopyEquiv` with the
  notation `≃ₕ` (`Topology/Homotopy/Equiv`), `ContractibleSpace`
  (`Topology/Homotopy/Contractible`), `Homeomorph`, `ConnectedSpace`, `Relation.EqvGen`.
- Simplicial: `AbstractSimplicialComplex`, `PreAbstractSimplicialComplex`
  (`AlgebraicTopology/SimplicialComplex/Basic`), `CategoryTheory.nerve`, `SSet.toTop`
  (`AlgebraicTopology/SingularSet`), `Preorder.smallCategory`, `Monotone.functor`,
  `CategoryTheory.CostructuredArrow`.
- Groups: `Subgroup`, `Subgroup.Normal`, `Subgroup.map`, `MulAut.conj`, `IsPGroup`,
  `IsPGroup.card_modEq_card_fixedPoints` (`GroupTheory/PGroup`), `Sylow`, `Group.IsSolvable`,
  `Nat.factorization`, `Int.ModEq`, `finsum`.

**From Tau Ceti** (at the pin).

- `TauCeti.AbstractSimplicialComplex.orderComplex`,
  `TauCeti.AbstractSimplicialComplex.mem_orderComplex_iff`,
  `TauCeti.AbstractSimplicialComplex.orderComplexMap`,
  `TauCeti.AbstractSimplicialComplex.orderComplexMap_comp`
  (`TauCeti/AlgebraicTopology/SimplicialComplex/OrderComplex.lean`).
- `TauCeti.SetLike.Face` (`TauCeti/AlgebraicTopology/SimplicialComplex/Basic.lean`);
  `AbstractSimplicialComplex.Realization`, `AbstractSimplicialComplex.carrier`,
  `AbstractSimplicialComplex.vertex`
  (`TauCeti/AlgebraicTopology/SimplicialComplex/Realization/Basic.lean`).
- `PreAbstractSimplicialComplex.SimplicialMap.realizationMap`
  (`TauCeti/AlgebraicTopology/SimplicialComplex/Realization/Map.lean`).
- `AbstractSimplicialComplex.eulerChar_realization`
  (`TauCeti/AlgebraicTopology/SimplicialComplex/Realization/CWComplex/EulerCharacteristic.lean`).
- `ContinuousMap.IsWeakHomotopyEquivalence`, `ContinuousMap.IsWeakHomotopyEquivalence.comp`,
  `ContinuousMap.HomotopyEquiv.isWeakHomotopyEquivalence`
  (`TauCeti/Topology/Homotopy/HomotopyGroup/WeakHomotopyEquivalence.lean`).

**From StableHomotopyKTheory.** §2.31 (`quillenTheoremA` and its opposite-category dual), for 3.4
(a).

**From HomotopyTheoryOfCategories.** 2.1 (`IsBasicLocalizer`, `IsAsphericalFunctor`, `Winfty`)
and 2.4 (`mem_of_isAsphericalFunctor`), for 3.4 (b).

**From LocalFiniteGroupTheory.** L1 (`pCore`, `le_pCore`), for 4.3, 4.4 and 4.6; L4
(`IsElementaryAbelian`, `pRank`), for 4.1 and 4.2.

## How to read the build

Layer 1 is the homotopy theory of finite spaces on Mathlib's specialization order: homotopies are
fences of comparable maps, beat points are removed by strong deformation retractions, and minimal
finite spaces are classified up to homeomorphism. Layer 2 proves McCord's theorems, which pass
between a finite `T₀` space and the realization of the order complex of its specialization order,
and between a simplicial complex and its face poset. Layer 3 is the homotopy theory of posets
through their order complexes: the comparison with the nerve that lets Theorem A of
StableHomotopyKTheory apply, the homotopy property, conical contractibility, and the fibre lemma.
Layer 4 applies Layers 1–3 to the posets `S_p(G)` and `A_p(G)` of a finite group, with the group
theory of LocalFiniteGroupTheory and Mathlib's Sylow theory.

## Layer 1: finite spaces

### 1.1 Finite spaces are posets

State, as API from Mathlib, the Alexandrov correspondence used throughout: a finite space is
Alexandrov-discrete, its topology is the upper-set topology of its specialization preorder
(`Specialization.homeoWithUpperSetTopologyorderIso`), the preorder is a partial order exactly
when the space is `T₀`, and a map between finite spaces is continuous exactly when it is monotone
for the specialization preorders (Stong 1966; Barmak 2011, Chapter 1). Prove that a finite space
is path-connected exactly when it is connected, exactly when its specialization preorder is
connected as a graph of comparable pairs.
*Needs:* Mathlib `Specialization`, `Specialization.homeoWithUpperSetTopologyorderIso`,
`Finite.toAlexandrovDiscrete`, `WithUpperSet`, `T0Space`.

**Checks.**

- Sierpiński space: the specialization order has `False < True` (Convention 1). The identity map
  from Sierpiński space to the discrete two-point space is not continuous, since `{False}` is not
  open, and it is not monotone, since `False < True` goes to two incomparable points.
- The indiscrete two-point space has specialization preorder with `a ≤ b` and `b ≤ a`: it is not
  a partial order, matching the failure of `T₀`.
- The four-point space `a, b < c, d` (the pseudo-circle) is connected: `a ≤ c ≥ b` is a path of
  comparable pairs; the disjoint union of two Sierpiński spaces is not.

### 1.2 Homotopies are fences

Prove `homotopic_iff_eqvGen`: for finite spaces `X` and `Y`, two maps `f g : C(X, Y)` are
homotopic exactly when `Relation.EqvGen` of the pointwise specialization `∀ x, f₁ x ⤳ f₂ x`
relates them (Stong 1966; Barmak 2011, Chapter 1; Barmak–Minian 2008, §2). One direction holds
for all spaces: if `f₁ x ⤳ f₂ x` for every `x`, the map equal to `f₁` on `X × [0, 1)` and to `f₂`
on `X × {1}` is continuous. The other uses that `C(X, Y)` with the compact-open topology is a
finite space whose specialization order is the pointwise one, so a path in it from `f` to `g`
crosses finitely many comparable steps.
*Needs:* 1.1; Mathlib `ContinuousMap.Homotopic`, `Specializes`, `Relation.EqvGen`.

**Checks.**

- On Sierpiński space the constant map at `False` and the identity are pointwise comparable, so
  the identity is homotopic to a constant: Sierpiński space is contractible.
- On the discrete two-point space two distinct maps are never pointwise comparable, and indeed
  the two constant maps are not homotopic: path components are preserved.
- The fence cannot be shortened to one step: on the pseudo-circle, a constant map at `a` and a
  constant map at `b` are not comparable, and they are homotopic through `a ≤ c ≥ b`.

### 1.3 Beat points

Define `IsBeatPoint x` for an element of a preorder: the elements strictly below `x` have a
largest element, or the elements strictly above `x` have a smallest one (Stong 1966; Barmak–Minian
2008, §2). Prove `exists_retraction_of_isBeatPoint`: for a beat point `x` of a finite `T₀` space
`X`, the space `{y // y ≠ x}` is a strong deformation retract of `X`, through a retraction `r`
sending `x` to the largest element below it (or the smallest above it) and a homotopy from the
inclusion composed with `r` to the identity, relative to `{y | y ≠ x}`; the homotopy is given by
1.2, since that composite is comparable with the identity. Prove that removing beat points one at
a time ends at a subspace without beat points, a core, and that a finite `T₀` space is
contractible exactly when one of its cores is a point (Stong 1966).
*Needs:* 1.1, 1.2; Mathlib `ContinuousMap.HomotopicRel`, `Specialization.toEquiv`.

**Checks.**

- In Sierpiński space `True` is a down beat point (the elements below it are `{False}`), and the
  retraction onto `{False}` exhibits contractibility.
- The pseudo-circle has no beat point: below `c` lie the incomparable `a` and `b`, with no
  largest element, and symmetrically above `a`. It is not contractible (2.1: it is weakly
  equivalent to the circle), so a definition allowing any point with a comparable neighbour
  would be wrong.
- In the three-element chain `0 < 1 < 2`, each point is a beat point; in the poset `0, 1 < 2`,
  the point `2` is not a down beat point (no largest element below it), but `0` is an up beat
  point.

### 1.4 Stong's classification

Prove `exists_homeomorph_of_homotopyEquiv`: a homotopy equivalence `e : X ≃ₕ Y` between finite
`T₀` spaces without beat points has an underlying map that is a homeomorphism (Stong 1966;
Barmak–Minian 2008, §2). The route: a self-map of a space without beat points homotopic to the
identity is the identity, by 1.2 and induction on the fence, since a map comparable with the
identity and different from it would produce a beat point. Hence two finite spaces are homotopy
equivalent exactly when their cores are homeomorphic, and the core is unique up to homeomorphism.
*Needs:* 1.2, 1.3; Mathlib `ContinuousMap.HomotopyEquiv`, `Homeomorph`.

**Checks.**

- The pseudo-circle and its opposite have no beat points and are homeomorphic (the order is
  self-dual); the identity of the pseudo-circle is its only self-map homotopic to the identity.
- The hypothesis on beat points is needed: Sierpiński space and the point are homotopy
  equivalent and not homeomorphic.
- The core of the poset `0, 1 < 2` is a point: `0` is an up beat point (the smallest element
  above it is `2`); after removing it, `1` is one, and `{2}` remains.

### Examples

- `S_p(G)` and `A_p(G)` as finite spaces with the upper-set topology (4.4).
- The non-Hausdorff suspension of `S⁰` is the pseudo-circle, a minimal finite space.

### Dependencies

Mathlib only. Within the layer, each target uses the previous ones.

## Layer 2: McCord's theorems

### 2.1 From order complexes to finite spaces

Prove `exists_isWeakHomotopyEquivalence_realization`: for a finite `T₀` space `X`, the map from
the realization of `orderComplex (Specialization X)` to `X` sending a point to the largest vertex
of its carrier (a chain, so the largest vertex exists) is continuous and a weak homotopy
equivalence (McCord 1966, the theorem on the simplicial complex of a finite space; Barmak 2011,
Chapter 1). Continuity: the preimage of an open, that is upper, set `U` is the union of the open
stars of the vertices in `U`. The route is McCord's theorem on basis-like open covers (McCord 1966,
Theorem 6): over the minimal open neighbourhood of each point, the preimage is the open star of
that vertex, which is contractible, and the neighbourhood has a smallest element and is
contractible.
*Needs:* 1.1; Tau Ceti `TauCeti.AbstractSimplicialComplex.orderComplex`,
`AbstractSimplicialComplex.Realization`, `AbstractSimplicialComplex.carrier`,
`ContinuousMap.IsWeakHomotopyEquivalence`.

**Checks.**

- For Sierpiński space the order complex is an edge, the map sends the closed edge minus the
  vertex `False` to `True`, and it is a weak equivalence between contractible spaces.
- For the pseudo-circle the order complex is a square, the realization is a circle, and the map
  is a weak equivalence: `π₁` of the pseudo-circle is `ℤ`, although the pseudo-circle has no beat
  point and more than one point, so it is not contractible (1.3).
- The largest vertex, not the smallest, is the continuous choice for Mathlib's order: sending a
  point of the open edge of Sierpiński space to `False` would pull back the open set `{True}` to
  a single vertex, which is not open.

### 2.2 From simplicial complexes to face posets

Prove `exists_isWeakHomotopyEquivalence_faces`: for a simplicial complex `K` on a finite vertex
type, the carrier map from the realization of `K` to `WithUpperSet (Face K)`, faces ordered by
inclusion, is continuous and a weak homotopy equivalence (McCord 1966; Barmak–Minian 2008, §2).
The preimage of the upper set of faces containing `σ` is the open star of `σ`. The route: the
face poset's order complex is the barycentric subdivision of `K`, and 2.1 applies to it.
*Needs:* 2.1; Tau Ceti `AbstractSimplicialComplex.Realization`,
`AbstractSimplicialComplex.carrier`, `TauCeti.SetLike.Face`,
`ContinuousMap.IsWeakHomotopyEquivalence`; Mathlib `WithUpperSet`.

**Checks.**

- For the complex with one edge, the face poset is `{0}, {1} < {0, 1}`, which has a top element,
  and the carrier map sends the open edge to the top: a weak equivalence of contractible spaces.
- For the boundary of a triangle the face poset has six elements, three vertices below three
  edges, each edge above two vertices; its order complex is a hexagon, and the carrier map is a
  weak equivalence with `π₁ = ℤ` on both sides.
- The upper-set topology is the right one: with the lower-set topology the preimage of `{{0}}`
  would be a single point of the realization, not open.

### Examples

- Every finite simplicial complex is weakly equivalent to a finite space (2.2), and every finite
  `T₀` space to a compact polyhedron (2.1).

### Dependencies

Layer 1; Tau Ceti. Within the layer, 2.2 uses 2.1.

## Layer 3: homotopy of posets

### 3.1 Order complexes and nerves

Prove `nonempty_homeomorph_nerve`: for a partial order `P`, the realization of
`orderComplex P` is homeomorphic to `SSet.toTop.obj (nerve P)`, by the map that is affine on each
simplex and sends the vertex `p` to the vertex of the nerve at `p`. Prove that it is natural in
monotone maps: it carries `(orderComplexMap f).realizationMap` to the realization of the nerve
map of `f` viewed as a functor (Quillen 1978, §1). The nondegenerate simplices of the nerve of a
partial order are its strict chains, each determined by its vertices.
*Needs:* Mathlib `CategoryTheory.nerve`, `SSet.toTop`, `Preorder.smallCategory`,
`Monotone.functor`; Tau Ceti `TauCeti.AbstractSimplicialComplex.orderComplex`,
`AbstractSimplicialComplex.Realization`,
`PreAbstractSimplicialComplex.SimplicialMap.realizationMap`.

**Checks.**

- For `Fin 2` both sides are the interval; for the discrete two-element order both are two
  points.
- Antisymmetry is needed: for the indiscrete preorder on two elements, the order complex is an
  edge while the nerve is the nerve of the indiscrete groupoid, with nondegenerate simplices in
  every dimension; the realizations are both contractible but not homeomorphic.
- For the poset `0, 1 < 2` both realizations are two edges glued at the vertex `2`: the nerve has
  degenerate simplices in every dimension, which its realization collapses, and nondegenerate
  simplices only in dimensions `0` and `1`.

### 3.2 The homotopy property

Prove `homotopic_realizationMap_of_le`: for monotone `f ≤ g : P →o Q` between preorders,
`(orderComplexMap f).realizationMap` and `(orderComplexMap g).realizationMap` are homotopic
(Quillen 1978, §1). The straight-line homotopy is well defined: the image of a chain under `f`
and its image under `g` together form a chain, since `f x ≤ f y ≤ g y` for `x ≤ y`.
*Needs:* Tau Ceti `TauCeti.AbstractSimplicialComplex.orderComplexMap`,
`PreAbstractSimplicialComplex.SimplicialMap.realizationMap`; Mathlib `ContinuousMap.Homotopic`.

**Checks.**

- For `P = Q = Fin 2`, the constant map at `0` and the identity are comparable, and their
  realizations, the constant map and the identity of the interval, are homotopic.
- Comparability is needed: on the discrete two-element order the identity and the swap are not
  comparable, and their realizations are not homotopic (the swap exchanges the components).
- The union of the two image chains is a chain: for `x ≤ y` in `Fin 2`, with `f = 0` constant and
  `g = id`, the images `{0}` and `{0, 1}` lie in the chain `{0, 1}`.

### 3.3 Conical contractibility

Prove `contractibleSpace_of_conical`: a preorder `P` with an element `x₀` and a monotone
`f : P →o P` such that `x ≤ f x ≥ x₀` for every `x` has a contractible realization (Quillen 1978,
§1). By 3.2, the identity is homotopic to `f`, which is homotopic to the constant map at `x₀`. A
preorder with a largest or a smallest element is the case `f` constant.
*Needs:* 3.2.

**Checks.**

- The poset `0, 1 < 2` is conical with `f` constant at `2`.
- The pseudo-circle `a, b < c, d` is not conical: `x ≤ f x` forces `f c = c` and `f d = d`, then
  `a ≤ f a ≤ c, d` forces `f a = a` and likewise `f b = b`, and no `x₀` lies below both `a` and
  `b`. Its realization is a circle (2.1).
- The hypothesis `x₀ ≤ f x` cannot be dropped: `f = id` satisfies `x ≤ f x` on every preorder,
  and with `f = id` the hypothesis says that `x₀` is a smallest element.

### 3.4 Quillen's fibre lemma

(a) Prove `exists_homotopyEquiv_of_contractible_fibres`: for a monotone map `f : P →o Q` of
partial orders such that every fibre `{p // f p ≤ q}` has a contractible realization,
`(orderComplexMap f).realizationMap` is the forward map of a homotopy equivalence (Quillen 1978,
Proposition 1.6). The dual statement for the fibres `{p // q ≤ f p}` follows by passing to `Pᵒᵈ`
and `Qᵒᵈ`, whose order complexes are those of `P` and `Q`. Derive both from Quillen's Theorem A,
StableHomotopyKTheory §2.31, and its dual: `CostructuredArrow f.functor q` is isomorphic to the
subposet `{p // f p ≤ q}` as a category, and 3.1 carries the homotopy equivalence of realized
nerves to the realized order complexes.

(b) For every basic localizer `W` (HomotopyTheoryOfCategories 2.1), a monotone map of partial
orders all of whose fibres `{p // f p ≤ q}` are `W`-aspherical is in `W`: the instance of
`mem_of_isAsphericalFunctor` (HomotopyTheoryOfCategories 2.4) at `f.functor`, through the same
identification of comma categories with fibres.
*Needs:* 3.1, 3.3; StableHomotopyKTheory §2.31; HomotopyTheoryOfCategories 2.1, 2.4; Mathlib
`Monotone.functor`, `CategoryTheory.CostructuredArrow`, `ContinuousMap.HomotopyEquiv`.

**Checks.**

- For the inclusion of `{0}` into `Fin 2`, the fibre over `0` is `{0}` and over `1` is `{0}`:
  both contractible, and the inclusion of a point into an interval is a homotopy equivalence.
- The fibres must be the lower fibres `f p ≤ q`, not the strict fibres `f p = q`: the bijection
  from the discrete two-element order `{a, b}` onto `Fin 2` has the points as strict fibres, all
  contractible, while the lower fibre over `1` is the discrete `{a, b}`; two points are not
  homotopy equivalent to an interval.
- For the inclusion of the subposet `{a, c}` into `a, b < c`, the lower fibre over `b` is empty,
  so the hypothesis fails, and indeed the conclusion holds only by the dual form: the upper
  fibres `{x // y ≤ x}` are `{a, c}` over `a`, `{c}` over `b` and `{c}` over `c`, all
  contractible.

### Examples

- The face poset of a finite simplicial complex has an order complex, its barycentric
  subdivision, homotopy equivalent to the complex (2.2 and 3.1).
- Removing from a finite poset a point whose upper or lower link is contractible does not change
  the homotopy type of the realization (3.4 applied to the inclusion).

### Dependencies

Layer 1 for the finite-space reading; StableHomotopyKTheory §2.31 and HomotopyTheoryOfCategories
2.1, 2.4 for 3.4; Mathlib; Tau Ceti. Within the layer, 3.3 uses 3.2 and 3.4 uses 3.1 and 3.3.

## Layer 4: subgroup complexes

### 4.1 The posets `S_p(G)` and `A_p(G)`

(a) Define `PSubgroupPoset G p`, the subgroups `H ≠ ⊥` with `IsPGroup p H` (Brown 1975), and
`ElemAbelianPoset G p`, the subgroups `H ≠ ⊥` that are abelian with `x ^ p = 1`, that is
`IsElementaryAbelian p ↥H` in the sense of LocalFiniteGroupTheory L4 (Quillen 1978, §2), both
ordered by inclusion. Define `elemAbelianToPSubgroup`, the inclusion, monotone. Prove that
conjugation by `g ∈ G` is an order automorphism of both posets commuting with the inclusion.

(b) Prove that `S_p(P)` and `A_p(P)` are conical for a nontrivial `p`-group `P`: with `B` a
central subgroup of order `p`, `A ≤ AB ≥ B`.

(c) Prove that the order complex of `A_p(G)` has dimension `m_p(G) − 1`, where `m_p(G)` is
LocalFiniteGroupTheory's `pRank p G` (L4), the empty complex having dimension `−1`: a chain
`E₁ < ⋯ < E_k` of elementary abelian subgroups has `|E_k| ≥ p ^ k`, and a maximal flag of
subspaces of an elementary abelian subgroup of rank `m_p(G)` has length `m_p(G)`.
*Needs:* LocalFiniteGroupTheory L4 (`IsElementaryAbelian`, `pRank`); Mathlib `Subgroup`,
`IsPGroup`, `MulAut.conj`; 3.3.

**Checks.**

- For `G = 𝔖₃`: `S₂ = A₂` is three incomparable points, `S₃ = A₃` is one point, and `S₅` is
  empty (Convention 3).
- For the dihedral group of order `8`, `A₂` has seven elements: the centre `Z`, four
  reflection subgroups and two Klein four-groups, each containing `Z` and two reflection
  subgroups; `S₂` adds the cyclic subgroup of order `4` and the whole group. `m₂ = 2`, and the
  order complex of `A₂` has dimension `1`.
- Primality matters: for `p = 4` the cyclic group of order `4` is abelian with `x ^ 4 = 1` and
  lies in `ElemAbelianPoset` at `4`, although it is not elementary abelian at any prime; the
  targets below assume `p` prime, and `elemAbelianToPSubgroup` needs no primality, since
  `x ^ p = 1` already gives `IsPGroup p`.

### 4.2 The Brown–Quillen homotopy equivalence

Prove `exists_homotopyEquiv_elemAbelianToPSubgroup`: for a finite group `G` and a prime `p`, the
inclusion `A_p(G) → S_p(G)` realizes to a homotopy equivalence (Quillen 1978, Proposition 2.1).
The route is 3.4: the fibre over `P ∈ S_p(G)` is `A_p(P)`, conical by 4.1 (b). The two finite
spaces need not be homotopy equivalent: for `G = 𝔖₅` and `p = 2` the cores differ (Stong 1984,
§3), and the smallest example is `𝔖₃ ≀ ℤ/2`, of order `72` (Minian–Piterman 2018, Example 3.5 and
Proposition 3.8).
*Needs:* 3.4, 4.1; Mathlib `Sylow`.

**Checks.**

- For a group whose Sylow `p`-subgroups have order `p`, `A_p(G) = S_p(G)` and the inclusion is
  the identity.
- For the dihedral group of order `8`, the inclusion `A₂ → S₂` misses the cyclic subgroup of order
  `4` and the whole group; both posets have the whole group or the centre as cone point, and the
  realized inclusion is a homotopy equivalence of contractible spaces.
- The fibre over `P` is `A_p(P)`, not `A_p(N_G(P))`: for `G = 𝔖₃`, `p = 3`, both are `{𝔄₃}`, but
  for `G = 𝔖₄`, `p = 2` and `P` a Klein four-group not normal in `G`, `A₂(P)` has four elements
  while `A₂(N_G(P))` has more.

### 4.3 Contractibility when `O_p(G) ≠ 1`

Prove `contractibleSpace_of_normal`: if `G` has a nontrivial normal `p`-subgroup `N`, the
realization of `S_p(G)` is contractible (Quillen 1978, Proposition 2.4). The poset is conical
(3.3): `Q ≤ QN ≥ N`, where `QN` is a `p`-subgroup since `N` is normal. Through 4.2 the
realization of `A_p(G)` is contractible as well. A nontrivial normal `p`-subgroup exists exactly
when `pCore p ⊤ ≠ ⊥` (LocalFiniteGroupTheory L1, `le_pCore`).
*Needs:* 3.3, 4.1, 4.2; LocalFiniteGroupTheory L1 (`pCore`, `le_pCore`).

**Checks.**

- `𝔖₄` with `p = 2` has the normal Klein four-group, and its `S₂` is contractible.
- `𝔖₃` with `p = 2` has no nontrivial normal `2`-subgroup, and `S₂(𝔖₃)` is three points, not
  contractible.
- `QN` need not be elementary abelian when `Q` and `N` are: in the dihedral group of order `8`,
  with `N` a Klein four-group (normal, of index `2`) and `Q` a reflection subgroup outside `N`,
  `QN` is the whole group; the argument is made in `S_p(G)` and transported by 4.2.

### 4.4 Stong's finite-space form

Prove `contractibleSpace_withUpperSet_iff`: `S_p(G)` with the upper-set topology is a contractible
finite space exactly when `G` has a nontrivial normal `p`-subgroup (Stong 1984; Minian–Piterman
2018, Proposition 2.1). One direction is the fence `id ≤ (Q ↦ QN) ≥ const N` of 1.2. For the
other, a contractible finite `G`-space has a `G`-invariant core, which is a point fixed by `G`:
a normal `p`-subgroup. The analogous statement for `A_p(G)` fails in one direction (the group
`((𝔄₄ × 𝔄₄) ⋊ ℤ/2) ⋊ ℤ/2` of order `576`, Minian–Piterman 2018, Example 3.7).
*Needs:* 1.2, 1.3, 1.4, 4.1, 4.3; LocalFiniteGroupTheory L1.

**Checks.**

- For a `p`-group `P`, `S_p(P)` has the largest element `P` and is contractible as a finite space.
- For `𝔖₃` and `p = 2`, the finite space `S₂(𝔖₃)` is discrete with three points.
- For `𝔄₄` and `p = 2`, `S₂` is the Klein four-group above its three subgroups of order `2`, a
  finite space with a largest element; the Klein four-group is normal.

### 4.5 Connectivity and strongly `p`-embedded subgroups

Prove `not_connectedSpace_iff`: for `p` dividing `|G|`, the realization of `S_p(G)` is
disconnected exactly when `G` has a strongly `p`-embedded subgroup, a proper subgroup `M`
containing a Sylow `p`-subgroup such that `p` does not divide `|M ∩ gMg⁻¹|` for `g ∉ M` (Quillen
1978, Proposition 5.2). The route: `G` acts transitively on the components, each containing a
Sylow subgroup, and the stabilizer of the component of a Sylow subgroup `P` is strongly
`p`-embedded when proper; conversely, a strongly `p`-embedded `M` contains the stabilizer, by a
double-coset count showing `|G : M| ≡ 1 mod p`.
*Needs:* 1.1, 3.1, 4.1; Mathlib `Sylow`, `MulAut.conj`, `Subgroup.map`.

**Checks.**

- `𝔄₅` and `p = 2`: `S₂(𝔄₅)` is five components, each a Klein four-group with its three
  subgroups of order `2`; the normalizer `𝔄₄` of a Klein four-group meets its conjugates in
  subgroups of order `3`, so it is strongly `2`-embedded.
- `𝔖₃` and `p = 2`: three components; a subgroup of order `2` meets its conjugates trivially and
  is strongly `2`-embedded.
- `𝔖₄` and `p = 2`: `S₂` is contractible (4.3), and no proper subgroup containing a Sylow
  subgroup `D₈` is strongly embedded, since `D₈ ∩ gD₈g⁻¹` contains the normal Klein four-group.

### 4.6 Quillen's theorem for solvable groups

Prove `exists_normal_of_contractibleSpace`: if `G` is solvable and the realization of `A_p(G)` is
contractible, then `G` has a nontrivial normal `p`-subgroup (Quillen 1978, Corollary 12.2, for
the case of solvable groups of Conjecture 2.9). Quillen's route proves more: for solvable `G`
with `O_p(G) = 1`, the reduced homology of `A_p(G)` is nonzero in degree `m_p(G) − 1`.
*Needs:* 4.1, 4.2; LocalFiniteGroupTheory L1, L4; Mathlib `Group.IsSolvable`.

**Checks.**

- `𝔖₃`, `p = 2`: solvable, `O₂ = 1`, and `A₂` is three points, not contractible.
- `𝔖₄`, `p = 3`: solvable, `O₃ = 1`, and `A₃` is the four Sylow `3`-subgroups, not contractible;
  `p = 2`: `O₂ ≠ 1` and `A₂` is contractible (4.3), consistent with the theorem.
- `𝔄₅` at `p = 2` is not solvable; there `O₂ = 1` and `A₂` is disconnected (4.5), as
  Conjecture 2.9 predicts. Solvability is the hypothesis of Corollary 12.2, and the statement
  without it is the open conjecture.

### 4.7 Brown's homological Sylow theorem

Prove `eulerChar_pSubgroupPoset_modEq`: the alternating count of nonempty chains of `S_p(G)`, the
Euler characteristic of its realization (Convention 5), is congruent to `1` modulo `|G|_p`
(Brown 1975, the homological Sylow theorem). The route: a Sylow subgroup `P` acts on the chains;
for every nontrivial `Q ≤ P` the fixed subposet `S_p(G)^Q`, the `p`-subgroups normalized by `Q`,
is conical by `R ≤ RQ ≥ Q`, so has Euler characteristic `1`; a Möbius inversion over the
subgroups of `P` turns this into the congruence modulo `|P|`.
*Needs:* 3.3, 4.1; Tau Ceti `AbstractSimplicialComplex.eulerChar_realization`; Mathlib `Sylow`,
`IsPGroup.card_modEq_card_fixedPoints`, `Int.ModEq`, `Nat.factorization`.

**Checks.**

- `𝔄₅`: `S₂` is five cones, `χ = 5 ≡ 1 mod 4`; `S₃` is ten points, `χ = 10 ≡ 1 mod 3`; `S₅` is
  six points, `χ = 6 ≡ 1 mod 5`.
- `𝔖₃`, `p = 2`: `χ = 3 ≡ 1 mod 2`; `𝔖₄`, `p = 2`: contractible, `χ = 1`.
- The modulus is the full `p`-part and not `p`: for `𝔄₅` and `p = 2`, `5 ≢ 1 mod 8` and
  `5 ≡ 1 mod 4 = |𝔄₅|₂`; and the count of all chains with a Sylow `P` acting is congruent modulo
  `p` to the count of `P`-fixed chains (`IsPGroup.card_modEq_card_fixedPoints`), which is the
  first step of the route.

### Examples

- `𝔄₅` at `p = 2, 3, 5`: disconnected posets, discrete for `p = 3, 5`, with Euler characteristics
  `5`, `10`, `6`.
- `p`-groups, and groups with a normal Sylow subgroup: contractible posets.

### Dependencies

Layers 1–3; LocalFiniteGroupTheory L1 and L4; Mathlib; Tau Ceti for 4.7. Within the layer, 4.2
uses 4.1, 4.3 uses 4.2, 4.4 uses 4.3, and 4.5–4.7 use 4.1.

## Downstream consumers

No roadmap on main or in the open pull requests cites PosetHomotopyAndSubgroupComplexes.

## Research context

The posets of this roadmap carry more structure than their homotopy type. Webb conjectured that
the orbit space of the realization of `S_p(G)` under the action of `G` is contractible (Webb
1987), and Symonds proved it (Symonds 1998); homotopy equivalences of posets with a group action
are treated by Thévenaz and Webb (1991), and Grodal relates subgroup complexes to higher limits
over orbit categories (Grodal 2002). Smith's monograph (Smith 2011) surveys subgroup complexes.
For the poset of cosets of proper subgroups of a finite group `G`, Brown showed that the reduced
Euler characteristic is `-P_G(-1)`, where `P_G` is the probabilistic zeta function, built from
Hall's Möbius inversion on the subgroup lattice (Brown 2000; Hall 1936). Shareshian and Woodroofe
proved that this coset poset is never contractible, and record as open whether `P_G(-1)` is
nonzero for every finite group `G` (Shareshian–Woodroofe 2016, §1.1).

Quillen conjectured that `S_p(G)` has a contractible realization only when `G` has a nontrivial
normal `p`-subgroup (Quillen 1978, Conjecture 2.9). He proved it for solvable groups (4.6); it is
known for `p`-solvable groups (new proofs in Díaz Ramos 2018) and for almost simple groups
(Aschbacher–Kleidman 1990). Aschbacher and Smith proved it for `p > 5` under a restriction on
unitary components, using the classification of finite simple groups (Aschbacher–Smith 1993);
Piterman reduced its rational form to extensions of direct products of simple groups and proved
it for groups of `p`-rank at most `4` (Piterman 2021); and Piterman and Smith extended the
Aschbacher–Smith theorem to all odd primes under the same unitary restriction (Piterman–Smith
2024). A proof of that restriction, and hence of the conjecture for every odd prime, is claimed in
a preprint (Díaz Ramos 2023). For `p = 2` the conjecture is open, with partial results in
Piterman–Smith (2024, §10). Stong's finite-space theorem (4.4) turns the conjecture into the
statement that a homotopically trivial finite space `S_p(G)` is contractible as a finite space.

## References

- D. Quillen, « Homotopy properties of the poset of nontrivial p-subgroups of a group », *Adv.
  Math.* 28 (1978), no. 2, 101–128. doi:10.1016/0001-8708(78)90058-0. Cited: §1 (the homotopy
  property and conical contractibility), Propositions 1.6, 1.9, 2.1, 2.4, 2.6, 5.2,
  Conjecture 2.9, Corollary 12.2.
- K. S. Brown, « Euler characteristics of groups: the p-fractional part », *Invent. Math.* 29
  (1975), no. 1, 1–5. doi:10.1007/BF01405170.
- M. C. McCord, « Singular homology groups and homotopy groups of finite topological spaces »,
  *Duke Math. J.* 33 (1966), 465–474. doi:10.1215/S0012-7094-66-03352-7.
- R. E. Stong, « Finite topological spaces », *Trans. Amer. Math. Soc.* 123 (1966), 325–340.
  doi:10.1090/S0002-9947-1966-0195042-2.
- R. E. Stong, « Group actions on finite spaces », *Discrete Math.* 49 (1984), 95–100.
  doi:10.1016/0012-365X(84)90156-0.
- J. A. Barmak, *Algebraic Topology of Finite Topological Spaces and Applications*, Lecture Notes
  in Math. 2032, Springer, 2011. doi:10.1007/978-3-642-22003-6. Chapter 1.
- J. A. Barmak, E. G. Minian, « Simple homotopy types and finite spaces », *Adv. Math.* 218
  (2008), no. 1, 87–104. arXiv:math/0611158. §2.
- E. G. Minian, K. I. Piterman, « The homotopy types of the posets of p-subgroups of a finite
  group », *Adv. Math.* 328 (2018), 1217–1233. doi:10.1016/j.aim.2017.12.022.
  arXiv:1612.04302. Proposition 2.1, Examples 3.5
  and 3.7.
- M. Aschbacher, S. D. Smith, « On Quillen's conjecture for the p-groups complex », *Ann. of
  Math.* (2) 137 (1993), no. 3, 473–529. doi:10.2307/2946530.
- K. I. Piterman, « An approach to Quillen's conjecture via centralisers of simple groups »,
  *Forum Math. Sigma* 9 (2021), e48. doi:10.1017/fms.2021.41. arXiv:2003.06384.
- P. J. Webb, « A local method in group cohomology », *Comment. Math. Helv.* 62 (1987), no. 1,
  135–167. doi:10.1007/BF02564442.
- P. Symonds, « The orbit space of the p-subgroup complex is contractible », *Comment. Math.
  Helv.* 73 (1998), no. 3, 400–405. doi:10.1007/s000140050061.
- J. Thévenaz, P. J. Webb, « Homotopy equivalence of posets with a group action », *J. Combin.
  Theory Ser. A* 56 (1991), no. 2, 173–181. doi:10.1016/0097-3165(91)90030-K.
- J. Grodal, « Higher limits via subgroup complexes », *Ann. of Math.* (2) 155 (2002), no. 2,
  405–457. doi:10.2307/3062122.
- S. D. Smith, *Subgroup Complexes*, Mathematical Surveys and Monographs 179, American
  Mathematical Society, 2011. doi:10.1090/surv/179.
- K. S. Brown, « The coset poset and probabilistic zeta function of a finite group », *J.
  Algebra* 225 (2000), no. 2, 989–1012. doi:10.1006/jabr.1999.8221.
- P. Hall, « The Eulerian functions of a group », *Q. J. Math.* 7 (1936), 134–151.
  doi:10.1093/qmath/os-7.1.134.
- J. Shareshian, R. Woodroofe, « Order complexes of coset posets of finite groups are not
  contractible », *Adv. Math.* 291 (2016), 758–773. doi:10.1016/j.aim.2015.10.018.
  arXiv:1406.6067.
- A. Díaz Ramos, « On Quillen's conjecture for p-solvable groups », *J. Algebra* 513 (2018),
  246–264. doi:10.1016/j.jalgebra.2018.07.027.
- M. Aschbacher, P. B. Kleidman, « On a conjecture of Quillen and a lemma of Robinson », *Arch.
  Math.* 55 (1990), no. 3, 209–217. doi:10.1007/BF01191159.
- K. I. Piterman, S. D. Smith, « Some results on Quillen's conjecture via equivalent-poset
  techniques », *J. Comb. Algebra* 9 (2024), no. 3, 265–387. doi:10.4171/JCA/95.
  arXiv:2204.13055.
- A. Díaz Ramos, « Quillen's conjecture and unitary groups », preprint, 2023. arXiv:2303.15613.

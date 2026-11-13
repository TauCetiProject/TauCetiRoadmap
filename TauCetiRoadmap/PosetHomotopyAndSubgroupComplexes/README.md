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
point of a finite `T₀` space can be removed by a strong deformation retraction; a homotopy
equivalence between finite `T₀` spaces without beat points is a homeomorphism (Stong's
classification); and a finite `T₀` space on which a group acts by homeomorphisms has an invariant
core, so that a contractible one has a fixed point (Layer 1); a continuous map that restricts to
weak homotopy equivalences over the members of a basis-like open cover of its target is a weak
homotopy equivalence; for an Alexandrov-discrete `T₀` space `X`, sending a point of the
realization of the order complex of `Specialization X` to the largest vertex of its carrier is a
weak homotopy equivalence onto `X`; and for every simplicial complex the carrier map onto the face
poset with its upper-set topology is a weak homotopy equivalence (McCord's theorems and the
upper-set variant of the second, Layer 2); the realization of the order complex of a partial order
is homeomorphic to the realization of its nerve; comparable monotone maps realize to homotopic maps;
a preorder with a monotone `f` and an `x₀` such that `x ≤ f x ≥ x₀` for every `x` has a contractible
realization; Quillen's fibre lemma, the case of posets of Quillen's Theorem A: a monotone map of
partial orders all of whose fibres `f⁻¹(Q≤q)` have contractible realizations realizes to a homotopy
equivalence; and for a finite group `P` acting monotonically on a finite partial order `T` such that
the fixed subposet of every nontrivial subgroup has Euler characteristic `1`, the Euler
characteristic of `T` is congruent to `1` modulo `|P|` (Layer 3); for a finite group `G` and a prime
`p`, the order complex of the poset `A_p(G)` of nontrivial elementary abelian `p`-subgroups has
chains of exactly the lengths `1, …, m_p(G)`, where `m_p(G)` is the `p`-rank (OddOrderTheorem §1.4);
the inclusion of `A_p(G)` into the poset `S_p(G)` of nontrivial `p`-subgroups realizes to a homotopy
equivalence; `S_p(G)` has a contractible realization when `G` has a nontrivial normal `p`-subgroup;
as a finite space with its upper-set topology `S_p(G)` is contractible exactly when `G` has a
nontrivial normal `p`-subgroup; when `p` divides `|G|`, the realization of `S_p(G)` is disconnected
exactly when `G` has a strongly `p`-embedded subgroup; for solvable `G`, a contractible realization
of `A_p(G)` forces a nontrivial normal `p`-subgroup; and the Euler characteristic of `S_p(G)` is
congruent to `1` modulo the `p`-part of `|G|` (Layer 4).

Suggested homes: `TauCeti/Topology/FiniteSpace/` for Layers 1–2,
`TauCeti/AlgebraicTopology/SimplicialComplex/OrderComplex/` for Layer 3 and
`TauCeti/GroupTheory/SubgroupComplex/` for Layer 4.

## Scope and ownership

**Owned here.** The homotopy theory of finite spaces: fences of comparable maps, beat points,
strong deformation retractions onto the complement of a beat point, cores, Stong's
classification and invariant cores of finite spaces with a group action (Layer 1); McCord's
theorem on basis-like open covers, his weak homotopy equivalence from the realization of the
order complex onto an Alexandrov-discrete `T₀` space, and its upper-set carrier-map variant from
a simplicial complex onto its face poset (Layer 2); the homotopy theory of posets through their
order complexes: the comparison of the order complex with the nerve, the homotopy property of
comparable maps, conical contractibility, Quillen's fibre lemma and the Euler characteristic of a
poset with a group action (Layer 3); the subgroup posets `S_p(G)` and `A_p(G)` with the
conjugation action of `G`, the dimension of `A_p(G)`, the Brown–Quillen homotopy equivalence,
contractibility in the presence of a nontrivial normal `p`-subgroup, Stong's finite-space form of
it, Quillen's connectivity criterion through strongly `p`-embedded subgroups, Quillen's theorem
for solvable groups, and Brown's homological Sylow theorem (Layer 4).
StableHomotopyKTheoryPartII's "McCord model" is Kuhn's model of a different construction, and the
uses of Mathlib's `AlexandrovDiscrete` in TotallyDistributiveTopoi concern frames and sheaf
topoi, not homotopy.

**Left to StableHomotopyKTheory.** Quillen's Theorem A for realized nerves of small categories,
`quillenTheoremA`, and its opposite-category dual (StableHomotopyKTheory §2.31). The fibre lemma
3.4 is its case of a monotone map of partial orders, read through the homeomorphism of 3.1 and the
identification of the comma category `CostructuredArrow f.monotone.functor q` with the subposet
`{p // f p ≤ q}`; this roadmap restates neither Theorem A nor the classifying space of a category.

**Left to HomotopyTheoryOfCategories.** Basic localizers, asphericity and the minimal localizer
`W∞` (HomotopyTheoryOfCategories 2.1), and Theorem A for an arbitrary basic localizer,
`mem_of_isAsphericalFunctor` (HomotopyTheoryOfCategories 2.4). Target 3.4 (b) is its case of a
monotone map of partial orders; this roadmap restates neither the localizers nor Theorem A.

**Left to OddOrderTheorem.** The `p`-core `O_p(G)`, the subgroup generated by the normal
`p`-subgroups, with its laws: a normal `p`-subgroup containing every normal `p`-subgroup, equal
to the intersection of the Sylow `p`-subgroups (OddOrderTheorem §1.1); elementary abelian
`p`-groups, their structure as `𝔽_p`-vector spaces, and the `p`-rank `m_p(G)` (OddOrderTheorem
§1.4). Neither section assumes odd order. This roadmap builds the posets `S_p(G)` and `A_p(G)`
from Mathlib's `IsPGroup` and from these elementary abelian subgroups, and restates neither
`O_p(G)` nor `m_p(G)`.

**Supplied by Tau Ceti.** Order complexes and their functoriality
(`TauCeti/AlgebraicTopology/SimplicialComplex/OrderComplex.lean`), barycentric subdivision as the
order complex of the face poset and its realization homeomorphism (`Subdivision/Basic.lean`,
`Subdivision/Homeomorph.lean`), weak realizations of abstract simplicial complexes and their
carriers (`Realization/Basic.lean`), realized simplicial maps (`Realization/Map.lean`), the Euler
characteristic of a realization as the alternating count of faces
(`Realization/CWComplex/EulerCharacteristic.lean`), the Euler characteristic of a contractible
space (`TauCeti/AlgebraicTopology/Cellular/EulerCharacteristic/FiniteCWType.lean`) and weak
homotopy equivalences (`TauCeti/Topology/Homotopy/HomotopyGroup/WeakHomotopyEquivalence.lean`).
This roadmap owns only the theorems about them stated below.

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
   `homeoWithUpperSetTopologyorderIso` is a homeomorphism onto `WithUpperSet (Specialization X)`.
   McCord, Barmak and Minian order a finite space so that the open sets are the down sets; their
   `≤` is the opposite of Mathlib's. Order complexes do not see the difference (a chain of `P` is
   a chain of `Pᵒᵈ`), and a finite space is contractible exactly when its opposite is. Witness: in
   Mathlib's Sierpiński space (`Prop`, `{True}` open), `True ⤳ False`, so
   `Specialization.toEquiv False ≤ Specialization.toEquiv True`: the open point is the top.
2. **Order complexes and realizations.** The order complex of a preorder has the nonempty finite
   chains as faces; its realization is Tau Ceti's weak realization, a subspace of `P →₀ ℝ` with
   the final topology of its closed simplices; the carrier of a point is the face whose open
   simplex contains it, and the open star of a vertex `v` is the set of points whose carrier
   contains `v`. A monotone `f : P →o Q` gives `orderComplexMap f` and
   `(orderComplexMap f).realizationMap`. Witness: for `Fin 2`, the order complex has the faces
   `{0}`, `{1}`, `{0, 1}` and its realization is an interval, in which the open star of `0` is
   the half-open edge `[0, 1)`; for the two-element discrete order it has two faces and two
   points.
3. **Subgroup posets.** `S_p(G)` is `PSubgroupPoset G p` and `A_p(G)` is `ElemAbelianPoset G p`,
   ordered by inclusion of subgroups; `G` acts by conjugation, `H ↦ gHg⁻¹`. Both are empty when
   `p` does not divide `|G|`, and the empty space is not contractible. Witness: for `G = 𝔖₃`,
   `S₂(𝔖₃)` is the three subgroups of order `2`, pairwise incomparable, and `S₃(𝔖₃)` is the
   single point `𝔄₃`.
4. **The `p`-part.** `|G|_p = p ^ (Nat.card G).factorization p`. Witness: `|𝔄₅|₂ = 4`,
   `|𝔄₅|₃ = 3`, `|𝔄₅|₅ = 5` and `|𝔄₅|₇ = 1`.
5. **Euler characteristics** of preorders are alternating counts of nonempty chains,
   `chainEulerChar T = Σ (-1)^(#σ + 1)`, the value Tau Ceti's
   `AbstractSimplicialComplex.eulerChar_realization` gives the Euler characteristic of the
   realization. Witness: for `Fin 2`, `2 − 1 = 1`; for the four-point poset `a, b < c, d`, whose
   order complex is a square, `4 − 4 = 0`.

## Exact supplier contracts

**From Mathlib** (at the pins; file names are relative to `Mathlib/`).

- Specialization and upper-set topologies: `Specialization`, `Specialization.toEquiv`,
  `Specialization.instPreorder`, `Specialization.instPartialOrder`,
  `homeoWithUpperSetTopologyorderIso`, `orderIsoSpecializationWithUpperSetTopology`
  (`Topology/Specialization`), `Specializes`, `T0Space`, `AlexandrovDiscrete`,
  `Finite.toAlexandrovDiscrete` (`Topology/AlexandrovDiscrete`), `WithUpperSet`,
  `WithUpperSet.toUpperSet`, `Topology.IsUpperSet.toAlexandrovDiscrete`
  (`Topology/Order/UpperLowerSetTopology`).
- Homotopy: `ContinuousMap`, `ContinuousMap.id`, `ContinuousMap.comp`,
  `ContinuousMap.restrictPreimage` (`Topology/ContinuousMap/Basic`), `ContinuousMap.Homotopic`,
  `ContinuousMap.HomotopicRel` (`Topology/Homotopy/Basic`), `ContinuousMap.HomotopyEquiv` with the
  notation `≃ₕ` (`Topology/Homotopy/Equiv`), `ContractibleSpace`
  (`Topology/Homotopy/Contractible`), `Homeomorph`, `ConnectedSpace`, `Relation.EqvGen`,
  `MulAction`, `ContinuousConstSMul`, `TopologicalSpace.IsTopologicalBasis` (`Topology/Bases`).
- Orders: `OrderDual`, `OrderIso`.
- Simplicial: `AbstractSimplicialComplex`, `PreAbstractSimplicialComplex`
  (`AlgebraicTopology/SimplicialComplex/Basic`), `CategoryTheory.nerve`, `SSet.toTop`
  (`AlgebraicTopology/SingularSet`), `Preorder.smallCategory`, `Monotone.functor`
  (`CategoryTheory/Category/Preorder`), `CategoryTheory.CostructuredArrow`.
- Groups: `Subgroup`, `Subgroup.Normal`, `Subgroup.map`, `Subgroup.center`, `MulAut.conj`,
  `IsPGroup` (`GroupTheory/PGroup`), `Sylow`, `Group.IsSolvable`, `Nat.factorization`, `Int.ModEq`,
  `finsum`.

**From Tau Ceti** (at the pin).

- `TauCeti.AbstractSimplicialComplex.orderComplex`,
  `TauCeti.AbstractSimplicialComplex.mem_orderComplex_iff`,
  `TauCeti.AbstractSimplicialComplex.orderComplexMap`,
  `TauCeti.AbstractSimplicialComplex.orderComplexMap_comp`
  (`TauCeti/AlgebraicTopology/SimplicialComplex/OrderComplex.lean`).
- `TauCeti.PreAbstractSimplicialComplex.barycentricSubdivision_eq_orderComplex`
  (`TauCeti/AlgebraicTopology/SimplicialComplex/Subdivision/Basic.lean`);
  `AbstractSimplicialComplex.barycentricSubdivisionRealizationHomeomorph`
  (`TauCeti/AlgebraicTopology/SimplicialComplex/Subdivision/Homeomorph.lean`).
- `TauCeti.SetLike.Face` (`TauCeti/AlgebraicTopology/SimplicialComplex/Basic.lean`);
  `AbstractSimplicialComplex.Realization`, `AbstractSimplicialComplex.carrier`,
  `AbstractSimplicialComplex.vertex`
  (`TauCeti/AlgebraicTopology/SimplicialComplex/Realization/Basic.lean`).
- `PreAbstractSimplicialComplex.SimplicialMap.realizationMap`
  (`TauCeti/AlgebraicTopology/SimplicialComplex/Realization/Map.lean`).
- `AbstractSimplicialComplex.eulerChar_realization`
  (`TauCeti/AlgebraicTopology/SimplicialComplex/Realization/CWComplex/EulerCharacteristic.lean`);
  `TauCeti.eulerChar_of_contractibleSpace`
  (`TauCeti/AlgebraicTopology/Cellular/EulerCharacteristic/FiniteCWType.lean`).
- `ContinuousMap.IsWeakHomotopyEquivalence`, `ContinuousMap.IsWeakHomotopyEquivalence.comp`,
  `ContinuousMap.HomotopyEquiv.isWeakHomotopyEquivalence`,
  `ContinuousMap.isWeakHomotopyEquivalence_of_contractibleSpace`
  (`TauCeti/Topology/Homotopy/HomotopyGroup/WeakHomotopyEquivalence.lean`).

**From StableHomotopyKTheory.** §2.31 (`quillenTheoremA` and its opposite-category dual), for 3.4
(a).

**From HomotopyTheoryOfCategories.** 2.1 (`IsBasicLocalizer`, `IsAsphericalFunctor`, `Winfty`)
and 2.4 (`mem_of_isAsphericalFunctor`), for 3.4 (b).

**From OddOrderTheorem.** §1.1: the `p`-core `O_p(H)` of a finite group `H`, the subgroup
generated by the normal `p`-subgroups, a characteristic `p`-subgroup containing every normal
`p`-subgroup and equal to the intersection of the Sylow `p`-subgroups; so `O_p(G) ≠ 1` exactly
when `G` has a nontrivial normal `p`-subgroup. For 4.3 and 4.6. §1.4: elementary abelian
`p`-groups (abelian with `e ^ p = 1` for every `e`), those of order `p ^ k` being `𝔽_p`-vector
spaces of dimension `k` through `Additive`, and the `p`-rank `m_p(G)`, the largest `k` such that
`G` has an elementary abelian `p`-subgroup of order `p ^ k`, with `m_p(H) ≤ m_p(G)` for `H ≤ G`.
For 4.1 and 4.6.

## How to read the build

Layer 1 is the homotopy theory of finite spaces on Mathlib's specialization order: homotopies are
fences of comparable maps, beat points are removed by strong deformation retractions, minimal finite
spaces are classified up to homeomorphism, and a group action keeps an invariant core. Layer 2
proves McCord's theorems: the local-to-global theorem for basis-like covers, then the weak
equivalences between an Alexandrov-discrete `T₀` space and the realization of the order complex of
its specialization order, and, in an upper-set variant, between a simplicial complex and its face
poset. Layer 3 is the homotopy theory of posets through their order complexes: the comparison with
the nerve that lets Theorem A of StableHomotopyKTheory apply, the homotopy property, conical
contractibility, the fibre lemma, and Euler characteristics of posets with a group action. Layer 4
applies Layers 1–3 to the posets `S_p(G)` and `A_p(G)` of a finite group, with Mathlib's Sylow
theory and OddOrderTheorem's `p`-core and `p`-rank.

## Layer 1: finite spaces

### 1.1 Finite spaces are posets

State, as API from Mathlib, the Alexandrov correspondence used throughout: a finite space is
Alexandrov-discrete, the topology of an Alexandrov-discrete space is the upper-set topology of
its specialization preorder (`homeoWithUpperSetTopologyorderIso`), the preorder is a partial order
exactly when the space is `T₀`, and a map between Alexandrov-discrete spaces is continuous exactly
when it is monotone for the specialization preorders (Barmak 2011, Propositions 1.2.1 and 1.2.4,
pp. 4–5). Prove that a finite space is path-connected exactly when it is connected, exactly when
its specialization preorder is connected as a graph of comparable pairs.
*Needs:* Mathlib `Specialization`, `homeoWithUpperSetTopologyorderIso`,
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
relates them (Barmak 2011, Corollary 1.2.6, p. 6). One direction holds for all spaces: if
`f₁ x ⤳ f₂ x` for every `x`, the map equal to `f₁` on `X × [0, 1)` and to `f₂` on `X × {1}` is
continuous, since the preimage of an open `V` is `f₁⁻¹(V) × [0, 1) ∪ f₂⁻¹(V) × [0, 1]`. This
homotopy is constant at every point where `f₁` and `f₂` agree, so it is a homotopy relative to any
subset `A` on which they agree: comparable maps that agree on `A` are homotopic relative to `A`.
The other direction uses that `C(X, Y)` with the compact-open topology is a finite space whose
specialization order is the pointwise one, so a path in it from `f` to `g` crosses finitely many
comparable steps.
*Needs:* 1.1; Mathlib `ContinuousMap.Homotopic`, `ContinuousMap.HomotopicRel`, `Specializes`,
`Relation.EqvGen`.

**Checks.**

- On Sierpiński space the constant map at `False` and the identity are pointwise comparable, so
  the identity is homotopic to a constant: Sierpiński space is contractible.
- On the discrete two-point space two distinct maps are never pointwise comparable, and indeed
  the two constant maps are not homotopic: path components are preserved.
- The fence cannot be shortened to one step: on the pseudo-circle, a constant map at `a` and a
  constant map at `b` are not comparable, and they are homotopic through `a ≤ c ≥ b`.

### 1.3 Beat points

Define `IsBeatPoint x` for an element of a preorder: the elements strictly below `x` have a largest
element (a down beat point), or the elements strictly above `x` have a smallest one (an up beat
point) (Barmak 2011, Definition 1.3.3, p. 7). Prove `exists_retraction_of_isBeatPoint`: for a beat
point `x` of a finite `T₀` space `X`, the space `{y // y ≠ x}` is a strong deformation retract of
`X`, through a retraction `r` sending `x` to the largest element below it (or the smallest above it)
and fixing every other point, with a homotopy from the inclusion composed with `r` to the identity,
relative to `{y | y ≠ x}` (Barmak 2011, Proposition 1.3.4, pp. 7–8); the homotopy is the relative
form of 1.2, since that composite is comparable with the identity and agrees with it off `x`. Prove
that removing beat points one at a time from a finite `T₀` space `X` ends, since each removal lowers
the number of points, at a subspace without beat points, a core of `X`.
*Needs:* 1.1, 1.2; Mathlib `ContinuousMap.HomotopicRel`, `Specialization.toEquiv`, `OrderDual`,
`OrderIso`.

**API.**

- Duality: `x` is an up beat point of `P` exactly when it is a down beat point of `Pᵒᵈ`, so
  `IsBeatPoint` is invariant under passing to the opposite order.
- Invariance: an order isomorphism `e : P ≃o Q` satisfies `IsBeatPoint (e x) ↔ IsBeatPoint x`.
- Core inclusion: the inclusion of a core `Y` into `X` is continuous, and the specialization
  order of the subspace `Y` is the order induced from `X`.
- Core retraction: the composite `r : X → Y` of the retractions of the successive beat points is
  continuous and fixes `Y` pointwise.
- Relative composite: the inclusion composed with `r` is homotopic to the identity of `X`
  relative to `Y`, each step being a homotopy relative to a set containing `Y`; so `Y` is a
  strong deformation retract of `X` and its inclusion is a homotopy equivalence.

**Checks.**

- In Sierpiński space `True` is a down beat point (the elements below it are `{False}`), and the
  retraction onto `{False}` exhibits contractibility.
- The pseudo-circle has no beat point: below `c` lie the incomparable `a` and `b`, with no
  largest element, and symmetrically above `a`. It is not contractible (2.2: it is weakly
  equivalent to the circle), so a definition allowing any point with a comparable neighbour
  would be wrong.
- In the three-element chain `0 < 1 < 2`, each point is a beat point; in the poset `0, 1 < 2`,
  the point `2` is not a down beat point (no largest element below it), but `0` is an up beat
  point, and it is a down beat point of the opposite order `2 < 0, 1`.
- The retraction onto a core: in `0, 1 < 2`, removing `0` (retracted to `2`) and then `1`
  (retracted to `2`) gives the core `{2}`, and the composite retraction is the constant map at
  `2`, comparable with the identity; a singleton has no beat point.
- A core is a subspace determined only up to homeomorphism: in the chain `0 < 1 < 2`, removing
  `2` and then `1` gives the core `{0}`, removing `0` and then `1` gives `{2}`; the pseudo-circle
  is its own core, with the identity as retraction.

### 1.4 Stong's classification

Prove `exists_homeomorph_of_homotopyEquiv`: a homotopy equivalence `e : X ≃ₕ Y` between finite
`T₀` spaces without beat points has an underlying map that is a homeomorphism (Barmak 2011,
Corollary 1.3.7, p. 8). The route: a self-map of a space without beat points homotopic to the
identity is the identity, by 1.2 and induction on the fence, since a map comparable with the
identity and different from it would produce a beat point. Hence two finite `T₀` spaces are
homotopy equivalent exactly when their cores are homeomorphic, the core is unique up to
homeomorphism, and a finite `T₀` space is contractible exactly when its core is a point.
*Needs:* 1.2, 1.3; Mathlib `ContinuousMap.HomotopyEquiv`, `Homeomorph`.

**Checks.**

- The pseudo-circle and its opposite have no beat points and are homeomorphic (the order is
  self-dual); the identity of the pseudo-circle is its only self-map homotopic to the identity.
- The hypothesis on beat points is needed: Sierpiński space and the point are homotopy
  equivalent and not homeomorphic.
- The core of the poset `0, 1 < 2` is a point: `0` is an up beat point (the smallest element
  above it is `2`); after removing it, `1` is one, and `{2}` remains.

### 1.5 Invariant cores

Prove `exists_invariant_core`: if a group `G` acts on a finite `T₀` space `X` by homeomorphisms,
`X` has a `G`-invariant core `Y` onto which it strongly deformation retracts (Barmak 2011,
Lemma 8.1.2 and Proposition 8.1.3, pp. 106–107). The route: if `x` is a down beat point then so is
every `g • x`, the orbit of `x` is an antichain (`g • x < x` would give `x < x` after finitely many
steps), and the whole orbit is removed at once by the retraction of 1.3 applied to its points. Prove
`exists_fixedPoint_of_contractibleSpace`: if moreover `X` is contractible, the invariant core is a
point (1.3 and 1.4), fixed by `G`.
*Needs:* 1.3, 1.4; Mathlib `MulAction`, `ContinuousConstSMul`, `ContractibleSpace`.

**Checks.**

- The group `ℤ/2` acting on the poset `a, b < c` by swapping `a` and `b`: the orbit `{a, b}` is
  removed at once, the invariant core is `{c}`, and `c` is the fixed point.
- `T₀` is needed: `ℤ/2` swapping the two points of the indiscrete two-point space acts by
  homeomorphisms, the space is contractible, and there is no fixed point.
- On the pseudo-circle the map `a ↦ b ↦ a`, `c ↦ d ↦ c` is an order automorphism without fixed
  point, and indeed the pseudo-circle is its own core and is not contractible; in the poset
  `0, 1 < 2` with the swap of `0` and `1`, removing the beat point `0` alone leaves the
  non-invariant subspace `{1, 2}`, while removing its orbit leaves the invariant core `{2}`.

### Examples

- `S_p(G)` and `A_p(G)` as finite spaces with the upper-set topology and the conjugation action
  (4.4).
- The non-Hausdorff suspension of `S⁰` is the pseudo-circle, a minimal finite space.

### Dependencies

Mathlib only. Within the layer, each target uses the previous ones.

## Layer 2: McCord's theorems

### 2.1 Basis-like open covers

Define `IsBasisLike 𝒰` for a family `𝒰` of subsets of a space `B`: its members are open, they cover
`B`, and every point of an intersection `U ∩ V` of two members lies in a member `W ⊆ U ∩ V`.
Prove `isWeakHomotopyEquivalence_of_isBasisLike`: if `f : C(E, B)` and `𝒰` is a basis-like open
cover of `B` such that every restriction `f.restrictPreimage U : C(f ⁻¹' U, U)`, `U ∈ 𝒰`, is a
weak homotopy equivalence, then `f` is a weak homotopy equivalence (McCord 1966, Theorem 6,
p. 467).
*Needs:* Tau Ceti `ContinuousMap.IsWeakHomotopyEquivalence`; Mathlib
`ContinuousMap.restrictPreimage`, `TopologicalSpace.IsTopologicalBasis`.

**API.**

- A basis of the topology (`TopologicalSpace.IsTopologicalBasis`) is basis-like.
- The one-set family `{B}` is basis-like.
- The minimal open neighbourhoods of the points of an Alexandrov-discrete space form a basis-like
  cover.
- Restriction: for `U ∈ 𝒰`, the members of `𝒰` contained in `U`, read in the subspace `U`, form a
  basis-like cover of `U`.

**Checks.**

- For a finite space the minimal open sets `U_x = {y | x ≤ y}` form a basis-like cover: a point
  `z ∈ U_x ∩ U_y` has `U_z ⊆ U_x ∩ U_y`. For Sierpiński space they are `U_False = {False, True}`
  and `U_True = {True}`.
- Not every open cover is basis-like: the circle covered by two open arcs, whose intersection has
  two components, contains no member inside that intersection; adding the two components gives a
  basis-like cover.
- The one-set cover `{B}` is basis-like and the theorem reduces to its hypothesis; for the
  identity of a point both sides are weak equivalences. The empty family is not a cover of a
  nonempty space. Basis-like is weaker than a basis: for Sierpiński space `{B}` is basis-like,
  but the open set `{True}` is not a union of its members.

### 2.2 From order complexes to Alexandrov-discrete spaces

Prove `exists_isWeakHomotopyEquivalence_realization`: for an Alexandrov-discrete `T₀` space `X`,
the map `μ` from the realization of `orderComplex (Specialization X)` to `X` sending a point to the
largest vertex of its carrier (a chain, so the largest vertex exists) is continuous and a weak
homotopy equivalence (McCord 1966, Theorem 2, p. 466). Continuity: the preimage of an open, that
is upper, set `U` is the union of the open stars of the vertices in `U`. The route is 2.1 for the
basis-like cover by the minimal open neighbourhoods `U_x = {y | x ≤ y}`:
`μ⁻¹(U_x) = ⋃_{y ≥ x} star(y)`, and this deformation retracts onto the realization of the order
complex of `U_x`, a cone with vertex `x` (McCord 1966, §5, Lemmas 3 and 7, pp. 469–470); `U_x` has
the smallest element `x` and is contractible by 1.2; the restriction of `μ` over `U_x` is a map
between contractible spaces, a weak equivalence by
`ContinuousMap.isWeakHomotopyEquivalence_of_contractibleSpace`.
*Needs:* 1.1, 1.2, 2.1; Tau Ceti `TauCeti.AbstractSimplicialComplex.orderComplex`,
`AbstractSimplicialComplex.Realization`, `AbstractSimplicialComplex.carrier`,
`ContinuousMap.IsWeakHomotopyEquivalence`,
`ContinuousMap.isWeakHomotopyEquivalence_of_contractibleSpace`; Mathlib `AlexandrovDiscrete`.

**Checks.**

- For Sierpiński space the order complex is an edge, the map sends the closed edge minus the
  vertex `False` to `True`, and it is a weak equivalence between contractible spaces. The
  preimage of `U_False = {False, True}` is the whole edge `[0, 1] = star(False) ∪ star(True)`,
  while `star(False)` alone is `[0, 1)`: the preimage of a minimal open set is a union of open
  stars, not one.
- For the pseudo-circle the order complex is a square, the realization is a circle, and the map
  is a weak equivalence: `π₁` of the pseudo-circle is `ℤ`, although the pseudo-circle has no beat
  point and more than one point, so it is not contractible (1.3).
- The largest vertex, not the smallest, is the continuous choice for Mathlib's order: sending a
  point of the open edge of Sierpiński space to `False` would pull back the open set `{True}` to
  a single vertex, which is not open. Infinite spaces are allowed: for discrete `ℕ` the order
  complex has only vertices, its realization is discrete `ℕ` and `μ` is the identity.

### 2.3 From simplicial complexes to face posets

Prove `exists_isWeakHomotopyEquivalence_faces`: for a simplicial complex `K` on any vertex type, the
carrier map from the realization of `K` to `WithUpperSet (Face K)`, faces ordered by inclusion, is
continuous and a weak homotopy equivalence. This is the upper-set carrier-map variant, obtained from
McCord 1966, Theorem 2, p. 466, and barycentric subdivision (compare McCord 1966, Theorem 3, p. 466,
and §6, p. 471, for the lower-set version). The preimage of the upper set of faces containing `σ` is
the open star of `σ`. The route: the face poset's order complex is the barycentric subdivision of
`K` (`TauCeti.PreAbstractSimplicialComplex.barycentricSubdivision_eq_orderComplex`), whose
realization is homeomorphic to that of `K` by
`AbstractSimplicialComplex.barycentricSubdivisionRealizationHomeomorph`, which sends a point of the
open simplex of a chain `σ₀ ⊂ ⋯ ⊂ σₖ` into the open simplex of `σₖ`; so the carrier map composed
with this homeomorphism is the map `μ` of 2.2 for `WithUpperSet (Face K)`, an Alexandrov-discrete
`T₀` space whose specialization order is inclusion (`orderIsoSpecializationWithUpperSetTopology`),
and 2.2 applies.
*Needs:* 2.2; Tau Ceti `AbstractSimplicialComplex.Realization`,
`AbstractSimplicialComplex.carrier`, `TauCeti.SetLike.Face`,
`TauCeti.PreAbstractSimplicialComplex.barycentricSubdivision_eq_orderComplex`,
`AbstractSimplicialComplex.barycentricSubdivisionRealizationHomeomorph`,
`ContinuousMap.IsWeakHomotopyEquivalence`; Mathlib `WithUpperSet`,
`orderIsoSpecializationWithUpperSetTopology`, `Topology.IsUpperSet.toAlexandrovDiscrete`.

**Checks.**

- For the complex with one edge, the face poset is `{0}, {1} < {0, 1}`, which has a top element,
  and the carrier map sends the open edge to the top: a weak equivalence of contractible spaces.
  The barycentric subdivision is two edges meeting at the barycentre, whose realization is the
  same interval.
- For the boundary of a triangle the face poset has six elements, three vertices below three
  edges, each edge above two vertices; its order complex is a hexagon, and the carrier map is a
  weak equivalence with `π₁ = ℤ` on both sides.
- The upper-set topology is the right one: with the lower-set topology the preimage of `{{0}}`
  would be a single point of the realization, not open. Infinite complexes are allowed: for the
  complex on `ℕ` whose faces are the singletons, the realization and the face poset are both
  discrete `ℕ` and the carrier map is a bijection.
- The carrier map is not McCord's map of Theorem 3: on the edge `{0, 1}`, the point with weight
  `1/4` on the vertex `1` lies in the open simplex of the subdivision chain `{0} ⊂ {0, 1}`.
  McCord's map sends it to the smallest face `{0}` of that chain and is continuous for the lower
  sets of faces; the carrier map sends it to `{0, 1}`, the largest, and is continuous for the
  upper sets.

### Examples

- Every simplicial complex is weakly equivalent to an Alexandrov-discrete space, its face poset
  (2.3), and every finite `T₀` space to a compact polyhedron (2.2).

### Dependencies

Layer 1; Tau Ceti. Within the layer, 2.2 uses 2.1 and 2.3 uses 2.2.

## Layer 3: homotopy of posets

### 3.1 Order complexes and nerves

Prove `nonempty_homeomorph_nerve`: for a partial order `P`, the realization of `orderComplex P` is
homeomorphic to `SSet.toTop.obj (nerve P)`, the classifying space of `P` in Quillen 1978, §1, by the
map that is affine on each simplex and sends the vertex `p` to the vertex of the nerve at `p`. Prove
that it is natural in monotone maps: it carries `(orderComplexMap f).realizationMap` to the
realization of the nerve map of `f.monotone.functor`. The nondegenerate simplices of the nerve of a
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
`(orderComplexMap f).realizationMap` and `(orderComplexMap g).realizationMap` are homotopic (the
homotopy property of Quillen 1978, §1). The homotopy is the prism construction: for a chain
`x₀ ≤ ⋯ ≤ xₙ` of `P`, the product of its closed simplex with `[0, 1]` is the union of the `n + 1`
simplices of the prism, and the `i`-th is sent affinely onto `f x₀, …, f xᵢ, g xᵢ, …, g xₙ`, a chain
of `Q` since `f xⱼ ≤ f xᵢ ≤ g xᵢ ≤ g xₖ` for `j ≤ i ≤ k`; the pieces agree on common faces. The
straight-line homotopy `(1 − t) f + t g` is not available: the images of a chain under `f` and under
`g` together need not form a chain.
*Needs:* Tau Ceti `TauCeti.AbstractSimplicialComplex.orderComplexMap`,
`PreAbstractSimplicialComplex.SimplicialMap.realizationMap`; Mathlib `ContinuousMap.Homotopic`.

**Checks.**

- For `P = Q = Fin 2`, the constant map at `0` and the identity are comparable, and their
  realizations, the constant map and the identity of the interval, are homotopic.
- Comparability is needed: on the discrete two-element order the identity and the swap are not
  comparable, and their realizations are not homotopic (the swap exchanges the components).
- The prism, not the straight line: for `P = Fin 2`, `Q = Fin 2 × Fin 2` with the product order,
  `f i = (i, 0)` and `g i = (i, 1)`, we have `f ≤ g`, but `f 1 = (1, 0)` and `g 0 = (0, 1)` are
  incomparable, so the straight-line midpoint of the edge has the four vertices of `Q` in its
  support, which is not a chain; the two prism triangles go to the chains
  `(0, 0) < (0, 1) < (1, 1)` and `(0, 0) < (1, 0) < (1, 1)`.

### 3.3 Conical contractibility

Prove `contractibleSpace_of_conical`: a preorder `P` with an element `x₀` and a monotone
`f : P →o P` such that `x ≤ f x ≥ x₀` for every `x` has a contractible realization (Quillen 1978,
1.5). By 3.2, the identity is homotopic to `f`, which is homotopic to the constant map at `x₀`. For
a largest element `t` take `f` constant at `t` and `x₀ = t`; for a smallest element `b` take
`x₀ = b` and `f = id`.
*Needs:* 3.2.

**Checks.**

- The poset `0, 1 < 2` is conical with `f` constant at `2`.
- The poset `0 < a, 0 < b` has a smallest element and no upper bound of `{a, b}`: no constant `f`
  satisfies `x ≤ f x`, while `f = id`, `x₀ = 0` satisfies both inequalities.
- The pseudo-circle `a, b < c, d` is not conical: `x ≤ f x` forces `f c = c` and `f d = d`, then
  `a ≤ f a ≤ c, d` forces `f a = a` and likewise `f b = b`, and no `x₀` lies below both `a` and
  `b`. Its realization is a circle (2.2).
- The hypothesis `x₀ ≤ f x` cannot be dropped: `f = id` satisfies `x ≤ f x` on every preorder,
  and with `f = id` the hypothesis says that `x₀` is a smallest element.

### 3.4 Quillen's fibre lemma

(a) Prove `exists_homotopyEquiv_of_contractible_fibres`: for a monotone map `f : P →o Q` of
partial orders such that every fibre `{p // f p ≤ q}` has a contractible realization,
`(orderComplexMap f).realizationMap` is the forward map of a homotopy equivalence (Quillen 1978,
Proposition 1.6). The dual statement for the fibres `{p // q ≤ f p}` follows by passing to `Pᵒᵈ`
and `Qᵒᵈ`, whose order complexes are those of `P` and `Q`. Derive both from Quillen's Theorem A,
StableHomotopyKTheory §2.31, and its dual: `CostructuredArrow f.monotone.functor q` is isomorphic
to the subposet `{p // f p ≤ q}` as a category, and 3.1 carries the homotopy equivalence of
realized nerves to the realized order complexes.
*Needs:* 3.1; StableHomotopyKTheory §2.31; Tau Ceti
`TauCeti.AbstractSimplicialComplex.orderComplexMap`,
`PreAbstractSimplicialComplex.SimplicialMap.realizationMap`; Mathlib `Monotone.functor`,
`CategoryTheory.CostructuredArrow`, `ContinuousMap.HomotopyEquiv`, `OrderDual`.

(b) For every basic localizer `W` (HomotopyTheoryOfCategories 2.1), a monotone map of partial
orders all of whose fibres `{p // f p ≤ q}` are `W`-aspherical is in `W`: the instance of
`mem_of_isAsphericalFunctor` (HomotopyTheoryOfCategories 2.4) at `f.monotone.functor`, through
the same identification of comma categories with fibres.
*Needs:* HomotopyTheoryOfCategories 2.1, 2.4; Mathlib `Monotone.functor`,
`CategoryTheory.CostructuredArrow`.

**Checks.**

- For the inclusion of `{0}` into `Fin 2`, the fibre over `0` is `{0}` and over `1` is `{0}`:
  both contractible, and the inclusion of a point into an interval is a homotopy equivalence.
  Both comma categories `CostructuredArrow f.monotone.functor q` are singletons; for (b), a
  category with one object has a terminal object, so it is `W`-aspherical for every basic
  localizer `W`, and the inclusion lies in every `W`.
- The fibres must be the lower fibres `f p ≤ q`, not the strict fibres `f p = q`: the bijection
  from the discrete two-element order `{a, b}` onto `Fin 2` has the points as strict fibres, all
  contractible, while the lower fibre over `1` is the discrete `{a, b}`; two points are not
  homotopy equivalent to an interval.
- For the inclusion of the subposet `{a, c}` into `a, b < c`, the lower fibre over `b` is empty,
  so the hypothesis fails, and indeed the conclusion holds only by the dual form: the upper
  fibres `{x // y ≤ x}` are `{a, c}` over `a`, `{c}` over `b` and `{c}` over `c`, all
  contractible.

### 3.5 Euler characteristics of posets with a group action

Define `chainEulerChar T`, the alternating count `Σ (-1)^(#σ + 1)` of the nonempty finite chains
of a preorder `T` (Convention 5). Prove `chainEulerChar_modEq_of_fixedPoints`: let a finite group
`P` act on a finite partial order `T` by monotone maps; if for every nontrivial subgroup `Q ≤ P`
the fixed subposet `T^Q` has `chainEulerChar T^Q = 1`, then `chainEulerChar T ≡ 1 mod |P|` (a
combinatorial form of Brown 1975, Theorem 1, p. 3, for a finite group). The route: if `P = 1`,
the congruence is modulo `1` and holds. Otherwise, `P` acts by order automorphisms, so a chain
mapped to itself is fixed pointwise and the chains fixed by `Q` are the chains of `T^Q`. For
`H ≤ P` let `e(H)` be the signed count of the chains with stabilizer exactly `H`; then
`chainEulerChar T^Q = Σ_{H ≥ Q} e(H)`. Since `P` is among the nontrivial subgroups,
`e(P) = chainEulerChar T^P = 1`; downward induction over the subgroups `1 < Q < P` gives
`e(Q) = 0`; and `e(1) ≡ 0 mod |P|`, since `P` permutes the chains with trivial stabilizer in
orbits of size `|P|`. So `chainEulerChar T = e(1) + 1`.
*Needs:* 3.3; Tau Ceti `AbstractSimplicialComplex.eulerChar_realization`,
`TauCeti.eulerChar_of_contractibleSpace`; Mathlib `MulAction`, `Subgroup`, `Int.ModEq`, `finsum`,
`OrderDual`.

**API.**

- For finite `T`, `chainEulerChar T` is the Euler characteristic of the realization of
  `orderComplex T` (`AbstractSimplicialComplex.eulerChar_realization`).
- It is `1` when that realization is contractible (`TauCeti.eulerChar_of_contractibleSpace`), in
  particular for a finite conical preorder (3.3); for a chain of `n ≥ 1` elements, the `2ⁿ − 1`
  nonempty subchains give `Σ_{k = 1}^{n} (-1)^(k + 1) (n choose k) = 1`.
- It is invariant under order isomorphisms, and `chainEulerChar Tᵒᵈ = chainEulerChar T`, since
  `T` and `Tᵒᵈ` have the same chains.
- For infinite `T` the `finsum` is `0` by convention; every statement here takes `T` finite.

**Checks.**

- `chainEulerChar` counts nonempty chains with the sign `(-1)^(#σ + 1)`: it is `1` for `Fin 2`
  (`2 − 1`), `n` for an antichain of `n` points, `0` for the pseudo-circle and `0` for the empty
  poset, not the reduced value `-1` that counting the empty chain would give.
- The modulus is `|P|`, not `p`: `ℤ/4` acting on four points permuted cyclically and a fifth
  fixed point, all incomparable, has `T^Q` the fixed point for both nontrivial subgroups, and
  `chainEulerChar T = 5 ≡ 1 mod 4`.
- Every nontrivial subgroup must be tested, not only `P`: `ℤ/4` acting through `ℤ/2` on two
  swapped points plus a fixed point has `chainEulerChar T^P = 1` but `T^Q` all three points for
  `Q` of order `2`, with `chainEulerChar = 3`; and `chainEulerChar T = 3` is `1 mod 2` but not
  `1 mod 4`. The poset `a, b < c` with `ℤ/2` swapping `a` and `b` satisfies the hypothesis
  (`T^Q = {c}`) and has `chainEulerChar = 3 − 2 = 1`.
- The trivial group is a separate case of the route: `P = 1` acting on a two-point antichain
  satisfies the hypothesis vacuously and `chainEulerChar T = 2 ≡ 1 mod 1`; here
  `e(P) = e(1) = 2`, and the identity `chainEulerChar T = e(1) + 1` of the case `P ≠ 1` would
  read `2 = 3`.

### Examples

- The face poset of a simplicial complex has an order complex, its barycentric subdivision,
  homotopy equivalent to the complex (2.3 and 3.1).
- Removing from a finite poset a point whose upper or lower link is contractible does not change
  the homotopy type of the realization (3.4 applied to the inclusion).

### Dependencies

Layer 1 for the finite-space reading; StableHomotopyKTheory §2.31 and HomotopyTheoryOfCategories
2.1, 2.4 for 3.4; Mathlib; Tau Ceti. Within the layer, 3.3 uses 3.2, 3.4 (a) uses 3.1, and 3.5
uses 3.3.

## Layer 4: subgroup complexes

### 4.1 The posets `S_p(G)` and `A_p(G)`

(a) Define `PSubgroupPoset G p`, the subgroups `H ≠ ⊥` with `IsPGroup p H`, and
`ElemAbelianPoset G p`, the subgroups `H ≠ ⊥` that are abelian with `x ^ p = 1` for every
`x ∈ H`, for prime `p` the nontrivial elementary abelian `p`-subgroups of OddOrderTheorem §1.4
(Quillen 1978, §2; Minian–Piterman 2018, p. 1), both ordered by inclusion. Define
`elemAbelianToPSubgroup`, the inclusion. Prove that conjugation by `g ∈ G`, `H ↦ gHg⁻¹`, gives an
action of `G` on both posets by order automorphisms commuting with the inclusion.

(b) Prove that `S_p(P)` and `A_p(P)` are conical for a nontrivial `p`-group `P`: with `B` a
central subgroup of order `p`, `A ≤ AB ≥ B`.

(c) Prove `exists_card_eq_iff_le_pRank`: for a finite group `G` and a prime `p`, the order complex
of `A_p(G)` has a face with `n` vertices exactly when `1 ≤ n ≤ m_p(G)`, the `p`-rank of
OddOrderTheorem §1.4, so its dimension is `m_p(G) − 1` (the empty complex when `m_p(G) = 0`). A
chain `E₁ < ⋯ < E_k` of elementary abelian subgroups has `|E_k| ≥ p ^ k`; an elementary abelian
subgroup of order `p ^ m_p(G)` is an `𝔽_p`-vector space of dimension `m_p(G)` (OddOrderTheorem
§1.4), so a maximal flag of its nonzero subspaces has `m_p(G)` members; and subchains of a chain
are chains. The Lean statement writes `m_p(G)` as the supremum of the `k` such that `G` has an
abelian subgroup of exponent dividing `p` and order `p ^ k`, which is OddOrderTheorem's
definition with its two conditions written out.
*Needs:* OddOrderTheorem §1.4; 3.3; Mathlib `Subgroup`, `IsPGroup`, `Subgroup.center`,
`MulAut.conj`, `Subgroup.map`.

**API.**

- Orders: `PSubgroupPoset G p` and `ElemAbelianPoset G p` carry the order induced from
  `Subgroup G`, `H ≤ K ↔ H.1 ≤ K.1`.
- Inclusion: `elemAbelianToPSubgroup` is monotone and injective, an order embedding; it needs no
  primality, since `x ^ p = 1` for every `x` already gives `IsPGroup p`.
- Conjugation: for `g ∈ G`, `H ↦ gHg⁻¹`, that is `Subgroup.map (MulAut.conj g).toMonoidHom`,
  maps each poset to itself and is an order automorphism, with inverse conjugation by `g⁻¹`.
- Identity and composition: conjugation by `1` is the identity, and conjugation by `gh` is
  conjugation by `h` followed by conjugation by `g`.
- Equivariance: conjugation commutes with `elemAbelianToPSubgroup`.

**Checks.**

- The posets and the inclusion: for `G = 𝔖₃`, `S₂ = A₂` is three incomparable points, `S₃ = A₃`
  is one point, and `S₅` is empty (Convention 3); for the trivial group both posets are empty for
  every `p`, the inclusion is the empty map and `m_p(1) = 0`.
- The inclusion is strict in general: for the dihedral group `D₈` of order `8`, `A₂` has seven
  elements, the centre `Z`, four reflection subgroups and two Klein four-groups, each containing
  `Z` and two reflection subgroups; `S₂` adds the cyclic subgroup of order `4` and the whole
  group, which the inclusion misses. `m₂(D₈) = 2`, and the order complex of `A₂` has faces with
  `1` and `2` vertices and none with `3`.
- Primality matters for `ElemAbelianPoset`: for `p = 4` the cyclic group of order `4` is abelian
  with `x ^ 4 = 1` and lies in `ElemAbelianPoset` at `4`, although it is not elementary abelian
  at any prime; the targets below assume `p` prime.
- Conjugation: in `𝔖₃`, conjugation by `(1 2 3)` sends `⟨(1 2)⟩` to `⟨(2 3)⟩`, in `S₂` and in
  `A₂`, and the same subgroup is reached along either path through the inclusion. Conjugation by
  `(1 2 3)` and then by `(1 3 2)` is the identity, as the composition law requires.
- Conjugation is not translation: `H ↦ gH` sends `⟨(1 2)⟩` to the coset `(1 2 3)⟨(1 2)⟩`, which
  does not contain `1` and is not a subgroup; conjugation by a central element, such as the
  generator of the centre of `D₈`, fixes every subgroup.
- (c) through the Lean form of `m_p(G)`, which is not read off orders or exponents:
  `m₃(ℤ/3) = 1`; `m₂(ℤ/4) = 1`, although `|ℤ/4| = 2²`, since `ℤ/4` fails `x ^ 2 = 1`;
  `m₂(Q₈) = 1`, since `Q₈` has a single subgroup of order `2`; `m₂(D₈) = 2`, by its Klein
  four-groups; `m_p(1) = 0`, the supremum of `{0}`. In each case the longest chain of `A_p` has
  `m_p` members.

### 4.2 The Brown–Quillen homotopy equivalence

Prove `exists_homotopyEquiv_elemAbelianToPSubgroup`: for a finite group `G` and a prime `p`, the
inclusion `A_p(G) → S_p(G)` realizes to a homotopy equivalence (Quillen 1978, Proposition 2.1).
The route is 3.4: the fibre over `P ∈ S_p(G)` is `A_p(P)`, conical by 4.1 (b). The two finite
spaces need not be homotopy equivalent: for `G = 𝔖₅` and `p = 2` the cores differ (Stong 1984,
§3, recorded in Minian–Piterman 2018, p. 7), and the smallest example is `𝔖₃ ≀ ℤ/2`, of order
`72` (Minian–Piterman 2018, Example 3.5 and Proposition 3.8, p. 7).
*Needs:* 3.4, 4.1; Mathlib `Sylow`.

**Checks.**

- For a group whose Sylow `p`-subgroups have order `p`, `A_p(G) = S_p(G)` and the inclusion is
  the identity.
- For the dihedral group of order `8`, the inclusion `A₂ → S₂` misses the cyclic subgroup of order
  `4` and the whole group; both posets have the whole group or the centre as cone point, and the
  realized inclusion is a homotopy equivalence of contractible spaces.
- The fibre over `P` is `A_p(P)`, not `A_p(N_G(P))`: for `G = 𝔖₃`, `p = 3`, both are `{𝔄₃}`, but
  for `G = 𝔖₄`, `p = 2` and `P` a Klein four-group not normal in `G`, `A₂(P)` has four elements
  while `A₂(N_G(P))` has seven.

### 4.3 Contractibility when `O_p(G) ≠ 1`

Prove `contractibleSpace_of_normal`: if `G` has a nontrivial normal `p`-subgroup `N`, the
realization of `S_p(G)` is contractible (Quillen 1978, Proposition 2.4). The poset is conical
(3.3): `Q ≤ QN ≥ N`, where `QN` is a `p`-subgroup since `N` is normal. Through 4.2 the
realization of `A_p(G)` is contractible as well. Since `O_p(G)` is a normal `p`-subgroup
containing every normal `p`-subgroup (OddOrderTheorem §1.1), the hypothesis says `O_p(G) ≠ 1`.
*Needs:* 3.3, 4.1, 4.2; OddOrderTheorem §1.1.

**Checks.**

- `𝔖₄` with `p = 2` has the normal Klein four-group `O₂(𝔖₄)`, the intersection of its three
  Sylow `2`-subgroups, although none of them is normal, and its `S₂` is contractible.
- `𝔖₃` with `p = 2` has no nontrivial normal `2`-subgroup, and `S₂(𝔖₃)` is three points, not
  contractible.
- `QN` need not be elementary abelian when `Q` and `N` are: in the dihedral group of order `8`,
  with `N` a Klein four-group (normal, of index `2`) and `Q` a reflection subgroup outside `N`,
  `QN` is the whole group; the argument is made in `S_p(G)` and transported by 4.2.

### 4.4 Stong's finite-space form

Prove `contractibleSpace_withUpperSet_iff`: `S_p(G)` with the upper-set topology is a contractible
finite space exactly when `G` has a nontrivial normal `p`-subgroup (Stong 1984, as stated in
Minian–Piterman 2018, Proposition 2.1, p. 4). One direction is the fence `id ≤ (Q ↦ QN) ≥ const N`
of 1.2. For the other, `G` acts on the finite `T₀` space `S_p(G)` by conjugation, through
homeomorphisms (4.1), and a contractible finite `T₀` space with a group action has a fixed point
(1.5): a nontrivial `p`-subgroup fixed by conjugation, that is, normal. The analogous statement for
`A_p(G)` fails in one direction (the group `((𝔄₄ × 𝔄₄) ⋊ ℤ/2) ⋊ ℤ/2` of order `576`, Minian–Piterman
2018, Example 3.7, p. 7).
*Needs:* 1.2, 1.5, 4.1, 4.3.

**Checks.**

- For a nontrivial finite `p`-group `P`, `S_p(P)` has the largest element `P` and is contractible
  as a finite space. For `P = 1` and `p = 2`, `S₂(1)` is empty, not contractible, and `1` has no
  nontrivial normal `2`-subgroup: both sides are false.
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
with `O_p(G) = 1`, the reduced homology of `A_p(G)` is nonzero in degree `m_p(G) − 1`, the
dimension of 4.1 (c).
*Needs:* 4.1, 4.2; OddOrderTheorem §1.1, §1.4; Mathlib `Group.IsSolvable`.

**Checks.**

- `𝔖₃`, `p = 2`: solvable, `O₂ = 1`, and `A₂` is three points, not contractible.
- `𝔖₄`, `p = 3`: solvable, `O₃ = 1`, and `A₃` is the four Sylow `3`-subgroups, not contractible;
  `p = 2`: `O₂ ≠ 1` and `A₂` is contractible (4.3), consistent with the theorem.
- `𝔄₅` at `p = 2` is not solvable; there `O₂ = 1` and `A₂` is disconnected (4.5), as
  Conjecture 2.9 predicts. Solvability is the hypothesis of Corollary 12.2, and the statement
  without it is the open conjecture.

### 4.7 Brown's homological Sylow theorem

Prove `eulerChar_pSubgroupPoset_modEq`: `chainEulerChar (PSubgroupPoset G p)`, the Euler
characteristic of the realization of `S_p(G)` (Convention 5), is congruent to `1` modulo `|G|_p`
(Brown 1975, Corollary 2 to Theorem 2, p. 4). The route is 3.5 for a Sylow `p`-subgroup `P`, of
order `|G|_p`, acting by conjugation (4.1): for every nontrivial `Q ≤ P` the fixed subposet
`S_p(G)^Q` is the set of nontrivial `p`-subgroups normalized by `Q`, conical by `R ≤ RQ ≥ Q`
(Brown 1975, the lemma to Theorem 2, p. 3), so it has `chainEulerChar = 1` by 3.3 and the API of
3.5.
*Needs:* 3.3, 3.5, 4.1; Tau Ceti `AbstractSimplicialComplex.eulerChar_realization`,
`TauCeti.eulerChar_of_contractibleSpace`; Mathlib `Sylow`, `Int.ModEq`, `Nat.factorization`.

**Checks.**

- `𝔄₅`: `S₂` is five cones, `χ = 5 ≡ 1 mod 4`; `S₃` is ten points, `χ = 10 ≡ 1 mod 3`; `S₅` is
  six points, `χ = 6 ≡ 1 mod 5`.
- `𝔖₃`, `p = 2`: `χ = 3 ≡ 1 mod 2`; `𝔖₄`, `p = 2`: contractible, `χ = 1`; the trivial group and
  `𝔄₅` at `p = 7`: `S_p` is empty, `χ = 0`, and `0 ≡ 1 mod 1`.
- The modulus is the full `p`-part and not `p`: for `𝔄₅` and `p = 2`, `5 ≢ 1 mod 8` and
  `5 ≡ 1 mod 4 = |𝔄₅|₂`, which a count of the chains fixed by the whole Sylow subgroup alone
  would only give modulo `2`.

### Examples

- `𝔄₅` at `p = 2, 3, 5`: disconnected posets, discrete for `p = 3, 5`, with Euler characteristics
  `5`, `10`, `6`.
- Nontrivial finite `p`-groups, and finite groups with a nontrivial normal Sylow `p`-subgroup:
  contractible posets. The trivial group has empty posets.

### Dependencies

Layers 1–3; OddOrderTheorem §1.1 and §1.4; Mathlib; Tau Ceti for 4.7. Within the layer, 4.2 uses
4.1, 4.3 uses 4.2, 4.4 uses 4.3, and 4.5–4.7 use 4.1.

## Downstream consumers

The subgroup-complex comparisons support equivariant topology and the study of group cohomology
through subgroup posets.

## Research context

The posets of this roadmap carry more structure than their homotopy type. For a finite group `G` and
a prime `p` dividing `|G|`, Webb conjectured that the orbit space of the realization of `S_p(G)`
under conjugation is contractible (Webb 1987), and Symonds proved it (Symonds 1998); homotopy
equivalences of posets with a group action are treated by Thévenaz and Webb (1991), and Grodal
relates subgroup complexes to higher limits over orbit categories (Grodal 2002). Smith's monograph
(Smith 2011) surveys subgroup complexes. For the poset of cosets of proper subgroups of a finite
group `G`, Brown showed that the reduced Euler characteristic is `-P_G(-1)`, where `P_G` is the
probabilistic zeta function, built from Hall's Möbius inversion on the subgroup lattice (Brown 2000;
Hall 1936). Shareshian and Woodroofe proved that this coset poset is never contractible, and record
as open whether `P_G(-1)` is nonzero for every finite group `G` (Shareshian–Woodroofe 2016, §1.1).

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
  Math.* 28 (1978), no. 2, 101–128. doi:10.1016/0001-8708(78)90058-0. Cited: §1 (the
  classifying space of a poset and the homotopy property), 1.5, Propositions 1.6, 1.9, 2.1, 2.4,
  2.6, 5.2, Conjecture 2.9, Corollary 12.2, and §2 for `A_p(G)`.
- K. S. Brown, « Euler characteristics of groups: the p-fractional part », *Invent. Math.* 29
  (1975), no. 1, 1–5. doi:10.1007/BF01405170. Theorem 1 (p. 3), the lemma to Theorem 2 (p. 3),
  Corollary 2 to Theorem 2 (p. 4).
- M. C. McCord, « Singular homology groups and homotopy groups of finite topological spaces »,
  *Duke Math. J.* 33 (1966), 465–474. doi:10.1215/S0012-7094-66-03352-7. Theorems 2 and 3
  (p. 466), Theorem 6 (p. 467), §5, Lemmas 3 and 7 (pp. 469–470), §6 (p. 471).
- R. E. Stong, « Group actions on finite spaces », *Discrete Math.* 49 (1984), 95–100.
  doi:10.1016/0012-365X(84)90156-0. §3.
- J. A. Barmak, *Algebraic Topology of Finite Topological Spaces and Applications*, Lecture Notes
  in Math. 2032, Springer, 2011. doi:10.1007/978-3-642-22003-6. Propositions 1.2.1 and 1.2.4
  (pp. 4–5), Corollary 1.2.6 (p. 6), Definition 1.3.3 and Proposition 1.3.4 (pp. 7–8),
  Corollary 1.3.7 (p. 8), Lemma 8.1.2 and Proposition 8.1.3 (pp. 106–107).
- J. A. Barmak, E. G. Minian, « Simple homotopy types and finite spaces », *Adv. Math.* 218
  (2008), no. 1, 87–104. arXiv:math/0611158.
- E. G. Minian, K. I. Piterman, « The homotopy types of the posets of p-subgroups of a finite
  group », *Adv. Math.* 328 (2018), 1217–1233. doi:10.1016/j.aim.2017.12.022.
  arXiv:1612.04302. Proposition 2.1 (p. 4), Examples 3.5 and 3.7 and Proposition 3.8 (p. 7), and
  the definitions of `S_p(G)` and `A_p(G)` (p. 1), numbered and paged as in arXiv:1612.04302v1.
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

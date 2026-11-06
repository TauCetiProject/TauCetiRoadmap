# Roadmap: pseudoline arrangements, oriented matroids, and combinatorial maps

**Summary.** Build oriented matroids through chirotopes and covectors, their rank-3 theory as
arrangements of pseudolines, and the cartographic group acting on flags. The carriers are plain
sign vectors `E → SignType`; the structure `Chirotope r E` with the three-term Grassmann–Plücker
relations and a matroid of bases; `OrientedMatroid E` in covector form; x-monotone arrangements
`MonotoneArrangement n` with the line at infinity as `none : Option (Fin n)`; wiring diagrams as
words of adjacent swaps; Mathlib's `CoxeterMatrix` and `CoxeterSystem`; and SurfaceTopology's flag
carrier `GMap n D`. The end theorems are: the covectors of a chirotope form an oriented matroid;
in a simple rank-3 chirotope every tope has at least three walls; Sylvester–Gallai for every
simple rank-3 chirotope on a finite type (a rank-2 flat with exactly two elements); the cell
decomposition of a monotone arrangement with `n ≥ 2`, whose point sign vectors are the covectors
with value `1` at `none`; the Folkman–Lawrence representation of every simple rank-3 chirotope on
`Option (Fin n)` in which `none` is in general position by a monotone arrangement, up to
relabelling and reorientation; the Felsner–Weil characterization of signotopes; Ringel's theorem
that uniform rank-3 chirotopes on a finite type are connected by legal triangle flips and
reorientations; Levi's enlargement lemma; the stretchability criterion and a non-stretchable
arrangement of nine pseudolines (non-Pappus); the faithfulness of the map of an arrangement over
its skeleton, and, for uniform chirotopes on at least four elements, the reconstruction of the
map from the labelled skeleton; for nonempty flag systems, the classification of connected ones
by subgroups of the cartographic group and of regular ones by normal subgroups; and the regular
maps of the hemi-icosahedron and of the torus `(ZMod n)²`, `n ≥ 3`, whose group has `12 n²`
elements.

Suggested homes: `TauCeti/Combinatorics/SignVector/` (Layer 0),
`TauCeti/Combinatorics/OrientedMatroid/` (Layers 1, 2, 5), `TauCeti/Combinatorics/Pseudoline/`
(Layers 3, 4, 6) and `TauCeti/Combinatorics/GMap/Cartographic/` (Layers 7–10).

## Scope and ownership

**Owned here.** Sign vectors; chirotopes and covector oriented matroids of every finite rank, with
minors, duality, realizability, the face lattice and the projective face poset (Layers 0–2);
rank-2 oriented matroids as cyclic orders (2.7); rank-3 oriented matroids as x-monotone
pseudoline arrangements, Sylvester–Gallai and the arrangements with no bigonal element, and the
map of a projective arrangement with its skeleton (Layer 3); allowable sequences, wiring diagrams,
signotopes, local sequences, legal triangle flips and Ringel's theorem (Layer 4); single-element
extensions, Levi's enlargement lemma and the poset of relative positions of a new pseudoline
(Layer 5); stretchability and the non-Pappus arrangement (Layer 6); the action of the cartographic
group on flags, residues, coset and regular flag systems, string C-groups and abstract regular
polytopes, the Platonic, hemi-icosahedral and toroidal maps (Layers 7–9); the string and
cartographic applications of the geometric representation (Layer 10). A search of main and of the
open roadmap pull requests for oriented matroids, chirotopes, pseudolines and signotopes finds no
other owner; the flag carrier and the cartographic group are discussed below.

**Left to other roadmaps.**

- SurfaceTopology Layer 1 owns the flag carrier `GMap n D` (finite, decidable darts), its cells
  `GMap.Cell`, components `GMap.Components`, `GMap2.Iso`, `GMap2.eulerChar`, `IsSurfaceGMap`,
  `IsClosedSurfaceGMap` and `GMap2.IsOrientable`; its Layer 2 the conversion between oriented maps
  and BelyiMaps' bipartite ribbon graphs; its Layer 4 the orientation double cover; its Layer 8 the
  classification of compact surfaces. This roadmap builds no second carrier and no second
  conversion. SurfaceTopology excludes higher-dimensional map theory beyond its carrier, so the
  rank-polymorphic cartographic material of Layers 7 and 9 is owned here, on that carrier.
- BelyiMaps owns `TauCeti.BipartiteRibbonGraph`, `TauCeti.PermutationTriple`, dessins and
  triangle groups.
- GraphConnectivityAndFlows Target 1.1 owns connectivity, components and isomorphisms of
  Mathlib's `Graph α β` and its bridges to `SimpleGraph`; skeletons (8.3) are such graphs.
- RootSystems (Layers 2 and 4) owns Weyl groups as Coxeter systems and the longest element of a
  Weyl group. The faithfulness of the geometric representation of an arbitrary Coxeter system is
  owned by no roadmap on main; it is the supplier gap gap:coxeter-geometric-faithfulness below.
- Tau Ceti owns the geometric representation of a Coxeter system (supplier contracts).
- ConformalMapping owns the Jordan-curve material of Tau Ceti (`TauCeti.IsJordanCurve`), which is
  not used here: pseudolines are graphs of continuous functions.

**Out of scope.** Arrangements of arbitrary Jordan curves in the projective plane or on the sphere,
the Schoenflies theorem and Goodman's theorem that such an arrangement is isomorphic to a wiring
diagram; topological representation in rank `≥ 4`, pseudosphere arrangements, shellability of the
face lattice and the extension space conjecture; Mnëv's universality theorem and the complexity
of stretchability; matroid theory without orientation beyond the matroid of a chirotope, which is
Mathlib's; hyperplane arrangements over `ℝ` or `ℂ` (complements, Orlik–Solomon algebras,
characteristic polynomials). Whether the reconstruction of 8.4 (ii) extends to non-uniform simple
rank-3 chirotopes with no bigonal element is not a target.

## Conventions

1. **Signs and sign vectors.** Signs are Mathlib's `SignType` (`-1 < 0 < 1`) and `SignType.sign`;
   a sign vector on `E` is a function `E → SignType`, with no wrapper type. Composition
   `SignVector.compose X Y` takes `X e` where `X e ≠ 0` and `Y e` otherwise; `SignVector.sep X Y`
   is `{e | X e ≠ 0 ∧ Y e = -X e}`; the conformal order `SignVector.ConfLE X Y` is
   `∀ e, X e = 0 ∨ X e = Y e`, never the pointwise order. Witness: in 0.1.
2. **Chirotopes.** `Chirotope r E` is a function `(Fin r → E) → SignType`, not identically zero,
   zero on non-injective tuples, alternating (`χ (b ∘ σ) = permSign σ * χ b`, where `permSign`
   is `Equiv.Perm.sign` read in `SignType`), whose nonzero supports are the bases of a matroid
   (`Matroid.ExchangeProperty`), and which satisfies the three-term Grassmann–Plücker relations
   `GP3`: for `x : Fin r → E`, positions `i ≠ j` and `a b c d : E`, writing `s u v` for `χ` of `x`
   with `u` at `i` and `v` at `j`, the values `s a b * s c d`, `-(s a c * s b d)` and
   `s a d * s b c` are all `0` or include both `1` and `-1` (BLSWZ Definition 3.5.3 in the form of
   Lemma 3.5.4). A chirotope and its negative define the same oriented matroid; the chirotope is
   the primary datum. A function is a chirotope function, `IsChirotope c`, when some chirotope has
   it as values; realization, reorientation, relabelling, flips and the chirotope of an
   arrangement are functions, and that they are chirotopes is a theorem. Witness: in 1.1.
3. **Realization.** For `v : E → Fin r → 𝕜`, `Chirotope.ofVectorsFun v` is
   `b ↦ SignType.sign (Matrix.of fun i j ↦ v (b i) j).det`: the rows of the matrix are the
   vectors. It needs only `[Field 𝕜] [LinearOrder 𝕜]`; the theorems that it is a chirotope and
   the predicate `Chirotope.IsRealizable c 𝕜` (`∃ v, c = ofVectorsFun v`) carry
   `[IsStrictOrderedRing 𝕜]`, an ordered field. Witness: in 1.4.
4. **Covectors.** `OrientedMatroid E` is a set of sign vectors with (L0) `0 ∈ L`, (L1)
   `X ∈ L → -X ∈ L`, (L2) closure under composition and (L3) elimination: for `X, Y ∈ L` and
   `e ∈ sep X Y` some `Z ∈ L` has `Z e = 0` and `Z f = (X ∘ Y) f` for `f ∉ sep X Y` (BLSWZ
   Definition 4.1.1). The cocircuit vector `Chirotope.cocircuitVec c x i` is
   `e ↦ c (Function.update x i e)`, and `Chirotope.covectorsOf c` is the set of compositions of
   finite lists of cocircuit vectors and of their negatives; for a finite `E` it is the classical
   covector set (BLSWZ Proposition 3.7.2), and for an infinite `E` it can fail (L3) (Check of
   2.2). Witness: in 2.1.
5. **Monotone arrangements.** `MonotoneArrangement n` is a family `f : Fin n → ℝ → ℝ` of
   continuous functions with a symmetric `crossX : Fin n → Fin n → ℝ`, `0` on the diagonal, such
   that for `i < j` and `x₀ = crossX i j`, `f i x < f j x` for `x < x₀`, `f i x₀ = f j x₀` and
   `f j x < f i x` for `x > x₀`: indices increase upward at the far left and
   downward at the far right. The line at infinity is `none : Option (Fin n)`, last in
   `WithTop (Fin n)`. Witness: in 3.1.
6. **Points and sides.** `MonotoneArrangement.signAt A p` sends `none` to `1` and `some i` to
   `SignType.sign (f i p.1 - p.2)`: the positive side of a pseudoline is the side below it. With
   this sign the point sign vectors are covectors (3.5); with `sign (p.2 - f i p.1)` they are the
   negatives of covectors on the `some` coordinates and are not covectors. Witness: in 3.2.
7. **Arrangement chirotope.** `MonotoneArrangement.crossX i j`, a field of the structure, is the
   abscissa where `i` and `j` cross. `MonotoneArrangement.chiFun` is fixed on increasing triples by
   `χ (some i, some j, some k) = sign (crossX j k - crossX i j)` for `i < j < k` and
   `χ (some i, some j, none) = 1` for `i < j`, and extended alternatingly. With this convention the
   straight line `y = a x + b` has the vector `(-1, a, b)` and the line at infinity `(0, 0, 1)`:
   3.4 is an equality, not an equality up to sign. Witness: in 3.4.
8. **Wiring diagrams.** Positions are counted from the bottom; a permutation `π` of a sweep sends a
   position to the wire occupying it. A simple wiring diagram on `n + 1` wires is a word
   `w : List (Fin n)`; the letter `i` swaps positions `i` and `i + 1`, acting by
   `π ↦ π * Equiv.swap i.castSucc i.succ`, so the word is read left to right. It is a wiring
   diagram when the product of its letters is `Fin.revPerm` and its length is `(n + 1) n / 2`.
   Witness: in 4.2.
9. **Signotopes.** A rank-3 signotope on `Fin m` assigns a nonzero sign to each triple `i < j < k`
   and, for each `i < j < k < l`, the values on `ijk, ijl, ikl, jkl` change sign at most once
   (Felsner–Weil). Witness: in 4.4.
10. **Flag systems.** The carrier is SurfaceTopology's `GMap n D`:
    `adj : Fin (n + 1) → Equiv.Perm D` with every `adj i` involutive and `adj i`, `adj j` commuting
    when `i + 2 ≤ j`. Grothendieck's `n`-cartes are exactly these objects. Products of permutations
    are Mathlib's (`(σ * τ) x = σ (τ x)`). A flag system is *connected* when the group generated by
    the `adj i` acts transitively on `D`; the empty flag system is connected in this sense, and
    every statement that needs a flag says `Nonempty D`. Witness: in 7.3.
11. **String Coxeter matrices.** `stringCoxeterMatrix n p hp` on `Fin (n + 1)` has `1` on the
    diagonal, `p i` at `(i, i + 1)` and `2` elsewhere; following Mathlib, the entry `0` means `∞`.
    The *cartographic group* `cartographicGroup n` is `(stringCoxeterMatrix n 0 _).Group`.
    Witness: in 7.1.
12. **Cells, actions and automorphisms.** For `J ⊆ Fin (n + 1)` a `J`-residue is an orbit of the
    subgroup generated by the `adj j`, `j ∈ J`; the `i`-cells are SurfaceTopology's `GMap.Cell`,
    the residues of `{j | j ≠ i}`. The cartographic group acts on the left; the regular flag system
    of a group `G` with generating involutions `ρ` has flags `G` and `adj i g = ρ i * g`, its
    automorphisms are right multiplications, and its automorphism group is identified with `Gᵐᵒᵖ`,
    as in Tau Ceti's `TauCeti.PermutationTriple` (monodromy against automorphisms through `ᵐᵒᵖ`).
    A `GMap n D` corresponds to polytopes of rank `n + 1`. Witness: in 9.2.

## Exact supplier contracts

**From Mathlib** (at the pins).

- Signs and determinants: `SignType`, `SignType.sign`, `Equiv.Perm.sign`, `Matrix.of`,
  `Matrix.det`, `crossProduct`, `Submodule.span`, `Function.update`, `Fin.revPerm`,
  `Equiv.swap`, `Equiv.optionCongr`, `WithTop`, `List.prod`, `Relation.ReflTransGen`.
- Matroids and orders: `Matroid`, `Matroid.ofIsBaseOfFinite`, `Matroid.ExchangeProperty`,
  `Matroid.IsBase`, `Matroid.IsFlat`, `Matroid.eRk`, `Matroid.dual`, `CircularOrder`, `sbtw`.
- Topology: `IsPathConnected`.
- Groups: `CoxeterMatrix`, `CoxeterMatrix.Group`, `CoxeterMatrix.simple`,
  `CoxeterMatrix.IsLiftable`, `CoxeterMatrix.toCoxeterSystem`, `CoxeterMatrix.A`,
  `CoxeterMatrix.B`, `CoxeterMatrix.H₃`, `CoxeterMatrix.reindex`, `CoxeterSystem`,
  `CoxeterSystem.lift`, `CoxeterSystem.lengthParity`, `Subgroup.closure`, `Subgroup.center`,
  `Subgroup.zpowers`, `Subgroup.centralizer`, `alternatingGroup`, `MulAction.IsPretransitive`,
  `MulAction.orbitRel`, `Function.Involutive.toPerm`, `ZMod`.
- Linear algebra: `Representation`, `Finsupp.linearEquivFunOnFinite`, `LinearEquiv.conjAlgEquiv`,
  `MonoidHom.ofClass`.
- Graphs: `Graph`, `Graph.IsLink`, `Graph.Simple`, `Graph.toSimpleGraph`, `SimpleGraph`.

**From Tau Ceti** (at the pins). `TauCeti/GroupTheory/Coxeter/Geometric.lean`:
`CoxeterMatrix.geometricForm`, `CoxeterMatrix.geometricReflection`,
`CoxeterMatrix.isLiftable_geometricReflection`, `CoxeterSystem.geometricRepresentation`,
`CoxeterSystem.geometricRepresentation_simple`, `CoxeterSystem.orderOf_simple_mul_simple`,
`CoxeterSystem.orderOf_simple`, for Layer 10. `TauCeti/Combinatorics/RibbonGraph/`:
`TauCeti.BipartiteRibbonGraph.even_eulerChar`,
`TauCeti.BipartiteRibbonGraph.IsConnected.eulerChar_le_two` and
`TauCeti.BipartiteRibbonGraph.IsConnected.two_sub_two_mul_genus`, which reach orientable maps
through SurfaceTopology Layer 2 (Layer 8).

**From SurfaceTopology.** Layer 1 as it stands:
`structure GMap (n : ℕ) (D : Type*) [Fintype D] [DecidableEq D]` with `adj`, `involutive`,
`commute_of_far`; `abbrev GMap2 (D) [Fintype D] [DecidableEq D]`; `GMap.Cell`, `GMap.Components`,
`GMap2.Iso`, `GMap2.eulerChar`, `IsSurfaceGMap`, `IsClosedSurfaceGMap` (`IsSurfaceGMap` and no dart
fixed by `adj 2`) and `GMap2.IsOrientable`, for 3.7 and Layer 8. Layer 2:
`CombinatorialMap.toBipartiteRibbonGraph`, `BipartiteRibbonGraph.toCombinatorialMap` and
`BipartiteRibbonGraph.eulerChar_toCombinatorialMap`, for Layer 8. Layer 4:
`GMap2.orientationDoubleCover` and `GMap2.orientationDoubleCover_eulerChar`, for 8.2 and 9.5.
Layer 8: the classification of compact surfaces, for Layer 8.

What SurfaceTopology must provide (gap:gmap-arbitrary-darts): `GMap n D` and its cells without
the `Fintype D` and `DecidableEq D` arguments, finiteness a hypothesis of the counting results.
Layers 7 and 9 need it: coset flag systems live on `cartographicGroup n ⧸ H`, which is infinite
for subgroups of infinite index, and regular flag systems on arbitrary groups.

**From GraphConnectivityAndFlows.** Target 1.1: the graph-isomorphism interface of `Graph α β`
(equivalences of vertex and edge sets preserving `IsLink`, with identity, inverse and composition)
and the bridge `toSimpleGraph (Graph.ofSimpleGraph H) ≃ H`, for 8.3 and 8.4.

**From RootSystems.** What RootSystems must provide (gap:coxeter-geometric-faithfulness):
injectivity of `CoxeterSystem.geometricRepresentation` for every Coxeter system
`cs : CoxeterSystem M W` on an arbitrary index type (Humphreys, §5.4, Corollary to Theorem 5.4),
for 10.1 and 10.2. RootSystems is the owner of Coxeter combinatorics on main (Layer 3 there); its
Layers 2 and 4 are named in Scope and not used.

Neither pin has orientations of matroids, chirotopes, sign vectors, arrangements of curves,
wiring diagrams, signotopes or abstract polytopes.

## How to read the build

Layer 0 builds sign vectors. Layer 1 builds chirotopes on Layer 0 and Mathlib's matroids, with
realizations, minors and duality. Layer 2 builds covectors on Layers 0–1 and proves that the
covectors of a chirotope are an oriented matroid, with walls, the face lattice and rank 2. Layer 3
is the topological model in rank 3 (monotone arrangements, cells, the Folkman–Lawrence theorem,
Sylvester–Gallai) on Layers 1–2; its map target 3.7 consumes SurfaceTopology. Layer 4 adds wiring
diagrams, signotopes and flips on Layers 1–3. Layer 5 builds single-element extensions on Layers 1–2
and closes the unmarked representation with 3.6. Layer 6 uses Layers 1, 3 and 5 for stretchability
and the non-Pappus arrangement. Layer 7 builds the cartographic group on Mathlib's Coxeter systems
and its action on SurfaceTopology's flag carrier; Layer 8 compares SurfaceTopology's maps with Layer
7 and with Layer 3; Layer 9 builds regular flag systems and the examples on Layers 7–8. Layer 10
specializes Tau Ceti's geometric representation to the string Coxeter groups of Layer 7.

## Layer 0: sign vectors

### 0.1 Composition, separation, conformal order

Define `SignVector.compose`, `SignVector.sep` and `SignVector.ConfLE` (Convention 1), the support
of a sign vector (the set where it is nonzero) and reorientation on `A : Set E` (negate the
coordinates in `A`). Prove: composition is associative and idempotent; `X ∘ Y = X` when the support
of `Y` lies in that of `X`; `-(X ∘ Y) = (-X) ∘ (-Y)`; `X ∘ Y = Y ∘ X` iff `sep X Y = ∅`; `sep` is
symmetric; `ConfLE` is a partial order with least element `0` and `X ≤ᶜ X ∘ Y`; reorientation is
an involution commuting with negation and composition (BLSWZ §3.7, §4.1).
*Needs:* Mathlib `SignType`.

**Checks.**

- On `{e₁, e₂}`, `X = (+, 0)` and `Y = (-, +)`: `X ∘ Y = (+, +)`, `Y ∘ X = (-, +)` and
  `sep X Y = sep Y X = {e₁}`. A composition taking `Y` where the two disagree would give
  `X ∘ Y = (-, +)`; the two orders of composition differ exactly because `sep X Y ≠ ∅`.
- `0 ≤ᶜ (-, -)` holds while the pointwise order `0 ≤ (-, -)` fails, and `(-, 0) ≤ (0, 0)` holds
  pointwise while `(-, 0) ≤ᶜ (0, 0)` fails: the conformal order is not the order of
  `E → SignType`.
- Reorientation on `{e₁}` commutes with composition on the pair above: reorienting `X ∘ Y = (+, +)`
  gives `(-, +)`, and composing the reoriented `(-, 0)` and `(+, +)` gives `(-, +)`.

### 0.2 Restriction and extension by zero

For `E' ⊆ E`, define the restriction of a sign vector to `E'` and the extension of a sign vector
on `E'` by `0`; prove that both commute with composition, negation, `sep` and `ConfLE`, and that
restriction after extension is the identity.
*Needs:* 0.1.

**Checks.**

- For `E' = {e₁} ⊆ {e₁, e₂}`: `(+)` extends to `(+, 0)` and restricts back to `(+)`; but
  `(+, -)` restricts to `(+)` and extends to `(+, 0) ≠ (+, -)`, so extension after restriction is
  not the identity.
- Extension of `(0)` and `(-)` gives `(0, 0)` and `(-, 0)`, whose composition `(-, 0)` is the
  extension of `(0) ∘ (-) = (-)`.
- Extension by `+` instead of `0` does not commute with negation: it sends `-(+) = (-)` to
  `(-, +)`, while the negative of the extension `(+, +)` is `(-, -)`.

### Examples

- The nine sign vectors on two elements, with `(+, 0) ≤ᶜ (+, -)` and `(+, 0) ≤ᶜ (+, +)`.

### Dependencies

Mathlib only. 0.2 uses 0.1.

## Layer 1: chirotopes

### 1.1 The structure

Define `Chirotope r E` (Convention 2) with its `CoeFun`, `permSign`, `GP3` and `IsChirotope`, and
prove: a chirotope vanishes on tuples with a repeated entry; `χ (b ∘ σ) = χ b` for even `σ`; its
support is invariant under permutation of the tuple (BLSWZ Definition 3.5.3, Lemma 3.5.4).
*Needs:* Mathlib `SignType`, `Equiv.Perm.sign`, `Matroid.ExchangeProperty`, `Function.update`.

**Checks.**

- The alternating chirotope on `{1, …, 5}` (value `1` on every increasing triple) satisfies every
  three-term relation and the basis exchange, by enumeration of all tuples.
- On `{1, 2, 3, 4}` in rank 2, the alternating function with the single change `χ (1, 3) = -1`
  has all pairs as bases but fails the three-term relation at `(a, b, c, d) = (1, 2, 3, 4)`: the
  three terms `χ12 χ34`, `-χ13 χ24`, `χ14 χ23` are all `1`.
- In rank 0 the only tuple is empty, and the chirotopes on any `E`, including an empty one, are
  the two functions `±1`; in rank `r > |E|` there is no injective tuple and no chirotope (none of
  rank 3 on a 2-element type).

### 1.2 Grassmann–Plücker

Prove that every chirotope satisfies the full Grassmann–Plücker relations: for `r + 1` elements
`x₁, …, xₖ, …` and `r - 1` elements `y₁, …`, the signs, over `k`, of
`(-1)^k * χ (x without xₖ) * χ (xₖ, y₁, …)` are all `0` or include both `1` and `-1` (BLSWZ
Definition 3.5.3, (B2'), from Lemma 3.5.4 and §3.6).
*Needs:* 1.1.

**Checks.**

- In rank 1 the relation has the two terms `-χ x₂ χ x₁` and `χ x₁ χ x₂`, which are opposite: it
  holds for every function.
- In rank 2 the full relations are the three-term relations of Convention 2 (one `x`, three `y`).
- For the alternating chirotope on `{1, …, 5}`, `x = (1, 2, 3, 4)`, `y = (1, 5)`: the four terms
  are `0`, `-1`, `1`, `-1`.

### 1.3 Underlying matroid

For `[Finite E]` define `Chirotope.matroid χ` with `Matroid.ofIsBaseOfFinite`, whose bases are the
ranges of the tuples with `χ b ≠ 0`, and prove that its rank is `r`; define loops, parallel pairs,
`Chirotope.IsSimple` (every element and every pair of distinct elements lies in a basis) and
`Chirotope.IsUniform` (`χ b ≠ 0` for every injective `b`).
*Needs:* 1.1; Mathlib `Matroid.ofIsBaseOfFinite`, `Matroid.IsBase`.

**Checks.**

- The alternating chirotope on `{1, …, 5}` has the uniform matroid of rank 3 on five elements; it
  is uniform and simple.
- `IsSimple` is unsatisfiable in rank 1 with two or more elements (a tuple of length 1 has a
  one-point range), and in rank 0 it forces `E` empty: it is "no loops and no parallel pairs" in
  every rank.
- For the vectors `(1, 0, 0)`, `(2, 0, 0)`, `(0, 1, 0)`, `(0, 0, 1)`, the first two lie in no
  common basis, so the chirotope is not simple although it has no loop; adding `(0, 0, 0)` adds a
  loop, which lies in no basis.

### 1.4 Realizable chirotopes

Prove `Chirotope.isChirotope_ofVectorsFun`: `Chirotope.ofVectorsFun v` is a chirotope whenever the
vectors span `Fin r → 𝕜` over an ordered field, and its matroid is the matroid of linear
independence of `v`. The three-term relation comes from the three-term Plücker identity for
`3 × 3` minors; prove that identity for `Matrix.det` over a commutative ring. Define
`Chirotope.IsRealizable` (Convention 3); negating the first coordinate of every vector negates
`ofVectorsFun`, so `-χ` is realizable when `χ` is.
*Needs:* 1.1, 1.3; Mathlib `Matrix.det`, `Submodule.span`.

**Checks.**

- The span hypothesis is needed: `v = 0` gives the zero function, which is not a chirotope.
- For `(1, 0), (0, 1), (1, 1), (1, 2)` the minors are `p12 = 1`, `p34 = 1`, `p13 = 1`,
  `p24 = -1`, `p14 = 2`, `p23 = -1`, so `p12 p34 - p13 p24 + p14 p23 = 0`, and the three signed
  terms `1, 1, -1` contain both signs.
- Negating the first coordinate negates one column of every matrix, so every determinant changes
  sign: `ofVectorsFun` of the negated family is `-ofVectorsFun v`.

### 1.5 Operations

Define `Chirotope.reorientFun` (multiply by `-1` once for each entry of `b` in `A`) and
`Chirotope.relabelFun` along `E ≃ E'`, and prove `Chirotope.isChirotope_reorientFun` and
`Chirotope.isChirotope_relabelFun`. Define deletion of a non-coloop (restriction to `{e}ᶜ`, same
rank); contraction of a non-loop `e`, of rank `r - 1`, `b' ↦ χ (Fin.snoc b' e)`; and the dual of
a chirotope on `Fin m`, of rank `m - r`, `χ* c = χ b * sign (Fin.append b c)`, where `b` is the
increasing enumeration of the complement of the range of `c` and `Fin.append b c` is read as a
permutation of `Fin m`. Prove that each is a chirotope; that the matroid of the dual is
`Matroid.dual` of `χ.matroid`; that `χ**` is `χ` or `-χ`; that the dual of a realizable
chirotope is realizable (Gale duality); and that deletion and contraction commute with
reorientation and are exchanged by duality (BLSWZ §3.4, §3.6).
*Needs:* 1.1, 1.3, 1.4; Mathlib `Matroid.dual`.

**Checks.**

- Reorienting the alternating chirotope on `{1, 2, 3}` on `{1}` gives `-1` at `(1, 2, 3)`; on all
  of `{1, 2, 3}` it gives `(-1)³ χ = -χ`.
- Contracting the alternating chirotope on `{1, 2, 3, 4}` at `4` gives `1` on `(1, 2)`, `(1, 3)`,
  `(2, 3)`: the alternating chirotope of rank 2. Contracting at a loop gives the zero function, so
  the non-loop hypothesis is needed; deleting an element of a rank-3 chirotope on three elements
  leaves no basis, so the non-coloop hypothesis is needed.
- For the rank-1 chirotope on `Fin 3` with value `1` everywhere, the dual takes the values `1`,
  `-1`, `1` on `(0, 1)`, `(0, 2)`, `(1, 2)` (the sign of `Fin.append` is that of `(2, 0, 1)`,
  `(1, 0, 2)`, `(0, 1, 2)`); its matroid has every pair as a basis, the dual of the matroid of
  rank 1 on three elements.

### 1.6 Equivalences

Define reorientation equivalence (`χ'` is a reorientation of `χ` or of `-χ`) and isomorphism
(relabelling followed by reorientation equivalence), and prove that both are equivalence
relations. For odd `r`, `-χ` is the reorientation of `χ` on `Set.univ`.
*Needs:* 1.5.

**Checks.**

- Reorientation on `A` followed by reorientation on `B` is reorientation on `A ∆ B`, which gives
  transitivity.
- In rank 2 the clause "or of `-χ`" is needed: for the alternating chirotope on `{1, 2, 3}`, a
  reorientation multiplies `χ (i, j)` by `εᵢ εⱼ`, and `ε₁ε₂ = ε₁ε₃ = ε₂ε₃ = -1` is impossible
  (the product of the three is a square), so `-χ` is not a reorientation of `χ`.
- In rank 3 the two chirotopes on `{1, 2, 3}` (`±` the alternating one) are reorientations of
  each other: one isomorphism class.

### 1.7 Simplification

Prove that every chirotope on a finite `E` is obtained from a simple chirotope on the parallel
classes of its non-loops by adding loops and parallel or antiparallel copies, and that this
simple chirotope is unique up to reorientation (BLSWZ §3.4 and §7.1).
*Needs:* 1.3, 1.5, 1.6.

**Checks.**

- For `(1, 0, 0)`, `(2, 0, 0)`, `(0, 1, 0)`, `(0, 0, 1)`, `(0, 0, 0)` the parallel classes of
  non-loops are `{1, 2}`, `{3}`, `{4}`, the fifth element is a loop, and the simple chirotope is
  the rank-3 chirotope on three elements.
- Replacing `(2, 0, 0)` by `(-1, 0, 0)` gives an antiparallel copy; the choice of representative
  in each class changes the simple chirotope by a reorientation, which is why uniqueness is up to
  reorientation.
- In rank 1 every non-loop is parallel or antiparallel to every other, and the simple chirotope has
  one element, consistent with 1.3.

### Examples

- `ofVectorsFun` of `(1, i, i²)`, `i = 1, …, 5`: the alternating chirotope of rank 3 on five
  elements, uniform and simple.
- The rank-2 chirotope of `(1, 0), (1, 1), (0, 1)`, with value `1` on every increasing pair.

### Dependencies

Layer 0 and Mathlib. 1.2–1.4 use 1.1; 1.5 uses 1.3 and 1.4; 1.6 uses 1.5; 1.7 uses 1.3, 1.5, 1.6.

## Layer 2: covectors, cocircuits and the face lattice

### 2.1 Oriented matroids in covector form

Define `OrientedMatroid E` (Convention 4), with `SignVector.IsTope` (maximal covectors),
cocircuits (minimal nonzero covectors), the rank (the length of a maximal chain from `0` to a
tope), deletion, contraction and reorientation, each proved to satisfy (L0)–(L3) (BLSWZ
Definition 4.1.1).
*Needs:* 0.1, 0.2.

**Checks.**

- `{0}` is an oriented matroid of rank 0; for a rank-1 chirotope the cocircuit vector
  `X = e ↦ χ ![e]` and `{0, X, -X}` is an oriented matroid, while `{0, X}` fails (L1).
- All nine sign vectors on `{e₁, e₂}` form an oriented matroid (four topes, each of rank 2); the
  five vectors `0, (+, +), (-, -), (+, -), (-, +)` fail (L3) at `X = (+, +)`, `Y = (+, -)`,
  `e = e₂`, which would need `(+, 0)`.
- In the nine-vector oriented matroid the topes are the four vectors without zeros, and
  `(+, 0)` is a cocircuit.

### 2.2 From chirotopes

Define `Chirotope.cocircuitVec` and `Chirotope.covectorsOf` (Convention 4) and prove
`Chirotope.exists_orientedMatroid_covectorsOf`: for a finite `E` the covectors of a chirotope form
an `OrientedMatroid` (BLSWZ §3.5 and §3.7). Prove also: its minimal nonzero elements are the nonzero
cocircuit vectors; their supports are the cocircuits of `χ.matroid`;
`covectorsOf (-χ) = covectorsOf χ`; reorientation and minors commute with `covectorsOf`; its rank
is `r`. Prove `Chirotope.exists_chirotope_covectorsOf`: for a finite `E` every `OrientedMatroid`
is `covectorsOf χ` for some chirotope `χ` (for `{0}`, a chirotope of rank `0`, which has no
cocircuit vector; otherwise BLSWZ Theorem 3.5.5 with Proposition 3.7.2); and that for rank
`r ≥ 1` the chirotope has rank `r` and is unique up to sign.
*Needs:* 1.1, 1.3, 2.1.

**Checks.**

- For the rank-2 chirotope of `(1, 0), (1, 1), (0, 1)`, the cocircuit vectors are
  `±(0, +, +)`, `±(-, 0, +)`, `±(-, -, 0)`, the topes are six, and there are 13 covectors.
- Negatives are needed in the definition: in rank 1 the cocircuit vectors are only `X` (a tuple
  of length 1 has one position), and compositions of `X` alone give `{0, X}`, which fails (L1).
- For the rank-3 chirotope on three elements every sign vector is a covector (27 of them).
- Finiteness is needed. Take the realizable rank-3 chirotope of the lines `e : y = 0`,
  `a₁ : y = 1 + x`, `a₂ : y = 1 - x`, `b₁ : y = -1 + x`, `b₂ : y = -1 - x` and, for `n ≥ 2`,
  `fₙ : y = n² x - n`, `gₙ : y = n² x + n`, on an infinite `E`. The cocircuit vectors `X`, `Y` of
  the vertices `(0, 1)` and `(0, -1)` have `sep X Y = {e}` and agree, nonzero, on every `fₙ`, `gₙ`.
  A covector `Z` with `Z e = 0` begins with the cocircuit of a vertex `(±1, 0)` or `(±1/m, 0)` on
  `e`, and for `(1/m, 0)` the lines `fₙ` with `n > m` force the sign `-1` where every `gₙ` forces
  `+1` (symmetrically for the others). So (L3) fails at `X, Y, e`.

### 2.3 Walls and polygons

Define `SignVector.walls` (the coordinates whose negation gives another tope) and prove
`Chirotope.three_le_ncard_walls`: in a simple rank-3 chirotope on a finite type every tope has at
least three walls; there are no bigons. A tope is a `k`-gon when it has `k` walls.
*Needs:* 2.2.

**Checks.**

- For the rank-3 chirotope on three elements the eight topes have three walls each.
- For the alternating chirotope on `{1, …, 5}` there are 22 topes, each with at least three walls,
  and exactly ten have three walls: the five triples `123, 234, 345, 145, 125`, two antipodal topes
  each.
- Simplicity is needed: for `(1, 0, 0)`, `(2, 0, 0)`, `(0, 1, 0)`, `(0, 0, 1)` the first two
  coordinates agree on every covector, so negating one of them never gives a tope, and every tope
  has at most two walls.

### 2.4 The face lattice

Prove that `WithTop` of the covector set under `ConfLE` is a lattice, graded of rank `r + 1` for a
finite `E` and rank `r` (BLSWZ §4.1), and that a tope's lower interval contains no pair `X, -X`
with `X ≠ 0`.
*Needs:* 2.1, 2.2.

**Checks.**

- For the nine vectors on two elements the chain `0 < (+, 0) < (+, +) < ⊤` is maximal: rank 3.
- For `{0, X, -X}` in rank 1 the lattice is `0 < X, -X < ⊤`, of rank 2.
- The lower interval of the tope `(+, +)` is `{0, (+, 0), (0, +), (+, +)}`, with no pair `X, -X`.

### 2.5 The projective face poset

Define the projective face poset: the nonzero covectors modulo `X ~ -X`, with
`[X] ≤ [Y] ↔ X ≤ᶜ Y ∨ -X ≤ᶜ Y`; prove that this is a well-defined partial order. The closed cell
of `[Y]` is its lower set. The poset is *latticial* when the intersection of two closed cells is
empty or a closed cell. Its vertices are the classes of cocircuits, its edges the classes of
covectors of rank 2, its cells the classes of topes.
*Needs:* 2.2, 2.4.

**Checks.**

- `-X ≤ᶜ -Y ↔ X ≤ᶜ Y`, so the relation does not depend on representatives.
- For the rank-3 chirotope on three elements: 3 vertices, 6 edges and 4 cells, and
  `3 - 6 + 4 = 1`.
- That poset is not latticial: each of the four triangles contains all three vertices, so two
  triangles meet in a common edge together with the opposite vertex, which is not a closed cell.

### 2.6 Euler relation

Prove that for a finite `E` and rank `r ≥ 1` the sum of `(-1)^(rank X - 1)` over nonzero
covectors is `1 + (-1)^(r - 1)`; in rank 3 this is `f₀ - f₁ + f₂ = 2` on the sphere and `1` for
the projective face poset (BLSWZ §4.6). For a uniform simple chirotope of rank 3 on `n` elements
there are `n (n - 1)` cocircuits, `2 n (n - 1)` covectors of rank 2 and `n (n - 1) + 2` topes.
*Needs:* 2.4, 2.5.

**Checks.**

- For the alternating chirotope on five elements: 20 cocircuits, 40 covectors of rank 2, 22 topes,
  and `20 - 40 + 22 = 2`.
- Rank 2 on two elements: four cocircuits and four topes, `4 - 4 = 0 = 1 + (-1)`.
- Rank 1: the two covectors `X, -X` of rank 1 give `2 = 1 + 1`.

### 2.7 Rank 2 and cyclic orders

Signed elements are `E × ℤˣ`, with antipode `(e, u) ↦ (e, -u)` and `χ` extended by multiplying by
the units. Prove `Chirotope.exists_unique_circularOrder`: for a simple chirotope of rank 2 on a
finite `E` there is a unique `CircularOrder` on `E × ℤˣ` such that, for `a.1 ≠ b.1`,
`χ (a, b) = 1 ↔ sbtw a b (-a)`. Prove that the antipode preserves it, and, for `|E| ≥ 2`, that
every circular order on `E × ℤˣ` preserved by the antipode, with exactly `|E| - 1` elements
strictly between `a` and `-a` for each `a`, comes from a unique simple rank-2 chirotope. The *local
sequence* of a non-loop `e` of a rank-3 chirotope is the circular order of the simplification of its
contraction at `e`: the cyclic order in which the pseudoline `e` meets the others.
*Needs:* 1.5, 1.7; Mathlib `CircularOrder`, `sbtw`.

**Checks.**

- For `E = {1, 2}` with `χ (1, 2) = 1` the order is `(1, +), (2, +), (1, -), (2, -)`, and
  `sbtw (1, +) (2, +) (1, -)`.
- For `(1, 0), (1, 1), (0, 1)` the order is by angle, `v₁, v₂, v₃, -v₁, -v₂, -v₃`, with
  `|E| - 1 = 2` elements strictly between `v₁` and `-v₁`.
- Simplicity is needed: for `(1, 0), (2, 0), (0, 1)` the open arc from `(1, +)` to `(1, -)` must
  be `{(3, +)}`, and so must the arc from `(2, +)` to `(2, -)`; the second arc then passes through
  `(1, +)` or misses `(3, +)`, so no circular order exists.
- `|E| ≥ 2` is needed in the converse: for `E = Fin 1` the two signed elements carry one circular
  order, preserved by the antipode with `0` elements between `a` and `-a`, but there is no
  `Chirotope 2 (Fin 1)`, since no pair of elements is injective.

### Examples

- The thirteen covectors of `(1, 0), (1, 1), (0, 1)`; the 27 covectors of three independent
  vectors in rank 3; the 22 topes of the alternating chirotope on five elements.

### Dependencies

Layers 0–1 and Mathlib. 2.2 uses 2.1; 2.3 uses 2.2; 2.4 uses 2.1–2.2; 2.5 uses 2.4; 2.6 uses
2.4–2.5; 2.7 uses Layer 1.

## Layer 3: monotone arrangements, the topological model in rank 3

### 3.1 Monotone arrangements

Define `MonotoneArrangement n` (Convention 5), whose data include `MonotoneArrangement.crossX`
(symmetric, `f i (crossX i j) = f j (crossX i j)` for `i ≠ j`, and `0` at `i = j`, so that the
data are determined by `f`),
`MonotoneArrangement.IsSimple` (no three pseudolines through a common point), relabelling by
`Fin.revPerm` combined with `x ↦ -x`, and `MonotoneArrangement.ofLines a b ha`
(`f i x = a i * x + b i`) for strictly antitone slopes `a`.
*Needs:* Mathlib `Continuous`.

**Checks.**

- The lines `y = x`, `y = 1`, `y = 3 - x` (slopes `1, 0, -1`): `crossX 0 1 = 1`,
  `crossX 0 2 = 3/2`, `crossX 1 2 = 2`; the arrangement is simple.
- `y = x`, `y = 0`, `y = -x` all cross at `0`: `crossX 0 1 = crossX 1 2 = 0`, not simple.
- Increasing slopes are excluded: for `a = (-1, 1)`, `b = 0`, `f 0 x - f 1 x = -2x` is positive
  for `x < 0`, so `0` starts above `1`, contrary to the field `cross`.

### 3.2 Points and cells

Define `MonotoneArrangement.signAt` (Convention 6). The *cell* of a sign vector `X` is
`{p | signAt A p = X}`.
*Needs:* 3.1.

**Checks.**

- For the three lines of 3.1 the point `(3/2, 6/5)` of the bounded triangle has
  `signAt = (+, -, +)` on `some 0, some 1, some 2` and `1` at `none`; the opposite side convention
  gives `(-, +, -)`, which is not a covector (3.5).
- For the single line `y = 0`, `signAt (0, 1) (some 0) = -1`: points above the line are negative.
- For `n = 0`, `signAt` is constant and the plane is one cell; the three lines of 3.1 have 19
  nonempty cells (7 regions, 9 edges, 3 vertices).

### 3.3 The chirotope of an arrangement

Define `ltSign`, `tupleSign`, `MonotoneArrangement.tripleSign` and `MonotoneArrangement.chiFun`
(Convention 7). Prove `MonotoneArrangement.exists_chirotope_chiFun`: for `n ≥ 2` it is a simple
chirotope of rank 3 on `Option (Fin n)`; prove `MonotoneArrangement.isUniform_chiFun_iff`: it is
uniform iff the arrangement is simple; and that the relabelling of 3.1 relabels it.
*Needs:* 1.1, 1.3, 3.1; Mathlib `WithTop`.

**Checks.**

- For the lines of 3.1: `chiFun (some 0, some 1, some 2) = sign (2 - 1) = 1` and
  `chiFun (some 1, some 0, some 2) = -1`.
- For `n = 1` there is no injective triple and `chiFun` is zero: not a chirotope, hence `n ≥ 2`.
  For `n = 2`, `chiFun (some 0, some 1, none) = 1` is the only basis up to order.
- For the concurrent lines of 3.1, `chiFun (some 0, some 1, some 2) = 0`: not uniform, as the
  arrangement is not simple.

### 3.4 Straight lines

Prove `MonotoneArrangement.chiFun_ofLines`: `(ofLines a b ha).chiFun = ofVectorsFun v` with
`v none = ![0, 0, 1]` and `v (some i) = ![-1, a i, b i]`.
*Needs:* 1.4, 3.3.

**Checks.**

- For the lines of 3.1, `det [(-1, 1, 0), (-1, 0, 1), (-1, -1, 3)] = 1`, which is
  `chiFun (some 0, some 1, some 2)`, and `det [(-1, 1, 0), (-1, 0, 1), (0, 0, 1)] = 1`.
- With `(1, a, b)` instead, each `some` row changes sign: the values on triples of three `some`
  are negated while those with `none` are kept, so the normalisation `-1` is needed.
- With `(0, 0, -1)` for the line at infinity, `χ (some i, some j, none)` would be `-1`, against
  Convention 7. The equality holds on 300 random arrangements of 2 to 6 lines with integer data,
  checked on all triples.

### 3.5 Cell decomposition

For `n ≥ 2` and `L = covectorsOf A.chiFun`:
(i) `MonotoneArrangement.range_signAt`: the range of `signAt A` is `{X ∈ L | X none = 1}`;
(ii) `MonotoneArrangement.isPathConnected_cell`: every nonempty cell is path-connected, so the
cells of topes are the connected components of the complement of the union of the graphs;
(iii) the closure of the cell of `X` is the union of the cells of the `Y ∈ L` with `Y ≤ᶜ X` and
`Y none = 1`;
(iv) the cell of a tope is open; the cell of a rank-2 covector lies in one graph and is
homeomorphic to an open interval; the cell of a cocircuit with `X none = 1` is one point;
(v) the cocircuits with `X none = 0` are the points at infinity: their restrictions are the
cocircuits of the contraction at `none`, in the circular order of 2.7, and the cell of no point of
`ℝ²` is one of them.
*Needs:* 2.2, 2.7, 3.2, 3.3; Mathlib `IsPathConnected`.

**Checks.**

- For the three lines of 3.1 there are 19 covectors with value `1` at `none`, the sign vectors of
  the 19 cells of 3.2; `(+, -, +, +)` is one of them and `(-, +, -, +)` is not.
- For `n = 2` the covectors with `X none = 1` are all nine vectors of `{+, -, 0}²`: four regions,
  four rays and the crossing point. For `n = 0, 1`, `chiFun` is zero, its covector set is `{0}`
  and the right side of (i) is empty while `signAt` has a value, so `n ≥ 2` is needed.
- For the three lines of 3.1 there are twelve cocircuits: six with `X none = 0` (the three
  directions at infinity, with both signs) and three with `X none = 1` (the vertices); the
  closure of the bounded triangle is the union of seven cells.

### 3.6 Topological representation in rank 3, marked form

Prove `exists_monotoneArrangement`: for a simple rank-3 chirotope `χ` on `Option (Fin n)` in which
`none` is in general position (`χ ![some a, some b, none] ≠ 0` for `a ≠ b`) there are
`σ : Equiv.Perm (Fin n)`, a monotone arrangement `A` and `R` with
`reorientFun A.chiFun R = relabelFun (Equiv.optionCongr σ) χ` (BLSWZ Theorem 5.2.1 and
Chapter 6; Goodman–Pollack 1984). The unmarked form is 5.5. Route: contract at `none` and read
the slope order of the wires from the circular order of 2.7; build the sweep (the sequence of
orders of the wires met by a vertical line moving to the right) by induction on the elements,
inserting each wire through its local sequence, and draw it piecewise linearly; then compare the
chirotopes through 3.3. No target of Layers 4 or 5 is used.
*Needs:* 1.5, 1.7, 2.7, 3.3.

**Checks.**

- For `n = 2` the two chirotopes on three elements are `±chiFun` of two crossing lines; the
  negative one is the reorientation at `R = {none}`.
- General position of `none` is needed: every `chiFun` is nonzero on `(some a, some b, none)`,
  and relabelling fixing `none` and reorientation keep this.
- Simplicity is needed: `chiFun` is simple (3.3) and relabelling and reorientation preserve
  simplicity.

### 3.7 The projective arrangement as a map

For a simple rank-3 chirotope `χ` on a finite `E`, the maximal chains of the projective face poset
(vertex < edge < cell), with the involutions changing one member, form a `GMap2` of
SurfaceTopology, with a labelling of its flags by the element vanishing on their edge. Prove that
it is connected, `IsClosedSurfaceGMap`, not `GMap2.IsOrientable`, with `GMap2.eulerChar` equal to
`1`; that its vertices, edges and faces correspond to the classes of cocircuits, of rank-2
covectors and of topes (2.5), and its vertices to the rank-2 flats of `χ.matroid`; that the
labelling is constant on `adj 0`- and `adj 2`-orbits; and that relabelling and reorientation of `χ`
induce isomorphisms (`GMap2.Iso`) commuting with the labels, functorially, from the groupoid of
chirotopes up to reorientation to the groupoid of labelled maps.
*Needs:* 2.5, 2.6; SurfaceTopology Layer 1 `GMap2`, `GMap.Cell`, `GMap2.Iso`, `GMap2.eulerChar`,
`IsClosedSurfaceGMap`, `GMap2.IsOrientable`.

**Checks.**

- Three elements in general position: 3 vertices, 6 edges, 4 faces, 24 flags, Euler
  characteristic 1 (the hemi-octahedron).
- Four elements in general position: 6 vertices, 12 edges, 7 faces (four triangles and three
  quadrilaterals, `4·3 + 3·4 = 24 = 2·12`), 48 flags, Euler characteristic 1.
- `adj 0` changes the vertex and `adj 2` the face, both keeping the edge and so the label, while
  `adj 1` changes the edge: the labelling is not constant on `adj 1`-orbits.

### 3.8 Sylvester–Gallai and arrangements with no bigonal element

For a simple rank-3 chirotope on a finite set, a *vertex* is a rank-2 flat of `χ.matroid`, and an
element is *bigonal* when it lies on at most two vertices (not a bigon tope, which 2.3 excludes).
(a) Prove `Chirotope.exists_isFlat_ncard_eq_two` (Sylvester–Gallai for pseudolines): some vertex
has exactly two elements (Kelly–Rottenberg 1972, Theorem 3.6, which gives at least `3n/7` such
vertices for `n` pseudolines; Bokowski–Pokora 2018, Theorem 1.3 and Corollary 1.4). Route:
Melchior's inequality `∑ (3 - ν(v)) ≥ 3` over vertices, `ν(v)` the number of elements through `v`,
follows from the projective Euler relation `f₀ - f₁ + f₂ = 1` (2.6), the absence of bigons
`2 f₁ ≥ 3 f₂` (2.3) and `f₁ = ∑ ν(v)`, since an element through `k` vertices carries `k` edges.
(b) Prove: if no element is bigonal, there are four elements in general position (no three on a
vertex), and the chirotope either has exactly four elements or contains one of: five elements in
general position; three elements through one vertex and two through another, with no element of
the five through both vertices; a complete quadrangle (six elements, four vertices of three).
Route, on the incidence of elements and vertices alone (two elements share exactly one vertex,
every vertex lies on at least two elements): take a vertex `a ∩ b` with exactly two elements from
(a), two further vertices of `a` giving elements `c` and `d`, and sort a fifth element by how many
of the six vertices of `{a, b, c, d}` it passes through (none, one, or an opposite pair).
*Needs:* 1.3, 2.3, 2.6; Mathlib `Matroid.IsFlat`, `Matroid.eRk`.

**Checks.**

- (a) For three elements in general position the three pairs are the rank-2 flats. A loop lies in
  every flat: with a loop added to three independent elements every rank-2 flat has three
  elements, so looplessness is needed. In rank 2 on three elements the only rank-2 flat is the
  whole set.
- (b) The complete quadrangle has no bigonal element (each of its lines passes through two triple
  points and one diagonal point) and contains no five in general position (five of its six lines
  contain the three lines through some triple point).
- (b) Three elements in general position have every element bigonal; in a near-pencil (all
  elements but one through one vertex) every pencil element is bigonal; four in general position
  have no bigonal element and are the case of exactly four elements.

### Examples

- The three lines `y = x`, `y = 1`, `y = 3 - x`, their 19 cells and their chirotope `ofVectorsFun`
  of `(-1, 1, 0), (-1, 0, 1), (-1, -1, 3), (0, 0, 1)`.
- The five lines tangent to a parabola, dual to the points `(1, i, i²)`: a simple arrangement whose
  ten triangular topes are the five cyclically consecutive triples.

### Dependencies

Layers 1–2, SurfaceTopology Layer 1 and Mathlib. 3.2 and 3.3 use 3.1; 3.4 uses 3.3; 3.5
uses 3.2–3.3; 3.6 uses 1.7, 2.7 and 3.3; 3.7 uses Layer 2; 3.8 uses Layers 1–2.

## Layer 4: wiring diagrams, allowable sequences, signotopes, flips

### 4.1 Allowable sequences

Define allowable sequences (Goodman–Pollack 1980): lists of permutations of `Fin n` from `1` to
`Fin.revPerm`, each step reversing a family of pairwise disjoint intervals of consecutive
positions, each pair of wires reversed exactly once; simple allowable sequences are those whose
steps are single adjacent swaps. Prove that every monotone arrangement determines its allowable
sequence (the order of the wires at abscissae avoiding crossings), and that two monotone
arrangements with the same allowable sequence have the same chirotope.
*Needs:* 3.1, 3.3.

**Checks.**

- On three wires there are two simple allowable sequences, with swaps at positions `0, 1, 0` and
  `1, 0, 1`.
- The sequence `(1, Fin.revPerm)` on three wires, one step reversing all three, is allowable and
  not simple: it is the sequence of three concurrent lines.
- The lines with intercepts `(0, 1, 3)` and `(0, 1, 4)` and slopes `(1, 0, -1)` have crossings at
  `1, 3/2, 2` and `1, 2, 3`, in the same order: the same sequence and the same chirotope.

### 4.2 Simple wiring diagrams

Define `Wiring.wordProd` and `Wiring.IsWiringDiagram` (Convention 8). Prove that for a word of
length `(n + 1) n / 2` the product of its letters is `Fin.revPerm` iff every pair of wires is
swapped exactly once along the sweep. Define the piecewise-linear monotone arrangement drawn from
a wiring diagram (letter `t` on `[t, t + 1]`) and prove that it is simple.
*Needs:* 3.1; Mathlib `Equiv.swap`, `Fin.revPerm`.

**Checks.**

- On three wires (`n = 2`) the words `[0, 1, 0]` and `[1, 0, 1]` are wiring diagrams, and
  `[0, 0, 1]` is not: its product is `Equiv.swap 1 2`.
- The length condition is needed: `[0, 1, 0, 1, 1]` has product `Fin.revPerm` and five letters,
  and swaps wires `0` and `1` three times.
- On one wire (`n = 0`) the empty word is the wiring diagram, `Fin.revPerm = 1` on `Fin 1`.

### 4.3 Moves

Define `Wiring.CommutationStep` (`… i j … ↦ … j i …` when `|i - j| ≥ 2`) and `Wiring.BraidStep`
(`… i (i + 1) i … ↦ … (i + 1) i (i + 1) …`), and prove that both preserve wiring diagrams.
Prove `Wiring.reflTransGen_of_isWiringDiagram`: any two simple wiring diagrams on `n + 1` wires
are connected by commutations and braid moves.
Prove that commutations preserve the chirotope of the arrangement of 4.2. That a braid move is a
legal mutation is proved in 4.5. The number of commutation classes is `1, 1, 2, 8, 62` for
`1, …, 5` wires (OEIS A006245).
*Needs:* 4.2.

**Checks.**

- On four wires there are 16 wiring diagrams in 8 commutation classes, and on five wires 768 in 62
  classes, by enumeration.
- On three wires `[0, 1, 0]` and `[1, 0, 1]` are joined by one braid move and by no commutation.
- Commuting adjacent letters `i, i + 1` is not a move: `[0, 1, 0] ↦ [1, 0, 0]` leaves the wiring
  diagrams (the product becomes `Equiv.swap 1 2`).

### 4.4 Signotopes and local sequences

Define `Wiring.AtMostOneSignChange` and `Wiring.IsSignotope` (Convention 9). Prove
`Wiring.isSignotope_iff_exists_monotoneArrangement` (Felsner–Weil 2001): a function on triples is
a signotope iff it is `i < j < k ↦ A.chiFun (some i, some j, some k)` for a simple monotone
arrangement `A`; with 4.1 and 4.3, commutation classes of simple wiring diagrams on `m` wires,
simple monotone arrangements up to equality of chirotopes, and signotopes on `Fin m` are in
bijection. The local sequence of a wire `i` is the order in which it crosses the others; prove that
a family of local sequences comes from a simple wiring diagram iff for every `i < j < k` either
(`j` before `k` for `i`, `i` before `k` for `j`, `i` before `j` for `k`) or all three are
reversed, and that the family determines the commutation class (Felsner 1997).
*Needs:* 3.3, 4.1, 4.3.

**Checks.**

- There are 8 signotopes on `Fin 4` and 62 on `Fin 5`, and the signotopes read off the wiring
  diagrams of 4.3 (`sign` of the difference of the swap times of `jk` and `ij`) are exactly these.
- On `Fin 4`, the values `(+, -, +, +)` on `123, 124, 134, 234` change sign twice: not a
  signotope.
- For `[0, 1, 0]` the local sequences are `1, 2` for wire `0`, `0, 2` for wire `1`, `0, 1` for
  wire `2` (the first alternative); for `[1, 0, 1]` they are reversed.

### 4.5 Triangle flips

Define `Chirotope.flipFun` (negate the values on the tuples enumerating `{a, b, c}`), which is
only a function; `Chirotope.Triangle`, a tope of `covectorsOf χ` with walls exactly `{a, b, c}`,
the certificate of a legal mutation; and `Chirotope.MutationStep`. Prove
`Chirotope.isChirotope_flipFun`: for a uniform `χ` the flip at a triangle is a chirotope (Ringel
1956), and it is uniform; `Chirotope.exists_triangle_of_flipFun`: if the flip at three distinct
elements is a chirotope, they are the walls of a triangle (Roudneff–Sturmfels 1988);
`Chirotope.reflTransGen_mutationStep` (Ringel's theorem): any two uniform rank-3 chirotopes on the
same finite `E` are connected by mutation steps and reorientations. Prove that a braid move of
4.3 is a legal mutation: the three wires it reverses are the walls of a triangle of the
arrangement of 4.2 before the move, and the chirotope after the move is the flip at that
triangle, so the edges of the flip graph of wiring diagrams are edges of this flip graph. Prove
Levi's triangle theorem: in a simple rank-3 chirotope on a finite `E` with `3 ≤ |E|` every element
is a wall of at least three triangular cells of the projective face poset, so there are at least
`|E|` of them (Levi 1926; Felsner–Goodman 2017, Theorem 5.4.5).
*Needs:* 1.5, 2.2, 2.3, 4.2, 4.3.

**Checks.**

- On the alternating chirotope on `{1, …, 5}` the triangles are `123, 234, 345, 145, 125`; the
  flips there satisfy every three-term relation, and the flips at the five other triples violate
  7200 instances each.
- The certificate is necessary: flipping `{1, 3, 5}` makes `χ123 χ145`, `-χ124 χ135`,
  `χ125 χ134` all positive.
- Levi's bound is sharp there: each element is a wall of exactly three of the five triangles. On
  three elements the only triangle is the whole set and the flip is `-χ`.
- Levi's theorem is not only for uniform chirotopes: for the near-pencil on four elements (three
  lines through a point and a fourth line) all six cells are triangles, each line of the pencil
  is a wall of four of them and the fourth line a wall of all six.

### 4.6 Small arrangements

Prove that the isomorphism classes (1.6) of uniform rank-3 chirotopes on `Fin n` number
`1, 1, 1, 4` for `n = 3, 4, 5, 6` (Felsner–Goodman 2017, Table 5.6.1; OEIS A006248).
*Needs:* 1.6, 4.5.

**Checks.**

- On `Fin 3` there are 2 uniform chirotopes (`±` the alternating one), one class.
- On `Fin 4` there are 16, one class: reorienting a set `A` changes the sign at a triple `T` iff
  `|A ∩ T|` is odd, and the 16 reorientations of the alternating chirotope are distinct.
- On `Fin 5` every uniform chirotope is isomorphic to the alternating one of 4.5.

### Examples

- The two wiring diagrams on three wires, and the eight commutation classes on four.
- The alternating chirotope on five elements, its five triangles and its five legal flips.

### Dependencies

Layers 1–3 and Mathlib. 4.2 uses 3.1; 4.3 uses 4.2; 4.4 uses 4.1 and 4.3; 4.5 uses Layer 2,
4.2 and 4.3; 4.6 uses 4.5.

## Layer 5: extensions and relative positions

### 5.1 Single-element extensions

Define `Chirotope.IsExtension χ χ'`: `χ'` of rank `r` on `Option E` with `χ' (some ∘ b) = χ b`.
Its *localization* sends a cocircuit vector `Y` of `χ` to the value at `none` of the unique
cocircuit vector of `χ'` restricting to `Y` (BLSWZ Proposition 7.1.4). Prove: the localization is
odd and determines `χ'`; a function on cocircuits is a localization iff its restriction to every
rank-2 contraction is one (Las Vergnas; BLSWZ Theorem 7.1.8); in rank 2 the localizations are, in
the circular order of 2.7, either `0` everywhere, or `0` at one antipodal pair of cocircuits and
`1` on one open arc between them and `-1` on the other, or nowhere `0` with `1` on an open
half-circle and `-1` on the antipodal one.
*Needs:* 1.5, 2.2, 2.7.

**Checks.**

- The loop extension (`χ'` zero on every tuple containing `none`) is an extension with
  localization `0`.
- Oddness: the cocircuit vector restricting to `-Y` is the negative of the one restricting to `Y`.
- For the rank-2 chirotope of `(1, 0), (0, 1)` and `v none = (1, 1)`, the cocircuit vectors
  `(0, +)` and `(-, 0)` of `χ` extend to `(0, +, +)` and `(-, 0, -)`: the localization is `1` and
  `-1` there, and nowhere zero, a generic position.

### 5.2 Parallel extensions

Prove that for a non-loop `e`, `Y ↦ Y e` is a localization, whose extension adds an element
parallel to `e`.
*Needs:* 5.1.

**Checks.**

- Realizably, `v none = v e` gives the localization `Y ↦ Y e`, and `v none = -v e` gives
  `Y ↦ -Y e`, an antiparallel element.
- The extension is not simple: `none` and `e` lie in no common basis.
- For a loop `e`, `Y e = 0` for every `Y` and the extension is the loop extension: the
  hypothesis "non-loop" is needed for `none` to be parallel to `e`.

### 5.3 Levi's enlargement lemma

Prove `Chirotope.levi_enlargement`: for a rank-3 chirotope on a finite `E` and nonzero covectors
`Y, Z`, there is an extension in which `none` is not a loop and the extensions of `Y` and `Z` by
`0` at `none` are covectors; if no `e` has `Y e = Z e = 0`, the extension can be chosen with `none`
parallel to no element (Levi 1926). With 3.6, a new pseudoline can be drawn through
any two points of a monotone arrangement.
*Needs:* 2.2, 5.1.

**Checks.**

- Realizably, `Y` and `Z` cocircuits are two points, and the line through them gives the
  extension.
- The second hypothesis is needed: if `Y` and `Z` are two vertices on the pseudoline `e`, the only
  pseudoline through both is parallel to `e`, since two pseudolines meet once.
- `Z = -Y` is the same projective point, and any pseudoline through it will do.

### 5.4 The poset of relative positions

Define the positions of a rank-3 chirotope: the localizations whose extension has `none` not a
loop, ordered by `ConfLE` (specialization). Prove: its maximal elements are the localizations
without zeros (generic positions); every position lies below a generic one; the parallel
extensions of 5.2 are positions; the lexicographic extension along an ordered basis (BLSWZ §7.2)
is generic, so generic positions exist, by a combinatorial argument independent of Layer 3; for a
generic position, the local sequence of `none` (2.7) is its crossing order with the oriented
pseudolines of `E`.
*Needs:* 2.7, 5.1, 5.2.

**Checks.**

- For the rank-3 chirotope of `e₁, e₂, e₃` the cocircuits are `±` the three coordinate points;
  `v none = w` with no zero coordinate gives, at the point `eₖ`, `± sign wₖ` with a sign fixed by
  the convention, and all eight patterns occur: eight generic positions.
- The six parallel and antiparallel extensions of 5.2 have zeros and are not maximal.
- The parallel extension `v none = e₁` vanishes at the points `e₂` and `e₃` and lies below the
  four generic positions `v none = e₁ + ε (a e₂ + b e₃)`, `a, b = ±1`, `ε > 0` small.

### 5.5 Topological representation, unmarked form

Prove that for every simple rank-3 chirotope `χ` on a finite `E` and every generic extension `χ'`
of `χ`, `χ'` relabelled along some `Option E ≃ Option (Fin n)` fixing `none` satisfies the
hypotheses of 3.6. Hence every rank-3 chirotope (with 1.7) is the deletion of the line at infinity
from the chirotope of a monotone arrangement, up to isomorphism.
*Needs:* 1.7, 3.6, 5.4.

**Checks.**

- The rank-3 chirotope on three independent elements with `w = (1, 1, 1)` at infinity gives three
  lines in general position, as in 3.1 after relabelling.
- Genericity is needed: if `none` is parallel to `e`, `χ' (some e, some f, none) = 0`, against the
  hypothesis of 3.6.
- Deleting `none` from `χ'` recovers `χ` by `Chirotope.IsExtension`.

### Examples

- The eight generic positions of a new pseudoline in an arrangement of three.
- The parallel extension of an element of the alternating chirotope on five elements.

### Dependencies

Layers 1–3 and Mathlib. 5.2 uses 5.1; 5.3 uses 5.1; 5.4 uses 5.1–5.2; 5.5 uses 3.6 and 5.4.

## Layer 6: stretchability

### 6.1 Stretchability

A rank-3 chirotope is *stretchable* when it is realizable over `ℝ`; relabelling, reorientation and
negation preserve realizability (1.4, 1.5), so this is the same as being isomorphic to a realizable
chirotope. Prove `isRealizable_iff_exists_ofLines`: a simple rank-3 chirotope on
`Option (Fin n)` in which `none` is in general position (3.6) is realizable over `ℝ` iff, after a
relabelling fixing `none` and a reorientation, it is `(ofLines a b ha).chiFun` for some strictly
antitone `a`.
*Needs:* 1.4, 1.5, 3.4.

**Checks.**

- The three lines of 3.1 are stretchable, by 3.4.
- The non-Pappus chirotope of 6.3 is not, and so is `chiFun` of no family of straight lines.
- General position is needed: the parallel lines `y = 0`, `y = 1` have vectors `(-1, 0, 0)`,
  `(-1, 0, 1)`, and `det [(-1, 0, 0), (-1, 0, 1), (0, 0, 1)] = 0`; they are not an `ofLines`
  arrangement, whose slopes are strictly antitone.

### 6.2 Pappus's theorem

Prove: over any field `K`, for `A B : Fin 3 → Fin 3 → K` with `(Matrix.of A).det = 0` and
`(Matrix.of B).det = 0`, the vectors `C k = (A i ×₃ B j) ×₃ (A j ×₃ B i)` for
`{i, j, k} = {0, 1, 2}`, `i < j`, satisfy `(Matrix.of C).det = 0`.
*Needs:* Mathlib `Matrix.det`, `crossProduct`.

**Checks.**

- For the first six rows of 6.3 (`A` the points `0, 1, 2`, `B` the points `3, 4, 5`), the vectors
  `C 0, C 1, C 2` are exactly `(13, 2, 5)`, `(15, 3, 8)`, `(2, 1, 3)`, the points `6, 7, 8`, and
  their determinant is `0`.
- Degenerate data are covered: for `A 0 = A 1 = (0, 0, 1)`, `A 2 = (3, 0, 1)` and `B` the points
  `3, 4, 5`, the rows of `C` are `(15, 3, 6)`, `(15, 3, 8)`, `(0, 0, 2)`, with determinant `0`.
- The hypothesis on `A` is needed: for `A` the rows `(0, 0, 1)`, `(1, 0, 1)`, `(0, 2, 1)`
  (determinant `2`) and `B` the points `3, 4, 5`, the determinant of `C` is `-60`.

### 6.3 The non-Pappus arrangement

Let `pappusPoints : Fin 9 → Fin 3 → ℚ` be the rows `(0,0,1)`, `(1,0,1)`, `(3,0,1)`, `(0,1,1)`,
`(2,1,1)`, `(5,1,1)`, `(13,2,5)`, `(15,3,8)`, `(2,1,3)`; its three-point lines are exactly
`{0,1,2}, {3,4,5}, {6,7,8}, {0,4,8}, {0,5,7}, {1,3,8}, {1,5,6}, {2,3,7}, {2,4,6}`. `nonPappusFun` is
`ofVectorsFun pappusPoints` changed to take the value `1` on `(6, 7, 8)` and the alternating values
on its permutations. Prove `isChirotope_nonPappusFun` (it is a simple rank-3 chirotope),
`not_isRealizable_nonPappusFun` (it is realizable over no ordered field, by 6.2) and
`exists_monotoneArrangement_nonPappus` (by 5.5, some monotone arrangement of nine pseudolines has,
with the line at infinity deleted, a chirotope isomorphic to `nonPappusFun`: a non-stretchable
arrangement; Ringel 1956).
*Needs:* 1.4, 3.6, 5.5, 6.2.

**Checks.**

- The nine collinear triples of `pappusPoints` are the nine listed, by computing all 84
  determinants.
- `nonPappusFun` satisfies every three-term relation and the basis exchange, by enumeration; so
  does the variant with `-1` at `(6, 7, 8)`. Its nine points are pairwise non-proportional, so it is
  simple.
- In a realization of `nonPappusFun` the eight other lines are collinear triples, so 6.2 forces
  `det (6, 7, 8) = 0`, against the value `1`.

### 6.4 Small cases

Prove that every uniform rank-3 chirotope on `Fin n`, `n ≤ 6`, is realizable over `ℚ`, from 4.6
and explicit coordinates for each class.
*Needs:* 1.4, 4.6.

**Checks.**

- `n = 3`: the vectors `e₁, e₂, e₃` realize the class.
- `n = 4, 5`: the vectors `(1, i, i²)` realize the unique class of 4.6.
- Realizability is invariant under isomorphism (6.1), so one realization per class suffices.

### Examples

- The non-Pappus arrangement of nine pseudolines.

### Dependencies

Layers 1, 3, 4 and 5 and Mathlib. 6.1 uses 3.4; 6.3 uses 5.5 and 6.2; 6.4 uses 4.6.

## Layer 7: the cartographic group acting on flags

The carrier is SurfaceTopology's `GMap n D` on an arbitrary dart type
(gap:gmap-arbitrary-darts); nothing in this layer assumes finiteness except where stated.

### 7.1 String Coxeter matrices

Define `stringCoxeterMatrix n p hp` (hypothesis `∀ i, p i ≠ 1`) and `cartographicGroup n`
(Convention 11), proving the three conditions of `CoxeterMatrix`.
*Needs:* Mathlib `CoxeterMatrix`, `CoxeterMatrix.Group`.

**Checks.**

- `stringCoxeterMatrix 2 ![3, 5]` is Mathlib's `CoxeterMatrix.H₃`, `!![1, 3, 2; 3, 1, 5; 2, 5, 1]`.
- For `n = 1` the cartographic group has the matrix `!![1, 0; 0, 1]`: the infinite dihedral group.
- `hp` is needed: `p i = 1` would put `1` off the diagonal, against `off_diagonal`.

### 7.2 Two presentations of the axioms

Prove that the involutions of a `GMap n D` satisfy the relations of `stringCoxeterMatrix n 0`
(`CoxeterMatrix.IsLiftable`), and that a family satisfying them is a `GMap n D`. Hence the
monodromy homomorphism `cartographicGroup n →* Equiv.Perm D` through `CoxeterSystem.lift`, and
conversely the flag system of a homomorphism `cartographicGroup n →* Equiv.Perm D`; these are
inverse. The monodromy homomorphism factors through `(stringCoxeterMatrix n p hp).Group` iff
`(adj i * adj (i + 1)) ^ p i = 1` for every `i`; the *type* of a finite flag system is the tuple of
orders of the `adj i * adj (i + 1)`.
*Needs:* 7.1; SurfaceTopology Layer 1 `GMap` (gap:gmap-arbitrary-darts); Mathlib
`CoxeterSystem.lift`.

**Checks.**

- For involutions, the relation `(adj i * adj j) ^ 2 = 1` of an entry `2` is commutation, so the
  relations are exactly `involutive` and `commute_of_far`.
- An entry `0` imposes no relation: the cartographic group has no relation between `adj i` and
  `adj (i + 1)`.
- The flag system of the tetrahedron has type `(3, 3)`, and its monodromy homomorphism factors
  through `(CoxeterMatrix.A 3).Group`.

### 7.3 Monodromy

Define the monodromy group (the subgroup generated by the `adj i`, the range of the monodromy
homomorphism), morphisms (equivariant maps) and automorphisms (`Subgroup.centralizer` of the
`adj i`). Prove: a morphism from a nonempty flag system to a connected one is surjective; the
automorphism group of a connected flag system acts freely on flags; a finite connected flag
system with `Nonempty D` has at most `Nat.card D` automorphisms.
*Needs:* 7.2; Mathlib `Subgroup.closure`, `Subgroup.centralizer`, `MulAction.IsPretransitive`.

**Checks.**

- The empty flag system is connected and has one automorphism while `Nat.card D = 0`: the bound
  needs `Nonempty D`; a map from it is not surjective onto a nonempty one.
- For `n = 0` and `D = Bool` with `adj 0` the swap, the monodromy group and the automorphism group
  both have two elements, `= Nat.card D`.
- For `n = 0` and `D = Fin 3` with `adj 0 = Equiv.swap 0 1`, the system is not connected and the
  automorphisms (permutations commuting with the swap) are two, `< 3`.

### 7.4 Residues

Define `J`-residues for every `J ⊆ Fin (n + 1)`, of which SurfaceTopology's cells are the case
`J = {j | j ≠ i}`; incidence of residues (sharing a flag); and the flag graph (`SimpleGraph D`,
adjacency by some `adj i` with `adj i φ ≠ φ`). Prove that a flag system is connected iff its flag
graph is.
*Needs:* 7.2; Mathlib `MulAction.orbitRel`, `SimpleGraph`.

**Checks.**

- `J = ∅` gives single flags, and `J = Set.univ` the connected components.
- For the tetrahedron (24 flags), the residues of `{1, 2}` have six flags each: four vertices.
- `adj i φ = φ` gives no edge of the flag graph, so a flag fixed by every `adj i` is an isolated
  vertex.

### 7.5 Coset flag systems and classification

Define the coset flag system of `H ≤ cartographicGroup n` on `cartographicGroup n ⧸ H`. Prove:
pointed connected flag systems up to pointed isomorphism correspond to subgroups (the stabilizer of
the base flag); nonempty connected ones up to isomorphism to conjugacy classes of subgroups; finite
ones to subgroups of finite index.
*Needs:* 7.2, 7.3; Mathlib `MulAction.orbitRel`.

**Checks.**

- `H = ⊤` gives one flag, fixed by every `adj i`.
- `H = ⊥` gives the cartographic group acting on itself, freely, the universal flag system.
- The empty flag system is connected and corresponds to no subgroup: the classification needs
  `Nonempty D`.

### Examples

- The flag system of the tetrahedron, of type `(3, 3)`, as the coset flag system of the kernel of
  `cartographicGroup 2 → (CoxeterMatrix.A 3).Group`.

### Dependencies

Mathlib and SurfaceTopology Layer 1 (gap:gmap-arbitrary-darts). 7.2 uses 7.1; 7.3 and 7.4 use 7.2;
7.5 uses 7.2 and 7.3.

## Layer 8: maps, consumed from SurfaceTopology and compared here

A *map* is a connected `GMap2 D` with `IsClosedSurfaceGMap` (SurfaceTopology Layer 1: no dart
fixed by `adj 0`, `adj 1` or `adj 2`, and `adj 2 d ≠ adj 0 d`). Its cells, `GMap2.eulerChar`,
`GMap2.IsOrientable`, the orientation double cover with doubled Euler characteristic
(SurfaceTopology Layer 4) and the classification of closed surfaces (SurfaceTopology Layer 8) are
consumed. The conversion between orientable maps and bipartite ribbon graphs whose white vertices
have degree two is SurfaceTopology Layer 2's, and Tau Ceti's bounds
`TauCeti.BipartiteRibbonGraph.IsConnected.eulerChar_le_two` and
`TauCeti.BipartiteRibbonGraph.even_eulerChar` reach maps through it.

### 8.1 Orientability in the cartographic group

The even part of the monodromy group is the image of the kernel of `CoxeterSystem.lengthParity`.
Prove: a map with `Nonempty D` is `GMap2.IsOrientable` iff the even part is not transitive on
flags, and it then has exactly two orbits.
*Needs:* 7.2; SurfaceTopology Layer 1 `GMap2.IsOrientable`; Mathlib `CoxeterSystem.lengthParity`.

**Checks.**

- The empty map is orientable (any `S` works) and its even part is transitive (vacuously):
  without `Nonempty D` the iff fails.
- The tetrahedron (24 flags) is orientable, and the even part has two orbits of 12 flags.
- The projective plane `aa` of SurfaceTopology Layer 1 (four darts) is not orientable, and the
  even part is transitive.

### 8.2 The projective plane of an arrangement

Prove that the map of 3.7 is a map in this sense, not orientable, with Euler characteristic `1`,
and that its orientation double cover is the map of the covectors on the sphere (vertices the
cocircuits, faces the topes), with Euler characteristic `2`.
*Needs:* 2.6, 3.7; SurfaceTopology Layer 4 `GMap2.orientationDoubleCover`.

**Checks.**

- Three elements: the hemi-octahedron `(3, 6, 4)`, covered by the octahedron `(6, 12, 8)`.
- Four elements in general position: `(6, 12, 7)`, covered by `(12, 24, 14)`, both with the
  expected Euler characteristics `1` and `2`.
- The alternating chirotope on five elements: `(10, 20, 11)` on the projective plane, covered by
  `(20, 40, 22)`, the counts of 2.6.

### 8.3 Skeleton

Define the skeleton of a `GMap2`: the vertex-edge incidence multigraph as a Mathlib
`Graph (G.Cell 0) (G.Cell 1)`, with loops and parallel edges kept; when it is `Graph.Simple`, the
`SimpleGraph` on vertices is `Graph.toSimpleGraph` of it. Its connectivity and isomorphisms are
GraphConnectivityAndFlows Target 1.1's.
*Needs:* SurfaceTopology Layer 1 `GMap.Cell`; GraphConnectivityAndFlows Target 1.1; Mathlib `Graph`,
`Graph.IsLink`.

**Checks.**

- Three elements in general position: 3 vertices and 6 edges in three parallel pairs, not
  `Graph.Simple`.
- Four elements in general position: the octahedral graph, simple, 4-regular.
- The projective plane `aa`: one vertex and one edge, a loop, which the multigraph keeps.

### 8.4 Skeletons: faithfulness and the uniform case

(i) *Faithfulness.* Let `χ, χ'` be simple rank-3 chirotopes on finite sets, and `f, g` two maps of
flags from the map of `χ` to the map of `χ'` (3.7), both commuting with `adj 1`, such that `f φ` and
`g φ` have the same vertex and the same edge for every flag `φ`. Prove `f = g`. Route: the flags
with a given vertex `v` and edge `e` are `ψ` and `adj 2 ψ`; if `g φ = adj 2 (f φ)`, then
`g (adj 1 φ)` and `f (adj 1 φ)` lie on the two edges adjacent to `e` around `v`, which are distinct
because every vertex of `χ'` lies on at least two elements and so has at least four edges.
(ii) *Uniform reconstruction.* Let `χ, χ'` be uniform simple rank-3 chirotopes on finite sets with
at least four elements. Prove that every label-compatible isomorphism of their skeletons (8.3,
with GraphConnectivityAndFlows Target 1.1 isomorphisms) is induced by a unique isomorphism of maps
commuting with the labels, and that its bijection of labels `σ : E ≃ E'` makes `relabelFun σ χ`
reorientation equivalent to `χ'`. Route: deleting one element of a simple projective arrangement
leaves a simple Euclidean one; for it, the graph obtained by adding one vertex joined to every
vertex of degree less than four is 3-connected and planar (Bose–Everett–Wismath 2003, as used in
the proof of Eppstein 2014, Lemma 1), so by Whitney's theorem (Whitney 1932; Bondy–Murty 2008,
Theorem 10.28) its embedding in the sphere is unique, and the pseudolines are the paths that leave
each vertex through the edge opposite to the one they entered by (Eppstein 2014, Lemma 1 and its
proof). The last step is that the projective face poset determines a simple oriented matroid up to
reorientation (it determines the tope graph; Björner–Edelman–Ziegler 1990).
*Needs:* 1.6, 3.7, 8.3; SurfaceTopology Layer 1 `GMap2.Iso`; GraphConnectivityAndFlows Target 1.1.

**Checks.**

- (i) `adj 2` itself sends every flag to a flag with the same vertex and edge and is not the
  identity: commuting with `adj 1` is needed.
- (i) At least three edges at every vertex are needed: on the map of an `n`-gon on the sphere,
  where every vertex has two edges, the automorphism exchanging the two faces acts as `adj 2` on
  every flag, commutes with `adj 1`, and agrees with the identity on vertices and edges.
- (ii) For three elements the skeleton has 3 vertices and 6 edges in three parallel pairs, with 48
  label-compatible automorphisms (`S₃ × (ℤ/2)³`) against 24 automorphisms of the map: "at least
  four" is needed. For four elements the skeleton is the octahedral graph (6 vertices, 12 edges),
  each label carried by a triangle, and both groups have order 24.

### Examples

- The tetrahedron, the hemi-octahedron and the map of four lines in general position.

### Dependencies

Layers 1, 2, 3 and 7, SurfaceTopology Layers 1, 2, 4 and 8, GraphConnectivityAndFlows Target
1.1. 8.1 uses 7.2; 8.2 uses 3.7; 8.4 uses 1.6, 3.7 and 8.3.

## Layer 9: regular flag systems, string C-groups and regular polytopes

### 9.1 Regular flag systems

A connected flag system is *regular* when its monodromy group acts freely. Prove: for finite
connected ones with `Nonempty D`, regular ↔ the automorphism group acts transitively ↔ it has
`Nat.card D` elements; nonempty regular connected flag systems up to isomorphism correspond to
normal subgroups `N` of `cartographicGroup n`, and the automorphism group of the coset flag system
of `N` is `≃* (cartographicGroup n ⧸ N)ᵐᵒᵖ`.
*Needs:* 7.3, 7.5 (gap:gmap-arbitrary-darts).

**Checks.**

- The empty flag system is regular (the monodromy group is trivial), has one automorphism and
  `Nat.card D = 0`: the iff needs `Nonempty D`.
- The tetrahedron is regular: 24 flags and 24 automorphisms.
- The map of four lines in general position (48 flags, 24 automorphisms) is not regular.

### 9.2 Regular flag system of a group

Define the regular flag system of `ρ : Fin (n + 1) → G` satisfying the relations of
`stringCoxeterMatrix n 0` (Convention 12). Prove that it is connected iff the `ρ i` generate `G`,
and then regular with automorphism group `Gᵐᵒᵖ`; and that every nonempty regular connected flag
system is isomorphic to the regular flag system of its monodromy group.
*Needs:* 7.2, 9.1.

**Checks.**

- `(CoxeterMatrix.A 3).Group` with its simple reflections gives the tetrahedron.
- Right multiplications compose in the opposite order, `r_g ∘ r_h = r_{h g}`: the identification is
  with `Gᵐᵒᵖ`, not `G`.
- For a group `G` of order 4 and `ρ` constant at an element of order 2, the `ρ i` generate a
  subgroup of index 2 and the flag system has two components.

### 9.3 String C-groups and polytopes

A string group generated by involutions has the *intersection property* when the subgroups
generated by `ρ '' I` and `ρ '' J` meet in the subgroup generated by `ρ '' (I ∩ J)` for all
`I J : Set (Fin (n + 1))`; a string C-group is one with it. An abstract polytope of rank `n + 1`
is a bounded graded poset of rank `n + 2`, all of whose maximal chains have `n + 3` elements,
strongly flag-connected, with the diamond property (McMullen–Schulte 2002, §2A). Prove: the flags
of an abstract polytope form a `GMap` with no fixed points; a polytope is regular when this flag
system is; regular polytopes of rank `n + 1` up to isomorphism correspond to string C-groups with
`n + 1` generators up to generator-preserving isomorphism (McMullen–Schulte 2002, Theorem 2E11).
*Needs:* 7.2, 9.2; Mathlib `Subgroup.closure`.

**Checks.**

- A polygon has rank 2: faces of ranks `-1, 0, 1, 2`, maximal chains of `4 = n + 3` elements
  for `n = 1`.
- In a group of order 2, the constant family at its generator fails the intersection property
  for `I = {0}`, `J = {1}`: the two subgroups are the whole group, while `ρ '' ∅` generates `⊥`.
- Coxeter groups with their simple reflections, such as `(CoxeterMatrix.A 3).Group`, have the
  intersection property (standard parabolic subgroups, Humphreys 1990, §5.5).

### 9.4 Platonic maps

Prove that `Nat.card` of `(CoxeterMatrix.A 3).Group`, `(CoxeterMatrix.B 3).Group` and
`CoxeterMatrix.H₃.Group` are `24`, `48`, `120`, each a string C-group; that their regular flag
systems are maps of types `{3,3}`, `{3,4}`, `{3,5}`, and reversing the generators
(`CoxeterMatrix.reindex Fin.revPerm`) gives `{4,3}` and `{5,3}`; with vertices, edges and faces
`(4,6,4)`, `(6,12,8)`, `(8,12,6)`, `(12,30,20)`, `(20,30,12)`, all orientable with Euler
characteristic 2; and that the icosahedral skeleton is a 5-regular simple graph on 12 vertices.
*Needs:* 8.3, 9.2, 9.3.

**Checks.**

- Mathlib's `CoxeterMatrix.B 3` has the entry `4` between the indices `1` and `2`, so its type is
  `{3,4}` (the octahedron) and the reversal gives the cube.
- Vertices are flags over the vertex stabilizer `⟨ρ 1, ρ 2⟩`, of order `2 q` for type `{p,q}`:
  `24/6 = 4`, `48/8 = 6`, `120/10 = 12`; edges are flags over 4, faces over `2 p`.
- The geometric representation of `H₃` (Layer 10) has 120 elements and sends `(s₀ s₁ s₂)⁵` to
  `-1`, by computation of the reflection matrices.

### 9.5 The hemi-icosahedron

Define `hemiW₀ = (s 0 * s 1 * s 2) ^ 5` in `CoxeterMatrix.H₃.Group` and prove
`center_eq_zpowers_hemiW₀` (it generates the centre, of order 2) and
`nonempty_mulEquiv_alternatingGroup` (the quotient by the centre is `alternatingGroup (Fin 5)`).
The regular flag system of the quotient is the hemi-icosahedron: 60 flags, 6 vertices, 15 edges,
10 faces, non-orientable, Euler characteristic 1, type `{3,5}`, skeleton the complete graph on six
vertices; the quotient is a string C-group, so the hemi-icosahedron is a regular polytope; the
icosahedral map is its orientation double cover (SurfaceTopology Layer 4).
*Needs:* 8.1, 9.2–9.4; Mathlib `Subgroup.center`, `Subgroup.zpowers`, `alternatingGroup`.

**Checks.**

- In the geometric representation `(s₀ s₁ s₂)⁵ = -1`, central, and the centralizer of the three
  reflections has two elements.
- `6 - 15 + 10 = 1`; 60 flags over the vertex stabilizer of order 10 give 6 vertices, and
  `6 · 5 / 2 = 15` edges, each pair of vertices joined once: the complete graph.
- The orientation double cover has `(12, 30, 20)`, the icosahedron, with Euler characteristic 2.

### 9.6 Regular triangulations of the torus

Define `torusInvolution n`, `ρ 0 (x, y) = (1 - x + y, y)`, `ρ 1 (x, y) = (x, x - y)`,
`ρ 2 (x, y) = (x - y, -y)` on `ZMod n × ZMod n`, and `torusGroup n`, the subgroup they generate.
Prove `card_torusGroup`: for `n ≥ 3` it has `12 n²` elements. Prove that its regular flag system
is an orientable map of type `{3,6}` with `n²` vertices, `3 n²` edges, `2 n²` faces and Euler
characteristic 0; that its vertices correspond to the points of `ZMod n × ZMod n` and its skeleton
is the 6-regular simple graph joining `v` to `v ± (1,0)`, `v ± (0,1)`, `v ± (1,1)`; and that
reversing the generators gives the hexagonal map of type `{6,3}` (Coxeter–Moser 1980, §8.4).
*Needs:* 8.3, 9.2; Mathlib `ZMod`, `Function.Involutive.toPerm`, `Subgroup.closure`.

**Checks.**

- The group has 108, 192, 300, 432, 588 elements for `n = 3, …, 7`, by enumeration; `ρ₀ρ₁`,
  `ρ₁ρ₂`, `ρ₀ρ₂` have orders 3, 6, 2.
- At `n = 2` the group has 24 elements, not 48, and `ρ₁ρ₂` has order 3: `n ≥ 3` is needed.
- Vertices are flags over `⟨ρ 1, ρ 2⟩` of order 12, so `12 n² / 12 = n²`; then `3 n²` edges and
  `2 n²` faces, and `n² - 3 n² + 2 n² = 0`.

### Examples

- The five Platonic maps, the hemi-icosahedron and the toroidal maps `{3,6}` on `(ZMod n)²`.

### Dependencies

Layers 7–8, SurfaceTopology Layers 1 and 4 (gap:gmap-arbitrary-darts) and Mathlib. 9.2 uses 9.1;
9.3 uses 9.2; 9.4 uses 9.2–9.3; 9.5 uses 9.2–9.4; 9.6 uses 9.2.

## Layer 10: applications of the geometric representation

The geometric representation is consumed: Tau Ceti's `TauCeti/GroupTheory/Coxeter/Geometric.lean`
builds, for every `cs : CoxeterSystem M W`, `CoxeterMatrix.geometricForm` (Gram entries
`-cos (π / M i j)`, so `-1` at an entry `0`), `CoxeterMatrix.geometricReflection` on `B →₀ ℝ`,
`CoxeterSystem.geometricRepresentation`, the lift, and the exact orders
`CoxeterSystem.orderOf_simple_mul_simple`. Its faithfulness is gap:coxeter-geometric-faithfulness.

### 10.1 Function coordinates

For a finite `B`, define `geometricRepresentationFun cs`, the representation on `B → ℝ` obtained by
conjugating with `Finsupp.linearEquivFunOnFinite` (`LinearEquiv.conjAlgEquiv`). Prove that on
`cs.simple i` it is the conjugate of `M.geometricReflection i`, and that it is injective, from
gap:coxeter-geometric-faithfulness.
*Needs:* Tau Ceti `CoxeterSystem.geometricRepresentation`,
`CoxeterSystem.geometricRepresentation_simple`; RootSystems (gap:coxeter-geometric-faithfulness).

**Checks.**

- For `H₃` the three reflection matrices generate a group of 120 elements, the order of
  `CoxeterMatrix.H₃.Group`.
- For an entry `0` the Gram entry is `-cos 0 = -1`, the degenerate form of two parallel walls.
- The diagonal Gram entries are `-cos π = 1`: the simple roots are unit vectors.

### 10.2 String and cartographic applications

Prove that adjacent generators of the cartographic group have a product of infinite order and
distant ones of order two (`CoxeterSystem.orderOf_simple_mul_simple` at the string matrix), and
`geometricRepresentationFun_cartographic_injective`: the cartographic group and every string
Coxeter group act faithfully on `ℝ ^ (n + 1)` by reflections, through 10.1. The geometric
representation of `H₃` is the reflection representation of the icosahedral maps of 9.4 and 9.5.
*Needs:* 7.1, 10.1.

**Checks.**

- At the entry `0`, `orderOf (s i * s (i + 1)) = 0`, Mathlib's convention for infinite order.
- At the entry `2`, distant generators commute: `orderOf (s 0 * s 2) = 2` for `n = 2`.
- For `n = 0` the cartographic group has order 2, and its generator acts on `ℝ` by `-1`.

### Examples

- The icosahedral group as the reflection group of `H₃`; the cartographic group of `n = 1` as the
  infinite dihedral group acting on `ℝ²` by the degenerate form.

### Dependencies

Layer 7, Tau Ceti and RootSystems (gap:coxeter-geometric-faithfulness). 10.2 uses 10.1.

## Downstream consumers

No roadmap on main cites this one. Two research programmes use this infrastructure:
triangle-flip reconfiguration of pseudoline and pseudocircle arrangements
(Radtke–Felsner–Roch–Scheucher 2023, Layers 4–5) and the counting and extension of signotopes
(Bergold–Egeling–Hoang 2025, Layer 4).

## Research context

Mnëv's universality theorem says that the realization spaces of rank-3 oriented matroids, and of
incidence schemes of marked points and lines in `ℙ²`, are as complicated as arbitrary
semialgebraic sets; in scheme-theoretic form every singularity type occurs on some incidence
scheme (Vakil 2006, Theorem 3.1). Whether the reconstruction of 8.4 (ii) extends to non-uniform
simple rank-3 chirotopes with no bigonal element is open. Grothendieck's notes on pseudoline
arrangements include the classification of 3.8 (b) (Montpellier fonds, folder 80, pp. 20–28,
https://grothendieck.umontpellier.fr/80.pdf).

## References

- [BLSWZ] A. Björner, M. Las Vergnas, B. Sturmfels, N. White, G. M. Ziegler, *Oriented
  Matroids*, 2nd ed., Encyclopedia of Mathematics and its Applications 46, Cambridge University
  Press, 1999: Definition 3.5.3, Lemma 3.5.4, Theorem 3.5.5 (chirotopes); §3.4 and §3.6 (duality,
  Grassmann–Plücker); §3.7 (vectors and covectors); Definition 4.1.1 and §4.1 (covector axioms,
  face lattice); §4.6 (face counts); Theorem 5.2.1 (topological representation); Chapter 6
  (arrangements of pseudolines, pp. 247–280); Proposition 7.1.4, Theorem 7.1.8 (single-element
  extensions); §7.2 (lexicographic extensions).
- J. Folkman, J. Lawrence, *Oriented matroids*, J. Combin. Theory Ser. B 25 (1978), 199–236.
- J. Lawrence, *Oriented matroids and multiply ordered sets*, Linear Algebra Appl. 48 (1982),
  1–12.
- F. Levi, *Die Teilung der projektiven Ebene durch Gerade oder Pseudogerade*, Ber. Math.-Phys.
  Kl. Sächs. Akad. Wiss. Leipzig 78 (1926), 256–267 (enlargement lemma; triangles).
- G. Ringel, *Teilungen der Ebene durch Geraden oder topologische Geraden*, Math. Z. 64 (1956),
  79–102 (flips, non-Pappus arrangement).
- J. E. Goodman, R. Pollack, *On the combinatorial classification of nondegenerate configurations
  in the plane*, J. Combin. Theory Ser. A 29 (1980), 220–235 (allowable sequences);
  *Semispaces of configurations, cell complexes of arrangements*, J. Combin. Theory Ser. A 37
  (1984), 257–293.
- S. Felsner, H. Weil, *Sweeps, arrangements and signotopes*, Discrete Appl. Math. 109 (2001),
  67–94 (signotopes, local sequences).
- S. Felsner, *On the number of arrangements of pseudolines*, Discrete Comput. Geom. 18 (1997),
  257–267 (local sequences).
- S. Felsner, J. E. Goodman, *Pseudoline arrangements*, Chapter 5 of *Handbook of Discrete and
  Computational Geometry*, 3rd ed., CRC Press, 2017, Table 5.6.1.
- D. E. Knuth, *Axioms and Hulls*, Lecture Notes in Computer Science 606, Springer, 1992.
- OEIS A006245 (commutation classes of reduced words of the longest permutation), A006248 (simple
  projective arrangements).
- L. M. Kelly, R. Rottenberg, *Simple points in pseudoline arrangements*, Pacific J. Math. 40
  (1972), 617–622 (Theorem 3.6: at least `3n/7` simple points).
- J. Bokowski, P. Pokora, *On the Sylvester–Gallai and the orchard problem for pseudoline
  arrangements*, Period. Math. Hungar. 77 (2018), 164–174, arXiv:1607.05864 (Theorem 1.3,
  Melchior's equality, and Corollary 1.4, `t₂ ≥ 3`, numbered as in the arXiv version).
- J.-P. Roudneff, B. Sturmfels, *Simplicial cells in arrangements and mutations of oriented
  matroids*, Geom. Dedicata 27 (1988) (mutations and simplicial topes).
- A. Björner, P. H. Edelman, G. M. Ziegler, *Hyperplane arrangements with a lattice of regions*,
  Discrete Comput. Geom. 5 (1990), 263–288 (the tope graph determines a simple oriented matroid
  up to reorientation).
- H. Whitney, *Congruent graphs and the connectivity of graphs*, Amer. J. Math. 54 (1932),
  150–168 (a 3-connected planar graph has a unique embedding in the sphere).
- J. A. Bondy, U. S. R. Murty, *Graph Theory*, Graduate Texts in Mathematics 244, Springer, 2008,
  Theorem 10.28 (Whitney's theorem in its current form).
- P. Bose, H. Everett, S. Wismath, *Properties of arrangement graphs*, Internat. J. Comput. Geom.
  Appl. 13 (2003), 447–462 (the arrangement graph with one added vertex is 3-connected and
  planar).
- D. Eppstein, *Drawing arrangement graphs in small grids, or how to play Planarity*, J. Graph
  Algorithms Appl. 18 (2014), 211–231, arXiv:1308.0066, Lemma 1 (unique embedding of an
  arrangement graph; the pseudolines as paths through opposite edges).
- Y. A. Radtke, S. Felsner, S. Roch, M. Scheucher, *Flip graph connectivity for arrangements of
  pseudolines and pseudocircles*, arXiv:2310.19711 (2023).
- H. Bergold, L. Egeling, H. P. Hoang, *Signotopes with few plus signs*, SoCG 2025, LIPIcs 332
  (2025), 16:1–16:14.
- R. Vakil, *Murphy's law in algebraic geometry: badly-behaved deformation spaces*, Invent. Math.
  164 (2006), 569–590, doi:10.1007/s00222-005-0481-9, arXiv:math/0411469 (Theorem 3.1, Mnëv's
  universality theorem for incidence schemes).
- A. Grothendieck, *Esquisse d'un programme* (1984), §§2–3, in *Geometric Galois Actions 1*, LMS
  Lecture Note Series 242, Cambridge University Press, 1997, 5–48 (n-cartes, cartographic groups).
- A. Vince, *Combinatorial maps*, J. Combin. Theory Ser. B 34 (1983), 1–21.
- G. A. Jones, D. Singerman, *Theory of maps on orientable surfaces*, Proc. London Math. Soc. (3)
  37 (1978), 273–307.
- H. S. M. Coxeter, W. O. J. Moser, *Generators and Relations for Discrete Groups*, 4th ed.,
  Springer, 1980, Chapter 8 (regular maps, §8.4 toroidal maps).
- P. McMullen, E. Schulte, *Abstract Regular Polytopes*, Cambridge University Press, 2002, §2A,
  §2E, Theorem 2E11.
- J. E. Humphreys, *Reflection Groups and Coxeter Groups*, Cambridge University Press, 1990,
  §5.4, Corollary to Theorem 5.4 (faithfulness of the geometric representation, consumed in
  Layer 10).

# Roadmap: Pseudoline arrangements, oriented matroids, and combinatorial maps

An arrangement of pseudolines is a finite family of curves in the real projective plane, any two
of which meet exactly once and cross there. Its combinatorics is the combinatorics of rank-3
oriented matroids: the chirotope records, for every three pseudolines, the orientation of the
triangle they cut out, and the Folkman–Lawrence representation theorem says that every rank-3
oriented matroid arises this way. Arrangements are drawn as wiring diagrams, swept by allowable
sequences, transformed by triangle flips, enlarged one pseudoline at a time (Levi's lemma), and
compared with arrangements of straight lines (stretchability, the non-Pappus arrangement).

The second half of the roadmap is the flag-system theory of combinatorial maps: Grothendieck's
*n-cartes*, that is sets of flags with involutions `r₀, …, rₙ` such that `rᵢ` and `rⱼ` commute when
`|i − j| ≥ 2`; their monodromy groups as quotients of the universal string Coxeter group; maps on
closed surfaces with their Euler characteristic and orientability; regular cartes, string
C-groups and regular polytopes; the Platonic maps, the hemi-icosahedron and the regular
triangulations of the torus; and the faithful realization of string Coxeter groups by
reflections. The two halves meet in the map that a projective arrangement draws on the
projective plane.

Mathlib has matroids (`Matroid`, bases, circuits, closure, duality, minors), cyclic orders
(`CircularOrder`), projectivizations, Coxeter matrices with their presented groups
(`CoxeterMatrix.Group`, `CoxeterSystem`, length, reflections), signs (`SignType`) and
determinants. It has nothing on orientations of matroids, chirotopes, sign vectors, arrangements
of curves, flag systems or abstract polytopes. Tau Ceti has permutation triples and finite
bipartite ribbon graphs with their Euler characteristic and genus; this roadmap connects
orientable maps to them.

Suggested homes, not extra layers:

```text
TauCeti/Combinatorics/SignVector/           -- Layer 0
TauCeti/Combinatorics/OrientedMatroid/      -- Layers 1, 2, 5
TauCeti/Combinatorics/Pseudoline/           -- Layers 3, 4, 6
TauCeti/Combinatorics/Carte/                -- Layers 7, 8, 9
TauCeti/GroupTheory/Coxeter/Geometric/      -- Layer 10
```

## Scope boundary

In scope: sign vectors; oriented matroids of arbitrary finite rank through chirotopes and
covectors, with their minors, duality, realizability and face lattices; rank-2 oriented matroids
as cyclic orders; rank-3 oriented matroids as pseudoline arrangements in the x-monotone model;
wiring diagrams, allowable sequences, signotopes, local sequences, triangle flips and Ringel's
theorem; single-element extensions, Levi's enlargement lemma and the poset of relative positions
of a new pseudoline; stretchability, Pappus's theorem and the non-Pappus arrangement; n-cartes,
maps, regular cartes, string C-groups, abstract regular polytopes; the geometric representation
of Coxeter groups and its faithfulness.

Out of scope, each with its owner or its exclusion:

- **Dessins, ribbon graphs and triangle groups.** `BipartiteRibbonGraph`, `PermutationTriple`,
  their isomorphism classes, Euler characteristic and genus, triangle groups and Belyi maps belong
  to [BelyiMaps](../BelyiMaps/README.md). This roadmap consumes the ribbon-graph API by name
  (Layer 8.3) and builds no second carrier for oriented hypermaps. BelyiMaps has no flag systems,
  no non-orientable maps, no arrangements and no polytopes; those are here.
- **Weyl groups.** Root systems, Weyl groups as Coxeter systems and the longest element of a Weyl
  group belong to [RootSystems](../RepresentationTheory/RootSystems/README.md). Layer 10 here is
  the geometric representation of an *arbitrary* Coxeter matrix, including entries `0` (meaning
  `∞`), which that roadmap does not build; it uses no root datum.
- **Topology of arbitrary curves.** Pseudolines are modelled as graphs of continuous functions
  (Layer 3). Arrangements of arbitrary Jordan curves in the projective plane or on the sphere, the
  Schoenflies theorem, and Goodman's theorem that every such arrangement is isomorphic to a wiring
  diagram are not in this roadmap. The Jordan-curve material of Tau Ceti (`TauCeti.IsJordanCurve`,
  owned by [ConformalMapping](../ConformalMapping/README.md)) is not used.
- **Topological representation in rank ≥ 4**, arrangements of pseudospheres, shellability of the
  face lattice, the extension space conjecture, and Mnëv's universality theorem and the complexity
  of stretchability (which concern semialgebraic sets) are not in this roadmap.
- **Matroid theory without orientation** is Mathlib's; this roadmap adds nothing to it beyond the
  matroid underlying a chirotope.
- **Hyperplane arrangements over ℝ or ℂ** (complements, Orlik–Solomon algebras, characteristic
  polynomials) are not in this roadmap.
- **Grothendieck topoi** have their own roadmap; nothing here uses them.

## Pinned conventions

- **Signs.** All signs are Mathlib's `SignType` (`-1 < 0 < 1`), and the sign of a real number or of
  an element of an ordered field is `SignType.sign`. A *sign vector* on `E` is a function
  `E → SignType`; there is no wrapper type.
- **Sign-vector operations.** Composition `X ∘ Y` takes `X e` where `X e ≠ 0` and `Y e` otherwise
  (`SignVector.compose X Y`). The separation set is `{e | X e ≠ 0 ∧ Y e = -X e}`. The conformal order
  `X ≤ᶜ Y` means `∀ e, X e = 0 ∨ X e = Y e`; it is a new relation (`SignVector.ConfLE`) and never the
  pointwise order of `E → SignType`. Reorientation of `X` on `A : Set E` negates the coordinates in
  `A`.
- **Chirotopes.** A chirotope of rank `r` on `E` is a function `(Fin r → E) → SignType`, alternating
  (`χ (b ∘ σ) = sign σ * χ b`, with `Equiv.Perm.sign` cast to `SignType`), zero on non-injective
  tuples, not identically zero, whose support is the set of ordered bases of a matroid, and which
  satisfies the three-term Grassmann–Plücker relations: for every `x : Fin r → E`, positions
  `i ≠ j`, and `a b c d : E`, writing `s u v` for `χ` of `x` with `u` placed at `i` and `v` at `j`,
  the three values `s a b * s c d`, `-(s a c * s b d)`, `s a d * s b c` are either all `0` or include
  both `1` and `-1`. This is the presentation of BLSWZ Lemma 3.5.4 and Definition 3.5.3; the full
  Grassmann–Plücker relations are a theorem (Layer 1.2). A chirotope and its negative define the
  same oriented matroid; the chirotope is the primary datum and `χ ~ -χ` is never built into the
  structure.
- **Realization.** For `v : E → Fin r → 𝕜` over an ordered field (`[Field 𝕜] [LinearOrder 𝕜]
  [IsStrictOrderedRing 𝕜]`), `Chirotope.ofVectors v` is `b ↦ SignType.sign (Matrix.det (Matrix.of
  fun i j ↦ v (b i) j))`: the rows of the matrix are the vectors. Realizable over `𝕜` means equal to
  some `ofVectors v`.
- **Covectors.** An oriented matroid in covector form (`OrientedMatroid E`) is a set of sign vectors
  satisfying (L0) `0 ∈ L`, (L1) `X ∈ L → -X ∈ L`, (L2) closure under composition, (L3) for
  `X, Y ∈ L` and `e` in their separation set there is `Z ∈ L` with `Z e = 0` and `Z f = (X ∘ Y) f`
  for every `f` outside the separation set (BLSWZ Definition 4.1.1).
- **Cocircuits from a chirotope.** For `x : Fin r → E` and a position `i`, the sign vector
  `e ↦ χ (Function.update x i e)` is `Chirotope.cocircuit χ x i`. Its sign is part of the
  convention: changing `i` or permuting `x` multiplies it by a sign, never by anything else.
- **Pseudolines.** The topological model is x-monotone: a *monotone arrangement* of `n`
  pseudolines is a family `f : Fin n → ℝ → ℝ` of continuous functions such that for `i < j` there
  is `x₀` with `f i x < f j x` for `x < x₀`, `f i x₀ = f j x₀`, and `f j x < f i x` for `x > x₀`.
  Indices therefore increase upward at the far left and downward at the far right. The line at
  infinity is the extra element `none` of `Option (Fin n)`.
- **Arrangement chirotope.** For a monotone arrangement, `crossX i j` is the abscissa where `i` and
  `j` cross. The rank-3 chirotope on `Option (Fin n)` is fixed on increasing triples by
  `χ (some i, some j, some k) = sign (crossX j k - crossX i j)` for `i < j < k`, and
  `χ (some i, some j, none) = 1` for `i < j`, and extended alternatingly. With this convention the
  straight line `y = a x + b` corresponds to the vector `(-1, a, b)` and the line at infinity to
  `(0, 0, 1)`: Layer 3.4 proves equality, not equality up to sign.
- **Wiring diagrams.** Positions are counted from the bottom. A permutation `π : Perm (Fin n)` of a
  sweep sends a position to the wire occupying it. A simple wiring diagram is a word `w : List
  (Fin (n - 1))`; the letter `i` swaps the wires at positions `i` and `i + 1`, acting by
  `π ↦ π * Equiv.swap i.castSucc i.succ` (positions are swapped, so the word is read left to right).
  A word is a wiring diagram when the product of its letters, starting from `1`, is `Fin.revPerm`
  and its length is `n * (n - 1) / 2`.
- **Signotopes.** A rank-3 signotope on `Fin n` assigns `±1` to each triple `i < j < k`; for each
  `i < j < k < l` the sequence of values on `ijk, ijl, ikl, jkl` (lexicographic order) changes sign
  at most once (Felsner–Weil).
- **Cartes.** An `n`-carte on a type `Φ` of flags is `r : Fin (n + 1) → Equiv.Perm Φ` with
  `r i * r i = 1` and `(r i * r j) ^ 2 = 1` whenever `i.val + 2 ≤ j.val`. Products of permutations are
  Mathlib's (`(σ * τ) x = σ (τ x)`). Nothing else (no fixed-point-freeness, no connectivity) is part
  of the definition; those are predicates.
- **String Coxeter matrices.** `stringCoxeterMatrix n p` on `Fin (n + 1)` has `M i i = 1`,
  `M i (i + 1) = p i`, and `2` elsewhere; following Mathlib, the entry `0` means `∞`. The
  *cartographic group* `cartographicGroup n` is `(stringCoxeterMatrix n 0).Group`. Mathlib's `H₃`
  matrix is the string matrix with `p = ![3, 5]`, the icosahedral type `{3, 5}`.
- **Faces of a carte.** For `J ⊆ Fin (n + 1)`, a `J`-residue is an orbit of the subgroup generated
  by `{r j | j ∈ J}`. The `i`-faces are the residues of `{j | j ≠ i}`. For `n = 2`: vertices are
  orbits of `⟨r 1, r 2⟩`, edges of `⟨r 0, r 2⟩`, faces of `⟨r 0, r 1⟩`.
- **Actions and automorphisms.** The cartographic group acts on the left; the coset carte of
  `H ≤ cartographicGroup n` is on `cartographicGroup n ⧸ H` with left multiplication. The regular
  carte of a group `G` with generating involutions `ρ` has flag set `G` and `r i g = ρ i * g`;
  its automorphisms are right multiplications, and its automorphism group is identified with
  `Gᵐᵒᵖ`, matching Tau Ceti's `PermutationTriple` convention (monodromy group versus
  automorphisms through `ᵐᵒᵖ`).
- **Rank of a polytope.** An `n`-carte corresponds to polytopes of rank `n + 1`. Maps (`n = 2`)
  correspond to polyhedra (rank 3).

## Existing foundations

**Mathlib.** `SignType`, `SignType.sign` (`Mathlib/Basic/Sign/Defs.lean`); `Equiv.Perm.sign`;
`Matrix.det`, `crossProduct` (`Mathlib/LinearAlgebra/CrossProduct.lean`); `Matroid`, `Matroid.IsBase`,
`Matroid.Indep`, `Matroid.IsCircuit`, `Matroid.IsCocircuit`, `Matroid.closure`, `Matroid.IsFlat`,
`Matroid.dual` (`M✶`), `Matroid.eRank`, `Matroid.ExchangeProperty`, `Matroid.ofIsBaseOfFinite`;
`CircularOrder`, `btw`, `sbtw`, `cIoo` (`Mathlib/Order/Circular.lean`); `Projectivization`;
`CoxeterMatrix`, `CoxeterMatrix.Group`, `CoxeterMatrix.simple`, `CoxeterMatrix.IsLiftable`,
`CoxeterMatrix.A`, `CoxeterMatrix.B`, `CoxeterMatrix.H₃`, `CoxeterMatrix.reindex`,
`CoxeterSystem`, `CoxeterSystem.lift`, `CoxeterSystem.length`, `CoxeterSystem.lengthParity`,
`CoxeterSystem.IsReflection`; `Fin.revPerm`, `Equiv.swap`; `Subgroup.closure`, `Subgroup.zpowers`,
`MulAction.IsPretransitive`, `MulAction.orbitRel`, `alternatingGroup`; `SimpleGraph`;
`Module.End`, `LinearMap.GeneralLinearGroup`.

**Tau Ceti.** `TauCeti.BipartiteRibbonGraph` (`TauCeti/Combinatorics/RibbonGraph/Basic.lean`) with
`facePerm`, `Face`, `IsConnected`, `blackDegree`, `whiteDegree`, `eulerChar`, `Iso`;
`TauCeti.BipartiteRibbonGraph.IsConnected.eulerChar_le_two` and `even_eulerChar`
(`RibbonGraph/EulerCharacteristic.lean`); `genus` and `IsConnected.two_sub_two_mul_genus`
(`RibbonGraph/Genus.lean`); `TauCeti.PermutationTriple` and `PermutationTriple.IsRegular`.

## Layer 0 — Sign vectors

0.1 `SignVector.compose`, `SignVector.sep`, `SignVector.ConfLE`, `SignVector.reorient`,
`SignVector.supp` (support as a `Set E`), with: composition is associative and idempotent;
`X ∘ Y = X` when `supp Y ⊆ supp X`; `-(X ∘ Y) = (-X) ∘ (-Y)`; `X ∘ Y = Y ∘ X` iff `sep X Y = ∅`;
`sep` is symmetric; `ConfLE` is a partial order with least element `0` and `X ≤ᶜ X ∘ Y`;
reorientation is an involution commuting with negation and composition.

0.2 Restriction to `E' ⊆ E` and extension by `0`, with their compatibilities with 0.1.

## Layer 1 — Chirotopes

1.1 **The structure** `Chirotope r E` of the conventions, with `CoeFun`, `ext`, negation, and the
lemmas: `χ` vanishes on tuples with a repeated entry; `χ (b ∘ σ) = χ b` for even `σ`; the support is
invariant under permutation of the tuple.

1.2 **Grassmann–Plücker.** The full Grassmann–Plücker relations (BLSWZ Definition 3.5.3, (B2))
follow from the three-term relations and the matroid condition (BLSWZ Lemma 3.5.4 and §3.6).

1.3 **Underlying matroid.** For `[Finite E]`, `Chirotope.matroid χ : Matroid E`, built with
`Matroid.ofIsBaseOfFinite` on `Set.univ`, whose bases are the ranges of tuples with `χ b ≠ 0`.
Its rank is `r`. Loops, parallel pairs, `IsSimple` (no loops, no parallel pairs) and `IsUniform`
(`χ b ≠ 0` for every injective `b`) are defined through it.

1.4 **Realizable chirotopes.** `Chirotope.ofVectors v` is a chirotope whenever the vectors span
`Fin r → 𝕜`; its matroid is the matroid of linear independence of `v`. The three-term relation comes
from the three-term Plücker identity for `3 × 3` minors; prove that identity for `Matrix.det` over a
commutative ring. `IsRealizable χ 𝕜 : Prop := ∃ v, χ = ofVectors v`. Negating the first coordinate
of every vector negates `ofVectors`, so `-χ` is realizable when `χ` is.

1.5 **Operations.** Reorientation `χ.reorient A` (multiply by `-1` once for each entry of `b` in
`A`); relabelling along `E ≃ E'`; deletion of a non-coloop (restriction to `{e}ᶜ`, same rank);
contraction of a non-loop `e`, of rank `r - 1`, defined by `b' ↦ χ (Fin.snoc b' e)`; the dual of a
chirotope on `Fin m`, of rank `m - r`, defined by `χ* c = χ b * sign (Fin.append b c)` where `b` is
the increasing enumeration of the complement of the range of `c` and `Fin.append b c` is read as a
permutation of `Fin m`. Theorems: each operation yields a chirotope; the matroid of the dual is the
Mathlib dual `χ.matroid✶`; `χ** = χ` or `χ** = -χ`; the dual of a realizable chirotope is
realizable (Gale duality); deletion and contraction commute with reorientation and are exchanged by
duality.

1.6 **Equivalences.** `ReorientationEquivalent χ χ'` (`∃ A, χ' = χ.reorient A ∨ χ' = -χ.reorient A`)
and isomorphism (relabelling followed by reorientation equivalence). For odd `r`, `-χ` is the
reorientation of `χ` on `Set.univ`.

1.7 **Simplification.** Every chirotope on a finite `E` is obtained from a simple chirotope on the
set of parallel classes of non-loops by adding loops and parallel or antiparallel copies, and the
simple chirotope is unique up to reorientation (BLSWZ §3.4 and §7.1 for the constructions).

## Layer 2 — Covectors, cocircuits and the face lattice

2.1 **`OrientedMatroid E`** in covector form, with topes (maximal covectors), cocircuits (minimal
nonzero covectors), the rank (the length of a maximal chain from `0` to a tope), deletion,
contraction and reorientation, each proved to satisfy (L0)–(L3).

2.2 **From chirotopes.** `Chirotope.covectors χ` is `{0}` together with all compositions of finite
lists of cocircuit vectors `Chirotope.cocircuit χ x i` (those that are nonzero). Theorems: it is an
`OrientedMatroid` (BLSWZ §3.5 and §3.7); its nonzero minimal elements are exactly the nonzero vectors
`cocircuit χ x i`; their supports are the cocircuits of `χ.matroid`; `covectors (-χ) = covectors χ`;
reorientation and minors commute with `covectors`; its rank is `r`; for a finite `E` every
`OrientedMatroid` of rank `r ≥ 1` equals `covectors χ` for a chirotope `χ` of rank `r`, unique up
to sign (BLSWZ Theorem 3.5.5).

2.3 **Walls and polygons.** For a tope `T`, `walls T` is the set of `e` such that `T` with the
coordinate `e` negated is a tope. A tope is a `k`-gon when `walls T` has `k` elements.
Theorem: for a simple oriented matroid of rank 3 with at least three elements, every tope has at
least three walls (there are no bigons).

2.4 **The face lattice.** `WithTop` of the covector set under `ConfLE` is a lattice, graded of rank
`r + 1` for a finite `E` and rank `r` (BLSWZ §4.1). Each tope's lower interval contains no pair
`X, -X` with `X ≠ 0`.

2.5 **The projective face poset.** `ProjFace L` is the quotient of the nonzero covectors by
`X ~ -X`, ordered by `[X] ≤ [Y] ↔ X ≤ᶜ Y ∨ -X ≤ᶜ Y`; prove that this is a well-defined partial order.
The closed cell of `[Y]` is its lower set. `IsLatticial L` means that the intersection of any two
closed cells is empty or a closed cell. Its vertices are the classes of cocircuits, its edges the
classes of covectors of rank 2, its cells the classes of topes.

2.6 **Euler relation.** For finite `E` and rank `r ≥ 1`, `∑ (-1)^(rank X - 1)` over nonzero
covectors equals `1 + (-1)^(r - 1)`; in rank 3 this is `f₀ - f₁ + f₂ = 2` on the sphere and
`1` for the projective face poset (BLSWZ §4.6). For a uniform simple chirotope of rank 3 on `n`
elements: `n (n - 1)` cocircuits, `2 n (n - 1)` covectors of rank 2, `n (n - 1) + 2` topes.

2.7 **Rank 2 and cyclic orders.** Signed elements are `E × ℤˣ`, with antipode `(e, u) ↦ (e, -u)`
and `χ` extended to them by multiplying by the units. Theorem: for a simple chirotope of rank 2 on a
finite `E` with at least two elements there is a unique `CircularOrder` on `E × ℤˣ` such that, for
signed elements `a ≠ ±b`, `χ (a, b) = 1 ↔ sbtw a b (-a)`; the antipode preserves it, and every
circular order on `E × ℤˣ` preserved by the antipode, with exactly `|E| - 1` elements strictly
between `a` and `-a` for each `a`, comes from a unique simple rank-2 chirotope.
`Chirotope.localSequence χ e`, for a rank-3 `χ` and a non-loop `e`, is the circular order of the
simplification of `χ / e`: the cyclic order in which the pseudoline `e` meets the others.

## Layer 3 — Monotone arrangements: the topological model in rank 3

3.1 **`MonotoneArrangement n`** of the conventions, with `crossX i j` (symmetric, characterized by
`f i (crossX i j) = f j (crossX i j)`), `IsSimple` (no three pseudolines through a common point,
equivalently the `crossX` of distinct pairs sharing an index are distinct), relabelling by the
order-reversing map `Fin.revPerm` combined with `x ↦ -x`, and the straight-line example
`ofLines a b` (`f i x = a i * x + b i`) for strictly antitone slopes `a`.

3.2 **Points and cells.** `signAt A p : Option (Fin n) → SignType` sends `none` to `1` and `some i`
to `sign (p.2 - f i p.1)`. The *cell* of a sign vector `X` is `{p | signAt A p = X}`.

3.3 **The chirotope** `A.chirotope : Chirotope 3 (Option (Fin n))` (`n ≥ 2`) of the conventions.
Theorems: it is a chirotope; it is simple; it is uniform iff `A.IsSimple`; relabelling `A`
relabels it.

3.4 **Straight lines.** `(ofLines a b).chirotope = Chirotope.ofVectors v` with
`v none = ![0, 0, 1]` and `v (some i) = ![-1, a i, b i]`.

3.5 **Cell decomposition.** For `A` and `L = covectors A.chirotope`:
(i) the range of `signAt A` is `{X ∈ L | X none = 1}`;
(ii) every nonempty cell is path-connected, so the cells of topes are the connected components of
the complement of the union of the graphs;
(iii) the closure of the cell of `X` is the union of the cells of the `Y ∈ L` with `Y ≤ᶜ X` and
`Y none = 1`;
(iv) the cell of a tope is open; the cell of a rank-2 covector lies in one graph and is homeomorphic
to an open interval of `ℝ`; the cell of a cocircuit with `X none = 1` is one point;
(v) the cocircuits `X` with `X none = 0` are the points at infinity: their restrictions are the
cocircuits of the contraction `χ / none`, in the circular order of 2.7, and the cell of no point of
`ℝ²` is one of them.

3.6 **Topological representation in rank 3** (Folkman–Lawrence, marked form). Let `χ` be a simple
rank-3 chirotope on `Option (Fin n)`, `n ≥ 2`, in which `none` is in general position:
`χ ![a, b, none] ≠ 0` for all distinct `a b ≠ none`. Then there are `σ : Equiv.Perm (Fin n)`, a
monotone arrangement `A` and `R : Set (Option (Fin n))` with
`A.chirotope.reorient R = χ.relabel (Equiv.optionCongr σ)`. The unmarked form, for every rank-3
chirotope, is 5.5. (BLSWZ Theorem 5.2.1 and Chapter 6; Goodman–Pollack 1984.)

3.7 **The projective arrangement as a map.** For a simple rank-3 chirotope on at least three
elements, the maximal chains of the projective face poset (vertex < edge < cell) with the
involutions changing one member are a 2-carte satisfying `IsMap` (Layer 8.1); it is non-orientable
with Euler characteristic `1`. Its *skeleton* is the edge-labelled multigraph with the vertices and
edges of 2.5, each edge labelled by the unique element vanishing on it; isomorphic chirotopes have
isomorphic skeletons.

3.8 **Sylvester–Gallai and arrangements with no bigonal element.** For a simple rank-3 chirotope
on at least three elements, a *vertex* is a rank-2 flat, and an element is *bigonal* if it lies on
at most two vertices (Grothendieck's « bigonal » pseudoline; not a bigon tope, which 2.3 excludes).
Theorem (Sylvester–Gallai for pseudolines): some vertex lies on exactly two elements (Kelly–Rottenberg 1972, Theorem 3.6; Bokowski–Pokora 2018,
Theorem 1.3). Theorem: if no element is bigonal, there are four elements in general position (no
three on a vertex), and the chirotope either has exactly four elements or contains one of: five
elements in general position; a pencil of three and a pencil of two whose centres are not joined
by an element (`II′_{3,2}`); a complete quadrangle (six elements, four vertices of three). The
proof takes a simple vertex `a ∩ b`, two further vertices of `a` giving `c, d`, and then sorts a
fifth element by how many of the six vertices of `{a, b, c, d}` it passes through (none, one, or an
opposite pair). *Checks:* the complete quadrangle has no bigonal element and contains no five in
general position; three elements in general position have every element bigonal; in a
near-pencil (all elements but one through one vertex) every pencil element is bigonal.

3.9 **Does the skeleton determine the arrangement?** The converse of 3.7, stated and not proved.
`def SkeletonDetermines : Prop`: for simple rank-3 chirotopes `χ, χ'` with no bigonal element,
every isomorphism of their edge-labelled skeletons is induced by a unique isomorphism of the
chirotopes, up to reorientation. Faithfulness (uniqueness) and the case of *uniform* chirotopes
(every vertex on exactly two elements) are proved, and belong here as theorems: in the uniform
case each fourth element avoids the corners of a triangle and orients it. The open case is a
triangle whose other elements all pass through one of its three corners. *Check:* in the complete
quadrangle on `A, B, C, D`, the triangle `AB, AC, BC` has corners `A, B, C` and every other side
passes through one of them, so it is of the open kind; the triangle `AB, AC, BD` has corners `A`,
`B` and `AC ∩ BD`, and `CD` avoids all three and orients it.

## Layer 4 — Wiring diagrams, allowable sequences, signotopes, flips

4.1 **Allowable sequences** (Goodman–Pollack): lists of permutations of `Fin n` from `1` to
`Fin.revPerm`, each step reversing a family of pairwise disjoint intervals of consecutive positions,
each pair of wires reversed exactly once. Simple allowable sequences are those whose steps are
single adjacent swaps; they are exactly the sweeps of simple wiring diagrams. Every monotone
arrangement determines its allowable sequence (order of the wires at abscissae avoiding crossings),
and two monotone arrangements with the same allowable sequence have the same chirotope.

4.2 **Simple wiring diagrams.** For a word `w` of length `n (n - 1) / 2` the following are
equivalent: the product of its letters is `Fin.revPerm`; every pair of wires is swapped exactly once
along the sweep. `wiringArrangement w` is the piecewise-linear monotone arrangement drawn from `w`
(letter `t` occupying `[t, t + 1]`); it is simple.

4.3 **Moves.** Commutation (`… i j … ↦ … j i …` when `|i - j| ≥ 2`) and braid move
(`… i (i+1) i … ↦ … (i+1) i (i+1) …`) preserve wiring diagrams. Commutation equivalence preserves
the chirotope of `wiringArrangement`; a braid move changes it on exactly one triple (a triangle
flip). Theorem: any two simple wiring diagrams on `n` wires are connected by commutations and braid
moves. The number of commutation classes is `1, 1, 2, 8, 62` for `n = 1, …, 5` (OEIS A006245).

4.4 **Signotopes and local sequences.** For a simple monotone arrangement, `i < j < k ↦
A.chirotope (some i, some j, some k)` is a signotope. Theorem (Felsner–Weil): commutation classes of
simple wiring diagrams on `n` wires, simple monotone arrangements up to equality of chirotopes, and
rank-3 signotopes on `Fin n` are in bijection through these maps. For each wire `i`, its local
sequence is the order in which it crosses the others; a family of local sequences comes from a
simple wiring diagram iff for every `i < j < k` either (`j` before `k` for `i`, `i` before `k` for `j`,
`i` before `j` for `k`) or all three reversed, and the family determines the commutation class
(Felsner 1997).

4.5 **Triangle flips (projective).** For a uniform rank-3 chirotope and a triangular tope with walls
`{a, b, c}`, `χ.mutate a b c` (negate `χ` on the tuples enumerating `{a, b, c}`) is a chirotope.
Levi's triangle theorem: in a uniform rank-3 chirotope on at least three elements, every element is
a wall of at least three triangular cells of the projective face poset, so there are at least `n`
triangular cells. Ringel's theorem: any two uniform rank-3 chirotopes on the same finite `E` are
connected by mutations and reorientations.

4.6 **Small arrangements.** Isomorphism classes (1.6) of uniform rank-3 chirotopes on `Fin n` number
`1, 1, 1, 4` for `n = 3, 4, 5, 6` (Felsner–Goodman Table 5.6.1, OEIS A006248).

## Layer 5 — Extensions and relative positions

5.1 **Single-element extensions.** An extension of `χ` (rank `r` on `E`) is a chirotope `χ̃` of rank
`r` on `Option E` with `χ̃ (some ∘ b) = χ b` for all `b`. Its *localization* is the function on the
cocircuit vectors of `χ` sending `Y` to the value at `none` of the unique cocircuit vector of `χ̃`
restricting to `Y` (BLSWZ Proposition 7.1.4). Theorems: the localization is odd (`σ (-Y) = -σ Y`)
and determines `χ̃`; a function on cocircuits is a localization iff its restriction to every rank-2
contraction is a localization (Las Vergnas, BLSWZ Theorem 7.1.8); in rank 2 the localizations are,
in the circular order of 2.7, either `0` everywhere, or `0` at one antipodal pair of cocircuits and
`1` on one of the two open arcs between them, `-1` on the other, or nowhere `0` with `1` on an open
half-circle and `-1` on the antipodal one.

5.2 **Parallel extensions.** For `e ∈ E` not a loop, `Y ↦ Y e` is a localization; its extension adds
an element parallel to `e`.

5.3 **Levi's enlargement lemma.** For a rank-3 chirotope on a finite `E` and nonzero covectors `Y`,
`Z`, there is an extension `χ̃` in which `none` is not a loop and the extensions of `Y` and `Z` by
`0` at `none` are covectors of `χ̃`; if no `e` has `Y e = Z e = 0`, the extension can be chosen with
`none` parallel to no element of `E`. With 3.6, a new pseudoline can be drawn through any two
points of a monotone arrangement.

5.4 **The poset of relative positions.** `Positions χ` is the set of localizations of a rank-3
chirotope whose extension has `none` not a loop, ordered by `ConfLE` (specialization). Its maximal
elements are the localizations without zeros (generic positions); every position lies below a
generic one; the parallel extensions of 5.2 are positions. The lexicographic extension along an
ordered basis (BLSWZ §7.2) is generic, so generic positions exist, by a combinatorial argument
independent of Layer 3. For a generic position, the local sequence of `none` in `χ̃` (2.7) is its
crossing order with the oriented pseudolines of `E`.

5.5 **Topological representation, unmarked form.** For every simple rank-3 chirotope `χ` on a
finite `E` with at least two elements, and every generic extension `χ̃` of `χ`, `χ̃` relabelled
along some `Option E ≃ Option (Fin n)` fixing `none` satisfies the hypotheses of 3.6. Hence every
rank-3 chirotope (with 1.7) is the deletion of the line at infinity from the chirotope of a monotone
arrangement, up to isomorphism.

## Layer 6 — Stretchability

6.1 A rank-3 chirotope is *stretchable* when it is isomorphic (1.6) to a chirotope realizable over
`ℝ`. Theorem: a simple rank-3 chirotope on `Option (Fin n)` in which `none` is in general position
(3.6) is stretchable iff it is isomorphic, by an isomorphism fixing `none`, to
`(ofLines a b).chirotope` for some strictly antitone `a`.

6.2 **Pappus's theorem.** Over any field `K`, for `A B : Fin 3 → Fin 3 → K` with
`(Matrix.of A).det = 0` and `(Matrix.of B).det = 0`, the vectors
`C k = (A i ×₃ B j) ×₃ (A j ×₃ B i)` for `{i, j, k} = {0, 1, 2}`, `i < j`, satisfy
`(Matrix.of C).det = 0`.

6.3 **The non-Pappus arrangement.** Let `P : Fin 9 → Fin 3 → ℚ` be the rows `(0,0,1)`, `(1,0,1)`,
`(3,0,1)`, `(0,1,1)`, `(2,1,1)`, `(5,1,1)`, `(13,2,5)`, `(15,3,8)`, `(2,1,3)`; its rank-3 matroid
has exactly the nine three-point lines `{0,1,2}, {3,4,5}, {6,7,8}, {0,4,8}, {0,5,7}, {1,3,8},
{1,5,6}, {2,3,7}, {2,4,6}`. `nonPappus` is `ofVectors P` changed to take the value `1` on `(6, 7, 8)`
(and the alternating values on its permutations). Theorems: `nonPappus` is a simple rank-3
chirotope; it is not realizable over any ordered field; hence (5.5) there is a monotone arrangement
of nine pseudolines whose chirotope, with the line at infinity deleted, is isomorphic to
`nonPappus`: a non-stretchable arrangement.

6.4 **Small cases.** Every uniform rank-3 chirotope on `Fin n`, `n ≤ 6`, is realizable over `ℚ`
(from 4.6 and explicit coordinates for each class).

## Layer 7 — n-cartes

7.1 `stringCoxeterMatrix n p` (hypothesis `∀ i, p i ≠ 1`) and `cartographicGroup n`.

7.2 **`Carte n Φ`**, with `Carte.monodromyHom : cartographicGroup n →* Equiv.Perm Φ` (through
`CoxeterSystem.lift`, since the `r i` satisfy `IsLiftable`), and conversely the carte of any
homomorphism `cartographicGroup n →* Equiv.Perm Φ`; these are inverse. `monodromyHom` factors through
`(stringCoxeterMatrix n p).Group` iff `(r i * r (i + 1)) ^ p i = 1` for every `i`. The *type* of a
finite carte is the tuple of orders of the `r i * r (i + 1)`.

7.3 **Monodromy and connectivity.** `monodromyGroup` (`Subgroup.closure (Set.range r)` = range of
`monodromyHom`), `IsConnected` (`MulAction.IsPretransitive` of the monodromy group), `IsWithoutBoundary`
(every `r i` fixed-point-free), morphisms (equivariant maps), automorphisms. Theorems: a morphism to a
connected carte is surjective; the automorphism group of a connected carte acts freely on flags; a
finite connected carte has at most `card Φ` automorphisms.

7.4 **Residues and faces** for every `J`, the `i`-faces, incidence (sharing a flag), and the
flag graph (`SimpleGraph Φ`, adjacency by some `r i` with `r i φ ≠ φ`); connected iff the flag graph is.

7.5 **Coset cartes and classification.** The coset carte of `H ≤ cartographicGroup n`.
Pointed connected cartes up to pointed isomorphism ↔ subgroups (the stabilizer of the base flag);
connected cartes up to isomorphism ↔ conjugacy classes of subgroups; finite ↔ finite index.

## Layer 8 — Maps on closed surfaces

8.1 `IsMap` for a 2-carte: connected, and `r 0`, `r 1`, `r 2`, `r 0 * r 2` fixed-point-free. Every
edge has four flags, `card Φ = 4 * #edges`, and `eulerChar = #vertices - #edges + #faces`
(as an integer).

8.2 **Orientability.** The even part of the monodromy group is the image of the kernel of
`CoxeterSystem.lengthParity`. A map is orientable iff the even part has two orbits. The orientable
double cover on `Φ × ZMod 2` (`r i (φ, ε) = (r i φ, ε + 1)`) is a map iff the original is
non-orientable, and its Euler characteristic is twice the original's.

8.3 **Oriented maps as ribbon graphs.** For an orientable map and an orbit `Φ⁺` of the even part,
the `TauCeti.BipartiteRibbonGraph` with edges `Φ⁺`, black vertices the vertices, white vertices the
edges, `rotB = r 2 * r 1` and `rotW = r 0 * r 2` restricted to `Φ⁺`. Theorems: it is connected; every
white vertex has degree 2; its faces correspond to the faces of the map; its `eulerChar` equals the
map's. Conversely every connected bipartite ribbon graph whose white vertices all have degree 2 arises
this way, uniquely up to isomorphism (Walsh correspondence restricted to maps). Corollaries, through
`IsConnected.eulerChar_le_two` and `even_eulerChar`: an orientable map has even Euler characteristic
at most 2; a non-orientable map has Euler characteristic at most 1.

8.4 **Skeleton.** The vertex-edge incidence multigraph of a map; when no edge is a loop and no two
edges join the same vertices, the skeleton as a `SimpleGraph` on vertices.

## Layer 9 — Regular cartes, string C-groups and regular polytopes

9.1 **Regular cartes.** A connected carte is regular when its monodromy group acts freely. Theorems:
for finite connected cartes, regular ↔ the automorphism group acts transitively ↔ it has `card Φ`
elements; regular connected cartes up to isomorphism ↔ normal subgroups of `cartographicGroup n`,
and the automorphism group of the coset carte of `N` is `≃* (cartographicGroup n ⧸ N)ᵐᵒᵖ`.

9.2 **Regular carte of a group.** `regularCarte G ρ` for involutions `ρ : Fin (n + 1) → G` with
`(ρ i * ρ j) ^ 2 = 1` for `i.val + 2 ≤ j.val`; it is connected iff the `ρ i` generate `G`, and then
regular with automorphism group `Gᵐᵒᵖ`. Every regular connected carte is isomorphic to the regular
carte of its monodromy group.

9.3 **String C-groups and polytopes.** A string group generated by involutions has the
*intersection property* when `closure (ρ '' I) ⊓ closure (ρ '' J) = closure (ρ '' (I ∩ J))` for all
`I J : Set (Fin (n + 1))`; a string C-group is one with it. An abstract polytope of rank `n + 1` is a
bounded graded poset of rank `n + 2`, all of whose maximal chains have `n + 3` elements, strongly
flag-connected, with the diamond property (McMullen–Schulte §2A). Theorems: the flags of an abstract
polytope form a carte without boundary; a polytope is regular when this carte is; regular polytopes of
rank `n + 1` up to isomorphism ↔ string C-groups with `n + 1` generators up to generator-preserving
isomorphism (McMullen–Schulte Theorem 2E11).

9.4 **Platonic maps.** `Nat.card` of `(CoxeterMatrix.A 3).Group`, `(CoxeterMatrix.B 3).Group` and
`CoxeterMatrix.H₃.Group` are `24`, `48`, `120`; each is a string C-group. Their regular cartes are maps
of types `{3,3}`, `{3,4}`, `{3,5}`, and reversing the generators (`CoxeterMatrix.reindex Fin.revPerm`)
gives `{4,3}` and `{5,3}`; counts of vertices, edges, faces `(4,6,4)`, `(6,12,8)`, `(8,12,6)`,
`(12,30,20)`, `(20,30,12)`; all orientable with Euler characteristic 2. The icosahedral skeleton is a
5-regular simple graph on 12 vertices.

9.5 **The hemi-icosahedron.** In `CoxeterMatrix.H₃.Group`, `w₀ = (s 0 * s 1 * s 2) ^ 5` is central of
order 2 and generates the centre. The regular carte of the quotient by `Subgroup.zpowers w₀` is the
hemi-icosahedron: 60 flags, 6 vertices, 15 edges, 10 faces, non-orientable, Euler characteristic 1,
type `{3,5}`, skeleton isomorphic to the complete graph on six vertices; its monodromy group is
isomorphic to `alternatingGroup (Fin 5)`; the quotient is a string C-group, so the hemi-icosahedron is
a regular polytope. The icosahedral map is its orientable double cover (8.2).

9.6 **Regular triangulations of the torus.** For `n ≥ 3`, on `ZMod n × ZMod n` let
`ρ 0 (x, y) = (1 - x + y, y)`, `ρ 1 (x, y) = (x, x - y)`, `ρ 2 (x, y) = (x - y, -y)`, and `T n` the
regular carte of the subgroup they generate in `Equiv.Perm (ZMod n × ZMod n)`. Theorems: the group has
`12 n ^ 2` elements; `T n` is an orientable map of type `{3,6}` with `n ^ 2` vertices, `3 n ^ 2` edges,
`2 n ^ 2` faces and Euler characteristic 0; its vertices correspond to the points of
`ZMod n × ZMod n`, its skeleton is the 6-regular simple graph joining `v` to `v ± (1,0)`, `v ± (0,1)`,
`v ± (1,1)`; reversing the generators gives the hexagonal map of type `{6,3}` (Coxeter–Moser §8.4).

## Layer 10 — The geometric representation of a Coxeter group

10.1 For a Coxeter matrix `M` on a finite `B`, the form `cosForm M i j = -Real.cos (π / M i j)`, and
`-1` when `M i j = 0`; the reflections `σ i v = v - 2 * (∑ j, cosForm M i j * v j) • Pi.single i 1` in
`Module.End ℝ (B → ℝ)`. Theorems: `σ i` is an involution fixing the hyperplane orthogonal to the
`i`-th basis vector for `cosForm`, and preserves `cosForm`; `σ i * σ j` has order exactly `M i j`
(infinite when `0`); hence the `σ i` satisfy `IsLiftable` and define
`geometricRepresentation M : M.Group →* Module.End ℝ (B → ℝ)` (Humphreys §5.3).

10.2 **Tits' theorem.** `geometricRepresentation M` is injective (Humphreys Corollary 5.4).
Consequences: `orderOf (M.simple i * M.simple j) = M i j` (with `0` for infinite order), and the
cartographic group and every string Coxeter group act faithfully on `ℝ ^ (n + 1)` by reflections.

## Sources

- **[BLSWZ]** A. Björner, M. Las Vergnas, B. Sturmfels, N. White, G. M. Ziegler, *Oriented
  Matroids*, 2nd ed., Encyclopedia of Mathematics and its Applications 46, Cambridge University
  Press, 1999: Definition 3.5.3, Lemma 3.5.4, Theorem 3.5.5 (chirotopes); §3.4 and §3.6 (duality,
  Grassmann–Plücker); §3.7 (vectors and covectors); Definition 4.1.1 and §4.1 (covector axioms, face
  lattice); §4.6 (face counts); Theorem 5.2.1 (topological representation); Chapter 6 (arrangements
  of pseudolines, pp. 247–280); Proposition 7.1.4, Theorem 7.1.8 (single-element extensions); §7.2 (lexicographic extensions).
- J. Folkman, J. Lawrence, *Oriented matroids*, J. Combin. Theory Ser. B 25 (1978), 199–236.
- J. Lawrence, *Oriented matroids and multiply ordered sets*, Linear Algebra Appl. 48 (1982), 1–12.
- F. Levi, *Die Teilung der projektiven Ebene durch Gerade oder Pseudogerade*, Ber. Math.-Phys. Kl.
  Sächs. Akad. Wiss. Leipzig 78 (1926), 256–267 (enlargement lemma; triangles).
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
  (1972), 617–622.
- J. Bokowski, P. Pokora, *On the Sylvester–Gallai and the orchard problem for pseudoline
  arrangements*, Period. Math. Hungar. 77 (2018), 164–174, arXiv:1607.05864.
- A. Grothendieck, *Esquisse d'un programme* (1984), §§2–3, in *Geometric Galois Actions 1*, LMS
  Lecture Note Series 242, Cambridge University Press, 1997, 5–48 (n-cartes, cartographic groups).
- A. Vince, *Combinatorial maps*, J. Combin. Theory Ser. B 34 (1983), 1–21.
- G. A. Jones, D. Singerman, *Theory of maps on orientable surfaces*, Proc. London Math. Soc. (3) 37
  (1978), 273–307.
- H. S. M. Coxeter, W. O. J. Moser, *Generators and Relations for Discrete Groups*, 4th ed.,
  Springer, 1980, Chapter 8 (regular maps, §8.4 toroidal maps).
- P. McMullen, E. Schulte, *Abstract Regular Polytopes*, Cambridge University Press, 2002, §2A,
  §2E, Theorem 2E11.
- J. E. Humphreys, *Reflection Groups and Coxeter Groups*, Cambridge University Press, 1990, §5.3,
  Corollary 5.4.

## Provenance

Several folders of Alexandre Grothendieck's manuscripts (fonds of the University of Montpellier),
edited in the Grothendieck edition project, build these objects by hand: crucial arrangements of
pseudolines and a six-line counterexample (folder 80), relative positions of an added pseudoline
(folder 154), the combinatorial icosahedron and hemi-icosahedron (folder 86), coset graphs and
triangulations of `(ℤ/n)²` (folder 79), and realizations of the universal regular n-carte by
reflections (folder 72). Folder 80, pp. 20–28, states the classification of 3.8 without proof (its
proof there relies on a false lemma, the six-line counterexample above), and pp. 48–54 ask the
question of 3.9; the proof of 3.8 from Sylvester–Gallai and the uniform case of 3.9 are the
edition's (`lean/Grothendieck/Folder80Maps2.lean`, `map_dichotomy`;
`lean/Grothendieck/Folder80Maps3.lean`, `full_simple`, in a model of maps rather than chirotopes).
Their open questions are stated in terms of Layers 2.5, 3.7, 3.9, 4, 5.4 and 9;
the edition's Lean files are not a specification for this roadmap.

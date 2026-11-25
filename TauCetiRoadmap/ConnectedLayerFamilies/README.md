# Roadmap: connected layer families and diameters of normal complexes

**Summary.** The graph of a simple polytope is the facet-adjacency graph of a pure simplicial
complex, and two classical general upper bounds for its diameter, Larman's and Kalai–Kleitman's,
use very little geometry. This roadmap proves both in a purely combinatorial setting. A connected
layer family of rank `d` on an `n`-element set `V` is a sequence of nonempty layers
`L 0, …, L N` of `d`-element subsets of `V`, no set lying in two layers, such that for every set
`S` the layers with a member containing `S` are consecutive; its length is `N`. A
pure complex of rank `d` is a family of `d`-element sets (its facets); two facets are adjacent when
they share `d − 1` elements, and the complex is normal when, for every set `S`, the facets
containing `S` form a connected part of this graph (for `S = ∅`: any two facets are joined).

The headline theorems are these.

- **Larman–Barnette form.** Every connected layer family of rank `d` and length `N` on `n` points
  has `2N ≤ (n − 1)·2^d`, that is `N ≤ (n − 1)·2^(d−1)` when `d ≥ 1`.
- **Kalai–Kleitman form.** If `d ≥ 1`, every connected layer family of rank `d` and length `N` on
  `n` points has `N + 1 ≤ n^(log₂ d + 1)`.
- **Normal complexes.** The facet graph of a normal pure complex of rank `d` on `n` points has
  finite diameter `δ` with `2δ ≤ (n − 1)·2^d`, and, if the complex is nonempty and `d ≥ 1`,
  `δ + 1 ≤ n^(log₂ d + 1)`.
- **Arbitrary pure complexes.** Any two facets of a pure complex of rank `d` on `n` points at
  distance `δ` in the facet graph satisfy `(d − 1)·δ + d ≤ C(n, d − 1)`.

Around them: the link of a family at an element common to all its layers is again a connected
layer family, and for `1 ≤ d ≤ n` there are families of length `n − d`; some small families are
longer than `n − d` (rank 2 on four points reaches length 3).

The roadmap rests on Mathlib alone: finite sets, simple graphs with their distance and extended
diameter, and real powers. Whether the diameters of polytope graphs are bounded by a polynomial in
`n` and `d` is the question that motivates the abstract setting; the bounds above are the
Larman and Kalai–Kleitman bounds of the literature cited below, for abstract families and
complexes.

Layer 1 defines connected layer families and their links. Layer 2 builds the families of length
`n − d`. Layer 3 proves the two upper bounds for families. Layer 4 defines the facet graph and
normal complexes, proves the corridor bound for arbitrary pure complexes, and transfers the bounds
of Layer 3 to normal complexes by layering a complex by distance from a facet.

## Conventions

- Sets live in an arbitrary type `α` with decidable equality; the ground set is `V : Finset α`
  and `n = V.card`. No relabelling by `Fin n` is used except in 2.1: the blocks of a family in the
  routes of Layer 3 live on subsets of the same `α`.
- A family is a sequence `L : ℕ → Finset (Finset α)`; with length `N` only `L 0, …, L N` matter.
  The length is the number of layers minus one. No maximal-length function is defined: every bound
  is a statement about every family.
- The interval condition of 1.1 is equivalent to the intersection form: for `i < j < k ≤ N`,
  `A ∈ L i` and `C ∈ L k`, some `B ∈ L j` contains `A ∩ C`. (Apply the interval condition to
  `S = A ∩ C`; conversely, if `S ⊆ A ∈ L i` and `S ⊆ C ∈ L k` with `i < j < k`, a member
  `B ⊇ A ∩ C` of `L j` contains `S`, and `j = i` or `j = k` is trivial.) Routes use both forms.
- A pure complex of rank `d` is given by its facets `C : Finset (Finset α)` with `X.card = d` and
  `X ⊆ V` for every `X ∈ C`; rank `d` is dimension `d − 1`. The facet graph lives on the subtype of
  members of `C`. Mathlib's `PreAbstractSimplicialComplex` is a downward-closed collection of
  nonempty finite sets (the downward closure of such a family, minus `∅`, is one); Mathlib has no
  facet graph, purity, star or normality for it, and its
  `Geometry.SimplicialComplex.facets` concerns geometric complexes in a vector space. Neither is
  used.
- Diameters use `SimpleGraph.ediam`, which is `⊤` for a graph on a nonempty type that is not
  connected and `0` on an empty or one-point type. Distances between two facets use
  `SimpleGraph.dist`, which is `0` for facets in different components; 4.1 is true also at that
  value. `SimpleGraph.diam` is not used: it is `0` for a disconnected graph.
- Natural-number subtraction: `(n − 1)·2^d` is `(V.card - 1) * 2 ^ d`, and `d − 1` in 4.1 is
  truncated at `d = 0`. Real powers are `Real.rpow` with base `(V.card : ℝ) ≥ 0` and exponent
  `Real.logb 2 d + 1`; for `d = 1` the exponent is `1`.

## Layer 1: Connected layer families and links

### 1.1 Connected layer families and their links

Define `IsConnectedLayerFamily V d N L` (a structure of four conditions): for all `i ≤ N` the
layer `L i` is nonempty and its members are `d`-element subsets of `V`; a set belongs to `L i` for
at most one `i ≤ N`; and (the interval condition) for every finite set `S` and `i ≤ j ≤ k ≤ N`, if
members of `L i` and of `L k` contain `S`, so does a member of `L j`. This is the notion of
Eisenbrand, Hähnle, Razborov and Rothvoß, the set case of the connected layer multicomplexes in
Santos' survey (arXiv:1307.5900, Def 3.3, p. 10, and §3.4, p. 15), whose condition (1) is the
interval condition.

Define the link at `e`, `layerLink e L`, whose layer `i` is the image of the members of `L i`
containing `e` under `A ↦ A \ {e}`.

Prove `IsConnectedLayerFamily.layerLink`: if `L` is a connected layer family of rank `d + 1` and
length `N` on `V`, and `e` lies in a member of every layer `L i`, `i ≤ N`, then `layerLink e L` is a
connected layer family of rank `d` and length `N` on `V \ {e}` (Santos, Prop 3.6, p. 11, for every
face; here the face `{e}`).

*Route.* Nonemptiness is the hypothesis on `e`. A member `A` containing `e` has
`(A.erase e).card = d` (`Finset.card_erase_of_mem`) and `A.erase e ⊆ V.erase e`
(`Finset.erase_subset_erase`, `Finset.mem_powersetCard`). One layer per set: if
`A.erase e = A'.erase e` with `e ∈ A` and `e ∈ A'`, then `A = A'` (`Finset.insert_erase`), so a set
in two link layers comes from a set in two layers of `L`. Interval condition: let `i ≤ j ≤ k ≤ N`
and `S ⊆ A.erase e`, `S ⊆ C.erase e` with `e ∈ A ∈ L i` and `e ∈ C ∈ L k`. Then `e ∉ S` and
`insert e S` lies in `A` and in `C` (`Finset.subset_erase`, `Finset.insert_subset_iff`), so some
`B ∈ L j` contains `insert e S`; then `e ∈ B`, `B.erase e` is in link layer `j`, and
`S ⊆ B.erase e`.

*Needs:* Mathlib `Finset.card_erase_of_mem`, `Finset.erase_subset_erase`,
`Finset.mem_powersetCard`, `Finset.insert_erase`, `Finset.subset_erase`,
`Finset.insert_subset_iff`.

**Checks.**
- Nonemptiness and the one-layer condition are needed for the bounds of Layer 3. On `V = {1}`,
  rank 1: without the condition that a set lies in one layer only, the constant sequence
  `L i = {{1}}` satisfies the other three conditions for every `N`; without nonemptiness
  `L 0 = {{1}}`, `L 1 = ∅` satisfies the other three with `N = 1`. Both contradict 3.1, which
  allows only `N = 0` there.
- The interval condition is not implied by the other conditions: on `{1, 2, 3, 4}` the layers
  `{12} | {34} | {13}` are nonempty, disjoint and of rank 2, but `{1}` lies in members of the first
  and last layers and in no member of the middle one.
- Without the interval condition the bound 3.1 fails: the ten pairs of `{1, …, 5}`, one per layer
  in any order, satisfy the other three conditions with `N = 9`, and `2·9 = 18 > (5 − 1)·2² = 16`.

### Examples

- The family `{12} | {24, 13} | {14, 23} | {34}` on `{1, 2, 3, 4}` is a connected layer family of
  rank 2 and length 3: in the intersection form, the triples of layers `(0, 1, 2)` and
  `(1, 2, 3)` need `{1} ⊆ 13`, `{2} ⊆ 24`, `{4} ⊆ 14` and `{3} ⊆ 23`, and the triples
  `(0, 1, 3)`, `(0, 2, 3)` only need `12 ∩ 34 = ∅`. Its link at `1` is not a family of length 3,
  since `1` lies in no member of the last layer; its first three layers `{12} | {13} | {14}` have
  link `{2} | {3} | {4}`, of rank 1.
- On `{1, …, 5}`, `{123} | {135, 124} | {125, 134} | {145}` is a connected layer family of rank 3
  and length 3; `1` lies in every member, and the link at `1` is the rank-2 family
  `{23} | {35, 24} | {25, 34} | {45}` on `{2, 3, 4, 5}`, the first example relabelled.

### Dependencies

Mathlib finite sets only.

## Layer 2: Families of length n − d

### 2.1 Windows

Prove `exists_isConnectedLayerFamily_length_sub`: if `1 ≤ d ≤ n`, there is a connected layer
family of rank `d` and length `n − d` on `Finset.univ : Finset (Fin n)`.

*Route (proved here).* For `i ≤ n − d` let layer `i` be the single window
`W i = {x | i ≤ x < i + d}`, which has `d` elements since `i + d ≤ n` (`Nat.card_Ico`). Windows
with different `i` have different least elements because `d ≥ 1`, so no set lies in two layers.
If `S ⊆ W i` and `S ⊆ W k` with `i ≤ j ≤ k`, then `S ⊆ W i ∩ W k = {x | k ≤ x < i + d} ⊆ W j`,
because `j ≤ k` and `i + d ≤ j + d`.

*Needs:* Mathlib `Nat.card_Ico`.

**Checks.**
- The hypothesis `1 ≤ d` is needed: for `d = 0` and `n = 1` a family of length `n − d = 1` would
  have two layers, each equal to `{∅}` (the only set with no element), and they are not disjoint.
- For `d = 1` the windows give length `n − 1`, and 3.1 gives `2N ≤ 2(n − 1)`: the largest length
  of a rank-1 family on `n` points is exactly `n − 1`.

### Examples

- `n = 4`, `d = 2`: `{0, 1} | {1, 2} | {2, 3}`, length `2 = n − d`. The first example of Layer 1
  has length 3 on the same number of points, so `n − d` is not the largest length for families
  (for polytope graphs `n − d` is the Hirsch bound).
- Write `H(n, d)` for the largest length of a family of rank `d` on `n` points. Exhaustive search
  over all families on at most five points gives `H(4, 2) = 3`, `H(5, 2) = 4`, `H(5, 3) = 3`, and
  `H(n, 1) = n − 1`, `H(n, n) = 0`, `H(n, n − 1) = 1` for `2 ≤ n ≤ 5`; for `1 ≤ d ≤ n ≤ 5` every
  value lies between `n − d` and the bounds of Layer 3.

### Dependencies

Layer 1 (the definition).

## Layer 3: Upper bounds on the length

### 3.1 The Larman–Barnette form

Prove `IsConnectedLayerFamily.two_mul_length_le`: a connected layer family of rank `d` and length
`N` on `V` satisfies `2N ≤ (n − 1)·2^d` (Santos, Thm 3.14 with Lemma 3.13, pp. 13–14, for
multisets; for sets, Santos §3.4, p. 15; attributed there to Larman 1970, Barnette 1974 and
Eisenbrand et al.; Kim–Santos, Thm 2.5, p. 10, states Larman's bound for polytopes). No hypothesis
on `d` is needed.

*Route (proved here, after Santos' block decomposition).* Induction on `d`, for all `V`, `N`, `L`.

- `d = 0`: every layer is `{∅}`; since `∅` lies in one layer only, `N = 0`.
- `d = 1`: members are singletons; choose `{xᵢ} ∈ L i` for each `i ≤ N`; the `xᵢ` are distinct
  because no set lies in two layers, so `N + 1 ≤ n` and `2N ≤ 2(n − 1)`.
- `d ≥ 2`: cut the layers into consecutive blocks. Block 1 starts at `s = 0`; a block starting at
  `s` ends at the largest `t ≤ N` such that some element of a member of `L s` lies in a member of
  `L t`; the next block starts at `t + 1`. Let there be `k ≥ 1` blocks, the `m`-th with `nₘ`
  elements in the union `Uₘ` of its members and length `ℓₘ = t − s`, so that
  `N = ℓ₁ + … + ℓ_k + (k − 1)`.
  (a) Each block, reindexed from `0`, is a connected layer family of rank `d` and length `ℓₘ` on
  `Uₘ` (the four conditions restrict to consecutive layers and to any ground set containing the
  members).
  (b) Some element `e` lies in a member of `L s` and of `L t`, hence, by the interval condition,
  in a member of every layer of the block; by 1.1 the link at `e` is a family of rank `d − 1` and
  length `ℓₘ` on `Uₘ \ {e}`, with `nₘ − 1` elements. By induction `2ℓₘ ≤ (nₘ − 2)·2^(d−1)`, where
  `nₘ ≥ d ≥ 2`.
  (c) An element `x` lies in at most two blocks: if it lay in blocks `β < γ < η`, at layers
  `p < s_γ ≤ q ≤ t_γ < r`, the interval condition puts `x` in members of `L s_γ` and of
  `L (t_γ + 1)`, against the choice of `t_γ`. An element of a member of `L 0` lies only in
  block 1, by the choice of its end. Since `L 0` has a member with `d ≥ 1` elements,
  `n₁ + … + n_k ≤ 2n − 1`.
  (d) Summing (b): `2N ≤ (n₁ + … + n_k − 2k)·2^(d−1) + 2k − 2 ≤ (2n − 1 − 2k)·2^(d−1) + 2k − 2`,
  and `(2n − 2)·2^(d−1) − [(2n − 1 − 2k)·2^(d−1) + 2k − 2] = (2k − 1)·2^(d−1) − 2k + 2 ≥ 2k ≥ 0`
  because `2^(d−1) ≥ 2`. So `2N ≤ (n − 1)·2^d`.

*Needs:* 1.1; the definition.

**Checks.**
- Rank 1 is sharp: the windows of 2.1 with `d = 1` have `2N = 2(n − 1)`.
- `(4, 2)`: the bound is `N ≤ 6`; the largest length is 3 (exhaustive search). `(5, 3)`: the
  bound is `N ≤ 16`; the largest length is 3.
- `d = 0`, `V = ∅`: the family `L 0 = {∅}` has `N = 0` and the bound reads `0 ≤ 0`.

### 3.2 The Kalai–Kleitman form

Prove `IsConnectedLayerFamily.length_add_one_le_rpow`: if `d ≥ 1`, a connected layer family of rank
`d` and length `N` on `V` satisfies `N + 1 ≤ n^(log₂ d + 1)` (Santos, Thm 3.12 with Lemma 3.11,
pp. 12–13, for multisets; Kalai–Kleitman 1992, Theorem 1, with exponent `log d + 2`, and the
recursion on p. 316, for polyhedra; Kim–Santos, Thms 2.6 and 2.7, p. 10).

*Route (proved here; one-step induction).* Write `F(m, r) = m^(log₂ r + 1)` for real `m ≥ 0` and
`r ≥ 1`; it is nondecreasing in `m` (`Real.rpow_le_rpow`) and `F(0, r) = 0` (`Real.zero_rpow`).
Strong induction on `n`, for all `d ≥ 1` and all families.

- `d = 1`: `N + 1 ≤ n` as in 3.1, and `F(n, 1) = n` (`Real.logb_one`, `Real.rpow_natCast`).
- `d ≥ 2` and `n ≤ 1`: no family exists, since a member of `L 0` has `d` elements in `V`.
- `d ≥ 2` and `n ≥ 2`: put `a = ⌊(n − 1)/2⌋` and `b = ⌊n/2⌋` (so `a + b = n − 1`, `a, b < n`).
  Let `i ≤ N + 1` be the largest number of initial layers whose members together use at most `a`
  elements, and `j` the largest number of final layers using at most `b` elements. Initial or final
  runs of layers are families on the union of their members, so by induction `i ≤ F(a, d)` and
  `j ≤ F(b, d)` (trivially when `i = 0` or `j = 0`).
  If `i + j ≥ N + 1`, then `N + 1 ≤ F(a, d) + F(b, d)`. Otherwise layers `0, …, i` use at least
  `a + 1` elements and layers `N − j, …, N` at least `b + 1`, more than `n` together, so some `e`
  lies in a member of a layer `p ≤ i` and of a layer `q ≥ N − j`; by the interval condition `e`
  lies in a member of every layer from `i` to `N − j`. These `N + 1 − i − j` layers form a family
  of rank `d` whose link at `e` (1.1) is a family of rank `d − 1` on `V \ {e}`, so by induction
  `N + 1 − i − j ≤ F(n − 1, d − 1)`. In both cases
  `N + 1 ≤ F(a, d) + F(b, d) + F(n − 1, d − 1)`.
  Let `x = log₂ d + 1`. Since `a, b ≤ n/2`, `F(a, d) + F(b, d) ≤ 2·(n/2)^x = n^x·2/2^x = n^x/d`,
  because `2^x = 2d` (`Real.rpow_add`, `Real.rpow_logb`). Next
  `F(n − 1, d − 1) ≤ F(n, d − 1) = n^x·n^(−y)` with `y = log₂ d − log₂ (d − 1) ≥ 0`
  (`Real.rpow_sub`), and `n^(−y) ≤ 2^(−y) = (d − 1)/d` because `n ≥ 2` and `y ≥ 0`
  (`Real.rpow_le_rpow`, `Real.rpow_neg`, `Real.rpow_logb`). Hence
  `N + 1 ≤ n^x/d + n^x·(d − 1)/d = n^x`.

*Needs:* 1.1; the definition; Mathlib `Real.rpow_le_rpow`, `Real.zero_rpow`, `Real.rpow_natCast`,
`Real.rpow_add`, `Real.rpow_sub`, `Real.rpow_neg`, `Real.rpow_logb`, `Real.logb_one`.

**Checks.**
- The hypothesis `d ≥ 1` is needed: with `d = 0`, `V = ∅` and `L 0 = {∅}`, `N = 0`, the right side
  is `0^(logb 2 0 + 1) = 0^1 = 0` (Mathlib's `Real.logb 2 0 = 0`), and `1 ≤ 0` fails.
- `n = 2`, `d = 1`: the window family has `N + 1 = 2 = F(2, 1)`, equality.
- The recursion `g(n, d) ≤ g(a, d) + g(b, d) + g(n − 1, d − 1)` of the route, with `g` the largest
  length plus one (and `0` when `d > n`), holds on all of `2 ≤ d ≤ n ≤ 5` by exhaustive search,
  with equality at every pair except `(5, 2)`, where `g(5, 2) = 5 < 6 = 1 + 1 + 4`; for instance
  `g(4, 2) = 4 = g(1, 2) + g(2, 2) + g(3, 1) = 0 + 1 + 3`.

### Examples

- The family of length 3 on four points (Layer 1) has `N + 1 = 4 ≤ 4² = 16` and
  `2N = 6 ≤ 12`; the bounds of 3.1 and 3.2 are far from the values found for small `n`.
- For `d = 2` the Kalai–Kleitman form gives `N + 1 ≤ n²` and the Larman–Barnette form
  `N ≤ 2(n − 1)`; for large `d` and `n` close to `d` the first is much smaller than the second.

### Dependencies

Layer 1 (1.1 and the definition). Layer 2 is used only in Checks.

## Layer 4: Facet graphs of pure complexes

### 4.1 The facet graph and the corridor bound

Define `facetGraph C`, the simple graph on the members of `C` in which `X` and `Y` are adjacent
when `X \ Y` and `Y \ X` each have exactly one element (for members of the same size: they share a
ridge). This is the adjacency (dual) graph of Santos (arXiv:1307.5900, §2.2, pp. 5–6).

Prove `facetGraph_dist_bound`: if every `X ∈ C` has `d` elements and lies in `V`, then for any two
members `X`, `Y`, `(d − 1)·dist(X, Y) + d ≤ C(n, d − 1)`. No connectivity is assumed. This is the
count in Santos' proof of Cor 2.7 (pp. 6–7), there for corridors.

*Route (proved here).* If `X` and `Y` are not joined by a walk, `dist(X, Y) = 0`
(`SimpleGraph.dist_eq_zero_of_not_reachable`) and the claim is `d ≤ C(n, d − 1)`: for `d = 0` it
reads `0 ≤ 1`, and for `d ≥ 1`, `X ⊆ V` gives `n ≥ d`, so
`C(n, d − 1) ≥ C(d, d − 1) = d` (`Nat.choose_le_choose`, `Nat.choose_succ_self_right`). Otherwise
take a walk `X = X₀, …, X_δ = Y` of length `δ = dist(X, Y)`
(`SimpleGraph.Reachable.exists_walk_length_eq_dist`). Two of its facets `Xₛ`, `X_t` with `s + 1 < t`
are distinct and not adjacent, since otherwise the walk could be shortened, against
`SimpleGraph.dist_le`. For `d ≥ 1`, each `X_t` has `d` subsets of size `d − 1`. A set `ρ` of size
`d − 1` contained in `Xₛ` and `X_t` with `s < t` forces them to be adjacent (each has exactly one
element outside `ρ`, and `Xₛ ≠ X_t`), so `t = s + 1`; consecutive facets share exactly one such
set, namely `Xₛ ∩ Xₛ₊₁`. Counting pairs (facet of the walk, `(d − 1)`-subset of it), the walk
meets at least `d(δ + 1) − δ` distinct `(d − 1)`-subsets of `V`, and there are `C(n, d − 1)` of
them (`Finset.card_powersetCard`). For `d = 0` the claim is `d ≤ C(n, d − 1)` as above, since
`C` then has at most one member and `δ = 0`.

*Needs:* Mathlib `SimpleGraph.dist_eq_zero_of_not_reachable`,
`SimpleGraph.Reachable.exists_walk_length_eq_dist`, `SimpleGraph.dist_le`, `Nat.choose_le_choose`,
`Nat.choose_succ_self_right`, `Finset.card_powersetCard`.

**Checks.**
- Sharpness for `d = 2`: the path complex `{12, 23, …, (n − 1)n}` on `n ≥ 2` points has
  `dist = n − 2` between its end facets, and `1·(n − 2) + 2 = n = C(n, 1)`.
- At the junk value: for the two facets `{1, 2}` and `{3, 4}` (`d = 2`, `n = 4`), which are not
  adjacent and not joined, `dist = 0` and the bound reads `2 ≤ 4`.
- `d = 1`: the bound reads `1 ≤ C(n, 0) = 1` whatever the distance; indeed all singletons are
  pairwise adjacent, so distances are at most 1, and the coefficient `d − 1 = 0` records that the
  count of ridges says nothing in rank 1.

### 4.2 Normal complexes

Define `facetStar C S`, the set of members of `C` containing `S`, and `IsNormalComplex C`: for
every finite set `S`, the subgraph of `facetGraph C` induced on `facetStar C S` is preconnected.
For `S = ∅` this says that the facet graph is preconnected; for `S` contained in no facet it is
empty. This is Santos' Def 3.1 (p. 9; "normal" after Adiprasito–Benedetti, "locally strongly
connected" after Izmestiev–Joswig), stated with stars.

Prove `ediam_facetGraph_le_of_isNormalComplex`: if every `X ∈ C` has `d` elements and lies in `V`
and `C` is normal, then `2·ediam(facetGraph C) ≤ (n − 1)·2^d` in `ℕ∞` (so the facet graph is
connected or empty), and, if moreover `d ≥ 1` and `C` is nonempty, `ediam + 1 ≤ n^(log₂ d + 1)`
for the natural number `ediam`. (Santos, Prop 3.7, p. 11, with Thms 3.12 and 3.14; the form with
paths through facets containing `u ∩ v` is Eisenbrand–Hähnle–Razborov–Rothvoß's, as stated in
Kim–Santos, Thm 2.7, p. 10.)

*Route (proved here, after Santos Prop 3.7).* If `C` is empty, `ediam = 0`
(`SimpleGraph.ediam_eq_zero_of_subsingleton`) and the second part has nothing to prove. Otherwise:

- The facet graph is preconnected: a walk in the subgraph induced on `facetStar C ∅`, which is all
  of `C`, maps to a walk of `facetGraph C` (`SimpleGraph.Embedding.induce`, `SimpleGraph.Walk.map`).
  With `C` nonempty it is connected, and there are `X`, `Y` with `ediam = edist(X, Y) = δ`, where
  `δ = dist(X, Y)` (`SimpleGraph.exists_edist_eq_ediam_of_finite`,
  `SimpleGraph.Reachable.coe_dist_eq_edist`).
- Layer by distance: `L i` = the facets `Z` with `dist(X, Z) = i`, for `i ≤ δ`. Members have `d`
  elements and lie in `V`; distinct layers are disjoint.
- Adjacent facets have distances from `X` that differ by at most one
  (`SimpleGraph.Connected.dist_triangle`, `SimpleGraph.dist_comm`, and `dist ≤ 1` along an edge by
  `SimpleGraph.dist_le`). Along any walk the distance from `X` therefore takes every integer value
  between its values at the two ends (induction on the walk).
- Nonempty layers: a walk from `X` to `Y` starts at distance `0` and ends at `δ`.
- Interval condition: if `S ⊆ A ∈ L i` and `S ⊆ C' ∈ L k` with `i ≤ j ≤ k ≤ δ`, normality at `S`
  gives a walk from `A` to `C'` through facets containing `S` (map the walk of the induced subgraph
  as above); one of them has distance `j` from `X`.
- So `L` is a connected layer family of rank `d` and length `δ` on `V`; 3.1 gives `2δ ≤ (n − 1)·2^d`
  and 3.2, for `d ≥ 1`, gives `δ + 1 ≤ n^(log₂ d + 1)`. Since `ediam = δ`, its `toNat` is `δ`.

*Needs:* 3.1, 3.2; Mathlib `SimpleGraph.ediam_eq_zero_of_subsingleton`,
`SimpleGraph.Embedding.induce`, `SimpleGraph.Walk.map`,
`SimpleGraph.exists_edist_eq_ediam_of_finite`, `SimpleGraph.Reachable.coe_dist_eq_edist`,
`SimpleGraph.Connected.dist_triangle`, `SimpleGraph.dist_comm`, `SimpleGraph.dist_le`.

**Checks.**
- Normality cannot be dropped: the two facets `{1, 2}`, `{3, 4}` with `V = {1, 2, 3, 4}` and `d = 2`
  form a pure complex whose facet graph is disconnected, so `ediam = ⊤` and `2·⊤ ≤ 12` fails; the
  star of `∅` is not preconnected, so the complex is not normal. Mathlib's `diam` of this graph is
  `0`, which is why the statement uses `ediam`.
- Nonemptiness is needed in the second part: `C = ∅` is normal (every induced subgraph is empty),
  and with `V = ∅`, `d = 1` the right side is `0^1 = 0` while `ediam + 1 = 1`.
- `d ≥ 1` is needed in the second part: `V = ∅`, `C = {∅}`, `d = 0` is normal with `ediam = 0`, and
  `1 ≤ 0^(logb 2 0 + 1) = 0` fails.
- Normal against strongly connected: on `{1, …, 5}` with `d = 3`, the complex
  `{123, 124, 135, 245}` has facet graph the path `135 – 123 – 124 – 245` of length 3, so it is
  strongly connected with diameter `3 > n − d = 2`; it is not normal, because `135` and `245`, the
  facets containing `{5}`, are not adjacent. Exhaustive search over all 1024 families of 3-subsets
  of five points finds 969 with connected or empty facet graph, 834 normal ones, largest diameter
  3 among the former and 2 among the latter.
- For every normal family on at most five points and every facet `X`, layering by distance from
  `X` and stopping at any `δ` up to the eccentricity of `X` gives a connected layer family
  (exhaustive search).

### Examples

- The boundary of a triangle, `{12, 13, 23}` with `d = 2`, is normal with diameter 1.
- The boundary complex of the octahedron, the eight triples choosing one of `{1, 2}`, `{3, 4}`,
  `{5, 6}`, is normal and has facet graph the 3-cube: diameter `3 = n − d`, against
  `(n − 1)·2^(d−1) = 20` from 4.2.
- Santos proves (Cor 2.12, p. 9) that for fixed rank `d` the largest diameter of strongly
  connected pure complexes on `n` points is at least of order `n^(2d/3)`; for `d ≥ 2` this exceeds
  the linear bound of 4.2 for large `n`, so connectivity alone does not give 4.2. The general bound
  is 4.1, of degree `d − 1` in `n`.

### Dependencies

Layer 3 (3.1, 3.2) for 4.2; Mathlib simple graphs and finite sets.

## Scope and ownership

This roadmap owns connected layer families of sets, their links, the families of length `n − d`,
the Larman–Barnette and Kalai–Kleitman bounds for them, the facet graph of a family of finite sets
with the corridor bound, stars and normal complexes, and the transfer of the two bounds to normal
pure complexes. No roadmap on main states any of these objects, and nothing here is restated from
another roadmap.

- Already in the library and cited: simple graphs with `SimpleGraph.dist`, `SimpleGraph.edist`,
  `SimpleGraph.ediam`, induced subgraphs and preconnectedness; finite sets, `Nat.choose` and real
  powers (Mathlib). Mathlib's `PreAbstractSimplicialComplex` and the geometric
  `Geometry.SimplicialComplex` are related carriers without facet graphs or normality (see
  Conventions). Tau Ceti has no object of this roadmap.
- Not treated: graphs of polytopes and polyhedra themselves; the passage from a simple polytope to
  its dual complex, which is normal and whose facet graph is the polytope graph (Santos Prop 2.4,
  p. 6), and which needs the faces of polyhedra; the Hirsch bound `n − d` for normal flag complexes
  (Adiprasito–Benedetti, Math. Oper. Res. 39 (2014)); connected layer multicomplexes and their
  exact values; lower bounds of order `n²/log n` for families and the corridor constructions of
  Santos §2.3; the Klee–Walkup theorems and the counterexamples to the Hirsch conjecture.

### Existing formal work

Allamigeon, Canu and Strub formalised in Coq the verification of the counterexamples of Matschke,
Santos and Weibel to the Hirsch conjecture, by computing vertex–edge graphs of explicit polytopes
and their diameters (CPP 2023). It contains no connected layer families or abstract complexes, and
nothing here is taken from it. The outside Lean repository
`michaellady/applied-formalization-targets` (file `Applied/Optimization/ConnectedLayerFamily.lean`)
declares connected layer families in the intersection form, with the window example and a
quasi-polynomial length bound; nothing from it is used here, and the definition here is in the
interval form.

## Exact supplier contracts

### From Mathlib

- Finite sets: `Finset.card_erase_of_mem` (`(s.erase a).card = s.card - 1` for `a ∈ s`,
  `Mathlib/Data/Finset/Card.lean`), `Finset.insert_erase` (`Mathlib/Data/Finset/Basic.lean`),
  `Finset.erase_subset_erase` and `Finset.subset_erase` (`s ⊆ t.erase a ↔ s ⊆ t ∧ a ∉ s`)
  (`Mathlib/Data/Finset/Erase.lean`), `Finset.insert_subset_iff` (`Mathlib/Data/Finset/Insert.lean`)
  for 1.1; `Finset.mem_powersetCard` (`s ∈ t.powersetCard n ↔ s ⊆ t ∧ s.card = n`) for the
  definition and 1.1, and `Finset.card_powersetCard` for 4.1 (`Mathlib/Data/Finset/Powerset.lean`).
- `Nat.card_Ico` (`Mathlib/Order/Interval/Finset/Nat.lean`) for 2.1; `Nat.choose_le_choose`
  (`a ≤ b → a.choose c ≤ b.choose c`) and `Nat.choose_succ_self_right` (`(n + 1).choose n = n + 1`)
  (`Mathlib/Data/Nat/Choose/Basic.lean`) for 4.1.
- `SimpleGraph.dist`, `SimpleGraph.dist_le` (the distance is at most the length of any walk),
  `SimpleGraph.dist_eq_zero_of_not_reachable`, `SimpleGraph.dist_comm`,
  `SimpleGraph.Connected.dist_triangle` (for a connected graph),
  `SimpleGraph.Reachable.exists_walk_length_eq_dist`, `SimpleGraph.Reachable.coe_dist_eq_edist`
  (`Mathlib/Combinatorics/SimpleGraph/Metric.lean`) for 4.1 and 4.2.
- `SimpleGraph.ediam`, `SimpleGraph.ediam_eq_zero_of_subsingleton`,
  `SimpleGraph.exists_edist_eq_ediam_of_finite` (nonempty finite vertex type)
  (`Mathlib/Combinatorics/SimpleGraph/Diam.lean`) for 4.2.
- `SimpleGraph.induce` and `SimpleGraph.Embedding.induce`
  (`Mathlib/Combinatorics/SimpleGraph/Maps.lean`),
  `SimpleGraph.Walk.map` (`Mathlib/Combinatorics/SimpleGraph/Walk/Maps.lean`),
  `SimpleGraph.Preconnected`, for the definition of normality and 4.2.
- `Real.logb`, `Real.logb_one`, `Real.rpow_logb` (base `b > 0`, `b ≠ 1`, positive argument)
  (`Mathlib/Analysis/SpecialFunctions/Log/Base.lean`); `Real.rpow_natCast`, `Real.zero_rpow`
  (nonzero exponent), `Real.rpow_le_rpow` (nonnegative base and exponent), `Real.rpow_add` and
  `Real.rpow_sub` (positive base), `Real.rpow_neg` (nonnegative base)
  (`Mathlib/Analysis/SpecialFunctions/Pow/Real.lean`) for 3.2.

### From Tau Ceti

Nothing is used: the pinned Tau Ceti has abstract simplicial complexes only as triangulations of
manifolds and geometric simplicial complexes with their subdivisions; it has no facet graphs,
layered families or polytope graphs.

## References

- F. Santos, *Recent progress on the combinatorial diameter of polytopes and simplicial complexes*,
  TOP 21 (2013), 426–460; arXiv:1307.5900v1 (numbering and pages as in the arXiv version). His proof
  of Thm 3.12 uses that the largest length of multiset families does not decrease with the rank
  (true for multisets: add one fixed element to every member); for sets it can decrease (on five
  points the largest length is 4 in rank 1 and 0 in rank 5). The bounds for sets follow from those
  for multisets, as his §3.4 notes; the route of 3.2 stays with sets and is a one-step induction
  that never compares ranks. His Thm 3.12 has no condition on `d`; at `d = 0` the exponent
  `log₂ 0` is undefined and with Mathlib's `Real.logb 2 0 = 0` the bound fails (Check of 3.2), hence
  `d ≥ 1`. 3.1 is written `2N ≤ (n − 1)·2^d` so that it also covers `d = 0`. The proof of his Lemma
  3.11 ends with `⌊n/2⌋` and `⌈n/2⌉` where the statement has `⌊(n − 1)/2⌋` and `⌈(n − 1)/2⌉`; the
  argument gives the latter (`⌈(n − 1)/2⌉ = ⌊n/2⌋`), which are used here.
- E. D. Kim and F. Santos, *An update on the Hirsch conjecture*, Jahresber. Dtsch. Math.-Ver. 112
  (2010), 73–98; arXiv:0907.1186v2.
- F. Eisenbrand, N. Hähnle, A. Razborov and T. Rothvoß, *Diameter of polyhedra: limits of
  abstraction*, Math. Oper. Res. 35 (2010), 786–794 (doi:10.1287/moor.1100.0470). They introduced
  connected layer families; their results are cited here through Santos §3.4 and Kim–Santos
  Thm 2.7.
- G. Kalai and D. J. Kleitman, *A quasi-polynomial bound for the diameter of graphs of polyhedra*,
  Bull. Amer. Math. Soc. 26 (1992), 315–316.
- D. G. Larman, *Paths on polytopes*, Proc. London Math. Soc. (3) 20 (1970), 161–178.
- D. Barnette, *An upper bound for the diameter of a polytope*, Discrete Math. 10 (1974), 9–13.
- K. Adiprasito and B. Benedetti, *The Hirsch conjecture holds for normal flag complexes*,
  Math. Oper. Res. 39 (2014), 1340–1348.
- X. Allamigeon, Q. Canu and P.-Y. Strub, *A formal disproof of Hirsch conjecture*, CPP 2023,
  17–29 (doi:10.1145/3573105.3575678).

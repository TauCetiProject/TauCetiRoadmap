# Roadmap: the linear algebra method in combinatorics

**Summary.** This roadmap develops the dimension arguments of extremal combinatorics: to bound
the size of a family of sets, or of a configuration of points or graphs, one attaches to each
member a vector or a function, shows that these are linearly independent, and compares their
number with the dimension of a space that contains them. The objects are finite families of
subsets of a finite set of `n` elements, finite sets of points in Euclidean space, decompositions
of a complete graph into complete bipartite graphs, and indexed families of pairs of finite sets.

The headline theorems are these.

- *Oddtown and Fisher's inequality.* If `p` is prime, no member of a family of subsets of an
  `n`-set has size divisible by `p`, and any two distinct members meet in a number of elements
  divisible by `p`, the family has at most `n` members. A family of nonempty subsets of an
  `n`-set in which any two distinct members meet in the same number of elements also has at most
  `n` members. If all members have even size and all pairwise intersections are even, the bound
  is `2^⌊n/2⌋`, and it is attained.
- *The Frankl–Wilson inequalities.* If any two distinct members of a family of subsets of an
  `n`-set meet in a number of elements belonging to a set of `s` integers, the family has at most
  `C(n, 0) + ⋯ + C(n, s)` members. The same bound holds when, for a prime `p`, sizes and
  intersections are only prescribed modulo `p`: no size is congruent to one of `s` given residues
  and every intersection is. If, in the first statement, the sizes of the members lie in a set of
  `r` values, each larger than `s − r`, the bound improves to `C(n, s) + C(n, s − 1) + ⋯ + C(n, s − r + 1)`
  (Alon, Babai and Suzuki); for one size `k ≥ s` this is the Ray-Chaudhuri–Wilson bound
  `C(n, s)`.
- *Two distances and bicliques.* A finite set of points of `ℝⁿ` with at most two distinct distances
  has at most `(n + 1)(n + 2)/2` points. The edges of the complete graph on `n` vertices cannot be split
  into fewer than `n − 1` edge sets of complete bipartite graphs.
- *Set pairs.* If `A₁, …, A_m` and `B₁, …, B_m` are finite sets with `Aᵢ` disjoint from `Bᵢ` and
  `Aᵢ` meeting `Bⱼ` for `i ≠ j`, then the numbers `1 / C(|Aᵢ| + |Bᵢ|, |Aᵢ|)` add up to at most `1`.
  If the condition is asked only for `i < j` and the sets have at most `k` and at most `l`
  elements, then `m ≤ C(k + l, k)`.

The roadmap builds on Mathlib's linear algebra (matrix rank, positive definite matrices,
bilinear forms, exterior powers) and on its theory of set families, which supplies the notion of
an `L`-intersecting family used in the statements and the Lubell–Yamamoto–Meshalkin inequality,
a special case of Bollobás's inequality. The sunflower lemma of Erdős and Rado is proved by
induction rather than by linear algebra and is stated in the last layer.

## How to read the build

The six layers below are independent of one another; inside them, 2.4 uses 2.3, 4.2 uses 4.1
and 6.2 uses 6.1. Layer 1 bounds
families through the rank of a Gram matrix of incidence vectors, over the field with `p` elements
or over the reals. Layer 2 replaces the vectors by functions on the subsets of the ground set and
the matrix rank by the dimension of a space of multilinear functions. Layer 3 applies the same
idea to polynomial functions of degree four on `ℝⁿ`. Layer 4 is the Graham–Pollak theorem, proved through the
rank of a sum of rank-one matrices. Layer 5 treats set pairs, by a counting argument for the
weighted inequality and through exterior powers for the skew form. Layer 6 is the sunflower
lemma. Within a layer the sections are in build order.

## Conventions

- **Set systems.** The ground set is a finite type `α` with `[Fintype α] [DecidableEq α]`, and
  `n = Fintype.card α`. A family is `F : Finset (Finset α)`; its members are distinct by
  construction, and `m = #F`. The sizes of members and of intersections are `#A` and
  `#(A ∩ B)`.
- **Intersection conditions.** For `L : Set ℕ`, Mathlib's `Set.IsIntersectingOf L 𝒜` says that
  `#(A ∩ B) ∈ L` for all distinct `A`, `B` in the set `𝒜 : Set (Finset α)`; a finite family is
  coerced to a set. A set `L` of `s` integers is a `Finset ℕ` with `#L = s`. Residues modulo `p`
  are elements of `ZMod p`, and a set of `s` residues is a `Finset (ZMod p)` with `s` elements.
- **Binomial sums.** `C(n, i)` is `n.choose i`, which is `0` for `i > n`. The sum
  `C(n, 0) + ⋯ + C(n, s)` is `∑ i ∈ range (s + 1), n.choose i`; for `s ≥ n` it is `2ⁿ`. A sum
  `C(n, s) + C(n, s − 1) + ⋯ + C(n, s − r + 1)` omits the terms of negative index and is written
  `∑ j ∈ Ico (s + 1 - r) (s + 1), n.choose j` with truncated subtraction, which omits exactly
  those terms.
- **Euclidean space.** `ℝⁿ` is `EuclideanSpace ℝ (Fin n)` with its Euclidean distance `dist`.
- **Indexed families.** Set pairs and biclique decompositions are indexed by `Fin m`, so repeated
  members are allowed by the type and excluded, where it matters, by the hypotheses. Their sets
  are `Finset β` for a type `β` with `[DecidableEq β]`, which need not be finite.

## Layer 1: Gram matrices of incidence vectors

### 1.1 Oddtown modulo a prime

Prove `card_le_of_not_dvd_card_of_dvd_card_inter`: let `p` be prime and `F` a family of subsets
of an `n`-element set such that `p` divides the size of no member and divides `#(A ∩ B)` for any
two distinct members. Then `#F ≤ n`. For `p = 2` this is the oddtown theorem (Matoušek,
Miniature 3, Theorem, p. 7); for a prime `p` it is stated by Sudakov and Vieira (§1, pp. 1–2), who
also record that the bound persists for prime powers and that for other composite moduli it is
open whether it holds.

Route: let `M` be the `F × α` incidence matrix over `ZMod p`. Its product with its transpose has
entry `#(A ∩ B)` modulo `p` at `(A, B)`, so it is diagonal with nonzero diagonal entries and has
rank `m`. Since the rank of a product is at most the rank of each factor and the rank of `M` is
at most its number of columns, `m ≤ n`.

**Checks.**
- The `n` one-element subsets form such a family for every prime `p`, so the bound is attained.
- The size condition cannot be dropped. For `p = 2` and `n = 6`, the eight unions of some of the
  pairs `{1, 2}`, `{3, 4}`, `{5, 6}` have even sizes and even pairwise intersections, and
  `8 > 6`.
- For `n = 0` the only subset is empty, of size `0`, which `p` divides; the family is empty.

*Needs:* Mathlib `Matrix.rank_mul_le_left`, `Matrix.rank_le_card_width`, `Matrix.rank_diagonal`.
(Proved here.)

### 1.2 Eventown

Prove `card_le_two_pow_of_even`: a family of subsets of an `n`-element set whose members have
even size and whose distinct members meet in an even number of elements has at most `2^⌊n/2⌋`
members (Sudakov and Vieira, §1, p. 1, where it is attributed to Berlekamp and to Graver).

Route: the incidence vectors of the members, in `α → ZMod 2`, are pairwise orthogonal and
orthogonal to themselves for the dot product, so their span `W` is contained in its orthogonal
complement. The dot product is nondegenerate, so `dim W + dim W^⊥ = n`, whence `dim W ≤ ⌊n/2⌋`.
Distinct members have distinct incidence vectors, all in `W`, and `W` has `2^(dim W)` elements.

**Checks.**
- The bound is attained: for `n = 2r` or `n = 2r + 1`, the `2^r` unions of some of `r` disjoint
  pairs form such a family.
- The condition on the sizes of the members cannot be dropped. For `n = 2` the family `∅`,
  `{1}`, `{2}` has pairwise intersections `∅` and three members, more than `2^1 = 2`; for `n = 1`
  the family `∅`, `{1}` has two members, more than `2^0 = 1`.
- For `n = 0` and `n = 1` the bound is `1`, attained by the family whose only member is `∅`.

*Needs:* Mathlib `Matrix.toBilin'`, `LinearMap.BilinForm.orthogonal`,
`LinearMap.BilinForm.finrank_orthogonal`, `Module.card_eq_pow_finrank`,
`Module.finrank_fintype_fun_eq_card`. (Proved here.)

### 1.3 Fisher's inequality

Prove `card_le_of_isIntersectingOf_singleton`: if the members of a family of subsets of an
`n`-element set are nonempty and any two distinct members meet in exactly `t` elements, for one
`t ≥ 0`, then the family has at most `n` members. This is the nonuniform form of Fisher's
inequality, due to Majumdar and rediscovered by Isbell (Matoušek, Miniature 4, Theorem, p. 9).
The intersection condition is Mathlib's `Set.IsIntersectingOf {t}`.

Route: suppose first that a member `A` has size `t`. Nonemptiness forces `t ≥ 1`, and each other
member `B` contains `A`, since `#(A ∩ B) = #A`. For two other members `B ≠ C` we get `B ∩ C = A`,
so the differences `B \ A` are pairwise disjoint nonempty subsets of the complement of `A`; hence
`#F ≤ 1 + (n − #A) ≤ n`. Otherwise every member has more than `t` elements, and the Gram matrix
`M Mᵀ` of the real incidence matrix is the sum of a diagonal matrix with positive diagonal and `t`
times the all-ones matrix, hence positive definite and invertible, so `m = rank(M Mᵀ) ≤ rank M ≤ n`.

**Checks.**
- The seven lines of the Fano plane, three-element subsets of a seven-element set any two of which
  meet in one element, attain the bound with `t = 1`.
- The family `{1}`, `{1, 2}`, …, `{1, n}` has `n` members, pairwise intersections `{1}`, and a
  member of size `t = 1`: the first case of the route.
- Nonemptiness cannot be dropped: with `t = 0`, the empty set together with the `n` one-element
  sets gives `n + 1` members.

*Needs:* Mathlib `Set.IsIntersectingOf`, `Matrix.PosDef`, `Matrix.PosDef.add_posSemidef`,
`Matrix.posSemidef_vecMulVec_self_star`, `Matrix.PosDef.isUnit`, `Matrix.rank_of_isUnit`,
`Matrix.rank_mul_le_left`, `Matrix.rank_le_card_width`. (Proved here.)

### Examples

The Fano plane for 1.3; the unions of disjoint pairs, which show that 1.2 is sharp and that the
size condition of 1.1 is needed.

### Dependencies

Mathlib `Set.IsIntersectingOf`, `Matrix.rank_mul_le_left`, `Matrix.rank_le_card_width`,
`Matrix.rank_diagonal`, `Matrix.rank_of_isUnit`, `Matrix.PosDef`, `Matrix.PosDef.add_posSemidef`,
`Matrix.posSemidef_vecMulVec_self_star`, `Matrix.PosDef.isUnit`, `Matrix.toBilin'`,
`LinearMap.BilinForm.orthogonal`, `LinearMap.BilinForm.finrank_orthogonal`,
`Module.card_eq_pow_finrank`, `Module.finrank_fintype_fun_eq_card`. No other layer.

## Layer 2: spaces of multilinear functions

Throughout this layer, functions on the subsets of `α` form a vector space over a field `K`. For
`I ⊆ α`, the monomial `x(I)` is the function sending `B` to `1` if `I ⊆ B` and to `0` otherwise. A
function in the span of the monomials `x(I)` with `#I ≤ d` is called multilinear of degree at most
`d`; that span has dimension at most `C(n, 0) + ⋯ + C(n, d)`, the number of such `I`. For a fixed
`A`, the function `B ↦ #(A ∩ B)` is `∑ j ∈ A, x({j})`, and a product of `d` such functions is
multilinear of degree at most `d`, because `x(I) x(J) = x(I ∪ J)`.

### 2.1 The nonuniform Frankl–Wilson inequality

Prove `card_le_sum_choose_of_isIntersectingOf`: if `L` is a set of `s` integers and `F` is a
family of subsets of an `n`-element set with `#(A ∩ B) ∈ L` for any two distinct members, then
`#F ≤ C(n, 0) + C(n, 1) + ⋯ + C(n, s)` (Alon, Babai and Suzuki, Theorem 1.3, p. 2, where it is
attributed to Frankl and Wilson). No condition relates `L` to the sizes of the members.

Route (Alon, Babai and Suzuki, §2, pp. 5–6): order the members by size and attach to `A` the real
function `f_A(B) = ∏ (#(A ∩ B) − l)` over the `l ∈ L` with `l < #A`. Then `f_A(A) ≠ 0` and
`f_A(B) = 0` for every member `B ≠ A` with `#B ≤ #A`, so the `f_A` are linearly independent, and
each is multilinear of degree at most `s`.

**Checks.**
- The bound is attained: the subsets with at most `s` elements meet pairwise in at most `s − 1`
  elements, so they form a family of this kind for `L = {0, …, s − 1}`, with
  `C(n, 0) + ⋯ + C(n, s)` members.
- With `L = ∅` the family has at most one member, and `C(n, 0) = 1`.
- For `s ≥ n` the bound is `2ⁿ`, the number of all subsets.

*Needs:* Mathlib `Set.IsIntersectingOf`, `linearIndependent_iff'`,
`LinearIndependent.fintype_card_le_finrank`, `finrank_span_le_card`, `Finset.card_powersetCard`.
(Proved here.)

### 2.2 Few sizes: the theorem of Alon, Babai and Suzuki

Prove `card_le_sum_choose_of_card_mem`: let `K` be a set of `r` integers and `L` a set of `s`
integers with `k > s − r` for every `k ∈ K`. If every member of a family `F` of subsets of an
`n`-element set has its size in `K`, and any two distinct members meet in a number of elements in
`L`, then `#F ≤ C(n, s) + C(n, s − 1) + ⋯ + C(n, s − r + 1)`, the terms of negative index omitted
(Alon, Babai and Suzuki, Theorem 1.4, p. 2). For `K = {k}` with `s ≤ k` the bound is `C(n, s)`:
this is the Ray-Chaudhuri–Wilson theorem (same paper, Theorem 1.1, p. 1). Note on the source: that
statement, for an arbitrary set `L` of `s` nonnegative integers, does not include the hypothesis
`s ≤ k`, and it fails without it, as the first Check shows; the paper's own proof uses it, when its
Lemma 2.1 is applied to `∑ j, x({j}) − k` on the sets of fewer than `s` elements.

Route (Alon, Babai and Suzuki, §2, pp. 6–8): with the `f_A` of 2.1, let
`g = ∏ k ∈ K, (∑ j, x({j}) − k)`. The function `g` does not vanish on any set of fewer than
`s − r + 1` elements, because every `k ∈ K` is at least `s − r + 1`; so the functions `x(I) g` with
`#I ≤ s − r` are linearly independent (their Lemma 2.1), and they vanish on every member of `F`.
Together with the `f_A` they form a linearly independent family of multilinear functions of degree
at most `s`, which gives the bound after subtracting `C(n, 0) + ⋯ + C(n, s − r)`.

**Checks.**
- The hypothesis `k > s − r` cannot be dropped. For `n = 4`, `K = {2}` and `L = {0, 1, 5, 6}` the
  six two-element subsets of the ground set meet pairwise in `0` or `1` elements, while the bound
  would be `C(4, 4) = 1`; here `s = 4` and `k = 2 ≤ s − r = 3`.
- For `r ≤ s + 1` the bound is attained by all subsets whose sizes lie between `s − r + 1` and
  `s`, with `K = {s − r + 1, …, s}` and `L = {0, …, s − 1}`.
- When `K` is `{0, 1, …, n}` and `s ≤ n`, the hypothesis holds and the bound is that of 2.1.

*Needs:* Mathlib `Set.IsIntersectingOf`, `linearIndependent_iff'`,
`LinearIndependent.fintype_card_le_finrank`, `finrank_span_le_card`, `Finset.card_powersetCard`.
(Proved here.)

### 2.3 The modular Frankl–Wilson inequality

Prove `card_le_sum_choose_of_zmod`: let `p` be prime and `L` a set of `s` residues modulo `p`. If
the size of no member of a family `F` of subsets of an `n`-element set lies in `L` modulo `p`, and
the size of the intersection of any two distinct members does, then
`#F ≤ C(n, 0) + C(n, 1) + ⋯ + C(n, s)`. This is the case of one set `L` for all members of
Theorem 3.1 of Alon, Babai and Suzuki (p. 8). The uniform form, with the bound `C(n, s)`, is due to
Frankl and Wilson and needs a further hypothesis: Theorem 1.5 of the same paper (p. 3), for one
size `k`, assumes among other conditions `n ≥ s + k`. Note on the source: Theorem 1.2 there
(p. 2), the uniform form as printed, has no such hypothesis and fails without one, as the second
Check shows.

Route: over `ZMod p`, attach to `A` the function `f_A(B) = ∏ l ∈ L, (#(A ∩ B) − l)`. By the two
hypotheses `f_A(A) ≠ 0` and `f_A(B) = 0` for `B ≠ A`, so the `f_A` are linearly independent, and
each is multilinear of degree at most `s`. The field is needed for the dimension count; whether
the bound survives for composite moduli is not claimed.

**Checks.**
- For `p = 2` and `L = {0}` the hypotheses say that sizes are odd and intersections even, and the
  bound is `n + 1`, one more than oddtown's `n` in 1.1.
- The uniform bound `C(n, s)` needs more than the hypotheses of this section. For `p = 5`,
  `L = {0, 2, 3}` and `n = 3`, the three one-element subsets satisfy them and are uniform of size
  `1`, and `3 > C(3, 3) = 1`; the bound of this section is `1 + 3 + 3 + 1 = 8`. Here `n < s + k = 4`.

*Needs:* Mathlib `ZMod`, `linearIndependent_iff'`, `LinearIndependent.fintype_card_le_finrank`,
`finrank_span_le_card`, `Finset.card_powersetCard`. (Proved here.)

### 2.4 A forbidden intersection

Prove `card_le_sum_choose_of_inter_ne`: let `p` be prime and `F` a family of `(2p − 1)`-element
subsets of an `n`-element set no two distinct members of which meet in exactly `p − 1` elements.
Then `#F ≤ C(n, 0) + C(n, 1) + ⋯ + C(n, p − 1)` (Matoušek, Miniature 17, Theorem, p. 56).

Route: apply 2.3 with `L` the residues `0, 1, …, p − 2`. The size `2p − 1` is `p − 1` modulo `p`.
Two distinct members meet in at most `2p − 2` elements, and never in `p − 1`, so the size of
their intersection is not `p − 1` modulo `p` and lies in `L`.

**Checks.**
- For `p = 2`: the four three-element subsets of a four-element set meet pairwise in two
  elements, and `4 ≤ 1 + 4 = 5`.
- For `p = 3` and `n = 7`: the twenty-one five-element subsets meet pairwise in at least three
  elements, and `21 ≤ 1 + 7 + 21 = 29`.

*Needs:* 2.3. (Proved here.)

### Examples

The family of all subsets with at most `s` elements, which shows that 2.1 is sharp; the six
two-element subsets of a four-element set against a set `L` padded with large values, for the
hypothesis of 2.2.

### Dependencies

Mathlib `Set.IsIntersectingOf`, `ZMod`, `linearIndependent_iff'`,
`LinearIndependent.fintype_card_le_finrank`, `finrank_span_le_card`, `Finset.card_powersetCard`.
Section 2.4 uses 2.3. No other layer.

## Layer 3: two-distance sets

### 3.1 Blokhuis's bound

Prove `card_le_choose_of_dist_eq_or_eq`: if `P` is a finite set of points of `ℝⁿ` and there are
real numbers `a`, `b` such that any two distinct points of `P` are at distance `a` or `b`, then
`#P ≤ C(n + 2, 2) = (n + 1)(n + 2)/2`. Larman, Rogers and Seidel proved the bound
`(n + 1)(n + 4)/2` (Matoušek, Miniature 15, Theorem, p. 50); the bound stated here is Blokhuis's
improvement (same miniature, Remark, p. 51). The numbers `a` and `b` may coincide.

Route: if `P` has at most one point the bound is clear. Otherwise a value among `a`, `b` that is
not the distance of two points of `P` may be replaced by the other one, so both are distances
of distinct points and hence positive. To the point `pᵢ` attach the polynomial function
`fᵢ(x) = (‖x − pᵢ‖² − a²)(‖x − pᵢ‖² − b²)`. Then `fᵢ(pᵢ) = a²b² ≠ 0` and `fᵢ(pⱼ) = 0` for
`j ≠ i`. Every `fᵢ` lies in the span of the `(n + 1)(n + 4)/2` functions
`‖x‖⁴`, `xⱼ‖x‖²`, `xᵢxⱼ` with `i ≤ j`, `xⱼ` and `1`. Blokhuis's argument shows that the `fᵢ`
together with the `n + 1` functions `1, x₁, …, xₙ` are linearly independent. In a vanishing
combination `∑ cᵢ fᵢ + ∑ dⱼ xⱼ + d₀`, the coefficients of `‖x‖⁴` and of `xⱼ‖x‖²` give
`∑ cᵢ = 0` and `∑ cᵢ pᵢ = 0`; evaluating at `pₖ` gives `cₖ a²b² = −(⟨d, pₖ⟩ + d₀)`; multiplying
by `cₖ` and summing gives `a²b² ∑ cₖ² = 0`, so every `cₖ` vanishes, and then every `dⱼ`.
Hence `#P + n + 1 ≤ (n + 1)(n + 4)/2`, which is the bound.

**Checks.**
- For `n = 1` the points `0, 1, 2` of the line have distances `1` and `2`, and `C(3, 2) = 3`:
  the bound is attained.
- For `n = 2` the vertices of a regular pentagon have two distances, and `5 ≤ C(4, 2) = 6`.
- The `C(n + 1, 2)` points of `ℝⁿ⁺¹` with two coordinates `1` and the others `0` lie in a
  hyperplane, so in a copy of `ℝⁿ`, and have the distances `√2` and `2`; for `n = 3` they are the
  six vertices of a regular octahedron, and `6 ≤ C(5, 2) = 10`.
- For `n = 0` the space has one point and the bound is `C(2, 2) = 1`.
- With `a = b` the set is equilateral; a regular simplex has `n + 1` points.

*Needs:* Mathlib `EuclideanSpace.dist_eq`, `linearIndependent_iff'`,
`LinearIndependent.fintype_card_le_finrank`, `finrank_span_le_card`. (Proved here.)

### Examples

The three points of the line, the regular pentagon and the regular octahedron, all in the
Checks of 3.1.

### Dependencies

Mathlib `EuclideanSpace.dist_eq`, `linearIndependent_iff'`,
`LinearIndependent.fintype_card_le_finrank`, `finrank_span_le_card`. No other layer.

## Layer 4: decompositions of the complete graph into bicliques

### 4.1 Biclique decompositions

For a type `V` and `X Y : Fin m → Finset V`, define `IsBicliqueDecomposition X Y`: the sets
`X k` and `Y k` are disjoint for every `k`, and for any two distinct vertices `u`, `v` there is
exactly one `k` with `u ∈ X k` and `v ∈ Y k`, or `v ∈ X k` and `u ∈ Y k`. The `k`-th complete
bipartite graph has the edges between `X k` and `Y k`; the condition says that these edge sets
partition the edges of the complete graph on `V`. A biclique with an empty side has no edges and
is allowed.

**Checks.**
- The stars: for `V = {0, …, n − 1}`, `X k = {k}` and `Y k = {k + 1, …, n − 1}` for `k < n − 1`
  form a decomposition with `n − 1` bicliques.
- Exactly one is not at least one. For `n = 4` the two bicliques with sides `{0, 1}`, `{2, 3}` and
  `{0, 2}`, `{1, 3}` cover every edge, but the edges `{0, 3}` and `{1, 2}` twice, so they are not
  a decomposition.

### 4.2 The Graham–Pollak theorem

Prove `card_le_of_isBicliqueDecomposition`: if the complete graph on a finite set `V` of `n`
vertices is decomposed into `m` complete bipartite graphs, then `n ≤ m + 1` (Matoušek,
Miniature 8, Theorem, p. 24, due to Graham and Pollak, with the proof of Tverberg). By the stars
of 4.1 the bound is attained for every `n ≥ 1`.

Route: let `A` be the sum over `k` of the `V × V` real matrices with entry `1` at `(u, v)` when
`u ∈ X k` and `v ∈ Y k`. Each is a column vector times a row vector, so `A` is a product of a
`V × Fin m` and a `Fin m × V` matrix and has rank at most `m`. The decomposition gives
`A + Aᵀ = J − I`, with `J` the all-ones matrix. If the rank of `A` were at most `n − 2`, some
nonzero `x` would satisfy `Ax = 0` and `∑ xᵢ = 0`; then `xᵀ(A + Aᵀ)x = 0`, while
`xᵀ(J − I)x = −∑ xᵢ² < 0`.

**Checks.**
- For `n = 1` the empty decomposition, `m = 0`, satisfies the bound with equality; for `n = 0`
  the bound holds for every `m`.
- For `n = 3` a complete bipartite graph inside the triangle has at most two of its three edges,
  since it has no odd cycle, so two bicliques are needed, and `n − 1 = 2`.
- The bound concerns partitions: as the second Check of 4.1 shows, two bicliques cover the
  complete graph on four vertices, one fewer than `n − 1 = 3`.

*Needs:* 4.1; Mathlib `Matrix.rank_mul_le_left`, `Matrix.rank_le_card_width`,
`LinearMap.finrank_range_add_finrank_ker`. (Proved here.)

### Examples

The stars, which attain the bound, and the double cover of the complete graph on four vertices by
two bicliques.

### Dependencies

Mathlib `Matrix.rank_mul_le_left`, `Matrix.rank_le_card_width`,
`LinearMap.finrank_range_add_finrank_ker`. No other layer.

## Layer 5: set pairs

### 5.1 Bollobás's inequality

Prove `sum_inv_choose_le_one`: let `A i` and `B i`, for `i < m`, be finite sets such that `A i`
and `B i` are disjoint for every `i` and `A i` meets `B j` whenever `i ≠ j`. Then
`∑ i, 1 / C(#(A i) + #(B i), #(A i)) ≤ 1` (O'Neill and Verstraëte, Theorem 1, p. 1, there written
with `|Aᵢ ∪ Bᵢ|`, which is `|Aᵢ| + |Bᵢ|` since the two sets are disjoint; due to Bollobás). When
all `A i` have `a` elements and all `B i` have `b` elements this gives `m ≤ C(a + b, a)`.

Route: let `U` be the union of all the sets, with `N` elements. For each `i`, the orderings of
`U` in which every element of `A i` comes before every element of `B i` number
`N! / C(#(A i) + #(B i), #(A i))`. No ordering has this property for two indices `i ≠ j`: an
element `x` of `A i ∩ B j` and an element `y` of `A j ∩ B i` are distinct, since `A i` and `B i`
are disjoint, and `x` would have to come both before and after `y`. Summing over `i` gives at
most `N!`.

**Checks.**
- The bound is attained: the `C(a + b, a)` ways of splitting a set of `a + b` elements into an
  `a`-element set `A i` and its complement `B i` satisfy the hypotheses, and the sum is `1`.
- Taking `B i` to be the complement of `A i` in a ground set of `n` elements turns the hypotheses
  into the condition that no `A i` contains another, and the inequality into the
  Lubell–Yamamoto–Meshalkin inequality.
- The condition for `i ≠ j` cannot be weakened to `i < j` in the weighted inequality: the pairs
  `({x}, ∅)` and `(∅, {x})` satisfy it for `i < j`, and the sum is `1 + 1 = 2`.

*Needs:* Mathlib `Fintype.card_perm`, `Finset.card_biUnion`. (Proved here.)

### 5.2 The skew set-pairs theorem

Prove `le_choose_of_skew`: let `A i` and `B i`, for `i < m`, be finite sets with at most `k` and
at most `l` elements, such that `A i` and `B i` are disjoint for every `i` and `A i` meets `B j`
whenever `i < j`. Then `m ≤ C(k + l, k)` (Matoušek, Miniature 33, Theorem, p. 169, for sets of
exactly `k` and `l` elements; the theorem is due to Frankl, and Lovász's exterior-algebra
argument for subspaces implies it). The form with at most `k` and `l` elements follows by
embedding the ground type into a larger one and adding to each `A i` and each `B i` new elements
used nowhere else, which keeps both conditions and does not change `m`.

Route (Matoušek, Miniature 33, pp. 169–175): choose vectors `v(x)` in `ℝ^(k+l)`, one for each
element `x` of the union, any `k + l` of which are linearly independent, for instance on the
moment curve. For a set `S` let `w(S)` be the exterior product of the `v(x)`, `x ∈ S`, in a fixed
order. For `#A = k` and `#B = l`, the product `w(A) ∧ w(B)` is nonzero if `A` and `B` are disjoint
and zero otherwise. If `∑ cᵢ w(A i) = 0`, multiplying by `w(B j)` for `j = m, m − 1, …` in turn
shows that every `cⱼ` vanishes, so the `w(A i)` are linearly independent in the `k`-th exterior
power, of dimension `C(k + l, k)`.

**Checks.**
- For `k = l = 1` the pairs `({1}, {2})` and `({2}, {1})` satisfy the hypotheses, and
  `m = 2 = C(2, 1)`.
- The bound is attained by the splittings of a set of `k + l` elements, as in 5.1, in any order.
- For `k = 0` every `A i` is empty and cannot meet `B j`, so `m ≤ 1 = C(l, 0)`.

*Needs:* Mathlib `ExteriorAlgebra.ιMulti`, `exteriorPower.finrank_eq`, `Matrix.det_vandermonde`,
`linearIndependent_iff'`, `LinearIndependent.fintype_card_le_finrank`. (Proved here.)

### Examples

The splittings of a set of `a + b` elements, extremal for both sections, and the two pairs on
one element that separate the symmetric from the skew condition.

### Dependencies

Mathlib `Fintype.card_perm`, `Finset.card_biUnion`, `ExteriorAlgebra.ιMulti`,
`exteriorPower.finrank_eq`, `Matrix.det_vandermonde`, `linearIndependent_iff'`,
`LinearIndependent.fintype_card_le_finrank`. No other layer.

## Layer 6: sunflowers

### 6.1 Sunflowers

For a family `S : Finset (Finset β)`, define `IsSunflower S`: there is a set `Y`, the kernel,
with `A ∩ B = Y` for any two distinct members `A`, `B` of `S`. The kernel may be empty. A family
with at most one member is a sunflower.

**Checks.**
- Three pairwise disjoint sets form a sunflower with empty kernel.
- The sets `{1, 2}`, `{1, 3}`, `{2, 3}` do not: the pairwise intersections `{1}`, `{2}`, `{3}`
  differ.

### 6.2 The sunflower lemma

Prove `exists_isSunflower_of_lt_card`: a family of more than `k! (p − 1)^k` finite sets, each with
at most `k` elements, contains a sunflower with exactly `p` members (Alweiss, Lovett, Wu and
Zhang, Lemma 1.2, p. 2, due to Erdős and Rado). The source states the lemma for `p ≥ 3` with
`|F| ≥ k! (p − 1)^k`; the strict inequality stated here is needed, as the first Check shows, and
the cases `p ≤ 2` hold trivially.

Route: induction on `k`. For `k = 0` the family has at most one member. Otherwise take a maximal
subfamily of pairwise disjoint members; if it has at least `p` members, `p` of them form a
sunflower with empty kernel. If not, let `U` be its union. By maximality every nonempty member
of the family meets `U`. If the empty set is not a member, `U` has at most `(p − 1) k` elements;
if it is, it lies in the subfamily, which then has at most `p − 2` nonempty members, so `U` has
at most `(p − 2) k` elements and at most one member misses `U`. In both cases, for `p ≥ 3`, the
pigeonhole principle gives an element `x` of `U` lying in more than
`(k − 1)! (p − 1)^(k − 1)` members. Removing `x` from them gives a family of sets with at most
`k − 1` elements, which by induction contains a sunflower with `p` members; adding `x` back keeps it a
sunflower.

**Checks.**
- The strict inequality is needed: for `k = 1` and `p = 3`, the family `{1}`, `{2}` has
  `2 = 1! · 2` members and no three members at all.
- The bound is attained for `k = 1`: distinct sets with at most one element are pairwise
  disjoint, so any `p` of them form a sunflower, while `p − 1 = 1! (p − 1)` one-element sets
  contain no `p` members at all.
- Taking one element from each of `k` disjoint blocks of `p − 1` elements gives `(p − 1)^k` sets
  without a sunflower with `p` members; for `k = 2` and `p = 3` these are four sets, below the
  bound `2! · 2² = 8`.

*Needs:* 6.1; Mathlib `Finset.exists_lt_card_fiber_of_mul_lt_card_of_maps_to`. (Proved here.)

### Examples

The transversals of disjoint blocks, which have no sunflower with `p` members, and the
two-member family that shows the strict inequality.

### Dependencies

Mathlib `Finset.exists_lt_card_fiber_of_mul_lt_card_of_maps_to`. No other layer.

## Scope and ownership

This roadmap owns the theorems stated above: oddtown modulo a prime, eventown and the nonuniform
Fisher inequality; the nonuniform and modular Frankl–Wilson inequalities, the theorem of Alon,
Babai and Suzuki with the Ray-Chaudhuri–Wilson theorem as a case, and the forbidden-intersection
bound; Blokhuis's bound for two-distance sets; biclique decompositions and the Graham–Pollak
theorem; Bollobás's inequality and the skew set-pairs theorem; sunflowers and the sunflower lemma.

Already in the library and therefore not targets:

- The notion of an `L`-intersecting family (`Set.IsIntersectingOf` in
  `Mathlib/Combinatorics/SetFamily/Intersecting.lean`), with its monotonicity in `L` and in the
  family; intersecting families and their bound by half the Boolean algebra
  (`Set.Intersecting.card_le` in the same file).
- The case `t = 1` of Fisher-type bounds for finite incidence structures:
  `Configuration.HasPoints.card_le` in `Mathlib/Combinatorics/Configuration.lean` gives
  `#lines ≤ #points` for a nondegenerate configuration (no point on every line, no line through
  every point) in which any two lines meet in exactly one point. Section 1.3 differs: any common
  intersection size `t`, and only nonempty members.
- The Lubell–Yamamoto–Meshalkin inequality
  (`Finset.lubell_yamamoto_meshalkin_inequality_sum_inv_choose` in
  `Mathlib/Combinatorics/SetFamily/LYM.lean`), which the second Check of 5.1 recovers as a special
  case, and the Erdős–Ko–Rado theorem (`Finset.erdos_ko_rado` in
  `Mathlib/Combinatorics/SetFamily/KruskalKatona.lean`). Neither is restated.

Not treated here: the uniform modular Frankl–Wilson theorem with the bound `C(n, s)` and the
modular theorem of Alon, Babai and Suzuki for several residues of sizes, whose hypotheses go
beyond those of 2.3; the q-analogues for subspaces of a vector space over a finite field;
Bollobás-type theorems for subspaces; the uniqueness of extremal configurations; the improved
sunflower bounds; equiangular lines and spherical codes; codes and their bounds, including the
linear programming bound. The explicit graphs of Frankl and Wilson without large cliques or
independent sets, which come from the modular inequality, and the counterexample of Kahn and
Kalai to Borsuk's conjecture, which uses 2.4, are applications that are not stated here; Ramsey
numbers are not defined here.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Combinatorics/SetFamily/Intersecting.lean`: `Set.IsIntersectingOf L 𝒜` (for
  `L : Set ℕ` and `𝒜 : Set (Finset α)` with `[DecidableEq α]`, the size of the intersection of any
  two distinct members of `𝒜` lies in `L`).
- `Mathlib/LinearAlgebra/Dimension/Finite.lean`: `LinearIndependent.fintype_card_le_finrank` (a
  linearly independent family indexed by a finite type in a finite module over a ring with the
  strong rank condition has at most `finrank` members).
  `Mathlib/LinearAlgebra/Dimension/Constructions.lean`: `finrank_span_le_card` (the span of a
  finite set has `finrank` at most its number of elements) and
  `Module.finrank_fintype_fun_eq_card` (`finrank R (η → R) = Fintype.card η`).
  `Mathlib/LinearAlgebra/LinearIndependent/Defs.lean`: `linearIndependent_iff'` (linear
  independence as the vanishing of the coefficients of every finite vanishing combination).
  `Mathlib/LinearAlgebra/FiniteDimensional/Lemmas.lean`:
  `LinearMap.finrank_range_add_finrank_ker` (rank–nullity).
- `Mathlib/LinearAlgebra/Matrix/Rank.lean`: `Matrix.rank_mul_le_left` (`(A * B).rank ≤ A.rank`),
  `Matrix.rank_le_card_width` (the rank is at most the number of columns), `Matrix.rank_of_isUnit`
  (an invertible square matrix has full rank), `Matrix.rank_diagonal` (over a field, the rank of
  a diagonal matrix is the number of nonzero diagonal entries).
- `Mathlib/LinearAlgebra/Matrix/PosDef.lean`: `Matrix.PosDef`; `Matrix.PosDef.add_posSemidef` (a
  positive definite plus a positive semidefinite matrix is positive definite);
  `Matrix.posSemidef_vecMulVec_self_star` (the matrix `vecMulVec v (star v)`, which over the reals
  is `v vᵀ`, is positive semidefinite); `Matrix.PosDef.isUnit` (a positive definite matrix over a
  field is invertible).
- `Mathlib/LinearAlgebra/Matrix/BilinearForm.lean`: `Matrix.toBilin'` (the bilinear form of a
  square matrix; the identity matrix gives the dot product).
  `Mathlib/LinearAlgebra/BilinearForm/Orthogonal.lean`: `LinearMap.BilinForm.orthogonal`;
  `LinearMap.BilinForm.finrank_orthogonal` (for a nondegenerate form on a finite-dimensional
  space over a field, the orthogonal complement of `W` has dimension `finrank V − finrank W`).
  `Mathlib/FieldTheory/Finiteness.lean`: `Module.card_eq_pow_finrank` (a finite vector space over
  a finite field `K` has `#K ^ finrank` elements).
- `Mathlib/Data/ZMod/Defs.lean`: `ZMod`, a field when `p` is prime (`Fact p.Prime`).
- `Mathlib/Data/Finset/Powerset.lean`: `Finset.card_powersetCard` (a set of `n` elements has
  `C(n, k)` subsets of `k` elements).
- `Mathlib/Analysis/InnerProductSpace/PiL2.lean`: `EuclideanSpace.dist_eq` (the Euclidean
  distance is the square root of the sum of the squared coordinate differences).
- `Mathlib/Data/Fintype/Perm.lean`: `Fintype.card_perm` (a finite type of `N` elements has `N!`
  permutations). `Mathlib/Algebra/BigOperators/Group/Finset/Basic.lean`: `Finset.card_biUnion`
  (the size of a union of pairwise disjoint finite sets is the sum of their sizes).
- `Mathlib/LinearAlgebra/ExteriorAlgebra/Basic.lean`: `ExteriorAlgebra.ιMulti` (the exterior
  product of `n` vectors). `Mathlib/LinearAlgebra/ExteriorPower/Basis.lean`:
  `exteriorPower.finrank_eq` (the `n`-th exterior power of a finite free module of rank `r` has
  `finrank` equal to `C(r, n)`). `Mathlib/LinearAlgebra/Vandermonde.lean`:
  `Matrix.det_vandermonde` (the Vandermonde determinant is the product of the differences of the
  nodes, so distinct nodes give linearly independent points of the moment curve).
- `Mathlib/Combinatorics/Pigeonhole.lean`:
  `Finset.exists_lt_card_fiber_of_mul_lt_card_of_maps_to` (if a map sends `s` into `t` and
  `#t * n < #s`, some fiber has more than `n` elements).

## References

- Noga Alon, László Babai and Hiroshi Suzuki, *Multilinear polynomials and Frankl–Ray-Chaudhuri–
  Wilson type intersection theorems*, J. Combin. Theory Ser. A 58 (1991), 165–180; the page
  numbers above are those of the authors' preprint version, whose pages are numbered from its
  abstract page `0`.
- Ryan Alweiss, Shachar Lovett, Kewen Wu and Jiapeng Zhang, *Improved bounds for the sunflower
  lemma*, arXiv:1908.08483, version 3 of August 2021.
- Jiří Matoušek, *Thirty-three Miniatures: Mathematical and Algorithmic Applications of Linear
  Algebra*, Student Mathematical Library 53, American Mathematical Society, 2010; the author's
  preliminary version made available with the publisher's permission, with its page numbers.
- Jason O'Neill and Jacques Verstraëte, *Bollobás-type inequalities on set k-tuples*,
  arXiv:1812.00537, version 1 of December 2018.
- Benny Sudakov and Pedro Vieira, *Two remarks on even and oddtown problems*, arXiv:1610.07907,
  version 1 of October 2016.
- Attributions made in prose without a locator, as the sources above give them: R. A. Fisher
  (1940), K. N. Majumdar (1953) and J. R. Isbell (1959) for 1.3; E. R. Berlekamp (1969) and
  J. E. Graver (1975) for 1.1 and 1.2; D. K. Ray-Chaudhuri and R. M. Wilson (1975) and P. Frankl
  and R. M. Wilson (1981) for Layer 2; D. G. Larman, C. A. Rogers and J. J. Seidel (1977) and
  A. Blokhuis (1984) for 3.1; R. L. Graham and H. O. Pollak (1971) and H. Tverberg (1982) for 4.2;
  B. Bollobás (1965), L. Lovász (1977) and P. Frankl (1982) for Layer 5; P. Erdős and R. Rado
  (1960) for 6.2. The monograph of L. Babai and P. Frankl, *Linear Algebra Methods in
  Combinatorics*, is the standard reference for the subject; no locator into it is given.

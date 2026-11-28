# Roadmap: nonintersecting paths and the Lindström–Gessel–Viennot lemma

**Summary.** Take a directed graph, possibly with multiple arrows, whose arrows carry weights in
a commutative ring, and pick sources `a₁, …, aₙ` and sinks `b₁, …, bₙ`. The weight of a path is
the product of the weights of its arrows; a path of length zero has weight `1`. Let `M` be the
`n × n` matrix whose `(i, j)` entry is the total weight of the paths from `aᵢ` to `bⱼ`. A family
of `n` paths is vertex-disjoint when no two of its paths share a vertex, endpoints included. This
roadmap proves the Lindström–Gessel–Viennot lemma and three classical families of determinant
evaluations that follow from it.

The main results are these.

- *The lemma.* If there are only finitely many paths from each `aᵢ` to each `bⱼ` (for instance
  when the graph has finitely many vertices and arrows and no directed cycle), then
  `det M = ∑_σ sign(σ) W_σ`, where `W_σ` is the total weight of the vertex-disjoint families whose
  path from `a_{σ(i)}` ends at `bᵢ` for each `i`. The case `n = 0` is `1 = 1`.
- *Binomial determinants.* The matrix `(C(i, j))` of binomial coefficients, rows and columns
  indexed by the natural numbers, is totally nonnegative. For strictly increasing `a₁ < ⋯ < aₙ`
  and `b₁ < ⋯ < bₙ`, the minor `det (C(aᵢ, bⱼ))` is positive exactly when `bᵢ ≤ aᵢ` for every `i`.
- *Catalan determinants.* For natural numbers `α₀, …, α_{n−1}`, the determinant of the Catalan
  numbers `C_{αᵢ+j}` is an explicit product (Gessel and Viennot); in particular the Hankel
  determinants `det (C_{i+j})`, `det (C_{i+j+1})` and `det (C_{i+j+2})` of size `n` are `1`, `1`
  and `n + 1`.
- *Flagged skew tableaux.* The number of semistandard tableaux of a skew shape with at most `n`
  rows whose entries in row `i` lie between `bᵢ` and `aᵢ`, for weakly increasing `a`, `b` with
  `bᵢ ≤ aᵢ`, is a determinant of lattice-path counts.

The roadmap builds on Mathlib's path weights and vertex lists of quiver paths, its determinant
expansion and its totally nonnegative matrices; on the skew semistandard tableaux of Tau Ceti; and
on the Hankel determinant of the roadmap SpecialFunctionsOrthogonalPolynomialsGeneral, whose
definition is copied for the Catalan statements. MacMahon's formula for plane partitions in a box
appears only as an example, because Tau Ceti's hook-content formula already counts the tableaux it
amounts to.

Layer 1 defines the path matrix and the vertex-disjoint path systems and proves the lemma with a
sign-reversing involution. Layer 2 proves a crossing property of lattice paths in the plane and
uses it, with the lemma, for binomial determinants. Layer 3 evaluates the Catalan determinants.
Layer 4 counts flagged skew tableaux.

## Conventions

- **Graphs.** A directed graph is a Mathlib quiver `[Quiver V]` on any vertex type `V`; parallel
  arrows and loops are allowed. A path from `x` to `y` is `Quiver.Path x y`, a sequence of arrows;
  `Quiver.Path.nil` is the path of length zero from `x` to `x`. Its vertex list
  `Quiver.Path.vertices` lists every vertex it visits, both endpoints included, so the vertex
  list of `nil` at `x` is `[x]`.
- **Weights.** Arrow weights are `w : ∀ {x y : V}, (x ⟶ y) → R` with `R` a commutative ring, and
  the weight of a path is Mathlib's `Quiver.Path.weight w`, the product of its arrow weights
  (`1` for `nil`).
- **Finiteness.** The total weight of a set of paths is a `finsum`; it is the honest sum when
  only finitely many paths have nonzero weight and `0` otherwise. The statements below assume
  finiteness of the path sets where they use such sums. A quiver is acyclic in the sense of Tau
  Ceti's `TauCeti.Quiver.IsAcyclic` (every closed path is `nil`); a finite acyclic quiver with
  finitely many arrows between any two vertices has finitely many paths
  (`TauCeti.finite_paths_of_isAcyclic`).
- **Types of families.** Sources and sinks are maps `a b : Fin n → V`, repetitions allowed. A
  family of type `σ`, for a permutation `σ` of `Fin n`, has its `i`-th path from `a (σ i)` to
  `b i`, matching Mathlib's expansion `det M = ∑_σ sign σ • ∏ᵢ M (σ i) i` (`Matrix.det_apply`).
- **Lattice paths.** In the plane `ℤ × ℤ` a lattice path takes unit steps east `(1, 0)` and north
  `(0, 1)`. The number of lattice paths from `(x, y)` to `(x + h, y + v)` is the binomial
  coefficient `C(h + v, h)` when `h ≥ 0` and `v ≥ 0`, and `0` otherwise; `latticePathCount h v`
  records exactly this, for integers `h`, `v`.
- **Binomials and Catalan numbers.** `C(m, k)` is `Nat.choose m k`, which is `0` for `k > m`.
  `C_m` is Mathlib's `catalan m = C(2m, m)/(m + 1)`.
- **Tableaux.** Young diagrams are Mathlib's `YoungDiagram`; rows and columns are numbered from
  `0`, and `μ.rowLen i` is the length of row `i` (`0` past the last row). A semistandard tableau of
  skew shape `outer / inner` is Tau Ceti's `TauCeti.SkewSemistandardYoungTableau inner outer`:
  natural-number entries on the cells of `outer` not in `inner`, weakly increasing along rows and
  strictly increasing down columns, zero elsewhere; there is none unless `inner ≤ outer`.

## Layer 1: the lemma

### 1.1 The path matrix and vertex-disjoint systems

Define, for sources and sinks `a b : Fin n → V` and weights `w`:

- `pathMatrix w a b`, the matrix whose `(i, j)` entry is `∑ᶠ p : Path (a i) (b j), p.weight w`;
- `IsVertexDisjoint P`, for a family `P : ∀ i, Path (a i) (b i)`: for `i ≠ j` the vertex lists of
  `P i` and `P j` are disjoint;
- `disjointWeight w a b`, the total weight `∑ᶠ` over the vertex-disjoint families
  `P : ∀ i, Path (a i) (b i)` of `∏ᵢ (P i).weight w`. The families of type `σ` are the families
  for the sources `a ∘ σ`, so their total weight is `disjointWeight w (a ∘ σ) b`.

API:

- If `a i = b i` for some `i`, then `nil` is a path from `a i` to `b i`, of weight `1`, and it is
  disjoint from another path exactly when that path avoids `a i`.
- Repeating a source (`a i = a j`, `i ≠ j`) or a sink makes every family intersect, so the
  corresponding `disjointWeight` vanishes; the path matrix then has two equal rows or columns.

**Checks.**
- `n = 0`: the path matrix is the empty matrix, of determinant `1`; the only family is the empty
  one, vertex-disjoint, of weight `1`, so `disjointWeight w a b = 1`.
- Disjointness counts endpoints: in the quiver `y → x → z` with weights `1`, sources `(x, y)`
  and sinks `(x, z)`, the identity family `(nil at x, y → x → z)` is not vertex-disjoint, because
  both paths contain `x`. The path matrix is `[[1, 1], [1, 1]]`, of determinant `0`; no family of
  either type is vertex-disjoint.
- On an acyclic quiver with finitely many vertices and finitely many arrows between any two
  vertices every `∑ᶠ` above is a finite sum, by `TauCeti.finite_paths_of_isAcyclic`.

*Needs:* Mathlib `Quiver.Path`, `Quiver.Path.weight`, `Quiver.Path.vertices`, `List.Disjoint`,
`finsum`, `Matrix.of`.

### 1.2 The Lindström–Gessel–Viennot lemma

Prove `det_pathMatrix`: if the set of paths from `a i` to `b j` is finite for all `i`, `j`, then

    det (pathMatrix w a b) = ∑_σ sign σ • disjointWeight w (a ∘ σ) b.

(B. Lindström 1973 and I. M. Gessel and X. Viennot 1985, attributed in prose. Krattenthaler,
*Lattice path enumeration*, Theorem 10.13.1, p. 50, for a directed acyclic graph, proof
pp. 50–51; Stanley, EC1, Theorem 2.7.1, p. 247 of the author's copy, for weighted lattice paths,
with an involution of the same kind as the one used here. The hypothesis here is finiteness of
the path sets between the chosen vertices. It holds on acyclic quivers with finitely many vertices
and arrows, and it also allows directed cycles that lie on no path from a source to a sink; it is
not implied by acyclicity alone, and the source's generating functions may be infinite formal
sums. The route below proves the lemma under it. Proved here.)

Route.

1. *Paths are simple.* If a path from `a i` to `b j` visits a vertex twice, it contains a closed
   path of positive length, and repeating that closed path gives infinitely many paths from
   `a i` to `b j`. So under the hypothesis every path from a source to a sink visits each vertex
   at most once (`Quiver.Path.exists_eq_comp_of_mem_vertices`, `Quiver.Path.vertices_comp`).
2. *Expansion.* By `Matrix.det_apply`, the finiteness of the path sets and
   `Finset.prod_univ_sum`, `det M` is the sum over pairs `(σ, P)`, with `P` a family of type `σ`,
   of `sign σ` times the weight of `P`. Index each family by its sources: the path leaving `a k`
   is the one ending at `b (σ⁻¹ k)`, and `sign σ⁻¹ = sign σ`.
3. *The involution.* For an intersecting family, let `i` be the least index whose path `Pᵢ` meets
   another path; let `v` be the first vertex of `Pᵢ`, along `Pᵢ`, that lies on another path; and
   let `j` be the least index `j ≠ i` with `v` on `Pⱼ`. Exchange the parts of `Pᵢ` and `Pⱼ` after
   `v`. The new paths end at each other's sinks, so the type changes by a transposition and the
   sign changes; the multiset of arrows is unchanged, so the weight is unchanged
   (`Quiver.Path.weight_comp`). The new paths again run from sources to sinks, hence are simple
   by step 1.
4. *It is an involution.* The paths of index below `i` were disjoint from all others and the
   exchange keeps the union of the vertex sets of `Pᵢ` and `Pⱼ`, so `i` is again the least index
   meeting another path. The part of the new `Pᵢ` before `v` is the old one; none of its vertices
   lay on another old path, and none lies on the new `Pⱼ`: not on the old `Pⱼ` before `v`, and
   not on the old `Pᵢ` after `v`, because the old `Pᵢ` is simple. So `v` is again the first
   vertex of the new `Pᵢ` on another path, and `j` is again the least index through `v`. The
   exchange at `(i, v, j)` therefore undoes itself.
5. The intersecting families cancel in pairs (`Finset.sum_involution`), leaving the
   vertex-disjoint ones.

In particular, if for every `σ ≠ 1` no vertex-disjoint family of type `σ` exists, then
`det (pathMatrix w a b) = disjointWeight w a b`; with all weights `1` over `ℤ` this is the number
of vertex-disjoint families of type `1`. This is the form used in Layers 2 and 4.

**Checks.**
- The choice of the intersecting pair matters. The proof in Krattenthaler's survey (p. 51)
  chooses, "among all pairs of paths with a common point", "the lexicographically largest", and
  "among all common points of that pair" "the last along the paths", and interchanges "the
  initial portions" of the two paths up to that point. As printed, this map is not an involution
  on the following example (the theorem itself is not affected): with arrows `s₀ → u → m → t₀`,
  `s₁ → u → t₁`, `s₂ → m → t₂`, sources `(s₀, s₁, s₂)` and sinks `(t₀, t₁, t₂)`, the pairs of the
  identity family with a common point are `(0, 1)` and `(0, 2)`; the largest is `(0, 2)`, with
  last common point `m`, and the exchange gives `(s₂ → m → t₀, s₁ → u → t₁, s₀ → u → m → t₂)`.
  There the pairs `(0, 2)` and `(1, 2)` meet, the largest is `(1, 2)`, with last common point
  `u`, and the map gives `(s₂ → m → t₀, s₀ → u → t₁, s₁ → u → m → t₂)`, not the identity family.
  The rule of step 3 sends the identity family to `(s₀ → u → t₁, s₁ → u → m → t₀, s₂ → m → t₂)`
  and back.
- The finiteness hypothesis is needed. In the quiver with arrows `0 → 1` and `1 → 0`, weights
  `1`, sources and sinks `(0, 1)`, every path set is infinite and every entry of the path matrix
  is the junk value `0`, so the left side is `0`. The only vertex-disjoint family of the identity
  type is `(nil, nil)`, and the families of the other type always meet, so the right side is
  `1`. With weights `t` in `ℤ[t]/(t³)` all sums are finite, the left side is `1 + t²` and the
  right side is `1`: the lemma fails for walks around a cycle.
- Directed cycles that lie on no path from a source to a sink are harmless: the identity was
  checked exactly on 300 random digraphs with such cycles, integer weights and finite path sets.

*Needs:* 1.1; Mathlib `Matrix.det_apply`, `Finset.prod_univ_sum`, `Finset.sum_involution`,
`Equiv.Perm.sign_swap`, `Equiv.Perm.sign_inv`, `Quiver.Path.weight_comp`,
`Quiver.Path.vertices_comp`, `Quiver.Path.exists_eq_comp_of_mem_vertices`,
`finsum_mem_eq_finite_toFinset_sum`.

### Examples

- *Cauchy–Binet.* Take three levels: sources `a₁, …, aₙ`, middle vertices `m₁, …, m_N` and sinks
  `b₁, …, bₙ`, with an arrow `aᵢ → m_k` of weight `x i k` and an arrow `m_k → bⱼ` of weight
  `y j k`. The path matrix is `X Yᵀ`, and a vertex-disjoint family of type `σ` is a choice of `n`
  distinct middle vertices; the lemma gives `det (X Yᵀ) = ∑_s det X_s det Y_s` over `n`-subsets
  `s`, Tau Ceti's Cauchy–Binet formula `TauCeti.det_mul_transpose_eq_sum_plucker_mul`.
- With `n = 1` the lemma says `det` of a `1 × 1` matrix is its entry.

### Dependencies

1.1 uses Mathlib. 1.2 uses 1.1 and Mathlib.

## Layer 2: lattice paths and binomial determinants

*The crossing step* (used in the routes of 2.1, 2.2 and 4.1). Let `P` and `Q` be lattice paths.
The level of a point `(x, y)` is `x + y`; each step raises it by one, so a lattice path visits
each level between its first and last exactly once. Suppose the level ranges of `P` and `Q`
overlap, `P` starts weakly south-east of `Q` (`x ≥`, `y ≤`) and ends weakly north-west of `Q`
(`x ≤`, `y ≥`). On the common levels let `d(t)` be the `x`-coordinate of `P` minus that of `Q`;
on one level, a larger `x` means a smaller `y`. At the first common level `d ≥ 0`: if `P` starts
there, `Q` has only moved north and east from its start, so its `y` is at least that of `P`'s
start; if `Q` starts there, `P` has only moved north and east, so its `x` is at least that of
`Q`'s start. At the last common level `d ≤ 0` by the same argument read backwards, and `d`
changes by `−1`, `0` or `1` from one level to the next. So `d(t) = 0` at some level `t`, where `P`
and `Q` share a vertex.

### 2.1 The Pascal matrix is totally nonnegative

Prove `isTotallyNonneg_choose`: the matrix `(C(i, j))_{i, j ∈ ℕ}` over `ℤ` is totally nonnegative
in the sense of Mathlib's `Matrix.IsTotallyNonneg`: every minor with strictly increasing rows
`a₁ < ⋯ < aₖ` and strictly increasing columns `b₁ < ⋯ < bₖ` has nonnegative determinant.
(Lindström 1973 and Gessel–Viennot 1985, attributed in prose. Proved here.)

Route. In the finite grid `{0, …, B} × {−A, …, 0}` with east and north arrows, `B` the largest `bⱼ`
and `A` the largest of all `aᵢ` and `bⱼ`, take sources `(0, −aᵢ)` and sinks `(bⱼ, −bⱼ)`. A path from
`(0, −a)` to `(b, −b)` has `b` east and `a − b` north steps, so there are `C(a, b)` of them (none
when `b > a`); the grid is acyclic and finite, so 1.2 applies. All sinks are on level `0`. For
`i < k` and `j < l`, a path `P` from `(0, −aᵢ)` to `(b_l, −b_l)` and a path `Q` from `(0, −aₖ)` to
`(bⱼ, −bⱼ)` satisfy the crossing step with the roles of `P` and `Q` exchanged (the sources lie on
one column, the sinks on one level), so they meet. A family of type `σ ≠ 1` has an inversion `i < k`
with `σ i > σ k`, so it is never vertex-disjoint. By 1.2 the minor is the number of vertex-disjoint
families of type `1`, which is `≥ 0`.

**Checks.**
- Rows `(2, 3)`, columns `(1, 3)`: `det [[2, 0], [3, 1]] = 2`; the two families are the hooks
  `(0, −2) → (1, −2) → (1, −1)` with `(0, −3) → (3, −3)`, and the path through `(0, −1)` instead.
- Strict monotonicity matters: rows `(1, 0)` and columns `(0, 1)` give
  `det [[1, 1], [1, 0]] = −1`.
- Each entry `C(i, j)` is a `1 × 1` minor, so every entry is `≥ 0`
  (`Matrix.IsTotallyNonneg.nonneg`); all 3985 minors of size at most `3` with rows and columns
  below `8` were computed exactly and are `≥ 0`.

*Needs:* 1.2; the crossing step; Mathlib `Matrix.IsTotallyNonneg`, `Nat.choose`.

### 2.2 When a binomial determinant is positive

Prove `det_choose_pos_iff`: for strictly increasing `a b : Fin n → ℕ`,
`0 < det (C(aᵢ, bⱼ))` if and only if `bᵢ ≤ aᵢ` for every `i`. (Gessel–Viennot 1985, attributed in
prose. Proved here.)

Route. By the route of 2.1, the determinant is the number of vertex-disjoint families of type
`1`. If `bᵢ > aᵢ` for some `i`, there is no path at all from `(0, −aᵢ)` to `(bᵢ, −bᵢ)`. If
`bᵢ ≤ aᵢ` for all `i`, the hooks `Hᵢ`, east from `(0, −aᵢ)` to `(bᵢ, −aᵢ)` and then north to
`(bᵢ, −bᵢ)`, are pairwise disjoint: for `i < k`, the horizontal part of `Hₖ` is at height
`−aₖ < −aᵢ`, below all of `Hᵢ`, and its vertical part is at `x = bₖ > bᵢ`, right of all of `Hᵢ`.

**Checks.**
- `n = 0`: the empty determinant is `1 > 0` and the condition is empty.
- Rows `(1, 2)`, columns `(0, 3)`: `b₂ = 3 > 2`, and `det [[1, 0], [1, 0]] = 0`.
- Rows `(1, 2)`, columns `(0, 1)`: `det [[1, 1], [1, 2]] = 1`.
- The equivalence was checked on all 3985 minors of 2.1's Check.

*Needs:* 1.2; the route of 2.1.

### Examples

- `det (C(i + 2, j))_{0 ≤ i, j ≤ 2} = det [[1, 2, 1], [1, 3, 3], [1, 4, 6]] = 1`, one family of
  hooks.

### Dependencies

2.1 and 2.2 use 1.2 and the crossing step.

## Layer 3: Catalan determinants

### 3.1 The Gessel–Viennot Catalan determinant

Prove `det_catalan_add`: for every `n` and every `α : Fin n → ℕ`, over `ℚ`,

    det (C_{αᵢ + j})_{0 ≤ i, j < n}
      = ∏_{i < j} (αⱼ − αᵢ) · ∏ᵢ (i + n)! (2αᵢ)! / ((2i)! αᵢ! (αᵢ + n)!).

(Krattenthaler, *Determinants of (generalised) Catalan numbers*, Theorem 3, p. 4, with proof,
for a positive integer `n` and nonnegative integers `αᵢ`; he attributes it to Gessel and Viennot.
For `n = 0` both sides are `1`. The determinant lemma the proof rests on, Lemma 1, p. 3, is
quoted there without proof; it is proved in the route below.)

Route.

1. *Determinant lemma.* For indeterminates `X₀, …, X_{n−1}`, `A₁, …, A_{n−1}`,
   `B₁, …, B_{n−1}`, let `pⱼ(X) = ∏_{k = j+1}^{n−1} (X + A_k) · ∏_{k=1}^{j} (X + B_k)`. Then
   `det (pⱼ(Xᵢ)) = ∏_{i<j} (Xᵢ − Xⱼ) · ∏_{1 ≤ i ≤ j ≤ n−1} (Bᵢ − Aⱼ)` (Krattenthaler, Lemma 1;
   *Advanced determinant calculus*, Lemma 3, p. 7). Proof: the determinant is a polynomial,
   alternating in the `X`'s and of degree at most `n − 1` in each, so it is the Vandermonde
   product `∏_{i<j} (Xᵢ − Xⱼ)` times a polynomial `c` in the `A`'s and `B`'s
   (`Matrix.det_vandermonde`). Specialize `Xᵢ = −Aᵢ` for `i ≥ 1`: the entries with `j < i`
   vanish, the matrix is upper triangular (`Matrix.det_of_isUpperTriangular`), and comparing the
   diagonal with the Vandermonde product gives `c = ∏_{1 ≤ k ≤ i ≤ n−1} (B_k − Aᵢ)`.
2. *Factoring.* Write `C_m = 4^m (1/2)_m / (m + 1)!`, with `(x)_m = x(x+1)⋯(x+m−1)`. Taking
   `4^{αᵢ} (1/2)_{αᵢ} / (αᵢ + n)!` out of row `i` and `4^j` out of column `j` leaves the entry
   `(αᵢ + 1/2)_j · (αᵢ + j + 2)(αᵢ + j + 3)⋯(αᵢ + n)`, which is `pⱼ(αᵢ)` for `A_k = k + 1` and
   `B_k = k − 1/2`.
3. *Simplification.* Step 1 gives

       det = ∏ᵢ 4^{αᵢ} (1/2)_{αᵢ}/(αᵢ+n)! · ∏ⱼ 4^j
               · ∏_{i<j} (αᵢ − αⱼ) · ∏_{1 ≤ i ≤ j ≤ n−1} (i − j − 3/2),

   which equals the stated product by `(2m)! = 4^m m! (1/2)_m`.

**Checks.**
- `α = (0, 2)`: `det [[C₀, C₁], [C₂, C₃]] = det [[1, 1], [2, 5]] = 3`, and the product is
  `2 · 1 · (3! 4!)/(2! 2! 4!) = 3`.
- Repeated values, `α = (1, 1)`: two equal rows, determinant `0`, and the factor `α₁ − α₀ = 0`.
- The order matters through the sign: `α = (1, 0)` gives `det [[1, 2], [1, 1]] = −1`, and the
  product has the factor `α₁ − α₀ = −1`.
- The identity was checked exactly for all `α ∈ {0, …, 5}ⁿ`, `n ≤ 4` (1555 tuples), and the
  determinant lemma of step 1 at random rational points for `n ≤ 4`.

*Needs:* Mathlib `catalan`, `Matrix.det_vandermonde`, `Matrix.det_of_isUpperTriangular`,
`Matrix.det_mul_row`, `Matrix.det_mul_column`, `Nat.factorial`.

### 3.2 Hankel determinants of the Catalan numbers

Define `hankelDet m n = det (m (i + j))_{i, j < n}` for `m : ℕ → ℝ`, copied verbatim from
SpecialFunctionsOrthogonalPolynomialsGeneral §2.4. Prove `hankelDet_catalan`: for every `n`,
`hankelDet (C_k) n = 1`, `hankelDet (C_{k+1}) n = 1` and `hankelDet (C_{k+2}) n = n + 1`.
(Krattenthaler, *Determinants of (generalised) Catalan numbers*, (1.1)–(1.3), p. 2, and Remark
(a) after Theorem 3, p. 4: they are the cases `αᵢ = i`, `i + 1`, `i + 2` of Theorem 3. Remark (d),
p. 5, mentions lattice-path proofs of these cases, not used here.)

Route. Apply 3.1 with `αᵢ = i + β`, `β = 0, 1, 2`, and cast from `ℚ` to `ℝ`. Write `G_β(n)` for
the product of 3.1, `∏_{i<j<n} (j − i) · ∏_{i<n} (i + n)! (2i + 2β)!/((2i)! (i + β)! (i + β + n)!)`,
and argue by induction on `n`, with `G_β(0) = 1`. Passing from `n` to `n + 1`, the first product
gains `∏_{i<n} (n − i) = n!`, the factor of each row `i < n` is multiplied by
`(i + n + 1)/(i + β + n + 1)`, and the new row `n` contributes
`(2n + 1)! (2n + 2β)!/((2n)! (n + β)! (2n + β + 1)!)`. With `∏_{i<n} (i + n + 1) = (2n)!/n!` and
`∏_{i<n} (i + β + n + 1) = (2n + β)!/(n + β)!` the quotient is

    G_β(n + 1)/G_β(n) = (2n + 1)! (2n + 2β)! / ((2n + β)! (2n + β + 1)!),

which is `1`, `1` and `(2n + 4)/(2n + 2) = (n + 2)/(n + 1)` for `β = 0, 1, 2`.

**Checks.**
- `n = 0`: all three are `hankelDet m 0 = 1`, and `0 + 1 = 1`.
- `n = 3`: `det [[1, 1, 2], [1, 2, 5], [2, 5, 14]] = 1` and `det [[1, 2, 5], [2, 5, 14],
  [5, 14, 42]] = 1`.
- `n = 2`, shift `2`: `det [[2, 5], [5, 14]] = 3`.
- The pattern stops at shift `3`: the values for `n = 1, 2, 3, 4` are `5, 14, 30, 55`.
- All three formulas were checked by exact determinants for `n ≤ 8`, and the products of 3.1 at
  `αᵢ = i + β` for `n ≤ 30`.

*Needs:* 3.1; Mathlib `catalan`, `Nat.cast`.

### Examples

- `det (C_{2i + j})_{0 ≤ i, j < 2} = det [[1, 1], [2, 5]] = 3`, the case `α = (0, 2)` of 3.1.

### Dependencies

3.1 uses Mathlib. 3.2 uses 3.1 and the copied `hankelDet`.

## Layer 4: flagged skew tableaux

### 4.1 Flagged skew tableaux

Define `latticePathCount h v`, for integers `h`, `v`: `C(h + v, h)` if `h ≥ 0` and `v ≥ 0`, else
`0`. Prove `card_flaggedSkewTableaux`: let `inner ≤ outer` be Young diagrams, let `outer` have
at most `n` rows, and let `a b : Fin n → ℕ` be weakly increasing with `bᵢ ≤ aᵢ` for every `i`.
The number of semistandard tableaux of shape `outer / inner` whose entries in row `i` lie in
`[bᵢ, aᵢ]` equals

    det ( latticePathCount (λᵢ − μⱼ − i + j) (aᵢ − bⱼ) )_{i, j < n},

with `λᵢ = outer.rowLen i` and `μⱼ = inner.rowLen j`. (Krattenthaler, *Lattice path enumeration*,
Theorem 10.13.3, p. 53, with the bijection on pp. 52–53, for integer shapes and flags; the
binomial there is read as the number of lattice paths, `0` when a step count is negative.)

Route. Row `i` of a tableau, read as the heights of the east steps, is a lattice path from
`(μᵢ − i, bᵢ)` to `(λᵢ − i, aᵢ)` (Krattenthaler, p. 52), and strict increase down the columns is
exactly vertex-disjointness of consecutive rows. The number of paths from the source of row `j`
to the sink of row `i` is the entry of the matrix. Sources move weakly north-west as `i` grows
(`μᵢ − i` decreases, `bᵢ` increases), and so do sinks. The step the source leaves implicit, that
only type `1` admits vertex-disjoint families, is the crossing step of Layer 2: for `i < k` and
`j < l`, the path from source `i` to sink `l` starts south-east of the path from source `k` to
sink `j` and ends north-west of it. When both paths exist, their level ranges overlap:
`μₖ − k + bₖ < λ_l − l + a_l`, since `μₖ − k < μᵢ − i ≤ λ_l − l` and `bₖ ≤ aⱼ ≤ a_l`, and
`μᵢ − i + bᵢ < λⱼ − j + aⱼ`, since `μᵢ − i ≤ λ_l − l < λⱼ − j` and `bᵢ ≤ bₖ ≤ aⱼ`
(`μᵢ − i ≤ λ_l − l` and `bₖ ≤ aⱼ` hold because the two paths exist; the other steps use `μ`, `λ`
weakly decreasing and `a`, `b` weakly increasing). Monotonicity alone does not suffice: for `n = 3`,
`μ = 0`, `λ = (1, 1, 1)`, `a = b = (0, 0, 5)`, `i = j = 0`, `k = 2`, `l = 1`, the first
inequality reads `3 < 0`, and indeed there is no path from source `2` to sink `0`. Then 1.2 on a
finite grid containing all the paths.

**Checks.**
- Straight shape `(2, 1)`, entries in `[0, 2]`: `det [[6, 10], [1, 3]] = 8`, the number of
  semistandard tableaux of shape `(2, 1)` in three letters.
- Skew shape `(2, 1)/(1)`, entries in `[0, 1]`: two cells in different columns, `4` tableaux, and
  `det [[2, 4], [0, 2]] = 4`.
- `bᵢ ≤ aᵢ` is needed even for an empty row: `outer = (2, 1)`, `inner = (2)`, `a = (1, 4)`,
  `b = (2, 2)` gives `3` tableaux (the single cell of row `1` takes `2, 3, 4`) and determinant `0`.
- Monotone flags are needed: `outer = (3, 3, 0)`, `inner = (2, 1, 0)`, `a = (4, 2, 3)`,
  `b = (0, 0, 1)` gives `8` tableaux and determinant `−5`; `outer = (3, 3)`, `inner = (2)`,
  `a = (3, 3)`, `b = (3, 1)` gives `0` and `−5`.
- Containment is needed: for `inner = (1, 1)`, `outer = (1)`, `n = 1`, `a = b = (0)` there is no
  tableau, while the matrix is `[[latticePathCount 0 0]] = [[1]]`.
- At most `n` rows is needed: with `outer = (1, 1)`, `inner = ∅`, `n = 1`, `a = b = (0)`, the
  second row is unconstrained, the tableaux are infinitely many (`Nat.card` is `0`), and the
  determinant is `1`.
- The guard in `latticePathCount` matters: in the skew Check above the entry with `h = −1`, `v = 1`
  is `0`, while reading it as `C(h + v, h)` with negative values truncated to `0` gives
  `C(0, 0) = 1`.
- The identity was checked by enumeration on 878 instances with at most three rows.

*Needs:* 1.2; the crossing step; Tau Ceti `TauCeti.SkewSemistandardYoungTableau`; Mathlib
`YoungDiagram.rowLen`, `Nat.card`, `Nat.choose`.

### Examples

- *Jacobi–Trudi.* Giving the east step at height `k` the weight `x_k` instead of `1`, the matrix
  of 4.1 for a straight shape with flags `0` and `N − 1` becomes `(h_{λᵢ − i + j}(x₀, …, x_{N−1}))`
  and 1.2 gives Tau Ceti's Jacobi–Trudi identity `TauCeti.diagramSchurPoly_eq_det_hsymmInt`; at
  `x = 1` it is the straight-shape case of 4.1.
- *MacMahon's box formula.* A plane partition in the `a × b × c` box is an array
  `π : Fin a → Fin b → Fin (c + 1)` weakly decreasing along rows and down columns; their number
  is `∏_{i<a} ∏_{j<b} ∏_{k<c} (i + j + k + 2)/(i + j + k + 1)`, MacMahon's
  `∏_{i,j,k ≥ 1} (i + j + k − 1)/(i + j + k − 2)` with indices from `0`. It is not a target here,
  because Tau Ceti already counts the tableaux it amounts to. `T(i, j) = c − π(i, j) + i` is a
  bijection onto `TauCeti.BoundedSSYT (a + c) μ`, the semistandard tableaux of the rectangle `μ`
  with `a` rows of length `b` and entries below `a + c`: rows of `T` increase weakly because those
  of `π` decrease weakly, columns increase strictly because of the `+ i`, and conversely strict
  columns force `i ≤ T(i, j) ≤ c + i`. Tau Ceti's `TauCeti.finrank_weylModuleOfShape` and
  `TauCeti.finrank_weylModuleOfShape_eq_prod_div` (over `ℚ`) give the number of these tableaux
  as the hook-content product `∏_{(i, j)} (a + c + j − i)/(a + b − 1 − i − j)` over the cells of
  `μ`. Reindexing the numerators by `i ↦ a − 1 − i` gives `∏ (c + 1 + i + j)`, reindexing the
  denominators by `i ↦ a − 1 − i`, `j ↦ b − 1 − j` gives `∏ (i + j + 1)`, and on the other side
  `∏_{k<c} (i + j + k + 2)/(i + j + k + 1) = (i + j + c + 1)/(i + j + 1)` by induction on `c`.
  The route through this roadmap: with flags `bᵢ = i` and `aᵢ = c + i`, 4.1 gives the count as
  `det (C(b + c, b − i + j))_{i, j < a}`, the entry being `0` when `b − i + j < 0`, and taking
  factors out of the rows makes it a case of the determinant lemma of step 1 of 3.1
  (Krattenthaler, *Advanced determinant calculus*, p. 8, where this reduction is printed, and
  (2.17), p. 11; the remarks on MacMahon's formula are on p. 31). The zero for a negative lower
  index matters: with natural-number subtraction, `C(b + c, 0) = 1` in those entries, and
  `(a, b, c) = (3, 1, 1)` gives `5` instead of `4`. Values: `(2, 2, 2)` gives `20`, `(3, 3, 3)`
  gives `980`, `(2, 3, 4)` gives `490`, and the `1 × 2 × 1` box holds `(0, 0)`, `(1, 0)` and
  `(1, 1)`, with product `(2/1)(3/2) = 3`.

### Dependencies

4.1 uses 1.2 and the crossing step of Layer 2.

## Scope and ownership

This roadmap owns the path matrix of a weighted quiver, vertex-disjoint path systems and the
Lindström–Gessel–Viennot lemma (1.1–1.2); the total nonnegativity of the Pascal matrix and the
positivity criterion for binomial determinants (2.1–2.2); the Gessel–Viennot Catalan determinant
and the three Catalan Hankel determinants (3.1–3.2); and the flagged skew tableau determinant
(4.1), all stated above.

Consumed rather than restated:

- Mathlib has path weights and vertex lists of quiver paths, the determinant expansion, the
  Vandermonde determinant and totally nonnegative matrices; it states no theorem on
  nonintersecting paths.
- Tau Ceti has acyclic quivers and the finiteness of their path sets, Cauchy–Binet
  (`TauCeti.det_mul_transpose_eq_sum_plucker_mul`), the Jacobi–Trudi identity
  (`TauCeti.diagramSchurPoly_eq_det_hsymmInt`), bounded and skew semistandard tableaux, and the
  hook-content formula for the number of semistandard tableaux of a given shape with bounded
  entries (`TauCeti.finrank_weylModuleOfShape` with `TauCeti.finrank_weylModuleOfShape_eq_prod_div`,
  and through Gelfand–Tsetlin patterns). Cauchy–Binet and Jacobi–Trudi appear above only as
  Examples of the lemma. The count of 4.1 for a straight shape with flags `0` and `N − 1` is Tau
  Ceti's Jacobi–Trudi identity at `x = 1`; 4.1 is the skew, flagged generalisation. MacMahon's box
  formula is, up to a bijection and a reindexing of products, the hook-content formula for a
  rectangle, so it appears only as an Example of Layer 4.
- SpecialFunctionsOrthogonalPolynomialsGeneral §2.4 defines `hankelDet`, copied verbatim here; its
  theorems (positivity for orthogonality measures, `Δₙ = ∏ hₖ`) are not used. Expressing a Hankel
  determinant through the recurrence coefficients of orthogonal polynomials is a different route
  to 3.2, not taken here.
- DimerModelsAndLozengeTilings owns lozenge tilings and Kasteleyn determinants; plane partitions
  in a box appear here only in an Example, through tableaux and paths, not tilings.

Not treated here: the reflection principle and ballot theorems; the enumeration of Dyck paths
and the Narayana numbers (Mathlib and Tau Ceti); nonintersecting paths with free endpoints and
Pfaffians (Okada, Stembridge); the loop-erased form of the lemma for graphs with cycles (Fomin);
total positivity of general planar networks; symmetry classes of plane partitions; `q`-analogues.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Combinatorics/Quiver/Path.lean`: `Quiver.Path`, `Quiver.Path.nil`,
  `Quiver.Path.comp`.
- `Mathlib/Combinatorics/Quiver/Path/Weight.lean`: `Quiver.Path.weight` (`[Monoid R]`, product of
  arrow weights, `1` on `nil`), `Quiver.Path.weight_comp`.
- `Mathlib/Combinatorics/Quiver/Path/Vertices.lean`: `Quiver.Path.vertices` (both endpoints
  included), `Quiver.Path.vertices_comp`, `Quiver.Path.exists_eq_comp_of_mem_vertices`.
- `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean`: `Matrix.det_apply`
  (`det M = ∑ σ, sign σ • ∏ i, M (σ i) i`), `Matrix.det_mul_row`, `Matrix.det_mul_column`;
  `Mathlib/LinearAlgebra/Vandermonde.lean`: `Matrix.det_vandermonde`
  (`det = ∏ i, ∏ j > i, (v j − v i)`); `Mathlib/LinearAlgebra/Matrix/Block.lean`: `Matrix.det_of_isUpperTriangular`.
- `Mathlib/LinearAlgebra/Matrix/Determinant/TotallyNonneg.lean`: `Matrix.IsTotallyNonneg`
  (`[PartialOrder ι] [CommRing R] [PartialOrder R]`; minors with `StrictMono` rows and columns),
  `Matrix.IsTotallyNonneg.nonneg`.
- `Finset.prod_univ_sum`, `Finset.sum_involution`, `Finset.prod_bij`,
  `finsum_mem_eq_finite_toFinset_sum`; `Equiv.Perm.sign_swap`, `Equiv.Perm.sign_inv`;
  `List.Disjoint`.
- `catalan` (`Mathlib/Combinatorics/Enumerative/Catalan/Basic.lean`), `Nat.choose`, `Nat.factorial`;
  `YoungDiagram`, `YoungDiagram.rowLen`, `YoungDiagram.colLen`.

### From Tau Ceti

- `TauCeti/RepresentationTheory/Quiver/Acyclic/Basic.lean`: `TauCeti.Quiver.IsAcyclic` (every
  closed path is `nil`), in the Conventions and a Check of 1.1.
- `TauCeti/RepresentationTheory/Quiver/Acyclic/FinitePaths.lean`:
  `TauCeti.finite_paths_of_isAcyclic` (`[Finite V] [∀ a b, Finite (a ⟶ b)]`, acyclic ⇒ finitely
  many paths), which gives the hypothesis of 1.2 for finite acyclic quivers.
- `TauCeti/LinearAlgebra/ExteriorPower/Plucker.lean`: `TauCeti.det_mul_transpose_eq_sum_plucker_mul`
  (Cauchy–Binet), in an Example of Layer 1.
- `TauCeti/RingTheory/MvPolynomial/Symmetric/Schur/JacobiTrudi.lean`:
  `TauCeti.diagramSchurPoly_eq_det_hsymmInt` (`μ.colLen 0 ≤ r`), in an Example of Layer 4 and the
  scope section.
- `TauCeti/Combinatorics/Young/SkewTableau.lean`: `TauCeti.SkewSemistandardYoungTableau inner
  outer` (entries vanish off the skew cells; carries `inner ≤ outer`), the carrier of 4.1.
- `TauCeti/Combinatorics/Young/Kostka.lean`: `TauCeti.BoundedSSYT n μ` (semistandard tableaux of
  shape `μ` with entries `< n`), in the MacMahon Example of Layer 4.
- `TauCeti/RepresentationTheory/ClassicalGroups/WeylModule/Character.lean`:
  `TauCeti.finrank_weylModuleOfShape` (over a field of characteristic zero, the dimension of the
  Weyl module of `μ` is `Nat.card (TauCeti.BoundedSSYT n μ)`), and
  `TauCeti/RepresentationTheory/ClassicalGroups/WeylModule/Dimension.lean`:
  `TauCeti.finrank_weylModuleOfShape_eq_prod_div` (that dimension, over `ℚ`, is the product over
  the cells of `μ` of `(n + j − i)/hookLength`, with no bound on the rows); together the
  hook-content count of bounded tableaux, in the MacMahon Example. The same count is the chain
  `TauCeti.card_gtPattern_topRow_eq_card_ssyt`, `TauCeti.GTPattern.card_topRow_eq_weylDimension`,
  `TauCeti.weylDimension_weightOfShape_eq_prod_div` (each with `μ.colLen 0 ≤ n` where needed)
  through Gelfand–Tsetlin patterns.
- `TauCeti/Combinatorics/Young/HookLength/Basic.lean`: `YoungDiagram.hookLength`.

### From TauCetiRoadmap.SpecialFunctionsOrthogonalPolynomialsGeneral

- §2.4, the Gram matrix of the moments and Hankel determinants: the definition
  `hankelDet (m : ℕ → ℝ) (n : ℕ) : ℝ := (Matrix.of fun i j : Fin n => m (i.val + j.val)).det`,
  copied verbatim into `Suggested.lean` as the carrier of 3.2; no theorem of that roadmap is used.

## References

- C. Krattenthaler, *Lattice path enumeration*, arXiv:1503.05930v3 (2017); in M. Bóna (ed.),
  *Handbook of Enumerative Combinatorics*, CRC Press (2015), Chapter 10: Theorem 10.13.1 (p. 50,
  proof pp. 50–51), Corollary 10.13.2 (p. 52), the bijection and Theorem 10.13.3 (pp. 52–53).
  Printed page numbers of the arXiv version.
- C. Krattenthaler, *Determinants of (generalised) Catalan numbers*, arXiv:0709.3044v1 (2007);
  J. Statist. Plann. Inference 140 (2010), 2260–2270: (1.1)–(1.3) (p. 2), Lemma 1 (p. 3),
  Theorem 3 with proof and Remark (a) (p. 4), Remark (d) (p. 5). The later version
  arXiv:0709.3044v2 (2010) has the same statements on the same pages.
- C. Krattenthaler, *Advanced determinant calculus*, arXiv:math/9902004v3 (1999); Sém. Lothar.
  Combin. 42 (1999), B42q: Lemma 3, (2.8) (p. 7), its application to (1.2) (p. 8), (2.17)
  (p. 11), the remarks on MacMahon's box formula (p. 31).
- R. P. Stanley, *Enumerative Combinatorics*, Vol. 1, 2nd ed., Cambridge University Press (2012),
  author's copy (version of 15 July 2011) at `math.mit.edu/~rstan/ec/ec1.pdf`: §2.7, Theorem 2.7.1
  (p. 247 of that copy, whose pages differ from the printed edition).
- B. Lindström, *On the vector representations of induced matroids*, Bull. London Math. Soc. 5
  (1973), 85–90; attributed, not consulted.
- I. M. Gessel and X. Viennot, *Binomial determinants, paths, and hook length formulae*, Adv.
  Math. 58 (1985), 300–321; attributed, not consulted.
- P. A. MacMahon, *Combinatory Analysis*, Vol. 2, Cambridge University Press (1916); attributed,
  not consulted.

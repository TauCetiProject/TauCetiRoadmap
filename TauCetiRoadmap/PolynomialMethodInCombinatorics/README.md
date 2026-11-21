# Roadmap: the polynomial method in combinatorics

**Summary.** The polynomial method bounds a finite configuration by attaching to it a polynomial of
low degree: either one that vanishes on the configuration, whose existence a count of monomials
forces, or one built from the configuration whose nonvanishing somewhere on a grid the
Combinatorial Nullstellensatz guarantees. This roadmap proves five classical consequences, over
fields and over the integers modulo a prime. The objects are finite sets of field elements, grids
`S₁ × ⋯ × Sₙ`, affine hyperplanes, finite multigraphs, sets of points of `Fⁿ` for a finite field
`F`, and finite families of lines in `Kᵈ`. Every bound is a statement about these objects; no
algorithm is a target.

The headline theorems are these.

- *Restricted sums (Erdős–Heilbronn, Dias da Silva–Hamidoune).* For a prime `p`, a set `A` of
  residues modulo `p` and `s ≥ 0`, the sums of `s` distinct elements of `A` take at least
  `min(p, s|A| − s² + 1)` values. For `s = 2`: the sums `a + b` with `a ≠ b` in `A` take at least
  `min(p, 2|A| − 3)` values. Behind it stands the theorem of Alon, Nathanson and Ruzsa on sums
  `a₁ + ⋯ + aₖ` restricted by a polynomial condition, over any field.
- *Covering a grid but one point (Alon–Füredi).* Over any field, if affine hyperplanes cover every
  point of a grid `S₁ × ⋯ × Sₙ` except one point of the grid, which none of them contains, there
  are at least `∑ (|Sᵢ| − 1)` of them; for the cube `{0, 1}ⁿ` at least `n`.
- *Regular subgraphs (Alon–Friedland–Kalai).* If `q` is a prime power, a finite multigraph with
  more than `(q − 1)|V|` edges and all degrees at most `2q − 1` has a nonempty set of edges in which
  every vertex has degree `0` or `q`.
- *Kakeya sets over finite fields (Dvir).* A set of points of `Fⁿ`, `F` a field with `q`
  elements, that contains a full line in every direction has at least `(q + n − 1 choose n)`
  points, which is at least `qⁿ / n!`.
- *Joints (Guth–Katz, Kaplan–Sharir–Shustin, Quilodrán).* If `d ≥ 2` and `L` is a finite family
  of lines in `Kᵈ`, `K` a field of characteristic zero, the points through which the lines of `L`
  run in `d` independent directions number at most `(4ᵈ d!)^(1/(d−1)) |L|^(d/(d−1))`.

The roadmap builds on Mathlib's Combinatorial Nullstellensatz, its Schwartz–Zippel lemma and its
multivariate polynomials with their homogeneous components and partial derivatives, and on Tau
Ceti's dimension counts for spaces of polynomials of bounded degree. Mathlib
already proves the Cauchy–Davenport theorem, the Chevalley–Warning theorem and the theorem of
Erdős, Ginzburg and Ziv; they are cited, never restated. FourierAnalyticAdditiveCombinatorics
treats the rank form of the method (Croot–Lev–Pach and Ellenberg–Gijswijt) and
LinearAlgebraMethodInCombinatorics the dimension arguments for set families; this roadmap uses
neither.

Layer 1 below proves the restricted-sum theorems and Layer 2 the cover and subgraph theorems, both
from the Nullstellensatz. Layer 3 constructs low-degree polynomials vanishing on a finite set and
shows that one vanishing at enough points of a line vanishes on the whole line. Layer 4 (Kakeya
sets) and Layer 5 (joints) use Layer 3. Layers 1, 2 and 3 use no other layer.

## Conventions

- **Points and polynomials.** Points of `Fⁿ` are functions `σ → F` on a finite coordinate type
  `σ`, or `Fin n → F`. Polynomials are Mathlib's `MvPolynomial σ F`, with `totalDegree`,
  coefficients indexed by exponent vectors `σ →₀ ℕ`, and evaluation `MvPolynomial.eval`. The
  monomial `∏ Xᵢ^cᵢ` is the exponent vector `Finsupp.equivFunOnFinite.symm c`.
- **Sizes.** Sizes of finite sets are natural numbers. Natural-number subtraction occurs in
  `|Aᵢ| − 1` and `|Sᵢ| − 1`, exact for nonempty sets; in `s|A| + 1 − s²` in 1.4, truncated at `0`
  as intended there (the bound is then empty); and in `q + n − 1`, `d + n − 1`, `n − 1` in Layer 4,
  where 4.2 says what happens for `n = 0`. The other bounds are written without subtraction.
- **Restricted sums.** For sets `Aᵢ` indexed by a finite type, `restrictedSumset A` is the set of
  sums `∑ᵢ xᵢ` with `xᵢ ∈ Aᵢ` and the `xᵢ` pairwise distinct; `polySumset h A` is the set of sums
  `∑ᵢ xᵢ` with `xᵢ ∈ Aᵢ` and `h(x) ≠ 0`.
- **Lines.** Over a finite field the line through `y` in direction `x` is the set
  `{y + a • x : a ∈ F}`, a single point when `x = 0`. In Layer 5 a line is an affine subspace
  `ℓ` of `Kᵈ` (Mathlib's `AffineSubspace`) whose direction has dimension `1`.
- **Multigraphs.** A finite multigraph is a finite vertex type `V`, a finite edge type `E` and the
  ends `ends e : Sym2 V` of each edge; parallel edges are allowed. The degree of `v` in a set `S`
  of edges is the number of edges of `S` with `v` among their ends; a loop counts once.

## Layer 1: restricted sums

### 1.1 The polynomial restricted-sum theorem

Let `F` be a field, `σ` a finite type, `Aᵢ ⊆ F` nonempty finite sets with `cᵢ = |Aᵢ| − 1`, and
`h ∈ F[xᵢ : i ∈ σ]`. Define `polySumset h A`, the sums `∑ xᵢ` over the points `x` of the grid
`∏ Aᵢ` with `h(x) ≠ 0`. Prove `le_card_polySumset`: if `m + deg h = ∑ cᵢ` and the coefficient of
`∏ xᵢ^cᵢ` in `(∑ xᵢ)^m · h` is nonzero, then `polySumset h A` has at least `m + 1` elements
(Alon, Theorem 4.1, pp. 5–6, over `ℤ/p`; the theorem is Alon, Nathanson and Ruzsa's).

Route: otherwise put the elements of `polySumset h A` into a list `E` of `m` field elements and
let `Q = h · ∏_{e ∈ E} (∑ xᵢ − e)`. Then `Q` vanishes on the grid, has total degree at most
`m + deg h = ∑ cᵢ`, and its coefficient of `∏ xᵢ^cᵢ` is that of `(∑ xᵢ)^m · h`, which is nonzero;
so its total degree is `∑ cᵢ`, and the Combinatorial Nullstellensatz
(`MvPolynomial.combinatorial_nullstellensatz_exists_eval_ne_zero`, with `tᵢ = cᵢ < |Aᵢ|`) gives a
point of the grid where `Q ≠ 0`. The cited proof works over any field.

**Checks.**
- With one variable, `h = 1`, `A = {0, 1, 2} ⊆ ℤ/5` and `m = 2`: the coefficient of `x²` in
  `x²` is `1`, and the bound `3` is the size of `A`.
- Nonemptiness is needed: with one variable, `A = ∅`, `h = 1` and `m = 0`, the hypotheses read
  `0 + 0 = 0` and `1 ≠ 0`, while `polySumset h A` is empty.
- With `σ` of two elements, `h = 1` and `m = c₀ + c₁`, the coefficient is `(m choose c₀)`, and for
  sets in `ℤ/p` with `|A₀| + |A₁| − 1 ≤ p` it is nonzero; the theorem then gives the
  Cauchy–Davenport bound `|A₀ + A₁| ≥ |A₀| + |A₁| − 1`, which Mathlib proves as
  `ZMod.cauchy_davenport`.

*Needs:* Mathlib `MvPolynomial.combinatorial_nullstellensatz_exists_eval_ne_zero`,
`MvPolynomial.totalDegree`, `Fintype.piFinset`. (Proved here, following the cited proof.)

### 1.2 The coefficient of a power of the sum times the Vandermonde product

Let `r` and `m` be natural numbers and `c₀, …, c_{r−1}` natural numbers with
`∑ cᵢ = m + (r choose 2)`. Prove `coeff_sum_pow_mul_vandermonde`: the coefficient of `∏ xᵢ^cᵢ` in
the integer polynomial `(x₀ + ⋯ + x_{r−1})^m · ∏_{j < i} (xᵢ − xⱼ)` is
`m! / (c₀! ⋯ c_{r−1}!) · ∏_{j < i} (cᵢ − cⱼ)`; in the form stated, that coefficient times `∏ cᵢ!`
equals `m! ∏_{j < i} (cᵢ − cⱼ)` (Alon, Lemma 4.4, p. 7, where it is said to follow from known
results on the ballot problem and a direct proof is credited to Alon, Nathanson and Ruzsa).

Route: `∏_{j < i} (xᵢ − xⱼ)` is the Vandermonde determinant `∑_π sgn(π) ∏ xᵢ^π(i)`, so the
coefficient is `∑_π sgn(π) m! / ∏ (cᵢ − π(i))!`, a determinant of the matrix
`(1/(cᵢ − j)!)`, which column operations reduce to `∏_{j < i}(cᵢ − cⱼ) / ∏ cᵢ!`.

**Checks.**
- `r = 2`, `m = 1`, `c = (2, 0)`: `(x₀ + x₁)(x₁ − x₀) = x₁² − x₀²` has coefficient `−1` at `x₀²`,
  and the formula gives `1!/(2! 0!) · (0 − 2) = −1`.
- `r = 1`: the product is empty and the coefficient of `x₀^m` in `x₀^m` is `1`.
- The degree condition is needed: for `r = 2`, `m = 1` and `c = (1, 0)` the coefficient of `x₀` in
  `x₁² − x₀²` is `0`, while `m! (c₁ − c₀) = −1`.
- The formula was compared with the expanded polynomial for `r ≤ 3`, `m ≤ 4`, for `r = 4`,
  `m ≤ 2`, and every `c`.

*Needs:* Mathlib `MvPolynomial.lcoeff`, `Matrix.det_vandermonde`. (Proved here.)

### 1.3 Sums of distinct elements from sets of distinct sizes

Define `restrictedSumset A`, the sums `∑ xᵢ` with `xᵢ ∈ Aᵢ` and the `xᵢ` pairwise distinct. Prove
`card_restrictedSumset_of_injective`: let `p` be prime and `Aᵢ ⊆ ℤ/p` nonempty sets, indexed by a
finite type with `r` elements, of pairwise distinct sizes. If `∑ |Aᵢ| ≤ p + (r + 1 choose 2) − 1`,
then `restrictedSumset A` has at least `∑ |Aᵢ| − (r + 1 choose 2) + 1` elements (Alon,
Proposition 4.2, p. 6, with `r = k + 1`; proof on p. 7).

Route: number the sets `0, …, r − 1` and take `h = ∏_{j < i} (xᵢ − xⱼ)`, of degree
`(r choose 2)`, so that `polySumset h A = restrictedSumset A`. With `cᵢ = |Aᵢ| − 1`, the
`cᵢ` are distinct, so `∑ |Aᵢ| ≥ 1 + ⋯ + r` and `m = ∑ cᵢ − (r choose 2) = ∑ |Aᵢ| − (r + 1 choose 2)`
is a natural number, below `p` by hypothesis. By 1.2 the coefficient times `∏ cᵢ!` is
`m! ∏ (cᵢ − cⱼ)`, which is prime to `p` because `m < p` and the `cᵢ` are distinct and less than
`p`; so the coefficient is nonzero modulo `p`, and 1.1 applies.

**Checks.**
- `p = 5`, `A₀ = {0, 1, 2}`, `A₁ = {0, 1}`: `r = 2`, `∑ |Aᵢ| = 5 ≤ 7`, and the bound is
  `5 − 3 + 1 = 3`; the sums of distinct pairs are `1, 2, 3`.
- Distinct sizes are needed: `A₀ = A₁ = {0, 1}` in `ℤ/5` have `∑ |Aᵢ| = 4`, the bound would be
  `2`, and the only sum of distinct elements is `1`.
- Nonemptiness is needed: `A₀ = ∅` and `A₁ = ℤ/5` have distinct sizes and `∑ |Aᵢ| = 5 ≤ 7`; the
  bound would be `3` while there are no sums.
- The statement was checked against the definition for every family with `r = 2` in `ℤ/5` and
  `ℤ/7`, and with `r = 3` in `ℤ/3` and `ℤ/5`.

*Needs:* 1.1, 1.2; Mathlib `ZMod`, `Nat.Prime`, `Fintype.equivFin`. (Proved here, following the
cited proof.)

### 1.4 The theorem of Dias da Silva and Hamidoune

Prove `min_le_card_restrictedSumset_const`: for a prime `p`, a set `A ⊆ ℤ/p` and `s ≥ 0`, the set
of sums of `s` distinct elements of `A`, `restrictedSumset` of the constant family `A` indexed by
`Fin s`, has at least `min(p, s|A| + 1 − s²)` elements, the difference truncated at `0` (Alon,
Theorem 4.6, p. 8, stated there for nonempty `A`). The case `s = 2` is the Erdős–Heilbronn
conjecture `|{a + b : a, b ∈ A, a ≠ b}| ≥ min(p, 2|A| − 3)` (Alon, Theorem 4.3, p. 6).

Route: for `|A| < s` the bound is `0`, and for `s = 0` both sides are `1`. Let `|A| = N ≥ s ≥ 1`.
Sizes `N, N − 1, …, N − s + 1` give, by 1.3, the bound `sN − s² + 1` whenever its hypothesis
holds; nested subsets of `A` of distinct sizes have all their restricted sums among the sums of
`s` distinct elements of `A`. If `sN − s² + 1 > p`, the sums of `s` distinct integers in
`[1, N]` fill the interval from `1 + ⋯ + s` to `N + ⋯ + (N − s + 1)`, which contains
`p + (s + 1 choose 2) − 1`; nested subsets with sizes summing to that number give the bound `p`
by 1.3. Alon derives the theorem instead from his Theorem 4.5, whose proof is in Alon, Nathanson
and Ruzsa.

**Checks.**
- `p = 7`, `A = {0, 1, 2, 3}`, `s = 2`: the sums of two distinct elements are `1, …, 5`, five
  values, and `min(7, 2·4 − 3) = 5`; arithmetic progressions attain the bound (checked for
  `p ∈ {7, 11, 13}` and every length and `s`).
- `s = 1`: the bound `min(p, |A|)` is `|A|`. `s = 0`: the only sum is `0`, and the bound is
  `min(p, 1) = 1`. `A = ∅` with `s ≥ 1`: the bound is `0`.
- Primality is needed: in `ℤ/8`, `A = {0, 2, 4, 6}` and `s = 2` give the four sums `0, 2, 4, 6`,
  below `min(8, 5) = 5`.
- The statement was checked against the definition for every `A ⊆ ℤ/p`, `p ≤ 11`, and every `s`.

*Needs:* 1.3. (Proved here; the case `s = 2` and the general case are Dias da Silva and
Hamidoune's theorems.)

### Examples

The Cauchy–Davenport bound as the case `h = 1` of 1.1; the sums of distinct pairs from
`{0, 1, 2}` and `{0, 1}` modulo `5`; arithmetic progressions modulo `7` attaining 1.4.

### Dependencies

Mathlib `MvPolynomial.combinatorial_nullstellensatz_exists_eval_ne_zero`,
`MvPolynomial.totalDegree`, `MvPolynomial.lcoeff`, `Matrix.det_vandermonde`, `Fintype.piFinset`,
`Fintype.equivFin`, `ZMod`; `ZMod.cauchy_davenport` in a Check of 1.1. No other layer.

## Layer 2: covers of grids and regular subgraphs

### 2.1 Covering all but one point of a grid

Prove `sum_card_sub_one_le_card_of_covers`: let `F` be a field, `Sᵢ ⊆ F` finite sets for `i` in a
finite type `σ`, and `u` a point of the grid `∏ Sᵢ`. If finitely many affine equations
`aⱼ ⬝ᵥ x = bⱼ`, `j ∈ ι`, have the property that every grid point other than `u` satisfies one of
them and `u` satisfies none, then `|ι| ≥ ∑ (|Sᵢ| − 1)` (Alon, Theorem 6.3, p. 12, for real
hyperplanes and the cube `{0, 1}ⁿ`). The statement for grids is Alon and Füredi's; it is
attributed here in prose. An equation with `aⱼ = 0` has `bⱼ ≠ 0`, since `u` does not satisfy it,
and then covers nothing, so the statement needs no hypothesis `aⱼ ≠ 0`.

Route: suppose `|ι| < D = ∑ (|Sᵢ| − 1)`. Let
`P(x) = ∏ⱼ (aⱼ ⬝ᵥ x − bⱼ) − c ∏ᵢ ∏_{s ∈ Sᵢ, s ≠ uᵢ} (xᵢ − s)`, with the nonzero constant `c` chosen
so that `P(u) = 0`. The first product has degree at most `|ι| < D`, so `P` has total degree `D`
and coefficient `−c` at `∏ xᵢ^(|Sᵢ| − 1)`. The Nullstellensatz gives a grid point `x` with
`P(x) ≠ 0`, so `x ≠ u`; but then some equation holds at `x` and some `xᵢ ∈ Sᵢ` differs from `uᵢ`,
so both products vanish at `x`.

**Checks.**
- The `D` hyperplanes `xᵢ = s`, `s ∈ Sᵢ \ {uᵢ}`, attain the bound; for the cube and `u = 0` these
  are the `n` hyperplanes `xᵢ = 1`.
- The least number of hyperplanes needed was computed by exhaustive search for every grid of
  `𝔽₂²`, `𝔽₂³`, `𝔽₃²` and `𝔽₅²` and every point `u` of it, and equals `∑ (|Sᵢ| − 1)` in every
  case.
- `u` must lie in the grid: for the cube `{0, 1}³ ⊆ 𝔽₃³` and `u = (2, 2, 2)`, the two planes
  `x₁ = 0` and `x₁ = 1` cover the grid and miss `u`.

*Needs:* Mathlib `MvPolynomial.combinatorial_nullstellensatz_exists_eval_ne_zero`,
`MvPolynomial.totalDegree`, `dotProduct`. (Proved here, following the cited proof.)

### 2.2 Regular subgraphs

Define `subDegree ends S v`, the number of edges of `S` with `v` among their ends. Prove
`exists_regular_subgraph`: let `q` be a prime power and `G` a finite multigraph with more than
`(q − 1)|V|` edges, that is with average degree more than `2q − 2` when `G` has no loops, and with
every degree at most `2q − 1`. Then there is a nonempty set `S` of edges with
`subDegree ends S v ∈ {0, q}` for every vertex `v`: a `q`-regular subgraph (Alon, Theorem 6.1,
p. 10, for loopless graphs and `q` prime; the remark after it, p. 10, credits the case of prime
powers to Alon, Friedland and Kalai).

Route: let `q = p^k` with `p` prime, and work over `ℤ/p` with a variable `x_e` for each edge. For a
vertex `v` let `D_v = ∏_{j < k} (1 − σ_{p^j}(x_e : v ∈ ends e)^(p − 1))`, with `σ_i` the
elementary symmetric polynomial of degree `i` (`MvPolynomial.esymm`). At a point of `{0, 1}^E`
with `t` ones among the edges at `v`, `σ_{p^j}` takes the value `(t choose p^j)`, which modulo `p`
is the `j`-th base-`p` digit of `t` by Lucas's theorem (`Choose.choose_modEq_prod_range_choose`);
so `D_v` is `1` when `q` divides `t` and `0` otherwise. Its degree is at most
`∑_{j < k} (p − 1)p^j = q − 1`. Let `P = ∏_v D_v − ∏_e (1 − x_e)`: the first product has degree at
most `(q − 1)|V| < |E|`, so `P` has total degree `|E|` and coefficient `(−1)^(|E| + 1)` at
`∏ x_e`. The Nullstellensatz with `S_e = {0, 1}` gives a point with `P ≠ 0`; it is not `0`, where
`P` vanishes, so the edges with `x_e = 1` form a nonempty set in which `q` divides every degree;
as degrees are at most `2q − 1`, each is `0` or `q`. The route uses only the incidence of edges
and vertices, so loops, counted once, are allowed.

**Checks.**
- `q = 3`: a `4`-regular multigraph with one more edge has `2|V| + 1` edges and degrees at most
  `5`, so it has a `3`-regular subgraph, the form in which Alon states the case `p = 3`.
- `q = 2`, two vertices joined by three parallel edges: `3 > 2`, degrees `3`, and two of the
  edges form a `2`-regular subgraph.
- `q = 4`: two vertices joined by seven parallel edges have `7 > 6` edges and degrees `7`; four
  of the edges form a `4`-regular subgraph.
- The bound on the degrees is needed: for `q = 3`, take vertices `0, …, 4`, double edges from `0`
  to each of `1, 2, 3, 4` and between `1` and `2`, and one edge between `3` and `4`. There are
  `11 > 10` edges and the degrees are `8, 4, 4, 3, 3`. A set of edges with degrees `0` or `3` at `3`
  and `4` contains all of the five edges at `3` and `4` or none of them, which gives `0` or `4` at
  `0`; the condition at `1` and `2` likewise leaves `0`, `2` or `4` edges between them and `0`. So
  a nonempty such set has degree `2`, `4`, `6` or `8` at `0`.
- The theorem was checked by exhaustive search over all multigraphs, loops allowed, with
  `(q − 1)|V| + 1` edges and degrees at most `2q − 1`, on at most three vertices for `q ∈ {2, 3}`
  and at most two for `q ∈ {4, 5}`, and over the loopless ones on four vertices for `q = 3`.

*Needs:* Mathlib `MvPolynomial.combinatorial_nullstellensatz_exists_eval_ne_zero`,
`MvPolynomial.esymm`, `Choose.choose_modEq_prod_range_choose`, `IsPrimePow`, `ZMod`, `Sym2`.
(Proved here, following the cited proof for `q` prime.)

### Examples

The coordinate hyperplanes covering a grid but one point; `4`-regular multigraphs with an extra
edge and their `3`-regular subgraphs; bundles of parallel edges.

### Dependencies

Mathlib `MvPolynomial.combinatorial_nullstellensatz_exists_eval_ne_zero`,
`MvPolynomial.totalDegree`, `MvPolynomial.esymm`, `Choose.choose_modEq_prod_range_choose`,
`dotProduct`, `IsPrimePow`, `ZMod`, `Sym2`. No other layer.

## Layer 3: low-degree polynomials vanishing on a set

### 3.1 Polynomials of bounded total degree

Let `K` be a field, `S ⊆ Kⁿ` a finite set and `b ≥ 0`. Prove
`exists_ne_zero_totalDegree_le_eval_eq_zero`: if `|S| < (b + n choose n)`, there is a nonzero
polynomial of total degree at most `b` vanishing at every point of `S` (Kaplan–Sharir–Shustin,
Proposition 2, p. 2, over `ℝ`; the proof uses only linear algebra over `K`).

Route: the polynomials of total degree at most `b` form the subspace
`MvPolynomial.restrictTotalDegree`, of dimension `(b + n choose n)` by Tau Ceti's
`TauCeti.finrank_restrictTotalDegree`. Evaluation at the points of `S` is a linear map from that
space to `K^S`, of dimension `|S|`; its kernel is nonzero by `LinearMap.ker_ne_bot_of_finrank_lt`.

**Checks.**
- `n = 1`: `b + 1` points of a line lie on no nonzero polynomial of degree `b`, and fewer do, so
  the bound is sharp.
- `n = 2`, `b = 1`: two points lie on a line, and three points not on a line show that
  `(3 choose 2) = 3` cannot be lowered.

*Needs:* Mathlib `MvPolynomial.restrictTotalDegree`, `LinearMap.ker_ne_bot_of_finrank_lt`; Tau Ceti
`TauCeti.finrank_restrictTotalDegree`. (Proved here.)

### 3.2 Homogeneous polynomials

Prove `exists_isHomogeneous_ne_zero_eval_eq_zero`: with `n ≥ 1`, if
`|S| < (b + n − 1 choose n − 1)`, there is a nonzero homogeneous polynomial of degree `b` vanishing
at every point of `S` (Dvir, proof of Theorem 2, p. 3).

Route: as in 3.1, on the space `MvPolynomial.homogeneousSubmodule` of homogeneous polynomials of
degree `b`, whose dimension is the number `(n multichoose b) = (n + b − 1 choose b)` of monomials
of degree `b` (`TauCeti.finrank_homogeneousSubmodule_eq_multichoose`, `Nat.multichoose_eq`), equal
to `(b + n − 1 choose n − 1)` for `n ≥ 1`.

**Checks.**
- `n = 1`: the bound is `1`, and `S = ∅` carries `x^b`; a single nonzero point carries no
  nonzero multiple of `x^b`.
- `n = 2`, `b = 2`: the homogeneous quadratics form a space of dimension `3`, and any two points
  lie on one of them.
- `n ≥ 1` is needed once the subtractions are those of natural numbers: with no variables and
  `b = 1` the bound reads `(0 choose 0) = 1` and admits `S = ∅`, but the only homogeneous
  polynomial of degree `1` in no variables is `0`.

*Needs:* Mathlib `MvPolynomial.homogeneousSubmodule`, `MvPolynomial.IsHomogeneous`,
`Nat.multichoose_eq`, `LinearMap.ker_ne_bot_of_finrank_lt`; Tau Ceti
`TauCeti.finrank_homogeneousSubmodule_eq_multichoose`. (Proved here.)

### 3.3 Vanishing along a line

Prove `eval_eq_zero_of_eval_eq_zero_on_line`: if a polynomial `P ∈ K[xᵢ : i ∈ σ]` of total degree
at most `b` vanishes at the points `z + t • y` for `t` in a set of more than `b` scalars, then it
vanishes at `z + t • y` for every `t ∈ K`.

Route: `t ↦ P(z + t • y)` is a polynomial in one variable of degree at most `b` with more than
`b` roots, hence zero (`Polynomial.eq_zero_of_natDegree_lt_card_of_eval_eq_zero`). This is
the step used on every line in the proofs of Dvir (Theorem 3 and Claim 2.2, pp. 3–4) and
Kaplan–Sharir–Shustin (p. 3).

**Checks.**
- Over `ℚ`, `P = x₁ x₂` of degree `2` vanishes at the two points `(0, 1)` and `(1, 0)` of the line
  `x₁ + x₂ = 1` but not at `(1/2, 1/2)`: two points do not suffice for degree `2`.

*Needs:* Mathlib `Polynomial.eq_zero_of_natDegree_lt_card_of_eval_eq_zero`, `MvPolynomial.aeval`.
(Proved here.)

### Examples

Lines through two points and conics through five as instances of 3.1; the product of two
coordinates as the failure of 3.3 with too few points.

### Dependencies

Mathlib `MvPolynomial.restrictTotalDegree`, `MvPolynomial.homogeneousSubmodule`,
`MvPolynomial.IsHomogeneous`, `Nat.multichoose_eq`, `LinearMap.ker_ne_bot_of_finrank_lt`,
`Polynomial.eq_zero_of_natDegree_lt_card_of_eval_eq_zero`, `MvPolynomial.aeval`. Tau Ceti
`TauCeti.finrank_restrictTotalDegree`, `TauCeti.finrank_homogeneousSubmodule_eq_multichoose`. No
other layer.

## Layer 4: Kakeya sets over finite fields

### 4.1 Dvir's theorem

Prove `choose_le_card_of_isKakeya`: let `F` be a finite field with `q` elements and `K ⊆ Fⁿ` a
set such that for every `x ∈ Fⁿ` some `y` has `y + a • x ∈ K` for all `a ∈ F`. Then
`|K| ≥ (q + n − 1 choose n)` (Dvir, Theorem 3 and its proof, p. 3, arXiv version 3; the argument
is Alon and Tao's improvement of Dvir's Theorem 1). Since
`(q + n − 1 choose n) = q(q + 1)⋯(q + n − 1)/n!`, this is at least `qⁿ/n!`.

Route: otherwise 3.1 gives a nonzero `P` of total degree at most `q − 1` vanishing on `K`. Write
`P = P₀ + ⋯ + P_{q−1}` with `P_i` its homogeneous components
(`MvPolynomial.homogeneousComponent`, `MvPolynomial.sum_homogeneousComponent`). Let `e` be the
largest index with `P_e ≠ 0`, and suppose `e ≥ 1`. For each `x`, `P` vanishes on a line
`{y + a • x}`, so the polynomial `a ↦ P(y + a • x)` in one variable, of degree at most `q − 1`
with `q` roots, is zero (`Polynomial.eq_zero_of_natDegree_lt_card_of_eval_eq_zero`); its
coefficient of `a^e` is `P_e(x)`, since the components of lower degree contribute only lower
powers of `a`. So `P_e` vanishes on all of `Fⁿ`; its degree in each variable is below `q`, so
`P_e = 0` by `MvPolynomial.eq_zero_of_eval_zero_at_prod_finset`, against the choice of `e`. Hence
`e = 0` and `P` is a nonzero constant, which cannot vanish on the nonempty set `K`. The proof
as printed assumes `|K| < (q + n − 2 choose n)`; the same argument with the dimension
`(q + n − 1 choose n)` of the polynomials of degree at most `q − 1` gives the bound here.

**Checks.**
- `q = 2`, `n = 2`: the bound is `3`, attained by `{(0, 0), (1, 0), (0, 1)}`, which contains the
  lines through `(0, 0)` in directions `(1, 0)` and `(0, 1)` and the line `{(1, 0), (0, 1)}` in
  direction `(1, 1)`.
- `q = 3`, `n = 2`: the bound is `6` and the smallest Kakeya set has `7` points; `q = 2`, `n = 3`:
  the bound is `4` and the smallest has `5` (exhaustive search).
- `q = 4`, `n = 2`: the bound `10` is attained (exhaustive search over one line in each of the five
  directions of `𝔽₄²`), so it cannot be raised for this non-prime `q`; for `q = 5` the bound is `15`
  and the smallest Kakeya set of `𝔽₅²` has `17` points.
- `n = 1`: the bound `q` forces `K = F`. `n = 0`: the bound is `1`, and `K` contains the only
  point.

*Needs:* 3.1; Mathlib `MvPolynomial.homogeneousComponent`,
`MvPolynomial.sum_homogeneousComponent`, `MvPolynomial.eq_zero_of_eval_zero_at_prod_finset`,
`Polynomial.eq_zero_of_natDegree_lt_card_of_eval_eq_zero`. (Proved here, following the cited
proof.)

### 4.2 Sets meeting many lines in many points

Prove `choose_le_card_of_many_rich_lines`: let `F` have `q` elements, `n ≥ 0`, `d ≥ 0`, and
`K, L ⊆ Fⁿ`. If `|L| > d q^(n−1)` and for every `y ∈ L` some line `{z + a • y : a ∈ F}` contains
at least `d + 2` points of `K`, then `|K| ≥ (d + n − 1 choose n − 1)` (Dvir, Theorem 2, p. 2,
proof in §2, pp. 3–5). Dvir's hypothesis, that `|L| ≥ δqⁿ` and the lines meet `K` in at least
`γq` points with `d = ⌊q min(δ, γ)⌋ − 2`, implies the one here. For `n = 0` the right side is `1`
under truncated subtraction, and the hypotheses never hold: a line of `F⁰` is a single point.

Route: `d = 0` asks only that `K` be nonempty, which a line with two points of `K` gives. For
`d ≥ 1` the hypothesis `|L| > d` forces `n ≥ 1`, since `F⁰` has one point. Let `d ≥ 1`, and
suppose `|K|` is smaller. By 3.2 a nonzero homogeneous `g` of degree `d`
vanishes on `K`, hence on every multiple `c • w` of a point `w ∈ K`. For `y ∈ L`, a line with
`d + 2` points of `K` has `y ≠ 0`, and `d + 1` of its points `z + a • y` have `a ≠ 0`; the points
`a⁻¹ • z + y` are zeros of `g`. If `z = 0` this says `g(y) = 0`; otherwise they are `d + 1`
distinct points of the line through `y` in direction `z`, and 3.3 gives `g(y) = 0`. So `g`
vanishes on `L`, more than `d q^(n−1)` points, against the Schwartz–Zippel lemma
(`MvPolynomial.schwartz_zippel_totalDegree`, with `S = F`).

**Checks.**
- For a Kakeya set, `n ≥ 1`, `L = Fⁿ ∖ {0}` and `d = q − 2`: each `y ∈ L` lies on a line of `K`
  with `q = d + 2` points, and `qⁿ − 1 > (q − 2)q^(n−1)`, so `|K| ≥ (q + n − 3 choose n − 1)`, of
  order `q^(n−1)`, Dvir's first bound; 4.1 improves it to order `qⁿ`. The direction `0` must be
  left out of `L` (next Check).
- The statement was checked against the definitions for every `K` in `𝔽₂`, `𝔽₃`, `𝔽₅`, `𝔽₂²`,
  `𝔽₃²` and `𝔽₂³`, every `d`, and `L` the set of all directions with a line carrying `d + 2` points
  of `K`.
- A line in direction `0` is a single point, so `0` never belongs to `L`.

*Needs:* 3.2, 3.3; Mathlib `MvPolynomial.schwartz_zippel_totalDegree`,
`MvPolynomial.IsHomogeneous`. (Proved here, following the cited proof.)

### Examples

The three-point Kakeya set in `𝔽₂²`; the smallest Kakeya sets in `𝔽₃²` and `𝔽₂³` against the
bound.

### Dependencies

Layer 3 (3.1, 3.2, 3.3). Mathlib `MvPolynomial.homogeneousComponent`,
`MvPolynomial.sum_homogeneousComponent`, `MvPolynomial.eq_zero_of_eval_zero_at_prod_finset`,
`Polynomial.eq_zero_of_natDegree_lt_card_of_eval_eq_zero`,
`MvPolynomial.schwartz_zippel_totalDegree`, `MvPolynomial.IsHomogeneous`.

## Layer 5: joints

### 5.1 The joints theorem

Let `K` be a field of characteristic zero and `d ≥ 2`. Define `IsJoint L x` for a finite family
`L` of affine subspaces of `Kᵈ` and a point `x`: the directions of the members of `L` through `x`
span `Kᵈ`. For lines this says that `x` lies on at least `d` lines of `L` not all parallel to a
common hyperplane. Prove `card_pow_le_of_isJoint`: if every member of `L` is a line, every finite
set `J` of joints of `L` has `|J|^(d−1) ≤ 4ᵈ d! |L|ᵈ`, that is
`|J| ≤ (4ᵈ d!)^(1/(d−1)) |L|^(d/(d−1))` (Kaplan–Sharir–Shustin, Theorem 1, p. 1, with proof on
pp. 2–3, over `ℝ` and for `d ≥ 3`; their proof applies unchanged to `d = 2`, and uses of the reals
only that the characteristic is zero; Guth and Katz for `d = 3`, and Quilodrán independently,
attributed in prose).

Route: let `n = |L| ≥ 1` (with no lines there are no joints) and `m = |J|`, and suppose
`m^(d−1) > 4ᵈ d! nᵈ`. Remove repeatedly a line carrying fewer than `m/(2n)` points of the
current `J`, with its points; fewer than `m/2` points go, and every remaining point is still a
joint of the remaining lines, each of which carries at least `m/(2n)` remaining points. Let `b`
be least with `(b + d choose d) > m`; then `b ≤ ⌈(d! m)^(1/d)⌉ ≤ 2(d! m)^(1/d)`, and the assumption
on `m` is exactly `m/(2n) > 2(d! m)^(1/d)`, so every remaining line carries more than `b` points.
By 3.1 a nonzero `P` of degree at most `b` vanishes on the remaining points, and by 3.3 on the
remaining lines. At a remaining point `x` on a line `x + K • v`, the coefficient of `t` in
`P(x + t • v)` is `∑ vᵢ ∂ᵢP(x)`, so it vanishes; as the directions at `x` span `Kᵈ`, every
`∂ᵢP` (`MvPolynomial.pderiv`) vanishes at `x`. Each `∂ᵢP` has degree at most `b − 1` and so
vanishes on the remaining lines by 3.3; by induction every iterated partial derivative of `P`
vanishes on them. In characteristic zero, the partial derivative of `P` along the exponent of a
monomial of greatest degree is a nonzero constant, a contradiction. The source (p. 3) writes the
condition `m/(2n) > 2(d! m)^(1/d)` as `m > (2^(d+1) d!)^(1/(d−1)) n`; solved for `m` it reads
`m^(d−1) > 4ᵈ d! nᵈ`, which gives the constant `(4ᵈ d!)^(1/(d−1))` used here.

**Checks.**
- The axis-parallel lines of a `k × ⋯ × k` grid in `Kᵈ` are `d k^(d−1)` lines with `kᵈ` joints;
  for `d = 3`, `k = 2`: `12` lines, `8` joints and `8² = 64 ≤ 4³ · 6 · 12³ = 663552`. They show
  that the exponent `d/(d − 1)` cannot be lowered.
- Three lines through the origin of `K³` in one plane have directions spanning only that plane:
  the origin is not a joint, although it lies on `3 = d` lines.
- `d ≥ 2` is needed: for `d = 1` and no lines there are no joints, and the inequality would read
  `1 ≤ 0`.
- Lines are needed: two planes of `K³` through a common line have directions spanning `K³`, so
  every point of that line is a joint, and `J` can be arbitrarily large.
- The step from the assumption on `m` to `m > 2nb` was checked for `2 ≤ d ≤ 6`, `n < 60` and the
  fifty smallest admissible `m` in each case.

*Needs:* 3.1, 3.3; Mathlib `AffineSubspace`, `AffineSubspace.direction`, `Module.finrank`,
`MvPolynomial.pderiv`. (Proved here, following the cited proof.)

### Examples

The grid of axis-parallel lines; three concurrent coplanar lines, which make no joint.

### Dependencies

Layer 3 (3.1, 3.3). Mathlib `AffineSubspace`, `AffineSubspace.direction`, `Module.finrank`,
`MvPolynomial.pderiv`.

## Scope and ownership

This roadmap owns the definitions and theorems stated above: restricted sums with respect to a
polynomial and the theorem of Alon, Nathanson and Ruzsa over any field; the coefficient of a power
of the sum times the Vandermonde product; restricted sums of sets of distinct sizes modulo a
prime and the theorem of Dias da Silva and Hamidoune, with the Erdős–Heilbronn bound as its case
`s = 2`; the theorem of Alon and Füredi for grids over any field; the theorem of Alon, Friedland
and Kalai for prime powers; low-degree and homogeneous polynomials vanishing on a finite set and
vanishing along a line; Dvir's bounds for Kakeya sets and for sets meeting many lines in many
points; joints and the joints theorem over fields of characteristic zero.

Already in the library and therefore not targets:

- The Combinatorial Nullstellensatz in both of Alon's forms
  (`MvPolynomial.combinatorial_nullstellensatz_exists_linearCombination` and
  `MvPolynomial.combinatorial_nullstellensatz_exists_eval_ne_zero`) and the vanishing of a
  polynomial of small partial degrees on a grid
  (`MvPolynomial.eq_zero_of_eval_zero_at_prod_finset`),
  in `Mathlib/Combinatorics/Nullstellensatz.lean`.
- The Chevalley–Warning theorem (`char_dvd_card_solutions_of_sum_lt` in
  `Mathlib/FieldTheory/ChevalleyWarning.lean`), the Cauchy–Davenport theorem
  (`ZMod.cauchy_davenport` in `Mathlib/Combinatorics/Additive/CauchyDavenport.lean`) and the
  Erdős–Ginzburg–Ziv theorem (`ZMod.erdos_ginzburg_ziv` in
  `Mathlib/Combinatorics/Additive/ErdosGinzburgZiv.lean`), which Alon derives from the
  Nullstellensatz. 1.1 recovers the Cauchy–Davenport bound in a Check only.
- The Schwartz–Zippel lemma (`MvPolynomial.schwartz_zippel_totalDegree` in
  `Mathlib/Algebra/MvPolynomial/SchwartzZippel.lean`), used in 4.2.
- The dimensions of the spaces of polynomials of total degree at most `b` and of homogeneous
  polynomials of degree `b` (`TauCeti.finrank_restrictTotalDegree` and
  `TauCeti.finrank_homogeneousSubmodule_eq_multichoose` in
  `TauCeti/RingTheory/MvPolynomial/Finrank.lean`), used in 3.1 and 3.2.

Left to other roadmaps:

- CrystallineCohomologyPartII, 6.6, owns the Ax–Katz congruence modulo `q` and the affine
  strengthening of Chevalley–Warning to divisibility by `q`; nothing here concerns them.
- FourierAnalyticAdditiveCombinatorics, Layer 3, owns the monomial counts with bounded partial
  degrees, the Croot–Lev–Pach lemma and the Ellenberg–Gijswijt theorem, and Layer 2 Meshulam's
  theorem; this roadmap states none of them and does not depend on that one. Its monomial counts
  bound each variable's degree by `q − 1`; the counts of 3.1 and 3.2 bound only the total degree.
- LinearAlgebraMethodInCombinatorics owns the dimension arguments for set families (oddtown,
  Fisher, Frankl–Wilson, two-distance sets, Graham–Pollak, set pairs); the dimension counts of
  Layer 3 are about polynomials on points, not set families, and that roadmap is not used.
- DecisionTreeComplexity, Layer 4, uses "polynomial method" for degree bounds on Boolean
  functions (Nisan–Szegedy); it shares no statement with this roadmap.

Not treated here: the Ax–Katz theorem; sum-free sets, Sidon sets and solutions of single linear
equations; Alon's Theorem 4.5 for unequal sets, the condition `ab ≠ 1` of his Proposition 4.7 and
the theorem of Eliahou and Kervaire on sums in vector spaces over `𝔽_p`; list colouring and the
Alon–Tarsi theorem; the permanent lemma; the regular-subgraph question for integers that are not
prime powers; the bound of Dvir, Kopparty, Saraf and Sudan for Kakeya sets with multiplicities;
joints over fields of positive characteristic, joints of curves and the incidences of lines with
joints; polynomial partitioning, the Szemerédi–Trotter theorem and the distinct distances problem.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Combinatorics/Nullstellensatz.lean`:
  `MvPolynomial.combinatorial_nullstellensatz_exists_eval_ne_zero` (over a domain, if a polynomial
  has total degree `∑ tᵢ` and a nonzero coefficient at `∏ xᵢ^tᵢ`, and `tᵢ < |Sᵢ|`, it is nonzero
  at some point of `∏ Sᵢ`), `MvPolynomial.eq_zero_of_eval_zero_at_prod_finset` (a polynomial with
  `degreeOf i < |Sᵢ|` for all `i` vanishing on `∏ Sᵢ` is zero).
- `Mathlib/Algebra/MvPolynomial/SchwartzZippel.lean`: `MvPolynomial.schwartz_zippel_totalDegree`
  (a nonzero polynomial in `n` variables over a domain vanishes on at most a fraction
  `deg/|S|` of `Sⁿ`).
- `Mathlib/Algebra/MvPolynomial/Basic.lean`: `MvPolynomial.lcoeff` (a coefficient as a linear
  map). `Mathlib/Algebra/MvPolynomial/Eval.lean`: `MvPolynomial.eval`, `MvPolynomial.aeval`.
  `Mathlib/Algebra/MvPolynomial/Degrees.lean`: `MvPolynomial.totalDegree`.
  `Mathlib/RingTheory/MvPolynomial/Basic.lean`: `MvPolynomial.restrictTotalDegree` (the
  polynomials of total degree at most `m`).
  `Mathlib/RingTheory/MvPolynomial/Homogeneous.lean`: `MvPolynomial.IsHomogeneous`,
  `MvPolynomial.homogeneousSubmodule`, `MvPolynomial.homogeneousComponent`,
  `MvPolynomial.sum_homogeneousComponent` (a polynomial is the sum of its homogeneous components).
  `Mathlib/RingTheory/MvPolynomial/Symmetric/Defs.lean`: `MvPolynomial.esymm`.
  `Mathlib/Algebra/MvPolynomial/PDeriv.lean`: `MvPolynomial.pderiv`.
- `Mathlib/Algebra/Polynomial/Roots.lean`:
  `Polynomial.eq_zero_of_natDegree_lt_card_of_eval_eq_zero` (over a domain, a polynomial of degree
  below the number of distinct points at which it vanishes is zero).
- `Mathlib/LinearAlgebra/Vandermonde.lean`: `Matrix.det_vandermonde`.
- `Mathlib/Data/Nat/Choose/Basic.lean`: `Nat.multichoose_eq`
  (`(n multichoose k) = (n + k − 1 choose k)`).
- `Mathlib/LinearAlgebra/FiniteDimensional/Lemmas.lean`: `LinearMap.ker_ne_bot_of_finrank_lt` (a
  linear map to a space of smaller dimension has a nonzero kernel).
- `Mathlib/Data/Nat/Choose/Lucas.lean`: `Choose.choose_modEq_prod_range_choose` (Lucas's
  theorem). `Mathlib/Algebra/IsPrimePow.lean`: `IsPrimePow`.
- `Mathlib/Data/Fintype/Pi.lean`: `Fintype.piFinset`. `Mathlib/Data/Fintype/EquivFin.lean`:
  `Fintype.equivFin`. `Mathlib/Data/Matrix/Mul.lean`: `dotProduct`. `Mathlib/Data/ZMod/Defs.lean`:
  `ZMod`. `Mathlib/Data/Sym/Sym2.lean`: `Sym2`.
- `Mathlib/LinearAlgebra/AffineSpace/AffineSubspace/Defs.lean`: `AffineSubspace`,
  `AffineSubspace.direction`. `Mathlib/LinearAlgebra/Dimension/Finrank.lean`: `Module.finrank`.
- Cited in Checks and in the scope only: `ZMod.cauchy_davenport`,
  `char_dvd_card_solutions_of_sum_lt`,
  `ZMod.erdos_ginzburg_ziv`, `MvPolynomial.combinatorial_nullstellensatz_exists_linearCombination`.

### From Tau Ceti

- `TauCeti/RingTheory/MvPolynomial/Finrank.lean`: `TauCeti.finrank_restrictTotalDegree` (the
  polynomials of total degree at most `m` in `n` variables over a commutative ring with the strong
  rank condition have dimension `(m + n choose n)`) and
  `TauCeti.finrank_homogeneousSubmodule_eq_multichoose` (the homogeneous ones of degree `m` have
  dimension `(n multichoose m)`). Cited only; `Suggested.lean` does not import them.

## References

- Noga Alon, *Combinatorial Nullstellensatz*, Combinatorics, Probability and Computing 8 (1999),
  7–29; the version on the author's page at Tel Aviv University. The theorem, lemma and
  proposition numbers above are the paper's, and the page numbers are those of that version.
- Zeev Dvir, *On the size of Kakeya sets in finite fields*, J. Amer. Math. Soc. 22 (2009),
  1093–1097; arXiv:0803.2336, version 3 (the theorem numbers and pages above are those of the
  arXiv version).
- Haim Kaplan, Micha Sharir and Eugenii Shustin, *On lines and joints*, Discrete Comput. Geom.
  44 (2010), 838–843; arXiv:0906.0558, version 1 (theorem numbers and pages of the arXiv version).
- Attributions made in prose without a locator (years as Alon's text and reference list give
  them): Paul Erdős and Hans Heilbronn (the conjecture, 1964); J. A. Dias da
  Silva and Y. O. Hamidoune (1994); Noga Alon, Melvyn B. Nathanson and Imre Ruzsa (the polynomial
  restricted-sum theorem and the coefficient formula of 1.2, 1996); Noga Alon and Zoltán Füredi
  (covering the cube, 1993; the grid form is attributed to them in prose); Noga Alon, Shmuel
  Friedland and Gil Kalai (regular subgraphs for prime powers, 1984). Also in prose: Noga Alon and
  Terence Tao (the improvement in 4.1, as Dvir credits it); Larry Guth and Nets Hawk Katz (joints in
  three dimensions, as Kaplan, Sharir and Shustin cite it); René Quilodrán (joints).

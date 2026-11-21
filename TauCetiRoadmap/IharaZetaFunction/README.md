# Roadmap: the Ihara zeta function of a graph

**Summary.** The Ihara zeta function of a finite graph counts its closed non-backtracking walks
the way the zeta function of a variety over a finite field counts its points. This roadmap builds
it for every finite simple graph, with no connectivity or degree hypothesis unless a statement
says otherwise. The basic object is the Hashimoto matrix `B`, indexed by the darts (ordered pairs
of adjacent vertices): the entry at `(a, b)` is `1` when `a` ends where `b` starts and `b` is not
the reversal of `a`. Write `N_m` for the number of closed walks of length `m` that never step back
along the dart they arrived on, including across the closing step, each counted with its
starting vertex. The zeta function is the power series `ζ(u) = exp(Σ_{m ≥ 1} N_m u^m / m)` with
rational coefficients.

The headline theorems are these.

- *Traces and the determinant formula.* For every `m ≥ 1`, `tr Bᵐ = N_m`, and
  `ζ(u) · det(1 − uB) = 1`: the zeta function is the reciprocal of a polynomial with integer
  coefficients and constant term `1`.
- *Bass's three-term formula.* With `A` the adjacency matrix, `D` the diagonal matrix of degrees,
  `n` vertices and `e` edges, `(1 − u²)ⁿ det(1 − uB) = (1 − u²)ᵉ det(1 − uA + u²(D − 1))` as
  polynomials; when `e ≥ n` this is `det(1 − uB) = (1 − u²)^(e − n) det(1 − uA + u²(D − 1))`.
- *Structure of `B`.* The eigenvalues of `BᵀB`, with multiplicity, are `(deg v − 1)²` for each
  vertex `v` of positive degree and `2e − n₊` further copies of `1`, where `n₊` counts the
  vertices of positive degree. For a graph with at least one vertex and no isolated vertex, `B`
  is irreducible if and only if the graph is connected, every degree is at least `2`, and the
  graph is not a cycle (`n < e`).
- *Regular graphs and the Riemann hypothesis.* If every vertex has degree `q + 1` with `q ≥ 1`,
  the characteristic polynomial of `B` is `(X² − 1)^(e − n) ∏ (X² − λX + q)` over the adjacency
  eigenvalues `λ` with multiplicity, and `ζ` satisfies the functional equation relating `u` and
  `1/(qu)`. If `q ≥ 2`, the graph is Ramanujan (every adjacency eigenvalue `λ` with `|λ| ≠ q + 1`
  has `|λ| ≤ 2√q`) if and only if every zero `s` of `det(1 − q^(−s) B)` with `0 < Re s < 1` has
  `Re s = 1/2`.

The roadmap builds on Mathlib's darts, walks, graph matrices, formal power series, Sylvester's
determinant identity and irreducible matrices. From the
roadmap DeligneWeightsAndPurity it takes the identity `−t D′(t)/D(t) = Σ tr(Fᵐ) tᵐ` for
`D(t) = det(1 − tF)`, which turns the trace formula into the determinant formula. Tau Ceti's
Perron–Frobenius bound on eigenvalues of a nonnegative matrix gives `|λ| ≤ q + 1` for a regular
graph. The roadmaps SpectralGraphBounds (adjacency eigenvalue bounds, Alon–Boppana) and
PeriodicNonnegativeMatrices (the period of an irreducible matrix) are neighbours; nothing here
depends on them.

Layer 1 below defines the Hashimoto matrix and the walk counts and proves the trace formula.
Layer 2 defines the zeta function and proves the determinant formula. Layer 3 proves Bass's
formula. Layer 4 computes `BᵀB` and characterizes irreducibility. Layer 5 treats regular graphs:
the spectrum of `B`, the functional equation and the Riemann hypothesis.

## Conventions

- **Graphs.** `G : SimpleGraph V` with `[Fintype V] [DecidableEq V]` and, where a matrix is formed,
  `[DecidableRel G.Adj]`. `n = Fintype.card V`, `e = #G.edgeFinset`. A simple graph has no loops
  and no multiple edges, so a dart (`SimpleGraph.Dart`) is an ordered pair `(a.fst, a.snd)` of
  adjacent vertices, `a.symm` is its reversal, and there are `2e` darts
  (`SimpleGraph.dart_card_eq_twice_card_edges`). Nothing assumes `V` nonempty, `G` connected or
  minimum degree at least `2` unless the statement says so. The source works with connected
  multigraphs without vertices of degree `1`, other than cycles; each locator below says where a
  statement is wider.
- **Matrices and polynomials.** `A = G.adjMatrix R`, `D = G.degMatrix R` (Mathlib's diagonal matrix
  of degrees). For a square matrix `M` over a commutative ring, `M.charpoly = det(X − M)` and
  `M.charpolyRev = det(1 − X • M)` (Mathlib), so `det(1 − uM)` is `M.charpolyRev` evaluated at
  `u`. A polynomial is read as a power series by Mathlib's coercion `R[X] → R⟦X⟧`.
- **Walks.** Walks are Mathlib's `G.Walk u v`, with list of darts `p.darts`. A closed walk `p`
  at `u` is a *non-backtracking cycle* (in the source: a closed path without backtracking and
  without tail) when, in the list `p.darts ++ p.darts.take 1`, no dart is followed by its
  reversal. For length `m ≥ 1` this says `dᵢ₊₁ ≠ dᵢ.symm` for consecutive darts and
  `d₁ ≠ d_m.symm` (no tail); the walk of length `0` satisfies it vacuously. Walks are counted
  with their starting vertex: a cycle of length `m` traversed in one direction contributes `m`
  walks, one for each starting point, not one equivalence class.
- **The zeta function.** `ζ = exp(L)` with `L = Σ_m (N_m / m) u^m ∈ ℚ⟦u⟧`, formed with Mathlib's
  `PowerSeries.exp ℚ` and `PowerSeries.subst`. The coefficient of `u⁰` is `N₀ / 0 = 0` by the
  convention `x / 0 = 0`, so `L` has zero constant term and the substitution is the composition of
  power series. This is the source's formula (4.5); the source defines `ζ` by an Euler product
  over prime cycles, which is not treated here.
- **Eigenvalues.** The adjacency eigenvalues are Mathlib's
  `(G.isHermitian_adjMatrix ℝ).eigenvalues : V → ℝ`, with multiplicity and in no particular
  order. `B` is not symmetric; its spectrum is read off its characteristic polynomial.
- **Regular graphs.** `G.IsRegularOfDegree (q + 1)`, so the source's `q_v = deg v − 1` is the
  constant `q`. Then `2e = n(q + 1)`, so `e − n = n(q − 1)/2 ≥ 0` when `q ≥ 1`, and natural
  subtraction `e − n` is the true difference in every statement that uses it.

## Layer 1: The Hashimoto matrix and non-backtracking cycles

### 1.1 The Hashimoto matrix

Define `hashimotoMatrix R G : Matrix G.Dart G.Dart R` for any `R` with `0` and `1`: the entry at
`(a, b)` is `1` if `a.snd = b.fst` (Mathlib's `SimpleGraph.DartAdj a b`) and `b ≠ a.symm`, and
`0` otherwise. This is the source's edge
adjacency matrix `W₁` (Terras, Definition 8, p. 17), with its oriented edges replaced by Mathlib's
darts.

- Row sums: for every dart `a`, `Σ_b B a b = deg(a.snd) − 1` (the darts leaving the end of `a`,
  except the reversal of `a`). Column sums: `Σ_a B a b = deg(b.fst) − 1`.
- With the start matrix `S` (`S v a = 1` iff `a.fst = v`), the end matrix `T` (`T v a = 1` iff
  `a.snd = v`), both `V × Dart`, and the reversal matrix `J` (`J a b = 1` iff `b = a.symm`):
  `S Tᵀ = A`, `S Sᵀ = T Tᵀ = D`, `S J = T`, `T J = S`, and `B + J = Tᵀ S` (Terras,
  Proposition 4, p. 51, for multigraphs; for a simple graph `A` has zero diagonal).
- The entries lie in `{0, 1}`, and `B a a.symm = 0`.

**Checks.**
- On the triangle every dart has exactly one admissible successor, so `B` is the permutation
  matrix of two disjoint 3-cycles of darts, one for each direction of travel: row sums
  `1 = 2 − 1`.
- On `K₂` (one edge) `B = 0`. The matrix without the condition `b ≠ a.symm` is `TᵀS`, which on
  `K₂` is the reversal `J`; its square has trace `2`, counting the two backtracking walks
  `u → v → u` and `v → u → v`.
- The row sum is governed by the end of the dart, not its start: in the paw (a triangle `w x y`
  with a pendant vertex `v` joined to `w`), the dart `(v, w)` has row sum `2 = deg w − 1`, while
  `deg v − 1 = 0`. The source's Theorem 13(1), p. 52, writes the starting vertex here.

### 1.2 Non-backtracking cycles and the trace formula

Define `IsNonBacktrackingCycle p` for a closed walk `p : G.Walk u u`, as in the Conventions, and
`closedNonBacktrackingCount G m`, the number `N_m` of pairs `(u, p)` with `p : G.Walk u u` a
non-backtracking cycle of length `m` (Mathlib's `Nat.card` of that subtype of `Σ u, G.Walk u u`;
it is finite since `V` is).

Prove `trace_hashimotoMatrix_pow`: for every `m ≥ 1`,
`(hashimotoMatrix ℤ G ^ m).trace = closedNonBacktrackingCount G m` (Terras, Definition 9 and
formula (4.7) with its proof, p. 18, stated there for connected multigraphs without leaves; the
statement and the proof hold for every finite simple graph).

Route: by induction on `k`, the entry `(Bᵏ) a b` is the number of sequences of darts
`a = d₀, d₁, …, d_k = b` with `dᵢ.snd = dᵢ₊₁.fst` and `dᵢ₊₁ ≠ dᵢ.symm`, as in Mathlib's
`SimpleGraph.adjMatrix_pow_apply_eq_card_walk` (`pow_succ`, `Matrix.mul_apply`). So the
trace counts cyclic sequences `(d₀, …, d_(m−1))` in which each dart is admissibly followed by the
next and `d_(m−1)` by `d₀`. Such a sequence is the list of darts of exactly one closed walk at
`d₀.fst` of length `m`, and the cyclic condition is the non-backtracking-cycle condition: a walk
is determined by its start and its darts, and every chain of darts with matching ends is the
dart list of a walk (Mathlib `SimpleGraph.Walk.darts`, `SimpleGraph.Walk.length_darts`,
`SimpleGraph.Walk.cons`; the darts of a walk form a `SimpleGraph.DartAdj` chain by
`SimpleGraph.Walk.isChain_dartAdj_darts`).

**Checks.**
- `m = 0` is excluded: `B⁰ = 1` has trace `2e` (the number of darts), while the walks of length
  `0` give `N₀ = n`; for `K₄` these are `12` and `4`.
- For the cycle `C_n` (`n ≥ 3`), `tr Bᵐ = 2n` when `n` divides `m` and `0` otherwise; for `C₅`
  the traces for `m = 1, …, 10` are `0, 0, 0, 0, 10, 0, 0, 0, 0, 10`.
- For `K₄`, `N₁, …, N₁₁ = 0, 0, 24, 24, 0, 96, 168, 168, 528, 1200, 1848`, the coefficients the
  source lists for `u d/du log ζ` (Terras, Example 2, p. 11).
- The no-tail condition matters: in the paw, the walks `v w x y w v` and `v w y x w v` of length
  `5` never step back between consecutive darts but end with the reversal of their first dart.
  They are excluded, and `N₅ = tr B⁵ = 0`; counting them would give `2`.

*Needs:* 1.1; Mathlib `SimpleGraph.Walk`, `SimpleGraph.Walk.darts`,
`SimpleGraph.Walk.length_darts`, `SimpleGraph.Walk.isChain_dartAdj_darts`, `Matrix.trace`,
`pow_succ`, `Matrix.mul_apply`, `Nat.card`. (Proved in the source.)

### Examples

- Triangle: `N_m = 6` for `3 ∣ m` and `0` otherwise (two directions, three starting points).
- Forests and graphs whose every cycle hangs off a tree part: a forest has `N_m = 0` for all
  `m ≥ 1`; the paw has the same counts as the triangle.

### Dependencies

Mathlib only.

## Layer 2: The zeta function

### 2.1 The zeta function and the determinant formula

Define `iharaZeta G : PowerSeries ℚ` as `exp(Σ_m (N_m / m) u^m)` (Conventions).

Prove `iharaZeta_mul_charpolyRev`: `iharaZeta G * (hashimotoMatrix ℚ G).charpolyRev = 1` in
`ℚ⟦u⟧`, that is `ζ(u) = det(1 − uB)⁻¹` (Terras, formula (4.4), p. 17, proved on p. 18 from
(4.5) and (4.7); Corollary 2, p. 48; stated there for connected multigraphs without leaves and
holding for every finite simple graph).

Route: let `P = det(1 − uB) ∈ ℚ[u]` and `L = Σ (N_m / m) u^m`. By DeligneWeightsAndPurity §0.10
(ii), applied to the endomorphism `Matrix.toLin' B` of `ℚ^Dart` over the field `ℚ` (its
characteristic polynomial is that of `B` by `Matrix.charpoly_toLin'`, so its `det(1 − uF)` is
`P` by `Matrix.reverse_charpoly`, and the trace of its `m`-th power is `tr Bᵐ` by
`Matrix.toLin'_pow` and `LinearMap.trace_eq_matrix_trace`),
`−u P′ = P · Σ_(m ≥ 1) tr(Bᵐ) uᵐ` in `ℚ⟦u⟧`; by 1.2 the right side is `P · Σ N_m u^m = P · u L′`,
so `P′ = −P L′` after cancelling `u` (`ℚ⟦u⟧` is a domain). By the chain rule for substitution
and `exp′ = exp`, `(exp L)′ = L′ · exp L`. Hence `(exp L · P)′ = 0`, and over `ℚ` a series with
derivative zero is its constant coefficient (`PowerSeries.derivative.ext`), here `1 · 1`. Mathlib
has no form of this logarithmic-derivative identity for characteristic polynomials at the pin.

**Checks.**
- Triangle: `det(1 − uB) = (1 − u³)²` and `ζ = 1 + 2u³ + 3u⁶ + …`; the coefficient `2` of `u³`
  is `N₃ / 3`. The series `exp(Σ N_m u^m)`, without the factor `1/m`, is
  `exp(6u³/(1 − u³)) = 1 + 6u³ + 24u⁶ + …`, which is not the reciprocal of any polynomial.
- Cycle `C_n`: `ζ = (1 − uⁿ)⁻²` (Terras, Example 1, p. 7).
- `K₄`: `ζ = 1 + 8u³ + 6u⁴ + 48u⁶ + 72u⁷ + 39u⁸ + …` and
  `det(1 − uB) = (1 − u²)² (1 − u)(1 − 2u)(1 + u + 2u²)³` (Terras, Example 2, p. 11).
- A forest, or the graph with no vertices: `B` is nilpotent or empty and `ζ = 1`.

*Needs:* 1.1, 1.2; DeligneWeightsAndPurity §0.10 (ii); Mathlib `PowerSeries.exp`,
`PowerSeries.subst`, `PowerSeries.HasSubst`, `PowerSeries.derivative_subst`,
`PowerSeries.derivative_exp`, `PowerSeries.constantCoeff_exp`, `PowerSeries.derivative.ext`,
`Matrix.charpolyRev`, `Matrix.eval_charpolyRev`, `Matrix.reverse_charpoly`,
`Matrix.charpoly_toLin'`, `Matrix.toLin'_pow`, `LinearMap.trace_eq_matrix_trace`.

### Examples

- The coefficients of `ζ` are integers, being those of `det(1 − uB)⁻¹`, the inverse of a
  polynomial with integer coefficients and constant term `1`, and they are nonnegative, being
  those of the exponential of a series with nonnegative coefficients; for `K₄` they are listed in
  the Checks.

### Dependencies

Layer 1; DeligneWeightsAndPurity §0.10.

## Layer 3: Bass's determinant formula

### 3.1 The three-term formula

Prove `bass_determinant_formula`: in `ℤ[X]`,

```text
(1 − X²)^n · det(1 − X B) = (1 − X²)^e · det(1 − X A + X² (D − 1))
```

for every finite simple graph (Terras, Theorem 1, p. 10, with Bass's proof in §11.1, p. 51, and
the identities of Proposition 4, p. 51). The source states
`det(1 − uB) = (1 − u²)^(r − 1) det(1 − uA + u²Q)` with `Q = D − 1` and `r − 1 = e − n` for a
connected graph without leaves. The multiplied form holds for every finite simple graph: for a
graph with `c` components `e − n` is the cycle rank minus `c`, which is negative for a forest
(`−c`), and for an isolated vertex `D − 1` has the entry `−1`. When `e ≥ n` (for instance a
connected graph with a cycle) cancelling `(1 − X²)^n` in the domain `ℤ[X]` gives the source's
form; when `e ≤ n` it gives `(1 − X²)^(n − e) det(1 − XB) = det(1 − XA + X²(D − 1))`.

Route (the source multiplies block matrices; this is the same computation through Sylvester's
identity, inside `ℤ[X]`). Put `c = 1 − X²`. From `B = TᵀS − J` (1.1) and `J² = 1`,
`(1 − XJ)(1 − XB) = c · 1 − X(Tᵀ − X Sᵀ) S`, using `J Tᵀ = (T J)ᵀ = Sᵀ`. Mathlib's
`Matrix.charpoly_mul_comm'` evaluated at `c` (`Matrix.eval_charpoly`) gives, for `P = X(Tᵀ − XSᵀ)`
of size `Dart × V` and `S`,
`cⁿ det(c − PS) = c^(2e) det(c − SP)`, and `SP = X(S Tᵀ − X S Sᵀ) = X(A − XD)` by 1.1. So
`cⁿ det(1 − XJ) det(1 − XB) = c^(2e) det(c − XA + X² D)`, and `c − XA + X²D = 1 − XA + X²(D − 1)`.
Finally `det(1 − XJ) = cᵉ`: choosing one dart of each edge (for instance the one with
`a.fst < a.snd` in an order of `V`) splits the darts as two copies of the edge set on which `J`
swaps the copies, so `1 − XJ` becomes `[[1, −X], [−X, 1]]` in blocks and
`Matrix.det_fromBlocks_one₁₁` gives `det((1 − X²) · 1) = cᵉ`. Cancel `cᵉ`.

**Checks.**
- `K₂`: `A = [[0, 1], [1, 0]]`, `D − 1 = 0`, the vertex side is `det(1 − XA) = 1 − X²` and
  `det(1 − XB) = 1`; the identity reads `(1 − X²)² = (1 − X²)(1 − X²)`. Here `e − n = −1`, so
  the unmultiplied form `det(1 − XB) = (1 − X²)^(e − n) · …` makes no sense in `ℤ[X]`.
- One isolated vertex: `det(1 − XB) = 1` (no darts) and the vertex side is `1 − X²`, the entry
  `−1` of `D − 1` contributing `X² · (−1)`: `(1 − X²)¹ · 1 = (1 − X²)⁰ (1 − X²)`. The graph with no
  vertices gives `1 = 1`. The path on three vertices also has vertex side `1 − X²`.
- Triangle: `e = n`, and `det(1 − XA + X²(D − 1)) = (1 − 2X + X²)(1 + X + X²)² = (1 − X³)²`,
  which is `det(1 − XB)`.
- The sign of the exponent: for `K₄`, `det(1 − XB)` has the factor `(1 − X²)²` beyond the vertex
  side `(1 − X)(1 − 2X)(1 + X + 2X²)³`, so the exponent is `e − n = 2`, not `n − e`.

*Needs:* 1.1; Mathlib `Matrix.charpoly_mul_comm'`, `Matrix.eval_charpoly`, `Matrix.det_mul`,
`Matrix.det_fromBlocks_one₁₁`, `Matrix.reindex`, `Matrix.det_reindex_self`,
`SimpleGraph.dart_card_eq_twice_card_edges`, `SimpleGraph.degMatrix`, `SimpleGraph.adjMatrix`,
`Matrix.charpolyRev`. (Proved in the source.)

### Examples

- `K₄`: `det(1 − XA + 2X²) = (1 − X)(1 − 2X)(1 + X + 2X²)³` and
  `det(1 − XB) = (1 − X²)² (1 − X)(1 − 2X)(1 + X + 2X²)³`.

### Dependencies

Layer 1 (1.1 only).

## Layer 4: The structure of the Hashimoto matrix

### 4.1 Horton's singular values

Prove `charpoly_transpose_mul_hashimotoMatrix`: in `ℤ[X]`,

```text
(X − 1)^n · charpoly(Bᵀ B) = ∏_v (X − (deg v − 1)²) (X − 1)^(deg v).
```

So the eigenvalues of `BᵀB` (the squares of the singular values of `B`) are `(deg v − 1)²` for
each vertex `v` of positive degree together with `2e − n₊` further copies of `1`, `n₊` the
number of vertices of positive degree; the same holds for `B Bᵀ` (`Matrix.charpoly_mul_comm`).
(Terras, Theorem 13(2), p. 52, attributed there to Horton, for connected multigraphs without
leaves, where `n₊ = n`; the multiplied form holds for every finite simple graph, an isolated
vertex giving the factor `X − 1` on both sides.)

Route: `(BᵀB) a b = Σ_c B c a · B c b` vanishes unless `a.fst = b.fst = v`, and then counts the
darts `c` ending at `v` with `c.symm ≠ a, b`: `deg v − 1` if `a = b` and `deg v − 2` otherwise.
Grouping the darts by their start makes `BᵀB`, and with it `X − BᵀB`, block diagonal for the
block map `a ↦ a.fst` (after fixing a linear order on `V`), with blocks `1 + (deg v − 2) 𝟙𝟙ᵀ` on
the `deg v` darts leaving `v`, so its characteristic polynomial is the product of those of the
blocks (`Matrix.BlockTriangular.det`). By
Mathlib's `Matrix.charpoly_vecMulVec` the rank-one part has characteristic polynomial
`X^(d − 1)(X − d(d − 2))`, so the block, which is `1` plus that matrix, has the same polynomial
with `X` replaced by `X − 1`, namely `(X − 1)^(d − 1)(X − (d − 1)²)` for `d = deg v ≥ 1`,
and the empty block for `d = 0` has `1`.

**Checks.**
- `K₄`: `charpoly(BᵀB) = (X − 4)⁴ (X − 1)⁸`: singular values `2` (four times) and `1` (eight times).
- Path on three vertices (two leaves): `charpoly(BᵀB) = X² (X − 1)²`; the leaves give singular
  value `0`, the case the source's hypothesis excludes. The paw gives `X (X − 4)(X − 1)⁶`.
- Not the singular values of `A`: for `K₄` those are `3, 1, 1, 1`.

*Needs:* 1.1; Mathlib `Matrix.charpoly_vecMulVec`, `Matrix.BlockTriangular.det`,
`Matrix.charpoly_reindex`, `Matrix.charpoly_mul_comm`,
`SimpleGraph.dart_fst_fiber_card_eq_degree`. (Proved in the source.)

### 4.2 Irreducibility

Prove `isIrreducible_hashimotoMatrix_iff`: if `V` is nonempty and every vertex has degree at
least `1`, then `hashimotoMatrix ℝ G` is irreducible (Mathlib's `Matrix.IsIrreducible`: the quiver
of positive entries is strongly connected) if and only if `G` is connected, every vertex has
degree at least `2`, and `n < e`. For a connected graph with all degrees at least `2`, `n ≤ e`
always, with equality exactly for a cycle, so the last condition says that `G` is not a cycle.

Sufficiency is Terras, Theorem 13(3), Lemma 2 and Corollary 3, pp. 52–53 (multigraphs whose
fundamental group has rank at least `2`; for a simple graph that rank is `e − n + 1`). The
converse is proved here.

Route. Sufficiency: by Lemma 2 of the source, for any darts `a`, `b` there is a walk that starts
with `a`, ends with `b` and never steps back, built from a spanning tree (Mathlib
`SimpleGraph.Connected.exists_isTree_le`) and edges outside it, of which there are
`e − n + 1 ≥ 2`; minimum degree `2` lets every tree path be continued off the tree. Its darts are
a path from `a` to `b` in the quiver of `B`. For `a ≠ b` that path has positive length; for
`a = b` first step from `a` to a successor `c` (one exists, as `deg(a.snd) ≥ 2`) and then follow
such a walk from `c` back to `a`. So every pair of darts is joined by a path of positive length
(`Matrix.isIrreducible_iff_exists_pow_pos`, `Matrix.pow_apply_pos_iff_nonempty_path`).
Necessity: a vertex `v` of degree `1` with neighbour `w` makes the row of the dart `(w, v)` zero,
and with at least two darts that dart reaches nothing (`Matrix.IsIrreducible.exists_pos`). If
`G` is not connected, two components carry edges (no vertex is isolated) and no dart of one
reaches a dart of the other. If `G` is connected with all degrees at least `2` and `e = n`, then
every degree is `2` (degree sum `2e`), each dart `a` has a single successor `s(a)`, `s` is a
bijection with `s(a.symm) = (s⁻¹(a)).symm`, and the reversal `a.symm` is never reached from
`a`: if `sᵏ(a) = a.symm` with `k ≥ 1`, then for `k = 2j` the dart `sʲ(a)` would equal its own
reversal, and for `k = 2j + 1` the dart `c = sʲ(a)` would have `s(c) = c.symm`, a step back;
both are impossible.

**Checks.**
- The cycle `C_n` (connected, all degrees `2`, `e = n`): `B` is the permutation matrix of two
  disjoint `n`-cycles of darts, so it is reducible. `K₄` and the theta graphs are irreducible.
- Connectivity is needed: `K₄ ⊔ K₄` has two blocks. Minimum degree `2` is needed: `K₄` with a
  pendant vertex has a zero row.
- The hypotheses of the equivalence are needed: `K₄` plus an isolated vertex has the same `B` as
  `K₄`, irreducible, while the graph is not connected; on the empty vertex type the `0 × 0` matrix
  is irreducible vacuously, while the graph is not connected.
- Exact check of the equivalence on all graphs with at most 7 vertices and no isolated vertex.

*Needs:* 1.1; Mathlib `Matrix.IsIrreducible`, `Matrix.IsIrreducible.exists_pos`,
`Matrix.isIrreducible_iff_exists_pow_pos`, `Matrix.pow_apply_pos_iff_nonempty_path`,
`SimpleGraph.Connected.exists_isTree_le`, `SimpleGraph.IsTree.card_edgeFinset`,
`SimpleGraph.sum_degrees_eq_twice_card_edges`. (Sufficiency: proved in the source; necessity:
proved here.)

### Examples

- The theta graph made of three paths of length `3` between two vertices `x` and `y` (`8`
  vertices, `9` edges) is bipartite and `B` is irreducible by 4.2. A closed non-backtracking walk
  cannot turn inside a path, so it runs from one of `x`, `y` to the other along whole paths, an
  even number of times in total, and its length is divisible by `6`: `tr Bᵐ` is nonzero for
  `m = 6, 12, 18, …` and zero for the other `m`, and the gcd of these lengths is `6`, although
  every closed walk of a bipartite graph has even length. The period of `B` is not treated here.

### Dependencies

Layer 1 (1.1).

## Layer 5: Regular graphs

### 5.1 The spectrum of the Hashimoto matrix

Prove `charpoly_hashimotoMatrix_of_isRegularOfDegree`: if `G` is `(q + 1)`-regular with `q ≥ 1`,
then over `ℝ`

```text
charpoly(B) = (X² − 1)^(e − n) · ∏_v (X² − λ_v X + q),
```

`λ_v` the adjacency eigenvalues. So the eigenvalues of `B` are `1` and `−1`, each with
multiplicity at least `e − n = n(q − 1)/2`, and the two roots `μ` of `μ² − λμ + q` for each
adjacency eigenvalue `λ`, whose product is `q` (Terras, proof of Theorem 3, p. 27, for connected
graphs; connectivity is not used).

Route: for a regular graph `D − 1 = q · 1`, and by the spectral theorem
(`Matrix.IsHermitian.spectral_theorem`) `det(1 − XA + qX²) = ∏_v (1 − λ_v X + qX²)`. Bass's
formula 3.1 and cancellation of `(1 − X²)ⁿ` (`e ≥ n` as `q ≥ 1`) give
`det(1 − XB) = (1 − X²)^(e − n) ∏_v (1 − λ_v X + qX²)`. Both this and `charpoly(B)` have degree
`2e`, and the constant term of the right side, `(−1)^(e − n) qⁿ`, is nonzero; reversing
(`Matrix.reverse_charpoly`, `Polynomial.reflect`) gives the statement.

**Checks.**
- `K₄` (`q = 2`, eigenvalues `3, −1, −1, −1`):
  `charpoly(B) = (X² − 1)² (X − 1)(X − 2)(X² + X + 2)³`.
- `K₃,₃` (`q = 2`, eigenvalues `3, −3`, and `0` four times):
  `(X² − 1)³ (X − 1)(X − 2)(X + 1)(X + 2)(X² + 2)⁴`.
- Petersen graph (`q = 2`, eigenvalues `3`, `1` five times, `−2` four times):
  `(X² − 1)⁵ (X − 1)(X − 2)(X² − X + 2)⁵ (X² + 2X + 2)⁴`.
- `q ≥ 1` is needed: a perfect matching (`q = 0`), for instance `K₂`, has `B = 0` and
  `charpoly(B) = X²`, while the right side, with `e − n` truncated to `0`, is
  `(X² − X)(X² + X) = X²(X² − 1)`.

*Needs:* 3.1; Mathlib `Matrix.IsHermitian.spectral_theorem`, `Matrix.IsHermitian.charpoly_eq`,
`SimpleGraph.isHermitian_adjMatrix`, `SimpleGraph.IsRegularOfDegree`,
`SimpleGraph.sum_degrees_eq_twice_card_edges`, `Matrix.reverse_charpoly`, `Polynomial.reflect`.
(Proved in the source.)

### 5.2 The functional equation

Prove `functional_equation_of_isRegularOfDegree`: if `G` is `(q + 1)`-regular with `q ≥ 1`, then
for every complex `u`, with `w = (qu)⁻¹`,

```text
(1 + u)^(e − n) (1 − u)^e (1 − qu)^n · det(1 − wB)
  = (1 + w)^(e − n) (1 − w)^e (1 − u⁻¹)^n · det(1 − uB).
```

For `u ≠ 0`, where `det(1 − uB)` and `det(1 − wB)` are nonzero, this is the source's
`ξ(u) = ξ(1/(qu))` for `ξ(u) = (1 + u)^(r − 1) (1 − u)^(r − 1 + n) (1 − qu)^n ζ(u)` with
`r − 1 = e − n` (Terras, Proposition 3(2), p. 28, for connected graphs; there its proof is
Exercise 21, p. 29). Connectivity is not used.

Route (proved here): at `u = 0` both sides are `1`, by the convention `0⁻¹ = 0` (so `w = 0` and
`1 − u⁻¹ = 1`); let `u ≠ 0`. Write `k = e − n`, `h(u) = ∏_v (1 − λ_v u + qu²)` and
`Λ(u) = (1 + u)^k (1 − u)^e (1 − qu)^n`. Since `qw = u⁻¹`, the right side is `Λ(w) det(1 − uB)`
and the left side is `Λ(u) det(1 − wB)`. By 5.1 (reversed, as in its route)
`det(1 − uB) = (1 − u²)^k h(u)`, and `(1 + u)^k (1 − u)^e = (1 − u²)^k (1 − u)^n`, so
`Λ(u) det(1 − wB) = (1 − u²)^k (1 − w²)^k ((1 − u)(1 − qu))ⁿ h(w)` and
`Λ(w) det(1 − uB) = (1 − u²)^k (1 − w²)^k ((1 − w)(1 − qw))ⁿ h(u)`. Each factor satisfies
`1 − λ_v w + qw² = (1 − λ_v u + qu²)/(qu²)`, so `h(w) = h(u)/(qu²)ⁿ`, and
`(1 − w)(1 − qw) = (1 − qu)(1 − u)/(qu²)`; the two sides agree.

**Checks.**
- `q ≥ 1` is needed: for `K₂` (`q = 0`, so `w = 0⁻¹ = 0` in Lean's convention) at `u = 2` the
  left side is `1 − 2 = −1` and the right side is `(1 − 1/2)² = 1/4`.
- Verified as an identity of rational functions for every regular graph with at most `7`
  vertices and `q ≥ 1`, and for `K₄ ⊔ K₄`, the Petersen graph, `K₅`, `K₆` and `K₄,₄`.

*Needs:* 5.1. (Proved here; statement in the source.)

### 5.3 Ramanujan graphs and the Riemann hypothesis

Define `IsRamanujan q G`: every adjacency eigenvalue `λ` with `|λ| ≠ q + 1` has `|λ| ≤ 2√q`
(Terras, Definition 4, p. 10, for connected `(q + 1)`-regular graphs). Both `q + 1` and
`−(q + 1)` are exempt. Define `SatisfiesRiemannHypothesis q G`: every complex `s` with
`0 < Re s < 1` and `det(1 − q^(−s) B) = 0` has `Re s = 1/2` (Terras, Definition 16, p. 27: the
zeros of `ζ(q^(−s))⁻¹` in the critical strip lie on `Re s = 1/2`; `q^(−s)` is the complex power
`(q : ℂ) ^ (-s)`).

Prove `isRamanujan_iff_satisfiesRiemannHypothesis`: if `G` is `(q + 1)`-regular with `q ≥ 2`,
then `IsRamanujan q G ↔ SatisfiesRiemannHypothesis q G` (Terras, Theorem 3 and its proof,
pp. 27–28, for connected graphs; connectivity is not used, and the source's standing exclusion
of cycles is the hypothesis `q ≥ 2`).

Route: with `u = q^(−s)`, `|u| = q^(−Re s)` (`Complex.norm_cpow_eq_rpow_re_of_pos`), so the strip
`0 < Re s < 1` is the annulus `1/q < |u| < 1` and `Re s = 1/2` is `|u| = q^(−1/2)`. Every nonzero
`u` is `q^(−s)` for `s = −log u / log q` (`Complex.exp_log`), so the property says that every
zero of `det(1 − uB)` in the open annulus has `|u| = q^(−1/2)`. By 5.1 the zeros are `±1`
(on the outer circle) and the roots of `1 − λu + qu²`, of product `1/q`. Every eigenvalue has
`|λ| ≤ q + 1` (Tau Ceti `Matrix.norm_le_of_mulVec_le_smul` with the vector `1`, since
`A 1 = (q + 1) 1`). Three cases, as in the source: for `|λ| = q + 1` the roots are `±1` and
`±1/q`, outside the open annulus; for `|λ| ≤ 2√q` they are complex conjugate or a double real
root, of modulus `q^(−1/2)`; for `2√q < |λ| < q + 1` they are real, distinct, of moduli in
`(1/q, 1)` and different from each other, so one of them violates the property. (The source's
Case 3 writes the moduli of the two reciprocal roots as equal; they are distinct, since the roots
are real and distinct with product `1/q`.)

**Checks.**
- `K₄` (`q = 2`): Ramanujan; the zeros of `det(1 − uB)` are `1, −1, 1/2` and the roots of
  `1 + u + 2u²`, of modulus `2^(−1/2)`.
- Both signs must be exempt: `K₃,₃` (`q = 2`) has the eigenvalue `−3`, and its factor
  `1 + 3u + 2u² = (1 + u)(1 + 2u)` has zeros `−1` and `−1/2`, outside the open annulus; a
  definition exempting only `q + 1` would call `K₃,₃` non-Ramanujan although the Riemann
  hypothesis holds.
- `q ≥ 2` is needed: the cycle `C₅` (`q = 1`) is Ramanujan (`|λ| ≤ 2`), but `q^(−s) = 1` for
  every `s` and `det(1 − B) = 0`, since `det(1 − uB) = (1 − u⁵)²`; every `s` in the strip
  violates the Riemann hypothesis.
- Connectivity is not needed: `K₄ ⊔ K₄` has the eigenvalue `3` twice, exempt, and satisfies both
  properties.
- A graph that is neither: take two copies of `K₆` minus an edge, with the missing edges `ab`
  and `a′b′`, and add the edges `aa′` and `bb′`. The result is `5`-regular (`q = 4`) with the
  adjacency eigenvalue `λ = 1 + 2√3 > 4 = 2√q` (a root of `X² − 2X − 11`). Then `1 − λu + 4u²`
  has discriminant `λ² − 16 = 4√3 − 3 > 0`, takes the values `(5 − λ)/4 > 0` at `u = 1/4` and
  `5 − λ > 0` at `u = 1`, and has its vertex at `λ/8 ∈ (1/4, 1)`: two distinct real zeros in
  `(1/4, 1)` with product `1/4`, so one of them is not `1/2`.

*Needs:* 5.1; Tau Ceti `Matrix.norm_le_of_mulVec_le_smul`; Mathlib
`Matrix.IsHermitian.eigenvalues`, `Matrix.IsHermitian.charpoly_eq`,
`Complex.norm_cpow_eq_rpow_re_of_pos`, `Complex.exp_log`, `Complex.cpow_def`. (Proved in the
source.)

### Examples

- The Petersen graph (`q = 2`; eigenvalues `3, 1, −2`, with `2 < 2√2`) is Ramanujan; the zeros
  of `det(1 − uB)`, which are the poles of its zeta function, are `±1`, `1/2`, and the roots of
  `1 − u + 2u²` and `1 + 2u + 2u²`, all of modulus `2^(−1/2)`.

### Dependencies

Layer 3 (3.1, through 5.1); Tau Ceti Perron–Frobenius.

## Scope and ownership

This roadmap owns: the Hashimoto matrix of a simple graph on darts and its incidence identities;
closed non-backtracking walks without tail and the trace formula; the Ihara zeta function as the
exponential of the walk-count series and the determinant formula; Bass's three-term formula in
the multiplied form valid for all finite simple graphs; Horton's computation of `BᵀB`; the
irreducibility criterion for `B`; for regular graphs the characteristic polynomial of `B`, the
functional equation and the equivalence of the Ramanujan property with the Riemann hypothesis.

Already in the libraries and therefore not targets: Mathlib's darts, walks, adjacency and degree
matrices, `Matrix.charpolyRev`, Sylvester's identity (`Matrix.charpoly_mul_comm'`,
`Matrix.det_one_sub_mul_comm`), formal exponential and substitution with the chain rule,
irreducible matrices and the path description of their powers; Tau Ceti's bound on the moduli of
the eigenvalues of a nonnegative matrix with a positive subinvariant vector. Mathlib has no
non-backtracking walks, no Hashimoto matrix and no graph zeta function at the pin.

Left to other roadmaps:

- DeligneWeightsAndPurity, §0.10 (ii), states the logarithmic-derivative identity
  `−tD′(t)/D(t) = Σ_(n ≥ 1) tr(Fⁿ) tⁿ` for `D(t) = det(1 − tF)`; 2.1 uses it and does not restate
  it. The determinant formula 2.1 is a statement about walk counts of graphs, a different
  statement.
- SpectralGraphBounds, §§1.1–1.3, sorts the adjacency eigenvalues and bounds them by the maximum
  degree, and §5.2 proves the Alon–Boppana bound, which says that the threshold `2√q` of 5.3
  cannot be lowered for large graphs. This roadmap uses Mathlib's unsorted eigenvalues and Tau
  Ceti's bound instead, and does not depend on that one. Constructions of Ramanujan graphs are not
  treated here.
- PeriodicNonnegativeMatrices treats the period and the peripheral spectrum of an irreducible
  nonnegative matrix. Nothing is stated here about the period of `B`; this roadmap does not depend
  on that one.
- DiscreteQuantumWalks, Layers 1–2, owns the Grover walk on the arcs of a graph: the flip-flop
  shift, the Grover coin and its spectral mapping. The reversal `J` of 1.1 acts on darts as a
  flip-flop shift does on arcs; it is used here only inside the route of 3.1. Nothing is stated
  here about the Grover operator.
- MatchingPolynomial owns the matching polynomial, the path tree and the Heilmann–Lieb bound;
  nothing here concerns them.

Not treated here: the Euler product of `ζ` over equivalence classes of prime cycles and the
graph prime number theorem; the Kotani–Sunada bounds on the poles of the zeta function of an
irregular graph and the radius of convergence; the edge zeta and path zeta functions, weighted
graphs, coverings, Artin–Ihara L-functions; Ramanujan graphs of large size; multigraphs with
loops or multiple edges.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Combinatorics/SimpleGraph/Dart.lean`: `SimpleGraph.Dart` (fields `fst`, `snd` of the
  underlying pair, `adj`), `SimpleGraph.Dart.symm`, `SimpleGraph.Dart.fintype` (for
  `[Fintype V] [DecidableRel G.Adj]`, built from `Σ v, G.neighborSet v`); `DecidableEq` is derived;
  `SimpleGraph.DartAdj` (`d.snd = d'.fst`).
- `Mathlib/Combinatorics/SimpleGraph/DegreeSum.lean`: `SimpleGraph.dart_card_eq_twice_card_edges`
  (`Fintype.card G.Dart = 2 * #G.edgeFinset`), `SimpleGraph.dart_fst_fiber_card_eq_degree`,
  `SimpleGraph.sum_degrees_eq_twice_card_edges`.
- `Mathlib/Combinatorics/SimpleGraph/Walk/Basic.lean` and neighbouring files:
  `SimpleGraph.Walk`, `SimpleGraph.Walk.darts`, `SimpleGraph.Walk.length_darts`,
  `SimpleGraph.Walk.cons`, `SimpleGraph.Walk.isChain_dartAdj_darts`.
  `Mathlib/Combinatorics/SimpleGraph/AdjMatrix.lean`:
  `SimpleGraph.adjMatrix`, `SimpleGraph.adjMatrix_pow_apply_eq_card_walk` (the pattern of 1.2).
  `Mathlib/Combinatorics/SimpleGraph/LapMatrix.lean`: `SimpleGraph.degMatrix` (the diagonal
  matrix of degrees), `SimpleGraph.isHermitian_adjMatrix`.
  `Mathlib/Combinatorics/SimpleGraph/Finite.lean`: `SimpleGraph.IsRegularOfDegree`.
  `SimpleGraph.Connected.exists_isTree_le` (a connected graph has a spanning tree) and
  `SimpleGraph.IsTree.card_edgeFinset` (a tree on `n` vertices has `n − 1` edges).
- `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean`: `Matrix.charpoly`, `Matrix.eval_charpoly`
  (`M.charpoly.eval t = det(scalar t − M)`), `Matrix.charpoly_mul_comm'`
  (`X^|n| (A B).charpoly = X^|m| (B A).charpoly` for `A : Matrix m n R`, `B : Matrix n m R`),
  `Matrix.charpoly_mul_comm`, `Matrix.charpoly_reindex`, `Matrix.charpoly_vecMulVec`.
  `Mathlib/LinearAlgebra/Matrix/Charpoly/Coeff.lean`: `Matrix.charpolyRev`
  (`det(1 − X • M.map C)`), `Matrix.reverse_charpoly` (`M.charpoly.reverse = M.charpolyRev`),
  `Matrix.eval_charpolyRev`.
- `Mathlib/LinearAlgebra/Matrix/SchurComplement.lean`: `Matrix.det_fromBlocks_one₁₁`,
  `Matrix.det_one_sub_mul_comm`. `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean`:
  `Matrix.det_mul`, `Matrix.det_reindex_self`. `Mathlib/LinearAlgebra/Matrix/Block.lean`:
  `Matrix.BlockTriangular.det` (the determinant of a block triangular matrix is the product of
  the determinants of its diagonal blocks).
- `Mathlib/Analysis/Matrix/Spectrum.lean`: `Matrix.IsHermitian.eigenvalues`,
  `Matrix.IsHermitian.spectral_theorem`, `Matrix.IsHermitian.charpoly_eq`
  (`A.charpoly = ∏ i, (X − C (eigenvalues i))`).
- `Mathlib/LinearAlgebra/Matrix/Irreducible/Defs.lean`: `Matrix.IsIrreducible` (nonnegative
  entries and the quiver of positive entries strongly connected by paths of positive length),
  `Matrix.IsIrreducible.exists_pos`, `Matrix.pow_apply_pos_iff_nonempty_path`,
  `Matrix.isIrreducible_iff_exists_pow_pos`.
- `Mathlib/RingTheory/PowerSeries/Exp.lean`: `PowerSeries.exp`, `PowerSeries.derivative_exp`,
  `PowerSeries.constantCoeff_exp`. `Mathlib/RingTheory/PowerSeries/Substitution.lean`:
  `PowerSeries.subst`, `PowerSeries.HasSubst` (substitution of a series with nilpotent constant
  coefficient). `Mathlib/RingTheory/PowerSeries/Derivative.lean`: `PowerSeries.derivative_subst`
  (chain rule), `PowerSeries.derivative.ext` (over a ring with `HasUniqueDiv`, such as `ℚ`, two
  series with equal derivatives and equal constant coefficients are equal).
- `Matrix.charpoly_toLin'`, `Matrix.toLin'_pow`, `LinearMap.trace_eq_matrix_trace` (passing from
  `B` to the endomorphism `Matrix.toLin' B` in 2.1).
- `Mathlib/Analysis/SpecialFunctions/Pow/Real.lean`: `Complex.norm_cpow_eq_rpow_re_of_pos`
  (`‖(x : ℂ) ^ y‖ = x ^ y.re` for `x > 0`). `Complex.exp_log`, `Complex.cpow_def`.
- `Polynomial.reflect`, `Nat.card`, `Matrix.trace`, `pow_succ`, `Matrix.mul_apply`.

### From Tau Ceti

- `TauCeti/LinearAlgebra/Matrix/PerronFrobenius/Positive.lean`: `Matrix.norm_le_of_mulVec_le_smul`
  (for `A : Matrix n n ℝ` with nonnegative entries, `v` with positive entries and
  `A *ᵥ v ≤ r • v`, every complex eigenvalue `μ` of `A.map (↑)` has `‖μ‖ ≤ r`), used in 5.3.

### From TauCetiRoadmap.DeligneWeightsAndPurity

- §0.10 (ii): for an endomorphism `F` of a finite-dimensional vector space over a field `E` and
  `D(t) = det(1 − tF)`, `−t D′(t)/D(t) = Σ_(n ≥ 1) Tr(Fⁿ) tⁿ` in `E⟦t⟧`. Used in 2.1 with
  `E = ℚ` and `F` the endomorphism with matrix `B`, whose `D` is `B.charpolyRev`.

## References

- Audrey Terras, *A Stroll Through the Garden of Graph Zeta Functions*, draft of 29 December 2009,
  posted on the author's page (`mathweb.ucsd.edu/~aterras/newbook.pdf`); the book *Zeta Functions
  of Graphs: A Stroll through the Garden* (Cambridge University Press) grew from it. Page numbers
  above are the printed page numbers of the draft (the PDF page minus six). Read: §2 (the usual
  hypotheses, p. 6; Definition 2 and Example 1, p. 7; Theorem 1 and Definition 4, p. 10;
  Example 2, p. 11), §4 (Definition 8 and formula (4.4), p. 17; Definition 9 and formulas (4.5),
  (4.7), p. 18), §7 (Proposition 2, Definition 16 and Theorem 3, pp. 27–28; Proposition 3,
  pp. 28–29), §11.1 (Theorem 11, p. 47; Corollary 2, p. 48; Proposition 4 and Bass's proof of
  Theorem 1, p. 51), §11.2 (Theorem 13, Lemma 2, p. 52; Corollary 3, p. 53). The results are
  attributed there to Ihara, Hashimoto, Bass and Horton.

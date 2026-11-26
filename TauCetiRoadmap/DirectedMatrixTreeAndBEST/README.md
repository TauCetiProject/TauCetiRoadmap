# Roadmap: the directed matrix-tree theorem and the BEST theorem

**Summary.** This roadmap develops the enumerative theory of spanning arborescences of directed
graphs and its two classical consequences: the count of Eulerian circuits and the stationary law
of a finite Markov chain. A weighted digraph is a weight function on ordered pairs of vertices of
a finite set, with values in a commutative ring and loops allowed; a multidigraph is a finite
family of arrows, loops and parallel arrows allowed. A spanning arborescence converging to a root
`r` is a choice, for every vertex other than `r`, of one arc leaving it, such that following the
chosen arcs from any vertex leads to `r`; its weight is the product of the weights of its arcs.

The headline theorems are these.

- *The directed matrix-tree theorem (Tutte).* Over any commutative ring, deleting the row and the
  column of `r` from the out-degree Laplacian, the diagonal matrix of out-weights minus the weight
  matrix, leaves a matrix whose determinant is the weighted sum of the spanning arborescences
  converging to `r`. More precisely, every entry in column `j` of the adjugate of the Laplacian is
  the arborescence sum at `j`. Loops cancel from both sides.
- *The Markov chain tree theorem.* For an irreducible stochastic matrix `P` on a nonempty finite
  state space, the only stationary probability vector is the vector whose entry at `v` is the
  arborescence sum of `P` at `v`, divided by the sum of these numbers over all states.
- *Euler's theorem for digraphs (Good).* On a nonempty finite vertex set, a multidigraph has a
  closed walk through every arrow exactly once if and only if every in-degree equals the
  out-degree and any two vertices of positive out-degree are joined by a chain of arrows, each
  traversed in either direction.
- *The BEST theorem (van Aardenne-Ehrenfest and de Bruijn).* If every in-degree equals the
  out-degree and no vertex has out-degree zero, the number of Eulerian circuits beginning with a
  given arrow out of `s` is the number of spanning arborescences converging to `s` times the
  product of `(outdeg v − 1)!` over all vertices `v`. In particular there are `(k!)^(k^(n−1))`
  de Bruijn sequences of order `n ≥ 1` on `k` letters.

The undirected matrix-tree identity of GeometricTopology is the case of symmetric weights: orienting
a spanning tree towards `r` is a bijection onto the arborescences converging to `r` that keeps the
weight. Mathlib supplies matrices, determinants and adjugates, stochastic and irreducible matrices,
and the Laplacian of a simple graph; Tau Ceti supplies directed walks along an arrow family, the
carrier of its network theory, and the Perron–Frobenius theorem for irreducible matrices.
MarkovChainsAndRenewal treats the stationary law of a chain qualitatively; the theorem here is the
formula for it.

## How to read the build

Layer 1 below defines the out-degree Laplacian, arborescences by parent functions and the weighted
arborescence sum. Layer 2 proves the directed matrix-tree theorem in its principal-minor and
adjugate forms and the specializations to transposed, balanced and symmetric weights; it depends
on Layer 1. Layer 3 proves the Markov chain tree theorem from Layer 2. Layer 4 defines degrees and
Eulerian circuits of a multidigraph and proves Euler's criterion; it depends on no other layer.
Layer 5 proves the BEST theorem from Layers 1 and 4 and counts de Bruijn sequences with Layer 2.
Within a layer the sections are in build order.

## Conventions

- **Vertices and weights.** `V` is a finite type with decidable equality. A weight function is
  `w : V → V → R`; `w u v` is the weight of the arcs from `u` to `v`, and `w v v` is the weight of
  the loops at `v`. Theorems about determinants take `R` a commutative ring; the arborescence sum
  only needs a commutative semiring, so that it can count in `ℕ`. A multidigraph with `m(u, v)`
  arrows from `u` to `v` has the weight `w u v = m(u, v)`, and a stochastic matrix `P` has the
  weight `w u v = P u v`.
- **Laplacian.** The out-degree Laplacian is `L(w) = diag(∑ᵤ w v u) − w`. Its diagonal entry at
  `v` is `∑_(u ≠ v) w v u`, so a loop weight never enters it, and every row sums to `0`. This is
  the matrix of Stanley, Theorem 10.4, p. 193, for multidigraphs. The in-degree Laplacian
  `diag(∑ᵤ w u v) − w` is the transpose of `L(w')`, the out-degree Laplacian of the transposed
  weights `w' u v = w v u`, so the two have the same principal minors. `L(w')` is the transpose of
  `L(w)` exactly when the weights are balanced (2.3): for `w = [[a, b], [c, d]]`, `L(w')` is
  `[[c, −c], [−b, b]]` and `L(w)ᵀ` is `[[b, −c], [−b, c]]`.
- **Arborescences.** An arborescence converging to `r` is a parent function `p : V → V` with
  `p r = r` such that every `v` has some iterate `p^[k] v = r`. Then `p v ≠ v` for `v ≠ r`, so a
  loop is never an arc of an arborescence. Its weight is `∏_(v ≠ r) w v (p v)`, and the
  arborescence sum `τ_w(r)` is the sum of these weights over all arborescences converging to
  `r`, which are the arborescences of the complete digraph on `V`; an arc of weight `0` makes its
  arborescence contribute nothing. For a multidigraph the sum, taken in `ℕ`, counts the spanning
  arborescences as sets of arrows: each `v ≠ r` chooses one of the `m(v, p v)` arrows to its
  parent. These are Stanley's oriented subtrees with root `r` (p. 191) and the spanning trees
  rooted at `r` of Lyons and Peres (§4.1, p. 97), whose arcs point towards the root. Arborescences
  in which the root reaches every vertex are the arborescences of the transposed weights.
- **Multidigraphs.** A multidigraph is an arrow family `Q : V → V → Type*` with a `Fintype`
  instance on every `Q u v`, as in Tau Ceti's network theory: `Q u v` is the type of arrows from
  `u` to `v`. Its out-degree at `v` is the number of arrows with source `v` and its in-degree the
  number with target `v`; a loop counts once in each. A walk is a `TauCeti.ArrowWalk Q s t`, whose
  arrows in order are listed by `TauCeti.ArrowWalk.arrows`, the first traversed arrow first. An
  Eulerian circuit at `s` is a closed walk at `s` whose list of arrows has no repetition and
  contains every arrow of `Q`. Two vertices are joined by a zigzag when they are related by the
  reflexive transitive closure of "an arrow runs from `a` to `b` or from `b` to `a`"; loops do not
  change this closure, so by `SimpleGraph.reachable_iff_reflTransGen` and
  `TauCeti.Quiver.underlyingGraph_adj` it is reachability in Tau Ceti's underlying graph
  `TauCeti.Quiver.underlyingGraph` of the quiver with arrows `Q`.
- **Chains.** A stochastic matrix is an element of Mathlib's `Matrix.rowStochastic ℝ V`: entries
  nonnegative, rows summing to `1`. Irreducibility is Mathlib's `Matrix.IsIrreducible`: entries
  nonnegative and the quiver of positive entries strongly connected. A stationary probability
  vector is a row vector `π` with nonnegative entries summing to `1` and `πP = π`
  (`Matrix.vecMul π P = π`).
- **Arithmetic.** `(outdeg v − 1)!` is used only where `outdeg v ≥ 1`, so the subtraction does
  not truncate. The exponent `k^(n − 1)` is used only for `n ≥ 1`.

## Layer 1: the out-degree Laplacian and arborescences

### 1.1 The out-degree Laplacian

Define `outLaplacian w` as `Matrix.diagonal (fun v => ∑ u, w v u) - Matrix.of w`. For symmetric
zero-diagonal real weights it is the weighted graph Laplacian of an electrical network; electrical
networks are not treated here.

- Every row of `outLaplacian w` sums to `0`, so `outLaplacian w` sends the all-ones vector to `0`
  and its determinant is `0` when `V` is nonempty.
- Changing `w v v` does not change `outLaplacian w`.
- For a stochastic matrix `P`, `outLaplacian P = 1 − P`; for a matrix `Q` whose rows sum to `0`,
  such as the generator of a continuous-time chain, `outLaplacian Q = −Q`.
- For the adjacency matrix of a simple graph `G` with values in `R`, `outLaplacian` is Mathlib's
  `SimpleGraph.lapMatrix R G`, since the row sums of the adjacency matrix are the degrees
  (`SimpleGraph.degree_eq_sum_if_adj`).

**Checks.**
- Two vertices with `w = [[a, b], [c, d]]`: `outLaplacian w = [[b, −b], [−c, c]]`, whatever the
  loop weights `a` and `d`.
- Subtracting only the off-diagonal weights from the diagonal of out-weights would give
  `[[a + b, −b], [−c, c + d]]`, whose rows sum to `a` and `d`; its principal minors would depend
  on the loops, against 2.1.

*Needs:* Mathlib `Matrix.diagonal`, `Matrix.of`, `Matrix.mem_rowStochastic_iff_sum`,
`SimpleGraph.lapMatrix`, `SimpleGraph.degree_eq_sum_if_adj`. (Proved here.)

### 1.2 Arborescences and the arborescence sum

Define `IsArborescence r p` for `p : V → V`: `p r = r` and every `v` has `p^[k] v = r` for some
`k`. Define `arborescenceSum w r` as the sum, over the parent functions `p` with
`IsArborescence r p`, of `∏_(v ≠ r) w v (p v)`.

- If `IsArborescence r p` then `p v ≠ v` for every `v ≠ r`, and `p^[n − 1] v = r` for every `v`,
  where `n` is the number of vertices; conversely `p r = r` and `p^[n − 1] v = r` for all `v` give
  an arborescence. So the condition is decidable.
- For `p` with `p r = r`, `IsArborescence r p` holds exactly when the quiver on `V` with one arrow
  from `p v` to `v` for each `v ≠ r`, and no other arrow, has a unique path from `r` to every
  vertex, that is, carries a Mathlib `Quiver.Arborescence` structure with root `r`. The arrows of
  that quiver point away from the root; reversing them gives the arcs `v → p v`.
- For a ring homomorphism `f`, the arborescence sum of the weights `f (w u v)` at `r` is the image
  under `f` of the arborescence sum of `w` at `r`.

**Checks.**
- One vertex: the identity is the only parent function, it is an arborescence, and the empty
  product gives `arborescenceSum w r = 1`.
- Two vertices with `w = [[a, b], [c, d]]`: the only arborescence converging to `0` sends `1` to
  `0`, so `τ_w(0) = c`, and `τ_w(1) = b`.
- With all weights `1`, the numbers of arborescences converging to a fixed root are `1, 1, 3, 16,
  125` for `1` to `5` vertices, Cayley's numbers `n^(n − 2)` for `n ≥ 2`.
- Without the condition `p r = r`, the function exchanging two vertices `r` and `v` would count,
  since `p^[1] v = r`; with it, no function containing a cycle avoiding `r` is an arborescence.

*Needs:* Mathlib `Nat.iterate`, `Function.iterate_fixed`, `Quiver.Arborescence`,
`Finset.filter`. (Proved here.)

### Examples

The two-vertex weights `[[a, b], [c, d]]`, the complete digraph on four vertices with its sixteen
arborescences converging to a vertex, and the directed cycle on `n` vertices, which has exactly one
arborescence converging to each vertex.

### Dependencies

Mathlib `Matrix.diagonal`, `Matrix.of`, `Matrix.mem_rowStochastic_iff_sum`,
`SimpleGraph.lapMatrix`, `SimpleGraph.degree_eq_sum_if_adj`, `Nat.iterate`,
`Function.iterate_fixed`, `Quiver.Arborescence`, `Finset.filter`. No other layer.

## Layer 2: the directed matrix-tree theorem

### 2.1 Principal minors

Prove `det_submatrix_outLaplacian`: over any commutative ring, the determinant of the submatrix of
`outLaplacian w` on the rows and columns indexed by `{v // v ≠ r}` is `arborescenceSum w r`
(Tutte; Stanley, Theorem 10.4 and the note after it, p. 193, for connected multidigraphs, which
are the weights in `ℕ`; the theorem for every weight function over every commutative ring is
proved here). No connectivity is assumed: when some vertex cannot reach `r` along arcs of nonzero
weight both sides are `0`.

Route: write row `v ≠ r` of the reduced Laplacian as `∑ᵤ w v u (e_v − e_u)`, where `e_u` is the
coordinate vector of `u` among the vertices other than `r` and `e_r = 0`. By multilinearity of the
determinant in its rows (`Matrix.det_updateRow_add` and its scalar form), the determinant is the
sum over all functions `p` from `V \ {r}` to `V` of `∏ w v (p v)` times the determinant `D(p)` of
the matrix with rows `e_v − e_(p v)`. If `p` has no cycle, order the vertices so that every `v`
comes after `p v`; then the matrix is unitriangular and `D(p) = 1`. If `p` has a cycle `C`, the
rows indexed by `C` sum to `0`, so `D(p) = 0`. The functions without cycles are the arborescences
converging to `r`. Stanley's route, induction on the number of arcs by splitting the arcs out of
one vertex, gives the statement for multidigraphs as well.

**Checks.**
- Two vertices with `w = [[a, b], [c, d]]`: deleting vertex `0` leaves the `1 × 1` matrix `[c]`,
  and `τ_w(0) = c`.
- Using the in-degree Laplacian instead, `diag(∑ᵤ w u v) − w` without loops, gives
  `[[c, −b], [−c, b]]`; deleting vertex `0` leaves `[b]`, which counts the arborescence from `0`
  to `1`, not the one converging to `0`. So the out-degree Laplacian goes with arborescences
  converging to the root.
- One vertex: the reduced matrix is empty, with determinant `1 = τ_w(r)`.
- Two vertices and no arcs between them: `[0] = 0 = τ_w(0)`.
- Random integer weights of either sign on up to five vertices, loops included, and symbolic
  weights on three vertices: the two sides agree.

*Needs:* 1.1, 1.2; Mathlib `Matrix.submatrix`, `Matrix.det`, `Matrix.det_updateRow_add`,
`Matrix.det_updateRow_smul`. (Proved here, following the cited route.)

### 2.2 The adjugate

Prove `adjugate_outLaplacian`: over any commutative ring, `(outLaplacian w).adjugate i j =
arborescenceSum w j` for all `i`, `j`. With Mathlib's convention
`adjugate A i j = det (A.updateRow j (Pi.single i 1))`, this says that every cofactor along row
`j` of the Laplacian equals `τ_w(j)`, the diagonal one being 2.1. (Proved here.)

- Consequence, the algebraic form of the Markov chain tree theorem: the row vector `τ_w` satisfies
  `τ_w L(w) = 0` over every commutative ring. For a stochastic matrix this is `τ_P P = τ_P`; for a
  matrix `Q` with zero row sums it is `τ_Q Q = 0`, where `τ_Q` uses only the off-diagonal entries.

Route: the entries of the adjugate and the arborescence sums are polynomials with integer
coefficients in the weights, so it suffices to prove the identity for the weights given by
independent indeterminates over `ℤ`, and then in the fraction field `F` of that polynomial ring.
There the reduced determinant `τ_w(r)` is a nonzero polynomial (it contains the monomial of the
star of arcs into `r`), so `L(w)` has rank `n − 1`. From `L · adj L = det L · 1 = 0`
(`Matrix.mul_adjugate`) every column of `adj L` lies in the kernel of `L`, which is spanned by the
all-ones vector; so column `j` is constant, and its diagonal entry is `τ_w(j)` by 2.1. The
consequence follows from `adj L · L = det L · 1 = 0` (`Matrix.adjugate_mul`), the determinant
vanishing for nonempty `V`.

**Checks.**
- Two vertices: the adjugate of `[[b, −b], [−c, c]]` is `[[c, b], [c, b]]`, whose columns are
  `τ_w(0) = c` and `τ_w(1) = b`; and `(c, b) · [[b, −b], [−c, c]] = 0`.
- One vertex: `L = [0]`, its adjugate is `[1]`, and `τ_w = 1`.
- The rows of the adjugate are not constant in general: for the two-vertex weights they are
  `(c, b)`, not `(c, c)`.
- Random weights on up to five vertices: every entry agrees.

*Needs:* 2.1; Mathlib `Matrix.adjugate`, `Matrix.adjugate_apply`, `Matrix.mul_adjugate`,
`Matrix.adjugate_mul`, `Matrix.rank`, `MvPolynomial`, `FractionRing`.

### 2.3 Transposed, balanced and symmetric weights

- *Arborescences diverging from the root.* Applied to the transposed weights, 2.1 says that the
  principal minor at `r` of the in-degree Laplacian, which equals that of `L(w')`, is the weighted
  sum of the arborescences in which `r` reaches every vertex.
- *Balanced weights.* Prove: if `∑ᵤ w v u = ∑ᵤ w u v` for every `v`, then `arborescenceSum w r`
  does not depend on `r`, and it equals the arborescence sum of the transposed weights (Stanley,
  Corollary 10.3, p. 193, for connected balanced multidigraphs, derived there from the BEST
  theorem; for every balanced weight function over every commutative ring it is proved here).
  Route: under the hypothesis the out-degree Laplacian of the transposed weights is `L(w)ᵀ`, and
  `adj (Lᵀ) = (adj L)ᵀ` (`Matrix.adjugate_transpose`). By 2.2 the entry `(adj L) j i` is `τ_w(i)`
  and, read through the transpose, it is `τ_(w')(j)`; so `τ_w(i) = τ_(w')(j)` for all `i`, `j`.
- *Symmetric weights: the undirected matrix-tree theorem.* If `w u v = w v u` for all `u`, `v`,
  sending a spanning tree `T` of the complete graph on `V` to the parent function that maps each
  `v ≠ r` to its neighbour on the `T`-path from `v` to `r` is a bijection from spanning trees onto
  the arborescences converging to `r`, and it preserves the product of the edge weights, by
  symmetry. With zero diagonal, `L(w)` is the matrix `diag(row sums) − w` of GeometricTopology
  4.4.5, so the weighted matrix-tree identity owned there is the case of symmetric weights of 2.1;
  loops do not affect either side, so the zero diagonal is not needed for this deduction (Stanley,
  Example 10.6, p. 194, deduces the undirected theorem in the same way). This roadmap does not
  restate that identity.

**Checks.**
- The directed triangle `0 → 1 → 2 → 0` is balanced, and `τ = 1` at every root.
- The two-vertex weights `[[a, b], [c, d]]` are balanced exactly when `b = c`, and then
  `τ(0) = c = b = τ(1)`; when `b ≠ c` the two sums differ.
- On up to four vertices, all balanced weights with entries in `{0, 1, 2}` have `τ` independent
  of the root, including disconnected ones, where `τ = 0` at every root.
- Random symmetric weights on up to five vertices, with arbitrary loops: `τ_w(r)` equals the
  weighted sum over spanning trees for every `r`.

*Needs:* 2.1, 2.2; Mathlib `Matrix.adjugate_transpose`, `Matrix.transpose`. (Proved here, except as
cited.)

### Examples

The two-vertex weights in full; the complete digraph on `n` vertices with unit weights, whose
reduced Laplacian `n·1 − J` on `n − 1` coordinates has determinant `n^(n − 2)`; the bidirected
`3 × 3` grid, whose reduced Laplacian has determinant `192`, its number of spanning trees.

### Dependencies

Layer 1. Mathlib `Matrix.submatrix`, `Matrix.det`, `Matrix.det_updateRow_add`,
`Matrix.det_updateRow_smul`, `Matrix.adjugate`, `Matrix.adjugate_apply`, `Matrix.mul_adjugate`,
`Matrix.adjugate_mul`, `Matrix.adjugate_transpose`, `Matrix.transpose`, `Matrix.rank`,
`MvPolynomial`, `FractionRing`.

## Layer 3: the Markov chain tree theorem

### 3.1 The stationary law as a ratio of arborescence sums

Prove `stationary_iff_eq_arborescenceSum_div`: if `V` is nonempty, `P` is stochastic and
irreducible, then a vector `π : V → ℝ` has nonnegative entries summing to `1` and satisfies
`πP = π` if and only if `π v = τ_P(v) / ∑ᵤ τ_P(u)` for every `v` (Lyons and Peres, §4.4, p. 117,
with the weights `Ψ` of §4.1, p. 97, and Exercise 4.12, p. 118).

- If `P` is irreducible, `τ_P(v) > 0` for every `v`: every vertex has a path of positive entries
  to `v`, and joining such paths without cycles builds an arborescence converging to `v` with
  positive weight (Lyons and Peres, §4.1, p. 97).
- For a generator `Q` of a continuous-time chain on a nonempty finite set (nonnegative
  off-diagonal rates, rows summing to `0`) in which every state leads to every other through
  positive off-diagonal rates, the probability vectors with `πQ = 0` are likewise exactly
  `τ_Q / ∑ τ_Q`. Route: for `c > 0` with `c ≥ −Q v v` for every `v`, the matrix `1 + Q/c` is
  stochastic and irreducible, has the same stationary vectors, and its arborescence sums are
  `τ_Q / c^(n − 1)`, since arborescences use no diagonal entry; apply the theorem. This is a
  remark recorded as a consequence of the theorem, not a separate target; the existence and
  uniqueness of the stationary law of a generator are not claimed here.

Route: by 1.1 and 2.2, `τ_P (1 − P) = 0`, that is `Pᵀ τ_P = τ_P`, and `τ_P` has positive entries
by the first bullet, so the normalized vector is a stationary probability vector. If `π` is any
stationary vector, `Pᵀ π = π`; `Pᵀ` is irreducible (`Matrix.IsIrreducible.transpose`), so by Tau
Ceti's `Matrix.IsIrreducible.exists_eq_smul_of_mulVec_eq_smul` with the positive eigenvector `τ_P`
for the eigenvalue `1`, `π` is a multiple of `τ_P`, and the normalization fixes the multiple.

**Checks.**
- `P = [[2/3, 1/3], [1/2, 1/2]]`: `τ_P = (1/2, 1/3)` and `π = (3/5, 2/5)`; indeed
  `3/5 · 2/3 + 2/5 · 1/2 = 3/5`.
- One state: `P = [1]`, `τ_P = 1` and `π = 1`.
- Irreducibility is needed: for `P = 1` on two states every probability vector is stationary,
  while `τ_P = (0, 0)` and the right-hand side is the zero vector.
- Nonemptiness is needed: on the empty type no vector has entries summing to `1`, while the
  right-hand side is the unique function on the empty type.
- The generator `[[−1, 1], [2, −2]]` has `τ = (2, 1)` and stationary law `(2/3, 1/3)`; the
  birth–death generator `[[−1, 1, 0], [2, −3, 1], [0, 2, −2]]` has `τ = (4, 2, 1)` and stationary
  law `(4/7, 2/7, 1/7)`.
- Random stochastic matrices with rational entries on up to four states: whenever
  `∑ τ_P ≠ 0` the stationary vectors form one line, through `τ_P`; when `∑ τ_P = 0` they form a
  space of dimension at least two.

*Needs:* 1.1, 2.2; Mathlib `Matrix.rowStochastic`, `Matrix.mem_rowStochastic_iff_sum`,
`Matrix.IsIrreducible`, `Matrix.IsIrreducible.transpose`, `Matrix.vecMul`; Tau Ceti
`Matrix.IsIrreducible.exists_eq_smul_of_mulVec_eq_smul`. (Proved here, except as cited.)

### Examples

Two-state chains in general, `τ_P = (P 1 0, P 0 1)`; the birth–death generator above; the simple
random walk on a cycle, whose stationary law is uniform because the transition matrix is balanced
and 2.3 applies.

### Dependencies

Layer 2. Mathlib `Matrix.rowStochastic`, `Matrix.mem_rowStochastic_iff_sum`,
`Matrix.IsIrreducible`, `Matrix.IsIrreducible.transpose`, `Matrix.vecMul`; Tau Ceti
`Matrix.IsIrreducible.exists_eq_smul_of_mulVec_eq_smul`.

## Layer 4: Eulerian digraphs

### 4.1 Degrees and Eulerian circuits

Define, for an arrow family `Q` with finitely many arrows between any two vertices,
`outDegree Q v` as the cardinality of `Σ u, Q v u` and `inDegree Q v` as that of `Σ u, Q u v`.
Define `IsEulerianCircuit c` for a closed walk `c : TauCeti.ArrowWalk Q s s`: `c.arrows` has no
repetition and contains every arrow `⟨x, y, e⟩` of `Q`.

- The sum of the out-degrees and the sum of the in-degrees both equal the number of arrows.
- A loop at `v` adds `1` to both degrees of `v`.

**Checks.**
- If no arrow exists, the walk of length zero at any vertex is an Eulerian circuit.
- One vertex with three loops: six Eulerian circuits, the orders of the three loops.
- The directed triangle with a fourth, isolated vertex has an Eulerian circuit at each vertex of
  the triangle and none at the isolated vertex, since a closed walk there has length zero.

*Needs:* Tau Ceti `TauCeti.ArrowWalk`, `TauCeti.ArrowWalk.arrows`, `TauCeti.ArrowWalk.arrows_cons`;
Mathlib `Fintype.card`, `List.Nodup`. (Proved here.)

### 4.2 Euler's criterion

Prove `exists_isEulerianCircuit_iff`: if `V` is nonempty, some vertex carries an Eulerian circuit
if and only if `inDegree Q v = outDegree Q v` for every `v` and any two vertices of positive
out-degree are joined by a zigzag (Good; Stanley, Theorem 10.1, p. 190, for digraphs without
isolated vertices, where the condition is that the digraph is connected; isolated vertices are
allowed here).

- A balanced multidigraph in which any two vertices of positive out-degree are joined by a zigzag
  has a directed walk between any two such vertices: following an Eulerian circuit gives one.

Route: along an Eulerian circuit each visit of a vertex enters and leaves it once, the first
departure from `s` being paired with the last arrival, so the degrees balance, and the circuit
passes through every vertex of positive out-degree. Conversely, take a closed walk without
repeated arrows of greatest length starting with any arrow; at an unused arrow whose source lies
on the walk, which exists by the zigzag condition, the unused arrows form a balanced family
containing a closed walk without repeated arrows from that source, and splicing it in lengthens
the walk (Stanley, proof of Theorem 10.1, pp. 190–191).

**Checks.**
- Two vertices with one loop each: balanced, no Eulerian circuit; the two vertices have positive
  out-degree and no zigzag joins them.
- Two arrows from `0` to `1` and one from `1` to `0`: joined, not balanced, no Eulerian circuit.
- On the empty vertex type both conditions hold vacuously and no vertex carries a walk; so `V`
  must be nonempty.
- On all multidigraphs on at most three vertices with at most seven arrows, at most two parallel
  arrows and loops allowed, the two sides agree.

*Needs:* 4.1; Tau Ceti `TauCeti.ArrowWalk`, `TauCeti.ArrowWalk.arrows`,
`TauCeti.ArrowWalk.comp`; Mathlib `Relation.ReflTransGen`. (Proved here, following the cited
route.)

### Examples

The directed cycle, the bidirected path on three vertices (every edge doubled into two opposite
arrows), the directed triangle with an isolated vertex, and two vertices with a loop each.

### Dependencies

Tau Ceti `TauCeti.ArrowWalk`, `TauCeti.ArrowWalk.arrows`, `TauCeti.ArrowWalk.arrows_cons`,
`TauCeti.ArrowWalk.comp`; Mathlib `Fintype.card`, `List.Nodup`, `Relation.ReflTransGen`. No other
layer.

## Layer 5: the BEST theorem and de Bruijn sequences

### 5.1 The BEST theorem

Prove `card_isEulerianCircuit_head_eq`: if `inDegree Q v = outDegree Q v` and `0 < outDegree Q v`
for every `v`, then for every arrow `e : Q s t` the number of Eulerian circuits at `s` whose first
arrow is `e` equals `arborescenceSum m s * ∏ v, (outDegree Q v − 1)!`, where `m u v` is the
number of arrows from `u` to `v` (van Aardenne-Ehrenfest and de Bruijn; Stanley, Theorem 10.2,
p. 191, for connected balanced digraphs). Connectivity is not assumed: a balanced multidigraph in
which every vertex has an arrow and which is not connected by zigzags has no Eulerian circuit and
no arborescence, so both sides are `0`.

- With 2.1: the number is `det L₀ · ∏ v, (outDegree Q v − 1)!`, where `L₀` is the out-degree
  Laplacian of `m` with the row and column of `s` deleted, computed in `ℤ` (Stanley, Corollary
  10.5, p. 194).
- The number of Eulerian circuits at `s` is `outDegree Q s` times this number, and with 2.3 it
  does not depend on the first arrow (Stanley, Corollary 10.3, p. 193).

Route (Stanley, proof of Theorem 10.2, pp. 191–192): for an Eulerian circuit starting with `e`,
the last arrows leaving the vertices `v ≠ s` form an arborescence converging to `s`. Conversely,
given such an arborescence `T`, the circuits starting with `e` whose last exits are `T` are those
that leave each `v ≠ s` along its other arrows in some order and then along its arrow of `T`, and
leave `s` first along `e` and then along its other arrows in some order: `(outdeg v − 1)!` orders
at every vertex, and every such choice gives an Eulerian circuit, because the walk can only stop
at `s` and an unused arrow would lead, through `T`, to an unused last exit.

**Checks.**
- One vertex with three loops: `2 = 1 · 2!` circuits start with a given loop.
- The directed cycle on `n` vertices: one circuit from each arrow, `τ = 1`, and every factor is
  `0! = 1`.
- The bidirected `3 × 3` grid: `192 · (1!)^4 · (2!)^4 · 3! = 18432` circuits start with a given
  arrow, and `18432 · 24 = 442368` circuits in all, counted with their first arrow (Stanley,
  Example 10.7, p. 195).
- Positive out-degree is needed: a loop at `0` and an isolated vertex `1` give one circuit starting
  with the loop, while no arborescence converges to `0`.
- Balance is needed: two arrows from `0` to `1` and one from `1` to `0` give no Eulerian circuit,
  while `τ(0) · 1! · 0! = 1`.
- On all balanced multidigraphs with positive out-degrees on at most three vertices with at most
  seven arrows, loops and parallel arrows included, both sides agree for every first arrow.

*Needs:* 1.2, 4.1; Tau Ceti `TauCeti.ArrowWalk`, `TauCeti.ArrowWalk.arrows`; Mathlib
`Nat.factorial`, `Nat.card`, `Equiv.Perm`. (Proved here, following the cited route.)

### 5.2 De Bruijn sequences

Define `IsDeBruijn k n s` for a word `s : Fin (k ^ n) → Fin k`: every word `u : Fin n → Fin k`
occurs at exactly one position `i`, in the sense that `s ((i + j) mod kⁿ) = u j` for every
`j < n`. Prove `card_isDeBruijn`: for `n ≥ 1` the number of such words is `(k!)^(k^(n − 1))`
(Stanley, Corollary 10.11, p. 198, for `k = 2`; the general case is due to van Aardenne-Ehrenfest
and de Bruijn, as Stanley's notes to Chapter 10, p. 199, record, and is proved here).

Route: the de Bruijn graph has the words of length `n − 1` as vertices and one arrow from
`a₁ ⋯ aₙ₋₁` to `a₂ ⋯ aₙ₋₁ c` for each letter `c`; it is balanced, with all degrees `k`, and loops
occur at the constant words. Recording the last letter of each arrow is a bijection from the
Eulerian circuits, each with its first arrow, onto the de Bruijn sequences (Stanley, Example 10.8,
pp. 195–197, for two letters). From any vertex to any other there is exactly one walk of length
`n − 1` (Stanley, Lemma 10.9, p. 197, for two letters), so the adjacency matrix `A` has
`A^(n − 1) = J`, the Laplacian is `k·1 − A`, and the reduced determinant is `k^(k^(n − 1) − n)`
(Stanley, Theorem 10.10, p. 197, which finds the eigenvalues of the Laplacian for two letters, with
Lemma 9.9, p. 177; the argument is the same for `k` letters). By 5.1 each of the `kⁿ` arrows starts
`k^(k^(n − 1) − n) · ((k − 1)!)^(k^(n − 1))` circuits, and the product is `(k!)^(k^(n − 1))`. For
`k = 0` both sides are `1`, the empty word.

**Checks.**
- `k = 2`: `2, 4, 16, 256` sequences for `n = 1, 2, 3, 4`, that is `1, 1, 2, 16` up to rotation;
  the two classes for `n = 3` are those of `00010111` and `00011101`.
- `k = 3`: `6` sequences for `n = 1` and `216` for `n = 2`; `k = 4`, `n = 1`: `24`.
- `k = 1`: one sequence for every `n`. `k = 0`: one sequence, the empty word, for every `n ≥ 1`.
- The bound `n ≥ 1` is needed: for `n = 0` every one-letter word qualifies, `k` words, while the
  formula, with `n − 1` truncated to `0`, gives `k!`; for `k = 3` that is `3 ≠ 6`.
- The reduced determinants of the de Bruijn graphs are `1, 2, 16` for `k = 2`, `n = 2, 3, 4`, and
  `3, 729` for `k = 3`, `n = 2, 3`, as `k^(k^(n − 1) − n)` predicts.

*Needs:* 1.2, 2.1, 5.1; Mathlib `Matrix.det`, `Nat.factorial`, `Nat.card`. (Proved here, except as
cited.)

### Examples

The de Bruijn graphs of order `n ≤ 4` on two letters and of order `n ≤ 3` on three letters, with
their Eulerian circuits and de Bruijn sequences.

### Dependencies

Layers 1, 2 and 4. Tau Ceti `TauCeti.ArrowWalk`, `TauCeti.ArrowWalk.arrows`; Mathlib
`Matrix.det`, `Nat.factorial`, `Nat.card`, `Equiv.Perm`.

## Scope and ownership

This roadmap owns the targets stated above: the out-degree Laplacian, arborescences by parent
functions and the arborescence sum; the directed matrix-tree theorem in its principal-minor and
adjugate forms, over every commutative ring, with its forms for transposed and balanced weights;
the Markov chain tree theorem for irreducible stochastic matrices (the generator form is a remark);
Euler's criterion for multidigraphs; the BEST theorem and the count of de Bruijn sequences.

Already in the libraries and therefore not targets:

- Mathlib's Laplacian of a simple graph, `SimpleGraph.lapMatrix`, with its symmetry, its vanishing
  determinant and its kernel, and Mathlib's `Quiver.Arborescence`, a class asserting a unique path
  from a root to every vertex, with `Quiver.geodesicArborescence`, the directed form of the
  existence of spanning trees; 1.1 and 1.2 compare the definitions here with both.
- Mathlib's stochastic and irreducible matrices and Tau Ceti's Perron–Frobenius theorem for
  irreducible matrices (`Matrix.IsIrreducible.exists_mulVec_eq_smul`,
  `Matrix.IsIrreducible.exists_eq_smul_of_mulVec_eq_smul`), which give the existence and
  uniqueness of a positive stationary vector; 3.1 uses the uniqueness and adds the formula.
- Tau Ceti's directed walks along an arrow family (`TauCeti.ArrowWalk`) and the weakly connected
  components of a quiver through its underlying graph.
- Tau Ceti's transition counts of words (`TauCeti.transitionCount`) and the theorem that two words
  with the same first letter and the same transition counts are rearrangements of each other
  (`TauCeti.exists_perm_comp_of_transitionCount_eq`). Counting the words with prescribed
  transition counts, a consequence of 5.1, is not a target here.

Left to other roadmaps:

- GeometricTopology 4.4.5 owns the weighted matrix-tree identity for symmetric weights with zero
  diagonal over every commutative ring and its comparison with `SimpleGraph.lapMatrix`. 2.3 above
  records how it is the symmetric case of 2.1 and does not restate it.
- MarkovChainsAndRenewal, Layer 3, owns the existence and uniqueness of an invariant
  probability for irreducible positive recurrent chains on countable spaces, with
  `π({x}) = 1/m_x`; 3.1 is a formula for that law on a finite space by arborescence sums.
- GraphConnectivityAndFlows lists Edmonds' disjoint arborescences as outside its scope; they are
  outside this one too.
- SpanningTreesAndShortestPaths (an open roadmap, not on main), Layer 4, proves Euler's theorem for
  finite simple graphs with Mathlib's `SimpleGraph.Walk.IsEulerian` and leaves Euler tours of
  directed graphs and multigraphs outside its scope. Its statement concerns undirected simple
  graphs and even degrees; 4.2 above concerns arrow families and balanced degrees. This roadmap
  does not depend on that one.
- ContinuousTimeMarkovChains (a roadmap not on main), 4.3, proves the existence and
  uniqueness of the stationary law of an irreducible Q-matrix and leaves formulas for it in terms
  of spanning trees outside its scope; the second bullet of 3.1 is such a formula. This roadmap
  does not depend on that one.
- ElectricalNetworksAndRandomWalks (a roadmap not on main) treats harmonic functions,
  effective resistance and commute times on undirected weighted graphs and does not use spanning
  trees. This roadmap does not depend on that one.

Outside the scope: the all-minors matrix-tree theorem and forests rooted at several vertices;
spanning trees of undirected graphs beyond the deduction in 2.3; the deletion–contraction
recursion; random spanning trees and their sampling; eigenvalues of Laplacians of regular graphs;
Eulerian trails that are not closed; undirected Eulerian multigraphs; counts of Eulerian
circuits of undirected graphs; existence of de Bruijn sequences by explicit constructions;
procedures for finding Eulerian circuits or arborescences; infinite graphs.

## Exact supplier contracts

### From Mathlib

- `Mathlib/LinearAlgebra/Matrix/Defs.lean`: `Matrix.of`, `Matrix.submatrix`, `Matrix.transpose`.
  `Mathlib/Data/Matrix/Diagonal.lean`: `Matrix.diagonal`. `Mathlib/Data/Matrix/Mul.lean`:
  `Matrix.vecMul` (the row vector `v` times `M`).
- `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean`: `Matrix.det`; `Matrix.det_updateRow_add`
  (`(M.updateRow j (u + v)).det = (M.updateRow j u).det + (M.updateRow j v).det`) and
  `Matrix.det_updateRow_smul` (the determinant is linear in each row).
- `Mathlib/LinearAlgebra/Matrix/Adjugate.lean`: `Matrix.adjugate`; `Matrix.adjugate_apply`
  (`A.adjugate i j = (A.updateRow j (Pi.single i 1)).det`); `Matrix.mul_adjugate`
  (`A * A.adjugate = A.det • 1`); `Matrix.adjugate_mul` (`A.adjugate * A = A.det • 1`);
  `Matrix.adjugate_transpose` (`(adjugate A)ᵀ = adjugate Aᵀ`).
- `Mathlib/LinearAlgebra/Matrix/Rank.lean`: `Matrix.rank`. `MvPolynomial` and `FractionRing` for
  the reduction to indeterminate weights in 2.2.
- `Mathlib/LinearAlgebra/Matrix/Stochastic.lean`: `Matrix.rowStochastic R n` (nonnegative entries
  and `M *ᵥ 1 = 1`); `Matrix.mem_rowStochastic_iff_sum` (nonnegative entries and every row sum
  `1`).
- `Mathlib/LinearAlgebra/Matrix/Irreducible/Defs.lean`: `Matrix.IsIrreducible` (nonnegative
  entries, and the quiver with an arrow `i ⟶ j` when `0 < A i j` is strongly connected, with
  paths of positive length); `Matrix.IsIrreducible.transpose`.
- `Mathlib/Combinatorics/SimpleGraph/LapMatrix.lean`: `SimpleGraph.lapMatrix` (degree matrix minus
  adjacency matrix); `SimpleGraph.degree_eq_sum_if_adj` (the degree is the row sum of the
  adjacency indicator).
- `Mathlib/Combinatorics/SimpleGraph/Connectivity/Connected.lean`:
  `SimpleGraph.reachable_iff_reflTransGen` (reachability is the reflexive transitive closure of
  adjacency).
- `Mathlib/Combinatorics/Quiver/Arborescence.lean`: `Quiver.Arborescence` (a root and a unique path
  from it to every vertex), `Quiver.geodesicArborescence`.
- Basic Mathlib: `Nat.iterate`, `Function.iterate_fixed`, `Finset.filter`, `Fintype.card`,
  `Nat.card`, `Nat.factorial`, `List.Nodup`, `Relation.ReflTransGen`, `Equiv.Perm`.

### From Tau Ceti

- `TauCeti/Combinatorics/Network/Walk.lean`: `TauCeti.ArrowWalk Q s t` (Mathlib's `Quiver.Path` for
  the quiver with arrow types `Q`); `TauCeti.ArrowWalk.arrows` (the traversed arrows in order, as
  elements of `Σ x y, Q x y`); `TauCeti.ArrowWalk.arrows_cons`
  (`(p.cons e).arrows = p.arrows ++ [⟨t, x, e⟩]`, so the first traversed arrow heads the list);
  `TauCeti.ArrowWalk.comp`. The statements of Layers 4 and 5 import this module.
- `TauCeti/Combinatorics/Quiver/UnderlyingGraph.lean`: `TauCeti.Quiver.underlyingGraph` and
  `TauCeti.Quiver.underlyingGraph_adj` (distinct vertices joined by an arrow in either direction),
  used in the Conventions to identify zigzags with reachability in the underlying graph.
- `TauCeti/LinearAlgebra/Matrix/PerronFrobenius/Irreducible.lean`:
  `Matrix.IsIrreducible.exists_eq_smul_of_mulVec_eq_smul` (over a linearly ordered field, if `A` is
  irreducible, `v` has positive entries, `A *ᵥ v = r • v` and `A *ᵥ w = r • w`, then `w = c • v`
  for some `c`); `Matrix.IsIrreducible.exists_mulVec_eq_smul` (a positive eigenvector exists for an
  irreducible real matrix on a nonempty type).
- `TauCeti/Combinatorics/Enumerative/TransitionCount.lean`: `TauCeti.transitionCount`,
  `TauCeti.exists_perm_comp_of_transitionCount_eq`, named in the scope only.

## References

- Richard P. Stanley, *Topics in Algebraic Combinatorics*, author's draft, version of 1 February
  2013 (`math.mit.edu/~rstan/algcomb/algcomb.pdf`), Chapter 9, Theorem 9.8, p. 176, and Lemma 9.9,
  p. 177; Chapter 10, pp. 189–199: Theorem 10.1, p. 190; Theorem 10.2, p. 191; Corollary 10.3 and
  Theorem 10.4, p. 193; Corollary 10.5 and Example 10.6, p. 194; Examples 10.7 and 10.8, p. 195;
  Lemma 10.9 and Theorem 10.10, p. 197; Corollary 10.11, p. 198; the notes, pp. 198–199. The page numbers are
  those printed in this draft, and the locators are to it.
- Russell Lyons and Yuval Peres, *Probability on Trees and Networks*, Cambridge University Press,
  2016; the corrected version of 19 August 2026 on R. Lyons's site
  (`rdlyons.pages.iu.edu/prbtree/book.pdf`), §4.1, p. 97, §4.4, p. 117, and Exercises 4.11 and
  4.12, p. 118.
- The theorems of Tutte (the directed matrix-tree theorem, 1948), Good (Euler's criterion for
  digraphs), van Aardenne-Ehrenfest and de Bruijn (the BEST theorem and the count of de
  Bruijn sequences, 1951) are named as Stanley's notes to Chapter 10 attribute them. The Markov
  chain tree theorem is named as Lyons and Peres name it; they refer to Anantharam and Tsoucas
  (1989) for its history.

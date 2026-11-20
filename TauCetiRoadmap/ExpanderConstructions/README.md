# Roadmap: expander constructions

**Summary.** An expander is a regular graph of small degree in which a random walk forgets its
starting point quickly. The usual measure is the second eigenvalue in absolute value of the
normalized adjacency matrix: the largest absolute value of an eigenvalue on the vectors with
coordinate sum zero, written `λ(G)`. A family of graphs of bounded degree with `λ` bounded away
from `1` is an expander family. This roadmap builds an explicit one by the zig-zag product of
Reingold, Vadhan and Wigderson. It takes a large graph and a small one whose vertices are the edge
labels at a vertex of the large one, and returns a graph on the product of the two vertex sets,
of degree the square of the degree of the small one, which is an expander when both are.

The graphs here are regular multigraphs with parallel edges and loops. A graph of degree `d` on a
finite vertex set `V` is given by a rotation map, an involution of `V × P` for a finite set `P` of
`d` ports: it sends `(v, i)` to `(w, j)` when the `i`-th edge at `v` leads to `w` and is the `j`-th
edge at `w`. Every symmetric matrix of natural numbers with all row sums `d` arises this way, and
for a `d`-regular simple graph on at least two vertices, `d λ` is the larger of `|λ₂|` and `|λₙ|`.

The main theorems are these.

- *Powers and tensor products.* For a rotation map and `t ≥ 1`, `λ(Gᵗ) = λ(G)ᵗ`. For two rotation
  maps with nonempty vertex and port sets, `λ(G ⊗ H) = max(λ(G), λ(H))`.
- *The zig-zag theorem.* If `G` has `d₁` ports and `H` is a graph on those `d₁` points, with
  `a = λ(G)` and `b = λ(H)`, then `λ(G ⓩ H)` is at most
  `(1 − b²) a/2 + √((1 − b²)² a² + 4b²)/2`, hence at most `a + b` and at most
  `1 − (1 − b²)(1 − a)/2`. The first bound is attained by the complete graphs on five and four
  vertices, with the edge labellings fixed in the first layer. The replacement product obeys a
  weaker bound of the same kind.
- *An explicit expander family.* If `H` has `d` ports, `d⁴` vertices and `λ(H) ≤ 1/4`, the graphs
  `G₀ = H²` and `G_(n+1) = G_n² ⓩ H` have `d^(4(n+1))` vertices, degree `d²` and `λ ≤ 1/2`.
  The base graph `H` is a hypothesis; such graphs exist for suitable large `d`, but none is
  constructed here.

The roadmap builds on Mathlib's matrices, Kronecker products, permutation matrices and spectral
theorem for Hermitian matrices, and on its simple graphs and their adjacency matrices.
SpectralGraphBounds proves the expander mixing lemma and the Alon–Boppana bound for simple
graphs in terms of the adjacency eigenvalues, which the comparison above translates into `λ`.
MarkovChainMixing relates the absolute spectral gap of a reversible chain, here `1 − λ` for a
connected graph, to its mixing time.

Layer 1 below defines rotation maps, their adjacency counts and `λ`, and compares them with
simple graphs. Layer 2 treats powers and tensor products. Layer 3 proves the zig-zag theorem and
the bound for the replacement product; it uses Layer 2 for the latter. Layer 4 assembles the
explicit family from Layers 2 and 3.

## Conventions

- **Rotation maps.** `V` and `P` are finite types (`Fintype`), with `[DecidableEq V]` where edges
  are counted. A rotation map is a function `R : V × P → V × P`; it describes an undirected
  regular multigraph of degree `Fintype.card P` when it is involutive, `Function.Involutive R`.
  Involutivity is a hypothesis of each theorem and not part of the data, so that the products
  are plain functions. A fixed point `R (v, i) = (v, i)` is a half-loop at `v`; two ports `i ≠ j`
  at `v` with `R (v, i) = (v, j)` form a loop. As in Reingold–Vadhan–Wigderson (§2.1, p. 165),
  the multigraph has loops and parallel edges and is given with its labelling of the edges at
  each vertex; the products below depend on the labelling, not only on the adjacency matrix.
- **Adjacency and the walk.** `adjCount R v w` is the number of ports `i` with
  `(R (v, i)).1 = w`, so a half-loop counts once on the diagonal and a loop twice. `normAdj R` is
  `adjCount R` divided by `Fintype.card P`, and is the zero matrix when `P` is empty.
- **The spectral parameter.** `secondEigenvalue R`, written `λ(R)`, is the supremum of
  `|xᵀ M x|` over real vectors `x` with `∑ x = 0` and `xᵀ x ≤ 1`, where `M = normAdj R`. The set
  always contains `0` and is bounded above by the operator norm of `M`, and the supremum is
  attained, since the admissible `x` form a compact set. On at most one vertex the only admissible
  `x` is `0` and `λ = 0`; with no ports `M = 0` and `λ = 0`. The quadratic form sees only the
  symmetric part `(M + Mᵀ)/2`. When `adjCount R` is not symmetric the value is defined but need
  not be an eigenvalue of `M`; every theorem below assumes `R` involutive, or (in 1.3) that
  `adjCount R` is the symmetric adjacency matrix of a simple graph.
  For an involutive `R` with ports, `M` is symmetric with the constant vector as eigenvector for
  `1`, and `λ(R)` is the largest absolute value of an eigenvalue of `M` restricted to the vectors
  with coordinate sum `0`; this is the quantity of Reingold–Vadhan–Wigderson, Definition 2.2,
  p. 167, and the `α` of an `(n, d, α)`-graph in Hoory–Linial–Wigderson, §2.4, p. 455.
- **Products.** The power, tensor, zig-zag and replacement products are functions of rotation
  maps. The zig-zag and replacement products of `R` on `V × P` and `S` on `P × Q` live on
  `(V × P) × (Q × Q)` and `(V × P) × Option Q`: the vertices of `S` are the ports of `R`, and the
  product has a cloud `{v} × P` for each vertex `v`. In the prose, `Rᵗ`, `R ⊗ S`, `R ⓩ S` and
  `R ⓡ S` denote them.
- **The zig-zag function.** `f(a, b) = (1 − b²) a/2 + √((1 − b²)² a² + 4b²)/2`, which is
  `zigZagBound a b`, with Mathlib's `Real.sqrt`.

## Layer 1: rotation maps and the spectral parameter

### 1.1 Rotation maps and adjacency counts

Define `adjCount` and `normAdj` as in the Conventions. API, for an involutive `R`:

- `adjCount R` is symmetric and each of its rows sums to `Fintype.card P`: `R` maps the ports at
  `v` leading to `w` bijectively onto the ports at `w` leading to `v`. So `normAdj R` is
  symmetric, and doubly stochastic (it lies in Mathlib's `doublyStochastic ℝ V`) when `P` is
  nonempty.
- `normAdj R` is a compression of the permutation matrix `Ã` of `R` on `V × P` (Mathlib's
  `Equiv.Perm.permMatrix` of `Function.Involutive.toPerm R`): with `C` the map summing a
  function on `V × P` over each set `{v} × P` and `d = Fintype.card P ≥ 1`,
  `normAdj R β = C (Ã (β ⊗ 𝟙_P / d))` for every `β : V → ℝ` (Reingold–Vadhan–Wigderson, proof
  of Claim 4.2, pp. 173–174).

Prove `exists_involutive_adjCount_eq`: every symmetric matrix `A` of natural numbers whose rows
all sum to `Fintype.card P` is `adjCount R` for some involutive `R : V × P → V × P`
(Reingold–Vadhan–Wigderson, §2.1, p. 166, use this correspondence without proof; proved here).

Route: list, for each `v`, the multiset of neighbours `w` with multiplicity `A v w`, and number
its `Fintype.card P` entries by `P` through an equivalence with `Fin (Fintype.card P)`. For
`v ≠ w` pair the `c`-th port of `v` towards `w` with the `c`-th port of `w` towards `v`, for
`c < A v w`; on the diagonal pair the `A v v` ports of `v` towards itself two by two, and make the
last one a fixed point when `A v v` is odd. The map so defined is an involution, and the ports of
`v` that it sends to `w` are the `A v w` ports listed for `w`.

**Checks.**

- The complete graph `Kₙ`, `n ≥ 2`, with ports `Fin (n − 1)` and
  `R (v, i) = (v + i + 1, n − 2 − i)` (vertices modulo `n`) is involutive, and its adjacency
  counts are `1` off the diagonal and `0` on it (for `n = 5`, every entry computed).
- The complete graph with a loop at each vertex, ports `Fin n` and `R (v, i) = (i, v)`, is
  involutive with fixed points `(v, v)`, and every adjacency count is `1`. A convention counting a
  half-loop twice would give row sums `n + 1`, not the degree `n`.
- One vertex with two ports: the identity and the swap of the two ports are different rotation
  maps with the same adjacency count `2`, the first with two half-loops and the second with one
  loop.
- Necessity of the hypotheses: `[[0, 1], [0, 1]]` has constant row sums `1` but is not symmetric,
  and `[[1, 1], [1, 0]]` is symmetric with row sums `2` and `1`; neither is an adjacency count
  matrix, since every adjacency count matrix of an involution is symmetric with constant row sums.

*Needs:* Mathlib `Function.Involutive`, `Matrix.IsSymm`, `Fintype.equivFin`, `doublyStochastic`.

### 1.2 The spectral parameter

Define `secondEigenvalue` as in the Conventions. API, for an involutive `R`:

- `0 ≤ λ(R) ≤ 1`, and for every `x` with coordinate sum `0`, `‖M x‖ ≤ λ(R) ‖x‖` and
  `|xᵀ M x| ≤ λ(R) xᵀ x`, where `M = normAdj R`.
- If `P` is nonempty, `M 𝟙 = 𝟙` and `M` maps the vectors with coordinate sum `0` to themselves.
  If moreover `V` has at least two elements, `λ(R)` is the largest absolute value of an
  eigenvalue of `M` with an eigenvector orthogonal to `𝟙`; equivalently, the largest of `|μ|`
  over all eigenvalues `μ` of `M` after one occurrence of the eigenvalue `1` is removed.
- `λ(R)` depends only on `adjCount R`.

Route: Mathlib's spectral theorem (`Matrix.IsHermitian.eigenvectorBasis`,
`Matrix.IsHermitian.mulVec_eigenvectorBasis`) applied to the symmetric `M`, with an orthonormal
eigenbasis whose first vector is `𝟙/√n`; the Rayleigh quotient of a symmetric matrix on an
invariant subspace is bounded by its largest eigenvalue in absolute value there, and attains it
at an eigenvector. The bound `λ ≤ 1` holds because a doubly stochastic matrix has operator norm
at most `1`. (Proved here.)

**Checks.**

- `Kₙ` with the labelling of 1.1: `λ = 1/(n − 1)` for `n ≥ 2`, so `λ(K₂) = 1` and `λ(K₅) = 1/4`.
- The complete graph with loops on `n` vertices has `M = J/n` and `λ = 0`.
- The cycle `Cₙ`, `n ≥ 3`, with ports `{0, 1}`, `R (v, 0) = (v + 1, 1)` and
  `R (v, 1) = (v − 1, 0)`: `λ(C₅) = cos(π/5) = (1 + √5)/4`, and `λ(C₄) = 1`. The eigenvalues of
  `M` for `C₄` are `1, 0, 0, −1`, so the second largest eigenvalue without absolute values would
  be `0`: that variant does not see bipartiteness.
- The 4-cycle with a half-loop at each vertex (a third port fixed by `R`) has adjacency
  eigenvalues `3, 1, 1, −1` and `λ = 1/3`.
- The identity of `V × P` on two vertices with one port (a half-loop at each of two vertices, a
  disconnected graph) has `M = I` and `λ = 1`.
- Dropping the condition `∑ x = 0` would give `1` for every involutive rotation map with nonempty
  `V` and `P`, through `x = 𝟙/√n`. For a non-involutive map it can exceed `1`: the map sending
  every `(v, 0)` to `(v₀, 0)`, on four vertices with one port, would give `3/2`.

*Needs:* 1.1; Mathlib `Matrix.IsHermitian.eigenvectorBasis`,
`Matrix.IsHermitian.mulVec_eigenvectorBasis`, `Matrix.dotProduct_mulVec`.

### 1.3 Simple graphs

Prove `card_mul_secondEigenvalue_eq`: let `G` be a simple graph on `V` with at least two
vertices, and let `R : V × P → V × P` have `adjCount R` equal to the adjacency matrix
`G.adjMatrix ℝ`, and let `d = Fintype.card P` (then `G` is automatically regular of degree `d`,
since every row of `adjCount R` sums to `d`). Then `d λ(R)` is the larger of `|λ₂|` and
`|λₙ|`, where `λ₁ ≥ λ₂ ≥ ⋯ ≥ λₙ` are Mathlib's `(G.isHermitian_adjMatrix ℝ).eigenvalues₀`
(indices `1` and `n − 1` of `Fin n`). By 1.1 such an `R` exists, involutive, for every
`d`-regular simple graph; the statement does not need `R` to be involutive, since `adjCount R`
is then symmetric. (This is the normalization of Hoory–Linial–Wigderson, §2.4, p. 455.)

Route: `normAdj R = A/d` for `d ≥ 1`. The vector `𝟙` is an eigenvector of `A` for `d`, and
`d = λ₁` (every eigenvalue of `A` has absolute value at most `d`, the row sum). Choose an
orthonormal eigenbasis of `A` whose first vector is `𝟙/√n` and order it by nonincreasing
eigenvalue; by Tau Ceti's `LinearMap.IsSymmetric.eigenvalues_eq_of_eigenbasis` its eigenvalues
are `λ₁, …, λₙ`, so the eigenvalues of `A` on `𝟙^⊥` are `λ₂, …, λₙ` and 1.2 gives the claim.
For `d = 0` both sides are `0`. (Proved here.)

**Checks.**

- `K₅`: `4 · 1/4 = 1 = max(|−1|, |−1|)`.
- The Petersen graph (3-regular, adjacency eigenvalues `3`, `1` five times, `−2` four times):
  `3 λ = max(1, 2)`, so `λ = 2/3`.
- `C₄`: `2 · 1 = max(|0|, |−2|)`.
- On two vertices joined by an edge, `λ₂ = −1` and `λ(R) = 1` for the 1-regular rotation map.

*Needs:* 1.1, 1.2; Mathlib `SimpleGraph.adjMatrix`, `SimpleGraph.isHermitian_adjMatrix`,
`Matrix.IsHermitian.eigenvalues₀`, `Matrix.IsHermitian.eigenvalues₀_antitone`; Tau Ceti
`LinearMap.IsSymmetric.eigenvalues_eq_of_eigenbasis`.

### Examples

Complete graphs with and without loops, cycles with and without half-loops, the Petersen graph,
and the identity rotation map, with the values of the Checks.

### Dependencies

Mathlib's matrices, spectral theorem and simple-graph adjacency matrices; Tau Ceti
`LinearMap.IsSymmetric.eigenvalues_eq_of_eigenbasis`. No other layer.

## Layer 2: powers and tensor products

### 2.1 Powers

Define `rotationPower R t` on `V × (Fin t → P)`: starting at `v`, follow the ports `k 0, …,
k (t − 1)` through `R`; the output is the last vertex with the arrival ports listed in reverse
order, so that following the output ports retraces the walk (Reingold–Vadhan–Wigderson, §2.3,
p. 168). In the recursion the first step is taken by `R`, the remaining `t` steps by
`rotationPower R t` on `Fin.tail k`, and the first arrival port is appended last with
`Fin.snoc`. API:

- if `R` is involutive, so is `rotationPower R t`, by induction on `t`;
- `adjCount (rotationPower R t) = (adjCount R)ᵗ`, so `normAdj (rotationPower R t)` is
  `(normAdj R)ᵗ`; for `t = 0` it is the identity matrix.

Prove `secondEigenvalue_rotationPower`: for an involutive `R` and `t ≥ 1`,
`λ(rotationPower R t) = λ(R)ᵗ` (Reingold–Vadhan–Wigderson, Proposition 2.3, p. 168, there
stated as an upper bound for the eigenvalue parameter; the proof gives equality).

Route: by the API, the normalized matrix of the power is `Mᵗ`. For `P` nonempty, the eigenvalues
of `Mᵗ` on `𝟙^⊥` are the `t`-th powers of those of `M`, and `|μ|ᵗ` is largest where `|μ|` is
(1.2). For `P` empty and `t ≥ 1` both sides are `0`.

**Checks.**

- `C₅`: `λ(C₅²) = ((1 + √5)/4)² = (3 + √5)/8 ≈ 0.654`.
- `C₄²` has adjacency count `2` from `v` to `v` and to `v + 2` and `0` to `v ± 1`: it is
  disconnected, and `λ(C₄²) = 1 = λ(C₄)²`.
- `t = 0` is excluded: on one vertex `λ(R⁰) = 0`, while `λ(R)⁰ = 1`.
- Involutivity is needed: the map `(v, 0) ↦ (v + 1, 0)` on three vertices (a directed triangle)
  has `λ = 1/2` for itself and for its square, not `1/4`.

*Needs:* 1.2; Mathlib `Fin.snoc`, `Fin.tail`, `Matrix.IsHermitian.eigenvectorBasis`.

### 2.2 Tensor products

Define `rotationTensor R S` on `(V × W) × (P × Q)`, moving both coordinates at once
(Reingold–Vadhan–Wigderson, §2.3, p. 168). API: it is involutive when `R` and `S` are, and
`normAdj (rotationTensor R S)` is the Kronecker product of `normAdj R` and `normAdj S`.

Prove `secondEigenvalue_rotationTensor`: for involutive `R` and `S` with `V`, `W`, `P` and `Q`
nonempty, `λ(R ⊗ S) = max(λ(R), λ(S))` (Reingold–Vadhan–Wigderson, Proposition 2.4,
pp. 168–169, stated as an upper bound; its proof gives equality).

Route: with eigenbases `uᵢ` of `normAdj R` and `wⱼ` of `normAdj S` whose first vectors are
constant, the vectors `uᵢ ⊗ wⱼ` form an eigenbasis of the Kronecker product with eigenvalues
`μᵢ νⱼ` (Mathlib `Matrix.mul_kronecker_mul`), and those with `(i, j) ≠ (1, 1)` span `𝟙^⊥`. As
`|μᵢ|, |νⱼ| ≤ 1`, the largest `|μᵢ νⱼ|` there is attained at `j = 1` or `i = 1`.

**Checks.**

- `K₃ ⊗ C₅`: `λ = max(1/2, (1 + √5)/4) = (1 + √5)/4`.
- `K₂ ⊗ K₂` is the perfect matching on four vertices, with two components, and `λ = 1`.
- Nonempty ports are needed: the 0-regular graph on one vertex tensored with `C₅` has degree `0`
  and `λ = 0`, not `(1 + √5)/4`.
- Nonempty vertex sets are needed: with `V` empty and `S` the cycle `C₅`, the product has no
  vertices and `λ = 0`, not `(1 + √5)/4`.
- The single vertex with one half-loop is a unit: tensoring with it leaves `λ` unchanged.

*Needs:* 1.2; Mathlib `Matrix.kronecker`, `Matrix.mul_kronecker_mul`.

### Examples

Squares of cycles, products of complete graphs and cycles, with the values of the Checks.

### Dependencies

Layer 1; Mathlib `Fin.snoc`, `Fin.tail`, `Matrix.kronecker`, `Matrix.mul_kronecker_mul`.

## Layer 3: the zig-zag and replacement products

### 3.1 The zig-zag product

Define `zigZag R S` for `R : V × P → V × P` and `S : P × Q → P × Q`. From `(v, k)` with ports
`(i, j)`: let `S (k, i) = (k', i')`, then `R (v, k') = (w, ℓ')`, then `S (ℓ', j) = (ℓ, j')`, and
output `((w, ℓ), (j', i'))` (Reingold–Vadhan–Wigderson, Definition 3.1, p. 170;
Hoory–Linial–Wigderson, Definition 9.3, p. 510, for the edges). It is involutive when `R` and
`S` are, and its degree is `(Fintype.card Q)²`. Define `zigZagBound` as the function `f` of the
Conventions.

Prove `secondEigenvalue_zigZag_le`: for involutive `R` and `S`, with `a = λ(R)` and `b = λ(S)`,

    λ(R ⓩ S) ≤ f(a, b),   λ(R ⓩ S) ≤ a + b,   λ(R ⓩ S) ≤ 1 − (1 − b²)(1 − a)/2.

No other hypothesis is needed: with `P` or `Q` empty the product has no vertices or no ports and
`λ = 0`. The last two bounds are Hoory–Linial–Wigderson, Theorem 9.1 (2) and (3), p. 509, which
attributes them to Reingold–Vadhan–Wigderson and proves only `a + b + b²` (pp. 511–512). The
first is Reingold–Vadhan–Wigderson, Theorem 4.3, p. 175, whose list of properties of `f`
includes the second bound (item 4). A consequence is Hoory–Linial–Wigderson, Theorem 9.1 (1):
if `a < 1` and `b < 1` then `λ(R ⓩ S) < 1`, by the third bound.

Route (Reingold–Vadhan–Wigderson, §§4.1–4.2, pp. 171–177). Assume `P` and `Q` nonempty. The
normalized matrix of the product is `B̃ Ã B̃`, where `B̃ = I_V ⊗ normAdj S` acts inside each cloud
and `Ã` is the permutation matrix of the involution `R` of `V × P`, symmetric with `Ã² = I`.
Split `α ⊥ 𝟙` as `α∥ + α⊥`, with `α∥` constant on each cloud and `α⊥` of sum `0` on each cloud.
Then `B̃ α∥ = α∥`, `‖B̃ α⊥‖ ≤ b ‖α⊥‖` (by 1.2 for `S` in each cloud), `B̃ α⊥ ⊥ α∥`, and
`|⟨Ã α∥, α∥⟩| ≤ a ‖α∥‖²` because `α∥ = β ⊗ 𝟙_P / |P|` with `β ⊥ 𝟙` and the compression formula of
1.1 turns `⟨Ã α∥, α∥⟩` into `⟨normAdj R β, β⟩ / |P|`. The quantity to bound is
`⟨Ã (α∥ + B̃α⊥), α∥ + B̃α⊥⟩ / ‖α‖²`. Since `Ã` is the reflection in its `1`-eigenspace,
`⟨Ã y, y⟩ = cos 2θ ‖y‖²` with `θ` the angle between `y` and that eigenspace; writing `ψ` for the
angle of `α∥` with it, `φ` for the angle between `α∥` and `α`, and `φ'` for the angle between
`α∥` and `α∥ + B̃α⊥`, the constraints are `|cos 2ψ| ≤ a`, `tan φ' ≤ b tan φ` and
`|θ − ψ| ≤ φ'`. Maximizing `|cos 2θ| cos²φ / cos²φ'` under them gives `f(a, b)`: in the case
`φ' ≤ min(ψ, π/2 − ψ)` the maximum over `φ` is the larger root of a quadratic, which is `f`, and
in the other case the value is at most `2b²/(1 − a + b²(1 + a))`, which is at most `f(a, b)` on
`[0, 1]²`; `f` is increasing in both variables, so the exact parameters may be replaced by `a`
and `b`. The other two bounds follow from `0 ≤ a, b ≤ 1`: with `c = 1 − b²`,
`√(c² a² + 4b²) ≤ (1 + b²) a + 2b` because `c² ≤ (1 + b²)²`, which gives `f ≤ a + b`; and
`√(c² a² + 4 − 4c) ≤ 2 − c` because `a² ≤ 1`, which gives `f ≤ 1 − c(1 − a)/2`.

**Checks.**

- `K₅ ⓩ K₄` with the labellings of 1.1 (the vertices of `K₄` are the ports `Fin 4` of `K₅`): 20
  vertices of degree 9, adjacency characteristic polynomial
  `(x − 9)(x − 1)⁵(x + 1)⁶(x² + 2x − 9)⁴`, so `λ = (1 + √10)/9 ≈ 0.4625`. Here `a = 1/4`,
  `b = 1/3`, and `f(1/4, 1/3) = (1 + √10)/9`: the first bound is attained. The other bounds are
  `7/12` and `2/3`.
- The triangle with a half-loop at each vertex (ports `0` and `1` around the cycle, port `2`
  fixed), whose `λ` is `0`, zig-zag `K₃` (`b = 1/2`): `λ = 1/2 = a + b = f(0, 1/2)`, so the second
  bound is attained as well.
- The complete graph with loops on two vertices, zig-zag itself, is the complete graph with loops
  on four vertices: `λ = 0 = f(0, 0)`.
- `K₅ ⓩ C₄`: `λ(C₄) = 1`, the bounds give `f(1/4, 1) = 1`, and indeed `λ = 1`.
- Values of `f`: `f(a, 0) = a`, `f(0, b) = b`, `f(a, 1) = f(1, b) = 1`; and `f(1/4, 1/3)` is
  below the bound `a + b + b² = 25/36` proved in Hoory–Linial–Wigderson.

*Needs:* 1.1, 1.2; Mathlib `Function.Involutive.toPerm`, `Equiv.Perm.permMatrix`,
`Matrix.kronecker`, `Real.sqrt`.

### 3.2 The replacement product

Define `replacement R S` on `(V × P) × Option Q`: the port `some i` at `(v, k)` follows `S` inside
the cloud of `v`, and the port `none` follows `R` between clouds (Reingold–Vadhan–Wigderson,
Definition 6.3, p. 183; Hoory–Linial–Wigderson, §9.3, p. 510). It is involutive when `R` and `S`
are, of degree `D + 1` with `D = Fintype.card Q`.

Prove `secondEigenvalue_replacement_pow_three_le`: for involutive `R` and `S`, with
`p = D²/(D + 1)³`,

    λ(R ⓡ S)³ ≤ p f(λ(R), λ(S)) + (1 − p).

For `D ≥ 1`, `0 < p < 1`, so `λ(R ⓡ S) < 1` whenever `λ(R) < 1` and `λ(S) < 1`.

Route (Reingold–Vadhan–Wigderson, proof of Theorem 6.4, p. 183). The normalized matrix is
`M = (Ã + D B̃)/(D + 1)`. Expanding `M³`, the word `B̃ Ã B̃` occurs with coefficient
`D²/(D + 1)³ = p`, and `M³ = p B̃ Ã B̃ + (1 − p) C` with `C` symmetric and doubly stochastic, so
`|⟨C x, x⟩| ≤ ‖x‖²`. By 3.1, `|⟨B̃ Ã B̃ x, x⟩| ≤ f ‖x‖²` for `x ⊥ 𝟙`, and by 2.1 with `t = 3`,
`λ(M)³ = λ(M³)`. For `D = 0`, `p = 0` and the bound reads `λ³ ≤ 1`. As printed, Theorem 6.4
bounds the cube by `p + (1 − p) f`, with `p` and `1 − p` exchanged; the decomposition of `M³` in
its proof gives the form above (the balanced product of its Theorem 6.7, p. 184, is printed in
that orientation, `7/8 + f/8`). The first Check below is an instance where the printed form fails.

**Checks.**

- The complete graph with loops on two vertices, replacement with itself: four vertices of
  degree 3 with adjacency matrix `[[2, 1, 0, 0], [1, 1, 1, 0], [0, 1, 1, 1], [0, 0, 1, 2]]` and
  eigenvalues `3, 1, 1 + √2, 1 − √2`, so `λ = (1 + √2)/3 ≈ 0.805`. Here `λ(R) = λ(S) = 0`,
  `D = 2`, `p = 4/27`, and `λ³ = (7 + 5√2)/27 ≈ 0.521 ≤ 23/27`; the printed form
  `p + (1 − p) f = 4/27` fails, since `λ³ > 4/27`. The third bound of 3.1, `1/2`, also fails for
  the replacement product as defined here.
- `K₅ ⓡ K₄`: 20 vertices of degree 4, adjacency eigenvalues `4`, `3` four times, `0` five times,
  `−1` four times and `−2` six times, so `λ = 3/4`; `27/64 ≤ (9/64) f(1/4, 1/3) + 55/64 ≈ 0.924`.

*Needs:* 2.1, 3.1.

### Examples

The zig-zag and replacement products of complete graphs, cycles and complete graphs with loops,
with the values of the Checks.

### Dependencies

Layer 1 (3.1); Layers 1 and 2 and 3.1 (3.2); Mathlib `Function.Involutive.toPerm`,
`Equiv.Perm.permMatrix`, `Matrix.kronecker`, `Real.sqrt`.

## Layer 4: an explicit family of expanders

### 4.1 Iterated squaring and zig-zag

Define `relabelPorts e R` for an equivalence `e : P ≃ P'`, which renames the ports along `e`; it
is involutive when `R` is, and has the same `adjCount`, so the same `λ`. Define the vertex types
`zigZagFamilyVertex W n`, which are `W` for `n = 0` and `zigZagFamilyVertex W n × W` for `n + 1`,
with their instances `instFintypeZigZagFamilyVertex` and `instDecidableEqZigZagFamilyVertex`.
For `H : W × Q → W × Q` and `e : (Fin 2 → Q × Q) ≃ W`, define `zigZagFamily H e n` by

    G₀ = H²                (ports renamed to Q × Q by piFinTwoEquiv),
    G_(n+1) = (G_n²) ⓩ H   (ports of G_n² renamed by e).

The equivalence `e` says that `H` has `d⁴` vertices for `d = Fintype.card Q`, the degree of
`G_n²`, as the zig-zag product requires.

Prove `zigZagFamily_spec`: if `H` is involutive and `λ(H) ≤ 1/4`, then for every `n` the rotation
map `G_n` is involutive, its vertex type has `(Fintype.card W)^(n+1) = d^(4(n+1))` elements, its
degree is `d²`, and `λ(G_n) ≤ 1/2` (Hoory–Linial–Wigderson, Proposition 9.2, p. 509, where `G_n`
is our `G_(n−1)`; Reingold–Vadhan–Wigderson, Theorem 1.4, p. 161, with the constant `1/5` for
`H` and `2/5` for the family, from the weaker zig-zag bound).

Route: induction on `n`. `λ(G₀) = λ(H)² ≤ 1/16` by 2.1. If `λ(G_n) ≤ 1/2`, then
`λ(G_n²) ≤ 1/4` by 2.1, renaming the ports keeps it, and the second bound of 3.1 gives
`λ(G_(n+1)) ≤ 1/4 + 1/4`. The vertex count is `Fintype.card_prod` at each step.

**Checks.**

- `d = 1`: `W` has one point and `H` is the half-loop; every `G_n` is one vertex with one port,
  and `λ = 0`.
- `d = 2` admits no base graph: a connected 2-regular multigraph on 16 vertices is the 16-cycle,
  with `λ = 1`, or the path with a half-loop at each end, with adjacency eigenvalues
  `2 cos(πk/16)` for `0 ≤ k ≤ 15` and `λ = cos(π/16) ≈ 0.981`; a disconnected one has `λ = 1`.

Beyond the degenerate case `d = 1`, the hypothesis on `H` is satisfiable, and no base graph is
constructed here. Hoory–Linial–Wigderson (§9.2, p. 509) note that a probabilistic argument gives
such an `H` for some `d`. An explicit one comes from Reingold–Vadhan–Wigderson §5: their graph
`AP_q` on the plane `𝔽_q × 𝔽_q` is `q`-regular with `λ = 1/√q` for every prime power `q` (Lemma 5.1,
p. 178), and `AP_q ⊗ AP_q` followed by two zig-zag products with `AP_q` is a `q²`-regular graph on
`q⁸` vertices with `λ ≤ 3/√q` (Proposition 5.2 with its footnote 3, p. 178; here by 2.2 and the
second bound of 3.1). With `d = q²` and a prime power `q ≥ 144` (for instance `q = 149`) this `H`
satisfies the hypothesis.

*Needs:* 2.1, 3.1; Mathlib `piFinTwoEquiv`, `Fintype.card_prod`.

### Examples

The case `d = 1` and the obstruction at `d = 2`, as in the Checks, and the affine-plane base
graphs of Reingold–Vadhan–Wigderson for `d = q²` with `q` a prime power at least `144`, which
are cited and not constructed.

### Dependencies

Layers 2 (2.1) and 3 (3.1); Mathlib `piFinTwoEquiv`, `Fintype.card_prod`.

## Scope and ownership

This roadmap owns the targets stated above: rotation maps of regular multigraphs with loops, their
adjacency counts and normalized adjacency matrices, the realization of symmetric
natural-number matrices with constant row sums, the spectral parameter `λ` and its comparison
with the adjacency eigenvalues of simple graphs; powers and tensor products with their effect on
`λ`; the zig-zag product with the zig-zag theorem, and the replacement product with its bound;
and the explicit family obtained by iterated squaring and zig-zag from a base graph.

Already in the libraries and therefore not targets:

- Mathlib's `Graph` (`Mathlib/Combinatorics/Graph/Basic.lean`) is a multigraph with edge
  identities, and Tau Ceti's `TauCeti.SerreGraph` (`TauCeti/Combinatorics/Graph/Serre/Basic.lean`)
  is a graph given by its darts with a fixed-point-free reversal. A rotation map without fixed
  points is a Serre graph with dart type `V × P` and initial vertex the first projection. The
  rotation map adds the labelling of the darts at each vertex by `P`, on which the products
  depend, and allows half-loops; neither library defines an adjacency matrix or a spectral
  parameter for these multigraphs.
- Mathlib's adjacency matrices of simple graphs and their sorted eigenvalues, Kronecker products,
  permutation matrices and the spectral theorem for Hermitian matrices, and Tau Ceti's
  Courant–Fischer theorem, are consumed.

Left to other roadmaps:

- SpectralGraphBounds owns, for simple graphs, the sorted adjacency eigenvalues (its Layer 1,
  the adjacency spectrum, 1.1), the expander mixing lemma (its Layer 4, edge distribution in
  regular graphs, 4.1) and the Alon–Boppana bound (its Layer 5, the second eigenvalue and the
  diameter, 5.2). By 1.3 above, its
  hypothesis `|λᵢ| ≤ β` for `i ≥ 2` holds with `β = d λ(R)` for any rotation map `R` realizing a
  `d`-regular graph. Neither statement is made here, for simple graphs or for multigraphs, and
  this roadmap does not depend on that one.
- MarkovChainMixing owns the absolute spectral gap and relaxation time of a reversible chain and
  the mixing bounds they give (its Layer 2, spectral theory, 2.2–2.3), and Cheeger's inequality
  (its Layer 3, the bottleneck ratio, 3.2). For involutive
  `R` with ports, `normAdj R` is the transition matrix of a chain reversible for the uniform law;
  when the graph is connected `λ(R) = 1 − γ⋆`, and for a disconnected graph `λ(R) = 1` while
  `1 − γ⋆` may be smaller, since that roadmap removes every occurrence of the eigenvalue `1`. No
  mixing statement is made here.
- KernelsAndSpectralMethods owns weighted graphs with loops, their normalized Laplacian and its
  spectrum (its Layer 1, weighted graphs and their Laplacians, 1.4), the Cheeger inequality for
  graphs (its Layer 3, conductance, 3.2) and the random walk of a weighted graph (its Layer 4,
  random walks and diffusion distances, 4.1). The matrix `adjCount R` of an involutive `R` with
  ports is such a weighted graph, with every degree equal to `d`; its normalized Laplacian is
  `I − normAdj R`, and for `n ≥ 2` vertices `λ(R) = max(1 − λ₁, λ_(n−1) − 1)` in terms of that
  roadmap's eigenvalues `0 = λ₀ ≤ λ₁ ≤ ⋯ ≤ λ_(n−1)`. Nothing of that roadmap is restated, and
  this roadmap does not depend on it.
- SpectralQuantumWalks treats Cartesian products of graphs, whose adjacency matrix is a Kronecker
  sum; the tensor product of 2.2 is the other product, with the Kronecker product as matrix.
- RandomWalksOnFiniteGroups owns random walks on finite groups and their analysis by characters,
  with the upper bound lemma (its Layer 2, 2.1). CoboundaryExpansion treats coboundary expansion of
  group-valued cochains on finite 2-complexes, a different notion. Neither is restated.
- SieveMethodsAndPrimePatterns (its Layer 5, 5.4, affine sieve data and saturation) states, after
  Bourgain–Gamburd–Sarnak, that Cayley graphs of congruence quotients `Γ/Γ(q)`, `q` squarefree,
  form a uniform expander family in the one-sided sense, a bound away from `1` on the second
  largest eigenvalue of the averaging operator of a symmetric generating set, and uses lazy walks
  to pass to mixing. A Cayley graph of a finite group `H` with a symmetric generating set `S` is
  the involutive rotation map `(h, s) ↦ (h s, s⁻¹)` with ports `S`, whose `normAdj` is that
  averaging operator; a bound `λ ≤ c < 1` implies the one-sided gap, but not conversely (a
  bipartite Cayley graph has `λ = 1`). Nothing of that roadmap is restated.

Outside the scope: Ramanujan graphs and their constructions; the Margulis and Gabber–Galil graphs
and their eigenvalue bound (Hoory–Linial–Wigderson, Theorem 8.2), whose proof needs an analysis on
the torus that is not taken up here; the algebraic base graphs of Reingold–Vadhan–Wigderson §5 and
any concrete base graph for Layer 4; the recursion with tensor products of their Theorem 3.3 and
the modified and balanced products of their §6; the expander mixing lemma, edge expansion and
Cheeger bounds for multigraphs; zig-zag products of bipartite graphs and conductors, lossless
expanders, and the semidirect product of groups; entropy arguments; and every procedure,
including the computation of rotation maps and the complexity-theoretic applications.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Logic/Function/Basic.lean`: `Function.Involutive f` (`∀ x, f (f x) = x`).
  `Mathlib/Logic/Equiv/Basic.lean`: `Function.Involutive.toPerm` (an involution as a permutation
  with `toFun = invFun = f`). `Mathlib/LinearAlgebra/Matrix/Permutation.lean`:
  `Equiv.Perm.permMatrix` (the permutation matrix of a permutation).
- `Mathlib/Analysis/Convex/DoublyStochasticMatrix.lean`: `doublyStochastic` (the nonnegative
  matrices whose rows and columns all sum to `1`), used in 1.1.
- `Mathlib/LinearAlgebra/Matrix/Symmetric.lean`: `Matrix.IsSymm` (`Aᵀ = A`).
  `Mathlib/Data/Matrix/Mul.lean`: `Matrix.dotProduct_mulVec`.
  `Mathlib/Data/Fintype/EquivFin.lean`: `Fintype.equivFin`. `Mathlib/Data/Fintype/Prod.lean`:
  `Fintype.card_prod`.
- `Mathlib/LinearAlgebra/Matrix/Kronecker.lean`: `Matrix.kronecker` and `Matrix.mul_kronecker_mul`
  (`(A * B) ⊗ₖ (A' * B') = (A ⊗ₖ A') * (B ⊗ₖ B')` over a commutative semiring, finite inner
  index types).
- `Mathlib/Analysis/Matrix/Spectrum.lean`: `Matrix.IsHermitian.eigenvectorBasis` (an orthonormal
  basis of eigenvectors, indexed by the rows), `Matrix.IsHermitian.mulVec_eigenvectorBasis`,
  `Matrix.IsHermitian.eigenvalues₀` (the eigenvalues indexed by `Fin (Fintype.card n)`) and
  `Matrix.IsHermitian.eigenvalues₀_antitone` (they are nonincreasing).
- `Mathlib/Combinatorics/SimpleGraph/AdjMatrix.lean`: `SimpleGraph.adjMatrix`.
  `Mathlib/Combinatorics/SimpleGraph/LapMatrix.lean`: `SimpleGraph.isHermitian_adjMatrix`.
- `Mathlib/Data/Fin/Tuple/Basic.lean`: `Fin.snoc`, `Fin.tail` and `piFinTwoEquiv`
  (`(∀ i : Fin 2, α i) ≃ α 0 × α 1`).
- `Mathlib/Analysis/Real/Sqrt.lean`: `Real.sqrt`.

### From Tau Ceti

- `TauCeti/Analysis/InnerProductSpace/CourantFischer.lean`:
  `LinearMap.IsSymmetric.eigenvalues_eq_of_eigenbasis` (an orthonormal basis diagonalizing a
  symmetric operator with a nonincreasing list of values gives the sorted eigenvalues), used in
  1.3.

## References

- Shlomo Hoory, Nathan Linial and Avi Wigderson, *Expander graphs and their applications*,
  Bulletin of the American Mathematical Society 43 (2006), 439–561; the copy on Nathan Linial's
  page (`www.cs.huji.ac.il/~nati/PAPERS/expander_survey.pdf`), with the journal's page numbers:
  §2.1, p. 452; §2.4, p. 455; Theorem 8.2, p. 503; Theorem 9.1, §9.2 and Proposition 9.2,
  p. 509; Definition 9.3 and the
  remarks after it, pp. 510–511; the proof of the zig-zag theorem, pp. 511–512.
- Omer Reingold, Salil Vadhan and Avi Wigderson, *Entropy waves, the zig-zag graph product, and
  new constant-degree expanders*, Annals of Mathematics 155 (2002), 157–187; arXiv:math/0406038,
  which carries the journal's pagination: Theorem 1.4, p. 161; §2.1 and Definitions 2.1–2.2,
  pp. 165–167; Propositions 2.3 and 2.4, pp. 168–169; Definition 3.1, p. 170; §4.1 with
  Claims 4.1–4.2, pp. 171–174; Theorem 4.3 and its proof, pp. 175–177; Lemma 5.1 and
  Proposition 5.2 with its footnote 3, p. 178; Definition 6.3 and Theorem 6.4, p. 183;
  Theorem 6.7, p. 184.

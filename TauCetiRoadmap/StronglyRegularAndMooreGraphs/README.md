# Roadmap: strongly regular and Moore graphs

**Summary.** A finite graph is strongly regular with parameters `(n, k, λ, μ)` when it has `n`
vertices, every vertex has `k` neighbours, any two adjacent vertices have exactly `λ` common
neighbours and any two distinct nonadjacent vertices exactly `μ`. These few counting conditions
force the adjacency matrix to satisfy a quadratic equation, so the graph has at most three distinct
eigenvalues, and the requirement that their multiplicities be whole numbers rules out most
parameter sets. This roadmap develops that argument and applies it to graphs in which any two
vertices have exactly one common neighbour, and to graphs as large as their degree and diameter
allow. Every statement is about a finite graph.

The headline theorems are these.

- *The spectrum and the rationality conditions.* A strongly regular graph that is not complete and
  has `μ > 0` has exactly three eigenvalues: its degree `k`, which is simple, and the two roots
  `r > s` of `x² − (λ − μ)x − (k − μ)`. Their multiplicities are given by explicit formulas in the
  parameters; since these are whole numbers, either the graph is a conference graph, with
  parameters `(4μ + 1, 2μ, μ − 1, μ)`, or `r` and `s` are integers.
- *Seidel's absolute bound.* If moreover `μ < k`, a strongly regular graph whose eigenvalues `r`
  and `s` have multiplicities `f` and `g` has at most `f(f + 3)/2` and at most `g(g + 3)/2`
  vertices.
- *The friendship theorem.* A finite graph with at least one vertex in which any two distinct
  vertices have exactly one common neighbour consists of triangles sharing one common vertex.
- *The Moore bound and the Hoffman–Singleton theorem.* A connected graph of diameter `D` whose
  degrees are at most `k` has at most `1 + k + k(k − 1) + ⋯ + k(k − 1)^(D − 1)` vertices; for
  `D ≥ 1` equality holds exactly when it is `k`-regular and has no cycle of length at most `2D`.
  A strongly regular graph with `λ = 0` and `μ = 1` that is not complete has `(n, k)` equal to
  `(5, 2)`, `(10, 3)`, `(50, 7)` or `(3250, 57)`. A `k`-regular graph of diameter two with
  `1 + k²` vertices is such a graph, so its degree is `2`, `3`, `7` or `57`; whether one of
  degree `57` exists is unknown.

The roadmap builds on Mathlib's strongly regular graphs, with their parameter and matrix
identities, and on its spectral theorem for real symmetric matrices. It sits beside
SpectralGraphBounds (a roadmap not on main), which bounds graph invariants by eigenvalues
and does not treat strongly regular graphs; this roadmap does not depend on it.

Layer 1 computes the spectrum and derives the rationality conditions and the absolute bound.
Layer 2 proves the friendship theorem from Layer 1. Layer 3 proves the Moore bounds, characterises
the graphs attaining them, and proves the Hoffman–Singleton theorem from Layer 1.

## Conventions

- **Graphs.** A graph is a Mathlib `SimpleGraph V` with `[Fintype V]`, `[DecidableEq V]` and
  `[DecidableRel G.Adj]`; `n = Fintype.card V`. Degrees are `SimpleGraph.degree`, regularity of
  degree `k` is `G.IsRegularOfDegree k`, and the common neighbours of `v` and `w` are
  `G.commonNeighbors v w`, counted by `Fintype.card`.
- **Strong regularity.** `G.IsSRGWith n k ℓ μ` is Mathlib's predicate: `n` vertices, `k`-regular,
  `ℓ` common neighbours for adjacent pairs and `μ` for distinct nonadjacent pairs (the prose
  writes `λ` for `ℓ`). Unlike the usual definition (Brouwer–Haemers, §9.1, p. 113), it does not
  exclude complete or edgeless graphs. The complete graph on `n` vertices satisfies
  `IsSRGWith n (n − 1) (n − 2) μ` for every `μ`, since it has no nonadjacent pair, and the graph
  without edges satisfies `IsSRGWith n 0 ℓ 0` for every `ℓ`; on at most one vertex both happen at
  once. The spectral statements below therefore assume `G ≠ ⊤` and `0 < μ`, which together exclude
  both: two distinct nonadjacent vertices exist and have `μ ≥ 1` common neighbours, so `k ≥ 1`.
- **Primitive.** A strongly regular graph is primitive when it and its complement are connected.
  For a graph with `G.IsSRGWith n k ℓ μ`, `G ≠ ⊤` and `k ≥ 1`, this is `0 < μ < k`
  (Brouwer–Haemers, §9.1.4, pp. 115–116); the absolute bound is stated under these hypotheses.
- **Eigenvalues.** `A = G.adjMatrix ℝ`. Its eigenvalues are the elements of `spectrum ℝ A`, and the
  multiplicity of a real number `θ` is the dimension of the eigenspace of `θ` for the linear map
  `Matrix.toLin' A`, which is `0` when `θ` is not an eigenvalue. Since `A` is symmetric this is
  also the algebraic multiplicity. With `Δ = (λ − μ)² + 4(k − μ)` the two restricted eigenvalues
  are `r = ((λ − μ) + √Δ)/2` and `s = ((λ − μ) − √Δ)/2`, defined from the parameters alone for
  every `k`, `λ`, `μ` (with `Real.sqrt`, which is `0` at negative arguments); `f` and `g` denote
  the multiplicities of `r` and `s`. No statement divides by `√Δ`: the multiplicity formulas are
  stated multiplied by `2√Δ`.
- **Distance and girth.** The diameter is Mathlib's `SimpleGraph.diam`, a natural number that is
  `0` for a graph that is not connected and for a graph on one vertex. The girth enters through
  Mathlib's `SimpleGraph.egirth`, valued in `ℕ∞`, the least length of a cycle and `⊤` for a graph
  without cycles; "no cycle of length at most `m`" is `m + 1 ≤ G.egirth`.
- **Moore numbers.** `mooreBound k d = 1 + k · ∑_(i < d) (k − 1)^i`, with natural-number
  subtraction. So `mooreBound k 0 = 1`, `mooreBound 0 d = 1`, `mooreBound 1 d = 2` for `d ≥ 1`,
  `mooreBound 2 d = 2d + 1`, and `mooreBound k 2 = 1 + k²` for every `k`.
- **Arithmetic.** Bounds of the form `n ≤ f(f + 3)/2` are stated as `2n ≤ f(f + 3)`; the conference
  condition `λ = μ − 1` is stated as `λ + 1 = μ`.

## Layer 1: the spectrum of a strongly regular graph

### 1.1 Imprimitive strongly regular graphs

This section is a remark that explains the hypotheses `0 < μ` and `μ < k` below; it is not a
headline theorem, no later section uses it, and `Suggested.lean` does not state it. A graph with
`G.IsSRGWith n k ℓ 0` is a disjoint union of complete graphs: any two vertices with a common
neighbour are adjacent, so adjacency or equality is an equivalence relation, each of whose classes
is a complete graph on `k + 1` vertices. A graph with `G.IsSRGWith n k ℓ k` is complete
multipartite: in its complement, nonadjacency or equality is an equivalence relation, each of whose
classes is a set of `n − k` pairwise nonadjacent vertices (Brouwer–Haemers, §9.1.4, pp. 115–116).
No hypothesis `G ≠ ⊤` is needed: the complete graph, with `μ = k = n − 1`, is complete multipartite
with classes of one vertex.

Route: for the first statement, if `u ~ v ~ w` with `u ≠ w` and `u`, `w` nonadjacent, then `v` is
a common neighbour of a nonadjacent pair, against `μ = 0`. For the second, if `k = 0` the graph has
no edges and is one class of `n` vertices. If `k ≥ 1`, Mathlib's `SimpleGraph.IsSRGWith.compl`
gives the complement the parameter `n − (2k − ℓ)` for nonadjacent pairs, and
`SimpleGraph.IsSRGWith.param_eq` with `μ = k ≥ 1` gives `k − ℓ − 1 = n − k − 1`, so `n = 2k − ℓ`
and that parameter is `0`; apply the first statement to the complement.

**Checks.**
- The disjoint union of three copies of `K₄` satisfies `IsSRGWith 12 3 2 0`, and its classes have
  `k + 1 = 4` vertices.
- `K_(2 × 10)`, two classes of ten pairwise nonadjacent vertices with every edge between them,
  satisfies `IsSRGWith 20 10 0 10`, with `μ = k = 10` and classes of `n − k = 10` vertices.
- The pentagon satisfies `IsSRGWith 5 2 0 1` with `0 < μ < k`; it is connected and so is its
  complement, another pentagon.

*Needs:* Mathlib `SimpleGraph.IsSRGWith`, `SimpleGraph.IsSRGWith.compl`,
`SimpleGraph.IsSRGWith.param_eq`. (Proved here.)

### 1.2 The spectrum

Define `srgDiscriminant k ℓ μ = (ℓ − μ)² + 4(k − μ)` and the two roots `srgEigenvalueR k ℓ μ` and
`srgEigenvalueS k ℓ μ` of `x² − (ℓ − μ)x − (k − μ)`, as in the Conventions. Prove
`spectrum_adjMatrix_of_isSRGWith`: if `G.IsSRGWith n k ℓ μ`, `0 < μ` and `G ≠ ⊤`, then the
spectrum of `A` is exactly `{k, r, s}`, and `s < r < k` (Brouwer–Haemers, Theorem 9.1.2, p. 115,
and Theorem 9.1.3 (ii), p. 116).

Route: Mathlib's `SimpleGraph.IsSRGWith.matrix_eq` gives `A² = kI + ℓA + μ(J − I − A)`, where the
adjacency matrix of the complement is `J − I − A`. The all-ones vector `𝟙` has `A𝟙 = k𝟙`
(`SimpleGraph.adjMatrix_mulVec_const_apply_of_regular`). For an eigenvector `v` orthogonal to `𝟙`
with eigenvalue `θ`, `Jv = 0` and the identity gives `θ² = (ℓ − μ)θ + (k − μ)`, so `θ ∈ {r, s}`;
since `A` is symmetric, `ℝⁿ` has an orthonormal eigenbasis containing `𝟙/√n`, so every eigenvalue
is `k`, `r` or `s`. The polynomial `x² − (ℓ − μ)x − (k − μ)` takes the value
`k(k − ℓ − 1) + μ(k + 1) = μ(n − k − 1) + μ(k + 1) = μn > 0` at `x = k` (by
`SimpleGraph.IsSRGWith.param_eq`), and `k ≥ ℓ + 1 > (ℓ − μ)/2`, so `k > r`; in particular no vector
orthogonal to `𝟙` has eigenvalue `k`. `Δ > 0`: if `ℓ ≠ μ` this is clear since `k ≥ μ`, and if
`ℓ = μ` then `k ≥ ℓ + 1 > μ`. Both `r` and `s` occur: if only one value `θ` occurred on the
orthogonal complement of `𝟙`, then `A = θI + ((k − θ)/n)J`, whose zero diagonal and constant
off-diagonal entries make `G` complete or edgeless, which `G ≠ ⊤` and `0 < μ` exclude.

**Checks.**
- The Petersen graph, `IsSRGWith 10 3 0 1`: `Δ = 1 + 8 = 9`, `r = 1`, `s = −2`, spectrum
  `{3, 1, −2}`.
- The pentagon, `IsSRGWith 5 2 0 1`: `Δ = 5`, `r = (√5 − 1)/2`, `s = −(√5 + 1)/2`.
- `K_(3 × 3)`, `IsSRGWith 9 6 3 6`: `Δ = 9`, `r = 0`, `s = −3`; an imprimitive graph with `μ > 0`
  is covered, and `r = 0` is an eigenvalue.
- `G ≠ ⊤` is needed: the complete graph `K₅` satisfies `IsSRGWith 5 4 3 1`, for which `Δ = 16`,
  `r = 3` and `s = −1`, but its spectrum is `{4, −1}`.
- `0 < μ` is needed: three disjoint copies of `K₄`, `IsSRGWith 12 3 2 0`, give `Δ = 16`, `r = 3 = k`
  and `s = −1`, so `r < k` fails (the spectrum `{3, −1}` is still `{k, r, s}` as a set).

*Needs:* Mathlib `SimpleGraph.IsSRGWith.matrix_eq`, `SimpleGraph.IsSRGWith.param_eq`,
`SimpleGraph.adjMatrix_mulVec_const_apply_of_regular`, `SimpleGraph.isHermitian_adjMatrix`,
`Matrix.IsHermitian.eigenvectorBasis`, `Matrix.IsHermitian.eigenvalues_mem_spectrum_real`,
`Matrix.spectrum_toLin'`, `Module.End.hasEigenvalue_iff_mem_spectrum`. (Proved here, following the
cited route.)

### 1.3 Multiplicities and the rationality conditions

Define `adjEigenMultiplicity G θ` as the dimension of the eigenspace of `θ` for `Matrix.toLin' A`.
Prove `adjEigenMultiplicity_of_isSRGWith`: if `G.IsSRGWith n k ℓ μ`, `0 < μ` and `G ≠ ⊤`, then `k`
has multiplicity `1`, and the multiplicities `f` of `r` and `g` of `s` satisfy

    2 f √Δ = (n − 1) √Δ − (2k + (n − 1)(ℓ − μ)),
    2 g √Δ = (n − 1) √Δ + (2k + (n − 1)(ℓ − μ))

(Brouwer–Haemers, Theorem 9.1.3 (iii), p. 116). Since `f` and `g` are natural numbers, the right
sides divided by `2√Δ` are natural numbers: these are the rationality conditions on the parameters.

- The Frame quotient: under the same hypotheses `f g (r − s)² = n k (n − 1 − k)`
  (Brouwer–Haemers, §9.1.8, p. 118).

The simplicity of `k` is the connected case of a general fact about regular graphs, that the
multiplicity of the degree is the number of connected components, which SpectralGraphBounds 1.4 (a
roadmap not on main) states for its sorted eigenvalue list; it is included here only as part of
the multiplicity statement, and this roadmap does not depend on that one.

Route: by the proof of 1.2, the eigenspace of `k` is spanned by `𝟙`, and the eigenspaces of `r` and
`s` together span the orthogonal complement of `𝟙`, so `1 + f + g = n`. The trace of `A` is `0`
(`SimpleGraph.trace_adjMatrix`) and is the sum of the eigenvalues with multiplicity
(`Matrix.IsHermitian.trace_eq_sum_eigenvalues`), so `k + fr + gs = 0`. With `r + s = ℓ − μ` and
`r − s = √Δ` this gives `(f − g)√Δ = −(2k + (n − 1)(ℓ − μ))`, and the two formulas follow. The Frame
quotient is algebra on these formulas and `rs = μ − k`.

**Checks.**
- The Petersen graph: `2f · 3 = 27 + 3 = 30` and `2g · 3 = 27 − 3 = 24`, so `f = 5`, `g = 4`; the
  Frame quotient is `5 · 4 · 9 = 180 = 10 · 3 · 6`.
- The Hoffman–Singleton graph, `IsSRGWith 50 7 0 1`: `Δ = 25`, `r = 2`, `s = −3`, `f = 28`,
  `g = 21`.
- The parameters `(3250, 57, 0, 1)`: `Δ = 225`, `r = 7`, `s = −8`, `f = 1729`, `g = 1520`; the
  rationality conditions hold.
- The parameters `(7, 3, 1, 1)` satisfy `k(k − λ − 1) = (n − k − 1)μ` (`3 = 3`), but `Δ = 8` and
  `(f − g)√8 = −6` has no solution in integers, so no graph has them.
- The multiplicity of `k` is not `1` when `μ = 0`: in three disjoint copies of `K₄` it is `3`.

*Needs:* 1.2; Mathlib `SimpleGraph.trace_adjMatrix`, `Matrix.IsHermitian.trace_eq_sum_eigenvalues`,
`Matrix.IsHermitian.eigenvectorBasis`, `Module.End.eigenspace`, `Matrix.toLin'`. (Proved here,
following the cited route.)

### 1.4 Conference graphs and integral eigenvalues

Prove `conference_or_integral_of_isSRGWith`: if `G.IsSRGWith n k ℓ μ`, `0 < μ` and `G ≠ ⊤`, then
either `n = 4μ + 1`, `k = 2μ` and `ℓ + 1 = μ` (a conference graph), or `r` and `s` are integers
(Brouwer–Haemers, Theorem 9.1.3 (iv) and §9.1.6, p. 116).

- In the conference case `f = g = 2μ`.

Route: if `f ≠ g`, the formula `(f − g)√Δ = −(2k + (n − 1)(ℓ − μ))` of 1.3 makes `√Δ` rational,
so `Δ` is the square of an integer (`irrational_sqrt_natCast_iff`, after writing `Δ` as an integer
that is nonnegative), and `r`, `s` are rational roots of a monic integer quadratic, hence integers.
If `f = g`, then `(μ − ℓ)(n − 1) = 2k`; since `0 < k < n − 1` (the graph is neither edgeless nor
complete) this forces `μ − ℓ = 1` and `n − 1 = 2k`, and then `SimpleGraph.IsSRGWith.param_eq`
gives `k − ℓ − 1 = μ`, so `k = 2μ` and `n = 4μ + 1`.

**Checks.**
- The pentagon and the Paley graph on 13 vertices, `IsSRGWith 13 6 2 3`, are conference graphs
  with irrational `r` and `s` (`Δ = 5` and `Δ = 13`).
- The `3 × 3` grid (the Paley graph on 9 vertices), `IsSRGWith 9 4 1 2`, is a conference graph
  whose eigenvalues `r = 1`, `s = −2` are integers: the two alternatives can hold together.
- The Petersen graph is not a conference graph (`10 ≠ 4 · 1 + 1`) and has integral `r = 1`,
  `s = −2`.

*Needs:* 1.3; Mathlib `SimpleGraph.IsSRGWith.param_eq`, `irrational_sqrt_natCast_iff`. (Proved
here, following the cited route.)

### 1.5 The absolute bound

Prove `two_mul_card_le_of_isSRGWith`: if `G.IsSRGWith n k ℓ μ`, `0 < μ < k` and `G ≠ ⊤`, then
`2n ≤ f(f + 3)` and `2n ≤ g(g + 3)` (Seidel's absolute bound; Brouwer–Haemers, §9.1.8, p. 118,
for primitive strongly regular graphs, proved there through Theorem 10.6.7 and Corollary 10.6.8,
p. 162; Brouwer–Van Maldeghem, Proposition 1.3.14, p. 27).

Route: let `E` be the orthogonal projection of `ℝⁿ` onto the eigenspace of `r`, of dimension `f`.
Since `E = (A − kI)(A − sI)/((r − k)(r − s))` and `A²` is a combination of `I`, `A` and `J`, the
entry `E_(xy)` depends only on whether `x = y`, `x ~ y` or neither; the numerator has the entries
`k(1 + s)`, `ℓ − k − s` and `μ` in these three cases. For a primitive graph `r > 0` and `s < −1`
(Brouwer–Haemers, §9.1.4, p. 116), so `k(1 + s) < 0 < μ`. Also `ℓ − k − s ≠ k(1 + s)`: otherwise
`‖E eₓ − E e_y‖² = E_(xx) + E_(yy) − 2E_(xy) = 0` for adjacent `x`, `y`, so all `E eₓ` are equal
since `G` is connected, hence equal to `E𝟙/n = 0`, and `E = 0`, against `f ≥ 1` (1.2). So the `n`
vectors `E eₓ`, rescaled to unit length, are distinct and have only two inner products `α`, `β`
between distinct members, both different from `1`. The functions `y ↦ (⟨uₓ, y⟩ − α)(⟨uₓ, y⟩ − β)` on the
unit sphere of the `f`-dimensional eigenspace take the value `(1 − α)(1 − β) ≠ 0` at `uₓ` and `0`
at the other `u_(x′)`, so they are linearly independent; on the sphere they lie in the span of the
quadratic forms and the linear forms, which has dimension `f(f + 1)/2 + f = f(f + 3)/2`, since the
constant `1` is the quadratic form `‖y‖²` there. The bound for `g` is the same argument with `r`
and `s` exchanged, where the entries are `k(1 + r) > 0`, `ℓ − k − r < 0` and `μ < k(1 + r)`.

**Checks.**
- The pentagon: `f = g = 2` and `2 · 5 = 10 = 2 · 5`, so both bounds hold with equality.
- The Petersen graph: `20 ≤ 5 · 8 = 40` and `20 ≤ 4 · 7 = 28`.
- The parameters `(28, 9, 0, 4)` satisfy `k(k − λ − 1) = (n − k − 1)μ` (`72 = 72`) and the
  rationality conditions, with `r = 1`, `s = −5`, `f = 21`, `g = 6`, but `56 > 6 · 9 = 54`, so the
  absolute bound excludes them (Brouwer–Haemers, §9.1.8, p. 118).
- `μ < k` is needed: `K_(2 × 10)` satisfies `IsSRGWith 20 10 0 10` with `G ≠ ⊤` and `μ > 0`; its
  eigenvalue `s = −10` has multiplicity `g = 1`, and `40 > 1 · 4`.
- `G ≠ ⊤` is needed: `K₅` satisfies `IsSRGWith 5 4 3 1` with `0 < μ < k`, but `r = 3` is not an
  eigenvalue, so `f = 0` and `10 > 0`.

*Needs:* 1.2, 1.3; Mathlib `SimpleGraph.IsSRGWith.matrix_eq`, `Matrix.IsHermitian.eigenvectorBasis`,
`Module.End.eigenspace`. (Proved here, following the cited route.)

### Examples

The pentagon, the Petersen graph and its complement, the Paley graphs on 9, 13, 17 and 29
vertices, the `4 × 4` grid and the Shrikhande graph (both `IsSRGWith 16 6 2 2`), the triangular
graphs on the pairs of a 6-, 7- and 8-set, the folded 5-cube `IsSRGWith 16 5 0 2`, the
Hoffman–Singleton graph, `K_(3 × 3)`, `K_(2 × 10)`, three disjoint copies of `K₄`, and `K₅` with each
value of `μ`, with their spectra and multiplicities as in the Checks.

### Dependencies

Mathlib `SimpleGraph.IsSRGWith`, `SimpleGraph.IsSRGWith.matrix_eq`,
`SimpleGraph.IsSRGWith.param_eq`, `SimpleGraph.IsSRGWith.compl`,
`SimpleGraph.adjMatrix_mulVec_const_apply_of_regular`, `SimpleGraph.isHermitian_adjMatrix`,
`SimpleGraph.trace_adjMatrix`, `Matrix.IsHermitian.eigenvectorBasis`,
`Matrix.IsHermitian.eigenvalues_mem_spectrum_real`, `Matrix.IsHermitian.trace_eq_sum_eigenvalues`,
`Matrix.spectrum_toLin'`, `Module.End.hasEigenvalue_iff_mem_spectrum`, `Module.End.eigenspace`,
`Matrix.toLin'`, `irrational_sqrt_natCast_iff`. No other layer.

## Layer 2: the friendship theorem

### 2.1 Friendship graphs are windmills

Prove `friendship_iff_windmill`: on a nonempty finite vertex type, any two distinct vertices of `G`
have exactly one common neighbour if and only if some vertex `c` is adjacent to every other vertex
and every vertex other than `c` has exactly one neighbour other than `c`; the graph then consists
of `(n − 1)/2` triangles through `c`, and `n` is odd (Erdős, Rényi and Sós, Theorem 6, p. 234,
where the hypothesis is that any two vertices are joined by a path of length two and there is no
cycle of length four; Brouwer–Van Maldeghem, Proposition 8.21.1 and the remark after it, p. 232).

Route: the converse is a direct count. For the theorem, two nonadjacent vertices have the same
degree: the common neighbours give a bijection between their neighbourhoods. If no vertex is
adjacent to all others, this makes `G` regular of some degree `k`; counting walks of length two
from a vertex gives `n = k² − k + 1`, and `G` satisfies `IsSRGWith (k² − k + 1) k 1 1` and is not
complete. By 1.3 with `ℓ = μ = 1`, `Δ = 4(k − 1)` and `(f − g)√(k − 1) = −k`, so `k − 1` divides
`k²`, hence divides `1`, so `k = 2`, `n = 3` and `G` is a triangle, which is complete: a
contradiction. So some `c` is adjacent to all others; for `w ≠ c` the unique common neighbour of
`w` and `c` is the unique neighbour of `w` other than `c`.

**Checks.**
- On the empty vertex type the hypothesis holds vacuously and no vertex `c` exists, so the
  nonemptiness assumption is needed.
- One vertex is a windmill with no triangles; two vertices fail both sides; the triangle and the
  windmills with two and three triangles satisfy both sides. Among all graphs on at most seven
  vertices, those satisfying the hypothesis are exactly the windmills on 1, 3, 5 and 7 vertices.
- The pentagon is not a friendship graph: adjacent vertices have no common neighbour. `K₄` is not
  one: adjacent vertices have two.
- The parameters `(7, 3, 1, 1)` of a hypothetical regular friendship graph with `k = 3` fail the
  rationality conditions (Check of 1.3).

*Needs:* 1.3; Mathlib `SimpleGraph.commonNeighbors`, `SimpleGraph.IsSRGWith`,
`SimpleGraph.IsRegularOfDegree`, `SimpleGraph.adjMatrix_pow_apply_eq_card_walk`. (Proved here,
following the cited route; Erdős, Rényi and Sós prove the theorem by a different route, through
finite projective planes.)

### Examples

Windmills with up to six triangles, all graphs on at most seven vertices, the pentagon and `K₄`.

### Dependencies

Layer 1 (1.3). Mathlib `SimpleGraph.commonNeighbors`, `SimpleGraph.IsSRGWith`,
`SimpleGraph.IsRegularOfDegree`, `SimpleGraph.adjMatrix_pow_apply_eq_card_walk`.

## Layer 3: Moore bounds and Moore graphs

### 3.1 The Moore bound for the diameter

Define `mooreBound k d = 1 + k ∑_(i < d) (k − 1)^i`. Prove `card_le_mooreBound`: a connected finite
graph whose degrees are all at most `k` has at most `mooreBound k D` vertices, where `D` is its
diameter (Brouwer–Haemers, §12.7, pp. 177–178, for `k`-regular graphs; the bound for degrees at
most `k` is proved here by the same count).

Route: fix a vertex `x`. Every vertex is at distance at most `D` from `x`
(`SimpleGraph.dist_le_diam`, with `SimpleGraph.Connected.exists_walk_length_eq_edist`). There is
one vertex at distance `0`, at most `k` at distance `1`, and each vertex at distance `i ≥ 1` has a
neighbour at distance `i − 1`, so at most `k − 1` further neighbours at distance `i + 1`; hence at
most `k(k − 1)^(i − 1)` vertices at distance `i ≥ 1`.

**Checks.**
- The Petersen graph: `k = 3`, `D = 2`, `mooreBound 3 2 = 10 = n`. The Hoffman–Singleton graph:
  `mooreBound 7 2 = 50 = n`.
- The cycle on `2D + 1` vertices attains `mooreBound 2 D = 2D + 1`; the cycle on six vertices has
  `D = 3` and `6 < 7`.
- `K_(k + 1)` has `D = 1` and `mooreBound k 1 = k + 1`.
- Connectedness is needed: two isolated vertices have diameter `0` in Mathlib's convention, and
  `2 > mooreBound k 0 = 1`.

*Needs:* Mathlib `SimpleGraph.diam`, `SimpleGraph.dist_le_diam`,
`SimpleGraph.Connected.exists_walk_length_eq_edist`, `SimpleGraph.degree`. (Proved here.)

### 3.2 The Moore bound for the girth

Prove `mooreBound_le_card`: a finite graph on a nonempty vertex type whose degrees are all at least
`d` and which has no cycle of length at most `2t`, that is `2t + 1 ≤ G.egirth`, has at least
`mooreBound d t` vertices. The graph need not be connected.

Route: fix a vertex `x`. For `i < t`, a vertex at distance `i` from `x` has exactly one neighbour
at distance `i − 1` (two would close a cycle of length at most `2i`) and none at distance `i` (a
cycle of length at most `2i + 1`), so it has at least `d − 1` neighbours at distance `i + 1`, and no
two vertices at distance `i` share one (a cycle of length at most `2i + 2 ≤ 2t`). Hence at least
`d(d − 1)^(i − 1)` vertices lie at each distance `1 ≤ i ≤ t`. Each cycle bound uses
`SimpleGraph.Walk.IsCycle.egirth_le_length`.

**Checks.**
- The Petersen graph: `d = 3`, girth `5 = 2 · 2 + 1`, `mooreBound 3 2 = 10 ≤ 10`.
- A graph without cycles has `G.egirth = ⊤`, so the bound applies for every `t`; with `d = 1` and
  `t ≥ 1` it reads `2 ≤ n`, true for `K₂`, and with `d = 0` it reads `1 ≤ n`.
- Nonemptiness is needed: on the empty type every degree condition holds vacuously, and
  `0 < mooreBound d t = 1` when `d = 0`.

*Needs:* Mathlib `SimpleGraph.egirth`, `SimpleGraph.Walk.IsCycle.egirth_le_length`,
`SimpleGraph.degree`. (Proved here.)

### 3.3 The graphs attaining the Moore bound

Prove `card_eq_mooreBound_iff`: if `G` is connected with diameter `D ≥ 1` and every degree is at
most `k`, then `n = mooreBound k D` if and only if `G` is `k`-regular and has no cycle of length at
most `2D` (`2D + 1 ≤ G.egirth`). A graph satisfying these conditions is a Moore graph
(Brouwer–Haemers, §12.7, p. 178, define Moore graphs by equality in the bound;
Brouwer–Van Maldeghem, §10.19, p. 268, by diameter `d` and girth `2d + 1`).

Route: equality in the count of 3.1 at a vertex `x` forces `x` to have `k` neighbours and every
vertex at distance `i < D` to have exactly one neighbour at distance `i − 1`, none at distance `i`
and `k − 1` at distance `i + 1`, with no vertex at distance `i + 1` reached twice. Since `x` is
arbitrary, `G` is `k`-regular. A cycle of length at most `2D` through `x` would produce a vertex at
distance at most `D` from `x` reached along two different shortest paths or an edge between two
vertices at the same distance less than `D` from `x`. Conversely, regularity and the girth
condition make the count of 3.2 with `t = D` exact at every distance up to `D`.

**Checks.**
- The pentagon, the Petersen graph and the Hoffman–Singleton graph attain `mooreBound k 2` and have
  girth `5`; `K₄` attains `mooreBound 3 1 = 4` and has girth `3`.
- `K₂` attains `mooreBound 1 1 = 2`, is `1`-regular and has no cycle, `G.egirth = ⊤`: the girth
  condition is an inequality in `ℕ∞` so that this case is included.
- `D ≥ 1` is needed: one vertex has `n = 1 = mooreBound 1 0` but is not `1`-regular.
- Among all connected graphs on at most seven vertices, checked for every `k` from the maximum
  degree to two more than it, the equality cases are exactly the complete graphs `K₂` to `K₇`, the
  pentagon and the heptagon.

*Needs:* 3.1, 3.2; Mathlib `SimpleGraph.IsRegularOfDegree`, `SimpleGraph.egirth`,
`SimpleGraph.Walk.IsCycle.egirth_le_length`. (Proved here.)

### 3.4 Moore graphs of diameter two

Prove `isSRGWith_of_diam_eq_two`: a `k`-regular graph of diameter `2` with `mooreBound k 2 = 1 + k²`
vertices is strongly regular with parameters `(1 + k², k, 0, 1)` (Brouwer–Haemers, §12.7, p. 178,
and Theorem 9.1.5, p. 117, where Moore graphs of diameter two are identified with these strongly
regular graphs).

Route: by 3.3 the graph has no cycle of length `3` or `4`, so adjacent vertices have no common
neighbour and distinct nonadjacent vertices at most one; diameter `2` gives at least one.

**Checks.**
- The pentagon (`k = 2`) and the Petersen graph (`k = 3`) satisfy the hypotheses; the cycle on six
  vertices is `2`-regular of diameter `3`, and `K_(3,3)` is `3`-regular of diameter `2` with
  `6 < 10` vertices.
- `G.diam = 2` includes connectedness, since `SimpleGraph.diam` is `0` for a graph that is not
  connected.

*Needs:* 3.3; Mathlib `SimpleGraph.IsSRGWith`, `SimpleGraph.commonNeighbors`. (Proved here.)

### 3.5 The Hoffman–Singleton theorem

Prove `hoffman_singleton`: if `G.IsSRGWith n k 0 1` and `G ≠ ⊤`, then `(n, k)` is `(5, 2)`,
`(10, 3)`, `(50, 7)` or `(3250, 57)` (Hoffman and Singleton; Brouwer–Haemers, Theorem 9.1.5,
p. 117). With 3.4 it follows that a `k`-regular graph of diameter `2` with `mooreBound k 2`
vertices has `k ∈ {2, 3, 7, 57}`, since a graph of diameter `2` is not complete; this consequence
is not stated separately in `Suggested.lean`.

Route: by 1.4, either the graph is a conference graph, and `ℓ + 1 = μ = 1` with `k = 2μ` gives
`(5, 2)`, or `r` and `s` are integers. In the second case `r + s = −1` and `rs = 1 − k`, so `s = −r − 1`
and `k = r² + r + 1`; `SimpleGraph.IsSRGWith.param_eq` gives `n = 1 + k²`, and the integrality of
`f` from 1.3, after substituting `√Δ = r − s = 2r + 1`, says that `2r + 1` divides `k(k − 2)`.
Since `4k = (2r + 1)² + 3`, `16k(k − 2) ≡ 3 · (−5) = −15` modulo the odd number `2r + 1`, so
`2r + 1` divides `15` and `r ∈ {0, 1, 2, 7}`; `r = 0` gives `k = 1` and `n = 2`, the complete graph
`K₂`, which `G ≠ ⊤` excludes, and the others give `k ∈ {3, 7, 57}`.

**Checks.**
- `G ≠ ⊤` is needed: `K₂` satisfies `IsSRGWith 2 1 0 1`, since it has no nonadjacent pair, and
  `(2, 1)` is not in the list.
- `r = 1, 2, 7` give `(k, n) = (3, 10), (7, 50), (57, 3250)`, and `2r + 1 = 3, 5, 15` divide `15`;
  for every `k ≤ 200000` the rationality conditions for `(1 + k², k, 0, 1)` hold exactly for
  `k ∈ {1, 2, 3, 7, 57}`, where `k = 1` is `K₂` and `k = 2` the conference case.
- The Hoffman–Singleton graph exists: Robertson's construction on two copies of `ℤ₅ × ℤ₅`
  (Brouwer–Haemers, §9.1.7 (iv), p. 117) gives a graph satisfying `IsSRGWith 50 7 0 1`, with
  diameter `2` and girth `5`.
- No statement here bears on the parameters `(3250, 57, 0, 1)`. Brouwer and Haemers record that
  the existence of such a graph is unknown (after Theorem 9.1.5, p. 117); Brouwer and Van Maldeghem
  note that a published proof of its nonexistence is wrong (p. 16) and that any Moore graph of
  diameter two other than the pentagon, the Petersen graph and the Hoffman–Singleton graph would
  have these parameters (§10.19, p. 268).

*Needs:* 1.3, 1.4, 3.4; Mathlib `SimpleGraph.IsSRGWith.param_eq`. (Proved here, following the
cited route.)

### Examples

Cycles of odd and even length, complete graphs, `K₂`, `K_(3,3)`, the Petersen graph, the
Hoffman–Singleton graph, and all connected graphs on at most seven vertices, with their Moore
numbers and girths as in the Checks.

### Dependencies

Layer 1 (1.3 and 1.4, for 3.5). Mathlib `SimpleGraph.diam`, `SimpleGraph.dist_le_diam`,
`SimpleGraph.Connected.exists_walk_length_eq_edist`, `SimpleGraph.egirth`,
`SimpleGraph.Walk.IsCycle.egirth_le_length`, `SimpleGraph.degree`, `SimpleGraph.IsRegularOfDegree`,
`SimpleGraph.IsSRGWith`, `SimpleGraph.IsSRGWith.param_eq`, `SimpleGraph.commonNeighbors`.

## Scope and ownership

This roadmap owns the targets stated above: the remark 1.1 on imprimitive graphs; the spectrum
of a strongly regular graph, the multiplicities of its eigenvalues with the rationality conditions
and the Frame quotient, the conference-or-integral dichotomy and Seidel's absolute bound; the
friendship theorem in its windmill form; the Moore bounds for the diameter and for the girth, the
characterisation of the graphs attaining them, the strong regularity of Moore graphs of diameter
two and the Hoffman–Singleton theorem.

Already in the libraries and therefore not targets:

- Mathlib's `SimpleGraph.IsSRGWith` with the strong regularity of the empty and complete graphs
  (`SimpleGraph.bot_strongly_regular`, `SimpleGraph.IsSRGWith.top`), the parameter identity
  (`SimpleGraph.IsSRGWith.param_eq`), the matrix identity (`SimpleGraph.IsSRGWith.matrix_eq`), the
  parameters of the complement (`SimpleGraph.IsSRGWith.compl`), and the diameter `2` of a strongly
  regular graph with `μ ≠ 0` that is not complete (`SimpleGraph.IsSRGWith.ediam_eq_two`). These are
  used above and not restated.
- Mathlib's eigenvalue `d` of a `d`-regular graph
  (`SimpleGraph.IsRegularOfDegree.mem_spectrum_adjMatrix`), walk counts as entries of powers of the
  adjacency matrix, and the inequality between girth and diameter
  (`SimpleGraph.egirth_le_two_mul_ediam_add_one`).
- Mathlib's Archive, which is not part of the importable library, proves in
  `Archive/Wiedijk100Theorems/FriendshipGraphs.lean` that a finite nonempty friendship graph has a
  vertex adjacent to all others (`Theorems100.friendship_theorem`). Since no roadmap can import the
  Archive, 2.1 states the theorem in its full windmill form, which contains that statement; the
  Archive's argument by traces modulo a prime is an alternative to the route of 2.1 through the
  rationality conditions.

Neighbouring roadmaps, not on main, are not treated here and are not suppliers:

- SpectralGraphBounds (a roadmap not on main) defines the sorted adjacency eigenvalues of a
  graph and bounds the largest eigenvalue, the chromatic and independence numbers and the second
  eigenvalue of a regular graph; it excludes strongly regular graphs. The statements above are
  about the eigenvalues and multiplicities of strongly regular graphs, stated through the spectrum
  and eigenspaces of the adjacency matrix rather than a sorted list; no bound of that roadmap is
  restated, except that the simplicity of the degree `k` in 1.3 is the connected case of that
  roadmap's 1.4 (the multiplicity of the degree of a regular graph is the number of components,
  stated there for its sorted eigenvalue list); it is included here only as part of the
  multiplicity statement. This roadmap does not depend on that one.
- LinearAlgebraMethodInCombinatorics (an open roadmap, not on main) states in its 3.1 Blokhuis's
  bound `(d + 1)(d + 2)/2` for two-distance sets in Euclidean space. The absolute bound of 1.5 is a
  different statement, about strongly regular graphs; its route bounds a two-distance set on a
  sphere by the different number `f(f + 3)/2` and is carried out there. This roadmap does not
  depend on that one.
- SpectralQuantumWalks (an open roadmap of another author, not on main) treats continuous-time
  quantum walks and the spectral projectors of graphs; it states nothing about strongly regular
  graphs or Moore graphs. This roadmap does not depend on it.
- GraphColouring and HamiltonianCycles (open roadmaps, not on main) and MatchingTheory (a roadmap
  not on main) use the Petersen graph as an example for colourings, Hamilton cycles and matchings;
  none of their statements is about its spectrum or its parameters.

Outside the scope: the Krein conditions; the existence or nonexistence of a strongly regular graph
with parameters `(3250, 57, 0, 1)`; the theorem of Damerell and of Bannai and Ito that a Moore graph
of diameter at least three is an odd cycle (Brouwer–Haemers, Theorem 12.7.1, p. 178);
distance-regular graphs and association schemes in general; Moore bounds for directed graphs and
for even girth; the uniqueness of the Petersen and Hoffman–Singleton graphs; strongly regular
graphs from designs, codes, finite geometries and groups; the friendship problem for infinite
graphs; and every procedure for constructing or recognising strongly regular
graphs.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Combinatorics/SimpleGraph/StronglyRegular.lean`: `SimpleGraph.IsSRGWith` (a structure
  with fields `card : Fintype.card V = n`, `regular : G.IsRegularOfDegree k`, `of_adj` giving `ℓ`
  common neighbours to adjacent pairs and `of_not_adj` giving `μ` to distinct nonadjacent pairs);
  `SimpleGraph.bot_strongly_regular`; `SimpleGraph.IsSRGWith.top` (for `[DecidableEq V]`);
  `SimpleGraph.IsSRGWith.param_eq` (`0 < n → k * (k - ℓ - 1) = (n - k - 1) * μ`, in `ℕ`);
  `SimpleGraph.IsSRGWith.matrix_eq` (over any semiring,
  `G.adjMatrix α ^ 2 = k • 1 + ℓ • G.adjMatrix α + μ • Gᶜ.adjMatrix α`);
  `SimpleGraph.IsSRGWith.compl` (the complement satisfies
  `IsSRGWith n (n - k - 1) (n - (2 * k - μ) - 2) (n - (2 * k - ℓ))`);
  `SimpleGraph.IsSRGWith.ediam_eq_two` (`[Nontrivial V]`, `G ≠ ⊤`, `μ ≠ 0` give `G.ediam = 2`).
- `Mathlib/Combinatorics/SimpleGraph/AdjMatrix.lean`: `SimpleGraph.adjMatrix`,
  `SimpleGraph.trace_adjMatrix` (trace `0`), `SimpleGraph.adjMatrix_mulVec_const_apply_of_regular`
  (for a `d`-regular graph, `(A *ᵥ const a) v = d * a`),
  `SimpleGraph.adjMatrix_pow_apply_eq_card_walk` (the entries of `A ^ m` count walks of length
  `m`). `Mathlib/Combinatorics/SimpleGraph/LapMatrix.lean`: `SimpleGraph.isHermitian_adjMatrix`,
  `SimpleGraph.IsRegularOfDegree.mem_spectrum_adjMatrix`.
- `Mathlib/Analysis/Matrix/Spectrum.lean`: `Matrix.IsHermitian.eigenvectorBasis` (an orthonormal
  eigenbasis), `Matrix.IsHermitian.eigenvalues_mem_spectrum_real`,
  `Matrix.IsHermitian.trace_eq_sum_eigenvalues` (the trace is the sum of the eigenvalues with
  multiplicity). `Mathlib/LinearAlgebra/Matrix/ToLin.lean`: `Matrix.toLin'`.
  `Mathlib/LinearAlgebra/Eigenspace/Matrix.lean`: `Matrix.spectrum_toLin'` (the spectrum of
  `Matrix.toLin' A` is that of `A`). `Mathlib/LinearAlgebra/Eigenspace/Basic.lean`:
  `Module.End.eigenspace`, `Module.End.hasEigenvalue_iff_mem_spectrum` (over a field, in finite
  dimension). `Mathlib/Algebra/Algebra/Spectrum/Basic.lean`: `spectrum`.
- `Mathlib/Data/Real/Irrational.lean`: `irrational_sqrt_natCast_iff` (`√n` is irrational if and
  only if `n` is not a square).
- `Mathlib/Combinatorics/SimpleGraph/Basic.lean`: `SimpleGraph.commonNeighbors`.
  `Mathlib/Combinatorics/SimpleGraph/Finite.lean`: `SimpleGraph.degree`,
  `SimpleGraph.IsRegularOfDegree`.
- `Mathlib/Combinatorics/SimpleGraph/Diam.lean`: `SimpleGraph.diam` (the diameter in `ℕ`, `0` for a
  graph that is not connected), `SimpleGraph.dist_le_diam` (`G.ediam ≠ ⊤ → G.dist u v ≤ G.diam`).
  `Mathlib/Combinatorics/SimpleGraph/Metric.lean`:
  `SimpleGraph.Connected.exists_walk_length_eq_edist`.
  `Mathlib/Combinatorics/SimpleGraph/Girth.lean`: `SimpleGraph.egirth` (the infimum in `ℕ∞` of the
  lengths of cycles), `SimpleGraph.Walk.IsCycle.egirth_le_length`,
  `SimpleGraph.egirth_le_two_mul_ediam_add_one`.

### From Tau Ceti

Nothing. The pinned Tau Ceti has no material on strongly regular graphs, Moore graphs or adjacency
spectra of graphs.

## References

- Andries E. Brouwer and Willem H. Haemers, *Spectra of Graphs*, monograph version of
  1 February 2011, posted by the first author (`win.tue.nl/~aeb/2WF02/spectra.pdf`); published by
  Springer, Universitext, 2012. Locators are to the numbered results and printed page numbers of
  that file: §9.1 and §9.1.1, p. 113; Theorem 9.1.2, p. 115; Theorem 9.1.3, p. 116; §9.1.4,
  pp. 115–116; §9.1.6, p. 116; Theorem 9.1.5 and §9.1.7, p. 117; §9.1.8, p. 118; Theorem 10.6.7 and Corollary
  10.6.8, p. 162; §12.7 and Theorem 12.7.1, pp. 177–178.
- Andries E. Brouwer and Hendrik Van Maldeghem, *Strongly Regular Graphs*, Cambridge University
  Press, 2022; the authors' version posted by the first author
  (`homepages.cwi.nl/~aeb/math/srg/rk3/srgw.pdf`, preface dated March 2021). Locators are to its
  printed page numbers: p. 16; Proposition 1.3.14, p. 27; Proposition 8.21.1, p. 232; §10.19,
  p. 268.
- P. Erdős, A. Rényi and V. T. Sós, On a problem of graph theory, *Studia Scientiarum
  Mathematicarum Hungarica* 1 (1966), 215–235, Theorem 6, pp. 234–235; the scan on the Rényi
  Institute's page of Erdős's papers (`users.renyi.hu/~p_erdos/1966-06.pdf`).
- The paper of A. J. Hoffman and R. R. Singleton, On Moore graphs with diameters 2 and 3, *IBM
  Journal of Research and Development* 4 (1960), 497–504, is named as Brouwer–Haemers attribute
  the result; no locator into it is given.

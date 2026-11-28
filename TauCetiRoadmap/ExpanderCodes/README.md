# Roadmap: expander codes

**Summary.** This roadmap builds Tanner codes on regular bipartite multigraphs and proves the
three facts that make expander graphs give good codes: a rate bound, a distance bound and a
statement about sets of edges that underlies decoding. A `D`-regular bipartite multigraph has `n`
left and `n` right vertices and `D` labelled ports at each vertex; its edges carry the
coordinates of the code. Given a linear code `C₀` of length `D` over a field, the Tanner code
consists of the words on the edges whose restriction to the `D` edges at every vertex, read
along the ports, lies in `C₀`. The expansion of the graph is measured by the second singular value
`σ₂` of its `n × n` biadjacency matrix; for a simple graph with `n ≥ 2` this is the second
largest adjacency eigenvalue. No decoding procedure, encoder or running time is a target.

The headline theorems are:

- *The bipartite expander mixing lemma.* For sets `S` of left and `T` of right vertices, the
  number `e(S, T)` of edges between them satisfies `|e(S, T) − D |S| |T| / n| ≤ σ₂ √(|S| |T|)`.
- *Rate.* If `C₀` has dimension `k₀ = r₀ D`, the Tanner code has dimension at least `(2k₀ − D) n`,
  so rate at least `2r₀ − 1`.
- *Distance.* If every nonzero word of `C₀` has weight at least `δ₀ D` with `δ₀ ≥ 0`, and
  `σ₂ ≤ ε D`, every nonzero word of the Tanner code has weight at least `δ₀ (δ₀ − ε) D n`.
- *Codes on the zig-zag family.* For every base graph of the required size with spectral parameter
  at most `1/4` (none is constructed here), the Tanner codes on the double covers of the zig-zag
  family built from it, with a fixed inner code of weights at least `δ₀ D`, have rate at least `2r₀
  − 1` and relative distance at least `δ₀ (δ₀ − 1/2)` at every length. Both bounds are positive
  for a Reed–Solomon inner code of odd length `D` and dimension `(D + 1)/2`.

The edge-set lemma says that if `D ≥ 1`, `δ₀ > 0`, `σ₂ ≤ εD` with `ε ≤ δ₀/3`, and a set of edges
touches at most `δ₀ n / 9` left vertices `S`, then at most `(3/4)|S|` right vertices carry at
least `δ₀ D / 2` of its edges.

The codes are Tau Ceti's linear codes (the completed roadmap AlgebraicCodingTheory), whose
parity-check matrices give the rate bound. The spectral parameter is compared with the sorted
adjacency eigenvalues of SpectralGraphBounds for simple bipartite graphs, and with the spectral
parameter of ExpanderConstructions for double covers; the family is the zig-zag family of
ExpanderConstructions, whose eigenvalue bound is used.

Layer 1 below fixes the multigraphs and `σ₂`, proves the mixing lemma and compares `σ₂` with
those two roadmaps. Layer 2 defines Tanner codes and proves
the rate bound. Layer 3 proves the distance bound and the edge-set lemma, and Layer 4 assembles
the codes on the zig-zag family.

## Conventions

- **Bipartite multigraphs with ports.** The left vertices form a finite type `U`, the right
  vertices a finite type `V` and the ports a finite type `P` with `D = Fintype.card P` elements;
  `n = Fintype.card U`. The graph is a map `R : V × P → U × P`: the edge at port `j` of the
  right vertex `v` is the edge `R (v, j) = (u, i)` at port `i` of the left vertex `u`. The edges
  are the elements of `U × P`, so every left vertex has degree `D`; every right vertex has degree
  `D` by construction. The theorems of 1.2, 2.2, 3.1 and 3.2 assume `R` bijective, which makes
  the edges seen from the two sides agree; then `D n = D · Fintype.card V`, so the two sides have
  `n` vertices each when `D ≥ 1`. Multiple edges are allowed.
- **Double covers.** A rotation map of ExpanderConstructions is an involution `R : V × P → V × P`;
  read as a map from right ports to left ports with `U = V`, it is the double cover of that
  multigraph: the edge `(v, i)` joins the left copy of `v` to the right copy of the end of the
  `i`-th edge at `v` (Spielman, Definition 29.1.1, p. 236).
- **Edges between sets.** For `S ⊆ U` and `T ⊆ V`, `e(S, T)` is the number of right ports
  `(v, j)` with `v ∈ T` and left end `(R (v, j)).1 ∈ S`.
- **The spectral parameter.** `σ₂(R)` is the second singular value of the biadjacency matrix,
  Mathlib's `LinearMap.singularValues` of the matrix at index `1` (the singular values are indexed
  from `0`, in nonincreasing order, and are `0` beyond the dimension). For bijective `R` with `D ≥
  1` and `n ≥ 1`, the largest singular value is `D`, with the constant vectors as singular vectors;
  for `n ≥ 2`, `σ₂` is the largest value of `‖Bᵀ x‖` over unit vectors `x` orthogonal to the
  constants. Spielman (§29.1, p. 236) expresses that a `D`-regular bipartite graph `ε`-approximates
  `(D/n) K_(n,n)` by its Laplacian spectrum: the eigenvalues other than the first, `0`, and the
  last, `2D`, lie within `εD` of `D`. For a simple graph with `n ≥ 2` this holds exactly when `σ₂ ≤
  εD`: the Laplacian eigenvalues are `D − μ` for the adjacency eigenvalues `μ`, the spectrum is
  symmetric about `0`, and the second largest `μ` is `σ₂` by 1.3 below.
- **Codes.** Over a field `F`, a code with coordinates `ι` is Tau Ceti's `TauCeti.LinearCode F ι`,
  a subspace of `ι → F`. The inner code lives on the ports, `C₀ : TauCeti.LinearCode F P`, and the
  Tanner code on the edges. Weight is Mathlib's `hammingNorm`. The rate of a code of length `N` is
  its dimension divided by `N`, and its relative distance the least weight of a nonzero word
  divided by `N`. Bounds are stated multiplied out and for every nonzero word, so that they hold
  for the zero code and for empty port or vertex types without appeal to the minimum-distance
  convention; Tau Ceti's `Set.le_hammingMinDist_iff_hammingNorm` turns them into bounds on
  `Set.hammingMinDist` for a nonzero code. No theorem assumes anything about the field; the
  Reed–Solomon example of 4.1 needs one with enough elements.

## Layer 1: bipartite multigraphs and the second singular value

### 1.1 The biadjacency matrix and its second singular value

Define `biadjMatrix R`, the real `U × V` matrix whose entry at `(u, v)` is the number of ports `j`
of `v` with `(R (v, j)).1 = u`, and `secondSingularValue R`, the singular value at index `1` of
`Matrix.toEuclideanLin (biadjMatrix R)`.

- Every column of `biadjMatrix R` sums to `D`. If `R` is bijective, every row sums to `D` as well:
  the ports with left end `u` are the preimages of the `D` edges at `u`.
- `secondSingularValue R ≥ 0`, and it is `0` when `V` has at most one element.
- For bijective `R` with `D ≥ 1` and `n ≥ 1`: the all-ones vector `𝟙` satisfies `B 𝟙 = D 𝟙` and
  `Bᵀ 𝟙 = D 𝟙`, the largest singular value is `D` (the row and column sums bound `‖B‖` by `D`),
  and `‖Bᵀ x‖ ≤ σ₂ ‖x‖` for every `x` orthogonal to `𝟙`.

**Checks.**

- The complete bipartite graph `K_(n,n)`, `n ≥ 2`, with `U = V = P = Fin n` and
  `R (v, j) = (j, v)`: the biadjacency matrix is the all-ones matrix `J`, `BᵀB = nJ` has
  eigenvalues `n², 0, …, 0`, so `σ₂ = 0`.
- The double cover of `K₄` (degree `3`): `B = J − I` on four vertices, `BᵀB = 2J + I` has
  eigenvalues `9, 1, 1, 1`, so `σ₂ = 1`.
- The double cover of the `4`-cycle (degree `2`, Spielman, Figure 29.1) is two disjoint copies
  of the `4`-cycle. Its biadjacency matrix is the adjacency matrix of the `4`-cycle, with
  eigenvalues `2, 0, 0, −2`; `BᵀB` has eigenvalues `4, 4, 0, 0`, so `σ₂ = 2 = D`. The second
  largest eigenvalue of `B` itself, `0`, would be the wrong parameter: 1.2 below fails for it on
  one of the two components.

*Needs:* Mathlib `Matrix.toEuclideanLin`, `LinearMap.singularValues`,
`LinearMap.singularValues_nonneg`, `LinearMap.singularValues_of_finrank_le`; Tau Ceti
`LinearMap.singularValues_adjoint`.

### 1.2 The bipartite expander mixing lemma

Prove `abs_card_edges_sub_le`: for bijective `R` and all `S ⊆ U`, `T ⊆ V`,

    |e(S, T) − D |S| |T| / n| ≤ σ₂ √(|S| |T|)

(Spielman, Theorem 29.1.3, p. 237, with `σ₂ ≤ εD`; Zhao, Theorem 3.2.9, p. 105). Neither source
prints a proof (Spielman refers to the proof of his Theorem 27.3.1, Zhao leaves it as Exercise
3.2.10), so the route is given in full. For `n = 0` both sides are `0`.

Route: let `B = biadjMatrix R` and `n ≥ 1`. Then `e(S, T) = 𝟙_Sᵀ B 𝟙_T`. Write
`𝟙_S = (|S|/n) 𝟙 + x` with `x ⊥ 𝟙`, so `‖x‖² = |S| − |S|²/n ≤ |S|`. Since the columns of `B` sum
to `D`, `𝟙ᵀ B 𝟙_T = D |T|`, and

    e(S, T) − D |S| |T| / n = ⟨Bᵀ x, 𝟙_T⟩,    |⟨Bᵀ x, 𝟙_T⟩| ≤ ‖Bᵀ x‖ √|T| ≤ σ₂ √(|S| |T|).

The bound `‖Bᵀ x‖ ≤ σ₂ ‖x‖` for `x ⊥ 𝟙` is the last item of 1.1: `B Bᵀ` is the Gram operator of
the map `x ↦ Bᵀ x`, whose adjoint is `x ↦ B x`, so its sorted eigenvalues are the squared singular
values of `B` (`LinearMap.singularValues_adjoint`). Since `B Bᵀ 𝟙 = D² 𝟙` and `D²` is its largest
eigenvalue (the row and column sums bound `‖Bᵀ‖` by `D`), an orthonormal eigenbasis of `B Bᵀ`
may start with `𝟙/√n` and list the eigenvalues in nonincreasing order; the eigenvalue at index
`1` is then `σ₂²` (`LinearMap.sq_singularValues_eq_of_adjoint_comp_self_eigenbasis`), and `x`
lies in the span of the vectors of index at least `1`, where
`LinearMap.norm_apply_le_of_mem_spanIndices_of_adjoint_comp_self_eigenbasis` gives the bound.
This is the argument of Zhao's proof of his Theorem 3.2.4 (p. 104), for which the operator norm
of `B − (D/n) J` is `σ₂`.

**Checks.**

- For `K_(n,n)` as in 1.1, `e(S, T) = |S| |T| = D |S| |T| / n` and `σ₂ = 0`: equality.
- For the double cover of `K₄` (`D = 3`, `n = 4`, `σ₂ = 1`): with `S = T = {a}`, `e = 0` and
  `|0 − 3/4| = 3/4 ≤ 1`; with `S = T = {a, b}`, `e = 2` and `|2 − 3| = 1 ≤ 2`; with `S = {a}`
  and `T` the other three vertices, `e = 3` and `|3 − 9/4| = 3/4 ≤ √3`.
- For the double cover of the `4`-cycle, with `S` and `T` the left and right vertices of one
  component (two each), `e = 4` and `|4 − 2·2·2/4| = 2 ≤ σ₂ · 2 = 4`; with the parameter `0` the
  bound would fail.
- Bijectivity is needed: for `U = {0, 1}`, `V = {0}`, one port and `R (0, 0) = (0, 0)`, the
  biadjacency matrix is a column `(1, 0)`, `σ₂ = 0` because `V` has one element, and `S = {0}`,
  `T = {0}` give `|1 − 1/2| = 1/2 > 0`.

*Needs:* 1.1; Mathlib `Matrix.toEuclideanLin_conjTranspose_eq_adjoint`, `abs_real_inner_le_norm`;
Tau Ceti `LinearMap.singularValues_adjoint`,
`LinearMap.sq_singularValues_eq_of_adjoint_comp_self_eigenbasis`,
`LinearMap.norm_apply_le_of_mem_spanIndices_of_adjoint_comp_self_eigenbasis`. (Proved here.)

### 1.3 Simple bipartite graphs

Prove `secondSingularValue_eq_adjEigenvalues`: let `G` be a simple graph on `U ⊕ V` with no edge
inside `U` and none inside `V`, whose adjacency between `u` and `v` is the entry
`biadjMatrix R u v`, and let `n ≥ 2`. Then `σ₂(R)` is the adjacency eigenvalue of `G` at index `1`,
the second largest, in the enumeration `adjEigenvalues` of SpectralGraphBounds 1.1. Bijectivity
is not assumed and the left degrees are arbitrary; every right vertex has degree `D`, since each
of its ports has a left end.

Route: the adjacency matrix is `A = [[0, B], [Bᵀ, 0]]`. If `σ` is a positive singular value with
right singular vector `w` and left singular vector `z = B w / σ`, the vectors `(z, ±w)/√2` are
unit eigenvectors of `A` with eigenvalues `±σ`; the kernels of `Bᵀ` and `B` give the eigenvalue
`0`. With `r` the rank of `B`, these `2r + (n − r) + (Fintype.card V − r)` vectors form an
orthonormal eigenbasis, so the sorted adjacency eigenvalues are the `r` positive singular values
in nonincreasing order, then `0` repeated `n + Fintype.card V − 2r` times, then the negatives of
the positive singular values (`LinearMap.IsSymmetric.eigenvalues_eq_of_eigenbasis`). For `r ≥ 2`
the entry at index `1` is the second singular value; for `r ≤ 1` it is `0`, and so is `σ₂`,
because `n ≥ 2` leaves at least one zero in the middle. This is the symmetry of the bipartite
spectrum (Zhao, Remark 3.1.23, p. 100).
(Proved here.)

**Checks.**

- The double cover of `K₄` is `K_(4,4)` minus a perfect matching; its adjacency eigenvalues are
  `3, 1, 1, 1, −1, −1, −1, −3`, and the one at index `1` is `1 = σ₂`.
- The hypothesis `n ≥ 2` is needed: for one edge (`U`, `V` and `P` with one element each) the
  adjacency eigenvalues are `1, −1`, the one at index `1` is `−1`, while `σ₂ = 0` because `V` has
  one element.

*Needs:* 1.1; SpectralGraphBounds 1.1 `adjEigenvalues` (copied); Mathlib `SimpleGraph.adjMatrix`,
`Matrix.IsHermitian.eigenvalues₀`, `Fintype.card_sum`; Tau Ceti `LinearMap.rightSingularBasis`,
`LinearMap.leftSingularVector`, `LinearMap.IsSymmetric.eigenvalues_eq_of_eigenbasis`.

### 1.4 Double covers of rotation maps

Prove `secondSingularValue_eq_card_mul_secondEigenvalue`: for an involutive rotation map
`R : V × P → V × P`, the second singular value of its double cover is `D λ(R)`, where `λ(R)` is
`secondEigenvalue R` of ExpanderConstructions 1.2 (copied with `adjCount` and `normAdj` of its
1.1). In Spielman's terms, the Laplacian eigenvalues of the double cover are those of the
multigraph together with their reflections `2D − λ` (Proposition 29.1.2, p. 237).

Route: the biadjacency matrix at `(u, v)` is `adjCount R v u`, and `adjCount` is symmetric when
`R` is an involution (the port `j` at `v` with end `u` corresponds to the port `(R (v, j)).2` at
`u`), so `B = D · normAdj R` for `D ≥ 1` and `B` is symmetric. The singular values of a symmetric
matrix are the absolute values of its eigenvalues in nonincreasing order. The eigenvalue `D` on
`𝟙` has the largest absolute value (the rows sum to `D`), so in an orthonormal eigenbasis of `B`
whose first vector is `𝟙/√n`, `σ₂` is the largest absolute value of the eigenvalues of the other
vectors, which span `𝟙⊥`. Expanding `x ⊥ 𝟙` in these vectors gives
`|xᵀ B x| ≤ σ₂ ‖x‖²`, with equality at an eigenvector of largest absolute eigenvalue, so the
supremum defining `λ(R)` is `σ₂ / D`. For at most one vertex or no port both sides are `0`.
(Proved here.)

**Checks.**

- `K₄` as a rotation map (degree `3`): `normAdj` has eigenvalues `1, −1/3, −1/3, −1/3`, so
  `λ = 1/3`, and `D λ = 1 = σ₂` as in 1.1.
- Involutivity is needed: the bijection `R (v, 0) = (v + 1, 0)` on `ZMod 3` with one port (a
  directed triangle) has as biadjacency matrix a permutation matrix, so `σ₂ = 1`; but
  `xᵀ normAdj x = −‖x‖²/2` for every `x ⊥ 𝟙`, so `λ = 1/2`.

*Needs:* 1.1; ExpanderConstructions 1.1 `adjCount`, `normAdj` and 1.2 `secondEigenvalue`
(copied); Mathlib `Matrix.IsHermitian.eigenvalues₀`, `Matrix.toEuclideanLin`; Tau Ceti
`LinearMap.IsSymmetric.eigenvalues_eq_of_eigenbasis`,
`LinearMap.sq_singularValues_eq_of_adjoint_comp_self_eigenbasis`.

### Examples

Complete bipartite graphs, the double covers of `K₄` and of the `4`-cycle, a single edge, and the
directed triangle, with the values in the Checks.

### Dependencies

SpectralGraphBounds 1.1 (`adjEigenvalues`, copied) for 1.3; ExpanderConstructions 1.1 and 1.2
(`adjCount`, `normAdj`, `secondEigenvalue`, copied) for 1.4; Mathlib's singular values and
Hermitian eigenvalues; Tau Ceti's singular system and Courant–Fischer file.

## Layer 2: Tanner codes and their rate

### 2.1 Tanner codes

Define `tannerCode R C₀` for a field `F` and an inner code `C₀ : TauCeti.LinearCode F P`: the
words `x : U × P → F` such that `i ↦ x (u, i)` lies in `C₀` for every left vertex `u` and
`j ↦ x (R (v, j))` lies in `C₀` for every right vertex `v` (Spielman, §29.2, p. 238; the notes
of §29.6, pp. 241–242, trace codes on graphs to Gallager and Tanner and attribute this
construction to Zémor). It is the intersection of the preimages of `C₀` under the restriction
maps `LinearMap.funLeft`, hence a subspace.

- The order of the ports at each vertex is part of the data: relabelling the ports at a vertex
  changes the code unless `C₀` is invariant under that permutation.
- If `C₀` is the whole space, so is the Tanner code; if `C₀ = 0`, the Tanner code is `0`.

**Checks.**

- On `K_(D,D)` as in 1.1 the Tanner code is the product code: words are `D × D` arrays whose rows
  (left vertices) and columns (right vertices) lie in `C₀`. For the binary even-weight code of
  length `3` (dimension `2`, least nonzero weight `2`), it has dimension `4` and least nonzero
  weight `4`.
- On the double cover of `K₄` with the binary even-weight code of length `3`, the Tanner code is
  the cycle space of `K_(4,4)` minus a perfect matching, of dimension `12 − 8 + 1 = 5` and least
  nonzero weight `4` (the girth); this code does not depend on the port labelling.

*Needs:* Tau Ceti `TauCeti.LinearCode`; Mathlib `LinearMap.funLeft`, `Submodule.comap`.

### 2.2 The rate bound

Prove `two_mul_finrank_mul_card_le`: for bijective `R` and an inner code of dimension `k₀`,

    2 k₀ n ≤ dim (tannerCode R C₀) + D n,

that is, the Tanner code, of length `D n`, has rate at least `2 r₀ − 1` with `r₀ = k₀ / D`
(Spielman, §29.2, p. 238).

Route: for `D = 0` both sides are `0` (and `V` may be any type). For `D ≥ 1`, bijectivity makes `V`
finite with `n` elements. By Tau Ceti's `TauCeti.LinearCode.exists_isParityCheckMatrix`, `C₀` is
checked by a matrix `H₀` with `D − k₀` rows. Stack one copy of `H₀` for each left vertex, acting on
the edges at it, and one for each right vertex, acting on `j ↦ x (R (v, j))`: the Tanner code is
the code checked by this matrix of `(n + Fintype.card V)(D − k₀)` rows (Spielman, §29.3, p. 238,
the matrix `M`). By `Matrix.finrank_checkedBy` and `Matrix.rank_le_card_height`, its dimension is
at least `D n − (n + Fintype.card V)(D − k₀) = D n − 2 n (D − k₀)`, which is the bound.

**Checks.**

- For the product codes of 2.1: `2 · 2 · 3 = 12 ≤ 4 + 9`; for `C₀` the whole space (`k₀ = D`) the
  bound is an equality, `2 D n = D n + D n`.
- On the double cover of `K₄` with the even-weight code: `2 · 2 · 4 = 16 ≤ 5 + 12`.
- Bijectivity is needed: with one left vertex, two right vertices, three ports, the even-weight
  code of length `3` (`k₀ = 2`), and `R` sending the ports of the first right vertex to the
  left edges `0, 0, 1` and those of the second to `0, 2, 2`, the right constraints force
  `x₁ = 0` and `x₀ = 0`, the left one then `x₂ = 0`; the Tanner code is `0`, and `2 · 2 · 1 = 4`
  exceeds `0 + 3 · 1`.

*Needs:* 2.1; Tau Ceti `TauCeti.LinearCode.exists_isParityCheckMatrix`,
`TauCeti.LinearCode.IsParityCheckMatrix`, `Matrix.checkedBy`, `Matrix.finrank_checkedBy`; Mathlib
`Matrix.rank_le_card_height`, `Module.finrank_fintype_fun_eq_card`.

### Examples

Product codes on `K_(D,D)` and the cycle space of the double cover of `K₄`, as in the Checks.

### Dependencies

No other layer; Tau Ceti's linear codes and parity-check matrices; Mathlib's restriction maps and
matrix rank.

## Layer 3: the distance bound and the edge-set lemma

### 3.1 The distance bound

Prove `mul_le_hammingNorm_of_mem_tannerCode`: let `R` be bijective, `0 ≤ δ₀`, every nonzero word of
`C₀` of weight at least `δ₀ D`, and `σ₂ ≤ ε D`. Then every nonzero word `x` of the Tanner code has

    δ₀ (δ₀ − ε) D n ≤ hammingNorm x,

so the relative distance of the Tanner code is at least `δ₀ (δ₀ − ε)`, and at least `δ₀²/2` when
`ε ≤ δ₀/2` (Spielman, Theorem 29.4.1, p. 239, which states the last form under `ε ≤ δ₀/2`; its
proof, pp. 239–240, establishes `δ₀ (δ₀ − ε) ≤ φ` for the relative weight `φ` of every nonzero
codeword before using that hypothesis). The statement is for every `ε` and over every field;
for `ε ≥ δ₀` it says nothing.

Route (Spielman's proof): let `F` be the set of edges where `x` is nonzero, `S` the left vertices
and `T` the right vertices that meet `F`; `S` is nonempty. Each vertex of `S` or of `T` sees a
nonzero word of `C₀`, so it meets at least `δ₀ D` edges of `F`; as `R` is bijective,
`|F| ≥ δ₀ D |S|`, `|F| ≥ δ₀ D |T|`, and every edge of `F` joins `S` to `T`, so
`e(S, T) ≥ |F| ≥ δ₀ D (|S| + |T|)/2`. As `x ≠ 0`, `D ≥ 1`, so `ε ≥ 0` because `0 ≤ σ₂ ≤ ε D`.
By 1.2 and `√(|S||T|) ≤ (|S| + |T|)/2`,

    e(S, T) ≤ D |S| |T| / n + ε D (|S| + |T|) / 2,

the bound on the average degree of the subgraph spanned by `S ∪ T` (Spielman, Corollary 29.1.4,
p. 237). With `2|S||T| ≤ |S|² + |T|² ≤ (|F| / (δ₀ D)) (|S| + |T|)` for `δ₀ > 0`, dividing by
`(|S| + |T|)/2` gives `δ₀ D ≤ |F| / (δ₀ n) + ε D`, which is the claim. For `δ₀ = 0` the claim is
`0 ≤ hammingNorm x`; for `D = 0` there is no nonzero word.

**Checks.**

- Product codes are extremal: on `K_(D,D)` (`ε = 0`) with the even-weight code of length `3`
  (`δ₀ = 2/3`), the bound is `(2/3)² · 3 · 3 = 4`, the least nonzero weight in 2.1.
- On the double cover of `K₄` (`ε = 1/3`) with the even-weight code, the bound is
  `(2/3)(1/3) · 3 · 4 = 8/3`, and the least nonzero weight is `4`.
- Surjectivity of `R` is needed: with no right vertex, three left vertices and the binary
  repetition code of length `2` (`δ₀ = 1`, `σ₂ = 0`), a word that is `1` on the two edges of one
  left vertex lies in the Tanner code and has weight `2 < 1 · 1 · 2 · 3`.
- `δ₀ ≥ 0` is needed: for one edge (`n = D = 1`, `σ₂ = 0`, `ε = 0`) and `C₀ = F`, `δ₀ = −2`
  satisfies the hypothesis on `C₀`, and the bound `(−2)(−2) · 1 · 1 = 4` exceeds the weight `1`.

*Needs:* 1.2, 2.1; Mathlib `hammingNorm`, `two_mul_le_add_sq`. (Spielman's proof.)

### 3.2 The edge-set lemma

Prove `card_le_of_card_image_fst_le`: let `R` be bijective with `D ≥ 1`, `δ₀ > 0`, `σ₂ ≤ ε D` and
`ε ≤ δ₀/3`. Let `F` be a set of edges, `S` the set of left vertices of edges of `F`, and `T` the
set of right vertices `v` with at least `δ₀ D / 2` ports `j` such that `R (v, j) ∈ F`. If
`|S| ≤ δ₀ n / 9`, then `|T| ≤ (3/4) |S|` (Spielman, Lemma 29.5.1, pp. 240–241). This is the
statement about sets of edges on which the analysis of Spielman's decoding procedure rests; the
procedure is not a target.

Route (Spielman's proof): every edge of `F` at a vertex of `T` has its left end in `S`, so
`e(S, T) ≥ δ₀ D |T| / 2`. By 1.2 as in 3.1, `e(S, T) ≤ D |S| |T| / n + ε D (|S| + |T|)/2`; dividing
by `D/2` and using `|S| ≤ δ₀ n / 9` gives `|T| (7δ₀/9 − ε) ≤ ε |S|`, and `7δ₀/9 − ε ≥ 4δ₀/9 > 0`,
so `|T| ≤ (δ₀/3) |S| / (4δ₀/9) = (3/4) |S|`. For `n = 0` the set `T` is empty.

**Checks.**

- `D ≥ 1` is needed: with no ports, `F` and `S` are empty, `σ₂ = 0`, and every right vertex has
  `0` ports in `F`, which is at least `δ₀ · 0 / 2`; so `T = V`, which is nonempty for `V`
  nonempty.
- `δ₀ > 0` is needed: for `δ₀ = 0` the hypotheses force `σ₂ = 0`, which `K_(n,n)` meets; then
  `F = ∅` gives `S = ∅` and `T = V`, of size `n > 0`.

*Needs:* 1.2; Mathlib `Finset.card_le_card_of_injOn`, `two_mul_le_add_sq`. (Spielman's proof.)

### Examples

The product codes and the double cover of `K₄` of 3.1, and the degenerate cases of 3.2.

### Dependencies

Layer 1 (1.2) for 3.1 and 3.2; Layer 2 (2.1) for 3.1; Mathlib's Hamming weight.

## Layer 4: codes on the zig-zag family

### 4.1 Tanner codes on the zig-zag family

Prove `tannerCode_zigZagFamily`: let `H : W × Q → W × Q` be an involutive rotation map with
`λ(H) ≤ 1/4`, let `e : (Fin 2 → Q × Q) ≃ W`, and let `G_n = zigZagFamily H e n` be the family of
ExpanderConstructions 4.1 (copied with `rotationPower`, `zigZag`, `relabelPorts` and
`zigZagFamilyVertex`), with `D = |Q|²` ports and `N = |W|^(n+1)` vertices. Let `C₀` be a code on
`Q × Q` of dimension `k₀` whose nonzero words have weight at least `δ₀ D`, `δ₀ ≥ 0`. Then for every
`n` the Tanner code of the double cover of `G_n`, of length `D N`, has

    2 k₀ N ≤ dim + D N    and    δ₀ (δ₀ − 1/2) D N ≤ hammingNorm x  for every nonzero word x.

So its rate is at least `2 r₀ − 1` and its relative distance at least `δ₀ (δ₀ − 1/2)`, uniformly
in `n`; the distance bound says something only for `δ₀ > 1/2`. When `δ₀ > 1/2`, `|W| ≥ 2` and
`k₀ > D/2`, the lengths tend to infinity and the codes form an asymptotically good family with a
fixed inner code. The theorem is conditional on the base graph `H`: none with `|W| ≥ 2` is
constructed here or in ExpanderConstructions. That roadmap's 4.1 describes, without constructing
them, the base graphs of Reingold, Vadhan and Wigderson, of degree `q²` on `q⁸` vertices for prime
powers `q ≥ 144`; for these `D = q⁴`, which is odd when `q` is odd.

Route: by ExpanderConstructions 4.1, theorem
`TauCetiRoadmap.ExpanderConstructions.zigZagFamily_spec`, `G_n` is involutive, has
`|W|^(n+1)` vertices and `λ(G_n) ≤ 1/2`. By 1.4, `σ₂ = D λ(G_n) ≤ D/2`, and an involution is
bijective (`Function.Involutive.bijective`). Apply 2.2, and 3.1 with `ε = 1/2`.

**Checks.**

- Reed–Solomon inner codes meet the hypotheses. If `D` is odd and `F` has at least `D` elements,
  identify `Q × Q` with `D` distinct points of `F` and take the values there of the polynomials
  of degree less than `k₀ = (D + 1)/2`. A nonzero such polynomial has at most `k₀ − 1` roots
  (`Polynomial.card_roots'`), so the code has dimension `k₀` and every nonzero word has weight at
  least `D − k₀ + 1 = (D + 1)/2`. Then `δ₀ = (D + 1)/(2D)`, the rate is at least `1/D` and the
  relative distance at least `(D + 1)/(4D²)`.
- The degenerate base graph (`W` and `Q` with one element, `H` a half-loop) gives one vertex with
  one half-loop for every `n`; with `C₀ = F` the Tanner code is `F`, `2 ≤ 1 + 1`, and for
  `δ₀ = 1` the weight bound is `1/2 ≤ 1`.

*Needs:* 1.4, 2.2, 3.1; ExpanderConstructions 4.1 (`zigZagFamily` and its constituents, copied;
`TauCetiRoadmap.ExpanderConstructions.zigZagFamily_spec`); Mathlib `Function.Involutive.bijective`,
`Fintype.card_prod`.

### Examples

Reed–Solomon inner codes over large fields, as in the Checks.

### Dependencies

Layers 1 (1.4), 2 (2.2) and 3 (3.1); ExpanderConstructions 4.1.

## Scope and ownership

This roadmap owns the targets stated above: regular bipartite multigraphs with ports given by a
map from right ports to left ports, their biadjacency matrix and second singular value, the
bipartite expander mixing lemma for them, and the comparison of the second singular value with
the adjacency eigenvalues of simple bipartite graphs and with the spectral parameter of rotation
maps; Tanner codes and their rate bound; the distance bound and the edge-set lemma; and the Tanner
codes on the double covers of the zig-zag family.

Already in the libraries and therefore not targets:

- From Tau Ceti's coding library (`TauCeti/InformationTheory/Coding/`), the formalization of the
  completed roadmap AlgebraicCodingTheory: linear codes, codes checked by a matrix with their
  dimension, parity-check matrices and their existence, and the minimum distance with its
  characterization by weights.
- Mathlib's singular values of linear maps between finite-dimensional inner product spaces and
  Tau Ceti's singular system (the equality of the singular values of a map and its adjoint, the
  right and left singular vectors, the norm bounds on spans of singular vectors), and the sorted
  eigenvalues of Hermitian matrices.

Left to other roadmaps:

- SpectralGraphBounds owns the sorted adjacency eigenvalues (its Layer 1, the adjacency spectrum,
  1.1), copied here for 1.3, and the expander mixing lemma for regular simple graphs (its Layer 4,
  edge distribution in regular graphs, 4.1). For the double cover of a rotation map realizing a
  `d`-regular simple graph on `n ≥ 2` vertices, `e(S, T)` above is that lemma's count of ordered
  pairs and `σ₂ = max(|λ₂|, |λₙ|)` (by 1.4 and ExpanderConstructions 1.3), the least `β` that
  lemma allows; so 1.2 gives the weaker form of that lemma, without its factors
  `(1 − s/n)(1 − t/n)`. That lemma is neither restated nor used.
- ExpanderConstructions owns rotation maps, their spectral parameter (its Layer 1, 1.1–1.2), the
  powers and zig-zag products (2.1, 3.1) and the explicit family with its theorem
  `TauCetiRoadmap.ExpanderConstructions.zigZagFamily_spec` (its Layer 4, 4.1). The definitions are
  copied here and the theorem is consumed in 4.1. Its scope leaves the expander mixing lemma for
  multigraphs aside; 1.2 is that lemma for bipartite multigraphs.

Outside the scope: decoding procedures, including Spielman's alternating decoder and the bound on
the number of errors it corrects (his Lemma 29.5.2 and Theorem 29.5.3), and every encoder and
running time; Sipser–Spielman codes and vertex expansion; Zémor's sharper distance and decoding
analysis; low-density parity-check codes and their ensembles; Tanner codes with different inner
codes on the two sides; and the existence of base graphs for the zig-zag family.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Analysis/InnerProductSpace/PiL2.lean`: `Matrix.toEuclideanLin` (a matrix `U × V` as a
  linear map `EuclideanSpace ℝ V → EuclideanSpace ℝ U`).
- `Mathlib/Analysis/InnerProductSpace/SingularValues.lean`: `LinearMap.singularValues` (the
  square roots of the sorted eigenvalues of `T† T`, indexed from `0`, then `0` beyond the
  dimension of the source), `LinearMap.singularValues_nonneg`,
  `LinearMap.singularValues_of_finrank_le`.
- `Mathlib/Analysis/InnerProductSpace/Adjoint.lean`:
  `Matrix.toEuclideanLin_conjTranspose_eq_adjoint`.
  `Mathlib/Analysis/InnerProductSpace/Basic.lean`: `abs_real_inner_le_norm` (Cauchy–Schwarz).
- `Mathlib/Analysis/Matrix/Spectrum.lean`: `Matrix.IsHermitian.eigenvalues₀` (the eigenvalues of
  a Hermitian matrix, nonincreasing). `Mathlib/Combinatorics/SimpleGraph/AdjMatrix.lean`:
  `SimpleGraph.adjMatrix`. `Mathlib/Data/Fintype/Sum.lean`: `Fintype.card_sum`.
- `Mathlib/InformationTheory/Hamming.lean`: `hammingNorm` (the number of nonzero coordinates).
- `Mathlib/Algebra/Module/Equiv/Basic.lean`: `LinearMap.funLeft` (precomposition as a linear map).
  `Mathlib/Algebra/Module/Submodule/Map.lean`: `Submodule.comap`.
  `Mathlib/LinearAlgebra/Matrix/Rank.lean`: `Matrix.rank_le_card_height` (the rank is at most the
  number of rows). `Mathlib/LinearAlgebra/Dimension/Constructions.lean`:
  `Module.finrank_fintype_fun_eq_card`.
- `Mathlib/Algebra/Order/Ring/Unbundled/Basic.lean`: `two_mul_le_add_sq` (`2ab ≤ a² + b²`).
  `Mathlib/Data/Finset/Card.lean`: `Finset.card_le_card_of_injOn`.
- `Mathlib/Logic/Function/Basic.lean`: `Function.Involutive.bijective`.
  `Mathlib/Data/Fintype/Prod.lean`: `Fintype.card_prod`.
- `Mathlib/Algebra/Polynomial/Roots.lean`: `Polynomial.card_roots'` (a polynomial over a domain
  has at most its degree many roots), used in a Check of 4.1.

### From Tau Ceti

- `TauCeti/InformationTheory/Coding/Basic.lean`: `TauCeti.LinearCode F ι`, an abbreviation of
  `Submodule F (ι → F)`.
- `TauCeti/InformationTheory/Coding/Matrix.lean`: `Matrix.checkedBy` (the kernel of `x ↦ H *ᵥ x`),
  `TauCeti.LinearCode.IsParityCheckMatrix` (`C` is the code checked by `H`), and
  `Matrix.finrank_checkedBy` (its dimension is the length minus the rank of `H`).
- `TauCeti/InformationTheory/Coding/GeneratorParityCheck.lean`:
  `TauCeti.LinearCode.exists_isParityCheckMatrix` (a parity-check matrix with
  `length − dimension` linearly independent rows).
- `TauCeti/InformationTheory/Coding/MinimumDistance/Basic.lean`: `Set.hammingMinDist` and
  `Set.le_hammingMinDist_iff_hammingNorm` (for a nonzero additive code, a lower bound on the
  minimum distance is a lower bound on the weights of its nonzero words), in the Conventions.
- `TauCeti/Analysis/InnerProductSpace/SingularValues.lean`: `LinearMap.singularValues_adjoint`,
  `LinearMap.sq_singularValues_eq_of_adjoint_comp_self_eigenbasis` (a sorted orthonormal
  eigenbasis of `A† A` computes the squared singular values),
  `LinearMap.norm_apply_le_of_mem_spanIndices_of_adjoint_comp_self_eigenbasis` (a bound on the
  eigenvalues of `A† A` on selected basis vectors bounds `‖A x‖` on their span),
  `LinearMap.rightSingularBasis`, `LinearMap.leftSingularVector`.
- `TauCeti/Analysis/InnerProductSpace/CourantFischer.lean`:
  `LinearMap.IsSymmetric.eigenvalues_eq_of_eigenbasis` (a sorted orthonormal eigenbasis computes
  the sorted eigenvalues).

### From TauCetiRoadmap.SpectralGraphBounds

- Section 1.1: the definition `adjEigenvalues` (the eigenvalues `eigenvalues₀` of
  `G.adjMatrix ℝ`, nonincreasing, index `0` the largest), copied verbatim into `Suggested.lean`
  and used in 1.3.

### From TauCetiRoadmap.ExpanderConstructions

- Sections 1.1 and 1.2: the definitions `adjCount`, `normAdj` and `secondEigenvalue` (the
  supremum of `|xᵀ M x|` over `x ⊥ 𝟙`, `xᵀx ≤ 1`, which for an involutive `R` on at least two
  vertices is the largest absolute value of an eigenvalue of `M` on `𝟙⊥`), copied verbatim and
  used in 1.4.
- Sections 2.1, 3.1 and 4.1: the definitions `rotationPower`, `zigZag`, `relabelPorts`,
  `zigZagFamilyVertex` with its two instances, and `zigZagFamily`, copied verbatim; and the
  theorem `TauCetiRoadmap.ExpanderConstructions.zigZagFamily_spec` (for involutive `H` with
  `secondEigenvalue H ≤ 1/4` and `e : (Fin 2 → Q × Q) ≃ W`, every `zigZagFamily H e n` is
  involutive, has `(Fintype.card W)^(n+1)` vertices and `secondEigenvalue ≤ 1/2`), used in 4.1.

## References

- Daniel A. Spielman, *Spectral and Algebraic Graph Theory*, incomplete draft dated April 2,
  2025, on the author's page (`cs-www.cs.yale.edu/homes/spielman/sagt`): Chapter 27, Theorem 27.3.1
  with its proof (pp. 221–222); Chapter 29, §29.1 with Definition 29.1.1, Proposition 29.1.2,
  Figure 29.1, Theorem 29.1.3 and Corollary 29.1.4 (pp. 236–238), §§29.2–29.3 (p. 238),
  Theorem 29.4.1 with its proof (pp. 239–240), Lemma 29.5.1 with its proof (pp. 240–241), and
  §29.6 (pp. 241–242).
- Yufei Zhao, *Graph Theory and Additive Combinatorics*, author's version of June 18, 2024, on the
  author's page (`yufeizhao.com/gtacbook`): Remark 3.1.23 (p. 100), Theorem 3.2.4 with its proof
  (p. 104), Definition 3.2.7 and Exercise 3.2.8 (p. 104), Theorem 3.2.9 and Exercise 3.2.10
  (p. 105).

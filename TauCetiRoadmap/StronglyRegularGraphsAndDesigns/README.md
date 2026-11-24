# Roadmap: strongly regular graphs and designs

**Summary.** A graph is strongly regular when it is regular and the number of common neighbours
of two distinct vertices depends only on whether they are adjacent; equivalently its adjacency
matrix satisfies `A² = (λ − μ) A + (k − μ) I + μ J`. A `2`-design is an incidence structure whose
incidence matrix satisfies `N Nᵀ = (r − λ) I + λ J`. This roadmap develops the two matrix
identities and what they carry beyond the spectrum of a single strongly regular graph. Among its
theorems:
- the strongly regular equation in both directions and with real coefficients; a regular graph
  that is neither complete nor edgeless is strongly regular exactly when it has precisely two
  restricted eigenvalues, and a connected regular graph with three distinct eigenvalues is
  strongly regular;
- for a graph that is neither complete nor edgeless, the diagonal, the edges and the nonedges
  form an association scheme with two classes exactly when the graph is strongly regular; its
  primitive idempotents are `J/n` and two spectral idempotents, its first eigenmatrix has rows
  `(1, k, n − k − 1)`, `(1, r, −1 − r)`, `(1, s, −1 − s)`, and the Krein conditions follow;
- triangular, lattice and complete multipartite graphs and their complements, the pentagon, the
  Petersen graph and the Hoffman–Singleton graph are strongly regular, and every strongly regular
  graph with parameters `(5, 2, 0, 1)` or `(10, 3, 0, 1)` is the pentagon or the Petersen graph;
- the Gram identity characterizes `2`-designs; a `2`-design is symmetric exactly when `r = k`, and
  then its dual is a symmetric design with the same parameters; the incidence graph of a
  symmetric `2`-`(v, k, λ)` design has spectrum `±k` and `±√(k − λ)`, the latter with
  multiplicity `v − 1`; finite projective planes are the symmetric designs with `λ = 1` and
  `k ≥ 3`;
- a quasi-symmetric `2`-design gives a strongly regular graph on its blocks, and a strongly
  regular graph with `λ = μ` or `μ = λ + 2` gives a symmetric design on its vertices, under the
  nondegeneracy conditions of 5.5 (`2 ≤ k < n` and `0 < λ`, respectively `1 ≤ k` and
  `k + 1 < n`);
- the Bruck–Ryser–Chowla theorem: if a symmetric `2`-`(v, k, λ)` design exists and `v` is even,
  `k − λ` is a square, and if `v` is odd, `x² = (k − λ) y² + (−1)^((v−1)/2) λ z²` has a nonzero
  integer solution; a projective plane of order `q ≡ 1, 2 (mod 4)` has `q` a sum of two squares,
  and there is no projective plane of order six.

The roadmap builds on the spectra and standard graphs of GraphSpectra. It takes from
StronglyRegularAndMooreGraphs the definitions of the two restricted eigenvalues and leaves to it
the spectrum and multiplicities, the absolute bound, the Moore bounds, the Hoffman–Singleton
theorem and the friendship theorem. It identifies strongly regular graphs with the schemes of two
classes of AssociationSchemes, whose Krein conditions it specializes. Fisher's inequality is
[LinearAlgebraMethodInCombinatorics](../LinearAlgebraMethodInCombinatorics/README.md), 1.3, and
Tau Ceti's Witt cancellation and roundness of Pfister forms carry the Bruck–Ryser–Chowla theorem.

## How to read the build

Layer 1 proves the strongly regular equation in both directions, the parameter bounds and the
two spectral characterizations. Layer 2 identifies strongly regular graphs with the schemes of
two classes, computes their idempotents and eigenmatrix, and derives the Krein conditions. Layer
3 constructs the standard families, and Layer 4 proves the uniqueness of the pentagon and the
Petersen graph. Layer 5 develops designs, their incidence matrices and incidence graphs, and the
passages between designs and strongly regular graphs. Layer 6 proves the Bruck–Ryser–Chowla
theorem. Layers 1–4 and Layers 5–6 are two strands; only 5.5 uses Layer 1.

## Conventions

- **Graphs** are `G : SimpleGraph V` with `[Fintype V] [DecidableEq V] [DecidableRel G.Adj]`.
  Statements hold for every finite `V`, including the empty type, unless a hypothesis says
  otherwise. `A = G.adjMatrix ℝ`, `I` is the identity and `J` the all-ones matrix
  `Matrix.of fun _ _ ↦ 1`.
- **Strongly regular graphs** are Mathlib's `G.IsSRGWith n k ℓ μ`, with natural parameters; the
  letter `λ` of the sources is `ℓ` in Lean. Brouwer–Haemers exclude complete and edgeless graphs
  [BH, §9.1, p. 115]; Mathlib does not: `K_n` satisfies the predicate with `k = n − 1`,
  `ℓ = n − 2` and every `μ` (`SimpleGraph.IsSRGWith.top`), and the edgeless graph with
  `k = μ = 0` and every `ℓ` (`SimpleGraph.bot_strongly_regular`). A statement that needs two
  restricted eigenvalues or two nonidentity classes assumes `G ≠ ⊤` and `G ≠ ⊥`.
  StronglyRegularAndMooreGraphs assumes `G ≠ ⊤` and `0 < μ` instead; the hypotheses here also
  admit the disconnected strongly regular graphs, which have `μ = 0`.
- **Restricted eigenvalues.** `restrictedEigenvalues G : Set ℝ` is the set of `θ` with an
  eigenvector `u ≠ 0` of `A` whose entries sum to `0` [BH, §9.1.3, p. 117]. For a regular graph
  these are the eigenvalues of `A` on the orthogonal complement of the all-ones vector.
- **The two roots.** `srgDiscriminant k ℓ μ = (ℓ − μ)² + 4(k − μ)`,
  `srgEigenvalueR k ℓ μ = ((ℓ − μ) + √Δ)/2` and `srgEigenvalueS k ℓ μ = ((ℓ − μ) − √Δ)/2`, with
  `Real.sqrt` (which is `0` at negative arguments), are the definitions of
  StronglyRegularAndMooreGraphs 1.2, copied verbatim in `Suggested.lean`. They are written `r`
  and `s`. By Theorem 9.1.3 (ii) of [BH, p. 118], `r + s = ℓ − μ` and `rs = μ − k` whenever
  `Δ ≥ 0`.
- **Schemes.** `IsAssocScheme`, `adjMat`, `bmAlgebra`, `IsPrimitiveIdempotents` and `eigenmatrix`
  are the definitions of AssociationSchemes 1.1, 1.2 and 2.1, copied verbatim. A scheme with `d`
  classes is a class function `X → X → Fin (d + 1)` in which class `0` is the diagonal, every
  class is symmetric and nonempty, and the number of `z` with `x z` in class `i` and `z y` in
  class `j` depends only on the class of `x y`. The class function of a graph is
  `srgClass G : V → V → Fin (2 + 1)`, with class `0` the diagonal, `1` the edges and `2` the
  nonedges.
- **Spectral idempotents.** `idempotentR G k ℓ μ = (A − sI − (k − s) J/n)/(r − s)` and
  `idempotentS G k ℓ μ = (rI − A + (k − r) J/n)/(r − s)`, with `n = Fintype.card V`, written
  `E_r` and `E_s`. For a strongly regular graph that is neither complete nor edgeless they are
  the orthogonal projections onto the `r`- and `s`-eigenspaces of `A` on the orthogonal
  complement of the all-ones vector. When `μ = 0`, `r = k`, and the `k`-eigenspace of `A` also
  contains the all-ones vector, so `tr E_r` is one less than the multiplicity of `r`; no
  statement identifies the trace with a multiplicity.
- **Spectra** are the multisets `adjSpectrum` of GraphSpectra 1.2, the adjacency eigenvalues with
  multiplicity, built on the sorted eigenvalues of SpectralGraphBounds 1.1; both definitions are
  copied verbatim. A spectrum `k¹ r^f s^g` is written `k ::ₘ (replicate f r + replicate g s)`.
- **Johnson, Kneser and Petersen graphs** are those of GraphSpectra 2.4, copied verbatim with
  their `DecidableRel` instances: `johnsonGraph α k` and the Kneser graph of
  TopologicalCombinatorics 3.1 live on the coerced set `{s : Finset α | s.card = k}`, and
  `petersenGraph` is the Kneser graph on the `2`-subsets of `Fin 5`. The lattice graph
  `K_m □ K_m` uses GraphSpectra's `DecidableRel` instance for `SimpleGraph.boxProd`, copied as
  well. `T(m)` is `johnsonGraph α 2` with `m` elements in `α`.
- **The Hoffman–Singleton graph** `hoffmanSingletonGraph` is Robertson's construction
  [BH, §9.1.7 (iv), p. 119] on `Bool × ZMod 5 × ZMod 5`: pentagons
  `(false, i, j) ∼ (false, i, j + 1)`, pentagrams `(true, i, j) ∼ (true, i, j + 2)`, and
  `(false, i, k) ∼ (true, j, i j + k)`.
- **Designs.**
  - A design is an incidence relation `inc : P → L → Prop` between a type of points `P` and a type
    of blocks `L`, so blocks may repeat. The membership `Membership P L` of a
    `Configuration.ProjectivePlane` and the adjacency of a graph are incidence relations.
  - `Design.IsTwoDesign inc v k ℓ` says that there are `v` points, every block has `k` points, two
    distinct points lie together on exactly `ℓ` blocks, and `2 ≤ k < v`, `0 < ℓ`. Godsil–Royle
    define `t`-designs without the nondegeneracy [GR, §5.10, p. 94] and assume `k < v` in Lemma
    5.10.1 [GR, p. 95]; here it is part of the definition. It makes the sets of blocks through the
    points nonempty (`0 < ℓ`) and pairwise distinct (`k < v` gives `ℓ < r`), which are the
    hypotheses under which LinearAlgebraMethodInCombinatorics 1.3 gives Fisher's inequality
    `v ≤ b`; `2 ≤ k` excludes the structures whose blocks have at most one point. Cardinalities are
    `Nat.card` of subtypes, so the predicate needs no decidability.
  - `Design.IsSymmetricDesign inc v k ℓ` adds `Nat.card L = v`.
  - `Design.replication v k ℓ = ℓ (v − 1)/(k − 1)`, the replication number `r`; the natural
    division is exact for a design.
  - `Design.incMatrix R inc : Matrix P L R` is the point-by-block `0`–`1` incidence matrix `N`.
  - `Design.incidenceGraph inc : SimpleGraph (P ⊕ L)` joins `.inl p` and `.inr l` when `inc p l`;
    by definition no two points and no two blocks are adjacent.
  - `Design.blockGraph inc x : SimpleGraph L` joins distinct blocks with exactly `x` common
    points. A design is quasi-symmetric when two distinct blocks always meet in `x` or `y` points
    for some `x ≠ y` [BH, §9.1.10, p. 121]; no predicate is introduced, and the hypothesis is
    written out.

## Layer 1: the strongly regular equation and the spectral characterizations

The definition is `restrictedEigenvalues` (Conventions).

*Depends on:* Mathlib's `IsSRGWith` API; GraphSpectra 1.2 and 3.2.

### 1.1 The strongly regular equation

- **The strongly regular equation** (`isSRGWith_iff_adjMatrix_sq_eq`). For every graph and every
  ring `R` of characteristic zero, `G.IsSRGWith n k ℓ μ` holds exactly when
  `Fintype.card V = n` and `A² = (ℓ − μ) A + (k − μ) I + μ J` in `Matrix V V R` [BH, Theorem
  9.1.2 (i)⇔(ii), p. 117; Biggs, 3c, p. 20].
- **The equation with real coefficients** (`exists_isSRGWith_iff_exists_real`). `G` is strongly
  regular for some parameters exactly when `A² = a A + b I + c J` for some real `a, b, c`
  [BH, Theorem 9.1.2 (ii), p. 117].

**Suggested proof:** Mathlib's `SimpleGraph.IsSRGWith.matrix_eq` with
`SimpleGraph.one_add_adjMatrix_add_compl_adjMatrix_eq_of_one` (`I + A + A_{Gᶜ} = J`) gives the
forward direction. Conversely read the equation entrywise with
`SimpleGraph.adjMatrix_pow_apply_eq_card_walk`: the diagonal gives degree `k`, an edge gives
`ℓ`, a nonedge gives `μ`; characteristic zero turns equalities in `R` into equalities of natural
numbers. For real coefficients, the diagonal, edge and nonedge entries of `A²` are natural
numbers; on a graph with an edge and a nonedge, `k = b + c`, `ℓ = a + c`, `μ = c`, and on a
complete or edgeless graph Mathlib's `SimpleGraph.IsSRGWith.top` and
`SimpleGraph.bot_strongly_regular` give the parameters.

**Checks.**
- `K_n = ⊤` satisfies the equation with `ℓ = n − 2` and any `μ`: `A² = (n − 2) A + (n − 1) I`,
  and the term `μ (J − I − A)` vanishes.
- The edgeless graph satisfies it with `k = μ = 0` and any `ℓ`: both sides are `0`.
- The Petersen graph: `A² = −A + 2I + J`, so `a = −1`, `b = 2`, `c = 1` and
  `(k, ℓ, μ) = (3, 0, 1)`.
- Negative control: `C₆` is `2`-regular and not strongly regular. Two vertices at distance `2`
  have one common neighbour and two at distance `3` none, so the entries of `A²` off the edges
  take two values and `A²` is no combination of `A`, `I` and `J`.

*Needs:* Mathlib `SimpleGraph.IsSRGWith.matrix_eq`,
`SimpleGraph.one_add_adjMatrix_add_compl_adjMatrix_eq_of_one`,
`SimpleGraph.adjMatrix_pow_apply_eq_card_walk`.

### 1.2 Parameter bounds

- **Parameter bounds** (`IsSRGWith.le_of_ne_top`, `IsSRGWith.lt_of_ne_bot`). `μ ≤ k` when
  `G ≠ ⊤`, and `ℓ < k` when `G ≠ ⊥` [BH, proof of Theorem 9.1.2, p. 117].
- **The parameter relation in the reals** (`IsSRGWith.param_eq_real`). If `0 < n`, then
  `k (k − ℓ − 1) = (n − k − 1) μ` with real subtraction [BH, Theorem 9.1.3 (i), p. 118].

Both are basic API, stated with Lean names because 1.3, 2.1 and Layer 2 consume them.

**Suggested proof:** a nonadjacent pair `x ≠ y` has its `μ` common neighbours among the `k`
neighbours of `x`; an edge `xy` has its `ℓ` common neighbours among the neighbours of `x` other
than `y`. For the relation, Mathlib's `SimpleGraph.IsSRGWith.param_eq` holds for `0 < n`. If
`G` has an edge, `ℓ < k` and `k < n` make both truncated subtractions exact. If `G = ⊥`, then
`k = 0`, and `μ = 0` or `n = 1`, so both sides vanish.

**Checks.**
- `K₃` satisfies `IsSRGWith 3 2 1 5`: `μ = 5 > k = 2`, so `μ ≤ k` needs `G ≠ ⊤`.
- The edgeless graph on `3` vertices satisfies `IsSRGWith 3 0 7 0`: `ℓ = 7 > k = 0`, so `ℓ < k`
  needs `G ≠ ⊥`.
- Petersen: `3 · (3 − 0 − 1) = 6 = (10 − 3 − 1) · 1`.
- `3K₃` `(9, 2, 1, 0)`: `2 · (2 − 1 − 1) = 0 = (9 − 2 − 1) · 0`.
- The edgeless graph on `3` vertices, `IsSRGWith 3 0 7 0`: `0 · (0 − 7 − 1) = 0 = (3 − 0 − 1) · 0`,
  although `ℓ > k`.
- Negative control: on the empty type `IsSRGWith 0 1 5 2` holds, and
  `1 · (1 − 5 − 1) = −5 ≠ −4 = (0 − 1 − 1) · 2`; this is why `0 < n` is assumed.

*Needs:* Mathlib `SimpleGraph.IsSRGWith.param_eq`.

### 1.3 Restricted eigenvalues

- **The spectral characterization** (`exists_isSRGWith_iff_ncard_restrictedEigenvalues`). A
  `k`-regular graph that is neither complete nor edgeless is strongly regular exactly when it has
  precisely two restricted eigenvalues [BH, Theorem 9.1.2 (i)⇔(iii), p. 117]. Brouwer–Haemers
  state it without the regularity hypothesis, which their proof of (iii)⇒(ii) uses; the Checks
  show that it is needed.
- **Three eigenvalues** (`exists_isSRGWith_of_card_toFinset_adjSpectrum`). A connected `k`-regular
  graph with exactly three distinct adjacency eigenvalues is strongly regular [BH, §9.1.3,
  p. 117; N, Theorem 8.11, pp. 76–77]. Nica states the converse direction for regular graphs
  under the standing assumption that graphs are connected [N, §1.1, p. 3]; the Checks show that
  connectivity is needed. The direction from strong regularity
  to the spectrum `{k, r, s}`, under `0 < μ` and `G ≠ ⊤`, is StronglyRegularAndMooreGraphs 1.2.

**Suggested proof:** for a regular graph `A` commutes with `J` and preserves the orthogonal
complement `𝟙^⊥` of the all-ones vector. If `u ∈ 𝟙^⊥` is an eigenvector for `ρ`, the equation of
1.1 gives `ρ² = (ℓ − μ) ρ + (k − μ)`, whose discriminant is positive by 1.2, so there are at most
two restricted eigenvalues; a single one would make `A` a combination of `I` and `J`, so `G`
complete or edgeless. Conversely, with restricted eigenvalues `r ≠ s`, `(A − rI)(A − sI)`
vanishes on `𝟙^⊥` and maps `𝟙` to a multiple of `𝟙`, so it is `cJ`, and 1.1 applies. For three
eigenvalues: by GraphSpectra 3.2 (Perron–Frobenius for connected graphs, and `θ₁ = k` for a
`k`-regular graph), `k` is a simple eigenvalue with eigenvector `𝟙`, so
the other two eigenvalues are exactly the restricted ones; three distinct eigenvalues exclude
`K_n` (two) and the edgeless graph (one).

**Checks.**
- `3K₃` is disconnected with parameters `(9, 2, 1, 0)`; its restricted eigenvalues are `2`
  (eigenvector `1` on one triangle and `−1` on another) and `−1`, two of them, so the
  characterization covers `μ = 0`.
- Negative control: `C₆` is `2`-regular with spectrum `2, 1², (−1)², −2`; its restricted
  eigenvalues are `1`, `−1` and `−2`, three of them, and it is not strongly regular (1.1).
- Negative control: the star `K_{1,3}` is not regular; its eigenvectors for `±√3` have entry sum
  `√3 ± 3 ≠ 0`, so its only restricted eigenvalue is `0`.
- Negative control for regularity: `K₂` together with two isolated vertices is neither complete
  nor edgeless and has exactly two restricted eigenvalues, `−1` (eigenvector `(1, −1, 0, 0)`) and
  `0` (eigenvector `(0, 0, 1, −1)`), but its degrees are `1, 1, 0, 0`, so it is not strongly
  regular.
- Negative control for connectivity: `2K_{3,3}` is `3`-regular with the three eigenvalues `3`,
  `0`, `−3`, and is not strongly regular: two vertices in different copies have no common
  neighbour, two vertices in the same side of one copy have `3`.

*Needs:* 1.1, 1.2; GraphSpectra 1.2 and 3.2.

## Layer 2: strongly regular graphs as association schemes with two classes

The definitions are `srgClass`, `idempotentR` and `idempotentS` (Conventions), with the local
copies of StronglyRegularAndMooreGraphs 1.2 and of AssociationSchemes 1.1, 1.2 and 2.1.

*Depends on:* Layer 1; StronglyRegularAndMooreGraphs 1.2 (definitions only); AssociationSchemes
1.1, 1.2, 2.1 (definitions) and 3.1.

### 2.1 The complement

- **The complement** (`IsSRGWith.srgEigenvalues_compl`). For a strongly regular graph that is
  neither complete nor edgeless, the roots computed from Mathlib's complement parameters
  `(n − k − 1, n − (2k − μ) − 2, n − (2k − ℓ))` (truncated subtraction, as in
  `SimpleGraph.IsSRGWith.compl`) are `−1 − s` and `−1 − r` [BH, §9.1.1, p. 116; BVM, §1.1.2,
  p. 2].

The adjacency spectrum of the complement of any regular graph is GraphSpectra 3.8; the statement
here is about the roots computed from the parameters, which 2.3 and 2.4 apply to the complement.

**Suggested proof:** the truncated subtractions are exact by counting a union of two
neighbourhoods. For distinct nonadjacent `v`, `w` (there are such, as `G ≠ ⊤`) the union has
`2k − μ` vertices and misses `v` and `w`, so `2k − μ ≤ n − 2`; for an edge `vw` (as `G ≠ ⊥`) the
union has `2k − ℓ` vertices, so `2k − ℓ ≤ n`. These inequalities do not follow from the parameter
relation alone: `(10, 6, 4, 2)` satisfies `μ ≤ k`, `ℓ < k` and `k (k − ℓ − 1) = (n − k − 1) μ`,
but `2k − μ = 10 > n − 2`. Then the two discriminants agree and the roots are compared directly.

**Checks.**
- The complement of the Petersen graph is `T(5)` with `(10, 6, 3, 4)`: `r = 1 = −1 − (−2)` and
  `s = −2 = −1 − 1`.
- `3K₃` `(9, 2, 1, 0)`, `r = 2`, `s = −1`; its complement `K_{3×3}` has `(9, 6, 3, 6)`, with
  `r = 0 = −1 − (−1)` and `s = −3 = −1 − 2`.
- The folded `5`-cube `(16, 5, 0, 2)`, `r = 1`, `s = −3`; its complement `(16, 10, 6, 6)` has
  `r = 2` and `s = −2`.

*Needs:* 1.2; Mathlib `SimpleGraph.IsSRGWith.compl`,
`SimpleGraph.IsSRGWith.card_neighborFinset_union_of_not_adj`,
`SimpleGraph.IsSRGWith.card_neighborFinset_union_of_adj`.

### 2.2 Two classes

- **Strongly regular graphs are the schemes with two classes** (`isAssocScheme_srgClass_iff`).
  For a graph that is neither complete nor edgeless, `srgClass G` is an `IsAssocScheme` with
  `d = 2` exactly when `G` is strongly regular [BH, §9.1, p. 115; §11.1, p. 166].

**Suggested proof:** the counts of `IsAssocScheme.card_eq` for the classes `(1, 1)` on the
diagonal, on an edge and on a nonedge are `k`, `ℓ` and `μ`; the other counts follow from these
by `I + A + A_{Gᶜ} = J`, as in the intersection matrices of [BH, §11.1, p. 166]. Classes `0` and
`1` are nonempty because `G ≠ ⊥`, and class `2` because `G ≠ ⊤`.

**Checks.**
- Petersen: the counts for classes `(1, 1)` are `3` on the diagonal, `0` on an edge and `1` on a
  nonedge.
- Negative control: `K₄` is strongly regular, but `srgClass` has no pair in class `2`, so it is
  not an `IsAssocScheme`; this is why `G ≠ ⊤` is assumed.
- Negative control: for `C₆` the count for classes `(1, 1)` is `1` on a pair at distance `2` and
  `0` on a pair at distance `3`, both in class `2`, so `C₆` is not a scheme.

*Needs:* 1.1; AssociationSchemes 1.1 (definition).

### 2.3 Primitive idempotents and the eigenmatrix

- **The primitive idempotents** (`IsSRGWith.isPrimitiveIdempotents`). For a strongly regular
  graph that is neither complete nor edgeless, `![J/n, E_r, E_s]` is an `IsPrimitiveIdempotents`
  family for `srgClass G`, and `A = k J/n + r E_r + s E_s` [BH, §11.2, p. 167].
- **The eigenmatrix** (`IsSRGWith.eigenmatrix_srgClass`). With these idempotents, `eigenmatrix`
  has rows `(1, k, n − k − 1)`, `(1, r, −1 − r)` and `(1, s, −1 − s)` [BH, §11.2, p. 167].

**Suggested proof:** expand with the equation of 1.1, `AJ = JA = kJ`, `J² = nJ`, `r + s = ℓ − μ`
and `rs = μ − k`; `r ≠ s` because the discriminant is positive by 1.2, and `E_r`, `E_s` are
nonzero because `A` is not a combination of `I` and `J`. For the eigenmatrix, `A E_r = r E_r`,
`J E_r = 0` and `A_2 = J − I − A`, and the traces of `E_r` and `E_s` are positive because they
are nonzero orthogonal projections.

**Checks.**
- Petersen `(10, 3, 0, 1)`: `r = 1`, `s = −2`; the rows are `(1, 3, 6)`, `(1, 1, −2)` and
  `(1, −2, 1)`, and `tr E_r = 5`.
- The folded `5`-cube `(16, 5, 0, 2)`: `r = 1`, `s = −3`; the rows are `(1, 5, 10)`,
  `(1, 1, −2)` and `(1, −3, 2)`.
- `3K₃` `(9, 2, 1, 0)`: `r = 2 = k`, `s = −1`, and the rows are `(1, 2, 6)`, `(1, 2, −3)` and
  `(1, −1, 0)`. Here `tr E_r = 2`, while the eigenvalue `2` of `A` has multiplicity `3`.
- Negative control: on `2K₂` `(4, 1, 0, 0)`, `r = 1 = k` and `tr E_r = 1`, while the eigenvalue
  `1` has multiplicity `2`; the trace of `E_r` is not the multiplicity of `r` when `μ = 0`.

*Needs:* 1.1, 1.2, 2.2; AssociationSchemes 1.2 and 2.1 (definitions).

### 2.4 The Krein conditions

- **The Krein conditions** (`IsSRGWith.krein_conditions`). A strongly regular graph that is
  neither complete nor edgeless satisfies `(r + 1)(k + r + 2rs) ≤ (k + r)(s + 1)²` and
  `(s + 1)(k + s + 2rs) ≤ (k + s)(r + 1)²` [BH, §9.1.8, p. 120].

**Suggested proof:** if `0 < μ < k`, apply AssociationSchemes 3.1 (`q^c_ab ≥ 0` for every family
of primitive idempotents) to the scheme of 2.2 and the family of 2.3. From the dual eigenmatrix,
`q^1_11 = (f²/n)(1 + r³/k² − (r + 1)³/(n − k − 1)²)` and
`q^2_22 = (g²/n)(1 + s³/k² − (s + 1)³/(n − k − 1)²)`, with `f = tr E_r` and `g = tr E_s`
[BH, §11.4, Theorem 11.4.2 and the display after it, p. 171]; with `r + s = ℓ − μ`,
`rs = μ − k` and the parameter relation of 1.2, they have the signs of the two differences. If
`μ = 0`, then `ℓ = k − 1` by the parameter relation, `r = k` and `s = −1`, and both inequalities
read `0 ≤ 0` and `0 ≤ (k − 1)(k + 1)²`. If `μ = k`, then `r = 0` and `s = ℓ − k ≤ −2` (`s = −1`
would make `G` complete), and both hold directly.

**Checks.**
- Negative control: `(28, 9, 0, 4)` satisfies the parameter relation (`9 · 8 = 18 · 4`) and has
  `r = 1`, `s = −5` with integral multiplicities `21` and `6`, but the second inequality reads
  `(−4)(9 − 5 − 10) = 24 ≤ (9 − 5) · 2² = 16`, which fails; so no strongly regular graph has these
  parameters [BH, §9.1.8, p. 120]. AssociationSchemes 3.1 records `q^2_22 = −4/9` for it.
- Petersen `(10, 3, 0, 1)`, `r = 1`, `s = −2`: `2 · (3 + 1 − 4) = 0 ≤ 4 · 1 = 4` and
  `(−1)(3 − 2 − 4) = 3 ≤ 1 · 4 = 4`.
- `3K₃` (`μ = 0`), `r = 2`, `s = −1`: `3 · 0 = 0 ≤ 4 · 0 = 0` and `0 ≤ 1 · 9 = 9`.
- `K_{3×2}` `(6, 4, 2, 4)` (`μ = k`), `r = 0`, `s = −2`: `1 · 4 = 4 ≤ 4 · 1 = 4` and
  `(−1)(4 − 2) = −2 ≤ 2 · 1 = 2`.

*Needs:* 1.2, 2.2, 2.3; AssociationSchemes 3.1.

## Layer 3: the standard families

The definition is `hoffmanSingletonGraph` (Conventions), with its `DecidableRel` instance. The
spectra of these graphs follow from StronglyRegularAndMooreGraphs 1.2–1.3 and are not restated;
the Paley graphs are PaleyGraphsAndCharacterSums.

*Depends on:* GraphSpectra 2.4; Mathlib's `boxProd`, `cycleGraph` and `completeEquipartiteGraph`.

### 3.1 Triangular, lattice and complete multipartite graphs

- **Triangular graphs** (`johnsonGraph_two_isSRGWith`). For every finite `α` of size `m`,
  `T(m) = johnsonGraph α 2` is strongly regular with parameters
  `(m(m − 1)/2, 2(m − 2), m − 2, 4)` (truncated subtraction). For `m ≥ 4` this is [BH, §9.1.1 (x),
  p. 116] and [BVM, §1.1.7, p. 4]; for `m ≤ 3` the graph is complete and `μ` is arbitrary.
- **Lattice graphs** (`top_boxProd_top_isSRGWith`). `K_m □ K_m` (`SimpleGraph.boxProd`) is
  strongly regular with parameters `(m², 2(m − 1), m − 2, 2)`, for every `m` [BH, §9.1.1 (vi),
  p. 116; BVM, §1.1.8, p. 5].
- **Complete equipartite graphs and their complements** (`completeEquipartiteGraph_isSRGWith`,
  `compl_completeEquipartiteGraph_isSRGWith`). For all `m, a`, `K_{m×a}`
  (`SimpleGraph.completeEquipartiteGraph`) has parameters `(m a, (m − 1) a, (m − 2) a, (m − 1) a)`
  and `m K_a` has `(m a, a − 1, a − 2, 0)` [BH, §9.1.1 (vii), (ix), p. 116].

That `T(m)` is the line graph of `K_m` is GraphSpectra 2.5; it is not used here.

**Suggested proof:** count common neighbours. The common neighbours of `{a, b}` and `{a, c}` are
the `m − 3` sets `{a, z}` with `z ∉ {a, b, c}` and the set `{b, c}`, `m − 2` in all; those of two
disjoint `2`-sets are the `4` sets taking one point from each. In `K_m □ K_m` two vertices in a
row have the other `m − 2` vertices of the row, and two vertices in different rows and columns
have the two corners of their rectangle. In `K_{m×a}` two
vertices of different parts have the `(m − 2) a` vertices of the other parts, and two vertices of
one part have all `(m − 1) a` vertices outside it.

**Checks.**
- `T(4) = K_{3×2}` with `(6, 4, 2, 4)`; `T(5)` with `(10, 6, 3, 4)`, the complement of the
  Petersen graph; `T(6)` with `(15, 8, 4, 4)`; `T(8)` with `(28, 12, 6, 4)`.
- `T(3) = K₃` with `(3, 2, 1, 4)`: complete, and `μ = 4` is vacuous.
- Lattice `m = 3`: `(9, 4, 1, 2)`; `m = 2`: `C₄ = K_{2×2}` with `(4, 2, 0, 2)`; `m = 1`: one
  vertex with `(1, 0, 0, 2)`, where `2 · (1 − 1) = 0` and `1 − 2 = 0` truncate.
- `K_{2×3}` with `(6, 3, 0, 3)` and `3K₃` with `(9, 2, 1, 0)`.
- `m = 1`: `K_{1×a}` is edgeless with `(a, 0, 0, 0)`, and `1 K_a = K_a` with
  `(a, a − 1, a − 2, 0)`.
- Negative control: the truncated forms are the ones that hold for small `m`. For `m = 1` the
  lattice formula with integer subtraction would give `ℓ = −1`.

*Needs:* GraphSpectra 2.4 (the Johnson graph and the `DecidableRel` instances); Mathlib
`SimpleGraph.boxProd`, `SimpleGraph.completeEquipartiteGraph`.

### 3.2 The pentagon, the Petersen graph and the Hoffman–Singleton graph

- **The pentagon** (`cycleGraph_five_isSRGWith`, a sanity check of the definitions):
  `(5, 2, 0, 1)` [BH, §9.1.1 (ii), p. 115].
- **The Petersen graph** (`petersenGraph_isSRGWith`): `(10, 3, 0, 1)` [BH, §9.1.1 (iv), p. 115;
  §9.1.7 (ii), p. 119; Biggs, 3b and 3d, p. 20].
- **The Hoffman–Singleton graph** (`hoffmanSingletonGraph_isSRGWith`): `(50, 7, 0, 1)` [BH,
  §9.1.7 (iv), p. 119; BCN, §13.1, p. 391].

**Suggested proof:** for the pentagon and the Hoffman–Singleton graph, `decide` over the vertices
or by hand: each pentagon and each pentagram is `C₅`, each pentagon–pentagram pair is joined by a
perfect matching, and the union of pentagon `i` with pentagram `j` induces a Petersen graph. For
the Petersen graph, `K(5, 2)` is the complement of `J(5, 2)` (GraphSpectra 2.4); apply 3.1 and
Mathlib's `SimpleGraph.IsSRGWith.compl` to `(10, 6, 3, 4)`.

**Checks.**
- Petersen as the complement of `T(5)`: `10 − 6 − 1 = 3`, `10 − (12 − 4) − 2 = 0` and
  `10 − (12 − 3) = 1`.
- Hoffman–Singleton: `(true, 0, 0)` has the neighbours `(true, 0, 2)` and `(true, 0, 3)` in its
  pentagram and `(false, i, 0)` for the five `i ∈ ZMod 5`: degree `7`. By
  StronglyRegularAndMooreGraphs 1.3 its spectrum is `7¹ 2²⁸ (−3)²¹`.
- In the Hoffman–Singleton graph the nonadjacent pair `(false, 0, 0)`, `(true, 0, 1)` has the
  single common neighbour `(false, 0, 1)`.
- Negative control: with the pentagram step `+ 1` instead of `+ 2`, the same pair is joined
  through `(false, 0, 1)` and through `(true, 0, 0)`, two common neighbours, so `μ = 1` fails.

*Needs:* 3.1; GraphSpectra 2.4; Mathlib `SimpleGraph.cycleGraph`, `SimpleGraph.fromRel`,
`SimpleGraph.IsSRGWith.compl`.

## Layer 4: uniqueness of the pentagon and the Petersen graph

*Depends on:* Layer 3.

### 4.1 Uniqueness

- **Uniqueness of the pentagon and the Petersen graph**
  (`IsSRGWith.nonempty_iso_cycleGraph_five`, `IsSRGWith.nonempty_iso_petersenGraph`). Every
  strongly regular graph with parameters `(5, 2, 0, 1)` or `(10, 3, 0, 1)` is isomorphic to `C₅`
  or to the Petersen graph [BH, §9.1.1, p. 115, and after Theorem 9.1.5, p. 119; N, after
  Theorem 8.15, pp. 78–79; CRS, after Theorem 6.4.2, p. 170].

**Suggested proof:** for `(10, 3, 0, 1)`, fix a vertex `x` with neighbours `a`, `b`, `c`. Each of
the six vertices at distance `2` from `x` has exactly one neighbour among `a`, `b`, `c`, so they
fall into three nonadjacent pairs. They induce a triangle-free `2`-regular graph, hence a hexagon,
in which each pair is at distance `3`, since two vertices at distance `2` in the hexagon would
have two common neighbours. This determines the graph; `(5, 2, 0, 1)` is the same argument with
two neighbours.

**Checks.**
- Both parameter sets have `n = k² + 1`: `5 = 2² + 1` and `10 = 3² + 1`.
- With `x`, `a`, `b`, `c` fixed as in the proof, exactly four labelled graphs complete the
  Petersen parameters, one for each way of joining the three pairs into a hexagon with each pair
  at distance `3`; all four are isomorphic.
- Negative control: `3`-regularity on `10` vertices does not suffice. The pentagonal prism is cubic
  on `10` vertices and has `4`-cycles; of its `30` nonadjacent pairs, `10` have no common
  neighbour, `10` have one and `10` have two.

*Needs:* 3.2.

## Layer 5: designs, incidence matrices and incidence graphs

The definitions are `Design.IsTwoDesign`, `Design.IsSymmetricDesign`, `Design.replication`,
`Design.incMatrix`, `Design.incidenceGraph` and `Design.blockGraph` (Conventions), with the
`DecidableRel` instances of the two graphs.

*Depends on:* Mathlib's `Configuration`; LinearAlgebraMethodInCombinatorics 1.3;
PeriodicNonnegativeMatrices 3.3; GraphSpectra 1.2; Layer 1 for 5.5.

### 5.1 Designs and the Gram identity

- **The replication number** (`IsTwoDesign.card_blocks_through`). Every point lies on
  `r = replication v k ℓ` blocks, and `r (k − 1) = ℓ (v − 1)` [GR, (5.2), p. 95, and proof of
  Lemma 5.10.1, p. 96].
- **Counting blocks** (`IsTwoDesign.card_blocks_mul`, basic API consumed by 5.2): `b k = v r`
  [GR, §5.10, p. 95].
- **The Gram identity** (`IsTwoDesign.incMatrix_mul_transpose`). Over any commutative ring,
  `N Nᵀ = (r − ℓ) I + ℓ J` [GR, §5.10, p. 95].
- **The converse of the Gram identity** (`isTwoDesign_of_incMatrix_mul_transpose`). An incidence
  relation with `v` points, blocks of size `k`, `2 ≤ k < v` and `0 < ℓ`, and
  `N Nᵀ = (r − ℓ) I + ℓ J` over `ℤ` for some natural `r`, is a `2`-`(v, k, ℓ)` design
  [GR, §5.10, p. 95].
- **The rank of the incidence matrix** (`IsTwoDesign.rank_incMatrix`). The real incidence matrix
  of a `2`-design has rank `v` [GR, Lemma 5.10.1 and its proof, pp. 95–96].

Fisher's inequality `v ≤ b` follows from the rank, and is also LinearAlgebraMethodInCombinatorics
1.3 (the nonuniform Fisher inequality) applied, with `t = ℓ`, to the sets of blocks
through the points, which are nonempty and pairwise distinct by the nondegeneracy of the
definition; it is not restated.

**Suggested proof:** for the replication number count pairs `(q, l)` with `q ≠ p` and `p, q` on
`l`; for `b k = v r` count incident pairs. The entries of `N Nᵀ` count the blocks through one or
two points. For the converse, the diagonal of `N Nᵀ` gives every point on `r` blocks and the
off-diagonal entries give `ℓ`. For the rank, `r > ℓ` because `k < v`, so `N Nᵀ` is positive
definite and invertible (`Matrix.PosDef.isUnit`), and `Matrix.rank_mul_le_left` bounds `v` by the
rank of `N`.

**Checks.**
- The Fano plane `2`-`(7, 3, 1)`: `r = 3`, `b = 7`, `N Nᵀ = 2I + J`.
- The affine plane `AG(2, 3)`, a `2`-`(9, 3, 1)` design: `r = 4`, `b = 12 > 9`.
- Two copies of the Fano plane form a `2`-`(7, 3, 2)` design with repeated blocks: `r = 6`,
  `b = 14`, `N Nᵀ = 4I + 2J`.
- Negative control: the complete design on `3` points with the single block `{1, 2, 3}` has
  every pair on `ℓ = 1` block but `b = 1 < 3 = v`, against Fisher's inequality; `k = v` makes
  `r = ℓ` and `N Nᵀ = ℓ J` singular. The clause `k < v` excludes it.
- Negative control: with `k = 1`, two distinct points lie on no common block, so `ℓ = 0`; the
  single block `{1}` on `3` points then has `b = 1 < 3`. The clauses `2 ≤ k` and `0 < ℓ` exclude
  it.

*Needs:* Mathlib `Matrix.rank`, `Matrix.rank_mul_le_left`, `Matrix.PosDef.isUnit`;
LinearAlgebraMethodInCombinatorics 1.3.

### 5.2 Symmetric designs

- **Fisher equality** (`IsTwoDesign.isSymmetricDesign_iff`). A `2`-design is symmetric exactly
  when `r = k` [GR, §5.10, p. 95].
- **The dual of a symmetric design** (`IsSymmetricDesign.flip`). If `b = v`, the dual incidence
  `flip inc` is a symmetric design with the same parameters; in particular two distinct blocks
  meet in exactly `ℓ` points [GR, Lemma 5.10.2, p. 96].

The parameter relation `k (k − 1) = ℓ (v − 1)` of a symmetric design is 5.1 with `r = k`, and is
not restated.

**Suggested proof:** `b k = v r` (5.1) gives Fisher equality. For the dual, `N` is square and
invertible by the rank of 5.1 and Tau Ceti's `Matrix.rank_eq_card_iff_mulVec_injective`; `N`
commutes with `J` because `r = k`, so `Nᵀ N = N⁻¹ (N Nᵀ) N = N Nᵀ`, and the columns of `N` have
size `k`.

**Checks.**
- The Fano plane: any two lines meet in one point, and its complement `2`-`(7, 4, 2)` (the
  complements of the lines) has any two blocks meeting in `2` points.
- Fano: `3 · 2 = 6 = 1 · 6`. The triangle `2`-`(3, 2, 1)`: `2 · 1 = 2 = 1 · 2`.
- Negative control: `AG(2, 3)` has `r = 4 ≠ 3 = k` and is not symmetric; two of its lines meet
  in `0` or `1` points, so its dual is not a `2`-design.

*Needs:* 5.1; Tau Ceti `Matrix.rank_eq_card_iff_mulVec_injective`.

### 5.3 The incidence graph

- **The spectrum of the incidence graph** (`IsSymmetricDesign.adjSpectrum_incidenceGraph`). The
  incidence graph of a symmetric `2`-`(v, k, ℓ)` design has spectrum
  `k¹ (−k)¹ (√(k − ℓ))^(v−1) (−√(k − ℓ))^(v−1)` [N, Theorem 8.18, p. 80].

**Suggested proof:** the adjacency matrix is `[[0, N], [Nᵀ, 0]]`, whose square is
`diag(N Nᵀ, Nᵀ N)`; by 5.1–5.2 both blocks are `(k − ℓ) I + ℓ J`, with eigenvalues `k²` once
(using `k + ℓ (v − 1) = k²`) and `k − ℓ` with multiplicity `v − 1`. The spectrum of a bipartite
graph is symmetric (PeriodicNonnegativeMatrices 3.3), so each square root appears with both signs
equally often.

**Checks.**
- The Fano plane: the incidence graph is the Heawood graph, with spectrum
  `3¹ (−3)¹ (√2)⁶ (−√2)⁶`.
- The triangle `2`-`(3, 2, 1)`: the incidence graph is `C₆`, with spectrum `2, −2, 1², (−1)²`.
- `PG(2, 3)`, a `2`-`(13, 4, 1)` design: `4¹ (−4)¹ (√3)¹² (−√3)¹²`.

*Needs:* 5.1, 5.2; GraphSpectra 1.2; PeriodicNonnegativeMatrices 3.3.

### 5.4 Projective planes

- **Projective planes are symmetric designs** (`isSymmetricDesign_of_projectivePlane`). A finite
  `Configuration.ProjectivePlane P L` of order `q` (`Configuration.ProjectivePlane.order`) is a
  symmetric `2`-`(q² + q + 1, q + 1, 1)` design for `p ∈ l` [GR, §5.10, p. 94, for `PG(2, q)`].
- **Symmetric designs with `ℓ = 1` and `k ≥ 3` are projective planes**
  (`nonempty_projectivePlane_of_isSymmetricDesign`). For `q ≥ 2`, a symmetric
  `2`-`(q² + q + 1, q + 1, 1)` design on `[Membership P L]` is a `Configuration.ProjectivePlane`.

**Suggested proof:** for the first, Mathlib's `Configuration.ProjectivePlane.card_points`,
`Configuration.ProjectivePlane.pointCount_eq`, `Configuration.ProjectivePlane.lineCount_eq` and
`Configuration.HasLines.existsUnique_line`. For the second, the design gives
`Configuration.HasLines`, its dual (5.2) gives `Configuration.HasPoints`, and the three points and
three lines in general position required by `Configuration.ProjectivePlane` exist because every
block has `q + 1 ≥ 3` points and `v > q + 1`.

**Checks.**
- `PG(2, 2)` is the Fano plane, `2`-`(7, 3, 1)`; `PG(2, 3)` is `2`-`(13, 4, 1)`; `PG(2, 5)` is
  `2`-`(31, 6, 1)`.
- Negative control: for `q = 1` the triangle is a symmetric `2`-`(3, 2, 1)` design but not a
  projective plane: `Configuration.ProjectivePlane` requires a line missing two distinct points,
  and every line of the triangle misses only one. This is why `2 ≤ q` is assumed.

*Needs:* 5.1, 5.2; Mathlib `Configuration`.

### 5.5 Designs and strongly regular graphs

- **Quasi-symmetric designs give strongly regular graphs**
  (`IsTwoDesign.exists_isSRGWith_blockGraph`). If two distinct blocks of a `2`-design always meet
  in `x` or `y` points, `x ≠ y`, the block graph for `x` is strongly regular [BH, §9.1.10,
  pp. 121–122].
- **Strongly regular graphs with `ℓ = μ`** (`IsSRGWith.isSymmetricDesign`). If
  `G.IsSRGWith n k ℓ ℓ` with `2 ≤ k < n` and `0 < ℓ`, then `G.Adj` is the incidence relation of a
  symmetric `2`-`(n, k, ℓ)` design on `V` [BH, §9.1.11, p. 122; BVM, §8.3.1, p. 201].
- **Strongly regular graphs with `μ = ℓ + 2`** (`IsSRGWith.isSymmetricDesign_eq_or_adj`). If
  `G.IsSRGWith n k ℓ (ℓ + 2)` with `1 ≤ k` and `k + 1 < n`, then "equal or adjacent" is the
  incidence relation of a symmetric `2`-`(n, k + 1, ℓ + 2)` design on `V` [BH, §9.1.11, p. 122;
  BVM, §8.3.1, p. 201].

**Suggested proof:** with `A` the adjacency matrix of the block graph,
`Nᵀ N = k I + x A + y (J − I − A) = (k − y) I + (x − y) A + y J`. The Gram identity gives
`(Nᵀ N)² = (r − ℓ) Nᵀ N + ℓ k² J` and `Nᵀ N J = r k J`, so `A²` is a real combination of `A`, `I`
and `J`, and `exists_isSRGWith_iff_exists_real` (1.1) concludes. For `ℓ = μ`, the block of a
vertex is its neighbourhood, and two distinct vertices lie together in the neighbourhoods of their
`ℓ = μ` common neighbours. For `μ = ℓ + 2`, two adjacent vertices lie together in the closed
neighbourhoods of their `ℓ` common neighbours and of themselves, two nonadjacent ones in those of
their `ℓ + 2` common neighbours.

**Checks.**
- `AG(2, 3)`: the block graph for `x = 0` is `4K₃` with `(12, 2, 1, 0)`, and for `x = 1` it is
  `K_{4×3}` with `(12, 9, 6, 9)`.
- The pairs of a `6`-set, `2`-`(6, 2, 1)`: the block graph for `x = 1` is `T(6)` with
  `(15, 8, 4, 4)`, and for `x = 0` the Kneser graph `K(6, 2)` with `(15, 6, 1, 3)`.
- Two copies of the Fano plane: blocks meet in `1` or `3` points; the block graph for `x = 3` is
  `7K₂` with `(14, 1, 0, 0)`, and for `x = 1` it is `K_{7×2}` with `(14, 12, 10, 12)`.
- Negative control: the `3`-subsets of a `6`-set form a `2`-`(6, 3, 4)` design with intersection
  sizes `0`, `1` and `2`. Its block graph for `x = 2` is `J(6, 3)`, in which nonadjacent blocks
  have `0` or `4` common neighbours, so it is not strongly regular; quasi-symmetry is needed.
- The `4 × 4` rook's graph and the Shrikhande graph `(16, 6, 2, 2)`, and `T(6)` `(15, 8, 4, 4)`,
  have `ℓ = μ` and give symmetric `2`-`(16, 6, 2)` and `2`-`(15, 8, 4)` designs.
- `C₄` `(4, 2, 0, 2)` and the folded `5`-cube `(16, 5, 0, 2)` have `μ = ℓ + 2` and give
  `2`-`(4, 3, 2)` and `2`-`(16, 6, 2)` designs.
- Negative control: in the Petersen graph `μ = 1 ≠ ℓ + 2`; two adjacent vertices lie together in
  `2` closed neighbourhoods and two nonadjacent ones in `1`, so the closed neighbourhoods do not
  form a `2`-design.

*Needs:* 1.1, 5.1; Mathlib `SimpleGraph.fromRel`.

## Layer 6: the Bruck–Ryser–Chowla theorem

*Depends on:* Layer 5; Tau Ceti's Witt cancellation and roundness of Pfister forms; Mathlib's
four-square and two-square theorems.

### 6.1 The determinant and the even case

- **The determinant** (`IsSymmetricDesign.det_sq`). For a symmetric design and any bijection
  `e : P ≃ L`, `(det N_e)² = k² (k − ℓ)^(v−1)` [BVM, §8.3.1, p. 201].
- **Bruck–Ryser–Chowla, even case** (`IsSymmetricDesign.isSquare_of_even`). If `v` is even, then
  `k − ℓ` is a square [BVM, Theorem 8.3.1, p. 201].

**Suggested proof:** `det(N Nᵀ) = det((k − ℓ) I + ℓ J) = (k + ℓ (v − 1)) (k − ℓ)^(v−1)` and
`k + ℓ (v − 1) = k²`. For `v` even, `(k − ℓ)^(v−1)` is a square and `v − 1` is odd, so `k − ℓ`
is a square.

**Checks.**
- The Fano plane: `(det N)² = 576 = 3² · 2⁶`.
- `(16, 6, 2)`, `v` even: `k − ℓ = 4` is a square.
- Negative control: `(22, 7, 2)` satisfies `k (k − 1) = ℓ (v − 1) = 42`, but `v` is even and
  `k − ℓ = 5` is not a square, so no such design exists; the parameter relation alone does not
  decide existence.

*Needs:* 5.1, 5.2.

### 6.2 The rational congruence and the odd case

- **The rational congruence** (`IsSymmetricDesign.equivalent_weightedSumSquares`). With
  `m = k − ℓ`, the forms `⟨1, …, 1, m v⟩` and `⟨m, …, m, v⟩` of rank `v + 1`
  (`QuadraticMap.weightedSumSquares`) are `QuadraticMap.Equivalent` over `ℚ`. This is the step of
  the classical proof that the sources cited here leave to the literature [BVM, §8.3.1, p. 201];
  its route is below.
- **Bruck–Ryser–Chowla, odd case** (`IsSymmetricDesign.exists_brc_solution`). If `v` is odd, then
  `x² = (k − ℓ) y² + (−1)^((v−1)/2) ℓ z²` has an integer solution with `x, y, z` not all zero
  [BVM, Theorem 8.3.1, p. 201; BCN, Theorem 1.10.4, p. 23].

**Suggested proof:**
- The congruence: `N` exhibits `I_v ≅ m I + ℓ J` over `ℚ`. The line `ℚ𝟙` and its orthogonal
  complement split both `I_v` and `m I + ℓ J`, with values `v` and `k² v` on `𝟙`. Hence
  `I_v ≅ ⟨v⟩ ⊥ U` and `m I + ℓ J ≅ ⟨k² v⟩ ⊥ m U ≅ ⟨v⟩ ⊥ m U`, where `U` is `I_v` restricted to
  `𝟙^⊥`; adjoining `⟨m v⟩` to both sides gives the claim.
- `⟨m, m, m, m⟩ ≅ ⟨1, 1, 1, 1⟩` over `ℚ`, with `m > 0` because `r = k > ℓ`: Tau Ceti's
  `TauCeti.twoFoldPfister_smul_equivalent_iff` with `a = b = −1`, since `m` is a sum of four
  squares (`Nat.sum_four_squares`) and so a value of the form.
- Cancel these blocks from the congruence with Tau Ceti's `TauCeti.equivalent_of_equivalent_prod`
  and `TauCeti.equivalent_of_equivalent_prod_right`. For `v ≡ 1 (mod 4)` this leaves
  `⟨1, m v⟩ ≅ ⟨m, v⟩`; for `v ≡ 3 (mod 4)`, adjoin `⟨m⟩` and cancel once more to get
  `⟨m, m v⟩ ≅ ⟨1, v⟩`. Equivalent forms have the same unit values
  (`QuadraticMap.Equivalent.unitValueSet_eq`).
- The unit values `D` of `⟨1, −m⟩` form a subgroup of `ℚˣ`: by
  `TauCeti.oneFoldPfister_smul_equivalent_iff` each of them is a similarity factor of the form.
  `ℓ v = k² − m` is a value of `⟨1, −m⟩` at `(k, 1)`. If `v ≡ 1 (mod 4)`, `⟨m, v⟩` represents
  `1 = m a² + v b²`; either `b = 0` and `m` is a square, or `v b² = 1 − m a²` puts `v` in `D`.
  If `v ≡ 3 (mod 4)`, `⟨1, v⟩` represents `m = a² + v b²`; either `b = 0` and `m` is a square, or
  `−v b² = a² − m` puts `−v` in `D`. In each case `(−1)^((v−1)/2) ℓ ∈ D` or `m` is a square, and
  clearing denominators gives the integer solution.

**Checks.**
- `(7, 3, 1)`, `v ≡ 3 (mod 4)`: `x² = 2y² − z²` has the solution `(1, 1, 1)`.
- `(13, 4, 1)`, `v ≡ 1 (mod 4)`: `x² = 3y² + z²` has the solution `(1, 0, 1)`.
- `(111, 11, 1)`, the projective plane of order `10`: `(v − 1)/2 = 55` is odd and
  `x² = 10 y² − z²` has the solution `(1, 1, 3)`, so the theorem does not exclude it.
- The congruence for `(7, 3, 1)`: the discriminants `m v = 14` and `m^v v = 2⁷ · 7` agree modulo
  squares. For `v` even, `m v` and `m^v v` agree modulo squares only if `m` is a square, which is
  the even case again; for `(22, 7, 2)` the congruence fails.

*Needs:* 5.1, 5.2; Tau Ceti `TauCeti.equivalent_of_equivalent_prod`,
`TauCeti.equivalent_of_equivalent_prod_right`, `TauCeti.oneFoldPfister_smul_equivalent_iff`,
`TauCeti.twoFoldPfister_smul_equivalent_iff`, `QuadraticMap.Equivalent.unitValueSet_eq`; Mathlib
`Nat.sum_four_squares`.

### 6.3 The Bruck–Ryser theorem

- **The Bruck–Ryser theorem** (`exists_eq_sq_add_sq_of_projectivePlane`). If a finite projective
  plane has order `q ≡ 1` or `2 (mod 4)`, then `q` is a sum of two squares. It is the case
  `λ = 1` of 6.2, with the route below.
- **No projective plane of order six** (`projectivePlane_order_ne_six`), a sanity check of the
  Bruck–Ryser theorem at its first value.

**Suggested proof:** by 5.4 the plane is a symmetric `2`-`(q² + q + 1, q + 1, 1)` design.
`v = q² + q + 1` is odd and `(v − 1)/2 = q(q + 1)/2` is odd exactly for `q ≡ 1, 2 (mod 4)`, so
by 6.2 `x² + z² = q y²` has a nonzero integer solution, with `y ≠ 0` since `x² + z² = 0` forces
`x = z = 0`. Then `q y²` is a sum of two squares, hence so is `q` (`Nat.eq_sq_add_sq_iff`). For
order six, `6 ≡ 2 (mod 4)`, and `6` is not a sum of two squares (`a, b ≤ 2`).

**Checks.**
- `(43, 7, 1)`, the projective plane of order `6`: `(v − 1)/2 = 21` is odd and `x² + z² = 6y²`
  has no nonzero solution. Modulo `3`, `x² + z² ≡ 0` forces `3 ∣ x, z`, and then `3 ∣ y`; descend.
- The orders `q ≤ 30` with `q ≡ 1, 2 (mod 4)` that are not sums of two squares are `6`, `14`,
  `21`, `22` and `30`.
- Negative control: `q = 10 = 3² + 1²` is a sum of two squares, so the theorem says nothing
  about order `10`.

*Needs:* 5.4, 6.2; Mathlib `Nat.eq_sq_add_sq_iff`.

## Downstream consumers

Later roadmaps of algebraic and spectral graph theory cite this one by section:
- Distance-regular graphs, codes and generalized polygons: the Krein conditions of 2.4 (for
  Higman's inequality on generalized quadrangles) and the designs, duals and incidence graphs of
  5.1–5.3 (the incidence graphs of symmetric designs are the bipartite distance-regular graphs of
  diameter three [GR, Theorem 5.10.3, p. 96]).
- Line systems, switching and two-graphs: the strongly regular equation and the restricted
  eigenvalues of Layer 1.

## Scope and ownership

The roadmap is complete when Tau Ceti proves every target above. `Suggested.lean` states the
headlines that carry a Lean name, each with every conclusion the README attaches to it; it is not
an exhaustive acceptance test, and the other headlines are targets of the same standing, stated
in prose.

Owned here:
- the strongly regular equation in both directions and with real coefficients, the parameter
  bounds, the spectral characterization by two restricted eigenvalues and the three-eigenvalue
  criterion;
- the class function of a graph and its identification with a scheme of two classes, the
  spectral idempotents, the eigenmatrix, the roots of the complement and the Krein conditions in
  strongly regular form;
- the triangular, lattice, complete multipartite, pentagon, Petersen and Hoffman–Singleton graphs
  as strongly regular graphs, and the uniqueness of the pentagon and the Petersen graph;
- `2`-designs and symmetric designs as incidence relations, the replication number, the
  incidence matrix, its Gram identity and its converse, the rank of the incidence matrix, Fisher
  equality, the dual of a symmetric design, the incidence graph and its spectrum, the bridges to
  Mathlib's projective planes, the block graph of a quasi-symmetric design, and the symmetric
  designs carried by strongly regular graphs with `λ = μ` or `μ = λ + 2`;
- the Bruck–Ryser–Chowla theorem with its rational congruence, and the Bruck–Ryser theorem.

The boundary with StronglyRegularAndMooreGraphs, section by section:
- 1.1 (imprimitive graphs, a remark there): not restated; the cases `μ = 0` and `μ = k` of 2.4
  are checked directly.
- 1.2 (the spectrum `{k, r, s}` under `0 < μ` and `G ≠ ⊤`): its definitions `srgDiscriminant`,
  `srgEigenvalueR` and `srgEigenvalueS` are copied and used in Layer 2; the theorem is not used.
  The converse direction, from three eigenvalues to strong regularity, is 1.3 here.
- 1.3 (multiplicities, rationality conditions, Frame quotient), 1.4 (conference graphs and
  integral eigenvalues), 1.5 (the absolute bound): not restated and not used; Checks of 2.4 and
  3.2 quote values from 1.3.
- 2.1 (the friendship theorem), 3.1–3.4 (the Moore bounds and Moore graphs of diameter two),
  3.5 (the Hoffman–Singleton theorem): not restated and not used. 3.2 here constructs the
  Hoffman–Singleton graph, which shows that the degree `7` of 3.5 there occurs.
- The Krein conditions, the uniqueness of the Petersen and Hoffman–Singleton graphs, and strongly
  regular graphs from designs, which that roadmap places outside its scope, are 2.4, 4.1, the
  section "Beyond this roadmap" and 5.5 here.

Consumed from other roadmaps, not restated (see the supplier contracts):
- GraphSpectra 1.2, 2.4 (definitions copied), 3.2; 2.5 and 3.8 cited.
- SpectralGraphBounds 1.1 and TopologicalCombinatorics 3.1: the sorted eigenvalues and the
  Kneser graph, copied as GraphSpectra copies them.
- AssociationSchemes 1.1, 1.2, 2.1 (definitions copied) and 3.1. Its Johnson scheme (5.1), which
  contains `T(m)` and the Petersen graph as classes, is not used.
- PeriodicNonnegativeMatrices 3.3.
- [LinearAlgebraMethodInCombinatorics](../LinearAlgebraMethodInCombinatorics/README.md) 1.3.

Neighbouring roadmaps, not used here:
- PaleyGraphsAndCharacterSums: the Paley graphs, their strong regularity (1.2),
  self-complementarity (1.3) and spectrum (2.1–2.2).
- DelsarteTheoryOfCodesAndDesigns: Delsarte `t`-designs in the Johnson scheme and Fisher-type
  bounds (3.1, 4.2), for families of `k`-subsets without repeated blocks; the incidence-matrix
  theory of a single `2`-design, symmetric designs and the Bruck–Ryser–Chowla theorem are here.
- EquiangularLinesAndTwoGraphs: Seidel matrices and regular two-graphs (2.3–2.4); the
  correspondence of regular two-graphs with strongly regular graphs through descendants is stated
  in neither roadmap.
- [GlobalQuadraticForms](../GlobalQuadraticForms/README.md): the Hasse–Minkowski theorem (5.5,
  6.3), from which the Bruck–Ryser–Chowla condition can also be read locally; the proof of 6.2
  here needs only Witt cancellation and roundness.

Already in the libraries and therefore not targets: the `IsSRGWith` API with the parameter
relation, the complement parameters and diameter two, the projective-plane API, and the
four-square and two-square theorems (Mathlib); Witt cancellation, roundness of one- and two-fold
Pfister forms, and the rank criterion `Matrix.rank_eq_card_iff_mulVec_injective` (Tau Ceti).

Outside the scope: constructions of strongly regular graphs from codes, geometries and groups
beyond Layer 3; `t`-designs for `t ≥ 3`; Hadamard matrices; residual and derived designs; the
uniqueness of the Hoffman–Singleton graph, polarities of symmetric designs and rank-three groups,
which the section "Beyond this roadmap" describes.

Boundary in one sentence: the strongly regular equation and its spectral characterizations
(Layer 1), the two-class scheme of a strongly regular graph with its Krein conditions (Layer 2),
the families and uniqueness results of Layers 3 and 4, and the incidence-matrix theory of a
single `2`-design with its passages to strongly regular graphs and the Bruck–Ryser–Chowla
theorem (Layers 5 and 6) are here; the spectrum of a strongly regular graph and its consequences
are StronglyRegularAndMooreGraphs, the Paley graphs are PaleyGraphsAndCharacterSums, and schemes
with more than two classes are AssociationSchemes.

## Exact supplier contracts

### From Mathlib

- `SimpleGraph.IsSRGWith` (`card`, `regular`, `of_adj`, `of_not_adj`, for `[Fintype V]` and
  `[DecidableRel G.Adj]`) with `SimpleGraph.IsSRGWith.matrix_eq` (`A² = k I + ℓ A + μ A_{Gᶜ}` over
  any semiring), `SimpleGraph.IsSRGWith.param_eq` (`k (k − ℓ − 1) = (n − k − 1) μ` for `0 < n`),
  `SimpleGraph.IsSRGWith.compl` (parameters `(n, n − k − 1, n − (2k − μ) − 2, n − (2k − ℓ))`),
  `SimpleGraph.IsSRGWith.top`, `SimpleGraph.bot_strongly_regular` and
  `SimpleGraph.IsSRGWith.ediam_eq_two`; used in Layers 1–3.
- `SimpleGraph.one_add_adjMatrix_add_compl_adjMatrix_eq_of_one`,
  `SimpleGraph.adjMatrix_pow_apply_eq_card_walk`,
  `SimpleGraph.adjMatrix_mulVec_const_apply_of_regular`; used in Layers 1–2.
- `SimpleGraph.boxProd`, `SimpleGraph.cycleGraph`, `SimpleGraph.completeEquipartiteGraph` (on
  `Fin m × Fin a`, adjacent when the first coordinates differ), `SimpleGraph.fromRel`; used in
  Layers 3–5.
- `Matrix.rank`, `Matrix.rank_mul_le_left`, `Matrix.PosDef.isUnit`,
  `CompleteOrthogonalIdempotents`, `Real.sqrt`; used in Layers 2 and 5.
- `Configuration.ProjectivePlane` on `[Membership P L]`, with
  `Configuration.ProjectivePlane.order`, `Configuration.ProjectivePlane.card_points`,
  `Configuration.ProjectivePlane.pointCount_eq`, `Configuration.ProjectivePlane.lineCount_eq`,
  `Configuration.HasLines.existsUnique_line`, `Configuration.HasPoints`, and
  `Configuration.HasLines.card_le` (Fisher's inequality for `λ = 1`); used in 5.4 and 6.3.
- `QuadraticMap.weightedSumSquares`, `QuadraticMap.Equivalent`, `Nat.sum_four_squares`,
  `Nat.eq_sq_add_sq_iff`; used in Layer 6.

### From Tau Ceti

- `TauCeti.LinearAlgebra.Matrix.Rank`: `Matrix.rank_eq_card_iff_mulVec_injective` (a matrix
  `B : Matrix m n R` has rank `card n` exactly when `B *ᵥ ·` is injective); used in 5.2.
- `TauCeti.LinearAlgebra.QuadraticForm.Witt.Cancellation`:
  `TauCeti.equivalent_of_equivalent_prod` and `TauCeti.equivalent_of_equivalent_prod_right`
  (over a field `K` with `[Invertible (2 : K)]`, a nondegenerate finite-dimensional summand
  `Q₀` cancels from `(Q₀.prod Q₁).Equivalent (Q₀.prod Q₂)`, on either side); used in 6.2.
- `TauCeti.LinearAlgebra.QuadraticForm.Witt.Round`:
  `TauCeti.oneFoldPfister_smul_equivalent_iff` and `TauCeti.twoFoldPfister_smul_equivalent_iff`
  (over a commutative ring, for a unit `c`, `c • ⟨1, −a⟩ ≅ ⟨1, −a⟩` and
  `c • ⟨1, −a, −b, ab⟩ ≅ ⟨1, −a, −b, ab⟩` exactly when `c` is a value of the form); used in 6.2.
- `TauCeti.LinearAlgebra.QuadraticForm.Representation`: `QuadraticMap.unitValueSet` (the units
  that a form represents) and `QuadraticMap.Equivalent.unitValueSet_eq`; used in 6.2.

### From GraphSpectra

The roadmap GraphSpectra:
- 1.2: the definition `adjSpectrum` (with the sorted adjacency eigenvalues of
  SpectralGraphBounds 1.1 it is built on), copied verbatim; used in 1.3 and 5.3.
- 2.4: the definitions `johnsonGraph` and `petersenGraph` with the Kneser graph of
  TopologicalCombinatorics 3.1 they rest on, and the `DecidableRel` instances for the Johnson
  graph, the Kneser graph and `SimpleGraph.boxProd`, copied verbatim; the theorem that `K(m, 2)`
  is the complement of `J(m, 2)`. Used in Layers 3–4.
- 3.2: for connected `G`, `θ₁` is a simple eigenvalue with a positive eigenvector, and `θ₁ = k`
  for a `k`-regular graph on a nonempty vertex type; used in 1.3.
- 2.5 (`J(m, 2) ≅ L(K_m)`) and 3.8 (the spectrum of the complement of a regular graph) are cited
  in 3.1 and 2.1 and are not dependencies.

### From SpectralGraphBounds

The roadmap SpectralGraphBounds, 1.1: the sorted adjacency eigenvalues `adjEigenvalues`
(Mathlib's `eigenvalues₀` of `G.adjMatrix ℝ`, index `0` the largest), copied verbatim as
GraphSpectra copies it, under `adjSpectrum`. No theorem of it is used.

### From TopologicalCombinatorics

The roadmap TopologicalCombinatorics, 3.1: the Kneser graph on `{s : Finset α | s.card = k}`,
copied verbatim as GraphSpectra copies it, under `petersenGraph`. No theorem of it is used.

### From StronglyRegularAndMooreGraphs

The roadmap StronglyRegularAndMooreGraphs, 1.2: the definitions `srgDiscriminant`,
`srgEigenvalueR` and `srgEigenvalueS`, copied verbatim, used in Layer 2. No theorem of it is used;
its 1.3 is quoted in Checks.

### From AssociationSchemes

The roadmap AssociationSchemes:
- 1.1, 1.2, 2.1: the definitions `IsAssocScheme`, `adjMat`, `bmAlgebra`,
  `IsPrimitiveIdempotents` and `eigenmatrix`, copied verbatim; used in 2.2–2.3.
- 3.1: for a scheme `rel` and a family `E` of primitive idempotents,
  `E i ⊙ E j = |X|⁻¹ ∑_c q^c_ij E c` and `0 ≤ q^c_ij`, with the Krein parameters computed from the
  dual eigenmatrix; used in 2.4.

### From PeriodicNonnegativeMatrices

The roadmap PeriodicNonnegativeMatrices, 3.3: a graph is bipartite exactly when every `μ` and
`−μ` have the same root multiplicity in the characteristic polynomial of `G.adjMatrix ℝ`; the
forward direction, that the spectrum of a bipartite graph is symmetric, is used in 5.3.

### From LinearAlgebraMethodInCombinatorics

[LinearAlgebraMethodInCombinatorics](../LinearAlgebraMethodInCombinatorics/README.md), 1.3: for
a finite `α` and `F : Finset (Finset α)` of nonempty sets any two distinct members of which meet
in exactly `t` elements, `#F ≤ Fintype.card α`. Fisher's inequality for `2`-designs is its
instance for the sets of blocks through the points; cited in 5.1 and not restated.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

- **Uniqueness of the Hoffman–Singleton graph.** Every strongly regular graph with parameters
  `(50, 7, 0, 1)` is isomorphic to the graph of 3.2. The textbooks cited here state it, most of
  them citing Hoffman and Singleton (1960), and none prove it: [BH, after Theorem 9.1.5, p. 119];
  [BVM, §10.19, p. 285]; [BCN, §13.1, p. 391], which also cites James; [Biggs, p. 188];
  [N, after Theorem 8.15, pp. 78–79]; [CRS, after Theorem 6.4.2, p. 170]. [GR, Lemma 5.9.1,
  pp. 92–93] proves one ingredient: a coclique has at most `15` vertices, and every vertex
  outside a `15`-coclique has exactly `3` neighbours in it. A roadmap would start from a proof read
  in Hoffman and Singleton's paper or in James's, decompose the graph into five pentagons and five
  pentagrams, and identify the matchings between them with Robertson's construction.
- **Polarities.** The symmetric designs of 5.5 are exactly those with a polarity without absolute
  points (`λ = μ`) or with all points absolute (`μ = λ + 2`) [BH, §9.1.11, p. 122].
- **Rank-three groups.** A transitive permutation group of rank three with symmetric orbitals
  gives a pair of complementary strongly regular graphs [BH, §9.1.9, p. 121].

## References

- [BH] Andries E. Brouwer and Willem H. Haemers, *Spectra of Graphs*, Universitext, Springer,
  2012 (ISBN 978-1-4614-1938-9; pages are those of this printed edition, not of the authors'
  online preprint): §9.1, pp. 115–122; §11.1, p. 166; §11.2, p. 167; §11.4, p. 171.
- [BVM] Andries E. Brouwer and Hendrik Van Maldeghem, *Strongly Regular Graphs*, Encyclopedia of
  Mathematics and its Applications 182, Cambridge University Press, 2022: §1.1, pp. 2–5; §8.3.1,
  p. 201; §10.19, p. 285.
- [GR] Chris Godsil and Gordon Royle, *Algebraic Graph Theory*, Graduate Texts in Mathematics 207,
  Springer, 2001: §5.9, pp. 92–93; §5.10, pp. 94–96.
- [N] Bogdan Nica, *A Brief Introduction to Spectral Graph Theory*, EMS Textbooks in Mathematics,
  European Mathematical Society, 2018: §1.1, p. 3; Theorems 8.11, 8.15 and 8.18, pp. 76–80.
- [CRS] Dragoš Cvetković, Peter Rowlinson and Slobodan Simić, *An Introduction to the Theory of
  Graph Spectra*, London Mathematical Society Student Texts 75, Cambridge University Press, 2010:
  Theorem 6.4.2, p. 170.
- [BCN] Andries E. Brouwer, Arjeh M. Cohen and Arnold Neumaier, *Distance-Regular Graphs*,
  Ergebnisse der Mathematik und ihrer Grenzgebiete (3) 18, Springer, 1989: Theorem 1.10.4, p. 23;
  §13.1, p. 391.
- [Biggs] Norman Biggs, *Algebraic Graph Theory*, 2nd ed., Cambridge Mathematical Library,
  Cambridge University Press, 1993: Additional results 3b–3d, p. 20; p. 188.
- A. J. Hoffman and R. R. Singleton, On Moore graphs with diameters 2 and 3, *IBM Journal of
  Research and Development* 4 (1960), 497–504.

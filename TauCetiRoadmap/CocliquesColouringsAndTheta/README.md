# Roadmap: cocliques, colourings and theta

**Summary.** The independence number `α`, the clique number `ω` and the chromatic number `χ` of
a finite graph are hard to compute, and they are bounded by eigenvalues and by relaxations. This
roadmap develops the parts of that theory that rest on weighted matrices and on graph
homomorphisms: the weighted forms of the eigenvalue bounds for cocliques, the equality case of
Wilf's bound and the eigenvalue bound for partitions into complete bipartite graphs, the
chromatic polynomial under deletion and contraction, cores, fractional and vector colourings, the
values of the Lovász theta function on symmetric families together with Haemers' rank bound, and
the Kneser graphs as the running example. Its headline theorems are these.

- *Weighted coclique bounds.* For a real symmetric matrix `B` with zero diagonal that vanishes at
  the non-edges, `α` is at most the number of nonnegative and at most the number of nonpositive
  eigenvalues of `B`; if `I + B − J/c` is positive semidefinite, then `α ≤ c`; and if `B` has
  constant row sums `b` and least eigenvalue `s < b`, then `α ≤ n(−s)/(b − s)`. A
  vertex-transitive graph has `αω ≤ n`.
- *Colourings and eigenvalues.* A connected graph has `χ = 1 + θ₁` exactly when it is complete
  or an odd cycle. A partition of the edges into `m` complete bipartite graphs has `m` at least
  the number of positive and at least the number of negative eigenvalues.
- *Chromatic polynomials.* For an edge `uv`, `C_G = C_{G−uv} − C_{G/uv}`, where the contraction
  merges `v` into `u` and merges parallel edges. Trees, cycles, complete graphs and disjoint
  unions have the classical chromatic polynomials, and the coefficients of `C_G` alternate
  strictly in sign from `t^n` down to `t^c`, `c` the number of components, and vanish below.
- *Cores.* Every finite graph retracts onto an induced subgraph that is a core, unique up to
  isomorphism; two graphs are homomorphically equivalent exactly when their cores are
  isomorphic; the core of a vertex-transitive graph is vertex-transitive and its order divides
  that of the graph; a homomorphism `G → H` into a vertex-transitive `H` gives
  `|V(G)|/α(G) ≤ |V(H)|/α(H)`; every finite monoid is the endomorphism monoid of a finite graph.
- *Fractional colourings.* The fractional chromatic number `χ_f` is attained at a rational
  weighting, equals the value of the dual linear program, satisfies `n/α ≤ χ_f ≤ χ` with
  `χ_f = n/α` for vertex-transitive graphs, and is the least `v/r` over the homomorphisms from
  `G` to Kneser graphs `K(v, r)`.
- *Theta values and capacity.* A regular graph of degree `k > 0` that is edge-transitive or
  strongly regular has `ϑ = −nθₙ/(k − θₙ)`. Over any field, the Shannon capacity is at most the
  rank of a matrix with nonzero diagonal that vanishes at distinct nonadjacent pairs. The strict
  vector chromatic number of `G` is `ϑ(Ḡ)`.
- *Kneser graphs.* For `1 ≤ k` and `2k ≤ v`, the least eigenvalue of `K(v, k)` is
  `−C(v − k − 1, k − 1)`, `χ_f(K(v, k)) = v/k` and `ϑ(K(v, k)) = C(v − 1, k − 1)`; for
  `2k < v`, `K(v, k)` is a core.

The roadmap sits on GraphSpectra, which supplies the adjacency spectrum, the Kneser spectrum and
the monotonicity of the index; on GraphSymmetryAndCayleyGraphs, which supplies vertex- and
edge-transitivity and the transitivity of Kneser graphs; on LovaszThetaFunction, whose theta
function, eigenvalue form, ratio bound and vertex-transitive product formula are consumed and
not restated here; on SpectralGraphBounds and GraphColouring for the unweighted eigenvalue
bounds, the degeneracy bound and Brooks' theorem; and on TuttePolynomialAndArrangements for the
chromatic polynomial in Whitney's form and its count of colourings.

## How to read the build

Layer 1 proves the weighted coclique bounds and the clique–coclique bound, with the counting
lemma for vertex-transitive graphs that Layers 4 and 5 reuse. Layer 2 proves the equality case
of Wilf's bound and the eigenvalue bound for biclique partitions. Layer 3 treats the chromatic
polynomial: contraction, deletion–contraction, the standard graphs and the signs of the
coefficients. Layer 4 develops homomorphisms and cores, and Layer 5 fractional colourings. Layer 6
proves the theta values of edge-transitive and strongly regular graphs, Haemers' bound and the
theory of vector colourings. Layer 7 treats Kneser graphs and uses Layers 4, 5 and 6.

Layers 1, 2 and 3 are independent of each other; Layers 4 and 5 use the counting lemma of 1.2,
and no other layer uses Layer 3.

## Conventions

- **Graphs.** A graph is `G : SimpleGraph V` with `[Fintype V]`, `[DecidableEq V]` and
  `[DecidableRel G.Adj]`, and `n = Fintype.card V`. Statements hold for every finite `V`, the
  empty type included, unless a hypothesis such as `Nonempty V` is written. The complement is
  `Gᶜ`, written `Ḡ` in prose. A coclique is a finset `s` with `G.IsIndepSet (s : Set V)`.
- **Eigenvalues.** `adjEigenvalues G i` is `θ_{i+1}` in nonincreasing order, so index `0`
  carries the largest eigenvalue; it is the value at `i` of Mathlib's
  `Matrix.IsHermitian.eigenvalues₀` for `G.adjMatrix ℝ`. On a nonempty vertex type
  `θ₁ = largestEigenvalue G` and `θₙ = smallestEigenvalue G`. These are the definitions of
  SpectralGraphBounds 1.1, and `adjSpectrum G`, the multiset of eigenvalues, is that of
  GraphSpectra 1.2; `Suggested.lean` carries verbatim copies, so the theorems of those roadmaps
  apply as stated. The eigenvalues of a weighted adjacency matrix `B` are
  `hB.isHermitian.eigenvalues₀`, also nonincreasing.
- **Numbers.** `α = G.indepNum` and `ω = G.cliqueNum` are natural numbers. `χ = G.chromaticNumber`
  is in `ℕ∞`; real-valued statements use `G.chromaticNumber.toNat`, which is the chromatic number
  of a finite graph.
- **Junk values.** Real quotients follow Lean, `x / 0 = 0`. Every bound with a denominator
  `k − θₙ` or `b − s` carries a hypothesis (`0 < k`, `s < b`) that makes it nonzero; for `V`
  empty the quotient `n/α` is `0/0 = 0`, and the statements that contain it hold with that
  value. The fractional chromatic number is the infimum of a set that contains the total weight
  of the singleton weighting and is bounded below by `0`; the vector chromatic numbers are infima
  of nonempty sets bounded below by `1`. The Shannon capacity is a supremum of numbers in
  `[0, n]`.
- **Symmetry.** `IsVertexTransitive G` and `IsEdgeTransitive G` are the definitions of
  GraphSymmetryAndCayleyGraphs 1.1, copied verbatim. Its defining lemma, that for all vertices
  `u`, `v` some automorphism sends `u` to `v`, is the hypothesis of LovaszThetaFunction 4.2.
- **The theta function** is `lovaszTheta G` of LovaszThetaFunction 1.1, copied verbatim: the
  supremum of the entry sum of positive semidefinite real matrices of trace `1` that vanish at
  adjacent pairs. With this convention `α(G) ≤ ϑ(G) ≤ χ(Ḡ)`, and `ϑ = 0` on the empty type.
  Strong powers `strongPow G k` live on `Fin k → V`, and `shannonCapacity G` is the supremum over
  `k ≥ 1` of `α(G^⊠k)^(1/k)` (LovaszThetaFunction 3.1 and 5.1, copied verbatim).
- **Kneser graphs** are `kneserGraph α k` of TopologicalCombinatorics 3.1, defined through
  `kneserGraphOf`: the graph on `{s : Finset α | s.card = k}` joining distinct disjoint sets,
  with `v = |α|`. `K(5, 2)` is the Petersen graph of GraphSpectra 2.4.
- **Odd cycles** are given by the predicate `IsOddCycle` of GraphColouring 2.1, copied verbatim:
  `G` is isomorphic to Mathlib's `cycleGraph m` for an odd `m ≥ 3`.
- **Chromatic polynomials** are in `ℤ[X]`, and `m = #G.edgeFinset`. The chromatic polynomial
  `chromaticPolynomial G` and the component count `numComponents` of an edge set, which counts
  isolated vertices, are those of TuttePolynomialAndArrangements 4.1 and 4.2, copied verbatim.
  The chromatic polynomial of the graph on the empty type is `1`. Edge deletion is
  `G.deleteEdges {s(u, v)}`.
- **Contraction.** `contract G u v` lives on `{x // x ≠ v}`: `v` is merged into `u`, the edge
  `uv` disappears and parallel edges merge. It is used with `G.Adj u v`. Contraction in the cycle
  matroid, which keeps parallel elements, is TuttePolynomialAndArrangements' and is not used.

## Layer 1: weighted coclique bounds and the clique–coclique bound

### 1.1 Weighted adjacency matrices

Definition: `IsWeightedAdjMatrix G B`, a real symmetric matrix with zero diagonal and
`B x y = 0` at distinct nonadjacent pairs [BH, §3.5.1, p. 39].

Basic API, stated in prose: `G.adjMatrix ℝ` is a weighted adjacency matrix; the weighted
adjacency matrices of `G` form a subspace; a weighted adjacency matrix of `G` is one of every
graph on `V` containing `G`; a coclique `s` indexes a zero principal submatrix of every weighted
adjacency matrix.

- **Weighted inertia bound** (`IsWeightedAdjMatrix.indepNum_le`). `α` is at most the number of
  nonnegative eigenvalues of `B` and at most the number of nonpositive ones [BH, Theorem 3.5.4,
  p. 39]. The case `B = A` is SpectralGraphBounds 3.1.
- **Positive semidefinite coclique bound** (`IsWeightedAdjMatrix.indepNum_le_of_posSemidef`). If
  `I + B − c⁻¹J` is positive semidefinite for a weighted adjacency matrix `B` and `c > 0`, then
  `α ≤ c` [BH, Theorem 3.5.5a, p. 40].
- **Weighted ratio bound** (`IsWeightedAdjMatrix.indepNum_le_of_rowSum`). If a weighted adjacency
  matrix `B` has constant row sums `b` and least eigenvalue `s < b`, then `α ≤ n(−s)/(b − s)`
  [BH, Theorem 3.5.5, p. 40].

**Suggested proof:** for the inertia bound, the characteristic vectors of the subsets of a
coclique of size `a` span an `a`-dimensional space on which the quadratic form of `B` vanishes;
the max–min formula (Tau Ceti `LinearMap.IsSymmetric.eigenvalues_eq_iSup_iInf_re_inner`, or
Cauchy interlacing, [RandomMatrices](../RandomMatrices/README.md) 1.2) gives `θ_a(B) ≥ 0`, and
the same argument for `−B` gives `θ_{n−a+1}(B) ≤ 0`. For the semidefinite bound, the quadratic
form at the characteristic vector of a coclique `C` is `|C| − |C|²/c ≥ 0` [BH, p. 40]. For the
ratio bound, `B` fixes `𝟙` with eigenvalue `b` and preserves `𝟙^⊥`, so `s < b` forces `B ≠ 0`,
and a nonzero real symmetric matrix of trace `0` has `s < 0`; the matrix
`B − sI − ((b − s)/n)J` kills `𝟙` and is `B − sI ≥ 0` on `𝟙^⊥`, so the semidefinite bound applied
to `B/(−s)` with `c = n(−s)/(b − s)` gives the claim.

**Checks.**
- `IsWeightedAdjMatrix`: `G.adjMatrix ℝ` and `0` are weighted adjacency matrices of every `G`.
- Negative control for the diagonal: `I` is not a weighted adjacency matrix of `K₂`. It has no
  nonpositive eigenvalue, while `α(K₂) = 1`, so the inertia bound for `B = I` would claim
  `α ≤ 0`.
- Negative control for the support: on the path `0 − 1 − 2` a matrix with `B 0 2 ≠ 0` is not a
  weighted adjacency matrix; the coclique `{0, 2}` then indexes a nonzero principal submatrix.
- The Petersen graph (spectrum `3, 1⁵, (−2)⁴`, `α = 4`): `B = A` has `6` nonnegative and `4`
  nonpositive eigenvalues, so the inertia bound gives `α ≤ 4`. With `B = A/2` and `c = 4` the
  matrix `I + B − J/4` has eigenvalue `0` on `𝟙`, `3/2` on the `1`-eigenspace and `0` on the
  `−2`-eigenspace, so it is positive semidefinite and `α ≤ 4`; the ratio bound with `B = A` gives
  `10 · 2/5 = 4`.
- Negative control for `s < b`: `B = 0` on an edgeless graph with `n ≥ 1` vertices has
  `b = s = 0`, and the quotient `n · 0/0 = 0` would bound `α = n` by `0`.

*Needs:* SpectralGraphBounds 1.1, 3.1; RandomMatrices 1.2 or Tau Ceti Courant–Fischer.

### 1.2 The clique–coclique bound

Basic API, the counting lemma: for a vertex-transitive graph the number of automorphisms sending
`x` to `y` is `|Aut G|/n` for all `x`, `y` (orbit–stabilizer,
`MulAction.card_orbit_mul_card_stabilizer_eq_card_group`), so the number sending `x` into a set
`t` is `#t · |Aut G|/n`.

- **Clique–coclique bound** (`IsVertexTransitive.indepNum_mul_cliqueNum_le`). A
  vertex-transitive graph has `αω ≤ n`. It is the inequality `ω ≤ ω* = n/α` of [GR, §7.2,
  p. 137], from `ω ≤ ω*` and Lemma 7.2.2 there.

**Suggested proof:** a clique `K` and a coclique `S` meet in at most one vertex, and so do `gK`
and `S` for every automorphism `g`. Summing `|gK ∩ S|` over the automorphism group with the
counting lemma gives `|K| |S| |Aut G|/n ≤ |Aut G|`.

**Checks.**
- `C₅`: `αω = 2 · 2 = 4 ≤ 5`; `K₃ □ K₃`: `αω = 3 · 3 = 9 = n`.
- Negative control for vertex-transitivity: the star `K_{1,3}` has `α = 3`, `ω = 2` and
  `αω = 6 > 4`.

*Needs:* GraphSymmetryAndCayleyGraphs 1.1; Mathlib
`MulAction.card_orbit_mul_card_stabilizer_eq_card_group`.

## Layer 2: equality in Wilf's bound and biclique partitions

### 2.1 Equality in Wilf's bound

- **Equality in Wilf's bound** (`Connected.chromaticNumber_eq_one_add_iff`). A connected graph
  has `χ = 1 + θ₁` exactly when it is complete or an odd cycle [BH, Proposition 3.6.1, p. 40].

**Suggested proof:** the inequality `χ ≤ 1 + θ₁` is SpectralGraphBounds 2.1. Suppose equality
holds with `m = χ`. By the contrapositive of the degeneracy bound of GraphColouring 1.1, some
nonempty set of vertices has every vertex of degree at least `m − 1` inside it; let `H` be the
induced subgraph. Then `m − 1 ≤ 2|E(H)|/|V(H)| ≤ θ₁(H) ≤ θ₁(G) = m − 1` (SpectralGraphBounds 1.2,
and interlacing for induced subgraphs, SpectralGraphBounds 1.1), so the minimum degree of `H`
equals its average degree and `H` is `(m − 1)`-regular. The index of a connected graph exceeds
that of every copy with fewer vertices (GraphSpectra 3.4), so `H = G`. Hence `G` is
`(m − 1)`-regular with `χ = Δ + 1`, and GraphColouring 2.2 makes it complete or an odd cycle.
Conversely `θ₁(Kₙ) = n − 1` and `θ₁(C_m) = 2` [BH, p. 40].

**Checks.**
- `Kₙ` and the odd cycles attain the bound: `χ(Kₙ) = n = 1 + (n − 1)`, `χ(C₅) = 3 = 1 + 2`.
- The Petersen graph has `χ = 3 < 4 = 1 + θ₁`, and the path `P₃` has `χ = 2 < 1 + √2`.
- Negative control for connectivity: `K₃ ⊔ K₁` has `χ = 3 = 1 + θ₁` and is neither complete
  nor an odd cycle.

*Needs:* SpectralGraphBounds 1.1, 1.2, 2.1; GraphSpectra 3.4; GraphColouring 1.1, 2.2.

### 2.2 Biclique partitions

Definition: `IsBicliquePartition G X Y` for `X Y : Fin m → Finset V`: each `X k` is disjoint
from `Y k`, and `u ∼ v` exactly when exactly one `k` has `u ∈ X k, v ∈ Y k` or `v ∈ X k, u ∈ Y k`.
For `G = ⊤` it is the biclique decomposition of `Kₙ` in
[LinearAlgebraMethodInCombinatorics](../LinearAlgebraMethodInCombinatorics/README.md) 4.1.

- **Graham–Pollak inequality** (`IsBicliquePartition.card_le`). A partition of the edges of `G`
  into `m` complete bipartite graphs has `m` at least the number of positive and at least the
  number of negative eigenvalues [BH, §1.5.2, Proposition 1.5.1, p. 12]. For `Kₙ`, which has
  `n − 1` negative eigenvalues, this is the bound `n ≤ m + 1` of
  LinearAlgebraMethodInCombinatorics 4.2.

**Suggested proof:** `A = Σ_k (a_k b_kᵀ + b_k a_kᵀ)` with `a_k`, `b_k` the characteristic
vectors of `X k`, `Y k`. On the subspace `{x | a_kᵀx = 0 for all k}`, of codimension at most
`m`, the form `xᵀAx` vanishes, so it meets the span of the eigenvectors for positive
eigenvalues only in `0`; likewise for the negative ones [BH, p. 12].

**Checks.**
- `C₄` is the single biclique `{0, 2} | {1, 3}`, and `n₊ = n₋ = 1`.
- `C₅` has eigenvalues `2, 0.618², (−1.618)²`, so `n₊ = 3`; the three bicliques `{1} | {0, 2}`,
  `{3} | {2, 4}` and `{4} | {0}` partition its edges.
- `K₄` has `n₋ = 3`, and the stars `{0} | {1, 2, 3}`, `{1} | {2, 3}`, `{2} | {3}` partition its
  edges.
- Negative control for "exactly one": on `K₃` the stars `{0} | {1, 2}` and `{1} | {0, 2}` cover
  the edge `01` twice and are not a biclique partition.

*Needs:* SpectralGraphBounds 1.1; LinearAlgebraMethodInCombinatorics 4.1.

## Layer 3: the chromatic polynomial

The chromatic polynomial `chromaticPolynomial G = Σ_{F ⊆ E} (−1)^{|F|} t^{c(F)}`, with `c(F)`
the component count `numComponents`, and the theorem that its value at `k : ℕ` is the number of
proper colourings `G.Coloring (Fin k)` are TuttePolynomialAndArrangements 4.1–4.2. Two integer
polynomials that agree at every natural number are equal (`Polynomial.eq_of_infinite_eval_eq`),
so identities between chromatic polynomials follow from bijections between colourings.

### 3.1 Contraction and deletion–contraction

Definition: `contract G u v` on `{x // x ≠ v}`, built with `SimpleGraph.fromRel` from the
relation "`x ∼ y` in `G`, or `x = u` and `v ∼ y` in `G`", with its `DecidableRel` instance.

- **Neighbourhood** (`contract_adj_iff`). For `u ≠ v`, the merged vertex `u` is adjacent to `y`
  exactly when `y ≠ u` and `y` is a neighbour of `u` or of `v`; other adjacencies are those of
  `G`.
- **Deletion–contraction** (`chromaticPolynomial_eq_sub`). For an edge `uv`,
  `C_G = C_{G−uv} − C_{G/uv}` [B, Proposition 9.3, p. 65].

**Suggested proof:** the colourings of `G − uv` split into those colouring `u`, `v` differently,
which are the colourings of `G`, and those colouring them alike, which correspond to the
colourings of `G/uv` by restriction to `{x // x ≠ v}` and by colouring `v` like `u` [B, p. 65];
conclude by `Polynomial.eq_of_infinite_eval_eq`. The route uses only the colouring count of
TuttePolynomialAndArrangements 4.2 and no comparison with contraction in the cycle matroid.

**Checks.**
- `contract`: contracting an edge of `C₄` gives `K₃`; contracting the edge of `K₂` gives one
  vertex and no edge, since the loop is discarded.
- Deletion–contraction on `K₃`, edge `01`:
  `C_{P₃} − C_{K₂} = t(t − 1)² − t(t − 1) = t(t − 1)(t − 2)`. On `C₄`, an edge:
  `t(t − 1)³ − t(t − 1)(t − 2)`, which is `2` at `t = 2`.
- Negative control for `G.Adj u v`: contracting the non-adjacent ends of the path `0 − 1 − 2`
  gives `K₂`, and `C_{P₃} = t(t − 1)²` differs from `C_{P₃} − C_{K₂}`.

*Needs:* TuttePolynomialAndArrangements 4.2; Mathlib `SimpleGraph.fromRel`,
`SimpleGraph.fromRel_adj`, `SimpleGraph.deleteEdges`, `SimpleGraph.Coloring`,
`Polynomial.eq_of_infinite_eval_eq`.

### 3.2 Standard graphs

- **Isomorphism invariance** (`Iso.chromaticPolynomial_eq`). Isomorphic graphs have the same
  chromatic polynomial.
- **Complete graphs** (`chromaticPolynomial_top`). `C_{Kₙ}` is the falling factorial
  `t(t − 1)⋯(t − n + 1)`, Mathlib's `descPochhammer ℤ n` [B, p. 64].
- **Disjoint unions** (`chromaticPolynomial_sum`). `C_{G ⊕g H} = C_G C_H` [B, p. 64].
- **Trees** (`IsTree.chromaticPolynomial_eq`). A tree on `n` vertices has `C = t(t − 1)^{n−1}`
  [B, Corollary 9.4, p. 65].
- **Cycles** (`chromaticPolynomial_cycleGraph`). For `n ≥ 3`,
  `C_{Cₙ} = (t − 1)^n + (−1)^n (t − 1)` [B, pp. 65–66].

The edgeless graph has `C = t^n`, since only the empty edge set occurs in Whitney's form; this is
a target in prose.

**Suggested proof:** isomorphism invariance from Whitney's form, since relabelling an edge set
along a bijection of the vertices preserves `numComponents`. The others from the colouring count
of TuttePolynomialAndArrangements 4.2: for `⊤` the colourings are the injections
(`Fintype.card_embedding_eq`, `descPochhammer_eval_eq_descFactorial`); for disjoint unions use
`SimpleGraph.Coloring.sumEquiv`; for trees remove a leaf, whose colour is any of the `t − 1`
colours other than its neighbour's [B, p. 65]. For cycles, deleting an edge of `Cₙ` gives the
path `Pₙ` and contracting it gives a graph isomorphic to `C_{n−1}` (3.1), and `C₃ = K₃` starts
the induction [B, p. 65].

**Checks.**
- `C₄`: `(t − 1)⁴ + (t − 1) = t⁴ − 4t³ + 6t² − 3t`; `C₃ = K₃`:
  `(t − 1)³ − (t − 1) = t(t − 1)(t − 2)`.
- `K₂ ⊕g K₁`: `t²(t − 1)`. The empty vertex type: `C = 1`, one colouring with any number of
  colours.
- Negative control for `n ≥ 3`: `cycleGraph 1` has one vertex and `C = t`, while the formula
  gives `(t − 1) − (t − 1) = 0`.

*Needs:* 3.1; TuttePolynomialAndArrangements 4.1–4.2; Mathlib `descPochhammer`,
`Fintype.card_embedding_eq`, `descPochhammer_eval_eq_descFactorial`,
`SimpleGraph.Coloring.sumEquiv`, `SimpleGraph.sum`, `SimpleGraph.cycleGraph`,
`SimpleGraph.IsTree`.

### 3.3 Coefficients

- **Leading coefficients** (`chromaticPolynomial_coeff`). `C_G` is monic of degree `n`
  [B, p. 64], and for `n ≥ 1` the coefficient of `t^{n−1}` is `−m` [B, Proposition 10.6 and the
  remark after it, p. 76].
- **Strict alternation** (`coeff_chromaticPolynomial_alternating`). Let `c` be the number of
  connected components of `G`. The coefficient of `t^i` is `0` for `i < c` [B, p. 64], and
  `(−1)^{n−i} [t^i] C_G > 0` for `c ≤ i ≤ n` [B, Corollary 10.8, pp. 77–78].

**Suggested proof:** in Whitney's form, `t^{c(F)}` has degree `n` only for `F = ∅` and degree
`n − 1` exactly for the single edges. Vanishing below `t^c` follows from 3.2 (disjoint unions)
and `C_G(0) = 0` for a graph with a vertex. For the signs, Whitney's broken-circuit expansion
of the coefficients (TuttePolynomialAndArrangements 4.2, consequences) makes
`(−1)^{n−i} [t^i] C_G` the number of edge sets of size `n − i` without a broken circuit; order
the edges so that those of a spanning forest come where no broken circuit can lie inside it, and
its subsets give such sets of every size up to `n − c` [B, pp. 77–78]. Alternatively, induct on
`m` with deletion–contraction: `(−1)^n C_G(−t)` is the sum of `(−1)^n C_{G−uv}(−t)` and
`(−1)^{n−1} C_{G/uv}(−t)`.

**Checks.**
- `P₃`: `t³ − 2t² + t`, signs `+, −, +`, and `−2 = −m`; `K₃`: `t³ − 3t² + 2t`, `−3 = −m`.
- `K₂ ⊕g K₁`: `t³ − t²` with `c = 2`; the coefficient of `t` is `0` and that of `t²` is `−1`.
- The Petersen graph: the coefficient of `t⁹` is `−15`, all coefficients of `t¹, …, t¹⁰`
  alternate strictly in sign, and the value at `t = 3` is `120`.
- Negative control for `n ≥ 1`: for the empty vertex type the coefficient of `t^{n−1} = t⁰` is
  `1`, not `−m = 0`. For `K₂ ⊕g K₁`, strict positivity fails at `i = 1 < c`, so the range starts
  at `c`.

*Needs:* 3.1, 3.2; TuttePolynomialAndArrangements 4.2; Mathlib `SimpleGraph.ConnectedComponent`.

## Layer 4: homomorphisms and cores

### 4.1 Cores

Definitions: `IsCore H`, every endomorphism of `H` is bijective [GR, §6.2, p. 104];
`IsCoreRetract G s`, the induced subgraph on `s` is a core and `G` retracts onto it.

Basic API, stated in prose: an injective endomorphism of a finite graph is bijective
(`Finite.injective_iff_bijective`) and is an automorphism, since a bijective endomorphism of a
finite graph reflects adjacency; `Kₙ` and the odd cycles are cores; a bipartite graph with an
edge has a core retract of two vertices, and a graph with a vertex and no edge one of one
vertex; `χ` and `ω` of `G` equal those of a core retract.

- **Existence** (`exists_isCoreRetract`). Every finite graph has a core retract [GR,
  Lemma 6.2.2, p. 105].
- **Equivalent cores are isomorphic** (`IsCore.nonempty_iso`). Homomorphically equivalent cores
  are isomorphic [GR, Lemma 6.2.1, p. 105].
- **Homomorphic equivalence** (`nonempty_hom_and_hom_iff`). Two graphs are homomorphically
  equivalent exactly when their core retracts are isomorphic; any two core retracts of one graph
  are isomorphic [GR, Lemmas 6.2.2–6.2.3, p. 105].

**Suggested proof:** for existence, take a set of least size onto which `G` retracts; an
endomorphism of the induced subgraph that is not bijective has a power that is a retraction onto
a smaller image. For isomorphism, `g ∘ f` and `f ∘ g` are bijective, so `f` is bijective, and it
reflects adjacency. For the equivalence, compose the retractions and inclusions [GR, p. 105].

**Checks.**
- `IsCore`: `K₄` and `C₅` are cores; negative control: `C₆` is not, since `x ↦ x mod 2` folds it
  onto the edge `{0, 1}`.
- `IsCoreRetract`: `{0, 1}` is a core retract of `C₆`; negative controls: the whole vertex set
  is not, and neither is `{0, 1, 2}`, whose induced path is not a core.

*Needs:* Mathlib `SimpleGraph.Hom`, `SimpleGraph.induce`, `SimpleGraph.Embedding.induce`,
`Finite.injective_iff_bijective`.

### 4.2 Vertex-transitive graphs

- **Cores of vertex-transitive graphs** (`IsVertexTransitive.isCoreRetract`). A core retract of
  a vertex-transitive graph is vertex-transitive, and its order divides the order of the graph
  [GR, Theorems 6.13.1–6.13.2, p. 123].
- **No-homomorphism lemma** (`card_div_indepNum_le_of_hom`). If `G → H` and `H` is
  vertex-transitive, then `|V(G)|/α(G) ≤ |V(H)|/α(H)` [GR, Lemma 7.14.2, p. 154, case `r = 1`].

**Suggested proof:** for the core, compose automorphisms with a retraction `r`: for an
automorphism `a`, `r ∘ a` restricted to the core is an automorphism of the core, so each
translate `a(core)` meets each fibre of `r` in exactly one vertex, and the counting lemma of 1.2
makes all fibres equal in size [GR, p. 123]. For the lemma, for a maximum coclique `T` of `H` and
an automorphism `a`, the preimage of `a T` is a coclique of `G`; summing its size over the
automorphism group with the counting lemma gives `|V(G)| |T| |Aut H|/|V(H)| ≤ α(G) |Aut H|`.

**Checks.**
- `C₆ → K₂ → C₆`, so the core of `C₆` is `K₂`, of order `2` dividing `6`.
- `5/α(C₅) = 5/2 > 2 = 2/α(K₂)`, so there is no homomorphism `C₅ → K₂`; the Petersen graph has
  `10/4 = 5/2 ≤ 3 = 3/α(K₃)`, consistent with a `3`-colouring.
- Negative control for vertex-transitivity of the target: `K₂ → K_{1,2}` (an edge onto an edge)
  and `2/α(K₂) = 2 > 3/2 = 3/α(K_{1,2})`.

*Needs:* 1.2, 4.1; GraphSymmetryAndCayleyGraphs 1.1.

### 4.3 Endomorphism monoids

- **Every finite monoid is an endomorphism monoid** (`exists_mulEquiv_hom`). For every finite
  monoid `M` there is a finite simple graph `H` with `M ≃* (H →g H)` [KK, Theorem 7.4.4, p. 148].

**Suggested proof:** start from the Cayley digraph of `M` acting on itself by right
multiplication, whose endomorphisms are the left multiplications, and replace each arc labelled
by a generator by a rigid gadget, a graph without nontrivial endomorphisms and with a
distinguished pair of vertices, mutually rigid for distinct labels [KK, pp. 147–148]. The
statement is unchanged if the composition order of the monoid `H →g H` is reversed, since `Mᵐᵒᵖ`
is again a finite monoid.

**Checks.**
- The trivial monoid is the endomorphism monoid of `K₁`, and `ℤ/2` is that of `K₂`, whose two
  endomorphisms are the identity and the swap.

*Needs:* Mathlib `SimpleGraph.Hom`.

## Layer 5: fractional colourings

### 5.1 Definitions

Definitions: `IsFractionalColouring G w` for `w : Finset V → ℝ`, nonnegative, supported on
cocliques, giving every vertex weight at least `1` [GR, §7.1, p. 135];
`fractionalChromaticNumber G`, the infimum of `Σ_s w s` over fractional colourings.

Basic API, stated in prose: a weighted family of cocliques indexed by any finite type that covers
every vertex gives a fractional colouring of the same total weight; the set of feasible totals is
nonempty (weight `1` on every singleton) and bounded below by `0`; preimages of cocliques under a
homomorphism are cocliques, so `G → H` gives `χ_f(G) ≤ χ_f(H)` [GR, Corollary 7.4.2, p. 139];
`χ_f` is invariant under isomorphism.

**Checks.**
- `IsFractionalColouring`: the colour classes of a proper colouring with weight `1` each, and
  the singletons with weight `1` each, are fractional colourings.
- Negative control: on `K₂`, weight `1` on the set `{0, 1}` covers both vertices but is not a
  fractional colouring, since `{0, 1}` is not a coclique.
- For `V` empty the zero weighting is feasible and `χ_f = 0`.

### 5.2 Attainment and duality

- **Attainment and rationality** (`exists_isFractionalColouring_sum_eq`). The infimum is attained
  at a rational weighting [GR, Theorem 7.3.2, p. 138].
- **Linear-programming duality** (`fractionalChromaticNumber_eq_sSup`). `χ_f` is the supremum of
  the total weight of a nonnegative vertex weighting with weight at most `1` on every coclique,
  the fractional clique number [GR, §7.5, p. 141]; the weak inequality is [GR, Lemma 7.5.1,
  p. 141].

**Suggested proof:** write the covering program in the standard form of ConvexAnalysisAndDuality
5.3, with a variable for each coclique and a slack variable for each vertex:
`Σ_{s ∋ x} w s − z x = 1`, `w, z ≥ 0`, objective `Σ_s w s`. It is feasible and bounded below by
`0`, so 5.3 there gives an optimal solution and a dual solution of equal value, and the dual
program is the fractional clique program. For rationality, an optimal solution of least support
has linearly independent support columns (a kernel vector moves it along the optimal face until
a coordinate vanishes), so it solves a nonsingular square system with integer data and is
rational by Cramer's rule (`Matrix.cramer`, `Matrix.mulVec_cramer`).

**Checks.**
- `C₅`: weight `1/2` on each of its five maximum cocliques gives `5/2`, and weight `1/2` on
  every vertex is a fractional clique of weight `5/2`, so `χ_f(C₅) = 5/2`.
- The Petersen graph: `χ_f = 5/2`, attained by weight `1/2` on the five stars, while `χ = 3`.

*Needs:* 5.1; ConvexAnalysisAndDuality 5.3; Mathlib `Matrix.cramer`, `Matrix.mulVec_cramer`.

### 5.3 Bounds and vertex-transitive graphs

- **`n/α ≤ χ_f ≤ χ`** (`card_div_indepNum_le_fractionalChromaticNumber`) [GR, Corollary 7.5.3,
  p. 142, and §7.1, p. 136].
- **Vertex-transitive graphs** (`IsVertexTransitive.fractionalChromaticNumber_eq`).
  `χ_f = n/α` [GR, Corollary 7.5.2, p. 142].

**Suggested proof:** summing the covering constraints gives `n ≤ α Σ_s w s`, and a colouring
with `χ` colours is a fractional colouring of weight `χ`. For vertex-transitive graphs, weight
every translate `gT` of a maximum coclique `T` under the automorphism group by `n/(α |Aut G|)`;
by the counting lemma of 1.2 every vertex lies in `α |Aut G|/n` of the translates, so this is a
fractional colouring of weight `n/α`. Godsil and Royle reach the same bound through the
retraction of a vertex-transitive graph onto a Cayley graph, GraphSymmetryAndCayleyGraphs 4.1
[GR, Lemma 7.4.4, p. 140].

**Checks.**
- `χ_f(Kₙ) = n` for `n = 1, 3, 4`; `χ_f(C₅) = 5/2 = 5/α(C₅)`.
- Negative control for vertex-transitivity: the star `K_{1,3}` has `n/α = 4/3` and `χ_f = 2`,
  since it has an edge and is bipartite.

*Needs:* 1.2, 5.1; GraphSymmetryAndCayleyGraphs 1.1.

### 5.4 Kneser graphs as targets

- **Homomorphisms to Kneser graphs** (`isLeast_fractionalChromaticNumber_kneser`). `χ_f(G)` is
  the least `v/r` over `r ≥ 1` and `v` with a homomorphism `G → K(v, r)` [GR, Theorem 7.4.5,
  p. 140].

**Suggested proof:** weight `1/r` on each of the `v` stars of `K(v, r)` (the `r`-sets containing a
point) covers every vertex exactly once, so `χ_f(K(v, r)) ≤ v/r` [GR, p. 136], and a homomorphism
`G → K(v, r)` gives `χ_f(G) ≤ v/r` by monotonicity (5.1). Conversely take a rational optimal `w`
(5.2), `r ≥ 1` with `r w` integral, and list each coclique `s` with multiplicity `r w(s)`; there
are `v = r χ_f(G)` copies, every vertex lies in at least `r` of them, and sending a vertex to `r`
of the copies containing it is a homomorphism `G → K(v, r)`, because no coclique contains two
adjacent vertices [GR, p. 140].

**Checks.**
- `C₅ → K(5, 2)` onto the outer `5`-cycle of the Petersen graph gives `χ_f(C₅) ≤ 5/2`, which is
  attained.
- For `V` empty, `v = 0`, `r = 1` gives the value `0 = χ_f`.

*Needs:* 5.1, 5.2; TopologicalCombinatorics 3.1.

## Layer 6: theta values, Haemers' bound and vector colourings

### 6.1 Theta values of symmetric graphs

- **Edge-transitive regular graphs** (`IsRegularOfDegree.lovaszTheta_eq_of_isEdgeTransitive`). A
  `k`-regular edge-transitive graph with `k > 0` has `ϑ = −nθₙ/(k − θₙ)`. The inequality `≤` is
  [BH, Proposition 3.7.5, p. 45], and equality for an edge-transitive automorphism group is
  Lovász's, stated in [BH, p. 45].
- **Strongly regular graphs** (`IsSRGWith.lovaszTheta_eq`). A strongly regular graph of degree
  `k > 0` has `ϑ = −nθₙ/(k − θₙ)`; equality for strongly regular graphs is Haemers', stated in
  [BH, p. 45].

A vertex-transitive graph isomorphic to its complement has `ϑ = √n`: LovaszThetaFunction 4.2
gives `ϑ(G)ϑ(Ḡ) = n`, isomorphism invariance (LovaszThetaFunction 1.1) gives `ϑ(G) = ϑ(Ḡ)`, and
`ϑ ≥ 0`. This corollary is a target in prose.

**Suggested proof:** in both cases `≤` is LovaszThetaFunction 4.3. For `≥` in the edge-transitive
case, take a matrix attaining the eigenvalue form of `ϑ` (LovaszThetaFunction 1.3) and average
it over the automorphism group: conjugation by an automorphism preserves admissibility and the
spectrum, and the largest eigenvalue is convex (Weyl's inequality,
`Matrix.IsHermitian.eigenvalues₀_add_le`), so the average is again optimal. Edge-transitivity
makes it `J + xA`, and the least largest eigenvalue over this one-parameter family is
`−nθₙ/(k − θₙ)`, attained at `x = −n/(k − θₙ)`. For `≥` in the strongly regular case, let `r` be
the largest eigenvalue on `𝟙^⊥`, with `r = k` when `μ = 0` (a disjoint union of cliques,
StronglyRegularAndMooreGraphs 1.1), `r` the restricted eigenvalue of StronglyRegularAndMooreGraphs
1.2 when `μ > 0` and `G ≠ ⊤`, and `ϑ(Kₙ) = 1` read off directly; then `r ≥ 0`. The matrix
`N = (I + Ā/(1 + r))/n` with `Ā = J − I − A` has eigenvalues `(r − θ)/(n(1 + r)) ≥ 0` on
`𝟙^⊥` and a nonnegative one on `𝟙`, trace `1`, and zero entries at the edges, so it is admissible
in the definition of `ϑ`; its entry sum `1 + (n − 1 − k)/(1 + r)` equals `−nθₙ/(k − θₙ)` by the
parameter identities `rθₙ = μ − k` and `r + θₙ = ℓ − μ`.

**Checks.**
- The Petersen graph (edge-transitive and strongly regular, `k = 3`, `θₙ = −2`):
  `ϑ = 10 · 2/5 = 4`. Its matrix `N = (I + Ā/2)/10` has eigenvalues `0` five times, `3/20` four
  times and `2/5`, and entry sum `1 + (10 − 1 − 3)/2 = 4`. Its complement, the triangular graph
  `T(5)` (`k = 6`, `θₙ = −2`), has `ϑ = 10 · 2/8 = 5/2`, and `4 · 5/2 = 10` as in
  LovaszThetaFunction 4.2.
- The Paley graph of order `13`, the Cayley graph of `ZMod 13` with the nonzero squares, is
  strongly regular with `k = 6`, `θₙ = (−1 − √13)/2`, and the formula gives `√13 ≈ 3.6056`; it
  is vertex-transitive and self-complementary, and the prose corollary gives `√13` as well.
- The collinearity graph of `GQ(2, 4)` (27 vertices, spectrum `10, 1²⁰, (−5)⁶`) has
  `ϑ = 27 · 5/15 = 9` [BH, p. 46].
- Negative control for regularity: the edge-transitive star `K_{1,3}` has `ϑ = α = 3`, while the
  formula with `k = 3 = Δ` and `θₙ = −√3` gives `4√3/(3 + √3) ≈ 1.46`.

*Needs:* LovaszThetaFunction 1.1, 1.3, 4.2, 4.3; StronglyRegularAndMooreGraphs 1.1, 1.2;
GraphSymmetryAndCayleyGraphs 1.1; SpectralGraphBounds 1.1; Tau Ceti
`Matrix.IsHermitian.eigenvalues₀_add_le`.

### 6.2 Haemers' rank bound

Basic API, stated in prose: for a matrix `B` over a field with nonzero diagonal that vanishes at
distinct nonadjacent pairs, `α ≤ rank B`, since a coclique indexes a nonsingular diagonal
principal submatrix (`Matrix.rank_submatrix_le`); the rank of a Kronecker product over a field
is at most the product of the ranks (`Matrix.toLin_kronecker`), and the `k`-fold Kronecker power
of `B`, indexed by `Fin k → V`, is admissible for `strongPow G k`.

- **Haemers' rank bound** (`shannonCapacity_le_rank`). Over any field, if `B` has nonzero
  diagonal and vanishes at distinct nonadjacent pairs, then `Θ(G) ≤ rank B` [BH, p. 43, and
  Theorem 3.7.8, p. 45].

**Suggested proof:** by the basic API, `α(G^⊠k) ≤ rank(B^{⊗k}) ≤ (rank B)^k`, so every term
`α(G^⊠k)^{1/k}` of the supremum is at most `rank B`.

**Checks.**
- The collinearity graph of `GQ(2, 4)`: `B = A − I` has eigenvalues `9`, `0` (twenty times) and
  `−6` (six times), so rank `7` and `Θ ≤ 7`, while `α = 6` and `ϑ = 9` [BH, pp. 43, 46].
- `C₅`: the least admissible rank is `3 > √5 = Θ(C₅)` [BH, p. 46].

*Needs:* LovaszThetaFunction 3.1, 5.1; Mathlib `Matrix.rank`, `Matrix.rank_submatrix_le`,
`Matrix.kroneckerMap`, `Matrix.toLin_kronecker`.

### 6.3 Vector colourings

Definitions: `IsVectorColouring G u t` and `IsStrictVectorColouring G u t`, unit vectors
`u x` in some `EuclideanSpace ℝ (Fin d)` with `(t − 1)⟪u x, u y⟫ ≤ −1`, respectively `= −1`, at
adjacent pairs, for `t ≥ 1`; `vectorChromaticNumber G` and `strictVectorChromaticNumber G`, the
infima of the admissible `t`.

Basic API, stated in prose: a strict vector colouring is a vector colouring; a colouring with
`m ≥ 2` colours gives a strict vector colouring with parameter `m` by the vertices of a regular
simplex, and a graph without edges has one with parameter `1`.

- **Vector colourings and `ϑ`** (`strictVectorChromaticNumber_eq`). On a nonempty vertex type
  the strict vector chromatic number is `ϑ(Ḡ)`, and `χ_v ≤ χ_sv ≤ χ`. This is a reformulation
  of the eigenvalue form of `ϑ(Ḡ)` (LovaszThetaFunction 1.3), proved below.

**Suggested proof:** let `M` attain the eigenvalue form of `ϑ(Ḡ)`, so `M` is `1` on the diagonal
and at the edges of `G`, with largest eigenvalue `t`. If `t > 1`, `(tI − M)/(t − 1)` is positive
semidefinite with unit diagonal and entry `−1/(t − 1)` at the edges of `G`, so it is the Gram
matrix (Tau Ceti `Matrix.posSemidef_iff_eq_conjTranspose_mul_self`) of a strict vector colouring
with parameter `t`; if `t = 1`, then `I − M` is positive semidefinite with zero diagonal, hence
`0`, and `G` has no edges. Conversely a strict vector colouring `u` with parameter `t` gives the
admissible matrix `M = tI − (t − 1) gram(u)` (`Matrix.gram`, `Matrix.posSemidef_gram`), with
largest eigenvalue at most `t`. The inequalities follow from the basic API.

**Checks.**
- `IsStrictVectorColouring`: on `Kₙ`, `n ≥ 2`, the `n` unit vectors of a regular simplex have
  inner products `−1/(n − 1)` and form a strict vector colouring with parameter `n`, and
  `ϑ(K̄ₙ) = n`; on `K₂`, `u 0 = e` and `u 1 = −e` give parameter `2`.
- Negative control: on `K₂` no vector colouring has parameter `1`, since `0 · ⟪u 0, u 1⟫ = 0` is
  not at most `−1`; equal vectors at the ends of an edge give `(t − 1) ≤ −1`, which fails for
  every `t ≥ 1`.
- A graph without edges has `χ_sv = 1 = ϑ(Kₙ)`; `C₅` has `χ_sv = ϑ(C̄₅) = √5 < 3 = χ(C₅)`.
- Negative control for `Nonempty V`: on the empty type `χ_sv = 1`, while `ϑ = 0` and `χ = 0`.

*Needs:* LovaszThetaFunction 1.3; Tau Ceti `Matrix.posSemidef_iff_eq_conjTranspose_mul_self`;
Mathlib `EuclideanSpace`, `Matrix.gram`, `Matrix.posSemidef_gram`.

## Layer 7: Kneser graphs

### 7.1 Spectrum and cocliques

Basic API, stated in prose:
- `K(v, k)` is `C(v − k, k)`-regular for `k ≥ 1` and has no edges for `v < 2k`
  (TopologicalCombinatorics 3.1); it is vertex-transitive (GraphSymmetryAndCayleyGraphs 1.3),
  and for `1 ≤ k` and `2k ≤ v` it is edge-transitive, by the arc-transitivity of Kneser graphs in
  GraphSymmetryAndCayleyGraphs 1.3 and 1.1 there, since it has no isolated vertex;
- the star of a point, the `k`-sets containing it, is a coclique of size `C(v − 1, k − 1)`;
- **Erdős–Ko–Rado** in Kneser form: for `1 ≤ k` and `2k ≤ v`, `α(K(v, k)) = C(v − 1, k − 1)`,
  by transporting Mathlib's `Finset.erdos_ko_rado` along `α ≃ Fin v` (a coclique of `K(v, k)` is
  an intersecting family of `k`-sets), with a star for the lower bound [GR, Theorem 7.8.1,
  p. 146, and the remark on `v = 2r`, p. 147];
- for `2k < v`, a coclique of size `C(v − 1, k − 1)` is a star: AssociationSchemes 5.2,
  transported along `α ≃ Fin v`.

- **Least eigenvalue** (`isLeast_adjSpectrum_kneserGraph`). For `1 ≤ k` and `2k ≤ v`, the least
  eigenvalue of `K(v, k)` is `−C(v − k − 1, k − 1)` [GR, Theorem 9.4.3, p. 200].

**Suggested proof:** GraphSpectra 2.6 gives the spectrum: `C(v − k, k)` once and
`(−1)^j C(v − k − j, k − j)` with multiplicity `C(v, j) − C(v, j − 1) > 0` for `1 ≤ j ≤ k`. Since
`C(a − 1, b − 1) ≤ C(a, b)` for `1 ≤ b ≤ a`, the absolute values do not increase in `j`, so the
least is the value at `j = 1`.

**Checks.**
- Least eigenvalues: `−1` for `K(2, 1)`, `K(3, 1)`, `K(4, 1)`, `K(4, 2)`, `K(6, 3)` and
  `K(8, 4)`; `−2` for `K(5, 2)`, `−3` for `K(6, 2)` and `K(7, 3)`, `−4` for `K(7, 2)` and
  `K(9, 4)`, `−6` for `K(8, 3)`.
- Negative control for `2k ≤ v`: `K(1, 1)` is a single vertex with eigenvalue `0`, while the
  formula gives `−C(0, 0) = −1`; for `v < k` the vertex type is empty and there is no least
  eigenvalue.
- Negative control for `1 ≤ k`: `K(v, 0)` is a single vertex with eigenvalue `0`, while the
  formula gives `−C(v − 1, 0) = −1`.
- `α(K(v, k)) = C(v − 1, k − 1)` for the twelve pairs above.

*Needs:* GraphSpectra 1.2, 2.6; GraphSymmetryAndCayleyGraphs 1.1, 1.3; TopologicalCombinatorics
3.1; AssociationSchemes 5.2; Mathlib `Finset.erdos_ko_rado`.

### 7.2 Kneser graphs are cores

- **Kneser graphs are cores** (`isCore_kneserGraph`) for `1 ≤ k` and `2k < v` [GR,
  Theorem 7.9.1, p. 148].

**Suggested proof:** for an endomorphism `f`, the preimages of the `v` stars `S_b` are cocliques
covering every vertex `k` times, so their sizes sum to `k C(v, k) = v C(v − 1, k − 1)`, and each
is a maximum coclique, hence a star `S_{π(b)}` by the uniqueness in 7.1. Then `f(x) = π⁻¹(x)` for
every `k`-set `x`; since `|π⁻¹(x)| = k` for all `k`-sets and `k < v`, all fibres of `π` have the
same size, which is `1`, so `π` is a permutation and `f` is bijective.

**Checks.**
- `K(5, 2)`, the Petersen graph, is a core.
- Negative control for `2k < v`: `K(6, 3)` is a perfect matching on `20` vertices, whose core is
  `K₂`.

*Needs:* 4.1, 7.1.

### 7.3 Fractional chromatic number and theta

- **Fractional chromatic number** (`fractionalChromaticNumber_kneserGraph`). For `1 ≤ k` and
  `2k ≤ v`, `χ_f(K(v, k)) = v/k` [GR, Corollary 7.7.3, p. 146].
- **Theta function** (`lovaszTheta_kneserGraph`). For `1 ≤ k` and `2k ≤ v`,
  `ϑ(K(v, k)) = C(v − 1, k − 1)`.

**Suggested proof:** for `χ_f`, vertex-transitivity, 5.3 and Erdős–Ko–Rado (7.1):
`C(v, k)/C(v − 1, k − 1) = v/k`. For `ϑ`, `≥` from `α ≤ ϑ` (LovaszThetaFunction 2.1) and
Erdős–Ko–Rado; `≤` from LovaszThetaFunction 4.3 with `d = C(v − k, k)` and the least eigenvalue
of 7.1, by the identity
`C(v, k) C(v − k − 1, k − 1) = C(v − 1, k − 1) (C(v − k, k) + C(v − k − 1, k − 1))`.
Edge-transitivity (7.1) and 6.1 give a second route.

**Checks.**
- `K(5, 2)`: `α = ϑ = 4 = C(4, 1)` and `χ_f = 10/4 = 5/2`.
- `K(7, 3)`: `ϑ = 35 · 3/(4 + 3) = 15 = C(6, 2)`; `K(9, 4)`: `ϑ = 126 · 4/(5 + 4) = 56 = C(8, 3)`.
  The identity holds for the twelve pairs of 7.1.
- `K(6, 3)`: `ϑ = α = 10 = C(5, 2)` and `χ_f = 2`. `K(v, 1) ≅ K_v`: `ϑ = 1` and `χ_f = v`.
- Negative control for `2k ≤ v`: `K(5, 3)` has no edges, so `χ_f = 1 ≠ 5/3` and
  `ϑ = 10 ≠ C(4, 2) = 6`.
- Negative control for `1 ≤ k` in `χ_f`: `K(v, 0)` is a single vertex with `χ_f = 1`, while
  `v/0 = 0`.

*Needs:* 5.3, 7.1; LovaszThetaFunction 2.1, 4.3; TopologicalCombinatorics 3.1;
GraphSymmetryAndCayleyGraphs 1.3.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

- **The homomorphism order.** Welzl's density theorem for cores of chromatic number at least `3`
  [GR, Theorem 7.13.1, p. 153], homomorphisms between Kneser graphs [GR, §7.9, pp. 148–149],
  and colourings of products [GR, §6.6, p. 111] need the product and map graphs of [GR, §6.3,
  p. 106, and §6.4, p. 108] as objects of their own.
- **Chromatic roots and inequalities.** Root-free intervals of chromatic polynomials and the
  coefficient inequalities of [B, 10a, p. 78] need analytic estimates beyond the sign pattern of
  3.3.

## Downstream consumers

- A roadmap on perfect graphs can take the fractional chromatic number (Layer 5) and the vector
  chromatic number (6.3) as the relaxations sandwiched between `ω` and `χ`.
- A roadmap on graph homomorphisms, the homomorphism order and graph products builds on the cores
  and the no-homomorphism lemma of Layer 4.
- Roadmaps on distance-regular graphs and codes, where the weighted ratio bound of 1.1 and the
  theta values of 6.1 bound cocliques and codes, and on the Delsarte linear programming bound,
  which refines `ϑ` (6.1).

## Scope and ownership

The roadmap is complete when Tau Ceti proves every target above. `Suggested.lean` states the
headlines that carry a Lean name, each with every conclusion the README attaches to it; it is not
an exhaustive acceptance test, and the other headlines are targets of the same standing, stated
in prose.

Owned here:
- weighted adjacency matrices and the weighted coclique bounds; the counting lemma and the
  clique–coclique bound for vertex-transitive graphs;
- the equality case of Wilf's bound; biclique partitions of an arbitrary graph and their
  eigenvalue bound;
- the contraction of a pair of vertices of a simple graph, deletion–contraction for the chromatic
  polynomial, its isomorphism invariance, its values on edgeless, complete, tree, cycle and
  disjoint-union graphs, its leading coefficients and the strict alternation of its coefficients;
- cores, core retracts, homomorphic equivalence, cores of vertex-transitive graphs, the
  no-homomorphism lemma and endomorphism monoids;
- fractional colourings and the fractional chromatic number, its attainment, duality, bounds and
  Kneser characterization; vector and strict vector colourings;
- the theta values of edge-transitive regular, strongly regular and self-complementary
  vertex-transitive graphs; Haemers' rank bound;
- the least eigenvalue, the core property, the fractional chromatic number and the theta value
  of the Kneser graphs.

Consumed, not restated (see the supplier contracts):
- GraphSpectra 1.2, 2.4, 2.6 and 3.4: the adjacency spectrum, the Kneser and Petersen graphs,
  the Kneser spectrum, and the strict monotonicity of the index.
- GraphSymmetryAndCayleyGraphs 1.1 and 1.3: vertex- and edge-transitivity and the transitivity
  of Kneser graphs; 4.1 is cited for an alternative route.
- SpectralGraphBounds 1.1, 1.2, 2.1 and 3.1: the sorted eigenvalues, interlacing for induced
  subgraphs, the average-degree bound with its equality case, Wilf's bound and Cvetković's
  inertia bound. Hoffman's ratio bound with its equality clause (SpectralGraphBounds 3.2) is the
  unweighted case of 1.1 here and is not restated.
- GraphColouring 1.1, 2.1 and 2.2: the degeneracy bound, odd cycles and the graphs with
  `χ = Δ + 1`.
- TuttePolynomialAndArrangements 4.1 and 4.2: the component count, the chromatic polynomial in
  Whitney's form, its count of colourings and the broken-circuit expansion.
- LovaszThetaFunction 1.1, 1.3, 2.1, 3.1, 4.2, 4.3 and 5.1: the theta function and its
  isomorphism invariance, its eigenvalue form, `α ≤ ϑ`, strong powers, `ϑ(G)ϑ(Ḡ) = n` for
  vertex-transitive graphs, the ratio bound for `ϑ`, and the Shannon capacity. The values
  `ϑ(C₅) = √5` and `ϑ = 4` for the Petersen graph used in Checks are LovaszThetaFunction 4.1 and
  4.3.
- TopologicalCombinatorics 3.1: the Kneser graphs, their regularity and their edgelessness for
  `v < 2k`. Lovász's theorem `χ(K(v, k)) = v − 2k + 2` is TopologicalCombinatorics 3.3 and is not
  used.
- AssociationSchemes 5.2: uniqueness of the extremal Erdős–Ko–Rado families.
- StronglyRegularAndMooreGraphs 1.1 and 1.2: the strongly regular graphs with `μ = 0` and the
  spectrum of a strongly regular graph.
- ConvexAnalysisAndDuality 5.3: linear-programming duality with attainment.
- [LinearAlgebraMethodInCombinatorics](../LinearAlgebraMethodInCombinatorics/README.md) 4.1 and
  4.2: biclique decompositions of `Kₙ` and the Graham–Pollak theorem.
- [RandomMatrices](../RandomMatrices/README.md) 1.2: the max–min formula and Cauchy interlacing.
- The Erdős–Ko–Rado bound for intersecting families: Mathlib.

Not owned here, and not used: the eigenmatrix of the Johnson scheme and the clique–coclique
bound for association schemes (AssociationSchemes 4.2 and 5.1; 7.1 here takes the Kneser
spectrum from GraphSpectra 2.6); perfect graphs (PerfectAndChordalGraphs); Schrijver's `ϑ'` and
the Delsarte linear programming bound (DelsarteTheoryOfCodesAndDesigns); the Paley graphs as a
family (PaleyGraphsAndCharacterSums), of which one appears in a Check, described directly;
equitable partitions and their quotients (EquitableOperatorReduction).

Outside the scope: weighted theta functions, the spectrum of the Kneser graph beyond its least
eigenvalue, the Tutte polynomial of a multigraph, and every procedure for computing any of these
invariants or polynomials.

## Exact supplier contracts

### From Mathlib

- `SimpleGraph.indepNum`, `SimpleGraph.cliqueNum`, `SimpleGraph.IsIndepSet`,
  `SimpleGraph.Colorable`, `SimpleGraph.chromaticNumber` (valued in `ℕ∞`), `SimpleGraph.Hom`
  (`G →g H`, a monoid under composition for `G →g G`), `SimpleGraph.Iso`, `SimpleGraph.induce`,
  `SimpleGraph.Embedding.induce`, `SimpleGraph.IsRegularOfDegree`, `SimpleGraph.IsSRGWith`,
  `SimpleGraph.cycleGraph`. Used throughout.
- `Matrix.PosSemidef`, `Matrix.PosSemidef.kronecker`, `Matrix.rank`, `Matrix.rank_submatrix_le`,
  `Matrix.kroneckerMap`, `Matrix.toLin_kronecker`, `Matrix.IsHermitian.eigenvalues₀` (decreasing,
  on `Fin (Fintype.card n)`), `Matrix.gram`, `Matrix.posSemidef_gram`, `EuclideanSpace`,
  `Matrix.cramer`, `Matrix.mulVec_cramer`. Used in Layers 1, 5 and 6.
- `MulAction.IsPretransitive`, `MulAction.card_orbit_mul_card_stabilizer_eq_card_group`,
  `Equiv.Perm.exists_map_finset_eq`, `Finite.injective_iff_bijective`. Used in Layers 1, 4 and 5.
- `SimpleGraph.fromEdgeSet`, `SimpleGraph.fromRel` with `SimpleGraph.fromRel_adj`,
  `SimpleGraph.deleteEdges`, `SimpleGraph.sum` (written `G ⊕g H`),
  `SimpleGraph.Coloring.sumEquiv`, `SimpleGraph.Coloring`, `SimpleGraph.IsTree`,
  `SimpleGraph.ConnectedComponent`; `Polynomial.eq_of_infinite_eval_eq`; `descPochhammer` and
  `descPochhammer_eval_eq_descFactorial`; `Fintype.card_embedding_eq`. Used in Layer 3.
- `Finset.erdos_ko_rado`: an intersecting family of `r`-subsets of `Fin n` with `r ≤ n/2` has at
  most `C(n − 1, r − 1)` members. Used in Layer 7.

### From Tau Ceti

- `LinearMap.IsSymmetric.eigenvalues_eq_iSup_iInf_re_inner`
  (`TauCeti/Analysis/InnerProductSpace/CourantFischer.lean`): the max–min formula. Used in 1.1.
- `Matrix.IsHermitian.eigenvalues₀_add_le` (`TauCeti/Analysis/Matrix/Eigenvalues/Basic.lean`):
  Weyl's inequality. Used in 6.1.
- `Matrix.posSemidef_iff_eq_conjTranspose_mul_self`
  (`TauCeti/Analysis/Matrix/GramFactorization.lean`): a positive semidefinite matrix is a Gram
  matrix. Used in 6.3.

### From GraphSpectra

The roadmap GraphSpectra, whose definitions used here are copied verbatim in `Suggested.lean`:
- 1.2: `adjSpectrum`, the adjacency spectrum as a multiset. Used in 7.1.
- 1.7 and 2.4: the decidability instances for disjoint unions and Kneser graphs, copied
  verbatim; the Petersen graph `K(5, 2)`. Used in Layers 3 and 7.
- 2.6: the multiset spectrum of `K(v, k)` for `1 ≤ k` and `2k ≤ v`. Used in 7.1.
- 3.4: a copy with fewer vertices in a connected graph has strictly smaller index. Used in 2.1.

### From GraphSymmetryAndCayleyGraphs

- 1.1: `IsVertexTransitive` and `IsEdgeTransitive`, copied verbatim, with their defining lemmas,
  and arc-transitivity without isolated vertices implying edge-transitivity. Used in Layers 1, 4,
  5, 6 and 7.
- 1.3: the vertex-transitivity of `kneserGraph α k` for every `α` and `k`, and the
  arc-transitivity of Kneser graphs. Used in Layer 7.
- 4.1: the retraction of a connected vertex-transitive graph onto a Cayley graph, cited for an
  alternative route in 5.3.

### From SpectralGraphBounds

- 1.1: `adjEigenvalues`, `largestEigenvalue` and `smallestEigenvalue`, copied verbatim; the
  Rayleigh bounds and interlacing for induced subgraphs. Used throughout.
- 1.2: `2|E| ≤ nθ₁`, with equality exactly for regular graphs. 2.1: Wilf's bound. Used in 2.1.
- 3.1: Cvetković's inertia bound, the unweighted case of 1.1.

### From GraphColouring

- 1.1: the degeneracy bound; 2.1: `IsOddCycle`, copied verbatim; 2.2: a connected graph has
  `χ = Δ + 1` exactly when it is complete or an odd cycle. Used in 2.1.

### From TuttePolynomialAndArrangements

- 4.1: `numComponents A`, the number of connected components of `SimpleGraph.fromEdgeSet A` on
  all of `V`, copied verbatim. Used in 3.2.
- 4.2: `chromaticPolynomial G`, copied verbatim; the count of colourings at every `k : ℕ`; and
  the broken-circuit expansion of the coefficients stated there as a consequence. Used
  throughout Layer 3.

### From LovaszThetaFunction

- 1.1: `lovaszTheta`, copied verbatim, with `0 ≤ ϑ` and isomorphism invariance; 1.3: the
  eigenvalue form with attainment; 2.1: `α ≤ ϑ`; 3.1: `strongPow`, copied verbatim; 4.2:
  `ϑ(G)ϑ(Ḡ) = n` when every vertex is carried to every other by an automorphism; 4.3:
  `ϑ(G)(d − θₙ) ≤ n(−θₙ)` for `d`-regular `G`; 5.1: `shannonCapacity`, copied verbatim. Used in
  Layers 6 and 7.

### From TopologicalCombinatorics

- 3.1: `kneserGraphOf` and `kneserGraph`, copied verbatim; `K(v, k)` is `C(v − k, k)`-regular for
  `k ≥ 1` and has no edge for `v ≤ 2k − 1`. Used in Layers 5 and 7.

### From AssociationSchemes

- 5.2: for `2k < n`, an intersecting family of `k`-subsets of `Fin n` with `C(n − 1, k − 1)`
  members is a star. Used in 7.1 and 7.2.

### From StronglyRegularAndMooreGraphs

- 1.1: a strongly regular graph with `μ = 0` is a disjoint union of cliques. 1.2: for a strongly
  regular graph with `μ > 0` that is not complete, the spectrum is `{k, r, s}` with `s < r < k`.
  Used in 6.1.

### From ConvexAnalysisAndDuality

- 5.3: linear-programming duality for `min c ⬝ᵥ x` over `A x = b`, `x ≥ 0`, feasible and bounded
  below, with attainment of both programs and equal values. Used in 5.2.

### From LinearAlgebraMethodInCombinatorics and RandomMatrices

- [LinearAlgebraMethodInCombinatorics](../LinearAlgebraMethodInCombinatorics/README.md) 4.1 and
  4.2: biclique decompositions of `Kₙ` and `n ≤ m + 1`. Cited in 2.2.
- [RandomMatrices](../RandomMatrices/README.md) 1.2: Cauchy interlacing for `eigenvalues₀`. Used
  in 1.1.

## References

The locators refer to these editions; page numbers are printed page numbers.

- [B] N. Biggs, *Algebraic Graph Theory*, 2nd ed., Cambridge Mathematical Library, Cambridge
  University Press, 1993: Chapters 9–10, pp. 63–78.
- [BH] A. E. Brouwer, W. H. Haemers, *Spectra of Graphs*, Universitext, Springer, 2012: §1.5.2,
  p. 12; §§3.5–3.7, pp. 39–46.
- [GR] C. Godsil, G. Royle, *Algebraic Graph Theory*, Graduate Texts in Mathematics 207,
  Springer, 2001: §§6.2–6.6 and 6.13, pp. 104–111 and 123; Chapter 7, pp. 135–154; §9.4, p. 200.
- [KK] U. Knauer, K. Knauer, *Algebraic Graph Theory: Morphisms, Monoids and Matrices*, 2nd ed.,
  De Gruyter, 2019: §7.4, pp. 147–148.

# Roadmap: expander graphs

**Summary.** An expander is a sparse graph in which every set of vertices has many edges leaving
it. This roadmap builds the edge expansion of finite simple graphs and its spectral theory, the
infinite regular tree, coverings, prime cycles, and the classical constructions of expanders: by
Ramanujan graphs, by the Lubotzky–Phillips–Sarnak graphs, by groups with property (T), by the
Margulis graphs and by random graphs. Its headline theorems are these.

- *The Cheeger inequality.* A graph on `n ≥ 2` vertices with maximum degree `d` and algebraic
  connectivity `ν_{n-1}` has isoperimetric constant `h` with `ν_{n-1}/2 ≤ h ≤ √(2dν_{n-1})`; for
  a `k`-regular graph `ν_{n-1} = k - θ₂`. Hence a family of connected `k`-regular graphs is an
  expander family exactly when its spectral gaps are bounded away from `0`.
- *The diameter.* A graph on `n ≥ 2` vertices with maximum degree `D` and `0 < ε ≤ h` has
  diameter at most `2 log n / log(1 + ε/D)`; so expander families have logarithmic diameter.
- *Ramanujan families.* For `q ≥ 2`, connected `(q + 1)`-regular Ramanujan graphs of orders
  tending to infinity form an expander family; with the bipartite Ramanujan graphs of
  Marcus, Spielman and Srivastava there are expander families of every degree `d ≥ 3`.
- *The tree.* The `k`-regular tree is unique up to isomorphism; its closed walks at the root are
  counted by the tree numbers of the Kesten–McKay moments; and for `k ≥ 2` its adjacency operator
  on `ℓ²` has norm `2√(k - 1)` and spectrum `[-2√(k - 1), 2√(k - 1)]`.
- *Coverings.* Eigenvectors pull back along a covering, so the characteristic polynomial of the
  base divides that of the cover; a covering of a connected graph has fibres of one size; and
  switching a signing at a vertex gives an isomorphic `2`-lift.
- *Prime cycles.* The closed non-backtracking cycles of length `m` number `∑_{d ∣ m} P_d`, with
  `P_d/d` the number of prime cycles of length `d`, and the Ihara zeta function is the Euler
  product `∏_P (1 - u^{ℓ(P)})⁻¹` over prime cycles.
- *The Lubotzky–Phillips–Sarnak graphs.* The graphs `X^{p,q}` are `(p + 1)`-regular Cayley
  graphs of `PSL₂(𝔽_q)` or `PGL₂(𝔽_q)` with explicit order, bipartiteness and logarithmic girth;
  for `p ≥ 5` and `q > p⁸` they are connected, and for fixed `p` and large `q` their nontrivial
  eigenvalues are at most `p^{5/6 + ε} + p^{1/6 - ε}`, so they form an expander family.
- *Groups.* The Cayley graphs of the finite quotients of a group with property (T) have
  isoperimetric constants bounded away from `0`, and so do the Margulis graphs on `ℤ/m × ℤ/m`;
  no family of bounded-degree Cayley graphs of finite abelian groups is an expander family.
- *Random graphs.* In `G(n, p)` with `0 < p < 1`, with probability tending to `1`, the largest
  eigenvalue is `pn(1 + o(1))`, the others are at most `(2 + ε)√(p(1 - p)n)` in absolute value,
  and the rescaled eigenvalue distribution is close to the semicircle law of variance
  `p(1 - p)`.

The roadmap builds on GraphSpectra for the Laplacian spectrum of a regular graph and
Perron–Frobenius theory for graphs; on GraphSymmetryAndCayleyGraphs for the regularity and
connectivity of Cayley graphs; on SpectralGraphBounds for the sorted adjacency eigenvalues;
on LaplacianEigenvaluesOfGraphs for the algebraic connectivity; on KernelsAndSpectralMethods for
the weighted Cheeger inequality, which it specializes to simple graphs; on
LaplacianSpectraAndSpanningTrees for the spectral gap of a weight with constant degree; on
IharaZetaFunction for non-backtracking cycles, the zeta function and the Ramanujan property; on
MatchingPolynomial for the signed adjacency matrix; on RamanujanGraphs for `2`-lifts, the tree
numbers and the existence of bipartite Ramanujan graphs of every degree; on
[FactorRigidity](../FactorRigidity/README.md) for relative property (T); and on
[RandomMatrices](../RandomMatrices/README.md) and [RandomGraphs](../RandomGraphs/README.md) for
the Wigner limit laws and the binomial random graph.

## How to read the build

- **Expansion (Layers 1–3).** Layer 1 defines the edge boundary, the isoperimetric constant and
  expander families, and translates them into the weighted language of KernelsAndSpectralMethods.
  Layer 2 proves the Cheeger inequality for simple graphs from the weighted one and bounds the
  diameter by the isoperimetric constant. Layer 3 shows that Ramanujan families are expander
  families and obtains expander families of every degree `d ≥ 3`.
- **Trees, coverings and cycles (Layers 4–6).** Layer 4 builds the `k`-regular tree, counts its
  closed walks and computes its adjacency spectrum. Layer 5 treats coverings and switching of
  `2`-lifts. Layer 6 counts prime cycles and proves the Euler product of the Ihara zeta function.
  These layers use Layer 1 only for notation.
- **Constructions (Layers 7–9).** Layer 7 builds the Lubotzky–Phillips–Sarnak graphs, Layer 8
  treats property (T), the Margulis graphs and the abelian obstruction, and Layer 9 the spectrum
  of `G(n, p)`. They use Layers 1–2.

Each section rests only on the sections and roadmaps named in its *Needs:* line.

## Conventions

- **Graphs.** `G : SimpleGraph V` with `[Fintype V] [DecidableEq V] [DecidableRel G.Adj]`, and
  `n = Fintype.card V`. Statements hold for every finite `V`, including the empty type, unless a
  hypothesis such as `2 ≤ n` is written. `d` or `D` is the maximum degree `G.maxDegree`.
- **Edge counts.** `G.interedges S T` (Mathlib) is the set of ordered adjacent pairs in `S × T`.
  The edge boundary `edgeBoundary G S` is `G.interedges S Sᶜ`, in bijection with the edges
  leaving `S`, and `|∂S|` is its size.
- **Eigenvalues.** `adjEigenvalues G i = θ_{i+1}`, `i : Fin n`, is Mathlib's
  `Matrix.IsHermitian.eigenvalues₀` of `G.adjMatrix ℝ`, in nonincreasing order
  (SpectralGraphBounds 1.1), so `θ₁` is at index `0` and `θ₂` at index `1`. The Laplacian
  eigenvalues `ν₁ ≥ ⋯ ≥ νₙ = 0` are numbered downwards as well, and `algebraicConnectivity G` is
  `ν_{n-1}`, at index `n - 2`, for `n ≥ 2` and `0` for `n ≤ 1` (LaplacianEigenvaluesOfGraphs
  1.1). A source's `λ₂` of the Laplacian, numbered upwards, is this `ν_{n-1}`, and the first
  nontrivial adjacency eigenvalue `μ₁` of [DSV, Theorem 1.2.3, p. 13] is `θ₂`.
- **Junk values.** `isoperimetricConstant G` is a real infimum over nonempty `S` with
  `2|S| ≤ n`; the index set is empty for `n ≤ 1`, where the value is `0`, and statements that
  need a meaningful value carry `2 ≤ n`. `secondAdjEigenvalue G` is `θ₂` for `n ≥ 2` and `0`
  otherwise; `nontrivialSpectralRadius G = max_{i ≥ 2} |θᵢ|` is `0` for `n ≤ 1`. Mathlib's
  `SimpleGraph.diam` is `ℕ`-valued with the junk value `0` for disconnected graphs, so lower
  bounds on it carry connectedness. In the diameter bound of 2.3, `D = 0` makes the logarithm
  `log 1 = 0` and the bound the junk value `0`; the hypotheses `2 ≤ n` and `0 < ε ≤ h` exclude it.
- **Girth.** The girth is Mathlib's `SimpleGraph.egirth`, valued in `ℕ∞`, which is `⊤` exactly
  for acyclic graphs (`SimpleGraph.egirth_eq_top`). A lower bound `x ≤ girth` with `x` real is
  stated as `⌈x⌉₊ ≤ egirth`, which is equivalent because `egirth` is a natural number or `⊤`.
- **Ramanujan.** `IsRamanujan q G` is the predicate of IharaZetaFunction 5.3: every adjacency
  eigenvalue `λ` with `|λ| ≠ q + 1` has `|λ| ≤ 2√q`. It contains neither connectedness nor
  regularity, so every statement here writes `G.Connected` and `G.IsRegularOfDegree (q + 1)`
  beside it. The excluded values are `θ₁ = q + 1` and, for bipartite graphs, `-(q + 1)` [DSV,
  Definition 0.9.9, p. 4; Lu, Definition 4.5.6, p. 57].
- **Weighted graphs.** A weight matrix `W : Matrix V V ℝ` has the `degree`, `laplacian`,
  `cutWeight`, `conductance` and `cheegerConstant` of KernelsAndSpectralMethods 1.1, 2.2 and 3.1;
  a diagonal entry of `W` is a loop, which counts once in the degree and never in a cut weight.
- **Signings and lifts.** A signing is `s : G.edgeSet → ℤˣ`; `signedAdjMatrix G s` is the signed
  adjacency matrix of MatchingPolynomial 2.1, and `twoLift G s` the `2`-lift of RamanujanGraphs
  3.1 on `V × Bool`.
- **Infinite graphs.** The adjacency operator of a graph of bounded degree is tested on finitely
  supported functions: `adjApply G f x = ∑_{y ∼ x} f(y)` for `f : V →₀ ℝ`. A bound
  `∑_{x ∈ T} (Af)(x)² ≤ C² ∑ f(y)²` for every finite `T` and every `f` says that `A` extends to
  `ℓ²(V)` with norm at most `C`; the spectral statements of 4.3 are made in the same terms.
- **Families.** A family is indexed by `m : ℕ`, with vertex types `V m`; "orders tending to
  infinity" is `Tendsto (fun m ↦ Fintype.card (V m)) atTop atTop`.
- **Multigraphs.** Multigraphs appear only as `ℕ`-valued symmetric matrices (the Margulis graphs,
  8.2), with eigenvalues `Matrix.IsHermitian.eigenvalues₀`, nonincreasing.
- **Random graphs.** `G(n, p)` is Mathlib's `SimpleGraph.binomialRandom (Fin n) p` with
  `p : unitInterval`, as in [RandomGraphs](../RandomGraphs/README.md).

## Layer 1: expansion constants and expander families

### 1.1 The isoperimetric constant

Definitions: `edgeBoundary G S`; `isoperimetricConstant G`, the infimum of `|∂S|/|S|` over
nonempty `S` with `2|S| ≤ n` [DSV, Definition 1.2.1, p. 12; Ni, §2.3, p. 15].

- **Basic properties** (`isoperimetricConstant_spec`). For `n ≥ 2` the infimum is attained and
  bounds every admissible set; `|∂Sᶜ| = |∂S|` for every `S`; and `h(Γ) > 0` exactly when `Γ` is
  connected. Supply also, as targets stated in prose: the membership criterion of
  `edgeBoundary`; `h(Γ) ≤ δ(Γ)` for `n ≥ 2` (take a single vertex); `h(Kₙ) = ⌈n/2⌉` and
  `h(Cₙ) = 2/⌊n/2⌋`; and monotonicity under adding edges.

**Suggested proof:** the index set is finite and, for `n ≥ 2`, nonempty, so the infimum is a
minimum. Swapping the coordinates of `G.interedges S Sᶜ` gives `G.interedges Sᶜ S`. If `Γ` is
disconnected, a component or its complement has at most `n/2` vertices and no boundary; if `Γ`
is connected, every nonempty proper `S` has an edge leaving it.

**Checks.**
- `K₂`: `h = 1`; `K₃`: `h = 2`; `C₄`: `h = 1` (two adjacent vertices); `K₅`: `h = 3 = ⌈5/2⌉`;
  `C₆`: `h = 2/3`; the Petersen graph: `h = 1`.
- Negative control: `2K₂` is disconnected and `1`-regular on `4` vertices, and `h = 0`; the
  edgeless graph on three vertices has `h = 0`.
- Negative control: on one vertex the index set is empty and `h = 0` although the graph is
  connected, which is why the positivity criterion carries `2 ≤ n`.
- Negative control: `S = {0}` in `C₄` has `|∂S| = 2` as a set of ordered pairs `(0, 1), (0, 3)`;
  counting `G.interedges S Sᶜ` together with `G.interedges Sᶜ S` would give `4`.

*Needs:* Mathlib `SimpleGraph.interedges`.

### 1.2 Expander families

Definitions: `secondAdjEigenvalue G`; `nontrivialSpectralRadius G`; `IsExpanderFamily k X`, a
sequence of connected `k`-regular graphs whose orders tend to infinity and whose isoperimetric
constants are bounded below by one `ε > 0` on the members with at least two vertices [DSV,
Definition 1.2.2, p. 13].

The value `secondAdjEigenvalue G = θ₂` for `n ≥ 2` and the bound
`|θ₂| ≤ nontrivialSpectralRadius G` for `n ≥ 2` are targets stated in prose.

**Checks.**
- `secondAdjEigenvalue`: `θ₂(K₄) = -1`, `θ₂(C₆) = 1`, `θ₂(K₃,₃) = 0`; on one vertex the value
  is `0`.
- `nontrivialSpectralRadius`: `K₄` gives `1`, `K₃,₃` gives `3` (the eigenvalue `-3`), the
  Petersen graph gives `2`; on one vertex the value is `0`.
- `IsExpanderFamily`: the cycles `Cₙ` are not an expander family, since `h(Cₙ) = 2/⌊n/2⌋ → 0`;
  the complete graphs are not one either, since their degrees vary.
- Negative control: the constant family `K₄, K₄, …` is connected, `3`-regular and has `h = 2`
  throughout, but fails `tendsto_card`; it is not an expander family.
- Negative control: reading `θ₂` at index `0` instead of `1` would give `θ₁ = k` for a connected
  `k`-regular graph, and the spectral gap `k - θ₁ = 0` for every such graph.

*Needs:* 1.1; SpectralGraphBounds 1.1.

### 1.3 The weighted dictionary

- **Adjacency plus a diagonal** (`cutWeight_adjMatrix_add_diagonal`). For `c : V → ℝ` and
  `W = A + diag(c)`, the weighted degree of KernelsAndSpectralMethods 1.1 is `deg + c`, the
  weighted Laplacian is `G.lapMatrix ℝ`, and every cut weight (2.2 there) is `|∂S|`.
- **Constant degree** (`cheegerConstant_eq_isoperimetricConstant_div`). If a weight matrix `W`
  has constant degree `k > 0` and its cut weights are the boundary sizes of `G`, then for `n ≥ 2`
  the Cheeger constant of KernelsAndSpectralMethods 3.1 is `h(Γ)/k`. This covers `W = A` for a
  `k`-regular `G` and `W = A + diag(d - deg)` for `G` of maximum degree `d > 0`.

**Suggested proof:** the diagonal never meets `S × Sᶜ`. With constant degree the conductance of
`S` is `|∂S| / (k min(|S|, |Sᶜ|))`, and `|∂Sᶜ| = |∂S|` (1.1) restricts the infimum to
`2|S| ≤ n`.

**Checks.**
- `P₃` with `W = A` and `S = {0}`: the cut weight is `1` and the volume is `1`.
- `C₆` (`k = 2`): `h = 2/3`, and the least conductance is `2/(2 · 3) = 1/3 = h/2`.
- `P₃` with `c = 2 - deg = (1, 0, 1)`: the degree is `2` everywhere, the Cheeger constant is
  `1/2 = h/2`, and the Laplacian of `W` is that of `P₃`.
- Negative control: `P₃` with `W = A` is not of constant degree; its Cheeger constant is `1`
  (every nonempty proper set has conductance `1`), while `h/Δ = 1/2`.

*Needs:* 1.1; KernelsAndSpectralMethods 1.1, 2.2 and 3.1.

## Layer 2: the Cheeger inequality and the diameter

### 2.1 The Cheeger inequality

- **General graphs** (`isoperimetricConstant_bounds`). A graph on `n ≥ 2` vertices with maximum
  degree `d` has `ν_{n-1}/2 ≤ h(Γ) ≤ √(2dν_{n-1})` [Ni, Theorem 11.7, p. 116, and Theorem 11.15,
  p. 118]. Connectedness is not needed: a disconnected graph has `ν_{n-1} = 0 = h(Γ)`.

**Suggested proof:** if `d = 0` both sides are `0`. Otherwise let `W = A + diag(d - deg)`, a
weighted graph (symmetric, nonnegative) with every degree `d` and Laplacian `G.lapMatrix ℝ`
(1.3). By LaplacianSpectraAndSpanningTrees 6.4 its normalized spectral gap is `ν_{n-1}/d`, and by
1.3 its Cheeger constant is `h/d`. The weighted Cheeger inequality of KernelsAndSpectralMethods
3.2 (positive degrees, `n ≥ 2`) gives `ν_{n-1}/d ≤ 2h/d` and `(h/d)²/2 ≤ ν_{n-1}/d`.

**Checks.**
- `C₄`: `ν_{n-1} = 2` and `h = 1 = ν_{n-1}/2`; the lower bound is attained.
- `Kₙ`, `n ≥ 2`: `ν_{n-1} = n`, `h = ⌈n/2⌉ ≥ n/2`, and `⌈n/2⌉ ≤ √(2(n - 1)n)`.
- `P₃`: `d = 2`, `ν_{n-1} = 1`, `h = 1`, and `1/2 ≤ 1 ≤ 2`; `K_{1,3}`: `d = 3`, `ν_{n-1} = 1`,
  `h = 1 ≤ √6`.
- Both bounds hold on all `1251` graphs with `2` to `7` vertices, `256` of them disconnected.
- Negative control: `K_{1,3}` has Laplacian spectrum `4, 1, 1, 0`; with the largest eigenvalue
  `4` in place of `ν_{n-1}` the lower bound would claim `2 ≤ 1`.

*Needs:* 1.3; LaplacianEigenvaluesOfGraphs 1.1; LaplacianSpectraAndSpanningTrees 6.4;
KernelsAndSpectralMethods 3.2.

### 2.2 Regular graphs and the spectral characterization

- **Regular graphs.** A `k`-regular graph on `n ≥ 2` vertices has
  `(k - θ₂)/2 ≤ h(Γ) ≤ √(2k(k - θ₂))` [DSV, Theorem 1.2.3, p. 13]. A target stated in prose;
  route: 2.1 with `d = k` (or `d = 0` when `k = 0`) and `ν_{n-1} = k - θ₂`, GraphSpectra 1.2 at
  the index `n - 2`.
- **Expander families are spectral** (`isExpanderFamily_iff_spectralGap`). A family of
  connected `k`-regular graphs with orders tending to infinity is an expander family iff
  `k - θ₂` is bounded below by one `ε > 0` on the members with at least two vertices [DSV,
  Corollary 1.2.4, p. 18].

**Suggested proof:** the regular case in both directions, with `ε ↦ ε/2` and `ε ↦ ε²/(2k)`;
`k ≥ 1` once a member has two vertices, by connectedness.

**Checks.**
- The Petersen graph: `k = 3`, `θ₂ = 1`, `h = 1`, and `1 ≤ 1 ≤ √12`; the lower bound is attained.
- `C₆`: `k - θ₂ = 1`, `h = 2/3`, and `1/2 ≤ 2/3 ≤ 2`.
- The regular form holds on all `25` regular graphs with `2` to `7` vertices, edgeless ones
  included, and `k - θ₂ = ν_{n-1}` on each.
- Negative control: the cycles `Cₙ` have `k - θ₂ = 2 - 2cos(2π/n) → 0` and `h → 0`; neither
  side of the equivalence holds.

*Needs:* 1.2, 2.1; GraphSpectra 1.2.

### 2.3 Logarithmic diameter

- **The diameter bound** (`diam_le_of_le_isoperimetricConstant`). A graph on `n ≥ 2` vertices
  with maximum degree `D` and `0 < ε ≤ h(Γ)` has diameter at most `2 log n / log(1 + ε/D)` [KS,
  Lemma 4.5 and Proposition 4.6, p. 97, which state it for `D`-regular graphs with `ε = h`]. The
  hypotheses make the graph connected and `D ≥ 1`. Hence an expander family of degree `k` with
  constant `ε` has diameter at most `2 log n / log(1 + ε/k)` [KS, Corollary 4.8, p. 98], a target
  stated in prose.

**Suggested proof:** for a ball `B_{r-1}(v)` with at most `n/2` vertices, the sphere `S_r(v)`
receives every edge of `∂B_{r-1}(v)` and each of its vertices at most `D` of them, so
`|B_r(v)| ≥ (1 + ε/D)|B_{r-1}(v)|`. Let `r_v` be the least radius with `|B_{r_v}(v)| > n/2`;
then `(1 + ε/D)^{r_v} ≤ n`. Two such balls meet, so `dist(v, w) ≤ r_v + r_w`.

**Checks.**
- `K₂`: `D = 1`, `h = 1`, and the bound is `2 log 2 / log 2 = 2 ≥ 1`.
- The Petersen graph with `ε = h = 1`: the bound is `2 log 10 / log(4/3) ≈ 16.01 ≥ 2`.
- The bound holds with `ε = h` on all `995` connected graphs with `2` to `7` vertices.
- Negative control: `C₂₀` has diameter `10` and `h = 1/5`; with `ε = 2 > h` the bound would be
  `2 log 20 / log 2 ≈ 8.64 < 10`.

*Needs:* 1.1; Mathlib `SimpleGraph.diam`.

## Layer 3: Ramanujan families

### 3.1 Ramanujan graphs are expanders

- **Ramanujan families** (`isExpanderFamily_of_isRamanujan`). For `q ≥ 2`, a family of connected
  `(q + 1)`-regular graphs satisfying `IsRamanujan q` with orders tending to infinity is an
  expander family [DSV, discussion after Definition 0.9.9, p. 4].

**Suggested proof:** for `n ≥ 2`, either `|θ₂| ≤ 2√q`, and then
`k - θ₂ ≥ q + 1 - 2√q = (√q - 1)² > 0`; or `θ₂ = -(q + 1)` and `k - θ₂ = 2(q + 1)`; the value
`θ₂ = q + 1` is excluded because `θ₁ = q + 1` is simple for a connected graph (GraphSpectra 3.2).
Then 2.2.

**Checks.**
- `K₅`, `K₃,₃`, `C₇`, the Petersen graph and the `4`-cube satisfy `IsRamanujan` with
  `q = k - 1`.
- `q = 2, 3, 4`: the gap bound `(√q - 1)²` is `0.1716`, `0.5359`, `1`.
- Negative control: `2K₄` satisfies `IsRamanujan 2` (eigenvalues `3, 3, -1⁶`) but is not
  connected; the connectedness written beside the predicate excludes it.
- Negative control: `q = 1`: cycles are Ramanujan and `q + 1 - 2√q = 0`; they are not
  expanders, which is why the statement needs `q ≥ 2`.

*Needs:* 2.2; IharaZetaFunction 5.3; GraphSpectra 3.2.

### 3.2 Expander families of every degree

- **Existence** (`exists_isExpanderFamily`). For every `d ≥ 3` there is an expander family of
  degree `d` whose `m`-th member has vertex type `Fin (2d · 2^m)`.

**Suggested proof:** RamanujanGraphs 3.3 gives, for each `m`, a connected bipartite `d`-regular
graph on `Fin (2d · 2^m)` satisfying `IsRamanujan (d - 1)`; apply 3.1 with `q = d - 1 ≥ 2`.

**Checks.**
- `d = 3`, `m = 0`: `K₃,₃` on `6` vertices is connected and satisfies `IsRamanujan 2`, and
  `h(K₃,₃) = 5/3` (three vertices, two on one side).
- The orders `2d · 2^m` tend to infinity; for `d = 3` they are `6, 12, 24, …`.
- Negative control: `d = 2`: the only connected `2`-regular graphs are cycles, and no family of
  them is an expander family (1.2).

*Needs:* 3.1; RamanujanGraphs 3.3.

## Layer 4: the regular tree

### 4.1 The tree

Definitions: `RegularTreeVertex k`, the reduced words over `Fin k` (no two equal adjacent
letters); `regularTree k`, in which a word is adjacent to the words obtained by prepending a
letter or removing the first letter; `regularTreeRoot k`, the empty word.

- **The tree** (`regularTree_spec`). `regularTree k` is a tree, every vertex has exactly `k`
  neighbours (counted with `Set.encard`), and every tree in which every vertex has exactly `k`
  neighbours is isomorphic to it. Supply also, as a target stated in prose, the adjacency
  criterion: two words are adjacent iff they differ and one is the other with a letter
  prepended.

The tree is the universal cover of every connected `k`-regular graph [BH, §6.4, p. 95].

**Suggested proof:** the length is a height function in which every vertex but the root has
exactly one neighbour of smaller length, so a cycle has no vertex of largest length. A vertex
`a :: w` has the neighbour `w` and the `k - 1` words `b :: a :: w` with `b ≠ a`; the root has the
`k` one-letter words. Build the isomorphism level by level from a base vertex, numbering the `k`
neighbours of the base and the `k - 1` forward neighbours of every other vertex.

**Checks.**
- `k = 0`: one vertex; `k = 1`: the words `[]` and `[0]`, the graph `K₂`.
- `k = 2`: the words alternate between the two letters, and the tree is the bi-infinite path.
- `k = 3`: the sphere of radius `r ≥ 1` has `3 · 2^{r-1}` words.
- Negative control: `K₄` is `3`-regular but not a tree, and it is finite, so it is not
  isomorphic to `regularTree 3`; the tree hypothesis of the uniqueness clause cannot be dropped.

*Needs:* Mathlib `SimpleGraph.IsTree`.

### 4.2 Closed walks at the root

- **The tree numbers** (`card_walk_regularTreeRoot`). The closed walks of length `ℓ` at the root
  of `regularTree k` number `treeWalkCount k ℓ 0`, the tree numbers of RamanujanGraphs 5.1, which
  are the moments of the Kesten–McKay law there (RamanujanGraphs 5.2).

**Suggested proof:** induction on `ℓ` for the number of walks of length `ℓ` from the root ending
at a given distance `h`, summed over the vertices at distance `h`: a step away from the root has
`k` choices at the root and `k - 1` elsewhere, a step towards it one; this is the recursion of
`treeWalkCount`.

**Checks.**
- `k = 3`, `ℓ = 0, …, 8`: `1, 0, 3, 0, 15, 0, 87, 0, 543`, both by the recursion and by powers
  of the adjacency matrix of the ball of radius `4`.
- `k = 4`: `1, 0, 4, 0, 28, 0, 232, 0, 2092`; `k = 2`: the central binomial coefficients
  `1, 0, 2, 0, 6, 0, 20, 0, 70`.
- Negative control: `k = 1`: the tree is `K₂` and the counts alternate `1, 0, 1, 0, …`; reading
  the recursion with `k - 1` steps away at the root as well would give `0` at `ℓ = 2`.

*Needs:* 4.1; RamanujanGraphs 5.1.

### 4.3 The spectrum of the tree

Definition: `adjApply G f x`, the adjacency operator on finitely supported functions.

- **Norm and spectrum** (`adjApply_regularTree_norm_and_spectrum`). For `k ≥ 2` the adjacency
  operator of `regularTree k` on `ℓ²` has norm `2√(k - 1)` [Lu, Proposition 4.5.2, p. 55, for the
  random walk operator `A/k`] and spectrum `[-2√(k - 1), 2√(k - 1)]`. In the form of the
  Conventions: `A` has norm at most `r = 2√(k - 1)`, every `μ ∈ [-r, r]` is an approximate
  eigenvalue, and `‖(A - μ)f‖ ≥ (|μ| - r)‖f‖` for `|μ| > r`.

**Suggested proof:** the upper bound by the Schur test with the weights `(k - 1)^{-|x|/2}`. For
`μ = r cos φ`, the radial functions `(k - 1)^{-|x|/2} cos(|x|φ)`, cut off at a large radius, are
approximate eigenvectors. For `|μ| > r` the bound below is the distance from `μ` to `[-r, r]` for
a self-adjoint operator of norm at most `r`.

**Checks.**
- The adjacency matrices of the balls of radius `5`, `20` and `80` in the `3`-regular tree have
  largest eigenvalues `2.6286`, `2.8040` and `2.8265`, increasing to `2√2 = 2.8284`.
- `k = 4`: the same balls give `3.1833`, `3.4317`, `3.4616`, below `2√3 = 3.4641`, the norm in
  [FreeProbability](../FreeProbability/README.md) 3.6 of the `4`-regular tree as the Cayley graph
  of the free group of rank `2`.
- `adjApply` on the tree with `f` the indicator of the root gives `1` on the `k` neighbours of
  the root and `0` elsewhere, so `∑ (Af)² = k ≤ 4(k - 1)` for `k ≥ 2`.
- Negative control: `k = 1`: the tree is `K₂` with spectrum `±1`, while `2√(k - 1) = 0`; the
  statement needs `k ≥ 2`.

*Needs:* 4.1.

## Layer 5: coverings and switching

### 5.1 Coverings

Definition: `IsCovering f` for `f : G →g H`, a surjective homomorphism that maps every
neighbourhood bijectively onto the neighbourhood of the image [BH, §6.4, p. 95].

- **Eigenvectors pull back** (`IsCovering.adjMatrix_mulVec_comp`). If `f` is a covering and
  `A_H u = θu`, then `A_G(u ∘ f) = θ(u ∘ f)` [BH, §6.4, p. 96].
- **Spectrum containment** (`IsCovering.charpoly_dvd`). The characteristic polynomial of
  `H.adjMatrix ℤ` divides that of `G.adjMatrix ℤ`: the spectrum of `H` is contained in that of
  `G` with multiplicity [BH, §6.4, p. 96].
- **Fibres** (`IsCovering.exists_card_fiber_eq`). A covering of a connected graph has fibres of
  constant size. Supply also, as a target stated in prose, that coverings compose.

**Suggested proof:** `(A_G(u ∘ f))(x) = ∑_{y ∼ x} u(f y) = ∑_{z ∼ f x} u(z)`. For the
divisibility, `u ↦ u ∘ f` is injective (`f` is surjective), and its image is invariant under the
symmetric matrix `A_G`, as is its orthogonal complement; in a basis adapted to the two, `A_G` is
block diagonal with `A_H` as one block. Over `ℚ` this gives the divisibility, and Gauss's lemma
brings it to `ℤ`. For the fibres, a covering restricts to a bijection between the fibres over
adjacent vertices.

**Checks.**
- `C₆ → C₃`, `v ↦ v mod 3`, is a covering; the characteristic polynomials are `(x - 2)(x + 1)²`
  and `(x - 2)(x - 1)²(x + 1)²(x + 2)`.
- Every `2`-lift `twoLift G s → G`, `(v, b) ↦ v`, is a covering with fibres of size `2`;
  checked for six signings each of `K₂`, `C₄`, `K₃`, `K₄` and the Petersen graph, together with
  the divisibility.
- Negative control: `P₃ → K₂`, `0, 1, 2 ↦ 0, 1, 0`, is a surjective homomorphism but not a
  covering (the middle vertex has two neighbours with the same image), and `x² - 1` does not
  divide `x(x² - 2)`.
- Negative control: the map from `K₂ ⊔ K₂ ⊔ K₁` onto `K₂ ⊔ K₁` collapsing the two copies of `K₂`
  is a covering of a disconnected base with fibres of sizes `2` and `1`, which is why the fibre
  statement needs a connected base.

*Needs:* Mathlib `Matrix.charpoly`.

### 5.2 Switching

Definition: `switchSigning G s v`, which negates the signs of the edges at `v`.

- **Switching** (`twoLift_switchSigning`). Switching gives an isomorphic `2`-lift and the same
  characteristic polynomial of the signed adjacency matrix. Supply also, as targets stated in
  prose: the all-positive signing gives `2G` with `signedAdjMatrix G s = A`, and the
  all-negative signing gives the bipartite double cover with `signedAdjMatrix G s = -A` [Sp,
  §44.2, p. 350].

**Suggested proof:** the map exchanging `(v, false)` and `(v, true)` and fixing every other
vertex is the isomorphism. The signed matrices are conjugate by the diagonal matrix with `-1` at
`v` and `1` elsewhere.

**Checks.**
- `C₄` with one negative edge: the lift is `C₈`; switching at an end of that edge moves the
  negative sign to the other edge at that vertex, and the lift is again `C₈`.
- `K₃` with one negative edge: the lift is `C₆`, and the signed matrix has eigenvalues `1, 1, -2`.
- Switching was checked for six signings each of `K₂`, `C₄`, `K₃`, `K₄` and the Petersen graph.
- Negative control: negating a single edge of `K₃` is not a switching, and changes the lift from
  `2K₃` to `C₆`.

*Needs:* 5.1; MatchingPolynomial 2.1; RamanujanGraphs 3.1.

## Layer 6: prime cycles and the Euler product

### 6.1 Cyclically reduced sequences

Definitions: `IsCyclicallyReduced G m a` for `a : Fin m → V` (consecutive vertices adjacent and
`a (i + 2) ≠ a i`, indices modulo `m`); `cyclicallyReducedCount G m`; `primitiveCount G m`
(`P_m`, the sequences fixed by no nontrivial rotation). A prime cycle is a rotation class of
primitive sequences.

- **Vertex sequences** (`cyclicallyReducedCount_eq`). For `m ≥ 1` the cyclically reduced
  sequences of length `m` are in bijection with the closed non-backtracking cycles of length `m`
  of IharaZetaFunction 1.2, by reading off the vertices; so their number is `N_m`.

**Suggested proof:** a closed walk is determined by its vertex sequence, the non-backtracking
condition on consecutive darts is `a (i + 2) ≠ a i`, and the tail condition is the same at the
wrap-around.

**Checks.**
- `K₄`: `N_1, …, N_6 = 0, 0, 24, 24, 0, 96`; `C₄`: `N_4 = 8`; `K_{2,3}`: `N_4 = 24`.
- In these three cases the sequence count equals `tr B^m` of the Hashimoto matrix for `m ≤ 6`.
- A tree has no cyclically reduced sequences: the path `P₄` has none of length `4`.
- Negative control: for `m = 0` there is one empty sequence but `N_0 = n`; the bijection carries
  `m ≥ 1`.

*Needs:* IharaZetaFunction 1.2.

### 6.2 Primitive sequences

- **Counting** (`cyclicallyReducedCount_eq_sum_primitiveCount`). For `m ≥ 1`,
  `N_m = ∑_{d ∣ m} P_d` and `m ∣ P_m`.

**Suggested proof:** every sequence is the repetition of a unique primitive one of length
dividing `m`, its least period, and rotation acts freely on primitive sequences.

**Checks.**
- `K₄`: `P_1, …, P_6 = 0, 0, 24, 24, 0, 72`, and `96 = 72 + 24`: the triangles traversed twice.
- `C₄`: `P_4 = 8`, two prime cycles; `K_{2,3}`: `P_4 = 24`, six prime cycles.
- Negative control: `P_6(K₄) = 72 ≠ N_6 = 96`; counting all cyclically reduced sequences as
  primitive would overcount.

*Needs:* 6.1.

### 6.3 The Euler product

- **The Euler product** (`trunc_iharaZeta`). For every `M`, modulo `u^{M+1}`,
  `ζ(u) = ∏_{d=1}^{M} (1 - u^d)^{-P_d/d}`; that is, `ζ` is the product over prime cycles `P` of
  `(1 - u^{ℓ(P)})⁻¹`, Ihara's definition of the zeta function [Lu, p. 58], where `ζ` is
  `iharaZeta G` of IharaZetaFunction 2.1.

**Suggested proof:** the logarithm of the product is
`∑_d (P_d/d) ∑_r u^{rd}/r = ∑_m (∑_{d ∣ m} P_d) u^m/m`, which is `∑_m N_m u^m/m` by 6.1 and 6.2.

**Checks.**
- For `K₄`, `C₄` and `K_{2,3}` the product agrees with `exp(∑_m N_m u^m/m)` modulo `u⁷`.
- `C₄`: `ζ = (1 - u⁴)^{-2}`.
- Negative control: a tree has `P_d = 0` for all `d` and `ζ = 1`; replacing `P_d/d` by `N_d/d`
  for `K₄` changes the coefficient of `u⁶`.

*Needs:* 6.2; IharaZetaFunction 2.1; Mathlib `PowerSeries.exp`, `PowerSeries.subst`,
`PowerSeries.invOfUnit`, `PowerSeries.trunc`.

## Layer 7: the Lubotzky–Phillips–Sarnak graphs

### 7.1 The construction

Definitions: `lpsQuaternions p`, the integral quaternions of norm `p` that are `≡ 1` or
`≡ i + j + k` modulo `2` [DSV, §2.6, pp. 67–68]; `quaternionSplitting x y`, the splitting attached
to a solution of `x² + y² + 1 = 0` in `𝔽_q` [DSV, Proposition 2.5.2, p. 58]; `PGL₂ q`, the
quotient of `GL₂(𝔽_q)` by its centre; `pslInPGL q`; `lpsSet p q x y`; `lpsGroup p q`
(`PSL₂(𝔽_q)` if `p` is a square modulo `q`, `PGL₂(𝔽_q)` otherwise); `lpsGraph p q x y`, the
Cayley graph [DSV, §4.2, p. 113].

Supply, as targets stated in prose: `quaternionSplitting x y` is multiplicative modulo `q` with
`det ψ(α) = N(α)` [DSV, Proposition 2.5.2, p. 58]; every `𝔽_q` with `q` odd has a solution of
`x² + y² + 1 = 0` [DSV, Proposition 2.5.3, p. 58]; and `lpsQuaternions p` has `2(p + 1)` elements,
`p + 1` classes `±α`, by Jacobi's four-square theorem `r₄(p) = 8(p + 1)` [DSV, Theorem 2.4.1,
p. 52], of which Mathlib's `Nat.sum_four_squares` is the existence half.

**Checks.**
- `p = 5`: `lpsQuaternions 5` is `±1 ± 2i`, `±1 ± 2j`, `±1 ± 2k`: `12` elements, `6 = p + 1`
  classes.
- `p = 3`: `±(i ± j ± k)`: `8` elements, `4` classes.
- `det` of `quaternionSplitting x y α` is `N(α)` modulo `q` when `x² + y² + 1 = 0`; for `q = 13`
  the solutions include `x = 0`, `y = 5`.
- Negative control: `lpsGroup 5 11` is the image of `PSL₂(𝔽₁₁)`, of order `660`, because
  `5 ≡ 4²` modulo `11`; taking `PGL₂(𝔽₁₁)` would double the vertex set and leave the graph
  disconnected.

*Needs:* Mathlib `Quaternion.normSq`, `Matrix.GeneralLinearGroup.mkOfDetNeZero`,
`SimpleGraph.mulCayley`.

### 7.2 Regularity, bipartiteness and girth

- **Structure** (`lpsGraph_spec`). Let `p ≠ q` be odd primes with `q > 2√p`, and
  `x² + y² + 1 = 0` in `𝔽_q`. Then `S_{p,q}` lies in `lpsGroup p q`, is symmetric, avoids `1`
  and has `p + 1` elements; every vertex has `p + 1` neighbours; if `p` is a square modulo `q`
  the group has `q(q² - 1)/2` elements and `egirth` is at least `2 log_p q`; otherwise the group
  has `q(q² - 1)` elements, the graph is bipartite and its `egirth` is at least
  `4 log_p q - log_p 4` [DSV, Lemma 4.2.1, p. 113; Remark 4.2.3(c), p. 114; Proposition 4.3.3,
  p. 118]. [DSV] proves the girth bound for the connected component of `1`; it transfers to the
  whole Cayley graph because the components of a Cayley graph are isomorphic.

**Suggested proof:** distinct classes `±α` have distinct images when `q > 2√p`, and a symmetric
connection set avoiding `1` of `p + 1` elements gives a `(p + 1)`-regular Cayley graph
(GraphSymmetryAndCayleyGraphs 3.1); a cycle of length `g` gives a reduced product of `g`
generators that is scalar modulo `q` but not in `ℤ`, so `p^g ≥ q²`, and `p^g ≥ q⁴/4` in the
bipartite case [DSV, §4.3].

**Checks.**
- `p = 5, q = 13` (`5` not a square modulo `13`): bipartite, `6`-regular on `2184 = 13 · 168`
  vertices, connected, `egirth = 8 ≥ ⌈4 log₅ 13 - log₅ 4⌉ = ⌈5.51⌉ = 6`.
- `p = 5, q = 11` (`5 ≡ 4²`): `660 = 11 · 120/2` vertices, not bipartite,
  `egirth = 6 ≥ ⌈2.98⌉ = 3`.
- `p = 3, q = 5`; `p = 3, q = 7`; `p = 7, q = 11`: bipartite, of orders `120`, `336`, `1320`, with
  `egirth` `6, 8, 6` above the ceilings `5, 6, 5` of the bounds `4.60, 5.82, 4.22`.
- Negative control: for `p = 11`, `q = 3` the hypothesis `q > 2√11 ≈ 6.63` fails, and the `12`
  classes of `lpsQuaternions 11` have only `6` images in `PGL₂(𝔽₃)`; for `p = 29`, `q = 5` the
  `30` classes have `27` images. (For `p = 5`, `q = 3` the six images happen to stay distinct.)

*Needs:* 7.1; GraphSymmetryAndCayleyGraphs 3.1; Mathlib `SimpleGraph.egirth`.

### 7.3 Connectedness and expansion

- **Connectedness and the spectral bound** (`lpsGraph_connected_and_spectral_bound`). Let
  `p ≥ 5` be prime. For `q > p⁸` the graph is connected, and not bipartite when `p` is a square
  modulo `q` [DSV, Theorem 4.3.5, p. 119, and Corollary 4.3.6, p. 120]; for `0 < ε < 1/6` and `q`
  large, every eigenvalue `μ` with `|μ| ≠ p + 1` has `|μ| ≤ p^{5/6 + ε} + p^{1/6 - ε}` [DSV,
  Theorem 4.4.4, p. 125].
- **Expansion.** For fixed `p ≥ 5` the graphs `X^{p,q}` with `q > p⁸` prime form an expander
  family [DSV, Theorem 4.4.4, p. 125]. A target stated in prose; route: the two bounds above and
  2.2, since `p^{5/6 + ε} + p^{1/6 - ε} < p + 1` for `p ≥ 5`.

**Suggested proof:** the Cayley graph is connected exactly when `S_{p,q}` generates the vertex
group (GraphSymmetryAndCayleyGraphs 3.1); generation via the classification of the subgroups of
`PSL₂(𝔽_q)` and the girth bound, which makes the subgroup generated by `S_{p,q}` non-metabelian
[DSV, §4.3]; the spectral bound via the lower bound `(q - 1)/2` on the degree of a nontrivial
representation of `PSL₂(𝔽_q)`, which forces a high multiplicity of `μ`, against a count of
closed walks [DSV, §4.4]. The proof of Theorem 4.4.4 uses connectedness, hence `p ≥ 5`.

**Checks.**
- `p = 5`: `5^{5/6 + ε} + 5^{1/6 - ε}` at `ε = 0.01` is `5.17`, below `p + 1 = 6`.
- `p = 5, q = 13` is connected although `13 < 5⁸`: the hypothesis `q > p⁸` is sufficient, not
  necessary.
- Negative control: at `ε = 1/6` the bound is `p + 1`, the degree, and says nothing; the
  statement needs `ε < 1/6`.

*Needs:* 2.2, 7.2; GraphSymmetryAndCayleyGraphs 3.1.

## Layer 8: groups and expanders

### 8.1 Property (T)

- **Property (T) gives expanders** (`exists_pos_le_isoperimetricConstant_of_propertyT`). Let `Γ`
  have property (T), in the form `RelativePropertyT (⊤ : Subgroup Γ)` of FactorRigidity 3.1, and
  let `S` be a finite generating set. There is `ε > 0` such that the Cayley graph of every finite
  quotient `Γ/N` with at least two elements, with respect to the image of `S`, has `h ≥ ε` [Lu,
  Proposition 3.3.1, p. 30].

**Suggested proof:** a set `A ⊆ Γ/N` with `2|A| ≤ |Γ/N|` and small boundary gives a unit vector
of `ℓ²_0(Γ/N)`, the indicator of `A` minus its mean, which is almost invariant under `S`; by
property (T) a representation without invariant vectors in `ℓ²_0` has none, which bounds the
boundary from below uniformly in `N`.

**Checks.**
- The image of `S` in `Γ/N` generates `Γ/N`, so the Cayley graph is connected
  (GraphSymmetryAndCayleyGraphs 3.1) and `h > 0` for each `N` with `|Γ/N| ≥ 2` (1.1); the
  content of the theorem is the uniform `ε`.
- Negative control: the trivial quotient has one vertex and `h = 0`, so the statement needs
  `2 ≤ |Γ/N|`.
- Negative control: `ℤ` lacks property (T), and its quotients `ℤ/n` with `S = {1}` give `Cₙ`,
  with `h(Cₙ) = 2/⌊n/2⌋ → 0`.

*Needs:* 1.1; FactorRigidity 3.1; GraphSymmetryAndCayleyGraphs 3.1; Mathlib
`SimpleGraph.mulCayley`.

### 8.2 The Margulis graphs

Definitions: `margulisMap m`, the four bijections `(a, b) ↦ (a + 1, b)`, `(a, b + 1)`,
`(a, a + b)`, `(-b, a)` of `ℤ/m × ℤ/m`; `margulisMatrix m`, the adjacency matrix of the
`8`-regular multigraph joining every point to its images and preimages. The symmetry of the
matrix, `isHermitian_margulisMatrix`, is auxiliary and proved in `Suggested.lean`.

- **The Margulis expanders** (`exists_pos_eigenvalues₀_margulis_le`). The second-largest
  eigenvalue of `margulisMatrix m` is at most `8 - ε` for one `ε > 0` and every `m` [Lu,
  Proposition 3.3.5, p. 32].

**Suggested proof:** the four maps are the images of generators of `ℤ² ⋊ SL₂(ℤ)` acting on
`ℤ/m × ℤ/m`. The pair `(ℤ² ⋊ SL₂(ℤ), ℤ²)` has relative property (T) (FactorRigidity 3.2), and
`ℓ²_0(ℤ/m × ℤ/m)` has no nonzero `ℤ²`-invariant vector, so almost invariant vectors are excluded
uniformly in `m`.

**Checks.**
- Every row of `margulisMatrix m` sums to `8` for `m = 1, 2, 3, 4, 8, 16, 32`; on `ℤ/1 × ℤ/1` it
  is the entry `8`.
- Second eigenvalues: `3.4641` (`m = 2`), `6.9880` (`m = 8`), `7.5483` (`m = 16`), `7.7422`
  (`m = 32`).
- Negative control: dropping the two shears and keeping the translations `(a + 1, b)` and
  `(a, b + 1)` gives the torus grid `C_m □ C_m` with second eigenvalue `2 + 2cos(2π/m) → 4`, the
  degree of that graph, so no uniform gap.

*Needs:* FactorRigidity 3.2.

### 8.3 The abelian obstruction

- **Diameter of abelian Cayley graphs** (`diam_addCayley_ge`). A connected Cayley graph of a
  finite abelian group `A` with a symmetric connection set of `d` elements has diameter at least
  `|A|^{1/d} - 1` [KS, proof of Proposition 4.25, p. 104].
- **No abelian expanders** (`abelian_not_expander`). For every `k` and `ε > 0`, every Cayley
  graph of a large enough finite abelian group with a connection set of at most `k` elements has
  `h < ε` [KS, Corollary 4.26, p. 104; Lu, Proposition 3.3.7, p. 33].

**Suggested proof:** the ball of radius `D` consists of the sums `∑_s c_s s` with `c_s ≥ 0` and
`∑ c_s ≤ D`, so `|A| ≤ (D + 1)^d`. For the obstruction, symmetrize `S` to at most `2k` elements;
a disconnected graph has `h = 0`; otherwise 2.3 with maximum degree at most `2k` bounds the
diameter by `2 log |A| / log(1 + ε/(2k))`, against `|A|^{1/(2k)} - 1`.

**Checks.**
- `ℤ/10` with `S = {±1}`: `C₁₀`, diameter `5 ≥ √10 - 1 ≈ 2.16`.
- `ℤ/5 × ℤ/5` with the four unit vectors: diameter `4 ≥ 25^{1/4} - 1 ≈ 1.24`; `(ℤ/2)³` with the
  three basis vectors: diameter `3 ≥ 1`.
- `ℤ/12` with `S = {±1, 6}`: diameter `3 ≥ 12^{1/3} - 1 ≈ 1.29`.
- Negative control: `ℤ/4` with `S = {2}` is disconnected, with the junk diameter `0 < 3`, which is
  why the diameter bound carries connectedness.
- Negative control: the hypercube `(ℤ/2)^d` with the `d` basis vectors has `h = 1` for every
  `d`; its degree is unbounded, which the obstruction excludes.

*Needs:* 1.1, 2.3; Mathlib `SimpleGraph.addCayley`, `SimpleGraph.diam`.

## Layer 9: spectra of random graphs

### 9.1 The spectrum of `G(n, p)`

- **The spectrum** (`binomialRandom_spectrum`). For `0 < p < 1`: `θ₁/(pn) → 1` in probability;
  for every `ε > 0`, with probability tending to `1`, `max_{i ≥ 2} |θᵢ| ≤ (2 + ε)√(p(1 - p)n)`;
  and for every bounded continuous `f`, `(1/n) ∑ f(θᵢ/√n)` converges in probability to the
  integral of `f` against the semicircle law of variance `p(1 - p)` [VM, Theorem 50, p. 261,
  Theorem 52, p. 263, and art. 190, p. 264; Füredi–Komlós].

**Suggested proof:** realize all `G(n, p)` as the corners of one infinite array of independent
Bernoulli(`p`) edge indicators, whose finite-dimensional laws are those of
[RandomGraphs](../RandomGraphs/README.md) 0.2, so that almost sure limits give limits in
probability. Write `A = p(J - I) + √(p(1 - p)) W` with `W` symmetric, zero diagonal and i.i.d.
upper entries of mean `0`, variance `1` and finite fourth moment. The almost sure edge limits
of [RandomMatrices](../RandomMatrices/README.md) 4.5 give `‖W‖/√n → 2`; Weyl's inequality
`Matrix.IsHermitian.eigenvalues₀_add_le` (RandomMatrices 1.2) transfers it to `θ₂, …, θₙ`,
since `p(J - I)` is `pJ`, of rank one, plus `-pI`; and `θ₁ = pn + O(√n)` from the Rayleigh
quotient of `𝟙` and Weyl. The almost sure semicircle law
of RandomMatrices 4.3 gives the limit law, and the rank bound
`Matrix.IsHermitian.abs_spectralMeasure_Iic_sub_le_rank_div_card` of 1.2 removes the rank-one
term.

**Checks.**
- `n = 2`: `G(2, p)` is `K₂` with probability `p` and the empty graph with probability `1 - p`.
- The expected value of `tr A² = 2|E|` is `pn(n - 1)`: `2p`, `6p`, `12p` for `n = 2, 3, 4`.
- The limit law is `TauCeti.Probability.semicircleReal 0 (p(1 - p))`, supported on
  `[-2√(p(1 - p)), 2√(p(1 - p))]`; at `p = 1/2` this is `[-1, 1]`.
- Negative control: with `p = 0` the graph is empty and `θ₁/(pn)` is the junk value `0`; the
  statement needs `0 < p`.

*Needs:* 1.2; RandomMatrices 1.2, 4.3 and 4.5; RandomGraphs 0.2; Mathlib
`SimpleGraph.binomialRandom`.

## Downstream consumers

Later roadmaps cite this one by section:
- Expander walks, mixing and codes: expander families (1.2), the Cheeger inequality (2.1–2.2) and
  logarithmic diameter (2.3).
- Explicit constructions and graph products: the isoperimetric constant of 1.1 and the
  spectral characterization of 2.2.
- Random regular graphs and Friedman's theorem: the regular tree (Layer 4), coverings (5.1) and
  prime cycles (Layer 6).
- Arithmetic groups and buildings: the Lubotzky–Phillips–Sarnak graphs (Layer 7) and property
  (T) (8.1).

## Scope and ownership

The roadmap is complete when Tau Ceti proves every target above. `Suggested.lean` states the
headlines that carry a Lean name, each with every conclusion the README attaches to it; it is not
an exhaustive acceptance test, and the other headlines are targets of the same standing, stated
in prose.

Owned here:
- the edge boundary, the isoperimetric constant and expander families of finite simple graphs,
  with the dictionary to the weighted Cheeger constant;
- the Cheeger inequality for simple graphs of every maximum degree, the spectral
  characterization of expander families, and the diameter bound by the isoperimetric constant;
- Ramanujan families as expanders, and expander families of every degree `d ≥ 3`;
- the infinite `k`-regular tree of every degree, its closed walks at the root and the norm and
  spectrum of its adjacency operator;
- coverings of simple graphs, the spectrum containment, and switching of `2`-lifts;
- cyclically reduced and primitive sequences, prime cycles and the Euler product of the Ihara
  zeta function;
- the Lubotzky–Phillips–Sarnak graphs, their structure, connectedness and expansion;
- expansion from property (T), the Margulis graphs and the abelian obstruction;
- the adjacency spectrum of `G(n, p)`.

Consumed, not restated (see the supplier contracts):
- GraphSpectra 1.2 and 3.2: the Laplacian spectrum of a regular graph and Perron–Frobenius for
  connected graphs.
- GraphSymmetryAndCayleyGraphs 3.1: the regularity of a Cayley graph and its connectivity
  criterion.
- SpectralGraphBounds 1.1: the sorted adjacency eigenvalues.
- LaplacianEigenvaluesOfGraphs 1.1: the sorted Laplacian eigenvalues and the algebraic
  connectivity.
- KernelsAndSpectralMethods 1.1, 2.2, 3.1 and 3.2: weighted graphs and the weighted Cheeger
  inequality.
- LaplacianSpectraAndSpanningTrees 6.4: the spectral gap of a weight with constant degree.
- IharaZetaFunction 1.2, 2.1 and 5.3: non-backtracking cycles, the zeta function and
  `IsRamanujan`.
- MatchingPolynomial 2.1: the signed adjacency matrix.
- RamanujanGraphs 3.1, 3.3 and 5.1: `2`-lifts, bipartite Ramanujan graphs of every degree and the
  tree numbers.
- [FactorRigidity](../FactorRigidity/README.md) 3.1 and 3.2: relative property (T) and the pair
  `(ℤ² ⋊ SL₂(ℤ), ℤ²)`; the latter is formalized in Tau Ceti.
- [RandomMatrices](../RandomMatrices/README.md) 1.2, 4.3 and 4.5 and
  [RandomGraphs](../RandomGraphs/README.md) 0.2: the Wigner limit laws, Weyl's inequality and the
  rank bound, and the binomial random graph.

Not owned here, and not used:
- RamanujanGraphs owns interlacing families, the characteristic polynomial of a `2`-lift
  (Bilu–Linial), the existence of bipartite Ramanujan graphs of every degree, the Kesten–McKay law
  and McKay's and Serre's theorems on the spectra of large regular graphs; it states no expansion
  property, and 3.2 here draws the expansion consequence.
- SpectralGraphBounds owns the expander mixing lemma for simple regular graphs (4.1), Quenell's
  bound (5.1) and the Alon–Boppana bound (5.2).
- ExpanderWalksAndCodes owns the passage from the Ramanujan property to the spectral parameter of
  rotation maps (1.2), walks on expanders, Tanner's vertex-expansion bound and Chung's bound on
  the diameter by the spectral gap (2.4); 2.3 here bounds the diameter by the isoperimetric
  constant instead.
- ExpanderConstructions owns rotation maps, graph powers, the tensor, zig-zag and replacement
  products and the zig-zag family; ExpanderCodes owns Tanner codes and the bipartite mixing
  lemma. Ramanujan graphs, the Lubotzky–Phillips–Sarnak graphs and the Margulis graphs are
  outside both.
- QuasirandomGraphs owns the Chung–Graham–Wilson equivalences and the quasirandomness of
  `G(n, p)` (5.2 there); 9.1 here owns its adjacency spectrum.
- KestenAmenabilityAndSpectralRadius owns the expansion constant of groups (2.1 there) and the
  spectral radius of random walks on groups, with its value on free groups (3.1 there), which is
  the norm of the tree of even degree; Layer 4 here owns trees of every degree, odd degrees
  included, and their spectrum. The norm `2√3` of the `4`-regular tree is also an example of
  [FreeProbability](../FreeProbability/README.md) 3.6.
- GraphSymmetryAndCayleyGraphs owns Cayley graphs as graphs, Sabidussi's theorem and their
  character spectra; this roadmap uses only the regularity and connectivity criteria of its 3.1.
- LaplacianEigenvaluesOfGraphs owns the dual Cheeger inequality for the bipartiteness ratio (8.2
  there); SpectralSparsification owns twice-Ramanujan sparsifiers (3.6 there).
- [MarkovChainMixing](../MarkovChainMixing/README.md) owns Cheeger's inequality for reversible
  Markov chains (3.2 there) and leaves expander families out of its scope;
  [CoboundaryExpansion](../CoboundaryExpansion/README.md) owns coboundary Cheeger constants of
  complexes, whose one-dimensional case is graph expansion.
- [SieveMethodsAndPrimePatterns](../SieveMethodsAndPrimePatterns/README.md) owns congruence
  expansion for `SL₂` (Bourgain–Gamburd–Sarnak), and
  [ReductiveGroupsPartII](../ReductiveGroupsPartII/README.md) the Bruhat–Tits tree of `SL₂`,
  which is the `(q + 1)`-regular tree as a building.
- [AmenableGroups](../AmenableGroups/README.md) owns Følner sets; the route of 8.3 through the
  diameter does not use them.

Formalized in Tau Ceti and not restated: the Cayley tree of a free group as a Serre graph, and the
relative property (T) of `(ℤ² ⋊ SL₂(ℤ), ℤ²)` (FactorRigidity 3.2). The tree of 4.1 for even `k`
is the Cayley tree of the free group of rank `k/2`, and an implementation may identify the two.

Boundary in one sentence: edge expansion of finite simple graphs and its spectral
characterization, the regular tree, coverings, prime cycles, and the Ramanujan, LPS,
property-(T), Margulis and random constructions of expanders are here; eigenvalue bounds, the
spectra of lifts and the existence of Ramanujan graphs, weighted spectral methods, the Ihara
determinant theory, walks, codes and graph products, quasirandomness and random-matrix limit laws
belong to their owners.

## Exact supplier contracts

### From Mathlib

- `SimpleGraph.interedges` (1.1); `SimpleGraph.lapMatrix` (1.3, 2.1).
- `SimpleGraph.diam`, `ℕ`-valued with the junk value `0` (2.3, 8.3); `SimpleGraph.egirth` and
  `SimpleGraph.egirth_eq_top` (7.2).
- `SimpleGraph.IsTree` (4.1).
- `SimpleGraph.mulCayley` and `SimpleGraph.addCayley`, which symmetrize the connection set and
  drop the identity (7.1, 8.1, 8.3).
- `SimpleGraph.binomialRandom`, with `p : unitInterval`, a probability measure (9.1).
- `Matrix.IsHermitian.eigenvalues₀` (sorted nonincreasingly) and `Matrix.charpoly` (5.1, 8.2).
- `PowerSeries.exp`, `PowerSeries.subst`, `PowerSeries.invOfUnit`, `PowerSeries.trunc` (6.3).
- `Quaternion.normSq`, `Nat.sum_four_squares` and `Matrix.GeneralLinearGroup.mkOfDetNeZero`
  (7.1). Mathlib has no `PGL₂` of a field; `PGL₂ q` is the quotient of `GL (Fin 2) (ZMod q)` by
  its centre.

### From Tau Ceti

- `Matrix.IsHermitian.eigenvalues₀_add_le` (Weyl) and
  `Matrix.IsHermitian.abs_spectralMeasure_Iic_sub_le_rank_div_card` (the rank bound), through
  RandomMatrices 1.2; used in 9.1.
- `TauCeti.Probability.semicircleReal`, the semicircle law with location and variance; used in
  9.1.

### From GraphSpectra

- 1.2: for a `k`-regular graph `ν_{i+1} = k - θ_{n-i}`, so `ν_{n-1} = k - θ₂`. Used in 2.2.
- 3.2: Perron–Frobenius for connected graphs; for a connected `k`-regular graph `θ₁ = k`. Used in
  3.1.

### From GraphSymmetryAndCayleyGraphs

- 3.1: for a finite group and a symmetric `S` avoiding `1`, the Cayley graph is `|S|`-regular; for
  every `S`, the Cayley graph is connected iff `S` generates the group. Used in 7.2, 7.3 and 8.1.

### From SpectralGraphBounds

- 1.1: `adjEigenvalues`, Mathlib's `eigenvalues₀` of `G.adjMatrix ℝ`, index `0` the largest;
  copied verbatim into `Suggested.lean`. Used in 1.2, 7.3 and 9.1.

### From LaplacianEigenvaluesOfGraphs

- 1.1: `lapEigenvalues` (nonincreasing) and `algebraicConnectivity`, the value at index `n - 2`
  for `n ≥ 2` and `0` otherwise; copied verbatim into `Suggested.lean`. Used in 2.1.

### From KernelsAndSpectralMethods

- 1.1: `degree` and `laplacian`; 2.2: `graphVolume` and `cutWeight`; 3.1: `conductance` and
  `cheegerConstant`; copied verbatim into `Suggested.lean`. Used in 1.3.
- 3.2: the weighted Cheeger inequality, for a weighted graph with positive degrees on `n ≥ 2`
  vertices: `λ₁ ≤ 2h` and `h²/2 ≤ λ₁`, with `λ₁` the spectral gap of 2.1 there. Used in 2.1.

### From LaplacianSpectraAndSpanningTrees

- 6.4: a weight matrix of constant degree `k > 0` with Laplacian `G.lapMatrix ℝ` has spectral gap
  `ν_{n-1}/k` on `n ≥ 2` vertices. Used in 2.1.

### From IharaZetaFunction

- 1.2: `IsNonBacktrackingCycle` and `closedNonBacktrackingCount` (`N_m`); 2.1: `iharaZeta`; 5.3:
  `IsRamanujan`; copied verbatim into `Suggested.lean`. Used in 3.1, 3.2 and Layer 6.

### From MatchingPolynomial

- 2.1: `signedAdjMatrix`, the signed adjacency matrix over `ℤ` of a signing; copied verbatim
  into `Suggested.lean`. Used in 5.2.

### From RamanujanGraphs

- 3.1: `twoLift` with its decidability instance; 5.1: `treeWalkCount`; copied verbatim into
  `Suggested.lean`. Used in 4.2 and Layer 5.
- 3.3: for every `d ≥ 3` and `k`, a connected bipartite `d`-regular graph on `Fin (2d · 2^k)`
  satisfying `IsRamanujan (d - 1)`. Used in 3.2.

### From FactorRigidity

- [FactorRigidity](../FactorRigidity/README.md) 3.1: `HasAlmostInvariantVectors` and
  `RelativePropertyT`, copied verbatim into `Suggested.lean`; used in 8.1. 3.2: the relative
  property (T) of `(ℤ² ⋊ SL₂(ℤ), ℤ²)`, formalized in Tau Ceti; used in 8.2.

### From RandomMatrices and RandomGraphs

- [RandomMatrices](../RandomMatrices/README.md) 1.2: Weyl's inequality and the rank bound
  (implemented in Tau Ceti); 4.3: the almost sure semicircle law for Wigner matrices with i.i.d.
  upper entries of variance `1`; 4.5: the almost sure edge limits `±2` of `W/√n` for i.i.d.
  upper entries of mean `0`, variance `1` and finite fourth moment and an i.i.d. real diagonal of
  finite second moment. Used in 9.1.
- [RandomGraphs](../RandomGraphs/README.md) 0.2: the finite-pattern laws of
  `SimpleGraph.binomialRandom`, independence of the edge indicators. Used in 9.1.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

- **Friedman's theorem.** For fixed `k ≥ 3` and `ε > 0`, a uniformly random `k`-regular graph on
  `n` vertices (`kn` even) has `θ₂ < 2√(k - 1) + ε` with probability tending to `1` [BH, §4.1,
  p. 67; Sp, §43.2, p. 341; Friedman; Bordenave]. A roadmap would start from the configuration
  model and the non-backtracking counts of IharaZetaFunction.
- **The Ramanujan property of the LPS graphs.** The eigenvalues of `X^{p,q}` other than
  `±(p + 1)` satisfy `|μ| ≤ 2√p` [DSV, Theorem 4.2.2 and Remark 4.2.3(b), p. 114]. The proof
  needs Hecke operators on weight-`2` cusp forms, the Jacquet–Langlands correspondence for the
  definite quaternion algebra, and Deligne's theorem.
- **Sharp bounds for `G(n, p)`.** With probability tending to `1`,
  `max_{i ≥ 2} |θᵢ| ≤ 2√(p(1 - p)n) + O(n^{1/3} log n)` [VM, Theorem 52, p. 263; Vu], by a
  refined trace method that extends RandomMatrices 4.5.

## References

- [BH] A. E. Brouwer, W. H. Haemers, *Spectra of Graphs*, Universitext, Springer, 2012: §4.1,
  p. 67; §6.4, pp. 95–96.
- [DSV] G. Davidoff, P. Sarnak, A. Valette, *Elementary Number Theory, Group Theory and Ramanujan
  Graphs*, London Mathematical Society Student Texts 55, Cambridge University Press, 2003:
  Definition 0.9.9, p. 4; Definition 1.2.1, p. 12; Definition 1.2.2 and Theorem 1.2.3,
  p. 13; Corollary 1.2.4, p. 18; Theorem 2.4.1, p. 52; Propositions 2.5.2 and 2.5.3, p. 58; §2.6,
  pp. 67–68; §4.2 and Lemma 4.2.1, p. 113; Theorem 4.2.2 and Remark 4.2.3, p. 114; Proposition
  4.3.3, p. 118; Theorem 4.3.5, p. 119; Corollary 4.3.6, p. 120; Theorem 4.4.4, p. 125.
- [KS] M. Krebs, A. Shaheen, *Expander Families and Cayley Graphs: A Beginner's Guide*, Oxford
  University Press, 2011: Lemma 4.5 and Proposition 4.6, p. 97; Corollary 4.8, p. 98;
  Proposition 4.25 and Corollary 4.26, p. 104.
- [Lu] A. Lubotzky, *Discrete Groups, Expanding Graphs and Invariant Measures*, Progress in
  Mathematics 125, Birkhäuser, 1994: Proposition 3.3.1, p. 30; Proposition 3.3.5, p. 32;
  Proposition 3.3.7, p. 33; Proposition 4.5.2, p. 55; Definition 4.5.6, p. 57; the zeta function
  of a regular graph, p. 58.
- [Ni] B. Nica, *A Brief Introduction to Spectral Graph Theory*, EMS Textbooks in Mathematics,
  European Mathematical Society, 2018: §2.3, p. 15; Theorem 11.7, p. 116; Theorem 11.15, p. 118.
- [Sp] D. A. Spielman, *Spectral and Algebraic Graph Theory*, author's manuscript, 2025: §43.2,
  p. 341; §44.2, p. 350.
- [VM] P. Van Mieghem, *Graph Spectra for Complex Networks*, 2nd ed., Cambridge University Press,
  2023: Theorem 50, p. 261; Theorem 52, p. 263; art. 190, p. 264.
- Z. Füredi, J. Komlós, *The eigenvalues of random symmetric matrices*, Combinatorica 1 (1981),
  233–241.
- V. H. Vu, *Spectral norm of random matrices*, Combinatorica 27 (2007), 721–736.
- J. Friedman, *A proof of Alon's second eigenvalue conjecture and related problems*, Mem. Amer.
  Math. Soc. 195 (2008), no. 910.
- C. Bordenave, *A new proof of Friedman's second eigenvalue theorem and its extension to random
  lifts*, Ann. Sci. Éc. Norm. Supér. 53 (2020), 1393–1439.

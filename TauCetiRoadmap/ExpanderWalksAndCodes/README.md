# Roadmap: expander walks and codes

**Summary.** An expander is a regular graph whose adjacency operator, divided by the degree `d`,
contracts the vectors with coordinate sum zero by a factor `λ < 1`. This roadmap proves what this
one bound gives: random walks that behave like independent samples, Tanner codes that correct a
constant fraction of errors, and explicit constants for Ramanujan graphs. The graphs are regular
multigraphs with loops on `n` vertices, given by rotation maps, and `λ` is two-sided: the largest
absolute value of an eigenvalue of the normalized adjacency matrix on the vectors with coordinate
sum zero. The theorems on walks take a number `λ` at least this parameter, and those on codes a
bound on the second singular value, so that a Ramanujan bound plugs in.

The headline theorems are these.

- *Hitting.* For a set `B` of density `μ` and a nonempty set `K` of times, the proportion of
  walks of length `t` from a uniform start that lie in `B` at every time of `K` is at most
  `μ (μ + λ(1 − μ))^(|K| − 1)`.
- *Concentration (Healy).* For `f_0, …, f_t` with values in `[0, 1]` and means `μ_i`,
  `k = t + 1` and `ε ≥ 0`, the proportion of walks with `|∑ (f_i(v_i) − μ_i)| ≥ εk` is at most
  `2 exp(−ε²(1 − λ)k/36)`. For functions that depend on time, `λ` cannot be replaced by the
  second largest eigenvalue.
- *Decoding.* Take a Tanner code on a bijective `D`-regular bipartite multigraph with second
  singular value at most `εD`, `0 < δ₀` and `ε ≤ δ₀/3`, and a map on inner words that returns
  every inner codeword from the words at distance less than `δ₀D/2` from it. Correcting
  alternately at the left and at the right vertices turns every word within distance
  `δ₀² D n/18` of a codeword `c` into `c` after `j + 1` steps once `(3/4)ʲ δ₀ n/9 < 1`.
- *Ramanujan graphs.* If a connected graph that is not bipartite has `|θ| ≤ 2√q` for every
  adjacency eigenvalue with `|θ| ≠ q + 1`, then `d λ ≤ 2√q` for every rotation map realizing it.
  Two disjoint copies of `K₄` show that connectivity is needed.

The roadmap also proves a sequence-of-sets form of the hitting bound, the relative distance bound
`δ₀(δ₀ − ε)/(1 − ε)` for Tanner codes when `ε < 1`, Tanner's bound on neighbourhoods, and Chung's bound: for
`d ≥ 1`, any two vertices are joined by a walk of length exactly `m` when `(n − 1)λᵐ < 1`.

It builds on ExpanderConstructions (rotation maps and `λ`), ExpanderCodes (Tanner codes, the
second singular value, the edge-set lemma behind decoding), GraphSpectra and SpectralGraphBounds
(the index of a regular graph, bipartiteness, Perron–Frobenius, standard spectra) and
IharaZetaFunction (the Ramanujan property), and restates none of their theorems.

Layer 1 below recalls the contraction on sum-zero vectors and turns the Ramanujan property into
bounds on `λ` and on the second singular value. Layer 2 treats walks, Layer 3 Tanner codes;
Layer 3 does not use Layer 2.

## Conventions

- **Rotation maps** (ExpanderConstructions, Conventions). `V`, `P` are finite types,
  `[DecidableEq V]`, `n = Fintype.card V`, `d = Fintype.card P`; a regular multigraph is
  `R : V × P → V × P`, an involution in the theorems (`Function.Involutive R`): `R (v, i) = (w, j)`
  says that the `i`-th edge at `v` leads to `w` and is the `j`-th edge at `w`. `adjCount`,
  `normAdj` (written `M`) and `secondEigenvalue` (written `λ(R)`) are copied verbatim from
  ExpanderConstructions 1.1–1.2. `λ(R)` is the supremum of `|xᵀ M x|` over `x` with `∑ x = 0` and
  `xᵀ x ≤ 1`; it is two-sided: `d λ(R) = max(|θ₂|, |θₙ|)` for a simple graph
  (ExpanderConstructions 1.3), so `λ(R) = 1` for bipartite and for disconnected graphs with
  ports. It is `0` on at most one vertex and with no ports.
- **Walks.** A walk of length `t` is a pair `(v, k)` with `v : V` and `k : Fin t → P`; its
  vertices are `walk R t v k : Fin (t + 1) → V`. The uniform random walk from a uniform start is
  the uniform law on `V × (Fin t → P)`, which has `n dᵗ` elements, and a probability bound
  `Pr(E) ≤ p` is stated as `#{x | E x} ≤ p · (n dᵗ)`. With `d = 0` and `t ≥ 1` there is no walk
  and every count is `0`; with `n = 0` every count is `0`.
- **Densities and means.** For `B : Finset V`, `μ = |B| / n`, and for `f : V → ℝ` the mean is
  `(∑ v, f v)/n`; both are `0` for `n = 0` (Lean's division by zero), where every statement
  holds with both sides `0`.
- **Bipartite multigraphs and codes** (ExpanderCodes, Conventions). A `D`-regular bipartite
  multigraph with left vertices `U`, right vertices `V` and ports `P` is `R : V × P → U × P`,
  bijective in the theorems: the edge at port `j` of the right vertex `v` is the edge `R (v, j)`
  at a port of a left vertex. `D = Fintype.card P`, `n = Fintype.card U` (also `Fintype.card V`
  when `D ≥ 1`). The edges are `U × P`. `biadjMatrix`, `secondSingularValue` (written `σ₂`) and
  `tannerCode` are copied verbatim from ExpanderCodes 1.1 and 2.1; an inner code is
  `C₀ : TauCeti.LinearCode F P` over a field `F`, and weights and distances are Mathlib's
  `hammingNorm` and `hammingDist`. The double cover of an involutive rotation map is the map
  itself read as `V × P → V × P`, with `σ₂ = d λ(R)` (ExpanderCodes 1.4).
- **Ramanujan graphs.** `IsRamanujan q G` is copied verbatim from IharaZetaFunction 5.3: every
  adjacency eigenvalue `θ` with `|θ| ≠ q + 1` has `|θ| ≤ 2√q`, over Mathlib's vertex-indexed
  `Matrix.IsHermitian.eigenvalues`. It exempts both `q + 1` and `−(q + 1)` and does not assume
  regularity or connectivity. Sorted eigenvalues `θ₁ ≥ ⋯ ≥ θₙ` are Mathlib's `eigenvalues₀`, as
  in SpectralGraphBounds 1.1; by Mathlib's definition, `eigenvalues v` is `eigenvalues₀` at the
  index `(Fintype.equivOfCardEq _).symm v`, so the two lists have the same values.
- **The two-sided parameter is needed throughout Layer 2.** For a bipartite graph `λ(R) = 1`, and
  every statement of Layer 2 is then true and weak; the Checks of 2.2 and 2.3 show that the
  second largest eigenvalue `λ₂` does not suffice.
- "Proved here" means that the route is written out in full in this README; it claims no
  novelty.

## Layer 1: the spectral parameters and Ramanujan graphs

### 1.1 The contraction on sum-zero vectors

For an involutive `R` and `x : V → ℝ` with `∑ x = 0`, `‖M x‖ ≤ λ(R) ‖x‖`. This bound is an item
of the API of ExpanderConstructions 1.2, stated there in prose without a Lean name; it is not a
target here. Every route of Layer 2 uses it, so its short proof is kept below.

Facts used below, each with its short proof, for an involutive `R` with `d ≥ 1`:

- `adjCount R` is symmetric and every row sums to `d`: the ports `i` at `v` with
  `(R (v, i)).1 = w` are sent by `R` bijectively onto the ports at `w` that lead to `v`, and each
  port at `v` leads to one vertex. So `M` is symmetric, `M 𝟙 = 𝟙`, and `𝟙ᵀ M = 𝟙ᵀ`; for `∑ x = 0`
  also `∑ (M x) = 0`. (These are items of the API of ExpanderConstructions 1.1, stated there in
  prose.)

Its short proof: for `d = 0` the matrix `M` is `0`; for `n = 0` there is nothing to prove.
Otherwise put `N = M − J/n`, symmetric, with `N 𝟙 = 0` and `N x = M x` for `∑ x = 0`. For any
`y`, write `y = ȳ 𝟙 + z` with `∑ z = 0`; then `yᵀ N y = zᵀ M z`, so
`|yᵀ N y| ≤ λ(R) zᵀ z ≤ λ(R) yᵀ y` by the definition of `λ(R)` (scaled to `zᵀ z ≤ 1`; the
set in the definition is bounded by `‖M‖`, so the supremum bounds each element). The operator
norm of the symmetric map
`Matrix.toEuclideanLin N` is the supremum of its Rayleigh quotients
(`ContinuousLinearMap.norm_eq_iSup_rayleighQuotient`), hence at most `λ(R)`, and
`‖M x‖ = ‖N x‖ ≤ λ(R) ‖x‖`. For a simple graph `λ(R)` is the parameter `α` of an
`(n, d, α)`-graph (Hoory–Linial–Wigderson, §2.4, p. 455).

**Checks.**

- `K₄` with the labelling of ExpanderConstructions 1.1: `M = (J − I)/3` and `λ = 1/3`; every
  `x` with `∑ x = 0` has `M x = −x/3`, so the bound is an equality.
- The condition `∑ x = 0` is needed: `x = 𝟙` gives `(M 𝟙)ᵀ(M 𝟙) = 4 > (1/9) · 4` on `K₄`.
- Involutivity is needed: on two vertices with one port, the map sending every `(v, 0)` to
  `(0, 0)` has `M = [[1, 0], [1, 0]]`; for `x = (a, −a)`, `xᵀ M x = 0`, so `λ(R) = 0`, while
  `M x = (a, a) ≠ 0`.

*Needs:* ExpanderConstructions 1.1, 1.2 (`adjCount`, `normAdj`, `secondEigenvalue`, copied);
Mathlib `ContinuousLinearMap.norm_eq_iSup_rayleighQuotient`, `Matrix.toEuclideanLin`,
`Matrix.dotProduct_mulVec`.

### 1.2 From the Ramanujan property to the spectral parameters

Prove `card_mul_secondEigenvalue_le_of_isRamanujan`: let `G` be a connected simple graph on `V`
that is not bipartite, with `IsRamanujan q G`, and let `R : V × P → V × P` have
`adjCount R = G.adjMatrix ℝ`. Then `d λ(R) ≤ 2√q`. In particular, if `G` is `(q + 1)`-regular
(which forces `d = q + 1` when `V` is nonempty), `λ(R) ≤ 2√q/(q + 1)`, the normalized
Ramanujan value `2√(d − 1)/d`.

Prove `secondSingularValue_le_of_isRamanujan`: let `G` be a connected simple graph on `U ⊕ V`
with no edge inside `U` and none inside `V`, with `IsRamanujan q G`, and let `R : V × P → U × P`
have `biadjMatrix R u v = G.adjMatrix ℝ (inl u) (inr v)`. Then `σ₂(R) ≤ 2√q`. The three
hypotheses on the edges say together that `G` is the simple bipartite graph whose biadjacency
matrix is that of `R`; they are the setting of ExpanderCodes 1.3, through which the route passes.

Neither statement needs `G` to be regular of degree `q + 1`, nor `q ≥ 1`. (Proved here.)

Route of the first statement: if `n = 1`, `λ(R) = 0` (the only `x` with `∑ x = 0` is `0`).
Let `n ≥ 2`. Each row of `G.adjMatrix ℝ` is a row of `adjCount R`, whose entries sum to `d`, so
`G` is `d`-regular, and `d ≥ 1` since `G` is connected. By ExpanderConstructions 1.3
`card_mul_secondEigenvalue_eq`, `d λ(R) = max(|θ₂|, |θₙ|)`. By GraphSpectra 3.2,
`IsRegularOfDegree.largestEigenvalue_eq`, `θ₁ = d`, and `θ₁` occurs once in the spectrum
(`Connected.perronFrobenius`), so `θ₂ < d`. By SpectralGraphBounds 1.3 `abs_adjEigenvalues_le`,
`θₙ ≥ −d`, and `θₙ ≠ −d` by GraphSpectra 3.7 `Connected.isBipartite_iff_smallestEigenvalue_eq`,
since `G` is not bipartite. Hence `−d < θₙ ≤ θ₂ < d`, so `|θ₂| < d` and `|θₙ| < d`. Each `θᵢ`
is a value of the vertex-indexed `eigenvalues` (Conventions). If `|θᵢ| ≠ q + 1`, then
`IsRamanujan` gives `|θᵢ| ≤ 2√q`. If `|θᵢ| = q + 1`, then `q + 1 < d`, so `θ₁ = d` is not exempt
and `IsRamanujan` gives `d ≤ 2√q ≤ q + 1` (as `(√q − 1)² ≥ 0`), a contradiction.

Route of the second statement: if `Fintype.card U ≤ 1`, then `σ₂(R)` is the singular value at
index `1` of the adjoint of `Matrix.toEuclideanLin (biadjMatrix R)` (Tau Ceti
`LinearMap.singularValues_adjoint`), a map out of a space of dimension at most `1`, so it is `0`
(Mathlib `LinearMap.singularValues_of_finrank_le`). Otherwise ExpanderCodes 1.3
`TauCetiRoadmap.ExpanderCodes.secondSingularValue_eq_adjEigenvalues` gives `σ₂(R) = θ₂`, the
adjacency eigenvalue of `G` at index `1`, and `θ₂ ≥ 0` (`LinearMap.singularValues_nonneg`). If
`θ₂ = q + 1`, then
`θ₁ > θ₂ = q + 1` because `θ₁` is simple (GraphSpectra 3.2 `Connected.perronFrobenius`), so `θ₁`
is not exempt and `IsRamanujan` gives `θ₁ ≤ 2√q ≤ q + 1`, a contradiction. So `θ₂ ≠ q + 1` and
`σ₂ = |θ₂| ≤ 2√q`.

**Checks.**

- Connectivity is needed in both: two disjoint copies of `K₄` (`q = 2`) have spectrum
  `3, 3, (−1)⁶`, so `IsRamanujan 2` holds, but `θ₂ = 3` and `3 λ(R) = 3 > 2√2`; two disjoint
  copies of `K₃,₃`, read as one bipartite graph with `D = 3`, have spectrum `3, 3, 0⁸, −3, −3`,
  satisfy `IsRamanujan 2`, and have `σ₂ = 3 > 2√2`.
- Non-bipartiteness is needed in the first: `K₃,₃` (`q = 2`, spectrum `3, 0⁴, −3`) is connected
  and Ramanujan, and `3 λ(R) = 3 > 2√2`. Read as a bipartite graph it has `σ₂ = 0 ≤ 2√2`.
- The Petersen graph (spectrum `3, 1⁵, (−2)⁴`, GraphSpectra 2.6 `adjSpectrum_petersenGraph`) is
  connected, not bipartite (it has a `5`-cycle) and satisfies `IsRamanujan 2`; `3 λ = 2 ≤ 2√2`,
  so `λ = 2/3`.
- The Paley graph on `ℤ/13` (adjacent when the difference is one of the squares
  `1, 3, 4, 9, 10, 12`) is `6`-regular and satisfies `A² + A − 3I = 3J`, checked entry by entry;
  on the vectors with coordinate sum zero this gives `θ² + θ − 3 = 0`, so its spectrum is `6` and
  `(−1 ± √13)/2`. It contains the triangle `0, 1, 4`, so it is not bipartite, and it is connected
  (two non-adjacent vertices have `3` common neighbours). With `q = 5`,
  `(1 + √13)/2 ≤ 2√5` because `(1 + √13)² = 14 + 2√13 ≤ 80`, so `IsRamanujan 5` holds and
  `6 λ = (1 + √13)/2`.
- The `3`-cube, read as a bipartite graph (spectrum `3, 1³, (−1)³, −3`, GraphSpectra 2.6
  `adjSpectrum_hypercube`): `IsRamanujan 2` holds and `σ₂ = 1 ≤ 2√2`, while the first statement
  does not apply and `λ = 1`.
- The hypotheses on the edges inside `U` and `V` are needed in the second statement: the `6`-cube
  (spectrum `6 − 2i` with multiplicity `C(6, i)`, GraphSpectra 2.6) is connected and satisfies
  `IsRamanujan 5`, since every eigenvalue other than `±6` has absolute value at most `4 ≤ 2√5`.
  Let `U` be the vertices whose first five coordinates have even sum and `V` the others. The
  edges between `U` and `V` form two disjoint copies of the `5`-cube, so `biadjMatrix R` for
  `D = 5` has singular values `5, 5, …` and `σ₂ = 5 > 2√5`; the `32` edges that change the last
  coordinate lie inside `U` or inside `V`.

*Needs:* ExpanderConstructions 1.1–1.3 (`adjCount`, `normAdj`, `secondEigenvalue`, copied;
`card_mul_secondEigenvalue_eq`); ExpanderCodes 1.1 (`biadjMatrix`, `secondSingularValue`,
copied) and 1.3 `TauCetiRoadmap.ExpanderCodes.secondSingularValue_eq_adjEigenvalues`;
IharaZetaFunction 5.3 (`IsRamanujan`, copied); GraphSpectra 3.2
(`IsRegularOfDegree.largestEigenvalue_eq`, `Connected.perronFrobenius`)
and 3.7 (`Connected.isBipartite_iff_smallestEigenvalue_eq`); SpectralGraphBounds 1.3
`abs_adjEigenvalues_le`; Mathlib `Matrix.IsHermitian.eigenvalues`,
`LinearMap.singularValues_of_finrank_le`, `LinearMap.singularValues_nonneg`; Tau Ceti
`LinearMap.singularValues_adjoint`.

### Examples

- The Petersen graph: `λ = 2/3`. The Paley graph on `ℤ/13`: `λ = (1 + √13)/12`. A connected
  non-bipartite `(q + 1)`-regular Ramanujan graph: `λ ≤ 2√q/(q + 1)`.
- The explicit family of ExpanderConstructions 4.1 (`zigZagFamily_spec`) has `λ ≤ 1/2` for every
  base graph with `λ ≤ 1/4`; its members are not simple graphs in general, and the bound is used
  directly.

### Dependencies

ExpanderConstructions 1.1–1.3; ExpanderCodes 1.1 and 1.3; IharaZetaFunction 5.3; GraphSpectra
2.6 (Checks), 3.2 and 3.7; SpectralGraphBounds 1.3; Mathlib's Rayleigh quotients, Hermitian
eigenvalues and singular values; Tau Ceti `LinearMap.singularValues_adjoint`.

## Layer 2: walks: hitting, concentration, neighbourhoods and connections

### 2.1 Walks and their counts

Define `walk R t v k : Fin (t + 1) → V` by `walk R 0 v k = fun _ => v` and
`walk R (t + 1) v k = Fin.cons v (walk R t (R (v, k 0)).1 (Fin.tail k))`: first the edge at port
`k 0`, then the rest.

Fact used below (the transfer-matrix count): for `g : Fin (t + 1) → V → ℝ`,

    ∑ over (v, k) of ∏ i, g i (walk R t v k i) = 𝟙ᵀ G₀ A G₁ A ⋯ A G_t 𝟙,

where `A = adjCount R` as a real matrix and `Gᵢ` is the diagonal matrix of `g i`. Route: induction
on `t`, splitting off the first port; the number of ports `i` at `v` with `(R (v, i)).1 = w` is
`A v w`. With `A = d M`, the right side is `dᵗ 𝟙ᵀ G₀ M G₁ ⋯ M G_t 𝟙`. Indicator functions give
the counts of walks confined to sets (Hoory–Linial–Wigderson, Lemma 3.7, p. 462) and exponentials
give the moment generating function (Healy, (2), p. 14). The same count with `g i = 1` except at
one time shows that `#{(v, k) | walk R t v k i ∈ B} = |B| dᵗ` for every `i` when `R` is
involutive, since `𝟙ᵀ A = d 𝟙ᵀ`.

**Checks.**

- The last vertex of `walk R t v k` is the vertex of `rotationPower R t (v, k)` of
  ExpanderConstructions 2.1: both recursions follow the port `k 0` first and then the tail of `k`.
- On `K₄`, `t = 2`: `4 · 3² = 36` walks; those with `v₀ = v₂` number `4 · 3 = 12`
  (`(A²)_vv = 3`).

*Needs:* ExpanderConstructions 1.1 (`adjCount`, copied); Mathlib `Fin.cons`, `Fin.tail`.

### 2.2 The hitting property

Prove `card_walk_mem_le`: for an involutive `R` with `λ(R) ≤ λ`, `t : ℕ`, `B : Finset V` of
density `μ` and a nonempty `K ⊆ Fin (t + 1)`,

    #{(v, k) | walk R t v k i ∈ B for every i ∈ K} ≤ μ (μ + λ (1 − μ))^(|K| − 1) · n dᵗ.

For `K` the set of all times this is `μ (μ + λ(1 − μ))ᵗ` for walks confined to `B` (Vadhan,
*Pseudorandomness*, Theorem 4.17, p. 93, and the last display of its proof, p. 98, which give
`µ (µ + λ(1 − µ))^(t − 1)` for walks with `t` vertices; Hoory–Linial–Wigderson, Theorem 3.6,
p. 462, with the weaker `(β + α)ᵗ`, and Theorem 3.10, p. 463, for a set of times with
`(β + α)^(|K| − 1)`, stated without proof).

Prove `card_walk_mem_seq_le`: for an involutive `R` with `λ(R) ≤ λ` and sets
`B 0, …, B t` of densities `μ_i`,

    #{(v, k) | walk R t v k i ∈ B i for every i} ≤ √(μ₀ μ_t) ∏_(i < t) (√(μ_i μ_(i+1)) + λ) · n dᵗ

(Hoory–Linial–Wigderson, Theorem 3.11, p. 463, without the factor `√(μ₀ μ_t)`, which the
remark after it notes their argument gives away).

Route (proved here, after Vadhan's Claim 4.21, p. 97). If `n = 0`, or `d = 0` and `t ≥ 1`, the
count is `0`; if `t = 0`, the count is `|B|` (resp. `|B 0|`) and both bounds are equal to it. Let
`d ≥ 1`, write `P_B` for the diagonal projection onto `B` and use 1.1 and its facts.

- For `y` supported on `B`, write `y = ȳ 𝟙 + z` with `∑ z = 0`. Then
  `yᵀ M y = n ȳ² + zᵀ M z`, `n ȳ² ≤ μ yᵀ y` (Cauchy–Schwarz on the support of `y`), and
  `|zᵀ M z| ≤ λ(R) zᵀ z = λ(R)(yᵀ y − n ȳ²)`. For `λ(R) ≤ 1` this gives
  `−λ(R) yᵀ y ≤ yᵀ M y ≤ (μ + λ(R)(1 − μ)) yᵀ y`. The same holds for `Mʲ`, `j ≥ 1`, with
  `λ(R)ʲ ≤ λ(R)` in place of `λ(R)`, since `|zᵀ Mʲ z| ≤ ‖z‖ ‖Mʲ z‖ ≤ λ(R)ʲ zᵀ z` by 1.1. So the
  symmetric matrix `P_B Mʲ P_B` has norm at most `c = μ + λ(1 − μ)` when `λ ≤ 1`.
- Index sets: list `K` as `i₁ < ⋯ < i_r`. By the transfer-matrix count, `𝟙ᵀ M = 𝟙ᵀ` before
  `i₁` and `M 𝟙 = 𝟙` after `i_r`, the count is
  `dᵗ 𝟙_Bᵀ (P_B M^(j₁) P_B) ⋯ (P_B M^(j_(r−1)) P_B) 𝟙_B` with gaps `j_s ≥ 1`, which is at
  most `dᵗ ‖𝟙_B‖² c^(r − 1) = μ c^(r − 1) n dᵗ`. If `λ > 1`, then `c ≥ 1` and the count is at
  most the number of walks with `walk R t v k i₁ ∈ B`, which is
  `|B| dᵗ = μ n dᵗ` by 2.1.
- Sequences: for `x` supported on `B` and `y` on `B'`, `yᵀ M x = n x̄ ȳ + y_⊥ᵀ M x_⊥` with
  `n |x̄ ȳ| ≤ √(μ μ') ‖x‖ ‖y‖` and `|y_⊥ᵀ M x_⊥| ≤ λ(R) ‖x‖ ‖y‖` by 1.1, so
  `‖P_(B') M P_B‖ ≤ √(μ μ') + λ`. The count is `dᵗ 𝟙_(B 0)ᵀ ∏ (P_(B i) M P_(B (i+1))) 𝟙_(B t)`,
  at most `dᵗ ‖𝟙_(B 0)‖ ‖𝟙_(B t)‖ ∏ (√(μ_i μ_(i+1)) + λ)`, and
  `‖𝟙_(B 0)‖ ‖𝟙_(B t)‖ = n √(μ₀ μ_t)`. No case split on `λ` is needed here.

**Checks.**

- Equality: for `t = 0` both bounds are equalities. On the complete graph with a loop at every
  vertex (`R (v, i) = (i, v)`, `λ = 0`), the vertices of a walk are independent and uniform: the
  first count is `μ^|K| n^(t+1)` and the second `∏ |B i|`, both equal to the bounds.
- The Petersen graph (`λ = 2/3`, 1.2), `B` its outer `5`-cycle, in which every vertex has two
  of its three neighbours (`μ = 1/2`), `t = 2`, `K` all times:
  `5 · 2 · 2 = 20` walks stay in `B`, and the bound is `(1/2)(5/6)² · 90 = 125/4`.
- The two-sided parameter is needed: on the `6`-cycle (`λ = 1`), `B` the even vertices and
  `K = {0, 2}`, `t = 2`, every walk from an even vertex is at an even vertex at time `2`: the
  count is `3 · 4 = 12`, equal to the bound `(1/2) · 1 · 24`; with the second largest eigenvalue
  `1/2` of the normalized `6`-cycle in place of `λ`, the bound would be `9 < 12`.
- `K` must be nonempty: on `K₄` with `t = 1`, `K = ∅` and `B` one vertex, every one of the `12`
  walks counts, while `μ (…)^(0 − 1) n d = (1/4) · 12 = 3` (natural subtraction).
- Involutivity is needed: for the map of 1.1 (every `(v, 0)` to `(0, 0)`, `λ(R) = 0`),
  `B = {0}`, `t = 1`, `K = {1}`: both walks end in `B`, while the bound is `(1/2) · 2 = 1`.

*Needs:* 1.1, 2.1; Mathlib `Finset.sum_mul_sq_le_sq_mul_sq`, `abs_real_inner_le_norm`.

### 2.3 The Chernoff bound for expander walks

Prove `card_walk_sum_sub_ge_le`: for an involutive `R` with `λ(R) ≤ λ`, `t : ℕ`, `k = t + 1`,
functions `f 0, …, f t : V → ℝ` with values in `[0, 1]` and means `μ_i`, and `ε ≥ 0`,

    #{(v, k) | ε k ≤ ∑ i (f i (vᵢ) − μ_i)} ≤ exp(−ε² (1 − λ) k / 36) · n dᵗ,
    #{(v, k) | ε k ≤ |∑ i (f i (vᵢ) − μ_i)|} ≤ 2 exp(−ε² (1 − λ) k / 36) · n dᵗ,

where `vᵢ = walk R t v k i` (Healy, *Randomness-efficient sampling within NC¹*, ECCC TR06-058,
revision 1, Theorem 1, p. 3, restated p. 13, for `ε > 0` and the two-sided form; proof in §6,
pp. 13–16).

Route (Healy's proof). Cases first: if `n = 0`, or `d = 0` and `t ≥ 1`, the counts are `0`; if
`λ ≥ 1` or `ε = 0` the bounds are at least `n dᵗ`; if `ε > 1` the events are empty, since
`∑ (f i (vᵢ) − μ_i) ≤ k`. Let `0 < ε ≤ 1`, `λ(R) ≤ λ < 1` and `r = ε(1 − λ)/18`.

- Markov's inequality in counting form: `#{S ≥ a} e^(r a) ≤ ∑ e^(r S)`, with `S` the sum and
  `a = εk + ∑ μ_i` (Healy (1), p. 14).
- By 2.1, `∑ e^(r S) = n dᵗ ⟨𝟙, E_t M ⋯ M E_0 u⟩` with `Eᵢ` the diagonal matrix of `e^(r f i)` and
  `u = 𝟙/n` (Healy (2)–(3), p. 14); for `t = 0` there is no `M` and `d` plays no role.
- With `z₀ = E₀ u`, `zᵢ = Eᵢ M z_(i−1)`, split each `zᵢ` into its component along `𝟙` and its
  sum-zero component. Since `0 ≤ e^(r f) − 1 ≤ e^r − 1 ≤ 2r` (Mathlib `Real.exp_bound'` with two
  terms gives `e^x ≤ 1 + x + x²` on `[0, 1]`) and `e^r λ(R) ≤ √λ(R)` (as
  `2r ≤ 1 − λ ≤ −log λ` for `0 < λ < 1`, Mathlib `Real.log_le_sub_one_of_pos`; trivial for
  `λ(R) = 0`), 1.1 gives Healy's Lemma 15 (p. 15): the sum-zero part of `zᵢ` has norm at most
  `4r/(1 − λ)` times the largest norm of an earlier parallel part.
- Healy's Lemma 16 (pp. 15–16): the parallel part of `zᵢ` has norm at most
  `exp(r μ_i + 9 r²/(1 − λ))` times the largest earlier one, using `e^x ≤ 1 + x + x²` on `[0, 1]`
  and `1 + x ≤ e^x` (Mathlib `Real.add_one_le_exp`). The factors are at least `1`, so induction
  gives `⟨𝟙, z_t⟩ ≤ exp(r ∑ μ_i + 9 k r²/(1 − λ))`.
- Hence the upper tail is at most `exp(9 k r²/(1 − λ) − r ε k) n dᵗ = exp(−ε²(1 − λ)k/36) n dᵗ`.
  The lower tail is the upper tail of `1 − f i`, whose sum of deviations is the negative; the
  two-sided count is at most the sum of the two.

Healy's Remark 17 (p. 16) notes that the proof allows a different expander at each step; that
form is not stated here.

**Checks.**

- `ε ≥ 0` is needed: on `K₄` (`λ = 1/3`) with `t = 0`, `f 0 = 1/2` constant and `ε = −1`, every
  one of the `4` vertices satisfies `−1 ≤ 0`, while the bound is `4 e^(−1/54) < 4`.
- The two-sided parameter is needed when the functions depend on time: on the `6`-cycle, let
  `f i` be the indicator of the vertices of the parity of `i`. A walk that starts at an even
  vertex has `f i (vᵢ) = 1` for every `i`, so exactly half of the walks have
  `∑ (f i (vᵢ) − 1/2) = k/2`. With `ε = 1/2` and `k = 288`, the bound with the second largest
  eigenvalue `1/2` in place of `λ` would be `exp(−(1/4)(1/2) · 288/36) = e^(−1) < 1/2`; with the
  two-sided `λ = 1` the bound is `1`.
- Involutivity is needed: for the map of 1.1 (`λ(R) = 0`), `t = 1`, `f 0 = 0`, `f 1` the
  indicator of `{0}` (means `0` and `1/2`) and `ε = 1/4`: both walks have sum `1/2 = ε k`, while
  the bound is `2 e^(−1/288) < 2`.
- For the Petersen graph (`λ = 2/3`) the exponent is `ε² k/108`, and for the explicit family of
  ExpanderConstructions 4.1 (`λ ≤ 1/2`) it is `ε² k/72`.

*Needs:* 1.1, 2.1; Mathlib `Real.exp_bound'`, `Real.add_one_le_exp`,
`Real.log_le_sub_one_of_pos`.

### 2.4 Neighbourhoods and walks between any two vertices

Prove `card_le_card_image_mul` (Tanner's bound): for an involutive `R` with `d ≥ 1` and
`λ(R) ≤ λ`, every `S : Finset V` with neighbourhood `N(S) = {(R (v, i)).1 | v ∈ S, i ∈ P}`
satisfies

    |S| ≤ |N(S)| (λ² + (1 − λ²) |S| / n),

so `|N(S)|/|S| ≥ 1/(λ² + (1 − λ²)ρ)` when `|S| ≤ ρ n` and `λ ≤ 1` (Hoory–Linial–Wigderson,
Theorem 4.15, p. 477, with proof on p. 478, attributed to Tanner).

Prove `exists_walk_eq_of_mul_pow_lt_one` (Chung's bound): for an involutive `R` with `d ≥ 1`,
`λ(R) ≤ λ` and `m : ℕ` with `(n − 1) λᵐ < 1`, any two vertices `v, w` are joined by a walk of
length exactly `m`: some `k : Fin m → P` has `walk R m v k (Fin.last m) = w` (Chung,
*Diameters and eigenvalues*, Theorem 1, p. 188, with proof pp. 188–189, which gives
`(k/A)ᵐ > n − 1` as the condition in the unnormalized form). For a simple graph realized by `R`
this gives `G.diam ≤ m`; the classical form `⌈log(n − 1)/log(1/λ)⌉` is not used, since it is a
junk value in Lean at `λ = 0` and `λ = 1`.

Route of Tanner's bound (HLW's): with `x = 𝟙_S`, `s = |S|`, and `x = (s/n) 𝟙 + z`,
`‖M x‖² = s²/n + ‖M z‖² ≤ s²/n + λ²(s − s²/n)` by 1.1 (`M 𝟙 = 𝟙`, `M z ⊥ 𝟙`,
`λ(R)² ≤ λ²`). The vector `M x` is supported on `N(S)` and its entries sum to `s` (`𝟙ᵀ M = 𝟙ᵀ`),
so Cauchy–Schwarz gives `s² ≤ |N(S)| ‖M x‖²`. Divide by `s` (the case `s = 0` is immediate).
(Proved here, after HLW.)

Route of Chung's bound: the number of such walks is `dᵐ (Mᵐ)_(v w)` (2.1). With `u = 𝟙/n`,
`(Mᵐ)_(v w) = 1/n + (e_v − u)ᵀ Mᵐ (e_w − u)`, and `|(e_v − u)ᵀ Mᵐ (e_w − u)| ≤ λᵐ (1 − 1/n)` by
1.1 applied `m` times, since `‖e_v − u‖² = 1 − 1/n`. So `(Mᵐ)_(v w) ≥ (1 − (n − 1)λᵐ)/n > 0`.
(Chung's proof, in this normalization.)

**Checks.**

- Equality in Tanner's bound: on `K₄` (`λ = 1/3`) a single vertex has `N(S)` of size `3`, and
  `3 (1/9 + (8/9)(1/4)) = 1 = |S|`.
- Ports are needed in both: with `P` empty, `λ(R) = 0`, `N(S) = ∅` for every `S`, and no walk of
  length `m ≥ 1` exists, while `(n − 1) · 0 < 1`.
- Involutivity is needed: for the map of 1.1 (`λ(R) = 0`), `S = {1}` has `N(S) = {0}`, and
  `1 ≤ 1 · (0 + 1 · 1/2)` fails; no walk leads from `0` to `1`, although `(2 − 1) · 0 < 1`.
- The strict inequality is needed: on `K₄`, `m = 1` gives `3 · (1/3) = 1`, and no walk of length
  `1` leads from a vertex to itself; `m = 2` gives `1/3 < 1`, and `(A²)_(v w) ∈ {2, 3}`.
- The Petersen graph (`λ = 2/3`, `n = 10`): `9 (2/3)ᵐ < 1` exactly when `9 · 2ᵐ < 3ᵐ`, first at
  `m = 6` (`576 < 729`); any two vertices are joined by a walk of length exactly `6`.

*Needs:* 1.1, 2.1; Mathlib `Finset.sum_mul_sq_le_sq_mul_sq`, `SimpleGraph.diam`.

### Examples

- For a connected non-bipartite `(q + 1)`-regular Ramanujan graph (1.2), with `d = q + 1` and
  `λ = 2√(d − 1)/d`: a walk stays in a set of density `μ` for `t` steps with proportion at most
  `μ (μ + (2√(d − 1)/d)(1 − μ))ᵗ`; the Chernoff exponent is `ε² (1 − 2√(d − 1)/d) k/36`; small
  sets have `|N(S)|/|S|` close to `d²/(4(d − 1))`; and `(n − 1)(2√(d − 1)/d)ᵐ < 1` gives walks
  of length `m` between any two vertices.
- The Petersen graph with `μ = 1/2`: each step of the hitting bound costs the factor `5/6`.

### Dependencies

Layer 1 (1.1 in every route; 1.2 in the Examples); ExpanderConstructions 1.1–1.2 (copied) and
4.1 (in an Example and a Check); Mathlib's exponential and logarithm bounds, Cauchy–Schwarz and
`Fin.cons`.

## Layer 3: distance and decoding of spectral Tanner codes

### 3.1 The sharp bipartite mixing lemma and the distance bound

Prove `abs_card_edges_sub_le_sqrt`: for a bijective `R : V × P → U × P` and `S ⊆ U`, `T ⊆ V`,
the number `e(S, T)` of right ports `(v, j)` with `v ∈ T` and `(R (v, j)).1 ∈ S` satisfies

    |e(S, T) − D |S| |T| / n| ≤ σ₂ √(|S| (1 − |S|/n) |T| (1 − |T|/n)).

ExpanderCodes 1.2 (`abs_card_edges_sub_le`) states the bound with `√(|S| |T|)`; the factors
`(1 − |S|/n)(1 − |T|/n)` are those of the mixing lemma for simple regular graphs
(SpectralGraphBounds 4.1). (Proved here.)

Route: if `D = 0`, bijectivity forces `U × P` and `V × P` empty, `e = 0` and the matrix is `0`.
Let `D ≥ 1`, so `Fintype.card V = n`, and let `B = biadjMatrix R`, whose rows and columns all sum
to `D`. Write `𝟙_S = (|S|/n) 𝟙 + x` and `𝟙_T = (|T|/n) 𝟙 + y` with `x ⊥ 𝟙`, `y ⊥ 𝟙`. Since
`B 𝟙 = D 𝟙` and `𝟙ᵀ B = D 𝟙ᵀ`, `e(S, T) − D|S||T|/n = xᵀ B y = ⟨Bᵀ x, y⟩`, and
`‖x‖² = |S|(1 − |S|/n)`, `‖y‖² = |T|(1 − |T|/n)`. The bound `‖Bᵀ x‖ ≤ σ₂ ‖x‖` for `x ⊥ 𝟙` is an
item of the API of ExpanderCodes 1.1, stated there in prose; its short proof: `B Bᵀ` has `𝟙/√n`
as an eigenvector for its largest eigenvalue `D²`, so an orthonormal eigenbasis of `B Bᵀ` sorted
by nonincreasing eigenvalue may start with it; the eigenvalue at index `1` is `σ₂²` (Tau Ceti
`LinearMap.singularValues_adjoint` and
`LinearMap.sq_singularValues_eq_of_adjoint_comp_self_eigenbasis`), and `x` lies in the span of
the other vectors, where
`LinearMap.norm_apply_le_of_mem_spanIndices_of_adjoint_comp_self_eigenbasis` gives the bound.

Prove `mul_le_one_sub_mul_hammingNorm`: let `R` be bijective, `0 ≤ δ₀`, every nonzero word of
`C₀` of weight at least `δ₀ D`, `σ₂ ≤ ε D` and `ε ≤ 1`. Then every nonzero word `x` of the Tanner
code satisfies

    δ₀ (δ₀ − ε) D n ≤ (1 − ε) |x|,

so for `ε < 1` its relative weight is at least `δ₀(δ₀ − ε)/(1 − ε)`. This improves the bound
`δ₀(δ₀ − ε)` of ExpanderCodes 3.1 (`mul_le_hammingNorm_of_mem_tannerCode`) by the factor
`1/(1 − ε)` and is attained on the double cover of `K₄`. (Proved here: among the sources read,
the proof of Spielman's Theorem 29.4.1, pp. 239–240, gives `δ₀(δ₀ − ε)`, and the theorem states
`δ₀²/2` for `ε ≤ δ₀/2`.)

Route: let `F` be the set of edges where `x ≠ 0`, `S` the left and `T` the right vertices that
meet `F`; `S` and `T` are nonempty, and `D ≥ 1`, so `ε ≥ 0` because `0 ≤ σ₂ ≤ εD`. Put
`a = |S|/n`, `b = |T|/n` and `f = |F|/(Dn)`.

- Each vertex of `S` and of `T` sees a nonzero word of `C₀` (membership in `tannerCode`), so it
  meets at least `δ₀ D` edges of `F`; as `R` is bijective, `f ≥ δ₀ a` and `f ≥ δ₀ b`, hence
  `f ≥ δ₀ g` with `g = √(ab) > 0`.
- Every edge of `F` joins `S` to `T`, so `|F| ≤ e(S, T)`, and the first statement gives
  `f ≤ ab + ε √(a(1 − a) b(1 − b))`.
- `(1 − a)(1 − b) ≤ (1 − g)²`, since this is `a + b ≥ 2g`, and `g ≤ 1`; so `f ≤ g² + ε g (1 − g)`.
- From `δ₀ g ≤ f ≤ g² + ε g (1 − g)` and `g > 0`: `δ₀ ≤ g (1 − ε) + ε`, that is
  `(1 − ε) g ≥ δ₀ − ε`. Then `(1 − ε) f ≥ δ₀ (1 − ε) g ≥ δ₀ (δ₀ − ε)`, using `1 − ε ≥ 0` and
  `δ₀ ≥ 0`; multiply by `Dn`.

**Checks.**

- The double cover of `K₄` (`D = 3`, `n = 4`, `σ₂ = 1`, ExpanderCodes 1.1) with `S = T` two
  vertices: `e = 2` and `|2 − 3| = 1 = 1 · √(2 · (1/2) · 2 · (1/2))`, an equality, while the
  bound of ExpanderCodes 1.2 is `2`.
- Equality in the distance bound: the same graph with the binary even-weight code of length `3`
  (`δ₀ = 2/3`, `ε = 1/3`) gives `(2/3)(1/3) · 12 / (2/3) = 4`, the least weight of a nonzero word
  of this Tanner code (dimension `5`), where ExpanderCodes 3.1 gives `8/3`. On the double cover of
  `K₅` with the even-weight code of length `4` (`δ₀ = 1/2`, `ε = 1/4`) the bound is `10/3`
  against `5/2`, and the least weight is `4`.
- `ε ≤ 1` is needed: on `K_(2,2)` (`σ₂ = 0`) with `C₀ = F₂²` (`δ₀ = 1/2`) and `ε = 2`, the word
  equal to `1` on all four edges gives `(1/2)(1/2 − 2) · 4 = −3 > (1 − 2) · 4 = −4`.
- `δ₀ ≥ 0` is needed: on one edge (`n = D = 1`, `σ₂ = 0`, `ε = 0`) with `C₀ = F`, `δ₀ = −2`
  satisfies the hypothesis on `C₀` and gives `4 > 1`.
- Bijectivity is needed (as in ExpanderCodes 3.1): with no right vertex, three left vertices and
  the repetition code of length `2` (`δ₀ = 1`, `σ₂ = 0`, `ε = 0`), a word equal to `1` on the two
  edges of one left vertex lies in the Tanner code and has weight `2 < 6`.

*Needs:* ExpanderCodes 1.1 (`biadjMatrix`, `secondSingularValue`, copied) and 2.1
(`tannerCode`, copied); ExpanderCodes 1.2 and 3.1 for comparison; Tau Ceti
`LinearMap.singularValues_adjoint`,
`LinearMap.sq_singularValues_eq_of_adjoint_comp_self_eigenbasis`,
`LinearMap.norm_apply_le_of_mem_spanIndices_of_adjoint_comp_self_eigenbasis`; Mathlib
`abs_real_inner_le_norm`, `hammingNorm`.

### 3.2 Decoding

Let `R : V × P ≃ U × P` be a bijection and `g : (P → F) → (P → F)` a map on inner words. Define
`leftCorrection g x`, which replaces the word `i ↦ x (u, i)` at every left vertex `u` by its image
under `g`; `rightCorrection R g x`, which does the same with the word `j ↦ x (R (v, j))` at every
right vertex `v`; and `alternatingCorrection R g m`, the composite of `m` corrections, at the left
vertices first and then alternately. These are maps between sets of words, used to state a
theorem about their iterates; no procedure or running time is a target.

Prove `alternatingCorrection_eq`: let `δ₀ > 0`, `σ₂(R) ≤ ε D`, `ε ≤ δ₀/3`, and let `g` satisfy
`g w = c₀` for every `c₀ ∈ C₀` and every `w` with `2 d(w, c₀) < δ₀ D`. Let `c` be a word of the
Tanner code and `y` a word with `d(y, c) ≤ δ₀² D n / 18`. Then for every `j` with
`(3/4)ʲ δ₀ n / 9 < 1` and every `m ≥ j + 1`, `alternatingCorrection R g m y = c` (Spielman,
*Spectral and Algebraic Graph Theory*, §29.5, p. 240, Lemma 29.5.2 and Theorem 29.5.3, p. 241,
with the corrections below).

Two points of the source are corrected. Spielman's local decoder outputs `c₀` whenever
`dist(c₀, r) ≤ δ₀ d/2`; at equality this cannot hold for the repetition code of length `2`, so the
radius here is strict. And the step from a correction at the right to one at the left applies
the edge-set lemma with the sides exchanged, which needs `σ₂(R⁻¹) = σ₂(R)`. The statement asks
nothing of the weights of `C₀`: only `g` enters. (Proved here, after Spielman.)

Route. If `D = 0`, `U × P` is empty and every word equals `c`. Let `D ≥ 1`, so
`Fintype.card V = n`.

- A vertex where a correction leaves an error saw a word at distance at least `δ₀D/2` from the
  word of `c` there, which lies in `C₀`; otherwise `g` returns that word.
- First correction: the left vertices `S₁` with an error afterwards each carry at least `δ₀D/2`
  errors of `y`, and these sets of edges are disjoint, so `|S₁| δ₀ D/2 ≤ δ₀² D n/18`, that is
  `|S₁| ≤ δ₀ n/9`.
- A correction at the right, after one at the left whose errors meet the left vertices `S`: the
  right vertices with an error afterwards carry at least `δ₀D/2` erroneous edges, all with left
  end in `S`; ExpanderCodes 3.2 `card_le_of_card_image_fst_le` (with `[Nonempty P]` from
  `D ≥ 1` and classical decidable equality on `P`) bounds their number by `(3/4)|S|`, as long
  as `|S| ≤ δ₀ n/9`.
- A correction at the left, after one at the right whose errors meet the right vertices `T`: the
  same lemma for the reversed graph `⇑R.symm : U × P → V × P`, with the set of erroneous edges
  mapped by `R.symm`, bounds the left vertices with an error afterwards by `(3/4)|T|`. Its
  hypothesis holds because the biadjacency matrix of `⇑R.symm` is the transpose of that of `⇑R`,
  and a matrix and its transpose have the same singular values (Mathlib
  `Matrix.toEuclideanLin_conjTranspose_eq_adjoint`, Tau Ceti `LinearMap.singularValues_adjoint`).
- By induction, after `j + 1` corrections the vertices with an error on the side just corrected
  number at most `(3/4)ʲ δ₀ n/9 < 1`, so there are none; every edge has an end on that side, so
  the word is `c`. The word `c` is fixed by both corrections (its local words lie in `C₀` and are
  at distance `0 < δ₀ D/2` from themselves), so it stays `c`.

**Checks.**

- The strict radius: for the binary repetition code of length `2` (`δ₀ = 1`, `D = 2`), the
  hypothesis with `≤` would ask `g (1, 0) = (0, 0)` and `g (1, 0) = (1, 1)`; the strict one is met
  by `g` returning the nearest codeword at distance `< 1` and leaving other words unchanged.
- `δ₀ > 0` is needed: with `δ₀ = 0` on one edge (`n = D = 1`, `σ₂ = 0`, `ε = 0`), `C₀ = F₂`,
  `c = y = 0` and `g` constantly `1`, every hypothesis holds (the one on `g` is empty), `j = 0`
  satisfies `0 < 1`, and one correction gives the word `1 ≠ c`.
- Two corrections are needed: the double cover of `K₉` (`D = 8`, `n = 9`, `σ₂ = 1`,
  `ε = 1/8 ≤ 1/3`) with the binary repetition code of length `8` (`δ₀ = 1`, radius `4`), and `g`
  the nearest codeword when it is at distance `< 4`, the identity otherwise. Four errors at one
  left vertex are left unchanged by the first correction and removed by the second. The theorem
  gives `j = 1`. Over all `1 091 059` error patterns of weight at most `4`, with this `g` and with
  the `g` that sends the words of weight `4` to `(1, …, 1)`, two corrections always suffice.
- Three corrections are needed: `n = 18`, `D = 36`, the biadjacency matrix `B = 2J + E` with
  `B u₁ v₀ = B u₂ v₀ = 9`, compensated by `−1` at `14` other entries of column `v₀`, by `−1` at
  `7` common columns of rows `u₁, u₂`, and by `+1` at `14` entries of the crossing of those rows
  and columns, so that each of the `14` rows gains one and each of the `7` columns two. Since
  `E` has zero row and column sums, the singular values of `B` other than `36` are those of `E`,
  and `E Eᵀ (E Eᵀ − 2)(E Eᵀ − 128) = 0`, so `σ₂ = 8√2 ≤ 12 = D/3`. With the repetition code of
  length `36` (radius `36`), the errors on the
  `9` edges from each of `u₁, u₂` to `v₀` and on `9` more edges at each of `u₁, u₂` leave weights
  `36, 18, 0` after one, two and three corrections (with `g` the identity outside the radius);
  the theorem gives `j = 3`.

*Needs:* ExpanderCodes 1.1 and 2.1 (copied) and 3.2 `card_le_of_card_image_fst_le`; Mathlib
`Matrix.toEuclideanLin_conjTranspose_eq_adjoint`, `hammingDist`, `Equiv.bijective`; Tau Ceti
`LinearMap.singularValues_adjoint`.

### Examples

- With a bipartite `(q + 1)`-regular Ramanujan graph (1.2, `σ₂ ≤ 2√q`), `ε = 2√q/(q + 1)`: 3.1
  gives relative distance at least `δ₀(δ₀ − ε)/(1 − ε)`, and 3.2 applies as soon as
  `2√q/(q + 1) ≤ δ₀/3`; for `δ₀ = 1/2` this is `12√(D − 1) ≤ D`, true for `D ≥ 143`.
- On the double covers of the zig-zag family of ExpanderCodes 4.1 (`ε ≤ 1/2`), 3.1 gives
  relative distance at least `2δ₀(δ₀ − 1/2)`.

### Dependencies

ExpanderCodes 1.1, 1.2 (comparison), 2.1, 3.1 (comparison), 3.2 and 4.1 (an Example); Layer 1
(1.2) in the Examples; Tau Ceti singular values; Mathlib's Hamming distance.

## Scope and ownership

This roadmap is built on five others and restates none of their theorems. It works with the
rotation maps and the spectral parameter of ExpanderConstructions (1.1–1.3), the bipartite
multigraphs, second singular value, Tanner codes, distance bound and edge-set lemma of
ExpanderCodes (1.1–1.4, 2.1, 3.1, 3.2), the sorted adjacency eigenvalues of SpectralGraphBounds
(1.1, 1.3) and the Ramanujan property of IharaZetaFunction (5.3). From GraphSpectra, by another
contributor, it uses the index of a regular graph and Perron–Frobenius for connected graphs (3.2),
the spectral criterion for bipartite regular graphs (3.7) and the spectra of the Petersen graph and
the hypercubes (2.6), which give the exact values in the Checks. GraphSpectra names expander
graphs among its downstream consumers and leaves expansion to other roadmaps; this roadmap is
meant as one such consumer, and states nothing about the spectra of graphs as such.

Owned here: the passage from the Ramanujan property to `λ` and to `σ₂` (1.2);
walks on rotation maps, the hitting bounds, Healy's Chernoff bound, Tanner's neighbourhood bound
and Chung's bound (Layer 2); the bipartite mixing lemma with the factors `(1 − s/n)(1 − t/n)`,
the distance bound with the factor `1/(1 − ε)` and the decoding theorem (Layer 3).

Left to other roadmaps:

- ExpanderConstructions owns powers, tensor, zig-zag and replacement products and the explicit
  family; they are used only in Examples. Its scope leaves out the expander mixing lemma for
  multigraphs; the first statement of 3.1, applied to the double cover (ExpanderCodes 1.4), gives
  it, and it is not stated separately.
- SpectralGraphBounds owns the expander mixing lemma for simple regular graphs (4.1), Hoffman's
  bounds and the Alon–Boppana bound (5.2), which shows that `2√(d − 1)/d` cannot be improved for
  large graphs. The independence bound `α ≤ λ n/(d + λ)` and the case `S = T` of the mixing lemma
  follow from its 4.1 and are not stated.
- ExpanderCodes owns the rate and the distance bound `δ₀(δ₀ − ε)`, the weak bipartite mixing
  lemma, the edge-set lemma and the codes on the zig-zag family.
- IharaZetaFunction owns the equivalence of the Ramanujan property with the Riemann hypothesis
  for the Ihara zeta function.
- GraphSpectra owns Perron–Frobenius for graphs, the bipartiteness criterion and the spectra of
  the standard graphs.
- MarkovChainMixing bounds the error of time averages of a reversible chain through Chebyshev's
  inequality (its 6.4); 2.3 is an exponential bound for the walk of a regular multigraph.

Not treated here: constructions and existence of Ramanujan graphs, interlacing families,
two-lifts and the Kesten–McKay law; the converse of the mixing lemma (Bilu–Linial); lossless
expanders and unique-neighbour codes (spectral bounds cannot certify vertex expansion above
`d/2`: Hoory–Linial–Wigderson, Theorem 4.14 and the paragraph after it, p. 477); the optimal
constant in the Chernoff bound for walks; large deviation principles for walks (the bounds of
Layer 2 are inequalities at finite `k`); matrix Chernoff bounds and the Alon–Roichman theorem;
sparse counting lemmas and Hamiltonicity of pseudo-random graphs; walks with a different graph at
each step; extractors and every procedure, encoder or running time.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Analysis/InnerProductSpace/Rayleigh.lean`:
  `ContinuousLinearMap.norm_eq_iSup_rayleighQuotient` (for a symmetric `T`, `‖T‖` is the
  supremum of `|rayleighQuotient|`); used in 1.1.
- `Mathlib/Analysis/InnerProductSpace/PiL2.lean`: `Matrix.toEuclideanLin`.
  `Mathlib/Analysis/InnerProductSpace/Adjoint.lean`:
  `Matrix.toEuclideanLin_conjTranspose_eq_adjoint`; used in 3.2.
- `Mathlib/Analysis/InnerProductSpace/SingularValues.lean`: `LinearMap.singularValues` (indexed
  from `0`, nonincreasing, `0` beyond the dimension of the source),
  `LinearMap.singularValues_nonneg`, `LinearMap.singularValues_of_finrank_le`; used in 1.2.
- `Mathlib/Analysis/Matrix/Spectrum.lean`: `Matrix.IsHermitian.eigenvalues₀` (sorted, index `0`
  the largest) and `Matrix.IsHermitian.eigenvalues` (defined as `eigenvalues₀` along
  `Fintype.equivOfCardEq`); used in 1.2.
- `Mathlib/Combinatorics/SimpleGraph/AdjMatrix.lean`: `SimpleGraph.adjMatrix`;
  `Mathlib/Combinatorics/SimpleGraph/Connectivity/Connected.lean`: `SimpleGraph.Connected`;
  `Mathlib/Combinatorics/SimpleGraph/Bipartite.lean`: `SimpleGraph.IsBipartite`;
  `Mathlib/Combinatorics/SimpleGraph/Diam.lean`: `SimpleGraph.diam`.
- `Mathlib/InformationTheory/Hamming.lean`: `hammingNorm`, `hammingDist`.
- `Mathlib/Analysis/Complex/Exponential.lean`: `Real.exp_bound'` (for `0 ≤ x ≤ 1` and `n ≥ 1`,
  `e^x` is at most the Taylor sum of order `n − 1` plus `xⁿ (n + 1)/(n! n)`; with `n = 2`,
  `e^x ≤ 1 + x + 3x²/4`) and `Real.add_one_le_exp`; used in 2.3.
  `Mathlib/Analysis/SpecialFunctions/Log/Basic.lean`: `Real.log_le_sub_one_of_pos`; used in 2.3.
- `Mathlib/Algebra/Order/BigOperators/Ring/Finset.lean`: `Finset.sum_mul_sq_le_sq_mul_sq`
  (Cauchy–Schwarz for finite sums); `Mathlib/Analysis/InnerProductSpace/Basic.lean`:
  `abs_real_inner_le_norm`; used in 2.2, 2.4, 3.1.
- `Mathlib/Data/Matrix/Mul.lean`: `Matrix.dotProduct_mulVec`. `Mathlib/Data/Fin/Tuple/Basic.lean`:
  `Fin.cons`, `Fin.tail`. `Function.Involutive.bijective`, `Equiv.bijective`.

### From Tau Ceti

- `TauCeti/InformationTheory/Coding/Basic.lean`: `TauCeti.LinearCode F ι`, a subspace of
  `ι → F`. Imported by `Suggested.lean`.
- `TauCeti/Analysis/InnerProductSpace/SingularValues.lean`: `LinearMap.singularValues_adjoint`
  (a map and its adjoint have the same singular values), used in 1.2, 3.1, 3.2;
  `LinearMap.sq_singularValues_eq_of_adjoint_comp_self_eigenbasis` and
  `LinearMap.norm_apply_le_of_mem_spanIndices_of_adjoint_comp_self_eigenbasis`, used in 3.1.

### From TauCetiRoadmap.ExpanderConstructions

- 1.1 and 1.2: `adjCount`, `normAdj`, `secondEigenvalue`, copied verbatim; the API items of 1.1
  (symmetry and row sums of `adjCount`) and of 1.2 (the contraction on sum-zero vectors), stated
  there in prose, are cited in 1.1 here with their short proofs.
- 1.3 `TauCetiRoadmap.ExpanderConstructions.card_mul_secondEigenvalue_eq` (`G` simple,
  `adjCount R = G.adjMatrix ℝ`, `2 ≤ Fintype.card V`: `d λ(R) = max(|θ₂|, |θₙ|)`); used in 1.2.
- 2.1 `rotationPower` (a Check of 2.1) and 4.1 `zigZagFamily_spec` (`λ ≤ 1/2` for the explicit
  family; Examples and a Check of 2.3).

### From TauCetiRoadmap.ExpanderCodes

- 1.1 `biadjMatrix`, `secondSingularValue` and 2.1 `tannerCode`, copied verbatim; the API item of
  1.1 (`‖Bᵀ x‖ ≤ σ₂ ‖x‖` for `x ⊥ 𝟙`), stated there in prose, is proved in 3.1 here.
- 1.3 `TauCetiRoadmap.ExpanderCodes.secondSingularValue_eq_adjEigenvalues` (no edge inside
  either side, `biadjMatrix R u v = G.adjMatrix ℝ (inl u) (inr v)`, `2 ≤ Fintype.card U`:
  `σ₂ = θ₂`); used in 1.2.
- 1.2 `abs_card_edges_sub_le` and 3.1 `mul_le_hammingNorm_of_mem_tannerCode`, for comparison in
  3.1; 1.4 `TauCetiRoadmap.ExpanderCodes.secondSingularValue_eq_card_mul_secondEigenvalue`
  (double covers), in the
  Conventions and Scope.
- 3.2 `TauCetiRoadmap.ExpanderCodes.card_le_of_card_image_fst_le` (`[DecidableEq P]`,
  `[Nonempty P]`, bijective `R`, `0 < δ₀`, `σ₂ ≤ ε D`, `ε ≤ δ₀/3`, a set `F` of edges whose left
  ends number at most `δ₀ n/9`: at most `(3/4)` of that number of right vertices carry at least
  `δ₀ D/2` edges of `F`); used in 3.2 for `⇑R` and for `⇑R.symm`.
- 4.1 `TauCetiRoadmap.ExpanderCodes.tannerCode_zigZagFamily` (an Example of 3.1).

### From TauCetiRoadmap.SpectralGraphBounds

- 1.1 `adjEigenvalues`, `largestEigenvalue`, `smallestEigenvalue` (through GraphSpectra, which
  copies them); 1.3 `TauCetiRoadmap.SpectralGraphBounds.abs_adjEigenvalues_le` (`[Nonempty V]`:
  `|θᵢ| ≤ θ₁`); used in 1.2.

### From TauCetiRoadmap.GraphSpectra

- 3.2 `TauCetiRoadmap.GraphSpectra.SimpleGraph.IsRegularOfDegree.largestEigenvalue_eq`
  (`[Nonempty V]`, `k`-regular: `θ₁ = k`) and
  `TauCetiRoadmap.GraphSpectra.SimpleGraph.Connected.perronFrobenius` (`[Nonempty V]`, connected:
  `θ₁` occurs once in the spectrum and has a positive eigenvector); used in 1.2.
- 3.7 `TauCetiRoadmap.GraphSpectra.SimpleGraph.Connected.isBipartite_iff_smallestEigenvalue_eq`
  (`[Nonempty V]`, connected, `k`-regular: bipartite exactly when `θₙ = −k`); used in 1.2.
- 2.6 `adjSpectrum_petersenGraph` and `adjSpectrum_hypercube`; used in the Checks of 1.2.

### From TauCetiRoadmap.IharaZetaFunction

- 5.3 `IsRamanujan`, copied verbatim; used in 1.2.

## References

- Fan R. K. Chung, *Diameters and eigenvalues*, J. Amer. Math. Soc. 2 (1989), 187–196 (open
  archive of the AMS): Theorem 1, p. 188, with proof pp. 188–189.
- Alexander Healy, *Randomness-efficient sampling within NC¹*, Electronic Colloquium on
  Computational Complexity, Report TR06-058, revision 1 (2006): Theorem 1, p. 3, restated p. 13;
  §6 with (1)–(3), p. 14; Lemma 15 and Lemma 16, pp. 15–16; Remark 17, p. 16.
- Shlomo Hoory, Nathan Linial and Avi Wigderson, *Expander graphs and their applications*, Bull.
  Amer. Math. Soc. 43 (2006), 439–561; the copy on Nathan Linial's page, with the journal's page
  numbers: §2.4, p. 455; Theorem 3.6 and Lemmas 3.7–3.8, p. 462; Theorems 3.10 and 3.11 and the
  remark after them, pp. 463–464; Theorems 4.14 and 4.15, p. 477, with the proof of 4.15, p. 478.
- Daniel A. Spielman, *Spectral and Algebraic Graph Theory*, draft of April 2, 2025, on the
  author's page: Theorem 29.4.1 and its proof, pp. 239–240; §29.5, p. 240; Lemma 29.5.1,
  pp. 240–241; Lemma 29.5.2 and Theorem 29.5.3, p. 241.
- Salil P. Vadhan, *Pseudorandomness*, Chapter 4, *Expander graphs* (author's copy, with the
  printed page numbers): Theorem 4.17, p. 93; Claim 4.21, p. 97; the end of the proof of
  Theorem 4.17, p. 98.

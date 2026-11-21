# Roadmap: Paley graphs and character sums

**Summary.** Let `F` be a finite field with `q` elements, `q ≡ 1 (mod 4)`. The Paley graph of `F`
has the elements of `F` as vertices, two of them adjacent when their difference is a nonzero
square; since `−1` is a square, the relation is symmetric. Through the quadratic character `η` of
`F`, every combinatorial count on this graph becomes a character sum, and the roadmap turns the
evaluations and bounds of such sums into theorems about the graph. Here `q` may be any prime
power, not only a prime. The statements on the graph below assume `q ≡ 1 (mod 4)`; the count of
Layer 4 needs only odd characteristic.

The headline theorems are these.

- *Spectrum.* The Paley graph is strongly regular with parameters
  `(q, (q − 1)/2, (q − 5)/4, (q − 1)/4)`. For `a ≠ 0` the additive character `x ↦ ψ(ax)` is an
  eigenvector with eigenvalue `(η(a) σ √q − 1)/2`, where `ψ` is the canonical additive character
  and `σ = ±1` is the sign of the quadratic Gauss sum, explicit in `p` and `f` for `q = p^f`. So
  the eigenvalues are `(q − 1)/2` once and `(±√q − 1)/2`, each `(q − 1)/2` times.
- *Cliques and edge distribution.* Multiplication by a non-square is an isomorphism onto the
  complement. The clique and independence numbers are at most `√q`, with equality when `q` is a
  square. For all sets `S`, `T` of vertices the number of ordered adjacent pairs in `S × T`
  differs from `|S||T|/2` by at most `(√q + 2)√(|S||T|)/2`.
- *Extension property.* If `q > n² 4^(n−1)`, then for disjoint sets `A`, `B` of at most `n`
  vertices in all, some vertex outside `A ∪ B` is adjacent to all of `A` and to none of `B`;
  hence every graph on at most `n + 1` vertices is an induced subgraph. For the Paley tournament
  of any finite field, with an arc `x → y` when `y − x` is a nonzero square (a tournament exactly
  when `q ≡ 3 (mod 4)`), the same threshold gives a vertex outside `A ∪ B` with an arc to every
  vertex of `A` and an arc from every vertex of `B`.

The roadmap is a bridge. CharacterSumsOverFiniteFields supplies the canonical additive character,
the sign of the quadratic Gauss sum and Weil's bound for multiplicative character sums.
StronglyRegularAndMooreGraphs supplies the spectrum and multiplicities of a strongly regular graph,
and SpectralGraphBounds the sorted adjacency eigenvalues, Hoffman's ratio bound and the expander
mixing lemma. Mathlib supplies the quadratic character, Gauss and Jacobi sums, and strongly
regular graphs.

Layer 1 defines the graph, proves strong regularity and its two symmetry properties. Layer 2
computes the spectrum, by characters and by strong regularity. Layer 3 derives the clique,
independence and discrepancy bounds from Layers 1 and 2. Layer 4 proves an estimate for the number
of points with prescribed quadratic-character values at `n` given points, from Weil's bound, and
deduces the extension properties.

## Conventions

- **Carrier.** `F` is a finite field, `[Field F] [Finite F] [DecidableEq F]`, with
  `q = Nat.card F` and characteristic `p`, read as a `Fintype` through `Fintype.ofFinite` (any two
  `Fintype` structures on `F` are equal); the sorted eigenvalues are indexed by
  `Fin (Fintype.card F)`. Every prime power is the cardinality of such a field,
  so the roadmap is stated for `F` and not for `q`. Where the sign of a Gauss sum enters, `q = p^f`
  with `p` prime is a hypothesis (`[Fact p.Prime]`, `Nat.card F = p ^ f`). The condition
  `q ≡ 1 (mod 4)` is the hypothesis `Nat.card F % 4 = 1`.
- **The graph.** `paleyGraph F` is Mathlib's `SimpleGraph.fromRel` of the relation
  "`x − y` is a square": distinct `x`, `y` are adjacent when `x − y` or `y − x` is a square. This
  needs no hypothesis to be a graph. When `q ≡ 1 (mod 4)`, `−1` is a square
  (`FiniteField.isSquare_neg_one_iff`), so `x ~ y` if and only if `x ≠ y` and `x − y` is a square.
  For every other finite field one of `x − y`, `y − x` is always a square, and `paleyGraph F` is
  the complete graph; each statement below that assumes `q ≡ 1 (mod 4)` has a Check showing that
  it fails for one of these complete graphs.
- **Characters.** `η = quadraticChar F`, Mathlib's quadratic character with values in `ℤ`:
  `η(0) = 0`, `η(x) = 1` for nonzero squares and `−1` otherwise, when `p ≠ 2`. The canonical
  additive character `stdAddChar F`, `ψ(x) = e(Tr(x)/p)` with `e(t) = exp(2πit)` and `Tr` the trace
  to the prime field, is copied verbatim from CharacterSumsOverFiniteFields 0.1. The quadratic Gauss
  sum is `g = ∑_x η(x) ψ(x)`.
- **Eigenvalues.** As in SpectralGraphBounds: `adjEigenvalues G`, copied verbatim from its 1.1,
  lists the eigenvalues of the real adjacency matrix `G.adjMatrix ℝ` with multiplicity in
  nonincreasing order, index `0` carrying the largest; the prose writes `λ₁ ≥ ⋯ ≥ λ_q`.
- **Edges between sets.** `e(S, T)` is the number of ordered pairs `(u, v) ∈ S × T` with `u ~ v`,
  the cardinality of Mathlib's `G.interedges S T`; an edge inside `S ∩ T` counts twice.
- **Extension.** For a graph, a vertex `z` is correctly joined to disjoint sets `A`, `B` when
  `z ∉ A ∪ B`, `z` is adjacent to every vertex of `A` and to no vertex of `B`. A graph is
  `n`-existentially closed (`n`-e.c.) when every such pair with `|A| + |B| ≤ n` has a correctly
  joined vertex (Bonato, §1, p. 1, requires `|A ∪ B| = n`; the two forms agree on graphs with at
  least `n` vertices, by enlarging `B`). The statements below write this property out and define
  no predicate for it. For a digraph, `z` is correctly joined when `z ∉ A ∪ B`, there is an arc
  from `z` to every vertex of `A` and an arc from every vertex of `B` to `z`.
- **Arithmetic.** Natural-number division in the parameters is exact under `q ≡ 1 (mod 4)`,
  which forces `q ≥ 5`. The threshold `n² 4^(n−1)` uses natural-number subtraction, so it is `0`
  for `n = 0`; it is Bonato's `n² 2^(2n−2)`.

## Layer 1: the Paley graph

### 1.1 Definition

Define `paleyGraph F` as in the Conventions, with the instance `instDecidableRelPaleyGraphAdj`
deciding adjacency (squares in a finite field are decidable). Its API:

- For `q ≡ 1 (mod 4)`, `x ~ y` if and only if `x ≠ y` and `η(x − y) = 1`
  (`quadraticChar_one_iff_isSquare`); and if and only if `x ≠ y` and `η(y − x) = 1`.
- Translations `x ↦ x + b` and multiplications `x ↦ s x` by a nonzero square `s` are
  automorphisms, for every finite field.

**Checks.**
- Over `𝔽₅` the nonzero squares are `1, 4`, and the Paley graph is the 5-cycle
  `0 ~ 1 ~ 2 ~ 3 ~ 4 ~ 0`.
- Over `𝔽₁₃` the neighbours of `0` are `1, 3, 4, 9, 10, 12`.
- Over `𝔽₉ = 𝔽₃[i]`, `i² = −1`, the nonzero squares are `±1, ±i`, and the graph is the `3 × 3`
  grid: `a + bi ~ a′ + b′i` exactly when `a = a′` or `b = b′`, but not both.
- Over `𝔽₃` and `𝔽₇` the graph is complete: `2 = −1` is not a square in `𝔽₃`, but `1` is, so
  `0 ~ 1 ~ 2 ~ 0`. The unsymmetrised relation "`x − y` is a nonzero square" is not symmetric
  there (`1 − 0` is a square in `𝔽₃`, `0 − 1` is not), which is why the definition symmetrises.

*Needs:* Mathlib `SimpleGraph.fromRel`, `FiniteField.isSquare_neg_one_iff`,
`quadraticChar_one_iff_isSquare`. (Bonato, §3, p. 6; Brouwer–Haemers, §9.1, Example (v), p. 113;
Zhao, Definition 3.3.5, p. 108, for prime `q`.)

### 1.2 Strong regularity

Prove `paleyGraph_isSRGWith`: if `q ≡ 1 (mod 4)`, the Paley graph satisfies
`IsSRGWith q ((q − 1)/2) ((q − 5)/4) ((q − 1)/4)` (Brouwer–Haemers, Proposition 9.1.1, p. 114,
with proof; Bonato, Theorem 3 (1), p. 6, without proof).

Route: the degree of `x` is the number of nonzero squares, `(q − 1)/2`, since `∑_y η(y) = 0`
(`quadraticChar_sum_zero`) and `η` takes only the values `±1` off `0`. For distinct `x`, `y`, the
number of common neighbours is `(1/4) ∑_{z ≠ x, y} (1 + η(z − x))(1 + η(z − y))`. The two linear
sums are `−η(y − x)` and `−η(x − y)`, equal since `η(−1) = 1`. The quadratic sum
`∑_z η(z − x) η(z − y)`, after `z = x + (y − x)w`, is `η(−1) ∑_w η(w) η(1 − w)`, Mathlib's
`jacobiSum η η`, and `η⁻¹ = η` (`MulChar.IsQuadratic.inv`, `quadraticChar_isQuadratic`), so
`jacobiSum_nontrivial_inv` (with `quadraticChar_ne_one`) gives `−η(−1) = −1`. Hence the count is
`(q − 3 − 2η(x − y))/4`: `(q − 5)/4` for adjacent and `(q − 1)/4` for nonadjacent pairs.

**Checks.**
- `q = 5`: `IsSRGWith 5 2 0 1`, the pentagon. `q = 9`: `IsSRGWith 9 4 1 2`, the `3 × 3` grid.
  `q = 13`: `IsSRGWith 13 6 2 3`. StronglyRegularAndMooreGraphs 1.4 uses these three graphs as
  examples of conference graphs.
- Computed directly for `q = 17, 25, 29, 49, 81`: the parameters are `(17, 8, 3, 4)`,
  `(25, 12, 5, 6)`, `(29, 14, 6, 7)`, `(49, 24, 11, 12)`, `(81, 40, 19, 20)`.
- `q ≡ 1 (mod 4)` is needed: over `𝔽₃` the graph is `K₃`, of degree `2`, while the formula gives
  `(3 − 1)/2 = 1`.

*Needs:* 1.1; Mathlib `SimpleGraph.IsSRGWith`, `quadraticChar_sum_zero`, `jacobiSum`,
`jacobiSum_nontrivial_inv`, `MulChar.IsQuadratic.inv`, `quadraticChar_isQuadratic`,
`quadraticChar_ne_one`.

### 1.3 Self-complementarity

Prove `exists_iso_compl_mul`: if `q ≡ 1 (mod 4)` and `c` is not a square, there is an isomorphism
`e` from the Paley graph onto its complement with `e x = c x` for all `x` (Brouwer–Haemers, §9.1,
Example (viii), p. 114; Bonato, Theorem 3 (2), p. 6).

Route: `x ↦ c x` is a bijection since `c ≠ 0`; for `x ≠ y`, `η(c(x − y)) = −η(x − y)`
(`quadraticChar_neg_one_iff_not_isSquare`), so `x ~ y` exactly when `cx` and `cy` are distinct and
nonadjacent, which is adjacency in the complement.

**Checks.**
- Over `𝔽₅` with `c = 2`, the edge `{0, 1}` goes to the non-edge `{0, 2}` and the non-edge `{0, 2}`
  to the edge `{0, 4}`: the pentagon is isomorphic to its complement, another pentagon.
- A non-square exists when `p ≠ 2` (`FiniteField.exists_nonsquare`), so the Paley graph is
  self-complementary; it then has `q(q − 1)/4` edges, half of all pairs: `5` for `q = 5`, `18` for
  `q = 9`.
- `q ≡ 1 (mod 4)` is needed: over `𝔽₇`, `c = 3` is not a square, but the graph is `K₇` and its
  complement has no edges.

*Needs:* 1.1; Mathlib `SimpleGraph.Iso`, `quadraticChar_neg_one_iff_not_isSquare`.

### 1.4 Arc-transitivity

Prove `exists_iso_apply_eq_apply_eq`: for every finite field and all adjacent pairs `u ~ v` and
`u′ ~ v′` there is an automorphism `e` of the Paley graph with `e u = u′` and `e v = v′` (Godsil,
§10.2, p. 101, for `q ≡ 1 (mod 4)`; Bonato, Theorem 3 (3), p. 6, states vertex- and
edge-transitivity).

The statement has no hypothesis on `q`: for `q ≢ 1 (mod 4)` the graph is complete, and any
permutation sending `u, v` to `u′, v′` is an automorphism. For `q ≡ 1 (mod 4)` it is more than
Bonato's statement, since it moves an edge onto another with a prescribed orientation; the route
below proves it.

Route for `q ≡ 1 (mod 4)`: put `s = (v′ − u′)/(v − u)`, a quotient of two nonzero squares, hence a
nonzero square, and `e x = s(x − u) + u′`. It is a composition of the automorphisms of 1.1, and
`e u = u′`, `e v = v′`.

**Checks.**
- Over `𝔽₉` there are `9 · 4 = 36` ordered adjacent pairs and `9 · 4 = 36` maps `x ↦ sx + b` with
  `s` a nonzero square; the route's map is the unique one of this form sending `(u, v)` to
  `(u′, v′)`.
- Over `𝔽₇` the graph is `K₇`, and every permutation of the seven vertices is an automorphism.

*Needs:* 1.1; Mathlib `SimpleGraph.Iso`, `FiniteField.isSquare_neg_one_iff`.

### Examples

The Paley graphs on `5, 9, 13, 17, 25, 29, 49` and `81` vertices and the complete graphs over
`𝔽₃`, `𝔽₇`, `𝔽₄`, with the values in the Checks.

### Dependencies

Mathlib `SimpleGraph.fromRel`, `SimpleGraph.IsSRGWith`, `SimpleGraph.Iso`,
`FiniteField.isSquare_neg_one_iff`, `FiniteField.exists_nonsquare`, `quadraticChar_sum_zero`,
`quadraticChar_one_iff_isSquare`, `quadraticChar_neg_one_iff_not_isSquare`,
`quadraticChar_isQuadratic`, `quadraticChar_ne_one`, `MulChar.IsQuadratic.inv`, `jacobiSum`,
`jacobiSum_nontrivial_inv`. No other roadmap.

## Layer 2: the spectrum

### 2.1 Characters as eigenvectors

Define `paleySign p f`, the integer `(−1)^(f − 1)` when `p % 4 = 1` and `(−1)^(f/2 + 1)`
otherwise. Prove `adjMatrix_mulVec_stdAddChar`: if `q = p^f ≡ 1 (mod 4)` with `p` prime and
`a ≠ 0`, then the function `x ↦ ψ(ax)` is an eigenvector of the complex adjacency matrix of the
Paley graph with eigenvalue `(η(a) σ √q − 1)/2`, `σ = paleySign p f` (Godsil, §10.2, pp. 100–101,
for the eigenvectors; Zhao, Theorem 3.3.8, p. 108, and Theorem 3.3.12, p. 110, for prime `q`; the
sign is Zhao, Remark 3.3.15, p. 111, for prime `q`, and CharacterSumsOverFiniteFields 3.3 for
prime powers). For `a = 0` the constant function has eigenvalue `(q − 1)/2` by regularity
(Mathlib `SimpleGraph.adjMatrix_mulVec_const_apply_of_regular`).

Route: by `SimpleGraph.adjMatrix_mulVec_apply` the value at `x` is the sum of `ψ(ay)` over the
neighbours `y = x − s`, `s` a nonzero square; since `−1` is a square this is
`ψ(ax) ∑_{s ∈ Q} ψ(as)`, `Q` the set of nonzero squares. Write `1_Q(s) = (1 + η(s))/2` for
`s ≠ 0`: since `ψ` is primitive (`ZMod.isPrimitive_stdAddChar` with
`FiniteField.trace_to_zmod_nondegenerate`), `∑_{s ≠ 0} ψ(as) = −1` (`AddChar.sum_mulShift`), and
`∑_s η(s) ψ(as) = η(a) g` (`gaussSum_mulShift`, `η(a)⁻¹ = η(a)`). So the eigenvalue is
`(η(a) g − 1)/2`. Finally `gauss_quadChar_eq` of CharacterSumsOverFiniteFields gives
`g = (−1)^(f−1) (ε_p √p)^f` with `ε_p = 1` for `p ≡ 1 (mod 4)` and `ε_p = i` otherwise (its
`quadChar`
is `η` composed with `ℤ → ℂ`). For `p ≡ 3 (mod 4)` the condition
`p^f ≡ 1 (mod 4)` forces `f` even, and `(i √p)^f = (−1)^(f/2) √q`. In both cases `g = σ √q`.

**Checks.**
- `q = 5`, `a = 1`: the neighbours of `x` are `x ± 1`, and the eigenvalue is
  `ζ + ζ⁻¹ = 2 cos(2π/5) = (√5 − 1)/2` with `ζ = e(1/5)`; `σ = 1`, `η(1) = 1`.
- `q = 9`: `g = 3`, `σ = (−1)^2 = 1`; a nonzero square `a` gives `1` and a non-square `−2`.
- `q = 25`: `g = −5`, `σ = (−1)^1 = −1`; a nonzero square `a` gives `−3` and a non-square `2`. So
  the sign is not always `+1`, and over `𝔽₈₁` it is `−1` as well (`g = −9`), while over `𝔽₄₉` it is
  `1` (`g = 7`).
- Primality of `p` is needed: `25 = 25^1`, and `paleySign 25 1 = 1` would give `2` for a nonzero
  square `a` over `𝔽₂₅`, against `−3`.
- `q ≡ 1 (mod 4)` is needed: over `𝔽₃` the graph is `K₃`, every `ψ_a` with `a ≠ 0` has eigenvalue
  `−1`, while `paleySign 3 1 = −1` gives `(∓√3 − 1)/2`.

*Needs:* 1.1; CharacterSumsOverFiniteFields 0.1 (`stdAddChar`, copied), 3.3
(`gauss_quadChar_eq`); Mathlib `SimpleGraph.adjMatrix_mulVec_apply`,
`SimpleGraph.adjMatrix_mulVec_const_apply_of_regular`, `gaussSum`, `gaussSum_mulShift`,
`AddChar.mulShift`, `AddChar.sum_mulShift`, `ZMod.isPrimitive_stdAddChar`,
`FiniteField.trace_to_zmod_nondegenerate`, `FiniteField.isSquare_neg_one_iff`.

### 2.2 The sorted spectrum

Prove `adjEigenvalues_paleyGraph`: if `q ≡ 1 (mod 4)`, then `λ₁ = (q − 1)/2`,
`λ₂ = ⋯ = λ_((q+1)/2) = (√q − 1)/2` and the remaining `(q − 1)/2` eigenvalues equal `−(√q + 1)/2`;
in the index convention, the value at index `i` is `(q − 1)/2` for `i = 0`, `(√q − 1)/2` for
`1 ≤ i ≤ (q − 1)/2` and `−(√q + 1)/2` otherwise (Brouwer–Haemers, Proposition 9.1.1, p. 114, with
the multiplicities `1, 2t, 2t` for `q = 4t + 1`).

Route: by 1.2 the graph `G` satisfies `IsSRGWith q k ℓ μ` with `k = (q − 1)/2`,
`ℓ = (q − 5)/4`, `μ = (q − 1)/4`; as real numbers `ℓ − μ = −1` and `k − μ = (q − 1)/4`, so the
discriminant `srgDiscriminant k ℓ μ` is `1 + (q − 1) = q`. The graph is not complete (`0` and a
non-square are not adjacent) and `μ ≥ 1` since `q ≥ 5`. Then `spectrum_adjMatrix_of_isSRGWith` of
StronglyRegularAndMooreGraphs gives the spectrum `{k, r, s}` of `G.adjMatrix ℝ` with
`k > r = (√q − 1)/2 > s = −(√q + 1)/2`, and `adjEigenMultiplicity_of_isSRGWith` gives
`adjEigenMultiplicity G k = 1` and `2 f √q = (q − 1)√q − (2k − (q − 1)) = (q − 1)√q` for the
multiplicity `f` of `r`, so `f = (q − 1)/2`, and in the same way `(q − 1)/2` for `s`.
These are dimensions of eigenspaces of `Matrix.toLin' (G.adjMatrix ℝ)`. To pass to the sorted
list: `adjEigenvalues G` is by definition the list of eigenvalues, in Mathlib's
`LinearMap.IsSymmetric.eigenvalues`, of the symmetric operator
`Matrix.toEuclideanLin (G.adjMatrix ℝ)` (`Matrix.isSymmetric_toEuclideanLin_iff`), and
`LinearMap.IsSymmetric.card_filter_eigenvalues_eq` says that the number of indices `i` with
`λ_i = θ` is the dimension of the `θ`-eigenspace of that operator. The operator is
`Matrix.toLin' (G.adjMatrix ℝ)` carried over to `EuclideanSpace ℝ F` by the linear equivalence
with `F → ℝ` (`Matrix.toEuclideanLin` is `Matrix.toLpLin 2 2`), so its eigenspaces have the same
dimensions. Hence `k`, `r` and `s` occur at `1`, `(q − 1)/2` and `(q − 1)/2` indices; these add
up to `q`, so no other value occurs, and since the list is nonincreasing
(`Matrix.IsHermitian.eigenvalues₀_antitone`), index `0` carries `k`, the indices
`1, …, (q − 1)/2` carry `r`, and the remaining ones carry `s`.

**Checks.**
- `q = 5`: `2, (√5 − 1)/2, (√5 − 1)/2, −(√5 + 1)/2, −(√5 + 1)/2`; the sum is `0`, the trace of the
  adjacency matrix, and the sum of squares is `4 + 6 = 10 = 2 · 5`, twice the number of edges.
- `q = 9`: `4, 1, 1, 1, 1, −2, −2, −2, −2`; sum `0`, sum of squares `36 = 2 · 18`.
- `q ≡ 1 (mod 4)` is needed: over `𝔽₃` the spectrum of `K₃` is `2, −1, −1`, while the formula
  gives `1` at index `0`.

*Needs:* 1.2; StronglyRegularAndMooreGraphs 1.2 (`spectrum_adjMatrix_of_isSRGWith`) and 1.3
(`adjEigenMultiplicity_of_isSRGWith`); SpectralGraphBounds 1.1 (`adjEigenvalues`, copied);
Mathlib `Matrix.toEuclideanLin`, `Matrix.isSymmetric_toEuclideanLin_iff`,
`LinearMap.IsSymmetric.card_filter_eigenvalues_eq`, `Matrix.IsHermitian.eigenvalues₀_antitone`,
`SimpleGraph.isHermitian_adjMatrix`.

### Examples

The spectra for `q = 5, 9, 13, 25`, and the eigenvalue of each character over `𝔽₉`, `𝔽₂₅`,
`𝔽₄₉`, `𝔽₈₁`, as in the Checks.

### Dependencies

Layer 1 (1.1, 1.2). CharacterSumsOverFiniteFields 0.1, 3.3; StronglyRegularAndMooreGraphs 1.2,
1.3; SpectralGraphBounds 1.1. Mathlib as listed in 2.1 and 2.2.

## Layer 3: cliques, independent sets and edge distribution

### 3.1 The square-root bound

Prove `indepNum_le_sqrt_and_cliqueNum_le_sqrt`: if `q ≡ 1 (mod 4)`, the independence number
`α` and the clique number `ω` of the Paley graph are at most `√q` (Spielman, §19.4, pp. 166–167,
for `α` and prime `q`; Zhao states the clique bound for prime `q` as Exercise 3.3.17, p. 111).

Route: the graph is `(q − 1)/2`-regular (1.2) with `λ_q = −(√q + 1)/2` (2.2), which is
`smallestEigenvalue` of SpectralGraphBounds. Hoffman's ratio bound `indepNum_mul_le` gives
`α ((q − 1)/2 + (√q + 1)/2) ≤ q (√q + 1)/2`; the left factor is `√q (√q + 1)/2`, so `α ≤ √q`. For
`ω`, take a clique `K` of size `ω` (`SimpleGraph.maximumClique_exists`); its image under the
isomorphism of 1.3 is a clique of the complement, hence an independent set of the same size
(`SimpleGraph.isClique_compl`), and `ω ≤ α` by `SimpleGraph.IsIndepSet.card_le_indepNum`.

**Checks.**
- Computed by exhaustive search: `α = ω = 2, 3, 3, 3, 5, 4, 4, 5, 7, 5, 5` for
  `q = 5, 9, 13, 17, 25, 29, 37, 41, 49, 53, 61`, against `√q ≈ 2.24, 3, 3.61, 4.12, 5, 5.39, 6.08,
  6.40, 7, 7.28, 7.81`.
- Cvetković's inertia bound (SpectralGraphBounds 3.1) gives only `α ≤ (q − 1)/2`, the number of
  nonpositive eigenvalues (the nonnegative ones number `(q + 1)/2`); the ratio bound is what
  gives `√q`.
- `q ≡ 1 (mod 4)` is needed: over `𝔽₇` the graph is `K₇` with `ω = 7 > √7`.

*Needs:* 1.2, 1.3, 2.2; SpectralGraphBounds 1.1 (`smallestEigenvalue`) and 3.2 (`indepNum_mul_le`);
Mathlib `SimpleGraph.indepNum`, `SimpleGraph.cliqueNum`, `SimpleGraph.maximumClique_exists`,
`SimpleGraph.isClique_compl`, `SimpleGraph.IsIndepSet.card_le_indepNum`.

### 3.2 Square orders

Prove `indepNum_eq_and_cliqueNum_eq_of_sq`: if `q ≡ 1 (mod 4)` and `q = m²`, then `α = ω = m`.
(Proved here.)

Route: since `m² = p^f` with `p` prime, `m = p^(f/2)` (`Nat.eq_prime_pow_of_unique_prime_dvd`),
so `x ↦ x^m` is a power of the Frobenius and additive (`add_pow_char_pow`). The set
`K = {x : x^m = x}` is therefore a subfield. It is the set of roots in `F` of `X^m − X`, and
`X^m − X` divides `X^(m²) − X = X^q − X`, which is `∏_{x ∈ F} (X − x)`
(`FiniteField.roots_X_pow_card_sub_X`) and so has `q` distinct roots in `F`; hence `X^m − X` has
`m` distinct roots in `F` and `K` has exactly `m` elements. Every nonzero `x ∈ K` is a square:
`x^(m−1) = 1` and `(q − 1)/2 = (m − 1)(m + 1)/2` with `m` odd, so `x^((q−1)/2) = 1`
(`FiniteField.isSquare_iff`). Differences of elements of `K` lie in `K`, so `K` is a clique and
`ω ≥ m`; 3.1 gives `ω ≤ √q = m`, and `α = ω` by 1.3 as in 3.1.

**Checks.**
- `q = 9`: `K = 𝔽₃ = {0, 1, 2}`; the differences `±1, ±2` are squares in `𝔽₉` (`2 = −1 = i²`), so
  `ω = 3`. `q = 25`: `K = 𝔽₅` and `ω = 5`; `q = 49`: `ω = 7`; all three agree with the search of
  3.1.
- For non-square `q` the bound of 3.1 is not attained: `ω = 3 < √13`, `ω = 4 < √29`.
- An odd square `m²` is `1 (mod 8)`, so the hypothesis `q ≡ 1 (mod 4)` only excludes even `q`;
  it is needed: over `𝔽₄ = 2²` every element is a square (`FiniteField.isSquare_of_char_two`),
  the graph is `K₄` and `ω = 4 ≠ 2`.

*Needs:* 1.3, 3.1; Mathlib `Nat.eq_prime_pow_of_unique_prime_dvd`, `add_pow_char_pow`,
`FiniteField.roots_X_pow_card_sub_X`, `FiniteField.isSquare_iff`,
`SimpleGraph.IsClique.card_le_cliqueNum`.

### 3.3 Edge distribution

Prove `abs_card_interedges_paleyGraph_sub_le`: if `q ≡ 1 (mod 4)`, then for all sets `S`, `T` of
vertices, `|e(S, T) − |S||T|/2| ≤ (√q + 2) √(|S||T|)/2`. Since `√(|S||T|) ≤ q`, the discrepancy is
at most `(√q + 2) q/2`, a fraction `(√q + 2)/(2q)` of `q²`, which tends to `0`: the Paley graphs
have edge density `1/2` with vanishing discrepancy (Zhao, Example 3.1.10, p. 94, for prime `q`,
via Theorem 3.3.12; Bonato, §3, p. 6, mentions it). The constant is the route's.

Route: the graph is `d`-regular with `d = (q − 1)/2` (1.2), and by 2.2 every eigenvalue of index
`i ≥ 1` has absolute value at most `β = (√q + 1)/2`. The expander mixing lemma
`abs_card_interedges_sub_le` of SpectralGraphBounds gives, with `s = |S|`, `t = |T|`,
`|e(S, T) − (q − 1)st/(2q)| ≤ β √(st(1 − s/q)(1 − t/q)) ≤ β √(st)`. Then
`|e(S, T) − st/2| ≤ β √(st) + st/(2q)`, and `st/(2q) ≤ √(st)/2` because `√(st) ≤ q`.

**Checks.**
- `S = T = F`: every vertex has `(q − 1)/2` neighbours, so `e(F, F) = q(q − 1)/2` and the left
  side is `|q(q − 1)/2 − q²/2| = q/2`, against `(√q + 2) q/2` on the right.
- `q = 9`, `S = T = 𝔽₃` (the clique of 3.2): `e = 6`, `|6 − 9/2| = 3/2 ≤ (3 + 2) · 3/2`.
- Verified by exhaustive search over all pairs `(S, T)` for `q = 5, 9`, and over `S = T` for
  `q = 13`.
- `q ≡ 1 (mod 4)` is needed: over `𝔽₇` the graph is `K₇`; for `S = T = F`, `e = 42` and
  `|42 − 49/2| = 17.5 > (√7 + 2) · 7/2 ≈ 16.26`.

*Needs:* 1.2, 2.2; SpectralGraphBounds 4.1 (`abs_card_interedges_sub_le`); Mathlib
`SimpleGraph.interedges`.

### Examples

The Paley graphs on `5, …, 61` vertices with their clique numbers, the subfields of `𝔽₉`, `𝔽₂₅`,
`𝔽₄₉`, and the edge counts of the Checks.

### Dependencies

Layer 1 (1.2, 1.3), Layer 2 (2.2). SpectralGraphBounds 1.1, 3.2, 4.1. Mathlib as listed in 3.1–3.3.

## Layer 4: prescribed character patterns

### 4.1 Counting points with prescribed quadratic characters

Prove `abs_two_pow_mul_card_sub_le`: let `F` have odd characteristic, `A ⊆ F` with `|A| = n`, and
`ε(a) ∈ {1, −1}` for `a ∈ A`. The number `N` of `x ∉ A` with `η(x − a) = ε(a)` for all `a ∈ A`
satisfies

    |2ⁿ N − q| ≤ (n 2ⁿ/2 − 2ⁿ + 1) √q + n 2ⁿ/2.

(Proved here. Bonato, p. 6, attributes the method to Graham and Spencer and to the proofs of
Theorem 4 by Blass, Exoo and Harary and by Bollobás and Thomason, without proof.)

Route. For `x ∉ A` the product `P(x) = ∏_{a ∈ A} (1 + ε(a) η(x − a))/2` is `1` if `x` has the
pattern and `0` otherwise. For `x = a₀ ∈ A` its factor at `a₀` is `1/2` and the others lie in
`{0, 1}`, so `0 ≤ P(a₀) ≤ 1/2`. Hence `2ⁿ N = 2ⁿ ∑_x P(x) − c` with `0 ≤ c ≤ n 2ⁿ/2`. Expanding
and using multiplicativity of `η`,
`2ⁿ ∑_x P(x) = ∑_{T ⊆ A} (∏_{a ∈ T} ε(a)) ∑_x η(f_T(x))`, `f_T = ∏_{a ∈ T} (X − a)`. The term
`T = ∅` is `q`. For `T ≠ ∅`, `f_T` is nonzero with exactly `|T|` distinct roots in an algebraic
closure (`Polynomial.roots_prod_X_sub_C`, `Polynomial.map_prod`), and it is not `c h²`: if it were,
`h` would be nonconstant, and an irreducible factor of `h`, a linear factor `X − a` of `f_T`, would
divide `f_T` twice. The complex quadratic character `η_ℂ` (CharacterSumsOverFiniteFields's
`quadChar`, Mathlib's `MulChar.ringHomComp` of `η`) is nontrivial of order `2` (`orderOf_eq_prime`),
so `weil_mulChar_sum_bound` gives `|∑_x η(f_T(x))| ≤ (|T| − 1) √q`. Summing,
`|2ⁿ ∑_x P(x) − q| ≤ √q ∑_{t=1}^{n} C(n, t)(t − 1) = (n 2ⁿ⁻¹ − 2ⁿ + 1) √q`, and the bound follows.

**Checks.**
- `n = 0`: `N = q` and both sides are `0`. `n = 1`: `N = (q − 1)/2` exactly, `|2N − q| = 1`, and
  the bound is `0 · √q + 1`, attained.
- `n = 2`, `q ≡ 1 (mod 4)`, `A = {x, y}` adjacent, `ε = (1, 1)`: `N = (q − 5)/4` by 1.2, so
  `|4N − q| = 5 ≤ √q + 4`.
- Verified by exhaustive search over all `A` with `|A| ≤ 3` and all sign patterns for
  `q = 5, 7, 9, 11, 13, 17, 19, 25, 27, 29`, and `|A| ≤ 2` for `q = 3, 37, 41, 49`.
- The sign hypothesis is needed: with `ε = 0` and `n = 1`, `N = 0` and `|0 − q| = q > 1`.
- Odd characteristic is needed: over `𝔽₄`, `η` is `1` on every nonzero element, and `ε = −1`,
  `n = 1` gives `N = 0`, `|0 − 4| = 4 > 1`.

*Needs:* CharacterSumsOverFiniteFields 4.7 (`weil_mulChar_sum_bound`); Mathlib `quadraticChar`,
`MulChar.ringHomComp`, `quadraticChar_ne_one`, `quadraticChar_isQuadratic`, `orderOf_eq_prime`,
`Polynomial.roots_prod_X_sub_C`, `Polynomial.map_prod`.

### 4.2 The Paley graph is existentially closed

Prove `exists_adj_forall_of_card_le`: if `q ≡ 1 (mod 4)` and `q > n² 4^(n−1)`, then for disjoint
`A`, `B` with `|A| + |B| ≤ n` some `z ∉ A ∪ B` is adjacent to every vertex of `A` and to no vertex
of `B` (Bonato, Theorem 4, p. 6, stated without proof for `|A ∪ B| = n`; the constant here is the
route's and agrees with Bonato's).

Route: let `m = |A| + |B| ≤ n`; then `q > m² 4^(m−1)`. For `m = 0` take any vertex. Otherwise apply
4.1 (the characteristic is odd, since `q ≡ 1 (mod 4)`) to `A ∪ B` with `ε = 1` on `A` and `−1` on
`B`; by 1.1 the pattern is exactly correct joining.
Put `M = m 2^(m−1)` and `E = M − 2^m + 1 ≤ M − 1`. Then
`2^m N ≥ q − E √q − M ≥ √q (√q − M + 1) − M`, and `√q > M` gives `√q (√q − M + 1) > √q > M`, so
`N > 0`.

**Checks.**
- `n = 1`: every `q ≥ 5` works, and indeed no vertex is isolated or adjacent to all others.
- `n = 2` needs `q > 16`; by exhaustive search `P₉`, `P₁₃`, `P₁₇`, `P₂₅` are 2-e.c. and `P₅` is not
  (a 2-e.c. graph has at least `2 + 4` vertices, Bonato, Theorem 2 (2), p. 4). `n = 3` needs
  `q > 144`; by search `P₂₉` and every Paley graph up to `P₁₁₃` is 3-e.c., `P₂₅` is not. The
  threshold is sufficient, not sharp.
- Disjointness is needed: `A = B = {0}` asks for a vertex adjacent and nonadjacent to `0`.
- `q ≡ 1 (mod 4)` is needed: over `𝔽₇` (`n = 1`, `7 > 1`) the graph is complete, and for
  `A = ∅`, `B = {0}` no vertex other than `0` is nonadjacent to `0`.

*Needs:* 1.1, 4.1; Mathlib `quadraticChar_one_iff_isSquare`,
`quadraticChar_neg_one_iff_not_isSquare`.

### 4.3 Induced subgraphs

Prove `nonempty_embedding_paleyGraph`: if `q ≡ 1 (mod 4)` and `q > n² 4^(n−1)`, every finite graph
`H` on at most `n + 1` vertices has an induced embedding `H ↪g paleyGraph F` (Bonato, Theorem 2 (4),
p. 4, for every `n`-e.c. graph, stated without proof).

Route: list the vertices `w₀, …, w_k` of `H`, `k ≤ n`, and choose images one at a time. Map `w₀` to
any vertex. Having mapped `w₀, …, w_(j−1)` injectively, let `A` be the images of the neighbours of
`w_j` among them and `B` the images of the others; `|A| + |B| = j ≤ n`, and 4.2 gives a vertex
outside `A ∪ B` correctly joined, which is the image of `w_j`. The map is injective and preserves
adjacency and nonadjacency, so it is a Mathlib `SimpleGraph.Embedding`.

**Checks.**
- `q = 5`, `n = 1`: every graph on two vertices embeds; `K₃` does not, since `ω = 2` (3.1).
- `q = 17`, `n = 2`: the four graphs on three vertices embed, with `ω(P₁₇) = α(P₁₇) = 3`.
- `q ≡ 1 (mod 4)` is needed: the complete graph over `𝔽₇` has no two nonadjacent vertices.

*Needs:* 4.2; Mathlib `SimpleGraph.Embedding`.

### 4.4 Paley tournaments

Define `paleyTournament F`, the Mathlib `Digraph` with an arc from `x` to `y` when `x ≠ y` and
`y − x` is a square. For `q ≡ 3 (mod 4)`, `−1` is not a square and exactly one of `x → y`,
`y → x` holds for `x ≠ y`: it is a tournament (Bonato, §3, p. 6). Prove
`paleyTournament_exists_adj_forall_of_card_le`: if `q > n² 4^(n−1)`, then for disjoint `A`, `B`
with `|A| + |B| ≤ n` some `z ∉ A ∪ B` has an arc to every vertex of `A` and an arc from every
vertex of `B` (Bonato, p. 6, attributes the statement for large `q` to Graham and Spencer; the
constant and the route are ours).

The statement holds for every finite field: for `q ≡ 1 (mod 4)` arcs go both ways exactly along
edges and it is 4.2 applied to `(A ∪ B, ∅)`, and in characteristic `2` every pair of distinct
elements carries both arcs and `q > n` suffices.

Route for odd `q`: `z → a` means `η(a − z) = 1`, that is `η(z − a) = η(−1)`, and `b → z` means
`η(z − b) = 1`. Apply 4.1 to `A ∪ B` with `ε = η(−1)` on `A` and `1` on `B`, and conclude as in
4.2. In characteristic `2`, `q > n² 4^(n−1) ≥ n` leaves a vertex outside `A ∪ B`.

**Checks.**
- Over `𝔽₇` the squares are `1, 2, 4`, and `0 → 1, 0 → 2, 0 → 4`: each vertex has out-degree `3`.
  By exhaustive search `T₇` and `T₁₁` are 2-e.c. and `T₁₉`, `T₂₃`, `T₂₇`, `T₃₁` are 3-e.c.;
  `T₃` is 1-e.c. and not 2-e.c.
- The statement for `q ≡ 1 (mod 4)` and in characteristic `2` was checked by search for
  `q = 17, 29` with `n = 2` and `q = 4, 8, 16` with `n = 1`.
- Disjointness is needed, as in 4.2.

*Needs:* 4.1, 4.2; Mathlib `Digraph`, `FiniteField.isSquare_neg_one_iff`,
`FiniteField.isSquare_of_char_two`.

### Examples

The counts of 4.1 over `𝔽₃` to `𝔽₄₉`, the 2-e.c. Paley graphs `P₉` to `P₂₅`, the 3-e.c. graphs
`P₂₉` to `P₁₁₃`, and the tournaments `T₃` to `T₃₁`, as in the Checks.

### Dependencies

Layer 1 (1.1, 1.2 for a Check). CharacterSumsOverFiniteFields 4.7. Mathlib as listed in 4.1–4.4.

## Scope and ownership

This roadmap owns the targets stated above: the Paley graph, its strong regularity,
self-complementarity and arc-transitivity; the characters of `F` as its eigenvectors with the
signed eigenvalues, and its sorted spectrum; the square-root bound for its clique and independence
numbers with equality for square `q`; its edge distribution; the estimate 4.1 for prescribed
quadratic-character patterns, the extension property of Paley graphs and tournaments, and the
embedding of all small graphs.

Already in the libraries and therefore not targets: Mathlib's quadratic character with
`η(−1) = (−1)^((q−1)/2)` and the criterion for `−1` to be a square, Gauss and Jacobi sums with
`gaussSum_mulShift` and `jacobiSum_nontrivial_inv`, strongly regular graphs
(`SimpleGraph.IsSRGWith`),
and Tau Ceti's full extension property `SimpleGraph.HasExtensionProperty` with the Rado graph
(`TauCeti/Combinatorics/SimpleGraph/ExtensionProperty.lean`). A finite graph never has the full
property, which asks for a correctly joined vertex for every pair of finite sets; 4.2 is its
bounded form for Paley graphs and is stated without a new predicate.

Stated by other roadmaps and consumed, not restated:

- CharacterSumsOverFiniteFields: Weil's bound 4.7 and the quadratic Gauss sum 3.3 are used in 4.1
  and 2.1; nothing about them is proved here.
- StronglyRegularAndMooreGraphs: the spectrum and multiplicities of a strongly regular graph (1.2,
  1.3), used in 2.2. Its feasibility conditions (1.4, 1.5) are not restated; the Paley parameters
  are its conference parameters `(4μ + 1, 2μ, μ − 1, μ)` with `μ = (q − 1)/4`.
- SpectralGraphBounds: Hoffman's ratio bound (3.2), used in 3.1, and the expander mixing lemma
  (4.1), used in 3.3. The statements above are their instances for Paley graphs, combined with the
  spectrum of Layer 2; neither bound is restated in general.

Outside the scope: the general theory of quasirandom graphs and its equivalent conditions; the
bounded extension property of general graphs, its first-order consequences and random graphs;
Blokhuis's theorem that the maximum cliques of `P_(m²)` are the affine images of the subfield; the
better clique bounds of Hanson–Petridis type; the `p`-ranks of Paley graphs (Brouwer–Haemers,
§13.6); the Lovász theta function of Paley graphs; conference matrices and Paley's Hadamard
matrices; generalised (cubic, quadruple) Paley graphs; and every procedure for constructing or
recognising these graphs.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Combinatorics/SimpleGraph/Basic.lean`: `SimpleGraph.fromRel` (`(fromRel r).Adj a b` is
  `a ≠ b ∧ (r a b ∨ r b a)`). `Mathlib/Combinatorics/SimpleGraph/Maps.lean`: `SimpleGraph.Iso`,
  `SimpleGraph.Embedding` (a relation embedding, so adjacency and nonadjacency are preserved).
  `Mathlib/Combinatorics/Digraph/Basic.lean`: `Digraph` (a relation `Adj`).
- `Mathlib/Combinatorics/SimpleGraph/StronglyRegular.lean`: `SimpleGraph.IsSRGWith`.
- `Mathlib/Combinatorics/SimpleGraph/AdjMatrix.lean`: `SimpleGraph.adjMatrix_mulVec_apply`
  (`(A *ᵥ vec) v = ∑ u ∈ G.neighborFinset v, vec u`),
  `SimpleGraph.adjMatrix_mulVec_const_apply_of_regular`.
  `Mathlib/Combinatorics/SimpleGraph/LapMatrix.lean`:
  `SimpleGraph.isHermitian_adjMatrix`. `Mathlib/Combinatorics/SimpleGraph/Density.lean`:
  `SimpleGraph.interedges`.
- `Mathlib/Combinatorics/SimpleGraph/Clique.lean`: `SimpleGraph.cliqueNum`, `SimpleGraph.indepNum`
  (suprema in `ℕ`), `SimpleGraph.maximumClique_exists` (`[Finite α]`), `SimpleGraph.isClique_compl`
  (`Gᶜ.IsClique s ↔ G.IsIndepSet s`), `SimpleGraph.IsClique.card_le_cliqueNum` and
  `SimpleGraph.IsIndepSet.card_le_indepNum` (`[Finite α]`).
- `Mathlib/Analysis/Matrix/Spectrum.lean`: `Matrix.IsHermitian.eigenvalues₀` (defined as
  `LinearMap.IsSymmetric.eigenvalues` of `Matrix.toEuclideanLin A`),
  `Matrix.IsHermitian.eigenvalues₀_antitone`. `Mathlib/Analysis/Matrix/Hermitian.lean`:
  `Matrix.isSymmetric_toEuclideanLin_iff`. `Mathlib/Analysis/InnerProductSpace/PiL2.lean`:
  `Matrix.toEuclideanLin` (`Matrix.toLpLin 2 2`). `Mathlib/Analysis/InnerProductSpace/Spectrum.lean`:
  `LinearMap.IsSymmetric.card_filter_eigenvalues_eq` (the number of indices carrying `μ` is the
  dimension of the `μ`-eigenspace).
- `Mathlib/NumberTheory/LegendreSymbol/QuadraticChar/Basic.lean`: `quadraticChar` (for
  `[Field F] [Fintype F] [DecidableEq F]`, a `MulChar F ℤ`), `quadraticChar_one_iff_isSquare`
  (`a ≠ 0`), `quadraticChar_neg_one_iff_not_isSquare`, `quadraticChar_sum_zero`
  (`ringChar F ≠ 2`), `quadraticChar_isQuadratic`, `quadraticChar_ne_one` (`ringChar F ≠ 2`),
  `FiniteField.isSquare_neg_one_iff` (`IsSquare (-1) ↔ Fintype.card F % 4 ≠ 3`).
- `Mathlib/FieldTheory/Finite/Basic.lean`: `FiniteField.exists_nonsquare` (`ringChar F ≠ 2`),
  `FiniteField.isSquare_iff` (`ringChar F ≠ 2`, `a ≠ 0`: `IsSquare a ↔ a ^ (q / 2) = 1`),
  `FiniteField.roots_X_pow_card_sub_X`, `FiniteField.isSquare_of_char_two`.
  `Mathlib/FieldTheory/Finite/Trace.lean`: `FiniteField.trace_to_zmod_nondegenerate`.
- `Mathlib/NumberTheory/MulChar/Basic.lean`: `MulChar.ringHomComp`, `MulChar.IsQuadratic.inv`.
  `Mathlib/NumberTheory/GaussSum.lean`: `gaussSum`, `gaussSum_mulShift`
  (`χ a * gaussSum χ (ψ.mulShift a) = gaussSum χ ψ` for a unit `a`).
  `Mathlib/NumberTheory/JacobiSum/Basic.lean`: `jacobiSum`, `jacobiSum_nontrivial_inv`
  (`χ ≠ 1 → jacobiSum χ χ⁻¹ = -χ (-1)`).
- `Mathlib/Algebra/Group/AddChar.lean`: `AddChar.mulShift`;
  `Mathlib/NumberTheory/LegendreSymbol/AddCharacter.lean`:
  `AddChar.sum_mulShift` (for primitive `ψ`, `∑ x, ψ (x * b)` is `q` or `0`).
  `Mathlib/Analysis/SpecialFunctions/Complex/CircleAddChar.lean`: `ZMod.isPrimitive_stdAddChar`.
- `Mathlib/Algebra/Polynomial/Roots.lean`: `Polynomial.roots_prod_X_sub_C`;
  `Mathlib/Algebra/Polynomial/Eval/Defs.lean`: `Polynomial.map_prod`.
  `Mathlib/GroupTheory/OrderOfElement.lean`: `orderOf_eq_prime`.
  `Mathlib/Algebra/CharP/Lemmas.lean`: `add_pow_char_pow`.
  `Mathlib/Data/Nat/Factors.lean`: `Nat.eq_prime_pow_of_unique_prime_dvd` (a nonzero number whose
  only prime divisor is `p` is a power of `p`).

### From Tau Ceti

Nothing is consumed. `SimpleGraph.HasExtensionProperty`
(`TauCeti/Combinatorics/SimpleGraph/ExtensionProperty.lean`) is named in the scope above.

### From TauCetiRoadmap.CharacterSumsOverFiniteFields

- 0.1 `stdAddChar` (copied verbatim, with its `variable (F : Type u) [Field F] [Finite F]` line).
- 3.3 `gauss_quadChar_eq`: for `ringChar F ≠ 2`, `p` prime and `Nat.card F = p ^ f`,
  `gauss (quadChar (F := F)) = (-1) ^ (f - 1) * ((if p % 4 = 1 then 1 else I) * √p) ^ f`, where
  `gauss χ = gaussSum χ (stdAddChar F)` and `quadChar` is `quadraticChar F` composed with
  `ℤ → ℂ`.
- 4.7 `weil_mulChar_sum_bound`: for `χ : MulChar F ℂ` with `χ ≠ 1` and `f : F[X]` nonzero and not
  of the form `C c * h ^ orderOf χ`, `‖∑ x, χ (f.eval x)‖ ≤ (m − 1) √(Nat.card F)` with `m` the
  number of distinct roots of `f` in `AlgebraicClosure F`.

### From TauCetiRoadmap.StronglyRegularAndMooreGraphs

- 1.2 `spectrum_adjMatrix_of_isSRGWith`: for `G.IsSRGWith n k ℓ μ`, `0 < μ`, `G ≠ ⊤`, the spectrum
  of `G.adjMatrix ℝ` is `{k, srgEigenvalueR k ℓ μ, srgEigenvalueS k ℓ μ}` with `s < r < k`.
- 1.3 `adjEigenMultiplicity_of_isSRGWith`: under the same hypotheses `adjEigenMultiplicity G k = 1`
  and the multiplicities `f`, `g` of `r`, `s` satisfy `2 f √Δ = (n − 1)√Δ − (2k + (n − 1)(ℓ − μ))`
  and `2 g √Δ = (n − 1)√Δ + (2k + (n − 1)(ℓ − μ))`, `Δ = srgDiscriminant k ℓ μ`.

### From TauCetiRoadmap.SpectralGraphBounds

- 1.1 `adjEigenvalues` (copied verbatim, with its `variable {V : Type*} [Fintype V] [DecidableEq V]`
  line) and `smallestEigenvalue` (the value at index `Fintype.card V - 1`, on a nonempty type).
- 3.2 `indepNum_mul_le`: for a `d`-regular graph on a nonempty type,
  `α (d − λₙ) ≤ n (−λₙ)`.
- 4.1 `abs_card_interedges_sub_le`: for a `d`-regular graph with `|λᵢ| ≤ β` at every index `i ≠ 0`,
  `|e(S, T) − d|S||T|/n| ≤ β √(|S||T|(1 − |S|/n)(1 − |T|/n))`.

## References

- Anthony Bonato, *The search for n-e.c. graphs*, Contributions to Discrete Mathematics 4 (2009);
  the author's version on his page (`mscs.dal.ca/~abonato/necsurvey.pdf`, 16 pages). Locators are
  to its page numbers: §1, p. 1 (definition); Theorem 2, p. 4; §3 and Theorems 3–5, p. 6.
- Andries E. Brouwer and Willem H. Haemers, *Spectra of Graphs*, Springer, Universitext, 2012; the
  authors' version posted by the first author (`win.tue.nl/~aeb/2WF02/spectra.pdf`). Locators are
  to its printed pages: §9.1, Examples (v) and (viii), pp. 113–114; Proposition 9.1.1, p. 114;
  §13.6, pp. 186–187.
- Chris Godsil, *Association Schemes*, lecture notes, 2010, on the author's page
  (`math.uwaterloo.ca/~cgodsil/pdfs/assoc2.pdf`): §10.2, pp. 100–102.
- Daniel A. Spielman, *Spectral and Algebraic Graph Theory*, draft of 2 April 2025, on the author's
  page (`cs-www.cs.yale.edu/homes/spielman/sagt`): §19.4, pp. 166–167.
- Yufei Zhao, *Graph Theory and Additive Combinatorics*, Cambridge University Press, 2023; the
  author's version of 18 June 2024 (`yufeizhao.com/gtacbook/gtacbook.pdf`): Example 3.1.10, p. 94;
  Definition 3.3.5 and Theorem 3.3.8, p. 108; Theorem 3.3.12, p. 110; Remark 3.3.15 and
  Exercise 3.3.17, p. 111.

# Roadmap: quasirandom graphs

**Summary.** A finite graph with edge density `p` is quasirandom if it looks like a typical
binomial random graph of the same density in any one of several ways: edges are spread evenly
between all pairs of vertex sets (DISC, and its one-set form DISC′); every fixed graph occurs
with the density it would have in a random graph (COUNT); the 4-cycle density is not much larger
than `p⁴` (C4); almost all pairs of vertices have about `p² n` common neighbours (CODEG); or the
adjacency matrix has one eigenvalue near `p n` and all others small compared with `n` (EIG).
Chung, Graham and Wilson proved that these properties are equivalent for sequences of graphs.
This roadmap states the equivalences for a single graph `G` on `n` vertices, as explicit
implications between the properties with a tolerance `ε`, at every density `p` in `[0, 1]`,
with no regularity assumption.

The headline theorems are these.

- *Discrepancy and counting.* DISC′ with tolerance `ε` implies DISC with tolerance `2ε`. If `G`
  satisfies DISC with tolerance `δ`, then for every finite graph `F` with `e(F)` edges the
  homomorphism density satisfies `|t(F, G) − p^e(F)| ≤ e(F) δ`.
- *Codegrees.* If `t(K₂, G) ≥ p − δ` and `t(C₄, G) ≤ p⁴ + δ`, then `G` satisfies CODEG with
  tolerance `√(5δ)`. If `t(K₂, G) ≥ p − δ` and `G` satisfies CODEG with tolerance `δ`, then it
  satisfies DISC with tolerance `√(δ + 2√(3δ))`.
- *Eigenvalues.* For `k ≥ 2`, the number of homomorphisms from the `k`-cycle to `G` is the sum
  of the `k`-th powers of the adjacency eigenvalues. If `t(K₂, G) ≥ p − δ` and
  `t(C₄, G) ≤ p⁴ + δ`, then `G` satisfies EIG with tolerance `(5δ)^(1/4)`; conversely EIG with
  tolerance `δ` gives `t(C₄, G) ≤ (p + δ)⁴ + δ²`.
- *Limits.* A graphon `W` on any probability space has `t(C₄, W) = t(K₂, W)⁴` exactly when `W`
  is almost everywhere equal to the constant `t(K₂, W)`. Binomial random graphs `G(n, p)` on one
  probability space satisfy, almost surely, DISC with every tolerance `ε > 0` for all large `n`.

The roadmap bridges two developments. DenseGraphLimits, now part of Tau Ceti, supplies
homomorphism densities of finite graphs and graphons, the cut norm,
the counting lemma, the minimum 4-cycle density (Sidorenko's inequality for `C₄`) and the
concentration of densities of sampled graphs. The roadmap SpectralGraphBounds supplies the sorted
adjacency eigenvalues and the bound of the average degree by the largest eigenvalue. Mathlib
supplies the binomial random graph and Borel–Cantelli.

Layer 1 below defines the properties for one graph. Layer 2 proves DISC′ ⇒ DISC and DISC ⇒
COUNT, Layer 3 C4 ⇒ CODEG ⇒ DISC, Layer 4 the trace formula and C4 ⇔ EIG; with COUNT ⇒ C4 (the
case `F = C₄`) this closes the cycle of implications. Layer 5 treats graphons and, from Layer 3,
`G(n, p)`.

## Conventions

- **Graphs.** A graph is a Mathlib `SimpleGraph V` with `[Fintype V]` and `[DecidableRel G.Adj]`
  (and `[DecidableEq V]` where common neighbourhoods or eigenvalues occur); `n = Fintype.card V`.
  The density parameter `p` lies in Mathlib's `unitInterval`, written `I`, the range of edge
  densities; every statement is made for `p ∈ [0, 1]`, as in the source theorem.
- **Edges between sets.** `e(X, Y)` is the number of ordered pairs `(x, y) ∈ X × Y` with
  `x ~ y`, the cardinality of Mathlib's `G.interedges X Y`; `X` and `Y` may overlap, an edge
  inside `X ∩ Y` is counted twice, `e(X, X) = 2 e(X)` for the number `e(X)` of edges inside `X`,
  and `e(V, V) = 2|E|`.
- **Densities are homomorphism densities.** The edge density and the 4-cycle density are Tau
  Ceti's `homDensityFin (⊤ : SimpleGraph (Fin 2)) G = 2|E|/n²` and
  `homDensityFin (cycleGraph 4) G`, the number of homomorphisms `C₄ → G` (closed walks of length
  four) over `n⁴`; written `t(K₂, G)` and `t(C₄, G)`. Labelled copies (injective homomorphisms),
  which the source counts, differ from homomorphisms by at most `C(v(F), 2)/n` in density (Tau
  Ceti's `homDensityFin_sub_injHomDensity_le`); with homomorphisms every identity used below is
  exact, with no error term of order `1/n`. On the empty vertex type `homDensityFin F G` is `1`
  for an empty pattern and `0` otherwise (division by `0 ^ v(F)`).
- **Explicit tolerances.** Each property is a predicate `P(G, p, ε)` with a real tolerance `ε`,
  stated for one graph; no sequence and no `o(1)` term enters a definition. Implications are
  stated with an explicit tolerance on the conclusion. The source's asymptotic theorem for a
  sequence `G_n` follows by letting the tolerance tend to `0`.
- **The standing edge-density hypothesis.** The source theorem fixes the edge density `p + o(1)`
  as a standing hypothesis of every property. Here it enters as the hypothesis
  `p − δ ≤ t(K₂, G)` of the implications that use it, in the one direction their routes use. DISC
  implies `|t(K₂, G) − p| ≤ δ` (take `X = Y = V`); C4 and EIG do not determine the edge density
  (Check in 1.3).
- **Eigenvalues.** The adjacency eigenvalues are `adjEigenvalues G : Fin n → ℝ`, copied verbatim
  from SpectralGraphBounds 1.1: Mathlib's `Matrix.IsHermitian.eigenvalues₀` of
  `G.adjMatrix ℝ`, in nonincreasing order, so index `0` carries the largest eigenvalue `λ₁`. In
  the prose `λ₁ ≥ ⋯ ≥ λₙ`.
- **Powers and roots.** `√` is `Real.sqrt` (which is `0` on negative numbers) and `(5δ)^(1/4)` is
  written `√(√(5δ))` in Lean, so that no real power of a negative number occurs.

## Layer 1: the quasirandom properties

### 1.1 Discrepancy

Define `IsDisc G p ε`: for all finsets `X`, `Y` of vertices,
`|e(X, Y) − p |X| |Y|| ≤ ε n²`. Define `IsDiscSelf G p ε` (DISC′): for every finset `X`,
`|e(X, X) − p |X|²| ≤ ε n²`.

DISC′ is stated with ordered pairs. The source's form, `|e(X) − p C(|X|, 2)| ≤ ε n²`, differs from
`IsDiscSelf G p (2ε)` by the diagonal term: `e(X, X) − p|X|² = 2(e(X) − p C(|X|, 2)) − p|X|`, and
`p|X| ≤ n`. DISC implies DISC′ with the same tolerance (take `Y = X`).

Tau Ceti's cut discrepancy `SimpleGraph.cutDiscrepancy G ⊤` of the one-part partition is the
largest `|e(X, Y) − t(K₂, G) |X| |Y||` over all `X`, `Y` (`SimpleGraph.steppedCount_top`, with
Mathlib's `edgeDensity univ univ = t(K₂, G)`), so by `SimpleGraph.cutDiscrepancy_le_iff`,
`IsDisc G p ε` at `p = t(K₂, G)` says `cutDiscrepancy G ⊤ ≤ ε n²`; `IsDisc` differs in allowing
any `p ∈ [0, 1]`.

**Checks.**
- The complete graph `Kₙ` with `p = 1` has `e(X, Y) = |X||Y| − |X ∩ Y|`, so the least tolerance
  for which DISC holds is `1/n`, attained at `X = Y = V`; for `K₄` it is `1/4`. With
  `p = 3/4`, `K₄` satisfies DISC and DISC′ with least tolerance `1/16` in both.
- A graph on one vertex with `p = 1` satisfies DISC only with tolerance at least `1`
  (`X = Y = V` gives `|0 − 1|`): the diagonal pairs `(x, x)`, never edges, count in `p|X||Y|`,
  and for small `n` this is not negligible.
- The plausible wrong variant counting unordered edges between `X` and `Y` (so `e(V, V) = |E|`)
  gives `Kₙ` with `p = 1` the discrepancy `n²/2 + n/2` at `X = Y = V`; the ordered count gives
  `n`.

### 1.2 Codegrees

Define `IsCodeg G p ε`: with `codeg(u, v) = |N(u) ∩ N(v)|`, the number of common neighbours,
`∑ u, ∑ v, |codeg(u, v) − p² n| ≤ ε n³`, the sum over all ordered pairs, `u = v` included (there
`codeg(u, u) = deg u`). This is the source's CODEG with the absolute value inside the sum.

The two sums that the layers use are exact: `∑ u, ∑ v, codeg(u, v) = ∑ x, (deg x)²` (count
triples `u ~ x ~ v`), and `∑ u, ∑ v, codeg(u, v)² = hom(C₄, G)` (a closed walk `a ~ b ~ c ~ d ~ a`
is a pair `(a, c)` with two common neighbours `b`, `d`).

**Checks.**
- `K₄` with `p = 1`: `codeg = 2` off the diagonal and `3` on it, so the sum is
  `12 · 2 + 4 · 1 = 28` and the least tolerance is `28/64 = 7/16`; with `p = 3/4` the sum is
  `12 · 1/4 + 4 · 3/4 = 6` and the least tolerance is `6/64 = 3/32`.
- A graph on one vertex with `p = 1` has the single term `|0 − 1| = 1`; dropping the diagonal
  would give `0`.
- `K₄`: `∑ codeg² = 12 · 4 + 4 · 9 = 84 = hom(C₄, K₄)`.

### 1.3 Eigenvalues

Copy `adjEigenvalues` verbatim from SpectralGraphBounds 1.1. Define `IsEig G p ε`: for every
index `i`, `|λ_(i+1) − p n| ≤ ε n` when `i = 0`, and `|λ_(i+1)| ≤ ε n` otherwise; that is,
`|λ₁ − p n| ≤ ε n` and `max_{i ≥ 2} |λᵢ| ≤ ε n`. No regularity is assumed: this is the source's
EIG for the adjacency matrix of an arbitrary graph. On the empty vertex type the condition is
empty.

**Checks.**
- `K₄` has eigenvalues `3, −1, −1, −1`; with `p = 1` the least tolerance is `1/4` (from
  `|3 − 4|` and `|−1|`).
- The star `K_(1,3)` is not regular; its eigenvalues are `√3, 0, 0, −√3` and its edge density is
  `t(K₂, K_(1,3)) = 6/16 = 3/8`. With `p = 3/8` the least tolerance is `√3/4`, coming from
  `λ₄ = −√3`; the plausible wrong variant that bounds only the second largest eigenvalue `λ₂`
  (rather than all `|λᵢ|`, `i ≥ 2`) would give `|√3 − 3/2|/4` instead.
- C4 and EIG do not fix the edge density. The graph on one vertex has `t(K₂) = t(C₄) = 0`, so it
  satisfies `t(C₄) ≤ p⁴` with `p = 1`, but EIG at `p = 1` needs tolerance `1` (`|0 − 1|`). For
  EIG: the clique `K_m` together with `m` isolated vertices (`n = 2m`, `m ≥ 2`) has eigenvalues
  `m − 1`, then `0` (`m` times) and `−1` (`m − 1` times); with `p = (m − 1)/(2m)` its least EIG
  tolerance is `1/(2m)`, while its edge density is `m(m − 1)/(4m²) = p/2`.

*Needs:* Mathlib `SimpleGraph.interedges`, `SimpleGraph.neighborFinset`,
`SimpleGraph.adjMatrix`, `SimpleGraph.isHermitian_adjMatrix`,
`Matrix.IsHermitian.eigenvalues₀`; Tau Ceti `TauCeti.DenseGraphLimits.homDensityFin`;
SpectralGraphBounds 1.1 (the definition `adjEigenvalues`). (Definitions.)

### Examples

`K₄` at `p = 1` and `p = 3/4`, the star `K_(1,3)` at its edge density `3/8`, and the graph on one
vertex.

### Dependencies

Mathlib; Tau Ceti DenseGraphLimits (`homDensityFin`); SpectralGraphBounds 1.1 (`adjEigenvalues`).

## Layer 2: discrepancy and counting

### 2.1 DISC′ implies DISC

Prove `isDisc_of_isDiscSelf`: if `IsDiscSelf G p ε`, then `IsDisc G p (2ε)` (Zhao, proof that
DISC′ implies DISC after Theorem 3.1.1, p. 96).

Route: write `A = X \ Y`, `B = X ∩ Y`, `C = Y \ X`, and `D(S) = e(S, S) − p|S|²`. Since
`e(X, Y) = ∑_{x ∈ X} ∑_{y ∈ Y} 1[x ~ y]` (Mathlib's `SimpleGraph.interedges_def`) is additive
over disjoint unions in each argument and symmetric, the polarization identity
`2 e(X, Y) = e(X ∪ Y, X ∪ Y) + e(B, B) − e(A, A) − e(C, C)` holds, and the same identity holds for
`|X||Y|` (the complete count: `(a + b + c)² + b² − a² − c² = 2(a + b)(b + c)`). Subtracting,
`2(e(X, Y) − p|X||Y|) = D(X ∪ Y) + D(B) − D(A) − D(C)`, and each `|D(S)| ≤ ε n²`.

**Checks.**
- The polarization identity on `K₄` with `X = {1, 2, 3}`, `Y = {2, 3, 4}`: `e(X, Y) = 9 − 2 = 7`;
  the right-hand side is `12 + 2 − 0 − 0 = 14`.
- On one vertex with `p = 1` both DISC′ and DISC have least tolerance `1`, within the factor `2`.

*Needs:* Mathlib `SimpleGraph.interedges_def`. (Proved here, following the cited route.)

### 2.2 DISC implies COUNT

Prove `abs_homDensityFin_sub_pow_le_of_isDisc`: on a nonempty vertex type, if `IsDisc G p δ`,
then for every finite graph `F` (on any `Fintype`) with `e(F)` edges,
`|t(F, G) − p^e(F)| ≤ e(F) δ` (Zhao, Theorem 3.1.1, DISC ⇒ COUNT, whose proof, p. 96, is deferred
to the counting lemma, Theorem 4.5.1, p. 144).

Route, through DenseGraphLimits:
1. Transport `G` to the graph `G' = G.overFin rfl` on `Fin n`, `n ≥ 1`, with the isomorphism
   `e = G.overFinIso rfl : G ≃g G'` (Mathlib `SimpleGraph.overFin`, `SimpleGraph.overFinIso`).
   Composition with `e` and with `e.symm` (`SimpleGraph.Hom.comp`) are mutually inverse maps
   `(F →g G) ≃ (F →g G')`, so `Nat.card_congr` gives equal homomorphism counts, and
   `t(F, G) = t(F, G')` because both hosts have `n` vertices. For finsets `X'`, `Y'` of `Fin n`,
   `(x, y) ↦ (e.symm x, e.symm y)` is a bijection from `G'.interedges X' Y'` onto
   `G.interedges (X'.map e.symm) (Y'.map e.symm)` (`SimpleGraph.Iso.map_adj_iff`,
   `Finset.card_bij`), and `e.symm` preserves the cardinalities of `X'` and `Y'`, so `G'`
   satisfies DISC with tolerance `δ`.
2. On the uniform carrier `(Fin n, uniformOn univ)`, let `U = finiteGraphGraphonOnFin G'` and `W`
   the constant graphon `Graphon.const _ p`. By `finiteGraphGraphon_eq_comap`, `homDensity_comap`
   with `TauCeti.unitInterval.measurePreserving_cellFin`, and `homDensity_finiteGraphGraphon`,
   `t(F, U) = t(F, G')`; by `homDensity_const`, `t(F, W) = p^e(F)`.
3. Every subset of `Fin n` is a finset. By `SymmKernel.rectIntegral_uniformOn_univ`,
   `finiteGraphGraphonOnFin_apply` and `Graphon.const_apply`, the integral of `U − W` over
   `S × T` is `(e(S, T) − p|S||T|)/n²`, so DISC gives `|·| ≤ δ` for every rectangle, and
   `cutNorm_le_iff` gives `cutNorm (U − W) ≤ δ`. (So on the uniform carrier DISC with tolerance
   `δ` is exactly `cutNorm (U − W) ≤ δ`.)
4. The counting lemma `counting_lemma` gives `|t(F, U) − t(F, W)| ≤ e(F) cutNorm (U − W)`.

The labelled-copy form of the source follows with the additional error `C(v(F), 2)/n` from
`homDensityFin_sub_injHomDensity_le`; it is not stated separately. COUNT ⇒ C4 is the case
`F = C₄`, read as `t(C₄, G) ≤ p⁴ + 4δ`.

**Checks.**
- The empty vertex type is excluded: there DISC holds with `δ = 0` (every term is `0`), while
  for the pattern with one vertex and no edges `t(F, G) = 0/0^1 = 0` and `p^0 = 1`.
- `K₄` with `p = 1`, `δ = 1/4`: for the triangle, `t(K₃, K₄) = 24/64 = 3/8` and
  `|3/8 − 1| = 5/8 ≤ 3/4`; for `C₄`, `t = 84/256 = 21/64` and `|21/64 − 1| = 43/64 ≤ 1`.
- The graph on one vertex, `p = 1/2`: DISC holds with `δ = 1/2` (only `X = Y = V` is nonzero);
  for `K₂`, `|0 − 1/2| = 1/2 = e(K₂) δ`, so the bound is attained.

*Needs:* Mathlib `SimpleGraph.overFin`, `SimpleGraph.overFinIso`, `SimpleGraph.Hom.comp`,
`Nat.card_congr`, `SimpleGraph.Iso.map_adj_iff`, `Finset.card_bij`; Tau Ceti `homDensityFin`,
`finiteGraphGraphonOnFin`, `finiteGraphGraphonOnFin_apply`, `finiteGraphGraphon_eq_comap`,
`homDensity_comap`, `TauCeti.unitInterval.measurePreserving_cellFin`,
`homDensity_finiteGraphGraphon`, `Graphon.const`, `Graphon.const_apply`, `homDensity_const`,
`SymmKernel.rectIntegral_uniformOn_univ`, `cutNorm_le_iff`, `counting_lemma`; 1.1. (Proved here,
following the cited route.)

### Examples

`K₄` at `p = 1`; the graph on one vertex; the pattern with one vertex and no edges.

### Dependencies

Layer 1; Tau Ceti DenseGraphLimits (counting lemma, cut norm, finite graphs as graphons).

## Layer 3: codegrees

### 3.1 C4 implies CODEG

Prove `isCodeg_of_cycleGraph_four`: if `p − δ ≤ t(K₂, G)` and `t(C₄, G) ≤ p⁴ + δ`, then
`IsCodeg G p (√(5δ))` (Zhao, proof that C4 implies CODEG, p. 96, with explicit constants).

Route: let `c_uv = codeg(u, v)`. By 1.2, `∑ c_uv² = t(C₄, G) n⁴ ≤ (p⁴ + δ) n⁴` and
`∑ c_uv = ∑ (deg x)² ≥ (∑ deg x)²/n = t(K₂, G)² n³` (Cauchy–Schwarz, Mathlib's
`sq_sum_le_card_mul_sum_sq`; `∑ deg x = 2|E| = t(K₂, G) n²` by
`SimpleGraph.sum_degrees_eq_twice_card_edges` and `homDensityFin_top_fin_two`). Hence
`∑ (c_uv − p² n)² ≤ n⁴ (2p⁴ + δ − 2p² t(K₂, G)²)`. If `p ≤ δ`, use `t(K₂, G)² ≥ 0` and
`2p⁴ ≤ 2p³δ`; otherwise `t(K₂, G) ≥ p − δ > 0` and `p² − (p − δ)² = δ(2p − δ)`. In both cases,
for `δ ≥ 0`, the sum of squares is at most `(1 + 4p³) δ n⁴ ≤ 5δ n⁴`, and Cauchy–Schwarz over the
`n²` pairs gives `∑ |c_uv − p² n| ≤ √(5δ) n³`. For `δ < 0` the second case applies and bounds the
sum of squares by `δ(1 + 2p²(2p − δ)) n⁴ < 0` unless `n = 0`, where the statement is trivial.

**Checks.**
- `K₄` with `p = 3/4`: `t(K₂) = 3/4`, `t(C₄) = 21/64 = 84/256` and `p⁴ = 81/256`, so `δ = 3/256`
  satisfies both hypotheses; the CODEG sum is `3/32` (1.2) and `3/32 ≤ √(15/256) = √15/16`.
- The edge-density hypothesis is needed: the graph on one vertex with `p = 1`, `δ = 0` has
  `t(C₄) = 0 ≤ 1`, but its CODEG sum is `1 > 0`.

*Needs:* 1.2; Mathlib `sq_sum_le_card_mul_sum_sq`, `SimpleGraph.sum_degrees_eq_twice_card_edges`,
`SimpleGraph.cycleGraph_adj`; Tau Ceti `homDensityFin_top_fin_two`, `homDensityFin_def`,
`SimpleGraph.card_hom_eq_card_adjPreservingMaps`. (Proved here, following the cited route.)

### 3.2 CODEG implies DISC

Prove `isDisc_of_isCodeg`: if `p − δ ≤ t(K₂, G)` and `IsCodeg G p δ`, then
`IsDisc G p (√(δ + 2√(3δ)))` (Zhao, proof that CODEG implies DISC, p. 97, with explicit
constants). The edge-density hypothesis is the standing hypothesis of the source theorem, and the
route uses it to centre the degrees.

Route: for `n = 0` the conclusion is trivial, and for `n ≥ 1` CODEG forces `δ ≥ 0`.
1. Degrees: `∑ u, (deg u − p n)² = ∑ c_uv − 2p n · t(K₂, G) n² + p² n³`. By CODEG
   `∑ c_uv ≤ (p² + δ) n³`, and `p ≥ 0` with `t(K₂, G) ≥ p − δ` gives the bound
   `δ(1 + 2p) n³ ≤ 3δ n³`. By Cauchy–Schwarz, `∑ u, |deg u − p n| ≤ √(3δ) n²`.
2. For finsets `X`, `Y` let `d_Y(x) = |N(x) ∩ Y|`. Then
   `e(X, Y) − p|X||Y| = ∑_{x ∈ X} (d_Y(x) − p|Y|)`, so by Cauchy–Schwarz and enlarging the sum of
   squares to all of `V`, `(e(X, Y) − p|X||Y|)² ≤ n ∑_{x ∈ V} (d_Y(x) − p|Y|)²`.
3. `∑_x d_Y(x)² = ∑_{y, y' ∈ Y} c_yy' ≤ p² n |Y|² + δ n³` (CODEG restricted to `Y × Y`), and
   `∑_x d_Y(x) = ∑_{y ∈ Y} deg y ≥ p n |Y| − √(3δ) n²` (step 1). Hence
   `∑_x (d_Y(x) − p|Y|)² ≤ δ n³ + 2p|Y| √(3δ) n² ≤ (δ + 2√(3δ)) n³`.

**Checks.**
- `K₄` with `p = 3/4`: the CODEG sum gives `δ = 3/32`, the bound is
  `√(3/32 + 2√(9/32)) > 1`, and the true least DISC tolerance is `1/16`; the bound is far from
  sharp but correct.
- The empty graph on `n` vertices with `p = 0` satisfies CODEG with `δ = 0` and DISC with
  tolerance `0`, matching `√(0 + 0) = 0`.

*Needs:* 1.1, 1.2; Mathlib `sq_sum_le_card_mul_sum_sq`,
`SimpleGraph.sum_degrees_eq_twice_card_edges`; Tau Ceti `homDensityFin_top_fin_two`. (Proved
here, following the cited route.)

### Examples

`K₄` at `p = 3/4`; the graph on one vertex; empty graphs at `p = 0`.

### Dependencies

Layer 1; Tau Ceti DenseGraphLimits (`homDensityFin`).

## Layer 4: eigenvalues

### 4.1 The trace formula

Prove `card_hom_cycleGraph_eq_sum_pow`: for `k ≥ 2`, the number of homomorphisms
`cycleGraph k →g G` is `∑ᵢ λᵢ^k` (Zhao, Remark 3.1.18, p. 98: `tr A^k = ∑ λᵢ^k` counts closed
walks of length `k`).

Route: the trace identity `tr A^k = ∑ᵥ λᵥ^k` for a Hermitian matrix is Tau Ceti's
`Matrix.IsHermitian.trace_pow_eq_sum_eigenvalues_pow` (proved there from Mathlib's
`Matrix.IsHermitian.spectral_theorem`), stated for Mathlib's vertex-indexed
`Matrix.IsHermitian.eigenvalues`, which is `eigenvalues₀` reindexed by an equivalence, so the
sum over `Fin n` of `adjEigenvalues G i ^ k` is the same sum. What 4.1 adds is the
identification of the left side with homomorphisms of the cycle. The diagonal entry
`(A^k)_vv` counts closed walks of length `k` at `v`
(`SimpleGraph.adjMatrix_pow_apply_eq_card_walk`).
For `k ≥ 2`, `cycleGraph k` on `Fin k` has `i ~ i + 1` for every `i` (`SimpleGraph.cycleGraph_adj`;
for `k = 2` it is `⊤` on `Fin 2`), so a homomorphism is exactly a closed walk
`f 0, f 1, …, f (k − 1), f 0`, through Tau Ceti's `SimpleGraph.card_hom_eq_card_adjPreservingMaps`.

**Checks.**
- `K₄`: `hom(C₄, K₄) = 84 = 3⁴ + 3 · 1`; the plausible wrong variant counting labelled 4-cycles
  (injective homomorphisms) gives `4! = 24`.
- `K_(1,3)`: `hom(C₃) = 0 = (√3)³ + (−√3)³` and `hom(C₄) = 18 = 9 + 9`.
- `k = 2`: `hom(K₂, G) = 2|E| = ∑ λᵢ²`. The bound `k ≥ 2` is needed: `cycleGraph 1` is one
  vertex without edges, with `n` homomorphisms, while `∑ λᵢ = tr A = 0`.

*Needs:* 1.3; Mathlib `Matrix.IsHermitian.eigenvalues`,
`SimpleGraph.adjMatrix_pow_apply_eq_card_walk`, `SimpleGraph.cycleGraph_adj`,
`SimpleGraph.cycleGraph_two_eq_top`; Tau Ceti `Matrix.IsHermitian.trace_pow_eq_sum_eigenvalues_pow`,
`SimpleGraph.card_hom_eq_card_adjPreservingMaps`. (Proved here, following the cited route.)

### 4.2 C4 implies EIG

Prove `isEig_of_cycleGraph_four`: if `p − δ ≤ t(K₂, G)` and `t(C₄, G) ≤ p⁴ + δ`, then
`IsEig G p ((5δ)^(1/4))` (Zhao, proof that C4 implies EIG and Lemma 3.1.20, p. 99, with explicit
constants; no regularity is assumed, as in the source).

Route: for `n = 0` the condition is empty. Let `λ₁` be the eigenvalue at index `0`, which is
SpectralGraphBounds' `largestEigenvalue G`. SpectralGraphBounds 1.2 `two_mul_card_edgeFinset_le`
gives `2|E| ≤ n λ₁`, so `λ₁ ≥ t(K₂, G) n ≥ 0` and `λ₁ ≥ (p − δ) n`. By 4.1 with `k = 4`,
`∑ λᵢ⁴ = t(C₄, G) n⁴ ≤ (p⁴ + δ) n⁴`. If `δ < 0` then `λ₁ > p n ≥ 0` and `λ₁⁴ > (p⁴ + δ) n⁴`, a
contradiction, so `δ ≥ 0`. Then `λ₁ ≤ (p⁴ + δ)^(1/4) n ≤ (p + δ^(1/4)) n`, and
`λ₁ − p n ≥ −min(δ, p) n ≥ −min(δ, 1) n`; both `δ^(1/4)` and `min(δ, 1)` are at most
`(5δ)^(1/4)`. For `i ≠ 0`, `λᵢ⁴ ≤ (p⁴ + δ) n⁴ − λ₁⁴ ≤ (p⁴ + δ − max(p − δ, 0)⁴) n⁴ ≤ 5δ n⁴`,
because `p⁴ − max(p − δ, 0)⁴ ≤ 4δ` for `p ∈ [0, 1]` and `δ ≥ 0`.

**Checks.**
- `K_(1,3)` with `p = 3/8`: `t(C₄) − p⁴ = 18/256 − 81/4096 = 207/4096 = δ`; the bound
  `(5δ)^(1/4)` exceeds the least EIG tolerance `√3/4`, since their fourth powers are
  `1035/4096` and `9/256 = 144/4096`.
- The edge-density hypothesis is needed (Check of 1.3: one vertex, `p = 1`, `δ = 0`).

*Needs:* 4.1, 1.3; SpectralGraphBounds 1.2 (`two_mul_card_edgeFinset_le`, stated for
`largestEigenvalue`, which is `adjEigenvalues` at index `0`); Tau Ceti `homDensityFin_top_fin_two`,
`homDensityFin_def`. (Proved here, following the cited route.)

### 4.3 EIG implies C4

Prove `homDensityFin_cycleGraph_four_le_of_isEig`: if `IsEig G p δ`, then
`t(C₄, G) ≤ (p + δ)⁴ + δ²` (Zhao, proof that EIG implies C4, pp. 98–99, with explicit constants).

Route: for `n = 0`, `t(C₄, G) = 0` (no homomorphism from a nonempty pattern, divided by `0`).
For `n ≥ 1`, `λ₁ ≥ 0` (SpectralGraphBounds 1.2 `two_mul_card_edgeFinset_le`) and
`λ₁ ≤ (p + δ) n`, so `λ₁⁴ ≤ (p + δ)⁴ n⁴`. For `i ≠ 0`, `λᵢ² ≤ δ² n²`, so
`∑_{i ≠ 0} λᵢ⁴ ≤ δ² n² ∑ λᵢ² = δ² n² · 2|E| ≤ δ² n⁴` by 4.1 with `k = 2` and `2|E| ≤ n²`. Add, and
use 4.1 with `k = 4`. (Using `∑ λᵢ²`, not `n` times the largest `λᵢ⁴`, is what keeps the error of
order `n⁴`; the source's Remark 3.1.19 makes the same point.)

**Checks.**
- `K₄` with `p = 1` and `δ = 1/4` (1.3): `t(C₄) = 21/64 ≤ (5/4)⁴ + 1/16 = 641/256`.
- The graph on one vertex with `p = 0`, `δ = 0`: both sides are `0`.

*Needs:* 4.1, 1.3; SpectralGraphBounds 1.2 (`two_mul_card_edgeFinset_le`); Tau Ceti
`homDensityFin_def`, `homDensityFin_top_fin_two`. (Proved here, following the cited route.)

### Examples

`K₄`, the star `K_(1,3)` (not regular), and the graph on one vertex.

### Dependencies

Layer 1; SpectralGraphBounds 1.1–1.2; Tau Ceti DenseGraphLimits (`homDensityFin`) and the trace
of powers of a Hermitian matrix (`Matrix.IsHermitian.trace_pow_eq_sum_eigenvalues_pow`).

## Layer 5: graphons and random graphs

### 5.1 The 4-cycle forces the constant graphon

Prove `homDensity_cycleGraph_four_eq_pow_iff`: for a graphon `W` on a probability space
`(Ω, μ)`, `t(C₄, W) = t(K₂, W)⁴` if and only if `W(x, y) = t(K₂, W)` for `μ ⊗ μ`-almost every
`(x, y)`. Zhao states that `C₄` is forcing in this sense (Definition 5.0.6 and the paragraph
after it, p. 165) without printing a proof; the route below is complete.

Route: let `c = t(K₂, W)`, `d(x) = ∫ W(x, y) dμ(y)` and `s(x, y) = ∫ W(x, z) W(z, y) dμ(z)`.
By `homDensity_cycleGraph_four` and Fubini, `t(C₄, W) = ∬ s²`, and `∬ s = ∫ d²` by symmetry;
Cauchy–Schwarz gives `c⁴ ≤ (∫ d²)² ≤ ∬ s²`, the proof of `sidorenko_cycleGraph_four`.
- (⇒) Equality forces `∫ d² = c²` and `∬ s² = (∬ s)²`, so `∫ (d − c)² = 0` and
  `∬ (s − c²)² = 0`: `d = c` almost everywhere and `s = c²` almost everywhere on `Ω × Ω`. Put
  `U = W − c`. Then `∫ U(x, z) U(z, y) dz = s(x, y) − c d(x) − c d(y) + c² = 0` for almost every
  `(x, y)`. For a measurable `S`, the function `g(z) = ∫_S U(x, z) dx` has
  `∫ g² = ∬_{S × S} ∫ U(x, z) U(z, y) dz = 0`, so `g = 0` almost everywhere and
  `∫_{S × T} U = 0` for every measurable `T`. The finite measures `(μ ⊗ μ)` with densities `U⁺`
  and `U⁻` therefore agree on measurable rectangles, a π-system generating the product σ-algebra
  (Mathlib's `generateFrom_prod`, `isPiSystem_prod`), and on `Ω × Ω`; by
  `MeasureTheory.ext_of_generate_finite` they are equal, so `U⁺ = U⁻` almost everywhere
  (`MeasureTheory.withDensity_eq_iff`), hence `U = 0` almost everywhere.
- (⇐) If `W = c` almost everywhere on `Ω × Ω`, then `W` agrees almost everywhere with
  `Graphon.const μ c` (`c ∈ [0, 1]`), so Tau Ceti's `homDensity_congr_ae` and `homDensity_const`
  give `t(C₄, W) = c⁴`.

**Checks.**
- The constant graphon `p` has `t(C₄) = p⁴` and `t(K₂) = p` (`homDensity_const`).
- The graphon on `[0, 1]` equal to `1` on `[0, 1/2)² ∪ [1/2, 1]²` and `0` elsewhere (two equal
  cliques) has `t(K₂) = 1/2` and `t(C₄) = 2 · (1/2)⁴ = 1/8 ≠ 1/16`.
- Changing a constant graphon on the diagonal, a null set for Lebesgue measure on `[0, 1]²`,
  changes neither side: the conclusion is almost everywhere, not pointwise.

*Needs:* Tau Ceti `Graphon`, `homDensity`, `homDensity_cycleGraph_four`, `homDensity_const`,
`homDensity_congr_ae`, `sidorenko_cycleGraph_four` (its route; the degree and two-step identities it uses are private
to `Applications.lean` and are reproved here from `homDensity_cycleGraph_four` and Fubini);
Mathlib `MeasureTheory.integral_prod`,
`MeasureTheory.integral_eq_zero_iff_of_nonneg`, `generateFrom_prod`, `isPiSystem_prod`,
`MeasureTheory.ext_of_generate_finite`, `MeasureTheory.withDensity_eq_iff`. (Proved here.)

### 5.2 Random graphs are quasirandom

Prove `ae_eventually_isDisc_of_hasLaw_binomialRandom`: let `(Ω, P)` be a probability space and
`Gs n : Ω → SimpleGraph (Fin n)` random graphs with law Mathlib's `binomialRandom (Fin n) p`
(`HasLaw`); no independence between different `n` is assumed. Then for `P`-almost every `ω`,
for every `ε > 0`, `Gs n ω` satisfies DISC with tolerance `ε` for all large `n` (Zhao,
Corollary 3.1.9, p. 94; the source's route is a Chernoff bound, Proposition 3.1.8, p. 93).

Route, through 3.1, 3.2 and Tau Ceti's sampling theory:
1. Choose `δ_k ∈ (0, 1]` with `φ(δ_k) ≤ 1/(k + 1)`, where
   `φ(δ) = √(√(5δ) + 2√(3√(5δ)))` → `0` as `δ → 0`. If `|t(K₂, G) − p| < δ` and
   `|t(C₄, G) − p⁴| < δ`, then 3.1 gives CODEG with tolerance `√(5δ)`, and 3.2 (with `√(5δ)` in
   place of `δ`, using `δ ≤ √(5δ)`) gives DISC with tolerance `φ(δ)`.
2. `sampleGraph (Graphon.const volume p) n = binomialRandom (Fin n) p` (`sampleGraph_const`), and
   the constant graphon has `t(K₂) = p`, `t(C₄) = p⁴` (`homDensity_const`). By
   `sampleGraph_homDensityFin_concentration`, for `n ≥ 32/δ` the probability that
   `|t(K₂, G) − p| ≥ δ` or `|t(C₄, G) − p⁴| ≥ δ` is at most
   `2 exp(−δ² n/8) + 2 exp(−δ² n/32)`; the two sequences of probabilities have finite sums by
   `SimpleGraph.tsum_sampleGraph_homDensityFin_tail_ne_top` (indexed by `n + 1`).
3. Every subset of `SimpleGraph (Fin n)` is measurable (Mathlib's σ-algebra on simple graphs is
   pulled back along `Adj`; singletons are measurable by Tau Ceti's instance
   `SimpleGraph.instMeasurableSingletonClass`, so on this finite type the σ-algebra is discrete:
   `MeasurableSet.of_discrete`), so `HasLaw` transfers these bounds to `P`
   (`MeasureTheory.Measure.map_apply_of_aemeasurable`). Borel–Cantelli
   (`MeasureTheory.ae_eventually_notMem`, from `MeasureTheory.measure_limsup_atTop_eq_zero`)
   gives, for each `k`, almost surely DISC with tolerance `1/(k + 1)` for all large `n`; intersect
   over `k` (`MeasureTheory.ae_all_iff`) and use that DISC is monotone in the tolerance.

**Checks.**
- `p = 0`: `binomialRandom (Fin n) 0` is the point mass at the empty graph, which satisfies DISC
  with tolerance `0`.
- `p = 1`: the law is the point mass at `Kₙ`, whose least DISC tolerance is `1/n` (1.1); so DISC
  with tolerance `ε` holds only for `n ≥ 1/ε`, which is why the statement is "for all large `n`".

*Needs:* 3.1, 3.2; Mathlib `SimpleGraph.binomialRandom`, `ProbabilityTheory.HasLaw`,
`MeasureTheory.Measure.map_apply_of_aemeasurable`, `MeasurableSet.of_discrete`,
`MeasureTheory.measure_limsup_atTop_eq_zero`, `MeasureTheory.ae_eventually_notMem`,
`MeasureTheory.ae_all_iff`; Tau Ceti `sampleGraph_const`,
`sampleGraph_homDensityFin_concentration`, `SimpleGraph.tsum_sampleGraph_homDensityFin_tail_ne_top`,
`SimpleGraph.instMeasurableSingletonClass`, `homDensity_const`, `Graphon.const`. (Proved here,
following the cited route.)

For the one joint realization given by the nested windows of Tau Ceti's infinite sample of the
constant graphon (`infiniteSampleLaw`, whose window on `Fin n` has law `G(n, p)` by
`infiniteSampleLaw_map_restrictFin` and `sampleGraph_const`), the conclusion already follows from
Tau Ceti's `infiniteSampleLaw_ae_tendsto_cutDist`: by `cutDist_const_right` the cut distance to
the constant graphon is a cut norm, which after the pullback to the uniform carrier on `Fin n`
(`finiteGraphGraphon_eq_comap`, `cutNorm_comap`) bounds the DISC tolerance by step 3 of 2.2.
5.2 makes no assumption on how the graphs `Gs n` are coupled, which is why it goes through
summable tail bounds of the marginal laws.

### Examples

The constant graphon, the two-clique graphon, and `G(n, p)` at `p = 0` and `p = 1`.

### Dependencies

Layer 3 (5.2); Tau Ceti DenseGraphLimits (graphons, homomorphism densities, sampling); Mathlib
(binomial random graphs, Borel–Cantelli).

## Scope and ownership

This roadmap owns the five quasirandom properties as predicates of a single graph above
(`IsDisc`, `IsDiscSelf`, `IsCodeg`, `IsEig`, and C4 through Tau Ceti's 4-cycle density), the
explicit implications between them, the trace formula for cycle homomorphisms, the graphon form
of the C4 condition, and the almost sure quasirandomness of `G(n, p)`.

- **DenseGraphLimits** (completed; in Tau Ceti) owns homomorphism densities of finite graphs and
  graphons, the cut norm and cut distance, the counting lemma, finite graphs as graphons, and the
  concentration of sampled densities; 2.2 and 5.2 use them and restate none. The minimum 4-cycle
  density of a finite graph, `t(C₄, G) ≥ t(K₂, G)⁴` (Zhao, Proposition 3.1.14), is Tau Ceti's
  `sidorenko_cycleGraph_four` read through `homDensity_finiteGraphGraphon`, and is not restated;
  with it, for `δ ≥ 0`, the hypotheses `t(C₄, G) ≤ p⁴ + δ` and `t(K₂, G) ≥ p − δ` give
  `|t(C₄, G) − p⁴| ≤ 4δ`, the two-sided form of the source's Remark 3.1.4 (p. 93). The almost
  sure cut-distance convergence of the nested windows of an infinite graphon sample
  (`infiniteSampleLaw_ae_tendsto_cutDist`) and its in-probability form for `G(n, W)`
  (`sampleGraph_cutDist_tendsto_inProbability`) are Tau Ceti's; for the constant graphon they
  give DISC with probability tending to `1`, and almost surely for that one joint realization of
  `G(n, p)`, as said after 5.2; neither is restated.
- Tau Ceti's `Matrix.IsHermitian.trace_pow_eq_sum_eigenvalues_pow` (the trace of `A^k` is the
  sum of the `k`-th powers of the eigenvalues) is used in 4.1 and not restated; 4.1 identifies
  that trace for the adjacency matrix with the number of homomorphisms from the `k`-cycle.
- Tau Ceti's cut discrepancy `SimpleGraph.cutDiscrepancy` of a partition is the finite
  weak-regularity error; for the one-part partition it is the DISC deviation at the graph's own
  edge density (1.1).
- **SpectralGraphBounds** owns the sorted adjacency eigenvalues (1.1; `adjEigenvalues` is copied
  verbatim) and the bounds on the largest eigenvalue (1.2), used in 4.2 and 4.3. Its 1.1 lists
  the case `k = 2` of the trace formula (`∑ λᵢ² = 2|E|`) among the API of its eigenvalues; 4.1
  is the formula for every `k ≥ 2`, of which that is the special case. For regular graphs, its
  expander mixing lemma `abs_card_interedges_sub_le` (4.1 there) gives DISC with tolerance `β/n`
  directly from a bound `β` on the nontrivial eigenvalues; that one-step consequence is not
  restated, and 4.2–4.3 and Layer 3 give the passage between EIG and DISC for graphs that need not
  be regular.
- Not treated here: explicit families of quasirandom graphs (Cayley graphs, graphs from finite
  geometry and quadratic residues), the bipartite form of the equivalences and the double cover,
  sparse quasirandomness, forcing graphs other than `C₄` and the forcing conjecture, quasirandom
  groups and hypergraphs, the sharper tail bound for discrepancy in `G(n, p)` obtained from
  Chernoff's inequality, and first-order properties and zero–one laws of `G(n, p)`.

## Exact supplier contracts

### From Mathlib

- `SimpleGraph.interedges`, `SimpleGraph.interedges_def`
  (`Mathlib/Combinatorics/SimpleGraph/Density.lean`): `G.interedges s t` is the finset of pairs
  in `s ×ˢ t` that are adjacent.
- `SimpleGraph.neighborFinset` (`Mathlib/Combinatorics/SimpleGraph/Finite.lean`).
- `SimpleGraph.cycleGraph`, `SimpleGraph.cycleGraph_adj`, `SimpleGraph.cycleGraph_two_eq_top`
  (`Mathlib/Combinatorics/SimpleGraph/CycleGraph.lean`): on `Fin (k + 2)`, `u ~ v` iff
  `u − v = 1` or `v − u = 1`; `cycleGraph 2` is `⊤` and `cycleGraph 1` has no edge.
- `SimpleGraph.adjMatrix`, `SimpleGraph.adjMatrix_pow_apply_eq_card_walk`
  (`Mathlib/Combinatorics/SimpleGraph/AdjMatrix.lean`); `SimpleGraph.isHermitian_adjMatrix`
  (`Mathlib/Combinatorics/SimpleGraph/LapMatrix.lean`).
- `Matrix.IsHermitian.eigenvalues₀`, `Matrix.IsHermitian.eigenvalues`,
  `Matrix.IsHermitian.spectral_theorem` (`Mathlib/Analysis/Matrix/Spectrum.lean`).
- `SimpleGraph.sum_degrees_eq_twice_card_edges`
  (`Mathlib/Combinatorics/SimpleGraph/DegreeSum.lean`); `sq_sum_le_card_mul_sum_sq`
  (`Mathlib/Algebra/Order/Chebyshev.lean`): `(∑ f)² ≤ |s| ∑ f²`.
- `SimpleGraph.overFin`, `SimpleGraph.overFinIso` (`Mathlib/Combinatorics/SimpleGraph/Maps.lean`):
  a graph on a finite type is isomorphic to a graph on `Fin n`; `SimpleGraph.Iso.map_adj_iff`,
  `SimpleGraph.Hom.comp`, `Nat.card_congr`, `Finset.card_bij`.
- `SimpleGraph.edgeDensity` (`Mathlib/Combinatorics/SimpleGraph/Density.lean`).
- `SimpleGraph.binomialRandom`
  (`Mathlib/Probability/Combinatorics/BinomialRandomGraph/Defs.lean`): the law `G(V, p)` for
  `p : unitInterval`; `ProbabilityTheory.HasLaw` (`Mathlib/Probability/HasLaw.lean`): `X` is
  a.e.-measurable and `P.map X = μ`.
- `MeasureTheory.measure_limsup_atTop_eq_zero`, `MeasureTheory.ae_eventually_notMem`
  (`Mathlib/MeasureTheory/OuterMeasure/BorelCantelli.lean`): summable measures give a null limsup;
  `MeasureTheory.ae_all_iff` (`Mathlib/MeasureTheory/OuterMeasure/AE.lean`);
  `MeasureTheory.Measure.map_apply_of_aemeasurable` (`Mathlib/MeasureTheory/Measure/Map.lean`);
  `MeasurableSet.of_discrete` (`Mathlib/MeasureTheory/MeasurableSpace/Defs.lean`).
- `MeasureTheory.ext_of_generate_finite`
  (`Mathlib/MeasureTheory/Measure/Typeclasses/Finite.lean`); `generateFrom_prod`,
  `isPiSystem_prod` (`Mathlib/MeasureTheory/MeasurableSpace/Prod.lean`);
  `MeasureTheory.withDensity_eq_iff` (`Mathlib/MeasureTheory/Function/AEEqOfLIntegral.lean`);
  `MeasureTheory.integral_prod`
  (`Mathlib/MeasureTheory/Integral/Prod.lean`); `MeasureTheory.integral_eq_zero_iff_of_nonneg`
  (`Mathlib/MeasureTheory/Integral/Bochner/Basic.lean`).

### From Tau Ceti

Names that begin with `SimpleGraph.`, `Matrix.` or `TauCeti.` are full names; the others are in
namespace `TauCeti.DenseGraphLimits`. Files are under `TauCeti/Combinatorics/DenseGraphLimits/`
unless stated.

- `homDensityFin`, `homDensityFin_def`, `homDensityFin_top_fin_two` (`HomDensity/Finite.lean`):
  `t(F, G) = |Hom(F, G)| / n^v(F)` on any finite host, and `t(K₂, G) = 2|E|/n²`;
  `homDensityFin_sub_injHomDensity_le` (`HomDensity/Closeness.lean`).
- `Graphon`, `Graphon.const`, `Graphon.const_apply` (`Graphon/Basic.lean`); `homDensity`,
  `homDensity_const` (`HomDensity/Basic.lean`): `t(F, const p) = p^e(F)`;
  `homDensity_cycleGraph_four` (`HomDensity/SmallGraphs.lean`); `homDensity_comap`
  (`HomDensity/Pullback.lean`): densities are invariant under measure-preserving pullback;
  `homDensity_congr_ae` (`AEEqFun/Basic.lean`): graphons equal `μ ⊗ μ`-almost everywhere have
  the same densities.
- `cutNorm`, `cutNorm_le_iff` (`Kernel/CutNorm.lean`); `SymmKernel.rectIntegral_uniformOn_univ`
  (`Kernel/Integral.lean`): on a uniform finite carrier a rectangle integral is the sum over the
  rectangle divided by the square of the number of points.
- `counting_lemma` (`Counting.lean`): `|t(F, U) − t(F, W)| ≤ e(F) · cutNorm (U − W)` on one
  probability carrier.
- `sidorenko_cycleGraph_four` (`Applications.lean`): `t(C₄, W) ≥ t(K₂, W)⁴` on every probability
  carrier.
- `finiteGraphGraphonOnFin`, `finiteGraphGraphonOnFin_apply`, `finiteGraphGraphon_eq_comap`,
  `homDensity_finiteGraphGraphon` (`StepGraphon/FiniteGraph/Basic.lean`): for `0 < m` and `G` on
  `Fin m`, the graphon density of `F` in the graph's graphon is `homDensityFin F G`.
- `TauCeti.unitInterval.measurePreserving_cellFin`
  (`TauCeti/MeasureTheory/Constructions/UnitInterval.lean`).
- `sampleGraph_const` (`Sampling/Finite.lean`): sampling the constant graphon `p` on `n` vertices
  is `binomialRandom (Fin n) p`; `sampleGraph_homDensityFin_concentration`
  (`Sampling/Concentration.lean`): for `F` with `q` vertices, `ε > 0` and `2q² ≤ εn`,
  `P(|t(F, G(n, W)) − t(F, W)| ≥ ε) ≤ 2 exp(−ε²n/(2q²))`;
  `SimpleGraph.tsum_sampleGraph_homDensityFin_tail_ne_top` (`Sampling/Summability.lean`): for
  `ε > 0` these probabilities, at `n + 1` vertices, have finite sum.
- `infiniteSampleLaw`, `infiniteSampleLaw_map_restrictFin` (`Sampling/Infinite.lean`);
  `infiniteSampleLaw_ae_tendsto_cutDist` (`Sampling/AlmostSure/CutDistance.lean`);
  `sampleGraph_cutDist_tendsto_inProbability` (`Sampling/CutDistance.lean`); `cutDist_const_right`
  (`CutMetric/Constant.lean`): the cut distance to a constant graphon is a cut norm; `cutNorm_comap`
  (`Kernel/Pullback.lean`), `finiteGraphGraphon_eq_comap`. Cited in the
  scope above and after 5.2.
- `SimpleGraph.card_hom_eq_card_adjPreservingMaps`
  (`TauCeti/Combinatorics/SimpleGraph/Counting.lean`): homomorphisms are counted as
  adjacency-preserving maps; `SimpleGraph.instMeasurableSingletonClass`
  (`TauCeti/Combinatorics/SimpleGraph/Measurable.lean`): on a countable vertex type, singletons
  of simple graphs are measurable.
- `Matrix.IsHermitian.trace_pow_eq_sum_eigenvalues_pow` (`TauCeti/Analysis/Matrix/Spectrum.lean`):
  `tr B^k = ∑ λᵥ^k` for a Hermitian matrix `B` and its vertex-indexed eigenvalues.
- `SimpleGraph.cutDiscrepancy`, `SimpleGraph.cutDiscrepancy_le_iff`, `SimpleGraph.steppedCount_top`
  (`TauCeti/Combinatorics/Regularity/Graph/CutDiscrepancy.lean`), cited in 1.1.

### From TauCetiRoadmap.SpectralGraphBounds

- 1.1: the definition `adjEigenvalues` (copied verbatim, with its `variable` line
  `{V : Type*} [Fintype V] [DecidableEq V]`), and `largestEigenvalue G`, its value at index `0`.
- 1.2: `two_mul_card_edgeFinset_le`: on a nonempty vertex type,
  `2|E| ≤ n · largestEigenvalue G`.

## References

- Y. Zhao, *Graph Theory and Additive Combinatorics: Exploring Structure and Randomness*,
  Cambridge University Press, 2023; author's version of 18 June 2024,
  https://yufeizhao.com/gtacbook/gtacbook.pdf (page numbers of that version): Theorem 3.1.1 and
  its proof, pp. 92–99 (the proof of each implication as cited above); Remark 3.1.6, p. 93;
  Proposition 3.1.8, p. 93; Corollary 3.1.9, p. 94; Proposition 3.1.14, p. 95; Remark 3.1.18,
  p. 98; Lemma 3.1.20 and Remark 3.1.19, p. 99; Theorem 4.5.1, p. 144; Definition 5.0.6, p. 165.
  Zhao attributes the equivalence theorem to Chung, Graham and Wilson (1989), with related ideas
  in Thomason (1987), and the forcing conjecture to Skokan and Thoma (2004) and Conlon, Fox and
  Sudakov (2010).

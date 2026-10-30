# Roadmap: coboundary expansion with group coefficients

A 1-cochain on a 2-complex with values in a group fails to be a coboundary to some extent,
measured by how far a gauge must move it, and it carries a triangle defect, the holonomy around
each triangle. The first coboundary Cheeger constant is the least ratio of defect to distance.
With `𝔽₂` coefficients this is the Linial–Meshulam constant; with permutation coefficients in the
normalized Hamming metric it is the constant of Chapman and Lubotzky, whose positivity on
bounded-degree complexes is their proposed route to non-sofic groups.

This roadmap develops that theory for an arbitrary group carrying a conjugation-invariant group
norm, then determines the constant of the complete complex `K_k`. The lower bound `k/3` holds for
every such group (Chapman–Lubotzky). For `𝔽₂` it is attained exactly when `k` is not a power of
two (Kozlov). For permutation coefficients it is attained for every `k ≥ 4`, already with values
in `Sym(3)` (Beasley). The proof of the last statement uses all of the layers below: a three-
transposition seed at `k = 4`, a balanced replication that multiplies the defect by `q³` and the
gauge distance by exactly `q²`, Kozlov's staircase witnesses, and a parity retraction.

Outside scope: cochains in degree other than 1; coboundary expansion of infinite or random
complexes; cosystolic expansion of buildings and their quotients; the stability theory of
homomorphisms that Chapman and Lubotzky derive from these constants; and soficity. Graph Cheeger
constants (degree 0) appear only as the cut counts of Layer 7.

The README is definitive. [Suggested.lean](Suggested.lean) gives suggested, non-exhaustive
signatures, with `sorry` for unproved targets. The suggested home is
`TauCeti/Combinatorics/CoboundaryExpansion/`, with the norm material of Layer 1 under
`TauCeti/Algebra/Group/` and the permutation material under `TauCeti/GroupTheory/Perm/`.

## Conventions

All conventions below are fixed; contributors do not choose between alternatives.

**Norms.** Coefficients lie in a group `G` with a
[`GroupNorm G`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Analysis/Normed/Group/Seminorm.html#GroupNorm)
`ℓ` that is conjugation invariant: `ℓ (h * g * h⁻¹) = ℓ g`. Then `d g h = ℓ (g⁻¹ * h)` is a metric
invariant under left and right multiplication, and every bi-invariant metric arises this way from
`ℓ g = d 1 g`. Statements are made for `ℓ`, not for a metric instance on `G`. The permutation norm
is the moved-point count `movedNorm α σ = σ.support.card` on `Equiv.Perm α` for a finite type
`α`. The normalized Hamming metric is `movedNorm α (σ⁻¹ * τ) / Fintype.card α`; the normalization
cancels in every ratio below and is not carried.

**Complexes.** A finite 2-complex on a vertex type `V` is a set of 2-element `Finset`s (edges) and
a set of 3-element `Finset`s (triangles) whose 2-element subsets are edges. The complete complex
`complete V` on a finite type has every pair and every triple. Oriented quantities are evaluated
with a `LinearOrder` on `V`: an edge as `(u, v)` with `u < v`, a triangle as `(u, v, w)` with
`u < v < w`. Layer 2 proves that every quantity defined below is independent of the order.

**Cochains, defect and gauge.** A `G`-valued 1-cochain `α` assigns `α u v` to ordered pairs, with
`α v u = (α u v)⁻¹` on edges. Its holonomy on the triangle `u < v < w` is
`α u v * α v w * α w u`. A gauge is any `β : V → G`, acting by
`(β • α) u v = β u⁻¹ * α u v * β v`.

```text
N(α)     = Σ over triangles u<v<w   ℓ(α u v · α v w · α w u)          (the defect)
cost α β = Σ over edges u<v         ℓ(β u⁻¹ · α u v · β v)
D(α)     = ⨅ over gauges β          cost α β                           (the gauge distance)
```

`α` is a coboundary when `α u v = β u * (β v)⁻¹` on every edge for some `β`; this is the zero
set of `cost α β` in `β`. Chapman and Lubotzky write coboundaries as `β(u)⁻¹β(v)`; the two
conventions differ by `β ↦ β⁻¹` pointwise.

**The constant.** The counting-convention constant is

```text
h₁(X, ℓ) = inf { N(α) / D(α) : α a cochain with D(α) > 0 }.
```

For finite `G`, `D(α) > 0` exactly for non-coboundaries. The infimum is taken in `ℝ` with Mathlib's
`sInf`; theorems that need the set to be nonempty assume a cochain with `D > 0`. The normalized
constant, with uniform probability on edges and on triangles, is
`h₁ⁿᵒʳᵐ(X, ℓ) = (#edges / #triangles) · h₁(X, ℓ)`; on `complete V` with `k = card V` the factor is
`3/(k − 2)`, so `k/3` in the counting convention is `k/(k − 2)` in the normalized one. Every
headline below is stated in both.

**Permutation coefficients.** The same-degree permutation constant is
`h₁(X, Sym) = ⨅ n ≥ 1, h₁(X, movedNorm (Fin n))`. `𝔽₂` coefficients are `Equiv.Perm (Fin 2)` with
`movedNorm`, which is twice the indicator of a non-identity element; Layer 7 transports this to
edge sets. Chapman–Lubotzky's cross-degree convention is defined in Layer 9.

## Existing foundations

| Existing API | Use here |
| --- | --- |
| [`GroupNorm`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Analysis/Normed/Group/Seminorm.html#GroupNorm), `GroupSeminorm` | The coefficient norm `ℓ`. Layer 1 adds conjugation invariance and its consequences. |
| [`Equiv.Perm.support`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/GroupTheory/Perm/Support.html#Equiv.Perm.support), `Equiv.Perm.support_mul_le`, `Equiv.Perm.support_inv`, `Equiv.Perm.card_support_conj` | The moved-point norm and its conjugation invariance. |
| [`hammingDist`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/InformationTheory/Hamming.html#hammingDist) | The bridge from the moved-point norm to Hamming distance of functions. |
| [`Equiv.Perm.sign`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/GroupTheory/Perm/Sign.html#Equiv.Perm.sign), `Equiv.Perm.IsSwap` | The parity retraction of Layer 1. |
| `Finset.powersetCard`, `Finset.sum_comm`, `Finset.sum_le_sum`, `Finset.inf'` | The complete complex, the double counts of Layers 4 and 5, and the attained minimum for finite `G`. |
| `Prod.Lex`, `toLex`, `ofLex` | The vertex order on the replicated complex of Layer 5. |
| [`SimpleGraph`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Combinatorics/SimpleGraph/Basic.html#SimpleGraph), `SimpleGraph.fromRel`, `SimpleGraph.edgeFinset` | Edge sets and the staircase graphs of Layer 7. |

No Mathlib declaration or open Mathlib pull request defines coboundary expansion of a simplicial
complex or a group-valued Cheeger constant of a 2-complex.

## Layer 1: conjugation-invariant group norms

- Define `IsConjInvariant ℓ`. Prove: `d g h = ℓ (g⁻¹ * h)` is symmetric, satisfies the triangle
  inequality, vanishes exactly on the diagonal, and is invariant under left and right
  multiplication; `ℓ (g * h) = ℓ (h * g)`; `ℓ` of a product of `n` factors is invariant under
  cyclic rotation and under reversal with inversion of each factor. Conversely, a metric on `G`
  invariant under left and right multiplication gives a conjugation-invariant group norm
  `g ↦ d 1 g`.
- Conjugation-invariant norms restrict to subgroups, pull back along injective homomorphisms, and
  are closed under positive scalar multiples and under sums.
- Define `movedNorm α : GroupNorm (Equiv.Perm α)` for `[Fintype α] [DecidableEq α]` and prove it
  conjugation invariant. Prove `hammingDist ⇑σ ⇑τ = (σ⁻¹ * τ).support.card`. On `Fin 3` the values
  are `0` on the identity, `2` on transpositions and `3` on 3-cycles; on `Fin 2` the value is `2`
  off the identity. Every odd permutation has `movedNorm ≥ 2`.
- **Parity retraction.** For a transposition `t`, the map `g ↦ 1` for even `g` and `g ↦ t` for odd
  `g` is a monoid homomorphism `Equiv.Perm α →* Equiv.Perm α` that fixes `1` and `t` and satisfies
  `movedNorm α (r g) ≤ movedNorm α g` for every `g`.

## Layer 2: finite 2-complexes and group-valued 1-cochains

- Define `TwoComplex V` and `complete V` as in the conventions, with `card_edges (complete V) =
  k(k−1)/2` and `card_triangles (complete V) = k(k−1)(k−2)/6`.
- Define `Cochain X G`, its holonomy, `defect`, `cost`, `gaugeDist`, `IsCoboundary`, and the gauge
  action `β • α`. Prove the cochain axiom is preserved by the gauge action and that
  `(β • γ • α) = (γ * β) • α` in the order fixed by the definition.
- **Orientation independence.** Under a conjugation-invariant norm, the norm of the holonomy of a
  triangle does not depend on the starting vertex or the direction of travel, and the norm of the
  edge term does not depend on the direction of the edge. Consequently `defect`, `cost` and
  `gaugeDist` are unchanged by replacing the `LinearOrder` on `V`, and they are invariant under
  relabelling the vertices of `complete V` by any bijection `V ≃ W`.
- **Gauge invariance.** `defect (β • α) = defect α`, `cost (β • α) γ = cost α (β * γ)` (pointwise
  product), hence `gaugeDist (β • α) = gaugeDist α`; a coboundary has `defect = 0`.
- **Finite coefficients.** For `[Finite G]` the infimum defining `gaugeDist` is attained, and
  `gaugeDist α = 0 ↔ IsCoboundary α`. Fixing the gauge at one vertex to `1` does not change the
  minimum (a constant right factor conjugates every edge term), so the minimum over gauges with
  `β v₀ = 1` equals `gaugeDist`.
- **Change of coefficients.** For a homomorphism `φ : G →* H` with `ℓ_H ∘ φ ≤ ℓ_G`, the pushed-
  forward cochain has smaller or equal defect and gauge distance. For a subgroup `H ≤ G` with the
  restricted norm, a cochain with values in `H` has the same defect in `G` and in `H`, and
  `gaugeDist` in `G` is at most `gaugeDist` in `H`.
- **Branch and bound.** For finite `G` and `V = Fin (m + 1)`, a search over partial gauges that
  prunes once the cost of the assigned edges reaches a bound `D` is sound: if it reports no
  completion below `D`, then every gauge costs at least `D`. Its partial cost is monotone in the
  assigned prefix. This is the decision procedure for the kernel-checked minima of Layer 6.

## Layer 3: the Cheeger constant

- Define `h1 X ℓ` as in the conventions, and `h1Norm X ℓ` as the normalized constant, with
  `h1Norm X ℓ = (#edges / #triangles) * h1 X ℓ` when `X` has a triangle.
- `h1 X ℓ ≥ 0`; `h1 X ℓ ≤ defect α / gaugeDist α` for every `α` with positive gauge distance; for
  finite `G` the infimum is a minimum whenever the set is nonempty.
- `h1` is unchanged by scaling `ℓ` by a positive constant and by relabelling the vertices of
  `complete V`; in particular `h1 (complete V) ℓ` depends only on `Fintype.card V`.
- Define the same-degree permutation constant `h1Sym X = ⨅ n, h1 X (movedNorm (Fin (n + 1)))` and
  prove `h1Sym X ≤ h1 X (movedNorm (Fin 2))`, the inequality `h₁(·, Sym) ≤ h₁(·, 𝔽₂)` of
  Chapman–Lubotzky.

## Layer 4: the star bound on the complete complex

For a cochain `α` on `complete V` and a vertex `x`, the **star gauge** at `x` is `β x = 1` and
`β u = α u x` for `u ≠ x`. It makes every edge at `x` cost nothing, and on each other edge `u < v`
its term `(α u x)⁻¹ * α u v * α v x = α x u * α u v * α v x` is the holonomy of the triangle
`x → u → v → x`.

- `Σ x, cost α (starGauge α x) = 3 * defect α` for every conjugation-invariant `ℓ`.
- Hence `card V * gaugeDist α ≤ 3 * defect α`, and `card V / 3 ≤ h1 (complete V) ℓ` whenever some
  cochain has positive gauge distance (Chapman–Lubotzky, Proposition 3.2). Normalized:
  `card V / (card V − 2) ≤ h1Norm (complete V) ℓ` for `card V ≥ 3`.
- **Equality case.** A cochain with positive gauge distance has `defect α / gaugeDist α =
  card V / 3` if and only if every star gauge is an optimal gauge for `α`.
- For `card V ≥ 3` and a nontrivial finite group `G`, a cochain with positive gauge distance
  exists (any cochain with a non-identity holonomy), so the hypothesis of the bound is discharged.

## Layer 5: balanced replication

For a cochain `α` on `complete V` and `q ≥ 1`, the **replicated cochain** `α^[q]` on
`complete (V ×ₗ Fin q)` (lexicographic order) is the identity on every edge inside a cluster
`{i} × Fin q` and `α i j` on every edge from cluster `i` to cluster `j`.

- `defect α^[q] = q³ * defect α`. A triangle meeting three clusters carries the holonomy of the
  underlying triangle, each underlying triangle has `q³` such lifts, and every other triangle
  carries the identity.
- `gaugeDist α^[q] = q² * gaugeDist α`, for every group `G` and conjugation-invariant `ℓ`. The
  upper bound copies a gauge across each cluster. The lower bound is a finite double count over
  **sections**, choices of one vertex in each cluster: there are `q^k` sections, each restricts a
  gauge on the replicated complex to a gauge on `complete V` of cost at least `gaugeDist α`, and
  each edge between two clusters is used by exactly `q^(k−2)` sections. No hypothesis that the
  gauge is constant on clusters is made.
- Hence `defect α^[q] / gaugeDist α^[q] = q * (defect α / gaugeDist α)` when `gaugeDist α > 0`.

## Layer 6: the complete complex with permutation coefficients

- **The seed.** On `complete (Fin 4)` let `α` be the identity on the three edges at `0` and carry
  the three transpositions of `Sym(3)` on the edges `{1,2}`, `{1,3}`, `{2,3}` (one each). Then
  `defect α = 8` and `gaugeDist α = 6`, so `h1 (complete (Fin 4)) (movedNorm (Fin 3)) = 4/3`.
  Every triangle holonomy is a transposition; around the triangle `{1,2,3}` the three distinct
  transpositions compose to a transposition while each product of two of them is a 3-cycle.
- **Every multiple of four.** By Layer 5, `h1 (complete V) (movedNorm (Fin 3)) = card V / 3`
  whenever `4 ∣ card V` and `card V ≥ 4`, attained by the replicated seed with
  `defect = 8q³` and `gaugeDist = 6q²`.
- **Explicit witnesses for `k = 5, …, 8`.** Gauged cochains on `complete (Fin k)` with values in
  `Sym(3)`, listed by their non-identity edges `(u, v)`, `u < v`, in one-line notation for
  permutations of `{0, 1, 2}`:

  | `k` | non-identity edges | `defect` | `gaugeDist` |
  | --- | --- | --- | --- |
  | 5 | `(0,1), (1,2), (2,3) ↦ (1 0 2)` | 10 | 6 |
  | 6 | `(0,1), (1,3) ↦ (1 2 0)`; `(0,3), (0,4), (1,5), (4,5) ↦ (2 0 1)` | 36 | 18 |
  | 7 | `(0,1), (0,3), (0,4), (1,2), (1,5), (2,3) ↦ (1 0 2)` | 28 | 12 |
  | 8 | `(0,1), (0,7), (1,2), (2,5), (2,7) ↦ (0 2 1)`; `(1,3), (1,4), (1,6), (3,7) ↦ (1 0 2)`; `(0,4), (2,3), (2,4) ↦ (2 1 0)`; `(4,7) ↦ (2 0 1)` | 72 | 27 |

  Each `gaugeDist` is proved by kernel evaluation of the Layer 2 branch-and-bound search
  (`decide +kernel`, no `native_decide`), splitting the search by the gauge on the first vertices
  where a single evaluation is too large.
- **Coefficient subgroups at `k = 4`.** With the restricted moved-point norm,
  `h1 (complete (Fin 4))` is `2` for the subgroup `{1, t}` of a transposition and `3/2` for the
  alternating subgroup of `Sym(3)`, by exhaustion over all cochains of `complete (Fin 4)` with
  values in that subgroup. Together with the seed this shows that no abelian subgroup of `Sym(3)`
  attains `4/3`.
- **`𝔽₂` at `k = 4`.** `h1 (complete (Fin 4)) (movedNorm (Fin 2)) = 2`.

## Layer 7: Kozlov's binary witnesses

Work with `Equiv.Perm (Fin 2)`-valued cochains on `complete V`, identified with edge sets:
a cochain is its set `E` of non-identity edges, and a gauge is a vertex set `S` (the vertices
where it is non-trivial).

- **Bridge.** `defect α = 2 * #{triangles with an odd number of edges in E}` and
  `cost α β = 2 * #(E ∆ δS)`, where `δS` is the set of edges with exactly one end in `S`.
- **Cut-minimal graphs.** A graph `E` on `V` is cut-minimal if for every `S`, the number of edges of
  `E` across `S` is at most the number of non-edges across `S`. Prove that `E` is cut-minimal if and
  only if `gaugeDist α = 2 * #E`.
- **Staircase graphs.** For `c, t ≥ 1` and `n = c(2t+1)`, the graph `staircase c t` on
  `Fin (c * t) ⊕ Fin (c * t) ⊕ Fin c` joins `inl i` to `inr (inl j)` exactly when
  `i < c * (t - j / c)` (natural-number division and subtraction), and has no other edges. It is
  the bipartite graph `G_n(λ)` of Kozlov's Definition 3.2 for `λ` the `c`-fold blow-up of the
  staircase partition `(t, t−1, …, 1)`.
  - `#E = c² t (t+1) / 2`.
  - `staircase c t` is cut-minimal (Kozlov, Lemma 3.8 with Corollary 3.13).
  - The number of triangles with an odd number of edges is `(n / 3) * #E`.
- **Kozlov's theorem.** If `n ≥ 3` is not a power of two, `h1 (complete V) (movedNorm (Fin 2)) =
  n / 3` for `card V = n`: write `n = c(2t+1)` with `t ≥ 1`, transport `staircase c t` to `V` by
  Layer 2, and combine with Layer 4.

## Layer 8: the headline

- **Every `k ≥ 4`.** `h1 (complete V) (movedNorm (Fin 3)) = card V / 3` and
  `h1Norm (complete V) (movedNorm (Fin 3)) = card V / (card V − 2)` for `card V ≥ 4`. If
  `4 ∣ card V`, this is Layer 6. Otherwise `card V` is not a power of two; embed Kozlov's witness
  through the subgroup `{1, t}` of a transposition `t`, which keeps its defect. By the parity
  retraction of Layer 1, for a cochain with values in `{1, t}` and any `Sym(3)` gauge `β`, the edge
  terms of the gauge `r ∘ β` are the retractions of those of `β`, so its cost is no larger; hence
  `gaugeDist` over `Sym(3)` equals `gaugeDist` over `{1, t}`, and the ratio is `card V / 3`.
- **All degrees.** `h1Sym (complete V) = card V / 3` for `card V ≥ 4`: each degree is bounded below
  by Layer 4 and degree 3 attains the bound.
- **Comparison with `𝔽₂`.** `h1Sym (complete (Fin 4)) = 4/3 < 2 = h1 (complete (Fin 4))
  (movedNorm (Fin 2))`: at `k = 4` the permutation constant lies strictly below the `𝔽₂`
  constant, by Layers 6 and 8.

## Layer 9: the cross-degree convention

Chapman and Lubotzky compare permutations of different degrees. For `σ` of degree `n` and `τ` of
degree `m`, the **distance with errors** is

```text
d(σ, τ) = 1 − #{ j < min(n, m) : σ j = τ j } / max(n, m),
```

which is the normalized Hamming distance when `n = m`. For a cochain of degree `n` on `complete V`
and a gauge of degree `m`, the cross-degree cost is `Σ over edges u<v of d(α u v, β u * (β v)⁻¹)`
(normalized units), and `h1Err` is the infimum over cochains of the normalized defect divided by
the infimum of this cost over gauges of every degree.

- Lower bound: `h1Err (complete V) ≥ card V / 3`, from the star gauge, which has the cochain's own
  degree.
- Baselines: a degree-3 permutation and a degree-2 permutation have `d ≥ 1/3`; a degree-3
  permutation and a degree-`m` permutation with `m ≥ 4` have `d ≥ 1 − 3/m ≥ 1/4`.
- The seed of Layer 6 has cross-degree minimum `2` (in edge-distance units): degree `m ≥ 5` by the
  baseline `6(1 − 3/m) ≥ 12/5`, degrees `2, 3, 4` by exhaustion, with minima `10/3`, `2` and `3`.
- The section count of Layer 5 uses nothing about the degree of the gauge, so replicated seeds have
  no cheaper cross-degree repair.
- For Kozlov's witness at `card V = q(2t+1)`, with `D₃ = q² t (t+1) / 3`, the baselines exceed `D₃`
  because `q (4t² + 4t + 3) ≥ 6t + 3`.
- Hence `h1Err (complete V) = card V / 3` for every `card V ≥ 4`.

## References

1. M. Chapman and A. Lubotzky, *Stability of homomorphisms, coverings and cocycles I: equivalence*,
   Eur. J. Math. 11 (2025), art. 13; arXiv:2310.17474.
2. M. Chapman and A. Lubotzky, *Stability of homomorphisms, coverings and cocycles II: examples,
   applications and open problems*, Adv. Math. 463 (2025), 110117; arXiv:2311.06706.
   Proposition 3.2 is the star bound; footnote 2 is `h₁(·, Sym) ≤ h₁(·, 𝔽₂)`.
3. D. N. Kozlov, *The first Cheeger constant of a simplex*, Graphs Combin. 33 (2017);
   arXiv:1610.07136. Definition 3.2 (staircase graphs), Lemma 3.8, Corollary 3.13, Theorem 4.2,
   and Corollary 4.3.
4. R. Meshulam and N. Wallach, *Homological connectivity of random k-dimensional complexes*,
   Random Structures Algorithms 34 (2009), 408–417. The bound `⌈n/3⌉ ≥ h₁(Δ^[n], 𝔽₂) ≥ n/3`.
5. N. Linial and R. Meshulam, *Homological connectivity of random 2-complexes*, Combinatorica 26
   (2006), 475–487.
6. J. Beasley, *The permutation coboundary constant of the complete complex is k/3 for every
   k ≥ 4*, Zenodo (2026), doi:10.5281/zenodo.23245792. Layers 5, 6, 8 and 9.

## Provenance

Existing formalization, cited as a source and not as the specification:
[`dicipler-pixel/coboundary-k3-lean`](https://github.com/dicipler-pixel/coboundary-k3-lean)
(MIT). Its `main` branch proves the Layer 4 star bound for `Sym(3)`, the Layer 6 witnesses with
the Layer 2 branch-and-bound search, and `h₁ = k/3` for `k = 4, …, 8`. An unmerged branch,
`claude-k3-v7`, proves the Layer 5 replication for every `q` and the parity retraction of
Layer 1. The author of that repository is the author of this roadmap.

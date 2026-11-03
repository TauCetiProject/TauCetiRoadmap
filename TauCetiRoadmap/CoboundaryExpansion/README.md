# Roadmap: coboundary expansion with group coefficients

**Summary.** A 1-cochain on a finite 2-complex with values in a group fails to be a coboundary to
some extent, measured by how far a gauge must move it, and it carries a triangle defect, the
holonomy around each triangle. The first coboundary Cheeger constant is the least ratio of defect
to distance. With `𝔽₂` coefficients this is the Linial–Meshulam constant; with permutation
coefficients in the normalized Hamming metric it is the constant of Chapman and Lubotzky.

This roadmap develops that theory for an arbitrary group carrying a conjugation-invariant group
norm, then determines the constant of the complete complex `K_k`. The lower bound `k/3` holds for
every such group (Beasley, Proposition 1, extending Chapman–Lubotzky's Proposition 3.2 for
permutation coefficients). For `𝔽₂` and `k ≥ 3` not a power of two, Kozlov proves that
the bound is attained. For permutation coefficients it is attained for every `k ≥ 4`, already
with values in `Sym(3)` (Beasley), in the same-degree and in the cross-degree convention. The
proof uses a three-transposition seed at `k = 4`, a balanced replication that multiplies the
defect by `q³` and the gauge distance by exactly `q²`, Kozlov's staircase witnesses, and a parity
retraction. The end theorems are `card_div_three_le_h1` (Layer 4), `Cochain.defect_replicate`
and `Cochain.gaugeDist_replicate` (Layer 5), `h1_complete_movedNorm_fin_two` (Layer 7),
`h1_complete_movedNorm_fin_three`, `h1Norm_complete_movedNorm_fin_three` and `h1Sym_complete`
(Layer 8), and `h1Err_complete` (Layer 9).

The README is definitive. [Suggested.lean](Suggested.lean) gives suggested, non-exhaustive
signatures, with `sorry` for unproved targets. The suggested home is
`TauCeti/Combinatorics/CoboundaryExpansion/`, with the norm material of Layer 1 under
`TauCeti/Algebra/Group/` and the permutation material under `TauCeti/GroupTheory/Perm/`.

## Scope and ownership

This roadmap owns: conjugation-invariant group norms and their constructions; the moved-point
norm on finite permutation groups and the parity retraction; group-valued 1-cochains on finite
2-complexes with their holonomy, defect, gauge action, gauge distance and coboundaries; the first
coboundary Cheeger constant in the counting, normalized, same-degree permutation and cross-degree
conventions; the star bound on the complete complex; balanced replication; the `Sym(3)` and
`𝔽₂` witnesses on the complete complex, including Kozlov's staircase graphs; and the exact value
of every one of these constants on `complete V`.

It does not own, and does not restate:

- finite graded simplicial complexes, which the [regularity roadmap](../Regularity/README.md)
  owns as `HypergraphComplex r V` in its Layer 5, together with the conversion to and from
  Mathlib's `PreAbstractSimplicialComplex`. The carrier `TwoComplex V` of Layer 2 here is the
  specialization `r = 3` read at levels 2 and 3, with conversion and round-trip targets; it is
  not a second foundational complex;
- group norms, `GroupNorm`, permutation supports and signs, Hamming distance, and finite sums
  and infima, all already in Mathlib (exact names under supplier contracts).

Out of scope altogether: cochains in degree other than 1; coboundary expansion of infinite or
random complexes; cosystolic expansion of buildings and their quotients; the stability theory of
homomorphisms that Chapman and Lubotzky derive from these constants; soficity; and any search
procedure, decision procedure or evaluation strategy. Every finite value below is a theorem about
cochains; how it is proved is the implementor's choice. Graph Cheeger constants appear only as
the cut counts of Layer 7.

## Conventions

All conventions below are fixed; contributors do not choose between alternatives.

- **Norms.** Coefficients lie in a group `G` with a
  [`GroupNorm G`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Analysis/Normed/Group/Seminorm.html#GroupNorm)
  `ℓ`. It is conjugation invariant when `ℓ (h * g * h⁻¹) = ℓ g`. Then `d g h = ℓ (g⁻¹ * h)` is
  a metric invariant under left and right multiplication, and every bi-invariant metric arises
  this way from `ℓ g = d 1 g`. Statements are made for `ℓ`, not for a metric instance on `G`.
- **Permutations.** The permutation norm is the moved-point count
  `movedNorm α σ = σ.support.card` on `Equiv.Perm α` for a finite type `α`. The normalized
  Hamming metric is `movedNorm α (σ⁻¹ * τ) / Fintype.card α`; the normalization cancels in every
  same-degree ratio and is not carried, except in Layer 9 where degrees differ. Products compose
  right to left, `(σ * τ) x = σ (τ x)`. In examples, permutations of `{0, 1, 2}` are written in
  one-line notation: `e = (0 1 2)`, `t = (1 0 2)`, `s = (0 2 1)`, `c = (1 2 0)`.
- **Complexes.** A finite 2-complex on a vertex type `V` is a finite set of 2-element `Finset`s
  (edges) and a finite set of 3-element `Finset`s (triangles) whose 2-element subsets are edges.
  The complete complex `complete V` on a finite type has every pair and every triple. Oriented
  quantities are evaluated with a `LinearOrder` on `V`: an edge as `(u, v)` with `u < v`, a
  triangle as `(u, v, w)` with `u < v < w`. Layer 2 proves that every quantity defined below is
  independent of the order.
- **Cochains, defect and gauge.** A `G`-valued 1-cochain `α` assigns `α u v` to ordered pairs,
  with `α v u = (α u v)⁻¹` on edges; values off the edges are ignored by every sum. Its holonomy
  on the triangle `u < v < w` is `α u v * α v w * α w u`. A gauge is any `β : V → G`, acting by
  `(β • α) u v = (β u)⁻¹ * α u v * β v`.

  ```text
  N(α)     = Σ over triangles u<v<w   ℓ(α u v · α v w · α w u)          (the defect)
  cost α β = Σ over edges u<v         ℓ(β u⁻¹ · α u v · β v)
  D(α)     = ⨅ over gauges β          cost α β                           (the gauge distance)
  ```

  `α` is a coboundary when `α u v = β u * (β v)⁻¹` on every edge for some `β`; this is the zero
  set of `cost α β` in `β`. Chapman and Lubotzky write coboundaries as `β(u)⁻¹β(v)`; the two
  conventions differ by `β ↦ β⁻¹` pointwise.
- **The constant.** The counting-convention constant is

  ```text
  h₁(X, ℓ) = inf { N(α) / D(α) : α a cochain with D(α) > 0 }.
  ```

  The infimum is taken in `ℝ` with Mathlib's `sInf`, so an empty ratio set gives `0`; theorems
  that need the set to be nonempty assume a cochain with `D > 0`. For finite `G`, `D(α) > 0`
  exactly for non-coboundaries. The normalized constant, with uniform probability on edges and
  on triangles, is `h₁ⁿᵒʳᵐ(X, ℓ) = (#edges / #triangles) · h₁(X, ℓ)`, used only when `X` has a
  triangle. On `complete V` with `k = card V ≥ 3` the factor is `3/(k − 2)`, so `k/3` in the
  counting convention is `k/(k − 2)` in the normalized one.
- **Degrees.** The same-degree permutation constant is the infimum of `h₁(X, movedNorm (Fin n))`
  over degrees `n ≥ 2`. Degree `1` is excluded: `Sym(1)` is trivial, its ratio set is empty and
  its constant is `0`. The cross-degree constant of Layer 9 also takes cochain and gauge degrees
  `≥ 2`. `𝔽₂` coefficients are `Equiv.Perm (Fin 2)` with `movedNorm`, which is twice the
  indicator of a non-identity element; Layer 7 transports this to edge sets.
- **Real division.** Every ratio and every quotient such as `n / 3` or `k/(k − 2)` is a real
  number, never natural-number division.

## Exact supplier contracts

### From Mathlib

Read at Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2`, the pin of `lake-manifest.json`.

- `GroupSeminorm`, `GroupNorm` (`Mathlib/Analysis/Normed/Group/Seminorm.lean`): product
  inequality, inverse invariance, and separation for `GroupNorm`; no conjugation-invariance
  field. The sum of two group norms is already an instance there; only preservation of
  conjugation invariance is new.
- `Equiv.Perm.support`, `Equiv.Perm.support_one`, `Equiv.Perm.support_eq_empty_iff`,
  `Equiv.Perm.support_mul_le`, `Equiv.Perm.support_inv`, `Equiv.Perm.card_support_conj`,
  `Equiv.Perm.IsSwap`, `Equiv.Perm.card_support_eq_two` (`Mathlib/GroupTheory/Perm/Support.lean`):
  the moved set, its behaviour under products, inverses and conjugation, and swaps as the
  permutations moving exactly two points.
- `Equiv.Perm.sign`, `Equiv.Perm.IsSwap.sign_eq` (`Mathlib/GroupTheory/Perm/Sign.lean`): a monoid
  homomorphism to `ℤˣ`, `−1` on swaps.
- [`hammingDist`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/InformationTheory/Hamming.html#hammingDist)
  (`Mathlib/InformationTheory/Hamming.lean`): the number of unequal values of two functions on a
  finite domain with decidable equality in the codomain.
- `Finset.powersetCard`, `Finset.mem_powersetCard`, `Finset.card_powersetCard`
  (`Mathlib/Data/Finset/Powerset.lean`): the fixed-cardinality subsets, including the empty and
  boundary cases.
- `Finset.sum_comm`, `Finset.sum_le_sum` and `Finset.inf'` for the double counts of Layers 4 and 5
  and the attained minima of Layer 2.
- `Prod.Lex`, `toLex`, `ofLex` (`Mathlib/Order/Lex.lean`): the vertex order on the replicated
  complex of Layer 5.
- [`SimpleGraph`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Combinatorics/SimpleGraph/Basic.html#SimpleGraph),
  `SimpleGraph.fromRel`, `SimpleGraph.edgeFinset`: edge sets and the staircase graphs of Layer 7.
- `PreAbstractSimplicialComplex`, `AbstractSimplicialComplex`
  (`Mathlib/AlgebraicTopology/SimplicialComplex/Basic.lean`): nonempty finite faces with downward
  closure, with no finiteness of the face set and no dimension bound. They are reached through
  the regularity roadmap's conversion, not directly.
- `Real.sInf_empty`: the empty real infimum is `0`.

At that pin Mathlib has no cochains on a simplicial complex with group coefficients, no gauge
distance and no coboundary Cheeger constant. A search of open Mathlib pull requests and of the
Lean Zulip in November 2026 found no development of either.

### From Tau Ceti

None. Tau Ceti's `hammingDist_eq_hammingNorm_sub` (`TauCeti/InformationTheory/Hamming.lean`)
concerns additive codomains and is not the composition identity of 1.3.

### From other roadmaps

- [Regularity](../Regularity/README.md), Layer 5: `HypergraphComplex r V`, a finite augmented
  complex whose level `k` holds faces of cardinality `k ≤ r`, closed under subsets, with the empty
  face; and its conversions to and from `PreAbstractSimplicialComplex`. Target 2.1 consumes the
  case `r = 3`.

## How to read the build

Layer 1 fixes the coefficient norms: conjugation invariance, the moved-point norm and the parity
retraction. Layer 2 specializes the regularity roadmap's complexes to the edge/triangle carrier
and builds cochains, the gauge action and the gauge distance with their invariances. Layer 3
defines the four constants. Layer 4 proves the star bound `k/3` for every group, and Layer 5 the
replication law. Layer 6 computes the `Sym(3)` constant at `k = 4`, at multiples of four, and at
`k = 5, …, 8`. Layer 7 proves Kozlov's `𝔽₂` theorem. Layer 8 combines Layers 1, 4, 6 and 7 into
the permutation headline, and Layer 9 transfers it to the cross-degree convention.

## Layer 1: conjugation-invariant group norms

### 1.1 Conjugation invariance and the bi-invariant metric

Define `IsConjInvariant ℓ` for `ℓ : GroupNorm G`. Prove: `d g h = ℓ (g⁻¹ * h)` is symmetric,
satisfies the triangle inequality, vanishes exactly on the diagonal, and is invariant under left
multiplication, and under right multiplication when `ℓ` is conjugation invariant;
`ℓ (g * h) = ℓ (h * g)`; `ℓ` of a list product is invariant under cyclic rotation and under
reversal with inversion of each factor. Conversely, a metric on `G` invariant under left and
right multiplication gives a conjugation-invariant group norm `g ↦ d 1 g`, and the two
constructions are inverse. *Needs:* Mathlib `GroupNorm`.

**Checks.**

- The moved-point norm on `Sym(3)` (1.3) is conjugation invariant: `c t c⁻¹ = s` and both have
  norm `2`. The word norm with weights `t ↦ 1`, `s ↦ 2` is a group norm that is not: it gives
  `2 ≠ 1` on the same pair, so the predicate discriminates.
- For the moved-point norm, `d e t = d t e = 2` and `d t s = 3 ≤ d t e + d e s = 4`; on the
  trivial group `d 1 1 = 0`.
- Reversal needs inversion: `t s = c` and `s⁻¹ t⁻¹ = c⁻¹`, both of norm `3`; cyclic rotations of
  `t s c` all have norm `3`.

### 1.2 Constructions

Conjugation-invariant norms restrict to subgroups, pull back along injective homomorphisms, are
closed under multiplication by a positive real, and are closed under the sum of `GroupNorm`s
already in Mathlib. *Needs:* 1.1.

**Checks.**

- Restricting the moved-point norm of `Sym(3)` to `{e, t}` gives `2` on `t`. Pulling back along
  the non-injective map `{e, t} → 1` gives `0` at `t`, which is not a norm: injectivity is
  needed.
- `2ℓ` and `ℓ + ℓ` both give `4` on `t`; `0 · ℓ` gives `0` at `t`, so positivity of the scalar
  is needed.
- Each construction preserves conjugation invariance: the restricted norm of `{e, c, c⁻¹}` is
  `3` on both 3-cycles, which are conjugate in `Sym(3)` but not inside the subgroup.

### 1.3 The moved-point norm

Define `movedNorm α : GroupNorm (Equiv.Perm α)` for `[Fintype α] [DecidableEq α]` with value
`σ.support.card`, and prove it conjugation invariant (a direct consequence of
`Equiv.Perm.card_support_conj`). Prove `hammingDist ⇑σ ⇑τ = movedNorm α (σ⁻¹ * τ)`
(`hammingDist_eq_movedNorm`). Every odd permutation has `movedNorm ≥ 2`, with equality exactly
on swaps. *Needs:* 1.1; Mathlib `Equiv.Perm.support`, `hammingDist`, `Equiv.Perm.sign`.

**Checks.**

- On `Fin 0` and `Fin 1` the only permutation is the identity, of norm `0`; on `Fin 2` the swap
  has norm `2`; on `Fin 3` the values are `0` on `e`, `2` on `t` and `s`, `3` on `c` and `c⁻¹`.
- `hammingDist ⇑t ⇑s = 3 = movedNorm (t⁻¹ * s)` and `hammingDist ⇑c ⇑c = 0`.
- A transposition has norm `2 ≥ 2` and a 4-cycle norm `4 ≥ 2`; neither `Fin 0` nor `Fin 1` has an
  odd permutation.

### 1.4 The parity retraction

For a swap `t : Equiv.Perm α`, define `parityRetract t : Equiv.Perm α →* Equiv.Perm α`, sending
even permutations to `1` and odd ones to `t`. Prove that it is a monoid homomorphism fixing `1`
and `t`, that its image is `{1, t}`, and that `movedNorm α (parityRetract t g) ≤ movedNorm α g`
for every `g`. *Needs:* 1.3; Mathlib `Equiv.Perm.sign`, `Equiv.Perm.IsSwap.sign_eq`.

**Checks.**

- On `Sym(3)` with `t = (1 0 2)`: `e` and `c` go to `e`, while `t` and `s` go to `t`; the norms
  compare as `0 ≤ 0`, `0 ≤ 3`, `2 ≤ 2`, `2 ≤ 2`.
- Homomorphism: the image of `t * s = c` is `e = t * t`, and the image of `c * t` is `t = e * t`.
- On `Sym(4)` a 4-cycle goes to `t` with `2 ≤ 4`; sending odd permutations to a 3-cycle instead
  is not a homomorphism, since `t * t = e` would go to a 3-cycle squared.

### Examples

The norm values on `Sym(3)` in 1.3 are the running examples of Layers 2–9.

### Dependencies

Mathlib `GroupNorm`, `Equiv.Perm.support`, `Equiv.Perm.sign` and `hammingDist`. No earlier layer.

## Layer 2: finite 2-complexes and group-valued 1-cochains

### 2.1 The edge/triangle carrier

Define `TwoComplex V` as in the conventions, as the specialization of the regularity roadmap's
`HypergraphComplex 3 V`: `TwoComplex.toHypergraphComplex` adds the empty face and the singletons
of the vertices of `V`, and `TwoComplex.ofHypergraphComplex` keeps levels 2 and 3. Prove both
round trips: `ofHypergraphComplex ∘ toHypergraphComplex` is the identity, and
`toHypergraphComplex ∘ ofHypergraphComplex` is the identity on complexes whose level 1 is every
singleton. Define `complete V` with every pair and every triple, and prove that its edges and
triangles number `k(k−1)/2` and `k(k−1)(k−2)/6` for `k = card V`. *Needs:* Regularity 5
(`HypergraphComplex`); Mathlib `Finset.powersetCard`, `Finset.card_powersetCard`.

**Checks.**

- On `k = 0, 1, 2, 3, 4` vertices `complete` has `(edges, triangles)` equal to `(0, 0)`, `(0, 0)`,
  `(1, 0)`, `(3, 1)`, `(6, 4)`.
- A filled triangle has levels of sizes `1, 3, 3, 1` in `HypergraphComplex 3`; forgetting levels
  0 and 1 gives the three edges and one triangle of `TwoComplex`.
- Three edges of a triangle with one edge removed, together with the triangle, are rejected by
  the face condition of `TwoComplex` and by the downward closure of `HypergraphComplex`.

### 2.2 Cochains, gauges and coboundaries

Define `Cochain X G`, its holonomy, `Cochain.defect`, `Cochain.cost`, `Cochain.gaugeDist`,
`Cochain.IsCoboundary`, and the gauge action `β • α`. Prove that the gauge action preserves the
cochain axiom, that `1 • α = α`, and that `β • (γ • α) = (γ * β) • α` with the pointwise product
`(γ * β) u = γ u * β u`. `gaugeDist` is a nonnegative real (the set of gauges is nonempty and
every cost is nonnegative). *Needs:* 2.1, 1.1.

**Checks.**

- The axiom discriminates orientation: with `α u v = c`, the reverse value `c⁻¹` gives
  `c⁻¹ * c = e`, while the wrong reverse value `c` gives `c * c = c⁻¹ ≠ e`.
- On `complete (Fin 3)` with `t` on one edge and `e` elsewhere, the holonomy is `t` and
  `defect = 2`; the identity cochain has `defect = 0`.
- Sign of the coboundary convention: on one edge with `α = c` and `β = (c, e)`,
  `(β u)⁻¹ * α * β v = e` costs `0`; the other convention `β = (c⁻¹, e)` leaves `c⁻¹`, costing `3`.
- Action order: on an identity edge with `β = (e, s)` and `γ = (e, t)`, `β • (γ • α)` has value
  `t * s = c = ((γ * β) • α)`, while `(β * γ) • α` has value `s * t = c⁻¹ ≠ c`.

### 2.3 Orientation and relabelling independence

Under a conjugation-invariant norm, the norm of the holonomy of a triangle does not depend on the
starting vertex or the direction of travel, and the norm of an edge term does not depend on the
direction of the edge. Consequently `defect`, `cost` and `gaugeDist` are unchanged by replacing
the `LinearOrder` on `V`, and they are invariant under relabelling the vertices of `complete V`
by any bijection `V ≃ W`. *Needs:* 2.2, 1.1.

**Checks.**

- On a triangle with one `t` edge, all six readings of the holonomy have norm `2`.
- On an edge with `α = c` and `β = (t, s)`, the forward term and the inverse of the reverse term
  have the same norm.
- The seed of 6.1 keeps `defect = 8` and `gaugeDist = 6` under every relabelling of `Fin 4`.
  Without conjugation invariance the claim fails: holonomies read from two starting vertices are
  conjugate, and the conjugate elements `t` and `s = c * t * c⁻¹` have norms `1` and `2` under
  the weighted word norm of 1.1.

### 2.4 Gauge invariance

`defect (β • α) = defect α`; `cost (β • α) γ = cost α (β * γ)`, hence
`gaugeDist (β • α) = gaugeDist α`; a coboundary has `defect = 0`. *Needs:* 2.2, 2.3.

**Checks.**

- The seed keeps `defect = 8` and `gaugeDist = 6` under every gauge.
- On an identity edge with `β = (e, t)`, `γ = (e, s)`: `cost (β • α) γ = ℓ (t * s) = 3 =
  cost α (β * γ)`.
- A gauge that is constant on the vertices does not change the cost of any cochain under a
  conjugation-invariant norm: on the seed, the constant gauge `c` costs `6`.
- A coboundary has each holonomy `e` and `defect = 0`.

### 2.5 Finite coefficients

For `[Finite G]` the infimum defining `gaugeDist` is attained, and
`gaugeDist α = 0 ↔ IsCoboundary α` (`Cochain.gaugeDist_eq_zero_iff`). For a vertex `v₀`, the
minimum over gauges with `β v₀ = 1` equals `gaugeDist`, because a constant right factor
conjugates every edge term. *Needs:* 2.4; Mathlib `Finset.inf'`.

**Checks.**

- On `complete (Fin 3)` over `{e, t}` with one odd edge, `gaugeDist = 2` and the cochain is not a
  coboundary; on a tree with one `t` edge, `gaugeDist = 0` and it is a coboundary.
- The seed has minimum `6` both over all gauges and over gauges with `β 0 = e`.
- The empty vertex type has `gaugeDist = 0`, attained by the unique gauge.

### 2.6 Change of coefficients

For a homomorphism `φ : G →* H` with `ℓ_H ∘ φ ≤ ℓ_G`, the pushed-forward cochain has smaller or
equal defect and gauge distance. For a subgroup `H ≤ G` with the restricted norm, a cochain with
values in `H` has the same defect in `G` and in `H`, and its `gaugeDist` in `G` is at most its
`gaugeDist` in `H`. *Needs:* 2.4, 1.2.

**Checks.**

- The parity retraction sends a cochain with values in `{e, c, c⁻¹}` with `defect = 9` and
  `gaugeDist = 6` to the identity cochain, with `0 ≤ 9` and `0 ≤ 6`.
- The binary `k = 5` witness of 7.3, embedded in `Sym(3)` through `{e, t}`, has `defect = 10` in
  both groups and `gaugeDist = 6` in both.
- The subgroup inequality can be strict in general: a gauge in `G` may leave `H`. Equality in
  8.1 comes from the parity retraction, not from the inclusion.

### Examples

The seed of 6.1 and the one-edge cochain on `complete (Fin 3)` are the running examples.

### Dependencies

Layer 1; the regularity roadmap's Layer 5; Mathlib `Finset.powersetCard` and `Finset.inf'`.

## Layer 3: the Cheeger constant

### 3.1 The counting constant

Define `h1 X ℓ` as in the conventions. Prove `0 ≤ h1 X ℓ`; `h1 X ℓ ≤ defect α / gaugeDist α`
for every `α` with positive gauge distance; and, for finite `G`, that the infimum is a minimum
whenever some cochain has positive gauge distance. *Needs:* 2.2, 2.5; Mathlib `Real.sInf_empty`.

**Checks.**

- Over the trivial group every gauge distance is `0`, the ratio set is empty and `h1 = 0`.
- `h1 (complete (Fin 4)) (movedNorm (Fin 3)) = 4/3 = 8/6`, attained by the seed.
- `h1 (complete (Fin 4)) (movedNorm (Fin 2)) = 2`, attained by one odd edge with `N = 4`,
  `D = 2`.

### 3.2 Invariance

`h1` is unchanged by multiplying `ℓ` by a positive real and by relabelling the vertices of
`complete V`; in particular `h1 (complete V) ℓ` depends only on `Fintype.card V`. *Needs:* 3.1,
2.3, 1.2.

**Checks.**

- The seed under `ℓ` and `ℓ/3` gives `8/6 = (8/3)/2 = 4/3`.
- Under a vertex transposition the seed keeps `N = 8`, `D = 6`.
- Multiplying by `0` is excluded: it makes every ratio undefined.

### 3.3 The normalized constant

Define `h1Norm X ℓ = (#edges / #triangles) * h1 X ℓ`. Theorems about it assume that `X` has a
triangle; on `complete V` that is `card V ≥ 3`, where the factor is `3/(card V − 2)`. *Needs:*
3.1, 2.1.

**Checks.**

- The factor is `3`, `3/2`, `1` on `complete (Fin 3)`, `complete (Fin 4)`, `complete (Fin 5)`.
- On `complete (Fin 2)` there is no triangle and the factor `1/0` is excluded by the hypothesis.
- `h1Norm (complete (Fin 4)) (movedNorm (Fin 3)) = (3/2) · (4/3) = 2`.

### 3.4 The same-degree permutation constant

Define `h1Sym X = ⨅ n : ℕ, h1 X (movedNorm (Fin (n + 2)))`, the infimum over degrees `≥ 2`.
Prove `h1Sym X ≤ h1 X (movedNorm (Fin 2))`, the inequality `h₁(·, Sym) ≤ h₁(·, 𝔽₂)` of
Chapman–Lubotzky II, footnote 2. *Needs:* 3.1, 1.3.

**Checks.**

- Degree 1 is a negative control: `h1 (complete (Fin 4)) (movedNorm (Fin 1)) = 0`, so an infimum
  that admitted degree 1 would be `0` on every complex.
- At `complete (Fin 4)` the degree-2 constant is `2` and the degree-3 constant is `4/3`.
- Each degree's constant is at least `0`, so the infimum is bounded below; on `complete (Fin 4)`
  every admitted degree is at least `4/3` by 4.2.

### Examples

`complete (Fin 4)` with coefficient degrees 1, 2 and 3 gives the constants `0`, `2` and `4/3`.

### Dependencies

Layer 2, and the moved-point norm of 1.3.

## Layer 4: the star bound on the complete complex

### 4.1 The star identity

For a cochain `α` on `complete V` and a vertex `x`, the star gauge at `x` is `β x = 1` and
`β u = α u x` for `u ≠ x`. It makes every edge at `x` cost nothing, and on each other edge
`u < v` its term `(α u x)⁻¹ * α u v * α v x = α x u * α u v * α v x` is the holonomy of the
triangle `x → u → v → x`. Prove `Σ x, cost α (starGauge α x) = 3 * defect α` for every
conjugation-invariant `ℓ` (Beasley, Proposition 1; for permutation coefficients,
Chapman–Lubotzky II, Proposition 3.2). *Needs:* 2.3; Mathlib `Finset.sum_comm`.

**Checks.**

- The seed: four star costs `6` each, `24 = 3 · 8`.
- The binary `k = 5` witness: five star costs `6` each, `30 = 3 · 10`.
- On `complete (Fin 3)` with one `t` edge, the star gauge at a vertex of that edge leaves cost `2`
  on the opposite edge; the three costs sum to `6 = 3 · 2`.

### 4.2 The star bound

Hence `card V * gaugeDist α ≤ 3 * defect α` for every cochain (`card_mul_gaugeDist_le`), and
`card V / 3 ≤ h1 (complete V) ℓ` whenever some cochain has positive gauge distance
(`card_div_three_le_h1`). Normalized: `card V / (card V − 2) ≤ h1Norm (complete V) ℓ` for
`card V ≥ 3` under the same hypothesis. *Needs:* 4.1, 3.1, 3.3.

**Checks.**

- Seed: `4 · 6 = 24 = 3 · 8`, so `4/3 ≤ 4/3`.
- The identity cochain and the complexes with `k = 0, 1, 2` give `0 ≤ 0`.
- Over the trivial group the conclusion would read `4/3 ≤ 0` at `k = 4`; the hypothesis of a
  cochain with positive gauge distance is false there, and it cannot be dropped.

### 4.3 The equality case

A cochain with positive gauge distance has `defect α / gaugeDist α = card V / 3` if and only if
every star gauge is an optimal gauge for `α`. *Needs:* 4.1, 4.2.

**Checks.**

- The seed: ratio `4/3` and star costs `(6, 6, 6, 6)`, all optimal.
- One `t` edge on `complete (Fin 4)`: ratio `4/2 = 2 ≠ 4/3`, star costs `(4, 4, 2, 2)`, two not
  optimal.
- At `gaugeDist = 0` every star gauge of a coboundary is optimal but the ratio is undefined; the
  hypothesis excludes it.

### 4.4 Discharging the hypothesis

For `card V ≥ 3` and a nontrivial finite group `G`, a cochain with positive gauge distance exists:
any cochain with a non-identity holonomy. *Needs:* 2.4, 2.5.

**Checks.**

- On `complete (Fin 3)` over `{e, t}`, one `t` edge has `gaugeDist = 2`.
- On `complete (Fin 2)` every cochain is a coboundary and has `gaugeDist = 0`, so `card V ≥ 3`
  is needed.
- Over the trivial group no cochain qualifies, so nontriviality is needed.

### Examples

The seed and the binary `k = 5` witness attain the bound; one `t` edge on `complete (Fin 4)` does
not.

### Dependencies

Layers 2 and 3.

## Layer 5: balanced replication

### 5.1 The replicated cochain and its defect

For a cochain `α` on `complete V` and `q : ℕ`, the replicated cochain `α.replicate q` on
`complete (V ×ₗ Fin q)` (lexicographic order) is the identity on every edge inside a cluster
`{i} × Fin q` and `α i j` on every edge from cluster `i` to cluster `j`. Prove
`defect (α.replicate q) = q³ * defect α` (`Cochain.defect_replicate`): a triangle meeting three
clusters carries the holonomy of the underlying triangle, each underlying triangle has `q³`
lifts, and every other triangle carries the identity. *Needs:* 2.2, 2.3; Mathlib `Prod.Lex`.

**Checks.**

- The seed at `q = 2`: `defect = 64 = 2³ · 8`; a triangle with two vertices in one cluster has
  holonomy `e`.
- `q = 1` returns a relabelling of `α`, with the same defect.
- `q = 0` gives the empty complex, with `0 = 0 · defect α`.

### 5.2 The replicated gauge distance

`gaugeDist (α.replicate q) = q² * gaugeDist α` (`Cochain.gaugeDist_replicate`), for every group
`G` and every group norm `ℓ`. The upper bound copies a gauge across each cluster. The lower bound
is a finite double count over sections, choices of one vertex in each cluster: there are `q^k`
sections, each restricts a gauge on the replicated complex to a gauge on `complete V` of cost at
least `gaugeDist α`, and each edge between two clusters lies in exactly `q^(k−2)` sections. No
hypothesis that the gauge is constant on clusters is made, and the infimum need not be attained.
*Needs:* 5.1, 2.2; Mathlib `Finset.sum_comm`, `Finset.sum_le_sum`.

**Checks.**

- The seed at `q = 2`: `gaugeDist = 24 = 2² · 6`, over all gauges of the eight vertices.
- At `k = 4`, `q = 2` there are `16` sections and each inter-cluster edge lies in `4 = 2²` of them.
- For `k < 2` there are no inter-cluster edges and both sides are `0`; the count `q^(k−2)` is
  used only for `k ≥ 2`.

### 5.3 The replicated ratio

Hence `defect (α.replicate q) / gaugeDist (α.replicate q) = q * (defect α / gaugeDist α)` when
`gaugeDist α > 0` and `q ≥ 1`. *Needs:* 5.1, 5.2.

**Checks.**

- The seed at `q = 2`: `64/24 = 8/3 = 2 · (8/6)`.
- The identity cochain has `gaugeDist = 0`; the hypothesis excludes it.
- The seed at `q = 3`: `(216, 54)` and ratio `4 = 3 · (4/3)`.

### Examples

Replicated seeds at `q = 1, 2, 3` have `(defect, gaugeDist) = (8, 6), (64, 24), (216, 54)`.

### Dependencies

Layer 2 and the double-counting API of Mathlib.

## Layer 6: the complete complex with permutation coefficients

### 6.1 The seed

On `complete (Fin 4)` let `α` be the identity on the three edges at `0` and carry the three
transpositions of `Sym(3)` on the edges `{1,2}`, `{1,3}`, `{2,3}`, one each. Then
`defect α = 8`, every gauge costs at least `6`, and some gauge costs `6`; hence
`h1 (complete (Fin 4)) (movedNorm (Fin 3)) = 4/3` by 4.2 (Beasley, Proposition 5). *Needs:*
4.2, 2.5.

**Checks.**

- Every triangle holonomy is a transposition; around `{1,2,3}` the three distinct transpositions
  compose to a transposition, while each product of two of them is a 3-cycle.
- The identity gauge costs `6` and each of the four star gauges costs `6`.
- The same values hold for all six ways of assigning the three transpositions to the three
  edges.

### 6.2 Every multiple of four

By Layer 5, `h1 (complete V) (movedNorm (Fin 3)) = card V / 3` whenever `4 ∣ card V` and
`card V ≥ 4`, attained by the replicated seed with `defect = 8q³` and `gaugeDist = 6q²`, after
relabelling `Fin 4 ×ₗ Fin q` to `V` by 2.3. *Needs:* 6.1, 5.3, 4.2, 2.3.

**Checks.**

- `q = 1, 2, 3`: ratios `4/3`, `8/3`, `4`.
- `card V = 8`: the replicated seed gives `64/24 = 8/3`, matching the explicit `k = 8` witness of
  6.3.
- `card V = 6` is not a multiple of four; it is covered by 8.1 instead.

### 6.3 Explicit witnesses for `k = 5, …, 8`

For each row of the table, the cochain on `complete (Fin k)` with values in `Sym(3)`, listed by
its non-identity edges `(u, v)`, `u < v`, in one-line notation, has the stated `defect`, every
gauge costs at least the stated `gaugeDist`, and some gauge costs exactly that. Its ratio is
`k/3`. *Needs:* 2.5, 4.2 (Beasley, Theorem 4 and Appendix A).

| `k` | non-identity edges | `defect` | `gaugeDist` |
| --- | --- | --- | --- |
| 5 | `(0,1), (1,2), (2,3) ↦ (1 0 2)` | 10 | 6 |
| 6 | `(0,1), (1,3) ↦ (1 2 0)`; `(0,3), (0,4), (1,5), (4,5) ↦ (2 0 1)` | 36 | 18 |
| 7 | `(0,1), (0,3), (0,4), (1,2), (1,5), (2,3) ↦ (1 0 2)` | 28 | 12 |
| 8 | `(0,1), (0,7), (1,2), (2,5), (2,7) ↦ (0 2 1)`; `(1,3), (1,4), (1,6), (3,7) ↦ (1 0 2)`; `(0,4), (2,3), (2,4) ↦ (2 1 0)`; `(4,7) ↦ (2 0 1)` | 72 | 27 |

**Checks.**

- Ratios: `10/6 = 5/3`, `36/18 = 2`, `28/12 = 7/3`, `72/27 = 8/3`.
- In each row all `k` star gauges cost exactly the stated `gaugeDist`, as 4.3 requires.
- The `k = 5` and `k = 7` witnesses take values in `{e, t}`; the `k = 6` and `k = 8` witnesses
  use 3-cycles.

### 6.4 Coefficient subgroups at `k = 4`

With the restricted moved-point norm, `h1 (complete (Fin 4))` is `2` for the subgroup `{e, t}`
and `3/2` for the alternating subgroup `{e, c, c⁻¹}`, and
`h1 (complete (Fin 4)) (movedNorm (Fin 2)) = 2`. Together with 6.1 this shows that no abelian
subgroup of `Sym(3)` attains `4/3`. *Needs:* 3.1, 2.5, 1.2.

**Checks.**

- `{e, t}`: one `t` edge has `defect = 4`, `gaugeDist = 2`.
- Alternating subgroup: `α 1 3 = c`, `α 2 3 = c⁻¹`, identity elsewhere, has `defect = 9` and
  `gaugeDist = 6`, ratio `3/2`.
- The trivial subgroup has constant `0` with an empty ratio set; it does not attain `4/3`.

### Examples

The seed, its replications and the four witnesses of 6.3 realize `k/3` for `k = 4, …, 8` and for
every multiple of four.

### Dependencies

Layers 2–5.

## Layer 7: Kozlov's binary witnesses

Work with `Equiv.Perm (Fin 2)`-valued cochains on `complete V`, identified with edge sets: a
cochain is its set `E` of non-identity edges, and a gauge is a vertex set `S` (the vertices where
it is non-trivial).

### 7.1 The edge-set bridge

`defect α = 2 * #{triangles with an odd number of edges in E}` and `cost α β = 2 * #(E ∆ δS)`,
where `δS` is the set of edges with exactly one end in `S`. *Needs:* 2.2, 1.3; Mathlib
`SimpleGraph.edgeFinset`.

**Checks.**

- One edge of `complete (Fin 4)`: two odd triangles, `defect = 4`.
- Gauging that edge by flipping one endpoint: `E ∆ δS` has two edges, `cost = 4`.
- The empty set `S` gives `cost = 2 * #E`.

### 7.2 Cut-minimal graphs

A graph `E` on `V` is cut-minimal if for every `S` the number of edges of `E` across `S` is at most
the number of non-edges across `S`. Prove that `E` is cut-minimal if and only if
`gaugeDist α = 2 * #E`. *Needs:* 7.1, 2.5.

**Checks.**

- One edge on `complete (Fin 3)` is cut-minimal and has `gaugeDist = 2 = 2 · 1`.
- The star at a vertex of `complete (Fin 4)` is a cut, so `gaugeDist = 0 ≠ 6`, and it is not
  cut-minimal.
- The empty graph is cut-minimal with `gaugeDist = 0`.

### 7.3 Staircase graphs

For `c, t ≥ 1` and `n = c(2t+1)`, the graph `staircase c t` on
`Fin (c * t) ⊕ Fin (c * t) ⊕ Fin c` joins `inl i` to `inr (inl j)` exactly when
`i < c * (t - j / c)` (natural-number division and subtraction, with no underflow since
`j < c * t`), and has no other edges. It is the bipartite graph `G_n(λ)` of Kozlov's
Definition 3.2 for `λ` the `c`-fold blow-up of the staircase partition `(t, t−1, …, 1)`, with the
`c` vertices of `Fin c` isolated. Prove:

- `#E = c² t (t+1) / 2`;
- `staircase c t` is cut-minimal (Kozlov, Lemma 3.8 with Corollary 3.13);
- the number of triangles with an odd number of edges is `(n / 3) * #E`, a real quotient.

*Needs:* 7.2; Mathlib `SimpleGraph.fromRel`.

**Checks.**

- For `(c, t) = (1,1), (1,2), (1,3), (1,4), (2,1), (2,2), (4,1)`, so `n = 3, 5, 7, 9, 6, 10, 12`:
  `#E = 1, 3, 6, 10, 4, 12, 16`.
- On the same instances, every cut has at most as many edges of `E` as non-edges, and the minimum
  of `#(E ∆ δS)` is `#E`.
- On the same instances the odd-triangle counts are `1, 5, 14, 30, 8, 40, 64 = n · #E / 3`. Read
  with natural division at `n = 5`, `(5/3) · 3` would be `3 ≠ 5`.

### 7.4 Kozlov's theorem

If `n = card V ≥ 3` is not a power of two, `h1 (complete V) (movedNorm (Fin 2)) = n / 3`
(`h1_complete_movedNorm_fin_two`): write `n = c(2t+1)` with `t ≥ 1`, transport `staircase c t`
to `V` by 2.3, and combine 7.1–7.3 with 4.2 (Kozlov, Theorem 4.2 and Corollary 4.3). Nothing is
asserted at powers of two. *Needs:* 7.3, 4.2, 2.3.

**Checks.**

- `n = 3, 5, 6, 7, 9, 10, 12`: ratios `1, 5/3, 2, 7/3, 3, 10/3, 4 = n/3`.
- `n = 4` fails the hypothesis, and there the constant is `2 > 4/3` (6.4).
- `n = 8` fails the hypothesis; the statement says nothing there.

### Examples

`staircase 1 2` on five vertices is the binary `k = 5` witness of 6.3 up to relabelling.

### Dependencies

Layers 2–4.

## Layer 8: the headline

### 8.1 Every `k ≥ 4`

For `card V ≥ 4`, `h1 (complete V) (movedNorm (Fin 3)) = card V / 3`
(`h1_complete_movedNorm_fin_three`) and `h1Norm (complete V) (movedNorm (Fin 3)) =
card V / (card V − 2)` (`h1Norm_complete_movedNorm_fin_three`). If `4 ∣ card V`, this is 6.2.
Otherwise `card V` is not a power of two; embed Kozlov's witness of 7.4 through the subgroup
`{e, t}`, which keeps its defect (2.6). By the parity retraction of 1.4, for a cochain with values
in `{e, t}` and any `Sym(3)` gauge `β`, the edge terms of the gauge `parityRetract t ∘ β` are the
retractions of those of `β`, so its cost is no larger; hence `gaugeDist` over `Sym(3)` equals
`gaugeDist` over `{e, t}`, and the ratio is `card V / 3` (Beasley, Corollary 7 and Theorem 8).
*Needs:* 6.2, 7.4, 4.2, 3.3, 2.6, 1.4.

**Checks.**

- `k = 4, 5, 6, 7, 8` and `12`: values `4/3, 5/3, 2, 7/3, 8/3, 4`.
- Normalized, `k = 4, …, 8`: `2, 5/3, 3/2, 7/5, 4/3`.
- `k = 3`: the bound of 4.2 gives `1`, and the statement is not made there.

### 8.2 All degrees

`h1Sym (complete V) = card V / 3` for `card V ≥ 4` (`h1Sym_complete`): each degree `≥ 2` is
bounded below by 4.2 and 4.4, and degree 3 attains the bound by 8.1. *Needs:* 8.1, 4.2, 4.4,
3.4.

**Checks.**

- `complete (Fin 4)`: degree 2 gives `2`, degree 3 gives `4/3`, and the infimum is `4/3`.
- Admitting degree 1 would give `0`, not `4/3` (3.4).
- `complete (Fin 6)`: degree 2 gives `2` by 7.4 and degree 3 gives `2`; the infimum is `2`.

### 8.3 Comparison with `𝔽₂`

`h1Sym (complete (Fin 4)) = 4/3 < 2 = h1 (complete (Fin 4)) (movedNorm (Fin 2))`: at `k = 4` the
permutation constant lies strictly below the `𝔽₂` constant. *Needs:* 8.2, 6.4.

**Checks.**

- The two sides are `4/3` and `2`.
- At `k = 5` both are `5/3`, so the inequality of 3.4 is an equality there.
- At `k = 8` the permutation constant is `8/3` and the `𝔽₂` constant is `20/7`.

### Examples

At `k = 4` the three coefficient groups `{e, t}`, the alternating subgroup and `Sym(3)` give `2`,
`3/2` and `4/3`.

### Dependencies

Layers 1, 3, 4, 6 and 7.

## Layer 9: the cross-degree convention

### 9.1 The distance with errors

Chapman and Lubotzky compare permutations of different degrees. For `σ` of degree `n` and `τ` of
degree `m`, both at least `2`, define

```text
distErr σ τ = 1 − #{ j < min(n, m) : σ j = τ j } / max(n, m),
```

the values compared as natural numbers. Prove that it is the normalized Hamming distance when
`n = m`, that it is symmetric, and that it is at least `1 − min(n, m)/max(n, m)`. *Needs:* 1.3
(Chapman–Lubotzky II, equation (2.9)).

**Checks.**

- `distErr id₂ id₃ = 1/3` and `distErr t id₃ = 2/3` with `t` of degree 3.
- `n = m = 3`: `distErr t s = 3/3 = movedNorm (t⁻¹ * s) / 3`.
- `distErr id₃ id₄ = 1/4` and `distErr id₃ id₅ = 2/5`, the baseline values. At degree `0` the
  formula would give `distErr id₀ id₀ = 1 − 0/0 = 1 ≠ 0`, which is why degrees start at `2`.

### 9.2 The cross-degree constant

For a cochain `α` of degree `n ≥ 2` on `X` and a gauge `β` of degree `m ≥ 2`, the cross-degree
cost `Cochain.costErr α β` is the sum over edges `u < v` of `distErr (α u v) (β u * (β v)⁻¹)`.
`Cochain.gaugeDistErr α` is its infimum over all gauge degrees `m ≥ 2` and all gauges of that
degree. `h1Err X` is the infimum, over cochain degrees `n ≥ 2` and cochains of degree `n` with
`gaugeDistErr α > 0`, of `(defect α / n) / gaugeDistErr α`, where `defect α` is the sum over
triangles of holonomy moved counts. At `m = n`, `n * costErr α β = cost α β`, using conjugation
invariance and inversion of the moved-point norm. *Needs:* 9.1, 2.2, 2.3 (Chapman–Lubotzky II,
equation (2.8) and footnote 2).

**Checks.**

- The degree-3 identity cochain on `complete (Fin 4)` has `defect = 0` and `gaugeDistErr = 0`,
  and is excluded; admitted, its quotient would be `0/0 = 0`.
- The seed: normalized defect `8/3` and `gaugeDistErr = 2`, ratio `4/3`.
- At equal degrees the seed's cheapest degree-3 gauge has cross-degree cost `6/3 = 2`.

### 9.3 Bounds

- Lower bound: `card V / 3 ≤ h1Err (complete V)`, from the star gauge, which has the cochain's
  own degree.
- Baselines: a degree-3 permutation and a degree-2 permutation have `distErr ≥ 1/3`; a degree-3
  permutation and a degree-`m` permutation with `m ≥ 4` have `distErr ≥ 1 − 3/m ≥ 1/4`.
- The seed of 6.1 has `gaugeDistErr = 2`: gauge degree `m ≥ 5` costs at least
  `6(1 − 3/m) ≥ 12/5`, and the minima in degrees `2, 3, 4` are `10/3`, `2` and `3`.
- The section count of 5.2 uses nothing about the degree of the gauge, so replicated seeds have
  no cheaper cross-degree gauge.
- For Kozlov's witness at `card V = q(2t+1)`, with `D₃ = q² t (t+1) / 3`, the baselines exceed
  `D₃` because `q (4t² + 4t + 3) ≥ 6t + 3`.

*Needs:* 9.2, 4.1, 5.2, 6.1, 7.3 (Beasley, Proposition 10).

**Checks.**

- The star bound at the seed and at the binary `k = 5` witness: `4 · 2 = 8 = 3 · (8/3)` and
  `5 · 2 = 10 = 3 · (10/3)`.
- Degree-1 gauges are excluded; the seed's minimum there would be `14/3`.
- `(q, t) = (1, 1), (1, 2), (2, 1)`: `11 ≥ 9`, `27 ≥ 15`, `22 ≥ 9`.

### 9.4 The cross-degree value

`h1Err (complete V) = card V / 3` for every `card V ≥ 4` (`h1Err_complete`). *Needs:* 9.3, 8.1.

**Checks.**

- `complete (Fin 4)`: `(8/3)/2 = 4/3`.
- `complete (Fin 5)`: the binary witness gives `(10/3)/2 = 5/3`.
- `complete (Fin 8)`: the replicated seed gives `(64/3)/8 = 8/3`.

### Examples

The seed at `k = 4` has the same value `4/3` in the counting, same-degree and cross-degree
conventions.

### Dependencies

Layers 1, 2, 4–8.

## Downstream consumers

Any development of Linial–Meshulam random complexes, of cosystolic expansion, or of the
Chapman–Lubotzky stability of homomorphisms consumes Layers 1–4: the conjugation-invariant norm
API, the cochain and gauge-distance theory with its invariances, and the star bound. Layer 7.1–7.2
is the `𝔽₂` edge-set dictionary such developments use.

## References

- [chapman-lubotzky-i] M. Chapman and A. Lubotzky, *Stability of homomorphisms, coverings and
  cocycles I: equivalence*, arXiv:2310.17474v2, cited in that version; published in Eur. J. Math.
  11 (2025), art. 13. §5.1, pp. 15–16: nonabelian 1-cochains, holonomy, and the coboundary
  convention (2.2).
- [chapman-lubotzky-ii] M. Chapman and A. Lubotzky, *Stability of homomorphisms, coverings and
  cocycles II: examples, applications and open problems*, arXiv:2311.06706v3, cited in that
  version; published in Adv. Math. 463 (2025), 110117. Footnote 2, p. 1:
  `h₁(·, Sym) ≤ h₁(·, 𝔽₂)` (3.4). Equation (2.8), pp. 6–7: the constants, degrees from `2`,
  non-coboundaries only (3.4, 9.2). Equation (2.9), p. 6: the distance with errors (9.1).
  Proposition 3.2, pp. 8–9: the star bound (4.1, 4.2).
- [kozlov] D. N. Kozlov, *The first Cheeger constant of a simplex*, arXiv:1610.07136v2, cited in
  that version; published in Graphs Combin. 33 (2017), no. 6, 1543–1564. Definition 3.2, p. 6
  (7.3); Lemma 3.8, p. 8, and Corollary 3.13, p. 11 (cut minimality, 7.3); §3.3, pp. 8–9 (edge
  counts, 7.3); Theorem 4.2 and Corollary 4.3, p. 11 (7.4). Strictness at powers of two is
  Conjecture 5.1, p. 13, and is not used.
- [meshulam-wallach] R. Meshulam and N. Wallach, *Homological connectivity of random
  k-dimensional complexes*, arXiv:math/0609773v1, cited in that version; published in Random
  Structures Algorithms 34 (2009), 408–417. Proposition 2.1, pp. 4–5: `h₁(Δ^[n], 𝔽₂) ≥ n/3`
  (background to 4.2).
- [linial-meshulam] N. Linial and R. Meshulam, *Homological connectivity of random 2-complexes*,
  Combinatorica 26 (2006), 475–487; cited for the definition of the `𝔽₂` constant only, by
  bibliographic data, without a checked text.
- [beasley] Jeromie Beasley, *The Permutation Coboundary Constant of the Complete Complex Is k/3
  for Every k≥4: Including the Powers of Two, with Four Hamming-Native Readings That Do Not
  Obstruct*, Zenodo, doi:10.5281/zenodo.23245792, version 7 (concept DOI
  10.5281/zenodo.22090958). Proposition 1, pp. 2–3 (4.1); Corollary 2, p. 3 (4.3);
  Theorem 4, pp. 3–4, and Appendix A, p. 19 (6.3); Proposition 5,
  pp. 4–5 (6.1, 6.4); Lemma 6, pp. 6–7 (5.1, 5.2); Corollary 7 and Theorem 8, pp. 7–8 (6.2,
  8.1); Proposition 10, pp. 8–9 (9.3, 9.4). In §3.1, p. 5, the cyclic-subgroup witness has
  `defect = 9` and `gaugeDist = 6`, not the printed `6` and `4`; the ratio `3/2` is unaffected.

## Provenance

Existing formalization, cited as a source and not as the specification:
[`dicipler-pixel/coboundary-k3-lean`](https://github.com/dicipler-pixel/coboundary-k3-lean)
(MIT), at commit
[`59a59fa`](https://github.com/dicipler-pixel/coboundary-k3-lean/tree/59a59fa9bc2d2364a8945cf05f444b9c0ed98fce).
At that commit it proves, on `Fin k → Fin k → S3` carriers, the 4.1–4.2 star bound for `Sym(3)`
(`CoboundaryK3/Constant.lean`), the 6.3 witnesses and `h₁ = k/3` for `k = 4, …, 8`, and the
replication of 5.1–5.2 with `h₁ = k/3` at every multiple of four
(`CoboundaryK3/Replication.lean`). The parity retraction of 1.4 is proved on its branch
`claude-k3-v7` at commit
[`204055de`](https://github.com/dicipler-pixel/coboundary-k3-lean/tree/204055de). It does not
treat a general coefficient group. The author of that repository is the author of this roadmap.

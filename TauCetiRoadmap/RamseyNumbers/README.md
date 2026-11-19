# Roadmap: ramsey numbers

**Summary.** This roadmap develops finite Ramsey theory for complete graphs and complete uniform
hypergraphs: the existence of Ramsey numbers, the classical recursive upper bounds, the small
values that those bounds and explicit colourings settle, Erdős's counting lower bound, and Schur's
theorem on monochromatic solutions of `x + y = z`. For a finite set of colours `K` and a demand
`f : K → ℕ`, the Ramsey number `R(f)` is the least `n` such that every colouring of the edges of
the complete graph on `n` vertices has, for some colour `k`, a set of `f(k)` vertices all of whose
edges have colour `k`; the two-colour number is `R(s, t)`. Sets of zero or one vertex count as
monochromatic, so the degenerate values are fixed by the definition rather than by convention:
`R(s, t) = 0` when `s` or `t` is `0`, `R(1, t) = 1` and `R(2, t) = t` for `t ≥ 1`. Every target is
a statement about colourings and these numbers; no search procedure is specified.

The headline theorems are these.

- *Ramsey's theorem.* For every finite set of colours, every demand `f` and every uniformity `m`,
  some `n` has the property that every colouring of the `m`-element subsets of an `n`-element set
  has, for some colour `k`, an `f(k)`-element set all of whose `m`-element subsets have colour `k`;
  the property then holds for every larger `n`.
- *The recursive bounds of Greenwood and Gleason.* If every `f(k) ≥ 2`, then
  `R(f) ≤ 2 − r + Σₖ R(f − eₖ)` with `r` colours; `R(s + 1, t + 1) ≤ binom(s + t, s)`; and the
  two-colour bound is strict when both terms on the right are even.
- *Small values.* `R(3, 4) = 9`, `R(3, 5) = 14`, `R(4, 4) = 18` and `R(3, 3, 3) = 17`.
- *Erdős's lower bound and Schur's theorem.* `R(k, k) > 2^(k/2)` for every `k ≥ 3`. If `N + 1` is
  at least the Ramsey number of triangles in `r` colours, every colouring of the positive integers
  with `r` colours has positive `x`, `y` with `x + y ≤ N` such that `x`, `y` and `x + y` have one
  colour.

The roadmap is built on Mathlib's edge labellings of complete graphs and its cliques of a given
size, which carry every statement about graphs. Mathlib's Hales–Jewett, van der Waerden and
Hindman theorems are neighbouring partition theorems that are cited, not used; infinite Ramsey
theorems on the subsets of `ℕ` are stated in the Banach space roadmap, which nothing here needs.

Layer 1 below defines the Ramsey number and proves its existence; Layer 2 does the same for
hypergraphs and compares the two at uniformity two. Layer 3 proves the upper bounds, Layer 4 the
exact values, Layer 5 the lower bound and Layer 6 Schur's theorem. Layers 2, 3, 5 and 6 depend on
Layer 1 only, and Layer 4 on Layers 1 and 3.

## Conventions

- **Colourings of graphs.** A colouring of the edges of the complete graph on `Fin n` with colours
  in a type `K` is Mathlib's `SimpleGraph.TopEdgeLabeling (Fin n) K`, a function on the edge set of
  the complete graph. For a colouring `C` and a colour `k`, `C.labelGraph k` is the graph of the
  edges of colour `k`, and a monochromatic set of `j` vertices in colour `k` is a Finset `s` with
  `(C.labelGraph k).IsNClique j s`: it has `j` elements and any two of them are joined by an edge
  of colour `k`. The empty set is a clique of size `0` and every singleton a clique of size `1`.
- **Demands and numbers.** A demand is a function `f : K → ℕ`. The Ramsey property `RamseyProp f n`
  and the Ramsey number `ramseyNumber f` are defined in 1.1; the number is an infimum in `ℕ`, so it
  is `0` on an empty set of admissible `n`, and 1.2 shows that this does not happen for finite
  `K`. The two-colour number `R(s, t)` is `ramseyNumber ![s, t]`, colour `0` with demand `s` and
  colour `1` with demand `t`; `R(3, 3, 3)` is `ramseyNumber ![3, 3, 3]`. For `r` colours, the
  Ramsey number of triangles is `ramseyNumber (fun _ : κ => 3)` with `κ` a type of `r` elements.
- **Hypergraphs.** A colouring of the `m`-element subsets of `Fin n` is a function on the subtype
  `{s : Finset (Fin n) // s.card = m}`. A set `S` is monochromatic in colour `k` when every
  `m`-element subset of `S` has colour `k`; a set with fewer than `m` elements is monochromatic in
  every colour.
- **Arithmetic.** Statements avoid natural-number subtraction where it would truncate: the binomial
  bound is written for `R(s + 1, t + 1)`, and the recurrence of 3.1, where every entry is at least
  `2`, lowers an entry by one without truncation. Erdős's bound `R(k, k) > 2^(k/2)` with a real
  exponent is written `2 ^ k < R(k, k) ^ 2`.

## Layer 1: Ramsey numbers of complete graphs

### 1.1 The Ramsey property and the Ramsey number

Define `RamseyProp f n`: every colouring of the edges of the complete graph on `Fin n` with colours
in `K` has a colour `k` and a set of `f k` vertices that is a clique of `C.labelGraph k`. Define
`ramseyNumber f` as the infimum in `ℕ` of the `n` with `RamseyProp f n`. This is the number
`n(k₁, …, kᵣ)` of Greenwood and Gleason (§1, p. 1) and the number `R(k₁, …, kᵣ)` of Radziszowski's
survey (§1, p. 5), both defined as a least number of vertices; the definition here makes sense for
every demand, including those with entries `0` and `1`, and for every type of colours.

For two colours the property has the familiar form: `RamseyProp ![s, t] n` holds exactly when every
simple graph on `n` vertices has an independent set of `s` vertices or a clique of `t` vertices.
Mathlib's `SimpleGraph.toTopEdgeLabeling` colours the edges of a graph `1` and its non-edges `0`,
and `SimpleGraph.TopEdgeLabeling.labelGraph_toTopEdgeLabeling` shows that every colouring with
colours `Fin 2` arises in this way.

**Checks.**
- With no colours, `R = 2`: on at most one vertex there is exactly one colouring (there are no
  edges), and it has no colour to offer; on two or more vertices there is no colouring at all.
- With one colour, `R(s) = s` for every `s`: the only colouring of `K_n` makes every set
  monochromatic.
- If some `f k = 0`, then `R(f) = 0`, since the empty set is a clique of size `0` in every graph.
  If every `f k ≥ 1`, `K` is nonempty and some `f k = 1`, then `R(f) = 1`.
- Two colours, computed from the definition by exhaustive search: `R(0, t) = R(s, 0) = 0`;
  `R(1, t) = 1` for `t ≥ 1`; `R(2, t) = t` for `1 ≤ t ≤ 4`, and in general, since a colouring with
  an edge of colour `0` contains a monochromatic pair and the colouring with every edge of colour
  `1` on `t − 1` vertices contains no `t`-set of colour `1`; `R(3, 3) = 6` and `R(3, 4) = 9`.
- The pentagon with its sides in colour `0` and its diagonals in colour `1` has no monochromatic
  triangle, so `RamseyProp ![3, 3] 5` fails. The number is the least `n` with the property; the
  largest `n` without it would give `5` for `R(3, 3)`, one less than the value of Greenwood and
  Gleason (Theorem 1, p. 1).

*Needs:* Mathlib `SimpleGraph.TopEdgeLabeling`, `SimpleGraph.EdgeLabeling.labelGraph`,
`SimpleGraph.IsNClique`; for the comparison with graphs, `SimpleGraph.toTopEdgeLabeling`,
`SimpleGraph.TopEdgeLabeling.labelGraph_toTopEdgeLabeling`.

### 1.2 The finite Ramsey theorem

Prove `ramseyProp_iff_ramseyNumber_le`: for a finite type `K` and every demand `f`, `RamseyProp f n`
holds if and only if `ramseyNumber f ≤ n`. So some `n` has the property, the Ramsey number is the
least such `n`, and the property holds for every larger `n` (Ramsey, 1930; Diestel, Theorem 9.1.1,
p. 305, for the existence of such an `n` with two colours and equal demands, and Theorem 9.1.3,
p. 307, whose case `k = 2` gives it with `c` colours and equal demands; Greenwood and Gleason,
Corollary 2, p. 2, for the bound that gives existence in `r` colours).

Route: the property is upward closed, since a colouring of `K_(n+1)` restricts along the embedding
`Fin n ↪ Fin (n + 1)` (Mathlib's `SimpleGraph.TopEdgeLabeling.pullback`) to a colouring of `K_n`,
and a monochromatic clique of the restriction maps to one of the original. Existence is by
induction on `Σₖ f k`, by the argument of 3.1 stated for the property rather than the number: if
`K` is empty the property holds for `n = 2`, since no colouring of `K_2` exists; if some
`f k ≤ 1` it holds for `n = f k`; otherwise, given `nₖ` with
`RamseyProp (f − eₖ) nₖ` for each `k`, a vertex of `K_n` with `n = 1 + Σₖ nₖ` has, by the
pigeonhole principle, at least `nₖ` neighbours in some colour `k`, and among them either a set of
`f j` vertices in a colour `j ≠ k` or a set of `f k − 1` vertices in colour `k`, which the vertex
extends. Then the set of admissible `n` is nonempty and upward closed, and `Nat.sInf_mem` and
`Nat.sInf_le` identify its least element with `ramseyNumber f`.

**Checks.**
- Finiteness of `K` is needed. With `K = ℕ` and `f k = 3` for all `k`, the colouring of `K_n` that
  gives distinct edges distinct colours has no monochromatic triangle, so no `n` has the property;
  the infimum is `0`, and the equivalence fails at `n = 2`, where `0 ≤ 2` and the property fails.
- `RamseyProp ![3, 3] n` fails for `n ≤ 5` and holds for `6 ≤ n ≤ 8`, by exhaustive search; the same
  pattern, with the change at the computed value, holds for `![3, 4]`, `![2, 4]`, `![1, 3]`,
  `![0, 0]` and `![3, 3, 2]`.

*Needs:* 1.1; Mathlib `SimpleGraph.TopEdgeLabeling.pullback`,
`SimpleGraph.TopEdgeLabeling.labelGraph_adj`, `Finset.exists_lt_of_sum_lt`, `Nat.sInf_mem`,
`Nat.sInf_le`. (Proved here, following the cited routes.)

### 1.3 Relabelling the colours

Prove `ramseyNumber_comp_equiv`: for a bijection `e : K' ≃ K` between types of colours,
`ramseyNumber (f ∘ e) = ramseyNumber f`. In particular `R(s, t) = R(t, s)` (Greenwood and Gleason,
§2, p. 2; Radziszowski, §1, p. 5). No finiteness is assumed: the two properties agree for every
`n`.

Route: composing colourings with `e` and with its inverse (Mathlib's
`SimpleGraph.EdgeLabeling.compRight`) gives a bijection between the colourings, under which the
graph of colour `e k'` for one is the graph of colour `k'` for the other.

**Checks.**
- `R(1, 2) = R(2, 1) = 1` and `R(2, 3) = R(3, 2) = 3`, from the table of 1.1.
- A map of colours that is not a bijection changes the number: composing `![3, 3]` with the map
  from `Fin 1` to colour `0` gives the one-colour demand `![3]`, with `R(3) = 3 ≠ 6`.

*Needs:* 1.1; Mathlib `SimpleGraph.EdgeLabeling.compRight`. (Proved here.)

### Examples

The values of `R(s, t)` for `s, t ≤ 4` other than `R(4, 4)`, the numbers with zero, one and three
colours computed in 1.1, and the pentagon colouring.

### Dependencies

Mathlib `SimpleGraph.TopEdgeLabeling`, `SimpleGraph.EdgeLabeling.labelGraph`,
`SimpleGraph.TopEdgeLabeling.labelGraph_adj`, `SimpleGraph.TopEdgeLabeling.pullback`,
`SimpleGraph.EdgeLabeling.compRight`, `SimpleGraph.IsNClique`, `SimpleGraph.toTopEdgeLabeling`,
`SimpleGraph.TopEdgeLabeling.labelGraph_toTopEdgeLabeling`, `Finset.exists_lt_of_sum_lt`,
`Nat.sInf_mem`, `Nat.sInf_le`. No other layer.

## Layer 2: Ramsey numbers of hypergraphs

### 2.1 The hypergraph Ramsey property

Define `HypergraphRamseyProp m f n`: every colouring `c` of the `m`-element subsets of `Fin n` with
colours in `K` has a colour `k` and a set `S` of `f k` elements such that every `m`-element subset
of `S` has colour `k`. Define `hypergraphRamseyNumber m f` as the infimum in `ℕ` of the `n` with
this property (Radziszowski, §1, p. 5, where the number is written `R(k₁, …, kᵣ; m)`; Diestel,
p. 307, writes `R(k, c, r)` for `c` colours and equal demands `r`).

**Checks.** All computed from the definition by exhaustive search on small cases.
- Uniformity `0`: the only `0`-element subset is `∅`, and a colouring is the choice of its colour,
  so the number is the largest value of `f`, and `0` with no colours.
- Uniformity `1`: colourings of the points, and by the pigeonhole principle the number is
  `1 + Σₖ (f k − 1)` when every `f k ≥ 1` (so `1` with no colours), and `0` when some `f k = 0`.
- A colour with `f k < m` is satisfied by every set of `f k` elements, since such a set has no
  `m`-element subset: for `m = 3` and demands `(2, 5)` the number is `2`, for `(1, 4)` it is `1`.
- For `m = 3`, demands `(3, 3)` give `3` (the one triple of a three-element set has some colour),
  and demands `(4, 3)` give `4`.

*Needs:* Mathlib `Finset.card`.

### 2.2 Ramsey's theorem for hypergraphs

Prove `hypergraphRamseyProp_iff`: for a finite type `K`, every uniformity `m` and every demand `f`,
`HypergraphRamseyProp m f n` holds if and only if `hypergraphRamseyNumber m f ≤ n` (Ramsey, 1930;
Diestel, Theorem 9.1.3, p. 307, for the existence of such an `n` when `k, c, r ≥ 1` and the demands
are equal; Erdős, p. 293, states the existence for two colours).

Route: upward closure by restricting a colouring of the `m`-subsets of `Fin (n + 1)` to those of
`Fin n`. Existence by induction on `m`, and for fixed `m + 1` by induction on `Σₖ f k`, through the
bound `R⁽ᵐ⁺¹⁾(f) ≤ 1 + R⁽ᵐ⁾(g)` with `gₖ = R⁽ᵐ⁺¹⁾(f − eₖ)` when every `f k ≥ 1` (Erdős, p. 293,
inequality (3), for two colours, attributed there to Szekeres): fix the last element `v`, colour
each `m`-subset `T` of the others by the colour of `T ∪ {v}`, take a set `S` of `gₖ` elements on
which this colouring is constant `k`, and apply the property for `f − eₖ` inside `S`; a set of
`f k − 1` elements of colour `k` there extends by `v`. The base case `m = 0` is the computation in
the first Check of 2.1.

**Checks.**
- Finiteness of `K` is needed, by 2.3 and the Check of 1.2 with infinitely many colours.
- For `m = 3` and demands `(2, 4, 4)` the number is `2`, the demand `2 < 3` being met by every pair,
  and the property holds for every `n ≥ 2` up to `5`.

*Needs:* 2.1; Mathlib `Nat.sInf_mem`, `Nat.sInf_le`, `Finset.map`. (Proved here, following the
cited route.)

### 2.3 Uniformity two

Prove `hypergraphRamseyProp_two_iff`: for every type of colours `K`, every demand `f` and every `n`,
`HypergraphRamseyProp 2 f n` holds if and only if `RamseyProp f n`. Hence the two numbers agree at
uniformity two.

Route: an edge `s(x, y)` of the complete graph with `x ≠ y` corresponds to the two-element set
`{x, y}`, which gives a bijection between the two kinds of colourings; a set of vertices is a clique
of `C.labelGraph k` exactly when all its two-element subsets have colour `k`.

**Checks.**
- The two numbers agree, computed from both definitions, for no colours (both `2`), for the demands
  `![0]`, `![1]`, `![2]`, `![3]`, and for `(2, 2)`, `(2, 3)`, `(3, 3)`, `(1, 3)`, `(0, 2)`,
  `(2, 2, 2)` and `(3, 2, 2)`.
- With colourings of all subsets of `Fin n` in place of the two-element subsets, the version with no
  colours would hold for every `n` (no colouring exists, since `∅` must receive a colour), giving
  `0` instead of `2`; the definition of 2.1 colours exactly the `m`-element subsets.

*Needs:* 1.1, 2.1; Mathlib `SimpleGraph.TopEdgeLabeling`, `SimpleGraph.EdgeLabeling.labelGraph`,
`SimpleGraph.IsNClique`, `Finset.card_eq_two`. (Proved here.)

### Examples

Uniformities `0`, `1`, `2` and `3` with the demands of the Checks, and the comparison with Layer 1.

### Dependencies

Layer 1. Mathlib `Finset.card`, `Finset.map`, `Finset.card_eq_two`, `Nat.sInf_mem`, `Nat.sInf_le`,
`SimpleGraph.TopEdgeLabeling`, `SimpleGraph.EdgeLabeling.labelGraph`, `SimpleGraph.IsNClique`.

## Layer 3: upper bounds

### 3.1 The recurrence

Prove `ramseyNumber_add_card_le`: for a finite type `K` of `r` colours and a demand `f` with
`2 ≤ f k` for every `k`,

    R(f) + r ≤ 2 + Σₖ R(f − eₖ),

where `f − eₖ` is `Function.update f k (f k − 1)` (Radziszowski, §6.1, inequality (a), p. 55,
described there as implicit in Greenwood and Gleason; Greenwood and Gleason, Theorem 2, p. 2, for
two colours, where it reads `R(s, t) ≤ R(s − 1, t) + R(s, t − 1)`, and Theorem 6, p. 6, for
triangles, where it reads `tᵣ ≤ r (tᵣ₋₁ − 1) + 2` for the number `tᵣ` of triangles in `r` colours).

Route: put `Rₖ = R(f − eₖ)`, which is at least `1` because every entry of `f − eₖ` is at least `1`,
and `n = 2 + Σₖ (Rₖ − 1) = 2 − r + Σₖ Rₖ`. If `K` is empty the claim reads `2 ≤ 2`. Otherwise a
vertex of a coloured `K_n` has `n − 1 = 1 + Σₖ (Rₖ − 1)` neighbours, more than `Σₖ (Rₖ − 1)`, so by
the pigeonhole principle (`Finset.exists_lt_of_sum_lt`) at least `Rₖ` of them in some colour `k`;
by 1.2 they contain a set
of `f j` vertices in some colour `j ≠ k`, or a set of `f k − 1` vertices in colour `k` that the
vertex extends. So `RamseyProp f n`, and 1.2 gives `R(f) ≤ n`.

**Checks.**
- Two colours: `R(3, 3) + 2 ≤ 2 + R(2, 3) + R(3, 2) = 8`, so `R(3, 3) ≤ 6`, and the pentagon of
  1.1 gives `R(3, 3) = 6` (Greenwood and Gleason, Theorem 1, p. 1).
- Three colours: `R(2, 3, 3) = 6` (an edge of colour `0` is a monochromatic pair, and a colouring
  without one is a two-colouring), so `R(3, 3, 3) + 3 ≤ 2 + 3 · 6`, that is `R(3, 3, 3) ≤ 17`.
- One colour: `R(s) + 1 = s + 1 = 2 + R(s − 1)`, equality. No colours: `2 ≤ 2`.
- The hypothesis `2 ≤ f k` is needed: for `f = (1, 1)` the left side is `R(1, 1) + 2 = 3` and the
  right side is `2 + R(0, 1) + R(1, 0) = 2`.
- The inequality holds, computed from the definition, on the 24 demands with two or three colours,
  entries in `{2, 3, 4}`, at most one entry `4`, and with three colours at least one entry `2`.

*Needs:* 1.2, 1.3; Mathlib `Finset.exists_lt_of_sum_lt`, `Function.update`. (Proved here,
following the cited route.)

### 3.2 The binomial bound

Prove `ramseyNumber_two_le_choose`: `R(s + 1, t + 1) ≤ binom(s + t, s)` for all `s, t`
(Greenwood and Gleason, Corollary 1, p. 2; Erdős, Theorem 1, p. 292, for `s = t`, attributed there
to Szekeres).

Route: induction on `s + t` by 3.1 with two colours and Pascal's rule; the base cases
`R(1, t + 1) = R(s + 1, 1) = 1 = binom(t, 0) = binom(s, s)` come from the definition.

**Checks.**
- `s = t = 2` gives `R(3, 3) ≤ 6`, equality. The bound is not sharp beyond: `R(3, 4) ≤ 10`,
  `R(3, 5) ≤ 15` and `R(4, 4) ≤ 20`, against the values `9`, `14` and `18` of Layer 4.
- `s = 0` gives `R(1, t + 1) ≤ 1`, equality, and `t = 1` gives `R(s + 1, 2) ≤ s + 1`, equality.

*Needs:* 3.1; Mathlib `Nat.choose`, `Nat.succ_sub_one`, `Nat.choose_succ_succ`. (Proved here,
following the cited route.)

### 3.3 The parity refinement

Prove `ramseyNumber_two_lt_of_even`: if `R(s + 1, t + 2)` and `R(s + 2, t + 1)` are both even, then
`R(s + 2, t + 2) < R(s + 1, t + 2) + R(s + 2, t + 1)` (Greenwood and Gleason, Theorem 3, p. 3;
Radziszowski, §2.3, item (a), p. 12).

Route: write the two terms as `2p` and `2q` and colour `K_(2p + 2q − 1)`. At a vertex with fewer than
`2p` neighbours of colour `0` and fewer than `2q` of colour `1`, the counts are exactly `2p − 1` and
`2q − 1`. If this happened at every vertex, the number of ends of edges of colour `0`,
`(2p + 2q − 1)(2p − 1)`, would be odd. So some vertex has `2p` neighbours of colour `0` or `2q` of
colour `1`, and the argument of 3.1 applies there.

**Checks.**
- `R(2, 4) = 4` and `R(3, 3) = 6` are even, so `R(3, 4) < 10`, that is `R(3, 4) ≤ 9`.
- The hypotheses are needed: `R(3, 3) = 6 = R(2, 3) + R(3, 2)`, with both terms odd.
- For `s = 0` the term `R(1, t + 2) = 1` is odd, so the statement never applies, in agreement with
  `R(2, t + 2) = t + 2 = R(1, t + 2) + R(2, t + 1)`.

*Needs:* 1.2, 1.3; Mathlib `SimpleGraph.sum_degrees_eq_twice_card_edges`, `Nat.even_mul`.
(Proved here, following the cited route.)

### Examples

The upper bounds for `R(3, 3)`, `R(3, 4)`, `R(3, 5)`, `R(4, 4)` and `R(3, 3, 3)` from 3.1 to 3.3.

### Dependencies

Layer 1. Mathlib `Finset.exists_lt_of_sum_lt`, `Function.update`, `Nat.choose`, `Nat.succ_sub_one`,
`Nat.choose_succ_succ`, `SimpleGraph.sum_degrees_eq_twice_card_edges`, `Nat.even_mul`.

## Layer 4: exact values

### 4.1 Triangle against four and five vertices

Prove `ramseyNumber_three_four`, `R(3, 4) = 9`, and `ramseyNumber_three_five`, `R(3, 5) = 14`
(Greenwood and Gleason, §3, p. 3; Radziszowski, Table Ia, §2.1, p. 6).

Route: `R(3, 4) ≤ 9` by 3.3. Colour the edges of the complete graph on `ℤ/13` by the colour `0`
when the difference of the ends is a cubic residue, that is one of `1, 5, 8, 12`, and `1` otherwise;
since `−1 = 12` is a cubic residue the colour of an edge does not depend on the order of its ends.
This colouring has no triangle of colour `0` and no five vertices of colour `1`, so `R(3, 5) ≥ 14`.
Then 3.1 gives `14 ≤ R(3, 5) ≤ R(2, 5) + R(3, 4) = 5 + R(3, 4)`, hence `R(3, 4) ≥ 9`, and both
equalities follow.

**Checks.**
- The circulant colouring of `ℤ/8` with colour `0` on the differences `±1` and `4` has no
  triangle of colour `0` and no four vertices of colour `1` (its largest monochromatic sets have
  `2` and `3` vertices), a direct witness of `R(3, 4) > 8`.
- The colouring of `ℤ/13` above has largest monochromatic sets of `2` vertices in colour `0` and `4`
  in colour `1`, computed.
- No colouring of `K_9` avoids a triangle of colour `0` and four vertices of colour `1`, by
  exhaustive search from the definition.

*Needs:* 1.2, 1.3, 3.1, 3.3; the values `R(2, t) = t` of the Checks of 1.1 and `R(3, 3) = 6` of
the Checks of 3.1; Mathlib `ZMod`, `SimpleGraph.EdgeLabeling.mk`. (Proved here,
following the cited route.)

### 4.2 Four against four

Prove `ramseyNumber_four_four`: `R(4, 4) = 18` (Greenwood and Gleason, §3, pp. 3–4; Radziszowski,
Table Ia, §2.1, p. 6).

Route: 3.1 and 1.3 give `R(4, 4) ≤ R(3, 4) + R(4, 3) = 18`. For the lower bound colour the edges
of the complete graph on `ℤ/17` by `0` when the difference is a nonzero square, one of
`1, 2, 4, 8, 9, 13, 15, 16`, and `1` otherwise (the Paley colouring; `−1 = 16` is a square). Four
vertices of one colour may be moved to `0, 1, B, C` by a translation and by multiplication with a
square or a non-square; then `B`, `C`, `1 − B`, `1 − C` and `B − C` would all be nonzero squares,
and no such pair exists.

**Checks.**
- The Paley colouring on `ℤ/17` has largest monochromatic sets of `3` vertices in each colour,
  computed.
- The squares modulo `17` are `1, 2, 4, 8, 9, 13, 15, 16`, and multiplication by the non-square `3`
  maps them onto the non-squares, so the two colours are exchanged by an automorphism of `ℤ/17`.

*Needs:* 1.2, 1.3, 3.1, 4.1; Mathlib `ZMod`, `SimpleGraph.EdgeLabeling.mk`. (Proved here,
following the cited route.)

### 4.3 Triangles in three colours

Prove `ramseyNumber_three_three_three`: `R(3, 3, 3) = 17` (Greenwood and Gleason, Theorem 4,
pp. 4–5; Radziszowski, §6, p. 55).

Route: `R(3, 3, 3) ≤ 17` by 3.1, as in its Check. For the lower bound let `F` be the field with
`16` elements, `F = 𝔽₂[x]/(x⁴ + x + 1)`, and colour the edge between `a ≠ b` by the coset of
`a − b` modulo the subgroup of cubes, which has index `3` in the multiplicative group of order `15`.
A monochromatic triangle may be moved to `0, 1, A` with `A` and `1 − A` both cubes, by a
translation and a multiplication with the inverse of one of its differences, and no cube `A` has
`1 − A` a cube (in characteristic `2`, `1 − A = 1 + A`).

**Checks.**
- The cubes in `F` are `1`, `x³`, `x³ + x`, `x³ + x²` and `x³ + x² + x + 1`, and the colouring has
  largest monochromatic sets of `2` vertices in each colour, computed.

*Needs:* 1.2, 1.3, 3.1; the value `R(2, 3, 3) = 6` of the Checks of 3.1; Mathlib `GaloisField`,
`SimpleGraph.EdgeLabeling.mk`. (Proved here,
following the cited route.)

### Examples

The circulant colourings of `ℤ/5`, `ℤ/8`, `ℤ/13` and `ℤ/17`, and the colouring of the field with
`16` elements.

### Dependencies

Layers 1 and 3. Mathlib `ZMod`, `GaloisField`, `SimpleGraph.EdgeLabeling.mk`.

## Layer 5: Erdős's lower bound

### 5.1 The counting criterion

Prove `lt_ramseyNumber_of_choose_mul_two_lt`: if `binom(n, k) · 2 < 2 ^ binom(k, 2)`, then
`n < R(k, k)` (Erdős, proof of Theorem 1, inequality (1), p. 292; Diestel, Lemma 11.1.2, p. 342,
in the language of random graphs).

Route: count colourings. For `k ≥ 2`, the colourings of `K_n` with two colours in which a fixed set
of `k` vertices is monochromatic number `2 · 2 ^ (binom(n, 2) − binom(k, 2))`, so under the
hypothesis fewer than `2 ^ binom(n, 2)` colourings, which is the number of all of them
(`SimpleGraph.card_topEdgeLabeling`), have a monochromatic set of `k` vertices; this is the union
bound `Finset.card_biUnion_le` over the `k`-element subsets. A remaining colouring
witnesses that `RamseyProp ![k, k] n` fails, and 1.2 gives `n < R(k, k)`. For `k ≤ 1`, the
hypothesis holds only for `k = 1` and `n = 0`, where `0 < R(1, 1) = 1`.

**Checks.**
- For `k = 3` the hypothesis holds exactly for `n ≤ 3` (`binom(4, 3) · 2 = 8 = 2³`), consistent with
  `R(3, 3) = 6`; for `k = 4` it holds exactly for `n ≤ 6`, against `R(4, 4) = 18`.
- For `k = 2` it holds for `n ≤ 1`, against `R(2, 2) = 2`; for `k = 0` it never holds.

*Needs:* 1.2; Mathlib `SimpleGraph.card_topEdgeLabeling`, `Finset.powersetCard`,
`Finset.card_powersetCard`, `Finset.card_biUnion_le`. (Proved here, following the cited route.)

### 5.2 The exponential lower bound

Prove `two_pow_lt_ramseyNumber_sq`: for every `k ≥ 3`, `2 ^ k < R(k, k) ^ 2`, that is,
`R(k, k) > 2^(k/2)` (Erdős, Theorem 1, p. 292; Diestel, Theorem 11.1.3, p. 342; Radziszowski,
§2.4, item (1), p. 14).

Route: let `n` be the largest number with `n² ≤ 2 ^ k`. Since `binom(n, k) · k!` is the descending
factorial of `n` of length `k`, which is at most `nᵏ`,
`(binom(n, k) · 2)² · (k!)² ≤ 4 · n^(2k) ≤ 4 · 2^(k²)`, and `2^(k + 2) < (k!)²` for `k ≥ 3`, so
`(binom(n, k) · 2)² < 2^(k² − k)` and the hypothesis of 5.1 holds. Hence `n + 1 ≤ R(k, k)` and
`2 ^ k < (n + 1)² ≤ R(k, k)²`.

**Checks.**
- The bound fails for `k = 2`: `2² = 4 = R(2, 2)²`. For `k = 1` and `k = 0` the right side is `1`
  and `0`.
- `k = 3`: `8 < 36`; `k = 4`: `16 < 324`.
- For `3 ≤ k < 400`, the number `n = ⌊2^(k/2)⌋` satisfies `binom(n, k) · 2 < 2 ^ binom(k, 2)`,
  computed exactly in integers; `2^(k + 2) < (k!)²` holds for `k = 3` (`32 < 36`) and fails for
  `k = 2` (`16 > 4`).

*Needs:* 5.1; Mathlib `Nat.descFactorial_eq_factorial_mul_choose`, `Nat.descFactorial_le_pow`,
`Nat.factorial`. (Proved here, following the cited route.)

### Examples

The ranges of `n` allowed by the criterion for `k ≤ 6`, and the comparison with the known values.

### Dependencies

Layer 1. Mathlib `SimpleGraph.card_topEdgeLabeling`, `Finset.powersetCard`,
`Finset.card_powersetCard`, `Finset.card_biUnion_le`, `Nat.descFactorial_eq_factorial_mul_choose`,
`Nat.descFactorial_le_pow`, `Nat.factorial`.

## Layer 6: Schur's theorem

### 6.1 Monochromatic solutions of `x + y = z`

Prove `exists_add_eq_of_ramseyNumber_le`: let `κ` be a finite type, `c : ℕ → κ` a colouring and `N` a
number with `R(3, …, 3) ≤ N + 1`, the demand being `3` for every colour of `κ`. Then there are
`x, y ≥ 1` with `x + y ≤ N` and `c x = c y = c (x + y)`; `x = y` is allowed. Only the values of `c`
on `1, …, N` matter. (Schur, 1916; Diestel, Chapter 9, Exercise 14, p. 320, for the existence of
such an `N`; Radziszowski, §6.2, item (i), p. 58, for the inequality `R(3, …, 3) ≥ S + 2`, which is
this statement in terms of the Schur number `S`, the largest `N` admitting a colouring with no such
solution.)

Route: colour the edge `{i, j}` of the complete graph on `{0, …, N}` by `c |i − j|`. By 1.2 there is a
monochromatic triangle `i < j < l`, and `x = j − i`, `y = l − j`, `x + y = l − i ≤ N` have one colour.

**Checks.**
- One colour: the number of triangles is `3`, so `N = 2` suffices, with `1 + 1 = 2`; `N = 1` admits
  no solution. Requiring `x ≠ y` would make the statement false at `N = 2`.
- Two colours: `R(3, 3) = 6` gives `N = 5`; the colouring of `1, …, 4` with `1, 4` in one colour and
  `2, 3` in the other has no monochromatic solution, so `5` is the least `N` for two colours.
- Three colours: `R(3, 3, 3) = 17` gives `N = 16`, while the largest `N` with a colouring of
  `1, …, N` in three colours without a monochromatic solution is `13`, computed by exhaustive search;
  the bound is not sharp.
- No colours: no function `ℕ → κ` exists, and the statement holds vacuously.
- Finiteness of `κ` is needed: with `κ = ℕ`, the infimum is `0` (Check of 1.2) and the identity
  colouring has no `x, y ≥ 1` with `x = y = x + y`.

*Needs:* 1.2; Mathlib `SimpleGraph.EdgeLabeling.mk`, `SimpleGraph.TopEdgeLabeling.labelGraph_adj`.
(Proved here, following the cited route.)

### Examples

The colourings of `1, …, N` without monochromatic solutions for one, two and three colours, of
lengths `1`, `4` and `13`.

### Dependencies

Layer 1. Mathlib `SimpleGraph.EdgeLabeling.mk`, `SimpleGraph.TopEdgeLabeling.labelGraph_adj`.

## Scope and ownership

This roadmap owns the Ramsey number of complete graphs in any finite number of colours and of
complete uniform hypergraphs, with the targets stated above: their existence, the comparison at
uniformity two, the recurrence, binomial and parity bounds, the values `R(3, 4)`, `R(3, 5)`,
`R(4, 4)` and `R(3, 3, 3)`, Erdős's lower bound, and Schur's theorem with its Ramsey bound.

Already in the libraries and therefore not targets:

- Mathlib's edge labellings of complete graphs with their graphs of a given colour, pullbacks along
  embeddings, relabellings of colours and the count of all labellings
  (`Mathlib/Combinatorics/SimpleGraph/Coloring/EdgeLabeling.lean`), and cliques of a given size
  (`Mathlib/Combinatorics/SimpleGraph/Clique.lean`). The Ramsey property is stated with them.
- Mathlib's infinitary Erdős–Szekeres theorem, the case of the infinite Ramsey theorem for pairs in
  which the two colours of a pair are given by a transitive relation: every sequence in a type with
  a transitive relation has a subsequence on which the relation holds for all pairs or for none
  (`exists_increasing_or_nonincreasing_subseq`, `Mathlib/Order/OrderIsoNat.lean`).
- Mathlib's Hales–Jewett theorem and its corollary, van der Waerden's theorem in the form of
  monochromatic homothetic copies (`Combinatorics.exists_mono_homothetic_copy`,
  `Mathlib/Combinatorics/HalesJewett.lean`), and Hindman's theorem
  (`Hindman.exists_FS_of_finite_cover`, `Mathlib/Combinatorics/Hindman.lean`). Hindman's theorem
  for the positive integers gives a monochromatic triple `a₀, a₁, a₀ + a₁`, the qualitative
  form of Schur's theorem for colourings of all positive integers, with no bound on the size of the
  numbers; 6.1 is the finite statement with the bound `R(3, …, 3) − 1`.

Left to other roadmaps:

- BanachSpaceTheory, §B4.1, states the infinite Ramsey theorem for finite colourings of the
  `k`-element subsets of `ℕ` and its forms for the product topology on infinite subsets, which its
  Banach space applications use. The finite theorems here are proved directly, without compactness,
  and nothing here depends on that roadmap.

Outside the scope: Ramsey numbers of graphs other than complete graphs (paths, cycles, trees,
books), asymptotic bounds beyond Erdős's (Spencer's constant, the exponential improvement of the
diagonal upper bound, the order of `R(3, k)`), values established by computer search, exact Schur
numbers beyond three colours, the monotone subsequence theorem of Erdős and Szekeres, the
Lovász local lemma, Paley graphs and their clique numbers as a subject, induced and size Ramsey
numbers, the canonical Ramsey theorem, and every procedure for computing or bounding Ramsey numbers
by search.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Combinatorics/SimpleGraph/Coloring/EdgeLabeling.lean`: `SimpleGraph.TopEdgeLabeling V K`
  (an abbreviation for `SimpleGraph.EdgeLabeling ⊤ K`, a function from the edge set of the complete
  graph on `V` to `K`); `SimpleGraph.EdgeLabeling.labelGraph` (`C.labelGraph k`, the graph of the
  edges of colour `k`); `SimpleGraph.TopEdgeLabeling.labelGraph_adj`
  (`(C.labelGraph k).Adj x y ↔ ∃ H : x ≠ y, C.get x y H = k`);
  `SimpleGraph.TopEdgeLabeling.pullback` (the colouring of the complete graph on `V'` induced
  along an embedding `V' ↪ V`); `SimpleGraph.EdgeLabeling.compRight` (composition with a map of
  colours); `SimpleGraph.EdgeLabeling.mk` (a colouring from a symmetric function of adjacent
  vertices); `SimpleGraph.card_topEdgeLabeling` (for finite `V` and `K`, there are
  `card K ^ binom(card V, 2)` colourings); `SimpleGraph.toTopEdgeLabeling` (for a graph with
  decidable adjacency, the colouring by `Fin 2` with edges `1` and non-edges `0`);
  `SimpleGraph.TopEdgeLabeling.labelGraph_toTopEdgeLabeling` (for `[DecidableEq V]`, every
  colouring `C` with colours `Fin 2` is `(C.labelGraph 1).toTopEdgeLabeling`).
- `Mathlib/Combinatorics/SimpleGraph/Clique.lean`: `SimpleGraph.IsNClique` (`G.IsNClique n s`: the
  Finset `s` has `n` elements and is a clique of `G`).
- `Mathlib/Combinatorics/SimpleGraph/DegreeSum.lean`: `SimpleGraph.sum_degrees_eq_twice_card_edges`
  (for a finite graph with decidable adjacency, the degrees sum to twice the number of edges).
- `Mathlib/Order/Lattice/Nat.lean`: `Nat.sInf_mem` (a nonempty set of natural numbers contains its
  infimum); `Nat.sInf_le` (the infimum is at most every member).
- `Mathlib/Algebra/Order/BigOperators/Group/Finset.lean`: `Finset.exists_lt_of_sum_lt` (in a
  linearly ordered additive monoid, `∑ i ∈ s, f i < ∑ i ∈ s, g i` gives `i ∈ s` with `f i < g i`).
- `Mathlib/Data/Finset/Powerset.lean`: `Finset.powersetCard` (the `k`-element subsets of a Finset)
  and `Finset.card_powersetCard` (there are `binom(#s, k)` of them). `Mathlib/Data/Finset/Card.lean`:
  `Finset.card_eq_two` (a two-element Finset is `{x, y}` with `x ≠ y`).
  `Mathlib/Algebra/BigOperators/Group/Finset/Basic.lean`: `Finset.card_biUnion_le` (the union of a
  family of Finsets has at most the sum of their cardinalities).
- `Mathlib/Data/Nat/Choose/Basic.lean`: `Nat.choose_succ_succ` (Pascal's rule),
  `Nat.descFactorial_eq_factorial_mul_choose` (`n.descFactorial k = k! * n.choose k`).
  `Mathlib/Data/Nat/Factorial/Basic.lean`: `Nat.descFactorial_le_pow`
  (`n.descFactorial k ≤ n ^ k`). `Mathlib/Algebra/Group/Nat/Even.lean`: `Nat.even_mul`
  (`Even (m * n) ↔ Even m ∨ Even n`). Core and basic Mathlib: `Finset.card`, `Finset.map`,
  `Function.update`, `Nat.choose`, `Nat.succ_sub_one`, `Nat.factorial`.
- `Mathlib/Data/ZMod/Defs.lean`: `ZMod`. `Mathlib/FieldTheory/Finite/GaloisField.lean`:
  `GaloisField p n` (the field with `p ^ n` elements; `GaloisField 2 4` has `16`).

## References

- R. E. Greenwood and A. M. Gleason, *Combinatorial relations and chromatic graphs*, Canadian
  Journal of Mathematics 7 (1955), 1–7, doi:10.4153/CJM-1955-001-4; read in the copy that Cambridge
  University Press serves openly. Page numbers are the journal's.
- P. Erdős, *Some remarks on the theory of graphs*, Bulletin of the American Mathematical Society 53
  (1947), 292–294; read in the scan of the Erdős archive of the Rényi Institute (paper 1947-09).
- S. P. Radziszowski, *Small Ramsey numbers*, Electronic Journal of Combinatorics, Dynamic Survey
  DS1, revision 18 (24 April 2026), doi:10.37236/21. Section and page numbers are those of that
  revision.
- Reinhard Diestel, *Graph Theory*, sixth edition, 2025; the free preview of the main text on the
  author's site (`diestel-graph-theory.com`, chapter files of June 2024), Chapter 9, §9.1 and the
  exercises, pp. 303–320, and Chapter 11, §11.1, p. 342.
- The papers of Ramsey (1930) and Schur (1916) are named as Diestel and Radziszowski attribute the
  results; they were not consulted, and no locator into them is given.

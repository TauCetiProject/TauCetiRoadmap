# Roadmap: cover time bounds by effective resistance

**Summary.** A random walk on a finite electrical network moves from a vertex to a neighbour with
probability proportional to the conductance of the edge between them. How long it takes to reach a
given vertex, and how long until it has visited every vertex, are governed by effective
resistance: on a connected network the commute time between two vertices is the total weight of
the network times their resistance, and resistances obey simple local bounds. This roadmap turns
that principle into the classical bounds on hitting and cover times. Networks are finite, with
symmetric nonnegative conductances and loops allowed; times are means in `[0, ∞]`.

The headline theorems are these.

- *Tetali's formula.* On a connected network, the mean time for the walk started at `a` to hit
  `z` is `½ Σ_x c(x) (R(a ↔ z) + R(z ↔ x) − R(x ↔ a))`, where `c(x)` is the weight of `x` and
  `R` the effective resistance. It rests on an identity valid on every network: the voltage at a
  third vertex `x` of the unit current from `a` to `z` is `(R(a ↔ z) + R(x ↔ z) − R(a ↔ x))/2`.
- *The spanning tree bound* (Aleliunas, Karp, Lipton, Lovász and Rackoff). For every spanning tree
  `T` of the network and every starting vertex, the mean cover time is at most the total weight
  times the sum of the resistances of the edges of `T`. On a connected graph with `n` vertices,
  `m` edges and unit conductances this gives the bound `2m(n − 1)`.
- *The resistance of an edge.* In a connected simple graph, possibly with loops, the resistance
  between the ends of an edge `xy` is at least `1/(d_x + 1) + 1/(d_y + 1)`, where `d_x` is the
  degree of `x` plus the conductance of its loop.
- *Regular graphs* (Coppersmith, Feige and Shearer). For the simple random walk on a connected
  regular graph on `n` vertices, the mean cover time from every vertex is at most `3n²`.

The roadmap builds on three others. ElectricalNetworksAndRandomWalks supplies the networks, their
walk, voltages and effective resistance, Dirichlet's and Thomson's principles, the commute time
identity and Foster's theorem. SpectralSparsification supplies effective resistance on a connected
network as a quadratic form of the inverse of a grounded Laplacian. HittingAndCoverTimes supplies
mean hitting and cover times, the expression of a hitting time through voltages, and Matthews'
bounds, which become bounds by the largest resistance in the Examples of Layer 2. The results are
meant for cover times of expanders and of specific families of graphs, where resistance is the
quantity one can estimate.

Layer 1 expresses hitting times through resistances and bounds the resistance of an edge from
below. Layer 2 proves the spanning tree bound and the bound for regular graphs.

## Conventions

- **Networks.** `V` is a finite type with decidable equality. A network `N : Network V` has
  conductances `N.cond x y = c(x, y)`, symmetric and nonnegative; loops `c(x, x) > 0` are allowed.
  The weight `c(x) = N.weight x = Σ_y c(x, y)` counts a loop once, and the total weight is
  `c_G = N.totalWeight = Σ_x c(x)`. The graph `N.graph` joins `x ≠ y` when `c(x, y) > 0`; it has no
  loops, and connectivity is `N.graph.Connected`, which includes nonemptiness of `V`. These, the
  walk `N.walk`, the Laplacian, the grounded Laplacian `groundedLaplacian z`, the voltage
  `voltage a z` and the effective resistance `effResistance a z = R(a ↔ z)` are those of
  ElectricalNetworksAndRandomWalks 1.1 and 2.1, copied verbatim in 1.1. `R(a ↔ a) = 0`, and on a
  disconnected network every voltage and every effective resistance is the junk value `0`.
- **Simple graphs.** A network whose conductances between distinct vertices are `0` or `1` is the
  simple random walk of the graph `N.graph`, slowed down at a vertex with a loop. Statements that
  allow loops say so; there the weight is the degree plus the loop conductance. A *regular* graph
  is one with no loops and every weight equal to the same number `d`, which is then the degree.
- **Times.** The path law from `x` is Tau Ceti's `markovChainLaw (Measure.dirac x) N.walk`, with
  expectation `E_x`. `τ_z` is Mathlib's `hittingAfter` of the coordinate process at `{z}` with
  start index `0`, so `τ_z = 0` on paths starting at `z`. The cover time `τ_cov` is the largest of
  the `τ_y` over all vertices `y`, `0` when there is one vertex. Mean times are lower integrals in
  `ℝ≥0∞`: `meanHittingTime N.walk (Measure.dirac a) {z} = E_a τ_z` and
  `meanCoverTime N.walk (Measure.dirac x) univ = E_x τ_cov`, the definitions of
  HittingAndCoverTimes 1.1 and 4.1, copied verbatim. A real right side `r` enters as
  `ENNReal.ofReal r`, which is `0` for `r ≤ 0`.
- **Spanning trees.** A spanning tree of `N` is a simple graph `T : SimpleGraph V` with Mathlib's
  `T.IsTree` (connected and acyclic) and `T ≤ N.graph`; it has every vertex of `V`, no loops and
  only edges of positive conductance. A sum over the edges of `T` is written as half the sum over
  ordered pairs `(a, b)` with `T.Adj a b`, with `[DecidableRel T.Adj]`.
- **Sources.** `LP` is the book of Lyons and Peres and `LPW` the book of Levin and Peres listed
  under References.

## Layer 1: hitting times through effective resistance

### 1.1 The voltage at a third vertex and Tetali's formula

Copy verbatim, from ElectricalNetworksAndRandomWalks 1.1 and 2.1, the structure `Network` with
`weight`, `totalWeight`, `graph`, `walkPMF`, `walk`, the instance `IsMarkovKernel N.walk`,
`laplacian`, `groundedLaplacian`, `voltage` and `effResistance`; and, from HittingAndCoverTimes
1.1, `meanHittingTime`.

(a) Prove `voltage_eq_effResistance`: on every network, for all vertices `a`, `z`, `x`,
`voltage a z x = (R(a ↔ z) + R(x ↔ z) − R(a ↔ x)) / 2` (LP, Exercise 2.62 (a), (b), (d), p. 65,
for finite, connected, simple networks; LP, Exercise 2.68, p. 65, for every finite network, in the
form of a hitting probability). No connectivity is assumed.

(b) Prove, as the consequence of (a) for hitting times,
`meanHittingTime_walk_eq_sum_effResistance`, Tetali's formula: on a connected network,
for all vertices `a` and `z`,
`E_a τ_z = ½ Σ_x c(x) (R(a ↔ z) + R(z ↔ x) − R(x ↔ a))` (LP, Exercise 2.108, p. 69, where the
weight is written `π(x)`; due to Tetali, 1991).

Route of (a). Write `G` for the inverse of the grounded Laplacian `L_z`, Mathlib's `⁻¹`, which is
`0` when `L_z` is singular.

1. *The degenerate cases.* If `a = z`, the left side is `0` and the right side is
   `(0 + R(x ↔ z) − R(z ↔ x))/2 = 0` by ElectricalNetworksAndRandomWalks 2.5 (symmetry, no
   hypotheses). If `x = z ≠ a`, the left side is `0` and the right side is
   `(R(a ↔ z) + 0 − R(a ↔ z))/2 = 0`, since `R(z ↔ z) = 0` by definition. If `x = a ≠ z`, both
   sides are `R(a ↔ z)`.
   So let `a`, `x`, `z` be distinct.
2. *Disconnected networks.* Let `C` be a connected component of `N.graph` not containing `z`. Its
   indicator `1_C`, restricted to `V ∖ {z}`, is a nonzero vector with `L_z 1_C = 0`: for every
   `y`, `(L 1_C)(y) = Σ_w c(y, w)(1_C(y) − 1_C(w))`, and `c(y, w) = 0` whenever exactly one of
   `y`, `w` lies in `C`; the row of `z` is deleted. So `det L_z = 0` (Mathlib
   `Matrix.exists_mulVec_eq_zero_iff`), `G = 0` (`Matrix.nonsing_inv_apply_not_isUnit`), and every
   voltage and every resistance with second argument `z` is `0`; the same holds with grounding at
   `x`. Both sides of (a) are `0`. So let `N` be connected.
3. *Connected networks.* By the definitions copied in 1.1, `voltage a z x = G(x, a)`,
   `R(a ↔ z) = voltage a z a = G(a, a)` and `R(x ↔ z) = G(x, x)`. SpectralSparsification 2.1
   (`dotProduct_inv_groundedLaplacian_mulVec`, connected), at the grounding `z` and the pair `a`,
   `x`, where `δ_a − δ_x` with the coordinate `z` deleted is the difference of the unit vectors of
   `a` and `x`, gives `R(a ↔ x) = G(a, a) − G(a, x) − G(x, a) + G(x, x)`. The Laplacian is
   symmetric because `c` is, so `L_z` is symmetric (Mathlib `Matrix.IsSymm.submatrix`) and so is
   `G` (`Matrix.IsSymm.inv`, which has no invertibility hypothesis). Hence
   `R(a ↔ x) = G(a, a) − 2 G(x, a) + G(x, x)` and
   `R(a ↔ z) + R(x ↔ z) − R(a ↔ x) = 2 G(x, a) = 2 voltage a z x`.

Route of (b). HittingAndCoverTimes 1.4 (`meanHittingTime_walk_eq_sum`, connected) gives
`E_a τ_z = Σ_x c(x) voltage a z x` in `ℝ≥0∞` through `ENNReal.ofReal`. Substitute (a) for each
voltage and rewrite `R(x ↔ z) = R(z ↔ x)` and `R(a ↔ x) = R(x ↔ a)` by
ElectricalNetworksAndRandomWalks 2.5.

**Checks.**
- On the unit path `0 — 1 — 2`, the voltage of the unit current from `0` to `2` is `(2, 1, 0)`;
  with `R(0 ↔ 2) = 2` and `R(1 ↔ 2) = R(0 ↔ 1) = 1`, (a) at `x = 1` reads `(2 + 1 − 1)/2 = 1`.
- On two vertices joined by a unit edge together with an isolated third vertex, every voltage and
  every resistance is `0`, and (a) reads `0 = 0`.
- Tetali on the unit path `0 — 1 — 2` (weights `1, 2, 1`): from `0` to `2` the terms are `4, 4, 0`
  and `E_0 τ_2 = 4`; from `1` to `2` they are `2, 4, 0` and `E_1 τ_2 = 3`. The variant with the
  last two resistances exchanged, `½ Σ_x c(x)(R(a ↔ z) + R(x ↔ a) − R(z ↔ x))`, gives `1` for
  `a = 1`, `z = 2`, which is the reverse time `E_2 τ_1`.
- Adding (b) for `(a, z)` and for `(z, a)` gives `½ Σ_x c(x) · 2R(a ↔ z) = c_G R(a ↔ z)`, the
  commute time identity of ElectricalNetworksAndRandomWalks 3.2.
- Connectivity is needed in (b): on a unit edge `01` together with an isolated vertex `2`,
  `E_0 τ_1 = 1`, while all resistances are the junk value `0` and the right side is `0`.

*Needs:* ElectricalNetworksAndRandomWalks 1.1 and 2.1 (the definitions) and 2.5
(`effResistance_comm`); SpectralSparsification 2.1 (`dotProduct_inv_groundedLaplacian_mulVec`);
HittingAndCoverTimes 1.1 (`meanHittingTime`) and 1.4 (`meanHittingTime_walk_eq_sum`); Mathlib
`Matrix.exists_mulVec_eq_zero_iff`, `Matrix.nonsing_inv_apply_not_isUnit`,
`Matrix.IsSymm.submatrix`, `Matrix.IsSymm.inv`. (Proved here.)

### 1.2 The resistance of an edge from below

Prove `inv_add_inv_le_effResistance`: on a connected network whose conductances between distinct
vertices are `0` or `1`, with loops of any conductance, for every pair `x ≠ y` with `c(x, y) = 1`,
`(c(x) + 1)⁻¹ + (c(y) + 1)⁻¹ ≤ R(x ↔ y)` (LP, Exercise 2.132 (a), p. 73, for connected simple
graphs, due to Coppersmith, Feige and Shearer). Without loops `c(x)` is the degree of `x`; a loop
raises `c(x)` and leaves `R` unchanged, so the bound with loops is the loopless bound weakened.

Route. Let `D_x` be the number of neighbours of `x` in `N.graph`, so `D_x = c(x) − c(x, x) ≤ c(x)`,
and set `α = D_x − 1 ≥ 0`, `β = D_y − 1 ≥ 0` (each of `x`, `y` is a neighbour of the other). For
`t ∈ ℝ`, let `f = 1` at `x`, `0` at `y` and `t` elsewhere. Its Dirichlet energy
`½ Σ_u Σ_w c(u, w)(f u − f w)²` is `1 + α(1 − t)² + βt²`: the edge `xy` contributes `1`, the `α`
other edges at `x` contribute `(1 − t)²` each, the `β` other edges at `y` contribute `t²` each, and
loops and edges between other vertices contribute `0`. By Dirichlet's principle
(ElectricalNetworksAndRandomWalks 2.2), `1/R(x ↔ y) ≤ 1 + α(1 − t)² + βt²` for every `t`, and
`R(x ↔ y) > 0` (2.5), so `R(x ↔ y) ≥ 1/(1 + α(1 − t)² + βt²)`.

- If `α + β = 0`, every `t` gives energy `1`, so `R ≥ 1 ≥ 1/2 + 1/2 ≥ (c(x) + 1)⁻¹ + (c(y) + 1)⁻¹`,
  since `c(x), c(y) ≥ 1`.
- If `α + β > 0`, take `t = α/(α + β)`: the energy is `1 + αβ/(α + β)`, so
  `R ≥ (α + β)/(α + β + αβ)`. With `s = α + β` and `p = αβ`,
  `(α + β)/(α + β + αβ) − 1/(α + 2) − 1/(β + 2)` has the positive denominator
  `(s + p)(p + 2s + 4)` and the numerator `s(p + 2s + 4) − (s + 4)(s + p) = s² − 4p = (α − β)²`.
  So `R ≥ 1/(D_x + 1) + 1/(D_y + 1) ≥ (c(x) + 1)⁻¹ + (c(y) + 1)⁻¹`.

**Checks.**
- A single unit edge (`α = β = 0`): `R = 1 = 1/2 + 1/2`, equality.
- The complete graph on four vertices: `R = 1/2 = 1/4 + 1/4`, equality. The variant with `d`
  in place of `d + 1` would claim `2/3 ≤ 1/2`.
- The unit path `0 — 1 — 2`, edge `01`: `1/2 + 1/3 = 5/6 ≤ 1 = R`.
- Connectivity is needed: on a unit edge `xy` together with an isolated third vertex, `R(x ↔ y)`
  is the junk value `0`, below `1/2 + 1/2`.

*Needs:* 1.1 (the definitions); ElectricalNetworksAndRandomWalks 2.2 (`isLeast_dirichletEnergy`,
`dirichletEnergy`) and 2.5 (`effResistance_pos`). (Proved here.)

### Examples

Paths, triangles and complete graphs, where Tetali's formula reproduces the hitting times of the
linear system; networks with loops, where the weight in Tetali's formula counts the loop and the
resistances do not see it; stars, where every edge has `R = 1` and the bound of 1.2 is
`1/2 + 1/(k + 1)` for a star with `k` leaves.

### Dependencies

ElectricalNetworksAndRandomWalks 1.1, 2.1, 2.2, 2.5; SpectralSparsification 2.1;
HittingAndCoverTimes 1.1, 1.4; Mathlib `Matrix.exists_mulVec_eq_zero_iff`,
`Matrix.nonsing_inv_apply_not_isUnit`, `Matrix.IsSymm.submatrix`, `Matrix.IsSymm.inv`.

## Layer 2: cover times

### 2.1 The spanning tree bound

Copy verbatim, from HittingAndCoverTimes 4.1, `coverTime` and `meanCoverTime`.

(a) Prove `meanCoverTime_le_sum_effResistance`: for every spanning tree `T` of `N` and every vertex
`x`, `E_x τ_cov ≤ c_G Σ_{e ∈ T} R(e)`, written
`c_G · ½ Σ_a Σ_b [T.Adj a b] R(a ↔ b)` (LPW, Theorem 11.5, (11.12), pp. 154–155, for graphs; due
to Aleliunas, Karp, Lipton, Lovász and Rackoff, 1979). No connectivity hypothesis is stated: a
spanning tree inside `N.graph` makes `N` connected (Mathlib `SimpleGraph.Connected.mono`).

(b) Prove `meanCoverTime_le_totalWeight_mul`: on a connected network on `n` vertices whose
conductances between distinct vertices are `0` or `1`, with loops of any conductance,
`E_x τ_cov ≤ c_G (n − 1)` from every vertex `x`. Without loops `c_G = 2m` for the number `m` of
edges, and this is the bound `2m(n − 1)` (LPW, (11.12), p. 154).

Route of (a).

1. *A closed walk around the tree.* For a finite tree `T` on `V` with `n` vertices and a vertex
   `x`, there is a sequence `x = v_0, v_1, …, v_{2(n−1)} = x` with `T.Adj v_{i−1} v_i` for every
   `i`, containing every vertex, in which every ordered pair `(a, b)` with `T.Adj a b` occurs as
   `(v_{i−1}, v_i)` for exactly one `i`. Induction on `n`: for `n = 1` take the sequence `x`. For
   `n ≥ 2` the tree has two distinct leaves (Mathlib
   `SimpleGraph.IsTree.exists_ne_and_degree_eq_one`);
   let `u ≠ x` be one and `w` its neighbour. The graph induced on `V ∖ {u}` is connected
   (`SimpleGraph.Connected.induce_compl_singleton_of_degree_eq_one`) and acyclic (acyclicity
   passes along the inclusion, `SimpleGraph.IsAcyclic.comap`), so it is a tree on `n − 1`
   vertices containing `x`. Take its sequence, which passes through `w`, and insert `u, w` after
   one occurrence of `w`. The new ordered pairs are `(w, u)` and `(u, w)`, the old ones keep their
   single occurrences, and the length grows by `2`.
2. *Successive hitting times.* On a path `ω`, let `σ_0 = 0` and, for `k ≥ 1`,
   `σ_k = σ_{k−1} + τ_{v_k}(θ_{σ_{k−1}} ω)` when `σ_{k−1} < ⊤` and `σ_k = ⊤` otherwise, where `θ_j`
   is the shift by `j`. Each `σ_k` is a stopping time of the natural filtration
   (`{σ_k ≤ m}` is the union over `j ≤ m` of `{σ_{k−1} = j}` and the event that some `ω i`,
   `j ≤ i ≤ m`, equals `v_k`), the `σ_k` increase, and for `k ≥ 1`, `ω(σ_k) = v_k` when
   `σ_k < ⊤`, so `τ_{v_k} ≤ σ_k ≤ σ_{2(n−1)}` on every path. For `n ≥ 2` every vertex is some
   `v_k` with `k ≥ 1`, since `v_{2(n−1)} = x`; so `τ_cov ≤ σ_{2(n−1)}` on every path, also where
   some `σ_k = ⊤`. (For `k = 0` the bound `τ_x ≤ σ_0 = 0` holds only where `ω 0 = x`.)
3. *Strong Markov.* `N` is connected, so every `E_u τ_v` is finite, by the commute time identity
   (ElectricalNetworksAndRandomWalks 3.2: `E_u τ_v + E_v τ_u` is `ENNReal.ofReal` of a real
   number). Under `P_x`, `ω 0 = x` almost surely, so `σ_1 = τ_{v_1}` has mean `E_{v_0} τ_{v_1}`.
   For `k ≥ 2` suppose `E_x σ_{k−1} < ⊤`, so `σ_{k−1} < ⊤` almost surely (Mathlib `ae_lt_top`).
   By Tau Ceti's `Measure.markovChainLaw_restrict_map_stoppedValue_shift_iterate_eq_smul`,
   applied to `σ_{k−1}`, the event of all paths, and the state `v_{k−1}`, which is the state at
   time `σ_{k−1}` on every path where `σ_{k−1} < ⊤`, the path `θ_{σ_{k−1}} ω` has law
   `P_{v_{k−1}}` under `P_x`. Hence `E_x σ_k = E_x σ_{k−1} + E_{v_{k−1}} τ_{v_k} < ⊤`
   (Mathlib `lintegral_add_left`, `lintegral_map`; the `σ_k` are measurable).
4. *The sum.* `E_x τ_cov ≤ E_x σ_{2(n−1)} = Σ_i E_{v_{i−1}} τ_{v_i}`, which by step 1 is
   `Σ_{(a, b) : T.Adj a b} E_a τ_b`. Pairing `(a, b)` with `(b, a)`, this is
   `½ Σ_a Σ_b [T.Adj a b](E_a τ_b + E_b τ_a)`, and by the commute time identity each bracket is
   `ENNReal.ofReal (c_G R(a ↔ b))`. Since `c_G ≥ 0` and `R ≥ 0` (2.5),
   `ENNReal.ofReal_sum_of_nonneg` moves the sum inside. For `n = 1` both sides are `0`.

Route of (b). A spanning tree `T ≤ N.graph` exists (Mathlib
`SimpleGraph.Connected.exists_isTree_le`) and has `n − 1` edges
(`SimpleGraph.IsTree.card_edgeFinset`), so the ordered pairs `(a, b)` with `T.Adj a b` number
`Σ_a deg_T(a) = 2(n − 1)` (`SimpleGraph.sum_degrees_eq_twice_card_edges`). Each edge `ab` of `T`
has `c(a, b) = 1`, and
`R(a ↔ b) ≤ 1/c(a, b) = 1` by Thomson's principle
(ElectricalNetworksAndRandomWalks 2.3, `isLeast_flowEnergy`): the flow `θ(a, b) = 1`,
`θ(b, a) = −1`, `0` elsewhere is a unit flow from `a` to `b` of energy `½(1 + 1) = 1`. So
`½ Σ_a Σ_b [T.Adj a b] R(a ↔ b) ≤ n − 1`, and (a) with the monotonicity of `ENNReal.ofReal`
gives the bound.

**Checks.**
- The unit path `0 — 1 — 2`: `c_G = 4`, the only spanning tree is the path with resistance sum
  `2`, and the bound is `8`; the exact values are `E_0 τ_cov = 4` and `E_1 τ_cov = 5`.
- The unit triangle: every spanning tree has two edges of resistance `2/3`, so (a) gives
  `6 · 4/3 = 8` and (b) gives `12`; the exact mean cover time is `3`.
- The unit 4-cycle: adjacent vertices have `R = 3/4`, a spanning path gives `8 · 9/4 = 18`, and
  `E_x τ_cov = 6`.
- One vertex, with or without a loop: `τ_cov = 0` and the right sides are `0`.
- Loops are why (b) uses `c_G`: on a unit edge `01` with a loop of conductance `5` at `0`, the walk
  leaves `0` with probability `1/6`, so `E_0 τ_cov = 6`; this is at most `c_G (n − 1) = 7` and
  above `2m(n − 1) = 2`.
- The conductances in (b) cannot be arbitrary: a single edge of conductance `1/4` has
  `E_0 τ_cov = 1` and `c_G (n − 1) = 1/2`.
- Connectivity is needed in (b): on two vertices with no edge the cover time is infinite and the
  right side is `0`.

*Needs:* 1.1 (the definitions); HittingAndCoverTimes 4.1 (`coverTime`, `meanCoverTime`);
ElectricalNetworksAndRandomWalks 2.3 (`isLeast_flowEnergy`, `IsUnitFlow`, `flowEnergy`), 2.5
(`effResistance_pos`) and 3.2 (`lintegral_hittingAfter_add_lintegral_hittingAfter`); Mathlib
`SimpleGraph.IsTree`, `SimpleGraph.IsTree.exists_ne_and_degree_eq_one`,
`SimpleGraph.Connected.induce_compl_singleton_of_degree_eq_one`, `SimpleGraph.IsAcyclic.comap`,
`SimpleGraph.Connected.mono`, `SimpleGraph.Connected.exists_isTree_le`,
`SimpleGraph.IsTree.card_edgeFinset`, `SimpleGraph.sum_degrees_eq_twice_card_edges`,
`hittingAfter`, `ae_lt_top`, `lintegral_add_left`, `lintegral_map`,
`ENNReal.ofReal_sum_of_nonneg`; Tau Ceti `markovChainLaw`,
`Measure.markovChainLaw_restrict_map_stoppedValue_shift_iterate_eq_smul`. (Proved here, after LPW.)

### 2.2 Regular graphs

Prove `meanCoverTime_le_three_mul_sq`: on a connected network on `n` vertices with conductances
`0` or `1`, no loops, and every weight equal to `d`, `E_x τ_cov ≤ 3n²` from every vertex `x` (LPW,
Theorem 11.6, p. 155; LP, Exercise 2.132 (d), p. 73; due to Coppersmith, Feige and Shearer, 1996).

Route. The weight of a vertex is its degree, so `N.graph` is `d`-regular, `d ≤ n − 1`, and it has
`m = nd/2` edges (`c_G = nd = 2m`, Mathlib `SimpleGraph.sum_degrees_eq_twice_card_edges`). Foster's
theorem (ElectricalNetworksAndRandomWalks 3.3) gives `Σ_x Σ_y c(x, y) R(x ↔ y) = 2(n − 1)`, that
is, the resistances of the `m` edges sum to `n − 1`. Take a spanning tree `T ≤ N.graph`
(`SimpleGraph.Connected.exists_isTree_le`); it has `n − 1` edges, so `m − (n − 1)` edges are not in
`T`, and by 1.2 each has `R ≥ 2/(d + 1)`. Hence
`Σ_{e ∈ T} R(e) ≤ (n − 1) − (nd/2 − n + 1) · 2/(d + 1) = (3n − d − 3)/(d + 1)`, and by 2.1 (a)
`E_x τ_cov ≤ nd (3n − d − 3)/(d + 1)`. Since `0 ≤ d ≤ n − 1`, `3n − d − 3 ≥ 2n − 2 ≥ 0` and
`d/(d + 1) < 1`, so the right side is at most `n (3n − d − 3) ≤ 3n²`.

**Checks.**
- Exact mean cover times against `3n²`: `11/2` on the complete graph on four vertices (`48`),
  `10` on the 5-cycle (`75`), `147/10` on the complete graph on seven vertices (`147`),
  `1996/95` on the cube (`192`), and `28` on the 8-cycle (`192`). The intermediate bound
  `nd(3n − d − 3)/(d + 1)` is `108` on the cube.
- Unit conductances are needed: the 4-cycle with conductances `p, q, p, q` around it has every
  weight `p + q`, and for `p = 100`, `q = 1` its mean cover time is above `48`.
- Regularity is needed: take the complete graph on `15` vertices with a path of `7` further
  vertices attached at one of them (`n = 22`, unit conductances). From a vertex of the complete
  graph other than the attaching one, the mean hitting time of the far end of the path is `1533`,
  above `3n² = 1452`, and the mean cover time is at least every mean hitting time.
- Loops are excluded: two vertices joined by a unit edge, with a loop of conductance `12` at
  each, have every weight `13`, and the walk leaves its starting vertex with probability `1/13`
  at each step, so the mean cover time is `13`, above `3n² = 12`.
- Connectivity is needed: two vertices with no edge have `d = 0` and infinite cover time.

*Needs:* 1.2, 2.1 (a); ElectricalNetworksAndRandomWalks 3.3 (`sum_cond_mul_effResistance`); Mathlib
`SimpleGraph.Connected.exists_isTree_le`, `SimpleGraph.IsTree.card_edgeFinset`,
`SimpleGraph.sum_degrees_eq_twice_card_edges`. (Proved here, after LPW.)

### Examples

- *Matthews' bounds by the largest resistance.* On a connected network with `n` vertices, let
  `R_max` be the largest effective resistance. The commute time identity gives
  `E_a τ_b ≤ E_a τ_b + E_b τ_a = c_G R(a ↔ b) ≤ c_G R_max`, so Matthews' upper bound
  (HittingAndCoverTimes 4.2) gives `E_x τ_cov ≤ c_G R_max (1 + 1/2 + ⋯ + 1/(n − 1))`. Conversely,
  `τ_b ≤ τ_cov` on every path (the hitting time of `b` is one of the terms of the supremum
  defining the cover time), so `E_a τ_b ≤ E_a τ_cov`, and for `a`, `b` with `R(a ↔ b) = R_max` the
  larger of `E_a τ_cov` and `E_b τ_cov` is at least `½(E_a τ_b + E_b τ_a) = c_G R_max / 2`. On the
  unit 4-cycle `R_max = 1`, `c_G = 8`, and `4 ≤ 6 ≤ 8 · 11/6`.
- *Bounds compared on a cycle.* On the unit `n`-cycle the spanning tree bound with a spanning path
  is `2n · (n − 1)²/n = 2(n − 1)²`, while the exact mean cover time is `n(n − 1)/2`.
- *Loops and the count of edges.* On the unit path `0 — 1 — 2` with a unit loop at every vertex,
  `c_G = 7`, `m = 2`, and the mean cover time from `1` is `17/2`: below `c_G (n − 1) = 14` and
  above `2m(n − 1) = 8`.

### Dependencies

1.1, 1.2; HittingAndCoverTimes 4.1 and, in the Examples, 4.2; ElectricalNetworksAndRandomWalks 2.3,
2.5, 3.2, 3.3; Mathlib `SimpleGraph.IsTree`, `SimpleGraph.IsTree.exists_ne_and_degree_eq_one`,
`SimpleGraph.Connected.induce_compl_singleton_of_degree_eq_one`, `SimpleGraph.IsAcyclic.comap`,
`SimpleGraph.Connected.mono`, `SimpleGraph.Connected.exists_isTree_le`,
`SimpleGraph.IsTree.card_edgeFinset`, `SimpleGraph.sum_degrees_eq_twice_card_edges`,
`hittingAfter`, `ae_lt_top`, `lintegral_add_left`, `lintegral_map`,
`ENNReal.ofReal_sum_of_nonneg`; Tau Ceti `markovChainLaw`,
`Measure.markovChainLaw_restrict_map_stoppedValue_shift_iterate_eq_smul`.

## Scope and ownership

This roadmap owns, for finite networks: the expression of the voltage at a third vertex through
three effective resistances, Tetali's formula for mean hitting times, the lower bound for the
resistance of an edge of a simple graph, the spanning tree bound for mean cover times with its
`c_G (n − 1)` form, and the bound `3n²` for regular graphs.

Already in the libraries and therefore not targets: Mathlib's simple graphs, trees, spanning trees
of connected graphs, leaves and degree sums, matrix inverses and hitting times of processes; Tau
Ceti's path law of a Markov chain with its strong Markov property.

Left to other roadmaps:

- ElectricalNetworksAndRandomWalks owns networks, their walk, voltages and effective resistance,
  the Dirichlet problem, Dirichlet's and Thomson's principles, the metric property of resistance,
  the commute time identity (its 3.2) and Foster's theorem (its 3.3). Its definitions are copied
  verbatim in 1.1; its theorems are cited, not restated.
- HittingAndCoverTimes owns mean hitting and cover times, the expression of a hitting time through
  voltages (its 1.4) and Matthews' bounds (its 4.2 and 4.3). Its definitions are copied verbatim in
  1.1 and 2.1; Tetali's formula, the spanning tree bound and the bound `3n²` are the items its scope
  leaves out, and the resistance forms of Matthews' bounds in the Examples of Layer 2 are two-line
  consequences of its theorems, not targets.
- SpectralSparsification owns the expression of effective resistance on a connected network as the
  quadratic form of the inverse of a grounded Laplacian, for every grounding (its 2.1). The
  three-point identity 1.1 (a) is the reading of that form at three vertices, together with the
  cases of coincident vertices and of disconnected networks.
- GeometricTopology 4.4.5 owns the weighted matrix-tree identity; it is not used here.

Not treated here: uniform spanning trees, transfer currents and the Aldous–Broder theorem;
Kirchhoff's formula expressing effective resistance through spanning trees and forests; the
sharper bound `2n²` for regular graphs and the bound `(4/27 + o(1)) n³` for all graphs; cover
times of particular families (expanders, tori, trees) beyond the Checks; hitting times of sets in
terms of resistance between sets; infinite networks and continuous-time walks.

These results serve later work on cover times of expanders and of specific families of graphs,
where effective resistance is the quantity that can be estimated, and on hitting times expressed
through resistance.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Combinatorics/SimpleGraph/Acyclic.lean`: `SimpleGraph.IsTree` (connected and acyclic),
  `SimpleGraph.IsAcyclic.comap` (acyclicity pulls back along an injective homomorphism),
  `SimpleGraph.IsTree.card_edgeFinset` (a finite tree has `n − 1` edges),
  `SimpleGraph.Connected.exists_isTree_le` (a connected graph has a spanning tree below it),
  `SimpleGraph.IsTree.exists_ne_and_degree_eq_one` (a nontrivial finite tree has two distinct
  leaves), `SimpleGraph.Connected.induce_compl_singleton_of_degree_eq_one` (removing a vertex of
  degree one keeps a connected graph connected).
- `Mathlib/Combinatorics/SimpleGraph/Connectivity/Connected.lean`: `SimpleGraph.Connected.mono`
  (a graph above a connected graph on the same vertices is connected).
- `Mathlib/Combinatorics/SimpleGraph/DegreeSum.lean`: `SimpleGraph.sum_degrees_eq_twice_card_edges`.
- `Mathlib/LinearAlgebra/Matrix/NonsingularInverse.lean`: `Matrix.nonsing_inv_apply_not_isUnit`
  (`A⁻¹ = 0` when `A.det` is not a unit), `Matrix.IsSymm.inv` (the inverse of a symmetric matrix
  over a commutative ring is symmetric, with no invertibility hypothesis).
- `Mathlib/LinearAlgebra/Matrix/Symmetric.lean`: `Matrix.IsSymm.submatrix` (deleting the same rows
  and columns keeps a matrix symmetric).
- `Mathlib/LinearAlgebra/Matrix/ToLinearEquiv.lean`: `Matrix.exists_mulVec_eq_zero_iff` (a square
  matrix over a field has a nonzero kernel vector exactly when its determinant is `0`).
- `Mathlib/Probability/Process/HittingTime.lean`: `MeasureTheory.hittingAfter`.
- `Mathlib/MeasureTheory/Integral/Lebesgue/Markov.lean`: `MeasureTheory.ae_lt_top` (a measurable
  function with finite lower integral is finite almost everywhere).
- `Mathlib/MeasureTheory/Integral/Lebesgue/Map.lean`: `MeasureTheory.lintegral_map`.
- `Mathlib/MeasureTheory/Integral/Lebesgue/Add.lean`: `MeasureTheory.lintegral_add_left`.
- `Mathlib/Basic/ENNReal/BigOperators.lean`: `ENNReal.ofReal_sum_of_nonneg`.
- For the copied definitions: `PMF.ofFintype`, `PMF.pure`, `SimpleGraph.fromRel`,
  `Matrix.diagonal`, `Matrix.submatrix`, `Finset.sup`, `ENat.toENNReal`.

### From Tau Ceti

- `TauCeti/Probability/Process/MarkovChain.lean`: `TauCeti.Probability.markovChainLaw ν κ`, the
  path law on `ℕ → α` of the chain with initial measure `ν` and Markov kernel `κ`.
- `TauCeti/Probability/MarkovChain/StrongMarkov.lean`:
  `MeasureTheory.Measure.markovChainLaw_restrict_map_stoppedValue_shift_iterate_eq_smul`: for a
  finite initial measure, a stopping time `τ` of the natural filtration `Filtration.piLE`, an event
  `A` of the σ-algebra of `τ`, and a state `y` equal to the state at time `τ` on
  `A ∩ {τ ≠ ⊤}`, the image of the path law restricted to `A ∩ {τ ≠ ⊤}` under the shift by `τ` is
  the mass of `A ∩ {τ ≠ ⊤}` times the path law started at `y`. Used in 2.1.
- `TauCeti/Probability/Kernel/PMF.lean`: `ProbabilityTheory.Kernel.ofPMF` and its
  `IsMarkovKernel` instance, used by the copied `walk`.

### From TauCetiRoadmap.ElectricalNetworksAndRandomWalks

- 1.1 and 2.1: the definitions `Network`, `weight`, `totalWeight`, `graph`, `walkPMF`, `walk`, the
  instance `IsMarkovKernel N.walk`, `laplacian`, `groundedLaplacian`, `voltage`, `effResistance`,
  copied verbatim in 1.1.
- 2.2 `isLeast_dirichletEnergy` (connected, `a ≠ z`), with `dirichletEnergy`. Used in 1.2.
- 2.3 `isLeast_flowEnergy` (connected, `a ≠ z`), with `IsUnitFlow` and `flowEnergy`. Used in 2.1.
- 2.5 `effResistance_comm` (no hypotheses) and `effResistance_pos` (connected, `a ≠ z`). Used in
  1.1, 1.2 and 2.1.
- 3.2 `lintegral_hittingAfter_add_lintegral_hittingAfter` (connected): the commute time identity
  `E_a τ_b + E_b τ_a = c_G R(a ↔ b)` in `ℝ≥0∞`. Used in 2.1 and the Examples of Layer 2.
- 3.3 `sum_cond_mul_effResistance` (connected): Foster's theorem
  `Σ_x Σ_y c(x, y) R(x ↔ y) = 2(n − 1)`. Used in 2.2.

### From TauCetiRoadmap.HittingAndCoverTimes

- 1.1: the definition `meanHittingTime`, copied verbatim in 1.1.
- 1.4 `meanHittingTime_walk_eq_sum` (connected network): `E_a τ_z = Σ_x c(x) v(x)` with
  `v = voltage a z`, in `ℝ≥0∞` through `ENNReal.ofReal`. Used in 1.1.
- 4.1: the definitions `coverTime` and `meanCoverTime`, copied verbatim in 2.1.
- 4.2 `meanCoverTime_le` (Matthews' upper bound, every Markov kernel on a finite state space).
  Used in the Examples of Layer 2.

### From TauCetiRoadmap.SpectralSparsification

- `TauCetiRoadmap/SpectralSparsification/Suggested.lean`: 2.1
  `dotProduct_inv_groundedLaplacian_mulVec` (a connected network `N` and any vertices `z`, `x`,
  `y`): with `b` the vector `δ_x − δ_y` restricted to the index type `{w // w ≠ z}`,
  `b ⬝ᵥ ((L_z)⁻¹ *ᵥ b) = R(x ↔ y)`. Its `Network`, `groundedLaplacian` and `effResistance` are the
  same verbatim copies of ElectricalNetworksAndRandomWalks 1.1 and 2.1. Used in 1.1.

## References

- R. Lyons and Y. Peres, *Probability on trees and networks*, Cambridge University Press, 2016;
  the corrected and updated edition on the first author's site (version of 19 August 2026):
  Exercises 2.62 and 2.68, p. 65; Exercise 2.108, p. 69; Exercise 2.132, p. 73.
- D. A. Levin and Y. Peres, with contributions by E. L. Wilmer, *Markov chains and mixing times*,
  second edition, American Mathematical Society, 2017, as made available by the first author:
  §11.4, Theorems 11.5 and 11.6, pp. 154–155.

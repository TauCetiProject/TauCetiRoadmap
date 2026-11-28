# Roadmap: uniform spanning trees and transfer currents

**Summary.** A finite electrical network, with symmetric nonnegative conductances `c(x, y)` and
loops allowed, carries a natural random spanning tree: each spanning tree `T` of its graph is
drawn with probability proportional to the product `w(T)` of the conductances of its edges. This
roadmap builds that measure, the weighted uniform spanning tree, and proves the classical
theorems that tie it to electrical currents and to the random walk of the network. The currents
enter through the transfer-current matrix `Y(e, f)`: the current across `f` when a unit current
enters at one end of `e` and leaves at the other.

- *The transfer-current matrix.* On every network `Y` is idempotent,
  `Σ_g Y(e, g) Y(g, f) = Y(e, f)` over the edges `g`, each taken with one orientation. It also
  obeys the reciprocity law `c(e) Y(e, f) = c(f) Y(f, e)`, a direct consequence of the formula
  for the voltage at a third vertex.
- *Voltages and currents through trees.* On every network, the voltage at `x` of the unit
  current from `a` to `z ≠ a` is the weight of the two-component spanning forests separating `a`
  from `z` with `x` on the side of `a`, over the weight of the spanning trees; the unit current
  from `a` to `z` is the expected signed current along the tree path from `a` to `z` in the
  uniform spanning tree (Kirchhoff's current theorem).
- *The transfer-current theorem* (Burton and Pemantle). On a connected network, the probability
  that the uniform spanning tree contains distinct edges `e₁, …, e_k` is `det(Y(e_i, e_j))`. It
  rests on a determinantal identity, in generating form, for the measure on bases defined by any
  real matrix. On every network, disjoint sets of edges are negatively correlated: the
  probability of containing both is at most the product of the two probabilities.
- *The Aldous–Broder theorem.* On a connected network, from any starting vertex, the edges by
  which the random walk enters each new vertex for the first time form a spanning tree with the
  law of the uniform spanning tree. Its proof rests on the stationarity of the weight
  `c(r) w(T)` of rooted spanning trees for the chain that moves the root along the walk.

The roadmap builds on ElectricalNetworksAndRandomWalks for the networks, their walk, voltages,
effective resistance and the commute time identity; on LaplacianSpectraAndSpanningTrees for
spanning trees and rooted forests and for Kirchhoff's formula expressing effective resistance
through two-component forests; on CoverTimeBoundsByEffectiveResistance for the voltage at a third
vertex in terms of three resistances; on MarkovChainsAndRenewal for the uniqueness of the
invariant law of an irreducible finite chain; and on Tau Ceti's Cauchy–Binet formula,
Hadamard–Fischer inequality and path laws of Markov chains.

Layer 1 defines the uniform spanning tree and the transfer-current matrix and proves the algebra
of the matrix; Layer 2 the forest formula for voltages and Kirchhoff's current theorem; Layer 3
the determinantal identity, the transfer-current theorem and negative correlation; Layer 4 the
stationarity of the rooted-tree chain and the Aldous–Broder theorem.

## Conventions

- **Networks.** `V` is a finite type with decidable equality. A network `N : Network V` has
  conductances `c(x, y) = N.cond x y`, symmetric and nonnegative, loops `c(x, x) ≥ 0` allowed;
  parallel edges are merged into one conductance. The weight is `c(x) = N.weight x = Σ_y c(x, y)`,
  counting a loop once. The graph `N.graph` joins `x ≠ y` when `c(x, y) > 0`, and connectivity is
  `N.graph.Connected`, which includes nonemptiness of `V`. `N.edgeCond` is the conductance of an
  unordered pair. These, the walk `N.walk`, the Laplacian, the grounded Laplacian, the voltage
  `voltage a z` of the unit current from `a` to `z`, grounded at `z`, and the effective resistance
  `R(a ↔ z) = effResistance a z` are those of ElectricalNetworksAndRandomWalks 1.1 and 2.1,
  copied verbatim. `voltage a z = 0` when `a = z`, `voltage a z z = 0`, and on a disconnected
  network every voltage and every resistance is the junk value `0`, Mathlib's inverse of a
  singular matrix being `0`.
- **Spanning trees and forests.** These are edge sets: `spanningTrees N.graph` and
  `rootedForests N.graph R` (the acyclic edge sets in which every vertex is joined to exactly one
  vertex of `R`) and `forestWeight w F = Π_{e ∈ F} w e` are those of
  LaplacianSpectraAndSpanningTrees 2.1, copied verbatim, with `w = N.edgeCond`. We write
  `w(F) = forestWeight N.edgeCond F` and `Z = Σ_T w(T)` over the spanning trees. A forest rooted
  at a two-element set has exactly two components. Trees contain no loops and no pair of
  conductance `0`. `Z > 0` exactly on a connected network (LaplacianSpectraAndSpanningTrees 2.1,
  and every edge of a tree has positive conductance); a disconnected network has no spanning tree.
- **The uniform spanning tree.** `N.ust` is the measure on `Finset (Sym2 V)` giving each spanning
  tree the mass `w(T)/Z`. It is a probability measure on a connected network (the case `k = 0` of
  3.2) and the zero measure on a disconnected one. The σ-algebra on `Finset (Sym2 V)` is
  Mathlib's `Finset.instMeasurableSpace`; it has measurable singletons and the type is finite, so
  every set is measurable and every function is integrable against `N.ust`. `P` and `E` denote
  probability and expectation under `N.ust`.
- **Transfer currents.** `Y(e, f) = transferCurrent e f = c(f) (v_e(f.1) − v_e(f.2))` for
  ordered pairs `e`, `f`, where `v_e = voltage e.1 e.2`: the current across `f`, from `f.1` to
  `f.2`, of the unit current from `e.1` to `e.2`. Loops and pairs of conductance `0` are allowed
  as arguments: `Y(e, f) = 0` when `f` is a loop or `c(f) = 0`, and `Y(e, f) = 0` when `e` is a
  loop. Reversing `e` or `f` changes the sign. `Y` is not symmetric: `c(e) Y(e, f) = c(f) Y(f, e)`.
- **Paths and walks.** A path is `ω : ℕ → V`; the path law of the walk started at `x` is Tau
  Ceti's `markovChainLaw (Measure.dirac x) N.walk`, on the product σ-algebra of `ℕ → V`, with
  `[MeasurableSpace V] [MeasurableSingletonClass V]`. The first-entrance tree of a path is the set
  of the pairs `s(u, ω(τ_u − 1))` over the visited vertices `u ≠ ω 0`, where `τ_u` is the first
  time `n` with `ω n = u` (4.2).
- **Sources.** `LP` is the book of Lyons and Peres, `Ly` Lyons' paper on determinantal measures
  and `BP` the paper of Burton and Pemantle, listed under References. LP writes `Ξ(T)` for `w(T)`.

## Layer 1: the uniform spanning tree and the transfer-current matrix

### 1.1 Definitions

Copy verbatim, from ElectricalNetworksAndRandomWalks 1.1 and 2.1, the structure `Network` with
`weight`, `graph`, `edgeCond`, `walkPMF`, `walk`, the instance `IsMarkovKernel N.walk`,
`laplacian`, `groundedLaplacian`, `voltage` and `effResistance`; and, from
LaplacianSpectraAndSpanningTrees 2.1, `spanningTrees`, `rootedForests` and `forestWeight`.

Define `ust`, the weighted uniform spanning tree, as the sum over the spanning trees `T` of
`N.graph` of `ENNReal.ofReal (w(T)/Z) • Measure.dirac T`; and `transferCurrent`, the matrix `Y`
of the Conventions.

Basic API, proved with the definitions: the mass of `{T}` is `w(T)/Z` for a spanning tree and `0`
otherwise; `∫ f ∂N.ust = Σ_T (w(T)/Z) f(T)` for every `f`; `Y(e, f) = 0` when `f` is a loop or
has conductance `0`; reversing `e` or `f` changes the sign of `Y(e, f)`. On every network, for
all ordered pairs `e`, `f`:
- `Y(e, e) = c(e) R(e.1 ↔ e.2)`: by the definitions `v_e(e.2) = 0` and `v_e(e.1) = R(e.1 ↔ e.2)`,
  and both sides are `0` when `e.1 = e.2`;
- *reciprocity of voltages*: `v_{ab}(x) − v_{ab}(y) = v_{xy}(a) − v_{xy}(b)` for all `a, b, x, y`,
  where `v_{ab} = voltage a b`. CoverTimeBoundsByEffectiveResistance 1.1 (a)
  (`voltage_eq_effResistance`, no hypotheses) turns the left side into
  `(R(x ↔ b) − R(a ↔ x) − R(y ↔ b) + R(a ↔ y))/2` and the right side into
  `(R(a ↔ y) − R(x ↔ a) − R(b ↔ y) + R(x ↔ b))/2`; they agree by the symmetry of `R`
  (ElectricalNetworksAndRandomWalks 2.5, `effResistance_comm`);
- hence the *reciprocity law* `c(e) Y(e, f) = c(f) Y(f, e)` (LP (2.12), §2.4, p. 35), both sides
  being `c(e) c(f)` times the two sides of the reciprocity of voltages at `(e.1, e.2, f.1, f.2)`.

These are direct consequences of the definitions and of the cited theorems, and are not separate
targets.

**Checks.**
- Unit triangle on `0, 1, 2`: three trees, each of mass `1/3`; `P(s(0, 1) ∈ T) = 2/3`.
- Weighted triangle with `c(0, 1) = 1`, `c(1, 2) = 2`, `c(0, 2) = 3`: the trees `{01, 02}`,
  `{01, 12}`, `{02, 12}` have weights `3`, `2`, `6`, so `Z = 11` and masses `3/11`, `2/11`,
  `6/11`.
- Parallel edges: the triangle with a doubled edge `01` is the network with `c(0, 1) = 2`; its
  trees `{01, 02}`, `{01, 12}`, `{02, 12}` have masses `2/5`, `2/5`, `1/5`, the images of the
  uniform measure on the five spanning trees of the multigraph.
- An edge `01` with an isolated vertex `2`: no spanning tree, `N.ust = 0`.
- Unit triangle: `Y((0, 1), (0, 1)) = 2/3 = R(0 ↔ 1)`, `Y((0, 1), (1, 2)) = −1/3`,
  `Y((0, 1), (1, 0)) = −2/3`.
- Weighted triangle above: `Y((0, 1), (1, 2)) = −6/11` and `Y((1, 2), (0, 1)) = −3/11`, so `Y` is
  not symmetric, while `1 · (−6/11) = 2 · (−3/11)` is the reciprocity law.
- Summing `Y(e, e) = c(e) R(e)` over the edges gives Foster's theorem `Σ_e c(e) R(e) = n − 1` on a
  connected network (ElectricalNetworksAndRandomWalks 3.3): the trace of a projection of rank
  `n − 1` (1.2).

*Needs:* ElectricalNetworksAndRandomWalks 1.1, 2.1 (the copied definitions), 2.5
(`effResistance_comm`); LaplacianSpectraAndSpanningTrees 2.1 (the copied definitions);
CoverTimeBoundsByEffectiveResistance 1.1 (a) (`voltage_eq_effResistance`).

### 1.2 The projection identity

Prove `sum_transferCurrent_mul_transferCurrent`: on every network, for all ordered pairs `e`, `f`,
`½ Σ_x Σ_y Y(e, (x, y)) Y((x, y), f) = Y(e, f)`, the sum running over all ordered pairs `(x, y)`,
so that each edge appears twice with the same product and loops contribute `0`. In the basis of
the edges this is the matrix of the orthogonal projection onto the star space (LP §2.4,
pp. 34–35). No connectivity is assumed: on a disconnected network every transfer current is `0`
and both sides are `0`.

Route.
1. *Disconnected networks.* Every voltage is `0`, so every `Y(e, f) = 0`, and both sides are `0`.
   Let `N` be connected.
2. *The voltage solves the Poisson equation.* Let `a ≠ z`, `L` the Laplacian, `L_z` the grounded
   Laplacian and `v = voltage a z`. `L_z` is invertible: if `L_z u = 0`, extend `u` by `0` at `z`;
   then `Σ_{x, y} c(x, y)(u x − u y)² = 2 Σ_x u x (L u) x = 0`, the row of `z` being multiplied by
   `u z = 0`, so `u` is constant on the connected graph and `u = u z = 0`. Hence, for `x ≠ z`,
   `(L v)(x) = (L_z L_z⁻¹)(x, a) = [x = a]` (Mathlib `Matrix.mul_nonsing_inv`). The columns of `L`
   sum to `0` (`L(y, y) = c(y) − c(y, y)` and `c` is symmetric), so `Σ_x (L v)(x) = 0` and
   `(L v)(z) = −1`: `L v = δ_a − δ_z`.
3. *The identity.* For functions `g`, `h` on `V`,
   `Σ_{x, y} c(x, y)(g x − g y)(h x − h y) = 2 Σ_x g x (L h) x`, by expanding and using the
   symmetry of `c` (loops cancel on both sides). If `f.1 = f.2`, both sides are `0`, since
   `v_f = 0` and `Y(·, f) = 0`. Otherwise, by the reciprocity of voltages (1.1),
   `Y((x, y), f) = c(f)(v_f(x) − v_f(y))`, so the left side is
   `½ c(f) Σ_{x, y} c(x, y)(v_e x − v_e y)(v_f x − v_f y) = c(f) Σ_x v_e(x) (L v_f)(x)`, which is
   `c(f)(v_e(f.1) − v_e(f.2)) = Y(e, f)` by step 2. (Proved here.)

**Checks.**
- Unit `K₄`: `Y(e, e) = 1/2`, `Y((0, 1), (0, 2)) = 1/4`, `Y((0, 1), (2, 3)) = 0`; the identity at
  `e = f = (0, 1)`: the five edges other than `01` give `4 · (1/4)² = 1/4`, plus `(1/2)² = 1/4`,
  total `1/2`.
- Unit triangle, `e = (0, 1)`, `f = (1, 2)`: the three edges give
  `(2/3)(−1/3) + (−1/3)(2/3) + (1/3)(1/3) = −1/3 = Y(e, f)`.

*Needs:* 1.1 (the reciprocity of voltages); Mathlib `Matrix.mul_nonsing_inv`,
`Matrix.nonsing_inv_apply_not_isUnit`.

### Examples

The unit triangle, `K₄` and the weighted triangle above; a network with a bridge (a triangle
`0, 1, 2` with a pendant edge `23`), where `Y((2, 3), (2, 3)) = 1` and `Y((0, 1), (2, 3)) = 0`.

### Dependencies

ElectricalNetworksAndRandomWalks 1.1, 2.1, 2.5; LaplacianSpectraAndSpanningTrees 2.1;
CoverTimeBoundsByEffectiveResistance 1.1; Mathlib matrix inverses.

## Layer 2: voltages and currents through trees

### 2.1 The voltage through two-component forests

Prove `voltage_eq_sum_rootedForests_div`: on every network, for `a ≠ z` and every vertex `x`,
`voltage a z x = (Σ_{F} w(F)) / Z`, the sum running over the forests `F` rooted at `{a, z}` in
which `x` is joined to `a`. No connectivity is assumed: on a disconnected network both sides are
`0`. The case `x = a` is Kirchhoff's formula for `R(a ↔ z)` of LaplacianSpectraAndSpanningTrees
3.1.

Route. Write `F(A | B)` for the total weight of the forests rooted at a two-element set with the
vertices of `A` in one component and those of `B` in the other.
1. *Disconnected networks.* The voltage is `0`, and `Z = 0` (no spanning tree,
   LaplacianSpectraAndSpanningTrees 2.1, `numSpanningTrees_pos_iff`), so the right side is
   `(·)/0 = 0`. Let `N` be connected, so `Z > 0`.
2. *`x = z`.* No forest rooted at `{a, z}` joins `z` to `a`; both sides are `0`. *`x = a`.* Every
   forest joins `a` to `a`; the right side is `F(a | z)/Z = R(a ↔ z)` by
   LaplacianSpectraAndSpanningTrees 3.1 (`effResistance_eq_sum_rootedForests_div`, `a ≠ z`),
   which is `voltage a z a` by definition.
3. *`x ∉ {a, z}`.* An acyclic edge set with two components, `a` and `x` in one and `z` in the
   other, is rooted at `{a, z}` and at `{x, z}`; the other two placements are similar. Splitting
   each family of forests by the side of the third vertex, LaplacianSpectraAndSpanningTrees 3.1
   gives `R(a ↔ z) Z = F(a, x | z) + F(a | x, z)`, `R(x ↔ z) Z = F(a, x | z) + F(x | a, z)` and
   `R(a ↔ x) Z = F(a, z | x) + F(a | x, z)`, with `F(x | a, z) = F(a, z | x)`. Hence
   `(R(a ↔ z) + R(x ↔ z) − R(a ↔ x)) / 2 = F(a, x | z) / Z`, and the left side is the voltage by
   CoverTimeBoundsByEffectiveResistance 1.1 (a). (Proved here.)

**Checks.**
- Unit path `0 — 1 — 2`, `a = 0`, `z = 2`: the forests rooted at `{0, 2}` are `{01}` and `{12}`;
  `x = 1` is joined to `0` only in `{01}`, so the voltage at `1` is `1/1 = 1`; at `0` it is
  `2 = R(0 ↔ 2)`.
- Weighted triangle of 1.1, `a = 0`, `z = 2`: the forests are `{01}` (weight `1`) and `{12}`
  (weight `2`), so the voltages at `0` and `1` are `3/11` and `1/11`.
- `a ≠ z` is needed: for `a = z` the forests rooted at `{a}` are the spanning trees, every one
  joins `x` to `a`, and the right side is `1` on a connected network, while the voltage is `0`.

*Needs:* 1.1; LaplacianSpectraAndSpanningTrees 2.1 (`numSpanningTrees_pos_iff`), 3.1
(`effResistance_eq_sum_rootedForests_div`); CoverTimeBoundsByEffectiveResistance 1.1 (a).

### 2.2 Kirchhoff's current theorem

Define `pathCrossing T a z x y`: `0` if `s(x, y) ∉ T`; otherwise, with reachability in the graph
of `T` with `s(x, y)` removed, `1` if `a` is joined to `x` and `y` to `z`, minus `1` if `a` is
joined to `y` and `x` to `z`. For a spanning tree containing the edge `xy` this is `1`, `−1` or
`0` as the path of `T` from `a` to `z` crosses `xy` from `x` to `y`, from `y` to `x`, or not at
all.

Prove `transferCurrent_eq_integral_pathCrossing`: on every network, for all vertices `a`, `z`,
`x`, `y`, `Y((a, z), (x, y)) = E[pathCrossing T a z x y]`: the unit current from `a` to `z` is
the expected signed current along the uniform spanning tree path from `a` to `z` (LP Exercise
4.23, p. 128, `i = E[i_T]`, for finite or recurrent networks; due to Kirchhoff 1847). No
connectivity is assumed: on a disconnected network both sides are `0`.

Route.
1. *Degenerate cases.* If `a = z` the voltage is `0` and `pathCrossing T a a x y = 0` (its two
   brackets are the same condition). On a disconnected network both sides are `0`
   (`N.ust = 0`). If `s(x, y)` is not an edge of `N.graph` (`x = y` or `c(x, y) = 0`), the left
   side is `0` and no spanning tree contains `s(x, y)`. Let `N` be connected, `a ≠ z` and
   `xy` an edge.
2. By 2.1, `Z (v(x) − v(y)) = Σ_F w(F) ([x ∼ a] − [y ∼ a])` over the forests rooted at `{a, z}`,
   with `v = voltage a z` and `∼` reachability in `F`. Each vertex is joined to exactly one root,
   so the bracket is `1` when `x ∼ a` and `y ∼ z`, `−1` when `y ∼ a` and `x ∼ z`, and `0`
   otherwise.
3. *A bijection.* `F ↦ F ∪ {s(x, y)}` maps the forests rooted at `{a, z}` with `x ∼ a`, `y ∼ z`
   onto the spanning trees `T ∋ s(x, y)` in which, with `s(x, y)` removed, `a` is joined to `x`
   and `y` to `z`: the edge joins the two components of `F`, giving a connected acyclic edge
   set; conversely removing an edge from a tree leaves two components, one containing `x` and
   one `y`, hence a forest rooted at `{a, z}`. The inverse is `T ↦ T ∖ {s(x, y)}`, and
   `w(F ∪ {s(x, y)}) = c(x, y) w(F)`. The same holds with `x` and `y` exchanged.
4. Hence `c(x, y) Z (v(x) − v(y)) = Σ_T w(T) pathCrossing T a z x y`; divide by `Z` and read the
   right side as the integral against `N.ust` (1.1). (Proved here.)

**Checks.**
- Unit 4-cycle `0, 1, 2, 3`, `a = 0`, `z = 2`, `(x, y) = (0, 1)`: the current is `1/2`; of the
  four trees, `{01, 12, 23}` and `{01, 12, 03}` route `0 → 2` through `0 → 1`, so `2/4`.
- Unit triangle, `a = 0`, `z = 1`, `(x, y) = (0, 2)`: the current is `1/3`; only the tree
  `{02, 12}` routes `0 → 1` through `0 → 2`.
- The orientation matters: the unsigned count `[the path uses xy]` gives `1/2` at
  `(x, y) = (1, 0)` on the 4-cycle, while the current there is `−1/2`.

*Needs:* 1.1, 2.1; LaplacianSpectraAndSpanningTrees 2.1.

### Examples

Paths and trees, where the tree path is deterministic and the current is `±1` on it and `0`
elsewhere; the 4-cycle and the triangles above; the triangle with a pendant edge, where the
current from `0` to `3` is `1` across the bridge `23`.

### Dependencies

1.1, 2.1; LaplacianSpectraAndSpanningTrees 2.1, 3.1; CoverTimeBoundsByEffectiveResistance 1.1.

## Layer 3: determinantal formulas

### 3.1 The determinantal identity for projections

Prove `sum_plucker_sq_mul_prod_eq`: for a finite linearly ordered set `E`, a real matrix
`A : Matrix (Fin p) E ℝ`, a set `S ⊆ E` and `x : E → ℝ`,
`Σ_s pl_s(A)² Π_{e ∈ S} ([e ∈ s] + x_e) = det(A Aᵀ) · det((Aᵀ (A Aᵀ)⁻¹ A + diag x)_{S, S})`,
the sum running over the `p`-element subsets `s` of `E` and `pl_s(A)` being Tau Ceti's Plücker
coordinate (`TauCeti.plucker A.row s`, the minor of `A` on the columns `s`). No hypothesis on `A`.
For `A` of rank `p`, the left side over `det(A Aᵀ)` is the expectation of
`Π_{e ∈ S}([e ∈ B] + x_e)` under the measure `P_A{B} = pl_B(A)²/det(A Aᵀ)` on bases; at `x = 0`
it reads `P_A[S ⊆ B] = det(Q_{S, S})` with `Q = Aᵀ(A Aᵀ)⁻¹A` the orthogonal projection onto the
row space of `A` (Ly (5.1), p. 13, and Theorem 5.1, (5.3), p. 14). The general `x` gives the
mixed events of Ly (5.2).

Route. Let `M = A Aᵀ` and `Q = Aᵀ M⁻¹ A`.
1. *Singular `M`.* Cauchy–Binet (Tau Ceti `Matrix.det_mul_transpose_eq_sum_plucker_sq`) gives
   `Σ_s pl_s(A)² = det M = 0`, so every `pl_s(A) = 0`, and both sides are `0`. This covers
   `p > |E|`, where there is no `s`. Let `M` be invertible.
2. *Weighted Cauchy–Binet.* For `d : E → ℝ`,
   `det(A diag(d) Aᵀ) = Σ_s pl_s(A)² Π_{e ∈ s} d_e`, by Tau Ceti
   `TauCeti.det_mul_transpose_eq_sum_plucker_mul` with rows `A diag(d)` and `A`, and
   `pl_s(A diag(d)) = pl_s(A) Π_{e ∈ s} d_e` (each column of the minor is scaled).
3. *Multiplicative form.* For `y : E → ℝ` vanishing off `S`, take `d = 1 + y`. With `A_S` the
   columns of `A` in `S` and `D_y = diag(y_S)`, `A diag(d) Aᵀ = M + A_S D_y A_Sᵀ`, whose
   determinant is `det M · det(1 + M⁻¹ A_S D_y A_Sᵀ) = det M · det(1 + D_y A_Sᵀ M⁻¹ A_S)` by
   Sylvester's identity (Mathlib `Matrix.det_one_add_mul_comm`), and `A_Sᵀ M⁻¹ A_S = Q_{S, S}`.
   With step 2: `Σ_s pl_s(A)² Π_{e ∈ S}(1 + y_e [e ∈ s]) = det M · det(1 + D_y Q_{S, S})`.
4. *Nonzero `x`.* If `x_e ≠ 0` for every `e ∈ S`, write `[e ∈ s] + x_e = x_e (1 + x_e⁻¹[e ∈ s])`
   and apply step 3 with `y_e = x_e⁻¹` on `S`: the left side is
   `(Π_S x_e) det M det(1 + D_x⁻¹ Q_{S, S}) = det M det(D_x + Q_{S, S})`.
5. *All `x`.* Both sides are polynomials in the finitely many `x_e`, `e ∈ S` (the others enter
   neither side), hence continuous, and they agree on the dense set where no `x_e` vanishes.
   (Proved here.)

**Checks.**
- `p = 0`: `pl_∅ = 1`, `det M = 1` (empty), `Q = 0`; both sides are `Π_S x_e`.
- `A = (1 1)`, `E = {1, 2}`: `pl_{1} = pl_{2} = 1`, `det M = 2`, `Q = [[1/2, 1/2], [1/2, 1/2]]`;
  `S = E`, `x = 0`: the left side is `0` (no `s` contains both), and `2 det Q = 0`.
- `A = [[1, 0, 0, 1], [0, 1, 0, 1], [0, 0, 1, 1]]`, `S = {1, 2}`, `x = 0`: the bases containing
  columns `1, 2` are `{1, 2, 3}` and `{1, 2, 4}`, with `pl² = 1` each; `det M = 4`,
  `Q_{S,S} = [[3/4, −1/4], [−1/4, 3/4]]`, and `4 · (9/16 − 1/16) = 2`.
- Rank-deficient `A = [[1, 1], [1, 1]]`: every `pl = 0`, `det M = 0`; both sides `0`.

*Needs:* Tau Ceti `TauCeti.plucker`, `TauCeti.det_mul_transpose_eq_sum_plucker_mul`,
`Matrix.det_mul_transpose_eq_sum_plucker_sq`; Mathlib `Matrix.det_one_add_mul_comm`.

### 3.2 The transfer-current theorem

Prove `integral_prod_add_eq_det_and_ust_real_eq_det`: on a connected network, for
`e : Fin k → V × V` whose underlying unordered pairs `s(e i)` are distinct,
- (a) for every `t : Fin k → ℝ`, `E Π_i ([s(e i) ∈ T] + t_i) = det(Y_e + diag t)`, where
  `Y_e = (Y(e i, e j))_{i, j}` (LP Exercise 4.41, p. 131);
- (b) `P(s(e i) ∈ T for every i) = det Y_e` (BP Theorem 1.1, p. 3, for regular graphs with
  unit conductances; LP (4.5), p. 108, for networks).

Loops and pairs of conductance `0` are allowed among the `e i`, and orientations are arbitrary.
At `k = 0`, (a) says that `N.ust` has total mass `1`. At `k = 1`, (b) with
`Y(e, e) = c(e) R(e)` (1.1) is the edge probability `P(s(a, z) ∈ T) = c(a, z) R(a ↔ z)` of
LaplacianSpectraAndSpanningTrees 3.2. At `k = 2`, with the reciprocity law (1.1),
`P(e, f ∈ T) = P(e ∈ T) P(f ∈ T) − Y(e, f) Y(f, e)`, and
`Y(e, f) Y(f, e) = c(e) Y(e, f)²/c(f) ≥ 0` for edges (LP p. 108).

Route.
1. *One vertex.* The only pairs are loops, `k ≤ 1`, `Y = 0` and `N.ust` is the point mass at the
   empty tree; both sides of (a) are `Π t_i`. Let `n ≥ 2`.
2. *Reduction to edges with fixed orientations.* If `s(e i)` is not an edge of `N.graph`, the
   column `i` of `Y_e` is `0` (1.1), so `det(Y_e + diag t) = t_i det` of the matrix without row
   and column `i` (Laplace expansion, Mathlib `Matrix.det_succ_column`), and the factor
   `[s(e i) ∈ T] + t_i` is `t_i` for every tree; remove such indices one by one. Reversing `e i`
   multiplies row and column `i` of `Y_e` by `−1`, which leaves both sides unchanged. Fix a
   linear order on the set `E⁺` of edges of `N.graph`, each with a chosen orientation `d⁻ → d⁺`;
   we may assume every `e i` is a chosen orientation, and the `e i` form a set `S ⊆ E⁺`
   (injectivity). Reindexing `Fin k` by `S` does not change the determinant
   (`Matrix.det_reindex_self`).
3. *The weighted grounded incidence matrix.* Fix `z`, enumerate `V ∖ {z}` by `Fin (n − 1)`, and
   let `A(u, d) = √c(d) ([u = d⁻] − [u = d⁺])` for `u ≠ z`, `d ∈ E⁺`. Then `A Aᵀ = L_z`, the
   grounded Laplacian (diagonal `c(u) − c(u, u)`, off the diagonal `−c(u, u')`).
4. *Minors.* For `s ⊆ E⁺` with `|s| = n − 1`, `pl_s(A) = (Π_{d ∈ s} √c(d)) det B_s`, `B_s` the
   square submatrix of the unweighted grounded incidence matrix on the columns `s`. If `s` is not
   a spanning tree, it is disconnected (`n − 1` edges on `n` vertices), some component `C` misses
   `z`, and the rows of `C` sum to `0` on every column, so `det B_s = 0`. If `s` is a spanning
   tree, it has a leaf `u ≠ z` (a tree with at least two vertices has two leaves); row `u` has a
   single entry `±1`; expanding along it leaves the matrix of the tree `s` minus that leaf on
   `V ∖ {u}`, and by induction on `n` (for `n = 1` the empty determinant is `1`)
   `det B_s = ±1`. So `pl_s(A)² = w(s)` for a spanning tree and `0` otherwise, and, with
   Cauchy–Binet, `det(A Aᵀ) = Z > 0`. This is the minor lemma of
   LaplacianSpectraAndSpanningTrees 2.2 for `R = {z}`, a route step in prose there, written out
   here; `det L_z = Z` is also its rooted-forest theorem at `R = {z}`.
5. *The projection.* With `G = L_z⁻¹`, `Q = Aᵀ G A` has entries
   `Q(d, d') = √(c(d) c(d')) Δ_d(v_{d'⁻ z} − v_{d'⁺ z})`, where `Δ_d g = g(d⁻) − g(d⁺)` and
   `voltage a z x = G(x, a)` (extended by `0` at `z`). CoverTimeBoundsByEffectiveResistance 1.1 (a)
   and the symmetry of `R` give
   `Δ_d(v_{a z} − v_{b z}) = (R(b ↔ d⁻) − R(a ↔ d⁻) − R(b ↔ d⁺) + R(a ↔ d⁺))/2 = Δ_d v_{a b}`.
   Hence `Q(d, d') = √(c(d) c(d')) Δ_d v_{d'} = √(c(d')/c(d)) Y(d', d)`, so
   `Q_{S, S} = D⁻¹ Y_Sᵀ D` with `D = diag(√c)`, and
   `det(Q_{S, S} + diag t) = det(Y_S + diag t)`.
6. *(a)* By 1.1 and step 4, `E Π_{e ∈ S}([e ∈ T] + t_e)` equals
   `Z⁻¹ Σ_s pl_s(A)² Π_{e ∈ S}([e ∈ s] + t_e)`,
   which is `det(Q_{S, S} + diag t)` by 3.1 and `det(Y_S + diag t)` by step 5.
7. *(b)* Take `t = 0`; the integrand is the indicator of `{T | ∀ i, s(e i) ∈ T}`. (Proved here.)

**Checks.**
- Unit triangle: `P(01, 12 ∈ T) = 1/3 = (2/3)² − (−1/3)²`.
- Unit `K₄` (16 trees): `P(e ∈ T) = 1/2`; for adjacent `e, f`, `P(e, f ∈ T) = 3/16 = 1/4 − 1/16`
  (3 trees); for disjoint `e, f`, `Y(e, f) = 0` and `P = 1/4` (4 trees); a triangle has
  probability `0`, a path of three edges or a star `1/16`.
- Distinct unordered pairs are needed: on the unit triangle with `e 0 = (0, 1)`, `e 1 = (1, 0)`,
  `P(01 ∈ T) = 2/3` while `det [[2/3, −2/3], [−2/3, 2/3]] = 0`.
- Connectivity is needed: on an edge with an isolated vertex, `k = 0` gives `0` on the left and
  `det [] = 1` on the right.
- Mixed events (LP Exercise 4.41): at `t = −1` in coordinate `i`, the factor is
  `−[s(e i) ∉ T]`; on the unit triangle, `P(01 ∉ T) = 1 − 2/3 = 1/3`.

*Needs:* 1.1, 3.1; LaplacianSpectraAndSpanningTrees 2.1 (`numSpanningTrees_pos_iff`);
CoverTimeBoundsByEffectiveResistance 1.1 (a); ElectricalNetworksAndRandomWalks 2.5; Tau Ceti
`Matrix.det_mul_transpose_eq_sum_plucker_sq`; Mathlib `Matrix.det_succ_column`,
`Matrix.det_reindex_self`.

### 3.3 Negative correlation of disjoint edge sets

Prove `ust_real_union_subset_le`: on every network, for disjoint finite sets `S₁`, `S₂` of
unordered pairs, `P(S₁ ∪ S₂ ⊆ T) ≤ P(S₁ ⊆ T) P(S₂ ⊆ T)`. No connectivity is assumed: on a
disconnected network both sides are `0`. For
`S₁ = {e}`, `S₂ = {f}` this is the negative correlation of two edges (LP p. 108); for
determinantal measures on bases it is Ly p. 21, the case of disjoint sets of Theorem 6.5.

Route.
1. If `N` is disconnected both sides are `0`. If some element of `S₁ ∪ S₂` is not an edge of
   `N.graph`, the left side is `0` and the right side is `≥ 0`. Let `N` be connected and every
   element an edge, oriented as in 3.2, step 2, so `S₁, S₂ ⊆ E⁺`.
2. *A symmetric idempotent.* On `E⁺` let `K(d, d') = √(c(d)/c(d')) Y(d, d')`. By the
   reciprocity law (1.1), `K` is symmetric. By 1.2, where the ordered pairs `(x, y)` that are not
   edges contribute `0` (`c(x, y) = 0` or `x = y`) and each edge contributes twice the same
   product, `Σ_{g ∈ E⁺} Y(d, g) Y(g, d') = Y(d, d')`, so `K² = K`. Hence `uᵀ K u = ‖K u‖² ≥ 0`:
   `K` is positive semidefinite, and so is every principal submatrix (Mathlib
   `Matrix.PosSemidef.submatrix`).
3. By 3.2 (b), `P(S ⊆ T) = det Y_S = det K_S` for `S ⊆ E⁺` (a diagonal similarity).
4. *The Hadamard–Fischer inequality.* Reindex `K_{S₁ ∪ S₂}` by `S₁ ⊕ S₂` (disjointness), which
   writes it as a positive semidefinite block matrix with diagonal blocks `K_{S₁}` and `K_{S₂}`;
   Tau Ceti `Matrix.PosSemidef.det_fromBlocks_le` gives `det K_{S₁ ∪ S₂} ≤ det K_{S₁} det K_{S₂}`.
   Conclude with step 3. (Proved here.)

**Checks.**
- Unit `K₄`: adjacent edges `3/16 ≤ 1/4`; disjoint edges `1/4 = 1/4` (equality, `Y = 0`); the
  triangle `{01, 12}` against `{02}`: `0 ≤ (3/16)(1/2)`.
- Triangle with a pendant edge `23` (a bridge): `P(23 ∈ T) = 1`, and `P(01, 23 ∈ T) = 2/3 =
  P(01 ∈ T) · 1`.
- Disjointness is needed: `S₁ = S₂ = {01}` on the unit triangle would claim `2/3 ≤ 4/9`.

*Needs:* 1.1, 1.2, 3.2; Mathlib `Matrix.PosSemidef.submatrix`, `Matrix.det_reindex_self`;
Tau Ceti `Matrix.PosSemidef.det_fromBlocks_le`.

### Examples

Complete graphs, cycles and the weighted triangle: on the weighted triangle of 1.1,
`Y_e` for `e = ((0, 1), (1, 2), (0, 2))` has rows `(5, −6, 6)/11`, `(−3, 8, 3)/11`,
`(2, 2, 9)/11`; its diagonal gives the edge probabilities `5/11`, `8/11`, `9/11`, which sum to
`2 = n − 1`, and its determinant is `0`, the probability of the triangle.

### Dependencies

1.1, 1.2; LaplacianSpectraAndSpanningTrees 2.1; CoverTimeBoundsByEffectiveResistance 1.1;
ElectricalNetworksAndRandomWalks 2.5; Tau Ceti Plücker coordinates, Cauchy–Binet and the
Hadamard–Fischer inequality; Mathlib determinants and positive semidefinite matrices.

## Layer 4: the walk and the tree

### 4.1 The rooted-tree chain

Define `treeStep T r r'`: `T` if `r' = r`; otherwise `T` with `s(r, r')` added and the edges at
`r'` whose removal separates `r'` from `r` deleted. When `T` is a spanning tree and `r' ≠ r`,
exactly one edge is deleted, the first edge of the path of `T` from `r'` to `r`: this is LP's
forward procedure `F(T, e)` for `e = (r, r')` (LP §4.4, p. 117, (4.20)), which moves the root of
`T`, with edges oriented towards the root, from `r` to `r'`.

Prove `sum_cond_mul_forestWeight_treeStep`: on every network, for every vertex `r'` and every
spanning tree `T'`, `Σ_r Σ_{T : treeStep T r r' = T'} c(r, r') w(T) = c(r') w(T')`, the inner
sum over spanning trees. Dividing by `c(r)` on the left, this says that `c(r) w(T)` is a
stationary weight for the chain on rooted spanning trees that moves the root by the walk
(LP Exercise 4.12 (a), p. 118, for the weight `Ψ`, which for the network walk is proportional to
`c(r) w(T)`).

Route.
1. *`r = r'`.* `treeStep T r' r' = T`, contributing `c(r', r') w(T')`.
2. *`r ≠ r'`.* `treeStep T r r'` contains `s(r, r')`, so only the `r` adjacent to `r'` in `T'`
   contribute. Fix such `r`; removing `s(r, r')` splits `T'` into the component `C_r` of `r` and
   that of `r'`. The spanning trees `T` with `treeStep T r r' = T'` are exactly
   `T = (T' ∖ {s(r, r')}) ∪ {s(r', u)}` for `u ∈ C_r` with `c(r', u) > 0`. Indeed, given such `u`,
   `T` is a spanning tree (it joins the two components), its path from `r'` to `r` begins with
   `s(r', u)`, so `treeStep T r r' = T'`. Conversely, if `treeStep T r r' = T'`, an edge `g` at
   `r'` separates `r'` from `r` in `T` exactly when it lies on the unique path
   (`SimpleGraph.IsTree.existsUnique_path`), and the only such edge at `r'` is the first one,
   `g = s(r', u)`; then `T = (T' ∖ {s(r, r')}) ∪ {g}`, and `u ∈ C_r` because the path from `u` to
   `r` in `T ∖ {g} = T' ∖ {s(r, r')}` avoids `r'`. (If `s(r, r') ∈ T`, then `g = s(r', r)`,
   `u = r` and `T = T'`.) Distinct `u` give distinct `T`, and
   `c(r, r') w(T) = c(r', u) w(T')`.
3. So the terms with `r ≠ r'` add up to `w(T') Σ_r Σ_{u ∈ C_r} c(r', u)`. The sets `C_r`, over
   the neighbours `r` of `r'` in `T'`, partition `V ∖ {r'}`: the path of `T'` from a vertex
   `u ≠ r'` to `r'` ends with an edge `s(r, r')` for exactly one such `r`, and `u ∈ C_r`. The
   total is `w(T') (c(r', r') + Σ_{u ≠ r'} c(r', u)) = c(r') w(T')`. (Proved here.)

**Checks.**
- Unit triangle, `r' = 0`, `T' = {01, 02}`: `r = 0` gives `0` (no loop); `r = 1`, `C_1 = {1}`,
  `T = {01, 02}`; `r = 2` likewise; total `2 = c(0) · 1`.
- Weighted triangle with loops `c(0, 0) = 5`, `c(2, 2) = 1/2`: the loop terms `c(r', r') w(T')`
  are needed to reach `c(r') w(T')`.
- Negative control: the weight `w(T)` alone, without `c(r)`, is not stationary on the weighted
  triangle of 1.1: the inflow at `(0, {01, 02})` is `c(1, 0) · 3 / c(1) + c(2, 0) · 3 / c(2)`
  `= 1 + 9/5`, not `3`.

*Needs:* 1.1; Mathlib `SimpleGraph.IsTree.existsUnique_path`, `SimpleGraph.IsTree.card_edgeFinset`.

### 4.2 The Aldous–Broder theorem

Define `firstEntranceTree ω`: for every vertex `u ≠ ω 0` that the path visits, the pair
`s(u, ω(τ_u − 1))`, where `τ_u` is the first time `n` with `ω n = u` (Mathlib's `Nat.find`).

Prove `map_firstEntranceTree`: on a connected network, for every vertex `x`, the image of the
path law of the walk started at `x` under `firstEntranceTree` is `N.ust` (LP Corollary 4.9,
p. 119; due to Aldous 1990 and Broder 1989).

Route. Write `P_x` for the path law from `x`, `π{u} = c(u)/c_G` with `c_G = Σ_u c(u)`, and `P_π`
for the path law with initial law `π`; `p(u, v) = c(u, v)/c(u)`.
1. *One vertex.* Every path is constant, the first-entrance tree is `∅`, and `N.ust` is the point
   mass at `∅`. Let `n ≥ 2`; connectivity gives `c(u) > 0` for every `u`.
2. *Measurability.* Let `FET_m(ω)` be the first-entrance tree built from the visits up to time
   `m`; it depends on `ω 0, …, ω m` only, so it is measurable, and `FET_m(ω)` increases to
   `FET(ω)` and is eventually equal to it (finitely many vertices). So
   `{FET = T} = ⋃_M ⋂_{m ≥ M} {FET_m = T}` is measurable.
3. *Covering.* By the commute time identity (ElectricalNetworksAndRandomWalks 3.2,
   `lintegral_hittingAfter_add_lintegral_hittingAfter`), every mean hitting time is finite, so
   under every `P_u`, and hence under `P_π` (Tau Ceti `Measure.markovChainLaw_eq_comp`), the
   cover time `C = max_v τ_v` is finite almost surely.
4. *Reversal of finite paths.* By Tau Ceti `markovChainLaw_map_prefix_apply_singleton`, a path
   `(w_0, …, w_m)` with `m ≥ 1` has `P_π`-mass
   `c_G⁻¹ Π_i c(w_i, w_{i+1}) / Π_{0 < i < m} c(w_i)`, which is unchanged by reversing the path
   (for `m = 0` the mass is `π{w_0}`; covering paths have `m ≥ n − 1 ≥ 1`).
5. *First-entrance and last-exit trees.* For a finite path `w` of length `m` visiting every
   vertex, let `FET(w)` consist of the `s(u, w_{f_u − 1})` (`f_u` the first index of `u`,
   `u ≠ w_0`) and `LET(w)` of the `s(u, w_{l_u + 1})` (`l_u` the last index of `u`, `u ≠ w_m`).
   Reversal exchanges them: `FET(rev w) = LET(w)`. If `w` has positive mass, `FET(w)` is a
   spanning tree of `N.graph`: its `n − 1` pairs are distinct edges of positive conductance and
   join every vertex to `w_0` through earlier-visited vertices (Mathlib
   `SimpleGraph.isTree_iff_connected_and_card`). On `{C ≤ m}`, `FET(ω) = FET(ω 0, …, ω m)`. By
   step 4, `ν_m(u, T) := P_π(C ≤ m, ω 0 = u, FET = T)` is the `P_π`-mass of the covering paths
   of length `m` ending at `u` with `LET = T`.
6. *The forward recursion.* Run `Q` (step 7) from a rooted spanning tree `(r, T)` along a path
   `r = u_0, u_1, …`: the step to `u_{k+1} ≠ u_k` gives the old root the edge `s(u_k, u_{k+1})`
   towards the new root and deletes the first edge from `u_{k+1}` towards the old root; for every
   other vertex the first edge of its path to the root is unchanged (its path to the new root is
   its old path to the old root, followed by the new edge, or a part of it). So after the path
   has visited every vertex, the tree is its last-exit tree, whatever `T` was. In particular, for
   a covering path `w` ending at `r` and a state `y`, `LET(w y) = treeStep (LET w) r y` (for
   `y = r` nothing changes). With the product formula of step 4,
   `ν_{m+1}(y, T') = Σ_{(r, T)} ν_m(r, T) p(r, y) [treeStep T r y = T'] + β_{m+1}(y, T')`, where
   `β_{m+1}` is carried by the paths that cover at time `m + 1` exactly, of total mass
   `P_π(C = m + 1)`.
7. *The limit is stationary.* As `m → ∞`, `ν_m(u, T)` increases to
   `μ(u, T) := P_π(ω 0 = u, FET = T)` and `β_m → 0` (step 3). The sums are finite, so
   `μ(y, T') = Σ_{(r, T)} μ(r, T) p(r, y) [treeStep T r y = T']`: `μ` is an invariant probability
   of the chain `Q` on the finite set of rooted spanning trees `(r, T)` (`T` a spanning tree of
   `N.graph`) moving to `(y, treeStep T r y)` with probability `p(r, y)`; by step 5 the chain
   stays in that set.
8. *The rooted weight is invariant.* `Ψ(r, T) = c(r) w(T)/(c_G Z)` is a probability on rooted
   spanning trees, invariant for `Q` by 4.1 divided by `c_G Z` (`c(r) p(r, y) = c(r, y)`).
9. *Uniqueness.* `Q` is irreducible (LP Exercise 4.11, p. 118): from `(r, T)` to `(r*, T*)`,
   follow a path of `N.graph` from `r` to `r*` and then the reversal of a closed walk from `r*`
   along `T*` that crosses each edge of `T*` once in each direction (a depth-first tour). The
   tour enters each vertex first from its parent in `T*` rooted at `r*`, so its first-entrance
   tree is `T*`, and the last-exit tree of the reversal is `T*` by step 5. By step 6 the tree
   reached by `Q` along this covering path is its last-exit tree whatever the starting tree, so
   the chain arrives at `(r*, T*)` with positive probability. An irreducible chain on a finite
   set has exactly one invariant probability (MarkovChainsAndRenewal 3.2,
   `existsUnique_invariant_probability`, for `Q` as a Markov kernel on that finite set with
   the discrete σ-algebra), so `μ = Ψ`.
10. *Fixed start.* `P_π = Σ_u π{u} P_u` (Tau Ceti `Measure.markovChainLaw_eq_comp`) and
    `P_u(ω 0 = x) = [u = x]` (Tau Ceti `markovChainLaw_dirac_ae_apply_zero`), so
    `μ(x, T) = π{x} P_x(FET = T)`. With `π{x} > 0` this gives `P_x(FET = T) = w(T)/Z` for every
    spanning tree `T`; these masses sum to `1`, so both measures agree on every singleton of the
    finite type `Finset (Sym2 V)` and are equal (Mathlib `Measure.ext_of_singleton`).
    (Proved here; LP leaves steps 6–9 to its Exercises 4.11–4.13.)

**Checks.**
- Unit triangle from `0`: the walk first moves to `1` or to `2`, with probability `1/2` each.
  From `1`, the third vertex `2` is entered from `1` with probability `2/3` and from `0` with
  probability `1/3`; symmetrically from `2`. So `{01, 12}`, `{02, 12}` and `{01, 02}` each have
  probability `1/2 · 2/3 = 1/3` or `1/2 · 1/3 + 1/2 · 1/3 = 1/3`.
- Weighted triangle of 1.1: from every start the first-entrance tree has the law `3/11`, `2/11`,
  `6/11` of 1.1.
- Unit path `0 — 1 — 2` from `1`: the only spanning tree is reached with probability `1`.
- Connectivity is needed: on an edge with an isolated vertex the image of `P_x` is a probability
  measure while `N.ust = 0`.

*Needs:* 1.1, 4.1; ElectricalNetworksAndRandomWalks 1.1 (the walk), 3.2
(`lintegral_hittingAfter_add_lintegral_hittingAfter`); MarkovChainsAndRenewal 3.2
(`existsUnique_invariant_probability`); Tau Ceti `markovChainLaw`,
`markovChainLaw_map_prefix_apply_singleton`, `Measure.markovChainLaw_eq_comp`,
`markovChainLaw_dirac_ae_apply_zero`; Mathlib `SimpleGraph.isTree_iff_connected_and_card`,
`Measure.ext_of_singleton`.

### Examples

Complete graphs, where the simple random walk gives every one of Cayley's `n^{n−2}` trees with
probability `n^{2−n}` (SpanningTreesAndShortestPaths 5.2); cycles, where the first-entrance tree
is the cycle minus one edge, each with probability `1/n`; networks with loops, where the walk may
stay put without changing the tree.

### Dependencies

1.1, 4.1; ElectricalNetworksAndRandomWalks 1.1, 3.2; MarkovChainsAndRenewal 3.2; Tau Ceti path
laws of Markov chains; Mathlib trees and measures on countable types.

## Scope and ownership

This roadmap owns, for finite networks: the weighted uniform spanning tree as a measure, the
transfer-current matrix with its reciprocity law and projection identity, the expression of
voltages through two-component forests, Kirchhoff's current theorem, the determinantal identity
for the measures on bases defined by a real matrix in its generating form, the transfer-current
theorem in its generating and its classical form, negative correlation of disjoint edge sets, the
rooted-tree chain with the stationarity of the rooted weight, and the Aldous–Broder theorem.

Already in the libraries and therefore not targets: Mathlib's trees, paths in trees, matrix
inverses, Sylvester's determinant identity and positive semidefinite matrices; Tau Ceti's Plücker
coordinates, Cauchy–Binet formula, Hadamard–Fischer inequality and path laws of Markov chains.

Left to other roadmaps:
- ElectricalNetworksAndRandomWalks owns networks, their walk, voltages and effective resistance,
  Dirichlet's and Thomson's principles, Rayleigh monotonicity, the resistance metric, the commute
  time identity and Foster's theorem. Its definitions are copied verbatim in 1.1; its theorems
  are cited, not restated.
- LaplacianSpectraAndSpanningTrees owns spanning trees and rooted forests as edge sets, the
  rooted-forest theorem, Kirchhoff's formula for effective resistance (its 3.1) and the edge
  probability `c(a, z) R(a ↔ z)` of a weighted random spanning tree (its 3.2). Its definitions
  are copied verbatim in 1.1; its 2.1 and 3.1 are used in Layers 2 and 3, the minor lemma of its
  2.2 is written out in the route of 3.2, and its 3.2 is the case `k = 1` of 3.2 here, not
  restated. Its scope places there the statements whose proof goes through the incidence matrix
  or the spanning trees or forests of a simple graph. Most statements here are proved in that way
  (Layers 2 to 4), and none of them is stated there: Layers 2 and 3 extend its Layer 3 from the
  resistance and the probability of one edge to the voltage at every vertex, the current across
  every pair and the joint law of several edges, and Layer 4 adds the walk construction of the
  tree, all on its definitions and with its theorems as inputs.
- CoverTimeBoundsByEffectiveResistance owns the voltage at a third vertex in terms of three
  resistances (its 1.1 (a)), used in 1.1, 2.1 and 3.2, together with Tetali's formula and the
  cover time bounds.
- MarkovChainsAndRenewal owns invariant laws of irreducible chains; its uniqueness theorem is used
  in 4.2.
- DirectedMatrixTreeAndBEST owns the directed matrix-tree theorem and the Markov chain tree
  theorem; GeometricTopology 4.4.5 owns the weighted matrix-tree identity; neither is used.
- SpanningTreesAndShortestPaths owns Cayley's formula, quoted in the Examples of Layer 4.

Not treated here: Wilson's algorithm and loop-erased random walk; uniform spanning forests of
infinite networks; negative association of the uniform spanning tree beyond disjoint sets of
edges (Feder–Mihail) and its equivalence with Rayleigh monotonicity, which go through contracted
multigraphs; the all-minors matrix-tree theorem; determinantal point processes on general spaces,
of which the edge set of the uniform spanning tree is a discrete example.

The layers serve other work: Layer 1 and 3.2 for computations with transfer currents (spanning
forests, sandpiles, local statistics of trees on lattices), 3.1 and 3.3 for determinantal measures
on matroid bases and negative dependence, and Layer 4 for random constructions of spanning trees.

## Exact supplier contracts

### From Mathlib

- `Matrix.mul_nonsing_inv` (`IsUnit A.det → A * A⁻¹ = 1`) and
  `Matrix.nonsing_inv_apply_not_isUnit` (`¬ IsUnit A.det → A⁻¹ = 0`); used in 1.2.
- `Matrix.det_one_add_mul_comm`: `det(1 + A B) = det(1 + B A)` for rectangular `A`, `B` over a
  commutative ring; used in 3.1.
- `Matrix.det_succ_column` (Laplace expansion along a column) and `Matrix.det_reindex_self`; used
  in 3.2 and 3.3.
- `Matrix.PosSemidef.submatrix` (principal submatrices of a positive semidefinite matrix); used
  in 3.3.
- `SimpleGraph.IsTree.existsUnique_path`, `SimpleGraph.IsTree.card_edgeFinset`,
  `SimpleGraph.isTree_iff_connected_and_card`; used in 4.1 and 4.2.
- `MeasureTheory.Measure.ext_of_singleton` (on a countable type, measures agreeing on singletons
  are equal); used in 4.2.

### From Tau Ceti

- `TauCeti.plucker x s` (the minor of the rows `x : Fin p → ι → R` on the columns of
  `s : Set.powersetCard ι p`, for `[LinearOrder ι]`), `TauCeti.det_mul_transpose_eq_sum_plucker_mul`
  (`det(X Yᵀ) = Σ_s pl_s(x) pl_s(y)`, `[Fintype ι]`) and
  `Matrix.det_mul_transpose_eq_sum_plucker_sq` (`det(A Aᵀ) = Σ_s pl_s(A)²`), in
  `TauCeti/LinearAlgebra/ExteriorPower/Plucker.lean`; used in 3.1 and 3.2.
- `Matrix.PosSemidef.det_fromBlocks_le` (the Hadamard–Fischer inequality: for a positive
  semidefinite block matrix `[[A, B], [Bᴴ, D]]` over `ℝ` or `ℂ`, `det ≤ det A · det D`, singular
  blocks and empty blocks included), in `TauCeti/Analysis/Matrix/PosSemidef/Determinant.lean`;
  used in 3.3.
- `TauCeti.Probability.markovChainLaw`, `markovChainLaw_map_prefix_apply_singleton` (the mass of a
  finite path, for `[SFinite ν] [MeasurableSingletonClass α]`),
  `MeasureTheory.Measure.markovChainLaw_eq_comp` (the path law is the mixture of the laws from
  fixed states) and `markovChainLaw_dirac_ae_apply_zero`, in
  `TauCeti/Probability/Process/MarkovChain.lean`; used in 4.2.

### From TauCetiRoadmap.ElectricalNetworksAndRandomWalks

- 1.1 and 2.1: `Network`, `weight`, `graph`, `edgeCond`, `walkPMF`, `walk`, the instance
  `IsMarkovKernel N.walk`, `laplacian`, `groundedLaplacian`, `voltage`, `effResistance`, copied
  verbatim.
- 2.5 `effResistance_comm` (no hypotheses); used in 1.1 and 3.2.
- 3.2 `lintegral_hittingAfter_add_lintegral_hittingAfter` (connected:
  `E_a τ_b + E_b τ_a = c_G R(a ↔ b)`); used in 4.2.

### From TauCetiRoadmap.LaplacianSpectraAndSpanningTrees

- 2.1: `spanningTrees`, `rootedForests`, `forestWeight`, copied verbatim (in its `SimpleGraph`
  namespace, written `SimpleGraph.spanningTrees N.graph`); `numSpanningTrees_pos_iff` (on a
  nonempty type, a spanning tree exists iff the graph is connected); used in 2.1 and 3.2.
- 3.1 `effResistance_eq_sum_rootedForests_div` (for `a ≠ z`, no connectivity:
  `R(a ↔ z) = Σ_{F rooted at {a, z}} w(F) / Z`); used in 2.1.

### From TauCetiRoadmap.CoverTimeBoundsByEffectiveResistance

- 1.1 (a) `voltage_eq_effResistance` (every network, all `a`, `z`, `x`:
  `voltage a z x = (R(a ↔ z) + R(x ↔ z) − R(a ↔ x))/2`); used in 1.1, 2.1 and 3.2.

### From TauCetiRoadmap.MarkovChainsAndRenewal

- 3.2 `existsUnique_invariant_probability` (`[Finite S]`, countable `S` with measurable
  singletons, nonempty, `κ` a Markov kernel with `Kernel.IsIrreducible Measure.count κ`: exactly
  one invariant probability); used in 4.2.

## References

- [LP] R. Lyons and Y. Peres, *Probability on Trees and Networks*, Cambridge University Press,
  2016; corrected and updated paperback edition, author's version of 19 August 2026,
  `rdlyons.pages.iu.edu/prbtree/book.pdf`: §2.4, (2.11)–(2.12), pp. 34–35; the transfer-current
  theorem (4.5) and the negative correlation formula, p. 108; §4.4, the forward procedure and
  (4.20), p. 117, Exercises 4.11–4.12, p. 118, Corollary 4.9, p. 119; Exercise 4.23, p. 128;
  Exercise 4.41, p. 131.
- [Ly] R. Lyons, *Determinantal probability measures*, Publ. Math. IHÉS 98 (2003), 167–212;
  arXiv:math/0204325v4: (5.1), p. 13; Theorem 5.1, (5.2)–(5.3), p. 14; the remark after
  Theorem 6.5, p. 21.
- [BP] R. Burton and R. Pemantle, *Local characteristics, entropy and limit theorems for
  spanning trees and domino tilings via transfer-impedances*, Ann. Probab. 21 (1993), no. 3;
  arXiv:math/0404048: Theorem 1.1, p. 3.
- D. Aldous, *The random walk construction of uniform spanning trees and uniform labelled trees*,
  SIAM J. Discrete Math. 3 (1990), 450–465. A. Broder, *Generating random spanning trees*, 30th
  Annual Symposium on Foundations of Computer Science (1989), 442–447. Attributed through LP.

# Roadmap: electrical networks and random walks

**Summary.** This roadmap develops the dictionary between reversible random walks on a finite
graph and electrical networks. A network is a finite set of vertices with symmetric nonnegative
conductances `c(x, y)`; the edges are the pairs of distinct vertices with positive conductance,
loops are allowed, and the network is connected when its edges connect all vertices. The random
walk steps from `x` to `y` with probability `c(x, y)/c(x)`, where `c(x) = ∑_y c(x, y)`, and
`c_G = ∑_x c(x)` is the total weight. Harmonic functions, voltages, unit current flows and the
effective resistance `R(a ↔ z)` are defined for every network. The theorems are stated for
connected networks, except a few that hold without connectivity and say so, and the theorems about
two vertices `a`, `z` assume `a ≠ z` where the statement needs it.

The headline theorems are these.

- *Harmonic functions.* On a connected network, every function on a nonempty set `B` of vertices
  has exactly one extension that is harmonic at every vertex outside `B`, and such a function is
  bounded everywhere by its maximum over `B`.
- *Escape probabilities and commute times.* If `a ≠ z`, the walk started at `a` reaches `z`
  before returning to `a` with probability `1/(c(a) R(a ↔ z))`. For all vertices `a`, `b`, the
  expected time to go from `a` to `b` plus the expected time to go from `b` to `a` is
  `c_G R(a ↔ b)`.
- *Variational principles.* For `a ≠ z`, `R(a ↔ z)` is the least energy of a unit flow from `a`
  to `z`, attained exactly by the unit current flow (Thomson's principle), and `1/R(a ↔ z)` is the
  least Dirichlet energy of a function equal to `1` at `a` and `0` at `z` (Dirichlet's principle).
  Consequently raising conductances never raises effective resistance (Rayleigh's monotonicity
  law), effective resistance is a metric on the vertices, and disjoint cutsets separating `a` from
  `z` bound it from below (the Nash-Williams inequality).
- *Foster's theorem.* On a connected network on `n` vertices, the sum over the edges `e` of
  `c(e) R(e)` is `n − 1`.

The roadmap builds on Mathlib's simple graphs, matrices and probability mass functions and on its
hitting times of processes, and on Tau Ceti's path law of a Markov chain and its Markov property.
MarkovChainsAndRenewal supplies the stationary law of an irreducible chain and Kac's formula for
the mean return time, which the commute time identity and Foster's theorem use. The weighted graph
Laplacian appears here only through the voltage problem; its spectrum belongs to other roadmaps.

Layer 1 defines networks and their walk, and proves the maximum principle, the Dirichlet problem
and the harmonicity of hitting probabilities. Layer 2 defines voltages and effective resistance
and proves the variational principles and their consequences. Layer 3 connects effective
resistance to the walk: escape probabilities, commute times and Foster's theorem.

## How to read the build

Layer 1 below depends on no other layer. Layer 2 uses 1.1 and 1.2 only; nothing in it involves the
random walk. Layer 3 uses 1.1, 1.2, 1.3 and Layer 2. Within a layer the sections are in build order. Every
target ends with a *Needs:* line naming what its statement and its route use, and every claim
carries a source locator in parentheses or says that it is proved here. `LPW` is the book of Levin
and Peres, `LP` the book of Lyons and Peres and `DS` the monograph of Doyle and Snell listed under
References. `Suggested.lean` states the headline theorems of every layer.

## Conventions

- **Networks.** `V` is a finite type (`[Fintype V]`, with `[DecidableEq V]` where matrices on `V`
  occur). A network `N : Network V` is a function `N.cond : V → V → ℝ` with
  `cond x y = cond y x` and `0 ≤ cond x y`. Loops `cond x x > 0` are allowed. Parallel edges are
  not modelled separately: their conductances add up to one value of `cond`.
- **Edges and connectivity.** The graph of the network, `N.graph`, is Mathlib's
  `SimpleGraph.fromRel` of the relation `0 < cond x y`, so `x` and `y` are adjacent when `x ≠ y`
  and `0 < c(x, y)`; loops are not edges of this graph. Connectivity is `N.graph.Connected`, which
  includes nonemptiness of `V`. The conductance of an unordered pair is `N.edgeCond`, through
  Mathlib's `Sym2.lift`.
- **Weights.** `c(x) = N.weight x = ∑ y, c(x, y)` counts a loop once, and the total weight is
  `c_G = N.totalWeight = ∑ x, c(x) = ∑ x, ∑ y, c(x, y)`. On a network without loops `c_G` is twice
  the sum of the edge conductances, so for simple random walk on a graph with `m` edges `c_G = 2m`.
  A loop at `x` contributes `c(x, x)` to `c_G` once.
- **Sums over edges.** Every sum over edges is written as a double sum over ordered pairs, in which
  each edge appears twice and loops appear once; where a loop term vanishes (energies, `c R`), the
  double sum is twice the edge sum. The factor `1/2` in the energies of 2.2 and 2.3 accounts for
  this.
- **The walk.** `N.walk : Kernel V V` is the Markov kernel with `walk x {y} = c(x, y)/c(x)` when
  `c(x) > 0`, and the point mass at `x` when `c(x) = 0` (a vertex of weight zero has no edge and no
  loop; on a connected network with at least two vertices it does not occur). The walk is not made
  lazy: it stays at `x` only through a loop, with probability `c(x, x)/c(x)`. The path law from `x`
  is Tau Ceti's `markovChainLaw (Measure.dirac x) N.walk` on `ℕ → V`, written `P_x`, with
  expectation `E_x`; `V` carries a measurable space with measurable singletons.
- **Hitting times.** On a path `ω : ℕ → V`, `τ_B = hittingAfter (fun n ω => ω n) B 0 ω` is the
  first entrance time of `B`, which is `0` when `ω 0 ∈ B`, and
  `τ_x⁺ = hittingAfter (fun n ω => ω n) {x} 1 ω` is the first return time to `x`, which is at
  least `1`. Both take values in `WithTop ℕ`, with `⊤` when the set is never reached; an event
  `τ_A < τ_B` fails when both are `⊤`. Mean hitting times are lower integrals in `ℝ≥0∞` of the
  coercion `ENat.toENNReal` of these times, so a time that is infinite with positive probability
  has infinite mean.
- **Junk values.** Real division by zero is `0`, and the inverse of a singular matrix is Mathlib's
  `0`. The effective resistance `R(a ↔ a)` is `0` by definition, and on a disconnected network
  every effective resistance is `0` (2.1). Each statement says how it handles these cases.

## Layer 1: networks, harmonic functions and the random walk

### 1.1 Networks and their random walk

Define the structure `Network V` with the fields `cond`, `symm`, `nonneg`; the weight `weight`,
the total weight `totalWeight`, the graph `graph` and the edge conductance `edgeCond` of the
Conventions; the transition law `walkPMF x`, which is Mathlib's `PMF.ofFintype` of
`y ↦ c(x, y)/c(x)` when `c(x) > 0` and `PMF.pure x` otherwise; and the walk `walk`, Tau Ceti's
`Kernel.ofPMF` of `walkPMF`, with its instance `IsMarkovKernel`.

- The walk has `walk x {y} = c(x, y)/c(x)` whenever `c(x) > 0`, by Tau Ceti's
  `Kernel.ofPMF_apply_singleton`.
- On a network with `c_G > 0` the walk is reversible in the sense of Mathlib's
  `Kernel.IsReversible` with respect to the probability measure `π {x} = c(x)/c_G`, so `π` is
  stationary by Mathlib's `Kernel.IsReversible.invariant` (LPW, §9.1, p. 116).
- If the network is connected, the walk is irreducible: every vertex reaches every other along
  the edges of `N.graph`, each of positive probability.
- Conversely, every Markov kernel on `V` that is reversible with respect to a probability measure
  with positive masses is the walk of the network `c(x, y) = π {x} · κ x {y}` (LPW, §9.1,
  pp. 116–117).

**Checks.**
- The path `0 — 1 — 2` with unit conductances has weights `1, 2, 1` and `c_G = 4`, twice its two
  edges; its walk steps from `1` to `0` with probability `1/2`.
- One vertex with a loop of conductance `2` has `c(x) = 2` and `c_G = 2`: a loop is counted once,
  and the variant that counts it twice would give `4`. Its walk stays put.
- Adding at every vertex a loop of conductance `c(x)` turns the walk `P` into the lazy walk
  `(I + P)/2` and doubles `c_G`; for the path above the new weights are `2, 4, 2` and `c_G = 8`.

*Needs:* Mathlib `PMF.ofFintype`, `PMF.pure`, `SimpleGraph.fromRel`, `Sym2.lift`,
`Kernel.IsReversible`, `Kernel.IsReversible.invariant`; Tau Ceti `Kernel.ofPMF`,
`Kernel.ofPMF_apply_singleton`. (Proved here.)

### 1.2 The maximum principle and the Dirichlet problem

Define `IsHarmonicAt f x` for `f : V → ℝ`: `∑ y, c(x, y) (f y − f x) = 0`. When `c(x) > 0` this
says that `f x` is the mean of `f` over one step of the walk from `x`; at a vertex of weight zero
every function is harmonic.

- `exists_mem_le_of_isHarmonicAt`, *the maximum principle*: on a connected network, if `B` is a
  nonempty set of vertices and `f` is harmonic at every vertex outside `B`, then for every vertex
  `x` there is `b ∈ B` with `f x ≤ f b` (LPW, Proposition 9.1 and its proof, p. 117; LP, §2.1,
  Maximum Principle, p. 20).
- `existsUnique_isHarmonicAt`, *the Dirichlet problem*: on a connected network, for every nonempty
  `B` and every `φ : V → ℝ` there is exactly one `f` with `f = φ` on `B` and `f` harmonic at every
  vertex outside `B` (LPW, Proposition 9.1, p. 117; LP, §2.1, Uniqueness and Existence Principles,
  pp. 20–21).

Route: let `x₀` maximize `f`. If `x₀ ∉ B`, harmonicity at `x₀` forces `f` to be maximal at every
neighbour of `x₀`; following a path of `N.graph` from `x₀` to `B`, which exists by connectivity,
the maximum is reached at a point of `B`. Uniqueness: the difference of two solutions is harmonic
outside `B` and vanishes on `B`, so by the maximum principle applied to it and to its negative it
vanishes. Existence: harmonicity outside `B` is a square linear system in the values outside `B`,
and uniqueness for `φ = 0` says that its matrix is injective, hence invertible (LPW, Remark 9.3,
p. 118).

**Checks.**
- On the path `0 — 1 — 2` with `c(0, 1) = 1`, `c(1, 2) = 2`, the extension of `φ(0) = 0`,
  `φ(2) = 1` from `B = {0, 2}` has `f(1) = 2/3`.
- The set `B` must be nonempty: with `B` empty every constant is harmonic everywhere, so the
  extension is not unique and the maximum principle has no point `b` to offer.
- Connectivity is needed: on two vertices with no edge and `B = {x}`, the other vertex has weight
  zero, every value there is harmonic, and `f = 0` at `x`, `f = 5` at the other vertex violates
  the maximum principle.

*Needs:* 1.1. (Proved here.)

### 1.3 Hitting probabilities

Prove `isHarmonicAt_hitBefore`: for sets `A`, `B` of vertices, the function
`x ↦ P_x(τ_A < τ_B)` is harmonic at every vertex outside `A ∪ B` (LPW, Proposition 9.1, proof,
(9.3)–(9.4), p. 117, for the function `E_x h(X_(τ_B))`; LP, §2.1, (2.2) and the computation after
it, p. 19, for disjoint `A` and `B`). It equals `1` on `A` minus `B` and `0` on `B`, directly from
the definitions of the hitting times. No connectivity is assumed. By 1.2, on a connected network
with `A`, `B` nonempty and disjoint it is the unique function with these values that is harmonic
outside `A ∪ B`.

Route: first-step analysis. For `x ∉ A ∪ B`, both hitting times of a path from `x` are one more
than those of the path shifted by one step, including the value `⊤`; so the event is the shifted
event, and the Markov property at time `1` (Tau Ceti's
`Measure.markovChainLaw_map_prefix_shift_iterate_eq_compProd` with `n = 1`) gives
`P_x(τ_A < τ_B) = ∑ y, walk x {y} · P_y(τ_A < τ_B)`. Multiply by `c(x)`; at a vertex of weight
zero there is nothing to prove.

**Checks.**
- On the path `0 — 1 — 2` with unit conductances, `P_1(τ_2 < τ_0) = 1/2`; with `c(0, 1) = 1` and
  `c(1, 2) = 2` it is `2/3`, the value of the Check of 1.2.
- Harmonicity fails at a point of `A` outside `B`: on the unit path, the function is `1` at `2`
  for `A = {2}`, `B = {0}`, while its neighbour `1` has the value `1/2`.

*Needs:* 1.1, 1.2; Mathlib `hittingAfter`; Tau Ceti `markovChainLaw`,
`Measure.markovChainLaw_map_prefix_shift_iterate_eq_compProd`, `Kernel.ofPMF_apply_singleton`.
(Proved here.)

### Examples

Unit paths and paths with unequal conductances, with their harmonic extensions and hitting
probabilities; a vertex with a loop; the lazy version of a walk obtained by adding loops.

### Dependencies

Mathlib `PMF.ofFintype`, `PMF.pure`, `SimpleGraph.fromRel`, `Sym2.lift`, `Kernel.IsReversible`,
`Kernel.IsReversible.invariant`, `hittingAfter`; Tau Ceti `Kernel.ofPMF`,
`Kernel.ofPMF_apply_singleton`, `markovChainLaw`,
`Measure.markovChainLaw_map_prefix_shift_iterate_eq_compProd`. No other layer.

## Layer 2: effective resistance

### 2.1 The Laplacian, voltages and effective resistance

Define the Laplacian `laplacian = diag(c(x)) − (c(x, y))`, whose loop terms cancel on the diagonal.
For symmetric conductances this is the out-degree Laplacian of the conductance weights; directed
weights are not treated here. Define the grounded Laplacian `groundedLaplacian z`, the Laplacian
with the row and column of `z` deleted, indexed by `{x // x ≠ z}`; the voltage `voltage a z`, equal to `0` when `a = z`, and otherwise
equal to `0` at `z` and to the entry in row `x` and column `a` of the inverse of the grounded
Laplacian at every `x ≠ z`; and the effective resistance `effResistance a z = voltage a z a`,
written `R(a ↔ z)`. For a connected network and `a ≠ z` the voltage is harmonic outside `{a, z}`,
vanishes at `z`, and sends a unit current out of `a`: `∑ y, c(a, y) (v a − v y) = 1` (LP,
Exercise 2.62 (a), p. 65, for simple networks).

Prove `effResistance_eq_div`: on a connected network, for every `W : V → ℝ` harmonic at every
vertex outside `{a, z}` with `W a ≠ W z`,
`R(a ↔ z) = (W a − W z) / ∑ y, c(a, y) (W a − W y)`. This is the definition of effective
resistance as voltage drop over the strength of the current (LPW, §9.4, (9.11), p. 119; DS, §1.3.4;
LP, §2.2, (2.4), p. 25, for the effective conductance). The hypothesis `W a ≠ W z` gives `a ≠ z`.

- On every network, `R(a ↔ a) = 0` by definition.
- On a connected network the grounded Laplacian is invertible for every `z`: a vector in its kernel,
  extended by `0` at `z`, is harmonic outside `{z}` and vanishes at `z`, so it is `0` by 1.2.
- On a disconnected network the grounded Laplacian is singular for every `z`, since a component
  not containing `z` contributes a block with the constants in its kernel; its inverse is the junk
  value `0`, and every effective resistance is `0`.

Route: by 1.2 with `B = {a, z}`, `W` is `W z + (W a − W z) (v / v a)`, so the quotient is
`v a / ∑ y, c(a, y) (v a − v y) = v a`.

**Checks.**
- Series and parallel: on the path `a — x — z` with `c(a, x) = 1`, `c(x, z) = 2`,
  `R(a ↔ z) = 1 + 1/2 = 3/2`; a single edge of conductance `3` has `R = 1/3`; on the triangle
  with unit conductances `R = 2/3` between any two vertices, the value of a unit resistor in
  parallel with two in series. The plausible wrong definition `R(a ↔ z) = 1/c(a, z)` gives `1` on
  the triangle.
- Two vertices with no edge: the grounded Laplacian is the `1 × 1` zero matrix and `R = 0`.

*Needs:* 1.2; Mathlib `Matrix.diagonal`, `Matrix.submatrix`, the inverse `Matrix.inv` with
`Matrix.mul_nonsing_inv` and `Matrix.nonsing_inv_apply_not_isUnit`. (Proved here.)

### 2.2 Dirichlet's principle

Define the Dirichlet energy `dirichletEnergy f = ½ ∑ x, ∑ y, c(x, y) (f x − f y)²`. Prove
`isLeast_dirichletEnergy`: on a connected network, for `a ≠ z`, the least Dirichlet energy of a
function equal to `1` at `a` and `0` at `z` is `1/R(a ↔ z)` (LPW, Exercise 9.9 (a), p. 126; LP,
Exercise 2.13, p. 36).

- The minimizer is unique: it is `v / v a` for the voltage `v` of 2.1, the harmonic extension of
  the boundary values.

Route: the energy is the quadratic form of the Laplacian; for `f` with `f a = 1`, `f z = 0`, write
`f = u + g` with `u = v / v a` and `g` vanishing at `a` and `z`. The cross term is
`∑ x, g x · (laplacian u) x`, which vanishes because `laplacian u` vanishes outside `{a, z}`. So
the energy of `f` is that of `u` plus that of `g`, and the energy of `u` is
`∑ y, c(a, y) (u a − u y) = 1/v a = 1/R(a ↔ z)`.

**Checks.**
- On the unit triangle, `f = (1, 1/2, 0)` on `(a, x, z)` has energy `1/4 + 1/4 + 1 = 3/2`, which is
  `1/R`; without the factor `1/2` the double sum would give `3`.
- The hypothesis `a ≠ z` is needed: for `a = z` no function takes both values, and the set of
  energies is empty.
- Connectivity is needed: on the unit edge `az` together with an isolated third vertex, the least
  energy is `1`, while the effective resistance is the junk value `0` and `1/R = 0`.

*Needs:* 2.1. (Proved here.)

### 2.3 Unit flows and Thomson's principle

Define `IsUnitFlow a z θ` for `θ : V → V → ℝ`, with four fields: `θ` is antisymmetric
(`antisymm`), vanishes where the conductance vanishes (`support`), has divergence
`∑ y, θ x y = 0` at every `x ∉ {a, z}` (`node`, Kirchhoff's node law), and has divergence `1` at
`a` (`strength`). Define the energy `flowEnergy θ = ½ ∑ x, ∑ y, θ(x, y)² / c(x, y)`, each edge counted
once; the terms with `c(x, y) = 0` vanish since `θ` does there.

- `isLeast_flowEnergy`, *Thomson's principle*: on a connected network, for `a ≠ z`, the least
  energy of a unit flow from `a` to `z` is `R(a ↔ z)` (LPW, Theorem 9.10, p. 122; LP, §2.4,
  Thomson's Principle, p. 35; DS, §1.3.5).
- `eq_current_of_flowEnergy_eq`: a unit flow from `a` to `z` with energy `R(a ↔ z)` is the unit
  current `(x, y) ↦ c(x, y) (v x − v y)` of the voltage `v` of 2.1 (LPW, Theorem 9.10, p. 122). No
  connectivity is assumed: on a disconnected network either no unit flow from `a` to `z` exists or
  every one has positive energy, while `R(a ↔ z)` is `0`.
- Every unit flow has divergence `−1` at `z`, since the divergences of an antisymmetric function
  sum to `0`; for `a = z` there is no unit flow.

Route: the unit current is a unit flow by 2.1, with energy `v a = R(a ↔ z)`. For a unit flow `θ`,
the difference `θ − i` has divergence `0` everywhere, so `∑ x, ∑ y, (θ − i)(x, y) (v x − v y) = 0`
by summation by parts; hence `flowEnergy θ = flowEnergy i + flowEnergy (θ − i)`, and the last term
vanishes only when `θ = i`.

**Checks.**
- On the unit triangle the unit current from `a` to `z` sends `2/3` along the edge `az` and `1/3`
  through `x`, with energy `4/9 + 1/9 + 1/9 = 2/3 = R`; the unit flow along the edge `az` alone has
  energy `1`.
- The support condition is needed: on the unit path `a — x — z`, the antisymmetric function
  sending `1` directly from `a` to `z` across the pair `az` of conductance `0` would have energy
  `0`, below `R(a ↔ z) = 2`.
- The hypothesis `a ≠ z` is needed for `isLeast_flowEnergy`: the set of unit flows from `a` to `a`
  is empty.

*Needs:* 2.1. (Proved here.)

### 2.4 Rayleigh's monotonicity law

Prove `effResistance_le_of_cond_le`: if `N` is connected and `N'` is a network on the same vertices
with `c(x, y) ≤ c'(x, y)` for all `x`, `y`, then `R'(a ↔ z) ≤ R(a ↔ z)` for all `a`, `z` (LPW,
Theorem 9.12, p. 123; LP, §2.4, Rayleigh's Monotonicity Principle (i), p. 35; DS, §1.4.1).

- Adding an edge, or raising the conductance of one, does not raise any effective resistance
  (LPW, Corollary 9.13, p. 123).

Route: `N'` is connected. For `a ≠ z` the energy of a fixed function under `c'` is at least its
energy under `c`, so the least energy of 2.2 increases and its reciprocal decreases. For `a = z`
both sides are `0`.

**Checks.**
- The unit path `a — x — z` has `R(a ↔ z) = 2`; adding the unit edge `az` gives the triangle and
  `R = 2/3`.
- Connectivity of `N` is needed: on two vertices, `c = 0` and `c' = 1` give the junk value `R = 0`
  and `R' = 1`.

*Needs:* 2.2. (Proved here.)

### 2.5 Effective resistance is a metric

- `effResistance_comm`: `R(a ↔ z) = R(z ↔ a)`.
- `effResistance_pos`: on a connected network, `0 < R(a ↔ z)` for `a ≠ z`.
- `effResistance_triangle`: `R(x ↔ z) ≤ R(x ↔ y) + R(y ↔ z)`.

Together with `R(a ↔ a) = 0`, these say that effective resistance is a metric on the vertices of a
connected network (LPW, Exercise 9.8, p. 126, and Corollary 10.8, p. 132; LP, Exercise 2.67,
p. 65). Symmetry and the triangle inequality need no connectivity, since on a disconnected network
every effective resistance is `0`.

Route: symmetry from Thomson's principle, since reversing a unit flow from `a` to `z` gives one from
`z` to `a` with the same energy. Positivity from 2.2: a function equal to `1` at `a` and `0` at `z`
has positive energy, since by connectivity some edge joins vertices where it differs. Triangle
inequality: the sum of the unit currents from `x` to `y` and from `y` to `z` is the unit current
from `x` to `z`, with voltage the sum `v₁ + v₂` of the two voltages; its value at `x` minus its
value at `z` is `R(x ↔ z)`, and `v₁ x − v₁ z ≤ v₁ x − v₁ y = R(x ↔ y)` and
`v₂ x − v₂ z ≤ v₂ y − v₂ z = R(y ↔ z)` by the maximum principle of 1.2 (LPW, Exercise 9.8, hint).

**Checks.**
- On the unit path `0 — 1 — 2`, `R(0 ↔ 2) = 2 = R(0 ↔ 1) + R(1 ↔ 2)`: the triangle inequality is
  an equality along a path through a cut vertex. On the unit triangle it is strict,
  `2/3 < 4/3`.
- On the unit 4-cycle, `R = 3/4` between neighbours and `R = 1` between opposite vertices.
- Positivity needs connectivity: on two vertices with no edge `R = 0`.

*Needs:* 1.2, 2.1, 2.2, 2.3. (Proved here.)

### 2.6 The Nash-Williams inequality

Prove `sum_inv_le_effResistance`: on a connected network, let `cuts i`, for `i` in a finite index
type, be pairwise disjoint finite sets of unordered pairs of vertices, each containing an edge of
every walk from `a` to `z` in `N.graph`. Then the sum over `i` of the inverse of
`∑ e ∈ cuts i, c(e)` is at most `R(a ↔ z)` (LPW, Proposition 9.16, p. 124; LP, §2.5, the
Nash-Williams Inequality, (2.13), p. 37).

- Each such set contains an edge of positive conductance, because a walk from `a` to `z` exists,
  so the inverses are not junk values. For `a = z` the empty walk has no edge, so the hypothesis
  holds only for the empty family, where the statement reads `0 ≤ 0`.
- *Cut estimate*: every unit flow `θ` from `a` to `z` and every such set `Π` have
  `1 ≤ ∑ e ∈ Π, |θ(e)|` (LPW, Lemma 9.15, p. 123).

Route: for the cut estimate, let `S` be the set of vertices joined to `a` by a walk avoiding the
pairs of `Π`; it contains `a` and not `z`, the divergences of `θ` over `S` sum to `1`, and the
pairs joining `S` to its complement with nonzero `θ` lie in `Π`. Then by Cauchy–Schwarz
(Mathlib's `Finset.sum_mul_sq_le_sq_mul_sq`), `(∑ e ∈ Π, c(e)) · ∑ e ∈ Π, θ(e)²/c(e) ≥ 1`; sum
over the disjoint sets and apply Thomson's principle of 2.3 to the unit current.

**Checks.**
- On the unit path with `m` edges from `a` to `z`, the `m` single edges are disjoint cutsets and
  the bound `m` equals `R(a ↔ z)`.
- On the unit 4-cycle with `a`, `z` opposite, the two pairs of edges at `a` and at `z` are disjoint
  cutsets, and the bound `1/2 + 1/2 = 1` equals `R(a ↔ z)`.
- Connectivity is needed: on the vertices `a`, `z`, `w` with only the unit edge `zw`, no walk joins
  `a` to `z`, so `{zw}` qualifies and gives the bound `1`, while `R(a ↔ z) = 0`.

*Needs:* 2.3; Mathlib `SimpleGraph.Walk`, `SimpleGraph.Walk.edges`,
`Finset.sum_mul_sq_le_sq_mul_sq`. (Proved here.)

### Examples

Series and parallel reductions on paths, triangles and the 4-cycle, with their voltages, unit
currents, minimizing functions and cutsets; the effect of adding an edge.

### Dependencies

1.2; Mathlib `Matrix.diagonal`, `Matrix.submatrix`, `Matrix.inv`, `Matrix.mul_nonsing_inv`,
`Matrix.nonsing_inv_apply_not_isUnit`, `SimpleGraph.Walk`, `SimpleGraph.Walk.edges`,
`Finset.sum_mul_sq_le_sq_mul_sq`.

## Layer 3: escape probabilities, commute times and Foster's theorem

### 3.1 Escape probability

Prove `escapeProb_eq`: on a connected network, for `a ≠ z`,
`P_a(τ_z < τ_a⁺) = 1/(c(a) R(a ↔ z))` (LPW, Proposition 9.5, (9.12), p. 119; DS, §1.3.4; LP, §2.2,
(2.4), p. 25).

- By 2.4, adding an edge that is not at `a` does not decrease the escape probability from `a`,
  since it leaves `c(a)` unchanged (LPW, Corollary 9.13, p. 123).
- *The Green function*: the number of visits to `a` before `τ_z`, counting time `0`, has a
  geometric law under `P_a` with success parameter `P_a(τ_z < τ_a⁺)`, so its mean is
  `c(a) R(a ↔ z)` (LPW, Lemma 9.6, (9.17), p. 120).

Route: by 1.3 and 1.2, `P_x(τ_z < τ_a) = (v a − v x)/v a` for the voltage `v` of 2.1, since both
sides are harmonic outside `{a, z}` with the values `0` at `a` and `1` at `z`. First-step analysis
at `a`, as in 1.3, gives `P_a(τ_z < τ_a⁺) = ∑ y, walk a {y} · P_y(τ_z < τ_a)`, which is
`(1/(c(a) v a)) ∑ y, c(a, y) (v a − v y) = 1/(c(a) R(a ↔ z))`. Connectivity gives `c(a) > 0`.

**Checks.**
- On the unit path `a — x — z`: `c(a) = 1`, `R = 2`, and the escape probability is `1/2`.
- On the unit triangle: `c(a) = 2`, `R = 2/3`, and the escape probability is
  `3/4 = 1/2 + 1/2 · 1/2`, by a direct first-step count.
- A loop counts in `c(a)`: on the unit edge `az` with a unit loop at `a`, `c(a) = 2`, `R = 1`, and
  the walk leaves `a` for `z` with probability `1/2`, which is the escape probability; the variant
  of `c(a)` without the loop would give `1`.
- The hypothesis `a ≠ z` is needed: for `a = z` the event holds on every path, since
  `τ_a = 0 < 1 ≤ τ_a⁺`, so the probability is `1`, while the right side is the junk value
  `1/0 = 0`.

*Needs:* 1.2, 1.3, 2.1, 2.4 (for the first bullet); Tau Ceti `markovChainLaw`,
`Measure.markovChainLaw_map_prefix_shift_iterate_eq_compProd`,
`Measure.markovChainLaw_restrict_map_stoppedValue_shift_iterate` (for the Green function).
(Proved here.)

### 3.2 The commute time identity

Prove `lintegral_hittingAfter_add_lintegral_hittingAfter`: on a connected network, for all vertices
`a`, `b`, `E_a τ_b + E_b τ_a = c_G R(a ↔ b)`, both sides in `ℝ≥0∞` (LPW, Proposition 10.7,
(10.14), p. 132; LP, Corollary 2.21, p. 48, where the total weight counts each edge twice and each
loop once, as `c_G` does here). For `a = b` both sides are `0`.

- *Occupation measures of returning stopping times*: on a connected network, if `T` is a stopping
  time with `E_a T < ∞`
  and `X_T = a` almost surely under `P_a`, then the expected number of visits to `x` before `T`
  is `π {x} · E_a T`, where `π` is the stationary law of 1.1 (LPW, Lemma 10.5 and Remark 10.6,
  (10.13), p. 131).

Route: apply the occupation identity to the commute time `T`, the first visit to `a` after `τ_b`,
whose mean is `E_a τ_b + E_b τ_a` by the strong Markov property at `τ_b`. The walk does not visit
`a` between `τ_b` and `T`, so the expected number of visits to `a` before `T` is the Green function
of 3.1, `c(a) R(a ↔ b)`; dividing by `π {a} = c(a)/c_G` gives the identity. The means are finite
because an irreducible chain on a finite set reaches every state with a geometric tail.

**Checks.**
- On the unit path with `m` edges between its ends, `c_G = 2m`, `R = m`, and the commute time is
  `2m²`; for `m = 2` each of the two hitting times is `4`.
- On the unit triangle, `E_a τ_z = 2` in each direction, and `c_G R = 6 · 2/3 = 4`.
- The factor is `c_G`, not the sum of the edge conductances: on the unit path with two edges the
  commute time is `8`, while the sum of the edge conductances times `R` is `2 · 2 = 4`.
- The lazy walk of 1.1 doubles the commute time: on the unit path with two edges, adding loops
  `c(x, x) = c(x)` gives `c_G = 8` and commute time `16`, with `R` unchanged.
- Connectivity is needed: on two vertices with no edge both hitting times are infinite, while the
  right side is `0`.

*Needs:* 1.1, 2.1, 3.1; Mathlib `hittingAfter`, `ENat.toENNReal`; Tau Ceti `markovChainLaw`,
`Measure.markovChainLaw_restrict_map_stoppedValue_shift_iterate`; MarkovChainsAndRenewal Layer 3,
item 2 (the occupation measure of one return cycle is invariant; Kac's formula). (Proved here.)

### 3.3 Foster's theorem

Prove `sum_cond_mul_effResistance`: on a connected network on `n` vertices,
`∑ x, ∑ y, c(x, y) R(x ↔ y) = 2 (n − 1)`. Each edge appears twice in the double sum and loop terms
vanish, so the sum of `c(e) R(e)` over the edges is `n − 1` (Foster, 1948; LP, Exercise 2.65,
p. 65, and Exercise 4.29, p. 128; LPW, Exercise 10.20, p. 149, for unit conductances).

Route: for one vertex both sides are `0`; otherwise every `c(x)` is positive. By 3.2,
`c_G c(x, y) R(x ↔ y) = c(x, y) (E_x τ_y + E_y τ_x)`; summing over `x` and `y` and using the
symmetry of `c`, `c_G` times the double sum is `2 ∑ x, ∑ y, c(x, y) E_y τ_x`. First-step analysis
at `x` gives `∑ y, c(x, y) E_y τ_x = c(x) (E_x τ_x⁺ − 1)`, and Kac's formula
(MarkovChainsAndRenewal Layer 3, item 2) with the stationary law `π {x} = c(x)/c_G` gives
`E_x τ_x⁺ = c_G/c(x)`; so `c_G` times the double sum is `2 ∑ x, (c_G − c(x)) = 2 (n − 1) c_G`. (A second route computes a trace: the double sum is
twice the trace of the Laplacian times a generalized inverse, and the Laplacian of a connected
network has rank `n − 1`; LP, Comments on Exercises, 2.65, p. 599.)

**Checks.**
- On the unit triangle, `3 · 2/3 = 2 = n − 1`.
- On a tree every edge `e` has `R(e) = 1/c(e)`, and there are `n − 1` edges.
- On one vertex, with or without a loop, both sides are `0`.
- Connectivity is needed: on two vertices with no edge the double sum is `0`, and `2 (n − 1) = 2`.

*Needs:* 3.1, 3.2; Tau Ceti `markovChainLaw`,
`Measure.markovChainLaw_map_prefix_shift_iterate_eq_compProd` (first-step analysis);
MarkovChainsAndRenewal Layer 3, item 2. (Proved here.)

### Examples

Escape probabilities and commute times on paths, triangles, complete graphs and cycles: on the
complete graph on four vertices with unit conductances, `R = 1/2`, the escape probability is
`2/3` and the commute time is `6`; on the unit 4-cycle the commute time between opposite vertices
is `8`, each hitting time being `4`.

### Dependencies

1.1, 1.2, 1.3 and Layer 2; Mathlib `hittingAfter`, `ENat.toENNReal`; Tau Ceti `markovChainLaw`,
`Measure.markovChainLaw_map_prefix_shift_iterate_eq_compProd`,
`Measure.markovChainLaw_restrict_map_stoppedValue_shift_iterate`; MarkovChainsAndRenewal Layer 3,
item 2.

## Scope and ownership

This roadmap owns the targets stated above for finite networks: the maximum principle and the
Dirichlet problem for the network's harmonic functions, the harmonicity of hitting probabilities,
voltages, unit current flows and effective resistance, Dirichlet's and Thomson's principles,
Rayleigh's monotonicity law, the metric property of effective resistance, the Nash-Williams
inequality, the escape probability formula, the commute time identity and Foster's theorem.

Already in the libraries and therefore not targets: Mathlib's simple graphs, walks and connectivity,
the unweighted graph Laplacian `SimpleGraph.lapMatrix` with its quadratic form, matrices and their
inverses, probability mass functions, reversibility and invariance of kernels, and hitting times of
processes; Tau Ceti's kernels from mass functions, the path law `markovChainLaw` of a Markov chain
with its Markov and strong Markov properties, and its visit counts and Green function for a chain
without killing (`TauCeti/Probability/MarkovChain/Visits.lean`). For unit conductances on a
simple graph `G`, the Laplacian of 2.1 is `G.lapMatrix ℝ`. Tau Ceti's network-flow library
(`TauCeti.Flow`, `TauCeti.BoundedFlow`, `TauCeti/Combinatorics/Network/`) treats capacitated flows
on arrow families with their weak duality; the unit flows of 2.3 are signed functions without
capacities, and the cut estimate of 2.6 is the elementary counterpart of
`TauCeti.BoundedFlow.val_eq_arrowSum_sub`.

Left to other roadmaps and stated differently here:

- MarkovChainsAndRenewal owns the qualitative theory of countable chains: the Markov properties, the
  classification of states, the Green function of a chain, stationary laws and Kac's formula
  (its Layers 1–3). Kac's formula is consumed by 3.2 and 3.3 and not restated.
- GeometricTopology 4.4.5 owns the weighted matrix-tree identity. Kirchhoff's expression of
  effective resistance through spanning trees, and the probability `c(e) R(e)` that an edge lies in
  a random spanning tree drawn with probability proportional to the product of its conductances,
  are not treated here; the routes above do not use spanning trees.
- TropicalAndBerkovichArithmetic §6.6 (an open roadmap, not on main) solves the network equations
  on compact metric graphs with loops and multiple edges and derives an identity for Zhang's
  admissible measure, in which each edge contributes `ℓ(e)/(ℓ(e) + r(e))` with `r(e)` the
  resistance between its ends after the edge is deleted, the contributions summing to the first
  Betti number. Foster's theorem of 3.3 is a different statement: it is about a finite network
  with a conductance function, uses the resistance `R(e)` of the whole network, and reads
  `∑ c(e) R(e) = n − 1`; for a non-loop edge of a network without parallel edges the two are
  related by the parallel law `c(e) R(e) = r(e)/(ℓ(e) + r(e))` with `ℓ(e) = 1/c(e)`. This roadmap
  does not depend on that one.
- ArakelovGeometryAndAbelianHeightsPartII §10.2 (an open roadmap, not on main) states that the
  resistance function of a polarized metrized graph of genus at least `2` is at most the length of
  any path between its arguments, and its route passes through the triangle inequality for that
  resistance function. The triangle inequality of 2.5 is a statement about finite networks with
  conductances, not about metric graphs. This roadmap does not depend on that one.
- KernelsAndSpectralMethods (an open roadmap, not on main), Layers 1 and 4.1, treats the weighted
  Laplacians of a symmetric weight matrix, their quadratic forms and kernels, and the random walk
  `D⁻¹ W` with its stationary law and spectral expansion; its Layer 3 treats conductance and the
  Cheeger inequality. Two of its objects meet this roadmap. Its weighted Laplacian
  `diag(degree) − W`, with loops counted in the degree, is the matrix `laplacian` of 2.1, which is
  defined here only to state the grounded Laplacian and the voltage problem. Its reversibility of
  `D⁻¹ W` with respect to `d / vol V` is, for positive degrees, the matrix form of the reversibility
  bullet of 1.1, which is stated here for the Markov kernel `N.walk` and Mathlib's
  `Kernel.IsReversible`, with the point-mass convention at vertices of weight zero. The quadratic
  form of the Laplacian enters only the route of 2.2, and no spectral statement is made. This
  roadmap does not depend on that one.
- MarkovChainMixing (an open roadmap, not on main) owns mixing times, the spectral gap and the
  Dirichlet form of a reversible chain, and excludes hitting times. The Dirichlet energy of 2.2 is
  that Dirichlet form up to the factor `c_G`, used here only under boundary conditions; this
  roadmap does not depend on that one. SpectralQuantumWalks (an open roadmap, not on main) treats
  continuous-time quantum walks on graphs and shares nothing with this one.

Outside the scope: infinite networks, recurrence and transience, and random walks on lattices;
effective resistance between sets of vertices; hitting times other than the two in the commute
time identity, the hitting time identity, and cover times with their bounds; random spanning trees
and Wilson's algorithm; spectral bounds on effective resistance; continuous-time walks; and
non-reversible chains.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Combinatorics/SimpleGraph/Basic.lean`: `SimpleGraph.fromRel` (`(fromRel r).Adj x y` is
  `x ≠ y ∧ (r x y ∨ r y x)`). `Mathlib/Combinatorics/SimpleGraph/Walk/Basic.lean`:
  `SimpleGraph.Walk`, `SimpleGraph.Walk.edges` (the list of unordered pairs crossed by a walk).
  `Mathlib/Combinatorics/SimpleGraph/Connectivity/Connected.lean`: `SimpleGraph.Connected` (nonempty
  and preconnected). `Mathlib/Combinatorics/SimpleGraph/LapMatrix.lean`: `SimpleGraph.lapMatrix`,
  compared with the Laplacian of 2.1 for unit conductances.
- `Mathlib/Data/Sym/Sym2.lean`: `Sym2.lift` (a symmetric function of two variables as a function
  on unordered pairs).
- `Mathlib/Data/Matrix/Diagonal.lean` and `Mathlib/LinearAlgebra/Matrix/Defs.lean`:
  `Matrix.diagonal`, `Matrix.submatrix`. `Mathlib/LinearAlgebra/Matrix/NonsingularInverse.lean`:
  the inverse `A⁻¹` of a square matrix over a commutative ring, `Matrix.mul_nonsing_inv`
  (`A * A⁻¹ = 1` when `A.det` is a unit) and `Matrix.nonsing_inv_apply_not_isUnit` (`A⁻¹ = 0`
  when it is not).
- `Mathlib/Algebra/Order/BigOperators/Ring/Finset.lean`: `Finset.sum_mul_sq_le_sq_mul_sq`
  (Cauchy–Schwarz for finite sums).
- `Mathlib/Probability/ProbabilityMassFunction/Constructions.lean`: `PMF.ofFintype` (a mass
  function from finitely many masses summing to `1`).
  `Mathlib/Probability/ProbabilityMassFunction/Monad.lean`: `PMF.pure` (the point mass).
- `Mathlib/Probability/Kernel/Invariance.lean`: `ProbabilityTheory.Kernel.IsReversible`,
  `ProbabilityTheory.Kernel.Invariant`, `ProbabilityTheory.Kernel.IsReversible.invariant` (a
  reversible measure of a Markov kernel is invariant).
- `Mathlib/Probability/Process/HittingTime.lean`: `MeasureTheory.hittingAfter u s n` (the first
  time `≥ n` at which `u` is in `s`, in `WithTop ι`, and `⊤` if there is none).
- `Mathlib/Basic/Real/ENatENNReal.lean`: `ENat.toENNReal` (the coercion `ℕ∞ → ℝ≥0∞`, sending `⊤`
  to `∞`).

### From Tau Ceti

- `TauCeti/Probability/Kernel/PMF.lean`: `ProbabilityTheory.Kernel.ofPMF` (for a countable source
  with measurable singletons, the kernel whose row at `x` is the measure of the mass function
  `p x`), its instance `IsMarkovKernel`, and `ProbabilityTheory.Kernel.ofPMF_apply_singleton`
  (`ofPMF p x {y} = p x y`).
- `TauCeti/Probability/Process/MarkovChain.lean`: `TauCeti.Probability.markovChainLaw ν κ`, the
  Ionescu–Tulcea path law on `ℕ → α` of the chain with initial measure `ν` and Markov kernel `κ`.
- `TauCeti/Probability/MarkovChain/MarkovProperty.lean`:
  `MeasureTheory.Measure.markovChainLaw_map_prefix_shift_iterate_eq_compProd` (for a finite initial
  measure, the prefix up to time `n` and the path shifted by `n` have the joint law of the prefix
  composed with the path law started at the state at time `n`).
- `TauCeti/Probability/MarkovChain/StrongMarkov.lean`:
  `MeasureTheory.Measure.markovChainLaw_restrict_map_stoppedValue_shift_iterate` (for a stopping
  time `τ` of the natural filtration and an event `A` of its σ-algebra, the path after `τ`
  restricted to `A ∩ {τ ≠ ⊤}` has the path law started from the law of the state at `τ` on that
  event).

### From TauCetiRoadmap.MarkovChainsAndRenewal

- Layer 3, item 2: for an irreducible chain on a countable state space, an invariant probability
  exists exactly when the chain is positive recurrent; it is unique and is `π {x} = 1/m_x` with
  `m_x = E_x τ_x⁺`; it is built from the expected occupation of one return cycle. Used in 3.2 and
  3.3 for the walk of a connected network, whose stationary law is `π {x} = c(x)/c_G` by 1.1.

## References

- P. G. Doyle and J. L. Snell, *Random walks and electric networks*, Carus Mathematical Monographs
  22, Mathematical Association of America, 1984; version 3.02 of 2000 distributed by the authors
  under the GNU General Public License, arXiv:math/0001057. Sections 1.3.4, 1.3.5 and 1.4.1.
- D. A. Levin and Y. Peres, with contributions by E. L. Wilmer, *Markov chains and mixing times*,
  second edition, American Mathematical Society, 2017. Numbering and pages as in the second
  edition made available by the authors: Chapter 9, pp. 116–127, and Chapter 10, §10.3 and the
  exercises, pp. 131–132 and 149.
- R. Lyons and Y. Peres, *Probability on trees and networks*, Cambridge University Press, 2016;
  the corrected and updated edition on the first author's site (version of 19 August 2026),
  Chapter 2, §§2.1–2.7 and the exercises, pp. 18–65, and Exercise 4.29, p. 128.
- R. M. Foster, The average impedance of an electrical network, in *Reissner Anniversary Volume,
  Contributions to Applied Mechanics*, J. W. Edwards, Ann Arbor, 1948, pp. 333–340; named as LP
  attribute Foster's theorem, not consulted.

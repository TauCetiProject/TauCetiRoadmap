# Roadmap: minimum-cost flows and weighted bipartite matching

**Summary.** A network flow problem becomes an optimization problem once every arrow carries a
cost per unit of flow: among all assignments of values to the arrows that respect lower and upper
bounds and meet prescribed supplies and demands at the vertices, find one of least total cost.
This roadmap develops the optimality theory of that problem on a finite directed multigraph, with
parallel arrows, antiparallel arrows and loops allowed, and with bounds, supplies, demands and costs
in a linearly ordered commutative ring such as the integers, the rationals or the reals. From it
follow integrality and duality for the transportation problem and Egerváry's theorem on weighted
bipartite matchings. No procedure for computing an optimum is specified.

The main results are these.

- *Optimality criteria.* A feasible flow has least cost among the feasible flows with the same
  supplies and demands exactly when no directed cycle of its residual network, formed by the arrows
  along which the flow can still be raised or lowered, has negative total cost. Equivalently, there
  is a potential on the vertices for which every such residual arrow has nonnegative reduced cost.
- *Existence, integrality and augmentation.* If some feasible flow exists, a least-cost one
  exists; if the bounds, supplies and demands are integers (more generally, lie in an additive
  subgroup), some least-cost flow takes integer values, whatever the costs. Augmenting a least-cost
  flow along a residual path of least cost, by an amount the path can carry, gives a least-cost flow
  for the correspondingly changed supplies and demands.
- *Duality.* When some feasible flow exists, the least cost of a feasible flow equals the
  greatest value of an explicit dual function of a potential, and when the costs are integers an
  integer potential attains it.
- *Egerváry's theorem.* For weights of any sign on the pairs of two finite sets, the largest
  total weight of a matching equals the least total of nonnegative numbers `u i`, `p j` with
  `u i + p j` at least the weight of every pair; for integer weights the numbers can be taken to
  be integers. For two sets of three elements with weight `1` on every pair, both sides are `3`.

The roadmap builds on the network library of Tau Ceti, which implements the flow theory planned by
GraphConnectivityAndFlows: assignments with bounds and prescribed excess, residual arrows, residual
updates and the decomposition of nonnegative circulations into cycles. It uses the potentials and
the shortest-walk duality of SpanningTreesAndShortestPaths for the second criterion and for
augmentation. Tau Ceti's duality theorem for finite transport between probability vectors and
Mathlib's Birkhoff theorem are the real-valued neighbours of the transportation results here.

Layer 1 below defines the cost of a flow, residual costs and the dual function, and proves the two
optimality criteria, existence with integrality, the augmentation theorem and duality, in that
order. Layer 2 applies Layer 1 to a bipartite network to obtain transportation integrality and
duality, and to a network with one extra vertex to obtain Egerváry's theorem.

## Conventions

- **Coefficients.** Bounds, flow values, supplies, demands, costs and potentials lie in one type
  `K` with `[CommRing K] [LinearOrder K] [IsStrictOrderedRing K]`; `ℤ`, `ℚ` and `ℝ` are instances.
  A ring is needed because a cost multiplies a flow value. Integrality is membership in an additive
  subgroup `H` of `K`: integer values are `H = AddSubgroup.zmultiples 1`, and `H = ⊤` imposes
  nothing.
- **Networks.** A network is a vertex type `V` with `[Fintype V]`, an explicit arrow family
  `Q : V → V → Type*` with `[∀ x y, Fintype (Q x y)]`, and bounds `lo hi : TauCeti.Assignment Q K`.
  Parallel arrows, antiparallel arrows, loops and zero or negative bounds are allowed. The excess
  of an assignment `f` at `v` is Tau Ceti's `TauCeti.excessAt f v`, incoming minus outgoing; so
  positive prescribed excess is a demand and negative excess a supply, and a loop contributes
  nothing. The feasible assignments with prescribed excess `b : V → K` form Tau Ceti's
  `TauCeti.ExcessFlow lo hi b`: the `f` with `lo ≤ f ≤ hi` arrowwise and `excessAt f = b`. When
  this type is nonempty, `lo ≤ hi` and `∑ v, b v = 0` hold automatically.
- **Residual arrows.** The residual arrows from `x` to `y` are Tau Ceti's
  `TauCeti.ResidualHom Q x y = Q x y ⊕ Q y x`: the forward copy `Sum.inl e` of an arrow `e` from
  `x` to `y`, and the reverse copy `Sum.inr e` of an arrow `e` from `y` to `x`. Their residual
  capacities `TauCeti.residualCapacity lo hi f` are `hi e − f e` and `f e − lo e`. The residual
  network of `f` consists of the residual arrows of positive residual capacity; as an arrow family
  it is Tau Ceti's `TauCeti.PositiveHom (residualCapacity lo hi f)`. Both copies of a loop are
  loops, and the copies of antiparallel arrows stay distinct.
- **Walks and cycles.** Walks are Tau Ceti's `TauCeti.ArrowWalk`, with the list
  `TauCeti.ArrowWalk.arrows` of traversed arrows. A path repeats no vertex; a cycle
  (`TauCeti.ArrowWalk.IsCycle`) is a closed walk of positive length repeating no vertex but its
  ends, so a loop is a cycle of length one. The weight `walkWeight w p` of a walk and a potential
  `IsPotential w y` (`y v ≤ y u + w e` for every arrow `e` from `u` to `v`) are those of
  SpanningTreesAndShortestPaths 3.1 and 3.3, copied verbatim.
- **Reduced costs.** For costs `c` and a potential `p : V → K`, the reduced cost of an arrow from
  `x` to `y` is `c e + p x − p y`. A potential in the sense above for the residual costs is a
  `p` making every reduced residual cost nonnegative.
- **Matrices and matchings.** In Layer 2, `ι` and `κ` are finite types, matrices are functions
  `ι → κ → K`, and a matching is a partial bijection `M : ι ≃. κ` (Mathlib's `PEquiv`), so
  unmatched elements on either side are allowed and the two sides may have different sizes.

## Layer 1: optimality of minimum-cost flows

### 1.1 Costs, residual costs and the dual function

Define `flowCost c f`, the sum of `c e * f e` over all arrows, for costs `c` and an assignment
`f`; `residualCost c`, the assignment of the residual arrows giving the forward copy of `e` the
cost `c e` and the reverse copy the cost `−c e`; `IsMinCost c f` for `f : ExcessFlow lo hi b`:
`flowCost c f ≤ flowCost c g` for every `g : ExcessFlow lo hi b`, the same bounds and the same
excess; and `dualValue lo hi c b p`, the sum of `p v * b v` over the vertices plus, over the arrows
`e` from `x` to `y`, the smaller of `(c e + p x − p y) * lo e` and `(c e + p x − p y) * hi e`. The
copies `walkWeight` and `IsPotential` are stated in `Suggested.lean` with the generality of
SpanningTreesAndShortestPaths. The routes below use three identities, steps rather than separate
targets:

- `flowCost c` is additive in the assignment, and for any residual assignment `r`,
  `flowCost c (residualUpdate f r)` is `flowCost c f` plus the sum of `residualCost c a * r a`
  over the residual arrows `a`.
- For a walk `q` of residual arrows and `ε : K`, the sum of
  `residualCost c a * walkAssignment q ε a` over the residual arrows is
  `ε * walkWeight (residualCost c) q`.
- For every assignment `g` with excess `b` and every `p`, `flowCost c g` equals the sum of
  `p v * b v` plus the sum of `(c e + p x − p y) * g e`; this is the identity behind the dual
  function, since `Σ (p x − p y) g e = −Σ p v * excessAt g v`.

**Checks.**
- One arrow from `x` to `y` with `lo = 0`, `hi = 2`, cost `3`, and `b x = −1`, `b y = 1`: the only
  feasible assignment carries `1`, of cost `3`; a demand at `y` is positive excess there. Its
  forward residual copy has capacity `1` and cost `3`, its reverse copy capacity `1` and cost `−3`.
- In the same example, with `t = p y − p x` the dual value is `t + min 0 (2 * (3 − t))`: it is `3`
  at `t = 3` and `2` at `t = 2` and at `t = 4`, and never exceeds `3`. With `max` in place of `min`
  the value at `t = 0` would be `6`, above the least cost, so the minimum is the right choice.

*Needs:* Tau Ceti `TauCeti.Assignment`, `TauCeti.ExcessFlow`, `TauCeti.excessAt`,
`TauCeti.ResidualHom`, `TauCeti.residualUpdate`, `TauCeti.walkAssignment`; the copies of
SpanningTreesAndShortestPaths 3.1 and 3.3. (Proved here.)

### 1.2 The negative-cycle criterion

Prove `isMinCost_iff_forall_isCycle`: for `f : ExcessFlow lo hi b`, `IsMinCost c f` holds if and
only if every cycle `C` of residual arrows all of whose arrows have positive residual capacity has
`0 ≤ walkWeight (residualCost c) C` (Schrijver, §4.6, Proposition 4, pp. 71–72, for `s`–`t` flows
of a given value with real nonnegative costs, positive capacities and no pair of opposite arrows;
the statement here allows coefficients in any linearly ordered commutative ring, signed bounds and
costs, any prescribed excess, parallel and antiparallel arrows and loops).

Route. If such a cycle `C` has negative weight, let `ε > 0` be the least residual capacity on it.
A cycle traverses no arrow twice (`TauCeti.ArrowWalk.IsCycle.nodup_arrows`), so
`residualUpdate f (walkAssignment C ε)` lies between `lo` and `hi` (Tau Ceti
`TauCeti.residualUpdate_walkAssignment_mem_Icc`); a closed walk has excess zero
(`TauCeti.excessAt_walkAssignment` with equal ends), so the excess is still `b`
(`TauCeti.excessAt_residualUpdate`); and by 1.1 its cost is
`flowCost c f + ε * walkWeight (residualCost c) C`, which is smaller. Conversely, for any
`g : ExcessFlow lo hi b` the residual difference `r = residualDifference f g` lies between `0`
and the residual capacities, updates `f` to `g`, and is a circulation because `f` and `g` have the
same excess (`TauCeti.residualDifference_mem_Icc`, `TauCeti.residualUpdate_residualDifference`,
`TauCeti.isCirculation_residualDifference`). By
`TauCeti.exists_pathCycleDecomposition` with `H = ⊤` and
`TauCeti.PathCycleDecomposition.paths_eq_nil`, `r` is a sum of cycles with positive weights; each
is bounded by `r` (`TauCeti.PathCycleDecomposition.assignment_le_of_mem_cycles`), so its arrows
have positive residual capacity. By 1.1,
`flowCost c g − flowCost c f` is the sum of the weights times the cycle costs, which is
nonnegative.

**Checks.**
- Two parallel arrows from `x` to `y` with costs `1` and `3`, bounds `0` and `1`, and one unit to
  send from `x` to `y`. The assignment using the cost-`3` arrow has the residual cycle made of the
  forward copy of the cheap arrow and the reverse copy of the expensive one, of cost `1 − 3 = −2`;
  it is not optimal. The half-and-half assignment, of cost `2`, has the same cycle and is not
  optimal either. The assignment using the cheap arrow, of cost `1`, is optimal: its only cycle of
  positive capacities costs `3 − 1 = 2`.
- The positive-capacity condition is needed: for the optimal assignment of the previous Check the
  cycle through the forward copy of the cheap arrow and the reverse copy of the expensive arrow
  still costs `−2`, but both arrows have capacity zero.
- A loop with cost `−1` and bounds `0`, `2`, with `b = 0`: the zero assignment is not optimal, the
  forward copy of the loop being a cycle of cost `−1`; the assignment `2`, of cost `−2`, is.

*Needs:* 1.1; Tau Ceti `TauCeti.residualUpdate_walkAssignment_mem_Icc`,
`TauCeti.excessAt_walkAssignment`, `TauCeti.excessAt_residualUpdate`,
`TauCeti.residualDifference`, `TauCeti.residualDifference_mem_Icc`,
`TauCeti.residualUpdate_residualDifference`, `TauCeti.isCirculation_residualDifference`,
`TauCeti.exists_pathCycleDecomposition`, `TauCeti.PathCycleDecomposition.paths_eq_nil`,
`TauCeti.PathCycleDecomposition.assignment_le_of_mem_cycles`, `TauCeti.ArrowWalk.IsCycle`,
`TauCeti.ArrowWalk.IsCycle.nodup_arrows`, `TauCeti.residualCapacity`.

### 1.3 Reduced-cost optimality

Prove `isMinCost_iff_exists_isPotential`: `IsMinCost c f` holds if and only if some `p : V → K` is
a potential, on the residual network `PositiveHom (residualCapacity lo hi f)`, for the residual
costs; that is, `residualCost c a + p x − p y ≥ 0` for every residual arrow `a` from `x` to `y` of
positive residual capacity. Read on the original arrows: an arrow of negative reduced cost
`c e + p x − p y` is at its upper bound, and one of positive reduced cost at its lower bound.
(Proved here.)

Route. Walks of `PositiveHom (residualCapacity lo hi f)` are the residual walks along arrows of
positive capacity, with the same cycles and weights. A closed walk of positive length is a cycle or
splits at a repeated vertex into two shorter closed walks whose weights add, so all closed walks
have nonnegative weight exactly when all cycles do. By 1.2, `IsMinCost c f` is therefore
`IsConservative` for the residual costs on this arrow family, and SpanningTreesAndShortestPaths
3.3, `exists_isPotential_iff`, turns that into the existence of a potential.

**Checks.**
- For the optimal assignment of the first Check of 1.2, with `p x = 0`, the potentials are exactly
  the `p y` with `1 ≤ p y ≤ 3`: the forward copy of the expensive arrow gives `p y ≤ 3` and the
  reverse copy of the cheap arrow gives `p y ≥ 1`. Demanding the inequality on the zero-capacity
  arrows as well would add `p y ≤ 1` and `p y ≥ 3`, and no potential would remain.
- For the non-optimal assignment on the expensive arrow there is no potential: the forward copy of
  the cheap arrow and the reverse copy of the expensive one give `p y ≤ p x + 1` and
  `p x ≤ p y − 3`.

*Needs:* 1.2; SpanningTreesAndShortestPaths 3.1 (`walkWeight`, `IsConservative`) and 3.3
(`IsPotential`, `exists_isPotential_iff`); Tau Ceti `TauCeti.PositiveHom`.

### 1.4 Existence and integrality

Prove `exists_isMinCost_mem`: if `ExcessFlow lo hi b` is nonempty and `lo`, `hi` and `b` take
values in an additive subgroup `H`, then some `f : ExcessFlow lo hi b` with `IsMinCost c f` takes
all its values in `H`, for arbitrary costs `c`. With `H = ⊤` this is the existence of a least-cost
assignment; with `H = AddSubgroup.zmultiples 1` it says that integer bounds and integer excess
admit an integer least-cost assignment. (Proved here; Schrijver, §4.6, p. 73, obtains least-cost
`s`–`t` flows of maximum value by repeated augmentation from zero for rational capacities.)

Route. Call an arrow free for `f` when `lo e < f e < hi e`. If the free arrows contain a cycle of
the underlying undirected multigraph (a loop, two parallel or antiparallel free arrows, or a longer
cycle), push an amount `δ` around it, adding on the arrows traversed forwards and subtracting on
those traversed backwards, in the direction whose signed cost sum is at most zero, with `δ > 0`
the least room left on the cycle. The excess does not change, the cost does not increase, and at
least one free arrow reaches a bound while no other arrow becomes free. Starting from any feasible
assignment this ends, after at most as many steps as there are arrows, at a feasible assignment of
no larger cost whose free arrows form a forest. Such an assignment is determined by which arrows
sit at `lo`, which at `hi` and which are free: on a forest the excess equations, solved from the
leaves inwards, fix the free values. So there are finitely many such assignments, and one of least
cost among them has least cost among all. Its values on the arrows that are not free are values of
`lo` or `hi`, and its free values are sums and differences of values of `b`, `lo` and `hi`, so
they lie in `H`.

**Checks.**
- Two parallel arrows from `x` to `y` with cost `1` each, bounds `0` and `1`, one unit to send: the
  half-and-half assignment is a least-cost assignment that is not integral, while `(1, 0)` is an
  integral one. So the theorem asserts that some, not that every, least-cost assignment is
  integral.
- The hypothesis on the data is needed: one arrow with `lo = hi = 1/2` and `b y = 1/2`,
  `b x = −1/2` has the single feasible assignment `1/2`.
- Nonemptiness is needed: with `b x = 0` and `b y = 1` there is no feasible assignment, since the
  excesses do not sum to zero.

*Needs:* Tau Ceti `TauCeti.ExcessFlow`, `TauCeti.excessAt`; Mathlib `AddSubgroup`,
`AddSubgroup.zmultiples`.

### 1.5 Shortest-path augmentation

Prove `isMinCost_residualUpdate_walkAssignment`: let `f : ExcessFlow lo hi b` satisfy
`IsMinCost c f`, and let `P` be a path of residual arrows from `s` to `t` such that
`walkWeight (residualCost c) P ≤ walkWeight (residualCost c) P'` for every path `P'` from `s` to
`t` all of whose arrows have positive residual capacity. For every `ε` with `0 ≤ ε` and `ε` at most
the residual capacity of each arrow of `P`, the assignment `residualUpdate f (walkAssignment P ε)`
lies between `lo` and `hi`, has excess `b` raised by `ε` at `t` and lowered by `ε` at `s`, and has
least cost among the assignments with that excess (Schrijver, §4.6, Proposition 5, pp. 72–73, for
augmentation by the full bottleneck in the setting described at 1.2; the statement here has the
generality of 1.2 and allows any amount up to the bottleneck). For `s = t` the path is empty and
nothing changes.

Route. If `ε = 0` there is nothing to prove, so let `ε > 0`; then every arrow of `P` has positive
capacity. Feasibility and the excess come from `TauCeti.residualUpdate_walkAssignment_mem_Icc`,
`TauCeti.excessAt_residualUpdate` and `TauCeti.excessAt_walkAssignment`. By 1.2 and 1.3 the
residual costs are conservative on the residual network of `f`, so every walk there weighs at
least as much as some path with its ends (SpanningTreesAndShortestPaths 3.1), and `P` is a
shortest walk from `s` to `t`. By SpanningTreesAndShortestPaths 3.3, `isGreatest_isPotential_sub`,
some potential `p` has `p t − p s = walkWeight P`; adding the potential inequalities along `P`
shows that each of them is an equality on the arrows of `P`. After the update, the residual
arrows of positive capacity are among those of `f` and the reverses of the arrows of `P` (a path
traverses at most one copy of each arrow); the reverse of an arrow of `P` has the opposite residual
cost, and the equality on `P` makes its reduced cost zero. So `p` is a potential for the new
assignment, which has least cost by 1.3.

**Checks.**
- Vertices `s`, `a`, `t`, arrows `s → t` of cost `3` and `s → a`, `a → t` of cost `1`, all with
  bounds `0` and `1`, and `b = 0`: the zero assignment has least cost. The least-cost residual path
  from `s` to `t` is `s → a → t`, of cost `2`, and augmenting by `1` gives an assignment of cost
  `2`, the least for one unit. The only residual path from `s` to `t` of positive capacity left is
the arrow `s → t`;
  augmenting along it gives cost `5`, the cost of the only assignment carrying two units.
- The shortest-path hypothesis is needed: augmenting the zero assignment by `1` along the arrow
  `s → t` gives cost `3 > 2`.
- The bound on `ε` is needed: augmenting along `s → a → t` by `2` exceeds the capacity `1`, and by
  `ε = −1` would push the value on `s → a` below its lower bound `0`.

*Needs:* 1.2, 1.3; SpanningTreesAndShortestPaths 3.1 (`IsShortest`, the splitting of a walk into
a path and closed walks) and 3.3 (`isGreatest_isPotential_sub`); Tau Ceti
`TauCeti.residualUpdate_walkAssignment_mem_Icc`, `TauCeti.excessAt_residualUpdate`,
`TauCeti.excessAt_walkAssignment`, `TauCeti.ArrowWalk.IsPath`.

### 1.6 Duality in potential form

Prove `isLeast_flowCost_isGreatest_dualValue`: if `ExcessFlow lo hi b` is nonempty, some `m : K`
is both the least cost of a feasible assignment with excess `b` and the greatest value of
`dualValue lo hi c b` over all `p : V → K`; and if the costs take values in an additive subgroup
`H`, some `p` with values in `H` has `dualValue lo hi c b p = m`. (Proved here.)

Route. *Weak duality:* by the last bullet of 1.1, `flowCost c g` minus `dualValue lo hi c b p` is
the sum over the arrows of `r * g e − min (r * lo e) (r * hi e)` with `r` the reduced cost, and
each term is nonnegative because `lo e ≤ g e ≤ hi e`. *Equality:* by 1.4 with `H = ⊤` there is a
least-cost `f`. By 1.2 and the splitting of closed walks in the route of 1.3, the residual costs,
which take values in `H`, are conservative on the residual network of `f`; applying
SpanningTreesAndShortestPaths 3.3, `exists_isPotential_iff`, with weights in the ordered group `H`
itself gives a potential `p` with values in `H`. By the
reading of 1.3 each term above vanishes for `g = f`: a positive reduced cost puts `f e` at `lo e`,
a negative one at `hi e`. So `dualValue lo hi c b p = flowCost c f`.

**Checks.**
- In the first Check of 1.2, with `t = p y − p x`, the dual value is
  `t + min 0 (1 − t) + min 0 (3 − t)`: it equals `1`, the least cost, exactly for `1 ≤ t ≤ 3`, the
  potentials of 1.3, and is smaller elsewhere.
- Nonemptiness is needed: one arrow `x → y` with bounds `0`, `2`, cost `3` and `b x = 0`,
  `b y = 1` has no feasible assignment, and `p x = p y = t` gives dual value `t`, unbounded.

*Needs:* 1.1, 1.2, 1.3, 1.4; SpanningTreesAndShortestPaths 3.3 (`exists_isPotential_iff`);
Mathlib `IsLeast`, `IsGreatest`, `AddSubgroup`.

### Examples

- The two-vertex networks of 1.1 and 1.2 and the three-vertex network of 1.5 are the examples of
  the Checks of every section of the layer; the numbers are worked out there.
- Over `K = ℤ` with `H = ⊤`, 1.4 and 1.6 are statements about integer flows and integer
  potentials; over `K = ℝ` with `H = AddSubgroup.zmultiples 1` they give integral optima of real
  problems with integer data.

### Dependencies

1.1 uses Tau Ceti and the copies from SpanningTreesAndShortestPaths. 1.2 uses 1.1. 1.3 uses 1.2 and
SpanningTreesAndShortestPaths 3.1 and 3.3. 1.4 uses only Tau Ceti and Mathlib. 1.5 uses 1.2, 1.3
and SpanningTreesAndShortestPaths 3.1 and 3.3. 1.6 uses 1.1–1.4 and SpanningTreesAndShortestPaths
3.3.

## Layer 2: transportation and weighted bipartite matching

### 2.1 Transportation

Define `IsTransportPlan a d X` for supplies `a : ι → K`, demands `d : κ → K` and a matrix `X`:
`X` is nonnegative with row sums `a` and column sums `d`; and `transportCost c X`, the sum of
`c i j * X i j`. Prove `isLeast_transportCost_isGreatest`: if some plan exists, some `m : K` is the
least cost of a plan and the greatest value of `∑ i, a i * u i + ∑ j, d j * p j` over the pairs
`(u, p)` with `u i + p j ≤ c i j` for all `i`, `j`; if `a` and `d` take values in an additive
subgroup `H₁`, a plan with entries in `H₁` has cost `m`; and if `c` takes values in an additive
subgroup `H₂`, a pair with values in `H₂` has value `m`. (Proved here; Schrijver, §4.6,
Application 4.3, p. 73, treats the minimum-cost transportation problem as a minimum-cost flow
problem.)

Route. Use the network on `ι ⊕ κ` with one arrow from `inl i` to `inr j` for every pair, bounds
`0` and `a i` (nonnegative, being a row sum of a plan), and excess `−a i` at `inl i` and `d j` at
`inr j`. Its feasible assignments are exactly the plans, with the same cost. By 1.4 with `H₁`, a
plan with entries in `H₁` has the least cost `m`. By 1.6 with `H₂`, some `p` with values in `H₂`
has dual value `m`. Put `u i = −p (inl i)` and `q j = p (inr j)`; then `m` is
`∑ i, a i * u i + ∑ j, d j * q j` plus the sum of `min 0 (a i * (c i j − u i − q j))`. Lowering
each `u i` to the least of `u i` and the values `c i j − q j` makes the pair feasible, keeps it in
`H₂`, and changes the value by `a i` times a nonpositive amount; since `a i ≥ 0`, that change is at
least the part of the sum of minima belonging to row `i`. So the new pair has value at least `m`.
Weak duality, `∑ a u + ∑ d q = ∑ X i j * (u i + q j) ≤ ∑ c X` for every plan and every feasible
pair, gives the rest.

**Checks.**
- `a = d = (1, 1)` and `c = [[1, 3], [2, 1]]`: the plans are `[[x, 1 − x], [1 − x, x]]` with
  `0 ≤ x ≤ 1`, of cost `5 − 3 x`, least `2` at the identity; the pair `u = (1, 1)`, `p = (0, 0)` is
  feasible with value `2`.
- One supply `a = (3)`, demands `d = (1, 2)`, `c = [[5, −1]]`: the only plan costs `3`, and for
  every `u` the pair with `p = (5 − u, −1 − u)` is feasible with value `3`.
- The dual variables are of free sign: for `a = d = (1)` and `c = [[−1]]` the least cost is `−1`,
  and no pair with `u, p ≥ 0` is feasible.
- Integral supplies and demands are needed for an integral plan: `a = (1)`, `d = (1/2, 1/2)` has
  only the plan `[[1/2, 1/2]]`. With integral data a fractional optimum may coexist with integral
  ones: `a = d = (1, 1)`, `c = 0`, every plan is optimal.

*Needs:* 1.4, 1.6; Tau Ceti `TauCeti.ExcessFlow`, `TauCeti.excessAt`; Mathlib `AddSubgroup`.

### 2.2 Egerváry's theorem

Define `matchingWeight w M`, the sum of `w i j` over the pairs with `M i = some j`, and
`IsWeightCover w u p`: `u` and `p` are nonnegative and `w i j ≤ u i + p j` for all `i`, `j`. Prove
`egervary`: for every `w : ι → κ → K` some `m : K` is the greatest weight of a matching and the
least total `∑ i, u i + ∑ j, p j` of a weighted cover; and if `w` takes values in an additive
subgroup `H`, a cover with values in `H` has total `m` (Egerváry; Schrijver, Corollary 3.7b,
p. 52, for real weights, and Theorem 3.8, p. 53, for integer weights and an integer cover, both on
a bipartite graph; the statement here allows coefficients in any linearly ordered commutative ring
and any additive subgroup `H` in place of the integers). Weights of any sign are allowed,
matchings may leave elements of either side unmatched, and the sides may differ in size. A
bipartite graph with edge weights is the case where a pair that is not an edge gets weight `0`:
such pairs neither increase the weight of a matching nor constrain a nonnegative cover.

Route. Use the network on `Option (ι ⊕ κ)` with a hub `none`, an arrow `none → inl i` and an arrow
`inr j → none` of cost `0`, and an arrow `inl i → inr j` of cost `−w i j`, all with bounds `0` and
`1`, and `b = 0`. An assignment with values in `AddSubgroup.zmultiples 1` takes values `0` and `1`;
conservation at `inl i` and at `inr j` says that each element carries at most one unit, so these
circulations are exactly the matchings, of cost `−matchingWeight w M`. By 1.4 with
`H = AddSubgroup.zmultiples 1` some least-cost circulation is of this form, so its matching has
the greatest weight `m`, and the least cost is `−m`. By 1.6 with `H` some `p` with values in `H`
has dual value `−m`. With `h = p none`, put
`u i = max 0 (p (inl i) − h) + ∑ j, max 0 (w i j − p (inl i) + p (inr j))` and
`q j = max 0 (h − p (inr j))`. They are nonnegative, lie in `H`, satisfy
`u i + q j ≥ (p (inl i) − h) + (h − p (inr j)) + (w i j − p (inl i) + p (inr j)) = w i j`, and
their total is minus the dual value, that is `m`. Weak duality: a matching of weight `m'` and a
cover satisfy `m' ≤ ∑ (u i + p j)` over the matched pairs, which is at most the total because the
cover is nonnegative and a matching uses each element once.

**Checks.**
- `w = [[2, 3], [3, 1]]`: the matching of the two off-diagonal pairs has weight `6`, the greatest;
  the covers `u = (3, 3)`, `p = (0, 0)` and `u = (2, 2)`, `p = (1, 1)` have total `6`.
- `w = [[−1]]`: the greatest weight is `0`, attained by the empty matching, and `u = p = 0` is a
  cover. With perfect matchings only the value would be `−1`, and without the sign condition on
  covers `u = −1`, `p = 0` would have total `−1`; so partial matchings and nonnegative covers
  belong together.
- One element against two, `w = [[4, 3]]`: greatest weight `4`; `u = 4`, `p = (0, 0)` and
  `u = 3`, `p = (1, 0)` are covers of total `4`.
- Bipartiteness is built into the matrix form, and it is needed for a min–max relation of this
  kind: on the triangle with weight `1` on each edge a matching has one edge, while the least real
  cover has total `3/2` (all values `1/2`) and the least integer cover total `2` (Schrijver,
  remark after Corollary 3.7a, p. 52, for the matching polytope).
- With weights in `{0, 1}` and `H = AddSubgroup.zmultiples 1` a least cover may be taken with
  values in `{0, 1}`, and the statement becomes Kőnig's theorem that a largest matching of a
  bipartite graph is as large as a smallest vertex cover.

*Needs:* 1.4, 1.6; Mathlib `PEquiv`, `Option.toFinset`, `AddSubgroup.zmultiples`; Tau Ceti
`TauCeti.ExcessFlow`, `TauCeti.excessAt`.

### Examples

- The assignment problem is 2.1 with `ι = κ` and `a = d = 1`: by integrality some optimal plan is a
  permutation matrix, and the optimal dual pair can be taken integral for integer costs.
- Egerváry's theorem on the complete bipartite graph with three vertices on each side and weight
  `1` on each pair: both sides equal `3`, attained by a perfect matching and by `u = 1`, `p = 0`.

### Dependencies

2.1 uses 1.4 and 1.6. 2.2 uses 1.4 and 1.6. Neither uses the other.

## Scope and ownership

This roadmap owns the cost of a flow and its residual and dual counterparts, the negative-cycle and
reduced-cost optimality criteria for flows with prescribed excess, existence and integrality of
least-cost flows, the shortest-path augmentation theorem, duality in potential form, transportation
integrality and duality over ordered rings, and Egerváry's theorem stated above.

Already in the libraries, and consumed rather than restated:

- Tau Ceti's network library, the implementation of GraphConnectivityAndFlows: assignments,
  excess, bounded assignments of prescribed excess (`TauCeti.ExcessFlow`), residual arrows,
  capacities, updates and differences, walks, paths and cycles, walk assignments, and the
  path–cycle decomposition. Whether a feasible assignment exists at all is Hoffman's theorem,
  Tau Ceti's `TauCeti.ExcessFlow.nonempty_iff` (GraphConnectivityAndFlows Target 8.2, §8.2 in its
  sectioned numbering); the theorems above take feasibility as a hypothesis and do not restate it.
- Tau Ceti's `TauCeti.exists_cost_eq_finiteDualValue` and its common-value form
  `TauCeti.exists_isLeast_cost_isGreatest_finiteDualValue`: duality with both attainments for real
  costs and transport between two probability vectors, which OptimalTransport Layer 2 names for its
  finite linear-programming duality (2.3). For `K = ℝ` and supplies of positive total, the
  equality of the two values in 2.1, with both attainments, is that theorem after dividing the
  masses by their total, and for total `0` it is trivial; 2.1 adds coefficients in ordered rings
  and the two integrality conclusions, which that theorem does not give even for `K = ℝ`.
- Mathlib's Birkhoff theorem (`doublyStochastic_eq_convexHull_permMatrix`,
  `exists_eq_sum_perm_of_mem_doublyStochastic`): over a linearly ordered field it gives directly
  that a linear cost on doubly stochastic matrices attains its least value at a permutation matrix,
  the case over such a field of the first half of the first Example of Layer 2.
- Mathlib defines totally unimodular matrices (`Matrix.IsTotallyUnimodular`); integrality is
  proved here through flows, and total unimodularity is not used.

Left to other roadmaps:

- GraphConnectivityAndFlows owns flows, residual networks, decomposition,
  max-flow/min-cut with integrality, shortest augmentation for maximum flows, and Hoffman's
  theorem, and lists minimum-cost flows and circulations as outside its scope. Its Target 1.3
  (residual updates), Target 3.1 (decomposition) and Target 8.4 (residual adjustments), §1.3, §3.1
  and §8.4 in its sectioned numbering, are consumed through their Tau Ceti implementations. Its
  Target 6.7, the multiset capacitated Kőnig theorem, owns Kőnig's theorem; the last Check of 2.2
  only notes the specialization.
- SpanningTreesAndShortestPaths owns walk weights, conservative weights, shortest walks and
  potentials (its 3.1–3.3). `walkWeight` and `IsPotential` are copied verbatim from its 3.1 and
  3.3, and its `exists_isPotential_iff` and `isGreatest_isPotential_sub` are consumed by 1.3, 1.5
  and 1.6; this roadmap depends on that one.
- ConvexAnalysisAndDuality §5.3 states linear-programming duality with complementary slackness for
  real programs `min c ⬝ᵥ x` over `A x = b`, `x ≥ 0`. The duality of 1.6, 2.1 and 2.2 is proved here
  combinatorially from 1.2–1.4, over ordered rings and with integrality, and this roadmap does not
  depend on that one.
- MatchingTheory lists weighted matchings and the matching polytope as outside its scope, and
  MatroidOptimization lists weighted matroid intersection as outside its scope.
- ApproximationGuarantees 2.2 treats the fractional vertex covers of an arbitrary graph (values at
  least `1` in sum on every edge), weighted at the vertices, and their half-integrality. For weights
  `w` in `{0, 1}` the covers of 2.2 here are the fractional vertex covers of the bipartite graph of
  the pairs of weight `1`, counted with unit vertex weights, and 2.2 gives one of least total with
  integer values; that roadmap does not state this integrality, this one does not state
  half-integrality for arbitrary graphs, and neither route uses the other.

Not treated here: cores, prices and payoffs of assignment games, and the lattice structure of the
optimal covers.

Outside the scope: every procedure (the network simplex method, cycle cancelling and its
termination, the Hungarian method, successive shortest paths as a method), running times,
strongly polynomial bounds, convex and other nonlinear costs, multicommodity flows, infinite
capacities, weighted matching in graphs that are not bipartite and the matching polytope, and
totally unimodular matrices in general.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Algebra/Order/Ring/Defs.lean`: `IsStrictOrderedRing` (with `[CommRing K]`
  `[LinearOrder K]`, multiplication by a positive element is strictly monotone).
- `Mathlib/Combinatorics/Quiver/Path/Weight.lean`: `Quiver.Path.addWeight` (the sum of an
  additive weight along a quiver path), which the copied `walkWeight` abbreviates.
- `Mathlib/Basic/PEquiv.lean`: `PEquiv`, written `ι ≃. κ` (a partial bijection: `M i = some j`
  exactly when `M.symm j = some i`). `Mathlib/Data/Finset/Option.lean`: `Option.toFinset`.
- `Mathlib/Algebra/Group/Subgroup/ZPowers/Basic.lean`: `AddSubgroup.zmultiples` (the additive
  subgroup of integer multiples). `Mathlib/Order/Bounds/Defs.lean`: `IsLeast`, `IsGreatest`.
- Named in the scope section, not used by a route: `Mathlib/Analysis/Convex/Birkhoff.lean`,
  `doublyStochastic_eq_convexHull_permMatrix`, `exists_eq_sum_perm_of_mem_doublyStochastic`;
  `Mathlib/LinearAlgebra/Matrix/Determinant/TotallyUnimodular.lean`,
  `Matrix.IsTotallyUnimodular`.

### From Tau Ceti

All in `TauCeti/Combinatorics/Network/`, for a finite vertex type and finite arrow types.

- `Basic.lean`: `TauCeti.Assignment Q K` (a value for every arrow, endpoints strict-implicit).
- `Excess.lean`: `TauCeti.excessAt` (incoming minus outgoing), `TauCeti.IsCirculation`.
- `Shift.lean`: `TauCeti.ExcessFlow lo hi b`, the subtype of assignments `f` with
  `f ∈ Set.Icc lo hi` and `excessAt f = b`.
- `Residual.lean`: `TauCeti.ResidualHom`, `TauCeti.residualCapacity`, `TauCeti.residualUpdate`
  (`f e + r (Sum.inl e) − r (Sum.inr e)`), `TauCeti.residualDifference`;
  `TauCeti.excessAt_residualUpdate` (excess adds under an update, with no hypothesis on `r`);
  `TauCeti.residualDifference_mem_Icc` (for feasible `f`, `g` the difference lies between `0` and
  the residual capacities of `f`); `TauCeti.residualUpdate_residualDifference` (it updates `f` to
  `g`); `TauCeti.isCirculation_residualDifference` (it is a circulation when `f` and `g` have the
  same excess).
- `Walk.lean`: `TauCeti.ArrowWalk`, `TauCeti.ArrowWalk.arrows`, `TauCeti.ArrowWalk.IsPath`,
  `TauCeti.ArrowWalk.IsCycle`, `TauCeti.PositiveHom` (the arrows of positive capacity, as a
  subtype).
- `Augmentation.lean`: `TauCeti.walkAssignment` (an arrow traversed `n` times carries `n • q`);
  `TauCeti.excessAt_walkAssignment` (for `[DecidableEq V]`, excess `q` at the end minus `q` at the
  start); `TauCeti.residualUpdate_walkAssignment_mem_Icc` (for feasible `f`, a walk repeating no
  arrow and `0 ≤ q` at most every residual capacity on it, the update is feasible).
- `Decomposition.lean`: `TauCeti.exists_pathCycleDecomposition` (a nonnegative assignment is a sum
  of positively weighted paths and cycles, each bounded by it, with weights in a given additive
  subgroup containing its values); `TauCeti.PathCycleDecomposition.paths_eq_nil` (a circulation
  has no path components).
- Named in the scope section, not used by a route: `Hoffman.lean`,
  `TauCeti.ExcessFlow.nonempty_iff`; `TauCeti/MeasureTheory/OptimalTransport/Finite/Duality.lean`,
  `TauCeti.exists_cost_eq_finiteDualValue`.

### From TauCetiRoadmap.GraphConnectivityAndFlows

- The conventions for networks, excess and residual networks, and Targets 1.3, 3.1 and 8.4 (§1.3,
  §3.1, §8.4 in the sectioned numbering), as implemented by the Tau Ceti declarations above. No
  statement of that roadmap is restated.

### From TauCetiRoadmap.SpanningTreesAndShortestPaths

- 3.1: `walkWeight` (copied verbatim), `IsConservative`, `IsShortest`, and the bullet that a walk
  is a path with closed walks inserted, so that under nonnegative closed walks some path weighs at
  most as much as a given walk.
- 3.3: `IsPotential` (copied verbatim); `exists_isPotential_iff` (on a finite arrow family with
  weights in a linearly ordered cancellative commutative monoid, a potential exists if and only if
  the weight is conservative), used with the arrow family `TauCeti.PositiveHom` of a residual
  network and with weights in `K` or in an additive subgroup `H`; `isGreatest_isPotential_sub`
  (for a conservative weight in a linearly ordered commutative group and a shortest walk `p` from
  `s` to `t`, some potential has `y t − y s = walkWeight w p`).

## References

- Alexander Schrijver, *A Course in Combinatorial Optimization*, lecture notes, version of
  March 23, 2017, on the author's page (`homepages.cwi.nl/~lex/files/dict.pdf`): §3.5, p. 47 (the
  Hungarian method, attributed there to Kuhn and to Egerváry); Corollary 3.7a and the remark on
  the triangle, pp. 51–52; Corollary 3.7b, p. 52; Theorem 3.8, p. 53; §4.6, pp. 70–73, with the
  definition of extreme flows, Proposition 4 (pp. 71–72), Proposition 5 (pp. 72–73) and
  Application 4.3 (p. 73).
- Egerváry's theorem (1931) is attributed as in Schrijver's notes; the original paper was not
  consulted.

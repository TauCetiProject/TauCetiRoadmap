# Roadmap: Peano continua and the Hahn–Mazurkiewicz theorem

**Summary.** A Peano continuum is a nonempty compact, connected, locally connected, metrizable
space. This roadmap characterises the Peano continua as exactly the Hausdorff continuous images of
the closed unit interval, and proves the facts about local connectedness and paths that the
characterisation runs on.

The headline theorems are these.

- *Hahn–Mazurkiewicz.* A Hausdorff space is a continuous image of `[0, 1]` if and only if it is
  compact, connected, locally connected and metrizable. Connectedness includes nonemptiness here.
  None of the four conditions and not the Hausdorff property can be dropped.
- *Extension.* If a metric space is path connected and uniformly locally path connected (nearby
  points are joined by small paths, at a rate independent of the points), every continuous map
  into it from a closed subset of `[0, 1]` extends to the whole interval.
- *Small paths.* In a compact, locally connected metric space, for every `ε > 0` there is `δ > 0`
  such that any two points at distance less than `δ` are joined by a path of diameter at most `ε`.
- *Metrizability and property S.* A Hausdorff continuous image of a compact metrizable space is
  metrizable. A compact metric space is locally connected if and only if, for every `ε > 0`, it
  is a finite union of connected sets of diameter at most `ε`.
- *Injectivity.* No continuous map of `[0, 1]` onto the square `[0, 1] × [0, 1]` is injective.

The roadmap builds on Mathlib's Hausdorff–Alexandroff theorem (every nonempty compact metric space
is a continuous image of Cantor space), its middle-thirds Cantor set, Urysohn's metrization
theorem and its theory of connected, locally connected and path connected spaces. From Tau Ceti it
uses the local connectedness of Hausdorff continuous images of compact locally connected spaces.

Layer 1 proves the metrizability of images, the property S characterisation and that the closed
topologist's sine curve is not locally connected. Layer 2 builds small paths in compact locally
connected metric spaces. Layer 3 extends maps from closed subsets of the interval and proves the
Hahn–Mazurkiewicz theorem. Layer 4 shows that a curve onto the square cannot be injective.

## Conventions

- `I` is Mathlib's `unitInterval`, the closed interval `[0, 1]` with the subspace topology of `ℝ`.
  Products such as `I × I` and `ℝ × ℝ` carry the product topology and the sup metric.
- Connected is Mathlib's `ConnectedSpace` or `IsConnected`; both include nonemptiness.
  `IsPreconnected` allows the empty set. Locally connected is `LocallyConnectedSpace`; locally path
  connected is `LocallyPathConnectedSpace`; metrizable is `TopologicalSpace.MetrizableSpace`.
- A Peano continuum is a space that is compact, connected, locally connected and metrizable; the
  roadmap writes the four conditions out and gives the notion no Lean name. For a compact
  Hausdorff space, metrizable is equivalent to second countable, by Urysohn's metrization theorem
  in one direction and the second countability of compact metrizable spaces in the other.
- Smallness is stated pairwise: a set is `ε`-small when any two of its points lie within `ε` of
  each other. This is the convention of Tau Ceti's uniform local connectedness, and it avoids
  the value `0` that `Metric.diam` takes on unbounded sets.
- `HasPropertyS X` (1.2): for every `ε > 0`, `X` is the union of a finite family of `ε`-small
  preconnected sets.
- `IsUniformlyLocallyPathConnected X` (2.1): for every `ε > 0` there is `δ > 0` such that any
  two points at distance less than `δ` are joined by a path whose range is `ε`-small. Since the
  range of a path is connected, this implies Tau Ceti's `TauCeti.IsUniformlyLocallyConnected`
  for the whole space, where the joining sets are only required to be connected.
- `closedSineCurve` (1.3) is the union of the graph `{(x, sin (1/x)) : 0 < x ≤ 1}` and the
  segment `{0} × [-1, 1]` in `ℝ × ℝ`.
- Cantor space is `ℕ → Bool`; the middle-thirds set is Mathlib's `cantorSet ⊆ ℝ`, homeomorphic to
  Cantor space.

## Layer 1: images, property S and the closed sine curve

### 1.1 Metrizability of Hausdorff images

Prove `metrizableSpace_of_continuous_surjective`: let `X` be compact and metrizable, `Y`
Hausdorff, and `f : X → Y` continuous and surjective. Then `Y` is metrizable.

*Needs:* the second countability of compact metrizable spaces, `Continuous.isClosedMap`,
`Function.Surjective.compactSpace`, `metrizableSpace_of_t3_secondCountable` (Mathlib).

Route (Calegari, Proposition 2.5). `X` is second countable; fix a countable basis and let `𝒰` be
the countable family of finite unions of its members. For `U ∈ 𝒰` put
`V(U) = Y \ f '' (X \ U)`. Since `f` is a closed map (compact source, Hausdorff target),
`V(U)` is open. Given `y ∈ V` with `V` open, the fibre `f ⁻¹' {y}` is compact and lies in the open
set `f ⁻¹' V`, so finitely many basic sets cover it inside `f ⁻¹' V`; their union `U ∈ 𝒰`
satisfies `f ⁻¹' {y} ⊆ U ⊆ f ⁻¹' V`. Then `y ∈ V(U)`, and `V(U) ⊆ V` because a point of `Y`
outside `V` has its whole fibre outside `U`. So the `V(U)` form a countable basis of `Y`. A
compact Hausdorff space is regular, and a regular second countable T0 space is metrizable.

Checks (each hypothesis is needed):
- Hausdorff. Let `Y` be Sierpiński space (`Prop` with the open sets `∅`, `{True}` and everything)
  and `f t = (1/2 < t)` on `I`. The preimage of `{True}` is `(1/2, 1]`, open in `I`, so `f` is
  continuous, and it is onto. `Y` is not T1, so not metrizable.
- Compactness. Let `Y = ℝ → I` (product topology, Hausdorff) and `X` the same set with the
  discrete topology, which is metrizable by the discrete metric; the identity is continuous and
  onto. `Y` is not metrizable: a compact metrizable space is second countable, and a T0 space
  with a countable basis `(Bₙ)` injects into the subsets of `ℕ` by `y ↦ {n : y ∈ Bₙ}`, so it has
  at most `2 ^ ℵ₀` points; `ℝ → I` has `(2 ^ ℵ₀) ^ (2 ^ ℵ₀) = 2 ^ (2 ^ ℵ₀)` points, more than
  `2 ^ ℵ₀` by Cantor's theorem. (`ℝ → I` is compact by Tychonoff's theorem.)
- Metrizability of the source. The identity of `ℝ → I`.

### 1.2 Property S

Prove `locallyConnectedSpace_iff_hasPropertyS`: a compact pseudometric space is locally connected
if and only if it has property S.

*Needs:* `IsOpen.connectedComponentIn`, `IsCompact.elim_finite_subcover`,
`locallyConnectedSpace_iff_connected_subsets`, `IsPreconnected.closure`,
`isPreconnected_sUnion` (Mathlib).

(Proved here.) Forward. Given `ε > 0`, each `x` lies in `C_x`, the connected component of `x` in
the open ball of radius `ε / 2` about `x`; it is open because the space is locally connected,
preconnected, and `ε`-small. Finitely many `C_x` cover the compact space.

Backward; this half uses no compactness. Let `U` be a neighbourhood of `x`, containing the ball of
radius `r > 0` about `x`. Take a finite cover `𝒜` by `(r / 2)`-small preconnected sets. Let `V` be
the union of the closures of the members `A ∈ 𝒜` with `x ∈ closure A`. Each such closure is
preconnected and contains `x`, so `V` is preconnected. A point `y` of such a closure satisfies
`dist x y ≤ r / 2 < r`, since the pairwise bound passes to closures; so `V ⊆ U`. Every point
outside `V` lies in some `A ∈ 𝒜` with `x ∉ closure A`, so the complement of `V` lies in the finite
union `F` of those closures, a closed set missing `x`; hence `V` contains the open neighbourhood
`Fᶜ` of `x`. Every point therefore has arbitrarily small preconnected neighbourhoods, which is
local connectedness by `locallyConnectedSpace_iff_connected_subsets`.

Checks:
- Compactness is needed for the forward implication: `ℝ` is locally connected, and finitely many
  `1`-small sets cover a bounded set only.
- The Cantor set is compact and not locally connected (its components are points, and it is not
  discrete); it fails property S, since finitely many preconnected subsets of it are finitely many
  points.
- Property S compares with Tau Ceti's uniform local connectedness: on a compact set both are
  equivalent to local connectedness, by this target and `IsCompact.isUniformlyLocallyConnected_iff`.
  The forward half of this target also follows from Tau Ceti: with `δ` from
  `IsCompact.isUniformlyLocallyConnected` for `ε`, cover the space by finitely many balls of radius
  `δ / 3` and enclose each in a connected `ε`-small set by
  `TauCeti.IsUniformlyLocallyConnected.exists_isConnected_superset`.

### 1.3 The closed topologist's sine curve

Prove `isCompact_isConnected_not_locallyConnectedSpace_closedSineCurve`: `closedSineCurve` is
compact and connected, and it is not locally connected.

*Needs:* `Metric.isCompact_of_isClosed_isBounded`, `isConnected_Ioc`,
`IsConnected.subset_closure`, `locallyConnectedSpace_iff_connectedComponentIn_open` (Mathlib).

(Proved here.) Write `G` for the graph part and `T = closedSineCurve`.
- Compact. `T ⊆ [0, 1] × [-1, 1]` is bounded. It is closed: let `(xₙ, sin (1/xₙ))` in `G`
  converge to `(x, y)`. If `x > 0` then `(x, y) = (x, sin (1/x)) ∈ G` by continuity; if `x = 0`
  then `y ∈ [-1, 1]`, a point of the segment. The segment is closed.
- Connected. `G` is the continuous image of the connected interval `(0, 1]`. For `y ∈ [-1, 1]`
  the points `xₖ = 1 / (arcsin y + 2π(k + 1))` lie in `(0, 1]`, satisfy `sin (1/xₖ) = y` and tend
  to `0`, so the segment lies in the closure of `G`, and `G ⊆ T ⊆ closure G` is connected.
- Not locally connected. Let `B` be the open ball of radius `1/2` about `(0, 0)` and `C` the
  connected component of `(0, 0)` in `T ∩ B`. If `C` contained a point `(x, sin (1/x))` with
  `x > 0`, its first projection would be an interval containing `[0, x]`, hence the point
  `t = 1 / (π/2 + 2πk)` for `k` large, and the only point of `T` above `t` is `(t, 1)`, at
  distance `1` from the origin, outside `B`. So `C` lies in the segment. But the points
  `(1/(kπ), 0)` of `G` tend to `(0, 0)`, so `C` is not a neighbourhood of `(0, 0)` in `T`, and
  `locallyConnectedSpace_iff_connectedComponentIn_open` fails for the open set `T ∩ B`.

Check: Mathlib's `Counterexamples/TopologistsSineCurve.lean` (not importable) proves that the
closure of the graph over all `x > 0`, which is closed but unbounded, is connected and not path
connected; the curve here is the compact one, which the Hahn–Mazurkiewicz theorem concerns.

### Examples

- Every nonempty compact convex subset of a normed space, for instance `I` and `I × I`, is
  compact, connected, locally connected and metrizable. So is the Hilbert cube `ℕ → I`: compact
  by Tychonoff's theorem, metrizable as a countable product, locally connected by Mathlib's
  `Pi.locallyConnectedSpace`.
- `ℝ → I` is compact, connected, Hausdorff and locally connected by `Pi.locallyConnectedSpace`
  (every factor is connected), and it is not metrizable (1.1, second Check).

### Dependencies

Layer 1 uses Mathlib only. 1.2 and 1.3 do not use 1.1.

## Layer 2: uniform local path connectedness

### 2.1 Small paths in compact locally connected spaces

Prove `isUniformlyLocallyPathConnected_of_compactSpace`: a compact, locally connected metric
space is uniformly locally path connected.

*Needs:* `IsOpen.connectedComponentIn`, `lebesgue_number_lemma_of_metric`,
`uniformContinuous_uniformly_extend`, `IsPathConnected.joinedIn` (Mathlib).

The statement and the use of a Lebesgue number follow Calegari, Propositions 3.6 and 3.8; the
organisation of the path construction is our own, and connectedness of the space is not assumed.

Step 1 (chains). If `W` is connected and `𝒱` is a cover of `W` by sets open in `W`, any two points
`a, b ∈ W` are joined by a chain `V₁, …, Vₘ` in `𝒱` with `a ∈ V₁`, `b ∈ Vₘ` and
`Vᵢ ∩ Vᵢ₊₁` nonempty: the points reachable from `a` by a chain form an open and closed nonempty
subset of `W`.

Step 2 (small open connected sets). In a locally connected space, if `W` is open, `x ∈ W` and
`ρ > 0`, the connected component of `x` in `W ∩ ball x ρ` is open, connected, contained in `W`
and `2ρ`-small.

Step 3 (open connected sets are path connected). Let `U` be open and connected and `a, b ∈ U`.
We build, for `n ≥ 1`, finite partitions `0 = s₀ < s₁ < … < s_N = 1` of `[0, 1]` (depending on
`n`), values `yⱼ ∈ U` at the partition points, and open connected sets `Wⱼ`, with:
(a) `yⱼ, yⱼ₊₁ ∈ Wⱼ`; (b) `Wⱼ` is `2⁻ⁿ`-small; (c) every interval has length at most `2⁻ⁿ`;
(d) the partition at stage `n + 1` refines that of stage `n`, keeps its values, and every set of
stage `n + 1` over `[sⱼ, sⱼ₊₁]` lies in `Wⱼ`; (e) at stage `1`, `closure Wⱼ ⊆ U`.
Stage 1: cover `U` by the sets of Step 2 with `ρ ≤ 1/4` and `closedBall x (2ρ) ⊆ U`, so that
their closures lie in `U`; Step 1 gives a chain from `a` to `b`; place `y₀ = a`, a point of each
`Vᵢ ∩ Vᵢ₊₁`, and `b` at equally spaced points, then halve every interval, giving each midpoint
the value at the left end. Stage `n + 1`: inside each `Wⱼ`, cover by the sets of Step 2 that are
`2⁻ⁿ⁻¹`-small, join `yⱼ` to `yⱼ₊₁` by a chain in `Wⱼ`, subdivide `[sⱼ, sⱼ₊₁]` in the same way
and halve. Halving at each stage gives (c).
Let `D` be the set of all partition points; it is dense by (c). Define `g` on `D` by the values.
By (d) and (a), `g` maps `D ∩ [sⱼ, sⱼ₊₁]` into `Wⱼ` for every stage-`n` interval. If `λₙ > 0` is
the shortest interval of stage `n`, two points of `D` closer than `λₙ` lie in one interval or two
adjacent ones, so their values are within `2 · 2⁻ⁿ` by (b) and (a). Hence `g` is uniformly
continuous on `D`; the space is compact, hence complete, so `g` extends to a continuous
`γ : [0, 1] → X` with `γ 0 = a` and `γ 1 = b`. Each `γ t` lies in the closure of a stage-1 set,
hence in `U` by (e). So `U` is path connected.

Step 4 (uniformity). Given `ε > 0`, the sets `Cₓ`, the connected components of `x` in the balls
of radius `ε / 2`, are open, connected and `ε`-small, so path connected by Step 3. A Lebesgue
number `δ` of this cover puts any two points at distance less than `δ` into one `Cₓ`, and a path
in `Cₓ` joining them has `ε`-small range.

Checks (each hypothesis is needed):
- Compactness. The graph `G = {(x, sin (1/x)) : 0 < x ≤ 1}` is homeomorphic to `(0, 1]` by the
  first projection, so locally connected. The points `p = (1/(kπ), 0)` and `q = (1/((k+1)π), 0)`
  are at distance `1/(kπ(k+1))`, which tends to `0`. The range of a path from `p` to `q` in `G`
  is connected, so its first projection contains `t = 1/(kπ + π/2)`, and it contains
  `(t, sin (kπ + π/2)) = (t, ±1)`, at distance `1` from `p`. So no `δ` serves `ε = 1/2`.
- Local connectedness. In `closedSineCurve`, `(0, 0)` and `(1/(kπ), 0)` are at distance
  `1/(kπ)`; a connected set containing both contains a point `(t, 1)` with `0 < t < 1/(kπ)`, by
  the argument of 1.3, so again no `δ` serves `ε = 1/2`.
- Connectedness is not assumed: in a compact locally connected space the finitely many components
  are open and at positive distance from one another, and `δ` below that distance keeps both
  points in one component.

### Examples

- A uniformly locally path connected pseudometric space is locally path connected. Let `U` be open
  and `x ∈ U`, with the ball of radius `r > 0` about `x` inside `U`, and take `δ` for `ε = r / 2`.
  A point `y` with `dist x y < δ` is joined to `x` by a path whose range is `(r / 2)`-small, so
  lies in the ball of radius `r` about `x`, hence in `U`. Thus the ball of radius `δ` about `x`
  lies in the path component of `x` in `U`, and `locallyPathConnectedSpace_iff_pathComponentIn_mem_nhds`
  applies. With 2.1, a compact locally connected metric space is locally path connected, and a
  Peano continuum is path connected by `pathConnectedSpace_iff_connectedSpace`.
- Conversely a uniformly locally path connected pseudometric space is locally connected, since
  a locally path connected space is; so a compact metric space is locally connected if and only if
  it is uniformly locally path connected.
- Every compact convex set in a normed space is uniformly locally path connected with `δ = ε`,
  segments serving as paths.

### Dependencies

2.1 uses Mathlib only.

## Layer 3: the Hahn–Mazurkiewicz theorem

### 3.1 Extension from closed subsets of the interval

Prove `exists_extend_of_isClosed`: let `X` be a path connected, uniformly locally path connected
pseudometric space, `K ⊆ I` closed and `f : K → X` continuous. Then some continuous
`F : I → X` agrees with `f` on `K`.

*Needs:* no named declaration beyond the definitions; compactness of `K` is used.

The gap-filling step is the one in the proof of Calegari, Theorem 3.2, there for the Cantor set;
the continuity argument is our own and needs no finiteness count of large gaps.

(Proved here.) If `K` is empty, `F` is constant (`X` is nonempty). Otherwise let `m = min K` and
`M = max K`; on `[0, m]` and `[M, 1]` let `F` be `f m` and `f M`. The rest of `[m, M] \ K` is a
disjoint union of open intervals `(u, v)` with `u, v ∈ K`, the gaps. Fix `εₙ = 2⁻ⁿ` and a
decreasing sequence `δₙ ≤ 2⁻ⁿ` serving `εₙ`. On a gap with `dist (f u) (f v) = 0`, let `F` be
`f u` on `[u, v)` and `f v` at `v`; this is continuous, because points at distance `0` have the
same neighbourhoods, and its range has diameter `0`. On a gap with `δₙ₊₁ ≤ dist (f u) (f v) < δₙ` (`n ≥ 1`), let `F` be an `εₙ`-small path from `f u` to
`f v`, reparametrised linearly; on a gap with `dist (f u) (f v) ≥ δ₁`, any path. So a gap whose ends
have values closer than `δₙ` carries an `εₙ`-small path.
`F` is continuous off `K` and on `[0, m]`, `[M, 1]`. Let `p ∈ K`; consider the right side (the
left is symmetric). If `p = M`, or `p` is the left end of a gap, `F` is constant or a path starting
at `f p` just right of `p`. Otherwise points of `K` accumulate at `p` from the right. Given `n`,
choose `η > 0` with `dist (f k) (f p) < δₙ / 2` for `k ∈ K ∩ [p, p + η)`, and `k₀ ∈ K` in
`(p, p + η)`. For `t ∈ (p, k₀)`: if `t ∈ K` then `dist (F t) (f p) < δₙ / 2`; if `t` lies in a
gap `(u, v)` then `p < u < v ≤ k₀`, so `dist (f u) (f v) < δₙ` and
`dist (F t) (f p) ≤ εₙ + δₙ / 2`. Both tend to `0`.

Checks (each hypothesis is needed):
- Path connectedness. The two-point space with distance `1` is uniformly locally path connected
  (for `δ < 1` only equal points are close); `K = {0, 1}` with `f 0 ≠ f 1` admits no extension,
  since `I` is connected.
- Uniform local path connectedness. The comb space `C`, the union of `[0, 1] × {0}`, `{0} × [0, 1]`
  and the segments `{1/n} × [0, 1]` (`n ≥ 1`), is path connected. Let `K = {0} ∪ {1/n : n ≥ 1}`,
  `f 0 = (0, 1)` and `f (1/n) = (1/n, 1)`, continuous on `K`. Each segment `{1/n} × (0, 1]` is
  open and closed in the part of `C` above the axis, so an extension must reach height `0` at
  some `sₙ ∈ [1/(n+1), 1/n]`. Then `sₙ → 0` while `F sₙ` stays at height `0`, against
  `F 0 = (0, 1)`.

### 3.2 The Hahn–Mazurkiewicz theorem

Prove `exists_continuous_surjective_unitInterval_iff`: for a Hausdorff space `X`, some continuous
map `I → X` is onto if and only if `X` is compact, connected, locally connected and metrizable.

*Needs:* 1.1, 2.1, 3.1; `Function.Surjective.compactSpace`,
`locallyPathConnectedSpace_iff_pathComponentIn_mem_nhds`,
`Function.Surjective.connectedSpace`, `pathConnectedSpace_iff_connectedSpace`,
`exists_nat_bool_continuous_surjective_of_compact`, `cantorSetHomeomorphNatToBool`,
`isClosed_cantorSet`, `cantorSet_subset_unitInterval`, `metrizableSpaceMetric`,
`Convex.locallyPathConnectedSpace` (Mathlib);
`TauCeti.locallyConnectedSpace_of_continuous_surjective` (Tau Ceti).

Source: Calegari, Theorem 3.2, with the same hypotheses (Hausdorff; compact, metrizable,
nonempty, connected, locally connected).

Route. Forward: `X` is compact and connected as a continuous image of `I`, locally connected by
`TauCeti.locallyConnectedSpace_of_continuous_surjective` (`I` is locally connected, being convex
and hence locally path connected by `Convex.locallyPathConnectedSpace`; Mathlib has no instance
for it), and metrizable by 1.1. Backward: give
`X` a compatible metric. By 2.1 it is uniformly locally path connected, so locally path connected
(the ball of radius `δ` for `ε = r / 2` about `x` lies in the path component of `x` in any open
set containing the ball of radius `r`, as in the Examples of Layer 2), and path connected because
it is connected. The Hausdorff–Alexandroff theorem gives a
continuous surjection `ℕ → Bool → X`; composed with the homeomorphism from the middle-thirds set
`K ⊆ I` (closed) it is a continuous surjection `K → X`, and 3.1 extends it to `I`. The extension
is onto because its restriction to `K` is.

Checks. The degenerate cases agree on both sides: the empty space (no map from the nonempty `I`;
not connected), a point, `I` (the identity), the circle (the quotient map from `I`), `I × I`
(Mathlib's `Counterexamples/PeanoCurve.lean`, not importable, gives a continuous surjection),
the Cantor set and the closed sine curve (not locally connected; neither is an image of `I`, the
first being disconnected and the second not locally connected by 1.3). Each hypothesis is needed:
- Hausdorff: Sierpiński space is the image of `I` under `t ↦ (1/2 < t)` (1.1, first Check) and is
  not metrizable.
- Compactness: `ℝ` is connected, locally connected and metrizable, and not compact, while an image
  of `I` is compact.
- Connectedness: a two-point discrete space.
- Local connectedness: `closedSineCurve` (1.3).
- Metrizability: `ℝ → I` (Layer 1, Examples) has more points than `I`, so it is not an image of
  `I`.

### Examples

- The Hilbert cube `ℕ → I` is a continuous image of `I`.
- A Hausdorff continuous image of a Peano continuum is a Peano continuum: compose with a
  surjection from `I`.
- Every Peano continuum is locally path connected, and for any two of its points `a, b` some
  continuous surjection `I → X` sends `0` to `a` and `1` to `b`: concatenate a path from `a` to
  `g 0`, a surjection `g`, and a path from `g 1` to `b`.

### Dependencies

3.1 uses the definition of `IsUniformlyLocallyPathConnected`. 3.2 uses 1.1, 2.1 and 3.1.

## Layer 4: curves onto the square

### 4.1 No injective curve onto the square

Prove `not_injective_of_continuous_surjective_unitInterval_prod`: a continuous surjection
`f : I → I × I` is not injective.

*Needs:* `Continuous.homeoOfEquivCompactToT2`, `Convex.segment_subset` (Mathlib).

(Proved here.) If `f` were injective it would be a continuous bijection from a compact space onto
a Hausdorff one, hence a homeomorphism. Choose `p ∈ I × I` other than `f 0` and `f 1`, and let
`t` be its preimage, so `0 < t < 1`. Then `I \ {t}` is disconnected, by the two open pieces
`[0, t)` and `(t, 1]`. But `(I × I) \ {p}` is path connected: view `I × I` as the convex square
`Q ⊆ ℝ × ℝ`. For `z, w ∈ Q \ {p}`, if the segment from `z` to `w` misses `p` it is a path; if not,
`p` lies on the line through `z` and `w`, some corner `c` of `Q` lies off that line (the four
corners are not collinear), and the segments from `z` to `c` and from `c` to `w` lie in `Q` and
meet that line only at `z` and at `w`, so they miss `p`. A homeomorphism would carry the
disconnected set onto the connected one.

### Examples

- Combined with Layer 3, a continuous surjection `I → I × I` exists but never injectively; one is
  given by Hahn–Mazurkiewicz applied to the square.
- No continuous surjection `I → I × I` is Hölder of exponent `r > 1/2`: Mathlib's
  `HolderOnWith.dimH_image_le` gives `dimH (I × I) ≤ dimH I / r`, and the dimensions are `2` and
  `1` by `Real.dimH_of_nonempty_interior` and `Isometry.dimH_image`, so `2 ≤ 1 / r`.

### Dependencies

4.1 uses Mathlib only.

## Scope and ownership

Owned here: the definitions `HasPropertyS`, `IsUniformlyLocallyPathConnected` and
`closedSineCurve`, and the seven theorems 1.1–1.3, 2.1, 3.1, 3.2 and 4.1. That uniform local path
connectedness implies local path connectedness is a short argument from the definition, given in
the Examples of Layer 2 and inside the route of 3.2, and is not a separate target.

Already in the libraries, and cited, not restated: the Hausdorff–Alexandroff theorem and the
binary-expansion surjection `Real.fromBinary` from Cantor space onto `I`
(`Mathlib/Topology/MetricSpace/HausdorffAlexandroff.lean`); the middle-thirds set and its
homeomorphism with Cantor space; Urysohn's metrization theorem; the characterisations of local
connectedness and local path connectedness, and path connectedness of connected locally path
connected spaces; the local connectedness of products and of Hausdorff continuous images of
compact locally connected spaces (Mathlib for quotient maps, Tau Ceti for the compact case);
Tau Ceti's uniform local connectedness of sets and its equivalence with local connectedness on
compact sets. Mathlib's `Counterexamples/` folder contains a continuous surjection `I → I × I`
and the connectedness and failure of path connectedness of the unbounded topologist's sine curve;
these are prior art and are not restated.

Not treated here: arcwise connectedness of Peano continua and the arc and simple closed curve
characterisations by cut points; explicit space-filling curves (Peano's, Hilbert's, Lebesgue's)
and their exact Hölder exponents; a space-filling curve onto the closed disc in the plane;
continuum theory beyond Peano continua (decompositions, indecomposable continua); the Cantor
space characterisations of Brouwer and others.

What later work each layer is for: Layer 1 supplies the metrizability of images and the
non-example that recur in continuum theory; Layer 2 supplies small paths for any argument that
joins nearby points in a compact locally connected space; Layer 3 is the characterisation, and
3.1 is the extension tool for maps out of the interval; Layer 4 is the topological limit of
space-filling curves.

## Exact supplier contracts

### From Mathlib

- `exists_nat_bool_continuous_surjective_of_compact` (`Topology/MetricSpace/HausdorffAlexandroff`):
  for `[Nonempty X] [MetricSpace X] [CompactSpace X]`, a continuous surjection `(ℕ → Bool) → X`.
- `cantorSetHomeomorphNatToBool : cantorSet ≃ₜ (ℕ → Bool)`, `isClosed_cantorSet`,
  `cantorSet_subset_unitInterval : cantorSet ⊆ Icc 0 1` (`Topology/Instances/CantorSet`).
- `TopologicalSpace.metrizableSpace_of_t3_secondCountable` (`Topology/Metrizable/Urysohn`):
  `[T3Space X] [SecondCountableTopology X]` gives `MetrizableSpace X`.
- The instance `SecondCountableTopology X` for `[LindelofSpace X] [PseudoMetrizableSpace X]`
  (`Topology/Metrizable/Basic`), which applies to compact metrizable spaces.
- `TopologicalSpace.metrizableSpaceMetric` (`Topology/Metrizable/Uniformity`): a compatible metric.
- `Continuous.isClosedMap` (`Topology/Separation/Hausdorff`): `[CompactSpace X] [T2Space Y]`.
- `Continuous.homeoOfEquivCompactToT2` (`Topology/Homeomorph/Lemmas`): a continuous bijection
  from a compact space to a Hausdorff space is a homeomorphism.
- `Function.Surjective.compactSpace` (`Topology/Compactness/Compact`),
  `Function.Surjective.connectedSpace` (`Topology/Connected/Basic`): continuous surjective images
  of compact and of connected spaces.
- `locallyConnectedSpace_iff_connected_subsets`,
  `locallyConnectedSpace_iff_connectedComponentIn_open`, `IsOpen.connectedComponentIn`,
  `Pi.locallyConnectedSpace` (factors locally connected and preconnected)
  (`Topology/Connected/LocallyConnected`).
- `locallyPathConnectedSpace_iff_pathComponentIn_mem_nhds`,
  `pathConnectedSpace_iff_connectedSpace` (for `[LocallyPathConnectedSpace X]`)
  (`Topology/Connected/LocallyPathConnected`); `IsPathConnected.joinedIn`
  (`Topology/Connected/PathConnected`).
- `IsPreconnected.closure`, `isPreconnected_sUnion`, `IsConnected.subset_closure`,
  `isConnected_Ioc` (`Topology/Connected/Basic`, `Topology/Order/IntermediateValue`).
- `lebesgue_number_lemma_of_metric` (`Topology/MetricSpace/Pseudo/Lemmas`),
  `IsCompact.elim_finite_subcover`, `Metric.isCompact_of_isClosed_isBounded` (proper space).
- `uniformContinuous_uniformly_extend` (`Topology/UniformSpace/UniformEmbedding`): extension of a
  uniformly continuous map from a dense uniformly inducing subset into a complete space.
- `Convex.segment_subset` (`Analysis/Convex/Basic`); `Convex.locallyPathConnectedSpace`
  (`Topology/Algebra/Module/LocallyConvex`): a convex set in a locally convex real space is
  locally path connected.
- For the Example of Layer 4: `HolderOnWith.dimH_image_le` (`0 < r`),
  `Real.dimH_of_nonempty_interior` (finite-dimensional real normed space), `Isometry.dimH_image`
  (`Topology/MetricSpace/HausdorffDimension`).

### From Tau Ceti

- `TauCeti.locallyConnectedSpace_of_continuous_surjective` (`TauCeti/Topology/LocallyConnected`):
  for `[LocallyConnectedSpace X] [CompactSpace X] [T2Space Y]`, a continuous surjection `X → Y`
  makes `Y` locally connected.
- `TauCeti.IsUniformlyLocallyConnected` and `IsCompact.isUniformlyLocallyConnected_iff`
  (`TauCeti/Topology/UniformlyLocallyConnected`): uniform local connectedness of a set in a
  pseudometric space, equivalent to local connectedness of a compact set; used in the Conventions
  and in a Check of 1.2.

## References

- D. Calegari, *Topics in point set topology*, lecture notes, University of Chicago, version of
  March 7, 2025, https://math.uchicago.edu/~dannyc/notes/point_set_topology.pdf: Proposition 2.5
  (Hausdorff images of compact metrizable spaces), Lemma 3.5 (chains), Proposition 3.6 (path
  connectedness), Definition 3.7 and Proposition 3.8 (uniform local path connectedness),
  Theorem 3.2 and its proof in §3.4 (Hahn–Mazurkiewicz).
- Mathlib, `Mathlib/Topology/MetricSpace/HausdorffAlexandroff.lean` (V. Nesterov),
  `Counterexamples/PeanoCurve.lean` (V. Nesterov) and `Counterexamples/TopologistsSineCurve.lean`
  (D. Bolla, D. Loeffler).

# Roadmap: expressivity of ReLU networks

**Summary.** A ReLU network computes a function `ℝⁿ → ℝ` by alternating affine maps with the
coordinatewise rectifier `σ(t) = max(0, t)`; its depth is the number of affine maps and its widths
are the sizes of the hidden layers. This roadmap asks which functions such networks compute
exactly, how many affine pieces a network of given depth and widths can produce, and what depth
buys for approximation. Networks have real weights and biases, an affine output layer and any
widths, zero included; a continuous piecewise linear function is one that agrees with an affine
function on each of finitely many convex polyhedra covering `ℝⁿ`.

Four theorems are the headlines.

- *Exact representation (Arora, Basu, Mianjy and Mukherjee).* A function `ℝⁿ → ℝ` is computed by
  some ReLU network if and only if it is continuous piecewise linear, and then it is computed by a
  network of every depth at least `⌈log₂(n + 1)⌉ + 1`. The route is the theorem of Wang and Sun:
  every continuous piecewise linear function is a signed sum of maxima of `n + 1` affine functions.
- *Counting pieces in one variable.* A network on `ℝ` with hidden widths `d₁, …, d_(L−1)` computes
  a function with at most `(d₁ + 1)⋯(d_(L−1) + 1)` affine pieces. Conversely, a continuous
  function on `ℝ` with `p ≥ 2` affine pieces is computed with one hidden layer of `p` units.
- *Telgarsky's depth separation.* Let `Δ` be the tent map, rising from `0` to `1` on `[0, 1/2]`,
  falling back on `[1/2, 1]` and vanishing elsewhere. For every `L`, every network on `ℝ` of depth
  at most `L` with at most `2^L` hidden units in total satisfies `∫₀¹ |Δ^(L²+2) − g| ≥ 1/32`, while
  `Δ^(L²+2)` is computed by a network of depth `L² + 3` and width `3`.
- *Yarotsky's approximation of the square.* The function `f_m(x) = x − ∑_{s=1}^{m} Δ^s(x)/4^s`
  satisfies `0 ≤ f_m(x) − x² ≤ 4^(−(m+1))` on `[0, 1]` and is computed by a network of depth
  `m + 1` and width `5`. By polarization, for `M > 0` a network of depth `m + 2` and width `15`
  computes `F` with `|F(x, y) − xy| ≤ M²/4^m` for `|x|, |y| ≤ M` and `F(x, 0) = F(0, y) = 0`.

The networks are the multilayer perceptrons of Tau Ceti's neuromanifold library, the formalization
of the roadmap Neuromanifolds, with the rectifier as every hidden activation; continuous piecewise
linear functions are the piecewise affine maps of Tau Ceti's piecewise-linear topology, built for
the roadmap GeometricTopology, which also supplies their composition and continuity. The roadmap
UniversalApproximation treats density of one-hidden-layer networks; nothing here is a density
theorem.

## How to read the build

Layer 1 below defines ReLU networks and shows that they compute continuous piecewise linear
functions. Layer 2 proves the representation of Wang and Sun, first for maxima of affine functions
and then in general; it uses Layer 1 only for the notion of a continuous piecewise linear function.
Layer 3 builds maxima with logarithmic depth and proves the exact representation theorem from
Layers 1 and 2. Layer 4 counts the affine pieces of networks on `ℝ` and represents every
univariate continuous piecewise linear function with one hidden layer; it depends on Layer 1.
Layer 5 studies the iterated tent map and proves Telgarsky's separation from the counting of
Layer 4. Layer 6 builds Yarotsky's approximation of the square from the tent map of Layer 5 and
the network constructions of Layer 1.

## Conventions

- **Networks.** A network of depth `L` with widths `d 0, …, d L` is Tau Ceti's specification
  `MLPSpec ℝ L` with width function `d` and every hidden activation `t ↦ max 0 t`, the scalar
  function of Tau Ceti's `reluActivation`. Its parameters are a weight matrix and a bias for each
  of its `L` affine maps; its realization applies the rectifier after every affine map except the
  last. So depth `L` means `L` affine maps and `L − 1` hidden layers, numbered `1, …, L − 1`;
  depth `1` gives the affine functions and depth `0`, where input and output widths agree, the
  identity. A network computes a function
  `ℝⁿ → ℝ` when its input width is `n` and its output width is `1`. A univariate function
  `g : ℝ → ℝ` is identified with `x ↦ g (x 0)` on `Fin 1 → ℝ`. Widths may be `0`; a hidden layer
  of width `0` makes the network constant.
- **Depth in the sources.** Arora et al. and Hertrich et al. count depth exactly as here (a
  `(k + 1)`-layer network has `k` hidden layers), but end with a linear map; for depth at least `2`
  the two conventions give the same functions, since a hidden unit `σ(0 · x + 1) = 1` supplies an
  output bias. Telgarsky's lecture notes count affine layers, as here. Yarotsky counts layers of
  units including the input layer, so his depth is `L + 1`. Telgarsky's article counts layers of
  gates, the output gate included.
- **Continuous piecewise linear functions.** These are the `f : ℝⁿ → ℝ` with Tau Ceti's
  `IsPiecewiseAffineOn f univ`: finitely many convex polyhedra (finite intersections of closed
  affine half-spaces) cover `ℝⁿ`, and on each of them `f` agrees with a continuous affine map. The
  cells may overlap and need not be full-dimensional. This is the definition of Arora et al.
  (Definition 3, p. 2) and of Hertrich et al. (p. 3); such an `f` is continuous.
- **Affine pieces in one variable.** For `g : ℝ → ℝ` and a finite set `s`, `AffineOffFinset g s`
  says that `g` is affine on every open interval containing no point of `s`. For continuous `g`
  the least `|s| + 1` over such `s` is the number of maximal intervals on which `g` is affine, the
  number of pieces of Arora et al. for `n = 1`; it is `1` exactly when `g` is affine. The
  definition does not ask for continuity: values at the points of `s` are unconstrained.
- **The tent map.** `Δ(x) = 2σ(x) − 4σ(x − 1/2) + 2σ(x − 1)`, so `Δ(x) = 2x` on `[0, 1/2]`,
  `Δ(x) = 2 − 2x` on `[1/2, 1]` and `Δ(x) = 0` elsewhere. Telgarsky's article uses
  `σ(2σ(x) − 4σ(x − 1/2))` and Yarotsky's tooth function is given on `[0, 1]` only; all three agree
  on `[0, 1]`, and the first two on all of `ℝ`. `Δ^m` is the `m`-fold iterate, `Δ^0` the identity.
- **Integrals.** `∫₀¹` is the interval integral over `[0, 1]` for Lebesgue measure.

## Layer 1: ReLU networks compute continuous piecewise linear functions

### 1.1 ReLU networks

Define `reluSpec d`, the specification `MLPSpec ℝ L` with widths `d : Fin (L + 1) → ℕ` and every
hidden activation `t ↦ max 0 t`. Define `ReLUNetComputes d f` for `f : (Fin n → ℝ) → ℝ`:
`d 0 = n`, `d L = 1`, and some parameters make the realization of `reluSpec d` agree with `f` at
every input. Define `hiddenLayers L`, the indices `1, …, L − 1` of the hidden layers. Prove:

- Composition: if a network of depth `L₁ ≥ 1` computes `g : ℝⁿ → ℝᵐ` (one network with output
  width `m`) and a network of depth `L₂ ≥ 1` computes `h : ℝᵐ → ℝ`, a network of depth
  `L₁ + L₂ − 1` with hidden widths those of the two networks computes `h ∘ g`, the last affine map
  of the first being merged with the first affine map of the second (Arora et al., Lemma D.1,
  p. 16).
- Parallel sums: if networks of the same depth `L ≥ 1` with hidden widths `d i` and `d' i` compute
  `f` and `f'`, a network of depth `L` with hidden widths `d i + d' i` computes `a f + b f' + c`
  for all reals `a`, `b`, `c` (Arora et al., Lemma D.2, p. 16).
- Depth padding: if a network of depth `L ≥ 1` computes `f`, a network of depth `L + 1` computes
  `f`, by appending a hidden layer of two units and `t = σ(t) − σ(−t)`.
- Every affine function `ℝⁿ → ℝ` is computed with depth `1`, and with every depth `L ≥ 1` by
  padding (Arora et al., Lemma D.4, p. 16, for depth `2`).

(Proved here.)

**Checks.**
- `max(x₁, x₂) = σ(x₁ − x₂) + σ(x₂) − σ(−x₂)`, a network of depth `2` and width `3` (Hertrich et
  al., Figure 1, p. 3): at `(−1, 2)` it gives `0 + 2 − 0 = 2`, at `(3, −5)` it gives
  `8 + 0 − 5 = 3`.
- `|x| = σ(x) + σ(−x)` has depth `2` and width `2`; it has no network of depth `1`, which computes
  only affine functions, and none of depth `2` and width `1`, since `a σ(wx + b) + c` is constant
  or has a breakpoint at which one of its slopes is `0`.
- Hidden widths `(1, 0)` on `ℝ`: the second hidden layer is empty, so the output is its bias and
  the network is constant whatever its other parameters.
- Depth `0`: `reluSpec d` with `d 0 = 1` realizes the identity of `ℝ`, so `ReLUNetComputes`
  holds for `x ↦ x` and for no other function.

*Needs:* Tau Ceti `MLPSpec`, `MLPSpec.realize`, `MLPSpec.realize_succ`, `MLPSpec.evalPrefix_succ`,
`MLPSpec.layerActivation_castSucc`, `MLPSpec.realize_depth_zero`, `MLPSpec.realize_depth_one`.

### 1.2 Continuous piecewise linear functions

The class of `f : ℝⁿ → ℝ` with `IsPiecewiseAffineOn f univ`. Prove:

- It contains the continuous affine maps (Tau Ceti `isPiecewiseAffineOn_continuousAffineMap`) and
  is closed under composition with piecewise affine maps `ℝᵐ → ℝⁿ` (Tau Ceti
  `IsPiecewiseAffineOn.comp`), under pairing (Tau Ceti `IsPiecewiseAffineOn.prodMk`), and hence
  under sums, real multiples and pointwise maxima and minima of two members.
- The maximum and the minimum of finitely many, at least one, continuous affine maps are in it,
  with the cells on which a fixed map is the least. Tau Ceti states the local form for the
  minimum, `Finset.isPLOn_infAffine` (`IsPLOn` on the whole space); its proof assembles the global
  form from `Finset.infCell`, `Finset.isConvexPolyhedron_infCell`, `Finset.subset_iUnion_infCell`,
  `Finset.infAffine_eq_of_mem_infCell` and `isPiecewiseAffineOn_of_finite`, and only that global
  form and the maximum, the minimum of the negatives, are added here.
- The coordinatewise rectifier `ℝᵏ → ℝᵏ` is piecewise affine on `ℝᵏ`, with the `2^k` cells on which
  each coordinate has a prescribed sign.
- Selection: `f` is in the class if and only if it is continuous and finitely many continuous
  affine maps `ℓ₁, …, ℓ_q` satisfy `f(x) ∈ {ℓ₁(x), …, ℓ_q(x)}` for every `x`. For the converse,
  on each connected component of the complement of the hyperplanes `ℓᵢ = ℓⱼ` (`ℓᵢ ≠ ℓⱼ`) the
  values of distinct `ℓᵢ` differ, so by continuity `f` follows a single `ℓᵢ` there; the closures
  of these components are convex polyhedra covering `ℝⁿ`.
- Every member is continuous (Tau Ceti `IsPiecewiseAffineOn.continuousOn`).

(Proved here.)

**Checks.**
- The Heaviside function `1[x ≥ 0]` takes at every point one of the values of the constant maps
  `0` and `1`, but it is not continuous, so it is not in the class: continuity is needed in the
  selection characterization.
- `x ↦ |x|` is in the class with the two cells `x ≤ 0` and `x ≥ 0`, and it is not affine (Tau
  Ceti `not_exists_continuousAffineMap_eq_abs`; Tau Ceti `isPLOn_abs` is the local form `IsPLOn`).
- On `ℝ⁰`, a single point, every function is constant and in the class.

*Needs:* Tau Ceti `IsPiecewiseAffineOn`, `IsConvexPolyhedron`, `isConvexPolyhedron_setOf_le`,
`IsConvexPolyhedron.inter`, `isPiecewiseAffineOn_continuousAffineMap`,
`isPiecewiseAffineOn_of_finite`, `IsPiecewiseAffineOn.comp`, `IsPiecewiseAffineOn.prodMk`,
`IsPiecewiseAffineOn.continuousOn`, `Finset.infCell`, `Finset.isConvexPolyhedron_infCell`,
`Finset.subset_iUnion_infCell`, `Finset.infAffine_eq_of_mem_infCell`, `Finset.isPLOn_infAffine`.

### 1.3 Networks compute continuous piecewise linear functions

Prove `isPiecewiseAffineOn_of_reluNetComputes`: if `ReLUNetComputes d f`, then
`IsPiecewiseAffineOn f univ` (Arora et al., Theorem 2.1, p. 3, first half, for depth at least `2`).

Route: by induction along the prefix evaluation of `MLPSpec`, each prefix is a piecewise affine
map into `ℝ^(d i)`: an affine map composed with a piecewise affine map is piecewise affine, and so
is the coordinatewise rectifier composed with one (1.2). The output is a coordinate of the last
prefix.

**Checks.**
- The tent map of 5.1 is computed with depth `2`, and it is piecewise affine with the cells
  `(−∞, 0]`, `[0, 1/2]`, `[1/2, 1]`, `[1, ∞)`.
- Depth `0` and `1` give the identity and the affine functions, the base cases of the induction.

*Needs:* 1.1, 1.2; Tau Ceti `IsPiecewiseAffineOn.comp`, `isPiecewiseAffineOn_continuousAffineMap`.
(Proved here.)

### Examples

The maximum of two numbers with three hidden units; the absolute value with two; a hidden layer of
width zero making a network constant.

### Dependencies

Tau Ceti `MLPSpec` and its realization lemmas, `IsPiecewiseAffineOn` and its calculus,
`IsConvexPolyhedron`, the finite-infimum cells and `Finset.isPLOn_infAffine`. No other layer.

## Layer 2: continuous piecewise linear functions as sums of maxima

### 2.1 Maxima of affine functions

Prove `exists_int_combination_sup'_card_le`: for `p ≥ 1` and continuous affine maps
`ℓ₁, …, ℓ_p : ℝⁿ → ℝ`, there are integers `c_S`, indexed by the subsets `S` of `{1, …, p}` and
zero unless `|S| ≤ n + 1`, with `maxᵢ ℓᵢ(x) = ∑_{S ≠ ∅} c_S max_{i ∈ S} ℓᵢ(x)` for all `x`
(Hertrich, Basu, Di Summa and Skutella, Theorem 4.1, p. 22, with proof on pp. 25–27).

Route: write `zᵢ = (aᵢ, bᵢ) ∈ ℝ^(n+1)` for `ℓᵢ(x) = ⟪aᵢ, x⟫ + bᵢ`. If `p > n + 1`, Radon's theorem
applied to the `aᵢ`, taking the part of the partition whose weighted sum of the `bᵢ` is not the
larger, gives a nonempty proper `U ⊆ {1, …, p}` such that no `c` with last
coordinate `≥ 0` and no `γ` separate `{zᵢ : i ∈ U}` strictly above from the rest (Hertrich et al.,
Proposition 4.5, p. 25). Then for every `x` some `u ∈ U` has `ℓ_u(x) ≤ max_{i ∉ U} ℓᵢ(x)`, and
toggling `u` matches the even and the odd subsets `W ⊆ U` so that
`∑_{|W| even} max_{i ∉ W} ℓᵢ(x) = ∑_{|W| odd} max_{i ∉ W} ℓᵢ(x)` (Proposition 4.6, p. 26, proved
there through support functions of Newton polyhedra; evaluated at a point it is this pairing).
The term `W = ∅` is the maximum of all `p` maps, and every other term has fewer than `p`; induct
on `p`.

**Checks.**
- `n = 1`, `ℓ₁ = −x`, `ℓ₂ = 0`, `ℓ₃ = x − 1`: `max(ℓ₁, ℓ₂, ℓ₃) = max(ℓ₁, ℓ₂) + max(ℓ₂, ℓ₃) − ℓ₂`;
  at `x = 2` both sides are `1`, at `x = −1` both are `1`, at `x = 1/2` both are `0`.
- The coefficients depend on the arrangement: with `ℓ₂ = −5` instead, `ℓ₂` is never the maximum,
  and the same combination `max(ℓ₁, ℓ₂) + max(ℓ₂, ℓ₃) − ℓ₂` equals `4` at `x = 0`, where
  `max(ℓ₁, ℓ₂, ℓ₃) = 0`.
- The recursion of the route, run in exact rational arithmetic on random families with `n ≤ 3` and
  `p ≤ 7`, repeated and coinciding maps included, gives integer coefficients on subsets of at most
  `n + 1` members that reproduce `maxᵢ ℓᵢ` exactly at every point tried.
- `p = 1` or `p ≤ n + 1`: take `c_S = 1` for the whole family and `0` otherwise.

*Needs:* Mathlib `Convex.radon_partition`, `Finset.sup'`, `ContinuousAffineMap`. (Proved here,
following the cited proof.)

### 2.2 Convex parts and differences of convex functions

Prove, for `f : ℝⁿ → ℝ` with `IsPiecewiseAffineOn f univ` and cells `C₁, …, C_q` with affine maps
`A₁, …, A_q`:

- If `f` is convex, `f` is the maximum of those `Aᵢ` whose cell has nonempty interior. Such an `Aᵢ`
  agrees with `f` on an open set, so it is an affine minorant of `f`; the cells with nonempty
  interior have dense union, since finitely many closed sets covering `ℝⁿ` do, and `f` agrees
  with the maximum on that dense set and both are continuous.
- With `h = ∑_{i < j} max(Aᵢ, Aⱼ)`, the function `g = f + h` is convex; `g` and `h` are convex and
  piecewise affine, hence by the first bullet maxima of finitely many continuous affine maps, and
  `f = g − h` (Hertrich et al., Proposition 4.3, p. 23; that a continuous piecewise linear function
  is a difference of convex ones is due to Wang). Along any line, at a point where `f` bends
  downward it agrees near the point with `min(Aᵢ, Aⱼ)` for two of the maps, and adding
  `max(Aᵢ, Aⱼ) = Aᵢ + Aⱼ − min(Aᵢ, Aⱼ)` straightens the bend while the other summands are
  convex.

(Proved here, following the cited proof.)

**Checks.**
- `f(x) = −|x|` on `ℝ` with `A₁ = x`, `A₂ = −x`: `h = |x|`, `g = 0`, and `f = 0 − |x|`.
- A convex `f` with a redundant cell: on `ℝ`, `f = |x|` with cells `x ≤ 0`, `x ≥ 0` and the extra
  cell `{0}` carrying `A₃ = 5x`; the maximum of all three maps is `max(|x|, 5x) ≠ |x|` at `x = 1`,
  while the maximum over the cells with nonempty interior is `|x|`.

*Needs:* 1.2; Mathlib `ConvexOn`, `Finset.sup'`, `interior`, `dense_iUnion_interior_of_closed`.

### 2.3 The representation of Wang and Sun

Prove `exists_signed_sum_sup'_of_isPiecewiseAffineOn`: if `IsPiecewiseAffineOn f univ` for
`f : ℝⁿ → ℝ`, there are `k`, signs `s₁, …, s_k ∈ {1, −1}` and continuous affine maps `ℓ_(j,i)`,
`1 ≤ j ≤ k`, `0 ≤ i ≤ n`, with `f(x) = ∑ⱼ sⱼ maxᵢ ℓ_(j,i)(x)` for every `x` (Hertrich et al.,
Theorem 1.3, p. 4, as the equality of the class of continuous piecewise linear functions with the
linear combinations of maxima of `n + 1` affine maps; Arora et al., equation (2.1), p. 3; due to
Wang and Sun). Repetitions among the `ℓ_(j,i)` give maxima of fewer maps.

Route: 2.2 writes `f = g − h` with `g`, `h` maxima of finitely many continuous affine maps; 2.1
writes each as an integer combination of maxima of at most `n + 1` of them; a term `c · max` with
`c ∈ ℤ` is `|c|` copies of `± max`.

**Checks.**
- `n = 1`: `Δ(x) = max(0, 2x) − max(0, 2x − 1) − max(0, 2x − 1) + max(0, 2x − 2)`, four maxima of
  two affine maps.
- `n + 1` cannot be lowered to `1`: maxima of single maps are affine, and `|x| = max(x, −x)` is not
  a combination of affine functions. For `n ≥ 3` it cannot be lowered to `n` either (Hertrich et
  al., Proposition 3.1, p. 16).
- `n = 0`: `f` is a constant `c` and `k = 1`, `s₁ = 1`, `ℓ_(1,0) = c`.

*Needs:* 2.1, 2.2. (Proved here, following the cited proof.)

### Examples

The tent map as four signed maxima of pairs; `−|x|` as a difference of convex functions; three
lines in the plane of the first Check of 2.1.

### Dependencies

Layer 1 (1.2). Mathlib `Convex.radon_partition`, `Finset.sup'`, `ConvexOn`,
`dense_iUnion_interior_of_closed`.

## Layer 3: logarithmic depth suffices

### 3.1 Maxima with logarithmic depth

Prove: for `k ≥ 0` and continuous affine maps `ℓ₁, …, ℓ_(2^k) : ℝⁿ → ℝ`, a network of depth `k + 1`
computes `maxᵢ ℓᵢ` (Hertrich et al., Lemma 1.2, p. 4; Arora et al., Lemma D.3, p. 16). Hence a
signed sum of maxima of `n + 1` affine maps is computed with depth `⌈log₂(n + 1)⌉ + 1`, by padding
each family to `2^⌈log₂(n+1)⌉` maps with repetitions and adding the networks in parallel (1.1).

Route: by induction on `k`, pair the maps and take `max(a, b) = σ(a − b) + σ(b) − σ(−b)` at each of
`k` hidden layers, merging the affine maps between them (1.1).

**Checks.**
- `k = 0`: one map, an affine function of depth `1`. `k = 2`: the maximum of four numbers with two
  hidden layers of widths `6` and `3` (Hertrich et al., Figure 2, p. 4).
- `⌈log₂(n + 1)⌉` is Mathlib's `Nat.clog 2 (n + 1)`: `0, 1, 2, 2, 3` for `n = 0, 1, 2, 3, 4`.

*Needs:* 1.1; Mathlib `Nat.clog`, `Nat.le_pow_clog`. (Proved here, following the cited proof.)

### 3.2 The exact representation theorem

Prove `exists_reluNetComputes_of_isPiecewiseAffineOn`: if `IsPiecewiseAffineOn f univ` for
`f : ℝⁿ → ℝ`, then for every `L ≥ ⌈log₂(n + 1)⌉ + 1` some widths `d` give `ReLUNetComputes d f`
(Arora et al., Theorem 2.1, p. 3, with depth at most `⌈log₂(n + 1)⌉ + 1`; Hertrich et al.,
Theorem 1.1, p. 4). With 1.3, a function `ℝⁿ → ℝ` is computed by some ReLU network exactly when it
is continuous piecewise linear.

Route: 2.3 and 3.1 give depth `⌈log₂(n + 1)⌉ + 1`; padding (1.1) gives every larger depth.

**Checks.**
- `n = 0`: depth `1`, an affine map from the one-point space, computes every constant.
- `n = 1`: depth `2` (4.3). `n = 2, 3`: depth `3`. For `n = 2` depth `2` does not suffice:
  `max(0, x₁, x₂)` has no network with one hidden layer, since the breakpoints of such a network
  form a union of lines and those of `max(0, x₁, x₂)` are three half-lines (Hertrich et al., p. 6,
  after Mukherjee and Basu).

*Needs:* 1.1, 2.3, 3.1. (Proved here, following the cited proof.)

### Examples

The maximum of four numbers with two hidden layers; `max(0, x₁, x₂)` with depth `3`.

### Dependencies

Layer 1 (1.1), Layer 2 (2.3). Mathlib `Nat.clog`, `Nat.le_pow_clog`.

## Layer 4: affine pieces of univariate networks

### 4.1 Breakpoint sets

Define `AffineOffFinset g s` for `g : ℝ → ℝ` and a finite set `s ⊆ ℝ`: for all `a`, `b` such that
the open interval `(a, b)` contains no point of `s`, some `c`, `e` give `g(x) = c x + e` on
`(a, b)`.

- If `AffineOffFinset g s` and `s ⊆ t`, then `AffineOffFinset g t`.
- `AffineOffFinset g ∅` holds exactly when `g` is affine on `ℝ`: affine functions agreeing on an
  open interval are equal, so the affine maps on overlapping intervals coincide.
- If `AffineOffFinset g s` and `AffineOffFinset h t`, then `a g + b h` is affine off `s ∪ t`, and
  `σ ∘ g` is affine off `s` together with at most one zero of `g` in each of the `|s| + 1` open
  intervals of `ℝ ∖ s` on which `g` is not constant.

(Proved here.)

**Checks.**
- `|x|` is affine off `{0}` and not off `∅`; the tent map is affine off `{0, 1/2, 1}` and off no
  set of two points.
- The Heaviside function `1[x ≥ 0]` is affine off `{0}` although it is not continuous; this is why
  4.3 assumes continuity.

*Needs:* Mathlib `Set.Ioo`, `Finset`. (Proved here.)

### 4.2 Counting pieces

Prove `exists_affineOffFinset_card_lt_prod`: if a network of depth `L` with widths `d` computes
`g : ℝ → ℝ`, then `AffineOffFinset g s` for some `s` with `|s| < ∏_{i hidden} (d i + 1)`; so `g`
has at most `(d 1 + 1)⋯(d (L−1) + 1)` affine pieces. (Proved here; Arora et al., Lemma D.5, p. 17,
and Telgarsky's lecture notes, Lemma 5.1, p. 36, give bounds of the two forms in the second
Check.)

Route: by induction over the hidden layers, every unit of hidden layer `i` is affine off one common
set `Bᵢ` with `|Bᵢ| + 1 ≤ (d 1 + 1)⋯(d i + 1)`. The pre-activations of layer `i + 1` are affine on
each of the `|Bᵢ| + 1` intervals of `ℝ ∖ Bᵢ`, and each of the `d (i+1)` rectifiers adds at most one
breakpoint in each, so `|B_(i+1)| + 1 ≤ (|Bᵢ| + 1)(d (i+1) + 1)` (4.1). The output layer adds none.

**Checks.**
- One hidden layer of `k` units: at most `k` breakpoints, attained for `k = 3` by
  `x ↦ σ(x) − 2σ(x − 1) + 3σ(x − 2)` with breakpoints `0, 1, 2`. Hence a network with one hidden
  layer computing a continuous function with `p` pieces has at least `p − 1` units (Arora et al.,
  Theorem 2.2, p. 3, second half).
- With every hidden width positive, `d i + 1 ≤ 2 d i` gives Arora et al.'s bound
  `2^(k−1) (d 1 + 1) d 2 ⋯ d k` for `k` hidden layers and, by the inequality of arithmetic and
  geometric means, `(2m/k)^k` with `m` the total number of hidden units, the form of Telgarsky's
  bound with `k` the number of hidden layers. Both need positive widths: for hidden widths `(1, 0)`
  the first is `2 · 2 · 0 = 0`, and for `(0, 0)` the second is `0`, while these networks are
  constant, with one piece.
- For every pattern of hidden widths in `{0, …, 4}` with depth at most `4`, random networks with
  rational weights, evaluated exactly, never reach the product; one hidden layer of `4` units has
  `4` breakpoints against the product `5`.
- For `m ≥ 1`, `Δ^m` has `2^m + 1` breakpoints (5.1) and is computed with `m` hidden layers of
  width `3`, below the bound `4^m`.

*Needs:* 1.1, 4.1; Tau Ceti `MLPSpec.evalPrefix_succ`, `MLPSpec.realize_succ`.

### 4.3 One hidden layer suffices in one variable

Prove `reluNetComputes_of_affineOffFinset`: if `g : ℝ → ℝ` is continuous, `AffineOffFinset g s`
and `s` is nonempty, then a network of depth `2` with `|s| + 1` hidden units computes `g` (Arora et
al., Theorem 2.2, p. 3, with proof on pp. 11–12; the univariate case of 3.2 with a width bound).

Route: with `s = {a₁ < ⋯ < a_q}`, write `g` as `r σ(x − a_q)` (the slope to the right of `a_q`),
plus `−tⱼ σ(aⱼ − x)` for `j = 1, …, q` (one left-facing unit at each point of `s`), plus a constant;
the slopes `tⱼ` are determined from right to left by the slopes of `g` on consecutive intervals,
and the constant is the output bias.

**Checks.**
- `s` nonempty is needed: `g(x) = x` is affine off `∅`, but a network with one hidden unit computes
  `a σ(wx + b) + c`, which is not `x`; two units, `σ(x) − σ(−x)`, are needed. Arora et al.'s
  Theorem 2.2 claims at most `p` units for `p` pieces and fails at `p = 1` for nonconstant affine
  functions. Its proof (p. 11) uses an output bias; with the linear output map of their
  Definition 1 it fails also at `p = 2`, since `|x| + 1` then needs three units: two units with
  kinks only at `0` vanish at `0`, and otherwise a slope is `0` on a half-line.
- On 300 random continuous functions with up to six breakpoints, the `|s| + 1` units
  `σ(x − a_q), σ(aⱼ − x)` and a bias reproduce the function to `3 · 10⁻¹²` by least squares.
- When the rightmost slope is `0` the first unit is not needed, so `|s|` units suffice (Arora et
  al., Corollary A.1, p. 12): `σ(−x)` is affine off `{0}` and uses one unit. For `|x|`, also affine
  off `{0}`, both units `σ(x)` and `σ(−x)` are needed, since one unit leaves a slope `0` on one
  side.

*Needs:* 1.1, 4.1. (Proved here, following the cited proof.)

### Examples

The function `σ(x) − 2σ(x − 1) + 3σ(x − 2)` with three breakpoints; the identity, which needs two
hidden units; the tent map, below the bound of 4.2.

### Dependencies

Layer 1 (1.1). Tau Ceti `MLPSpec.evalPrefix_succ`, `MLPSpec.realize_succ`.

## Layer 5: the tent map and depth separation

### 5.1 Iterates of the tent map

Define `tent`, the map `Δ` of the Conventions. Prove:

- For `m ≥ 1` and `x ∈ [0, 1]`, `Δ^m(x) = Δ(⟨2^(m−1) x⟩)` with `⟨y⟩ = y − ⌊y⌋` (Telgarsky's
  lecture notes, Proposition 5.1, p. 34; Telgarsky, Lemma 3.11, p. 9). So on `[0, 1]`, `Δ^m` is
  `2^(m−1)` copies of `Δ` compressed by `2^(m−1)`, affine on each `[k/2^m, (k+1)/2^m]`, equal to
  `0` at even and `1` at odd multiples of `2^(−m)`, and `Δ^m = 0` off `[0, 1]`.
- `Δ^m` is affine off `{k/2^m : 0 ≤ k ≤ 2^m}` and off no smaller set, for `m ≥ 1`: it has `2^m`
  pieces on `[0, 1]` and `2^m + 2` on `ℝ`.
- `reluNetComputes_tent_iterate`: `Δ^m` is computed by a network of depth `m + 1` with all hidden
  widths `3`: hidden layer `i` holds `σ(Δ^(i−1)(x) − c)` for `c = 0, 1/2, 1`, and `Δ^(i−1)(x)` is
  an affine combination of the units of layer `i − 1`.

(Proved here, following the cited sources.)

**Checks.**
- `Δ(1/4) = 1/2`, `Δ(3/4) = 1/2`, `Δ(1) = 0`, `Δ(3/2) = 0`, `Δ(−1) = 0`.
- `Δ²(1/4) = Δ(1/2) = 1`, `Δ²(1/2) = Δ(1) = 0`; the closed form gives `Δ(⟨1/2⟩) = 1` and
  `Δ(⟨1⟩) = Δ(0) = 0`.
- Exact rational evaluation of the width-`3` networks for `m ≤ 6` agrees with `Δ^m` at 200 points
  of `[−2, 3]` and at every multiple of `2^(−m)` in `[0, 1]`, and finds `2^m + 1` breakpoints.
- `m = 0`: depth `1` with widths `(1, 1)` computes the identity, `Δ^0`.

*Needs:* 1.1, 4.1; Mathlib `Int.fract`, `Function.iterate_succ_apply'`.

### 5.2 Few pieces are far from many oscillations

Prove `integral_abs_tent_iterate_sub_ge`: for every `m` and `g : ℝ → ℝ` with
`AffineOffFinset g s`, `∫₀¹ |Δ^m − g| ≥ (2^(m−1) − 1 − 2|s|)/2^(m+3)`, with `m − 1` truncated at
`0`. (Proved here, following the counting argument of Telgarsky, Lemma 3.1, p. 5, and the proof
of Theorem 1.1, pp. 9–10, and of Telgarsky's lecture notes, proof of Theorem 5.1, p. 38; the
constants are this roadmap's.)

Route: the line at height `1/2` cuts `[0, 1]` at the odd multiples of `2^(−m−1)` into `2^m + 1`
open intervals `U` on which `Δ^m − 1/2` has a constant sign alternating from one to the next, with
`∫_U |Δ^m − 1/2| = 2^(−m−2)` for the inner ones and `2^(−m−3)` for the two end ones. The set where
`g ≥ 1/2` changes at the points of `s` and at most once in each of the `|s| + 1` intervals of
`ℝ ∖ s`, so at most `2|s| + 1` points `B` split `ℝ` into intervals on each of which either
`g ≥ 1/2` throughout or `g < 1/2` throughout; the values of `g` on `s` do not matter. At most `|B|`
intervals `U` contain a point of `B`; the others form at most `|B| + 1` runs of consecutive
intervals inside the intervals of `ℝ ∖ B`, and in a run of `r` of them `g` lies on the wrong side
of `1/2` on at least `(r − 1)/2`. Summing over the runs leaves at least
`(2^m + 1 − |B| − (|B| + 1))/2 = 2^(m−1) − |B| ≥ 2^(m−1) − 1 − 2|s|` intervals `U` on which
`|Δ^m − g| ≥ |Δ^m − 1/2|`, each contributing at least `2^(−m−3)`.

**Checks.**
- `m = 2`, `s = ∅`: the bound is `1/32`, and every affine `g` is at distance at least `1/4`: by
  the symmetry `Δ²(1 − x) = Δ²(x)` and convexity of the distance an optimal `g` may be taken
  constant, and `Δ²` takes its values uniformly in `[0, 1]`, so `∫₀¹ |Δ² − c| ≥ ∫₀¹ |u − 1/2| du = 1/4`.
- `m = 6`, `s = {k/64 : 0 ≤ k ≤ 14}`: the function equal to `Δ⁶` on `[0, 14/64]`, to `0` left of
  `0` and to `1/2` right of `14/64` is affine off `s` and at distance exactly
  `(1 − 14/64)/4 = 25/128`, above the bound `(32 − 1 − 30)/512 = 1/512`.
- For `m = 0` the bound is `−2|s|/8 ≤ 0`, so the statement says nothing there; the route above is
  for `m ≥ 1`.

*Needs:* 4.1, 5.1; Mathlib `intervalIntegral.integral_mono_on`, `intervalIntegral`.

### 5.3 Telgarsky's separation

Prove `one_div_32_le_integral_abs_tent_iterate_sub`: if `L' ≤ L` and a network of depth `L'` with
at most `2^L` hidden units in total computes `g : ℝ → ℝ`, then `∫₀¹ |Δ^(L²+2) − g| ≥ 1/32`. By 5.1,
`Δ^(L²+2)` is computed with depth `L² + 3` and `3L² + 6` hidden units (Telgarsky's lecture notes,
Theorem 5.1, p. 35, for `L ≥ 2` and networks with at most `2^L` nodes and at most `L` layers;
Telgarsky, Theorem 1.1, p. 2, for networks of semi-algebraic gates on `ℝ^d`).

Route: 4.2 gives `|s| + 1 ≤ ∏ (d i + 1)` over at most `L − 1` hidden layers, and with
`∑ d i ≤ 2^L` the product is at most `(2^L + 1)^(L−1) ≤ 2^(L²−1)` for `L ≥ 2`, and `1` for
`L ≤ 1`. Then 5.2 with `m = L² + 2` gives at least
`(2^(L²+1) − 1 − 2(2^(L²−1) − 1))/2^(L²+5) ≥ 1/32`; for `L ≤ 1` it gives `(2^(L²+1) − 1)/2^(L²+5)`,
which is `1/32` at `L = 0` and `3/64` at `L = 1`.

**Checks.**
- `L = 2`: one hidden layer of at most `4` units gives at most `5` pieces, below `2^(L²−1) = 8`;
  the bound of 5.2 is `23/512`.
- The largest product `∏ (d i + 1)` for `L = 3, 4, 5` is `25`, `252`, `6561`, far below
  `2^(L²−1) = 256`, `32768`, `16777216`.
- `L = 0`: `L' = 0`, the network is the identity, and the bound `1/32` is exactly what 5.2 gives
  for `m = 2`, `s = ∅`.

*Needs:* 4.2, 5.1, 5.2. (Proved here, following the cited proofs.)

### Examples

`Δ²` and `Δ³` with their `4` and `8` pieces on `[0, 1]`; the separation for `L = 2`, where `Δ⁶`
is compared with networks of one hidden layer of at most `4` units.

### Dependencies

Layer 1 (1.1), Layer 4 (4.1, 4.2). Mathlib `Int.fract`, `Function.iterate_succ_apply'`,
`intervalIntegral.integral_mono_on`.

## Layer 6: Yarotsky's approximation of the square and of products

### 6.1 The sawtooth approximation of `x²`

Define `yarotskyApprox m`, the function `f_m(x) = x − ∑_{s=1}^{m} Δ^s(x)/4^s`. Prove:

- `f_m(k/2^m) = (k/2^m)²` for `0 ≤ k ≤ 2^m`, and `f_m` is affine on each `[k/2^m, (k+1)/2^m]`: it
  is the piecewise linear interpolation of `x²` on that grid (Yarotsky, proof of Proposition 2,
  pp. 7–8; Telgarsky's lecture notes, Theorem 5.2, item 1, p. 40).
- `f_(m−1) − f_m = Δ^m/4^m` (Yarotsky, p. 7, with `2^(2m)` for `4^m`).
- `yarotskyApprox_sub_sq_mem_Icc`: `0 ≤ f_m(x) − x² ≤ 4^(−(m+1))` for `x ∈ [0, 1]` (Yarotsky, p. 7,
  error `2^(−2m−2)`; Telgarsky's lecture notes, Theorem 5.2, item 3, p. 40). The lower bound holds
  because the chord of a convex function lies above it; the upper bound is the maximum
  `h²/4` of the interpolation error of `x²` on an interval of length `h = 2^(−m)`, reached at its
  midpoint.

(Proved here, following the cited proofs.)

**Checks.**
- `m = 0`: `f_0(x) = x` and `x − x² ≤ 1/4`, with equality at `x = 1/2`.
- `m = 1`: `f_1(1/2) = 1/2 − 1/4 = 1/4 = (1/2)²`, and at `x = 1/4`,
  `f_1 − x² = 1/4 − 1/8 − 1/16 = 1/16`.
- In exact arithmetic for `m ≤ 7`, `f_m − x² = 4^(−(m+1))` at every midpoint `(2k+1)/2^(m+1)` and
  lies in `[0, 4^(−(m+1))]` at 300 random rationals of `[0, 1]`.
- The bound is for `[0, 1]` only: `f_2(2) = 2` and `f_2(−1) = −1`, since `Δ` vanishes off
  `[0, 1]`.

*Needs:* 5.1; Mathlib `ConvexOn`. (Proved here, following the cited proofs.)

### 6.2 A network for the approximation

Prove `reluNetComputes_yarotskyApprox`: a network of depth `m + 1` with all hidden widths `5`
computes `f_m` on all of `ℝ`. Hidden layer `i` holds the three units of 5.1 for `Δ^(i−1)(x)` and
the two units `σ(±aᵢ)` for `aᵢ = x − ∑_{s<i} Δ^s(x)/4^s`, which is affine in the units of layer
`i − 1` through `a = σ(a) − σ(−a)`; the output is `a_m − Δ^m(x)/4^m`. (Proved here; Yarotsky,
p. 8 and Figure 2(c), and Telgarsky's lecture notes, Theorem 5.2, item 2, p. 40, give depth and
size of order `m`.)

**Checks.**
- `m = 0`: depth `1`, the identity.
- Exact rational evaluation of these networks for `m ≤ 6` agrees with `f_m` at 300 random points of
  `[−3, 4]`.

*Needs:* 1.1, 5.1, 6.1.

### 6.3 Approximate multiplication

Prove `exists_reluNetComputes_mul`: for `M > 0` and `m ≥ 0`, a network of depth `m + 2` with hidden
widths at most `15` computes `F : ℝ² → ℝ` with `|F(x, y) − xy| ≤ M²/4^m` whenever `|x| ≤ M` and
`|y| ≤ M`, and with `F(x, 0) = F(0, y) = 0` for all real `x`, `y` (Yarotsky, Proposition 3, p. 8,
with error `ε` and depth and size `O(ln(1/ε))`; the constants are this roadmap's).

Route: `F(x, y) = 2M² (f_m(|x + y|/2M) − f_m(|x|/2M) − f_m(|y|/2M))`. The first hidden layer holds
the six units `σ(±(x + y))`, `σ(±x)`, `σ(±y)`, whose differences of pairs are the absolute values;
three copies of the network of 6.2 follow in parallel. Polarization `xy = ((x + y)² − x² − y²)/2`
and the three errors in `[0, 4^(−(m+1))]` of 6.1 give `|F − xy| ≤ 2M² · 2 · 4^(−(m+1))`. Since
`f_m(0) = 0` and the two terms with equal argument cancel, `F(x, 0) = F(0, y) = 0` for all `x`,
`y`.

**Checks.**
- The bound is attained: on the grid of step `2^(−m−3)` in `[−1, 1]²` with `M = 1` and `m ≤ 5`,
  the largest error times `4^m` is exactly `1`; for every `m` it is attained at `x = M/2^m`,
  `y = −x`, where `F − xy = −M²/4^m`. For `M = 1`, `m = 0`, `x = 1`, `y = −1`:
  `F = |0| − |1| − |−1| = −2` and `xy = −1`.
- The factor is `2M²`: with `u = (x + y)/2M`, `a = x/2M`, `b = y/2M` one has
  `xy = 2M²(u² − a² − b²)`. Yarotsky's formula (4) on p. 9 prints the factor `M²/8`, which gives
  `xy/16` in place of `xy`.
- `F(5M, 0) = 0` although `5M` is outside `[−M, M]`, as `F(x, 0) = 0` asserts for every `x`.

*Needs:* 1.1, 6.1, 6.2.

### Examples

`f_1` and `f_2` against `x²` on `[0, 1]`; the product network for `M = 1`, `m = 0`, where
`F(x, y) = |x + y| − |x| − |y|`.

### Dependencies

Layer 1 (1.1), Layer 5 (5.1). Mathlib `ConvexOn`.

## Downstream consumers

- Approximation rates of deep networks for smooth functions (Yarotsky's Theorem 1) consume 6.3 and
  the exact constructions of Layer 1.
- Lower bounds on the depth needed for continuous piecewise linear functions start from 3.2 and
  from the representation of 2.3.

## Scope and ownership

This roadmap owns the ReLU network specification `reluSpec` with the predicate `ReLUNetComputes`,
the exact representation theorem in both directions, the representation of Wang and Sun with its
convex case, the univariate counting of affine pieces and the one-hidden-layer representation,
the tent map with its iterates and Telgarsky's depth separation, and Yarotsky's approximation of
the square and of products.

Already in the libraries and therefore not targets:

- Multilayer perceptron specifications, their parameters and realization, and the coordinatewise
  ReLU layer, in Tau Ceti's neuromanifold library, the formalization of the roadmap
  Neuromanifolds, which places approximation outside its scope; `reluSpec` only fixes every
  hidden activation of an `MLPSpec` to the rectifier.
- Piecewise affine maps on finitely many convex polyhedra, their composition, pairing and
  continuity, and the cells of finite minima of affine functionals with the local piecewise
  linearity (`IsPLOn`) of those minima, in Tau Ceti's piecewise-linear topology for the roadmap
  GeometricTopology. This roadmap uses
  `IsPiecewiseAffineOn f univ` as its notion of a continuous piecewise linear function and
  introduces none of its own.
- Radon's theorem, ceiling logarithms and fractional parts, in Mathlib.

Boundaries with other roadmaps:

- UniversalApproximation (a roadmap not on main) treats density of one-hidden-layer
  networks for every non-polynomial continuous activation, ReLU included, and Barron's rate; its
  3.3 has a Check that, for the activation `|t|`, the units `|t − a|` with the constants give the
  continuous piecewise linear functions on a bounded interval. Statement 4.3 here is the exact representation on all of `ℝ` with a count of units,
  and no density theorem is stated here. Its one-hidden-layer network on `ℝ` with the rectifier
  computes the same functions as the networks of depth `2` here. This roadmap does not depend on
  that one.
- RobustnessCertificates (an open roadmap, not on main) bounds Lipschitz constants and output
  ranges of given networks, also on Tau Ceti's `MLPSpec`; it states nothing on pieces,
  representation or approximation. This roadmap does not depend on that one.
- PolynomialInterpolationAndBestApproximation (an open roadmap, not on main) treats polynomial
  interpolation; the piecewise linear interpolation error of `x²` in 6.1 is computed directly and
  not taken from it. This roadmap does not depend on that one.
- StatisticalLearningTheory (an open roadmap of another author, not on main) lists deep ReLU
  approximation and depth separation beyond its scope.

Outside the scope: networks of other activations and Telgarsky's semi-algebraic gates and decision
trees; multivariate depth separations (Eldan and Shamir) and the extension of 5.3 to `ℝ^d`; lower
bounds on the depth of exact representations (the conjecture of Hertrich, Basu, Di Summa and
Skutella) and width bounds for them; counts of linear regions in dimension two and more; the
smoothly parametrized hard families and zonotope constructions of Arora et al.; Yarotsky's
approximation of Sobolev balls and his lower bounds; VC dimension; training algorithms and their
complexity; density and approximation rates of shallow networks.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Analysis/Convex/Radon.lean`: `Convex.radon_partition` (an affinely dependent family has
  a partition of its index set whose two parts have intersecting convex hulls).
- `Mathlib/Data/Nat/Log.lean`: `Nat.clog` (the least `k` with `n ≤ b^k`), `Nat.le_pow_clog`
  (`1 < b → n ≤ b ^ clog b n`).
- `Mathlib/Algebra/Order/Floor/Defs.lean`: `Int.fract` (`y − ⌊y⌋`).
- `Mathlib/Data/Finset/Lattice/Fold.lean`: `Finset.sup'`
  (the maximum over a nonempty finite set).
- `Mathlib/Topology/Algebra/ContinuousAffineMap.lean`: `ContinuousAffineMap` (`E →ᴬ[ℝ] F`).
- `Mathlib/Analysis/Convex/Function.lean`: `ConvexOn`.
- `Mathlib/Topology/Baire/Lemmas.lean`: `dense_iUnion_interior_of_closed` (in a Baire space, a
  countable cover by closed sets has a dense union of interiors).
- `Mathlib/MeasureTheory/Integral/IntervalIntegral/Basic.lean`: `intervalIntegral`,
  `intervalIntegral.integral_mono_on` (monotonicity of the interval integral for integrable
  functions on `[a, b]`).
- `Mathlib/Logic/Function/Iterate.lean`: `Function.iterate_succ_apply'`.

### From Tau Ceti

- `TauCeti/Geometry/Neuromanifold/MLP/Basic.lean`: `TauCeti.Neuromanifold.MLPSpec` (widths
  `Fin (L + 1) → ℕ` and a scalar activation for each of the `L − 1` hidden layers);
  `MLPSpec.Parameters` (a weight matrix and a bias for each affine map);
  `MLPSpec.realize` (the last prefix of `h₀ = x`, `h_(i+1) = σ_(i+1)(W h_i + b)`, with the identity
  on the output layer); `MLPSpec.evalPrefix_succ`, `MLPSpec.realize_succ` (the output layer is
  affine in the last hidden prefix), `MLPSpec.layerActivation_castSucc`,
  `MLPSpec.realize_depth_zero` (depth `0` realizes the identity), `MLPSpec.realize_depth_one`
  (depth `1` realizes one affine map).
- `TauCeti/Geometry/Neuromanifold/Activation.lean`: `TauCeti.Neuromanifold.reluActivation`, the
  coordinatewise `t ↦ max 0 t`, whose scalar function is the activation of `reluSpec`.
- `TauCeti/Topology/PL/Map.lean`: `TauCeti.IsPiecewiseAffineOn f V` (finitely many convex
  polyhedra cover `V` and `f` agrees with a continuous affine map on `V` intersected with each);
  `isPiecewiseAffineOn_of_finite` (the same with any finite index type);
  `isPiecewiseAffineOn_continuousAffineMap`; `IsPiecewiseAffineOn.comp` (composition, given that
  the inner map sends `V` into the set of the outer one); `IsPiecewiseAffineOn.continuousOn`;
  `isPLOn_abs` and `not_exists_continuousAffineMap_eq_abs` (used in a Check).
- `TauCeti/Topology/PL/Product.lean`: `IsPiecewiseAffineOn.prodMk` (pairing of two piecewise
  affine maps on the same set).
- `TauCeti/Analysis/Convex/Polyhedron/Basic.lean`: `TauCeti.IsConvexPolyhedron` (the solution set
  of finitely many inequalities `g i x ≤ 0` with continuous affine `g i`),
  `isConvexPolyhedron_setOf_le`, `IsConvexPolyhedron.inter`.
- `TauCeti/Topology/PL/FiniteInf.lean`: `Finset.infCell` (the cell on which a fixed functional is
  least), `Finset.isConvexPolyhedron_infCell`, `Finset.subset_iUnion_infCell` (the cells of a
  nonempty family cover the space), `Finset.infAffine_eq_of_mem_infCell` (on its cell the minimum
  is that functional), `Finset.isPLOn_infAffine` (a finite minimum of continuous affine
  functionals is `IsPLOn` on the whole space).

## References

- Raman Arora, Amitabh Basu, Poorya Mianjy and Anirbit Mukherjee, *Understanding deep neural
  networks with rectified linear units*, ICLR 2018; arXiv:1611.01491v6. Definition, theorem,
  lemma, corollary, equation and page numbers above are those of that version.
- Christoph Hertrich, Amitabh Basu, Marco Di Summa and Martin Skutella, *Towards lower bounds on the
  depth of ReLU neural networks*, arXiv:2105.14835v5 (2024); numbers and pages of that version.
- Matus Telgarsky, *Benefits of depth in neural networks*, COLT 2016, PMLR 49; arXiv:1602.04485v2;
  numbers and pages of that version.
- Matus Telgarsky, *Deep learning theory lecture notes*, version 2021-10-27 (v0.0-e7150f2d),
  mjt.cs.illinois.edu/dlt; numbers and pages of that version.
- Dmitry Yarotsky, *Error bounds for approximations with deep ReLU networks*, Neural Networks 94
  (2017); arXiv:1610.01145v3, whose numbers and pages are used above.
- Attributions made in prose without a locator: Shuning Wang and Xusheng Sun (IEEE Transactions on
  Information Theory 51, 2005) for the representation by maxima of `n + 1` affine functions;
  Shuning Wang (IEEE Transactions on Circuits and Systems I 51, 2004) for differences of convex
  piecewise linear functions; Anirbit Mukherjee and Amitabh Basu (2017) for `max(0, x₁, x₂)`.

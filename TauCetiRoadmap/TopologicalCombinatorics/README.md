# Roadmap: topological combinatorics

**Summary.** Several theorems of combinatorics and discrete geometry are shadows of facts about
spheres and simplices: a labelling of a subdivided object that respects its boundary must contain
a cell whose labels are all different, or two neighbouring vertices whose labels cancel. This
roadmap builds the combinatorial lemmas of this kind, Sperner's lemma and Tucker's lemma, and
derives from them, without homology, Kneser's conjecture on the chromatic number of Kneser graphs,
the Borsuk–Ulam theorem and the ham sandwich theorem. All statements are about finite sets of
integer points, finite set systems, finite-dimensional real normed spaces and finite measures.

The headline theorems are these.

- *Sperner's lemma.* Subdivide the standard `n`-simplex into the `Nⁿ` small simplices of its
  `N`-th staircase subdivision, and label each grid point by the index of one of its positive
  coordinates. Then an odd number of small simplices carry all `n + 1` labels. In a form made for
  envy-free division of a cake: if each of `n + 1` agents labels the grid in this way, there are
  `n + 1` grid points, pairwise within one step in every coordinate, at which the agents, each at
  a point of its own, choose `n + 1` different labels.
- *Tucker's lemma.* If the nonzero sign vectors of length `n ≥ 1` are labelled by nonzero integers
  of absolute value less than `n`, antipodally, then two comparable sign vectors carry opposite
  labels. A second form labels the integer points of an `ℓ¹`-ball in `ℤⁿ` by `±1, …, ±n`,
  antipodally on its boundary, and finds two points within one step in every coordinate with
  opposite labels.
- *Kneser's conjecture (Lovász's theorem) and Dol'nikov's theorem.* For `k ≥ 1` and `n ≥ 2k − 1`,
  the graph on the `k`-subsets of an `n`-set, two subsets adjacent when disjoint, has chromatic
  number `n − 2k + 2`. More generally, if the disjointness graph of a family of nonempty subsets
  of a finite set can be coloured with `r` colours, then one can remove at most `r` points and
  2-colour the rest so that no member of the family avoiding the removed points is
  monochromatic.
- *Borsuk–Ulam and ham sandwich.* Every continuous map from a sphere of a real normed space to a
  finite-dimensional real normed space of smaller dimension takes equal values at two antipodal
  points. Consequently `d` finite measures on a `d`-dimensional real inner product space (`d ≥ 1`),
  each giving measure zero to every hyperplane, are bisected by a single hyperplane.

The roadmap builds on Mathlib's simple graphs and their colourings, on its finite-dimensional
normed spaces with spheres and their antipodal map, and on its measures. Tau Ceti's Brouwer
fixed-point theorem, which the roadmap KakutaniFixedPointAndContinuousGames consumes, is not
restated and not rederived. The Petersen graph of HamiltonianCycles and the Kneser graph used as
an example in SpectralGraphBounds are Kneser graphs in the sense defined here.

Layer 1 below proves Sperner's lemma on the staircase subdivision and its form with owners.
Layer 2 proves the two forms of Tucker's lemma. Layer 3 defines Kneser graphs and proves
Dol'nikov's theorem and Kneser's conjecture from the octahedral form of Tucker's lemma. Layer 4
proves the Borsuk–Ulam theorem from the lattice form of Tucker's lemma by compactness, and Layer 5
proves the ham sandwich theorem from it. Layers 1 and 2 depend on no other layer.

## Conventions

- **The subdivided simplex.** For `n N : ℕ`, the grid `simplexGrid n N` is the finite set of
  integer vectors `x : Fin (n + 1) → ℤ` with every `x i ≥ 0` and `∑ i, x i = N`; it is the
  `N`-th subdivision of the standard `n`-simplex, scaled by `N`. Coordinates are integers so that
  differences of grid points are grid vectors. The unit vectors are `Pi.single i 1`.
- **Staircase cells.** For a base point `v` and a permutation `σ` of `Fin n`, the cell `(v, σ)`
  has the `n + 1` vertices `kuhnVertex v σ t`, `t : Fin (n + 1)`: vertex `0` is `v`, and vertex
  `t + 1` is vertex `t` plus `e_j − e_(j+1)` with `j = σ t`, the indices `j` and `j + 1` read in
  `Fin (n + 1)`. Writing `zⱼ = x₀ + ⋯ + xⱼ` for `j < n`, the step adds `1` to `zⱼ` and leaves the
  other partial sums alone; so in the coordinates `z` the cells are the simplices
  `z, z + e_(σ 0), z + e_(σ 0) + e_(σ 1), …` of the Freudenthal triangulation of `ℝⁿ`, and the
  grid is the order simplex `0 ≤ z₀ ≤ ⋯ ≤ z_(n−1) ≤ N`. The cells of the subdivision,
  `kuhnCells n N`, are the pairs `(v, σ)` with `v` and every vertex in the grid. We call this the
  staircase or Kuhn subdivision.
- **Labels.** A labelling of the grid is any function `(Fin (n + 1) → ℤ) → Fin (n + 1)`; only its
  values on the grid matter. It is a Sperner labelling when every grid point `x` gets a label `i`
  with `x i ≠ 0`. Equivalently: no point of the facet `xᵢ = 0` of the simplex is labelled `i`, the
  form in which the condition is usually stated. A cell is fully labelled when its `n + 1`
  vertices carry `n + 1` different labels.
- **Signed sets.** A signed set on `Fin n` is a sign vector `X : Fin n → SignType`; its positive
  and negative parts are the coordinates equal to `1` and to `−1`. The order is `A ≤ B` when
  `B i = A i` wherever `A i ≠ 0`, that is `A⁺ ⊆ B⁺` and `A⁻ ⊆ B⁻`. The antipode `−X` is the
  coordinatewise negation, and `0` is the empty signed set.
- **The lattice cross-polytope.** For `m : ℕ`, its points are the `x : Fin n → ℤ` with
  `∑ i, |x i| ≤ m`, and its boundary sphere those with `∑ i, |x i| = m`. Two points are close when
  `|x i − y i| ≤ 1` for every `i`.
- **Labels of Tucker type** are integers. The statements carry the conditions "nonzero" and
  "absolute value below `n`" (or "at most `n`") as hypotheses on the points that matter, so that
  `±1, …, ±n` is written without a separate label type.
- **Kneser graphs.** For a family `𝓕 : Set (Finset α)`, `kneserGraphOf 𝓕` is the simple graph on
  the subtype `𝓕` in which `A` and `B` are adjacent when `A ≠ B` and `A`, `B` are disjoint.
  `kneserGraph α k` is the case of the `k`-subsets of `α`. The distinctness clause matters only
  for the empty set, which is disjoint from itself; with it, a family containing `∅` gives a
  loopless graph in which `∅` is adjacent to every other member. Chromatic numbers are Mathlib's
  `SimpleGraph.chromaticNumber`, valued in `ℕ∞`, and colourability is
  `SimpleGraph.Colorable G r`.
- **Spheres.** For a real normed space `E` and `r : ℝ`, the sphere is
  `Metric.sphere (0 : E) r` with Mathlib's antipodal negation `-x`. Its points are those of norm
  `r`, for the norm of `E`: for `EuclideanSpace ℝ (Fin (n + 1))` this is the round sphere, for
  `Fin (n + 1) → ℝ` with Mathlib's sup norm it is the boundary of a cube. The Borsuk–Ulam theorem
  below is stated for every norm, so either model may be used. For `r < 0` the sphere is empty and
  for `r = 0` it is `{0}`.
- **Dimensions** are `Module.finrank ℝ E`. Mathlib sets the rank of an infinite-dimensional space
  to `0`, so a hypothesis `finrank F < finrank E` forces `E` to be finite-dimensional but says
  nothing about `F`; the target space carries `[FiniteDimensional ℝ F]` explicitly.
- **Half-spaces and bisection.** For `a ≠ 0` in a real inner product space `E` and `b : ℝ`, the
  open half-spaces are `{x | inner ℝ a x < b}` and `{x | b < inner ℝ a x}`, and the hyperplane is
  `{x | inner ℝ a x = b}`. A measure is bisected when the two open half-spaces have equal measure.
  When the hyperplane has measure zero this is the same as equality for the closed half-spaces,
  and each side then has half the total mass. Measures are Mathlib's `Measure E` on a measurable
  space in which open sets are measurable (`OpensMeasurableSpace E`).

## Layer 1: Sperner's lemma on the staircase subdivision

### 1.1 The grid, the cells and Sperner labellings

Define `simplexGrid n N`, `kuhnVertex v σ t`, `kuhnCells n N`, `IsSpernerLabelling n N lab` and
`fullyLabelledCells n N lab` as in the Conventions. Their basic theory, proved here:

- Every step `e_j − e_(j+1)` preserves the coordinate sum, so the vertices of a cell with base
  point in the grid have coordinate sum `N`; a pair `(v, σ)` is a cell exactly when all its
  vertices have nonnegative coordinates.
- The `n + 1` vertices of a cell are distinct, and any two of them differ by at most one in every
  coordinate: in the coordinates `z` they differ by a vector of zeros and ones, and each
  coordinate of `x` is a difference of two consecutive partial sums.
- Different pairs `(v, σ)` give different vertex sets, and the cells form a triangulation of the
  scaled simplex: their union is the simplex and two of them meet in a common face. In the
  coordinates `z` this is the statement that the order simplex `0 ≤ z₀ ≤ ⋯ ≤ z_(n−1) ≤ N` is cut
  into Freudenthal simplices by the hyperplanes `zⱼ ∈ ℤ` and `zᵢ − zⱼ ∈ ℤ`, all of which belong to
  the Freudenthal arrangement, together with the elementary fact that the Freudenthal simplices
  triangulate `ℝⁿ`.
- There are `Nⁿ` cells. Removing one vertex of a cell gives a face that lies in exactly two
  cells, or in exactly one cell when all its vertices lie on a common facet `xᵢ = 0`. The faces of
  cells whose `n` vertices all have last coordinate zero are, after dropping that coordinate,
  exactly the cells of the subdivision of dimension `n − 1` with the same `N`.
- *Owners.* For a grid point `x` let `own x = ∑ i, (n − i) · x i` modulo `n + 1`, which is the sum
  of the partial sums `zⱼ`. Along a cell each step raises it by one, so the `n + 1` vertices of a
  cell have `n + 1` different owners.

**Checks.**
- For `n = 2` and `N = 2` the grid has six points and there are `4 = 2²` cells; for `N = 3` there
  are `9`, and for `n = 3`, `N = 2` there are `8`. For `n = 1` the cells are the `N` unit segments.
- The cell with base `(0, 0, 2)` and `σ` the transposition of `0` and `1` has the vertices
  `(0, 0, 2)`, `(0, 1, 1)`, `(1, 0, 1)`; their owners `2·x₀ + x₁` modulo `3` are `0, 1, 2`.
- For `n = 0` the grid is the single point `(N)`, there is one cell, and a Sperner labelling exists
  only for `N ≥ 1`. For `N = 0` and any `n` the grid is `{0}`, at which no label is allowed, so no
  Sperner labelling exists and the theorems below hold vacuously.

*Needs:* Mathlib `Fintype.piFinset`, `Finset.Icc`, `Pi.single`, `Equiv.Perm`. (Proved here.)

### 1.2 Sperner's lemma

Prove `odd_card_fullyLabelledCells`: for every Sperner labelling of `simplexGrid n N`, the number
of fully labelled cells is odd (Su, §2, statement of Sperner's lemma, p. 3, for every
triangulation of a simplex, with the proof by counting doors on pp. 3–5; the statement here is the
case of the staircase subdivision, whose triangulation property is 1.1).

Route: induction on `n`. Call a face of a cell a door when it carries exactly the labels
`0, …, n − 1`. A cell has one door if it is fully labelled, and zero or two doors otherwise. A door
lies in two cells unless it lies on a facet `xᵢ = 0` of the simplex; by the Sperner condition such
a door lies on the facet `x_n = 0`, where the labelling restricted to the cells of 1.1 is a Sperner
labelling of the subdivision of dimension `n − 1`, so by induction the number of boundary doors is
odd. Counting pairs (cell, door) in two ways gives the parity. For `n = 0` the only cell is the
point `(N)`, fully labelled.

**Checks.**
- For `n = 2`, `N = 2`, label each grid point by the least index of a positive coordinate. Exactly
  one cell is fully labelled, the one with vertices `(0, 0, 2)`, `(0, 1, 1)`, `(1, 0, 1)` carrying
  the labels `2, 1, 0`. The same labelling has exactly one fully labelled cell for `n = 2`,
  `N = 3, 4` and for `n = 3`, `N = 3`.
- The Sperner condition is needed at every point. On the grid for `n = 2`, `N = 2`, give
  `(0, 1, 1)` and `(0, 2, 0)` the label `1` and the four other points the label `0`: only
  `(0, 0, 2)` violates the condition, and no cell is fully labelled, so the count `0` is even.
- Exhaustively, over all Sperner labellings, the count is odd for `n = 1`, `N ≤ 5`; for `n = 2`,
  `N ≤ 4` (8, 192 and 13824 labellings for `N = 2, 3, 4`); for `n = 3`, `N ≤ 2` (64 for
  `N = 2`); and for `n = 4`, `N = 2` (1024).

*Needs:* 1.1. (Proved here, following the cited route.)

### 1.3 Sperner's lemma with owners

Prove `exists_close_bijective_labels`: let `L p`, for `p : Fin (n + 1)`, be `n + 1` Sperner
labellings of `simplexGrid n N`. Then there are grid points `x p`, one for each `p`, with
`|x p i − x q i| ≤ 1` for all `p, q, i`, such that `p ↦ L p (x p)` is a bijection of `Fin (n + 1)`.
(Proved here; Su, §3, pp. 5–7, uses the same device on a subdivision of the triangle whose
vertices are assigned owners so that every small triangle has three different owners, and §4,
pp. 7–8, on iterated barycentric subdivisions.)

Route: the labelling `x ↦ L (own x) x`, with the owner `own x` of 1.1, is a Sperner labelling,
since each `L p` is. By 1.2 it has a fully labelled cell. Its vertices have distinct owners
(1.1), so for each `p` exactly one vertex `x p` has owner `p`, and `p ↦ L p (x p)` is the
composite of two bijections. Any two vertices of a cell are close (1.1).

The case of a single labelling, `L p = lab` for all `p`, gives `n + 1` pairwise close grid points
carrying all labels; this is the form in which a limit argument over finer and finer subdivisions
uses Sperner's lemma: scaled by `1/N`, the points lie within `1/N` of each other in every
coordinate.

**Checks.**
- For `n = 1`, `N = 1, 2, 3`, and `n = 2`, `N = 1, 2`, every family of `n + 1` Sperner labellings
  (all of them for `n = 1`, all 512 for `n = 2`, `N = 2`) has such points.
- For `n = 2`, `N = 2`, with every agent using the labelling by the least positive coordinate of
  1.2, the fully labelled cell `(0, 0, 2)`, `(0, 1, 1)`, `(1, 0, 1)` has owners `0, 1, 2` and
  labels `2, 1, 0`, so agent `p` takes the vertex with owner `p` and the labels are distinct.

*Needs:* 1.1, 1.2. (Proved here.)

### Examples

The grids for `n = 1, 2, 3` with `N ≤ 4`, their cells and owners; the labelling by the least
positive coordinate, with its unique fully labelled cell.

### Dependencies

Mathlib `Fintype.piFinset`, `Finset.Icc`, `Pi.single`, `Equiv.Perm`, `Function.Bijective`. No
other layer.

## Layer 2: Tucker's lemma

### 2.1 The octahedral Tucker lemma

Prove `octahedral_tucker`: let `n ≥ 1` and let `lab` assign to every nonzero sign vector
`X : Fin n → SignType` an integer with `lab X ≠ 0`, `|lab X| < n` and `lab (−X) = −lab X`. Then
there are signed sets `A ≠ 0` and `B` with `A ≤ B` and `lab A = −lab B` (Ziegler, Lemma 4.1,
p. 5, stated for every `n`; for `n = 0` there is no nonzero sign vector and the conclusion fails,
so `n ≥ 1` is assumed). Such `A` and `B` are distinct, since a label is nonzero.

Route: the nonzero sign vectors are the vertices of the barycentric subdivision of the boundary of
the cross-polytope in `ℝⁿ`, an `(n − 1)`-sphere; two of them span an edge exactly when they are
comparable (Matoušek, §2, p. 2). Tucker's lemma for this triangulation with labels
`±1, …, ±(n − 1)` is Prescott–Su, the statement of Tucker's lemma on p. 258, proved as Theorem 2,
p. 264, for every symmetric triangulation of the sphere aligned with a flag of hemispheres; a
refinement of the octahedral subdivision is aligned with hemispheres (remarked on p. 264; the
flag is written out in the route of 2.2, one dimension lower here, and applies since every
simplex of the barycentric subdivision lies in a closed orthant). The proof is a path-following
argument over almost-alternating simplices and uses no topology.

**Checks.**
- The bound on the labels cannot be raised to `|lab X| ≤ n`: label `X` by `±(i + 1)`, where `i` is
  the first coordinate with `X i ≠ 0` and the sign is that of `X i`. This is antipodal. If `A ≤ B`
  then the first nonzero coordinate of `B` is at or before that of `A`; if it is before, the
  labels differ in absolute value, and if it is the same, the signs agree, so no pair is
  complementary.
- For `n = 1` no labelling exists (no nonzero integer has absolute value below `1`), so the lemma
  holds vacuously. An exhaustive search over all antipodal labellings confirms the lemma for
  `n = 2` and `n = 3`, and finds labellings with no complementary pair for `n = 2, 3` when labels
  up to `±n` are allowed.
- For `n ≤ 5` it was checked mechanically that the chains of nonzero sign vectors are the
  simplices of a complex each lying in a closed orthant, and that the flag `H_d`, `d < n`, of 2.2
  (coordinates `u₀, …, u_(n−1)`) gives subcomplexes of dimension `d` and Euler characteristic `1`
  with boundary `H_(d−1) ∪ −H_(d−1)`, and `H_(n−1) ∪ −H_(n−1)` is the whole complex.

*Needs:* Mathlib `SignType`. (Ziegler, Lemma 4.1, statement; proof from Prescott–Su, Theorem 2.)

### 2.2 Tucker's lemma on the lattice cross-polytope

Prove `lattice_tucker`: let `m : ℕ` and let `lab` assign to every integer point `x` with
`∑ i, |x i| ≤ m` an integer with `lab x ≠ 0` and `|lab x| ≤ n`, such that `lab (−x) = −lab x`
whenever `∑ i, |x i| = m`. Then there are two such points `x`, `y`, close (`|x i − y i| ≤ 1` for
every `i`), with `lab x = −lab y`. For `n = 0` no labelling exists, and for `m = 0` the point `0`
lies on the boundary sphere and would need `lab 0 = −lab 0`, so the statement holds vacuously in
both cases. (Proved here from Prescott–Su, Theorem 2, p. 264; this is Tucker's lemma for special
triangulations of the octahedral ball, Matoušek, Lemma 2.1, p. 2, applied to one explicit
triangulation.)

Route: triangulate the ball `∑ |xᵢ| ≤ m` as follows. On the closed orthant with sign vector `s`,
the map `x ↦ y`, `y_k = ∑_(j ≥ k) |x_j|`, is linear and carries the orthant's part of the ball
onto the order simplex `m ≥ y₀ ≥ ⋯ ≥ y_(n−1) ≥ 0`; pull back its Freudenthal triangulation, as in
1.1. On the face shared by two orthants the two linear maps agree, and they carry each facet
`x_k = 0` onto the face `y_k = y_(k+1)` (`y_(n−1) = 0` for `k = n − 1`), which lies in the
Freudenthal arrangement and so is a union of Freudenthal faces; hence both orthants induce the
same triangulation on the shared face, and the pieces fit into a triangulation `T` of the ball
with `2ⁿ mⁿ` top simplices. Its vertices are the integer points of the ball; it refines the
orthant decomposition and is symmetric under `x ↦ −x`; and two vertices of one simplex lie in a
common closed orthant and have values of `y` differing by a vector of zeros, or of zeros and
minus ones, so they are close. Glue `T` to a second copy along the boundary sphere, the
second copy labelled at the image of `x` by `−lab (−x)`; this is consistent on the boundary
because `lab` is antipodal there. Sending `x` in the first copy to `(x, m − ∑ |xᵢ|)` and in the
second to `(x, −(m − ∑ |xᵢ|))` places the result on the `ℓ¹`-sphere of radius `m` in
`ℝ^(n+1)`, linearly on each simplex. The result is a symmetric triangulation of the
`n`-sphere refining the octahedral subdivision with an antisymmetric labelling by `±1, …, ±n`
(the radial projection `u ↦ u / ‖u‖₂`, an odd homeomorphism, makes it one of the unit sphere).
It is aligned with hemispheres, that is (Prescott–Su, p. 259), it has a flag of hemispheres with
each `H_d` contained in its `d`-skeleton: with coordinates `u₀, …, u_n` on `ℝ^(n+1)`, let `H_d` be
the points of the sphere with `u_(d+1) = ⋯ = u_n = 0` and `u_d ≥ 0`. Then `H_(d−1) ⊆ H_d`, `H₀` is
one point, `H_d ∩ −H_d = H_(d−1) ∪ −H_(d−1)`, and `H_n ∪ −H_n` is the sphere; the radial
projection carries `H_d` onto a closed hemisphere of the unit `d`-sphere of the subspace
`u_(d+1) = ⋯ = u_n = 0`, so `H_d` is a `d`-ball bounded by `H_d ∩ −H_d`. Every simplex lies in a
closed orthant of `ℝ^(n+1)`, so each coordinate has constant sign on it, and its intersection
with `H_d` is a face of it (where the coordinates `u_(d+1), …, u_n`, and `u_d` if it is negative
somewhere, vanish). That face lies in one closed orthant of the coordinate subspace
`u_(d+1) = ⋯ = u_n = 0`, on the `d`-dimensional face of the cross-polytope there, so `H_d` is a
union of simplices of dimension at most `d`: a subcomplex contained in the `d`-skeleton.
Prescott–Su, Theorem 2, gives a complementary edge. If the edge lies in the second copy, its
antipodal edge lies in `T` and is complementary too. An edge of `T` joins two close points.

**Checks.**
- The triangulation `T` was checked mechanically for `n ≤ 3`, `m ≤ 3` (`n = 3` with `m ≤ 2`):
  there are `2ⁿ mⁿ` top simplices, every face of codimension one lies in two of them or, exactly
  when it lies on the boundary sphere, in one; `T` is symmetric; every simplex lies in a closed
  orthant; any two vertices of a simplex are close.
- The glued triangulation was checked mechanically for `n ≤ 2`, `m ≤ 4`; `n = 3`, `m ≤ 3`;
  `n = 4`, `m ≤ 2`: it is symmetric, every face of codimension one lies in two top simplices, the
  Euler characteristic is `1 + (−1)ⁿ`, every simplex lies in a closed orthant of `ℝ^(n+1)`, and for
  each `d` the simplices with all vertices in `H_d` form a pure `d`-dimensional complex of Euler
  characteristic `1` that covers `H_d` (its projection to `u₀, …, u_(d−1)` has volume
  `2ᵈ mᵈ / d!`) and whose boundary is `H_(d−1) ∪ −H_(d−1)`. Every antipodal labelling by
  `±1, …, ±n` has a complementary edge for `n = 1`, `m ≤ 4`; `n = 2`, `m ≤ 2`; `n = 3`, `m = 1`.
- The label bound cannot be raised to `n + 1`: for `n = 1`, `m = 2`, the labels `1, 1, 2, −1, −1`
  at `−2, −1, 0, 1, 2` are antipodal at `±2`, and no two consecutive points carry opposite labels.
- An exhaustive search over antipodal labellings finds no labelling without a complementary close
  pair for `n = 1`, `m ≤ 3`; `n = 2`, `m ≤ 3`; `n = 3`, `m ≤ 2`.
- For `n = 1` the lemma is the discrete intermediate value theorem: the labels `±1` at `−m` and
  `m` are opposite, so the sign changes between two consecutive integers.

*Needs:* Mathlib `Finset.sum`, `abs`. (Proved here, from Prescott–Su, Theorem 2, by the route
above.)

### Examples

The barycentric subdivision of the boundary of the square (`n = 2`): eight vertices
`(±1, 0), (0, ±1), (±1, ±1)` forming an octagon; with labels `±1` antipodal, some comparable pair,
an edge of the octagon, has opposite labels. The triangulation `T` of the lattice diamond
`|x₀| + |x₁| ≤ 2`, with 16 triangles.

### Dependencies

Mathlib `SignType`, `Finset.sum`. No other layer.

## Layer 3: Kneser graphs

### 3.1 Kneser graphs

Define `kneserGraphOf 𝓕` and `kneserGraph α k` as in the Conventions. Basic facts, proved here:
`kneserGraph α 1` is isomorphic to the complete graph on `α`; for `|α| ≤ 2k − 1` and `k ≥ 1`,
`kneserGraph α k` has no edge; for `k ≥ 1`, `kneserGraph α k` is regular of degree `binom(n − k, k)`
with `n = |α|` (for `k = 0` its one vertex has degree `0`); an injection `α ↪ β` induces an
embedding of `kneserGraph α k` into `kneserGraph β k`.

**Checks.**
- `kneserGraph (Fin 5) 2` has 10 vertices, is 3-regular and is the Petersen graph; its chromatic
  number is `3 = 5 − 4 + 2`.
- `kneserGraph (Fin 7) 3` has 35 vertices, is 4-regular, and has chromatic number
  `3 = 7 − 6 + 2`.
- For `k = 0` the graph has the single vertex `∅` and no edge, although `∅` is disjoint from
  itself: the clause `A ≠ B` removes the loop.

*Needs:* Mathlib `SimpleGraph`, `Disjoint`, `Finset.card`. (Proved here.)

### 3.2 Dol'nikov's theorem

Prove `dolnikov`: let `α` be finite and `𝓕` a family of nonempty finite subsets of `α`. If
`kneserGraphOf 𝓕` is `r`-colourable, then there are a set `Y` of at most `r` points and a map
`c : α → Bool` such that every member of `𝓕` disjoint from `Y` contains two points with different
values of `c`. In the language of the source, the 2-colourability defect `cd₂ 𝓕`, the least
number of points whose removal leaves a 2-colourable restriction of `𝓕`, is at most the
chromatic number of the Kneser graph (Ziegler, Theorem 4.2 with its combinatorial proof, p. 5,
and the definition of the colourability defect, p. 3). The source's hypergraphs have members of
size at least two (its §2, p. 2); the statement here allows singletons, and the source's proof
applies to them unchanged. Members must be nonempty: the family `{∅}` has a 1-colourable Kneser
graph, and no `Y` and `c` exist, since `∅` avoids every `Y` and contains no two points.

Route (Ziegler's proof). Suppose `c` is a proper colouring with colours `1, …, m` and the
conclusion fails for `r = m`. If `m ≥ |α|` take `Y = α`, which no nonempty member avoids; so
`m < |α| = n`, and `n ≥ 1`. Fix a linear order on the finite subsets of `α`. Label a nonzero
signed set `(A⁺, A⁻)` on `α` as follows. If `|A⁺| + |A⁻| ≥ n − m`, then the complement `Y` of
`A⁺ ∪ A⁻` has at most `m` points, so by assumption the colouring "`A⁺` versus `A⁻`" leaves some
member of `𝓕` inside `A⁺` or inside `A⁻`; take the least such member `S` and the label `±c(S)`,
with the sign of the part containing `S`. Otherwise take the label `±(m + |A⁺| + |A⁻|)`, with the
sign of the nonempty part, or of the smaller part in the chosen order when both are nonempty. The
labels are nonzero, of absolute value at most `n − 1`, and antipodal, so 2.1 gives `A ≤ B`, with
`A ≠ B`, and opposite labels. Then `|A⁺ ∪ A⁻| < |B⁺ ∪ B⁻|`, which excludes the second case for
both, so the labels come from members `S ⊆ A⁺ ⊆ B⁺` and `T ⊆ B⁻` of the same colour. As `B⁺` and
`B⁻` are disjoint, so are `S` and `T`, and `S ≠ T` since both are nonempty: two adjacent vertices
of the same colour.

**Checks.**
- For the `k`-subsets of an `n`-set with `1 ≤ k` and `2k − 1 ≤ n`, the least size of such a `Y`
  is `n − 2k + 2`: a 2-colouring of the remaining points has no monochromatic `k`-set exactly when
  each colour class has at most `k − 1` points. Computed for `n ≤ 6`.
- Exhaustively, for every family of nonempty subsets of a set of at most 3 points, and every
  family of at most 9 nonempty subsets of a 4-point set (27824 families), the chromatic number of
  the Kneser graph is at least the least size of `Y`.

*Needs:* 2.1, 3.1; Mathlib `SimpleGraph.Colorable`, `SimpleGraph.Coloring`. (Ziegler,
Theorem 4.2, with the extension to singletons proved here.)

### 3.3 Kneser's conjecture

Prove `chromaticNumber_kneserGraph`: for `k ≥ 1` and `2k ≤ n + 1`, where `n = Fintype.card α`,
the chromatic number of `kneserGraph α k` is `n + 2 − 2k` (Matoušek, abstract and §§1–2, pp. 1–3,
for `n ≥ 2k ≥ 2`, and Ziegler, introduction and Lemmas 3.1 and 3.2, pp. 1–4; Lovász, 1978, as both
attribute it). The natural-number subtraction does not truncate, since `2k ≤ n + 1 < n + 2`.

Route. Upper bound: number the points of `α` as `1, …, n` and colour a `k`-set `S` by
`min(min S, n − 2k + 2)`. Two sets with the same colour `i ≤ n − 2k + 1` both contain `i`; two
sets with colour `n − 2k + 2` lie in the last `2k − 1` points and so meet (Ziegler, Lemma 3.1 with
`r = 2`, `s = 1`, p. 4, stated there for `k ≥ 2` and `n ≥ 2k`; the argument is the same for
`k = 1` and for `n = 2k − 1`). Lower bound: if the graph is `r`-colourable, 3.2 gives `Y` with
`|Y| ≤ r` and a 2-colouring of the other `n − |Y|` points with no monochromatic `k`-set, so each
colour class there has at most `k − 1` points and `n − |Y| ≤ 2k − 2`. Hence `r ≥ n − 2k + 2`.
Matoušek, §2, derives the lower bound directly from Tucker's lemma by the same kind of labelling.

**Checks.**
- `k = 1`: the complete graph on `n` points, chromatic number `n`.
- `n = 2k − 1`: no edge and at least one vertex, chromatic number `1`.
- Both hypotheses are needed: for `k = 0` the graph has one vertex and chromatic number `1`, not
  `n + 2`; for `n = 2`, `k = 2` it has one vertex, chromatic number `1`, while `n + 2 − 2k = 0`.
- Computed for all `n ≤ 7` and `k` with at most 40 vertices: the chromatic numbers agree with
  `n − 2k + 2` (for instance `4` for `n = 6`, `k = 2`, and `5` for `n = 7`, `k = 2`).

*Needs:* 3.1, 3.2; Mathlib `SimpleGraph.chromaticNumber`, `SimpleGraph.Coloring.mk`,
`SimpleGraph.chromaticNumber_eq_iff_colorable_not_colorable`. (Upper bound proved here; lower
bound from 3.2.)

### Examples

The Petersen graph `kneserGraph (Fin 5) 2` with the colouring of 3.3 (colours `1, 2, 3` by least
element, capped at `3`); `kneserGraph (Fin 6) 2`, of chromatic number `4`; the family of
2-subsets of `Fin 4` containing a fixed point, whose Kneser graph has no edge.

### Dependencies

2.1; Mathlib `SimpleGraph`, `SimpleGraph.Colorable`, `SimpleGraph.Coloring`,
`SimpleGraph.chromaticNumber`. No other layer.

## Layer 4: the Borsuk–Ulam theorem

### 4.1 The Borsuk–Ulam theorem

Prove `borsuk_ulam`: let `E` and `F` be real normed spaces with `F` finite-dimensional and
`finrank F < finrank E`, and let `r ≥ 0`. Every continuous `f` from the sphere
`Metric.sphere (0 : E) r` to `F` has a point `x` with `f (−x) = f x` (Prescott–Su, p. 258, states
it for maps from the round sphere `Sⁿ` to `ℝⁿ` and calls the derivation from Tucker's lemma
relatively easy; the statement here, for every norm and every target of smaller dimension, is
proved here).

Route.
1. *Ball form.* Let `f` be continuous on the `ℓ¹`-ball `B = {x ∈ ℝⁿ : ∑ |xᵢ| ≤ 1}` with values in
   `ℝⁿ` and `f (−x) = −f x` on its boundary sphere. Then `f` has a zero. Otherwise
   `ε = min over B of max over i of |fᵢ x|` is positive, by compactness, and by uniform continuity
   there is `m` with `max over i of |fᵢ x − fᵢ y| < ε` whenever every coordinate of `x − y` is at
   most `1/m` in absolute value. Label each integer point `z` with `∑ |zᵢ| ≤ m` by `±(i + 1)`, where
   `i` is the least index with `|fᵢ (z/m)|` maximal and the sign is that of `fᵢ (z/m)`, which is
   nonzero. On the boundary `f` is odd, so the labelling is antipodal there, and 2.2 gives close
   points `z`, `w` with labels `i + 1` and `−(i + 1)`: then `fᵢ (z/m) ≥ ε` and `fᵢ (w/m) ≤ −ε`,
   a difference of at least `2ε`, against uniform continuity.
2. *Round sphere.* For `f` continuous on the unit sphere of `EuclideanSpace ℝ (Fin (n + 1))` with
   values in `ℝⁿ`, set `g u = f u − f (−u)`, which is odd, and let `h x` be `(x, 1 − ∑ |xᵢ|)`
   divided by its Euclidean norm, which is never zero. Then `h` maps `B` continuously into the
   sphere, and on the boundary of `B` it is odd. So `g ∘ h` satisfies the hypotheses of step 1,
   and a zero `x` gives `f (h x) = f (−h x)`. For `n = 0` the target is a point.
3. *General spaces.* If `r = 0` the sphere is `{0}` and `x = 0` works. If `r > 0`, let
   `d = finrank E`, so `d ≥ 1` and `E` is finite-dimensional; a continuous linear equivalence
   `L : E ≃L ℝ^d` (Mathlib `ContinuousLinearEquiv.ofFinrankEq` with the Euclidean space) and the
   radial map `x ↦ L x / ‖L x‖` give an odd homeomorphism from `Metric.sphere (0 : E) r` onto the
   unit sphere of `EuclideanSpace ℝ (Fin d)`, with inverse `u ↦ r • L⁻¹ u / ‖L⁻¹ u‖`. Compose `f`
   with it and with an injective linear map `F → ℝ^(d − 1)`, which exists since
   `finrank F ≤ d − 1`; equal values after the injection are equal values in `F`.

**Checks.**
- The dimension condition is needed: the inclusion of the unit circle into `ℝ²` (equal
  dimensions) has `f (−x) = −x ≠ x` everywhere.
- `F` must be finite-dimensional: for `F` infinite-dimensional Mathlib's `finrank F` is `0`, so
  the inequality holds for `E = ℝ²`, and a linear injection of `ℝ²` into `F` restricted to the
  circle separates every antipodal pair.
- `r ≥ 0` is needed: for `r < 0` the sphere is empty.
- On the unit circle, `f (x₀, x₁) = x₀` takes equal values exactly at the antipodal pair
  `(0, ±1)`. On the cube boundary `‖x‖ = 1` of `Fin 2 → ℝ` with the sup norm, the same map takes
  equal values at the antipodal points `(0, ±1)`, which lie on that sphere as well.

*Needs:* 2.2; Mathlib `Metric.sphere`, its `InvolutiveNeg` instance and `coe_neg_sphere`,
`IsCompact.exists_isMinOn`, `CompactSpace.uniformContinuous_of_continuous`,
`ContinuousLinearEquiv.ofFinrankEq`, `EuclideanSpace`, `Module.finrank`. (Proved here.)

### Examples

The ball form for `n = 1`: a continuous function on `[−1, 1]` with `f (−1) = −f 1` has a zero,
the intermediate value theorem. A continuous map from the round 2-sphere to the plane, such as a
temperature and pressure pair on the Earth's surface, agrees at some antipodal pair.

### Dependencies

2.2; Mathlib `Metric.sphere`, `InvolutiveNeg`, `IsCompact.exists_isMinOn`,
`CompactSpace.uniformContinuous_of_continuous`, `ContinuousLinearEquiv.ofFinrankEq`,
`EuclideanSpace`. No other layer.

## Layer 5: the ham sandwich theorem

### 5.1 The ham sandwich theorem

Prove `ham_sandwich`: let `E` be a real inner product space of dimension `d = finrank E ≥ 1`, with
a measurable structure in which open sets are measurable, and let `μ₀, …, μ_(d−1)` be finite
measures on `E` each giving measure zero to every hyperplane `{x | inner ℝ a x = b}` with `a ≠ 0`.
Then there are `a ≠ 0` and `b` with `μᵢ {x | inner ℝ a x < b} = μᵢ {x | b < inner ℝ a x}` for every
`i` (Roldán-Pensado–Soberón, Theorem 1.2.2, p. 4, for absolutely continuous finite measures on
`ℝᵈ`, with the remark before it, p. 4, that measure zero on hyperplanes suffices, and the proof
from Borsuk–Ulam on p. 5; the statement for every finite-dimensional inner product space and the
degenerate case below are proved here).

Route. Apply 4.1 to the unit sphere of `E × ℝ` (Mathlib's product norm `max ‖a‖ |b|`) and the
target `Fin d → ℝ`, of dimension `d < d + 1`. For `(a, b)` on the sphere let `fᵢ (a, b)` be the
real number `μᵢ {x | b < inner ℝ a x}`. Each `fᵢ` is continuous: along a sequence `(aₙ, bₙ)` tending
to `(a, b)` the indicators of the open half-spaces converge at every `x` off the hyperplane
`inner ℝ a x = b` when `a ≠ 0`, a null set, and at every `x` when `a = 0` (then `|b| = 1` and the
limit set is empty or everything); the measures are finite, so dominated convergence for lower
integrals applies, and sequences suffice on a metric space. Borsuk–Ulam gives `(a, b)` with
`fᵢ (−a, −b) = fᵢ (a, b)`, that is `μᵢ {inner ℝ a x < b} = μᵢ {b < inner ℝ a x}`, the values being
finite. If `a ≠ 0` this is the conclusion. If `a = 0`, then `b = ±1` and the equation says
`μᵢ E = 0` for every `i`; all measures vanish, and any `a ≠ 0`, which exists as `d ≥ 1`, with any
`b` works. The source's proof passes over this case, asserting that the point found is never one
of the two poles.

**Checks.**
- In dimension `1`, for `μ = 2δ₀ + δ₁`, which charges the hyperplanes `{0}` and `{1}`, no `b`
  bisects: for `a = 1` the pairs of masses below and above `b` are `(0, 3)` for `b < 0`, `(0, 1)`
  at `b = 0`, `(2, 1)` for `0 < b < 1`, `(2, 0)` at `b = 1` and `(3, 0)` for `b > 1`, and `a < 0`
  exchanges the sides. So the hyperplane condition is needed.
- In dimension `1`, Lebesgue measure restricted to `[0, ∞)` gives points measure zero and is
  infinite: one side of every point `b` has finite measure and the other infinite. So finiteness
  is needed.
- For `d = 0` there is no `a ≠ 0`, so `d ≥ 1` is needed. If all `μᵢ` are zero, every hyperplane
  bisects.
- In dimension `1` the theorem says that a finite measure without atoms has a median `b` with
  equal mass on the two sides; for Lebesgue measure on `[0, 1]`, `b = 1/2`.
- Fewer than `d` measures are bisected by adding zero measures.

*Needs:* 4.1; Mathlib `Measure`, `IsFiniteMeasure`, `OpensMeasurableSpace`, `inner`,
`MeasureTheory.tendsto_lintegral_filter_of_dominated_convergence`, the product normed space
`E × ℝ`. (Proved here, following the cited route.)

### Examples

Two uniform measures on discs in the plane with distinct centres are bisected by the line through
the centres; three point clouds smoothed into small balls in space are bisected by one plane.

### Dependencies

4.1; Mathlib `Measure`, `IsFiniteMeasure`, `OpensMeasurableSpace`, `inner`,
`MeasureTheory.tendsto_lintegral_filter_of_dominated_convergence`. No other layer.

## Downstream consumers

- Fair division: existence of envy-free divisions of a cake among hungry agents with closed
  preferences is a limit, over `N → ∞`, of 1.3 with `L p` the choice of agent `p` at a cut-set,
  as in Su, §§3–4; the owners of 1.1 replace the iterated barycentric subdivision there.
- Lower bounds for chromatic numbers of set systems through 3.2, and Schrijver's stable Kneser
  graphs, which need a stronger form of 2.1 (Ziegler, §8).
- Mass partitions beyond bisection, which rest on 4.1 or on its generalisations to other group
  actions (Roldán-Pensado–Soberón, §1.3).

## Scope and ownership

This roadmap owns: the staircase subdivision of the simplex, Sperner labellings and Sperner's
lemma in the forms of 1.2 and 1.3; the octahedral and lattice forms of Tucker's lemma; Kneser
graphs of set families and of `k`-subsets, Dol'nikov's theorem and Kneser's conjecture; the
Borsuk–Ulam theorem; the ham sandwich theorem.

Already in the libraries and therefore not targets:

- Mathlib's simple graphs, colourings and chromatic numbers, used as they are.
- Mathlib's `IsAntichain.sperner`, Sperner's theorem on antichains of subsets, is a different
  result with the same name; nothing here concerns antichains.
- Tau Ceti's Brouwer fixed-point theorem (`TauCeti.brouwerFixedPoint_compactConvex_continuousOn`).
  It is not restated, and Sperner's lemma is not used here to rederive it.
- Tau Ceti's Tucker theorem of the alternative for linear inequalities
  (`TauCeti.exists_nonneg_sum_smul_eq_zero_and_forall_coeff_add_dual_pos`) is a theorem of linear
  algebra by a different Tucker statement, unrelated to the combinatorial lemma of Layer 2.
- AlgebraicTopology uses singular homology of spheres and real projective spaces and
  records the degree `−1` of the antipodal map of `S²` among its examples (for instance in 8.5).
  Layer 4 does not use homology and states nothing about degrees.

Left to other roadmaps:

- KakutaniFixedPointAndContinuousGames, Layer 4, proves the lemma of Knaster, Kuratowski and
  Mazurkiewicz and its form due to Fan from Brouwer's theorem, and names Sperner's lemma outside
  its scope. Sperner's lemma here is a statement about finite labelled grids, not about closed
  covers, and neither roadmap uses the other.
- HamiltonianCycles, 1.2, defines the Petersen graph in prose as the graph on the 2-subsets of a
  5-set with disjoint subsets adjacent, which is `kneserGraph (Fin 5) 2`; SpectralGraphBounds, 3.2,
  uses the graph on the 3-subsets of a 7-set as an example of Hoffman's ratio bound. Neither
  declares a Kneser graph, and nothing of theirs is restated here.

Outside the scope: necklace splitting, whose discrete form needs a rounding argument from the
continuous splitting that this roadmap does not specify; Schrijver's theorem and the
`Zₚ`-Tucker lemma; Fan's combinatorial lemma; Kneser hypergraphs; the Lusternik–Schnirelmann–Borsuk
covering theorem; the equivalence of Borsuk–Ulam with its other classical forms; Sperner's lemma
for arbitrary triangulations and polytopal subdivisions; every algorithm or path-following
procedure as a target.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Data/Fintype/Pi.lean` (with `Mathlib/Data/Fintype/BigOperators.lean`):
  `Fintype.piFinset` (the finite set of functions with values in given finite sets).
  `Mathlib/Order/Interval/Finset/Defs.lean`: `Finset.Icc`. `Pi.single` (the function equal to a
  given value at one index and zero elsewhere). `Equiv.Perm`, `Function.Bijective`.
- `Mathlib/Data/Sign/Defs.lean`: `SignType` (the three signs `-1, 0, 1`, with negation).
- `Mathlib/Combinatorics/SimpleGraph/Basic.lean`: `SimpleGraph` (a symmetric irreflexive
  relation). `Mathlib/Combinatorics/SimpleGraph/Coloring/Vertex.lean`: `SimpleGraph.Coloring.mk`
  (a colouring from a map that separates adjacent vertices), `SimpleGraph.Colorable G n` (a
  colouring by `Fin n` exists), `SimpleGraph.chromaticNumber` (the infimum in `ℕ∞` of the `n` with
  `G.Colorable n`), `SimpleGraph.chromaticNumber_eq_iff_colorable_not_colorable`
  (`G.chromaticNumber = n + 1` if and only if `G.Colorable (n + 1)` and not `G.Colorable n`).
- `Mathlib/Analysis/Normed/Group/BallSphere.lean`: the `InvolutiveNeg` instance on
  `Metric.sphere (0 : E) r` (negation of the underlying vector) and `coe_neg_sphere`.
- `Mathlib/Topology/Order/Compact.lean`: `IsCompact.exists_isMinOn` (a function continuous on a
  nonempty compact set attains its minimum there). `Mathlib/Topology/UniformSpace/HeineCantor.lean`:
  `CompactSpace.uniformContinuous_of_continuous` (continuous maps on compact spaces are uniformly
  continuous).
- `Mathlib/Topology/Algebra/Module/FiniteDimension.lean`: `ContinuousLinearEquiv.ofFinrankEq`
  (two finite-dimensional Hausdorff topological vector spaces of equal dimension are continuously
  linearly equivalent). `EuclideanSpace ℝ (Fin n)`, `Module.finrank`, `FiniteDimensional`.
- `Mathlib/MeasureTheory/Integral/Lebesgue/DominatedConvergence.lean`:
  `MeasureTheory.tendsto_lintegral_filter_of_dominated_convergence` (along a countably generated
  filter, measurable functions bounded almost everywhere by a function of finite lower integral
  and converging almost everywhere have converging lower integrals). `Measure`,
  `IsFiniteMeasure`, `OpensMeasurableSpace`, and `inner ℝ` on a real inner product space.

### From Tau Ceti

Nothing is consumed. The two Tau Ceti declarations named in the scope section above,
`TauCeti.brouwerFixedPoint_compactConvex_continuousOn` in
`TauCeti/AlgebraicTopology/Singular/BrouwerFixedPoint.lean` and
`TauCeti.exists_nonneg_sum_smul_eq_zero_and_forall_coeff_add_dual_pos` in
`TauCeti/Geometry/Convex/Cone/Alternative.lean`, mark boundaries only.

## References

- Timothy Prescott and Francis Edward Su, *A constructive proof of Ky Fan's generalization of
  Tucker's lemma*, J. Combin. Theory Ser. A 111 (2005), 257–265; the published version as posted
  on F. E. Su's page at Harvey Mudd College (with errata), also arXiv:math/0310444. The statement
  of Tucker's lemma on p. 258 and Theorem 2 with the remarks after it on p. 264.
- Günter M. Ziegler, *Generalized Kneser coloring theorems with combinatorial proofs*,
  arXiv:math/0103146: §2 (notation, pp. 2–3, and the colourability defect, p. 3), Lemmas 3.1
  and 3.2 (pp. 4–5), Lemma 4.1 and Theorem 4.2 (p. 5).
- Jiří Matoušek, *A combinatorial proof of Kneser's conjecture*, preprint version on the author's
  page at Charles University (`kam.mff.cuni.cz/~matousek`), published in Combinatorica 24 (2004);
  page numbers are those of the preprint: abstract and §1 (p. 1), Lemma 2.1 and §2 (pp. 2–3).
- Francis Edward Su, *Rental harmony: Sperner's lemma in fair division*, Amer. Math. Monthly 106
  (1999), 930–942; the copy on the author's page at Harvey Mudd College, with its own page
  numbers: §2 (Sperner's lemma, p. 3, and its proof, pp. 3–5), §§3–4 (pp. 5–8).
- Edgardo Roldán-Pensado and Pablo Soberón, *A survey of mass partitions*, arXiv:2010.00478v3:
  Theorem 1.2.2 and the remark before it (p. 4), Theorem 1.3.1 and the proof of Theorem 1.2.2
  (p. 5).
- L. Lovász (1978) is named for Kneser's conjecture as Matoušek and Ziegler attribute it, and
  V. L. Dol'nikov for 3.2 as Ziegler does; no locator into their papers is given. The name of the
  staircase subdivision after H. W. Kuhn is customary; no source for it was opened, and its
  properties are proved in 1.1.

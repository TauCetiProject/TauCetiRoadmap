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
  opposite labels. Both forms follow from Tucker's lemma for a flag of hemispheres, stated through
  counts of simplices and proved by a parity count.
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
Layer 2 proves Tucker's lemma for a flag of hemispheres and derives from it the two forms above.
Layer 3 defines Kneser graphs and proves Dol'nikov's theorem and Kneser's conjecture from the
octahedral form of Tucker's lemma. Layer 4 proves the Borsuk–Ulam theorem from the lattice form
of Tucker's lemma by compactness, and Layer 5 proves the ham sandwich theorem from it. Layers 1
and 2 depend on no other layer.

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
  to `0`, so the Borsuk–Ulam theorem asks `finrank F < finrank E` only when `E` is
  finite-dimensional, and the target space carries `[FiniteDimensional ℝ F]` explicitly.
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

### 2.1 Tucker's lemma for a flag of hemispheres

Prove `flag_tucker`. The data are a type `V` of vertices with an involution `ι`, a natural
number `n`, finite families `H 0, H 1, …` of finite subsets of `V`, and a labelling
`lab : V → ℤ`. A member of `H d` with `k + 1` elements is a `k`-simplex of `H d`; for a set `s`
of vertices `ιs` is its image, and `−H d` is the family of the `ιs` with `s` in `H d`, so that
`ρ` lies in `−H d` exactly when `ιρ` lies in `H d`. Assume, for every `d < n`:

- deleting one vertex of a member of `H (d + 1)` gives a member of `H (d + 1)`;
- every member `s` of `H d` lies in `H (d + 1)`, and so does `ιs`;
- no `d`-simplex `s` of `H d` has `ιs` in `H d`;
- every `d`-simplex `ρ` of `H (d + 1)` lies in exactly one `(d + 1)`-simplex of `H (d + 1)` when
  `ρ` or `ιρ` is in `H d`, and in exactly two otherwise;

and that `H 0` has exactly one `0`-simplex. If every vertex of a member of `H n` has a nonzero
label of absolute value at most `n`, and `lab (ι v) = −lab v` for every vertex `v` of a member
of some `H d` with `d < n`, then some member of `H n` has two distinct vertices `u` and `w` with
`lab u = −lab w`. (Prescott–Su, Theorem 2, p. 6, for a centrally symmetric triangulation of
`Sⁿ` aligned with a flag of hemispheres, defined on p. 2, where `H d` is the set of simplices
lying in the `d`-th hemisphere; the hypotheses here are the facts about the flag that their
proof of Theorem 1, pp. 3–5, uses, two of them stated there without argument; the statement,
which needs no ambient sphere, is proved here.)

The families are `Finset (Finset V)`, not Mathlib's `PreAbstractSimplicialComplex`, whose faces
form a `Set` of nonempty finite sets: the statement counts simplices, and it needs closure only
under deleting one vertex. The conclusion lies in `H n`, half of the sphere in the setting of
Prescott–Su.

Route: a parity count, the counting form of the path-following proof of Prescott–Su's Theorem 1
(pp. 4–5), carried out in one hemisphere at a time as they describe after Fan on p. 6. Suppose
that no member of `H n` has two distinct vertices with opposite labels. By the second hypothesis
every member of an `H d` with `d ≤ n` is a member of `H n`, so on each such simplex the labels
are nonzero, at most `n` in absolute value, and two labels of equal absolute value are equal.
Call a set of nonzero integers alternating when its elements have distinct absolute values and,
listed by increasing absolute value, alternate in sign; its sign is that of its element of least
absolute value. Let `a d` be the number of `d`-simplices of `H d` whose `d + 1` labels are
distinct and form an alternating set. Then `a 0 = 1`, from the one `0`-simplex of `H 0`, and
`a n = 0`, since `n + 1` labels of distinct absolute values do not fit into `±1, …, ±n`. We show
that `a d` and `a (d − 1)` have the same parity for `1 ≤ d ≤ n`, a contradiction. Fix such a `d`
and a sign `ε`, and call a `(d − 1)`-simplex of `H d` a door when its `d` labels are distinct and
form an alternating set of sign `ε`.

1. *A `d`-simplex `τ` of `H d` has an odd number of facets that are doors exactly when its labels
   are `d + 1` distinct labels forming an alternating set.* If the labels of `τ` take at most
   `d − 1` values, no facet is a door. If they take `d` values, only the two facets that omit one
   of the two vertices with a common label can be doors, and they carry the same labels: `0` or
   `2` doors. If they take `d + 1` values `ℓ₀, …, ℓ_d`, in order of absolute value, the facet
   omitting `ℓ_i` is a door when the remaining signs alternate and the first of them is `ε`. If
   the signs of `ℓ₀, …, ℓ_d` alternate, omitting `ℓ₀` or `ℓ_d` leaves alternating sets of the two
   opposite signs, and omitting an inner label leaves two neighbours of equal sign: one door. If
   exactly one pair of neighbours `ℓ_j`, `ℓ_(j+1)` has equal signs, omitting either of them leaves
   alternating sets of one and the same sign, the sign of `ℓ₀` (for `j = 0` the signs of `ℓ₀` and
   `ℓ₁` agree), and omitting any other label keeps the pair: `0` or `2` doors. With two or more
   such pairs, omitting one label keeps one of them: no door.
2. *Doors in two ways.* Every facet of a `d`-simplex of `H d` lies in `H d` (first hypothesis).
   Count the pairs of a door and a `d`-simplex of `H d` containing it: by the fourth hypothesis
   a door in `H (d − 1)` or `−H (d − 1)` lies in one `d`-simplex of `H d` and every other door in
   two. With step 1, `a d` has the parity of the number of doors in `H (d − 1)` or `−H (d − 1)`.
3. *The boundary doors.* The `(d − 1)`-simplices of `H (d − 1)` and of `−H (d − 1)` are
   `(d − 1)`-simplices of `H d` (second hypothesis), and none is in both (third hypothesis). The
   map `ρ ↦ ιρ` is a bijection from the `(d − 1)`-simplices of `H (d − 1)` onto those of
   `−H (d − 1)` that negates labels (antisymmetry on the vertices of `H (d − 1)`), so it carries
   alternating sets of sign `−ε` to alternating sets of sign `ε`. Hence the doors in `H (d − 1)`
   or `−H (d − 1)` number `b ε + b (−ε) = a (d − 1)`, where `b ε'` counts the
   `(d − 1)`-simplices of `H (d − 1)` whose `d` distinct labels form an alternating set of sign
   `ε'`.

The proof uses no topology: the topological input of Prescott–Su, that the hemispheres are balls
with the stated boundaries, enters only through the four hypotheses, which 2.2 and 2.3 prove for
their complexes by counting.

**Checks.**
- For `n = 0` the one `0`-simplex of `H 0` lies in `H n` and would need a nonzero label of
  absolute value `0`: no labelling exists and the theorem holds vacuously. For `n = 1`, with `v`
  the vertex of `H 0`, the edges of `H 1` form a graph in which `v` and `ιv` have degree one and
  every other vertex of `H 1` degree two; the path from `v` ends at `ιv`, so an antisymmetric
  labelling by `±1` changes sign along one of its edges.
- Each hypothesis is needed; below `v` is the vertex of `H 0`, and the other hypotheses hold in
  each example, checked mechanically. For `n = 1`: with a second vertex `w` in `H 0`, the edges
  `{v, ιw}` and `{w, ιv}` labelled `1, 1` and `−1, −1`; without the incidence count, `H 1` made
  of `{v}` and `{ιv}` alone; without closure under deleting a vertex, the edges `{v, x}` and
  `{ιv, ιx}` without the vertices `x`, `ιx`, labelled `1, 1, −1, −1`; with a label `2`, the path
  `v, x, ιv` labelled `1, 2, −1`, and with a label `0`, the same path labelled `1, 0, −1`; without
  antisymmetry, the edge `{v, ιv}` labelled `1, 1`. For `n = 2`, let `H 1` be the path `v, w, ιv`
  together with a 4-cycle `c₀c₁c₂c₃`, labelled `1, 2, −1` and `1, 2, −1, −2`, and let `H 2` be
  the eight triangles `{pᵢ, pᵢ₊₁, cᵢ}`, `{pᵢ₊₁, cᵢ, cᵢ₊₁}` (indices modulo `4`) between the
  4-cycle `p = (v, w, ιv, ιw)`, labelled `1, 2, −1, −2`, and the 4-cycle `c`. If `ι` maps `cᵢ`
  to `cᵢ₊₂`, only the third hypothesis fails. If `ι` maps the `cᵢ` to four further vertices,
  labelled oppositely, only the requirement `ιs ∈ H 2` for `s` in `H 1` fails; building `H 2` in
  the same way on the 4-cycle `ιc₂, ιc₃, ιc₀, ιc₁`, labelled `1, 2, −1, −2`, in place of `c`, only
  the requirement `s ∈ H 2` fails. In none of these examples does a member of `H n` have two
  vertices with opposite labels.

*Needs:* Mathlib `Finset.filter`, `Finset.image`, `Finset.erase`, `Function.Involutive`. (Proved
here.)

### 2.2 The octahedral Tucker lemma

Prove `octahedral_tucker`: let `n ≥ 1` and let `lab` assign to every nonzero sign vector
`X : Fin n → SignType` an integer with `lab X ≠ 0`, `|lab X| < n` and `lab (−X) = −lab X`. Then
there are signed sets `A ≠ 0` and `B` with `A ≤ B` and `lab A = −lab B` (Ziegler, Lemma 4.1,
p. 5, stated for every `n`; for `n = 0` there is no nonzero sign vector and the conclusion fails,
so `n ≥ 1` is assumed). Such `A` and `B` are distinct, since a label is nonzero.

Route: apply 2.1 with `n − 1` in place of `n`, the sign vectors as vertices and `ι` the
negation. For `d ≤ n − 1` let `H d` be the family of chains, that is sets of pairwise comparable
signed sets (the empty set included), of nonzero sign vectors `X` with `X j = 0` for `j > d` and
`X d ≥ 0`. These are the simplices of the barycentric subdivision of the boundary of the
cross-polytope in `ℝⁿ` (Matoušek, §2, p. 2) lying in a hemisphere of a flag. A chain of `H (n − 1)`
with distinct elements of opposite labels gives the conclusion: its smaller element is `A`, which
is nonzero, and its larger is `B`. The labels satisfy the hypotheses of 2.1, since
`|lab X| ≤ n − 1`. The hypotheses on the flag are proved here, for every `n ≥ 1`:

- If `Y ≤ Z` and `Y ≠ Z` then the support of `Y` is a proper subset of that of `Z`. So a chain of
  nonzero sign vectors supported in `k` coordinates has at most `k` elements, and one with `k`
  elements has supports of sizes `1, 2, …, k`.
- Subsets of chains are chains, so deleting a vertex stays in `H d`. A member of `H d` or of
  `−H d` has `X j = 0` for `j > d`, so it lies in `H (d + 1)`. The only nonzero sign vector with
  `X j = 0` for `j ≥ 1` and `X 0 ≥ 0` is `(1, 0, …, 0)`, the one `0`-simplex of `H 0`.
- A chain in `H d` whose negation is in `H d` has `X d = 0` throughout, so it is supported in `d`
  coordinates and has at most `d` elements, not `d + 1`.
- Let `1 ≤ k ≤ n − 1` and let `ρ` be a chain of `k` elements in `H k`. The chains of `k + 1`
  elements in `H k` have supports of sizes `1, …, k + 1`, so those containing `ρ` are `ρ` with
  one sign vector `Z` added whose support has the size `j` that `ρ` misses, comparable with all
  of `ρ`. If `j ≤ k`, the top element of `ρ` has full support `{0, …, k}`; for `j = 1`, `Z` is
  the least element of `ρ`, of support size `2`, restricted to one of its two coordinates, and for
  `1 < j ≤ k` the supports of the neighbours `Y` and `W` of sizes `j − 1` and `j + 1` differ in
  two coordinates, and `Z` is `Y` extended by `W` at one of them. Either way there are two
  choices, both with `Z k ≥ 0`, and `X k ≠ 0` at the top of `ρ`, so `ρ` is in neither `H (k − 1)`
  nor `−H (k − 1)`. If `j = k + 1`, the top element `Y` of `ρ` misses one coordinate `i` and `Z`
  is `Y` extended by a nonzero sign at `i`. For `i ≠ k` both signs give `Z k = Y k ≥ 0`, two
  choices, and `Y k ≠ 0`, so `ρ` is in neither family. For `i = k` the sign must be positive, one
  choice; then `X k = 0` on `ρ`, the top element `Y` has full support `{0, …, k − 1}`, and every
  element `X ≤ Y` has `X (k − 1)` equal to `0` or to `Y (k − 1)`, so `ρ` lies in `H (k − 1)` or in
  `−H (k − 1)` according to the sign of `Y (k − 1)`. So the count is `1` exactly when `ρ` or its
  negation is in `H (k − 1)`.

The route therefore uses no topology.

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
- The families `H d` were checked mechanically against the hypotheses of 2.1 for `n ≤ 6`. The
  number of `d`-simplices of `H d` is `2ᵈ (d + 1)!`, that is `1, 4, 24, 192, 1920, 23040` for
  `d ≤ 5`: a chain of `d + 1` elements of `H d` is an ordering of the coordinates `0, …, d`
  together with a sign for each, the sign at `d` positive.

*Needs:* 2.1; Mathlib `SignType`. (Ziegler, Lemma 4.1, statement; proof from 2.1 by the route
above.)

### 2.3 Tucker's lemma on the lattice cross-polytope

Prove `lattice_tucker`: let `m : ℕ` and let `lab` assign to every integer point `x` with
`∑ i, |x i| ≤ m` an integer with `lab x ≠ 0` and `|lab x| ≤ n`, such that `lab (−x) = −lab x`
whenever `∑ i, |x i| = m`. Then there are two such points `x`, `y`, close (`|x i − y i| ≤ 1` for
every `i`), with `lab x = −lab y`. For `n = 0` no labelling exists, and for `m = 0` the point `0`
lies on the boundary sphere and would need `lab 0 = −lab 0`, so the statement holds vacuously in
both cases. (Proved here from 2.1; this is Tucker's lemma for special triangulations of the
octahedral ball, Matoušek, Lemma 2.1, p. 2, applied to one explicit triangulation.)

Route: let `n ≥ 1` and `m ≥ 1`, and apply 2.1 with the integer points of `ℤⁿ` as vertices and
`ι` the negation. For `x : Fin n → ℤ` let `z x` be the vector of partial sums
`z_j = |x 0| + ⋯ + |x j|`, `j < n`. On a closed orthant (a sign vector `s` with `s i · x i ≥ 0`
for all `i`) the map `z` is a bijection from the integer points of the ball `∑ |x i| ≤ m` onto
the integer points of the order simplex `Δ : 0 ≤ z₀ ≤ ⋯ ≤ z_(n−1) ≤ m`, with inverse
`x i = s i (z_i − z_(i−1))`. Put `z_(−1) = 0`, `z_n = m` and `h_i = z_i − z_(i−1)` for
`0 ≤ i ≤ n`, so that `h = (|x 0|, …, |x (n − 1)|, m − ∑ |x i|)` and `Δ` is `h ≥ 0`. Let `T` be
the family of sets `S` of integer points of the ball that lie in one closed orthant and whose
points `z x` form a chain for the componentwise order with largest and smallest elements
differing by a vector of zeros and ones. Its `n`-simplices in a closed orthant are the sets whose
`z`-points are `p, p + e_(c₁), …, p + e_(c₁) + ⋯ + e_(cₙ)` with `c₁, …, cₙ` an ordering of the
coordinates: under `x ↦ h`, which lands in `simplexGrid n m`, these are the cells of 1.1 (a
remark; the route does not use it). Every step `e_c` of such a chain raises `h_c` and lowers
`h_(c+1)` by one. Let `H n = T`, and for
`d < n` let `H d` consist of the members of `T` all of whose points satisfy `∑ |x i| = m`,
`x j = 0` for `j > d` and `x d ≥ 0`. A member of `T` with two distinct points of opposite labels
gives the conclusion: two points of one member of `T` lie in one closed orthant and their
`z`-points differ by a vector `δ` of zeros and ones, so `|x i|` and `|y i|` differ by
`δ_i − δ_(i−1)` and `|x i − y i| ≤ 1`. The labels satisfy the hypotheses of 2.1, antisymmetry
being needed only on the boundary sphere. The hypotheses on the flag are proved here, for all
`n ≥ 1` and `m ≥ 1`:

- Subsets of members of `T` are members, and so for each `H d`. `T` is symmetric, since
  `z (−x) = z x`, so `−H d` consists of the members of `T` on the sphere with `x j = 0` for `j > d`
  and `x d ≤ 0`; both `H d` and `−H d` lie in `H (d + 1)`. Every single point of the ball is a
  member of `T`, and the one point of the sphere with `x j = 0` for `j ≥ 1` and `x 0 ≥ 0` is
  `m e₀`, the one `0`-simplex of `H 0`.
- A member of `H d` whose negation is in `H d` has `x d = 0` at each of its points. For `d = 0`
  no point of the sphere has `x = 0`, as `m ≥ 1`. For `d ≥ 1` its points have `z_j = m` for
  `j ≥ d − 1`, so its `z`-points form a chain that changes only the `d − 1` coordinates
  `j < d − 1`, each by at most one; it has at most `d` points, not `d + 1`.
- *The incidence count in `T`.* Let `ρ` be an `(n − 1)`-simplex of `T`, with `z`-points
  `q₁ < ⋯ < qₙ`. An `n`-simplex of `T` containing `ρ` is `ρ` with one point `p` added, where
  `z p` completes the `q`'s to a chain of `n + 1` points with unit steps, each coordinate once.
  There are exactly two candidates for `z p`. If `qₙ − q₁` has `n` ones, one step of the `q`'s is
  `e_a + e_b`, say from `q`, and `z p` is `q + e_a` or `q + e_b`. Otherwise `qₙ − q₁` misses one
  coordinate `c`, every step is a unit vector, so `z p` cannot lie strictly between two `q`'s, and
  it is `qₙ + e_c` or `q₁ − e_c`. In a closed orthant containing `ρ` a candidate gives a point of
  the ball exactly when it lies in `Δ`, that is when no `h_i` becomes negative. In the first case,
  `q + e_a` lowers only `h_(a+1)`, which stays nonnegative unless `h_(a+1) (q) = 0`; then
  `h_(a+1) (q + e_a + e_b) ≥ 0` forces `b = a + 1`, and symmetrically `q + e_b` fails only if
  `a = b + 1`. So at most one candidate fails, and one fails exactly when the double step is
  `e_(i−1) + e_i` with `h_i (q) = 0`; since no other step touches `z_(i−1)` or `z_i`, this says
  that `h_i` vanishes on all of `ρ`. Conversely `h_i` is constant
  along the `q`'s only if the double step is `e_(i−1) + e_i`, as every coordinate is stepped once
  and `h_i` changes at a step that touches exactly one of `z_(i−1)`, `z_i`. In the second case
  `qₙ + e_c` fails only if `h_(c+1) (qₙ) = 0` and `q₁ − e_c` only if `h_c (q₁) = 0`; as no step
  touches `z_c`, `h_(c+1)` increases and `h_c` decreases along the chain, so these say that
  `h_(c+1)`, respectively `h_c`, vanishes on `ρ`, and these are the only `h_i` that can be
  constant on `ρ`. Both cannot vanish: then no step would touch `z_(c−1)` or `z_(c+1)`, forcing
  `n = 1` and `m = h₀ + h₁ = 0`. So, with `m ≥ 1`, at most one `h_i` vanishes on `ρ`; if none does,
  both candidates lie in `Δ`, and if one does, exactly one. An `n`-simplex of `T` lies in exactly
  one closed orthant, since no `h_i` is constant on its `z`-points, while `ρ` lies in `2ᵏ` closed
  orthants, where `k` is the number of coordinates `x i`, `i < n`, vanishing on `ρ`, that is of
  `h_i` with `i < n` vanishing on `ρ`. So the number of `n`-simplices of `T` containing `ρ` is
  `2` if no `h_i` vanishes on `ρ`, `2 · 1` if some `h_i` with `i < n` does (the two simplices lie
  on the two sides of `x i = 0`), and `1` if `h_n` does, that is if `ρ` lies on the sphere. A
  member of `T` on the sphere lies in a closed orthant, so `x (n − 1)` has one sign on it and it
  lies in `H (n − 1)` or `−H (n − 1)`; one off the sphere lies in neither.
- *The incidence count in `H k`, `1 ≤ k < n`.* Dropping the coordinates `j ≥ k` is a bijection
  from the points of `H k` onto the integer points of the ball of radius `m` in `ℤᵏ`, with inverse
  `y ↦ (y, m − ∑ |y i|, 0, …, 0)`. It carries `z x` to the first `k` coordinates of `z x`, the
  others being `m`, and closed orthants to closed orthants, so it carries the members of `H k`
  onto the members of the family `T` built in `ℤᵏ`. The sphere of the ball in `ℤᵏ` corresponds to
  `x k = 0`, that is to members of `H (k − 1)` or `−H (k − 1)`, as in the previous step. So the
  count in `H k` is the count in `T` for `ℤᵏ`, proved in the previous step with `k` for `n`.

**Checks.**
- The triangulation `T` was checked mechanically for `n ≤ 3`, `m ≤ 3` (`n = 3` with `m ≤ 2`):
  there are `2ⁿ mⁿ` top simplices, every face of codimension one lies in two of them or, exactly
  when it lies on the boundary sphere, in one; `T` is symmetric; every simplex lies in a closed
  orthant; any two vertices of a simplex are close.
- The families `H d` were checked mechanically against the hypotheses of 2.1, with `2ⁿ mⁿ`
  `n`-simplices of `T` and any two vertices of a member close, for `n = 1`, `m ≤ 6`; `n = 2`,
  `m ≤ 5`; `n = 3`, `m ≤ 4`; `n = 4`, `m ≤ 3`; `n = 5`, `m ≤ 2`. For `m = 0` they fail: `H 0` is
  `{0}`, which is its own negation, so `m = 0` is treated apart.
- The label bound cannot be raised to `n + 1`: for `n = 1`, `m = 2`, the labels `1, 1, 2, −1, −1`
  at `−2, −1, 0, 1, 2` are antipodal at `±2`, and no two consecutive points carry opposite labels.
- An exhaustive search over antipodal labellings finds no labelling without a complementary close
  pair for `n = 1`, `m ≤ 3`; `n = 2`, `m ≤ 3`; `n = 3`, `m ≤ 2`.
- For `n = 1` the lemma is the discrete intermediate value theorem: the labels `±1` at `−m` and
  `m` are opposite, so the sign changes between two consecutive integers.

*Needs:* 2.1; Mathlib `Finset.sum`, `abs`. (Proved here, from 2.1, by the route above.)

### Examples

The barycentric subdivision of the boundary of the square (`n = 2`): eight vertices
`(±1, 0), (0, ±1), (±1, ±1)` forming an octagon; with labels `±1` antipodal, some comparable pair,
an edge of the octagon, has opposite labels; the flag of 2.2 is `H 0 = {(1, 0)}` and `H 1` the
path `(1, 0), (1, 1), (0, 1), (−1, 1), (−1, 0)`. The triangulation `T` of the lattice diamond
`|x₀| + |x₁| ≤ 2`, with 16 triangles, and its flag `H 0 = {(2, 0)}`, `H 1` the path
`(2, 0), (1, 1), (0, 2), (−1, 1), (−2, 0)`, `H 2 = T`.

### Dependencies

Mathlib `SignType`, `Finset.sum`, `Finset.filter`, `Finset.image`, `Finset.erase`,
`Function.Involutive`. No other layer.

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
labels are nonzero, of absolute value at most `n − 1`, and antipodal, so 2.2 gives `A ≤ B`, with
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

*Needs:* 2.2, 3.1; Mathlib `SimpleGraph.Colorable`, `SimpleGraph.Coloring`. (Ziegler,
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

2.2; Mathlib `SimpleGraph`, `SimpleGraph.Colorable`, `SimpleGraph.Coloring`,
`SimpleGraph.chromaticNumber`. No other layer.

## Layer 4: the Borsuk–Ulam theorem

### 4.1 The Borsuk–Ulam theorem

Prove `borsuk_ulam`: let `E` and `F` be real normed spaces with `F` finite-dimensional and
`finrank F < finrank E` if `E` is finite-dimensional (no condition if it is not), and let
`r ≥ 0`. Every continuous `f` from the sphere `Metric.sphere (0 : E) r` to `F` has a point `x`
with `f (−x) = f x` (Prescott–Su, p. 1, states
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
   nonzero. On the boundary `f` is odd, so the labelling is antipodal there, and 2.3 gives close
   points `z`, `w` with labels `i + 1` and `−(i + 1)`: then `fᵢ (z/m) ≥ ε` and `fᵢ (w/m) ≤ −ε`,
   a difference of at least `2ε`, against uniform continuity.
2. *Round sphere.* For `f` continuous on the unit sphere of `EuclideanSpace ℝ (Fin (n + 1))` with
   values in `ℝⁿ`, set `g u = f u − f (−u)`, which is odd, and let `h x` be `(x, 1 − ∑ |xᵢ|)`
   divided by its Euclidean norm, which is never zero. Then `h` maps `B` continuously into the
   sphere, and on the boundary of `B` it is odd. So `g ∘ h` satisfies the hypotheses of step 1,
   and a zero `x` gives `f (h x) = f (−h x)`. For `n = 0` the target is a point.
3. *General spaces.* If `r = 0` the sphere is `{0}` and `x = 0` works. Let `r > 0`. If `E` is
   infinite-dimensional, its rank is not below `ℵ₀` (Mathlib `Module.rank_lt_aleph0_iff`), so it
   has `finrank F + 1` linearly independent vectors (`exists_linearIndependent_of_le_rank`), whose
   span `W` has dimension `finrank F + 1` (`finrank_span_eq_card`); the sphere of radius `r` of
   `W` lies in that of `E` and is closed under negation, and the finite-dimensional case applied to
   `f` restricted to it gives the pair. So let `E` be finite-dimensional and `d = finrank E`, so
   `d ≥ 1` by the hypothesis; a continuous linear equivalence
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
- The theorem covers infinite-dimensional `E`: for the unit sphere of the Hilbert space `ℓ²` and
  any finite-dimensional `F` the hypothesis holds, and the conclusion follows from the case of a
  subspace of dimension `finrank F + 1`.
- On the unit circle, `f (x₀, x₁) = x₀` takes equal values exactly at the antipodal pair
  `(0, ±1)`. On the cube boundary `‖x‖ = 1` of `Fin 2 → ℝ` with the sup norm, the same map takes
  equal values at the antipodal points `(0, ±1)`, which lie on that sphere as well.

*Needs:* 2.3; Mathlib `Metric.sphere`, its `InvolutiveNeg` instance and `coe_neg_sphere`,
`IsCompact.exists_isMinOn`, `CompactSpace.uniformContinuous_of_continuous`,
`ContinuousLinearEquiv.ofFinrankEq`, `EuclideanSpace`, `Module.finrank`,
`Module.rank_lt_aleph0_iff`, `exists_linearIndependent_of_le_rank`, `finrank_span_eq_card`.
(Proved here.)

### Examples

The ball form for `n = 1`: a continuous function on `[−1, 1]` with `f (−1) = −f 1` has a zero,
the intermediate value theorem. A continuous map from the round 2-sphere to the plane, such as a
temperature and pressure pair on the Earth's surface, agrees at some antipodal pair.

### Dependencies

2.3; Mathlib `Metric.sphere`, `InvolutiveNeg`, `IsCompact.exists_isMinOn`,
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
  graphs, which need a stronger form of 2.2 (Ziegler, §8).
- Mass partitions beyond bisection, which rest on 4.1 or on its generalisations to other group
  actions (Roldán-Pensado–Soberón, §1.3).

## Scope and ownership

This roadmap owns: the staircase subdivision of the simplex, Sperner labellings and Sperner's
lemma in the forms of 1.2 and 1.3; Tucker's lemma for a flag of hemispheres and its octahedral
and lattice forms; Kneser graphs of set families and of `k`-subsets, Dol'nikov's theorem and
Kneser's conjecture; the Borsuk–Ulam theorem; the ham sandwich theorem.

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
`Zₚ`-Tucker lemma; Fan's combinatorial lemma as a statement (its parity argument, for labels
`±1, …, ±n` on a flag, is part of the route of 2.1); Kneser hypergraphs; the
Lusternik–Schnirelmann–Borsuk covering theorem; the equivalence of Borsuk–Ulam with its other
classical forms; Sperner's lemma for arbitrary triangulations and polytopal subdivisions; every
algorithm or path-following
procedure as a target.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Data/Fintype/Pi.lean` (with `Mathlib/Data/Fintype/BigOperators.lean`):
  `Fintype.piFinset` (the finite set of functions with values in given finite sets).
  `Mathlib/Order/Interval/Finset/Defs.lean`: `Finset.Icc`. `Pi.single` (the function equal to a
  given value at one index and zero elsewhere). `Equiv.Perm`, `Function.Bijective`.
- `Mathlib/Data/Sign/Defs.lean`: `SignType` (the three signs `-1, 0, 1`, with negation).
- `Finset.filter`, `Finset.image`, `Finset.erase`, `Finset.card` and `Function.Involutive`, used as
  they are. `Mathlib/AlgebraicTopology/SimplicialComplex/Basic.lean`:
  `PreAbstractSimplicialComplex` (a downward closed set of nonempty finite sets), which 2.1 does
  not use, for the reason given there.
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
- `Mathlib/LinearAlgebra/Dimension/Free.lean`: `Module.rank_lt_aleph0_iff` (a free module has
  rank below `ℵ₀` if and only if it is finite). `Mathlib/LinearAlgebra/Dimension/Finite.lean`:
  `exists_linearIndependent_of_le_rank` (`k` linearly independent vectors exist when `k` is at
  most the rank). `Mathlib/LinearAlgebra/Dimension/Constructions.lean`: `finrank_span_eq_card`
  (the span of a finite linearly independent family has dimension its cardinality).
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
  Tucker's lemma*, arXiv:math/0310444v1, published in J. Combin. Theory Ser. A 111 (2005),
  257–265; page numbers are those of the arXiv version: the statement of Tucker's lemma and the
  remark on Borsuk–Ulam (p. 1), the flag of hemispheres and alternating simplices (p. 2),
  Theorem 1 (p. 3) and its proof (pp. 4–5), the remark after Fan and Theorem 2 with the remarks
  after it (p. 6).
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
  staircase subdivision after H. W. Kuhn is customary; its properties are proved in 1.1.

# Roadmap: analysis on the Sierpiński gasket

**Summary.** This roadmap builds Kigami's calculus on the Sierpiński gasket: renormalised graph
energies, harmonic functions, effective resistance between vertices and the Laplacian. The
gasket `K` is the attractor of the maps `Fᵢ x = (x + pᵢ)/2` of the plane, where `p₀, p₁, p₂` are
the corners of an equilateral triangle; the corners form its boundary `V₀`. The level-`m` graph
has as vertices the images `V_m` of the corners under the compositions of `m` maps, and as edges
the sides of the `3^m` small triangles. Its renormalised energy is
`E_m(f) = (5/3)^m ∑ (f(x) − f(y))²`, summed over the edges, each edge once. The energy of `f` is
`E(f) = lim E_m(f)`, and `μ` is the self-similar probability measure that gives each of the
`3^m` cells of level `m` mass `3^(−m)`. The main theorems are these.

- *Harmonic extension.* Among the extensions of a function on `V_m` to `V_(m+1)`, the least
  energy `E_(m+1)` equals `E_m`, and it is attained exactly by the `(2/5, 2/5, 1/5)` rule: on
  each cell, the new point on a side takes `2/5` of the values at the two ends of that side and
  `1/5` of the value at the opposite corner. Hence `E_m(f)` is nondecreasing in `m`, and
  `E(f) = (5/3) ∑ᵢ E(f ∘ Fᵢ)`.
- *Harmonic functions.* For every choice of values on the three corners there is exactly one
  harmonic function, continuous on `K`, with those values. It lies between its least and
  greatest corner value, its oscillation on a cell of level `m` is at most `(3/5)^m` times its
  oscillation on the corners, and it is Hölder of exponent `log(5/3)/log 2` in the Euclidean
  metric.
- *Effective resistance.* The effective resistance between two vertices in the level-`m`
  network with conductance `(5/3)^m` per edge does not depend on `m`. It is at most a constant
  times `|x − y|^(log(5/3)/log 2)`. Consequently every function of finite energy satisfies
  `|f(x) − f(y)| ≤ C √E(f) |x − y|^(log(5/3)/(2 log 2))` on the vertices and extends continuously
  to `K`.
- *The Laplacian.* Say `Δf = φ` when `(3/2) 5^m ∑_(y ∼ x) (f(y) − f(x)) → φ(x)` uniformly in the
  non-boundary vertices `x` of level `m`, with `f` and `φ` continuous on `K`. Then the normal
  derivatives `∂ₙf(pᵢ) = lim (5/3)^m ∑_(y ∼ pᵢ) (f(pᵢ) − f(y))` exist, and for every `u`
  continuous on `K` the level forms `E_m(u, f)` converge to `∑ᵢ u(pᵢ) ∂ₙf(pᵢ) − ∫ u Δf dμ` (the
  Gauss–Green formula). The Dirichlet problem `Δf = φ` with prescribed corner values has exactly
  one solution, and among functions continuous on `K` the solutions of `Δf = 0` are the harmonic
  ones.

The gasket, its iterated function system and its self-similar measure are those of
FractalGeometry. The level graphs are finite electrical networks in the sense of
ElectricalNetworksAndRandomWalks, whose Dirichlet problem, Dirichlet's principle and metric
property of effective resistance are used here.

Below, Layer 1 sets up the graphs and networks, Layer 2 the energies, Layer 3 harmonic
functions, Layer 4 effective resistance and Layer 5 the Laplacian.

## How to read the build

Layer 1 depends on no other layer. Layer 2 uses Layer 1. Layer 3 uses Layers 1 and 2. Layer 4 uses
Layers 1 and 2 and the density statement 1.2. Layer 5 uses Layers 1 to 3; 5.3 also uses 4.1, 4.2
and 4.4, and 5.4 also uses 4.1 and 4.2. Every target ends with a *Needs:* line, and every claim
carries a locator or says that it is proved here; a statement that specialises one of Kigami's
general theorems says which of his hypotheses the gasket meets, and the Conventions say why it
meets them. `Suggested.lean` states the headline theorems of every layer.

## Conventions

- **The plane and the corners.** `Plane` is `EuclideanSpace ℝ (Fin 2)`. The corners are
  `p₀ = (0, 0)`, `p₁ = (1, 0)`, `p₂ = (1/2, √3/2)`, and `Fᵢ x = midpoint(pᵢ, x)`. Indices of
  corners are read in `Fin 3`, so `p₃ = p₀`. An affine bijection of the plane carries all
  statements to any other nondegenerate triangle, with other constants in the Hölder estimates.
- **The gasket.** Every statement about the gasket is made for a set `K` that is an attractor of
  the Sierpiński system in the sense of FractalGeometry 1.1 (compact, nonempty and the union of
  its three images); 5.4 holds for any set `K`. FractalGeometry 1.3 gives one such set and only
  one; it is the set of FractalGeometry 5.2 for these three points. A *cell of level `m`* is
  `F_w(K)` for a word `w` of length `m`.
- **Words.** A word of length `m` is `w : Fin m → Fin 3`, and `F_w = F_(w 0) ∘ ⋯ ∘ F_(w (m−1))`:
  the first letter is applied last, as in FractalGeometry, and the empty word gives the identity.
- **Functions.** Functions are `f : Plane → ℝ`. A statement about the graphs uses only the values
  on the vertices; a statement about the gasket uses only the values on `K`. In particular a
  function on `V_*` "extends continuously to `K`" when some function continuous on `K` agrees
  with it on `V_*`.
- **Sums over edges.** The edges of level `m` form a finite set of unordered pairs of points, so a
  junction point (a vertex shared by two cells) is one vertex and every edge is counted once.
  ElectricalNetworksAndRandomWalks writes its energies as double sums over ordered pairs with a
  factor `1/2`; the two agree because the level networks have no loops.
- **Renormalisation.** Energies carry the factor `(5/3)^m`, so the conductance of an edge of level
  `m` is `(5/3)^m` and its resistance `(3/5)^m`. The Laplacian carries `5^m = (5/3)^m · 3^m`: the
  energy factor times the inverse of the mass `3^(−m)` of a cell; the further factor `3/2` is the
  inverse of `2/3`, the integral of a tent function at a junction point in units of `3^(−m)`
  (5.1).
- **The boundary.** `V₀ = {p₀, p₁, p₂}`. Harmonicity and the Laplacian are required at the
  vertices outside `V₀` only; the normal derivatives live on `V₀`.
- **Kigami's framework, specialised.** Kigami's paper (Kig93 below) treats a post-critically
  finite self-similar structure with a harmonic structure `(D, r)` and an admissible measure. For
  the gasket the data are those of Kig93, Example 8.2, p. 749: the three maps; the post-critical
  set consists of the three constant sequences, so the structure is post-critically finite
  (Definition 1.12, p. 725) and `V₀` is the set of corners (Definition 1.6, p. 724); `D` is the
  `3 × 3` matrix with `−2` on the diagonal and `1` elsewhere, `r = (1, 1, 1)`, and
  `λ = λ(D, r) = 5/3`. Each hypothesis is met for a stated reason:
  - *Self-similar structure* (Definition 1.3, p. 723): `K` is compact and the maps are injective
    similarities; the coding map of FractalGeometry 1.4 is a continuous surjection onto `K` with
    `π ∘ σᵢ = Fᵢ ∘ π`.
  - *Connectedness* (assumed from §2, p. 726, on): `K` is the closure of `V_*` (1.2) and `V_*`
    is connected by edges, each a segment in `K` (1.3).
  - *Quasi-harmonic structure* (Definition 2.1, p. 726): `D` is symmetric and irreducible, its rows
    sum to `0`, its off-diagonal entries are positive, and `r` is positive.
  - *Harmonic structure with `λ = 5/3`* (Definition 4.4, p. 734): the trace on `V₀` of the level-1
    graph with unit conductances is `(3/5) D`; this is the computation of 2.2 below.
  - *Regular* (Definition 4.4): every `rᵢ = 1` is less than `5/3`.
  - *Admissible measure* (Definition 5.5, p. 737): `μ` is a Borel probability measure on a compact
    metric space, hence regular; it charges every nonempty relatively open subset of `K`, which
    contains a cell of mass `3^(−m)`; it gives `V₀` mass `0`, because `pᵢ` lies in the cell
    `F_(i⋯i)(K)` of mass `3^(−m)` for every `m`; the integrability condition (4) holds for every
    measure under a regular harmonic structure (Kig93, remark after Definition 5.5, with
    Proposition 5.4, p. 737). The mass of a cell is Kig93, Lemma 1.13, p. 725.
  - *The difference operators* (Definition 2.2 and the remark after it, pp. 726–727): with
    `r = (1, 1, 1)`, Kigami's `H_m` is the graph Laplacian of the level-`m` graph with unit
    conductances, `H_m f (p) = ∑_(q ∼ p) (f(q) − f(p))`, so the Laplacian `L_m` of the level
    network of 1.3 is `−(5/3)^m H_m`, and Kigami's form `𝓔_m(u, v) = −λ^m ᵗu H_m v`
    (Definition 6.6, p. 742) is `∑_x u(x) (L_m v)(x)`, which is `E_m` for `u = v`.

## Layer 1: The gasket and its approximating graphs

### 1.1 The Sierpiński system, vertices and edges

Copy verbatim from FractalGeometry 1.1 the structure `IFS`, its coercion to a family of maps and
the predicate `IFS.IsAttractor`. Define `Plane`, the corners `corner`, the maps `cellMap i`, and
the system `sierpinskiIFS : IFS (Fin 3) Plane` whose maps are `cellMap` with ratio `1/2` (its
Lipschitz field is Mathlib's `dist_midpoint_midpoint_le`). Define `wordMap m w`, the map `F_w`
of a word of length `m`; the vertex set `vertices m`, the finite set of points `F_w pᵢ`; the edge
set `edges m`, the finite set of unordered pairs `{F_w pᵢ, F_w pᵢ₊₁}`; and `vertexSet = ⋃ₘ V_m`.

*Design.* The graphs are realised by points of the plane, not by words. There are three natural
representations:

- words in `Fin 3` with the three corners, `V_m` being a quotient of `(Fin m → Fin 3) × Fin 3`
  in which two pairs are identified when they name the same junction point (Kigami's shift space
  with its map `π`); this keeps the combinatorics intrinsic but needs the identification as an
  explicit equivalence relation, a second description of the gasket, and a map from it to the
  plane for every statement about continuity on `K`;
- a `SimpleGraph Plane` whose adjacency is "two corners of one cell of level `m`"; sums over its
  edges need a separate finiteness argument for every `m`;
- (chosen) finite sets of points and of unordered pairs of points, as images of the finite set of
  words. Two words that give the same junction point give the same element of `vertices m`, so
  identification is equality in the plane; an edge is an element of `Finset (Sym2 Plane)`, so no
  edge is counted twice in a sum; a function on the plane can be evaluated on `V_*` and on `K`,
  so the continuous extension to `K` of a function given on `V_*` is a statement about one
  function. The level network of 1.3 is indexed by the finite type of points of `vertices m`.

Facts used below, each proved here from one lemma. Let `T` be the closed solid triangle, and
write `λ(x) = (λ₀, λ₁, λ₂)` for the barycentric coordinates of `x` with respect to
`p₀, p₁, p₂`. Since `λ(Fᵢ x) = (λ(x) + eᵢ)/2`, induction on `m` gives the lemma: for a word `w`
of length `m`, `F_w(T) = {x : λⱼ(x) ≥ kⱼ/2^m for j = 0, 1, 2}` with
`kⱼ = ∑ 2^(m−1−l)` over the positions `l` with `w l = j` (the first letter, applied last, gives
the leading binary digit); so `k₀ + k₁ + k₂ = 2^m − 1`, the map
`w ↦ k` is injective (binary digits), and the corners of `F_w(T)` are the points with
`λ = (k + eⱼ)/2^m`. On `F_w(T)` also `λⱼ = 1 − ∑_(i≠j) λᵢ ≤ (kⱼ + 1)/2^m`. Now let `w ≠ v` have
vectors `k ≠ k'`; since both sum to `2^m − 1`, some `j` has `k'ⱼ ≥ kⱼ + 1`.
- If some `j` has `|k'ⱼ − kⱼ| ≥ 2`, say `k'ⱼ ≥ kⱼ + 2` (exchange `w` and `v` otherwise), then
  `λⱼ ≤ (kⱼ + 1)/2^m` on `F_w(T)` and `λⱼ ≥ (kⱼ + 2)/2^m` on `F_v(T)`. Two lines `λⱼ = a` and
  `λⱼ = b` are at Euclidean distance `(√3/2)|a − b|`, `√3/2` being the height of `T`, so `F_w(T)`
  and `F_v(T)` are at distance at least `(√3/2) 2^(−m)`: *disjoint cells of level `m` are at
  least `(√3/2) 2^(−m)` apart.*
- Otherwise `k' − k = eⱼ − eᵢ` for some `i ≠ j`, since its three entries lie in `{−1, 0, 1}`,
  sum to `0` and are not all `0`. A common point has `λⱼ = (kⱼ + 1)/2^m`, which
  forces `λ = (k + eⱼ)/2^m = (k' + eᵢ)/2^m`: the cells meet in exactly one point, a corner of
  both.
Hence two different cells of level `m` meet in at most one point, a corner of both, and if they
share no corner they are at least `(√3/2) 2^(−m)` apart. Consequences: `V_m ⊆ V_(m+1)`; an edge
of level `m` lies in exactly one cell of level `m`; the edges of level `m + 1` are the images
under `F₀`, `F₁`, `F₂` of the edges of level `m`, the three images being disjoint; the points of
`V_(m+1)` outside `V_m` are the midpoints of the edges of level `m`, one for each edge (such a
midpoint lies in one cell only, since it is not a corner of it); a vertex of `V_m` outside `V₀`
is a corner of exactly two cells of level `m` and has exactly four neighbours, and a corner `pᵢ`
lies in the single cell `F_(i⋯i)(T)` and has two. For `pᵢ`: `λ(pᵢ) = eᵢ ≥ k/2^m` forces
`k = (2^m − 1) eᵢ`, the vector of the word `i⋯i`. For `x ∈ V_m \ V₀`, induct on `m` (for
`m = 0` there is no such `x`): the cells and edges of level `m + 1` are the images under `F₀`,
`F₁`, `F₂` of those of level `m`, and by the case `m = 1` the copies `Fᵢ(T)` meet only in the
three points `midpoint(pᵢ, pⱼ) = Fᵢ pⱼ = Fⱼ pᵢ`. A point `Fᵢ y` with `y ∈ V_m \ V₀` lies in no
other copy and has the two cells and four neighbours of `y`; a point `midpoint(pᵢ, pⱼ)` is a
corner in two copies, with one cell and two neighbours in each, the neighbours different because
the copies share no other point.

**Checks.**
- `|V_m| = (3^(m+1) + 3)/2` and `|edges m| = 3^(m+1)`: `3, 6, 15, 42, 123, 366` vertices and
  `3, 9, 27, 81, 243, 729` edges for `m = 0, …, 5`. Counting `3 · 3^m` pairs `(w, i)` without
  identifying junction points would give `9` vertices at level 1 instead of `6`.
- Every vertex of `V_m`, `m ≤ 5`, outside `V₀` has four neighbours and every corner two.
- The least distance between two disjoint cells of level `m` is exactly `(√3/2) 2^(−m)` for
  `m = 2, …, 5` (the squared distance times `4^m` is `3/4`), so the bound proved above is
  attained; at level 1 the three cells pairwise meet. For `m ≤ 5` every pair of different
  cells falls in one of the two cases above as stated.

*Needs:* FractalGeometry 1.1; Mathlib `EuclideanSpace`, `midpoint`, `midpoint_self`,
`dist_midpoint_midpoint_le`, `LipschitzWith.of_dist_le_mul`, `Finset.image`, `Sym2`. (Proved
here; Kig93, Example 8.2, p. 749, for the system and Definition 1.6, p. 724, for `V_m`.)

### 1.2 The vertices are dense in the gasket

Prove `closure_vertexSet`: if `K` is an attractor of `sierpinskiIFS`, then `K` is the closure of
`V_*`.

Route: `pᵢ` is the fixed point of `Fᵢ`; for `x ∈ K` the iterates `Fᵢⁿ x` stay in `K` and
converge to `pᵢ`, so `pᵢ ∈ K` because `K` is closed; then `F_w pᵢ ∈ F_w(K) ⊆ K`, so `V_* ⊆ K`
and its closure too. Conversely `K = ⋃_(|w| = m) F_w(K)`, each `F_w(K)` has diameter at most
`2^(−m) diam K` and contains the vertex `F_w p₀`, so every point of `K` is within
`2^(−m) diam K` of `V_m`.

**Checks.**
- The solid triangle `T` is compact, nonempty and contains `V_*`, but `F₀(T) ∪ F₁(T) ∪ F₂(T)`
  misses the open triangle with corners `q₀, q₁, q₂`, so `T` is not an attractor, and `T` is not
  the closure of `V_*`: the attractor hypothesis is needed.

*Needs:* 1.1; FractalGeometry 1.1; Mathlib `closure`, `IsCompact.isClosed`,
`LipschitzWith.ediam_image_le`. (Proved here.)

### 1.3 The level networks

Copy verbatim from ElectricalNetworksAndRandomWalks 1.1, 1.2, 2.1 and 2.2 the structure `Network`
and its `Network.weight`, `Network.graph`, `Network.IsHarmonicAt`, `Network.laplacian`,
`Network.groundedLaplacian`, `Network.voltage`, `Network.effResistance` and
`Network.dirichletEnergy`. Define `levelNetwork m`, the network on the finite type of points of
`V_m` with conductance `(5/3)^m` on the pairs in `edges m` and `0` elsewhere. Prove
`connected_levelNetwork`: its graph is connected for every `m`.

- Its graph is the level-`m` graph of 1.1 and it has no loops.
- `(levelNetwork m).laplacian` is `(5/3)^m` times Mathlib's `SimpleGraph.lapMatrix` of the level
  graph.

Route for connectivity: by induction on `m`. The graph of level `m + 1` is the union of the images
under `F₀`, `F₁`, `F₂` of the graph of level `m` (1.1), each connected by the induction
hypothesis, and the images under `Fᵢ` and `Fⱼ` share the vertex `midpoint(pᵢ, pⱼ)`.

*Needs:* 1.1; ElectricalNetworksAndRandomWalks 1.1, 1.2, 2.1, 2.2 (definitions); Mathlib
`SimpleGraph.Connected`, `SimpleGraph.fromRel`, `SimpleGraph.lapMatrix`. (Proved here.)

### Examples

At level 1 the six vertices are the corners and the midpoints `qᵢ` of the sides opposite them;
the midpoints are the junction points, each in two cells. At level 2 the fifteen vertices include
nine new points, three in each cell of level 1.

### Dependencies

FractalGeometry 1.1 (copied definitions); ElectricalNetworksAndRandomWalks 1.1, 1.2, 2.1, 2.2
(copied definitions); Mathlib `EuclideanSpace`, `midpoint`, `midpoint_self`,
`dist_midpoint_midpoint_le`, `LipschitzWith.of_dist_le_mul`, `LipschitzWith.ediam_image_le`,
`Finset.image`, `Sym2`, `closure`, `IsCompact.isClosed`, `SimpleGraph.Connected`,
`SimpleGraph.fromRel`, `SimpleGraph.lapMatrix`. No other layer.

## Layer 2: Renormalised energies and harmonic extension

### 2.1 The level energies

Define `energy m f`, written `E_m(f)`, as the Dirichlet energy of `levelNetwork m` at the values
of `f` on `V_m`; it equals `(5/3)^m ∑ (f(x) − f(y))²` over the edges of level `m`, each once.

- `E_m` depends only on the values on `V_m`, is a nonnegative quadratic form, and vanishes
  exactly at the functions constant on `V_m` (1.3, connectivity).
- *Self-similar identity at a finite level*: `E_(m+1)(f) = (5/3) ∑ᵢ E_m(f ∘ Fᵢ)`, because the
  edges of level `m + 1` are the disjoint images of those of level `m` (1.1). Iterated,
  `E_m(f) = (5/3)^m ∑_(|w| = m) E₀(f ∘ F_w)`, which is Kig93, Lemma 6.13.1, p. 743, for the
  gasket.

**Checks.**
- The function with corner values `(1, 0, 0)` has `E₀ = 2`.
- The first coordinate `x ↦ x₁` has `E_m = (3/2)(5/4)^m` (`3/2, 15/8, 75/32, …`), which tends to
  infinity: a linear function of the plane has infinite energy on the gasket.

*Needs:* 1.1, 1.3. (Proved here; Kig93, Lemma 6.13.1, p. 743.)

### 2.2 Renormalisation

Prove `isLeast_energy_succ`: for every `m` and `f`, the least value of `E_(m+1)(g)` over the
functions `g` equal to `f` on `V_m` is `E_m(f)`. Consequently `E_m(f) ≤ E_(m+1)(f)` for every
`f` (take `g = f`), so `E_m(f)` is nondecreasing in `m` (Kig93, Corollary 6.14, p. 744;
Strichartz, eqs. (3)–(5), pp. 1200–1201).

Route: by the self-similar identity of 2.1 and the disjointness of the new points of different
cells (1.1), the minimisation splits into one problem per cell of level `m`, each the image under
`F_w` of the problem at level 1. At level 1 the three new points `q₀, q₁, q₂` each have four
neighbours, and the minimiser is harmonic there; solving the `3 × 3` system gives
`f(qᵢ) = (2/5)(f(pᵢ₊₁) + f(pᵢ₊₂)) + (1/5) f(pᵢ)`. Substituting, the unrenormalised level-1
minimum is `(3/5) ∑_(i<j) (f(pᵢ) − f(pⱼ))²`, which is the statement that the trace of the
level-1 network with unit conductances on `V₀` is `(3/5)` times the level-0 one: Kigami's
`T − ᵗJ X⁻¹ J = λ⁻¹ D` with `λ = 5/3` (Definition 4.1, p. 733, and Definition 4.4, p. 734; the
value `λ = 5/3` is stated in Example 8.2, p. 749). With the factor `5/3` this minimum is `E₀`.

**Checks.**
- For corner values `(1, 0, 0)`: `E₀ = 2`, the unrenormalised level-1 minimum is `6/5 = (3/5)·2`,
  and `E₁` of the minimiser is `2`. With a factor `c` in place of `5/3` the level-1 minimum is
  `c · 6/5`, which equals `E₀ = 2` only for `c = 5/3`; `c = 2` would give `12/5`.
- For `f(a p₁ + b p₂) = a² − 3b + 5ab` the energies `E₀, …, E₅` are
  `26, 205/6, 8275/192, 165625/3072, 3310625/49152, 22059375/262144`, strictly increasing.
- For `m ≤ 4` and that `f`, the extension of `f|V_m` by the rule has
  `E_(m+1) = E_m(f)`.

*Needs:* 1.1, 1.3, 2.1. (Proved here; Kig93, Corollary 6.14, p. 744, and Example 8.2, p. 749.)

### 2.3 The (2/5, 2/5, 1/5) rule

Prove `energy_succ_eq_iff`: `E_(m+1)(g) = E_m(g)` holds exactly when, for every word `w` of
length `m` and every `i`, the value of `g` at `F_w(midpoint(pᵢ₊₁, pᵢ₊₂))` is
`(2/5)(g(F_w pᵢ₊₁) + g(F_w pᵢ₊₂)) + (1/5) g(F_w pᵢ)` (Strichartz, p. 1200, the "(2/5, 1/5) law";
for the gasket, Kigami's matrices `A_s` of (2.2), p. 728, are these weights).

Route: the level-1 problem of 2.2 is a strictly convex quadratic minimisation (its Hessian is the
grounded Laplacian of the level-1 graph, positive definite by connectivity), so its minimiser is
unique; on each cell the energy defect `E_(m+1)(g) − E_m(g)` is `(5/3)^(m+1)` times the
quadratic form of the deviation of `g` from the rule, which is positive definite.

**Checks.**
- For `m ≤ 4`, adding `1/7` to the value of the rule extension at one new point of level `m + 1`
  makes `E_(m+1)` strictly larger than `E_m`.
- The rule is affine and reproduces constants: weights `2/5 + 2/5 + 1/5 = 1`.
- The plausible wrong rule "average of the two ends of the side" (weights `1/2, 1/2, 0`), the
  rule of linear interpolation, gives for corner values `(1, 0, 0)` the level-1 energy
  `(5/3)(3/2) = 5/2 > 2` (the values `1/2, 1/2, 0` at `q₂, q₁, q₀` make six of the nine edges
  differ by `1/2`).

*Needs:* 1.1, 1.3, 2.1, 2.2. (Proved here; Strichartz, p. 1200.)

### 2.4 The energy and its self-similarity

Define `energyLimit f`, written `E(f)`, as `⨆ₘ E_m(f)` in `[0, ∞]`; by 2.2 it is the limit of
`E_m(f)`. Its domain is the set of `f` with `E(f) < ∞`; it contains every function that follows
the rule of 2.3 above some level (Kig93, Proposition 7.2, p. 745), and the energy vanishes exactly
on functions constant on `V_*`. Prove `energyLimit_eq_sum`: `E(f) = (5/3) ∑ᵢ E(f ∘ Fᵢ)`
(Strichartz, eq. (6), p. 1201).

Route: take the supremum over `m` in the self-similar identity of 2.1; the three sequences are
nondecreasing, so the supremum of the sum is the sum of the suprema (Mathlib
`ENNReal.finsetSum_iSup_of_monotone`, `ENNReal.mul_iSup`), and the term `m = 0` on the left does
not change the supremum since `E₀ ≤ E₁`.

**Checks.**
- The function with corner values `(1, 0, 0)` extended by the rule at every level has
  `E_m = 2` for `m ≤ 5`, so `E = 2`; its restrictions to the three cells, renormalised, give
  `(5/3)(E(h₀) + E(h₁) + E(h₂))` with the cell restrictions having corner values `(1, 2/5, 2/5)`,
  `(2/5, 0, 1/5)` and `(2/5, 1/5, 0)` and energies `18/25, 6/25, 6/25`: the sum is
  `(5/3)(30/25) = 2`.
- The first coordinate has `E = ∞` (2.1), so the identity reads `∞ = ∞`.

*Needs:* 2.1, 2.2; Mathlib `ENNReal.finsetSum_iSup_of_monotone`, `ENNReal.mul_iSup`.
(Proved here; Strichartz, eq. (6), p. 1201.)

### Examples

The harmonic functions of Layer 3 have `E = E₀`; the first coordinate has `E = ∞`; a function
equal to the rule extension of its values on `V_m` has `E = E_m`.

### Dependencies

Layer 1 (1.1, 1.3); Mathlib `ENNReal.finsetSum_iSup_of_monotone`, `ENNReal.mul_iSup`.

## Layer 3: Harmonic functions

### 3.1 Harmonic functions

Define `IsHarmonic f`: for every `m`, `f` is harmonic in `levelNetwork m`, in the sense of
ElectricalNetworksAndRandomWalks 1.2 (`Network.IsHarmonicAt`), at every vertex of `V_m` outside
`V₀`. This is Kig93, Definition 2.4, p. 727, for the gasket, except that continuity on `K` is
stated separately in each theorem.

**Checks.**
- A constant is harmonic; the first coordinate is not: at `q₀ = midpoint(p₁, p₂)`, of first
  coordinate `3/4`, the level-1 neighbours `p₁, p₂, q₁, q₂` have first coordinates
  `1, 1/2, 1/4, 1/2`, whose sum `9/4` is not `4 · 3/4 = 3`. (At `q₂` the sum `0 + 1 + 3/4 + 1/4`
  is `4 · 1/2`, so a test at one point does not suffice.)

*Needs:* 1.3; ElectricalNetworksAndRandomWalks 1.2 (definition). (Kig93, Definition 2.4, p. 727.)

### 3.2 Harmonic means energy-minimising

Prove `isHarmonic_iff`: `f` is harmonic exactly when `E_m(f) = E₀(f)` for every `m` (Kig93,
Corollary 6.14, p. 744, with Lemma 4.5, p. 734).

Route: if `E_m(f)` is constant, 2.3 gives the rule at every level. A function following the rule
from level `m` to `m + 1` is harmonic at the new points of level `m + 1` (the rule solves the
level-1 harmonic system of 2.2 on each cell), and at a vertex `x ∈ V_m \ V₀` its level-`(m+1)` sum
`∑_(y ∼ x) (f(y) − f(x))` is `3/5` of its level-`m` sum (Kig93, Lemma 4.5, with `λ = 5/3`), so
harmonicity at old points passes up. Conversely, harmonicity at the new points of level `m + 1`
is the level-1 system on each cell, whose unique solution is the rule; so 2.3 gives
`E_(m+1)(f) = E_m(f)`.

**Checks.**
- The rule extension of corner values `(1, 0, 0)` to `V₅` is harmonic at every vertex of
  `V₅ \ V₀` in the level-5 graph, and its energies are all `2`.
- The function equal to that extension on `V₁` and to `0` on `V₂ \ V₁` has
  `E₂ > E₁ = E₀`: harmonicity is required at every level.

*Needs:* 2.2, 2.3, 3.1. (Kig93, Corollary 6.14 and Lemma 4.5.)

### 3.3 The boundary value problem

Prove `existsUnique_isHarmonic`: for an attractor `K` and values `b` on the corners there is a
harmonic `f`, continuous on `K`, with `f(pᵢ) = bᵢ`; and two harmonic functions with the same
corner values agree on `V_*`. With 1.2, two such functions that are continuous on `K` agree on
`K`, so the harmonic functions continuous on `K` form a three-dimensional space, parametrised by
the corner values (Kig93, Theorem 4.7, p. 734; Strichartz, p. 1201). The statement is about the
gasket `K`; the route uses `hK` through 1.2, that `K` is the closure of `V_*`, to extend the
function from `V_*` to a function continuous on `K`.

Route: uniqueness: on `V_m` both are solutions of the Dirichlet problem of `levelNetwork m` with
boundary `V₀`, which has one solution (ElectricalNetworksAndRandomWalks 1.2, Dirichlet problem,
with 1.3 for connectivity). Existence: extend `b` level by level by the rule (2.3); by 3.2 the
result is harmonic. Continuity: the oscillation argument of 3.5 runs on the vertices alone (the
vertices of `V_*` in a cell `F_w(K)` are images under `F_w` of vertices, and the matrices `Aᵢ`
contract oscillation by `3/5`), so with the distance bound of 1.1 the function is uniformly
continuous on `V_*`; by 1.2 it extends to a function continuous on `K` (Mathlib
`IsDenseInducing.extend`, `uniformContinuous_uniformly_extend`, `uniformly_extend_of_ind`), which
agrees with it on `V_*` and is therefore harmonic too.

**Checks.**
- Corner values `(1, 1, 1)` give the constant `1`.
- Corner values `(1, 0, 0)` give `2/5, 2/5, 1/5` at `q₂, q₁, q₀` and `E = 2`.

*Needs:* 1.1, 1.2, 1.3, 2.3, 3.1, 3.2; ElectricalNetworksAndRandomWalks 1.2
(existsUnique_isHarmonicAt); Mathlib `IsDenseInducing.extend`,
`uniformContinuous_uniformly_extend`, `uniformly_extend_of_ind`. (Kig93, Theorem 4.7, p. 734.)

### 3.4 The maximum principle

Prove `inf'_le_and_le_sup'_of_isHarmonic`: a harmonic function continuous on `K` takes at every
point of `K` a value between its least and its greatest corner value (Kig93, Theorem 2.9, p. 730,
with Lemma 4.6, p. 734).

Route: on `V_m` this is the maximum principle of ElectricalNetworksAndRandomWalks 1.2 applied to
`f` and `−f` with `B = V₀`; continuity and 1.2 carry it to `K`.

**Checks.**
- Corner values `(1, 0, 0)`: all values on `V₅` lie in `[0, 1]`, and the value `0` is attained
  only at `p₁`, `p₂` among the vertices of level 1.

*Needs:* 1.2, 1.3, 3.1; ElectricalNetworksAndRandomWalks 1.2 (exists_mem_le_of_isHarmonicAt).
(Kig93, Theorem 2.9, p. 730.)

### 3.5 Oscillation decay

Prove `abs_sub_le_of_isHarmonic`: if `f` is harmonic and continuous on `K`, then for every word
`w` of length `m` and all `x, y ∈ F_w(K)`, `|f(x) − f(y)| ≤ (3/5)^m (max f(pᵢ) − min f(pᵢ))`.
(Proved here.)

Route: `f ∘ F_w` follows the rule at every level, so it is harmonic (3.2), and it is continuous
on `K` because `F_w(K) ⊆ K`; so by 3.4 its oscillation on `K` is its
oscillation on the corners of the cell. The corner values of `f ∘ F_(w i)` are `Aᵢ` applied to
those of `f ∘ F_w`, where `Aᵢ` is the matrix of the rule (row `i` the unit vector, the other rows
`(2/5, 2/5, 1/5)` with `1/5` at the opposite corner). Every `Aᵢ` reproduces constants and
contracts the oscillation `max − min` by `3/5`: the oscillation of `Aᵢ x` is a convex function of
`x`, invariant under adding constants and homogeneous, so it suffices to check the vectors with
entries in `{0, 1}`, where the largest ratio is `3/5`. Induct on `m`.

**Checks.**
- For corner values `(1, 0, 0)`, the largest oscillation on the corners of a cell of level `m` is
  exactly `(3/5)^m` for `m = 0, …, 4` (`1, 3/5, 9/25, 27/125, 81/625`), so the factor is sharp.
- The factor `1/2` of linear interpolation would be wrong already at level 1: corner values
  `(1, 0, 0)` give the values `1, 2/5, 2/5` on the corners of `F₀(K)`, of oscillation `3/5`.

*Needs:* 1.1, 2.3, 3.2, 3.4. (Proved here.)

### 3.6 Hölder continuity of harmonic functions

Prove `exists_abs_sub_le_of_isHarmonic`: for an attractor `K` there is `C` such that every
harmonic `f` continuous on `K` satisfies
`|f(x) − f(y)| ≤ C (max f(pᵢ) − min f(pᵢ)) |x − y|^β` on `K`, with `β = log(5/3)/log 2`.
(Proved here.)

Route: let `x ≠ y` in `K`. If `|x − y| ≥ √3/2`, then 3.4 gives the bound with `C ≥ (2/√3)^β`.
Otherwise choose `m ≥ 0` with `(√3/2) 2^(−m−1) ≤ |x − y| < (√3/2) 2^(−m)`. The cells of level
`m` containing `x` and `y` are not disjoint, by the distance bound of 1.1 (disjoint cells of
level `m` are at distance at least `(√3/2) 2^(−m)`, since `F_w(K) ⊆ F_w(T)` (`K ⊆ T` by 1.2)
and two cells `F_w(T)`, `F_v(T)` without a common corner are that far apart, while a common
corner `F_w pᵢ` lies in `F_w(K)` because `pᵢ ∈ K`). So they share a point `z`, and 3.5 gives
`|f(x) − f(y)| ≤ 2 (3/5)^m osc`. Since `3/5 = 2^(−β)` and `2^(−m) ≤ (4/√3)|x − y|`,
`(3/5)^m = (2^(−m))^β ≤ ((4/√3)|x − y|)^β`, and `C = 2 (4/√3)^β` works; it is at least
`(2/√3)^β`, so it covers the first case too, and `x = y` is trivial.

**Checks.**
- `β = log(5/3)/log 2 ≈ 0.737 < 1`. The harmonic function with corner values `(1, 0, 0)` takes
  at `F₀^m p₁`, the point of the side `p₀p₁` at distance `2^(−m)` from `p₀`, the value
  `1 − (3/5)^m` (`2/5` for `m = 1`, `16/25` for `m = 2`, by the rule applied to the corner values
  `(1, 2/5, 2/5)` of `F₀(K)`), so `|f(p₀) − f(x)| = |p₀ − x|^β` along that sequence: no larger
  exponent works.

*Needs:* 1.1 (distance of disjoint cells), 1.2, 3.4, 3.5. (Proved here.)

### Examples

The harmonic function with corner values `(1, 0, 0)`; the constants; the harmonic functions with
corner values `(0, 1, −1)`, which are odd under the reflection exchanging `p₁` and `p₂`.

### Dependencies

Layers 1 and 2 (1.1, 1.2, 1.3, 2.2, 2.3); ElectricalNetworksAndRandomWalks 1.2
(existsUnique_isHarmonicAt, exists_mem_le_of_isHarmonicAt); Mathlib `IsDenseInducing.extend`,
`uniformContinuous_uniformly_extend`, `uniformly_extend_of_ind`.

## Layer 4: The resistance metric

### 4.1 Consistency of effective resistances

Define `resistance x y`, written `R(x, y)`, as the inverse in `[0, ∞]` of the infimum of `E(f)`
over the functions with `f(x) = 1` and `f(y) = 0`; it is `0` for `x = y`, where no such function
exists (Strichartz, p. 1203, describes `d_R(x, y)` as the infimum of the energy of an `f` with
`f(x) = 0` and `f(y) = 1`, without the reciprocal). Prove
`resistance_eq_effResistance`: for `x, y ∈ V_m`, `R(x, y)` is the effective resistance between
`x` and `y` in `levelNetwork m`, in the sense of ElectricalNetworksAndRandomWalks 2.1. In
particular that effective resistance does not depend on
`m` (Strichartz, p. 1203, stated without proof). (Proved here.)

- `R` is symmetric, satisfies the triangle inequality and is positive off the diagonal on `V_*`,
  because by the theorem it is the effective resistance of one network for any two or three
  vertices (ElectricalNetworksAndRandomWalks 2.5); so `R` is a metric on `V_*`.
- *The resistance estimate*: for `x, y ∈ V_*`, `(f(x) − f(y))² ≤ R(x, y) E(f)`. For
  `f(x) ≠ f(y)`, the function `(f − f(y))/(f(x) − f(y))` is admissible in the definition of `R`
  and has energy `E(f)/(f(x) − f(y))²`.

Route: let `x ≠ y` in `V_m`. For `f` with `f(x) = 1`, `f(y) = 0`, `E(f) ≥ E_m(f) ≥ 1/R_m(x, y)`
by 2.2 and Dirichlet's principle (ElectricalNetworksAndRandomWalks 2.2, isLeast_dirichletEnergy,
with 1.3 for connectivity). The minimiser of Dirichlet's principle, extended level by level by the
rule, has `E = E_m = 1/R_m(x, y)` by 2.2 and 2.3. So the infimum is `1/R_m(x, y)`, which is
positive and finite (ElectricalNetworksAndRandomWalks 2.5, effResistance_pos).

**Checks.**
- `R(pᵢ, pⱼ) = 2/3` for `i ≠ j`, computed as the effective resistance of `levelNetwork m` for each
  `m = 0, …, 4`. Without renormalisation (unit conductances) the level-`m` value is
  `(2/3)(5/3)^m` (`2/3, 10/9, 50/27, 250/81`), which tends to infinity: the conductance factor
  `(5/3)^m` of the level networks is exactly what keeps the effective resistance constant.
- On `V₁`: corner to corner `2/3`, a corner to the midpoint of an adjacent side `11/30`, a corner
  to the midpoint of the opposite side `1/2`, midpoint to midpoint `4/15`; for each of the
  fifteen pairs the effective resistance of `levelNetwork m` is the same for `m = 1, 2, 3, 4`.
- `R(x, x) = 0`: the set of admissible functions is empty, its infimum is `∞`.

*Needs:* 1.3, 2.2, 2.3, 2.4; ElectricalNetworksAndRandomWalks 2.1, 2.2 (isLeast_dirichletEnergy),
2.5 (effResistance_pos). (Proved here.)

### 4.2 Comparison with the Euclidean metric

Prove `exists_resistance_le`: there is `C` with `R(x, y) ≤ C |x − y|^β` for all `x, y ∈ V_*`,
where `β = log(5/3)/log 2`. (Proved here.)

Route:
- *Two corners of a cell.* If `a`, `b` are corners of a cell `F_w(T)` of level `k` (`T` the
  solid triangle of 1.1), then `R(a, b) ≤ (2/3)(3/5)^k`. Every `f` with `f(a) = 1`,
  `f(b) = 0` has, for `n ≥ k`,
  `E_n(f) ≥ (5/3)^k E_(n−k)(f ∘ F_w) ≥ (5/3)^k E₀(f ∘ F_w) ≥ (5/3)^k · 3/2`, by the self-similar
  identity of 2.1 restricted to one cell, by 2.2, and because `1 + t² + (1 − t)² ≥ 3/2`.
- *A vertex and a corner of its cell.* If `x ∈ V_* ∩ F_w(T)` with `|w| = k`, then
  `R(x, F_w pᵢ) ≤ (5/3)(3/5)^k`: if `x` is not a corner of that cell, then `x = F_u pⱼ` for a word
  `u` of length `n` extending `w` (write `x = F_u pⱼ` with `|u| = n ≥ k`, as `V_k ⊆ V_n`; then
  `x ∈ F_(u|k)(T) ∩ F_w(T)`, and if `u|k ≠ w`, 1.1 makes `x` a corner of `F_w(T)`). The points
  `c_l = F_(u|l)(p_(u l))`, `k ≤ l < n`, where `u|l` is the prefix of length `l` and `u l` the
  letter in position `l`, are corners of both `F_(u|l)(T)` and `F_(u|(l+1))(T)`. So
  `F_w pᵢ, c_k` are corners of a cell of level `k`, `c_l, c_(l+1)` of one of level `l + 1`, and
  `c_(n−1), x` of one of level `n`; the triangle inequality (4.1) and the previous bullet give
  `R ≤ (2/3)((3/5)^k + ∑_(l>k) (3/5)^l) = (5/3)(3/5)^k`.
- *Conclusion.* For `0 < |x − y| < √3/2`, choose `m ≥ 0` with
  `(√3/2) 2^(−m−1) ≤ |x − y| < (√3/2) 2^(−m)`; every vertex lies in a cell `F_w(T)` of level `m`
  (a vertex `F_u pⱼ` with `|u| ≥ m` lies in `F_(u|m)(T)`, and one of `V_m` is a corner of a cell),
  and by the distance bound of 1.1 the cells of level `m` containing `x` and `y` share a corner
  `z`, and `R(x, y) ≤ R(x, z) + R(z, y) ≤ (10/3)(3/5)^m ≤ (10/3)(4/√3)^β |x − y|^β`, since
  `2^(−m) ≤ (4/√3)|x − y|` and `3/5 = 2^(−β)`.
  For `|x − y| ≥ √3/2`, the previous bullet with `k = 0` gives
  `R(x, y) ≤ R(x, p₀) + R(p₀, y) ≤ 10/3 ≤ (10/3)(4/√3)^β |x − y|^β`; for `x = y`, `R(x, x) = 0`
  (4.1). So `C = (10/3)(4/√3)^β` works.

**Checks.**
- The first bullet is an equality for `k = 0` and strict for every pair of corners of every cell
  of level `k = 1, 2` (effective resistances of `levelNetwork 3`), because the rest of the gasket
  offers further paths: for the cell `F₀(K)` the resistance between its corners `p₀` and `q₂` is
  `11/30 < 2/5 = (2/3)(3/5)`, and between the corners `q₁`, `q₀` of `F₂(K)` it is `4/15`.
- `R(p₀, q₂) = 11/30 ≤ (5/3)(3/5) = 1` for the vertex `q₂ = midpoint(p₀, p₁)` of the cell
  `F₀(K)` and its corner `p₀`.

*Needs:* 1.1 (distance of disjoint cells), 2.1, 2.2, 4.1; ElectricalNetworksAndRandomWalks 2.5
(effResistance_triangle). (Proved here.)

### 4.3 Finite energy implies Hölder continuity

Prove `exists_abs_sub_le_of_energyLimit_ne_top`: there is `C` such that every `f` with
`E(f) < ∞` satisfies `|f(x) − f(y)| ≤ C √E(f) |x − y|^(β/2)` for `x, y ∈ V_*`, where
`β/2 = log(5/3)/(2 log 2)`. (Proved here.)

Route: the resistance estimate of 4.1 and 4.2: `(f(x) − f(y))² ≤ R(x, y) E(f) ≤
C' |x − y|^β E(f)`; take square roots.

**Checks.**
- The exponent is half that of 3.6: `β/2 ≈ 0.368`. The harmonic functions have the better
  exponent `β`; the estimate here holds for every function of finite energy.
- For `f` the rule extension of `(1, 0, 0)` and `x = p₀`, `y = p₁`: `1 ≤ R(p₀, p₁) E(f) = (2/3) · 2
  = 4/3`.

*Needs:* 4.1, 4.2. (Proved here.)

### 4.4 Functions of finite energy are continuous

Prove `exists_continuousOn_eqOn_of_energyLimit_ne_top`: for an attractor `K` and `f` with
`E(f) < ∞`, some `g` continuous on `K` agrees with `f` on `V_*`; by 1.2 it is unique on `K`
(Kig93, Theorem 7.4 (1), p. 745, with Lemma 7.4.4, p. 746, where the domain `𝓕` of the energy
is shown to lie in the continuous functions). The statement is about the gasket `K`; the route
uses `hK` through 1.2, that `K` is the closure of `V_*`, to extend `f` from `V_*` to `K`.

Route: by 4.3, `f` is Hölder on `V_*` (Mathlib `HolderOnWith`), hence uniformly continuous on
`V_*` (`HolderOnWith.uniformContinuousOn`). Since `V_*` is dense in `K` (1.2), the inclusion of
`V_*` in `K` is a dense uniform inducing map and `f` extends to a uniformly continuous function on
`K` (Mathlib `IsDenseInducing.extend`, `uniformContinuous_uniformly_extend`,
`uniformly_extend_of_ind`); extend it arbitrarily off `K`.

**Checks.**
- For the indicator of `{p₀}`, equal to `1` at `p₀` and `0` elsewhere, `E_m = 2 (5/3)^m → ∞`,
  consistent with its discontinuity: finite energy is needed.

*Needs:* 1.2, 4.3; Mathlib `HolderOnWith`, `HolderOnWith.uniformContinuousOn`,
`IsDenseInducing.extend`, `uniformContinuous_uniformly_extend`, `uniformly_extend_of_ind`. (Kig93,
Theorem 7.4 (1), p. 745.)

### Examples

`R(p₀, p₁) = 2/3`; the resistances on `V₁` listed in 4.1; the bound `R(x, F_w pᵢ) ≤ (5/3)(3/5)^k`
for vertices of a cell of level `k`.

### Dependencies

Layers 1 and 2 (1.1, 1.2, 1.3, 2.1–2.4); ElectricalNetworksAndRandomWalks 2.1, 2.2, 2.5;
Mathlib `HolderOnWith`, `HolderOnWith.uniformContinuousOn`, `IsDenseInducing.extend`,
`uniformContinuous_uniformly_extend`, `uniformly_extend_of_ind`.

## Layer 5: The Laplacian

### 5.1 The Laplacian

Define `cornerVertex m i`, the corner `pᵢ` as a point of `V_m`, and `IsLaplacianOn K f u`: `f`
and `u` are continuous on `K`, and for every `ε > 0` there is `M` such that for `m ≥ M` and every
`x ∈ V_m \ V₀`,

    |(3/2) 5^m ∑_(y ∼_m x) (f(y) − f(x)) − u(x)| ≤ ε,

where the sum is `−(3/5)^m (L_m f)(x)` for the Laplacian `L_m` of `levelNetwork m`. Write `Δf = u`.

This is Kigami's Laplacian `Δ_μ` for the gasket and the measure `μ` (Kig93, Definition 6.1,
p. 741; Strichartz, eq. (9), p. 1201): Kigami's level operator is `λ^m μ_(m,p)⁻¹ H_(m,p) f` with
`μ_(m,p) = ∫ ψ_p^m dμ`, the integral of the piecewise harmonic tent function at `p`. For the
gasket, `μ_(m,p) = (2/3) 3^(−m)` at every `p ∈ V_m \ V₀` (proved here): `p` lies in exactly two
cells of level `m` (1.1), on each of which `ψ_p^m ∘ F_w` is the harmonic function with corner
values a unit vector; `μ` gives the cell mass `3^(−m)` and
`∫ g dμ = 3^(−m) ∑_(|w| = m) ∫ g ∘ F_w dμ`
(the invariance of `μ`, iterated with Mathlib `MeasureTheory.integral_map`); and the integral of
a harmonic function is the mean of its corner values, because the vector `c` of integrals of the
three basic harmonic functions satisfies `c = (1/3) ∑ᵢ ᵗAᵢ c` and `ᵗ((1/3) ∑ᵢ Aᵢ)` fixes only the
multiples of `(1/3, 1/3, 1/3)`, normalised by `∫ 1 dμ = 1`. So
`λ^m μ_(m,p)⁻¹ = (5/3)^m (3/2) 3^m = (3/2) 5^m`.

**Checks.**
- The integral of the harmonic function with corner values `(1, 0, 0)` is `1/3`: the matrix
  `(1/3) ∑ᵢ Aᵢ` has `(1/3, 1/3, 1/3)` as left fixed vector.
- For `u` with `Δu = 1` and `u = 0` on `V₀`, the level-`m` equations
  `(3/2) 5^m ∑_(y ∼ x) (u(y) − u(x)) = 1` on `V_m \ V₀` have solutions whose restrictions agree
  for `m = 1, …, 4`, with `u(q₂) = −1/15` at every level; with the factor `5^m` replaced by `4^m`
  (the factor of the interval's dyadic grid squared) the restrictions would not agree.

*Needs:* 1.1, 1.3, 2.3, 3.3; FractalGeometry 1.5; Mathlib `MeasureTheory.integral_map`,
`Matrix.mulVec`. (Kig93, Definition 6.1, p. 741; the value of `μ_(m,p)` proved here.)

### 5.2 Normal derivatives and the Gauss–Green formula

Let `μ` be a Borel probability measure on the plane with `μ = ∑ᵢ (1/3) (Fᵢ)_* μ`, the
self-similar measure of FractalGeometry 1.5 for the weights `1/3`; it gives `K` mass `1`
(FractalGeometry 1.5, IFS.measure_attractor_eq_one). Prove `exists_tendsto_energyForm`: if
`Δv = φ`, then for each corner the sequence
`(L_m v)(pᵢ) = (5/3)^m ∑_(y ∼_m pᵢ) (v(pᵢ) − v(y))` converges to a number `∂ₙv(pᵢ)` (Kig93,
Definition 6.2 and Lemma 6.4, p. 741), and for every `u` continuous on `K` the level forms
`E_m(u, v) = ∑_(x ∈ V_m) u(x) (L_m v)(x)` converge to
`∑ᵢ u(pᵢ) ∂ₙv(pᵢ) − ∫_K u φ dμ` (Kig93, Lemma 6.8, p. 742; for `u` of finite energy the limit is
`E(u, v)`, Proposition 7.3, p. 745; Strichartz, eq. (10), p. 1201, and Theorem 1, p. 1202).
Strichartz's eq. (10) prints the difference as `f(y) − f(x)`; his Gauss–Green formula needs the
sign used here, as the first Check below shows.

- *Gauss–Green*: for `Δu = ψ` and `Δv = φ`,
  `∫_K (u φ − v ψ) dμ = ∑ᵢ (u(pᵢ) ∂ₙv(pᵢ) − v(pᵢ) ∂ₙu(pᵢ))`, by the symmetry
  `E_m(u, v) = E_m(v, u)` (Kig93, Theorem 6.5, p. 742). With `u = 1`,
  `∫_K φ dμ = ∑ᵢ ∂ₙv(pᵢ)`.
- `∂ₙv(pᵢ)` is the outward derivative: Kigami's `(dv)_p = lim −λ^m H_(m,p) v`, and
  `−λ^m H_(m,p) = L_m` at `p` (Conventions).

Route: Kig93, Lemmas 6.3, 6.4 and 6.8, pp. 741–742, specialised by the Conventions (the gasket
meets every hypothesis, and `μ` is admissible) and by 5.1 (the level operator). The level form
identity `∑_x u(x)(L_m v)(x) = −λ^m ᵗu H_m v` is Kigami's Definition 6.6; his Lemma 6.7, p. 742,
writes the double sum over ordered pairs without the factor `1/2` it needs, which is not used here.

**Checks.**
- For `Δu = 1`, `u = 0` on `V₀` (5.1): `(L_m u)(p₀) = 2/9, 8/27, 26/81, 80/243` for
  `m = 1, …, 4`, that is `1/3 − 3^(−m−1)`, so `∂ₙu(pᵢ) = 1/3` for each corner by symmetry and
  `∑ᵢ ∂ₙu(pᵢ) = 1 = ∫_K 1 dμ`, the case `u = 1` of Gauss–Green. With the constant `1` in place of
  `3/2` in 5.1 the solution is multiplied by `3/2` and the sum of the normal derivatives would be
  `3/2 ≠ 1`: the constant `3/2` is forced by `μ`.
- For `v` harmonic with corner values `(1, 0, 0)`: `Δv = 0`; the level-`m` neighbours of `p₀`
  have the value `1 − (3/5)^m` (3.6), so `(L_m v)(p₀) = (5/3)^m · 2 (3/5)^m = 2` at every level;
  at `p₁` the level-1 neighbours have the values `2/5` and `1/5`, so `(L₁ v)(p₁) = −1`, and the
  value does not change with `m` (Kig93, Lemma 4.5, for the harmonic `v`). Thus
  `∂ₙv = (2, −1, −1)`, summing to `0 = ∫_K Δv dμ`.
- The invariance equation is linear, so `2μ` satisfies it too. Take `v` the solution of `Δv = 1`
  above and the test function `1`: the level forms `∑_x (L_m v)(x)` are `0` (the rows of `L_m`
  sum to `0`), and with `μ` the right side is `1 − 1 = 0`, but with `2μ` it would be
  `1 − 2 = −1`: the normalisation to a probability measure is needed.

*Needs:* 1.1, 1.3, 3.3, 5.1; FractalGeometry 1.4, 1.5 (IFS.existsUnique_selfSimilarMeasure,
IFS.measure_attractor_eq_one); Mathlib `MeasureTheory.Measure.map`,
`ContinuousOn.integrableOn_compact`, `dotProduct`. (Kig93, Lemmas 6.4 and 6.8, pp. 741–742.)

### 5.3 The Dirichlet problem for Poisson's equation

Prove `existsUnique_isLaplacianOn`: for an attractor `K`, `φ` continuous on `K` and corner values
`b`, there is `f` with `Δf = φ` and `f(pᵢ) = bᵢ`, and two such functions agree on `K` (Kig93,
Theorem 6.9, p. 743). Kigami's solution is `∑ᵢ bᵢ ψᵢ − G_μ φ`, with `ψᵢ` the harmonic functions
of 3.3 and `G_μ` the Green operator of his §5, whose defining property is Theorem 5.8 (2), p. 738:
`λ^m H_(m,p)(G_μ φ) = −∫ ψ_p^m φ dμ` at every `p ∈ V_m \ V₀`. The route below obtains a function
with that property, up to sign, level by level, without the Green function.

Route. Let `μ` be the measure of 5.2 (FractalGeometry 1.5, IFS.existsUnique_selfSimilarMeasure,
with `μ K = 1` by IFS.measure_attractor_eq_one); `Δ` does not mention `μ`, which enters only the
proof. Write `E_n(u, v) = ∑_(z ∈ V_n) u(z) (L_n v)(z)`, the symmetric bilinear form with
`E_n(u, u) = E_n(u)` (Conventions).

- *Tent functions.* For `x ∈ V_m` let `ψ_x^m` be the indicator of `x` on `V_m`, extended by the
  rule (2.3) to every level above `m`. Its energies are constant from level `m` on (2.3), so
  `E(ψ_x^m) = E_m(ψ_x^m) < ∞` (2.4), and by 4.4 it is continuous on `K` (we use that version).
  The rule has nonnegative weights and reproduces constants, so on `V_*`, and by continuity and
  1.2 on `K`, `ψ_x^m ≥ 0` and `∑_(x ∈ V_m) ψ_x^m = 1`. On a cell `F_w(K)` of level `m` of which
  `x` is not a corner, `ψ_x^m` is `0` at the vertices, hence on the cell (`F_w(K)` lies in the
  closure of `F_w(V_*) ⊆ V_*`), so `ψ_x^m(y) ≠ 0` with `y ∈ K` forces `|y − x| ≤ 2^(−m)` (cells
  of level `m` have diameter at most `2^(−m)`, as `K ⊆ T` by 1.2). For `x ∉ V₀`,
  `∫ ψ_x^m dμ = (2/3) 3^(−m)` (5.1). Both `ψ_x^m` and `∑_(y ∈ V_(m+1)) ψ_x^m(y) ψ_y^(m+1)`
  follow the rule from level `m + 1` on and agree on `V_(m+1)`, so they are equal on `V_*`, and
  on `K` by continuity and 1.2.
- *Level solutions.* For each `m` there is exactly one `g_m` on `V_m`, `0` on `V₀`, with
  `−(L_m g_m)(x) = ∫_K ψ_x^m φ dμ` for `x ∈ V_m \ V₀`: the map sending a function on `V_m \ V₀`,
  extended by `0` on `V₀`, to the restriction of its `L_m` to `V_m \ V₀` is a linear endomorphism
  of a finite-dimensional space, and injective because an element of its kernel is harmonic off
  `V₀` with zero values on `V₀`, hence `0` (ElectricalNetworksAndRandomWalks 1.2,
  existsUnique_isHarmonicAt, with `B = V₀` and 1.3); so it is surjective (Mathlib
  `LinearMap.injective_iff_surjective`, for an endomorphism of a finite-dimensional space).
- *Consistency: `g_(m+1) = g_m` on `V_m`.* If `h` follows the rule from level `m` to `m + 1`, then
  `E_(m+1)(h, u) = E_m(h, u)` for every `u`. Indeed `h` minimises `E_(m+1)` among the functions
  equal to it on `V_m` (by 2.2 the least value is `E_m(h)`, and `E_(m+1)(h) = E_m(h)` by 2.3), so
  `E_(m+1)(h, d) = 0` when `d = 0` on `V_m`. Write `u = ũ + d` with `ũ` the rule extension of `u`
  from `V_m` and `d = 0` on `V_m`; the quadratic forms `E_(m+1)` and `E_m` agree on the linear
  space of functions following the rule from `m` to `m + 1` (2.3), hence so do their bilinear
  forms, and `E_(m+1)(h, u) = E_(m+1)(h, ũ) = E_m(h, ũ) = E_m(h, u)`. Now let `x ∈ V_m \ V₀`;
  `ψ_x^m` vanishes on `V₀`, so by the last property of the tent functions
  `E_(m+1)(ψ_x^m, g_(m+1)) = −∑_y ψ_x^m(y) ∫_K ψ_y^(m+1) φ dμ = −∫_K ψ_x^m φ dμ`, and by the
  identity just proved this is `E_m(ψ_x^m, g_(m+1)) = (L_m g_(m+1))(x)`. So `g_(m+1)` restricted to
  `V_m` solves the level-`m` system, and equals `g_m` by uniqueness.
- *Bounded energy.* Let `g` be `g_m` on each `V_m` and `0` off `V_*`. Then
  `E_m(g) = ∑_(x ∈ V_m) g(x) (L_m g)(x) = −∫_K (∑_(x ∈ V_m) g(x) ψ_x^m) φ dμ ≤ ‖g‖_m ‖φ‖_K`, with
  `‖g‖_m = max_(V_m) |g|` and `‖φ‖_K = sup_K |φ|` (the terms at `V₀` vanish since `g = 0` there,
  and `|∑_x g(x) ψ_x^m| ≤ ‖g‖_m` on `K` since the tents are nonnegative with sum `1`). As in 5.4,
  Dirichlet's principle in `levelNetwork m` (ElectricalNetworksAndRandomWalks 2.2,
  isLeast_dirichletEnergy, with 1.3), 4.1 and 4.2 give
  `g(x)² = (g(x) − g(p₀))² ≤ R(x, p₀) E_m(g) ≤ (5/3) E_m(g)`. Hence `‖g‖_m ≤ (5/3) ‖φ‖_K` and
  `E_m(g) ≤ (5/3) ‖φ‖_K²` for every `m`, so `E(g) < ∞` (2.4), and 4.4 gives `g̃` continuous on `K`
  equal to `g` on `V_*`.
- *Conclusion.* Let `f = g̃ + h_b`, with `h_b` the harmonic function of 3.3 with corner values `b`;
  `f(pᵢ) = bᵢ`, and `(L_m h_b)(x) = 0` for `x ∉ V₀`. At `x ∈ V_m \ V₀`,
  `(3/2) 5^m ∑_(y ∼ x) (f(y) − f(x)) = (3/2) 3^m ∫_K ψ_x^m φ dμ`, so, by the properties of the
  tent functions, it differs from `φ(x)` by at most
  `(3/2) 3^m ∫_K ψ_x^m |φ − φ(x)| dμ ≤ sup {|φ(y) − φ(x)| : y ∈ K, |y − x| ≤ 2^(−m)}`, which is
  at most `ε` for large `m`, uniformly in `x`, because `φ` is uniformly continuous on the compact
  set `K` (Mathlib `IsCompact.uniformContinuousOn_of_continuous`).

Uniqueness comes from Gauss–Green: the difference of two solutions satisfies `Δd = 0` with
`d = 0` on `V₀`, so by 5.2 with `u = v = d` the energies `E_m(d)` tend to `0`; they are
nondecreasing (2.2), so all vanish and `d` is constant, hence `0`, on every `V_m` (2.1); and `d = 0`
on `K` by continuity and 1.2.

**Checks.**
- `φ = 1`, `b = 0`: the solution `u` of 5.1, with `u(q₂) = −1/15`; it is negative at every
  vertex outside `V₀`, since at a vertex where it attained a value `≥ 0` maximal among its
  neighbours the level sum could not be positive.
- `φ = 0`, `b = (1, 0, 0)`: the harmonic function of 3.3.
- The consistency step needs the integrals `∫_K ψ_x^m φ dμ`, not samples of `φ`. Take `φ =
  ψ_(q₂)^1` (not harmonic at `q₂`) and `b = 0`. The integrals are exact: for harmonic `h`, `h'`
  with corner values `c`, `c'`, `∫ h h' dμ = (3 c·c' + 4 (∑ cᵢ)(∑ c'ᵢ))/45`. This is the unique
  solution of `M = (1/3) ∑ᵢ ᵗAᵢ M Aᵢ` normalised by `∫ 1 dμ = 1`, with `Aᵢ` the matrices of 3.5,
  and each `ψ_x^m φ ∘ F_w` with `|w| = m ≥ 1` is such a product. The level solutions `g_m`, `m = 1,
  …, 4`, restrict to one another, with `g_m(q₂) = −1/45`. With the right sides `(2/3) 3^(−m) φ(x)`
  they do not: `g_m(q₂) = −1/25, −29/1125, −43/1875, −629/28125`. At `q₂` the level sum `(3/2) 3^m
  ∫ ψ_(q₂)^m φ dμ` differs from `φ(q₂) = 1` by `−(8/15)(3/5)^(m−1)`, which tends to `0`. For
  harmonic `φ` the two right sides coincide.

*Needs:* 1.1, 1.2, 1.3, 2.1, 2.2, 2.3, 2.4, 3.3, 4.1, 4.2, 4.4, 5.1, 5.2;
ElectricalNetworksAndRandomWalks 1.2 (existsUnique_isHarmonicAt), 2.2 (isLeast_dirichletEnergy);
FractalGeometry 1.5 (IFS.existsUnique_selfSimilarMeasure, IFS.measure_attractor_eq_one); Mathlib
`LinearMap.injective_iff_surjective`, `IsCompact.uniformContinuousOn_of_continuous`,
`ContinuousOn.integrableOn_compact`. (Kig93, Theorem 6.9, p. 743, and Theorem 5.8 (2), p. 738;
the route is proved here.)

### 5.4 Harmonic functions solve Laplace's equation

Prove `isLaplacianOn_zero_iff`: for any set `K` and `f` continuous on `K`, `Δf = 0` holds
exactly when `f` is harmonic (Kig93, Corollary 6.10, p. 743, for the gasket); `K` is any set on
which `f` is continuous, the gasket being the case of interest. `IsLaplacianOn K f 0` mentions
`K` only through `ContinuousOn f K` and `ContinuousOn 0 K`, so no attractor hypothesis is needed.

Route: a harmonic function has `(L_m f)(x) = 0` at every `x ∈ V_m \ V₀` (the level networks have
no loops), so the vertex condition of `Δf = 0` holds with margin `0` at every level. Conversely,
let `h` be the extension of the corner values of `f` by the rule (2.3), harmonic by 3.2, and
`d = f − h`, so `d = 0` on `V₀` and `(L_m d)(x) = (L_m f)(x)` on `V_m \ V₀`. Given `ε > 0`, for
`m ≥ M` every `x ∈ V_m \ V₀` has `|(L_m d)(x)| ≤ (2/3) 3^(−m) ε`, and there are
`(3^(m+1) − 3)/2 ≤ (3/2) 3^m` such `x`, so `E_m(d) = ∑_(x ∈ V_m \ V₀) d(x) (L_m d)(x) ≤
ε max_(V_m) |d|`. For `x ∈ V_m`, Dirichlet's principle in `levelNetwork m` and 4.1 give
`d(x)² = (d(x) − d(p₀))² ≤ R(x, p₀) E_m(d)`, and `R(x, p₀) ≤ 5/3` by 4.2 (the vertex bound with
`k = 0`). Hence `(max_(V_m) |d|)² ≤ (5/3) ε max_(V_m) |d|`, so `|d| ≤ (5/3) ε` on `V_m` for every
`m ≥ M`. As `ε` is arbitrary and `V_n ⊆ V_m` for `n ≤ m`, `d = 0` on `V_*`, and `f = h` there is
harmonic.

**Checks.**
- The solution `u` of `Δu = 1` (5.1) is not harmonic: at level 1 its sum
  `∑_(y ∼ q₂) (u(y) − u(q₂))` is `1/((3/2) · 5) = 2/15 ≠ 0`.

*Needs:* 1.1, 1.3, 2.1, 2.3, 3.1, 3.2, 4.1, 4.2, 5.1; ElectricalNetworksAndRandomWalks 2.2
(isLeast_dirichletEnergy). (Kig93, Corollary 6.10, p. 743.)

### Examples

The solution of `Δu = 1` with zero boundary values, its value `−1/15` at the midpoints of the
sides and its normal derivatives `1/3`; the harmonic functions with their normal derivatives.

### Dependencies

Layers 1 to 3 (1.1, 1.2, 1.3, 2.1, 2.2, 2.3, 2.4, 3.1, 3.2, 3.3) and, for 5.3, 4.1, 4.2 and 4.4, for
5.4, 4.1 and 4.2; ElectricalNetworksAndRandomWalks 1.2, 2.2; FractalGeometry 1.4, 1.5; Mathlib
`MeasureTheory.Measure.map`, `MeasureTheory.integral_map`, `ContinuousOn.integrableOn_compact`,
`Matrix.mulVec`, `dotProduct`, `LinearMap.injective_iff_surjective`,
`IsCompact.uniformContinuousOn_of_continuous`.

## Scope and ownership

This roadmap owns, for the Sierpiński gasket: the vertex and edge sets of the approximating graphs
and their networks, the renormalised energies with the renormalisation and the `(2/5, 2/5, 1/5)`
rule, the energy and its self-similarity, harmonic functions with their boundary value problem,
maximum principle, oscillation decay and Hölder continuity, the resistance on `V_*` with its
consistency, its Euclidean upper bound and the continuity of functions of finite energy, and the
Laplacian with normal derivatives, the Gauss–Green formula and the Dirichlet problem.

Taken from other roadmaps and not restated:

- FractalGeometry owns iterated function systems, their attractors (existence and uniqueness,
  1.3), the coding map (1.4) and self-similar measures (1.5), and the Hausdorff dimension
  `log 3 / log 2` of the gasket (5.2). The structure `IFS` and the predicate `IFS.IsAttractor` are
  copied verbatim; the gasket of this roadmap is an attractor of a system of that structure, and
  `μ` is given by the invariance equation of 1.5.
- ElectricalNetworksAndRandomWalks owns finite networks, harmonic functions on them, the maximum
  principle and the Dirichlet problem (1.2), effective resistance (2.1), Dirichlet's principle
  (2.2) and the metric property of effective resistance (2.5). The structure `Network` and the
  definitions of 1.3 above are copied verbatim; the level networks are instances, and Layer 4
  consumes the theorems.
- Mathlib's `SimpleGraph.lapMatrix` is the unit-conductance Laplacian; the Laplacian of a level
  network is `(5/3)^m` times it, and the gasket Laplacian of 5.1 is a different object, a limit
  over levels.

Outside this roadmap: spectral decimation and the eigenvalues of the Laplacian (Fukushima and
Shima; Strichartz, eq. (18), p. 1202, states the relation `λ_m = λ_(m+1)(5 − λ_(m+1))`); the lower
bound `R(x, y) ≥ c |x − y|^β` and the extension of `R` to a metric on `K`; the Dirichlet form
properties of the energy (closedness, the Markov and local properties, regularity: Kig93, Theorem
7.4 (2), (4), (5)); the Green function `g(x, y)`, the Green operator `G_μ` and their explicit
formulas (5.3 constructs its solution level by level without them); the converse of 5.2, that the
weak equation `E(u, v) = −∫ φ v dμ` for all `v` vanishing on `V₀` implies `Δu = φ`; other
post-critically finite sets and harmonic structures; energy measures, heat kernels, Brownian motion
on the gasket and the spectral dimension.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Analysis/InnerProductSpace/PiL2.lean`: `EuclideanSpace`, the notation `!₂[x, y]`.
- `Mathlib/LinearAlgebra/AffineSpace/Midpoint.lean`: `midpoint`, `midpoint_self`
  (`midpoint R x x = x`). `Mathlib/Analysis/Normed/Affine/AddTorsor.lean`:
  `dist_midpoint_midpoint_le` (in a real normed space, the distance of two midpoints is at most
  half the sum of the distances of their ends).
- `Mathlib/Topology/MetricSpace/Lipschitz.lean`: `LipschitzWith.of_dist_le_mul`.
  `Mathlib/Topology/EMetricSpace/Lipschitz.lean`: `LipschitzWith.ediam_image_le`.
- `Mathlib/Data/Sym/Sym2.lean`: `Sym2` and the notation `s(x, y)` for unordered pairs;
  `Finset.image` for the finite sets of vertices and edges.
- `Mathlib/Combinatorics/SimpleGraph/Basic.lean`: `SimpleGraph.fromRel`.
  `Mathlib/Combinatorics/SimpleGraph/Connectivity/Connected.lean`: `SimpleGraph.Connected`.
  `Mathlib/Combinatorics/SimpleGraph/LapMatrix.lean`: `SimpleGraph.lapMatrix`.
- `Matrix.mulVec` (notation `*ᵥ`) and `dotProduct` (notation `⬝ᵥ`), in
  `Mathlib/Data/Matrix/Mul.lean`.
- `Mathlib/Topology/MetricSpace/Holder.lean`: `HolderOnWith` (for `C r : ℝ≥0`, the edistance of
  images is at most `C` times the edistance to the power `r` on a set);
  `HolderOnWith.uniformContinuousOn` (for `0 < r`).
- `Mathlib/Topology/DenseEmbedding.lean`: `IsDenseInducing.extend`.
  `Mathlib/Topology/UniformSpace/UniformEmbedding.lean`: `uniformContinuous_uniformly_extend` and
  `uniformly_extend_of_ind` (for a uniform inducing map with dense range into a space, a uniformly
  continuous map to a complete space extends to a uniformly continuous map agreeing on the image).
- `Mathlib/Topology/Defs/Basic.lean`: `closure`. `Mathlib/Topology/Separation/Hausdorff.lean`:
  `IsCompact.isClosed` (a compact set in a Hausdorff space is closed).
- `Mathlib/MeasureTheory/Measure/Map.lean`: `MeasureTheory.Measure.map`.
  `Mathlib/MeasureTheory/Integral/Bochner/Basic.lean`: `MeasureTheory.integral_map` (for an
  a.e.-measurable map and an a.e.-strongly measurable integrand).
  `Mathlib/MeasureTheory/Function/LocallyIntegrable.lean`: `ContinuousOn.integrableOn_compact` (a
  function continuous on a compact set is integrable on it for a locally finite measure).
- `Mathlib/LinearAlgebra/FiniteDimensional/Basic.lean`: `LinearMap.injective_iff_surjective` (an
  endomorphism of a finite-dimensional vector space is injective exactly when it is surjective).
  `Mathlib/Topology/UniformSpace/HeineCantor.lean`: `IsCompact.uniformContinuousOn_of_continuous`
  (a function continuous on a compact set is uniformly continuous on it).
- `Mathlib/Basic/ENNReal/Inv.lean`: `ENNReal.mul_iSup`. `Mathlib/Basic/ENNReal/BigOperators.lean`:
  `ENNReal.finsetSum_iSup_of_monotone` (a finite sum of suprema of monotone families over a
  directed order is the supremum of the sums).

### From Tau Ceti

Nothing is consumed; `Suggested.lean` imports no Tau Ceti module.

### From TauCetiRoadmap.FractalGeometry

- 1.1: the structure `IFS` (maps with prescribed ratios in `(0, 1)` and Lipschitz bounds), its
  coercion to the family of maps, and `IFS.IsAttractor` (compact, nonempty, union of its images);
  copied verbatim.
- 1.3: IFS.existsUnique_isAttractor, which makes the attractor `K` of the Sierpiński system exist
  and be unique, so that the statements above are about one set.
- 1.4: the coding map onto the attractor, used in the Conventions for Kigami's self-similar
  structure.
- 1.5: IFS.existsUnique_selfSimilarMeasure (the measure `μ` with weights `1/3` exists and is
  unique) and IFS.measure_attractor_eq_one (it gives `K` mass `1`); the bullets that `μ` is the
  image of the product measure under the coding map and that `μ(F_w(K)) ≥ 3^(−m)` for a word of
  length `m`, used in the Conventions. Equality, also used there, needs one more step, because the
  coding map of the gasket is not injective (a junction point has two codes): the preimage of
  `F_w(K)` is the cylinder of `w` together with finitely many sequences, and the product measure
  has no atoms (the argument of Kig93, Lemma 1.13, p. 725).

### From TauCetiRoadmap.ElectricalNetworksAndRandomWalks

- 1.1, 1.2, 2.1, 2.2: the definitions `Network`, `Network.weight`, `Network.graph`,
  `Network.IsHarmonicAt`, `Network.laplacian`, `Network.groundedLaplacian`, `Network.voltage`,
  `Network.effResistance`, `Network.dirichletEnergy`; copied verbatim.
- 1.2: existsUnique_isHarmonicAt (on a connected network, a function on a nonempty set `B` has
  exactly one extension harmonic outside `B`) and exists_mem_le_of_isHarmonicAt (the maximum
  principle); used in 3.3, 3.4 and 5.3 with `B = V₀`.
- 2.2: isLeast_dirichletEnergy (on a connected network, for `a ≠ z`, the least Dirichlet energy
  of a function equal to `1` at `a` and `0` at `z` is `1/R(a ↔ z)`); used in 4.1, 5.3 and 5.4.
- 2.5: effResistance_pos, effResistance_comm and effResistance_triangle; used in 4.1 and 4.2.

## References

- [Kig93] Jun Kigami, Harmonic calculus on p.c.f. self-similar sets, Transactions of the American
  Mathematical Society 335 (1993), no. 2, 721–755, doi:10.1090/S0002-9947-1993-1076617-1; free on
  the publisher's page, [the article page][kig93].
  Numbering and pages as printed (journal pages 721–755).
- Robert S. Strichartz, Analysis on fractals, Notices of the American Mathematical Society 46
  (1999), no. 10, 1199–1208, on the publisher's page,
  [fea-strichartz.pdf](https://www.ams.org/notices/199910/fea-strichartz.pdf). A survey: it states
  the formulas cited above and sketches their proofs.

[kig93]: https://www.ams.org/journals/tran/1993-335-02/S0002-9947-1993-1076617-1/

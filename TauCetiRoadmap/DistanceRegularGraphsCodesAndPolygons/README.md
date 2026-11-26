# Roadmap: distance-regular graphs, perfect codes and generalized polygons

**Summary.** A connected graph is distance-regular when, for vertices `x` and `y` at distance
`i`, the numbers `c_i`, `a_i`, `b_i` of neighbours of `y` at distance `i − 1`, `i`, `i + 1` from
`x` depend only on `i`. Its distance relations then form a symmetric association scheme, and the
intersection array `{b_0, …, b_(d−1); c_1, …, c_d}` determines the distance matrices by a
three-term recurrence, the spectrum as the eigenvalues of a tridiagonal matrix, and the
multiplicities by Biggs's formula. This roadmap develops that theory and draws the classical
consequences of the integrality of multiplicities. Among its theorems:
- the parameter identities, the distance recurrence and the bridge to the distance scheme;
  distance-transitive graphs are distance-regular, and the strongly regular graphs are the
  distance-regular graphs of diameter two;
- a distance-regular graph of diameter `d` has `d + 1` eigenvalues, the roots of the
  characteristic polynomial of its intersection matrix; Biggs's formula gives the
  multiplicities; Smith's theorem says that an imprimitive one of degree at least three is
  bipartite or antipodal; the Hamming and Johnson graphs have the classical arrays;
- the spectral excess theorem: a connected regular graph with `D + 1` eigenvalues is
  distance-regular exactly when the average number of vertices at distance `D` equals the value
  at the degree of the `D`-th predistance polynomial;
- Lloyd's theorem for perfect sets in any symmetric association scheme, and its Krawtchouk form
  for perfect codes in Hamming spaces, where the Lloyd polynomial of a perfect code of radius
  `t ≤ n` has `t` zeros among `1, …, n`;
- Moore graphs are distance-regular; the bipartite Moore bound and its equality case;
  generalized polygons, their orders and point graphs, the Feit–Higman theorem, generalized
  quadrangles and Higman's inequality; the symmetric designs as the bipartite distance-regular
  graphs of diameter three;
- two supplements to the theory of schemes: the absolute bound of Neumaier with the bounds on
  the eigenmatrices, and the equivalence of the cometric and `Q`-polynomial properties.

The scheme theory is [AssociationSchemes](../AssociationSchemes/README.md): schemes, eigenmatrices,
Krein parameters, Delsarte's inequalities, the equivalence of the metric and `P`-polynomial
properties, and distance-regular graphs as the graphs whose distance classes form a scheme. Its
statements are consumed, not restated. The Hamming scheme with its Krawtchouk eigenmatrices and the
cometric schemes are DelsarteTheoryOfCodesAndDesigns, the Moore bound is
[StronglyRegularAndMooreGraphs](../StronglyRegularAndMooreGraphs/README.md), perfect codes in
Hamming spaces are [BoundsOnCodes](../BoundsOnCodes/README.md), the Krein conditions for strongly
regular graphs and the designs are StronglyRegularGraphsAndDesigns, and the spectra and standard
graphs are [GraphSpectra](../GraphSpectra/README.md). The sources are Brouwer–Haemers [BH, Chapters
11–12], Brouwer–Cohen–Neumaier [BCN, §§2.3, 2.5, 2.7 and 6.5], Godsil–Royle [GR, §§4.5, 5.6, 5.8,
5.10 and 10.8], Biggs [Biggs, Chapter 23], Godsil [Godsil, §§11.7 and 12.3] and Brouwer–Van
Maldeghem [BVM, §§1.2–1.3].

## How to read the build

Layer 1 adds the absolute bound to the scheme theory. Layers 2 and 3 are the theory of
distance-regular graphs and their spectrum; Layer 4 applies them to the Hamming and Johnson
graphs. Layer 5, the spectral excess theorem, needs Layer 2. Layer 6, Lloyd's theorem, needs
Layer 2 for its graph form, 2.3 and 4.1 for the count of zeros, and only the scheme theory
otherwise. Layers 7 and 8, the Moore graphs
and generalized polygons, need Layers 2 and 3; 7.3 uses the Feit–Higman theorem of 8.3. Layer 9,
the cometric and `Q`-polynomial schemes, needs only the scheme theory.

## Conventions

- **Graphs** are `G : SimpleGraph V` with `[Fintype V] [DecidableEq V] [DecidableRel G.Adj]`.
  Distances are Mathlib's `SimpleGraph.dist`, which is a junk `0` between components, and
  `SimpleGraph.edist`, which is `⊤` there; `SimpleGraph.diam` is `0` for a disconnected graph.
  `A = G.adjMatrix ℝ`, `I` is the identity and `J` the all-ones matrix.
- **Schemes** are the definitions of AssociationSchemes 1.1, 1.2, 2.1, 2.3, 3.1 and 4.1, copied
  verbatim in `Suggested.lean`. A symmetric scheme with `d` classes on a finite type `X` is a
  class function `rel : X → X → Fin (d + 1)` satisfying `IsAssocScheme`; `adjMat rel i` is
  `A_i`, `valency rel i` is `v_i` and `intersectionNumber rel i j k` is `p^k_(ij)`, the number of
  `z` with `rel x z = i` and `rel z y = j` for `rel x y = k`. A family `E` with
  `IsPrimitiveIdempotents` has `E 0 = J/|X|`; the multiplicity is `m_i = tr E_i`;
  `eigenmatrix rel E` is `P` (`P_(ij)` is the eigenvalue of `A_j` on the image of `E_i`) and
  `dualEigenmatrix rel E` is `Q`; `kreinParam rel E i j k` is `q^k_(ij)`; the inner distribution
  of a set `Y` is `innerDistribution rel Y`.
- **Distance-regular graphs** are `IsDistanceRegular G` of AssociationSchemes 6.2: `G` is
  connected and the counts `c_h` and `b_h` depend only on the distance `h`. Its distance classes
  are `distRel G`, with values in `Fin (G.diam + 1)`.
- **Intersection numbers of a graph.** `G.intersectionCount i j` is the largest number, over the
  pairs `(x, y)` with `dist x y = i`, of neighbours of `y` at distance `j` from `x`, and `0` when
  there is no such pair; it uses no choice, so it has a determined value on every graph (on a
  disconnected graph the junk distance `0` puts pairs in different components into class `0`).
  `G.intersectionB i`, `G.intersectionA i` and `G.intersectionC i` are `b_i`, `a_i` and `c_i`,
  the counts at `j = i + 1`, `i` and `i − 1`; so `c_0 = 0` on a connected graph, because
  `0 − 1 = 0` in `ℕ` and no neighbour of `y` is at distance `0` from `y` (on two disjoint edges
  the junk distance gives `c_0 = 1`). They are defined for every graph and
  meaningful for a distance-regular one, whose degree is `k = b_0`.
- **Sphere sizes and distance matrices.** `G.sphereCount i` is `k_i`, the number of ordered
  pairs at distance `i` divided by `|V|` (natural division, exact for a distance-regular graph).
  `G.distAdjMatrix R i` is the `0`–`1` matrix of distance `i`, written `A_i`; it vanishes for
  `i > diam` on a connected graph. `G.distanceGraph i` joins distinct vertices at distance `i`.
- **The intersection matrix** `G.intersectionMatrix`, written `T`, is the real tridiagonal
  matrix of order `diam + 1` with subdiagonal `c_i`, diagonal `a_i` and superdiagonal `b_i`
  [BH, §12.2, p. 178]. For a distance-regular graph of diameter at least `1` it is the matrix
  `L_1` of the distance scheme (2.1). It differs from the scheme's `intersectionMatrix`, which
  takes a class function and a class.
- **Antipodal, distance-transitive.** `G.IsAntipodal` says that two distinct vertices at distance
  `diam` from a common vertex are at distance `diam` from each other. `G.IsDistanceTransitive`
  says that `G` is connected and its automorphisms act transitively on the ordered pairs at each
  distance [GR, §4.5, p. 66].
- **Cometric and `Q`-polynomial.** `IsCometric rel E` is the definition of
  DelsarteTheoryOfCodesAndDesigns 4.1, copied verbatim: `q^k_(1j) = 0` for `k > j + 1` and
  `q^(j+1)_(1j) ≠ 0` for `j < d`, for the given order of the idempotents.
  `Scheme.IsQPolynomial rel E` says that there are reals `z_i` and polynomials `q_k` of degree `k`
  with `Q_(ik) = q_k(z_i)` [BH, §11.6, p. 173].
- **Spectra** are the multisets `adjSpectrum` of GraphSpectra 1.2, the adjacency eigenvalues with
  multiplicity, built on the sorted eigenvalues `adjEigenvalues` of SpectralGraphBounds 1.1; both
  definitions are copied verbatim.
- **Hamming and Johnson graphs** are `hammingGraph d Q` on `Fin d → Q` and `johnsonGraph α k` on
  the coerced set `{s : Finset α | s.card = k}` of GraphSpectra 2.3 and 2.4, copied verbatim with
  their `DecidableRel` instances.
- **Perfect sets and codes.** `Scheme.IsPerfectSet rel I Y` says that every point is in a class
  of `I` with exactly one point of `Y` [BCN, §2.5, p. 56]. `G.IsPerfectCode e C` says that every
  vertex is at extended distance at most `e` from exactly one element of `C`. Codes in Hamming
  spaces use `IsPerfect` and `distanceDistribution` (the number of ordered pairs of codewords at
  distance `i`) of BoundsOnCodes 1.2 and 5.1, copied verbatim, and Tau Ceti's
  `TauCeti.krawtchouk q n w j`, which is `K_w(j)`.
- **Moore numbers.** `mooreBound k d = 1 + k ∑_(i<d) (k − 1)^i` is the definition of
  StronglyRegularAndMooreGraphs 3.1, copied verbatim, and
  `bipartiteMooreBound k m = 2 ∑_(i<m) (k − 1)^i`; both use natural-number subtraction.
- **Generalized polygons.** `G.IsGeneralizedPolygon m` says `2 ≤ m`, `G` connected,
  `G.Colorable 2`, `G.diam = m` and `G.egirth = 2m`, with Mathlib's extended girth
  `SimpleGraph.egirth`, which is `⊤` for an acyclic graph [BH, §9.6, p. 129; GR, §5.6, p. 84]. A
  colouring `c : G.Coloring Bool` has points (`false`) and lines (`true`); `G.HasOrder c s t` says
  that lines have degree `s + 1` and points `t + 1`; `G.IsThick` says that all degrees are at
  least `3`; `G.pointGraph c false` and `G.pointGraph c true` join vertices of one colour at
  distance `2`.
- **Designs** are `IsTwoDesign`, `IsSymmetricDesign` and `incidenceGraph` of
  StronglyRegularGraphsAndDesigns 5.1 and 5.3, copied verbatim with the `DecidableRel` instance
  of the incidence graph: an incidence relation between points and blocks with `2 ≤ k < v` and
  `0 < ℓ`, repeated blocks allowed. The letter `λ` of the sources is `ℓ`.

## Layer 1: ranks of entrywise products, eigenmatrix bounds and the absolute bound

The rank lemmas of 1.1 carry the proof of the absolute bound, 1.3; no later layer uses them.

*Depends on:* AssociationSchemes 1.1, 1.2, 2.1 and 3.1.

### 1.1 Ranks of entrywise products

- **Ranks of entrywise products** (`Matrix.rank_hadamard_le`,
  `Matrix.two_mul_rank_hadamard_self_le`). Over any field, `rk (A ⊙ B) ≤ rk A · rk B` and
  `2 rk (A ⊙ A) ≤ rk A (rk A + 1)`, from the proof of [BCN, Theorem 2.3.3, p. 51].

**Suggested proof:** if the rows of `A` are combinations of `r` rows `u_1, …, u_r` and those of
`B` of `s` rows `w_1, …, w_s`, the rows of `A ⊙ B` are combinations of the `rs` entrywise
products `u_a ⊙ w_b`. For `A ⊙ A` the coefficient of `u_a ⊙ u_b` is symmetric in `a` and `b`, so
the `r(r + 1)/2` products with `a ≤ b` suffice. Ranks of row spans are Mathlib's `Matrix.rank`.

**Checks.**
- `A = B = J_2`: `A ⊙ B = J_2`, of rank `1 = 1 · 1`.
- `A = I_2`, `B = J_2`: `A ⊙ B = I_2`, of rank `2 ≤ 2 · 1`.
- `E = u uᵀ + w wᵀ` with `u = (1, 1, 1)` and `w = (1, 0, −1)`: `rk E = 2` and `rk (E ⊙ E) = 3`, so
  `2 · 3 ≤ 2 · 3` is sharp.
- The `3 × 4` matrix with rows `r_1 = (1, 0, 1, 2)`, `r_2 = (0, 1, 1, 3)` and `r_1 + r_2` has rank
  `2`, and its entrywise square has rank `3`: the bound needs no symmetry.
- Negative control: `rk (A ⊙ A) ≤ rk A` fails for the matrix `E` above (`3 > 2`).

*Needs:* Mathlib `Matrix.hadamard`, `Matrix.rank`.

### 1.2 Bounds on the eigenmatrices

- **Bounds on the eigenmatrices** (`Scheme.abs_eigenmatrix_le`). `|P_(ij)| ≤ v_j` and
  `|Q_(ij)| ≤ m_j` [BH, Theorem 11.2.1 (iv), p. 167].

**Suggested proof:** by the expansion `A_j = ∑_i P_(ij) E_i` of AssociationSchemes 2.1,
`A_j E_i = P_(ij) E_i`; for a nonzero column `u` of `E_i` and an entry of `u` of largest absolute
value, the row of `A_j` there has `v_j` ones, so `|P_(ij)| ≤ v_j`. For `Q`, `E_j` is positive
semidefinite (AssociationSchemes 1.2, in prose), so each entry is at most the diagonal entry
`m_j/|X|` in absolute value, and `Q_(ij)` is `|X|` times the common value of `E_j` on class `i`.

**Checks.**
- The scheme of `K_n` (`d = 1`) has `P = Q` with rows `(1, n − 1)` and `(1, −1)`, and
  `v_1 = m_1 = n − 1`; both bounds are equalities in row `0`.
- The Petersen distance scheme has `P` with rows `(1, 3, 6)`, `(1, 1, −2)` and `(1, −2, 1)` and
  valencies `(1, 3, 6)`.
- The `4`-cube distance scheme `H(4, 2)` has `P = Q` with rows `(1, 4, 6, 4, 1)`,
  `(1, 2, 0, −2, −1)`, `(1, 0, −2, 0, 1)`, `(1, −2, 0, 2, −1)` and `(1, −4, 6, −4, 1)` [BH, §11.6,
  p. 174], so both bounds are attained in the last row.

*Needs:* AssociationSchemes 1.2 and 2.1.

### 1.3 The absolute bound

- **The absolute bound** (`Scheme.sum_trace_le_of_kreinParam`). For all `i`, `j`,
  `∑_(q^k_(ij) ≠ 0) m_k ≤ m_i m_j`, and `2 ∑_(q^k_(ii) ≠ 0) m_k ≤ m_i (m_i + 1)` [BH, Theorem
  11.4.3, p. 171; BCN, Theorem 2.3.3, p. 51; BVM, Proposition 1.3.13, p. 29]. [BH] states the
  first inequality for `i ≠ j`; its proof uses no hypothesis on `i` and `j`.
- **The bound on the number of points.** If no `q^k_(ij)` vanishes, then `|X| ≤ m_i m_j`, and
  `2 |X| ≤ m_i (m_i + 1)` when `i = j`: the absolute bound with `∑_k m_k = |X|`
  (AssociationSchemes 1.2, in prose).

**Suggested proof:** by the Krein expansion `E_i ⊙ E_j = |X|⁻¹ ∑_k q^k_(ij) E_k` of
AssociationSchemes 3.1 and the orthogonality of the `E_k`, the rank of `E_i ⊙ E_j` is the sum of
`rk E_k = m_k` over the `k` with `q^k_(ij) ≠ 0`; apply 1.1.

**Checks.**
- `K_3` (`d = 1`, `m_1 = 2`): `q^0_(11) = 2` and `q^1_(11) = 1`, so the sum is `1 + 2 = 3 ≤ 4`,
  and `2 · 3 ≤ 2 · 3` is an equality.
- `K_2`: `q^1_(11) = 0`, the sum is `1`, and `2 ≤ 2`.
- `K_4` (`m_1 = 3`): `q^0_(11) = 3` and `q^1_(11) = 2`, so no `q^k_(11)` vanishes and
  `2 · 4 ≤ 3 · 4`. Negative control: the variant `|X| ≤ m_i` fails there (`4 > 3`).
- Both inequalities, also with `i = j` in the first, hold on the distance schemes of `K_2`,
  `K_3`, `K_5`, the Petersen graph, the cube, `C_6`, `H(2, 3)` and `J(6, 3)`.

*Needs:* 1.1; AssociationSchemes 1.2 and 3.1.

## Layer 2: distance-regular graphs

The definitions are `intersectionCount`, `intersectionB`, `intersectionC`, `intersectionA`,
`sphereCount`, `distAdjMatrix`, `distanceGraph`, `IsAntipodal`, `IsDistanceTransitive` and
`intersectionMatrix` (Conventions).

*Depends on:* AssociationSchemes 2.3 and 6.2 (definitions) and 6.2; Mathlib
`SimpleGraph.IsSRGWith`.

**Checks of the definitions.**
- `intersectionCount` on the Petersen graph: for `x`, `y` at distance `2`, `y` has `1` neighbour
  at distance `1` from `x` and `2` at distance `2`.
- Negative control for `intersectionCount`: on the prism `C_5 □ K_2`, which is not
  distance-regular, pairs at distance `2` have `1` or `2` neighbours at distance `1` and `0` or `1`
  at distance `2`, so `intersectionCount 2 1 = 2` and `intersectionCount 2 2 = 1`, the larger
  values; a minimum over the pairs would give `1` and `0`.
- `intersectionB`, `intersectionC`: the Petersen graph `{3, 2; 1, 1}`, the cube
  `{3, 2, 1; 1, 2, 3}`, `C_6` `{2, 1, 1; 1, 1, 2}`, the Heawood graph `{3, 2, 2; 1, 1, 3}`.
- Negative control for `intersectionC`: `c_0 = 0`, not `1`, so that `a_0 + b_0 + c_0 = k`.
- `intersectionA`: `a = (0, 0, 2)` for the Petersen graph; `a_1 = 3` for `K_5`; `a_i = 0` for
  every `i` on a bipartite graph.
- `sphereCount`: `(1, 3, 6)` for the Petersen graph and `(1, 3, 3, 1)` for the cube.
- `distAdjMatrix`: for the Petersen graph `A² = 3I + A_2`; for the cube `A_2 = (A² − 3I)/2`.
- `distanceGraph`: for `C_6` the distance-`2` graph is `2K_3` and the distance-`3` graph is
  `3K_2`; for the Petersen graph the distance-`2` graph is connected and `6`-regular.
- Negative control for `distanceGraph`: the distance-`0` graph has no edges, since `fromRel`
  joins only distinct vertices.
- `IsAntipodal`: `C_6`, the cube and `K_4` (diameter `1`) are antipodal.
- Negative control for `IsAntipodal`: the Petersen graph is not, since two vertices at distance
  `2` from a common vertex can be adjacent.
- `IsDistanceTransitive`: the automorphisms of the Petersen graph and of the cube have
  `diam + 1` orbits on ordered pairs (`3` and `4`).
- Negative control for `IsDistanceTransitive`: the prism `C_5 □ K_2` is vertex-transitive and
  regular but not distance-regular, since two vertices at distance `2` have `1` or `2` common
  neighbours; so it is not distance-transitive.
- `intersectionMatrix`: `T = [[0, 3, 0], [1, 0, 2], [0, 1, 2]]` for the Petersen graph and
  `T = [[0, 4], [1, 3]]` for `K_5`.
- Negative control for the bridge of 2.1: `K_1` has diameter `0`, so `(1 : Fin 1) = 0`, and
  `p^0_(00) = 1` while `intersectionCount 0 0 = 0`; this is why 2.1 assumes `1 ≤ diam`.

### 2.1 The intersection numbers and the distance scheme

- **The intersection numbers** (`IsDistanceRegular.card_adj_dist`). For `dist x y = i`, `y` has
  `b_i`, `a_i` and `c_i` neighbours at distance `i + 1`, `i` and `i − 1` from `x`, and
  `intersectionCount i j` neighbours at distance `j` [BVM, §1.2, p. 17].
- **The distance scheme** (`IsDistanceRegular.intersectionNumber_distRel`). If the diameter is at
  least `1`, the intersection number `p^h_(j1)` of `distRel G` is `intersectionCount h j`, and `T`
  is the matrix `L_1` of the distance scheme [BH, §12.2, p. 178].

**Suggested proof:** the definition of AssociationSchemes 6.2 fixes `c_h` and `b_h`; the case
`h = 0` gives regularity, which fixes `a_h = k − b_h − c_h`, and the triangle inequality makes the
count `0` for `|j − i| > 1`. For the bridge, `distRel G` agrees with `dist` on a connected graph,
AssociationSchemes 6.2 makes it a scheme, and `p^h_(j1)` counts the neighbours `z` of `y` with
`dist x z = j` for a pair at distance `h`.

**Checks.**
- The Petersen graph, the cube, `C_7` and `K_4`: `T` equals `L_1` of the distance scheme, computed
  as the average count of the definition of `intersectionNumber`.
- The cube, `x = 000`, `y = 011`: the neighbours `001` and `010` of `y` are at distance `1` and
  `111` at distance `3`, so `c_2 = 2`, `a_2 = 0`, `b_2 = 1`.
- Negative control: the prism `C_5 □ K_2` is not distance-regular, and `card_adj_dist` would give
  one value of `c_2` where the prism has the two values `1` and `2`.

*Needs:* AssociationSchemes 6.2.

### 2.2 Parameter identities and sphere sizes

- **Parameter identities** (`IsDistanceRegular.intersection_identities`). A distance-regular
  graph is `b_0`-regular; `a_i + b_i + c_i = b_0` for `i ≤ d`; `c_1 = 1` and `b_d = 0` when
  `d ≥ 1`; `b_(i+1) ≤ b_i`, `c_i ≤ c_(i+1)` and `c_(i+1) > 0` for `i < d` [BH, §12.1, p. 177;
  BVM, §1.2, p. 18]. [BH] states the monotonicity without proof.
- **Sphere sizes** (`IsDistanceRegular.card_dist_eq_sphereCount`). Every vertex has `k_i`
  vertices at distance `i`, and `k_(i+1) c_(i+1) = k_i b_i` [BH, §12.1, p. 177; BVM, §1.2,
  p. 18].

**Suggested proof:** for `b_(i+1) ≤ b_i`, take `x`, `y` at distance `i + 1` and a neighbour `x'`
of `x` on a geodesic to `y`; every neighbour of `y` at distance `i + 2` from `x` is at distance
`i + 1` from `x'`, and `x'`, `y` are at distance `i`. The inequality for `c_i` is symmetric, and
`c_(i+1) > 0` because a geodesic exists. The sphere identity counts the edges between distance
`i` and distance `i + 1` from `x`, and the independence of `x` follows by induction from `k_0 = 1`.

**Checks.**
- Petersen: `k_(i+1) c_(i+1) = k_i b_i` reads `3 · 1 = 1 · 3` and `6 · 1 = 3 · 2`.
- The cube: `b = (3, 2, 1, 0)` is nonincreasing and `c = (0, 1, 2, 3)` nondecreasing, and
  `a_i + b_i + c_i = 3`.
- Negative control: the path `P_3` is connected of diameter `2` with degrees `1` and `2`; it is
  not regular, and indeed not distance-regular (`b_0` is `1` at an end and `2` at the centre).

*Needs:* 2.1.

### 2.3 The distance recurrence

- **The distance recurrence** (`IsDistanceRegular.adjMatrix_mul_distAdjMatrix`).
  `A A_(i+1) = b_i A_i + a_(i+1) A_(i+1) + c_(i+2) A_(i+2)` for every `i` [BH, §12.1, p. 177; BVM,
  §1.2, p. 18].

That each `A_i` is a polynomial of degree `i` in `A` then follows by induction; it is also the
`P`-polynomial property of AssociationSchemes 6.1 for the distance scheme, and is not restated.
The recurrence is a step of the route of AssociationSchemes 6.2 and is stated here.

**Suggested proof:** entry `(x, y)` of the left side counts the neighbours of `y` at distance
`i + 1` from `x`; by 2.1 and the triangle inequality this is `b_i`, `a_(i+1)` or `c_(i+2)` when
`dist x y` is `i`, `i + 1` or `i + 2`, and `0` otherwise. For `i + 1 > d` both sides vanish.

**Checks.**
- Petersen, `i = 0`: `A² = 3A_0 + 0 · A_1 + 1 · A_2`.
- The recurrence holds for every `i ≤ d` on the Petersen graph, the cube, `C_7` and the Heawood
  graph, with `A_i = 0` for `i > d`.
- Negative control: on the prism `C_5 □ K_2` the entry of `A²` at a pair at distance `2` is `1` or
  `2`, so `A²` is not a combination of `A_0`, `A_1`, `A_2`.

*Needs:* 2.1, 2.2.

### 2.4 Distance-transitive graphs

- **Distance-transitive graphs are distance-regular** (`IsDistanceTransitive.isDistanceRegular`)
  [GR, §4.5, p. 69].

**Suggested proof:** an automorphism mapping `(x, y)` to `(x', y')` maps the neighbours of `y` at
distance `h ± 1` from `x` bijectively to those of `y'` at distance `h ± 1` from `x'`.

**Checks.**
- The Petersen graph and the cube are distance-transitive and distance-regular.
- `K_1` is distance-transitive (the identity) and distance-regular.
- Negative control: the Möbius–Kantor graph is vertex-transitive and not distance-regular (Layer
  5, Checks), so it is not distance-transitive.

*Needs:* 2.1.

### 2.5 Strongly regular graphs

- **Strongly regular graphs are the distance-regular graphs of diameter two**
  (`isDistanceRegular_and_diam_eq_two_iff`). A graph is distance-regular of diameter `2` exactly
  when it is connected, not complete, and strongly regular [BVM, §1.2, p. 18].
- **The intersection array of a strongly regular graph** (`IsSRGWith.intersectionArray`). A
  connected strongly regular graph `(n, k, ℓ, μ)` that is not complete has `b_0 = k`,
  `b_1 = k − ℓ − 1`, `c_1 = 1` and `c_2 = μ` [BVM, §1.2, p. 18].

**Suggested proof:** Mathlib's `SimpleGraph.IsSRGWith` gives the counts `ℓ` and `μ`, and
`SimpleGraph.IsSRGWith.ediam_eq_two` (for `μ ≠ 0`, which a connected noncomplete strongly regular
graph has) gives diameter `2`. Conversely, at diameter `2`, `a_1 = ℓ` and `c_2 = μ` are constant.

**Checks.**
- The Petersen graph `(10, 3, 0, 1)`: `{3, 2; 1, 1}`.
- `J(5, 2) = T(5)` `(10, 6, 3, 4)`: `{6, 2; 1, 4}`.
- Negative control: `K_3` is strongly regular but complete, of diameter `1`; this is why `G ≠ ⊤`
  is assumed.
- Negative control: `P_3` is connected of diameter `2` but not regular.

*Needs:* 2.1, 2.2; Mathlib `SimpleGraph.IsSRGWith`, `SimpleGraph.IsSRGWith.ediam_eq_two`.

## Layer 3: the spectrum of a distance-regular graph

*Depends on:* Layer 2; AssociationSchemes 2.1, 2.2, 2.3 and 6.2; GraphSpectra 1.2 and 3.1.

### 3.1 The eigenvalues

- **`d + 1` eigenvalues, the roots of `T`** (`IsDistanceRegular.adjSpectrum_eq_roots`). A
  distance-regular graph of diameter `d` has exactly `d + 1` distinct eigenvalues, the roots of
  `Matrix.charpoly` of `T` [BH, §12.2, p. 178; BVM, §1.2, p. 18].

**Suggested proof:** by 2.3, `A_0, …, A_d` are polynomials of degrees `0, …, d` in `A` and
`∑_i A_i = J`, so the minimal polynomial of `A` has degree at most `d + 1`; GraphSpectra 3.1
gives at least `d + 1` distinct eigenvalues. By 2.1, `T = L_1` of the distance scheme, whose
characteristic polynomial is `∏_i (t − P_(i1))` by AssociationSchemes 2.3, and the `P_(i1)` are
the eigenvalues of `A_1 = A` (AssociationSchemes 2.1, in prose).

**Checks.**
- Petersen: `T = [[0, 3, 0], [1, 0, 2], [0, 1, 2]]` has eigenvalues `3`, `1`, `−2`.
- The Heawood graph: `±3` and `±√2`; the icosahedron: `5`, `√5`, `−1`, `−√5`.
- `K_1`: `d = 0`, `T = (0)`, one eigenvalue `0`.
- Negative control: the prism `C_5 □ K_2` has diameter `3` and `6` distinct eigenvalues.

*Needs:* 2.1, 2.3; AssociationSchemes 2.1 and 2.3; GraphSpectra 1.2 and 3.1.

### 3.2 Biggs's formula

- **Biggs's multiplicity formula** (`IsDistanceRegular.count_adjSpectrum`). If `Tu = θu` and
  `u_0 = 1`, then `θ` has multiplicity `|V| / ∑_i k_i u_i²` [BH, §12.2, p. 178; BVM, Theorem
  1.2.1, p. 18].

**Suggested proof:** for `θ = P_(j1)` the vector `u_i = Q_(ij)/m_j` is a right eigenvector of
`L_1 = T` with `u_0 = 1` (`Q_(0j) = m_j`, AssociationSchemes 2.1, in prose). The eigenspaces of
`T` are one-dimensional, because `T` is tridiagonal with nonzero off-diagonal entries (2.2). The
orthogonality relations of AssociationSchemes 2.2 with `m_i P_(ij) = v_j Q_(ji)` give
`∑_i v_i Q_(ij)² = |X| m_j`, hence `∑_i k_i u_i² = |V|/m_j`; GraphSpectra 1.2 identifies the
count in `adjSpectrum` with the dimension of the eigenspace, which is `m_j`.

**Checks.**
- Petersen: eigenvalues `3`, `1`, `−2` with multiplicities `1`, `5`, `4`.
- The Heawood graph: `±3` and `±√2` with multiplicities `1`, `1`, `6`, `6`.
- The cube: `±3` once and `±1` three times each; `H(3, 3)`: `6`, `3`, `0`, `−3` with
  multiplicities `1`, `6`, `12`, `8`.
- `K_1`: `u = (1)`, and `θ = 0` has multiplicity `1/1 = 1`.
- The formula also gives the spectra of the icosahedron, the dodecahedron, the Desargues graph,
  `H(4, 2)` and `J(6, 3)` (`9`, `3`, `−1`, `−3` with multiplicities `1`, `5`, `9`, `5`).

*Needs:* 3.1; AssociationSchemes 2.1 and 2.2; GraphSpectra 1.2.

### 3.3 Smith's theorem

- **Smith's theorem** (`IsDistanceRegular.exists_not_connected_distanceGraph_iff`). A
  distance-regular graph of diameter at least `2` and degree at least `3` has a disconnected
  distance-`i` graph for some `0 < i ≤ d` exactly when it is bipartite or antipodal [BH, §12.3,
  p. 178; BVM, Theorem 1.2.2, p. 20].

**Suggested proof:**
- a bipartite graph of diameter at least `2` has a disconnected distance-`2` graph, and an
  antipodal one a disconnected distance-`d` graph (a disjoint union of cliques, not all of `V`);
- conversely, a component of a disconnected distance-`i` graph is a block of a nontrivial
  equivalence relation preserved by the distance classes, and the set `J` of distances occurring
  inside a block is closed under the distances it generates;
- the parameter inequalities of 2.2 with `k ≥ 3` leave `J = {0, 2, 4, …}` (bipartite) or
  `J = {0, d}` (antipodal), as in [BVM, Theorem 1.2.2, p. 20].

**Checks.**
- The cube, `K_{3,3}` and the Desargues graph are bipartite and antipodal, the Heawood graph is
  bipartite and not antipodal, the dodecahedron, the icosahedron and `J(6, 3)` are antipodal and
  not bipartite; each has a disconnected distance graph.
- The Petersen graph, `J(5, 2)` and `H(3, 3)` are neither, and all their distance graphs are
  connected.
- Negative control: `C_9` has `d = 4` and the disconnected distance-`3` graph `3K_3`, but is
  neither bipartite nor antipodal; this is why the theorem assumes `k ≥ 3`.

*Needs:* 2.1, 2.2.

### 3.4 Degree two

- **Connected `2`-regular graphs are cycles** (`exists_iso_cycleGraph`). A connected `2`-regular
  graph is isomorphic to a `SimpleGraph.cycleGraph` [BH, §12.3, p. 178].
- **Cycles are distance-regular** (`cycleGraph_isDistanceRegular`). `C_n` is distance-regular for
  `n ≥ 1`.

These are the distance-regular graphs of degree `2`, the case that 3.3 excludes. Mathlib's
`SimpleGraph.IsCycles` (every vertex has degree `0` or `2`) describes the components of such a
graph by `SimpleGraph.IsCycles.exists_cycle_toSubgraph_verts_eq_connectedComponentSupp`,
without the isomorphism to a cycle graph.

**Suggested proof:** the cycle through a vertex given by that Mathlib lemma covers the component,
which is all of `V`; walking along it numbers the vertices by `Fin n`. For the cycles, rotations
and reflections act transitively on the pairs at each distance, so 2.4 applies.

**Checks.**
- `cycleGraph 1 = K_1` and `cycleGraph 2 = K_2` are distance-regular.
- `C_7` has array `{2, 1, 1; 1, 1, 1}`, `C_6` has `{2, 1, 1; 1, 1, 2}`.
- Negative control: `cycleGraph 0` has no vertices and is not connected; it is excluded by
  `0 < n`.

*Needs:* 2.4; Mathlib `SimpleGraph.cycleGraph`, `SimpleGraph.IsCycles`.

## Layer 4: Hamming and Johnson graphs

The spectra of these graphs are not targets here: the multiset spectra of the Hamming, hypercube
and Johnson graphs are GraphSpectra 2.6, the eigenmatrix of the Johnson scheme is
AssociationSchemes 5.1, and the Krawtchouk eigenmatrix of the Hamming scheme is
DelsarteTheoryOfCodesAndDesigns 2.1.

*Depends on:* Layer 2; GraphSpectra 2.3 and 2.4.

### 4.1 Hamming graphs

- **Hamming graphs** (`hammingGraph_isDistanceTransitive`). For an alphabet `Q` with at least one
  letter, `H(d, q)` is distance-transitive and distance-regular [BH, §12.4.1, p. 178].
- **The intersection array of `H(d, q)`** (`intersection_hammingGraph`). For `q ≥ 2` the diameter
  is `d`, `b_i = (d − i)(q − 1)` and `c_i = i` for `i ≤ d` [BH, §12.4.1, p. 178].

**Suggested proof:** the graph distance is the Hamming distance (GraphSpectra 2.3);
permutations of the coordinates and of `Q` in each coordinate act transitively on the pairs at
each Hamming distance, and 2.4 applies. For the array, a neighbour of `y` at distance `i + 1`
from `x` changes one of the `d − i` agreeing coordinates to one of `q − 1` other letters, and one
at distance `i − 1` restores one of the `i` differing coordinates.

**Checks.**
- `H(3, 2)` `{3, 2, 1; 1, 2, 3}`, `H(3, 3)` `{6, 4, 2; 1, 2, 3}`, `H(2, 4)` `{6, 3; 1, 2}`,
  `H(4, 2)` `{4, 3, 2, 1; 1, 2, 3, 4}`, `H(1, 5) = K_5` `{4; 1}`.
- `H(2, 3)` `{4, 2; 1, 2}`, the `3 × 3` rook graph.
- Negative control: `H(d, 1)` is a single vertex, distance-regular of diameter `0`, so the
  diameter `d` fails for `d ≥ 1`; this is why the array assumes `q ≥ 2`.

*Needs:* 2.1, 2.4; GraphSpectra 2.3.

### 4.2 Johnson graphs

- **Johnson graphs** (`johnsonGraph_isDistanceRegular`). For a `v`-set and `k ≤ v`, `J(v, k)` is
  distance-regular of diameter `min(k, v − k)` [BH, §12.4.2, p. 179].
- **The intersection array of `J(v, k)`** (`intersection_johnsonGraph`). For `2k ≤ v` and
  `i ≤ k`, `b_i = (k − i)(v − k − i)` and `c_i = i²` [BH, §12.4.2, p. 179].

**Suggested proof:** the distance of two `k`-sets is `k − |s ∩ t|` (GraphSpectra 2.4), and the
symmetric group of the `v`-set acts transitively on the pairs of `k`-sets with a given
intersection size, so 2.4 applies. For the array, a neighbour of `t` at distance `i + 1` from
`s` swaps one of the `k − i` points of `s ∩ t` for one of the `v − k − i` points outside
`s ∪ t`, and one at distance `i − 1` swaps one of the `i` points of `t \ s` for one of the `i`
points of `s \ t`.

**Checks.**
- `J(5, 2) = T(5)`: `{6, 2; 1, 4}`; `J(4, 2)`, the octahedron: `{4, 1; 1, 4}`; `J(6, 3)`:
  `{9, 4, 1; 1, 4, 9}`; `J(7, 3)`: `{12, 6, 2; 1, 4, 9}`.
- `J(5, 3)`, `J(6, 4)` and `J(7, 5)` have diameter `2`, `J(7, 4)`, `J(8, 5)` and `J(8, 3)`
  diameter `3`, `J(9, 4)` diameter `4`; `J(4, 4)` and `J(4, 0)` are single vertices.
- Negative control: for `2k > v` the formula fails beyond the diameter. `J(5, 4) ≅ K_5` has
  diameter `1`, and at `i = 2 ≤ k` the formula gives `c_2 = 4`, while `c_2 = 0` since no pair is
  at distance `2`; the array keeps the source's `2k ≤ v`.

*Needs:* 2.1, 2.4; GraphSpectra 2.4.

## Layer 5: the spectral excess theorem

The definitions are:
- `spectralPairing G p q = tr (p(A) q(A))/n`;
- `monicOrthogonalPair G i = (r_i, r_(i+1))`, with `r_0 = 1`, `r_1 = X − ⟨X, 1⟩/⟨1, 1⟩` and
  `r_(i+2) = (X − α_(i+1)) r_(i+1) − β_(i+1) r_i`, where `α_j = ⟨X r_j, r_j⟩/⟨r_j, r_j⟩` and
  `β_j = ⟨r_j, r_j⟩/⟨r_(j−1), r_(j−1)⟩`;
- `predistancePolynomial G k i = (r_i(k)/⟨r_i, r_i⟩) r_i`, the multiple `p_i` of `r_i` with
  `⟨p_i, p_i⟩ = p_i(k)`.

These are the polynomials that [BH, §12.11, p. 184] obtains by Gram–Schmidt. The recurrence is a
definition, and the theorems apply for `i ≤ D`, where `D + 1` is the number of distinct
eigenvalues; beyond `D` the pairing degenerates and the recurrence divides by `0`.

*Depends on:* Layer 2; GraphSpectra 1.2.

**Checks of the definitions.**
- `spectralPairing` for `K_5`: `⟨1, 1⟩ = 1`, `⟨X, 1⟩ = tr A/5 = 0` and `⟨X, X⟩ = tr A²/5 = 4`.
- `predistancePolynomial` for `K_5`: `D = 1`, `p_0 = 1` and `p_1 = X`.
- The Petersen graph: `p_2 = X² − 3`, so `p_2(A) = A_2`.
- Negative control for the normalisation: for the cube, `p_2 = (X² − 3)/2`, while the monic
  `r_2 = X² − 3`; `p_2(3) = 3 = k_2`, `r_2(3) = 6`.

### 5.1 The predistance polynomials

- **The predistance polynomials** (`predistancePolynomial_spec`). For a connected `k`-regular
  graph and `i, j ≤ D`: `deg p_i = i`, `⟨p_i, p_j⟩ = δ_(ij) p_i(k)` and `p_i(k) > 0` [BH, §12.11,
  p. 184].
- **The Hoffman polynomial** (`sum_aeval_predistancePolynomial`). `∑_(i ≤ D) p_i(A) = J` [BH,
  §12.11, p. 184].

**Suggested proof:** the pairing is `(1/n) ∑_θ m_θ p(θ) q(θ)` over the distinct eigenvalues
(GraphSpectra 1.2), positive definite on the polynomials of degree at most `D`; the recurrence
follows from `⟨Xp, q⟩ = ⟨p, Xq⟩`; `p_i(k) > 0` because the zeros of `r_i` lie in the open
interval between the least eigenvalue and `k`, as [BH] shows. For the Hoffman polynomial,
`⟨p_i, ∑_j p_j⟩ = p_i(k) = (1/n) tr (p_i(A) J)`, and `J` is a polynomial in `A` of degree at most
`D` because `k` is a simple eigenvalue with eigenvector `𝟙`.

**Checks.**
- The Hoffman polynomial `p_0 + ⋯ + p_D` gives `J` on `K_5`, the Petersen graph, the Heawood graph
  and the cube.
- Petersen: `p_0(3) + p_1(3) + p_2(3) = 1 + 3 + 6 = 10 = n`.
- Negative control: for the prism `C_5 □ K_2`, `D = 5` and `p_5(3) ≈ 0.0061 > 0`, although no
  pair is at distance `5`.

*Needs:* GraphSpectra 1.2; Mathlib `Polynomial.aeval`.

### 5.2 The spectral excess theorem

- **The spectral excess theorem** (`spectral_excess`). The average number `k̄_D` of vertices at
  distance `D` is at most `p_D(k)`, with equality exactly when the graph is distance-regular [BH,
  Theorem 12.11.1, pp. 183–184].

**Suggested proof** (Fiol, Gago and Garriga, as in [BH]):
- with `⟨M, N⟩ = tr (MN)/n`, the projection of `A_D` on the polynomials in `A` is
  `(k̄_D/p_D(k)) p_D(A)`, and Bessel's inequality gives the bound;
- equality makes `A_D = p_D(A)`, and downward induction with `∑_h p_h(A) = J = ∑_h A_h` gives
  `A_h = p_h(A)` for all `h`; the recurrence of the `p_h` becomes that of the `A_h`, and
  AssociationSchemes 6.2 (or the definition directly) gives distance-regularity.

**Checks.**
- `K_5`: `D = 1`, `k̄_1 = 4 = p_1(4)`.
- Petersen, `D = 2`: `k̄_2 = 6 = p_2(3)`; Heawood, `D = 3`: `k̄_3 = 4 = p_3(3)`; the cube,
  `D = 3`: `k̄_3 = 1 = p_3(3)`.
- Negative control: the prism `C_5 □ K_2` has `D = 5` and diameter `3`, so `k̄_5 = 0 < p_5(3)`;
  the Möbius–Kantor graph has `D = 5`, diameter `4`, and `k̄_5 = 0 < p_5(3) = 0.2`. Neither is
  distance-regular.

*Needs:* 5.1.

### 5.3 Predistance polynomials of a distance-regular graph

- **Predistance polynomials of a distance-regular graph**
  (`IsDistanceRegular.aeval_predistancePolynomial`). `p_i(A) = A_i` for `i ≤ d`, with `k = b_0`
  [BH, §12.11, p. 184].

**Suggested proof:** by 3.1, `D = d`; by 2.3 the `A_i` are polynomials `v_i(A)` of degree `i`,
pairwise orthogonal for `⟨M, N⟩ = tr (MN)/n` with `⟨A_i, A_i⟩ = k_i = v_i(k)`; the uniqueness of
orthogonal polynomials with this normalisation gives `v_i = p_i`.

**Checks.**
- Petersen: `p_2(A) = A² − 3I = A_2`.
- The cube: `p_2(A) = (A² − 3I)/2 = A_2`.
- `K_5`: `p_1(A) = A = A_1`.

*Needs:* 2.3, 3.1, 5.1.

## Layer 6: perfect codes and Lloyd's theorem

The definitions are `Scheme.IsPerfectSet` and `IsPerfectCode` (Conventions).

*Depends on:* Layer 2; 4.1; AssociationSchemes 2.1 and 4.1; DelsarteTheoryOfCodesAndDesigns 2.1;
BoundsOnCodes 1.2 and 5.1 (definitions); Tau Ceti `TauCeti.krawtchouk`.

**Checks of the definitions.**
- `IsPerfectSet`: in the cube, `{000, 111}` is `{0, 1}`-perfect, and `2 · (1 + 3) = 8`.
- `IsPerfectSet` with `0 ∉ I`: in the cube, the whole vertex set is `{3}`-perfect (each vertex has
  one antipode), and `{000, 001}` is `{0, 2}`-perfect.
- Negative control for `IsPerfectSet`: `{000}` is not `{0, 1}`-perfect, since `111` is at
  distance `3`; and `1 · 4 ≠ 8`.
- `IsPerfectCode`: in `C_7` a single vertex is a `3`-perfect code, and `1 · (1 + 2 + 2 + 2) = 7`.
- `IsPerfectCode`: the binary Hamming code of length `7`, `16` words, is a `1`-perfect code in
  `H(7, 2)`, and `16 · 8 = 128`.
- Negative control for `IsPerfectCode`: in the edgeless graph on two vertices one vertex is not
  a `0`-perfect code, since the other vertex is at extended distance `⊤`; with the junk `0` of
  `SimpleGraph.dist` it would be covered.

### 6.1 Sphere packing

- **Sphere packing in a scheme** (`Scheme.IsPerfectSet.card_mul_sum_valency`). For an
  `I`-perfect set, `|Y| ∑_(i∈I) v_i = |X|` [BCN, §2.5, p. 56].
- **Perfect codes in distance-regular graphs** (`IsDistanceRegular.isPerfectCode_iff`). In a
  distance-regular graph an `e`-perfect code is exactly a `{0, …, e}`-perfect set of `distRel G`,
  and then `|C| ∑_(i≤e) k_i = |V|`.

**Suggested proof:** count the pairs `(y, x)` with `y ∈ Y` and `rel y x ∈ I` in two ways. For the
graph form, `edist` is finite on a connected graph and agrees with `dist`, `distRel G` caps it at
the diameter, and `valency (distRel G) i = k_i` by 2.2.

**Checks.**
- The cube, `{000, 111}`, `I = {0, 1}`: `2 · (1 + 3) = 8`.
- `C_7`, one vertex, `e = 3 = d`: `1 · 7 = 7`.
- Negative control: for `e > d` the set `{0, …, e}` of the second statement is read in
  `Fin (d + 1)` and is all classes; the graph form then says that `C` is a single vertex.

*Needs:* 2.2; AssociationSchemes 6.2.

### 6.2 Lloyd's theorem

- **Lloyd's theorem** (`Scheme.IsPerfectSet.sum_eigenmatrix_eq_zero`). If `Y` is `I`-perfect
  with inner distribution `a`, then `∑_(i∈I) P_(ji) = 0` for every `j ≠ 0` with `(aQ)_j ≠ 0`
  [BCN, Corollary 2.5.4, p. 56].

**Suggested proof:** perfection says `(∑_(i∈I) A_i) χ_Y = 𝟙` for the characteristic vector
`χ_Y`. Apply `E_j`, `j ≠ 0`: since `E_j 𝟙 = 0` and `E_j A_i = P_(ji) E_j` (AssociationSchemes
2.1), this gives `(∑_(i∈I) P_(ji)) E_j χ_Y = 0`. Finally `E_j χ_Y ≠ 0` exactly when
`(aQ)_j ≠ 0`, by the equality case of Delsarte's inequalities, AssociationSchemes 4.1. This route
needs neither `0 ∈ I` nor Proposition 2.5.3 of [BCN, p. 55], through which [BCN] argues.

**Checks.**
- The cube, `{000, 111}`, `I = {0, 1}`: `a = (1, 0, 0, 1)`, `(aQ)_2 = 3 + 3 = 6 ≠ 0`, and
  `P_(20) + P_(21) = 1 + (−1) = 0`.
- The theorem holds for all `66` pairs `(I, Y)` with `Y` an `I`-perfect set in the cube, all `8`
  in `C_7`, all `11` in the Petersen graph and all `10` in `H(2, 3)`, including sets with
  `0 ∉ I`.
- Negative control: `j = 0` always has `(aQ)_0 = |Y| ≠ 0`, and `∑_(i∈I) P_(0i) = ∑_(i∈I) v_i > 0`;
  this is why `j ≠ 0` is assumed.

*Needs:* 6.1; AssociationSchemes 2.1 and 4.1.

### 6.3 Lloyd's theorem for Hamming codes

- **Lloyd's theorem for Hamming codes** (`sum_krawtchouk_eq_zero_of_isPerfect`). For a perfect
  code of radius `t` in `H(n, q)`, `q ≥ 2`, and `1 ≤ j ≤ n` with `∑_i A_i K_j(i) ≠ 0` (the
  Krawtchouk transform of the distance distribution), the Lloyd polynomial `∑_(i≤t) K_i`
  vanishes at `j` [BCN, Corollary 2.5.4, p. 56]. [Godsil, §11.7, Theorem 7.2, p. 210] states
  Lloyd's theorem for completely regular codes, in the form that the characteristic polynomial
  of the quotient divides that of the graph.
- **The zeros of the Lloyd polynomial** (`card_lloyd_zeros_of_isPerfect`). For a perfect code of
  radius `t ≤ n` in `H(n, q)`, `q ≥ 2`, at least `t` indices `1 ≤ j ≤ n` have nonzero transform;
  hence the Lloyd polynomial has at least `t` zeros among `1, …, n`, and since it has degree `t`
  these are all its zeros [BCN, Proposition 2.5.5 (ii) and Remark (i), p. 56].

**Suggested proof:** 6.2 for the Hamming scheme of DelsarteTheoryOfCodesAndDesigns 2.1, whose
primitive idempotents have `P_(ij) = Q_(ij) = K_j(i)`, with `I = {0, …, t}`; the inner
distribution is `A_i/|C|`, and a perfect code of radius `t` in the sense of BoundsOnCodes 1.2 is
an `I`-perfect set. For the count, suppose only `s < t` indices `j ≥ 1` have `E_j χ_C ≠ 0`. The
eigenvalues `θ_j = (q − 1)n − qj` are distinct, so a polynomial `g` of degree `s` vanishing at
those `s` eigenvalues makes `g(A) χ_C = g(θ_0) E_0 χ_C` a constant vector. By 2.3 and 4.1,
`g(A) = ∑_(i≤s) c_i A_i` with `c_s ≠ 0`. A word at distance `s` from its nearest codeword gives
the entry `c_s`, and a word at distance `s + 1 ≤ t` from its nearest codeword gives `0` (both exist
since `t ≤ n`); so `c_s = 0`, a contradiction. The first statement then puts a zero of the Lloyd
polynomial at each of these at least `t` indices. [BCN] argues instead through the rank of the
outer distribution matrix.

**Checks.**
- The binary Hamming code, `n = 7`, `t = 1`: the distance distribution is
  `(16, 0, 0, 112, 112, 0, 0, 16)` and its transform `(256, 0, 0, 0, 1792, 0, 0, 0)`; the Lloyd
  polynomial `1 + K_1(j) = 8 − 2j` vanishes at `j = 4`, the only `j ≥ 1` with nonzero transform.
- The repetition code `{000, 111}`, `t = 1`: transform `(4, 0, 12, 0)`, and `1 + K_1(2) = 0`.
- The zeros `j ≥ 1` of the Lloyd polynomial: `8`, `12`, `16` for `n = 23`, `q = 2`, `t = 3` (the
  binary Golay code); `6`, `9` for `n = 11`, `q = 3`, `t = 2` (the ternary Golay code); `9` for
  `n = 13`, `q = 3`, `t = 1` (the ternary Hamming code).
- Negative control: `j = 0` has transform `|C|² = 256` for the Hamming code, and
  `∑_(i≤t) K_i(0) = 8` is the ball size; this is why `1 ≤ j` is assumed.
- Zeros and nonzero transforms agree: `{2, 4}` for the repetition code of length `5`, `t = 2`;
  `{3}` for the ternary Hamming code of length `4`; `{1, 2, 3}` for a single word in `H(3, 2)`,
  `t = 3`.
- Negative control for the count: a single word of `H(1, 2)` is a perfect code of radius `t = 2`,
  but there is only the index `j = 1`; this is why `t ≤ n` is assumed.

*Needs:* 2.3, 4.1, 6.2; DelsarteTheoryOfCodesAndDesigns 2.1; BoundsOnCodes 1.2 and 5.1
(definitions); Tau Ceti `TauCeti.krawtchouk`.

## Layer 7: Moore graphs and the bipartite Moore bound

The definition is `bipartiteMooreBound` (Conventions). 7.3 is built after 8.3, the Feit–Higman
theorem; Layer 8 needs nothing of Layer 7, so 7.1 and 7.2 come before Layer 8 and 7.3 after it.

*Depends on:* Layer 2; 8.3; StronglyRegularAndMooreGraphs 3.1 (definition), 3.1 and 3.3; Mathlib
`SimpleGraph.egirth`.

**Checks of the definition.**
- `bipartiteMooreBound 3 3 = 14` (the Heawood graph), `bipartiteMooreBound 3 2 = 6` (`K_{3,3}`),
  `bipartiteMooreBound 3 4 = 30` (Tutte's `8`-cage).
- `bipartiteMooreBound k 1 = 2` for every `k`, and `bipartiteMooreBound k 0 = 0`.
- Negative control: `bipartiteMooreBound 0 1 = 2` exceeds the one vertex of `K_1`, whose degrees
  are `0`; this is why 7.2 assumes `k ≥ 1`.

### 7.1 Moore graphs

- **Moore graphs are distance-regular** (`isDistanceRegular_of_card_eq_mooreBound`). A connected
  graph with all degrees at most `k` and exactly `mooreBound k D` vertices, `D` its diameter, is
  distance-regular, with `b_0 = k` when `D ≥ 1`, `b_i = k − 1` for `1 ≤ i < D` and `c_i = 1` for
  `1 ≤ i ≤ D` [Biggs, Proposition 23.1 (1), p. 180; GR, Theorem 5.8.2, p. 91; BH, §12.9, p. 182].

**Suggested proof:** for `D ≥ 1`, StronglyRegularAndMooreGraphs 3.3 turns the equality into
`k`-regularity and girth at least `2D + 1`. Then a vertex at distance `i ≤ D` from `x` has one
neighbour nearer to `x` (`c_i = 1`) and, for `i < D`, none at the same distance (`a_i = 0`), as in
[Biggs]. For `D = 0` the graph is `K_1`.

**Checks.**
- `C_5`, the Petersen graph and `K_4`: `mooreBound 2 2 = 5`, `mooreBound 3 2 = 10`,
  `mooreBound 3 1 = 4`; arrays `{2, 1; 1, 1}`, `{3, 2; 1, 1}`, `{3; 1}`.
- `C_7`: `mooreBound 2 3 = 7`, array `{2, 1, 1; 1, 1, 1}`; `K_2`: `mooreBound 1 1 = 2`.
- Negative control: `K_1` meets `mooreBound k 0 = 1` for every `k`, but `b_0 = 0`; this is why
  `b_0 = k` assumes `D ≥ 1`. The path `P_3` (degrees at most `2`, diameter `2`) has `3` vertices,
  not `mooreBound 2 2 = 5`.

*Needs:* 2.1, 2.2; StronglyRegularAndMooreGraphs 3.1 and 3.3.

### 7.2 The bipartite Moore bound

- **The bipartite Moore bound** (`bipartiteMooreBound_le_card`). A nonempty graph with all
  degrees at least `k ≥ 1` and extended girth at least `2t` has at least `2 ∑_(i<t) (k − 1)^i`
  vertices [Biggs, Proposition 23.1 (2), p. 180], which states it for `k`-regular graphs of girth
  `2t`.

StronglyRegularAndMooreGraphs 3.2 is the odd-girth bound; the even-girth bound is stated here.

**Suggested proof:** for `t ≥ 1` take an edge `xy`; the vertices at distance at most `t − 1`
from `x` or from `y` along paths avoiding the edge form two disjoint trees, each with at least
`∑_(i<t) (k − 1)^i` vertices, because a cycle among them would have length less than `2t`.

**Checks.**
- The Heawood graph (girth `6`, `14` vertices), `K_{3,3}` (girth `4`, `6`) and Tutte's `8`-cage
  (girth `8`, `30`) attain the bound.
- An acyclic graph has extended girth `⊤`; with `k = 1` the bound is `2` for every `t ≥ 1`, which
  an edge supplies.
- Negative control: the cube has girth `4` and `8 > bipartiteMooreBound 3 2 = 6` vertices.

*Needs:* Mathlib `SimpleGraph.egirth`.

### 7.3 The even equality case

- **The even equality case** (`isGeneralizedPolygon_of_card_eq`). A nonempty `k`-regular graph,
  `k ≥ 3`, of extended girth `2m` with exactly `bipartiteMooreBound k m` vertices is a generalized
  `m`-gon (of order `(k − 1, k − 1)`), and `m ∈ {2, 3, 4, 6}` [Biggs, Proposition 23.1 (2),
  p. 180, and Theorem 23.6, p. 185; BH, §12.9, p. 182].

**Suggested proof:** equality makes the graph bipartite and distance-regular of diameter `m`
with array `{k, k − 1, …, k − 1; 1, …, 1, k}` [Biggs, Proposition 23.1 (2), p. 180]. The
restriction on `m` is the Feit–Higman theorem, 8.3, with `s = t = k − 1`, since `2s²` is not a
square.

**Checks.**
- The Heawood graph (`m = 3`), `K_{3,3}` (`m = 2`) and Tutte's `8`-cage (`m = 4`) are the
  generalized polygons of order `(2, 2)` attaining the bound for `k = 3`.
- `2s²` is not a square for `1 ≤ s ≤ 1000`, as `√2` is irrational.
- Negative control: the cube, `k = 3`, extended girth `4`, has `8 > 6` vertices and is not a
  generalized `2`-gon (its diameter is `3`).

*Needs:* 7.2, 8.3.

## Layer 8: generalized polygons and symmetric designs

The definitions are `IsGeneralizedPolygon`, `IsThick`, `HasOrder` and `pointGraph`
(Conventions).

*Depends on:* Layers 2 and 3; StronglyRegularAndMooreGraphs 1.2 and 1.3;
StronglyRegularGraphsAndDesigns 2.4, 5.1, 5.2 and 5.3; GraphSpectra 1.2; Mathlib `niven`.

**Checks of the definitions.**
- `IsGeneralizedPolygon`: the Heawood graph is a generalized `3`-gon (diameter `3`, girth `6`).
- `IsGeneralizedPolygon`: `K_{3,3}` and `K_{3,4}` are generalized `2`-gons (diameter `2`, girth
  `4`).
- `IsGeneralizedPolygon`: the incidence graph of `GQ(2, 2)` (the `15` pairs of a `6`-set and the
  `15` partitions into three pairs) is `3`-regular on `30` vertices, of diameter `4` and girth
  `8`.
- Negative control for `IsGeneralizedPolygon`: the cube is bipartite of diameter `3`, but its
  girth is `4`, not `6`.
- `IsThick`: the Heawood graph and the incidence graph of `GQ(2, 2)` are thick.
- Negative control for `IsThick`: `C_8` is a generalized `4`-gon of order `(1, 1)`, and not thick;
  indeed `C_(2m)` is a generalized `m`-gon for every `m ≥ 2`.
- `HasOrder`: the Heawood graph has order `(2, 2)`; the incidence graph of `K_{3,3}`, as a
  generalized quadrangle with `6` points and `9` lines, has order `(1, 2)`.
- Negative control for `HasOrder`: with the colours exchanged, that graph has order `(2, 1)`, not
  `(1, 2)`.
- `pointGraph`: for the Heawood graph it is `K_7`, of diameter `1 = ⌊3/2⌋`; for `C_8` it is
  `C_4`.
- `pointGraph`: for `GQ(2, 2)` it is strongly regular `(15, 6, 1, 3)`.

### 8.1 Orders

- **Orders** (`IsGeneralizedPolygon.exists_hasOrder`). A thick generalized `m`-gon has an order
  `(s, t)` for each colouring, with `s = t` when `m` is odd [BH, Proposition 9.6.1 (ii), p. 130].

**Suggested proof:** opposite vertices (at distance `m`) have equal degree, by the bijection
between their neighbourhoods given by nonopposition; thickness propagates this along a line, as
in [BH]. For odd `m`, a vertex opposite a point is a line.

**Checks.**
- The Heawood graph: `s = t = 2`.
- The incidence graph of `GQ(2, 2)`: `s = t = 2`.
- Negative control: `K_{3,4}` is a generalized `2`-gon of order `(3, 2)`, so `s ≠ t` occurs for
  even `m`.

*Needs:* 2.1.

### 8.2 Point graphs

- **Point graphs are distance-regular** (`IsGeneralizedPolygon.isDistanceRegular_pointGraph`).
  For a thick generalized `m`-gon, the point graph and the line graph are distance-regular of
  diameter `⌊m/2⌋` [BH, §12.9, p. 182].
- **Generalized polygons of order `(s, s)`** (`IsGeneralizedPolygon.isDistanceRegular`). A
  generalized polygon of order `(s, s)` is itself distance-regular [GR, Lemma 5.6.9, p. 87].

**Suggested proof:** by 8.1 the polygon has an order `(s, t)`. For two points at distance `2i` in
the polygon, `i < m/2`, the geodesic is unique because the girth is `2m`, and the neighbours of
one point at distances `2i − 2`, `2i` and `2i + 2` from the other are counted through the `t + 1`
lines on it: `c_i = 1`, `a_i = s − 1` and `b_i = st` for `0 < i < ⌊m/2⌋`, with `b_0 = s(t + 1)`
and the last column read off at distance `m` or `m − 1`. For order `(s, s)` the same count runs in
the polygon itself.

**Checks.**
- The Heawood graph: point graph `K_7`, diameter `1`.
- `GQ(2, 2)`: point graph of diameter `2` with array `{6, 4; 1, 3}`.
- Negative control: the diameter is `⌊m/2⌋`, not `⌈m/2⌉`; for the Heawood graph (`m = 3`) the
  point graph `K_7` has diameter `1`, not `2`.

*Needs:* 2.1, 8.1.

### 8.3 The Feit–Higman theorem

- **The Feit–Higman theorem** (`IsGeneralizedPolygon.feit_higman`). A generalized `m`-gon of
  order `(s, t)` with `s, t > 1` has `m ∈ {2, 3, 4, 6, 8}`; for `m = 6` the product `st` is a
  square, and for `m = 8` the number `2st` is a square [BH, Theorem 12.9.2, p. 182; BCN, Theorem
  6.5.1, p. 201; GR, Theorem 5.6.8, p. 87].

**Suggested proof** (by the integrality of multiplicities, as [BH] and [BCN] indicate):
- the point graph has intersection array `{s(t + 1), st, …, st; 1, …, 1, c}` (8.2);
- its eigenvalues other than `s(t + 1)` include `s − 1 + 2√(st) cos(2πj/m)` for `0 < j < m/2`,
  with multiplicities from Biggs's formula, 3.2;
- integrality of the multiplicities forces `cos(2π/m)` rational, or the square conditions;
- Mathlib's Niven theorem `niven` on rational values of the cosine at rational multiples of `π`
  finishes.

**Checks.**
- `GQ(2, 2)`: `m = 4`.
- The Heawood graph: `m = 3`, order `(2, 2)`.
- `m = 6` with `s = t = 2`: `st = 4` is a square (the generalized hexagon of order `(2, 2)`
  exists [BH, §12.6, p. 181]).
- Negative control: `C_(2m)` has `s = t = 1` and is a generalized `m`-gon for every `m`; this is why
  `s, t > 1` is assumed.

*Needs:* 3.2, 8.2; Mathlib `niven`.

### 8.4 Generalized quadrangles

- **Generalized quadrangles** (`IsGeneralizedPolygon.isSRGWith_pointGraph`). For `m = 4` and
  order `(s, t)` with `s, t ≥ 1`, the point graph is strongly regular with parameters
  `((s + 1)(st + 1), s(t + 1), s − 1, t + 1)` [BH, Theorem 9.6.2, p. 131; GR, Lemma 10.8.1,
  p. 235].
- **The spectrum of a generalized quadrangle** (`IsGeneralizedPolygon.adjSpectrum_pointGraph`).
  `s + t` divides `st(s + 1)(t + 1)` and `s²(st + 1)`, and the point graph has spectrum
  `s(t + 1)` once, `s − 1` with multiplicity `st(s + 1)(t + 1)/(s + t)` and `−t − 1` with
  multiplicity `s²(st + 1)/(s + t)` [BH, Theorem 9.6.2, p. 131; GR, Lemma 10.8.2, p. 236].

**Suggested proof:** each point is on `t + 1` lines of `s` further points, which gives `k` and
`ℓ`; a noncollinear point sees one point on each of these lines, which gives `μ`; counting from
a line gives `v`. The spectrum and multiplicities are StronglyRegularAndMooreGraphs 1.2–1.3
applied to these parameters (`0 < μ`, and the point graph is not complete), with GraphSpectra 1.2
for the counts in `adjSpectrum`; the divisibility is the integrality of the multiplicities.

**Checks.**
- `GQ(2, 2)`: `(15, 6, 1, 3)` with spectrum `6¹ 1⁹ (−3)⁵`, matching `9 = 2 · 2 · 3 · 3/4` and
  `5 = 4 · 5/4`.
- `GQ(1, 1) = C_8`: point graph `C_4`, `(4, 2, 0, 2)`, with spectrum `2¹ 0² (−2)¹`.
- `GQ(1, 2)`: point graph `K_{3,3}`, `(6, 3, 0, 3)`, with multiplicities `12/3 = 4` and `3/3 = 1`.
- Negative control: `GQ(2, 3)` would need `5 ∣ 2 · 3 · 3 · 4 = 72`, which fails; no generalized
  quadrangle of order `(2, 3)` exists [GR, Lemma 10.8.4, p. 236].

*Needs:* 8.2; StronglyRegularAndMooreGraphs 1.2 and 1.3; GraphSpectra 1.2.

### 8.5 Higman's inequality

- **Higman's inequality** (`IsGeneralizedPolygon.higman`). A generalized quadrangle of order
  `(s, t)` with `s, t > 1` has `t ≤ s²` and `s ≤ t²` [GR, Lemma 10.8.3, p. 236; BH, Theorem
  12.9.3, p. 182; BCN, Theorem 6.5.1 (ii), p. 201].

**Suggested proof:** the point graph is strongly regular `(v, s(t + 1), s − 1, t + 1)` by 8.4,
with `√Δ = s + t`, `r = s − 1` and the smaller root `−t − 1`; it is neither complete nor edgeless.
The second inequality of StronglyRegularGraphsAndDesigns 2.4 (the Krein conditions in strongly
regular form) then reads `t(t + 1)(s − 1) ≤ s²(t + 1)(s − 1)`, so `t ≤ s²` as `s > 1`. The line
graph, the point graph of the colouring with the colours exchanged, has order `(t, s)` and gives
`s ≤ t²`.

**Checks.**
- `GQ(2, 4)` has `t = s²`, the equality case.
- For `1 ≤ s, t ≤ 7` the second Krein difference `(k + s')(r + 1)² − (s' + 1)(k + s' + 2rs')`,
  with `s' = −t − 1`, equals `(s − 1)(s² − t)(t + 1)`.
- Negative control: `GQ(2, 5)` would have point graph `(33, 12, 1, 6)`, whose second Krein
  difference is `(2 − 1)(4 − 5)(5 + 1) = −6 < 0`, and `t = 5 > s² = 4`.

*Needs:* 8.4; StronglyRegularGraphsAndDesigns 2.4.

### 8.6 Symmetric designs

- **Incidence graphs of symmetric designs** (`isDistanceRegular_incidenceGraph`). The incidence
  graph of a symmetric `2`-`(v, k, ℓ)` design is distance-regular of diameter `3` with array
  `{k, k − 1, k − ℓ; 1, ℓ, k}` [GR, Theorem 5.10.3, p. 96].
- **Bipartite distance-regular graphs of diameter three** (`IsDistanceRegular.isSymmetricDesign`).
  The colour classes of a coloured distance-regular graph of diameter `3`, with adjacency as
  incidence, form a symmetric `2`-`(v, b_0, c_2)` design [GR, Theorem 5.10.3, p. 96].

**Suggested proof:** two points are at distance `2` because `ℓ > 0`; a point and a block not
through it are at distance `3` because `k < v`; the dual design of StronglyRegularGraphsAndDesigns
5.2 gives the counts from a block. Conversely `b_0` and `c_2` read off the design axioms (two
points at distance `2` have `c_2` common neighbours), the existence of a point at distance `3`
from a block gives `k < v`, and the counts from a block give `b = v`.

**Checks.**
- The Fano plane `2`-`(7, 3, 1)` gives the Heawood graph `{3, 2, 2; 1, 1, 3}`.
- The `2`-`(4, 3, 2)` design of the `3`-subsets of a `4`-set gives the cube `{3, 2, 1; 1, 2, 3}`.
- The `2`-`(3, 2, 1)` design gives `C_6`, `{2, 1, 1; 1, 1, 2}`.
- Negative control: `K_{3,3}` is bipartite and distance-regular of diameter `2`, not `3`; its
  colour classes would give `k = v = 3`, which the definition of a design excludes by `k < v`.

The spectrum `±k`, `±√(k − ℓ)` of the incidence graph is StronglyRegularGraphsAndDesigns 5.3 and
is not restated; it agrees with 3.2 here (the Heawood graph: `±3` once, `±√2` six times).

*Needs:* 2.1, 2.2; StronglyRegularGraphsAndDesigns 5.1, 5.2 and 5.3 (definitions and 5.2).

## Layer 9: cometric and `Q`-polynomial schemes

The metric half, that a scheme is metric exactly when it is `P`-polynomial, is AssociationSchemes
6.1. This layer proves the dual half for the cometric schemes of DelsarteTheoryOfCodesAndDesigns
4.1, whose routes of 4.2 and 4.3 use the polynomials `q_k` as a step.

The definition is `Scheme.IsQPolynomial` (Conventions).

*Depends on:* AssociationSchemes 1.1, 1.2, 2.1, 2.2 and 3.1; DelsarteTheoryOfCodesAndDesigns 4.1
(definition).

**Checks of the definition.**
- `IsQPolynomial`, `H(3, 2)` with `m = (1, 3, 3, 1)`: `z = (3, 1, −1, −3)`, `q_1 = z`,
  `q_2 = (z² − 3)/2`, `q_3 = (z³ − 7z)/6`.
- `IsQPolynomial`, `J(5, 2)` with `m = (1, 4, 5)`: `z = (4, 2/3, −8/3)` and
  `q_2 = 9z²/20 − z/10 − 9/5`.
- Negative control: `K_{3,3}`, with classes "other side" (`1`) and "same side" (`2`), is not
  `Q`-polynomial when `E_1` is the idempotent of multiplicity `1` on the sign vector of the
  bipartition, since `Q_(i1) = (1, −1, 1)` takes equal values on the classes `0` and `2` while
  `Q_(i2) = (4, 0, −2)` does not; with the two idempotents exchanged it is `Q`-polynomial.

### 9.1 Cometric is `Q`-polynomial

- **Cometric is `Q`-polynomial** (`Scheme.isCometric_iff_isQPolynomial`). For a scheme with
  primitive idempotents `E_0, …, E_d` in a given order, `q^k_(1j) = 0` for `k > j + 1` and
  `q^(j+1)_(1j) ≠ 0` for `j < d` exactly when there are reals `z_i` and polynomials `q_k` of
  degree `k` with `Q_(ik) = q_k(z_i)` [BCN, Proposition 2.7.1, (i′) ⇔ (iii) of the dual part,
  pp. 58–59; BH, Theorem 11.6.1, p. 173]. Both sources prove the metric half and say that the
  dual argument is similar. Godsil's definition, `E_k` a Schur polynomial of degree `k` in `E_1`
  [Godsil, §12.3, pp. 229–230], is the same condition with `z_i = Q_(i1)/|X|`, since `E_k` takes
  the value `Q_(ik)/|X|` on the pairs of class `i`.

**Suggested proof:**
- evaluating the Krein expansion `E_1 ⊙ E_j = |X|⁻¹ ∑_k q^k_(1j) E_k` of AssociationSchemes 3.1
  on a pair of class `i` gives `Q_(i1) Q_(ij) = ∑_k q^k_(1j) Q_(ik)`;
- if the scheme is cometric, this expresses `Q_(i,j+1)` through `Q_(i1) Q_(ij)` and the `Q_(ik)`
  with `k ≤ j`, and induction from `Q_(i0) = 1` gives `q_k` of degree `k` with `z_i = Q_(i1)`;
- conversely, `Q` is invertible (`PQ = |X| I`, AssociationSchemes 2.2), so the `z_i` are distinct
  and the `q_k` restricted to them are a basis; `q_1 q_j` has degree `j + 1 ≤ d` for `j < d`, so
  it is a combination of `q_0, …, q_(j+1)` with a nonzero last coefficient, and comparing with the
  first step identifies these coefficients with the `q^k_(1j)`.

**Checks.**
- `J(5, 2)`: `(q^0_(11), q^1_(11), q^2_(11)) = (4, 2/9, 20/9)`, so the natural order is cometric.
- Both properties agree for every order of the nontrivial idempotents of `H(3, 2)`, `H(2, 3)`,
  `H(4, 2)`, `J(5, 2)`, `J(6, 3)`, `J(7, 3)`, the cyclic schemes on `ℤ/7` and `ℤ/8` (classes
  `min(x − y, y − x)`) and `K_{3,3}`; they hold for `1`, `2`, `2`, `2`, `2`, `1`, `3`, `2` and `1`
  orders.
- Negative control: the product of the distance schemes of `C_4` and `K_3`, a scheme with `5`
  classes on `12` points, is neither cometric nor `Q`-polynomial for any of the `120` orders of
  its idempotents.

*Needs:* AssociationSchemes 2.1, 2.2 and 3.1; DelsarteTheoryOfCodesAndDesigns 4.1 (definition).

## Downstream consumers

No roadmap consumes this one by section. Its natural consumers are roadmaps on the Terwilliger
algebra and Leonard systems of `Q`-polynomial schemes (Layer 9), on completely regular codes and
equitable partitions of distance-regular graphs (Layers 2 and 6), and on the classification of
distance-regular graphs of small degree or with classical parameters (Layers 2–4 and 8).
GraphSymmetryAndCayleyGraphs, in its section "Beyond this roadmap", places with a roadmap on
distance-regular graphs the generalized polygons whose incidence graphs attain `s = 7` in Weiss's
theorem; Layer 8 owns generalized polygons, and their arc-transitivity is not stated here.

## Scope and ownership

The roadmap is complete when Tau Ceti proves every target above. `Suggested.lean` states the
headlines that carry a Lean name, each with every conclusion the README attaches to it; it is not
an exhaustive acceptance test, and the other headlines are targets of the same standing, stated
in prose.

Owned here:
- the ranks of entrywise products, the bounds on the eigenmatrices and the absolute bound for
  symmetric schemes (Layer 1);
- the intersection numbers, sphere sizes, distance matrices, distance graphs, antipodality and
  distance transitivity of graphs; the parameter identities and the recurrence of
  distance-regular graphs, their bridge to the distance scheme, and the strongly regular graphs as
  the distance-regular graphs of diameter two (Layer 2);
- the spectrum of a distance-regular graph, Biggs's formula, Smith's theorem and the graphs of
  degree two (Layer 3);
- the distance-regularity, diameters and intersection arrays of Hamming and Johnson graphs
  (Layer 4);
- the predistance polynomials and the spectral excess theorem (Layer 5);
- perfect sets in schemes, perfect codes in graphs and Lloyd's theorem, also in Krawtchouk form
  (Layer 6);
- the distance-regularity of Moore graphs, the bipartite Moore bound and its equality case
  (Layer 7);
- generalized polygons, their orders and point graphs, the Feit–Higman theorem, generalized
  quadrangles and Higman's inequality, and the symmetric designs as bipartite distance-regular
  graphs of diameter three (Layer 8);
- `Q`-polynomial schemes and their equivalence with cometric schemes (Layer 9).

The boundary with [AssociationSchemes](../AssociationSchemes/README.md), section by section:
- 1.1, 1.2, 2.1, 2.3, 3.1, 4.1, 6.2 (definitions): copied. 1.2, 2.1, 2.2, 2.3, 3.1, 4.1 and 6.2
  (theorems and the API it states in prose): consumed in Layers 1, 3, 6 and 9, not restated.
- 4.2, 4.3 (clique–coclique and clique bounds), 5.1 (the Johnson scheme), 5.2 (Erdős–Ko–Rado):
  not used; Layer 4 states the Johnson graphs as graphs, from the distance formula of
  GraphSpectra 2.4.
- 6.1 (metric and `P`-polynomial schemes): cited in 2.3 and Layer 9, not used in a route.
- The route of 6.2 contains the three-term recurrence of the distance matrices, which is 2.3
  here; Neumaier's absolute bound, Biggs's formula and `Q`-polynomial schemes beyond the
  definitions, which that roadmap places outside its scope, are 1.3, 3.2 and Layer 9 here.

The boundary with DelsarteTheoryOfCodesAndDesigns, section by section:
- 2.1 (the Hamming scheme with `P = Q` the Krawtchouk table): consumed in 6.3.
- 4.1 (the definition `IsCometric`): copied and used in 9.1; its theorems that the Johnson and
  Hamming schemes are cometric are not restated, and agree with the Checks of 9.1.
- 4.2 and 4.3 use, as a step of their routes, that a cometric scheme has `Q_(ij) = q_j(Q_(i1))`;
  that step is 9.1 here.
- 1.1–1.2 (Schrijver's theorem), 2.2, 3.1–3.2 (designs in schemes) and 4.4 (spherical designs):
  not used.

Consumed from other roadmaps, not restated (see the supplier contracts):
- [GraphSpectra](../GraphSpectra/README.md) 1.2 and 3.1; 2.3 and 2.4 (definitions copied, distance
  formulas used); 2.6 cited.
- [SpectralGraphBounds](../SpectralGraphBounds/README.md) 1.1: the sorted eigenvalues, copied as
  GraphSpectra copies them.
- [StronglyRegularAndMooreGraphs](../StronglyRegularAndMooreGraphs/README.md) 1.2–1.3 and 3.1
  (definition copied), 3.3. Its 3.2 is the odd-girth bound; the even-girth bound, which it places
  outside its scope, is 7.2 here.
- [BoundsOnCodes](../BoundsOnCodes/README.md) 1.2 and 5.1 (definitions copied). It owns perfect
  codes, the Hamming and Golay codes and the sphere-packing bound; Lloyd's theorem is 6.3 here, and
  the classification of perfect codes is outside both.
- StronglyRegularGraphsAndDesigns 2.4, 5.1 and 5.3 (definitions copied), 5.2.

Neighbouring roadmaps, not used here:
- GraphSymmetryAndCayleyGraphs: vertex-, edge- and arc-transitivity (Layer 1) and `s`-arcs (Layer
  7). Distance transitivity, which it does not define, is defined here directly by automorphisms.
- EquitableOperatorReduction and SpectralQuantumWalks: equitable partitions, quotients and
  spectral projectors; the routes here argue directly.

Already in the libraries and therefore not targets: the graph metric, diameter, extended girth,
cycle graphs and their components, colourings, `SimpleGraph.IsSRGWith` with its diameter, and
Niven's theorem (Mathlib); `TauCeti.krawtchouk` and the MacWilliams identity (Tau Ceti). Neither
library has association schemes, distance-regular graphs or generalized polygons.

Outside the scope: the stronger cometric condition `q^k_(ij) = 0` for `k > i + j`; the
classification of distance-regular graphs beyond the families above; completely regular codes
beyond perfect codes; and the results of the section "Beyond this roadmap".

## Exact supplier contracts

### From Mathlib

- `SimpleGraph.dist`, `SimpleGraph.edist`, `SimpleGraph.diam`, `SimpleGraph.egirth`,
  `SimpleGraph.Colorable`, `SimpleGraph.Coloring`, `SimpleGraph.IsRegularOfDegree` and
  `SimpleGraph.fromRel`; used throughout.
- `SimpleGraph.IsSRGWith` and `SimpleGraph.IsSRGWith.ediam_eq_two` (a strongly regular graph on a
  nontrivial type that is not complete and has `μ ≠ 0` has extended diameter `2`); used in 2.5.
- `SimpleGraph.cycleGraph`, `SimpleGraph.IsCycles` and
  `SimpleGraph.IsCycles.exists_cycle_toSubgraph_verts_eq_connectedComponentSupp`; used in 3.4.
- `Matrix.hadamard`, `Matrix.rank`, `Matrix.rank_mul_le_left`, `Matrix.rank_mul_le_right`; used
  in 1.1. `CompleteOrthogonalIdempotents`, in the copied definitions.
- `Matrix.charpoly`, `Polynomial.aeval`, `Polynomial.eval`, `Polynomial.natDegree`; used in
  Layers 3, 5 and 9.
- `niven` (the rational values of `cos` at rational multiples of `π` are `0`, `±1/2`, `±1`); used
  in 8.3.

### From Tau Ceti

- `TauCeti.InformationTheory.Coding.Krawtchouk`: `TauCeti.krawtchouk q n w j = K_w(j)`; used in
  6.3.

### From GraphSpectra

The roadmap [GraphSpectra](../GraphSpectra/README.md):
- 1.2: the definition `adjSpectrum`, copied verbatim; the spectrum is the root multiset of the
  characteristic polynomial, and the count of `θ` is the dimension of its eigenspace. Used in
  3.1, 3.2, 5.1 and 8.4.
- 2.3: the definition `hammingGraph` and its `DecidableRel` instance, copied verbatim; graph
  distance in `H(d, q)` is Hamming distance. Used in 4.1.
- 2.4: the definition `johnsonGraph` and its `DecidableRel` instance, copied verbatim; graph
  distance in `J(n, k)` is `k − |s ∩ t|`. Used in 4.2.
- 3.1: a connected graph of diameter `d` has at least `d + 1` distinct eigenvalues; used in 3.1.
- 2.6 (the multiset spectra of the Hamming and Johnson graphs) is cited in Layer 4 and is not a
  dependency.

### From SpectralGraphBounds

The roadmap [SpectralGraphBounds](../SpectralGraphBounds/README.md), 1.1: the sorted adjacency
eigenvalues `adjEigenvalues` (Mathlib's `eigenvalues₀` of `G.adjMatrix ℝ`, index `0` the largest),
copied verbatim as GraphSpectra copies it, under `adjSpectrum`. No theorem of it is used.

### From AssociationSchemes

The roadmap [AssociationSchemes](../AssociationSchemes/README.md):
- 1.1, 1.2, 2.1, 2.3, 3.1, 4.1 and 6.2: the definitions `IsAssocScheme`, `adjMat`, `bmAlgebra`,
  `valency`, `IsPrimitiveIdempotents`, `eigenmatrix`, `dualEigenmatrix`, `intersectionNumber`,
  `intersectionMatrix`, `kreinParam`, `innerDistribution`, `IsDistanceRegular` and `distRel`,
  copied verbatim.
- 1.2, in prose: each `E_i` is positive semidefinite of rank `m_i`, and `∑_i m_i = |X|`; used in
  1.2 and 1.3.
- 2.1: `A_j = ∑_i P_(ij) E_i` and `E_j = |X|⁻¹ ∑_i Q_(ij) A_i`, with, in prose, `Q_(0j) = m_j`,
  `Q_(i0) = 1` and `m_i P_(ij) = v_j Q_(ji)`; used in 1.2, 3.1, 3.2, 6.2 and 9.1.
- 2.2: `PQ = QP = |X| I` and `∑_i m_i P_(ij) P_(ik) = |X| v_j δ_(jk)`; used in 3.2 and 9.1.
- 2.3: the characteristic polynomial of `L_j` is `∏_i (t − P_(ij))`; used in 3.1.
- 3.1: `E_i ⊙ E_j = |X|⁻¹ ∑_k q^k_(ij) E_k`, and `q^k_(ij) ≥ 0`; used in 1.3 and 9.1.
- 4.1: `(aQ)_j ≥ 0`, with equality exactly when `E_j χ_Y = 0`; used in 6.2.
- 6.2: a finite graph is distance-regular exactly when it is connected and `distRel G` is a
  scheme; used in 2.1, 5.2 and 6.1.

### From DelsarteTheoryOfCodesAndDesigns

The roadmap DelsarteTheoryOfCodesAndDesigns:
- 2.1: for an alphabet with at least two letters, the Hamming scheme on `ι → α` has primitive
  idempotents with `P_(ij) = Q_(ij) = K_j(i)`; used in 6.3.
- 4.1: the definition `IsCometric`, copied verbatim; used in Layer 9.

### From StronglyRegularAndMooreGraphs

The roadmap [StronglyRegularAndMooreGraphs](../StronglyRegularAndMooreGraphs/README.md):
- 1.2–1.3: a strongly regular graph with `0 < μ` that is not complete has the eigenvalues `k`,
  `r`, `s`, with `k` simple and the multiplicities of `r` and `s` given by the parameters; used in
  8.4.
- 3.1: the definition `mooreBound`, copied verbatim.
- 3.3: a connected graph of diameter `D ≥ 1` with degrees at most `k` has exactly `mooreBound k D`
  vertices exactly when it is `k`-regular of extended girth at least `2D + 1`; used in 7.1.

### From BoundsOnCodes

The roadmap [BoundsOnCodes](../BoundsOnCodes/README.md), 1.2 and 5.1: the definitions `IsPerfect`
and `distanceDistribution`, copied verbatim; used in 6.3. No theorem of it is used.

### From StronglyRegularGraphsAndDesigns

The roadmap StronglyRegularGraphsAndDesigns:
- 2.4: a strongly regular graph that is neither complete nor edgeless satisfies
  `(r + 1)(k + r + 2rs) ≤ (k + r)(s + 1)²` and `(s + 1)(k + s + 2rs) ≤ (k + s)(r + 1)²`; used in
  8.5.
- 5.1: the definitions `IsTwoDesign` and `IsSymmetricDesign`, copied verbatim.
- 5.2: the dual of a symmetric design is a symmetric design with the same parameters; used in
  8.6.
- 5.3: the definition `incidenceGraph` with its `DecidableRel` instance, copied verbatim; its
  spectrum is cited in 8.6.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

- **The Damerell–Bannai–Ito theorem.** A Moore graph of diameter `d ≥ 3` is the cycle `C_(2d+1)`
  [BH, Theorem 12.9.1, p. 182], by the integrality of the multiplicities of 3.2 and an analysis
  of the zeros of the associated orthogonal polynomials, which needs their irreducibility over
  `ℚ` beyond Layer 3.
- **The Bannai–Ito conjecture.** For each `k ≥ 3` there are only finitely many distance-regular
  graphs of degree `k` [BH, §12.5, p. 180], proved by Bang, Dubickas, Koolen and Moulton as [BH]
  reports; the proof bounds the diameter in terms of the head and tail of the intersection array.
- **The Higman–Haemers–Roos inequalities.** A generalized hexagon of order `(s, t)` with
  `s, t > 1` satisfies `s ≤ t³` and `t ≤ s³`, and a generalized octagon `s ≤ t²` and `t ≤ s²`
  [BH, Theorem 12.9.3, p. 182; BCN, Theorem 6.5.1 (iii)–(iv), p. 201; GR, Theorem 5.6.10, p. 87].
  They need the Krein conditions of the distance scheme of the point graph, with explicit
  eigenmatrices for diameter `3` or `4`.

## References

- [BH] Andries E. Brouwer and Willem H. Haemers, *Spectra of Graphs*, Universitext, Springer,
  2012 (ISBN 978-1-4614-1938-9, DOI 10.1007/978-1-4614-1939-6; pages are those of this printed
  edition, not of the authors' online preprint): §9.6, pp. 129–131; §11.2, p. 167; §11.4,
  p. 171; §11.6, pp. 173–174; Chapter 12, pp. 177–184.
- [BCN] Andries E. Brouwer, Arjeh M. Cohen and Arnold Neumaier, *Distance-Regular Graphs*,
  Ergebnisse der Mathematik und ihrer Grenzgebiete (3) 18, Springer, 1989: Theorem 2.3.3, p. 51;
  §2.5, pp. 55–56; §2.7, pp. 58–59; Theorem 6.5.1, p. 201.
- [BVM] Andries E. Brouwer and Hendrik Van Maldeghem, *Strongly Regular Graphs*, Encyclopedia of
  Mathematics and its Applications 182, Cambridge University Press, 2022: §1.2, pp. 17–20;
  Proposition 1.3.13, p. 29.
- [GR] Chris Godsil and Gordon Royle, *Algebraic Graph Theory*, Graduate Texts in Mathematics 207,
  Springer, 2001: §4.5, pp. 66–69; §5.6, pp. 84–87; Theorem 5.8.2, p. 91; Theorem 5.10.3, p. 96;
  §10.8, pp. 235–236.
- [Biggs] Norman Biggs, *Algebraic Graph Theory*, 2nd ed., Cambridge Mathematical Library,
  Cambridge University Press, 1993: Proposition 23.1, p. 180; Theorem 23.6, p. 185.
- [Godsil] Chris Godsil, *Algebraic Combinatorics*, Chapman and Hall, 1993: §11.7, Theorem 7.2,
  p. 210; §12.3, pp. 228–230.

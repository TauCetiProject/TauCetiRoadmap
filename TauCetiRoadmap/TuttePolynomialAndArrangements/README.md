# Roadmap: the Tutte polynomial and hyperplane arrangements

**Summary.** Many counts attached to a graph, such as proper colourings, spanning forests,
acyclic orientations and nowhere-zero flows, obey one recursion: delete an edge, or contract it.
The Tutte polynomial is the universal invariant with this recursion, defined here for a finite
matroid. The roadmap builds the
Tutte and characteristic polynomials of a finite matroid, the chromatic and flow polynomials of
a finite simple graph with its cycle matroid, and the characteristic polynomial of a finite real
hyperplane arrangement, defined from the Möbius function of its poset of intersections. No
procedure for computing a polynomial is a target.

The headline theorems are these.

- *Deletion–contraction and universality.* For an element `e` of a finite matroid that is neither
  a loop nor a coloop, `T_M = T_(M∖e) + T_(M/e)`; a loop contributes a factor `y` and a coloop a
  factor `x`. Conversely, any function on the matroids on a finite type that equals `1` on the
  matroid with empty ground set and satisfies `f(M) = a f(M∖e) + b f(M/e)` for such `e`,
  `f(M) = y₀ f(M∖e)` for a loop and `f(M) = x₀ f(M/e)` for a coloop is an explicit
  specialization of the Tutte polynomial, with no division by `a` or `b`.
- *Whitney's broken circuit theorem.* For a finite matroid of rank `r` with a linear order on its
  elements, `(−1)^i` times the coefficient of `q^(r − i)` in the characteristic polynomial is the
  number of `i`-element sets containing no circuit with its largest element removed.
- *Zaslavsky's theorem.* A finite arrangement of affine hyperplanes in `ℝⁿ` has exactly
  `(−1)ⁿ χ(−1)` regions, and exactly `(−1)^r χ(1)` of them are bounded relative to the span of
  the normals, where `r` is the dimension of that span; for an arrangement whose normals span
  `ℝⁿ` these are the bounded regions.
- *Colourings, orientations and flows.* For a finite simple graph on `n` vertices the chromatic
  polynomial counts proper colourings, equals `(−1)^(n − c) q^c T(1 − q, 0)` with `c` the number
  of components and `T` the Tutte polynomial of the cycle matroid, and is the characteristic
  polynomial of the graphic arrangement. The graph has `(−1)ⁿ` times its value at `−1` acyclic
  orientations (Stanley), and for `k ≥ 1` its number of nowhere-zero flows with values in `ℤ/k`
  is `(−1)^(|E| − n + c) T(0, 1 − k)`.

The roadmap builds on Mathlib's matroids, which supply deletion, contraction, duality, loops,
coloops, circuits and rank, and on Mathlib's incidence algebra with its Möbius function.
Orientations are those of the Tau Ceti library. The weighted matrix-tree identity of
GeometricTopology is not restated; here spanning forests appear only through the value `T(1, 1)`.

Layer 1 below defines the Tutte polynomial of a finite matroid and proves deletion–contraction,
duality, universality and the counts of bases and independent sets. Layer 2 defines the
characteristic polynomial of a matroid and proves the broken circuit theorem. Layer 3 treats real
hyperplane arrangements: the intersection poset, the characteristic polynomial, Whitney's formula
and Zaslavsky's theorem; it uses no other layer. Layer 4 applies Layers 1 to 3 to graphs.

## Conventions

- **Matroids.** A matroid is Mathlib's `Matroid α` with a finite ground set, `[M.Finite]`. The
  rank of a set `A` is the natural number `r(A) = (M.eRk A).toNat`, and `r(E)` is the rank of the
  ground set `E`. Deletion and contraction of an element `e` are Mathlib's `M ＼ {e}` and
  `M ／ {e}` (written `M∖e`, `M/e` in prose), both matroids on the same type with ground set
  `E ∖ {e}`. Loops, coloops, circuits, bases, independent sets and the dual `M✶` are Mathlib's.
  The sums over subsets of the ground set run over `M.ground_finite.toFinset.powerset`. The
  natural-number subtractions `r(E) − r(A)`, `|A| − r(A)` and `(|E| − |A|) − (r(E) − r(A))` never
  truncate, since the rank is monotone, at most the cardinality, and increases by at most one when
  an element is added.
- **Polynomials.** The Tutte polynomial lies in `MvPolynomial (Fin 2) ℤ`, with `X 0` the variable
  `x` and `X 1` the variable `y`; `T_M(a, b)` is `eval ![a, b]`. Characteristic, chromatic and
  flow polynomials lie in `Polynomial ℤ`, in the variable `q`.
- **Graphs.** A graph is Mathlib's `SimpleGraph V` on a finite type (the existence statement of
  4.1 needs no finiteness), with `n = |V|` and edge set
  `G.edgeSet`. For a set `A` of edges, `c(A) = numComponents A` is the number of connected
  components of the graph on all of `V` with edge set `A`, so isolated vertices count, and
  `c(∅) = n`. The cycle matroid of `G` is a matroid on `Sym2 V` with ground set `G.edgeSet` whose
  independent sets are the edge sets of forests; deletion and contraction of an edge are done in
  this matroid, so contraction never needs a multigraph. Colourings are Mathlib's
  `SimpleGraph.Coloring` with colours `Fin k`.
- **Orientations.** An orientation is Tau Ceti's `TauCeti.DoubledQuiver.Orientation G`, a set of
  darts containing exactly one of the two darts over each edge; it is acyclic when its quiver
  `TauCeti.DoubledQuiver.OrientedQuiver G o` is `TauCeti.Quiver.IsAcyclic`, that is, every closed
  directed walk is trivial.
- **Arrangements.** An arrangement is a family of affine hyperplanes `{x | a i ⬝ᵥ x = c i}` in
  `d → ℝ`, indexed by a finite type `ι`, with every normal `a i` nonzero; `n = |d|`. Repeated
  hyperplanes are allowed: they change neither the regions nor the intersection poset, and
  Whitney's formula of 3.2 is insensitive to them. The topology and bornology on `d → ℝ` are the
  product ones, those of the sup norm.

## Layer 1: the Tutte polynomial of a finite matroid

### 1.1 The Tutte polynomial

Define `tuttePolynomial M`, the rank generating function

    T_M(x, y) = ∑_{A ⊆ E} (x − 1)^(r(E) − r(A)) (y − 1)^(|A| − r(A))

(Ardila, §7.6.1, equation (25); for graphs, Ellis-Monaghan–Merino, Definition 3).

**Checks.**
- The matroid with empty ground set has `T = 1`; a single loop has `T = y` and a single coloop
  `T = x`.
- The uniform matroid `U_(1,3)` (three parallel elements) has `T = x + y + y²` and `U_(2,3)` (a
  triangle) has `T = x² + x + y`. The variant with the two exponents exchanged gives
  `x² + x + y` for `U_(1,3)`, so it is excluded by this value.
- `U_(2,4)` has `T = x² + 2x + y² + 2y`; the complete graph `K₄` has
  `T = x³ + 3x² + 2x + 4xy + 2y + 3y² + y³`.

*Needs:* Mathlib `Matroid`, `Matroid.Finite`, `Matroid.ground_finite`, `Matroid.eRk`,
`MvPolynomial.X`.

### 1.2 Deletion and contraction

- `tuttePolynomial_eq_delete_add_contract`: if `e ∈ E` is neither a loop nor a coloop, then
  `T_M = T_(M∖e) + T_(M/e)`.
- `tuttePolynomial_eq_X_one_mul_of_isLoop`: if `e` is a loop, `T_M = y · T_(M∖e)`.
- `tuttePolynomial_eq_X_zero_mul_of_isColoop`: if `e` is a coloop, `T_M = x · T_(M/e)`.

(Ardila, Theorem 7.6.1 (1); Ellis-Monaghan–Merino, Definition 2 with §3.1, for graphs.) A
preliminary statement, proved here: for a nonloop `e`, the rank function of `M/e` on subsets of
`E ∖ {e}` is `A ↦ r(A ∪ {e}) − 1`, and the rank function of `M∖e` is the restriction of `r`.

Route: split the sum of 1.1 according to whether `e ∈ A`. The rank of `M∖e` is that of a
restriction (Mathlib defines deletion as restriction to `E ∖ D`). For contraction, Mathlib defines
`M ／ C` as `(M✶ ＼ C)✶`; the formula for the rank of a dual set,
`Matroid.eRk_dual_add_eRank`, applied twice gives the rank of `M/e`. If `e` is not a coloop, `r_(M∖e)(E ∖ e) = r(E)`, and if `e` is not
a loop, `r_(M/e)(E ∖ e) = r(E) − 1`, so the two halves of the sum are `T_(M∖e)` and `T_(M/e)`. A
loop never changes a rank, so each pair `A`, `A ∪ {e}` contributes `(1 + (y − 1))` times the term
of `A` in `T_(M∖e)`; a coloop raises every rank by one, so the pair contributes `(x − 1) + 1`
times the term of `A` in `T_(M/e)`, and `M/e = M∖e` for a coloop.

**Checks.**
- `U_(2,4)`: deleting an element gives `U_(2,3)` and contracting it gives `U_(1,3)`, and
  `(x² + x + y) + (x + y + y²) = x² + 2x + y² + 2y`.
- For a loop the recursion `T_M = T_(M∖e) + T_(M/e)` fails: a single loop has `T = y`, while
  deletion and contraction both give the empty matroid and the sum is `2`. So the hypotheses
  "not a loop" and "not a coloop" are needed.

*Needs:* 1.1; Mathlib `Matroid.delete`, `Matroid.contract`, `Matroid.dual`, `Matroid.IsLoop`,
`Matroid.IsColoop`, `Matroid.restrict_eRk_eq`, `Matroid.eRk_dual_add_eRank`,
`Matroid.isColoop_iff_forall_mem_isBase`, `Matroid.delete_finite`, `Matroid.contract_finite`.

### 1.3 Duality

Prove `tuttePolynomial_dual`: `T_(M✶)(x, y) = T_M(y, x)`, that is, `T_(M✶)` is obtained from
`T_M` by exchanging the two variables (Ardila, Proposition 7.6.2 (1); for plane graphs,
Ellis-Monaghan–Merino, Proposition 2).

Route: `r✶(A) = |A| − r(E) + r(E ∖ A)` (Mathlib's `Matroid.eRk_dual_add_eRank`), and
`A ↦ E ∖ A` exchanges the two exponents.

**Checks.**
- `U_(1,3)✶ = U_(2,3)`, and exchanging the variables in `x + y + y²` gives `x² + x + y`.
- `U_(2,4)` is isomorphic to its dual, and its polynomial is symmetric in `x` and `y`.

*Needs:* 1.1; Mathlib `Matroid.dual`, `Matroid.dual_finite`, `Matroid.eRk_dual_add_eRank`,
`MvPolynomial.rename`.

### 1.4 Universality

Prove `eq_sum_of_tutteGrothendieck`. Let `α` be finite, `R` a commutative ring, `a, b, x₀, y₀ ∈ R`,
and `f` a function from the matroids on `α` to `R` such that `f(M) = 1` when the ground set is
empty, `f(M) = y₀ f(M∖e)` when `e` is a loop, `f(M) = x₀ f(M/e)` when `e` is a coloop, and
`f(M) = a f(M∖e) + b f(M/e)` when `e ∈ E` is neither. Then

    f(M) = ∑_{A ⊆ E} a^((|E| − |A|) − (r(E) − r(A))) b^r(A) (x₀ − b)^(r(E) − r(A)) (y₀ − a)^(|A| − r(A)).

When `a` and `b` are units this is `a^(|E| − r(E)) b^r(E) T_M(x₀/b, y₀/a)` (Ardila, Theorem 7.6.1
(2), where footnote 15 notes that no inverse of `a` or `b` is needed after clearing denominators;
Ellis-Monaghan–Merino, Theorems 1 and 2, for graphs; the theorem is Brylawski's, 1972).

Route: the right-hand side `g(M)` equals `1` on the empty ground set and satisfies the three
recursions, by the splitting argument of 1.2 with `x − 1`, `y − 1` replaced by `x₀ − b`, `y₀ − a`
and the extra powers of `a` and `b`; then `f = g` by induction on `|E|`.

**Checks.**
- With `a = b = 1`, `x₀ = y₀ = 2`, every term is `1` and `f(M) = 2^|E|`; for `U_(2,4)` this is
  `16 = T(2, 2)`.
- With `a = 0` and `b = 1` the units form does not apply, and the formula gives `f(U_(1,2)) = y₀`,
  in agreement with the recursion `f(U_(1,2)) = 0 · f(U_(1,1)) + 1 · f(U_(0,1)) = y₀`.
- Without the condition on the empty ground set, `f = 0` satisfies the other three recursions
  but not the conclusion.
- On 118 matroids (uniform, graphic with loops and parallel edges, and linear over `𝔽₂` and `𝔽₃`,
  with at most six elements) the recursion, evaluated in two element orders, agrees with the
  formula for random integer `a`, `b`, `x₀`, `y₀`.

*Needs:* 1.2; Mathlib `Matroid.finite_of_finite`.

### 1.5 Bases and independent sets

- `eval_tuttePolynomial_one_one`: `T_M(1, 1)` is the number of bases of `M`.
- `eval_tuttePolynomial_two_one`: `T_M(2, 1)` is the number of independent sets of `M`.

(Ardila, §7.7.1; Ellis-Monaghan–Merino, Theorem 3, for connected graphs.) Route: at `y = 1` only
the sets with `|A| = r(A)`, the independent sets, contribute; at `x = 1` only those with
`r(A) = r(E)` contribute.

**Checks.**
- `U_(2,4)`: `T(1, 1) = 6` bases and `T(2, 1) = 11 = 1 + 4 + 6` independent sets.
- By 1.3, `T_M(1, 2)` is the number of spanning sets (the complements of the independent sets of
  `M✶`); it is `11` for `U_(2,4)`. Every matroid has `T_M(2, 2) = 2^|E|`.
- `K₄`: `T(1, 1) = 16`, the number of spanning trees, which is `4^(4 − 2)`.

*Needs:* 1.1, 1.3; Mathlib `Matroid.IsBase`, `Matroid.Indep`, `Matroid.indep_iff_eRk_eq_encard`,
`Matroid.Indep.isBase_of_eRk_ge`.

### Examples

Uniform matroids `U_(r,m)` with `m ≤ 5`, a single loop and a single coloop, the cycle matroids of
the triangle, the four-cycle and `K₄`, and the binary matroid of the seven nonzero vectors of
`𝔽₂³`, with their Tutte polynomials and the counts of 1.5.

### Dependencies

Mathlib `Matroid`, `Matroid.Finite`, `Matroid.ground_finite`, `Matroid.finite_of_finite`,
`Matroid.eRk`, `Matroid.delete`, `Matroid.contract`, `Matroid.dual`, `Matroid.IsLoop`,
`Matroid.IsColoop`, `Matroid.IsBase`, `Matroid.Indep`, `Matroid.restrict_eRk_eq`,
`Matroid.eRk_dual_add_eRank`, `Matroid.isColoop_iff_forall_mem_isBase`,
`Matroid.indep_iff_eRk_eq_encard`, `Matroid.Indep.isBase_of_eRk_ge`, `Matroid.delete_finite`,
`Matroid.contract_finite`, `Matroid.dual_finite`, `MvPolynomial.X`, `MvPolynomial.eval`,
`MvPolynomial.rename`. No other layer.

## Layer 2: the characteristic polynomial and broken circuits

### 2.1 The characteristic polynomial of a matroid

Define `characteristicPolynomial M`, in Whitney's form

    χ_M(q) = ∑_{A ⊆ E} (−1)^|A| q^(r(E) − r(A)).

- `χ_M(q) = (−1)^r(E) T_M(1 − q, 0)`, by comparing the two sums term by term (Ardila, §7.7.1).
  If `M` has no loop, `χ_M` also equals `∑_F μ(0̂, F) q^(r(E) − r(F))`, the sum over the lattice
  of flats with its Möbius function (Ardila, §7.7.1; Stanley, equation (22), p. 34, takes this
  form as the definition). The hypothesis is needed: for a single loop the Whitney form is
  `1 − 1 = 0`, while its lattice of flats has one element and the sum over flats is `1`.
- If `M` has a loop then `χ_M = 0`. If `e ∈ E` is neither a loop nor a coloop then
  `χ_M = χ_(M∖e) − χ_(M/e)`, and if `e` is a coloop then `χ_M = (q − 1) χ_(M/e)`. Each follows
  from 1.2 and the first bullet, or directly from the definition.

**Checks.**
- `χ` of `U_(2,4)` is `(q − 1)(q − 3)`, of `U_(1,1)` is `q − 1`, of a single loop is `0`, and of
  the matroid with empty ground set is `1`.
- For the cycle matroid of the four-cycle, `χ_M = q³ − 4q² + 6q − 3`.

*Needs:* 1.1, 1.2; Mathlib `Polynomial.X`, `Polynomial.eval`, `Matroid.IsLoop`,
`Matroid.IsColoop`.

### 2.2 Broken circuits

Fix a linear order on `α`. Define `IsBrokenCircuit M S`: `S = C ∖ {max C}` for a circuit `C` of `M`
(Stanley, Definition 4.10, p. 41). Prove `characteristicPolynomial_eq_sum_noBrokenCircuit`:

    χ_M(q) = ∑_S (−1)^|S| q^(r(E) − |S|),

the sum over the subsets `S` of `E` that contain no broken circuit. Such sets are independent,
since every circuit contains its broken circuit, so the exponent does not truncate, and
`(−1)^i [q^(r(E) − i)] χ_M` is the number of `i`-element sets without a broken circuit (Stanley,
Theorem 4.12, p. 45, for loopless matroids, where Stanley's characteristic polynomial is the one
of 2.1; Whitney, 1932, for graphs). If `M` has a loop, the empty set is a broken circuit and both
sides vanish.

Route: induction on `|E|`, splitting at the smallest element `e`. If `e` is a loop, `{e}` is a
circuit with broken circuit `∅`, so both sides vanish (2.1). Otherwise the sets without a broken
circuit are those of `M∖e` together with the sets `S ∪ {e}` for `S` without a broken circuit in
`M/e`, both minors carrying the induced order; the first part contributes `χ_(M∖e)` when `e` is
not a coloop and `q χ_(M∖e)` when it is, the second part `−χ_(M/e)`, and 2.1 finishes. (Stanley's
proof goes through the lattice of flats and an edge labelling instead.)

**Checks.**
- `U_(2,4)` with `0 < 1 < 2 < 3`: the circuits are the four 3-element sets, the broken circuits
  are the three pairs inside `{0, 1, 2}`, and the sets without a broken circuit number `1, 4, 3`
  by size, matching `q² − 4q + 3`. Counting independent sets instead would give `1, 4, 6`.
- The cycle matroid of the four-cycle: `1, 4, 6, 3` sets without a broken circuit, matching 2.1.
- Removing the smallest element of each circuit instead of the largest gives the same counts,
  since it is the statement for the reversed order.
- On the 118 matroids of 1.4, with two orders each, the identity holds, and the decomposition
  used in the route holds whenever the smallest element is not a loop.

*Needs:* 2.1; Mathlib `Matroid.IsCircuit`, `Finset.max'`.

### Examples

The uniform matroids and cycle matroids of Layer 1 with their characteristic polynomials and
broken circuit complexes in the natural order of their elements.

### Dependencies

Layer 1 (1.1, 1.2); Mathlib `Matroid.IsCircuit`, `Matroid.IsLoop`, `Matroid.IsColoop`,
`Finset.max'`, `Polynomial.X`, `Polynomial.eval`.

## Layer 3: real hyperplane arrangements

### 3.1 Arrangements, regions and the characteristic polynomial

Define the structure `Arrangement ι d`, with fields `normal`, `offset` and the proof that each
normal is nonzero, and for an arrangement `A`:

- `Arrangement.flat A B`, the intersection of the hyperplanes indexed by a finite set `B`, which is
  the whole space when `B = ∅`;
- `Arrangement.complement A`, the points on no hyperplane, and `Arrangement.regions A`, the
  connected components `connectedComponentIn` of the complement at its points (Stanley, p. 3);
- `Arrangement.IntersectionPoset A`, the set of nonempty flats ordered by reverse inclusion, so
  that the whole space, `Arrangement.IntersectionPoset.space A`, is its least element (Stanley,
  Definition 1.1, p. 8); it is finite, and is given its locally finite order from that;
- `Arrangement.charPoly A`, the characteristic polynomial
  `χ_A(q) = ∑_{X ∈ L(A)} μ(V, X) q^(dim X)`, where `μ` is Mathlib's `IncidenceAlgebra.mu` on the
  intersection poset, `V` the whole space and `dim X` the dimension of the direction
  `vectorSpan ℝ X` (Stanley, Definition 1.3, p. 10).

The rank of `A` is the dimension of the span of its normals; `A` is essential when its normals span
`d → ℝ` (Stanley, p. 2). A region `R` is relatively bounded when `R ∩ W` is bounded, `W` the span of
the normals (Stanley, p. 3).

**Checks.**
- The empty arrangement in `ℝⁿ` has `χ = qⁿ` and one region. For `n = 0` the space is a point,
  no nonzero normal exists, and `χ = 1`.
- The coordinate hyperplanes of `ℝ³` have `χ = (q − 1)³`: every subfamily meets in a different
  flat, and the intersection poset is a Boolean lattice.
- The lines `x = 0`, `y = 0`, `x + y = 1` in `ℝ²` have `χ = q² − 3q + 3`; the concurrent lines
  `x = 0`, `y = 0`, `x + y = 0` have `χ = q² − 3q + 2`, because the three pairwise intersections
  coincide and `μ` of the origin is `2`.

*Needs:* Mathlib `dotProduct`, `connectedComponentIn`, `OrderDual`, `Set.finite_range`,
`Fintype.ofFinite`, `Fintype.toLocallyFiniteOrder`, `IncidenceAlgebra.mu`, `vectorSpan`,
`Module.finrank`.

### 3.2 Whitney's formula

Prove `Arrangement.charPoly_eq_sum`: `χ_A(q) = ∑_B (−1)^|B| q^(dim ∩B)`, the sum over the finite
sets `B ⊆ ι` whose hyperplanes have a common point (Stanley, Theorem 2.4, p. 17, where
`dim ∩B = n − rank(B)`; Ardila, Theorem 6.3.1).

Route: for `X ∈ L(A)` let `g(X)` be the sum of `(−1)^|B|` over the `B` with `∩B = X`. For every
`X`, the `B` with `∩B ⊇ X` are exactly the subsets of `A_X = {i | X ⊆ H_i}`, so
`∑_{Y ≤ X} g(Y) = ∑_{B ⊆ A_X} (−1)^|B|`, which is `1` when `A_X` is empty, that is when `X` is the
whole space, and `0` otherwise (`Finset.sum_powerset_neg_one_pow_card`). This is the recursion that
defines `μ(V, ·)`, so `g = μ(V, ·)`. Indexed families with repeated hyperplanes need no separate
argument.

**Checks.**
- The line `x + y = 0` taken twice in `ℝ²`: the subfamilies `∅`, `{1}`, `{2}`, `{1, 2}` give
  `q² − q − q + q = q² − q`, the polynomial of the single line, and the same two regions.
- For the three lines of 3.1 in general position the central subfamilies are the empty one, the
  three lines and the three pairs, giving `q² − 3q + 3`.
- On 420 random arrangements in `ℝ`, `ℝ²` and `ℝ³` with at most five hyperplanes, central and
  affine, with parallel and repeated hyperplanes, the Möbius definition and the formula agree.

*Needs:* 3.1; Mathlib `IncidenceAlgebra.mu_apply`, `IncidenceAlgebra.sum_Icc_mu_right`,
`Finset.sum_powerset_neg_one_pow_card`.

### 3.3 Zaslavsky's theorem

- `Arrangement.regions_finite_and_ncard`: `A` has finitely many regions, and `(−1)ⁿ χ_A(−1)` of
  them.
- `Arrangement.ncard_relativelyBounded_regions`: if `W` is the span of the normals and `r` its
  dimension, exactly `(−1)^r χ_A(1)` regions `R` have `R ∩ W` bounded. If `A` is essential, `W` is
  the whole space, `r = n`, and these are the bounded regions.

(Stanley, Theorem 2.5, p. 19, with relatively bounded regions; Ardila, Theorem 6.2.1 (1);
Zaslavsky, 1975.)

Route, by induction on `|ι|` with Stanley's deletion–restriction recurrences (Lemmas 2.1 and 2.2,
p. 14; the erratum to Lemma 2.2 on Stanley's page states it over every field). Fix `i₀` and let `H`
be its hyperplane. (a) The regions of `A` are those of `A ∖ i₀` that miss `H`, together with two for
each region of `A ∖ i₀` that meets `H`; the latter correspond to the connected components of `H`
minus the other hyperplanes. (b) By 3.2, splitting the subfamilies according to whether they contain
`i₀`, `χ_A = χ_(A ∖ i₀) − P`, where `P(q)` is the sum of `(−1)^|B|` `q^(dim(H ∩ ∩B))` over the
`B ⊆ ι ∖ {i₀}` with `H ∩ ∩B` nonempty. (c) Transported to `ℝ^(n − 1)` by an affine isomorphism of
`H`, the traces on `H` of the hyperplanes that meet `H` without containing it form an arrangement
whose characteristic polynomial is `P` (by 3.2) and whose regions are the components in (a); a
hyperplane containing `H`, which repeats it, makes `P = 0` and leaves the regions unchanged. Both
quantities are invariant under affine isomorphisms. The relatively bounded count follows the
second recurrence of Stanley's Lemma 2.1, which distinguishes whether deleting `i₀` lowers the rank.

**Checks.**
- The three lines in general position of 3.1: `7` regions, one bounded, and `χ(−1) = 7`,
  `χ(1) = 1`.
- The parallel lines `x = 0`, `x = 1` in `ℝ²`: `χ = q² − 2q`, three regions, none bounded. Here
  `(−1)² χ(1) = −1`, so the count of bounded regions needs the arrangement to be essential; with
  `r = 1`, the strip is the one relatively bounded region and `(−1)¹ χ(1) = 1`.
- The coordinate hyperplanes of `ℝ³`: `8` regions, none bounded, `(−1)³ χ(1) = 0`.
- On the 420 arrangements of 3.2, regions and relatively bounded regions, counted as feasible sign
  vectors by linear programming, agree with both formulas, and no region of a nonessential
  arrangement is bounded.

*Needs:* 3.1, 3.2; Mathlib `connectedComponentIn`, `Bornology.IsBounded`, `Submodule.span`,
`Module.finrank`, `Set.ncard`.

### Examples

The coordinate, braid and generic arrangements in `ℝ²` and `ℝ³`, two parallel lines with and
without a transversal, and a line taken twice, with their intersection posets, Möbius values,
characteristic polynomials and regions.

### Dependencies

Mathlib `dotProduct`, `connectedComponentIn`, `OrderDual`, `Set.finite_range`, `Fintype.ofFinite`,
`Fintype.toLocallyFiniteOrder`, `IncidenceAlgebra.mu`, `IncidenceAlgebra.mu_apply`,
`IncidenceAlgebra.sum_Icc_mu_right`, `Finset.sum_powerset_neg_one_pow_card`, `vectorSpan`,
`Module.finrank`, `Submodule.span`, `Bornology.IsBounded`, `Set.ncard`. No other layer.

## Layer 4: graphs: colourings, acyclic orientations and flows

### 4.1 Components and the cycle matroid

Define `numComponents A`, the number of connected components of `SimpleGraph.fromEdgeSet A` on
all of `V`, and `IsGraphicMatroid M G`: the ground set of `M` is `G.edgeSet` and a set `I` is
independent exactly when `I ⊆ G.edgeSet` and `SimpleGraph.fromEdgeSet I` is acyclic.

- `exists_isGraphicMatroid`: every simple graph, on any vertex type, has a cycle matroid (unique,
  since a matroid is determined by its ground set and independent sets).
- `IsGraphicMatroid.eRk_add_numComponents`: for `A ⊆ G.edgeSet`, `r(A) + c(A) = n`.

(Ardila, §7.3, example 2, for connected graphs; Ellis-Monaghan–Merino, Definition 1, for the
rank `n − c(A)`.) Route: build the matroid with Mathlib's `IndepMatroid.ofFinitaryCardAugment`.
The forests contain the empty set and are closed under subsets. For augmentation of finite forests
`I`, `J` with `|I| < |J|`, work on the finite set `W` of vertices they touch: a forest on `W` with
`k` edges has `|W| − k` components (Mathlib's
`SimpleGraph.IsAcyclic.ncard_edgeSet_add_card_connectedComponent`), so `J` has fewer components
than `I` and some edge of `J` joins two components of `I`. Compactness holds because a cycle uses
finitely many edges. For finite `V`, a maximal forest inside `A` has `n − c(A)` edges, by the same
Mathlib lemma.

**Checks.**
- The circuits of the cycle matroid are the edge sets of cycles, its loops are absent and its
  coloops are the bridges.
- `T(1, 1)` of the cycle matroid is the number of maximal spanning forests: `16` for `K₄` and
  `2000` for the Petersen graph, its numbers of spanning trees.
- The graph on two vertices without edges has `c(∅) = 2`, rank `0` and `T = 1`.

*Needs:* Mathlib `SimpleGraph.fromEdgeSet`, `SimpleGraph.IsAcyclic`,
`SimpleGraph.ConnectedComponent`, `SimpleGraph.IsAcyclic.ncard_edgeSet_add_card_connectedComponent`,
`IndepMatroid.ofFinitaryCardAugment`, `Matroid.eRk`.

### 4.2 The chromatic polynomial

Define `chromaticPolynomial G`, Whitney's expansion `P_G(q) = ∑_{A ⊆ E(G)} (−1)^|A| q^c(A)`.

- `eval_chromaticPolynomial`: for every natural number `k`, `P_G(k)` is the number of proper
  colourings `G.Coloring (Fin k)` (Ellis-Monaghan–Merino, Theorem 10; Stanley, Definition 2.6,
  p. 24, takes the count as the definition).
- `chromaticPolynomial_eq_tuttePolynomial`: if `M` is the cycle matroid of `G`, then
  `P_G(q) = (−1)^(n − c(E)) q^c(E) T_M(1 − q, 0)` (Ellis-Monaghan–Merino, Theorem 12; Ardila,
  §7.7.2).

Route: the first is inclusion–exclusion over the edges whose ends receive the same colour, the
colourings constant on the components of `(V, A)` numbering `k^c(A)` (Mathlib's
`Finset.inclusion_exclusion_card_inf_compl`). The second compares terms using 4.1:
`r(E) − r(A) = c(A) − c(E)`.

Consequences, stated as API: `P_G = q^c(E) χ_M` for the cycle matroid `M`, so by 2.2 and the first
Check of 4.1, for any linear order on the edges, `(−1)^i` times the coefficient of `q^(n − i)` in
`P_G` is the number of `i`-edge sets containing no cycle with its largest edge removed (Whitney's
theorem for graphs).

**Checks.**
- The triangle has `P = q(q − 1)(q − 2)`, the four-cycle `P = q(q − 1)(q² − 3q + 3)`, `K₄`
  `P = q(q − 1)(q − 2)(q − 3)`, and two isolated vertices `P = q²`.
- `P_G(0) = 0` for a graph with a vertex, and the graph on no vertex has `P = 1`, in agreement
  with the single empty colouring.
- The Petersen graph has `P(3) = 120`.
- For the four-cycle the sets without a broken circuit number `1, 4, 6, 3`, and
  `P = q⁴ − 4q³ + 6q² − 3q`.
- On all graphs with at most six vertices up to isomorphism and all labelled graphs with at most
  four vertices, `P_G(k)` equals the number of colourings for `0 ≤ k ≤ 4` and the Tutte relation
  holds; on those with at most ten edges the broken circuit expansion holds for a random edge
  order.

*Needs:* 4.1, 1.1, 2.2 (for the consequence); Mathlib `SimpleGraph.edgeFinset`,
`SimpleGraph.Coloring`, `Finset.inclusion_exclusion_card_inf_compl`, `MvPolynomial.aeval`.

### 4.3 The graphic arrangement

For a linear order on `V`, define `graphicArrangement G`, the arrangement in `V → ℝ` of the
hyperplanes `x u = x v` for the edges `uv` with `u < v`, indexed by those pairs (Stanley,
Definition 2.5, p. 24). Prove `charPoly_graphicArrangement`: its characteristic polynomial is
`P_G` (Stanley, Theorem 2.7, p. 25; Ardila, Theorem 6.3.5).

Route: every subfamily is central, since it contains the constant vectors, and the flat of a set
`A` of edges is the space of functions constant on the components of `(V, A)`, of dimension
`c(A)`. So Whitney's formula 3.2 is the definition of `P_G`.

**Checks.**
- For `K₃` the graphic arrangement is the braid arrangement of `ℝ³`, with `χ = q(q − 1)(q − 2)`
  and six regions, one for each ordering of the three coordinates.
- The normals span a space of dimension `n − c(E)`, so the graphic arrangement of a graph with a
  vertex is never essential, and it has no relatively bounded region unless `G` has no edge.
- For all graphs with at most four vertices up to isomorphism the two polynomials agree and the
  regions number `(−1)ⁿ P_G(−1)`.

*Needs:* 3.1, 3.2, 4.2; Mathlib `Pi.single`.

### 4.4 Acyclic orientations

Prove `ncard_isAcyclic_orientation`: the number of acyclic orientations of `G` is
`(−1)ⁿ P_G(−1)` (Stanley, Corollary 2.3, p. 28; Ardila, Corollary 6.3.6; Stanley, 1973). With
4.2 this number is `T_M(2, 0)` for the cycle matroid `M` (Ellis-Monaghan–Merino, Theorem 8, for
connected graphs; Ardila, §7.7.2).

Route (Greene and Zaslavsky, as in Stanley, Proposition 2.5, p. 28): a region of the graphic
arrangement orients each edge toward its end with the larger coordinate; distinct regions give
distinct orientations, the orientations obtained are acyclic, and every acyclic orientation
arises, from a point whose coordinates follow a linear extension of it. Then 4.3 and 3.3.

**Checks.**
- The triangle has `6` acyclic orientations, `P(−1) = −6`; `K₄` has `24 = 4!`.
- The Petersen graph has `T(2, 0) = 16680` acyclic orientations.
- The graph on no vertex has one orientation, which is acyclic, and `(−1)⁰ P(−1) = 1`.
- On all graphs with at most six vertices up to isomorphism, the count of acyclic orientations
  equals `(−1)ⁿ P_G(−1)` and `T(2, 0)`.

*Needs:* 3.3, 4.3; Tau Ceti `TauCeti.DoubledQuiver.Orientation`,
`TauCeti.DoubledQuiver.OrientedQuiver`, `TauCeti.Quiver.IsAcyclic`.

### 4.5 Nowhere-zero flows

Define `IsNowhereZeroFlow G k f` for `f : V → V → ZMod k`: `f` vanishes on nonadjacent pairs, is
skew-symmetric, is nonzero on adjacent pairs, and `∑_v f u v = 0` for every `u`. Choosing an
orientation and keeping the value on the chosen direction of each edge identifies these functions
with the nowhere-zero `ℤ/k`-flows of that orientation, which is why no orientation appears in the
definition.

Prove `card_isNowhereZeroFlow`: for `k ≥ 1` and the cycle matroid `M`, the number of such `f` is
`(−1)^(|E| − n + c(E)) T_M(0, 1 − k)` (Ellis-Monaghan–Merino, Theorem 14; Ardila, §7.7.2; Tutte,
1954).

Route: for a set `A` of edges, the `ℤ/k`-flows supported in `A` (zero allowed) form a group with
`k^(|A| − n + c(A))` elements, a basis of the cycle space given by the fundamental cycles of a
maximal forest of `(V, A)`. Inclusion–exclusion over the edges where the flow vanishes gives
`∑_{A ⊆ E} (−1)^(|E| − |A|) k^(|A| − r(A))`, which is the stated value by 4.1 and the definition
of `T_M`.

**Checks.**
- The four-cycle has `T = x³ + x² + x + y`, one nowhere-zero `ℤ/2`-flow and two `ℤ/3`-flows, and
  the formula gives `−T(0, −1) = 1` and `−T(0, −2) = 2`.
- `K₄` has no nowhere-zero `ℤ/2`- or `ℤ/3`-flow and six `ℤ/4`-flows. The Petersen graph has no
  nowhere-zero `ℤ/4`-flow and `240` `ℤ/5`-flows.
- The hypothesis `k ≥ 1` is needed: for `k = 0`, `ZMod 0 = ℤ`, the triangle has infinitely many
  nowhere-zero flows, so the cardinality is `0`, while the formula gives `−T(0, 1) = −1`.
- A graph with a bridge has no nowhere-zero flow, and `T` is divisible by `x`.
- On all graphs with at most six vertices up to isomorphism, the counts for `1 ≤ k ≤ 3`, and for
  `k = 4` on the graphs with at most nine edges, agree with the formula.

*Needs:* 4.1, 1.1; Mathlib `ZMod`, `Nat.card`, `Finset.inclusion_exclusion_card_inf_compl`.

### Examples

The triangle, the four-cycle, `K₄`, the Petersen graph, a graph with a bridge and graphs with
isolated vertices, with their chromatic and flow polynomials, acyclic orientations and graphic
arrangements.

### Dependencies

Layers 1, 2 (for the consequence in 4.2) and 3; Mathlib `SimpleGraph.fromEdgeSet`,
`SimpleGraph.IsAcyclic`, `SimpleGraph.ConnectedComponent`, `SimpleGraph.edgeFinset`,
`SimpleGraph.Coloring`, `SimpleGraph.IsAcyclic.ncard_edgeSet_add_card_connectedComponent`,
`IndepMatroid.ofFinitaryCardAugment`, `Finset.inclusion_exclusion_card_inf_compl`,
`MvPolynomial.aeval`, `Pi.single`, `ZMod`, `Nat.card`; Tau Ceti
`TauCeti.DoubledQuiver.Orientation`, `TauCeti.DoubledQuiver.OrientedQuiver`,
`TauCeti.Quiver.IsAcyclic`.

## Scope and ownership

This roadmap owns the targets stated above: the Tutte polynomial of a finite matroid with
deletion–contraction, duality, universality and its counts of bases and independent sets; the
characteristic polynomial of a matroid and the broken circuit theorem; real hyperplane
arrangements, their intersection poset and characteristic polynomial, Whitney's formula and
Zaslavsky's theorem; the cycle matroid of a simple graph and its rank; the chromatic
polynomial with its count of colourings and its relation to the Tutte polynomial; the graphic
arrangement; Stanley's theorem on acyclic orientations; and the flow polynomial.

Already in the libraries and therefore not targets: Mathlib's matroids with deletion,
contraction, duality, loops, coloops, circuits, bases and the `ℕ∞`-valued rank, and the
finiteness of minors and duals of finite matroids; Mathlib's incidence algebra with the Möbius
function of a locally finite order and Möbius inversion; Mathlib's colourings and chromatic number
of simple graphs (Mathlib has no chromatic polynomial); Mathlib's multigraphs `Graph α β`, which
this roadmap does not use, since deletion and contraction are done in the cycle matroid; Tau Ceti's
orientations of simple graphs and acyclic quivers.

Left to other roadmaps:

- GeometricTopology 4.4.5 owns the weighted matrix-tree identity. Here spanning trees appear only
  as bases of the cycle matroid, counted by `T(1, 1)`; no determinant is involved.
- GraphConnectivityAndFlows owns circulations with values in ordered groups (its 8.1–8.5) and
  acyclic orientations obtained from `st`-numberings (its 7.4). The nowhere-zero flows of 4.5 take
  values in `ℤ/k`, which is not ordered, and 4.4 counts acyclic orientations rather than
  constructing one; nothing of that roadmap is restated.
- The open roadmaps SpanningTreesAndShortestPaths, MatroidOptimization and GraphColouring (not on
  main) border this one; this roadmap does not depend on any of them. SpanningTreesAndShortestPaths
  states exchange properties of spanning forests (its 1.2, 1.3) and Cayley's formula (its 5.2), and
  lists the deletion–contraction recursion for spanning trees outside its scope; 4.1 here proves the
  matroid axioms for forests of a fixed graph, a different statement. Its 1.1 (a spanning forest has
  `|V| − c` edges), applied to the graph with edge set `A`, gives the rank formula of 4.1; both rest
  on the same Mathlib lemma, and 4.1 does not depend on it. MatroidOptimization (its
  scope section) leaves the matroids of graphs aside and states no polynomial invariant of a
  matroid; it uses Mathlib's matroids, as this roadmap does.
  GraphColouring states the theorem of Gallai, Roy and Vitaver on orientations and directed paths
  (its 3.1, 3.2), with the same Tau Ceti orientations as 4.4, and no counting of colourings or
  orientations.
- The open roadmap PseudolineArrangementsAndOrientedMatroids (not on main) treats oriented
  matroids and pseudoline arrangements and leaves real hyperplane arrangements and their
  characteristic polynomials outside its scope; this roadmap does not depend on it.

Outside the scope: the Tutte polynomial of multigraphs as a separate object, activities and the
spanning tree expansion, the bad colouring and coboundary polynomials, the Potts model, the
multivariate and arithmetic Tutte polynomials, complexity of evaluation, totally cyclic and score
vector evaluations, the beta invariant, complex arrangements (the Orlik–Solomon algebra and the
Poincaré polynomial of the complement), arrangements over finite fields, supersolvable and free
arrangements, the face count of an arrangement, the matroid of the normals of a central
arrangement, Read's conjectures on unimodality and log-concavity, and the four colour theorem.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Combinatorics/Matroid/Basic.lean`: `Matroid` (ground set `E`, independent sets
  `Matroid.Indep`, bases `Matroid.IsBase`); `Matroid.Finite` (the ground set is finite) and
  `Matroid.ground_finite`; `Matroid.finite_of_finite` (an instance: every matroid on a finite type
  is finite).
- `Mathlib/Combinatorics/Matroid/Rank/ENat.lean`: `Matroid.eRk` (the `ℕ∞`-valued rank, the rank of
  the restriction); `Matroid.restrict_eRk_eq` (for `X ⊆ R`, the rank in `M ↾ R` equals the rank in
  `M`); `Matroid.eRk_dual_add_eRank` (for `X ⊆ E`, `r✶(X) + r(E) = r(E ∖ X) + |X|`);
  `Matroid.indep_iff_eRk_eq_encard` (for finite rank, `I` is independent exactly when its rank is
  its cardinality); `Matroid.Indep.isBase_of_eRk_ge` (a finite independent set of full rank is a
  base).
- `Mathlib/Combinatorics/Matroid/Minor/Delete.lean`: `Matroid.delete`, notation `M ＼ D`, defined as
  the restriction to `E ∖ D`; `Matroid.delete_finite`.
  `Mathlib/Combinatorics/Matroid/Minor/Contract.lean`: `Matroid.contract`, notation `M ／ C`,
  defined as `(M✶ ＼ C)✶`; `Matroid.contract_finite`. Both notations are scoped in `Matroid`.
- `Mathlib/Combinatorics/Matroid/Dual.lean`: `Matroid.dual`, notation `M✶`;
  `Matroid.dual_finite`. `Mathlib/Combinatorics/Matroid/Loop.lean`: `Matroid.IsLoop` (an element
  of the closure of `∅`); `Matroid.IsColoop` (a loop of the dual);
  `Matroid.isColoop_iff_forall_mem_isBase` (a coloop lies in every base).
  `Mathlib/Combinatorics/Matroid/Circuit.lean`: `Matroid.IsCircuit` (a minimal dependent set).
  `Mathlib/Combinatorics/Matroid/IndepAxioms.lean`: `IndepMatroid.ofFinitaryCardAugment` (a
  matroid from a predicate satisfying the empty-set and subset axioms, augmentation for finite
  sets of different sizes, and compactness: a set all of whose finite subsets satisfy it does).
- `Mathlib/Algebra/MvPolynomial/Eval.lean`: `MvPolynomial.eval`, `MvPolynomial.aeval`.
  `Mathlib/Algebra/MvPolynomial/Rename.lean`: `MvPolynomial.rename`. `MvPolynomial.X`,
  `Polynomial.X`, `Polynomial.C` and `Polynomial.eval` (`Mathlib/Algebra/Polynomial/Eval/Defs.lean`).
- `Mathlib/Combinatorics/Enumerative/IncidenceAlgebra.lean`: `IncidenceAlgebra.mu` (for a
  preorder with `LocallyFiniteOrder` and decidable equality, the inverse of the zeta function),
  `IncidenceAlgebra.mu_apply` (`μ(a, a) = 1` and `μ(a, b) = −∑_{a ≤ x < b} μ(a, x)` for `a ≠ b`),
  `IncidenceAlgebra.sum_Icc_mu_right`. `Mathlib/Order/Interval/Finset/Defs.lean`:
  `Fintype.toLocallyFiniteOrder`. `Mathlib/Data/Fintype/EquivFin.lean`: `Fintype.ofFinite`.
  `Mathlib/Data/Set/Finite/Range.lean`: `Set.finite_range` (the range of a function on a finite
  type is a finite set).
- `Mathlib/Data/Nat/Choose/Sum.lean`: `Finset.sum_powerset_neg_one_pow_card`
  (`∑_{t ⊆ x} (−1)^|t|` is `1` if `x = ∅` and `0` otherwise).
  `Mathlib/Combinatorics/Enumerative/InclusionExclusion.lean`:
  `Finset.inclusion_exclusion_card_inf_compl`. `Finset.max'` (the largest element of a nonempty
  finset).
- `Mathlib/Data/Matrix/Mul.lean`: `dotProduct`, notation `⬝ᵥ`.
  `Mathlib/LinearAlgebra/AffineSpace/AffineSubspace/Defs.lean`: `vectorSpan`.
  `Mathlib/LinearAlgebra/Dimension/Finrank.lean`: `Module.finrank`.
  `Mathlib/LinearAlgebra/Span/Defs.lean`: `Submodule.span`.
  `Mathlib/Topology/Connected/Basic.lean`: `connectedComponentIn` (the connected component of a
  point within a set, empty for a point outside it). `Mathlib/Topology/Bornology/Basic.lean`:
  `Bornology.IsBounded`. `Pi.single`, `OrderDual`, `Set.ncard`, `Nat.card`, `ZMod`.
- `Mathlib/Combinatorics/SimpleGraph/Basic.lean`: `SimpleGraph.fromEdgeSet` (the graph whose edges
  are the non-diagonal members of a set). `Mathlib/Combinatorics/SimpleGraph/Acyclic.lean`:
  `SimpleGraph.IsAcyclic` (no walk is a cycle) and
  `SimpleGraph.IsAcyclic.ncard_edgeSet_add_card_connectedComponent` (on a finite vertex type, an
  acyclic graph has as many edges plus components as vertices).
  `Mathlib/Combinatorics/SimpleGraph/Connectivity/Connected.lean`: `SimpleGraph.ConnectedComponent`
  (the quotient by reachability). `Mathlib/Combinatorics/SimpleGraph/Finite.lean`:
  `SimpleGraph.edgeFinset`. `Mathlib/Combinatorics/SimpleGraph/Coloring/Vertex.lean`:
  `SimpleGraph.Coloring` (homomorphisms to the complete graph on the colours).

### From Tau Ceti

- `TauCeti/RepresentationTheory/Quiver/Zigzag/Orientation.lean`:
  `TauCeti.DoubledQuiver.Orientation G` (a set of darts of `G` containing a dart exactly when it
  does not contain its reverse) and `TauCeti.DoubledQuiver.OrientedQuiver G o` (the quiver on the
  vertices with one arrow for each chosen dart).
- `TauCeti/RepresentationTheory/Quiver/Acyclic/Basic.lean`: `TauCeti.Quiver.IsAcyclic` (every
  closed path is trivial).

## References

- Federico Ardila, *Algebraic and geometric methods in enumerative combinatorics*,
  arXiv:1409.2562v2 (2015): §6.2, Theorem 6.2.1; §6.3, Theorems 6.3.1 and 6.3.5 and Corollary
  6.3.6; §7.3, example 2; §7.6, equation (25), Theorem 7.6.1 with footnote 15 and Proposition
  7.6.2; §7.7.1 and §7.7.2.
- Richard P. Stanley, *An introduction to hyperplane arrangements*, lecture notes, version of
  26 February 2006, linked from the author's page (`math.mit.edu/~rstan/arrangements/arr.html`),
  with the errata of 18 October 2020 on the same page; published in *Geometric Combinatorics*,
  IAS/Park City Mathematics Series 13, AMS, 2007, pp. 389–496. Cited: pp. 2–3, Definitions 1.1 and
  1.3, Lemmas 2.1 and 2.2, Theorems 2.4, 2.5 and 2.7, Definitions 2.5 and 2.6, Proposition 2.5,
  Corollary 2.3, Definition 3.8, equation (22), Definition 4.10 and Theorem 4.12, with the page
  numbers of the notes.
- Joanna A. Ellis-Monaghan and Criel Merino, *Graph polynomials and their applications I: the
  Tutte polynomial*, arXiv:0803.3079v2 (2008): Definitions 1–3, Proposition 2, Theorems 1–3, 8,
  10, 12 and 14.
- The papers of Whitney (1932), Tutte (1954), Brylawski (1972), Stanley (1973), Zaslavsky (1975)
  and Greene and Zaslavsky (1983) are named as the sources above attribute the results; they were
  not consulted.

# Roadmap: association schemes

**Summary.** A symmetric association scheme with `d` classes on a finite set `X` is a partition of
`X × X` into the diagonal and `d` further nonempty symmetric relations such that the number of
points `z` with `(x, z)` in class `i` and `(z, y)` in class `j` depends only on the class of
`(x, y)`. The real span of the `0/1` matrices `A_0 = I, A_1, …, A_d` of the classes, the
Bose–Mesner algebra, is commutative and has a second basis of orthogonal idempotents
`E_0 = J/|X|, E_1, …, E_d`. All sets are finite and all matrices real.

The headline theorems are these.

- *Eigenmatrices and Krein conditions.* Writing `A_j = ∑_i P_ij E_i` and
  `E_j = |X|⁻¹ ∑_i Q_ij A_i`, one has `PQ = QP = |X| I` and `∑_i m_i P_ij P_ik = |X| v_j δ_jk`,
  where `m_i = tr E_i` and `v_j` is the valency of class `j`. The entrywise product `E_i ∘ E_j`
  is `|X|⁻¹ ∑_k q^k_ij E_k` with every Krein parameter `q^k_ij ≥ 0`.
- *Delsarte's bounds.* For every subset `Y` with inner distribution `a`, every entry of `aQ` is
  nonnegative. If `R` is a set of classes, every two distinct points of `C` lie in a class of `R`
  and no two distinct points of `D` do, then `|C| · |D| ≤ |X|`.
- *The Johnson scheme and Erdős–Ko–Rado.* For `2k ≤ n`, the `k`-subsets of an `n`-set, classed by
  `k − |A ∩ B|`, form a scheme with `k` classes; the eigenvalue of class `i` on the `j`-th
  idempotent is the Eberlein value `∑_h (−1)^h C(j, h) C(k − j, i − h) C(n − k − j, i − h)`, of
  multiplicity `C(n, j) − C(n, j − 1)` (`1` for `j = 0`). For `2k < n`, every intersecting family
  of `C(n − 1, k − 1)` subsets of size `k` consists of all `k`-subsets through one point.
- *Distance-regular graphs.* A finite graph is distance-regular exactly when it is connected and
  its distance classes form a scheme; a scheme is metric for its class `1` exactly when every
  `A_k` is a polynomial of degree `k` in `A_1`.

The roadmap rests on Mathlib's matrices, orthogonal idempotents, Schur product theorem and graph
distance, and leaves the Erdős–Ko–Rado bound to Mathlib. The uniqueness clause is proved through
the equality case of Hoffman's ratio bound in the roadmap SpectralGraphBounds, applied to the
Kneser graphs of the roadmap TopologicalCombinatorics. Schemes with two classes are the strongly
regular graphs of the roadmap StronglyRegularAndMooreGraphs, and the roadmap BoundsOnCodes proves
Delsarte's inequalities for codes in Hamming space by characters.

Layer 1 below defines schemes and their primitive idempotents. Layer 2 relates `P`, `Q` and the
intersection matrices. Layer 3 proves the Krein conditions, Layer 4 Delsarte's inequalities and
clique bounds, Layer 5 the spectrum of the Johnson scheme and the Erdős–Ko–Rado uniqueness, and
Layer 6 the characterizations of distance-regular graphs. Each layer uses only Layers 1 and 2 and
its own earlier sections.

## Conventions

- **Schemes.** A scheme with `d` classes on a type `X` with `[Fintype X] [DecidableEq X]` is a
  class function `rel : X → X → Fin (d + 1)` satisfying `IsAssocScheme`: `rel x y = 0` exactly
  when `x = y`; `rel x y = rel y x`; every class `i` has a pair; and the number of `z` with
  `rel x z = i` and `rel z y = j` depends only on `rel x y`. This is the definition of Bose and
  Shimamoto, which Delsarte calls a symmetric association scheme (Brouwer–Haemers, §11.1, p. 161,
  axioms (i)–(iv)); the commutative but nonsymmetric schemes of Delsarte's wider definition are
  not treated. Every class is required to be nonempty, so `X` is nonempty, and a scheme with `0`
  classes is a one-point set.
- **Matrices.** `adjMat rel i` is the real `0/1` matrix `A_i` of class `i`, `J` is the all-ones
  matrix, `∘` (Lean `⊙`) is the entrywise product, and `bmAlgebra rel` is the real span of the
  `A_i`. Vectors are functions `X → ℝ`; the characteristic vector of `Y ⊆ X` is
  `fun x => if x ∈ Y then 1 else 0`.
- **Averaged parameters.** The valency `v_i` (`valency rel i`) is the number of ordered pairs in
  class `i` divided by `|X|`, and the intersection number `p^k_ij` (`intersectionNumber rel i j k`)
  is the number of triples `(x, y, z)` with `rel x y = k`, `rel x z = i`, `rel z y = j` divided by
  the number of pairs in class `k`. On a scheme these averages are the common values of the
  literature: `v_i` is the number of `y` with `rel x y = i` for each `x`, and `p^k_ij` is the
  number of such `z` for each pair in class `k`.
- **Primitive idempotents and the normalisation of `P` and `Q`.** A family
  `E : Fin (d + 1) → Matrix X X ℝ` satisfies `IsPrimitiveIdempotents rel E` when it is a complete
  family of orthogonal idempotents (Mathlib's `CompleteOrthogonalIdempotents`), every `E i` is
  nonzero and lies in `bmAlgebra rel`, and `E 0 = |X|⁻¹ J`. The eigenmatrix `P` (`eigenmatrix`)
  has rows indexed by idempotents and columns by classes, `P i j = tr (A_j E_i) / tr E_i`, so
  that `A_j E_i = P_ij E_i`; the dual eigenmatrix `Q` (`dualEigenmatrix`) has rows indexed by
  classes, `Q i j = (∑_(x, y) (A_i)_(xy) (E_j)_(xy)) / v_i`, which is `|X|` times the value of
  `E_j` on the pairs of class `i`, so that `E_j = |X|⁻¹ ∑_i Q_ij A_i`. This is the convention of
  Brouwer–Haemers (§11.2, p. 163) and of Delsarte; Godsil's notes write `p_j(i)` and `q_j(i)` for
  the same entries (§2.1, pp. 13–14). The multiplicity of `E_i` is `m_i = tr E_i`, its rank.
  Every theorem holds for every family with these properties; the family is unique up to the
  order of `E_1, …, E_d` (API of 1.2), and a reordering permutes the rows of `P` and the columns
  of `Q` accordingly.
- **Krein parameters** are `q^k_ij = (∑_l v_l Q_li Q_lj Q_lk) / (|X| m_k)` (`kreinParam`), the
  normalisation of Delsarte and of Brouwer–Haemers (§11.4, p. 166), in which
  `E_i ∘ E_j = |X|⁻¹ ∑_k q^k_ij E_k`; Seidel's parameters differ by the factor `|X|`.
- **Cliques and cocliques for a set of classes.** For `R : Finset (Fin (d + 1))`, an `R`-clique is
  a set any two distinct points of which are in a class of `R`, and an `R`-coclique a set no two
  distinct points of which are (Godsil, §3.3, p. 25). Only distinct points are compared, so
  whether `0 ∈ R` does not matter, and the empty set and singletons are both.
- **Junk values.** The inner distribution of the empty set is `0` (division by `0`), and the
  statements of 4.1 hold for it as written. `johnsonRel n k` is defined for all `n`, `k`; it is a
  scheme with `k` classes only for `2k ≤ n`. In `eberlein`, the subtractions `k − j` and
  `n − k − j` are natural-number subtractions, used only for `j ≤ k` and `2k ≤ n`, where they are
  the true differences. In 5.2, `k − 1` is natural subtraction, so for `k = 0` the hypothesis asks
  for `C(n − 1, 0) = 1` members, which no intersecting family of `0`-sets has, and the theorem holds
  vacuously (with the classical `C(n − 1, −1) = 0` it would hold too, the empty family being the
  empty star). `distRel G` caps the graph distance at `G.diam`, which changes nothing on a
  connected finite graph; Mathlib's `SimpleGraph.dist` is `0` between vertices in different
  components and `SimpleGraph.diam` is `0` for a disconnected graph. In 6.1 the class index `1`
  is `(1 : Fin (d + 1))`, which is `0` when `d = 0`; both sides of 6.1 then hold.

## Layer 1: schemes and the Bose–Mesner algebra

### 1.1 Schemes, adjacency matrices and the Bose–Mesner algebra

Define `IsAssocScheme`, `adjMat`, `bmAlgebra` and `valency` as in the Conventions
(Brouwer–Haemers, §11.1, p. 161, and §11.2, p. 162; Godsil, §1.1, pp. 1–2, and §1.3, p. 6).

API, stated in prose and proved here from the axioms:

- `A_0 = I`, `∑_i A_i = J`, every `A_i` is symmetric and nonzero, and `A_i ∘ A_j = δ_ij A_i`; the
  `A_i` are linearly independent, so `bmAlgebra rel` has dimension `d + 1`.
- `A_i A_j = ∑_k p^k_ij A_k`, because the `(x, y)` entry of `A_i A_j` counts the `z` of the
  axiom; hence `bmAlgebra rel` is a subalgebra containing `I` and `J`, closed under `∘` and
  under transposition, and commutative, since `A_i A_j` is symmetric and so equals
  `(A_i A_j)ᵀ = A_j A_i` (Brouwer–Haemers, §11.2, p. 162).
- The intersection numbers satisfy `p^0_ij = δ_ij v_j`, `p^k_0j = δ_jk`, `p^k_ij = p^k_ji` and
  `p^k_ij v_k = p^j_ik v_j` (Brouwer–Haemers, Theorem 11.1.1 (i)–(iii), p. 161); every row of
  `A_i` has `v_i` ones.

**Checks.**
- The 4-cycle with graph distance is the Hamming scheme `H(2, 2)` with `2` classes, valencies
  `(1, 2, 1)`.
- The path `a − b − c` with graph distance is not a scheme: with `i = j = 1`, the class-`0` pair
  `(a, a)` has one `z` (namely `b`) and the class-`0` pair `(b, b)` has two (`a` and `c`), so
  `card_eq` fails.
- Symmetry is part of the definition: on `ℤ/3` the relation `rel x y = y − x` (a class for each
  difference) satisfies every axiom except `rel_comm`; its Bose–Mesner algebra is commutative but
  contains the nonsymmetric cyclic shift.
- There is no scheme on the empty type (class `0` has no pair), and on a one-point type the only
  scheme has `d = 0`.

*Needs:* Mathlib `Matrix.of`, `Submodule.span`, `Finset.card`.

### 1.2 Primitive idempotents

Define `IsPrimitiveIdempotents` as in the Conventions. Prove `exists_isPrimitiveIdempotents`: the
Bose–Mesner algebra of a scheme with `d` classes has a family of `d + 1` primitive idempotents
with `E_0 = |X|⁻¹ J` (Godsil, Theorem 1.4.1, p. 8, and Theorem 1.5.1, p. 10, with the choice of
`E_0` on p. 11; Brouwer–Haemers, §11.2, pp. 162–163).

Route: `bmAlgebra rel` is a commutative algebra of real symmetric matrices containing `I`, so it
has no nonzero nilpotent element (if `N² = 0` with `N` symmetric then `tr(NᵀN) = 0`); by Godsil's
Theorem 1.4.1 (over `ℂ`, or directly from the simultaneous spectral decomposition of the
commuting symmetric matrices `A_i`, Mathlib `Matrix.IsHermitian.spectral_theorem` applied
successively) it has a basis of pairwise orthogonal idempotents, of size `d + 1` by 1.1. `J/|X|`
is an idempotent of rank one in the algebra, hence minimal, hence a member of the basis.

API, stated in prose:

- Each `E_i` is symmetric and positive semidefinite, its column space is a common eigenspace of
  all `A_j`, the column spaces of the `E_i` are pairwise orthogonal and together span `ℝ^X`, and
  `m_i = tr E_i` is the rank of `E_i`, a positive integer, with `m_0 = 1` and `∑_i m_i = |X|`.
- Uniqueness: two families with these properties differ by a permutation of `{1, …, d}`, because
  each member of either family is the sum of the members of the other that it dominates
  (Godsil, §1.4, p. 8, proof of Theorem 1.4.1).

**Checks.**
- On the 4-cycle `0 − 1 − 2 − 3 − 0`, `E_1` and `E_2` are the projections onto the span of
  `(1, 0, −1, 0)` and `(0, 1, 0, −1)` and onto the span of `(1, −1, 1, −1)`, so `m = (1, 2, 1)`.
- Membership in the algebra is needed: the projection onto the span of `(1, 0, −1, 0)` alone,
  together with `J/4` and the projection onto the orthogonal complement of both, is a complete
  family of three nonzero orthogonal idempotents with the right `E_0`, but its first matrix has
  diagonal `(1/2, 0, 1/2, 0)`, not constant on class `0`, so it is not in the Bose–Mesner algebra.
- `E_0 = I/|X|` is not an idempotent once `|X| ≥ 2`, which is why the normalisation `J/|X|` is
  part of the definition.

*Needs:* 1.1; Mathlib `CompleteOrthogonalIdempotents`, `Matrix.IsHermitian.spectral_theorem`,
`Matrix.trace`.

### Examples

The Hamming schemes `H(n, q)` (words of length `n`, classed by Hamming distance), the Johnson
schemes of Layer 5, the cyclic schemes on `ℤ/m` classed by `min(x − y, y − x) mod m`, and the
schemes with two classes given by a strongly regular graph and its complement.

### Dependencies

Mathlib only.

## Layer 2: the eigenmatrices

### 2.1 The two bases

Define `eigenmatrix` and `dualEigenmatrix` as in the Conventions. Prove
`adjMat_eq_sum_and_eq_sum_adjMat`: for a scheme and a family of primitive idempotents,
`A_j = ∑_i P_ij E_i` and `E_j = |X|⁻¹ ∑_i Q_ij A_i` for every `j` (Godsil, (2.1.1) and (2.1.2),
p. 13; Brouwer–Haemers, §11.2, p. 163).

Route: both families are bases of the `(d + 1)`-dimensional algebra (1.1, 1.2). If
`A_j = ∑_i c_i E_i`, multiplying by `E_i` and taking traces gives `c_i = tr(A_j E_i)/m_i`. If
`E_j = ∑_i b_i A_i`, taking the entrywise product with `A_i` and summing all entries gives
`∑_(x, y) (A_i)_(xy) (E_j)_(xy) = b_i |X| v_i`, so `b_i = Q_ij / |X|`.

API, stated in prose: `P_i0 = 1`, `P_0j = v_j`, `Q_0j = m_j`, `Q_i0 = 1`, and
`m_i P_ij = v_j Q_ji` (Brouwer–Haemers, Theorem 11.2.1 (i) and the first relation of (iii),
p. 163; Godsil, (3.1.1), p. 24). The eigenvalues of `A_j` are the `P_ij`, the eigenvalue `P_ij`
occurring with multiplicity `∑ {m_l : P_lj = P_ij}`.

**Checks.**
- `H(2, 2)`: `P = Q`, with rows `(1, 2, 1)`, `(1, 0, −1)`, `(1, −2, 1)`.
- The Johnson scheme `J(5, 2)` (class `2` is the Petersen graph), with the idempotents ordered as
  in 5.1: `P` has rows `(1, 6, 3)`, `(1, 1, −2)`, `(1, −2, 1)`, the multiplicities are
  `(1, 4, 5)`, the valencies `(1, 6, 3)`, and `Q` has rows `(1, 4, 5)`, `(1, 2/3, −5/3)`,
  `(1, −8/3, 5/3)`.
- Normalisation of `Q`: without the factor `|X|⁻¹` in the second expansion, the matrix `Q′`
  with `E_j = ∑_i Q′_ij A_i` is `Q/|X|`, and on `H(2, 2)` its first row is `(1/4, 1/2, 1/4)`, not
  the multiplicities `(1, 2, 1)`.

*Needs:* 1.1, 1.2; Mathlib `Matrix.trace`, `Matrix.trace_mul_comm`.

### 2.2 `PQ = QP = |X| I` and the orthogonality relations

Prove `eigenmatrix_mul_dualEigenmatrix`: `P Q = Q P = |X| I`, and
`∑_i m_i P_ij P_ik = |X| v_j` if `j = k` and `0` otherwise (Godsil, §2.1, p. 14, and §3.1,
p. 24; Brouwer–Haemers, Theorem 11.2.1 (iii), p. 163).

Route: substituting one expansion of 2.1 into the other and using the linear independence of each
basis gives `PQ = |X| I`, hence `QP = |X| I`. Then `m_i P_ij = v_j Q_ji` (2.1) turns
`(QP)_jk = |X| δ_jk` into the weighted relation.

**Checks.**
- `J(5, 2)`: `∑_i m_i P_i1 P_i2 = 1·6·3 + 4·1·(−2) + 5·(−2)·1 = 0`, while the unweighted sum
  `18 − 2 − 2 = 14` is not `0`, so the weights `m_i` are needed; and
  `∑_i m_i P_i2² = 9 + 16 + 5 = 30 = |X| v_2`.
- `J(7, 3)` (Brouwer–Haemers, §11.3, example on p. 164): `P` has rows `(1, 12, 18, 4)`,
  `(1, 5, −3, −3)`, `(1, 0, −3, 2)`, `(1, −3, 3, −1)` and `Q` has rows `(1, 6, 14, 14)`,
  `(1, 5/2, 0, −7/2)`, `(1, −1, −7/3, 7/3)`, `(1, −9/2, 7, −7/2)`; their product is `35 I`.

*Needs:* 2.1.

### 2.3 Intersection matrices

Define `intersectionNumber` and `intersectionMatrix` as in the Conventions, the latter with
entries `(L_i)_kj = p^k_ij`. Prove `charpoly_intersectionMatrix`: the characteristic polynomial of
`L_j` is `∏_i (t − P_ij)` (Brouwer–Haemers, Theorem 11.2.1 (ii) and Theorem 11.2.2 with its
proof, pp. 163–164).

Route: applying `A_j A_k = ∑_l p^l_jk A_l` (1.1) to `E_i` gives
`P_ij P_ik = ∑_l p^l_jk P_il`, that is `P L_j = diag(P_0j, …, P_dj) P`; `P` is invertible by 2.2,
so `L_j` is similar to that diagonal matrix.

**Checks.**
- `J(5, 2)`, class `2` (the Petersen graph): `L_2` has rows `(0, 0, 3)`, `(0, 2, 1)`, `(1, 2, 0)`,
  with trace `2 = 3 − 2 + 1`, and its characteristic polynomial is `(t − 3)(t + 2)(t − 1)`.
- The cube `H(3, 2)`, class `1`: `L_1` is the tridiagonal matrix with rows `(0, 3, 0, 0)`,
  `(1, 0, 2, 0)`, `(0, 2, 0, 1)`, `(0, 0, 3, 0)`, with eigenvalues `3, 1, −1, −3`.

*Needs:* 1.1, 2.2; Mathlib `Matrix.charpoly`, `Matrix.charpoly_units_conj`.

### Examples

`H(2, 2)`, `H(3, 2)` and `H(4, 2)`, whose `P = Q` is the table of binary Krawtchouk values
(Brouwer–Haemers, §11.6, example on p. 170): `P_ij` of `H(n, 2)` is Tau Ceti's
`TauCeti.krawtchouk 2 n j i` (`TauCeti/InformationTheory/Coding/Krawtchouk.lean`); for `H(4, 2)`,
row `1` is `(1, 2, 0, −2, −1)`. `J(5, 2)` and `J(7, 3)`; the scheme of the Petersen graph.

### Dependencies

2.1 uses 1.1 and 1.2; 2.2 uses 2.1; 2.3 uses 1.1 and 2.2.

## Layer 3: the Krein parameters

### 3.1 The Krein conditions

Define `kreinParam` as in the Conventions. Prove `hadamard_eq_sum_kreinParam`: for a scheme and
a family of primitive idempotents, `E_i ∘ E_j = |X|⁻¹ ∑_k q^k_ij E_k`, and `q^k_ij ≥ 0` for all
`i`, `j`, `k` (Brouwer–Haemers, the definition and Theorem 11.4.1 (vi), p. 166, and Theorem
11.4.2 with its proof, p. 167; Godsil, (2.4.1), p. 17, the formula on p. 18 and Theorem 2.4.2,
p. 19; the conditions are due to Scott, as Brouwer–Haemers say).

Route: the algebra is closed under `∘` (1.1), so `E_i ∘ E_j = |X|⁻¹ ∑_k c_k E_k`. Multiplying by
`E_k` and taking traces, `c_k m_k = |X| · ∑_(x, y) (E_i)_(xy) (E_j)_(xy) (E_k)_(xy)`, and the
second expansion of 2.1 turns the triple sum into `|X|⁻² ∑_l v_l Q_li Q_lj Q_lk`, so `c_k` is
`q^k_ij`. For the sign: `E_i` and `E_j` are positive semidefinite, so `E_i ∘ E_j` is (Mathlib
`Matrix.PosSemidef.hadamard`, the Schur product theorem), and `q^k_ij / |X|` is its eigenvalue on
the nonzero column space of `E_k`.

API, stated in prose: `q^k_0j = δ_jk`, `q^0_ij = δ_ij m_j`, `q^k_ij = q^k_ji` and
`∑_i q^k_ij = m_j` (Brouwer–Haemers, Theorem 11.4.1 (i), (ii), p. 166).

**Checks.**
- `J(5, 2)` with the idempotents of 2.1: `(q^0_11, q^1_11, q^2_11) = (4, 2/9, 20/9)` and
  `(q^0_22, q^1_22, q^2_22) = (5, 20/9, 20/9)`.
- `H(3, 2)`: `(q^0_11, q^1_11, q^2_11, q^3_11) = (3, 0, 2, 0)`, so Krein parameters vanish.
- Feasibility: for the parameters `(v, k, λ, μ) = (28, 9, 0, 4)` of a hypothetical strongly
  regular graph, the eigenvalues are `9, 1, −5` with multiplicities `1, 21, 6`; the formula for
  `q^2_22` built from the resulting `P` and `Q` gives `−4/9`, so no scheme, and no strongly
  regular graph, has these parameters. For `(16, 5, 0, 2)` (the Clebsch graph) the same
  parameter is `0`.

*Needs:* 1.1, 1.2, 2.1; Mathlib `Matrix.PosSemidef.hadamard`, `Matrix.PosSemidef`,
`Matrix.hadamard`.

### Examples

`J(5, 2)`, `H(3, 2)`, and the parameter sets `(28, 9, 0, 4)` and `(16, 5, 0, 2)`.

### Dependencies

3.1 uses 1.1, 1.2 and 2.1.

## Layer 4: the linear-programming method

### 4.1 Delsarte's inequalities

Define `innerDistribution` as in the Conventions. Prove
`sum_innerDistribution_mul_dualEigenmatrix_nonneg`: for every subset `Y` and every `j`,
`(aQ)_j = ∑_i a_i Q_ij ≥ 0`, with equality exactly when `E_j` sends the characteristic vector of
`Y` to `0` (Brouwer–Haemers, Theorem 11.3.1, p. 164, and the first statement of Theorem 11.3.2
with its proof, p. 165).

Route: for nonempty `Y` with characteristic vector `χ`, `|Y| (aQ)_j = ∑_i Q_ij χᵀ A_i χ =
|X| χᵀ E_j χ = |X| ‖E_j χ‖²` by 2.1, since `E_j` is a symmetric idempotent. For empty `Y` both
sides of the equivalence hold.

**Checks.**
- The Fano plane as seven triples of a 7-set, any two meeting in one point, has inner distribution
  `(1, 0, 6, 0)` in `J(7, 3)`, and `aQ = (7, 0, 0, 28)` with the `Q` of 2.2; the zeros say that
  `E_1` and `E_2` kill its characteristic vector (Brouwer–Haemers, §11.3, example on p. 164).
  The 15 triples through a point have `a = (1, 8, 6, 0)` and `aQ = (15, 20, 0, 0)`.
- The code `{00, 01}` in `H(2, 2)`: `a = (1, 1, 0)` and `aQ = (2, 2, 0)`; the zero is
  `E_2 χ = 0`, since the eigenvector `(1, −1, −1, 1)` of `E_2` (coordinates `00, 01, 10, 11`) is
  orthogonal to `χ = (1, 1, 0, 0)`.
- The empty set: `a = 0`, `aQ = 0`, and `E_j χ = 0`, so both clauses hold.

*Needs:* 2.1; Mathlib `Matrix.dotProduct_mulVec`, `Matrix.mulVec`.

### 4.2 The clique–coclique bound

Prove `card_mul_card_le`: for a scheme, a set `R` of classes, an `R`-clique `C` and an
`R`-coclique `D`, `|C| · |D| ≤ |X|` (Godsil, Theorems 3.3.1 and 3.3.2 and inequality (3.3.1),
pp. 26–27; Brouwer–Haemers, Theorem 11.3.3, p. 165, in the form with nonempty sets `Y`, `Z`).

Route: if `C` or `D` is empty there is nothing to prove. Otherwise let `y`, `x` be the
characteristic vectors of `C`, `D` and `N = ∑_i (yᵀ A_i y / (|X| v_i)) A_i`, the orthogonal
projection of `y yᵀ` onto the algebra (Godsil, Theorem 3.2.1, p. 25). By 2.1 and the relation
`m_i P_ij = v_j Q_ji`, `N = ∑_j (yᵀ E_j y / m_j) E_j`, so `N` is positive semidefinite and
`xᵀ N x ≥ (yᵀ E_0 y)(xᵀ E_0 x) = |C|² |D|² / |X|²`. On the other hand `yᵀ A_i y = 0` for
`i ∉ R ∪ {0}`, and `xᵀ A_i x = 0` for `i ∈ R \ {0}`, so `xᵀ N x = (|C|/|X|) |D|`. Hence
`|C| |D| ≤ |X|`.

**Checks.**
- Sphere packing: in `H(3, 2)` with `R = {3}`, the repetition code `{000, 111}` is an `R`-clique
  and the Hamming ball of radius `1` about `000` (four words, any two at distance at most `2`) an
  `R`-coclique, and `2 · 4 = 8` is equality (Godsil, p. 29).
- `H(2, 3)` (the `3 × 3` rook graph, which is the Paley graph on `9` points) with `R = {1}`: a row
  and a transversal give `3 · 3 = 9`, equality again.
- `J(5, 2)` with `R = {2}`: two disjoint pairs and the four pairs through a point give
  `2 · 4 = 8 < 10`.
- Distinct points: if the definition of an `R`-clique asked `rel x y ∈ R` for all `x, y ∈ C`, a
  nonempty clique would force `0 ∈ R`, and then no `R`-coclique could be nonempty.

*Needs:* 1.1, 1.2, 2.1; Mathlib `Matrix.PosSemidef.dotProduct_mulVec_nonneg`.

### 4.3 The clique bound for a class

Prove `card_sub_one_mul_neg_eigenmatrix_le`: if `P_ji < 0`, every `{i}`-clique `C` satisfies
`(|C| − 1)(−P_ji) ≤ v_i`, that is `|C| ≤ 1 − v_i / P_ji` (Godsil, Lemma 3.4.1, p. 29, for the least
eigenvalue of `A_i`; Brouwer–Haemers, §11.7, Exercise 3, p. 170, for every negative eigenvalue).

Route: `i ≠ 0`, since `P_j0 = 1`. With `y` the characteristic vector of a nonempty `C` and `N`
as in 4.2,
`N = (|C|/|X|) I + (|C|(|C| − 1)/(|X| v_i)) A_i`. Its eigenvalue on the column space of `E_j`,
`(|C|/|X|)(1 + (|C| − 1) P_ji / v_i)`, is nonnegative, which is the claim. (Proved here, following
Godsil's route; the statement for every negative eigenvalue follows from the least one, which
gives the strongest bound.)

**Checks.**
- The Petersen graph (class `2` of `J(5, 2)`, `v_2 = 3`, `P_12 = −2`): `|C| ≤ 1 + 3/2`, so
  cliques have at most `2` points, as the graph has no triangle.
- Class `1` of `J(5, 2)` (the triangular graph, `v_1 = 6`, `P_21 = −2`): `|C| ≤ 4`, attained by
  the four pairs through a point.
- The cube (class `1` of `H(3, 2)`) with the eigenvalue `P_21 = −1`: `|C| ≤ 4`, weaker than the
  bound `2` from the least eigenvalue `P_31 = −3`, and both true.
- For `C = ∅` the inequality reads `P_ji ≤ v_i`, true since `P_ji < 0`.

*Needs:* 2.1, 4.2 (the matrix `N`).

### Examples

Codes and balls in the Hamming schemes, the Fano plane and stars in `J(7, 3)`, cliques of the
Petersen and triangular graphs.

### Dependencies

4.1 uses 2.1; 4.2 uses 1.1, 1.2 and 2.1; 4.3 uses 2.1 and the route of 4.2.

## Layer 5: the Johnson scheme and the Erdős–Ko–Rado theorem

### 5.1 The spectrum of the Johnson scheme

Define `johnsonRel n k` on the subtype of `k`-subsets of `Fin n`, with class `k − |A ∩ B|`;
`eberlein n k i j`, the integer `∑_(h ≤ i) (−1)^h C(j, h) C(k − j, i − h) C(n − k − j, i − h)`;
and `containsVec k T`, the indicator of the `k`-subsets containing `T`. Prove
`johnson_eigenmatrix`: for `2k ≤ n`, `johnsonRel n k` is a scheme with `k` classes, and it has a
family `E` of primitive idempotents such that `P_ji = eberlein n k i j` for all `i, j ≤ k`, the
trace of `E_0 + ⋯ + E_j` is `C(n, j)`, and the column space of `E_0 + ⋯ + E_j` is spanned by the
vectors `containsVec k T` with `|T| = j`.

The scheme is Godsil's Example 1.1.1 (p. 2), with the same class index; the eigenvalues
of the Johnson graph (class `1`), `(k − j)(n − k − j) − j` with multiplicity
`C(n, j) − C(n, j − 1)`, are stated without proof in Brouwer–Haemers, §12.4.2, p. 175, and the
Kneser eigenvalues
(class `k`), `(−1)^j C(n − k − j, k − j)`, in Ellis's survey, p. 8, which also describes the
eigenspaces through the spans of the indicators `containsVec k T` and refers to Lovász for the
calculation. The general formula is Delsarte's; no proof was opened, and the route below is
complete. (Proved here.)

Route. Write `U_j` for the span of the `containsVec k T` with `|T| = j`.

1. *Scheme.* For `2k ≤ n` every value of `|A ∩ B|` from `0` to `k` occurs, so every class is
   nonempty. If `|A ∩ B| = |A′ ∩ B′|`, a permutation `σ` of `Fin n` maps `A ∩ B`, `A \ B`,
   `B \ A` and the rest onto the corresponding parts for `A′`, `B′`; `z ↦ σ z` maps the
   `z` counted for `(A, B)` onto those counted for `(A′, B′)`.
2. *The filtration.* `U_(j−1) ⊆ U_j` for `1 ≤ j ≤ k`, since `containsVec k T` with `|T| = j − 1`
   is `(k − j + 1)⁻¹` times the sum of the `containsVec k T′` over the `j`-sets `T′ ⊇ T`; and
   `U_k` is everything. The dimension of `U_j` is `C(n, j)`: let `W_(s,t)` be the inclusion
   matrix of `s`-sets against `t`-sets. Then `W_(j,j+1) W_(j+1,j+2) ⋯ W_(k−1,k)` is
   `(k − j)!` times `W_(j,k)`, and each `W_(s,s+1)` has independent rows when `2s < n`, because
   `W_(s,s+1) W_(s,s+1)ᵀ = (n − s) I + A`, with `A` the Johnson graph on `s`-sets, equals
   `(n − 2s) I + W_(s−1,s)ᵀ W_(s−1,s)` for `s ≥ 1` (and is `n` for `s = 0`), which is positive
   definite; here `s ≤ k − 1` and `n ≥ 2k`.
3. *Invariance.* For `|T| = j`, `(A_i containsVec k T)(B)` is the number of `k`-sets `C ⊇ T`
   with `|C ∩ B| = k − i`, a function `f(|T ∩ B|)`. By binomial inversion on the subsets of `T`,
   `f(|T ∩ B|) = ∑_(S ⊆ T) g(|S|) containsVec k S (B)`, so `A_i containsVec k T` is
   `g(j) containsVec k T` plus an element of `U_(j−1)`, with `g(j)` depending only on
   `n, k, i, j`. Hence every `A_i` maps `U_j` into itself and acts on `U_j / U_(j−1)` as a
   scalar `c_ij`.
4. *The idempotents.* Let `V_j` be the orthogonal complement of `U_(j−1)` in `U_j` and `E_j` the
   orthogonal projection onto `V_j`; `E_0 = J / C(n, k)`, the `E_j` are complete orthogonal
   idempotents, and `tr(E_0 + ⋯ + E_j) = dim U_j = C(n, j)`. Each `A_i` is symmetric and
   preserves `U_j` and `U_(j−1)`, so it preserves `V_j` and acts there as `c_ij`. `V_j ≠ 0`,
   since `C(n, j) > C(n, j − 1)` for `j ≤ n/2`. Each `V_j` lies in the column space of one
   primitive idempotent `F_l` of 1.2; as the `k + 1` nonzero spaces `V_j` and the `k + 1` column
   spaces of the `F_l` are both orthogonal decompositions of `ℝ^X`, this assignment is a
   bijection and `V_j` is that column space, so `E_j = F_l` lies in the Bose–Mesner algebra. The
   order is the one the statement asks for: `E_0 + ⋯ + E_j` is the projection onto `U_j`, so the
   trace and column-space clauses hold and determine each `E_j`.
5. *The eigenvalues.* Choose distinct points `a_1, b_1, …, a_j, b_j` (possible as `2j ≤ n`) and
   let `w(B) = ∏_r ([a_r ∈ B] − [b_r ∈ B])`. Expanding the product, `w ∈ U_j`; exchanging `a_r`
   and `b_r` for an `r` with neither point in a `(j − 1)`-set `T` shows `w ⊥ U_(j−1)`; and
   `w(B₀) = 1` for a `k`-set `B₀ ⊇ {a_1, …, a_j}` avoiding every `b_r`. So `A_i w = c_ij w`, and
   `(A_i w)(B₀)` counts, with sign `(−1)^h`, the `k`-sets `C` with `|C ∩ B₀| = k − i` that take
   `b_r` for `h` of the pairs and `a_r` for the others: there are
   `C(j, h) C(k − j, i − h) C(n − k − j, i − h)` of them. Hence `c_ij = eberlein n k i j`.

**Checks.**
- `eberlein 7 3 i j` reproduces the table of `P` for `J(7, 3)` in 2.2, and for `i = 1` it is
  `(k − j)(n − k − j) − j`, the Johnson graph eigenvalue of Brouwer–Haemers.
- For `i = k` only `h = j` contributes, giving the Kneser eigenvalues `(−1)^j C(n − k − j, k − j)`:
  `(3, −2, 1)` for `J(5, 2)` (the Petersen graph), `(4, −3, 2, −1)` for `J(7, 3)`, and
  `(1, −1, 1, −1)` for `J(6, 3)`, where `n = 2k` and the eigenvalues of class `k` coincide in
  pairs.
- The multiplicities `C(n, j) − C(n, j − 1)` for `J(5, 2)` are `(1, 4, 5)`, summing to `10`.
- The hypothesis `2k ≤ n` is needed: for `n = 3`, `k = 2`, any two `2`-subsets meet, so class `2`
  is empty and `johnsonRel 3 2` is not a scheme.
- All of the above was recomputed in exact arithmetic for every `n ≤ 7` and `k` with
  `C(n, k) ≤ 35` and `2k ≤ n`, from the projections onto the spaces `U_j`.

*Needs:* 1.1, 1.2, 2.1; Mathlib `Nat.choose`, `Matrix.toLin'`, `Submodule.span`,
`Equiv.Perm`.

### 5.2 Uniqueness in the Erdős–Ko–Rado theorem

Prove `eq_star_of_intersecting`: if `2k < n` and `𝒜` is an intersecting family of `k`-subsets of
`Fin n` with `C(n − 1, k − 1)` members, then `𝒜` consists of all `k`-subsets containing some
point `a` (Ellis, Theorem 1.3, p. 2, for the statement; the spectral route through Hoffman's
bound is Lovász's, Ellis, Theorem 1.5 and the following paragraphs, pp. 7–8, which do not carry
out the uniqueness). The bound `|𝒜| ≤ C(n − 1, k − 1)` for `2k ≤ n` is Mathlib's
`Finset.erdos_ko_rado` and is not restated. (Proved here.)

Route.

1. For `k = 0` the hypothesis cannot hold: the empty set is disjoint from itself, so `𝒜` is
   empty, while `C(n − 1, k − 1) = C(n − 1, 0) = 1` (natural subtraction). For `k = 1` an intersecting family has at most one member,
   and `{ {a} }` is the star of `a`. Let `k ≥ 2`.
2. Let `K = kneserGraph (Fin n) k` (TopologicalCombinatorics 3.1), whose vertex type
   `{s : Finset (Fin n) | s.card = k}` is, up to the coercion of a set to a type, the subtype on
   which `johnsonRel n k` lives: its adjacency matrix is `A_k` of `johnsonRel n k` (as `k ≥ 1`), and it is regular of degree `C(n − k, k)` (the `k`-subsets of the
   complement). By 5.1 and 2.1 its eigenvalues are `θ_j = (−1)^j C(n − k − j, k − j)`, each with
   multiplicity `C(n, j) − C(n, j − 1) > 0`; for `2k < n` the numbers `|θ_j|` strictly
   decrease in `j`, since `C(m − 1, r − 1) < C(m, r)` for `r < m`. Hence
   `smallestEigenvalue K = θ_1 = −C(n − k − 1, k − 1)`, and its eigenspace is the column space of
   `E_1` alone.
3. `𝒜` is an independent set of `K` of size `C(n − 1, k − 1)`, and
   `C(n − 1, k − 1) (C(n − k, k) + C(n − k − 1, k − 1)) = C(n, k) C(n − k − 1, k − 1)`, because
   `C(n − 1, k − 1) = (k/n) C(n, k)` and
   `C(n − k, k) + C(n − k − 1, k − 1) = (n/k) C(n − k − 1, k − 1)` (the first summand is
   `((n − k)/k) C(n − k − 1, k − 1)`). So equality holds in Hoffman's ratio bound
   (SpectralGraphBounds 3.2, `indepNum_mul_le`), and by its equality clause
   (`card_neighbor_inter_eq_of_eq`) every `k`-set outside `𝒜` is disjoint from exactly
   `C(n − k − 1, k − 1)` members of `𝒜`; a member of `𝒜` is disjoint from none.
4. Hence, with `χ` the characteristic vector of `𝒜` and `c = |𝒜| / C(n, k)`,
   `A_k χ = −θ_1 (1 − χ)`, and `χ − c 1` is a `θ_1`-eigenvector. By 2 it lies in the column space
   of `E_1`, so `χ` lies in that of `E_0 + E_1`, which is `U_1` by 5.1: there are reals `x_p`
   with `χ(B) = ∑_(p ∈ B) x_p` for every `k`-set `B`.
5. For points `p ≠ q`, a `(k − 1)`-set `S` avoiding both exists (`k + 1 ≤ n`), and
   `x_p − x_q = χ(S ∪ {p}) − χ(S ∪ {q}) ∈ {−1, 0, 1}`. So the `x_p` take two values `m` and
   `m + 1`; let `T` be the points with value `m + 1` and `t = |T|`. Then
   `χ(B) = km + |B ∩ T| ∈ {0, 1}`. If `2 ≤ t ≤ n − 2`, `|B ∩ T|` takes at least three values
   (as `k ≥ 2` and `n − k ≥ 2`), which is impossible. If `t = 0` or `t = n`, `χ` is constant and
   `|𝒜|` is `0` or `C(n, k)`, neither equal to `C(n − 1, k − 1)`. If `t = n − 1`, with `b` the
   point outside `T`, both values `km + k − 1` and `km + k` occur and lie in `{0, 1}`, so
   `km + k = 1` (the reals `x_p` need not be integers) and `χ(B) = 1 − [b ∈ B]`: `𝒜` is the family
   of all `k`-sets avoiding `b`, with `C(n − 1, k) > C(n − 1, k − 1)` members as `2k < n`, a
   contradiction. So `t = 1`, `T = {a}`, `km = 0`, and `𝒜` is the star of `a`.

**Checks.**
- `n = 2k` is excluded for a reason: for `n = 4`, `k = 2` the family `{12, 13, 23}` is
  intersecting of size `3 = C(3, 1)` and has no common point; for `n = 6`, `k = 3` the ten
  triples containing at least two of `1, 2, 3` are intersecting, of size `C(5, 2)`, and not a
  star.
- `J(5, 2)`: the bound is `10 · 2 / (3 + 2) = 4`; the maximum families are exactly the five stars
  (and in the Petersen graph the six vertices outside a star each have `2` neighbours in it).
- Exhaustive search over all intersecting families confirms that for
  `(n, k) = (3, 1), (5, 2), (6, 2), (7, 2), (8, 2), (7, 3)` the maximum families are the `n`
  stars, while for `(4, 2)` and `(6, 3)` non-stars of maximum size exist.

*Needs:* 5.1, 2.1; SpectralGraphBounds 3.2 (`indepNum_mul_le`, `card_neighbor_inter_eq_of_eq`)
and 1.1 (`adjEigenvalues`, `smallestEigenvalue`); TopologicalCombinatorics 3.1 (`kneserGraph`);
Mathlib `Set.Intersecting`, `Set.Sized`, `SimpleGraph.IsIndepSet`.

### Examples

`J(4, 2)` (the octahedron and its perfect matching), `J(5, 2)` (the triangular graph and the
Petersen graph), `J(6, 3)` and `J(7, 3)` (whose class `3` is the Odd graph `O_4`).

### Dependencies

5.1 uses 1.1, 1.2 and 2.1; 5.2 uses 2.1 and 5.1, and the suppliers SpectralGraphBounds and
TopologicalCombinatorics.

## Layer 6: distance-regular graphs and metric schemes

### 6.1 Metric and `P`-polynomial schemes

Prove `metric_iff_pPolynomial`: for a scheme, the following are equivalent: the graph of class `1`
(two distinct points adjacent when in class `1`, Mathlib `SimpleGraph.fromRel`) has graph
distance equal to the class index, `dist x y = rel x y` for all `x`, `y`; and there are
polynomials `f_k` with `deg f_k = k` and `f_k(A_1) = A_k` for every `k` (Brouwer–Haemers,
Theorem 11.6.1 with its proof, pp. 168–169, where the scheme is called metric and the second
condition is `P_ik = f_k(z_i)`; for a scheme with that property and `f_1` of degree one, the
`z_i` may be taken to be `P_i1`, which gives the matrix form used here; Godsil, §2.3,
pp. 16–17).

Route. If the scheme is metric, the triangle inequality gives
`A_1 A_j = p^(j−1)_1j A_(j−1) + p^j_1j A_j + p^(j+1)_1j A_(j+1)` with `p^(j+1)_1j > 0`, and
induction on `j` gives `f_j`. Conversely, `A_1 A_j = f_1(A_1) f_j(A_1)` is a polynomial of degree
`j + 1` in `A_1`, hence in the span of `A_0, …, A_(j+1)`; so `p^l_1j = 0` for `l > j + 1`, and by
`p^l_1j v_l = p^j_1l v_j` (1.1) also for `l < j − 1`. Since `A_1` generates the algebra its
minimal polynomial has degree `d + 1`, so comparing degrees gives `p^(j+1)_1j ≠ 0`; induction on
the class index then identifies class `i` with distance `i`.

**Checks.**
- `H(3, 2)`: among the six orderings of the classes `1, 2, 3`, only the natural one is metric; with
  class `3` (antipodal words) put first, the class-`1` graph is a perfect matching, which is not
  connected, and `A_2` is not a polynomial in it.
- `J(7, 3)` is metric for the natural order and also for the order `3, 1, 2` (the Odd graph `O_4`,
  in which disjoint triples are adjacent), and for no other order (Godsil, §2.3, p. 17, names
  `J(2k + 1, k)` as metric for two relations).
- Both properties were compared for every ordering of the classes of `H(3, 2)`, `H(2, 3)`,
  `J(5, 2)`, `J(6, 2)`, `J(6, 3)`, `J(7, 3)` and the cyclic schemes on `ℤ/7` and `ℤ/8`; they agree
  in every case.

*Needs:* 1.1, 2.1; Mathlib `SimpleGraph.fromRel`, `SimpleGraph.dist`, `Polynomial.aeval`,
`Polynomial.natDegree`, `minpoly`.

### 6.2 Distance-regular graphs

Define `IsDistanceRegular G` for a graph on a finite type: `G` is connected, and for vertices `x`,
`y` at distance `h` the number `c_h` of neighbours of `y` at distance `h − 1` from `x` and the
number `b_h` of neighbours of `y` at distance `h + 1` from `x` depend only on `h` (Brouwer–Haemers,
§12.1, p. 173, the intersection array `{b_0, …, b_(d−1); c_1, …, c_d}`). Define `distRel G`, the
distance capped at the diameter, as in the Conventions. Prove `isDistanceRegular_iff`:
`IsDistanceRegular G` holds exactly when `G` is connected and `distRel G` is a scheme with
`G.diam` classes. Brouwer–Haemers take the second property as the definition (Chapter 12, p. 173)
and state the equivalence with conditions on the intersection numbers as easily seen; the route
below is complete. (Proved here.)

Route. If `distRel G` is a scheme, `c_h = p^h_(h−1),1` and `b_h = p^h_(h+1),1`. Conversely,
`b_0` is the degree of `y`, so `G` is regular of degree `k = b_0`, and `a_h = k − b_h − c_h`. Let
`D_j` be the distance-`j` matrix. Counting the neighbours of `y` by their distance from `x` gives
`A D_j = b_(j−1) D_(j−1) + a_j D_j + c_(j+1) D_(j+1)` for `j < diam`, and the same without the
last term for `j = diam`. By induction `D_j = v_j(A)` with `deg v_j = j`, the span of
`D_0, …, D_diam` is the algebra generated by `A`, and `D_i D_j` lies in it with coefficients
depending only on the graph's parameters; so the number of `z` at distance `i` from `x` and `j`
from `y` depends only on the distance of `x` and `y`. Classes are nonempty since `G` is
connected.

**Checks.**
- The Petersen graph, the cube, the `4 × 4` rook graph, the Odd graph `O_4` and the cycle `C_8`
  are distance-regular (the cube has intersection array `{3, 2, 1; 1, 2, 3}`, matching `L_1` in
  2.3); the triangular prism is not: `b_1` is `1` on a triangle edge and `2` on a rung.
- Connectedness is needed in `IsDistanceRegular`: on the edgeless graph with two vertices every
  count `c_h`, `b_h` is `0` (Mathlib's distance is `0` between vertices in different
  components), so the counting conditions hold, while the graph is not connected and `distRel` is
  not a scheme (it is `0` on a pair of distinct vertices). On the right side of 6.2 the clause
  `G.Connected` is implied by the scheme condition: `exists_rel_eq` gives a vertex, and if `G`
  were not connected, two vertices `u ≠ v` in different components would have
  `G.diam = 0` (Mathlib's `SimpleGraph.ediam_eq_top_of_not_connected` and
  `SimpleGraph.diam_eq_zero_of_ediam_eq_top`),
  so `distRel G u v = 0` and `rel_eq_zero_iff` would give `u = v`. The clause is kept because that
  argument runs only through the junk value `diam = 0`: with an infinite distance class, the
  distance classes `0`, `1`, `∞` of two disjoint triangles do form a scheme, so the classical
  statement needs connectedness. Two disjoint triangles are excluded
  by both conditions: `b_0` is `2` for `x = y` and `0` for `x`, `y` in different triangles.
- Every graph on at most six labelled vertices was tested: the two sides agree on all 33,868
  graphs (106 of them distance-regular); the empty vertex type and the one-vertex graph are
  included.

*Needs:* 1.1; 6.1 for the remark that a distance-regular graph gives a metric scheme; Mathlib
`SimpleGraph.Connected`, `SimpleGraph.dist`, `SimpleGraph.diam`, `SimpleGraph.dist_le_diam`,
`SimpleGraph.ediam_eq_top_of_not_connected`, `SimpleGraph.diam_eq_zero_of_ediam_eq_top`.

### Examples

The Petersen graph, the cube and the Hamming graphs, the Johnson graphs, the Odd graph `O_4`,
cycles; the triangular prism as a non-example.

### Dependencies

6.1 uses 1.1 and 2.1; 6.2 uses 1.1.

## Scope and ownership

This roadmap owns symmetric association schemes with their Bose–Mesner algebra and primitive
idempotents, the eigenmatrices `P` and `Q` with their expansions and orthogonality relations,
intersection matrices and their characteristic polynomials, Krein parameters and the Krein
conditions, inner distributions with Delsarte's inequalities for an arbitrary scheme, the
clique–coclique bound and the clique bound for a class, the Johnson scheme with its eigenmatrix
and multiplicities, the uniqueness clause of the Erdős–Ko–Rado theorem, the equivalence of metric
and `P`-polynomial schemes, and the characterization of distance-regular graphs by their distance
schemes.

Already in the libraries and therefore not targets: the Erdős–Ko–Rado bound
`Finset.erdos_ko_rado`, the Schur product theorem `Matrix.PosSemidef.hadamard`, Mathlib's
orthogonal idempotents, strongly regular graphs (`SimpleGraph.IsSRGWith`) and graph distance, and
Tau Ceti's Krawtchouk values `TauCeti.krawtchouk`, which appear here only in the Examples of
Layer 2.
Neither Mathlib nor Tau Ceti has association schemes, Bose–Mesner algebras, Krein parameters,
Johnson schemes or distance-regular graphs at the pins.

Left to other roadmaps:

- SpectralGraphBounds 3.2 states Hoffman's ratio bound for regular graphs with its equality clause;
  5.2 uses both and restates neither. Its 1.1 defines the sorted adjacency eigenvalues used in the
  route of 5.2.
- TopologicalCombinatorics 3.1 defines Kneser graphs, used in the route of 5.2, and owns their
  chromatic number; nothing of it is restated.
- StronglyRegularAndMooreGraphs owns the spectrum, multiplicities, Frame quotient and absolute
  bound of strongly regular graphs (its Layer 1) and the Moore bounds; the schemes with two classes
  appear here only as examples and in Checks (the parameter sets of 3.1), and none of its theorems
  is restated.
- BoundsOnCodes 5.1 states Delsarte's inequalities for codes over any alphabet in the form
  `∑_i A_i K_k(i) ≥ 0`, proved by characters, and 5.2 the linear-programming bound for codes. 4.1
  above is the inequality for an arbitrary scheme, proved through the idempotents; at the Hamming
  scheme, where `Q` is the table of Krawtchouk values (`TauCeti.krawtchouk`), it gives back the
  inequalities of BoundsOnCodes 5.1, which this roadmap does not restate. This roadmap does not
  depend on that one.
- PaleyGraphsAndCharacterSums 3.1 bounds the clique and independence numbers of Paley graphs by
  `√q`; 4.2 is a different statement, for an arbitrary scheme, used here only in a Check on the
  `3 × 3` rook graph. This roadmap does not depend on that one.
- LovaszThetaFunction states the sandwich theorem and the ratio bound for `ϑ`; Schrijver's
  variant `ϑ′`, which equals Delsarte's linear-programming bound on schemes, is outside both.

Outside the scope: commutative nonsymmetric schemes and coherent configurations; the full
linear-programming bound as an optimisation over a scheme and its duality theory; Neumaier's
absolute bound for schemes; the Terwilliger algebra; `Q`-polynomial (cometric) schemes beyond the
definitions; the classification of distance-regular graphs, Biggs' multiplicity formula and the
Bannai–Ito theorem; Grassmann, bilinear-forms and other classical families; designs and
`t`-designs in schemes; the Hilton–Milner theorem and stability versions of Erdős–Ko–Rado.

## Exact supplier contracts

### From Mathlib

- `Mathlib/RingTheory/Idempotents.lean`: `CompleteOrthogonalIdempotents` (each member
  idempotent, distinct members with product `0`, sum `1`).
- `Mathlib/Analysis/Matrix/Order.lean`: `Matrix.PosSemidef.hadamard` (the entrywise product of
  positive semidefinite matrices is positive semidefinite), used in 3.1.
- `Mathlib/LinearAlgebra/Matrix/PosDef.lean`: `Matrix.PosSemidef`,
  `Matrix.PosSemidef.dotProduct_mulVec_nonneg` (`0 ≤ star x ⬝ᵥ M *ᵥ x`).
  `Mathlib/Analysis/Matrix/Spectrum.lean`: `Matrix.IsHermitian.spectral_theorem`,
  `Matrix.IsHermitian.eigenvalues₀`.
- `Mathlib/LinearAlgebra/Matrix/Trace.lean`: `Matrix.trace`, `Matrix.trace_mul_comm`.
  `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean`: `Matrix.charpoly`,
  `Matrix.charpoly_units_conj` (conjugation by a unit preserves the characteristic polynomial).
  `Mathlib/LinearAlgebra/Matrix/ToLin.lean`: `Matrix.toLin'`.
- `Mathlib/LinearAlgebra/Matrix/Defs.lean`: `Matrix.of`. `Mathlib/Data/Matrix/Mul.lean`:
  `Matrix.mulVec`, `Matrix.dotProduct_mulVec`. `Mathlib/LinearAlgebra/Matrix/Hadamard.lean`:
  `Matrix.hadamard` (notation `⊙`).
- `Mathlib/Combinatorics/SetFamily/KruskalKatona.lean`: `Finset.erdos_ko_rado` (for an
  intersecting `r`-uniform family on `Fin n` with `r ≤ n / 2`, at most `C(n − 1, r − 1)`
  members), cited and not restated. `Mathlib/Combinatorics/SetFamily/Intersecting.lean`:
  `Set.Intersecting` (no two members disjoint; a member equal to `∅` is disjoint from itself).
  `Mathlib/Data/Finset/Slice.lean`: `Set.Sized`.
- `Mathlib/Combinatorics/SimpleGraph/Basic.lean`: `SimpleGraph.fromRel` (symmetrize a relation
  and remove the diagonal). `Mathlib/Combinatorics/SimpleGraph/Metric.lean`: `SimpleGraph.dist`
  (`0` between vertices that are not reachable). `Mathlib/Combinatorics/SimpleGraph/Diam.lean`:
  `SimpleGraph.diam`, `SimpleGraph.dist_le_diam` (under `G.ediam ≠ ⊤`),
  `SimpleGraph.ediam_eq_top_of_not_connected` (on a nonempty type) and
  `SimpleGraph.diam_eq_zero_of_ediam_eq_top`.
  `Mathlib/Combinatorics/SimpleGraph/Connectivity/Connected.lean`: `SimpleGraph.Connected`.
  `Mathlib/Combinatorics/SimpleGraph/Clique.lean`: `SimpleGraph.IsIndepSet`.
- `Mathlib/Algebra/Polynomial/AlgebraMap.lean`: `Polynomial.aeval`;
  `Mathlib/Algebra/Polynomial/Degree/Defs.lean`: `Polynomial.natDegree`;
  `Mathlib/FieldTheory/Minpoly/Basic.lean`: `minpoly`.
- `Mathlib/LinearAlgebra/Span/Defs.lean`: `Submodule.span`; `Mathlib/Logic/Equiv/Defs.lean`:
  `Equiv.Perm`; `Mathlib/Data/Nat/Choose/Basic.lean`: `Nat.choose`;
  `Mathlib/Data/Finset/Card.lean`: `Finset.card`.

### From TauCetiRoadmap.SpectralGraphBounds

- 1.1, the definitions `adjEigenvalues` (the eigenvalues of `G.adjMatrix ℝ`, nonincreasing, on
  `Fin (Fintype.card V)`) and `smallestEigenvalue` (the last one, on a nonempty vertex type).
- 3.2, `indepNum_mul_le` (for a `d`-regular graph, `α (d − λₙ) ≤ n (−λₙ)`) and
  `card_neighbor_inter_eq_of_eq` (if an independent set `S` of a `d`-regular graph satisfies
  `|S| (d − λₙ) = n (−λₙ)`, every vertex outside `S` has exactly `−λₙ` neighbours in `S`). Both
  are applied in the route of 5.2 to the Kneser graph, a graph on a nonempty finite type with
  decidable equality and decidable adjacency, as their signatures require.

### From TauCetiRoadmap.TopologicalCombinatorics

- 3.1, the definition `kneserGraph α k` (the simple graph on the subtype of `k`-subsets of `α`,
  two subsets adjacent when distinct and disjoint), used in the route of 5.2. Its regularity of
  degree `C(n − k, k)`, stated there in prose, is reproved in one line in that route.

## References

- Chris Godsil, *Association Schemes*, lecture notes, June 2010, on the author's page
  (`math.uwaterloo.ca/~cgodsil/pdfs/assoc2.pdf`). Locators are to its numbered results and
  printed pages: §1.1 and Example 1.1.1, pp. 1–2; §1.3, p. 6; Theorem 1.4.1, p. 8; Theorem 1.5.1,
  p. 10, and the choice of `E_0`, p. 11; §2.1, (2.1.1)–(2.1.2) and `PQ = vI`, pp. 13–14; §2.3,
  pp. 16–17; §2.4, (2.4.1), p. 17, the formula for the Krein parameters, p. 18, Theorem 2.4.2,
  p. 19; §3.1, (3.1.1), p. 24; Theorem 3.2.1, p. 25; §3.3, the definition of `R`-cliques, p. 25,
  Theorem 3.3.1, p. 26, Theorem 3.3.2 and (3.3.1), p. 27; Lemma 3.4.1 and the sphere-packing
  example, pp. 29–30.
- Andries E. Brouwer and Willem H. Haemers, *Spectra of Graphs*, Springer, 2012; the authors'
  copy (`homepages.cwi.nl/~aeb/math/ipm/ipm.pdf`) was read, with its printed pages: §11.1 and
  Theorem 11.1.1, p. 161; §11.2, Theorems 11.2.1 and 11.2.2, pp. 162–164; §11.3, Theorem 11.3.1
  and the example of triples of a 7-set, p. 164, Theorems 11.3.2 and 11.3.3, p. 165; §11.4, the
  definition and Theorem 11.4.1, p. 166, Theorem 11.4.2, p. 167; §11.6, Theorem 11.6.1,
  pp. 168–169, the example `H(4, 2)`, p. 170; §11.7, Exercise 3, p. 170; Chapter 12, p. 173,
  §12.1, p. 173; §12.4.2, p. 175.
- David Ellis, *Intersection problems in extremal combinatorics: theorems, techniques and
  questions old and new*, arXiv:2107.06371 (version 3, read on arXiv): Theorem 1.3, p. 2;
  Theorem 1.5 with its proof and the paragraph on Kneser graphs, pp. 7–8.
- P. Delsarte (the linear-programming method and the Eberlein values of the Johnson scheme),
  L. L. Scott (the Krein conditions), R. C. Bose and D. M. Mesner, and L. Lovász (the spectral
  proof of the Erdős–Ko–Rado bound) are attributed in prose as the opened sources attribute them;
  their papers were not opened.

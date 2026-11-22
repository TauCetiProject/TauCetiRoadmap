# Roadmap: Delsarte theory of codes and designs

**Summary.** Delsarte's theory studies a subset `Y` of a symmetric association scheme through its
inner distribution `a` (how its pairs fall into the classes) and the transform `aQ` by the second
eigenmatrix, which is entrywise nonnegative. Codes are sets whose inner distribution vanishes on
prescribed classes, designs sets whose transform vanishes on prescribed idempotents. All sets are
finite and all matrices real. The headline theorems are these.

- *Schrijver's theorem.* For every symmetric scheme and every set `R` of classes, let `G_R` join
  distinct points whose class lies in `R`. Schrijver's variant `ϑ′(G_R)` of the theta function is
  the maximum of Delsarte's linear program (`max ∑ a_i` over `a_0 = 1`, `a ≥ 0`, `a_i = 0` on the
  nonzero classes of `R`, `aQ ≥ 0`), and `ϑ(G_R)` is the maximum of that program without the
  conditions `a_i ≥ 0`; the maxima are attained.
- *The Hamming scheme.* For words of length `n` over `q ≥ 2` letters, both eigenmatrices are the
  table of Krawtchouk values; its first `t + 1` eigenspaces span the functions of at most `t`
  coordinates; and for `δ ≥ 1`, `ϑ′` of the graph joining words at distance less than `δ` is the
  least value of the Krawtchouk certificates for codes of minimum distance `δ`.
- *Designs.* For `t ≤ k ≤ v/2`, a family of `k`-subsets of a `v`-set is a Delsarte `t`-design
  exactly when it is a combinatorial `t`-design; for `t ≤ n`, a set of words is a Delsarte
  `t`-design exactly when it is an orthogonal array of strength `t`.
- *Cometric schemes.* The Johnson scheme (`2k ≤ v`) and the Hamming scheme are cometric in their
  standard orders, and the dual eigenvalues of the Johnson scheme are Hahn polynomials. In a
  cometric scheme with multiplicities `m_j`, a nonempty `2e`-design has at least `m_0 + ⋯ + m_e`
  points, and a set whose distinct pairs fall into at most `s` classes has at most
  `m_0 + ⋯ + m_s`.
- *The sphere.* For `e ≥ 1`, a spherical `2e`-design in `ℝⁿ` has at least
  `C(n + e − 1, e) + C(n + e − 2, e − 1)` points; for `s ≥ 1`, a set of unit vectors with at most
  `s` inner products between distinct members has at most `C(n + s − 1, s) + C(n + s − 2, s − 1)`.

It rests on AssociationSchemes (Bose–Mesner algebra, eigenmatrices, Krein parameters, Delsarte's
inequalities, Johnson scheme), LovaszThetaFunction (`ϑ`), the linear-programming duality of
ConvexAnalysisAndDuality, the Hahn polynomials of SpecialFunctionsClebschGordan and the spherical
designs of LatticePackingsAndPerfectForms; it identifies the certificates of BoundsOnCodes with
the dual program, and the Ray-Chaudhuri–Wilson bound of LinearAlgebraMethodInCombinatorics
appears as an instance.

Layer 1 below proves Schrijver's theorem, Layer 2 builds the Hamming scheme, Layer 3 identifies
designs in the Johnson and Hamming schemes, Layer 4 treats cometric schemes and their bounds, and
Layer 5 the sphere.

## Conventions

- **Schemes.** A scheme with `d` classes is a class function `rel : X → X → Fin (d + 1)` with
  `IsAssocScheme rel`, and `E` a family with `IsPrimitiveIdempotents rel E`, both as in
  AssociationSchemes (symmetric schemes; the commutative nonsymmetric ones are not treated). The
  eigenmatrices are `P = eigenmatrix rel E` (rows indexed by idempotents, `A_j E_i = P_ij E_i`) and
  `Q = dualEigenmatrix rel E` (rows indexed by classes, `E_j = |X|⁻¹ ∑_i Q_ij A_i`), the
  multiplicity of `E_j` is `m_j = tr E_j`, the valency of class `i` is `v_i = valency rel i`, and
  the Krein parameters `q^k_ij = kreinParam rel E i j k` are normalised so that
  `E_i ∘ E_j = |X|⁻¹ ∑_k q^k_ij E_k`. These definitions, `innerDistribution`, `johnsonRel` and
  `containsVec` are copied verbatim from AssociationSchemes. Five relations of AssociationSchemes
  that appear there only in prose are used below with their one-line proofs: `P_i0 = 1`,
  `P_0j = v_j`, `Q_i0 = 1`, `Q_0j = m_j` (from `A_0 = I` and `E_0 = J/|X|`), and
  `m_i P_ij = v_j Q_ji` (both sides are `tr(A_j E_i)`, computed from `A_j E_i = P_ij E_i` and from
  the definition of `Q` with `E_i` symmetric).
- **Inner distribution and transform.** For `Y ⊆ X`, `a_i = innerDistribution rel Y i` is the
  number of ordered pairs of `Y` in class `i` divided by `|Y|` (all zero for `Y = ∅`), so
  `a_0 = 1` and `∑_i a_i = |Y|` for nonempty `Y`. Its transform is `(aQ)_j = ∑_i a_i Q_ij`, with
  `(aQ)_0 = |Y|`.
- **Graphs of classes.** For `R : Finset (Fin (d + 1))`, `classGraph rel R` joins two distinct
  points whose class lies in `R` (Mathlib's `SimpleGraph.fromRel`); class `0` never joins two
  points, so whether `0 ∈ R` does not matter. Its independent sets are the `R`-cocliques of
  AssociationSchemes 4.2, the codes avoiding the classes of `R`. Delsarte's program likewise only
  constrains the nonzero classes of `R`, so every statement holds for every `R`.
- **Theta functions.** `ϑ = lovaszTheta` (copied verbatim from LovaszThetaFunction 1.1) is the
  supremum of `∑_x ∑_y B_xy` over positive semidefinite `B` of trace `1` vanishing on the edges;
  `ϑ′ = thetaPrime` adds the condition `B ≥ 0` entrywise. Both are `sSup` of a set of reals; the
  theorems below state the corresponding `IsGreatest` facts, so that no junk value is used.
- **Order of the idempotents.** Designs and the cometric property depend on the order of
  `E_1, …, E_d`. For the Johnson scheme `J(n, k)` (`2k ≤ n`) the standard order is the one of
  AssociationSchemes 5.1: the column space of `E_0 + ⋯ + E_j` is spanned by the vectors
  `containsVec k T` with `|T| = j`. For the Hamming scheme it is the one of 2.1: the column space of
  `E_0 + ⋯ + E_j` is `juntaSpan j`, the span of the functions depending on at most `j`
  coordinates. Each condition determines the family, because `E_0 + ⋯ + E_j` is then the
  orthogonal projection onto the given space (a symmetric idempotent is determined by its column
  space).
- **Spheres.** The spherical designs are those of LatticePackingsAndPerfectForms 5.1, copied
  verbatim: `IsSphericalDesign t Y 1` asks that `Y` be a nonempty set of unit vectors and that every
  function in `polynomialsOfDegreeLE E t` (the span of the powers `⟪a, ·⟫^k`, `k ≤ t`) have the same
  average on `Y` as on the unit sphere. Bounds are written with `Nat.multichoose`:
  `multichoose n e = C(n + e − 1, e)`. With natural subtraction, `multichoose n (s − 1)` is
  `multichoose n 0 = 1` at `s = 0`, where 5.1 reads `|Y| ≤ 2` (true, as such a set has at most
  one point, but not sharp).

## Layer 1: Schrijver's theorem

### 1.1 `ϑ′` is Delsarte's linear-programming bound

Define `classGraph`, `thetaPrime` and `IsDelsarteFeasible` as in the Conventions:
`IsDelsarteFeasible rel E R a` asks `a 0 = 1`, `a i ≥ 0` for all `i`, `a i = 0` for `i ∈ R` with
`i ≠ 0`, and `(aQ)_j ≥ 0` for all `j`; the objective is `∑_i a_i`. Prove
`isGreatest_thetaPrime_classGraph`: for a scheme, a family of primitive idempotents and any `R`,
the semidefinite program defining `ϑ′(G_R)` attains its supremum, and `ϑ′(G_R)` is the greatest
value of Delsarte's program, which is attained too (Bachoc–Gijswijt–Schrijver–Vallentin, §4.1,
pp. 25–26, for the Hamming scheme, with the remark there that on schemes in general Delsarte's
bound arises from a semidefinite program by restricting to the Bose–Mesner algebra; Vallentin,
p. 6, for `ϑ′`; Martin–Tanaka, Theorem 7.1, p. 20, for the program; Godsil, §3.3, p. 28, states
the program in the coefficients of `∑_i a_i A_i`). The identification is due to
McEliece, Rodemich and Rumsey and to Schrijver, as Bachoc–Gijswijt–Schrijver–Vallentin say
(p. 26). The opened sources prove it for the Hamming scheme by averaging over its automorphism
group, which a general scheme need not have; the route below replaces the averaging by Seidel's
projection onto the Bose–Mesner algebra and is complete. (Proved here.)

Route.

1. *Projection* (Godsil, Theorem 3.2.1, p. 25, proved here in this form). With the inner product
   `⟨M, N⟩ = ∑_(x, y) M_xy N_xy`, the `A_i` and the `E_j` are two orthogonal bases of the
   Bose–Mesner algebra (AssociationSchemes 2.1 gives each family in the span of the other;
   `A_i ∘ A_j = δ_ij A_i`; `⟨E_i, E_j⟩ = tr(E_i E_j)` as `E_j` is symmetric), with
   `⟨A_i, A_i⟩ = |X| v_i > 0` (classes are nonempty) and `⟨E_j, E_j⟩ = m_j > 0`. Hence the
   orthogonal projection of a matrix `M` onto the algebra is
   `M̂ = ∑_i ⟨A_i, M⟩/(|X| v_i) A_i = ∑_j ⟨E_j, M⟩/m_j E_j`.
2. *From matrices to the program.* Let `B` be feasible for `ϑ′(G_R)` and `a_i = ⟨A_i, B⟩`. Then
   `a_0 = tr B = 1`, `a_i ≥ 0`, `a_i = 0` for `i ∈ R \ {0}` (`B` vanishes on the edges), and
   `∑_i a_i = ∑_(x, y) B_xy`. The eigenvalue of `B̂` on the column space of `E_j` is
   `⟨E_j, B⟩/m_j = tr(E_j B E_j)/m_j ≥ 0` (Mathlib
   `Matrix.PosSemidef.dotProduct_mulVec_nonneg` on the columns of `E_j`), and by step 1 and
   `m_j P_ji = v_i Q_ij` it also equals `(aQ)_j/(|X| m_j)`. So `a` is feasible with the same
   objective.
3. *From the program to matrices.* For feasible `a`, `B = |X|⁻¹ ∑_i (a_i/v_i) A_i` is entrywise
   nonnegative, has trace `a_0 = 1`, vanishes on the edges of `G_R` and has entry sum `∑_i a_i`;
   its eigenvalue on the column space of `E_j` is `|X|⁻¹ ∑_i (a_i/v_i) P_ji = (aQ)_j/(|X| m_j) ≥ 0`,
   so it is positive semidefinite.
4. *Attainment.* The program is feasible (`a = e_0`, with `(e_0 Q)_j = m_j`), and its feasible set
   is compact: from `QP = |X| I` and `P_j0 = 1`, `∑_j Q_ij = |X| δ_i0`, so
   `∑_i a_i = (aQ)_0 ≤ ∑_j (aQ)_j = |X|`. Mathlib's `IsCompact.exists_isMaxOn` gives a maximiser,
   and by steps 2 and 3 its value is also the greatest value of the semidefinite program.

**Checks.**
- `R = ∅`: both programs have value `|X|` (`B = J/|X|`, `a_i = v_i`). `R` containing every
  nonzero class: value `1`.
- The Petersen graph is class `2` of `J(5, 2)`; for `R = {2}` the value is `4`, the largest
  intersecting family of pairs of a `5`-set.
- The nonnegativity condition is what separates `ϑ′` from `ϑ`: in `H(5, 2)` with `R = {1, 2}`
  (binary codes of length `5` and minimum distance `3`) the program has value `4`, while the
  program of 1.2 has value `16/3`; with `R = {3, 4}` the values are `6` and `8`; in `J(6, 3)` with
  `R = {1}` they are `4` and `5`. The independence numbers are `4`, `6` and `4`.
- Exact rational simplex computations of both programs for every `R` on `H(n, 2)` for `n ≤ 5`,
  `H(2, 3)`, `H(3, 3)`, `J(4, 2)`, `J(5, 2)`, `J(6, 2)`, `J(6, 3)`, `J(7, 2)`, `J(7, 3)` and
  `J(8, 3)`, with the matrix of step 3 built from each optimum, confirm that the independence
  number is at most the value of this program, which is at most the value of the program of 1.2,
  and the eigenvalue formula of step 3.

*Needs:* AssociationSchemes 1.1, 1.2, 2.1 (`adjMat_eq_sum_and_eq_sum_adjMat`), 2.2
(`eigenmatrix_mul_dualEigenmatrix`); Mathlib `SimpleGraph.fromRel`, `Matrix.PosSemidef`,
`Matrix.PosSemidef.dotProduct_mulVec_nonneg`, `IsCompact.exists_isMaxOn`.

### 1.2 `ϑ` is the sign-free program

Prove `isGreatest_lovaszTheta_classGraph`: for a scheme, a family of primitive idempotents and
any `R`, `ϑ(G_R)` is the greatest value of `∑_i a_i` over `a` with `a_0 = 1`, `a_i = 0` for the
nonzero classes of `R` and `aQ ≥ 0`, with no sign condition on the other `a_i`, and this value is
attained (Martin–Tanaka, p. 20, call the program a close variant of Lovász's bound; no opened
source states this form). (Proved here.)

Route. The two programs have the same set of values.

1. *From matrices to the program.* For `B` feasible for `ϑ(G_R)` let `a_i = ⟨A_i, B⟩`. Then
   `a_0 = tr B = 1`, `a_i = 0` for `i ∈ R \ {0}` and `∑_i a_i = ∑_(x, y) B_xy`; since `E_j` is
   `|X|⁻¹ Q_ij` on the pairs of class `i`, `(aQ)_j = |X| ⟨E_j, B⟩ = |X| tr(E_j B E_j) ≥ 0` (Mathlib
   `Matrix.PosSemidef.dotProduct_mulVec_nonneg` on the columns of `E_j`).
2. *From the program to matrices.* For feasible `a`, `B = |X|⁻¹ ∑_i (a_i/v_i) A_i` has trace
   `a_0 = 1`, vanishes on the edges of `G_R`, has entry sum `∑_i a_i`, and has the eigenvalue
   `|X|⁻¹ ∑_i (a_i/v_i) P_ji = (aQ)_j/(|X| m_j) ≥ 0` on the column space of `E_j`
   (`m_j P_ji = v_i Q_ij`), so it is positive semidefinite.
3. *Attainment.* The feasible set contains `e_0` and is compact: `aQ ≥ 0` with
   `∑_j (aQ)_j = |X| a_0 = |X|` (`∑_j Q_ij = |X| δ_i0`, from `QP = |X| I` and `P_j0 = 1`), and
   `a = |X|⁻¹ (aQ) P`. A maximiser (`IsCompact.exists_isMaxOn`) gives the greatest value of the
   set, which by steps 1 and 2 is the supremum `ϑ(G_R)`.

**Checks.**
- `J(6, 3)`, `R = {1}`: the value is `5`, which is Hoffman's ratio bound `20 · 3/(9 + 3)` for the
  Johnson graph `J(6, 3)` (valency `9`, least eigenvalue `−3`), while the program of 1.1 gives `4`.
- `H(5, 2)`, `R = {1, 2}`: the optimum `a = (1, 0, 0, 10/3, 5/3, −2/3)` has a negative
  coordinate, which is how its value `16/3` exceeds the value `4` of 1.1.

*Needs:* AssociationSchemes 1.1, 1.2, 2.1, 2.2; LovaszThetaFunction 1.1 (`lovaszTheta`, copied);
Mathlib `Matrix.PosSemidef.dotProduct_mulVec_nonneg`, `IsCompact.exists_isMaxOn`.

**Remarks.** (a) *Duality.* Delsarte's program has the dual
`min (Qb)_0 = ∑_j m_j b_j` over `b_0 = 1`, `b_j ≥ 0` for `j ≥ 1`, and `(Qb)_i ≤ 0` for the nonzero
classes `i ∉ R`, with the same value, both optima attained (Martin–Tanaka, Theorem 7.2, p. 20).
This is ConvexAnalysisAndDuality 5.3 (`linearProgramming_duality`) for the
standard-form program in the variables `a_i` (`i ∉ R ∪ {0}`) and slacks `s_j = (aQ)_j`,
`j = 1, …, d`, with the equations `∑_i a_i Q_ij − s_j = −m_j` and the cost `−∑_i a_i`: it is
feasible (`a = 0`, `s = m`) and bounded below by `1 − |X|` (a feasible `a` has
`∑_i a_i = (aQ)_0 ≤ ∑_j (aQ)_j = |X|`, as `∑_j Q_ij = |X| δ_i0`); a dual optimum `y`
gives `b = (1, y_1, …, y_d)`, and the value `1 + ∑_j m_j y_j` is `(Qb)_0`. Weak duality is the
chain `∑_i a_i ≤ ∑_j b_j (aQ)_j = ∑_i a_i (Qb)_i ≤ (Qb)_0`. (b) *Comparisons.* `α(G_R) ≤ ϑ′(G_R)`
(the matrix `χχᵀ/|C|` of an independent set `C` is feasible) and `ϑ′ ≤ ϑ` (more constraints);
with LovaszThetaFunction 4.3, for a regular `G_R` with an edge the value of 1.1 is at most
Hoffman's ratio bound, strictly so for `J(6, 3)`, `R = {1}`.

### Examples

`H(5, 2)` with minimum distance `3` (value `4`, attained by a code); the Petersen graph in
`J(5, 2)`; the Johnson graph `J(6, 3)`, where `α = ϑ′ = 4 < ϑ = 5`.

### Dependencies

1.1 and 1.2 use AssociationSchemes 1.1, 1.2, 2.1, 2.2, and 1.2 LovaszThetaFunction 1.1. The
duality remark uses ConvexAnalysisAndDuality 5.3.

## Layer 2: the Hamming scheme

### 2.1 Eigenmatrices and eigenspaces

Define `hammingRel` on the words `ι → α` (`n = |ι|`, `q = |α|`), sending two words to their
Hamming distance in `Fin (n + 1)`, and `juntaSpan t`, the span of the functions on words that
depend on at most `t` coordinates. Prove `hamming_scheme`: for `q ≥ 2`,

- (a) `hammingRel` is a symmetric association scheme with `n` classes;
- (b) there is a family `E` of primitive idempotents with `P_ij = Q_ij = K_j(i)` for all `i`, `j`,
  where `K_j(i)` is Tau Ceti's `TauCeti.krawtchouk q n j i`;
- (c) for that family, the column space of `E_0 + ⋯ + E_t` is `juntaSpan t` for every `t ≤ n`.

(Godsil, §4.4, pp. 38–39, for the scheme as a symmetric power of the one-class scheme;
Martin–Tanaka, Examples 2.2 and 2.4, pp. 4–5, for the scheme and `P_ij/v_j` as a Krawtchouk
polynomial. The identification of (c) is proved here.)

Route.

1. *(a)* Classes are nonempty because `q ≥ 2` gives a word at every distance from a fixed one, and
   symmetric. Permuting the coordinates and permuting the letters separately in each coordinate
   preserves distances and acts transitively on the ordered pairs at each distance, so the counts
   of `card_eq` agree.
2. *(b)* Identify `α` with `ZMod q` (`Fintype.equivFin`; the scheme does not depend on the group
   law) and let `ψ` be Mathlib's `AddChar.primitiveZModChar`. For a word `w` of weight `i`,
   `∑_{wt z = j} ψ(z ⬝ᵥ w) = K_j(i)`: the sum factors over the coordinates and Tau Ceti's
   `TauCeti.coeff_krawtchouk_generating` reads off the coefficient. Let `E_i` be the orthogonal
   projection onto the span of the characters `x ↦ ψ(x ⬝ᵥ w)` with `wt w = i`; its entries are
   `q^(−n) K_i(d(x, y))`, real, so `E_i = q^(−n) ∑_j K_i(j) A_j` lies in the algebra. The characters
   are orthogonal and span all functions, so the `E_i` are complete orthogonal idempotents, nonzero
   (`C(n, i)(q − 1)^i` characters) with `E_0 = J/q^n`. `A_j` acts on a character of weight `i` by
   `K_j(i)`, which is `P_ij`, and the entry formula gives `Q_ij = q^n · q^(−n) K_j(i)`.
3. *(c)* A function of the coordinates in a set `S` is a combination of characters supported in
   `S`, and conversely; real and imaginary parts preserve both spans.

**Checks.**
- `H(2, 2)` is the 4-cycle: `P = Q` with rows `(1, 2, 1)`, `(1, 0, −1)`, `(1, −2, 1)`, as in
  AssociationSchemes 2.1; the column space of `E_0 + E_1` is the `3`-dimensional space of the
  functions `x ↦ g(x_1) + h(x_2)`.
- `juntaSpan 0` is the constants and `juntaSpan n` is every function; the traces of
  `E_0 + ⋯ + E_t` are `∑_{j ≤ t} C(n, j)(q − 1)^j`.
- `n = 0`: one word, `d = 0` and `E_0 = I`; (b) reads `P_00 = Q_00 = K_0(0) = 1`, and (c) says
  that every function on the one word is constant.
- Exact checks of the idempotent formula, `P = Q = K` and the column spaces on `H(1, 2)`,
  `H(2, 2)`, `H(3, 2)`, `H(4, 2)`, `H(2, 3)`, `H(3, 3)`, `H(2, 4)`.

*Needs:* AssociationSchemes 1.1, 1.2, 2.1; Tau Ceti `TauCeti.krawtchouk`,
`TauCeti.coeff_krawtchouk_generating`; Mathlib `hammingDist`, `hammingDist_le_card_fintype`,
`AddChar.primitiveZModChar`, `Fintype.equivFin`, `Matrix.toLin'`.

### 2.2 `ϑ′` of the Hamming graphs and the Krawtchouk certificates

Prove `isLeast_thetaPrime_hamming`: for `q ≥ 2` and every `δ ≥ 1`, `ϑ′` of the graph joining
distinct words at distance less than `δ` is the least value `f(0)/f_0` over the certificates of
BoundsOnCodes 5.2: `f = ∑_k f_k K_k` with `f_0 > 0`, `f_k ≥ 0` for `1 ≤ k ≤ n` and `f(i) ≤ 0` for
`δ ≤ i ≤ n`, where `f(i) = ∑_k f_k K_k(i)`; the least value is attained. (Vallentin, §4.2,
pp. 17–18, for the binary case, written there as the minimum of `1 + ∑_k f_k K_k(0)` under
`∑_k f_k K_k(i) ≤ −1`. The `q`-ary form is proved here.)

Route.

1. *The primal program.* By 1.1 and 2.1(b), `ϑ′(G)` is the greatest value of Delsarte's program
   with `Q_ij = K_j(i)` and `R` the classes `1, …, δ − 1` (every nonzero class when `δ > n`).
2. *Duality.* By the duality remark of Layer 1, which derives it in full from
   ConvexAnalysisAndDuality 5.3, this value is the least `(Qb)_0 = ∑_k b_k K_k(0)` over `b_0 = 1`,
   `b_k ≥ 0` for `k ≥ 1` and `∑_k b_k K_k(i) ≤ 0` for `δ ≤ i ≤ n`, and it is attained.
3. *Scaling.* A certificate `f` gives `b = f/f_0` with the same value `f(0)/f_0`, and every such
   `b` is a certificate with `f_0 = 1`.

**Checks.**
- `H(5, 2)`: the values for `δ = 1, …, 6` are `32, 16, 4, 8/3, 2, 1`, computed in exact arithmetic
  from both programs.
- `δ > n`: the graph is complete, `ϑ′ = 1`, and the least certificate value is `1`, attained by
  `f = (1, 0, …, 0)` (every `K_k(0)` is positive).
- `δ = 0` is excluded for a reason: the constraint at `i = 0` forces `f(0) ≤ 0`, so every
  certificate value is at most `0`, while `ϑ′` of the edgeless graph is `q^n`.

*Needs:* 1.1, 2.1, the duality remark of Layer 1 and ConvexAnalysisAndDuality 5.3
(`linearProgramming_duality`); BoundsOnCodes 5.2 (the hypotheses of `card_mul_le_of_krawtchouk`,
which define the certificates); Tau Ceti `TauCeti.krawtchouk`.

### Examples

`H(3, 2)` (the cube), `H(2, 3)` (the `3 × 3` rook graph), `H(5, 2)`; the even-weight code and the
`[7, 4]` Hamming code of Layer 3.

### Dependencies

2.1 uses AssociationSchemes 1.1, 1.2 and 2.1; 2.2 uses 1.1, 2.1, ConvexAnalysisAndDuality 5.3 and
the certificates of BoundsOnCodes 5.2.

## Layer 3: designs in the Johnson and Hamming schemes

### 3.1 Delsarte designs are combinatorial designs and orthogonal arrays

Define `IsDesign rel E t Y`: `(aQ)_j = 0` for every `j` with `1 ≤ j ≤ t`, where `a` is the inner
distribution of `Y` (Martin–Tanaka, §5, the definition of `T`-designs after (10), p. 15). By
AssociationSchemes 4.1 this says `E_j χ_Y = 0` for those `j`. Prove

- `isDesign_johnson_iff`: for `2k ≤ n`, `t ≤ k`, the Johnson scheme with its idempotents in the
  standard order and any family `Y` of `k`-subsets of `Fin n`, `Y` is a Delsarte `t`-design exactly
  when every `t`-subset lies in the same number of members of `Y`;
- `isDesign_hamming_iff`: for `q ≥ 2`, `t ≤ n`, the Hamming scheme with its idempotents in the
  order of 2.1 and any set `Y` of words, `Y` is a Delsarte `t`-design exactly when it is an
  orthogonal array of strength `t`: for every set `S` of `t` coordinates, every pattern of letters
  on `S` occurs in the same number of words of `Y`.

(Martin–Tanaka, Examples 5.1 and 5.2, pp. 15–16, stated there for `1 < |Y| < |X|` and attributed
to Delsarte; the route is complete and covers every `Y`. (Proved here.))

Route. `Y` is a `t`-design exactly when `(E_0 + ⋯ + E_t) χ_Y = E_0 χ_Y`, that is when
`χ_Y − E_0 χ_Y` is orthogonal to the column space `U_t` of `E_0 + ⋯ + E_t`.

1. *Johnson.* `U_t` is spanned by the `containsVec k T`, `|T| = t`, and
   `⟨χ_Y, containsVec k T⟩ = #{B ∈ Y | T ⊆ B}`, while `⟨E_0 χ_Y, containsVec k T⟩` is
   `|Y| C(n − t, k − t)/C(n, k)`, the same for every `T`. So a design has constant counts.
   Conversely, if every `t`-set lies in `c` members, counting pairs gives
   `c C(n, t) = |Y| C(k, t)`, and `C(k, t) C(n, k) = C(n, t) C(n − t, k − t)` gives the value
   above.
2. *Hamming.* For `t ≤ n`, `U_t` is spanned by the indicators of the cylinders
   `{x | x_i = u_i for i ∈ S}` with `|S| = t` (a set of fewer coordinates is enlarged to `t`). The
   inner product of `χ_Y` with such an indicator is the number of words of `Y` with pattern `u` on
   `S`, and that of `E_0 χ_Y` is `|Y|/q^t`; the counts over the `q^t` patterns sum to `|Y|`, so they
   are constant exactly when they all equal `|Y|/q^t`.

**Checks.**
- The Fano plane in `J(7, 3)` has inner distribution `(1, 0, 6, 0)` and `aQ = (7, 0, 0, 28)`: a
  `2`-design, as every pair of points lies in one line, and not a `3`-design. The `15` triples
  through a point have `aQ = (15, 20, 0, 0)`: not a `1`-design, as the point lies in `15` of them
  and the others in `5`.
- The `[7, 4]` Hamming code in `H(7, 2)` has `aQ = (16, 0, 0, 0, 112, 0, 0, 0)`: an orthogonal
  array of strength `3`, not `4`. The even-weight code `{000, 011, 101, 110}` has
  `aQ = (4, 0, 0, 4)`: strength `2`.
- `t ≤ k` is needed: in `J(4, 2)` a single pair is a combinatorial `3`-design (no `3`-set lies in
  any pair) but not a Delsarte `3`-design, since `(aQ)_1 = m_1 = 3`. Likewise `t ≤ n` in the
  Hamming case: a single word satisfies the array condition vacuously for `t = n + 1`.
- `t = 0`: both sides hold for every `Y`. `Y = ∅`: the inner distribution is `0` and both sides
  hold.
- Both equivalences were checked for every subset and every `t` on `J(4, 1)`, `J(4, 2)`, `J(5, 1)`,
  `J(5, 2)`, `J(6, 1)`, `J(6, 2)`, `H(1, 2)`, `H(2, 2)`, `H(3, 2)`, `H(4, 2)`, `H(1, 3)`, `H(2, 3)`,
  and on `7377` families in `J(7, 3)` and `1551` in `J(6, 3)`.

*Needs:* AssociationSchemes 1.1, 1.2, 4.1 (`sum_innerDistribution_mul_dualEigenmatrix_nonneg`),
5.1 (`johnson_eigenmatrix` for the scheme property, `johnsonRel`, `containsVec`); 2.1
(`hamming_scheme` (a) for the scheme property, `juntaSpan`); Mathlib `Nat.choose`, `Matrix.toLin'`.

### Examples

Combinatorial designs: the Fano plane, the trivial designs (all `k`-sets). Orthogonal arrays: the
even-weight code, the `[7, 4]` Hamming code, the whole space.

### Dependencies

3.1 uses AssociationSchemes 4.1 and 5.1 and 2.1 (the Hamming scheme and `juntaSpan`).

## Layer 4: cometric schemes

### 4.1 Cometric schemes; the Johnson and Hamming schemes

Define `IsCometric rel E`: `q^k_(1j) = 0` whenever `k > j + 1`, and `q^(j+1)_(1j) ≠ 0` for every
`j < d`. This is the Krein-parameter form of Martin–Tanaka's definition (§4, p. 9: `Q_ji` is a
polynomial of degree `i` in `Q_j1`), which prints the vanishing condition with the inequality
reversed (`i + j > k` for `k > i + j`); Godsil (§2.4, p. 19) defines it through the Schur
powers of `E_1`. Prove

- `isCometric_johnson`: for `2k ≤ n`, the Johnson scheme with its idempotents in the standard order
  is cometric;
- `isCometric_hamming`: for `q ≥ 2`, the Hamming scheme with its idempotents in the order of 2.1
  is cometric

(Martin–Tanaka, §4, p. 9, and Godsil, §2.4, p. 19, name both families as cometric. (Proved
here.))

Route. Write `V_t` for the column space of `E_0 + ⋯ + E_t` and `∘` for the entrywise product.

1. *Krein parameters and products* (Godsil, Lemmas 2.4.3 and 2.4.4, pp. 19–20, proved here). By
   AssociationSchemes 2.1, `q^k_ij = (|X|/m_k) ∑_(x, y) (E_i)_xy (E_j)_xy (E_k)_xy`, and this sum
   is the squared norm of the tensor `τ_abc = ∑_z (E_i)_az (E_j)_bz (E_k)_cz`. So `q^k_ij = 0`
   forces `τ = 0`, hence `E_k (E_i u ∘ E_j w) = 0` for all vectors `u`, `w`; conversely that
   vanishing for all `u`, `w` gives `q^k_ij = 0` (take `u = w = e_y` and sum the diagonal).
2. *A criterion.* If `V_1 ∘ V_j ⊆ V_(j+1)` and `V_(j+1)` lies in the span of `V_1 ∘ V_j` for every
   `j < d`, the scheme is cometric: the first inclusion and step 1 give `q^k_(1j) = 0` for
   `k > j + 1`; if `q^(j+1)_(1j)` were `0`, then `E_(j+1)` would kill every `E_a u ∘ E_b w` with
   `a ≤ 1`, `b ≤ j` (for `a = 0` the factor is constant, for `a = 1` use `q^(j+1)_(1b) = 0`), hence
   all of `V_(j+1)`, which contains the nonzero column space of `E_(j+1)`.
3. *Johnson.* `containsVec k T ∘ containsVec k T′ = containsVec k (T ∪ T′)`, and every
   `(j + 1)`-set is `T ∪ {a}` with `|T| = j`.
4. *Hamming.* The product of a function of the coordinates in `S` and one of those in `S′`
   depends only on `S ∪ S′`; and a function of `j + 1` coordinates `S ∪ {a}` is a sum of products
   `g(x_a) h(x_S)`.

**Checks.**
- `J(5, 2)`: `(q^0_11, q^1_11, q^2_11) = (4, 2/9, 20/9)` (AssociationSchemes 3.1), so
  `q^2_11 ≠ 0`. `H(3, 2)`: `(q^0_11, q^1_11, q^2_11, q^3_11) = (3, 0, 2, 0)`, where the zero
  `q^3_11` is required and `q^2_11 = 2` is the nonzero one.
- The order matters: among the orders of the nontrivial idempotents, exactly the following are
  cometric (exact Krein parameters): `J(4, 2)`, `J(7, 3)`, `J(8, 3)`, `H(n, 2)` for `n = 2, 3, 5`
  and `H(3, 3)` only the standard one; `J(6, 3)` also `3, 2, 1`; `H(4, 2)` also `3, 2, 1, 4`;
  `J(5, 2)`, `J(6, 2)`, `J(7, 2)` and `H(2, 3)` both orders.
- A scheme that is not cometric for a given order: the complete bipartite graph `K_{3,3}` with
  classes "other side" and "same side" has `P` rows `(1, 3, 2)`, `(1, −3, 2)`, `(1, 0, −1)`,
  multiplicities `(1, 1, 4)`, and is cometric only with the two nontrivial idempotents exchanged.
- In both families with the standard order, `q^k_ij = 0` for all `k > i + j`, and the values
  `Q_i1` are distinct (exact computation on the schemes above).

*Needs:* AssociationSchemes 1.1, 1.2, 2.1, 3.1 (`kreinParam`); 2.1 (`hamming_scheme` (a) and the
order of the Hamming idempotents); AssociationSchemes 5.1 (`johnson_eigenmatrix`, `containsVec`).

### 4.2 The Fisher-type and absolute bounds

Prove

- `sum_trace_le_card_of_isDesign`: in a cometric scheme, a nonempty Delsarte `2e`-design `Y` has
  `m_0 + m_1 + ⋯ + m_e ≤ |Y|` (sum over the `j ≤ min(e, d)`);
- `card_le_sum_trace_of_degree`: in a cometric scheme, if the pairs of distinct points of `Y` fall
  into at most `s` classes, then `|Y| ≤ m_0 + m_1 + ⋯ + m_s`

(Martin–Tanaka, Theorem 5.4, (16), p. 16, in terms of the dual distance and the degree, attributed
to Delsarte; MT's standing hypothesis `1 < |Y| < |X|` is not needed. The route is complete.
(Proved here.))

Route. Write `V_t` for the column space of `E_0 + ⋯ + E_t` (everything for `t ≥ d`) and `∘` for
the entrywise product.

1. *Krein parameters and products* (Godsil, Lemmas 2.4.3 and 2.4.4, pp. 19–20; the short
   argument is repeated here). From the definitions of `Q` and `kreinParam`,
   `q^k_ij = (|X|/m_k) ∑_(x, y) (E_i)_xy (E_j)_xy (E_k)_xy`, and this sum is the squared norm of the
   tensor `τ_abc = ∑_z (E_i)_az (E_j)_bz (E_k)_cz` (the `E_i` are symmetric idempotents). So
   `q^k_ij = 0` forces `τ = 0`, that is `E_k (E_i u ∘ E_j w) = 0` for all vectors `u`, `w`.
2. *Polynomial structure.* Evaluating `E_1 ∘ E_j = |X|⁻¹ ∑_k q^k_(1j) E_k` (AssociationSchemes 3.1)
   on a pair of class `l` gives `Q_l1 Q_lj = ∑_k q^k_(1j) Q_lk`; with the cometric conditions,
   induction on `j` shows `Q_lj = p_j(Q_l1)` for a polynomial `p_j` of degree `j`. Since `Q` is
   invertible (AssociationSchemes 2.2), the values `θ_l = Q_l1` are distinct, and comparing
   `p_i p_j` with `Q_li Q_lj = ∑_k q^k_ij Q_lk` gives `q^k_ij = 0` for `k > i + j`. By step 1,
   `E_k` kills `E_i u ∘ E_j w` for `k > i + j`, so `V_i ∘ V_j ⊆ V_(i+j)`.
3. *Fisher-type bound.* Restriction to `Y` is injective on `V_e`: if `f ∈ V_e` vanishes on `Y`,
   then `g = f ∘ f ∈ V_(2e)`, so `g = ∑_(l ≤ 2e) E_l g` and, as `E_l χ_Y = 0` for `1 ≤ l ≤ 2e`,
   `0 = ⟨χ_Y, g⟩ = ⟨E_0 χ_Y, g⟩ = (|Y|/|X|) ∑_x f(x)²`; since `Y ≠ ∅`, `f = 0`. The dimension of
   `V_e` is the trace of `E_0 + ⋯ + E_e`, that is `m_0 + ⋯ + m_e`.
4. *Absolute bound.* Let `S` be the set of nonzero classes met by pairs of `Y`, `|S| ≤ s`. For
   `y ∈ Y` the entrywise product `F_y = ∏_(i ∈ S) (|X| E_1 e_y − θ_i 𝟙)/(θ_0 − θ_i)` has value
   `∏_(i ∈ S) (θ_(rel x y) − θ_i)/(θ_0 − θ_i)` at `x`: `1` at `y` and `0` at the other points of
   `Y`. By step 2 it lies in `V_s`, and the `F_y` are independent on `Y`, so
   `|Y| ≤ dim V_s = m_0 + ⋯ + m_s`.

**Checks.**
- Tight cases: the Fano plane in `J(7, 3)` is a `2`-design with `7 = m_0 + m_1 = 1 + 6`; the
  even-weight code in `H(3, 2)` is a `2`-design with one distance and `4 = m_0 + m_1 = 1 + 3`.
- The cometric hypothesis is needed for the absolute bound: in `K_{3,3}` with the order of 4.1's
  Check (multiplicities `1, 1, 4`, a scheme with primitive idempotents that is not cometric), one
  side of the bipartition meets one class and has `3 > m_0 + m_1 = 2` points.
- Nonemptiness is needed for the Fisher-type bound: `∅` is a `2e`-design for every `e`, while
  `m_0 = 1`.
- Both bounds hold for every subset of `J(4, 2)`, `J(5, 2)`, `J(6, 2)`, `H(2, 2)`, `H(3, 2)`,
  `H(4, 2)`, `H(2, 3)` and on the families of 3.1's Checks (exact computation).

*Needs:* 4.1 (`IsCometric`); 3.1 (`IsDesign`); AssociationSchemes 1.2, 2.1, 2.2, 3.1
(`hadamard_eq_sum_kreinParam`), 4.1.

### 4.3 The dual eigenvalues of the Johnson scheme are Hahn polynomials

Prove `dualEigenmatrix_johnson_eq_hahn`: for `2k ≤ n` and the Johnson scheme with its idempotents
in the standard order, `Q_ij = m_j · Q_j(i; k − n − 1, −k − 1, k)` for all `i, j ≤ k`, where
`Q_j(x; α, β, N) = hahn N j α β x` is the Hahn polynomial `₃F₂(−j, j + α + β + 1, −x; α + 1, −N; 1)`
of SpecialFunctionsClebschGordan 4.1, copied verbatim (Martin–Tanaka, Example 2.3, p. 5, which
gives `P_ij/v_j = ₃F₂(−i, −j, i − n − 1; k − n, −k; 1)` with their `n` for our `k` and `v` for our
`n`; with `m_i P_ij = v_j Q_ji` this is the statement). The route below is complete. (Proved here.)

Route.

1. *Polynomials in the class index.* By AssociationSchemes 5.1 (the family is the one there, by
   the Conventions), `P_1i = eberlein n k i 1`, and with `v_i = C(k, i) C(n − k, i)` and
   `m_1 P_1i = v_i Q_i1`, `Q_i1/m_1 = 1 − i n/(k(n − k))` for `k ≥ 1`, an affine function of `i`
   with nonzero slope. By 4.1, `Q_ij/m_j` is a polynomial of degree exactly `j` in `i`, equal to
   `1` at `i = 0`: evaluating `E_1 ∘ E_j = |X|⁻¹ ∑_l q^l_(1j) E_l` (AssociationSchemes 3.1) on a
   pair of class `i` gives `Q_i1 Q_ij = ∑_l q^l_(1j) Q_il`, where only `l ≤ j + 1` contribute and
   `q^(j+1)_(1j) ≠ 0`, so induction on `j` expresses `Q_i(j+1)` as `Q_i1` times a polynomial of
   degree `j` in `i` plus terms of lower degree.
2. *Orthogonality.* From `PQ = |X| I` (AssociationSchemes 2.2) and `m_i P_ij = v_j Q_ji`,
   `∑_i v_i Q_ij Q_il = |X| m_j δ_jl`.
3. *Hahn polynomials.* With `α = k − n − 1`, `β = −k − 1`, `N = k`, the weight of
   SpecialFunctionsClebschGordan 4.2 is `(α + 1)_x (β + 1)_(k−x)/(x! (k − x)!) = (−1)^k v_x`, and
   the hypotheses `(α + 1)_j ≠ 0` of `sum_hahn_mul_hahn` hold for `j ≤ k` (the factors run from
   `k − n` to `j + k − n − 1 < 0`). That theorem states the weighted sum of
   `hahn k j α β · hahn k l α β` multiplied by `2j + α + β + 1 = 2j − n − 1`, which is negative for
   `j ≤ k` because `2k ≤ n`; dividing by it, the `hahn k j α β` are orthogonal for this weight.
   Each has degree exactly `j` in `x` (its leading coefficient has the nonzero factor
   `(j − n − 1)_j`) and value `1` at `x = 0`.
4. *Uniqueness.* On functions on `{0, …, k}` the form `∑_x v_x f(x) g(x)` is positive definite; the
   functions of degree at most `j` that are orthogonal to all of degree less than `j` form a line,
   and both families lie on it with the same value at `0`.

**Checks.**
- `J(5, 2)`: `Q` has rows `(1, 4, 5)`, `(1, 2/3, −5/3)`, `(1, −8/3, 5/3)` (AssociationSchemes 2.1).
  With `α = −4`, `β = −3`, `N = 2`, `Q_1(x) = 1 − (α + β + 2)x/((α + 1)N) = 1 − 5x/6`, and
  `m_1 Q_1(1) = 4 · 1/6 = 2/3 = Q_11`. With `α` and `β` exchanged, `Q_1(1) = −1/4` and the value
  would be `−1`: the parameters are not symmetric.
- The identity was checked in exact arithmetic for every `J(n, k)` with `2k ≤ n ≤ 8`, against the
  copied definition of `hahn`, evaluated at `x = i`, the class index; evaluating at `k − i`
  instead fails for every `k ≥ 1`.

*Needs:* 4.1; AssociationSchemes 2.2, 3.1 (`hadamard_eq_sum_kreinParam`), 5.1
(`johnson_eigenmatrix`); SpecialFunctionsClebschGordan 4.1 (`hahn`, copied) and 4.2
(`sum_hahn_mul_hahn`).

### Examples

`J(5, 2)` and `J(7, 3)` with their Krein parameters; `H(3, 2)`; `K_{3,3}` as a non-example. The
Fisher-type and absolute bounds in the two families: in `J(n, k)` (`2k ≤ n`), by
AssociationSchemes 5.1 `m_0 + ⋯ + m_e = C(n, e)`, so a nonempty `2e`-design with `e ≤ k` has at
least `C(n, e)` blocks (Ray-Chaudhuri and Wilson; Fisher's inequality `b ≥ n` for `e = 1`), and a
family of `k`-sets with `s ≤ k` intersection sizes has at most `C(n, s)` members, which is the
Ray-Chaudhuri–Wilson case of LinearAlgebraMethodInCombinatorics 2.2
(`card_le_sum_choose_of_card_mem`), not restated. In `H(n, q)`, `m_j = C(n, j)(q − 1)^j` (2.1), so
an orthogonal array of strength `2e` has at least `∑_(j ≤ e) C(n, j)(q − 1)^j` words (Rao's bound),
and a code with `s` distances at most `∑_(j ≤ s) C(n, j)(q − 1)^j` words.

### Dependencies

4.1 uses AssociationSchemes 2.1, 3.1, 5.1 and 2.1 above; 4.2 uses 4.1, 3.1 and AssociationSchemes
2.2, 3.1, 4.1; 4.3 uses 4.1, AssociationSchemes 2.2, 3.1, 5.1 and SpecialFunctionsClebschGordan
4.1–4.2.

## Layer 5: designs and few-distance sets on the sphere

### 5.1 The Delsarte–Goethals–Seidel bounds

Let `E` be a real inner product space of dimension `n`. Prove

- `multichoose_add_multichoose_le_card`: for `e ≥ 1`, a spherical `2e`-design `Y` on the unit
  sphere (`IsSphericalDesign (2 * e) Y 1`) has `C(n + e − 1, e) + C(n + e − 2, e − 1) ≤ |Y|`;
- `card_le_multichoose_add_multichoose`: a set `Y` of unit vectors whose distinct members have
  inner products in a set of at most `s` reals has
  `|Y| ≤ C(n + s − 1, s) + C(n + s − 2, s − 1)` (read as `multichoose n s + multichoose n (s − 1)`)

(the first is the Delsarte–Goethals–Seidel bound, stated as `D(n, 2k)` in
Boyvalenkov–Dragnev–Hardin–Saff–Stoyanova, §2.2, (6), p. 4, with the authors' attribution; no
opened source proves either bound, and the route below is complete and differs from the
linear-programming proof of the original. (Proved here.))

Route. Fix an orthonormal basis (Mathlib `stdOrthonormalBasis`), so that `E` is
`EuclideanSpace ℝ (Fin n)`; for `n = 0` the unit sphere is empty and both claims are immediate.

1. *Polynomials.* `polynomialsOfDegreeLE E t` is the space of functions given by real polynomials
   of total degree at most `t` in the coordinates (LatticePackingsAndPerfectForms 5.1 plans this
   identification; its short proof is kept here): a power `⟪a, x⟫^k` expands into monomials of
   degree `k`, and conversely the coefficient vectors of `(∑_i a_i x_i)^k`, as `a` runs over `ℝⁿ`,
   span all homogeneous polynomials of degree `k`, since the monomial functions `a ↦ a^β` are
   independent. In particular products of functions of degrees `≤ s` and `≤ t` have degree
   `≤ s + t`.
2. *Dimension on the sphere.* On the unit sphere `∑_i x_i² = 1` (Tau Ceti
   `MvPolynomial.sphereEval_normSq`), so the restriction of a polynomial of degree `≤ t`, `t ≥ 1`,
   is that of `h_t + h_(t−1)` with `h_r` homogeneous of degree `r`. If `h_t + h_(t−1)` vanishes on
   the sphere, so does `h_t − h_(t−1)` (apply `x ↦ −x`), hence each part, and each part is `0` by
   Tau Ceti's `MvPolynomial.IsHomogeneous.eq_zero_of_sphereEval_eq_zero`. So the restrictions form a
   space of dimension `multichoose n t + multichoose n (t − 1)` (Tau Ceti
   `TauCeti.finrank_homogeneousSubmodule_eq_multichoose`).
3. *Design bound.* If `f` of degree `≤ e` vanishes on `Y`, then `f²` has degree `≤ 2e` and average
   `0` on `Y`, hence its average on the sphere is `0`. The normalised measure gives positive mass to
   every nonempty relatively open subset of the sphere (Mathlib
   `MeasureTheory.Measure.toSphere_apply'` expresses it through the Lebesgue measure of a cone, and
   `IsOpen.measure_pos`), and `f²` is continuous and nonnegative, so `f = 0` on the sphere.
   Restriction to `Y` is therefore injective on the space of step 2 with `t = e`.
4. *Absolute bound.* For `y ∈ Y` let `F_y(x) = ∏_(a ∈ A, a ≠ 1) (⟪x, y⟫ − a)/(1 − a)`, of degree at
   most `s`; it is `1` at `y` and `0` at the other points of `Y` (distinct unit vectors have inner
   product less than `1`). The `F_y` are independent on `Y`, so `|Y|` is at most the dimension of
   step 2 with `t = s` when `s ≥ 1`; for `s = 0`, `|Y| ≤ 1`.

**Checks.**
- Tight cases of the design bound: the regular pentagon in `ℝ²` is a `4`-design (exact moments)
  with `5 = C(3, 2) + C(2, 1)`; the equilateral triangle is a `2`-design with
  `3 = C(2, 1) + C(1, 0)`; the regular tetrahedron in `ℝ³` is a `2`-design with
  `4 = C(3, 1) + C(2, 0)`.
- Non-tight: the octahedron (the `6` points `±e_i` of `ℝ³`) is a `3`-design, not a `4`-design, and
  `6 ≥ 4`; the icosahedron is a `5`-design with `12 ≥ C(4, 2) + C(3, 1) = 9`.
- `n = 1`: the sphere is `{−1, 1}`, every design is `{−1, 1}`, and the bound is
  `multichoose 1 e + multichoose 1 (e − 1) = 2`.
- `e ≥ 1` is needed: a single unit vector is a `0`-design, while the formula at `e = 0` reads
  `multichoose n 0 + multichoose n 0 = 2` (natural subtraction).
- The dimension of step 2 was confirmed for `1 ≤ n ≤ 4`, `1 ≤ e ≤ 4` by the exact rank of the
  matrix of monomials of degree `≤ e` evaluated at rational points of the sphere.
- Absolute bound: the vertices of a regular simplex form a set with one inner product and
  `n + 1 = C(n, 1) + C(n − 1, 0)` points; the cross-polytope has inner products `0, −1` and
  `2n ≤ C(n + 1, 2) + n` points.

*Needs:* LatticePackingsAndPerfectForms 5.1 (`polynomialsOfDegreeLE`, `IsSphericalDesign`,
copied); Tau Ceti `MvPolynomial.sphereEval`, `MvPolynomial.sphereEval_normSq`,
`MvPolynomial.IsHomogeneous.eq_zero_of_sphereEval_eq_zero`,
`TauCeti.finrank_homogeneousSubmodule_eq_multichoose`; Mathlib `stdOrthonormalBasis`,
`MeasureTheory.Measure.toSphere_apply'`, `IsOpen.measure_pos`, `Nat.multichoose`.

### Examples

The regular polygons in `ℝ²`, the regular simplex, the octahedron, the icosahedron.

### Dependencies

5.1 uses LatticePackingsAndPerfectForms 5.1 and the Tau Ceti library only; the dimension argument
mirrors 4.2.

## Scope and ownership

This roadmap owns Schrijver's identification of `ϑ′` with Delsarte's linear-programming bound and
of `ϑ` with its sign-free form on every symmetric scheme; the Hamming scheme as a scheme, with its
eigenmatrices, its eigenspaces and the identification of the Krawtchouk certificates with `ϑ′`;
Delsarte designs and their identification with combinatorial designs and orthogonal arrays; the
definition of cometric schemes, the cometric property of the Johnson and Hamming schemes, the
Fisher-type and absolute bounds in cometric schemes and the Hahn form of the Johnson `Q`-matrix;
and the Delsarte–Goethals–Seidel lower bound for spherical designs with the absolute bound for
few-distance sets on the sphere.

It builds on AssociationSchemes, whose Bose–Mesner algebra, eigenmatrices, Krein parameters,
Delsarte inequalities (4.1) and Johnson scheme (5.1) it uses, and whose scope leaves out the full
linear-programming bound as an optimisation over a scheme, cometric schemes beyond their
definition, and designs in schemes; nothing of it is restated. It proves the
identification of the variant `ϑ′` that LovaszThetaFunction leaves out, and copies that roadmap's
`lovaszTheta`. ConvexAnalysisAndDuality 5.3 supplies linear-programming duality; the dual of
Delsarte's program is the remark in Layer 1, not a target. SpecialFunctionsClebschGordan 4.1–4.2
supplies the Hahn polynomials and their orthogonality, and LatticePackingsAndPerfectForms 5.1 the
spherical designs, which that roadmap studies through lattice shells and Venkov's theorem without a
cardinality bound.

Not restated: AssociationSchemes 4.1–4.3, 5.1 and 5.2; BoundsOnCodes 5.1 and 5.2 (Delsarte's
inequalities and the linear-programming bound for codes, proved there by characters; 2.2 above
says its certificates are exactly the dual of the scheme program and attain `ϑ′`); Tau Ceti's
MacWilliams identity `TauCeti.natCard_mul_weightDistribution_euclideanDual`, the `Q`-transform of
2.1 for linear codes; LovaszThetaFunction 2.1 and 4.3; the Ray-Chaudhuri–Wilson theorem of
LinearAlgebraMethodInCombinatorics 2.2, which is the Johnson instance of the absolute bound.
SphericalCodesAndKissingNumbers owns the Delsarte–Goethals–Seidel linear-programming bound for
spherical codes and the kissing numbers, EquiangularLinesAndTwoGraphs the absolute and relative
bounds for equiangular lines, LinearAlgebraMethodInCombinatorics 3.1 Blokhuis's bound for
two-distance sets in Euclidean space, StronglyRegularAndMooreGraphs 1.5 Seidel's absolute bound
for strongly regular graphs, and SpectralGraphBounds 3.2 Hoffman's ratio bound; these are
different statements and none is used.

Outside the scope: commutative nonsymmetric schemes; Neumaier's absolute bound on the multiplicities
of a scheme (the absolute bound of 4.2 bounds a subset); tight designs and the structure of codes
attaining the bounds; the odd-strength design bound on the sphere; Delsarte's theory of `T`-designs
in regular semilattices beyond the two families; semidefinite bounds stronger than `ϑ′` (Schrijver's
Terwilliger-algebra bounds); and every procedure for solving the programs.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Combinatorics/SimpleGraph/Basic.lean`: `SimpleGraph.fromRel` (symmetrize a relation and
  remove the diagonal).
- `Mathlib/LinearAlgebra/Matrix/PosDef.lean`: `Matrix.PosSemidef`,
  `Matrix.PosSemidef.dotProduct_mulVec_nonneg` (`0 ≤ star x ⬝ᵥ M *ᵥ x`).
- `Mathlib/Topology/Order/Compact.lean`: `IsCompact.exists_isMaxOn` (a continuous function on a
  nonempty compact set attains its maximum).
- `Mathlib/InformationTheory/Hamming.lean`: `hammingDist`, `hammingDist_le_card_fintype`.
- `Mathlib/NumberTheory/LegendreSymbol/AddCharacter.lean`: `AddChar.primitiveZModChar` (a
  primitive additive character of `ZMod q`); `Mathlib/Data/Fintype/EquivFin.lean`:
  `Fintype.equivFin`.
- `Mathlib/LinearAlgebra/Matrix/ToLin.lean`: `Matrix.toLin'`; `Mathlib/RingTheory/Idempotents.lean`:
  `CompleteOrthogonalIdempotents`.
- `Mathlib/Data/Nat/Choose/Basic.lean`: `Nat.multichoose`, `Nat.multichoose_eq`
  (`multichoose n k = C(n + k − 1, k)`), `Nat.choose`.
- `Mathlib/RingTheory/Polynomial/Pochhammer.lean`: `ascPochhammer`.
- `Mathlib/Analysis/InnerProductSpace/PiL2.lean`: `stdOrthonormalBasis`, `EuclideanSpace`.
- `Mathlib/MeasureTheory/Constructions/HaarToSphere.lean`: `MeasureTheory.Measure.toSphere`,
  `MeasureTheory.Measure.toSphere_apply'` (the sphere measure of a measurable set is `dim E` times
  the measure of the cone over it inside the unit ball);
  `Mathlib/MeasureTheory/Measure/OpenPos.lean`: `IsOpen.measure_pos`.

### From Tau Ceti

- `TauCeti/InformationTheory/Coding/Krawtchouk.lean`: `TauCeti.krawtchouk q n w j` (the value
  `K_w(j) = ∑_a (−1)^a (q − 1)^(w−a) C(j, a) C(n − j, w − a)`, degree index first),
  `TauCeti.coeff_krawtchouk_generating` (`K_w(j)` is the coefficient of `z^w` in
  `(1 + (q − 1) z)^(n−j) (1 − z)^j`); `TauCeti.natCard_mul_weightDistribution_euclideanDual`
  (named in the scope only).
- `TauCeti/Analysis/MvPolynomial/Sphere.lean`: `MvPolynomial.sphereEval`,
  `MvPolynomial.sphereEval_normSq`, `MvPolynomial.IsHomogeneous.eq_zero_of_sphereEval_eq_zero`
  (on a nonempty variable type, a homogeneous polynomial vanishing on the unit sphere is `0`).
- `TauCeti/RingTheory/MvPolynomial/Finrank.lean`:
  `TauCeti.finrank_homogeneousSubmodule_eq_multichoose` (the homogeneous polynomials of degree `e`
  in `n` variables have dimension `multichoose n e`).

### From TauCetiRoadmap.AssociationSchemes

- The definitions `IsAssocScheme`, `adjMat`, `bmAlgebra`, `valency` (1.1),
  `IsPrimitiveIdempotents` (1.2), `eigenmatrix`, `dualEigenmatrix` (2.1), `kreinParam` (3.1),
  `innerDistribution` (4.1), `johnsonRel`, `containsVec` (5.1), copied verbatim.
- 2.1 `adjMat_eq_sum_and_eq_sum_adjMat` (`A_j = ∑_i P_ij E_i`, `E_j = |X|⁻¹ ∑_i Q_ij A_i`) and
  2.2 `eigenmatrix_mul_dualEigenmatrix` (`PQ = QP = |X| I` and the orthogonality relations), for a
  scheme and a family of primitive idempotents; used in Layer 1 and in 4.1–4.3.
- 3.1 `hadamard_eq_sum_kreinParam` (`E_i ∘ E_j = |X|⁻¹ ∑_k q^k_ij E_k`); used in 4.2 and 4.3.
- 4.1 `sum_innerDistribution_mul_dualEigenmatrix_nonneg` (`(aQ)_j ≥ 0`, with equality exactly when
  `E_j χ_Y = 0`); used in 3.1 and 4.2.
- 5.1 `johnson_eigenmatrix` (for `2k ≤ n`: a scheme, with a family of primitive idempotents for
  which `P_ji = eberlein n k i j`, the trace of `E_0 + ⋯ + E_j` is `C(n, j)` and its column space
  is spanned by the `containsVec k T`, `|T| = j`); used in 3.1, 4.1, 4.3 and in the Examples of
  Layer 4.

### From TauCetiRoadmap.LovaszThetaFunction

- 1.1, the definition `lovaszTheta`, copied verbatim; used in 1.2. 4.3 `lovaszTheta_mul_le` (the
  ratio bound for `ϑ` of a regular graph) in the comparison remark of Layer 1.

### From TauCetiRoadmap.ConvexAnalysisAndDuality

- 5.3 `linearProgramming_duality` (for `A`, `b`, `c` with a feasible point `x ≥ 0`, `A x = b`, and
  `c ⬝ᵥ x` bounded below on the feasible set: primal and dual `max b ⬝ᵥ y` over `Aᵀ y ≤ c` have
  optimal solutions with equal values, with complementary slackness); used in the duality remark
  of Layer 1 and in 2.2.

### From TauCetiRoadmap.BoundsOnCodes

- 5.2 `card_mul_le_of_krawtchouk`: its hypotheses on `f` define the certificates of 2.2; its
  conclusion is not used.

### From TauCetiRoadmap.SpecialFunctionsClebschGordan

- 4.1, the definition `hahn` (DLMF 18.20.5, a terminating sum), copied verbatim.
- 4.2 `sum_hahn_mul_hahn` (for `n, m ≤ N` and real `α`, `β` with `(α + 1)_n ≠ 0` and
  `(α + 1)_m ≠ 0`: the sum over `x ≤ N` of the weight `(α + 1)_x (β + 1)_(N−x)/(x! (N − x)!)`
  times `hahn N n α β x · hahn N m α β x`, multiplied by `2n + α + β + 1`, is `0` for `n ≠ m` and an
  explicit constant for `n = m`; it gives orthogonality where `2n + α + β + 1 ≠ 0`); used in 4.3.

### From TauCetiRoadmap.LatticePackingsAndPerfectForms

- 5.1, the definitions `polynomialsOfDegreeLE` and `IsSphericalDesign`, copied verbatim; used in
  5.1.

## References

- William J. Martin and Hajime Tanaka, *Commutative association schemes*, arXiv:0811.2475 (version
  1, read on arXiv): Examples 2.1–2.4, pp. 4–5; §4, p. 9; §5, (10) and the definition of
  `T`-designs, p. 15, Examples 5.1–5.2, pp. 15–16, Theorem 5.4 and (16), p. 16; §7, Theorems 7.1
  and 7.2, p. 20.
- Chris Godsil, *Association Schemes*, lecture notes, June 2010, on the author's page
  (`math.uwaterloo.ca/~cgodsil/pdfs/assoc2.pdf`): §2.4 and Lemma 2.4.3, p. 19, Lemma 2.4.4, p. 20;
  Theorem 3.2.1, p. 25; §3.3, p. 28; §4.4, pp. 38–39.
- Christine Bachoc, Dion C. Gijswijt, Alexander Schrijver and Frank Vallentin, *Invariant
  semidefinite programs*, arXiv:1007.2905 (version 2, read on arXiv): §4.1, pp. 25–26.
- Frank Vallentin, *Lecture notes: semidefinite programs and harmonic analysis*, arXiv:0809.2017
  (version 1, read on arXiv): §2.2, p. 6; §4.2, pp. 17–18.
- Peter Boyvalenkov, Peter Dragnev, Douglas Hardin, Edward Saff and Maya Stoyanova, *Universal
  upper and lower bounds on energy of spherical designs*, arXiv:1509.07837 (version 1, read on
  arXiv): §2.2, (6), p. 4.
- P. Delsarte (the linear-programming method, designs in schemes and the Fisher-type and absolute
  bounds), P. Delsarte, J.-M. Goethals and J. J. Seidel (spherical designs), R. J. McEliece,
  E. R. Rodemich and H. C. Rumsey, and A. Schrijver (`ϑ′` and Delsarte's bound) are attributed in
  prose as the opened sources attribute them; their papers were not opened.

# Roadmap: Eigenvalue and singular value inequalities

**Summary.** This roadmap builds the classical inequalities of matrix analysis that compare
eigenvalues and singular values of sums, products, real parts and Hadamard products of finite
matrices, together with the positive definite completion theory of partial matrices on chordal
patterns. It starts from Courant–Fischer, Weyl's perturbation inequalities, Ky Fan sums, the
forward and converse Schur–Horn theorem, the symmetric Hoffman–Wielandt inequality and the
unitarily invariant seminorms with their symmetric gauges, all of which Tau Ceti has. On that
base it builds:
- weak log-majorization and its transfer to weak majorization and to sums of `φ`-values;
- Schur triangularization in invariant-subspace form, the determinant bound for compressions,
  and the norm and multiplicativity of exterior powers;
- Wielandt's minimax principle with its form for compressions, Lidskii's majorization of
  eigenvalue differences, the two-sided Lidskii–Mirsky bounds in every unitarily invariant norm,
  the converse of Cauchy interlacing and the Hoffman–Wielandt inequality for normal matrices;
- the singular values of sums: Rotfel'd's inequality and the Rotfel'd–Thompson majorization;
  real parts: the Fan–Hoffman inequality, Ky Fan's majorization of the real parts of
  eigenvalues, Thompson's matrix triangle inequality and the Ostrowski–Taussky inequality;
- products: Weyl's majorant theorem with its converse by Horn, Horn's product inequality,
  Thompson's product majorization, the Gelfand–Naimark inequalities, Lidskii's theorem for
  products of positive matrices and Yamamoto's limit theorem;
- Hadamard products: Oppenheim's inequality with the Schur and Hadamard bounds around it, and
  the weak majorization of the singular values of a Hadamard product;
- the one-edge chordal extension, the Grone–Johnson–Sá–Wolkowicz theorem and the
  maximum-determinant completion.

The roadmap is a synthesis. Every layer draws on at least two of Bhatia (1997, Chapters II–IV
and VI), Horn–Johnson (1985, Chapters 2, 4 and 7; 1991, Chapters 3 and 5), Marshall–Olkin–Arnold
(2011, Chapters 5 and 9) and Bakonyi–Woerdeman (2011, Chapters 1 and 2) (see
[References](#references)). Headlines that restate a source result carry a theorem, definition,
section or equation locator with its printed page; corollaries and adaptations carry a proof
route. The nearest roadmaps are [OperatorTheory/Majorization](../OperatorTheory/Majorization/README.md),
[OperatorTheory/PolarDecomposition](../OperatorTheory/PolarDecomposition/README.md) and
[OperatorTheory/PrincipalAngles](../OperatorTheory/PrincipalAngles/README.md), which this roadmap
consumes through Tau Ceti; SpectralSteepestDescent, which supplies Lidskii's inequality and its
singular-value form; PerfectAndChordalGraphs, which supplies chordal graphs and their elimination
orderings; and MeansMajorizationAndDiscreteInequalities, OperatorMonotoneFunctionsAndMatrixMeans
and ConditioningAndPerturbation, with which it shares no target (see
[Scope and ownership](#scope-and-ownership)).

`Suggested.lean` states, against the pinned Mathlib and Tau Ceti, the headlines below that carry
a Lean name, each with every conclusion the README attaches to it, and the definitions those
statements need. It is not an exhaustive acceptance test: the other headlines are targets of the
same standing, stated in prose with their locators or proof routes.

Suggested home: `TauCeti/Analysis/InnerProductSpace/EigenvalueInequalities/` for Layers 1–5,
`TauCeti/Analysis/Matrix/Hadamard/` for Layer 6 and `TauCeti/Analysis/Matrix/Completion/` with
`TauCeti/Combinatorics/SimpleGraph/Chordal.lean` for Layer 7, one file per subsection.

## How to read the build

Layer 1 is pure combinatorics of tuples. Layer 2 supplies the three tools that turn operator
statements into tuple statements: triangularization (so that eigenvalues of an arbitrary
operator can be put on a diagonal), compressions (so that a product of `k` singular values bounds
a `k × k` determinant), and exterior powers (so that a product of `k` singular values is a
norm).

Layers 3 and 4 are additive. Layer 3 is the variational theory of Hermitian eigenvalues:
Lidskii's inequality, supplied by SpectralSteepestDescent, becomes Lidskii's majorization through
Tau Ceti's orbit description of majorization, and Tau Ceti's Fan dominance turns it into norm
inequalities; Wielandt's minimax principle, in its form for compressions, feeds the
Gelfand–Naimark inequalities of Layer 5. Layer 4 treats sums of singular values through
Thompson's matrix triangle inequality, and real parts through Courant–Fischer.

Layers 5 and 6 are multiplicative. Layer 5 applies Layer 1 to the products bounded in Layer 2;
Layer 6 uses Mathlib's Schur product theorem and Layer 2 only. Layer 7 is independent of
Layers 1–6: it uses Mathlib's positive definite matrices, Schur complements and simple graphs,
and the chordal graphs of PerfectAndChordalGraphs.

Layers 1, 2, 3 and 7 need nothing from this roadmap; Layer 4 needs Layers 2.2 and 3; Layer 5
needs Layers 1, 2, 3.1 and 3.4; Layer 6 needs Layer 2.3. Within a layer the sections are in build
order.

## Conventions

- **Spaces.** `E`, `F`, `G` are finite-dimensional inner product spaces over `𝕜`, which is `ℝ`
  or `ℂ` (`RCLike 𝕜`); `n` is carried by a hypothesis `hn : finrank 𝕜 E = n`. Matrix statements
  (Layers 6 and 7, Ostrowski–Taussky, Horn's converse) use `Matrix ι ι 𝕜` with `Fintype ι`;
  a matrix becomes an operator through `Matrix.toEuclideanLin`. Statements quantify over all
  dimensions, so dimension `0` is included.
- **Hermitian eigenvalues.** `hT.eigenvalues hn : Fin n → ℝ` for `hT : T.IsSymmetric`, from
  Mathlib, in decreasing order (`LinearMap.IsSymmetric.eigenvalues_antitone`). Written `λ↓(T)`,
  and `λ↑(T)` for the reversed tuple.
- **Singular values.** `A.singularValues : ℕ →₀ ℝ` (`LinearMap.singularValues`, Mathlib):
  decreasing, nonnegative and zero beyond the rank, for rectangular `A : E →ₗ[𝕜] F`. Products
  and sums of the first `k` singular values are taken over `range k`, so they make sense for
  every `k`, and a product with `k` beyond the rank is `0`.
- **Eigenvalues of arbitrary operators.** The complex eigenvalues of `T : E →ₗ[ℂ] E` are the roots
  of `LinearMap.charpoly`, with multiplicity. An enumeration of them is a tuple
  `α : Fin n → ℂ` with `Multiset.map α univ.val = T.charpoly.roots`. Their moduli in decreasing
  order, zero-padded, are `eigenvalueModuli T` (2.1).
- **Majorization.** Weak majorization and prefix sums are Tau Ceti's (`TauCeti.prefixSum`,
  `TauCeti.IsWeaklyMajorizedBy`). Majorization of a tuple `x` by an antitone `w` is stated as
  membership of `x` in the convex hull of the permutations of `w`, which
  `TauCeti.mem_convexHull_range_comp_perm_iff` identifies with the prefix-sum definition. This
  avoids owning a majorization predicate, which belongs to
  MeansMajorizationAndDiscreteInequalities, Section 4.1.
- **Unitarily invariant norms.** `TauCeti.UnitarilyInvariantSeminorm` with its symmetric gauge
  `TauCeti.UnitarilyInvariantSeminorm.gauge` on tuples indexed by the smaller of the two
  dimensions;
  `TauCeti.UnitarilyInvariantSeminorm.map_eq_gauge_singularValues` gives `N A` as the gauge of
  the singular values. "In every unitarily invariant norm" means for every such `N`.
- **Order.** On operators, `X ≤ Y` is `(Y - X).IsPositive` (`LinearMap.IsPositive`). On complex
  scalars and matrices, the order is `ComplexOrder` and `Matrix.PosSemidef`, `Matrix.PosDef`.
- **The modulus.** `|A| = (A†A)^(1/2)` is Tau Ceti's `LinearMap.operatorAbs`.

## Layer 1: weak log-majorization

### 1.1 Prefix products

- **Weak log-majorization** (`IsWeaklyLogMajorizedBy`): for antitone nonnegative
  `x y : Fin n → ℝ`, `∏_{i<k} xᵢ ≤ ∏_{i<k} yᵢ` for every `k` (Marshall–Olkin–Arnold, Def 1.A.7,
  p. 16; Bhatia, (III.14)–(III.16), p. 71). The four sign and order fields mirror
  `TauCeti.IsWeaklyMajorizedBy`.
- **Weak log-majorization implies weak majorization**
  (`IsWeaklyLogMajorizedBy.isWeaklyMajorizedBy`), with zero entries allowed (Bhatia,
  Ex II.3.5(vii), p. 42; Marshall–Olkin–Arnold, 5.A.2.b, p. 168).
- **Transfer to `φ`-sums** (`IsWeaklyLogMajorizedBy.prefixSum_comp_le`): if `φ` is monotone on
  `[0, ∞)` and `φ ∘ exp` is convex, the prefix sums of `φ ∘ x` are bounded by those of `φ ∘ y`
  (Horn–Johnson 1991, Cor 3.3.10(ii), p. 174; Marshall–Olkin–Arnold, 5.A.2.a, p. 168).
- **Products** (`IsWeaklyLogMajorizedBy.mul`): coordinatewise products of weakly log-majorized
  pairs are weakly log-majorized (Bhatia, Ex II.3.5(v), p. 42).

*Proof route.* On positive tuples, take logarithms and apply the increasing convex transfer for
weak majorization of real decreasing tuples (Bhatia, Ex II.3.5(vi), p. 42) to `ψ = φ ∘ exp`. The
logarithms can be negative, so Tau Ceti's `TauCeti.IsWeaklyMajorizedBy`, which requires
nonnegative tuples, does not apply, and the transfer is proved here as a step of this item: the
slopes `cᵢ` of `ψ` between `log xᵢ` and `log yᵢ` are nonnegative and decreasing in `i`, since `ψ`
is increasing and convex and both tuples decrease, and Abel summation writes
`∑_{i<k} (ψ(log yᵢ) - ψ(log xᵢ))` as a nonnegative combination of the differences of prefix sums.
For zeros: if `y` has `m` positive entries, the condition at `k = m + 1` forces `x` to vanish from
index `m` on, so the entries from `m` on agree and contribute equally. On the first `m` entries
replace the zeros of `x` by `ε > 0`; the products stay dominated for small `ε`, and
`φ(0) ≤ φ(ε)` by monotonicity, so no continuity of `φ` at `0` is needed. Products: the prefix
product of `x u` is the product of the prefix products.

*Needs:* Tau Ceti's weak majorization and prefix sums.

**Checks.**

- `IsWeaklyLogMajorizedBy`: `(1, 1/2)` is weakly majorized by `(5/4, 1/4)` but not weakly
  log-majorized by it, since `1/2 > 5/16`. Negative control: a definition through prefix sums
  would accept it.
- `IsWeaklyLogMajorizedBy.prefixSum_comp_le` needs `φ` monotone: `(1, 1)` is weakly log-majorized
  by `(2, 1)`, `t ↦ 1/t` has `t ↦ e^(-t)` convex, and `1 + 1 > 1/2 + 1`.

### Examples

- `(2, 1/2)` is weakly log-majorized by `(2, 1)`, and with `φ(t) = t^p` for `p > 0` gives
  `2^p + 2^(-p) ≤ 2^p + 1`.

### Dependencies

Tau Ceti only.

## Layer 2: triangularization, compressions and exterior powers

### 2.1 Eigenvalue moduli

- **Eigenvalue moduli** (`eigenvalueModuli`): for `T : E →ₗ[ℂ] E`, the moduli of the roots of
  `T.charpoly`, with multiplicity, sorted decreasingly and zero-padded, as a function `ℕ → ℝ`.
  This is the complex counterpart of `LinearMap.singularValues` (Bhatia, notation before
  Thm II.3.6, p. 42; Horn–Johnson 1991, Thm 3.3.2, p. 171, for the ordering by modulus).

**Checks.**

- `eigenvalueModuli`: a nilpotent operator has all eigenvalue moduli `0`, although its singular
  values need not vanish.
- `eigenvalueModuli`: for `diag(1, -2)` the moduli are `2, 1`. Negative control: an ordering by
  real part, or the absolute values in Mathlib's order, would give `1, 2`.

### 2.2 Schur triangularization

- **Invariant form** (`exists_invariant_finrank_eq_roots_charpoly_restrict`): every
  sub-multiset `s` of the eigenvalues of `T : E →ₗ[ℂ] E` is the eigenvalue multiset of the
  restriction of `T` to an invariant subspace of dimension `card s`.
- **Unitary triangularization.** Every complex square matrix is unitarily similar to an upper
  triangular matrix with its eigenvalues on the diagonal in any prescribed order (Horn–Johnson
  1985, Thm 2.3.1, p. 79). Equivalently, for every enumeration of the eigenvalues there is an
  orthonormal basis in which `T` is upper triangular with that diagonal.

*Proof route.* Induction on `card s`: take an eigenvector for an element of `s`, pass to the
quotient by its line (or to the orthogonal complement with the compressed operator), and use
that the characteristic polynomial of the restriction divides that of `T`
(`LinearMap.charpoly` of a restriction and quotient multiply). Gram–Schmidt applied to the
resulting flag of invariant subspaces gives the unitary form (Horn–Johnson 1985, proof of
Thm 2.3.1, p. 79).

### 2.3 Compressions and determinants

- **Compression bound** (`norm_det_compression_le`): for orthonormal `v : Fin k → F`,
  `w : Fin k → E`, `|det (⟪vᵢ, A wⱼ⟫)| ≤ ∏_{i<k} sᵢ(A)` (Horn–Johnson 1991, Lemma 3.3.1(b),
  p. 170).
- **Determinant** (`norm_det_eq_prod_singularValues`): `|det T| = ∏_{i<n} sᵢ(T)`.

*Proof route.* The compression `V*AW` has singular values `sᵢ(V*AW) ≤ sᵢ(A)` by Tau Ceti's
`LinearMap.singularValues_comp_le` applied on both sides (Horn–Johnson 1991, Lemma 3.3.1(a),
p. 170), and `|det| = ∏ s` for square matrices by the polar decomposition.

### 2.4 Exterior powers

The exterior power `⋀ᵏA = exteriorPower.map k A` acts on Mathlib's real inner product space
`⋀[ℝ]^k E`, whose inner product on decomposable vectors is the Gram determinant
(`exteriorPower.inner_ιMulti_ιMulti`). Mathlib's inner product exists over `ℝ` only, so these
headlines are for real inner product spaces, which covers a real `d × d` matrix `B` through
`Matrix.toEuclideanLin B`.

- **Norm of an exterior power** (`norm_exteriorPower_map_eq_prod_singularValues`): for
  `A : E →ₗ[ℝ] F`, `‖⋀ᵏA‖ = ∏_{i<k} sᵢ(A)` for every `k`; both sides are `1` at `k = 0` and `0`
  beyond the rank (Bhatia, proof of Thm IV.2.5, p. 94; Marshall–Olkin–Arnold,
  proof of 9.H.1, p. 339, through compounds).
- **Submultiplicativity.** `‖⋀ᵏ(AB)‖ ≤ ‖⋀ᵏA‖ ‖⋀ᵏB‖` for `A : F →ₗ[ℝ] G`, `B : E →ₗ[ℝ] F`. It is
  one line from the library (`exteriorPower.map_comp` and the submultiplicativity of the
  operator norm), so `Suggested.lean` does not state it; it is listed here as the form in which
  consumers of 2.4 cite it.

*Proof route.* Choose singular bases `A eᵢ = sᵢ fᵢ` (Tau Ceti's singular value decomposition at
`LinearMap.singularValues`). Mathlib's `OrthonormalBasis.exteriorPower` turns them into
orthonormal bases of the exterior powers in which `⋀ᵏA` is diagonal with entries
`∏_{i ∈ I} sᵢ` over `k`-subsets `I`; the largest is the product of the first `k`.

*Needs:* Mathlib's `exteriorPower.map` and the inner product on exterior powers; Tau Ceti's
singular value decomposition.

### Examples

- For `A = diag(3, 2, 1)` on `ℝ³`, `‖⋀²A‖ = 6`, attained at `e₁ ∧ e₂`; for a rank-one `A`,
  `‖⋀²A‖ = 0`.

### Dependencies

Mathlib's characteristic polynomials and exterior powers; Tau Ceti's singular values and
modulus.

## Layer 3: Wielandt's minimax principle and Lidskii's theorem

### 3.1 Wielandt's minimax principle

- **Complementary flags** (`exists_orthonormal_span_eq`): for indices `i₀ < ⋯ < i_{k-1}` in
  `Fin n`, an increasing flag `V` with `dim Vⱼ = iⱼ + 1` and a decreasing flag `W` with
  `dim Wⱼ = n - iⱼ` carry orthonormal families `vⱼ ∈ Vⱼ`, `wⱼ ∈ Wⱼ` with the same span (Bhatia,
  Thm III.3.2, p. 66, with linearly independent families; indices are `0`-based here).
- **Wielandt's minimax principle** (`wielandt_minimax`): `∑ⱼ λ_{iⱼ}(T)` is the maximum over
  increasing flags `M` with `dim Mⱼ = iⱼ + 1` of the minimum of `∑ⱼ re⟪T xⱼ, xⱼ⟫` over
  orthonormal `xⱼ ∈ Mⱼ`. Both halves are conclusions: the eigenvector flag attains the value,
  and every flag carries an orthonormal family at or below it (Bhatia, Thm III.3.5, p. 67;
  Marshall–Olkin–Arnold, 9.G.1.a, p. 329, for its use).
- **Wielandt's principle for compressions.** Let `Φ` be real valued on `k`-tuples from an
  interval containing the eigenvalues of `T`, monotone in each variable and invariant under
  permutations. For an orthonormal family `x` let `μ₀ ≥ ⋯ ≥ μ_{k-1}` be the eigenvalues of the
  compression of `T` to the span of the `xⱼ`. Then `Φ(λ_{i₀}(T), …, λ_{i_{k-1}}(T))` is the
  maximum over increasing flags `M` with `dim Mⱼ = iⱼ + 1` of the minimum of `Φ(μ₀, …, μ_{k-1})`
  over orthonormal `xⱼ ∈ Mⱼ` (Bhatia, Ex III.3.7, p. 68). For `Φ` the sum this is the minimax
  principle above, since the sum of the `μⱼ` is the trace of the compression; for `T` positive
  and `Φ` the product it is the statement for the determinant of `(⟪T xᵢ, xⱼ⟫)`. The diagonal
  entries `⟪T xⱼ, xⱼ⟫` cannot replace the `μⱼ` for other `Φ`: for `T = diag(3, 1)`, `k = 2` and
  the flag spanned first by `(1, 1)/√2`, the only family has diagonal entries `(2, 2)`, and
  `2 · 2 > 3 · 1`.

*Proof route.* For the flag lemma, Bhatia's induction on `k` gives linearly independent families;
Gram–Schmidt applied to `v` in increasing order and to `w` in decreasing order keeps each vector
in its subspace and does not change the span. For the minimax principle, the eigenvector flag
gives the lower bound by expanding in the eigenbasis (Tau Ceti's
`LinearMap.IsSymmetric.eigenvalues_eq_iSup_iInf_re_inner` and its eigenbasis lemmas); for an
arbitrary flag apply the flag lemma with `Wⱼ` the span of the eigenvectors from `iⱼ` on, and
compare with Tau Ceti's Ky Fan bound `LinearMap.IsSymmetric.sum_re_inner_apply_self_le_sum_eigenvalues`
on the common span. For compressions the same two flags work: for the eigenvector flag the span
of `x₀, …, xⱼ` lies in `Mⱼ`, so `μⱼ ≥ λ_{iⱼ}` by Courant–Fischer for the compression; for an
arbitrary flag the family of the flag lemma has `wⱼ, …, w_{k-1}` in `Wⱼ`, so `μⱼ ≤ λ_{iⱼ}`; the
monotonicity of `Φ` finishes (Bhatia, proof of Thm III.3.5, pp. 67–68, which is this argument for
the sum).

### 3.2 Lidskii's theorem

Lidskii's inequality is consumed from SpectralSteepestDescent, Section 2.1: for symmetric `T`, `S`
on a finite-dimensional space and `i₀ < ⋯ < i_{k-1}`,
`∑ⱼ λ_{iⱼ}(T + S) ≤ ∑ⱼ λ_{iⱼ}(T) + ∑_{j<k} λⱼ(S)` (Bhatia, Thm III.4.1, (III.10), p. 69;
Marshall–Olkin–Arnold, 9.G.1.a, p. 329). That roadmap states it for a pair `S`, `T` as
`∑_{j ∈ J} (λⱼ(S) - λⱼ(T)) ≤` the sum of the `k` largest eigenvalues of `S - T`, which is the
display with `T + S` in place of `S`. For `iⱼ = j` it is Ky Fan's inequality.

- **Lidskii's majorization** (`eigenvalues_add_sub_mem_convexHull`): `λ↓(T + S) - λ↓(T)` lies in
  the convex hull of the permutations of `λ↓(S)` (Bhatia, Cor III.4.2, p. 69, and the equivalent
  convex-hull form Ex III.4.3, p. 69).

*Proof route.* Lidskii's inequality for all index sets, with equality of traces, through
`TauCeti.mem_convexHull_range_comp_perm_iff`. (Wielandt's principle gives Lidskii's inequality
too: apply it to `T + S` with the flag that is optimal for `T + S` and bound the `S` part by
Tau Ceti's Ky Fan bound, as in Bhatia, proof of Thm III.4.1, p. 69.)

*Needs:* SpectralSteepestDescent, Section 2.1; Tau Ceti's permutation orbits.

### 3.3 The Lidskii–Mirsky bounds

- **Two-sided gauge bound** (`gauge_eigenvalues_sub_le`): for symmetric `T`, `S` and every
  unitarily invariant seminorm `N` with gauge `Φ`,
  `Φ(λ↓(T) - λ↓(S)) ≤ N(T - S) ≤ Φ(λ↓(T) - λ↑(S))` (Bhatia, Thm III.4.4, p. 71, and (IV.62),
  p. 101).

*Proof route.* By Lidskii's majorization applied to `T = S + (T - S)` and to `S = T + (S - T)`,
both `λ↓(T) - λ↓(S)` and `λ(T - S)` lie in permutation hulls, so their Ky Fan sums compare; the
singular values of `T - S` are the absolute eigenvalues. Tau Ceti's Fan dominance
`TauCeti.UnitarilyInvariantSeminorm.map_le_of_kyFanSum_le` and the gauge representation finish.
The upper bound is the same argument for `λ↓(T) - λ↑(S)`.

### 3.4 Converse interlacing

- **Converse of Cauchy interlacing** (`exists_hyperplane_eigenvalues_compression_eq`): if the
  eigenvalues `α` of a symmetric `T` on a space of dimension `n + 1` interlace
  `α_{i+1} ≤ βᵢ ≤ αᵢ`, then `β` is the eigenvalue list of the compression of `T` to some
  hyperplane (Bhatia, Thm III.1.9, p. 61; Horn–Johnson 1985, Thm 4.3.10, pp. 186–187, in the
  bordered form).

*Proof route.* In the eigenbasis, the compression to `z⊥` has characteristic polynomial
`∑ⱼ |zⱼ|² ∏_{k≠j} (t - αₖ)`. Matching it with `∏ᵢ (t - βᵢ)` at `t = αⱼ` gives
`|zⱼ|² = ∏ᵢ (αⱼ - βᵢ) / ∏_{k≠j} (αⱼ - αₖ)`, which is nonnegative by interlacing and sums to `1`;
equal eigenvalues are handled by splitting off the common eigenspace. The forward direction,
Cauchy interlacing for compressions, is not used; it is a target of
[RandomMatrices](../RandomMatrices/README.md), Section 1.2.

### 3.5 Hoffman–Wielandt for normal operators

- **Normal Hoffman–Wielandt** (`exists_perm_sum_sq_le_and_le`): for normal `T`, `S` on a complex
  space with eigenvalue enumerations `α`, `β` and an orthonormal basis `b`, some permutation `σ`
  has `∑ᵢ |αᵢ - β_{σ i}|² ≤ ‖T - S‖²_F` and some permutation has `‖T - S‖²_F ≤ ∑ᵢ |αᵢ - β_{σ i}|²`,
  where `‖T - S‖²_F = ∑ₖ ‖(T - S) bₖ‖²` (Bhatia, Thm VI.4.1, p. 165).

*Proof route.* Diagonalize both by Tau Ceti's spectral theorem for normal operators. The squared
Frobenius distance is `∑ᵢⱼ |αᵢ - βⱼ|² |wᵢⱼ|²` for a unitary `W`, `(|wᵢⱼ|²)` is doubly stochastic,
and a linear function on the Birkhoff polytope attains its minimum and maximum at permutation
matrices (Mathlib's `doublyStochastic_eq_convexHull_permMatrix`).

### Examples

- `T = diag(1, 0)`, `S = diag(0, 1)`: `λ↓(T + S) - λ↓(T) = (0, 1)` is a permutation of
  `λ↓(S) = (1, 0)`, and the Lidskii–Mirsky bounds read `Φ(0, 0) ≤ N(T - S) ≤ Φ(1, -1)` with
  `N(T - S) = Φ(1, 1)`, so the upper bound is attained.
- The second half of 3.5 fails for non-normal operators: the nilpotent `[[0, 1], [0, 0]]` and `0`
  have all eigenvalues `0`, so every matching gives `0`, while their squared Frobenius distance
  is `1`; no matching is at least `1`. The first half, `0 ≤ 1`, holds.

### Dependencies

Tau Ceti's Courant–Fischer, Ky Fan, permutation-orbit, Fan-dominance and
gauge files, and its spectral theorem for normal operators.

## Layer 4: singular values of sums and real parts

### 4.1 Sums

Lidskii's theorem for singular values and Mirsky's theorem are consumed from
SpectralSteepestDescent, Section 2.1: for `A B : E →ₗ[𝕜] F` and every `k`, any `k` of the
differences `|sᵢ(A) - sᵢ(B)|` sum to at most `∑_{i<k} sᵢ(A - B)`, and consequently `N` of any map
with singular values `|sᵢ(A) - sᵢ(B)|` is at most `N(A - B)` for every unitarily invariant
seminorm `N` (Bhatia, Thm IV.3.4, p. 100, Ex IV.3.5, p. 101, and Problem III.6.13, p. 78).

- **Rotfel'd's inequality** (`sum_concave_singularValues_add_le`): for endomorphisms
  `A B : E →ₗ[𝕜] E` and `f` nonnegative and concave on `[0, ∞)` with `f(0) = 0`,
  `∑ⱼ f(sⱼ(A + B)) ≤ ∑ⱼ f(sⱼ(A)) + ∑ⱼ f(sⱼ(B))`, the sums over `j < dim E` (Bhatia,
  Thm IV.2.14, p. 98).
- **Rotfel'd–Thompson majorization.** For positive semidefinite `G`, `H`, the concatenation
  `(λ(G), λ(H))` is majorized by `(λ(G + H), 0)` (Marshall–Olkin–Arnold, 9.G.1.b, p. 330).

*Proof route.* Rotfel'd: by Thompson's inequality (4.2), the
singular values of `A + B` are dominated by the eigenvalues of `U|A|U* + V|B|V*`; apply the
concave majorization inequality for sums of positive matrices (Bhatia, Thm IV.2.13, p. 97). The
Rotfel'd–Thompson majorization comes from writing `G + H = CC*` with `C = (X, Y)` and comparing
with `C*C`, whose diagonal blocks are `X*X`, `Y*Y` (Marshall–Olkin–Arnold, proof of 9.G.1.b,
p. 330).

### 4.2 Real parts

Here `H` is the Hermitian part of `T`, given by `H.IsSymmetric` and
`(2 : 𝕜) • H = T + LinearMap.adjoint T`.

- **Fan–Hoffman** (`eigenvalues_le_singularValues_of_two_smul_eq`): `λⱼ(H) ≤ sⱼ(T)` for every `j`
  (Bhatia, Prop III.5.1, p. 73; Marshall–Olkin–Arnold, 9.F.4, p. 327).
- **Ky Fan's real-part majorization** (`re_eigenvalues_mem_convexHull`): for `T` on a complex
  space, the real parts of any enumeration of the eigenvalues lie in the convex hull of the
  permutations of `λ↓(H)` (Bhatia, Prop III.5.3, p. 74).
- **Comparison by a unitary** (`exists_unitary_le_conj_of_eigenvalues_le`): if
  `λⱼ(X) ≤ λⱼ(Y)` for all `j`, then `X ≤ U Y U⁻¹` for some unitary `U` (Bhatia, Ex III.5.5(i),
  p. 74). With Fan–Hoffman: `H ≤ U |T| U⁻¹` (Bhatia, Ex III.5.5(ii), p. 74).
- **Thompson's triangle inequality** (`exists_unitary_operatorAbs_add_le`): for every `A`, `B`
  there are unitaries `U`, `V` with `|A + B| ≤ U|A|U⁻¹ + V|B|V⁻¹` (Bhatia, Thm III.5.6, p. 74).
- **Ostrowski–Taussky** (`re_det_le_norm_det_of_posSemidef`): if the Hermitian part `H` of a
  complex square matrix `A` is positive semidefinite, `det H ≤ |det A|` (Horn–Johnson 1985,
  Thm 7.8.7, p. 481, for positive definite `H`; the semidefinite case is the limit `A + εI`).

*Proof route.* Fan–Hoffman: intersect the span of the first `j` eigenvectors of `H` with the
span of the singular vectors of `T` from `j` on, and use `re⟪Tx, x⟫ ≤ ‖Tx‖` (Bhatia, proof of
Prop III.5.1, p. 73). Ky Fan: by Schur triangularization (2.2) in an orthonormal basis the
diagonal of `H` is `re αⱼ`, so the forward Schur–Horn theorem of Tau Ceti applies. Unitary
comparison: map the eigenbasis of `Y` to that of `X`. Thompson: with the polar form
`A + B = W|A + B|`, write `|A + B| = W*A + W*B`, take Hermitian parts, and apply Fan–Hoffman and
the unitary comparison to each (Bhatia, proof of Thm III.5.6, p. 74). Ostrowski–Taussky: with
`H` positive definite, `det A = det H · det(I + i H^(-1/2) K H^(-1/2))` for the skew part `iK`,
and the second factor has eigenvalues `1 + i μ` with `|1 + iμ| ≥ 1`.

### Examples

- `|A + B| ≤ |A| + |B|` fails, so the unitaries in Thompson's inequality cannot be dropped: for
  `A = [[1, 0], [0, 0]]` and `B = [[0, 1], [0, 0]]`, `|A| + |B| = I` and
  `|A + B| = [[1, 1], [1, 1]]/√2`, and `I - |A + B|` has the eigenvalue `1 - √2 < 0`.
- Rotfel'd needs `f ≥ 0`: `f(t) = -t` is concave with `f(0) = 0`, and `A = I`, `B = -I` give
  `0 > -2n`.

### Dependencies

Layer 3; Layer 2.2 for Ky Fan's real-part majorization; Tau Ceti's polar decomposition and
modulus.

## Layer 5: products and multiplicative majorization

### 5.1 Weyl's majorant theorem

- **Weyl's majorant theorem** (`prod_eigenvalueModuli_le_prod_singularValues`):
  `∏_{i<k} |λ|ᵢ(T) ≤ ∏_{i<k} sᵢ(T)` for every `k`, with equality at `k = dim E` (Bhatia,
  Thm II.3.6, p. 42; Horn–Johnson 1991, Thm 3.3.2, p. 171; Marshall–Olkin–Arnold, 9.E.1,
  p. 317).
- **Weyl's inequalities** (`sum_comp_eigenvalueModuli_le`): for `φ` monotone on `[0, ∞)` with
  `φ ∘ exp` convex, `∑_{i<k} φ(|λ|ᵢ(T)) ≤ ∑_{i<k} φ(sᵢ(T))` (Bhatia, (II.24), (II.25), p. 43;
  Horn–Johnson 1991, Thm 3.3.13, pp. 175–176). In particular `∑ |λᵢ|^p ≤ ∑ sᵢ^p` for `p > 0`
  and `|tr T| ≤ ∑ sᵢ(T)`.

*Proof route.* Restrict `T` to an invariant subspace carrying the `k` eigenvalues of largest
modulus (2.2); the determinant of the restriction is a `k × k` compression of `T` in an
orthonormal basis of that subspace, so (2.3) bounds its modulus. Equality at `k = n` is (2.3).
The sum form is Layer 1.

### 5.2 Horn's product inequality and Gelfand–Naimark

- **Horn's product inequality** (`prod_singularValues_comp_le`): for `A : F →ₗ[𝕜] G` and
  `B : E →ₗ[𝕜] F`, `∏_{i<k} sᵢ(AB) ≤ ∏_{i<k} sᵢ(A) sᵢ(B)` for every `k` (Horn–Johnson 1991,
  Thm 3.3.4, pp. 171–172, rectangular; Marshall–Olkin–Arnold, 9.H.1, p. 338). With Layer 1 it
  gives the `φ`-sum forms (Horn–Johnson 1991, Thm 3.3.14, p. 176).
- **Thompson's product majorization.** For `A B : E →ₗ[𝕜] E`, the absolute eigenvalues of the
  Hermitian part of `AB`, in decreasing order, are weakly majorized by `sⱼ(A) sⱼ(B)`
  (Marshall–Olkin–Arnold, 9.F.4.b, p. 327).
- **Gelfand–Naimark** (`prod_singularValues_comp_le_of_strictMono`): for `A B : E →ₗ[𝕜] E` and
  indices `i₀ < ⋯ < i_{k-1}` in `ℕ`, `∏ⱼ s_{iⱼ}(AB) ≤ ∏ⱼ s_{iⱼ}(B) · ∏_{j<k} sⱼ(A)` (Bhatia,
  Thm III.4.5, (III.17)–(III.18), pp. 71–72; Marshall–Olkin–Arnold, 9.H.1.c, p. 340). Indices
  beyond the dimension give `0 ≤ 0`.

*Proof route.* Horn: over `ℝ` it is (2.4): `∏_{i<k} sᵢ(AB) = ‖⋀ᵏ(AB)‖ ≤ ‖⋀ᵏA‖ ‖⋀ᵏB‖`. Over any
`𝕜`, choose the top `k` singular vectors of `AB`; the compression `V*(AB)W` factors through the
compressions of `A` and `B` to the image of `BW`, and (2.3) bounds both determinants
(Horn–Johnson 1991, proof of Thm 3.3.4, pp. 171–172). Thompson's product majorization: the
singular values of the Hermitian part `H` of `T` are its absolute eigenvalues, and they are weakly
majorized by those of `T` (Marshall–Olkin–Arnold, 9.F.4.a, p. 327), since
`2 kyFanSum H k ≤ kyFanSum T k + kyFanSum T† k = 2 kyFanSum T k` by Tau Ceti's
`LinearMap.kyFanSum_add_le` and `LinearMap.kyFanSum_adjoint`; apply this to `T = AB` and combine
with Horn's product inequality through Layer 1 (Marshall–Olkin–Arnold, proof of 9.F.4.b, p. 327).
Gelfand–Naimark: by Wielandt's principle for compressions (3.1) with `Φ` the product, applied to
`|AB|²` and to `|B|²`, where the product of the compression eigenvalues is the determinant of the
compression and (2.3) bounds it (Bhatia, proof of Thm III.4.5, pp. 71–72).

### 5.3 Products of positive operators

- **Lidskii for positive products** (`eigenvalueModuli_comp_le_of_isPositive`): for positive
  `A`, `B` on a complex space, every eigenvalue of `AB` is a nonnegative real, and the
  decreasing eigenvalues of `AB` are log-majorized by `λ↓(A) λ↓(B)`: weakly for every `k`, with
  equality of the full products (Bhatia, Cor III.4.6, (III.21), p. 73; Marshall–Olkin–Arnold,
  9.H.1.d, p. 340).
- **Lower bound.** `λ↓(A) λ↑(B)` is log-majorized by the eigenvalues of `AB` when both are
  positive definite (Bhatia, Cor III.4.6, left half of (III.21), p. 73).

*Proof route.* `AB` is similar to `B^(1/2) A B^(1/2)` when `B` is invertible, and the general case
is a limit (Bhatia, proof of Cor III.4.6, p. 73). Then Gelfand–Naimark (5.2) with
`A^(1/2)` and `B^(1/2)` gives the upper bound; the lower bound is the same applied to inverses.

### 5.4 Yamamoto's theorem

- **Yamamoto** (`tendsto_singularValues_pow_rpow`): `sᵢ(Tᵐ)^(1/m) → |λ|ᵢ(T)` as `m → ∞`, for every
  `i` (Horn–Johnson 1991, Thm 3.3.21, p. 180).

*Proof route.* For `i = 0` this is Gelfand's spectral radius formula, `‖Tᵐ‖^(1/m) → ρ(T)`
(Mathlib's `spectrum.pow_nnnorm_pow_one_div_tendsto_nhds_spectralRadius`). For general `i`, order
the eigenvalues by decreasing modulus and take, by 2.2, an invariant subspace `W` of dimension
`n - i` carrying `λᵢ, …, λ_{n-1}` and an invariant subspace `V` of dimension `i + 1` carrying
`λ₀, …, λᵢ`. Since `sᵢ(Tᵐ)²` is the `i`-th eigenvalue of `(Tᵐ)†Tᵐ`, Tau Ceti's Courant–Fischer
gives `sᵢ(Tᵐ) ≥ min ‖Tᵐx‖` over unit `x ∈ V`, and, since every subspace of dimension `i + 1` meets
`W`, `sᵢ(Tᵐ) ≤ ‖(T|_W)ᵐ‖`. Gelfand's formula for `T|_W`, whose spectral radius is `|λ|ᵢ(T)`, gives
`limsup sᵢ(Tᵐ)^(1/m) ≤ |λ|ᵢ(T)`. If `|λ|ᵢ(T) > 0`, `T|_V` is invertible,
`min ‖Tᵐx‖ = ‖(T|_V)⁻ᵐ‖⁻¹`, and Gelfand's formula for `(T|_V)⁻¹`, whose spectral radius is
`1/|λ|ᵢ(T)`, gives `liminf sᵢ(Tᵐ)^(1/m) ≥ |λ|ᵢ(T)`; if `|λ|ᵢ(T) = 0` the lower bound is trivial.
This route uses no compound matrices, whose complex form no layer supplies (Horn–Johnson 1991,
proof of Thm 3.3.21, p. 180, argues through compounds instead).

### 5.5 Horn's converse

- **Horn's converse of Weyl's theorem** (`exists_upperTriangular_singularValues_eq`): decreasing
  nonnegative `σ` and complex `λ` with decreasing moduli, `|λ₁⋯λ_k| ≤ σ₁⋯σ_k` for all `k` and
  equality at `k = n`, are the diagonal and the singular values of an upper triangular complex
  matrix (Horn–Johnson 1991, Thm 3.6.6, p. 220, with its proof on pp. 220–222;
  Marshall–Olkin–Arnold, 9.E.5, p. 322). Zero values are allowed.
- **Mirsky's lemma.** For a positive definite `A` the ratios `det A_k / det A_{k-1}` of leading
  principal minors are log-majorized by the eigenvalues; conversely, any such data are realized
  (Horn–Johnson 1991, Lemma 3.6.2, p. 218; Marshall–Olkin–Arnold, 9.E.6, p. 322).

*Proof route.* Horn–Johnson 1991, proof of Thm 3.6.6, pp. 220–222. If all `λᵢ` are nonzero,
then all `σᵢ` are, by the equality of full products, and Mirsky's lemma realizes the squares `σᵢ²`
and the prescribed leading minors `|λ₁⋯λ_k|²` in a positive definite matrix `P`; its Cholesky
factor `P = R*R` is upper triangular with `rᵢᵢ = |λᵢ|`. If exactly `m < n` of the `λᵢ` are
nonzero (indices from `0`), then `σ_{n-1} = 0`. For `m ≥ 2`, realize `|λ₀|, …, |λ_{m-1}|` at size
`m` with singular values `σ₀, …, σ_{m-2}` and `a = |λ₀⋯λ_{m-1}|/(σ₀⋯σ_{m-2})`, which satisfy the
hypotheses there; after an orthogonal change of basis that diagonalizes `C Cᵀ` for that matrix
`C`, bordering `C` by a weighted shift gives singular values `σ₀, …, σ_{n-1}` and adds `n - m` zero
eigenvalues. For `m ≤ 1` an explicit bordered shift does it (p. 221). Schur triangularization
(2.2) makes the result upper triangular without changing its singular values, and a diagonal
unitary fixes the phases (pp. 221–222). The converse direction of Mirsky's lemma uses the
converse interlacing of 3.4 inductively (p. 220).

### Examples

- `T = [[0, 1], [0, 0]]`: eigenvalue moduli `0, 0`, singular values `1, 0`; Weyl's products are
  `0 ≤ 1` and `0 = 0`.
- Horn's converse at `n = 2`: `λ = (2, 1/2)`, `σ = (3, 1/3)` are realized by
  `[[2, t], [0, 1/2]]` with `t² = 9 + 1/9 - 4 - 1/4`.

### Dependencies

Layers 1 and 2; Layer 3.1 for Gelfand–Naimark and 3.4 for Horn's converse; Tau Ceti's Ky Fan
sums for Thompson's product majorization; Tau Ceti's Courant–Fischer and Mathlib's Gelfand
formula for Yamamoto's theorem.

## Layer 6: Hadamard products

### 6.1 Oppenheim's inequality

- **Oppenheim's chain** (`det_mul_prod_diag_le_det_hadamard`): for positive semidefinite `A`, `B`
  over `𝕜`, `det A det B ≤ det A ∏ bᵢᵢ ≤ det(A ∘ B) ≤ ∏ aᵢᵢ bᵢᵢ` (Horn–Johnson 1985, Thm 7.8.6,
  p. 480, with the chain as stated after it on p. 481).
- **Schur's lower eigenvalue bound.** For positive semidefinite `A`, `B`, every eigenvalue of
  `A ∘ B` is at least `λ_min(A) · minᵢ bᵢᵢ` (Horn–Johnson 1991, Thm 5.3.4, p. 316, lower half; the
  upper half, the norm of a Schur multiplier, belongs to SchattenClassesAndSchurMultipliers,
  Section 6.1).

*Proof route.* Oppenheim by induction on the size through the Schur complement of `a₁₁`
(Horn–Johnson 1985, proof of Thm 7.8.6, p. 480), with Mathlib's Schur product theorem
`Matrix.PosSemidef.hadamard` for positivity. The outer inequalities are Hadamard's inequality,
`det B ≤ ∏ bᵢᵢ`, for `B` and for `A ∘ B`: a positive semidefinite `B` is the Gram matrix of the
columns of `B^(1/2)`, and Tau Ceti's Hadamard inequality for Gram determinants
(`TauCeti/Analysis/InnerProductSpace/Gram/Hadamard.lean`) bounds its determinant by the product
of the squared column norms `bᵢᵢ`. Schur's bound: `A - λ_min(A) I` is positive
semidefinite, so `(A - λ_min(A) I) ∘ B` is, and its diagonal part is `λ_min(A) diag(bᵢᵢ)`.

### 6.2 Singular values of Hadamard products

- **Ky Fan sums** (`sum_singularValues_hadamard_le`): for complex rectangular `A`, `B`,
  `∑_{i<k} sᵢ(A ∘ B) ≤ ∑_{i<k} sᵢ(A) sᵢ(B)` for every `k` (Horn–Johnson 1991, Thm 5.5.4,
  p. 334).

*Proof route.* Horn–Johnson 1991 derive it from Thm 5.5.19, p. 343, which bounds
`∑_{i<k} sᵢ(A ∘ B)` by `∑_{i<k} (pᵢ(A) qᵢ(A))^(1/2) sᵢ(B)`, with `pᵢ`, `qᵢ` the decreasingly
ordered diagonal entries of `(AA*)^(1/2)` and `(A*A)^(1/2)` (Def 5.5.17, p. 342; see the remark
after Thm 5.5.4,
p. 335). The weights are weakly majorized by `s(A)` by the forward Schur–Horn theorem of Tau Ceti
and the arithmetic–geometric mean inequality, and Abel summation against the decreasing `sᵢ(B)`
finishes. The bound through the Kronecker product `A ⊗ B`, of which `A ∘ B` is a compression, is
too weak: its top `k` singular values include cross products `sᵢ(A) sⱼ(B)` with `i ≠ j`.

### Examples

- Oppenheim needs positivity: for the Hermitian `A = B = [[1, 2], [2, 1]]`,
  `A ∘ B = [[1, 4], [4, 1]]`, and `det A · ∏ bᵢᵢ = -3 > -15 = det(A ∘ B)`.

### Dependencies

Layer 2.3 and Mathlib's Schur product theorem; Tau Ceti's Ky Fan bounds for 6.2.

## Layer 7: positive definite completions

### 7.1 Chordal graphs

Chordal graphs, Dirac's simplicial vertex theorem and perfect elimination orderings are consumed
from PerfectAndChordalGraphs, Sections 1.1, 1.3 and 1.4: a graph is chordal when no cycle graph on
at least four vertices is an induced subgraph; on a finite vertex type, a chordal graph that is
not complete has two nonadjacent simplicial vertices; and a finite graph is chordal exactly when
its vertices can be ordered so that the neighbours of each vertex that follow it form a clique
(Bakonyi–Woerdeman, Section 1.2, p. 9, Lemma 1.2.3 and Thm 1.2.4, p. 10). `IsChordal` in
`Suggested.lean` is a verbatim copy of that roadmap's definition, used to state 7.2.

- **Chordal completion by one edge.** A noncomplete chordal graph has a non-edge whose addition
  keeps it chordal, and the enlarged graph has a unique maximal clique that is not a clique of
  the original (Bakonyi–Woerdeman, Lemma 2.2.5, p. 78).

*Needs:* PerfectAndChordalGraphs, Sections 1.1, 1.3 and 1.4.

### 7.2 The Grone–Johnson–Sá–Wolkowicz theorem

- **Partial positive definiteness** (`IsPartiallyPosDef`): a matrix `A`, read as a partial
  matrix with pattern `G`, is partially positive definite when every principal submatrix on a
  clique of `G` is positive definite; entries off the pattern are ignored
  (Bakonyi–Woerdeman, Section 2.2, p. 77). `IsPatternCompletion G A B`: `B` agrees with `A` on the
  diagonal and on the edges of `G`.
- **Grone–Johnson–Sá–Wolkowicz** (`isChordal_iff_forall_exists_posDef_completion`): every
  partially positive definite matrix with pattern `G` has a positive definite completion exactly
  when `G` is chordal (Bakonyi–Woerdeman, Thm 2.2.4, p. 78, and Prop 2.2.6, p. 79).
- **Banded patterns.** A partially positive definite banded matrix has a positive definite
  completion (Bakonyi–Woerdeman, Thm 2.1.4, p. 74, and Cor 2.1.5, p. 75).

*Proof route.* Sufficiency: add the edges of Lemma 2.2.5 one at a time; each step completes a
single entry in a `3 × 3` block situation, where the one-step extension lemma for positive
definite block matrices applies (Bakonyi–Woerdeman, Thm 2.2.4 and its proof, p. 78, via the
band case of Section 2.1). Necessity: an induced cycle of length `k ≥ 4` carries the data
diagonal `1`, `c` on `k - 1` edges and `-c` on the last edge with `c` close to `1`, whose principal
submatrices on edges are positive definite but which has no positive definite completion; extend
by the identity off the cycle (Bakonyi–Woerdeman, Prop 2.2.6, p. 79).

**Checks.**

- `IsPartiallyPosDef`: the four-cycle data with `c = 9/10` is partially positive definite and has
  no positive definite completion. Negative control: under a definition requiring only the
  diagonal to be positive, the single edge with diagonal `1` and off-diagonal value `2` would be
  admissible, and its `2 × 2` block has determinant `-3`, so it has no positive definite
  completion and the theorem would fail for every graph with an edge; a definition testing all
  principal submatrices would make the condition depend on the unspecified entries.
- `IsPartiallyPosDef`: for the complete graph the condition is that `A` is positive definite,
  and for the empty graph that the diagonal is positive.

### 7.3 The maximum-determinant completion

- **Maximum-determinant completion** (`exists_posDef_completion_isGreatest_det`): if a partial
  matrix with pattern `G` has a positive definite completion, it has a unique one `F` of maximal
  determinant, and `F` is the only positive definite completion whose inverse vanishes at every
  position off the pattern; no chordality is needed (Bakonyi–Woerdeman, Cor 1.4.5, p. 44, from
  Thm 1.4.3, pp. 42–43).
- **Chordal max-det completion by factorization.** For chordal `G` whose vertex order is a perfect
  elimination ordering, the completion `F` above is the one whose inverse has a triangular
  factorization supported on `G`, and for every positive definite completion `B` the diagonal
  factor of the triangular factorization of `B` is at most that of `F`, with equality only for
  `B = F`; this gives the maximum-determinant property directly (Bakonyi–Woerdeman,
  Thm 2.2.10 and Cor 2.2.11, p. 82).

*Proof route.* `log det` is strictly concave on the positive definite cone and tends to `-∞` at
its boundary, so it attains a unique maximum on the compact convex set of positive definite
completions with determinant at least that of a given one. The first-order condition at an
interior point of the affine space of completions is `tr(F⁻¹ E_{ij}) = 0` for every unspecified
position, which is the vanishing of `F⁻¹` there; strict concavity makes that condition
characterize `F` (Bakonyi–Woerdeman, proof of Thm 1.4.3, pp. 42–43).

### Examples

- Bakonyi–Woerdeman, Example 1.4.6, p. 44: the pattern with unknowns `x₁` at `(1, 3)` and `x₂` at
  `(2, 4)` of `[[3, 2, x₁, -1], [2, 3, 1, x₂], [x₁, 1, 3, 1], [-1, x₂, 1, 3]]` has max-det
  completion `x₁ = -x₂ = (3 - √5)/2`: there both entries of the inverse at the unknowns vanish, and
  the determinant is `(25 + 15√5)/2`.
- On the path `1 - 2 - 3 - 4` with diagonal `1` and edge values `c`, `|c| < 1`, the max-det
  completion has entries `c^|i-j|` and a tridiagonal inverse.

### Dependencies

Mathlib's positive definite matrices, Schur complements and simple graphs;
PerfectAndChordalGraphs, Sections 1.1, 1.3 and 1.4. Independent of Layers 1–6.

## Downstream consumers

- SubadditiveAndMultiplicativeErgodicTheorems consumes 2.4: the norm of exterior powers as a
  product of singular values, and their submultiplicativity, are the input to the Oseledets
  theorem.
- TraceInequalitiesAndQuantumEntropy consumes 1.1 and 3.3.
- MeansMajorizationAndDiscreteInequalities lists Lidskii's theorem and matrix majorization as
  beyond its scope; Layers 3 and 4 are where Lidskii's majorization and its norm forms are built.

## Scope and ownership

The roadmap is complete when Tau Ceti proves all of the following.

1. **Weak log-majorization** with its transfer to weak majorization, to `φ`-sums and to products.
2. **Triangularization and compressions.** Eigenvalue moduli, Schur triangularization in
   invariant and unitary form, the compression determinant bound, `|det| = ∏ s`, and the norm and
   submultiplicativity of real exterior powers.
3. **Variational theory.** The complementary-flag lemma, Wielandt's minimax principle and its
   form for compressions, Lidskii's majorization, the two-sided Lidskii–Mirsky bounds, the
   converse of Cauchy interlacing and the normal Hoffman–Wielandt inequality.
4. **Sums and real parts.** Rotfel'd's inequality and the Rotfel'd–Thompson majorization;
   Fan–Hoffman, Ky Fan's real-part majorization, the unitary comparison, Thompson's triangle
   inequality and Ostrowski–Taussky.
5. **Products.** Weyl's majorant theorem and its `φ`-forms, Horn's product inequality, Thompson's
   product majorization, Gelfand–Naimark, Lidskii for positive products, Yamamoto, Mirsky's
   lemma and Horn's converse.
6. **Hadamard products.** Oppenheim's chain, Schur's lower eigenvalue bound and the Ky Fan sums of
   Hadamard products.
7. **Completions.** The one-edge chordal extension, the Grone–Johnson–Sá–Wolkowicz theorem,
   banded completions, the maximum-determinant completion and its chordal formula.

**Not owned here.**

- In Tau Ceti at the pin, and consumed: Courant–Fischer, eigenvalue monotonicity and Weyl's
  perturbation inequalities `λ_{i+j}(T + S) ≤ λᵢ(T) + λⱼ(S)`; Ky Fan sums and their
  subadditivity; the forward and converse Schur–Horn theorem; the symmetric Hoffman–Wielandt
  inequality; the Weyl perturbation bound `|sᵢ(A) - sᵢ(B)| ≤ ‖A - B‖`; unitarily invariant
  seminorms, gauges and Fan dominance; the modulus and polar decomposition. These realize targets
  of [OperatorTheory/Majorization](../OperatorTheory/Majorization/README.md) (Parts A and B),
  [OperatorTheory/PolarDecomposition](../OperatorTheory/PolarDecomposition/README.md) (PD-A29,
  PD-A51–PD-A53), [OperatorTheory/PrincipalAngles](../OperatorTheory/PrincipalAngles/README.md)
  (PA-B32, PA-B40) and [OperatorTheory/OperatorIdeals](../OperatorTheory/OperatorIdeals/README.md)
  (OI-A50). The converse Schur–Horn theorem is not a target for this reason.
- In Tau Ceti at the pin, in modules that `Suggested.lean` does not import: Hadamard's inequality
  for Gram determinants (`TauCeti/Analysis/InnerProductSpace/Gram/Hadamard.lean`, used in 6.1),
  and Fischer's and Koteljanskii's determinant inequalities
  (`TauCeti/Analysis/InnerProductSpace/Gram/Fischer.lean`,
  `TauCeti/Analysis/Matrix/PosSemidef/Determinant.lean`).
- Cauchy interlacing for Hermitian matrices: [RandomMatrices](../RandomMatrices/README.md),
  Section 1.2; it is formalized in Tau Ceti
  (`TauCeti/Analysis/Matrix/Eigenvalues/Interlacing.lean`).
  Only its converse (3.4) is a target here.
- Lidskii's inequality for Hermitian eigenvalues, Lidskii's theorem for singular values (any `k`
  of the differences `|sᵢ(A) - sᵢ(B)|` against the Ky Fan `k`-sum of `A - B`) and Mirsky's
  theorem in every unitarily invariant seminorm: SpectralSteepestDescent, Section 2.1, consumed
  in 3.2 and 4.1.
- Chordal graphs, minimal separators, Dirac's theorems and perfect elimination orderings:
  PerfectAndChordalGraphs, Sections 1.1–1.4, consumed in Layer 7. That roadmap lists chordal
  completions outside its scope; the one-edge chordal extension and 7.2–7.3 are owned here.
- Majorization of tuples as a predicate, doubly substochastic matrices, Karamata, Tomić–Weyl and
  Hardy–Littlewood–Pólya: MeansMajorizationAndDiscreteInequalities, Layer 4. The transfer of
  weak majorization used in 1.1 is a step of that item, not a separate target.
- Kittaneh, Bhatia–Kittaneh, Bhatia–Davis, Heinz and the product inequality
  `‖AB‖ ≤ ‖(A + B)²‖ / 4`, and every operator monotone function:
  OperatorMonotoneFunctionsAndMatrixMeans.
- Bauer–Fike, the spectral variation bound for normal matrices, Gershgorin counting and
  first-order eigenvalue perturbation: ConditioningAndPerturbation. The Davis–Kahan theorems:
  OperatorTheory/SpectralSubspacePerturbation.
- The Schur product theorem equivalences and the norm of Schur multipliers:
  SchattenClassesAndSchurMultipliers. Hölder's inequality for Schatten norms:
  [NoncommutativeIntegration](../NoncommutativeIntegration/README.md), Section 3.3.

## Exact supplier contracts

### From Mathlib

Paths are relative to `Mathlib/`.

- Eigenvalues of symmetric operators: `LinearMap.IsSymmetric.eigenvalues`,
  `LinearMap.IsSymmetric.eigenvalues_antitone` (`Analysis/InnerProductSpace/Spectrum.lean`,
  `Analysis/Matrix/Spectrum.lean`).
- Singular values: `LinearMap.singularValues` (`Analysis/InnerProductSpace/SingularValues.lean`).
- Characteristic polynomials and generalized eigenspaces: `LinearMap.charpoly`
  (`LinearAlgebra/Charpoly/Basic.lean`), `Module.End.iSup_maxGenEigenspace_eq_top`
  (`LinearAlgebra/Eigenspace/Triangularizable.lean`).
- Exterior powers: `exteriorPower.map`, `exteriorPower.map_comp`
  (`LinearAlgebra/ExteriorPower/Basic.lean`); the inner product, `exteriorPower.inner_ιMulti_ιMulti`
  and `OrthonormalBasis.exteriorPower` (`Analysis/InnerProductSpace/ExteriorPower.lean`).
- Birkhoff's theorem: `doublyStochastic_eq_convexHull_permMatrix` (`Analysis/Convex/Birkhoff.lean`).
- Schur products and positivity: `Matrix.PosSemidef.hadamard` (`Analysis/Matrix/Order.lean`),
  `Matrix.PosDef`, `Matrix.PosSemidef`, `Matrix.BlockTriangular`, `Matrix.toEuclideanLin`.
- Graphs: `SimpleGraph.IsClique`, `SimpleGraph.cycleGraph`, `SimpleGraph.IsIndContained`
  (`Combinatorics/SimpleGraph/`).

### From Tau Ceti

Paths are relative to `TauCeti/`.

- `Algebra/BigOperators/Finset/PartialSum.lean`: `TauCeti.prefixSum`.
- `Analysis/Convex/Majorization.lean`: `TauCeti.IsWeaklyMajorizedBy`.
- `Analysis/Convex/PermutationOrbit.lean`: `TauCeti.mem_convexHull_range_comp_perm_iff`.
- `Analysis/InnerProductSpace/CourantFischer.lean`:
  `LinearMap.IsSymmetric.eigenvalues_eq_iSup_iInf_re_inner`,
  `LinearMap.IsSymmetric.eigenvalue_mono`, `LinearMap.IsSymmetric.eigenvalues_add_le`,
  `LinearMap.IsSymmetric.le_eigenvalues_add`.
- `Analysis/InnerProductSpace/KyFan.lean`: `LinearMap.kyFanSum`, `LinearMap.kyFanSum_add_le`,
  `LinearMap.kyFanSum_adjoint`, `LinearMap.IsSymmetric.sum_re_inner_apply_self_le_sum_eigenvalues`.
- `Analysis/InnerProductSpace/SchurHorn.lean`:
  `LinearMap.IsSymmetric.range_re_inner_apply_self_eq_convexHull_eigenvalues_comp_perm`.
- `Analysis/InnerProductSpace/HoffmanWielandt/Basic.lean`:
  `LinearMap.IsSymmetric.sum_sq_eigenvalues_sub_le_sum_sq_norm_apply`.
- `Analysis/InnerProductSpace/UnitarilyInvariantSeminorm/Gauge.lean` and `FanDominance.lean`:
  `TauCeti.UnitarilyInvariantSeminorm`, `TauCeti.UnitarilyInvariantSeminorm.gauge`,
  `TauCeti.UnitarilyInvariantSeminorm.map_eq_gauge_singularValues`,
  `TauCeti.UnitarilyInvariantSeminorm.map_le_of_kyFanSum_le`.
- `Analysis/OperatorIdeal/ApproximationNumber/EckartYoung.lean`:
  `LinearMap.abs_singularValues_sub_singularValues_le`.
- `Analysis/InnerProductSpace/SingularValues.lean` and `Positive/SquareRoot.lean`:
  `LinearMap.singularValues_comp_le`, `LinearMap.operatorAbs`.
- `Analysis/InnerProductSpace/NormalOperator.lean`: the spectral theorem for normal operators
  (3.5); not imported by `Suggested.lean`, whose statement needs only `IsStarNormal`.

### From other roadmaps

- **OperatorTheory/Majorization**, Parts A and B; **OperatorTheory/PolarDecomposition**, PD-A29
  and PD-A51–PD-A53; **OperatorTheory/PrincipalAngles**, PA-B32 and PA-B40;
  **OperatorTheory/OperatorIdeals**, OI-A50. All are consumed through the Tau Ceti declarations
  above, which realize them at the pin.
- **SpectralSteepestDescent**, Section 2.1, for finite-dimensional inner product spaces over
  `𝕜` (`RCLike 𝕜`), with no further hypothesis: Lidskii's inequality for symmetric `S`, `T` and
  every set `J` of `k` indices, `∑_{j ∈ J} (λⱼ(S) - λⱼ(T))` at most the sum of the `k` largest
  eigenvalues of `S - T` (used in 3.2); for `A B : E →ₗ[𝕜] F`, every `k` and every set of at most
  `k` indices, the sum of `|sᵢ(A) - sᵢ(B)|` over it at most the Ky Fan `k`-sum of `A - B`, and
  its consequence for every unitarily invariant seminorm (4.1).
- **PerfectAndChordalGraphs**, Sections 1.1, 1.3 and 1.4: the definition of chordality (copied
  verbatim into `Suggested.lean`), and, on a finite vertex type, Dirac's simplicial vertex
  theorem for chordal graphs that are not complete and the characterization of chordal graphs
  by perfect elimination orderings (used in 7.1–7.3).

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

- **Horn's conjecture.** The Klyachko–Knutson–Tao description of the possible eigenvalues of
  `A + B` by Horn's inequalities (Marshall–Olkin–Arnold, Section 9.G, pp. 329–338, for the
  statement): needs the saturation conjecture and honeycombs, a separate combinatorial roadmap.
- **Trace and log-majorization inequalities of Araki, Lieb–Thirring and Ando–Hiai**
  (Marshall–Olkin–Arnold, 9.H.1.j and 9.H.6, pp. 341–347): they rest on operator monotone
  functions and belong after OperatorMonotoneFunctionsAndMatrixMeans.
- **Eigenvalue inequalities in infinite dimensions.** Lidskii and Weyl for compact operators,
  and the Lidskii trace formula: these belong with operator ideals.
- **Completions beyond positivity.** Contractive and Toeplitz completions, Carathéodory–Fejér and
  Parrott's theorem (Bakonyi–Woerdeman, Chapters 2.3–2.6 and 3): a completion roadmap of its own.
- **Exterior powers over `ℂ`.** Mathlib's inner product on exterior powers is real; the complex
  version would let 2.4 serve complex matrices directly.

## Prior formalization

Tau Ceti at the pin has Courant–Fischer, Weyl's perturbation inequalities, Ky Fan sums with their
subadditivity and weak majorization, the forward and converse Schur–Horn theorem, the symmetric
Hoffman–Wielandt inequality, unitarily invariant seminorms with gauges and Fan dominance, and
the singular value perturbation bound, and the Hadamard, Fischer and Koteljanskii determinant
inequalities; Cauchy interlacing for Hermitian matrices is also formalized in Tau Ceti
(`TauCeti/Analysis/Matrix/Eigenvalues/Interlacing.lean`). Mathlib has the inner product space on
real exterior powers, Birkhoff's theorem, the Schur product theorem and simple graphs. Neither
has Wielandt's principle, Lidskii's majorization, Weyl's majorant theorem, Horn's or
Gelfand–Naimark's product inequalities, Oppenheim's inequality, Thompson's inequality, or matrix
completions.

## References

The locators refer to these editions; page numbers are printed page numbers.

- M. Bakonyi and H. J. Woerdeman, *Matrix Completions, Moments, and Sums of Hermitian Squares*,
  Princeton University Press, 2011. Sections 1.2 (chordal graphs), 1.4 (determinant
  maximization) and 2.1–2.2 (positive definite completions).
- R. Bhatia, *Matrix Analysis*, Graduate Texts in Mathematics 169, Springer, 1997. Chapter II
  (Section II.3, log-majorization and Weyl's theorem), Chapter III (variational principles,
  Lidskii, Gelfand–Naimark, real parts), Chapter IV (Sections IV.2–IV.3, symmetric norms and
  singular value perturbation) and Section VI.4 (Hoffman–Wielandt).
- R. A. Horn and C. R. Johnson, *Matrix Analysis*, Cambridge University Press, 1985. Section 2.3
  (Schur triangularization), Section 4.3 (interlacing and bordering) and Section 7.8
  (determinant inequalities).
- R. A. Horn and C. R. Johnson, *Topics in Matrix Analysis*, Cambridge University Press, 1991.
  Sections 3.3 (Weyl and Horn products, Yamamoto), 3.6 (Horn's converse) and 5.3, 5.5 (Hadamard
  products).
- A. W. Marshall, I. Olkin and B. C. Arnold, *Inequalities: Theory of Majorization and Its
  Applications*, 2nd ed., Springer Series in Statistics, Springer, 2011. Section 1.A
  (log-majorization), Section 5.A and Chapter 9 (Sections 9.E–9.H, eigenvalues and singular
  values of sums and products).

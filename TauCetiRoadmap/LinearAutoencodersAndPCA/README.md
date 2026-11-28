# Roadmap: linear autoencoders and principal components

**Summary.** A linear autoencoder with input dimension `n` and hidden width `p` is the two-layer
network without biases or activations: an encoder `A`, a `p × n` matrix, followed by a decoder
`B`, an `n × p` matrix, so that the pair `(A, B)` realizes `x ↦ BAx`. This roadmap studies the
set of maps such networks realize, the parameters that realize a given map, and the square loss
`E(A, B) = Σ_t ‖x_t − BAx_t‖²` on finitely many data points `x_1, …, x_m` of `ℝⁿ`, whose
second-moment matrix `Σ = Σ_t x_t x_tᵀ` has eigenvalues `λ_1 ≥ ⋯ ≥ λ_n ≥ 0`. Sizes may be `0`
unless a statement says otherwise; `Σ` need not be invertible.

- *The function space and its fibres.* Over any field the realized maps are the linear maps of rank
  at most `p`, by the rank factorization of the library; their coefficient image is Zariski closed,
  the determinantal variety cut out by the `(p + 1) × (p + 1)` minors. The parameters realizing a
  map `M` form a single orbit of `GL_p`, acting by `(A, B) ↦ (CA, BC⁻¹)`, exactly when `M` has rank
  `min(p, n)`. For `n ≥ 1` and `p ≥ 2` the permutations and rescalings of hidden neurons are not
  enough: at a parameter of maximal rank, the fibre is never a single class of these symmetries.
- *The landscape.* At every critical point `(A, B)` of `E`, the column space of `B` is invariant
  under `Σ`, the network sends the data to their orthogonal projection `Px` onto it, and
  `E = tr Σ − tr(PΣ)`; conversely every orthogonal projection of rank at most `p` commuting with
  `Σ` is the product `BA` at a critical point. The least value of `E` is `λ_{p+1} + ⋯ + λ_n`, the
  Eckart–Young value. If `0 < p < n` and `λ_p > λ_{p+1}`, the global minimizers are exactly the
  pairs with `BAx_t = Px_t` for all `t`, `P` the projection onto the top `p` eigenvectors; for
  invertible `Σ` this says `BA = P`. Every local minimum of `E` is global, and for `p ≥ 1` and
  nonzero data `E` has no local maximum, so every other critical point is a saddle.
- *Stability for one hidden unit.* For `p = 1`, if the top eigenvalue of `Σ` exceeds the others
  by `ν > 0` and the second-moment matrix of new data differs from `Σ` by less than `ν/2` in
  operator norm, the minimizers for the two data sets are given by the projections onto unit
  vectors `θ` and `θ̂` whose distance obeys the Davis–Kahan bound.

The networks, fibres, identifiability, neurovarieties and hidden-neuron symmetries are those of
the Neuromanifolds roadmap, as Tau Ceti realizes it. MathematicalStatisticsNonparametric gives
the optimality of principal subspaces, unique under a gap,
MathematicalStatisticsHighDimensional the perturbation of the leading eigenvector, and Tau Ceti's
matrix rank theory the rank factorizations and minors.

Layers 1, 2 (over `ℝ`) and 3 treat the three items in this order.

## Conventions

- **Sizes.** `n` is the input and output dimension, `p` the hidden width, `m` the number of data
  points; all three are arbitrary natural numbers. Vectors are functions `Fin n → K`; matrices are
  Mathlib's `Matrix (Fin a) (Fin b) K`, and `M *ᵥ x` is `Matrix.mulVec`.
- **The network.** A parameter is a pair `q = (A, B)` with `A : Matrix (Fin p) (Fin n) K` (the
  encoder) and `B : Matrix (Fin n) (Fin p) K` (the decoder). The model is
  `linearAutoencoder K n p = compose Matrix.mulVec Matrix.mulVec`, Tau Ceti's composite of two
  bias-free dense layers: `(A, B)` realizes `x ↦ B *ᵥ (A *ᵥ x)`, which is `(B * A) *ᵥ x` by Tau
  Ceti's `compose_mulVec_mulVec`. Neuromanifold notions (`realizedFunctions`, `fiber`,
  `parameterSetoid`, `IdentifiableAt`, `neurovariety`, `IsAlgebraicImage`) are Tau Ceti's,
  unchanged.
- **The same network as a perceptron.** For the hidden-neuron symmetries the network is
  `MLPSpec.linear ![n, p, n] : MLPSpec K 2` with its bias-free realization `realizeWeights`; a
  weight tuple `w` has encoder `encoderWeight w = w 0` and decoder `decoderWeight w = w 1`.
  Its hidden activation is the identity, which is the monomial activation of exponent `1`
  (`MLPSpec.monomial_one`), so Tau Ceti's `hiddenSymmetrySetoid` is used with exponent `1`.
- **Rank** is Mathlib's `Matrix.rank`, the dimension of the column space, a natural number (not
  the cardinal-valued `LinearMap.rank`).
- **Data and loss** (Layers 2–3, over `ℝ`). The data matrix `X : Matrix (Fin n) (Fin m) ℝ` has the
  data points as columns. The loss `loss X q` is `Σ_t Σ_i (x_t − f_q(x_t))_i²`, with `f_q` the
  realized map, that is the squared Frobenius norm `‖X − BAX‖²`; it carries no factor `½` (Zhou and
  Liang's loss is half of it, so their critical values are half of the values below). The data are
  not centred: centred data are the special case of mean zero. The second-moment matrix is
  `Σ = X * Xᴴ`, which over `ℝ` is `X Xᵀ` (Mathlib's `conjTranspose_eq_transpose_of_trivial`).
- **Eigenvalues.** `(isHermitian_mul_conjTranspose_self X).eigenvalues₀ j`, for
  `j : Fin (Fintype.card (Fin n))`, lists the eigenvalues of `Σ` with multiplicity in decreasing
  order (`eigenvalues₀_antitone`); in prose `λ_{j+1}` is the value at index `j`. Mathlib's
  `eigenvalues` and `eigenvectorBasis` index the same eigenvalues and an orthonormal eigenbasis by
  `Fin n`, in an unspecified order.
- **Critical points and extrema.** `IsCriticalPoint X q` says that every directional derivative of
  the loss at `q` vanishes; since the loss is a polynomial in the entries, this is the vanishing of
  both partial gradients. Local minima and maxima are Mathlib's `IsLocalMin` and `IsLocalMax` for
  the product topology on pairs of matrices; a global minimum is `IsMinOn (loss X) Set.univ`.

## Layer 1: the function space and the parameter fibres

All of Layer 1 holds over an arbitrary field `K`.

### 1.1 Realized maps (from the library)

The realized maps of `linearAutoencoder K n p` are exactly the maps `x ↦ M *ᵥ x` with `M` of rank
at most `p`; when `p ≥ n` every linear map is realized. This is not a target: Tau Ceti's
`realizedFunctions_compose_mulVec_mulVec` identifies the realized maps with the evaluations of the
products `B * A`, and Tau Ceti's `Matrix.rank_le_iff_exists_eq_mul` says that a matrix has rank at
most `p` exactly when it is such a product, so the identification is a few lines from these two
declarations. It is recorded because 1.2 and 1.3 use it. (Marchetti–Shahverdi–Mereta–Trager–Kohn,
Appendix A, p. 13, state it for `ℝ` as a known fact.)

**Checks.**

- `n = 2`, `p = 1`: `[[1, 2], [2, 4]] = (1, 2)ᵀ(1, 2)` has rank `1` and is realized; the identity
  of rank `2` is not. The width-one network therefore realizes a proper subset of the linear maps,
  while `p = 2` realizes all of them.
- `p = 0`: the only realized map is `0`, the only matrix of rank `0`.

*Needs:* Tau Ceti `realizedFunctions_compose_mulVec_mulVec`, `Matrix.rank_le_iff_exists_eq_mul`.

### 1.2 The neurovariety is the determinantal variety

Define the coefficient map `productCoefficients K n p (A, B) = fun (i, j) ↦ (B * A) i j`. Prove
(`isAlgebraicImage_productCoefficients`) that its image is algebraic in Tau Ceti's sense
(`IsAlgebraicImage`: the image equals its Zariski closure, the `neurovariety`), and that the image
is the zero locus of Mathlib's `determinantalIdeal K (Fin n) (Fin n) (Fin (p + 1))`, the ideal of
the `(p + 1) × (p + 1)` minors of the generic `n × n` matrix (Marchetti et al., Appendix A, p. 13,
stated for `ℝ`). Route: by 1.1 the image is the set of matrices of rank at most `p`. Its Zariski
closedness alone already follows from Tau Ceti's `Matrix.rank_le_of_mem_zeroLocus_vanishingIdeal`
(a rank bound holding on a set holds on its Zariski closure); the zero-locus description needs the
minors themselves: by Tau Ceti's
`Matrix.rank_le_iff_forall_det_submatrix_eq_zero` this is the set where every minor indexed by
embeddings `Fin (p + 1) ↪ Fin n` vanishes; minors indexed by non-injective maps vanish anyway
(`Matrix.det_zero_of_row_eq`), and Mathlib's `aeval_mvPolynomialMinor` evaluates a generic minor
at a matrix. So the image is a zero locus, which is `isAlgebraicImage_iff_exists_zeroLocus`.

The linear autoencoder thus contrasts with Tau Ceti's scalar model `w ↦ w²x`, whose image is not
algebraic (`not_isAlgebraicImage_const_sq`).

**Checks.**

- `n = 2`, `p = 1`: the determinantal ideal is generated by the single minor `z₁₁z₂₂ − z₁₂z₂₁`;
  it vanishes at `[[1, 2], [2, 4]]` and equals `1` at the identity.
- `p ≥ n`: the ideal of `(p + 1)`-minors of an `n × n` matrix is the zero ideal (there is no
  embedding `Fin (p + 1) ↪ Fin n`, and the minors along non-injective maps are `0`), so its zero
  locus is everything, in agreement with `isAlgebraicImage_of_surjective`.

*Needs:* 1.1; Tau Ceti `Matrix.rank_le_iff_forall_det_submatrix_eq_zero`,
`isAlgebraicImage_iff_exists_zeroLocus`, `Matrix.rank_le_of_mem_zeroLocus_vanishingIdeal`; Mathlib
`MvPolynomial.determinantalIdeal`, `Matrix.aeval_mvPolynomialMinor`, `Matrix.det_zero_of_row_eq`,
`MvPolynomial.zeroLocus`.

### 1.3 Fibres and the general linear group

Define `glSetoid K n p`, the equivalence relation generated by `(A, B) ~ (CA, BC⁻¹)` for
`C ∈ GL (Fin p) K`; since these moves form a group action, its classes are the orbits, and they lie
in the fibres of the network because `BC⁻¹CA = BA`. Prove (`identifiableAt_glSetoid_iff`) that the
network is identifiable modulo `glSetoid` at `(A, B)` (Tau Ceti's `IdentifiableAt`: the whole fibre
through `(A, B)` is its orbit) exactly when `rank(BA) = min(p, n)`.

Marchetti et al. (§4.3, p. 7, and Appendix A, p. 13) observe that the product is invariant under
this action and that for generic parameters the fibre is a copy of `GL_p`. The exact criterion is
proved here.

Route.

- *Maximal rank, `p ≤ n`.* Then `rank(BA) = p`, and two factorizations `BA = B'A'` through `Fin p`
  of a matrix of rank `p` differ by a unit: this is Tau Ceti's
  `Matrix.exists_unit_eq_mul_of_rank_factorization` (`B' = Bg`, `A' = g⁻¹A`), so `(A', B')` is in
  the orbit of `(A, B)`.
- *Maximal rank, `p > n`.* Then `rank(BA) = n`, so `BA` is invertible, `A : Kⁿ → K^p` is
  injective, `B` is surjective and `K^p = im A ⊕ ker B`. For another pair with `B'A' = BA`, the
  same holds for `(A', B')`; define `C` on `im A` by `C(Ax) = A'x` and on `ker B` by any
  isomorphism onto `ker B'` (both have dimension `p − n`). Then `CA = A'` and `B'C = B`, so
  `(A', B') = (CA, BC⁻¹)`.
- *Smaller rank.* If `r = rank(BA) < min(p, n)`, factor `BA = B₁A₁` with `A₁` of rank `r` (rank
  factorization through `Fin r`, padded with zero rows of `A₁` and zero columns of `B₁`), and
  obtain `A₂` from `A₁` by replacing a zero row with a vector outside the row space of `A₁` (there
  is one since `r < n`); as the corresponding column of `B₁` is zero, `B₁A₂ = B₁A₁`. The pairs
  `(A₁, B₁)` and `(A₂, B₁)` lie in the fibre with `rank A₁ = r ≠ r + 1 = rank A₂`, and the action of
  `GL_p` preserves the rank of the encoder, so the fibre contains two orbits.

**Checks.**

- `n = 2`, `p = 1`: the fibre over `0` contains `(A, 0)` and `(0, B)` for all `A`, `B`, and the
  orbit of `(0, 0)` is `{(0, 0)}`; rank `0 < 1 = min(p, n)`, and identifiability fails.
- `n = p = 2`: `diag(1, 0) = diag(1, 0) · diag(1, 0) = diag(1, 0) · I`, with encoders of ranks `1`
  and `2`: two orbits in one fibre.
- `n = 1`, `p = 2` (the criterion is `rank = min(p, n)`, not `rank = p`): the pairs
  `a = (1, 0)ᵀ, b = (1, 0)` and `a' = (1, 1)ᵀ, b' = (0, 1)` both realize `1`, and
  `C = [[1, 1], [1, 0]]` (determinant `−1`) satisfies `Ca = a'` and `bC⁻¹ = b'`. Here
  `rank(ba) = 1 < p`, yet the fibre is one orbit.

*Needs:* Tau Ceti `IdentifiableAt`, `identifiableAt_iff_fiber_subset`, `compose_mulVec_mulVec`,
`Matrix.exists_unit_eq_mul_of_rank_factorization`, `Matrix.rank_le_iff_exists_eq_mul`; Mathlib
`Matrix.rank_mul_le_left`, `Matrix.GeneralLinearGroup`, `Relation.EqvGen.setoid`.

### 1.4 Hidden-neuron symmetries are not enough

Read the network as `MLPSpec.linear ![n, p, n]`. Its bias-free realization is
`x ↦ (decoderWeight w * encoderWeight w) *ᵥ x`, and Tau Ceti's
`hiddenSymmetrySetoid_le_parameterSetoid` (for the activation `id = t ↦ t¹`) puts the classes of
`hiddenSymmetrySetoid (fun _ ↦ 1)`, the relation generated by permuting and rescaling the hidden
neurons, inside the fibres. The Neuromanifolds roadmap asserts no converse. Prove
(`identifiableAt_hiddenSymmetrySetoid_iff`) that for `n ≥ 1`, at a weight tuple whose product has
rank `min(p, n)`, the realization is identifiable modulo `hiddenSymmetrySetoid (fun _ ↦ 1)` exactly
when `p ≤ 1`. (Marchetti et al., §4.3, p. 7, note that for the identity activation every
invertible matrix acts, not only permutations and rescalings; the exact statement is proved here.)

Route. By the hidden-neuron API (`permuteHidden_apply_castSucc`, `permuteHidden_apply_succ`,
`scaleHidden_apply_castSucc`, `scaleHidden_apply_succ`) every generator replaces `(A, B)` by
`(DA, BD⁻¹)` with `D` a monomial matrix (a permutation matrix times an invertible diagonal one);
these pairs form an equivalence relation containing the generators, so by
`hiddenSymmetrySetoid_le_iff` the class of `(A, B)` is contained in its monomial orbit, and
conversely each monomial matrix is a product of generators. By 1.3 the fibre is the `GL_p`-orbit.

- `p = 0`: the weight space is a point. `p = 1`: `GL_1` consists of the invertible scalars, which
  are rescalings.
- `2 ≤ p ≤ n`: `A` is surjective, so `CA = DA` forces `C = D`; the shear `C = [[1, 1], [0, 1]]`
  (extended by the identity) is invertible and not monomial, so `(CA, BC⁻¹)` is in the fibre and
  not in the class.
- `1 ≤ n < p`: `(CA, BC⁻¹)` is in the class only if `C(im A) = D(im A)` for a monomial `D`, and
  monomial matrices map coordinate subspaces (spans of standard basis vectors) to coordinate
  subspaces and other subspaces to other subspaces. If `im A` is a coordinate subspace, choose
  `C ∈ GL_p` with `C(im A) = span(e₁ + e₂, e₃, …, e_{n+1})`, which is not one (a coordinate subspace
  containing `e₁ + e₂` contains `e₁`); otherwise choose `C` with `C(im A) = span(e₁, …, e_n)`.

**Checks.**

- The realization: with `n = 2`, `p = 1`, `w 0 = (1, 2)` and `w 1 = (1, 2)ᵀ`, the network maps `x`
  to `(x₁ + 2x₂)(1, 2)`, which is `[[1, 2], [2, 4]] *ᵥ x`, the same map as
  `linearAutoencoder K 2 1 ((1, 2), (1, 2)ᵀ)`.
- `n = p = 2`, `A = B = I`: the shear gives `(C, C⁻¹) = ([[1, 1], [0, 1]], [[1, −1], [0, 1]])`,
  which realizes `I`; `C` has two nonzero entries in its first row, so it is not monomial. The
  rotation with entries `3/5, 4/5` is another such witness over `ℝ`.
- `n = 1`, `p = 2`, `a = (1, 0)ᵀ`: with `C = [[1, 1], [1, 0]]` of 1.3, `Ca = (1, 1)ᵀ` spans a line
  that is not a coordinate axis.
- The hypothesis `n ≥ 1`: for `n = 0` and every `p` the weight space is a single point, so the
  network is identifiable although `p ≤ 1` may fail. The rank hypothesis: for `p = 1`, `n = 2` and
  zero weights the fibre is `{(A, 0)} ∪ {(0, B)}` and the class is `{(0, 0)}`.

*Needs:* 1.3; Tau Ceti `MLPSpec.linear`, `MLPSpec.realizeWeights`, `MLPSpec.realizeWeights_succ`,
`MLPSpec.layerActivation_linear`, `MLPSpec.monomial_one`, `MLPSpec.hiddenSymmetrySetoid`,
`MLPSpec.hiddenSymmetrySetoid_le_iff`, `MLPSpec.hiddenSymmetrySetoid_le_parameterSetoid`, the
`permuteHidden` and `scaleHidden` application lemmas, `IdentifiableAt`.

### Examples

The width-one network from `K²` to `K²` realizes the matrices of rank at most one (1.1), the
quadric `z₁₁z₂₂ = z₁₂z₂₁` (1.2); at a nonzero realized map its fibre is
`{(cA, c⁻¹B) | c ≠ 0}` (1.3, 1.4), and over the zero map it is `{A = 0} ∪ {B = 0}`.

### Dependencies

Tau Ceti's neuromanifold library (`compose`, `realizedFunctions`, `IdentifiableAt`,
`neurovariety`, `IsAlgebraicImage`, `MLPSpec` and its hidden-neuron symmetries) and matrix rank
theory; Mathlib's determinantal ideals and general linear group. Within the layer, 1.2 uses 1.1
and 1.4 uses 1.3.

## Layer 2: the loss landscape

Layer 2 works over `ℝ` with the data matrix `X` and `Σ = X * Xᴴ`. The loss is
`loss X (A, B) = ‖X − BAX‖² = tr Σ − 2 tr(BAΣ) + tr(BAΣ(BA)ᵀ)`, the matrix form following from
`compose_mulVec_mulVec`.

### 2.1 Critical points

Prove (`exists_projection_of_isCriticalPoint`) that at a critical point `(A, B)` there is an
orthogonal projection `P` (symmetric, `P² = P`) with `PB = B` and `rank P = rank B`, so that `P`
projects onto the column space of `B`, such that `PΣ = ΣP`, `BAX = PX` and
`loss X (A, B) = tr Σ − tr(PΣ)`. Conversely (`exists_isCriticalPoint_of_projection`), every
orthogonal projection `P` of rank at most `p` commuting with `Σ` equals `BA` at a critical point.
Since `P` commutes with `Σ`, its range is spanned by eigenvectors of `Σ`, and `tr(PΣ)` is the sum of
`rank P ≤ p` of the eigenvalues `λ_i`, counted with multiplicity: the critical values are
`tr Σ` minus such sums.

Source: Zhou–Liang, Theorem 1 and Proposition 1, p. 4 (all critical points of the square loss of a
one-hidden-layer linear network, no assumption on the data), with the proof in the supplement:
Lemma 1, eqs. (25)–(27), p. 11, and the proof of Proposition 1, eq. (28), pp. 12–13; the converse
is their choice `L₁ = 0` in Theorem 1 (p. 4) and in the proof of Proposition 2 (p. 13). Here only
the autoassociative case `Y = X` is stated, where their `Σ = Y X† X Yᵀ` is `XXᵀ`.

Route. The partial gradients are `∇_A = −2Bᵀ(X − BAX)Xᵀ` and `∇_B = −2(X − BAX)(AX)ᵀ`. Let `P` be
the orthogonal projection onto the column space of `B` (Mathlib's `Submodule.starProjection` of
the range, read as a matrix). From `∇_A = 0`: `Bᵀ(I − BA)Σ = 0`, hence `P(I − BA)Σ = 0`, that is
`BAΣ = PΣ` (as `PB = B`); then `(BA − P)XXᵀ = 0`, so `(BA − P)X = 0`. From `∇_B = 0` multiplied by
`Bᵀ` on the right: `Σ(BA)ᵀ = BAΣ(BA)ᵀ`, that is `ΣP = PΣP`; transposing, `PΣ = PΣP = ΣP`. The value
is `‖(I − P)X‖² = tr((I − P)Σ)`. For the converse, take `B` whose first `rank P` columns are an
orthonormal basis of the range of `P` and whose other columns are `0`, and `A = Bᵀ`; then `BA = P`,
`Bᵀ(I − P) = 0` gives `∇_A = 0`, and `∇_B = −2(I − P)ΣB = −2Σ(I − P)B = 0`.

**Checks.**

- `X = diag(3, 2, 1)`, `Σ = diag(9, 4, 1)`, `tr Σ = 14`, `p = 1`: the pairs `(e_iᵀ, e_i)` are
  critical with values `5, 10, 13`, and `(0, 0)` is critical with value `14`. So a critical point
  need not be a projection onto top eigenvectors, nor of full rank.
- The definition of a critical point needs both gradients: at `(0, e₁)` the gradient in `B` is `0`
  while the gradient in `A` is `(−18, 0, 0)`.
- `X = diag(1, 0)`, `p = 1`, `A = (1, 1)`, `B = e₁`: both gradients vanish and the loss is `0`,
  but `BA = [[1, 1], [0, 0]]` is not symmetric. The statement is `BAX = PX` (here `P = e₁e₁ᵀ`),
  not `BA = P`, which needs invertible `Σ`.
- The converse with `X = diag(3, 2, 1)`: the projections `diag(1, 0, 1)` (`p = 2`), `diag(0, 1, 0)`
  and `0` (`p = 1`), and `I` (`p = 3`) are each `BA` at a critical point, with values
  `14 − tr(PΣ) = 4, 10, 14, 0`.

*Needs:* Mathlib `Submodule.starProjection`, `HasDerivAt`, `Matrix.trace`,
`Matrix.isHermitian_mul_conjTranspose_self`; Tau Ceti `compose_mulVec_mulVec`.

### 2.2 The global minimum and the minimizers

Prove (`isLeast_loss`) that the least value of the loss is `λ_{p+1} + ⋯ + λ_n`, the sum of the
eigenvalues `eigenvalues₀ j` with `j ≥ p` (`0` when `p ≥ n`, `tr Σ` when `p = 0`). Define
`principalProjection X c`, the sum of `v vᵀ` over the vectors `v` of Mathlib's eigenbasis of `Σ`
with eigenvalue at least `c`: the orthogonal projection onto the sum of the eigenspaces of the
eigenvalues `≥ c`, which does not depend on the choice of eigenbasis. Prove (`isMinOn_loss_iff`)
that if exactly `p` eigenvalues, counted with multiplicity, are at least `c` (equivalently
`λ_p ≥ c > λ_{p+1}`; for `0 < p < n` such a `c` exists exactly when `λ_p > λ_{p+1}`), then
`(A, B)` is a global minimizer exactly when `BAX = principalProjection X c * X`. When `X` has
rank `n` (`Σ` invertible), the condition reads `BA = P`, and the minimizers form a single
`GL_p`-orbit (1.3 with `rank P = p`). Baldi and Hornik studied this loss with `p ≤ n` and `Σ`
invertible, as Zhou–Liang record on p. 3; Zhou–Liang drop both assumptions, and so does this
roadmap.

The value is the Eckart–Young value: `λ_i` is the square of the `i`-th singular value of `X`, and
`λ_{p+1} + ⋯ + λ_n` is the squared Frobenius distance from `X` to the matrices of rank at most `p`.
Source: Zhou–Liang, Proposition 2, p. 4 (global minimizers among critical points), with proof on
p. 13; the characterization by `BAX = PX` under a gap is stated here in this form.

Route, resting on MathematicalStatisticsNonparametric 8.3 (`fpca_optimal`). The case `m = 0` is
trivial (the loss is `0`), and so are `p = 0` and `p ≥ n` (when `p ≥ n`, `A = [I; 0]`,
`B = [I 0]` give `BA = I` and loss `0`). Otherwise let `Ω = Fin m × Bool` with the uniform
probability measure (`uniformOfFinset` of the whole of `Ω`, nonempty as `m ≥ 1`) and
`Z(t, s) = ±x_t` in `EuclideanSpace ℝ (Fin n)`: `Z` has mean `0`, so by
MathematicalStatisticsNonparametric 8.1 (`inner_centeredCovariance`) its centred covariance is
`Σ/m`; with `lam j = λ_{j+1}/m` for `j < n`, `lam j = 0` for `j ≥ n`, and `φ` the eigenvectors in
decreasing order of eigenvalue (padded by `0`), `IsEigenExpansion` holds, and
`∫ ‖Z − P_V Z‖² = ‖X − P_V X‖²/m` for every subspace `V`.

1. Lower bound. Let `S` be the column space of `BA` (dimension at most `p`) and `V ⊇ S` of
   dimension `p`. Since the columns of `BAX` lie in `S`,
   `‖X − BAX‖² ≥ ‖X − P_S X‖² ≥ ‖X − P_V X‖² ≥ λ_{p+1} + ⋯ + λ_n`, the last step by the first
   part of `fpca_optimal`.
2. Attainment. With `v_1, …, v_p` orthonormal eigenvectors for `λ_1, …, λ_p`, `B = [v_1 ⋯ v_p]`
   and `A = Bᵀ` give `loss = tr Σ − (λ_1 + ⋯ + λ_p)`.
3. Minimizers under the gap. If `BAX = PX`, the loss is `tr((I − P)Σ)`, the minimum. Conversely,
   if `(A, B)` is a minimizer, every inequality of step 1 is an equality, so `V` attains the bound
   and, by the third part of `fpca_optimal` (gap `lam p < lam (p − 1)`), `V` is the span of the top
   `p` eigenvectors, the range of `P`. Then `BAX = P_S X` and, as `S ⊆ V`, Pythagoras gives
   `‖X − P_S X‖² = ‖X − PX‖² + ‖(P − P_S)X‖²`, so `P_S X = PX`.

An alternative route for step 1 is Tau Ceti's singular-value Hoffman–Wielandt inequality
`LinearMap.sum_sq_singularValues_sub_le_sq_frobenius_apply_sub_min` applied to `X` and `BAX` (whose
singular values vanish beyond index `p`), the Frobenius form of the Eckart–Young bound.

**Checks.**

- `X = diag(3, 2, 1)`: the least values are `14, 5, 1, 0` for `p = 0, 1, 2, 3`, attained by the
  coordinate projections; sample pairs such as `A = (1, 2, 3)`, `B = (1, 0, 1)ᵀ` give larger
  values.
- Repeated eigenvalue: `X = diag(2, 2, 1)`, `Σ = diag(4, 4, 1)`, `p = 1`. The pairs `(e₁ᵀ, e₁)` and
  `(uᵀ, u)` with `u = (3/5, 4/5, 0)` both attain the least value `5` with different products
  `e₁e₁ᵀ ≠ uuᵀ`, so the minimizers are not one `GL_1`-orbit; no `c` has exactly one eigenvalue
  `≥ c` (the counts are `0, 2, 3`), so `isMinOn_loss_iff` does not apply.
- Singular `Σ`: `X = diag(1, 0, 0)`, `p = 2`: `BA = e₁e₁ᵀ` (rank `1`) and `BA = e₁e₁ᵀ + e₂e₂ᵀ`
  (rank `2`) both give loss `0`; minimizers need not have rank `p` (Zhou–Liang, Proposition 2,
  Case 2), and there is no gap at `p = 2` (eigenvalues `1, 0, 0`).
- The threshold: for `X = diag(3, 2, 1)` and `p = 1` every `c ∈ (4, 9]` works and gives
  `P = e₁e₁ᵀ`; `c = 4` counts two eigenvalues and gives `diag(1, 1, 0)`, the projection for `p = 2`.

*Needs:* 2.1 (the loss in matrix form); MathematicalStatisticsNonparametric 8.1
(`centeredCovariance`, `inner_centeredCovariance`), 8.2 (`IsEigenExpansion`), 8.3
(`fpca_optimal`); Mathlib `Matrix.IsHermitian.eigenvalues₀`, `eigenvalues₀_antitone`,
`eigenvalues`, `eigenvectorBasis`, `mulVec_eigenvectorBasis`,
`MeasureTheory.Measure.uniformOfFinset`, `uniformOfFinset_apply`, `Submodule.starProjection`; for
the alternative route, Tau Ceti
`LinearMap.sum_sq_singularValues_sub_le_sq_frobenius_apply_sub_min`.

### 2.3 No spurious local minima; saddles

Prove (`isMinOn_of_isLocalMin`) that every local minimum of the loss is a global minimum, and
(`not_isLocalMax_loss`) that for `p ≥ 1` and `X ≠ 0` the loss has no local maximum. Hence every
critical point that is not a global minimum is a saddle: neither a local minimum nor a local
maximum. (Zhou–Liang, Proposition 3 and Theorem 2, p. 5, proofs pp. 13–16; Baldi and Hornik's
earlier version under invertibility, as Zhou–Liang record on pp. 2–3. Zhou–Liang's Proposition 3,
item 3, gives an ascent direction only at pairs with `BAX ≠ 0`; the statement for every point is
proved here.)

Route for the local minima, proved here (Zhou–Liang's case analysis into critical points of
"non-optimal" and "optimal order", p. 4, omits some critical points that use an eigenvector of
eigenvalue `0` while missing a positive eigenvalue, such as the one in the Checks). A local minimum
`q = (A, B)` is critical, so by 2.1, with `S` the column space of `B`, `P` its projection,
`k = dim S ≤ p`: `S` and `S^⊥` are `Σ`-invariant, `BAX = PX` and `loss = tr((I − P)Σ)`. Write
`D = (I − P)X`. Along `q + t(A', B')` the loss is a polynomial in `t` whose linear term vanishes
and whose `t²` coefficient is `H = ‖B'AX + BA'X‖² − 2⟨D, B'A'X⟩`; at a local minimum `H ≥ 0`.

- (a) If `u ∈ S` and `w ∈ S^⊥` are unit eigenvectors with eigenvalues `α < β`: write `u = Bc`, let
  `g = Bᵀu`, `B' = wgᵀ`, `A' = cwᵀ`. Then `gᵀAX = uᵀBAX = uᵀX`, `BA'X = uwᵀX`, the two terms are
  orthogonal, and `H = α + β − 2β = α − β < 0`. So every eigenvalue of `Σ` on `S` is at least every
  eigenvalue on `S^⊥`.
- (b) If `k < p` and `w ∈ S^⊥` is a unit eigenvector with eigenvalue `β > 0`: choose `c ≠ 0` with
  `Bc = 0`, `B' = wcᵀ`, `A' = s·cwᵀ`; then `BA'X = 0` and `H = ‖(AX)ᵀc‖² − 2s‖c‖²β < 0` for large
  `s`. So if `k < p`, `Σ` vanishes on `S^⊥`.

By (a), `tr(PΣ)` is the sum of the `k` largest eigenvalues; by (b), if `k < p` the eigenvalues
`λ_{k+1}, …, λ_p` are `0`. Either way `loss = λ_{p+1} + ⋯ + λ_n`, the least value of 2.2.

Route for the local maxima. Let `D = X − BAX`. If `AX ≠ 0`, choose `B'` with `B'AX ≠ 0`; then
`t ↦ loss(A, B + tB') = ‖D − tB'AX‖²` is a quadratic with positive leading coefficient, which has
no local maximum. If `B ≠ 0`, choose `A' = hwᵀ` with `Bh ≠ 0` and `wᵀX ≠ 0` (possible as `X ≠ 0`)
and argue in `A` likewise. Otherwise `AX = 0` and `B = 0`: take a unit `u` with `uᵀΣu > 0` and
`B'A' = −uuᵀ` (a product through `Fin p`, as `p ≥ 1`); then
`loss(A + tA', tB') = ‖X − t²B'A'X‖² = tr Σ + 2t²uᵀΣu + t⁴‖uuᵀX‖² > tr Σ` for `t ≠ 0`.

**Checks.**

- `X = diag(3, 2, 1)`, `p = 1`, at the critical point `(e₂ᵀ, e₂)` of value `10`: along
  `A = (e₂ + te₁)ᵀ`, `B = e₂ + te₁` the loss is `10 − 5t² + O(t³)` (`α − β = 4 − 9`), and along
  `B = (1 + t)e₂` it is `10 + 4t²`: a saddle.
- `p = 2`, the critical point `A = [e₁ᵀ; 0]`, `B = [e₁ 0]` of value `5` (rank `1 < p`): with
  `c = e₂ ∈ ker B`, `w = e₂`, `s = 1`, the loss is `5 − 8t² + 4t⁴`, as in (b).
- `(0, 0)`, value `14`: at `t = 1/10`, `(te₁ᵀ, te₁)` gives `138209/10000 < 14` and `(te₁ᵀ, −te₁)`
  gives `141809/10000 > 14`.
- The case Zhou–Liang omit: `X = e₁ ∈ ℝ^(2×1)` (`Σ = diag(1, 0)`), `p = 1`, `A = (0, 1)`,
  `B = e₂`: both gradients vanish, the loss is `1` while the least value is `0`; along
  `A = (t, 1)`, `B = e₂ + te₁` the loss is `1 − t² + t⁴`, as in (a) with `α = 0`, `β = 1`.
- The hypotheses of `not_isLocalMax_loss`: for `p = 0` the loss is the constant `tr Σ`, and for
  `X = 0` it is the constant `0`; every point is then a local maximum.

*Needs:* 2.1, 2.2 (the least value); Mathlib `IsLocalMin.hasDerivAt_eq_zero`, `IsLocalMin`,
`IsLocalMax`, `IsMinOn`.

### Examples

For `X = diag(3, 2, 1)` and `p = 1` the critical points are `(0, 0)`, with value `14`, and the
pairs `(c e_iᵀ, c⁻¹e_i)`, `c ≠ 0`, with `BA = e_ie_iᵀ` and values `5, 10, 13` for `i = 1, 2, 3`.
Other pairs with `BA = 0` are not critical: at `(A, 0)` with `A ≠ 0` the gradient in `B` is
`−2ΣAᵀ ≠ 0`, and at `(0, B)` with `B ≠ 0` the gradient in `A` is `−2BᵀΣ ≠ 0`. Only `i = 1` gives
minima, and the other critical points are saddles. The minimizers are `(c e₁ᵀ, c⁻¹e₁)`, `c ≠ 0`,
one `GL_1`-orbit.

### Dependencies

Layer 1 (the network `linearAutoencoder`, and 1.3 for the remark on orbits of minimizers);
MathematicalStatisticsNonparametric 8.1–8.3; Mathlib eigenvalues of Hermitian matrices, calculus in
one variable, orthogonal projections. Within the layer, 2.2 uses 2.1 and 2.3 uses 2.1–2.2.

## Layer 3: stability of the one-dimensional optimum

### 3.1 Perturbation of the minimizers for one hidden unit

Let `p = 1`, `θ` a unit vector of `EuclideanSpace ℝ (Fin n)` with `Σθ = γθ`, `ν > 0` with
`⟪u, Σu⟫ ≤ (γ − ν)‖u‖²` for every `u ⟂ θ` (so `γ` is the largest eigenvalue, simple, with gap at
least `ν`), and `X'` new data with `Σ' = X'X'ᵀ` and `P = Σ' − Σ` (read as continuous linear maps by
`Matrix.toEuclideanCLM`) satisfying `‖P‖ < ν/2`. Prove (`rankOne_minimizers_perturbation`) that the
global minimizers for `X` are the pairs with `BAX = θθᵀX`, and that there is a unit vector `θ̂`
with `⟪θ̂, θ⟫ ≥ 0` and `‖θ̂ − θ‖ ≤ √2 ‖Pθ − ⟪θ, Pθ⟫θ‖ / (ν − 2‖P‖)` such that the global minimizers
for `X'` are the pairs with `BAX' = θ̂θ̂ᵀX'`. This is stated here, as the combination of 2.2 with
the Davis–Kahan theorem for the leading eigenvector.

Route. MathematicalStatisticsHighDimensional 8.1 (`leading_eigenvector_perturbation`), with
`Sig = toEuclideanCLM Σ` and `P = toEuclideanCLM (Σ' − Σ)`, both self-adjoint because `Σ` and `Σ'`
are symmetric, gives a leading unit eigenvector `θ̂` of `Σ'`, unique up to sign, with
`⟪θ̂, θ⟫ ≥ 0` and the displayed bound. Uniqueness up to sign forces the top eigenvalue `γ'` of `Σ'`
to be simple (an eigenspace of dimension at least two contains unit vectors other than `±θ̂`).
Apply `isMinOn_loss_iff` with `p = 1`: for `X`, `c = γ` counts exactly one eigenvalue (the others
are at most `γ − ν`) and `principalProjection X γ = θθᵀ`; for `X'`, `c = γ'` and
`principalProjection X' γ' = θ̂θ̂ᵀ`.

**Checks.**

- `X = diag(2, 1)`, `Σ = diag(4, 1)`, `θ = e₁`, `γ = 4`, `ν = 3`. Rotate by `R` with cosine
  `99/101` and sine `20/101` (`99² + 20² = 101²`): `X' = RX`, `Σ' = RΣRᵀ`, whose top eigenvector is
  `θ̂ = (99/101, 20/101)`. Then `P = 3(θ̂θ̂ᵀ − θθᵀ)` has eigenvalues `±60/101`, so
  `‖P‖ = 60/101 < 3/2`; the residual `Pθ − ⟪θ, Pθ⟫θ` is `(0, 5940/10201)`; and
  `‖θ̂ − θ‖² = 4/101`, below the square `7840800/37957921` of the bound. The pair
  `(θ̂ᵀ, θ̂)` has loss `1` on `X'`, its least value.
- The bound `‖P‖ < ν/2` cannot be relaxed to `≤`: `X = diag(1, 0)` (`Σ = diag(1, 0)`, `ν = 1`)
  and `P = diag(−1/2, 1/2)` have `‖P‖ = ν/2`, and `Σ' = diag(1/2, 1/2)` (the second-moment matrix
  of `X' = I/√2`) has a repeated top eigenvalue: the minimizers for `X'` realize both `e₁e₁ᵀ` and
  `e₂e₂ᵀ`, so no single `θ̂` exists.

*Needs:* 2.2 (`isMinOn_loss_iff`); MathematicalStatisticsHighDimensional 8.1
(`leading_eigenvector_perturbation`); Mathlib `Matrix.toEuclideanCLM`, `Matrix.vecMulVec`.

### Examples

In the first Check the minimizers for `X` are `(c e₁ᵀ, c⁻¹e₁)` and those for `X'` are
`(c θ̂ᵀ, c⁻¹θ̂)`, `c ≠ 0`; their realized maps `e₁e₁ᵀ` and `θ̂θ̂ᵀ` differ by
`sin ∠(θ, θ̂) = 20/101` in operator norm.

### Dependencies

Layer 2 (2.2); MathematicalStatisticsHighDimensional 8.1.

## Scope and ownership

This roadmap owns the linear autoencoder as a model: the identification of its coefficient image
as the determinantal variety (1.2), with the realized maps (1.1) taken from the library, the
exact criterion for its fibres to be `GL_p`-orbits and the insufficiency of hidden-neuron
symmetries (1.3–1.4), the critical points, global minimum, minimizers and absence of spurious local
minima of its square loss (2.1–2.3), and the stability of the minimizers for one hidden unit (3.1).

Stated by other roadmaps or in the libraries, and used here:

- Neuromanifolds (on main), as realized in Tau Ceti's `TauCeti/Geometry/Neuromanifold/`, owns
  realization maps and their fibres (its §1), multilayer perceptron specifications, the composite
  of layers, dense layers and the fact that two bias-free linear layers realize the products `BA`
  (§2), the hidden-neuron symmetries of monomial perceptrons and identifiability modulo them (§3),
  and neurovarieties and algebraic images (§4). Its README places dimension, singularities and
  optimisation outside its scope. The layers above use the library declarations and restate none
  of them. A revision of the Neuromanifolds text that is not on main records the width-one network
  from `K²` to `K²` (rank at most one, and the fibre over zero) as an example without a
  declaration; that is the case `n = 2`, `p = 1` of 1.1 and 1.3, and nothing here rests on it.
- MathematicalStatisticsNonparametric 8.3 owns the optimality of principal subspaces for a random
  element of a Hilbert space (`fpca_optimal`, `fpca_degenerate`), including uniqueness under a
  gap. 2.2 applies it to the data and adds what is particular to the network: that the
  parametrization attains the optimum, and which parameters do.
- MathematicalStatisticsHighDimensional 8.1 owns the perturbation of the leading eigenvector
  (Davis–Kahan); 3.1 combines it with 2.2. Statistical principal components (sample eigenvectors,
  spiked models, high-dimensional limits) are that roadmap's Layer 8 and are not treated here.
- Tau Ceti owns the matrix rank theory used in 1.1–1.3 (rank factorizations, minors, uniqueness of
  exact-rank factorizations), the Eckart–Young theorem in operator norm
  (`ContinuousLinearMap.singularValue_eq_linearMap_singularValues`) and its Frobenius form through
  the singular-value Hoffman–Wielandt inequality, and Ky Fan's maximum principle
  (`LinearMap.IsSymmetric.sum_re_inner_apply_self_le_sum_eigenvalues`). None of these is a target:
  the value of the minimum in 2.2 is the Eckart–Young value, and the content of 2.2 is its
  attainment by the network and the description of the minimizers. Mathlib owns determinantal
  ideals, the spectral theorem for Hermitian matrices and the calculus used.

Outside the scope: the dimension and degree of the determinantal variety and its singular locus;
deep linear networks and their landscapes; autoencoders with biases, nonlinear activations or
regularization; probabilistic principal component analysis; gradient flows and convergence of
training; the approximation of a symmetric matrix by positive semidefinite matrices of low rank;
and every algorithm.

## Exact supplier contracts

### From Mathlib

- `Mathlib/LinearAlgebra/Matrix/Rank.lean`: `Matrix.rank` (finrank of the range of `mulVecLin`),
  `Matrix.rank_mul_le_left`. Used in 1.1–1.4.
- `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean`: `Matrix.GeneralLinearGroup`
  (`GL (Fin p) K`). Used in 1.3.
- `Mathlib/RingTheory/MvPolynomial/DeterminantalIdeal.lean`: `MvPolynomial.determinantalIdeal`
  (the ideal of all minors indexed by `t` of the generic matrix),
  `Matrix.aeval_mvPolynomialMinor` (evaluating a generic minor at a matrix gives its minor).
  `Mathlib/RingTheory/Nullstellensatz.lean`: `MvPolynomial.zeroLocus`.
  `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean`: `Matrix.det_zero_of_row_eq`. Used in 1.2.
- `Mathlib/Logic/Relation.lean`: `Relation.EqvGen.setoid`. Used in 1.3.
- `Mathlib/LinearAlgebra/Matrix/Hermitian.lean`: `Matrix.isHermitian_mul_conjTranspose_self`
  (`X * Xᴴ` is Hermitian). `Mathlib/Analysis/Matrix/Spectrum.lean`:
  `Matrix.IsHermitian.eigenvalues₀`
  (eigenvalues indexed by `Fin (Fintype.card n)`), `eigenvalues₀_antitone` (decreasing order),
  `eigenvalues`, `eigenvectorBasis` (an orthonormal eigenbasis indexed by `n`),
  `mulVec_eigenvectorBasis`. `Mathlib/LinearAlgebra/Matrix/ConjTranspose.lean`:
  `Matrix.conjTranspose_eq_transpose_of_trivial`. Used in 2.1–3.1.
- `Mathlib/Analysis/CStarAlgebra/Matrix.lean`: `Matrix.toEuclideanCLM` (a square matrix as a
  continuous linear map of `EuclideanSpace`). Used in 3.1.
- `Mathlib/Analysis/InnerProductSpace/Projection/Basic.lean`: `Submodule.starProjection`. Used in
  2.1, 2.2.
- `Mathlib/Analysis/Calculus/LocalExtr/Basic.lean`: `IsLocalMin.hasDerivAt_eq_zero`;
  `Mathlib/Topology/Order/LocalExtr.lean`: `IsLocalMin`, `IsLocalMax`;
  `Mathlib/Order/Filter/Extr.lean`: `IsMinOn`; `HasDerivAt`. Used in 2.1–2.3.
- `Mathlib/Probability/Distributions/Uniform.lean`: `MeasureTheory.Measure.uniformOfFinset` (the
  uniform measure on a finite set, `uniformOfFinset_apply`; a probability measure when the set is
  nonempty, which is proved from that formula, as there is no instance). Used in 2.2.

### From Tau Ceti

- `TauCeti/Geometry/Neuromanifold/Basic.lean`: `TauCeti.Neuromanifold.realizedFunctions`,
  `fiber`, `parameterSetoid`, `IdentifiableAt` (`fiber f (f w) = {v | s v w}`),
  `identifiableAt_iff_fiber_subset` (when `s ≤ parameterSetoid f`, the fibre need only lie in the
  class). Used in 1.1, 1.3, 1.4.
- `TauCeti/Geometry/Neuromanifold/Composition.lean`: `compose` (`(w, v) ↦ g v ∘ f w`). Used
  throughout.
- `TauCeti/Geometry/Neuromanifold/Dense.lean`: `compose_mulVec_mulVec`
  (`compose mulVec mulVec (A, B) = (B * A).mulVec`), `realizedFunctions_compose_mulVec_mulVec`
  (the realized maps are the evaluations of the products `p.2 * p.1`). Used in 1.1, 1.3, 2.1.
- `TauCeti/Geometry/Neuromanifold/Neurovariety.lean`: `neurovariety` (Zariski closure of the
  coefficient image), `IsAlgebraicImage` (`neurovariety c = range c`),
  `isAlgebraicImage_iff_exists_zeroLocus`, `isAlgebraicImage_of_surjective`. Used in 1.2.
- `TauCeti/Geometry/Neuromanifold/Scalar.lean`: `not_isAlgebraicImage_const_sq` (the image of
  `w ↦ w²` is not algebraic over `ℝ`). Cited for contrast in 1.2.
- `TauCeti/Geometry/Neuromanifold/MLP/Basic.lean`: `MLPSpec`, `MLPSpec.Weights`,
  `MLPSpec.linear` (identity hidden activations), `MLPSpec.realizeWeights` (the realization at
  zero biases), `MLPSpec.realizeWeights_succ`, `MLPSpec.layerActivation_linear`,
  `MLPSpec.monomial_one` (exponent-one monomial activations are `MLPSpec.linear`). Used in 1.4.
- `TauCeti/Geometry/Neuromanifold/MLP/Symmetry.lean`: `MLPSpec.permuteHidden`,
  `MLPSpec.scaleHidden` and their application lemmas `permuteHidden_apply_castSucc`,
  `permuteHidden_apply_succ`, `scaleHidden_apply_castSucc`, `scaleHidden_apply_succ`;
  `MLPSpec.hiddenSymmetrySetoid A e` (generated by permutations and by rescalings with the
  compensating power `e i`), `MLPSpec.hiddenSymmetrySetoid_le_iff`,
  `MLPSpec.hiddenSymmetrySetoid_le_parameterSetoid` (needs `∀ i t, A.activation i t = t ^ e i`).
  Used in 1.4.
- `TauCeti/LinearAlgebra/Matrix/Rank.lean`: `Matrix.rank_le_iff_exists_eq_mul` (over a field,
  rank at most `r` iff a product through `Fin r`), `Matrix.rank_le_iff_forall_det_submatrix_eq_zero`
  (rank at most `p` iff all minors indexed by `Fin (p + 1) ↪ m`, `Fin (p + 1) ↪ n` vanish). Used in
  1.1–1.3.
- `TauCeti/LinearAlgebra/Matrix/Rank/Closed.lean`: `Matrix.rank_le_of_mem_zeroLocus_vanishingIdeal`
  (a bound `rank Z ≤ r` holding on a set of matrices holds on its Zariski closure). Used in 1.2.
- `TauCeti/LinearAlgebra/Matrix/Rank/Factorization.lean`:
  `Matrix.exists_unit_eq_mul_of_rank_factorization` (two factorizations `M = LR = L'R'` through
  `ι` with `rank M = card ι` satisfy `L' = Lg`, `R' = g⁻¹R` for a unit `g`). Used in 1.3.
- `TauCeti/Analysis/InnerProductSpace/HoffmanWielandt/Singular.lean`:
  `LinearMap.sum_sq_singularValues_sub_le_sq_frobenius_apply_sub_min`. The alternative route of
  2.2, step 1.
- `TauCeti/Analysis/OperatorIdeal/ApproximationNumber/EckartYoung.lean`:
  `ContinuousLinearMap.singularValue_eq_linearMap_singularValues`;
  `TauCeti/Analysis/InnerProductSpace/KyFan.lean`:
  `LinearMap.IsSymmetric.sum_re_inner_apply_self_le_sum_eigenvalues`. Named in the scope section
  only.

### From TauCetiRoadmap.MathematicalStatisticsNonparametric

- 8.1: `centeredCovariance μ X` (the covariance operator of `X − E X` for a probability measure
  `μ`), `inner_centeredCovariance` (for `MemLp X 2 μ`,
  `⟪C x, y⟫ = E ⟪X − m, x⟫⟪X − m, y⟫`). 8.2: `IsEigenExpansion T lam φ` (antitone, nonnegative
  `lam` tending to `0`, `φ` orthonormal on the indices with `lam j > 0`, and
  `T x = Σ lam j ⟪x, φ j⟫ φ j`). 8.3: `fpca_optimal` (for a separable Hilbert space with its Borel
  structure, `MemLp X 2 μ` and an eigen-expansion of the centred covariance: every `k`-dimensional
  subspace leaves residual at least `Σ_{j ≥ k} lam j`; the first `k` eigenvectors attain it when
  `lam (k − 1) > 0`; and if `0 < k` and `lam k < lam (k − 1)`, a `k`-dimensional subspace
  attaining it is their span). Used in 2.2.

### From TauCetiRoadmap.MathematicalStatisticsHighDimensional

- 8.1: `leading_eigenvector_perturbation` (on a finite-dimensional real inner product space, for
  self-adjoint `Sig`, `P`, a unit `θ` with `Sig θ = γθ`, `0 < ν`, the gap
  `⟪u, Sig u⟫ ≤ (γ − ν)‖u‖²` for `u ⟂ θ`, and `‖P‖ < ν/2`: `Sig + P` has a leading unit eigenvector
  `θ̂`, unique up to sign, with `⟪θ̂, θ⟫ ≥ 0` and
  `‖θ̂ − θ‖ ≤ √2 ‖Pθ − ⟪θ, Pθ⟫θ‖/(ν − 2‖P‖)`). Used in 3.1.

## References

- Yi Zhou and Yingbin Liang, *Critical points of neural networks: analytical forms and landscape
  properties*, arXiv:1710.11205v1 (2017). Page numbers are PDF pages of v1: the account of Baldi
  and Hornik, pp. 2–3; Theorem 1, Propositions 1 and 2, p. 4; Proposition 3 and Theorem 2, p. 5;
  supplement: Lemma 1 with eqs. (25)–(27), p. 11; proof of Proposition 1, eq. (28), pp. 12–13;
  proof of Proposition 2, p. 13; proof of Proposition 3, pp. 13–16.
- Giovanni Luca Marchetti, Vahid Shahverdi, Stefano Mereta, Matthew Trager and Kathlén Kohn,
  *Algebra unveils deep learning — an invitation to neuroalgebraic geometry*, arXiv:2501.18915v2
  (2025): §4.3, pp. 6–7; Appendix A, p. 13.
- Pierre Baldi and Kurt Hornik, *Neural networks and principal component analysis: learning from
  examples without local minima*, Neural Networks 2(1) (1989), 53–58,
  doi:10.1016/0893-6080(89)90014-2. Not consulted; cited only for the attribution that Zhou–Liang
  give on pp. 2–3.

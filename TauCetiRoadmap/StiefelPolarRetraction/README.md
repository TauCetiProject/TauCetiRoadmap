# Roadmap: the polar retraction on the Stiefel manifold, with explicit constants

**Summary.** A real `n × p` matrix `X` with orthonormal columns (`Xᵀ X = 1`) is a point of the
Stiefel manifold, and a matrix `Z` with `Xᵀ Z + Zᵀ X = 0` is a tangent vector there. The polar
retraction sends `X + Z` to its polar factor, the nearest matrix with orthonormal columns. This
roadmap computes exactly how far the polar factor lies from `X` and from the straight step `X + Z`,
and turns both numbers into explicit constants for gradient descent. Throughout, the cost `f` is
defined on all real `n × p` matrices; on the matrices of operator norm at most one it is
differentiable, its Frobenius gradient is `L`-Lipschitz and bounded by `G`, and `f` is bounded
below by `f_low`.

There are three headline theorems.

- *The pullback constant.* For every point `X` and tangent `Z`, with `R` the polar factor of
  `X + Z`, `f(R) ≤ f(X) + ⟪∇f(X), Z⟫ + ((L + G)/2) ‖Z‖_F²`. The existence of some such constant
  on a compact manifold is classical; here it is `L + G`.
- *The rate of polar gradient descent.* With a step size `η > 0` with `η (L + G) ≤ 1`, starting on
  the manifold, the sum over the first `K` iterates of the squared Frobenius norms of the
  Riemannian gradients is at most `2 (f(X₀) − f_low)/η`. So with `η = 1/(L + G)` one of them is at
  most `√(2 (L + G)(f(X₀) − f_low)/K)`.
- *One Newton–Schulz step in place of the polar factor.* Replace the polar factor by one cubic
  Newton–Schulz step `A ↦ ½ A (3 − Aᵀ A)`, which uses only matrix products, and move along the
  skew-symmetric matrix `S = skew(∇f(Y) Yᵀ)`. The iterates then leave the manifold. With a step
  size `η > 0` with `3 η (L + G) ≤ 1`, starting on the manifold, every iterate has operator norm at
  most one and satisfies `‖1 − Yᵀ Y‖_F ≤ 4 (η G)⁴`, and the sum of the first `K` values of
  `‖S‖_F²` is at most `2 (f(Y₀) − f_low)/η`.

The roadmap builds on SpectralSteepestDescent, which supplies the polar factor, the descent
lemma and the spectral theory of Newton–Schulz iterations, and on the Sylvester bounds of
SpectralSubspacePerturbation, which drive R.-C. Li's perturbation theorems for the polar factor.
ManifoldOptimization defines the Stiefel manifold, the polar retraction and the rate of gradient
descent given some pullback constant; this roadmap makes that constant explicit.

Layer 1 computes the polar retraction at matrix level and its two constants. Layer 2 states Li's
bounds on how much the polar factor moves when its argument moves. Layer 3 proves the pullback
constant and the rate. Layer 4 replaces the polar factor by Newton–Schulz steps taken from a point
of the manifold; Layer 5 iterates one such step without returning to the manifold.

## Conventions

- **Matrices.** `X : Matrix (Fin n) (Fin p) ℝ`. `‖·‖` on matrices is Mathlib's Frobenius norm
  (`open scoped Matrix.Norms.Frobenius`), written `‖·‖_F`. The operator norm `‖A‖_op` is
  `‖LinearMap.toContinuousLinearMap (Matrix.toEuclideanLin A)‖`, the right side of Mathlib's
  `Matrix.l2_opNorm_def`; no second matrix norm instance is opened. The pairing is
  `⟪A, B⟫ = tr(Aᵀ B)`, written `Matrix.trace (Aᵀ * B)`. They agree with the matrix conventions of
  SpectralSteepestDescent 6.1, whose scoped `Matrix.Norms.L2Operator` norm has the same value by
  `Matrix.l2_opNorm_def` and whose pairing `re tr(Aᴴ B)` is `tr(Aᵀ B)` over `ℝ`.
- `sym M = (M + Mᵀ)/2` and `skew M = (M − Mᵀ)/2`, written out in `Suggested.lean` as
  `(1 / 2 : ℝ) • (M + Mᵀ)` and `(1 / 2 : ℝ) • (M − Mᵀ)`. The singular values of `A` are
  `(Matrix.toEuclideanLin A).singularValues`, zero-indexed and nonincreasing.
- **Points and tangent vectors.** "`X` is a point" means `Xᵀ X = 1`, which forces `p ≤ n`.
  "`Z` is tangent at `X`" means `Xᵀ Z + Zᵀ X = 0`. The Riemannian gradient at a point `X` is the
  expression `∇f(X) − X sym(Xᵀ ∇f(X))` (Boumal, (7.28), §7.3). The Stiefel manifold as a
  manifold, its tangent spaces, this projection and the polar retraction as a retraction are
  ManifoldOptimization's objects (O0.3, O2.2); this roadmap defines none of them and states
  matrix identities and inequalities under the hypotheses above.
- **The polar factor** `U_A` of a matrix is Tau Ceti's canonical polar factor
  `LinearMap.polarFactor` of `Matrix.toEuclideanLin A`, transported back. This is
  `matrixPolarFactor` of SpectralSteepestDescent 6.1; its definition is copied verbatim here
  because Layers 1 and 3 state theorems about it. For square invertible matrices it is the
  unitary factor `Units.polarUnitary` of Tau Ceti (SpectralSteepestDescent 1.3).
  For `X` a point and `Z` tangent, `R = U_(X+Z)`.
- **The cost.** `B = {A : ‖A‖_op ≤ 1}` (`opUnitBall`). `SmoothOnOpBall f gradf L G` says that `f`
  is differentiable at every point of `B` with `fderiv ℝ f A Z = ⟪gradf A, Z⟫`, that
  `‖gradf A − gradf A'‖_F ≤ L ‖A − A'‖_F` for `A, A' ∈ B`, and that `‖gradf A‖_F ≤ G` on `B`. A
  lower bound is `f_low ≤ f A` for `A ∈ B`. When `n, p ≥ 1` these force `L ≥ 0` and `G ≥ 0`.
- **Newton–Schulz.** `Ψ A = ½ A (3 − Aᵀ A)` (`nsStep`), the matrix form of SpectralSteepestDescent's
  odd step with the cubic coefficients `(3/2, −1/2)`; `g(t) = (3t − t³)/2` is its scalar map.
- **Iterations** are defined by `Nat.rec` from the starting point; `X_k`, `Y_k` are the `k`-th
  iterates. Step-size conditions are written as products (`η * (L + G) ≤ 1`), so that no division
  by `L + G` occurs.

## Layer 1: the polar retraction at matrix level

### 1.1 The polar factor of `X + Z`

Define `matrixPolarFactor A` as in the conventions. Let `X` be a point and `Z` tangent at `X`, and
let `s₀ ≥ s₁ ≥ …` be the singular values of `Z`.

- `(X + Z)ᵀ (X + Z) = 1 + Zᵀ Z`, so the singular values of `X + Z` are `√(1 + sᵢ²) ≥ 1` for
  `i < p`, and `X + Z` is injective (Boumal, (7.23), §7.3).
- `R = U_(X+Z)` has orthonormal columns, `R = (X + Z)(1 + Zᵀ Z)^(-1/2)` with the inverse square
  root taken in Mathlib's functional calculus of symmetric matrices, and `R (1 + Zᵀ Z)^(1/2) =
  X + Z` (Boumal, (7.24), §7.3; SpectralSteepestDescent 1.3, where the polar factor of an
  injective map is `LinearMap.polarIsometry`).
- `R` is the unique nearest matrix with orthonormal columns to `X + Z` in the Frobenius norm
  (SpectralSteepestDescent 2.3; ManifoldOptimization O2.2 states it on `St(n, p)`).

(Proved here from the cited statements.)

**Checks.**

- `matrixPolarFactor` of `diag(3, 4)` is `1`, and of `[[0, 2], [0, 0]]` it is `[[0, 1], [0, 0]]`:
  the canonical factor vanishes on the kernel, where the formula `A (Aᵀ A)^(-1/2)` is undefined.
- `n = p = 1`: the points are `±1` and the only tangent vector is `0`.
- `p = 1`, `X = e₁`, `Z = s e₂`: `R = (e₁ + s e₂)/√(1 + s²)`.
- A non-tangent `Z` breaks the identity: for `X = e₁ ∈ ℝ²` and `Z = −X`, `(X + Z)ᵀ (X + Z) = 0`
  while `1 + Zᵀ Z = 2`.

*Needs:* Tau Ceti `LinearMap.polarFactor`, `LinearMap.polarIsometry`; Mathlib
`Matrix.toEuclideanLin`, `Matrix.toEuclideanLin_conjTranspose_eq_adjoint`,
`Matrix.IsHermitian.instContinuousFunctionalCalculus`; SpectralSteepestDescent 1.3, 2.3;
PolarDecomposition PD-B11 to PD-B16.

### 1.2 The distance from `X`

`norm_polar_sub_le`: for `X` a point and `Z` tangent,
`‖R − X‖_F² = 2 Σ_{i<p} (1 − (1 + sᵢ²)^(-1/2))`, and hence `‖R − X‖_F ≤ ‖Z‖_F`.

Route: `‖R − X‖_F² = 2p − 2 tr(Xᵀ R)`. By 1.1, `Xᵀ R = (1 + Ω)(1 + Zᵀ Z)^(-1/2)` with `Ω = Xᵀ Z`
skew-symmetric; the trace of a skew-symmetric matrix times a symmetric one is `0`, so
`tr(Xᵀ R) = Σ (1 + sᵢ²)^(-1/2)`. Finally `2 (1 − (1 + s²)^(-1/2)) ≤ s²` for every real `s`.
(Proved here.)

**Checks.**

- `p = 1`, `X = e₁`, `Z = s e₂`: `‖R − X‖² = 2 − 2/√(1 + s²)`; at `s = 1` this is `0.5858 ≤ 1`.
- The constant `1` is sharp as `s → 0`: the ratio `‖R − X‖/‖Z‖` is `0.99627` at `s = 0.1` and
  `0.99996` at `s = 0.01`.

*Needs:* 1.1.

### 1.3 The distance from `X + Z`

`norm_polar_sub_sub_le`: for `X` a point and `Z` tangent,
`‖R − X − Z‖_F² = Σ_{i<p} (√(1 + sᵢ²) − 1)²`, `‖R − X − Z‖_F ≤ ½ ‖Z‖_F²` and
`‖R − X − Z‖_op ≤ ½ ‖Z‖_op²`.

Route: by 1.1, `R − X − Z = R (1 − (1 + Zᵀ Z)^(1/2))`, and `R` preserves both norms because its
columns are orthonormal. The eigenvalues of `(1 + Zᵀ Z)^(1/2) − 1` are `√(1 + sᵢ²) − 1 ≤ sᵢ²/2`,
and `(Σ sᵢ⁴)^(1/2) ≤ Σ sᵢ²`. (Proved here.)

**Checks.**

- `p = 1`, `X = e₁`, `Z = s e₂`: `‖R − X − Z‖ = √(1 + s²) − 1`; at `s = 1` this is `0.4142 ≤ 0.5`.
- The constant `½` is sharp as `s → 0`: the ratio `‖R − X − Z‖/(½ ‖Z‖²)` is `0.99751` at
  `s = 0.1` and `0.99998` at `s = 0.01`.

*Needs:* 1.1.

### Examples

`X = e₁`, `Z = s e₂` in `ℝ²` for `s = 1, 0.1, 0.01`; the degenerate case `n = p = 1`.

### Dependencies

1.1 uses Tau Ceti's polar factor, Mathlib's `Matrix.toEuclideanLin` and functional calculus, and
SpectralSteepestDescent 1.3 and 2.3; 1.2 and 1.3 use 1.1.

## Layer 2: perturbation of the polar factor

Here `𝕜` is `ℝ` or `ℂ`, `E` and `F` are finite-dimensional inner product spaces over `𝕜` with
`finrank E = n`, `A, Ã : E →ₗ[𝕜] F` are injective (full column rank), `U_A`, `U_Ã` are their
polar factors, and `σₙ`, `σ̃ₙ` are their smallest singular values,
`A.singularValues (n − 1)` and `Ã.singularValues (n − 1)`. `N` ranges over Tau Ceti's
`UnitarilyInvariantSeminorm 𝕜 E F`, a seminorm on `E →ₗ[𝕜] F` invariant under the linear
isometric equivalences of `E` and of `F`. Li states Theorems 1–3 for complex matrices and
unitarily invariant norms; 2.1–2.3 state them over `𝕜` for seminorms, and the generalization is
proved here by his route. Every theorem of this layer runs through the Sylvester bound: with thin
singular value decompositions `A = U₁ Σ₁ Vᴴ` and `Ã = Ũ₁ Σ̃₁ Ṽᴴ`, the `n × n` matrix
`Vᴴ Ṽ − U₁ᴴ Ũ₁` solves a Sylvester equation `Σ₁ X − X (−Σ̃₁) = C` with `N(C) ≤ 2 N(A − Ã)`, the
spectra of `Σ₁` and `−Σ̃₁` are separated by `σₙ + σ̃ₙ`, and `N(Vᴴ Ṽ − U₁ᴴ Ũ₁) = N(1 − U_Aᴴ U_Ã)`
(Li, Lemma 1 and (12)–(14), pp. 3–4). Li applies one norm to `n × n`, `(m − n) × n` and `m × n`
matrices; here an operator `T` on `E` is measured by `N(J ∘ T)` for an isometric embedding
`J : E → F`, which does not depend on `J` because two such embeddings differ by an isometric
equivalence of `F`, and which is a unitarily invariant seminorm on operators of `E`. The other
facts Li's proof uses hold for every unitarily invariant seminorm over `ℝ` or `ℂ`: `N(P T) ≤ N(T)`
for an orthogonal projection `P` (as `P = (1 + S)/2` with `S` a reflection), `N(T†) = N(T)` for
operators of one space (by a singular value decomposition of `T`), and
`N(T ∘ K) ≤ ‖K‖_op N(T)` (a contraction is an average of isometric equivalences); Lemma 1 is the
Sylvester bound of Tau Ceti, stated over `𝕜` for seminorms.

### 2.1 Square matrices

`map_polarFactor_sub_le_of_finrank_eq`: if `finrank E = finrank F`, then for every unitarily
invariant seminorm `N`, `N(U_A − U_Ã) ≤ 2/(σₙ + σ̃ₙ) · N(A − Ã)` (Li, Theorem 1, (15), p. 4). The
bound is attained: for two orthogonal matrices `σₙ = σ̃ₙ = 1` and both sides are `N(A − Ã)`
(Li, Remark 1, p. 6).

**Checks.**

- `A = 1` and `Ã` the rotation by `0.6` in `ℝ²`: both sides are `0.83586` in the Frobenius norm
  and `0.59104` in the operator norm.

*Needs:* Tau Ceti
`TauCeti.UnitarilyInvariantSeminorm.mul_map_le_map_sylvester_apply_of_pointIntervalExteriorGap`
(SpectralSubspacePerturbation Part B, the interval/exterior Sylvester bound SSP-B09);
Mathlib `LinearMap.singularValues`; Tau Ceti `LinearMap.polarFactor`.

### 2.2 Rectangular matrices

`map_polarFactor_sub_le_of_finrank_lt`: if `finrank E < finrank F`, then for every unitarily
invariant seminorm `N`,
`N(U_A − U_Ã) ≤ (2/(σₙ + σ̃ₙ) + 1/max(σₙ, σ̃ₙ)) · N(A − Ã)` (Li, Theorem 2, (18), p. 5). The
extra term bounds the component of `U_Ã` orthogonal to the range of `A`, or of `U_A` orthogonal
to the range of `Ã` (Li, (16)–(17)).

**Checks.**

- `A = (1, 0)ᵀ`, `Ã = (1, 1)ᵀ`: `σₙ = 1`, `σ̃ₙ = √2`, `‖U_A − U_Ã‖ = 0.7654`, `‖A − Ã‖ = 1`, and
  the constant is `0.8284 + 0.7071 = 1.5355`.

*Needs:* as 2.1.

### 2.3 The Frobenius form

`frobenius_polarFactor_sub_le`: under the hypotheses of 2.2,
`‖U_A − U_Ã‖_F ≤ √((2/(σₙ + σ̃ₙ))² + (1/max(σₙ, σ̃ₙ))²) · ‖A − Ã‖_F` (Li, Theorem 3, (19), p. 5),
since the two components of 2.2 are orthogonal in the Frobenius inner product.

**Checks.**

- The example of 2.2: the constant is `√(0.6863 + 0.5) = 1.0892`, and `0.7654 ≤ 1.0892`.

*Needs:* as 2.1, with Tau Ceti `UnitarilyInvariantSeminorm.frobenius`.

### 2.4 The one-sided form

If `finrank E = finrank F` and `‖A − Ã‖_op < 2 σₙ`, then
`N(U_A − U_Ã) ≤ 2/(2 σₙ − ‖A − Ã‖_op) · N(A − Ã)` (Li, Remark 2, (20), p. 6): by Weyl's bound
`σ̃ₙ ≥ σₙ − ‖A − Ã‖_op` in 2.1.

**Checks.**

- Without the hypothesis the constant is meaningless: for `A = 1` and `Ã = −1` on `ℝ`,
  `‖A − Ã‖ = 2 = 2 σₙ` and the denominator is `0`, while `|U_A − U_Ã| = 2`.

*Needs:* 2.1; Tau Ceti `LinearMap.abs_singularValues_sub_singularValues_le`.

### 2.5 The Stiefel instance

Let `X` be a point and `Z₁`, `Z₂` tangent at `X`, with `Rⱼ = U_(X+Zⱼ)`. By 1.1 the smallest
singular values of `X + Z₁` and `X + Z₂` are at least `1`, so:

- if `n = p`, `N(R₁ − R₂) ≤ N(Z₁ − Z₂)` for every unitarily invariant seminorm, by 2.1;
- if `p < n`, `N(R₁ − R₂) ≤ 2 N(Z₁ − Z₂)` for every unitarily invariant seminorm, by 2.2, and
  `‖R₁ − R₂‖_F ≤ √2 ‖Z₁ − Z₂‖_F`, by 2.3.

These are the constants Li's theorems give with `σₙ, σ̃ₙ ≥ 1` substituted; no sharpness is
claimed. (Proved here.)

**Checks.**

- `n = p = 2`, `X = 1`, `Z₁ = 0`, `Z₂ = t Ω` with `Ω = [[0, −1], [1, 0]]`: `R₂` is the rotation by
  `arctan t`, and `‖R₂ − 1‖_F = 0.6498, 1.0824, 1.6538` against `‖Z₂‖_F = 0.7071, 1.4142, 4.2426`
  for `t = 0.5, 1, 3`.
- `n = 2`, `p = 1`, `X = e₁`, `Z₁ = 0`, `Z₂ = e₂`: `‖R₁ − R₂‖ = 0.7654 ≤ √2`.

*Needs:* 1.1, 2.1, 2.2, 2.3.

### Examples

The orthogonal pair of 2.1 and the column vectors of 2.2.

### Dependencies

2.1–2.3 use the Tau Ceti Sylvester bound, Mathlib's singular values and Tau Ceti's polar factor;
2.4 uses 2.1 and Tau Ceti's Weyl bound for singular values; 2.5 uses 1.1 and 2.1–2.3.

## Layer 3: the pullback constant and the rate

### 3.1 The pullback constant

Define `opUnitBall n p` and `SmoothOnOpBall f gradf L G` as in the conventions.

`polar_pullback_le`: if `SmoothOnOpBall f gradf L G`, `X` is a point and `Z` is tangent, then

    f(R) ≤ f(X) + ⟪∇f(X), Z⟫ + ((L + G)/2) ‖Z‖_F².

Route: `X` and `R` have orthonormal columns, so they lie in `B`, which is convex. The descent
lemma on the segment `[X, R]` gives `f(R) ≤ f(X) + ⟪∇f(X), R − X⟫ + (L/2) ‖R − X‖_F²`; the
derivative of `f` at `A` has operator norm `‖∇f(A)‖_F`, so its Lipschitz constant on `B` is `L`.
Write `R − X = Z + (R − X − Z)`, bound `⟪∇f(X), R − X − Z⟫ ≤ G · ½ ‖Z‖_F²` by 1.3 and
`(L/2) ‖R − X‖_F² ≤ (L/2) ‖Z‖_F²` by 1.2. For tangent `Z`,
`⟪∇f(X), Z⟫ = ⟪∇f(X) − X sym(Xᵀ ∇f(X)), Z⟫`, the pairing with the Riemannian gradient.

The existential form, for some constant on a compact submanifold and a globally defined
retraction, is Boumal–Absil–Cartis, Lemma 4 (arXiv v2, §2, p. 7), whose proof (Appendix B,
(29)–(32)) gives the constant `L α²/2 + G β` from constants `α`, `β` with
`‖R − X‖ ≤ α ‖Z‖` and `‖R − X − Z‖ ≤ β ‖Z‖²`. With `α = 1` and `β = ½` from 1.2 and 1.3 that
constant is `(L + G)/2`. No source states it. (Proved here.)

**Checks.**

- `B` is the operator-norm ball, not the Frobenius ball: the identity of `ℝ²` has
  `‖1‖_op = 1` and `‖1‖_F = √2`, and it is a point of the manifold.
- `f = ⟪C, ·⟫` satisfies `SmoothOnOpBall` with `L = 0` and `G = ‖C‖_F`; `f = ½ ‖·‖_F²` on
  `2 × 1` matrices satisfies it with `gradf A = A`, `L = 1` and `G = 1`.
- The coefficient `G/2` is sharp as `Z → 0`: for `f = −⟪e₁, ·⟫` (`L = 0`, `G = 1`), `X = e₁` and
  `Z = s e₂`, the excess `f(R) − f(X) − ⟪∇f(X), Z⟫` is `1 − 1/√(1 + s²)`, which is `0.004963`
  against `0.005` at `s = 0.1`.

*Needs:* 1.2, 1.3; SpectralSteepestDescent 5.1; Mathlib `fderiv`, `Matrix.trace`.

### 3.2 The rate

Define `polarStepSeq gradf η X₀` by `X_{k+1} = U(X_k − η grad_k)` with
`grad_k = ∇f(X_k) − X_k sym(X_kᵀ ∇f(X_k))`.

`sum_sq_norm_rgrad_le`: if `SmoothOnOpBall f gradf L G`, `f_low ≤ f` on `B`, `0 < η`,
`η (L + G) ≤ 1` and `X₀` is a point, then every `X_k` is a point,
`f(X_{k+1}) ≤ f(X_k) − (η/2) ‖grad_k‖_F²`, and for every `K`

    Σ_{k<K} ‖grad_k‖_F² ≤ 2 (f(X₀) − f_low)/η.

So for `L + G > 0`, `η = 1/(L + G)` and `K ≥ 1`, some `k < K` has
`‖grad_k‖_F ≤ √(2 (L + G)(f(X₀) − f_low)/K)`.

Route: `grad_k` is tangent at `X_k`, and `⟪∇f(X_k), grad_k⟫ = ‖grad_k‖_F²` because
`X_kᵀ grad_k` is skew-symmetric and `sym(X_kᵀ ∇f(X_k))` symmetric. Apply 3.1 with
`Z = −η grad_k` and use `η (L + G) ≤ 1`; telescope, and use `X_K ∈ B`. This is
ManifoldOptimization O4.1 for the polar retraction with the constant of 3.1 (Boumal–Absil–Cartis,
Theorem 5 and Corollary 6, §2.1, p. 8; Boumal, Proposition 4.8 and Corollary 4.9, §4.4).
(Proved here.)

**Checks.**

- `n = 2`, `p = 1`, `f = −⟪e₁, ·⟫` (`L = 0`, `G = 1`, `f_low = −1`), `η = 1`, `X₀ = e₂`:
  `grad₀ = −e₁`, `X₁ = (e₁ + e₂)/√2`, `f(X₁) = −0.7071 ≤ −0.5`; `‖grad₁‖² = 0.5`, and
  `f(X₂) = −0.9856 ≤ −0.7071 − 0.25`. The partial sum `1.5` is at most `2 (0 + 1)/1 = 2`.
- `G = 0` forces `∇f = 0` on `B`; then every `grad_k = 0`, `X_k = X₀`, and the left side of the
  sum bound is `0`.

*Needs:* 3.1; Mathlib `Finset.sum_range_succ`.

### Examples

The linear cost `−⟪e₁, ·⟫` on `2 × 1` matrices, for 3.1 and 3.2.

### Dependencies

3.1 uses 1.2, 1.3 and SpectralSteepestDescent 5.1; 3.2 uses 3.1.

## Layer 4: Newton–Schulz from a point of the manifold

### 4.1 The Newton–Schulz step and its iterates at `X + Z`

Copy `oddStep` (SpectralSteepestDescent 3.1) and `cubicCoeffs` (SpectralSteepestDescent 4.1)
verbatim, and define `nsStep A` as `oddStep cubicCoeffs` transported along
`Matrix.toEuclideanLin`, so that `nsStep A = ½ A (3 − Aᵀ A)`.

Let `X` be a point, `Z` tangent with `‖Z‖_op < √2`, and `tᵢ = √(1 + sᵢ²)` for `i < p`.

- Every `tᵢ` lies in `[1, √3)`. For `m ≥ 1`, `Ψ^[m](X + Z)` has the same polar factor `R` as
  `X + Z`, and its singular values are `g^[m](tᵢ) ∈ (0, 1]` (SpectralSteepestDescent 3.2 and
  4.1, which maps `(1, √3)` into `(0, 1)`).
- With `e_m(t) = 1 − g^[m](t)`: `‖Ψ^[m](X + Z) − R‖_op = maxᵢ e_m(tᵢ)` and
  `‖Ψ^[m](X + Z) − R‖_F² = Σᵢ e_m(tᵢ)²` (SpectralSteepestDescent 3.3).
- `e₁(t) = (t − 1)² (2 + t)/2 ≤ ((2 + √3)/8) s⁴` for `t = √(1 + s²) ∈ [1, √3)`, since
  `t − 1 = s²/(t + 1) ≤ s²/2`; and `e_{j+1} = e_j² (3 − e_j)/2` (SpectralSteepestDescent 4.1), so
  `e_{j+1} ≤ e_j` and `e_{j+1} ≤ (3/2) e_j²`, since `e_j ∈ [0, 1)`.
- The region is sharp: at `‖Z‖_op = √2` some `tᵢ = √3`, and `g(√3) = 0`, so `Ψ(X + Z)` loses rank.

(Proved here from SpectralSteepestDescent 3.2, 3.3, 4.1 and 6.1.)

**Checks.**

- `Ψ` of `(2)` is `(−1)` and of `diag(2, 1/2)` is `diag(−1, 11/16)`; the variant with
  `(Aᵀ A)^(j+1)` in `oddStep` would give `(−4)`. A matrix with orthonormal columns, such as a
  rotation, is fixed by `Ψ`.
- `X = e₁`, `Z = e₂` (`s = 1`, `t = √2`): `Ψ(X + Z) = (e₁ + e₂)/2` and `R = (e₁ + e₂)/√2`; the
  error `1 − 1/√2 = 0.2929` equals `e₁(√2) = (2 − √2)/2` and is at most `(2 + √3)/8 = 0.4665`;
  `e₂(√2) = 0.1161`.
- The constant `(2 + √3)/8` is not sharp: `e₁(t)/s⁴ → 3/8` as `s → 0`, and
  `3/(2 + √3) = 0.8038`.

*Needs:* 1.1; SpectralSteepestDescent 3.1, 3.2, 3.3, 4.1, 6.1; Mathlib `Matrix.toEuclideanLin`,
`LinearMap.adjoint`.

### 4.2 The pullback bound for Newton–Schulz steps

`ns_pullback_le`: if `SmoothOnOpBall f gradf L G`, `X` is a point, `Z` is tangent,
`‖Z‖_op ≤ ζ < √2` and `m ≥ 1`, then

    f(Ψ^[m](X + Z)) ≤ f(X) + ⟪∇f(X), Z⟫ + ((L + G)/2 + ((2 + √3)/8) G ζ²) ‖Z‖_F².

Route: by 4.1 `Ψ^[m](X + Z)` and `R` lie in `B`, so the mean value inequality on the segment
between them gives `f(Ψ^[m](X + Z)) − f(R) ≤ G ‖Ψ^[m](X + Z) − R‖_F`. By 4.1,
`‖Ψ^[m](X + Z) − R‖_F ≤ (Σᵢ e₁(tᵢ)²)^(1/2) ≤ ((2 + √3)/8) (Σᵢ sᵢ⁸)^(1/2)
≤ ((2 + √3)/8) ‖Z‖_op² ‖Z‖_F²`. Add 3.1. (Proved here.)

**Checks.**

- `m = 0` is excluded: `Ψ^[0](X + Z) = X + Z` has operator norm `√(1 + ‖Z‖_op²) > 1` when
  `Z ≠ 0`, outside `B`.
- For `G = 0` the bound is that of 3.1.

*Needs:* 3.1, 4.1; Mathlib `Convex.norm_image_sub_le_of_norm_fderiv_le`.

### Examples

`X = e₁`, `Z = e₂` in `ℝ²`, one and two steps.

### Dependencies

4.1 uses 1.1 and SpectralSteepestDescent 3.1–3.3, 4.1, 6.1; 4.2 uses 3.1 and 4.1.

## Layer 5: one Newton–Schulz step per iteration

The iteration, for `η > 0` and a point `Y₀`, is `nsDescentSeq gradf η Y₀`:

    S_k = skew(∇f(Y_k) Y_kᵀ),    Y_{k+1} = Ψ(Y_k − η S_k Y_k).

`S_k` is an `n × n` skew-symmetric matrix. No polar factor, inverse or square root is computed,
and `Y_k` need not have orthonormal columns for `k ≥ 1`. Write `D_k = ‖1 − Y_kᵀ Y_k‖_F`,
`σ_k = ‖S_k‖_F` and `ζ = η G`.

### 5.1 One step

For any `Y`, any skew-symmetric `W`, `Z = W Y`, `A = Y + Z` and `E = 1 − Aᵀ A`:

- `Yᵀ Z + Zᵀ Y = 0` and `Aᵀ A = Yᵀ Y + Zᵀ Z`;
- `Ψ A = A + ½ A E` and `1 − (Ψ A)ᵀ (Ψ A) = E² (3 + E)/4`;
- `⟪∇f(Y), W Y⟫ = ⟪skew(∇f(Y) Yᵀ), W⟫`, which is `−η σ²` for `W = −η S`.

`ns_defect_le`: if moreover `‖Y‖_op ≤ 1` and `‖Z‖_F² ≤ 1/4`, then, with `D = ‖1 − Yᵀ Y‖_F`,
`‖Ψ A‖_op ≤ 1` and `‖1 − (Ψ A)ᵀ (Ψ A)‖_F ≤ (D + ‖Z‖_F²)²`. No bound on `D` is needed.

Route: `E ≤ 1` because `Aᵀ A ≥ 0`, and `E ≥ −Zᵀ Z` because `1 − Yᵀ Y ≥ 0`; so the eigenvalues of
`E` lie in `[−‖Z‖_F², 1]`, `‖(3 + E)/4‖_op ≤ 1`, and the singular values `√(1 − e)` of `A` lie in
`[0, √(5/4)]`, where `g` takes values in `[0, 1]`. Finally `‖E²(3 + E)/4‖_F ≤ ‖E‖_F²` and
`‖E‖_F ≤ D + ‖Zᵀ Z‖_F ≤ D + ‖Z‖_F²`. The hypothesis `‖Y‖_op ≤ 1` cannot be dropped: for `p = 1`,
`Y = √10 e₁` and `W = 0`, the left side is `121.5` and the right side `81`. Su and Huang quote from
Higham and Schreiber the strict inequality `‖1 − Ψ(A)ᵀ Ψ(A)‖_F < ‖1 − Aᵀ A‖_F²` for
`‖1 − Aᵀ A‖_F < 1` (Su–Huang, §7, (70)); the identity above gives it with `≤`, and with `<` when
`Aᵀ A ≠ 1` (both sides vanish when `Aᵀ A = 1`). (Proved here.)

**Checks.**

- `p = 1`, `n = 2`, `Y = e₂`, `W = (e₁e₂ᵀ − e₂e₁ᵀ)/6`: `Z = e₁/6`, `A = (1/6, 1)`, `E = −1/36`,
  `Ψ A = (71/72) A = (71/432, 71/72)`, and
  `1 − ‖Ψ A‖² = 107/186624 = E² (3 + E)/4`, below `(0 + 1/36)² = 144/186624`.

*Needs:* Mathlib `Matrix.trace`, `Matrix.IsHermitian.eigenvalues`; 4.1.

### 5.2 The iterates stay near the manifold

`ns_iterates_feasible`: if `SmoothOnOpBall f gradf L G`, `0 < η`, `3 η (L + G) ≤ 1` and `Y₀` is a
point, then for every `k`, `‖Y_k‖_op ≤ 1` and `D_k ≤ 4 ζ⁴`, which is at most `4/81`.

Route: induction on `k` with 5.1, `W = −η S_k`. Since `Y_k ∈ B`, `σ_k ≤ ‖∇f(Y_k)‖_F ≤ G` and
`‖Z_k‖_F ≤ η σ_k ≤ ζ ≤ 1/3`. With `q = 4 ζ⁴ + ζ² ≤ 2 ζ²`,
`D_{k+1} ≤ (D_k + η² σ_k²)² ≤ q (D_k + η² σ_k²) ≤ q² ≤ 4 ζ⁴`. (Proved here.)

**Checks.**

- The example of 5.1 is the first step for `f = −⟪e₁, ·⟫` (`L = 0`, `G = 1`), `η = 1/3`,
  `Y₀ = e₂`: `S₀ = (e₂e₁ᵀ − e₁e₂ᵀ)/2`, `σ₀² = 1/2`, and `D₁ = 107/186624 ≤ 4/81`.
- The step-size condition is used: with `η = 3` in that example, `Z₀ = (3/2) e₁`,
  `‖Z₀‖_F² = 9/4 > 2`, the singular value `√13/2` of `A` exceeds `√3`, and `Ψ A = −A/8`
  reverses the sign of the iterate.
- `G = 0` forces `∇f = 0` on `B`; then `S_k = 0`, `Ψ` fixes the point `Y₀`, and `Y_k = Y₀`.

*Needs:* 5.1, 3.1 (the definitions).

### 5.3 The rate

`sum_sq_norm_skew_le`: if `SmoothOnOpBall f gradf L G`, `f_low ≤ f` on `B`, `0 < η`,
`3 η (L + G) ≤ 1` and `Y₀` is a point, then for every `K`

    Σ_{k<K} ‖S_k‖_F² ≤ 2 (f(Y₀) − f_low)/η.

So for `L + G > 0`, `η = 1/(3 (L + G))` and `K ≥ 1`, some `k < K` has
`‖S_k‖_F ≤ √(6 (L + G)(f(Y₀) − f_low)/K)`.

Route, with `A_k = Y_k + Z_k`, `Z_k = −η S_k Y_k`, `E_k = 1 − A_kᵀ A_k`:

- `Y_k` and `Y_{k+1}` lie in `B` by 5.2, and `Y_{k+1} − Y_k = Z_k + ½ A_k E_k` by 5.1; apply the
  descent lemma on the segment between them.
- `‖A_k‖_op ≤ √(1 + ζ²) ≤ 9/8` and `‖E_k‖_F ≤ u_k := D_k + η² σ_k² ≤ q ≤ 2/9`.
- The first-order term is `⟪∇f(Y_k), Z_k⟫ + ½ ⟪∇f(Y_k), A_k E_k⟫ ≤ −η σ_k² + (9/16) G u_k`; the
  second-order term uses `(a + b)² ≤ 2a² + 2b²` with `a = η σ_k`, `b ≤ (9/16) u_k`, and
  `u_k² ≤ q u_k`. Together
  `f(Y_{k+1}) ≤ f(Y_k) − η σ_k² (1 − η (L + c₀)) + c₀ D_k` with `c₀ = (9/16) G + (81/256) L q`.
- `D₀ = 0` and `D_{k+1} ≤ q (D_k + η² σ_k²)` give
  `Σ_{k<K} D_k ≤ (q/(1 − q)) η² Σ_{k<K} σ_k² ≤ η² Σ_{k<K} σ_k²`.
- Summing, `f(Y_K) ≤ f(Y₀) − η (1 − η (L + 2 c₀)) Σ_{k<K} σ_k²`, and
  `L + 2 c₀ ≤ (73/64) L + (9/8) G ≤ (3/2)(L + G)`, so the factor is at least `1/2`; finally
  `f(Y_K) ≥ f_low` because `Y_K ∈ B`.

No source states this bound. (Proved here.)

**Checks.**

- The example of 5.2 (`f_low = −1`, `η = 1/3`): `σ₀² = 1/2`, and the bound is
  `2 (0 + 1)/(1/3) = 6`.
- `n = p = 1`: the only skew-symmetric `1 × 1` matrix is `0`, so every `S_k = 0`, `Y_k = Y₀`
  and the left side is `0`; on `O(1) = {±1}` every Riemannian gradient is `0` as well.

*Needs:* 5.1, 5.2, 3.1 (the definitions); SpectralSteepestDescent 5.1.

### 5.4 The stationarity measure

`sq_norm_skew_mul_transpose_le`: for a point `X` and any `G₀`, with
`grad = G₀ − X sym(Xᵀ G₀)`,

    ½ ‖grad‖_F² ≤ ‖skew(G₀ Xᵀ)‖_F² ≤ ‖grad‖_F².

Route: complete `X` to an orthogonal matrix `(X, X⊥)` and write `G₀ = X M + X⊥ C`. Then
`‖grad‖_F² = ‖skew M‖_F² + ‖C‖_F²` and `‖skew(G₀ Xᵀ)‖_F² = ‖skew M‖_F² + ½ ‖C‖_F²`. For `n = p`
the term `C` is absent and the two sides are equal. So 5.3 bounds, at points of the manifold,
the Riemannian gradient up to a factor `√2`. (Proved here.)

**Checks.**

- `X = e₁`, `G₀ = e₂` in `ℝ²`: `‖grad‖² = 1` and `‖skew(G₀ Xᵀ)‖² = 1/2`: the lower bound is
  attained.
- `n = p = 2`, `X = 1`, `G₀ = [[1, 2], [3, 4]]`: both sides are `1/2`.

*Needs:* Mathlib `Matrix.trace`.

### Examples

The linear cost `−⟪e₁, ·⟫` on `2 × 1` matrices from `Y₀ = e₂`, with `η = 1/3` and `η = 3`.

### Dependencies

5.1 uses 4.1's `nsStep`; 5.2 uses 5.1 and the definitions of 3.1; 5.3 uses 5.1, 5.2 and
SpectralSteepestDescent 5.1; 5.4 uses no other target.

## Scope and ownership

This roadmap owns the matrix-level constants of the polar retraction (1.2, 1.3), the explicit
pullback constant `L + G` (3.1) and the rate with it (3.2), the properties of Newton–Schulz steps
taken at `X + Z` (4.1, 4.2), and the one-step Newton–Schulz iteration with infeasible iterates
(Layer 5). It also states R.-C. Li's perturbation bounds for the polar factor (Layer 2): no roadmap
on main and no library at the pins has a perturbation bound for the polar factor;
PolarDecomposition has only the near-isometry bounds PD-B40 to PD-B43, which compare a map with
an isometry rather than two polar factors.

Left to other roadmaps:

- **ManifoldOptimization** owns the Stiefel manifold `St(n, p)` as a Riemannian manifold, its
  tangent spaces `{U : Xᵀ U + Uᵀ X = 0}` and the projection `Z ↦ Z − X sym(Xᵀ Z)` (O0.3), the polar
  and Q-factor retractions as retractions (O2.2), the existence of some pullback constant on a
  compact manifold (O2.4), and the rate of Riemannian gradient descent given such a constant
  (O4.1). Here "tangent" is the hypothesis `Xᵀ Z + Zᵀ X = 0` and the Riemannian gradient is a
  matrix expression. 3.2 above is O4.1 for the polar retraction with the constant of 3.1 made
  explicit, stated on matrices and for every step `η` with `η (L + G) ≤ 1` (O4.1 takes the step
  `1/L`); `polarStepSeq` is, at matrix level, O4.1's gradient-descent sequence for the polar
  retraction, and is defined here only because 3.2 is stated on matrices. ManifoldOptimization
  gives no explicit pullback constant for a retraction of a matrix manifold (its explicit
  constants are for the flat retraction `x + v`), and states no Newton–Schulz step, no inexact
  retraction, no infeasible iterates and no perturbation bound for the polar factor.
- **SpectralSteepestDescent** owns the polar factor's API (1.3), odd polynomial steps and their
  spectral form (3.1–3.3), the cubic scalar map with its convergence region and error recursion
  (4.1), the descent lemma (5.1) and the matrix forms (6.1), among them the matrix polar factor
  `matrixPolarFactor`. This roadmap copies `matrixPolarFactor`, `oddStep` and `cubicCoeffs`
  verbatim and states only what is new at the input `X + Z`.
- **The Frobenius nearest-point property** of the polar factor is stated in two roadmaps:
  SpectralSteepestDescent 2.3, for injective maps between inner product spaces, and
  ManifoldOptimization O2.2, for matrices of full column rank and `St(n, p)`. This roadmap proves
  neither and uses the property only in 1.1, where either statement suffices.
- **FirstOrderOptimization** 2.1 is the Euclidean statement that 3.2 and 5.3 parallel (gradient
  descent with `η K ≤ 1` and `Σ ‖∇f(x_i)‖² ≤ 2 (f(x₀) − m)/η`); nothing of it is used.
- **SpectralSubspacePerturbation** owns the Sylvester bounds (Part B, SSP-B09, which is 2.9 in
  its sectioned numbering); Layer 2 consumes the Tau Ceti declaration.

The closest published work on Layer 5 is Su and Huang, *An inexact Riemannian gradient descent
algorithm on the Stiefel manifold with one Newton–Schulz iteration* (arXiv:2608.22774v1). Their
iteration is `X_{k+1} = Ψ(X_k − α_k skew(∇f(X_k) X_kᵀ) X_k)`, the iteration of Layer 5 with a
variable step `α_k` in place of `η`. They choose `α_k` by backtracking from
`min(ᾱ, t_k/(2 ‖ĝ_k‖))`, where `ĝ_k = skew(∇f(X_k) X_kᵀ) X_k`, with an acceptance test that carries
additive tolerances `γ_k`; the positive sequence `t_k` satisfies, among other conditions,
`Σ t_k = ∞` and `Σ t_k⁴ < ∞`; and they start anywhere with `‖Xᵀ X − 1‖_F ≤ 1/2` (Algorithm 1,
Assumptions 3.1, 3.2, 3.4). They prove that `‖ĝ_k‖` tends to `0`, measured in a norm that depends
on `X_k`, with an iteration bound of order `ε^(−8/3)` for small parameters (Theorem 3.8), and a
local linear rate under a local Riemannian Polyak–Łojasiewicz condition (Theorem 3.11). Layer 5
analyses the same iteration with a fixed step size `η`, started on the manifold, and gives the
explicit bound of 5.3.
Their inequality (4) takes from Boumal–Absil–Cartis an unspecified constant `κ` with
`‖R_X(V) − X‖_F ≤ κ ‖V‖_F`; 1.2 gives `κ = 1`. The landing algorithm of Ablin and Peyré is
another retraction-free method on the orthogonal group; it adds a penalty term and is not treated
here.

Outside the scope: the quintic Newton–Schulz step, which converges only on `(0, 1]`
(SpectralSteepestDescent 4.2) while the singular values of `X + Z` are at least `1`, so that it
needs a normalization; Muon's quintic, which is not a retraction since its scalar map has
`m(1) ≠ 1` (SpectralSteepestDescent 4.3); the Cayley and Q-factor retractions; second-order
methods, line searches and geodesics; complex matrices outside Layer 2; floating-point error.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Analysis/Matrix/Normed.lean`: the Frobenius norm on matrices, scoped in
  `Matrix.Norms.Frobenius` (`Matrix.frobeniusNormedAddCommGroup`, `Matrix.frobeniusNormedSpace`,
  `Matrix.frobenius_norm_def`).
- `Mathlib/Analysis/CStarAlgebra/Matrix.lean`: `Matrix.l2_opNorm_def`, identifying the operator
  norm of a matrix with that of `LinearMap.toContinuousLinearMap (Matrix.toEuclideanLin A)`.
- `Matrix.toEuclideanLin` (`Matrix m n 𝕜 ≃ₗ[𝕜] (EuclideanSpace 𝕜 n →ₗ[𝕜] EuclideanSpace 𝕜 m)`)
  and `Matrix.toEuclideanLin_conjTranspose_eq_adjoint`; `LinearMap.adjoint`;
  `LinearMap.toContinuousLinearMap`.
- `Mathlib/Analysis/InnerProductSpace/SingularValues.lean`: `LinearMap.singularValues`
  (zero-indexed, nonincreasing, zero from `finrank E` on).
- `Mathlib/Analysis/Matrix/HermitianFunctionalCalculus.lean`:
  `Matrix.IsHermitian.instContinuousFunctionalCalculus`, for `(1 + Zᵀ Z)^(±1/2)`;
  `Matrix.IsHermitian.eigenvalues`.
- `fderiv`, `Matrix.trace`, `Finset.sum_range_succ`, and the mean value inequality
  `Convex.norm_image_sub_le_of_norm_fderiv_le` (for `f` differentiable on a convex set with
  `‖fderiv‖ ≤ C` there, `‖f y − f x‖ ≤ C ‖y − x‖`).

### From Tau Ceti

- `TauCeti/Analysis/InnerProductSpace/Polar/Finite.lean`: `LinearMap.polarFactor`, the canonical
  polar factor of a map between finite-dimensional inner product spaces over `𝕜`, vanishing on
  the kernel.
- `TauCeti/Analysis/InnerProductSpace/Polar/Isometry.lean`: `LinearMap.polarIsometry`, the polar
  factor of an injective map as an isometric embedding.
- `TauCeti/Analysis/SpecialFunctions/ContinuousFunctionalCalculus/Polar.lean`:
  `Units.polarUnitary`, the unitary polar factor of a unit, which is the polar factor of a square
  invertible matrix (cited for comparison; not consumed).
- `TauCeti/Analysis/InnerProductSpace/UnitarilyInvariantSeminorm/Basic.lean`:
  `TauCeti.UnitarilyInvariantSeminorm 𝕜 E F`, a seminorm on `E →ₗ[𝕜] F` invariant under linear
  isometric equivalences of `E` and of `F`; `…/Frobenius.lean`:
  `TauCeti.UnitarilyInvariantSeminorm.frobenius`.
- `TauCeti/Analysis/InnerProductSpace/UnitarilyInvariantSeminorm/Sylvester/Basic.lean`:
  `TauCeti.UnitarilyInvariantSeminorm.mul_map_le_map_sylvester_apply_of_pointIntervalExteriorGap`:
  for symmetric `A`, `B` whose spectra are separated by an interval/exterior gap `δ`,
  `δ N(X) ≤ N(A X − X B)` for every unitarily invariant seminorm `N`.
- `TauCeti/Analysis/OperatorIdeal/ApproximationNumber/EckartYoung.lean`:
  `LinearMap.abs_singularValues_sub_singularValues_le`,
  `|σᵢ(A) − σᵢ(B)| ≤ ‖A − B‖_op` (used in 2.4).

### From TauCetiRoadmap.SpectralSteepestDescent

- 1.3: for injective `A`, `U_A` is `LinearMap.polarIsometry`. 2.3: for injective `A`,
  `‖A − U_A‖_F ≤ ‖A − V‖_F` for every linear isometry `V`, with equality only at `V = U_A`.
- 3.1: `oddStep c X = Σⱼ cⱼ X (X† X)ʲ`, copied verbatim. 3.2: `(oddStep c)^[k] X =
  U_X ∘ cfc((oddScalar c)^[k]) |X|`, its singular values, and `U` unchanged when the scalar
  iterates are positive on the nonzero singular values. 3.3: the operator and Frobenius errors
  against `U_X` in terms of the scalar iterates.
- 4.1: `cubicCoeffs = (3/2, −1/2)`, copied verbatim; `1 − g(t) = (1 − t)² (2 + t)/2`; `(1, √3)`
  is mapped into `(0, 1)`; `e_{k+1} = e_k² (3 − e_k)/2`; `g(√3) = 0`.
- 5.1: the descent lemma `f(x + h) ≤ f(x) + Df(x) h + (L/2) ‖h‖²` for a derivative that is
  `L`-Lipschitz on the segment.
- 6.1: the matrix polar factor through `Matrix.toEuclideanLin`, the Frobenius norm and the trace
  pairing on matrices.

### From TauCetiRoadmap.ManifoldOptimization

No declaration is consumed. O0.3 (the Stiefel manifold, its tangent spaces and projection), O2.2
(the polar retraction, and the nearest-point property on `St(n, p)`) and O4.1 (the rate given a
pullback constant) are the objects whose matrix expressions Layers 1 and 3 use, as described
under scope and ownership.

### From TauCetiRoadmap.PolarDecomposition

PD-B11 to PD-B16: the canonical finite-dimensional polar factor and its kernel, range and
partial-isometry properties, which Tau Ceti's `LinearMap.polarFactor` implements.

### From TauCetiRoadmap.SpectralSubspacePerturbation

Part B, SSP-B09 (2.9 in its sectioned numbering): the interval/exterior Sylvester bound for
unitarily invariant seminorms, which the Tau Ceti declaration above implements.

## References

- N. Boumal, *An Introduction to Optimization on Smooth Manifolds*, Cambridge University Press,
  2023; author's PDF at <https://www.nicolasboumal.net/book/>, whose numbering is that of the
  book: (7.23), (7.24) and (7.28) in §7.3, Proposition 4.8 and Corollary 4.9 in §4.4.
- N. Boumal, P.-A. Absil and C. Cartis, Global rates of convergence for nonconvex optimization on
  manifolds, *IMA J. Numer. Anal.* 39 (2019), 1–33; arXiv:1605.08101v2, whose numbering is cited:
  Lemma 4 (§2, p. 7), Theorem 5 and Corollary 6 (§2.1, p. 8), Appendix B, (29)–(32).
- R.-C. Li, *New perturbation bounds for the unitary polar factor*, Technical Report
  UCB/CSD-94-852, University of California, Berkeley, 1994, open on the Berkeley EECS
  technical-report pages; published in *SIAM J. Matrix Anal. Appl.* 16 (1995), 327–332. Lemma 1,
  Lemma 2 (14), Theorem 1 (15), Theorem 2 (18), Theorem 3 (19), Remarks 1 and 2 (20), pp. 4–6 of
  the report.
- Y. Su and W. Huang, *An inexact Riemannian gradient descent algorithm on the Stiefel manifold
  with one Newton–Schulz iteration*, arXiv:2608.22774v1 (2026).
- Attributed in prose without a locator: P. Ablin and G. Peyré, the landing algorithm (AISTATS
  2022), as described by Su and Huang; N. J. Higham and R. S. Schreiber, the defect inequality of
  the Newton–Schulz step, as quoted by Su and Huang.

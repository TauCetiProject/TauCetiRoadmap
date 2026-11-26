# Roadmap: eigenvalue iterations

**Summary.** This roadmap develops the convergence theory of the classical vector and subspace
iterations for eigenvalues of an operator on a finite-dimensional space: power iteration (the
directions of `Tᵏ v`), subspace iteration (the subspaces `Tᵏ W`), inverse iteration with a fixed
shift (power iteration for `(T − σ)⁻¹`), and Rayleigh quotient iteration, where the shift is the
Rayleigh quotient of the current vector. Each iterate is a term of a sequence of vectors or
subspaces defined by a recurrence, and each theorem is a statement about those sequences and about
eigenvalues; no procedure, normalization strategy, operation count or rounding error is a target.
Layer 1 treats an arbitrary operator on a complex space; Layers 2 and 3 treat operators with an
orthonormal basis of eigenvectors, which are the normal operators on a complex inner product space
and the symmetric operators on a real or complex one.

The headline theorems are these.

- *Power iteration.* Let `T` act on a finite-dimensional complex space and let `λ ≠ 0` be an
  eigenvalue whose generalized eigenspace equals its eigenspace, with every other eigenvalue `μ`
  satisfying `|μ| < r |λ|`. Then for every starting vector `v` there is a vector `u` of the
  eigenspace of `λ` with `‖λ⁻ᵏ Tᵏ v − u‖ = O(rᵏ)`, so that for `r < 1` the vectors `λ⁻ᵏ Tᵏ v`
  converge to `u`; and `u ≠ 0` exactly when `v` has a nonzero component along the eigenspace of
  `λ` in the decomposition into generalized eigenspaces. If `T` has an orthonormal eigenbasis and
  every other eigenvalue satisfies `|μ| ≤ ρ |λ|`, the tangent of the angle between `Tᵏ v` and the
  eigenspace is at most `ρᵏ` times that of `v`.
- *Subspace iteration.* If the spectrum of `T` splits into eigenvalues of modulus at least `α > 0`
  and eigenvalues of modulus less than `r α`, and `W` has the dimension of the dominant invariant
  subspace `U` and meets the complementary invariant subspace only in `0`, then the gap between
  `Tᵏ W` and `U` is `O(rᵏ)`. With an orthonormal eigenbasis, the largest principal tangent from
  `Tᵏ W` to `U` is at most `ρᵏ` times that from `W`, where `ρ α` bounds the small eigenvalues.
- *Rayleigh quotient iteration.* If `T` has an orthonormal eigenbasis, every eigenvalue lies within
  `c` of `λ`, every other eigenvalue lies at distance at least `δ` from `λ`, and the tangent `t₀`
  of the angle between `x₀` and the eigenspace of `λ` satisfies `2 c t₀² < δ`, then the tangents
  of the Rayleigh quotient iterates satisfy `t_{k+1} ≤ (2c/δ) t_k³` and tend to `0`.
- *The Kato–Temple bound.* If `T` is symmetric, `x ≠ 0` has Rayleigh quotient `R` and normalized
  squared residual `ε² = ‖T x − R x‖² / ‖x‖²`, and an open interval `(a, b)` contains `R` and
  exactly one eigenvalue `λ`, then `−ε²/(R − a) ≤ R − λ ≤ ε²/(b − R)`.

The roadmap builds on Mathlib's generalized eigenspaces, their independence and their spanning of
the space over `ℂ`, together with its spectral theorem for symmetric operators, its orthogonal
projections and its Rayleigh quotient. Tau Ceti supplies the spectral theorem for normal operators
and the gap and directed gap between subspaces, which PrincipalAngles defines and on which
SpectralSubspacePerturbation states the Davis–Kahan theorems. The residual bounds for the angle
between an approximate and an exact eigenvector (the Davis–Kahan theorems), the Rayleigh
quotient as an optimization problem on the sphere, and the convergence of powers of stochastic
matrices belong to other roadmaps and are not restated; among residual bounds for eigenvalues,
only the Kato–Temple bound is treated here.

## How to read the build

Layer 1 below defines the dominant and subdominant subspaces of an operator at a level `α` and
proves the convergence of power iteration and of subspace iteration for an arbitrary operator on a
finite-dimensional complex space, with rates `O(rᵏ)`. Layer 2 assumes an orthonormal eigenbasis
and proves the exact tangent bounds for power iteration, for subspace iteration, and for one step
of inverse iteration with an arbitrary shift; it uses the dominant subspace of Layer 1. Layer 3
defines the Rayleigh quotient and proves its quadratic accuracy, the Kato–Temple bound and the
local cubic convergence of Rayleigh quotient iteration, which uses 2.3 and 3.1.

## Conventions

- **Spaces and operators.** In Layer 1, `E` is a finite-dimensional complex normed space (for 1.3
  a complex inner product space) and `T : Module.End ℂ E`. In Layers 2 and 3, `𝕜` is `ℝ` or `ℂ`
  (an `RCLike` field), `E` is a finite-dimensional inner product space over `𝕜`, and
  `T : E →L[𝕜] E`; eigenvalues and eigenspaces are those of the underlying linear map.
- **Orthonormal eigenbasis.** "`T` has an orthonormal eigenbasis" means that it comes with
  `b : OrthonormalBasis ι 𝕜 E` and `d : ι → 𝕜` such that `T (b i) = d i • b i` for every `i`; the
  eigenvalues of `T` are then the values `d i`. A symmetric operator has one (Mathlib's
  `LinearMap.IsSymmetric.eigenvectorBasis` and `LinearMap.IsSymmetric.apply_eigenvectorBasis`),
  and so has a normal operator on a complex space (Tau Ceti's
  `LinearMap.exists_orthonormalBasis_apply_eq_smul_of_isStarNormal`). Hypotheses on the
  eigenvalues are written through `d`, for instance `∀ i, d i ≠ λ → ‖d i‖ ≤ ρ ‖λ‖`.
- **Projections and angles.** `P_λ` is the orthogonal projection onto the eigenspace of `λ`
  (Mathlib's `Submodule.starProjection`); it is `0` when `λ` is not an eigenvalue. For `x` with
  `P_λ x ≠ 0` the tangent of the angle between `x` and the eigenspace is
  `‖x − P_λ x‖ / ‖P_λ x‖`, and the sine is `‖x − P_λ x‖ / ‖x‖`. Statements about tangents are
  written multiplied out, so that they need no hypothesis `P_λ x ≠ 0`, except in 3.3.
- **Gaps.** For subspaces `Z` and `U`, the gap is `‖P_Z − P_U‖` (Tau Ceti's
  `Submodule.projectionGap`) and the directed gap from `Z` to `U` is `‖P_{U⊥} P_Z‖`
  (`Submodule.directedProjectionGap`), the sine of the largest principal angle from `Z` to `U`;
  for subspaces of equal dimension the two coincide
  (`Submodule.projectionGap_eq_directedProjectionGap_of_finrank_eq`). Tau Ceti also lists the
  tangents of the principal angles (`Submodule.principalTangents`), reading `tan(π/2)` as `0`;
  2.2 is written through the directed gap, multiplied out, so that this junk value does not
  enter.
- **Iterates.** The iterates are left unnormalized: `Tᵏ v`, `Tᵏ W` (the image `W.map (T ^ k)`),
  and in 3.3 `x_{k+1} = (T − R(x_k))⁻¹ x_k`. The angles, gaps and Rayleigh quotients in the
  statements are invariant under nonzero scaling, so a normalized iteration has the same ones;
  1.2 is the exception, as it fixes the scaling by `λ⁻ᵏ`.
- **Junk values.** `(T − σ)⁻¹` is Mathlib's `Ring.inverse`, equal to `0` when `T − σ` is not
  invertible, that is when `σ` is an eigenvalue; the Rayleigh quotient of `0` is `0`, and division
  by zero gives `0`. In 3.3, if a shift `R(x_k)` equals `λ` the next iterate is `0` and all later
  tangents are `0`; in exact arithmetic the iteration has then reached the eigenvalue.

## Layer 1: dominant spectral parts of a general operator

### 1.1 Dominant and subdominant subspaces

Define `dominantSubspace T α`, the sum of the generalized eigenspaces
(`Module.End.maxGenEigenspace`) of `T` for the eigenvalues `μ` with `α ≤ ‖μ‖`, and
`subdominantSubspace T α`, the sum of those with `‖μ‖ < α`, for an endomorphism `T` of a vector
space over a normed field. Prove:

- both are invariant under `T`;
- over `ℂ` in finite dimension they are complementary: their intersection is `0` and their sum is
  the whole space, by the independence of generalized eigenspaces and their spanning
  (`Module.End.independent_genEigenspace`, `Module.End.iSup_maxGenEigenspace_eq_top`);
- for `α > 0` the restriction of `T` to the dominant subspace is invertible.

**Checks.**
- `T = [[2, 1], [0, 1]]` on `ℂ²` and `α = 2`: the dominant subspace is the line of `e₁` and the
  subdominant subspace is the line of `(1, −1)`, since `T (1, −1) = (1, −1)`. The two lines are
  complementary but not orthogonal, so the dominant subspace is not the orthogonal complement of
  the subdominant one.
- A definition through eigenspaces instead of generalized eigenspaces would give, for the Jordan
  block `[[1, 1], [0, 1]]` and `α = 1`, only the line of `e₁`, which is not complementary to the
  subdominant subspace `0`.

*Needs:* Mathlib `Module.End.maxGenEigenspace`, `Module.End.mapsTo_maxGenEigenspace_of_comm`,
`Module.End.independent_genEigenspace`, `Module.End.iSup_maxGenEigenspace_eq_top`. (Proved here.)

### 1.2 Power iteration

Prove `exists_norm_inv_pow_smul_pow_apply_sub_le`: let `T` act on a finite-dimensional complex
normed space, let `λ ≠ 0` with `T.maxGenEigenspace λ = T.eigenspace λ`, and let `r` be real with
`‖μ‖ < r ‖λ‖` for every eigenvalue `μ ≠ λ`. For every `v` there is `u` in the eigenspace of `λ`
such that `u ≠ 0` if and only if `v` does not lie in the sum of the generalized eigenspaces of the
eigenvalues `μ ≠ λ`, and a constant `C` with `‖λ⁻ᵏ Tᵏ v − u‖ ≤ C rᵏ` for every `k`. (Saad,
Theorem 4.1 and its proof, (4.2), pp. 86–87, for the convergence, under one eigenvalue of
largest modulus and semisimple; the factor `|λ₂|/|λ₁|` is named there on p. 87 as suggested by
the proof. The bound `O(rᵏ)` is proved here.)

Route: write `v = u + w` with `u` in the eigenspace of `λ`, which is the generalized eigenspace by
hypothesis, and `w` in the sum `V` of the other generalized eigenspaces, by their independence
and spanning. Then `λ⁻ᵏ Tᵏ u = u`, and `λ⁻ᵏ Tᵏ w` is the `k`-th power of the restriction of
`λ⁻¹ T` to `V` applied to `w`. That restriction has spectral radius less than `r`, so Gelfand's
formula (`spectrum.gelfand_formula`) gives `‖(λ⁻¹ T|_V)ᵏ‖ ≤ C' rᵏ`. The decomposition is unique,
so `u = 0` exactly when `v ∈ V`.

**Checks.**
- *Strictness.* `T = diag(2) ⊕ [[1, 1], [0, 1]]` on `ℂ³`, `λ = 2`, `v = e₁ + e₃`: the hypothesis
  holds for every `r > 1/2` but not for `r = 1/2`, and indeed `λ⁻ᵏ Tᵏ v − e₁ = (0, k 2⁻ᵏ, 2⁻ᵏ)`,
  which is not `O(2⁻ᵏ)` (the error times `2ᵏ` is `k` in the sup norm).
- *Semisimplicity.* For `T = [[1, 1], [0, 1]]`, `λ = 1` and `v = e₂`, the vectors `Tᵏ v = (k, 1)`
  are unbounded, although their directions tend to that of `e₁`; the hypothesis
  `maxGenEigenspace = eigenspace` fails.
- *Two eigenvalues of largest modulus.* For the rotation `[[0, −1], [1, 0]]`, with eigenvalues
  `±i`, no `r ≤ 1` satisfies the hypothesis, and `Tᵏ e₁` runs through `e₁, e₂, −e₁, −e₂`.
- *Start in the complement.* If `v` lies in the subdominant part, `u = 0`: for `T = diag(2, 1)`
  and `v = e₂`, `λ⁻ᵏ Tᵏ v = 2⁻ᵏ e₂ → 0`.
- *`λ ≠ 0` is needed.* For `T = 0` on `ℂ`, `λ = 0`, `r = 1/2` and `v = 1`, all hypotheses but
  `λ ≠ 0` hold, the scaled iterates are `1, 0, 0, …`, so `u = 0`, while `v` does not lie in the
  sum of the other generalized eigenspaces, which is `0`.

*Needs:* 1.1; Mathlib `Module.End.maxGenEigenspace`, `Module.End.eigenspace`,
`Module.End.HasEigenvalue`, `Module.End.independent_genEigenspace`,
`Module.End.iSup_maxGenEigenspace_eq_top`, `Module.End.mapsTo_maxGenEigenspace_of_comm`,
`spectrum.gelfand_formula`, `Module.End.hasEigenvalue_iff_mem_spectrum`.

### 1.3 Subspace iteration

Prove `exists_projectionGap_map_pow_dominantSubspace_le`: let `T` act on a finite-dimensional
complex inner product space, let `α > 0`, and let `r` be real with `‖μ‖ < r α` for every
eigenvalue `μ` with `‖μ‖ < α`. Let `U = dominantSubspace T α`. If `W` has the dimension of `U`
and `W` is disjoint from `subdominantSubspace T α`, there is `C` with
`‖P_{Tᵏ W} − P_U‖ ≤ C rᵏ` for every `k`. (Saad, Theorem 5.1 and its proof, pp. 116–117: the
theorem assumes `|λᵢ| > |λᵢ₊₁|` for every `i ≤ m` and a rank condition on every leading block of
the starting basis, and concludes column by column; the first part of its proof uses only
`|λ_m| > |λ_{m+1}|` and that the projection of the starting basis onto the dominant invariant
subspace has rank `m`, and shows that the orthogonal projector onto `span Xₖ` converges to the
one onto that subspace. Arbenz,
Theorem 8.5, p. 149, states the rate as `(|λ_{p+1}/λ_p| + ε)ᵏ` for the tangent; its hypothesis
`|λ_p| < |λ_{p+1}|` is a misprint for `>`. The bound in the gap is proved here.)

Route: let `V` be the subdominant subspace. Since `W ∩ V = 0` and `dim W = dim U`, the projection
of `E = U ⊕ V` onto `U` along `V` maps `W` isomorphically onto `U`, so `W = {u + X u : u ∈ U}` for
a linear `X : U → V`. Then `Tᵏ W = {u + X_k u}` with `X_k = (T|_V)ᵏ X (T|_U)⁻ᵏ`, and
`‖X_k‖ ≤ C' rᵏ` by Gelfand's formula applied to `T|_V / α` and to `(T|_U)⁻¹ α`, whose spectral
radii are less than `r` and at most `1`. Finally the gap between `U` and the image of `U` under
`1 + Y` with `Y : U → V` is at most a constant times `‖Y‖` for small `Y`, and the gap is at most
`1` (Tau Ceti's `Submodule.projectionGap_le_one`), which handles the finitely many other `k`.

**Checks.**
- `T = [[2, 1], [0, 1]]`, `α = 2`, `U` the line of `e₁`, `W` the line of `e₂`, which meets the
  subdominant line of `(1, −1)` only in `0`: `Tᵏ e₂ = (2ᵏ − 1, 1)`, and the gaps for
  `k = 0, 1, 2, 3` are `1/√((2ᵏ − 1)² + 1)`, that is `1`, `0.7071`, `0.3162` and `0.1414`, tending
  to `0` at the rate `2⁻ᵏ`; every `r > 1/2` is admissible, and `r = 1/2` is not.
- *Disjointness is needed.* For `T = diag(2, 1)`, `α = 2` and `W` the line of `e₂`, the dimensions
  agree but `W` is the subdominant subspace, `Tᵏ W = W` and the gap stays `1`.
- *`α > 0` is needed.* For `T = 0` on `ℂ` and `α = 0`, the dominant subspace is `ℂ` and the
  subdominant subspace is `0`; with `W = ℂ`, `Tᵏ W = 0` for `k ≥ 1` and the gap is `1` for every
  `k ≥ 1`, while every `r` is admissible.

*Needs:* 1.1; Mathlib `Submodule.map`, `Submodule.starProjection`, `spectrum.gelfand_formula`;
Tau Ceti `Submodule.projectionGap`, `Submodule.projectionGap_le_one`.

### Examples

- For `T = diag(3, 2, 1)` on `ℂ³`, `α = 2` and `r` any number above `1/2`, 1.3 applies to every
  plane `W` not containing a nonzero multiple of `e₃`; 1.2 with `λ = 3` applies with any
  `r > 2/3` to every `v` with nonzero first coordinate.

### Dependencies

1.2 and 1.3 use 1.1 and Mathlib's Gelfand formula; 1.3 also uses Tau Ceti's gap. No other layer
is used.

## Layer 2: operators with an orthonormal eigenbasis

### 2.1 Power iteration: the tangent bound

Prove `norm_starProjection_mul_norm_pow_apply_sub_le`: let `T` have an orthonormal eigenbasis
`(b, d)`, let `λ ∈ 𝕜` and `ρ` real with `‖d i‖ ≤ ρ ‖λ‖` whenever `d i ≠ λ`. Then for every `v` and
`k`, `‖P_λ v‖ ‖Tᵏ v − P_λ Tᵏ v‖ ≤ ρᵏ ‖v − P_λ v‖ ‖P_λ Tᵏ v‖`. When `P_λ v ≠ 0` and `λ ≠ 0` this
says that the tangent of the angle between `Tᵏ v` and the eigenspace of `λ` is at most `ρᵏ`
times that for `v`. (Arbenz, Theorem 7.6, p. 133, for the largest eigenvalue of a symmetric
matrix, states the bound for the sine: `sin θ_k ≤ |λ₂/λ₁|ᵏ sin θ₀`. That form fails: for
`diag(1, 1/2)` and `x₀ = (1, 1)`, `sin θ₁ = 1/√5 ≈ 0.447` exceeds `(1/2) sin θ₀ ≈ 0.354`. The
tangent form stated here is proved here.)

Route: expand `v = Σ cᵢ bᵢ`. Then `P_λ v` collects the terms with `d i = λ`, `P_λ Tᵏ v = λᵏ P_λ v`,
and `‖Tᵏ v − P_λ Tᵏ v‖² = Σ_{d i ≠ λ} |cᵢ|² |d i|^(2k) ≤ ρ^(2k) |λ|^(2k) ‖v − P_λ v‖²`. If no
`d i` differs from `λ` both sides vanish, so the sign of `ρ` does not matter.

**Checks.**
- Equality: for `T = diag(1, ρ)` with `0 ≤ ρ < 1`, `λ = 1` and `v = (1, 1)`, both sides are `ρᵏ`.
- *The orthonormal eigenbasis is needed.* For the non-normal `T = [[1, 1], [0, 1/2]]`, `λ = 1`,
  `ρ = 1/2` and the eigenvector `v = (−2, 1)` of `1/2`, at `k = 1` the left side is `2 · (1/2) = 1`
  and the right side is `(1/2) · 1 · 1 = 1/2`: the eigenvector of `1/2` is not orthogonal to that
  of `1`.
- *Inverse iteration.* For `σ` not an eigenvalue, `(T − σ)⁻¹` has the same orthonormal eigenbasis
  with the values `(d i − σ)⁻¹`, so 2.1 applied to it gives the factor
  `ρ = |λ − σ| / min_{d i ≠ λ} |d i − σ|`; for `T = diag(1, 2, 4)`, `λ = 1` and `σ = 1.1` this is
  `0.1/0.9 = 1/9`.

*Needs:* Mathlib `OrthonormalBasis`, `OrthonormalBasis.sum_repr`, `Module.End.eigenspace`,
`Submodule.starProjection`, `Submodule.starProjection_apply_eq_zero_iff` (and the orthogonal
decomposition of `E` into eigenspaces given by the basis).

### 2.2 Subspace iteration: the tangent bound

Prove `directedProjectionGap_map_pow_mul_sqrt_le`: let `T` have an orthonormal eigenbasis `(b, d)`
and let `α, ρ` be real with `‖d i‖ ≤ ρ α` whenever `‖d i‖ < α`. Let `U = dominantSubspace T α`
and, for a subspace `Z`, let `s(Z)` be the directed gap from `Z` to `U`. Then for every subspace
`W` and every `k`, `s(Tᵏ W) √(1 − s(W)²) ≤ ρᵏ s(W) √(1 − s(Tᵏ W)²)`. When `s(W) < 1`, that is
when `W` meets `U⊥` only in `0`, this says that the tangent of the largest principal angle from
`Tᵏ W` to `U` is at most `ρᵏ` times that from `W`. `W` may have any dimension; when
`dim W = dim U` the directed gap equals the gap. (Arbenz, Theorem 8.6, p. 149, for Hermitian
matrices and `dim W = dim U`, with the same misprint as Theorem 8.5; the general form is proved
here.)

Route: with an orthonormal eigenbasis, `U` is spanned by the `bᵢ` with `‖d i‖ ≥ α` and `U⊥` by the
others, and both are invariant. If `s(W) < 1`, `W = {u + X u : u ∈ U'}` for `U' = P_U W` and an
operator `X` from `U'` to `U⊥` (an angular operator over `U'` in the sense of Tau Ceti's
`Submodule.IsAngularOperator`, since `U⊥ ⊆ U'⊥`), and `s(W) = ‖X‖ / √(1 + ‖X‖²)`: the component
of `u + X u` orthogonal to `U`, and to `U'`, is `X u`. Then
`Tᵏ W = {u + X_k u : u ∈ Tᵏ U'}` with `X_k = Tᵏ|_{U⊥} X (Tᵏ|_U)⁻¹`, and `‖X_k‖ ≤ ρᵏ ‖X‖` since
`‖Tᵏ|_{U⊥}‖ ≤ (ρ α)ᵏ` and `‖(Tᵏ|_U)⁻¹‖ ≤ α⁻ᵏ`. If `s(W) = 1` the left side is `0`. If `α ≤ 0`, or
if every eigenvalue has modulus at least `α`, then `U = E` and both sides are `0`.

**Checks.**
- Equality: `T = diag(2, 1, 1/2)`, `α = 2`, `ρ = 1/2`, `W` the line of `e₁ + e₂`. Then
  `Tᵏ W` is the line of `(2ᵏ, 1, 0)`, `s(Tᵏ W) = 1/√(1 + 4ᵏ)`, which is `0.7071`, `0.4472`,
  `0.2425`, `0.1240` for `k = 0, …, 3`, with tangents `1, 1/2, 1/4, 1/8`, and both sides agree.
- If `dim W > dim U`, then `W` meets `U⊥`, `s(W) = 1`, and the statement gives nothing. When `T`
  is invertible, `dim Tᵏ W = dim W > dim U`, so `s(Tᵏ W) = 1` for every `k`: subspace iteration
  with more vectors than `U` has dimensions does not converge to `U`. For a singular `T` it can:
  for `T = diag(1, 0)` on `𝕜²`, `α = 1`, `ρ = 0` and `W = 𝕜²`, `Tᵏ W = U` for every `k ≥ 1`.

*Needs:* 1.1; Mathlib `Submodule.map`, `Submodule.starProjection`, `OrthonormalBasis`;
Tau Ceti `Submodule.directedProjectionGap`, `Submodule.IsAngularOperator`,
`Submodule.graphSubspace`, `Submodule.IsAngularOperator.directedProjectionGap_graphSubspace_left`.

### 2.3 One step of shifted inverse iteration

Prove `sub_mul_norm_starProjection_mul_norm_inverse_apply_sub_le`: let `T` have an orthonormal
eigenbasis `(b, d)`, let `λ ∈ 𝕜` and `δ` real with `δ ≤ ‖d i − λ‖` whenever `d i ≠ λ`. For every
shift `σ ∈ 𝕜` and every `x`, with `y = (T − σ)⁻¹ x`,
`(δ − ‖λ − σ‖) ‖P_λ x‖ ‖y − P_λ y‖ ≤ ‖λ − σ‖ ‖x − P_λ x‖ ‖P_λ y‖`. When `‖λ − σ‖ < δ` and
`P_λ x ≠ 0`, one step of inverse iteration multiplies the tangent of the angle with the
eigenspace of `λ` by at most `‖λ − σ‖ / (δ − ‖λ − σ‖)`. (Saad, (4.5), p. 89, gives the factor
`|λ₁ − σ|/|λ₂ − σ|` of inverse iteration with a fixed shift; the one-step bound in terms of the
gap `δ` is the step of Parlett's proof reproduced by Arbenz in the proof of Theorem 7.14,
pp. 141–142. Proved here in this form.)

Route: if `σ` is an eigenvalue, `y = 0` by the convention on `Ring.inverse` and both sides
vanish. Otherwise `P_λ y = (λ − σ)⁻¹ P_λ x` and every other eigenvalue satisfies
`‖d i − σ‖ ≥ δ − ‖λ − σ‖`, so `(δ − ‖λ − σ‖) ‖y − P_λ y‖ ≤ ‖x − P_λ x‖` when the factor is
positive; when it is not, the left side is at most `0`.

**Checks.**
- Equality: `T = diag(0, 1)`, `λ = 0`, `δ = 1`, `x = (1, 1)` and `σ = ε` with `0 < ε < 1`:
  `y = (−1/ε, 1/(1 − ε))`, and both sides equal `1`.
- *`δ` must not exceed the gap.* With `δ = 2` instead, `σ = 1/2` and the same `x`, `y = (−2, 2)`,
  the left side is `3` and the right side `1`.

*Needs:* Mathlib `Ring.inverse`, `Ring.inverse_non_unit`, `Submodule.starProjection`,
`OrthonormalBasis`.

### Examples

- Applied with a fixed shift, 2.3 and 2.1 give the familiar picture of inverse iteration: for
  `T = diag(1, 2, 4)` and `σ = 1.1`, the tangent with the eigenvector `e₁` is multiplied by at
  most `1/9` per step by 2.1, and by at most `0.1/(1 − 0.1) = 1/9` by 2.3 with `δ = 1`.

### Dependencies

2.2 uses 1.1 and Tau Ceti's gaps and angular operators. 2.1 and 2.3 use only Mathlib.

## Layer 3: Rayleigh quotients

### 3.1 The Rayleigh quotient and its quadratic error

Define `rayleigh T x = ⟪x, T x⟫ / ‖x‖²`, with values in `𝕜` and the value `0` at `x = 0`. For
symmetric `T` it is real and its real part is Mathlib's `ContinuousLinearMap.rayleighQuotient`,
`re ⟪T x, x⟫ / ‖x‖²`; for normal operators on a complex space it is a complex number in the
numerical range, which Mathlib's real-valued quotient does not see.

Prove `sq_norm_mul_norm_rayleigh_sub_le`: let `T` have an orthonormal eigenbasis `(b, d)`, let
`λ ∈ 𝕜` and `c` real with `‖d i − λ‖ ≤ c` for every `i`. Then
`‖x‖² ‖rayleigh T x − λ‖ ≤ c ‖x − P_λ x‖²` for every `x`; for `x ≠ 0` the error of the Rayleigh
quotient is at most `c sin² θ`, with `θ` the angle between `x` and the eigenspace of `λ`.
(Arbenz, (7.21)–(7.23), pp. 132–133, for the largest eigenvalue `λ₁` of a symmetric matrix with
`c = λ₁ − λₙ`, and the identity `λ − ρ_k = (λ − ρ(u_k)) sin² φ_k` on p. 141; proved here in this
generality.)

Route: write `x = P_λ x + z`. Since `T` has an orthonormal eigenbasis, `(T − λ) P_λ x = 0` and
`(T − λ)* P_λ x = 0`, so `⟪x, (T − λ) x⟫ = ⟪z, (T − λ) z⟫ = Σ_{d i ≠ λ} |cᵢ|² (d i − λ)`, whose
modulus is at most `c ‖z‖²`.

**Checks.**
- Equality: for `T = diag(λ, λ + c)` with `c ≥ 0` and `x = (1, t)`,
  `‖x‖² (rayleigh T x − λ) = c t²`.
- *The orthonormal eigenbasis is needed.* For `T = [[0, 1], [0, 1]]`, with eigenvalues `0` (the
  line of `e₁`) and `1`, `λ = 0`, `c = 1` and `x = (1, t)`, `‖x‖² rayleigh T x = t + t²`, which is
  linear in the angle: for `t = 1/2` it is `3/4`, above `c ‖x − P x‖² = 1/4`.
- For `x = 0` both sides are `0`.
- *The order of the inner product.* For `T = i` on `ℂ` and `x = 1`, `rayleigh T x = ⟪1, i⟫ = i`;
  the variant `⟪T x, x⟫ / ‖x‖²` gives `−i`, and 3.1 with `λ = i` and `c = 0` would then fail.

*Needs:* Mathlib `inner`, `OrthonormalBasis.sum_repr`, `OrthonormalBasis.repr`,
`Submodule.starProjection`, `ContinuousLinearMap.rayleighQuotient` (for the comparison).

### 3.2 The Kato–Temple bound

Prove `kato_temple`: let `T : E →L[𝕜] E` be symmetric, `x ≠ 0`, `R = T.rayleighQuotient x` and
`ε² = ‖T x − R x‖² / ‖x‖²`. Let `a < R < b` and let `λ` be an eigenvalue of `T` in `(a, b)` such
that every real eigenvalue of `T` in `(a, b)` equals `λ`. Then `−ε²/(R − a) ≤ R − λ` and
`R − λ ≤ ε²/(b − R)`. (Saad, Lemma 3.2 and Theorem 3.8, p. 62, for a unit vector and a Hermitian
matrix; Kato and Temple.)

Route: Temple's lemma first: if `α < β` and `(α, β)` contains no eigenvalue, then
`(β − R)(R − α) ≤ ε²`, because `⟪(T − α) x, (T − β) x⟫ = ‖x‖² (ε² + (R − α)(R − β))` (the residual
is orthogonal to `x`) and the left side is `Σ |cᵢ|² (λᵢ − α)(λᵢ − β) ≥ 0` in an orthonormal
eigenbasis. If `λ ≤ R` apply it to `(λ, b)` and divide by `b − R > 0`; if `λ > R`, apply it to
`(a, λ)` and divide by `R − a > 0`. In each case the other inequality holds because its smaller
side is at most `0` and its larger side at least `0`.

**Checks.**
- `T = diag(0, 1)`, `x = (1, 1/2)`: `R = 1/5`, `ε² = 4/25`. With `(a, b) = (−1, 1)`, which
  contains only the eigenvalue `0`, the upper bound is `(4/25)/(4/5) = 1/5 = R − 0`, attained;
  the residual bound `|R − λ| ≤ ε = 2/5` is twice as large.
- *Uniqueness is needed.* With `(a, b) = (−1, 2)`, containing both eigenvalues, `λ = 0` would
  need `1/5 ≤ (4/25)/(9/5) = 4/45`, and `λ = 1` would need `−4/5 ≥ −(4/25)/(6/5) = −2/15`; both
  fail.
- *`x ≠ 0` is needed.* For `x = 0`, `R = 0` and `ε = 0`, and with `T = diag(1)`,
  `(a, b) = (−1, 2)` and `λ = 1` the conclusion would say `0 ≤ −1`.

*Needs:* Mathlib `ContinuousLinearMap.rayleighQuotient`, `LinearMap.IsSymmetric`,
`LinearMap.IsSymmetric.eigenvectorBasis`, `LinearMap.IsSymmetric.apply_eigenvectorBasis`,
`LinearMap.IsSymmetric.hasEigenvalue_eigenvalues`, `Module.End.HasEigenvalue`.

### 3.3 Rayleigh quotient iteration

Define `rqiSeq T x₀`, the sequence with `x 0 = x₀` and `x (k + 1) = (T − rayleigh T (x k))⁻¹ (x k)`
(with `Ring.inverse`), and `tanToEigenspace T λ x = ‖x − P_λ x‖ / ‖P_λ x‖`, the tangent of the angle
between `x` and the eigenspace of `λ` (`0` when `P_λ x = 0`).

Prove `tanToEigenspace_rqiSeq_succ_le_and_tendsto`: let `T` have an orthonormal eigenbasis
`(b, d)`, let `λ ∈ 𝕜`, `c` real with `‖d i − λ‖ ≤ c` for all `i`, `δ` real with
`δ ≤ ‖d i − λ‖` whenever `d i ≠ λ`, and `2 c ‖x₀ − P_λ x₀‖² < δ ‖P_λ x₀‖²`. Then the tangents
`t_k` of `x_k = rqiSeq T x₀ k` satisfy `t_{k+1} ≤ (2 c/δ) t_k³` for every `k`, and `t_k → 0`.
(Arbenz, Theorem 7.14, p. 141, proves `lim φ_{k+1}/φ_k³ ≤ 1` for Hermitian matrices under the
assumption that the iterates converge to an eigenvector; Saad, p. 90, recalls the cubic rate for
Hermitian matrices after Parlett. The explicit local bound, for operators with an orthonormal
eigenbasis, is proved here.)

Route: induction on `k` with the invariant `2 c t_k² < δ`, which forces `δ > 0` and `P_λ x_k ≠ 0`
unless `x_k = 0`. With `σ = rayleigh T x_k`, 3.1 gives `‖λ − σ‖ ≤ c sin² θ_k ≤ c t_k² < δ/2`, and
2.3 gives `t_{k+1} (δ − ‖λ − σ‖) ≤ ‖λ − σ‖ t_k`, so `t_{k+1} ≤ (2c/δ) t_k³ ≤ t_k`. If `σ = λ`
then `x_{k+1} = 0` and `t_{k+1} = 0`; otherwise `P_λ x_{k+1} = (λ − σ)⁻¹ P_λ x_k ≠ 0`. With
`q = (2c/δ) t₀² < 1`, `t_k ≤ qᵏ t₀ → 0`.

**Checks.**
- For `T = diag(0, 1)`, `λ = 0`, `c = δ = 1` and `x₀ = (1, 1/2)`, the tangents are exactly
  `1/2, 1/8, 1/512, 1/134217728`: for a two-dimensional symmetric operator one step maps the
  tangent `t` to `t³`, within the bound `2 t³`.
- For `T = diag(0, 1, 3)`, `λ = 0`, `c = 3`, `δ = 1` and `x₀ = (1, 1/5, 1/5)`: `t₀ = 0.2828`,
  `2 c t₀² = 0.48 < 1`, and `t₁ ≈ 0.0363`, `t₂ ≈ 5.36 · 10⁻⁵`, below the bounds `6 t_k³`, which are
  `0.1358` and `2.87 · 10⁻⁴`.
- *A starting vector in the eigenspace.* If `x₀ = P_λ x₀ ≠ 0`, then `rayleigh T x₀ = λ`, the
  inverse is the junk value `0`, `x₁ = 0` and every later tangent is `0`.

*Needs:* 2.3, 3.1; Mathlib `Ring.inverse`, `Submodule.starProjection`,
`tendsto_pow_atTop_nhds_zero_of_lt_one`.

### Examples

- *Power iteration and its Rayleigh quotients.* Combining 2.1 with 3.1 at `x = Tᵏ v`: if every
  eigenvalue other than `λ` has modulus at most `ρ |λ|` and lies within `c` of `λ`, then
  `‖P_λ v‖² |rayleigh T (Tᵏ v) − λ| ≤ c ρ^(2k) ‖v − P_λ v‖²`, the squared rate for eigenvalue
  estimates. For `T = diag(1, 1/2)` and `v = (1, 1)`, `rayleigh T (T v) = 0.9`, at distance `0.1`
  from `1`, within `(1/2)(1/4)·1 = 0.125`.

### Dependencies

3.1 and 3.2 use only Mathlib. 3.3 uses 2.3 and 3.1.

## Scope and ownership

This roadmap owns the targets stated above: the dominant and subdominant subspaces of an operator
at a level; power iteration for an operator with a semisimple dominant eigenvalue and subspace
iteration for an operator whose spectrum is split by a circle, with rates `O(rᵏ)`; for operators
with an orthonormal eigenbasis, the exact tangent bounds for power and subspace iteration and the
one-step bound for shifted inverse iteration; the `𝕜`-valued Rayleigh quotient, its quadratic
accuracy, the Kato–Temple bound, and the local cubic convergence of Rayleigh quotient iteration.

Already in the libraries and therefore not targets:

- Generalized eigenspaces, their independence and, over `ℂ` in finite dimension, their spanning
  the space; Gelfand's formula; the spectral theorem for symmetric operators; orthogonal
  projections; the real Rayleigh quotient with its extremal properties
  (`ContinuousLinearMap.rayleighQuotient`, `IsSelfAdjoint.hasEigenvector_of_isMaxOn`) (Mathlib).
- The spectral theorem for normal operators, the gap and the directed gap with their identities,
  and angular operators and graph subspaces with the exact gap of a graph subspace (Tau Ceti). The
  gaps are PrincipalAngles PA-C08 and PA-C09 (Part C, projection blocks and gaps), and angular
  operators are SpectralSubspacePerturbation's graph-subspace objects (Part C, SSP-C11 to
  SSP-C14; 3.11 to 3.14 in the sectioned numbering of its template update); both are used as
  defined there. When the directed gap from `W` to `U` is less than `1`, the tangent that 2.2
  bounds is the largest of Tau Ceti's principal tangents from `W` to `U`
  (`Submodule.principalTangents`).
- Courant–Fischer and the Rayleigh–Ritz compression in Tau Ceti
  (`LinearMap.IsSymmetric.eigenvalues_eq_iSup_iInf_re_inner`, `ContinuousLinearMap.compression`);
  nothing here uses them.

Left to other roadmaps:

- SpectralSubspacePerturbation owns the Davis–Kahan `sin Θ` and `tan Θ` theorems, among them the
  residual bound for the angle between an approximate and an exact eigenvector; 2.1–2.3 and 3.3
  bound angles along iterations and restate none of them.
- ManifoldOptimization owns the Rayleigh quotient on the unit sphere as an optimization problem:
  its Riemannian gradient and Hessian, the fact that its critical points are eigenvectors and its
  second-order critical points are global minimizers, and Brockett's cost and the principal
  subspace on the Grassmannian, together with Riemannian Newton's method and its local quadratic
  convergence at a nondegenerate critical point, which its worked example applies to the
  eigenvectors of a simple largest eigenvalue. 3.1 is an inequality for the quotient itself. For a
  symmetric `T` on a real space, a unit vector `x` whose Rayleigh quotient is not an eigenvalue,
  the normalized Rayleigh quotient iterate of `x` agrees up to sign with the iterate of
  Riemannian Newton's method for the Rayleigh quotient on the unit sphere with the retraction
  `v ↦ (x + v)/‖x + v‖`, whenever that Newton step is defined. 3.3 is stated and proved as
  shifted inverse iteration, at every eigenvalue, possibly multiple, of an operator with an
  orthonormal eigenbasis, with a cubic bound, and uses nothing from that roadmap.
- VariationalMethods Layer 4 owns successive Rayleigh minimization and min–max on Hilbert spaces,
  and its Layer 6 Ritz–Galerkin approximation.
- IterativeMethodsForLinearSystems owns, in 1.2 (powers and the spectral radius), the equivalence
  between `Gᵏ → 0` and spectral radius less than one for matrices, and, in 4.1, Krylov spaces;
  1.2 and 1.3 here use Gelfand's formula from Mathlib directly and do not depend on that roadmap.
  Krylov-space eigenvalue methods (Lanczos, Arnoldi) are not treated here.
- MarkovChainsAndRenewal Layer 3, total variation and convergence (item 5; 3.5 in the sectioned
  numbering of its template update), owns the convergence of the laws of an irreducible aperiodic
  chain, and MarkovChainMixing 2.3 the spectral bounds on mixing; Tau Ceti's Perron–Frobenius
  files own the dominant eigenvalue of a nonnegative matrix. 1.2 is a statement about an
  arbitrary complex operator that is assumed to have a semisimple dominant eigenvalue; nothing
  here is about nonnegative or stochastic matrices.

Not treated here: residual bounds that are not quadratic, such as `|λ − R| ≤ ‖r‖` for a Hermitian
matrix and the Bauer–Fike theorem, and the perturbation of a simple eigenvalue.

Outside the scope: the QR algorithm, deflation, Chebyshev acceleration and projection methods with
Rayleigh–Ritz extraction; global convergence of Rayleigh quotient iteration; non-normal Rayleigh
quotient iteration and two-sided variants; convergence of individual columns of subspace iteration
to Schur vectors; floating-point analysis, stopping criteria and costs; infinite-dimensional
operators.

## Exact supplier contracts

### From Mathlib

- `Mathlib/LinearAlgebra/Eigenspace/Basic.lean`: `Module.End.eigenspace`,
  `Module.End.HasEigenvalue`, `Module.End.maxGenEigenspace` (the union over `k` of the kernels of
  `(f − μ)ᵏ`), `Module.End.mapsTo_maxGenEigenspace_of_comm` (invariance under a commuting map),
  `Module.End.independent_genEigenspace` (independence over a domain, torsion-free module),
  `Module.End.hasEigenvalue_iff_mem_spectrum` (in finite dimension, eigenvalues are the points of
  the spectrum).
- `Mathlib/LinearAlgebra/Eigenspace/Triangularizable.lean`:
  `Module.End.iSup_maxGenEigenspace_eq_top`
  (over an algebraically closed field in finite dimension, the generalized eigenspaces span).
- `Mathlib/Analysis/Normed/Algebra/GelfandFormula.lean`: `spectrum.gelfand_formula` (in a complex
  Banach algebra, `‖aⁿ‖^(1/n) → spectralRadius ℂ a`).
- `Mathlib/Analysis/InnerProductSpace/Projection/Basic.lean`: `Submodule.starProjection` (the
  orthogonal projection as an operator on `E`, for a subspace with `HasOrthogonalProjection`,
  automatic in finite dimension), `Submodule.starProjection_apply_eq_zero_iff`.
- `Mathlib/Analysis/InnerProductSpace/PiL2.lean`: `OrthonormalBasis`, `OrthonormalBasis.repr`,
  `OrthonormalBasis.sum_repr`.
- `Mathlib/Analysis/InnerProductSpace/Spectrum.lean`: `LinearMap.IsSymmetric.eigenvectorBasis`,
  `LinearMap.IsSymmetric.apply_eigenvectorBasis`, `LinearMap.IsSymmetric.hasEigenvalue_eigenvalues`
  (the spectral theorem for a symmetric operator in finite dimension).
- `Mathlib/Analysis/InnerProductSpace/Rayleigh.lean`: `ContinuousLinearMap.rayleighQuotient`
  (`re ⟪T x, x⟫ / ‖x‖²`).
- `Mathlib/Algebra/GroupWithZero/Units/Basic.lean`: `Ring.inverse`, `Ring.inverse_non_unit` (`0`
  at a non-unit).
- `Mathlib/Analysis/SpecificLimits/Basic.lean`: `tendsto_pow_atTop_nhds_zero_of_lt_one`.

### From Tau Ceti

- `TauCeti/Analysis/InnerProductSpace/Projection/Gap.lean`: `Submodule.projectionGap`
  (`‖P_U − P_V‖`), `Submodule.directedProjectionGap` (`‖P_{V⊥} P_U‖`),
  `Submodule.projectionGap_le_one`; imported by `Suggested.lean`.
- `TauCeti/Analysis/InnerProductSpace/Projection/GraphSubspace.lean`:
  `Submodule.IsAngularOperator` (`X P_U = X` and `P_U X = 0`), `Submodule.graphSubspace`
  (`{u + X u : u ∈ U}`), `Submodule.IsAngularOperator.directedProjectionGap_graphSubspace_left`
  (the directed gap from the graph subspace to `U` is `‖X‖ / √(1 + ‖X‖²)`), used in 2.2.
- `TauCeti/Analysis/InnerProductSpace/NormalOperator.lean`:
  `LinearMap.exists_orthonormalBasis_apply_eq_smul_of_isStarNormal` (a normal operator on a
  finite-dimensional complex inner product space has an orthonormal eigenbasis), which shows that
  the hypothesis of Layers 2 and 3 covers normal operators.

## References

- Yousef Saad, *Numerical Methods for Large Eigenvalue Problems*, 2nd edition (Classics edition),
  SIAM (2011), the version distributed on the author's page at the University of Minnesota
  (`eig_book_2ndEd.pdf`): Lemma 3.2 and Theorem 3.8 (p. 62), Theorem 4.1 and (4.2) (pp. 86–87),
  (4.5) (p. 89), the remarks after Algorithm 4.3 (p. 90), Theorem 5.1 (pp. 116–117). Page numbers
  are the printed ones.
- Peter Arbenz, *Lecture Notes on Solving Large Scale Eigenvalue Problems*, ETH Zürich, spring
  semester 2016, from the author's page at ETH: (7.21)–(7.23) and Theorem 7.6 (pp. 132–133), Theorem
  7.14 and its proof (pp. 141–142), Theorems 8.5 and 8.6 (p. 149). Page numbers are the printed
  ones.
- Attributions made in prose without a locator: Tosio Kato and George Temple (the Kato–Temple
  bound); Beresford Parlett (cubic convergence of Rayleigh quotient iteration for
  Hermitian matrices); Friedrich L. Bauer (subspace iteration, as *Treppeniteration*).

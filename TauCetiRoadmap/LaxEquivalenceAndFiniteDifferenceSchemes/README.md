# Roadmap: Lax equivalence and finite difference schemes

**Summary.** A finite difference scheme for a linear evolution equation advances an approximate
solution by one bounded operator per time step. This roadmap states the classical theory that
decides when such a scheme converges, in two layers.

The first layer is abstract. The exact solution is a strongly continuous semigroup `S(t)` of
bounded operators on a real Banach space, and the scheme is a family `C(τ)` of bounded operators,
one for each step `τ > 0`. The scheme is stable on `[0, T]` if the powers `C(τ)ⁿ` with `nτ ≤ T`
and `τ` small are bounded by one constant, consistent if on a dense set of initial values the
one-step error `C(τ)S(t)x − S(τ)S(t)x` is small compared with `τ`, uniformly for `t ≤ T`, and
convergent if `C(τ_j)^(n_j) x → S(t)x` for every initial value whenever `τ_j → 0`, `n_j τ_j ≤ T`
and `n_j τ_j → t`. The headline results are:

- the Lax equivalence theorem: on a Banach space, a consistent scheme is convergent if and only
  if it is stable; completeness is needed for the direction from convergence to stability;
- the global error bound: if the powers are bounded by `K` and the one-step error along the orbit
  of `x` is at most `c τ^(p+1)`, then the error after `n` steps with `nτ ≤ T` is at most
  `K c T τ^p`;
- stability survives perturbations of size `O(τ)`, with an explicit constant.

The second layer is von Neumann's Fourier analysis of constant-coefficient schemes on the
periodic grids `ℤ/N`, where the discrete Fourier transform diagonalises every translation-invariant
scheme. For an implicit two-level scheme whose implicit part has a nowhere vanishing symbol, the
`ℓ²` norm of the `n`-th power on `ℤ/N` is the `n`-th power of the largest modulus of the
amplification factor at the frequencies `2πk/N`; the powers are bounded uniformly in `N` and `n`
if and only if the amplification factor has modulus at most one at every frequency. The worked
schemes are: the weighted scheme for the heat equation with weight `w` and mesh ratio `μ ≥ 0`
(explicit for `w = 0`, Crank–Nicolson for `w = 1/2`, implicit Euler for `w = 1`) is stable
exactly when `2(1 − 2w)μ ≤ 1`; for the transport equation `u_t + a u_x = 0` with Courant number
`ν`, the upwind scheme is stable exactly when `0 ≤ ν ≤ 1`, the Lax–Wendroff scheme exactly when
`|ν| ≤ 1`, and the centred explicit scheme only when `ν = 0`.

The roadmap builds on the theory of strongly continuous semigroups of the completed roadmap
OneParameterSemigroups, implemented in Tau Ceti, and on the discrete Fourier transform and
circulant matrices of SamplingAndDiscreteFourierAnalysis. Layer 1 needs no Fourier analysis and
Layer 2 no semigroups; the two layers can be built in either order.

## Conventions

- **Spaces and semigroups.** `X` is a real normed space; theorems that need completeness say so.
  The exact solution operator is a Tau Ceti `TauCeti.Semigroups.StronglyContinuousSemigroup X`,
  written `S`, indexed by `t : ℝ≥0`: `S 0 = 1`, `S (s + t) = S s ∘ S t`, and `t ↦ S t x` is
  continuous at `0` for every `x`. A complex Banach space is used through its real structure.
- **Schemes.** A scheme is a family `C : ℝ≥0 → X →L[ℝ] X`; only its values at `τ > 0` enter.
  Steps, times and horizons `τ`, `t`, `T` are in `ℝ≥0`, and `n τ` is `(n : ℝ≥0) * τ`. `‖·‖` on
  operators is the operator norm and `C τ ^ n` the `n`-th power in the ring `X →L[ℝ] X`.
- **Grid functions.** For `N ≥ 1` a grid function is `u : ZMod N → ℂ`, with the Euclidean norm
  `(∑_j |u j|²)^(1/2)` of `EuclideanSpace ℂ (ZMod N)`; a matrix `M` acts through Mathlib's
  `Matrix.toEuclideanCLM`, and `‖Matrix.toEuclideanCLM M‖` is its `ℓ²` operator norm. The mesh
  weight `h = 1/N` in the norm would multiply every norm of a grid function by `h^(1/2)` and leaves
  operator norms unchanged.
- **Stencils and symbols.** A stencil is a finitely supported `a : ℤ →₀ ℂ`. Its matrix on
  `ZMod N` sends `u` to `j ↦ ∑_m a_m u(j + m)`; it is the circulant matrix whose first column
  `v` has `v(r) = ∑ {a_m : −m ≡ r mod N}`. Its symbol is `ρ_a(θ) = ∑_m a_m e^(imθ)`, a
  `2π`-periodic trigonometric polynomial; the character `j ↦ e^(2πijk/N)` is an eigenvector of
  the matrix with eigenvalue `ρ_a(2πk/N)`. The frequency of `k : ZMod N` is
  `θ_k = 2π k.val / N`.
- **Two-level schemes.** A two-level scheme `B u^(n+1) = A u^n` is given by two stencils `b`, `a`;
  its step matrix is `B⁻¹ A`, with Mathlib's matrix inverse, which is `0` for a singular matrix.
  Statements 2.2 and 2.3 assume that `ρ_b` does not vanish where it is evaluated, and then `B` is
  invertible; in 2.4 the value `0` on grids where `B` is singular is harmless, as its route shows.
  The amplification factor is `g = ρ_a / ρ_b`. An explicit scheme has `b = δ₀`,
  whose matrix is the identity, and its step matrix is written `A`.
- **Stability on periodic grids.** A two-level scheme with fixed coefficients is called stable on
  periodic grids if there is `K` with `‖(B⁻¹ A)ⁿ‖ ≤ K` for all `N ≥ 1` and all `n`. The
  coefficients depend on the mesh only through a fixed mesh ratio, as in the worked schemes. This
  is power-boundedness at fixed coefficients, uniform in the grid. It is not the notion of
  Layer 1 (powers bounded only for `n τ ≤ T`), nor Trefethen's condition `|g| ≤ 1 + O(k)` of his
  Theorem 4.8, which allows lower-order terms: the stencil `(1 + τ) δ₀` has powers `(1 + τ)ⁿ`,
  bounded by `e^T` for `n τ ≤ T` but unbounded over all `n`. Neither layer uses the other.
- **Model schemes.** `Δ` is the stencil with values `1, −2, 1` at `−1, 0, 1`, so
  `ρ_Δ(θ) = −4 sin²(θ/2)`. For the heat equation `u_t = u_xx` the mesh ratio is `μ = τ/h²`; for
  `u_t + a u_x = 0` the Courant number is `ν = aτ/h`. Trefethen writes the transport equation as
  `u_t = u_x`, the mirror image under `x ↦ −x`, so his upwind scheme uses `u_(j+1)` where the
  scheme here uses `u_(j−1)`.

## Layer 1: the Lax–Richtmyer theorem

### 1.1 Stability, consistency and convergence

Define, for a scheme `C`, a semigroup `S` and a horizon `T`:

- `IsStableScheme C T`: there are `τ₀ > 0` and `K` with `‖C τ ^ n‖ ≤ K` whenever `0 < τ ≤ τ₀`
  and `n τ ≤ T`.
- `IsConsistentScheme S C T`: there is a dense set `D ⊆ X` such that for every `x ∈ D` and
  `ε > 0` there is `δ > 0` with `‖C τ (S t x) − S τ (S t x)‖ ≤ ε τ` whenever `0 < τ < δ` and
  `t ≤ T`.
- `IsConvergentScheme S C T`: for every `x`, every `τ : ℕ → ℝ≥0` with `τ j > 0` and `τ j → 0`,
  every `n : ℕ → ℕ` with `n j τ j ≤ T` for all `j`, and every `t` with `n j τ j → t`, the vectors
  `C (τ j) ^ (n j) x` tend to `S t x`.

Stability and convergence are those of Trefethen, (4.2.8) and (4.2.7), p. 156, which go back to
Lax and Richtmyer 1956; Trefethen asks for the bound at all steps with `n k ≤ T` and for
`n k = t` exactly, while here stability is asked for `τ ≤ τ₀` and convergence for `n j τ j → t`.
Consistency is usually stated with the generator `A` of `S`: `(C τ − 1) u / τ → A u`
along solutions. `IsConsistentScheme` states it with the semigroup, so no generator enters; for a
dense set `D` inside the domain of `A` the two forms agree on a Banach space, since
`(S τ − 1) S t x / τ → S t A x` uniformly for `t ≤ T`. Convergence is asked only along step
sequences with `n j τ j ≤ T`, the range on which stability gives information.

**Checks.**
- The bound in stability is restricted to `n τ ≤ T`. On `X = ℝ` with `S t = e^t` and
  `C τ = 1 + τ`, the powers satisfy `(1 + τ)ⁿ ≤ e^(nτ) ≤ e^T` on that range, the scheme is
  consistent (`|(1 + τ − e^τ) e^t x| ≤ τ² e^(τ + T) |x|`) and convergent, but `(1 + τ)ⁿ` is
  unbounded over all `n`: with the bound required for all `n` the equivalence 1.5 would fail.
- `T = 0`: `n τ ≤ 0` forces `n = 0`, every scheme is stable with `K = 1` and convergent, since
  `C τ ^ 0 x = x = S 0 x`.
- On a Banach space, the exact scheme `C τ = S τ` is consistent with `D = X` and stable with `K`
  the bound of `‖S t‖` on `[0, T]`.

*Needs:* Tau Ceti `TauCeti.Semigroups.StronglyContinuousSemigroup`. (Definitions.)

### 1.2 The global error bound

Prove `norm_pow_apply_sub_le`: let `T, τ₀ ≥ 0`, `K, c, p ∈ ℝ`, assume `‖C τ ^ n‖ ≤ K` whenever
`0 < τ ≤ τ₀` and `n τ ≤ T`, and let `x` satisfy
`‖C τ (S t x) − S τ (S t x)‖ ≤ c τ^(p+1)` whenever `0 < τ ≤ τ₀` and `t ≤ T`. Then for
`0 < τ ≤ τ₀` and `n τ ≤ T`,

    ‖C τ ^ n x − S (n τ) x‖ ≤ K c T τ^p.

The exponent `p` is real (powers of `τ > 0`). This is the quantitative form of Trefethen,
Theorem 4.2, p. 157 (order of accuracy `p` gives global error `O(k^p)`, stated there without
proof); the constant is derived here.

Route (proved here). Write `E = S τ`, so `S (k τ) = E^k` (Tau Ceti
`StronglyContinuousSemigroup.map_natCast_mul`). The telescoping identity

    C^n x − E^n x = ∑_(k < n) C^(n−1−k) (C − E) E^k x

holds in any ring of operators. For `k < n` both `k τ` and `(n − 1 − k) τ` are at most `T`, so
the `k`-th term has norm at most `K · c τ^(p+1)`, and the sum is at most `n K c τ^(p+1)`. The
hypothesis at `n = 0` gives `K ≥ ‖1‖ ≥ 0`, and at `t = 0` gives `c ≥ 0`; with `n τ ≤ T` the bound
is at most `K c T τ^p`. At `n = 0` the left side is `0`.

**Checks.**
- `X = ℝ`, `S t = e^t`, `C τ = 1 + τ` (explicit Euler), `T = 1`, `τ₀ = 1`, `K = e`: the local
  error is `e^t (e^τ − 1 − τ) ≤ e · (e − 2) τ²` for `τ ≤ 1`, `t ≤ 1`, so `p = 1`, `c = e(e − 2)`.
  At `τ = 1/2`, `n = 2` the error is `e − 9/4 < 1/2`, and `K c T τ = e²(e − 2)/2 > 2`.
- The power bound is needed: on `ℝ²` with `S = 1`, let `C τ e_1 = e_1 + τ² e_2` and
  `C τ e_2 = 2 e_2`. At `x = e_1` the local error is `τ²` (`p = 1`, `c = 1`), but
  `C τ ^ n e_1 = e_1 + τ² (2ⁿ − 1) e_2`, whose error at `n τ = 1` exceeds any multiple of `τ` as
  `τ → 0`.

*Needs:* 1.1; Tau Ceti `StronglyContinuousSemigroup.map_natCast_mul`; Mathlib `norm_sum_le`,
`ContinuousLinearMap.opNorm_comp_le`. (Proved here.)

### 1.3 Perturbation of a stable family

Prove `norm_add_pow_le`: assume `‖C τ ^ n‖ ≤ K` whenever `0 < τ ≤ τ₀` and `n τ ≤ T`, and
`‖B τ‖ ≤ L τ` whenever `0 < τ ≤ τ₀`. Then `‖(C τ + B τ)ⁿ‖ ≤ K e^(K L T)` whenever `0 < τ ≤ τ₀` and
`n τ ≤ T`. In particular `C + B` is stable whenever `C` is. (Trefethen, Theorem 4.3, p. 158, in
the form `‖T_k‖ = O(k)`, stated there without proof.)

Route (proved here). Expand `(C + B)ⁿ` as the sum over the `2ⁿ` words of length `n` in `C` and
`B`. A word with `j` letters `B` is `C^(m_0) B C^(m_1) ⋯ B C^(m_j)` with
`m_0 + ⋯ + m_j = n − j`; each `m_i τ ≤ n τ ≤ T`, so each block of `C` has norm at most `K`, and
the word has norm at most `K^(j+1) (L τ)^j`. There are `binom(n, j)` such words, so
`‖(C + B)ⁿ‖ ≤ K ∑_j binom(n, j) (K L τ)^j = K (1 + K L τ)ⁿ ≤ K e^(K L n τ) ≤ K e^(K L T)`. Here
`K ≥ 0` (hypothesis at `n = 0`) and `L ≥ 0` (since `0 ≤ ‖B τ‖ ≤ L τ` with `τ > 0`), and
`1 + y ≤ e^y` (Mathlib `Real.add_one_le_exp`).

**Checks.**
- `X = ℝ`, `C = 1`, `B τ = L τ`: `(1 + L τ)ⁿ ≤ e^(L T)`, and the bound is attained in the limit
  `n → ∞`, `n τ = T`.
- A perturbation of size `τ^(1/2)` can destroy stability: `C = 1`, `B τ = τ^(1/2)` gives
  `(1 + τ^(1/2))ⁿ` with `n = ⌊T/τ⌋`, unbounded as `τ → 0`.

*Needs:* Mathlib `Real.add_one_le_exp`, `ContinuousLinearMap.opNorm_comp_le`,
`Finset.sum_le_sum`, `add_pow`. (Proved here.)

### 1.4 Convergence implies stability

Prove `IsConvergentScheme.isStableScheme`: on a Banach space `X`, a convergent scheme is stable
(one direction of Trefethen, Theorem 4.1, p. 157, and Chern, Theorem 4.1, p. 63; due to Lax and
Richtmyer 1956).

Route. Suppose `C` is not stable. Then for each `j` there are `0 < τ_j ≤ 1/(j + 1)` and `n_j` with
`n_j τ_j ≤ T` and `‖C(τ_j)^(n_j)‖ > j`. The numbers `n_j τ_j` lie in `[0, T]`, so a subsequence
converges to some `t ≤ T` (Mathlib `IsCompact.tendsto_subseq`). Along it the scheme converges at
every `x`, so `C(τ_j)^(n_j) x` is bounded for each `x`; Mathlib's `banach_steinhaus` makes the
operator norms bounded along the subsequence, contradicting `‖C(τ_j)^(n_j)‖ > j`.

**Checks.**
- Completeness is needed. Let `X` be the finitely supported real sequences with the supremum
  norm, `S = 1`, and `C τ x = x + τ⁻¹ x_(k(τ)) e_0` with `k(τ) = ⌈1/τ⌉ ≥ 1`. Then
  `(C τ − 1)² = 0`, so `C τ ^ n = 1 + n(C τ − 1)` and `‖C τ‖ ≥ 1/τ` (apply it to `e_(k(τ))`):
  `C` is not stable for any `T > 0`. For each `x`, `x_(k(τ)) = 0` once `1/τ` exceeds the support
  of `x`, so `C τ ^ n x = x = S t x` for small `τ`: `C` is convergent, and consistent with `D = X`.

*Needs:* 1.1; Mathlib `banach_steinhaus`, `IsCompact.tendsto_subseq`, `isCompact_Icc`.

### 1.5 The Lax equivalence theorem

Prove `isConvergentScheme_iff_isStableScheme`: on a Banach space `X`, if `C` is consistent with
`S` on `[0, T]`, then `C` is convergent if and only if it is stable (Trefethen, Theorem 4.1,
p. 157, stated there without proof; Chern, Theorem 4.1, p. 63; due to Lax and Richtmyer 1956).

Route. Convergence gives stability by 1.4. Conversely let `C` be stable with `(τ₀, K)`, and
let `τ_j`, `n_j`, `t` be as in the definition of convergence.
- For `x ∈ D` and `ε > 0`, consistency gives `δ`; apply 1.2 with `p = 0`, `c = ε` and the step
  bound `min(τ₀, δ/2)`: `‖C(τ_j)^(n_j) x − S(n_j τ_j) x‖ ≤ K ε T` once `τ_j ≤ min(τ₀, δ/2)`.
- `S(n_j τ_j) x → S t x` by continuity of the orbit (Tau Ceti
  `StronglyContinuousSemigroup.tendsto_realOperator_apply` with a constant vector, and
  `realOperator_def` to return to `ℝ≥0`-time). Hence `C(τ_j)^(n_j) x → S t x` for `x ∈ D`.
- For general `x`, Tau Ceti's `existsGrowthBound` bounds `‖S s‖` by some `M` on `[0, T]`. With
  `y ∈ D` close to `x`, split `C^n x − S t x = C^n (x − y) + (C^n y − S t y) + S t (y − x)`;
  the outer terms are at most `(K + M) ‖x − y‖`, and the middle one tends to `0`.

**Checks.**
- Consistency is needed for "stable implies convergent": on `X = ℝ` with `S t = e^t`, the scheme
  `C τ = 1` is stable but `1ⁿ x = x ≠ e^t x` for `t > 0`, `x ≠ 0`; its one-step error
  `|1 − e^τ| |e^t x| ≥ τ |x|` is not `o(τ)` for any `x ≠ 0`.
- The completeness counterexample of 1.4 is consistent, so 1.5 also needs completeness.

*Needs:* 1.1, 1.2, 1.4; Tau Ceti `StronglyContinuousSemigroup.existsGrowthBound`,
`HasGrowthBound.bound`, `StronglyContinuousSemigroup.tendsto_realOperator_apply`,
`StronglyContinuousSemigroup.realOperator_def`.

### Examples

- Explicit Euler for a bounded generator: on a Banach space `X`, for `A ∈ X →L[ℝ] X` and the
  semigroup `S t = e^(tA)` (Tau Ceti `StronglyContinuousSemigroup.ofBounded`), the scheme
  `C τ = 1 + τA` is stable by 1.3 with `C = 1`, `B τ = τA`, `K = 1`, `L = ‖A‖`, and consistent
  of order `p = 1` since `‖(1 + τA − e^(τA)) e^(tA) x‖ ≤ (τ²‖A‖²/2) e^(‖A‖(τ + T)) ‖x‖`; 1.2
  gives the global error `O(τ)` and 1.5 convergence.
- The abstract setting involves no space variable: Trefethen, §4.2, p. 157, mentions the Trotter
  product formula as an application of this kind.

### Dependencies

Tau Ceti's strongly continuous semigroups and growth bounds; Mathlib's Banach–Steinhaus theorem.

## Layer 2: von Neumann analysis on periodic grids

### 2.1 Stencils and symbols

Define `stencilSymbol a θ = ∑_m a_m e^(imθ)` and `stencilMatrix a N`, the circulant matrix
`Matrix.circulant v` with `v(r) = ∑ {a_m : (−m : ZMod N) = r}`, as in the Conventions.

**Checks.**
- Orientation: for `a = 2δ_(−1) + 3δ_0 + 7δ_2`, `stencilMatrix a N *ᵥ u` is
  `j ↦ 2u(j − 1) + 3u(j) + 7u(j + 2)` for `N = 1, …, 5`. With the first column `v(r) = a_r` in
  place of `a_(−r)` the matrix would act by `u(j − m)`, replacing `θ` by `−θ` in the symbol.
- `N = 1`: every stencil matrix is the `1 × 1` matrix `(ρ_a(0))`. `N = 2`: `δ_1` and `δ_(−1)`
  have the same matrix, the swap, so the centred transport stencil with `ν = 1` is the identity
  on `ZMod 2`.
- `stencilMatrix δ₀ N = 1` (Mathlib `Matrix.circulant_single_one`), and `ρ_Δ(θ) = 2 cos θ − 2`.

*Needs:* Mathlib `Matrix.circulant`, `Finsupp.sum`. (Definitions.)

### 2.2 The norm of the powers on a periodic grid

Prove `norm_toEuclideanCLM_pow`: let `N ≥ 1` and let `ρ_b(θ_k) ≠ 0` for every `k : ZMod N`. Then
for every `n`,

    ‖(B⁻¹ A)ⁿ‖ = (max_k |ρ_a(θ_k) / ρ_b(θ_k)|)ⁿ,

the maximum over `k : ZMod N` (written in Lean as the sup norm of `k ↦ g(θ_k)`). This is the
periodic-grid form of Trefethen, Theorems 3.3 and 3.4, pp. 138 and 141, on `ℓ²(hℤ)`.

Route (proved here). Let `F` be the matrix of the discrete Fourier transform and `U = N^(−1/2) F`.
Parseval's identity (SamplingAndDiscreteFourierAnalysis, Layer 1, §1.1, `dft_inner`, applied to
the standard basis vectors) gives `Fᴴ F = N · 1`, so `U` is unitary. The diagonalisation of
circulant matrices (same roadmap, Layer 2, §2.1, `dftMatrix_mul_circulant`) gives
`F · circulant v = diagonal(v̂) · F`, and for the first column `v` of the stencil matrix,
`v̂(k) = ∑_m a_m e(mk/N) = ρ_a(θ_k)`, so `A = Uᴴ diagonal(ρ_a(θ_·)) U`. In the same way `B` is
unitarily similar to the diagonal of `ρ_b(θ_·)`, invertible by hypothesis, so
`(B⁻¹ A)ⁿ = Uᴴ diagonal(gⁿ) U`. Conjugation by a unitary preserves the operator norm (Mathlib
`CStarRing.norm_mul_coe_unitary`, `CStarRing.norm_coe_unitary_mul` in the C*-algebra of operators
on `EuclideanSpace ℂ (ZMod N)`), and a diagonal matrix has norm the largest modulus of its entries
(`Matrix.l2_opNorm_diagonal` with `Matrix.l2_opNorm_toEuclideanCLM`). At `n = 0` both sides are
`1`, since the space is not zero.

**Checks.**
- For `N = 1, 2, 3, 4` and `n = 0, 1, 2, 3`, the largest eigenvalue of `(Qⁿ)ᴴ Qⁿ` equals
  `max_k |g(θ_k)|^(2n)` for the upwind scheme with `ν = 1/3`, the Crank–Nicolson scheme with
  `μ = 1` and the explicit heat scheme with `μ = 1`; for the last, on `ZMod 2`, `Q` has rows
  `(−1, 2)` and `(2, −1)` and `‖Q‖ = 3 = |1 − 4μ|`.
- A single grid sees only its own frequencies: the explicit heat scheme (`w = 0`, `μ ≥ 0`) on
  `ZMod 3` has the eigenvalues `1` and `1 − 3μ`, so its powers on `ZMod 3` stay bounded exactly
  when `μ ≤ 2/3`, above the threshold `1/2` of 2.4.

*Needs:* 2.1; SamplingAndDiscreteFourierAnalysis `dft_inner` (1.1), `dftMatrix_mul_circulant`
(2.1); Mathlib `Matrix.l2_opNorm_diagonal`, `Matrix.l2_opNorm_toEuclideanCLM`,
`Matrix.toEuclideanCLM`, `CStarRing.norm_mul_coe_unitary`, `CStarRing.norm_coe_unitary_mul`,
`ZMod.dft_apply`. (Proved here.)

### 2.3 The von Neumann criterion

Prove `exists_forall_norm_pow_le_iff`: if `ρ_b(θ) ≠ 0` for every real `θ`, the two-level scheme
is stable on periodic grids if and only if `|ρ_a(θ)| ≤ |ρ_b(θ)|` for every `θ`, that is, the
amplification factor has modulus at most `1` everywhere. Then `K = 1` works. (Trefethen,
Theorem 4.8, p. 166, on `ℓ²(hℤ)` with `|g| ≤ 1 + O(k)`, a different notion of stability (see the
Conventions); Chern, Theorem 2.2, p. 29, the sufficient condition.)

Route (proved here). If `|g| ≤ 1` everywhere, 2.2 gives `‖(B⁻¹ A)ⁿ‖ ≤ 1` on every grid.
Conversely, if `|g(θ₀)| > 1`, the set where `|g| > 1` is open (`g` is continuous, `ρ_b` having no
zero) and contains a rational multiple `2πk/N` of `2π`; since `g` has period `2π`, `k` can be
taken in `[0, N)`, so `2πk/N` is the frequency `θ_k` of `k : ZMod N`. Then 2.2 gives
`‖(B⁻¹ A)ⁿ‖ ≥ |g(θ_k)|ⁿ → ∞`, so no `K` exists.

**Checks.**
- The hypothesis on `ρ_b` is needed: for `a = δ₀` and `b = δ₀ − δ₁`, `ρ_b(0) = 0`, so the matrix
  of `b` is singular on every `ZMod N` and Mathlib's inverse is `0`; the powers are `1` and `0`,
  bounded by `1`, while `|ρ_b(1/10)|² = 2 − 2 cos(1/10) < 1 = |ρ_a|²`.

*Needs:* 2.2; Mathlib `Rat.denseRange_cast`, `Continuous.isOpen_preimage`. (Proved here.)

### 2.4 The weighted scheme for the heat equation

Prove `weightedHeat_exists_forall_norm_pow_le_iff`: for real `w` and `μ ≥ 0`, the scheme
`(δ₀ − wμΔ) u^(n+1) = (δ₀ + (1 − w)μΔ) u^n` is stable on periodic grids if and only if
`2(1 − 2w)μ ≤ 1`. For `w = 0` this is the explicit condition `μ ≤ 1/2`, and for `w ≥ 1/2`
(Crank–Nicolson, implicit Euler) the scheme is stable for every `μ ≥ 0` (Trefethen, Examples 4.4.2
and 4.4.3, p. 167, and Table 4.4.2, p. 169; Chern, p. 30, for `w = 0`). The weighted family
and the threshold for general `w` are proved here.

Route (proved here). With `s = sin²(θ/2) ∈ [0, 1]`, `ρ_a = 1 − 4(1 − w)μs` and `ρ_b = 1 + 4wμs`.
- If `1 + 4wμ > 0`, then `ρ_b ≥ min(1, 1 + 4wμ) > 0` for all `θ` and 2.3 applies:
  `|ρ_a| ≤ ρ_b` means `ρ_b − ρ_a = 4μs ≥ 0`, always true, and `ρ_a + ρ_b = 2 − 4(1 − 2w)μs ≥ 0`
  for all `s ∈ [0, 1]`, which holds exactly when `2(1 − 2w)μ ≤ 1` (take `s = 1`; conversely the
  expression is affine in `s` and nonnegative at `s = 0` and `s = 1`).
- If `1 + 4wμ ≤ 0`, then `w < 0 < μ` and `2(1 − 2w)μ = 2μ − 4wμ ≥ 2μ + 1 > 1`, so the right side
  fails. The symbol `ρ_b` vanishes exactly at `s* = −1/(4wμ) ∈ (0, 1]`, at the frequencies `±θ*`
  modulo `2π`, where `ρ_a = −4μs* ≠ 0`; so `|g| > 2` on a punctured neighbourhood of `θ*`. If
  `θ*/(2π)` is irrational no grid frequency is a zero of `ρ_b`; if it is `p/q` in lowest terms
  (`q ≥ 2`), no grid of prime size `N ≠ q` has one. Take such an `N` with `2π/N` smaller than the
  neighbourhood; 2.2 applies on `ZMod N` and gives `‖(B⁻¹ A)ⁿ‖ ≥ 2ⁿ`, so the left side fails too.

**Checks.**
- `μ ≥ 0` is needed: `w = 0`, `μ = −1` gives `g = 1 + 4s ≥ 1`, equal to `5` at `θ = π`, so the
  scheme is unstable (on `ZMod 2` the powers are `5ⁿ`), while `2(1 − 0)(−1) ≤ 1`.
- Thresholds, with `g` evaluated exactly at `s = k/20`, `k = 0, …, 20`: for `w = 0` and `w = 1/4`
  the scheme satisfies `|g| ≤ 1` at `μ = 1/(2(1 − 2w))` and `1/100` below it, and violates it
  `1/100` above it; for `w = 1/2` and `w = 1` it satisfies it at `μ = 1/2, 10, 1000`.
- `μ = 0`: both stencils are `δ₀`, the step matrix is `1`, and `0 ≤ 1`.
- `N = 1`: `s = 0` is the only frequency and every weighted scheme is the identity, so stability
  is invisible on `ZMod 1`; on `ZMod 2` the explicit scheme has the eigenvalue `1 − 4μ`.

*Needs:* 2.2, 2.3; Mathlib `Real.cos_sq`, `Real.sin_sq_add_cos_sq`,
`Nat.exists_infinite_primes`. (Proved here.)

### 2.5 Three schemes for the transport equation

Prove `transport_exists_forall_norm_pow_le_iff`: for real `ν`, the three explicit schemes for
`u_t + a u_x = 0` with Courant number `ν`
- upwind, `u_j ↦ (1 − ν) u_j + ν u_(j−1)`, is stable on periodic grids if and only if
  `0 ≤ ν ≤ 1`, the Courant–Friedrichs–Lewy condition for this scheme (Trefethen, Example 4.4.1,
  p. 166, mirrored);
- Lax–Wendroff, with coefficients `(ν + ν²)/2`, `1 − ν²`, `(ν² − ν)/2` at `−1, 0, 1`, is stable on
  periodic grids if and only if `|ν| ≤ 1` (Trefethen, Example 4.4.4, p. 168);
- centred explicit, `u_j ↦ u_j − (ν/2)(u_(j+1) − u_(j−1))`, is stable on periodic grids if and
  only if `ν = 0` (Trefethen, Example 4.4.3, pp. 167–168, and Table 4.4.1, p. 169: unstable for
  every fixed ratio).

Route. Each is an explicit scheme, `b = δ₀` with `stencilMatrix δ₀ N = 1`, so by 2.3 stability
means `|ρ| ≤ 1` for all `θ`; with `s = sin²(θ/2)`:
- upwind: `ρ(θ) = 1 − ν + ν e^(−iθ)` and `|ρ(θ)|² = 1 − 4ν(1 − ν) s`, at most `1` for all `s ∈ [0, 1]`
  exactly when `ν(1 − ν) ≥ 0`;
- Lax–Wendroff: `ρ(θ) = 1 − ν²(1 − cos θ) − iν sin θ`, and with `sin² θ = 4s − 4s²`,
  `|ρ(θ)|² = 1 − 4ν²(1 − ν²) s²`, at most `1` exactly when `ν²(1 − ν²) ≥ 0`, that is `|ν| ≤ 1`;
- centred: `ρ(θ) = 1 − iν sin θ` and `|ρ(θ)|² = 1 + ν² sin² θ`, which exceeds `1` at `θ = π/2`
  unless `ν = 0`.

**Checks.**
- The closed forms of `|ρ|²` are identities in `θ`. Over `s = k/40`, `k = 0, …, 40`: for upwind the
  maximum of `|ρ|²` is `1` at `ν = 0, 1/2, 1` and exceeds `1` at `ν = −1/100` and `ν = 101/100`
  (it is `1 + 4 · 101/10000` at `θ = π`); for Lax–Wendroff it is `1` at `ν = ±1` and `ν = 99/100`
  and exceeds `1` at `ν = ±101/100`.
- `ν = 1` gives the exact shift `u_j ↦ u_(j−1)` for upwind and for Lax–Wendroff (coefficients
  `1, 0, 0`). Upwind with `ν = 2` on `ZMod 2` has the matrix with rows `(−1, 2)` and `(2, −1)`,
  of norm `3`.
- Centred scheme: on `ZMod 1` and `ZMod 2` the frequencies are `0` and `π`, where `sin θ = 0`, and
  the scheme is the identity on both, so only grids with `N ≥ 3` detect the instability (on
  `ZMod 4`, `θ_1 = π/2` and the powers grow like `(1 + ν²)^(n/2)`).

*Needs:* 2.3; Mathlib `Matrix.circulant_single_one`. (Trefethen, Examples 4.4.1, 4.4.3, 4.4.4.)

### Examples

- Leapfrog and other multistep schemes reduce to one-step schemes for vectors and need
  amplification matrices; they are outside the scalar criterion 2.3.
- For the transport equation the thresholds of the upwind and Lax–Wendroff schemes in 2.5 coincide with the CFL condition for
  their stencils; for the explicit heat scheme 2.4 gives `μ ≤ 1/2`, stricter than the CFL
  condition (Trefethen, p. 167, and Tables 4.4.1 and 4.4.2, p. 169).

### Dependencies

Layer 1 of SamplingAndDiscreteFourierAnalysis (Parseval) and its Layer 2 (diagonalisation of
circulant matrices); Mathlib's `ℓ²` operator norm of matrices.

## Scope and ownership

Owned here: the three predicates of 1.1 for a scheme approximating a Tau Ceti semigroup, the
theorems 1.2–1.5, the stencil symbol and stencil matrix of 2.1, and the theorems 2.2–2.5.

Already in the library: strongly continuous semigroups, their growth bounds and strong
continuity of orbits (Tau Ceti, the implementation of OneParameterSemigroups Part A, whose
generation theorems are not used); the Banach–Steinhaus theorem, circulant matrices and the
`ℓ²` operator norm of matrices (Mathlib). Stated by SamplingAndDiscreteFourierAnalysis and used
here: Parseval's identity for the discrete Fourier transform and the diagonalisation of circulant
matrices.

Not treated here: Friedrichs' scheme and energy stability of finite difference schemes for
symmetric hyperbolic systems with variable coefficients; the Kreiss matrix theorem and
amplification matrices for systems and multistep schemes; Trotter–Kato and Chernoff product
formulas, where convergence is derived from convergence of generators or resolvents; boundary
conditions and the Godunov–Ryabenkii and Gustafsson–Kreiss–Sundström theory; maximum-norm
stability; nonlinear schemes and conservation laws; rounding errors; linear multistep methods for
ordinary differential equations.

Layer 1 is for any later work that proves convergence of a discretisation of a linear evolution
equation from a stability estimate; Layer 2 is for constant-coefficient schemes on periodic
domains.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Analysis/Normed/Operator/BanachSteinhaus.lean`: `banach_steinhaus`
  (`[CompleteSpace E]`, a pointwise bounded family `g : ι → E →SL[σ₁₂] F` is bounded in norm).
- `Mathlib/Analysis/CStarAlgebra/Matrix.lean`: `Matrix.toEuclideanCLM` (the star algebra
  equivalence of square matrices with operators on `EuclideanSpace 𝕜 n`),
  `Matrix.l2_opNorm_toEuclideanCLM` (`‖toEuclideanCLM A‖ = ‖A‖` for the `ℓ²` operator norm),
  `Matrix.l2_opNorm_diagonal` (`‖diagonal v‖ = ‖v‖`, the sup norm of `v`).
- `Mathlib/Analysis/CStarAlgebra/Basic.lean`: `CStarRing.norm_mul_coe_unitary`,
  `CStarRing.norm_coe_unitary_mul` (`[CStarRing E]`); the instance `CStarRing (E →L[𝕜] E)` for a
  Hilbert space `E` is in `Mathlib/Analysis/InnerProductSpace/Adjoint.lean`.
- `Mathlib/LinearAlgebra/Matrix/Circulant.lean`: `Matrix.circulant` (entry `v (i − j)`),
  `Matrix.circulant_single_one` (`circulant (Pi.single 0 1) = 1`).
- `Mathlib/Analysis/Fourier/ZMod.lean`: `ZMod.dft`, `ZMod.dft_apply` (`[NeZero N]`).
- Elementary: `Real.add_one_le_exp`, `add_pow`, `norm_sum_le`,
  `ContinuousLinearMap.opNorm_comp_le`, `IsCompact.tendsto_subseq`, `isCompact_Icc`,
  `Rat.denseRange_cast`, `Real.cos_sq`, `Real.sin_sq_add_cos_sq`, `Nat.exists_infinite_primes`.

### From Tau Ceti

- `TauCeti/Analysis/Semigroups/Basic.lean`: `TauCeti.Semigroups.StronglyContinuousSemigroup X`
  (real normed space `X`; `S 0 = 1`, `S (s + t) = S s ∘ S t`, continuity at `0` of each orbit),
  `StronglyContinuousSemigroup.map_natCast_mul` (`S (k * t) = (S t) ^ k`),
  `StronglyContinuousSemigroup.realOperator` and `realOperator_def`
  (`S.realOperator t = S t.toNNReal`). Imported by `Suggested.lean`.
- `TauCeti/Analysis/Semigroups/GrowthBound.lean` (`[CompleteSpace X]`):
  `StronglyContinuousSemigroup.existsGrowthBound` (some `ω`, `M` with
  `‖S.realOperator t‖ ≤ M e^(ωt)` for `t ≥ 0`), `StronglyContinuousSemigroup.HasGrowthBound.bound`,
  `StronglyContinuousSemigroup.tendsto_realOperator_apply` (if `f i → r` through nonnegative values
  and `g i → z` then `S.realOperator (f i) (g i) → S.realOperator r z`).
- `TauCeti/Analysis/Semigroups/BoundedGenerator/Basic.lean`:
  `StronglyContinuousSemigroup.ofBounded` (used only in the Examples of Layer 1).

### From TauCetiRoadmap.SamplingAndDiscreteFourierAnalysis

- 1.1 `TauCetiRoadmap.SamplingAndDiscreteFourierAnalysis.dft_inner` (`[NeZero N]`): for
  `Φ Ψ : ZMod N → ℂ`, `∑_k conj(𝓕Φ k) 𝓕Ψ k = N ∑_j conj(Φ j) Ψ j`; used in 2.2.
- 2.1 `dftMatrix` and `dftMatrix_mul_circulant` (`[NeZero N]`):
  `dftMatrix N * circulant v = diagonal (ZMod.dft v) * dftMatrix N`; used in 2.2.

## References

- I-L. Chern, *Finite Difference Methods for Solving Differential Equations*, lecture notes,
  National Taiwan University, 2018 (author's page): Theorem 2.2, p. 29; the explicit heat scheme,
  p. 30; Theorem 4.1, p. 63.
- P. D. Lax and R. D. Richtmyer, *Survey of the stability of linear finite difference
  equations*, Comm. Pure Appl. Math. 9 (1956), 267–293, doi:10.1002/cpa.3160090206: the origin of
  the equivalence theorem, cited by attribution only.
- L. N. Trefethen, *Finite Difference and Spectral Methods for Ordinary and Partial Differential
  Equations*, unpublished text, 1996 (author's page; page numbers of the chapter files):
  Theorems 3.3 and 3.4, pp. 138 and 141; §4.2, (4.2.4)–(4.2.8) and Theorems 4.1–4.3,
  pp. 155–158; Theorem 4.8 and Examples 4.4.1–4.4.4, pp. 166–168; Tables 4.4.1 and 4.4.2, p. 169.

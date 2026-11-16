# Roadmap: spectral steepest descent, polar factors, Newton–Schulz iterations and Muon

**Summary.** Develop the variational theory of the polar factor of a linear map between
finite-dimensional inner product spaces, and the polynomial iterations that approximate it.
The polar factor is the steepest-ascent direction for the operator norm: the trace pairing
puts the operator and nuclear norms in duality, and the polar factor is the maximizer. It is
also the single-step Shampoo preconditioned gradient and the nearest isometry in every
unitarily invariant norm. Odd polynomial iterations of Newton–Schulz type act on singular
values alone, so their convergence to the polar factor is a scalar question; the roadmap
settles it for the classical cubic and quintic iterations and gives the exact invariant band
of the quintic used by the Muon optimizer. It ends with a one-step descent guarantee for
steepest descent under the operator norm, both with the exact polar factor and with Muon's
five-step approximation.

## Scope and ownership

This roadmap owns:

- the real trace pairing on linear maps and its duality between the operator and nuclear
  seminorms, with the maximizers;
- the scaling, sign and spectral API of the canonical polar factor that the duality uses;
- the Shampoo identity;
- Mirsky's singular-value inequality and the Fan–Hoffman nearest-isometry theorem;
- odd polynomial iterations on linear maps, their spectral form and their convergence;
- the scalar dynamics of the cubic and quintic Newton–Schulz maps and of Muon's quintic;
- the descent lemma for functions with Lipschitz derivative, and its instances for spectral
  steepest descent;
- the matrix forms of these statements over `𝕜`.

It consumes, and does not re-prove, the items listed under
[Exact supplier contracts](#exact-supplier-contracts).

Out of scope: infinite-dimensional and Schatten-class dualities (these belong to
[OperatorTheory/OperatorIdeals](../OperatorTheory/OperatorIdeals/README.md)), dualities of
vector `ℓᵖ` norms, momentum and stochastic-gradient convergence theory, and floating-point
error.

## Exact supplier contracts

- [OperatorTheory/PolarDecomposition](../OperatorTheory/PolarDecomposition/README.md): PD-B11
  to PD-B16 (the modulus `LinearMap.operatorAbs`, the canonical polar factor
  `LinearMap.polarFactor` with `A = U |A|`, its kernel, range and partial-isometry API), PD-B19
  (`polarFactor_adjoint`), PD-B20 (`exists_linearIsometryEquiv_eqOn_polarFactor`), and PD-C28
  (the singular values of the modulus).
- [OperatorTheory/Majorization](../OperatorTheory/Majorization/README.md): MAJ-A26
  (`LinearMap.kyFanSum`), MAJ-A28 (`norm_sum_inner_le_kyFanSum`), MAJ-B01
  (`TauCeti.UnitarilyInvariantSeminorm`), MAJ-B21 (Fan dominance `map_le_of_kyFanSum_le`), and
  MAJ-B30 to MAJ-B37 (the `opNorm`, `frobenius`, `nuclear` and `kyFan` instances and the
  nuclear singular-value formula).
- [OperatorTheory/OperatorIdeals](../OperatorTheory/OperatorIdeals/README.md): OI-A50
  (`LinearMap.abs_singularValues_sub_singularValues_le`, the Weyl perturbation bound).
- Tau Ceti: the unitary factor `Units.polarUnitary` of a unit of a star-ordered algebra with a
  real functional calculus (`TauCeti/Analysis/SpecialFunctions/ContinuousFunctionalCalculus/Polar`),
  applied to `Matrix n n 𝕜`, and the real continuous functional calculus on `E →L[𝕜] E`
  (`TauCeti/Analysis/InnerProductSpace/ContinuousFunctionalCalculus`).
- Mathlib: `LinearMap.singularValues`, `LinearMap.adjoint`, `LinearMap.trace`, `cfc`,
  `fderiv`, and `Matrix.toEuclideanLin`.

## How to read the build

Each layer opens with its definitions, each followed by its **Checks**: three or more
discriminating tests that a wrong convention would fail. Each numbered target ends with a
*Needs:* line naming the targets and suppliers it uses. Every claim carries a source locator in
parentheses, or says that it is proved here. `Suggested.lean` states the headline theorems of
Layers 1–5 against the pinned APIs.

## Conventions

- `𝕜` is `ℝ` or `ℂ` (`RCLike 𝕜`). `E`, `F` are finite-dimensional inner product spaces over
  `𝕜`, and maps are `A : E →ₗ[𝕜] F`. Layer 5 is over `ℝ`.
- The **trace pairing** is `⟪A, B⟫ := re (trace 𝕜 E (A† ∘ₗ B))`, a real number. It is real
  bilinear, symmetric, and `⟪A, A⟫ = ‖A‖_F²`.
- `‖A‖_op`, `‖A‖_F`, `N₁(A)` are `opNorm 𝕜 E F A`, `frobenius 𝕜 E F A` and
  `nuclear 𝕜 E F A`. `σᵢ(A)` are the singular values, nonincreasing, with
  `σᵢ(A) = 0` for `i ≥ rank A`.
- `|A| := A.operatorAbs` and `U_A := A.polarFactor`. `U_A` is the canonical factor: it vanishes on
  `ker A`, so it is a partial isometry and not, in general, a unitary. For a full-rank matrix it
  is the factor `U Vᵀ` of a compact singular value decomposition `U Σ Vᵀ`.
- Real functions of `|A|` and of the Gram operators use `cfc` on
  `LinearMap.toContinuousLinearMap`. On `E →L[𝕜] E`, `cfc` is taken for any real algebra
  structure compatible with the `𝕜`-action (`IsScalarTower ℝ 𝕜`).
- An **odd polynomial step** has real coefficients `c₀, …, cₙ`. It is the map
  `N_c(X) = Σⱼ cⱼ • X ∘ₗ (X† ∘ₗ X)ʲ` with scalar map `p_c(t) = Σⱼ cⱼ t^(2j+1)`. The cubic
  Newton–Schulz step is `c = (3/2, -1/2)`, `g(t) = (3t − t³)/2`. The quintic is
  `c = (15/8, -5/4, 3/8)`, `q(t) = (15t − 10t³ + 3t⁵)/8`.
- **Muon's quintic** is `c = (3.4445, -4.7750, 2.0315)`, read as the exact rationals
  `34445/10000`, `-4775/1000`, `20315/10000`, with `m(t) = 3.4445t − 4.775t³ + 2.0315t⁵`.
  The **Muon band** is `J = [17/25, 5/4]`.
- The **Muon direction** with `k` steps is `muonDirection k A := N_m^[k](‖A‖_F⁻¹ • A)`, which
  is `0` at `A = 0`. The implementation constant `ε` added to `‖A‖_F` is not modelled.
- `f^[k]` is the `k`-th iterate.

## Layer 1: trace duality and the polar factor

### 1.1 The trace pairing

Define `traceInner A B` as above. Prove that it is real bilinear and symmetric, that
`traceInner A A = ‖A‖_F²`, the Cauchy–Schwarz inequality `|⟪A, B⟫| ≤ ‖A‖_F ‖B‖_F`, invariance
under `A, B ↦ W ∘ A ∘ V` for linear isometric equivalences `W`, `V`, and
`⟪A†, B†⟫ = ⟪A, B⟫`. Over `ℝ` it is `trace (A† ∘ B)` itself. (Proved here.)

**Checks.**

- `⟪1, 1⟫ = finrank E` on `E →ₗ[𝕜] E`.
- Over `ℂ`, `⟪A, i • A⟫ = 0`; a pairing without `re` would give `i ‖A‖_F²`.
- On `ℝ²`, for `D = e₁e₂ᵀ` and `A = 2e₁e₂ᵀ`, `⟪D, A⟫ = 2`, while `⟪Dᵀ, A⟫ = 0`.

*Needs:* MAJ-B30 to MAJ-B37 (`frobenius`).

### 1.2 Operator–nuclear duality

- `|⟪D, A⟫| ≤ ‖D‖_op · N₁(A)` for all `D, A : E →ₗ[𝕜] F`.
- `⟪U_A, A⟫ = N₁(A)`, and `‖U_A‖_op = 1` when `A ≠ 0`.
- Hence `N₁(A)` is the greatest value of `⟪D, A⟫` over `‖D‖_op ≤ 1`, attained at `U_A`
  (`IsGreatest`).
- **Maximizers.** For `‖D‖_op ≤ 1`, `⟪D, A⟫ = N₁(A)` holds if and only if `D ∘ₗ |A| = A`,
  equivalently `D x = U_A x` for every `x ∈ (ker A)ᗮ`. The maximizer is unique if and only if
  `A` is injective or surjective. If `ker A ≠ ⊥` and `range A ≠ ⊤`, the maximizers are exactly
  the maps `U_A + T ∘ P`, where `P` is the orthogonal projection onto `ker A` and
  `T : ker A → (range A)ᗮ` has operator norm at most `1`; `U_A`, the case `T = 0`, is the
  unique one of least Frobenius norm, since `‖U_A + T ∘ P‖_F² = rank A + ‖T‖_F²`.
- **Reverse duality.** `‖A‖_op` is the greatest value of `⟪D, A⟫` over `N₁(D) ≤ 1`, attained
  at a rank-one map `x ↦ ⟪v, x⟫ u`, where `v` is a unit vector with `‖A v‖ = ‖A‖_op` and
  `u = A v / ‖A‖_op`, for `A ≠ 0`.
- **Frobenius self-duality.** `‖A‖_F` is the greatest value of `⟪D, A⟫` over `‖D‖_F ≤ 1`,
  attained only at `‖A‖_F⁻¹ • A` for `A ≠ 0`.

(Bernstein–Newhouse, Proposition 5 and its proof, pp. 5–6 and 17–18, for the duality and the
maximizer; the description of all maximizers is proved here.)

**Checks.**

- `A = diag(3, 4)`: `U_A = 1` and `N₁(A) = ⟪1, A⟫ = 7`.
- `A = (1 0) : ℝ² → ℝ`: `ker A ≠ ⊥`, but `A` is surjective and `U_A = (1 0)` is the only
  maximizer, since `D = (1 d₂)` with `‖D‖_op ≤ 1` forces `d₂ = 0`.
- `A = [[0, 2], [0, 0]]`: the maximizers are exactly `U_A + t e₂e₁ᵀ` with `|t| ≤ 1`, where
  `U_A = [[0, 1], [0, 0]]`.

*Needs:* 1.1, PD-B11 to PD-B16, MAJ-A28, MAJ-B37.

### 1.3 Polar factor API

- For `z : 𝕜` with `z ≠ 0`, `|z • A| = ‖z‖ • |A|` and `U_(z • A) = (z / ‖z‖) • U_A`. In
  particular `U_(c • A) = U_A` for real `c > 0`, and `U_(-A) = -U_A`.
- The singular values of `U_A` are `1` with multiplicity `rank A` and `0` afterwards. So
  `N₁(U_A) = rank A` and `‖U_A‖_F² = rank A`.
- `U_A` is an isometric embedding exactly when `A` is injective, and a linear isometric
  equivalence exactly when `A` is bijective.
- For `A` bijective between spaces of equal dimension, `U_A` agrees under
  `Matrix.toEuclideanLin` with the unitary factor `Units.polarUnitary` of the unit `A` of the
  star-ordered algebra `Matrix n n 𝕜`.

(Proved here from PD-B11 to PD-B16 and PD-C28.)

**Checks.**

- Over `ℂ`, `A = 1` and `z = i`: `|i • 1| = 1` and `U_(i • 1) = i • 1`.
- `A = [[0, 2], [0, 0]]`: the singular values of `U_A` are `(1, 0)`, and
  `N₁(U_A) = ‖U_A‖_F² = 1 = rank A`.
- `A = 0`: `U_A = 0`, which is not an isometric embedding.

*Needs:* PD-B11 to PD-B16, PD-C28, MAJ-B37.

### 1.4 The Shampoo identity

Let `φ(t) = t^(-1/4)` for `t > 0` and `φ(t) = 0` for `t ≤ 0`, and `ψ(t) = t^(-1/2)` for `t > 0`
and `ψ(t) = 0` for `t ≤ 0`. Prove, for every `A`,

`cfc φ (A ∘ A†) ∘ A ∘ cfc φ (A† ∘ A) = U_A`, `cfc ψ (A ∘ A†) ∘ A = U_A`,
`A ∘ cfc ψ (A† ∘ A) = U_A`.

The first identity is the single-step Shampoo update. No invertibility is assumed: on the
kernel the functions vanish. (Bernstein–Newhouse, Equations (15)–(16), p. 5, and Appendix A,
Equation (35), p. 15, for invertible `A`; the general case is proved here.)

**Checks.**

- `A = [[0, 2], [0, 0]]`: `φ(A A†) = diag(4^(-1/4), 0)`, `φ(A† A) = diag(0, 4^(-1/4))`, and the
  product is `e₁e₂ᵀ = U_A`.
- For a rotation `R` and `A = R · diag(2, 1/2)`, `U_A = R`, and the Shampoo identity returns `R`.
- `A = 0`: both sides are `0`.

*Needs:* 1.3, PD-B11 to PD-B16, `cfc`.

## Layer 2: nearest isometries

### 2.1 Mirsky's inequality

For `A, B : E →ₗ[𝕜] F` and every `k`, the sum of the `k` largest values of
`|σᵢ(A) − σᵢ(B)|` is at most `kyFanSum (A − B) k`. Consequently, for every unitarily
invariant seminorm `N`, `N` of any map with singular values `|σᵢ(A) − σᵢ(B)|` is at most
`N(A − B)`. Tau Ceti's `LinearMap.abs_singularValues_sub_singularValues_le` (OI-A50) is the
case `k = 1`. (Mirsky 1960 states the inequality for unitarily invariant norms; the Ky Fan form
is proved here from MAJ-A28.)

**Checks.**

- `A = diag(3, 1)`, `B = diag(1, 3)`: the left sides for `k = 1, 2` are `0, 0`, and the right
  sides are `2, 4`.
- `B = 0`: both sides equal `kyFanSum A k`.
- `A = 2 • 1`, `B = 1` on `ℝ²`: every difference is `1`, and the bound is attained.

*Needs:* OI-A50, MAJ-A26, MAJ-A28, MAJ-B21.

### 2.2 The Fan–Hoffman theorem

Let `W : E →ₗᵢ[𝕜] F` agree with `U_A` on `(ker A)ᗮ`; one exists whenever
`finrank E ≤ finrank F`. For every linear isometry `Q : E →ₗᵢ[𝕜] F` and every unitarily
invariant seminorm `N`,

`N(A − W) ≤ N(A − Q) ≤ N(A + W)`.

The singular values of `A − W` are the values `|σᵢ(A) − 1|`, reordered, and those of `A + W`
are `σᵢ(A) + 1`, for `i < finrank E`. The proof uses `W† ∘ A = |A|`, so that
`(A − W)† (A − W) = (|A| − 1)²`, together with 2.1 applied to `A` and `Q`. (Fan–Hoffman,
Theorem 1, p. 112.)

**Checks.**

- `A = diag(2, 0)`, `W = 1`, `Q = −1`, `N = ‖·‖_op`: `‖A − W‖ = 1 ≤ ‖A − Q‖ = 3`, and
  `σ(A − W) = (1, 1)`.
- `E = ℝ`, `F = ℝ²`, `A = (2, 0)ᵀ`, `Q = (cos θ, sin θ)ᵀ`:
  `‖A − U_A‖_op = 1 ≤ √(5 − 4 cos θ) = ‖A − Q‖_op ≤ 3 = ‖A + U_A‖_op`.
- `A = 0`: every isometry `W` qualifies, and all three terms equal `N` of an isometry.

*Needs:* 1.3, 2.1, PD-B20, MAJ-B21.

### 2.3 The nearest isometric embedding in Frobenius norm

Let `A` be injective, so `finrank E ≤ finrank F` and `U_A` is an isometric embedding. For every
linear isometry `V : E →ₗᵢ[𝕜] F`, `‖A − U_A‖_F ≤ ‖A − V‖_F`, with equality only for
`V = U_A`. The proof is `‖A − V‖_F² = ‖A‖_F² + finrank E − 2⟪V, A⟫` and 1.2.
(Bernstein–Newhouse, Proposition 4, p. 5.)

**Checks.**

- `A = (2, 0)ᵀ`, `V = (cos θ, sin θ)ᵀ`: `‖A − V‖_F² = 5 − 4 cos θ ≥ 1`, with equality only at
  `θ = 0`.
- `A = 1`: `U_A = 1` and the minimum is `0`.
- `A = diag(2, 1/2)`: `U_A = 1` and `‖A − U_A‖_F² = 5/4`.

*Needs:* 1.1, 1.2, 1.3.

## Layer 3: odd polynomial iterations

### 3.1 Definitions

Define `oddStep c X` and `oddScalar c t` as in the conventions, for a finite family of real
coefficients. The cubic, quintic and Muon steps are instances. Give the three-term form
`a • X + b • X ∘ X† ∘ X + c • X ∘ (X† ∘ X) ∘ (X† ∘ X)`, and its equality with
`a • X + b • (X ∘ X†) ∘ X + c • (X ∘ X†)² ∘ X`, the form in which Muon is usually written
(Jordan et al., the section on the Newton–Schulz iteration). Define `muonDirection` as in the
conventions.

**Checks.**

- On `ℝ`, `X = 2` and `c = (3/2, −1/2)`: `oddStep c X = −1`. The exponent `(X† X)^(j+1)` would
  give `−4`.
- `c = (1)` gives the identity map, and `oddStep c (−X) = −oddStep c X`.
- `oddScalar cubicCoeffs (1/2) = 11/16`.
- `muonDirection k 0 = 0`, and `muonDirection k (t • A) = muonDirection k A` for real `t > 0`.

*Needs:* none.

### 3.2 Spectral form

- `oddStep c X = U_X ∘ cfc (oddScalar c) |X|`.
- `(oddStep c)^[k] X = U_X ∘ cfc ((oddScalar c)^[k]) |X|` for every `k`.
- The singular values of `(oddStep c)^[k] X` are the values `|(oddScalar c)^[k] (σᵢ(X))|` over
  `i < rank X`, sorted, followed by zeros.
- If `(oddScalar c)^[k] s > 0` for every nonzero singular value `s` of `X`, then
  `U_((oddStep c)^[k] X) = U_X`.

(Bernstein–Newhouse, Appendix A, p. 15, for invertible matrices; proved here in general.)

**Checks.**

- `X = 2` on `ℝ`, cubic, `k = 1, 2`: `−1 = U_X · g(2)`, then `g(−1) = −1`; negative values are
  allowed.
- `X = 0`: both sides are `0` for every `k`.
- `X = diag(2, 1/2)`, cubic, `k = 1`: `oddStep c X = diag(−1, 11/16)`.

*Needs:* 1.3, 3.1, PD-B11 to PD-B16, `cfc`.

### 3.3 Error and alignment identities

For `X ≠ 0` and `Y = (oddStep c)^[k] X`:

- `‖Y − U_X‖_op` is the maximum of `|(oddScalar c)^[k] s − 1|` over nonzero singular values
  `s` of `X`.
- `‖Y − U_X‖_F²` is the sum of `((oddScalar c)^[k] (σᵢ(X)) − 1)²` over `i < rank X`.
- `⟪Y, X⟫` is the sum of `σᵢ(X) · (oddScalar c)^[k] (σᵢ(X))` over `i < rank X`.

(Proved here from 3.2.)

**Checks.**

- `X = diag(2, 1/2)`, cubic, `k = 1`: `Y = diag(−1, 11/16)`, `‖Y − 1‖_op = 2`, and
  `⟪Y, X⟫ = −2 + 11/32`.
- `X = 1`, cubic: `Y = 1`, and both errors are `0`.
- `X = diag(1, 0)`: the zero singular value contributes nothing to either error.

*Needs:* 1.1, 3.2.

### 3.4 Convergence and normalization

- If `(oddScalar c)^[k] s → 1` for every nonzero singular value `s` of `X`, then
  `(oddStep c)^[k] X → U_X`.
- For `A ≠ 0`, `X₀ = ‖A‖_F⁻¹ • A` has `U_X₀ = U_A`, `σᵢ(X₀) = σᵢ(A) / ‖A‖_F`, and every
  nonzero singular value of `X₀` lies in `(0, 1]`. The same holds with `‖A‖_op` in place of
  `‖A‖_F`.

(Proved here from 3.2.)

**Checks.**

- `X = diag(1/2, 0)`, cubic: the limit is `diag(1, 0) = U_X`.
- `X = 0`: the hypothesis is vacuous and the limit is `0 = U_0`.
- `A = diag(3, 4)`: `X₀ = diag(3/5, 4/5)`.

*Needs:* 1.3, 3.2.

## Layer 4: scalar dynamics

### 4.1 The cubic

- `1 − g(t) = (1 − t)² (2 + t) / 2`.
- For `s ∈ (0, √3)`, `g^[k] s → 1`. On `(0, 1]` the orbit is nondecreasing, and `(1, √3)`
  is mapped into `(0, 1)`.
- With `eₖ = 1 − g^[k] s`, `eₖ₊₁ = eₖ² (3 − eₖ) / 2`. So the convergence is quadratic, and
  `0 ≤ eₖ₊₁ ≤ (3/2) eₖ²` once `s ∈ (0, 1]`.
- `g(√3) = 0`, so the orbit from `√3` is constant `0` after one step.

(Bernstein–Newhouse, Appendix A, Equation (36), p. 15, for the cubic; the error recursion and
the boundary behaviour are proved here.)

**Checks.**

- `g(1/2) = 11/16`, and `e = 0.4` gives `e' = 0.208` from both sides of the recursion.
- The orbit from `√3` is `√3, 0, 0, …`.
- The real root `s ≈ 2.196` of `s³ − 3s − 4` has orbit `s, −2, 1, 1, …`, so convergence on
  `(0, √3)` does not describe all orbits above `√3`.

*Needs:* none.

### 4.2 The quintic

- `1 − q(t) = (1 − t)³ (3t² + 9t + 8) / 8`, and `q'(t) = 15 (1 − t²)² / 8`.
- For `s ∈ (0, 1]`, `q^[k] s → 1`, nondecreasingly, and `0 ≤ 1 − q(t) ≤ (5/2) (1 − t)³` on
  `[0, 1]`.

(Proved here.)

**Checks.**

- `1 − q(t)` at `t = 0.3, 0.7, 1.3` is `0.47034`, `0.05322`, `−0.08360` from both sides.
- `q(1) = 1` and `q'(1) = 0`.
- The factor `(3t² + 9t + 8)/8` has maximum `5/2` on `[0, 1]`, at `t = 1`.

*Needs:* none.

### 4.3 Muon's quintic

- `m(1) = 701/1000`, and the positive fixed points of `m` are the two positive roots of
  `2.0315 t⁴ − 4.775 t² + 2.4445`, approximately `0.868` and `1.264`. So `1` is not a fixed
  point, and for no `s` does `m^[k] s → 1`.
- **Invariant band.** `m` maps `J = [17/25, 5/4]` into itself. `m` has its critical points in
  `(0, 5/4]` at about `0.5545`, a local maximum, and `1.0501`, a local minimum. The image of `J`
  lies in `[0.6818, 1.1791]`, the upper end being `m(5/4) = 1.17909912109375`.
- **Entry time.** For `s ∈ (0, 5/4]`, `m^[k] s ∈ J` for every `k ≥ K(s)`, where `K(s) = 1` for
  `s ≥ 3/10` and `K(s) = 1 + ⌈log₃ (3 / (10 s))⌉` for `s < 3/10`. The proof uses three facts:
  `m(t) ≥ 3t` and `m(t) ≤ m(3/10)` on `(0, 3/10]`, and `m([3/10, 17/25]) ⊆ J`.
- **Five steps.** For `s ∈ [1/270, 5/4]`, `m^[5] s ∈ J`.

(The coefficients are Jordan et al., the section on the Newton–Schulz iteration, which gives
only the empirical target `[0.7, 1.3]`. The band, the entry time and the threshold `1/270` are
proved here and appear in no cited source.)

**Checks.**

- `m(1/2) = 1.188859375` and `m(5/4) = 482959/409600`.
- The orbit of `1/270` reaches `1.1906` at step `5`, and `K(1/1000) = 7`.
- On `(0, 3/10]`, `min m(t)/t ≈ 3.031 ≥ 3`.

*Needs:* none.

## Layer 5: steepest descent

### 5.1 The descent lemma

Let `V` be a real normed space and `f : V → ℝ` differentiable on the segment `[x, x + h]` with
`‖fderiv ℝ f y − fderiv ℝ f x‖ ≤ L ‖y − x‖` there. Then
`f (x + h) ≤ f x + fderiv ℝ f x h + (L / 2) ‖h‖²`. Mathlib has no such statement at the pin;
it is a target of this layer. (Proved here.)

**Checks.**

- `f(x) = x²/2` on `ℝ`, `L = 1`: equality `(x + h)²/2`.
- `f` affine, `L = 0`: equality.
- `L < 0`: the hypothesis forces `h = 0`, and the conclusion is an equality.

*Needs:* Mathlib `fderiv`.

### 5.2 Spectral steepest descent

Take `𝕜 = ℝ`, and give `E →L[ℝ] F` its operator norm. For `f : (E →L[ℝ] F) → ℝ`
differentiable at `W`, let `G` be the gradient for the trace pairing:
`fderiv ℝ f W Z = ⟪G, Z⟫` for all `Z`. Prove that `‖fderiv ℝ f W‖ = N₁(G)`, the dual norm of
the operator norm. Under the hypothesis of 5.1 with constant `L ≥ 0`, every `D` with
`‖D‖_op ≤ ρ` and `⟪G, D⟫ ≥ κ N₁(G)` satisfies, for `η ≥ 0`,

`f (W − η D) ≤ f W − η κ N₁(G) + (L / 2) η² ρ²`.

(Bernstein–Newhouse, Proposition 5, pp. 5–6, for the steepest direction; the bound is proved
here.)

Instances:

- `D = U_G`, with `κ = ρ = 1`. For `L > 0`, the step size `η = N₁(G) / L` gives
  `f (W − η U_G) ≤ f W − N₁(G)² / (2L)`.
- `D = muonDirection 5 G`, when every nonzero singular value of `G` is at least
  `‖G‖_F / 270`, with `κ = 17/25` and `ρ = 5/4`, by 3.3, 3.4 and 4.3. Also prove
  `‖D − U_G‖_op ≤ 8/25` and `U_D = U_G` there.
- The `k`-step cubic and quintic directions `Dₖ` from the Frobenius normalization:
  `⟪Dₖ, G⟫ → N₁(G)` and `‖Dₖ‖_op → 1` as `k → ∞` for `G ≠ 0`, and `‖Dₖ‖_op ≤ 1` and
  `⟪Dₖ, G⟫ ≤ N₁(G)` for every `k`.

**Checks.**

- `f = ⟪G, ·⟫`: `‖f'‖ = N₁(G)`.
- `A = 1` on `ℝ²`: `muonDirection 5 A = m^[5](1/√2) • 1 = 1.10811 • 1`, inside `J`, and
  `|m^[5](1/√2) − 1| ≤ 8/25`.
- `G = 0`: every term of the bound is `0`.

*Needs:* 1.2, 3.3, 3.4, 4.3, 5.1.

## Layer 6: matrices and worked examples

### 6.1 Matrix interface

For `A : Matrix m n 𝕜`, define `Matrix.polarFactor A` by transport along
`Matrix.toEuclideanLin`. Prove `(Matrix.polarFactor A)ᴴ * Matrix.polarFactor A = 1` when `A`
has full column rank, the compact singular value decomposition form `U Vᴴ`, and the matrix
forms of 1.2, 1.4, 3.2 and 5.2. Use the trace pairing `re (trace (Aᴴ * B))`, the
`Matrix.Norms.L2Operator` norm and the Frobenius norm. (Proved here.)

**Checks.**

- `A = (i) : Matrix (Fin 1) (Fin 1) ℂ`: `U_A = (i)`, `U_Aᴴ * U_A = 1`, and
  `re (trace (U_Aᴴ * A)) = 1 = N₁(A)`; with `ᵀ` in place of `ᴴ` the product would be `−1`.
- `A = diag(3, 4)`: `Matrix.polarFactor A = 1`.
- `A = [[0, 2], [0, 0]]`: `Matrix.polarFactor A = [[0, 1], [0, 0]]`.

*Needs:* Layers 1–5, `Matrix.toEuclideanLin`.

## Dependencies and order

Layer 1 uses PolarDecomposition and Majorization; 1.4 also uses `cfc`. Layer 2 uses Layer 1,
OI-A50 and Fan dominance. Layer 3 uses 1.3 and `cfc`. Layer 4 is real analysis on polynomials
and uses nothing above it. Layer 5 uses Layers 1, 3 and 4. Layer 6 uses all of them. The
per-target *Needs:* lines are authoritative.

## Downstream consumers

The proposed ManifoldOptimization roadmap uses the Frobenius nearest-point property of the
polar factor (2.3) and the Euclidean descent lemma (5.1); this roadmap owns both.

## Provenance

A formalization of much of Layers 1–4 for invertible square real matrices, in explicit
singular value decomposition coordinates, is in
[lean4-mlir](https://github.com/brettkoonce/lean4-mlir), in the files
`LeanMlir/Proofs/Foundation/Muon/Geometry.lean` (duality, Shampoo, nearest orthogonal matrix),
`NewtonSchulz.lean` (spectral step, cubic and quintic convergence, the Muon quintic's failure to
converge and a five-step bound at `1/2`) and `SpectralForm.lean`. It is BSD-3 licensed, and its
author contributed this roadmap. The roadmap generalizes it to rectangular and singular maps
and to the canonical polar factor; the source is reference material, not the specification.

## References

- J. Bernstein and L. Newhouse, *Old optimizer, new norm: an anthology*, 2024,
  arXiv:2409.20325.
- K. Jordan et al., *Muon: an optimizer for hidden layers in neural networks*, 2024,
  <https://kellerjordan.github.io/posts/muon/>.
- V. Gupta, T. Koren and Y. Singer, *Shampoo: preconditioned stochastic tensor optimization*,
  ICML 2018, arXiv:1802.09568.
- K. Fan and A. J. Hoffman, *Some metric inequalities in the space of matrices*, Proc. Amer.
  Math. Soc. **6** (1955), 111–116.
- L. Mirsky, *Symmetric gauge functions and unitarily invariant norms*, Quart. J. Math. **11**
  (1960), 50–59.

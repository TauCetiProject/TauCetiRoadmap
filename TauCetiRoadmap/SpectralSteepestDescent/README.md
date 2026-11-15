# Spectral steepest descent: polar factors, Newton–Schulz iterations and Muon

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
  steepest descent.

It consumes, and does not re-prove:

- [OperatorTheory/PolarDecomposition](../OperatorTheory/PolarDecomposition/README.md): the
  modulus `LinearMap.operatorAbs`, the canonical polar factor `LinearMap.polarFactor` with
  `A = U |A|`, its kernel, range and partial-isometry API, `polarFactor_adjoint`, and the
  isometric equivalence agreeing with `U` on `(ker A)ᗮ` between spaces of equal dimension;
- [OperatorTheory/Majorization](../OperatorTheory/Majorization/README.md): `LinearMap.kyFanSum`,
  `TauCeti.UnitarilyInvariantSeminorm` with its `opNorm`, `frobenius`, `nuclear` and `kyFan`
  instances, Fan dominance `map_le_of_kyFanSum_le`, and the von Neumann-type bound
  `norm_sum_inner_le_kyFanSum`;
- Mathlib: `LinearMap.singularValues`, `LinearMap.adjoint`, `LinearMap.trace`, and the
  continuous functional calculus `cfc` on `E →L[𝕜] E`, with Tau Ceti's real instance on
  `RCLike` Hilbert spaces (`TauCeti/Analysis/InnerProductSpace/ContinuousFunctionalCalculus`).

Out of scope: infinite-dimensional and Schatten-class dualities (these belong to
[OperatorTheory/OperatorIdeals](../OperatorTheory/OperatorIdeals/README.md)), dualities of
vector `ℓᵖ` norms, momentum and stochastic-gradient convergence theory, and floating-point
error.

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
  `LinearMap.toContinuousLinearMap`.
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
`⟪A†, B†⟫ = ⟪A, B⟫`. Over `ℝ` it is `trace (A† ∘ B)` itself.

### 1.2 Operator–nuclear duality

- `|⟪D, A⟫| ≤ ‖D‖_op · N₁(A)` for all `D, A : E →ₗ[𝕜] F`.
- `⟪U_A, A⟫ = N₁(A)`, and `‖U_A‖_op = 1` when `A ≠ 0`.
- Hence `N₁(A)` is the greatest value of `⟪D, A⟫` over `‖D‖_op ≤ 1`, attained at `U_A`
  (`IsGreatest`).
- **Maximizers.** For `‖D‖_op ≤ 1`, `⟪D, A⟫ = N₁(A)` holds if and only if `D ∘ₗ |A| = A`,
  equivalently `D x = U_A x` for every `x ∈ (ker A)ᗮ`. If `A` is injective, `U_A` is the
  unique maximizer. If `ker A ≠ ⊥` and `F` is nontrivial, the maximizer is not unique, and
  `U_A` is the unique maximizer of least Frobenius norm.
- **Reverse duality.** `‖A‖_op` is the greatest value of `⟪D, A⟫` over `N₁(D) ≤ 1`, attained
  at a rank-one map `x ↦ ⟪v, x⟫ u`, where `v` is a unit vector with `‖A v‖ = ‖A‖_op` and
  `u = A v / ‖A‖_op`, for `A ≠ 0`.
- **Frobenius self-duality.** `‖A‖_F` is the greatest value of `⟪D, A⟫` over `‖D‖_F ≤ 1`,
  attained only at `‖A‖_F⁻¹ • A` for `A ≠ 0`.

### 1.3 Polar factor API

- `U_(c • A) = U_A` for real `c > 0`, and `U_(-A) = -U_A`.
- The singular values of `U_A` are `1` with multiplicity `rank A` and `0` afterwards. So
  `N₁(U_A) = rank A` and `‖U_A‖_F² = rank A`.
- `U_A` is an isometric embedding exactly when `A` is injective, and a linear isometric
  equivalence exactly when `A` is bijective.
- For `A` bijective between spaces of equal dimension, `U_A` agrees with the unitary factor of
  Tau Ceti's matrix polar decomposition `Units.polarUnitary` under `Matrix.toEuclideanLin`.

### 1.4 The Shampoo identity

Let `φ(t) = t^(-1/4)` for `t > 0` and `φ(t) = 0` for `t ≤ 0`, and `ψ(t) = t^(-1/2)` for `t > 0`
and `ψ(t) = 0` for `t ≤ 0`. Prove, for every `A`,

`cfc φ (A ∘ A†) ∘ A ∘ cfc φ (A† ∘ A) = U_A`, `cfc ψ (A ∘ A†) ∘ A = U_A`,
`A ∘ cfc ψ (A† ∘ A) = U_A`.

The first identity is the single-step Shampoo update. No invertibility is assumed: on the
kernel the functions vanish.

## Layer 2: nearest isometries

### 2.1 Mirsky's inequality

For `A, B : E →ₗ[𝕜] F` and every `k`, the sum of the `k` largest values of
`|σᵢ(A) − σᵢ(B)|` is at most `kyFanSum (A − B) k`. Consequently, for every unitarily
invariant seminorm `N`, `N` of any map with singular values `|σᵢ(A) − σᵢ(B)|` is at most
`N(A − B)`. Extend Tau Ceti's `abs_singularValues_sub_singularValues_le`, which is the case
`k = 1`.

### 2.2 The Fan–Hoffman theorem

Let `finrank E = finrank F`, and let `W : E ≃ₗᵢ[𝕜] F` agree with `U_A` on `(ker A)ᗮ`. For
every linear isometric equivalence `Q : E ≃ₗᵢ[𝕜] F` and every unitarily invariant seminorm `N`,
`N(A − W) ≤ N(A − Q)`. The singular values of `A − W` are `|σᵢ(A) − 1|`, reordered.

### 2.3 The nearest isometric embedding in Frobenius norm

Let `A` be injective, so `finrank E ≤ finrank F` and `U_A` is an isometric embedding. For every
linear isometry `V : E →ₗᵢ[𝕜] F`, `‖A − U_A‖_F ≤ ‖A − V‖_F`, with equality only for
`V = U_A`. The proof is `‖A − V‖_F² = ‖A‖_F² + finrank E − 2⟪V, A⟫` and 1.2.

## Layer 3: odd polynomial iterations

### 3.1 Definitions

Define `oddStep c X` and `oddScalar c t` as in the conventions, for a finite family of real
coefficients. The cubic, quintic and Muon steps are instances. Give the three-term form
`a • X + b • X ∘ X† ∘ X + c • X ∘ (X† ∘ X) ∘ (X† ∘ X)`, and its equality with
`a • X + b • (X ∘ X†) ∘ X + c • (X ∘ X†)² ∘ X`, the form in which Muon is usually written.

### 3.2 Spectral form

- `oddStep c X = U_X ∘ cfc (oddScalar c) |X|`.
- `(oddStep c)^[k] X = U_X ∘ cfc ((oddScalar c)^[k]) |X|` for every `k`.
- The singular values of `(oddStep c)^[k] X` are the values `|(oddScalar c)^[k] (σᵢ(X))|` over
  `i < rank X`, sorted, followed by zeros.
- If `(oddScalar c)^[k] s > 0` for every nonzero singular value `s` of `X`, then
  `U_((oddStep c)^[k] X) = U_X`.

### 3.3 Error and alignment identities

For `X ≠ 0` and `Y = (oddStep c)^[k] X`:

- `‖Y − U_X‖_op` is the maximum of `|(oddScalar c)^[k] s − 1|` over nonzero singular values
  `s` of `X`.
- `‖Y − U_X‖_F²` is the sum of `((oddScalar c)^[k] (σᵢ(X)) − 1)²` over `i < rank X`.
- `⟪Y, X⟫` is the sum of `σᵢ(X) · (oddScalar c)^[k] (σᵢ(X))` over `i < rank X`.

### 3.4 Convergence and normalization

- If `(oddScalar c)^[k] s → 1` for every nonzero singular value `s` of `X`, then
  `(oddStep c)^[k] X → U_X`.
- For `A ≠ 0`, `X₀ = ‖A‖_F⁻¹ • A` has `U_X₀ = U_A`, `σᵢ(X₀) = σᵢ(A) / ‖A‖_F`, and every
  nonzero singular value of `X₀` lies in `(0, 1]`. The same holds with `‖A‖_op` in place of
  `‖A‖_F`.

## Layer 4: scalar dynamics

### 4.1 The cubic

- `1 − g(t) = (1 − t)² (2 + t) / 2`.
- For `s ∈ (0, √3)`, `g^[k] s → 1`. On `(0, 1]` the orbit is nondecreasing, and `(1, √3)`
  is mapped into `(0, 1)`.
- With `eₖ = 1 − g^[k] s`, `eₖ₊₁ = eₖ² (3 − eₖ) / 2`. So the convergence is quadratic, and
  `0 ≤ eₖ₊₁ ≤ (3/2) eₖ²` once `s ∈ (0, 1]`.
- `g(√3) = 0`, so the orbit from `√3` is constant `0` after one step.

### 4.2 The quintic

- `1 − q(t) = (1 − t)³ (3t² + 9t + 8) / 8`, and `q'(t) = 15 (1 − t²)² / 8`.
- For `s ∈ (0, 1]`, `q^[k] s → 1`, nondecreasingly, and `0 ≤ 1 − q(t) ≤ (5/2) (1 − t)³` on
  `[0, 1]`.

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

## Layer 5: steepest descent

### 5.1 The descent lemma

Let `V` be a real normed space and `f : V → ℝ` differentiable on the segment `[x, x + h]` with
`‖fderiv ℝ f y − fderiv ℝ f x‖ ≤ L ‖y − x‖` there. Then
`f (x + h) ≤ f x + fderiv ℝ f x h + (L / 2) ‖h‖²`. Reuse a Mathlib form if one exists, and build
it here otherwise.

### 5.2 Spectral steepest descent

Take `𝕜 = ℝ`, and give `E →L[ℝ] F` its operator norm. For `f : (E →L[ℝ] F) → ℝ`
differentiable at `W`, let `G` be the gradient for the trace pairing:
`fderiv ℝ f W Z = ⟪G, Z⟫` for all `Z`. Prove that `‖fderiv ℝ f W‖ = N₁(G)`, the dual norm of
the operator norm. Under the hypothesis of 5.1 with constant `L ≥ 0`, every `D` with
`‖D‖_op ≤ ρ` and `⟪G, D⟫ ≥ κ N₁(G)` satisfies, for `η ≥ 0`,

`f (W − η D) ≤ f W − η κ N₁(G) + (L / 2) η² ρ²`.

Instances:

- `D = U_G`, with `κ = ρ = 1`. With the step size `η = N₁(G) / L` this gives decrease
  `N₁(G)² / (2L)`.
- `D = muonDirection 5 G`, when every nonzero singular value of `G` is at least
  `‖G‖_F / 270`, with `κ = 17/25` and `ρ = 5/4`, by 3.3, 3.4 and 4.3. Also prove
  `‖D − U_G‖_op ≤ 8/25` and `U_D = U_G` there.
- The `k`-step cubic and quintic directions `Dₖ` from the Frobenius normalization:
  `⟪Dₖ, G⟫ → N₁(G)` and `‖Dₖ‖_op → 1` as `k → ∞` for `G ≠ 0`, and `‖Dₖ‖_op ≤ 1` and
  `⟪Dₖ, G⟫ ≤ N₁(G)` for every `k`.

## Layer 6: matrices and worked examples

### 6.1 Matrix interface

For `A : Matrix m n ℝ`, define `Matrix.polarFactor A` by transport along
`Matrix.toEuclideanLin`. Prove `(Matrix.polarFactor A)ᵀ * Matrix.polarFactor A = 1` when `A`
has full column rank, the compact singular value decomposition form `U Vᵀ`, and the matrix
forms of 1.2, 1.4, 3.2 and 5.2. Use the trace pairing `trace (Aᵀ * B)`, the
`Matrix.Norms.L2Operator` norm and the Frobenius norm.

### 6.2 Checks

- For `A = diag(3, 4)`, `U_A = 1` and `N₁(A) = 7`. For `A = [[0, 2], [0, 0]]`,
  `U_A = [[0, 1], [0, 0]]`, a partial isometry of rank one, and the maximizers of
  `⟪D, A⟫` over `‖D‖_op ≤ 1` are exactly the contractions whose second column is `(1, 0)`.
- For a rotation `R` and `A = R · diag(2, 1/2)`, `U_A = R`, and the Shampoo identity
  returns `R`.
- `g(1/2) = 11/16`. The cubic orbit from `√3` is `√3, 0, 0, …`, while the orbit from the
  real root `s ≈ 2.196` of `s³ − 3s − 4` is `s, −2, 1, 1, …`: convergence on `(0, √3)` is not
  the whole story above `√3`.
- `m(1/2) = 1.188859375`. For `A = 1` on `ℝ²`, `muonDirection 5 A` is
  `m^[5](1/√2) • 1`, a multiple of the identity in `J` but not the identity.
- For `s = 1/270`, `m^[5] s ∈ J`; for `s = 1/1000`, `K(s) = 7`.

## Dependencies and order

Layer 1 uses PolarDecomposition and Majorization. 1.4 also uses `cfc`. Layer 2 uses Layer 1
and Fan dominance. Layer 3 uses 1.3 and `cfc`. Layer 4 is real analysis on polynomials and
uses nothing above it. Layer 5 uses Layers 1, 3 and 4. Layer 6 uses all of them.

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
- N. J. Higham, *Functions of Matrices: Theory and Computation*, SIAM, 2008, Chapter 8.
- Å. Björck and C. Bowie, *An iterative algorithm for computing the best estimate of an
  orthogonal matrix*, SIAM J. Numer. Anal. **8** (1971), 358–364.
- K. Fan and A. J. Hoffman, *Some metric inequalities in the space of matrices*, Proc. Amer.
  Math. Soc. **6** (1955), 111–116.
- L. Mirsky, *Symmetric gauge functions and unitarily invariant norms*, Quart. J. Math. **11**
  (1960), 50–59.
- R. A. Horn and C. R. Johnson, *Topics in Matrix Analysis*, Cambridge University Press, 1991,
  Chapter 3 (singular value inequalities, including Mirsky's).

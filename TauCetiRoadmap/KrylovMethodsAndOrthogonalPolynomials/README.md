# Roadmap: Krylov methods and orthogonal polynomials

**Summary.** A Hermitian matrix `A` and a vector `b` define a finite measure on the real line, the
spectral measure `μ`: the mass `|⟨u, b⟩|²` at each eigenvalue, summed over an orthonormal
eigenbasis, so that `b* p(A) b = ∫ p dμ` for every real polynomial `p`. Through `μ` the Krylov
spaces of `(A, b)` become spaces of polynomials, and Lanczos, conjugate gradients and Chebyshev
iteration become statements about the orthogonal polynomials of a measure with finitely many atoms.
Matrices may have size zero and `b` may be `0` unless a statement says otherwise.

The first main theorem is that Lanczos is the Stieltjes procedure of `μ`. The Lanczos vectors are
the orthonormal polynomials of `μ` applied to `b`. Let `g`, the grade of `b`, be the number of atoms
of `μ`, the dimension of the largest Krylov space. For `1 ≤ k ≤ g` the Lanczos matrix `T_k` is the
Jacobi matrix of `μ`, its eigenvalues are the zeros of the monic orthogonal polynomial of degree
`k`, and `b* q(A) b = ‖b‖² q(T_k)₀₀` for every real `q` of degree below `2k`: Lanczos computes the
`k`-point Gauss rule of `μ`.

The second is conjugate gradients read through Lanczos. For positive definite `A` and `k` at most
the grade of the initial residual, the `k`-th residual is the monic orthogonal polynomial of degree
`k` of its spectral measure, applied to it and normalized to `1` at `0`, and the squared energy norm
of the error is the error of the Gauss rule for `1/λ`. The Hestenes–Stiefel recurrence produces the
iterates at every step.

The third is about worst cases. If the initial error lives on `k + 1` positive eigenvalues
`t₀ < ⋯ < t_k` with explicit weights, every method with iterates in the Krylov spaces has energy
error at least `V(t) = (Σ_l ∏_(j≠l) t_j/|t_j − t_l|)⁻¹` times the initial one after `k` steps, and
conjugate gradients attains it. At the Chebyshev points of `[α, β]`, `V(t)` is
`1/T_k((β + α)/(β − α))`, so the classical bound for conjugate gradients is sharp up to a factor
`2`, and the heavy-ball rate on quadratics cannot be improved uniformly in the dimension. On a
nonempty index set the largest error ratio of conjugate gradients is the least maximum of `|p|` on
the spectrum over real `p` of degree at most `k` with `p(0) = 1` (Greenbaum).

The roadmap builds on SpecialFunctionsOrthogonalPolynomialsGeneral (orthogonal polynomials, Jacobi
matrices, J-fractions and Christoffel numbers of a measure), on IterativeMethodsForLinearSystems
(Krylov spaces, conjugate gradient iterates, Chebyshev residual polynomials), on
HankelFormsAndRealMomentProblems (ranks of moment matrices), on EigenvalueIterations (the
Kato–Temple bound) and on FirstOrderOptimization (the heavy-ball method).

Layer 1 defines the spectral measure and counts the grade; Layer 2 identifies Lanczos with the
orthogonal polynomials, Gauss rule and J-fraction of `μ`; Layer 3 reads conjugate gradients through
Layer 2; Layer 4 proves lower bounds, the worst-case theorem, a bound with outlying eigenvalues and
the passage from Chebyshev iteration to the heavy-ball method; Layer 5 bounds Ritz values.

## Conventions

- **Matrices and vectors.** `ι` is a finite index type, possibly empty, `𝕜` is `ℝ` or `ℂ` (an
  `RCLike` field), matrices are `Matrix ι ι 𝕜` acting on `ι → 𝕜` by `*ᵥ`, and `v* w` is
  `star v ⬝ᵥ w`. `A⁻¹` is Mathlib's inverse (junk `0` for a singular matrix). The energy norm is
  IterativeMethodsForLinearSystems's `energyNorm W v = √(Re (v* W v))`; `energyNorm 1` is the
  Euclidean norm `‖v‖`. The norm `‖b‖` written in prose is always this Euclidean norm (Mathlib's
  norm on `ι → 𝕜` is the sup norm, and no statement uses it).
- **Polynomials.** Real polynomials `p : ℝ[X]` act on a matrix over `𝕜` by `aeval A p` (a matrix
  over `𝕜` is an `ℝ`-algebra), so the polynomials of SpecialFunctionsOrthogonalPolynomialsGeneral
  apply verbatim. The polynomials of IterativeMethodsForLinearSystems's optimality statements are in
  `𝕜[X]`; for a real point `t` and `p ∈ 𝕜[X]`, the real polynomial `Re p` (real parts of the
  coefficients) has `Re p(0) = Re (p(0))` and `|Re p(t)| ≤ |p(t)|`.
- **The spectral measure** of a Hermitian `A` and `b` is `spectralMeasure hA b` (1.1), built from
  Mathlib's eigenbasis `hA.eigenvectorBasis` and eigenvalues `hA.eigenvalues`; by 1.1 its integrals
  of polynomials are `b* p(A) b`, so it depends only on `A` and `b`. Repeated eigenvalues give one
  atom, and eigencomponents of `b` that vanish give none. `μ(ℝ) = ‖b‖²`.
- **Grade.** The grade of `b` is `g = |supp μ|` (`μ.support.ncard`); 1.1 proves that it is the
  dimension of `K_n(A, b)`, `n = |ι|` (IterativeMethodsForLinearSystems's grade). `K_k(A, b)` is
  `krylov A b k`, with `K_0 = 0`.
- **Orthogonal polynomials of μ.** `monic μ n`, `orthonormal μ n`, `alpha μ n = α_n`,
  `beta μ n = β_n` (with `β_0 = 0`), `normSq μ (monic μ) n = h_n`, `zeros μ n`,
  `christoffelNumber μ n` are SpecialFunctionsOrthogonalPolynomialsGeneral's definitions, copied
  verbatim. They are total: they are defined for every measure, with Lean's `x/0 = 0`. Past the
  grade they take junk values, which this roadmap computes (2.1): `h_n = 0`, `α_n = 0` and `β_n = 0`
  for every `n ≥ g`, and `orthonormal μ n = 0`. The Jacobi matrix of `μ` of size `k` is
  `jacobiMatrix (fun i ↦ √β_(i+1)) α (fun i ↦ √β_i) k`, the symmetric matrix with `α_0, …, α_(k−1)`
  on the diagonal and `√β_1, …, √β_(k−1)` beside it (the triple of
  SpecialFunctionsOrthogonalPolynomialsGeneral's
  `TauCetiRoadmap.SpecialFunctionsOrthogonalPolynomialsGeneral.moment_eq_jacobiMatrix_pow`).
- **Lanczos.** `q_j = lanczosVec A b j` (2.1) is Mathlib's `gramSchmidtNormed` of the vectors
  `A^j b`; it is `0` when `A^j b` depends on the earlier ones, that is for `j ≥ g`. The Lanczos
  matrix is `T_k = lanczosMatrix A b k = (q_i* A q_j)_(i,j<k)`. Lanczos is not defined by its
  three-term recurrence, which would divide by `β_g = 0`; the recurrence is a theorem (2.1).
- **Conjugate gradients.** `IsCGIterate A b x₀ k x` (IterativeMethodsForLinearSystems 4.2): `x`
  minimizes the energy norm of the error over `x₀ + K_k(A, r₀)`, `r₀ = b − A x₀`. Errors are
  `e_k = x_k − A⁻¹ b` and residuals `r_k = b − A x_k`. For positive definite `A`, `r_k = −A e_k`,
  and the spectral measures of `r₀` and of `e₀` have the same atoms.
- **Chebyshev data.** For `0 < α < β`: `σ = (β + α)/(β − α) > 1`, `κ = β/α`,
  `q = (√κ − 1)/(√κ + 1) = (√β − √α)/(√β + √α)`, `γ = 2/(α + β)`, and `T_k` is Mathlib's
  `Polynomial.Chebyshev.T ℝ k`. The Chebyshev extremal points of `[−1, 1]` are Mathlib's
  `Polynomial.Chebyshev.node k l = cos(lπ/k)`.
- "Proved here" below means that the route is written out in full in this README and was checked on
  exact examples; it claims no novelty.

## Layer 1: the spectral measure of a matrix and a vector

### 1.1 The spectral measure and the grade

Define, for `hA : A.IsHermitian`, `spectralMeasure hA b = Σ_i ofReal(|c_i|²) • δ_(λ_i)`, where
`λ_i = hA.eigenvalues i` and `c_i = (hA.eigenvectorBasis.repr b) i = ⟨u_i, b⟩`. Prove
`spectralMeasure_spec`:

- **moments**: `(p(A) b)* (q(A) b) = ∫ p q dμ` (that is `pairing μ p q`, cast to `𝕜`) for all real
  polynomials `p`, `q`; in particular `b* A^j b = ∫ x^j dμ` and `μ(ℝ) = ‖b‖²`, and every power `x^j`
  is `μ`-integrable;
- **support**: `supp μ` is the set of real `t` for which some `v` with `A v = t v` has `v* b ≠ 0`,
  the eigenvalues whose eigenspace is not orthogonal to `b`; it is finite;
- **grade**: `dim K_k(A, b) = min(k, |supp μ|)` for every `k`; so the grade of `b` is `|supp μ|`;
- **spectral bound**: if `|p(t)| ≤ M` at every point of `supp μ`, then `‖p(A) b‖ ≤ M ‖b‖`, and, for
  positive semidefinite `A`, `‖p(A) b‖_A ≤ M ‖b‖_A`.

For `𝕜 = ℂ`, prove also `spectralMeasure_eq_map_diagMeasure`: `spectralMeasure hA b` is the image
under `z ↦ Re z` of Tau Ceti's diagonal measure `(Matrix.toEuclideanCLM A).diagMeasure b`, the
finite measure on the spectrum of the operator in `ℂ` with `∫ f dμ_b = ⟪b, f(a) b⟫`. The operator
is normal because `A` is Hermitian (`Matrix.isHermitian_iff_isSelfAdjoint`,
`IsSelfAdjoint.isStarNormal`); the Lean statement takes this normality as an instance argument.

Route. Write `b = Σ c_i u_i`. Since `A u_i = λ_i u_i` (Mathlib
`Matrix.IsHermitian.mulVec_eigenvectorBasis`), `p(A) b = Σ c_i p(λ_i) u_i` with `p(λ_i)` real, and
orthonormality gives `(p(A)b)*(q(A)b) = Σ |c_i|² p(λ_i) q(λ_i) = ∫ p q dμ`. `μ` is a finite sum of
Dirac masses, so it is finite and every measurable function is integrable. The atom at `t` has mass
`Σ_(λ_i = t) |c_i|²`, which is the squared norm of the projection `P_t b` of `b` on the eigenspace
of `t`; it is positive exactly when `P_t b ≠ 0`, and then `v = P_t b` has `v* b ≠ 0`; conversely an
eigenvector `v` of `t` with `v* b ≠ 0` is a combination of the `u_i` with `λ_i = t`, so some such
`c_i` is nonzero. For the grade, let `G` be the Gram matrix of the vectors `A^i b`, `i < k`; its
entries are `b* A^(i+j) b = m_(i+j)` with `m_j = ∫ x^j dμ`, so `G` is the Hankel matrix
`hankelSection m k` of HankelFormsAndRealMomentProblems 1.1, cast to `𝕜`. The dimension of `K_k` is
the rank of the matrix `W` with these columns (`Matrix.rank_eq_finrank_span_cols`), which is the
rank of `G = Wᴴ W` (`Matrix.rank_conjTranspose_mul_self`). A real matrix has the same rank over `𝕜`:
the real and imaginary parts of a vector in its kernel over `ℂ` lie in its real kernel, so the two
kernels have the same dimension. Since `μ` represents `m` up to every degree (the moment bullet),
the rank of `hankelSection m (n + 1)` is `min(n + 1, |supp μ|)` by HankelFormsAndRealMomentProblems
1.2 `rank_hankelSection_eq_min` (applied with `k = n + 1`; for `k = 0` both sides are `0`). The
grade is `min(|ι|, |supp μ|) = |supp μ|`, as the support consists of eigenvalues. The spectral
bound: `‖p(A) b‖² = ∫ p² dμ ≤ M² μ(ℝ)`, and `‖p(A) b‖_A² = ∫ x p(x)² dμ ≤ M² ∫ x dμ = M² ‖b‖_A²`
because `x ≥ 0` on the support when `A` is positive semidefinite. (Proved here; the dimension
formula `min(k, g)` without the count of the support is IterativeMethodsForLinearSystems 4.1.)
*Comparison.* Let `a = Matrix.toEuclideanCLM A` and `ν` the image of `μ_b = a.diagMeasure b`
under `z ↦ Re z`, a continuous map, so `ν` is a finite measure on `ℝ`. For a real polynomial `p`,
`∫ p dν = ∫ p(Re z) dμ_b = ⟪b, cfc (p ∘ Re) a b⟫` (`MeasureTheory.integral_map`,
`ContinuousLinearMap.integral_diagMeasure_eq_inner_cfc`). The spectrum of `a` is that of `A`
(`AlgEquiv.spectrum_eq`, `Matrix.toEuclideanCLM` being a star-algebra isomorphism), which is the
set of eigenvalues (`Matrix.IsHermitian.spectrum_eq_image_range`), all real; on it `p ∘ Re` agrees
with `z ↦ p(z)`, so `cfc (p ∘ Re) a = p(a)` (`cfc_congr`, `cfc_polynomial`) and
`∫ p dν = b* p(A) b = ∫ p dμ` by the moment bullet. Both measures are carried by the finite set `S`
of eigenvalues (`ν(ℝ ∖ S)` is `μ_b` of the empty set), and two finite measures carried by `S`
with the same polynomial integrals are equal: the Lagrange polynomial of `t ∈ S` on `S` gives the
mass at `t`. For `b = 0` both measures are `0` (`μ_b(ℝ) = ‖b‖²`,
`ContinuousLinearMap.diagMeasure_real_univ`), and for empty `ι` the space is `0`, the spectrum is
empty and both are `0`; the diagonal measure needs only completeness, which a finite-dimensional
space has, and normality.

*Needs:* HankelFormsAndRealMomentProblems 1.1 (`hankelSection`) and 1.2
(`rank_hankelSection_eq_min`, `RepresentsUpTo`); SpecialFunctionsOrthogonalPolynomialsGeneral 2.1
(`pairing`); IterativeMethodsForLinearSystems 3.4 and 4.1 (`energyNorm`, `krylov`); Mathlib
`Matrix.IsHermitian.eigenvectorBasis`, `Matrix.IsHermitian.mulVec_eigenvectorBasis`,
`Matrix.rank_eq_finrank_span_cols`, `Matrix.rank_conjTranspose_mul_self`,
`MeasureTheory.Measure.support`, `MeasureTheory.Measure.dirac`; for the comparison, Tau Ceti
`ContinuousLinearMap.diagMeasure`, `ContinuousLinearMap.integral_diagMeasure_eq_inner_cfc`,
`ContinuousLinearMap.diagMeasure_real_univ`, and Mathlib `Matrix.toEuclideanCLM`,
`AlgEquiv.spectrum_eq`, `Matrix.IsHermitian.spectrum_eq_image_range`, `cfc_congr`,
`cfc_polynomial`, `MeasureTheory.integral_map`, `Lagrange.basis`.

**Checks.**
- `A = diag(1, 2, 4)`, `b = (1, 1, 1)`: `μ = δ₁ + δ₂ + δ₄`, moments `3, 7, 21, 73`, grade `3`. The
  diagonal measure has mass `⟪b, P_t b⟫ = 1` at each `t ∈ {1, 2, 4}` (`P_t` the coordinate
  projection), so its image under `z ↦ Re z` is also `δ₁ + δ₂ + δ₄`.
- Comparison on non-diagonal complex Hermitian matrices (exact, with `P_t` the Lagrange polynomial
  of `t` on the spectrum applied to `A`): for `A = ((2, i), (−i, 2))`, `b = (1, 0)`, the eigenvalues
  are `1, 3`, both measures are `δ₁/2 + δ₃/2` and the moments are `1, 2, 5, 14`; for
  `A = ((1, 0, 0), (0, 2, i), (0, −i, 2))`, `b = (1, 1, 0)` (eigenvalue `1` twice), both are
  `(3/2)δ₁ + (1/2)δ₃`.
- `A = diag(1, 1, 2)`, `b = (1, 1, 0)`: `μ = 2δ₁`, so the grade is `1` and `dim K_k = 0, 1, 1, 1`
  for `k = 0, 1, 2, 3`. The support is not the set of eigenvalues of `A`, which is `{1, 2}`, and the
  repeated eigenvalue gives one atom, not two.
- `A = diag(−1, 0, 4)`, `b = (1, 1, 1)`: `A` is singular and indefinite, `μ = δ₋₁ + δ₀ + δ₄` and the
  grade is `3`; the moment, support and grade statements need only that `A` is Hermitian.
- `b = 0`, and every `b` when `ι` is empty: `μ = 0`, the support is empty and every `K_k` is `0`.
- The spectral bound for `p = 1 − x/2` on `A = diag(1, 2, 4)`, `b = (1, 1, 1)`: the values on the
  support are `1/2, 0, −1`, so `M = 1`, and `‖p(A) b‖² = 1/4 + 0 + 1 ≤ 3 = ‖b‖²`.

### 1.2 Exact termination and strict decrease of conjugate gradients

For positive definite `A`, a `k`-th conjugate gradient iterate `x` and `μ` the spectral measure of
`r₀ = b − A x₀`, prove `IsCGIterate.eq_inv_mulVec_iff`: `x = A⁻¹ b` if and only if `|supp μ| ≤ k`;
and if `k < |supp μ|`, the `(k + 1)`-th iterate has strictly smaller energy norm of the error than
the `k`-th.

Liesen–Tichý state the strict decrease up to the grade (p. 8). The direction `⇐` is
IterativeMethodsForLinearSystems 4.4 IsCGIterate.eq_of_finrank_le with 1.1.

Route. `⇒`: by IterativeMethodsForLinearSystems 4.4 IsCGIterate.polynomial_optimal,
`x − A⁻¹ b = p(A) e₀` for some `p ∈ 𝕜[X]` of degree at most `k` with `p(0) = 1`. If `x = A⁻¹ b`,
then `p(A) r₀ = −A p(A) e₀ = 0`, so `c_i p(λ_i) = 0` for every `i` (with `c_i` the components of
`r₀`): `p` vanishes on `supp μ`. As `p ≠ 0`, `|supp μ| ≤ natDegree p ≤ k`
(`Polynomial.card_roots'`). Strict decrease: the iterates are unique
(IterativeMethodsForLinearSystems 4.2
`TauCetiRoadmap.IterativeMethodsForLinearSystems.existsUnique_isCGIterate`) and `K_k ⊆ K_(k+1)`, so
equal energy norms force `x' = x`. Then `r_k = r₀ − A (x − x₀)` lies in `K_(k+1)` (as
`A K_k ⊆ K_(k+1)`) and is orthogonal to `K_(k+1)` by the Galerkin condition at `k + 1`
(IterativeMethodsForLinearSystems 4.2
`TauCetiRoadmap.IterativeMethodsForLinearSystems.isCGIterate_iff`); hence `r_k = 0`, `x = A⁻¹ b`,
and `|supp μ| ≤ k` by `⇒`, a contradiction. The non-strict inequality is the minimality at `k + 1`.

*Needs:* 1.1; IterativeMethodsForLinearSystems 4.2 (`IsCGIterate`,
`TauCetiRoadmap.IterativeMethodsForLinearSystems.existsUnique_isCGIterate`,
`TauCetiRoadmap.IterativeMethodsForLinearSystems.isCGIterate_iff`) and 4.4
(IsCGIterate.polynomial_optimal, IsCGIterate.eq_of_finrank_le); Mathlib `Polynomial.card_roots'`.
(Liesen–Tichý, p. 8; the characterization through the support is proved here.)

**Checks.**
- `A = diag(1, 2)`, `b = (1, 1)`, `x₀ = 0` (the example of IterativeMethodsForLinearSystems 4.2):
  `μ = δ₁ + δ₂`, so `x₁ = (2/3, 2/3) ≠ A⁻¹ b` and `x₂ = A⁻¹ b`; `‖e₀‖_A² = 3/2 > ‖e₁‖_A² = 1/6 > 0`.
- `A = 2I` of size `3`, `b = (1, 0, 2)`, `x₀ = 0`: `μ = 5δ₂`, the grade is `1` and `x₁ = b/2`.
- `x₀ = A⁻¹ b`: `μ = 0`, and every iterate is `A⁻¹ b`, including the `0`-th.

### Examples

- For `A = diag(1, 2, 4)` and `b = (1, 1, 1)` the three Krylov dimensions, the three atoms and the
  three conjugate gradient steps to the solution from `x₀ = 0` agree.

### Dependencies

1.1: HankelFormsAndRealMomentProblems 1.1–1.2, SpecialFunctionsOrthogonalPolynomialsGeneral 2.1,
IterativeMethodsForLinearSystems 3.4 and 4.1, Mathlib, Tau Ceti (the comparison). 1.2: 1.1,
IterativeMethodsForLinearSystems 4.2 and 4.4.

## Layer 2: Lanczos vectors, Jacobi matrices and Gauss quadrature

Throughout, `hA : A.IsHermitian`, `μ = spectralMeasure hA b` and `g = |supp μ|`.

### 2.1 Lanczos is the Stieltjes procedure of the spectral measure

Define `lanczosVec A b j` and `lanczosMatrix A b k` as in the Conventions. Prove `lanczos_spec`:

- **(a)** `q_j = orthonormal μ j (A) b` for every `j`;
- **(b)** the Lanczos relation `A q_j = √β_(j+1) q_(j+1) + α_j q_j + √β_j q_(j−1)` for every `j` (at
  `j = 0` the last term is `0`, as `β_0 = 0`; past the grade both sides are `0`);
- **(c)** `β_(i+1) > 0` for `i + 1 < g`, and `β_g = 0`;
- **(d)** for `k ≤ g`, `T_k` is the Jacobi matrix of `μ` of size `k`, cast to `𝕜`, and its
  characteristic polynomial is `monic μ k`.

Saad observes that the Lanczos recurrence is the Stieltjes procedure for the orthogonal polynomials
of the inner product `⟨p, q⟩ = (p(A)v₁)*(q(A)v₁)` and that the characteristic polynomial of the
tridiagonal matrix is the monic polynomial of least norm (§6.6.2, p. 195, without proof).
Meurant–Strakoš, (2.4)–(2.5), pp. 480–482, and Hestenes–Stiefel, §14, pp. 427–429, write the measure
for distinct eigenvalues and a starting vector with no vanishing eigencomponent. The statement for
repeated eigenvalues, vanishing components and every index, including the junk values past the
grade, is proved here.

Route. *Gram–Schmidt commutes with the isometry.* By 1.1, `p ↦ p(A) b` preserves the pairings:
`(p(A)b)*(q(A)b) = ⟨p, q⟩_μ`. Mathlib's Gram–Schmidt is
`gs_n = f_n − Σ_(i<n) (⟨gs_i, f_n⟩/‖gs_i‖²) gs_i` (`InnerProductSpace.gramSchmidt_def` with
`Submodule.starProjection_singleton`, the coefficient being `0` when `gs_i = 0`), and
SpecialFunctionsOrthogonalPolynomialsGeneral's `monic μ n` is
`Xⁿ − Σ_(k<n) (⟨Xⁿ, monic μ k⟩/⟨monic μ k, monic μ k⟩) monic μ k`, the coefficient being `0` when
the denominator is. By strong induction, `gs_n = monic μ n (A) b` for every `n`: the coefficients
agree, denominators included, by the pairing identity. Normalizing, `‖gs_n‖ = √h_n` and
`q_n = gs_n/‖gs_n‖ = orthonormal μ n (A) b` (both sides `0` when `h_n = 0`, since `(√0)⁻¹ = 0`);
this is (a). *Below and past the grade.* For `n < g`, `monic μ n` has degree `n < g` and is monic,
so it does not vanish on the `g` points of the support and `h_n > 0`. For `n ≥ g`,
`A^n b ∈ K_g = K_n` (1.1), so `gs_n = 0` (its span with the earlier `gs_i` is that of the earlier
`f_i`, `InnerProductSpace.span_gramSchmidt_Iio`); hence `h_n = ‖gs_n‖² = 0`, `α_n = h̃_n/h_n = 0`,
`β_n = 0` and `orthonormal μ n = 0`. This gives (c), and also `β_(i+1) = h_(i+1)/h_i > 0` for
`i + 1 < g`. *The finite three-term recurrence.* Orthogonality: for `n < g`, `⟨monic μ n, r⟩_μ = 0`
whenever `deg r < n` (SpecialFunctionsOrthogonalPolynomialsGeneral 2.2
`TauCetiRoadmap.SpecialFunctionsOrthogonalPolynomialsGeneral.pairing_monic_eq_zero`, with
`n < |supp μ|`); for `n = g`, `monic μ g` vanishes on the support
(SpecialFunctionsOrthogonalPolynomialsGeneral 2.2
`TauCetiRoadmap.SpecialFunctionsOrthogonalPolynomialsGeneral.eval_monic_eq_zero_of_mem_support` with
`N + 1 = g`), so the same holds. For `1 ≤ j + 1 ≤ g` put
`D = X·monic μ j − monic μ (j+1) − α_j monic μ j − β_j monic μ (j−1)` (the last term absent for
`j = 0`). It has degree at most `j`
(`TauCetiRoadmap.SpecialFunctionsOrthogonalPolynomialsGeneral.monic_monic`), and
`⟨D, monic μ i⟩ = 0` for every `i ≤ j`: for `i ≤ j − 2` because `X·monic μ i` has degree below `j`;
for `i = j` by the definition of `α_j = ⟨X m_j, m_j⟩/h_j`; for `i = j − 1` because
`⟨X m_j, m_(j−1)⟩ = ⟨m_j, X m_(j−1)⟩ = h_j = β_j h_(j−1)`. As `monic μ 0, …, monic μ j` span the
polynomials of degree at most `j`, `⟨D, D⟩ = 0`, so `D` vanishes on `g > j` points and `D = 0`:
`monic μ (j+1) = (X − α_j) monic μ j − β_j monic μ (j−1)` for `j + 1 ≤ g`. Dividing by `√h_j` and
applying it to `b` gives (b) for `j < g` (at `j = g − 1`, `monic μ g (A) b = 0`); for `j ≥ g` both
sides of (b) are `0`. *The Lanczos matrix.* For `i, j < k ≤ g`,
`q_i* A q_j = ⟨orthonormal μ i, X·orthonormal μ j⟩_μ` (1.1), which by the recurrence is `α_j` on the
diagonal, `√β_(j+1)` at `|i − j| = 1` and `0` otherwise: this is the Jacobi matrix, with
`a_i = √β_(i+1)` at `(i, i + 1)` and `c_(i+1) = √β_(i+1)` at `(i + 1, i)`. Its characteristic
polynomial is `monicThreeTerm α (k ↦ a_(k−1) c_k) k` (SpecialFunctionsOrthogonalPolynomialsGeneral
1.3 `TauCetiRoadmap.SpecialFunctionsOrthogonalPolynomialsGeneral.charpoly_jacobiMatrix`), with
`a_(k−1) c_k = β_k` for `k ≥ 1`, which is `monic μ k` by the finite recurrence and
SpecialFunctionsOrthogonalPolynomialsGeneral 1.1's definition of `monicThreeTerm`.

*Needs:* 1.1; SpecialFunctionsOrthogonalPolynomialsGeneral 1.1 (`monicThreeTerm`), 1.3
(`jacobiMatrix`,
`TauCetiRoadmap.SpecialFunctionsOrthogonalPolynomialsGeneral.charpoly_jacobiMatrix`), 2.2 (`monic`,
`TauCetiRoadmap.SpecialFunctionsOrthogonalPolynomialsGeneral.monic_monic`,
`TauCetiRoadmap.SpecialFunctionsOrthogonalPolynomialsGeneral.pairing_monic_eq_zero`,
`TauCetiRoadmap.SpecialFunctionsOrthogonalPolynomialsGeneral.eval_monic_eq_zero_of_mem_support`),
2.3 (`normSq`, `normSqX`, `orthonormal`), 3.1 (`recB`), 3.3 (`alpha`, `beta`); Mathlib
`InnerProductSpace.gramSchmidtNormed`, `InnerProductSpace.gramSchmidt_def`,
`Submodule.starProjection_singleton`, `InnerProductSpace.span_gramSchmidt_Iio`. (Saad, §6.6.2, p.
195; Meurant–Strakoš, (2.4)–(2.5), pp. 480–482; proved here in this generality.)

**Checks.**
- `A = diag(1, 2, 4)`, `b = (1, 1, 1)`: `monic μ 1 = X − 7/3`, `monic μ 2 = X² − (36/7) X + 5`,
  `monic μ 3 = (X − 1)(X − 2)(X − 4)`; `α = 7/3, 59/21, 13/7`, `β_1 = 14/9`, `β_2 = 27/49`,
  `β_3 = 0`, `h = 3, 14/3, 18/7, 0`. The Lanczos matrices of sizes `1, 2, 3` (computed from the
  Gram–Schmidt vectors, and on `H diag(1, 2, 4) H` with `b = H (1, 1, 1)` for a rational
  Householder reflection `H`, which has the same spectral measure) equal these Jacobi matrices
  exactly.
- `A = diag(1, 1, 2, 4)` conjugated by a rational Householder reflection, `b` with a component in
  each eigenspace: grade `3`, the relation (b) holds for `j = 0, …, 5`, with `q_3 = q_4 = q_5 = 0`.
- (d) needs `k ≤ g`: for `A = (3)` of size `1` and `b = (2)`, `μ = 4δ₃` and `g = 1`; the Lanczos
  matrix of size `2` is `diag(3, 0)` (still the Jacobi matrix, all junk coefficients being `0`),
  with characteristic polynomial `X² − 3X`, while `monic μ 2 = X² − 9`.
- The triple matters: `jacobiMatrix (fun i ↦ √β_i) α (fun i ↦ √β_(i+1)) k` would put `√β_0 = 0`
  at `(0, 1)` and `√β_2` at `(1, 0)`, a matrix that is not even symmetric.

### 2.2 The Ritz values

Prove `monic_roots_spectralMeasure`: for `k ≤ g`, `monic μ k` has `k` distinct real roots (the
eigenvalues of `T_k`, by 2.1(d), the Ritz values); and for `k < g` each root `θ` lies strictly
between two points of the support, `min supp μ < θ < max supp μ`. For `k = g` the roots are the
points of the support (SpecialFunctionsOrthogonalPolynomialsGeneral 2.2
`TauCetiRoadmap.SpecialFunctionsOrthogonalPolynomialsGeneral.eval_monic_eq_zero_of_mem_support`, `g`
roots of a monic polynomial of degree `g`).

SpecialFunctionsOrthogonalPolynomialsGeneral 5.1
(`TauCetiRoadmap.SpecialFunctionsOrthogonalPolynomialsGeneral.zeros_spec`,
`TauCetiRoadmap.SpecialFunctionsOrthogonalPolynomialsGeneral.zeros_mem_Ioo`) states these facts for
a measure with infinite support; the route below is an orthogonality argument of the same kind,
written for a support of `g ≥ k` points.

Route. Let `p = monic μ k`; `⟨p, r⟩_μ = 0` for `deg r < k` (2.1's orthogonality, valid for `k ≤ g`).
*Real roots.* If `θ` is a non-real root, `r = p/((X − θ)(X − θ̄))` is real of degree `k − 2` and
`0 = ⟨p, r⟩ = ∫ r(x)² |x − θ|² dμ`, so `r` vanishes on `g ≥ k > k − 2` points and `r = 0`,
impossible. *Simple roots.* If `θ` is a double real root, `r = p/(X − θ)²` gives
`0 = ∫ r² (x − θ)² dμ`, so `r` vanishes on the at least `g − 1 ≥ k − 1` points of the support other
than `θ`, and `r = 0`, impossible. Hence `p` has `k` distinct real roots (`Polynomial.card_roots'`
and splitting over `ℝ`). *Location for `k < g`.* For a root `θ`, put `ℓ = p/(X − θ)`, monic of
degree `k − 1`. Then `0 = ⟨p, ℓ⟩ = ∫ ℓ(x)² (x − θ) dμ`. If `θ ≤ min supp μ`, every term
`ℓ(s)² (s − θ)`, `s ∈ supp μ`, is `≥ 0`, so all vanish, and `ℓ` vanishes on the at least `g − 1 ≥ k`
points of the support other than `θ`: `ℓ = 0`, impossible. The case `θ ≥ max supp μ` is symmetric.

*Needs:* 2.1; SpecialFunctionsOrthogonalPolynomialsGeneral 2.2
(`TauCetiRoadmap.SpecialFunctionsOrthogonalPolynomialsGeneral.monic_monic`,
`TauCetiRoadmap.SpecialFunctionsOrthogonalPolynomialsGeneral.pairing_monic_eq_zero`,
`TauCetiRoadmap.SpecialFunctionsOrthogonalPolynomialsGeneral.eval_monic_eq_zero_of_mem_support`);
Mathlib `Polynomial.roots`, `Polynomial.card_roots'`. (Proved here.)

**Checks.**
- `A = diag(1, 2, 4)`, `b = (1, 1, 1)`: the Ritz values are `7/3` (`k = 1`), the roots
  `(18 ± √79)/7 ≈ 1.3017, 3.8412` of `7x² − 36x + 35` (`k = 2`, both in `(1, 4)`), and `1, 2, 4`
  (`k = 3`).
- Strictness fails at `k = g`: there the extreme Ritz values are `min supp μ` and `max supp μ`.

### 2.3 Lanczos is Gauss quadrature

For `1 ≤ k ≤ g`, prove `lanczos_gauss`:

- `b* q(A) b = (b* b) · q(T_k)₀₀` for every real `q` of degree below `2k`;
- the Christoffel numbers `w_i = christoffelNumber μ k i` are positive, and
  `∫ q dμ = Σ_i w_i q(θ_i)` for every real `q` of degree below `2k`, where `θ_i = zeros μ k i` are
  the Ritz values in increasing order;
- for `k = g`, the Gauss measure `Σ_i w_i δ_(θ_i)` is `μ` itself.

Meurant–Strakoš, Theorem 2.1, p. 482, and Hestenes–Stiefel, (14:4), p. 428, state the Gauss property
for distinct eigenvalues and a full grade; SpecialFunctionsOrthogonalPolynomialsGeneral 5.3
(`TauCetiRoadmap.SpecialFunctionsOrthogonalPolynomialsGeneral.gauss_quadrature`,
`TauCetiRoadmap.SpecialFunctionsOrthogonalPolynomialsGeneral.moment_eq_jacobiMatrix_pow`) states it
for a measure with infinite support, and its 7.1 for the functional of a recurrence with every
`β_(n+1) > 0`. The statement for the spectral measure, with `k ≤ g` and
repeated eigenvalues, is proved here.

Route. *Moments.* Let `Q` be the matrix with columns `q_0, …, q_(k−1)`, orthonormal as `k ≤ g`
(Mathlib `InnerProductSpace.gramSchmidtNormed_orthonormal'` and 2.1), so `Q* Q = 1` and
`Q* A Q = T_k`. By 2.1(b), `A Q = Q T_k + √β_k q_k e_(k−1)ᵀ`. Since `T_k` is tridiagonal,
`T_k^j e_0` vanishes in coordinate `k − 1` for `j < k − 1`, so induction gives
`A^j q_0 = Q T_k^j e_0` for `j ≤ k − 1`, with `q_0 = b/‖b‖`. Write a degree `m ≤ 2k − 1` as
`i + ε + j` with `i, j ≤ k − 1`, `ε ∈ {0, 1}`; then
`b* A^m b = ‖b‖² (Q T^i e_0)* A^ε (Q T^j e_0) = ‖b‖² (T^(i+ε+j))₀₀`, using `Q* Q = 1` and
`Q* A Q = T_k`. *Gauss rule.* `T_k` is a real symmetric matrix (2.1(d)) with the simple eigenvalues
`θ_i` (2.2) and an orthonormal eigenbasis `s_i`; then `q(T_k)₀₀ = Σ_i (s_i)_0² q(θ_i)`, and with 1.1
`∫ q dμ = Σ_i ω_i q(θ_i)`, `ω_i = ‖b‖² (s_i)_0²`, for degree below `2k`. Apply this to the Lagrange
polynomial `ℓ_i = monic μ k /ₘ (X − θ_i) / monic′ μ k (θ_i)` of degree `k − 1`, which is `1` at
`θ_i` and `0` at the other Ritz values: `ω_i = ∫ ℓ_i dμ = w_i`,
SpecialFunctionsOrthogonalPolynomialsGeneral's Christoffel number. Positivity: `ℓ_i²` has degree
`2k − 2`, so `w_i = Σ_j w_j ℓ_i(θ_j)² = ∫ ℓ_i² dμ > 0`, as `ℓ_i ≠ 0` has degree `k − 1 < g`. *At the
grade.* For `k = g` the `θ_i` are the points of the support (2.2), and for the Lagrange polynomial
`L_t` of a support point `t` (degree `g − 1 ≤ 2g − 1`) the rule gives `μ{t} = ∫ L_t dμ = w_i` at
`θ_i = t`; two finite measures on the same finite set with the same masses are equal.

*Needs:* 2.1, 2.2, 1.1; SpecialFunctionsOrthogonalPolynomialsGeneral 5.1 (`zeros`) and 5.3
(`christoffelNumber`); Mathlib `InnerProductSpace.gramSchmidtNormed_orthonormal'`,
`Matrix.IsHermitian.spectral_theorem`, `Lagrange.basis`. (Meurant–Strakoš, Theorem 2.1, p. 482;
Hestenes–Stiefel, (14:4), p. 428; proved here in this generality.)

**Checks.**
- `A = diag(1, 2, 4)`, `b = (1, 1, 1)` (moments `3, 7, 21, 73, 273`): for `k = 1`,
  `3 (T_1^j)₀₀ = 3, 7, 49/3` for `j = 0, 1, 2`, exact to degree `1` and wrong at degree `2 = 2k`;
  for `k = 2`, `3 (T_2^j)₀₀ = 3, 7, 21, 73, 1893/7`, exact to degree `3` and wrong at degree `4`;
  for `k = 3 = g`, exact in every degree. The one-point rule is the weight `3` at `7/3`.
- The failure at degree `2k` for `k < g` is forced: `q = (monic μ k)²` has `∫ q dμ = h_k > 0` and
  vanishes at every Ritz value.
- The moment form uses `b* b`, the squared Euclidean norm. Mathlib's norm of `ι → 𝕜` is the sup
  norm, `1` for `b = (1, 1, 1)`; with it the right side at `q = X` would be `7/3`, not `b* A b = 7`.

### 2.4 The J-fraction and the Stieltjes transform

For `k ≤ g` and `z ∈ ℂ` with `monic μ k (z) ≠ 0`, prove `sum_christoffelNumber_div_eq_convs`:
`Σ_i w_i/(z − θ_i) = μ(ℝ) · F_k(z)`, where `F_k(z)` is the `k`-th convergent (`GenContFract.convs`,
the quotient of the continuants) of `jFraction α β z = 1/(z − α_0 − β_1/(z − α_1 − ⋯))` with the
coefficients of `μ`; and for `k = g` both sides equal `∫ dμ(λ)/(z − λ)`. The J-fraction of a
finitely supported measure terminates: its `g`-th convergent is exactly the normalized Stieltjes
transform.

SpecialFunctionsOrthogonalPolynomialsGeneral 9.2–9.3
(`TauCetiRoadmap.SpecialFunctionsOrthogonalPolynomialsGeneral.convs'_jFraction`,
`TauCetiRoadmap.SpecialFunctionsOrthogonalPolynomialsGeneral.markov`) state the partial-fraction
form and Markov's theorem for a measure with infinite support on a bounded interval. The finite form
here is proved here.

Route. Let `p_j = monic μ j` and `ρ_j(z) = ∫ (p_j(z) − p_j(x))/(z − x) dμ(x)`, the integral of a
polynomial in `x` of degree `j − 1`. From the finite recurrence of 2.1, for `1 ≤ j < k`,
`ρ_(j+1) = (z − α_j) ρ_j − β_j ρ_(j−1) + ∫ p_j dμ`, and `∫ p_j dμ = ⟨p_j, 1⟩ = 0` for `1 ≤ j < g`;
with `ρ_0 = 0`, `ρ_1 = μ(ℝ)`, induction gives `ρ_j = μ(ℝ) · p_j^(0)(z)` for `j ≤ k`, where `p^(0)`
is SpecialFunctionsOrthogonalPolynomialsGeneral's corecursive sequence (1.2: `p_0^(0) = 0`,
`p_1^(0) = 1`, the same recurrence). By SpecialFunctionsOrthogonalPolynomialsGeneral 1.4
`TauCetiRoadmap.SpecialFunctionsOrthogonalPolynomialsGeneral.conts_jFraction` the `k`-th continuants
are `(p_k^(0)(z), monicThreeTerm α β k (z))`, and the second is `p_k(z) ≠ 0` (2.1), so
`F_k(z) = ρ_k(z)/(μ(ℝ) p_k(z))`. Finally the Gauss rule of 2.3, applied to the real and imaginary
parts of the polynomial `x ↦ (p_k(z) − p_k(x))/(z − x)` of degree `k − 1`, gives
`ρ_k(z) = Σ_i w_i p_k(z)/(z − θ_i)`, as `p_k(θ_i) = 0` and `z ≠ θ_i`. For `k = g` the Gauss measure
is `μ` (2.3), and `z` is off the support since `p_g` vanishes there. For `k = 0` the sum is empty
and the `0`-th convergent is the head term `0` of the J-fraction (`GenContFract.zeroth_conv_eq_h`),
so both sides are `0`; if also `g = 0`, then `μ = 0` (a finite measure on `ℝ` with empty support)
and the Stieltjes transform is `0`.

Two consequences, not separate targets. For complex Hermitian `A` and `z` not an eigenvalue,
`b*(z − A)⁻¹ b = ∫ dμ(λ)/(z − λ)` by the computation of 1.1 with `(z − λ_i)⁻¹` in place of `p(λ_i)`.
For `|z|` larger than every `|t|`, `t` in the support or a Ritz value, expanding both Stieltjes
transforms in powers of `1/z`, the moments of 2.3 show that `∫ dμ/(z − λ) − Σ_i w_i/(z − θ_i)` has
no term in `z^(−j−1)` for `j < 2k`: the convergent is the Padé approximant of type `[k − 1/k]` at
infinity.

*Needs:* 2.1, 2.3; SpecialFunctionsOrthogonalPolynomialsGeneral 1.2 (the corecursive polynomials),
1.4 (`jFraction`, `TauCetiRoadmap.SpecialFunctionsOrthogonalPolynomialsGeneral.conts_jFraction`),
2.2 (`TauCetiRoadmap.SpecialFunctionsOrthogonalPolynomialsGeneral.pairing_monic_eq_zero`); Mathlib
`GenContFract.convs`, `GenContFract.zeroth_conv_eq_h`. (Proved here.)

**Checks.**
- `A = diag(1, 2, 4)`, `b = (1, 1, 1)`, `z = 3`: `∫ dμ/(z − λ) = 1/2 + 1 − 1 = 1/2`; the convergents
  give `3 F_1(3) = 3/(3 − 7/3) = 9/2`, `3 F_2(3) = −2/5` and `3 F_3(3) = 1/2` (exact, through the
  continuants and through `3 ((z − T_k)⁻¹)₀₀`).
- `F_1 = 1/(z − α_0)` and `μ(ℝ) F_1(z) = w_0/(z − θ_0)` with the single node `θ_0 = α_0`.
- `z` must avoid the Ritz values: at `z = 7/3` and `k = 1` the denominator `p_1(z)` is `0`.
- `k = 0`: `monic μ 0 = 1`, the sum is empty and `F_0 = 0`; for `b = 0` (`g = 0`) both sides of
  the second identity are `0` as well.

### Examples

- `A = diag(1, 2, 4)`, `b = (1, 1, 1)`: the measure `δ₁ + δ₂ + δ₄`, its Jacobi matrices, Ritz
  values, Gauss rules and convergents of the Checks above, with everything exact at `k = 3`.

### Dependencies

2.1: 1.1, SpecialFunctionsOrthogonalPolynomialsGeneral 1.1, 1.3, 2.2, 2.3, 3.1, 3.3. 2.2: 2.1,
SpecialFunctionsOrthogonalPolynomialsGeneral 2.2. 2.3: 1.1, 2.1, 2.2,
SpecialFunctionsOrthogonalPolynomialsGeneral 5.1, 5.3. 2.4: 2.1, 2.3,
SpecialFunctionsOrthogonalPolynomialsGeneral 1.2, 1.4, 2.2.

## Layer 3: conjugate gradients through Lanczos

Throughout, `A` is positive definite, `r₀ = b − A x₀`, `μ = spectralMeasure hA.isHermitian r₀`,
`g = |supp μ|`, and `x` is a `k`-th conjugate gradient iterate.

### 3.1 The residual polynomial and the Gauss remainder

For `k ≤ g` prove `IsCGIterate.lanczos`:

- `monic μ k (0) ≠ 0` and `r_k = monic μ k (A) r₀ / monic μ k (0)`;
- `‖e_k‖_A² = ∫ λ⁻¹ (monic μ k (λ)/monic μ k (0))² dμ`, and this is
  `∫ λ⁻¹ dμ − Σ_i w_i/θ_i`, the error of the `k`-point Gauss rule of 2.3 for `λ ↦ λ⁻¹`
  (`∫ λ⁻¹ dμ = ‖e₀‖_A²`; for `k = 0` the sum is empty);
- for `k ≥ 1`, `x − x₀ = ‖r₀‖ Σ_j (T_k⁻¹)_(j0) q_j`, with `T_k` and `q_j` the Lanczos data of
  `(A, r₀)`: the iterate is `x₀ + ‖r₀‖ Q_k T_k⁻¹ e_0`, `e_0 = (1, 0, …, 0)`.

Meurant–Strakoš, (3.1), p. 487, and Theorem 3.1, p. 492 (the product form
`‖e_k‖_A² = Σ ω_i λ_i⁻¹ ∏_l (1 − λ_i/θ_l)²`); Saad, Algorithm 6.16, p. 196 (the iterate from
Lanczos); Hestenes–Stiefel, (14:3), p. 428 (the normalization `R(0) = 1`), all for distinct
eigenvalues. The statement for every `k ≤ g` and repeated eigenvalues is proved here.

Route. *Residual.* By IterativeMethodsForLinearSystems 4.4 IsCGIterate.polynomial_optimal,
`e_k = p(A) e₀` with `p ∈ 𝕜[X]` of degree at most `k`, `p(0) = 1`; so `r_k = p(A) r₀`. Write
`p = p_R + i p_I` with real `p_R`, `p_I` (`p_I = 0` over `ℝ`). The Galerkin condition
(IterativeMethodsForLinearSystems 4.2
`TauCetiRoadmap.IterativeMethodsForLinearSystems.isCGIterate_iff`) gives `(s(A) r₀)* r_k = 0` for
every real `s` of degree below `k`, and by 1.1 this is `⟨s, p_R⟩_μ + i ⟨s, p_I⟩_μ = 0`, so both
pairings vanish. For `P ∈ {p_R, p_I}` write `P = c_P monic μ k + D` with `deg D < k`; orthogonality
of `monic μ k` to lower degrees (2.1, valid for `k ≤ g`) gives `⟨D, D⟩ = ⟨P, D⟩ = 0`, so `D`
vanishes on the support and `D = 0` (`deg D < k ≤ g`). From `p_R(0) = 1`,
`c_(p_R) monic μ k (0) = 1`, so `monic μ k (0) ≠ 0`; from `p_I(0) = 0`, `c_(p_I) = 0`. Hence
`p_R = monic μ k / monic μ k (0)`, `p_I = 0`. For `k < g` this is also
SpecialFunctionsOrthogonalPolynomialsGeneral 2.2
`TauCetiRoadmap.SpecialFunctionsOrthogonalPolynomialsGeneral.eq_monic` applied to `p_R / c_(p_R)`.
*Energy.* `‖e_k‖_A² = r_k* A⁻¹ r_k = ∫ λ⁻¹ (p_R(λ))² dμ` by the computation of 1.1 with `λ⁻¹` (the
support is positive). *Iterate and Gauss remainder.* For `1 ≤ k ≤ g`, `K_k = span (q_0, …, q_(k−1))`
(2.1), so `x − x₀ = Q y`; the Galerkin condition gives `Q* r₀ = Q* A Q y = T_k y`, and
`Q* r₀ = ‖r₀‖ e_0`, so `y = ‖r₀‖ T_k⁻¹ e_0` (`T_k = Q* A Q` is positive definite). Since `e_k` is
`A`-orthogonal to `K_k ∋ x − x₀`, `‖e₀‖_A² = ‖e_k‖_A² + ‖x − x₀‖_A² = ‖e_k‖_A² + ‖r₀‖² (T_k⁻¹)₀₀`.
With the eigenbasis of `T_k` as in 2.3, `‖r₀‖² (T_k⁻¹)₀₀ = Σ_i w_i/θ_i`. For `k = 0`,
`monic μ 0 = 1`, the sum over the nodes is empty and the Gauss-remainder identity is the energy
identity `‖e₀‖_A² = ∫ λ⁻¹ dμ`.

*Needs:* 1.1, 2.1, 2.2, 2.3; IterativeMethodsForLinearSystems 4.2
(`TauCetiRoadmap.IterativeMethodsForLinearSystems.isCGIterate_iff`) and 4.4
(IsCGIterate.polynomial_optimal); SpecialFunctionsOrthogonalPolynomialsGeneral 2.2
(`TauCetiRoadmap.SpecialFunctionsOrthogonalPolynomialsGeneral.eq_monic`,
`TauCetiRoadmap.SpecialFunctionsOrthogonalPolynomialsGeneral.pairing_monic_eq_zero`,
`TauCetiRoadmap.SpecialFunctionsOrthogonalPolynomialsGeneral.eval_monic_eq_zero_of_mem_support`).
(Meurant–Strakoš, (3.1), p. 487, Theorem 3.1, p. 492; Saad, Algorithm 6.16, p. 196;
Hestenes–Stiefel, (14:3), p. 428.)

**Checks.**
- `A = diag(1, 2)`, `b = (1, 1)`, `x₀ = 0`: `μ = δ₁ + δ₂`, `monic μ 1 = X − 3/2`, so
  `r₁ = ((−1/2)/(−3/2), (1/2)/(−3/2)) = (1/3, −1/3)`, the residual of
  IterativeMethodsForLinearSystems's example. `‖e₁‖_A² = 1·(1/3)² + (1/2)(1/3)² = 1/6`, and the
  Gauss form gives `∫ λ⁻¹ dμ − w_0/θ_0 = 3/2 − 2/(3/2) = 1/6`. At `k = 0`, `x = x₀ = 0` and
  `‖e₀‖_A² = 1 + 1/2 = 3/2 = ∫ λ⁻¹ dμ`, the empty Gauss sum.
- `k = g`: `monic μ g` vanishes on the support, so `r_g = 0`; with `A = 2I`, `g = 1` and
  `monic μ 1 = X − 2` gives `r_1 = 0`.
- Normalizing by the leading coefficient instead of the value at `0` would give `r₁ = (−1/2, 1/2)`,
  which is not `b − A x₁`.
- The cases with repeated eigenvalues, a vanishing eigencomponent and a complex Hermitian matrix
  (exact, `k ≤ g`, Hermitian `A` of sizes `1` to `4`) agree with the minimizer computed from the
  Galerkin equations.

### 3.2 The Hestenes–Stiefel recurrence

Define `hsStepSize A (x, r, p) = (r* r)(p* A p)⁻¹`, `hsStep A` mapping `(x, r, p)` to
`(x + γ p, r′, r′ + ((r′* r′)(r* r)⁻¹) p)` with `γ` the step size and `r′ = r − γ A p`, and
`hsIterate A b x₀ k = (hsStep A)^[k] (x₀, r₀, r₀)`, with Lean's inverses. Prove `hsIterate_spec`:
for every `k`,

- the first component of `hsIterate A b x₀ k` is the `k`-th conjugate gradient iterate, and the
  second is its residual;
- `‖e_k‖_A² − ‖e_(k+1)‖_A² = Re (γ_k r_k* r_k)`;
- for `k < g`, `γ_k` is a positive real number.

Hestenes–Stiefel, Theorem 6:1 and (6:1), p. 416 (the energy identity), and Meurant–Strakoš, (3.6),
p. 491. IterativeMethodsForLinearSystems leaves the equality of the recurrence with the minimizers
outside its scope. The statement for every `k`, past the grade, is proved here.

Route. Induction on `k ≤ g` with the hypotheses: `x_k − x₀ ∈ K_k`, `r_k = b − A x_k`, `r_k ⊥ K_k`,
`p_k ∈ K_(k+1)`, `p_k* A v = 0` for `v ∈ K_k`, and `p_k = r_k + δ_(k−1) p_(k−1)` for `k ≥ 1`. The
first three make `x_k` the iterate (IterativeMethodsForLinearSystems 4.2
`TauCetiRoadmap.IterativeMethodsForLinearSystems.isCGIterate_iff`). The base `k = 0` is immediate
(`K_0 = 0`, `p_0 = r_0 ∈ K_1`). Step `k → k + 1` for `k < g`: `r_k ≠ 0`, since otherwise
`x_k = A⁻¹ b` and `g ≤ k` by 1.2. Then `p_k* r_k = r_k* r_k > 0` (the term `δ p_(k−1)* r_k` vanishes
as `p_(k−1) ∈ K_k`), so `p_k ≠ 0`, `p_k* A p_k > 0` and `γ_k > 0` is real. `x_(k+1) − x₀ ∈ K_(k+1)`
and `r_(k+1) = b − A x_(k+1)`. `K_(k+1) = K_k ⊕ 𝕜 p_k` (`p_k ∉ K_k` because it is `A`-orthogonal to
`K_k` and nonzero, and `dim K_(k+1) = k + 1` by 1.1). For `v ∈ K_k`,
`v* r_(k+1) = v* r_k − γ_k (p_k* A v)‾ = 0`; and `p_k* r_(k+1) = r_k* r_k − γ_k p_k* A p_k = 0`. For
`v ∈ K_k`, `v* A p_(k+1) = (A v)* r_(k+1) + δ_k v* A p_k = 0`, as `A v ∈ K_(k+1)`; and since
`A p_k = (r_k − r_(k+1))/γ_k` and `r_k ⊥ r_(k+1)`,
`p_k* A p_(k+1) = −(r_(k+1)* r_(k+1))/γ_k + δ_k p_k* A p_k = 0`. Finally `r_(k+1)` and `p_(k+1)` lie
in `K_(k+2)`. *Energy.* `e_(k+1) = e_k + γ_k p_k` and `A e_k = −r_k`, so
`‖e_(k+1)‖_A² = ‖e_k‖_A² − 2γ_k r_k* r_k + γ_k² p_k* A p_k = ‖e_k‖_A² − γ_k r_k* r_k`. *Past the
grade.* At `k = g`, `x_g = A⁻¹ b` (1.2), so `r_g = 0`, `δ_(g−1) = 0` and `p_g = 0` (for `g = 0`,
`p_0 = r_0 = 0`). Then `γ_g = 0 · 0⁻¹ = 0`, the next state is the same with `r = p = 0`, and every
later state equals it; `A⁻¹ b` is the `k`-th iterate for `k ≥ g` (IterativeMethodsForLinearSystems
4.4 IsCGIterate.eq_of_finrank_le with 1.1), and both sides of the energy identity are `0`.

*Needs:* 1.1, 1.2; IterativeMethodsForLinearSystems 4.2
(`TauCetiRoadmap.IterativeMethodsForLinearSystems.isCGIterate_iff`) and 4.4
(IsCGIterate.eq_of_finrank_le); Mathlib `Matrix.PosDef`. (Hestenes–Stiefel, Theorem 6:1, p. 416;
Meurant–Strakoš, (3.6), p. 491; proved here for every `k`.)

**Checks.**
- `A = diag(1, 2)`, `b = (1, 1)`, `x₀ = 0`: `γ_0 = 2/3`, `x_1 = (2/3, 2/3)`, `r_1 = (1/3, −1/3)`,
  `δ_0 = 1/9`, `p_1 = (4/9, −2/9)`, `γ_1 = 3/4`, `x_2 = (1, 1/2) = A⁻¹ b`; the energy drops are
  `3/2 − 1/6 = 4/3 = γ_0 · 2` and `1/6 − 0 = γ_1 · 2/9 = (3/4)(2/9)`; then `γ_2 = 0` and the state
  stays.
- With `x₀ = A⁻¹ b` every state is `(x₀, 0, 0)` and every `γ_k = 0 · 0⁻¹ = 0`.
- Exact agreement with the Galerkin minimizer for `k = 0, …, n + 2` on Hermitian matrices of sizes
  `1` to `4`, including `A = 2I`, a repeated eigenvalue, a vanishing component and a complex
  Hermitian matrix.

### Examples

- `A = diag(1, 2)`, `b = (1, 1)`, `x₀ = 0`: the residual polynomial `1 − 2t/3` of 3.1, the
  Hestenes–Stiefel steps of 3.2 and the Galerkin minimizers coincide.

### Dependencies

3.1: 1.1, 2.1–2.3, IterativeMethodsForLinearSystems 4.2 and 4.4,
SpecialFunctionsOrthogonalPolynomialsGeneral 2.2. 3.2: 1.1, 1.2, IterativeMethodsForLinearSystems
4.2 and 4.4.

## Layer 4: lower bounds, worst cases and polynomial acceleration

Throughout, `A` is positive definite.

### 4.1 The discrete lower bound and its Chebyshev case

Let `t₀ < ⋯ < t_k` be positive, `c_l = ∏_(j≠l) (t_l − t_j)⁻¹` and
`V(t) = (Σ_l ∏_(j≠l) t_j/|t_j − t_l|)⁻¹`.

- **General points** (`le_energyNorm_of_mem_krylov`): if the spectral measure of `e₀ = x₀ − A⁻¹ b`
  is `Σ_l s |c_l| t_l⁻² δ_(t_l)` for some real `s`, then every `y` with `y − x₀ ∈ K_k(A, r₀)` has
  `‖y − A⁻¹ b‖_A ≥ V(t) ‖e₀‖_A`, and the `k`-th conjugate gradient iterate has
  `‖e_k‖_A = V(t) ‖e₀‖_A`.
- **Chebyshev points** (`exists_isCGIterate_energyNorm_eq`): for `0 < α < β` and every `k` there are
  a positive definite real `A` of size `k + 1` with spectrum in `[α, β]` and `b ≠ 0` such that, from
  `x₀ = 0`, every `y ∈ K_k(A, b)` has error at least `T_k(σ)⁻¹ ‖e₀‖_A`, the conjugate gradient
  iterate has error exactly `T_k(σ)⁻¹ ‖e₀‖_A`, and `T_k(σ)⁻¹ ≥ q^k`.

So the bound `‖e_k‖_A ≤ 2 q^k ‖e₀‖_A` of IterativeMethodsForLinearSystems 4.5 is sharp within a
factor `2` for every `k`, and every method with iterates in `x₀ + K_k` (Chebyshev iteration,
gradient descent with any step sizes, the heavy-ball method of 4.4) obeys the same lower bound on
these instances.

Meurant–Strakoš, (3.7)–(3.8), p. 492, state that the minimax value over the spectrum equals `V(μ)`
for a suitably chosen subset `μ` of `k + 1` eigenvalues and that the bound is attained for some
initial vector; Liesen–Tichý, (14) and the remark after it, p. 8, cite Greenbaum (1979) for the
sharpness. The explicit initial vector for arbitrary points and the Chebyshev case are proved here.

Route. *Krylov iterates are polynomials.* `K_k(A, r₀) = {s(A) r₀ : s ∈ 𝕜[X], deg s < k}`
(IterativeMethodsForLinearSystems 4.1, a span of the `A^i r₀`), and `r₀ = −A e₀`, so
`y − A⁻¹ b = p(A) e₀` with `p = 1 − X s`, `deg p ≤ k`, `p(0) = 1`. *An identity.* For every real `P`
of degree at most `k` with `P(0) = 1`, `Σ_l (c_l/t_l) P(t_l) = S := Σ_l c_l/t_l`: indeed `(P − 1)/X`
has degree at most `k − 1`, and `Σ_l c_l f(t_l)` is the coefficient of `x^k` in the interpolant of
`f` at the `k + 1` points (Lagrange's formula), which is `0` for a polynomial of degree below `k`.
Also `S = (−1)^k/∏ t_l` (the same coefficient for `f = 1/x`, or directly from
`1 = Σ_l ∏_(j≠l)(x − t_j)/(t_l − t_j)` at `x = 0`), and `c_l` has the sign `(−1)^(k−l)`. *Lower
bound.* By 1.1, `‖p(A) e₀‖_A² = Σ_l ν_l |p(t_l)|²` with `ν_l = s |c_l|/t_l` (for `s ≤ 0` all is
`0`), and `‖e₀‖_A² = Σ ν_l`. With `P = Re p` and Cauchy–Schwarz,
`S² = (Σ_l (c_l/t_l) P(t_l))² ≤ (Σ_l c_l²/(t_l² ν_l)) (Σ_l ν_l P(t_l)²)`, and
`Σ c_l²/(t_l² ν_l) = s⁻¹ Σ |c_l|/t_l`, `Σ ν_l = s Σ |c_l|/t_l`, so
`Σ ν_l |p(t_l)|² ≥ (S/Σ_l |c_l|/t_l)² Σ ν_l = V(t)² ‖e₀‖_A²`, since `|S|/Σ_l |c_l|/t_l = V(t)` after
multiplying numerator and denominator by `∏ t_l`. *Equality.* For every real `P` of degree at most
`k`, the identity applied to `P − P(0) + 1` gives `P(0) = Σ_l (c_l/t_l) P(t_l)/S`. So the
interpolant `p*` of the values `(−1)^l V(t)` at the `t_l` has `p*(0) = V(t) Σ_l |c_l|/t_l/|S| = 1`
(the terms `(c_l/t_l)(−1)^l` all have the sign of `(−1)^k`, as does `S`), and since `p*(t_l)` is
proportional to `c_l/(t_l ν_l)` it attains equality in Cauchy–Schwarz,
`Σ ν_l p*(t_l)² = V(t)² Σ ν_l`; with IterativeMethodsForLinearSystems 4.4
IsCGIterate.polynomial_optimal the iterate's error is at most `‖p*(A) e₀‖_A = V(t) ‖e₀‖_A`, and at
least that by the lower bound. *Chebyshev points.* Put `t_l = ((β + α) − (β − α) node k l)/2`,
increasing in `l` and in `[α, β]` (for `k = 0` take `t_0 = α`). The Chebyshev residual polynomial
`R` of IterativeMethodsForLinearSystems 3.1 has `R(t_l) = T_k(node k l)/T_k(σ) = (−1)^l/T_k(σ)`
(Mathlib `Polynomial.Chebyshev.eval_T_real_node`), so the identity gives
`(−1)^k (Σ_l |c_l|/t_l)/T_k(σ) = S = (−1)^k/∏ t_l`, that is `V(t) = T_k(σ)⁻¹`. Take
`A = diag(t_0, …, t_k)` and `b = −A e₀` with `e₀` the vector of square roots of the weights
`|c_l| t_l⁻²`; the general statement gives the first two claims. Last, `σ = cosh θ` with
`e^θ = σ + √(σ² − 1) = 1/q`, so `T_k(σ) = cosh(kθ) ≤ e^(kθ) = q^(−k)` (Mathlib
`Polynomial.Chebyshev.T_real_cosh`).

*Needs:* 1.1; IterativeMethodsForLinearSystems 3.1 (`chebyshevResidual`), 4.1 (`krylov`) and 4.4
(IsCGIterate.polynomial_optimal); Mathlib `Lagrange.basis`, `Polynomial.Chebyshev.node`,
`Polynomial.Chebyshev.eval_T_real_node`, `Polynomial.Chebyshev.T_real_cosh`. (Meurant–Strakoš,
(3.7)–(3.8), p. 492; Liesen–Tichý, p. 8; proved here.)

**Checks.**
- `t = (1, 3)`, `k = 1`: `c = (−1/2, 1/2)`, weights `(1/2, 1/18)`, `V = (3/2 + 1/2)⁻¹ = 1/2`, which
  is `1/T_1(2)` for `[α, β] = [1, 3]`; conjugate gradients from this `e₀` halves the energy norm, as
  in IterativeMethodsForLinearSystems 3.4's example.
- `[1, 3]`, `k = 2`: the Chebyshev points are `1, 2, 3`, the three products are `3, 3, 1`, and their
  sum is `7 = T_2(2)`.
- Exact minimization over all `p` of degree at most `k` with `p(0) = 1` gives `V(t)²` for
  `t = (1, 3)`, `(1, 2, 4)`, `(1/2, 1, 4, 9)`, `(2, 3, 7, 8)`, and the conjugate gradient iterate
  attains it; another admissible polynomial, `∏_(l ≥ 1)(1 − x/t_l)`, stays above it.
- `T_k(σ)⁻¹` lies between `q^k` and `2q^k` on `[1, 9]`, `[1, 4]`, `[4, 25]`, `[1, 2]` for
  `k = 1, …, 5` (Chebyshev points computed exactly).

### 4.2 Greenbaum's worst-case theorem

For `ι` nonempty and every `k`, prove `isGreatest_energyNorm_ratio`: the set of ratios
`‖e_k‖_A/‖e₀‖_A` over all `b`, `x₀` with `e₀ ≠ 0` has a greatest element `E`, and `E` is the least
`M` such that some real `p` of degree at most `k` with `p(0) = 1` has `|p(λ)| ≤ M` at every
eigenvalue `λ` of `A`.

Liesen–Tichý, (14) and p. 8, attributing the sharpness to Greenbaum (1979). Proved here, through
Sion's minimax theorem; the nonempty index type is needed, as both sets are degenerate for an empty
one (every `M` qualifies, and `e₀ ≠ 0` is impossible).

Route. Let `Λ` be the set of distinct eigenvalues, `m = |Λ| ≥ 1`, `P` the affine space of real
polynomials of degree at most `k` with `p(0) = 1` and `F(p) = max_Λ |p|`. *Upper bound.* For every
`p ∈ P`, `‖e_k‖_A ≤ ‖p(A) e₀‖_A ≤ F(p) ‖e₀‖_A` (IterativeMethodsForLinearSystems 4.4
IsCGIterate.polynomial_optimal, with `p` mapped to `𝕜[X]`, and the spectral bound of 1.1 for `e₀`).
*If `m ≤ k`*, `∏_(λ ∈ Λ)(1 − x/λ) ∈ P` vanishes on `Λ`, so `E = 0`, attained by it and by every `b`,
`x₀` with `e₀ ≠ 0`. *If `m ≥ k + 1`*, evaluation on `Λ` is injective on polynomials of degree at
most `k`, so `F` is a norm-like coercive continuous function on `P`: its least value `E` is attained
at some `p*`, and `B = {p ∈ P : F(p) ≤ E + 1}` is bounded. Identify `P` with the coefficient vectors
`(1, c_1, …, c_k)`, choose `R` with `B` inside the open ball of radius `R`, and let
`X = P ∩ closedBall(0, R)` (convex, compact, nonempty) and `Y` the probability simplex on `Λ`.
`f(p, w) = Σ_λ w_λ p(λ)²` is continuous, convex in `p` and linear in `w`, so Mathlib's
`Sion.exists_isSaddlePointOn` gives `(p_R, w_R) ∈ X × Y` with `f(p_R, w) ≤ f(p, w_R)` for all
`p ∈ X`, `w ∈ Y`. Then `max_w f(p_R, w) = F(p_R)² ≤ f(p*, w_R) ≤ F(p*)² = E²` (as `p* ∈ B ⊆ X`), so
`F(p_R) = E`, `p_R ∈ B` lies in the interior of `X` relative to `P`, and `f(p_R, w_R) = E²`. A
convex function on `P` with a local minimum at `p_R` has its global minimum there:
`min_P f(·, w_R) = E²`. Now take `e₀ = Σ_λ √(w_λ/λ) u_λ` with one unit eigenvector `u_λ` per
`λ ∈ Λ`, `b = A(x₀ − e₀)` for any `x₀` (so `‖e₀‖_A = 1`). By IterativeMethodsForLinearSystems 4.4
and 1.1, `‖e_k‖_A² = min over p ∈ 𝕜[X] admissible of Σ_λ w_λ |p(λ)|² ≥ min_P f(·, w_R) = E²`
(`Re p ∈ P`). With the upper bound the ratio of this `e₀` is `E`, the greatest.

*Needs:* 1.1; IterativeMethodsForLinearSystems 4.2 (`IsCGIterate`) and 4.4
(IsCGIterate.polynomial_optimal); Mathlib `Sion.exists_isSaddlePointOn`, `IsSaddlePointOn`,
`IsCompact.exists_isMinOn`. (Liesen–Tichý, p. 8; proved here.)

**Checks.**
- `A = diag(1, 2, 4)`, `k = 1`: `min_c max(|1 − c|, |1 − 2c|, |1 − 4c|) = 3/5` at `c = 2/5`; the
  subset `{1, 4}` has `V = (4/3 + 1/3)⁻¹ = 3/5` (4.1), and the initial error of 4.1 on it attains
  the ratio `3/5`; the `26` nonzero initial errors with components in `{0, 1, 2}` all have ratio at
  most `3/5`.
- `A = diag(1, 2, 4, 8)`, `k = 2`: `p = 1 − 9x/14 + x²/14` takes the values `3/7, 0, −3/7, 3/7` on
  the spectrum, and the initial error of 4.1 on `{1, 4, 8}` has ratio `V = 3/7`, so `E = 3/7`.
  `A = diag(1, 3, 3, 9)`, `k = 2` (a repeated eigenvalue): `E = 2/5`, by `1 − 2x/3 + x²/15` and
  `{1, 3, 9}`.
- `k ≥ |Λ|`: `E = 0`; for `A = 2I`, `k = 1` and every `e₀`, `x₁ = A⁻¹ b`. `k = 0`: `E = 1`.

### 4.3 Outlying eigenvalues

Prove `IsCGIterate.energyNorm_sub_le_of_outliers`: let `0 < a ≤ c`, `O` a finite set of reals, every
eigenvalue of `A` in `[a, c]` or in `O`, and `k ≥ |O|`. Then, with `κ = c/a`,
`‖e_k‖_A ≤ 2 (∏_(t ∈ O) max(|1 − a/t|, |1 − c/t|)) ((√κ − 1)/(√κ + 1))^(k − |O|) ‖e₀‖_A`. For
outliers above the interval (`t ≥ c`) the factor `max(|1 − a/t|, |1 − c/t|) = 1 − a/t` is below `1`:
`|O|` large eigenvalues cost `|O|` steps. For outliers below (`0 < t ≤ a`) the factor is
`c/t − 1`. Points of `O` that are not eigenvalues, `0` and negative reals included, are allowed;
they only enlarge the bound. With `O = ∅` this is IterativeMethodsForLinearSystems 4.5.

No open source for this statement was found; it is proved here.

Route. Let `s = |O|`. For `a < c`, let `R` be the Chebyshev residual polynomial of `[a, c]` of
degree `k − s` (IterativeMethodsForLinearSystems 3.1
`TauCetiRoadmap.IterativeMethodsForLinearSystems.chebyshevResidual_spec`: `R(0) = 1`,
`|R| ≤ T_(k−s)(σ)⁻¹` on `[a, c]`), and the closed form `T_m(σ)⁻¹ ≤ 2 ((√κ − 1)/(√κ + 1))^m`
(IterativeMethodsForLinearSystems 3.3, a README item whose proof is: `σ = cosh θ` with
`e^θ = (√κ + 1)/(√κ − 1)` and `cosh(mθ) ≥ e^(mθ)/2`). For `a = c`, let
`R = (1 − x/a)^(min(1, k − s))`, which vanishes on `[a, a]` when `k > s`. Put
`p = ∏_(t ∈ O) (1 − t⁻¹ x) · R` (the factor of `t = 0` is `1`, as `0⁻¹ = 0`), of degree at most `k`
with `p(0) = 1`. At an eigenvalue in `O` (necessarily nonzero) `p` vanishes; on `[a, c]`,
`|1 − x/t| ≤ max(|1 − a/t|, |1 − c/t|)` (an affine function of `x`), so `|p|` is at most the claimed
factor. The spectral bound of 1.1 for `e₀` and IterativeMethodsForLinearSystems 4.4
IsCGIterate.polynomial_optimal conclude.

*Needs:* 1.1; IterativeMethodsForLinearSystems 3.1
(`TauCetiRoadmap.IterativeMethodsForLinearSystems.chebyshevResidual_spec`), 3.3 (the closed form,
with its proof above) and 4.4 (IsCGIterate.polynomial_optimal); Mathlib
`Polynomial.Chebyshev.T_real_cosh`. (Proved here.)

**Checks.**
- Spectrum `{1, 4, 9, 100}`, `a = 1`, `c = 9`, `O = {100}`, `e₀` with unit components: for
  `k = 1, 2, 3` the squared error ratios are `336692/3169181`, `3434231100/218911508783` and
  `1603201600/437664036149` (ratios about `0.326, 0.125, 0.061`), the bound is
  `2 · 0.99 · (1/2)^(k−1) = 1.98, 0.99, 0.495`, and the bound with `[a, c] = [1, 100]` and no
  outlier is `2 (9/11)^k ≈ 1.64, 1.34, 1.10`.
- Spectrum `{1/4, 1, 2, 4, 9}`, `[a, c] = [1, 9]`, `O = {1/4}`: the factor is `9/(1/4) − 1 = 35`,
  and the bound holds for `k = 1, …, 5`.
- `a = c`: spectrum `{2, 2, 2, 30}`, `O = {30}`: the bound is `0` for `k ≥ 2`, and indeed
  `x_2 = A⁻¹ b`.

### 4.4 Chebyshev iteration and the heavy-ball method

For `0 < α < β` let `ω_(k+1) = 2σ T_k(σ)/T_(k+1)(σ)`.

- **Recurrence and limit** (`chebyshevIterate_succ`): for every `A`, `b`, `x₀` (no hypothesis on
  `A`), IterativeMethodsForLinearSystems's Chebyshev iterates satisfy `x_1 = x₀ + γ r₀` and
  `x_(k+1) = x_k + (ω_(k+1) − 1)(x_k − x_(k−1)) + ω_(k+1) γ (b − A x_k)` for `k ≥ 1`; the weights
  `ω_1 = 2 > ω_2 > ⋯` decrease strictly to `1 + q²`, and the steps `ω_(k+1) γ` tend to
  `4/(√β + √α)²`. The limiting stationary recurrence
  `x_(k+1) = x_k + q² (x_k − x_(k−1)) − (4/(√β + √α)²)(A x_k − b)` is the heavy-ball method of
  FirstOrderOptimization 4.1 for `f(x) = ⟪A x, x⟫/2 − ⟪b, x⟫` with exactly the parameters of
  `heavyBall_quadratic_rate` (`μ = α`, `K = β`: step `4/(√K + √μ)²`, momentum `q²`).
- **Optimality of the heavy-ball rate** (`exists_heavyBall_error_ge`): for every `k` there is such
  an `f` on `ℝ^(k+1)` with `α ‖v‖² ≤ ⟪A v, v⟫ ≤ β ‖v‖²` and a starting point `x₀ ≠ x⋆` at which the
  `k`-th heavy-ball iterate has `‖x_k − x⋆‖ ≥ √(α/β) q^k ‖x₀ − x⋆‖`. Consequently no bound
  `C (k + 1) q′^k ‖x₀ − x⋆‖` with `q′ < q` and `C` independent of the dimension holds for all such
  quadratics.

Saad, §12.3.2, (12.6)–(12.9) and Algorithm 12.1, pp. 397–399, derive the three-term form of
Chebyshev acceleration (his `ρ_k ρ_(k−1)` and `2ρ_k/δ` are `ω_(k+1) − 1` and `ω_(k+1) γ` here). The
limit and its identification with the heavy-ball parameters, and the lower bound, are proved here.
FirstOrderOptimization leaves lower complexity bounds outside its scope.

Route. *Recurrence.* With `u = σ − 2t/(β − α) = σ(1 − γ t)`, the residual polynomials are
`R_k(t) = T_k(u)/T_k(σ)` (`T_k(σ) ≥ 1`), and `T_(k+1) = 2u T_k − T_(k−1)`
(`Polynomial.Chebyshev.T_add_two`) gives `R_(k+1) = ω_(k+1)(1 − γt) R_k − (ω_(k+1) − 1) R_(k−1)`,
using `T_(k−1)(σ)/T_(k+1)(σ) = ω_(k+1) − 1`. For `Q_k = (1 − R_k)/X` (exact division, `R_k(0) = 1`),
this becomes `Q_(k+1) = Q_k + (ω − 1)(Q_k − Q_(k−1)) + ωγ R_k`; applied to `r₀`, with
`R_k(A) r₀ = r₀ − A Q_k(A) r₀ = b − A x_k`, it is the claim; `R_1 = 1 − γt` gives `x_1`. *Limit.*
With `σ = cosh θ`, `θ > 0`: `ω_(k+1) = 2 cosh θ cosh(kθ)/cosh((k+1)θ)` and
`cosh((k+1)θ)/cosh(kθ) = cosh θ + sinh θ tanh(kθ)` increases strictly in `k`, so `ω` decreases
strictly, to `2 cosh θ/(cosh θ + sinh θ) = 1 + e^(−2θ) = 1 + q²` (as `e^(−θ) = q`). And
`(1 + q²) γ = 2(α + β)/(√β + √α)² · 2/(α + β) = 4/(√β + √α)²`. *Heavy ball.* Take the matrix `A` and
the vector `b ≠ 0` that 4.1 (`exists_isCGIterate_energyNorm_eq`) gives, as an operator on
`E = EuclideanSpace ℝ (Fin (k + 1))` (`Matrix.toEuclideanCLM`, symmetric as `A` is), with
`x⋆ = A⁻¹ b ≠ 0` and `x₀ = 0`. The gradient of `f` is `A x − b`, so by induction the heavy-ball
iterates satisfy `x_j ∈ K_j(A, b)` (`x_(j+1)` is a combination of `x_j`, `x_(j−1)` and
`b − A x_j ∈ K_(j+1)`). By 4.1, `‖x_k − x⋆‖_A ≥ T_k(σ)⁻¹ ‖x⋆‖_A ≥ q^k ‖x⋆‖_A`, and, the eigenvalues
lying in `[α, β]`, `α‖v‖² ≤ ‖v‖_A² ≤ β‖v‖²` converts this into the Euclidean claim. For the
consequence, `√(α/β) q^k > C (k + 1) q′^k` for large `k`.

*Needs:* 4.1; IterativeMethodsForLinearSystems 3.1 and 3.4 (`chebyshevResidual`,
`chebyshevIterate`); FirstOrderOptimization 4.1 (`heavyBallStep`, and the parameters of
`heavyBall_quadratic_rate`); Mathlib `Polynomial.Chebyshev.T_add_two`,
`Polynomial.Chebyshev.T_real_cosh`, `Polynomial.divByMonic`, `gradient`, `Matrix.toEuclideanCLM`.
(Saad, §12.3.2, pp. 397–399; proved here.)

**Checks.**
- `[α, β] = [1, 9]`: `σ = 5/4`, `γ = 1/5`, `q = 1/2`; `ω_1 = 2`, `ω_2 = 25/17`, `ω_3 = 17/13`,
  decreasing to `1 + q² = 5/4`, and `(5/4)(1/5) = 1/4 = 4/(3 + 1)²`. The polynomial recurrence holds
  exactly for `k ≤ 11` on `[1, 9]`, `[1, 4]` and `[4, 25]`.
- The first Chebyshev step is Richardson's step `γ = 2/(α + β)`, not the heavy-ball step
  `4/(√β + √α)²`: on `[1, 9]` these are `1/5` and `1/4`.
- The heavy-ball lower bound on the Chebyshev instances of `[1, 9]` for `k = 1, 2, 3` (exact
  heavy-ball iterates, checked to lie in `x₀ + K_k`): at `k = 1` the Euclidean error ratio
  `‖x_1 − x⋆‖/‖x₀ − x⋆‖` is `√(377/656) ≈ 0.758`, above `√(1/9) · 1/2 = 1/6`.

### Examples

- On `[1, 9]` the Chebyshev points `1, 9` (`k = 1`) give `V = 4/5 = 1/T_1(5/4)`: conjugate gradients
  and every Krylov method reduce the energy norm of this `e₀` by at most the factor `4/5` in one
  step.

### Dependencies

4.1: 1.1, IterativeMethodsForLinearSystems 3.1, 4.1, 4.4. 4.2: 1.1, IterativeMethodsForLinearSystems
4.2, 4.4. 4.3: 1.1, IterativeMethodsForLinearSystems 3.1, 3.3, 4.4. 4.4: 4.1,
IterativeMethodsForLinearSystems 3.1, 3.4, FirstOrderOptimization 4.1.

## Layer 5: Ritz values

Throughout, `hA : A.IsHermitian`, `μ = spectralMeasure hA b`, `g = |supp μ|`.

### 5.1 The Kaniel–Paige–Saad bound for the largest Ritz value

Prove `le_zeros_last`: let every eigenvalue of `A` be `λ₁` or lie in `[a, c]` with `c < λ₁`, and let
`μ{λ₁} > 0` (the projection of `b` on the eigenspace of `λ₁` is nonzero). Then for `k + 1 ≤ g` the
largest Ritz value `θ = zeros μ (k + 1) (Fin.last k)`, the largest eigenvalue of `T_(k+1)`,
satisfies `λ₁ − (λ₁ − a) tan²φ / T_k(1 + 2(λ₁ − c)/(c − a))² ≤ θ ≤ λ₁`, `tan²φ = μ(ℝ ∖ {λ₁})/μ{λ₁}`.
With `c = λ₂` the next eigenvalue and `a = λ_n` the smallest this is the classical bound; `λ₁` may
be multiple.

Saad, *Numerical Methods for Large Eigenvalue Problems*, Theorem 6.4, (6.42), p. 149, case `i = 1`,
with `γ₁` from Theorem 6.3, p. 148, for an `m`-dimensional Krylov space and `C_(m−1)`; here
`m = k + 1`. The statement with a multiple `λ₁` and any interval `[a, c]` is proved here.

Route. By 2.1(d) and 2.2, the roots of `monic μ (k + 1)` are the `k + 1` eigenvalues of the
Hermitian `T_(k+1) = Q* A Q`, so `θ` is the largest of them, and `θ = max s* T s` over unit `s`
(Mathlib `Matrix.IsHermitian.spectral_theorem`); with `y = Q s`, `θ` is the largest Rayleigh
quotient `y* A y/y* y` on `K_(k+1)` (`Q` has orthonormal columns spanning `K_(k+1)`, 2.1). The upper
bound: every Rayleigh quotient of `A` is at most its largest eigenvalue `λ₁`. The lower bound: put
`P(x) = T_k(1 + 2(x − c)/(c − a))`, of degree at most `k`, and `y = P(A) b ∈ K_(k+1)`. By 1.1,
`y* A y/y* y = ∫ x P² dμ/∫ P² dμ` (`∫ P² dμ ≥ P(λ₁)² μ{λ₁} > 0`, as `P(λ₁) ≥ 1` by
`Polynomial.Chebyshev.one_le_eval_T_real`). If `a < c`, `|P| ≤ 1` on `[a, c]`
(`Polynomial.Chebyshev.abs_eval_T_real_le_one`), and
`λ₁ − ∫ x P² dμ/∫ P² dμ = ∫ (λ₁ − x) P² dμ/∫ P² dμ ≤ (λ₁ − a) μ(ℝ ∖ {λ₁})/(P(λ₁)² μ{λ₁})`, since the
support lies in `{λ₁} ∪ [a, c]`. If `a = c`, the division gives `P = T_k(1) = 1` and the same
computation holds. If `a > c`, `μ` is `μ{λ₁} δ_(λ₁)`, `g = 1`, `k = 0` and `θ = α_0 = λ₁`.

*Needs:* 1.1, 2.1, 2.2; Mathlib `Matrix.IsHermitian.spectral_theorem`,
`Polynomial.Chebyshev.abs_eval_T_real_le_one`, `Polynomial.Chebyshev.one_le_eval_T_real`. (Saad,
*Eigenvalue Problems*, Theorems 6.3–6.4, pp. 148–149.)

**Checks.**
- `A = diag(1, 2, 3, 6)`, `b = (1, 1, 1, 1)`, `λ₁ = 6`, `[a, c] = [1, 3]`, `tan²φ = 3`: for `k = 1`,
  `T_1(4) = 4` and the bound is `6 − 15/16 = 81/16 = 5.0625 ≤ θ ≈ 5.6211`, the larger root of
  `14x² − 102x + 131`; for `k = 2` the bound is `5751/961 < 5.985`, and `θ`, the largest root of
  `181x³ − 1776x² + 4691x − 3276`, lies in `(5.989, 5.990)` (a sign change).
- `μ{λ₁} > 0` is needed: `A = diag(2, 1)`, `b = (0, 1)`, `λ₁ = 2`, `a = c = 1`: `μ = δ₁`, and the
  bound would read `2 − (1)(1/0)/1 = 2 ≤ θ = 1`, false.
- `c < λ₁` is needed: `A = diag(1, 2)`, `b = (1, 1)`, `λ₁ = 1`, `a = c = 2`: every eigenvalue is `1`
  or in `[2, 2]`, but at `k = 0`, `θ = 3/2 > 1`.

### 5.2 The residual of a Ritz pair

Prove `ritz_residual`: for `1 ≤ k ≤ g`, `s ∈ 𝕜^k` with `s* s = 1` and `T_k s = θ s`, the Ritz vector
`y = Σ_j s_j q_j` has `‖A y − θ y‖² = β_k |s_(k−1)|²`; hence, if `a′ < θ < b′` and `λ` is the only
eigenvalue of `A` in `(a′, b′)`, `−β_k |s_(k−1)|²/(θ − a′) ≤ θ − λ ≤ β_k |s_(k−1)|²/(b′ − θ)`. At
`k = g`, `β_g = 0` and every Ritz value is an eigenvalue.

Route. By 2.1(b) and (d), `A q_j = Σ_(i<k) (T_k)_(ij) q_i` for `j < k − 1` and
`A q_(k−1) = Σ_(i<k) (T_k)_(i,k−1) q_i + √β_k q_k`, so
`A y = Q T_k s + √β_k s_(k−1) q_k = θ y + √β_k s_(k−1) q_k`, and `‖q_k‖ = 1` for `k < g` while
`β_g = 0`. The vector `y` is a unit vector (orthonormal `q_j`), and `y* A y = s* T_k s = θ`.
EigenvalueIterations 3.2 `kato_temple`, applied to `Matrix.toEuclideanCLM A` (symmetric), `x = y`,
Rayleigh quotient `θ`, and `ε² = ‖A y − θ y‖²`, gives the enclosure; its eigenvalue hypotheses are
those of the statement, eigenvalues of the operator being those of the matrix.

*Needs:* 2.1; EigenvalueIterations 3.2 (`kato_temple`); Mathlib `Matrix.toEuclideanCLM`,
`ContinuousLinearMap.rayleighQuotient`. (Proved here; the enclosure is EigenvalueIterations 3.2.)

**Checks.**
- `A = H diag(1, 2, 4) H` and `b = H (1, 1, 1)` for the Householder reflection `H` of
  `(1, 2, 2)`, so that `μ = δ₁ + δ₂ + δ₄`, `k = 2`: for both Ritz pairs, with the Ritz values
  `(18 ± √79)/7`, `‖A y − θ y‖² = β_2 |s_1|²` exactly, with `β_2 = 27/49`. With `b = (1, 1, 1)`
  instead, `μ` changes and `β_2 = 2187/61009`.
- Kato–Temple on `diag(1, 2, 4)`, `b = (1, 1, 1)`, `k = 2`: for `θ = (18 + √79)/7` the residual is
  `β_2 |s_1|² = 27/98 + 45√79/7742`, and with `(a′, b′) = (5/2, 5)`, which contains only the
  eigenvalue `4`, the enclosure reads
  `−1/35 − 67√79/2765 ≤ θ − 4 = (√79 − 10)/7 ≤ 6/35 + 69√79/5530` (exact; about
  `−0.244 ≤ −0.159 ≤ 0.282`).
- `k = 1`: `y = q_0 = b/‖b‖`, `θ = b* A b/b* b`, and the identity is `‖A q_0 − α_0 q_0‖² = β_1`, the
  variance of `μ/μ(ℝ)`; for `diag(1, 2, 4)` and `b = (1, 1, 1)`, `(16/9 + 1/9 + 25/9)/3 = 14/9`.

### Examples

- `A = diag(1, 2, 3, 6)`, `b = (1, 1, 1, 1)`: the largest Ritz values `3`, `(51 + √767)/14`, a
  root in `(5.989, 5.990)` and `6` for `k + 1 = 1, 2, 3, 4` against the bounds `−9`, `81/16`,
  `5751/961` of 5.1.

### Dependencies

5.1: 1.1, 2.1, 2.2. 5.2: 2.1, EigenvalueIterations 3.2.

## Scope and ownership

This roadmap is built on five others and restates none of their theorems. From
SpecialFunctionsOrthogonalPolynomialsGeneral, by another contributor, it takes the monic and
orthonormal polynomials of a measure, its recurrence coefficients and Christoffel numbers, the
Jacobi matrix and the J-fraction of a recurrence (1.3–1.4, 2.2–2.3, 3.1, 3.3, 5.1, 5.3), and uses
its statements that hold for every measure with finite moments: the orthogonality and
characterization of the monic polynomial below the size of the support and its vanishing on a finite
support (2.2), the characteristic polynomial of a tridiagonal matrix (1.3) and the continuants of
the J-fraction (1.4). Its theorems on the recurrence, the zeros, Gauss quadrature and the J-fraction
of a measure (Layers 3, 5 and 9) are stated for orthogonality measures, whose support is infinite,
and its Gauss measures of a recurrence (7.1) for coefficients with every `β_(n+1) > 0`; the spectral
measure of a matrix and a vector has finitely many atoms and `β_g = 0`, so this roadmap takes only
definitions from Layers 3 and 5, and nothing from Layers 7 and 9. The statements here are about
matrices (the Lanczos vectors and matrices, the conjugate gradient iterates), and their parts about
the spectral measure alone (2.2, the finite Gauss rule of 2.3, the finite J-fraction of 2.4) are
proved with routes written for a finite support. Every finite measure on `ℝ` with finite support,
`Σ_l w_l δ_(t_l)` with distinct `t_l` and `w_l ≥ 0`, is a spectral measure, of `A = diag(t_l)` and
`b_l = √w_l` (both measures are carried by the `t_l` and have the same polynomial integrals, by the
moment bullet of 1.1; a weight `w_l = 0` gives no atom), so 2.2, the Gauss rule of 2.3 and 2.4 are
the finite-support counterparts of SpecialFunctionsOrthogonalPolynomialsGeneral 5.1, 5.3 and 9.2.
From IterativeMethodsForLinearSystems it takes Krylov spaces, the energy norm, the conjugate
gradient iterates with their existence, Galerkin characterization, polynomial optimality and
termination, and the Chebyshev residual polynomial, its bound and Chebyshev iteration; from
HankelFormsAndRealMomentProblems the rank of a moment Hankel section (1.2); from
EigenvalueIterations the Kato–Temple bound (3.2); and from FirstOrderOptimization the heavy-ball
step and the parameters of its rate on quadratics (4.1).

The other boundaries:

- IterativeMethodsForLinearSystems owns the convergence bound `2 q^k` for conjugate gradients (4.5),
  the min–max property of the Chebyshev residual polynomial on an interval (3.2), the Chebyshev
  iteration bound (3.4) and minimal residuals (Layer 5); its scope leaves out the Lanczos and
  conjugate gradient recurrences and their equality with the minimizers, which 2.1 and 3.2 supply.
  4.1 shows its bound sharp within a factor `2`, and 4.3 refines it with outliers.
- FirstOrderOptimization owns the heavy-ball rate on quadratics (4.1); its scope leaves out
  conjugate gradients and lower complexity bounds, of which 4.4 gives the Krylov case.
- EigenvalueIterations owns the power, subspace and Rayleigh-quotient iterations and the Kato–Temple
  bound; it leaves Krylov-space eigenvalue methods out, and Layer 5 is their convergence for the
  largest Ritz value and the a posteriori bound for any Ritz value.
- HankelFormsAndRealMomentProblems owns the moment problems; 2.3's `k`-atom Gauss measure represents
  the moments of `μ` up to degree `2k − 1`, which is its truncated problem in odd degree, not used
  here.
- The scalar spectral measure of an operator at a vector is Tau Ceti's
  `ContinuousLinearMap.diagMeasure` (a normal bounded operator on a complex Hilbert space, a finite
  measure on its spectrum in `ℂ`), and OperatorTheory/SelfAdjointSpectralTheory states the diagonal
  scalar measure of a projection-valued measure (SA-B21) and the real spectral projection-valued
  measure of a bounded self-adjoint operator (SA-B31). 1.1's spectral measure is the matrix case:
  Hermitian matrices over `ℝ` or `ℂ`, and a measure on `ℝ` given by its atoms;
  `spectralMeasure_eq_map_diagMeasure` (1.1) identifies it, for `𝕜 = ℂ`, with the image of the
  library's measure under `z ↦ Re z`.
- Mathlib has the spectral theorem for Hermitian matrices, Gram–Schmidt, the Chebyshev polynomials
  with their extremal nodes, and Sion's minimax theorem. Tau Ceti has the Rayleigh–Ritz compression
  `ContinuousLinearMap.compression` and its Ritz residual for a general isometric trial map; for
  `k ≤ g` the Lanczos matrix `T_k` is the matrix of the compression of `A` along `Q_k`; the
  statements here concern this Krylov trial map and use no declaration of that file.
- SpecialFunctionsOrthogonalPolynomialsGeneral's Layer 9 Markov theorem is the infinite-support
  counterpart of 2.4; RandomMatrices treats tridiagonal models of random matrices, a different
  subject.

Not treated here: finite-precision Lanczos and conjugate gradients; the Gauss–Radau and
Gauss–Lobatto estimates of the error; preconditioning; block, restarted and biorthogonal Krylov
methods; the worst-case theorem for minimal residuals and normal matrices; the convergence curves
attainable by minimal residuals for non-normal matrices (Greenbaum–Pták–Strakoš); the inverse
problem of a Jacobi matrix from two interlacing spectra; Krylov methods for operators on
infinite-dimensional spaces.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Analysis/Matrix/Spectrum.lean`: `Matrix.IsHermitian.eigenvalues`,
  `Matrix.IsHermitian.eigenvectorBasis` (an orthonormal basis of `EuclideanSpace 𝕜 ι`),
  `Matrix.IsHermitian.mulVec_eigenvectorBasis` (`A u_j = λ_j u_j`),
  `Matrix.IsHermitian.spectral_theorem`.
- `Mathlib/LinearAlgebra/Matrix/Rank.lean`: `Matrix.rank_eq_finrank_span_cols`,
  `Matrix.rank_conjTranspose_mul_self` (over a field with a star-ordered structure).
- `Mathlib/Analysis/InnerProductSpace/GramSchmidtOrtho.lean`: `InnerProductSpace.gramSchmidt_def`
  (`gs_n = f_n − Σ_(i<n) proj_(gs_i) f_n`), `InnerProductSpace.gramSchmidtNormed`,
  `InnerProductSpace.gramSchmidtNormed_orthonormal'`, `InnerProductSpace.span_gramSchmidt_Iio`;
  `Submodule.starProjection_singleton` (`proj_v w = (⟪v, w⟫/‖v‖²) v`).
- `Mathlib/MeasureTheory/Measure/Support.lean` and `Dirac.lean`: `MeasureTheory.Measure.support`,
  `MeasureTheory.Measure.dirac`.
- Chebyshev polynomials: `Polynomial.Chebyshev.T`, `Polynomial.Chebyshev.T_add_two`,
  `Polynomial.Chebyshev.T_real_cosh`, `Polynomial.Chebyshev.one_le_eval_T_real`,
  `Polynomial.Chebyshev.abs_eval_T_real_le_one`; in
  `Mathlib/Analysis/SpecialFunctions/Trigonometric/Chebyshev/Extremal.lean`,
  `Polynomial.Chebyshev.node` (`cos(iπ/n)`) and `Polynomial.Chebyshev.eval_T_real_node`
  (`T_n(node n i) = (−1)^i` for `i ≤ n`).
- `Mathlib/Topology/Sion.lean`: `Sion.exists_isSaddlePointOn` (real-valued `f`; `X`, `Y` nonempty,
  convex and compact; lower semicontinuous and quasiconvex in `x`, upper semicontinuous and
  quasiconcave in `y`), `IsSaddlePointOn`; `IsCompact.exists_isMinOn`.
- Polynomials and algebra: `Polynomial.aeval`, `Polynomial.roots`, `Polynomial.card_roots'`,
  `Polynomial.divByMonic`, `Lagrange.basis`, `GenContFract.convs` (the quotient of the continuants),
  `Matrix.toEuclideanCLM`, `ContinuousLinearMap.rayleighQuotient`, `gradient`, `Matrix.PosDef`,
  `Matrix.PosSemidef`.
- For the comparison in 1.1: `Matrix.isHermitian_iff_isSelfAdjoint`, `IsSelfAdjoint.isStarNormal`,
  `AlgEquiv.spectrum_eq`, `Matrix.IsHermitian.spectrum_eq_image_range` (the spectrum of a Hermitian
  matrix is the image of its eigenvalues), `cfc_congr`, `cfc_polynomial`,
  `MeasureTheory.integral_map`; for `k = 0` in 2.4, `GenContFract.zeroth_conv_eq_h`.

### From Tau Ceti

- `TauCeti/Analysis/InnerProductSpace/BorelCalculus/DiagonalMeasure.lean`, imported by
  `Suggested.lean`: `ContinuousLinearMap.diagMeasure` (a normal operator `a` on a complex Hilbert
  space, `[IsStarNormal a]`; a finite measure on `spectrum ℂ a`),
  `ContinuousLinearMap.integral_diagMeasure_eq_inner_cfc` (`∫ f dμ_ξ = ⟪ξ, cfc f a ξ⟫` for `f`
  continuous on the spectrum), `ContinuousLinearMap.diagMeasure_real_univ` (`μ_ξ(univ) = ‖ξ‖²`):
  used in 1.1 (`spectralMeasure_eq_map_diagMeasure`). The general object is also stated in
  OperatorTheory/SelfAdjointSpectralTheory, SA-B21 and SA-B31; no statement here uses them.

### From TauCetiRoadmap.SpecialFunctionsOrthogonalPolynomialsGeneral

- Definitions copied verbatim: `jacobiMatrix` (1.3), `jFraction` (1.4), `pairing` (2.1), `monic`
  (2.2), `normSq`, `normSqX`, `orthonormal` (2.3), `recB` (3.1), `alpha`, `beta` (3.3), `zeros`
  (5.1), `christoffelNumber` (5.3). Used through their definitions: `monicThreeTerm` (1.1) and the
  corecursive polynomials (1.2).
- 1.3 `TauCetiRoadmap.SpecialFunctionsOrthogonalPolynomialsGeneral.charpoly_jacobiMatrix` (any
  commutative ring): used in 2.1.
- 1.4 `TauCetiRoadmap.SpecialFunctionsOrthogonalPolynomialsGeneral.conts_jFraction` (any `α`,
  `β : ℕ → ℂ`, `z`): used in 2.4.
- 2.2 `TauCetiRoadmap.SpecialFunctionsOrthogonalPolynomialsGeneral.monic_monic` (any `μ`, `n`);
  `TauCetiRoadmap.SpecialFunctionsOrthogonalPolynomialsGeneral.pairing_monic_eq_zero` (all powers
  integrable, `(n : ℕ∞) < μ.support.encard`, `deg q < n`);
  `TauCetiRoadmap.SpecialFunctionsOrthogonalPolynomialsGeneral.eq_monic` (same hypotheses, `p` monic
  of degree `n` orthogonal to lower degrees);
  `TauCetiRoadmap.SpecialFunctionsOrthogonalPolynomialsGeneral.eval_monic_eq_zero_of_mem_support`
  (`μ.support.encard = N + 1`): used in 2.1, 2.2, 2.4, 3.1. The spectral measure satisfies the
  integrability hypothesis (1.1), and the support conditions are those of the routes.

### From TauCetiRoadmap.IterativeMethodsForLinearSystems

- Definitions copied verbatim: `chebyshevResidual` (3.1), `energyNorm`, `chebyshevIterate` (3.4),
  `krylov` (4.1), `IsCGIterate` (4.2).
- 3.1 `TauCetiRoadmap.IterativeMethodsForLinearSystems.chebyshevResidual_spec` (`0 < α < β`): used
  in 4.1 and 4.3. 3.3 the closed form `1/T_k(σ) ≤ 2 q^k` (a README item; its proof is given in 4.3).
- 4.2 `TauCetiRoadmap.IterativeMethodsForLinearSystems.existsUnique_isCGIterate`,
  `TauCetiRoadmap.IterativeMethodsForLinearSystems.isCGIterate_iff` (`A.PosDef`): used in 1.2, 3.1,
  3.2.
- 4.4 IsCGIterate.polynomial_optimal, IsCGIterate.eq_of_finrank_le (`A.PosDef`): used in 1.2, 3.1,
  3.2, 4.1, 4.2, 4.3. 4.1's description of `K_k` as the polynomials of degree below `k` in `A`
  applied to `r` is used with its one-line proof (a span of the `A^i r`).

### From TauCetiRoadmap.HankelFormsAndRealMomentProblems

- 1.1 `hankelSection`; 1.2 `RepresentsUpTo` and `rank_hankelSection_eq_min`
  (`RepresentsUpTo μ m (2n)` gives rank `min(n + 1, μ.support.encard)`): used in 1.1.

### From TauCetiRoadmap.EigenvalueIterations

- 3.2 `kato_temple` (finite-dimensional inner product space, symmetric `T`, `x ≠ 0`, `a < R(x) < b`,
  `λ` the only eigenvalue of `T` in `(a, b)`): used in 5.2.

### From TauCetiRoadmap.FirstOrderOptimization

- 4.1 `heavyBallStep`, copied verbatim, and the step size `4/(√K + √μ)²` and momentum
  `((√K − √μ)/(√K + √μ))²` of `heavyBall_quadratic_rate`: used in 4.4.

## References

- M. R. Hestenes and E. Stiefel, *Methods of conjugate gradients for solving linear systems*, J.
  Res. Nat. Bur. Standards 49 (1952), 409–436 (NIST open archive): Theorem 6:1 and (6:1), p. 416;
  §14, (14:3)–(14:4), pp. 427–429.
- J. Liesen and P. Tichý, *Convergence analysis of Krylov subspace methods*, GAMM-Mitteilungen 27
  (2004); preprint from J. Liesen's page, page numbers of the preprint: (14) and the remarks after
  it, p. 8.
- G. Meurant and Z. Strakoš, *The Lanczos and conjugate gradient algorithms in finite precision
  arithmetic*, Acta Numerica 15 (2006), 471–542 (from Z. Strakoš's page): (2.4)–(2.5), pp. 480–482;
  Theorem 2.1, p. 482; (3.1), p. 487; (3.6), p. 491; Theorem 3.1 and (3.7)–(3.8), p. 492.
- Y. Saad, *Iterative Methods for Sparse Linear Systems*, 2nd ed., SIAM, 2003 (author's version):
  §6.6.2, p. 195; Algorithm 6.16, p. 196; §12.3.2, (12.6)–(12.9) and Algorithm 12.1, pp. 397–399.
- Y. Saad, *Numerical Methods for Large Eigenvalue Problems*, 2nd ed., SIAM, 2011 (author's
  version): Theorem 6.3, p. 148; Theorem 6.4, (6.42), p. 149.
- Attributed in prose, not consulted: A. Greenbaum, *Comparison of splittings used with the
  conjugate gradient algorithm*, Numer. Math. 33 (1979), 181–193 (the sharpness of the min–max
  bound, as cited by Liesen–Tichý); S. Kaniel, *Estimates for some computational techniques in
  linear algebra*, Math. Comp. 20 (1966), 369–378, and C. C. Paige's thesis (the convergence of
  Ritz values, as cited by Saad, *Eigenvalue Problems*).

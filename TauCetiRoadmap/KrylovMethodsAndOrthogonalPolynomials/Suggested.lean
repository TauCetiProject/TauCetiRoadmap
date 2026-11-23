import Mathlib
import TauCeti.Analysis.InnerProductSpace.BorelCalculus.DiagonalMeasure

/-!
# Krylov methods and orthogonal polynomials: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib, each with `sorry`, together with the few definitions
they need; every definition has a real body. Every headline theorem of the README is statable at
the pins and is stated here.

Matrices are Mathlib matrices `Matrix ι ι 𝕜` over `𝕜 = ℝ` or `ℂ` (an `RCLike` field) on a finite
index type, possibly empty, acting on column vectors by `Matrix.mulVec`. Real polynomials are
evaluated at a matrix by `Polynomial.aeval`. The spectral measure of a Hermitian matrix `A` and a
vector `b` is the finite measure `Σ_i |⟨u_i, b⟩|² δ_(λ_i)` on `ℝ` for Mathlib's orthonormal
eigenbasis `u_i` with eigenvalues `λ_i`; its support has as many points as the largest Krylov
space of `b` has dimensions (the grade of `b`). Inverses of singular matrices and divisions by
zero are Mathlib's junk value `0`.

Definitions of other roadmaps that the statements mention are copied verbatim, each with a
docstring naming its owner and section: from IterativeMethodsForLinearSystems `chebyshevResidual`,
`energyNorm`, `chebyshevIterate`, `krylov` and `IsCGIterate`; from
SpecialFunctionsOrthogonalPolynomialsGeneral `jacobiMatrix`, `jFraction`, `pairing`, `monic`,
`normSq`, `normSqX`, `orthonormal`, `recB`, `alpha`, `beta`, `zeros` and `christoffelNumber`;
from FirstOrderOptimization `heavyBallStep`. For complex matrices the spectral measure is compared
with Tau Ceti's diagonal measure `ContinuousLinearMap.diagMeasure` of a normal operator.
-/

noncomputable section

open Polynomial Matrix MeasureTheory Filter Topology Finset
open scoped ComplexOrder InnerProductSpace RealInnerProductSpace Gradient

namespace TauCetiRoadmap.KrylovMethodsAndOrthogonalPolynomials

/-! ## Definitions copied verbatim from IterativeMethodsForLinearSystems -/

/-- 4.4 (copied verbatim from IterativeMethodsForLinearSystems 3.1): the Chebyshev residual
polynomial of degree `k` for the interval `[α, β]`:
`T_k((β + α − 2t)/(β − α)) / T_k((β + α)/(β − α))`. -/
def chebyshevResidual (α β : ℝ) (k : ℕ) : ℝ[X] :=
  C ((Chebyshev.T ℝ k).eval ((β + α) / (β - α)))⁻¹ *
    (Chebyshev.T ℝ k).comp (C ((β + α) / (β - α)) - C (2 / (β - α)) * X)

section CopiedEnergy

variable {ι 𝕜 : Type*} [Fintype ι] [DecidableEq ι] [RCLike 𝕜]

/-- 1.1 (copied verbatim from IterativeMethodsForLinearSystems 3.4): the energy norm
`‖v‖_A = √(Re (v* A v))`; for `A = 1` it is the Euclidean norm. -/
def energyNorm (A : Matrix ι ι 𝕜) (v : ι → 𝕜) : ℝ :=
  √(RCLike.re (star v ⬝ᵥ (A *ᵥ v)))

/-- 4.4 (copied verbatim from IterativeMethodsForLinearSystems 3.4): the Chebyshev iterate
`x₀ + q(A) (b − A x₀)`, where `1 − t q(t)` is the Chebyshev residual polynomial of `[α, β]`. -/
def chebyshevIterate (A : Matrix ι ι 𝕜) (b : ι → 𝕜) (α β : ℝ) (k : ℕ) (x₀ : ι → 𝕜) :
    ι → 𝕜 :=
  x₀ + aeval A ((1 - chebyshevResidual α β k) /ₘ X) *ᵥ (b - A *ᵥ x₀)

end CopiedEnergy

section CopiedKrylov

variable {ι 𝕜 : Type*} [Fintype ι] [DecidableEq ι] [RCLike 𝕜]

/-- 1.1 (copied verbatim from IterativeMethodsForLinearSystems 4.1): the Krylov space
`K_k(A, r) = span {r, A r, …, A^(k−1) r}`. -/
def krylov (A : Matrix ι ι 𝕜) (r : ι → 𝕜) (k : ℕ) : Submodule 𝕜 (ι → 𝕜) :=
  Submodule.span 𝕜 (Set.range fun i : Fin k => (A ^ (i : ℕ)) *ᵥ r)

/-- 1.2 (copied verbatim from IterativeMethodsForLinearSystems 4.2): `x` is a `k`-th conjugate
gradient iterate for `A x = b` from `x₀`: it lies in `x₀ + K_k(A, b − A x₀)` and minimises the
energy norm of the error `x − A⁻¹ b` there. -/
def IsCGIterate (A : Matrix ι ι 𝕜) (b x₀ : ι → 𝕜) (k : ℕ) (x : ι → 𝕜) : Prop :=
  x - x₀ ∈ krylov A (b - A *ᵥ x₀) k ∧
    ∀ y, y - x₀ ∈ krylov A (b - A *ᵥ x₀) k →
      energyNorm A (x - A⁻¹ *ᵥ b) ≤ energyNorm A (y - A⁻¹ *ᵥ b)

end CopiedKrylov

/-! ## Definitions copied verbatim from SpecialFunctionsOrthogonalPolynomialsGeneral -/

/-- 2.1 (copied verbatim from SpecialFunctionsOrthogonalPolynomialsGeneral 1.3): the truncated
Jacobi matrix `J_n`, with `b i` on the diagonal, `a i` at `(i, i + 1)` and `c i` at
`(i, i − 1)`. -/
def jacobiMatrix {R : Type*} [CommRing R] (a b c : ℕ → R) (n : ℕ) : Matrix (Fin n) (Fin n) R :=
  Matrix.of fun i j =>
    if (j : ℕ) = i then b i else if (j : ℕ) = i + 1 then a i else if (i : ℕ) = j + 1 then c i
    else 0

/-- 2.4 (copied verbatim from SpecialFunctionsOrthogonalPolynomialsGeneral 1.4): the J-fraction
`1/(z − α₀ − β₁/(z − α₁ − ⋯))`. -/
def jFraction (α β : ℕ → ℂ) (z : ℂ) : GenContFract ℂ :=
  ⟨0, Stream'.Seq.ofStream fun k => if k = 0 then ⟨1, z - α 0⟩ else ⟨-β k, z - α k⟩⟩

/-- 1.1 (copied verbatim from SpecialFunctionsOrthogonalPolynomialsGeneral 2.1): the moment
pairing `⟨p, q⟩ = ∫ p(x) q(x) dμ(x)`. -/
def pairing (μ : Measure ℝ) (p q : ℝ[X]) : ℝ :=
  ∫ x, p.eval x * q.eval x ∂μ

/-- 2.1 (copied verbatim from SpecialFunctionsOrthogonalPolynomialsGeneral 2.2): the monic
orthogonal polynomials, by Gram–Schmidt applied to the monomials. -/
def monic (μ : Measure ℝ) : ℕ → ℝ[X]
  | n => X ^ n - ∑ k : Fin n,
      C (pairing μ (X ^ n) (monic μ k) / pairing μ (monic μ k) (monic μ k)) * monic μ k
decreasing_by exact k.isLt

/-- 2.1 (copied verbatim from SpecialFunctionsOrthogonalPolynomialsGeneral 2.3): `h_n`. -/
def normSq (μ : Measure ℝ) (p : ℕ → ℝ[X]) (n : ℕ) : ℝ :=
  pairing μ (p n) (p n)

/-- 2.1 (copied verbatim from SpecialFunctionsOrthogonalPolynomialsGeneral 2.3): `h̃_n`. -/
def normSqX (μ : Measure ℝ) (p : ℕ → ℝ[X]) (n : ℕ) : ℝ :=
  ∫ x, x * (p n).eval x ^ 2 ∂μ

/-- 2.1 (copied verbatim from SpecialFunctionsOrthogonalPolynomialsGeneral 2.3): the
orthonormal polynomials with positive leading coefficient. -/
def orthonormal (μ : Measure ℝ) (n : ℕ) : ℝ[X] :=
  C (Real.sqrt (normSq μ (monic μ) n))⁻¹ * monic μ n

/-- 2.1 (copied verbatim from SpecialFunctionsOrthogonalPolynomialsGeneral 3.1):
`b_n = h̃_n / h_n`. -/
def recB (μ : Measure ℝ) (p : ℕ → ℝ[X]) (n : ℕ) : ℝ :=
  normSqX μ p n / normSq μ p n

/-- 2.1 (copied verbatim from SpecialFunctionsOrthogonalPolynomialsGeneral 3.3): the monic
recurrence coefficient `α_n = b_n`. -/
def alpha (μ : Measure ℝ) (n : ℕ) : ℝ := recB μ (monic μ) n

/-- 2.1 (copied verbatim from SpecialFunctionsOrthogonalPolynomialsGeneral 3.3): the monic
recurrence coefficient `β_n = h_n / h_{n−1}` for `n ≥ 1`, and `β₀ = 0`. -/
def beta (μ : Measure ℝ) (n : ℕ) : ℝ :=
  if n = 0 then 0 else normSq μ (monic μ) n / normSq μ (monic μ) (n - 1)

/-- 2.3 (copied verbatim from SpecialFunctionsOrthogonalPolynomialsGeneral 5.1): the zeros of
`monic μ n` in increasing order. -/
def zeros (μ : Measure ℝ) (n : ℕ) (i : Fin n) : ℝ :=
  ((monic μ n).roots.sort (· ≤ ·)).getD i 0

/-- 2.3 (copied verbatim from SpecialFunctionsOrthogonalPolynomialsGeneral 5.3): the
Christoffel numbers. -/
def christoffelNumber (μ : Measure ℝ) (n : ℕ) (i : Fin n) : ℝ :=
  (∫ x, ((monic μ n /ₘ (X - C (zeros μ n i))).eval x) ∂μ) /
    (derivative (monic μ n)).eval (zeros μ n i)

/-! ## Definition copied verbatim from FirstOrderOptimization -/

section CopiedHeavyBall

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [CompleteSpace E]

/-- 4.4 (copied verbatim from FirstOrderOptimization 4.1): one heavy-ball step on the state
`(x, x_prev)`. -/
def heavyBallStep (f : E → ℝ) (α β : ℝ) (s : E × E) : E × E :=
  (s.1 - α • ∇ f s.1 + β • (s.1 - s.2), s.1)

end CopiedHeavyBall

variable {ι 𝕜 : Type*} [Fintype ι] [DecidableEq ι] [RCLike 𝕜]

/-! ## Layer 1: the spectral measure of a matrix and a vector -/

/-- 1.1 The spectral measure of a Hermitian matrix `A` and a vector `b`:
`Σ_i |⟨u_i, b⟩|² δ_(λ_i)` for the orthonormal eigenbasis `u_i` of `A` with eigenvalues `λ_i`.
Its integrals of polynomials are `b* p(A) b`, so it does not depend on the choice of basis. -/
def spectralMeasure {A : Matrix ι ι 𝕜} (hA : A.IsHermitian) (b : ι → 𝕜) : Measure ℝ :=
  ∑ i, ENNReal.ofReal (‖hA.eigenvectorBasis.repr (WithLp.toLp 2 b) i‖ ^ 2) •
    Measure.dirac (hA.eigenvalues i)

/-- 1.1 The spectral measure of `(A, b)`: polynomial moments, finiteness of all moments, its
support, the dimension of every Krylov space, and the spectral bound for a polynomial in `A`. -/
theorem spectralMeasure_spec {A : Matrix ι ι 𝕜} (hA : A.IsHermitian) (b : ι → 𝕜) :
    (∀ p q : ℝ[X], star (aeval A p *ᵥ b) ⬝ᵥ (aeval A q *ᵥ b) =
        ((pairing (spectralMeasure hA b) p q : ℝ) : 𝕜)) ∧
      (∀ n : ℕ, Integrable (fun x : ℝ => x ^ n) (spectralMeasure hA b)) ∧
      (spectralMeasure hA b).support =
        {t : ℝ | ∃ v : ι → 𝕜, A *ᵥ v = (t : 𝕜) • v ∧ star v ⬝ᵥ b ≠ 0} ∧
      (∀ k : ℕ, Module.finrank 𝕜 (krylov A b k) = min k (spectralMeasure hA b).support.ncard) ∧
      ∀ (p : ℝ[X]) (M : ℝ), (∀ t ∈ (spectralMeasure hA b).support, |p.eval t| ≤ M) →
        energyNorm 1 (aeval A p *ᵥ b) ≤ M * energyNorm 1 b ∧
          (A.PosSemidef → energyNorm A (aeval A p *ᵥ b) ≤ M * energyNorm A b) := by
  sorry

/-- 1.1 For a complex Hermitian matrix `A`, the spectral measure of `(A, b)` is the image under
`z ↦ Re z` of Tau Ceti's diagonal measure of the operator `Matrix.toEuclideanCLM A` at `b`, a
finite measure on its spectrum in `ℂ`. The operator is normal because `A` is Hermitian; the
normality is taken as an instance argument. -/
theorem spectralMeasure_eq_map_diagMeasure {A : Matrix ι ι ℂ} (hA : A.IsHermitian)
    [IsStarNormal (Matrix.toEuclideanCLM (n := ι) (𝕜 := ℂ) A)] (b : ι → ℂ) :
    spectralMeasure hA b =
      ((Matrix.toEuclideanCLM (n := ι) (𝕜 := ℂ) A).diagMeasure (WithLp.toLp 2 b)).map
        (fun z : spectrum ℂ (Matrix.toEuclideanCLM (n := ι) (𝕜 := ℂ) A) => (z : ℂ).re) := by
  sorry

/-- 1.2 Exact termination and strict decrease: for positive definite `A`, the `k`-th conjugate
gradient iterate is `A⁻¹ b` if and only if `k` is at least the number of points of the support
of the spectral measure of the initial residual; below that number the energy norm of the error
decreases strictly at the next step. -/
theorem IsCGIterate.eq_inv_mulVec_iff {A : Matrix ι ι 𝕜} (hA : A.PosDef) {b x₀ : ι → 𝕜}
    {k : ℕ} {x : ι → 𝕜} (hx : IsCGIterate A b x₀ k x) :
    (x = A⁻¹ *ᵥ b ↔ (spectralMeasure hA.isHermitian (b - A *ᵥ x₀)).support.ncard ≤ k) ∧
      ∀ x' : ι → 𝕜, IsCGIterate A b x₀ (k + 1) x' →
        k < (spectralMeasure hA.isHermitian (b - A *ᵥ x₀)).support.ncard →
          energyNorm A (x' - A⁻¹ *ᵥ b) < energyNorm A (x - A⁻¹ *ᵥ b) := by
  sorry

/-! ## Layer 2: Lanczos vectors, Jacobi matrices and Gauss quadrature -/

/-- 2.1 The Lanczos vectors of `(A, b)`: the Gram–Schmidt orthonormalization of
`b, A b, A² b, …` (Mathlib's, which returns `0` at a vector dependent on the earlier ones). -/
def lanczosVec (A : Matrix ι ι 𝕜) (b : ι → 𝕜) (j : ℕ) : ι → 𝕜 :=
  (InnerProductSpace.gramSchmidtNormed 𝕜
    (fun i : ℕ => (WithLp.toLp 2 ((A ^ i) *ᵥ b) : EuclideanSpace 𝕜 ι)) j).ofLp

/-- 2.1 The Lanczos matrix `T_k = Q_k* A Q_k` of the first `k` Lanczos vectors. -/
def lanczosMatrix (A : Matrix ι ι 𝕜) (b : ι → 𝕜) (k : ℕ) : Matrix (Fin k) (Fin k) 𝕜 :=
  Matrix.of fun i j => star (lanczosVec A b i) ⬝ᵥ (A *ᵥ lanczosVec A b j)

/-- 2.1 Lanczos is the Stieltjes procedure of the spectral measure `μ`: the Lanczos vectors are
the orthonormal polynomials of `μ` applied to `b`, they satisfy the three-term relation with the
recurrence coefficients of `μ` for every index, the recurrence is unreduced below the grade
`g = |supp μ|` and stops at it, and for `k ≤ g` the Lanczos matrix is the Jacobi matrix of `μ`,
with characteristic polynomial the monic orthogonal polynomial of degree `k`. -/
theorem lanczos_spec {A : Matrix ι ι 𝕜} (hA : A.IsHermitian) (b : ι → 𝕜) :
    let μ := spectralMeasure hA b
    (∀ j : ℕ, lanczosVec A b j = aeval A (orthonormal μ j) *ᵥ b) ∧
      (∀ j : ℕ, A *ᵥ lanczosVec A b j =
        (√(beta μ (j + 1)) : 𝕜) • lanczosVec A b (j + 1) + (alpha μ j : 𝕜) • lanczosVec A b j +
          (√(beta μ j) : 𝕜) • lanczosVec A b (j - 1)) ∧
      (∀ i : ℕ, i + 1 < μ.support.ncard → 0 < beta μ (i + 1)) ∧ beta μ μ.support.ncard = 0 ∧
      ∀ k ≤ μ.support.ncard,
        lanczosMatrix A b k = (jacobiMatrix (fun i => √(beta μ (i + 1))) (alpha μ)
            (fun i => √(beta μ i)) k).map (algebraMap ℝ 𝕜) ∧
          (lanczosMatrix A b k).charpoly = (monic μ k).map (algebraMap ℝ 𝕜) := by
  sorry

/-- 2.2 The Ritz values: for `k` at most the grade, the monic orthogonal polynomial of degree `k`
of the spectral measure has `k` real simple roots; below the grade every root lies strictly
between the smallest and the largest point of the support. -/
theorem monic_roots_spectralMeasure {A : Matrix ι ι 𝕜} (hA : A.IsHermitian) (b : ι → 𝕜)
    {k : ℕ} (hk : k ≤ (spectralMeasure hA b).support.ncard) :
    ((monic (spectralMeasure hA b) k).roots.Nodup ∧
        Multiset.card (monic (spectralMeasure hA b) k).roots = k) ∧
      (k < (spectralMeasure hA b).support.ncard →
        ∀ t ∈ (monic (spectralMeasure hA b) k).roots,
          (∃ s ∈ (spectralMeasure hA b).support, s < t) ∧
            ∃ s ∈ (spectralMeasure hA b).support, t < s) := by
  sorry

/-- 2.3 Lanczos is Gauss quadrature: for `1 ≤ k ≤ g`, `b* q(A) b = (b* b) · q(T_k)₀₀` for every
real polynomial of degree below `2k`; the Christoffel numbers of the spectral measure are
positive and give the `k`-point Gauss rule at the Ritz values; at `k = g` the Gauss measure is
the spectral measure itself. -/
theorem lanczos_gauss {A : Matrix ι ι 𝕜} (hA : A.IsHermitian) (b : ι → 𝕜) {k : ℕ}
    (hk : 0 < k) (hkg : k ≤ (spectralMeasure hA b).support.ncard) :
    (∀ q : ℝ[X], q.natDegree < 2 * k →
        star b ⬝ᵥ (aeval A q *ᵥ b) =
          (star b ⬝ᵥ b) * aeval (lanczosMatrix A b k) q ⟨0, hk⟩ ⟨0, hk⟩) ∧
      (∀ i, 0 < christoffelNumber (spectralMeasure hA b) k i) ∧
      (∀ q : ℝ[X], q.natDegree < 2 * k →
        ∫ x, q.eval x ∂(spectralMeasure hA b) =
          ∑ i, christoffelNumber (spectralMeasure hA b) k i *
            q.eval (zeros (spectralMeasure hA b) k i)) ∧
      (k = (spectralMeasure hA b).support.ncard →
        ∑ i, ENNReal.ofReal (christoffelNumber (spectralMeasure hA b) k i) •
          Measure.dirac (zeros (spectralMeasure hA b) k i) = spectralMeasure hA b) := by
  sorry

/-- 2.4 The J-fraction: for `k ≤ g` and `z ∈ ℂ` off the Ritz values, the Stieltjes
transform of the `k`-point Gauss measure is `μ(ℝ)` times the `k`-th convergent of the J-fraction
of `μ`; at `k = g` it is the Stieltjes transform of `μ` itself. -/
theorem sum_christoffelNumber_div_eq_convs {A : Matrix ι ι 𝕜} (hA : A.IsHermitian)
    (b : ι → 𝕜) {k : ℕ} (hkg : k ≤ (spectralMeasure hA b).support.ncard) {z : ℂ}
    (hz : aeval z (monic (spectralMeasure hA b) k) ≠ 0) :
    ∑ i, (christoffelNumber (spectralMeasure hA b) k i : ℂ) /
        (z - zeros (spectralMeasure hA b) k i) =
      ((spectralMeasure hA b).real Set.univ : ℂ) *
        (jFraction (fun j => (alpha (spectralMeasure hA b) j : ℂ))
          (fun j => (beta (spectralMeasure hA b) j : ℂ)) z).convs k ∧
      (k = (spectralMeasure hA b).support.ncard →
        ∑ i, (christoffelNumber (spectralMeasure hA b) k i : ℂ) /
            (z - zeros (spectralMeasure hA b) k i) =
          ∫ x, (z - x)⁻¹ ∂(spectralMeasure hA b)) := by
  sorry

/-! ## Layer 3: conjugate gradients through Lanczos -/

/-- 3.1 Conjugate gradients through Lanczos: for positive definite `A`, `μ` the spectral measure
of the initial residual `r₀ = b − A x₀` and `k ≤ g`, the residual of the `k`-th iterate is
`monic μ k (A) r₀ / monic μ k (0)`, the squared energy norm of its error is
`∫ λ⁻¹ (monic μ k (λ)/monic μ k (0))² dμ`, which is the error of the `k`-point Gauss rule for
`λ⁻¹`, and the iterate is `x₀ + ‖r₀‖ Q_k T_k⁻¹ e_0` with `e_0 = (1, 0, …, 0)`. -/
theorem IsCGIterate.lanczos {A : Matrix ι ι 𝕜} (hA : A.PosDef) {b x₀ : ι → 𝕜} {k : ℕ}
    {x : ι → 𝕜} (hx : IsCGIterate A b x₀ k x)
    (hkg : k ≤ (spectralMeasure hA.isHermitian (b - A *ᵥ x₀)).support.ncard) :
    let μ := spectralMeasure hA.isHermitian (b - A *ᵥ x₀)
    (monic μ k).eval 0 ≠ 0 ∧
      b - A *ᵥ x = ((((monic μ k).eval 0)⁻¹ : ℝ) : 𝕜) •(aeval A (monic μ k) *ᵥ (b - A *ᵥ x₀)) ∧
      energyNorm A (x - A⁻¹ *ᵥ b) ^ 2 =
        ∫ t, t⁻¹ * ((monic μ k).eval t / (monic μ k).eval 0) ^ 2 ∂μ ∧
      energyNorm A (x - A⁻¹ *ᵥ b) ^ 2 =
        ∫ t, t⁻¹ ∂μ - ∑ i, christoffelNumber μ k i / zeros μ k i ∧
      ∀ hk : 0 < k, x - x₀ = (energyNorm 1 (b - A *ᵥ x₀) : 𝕜) •
        ∑ j : Fin k, (lanczosMatrix A (b - A *ᵥ x₀) k)⁻¹ j ⟨0, hk⟩ •
          lanczosVec A (b - A *ᵥ x₀) j := by
  sorry

/-- 3.2 The step size `γ = (r* r)(p* A p)⁻¹` of the Hestenes–Stiefel recurrence at the state
`(x, r, p)`. -/
def hsStepSize (A : Matrix ι ι 𝕜) (s : (ι → 𝕜) × (ι → 𝕜) × (ι → 𝕜)) : 𝕜 :=
  (star s.2.1 ⬝ᵥ s.2.1) * (star s.2.2 ⬝ᵥ (A *ᵥ s.2.2))⁻¹

/-- 3.2 One step of the Hestenes–Stiefel recurrence on the state (iterate, residual, direction):
`x' = x + γ p`, `r' = r − γ A p`, `p' = r' + ((r'* r')(r* r)⁻¹) p`. -/
def hsStep (A : Matrix ι ι 𝕜) (s : (ι → 𝕜) × (ι → 𝕜) × (ι → 𝕜)) :
    (ι → 𝕜) × (ι → 𝕜) × (ι → 𝕜) :=
  let r' := s.2.1 - hsStepSize A s • (A *ᵥ s.2.2)
  (s.1 + hsStepSize A s • s.2.2, r', r' + ((star r' ⬝ᵥ r') * (star s.2.1 ⬝ᵥ s.2.1)⁻¹) • s.2.2)

/-- 3.2 The `k`-th state of the Hestenes–Stiefel recurrence started at
`(x₀, b − A x₀, b − A x₀)`. -/
def hsIterate (A : Matrix ι ι 𝕜) (b x₀ : ι → 𝕜) (k : ℕ) : (ι → 𝕜) × (ι → 𝕜) × (ι → 𝕜) :=
  (hsStep A)^[k] (x₀, b - A *ᵥ x₀, b - A *ᵥ x₀)

/-- 3.2 The Hestenes–Stiefel recurrence computes the conjugate gradient iterates: for positive
definite `A` and every `k`, its iterate is the `k`-th conjugate gradient iterate and its residual
is `b − A x_k`; each step lowers the squared energy norm of the error by `γ_k r_k* r_k`; below the
grade the step size is a positive real number. -/
theorem hsIterate_spec {A : Matrix ι ι 𝕜} (hA : A.PosDef) (b x₀ : ι → 𝕜) (k : ℕ) :
    IsCGIterate A b x₀ k (hsIterate A b x₀ k).1 ∧
      (hsIterate A b x₀ k).2.1 = b - A *ᵥ (hsIterate A b x₀ k).1 ∧
      energyNorm A ((hsIterate A b x₀ k).1 - A⁻¹ *ᵥ b) ^ 2 -
          energyNorm A ((hsIterate A b x₀ (k + 1)).1 - A⁻¹ *ᵥ b) ^ 2 =
        RCLike.re (hsStepSize A (hsIterate A b x₀ k) *
          (star (hsIterate A b x₀ k).2.1 ⬝ᵥ (hsIterate A b x₀ k).2.1)) ∧
      (k < (spectralMeasure hA.isHermitian (b - A *ᵥ x₀)).support.ncard →
        ∃ γ : ℝ, 0 < γ ∧ hsStepSize A (hsIterate A b x₀ k) = γ) := by
  sorry

/-! ## Layer 4: lower bounds, worst cases and polynomial acceleration -/

/-- 4.1 The discrete lower bound: let `t₀ < ⋯ < t_k` be positive and suppose the spectral measure
of the initial error `e₀ = x₀ − A⁻¹ b` is `Σ_l s |c_l| t_l⁻² δ_(t_l)`, where
`c_l = ∏_(j ≠ l) (t_l − t_j)⁻¹`. Then every `y` with `y − x₀ ∈ K_k(A, r₀)` has error at least
`V ‖e₀‖_A`, `V = (Σ_l ∏_(j ≠ l) t_j / |t_j − t_l|)⁻¹`, and the conjugate gradient iterate attains
it. -/
theorem le_energyNorm_of_mem_krylov {A : Matrix ι ι 𝕜} (hA : A.PosDef) {k : ℕ}
    (t : Fin (k + 1) → ℝ) (ht : StrictMono t) (ht0 : ∀ l, 0 < t l) {b x₀ : ι → 𝕜} (s : ℝ)
    (hμ : spectralMeasure hA.isHermitian (x₀ - A⁻¹ *ᵥ b) =
      ∑ l, ENNReal.ofReal (s * |∏ j ∈ univ.erase l, (t l - t j)⁻¹| / t l ^ 2) •
        Measure.dirac (t l)) :
    let V := (∑ l, ∏ j ∈ univ.erase l, t j / |t j - t l|)⁻¹
    (∀ y : ι → 𝕜, y - x₀ ∈ krylov A (b - A *ᵥ x₀) k →
        V * energyNorm A (x₀ - A⁻¹ *ᵥ b) ≤ energyNorm A (y - A⁻¹ *ᵥ b)) ∧
      ∀ y : ι → 𝕜, IsCGIterate A b x₀ k y →
        energyNorm A (y - A⁻¹ *ᵥ b) = V * energyNorm A (x₀ - A⁻¹ *ᵥ b) := by
  sorry

/-- 4.1 Sharpness of the Chebyshev bound: for `0 < α < β` and every `k` there is a positive
definite real matrix of size `k + 1` with spectrum in `[α, β]` and a nonzero `b` such that, from
`x₀ = 0`, every point of `K_k(A, b)` has error at least `1/T_k((β + α)/(β − α))` times the
initial error in the energy norm, the conjugate gradient iterate has exactly this error, and
`1/T_k((β + α)/(β − α)) ≥ ((√κ − 1)/(√κ + 1))^k` for `κ = β/α`. -/
theorem exists_isCGIterate_energyNorm_eq {α β : ℝ} (hα : 0 < α) (hαβ : α < β) (k : ℕ) :
    ∃ (A : Matrix (Fin (k + 1)) (Fin (k + 1)) ℝ) (hA : A.PosDef) (b : Fin (k + 1) → ℝ),
      (∀ i, hA.isHermitian.eigenvalues i ∈ Set.Icc α β) ∧ b ≠ 0 ∧
      (∀ y, y ∈ krylov A b k →
        ((Chebyshev.T ℝ k).eval ((β + α) / (β - α)))⁻¹ * energyNorm A (A⁻¹ *ᵥ b) ≤
          energyNorm A (y - A⁻¹ *ᵥ b)) ∧
      (∀ y, IsCGIterate A b 0 k y →
        energyNorm A (y - A⁻¹ *ᵥ b) =
          ((Chebyshev.T ℝ k).eval ((β + α) / (β - α)))⁻¹ * energyNorm A (A⁻¹ *ᵥ b)) ∧
      ((√(β / α) - 1) / (√(β / α) + 1)) ^ k ≤
        ((Chebyshev.T ℝ k).eval ((β + α) / (β - α)))⁻¹ := by
  sorry

/-- 4.2 Greenbaum's worst-case theorem: for positive definite `A` on a nonempty index type, the
largest ratio `‖e_k‖_A / ‖e₀‖_A` over all right-hand sides and starting vectors with `e₀ ≠ 0` is
attained and equals the least value of `max_i |p(λ_i)|` over real polynomials of degree at most
`k` with `p(0) = 1`, which is also attained. -/
theorem isGreatest_energyNorm_ratio [Nonempty ι] {A : Matrix ι ι 𝕜} (hA : A.PosDef) (k : ℕ) :
    ∃ E : ℝ,
      IsLeast {M : ℝ | ∃ p : ℝ[X], p.natDegree ≤ k ∧ p.eval 0 = 1 ∧
          ∀ i, |p.eval (hA.isHermitian.eigenvalues i)| ≤ M} E ∧
        IsGreatest {ρ : ℝ | ∃ b x₀ x : ι → 𝕜, x₀ ≠ A⁻¹ *ᵥ b ∧ IsCGIterate A b x₀ k x ∧
          ρ = energyNorm A (x - A⁻¹ *ᵥ b) / energyNorm A (x₀ - A⁻¹ *ᵥ b)} E := by
  sorry

/-- 4.3 Outlying eigenvalues: if every eigenvalue of the positive definite `A` lies in `[a, c]`
(`0 < a ≤ c`) or in a finite set `O`, then for `k ≥ |O|` the `k`-th conjugate gradient iterate
satisfies `‖e_k‖_A ≤ 2 (∏_(t ∈ O) max |1 − a/t| |1 − c/t|) ((√κ − 1)/(√κ + 1))^(k − |O|) ‖e₀‖_A`
with `κ = c/a`. -/
theorem IsCGIterate.energyNorm_sub_le_of_outliers {A : Matrix ι ι 𝕜} (hA : A.PosDef) {a c : ℝ}
    (ha : 0 < a) (hac : a ≤ c) (O : Finset ℝ)
    (hspec : ∀ i, hA.isHermitian.eigenvalues i ∈ Set.Icc a c ∨ hA.isHermitian.eigenvalues i ∈ O)
    {b x₀ : ι → 𝕜} {k : ℕ} {x : ι → 𝕜} (hx : IsCGIterate A b x₀ k x) (hk : O.card ≤ k) :
    energyNorm A (x - A⁻¹ *ᵥ b) ≤
      2 * (∏ t ∈ O, max |1 - a / t| |1 - c / t|) *
        ((√(c / a) - 1) / (√(c / a) + 1)) ^ (k - O.card) * energyNorm A (x₀ - A⁻¹ *ᵥ b) := by
  sorry

/-- 4.4 Chebyshev iteration as a three-term recurrence: for `0 < α < β`, with
`σ = (β + α)/(β − α)`, `γ = 2/(α + β)` and `ω_(k+1) = 2σ T_k(σ)/T_(k+1)(σ)`, the first Chebyshev
iterate is `x₀ + γ r₀` and `x_(k+1) = x_k + (ω_(k+1) − 1)(x_k − x_(k−1)) + ω_(k+1) γ (b − A x_k)`
for `k ≥ 1`; the weights `ω_(k+1)` decrease strictly to `1 + q²`, `q = (√β − √α)/(√β + √α)`, so
that the step `ω_(k+1) γ` tends to `4/(√β + √α)²`, the parameters of the heavy-ball method. -/
theorem chebyshevIterate_succ (A : Matrix ι ι 𝕜) (b x₀ : ι → 𝕜) {α β : ℝ} (hα : 0 < α)
    (hαβ : α < β) :
    let σ := (β + α) / (β - α)
    let ω : ℕ → ℝ := fun k => 2 * σ * (Chebyshev.T ℝ k).eval σ / (Chebyshev.T ℝ (k + 1)).eval σ
    let q := (√β - √α) / (√β + √α)
    chebyshevIterate A b α β 1 x₀ = x₀ + (2 / (α + β)) • (b - A *ᵥ x₀) ∧
      (∀ k, 1 ≤ k → chebyshevIterate A b α β (k + 1) x₀ =
        chebyshevIterate A b α β k x₀ +
          (ω k - 1) • (chebyshevIterate A b α β k x₀ - chebyshevIterate A b α β (k - 1) x₀) +
          (ω k * (2 / (α + β))) • (b - A *ᵥ chebyshevIterate A b α β k x₀)) ∧
      StrictAnti ω ∧ Tendsto ω atTop (𝓝 (1 + q ^ 2)) ∧
      Tendsto (fun k => ω k * (2 / (α + β))) atTop (𝓝 (4 / (√β + √α) ^ 2)) := by
  sorry

/-- 4.4 The heavy-ball rate cannot be improved: for `0 < α < β` and every `k` there is a
quadratic `f x = ⟪A x, x⟫/2 − ⟪b, x⟫` on `ℝ^(k+1)` with `α ‖v‖² ≤ ⟪A v, v⟫ ≤ β ‖v‖²` and a
starting point `x₀ ≠ x⋆` at which the `k`-th heavy-ball iterate with the parameters of
FirstOrderOptimization 4.1 has error at least `√(α/β) q^k ‖x₀ − x⋆‖`,
`q = (√β − √α)/(√β + √α)`. -/
theorem exists_heavyBall_error_ge {α β : ℝ} (hα : 0 < α) (hαβ : α < β) (k : ℕ) :
    ∃ (A : EuclideanSpace ℝ (Fin (k + 1)) →L[ℝ] EuclideanSpace ℝ (Fin (k + 1)))
      (b xstar x₀ : EuclideanSpace ℝ (Fin (k + 1))),
      (A : EuclideanSpace ℝ (Fin (k + 1)) →ₗ[ℝ] EuclideanSpace ℝ (Fin (k + 1))).IsSymmetric ∧
      (∀ v, α * ‖v‖ ^ 2 ≤ ⟪A v, v⟫ ∧ ⟪A v, v⟫ ≤ β * ‖v‖ ^ 2) ∧ A xstar = b ∧ x₀ ≠ xstar ∧
      let f : EuclideanSpace ℝ (Fin (k + 1)) → ℝ := fun x ↦ ⟪A x, x⟫ / 2 - ⟪b, x⟫
      let q := (√β - √α) / (√β + √α)
      √(α / β) * q ^ k * ‖x₀ - xstar‖ ≤
        ‖((heavyBallStep f (4 / (√β + √α) ^ 2) (q ^ 2))^[k] (x₀, x₀)).1 - xstar‖ := by
  sorry

/-! ## Layer 5: Ritz values -/

/-- 5.1 The Kaniel–Paige–Saad bound for the largest Ritz value: if every eigenvalue of the
Hermitian `A` is `λ₁` or lies in `[a, c]` with `c < λ₁`, and the spectral measure `μ` of `b`
charges `λ₁`, then for `k + 1 ≤ g` the largest zero `θ` of `monic μ (k + 1)` (the largest
eigenvalue of `T_(k+1)`) satisfies
`λ₁ − (λ₁ − a) (μ(ℝ ∖ {λ₁})/μ{λ₁}) / T_k(1 + 2(λ₁ − c)/(c − a))² ≤ θ ≤ λ₁`. -/
theorem le_zeros_last {A : Matrix ι ι 𝕜} (hA : A.IsHermitian) (b : ι → 𝕜) {lam a c : ℝ}
    (hspec : ∀ i, hA.eigenvalues i = lam ∨ hA.eigenvalues i ∈ Set.Icc a c) (hc : c < lam)
    (hlam : 0 < (spectralMeasure hA b).real {lam}) {k : ℕ}
    (hk : k + 1 ≤ (spectralMeasure hA b).support.ncard) :
    lam - (lam - a) * ((spectralMeasure hA b).real {lam}ᶜ / (spectralMeasure hA b).real {lam}) /
        ((Chebyshev.T ℝ k).eval (1 + 2 * (lam - c) / (c - a))) ^ 2 ≤
      zeros (spectralMeasure hA b) (k + 1) (Fin.last k) ∧
      zeros (spectralMeasure hA b) (k + 1) (Fin.last k) ≤ lam := by
  sorry

/-- 5.2 The residual of a Ritz pair and the Kato–Temple enclosure: for `1 ≤ k ≤ g`, a unit
eigenvector `s` of `T_k` with eigenvalue `θ` gives the Ritz vector `y = Σ_j s_j q_j`, with
`‖A y − θ y‖² = β_k |s_(k−1)|²`; hence, if `(a', b')` contains `θ` and exactly one eigenvalue
`λ` of `A`, then `−β_k |s_(k−1)|²/(θ − a') ≤ θ − λ ≤ β_k |s_(k−1)|²/(b' − θ)`. -/
theorem ritz_residual {A : Matrix ι ι 𝕜} (hA : A.IsHermitian) (b : ι → 𝕜) {k : ℕ}
    (hk : 0 < k) (hkg : k ≤ (spectralMeasure hA b).support.ncard) {θ : ℝ} {s : Fin k → 𝕜}
    (hs : star s ⬝ᵥ s = 1) (hθ : lanczosMatrix A b k *ᵥ s = (θ : 𝕜) • s) :
    let y := ∑ j, s j • lanczosVec A b j
    let ε2 := beta (spectralMeasure hA b) k * ‖s ⟨k - 1, by omega⟩‖ ^ 2
    energyNorm 1 (A *ᵥ y - (θ : 𝕜) • y) ^ 2 = ε2 ∧
      ∀ {a' b' lam : ℝ}, a' < θ → θ < b' → (∃ i, hA.eigenvalues i = lam) → lam ∈ Set.Ioo a' b' →
        (∀ i, hA.eigenvalues i ∈ Set.Ioo a' b' → hA.eigenvalues i = lam) →
        -ε2 / (θ - a') ≤ θ - lam ∧ θ - lam ≤ ε2 / (b' - θ) := by
  sorry

end TauCetiRoadmap.KrylovMethodsAndOrthogonalPolynomials

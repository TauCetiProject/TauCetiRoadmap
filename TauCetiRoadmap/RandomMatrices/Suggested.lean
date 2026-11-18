import Mathlib
import TauCeti.Analysis.Matrix.SampleSecondMoment
import TauCeti.Analysis.Matrix.SpectralMeasure
import TauCeti.Probability.Distributions.Semicircle.LocationScale
import TauCeti.Probability.Distributions.MarchenkoPastur.Basic
import TauCeti.Probability.RandomMatrix.Wigner
import TauCeti.Probability.FreeProbability.Distribution.Convergence
import TauCeti.Probability.FreeProbability.Semicircular.Basic
import TauCeti.Probability.FreeProbability.Variables

/-!
# Random matrices: target signatures

This file is not the roadmap: the roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with
the few definitions their statements need. The spectral and eigenvalue measures, the semicircle
and Marchenko–Pastur laws, the Wigner matrix and the sample second-moment matrix are Tau Ceti's
and are used by name.

Stated here: the almost-sure semicircle law for Wigner matrices and the Bai–Yin limits of their
extreme eigenvalues (Layer 4); the almost-sure Marchenko–Pastur law and the extreme eigenvalues
of sample covariance matrices (Layer 4); the Hanson–Wright inequality and the Hermitian matrix
Bernstein inequality (Layer 2); the ordered eigenvalue densities of GOE and GUE with their
Gaussian Selberg normalisation (Layer 5); almost-sure asymptotic freeness of independent Wigner
matrices and of Haar-conjugated deterministic matrices (Layer 6); the rank-one spiked largest
eigenvalue (Layer 7); the central limit theorem for polynomial linear statistics of GOE and GUE,
the Tracy–Widom limits `F₂` of the GUE and `F₁` of the GOE largest eigenvalue and the GUE bulk gap
probability (Layer 8); the large deviation principles of the GOE and GUE empirical spectral
measure and largest eigenvalue (Layer 9); the Rudelson–Vershynin least-singular-value bound and
the almost-sure circular law (Layer 10).

Not statable at the pins: `L_{Dₙ+√t Hₙ} → ν ⊞ SC_t` and the population-covariance law
`ν ⊠ MP_y`, since the pins have no free convolution of probability measures.
-/

noncomputable section

open MeasureTheory ProbabilityTheory Matrix Filter Polynomial
open scoped BigOperators ENNReal NNReal Topology BoundedContinuousFunction ComplexOrder
  Matrix.Norms.L2Operator

namespace TauCetiRoadmap.RandomMatrices

open TauCeti TauCeti.Probability

/-! ## Layer 2: concentration -/

/-- **Hanson–Wright inequality** (Rudelson–Vershynin 2013, Theorem 1.1). There is an absolute
constant `c > 0` such that for independent real coordinates `Xᵢ`, each sub-Gaussian with variance
proxy `K`, and every real square matrix `A`, the quadratic form `XᵀAX` deviates from its mean by
more than `t ≥ 0` with probability at most `2 exp(-c min(t²/(K² ‖A‖_F²), t/(K ‖A‖)))`, where
`‖A‖_F² = ∑ᵢⱼ Aᵢⱼ²` and `‖A‖` is the Euclidean operator norm. -/
theorem hanson_wright :
    ∃ c : ℝ, 0 < c ∧
      ∀ {Ω : Type*} [MeasurableSpace Ω] (P : Measure Ω) [IsProbabilityMeasure P] {n : ℕ}
        (X : Fin n → Ω → ℝ) (K : ℝ≥0), iIndepFun X P → (∀ i, HasSubgaussianMGF (X i) K P) →
        ∀ (A : Matrix (Fin n) (Fin n) ℝ) (t : ℝ), 0 ≤ t →
          P.real {ω | t < |(fun i ↦ X i ω) ⬝ᵥ A *ᵥ (fun i ↦ X i ω) -
              ∫ ω', (fun i ↦ X i ω') ⬝ᵥ A *ᵥ (fun i ↦ X i ω') ∂P|} ≤
            2 * Real.exp (-c * min (t ^ 2 / ((K : ℝ) ^ 2 * ∑ i, ∑ j, A i j ^ 2))
              (t / ((K : ℝ) * ‖A‖))) := by
  sorry

/-- **Hermitian matrix Bernstein inequality** (Tropp 2012, Theorem 1.4 applied to `±Xₖ`). For
independent measurable random Hermitian `d × d` matrices `Xₖ` with entrywise mean zero and
`‖Xₖ‖ ≤ L` everywhere, and `v = ‖∑ₖ E Xₖ²‖`, the operator norm of `∑ₖ Xₖ` is at least `t > 0`
with probability at most `2d exp(-(t²/2)/(v + Lt/3))`. -/
theorem matrix_bernstein {Ω : Type*} [MeasurableSpace Ω] (P : Measure Ω) [IsProbabilityMeasure P]
    {d m : ℕ} (X : Fin m → Ω → Matrix (Fin d) (Fin d) ℂ) (hmeas : ∀ k, Measurable (X k))
    (hindep : iIndepFun X P) (hherm : ∀ k ω, (X k ω).IsHermitian)
    (hmean : ∀ k i j, ∫ ω, X k ω i j ∂P = 0) (L : ℝ) (hbound : ∀ k ω, ‖X k ω‖ ≤ L)
    (t : ℝ) (ht : 0 < t) :
    P.real {ω | t ≤ ‖∑ k, X k ω‖} ≤
      2 * d * Real.exp (-(t ^ 2 / 2) /
        (‖Matrix.of fun i j ↦ ∑ k, ∫ ω, (X k ω * X k ω) i j ∂P‖ + L * t / 3)) := by
  sorry

/-! ## Layer 3: named spectral laws -/

/-- The circular law: Lebesgue measure on `ℂ` conditioned on the open unit disc, which is
`π⁻¹ 1_{|z| < 1} d(area)`; it is the two-dimensional uniform ball law of StandardDistributions,
target 12.1, transported to `ℂ`. -/
def circularLaw : Measure ℂ :=
  ProbabilityTheory.cond volume (Metric.ball (0 : ℂ) 1)

/-! ## Layer 4: Wigner and sample-covariance global laws -/

section Wigner

variable {Ω : Type*} [MeasurableSpace Ω]

/-- **Semicircle law, almost surely** (Bai 1999, Theorem 2.1; Tao, Theorem 2.4.2 for centred
entries with a diagonal of finite second moment). Let the strictly upper entries `ξ` be i.i.d.
complex with law `ν` of finite second moment and centred second moment `E|ξ - Eξ|² = 1`, and the
diagonal entries `η` i.i.d. real with any law `ν₀`, all independent. Then almost surely the
empirical spectral measures of the normalised Wigner matrices converge weakly to
`semicircleReal 0 1`. -/
theorem wigner_semicircle_ae (P : Measure Ω) [IsProbabilityMeasure P]
    (ν : Measure ℂ) [IsProbabilityMeasure ν] (ν₀ : Measure ℝ) [IsProbabilityMeasure ν₀]
    (ξ : StrictUpper → Ω → ℂ) (η : ℕ → Ω → ℝ)
    (hξ : ∀ ij, HasLaw (ξ ij) ν P) (hη : ∀ i, HasLaw (η i) ν₀ P)
    (hindep : iIndepFun (fun k : StrictUpper ⊕ ℕ ↦ Sum.elim ξ (fun i ω ↦ (η i ω : ℂ)) k) P)
    (hsecond : Integrable (fun z : ℂ ↦ ‖z‖ ^ 2) ν)
    (hvar : ∫ z, ‖z - ∫ w, w ∂ν‖ ^ 2 ∂ν = 1) :
    ∀ᵐ ω ∂P, ∀ f : ℝ →ᵇ ℝ,
      Tendsto (fun n : ℕ ↦ ∫ x, f x ∂(Matrix.spectralMeasure (wignerMatrix ξ η (n + 1) ω)
          (wignerMatrix_isHermitian ξ η ω (n + 1)) : Measure ℝ))
        atTop (𝓝 (∫ x, f x ∂semicircleReal 0 1)) := by
  sorry

/-- **Bai–Yin theorem for Wigner matrices** (Bai 1999, Theorem 2.12, and its reflection
`W ↦ -W`). Let the strictly upper entries be i.i.d. complex of mean zero, `E|ξ|² = 1` and finite
fourth moment, and the diagonal entries i.i.d. real of finite second moment, all independent.
Then almost surely the largest eigenvalue of the normalised Wigner matrix tends to `2`
and the smallest to `-2`. -/
theorem wigner_extreme_eigenvalues_ae (P : Measure Ω) [IsProbabilityMeasure P]
    (ν : Measure ℂ) [IsProbabilityMeasure ν] (ν₀ : Measure ℝ) [IsProbabilityMeasure ν₀]
    (ξ : StrictUpper → Ω → ℂ) (η : ℕ → Ω → ℝ)
    (hξ : ∀ ij, HasLaw (ξ ij) ν P) (hη : ∀ i, HasLaw (η i) ν₀ P)
    (hindep : iIndepFun (fun k : StrictUpper ⊕ ℕ ↦ Sum.elim ξ (fun i ω ↦ (η i ω : ℂ)) k) P)
    (hmean : ∫ z, z ∂ν = 0) (hfourth : Integrable (fun z : ℂ ↦ ‖z‖ ^ 4) ν)
    (hvar : ∫ z, ‖z‖ ^ 2 ∂ν = 1) (hdiag : Integrable (fun x : ℝ ↦ x ^ 2) ν₀) :
    ∀ᵐ ω ∂P,
      Tendsto (fun n : ℕ ↦ ⨆ i, (wignerMatrix_isHermitian ξ η ω (n + 1)).eigenvalues i)
        atTop (𝓝 2) ∧
      Tendsto (fun n : ℕ ↦ ⨅ i, (wignerMatrix_isHermitian ξ η ω (n + 1)).eigenvalues i)
        atTop (𝓝 (-2)) := by
  sorry

end Wigner

section Covariance

/-- The sample covariance matrix `S = XX*/n` of a `p × n` data matrix `X`: Tau Ceti's
sample second-moment matrix of the `n` columns of `X`. -/
def sampleCovariance {p n : ℕ} (X : Matrix (Fin p) (Fin n) ℂ) : Matrix (Fin p) (Fin p) ℂ :=
  TauCeti.sampleSecondMoment fun j i ↦ X i j

/-- A sample covariance matrix is Hermitian. -/
theorem sampleCovariance_isHermitian {p n : ℕ} (X : Matrix (Fin p) (Fin n) ℂ) :
    (sampleCovariance X).IsHermitian :=
  TauCeti.isHermitian_sampleSecondMoment _

variable {Ω : Type*} [MeasurableSpace Ω]

/-- **Marchenko–Pastur law, almost surely** (Bai 1999, Theorem 2.5). Let `x` be a doubly
infinite array of i.i.d. complex entries of law `ν` with mean zero and `E|x|² = 1`, let `p(n) ≥ 1`
with `p(n)/n → y > 0`, and let `Xₙ` be the top-left `p(n) × n` corner of the array. Then almost
surely the empirical spectral measures of `XₙXₙ*/n` converge weakly to `MP_y`. -/
theorem marchenkoPastur_ae (P : Measure Ω) [IsProbabilityMeasure P]
    (ν : Measure ℂ) [IsProbabilityMeasure ν] (x : ℕ × ℕ → Ω → ℂ)
    (hx : ∀ ij, HasLaw (x ij) ν P) (hindep : iIndepFun x P)
    (hmean : ∫ z, z ∂ν = 0) (hsecond : Integrable (fun z : ℂ ↦ ‖z‖ ^ 2) ν)
    (hvar : ∫ z, ‖z‖ ^ 2 ∂ν = 1)
    (p : ℕ → ℕ) [∀ n, NeZero (p n)] (y : ℝ≥0) (hy : 0 < y)
    (hp : Tendsto (fun n ↦ (p n : ℝ) / n) atTop (𝓝 y)) :
    ∀ᵐ ω ∂P, ∀ f : ℝ →ᵇ ℝ,
      Tendsto (fun n ↦ ∫ t, f t ∂(Matrix.spectralMeasure
          (sampleCovariance (Matrix.of fun (i : Fin (p n)) (j : Fin n) ↦ x (i, j) ω))
          (sampleCovariance_isHermitian _) : Measure ℝ))
        atTop (𝓝 (∫ t, f t ∂marchenkoPastur y)) := by
  sorry

/-- **Extreme eigenvalues of sample covariance matrices** (Bai 1999, Theorems 2.15 and 2.16).
Under the hypotheses of `marchenkoPastur_ae` and a finite fourth moment, almost surely the
largest eigenvalue of `XₙXₙ*/n` tends to `(1 + √y)²`, and for `y < 1` the smallest tends to
`(1 - √y)²`. -/
theorem sampleCovariance_extreme_eigenvalues_ae (P : Measure Ω) [IsProbabilityMeasure P]
    (ν : Measure ℂ) [IsProbabilityMeasure ν] (x : ℕ × ℕ → Ω → ℂ)
    (hx : ∀ ij, HasLaw (x ij) ν P) (hindep : iIndepFun x P)
    (hmean : ∫ z, z ∂ν = 0) (hfourth : Integrable (fun z : ℂ ↦ ‖z‖ ^ 4) ν)
    (hvar : ∫ z, ‖z‖ ^ 2 ∂ν = 1)
    (p : ℕ → ℕ) [∀ n, NeZero (p n)] (y : ℝ≥0) (hy : 0 < y)
    (hp : Tendsto (fun n ↦ (p n : ℝ) / n) atTop (𝓝 y)) :
    ∀ᵐ ω ∂P,
      Tendsto (fun n ↦ ⨆ i, (sampleCovariance_isHermitian
          (Matrix.of fun (i : Fin (p n)) (j : Fin n) ↦ x (i, j) ω)).eigenvalues i)
        atTop (𝓝 ((1 + Real.sqrt y) ^ 2)) ∧
      ((y : ℝ) < 1 → Tendsto (fun n ↦ ⨅ i, (sampleCovariance_isHermitian
          (Matrix.of fun (i : Fin (p n)) (j : Fin n) ↦ x (i, j) ω)).eigenvalues i)
        atTop (𝓝 ((1 - Real.sqrt y) ^ 2))) := by
  sorry

end Covariance

/-! ## Layer 5: invariant ensembles -/

/-- The Gaussian orthogonal (`β = 1`) and unitary (`β ≠ 1`) ensembles of size `n` from a family
`g` of real coordinates, normalised by `√n`. For `β = 1` the matrix is real symmetric with
off-diagonal entries `g(i, j)` and diagonal entries `√2 g(i, i)`; otherwise the entry above the
diagonal is `(g(i, j) + i g(j, i))/√2`, its conjugate sits below, and `g(i, i)` is on the
diagonal. Standard Gaussian coordinates give GOE and GUE in the normalisation of the README. -/
def gaussianEnsemble (β n : ℕ) (g : Fin n × Fin n → ℝ) : Matrix (Fin n) (Fin n) ℂ :=
  Matrix.of fun i j ↦ ((Real.sqrt n)⁻¹ : ℂ) *
    if β = 1 then
      (if i < j then (g (i, j) : ℂ) else if j < i then (g (j, i) : ℂ)
        else (Real.sqrt 2 * g (i, i) : ℝ))
    else
      (if i < j then ((g (i, j) : ℂ) + g (j, i) * Complex.I) / (Real.sqrt 2 : ℂ)
        else if j < i then ((g (j, i) : ℂ) - g (i, j) * Complex.I) / (Real.sqrt 2 : ℂ)
        else (g (i, i) : ℂ))

/-- The Gaussian-ensemble matrix is Hermitian for every coordinate family. -/
theorem gaussianEnsemble_isHermitian (β n : ℕ) (g : Fin n × Fin n → ℝ) :
    (gaussianEnsemble β n g).IsHermitian := by
  ext i j
  simp only [gaussianEnsemble, conjTranspose_apply, of_apply, star_mul', star_inv₀,
    Complex.star_def, Complex.conj_ofReal]
  rcases lt_trichotomy i j with h | rfl | h
  · split_ifs <;> simp_all [h.not_gt, map_div₀]
  · split_ifs <;> simp_all
  · split_ifs <;> simp_all [Complex.ext_iff, h.not_gt, map_div₀]

/-- **Ordered eigenvalue density of GOE and GUE** (AGZ, Theorem 2.5.2, in the normalisation
`Hₙ = Wₙ/√n`). For `β ∈ {1, 2}` the decreasing eigenvalue vector of the Gaussian ensemble has
density `n! Z⁻¹ exp(-βn ∑ xᵢ²/4) ∏_{i<j} |xᵢ - xⱼ|^β` on the decreasing chamber, where
`Z = (βn/2)^(-n/2 - βn(n-1)/4) (2π)^(n/2) ∏_{j=1}^{n} Γ(1 + jβ/2)/Γ(1 + β/2)` is the Gaussian
Selberg integral. -/
theorem gaussianEnsemble_eigenvalue_density (β : ℕ) (hβ : β = 1 ∨ β = 2) (n : ℕ) :
    (Measure.pi fun _ : Fin n × Fin n ↦ gaussianReal 0 1).map
        (fun g ↦ (gaussianEnsemble_isHermitian β n g).eigenvalues₀) =
      volume.withDensity fun x : Fin (Fintype.card (Fin n)) → ℝ ↦
        {x : Fin (Fintype.card (Fin n)) → ℝ | Antitone x}.indicator (fun x ↦ ENNReal.ofReal
          (n.factorial /
              ((β * n / 2 : ℝ) ^ (-((n : ℝ) / 2 + β * n * (n - 1) / 4)) *
                (2 * Real.pi) ^ ((n : ℝ) / 2) *
                ∏ j ∈ Finset.Icc 1 n, (Real.Gamma (1 + j * β / 2) / Real.Gamma (1 + β / 2))) *
            Real.exp (-(β * n / 4 : ℝ) * ∑ i, x i ^ 2) *
            ∏ i, ∏ j ∈ Finset.Ioi i, |x i - x j| ^ (β : ℝ))) x := by
  sorry

/-! ## Layer 6: asymptotic freeness -/

section Freeness

variable {Ω : Type*} [MeasurableSpace Ω]

/-- **Asymptotic freeness of Wigner matrices, almost surely** (AGZ Theorem 5.4.2 for the
normalized trace). Let the entries of `k` Wigner arrays, complex strictly upper entries `ξ` and
real diagonal entries `η`, be independent, centred, of unit second moment, and with moments of
every order bounded uniformly in the matrix and the position; they need not be identically
distributed. Then almost surely the normalized-trace moments of the `k` Wigner matrices of size
`n + 1` converge to those of any free family of standard semicircular elements. -/
theorem wigner_asymptotically_free {k : ℕ} (P : Measure Ω) [IsProbabilityMeasure P]
    (ξ : Fin k → StrictUpper → Ω → ℂ) (η : Fin k → ℕ → Ω → ℝ)
    (hindep : iIndepFun (fun p : Fin k × (StrictUpper ⊕ ℕ) ↦
      Sum.elim (ξ p.1) (fun i ω ↦ (η p.1 i ω : ℂ)) p.2) P)
    (hint : ∀ (p : ℕ) l ij i, Integrable (fun ω ↦ ‖ξ l ij ω‖ ^ p) P ∧
      Integrable (fun ω ↦ |η l i ω| ^ p) P)
    (hbound : ∀ p : ℕ, ∃ C : ℝ, ∀ l ij i,
      ∫ ω, ‖ξ l ij ω‖ ^ p ∂P ≤ C ∧ ∫ ω, |η l i ω| ^ p ∂P ≤ C)
    (hmean : ∀ l ij i, ∫ ω, ξ l ij ω ∂P = 0 ∧ ∫ ω, η l i ω ∂P = 0)
    (hvar : ∀ l ij i, ∫ ω, ‖ξ l ij ω‖ ^ 2 ∂P = 1 ∧ ∫ ω, η l i ω ^ 2 ∂P = 1)
    {B : Type*} [Ring B] [Algebra ℂ B] (ψ : B →ₗ[ℂ] ℂ) (s : Fin k → B) (hψ : ψ 1 = 1)
    (hfree : IsFreelyIndependentElements ψ s) (hs : ∀ l, IsSemicircular ψ (s l) 1) :
    ∀ᵐ ω ∂P, TendstoInMoments (A := fun n : ℕ ↦ Matrix (Fin (n + 1)) (Fin (n + 1)) ℂ)
      (fun n ↦ ((n + 1 : ℂ)⁻¹) • Matrix.traceLinearMap (Fin (n + 1)) ℂ ℂ)
      (fun n l ↦ wignerMatrix (ξ l) (η l) (n + 1) ω) atTop ψ s := by
  sorry

/-- **Asymptotic freeness of Haar-conjugated matrices, almost surely** (AGZ Theorem 5.4.10,
Corollary 5.4.11(i)). Let `Aₙ, Bₙ` be deterministic Hermitian matrices of uniformly bounded
operator norm whose normalized-trace moments converge to those of `s 0` and `s 1`, a free pair,
and let `Uₙ` be Haar distributed on the unitary group. Then almost surely
`(Aₙ, UₙBₙUₙ*)` converges in moments to `(s 0, s 1)`. -/
theorem haar_conj_asymptotically_free (P : Measure Ω) [IsProbabilityMeasure P]
    (A B : ∀ n : ℕ, Matrix (Fin (n + 1)) (Fin (n + 1)) ℂ)
    (hA : ∀ n, (A n).IsHermitian) (hB : ∀ n, (B n).IsHermitian)
    (D : ℝ) (hAD : ∀ n, ‖A n‖ ≤ D) (hBD : ∀ n, ‖B n‖ ≤ D)
    (μ : ∀ n : ℕ, Measure (Matrix.unitaryGroup (Fin (n + 1)) ℂ))
    [∀ n, (μ n).IsHaarMeasure] [∀ n, IsProbabilityMeasure (μ n)]
    (U : ∀ n : ℕ, Ω → Matrix.unitaryGroup (Fin (n + 1)) ℂ) (hU : ∀ n, HasLaw (U n) (μ n) P)
    {C : Type*} [Ring C] [Algebra ℂ C] (ψ : C →ₗ[ℂ] ℂ) (s : Fin 2 → C) (hψ : ψ 1 = 1)
    (hfree : IsFreelyIndependentElements ψ s)
    (hlimA : ∀ k : ℕ, Tendsto (fun n : ℕ ↦ ((n + 1 : ℂ)⁻¹) * (A n ^ k).trace) atTop
      (𝓝 (ψ (s 0 ^ k))))
    (hlimB : ∀ k : ℕ, Tendsto (fun n : ℕ ↦ ((n + 1 : ℂ)⁻¹) * (B n ^ k).trace) atTop
      (𝓝 (ψ (s 1 ^ k)))) :
    ∀ᵐ ω ∂P, TendstoInMoments (A := fun n : ℕ ↦ Matrix (Fin (n + 1)) (Fin (n + 1)) ℂ)
      (fun n ↦ ((n + 1 : ℂ)⁻¹) • Matrix.traceLinearMap (Fin (n + 1)) ℂ ℂ)
      (fun n ↦ ![A n, (U n ω : Matrix (Fin (n + 1)) (Fin (n + 1)) ℂ) * B n *
        star (U n ω : Matrix (Fin (n + 1)) (Fin (n + 1)) ℂ)]) atTop ψ s := by
  sorry

end Freeness

/-! ## Layer 7: spiked models -/

/-- The rank-one perturbation `θ uu*` with real `θ` is Hermitian. -/
theorem isHermitian_smul_vecMulVec_star {n : ℕ} (θ : ℝ) (u : Fin n → ℂ) :
    ((θ : ℂ) • vecMulVec u (star u)).IsHermitian := by
  simpa using (posSemidef_vecMulVec_star_self (star u)).isHermitian.smul (k := (θ : ℂ))
    (Complex.conj_ofReal θ)

variable {Ω : Type*} [MeasurableSpace Ω]

/-- **Rank-one spiked GOE and GUE** (Benaych-Georges–Nadakuditi 2011, Theorem 2.1 and §3.1). Let
`Gₙ` have standard Gaussian coordinates, with any coupling across `n`, let `uₙ` be deterministic
unit vectors and `θ > 0`. Then almost surely the largest eigenvalue of `Hₙ + θ uₙuₙ*` tends to
`θ + 1/θ` if `θ > 1` and to `2` if `θ ≤ 1`. -/
theorem gaussianEnsemble_spike_ae (β : ℕ) (hβ : β = 1 ∨ β = 2)
    (P : Measure Ω) [IsProbabilityMeasure P] (G : ∀ n : ℕ, Ω → Fin (n + 1) × Fin (n + 1) → ℝ)
    (hG : ∀ n, HasLaw (G n) (Measure.pi fun _ ↦ gaussianReal 0 1) P)
    (u : ∀ n : ℕ, Fin (n + 1) → ℂ) (hu : ∀ n, ∑ i, ‖u n i‖ ^ 2 = 1)
    (hureal : β = 1 → ∀ n i, (u n i).im = 0) (θ : ℝ) (hθ : 0 < θ) :
    ∀ᵐ ω ∂P, Tendsto (fun n ↦ ⨆ i,
        ((gaussianEnsemble_isHermitian β (n + 1) (G n ω)).add
          (isHermitian_smul_vecMulVec_star θ (u n))).eigenvalues i)
      atTop (𝓝 (if 1 < θ then θ + θ⁻¹ else 2)) := by
  sorry

/-! ## Layer 8: Gaussian fluctuations -/

/-- **Central limit theorem for polynomial linear statistics** (Johansson 1998, Theorem 2.4;
AGZ Theorem 4.3.20 with zero initial data). For `β ∈ {1, 2}` and a real polynomial `f`, write
`f(2 cos θ) = a₀ + ∑ aₖ cos kθ` with `aₖ = (2/π) ∫₀^π f(2 cos θ) cos kθ dθ`. Then `tr f(Hₙ) - E tr f(Hₙ)` converges in
distribution to the centred Gaussian of variance `(2β)⁻¹ ∑_{k ≥ 1} k aₖ²`. -/
theorem gaussianEnsemble_linear_statistic_clt (β : ℕ) (hβ : β = 1 ∨ β = 2) (f : ℝ[X])
    (P : Measure Ω) [IsProbabilityMeasure P] (G : ∀ n : ℕ, Ω → Fin (n + 1) × Fin (n + 1) → ℝ)
    (hG : ∀ n, HasLaw (G n) (Measure.pi fun _ ↦ gaussianReal 0 1) P) :
    TendstoInDistribution
      (fun n ω ↦ ∑ i, f.eval ((gaussianEnsemble_isHermitian β (n + 1) (G n ω)).eigenvalues i) -
        ∫ ω', ∑ i, f.eval ((gaussianEnsemble_isHermitian β (n + 1) (G n ω')).eigenvalues i) ∂P)
      atTop id (fun _ ↦ P)
      (gaussianReal 0 (Real.toNNReal ((2 * β : ℝ)⁻¹ * ∑ k ∈ Finset.Icc 1 f.natDegree,
        (k : ℝ) * ((2 / Real.pi) *
          ∫ θ in (0 : ℝ)..Real.pi, f.eval (2 * Real.cos θ) * Real.cos (k * θ)) ^ 2))) := by
  sorry

/-! ## Layer 8: bulk and edge limits -/

/-- The real Airy function `Ai`, a local copy of SpecialFunctionsAiry 1.1, which owns it:
`Ai(x) = 3^{−2/3} 𝐅(⅔, x³/9) − 3^{−4/3} x 𝐅(4/3, x³/9)` with Mathlib's regularized `₀F₁`. -/
def airyAi (x : ℝ) : ℝ :=
  ((3 : ℂ) ^ (-(2 / 3 : ℂ)) * Complex.regularizedHGFun 0 {2 / 3} ((x : ℂ) ^ 3 / 9) -
    (3 : ℂ) ^ (-(4 / 3 : ℂ)) * x * Complex.regularizedHGFun 0 {4 / 3} ((x : ℂ) ^ 3 / 9)).re

/-- The Airy kernel `K_Ai(x,y) = ∫₀^∞ Ai(x+t) Ai(y+t) dt`, a local copy of SpecialFunctionsAiry
8.5, which owns it with its closed forms and exponential bounds. -/
def airyKernel (x y : ℝ) : ℝ :=
  ∫ t in Set.Ioi (0 : ℝ), airyAi (x + t) * airyAi (y + t)

/-- The sine kernel `sin(π(x−y))/(π(x−y))`, with value `1` on the diagonal. -/
def sineKernel (x y : ℝ) : ℝ :=
  if x = y then 1 else Real.sin (Real.pi * (x - y)) / (Real.pi * (x - y))

/-- The Fredholm determinant `det(I − K)` on `L²(A)`, written as its series (AGZ (3.1.6)):
`∑ₖ ((−1)^k/k!) ∫_{A^k} det[K(xᵢ, xⱼ)] dx`. -/
def fredholmDet (K : ℝ → ℝ → ℝ) (A : Set ℝ) : ℝ :=
  ∑' k : ℕ, ((-1 : ℝ) ^ k / k.factorial) *
    ∫ x in Set.univ.pi (fun _ : Fin k ↦ A), (Matrix.of fun i j ↦ K (x i) (x j)).det

/-- **Tracy–Widom limit of the GUE largest eigenvalue** (AGZ Theorems 3.1.4–3.1.5). For GUE
matrices `Hₙ`, `P(n^{2/3}(λ_max(Hₙ) − 2) ≤ s) → F₂(s) = det(I − K_Ai)` on `L²(s, ∞)`. -/
theorem gue_largest_eigenvalue_tracyWidom
    (P : Measure Ω) [IsProbabilityMeasure P] (G : ∀ n : ℕ, Ω → Fin (n + 1) × Fin (n + 1) → ℝ)
    (hG : ∀ n, HasLaw (G n) (Measure.pi fun _ ↦ gaussianReal 0 1) P) (s : ℝ) :
    Tendsto (fun n : ℕ ↦ P.real {ω | ((n + 1 : ℕ) : ℝ) ^ ((2 : ℝ) / 3) *
        ((⨆ i, (gaussianEnsemble_isHermitian 2 (n + 1) (G n ω)).eigenvalues i) - 2) ≤ s})
      atTop (𝓝 (fredholmDet airyKernel (Set.Ioi s))) := by
  sorry

/-- **Tracy–Widom limit `F₁` of the GOE largest eigenvalue** (AGZ Theorem 3.1.7, (3.1.13)):
`F₁(s) = √F₂(s) · exp(-(1/2) ∫_s^∞ q)` for the Hastings–McLeod solution `q` of Painlevé II,
`q'' = xq + 2q³` with `q/Ai → 1` at `+∞`. That solution is unique; its existence is a target of
§8.5. -/
theorem goe_largest_eigenvalue_tracyWidom
    (P : Measure Ω) [IsProbabilityMeasure P] (G : ∀ n : ℕ, Ω → Fin (n + 1) × Fin (n + 1) → ℝ)
    (hG : ∀ n, HasLaw (G n) (Measure.pi fun _ ↦ gaussianReal 0 1) P)
    (q : ℝ → ℝ) (hq : ContDiff ℝ 2 q) (hPII : ∀ x, deriv (deriv q) x = x * q x + 2 * q x ^ 3)
    (hAi : Tendsto (fun x ↦ q x / airyAi x) atTop (𝓝 1)) (s : ℝ) :
    Tendsto (fun n : ℕ ↦ P.real {ω | ((n + 1 : ℕ) : ℝ) ^ ((2 : ℝ) / 3) *
        ((⨆ i, (gaussianEnsemble_isHermitian 1 (n + 1) (G n ω)).eigenvalues i) - 2) ≤ s})
      atTop (𝓝 (Real.sqrt (fredholmDet airyKernel (Set.Ioi s)) *
        Real.exp (-(1 / 2) * ∫ x in Set.Ioi s, q x))) := by
  sorry

/-- **Bulk gap probability of GUE** (AGZ Theorem 3.1.1 at `E = 0`; for `0 < |E| < 2`, the remark
following it and Exercise 3.7.5, with the argument of AGZ §3.5). For `|E| < 2` and compact `A`, the
probability that no eigenvalue of `Hₙ`, scaled by `n ρ_SC(E) (λ − E)` with
`ρ_SC(E) = √(4 − E²)/(2π)`, lies in `A` tends to `det(I − K_sine)` on `L²(A)`. -/
theorem gue_bulk_gap
    (P : Measure Ω) [IsProbabilityMeasure P] (G : ∀ n : ℕ, Ω → Fin (n + 1) × Fin (n + 1) → ℝ)
    (hG : ∀ n, HasLaw (G n) (Measure.pi fun _ ↦ gaussianReal 0 1) P)
    (E : ℝ) (hE : |E| < 2) (A : Set ℝ) (hA : IsCompact A) :
    Tendsto (fun n : ℕ ↦ P.real {ω | ∀ i, ((n + 1 : ℕ) : ℝ) * Real.sqrt (4 - E ^ 2) /
        (2 * Real.pi) * ((gaussianEnsemble_isHermitian 2 (n + 1) (G n ω)).eigenvalues i - E) ∉ A})
      atTop (𝓝 (fredholmDet sineKernel A)) := by
  sorry

/-! ## Layer 9: large deviations -/

/-- A large deviation principle at speed `a` with rate `I` (AGZ Definition D.1): `I` is lower
semicontinuous, every closed `F` satisfies `limsup a(n)⁻¹ log μₙ(F) ≤ -inf_F I`, and every open
`U` satisfies `-inf_U I ≤ liminf a(n)⁻¹ log μₙ(U)`, with `log 0 = -∞`. -/
def LargeDeviationPrinciple {X : Type*} [TopologicalSpace X] [MeasurableSpace X]
    (μ : ℕ → Measure X) (a : ℕ → ℝ) (I : X → ℝ≥0∞) : Prop :=
  LowerSemicontinuous I ∧
    (∀ F : Set X, IsClosed F →
      limsup (fun n ↦ ((a n)⁻¹ : ℝ) * ENNReal.log (μ n F)) atTop ≤ -(⨅ x ∈ F, (I x : EReal))) ∧
    ∀ U : Set X, IsOpen U →
      -(⨅ x ∈ U, (I x : EReal)) ≤ liminf (fun n ↦ ((a n)⁻¹ : ℝ) * ENNReal.log (μ n U)) atTop

/-- **Large deviations of the Gaussian largest eigenvalue** (AGZ Theorem 2.6.6). For GOE
(`β = 1`) and GUE (`β = 2`) of size `n + 1`, the laws of the largest eigenvalue satisfy a large
deviation principle at speed `n + 1` with rate `J_β(x) = (β/2) ∫₂ˣ √(t² - 4) dt` for `x ≥ 2` and
`+∞` for `x < 2`. -/
theorem gaussianEnsemble_largest_eigenvalue_ldp {Ω : Type*} [MeasurableSpace Ω] (β : ℕ)
    (hβ : β = 1 ∨ β = 2) (P : Measure Ω) [IsProbabilityMeasure P]
    (G : ∀ n : ℕ, Ω → Fin (n + 1) × Fin (n + 1) → ℝ)
    (hG : ∀ n, HasLaw (G n) (Measure.pi fun _ ↦ gaussianReal 0 1) P) :
    LargeDeviationPrinciple
      (fun n ↦ P.map fun ω ↦ ⨆ i, (gaussianEnsemble_isHermitian β (n + 1) (G n ω)).eigenvalues i)
      (fun n ↦ ((n + 1 : ℕ) : ℝ))
      (fun x ↦ if 2 ≤ x then
        ENNReal.ofReal ((β : ℝ) / 2 * ∫ t in (2 : ℝ)..x, Real.sqrt (t ^ 2 - 4)) else ⊤) := by
  sorry

/-- `E_V(μ) + 1` for `V(x) = x²/2` (§9.2), with `+∞` on the diagonal; the integrand is at least
`3/2 - log 2 > 0`, so no truncation is needed. -/
def gaussianLogEnergy (μ : ProbabilityMeasure ℝ) : ℝ≥0∞ :=
  ∫⁻ x, ∫⁻ y, (if x = y then ⊤ else
    ENNReal.ofReal ((x ^ 2 + y ^ 2) / 4 - Real.log |x - y| + 1)) ∂(μ : Measure ℝ) ∂(μ : Measure ℝ)

/-- **Large deviations of the GOE/GUE empirical spectral measure** (AGZ Theorem 2.6.1 with
`V = βx²/4` in AGZ's normalization, `V = x²/2` in §9.2's): speed `n²` and rate
`(β/2)(E_V(μ) - 3/4)`, where `3/4 = E_V(semicircleReal 0 1)` is the minimum. -/
theorem gaussianEnsemble_spectralMeasure_ldp (β : ℕ) (hβ : β = 1 ∨ β = 2)
    (P : Measure Ω) [IsProbabilityMeasure P] (G : ∀ n : ℕ, Ω → Fin (n + 1) × Fin (n + 1) → ℝ)
    (hG : ∀ n, HasLaw (G n) (Measure.pi fun _ ↦ gaussianReal 0 1) P) :
    LargeDeviationPrinciple
      (fun n ↦ P.map fun ω ↦ Matrix.spectralMeasure (gaussianEnsemble β (n + 1) (G n ω))
        (gaussianEnsemble_isHermitian β (n + 1) (G n ω)))
      (fun n ↦ ((n + 1 : ℕ) : ℝ) ^ 2)
      (fun μ ↦ ENNReal.ofReal ((β : ℝ) / 2) * (gaussianLogEnergy μ - ENNReal.ofReal (7 / 4))) := by
  sorry

/-! ## Layer 10: small singular values and the circular law -/

/-- **Least singular value of sub-Gaussian matrices** (Rudelson–Vershynin 2008, Theorem 1.2). For
each variance proxy `K` there are `C > 0` and `0 < c < 1` such that for every `N × N` matrix
`X` with independent real entries, each sub-Gaussian with proxy `K`, whose rows are identically
distributed with column `j` of law `νⱼ` and second moment at least `1`, and every `ε ≥ 0`, the
smallest singular value satisfies `P(s_N(X) ≤ ε/√N) ≤ Cε + c^N`. -/
theorem least_singular_value (K : ℝ≥0) :
    ∃ C c : ℝ, 0 < C ∧ 0 < c ∧ c < 1 ∧
      ∀ {Ω : Type*} [MeasurableSpace Ω] (P : Measure Ω) [IsProbabilityMeasure P]
        (N : ℕ) [NeZero N] (ν : Fin N → Measure ℝ) (ξ : Fin N × Fin N → Ω → ℝ),
        iIndepFun ξ P → (∀ ij, HasLaw (ξ ij) (ν ij.2) P) →
        (∀ ij, HasSubgaussianMGF (ξ ij) K P) → (∀ j, 1 ≤ ∫ x, x ^ 2 ∂ν j) →
        ∀ ε : ℝ, 0 ≤ ε →
          P.real {ω | LinearMap.singularValues
              (Matrix.toEuclideanLin (Matrix.of fun i j ↦ ξ (i, j) ω)) (N - 1) ≤
            ε / Real.sqrt N} ≤ C * ε + c ^ N := by
  sorry

/-- **Circular law, almost surely** (Tao, Theorem 2.8.1; Tao–Vu–Krishnapur 2010, Theorem 1.13).
Let `ξ` be a doubly infinite array of i.i.d. complex entries of law `ν` with mean zero and
`E|ξ|² = 1`, and let `Xₙ` be its top-left `n × n` corner. Then almost surely the empirical
eigenvalue measures of `Xₙ/√n` converge weakly to the circular law. -/
theorem circular_law_ae (P : Measure Ω) [IsProbabilityMeasure P]
    (ν : Measure ℂ) [IsProbabilityMeasure ν] (ξ : ℕ × ℕ → Ω → ℂ)
    (hξ : ∀ ij, HasLaw (ξ ij) ν P) (hindep : iIndepFun ξ P)
    (hmean : ∫ z, z ∂ν = 0) (hsecond : Integrable (fun z : ℂ ↦ ‖z‖ ^ 2) ν)
    (hvar : ∫ z, ‖z‖ ^ 2 ∂ν = 1) :
    ∀ᵐ ω ∂P, ∀ f : ℂ →ᵇ ℝ,
      Tendsto (fun n : ℕ ↦ ∫ z, f z ∂(Matrix.eigenvalueMeasure
          (Matrix.of fun (i : Fin (n + 1)) (j : Fin (n + 1)) ↦
            ((Real.sqrt (n + 1))⁻¹ : ℂ) * ξ (i, j) ω) : Measure ℂ))
        atTop (𝓝 (∫ z, f z ∂circularLaw)) := by
  sorry

end TauCetiRoadmap.RandomMatrices

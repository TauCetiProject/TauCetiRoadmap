import Mathlib
import TauCeti.Probability.Process.EmpiricalMeasure

/-!
# Random matrices: target signatures

This file is not the roadmap: the roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with
the few definitions their statements need.

Stated here: the almost-sure semicircle law for Wigner matrices and the Bai–Yin limits of their
extreme eigenvalues (Layer 4); the almost-sure Marchenko–Pastur law and the extreme eigenvalues
of sample covariance matrices (Layer 4); the Hanson–Wright inequality and the Hermitian matrix
Bernstein inequality (Layer 2); the ordered eigenvalue densities of GOE and GUE with their
Gaussian Selberg normalisation (Layer 5); the rank-one spiked largest eigenvalue (Layer 7); the
central limit theorem for polynomial linear statistics of GOE and GUE (Layer 8); the
Rudelson–Vershynin least-singular-value bound and the almost-sure circular law (Layer 11).

Not statable at the pins, each for the carrier named:
* free-probability limits (asymptotic freeness of Wigner and Haar-conjugated families, the free
  central limit theorem, `L_{Dₙ+√t Hₙ} → ν ⊞ SC_t`, the population-covariance law `ν ⊠ MP_y`):
  Mathlib has no noncommutative probability space, no free independence and no free
  convolution;
* the Tracy–Widom limits `F₂` and `F₁`, and the sine and Airy limits of GUE and GOE: Mathlib has
  no Airy function, no Fredholm determinant on `L²`, no determinantal point process and no
  space of locally finite configurations with its vague topology;
* the large deviation principles at speed `n²` for the beta-gas empirical measure and at speed
  `n` for the Gaussian largest eigenvalue: Mathlib has no large deviation principle and no
  logarithmic energy of a probability measure;
* Dyson Brownian motion and its eigenvalue stochastic differential equation: Mathlib has no
  Itô integral and no strong solution of a stochastic differential equation.
-/

noncomputable section

open MeasureTheory ProbabilityTheory Matrix Filter Polynomial
open scoped BigOperators ENNReal NNReal Topology BoundedContinuousFunction ComplexOrder
  Matrix.Norms.L2Operator

namespace TauCetiRoadmap.RandomMatrices

/-! ## Layer 1: spectral measures -/

/-- The empirical spectral measure `L_A = n⁻¹ ∑ᵢ δ_{λᵢ(A)}` of a Hermitian matrix of positive
size, as the measure underlying Tau Ceti's empirical probability measure of its eigenvalues. -/
def spectralMeasure {n : ℕ} [NeZero n] (A : Matrix (Fin n) (Fin n) ℂ) (hA : A.IsHermitian) :
    Measure ℝ :=
  (TauCeti.Probability.empiricalMeasureOfFintype hA.eigenvalues : Measure ℝ)

/-- The empirical eigenvalue measure `n⁻¹ ∑ δ_z` of a complex square matrix, the sum running
over the roots of its characteristic polynomial with algebraic multiplicity. -/
def eigenvalueMeasure {n : ℕ} (A : Matrix (Fin n) (Fin n) ℂ) : Measure ℂ :=
  (n : ℝ≥0∞)⁻¹ • (A.charpoly.roots.map Measure.dirac).sum

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

/-- The semicircle law with centre `a` and variance `v`, as the image of the unit-radius
semicircle `(betaMeasure (3/2) (3/2)).map (2 * · - 1)` of StandardDistributions, target 10.20,
under `y ↦ a + 2√v y`. For `v > 0` its density is `(2πv)⁻¹ √(4v - (x - a)²)`; for `v = 0` it
is `δ_a`. -/
def semicircleReal (a : ℝ) (v : ℝ≥0) : Measure ℝ :=
  (betaMeasure (3 / 2) (3 / 2)).map fun x ↦ a + 2 * Real.sqrt v * (2 * x - 1)

/-- The Marchenko–Pastur law `MP_y` of ratio `y`: for `y > 0`, the atom `(1 - 1/y)₊ δ₀` plus the
density `√((b - x)(x - a))/(2πyx)` on `[a, b]`, `a = (1 - √y)²`, `b = (1 + √y)²` (the square
root of a negative real is `0`, so the density vanishes off `[a, b]`); `MP_0 = δ₁`. -/
def marchenkoPastur (y : ℝ≥0) : Measure ℝ :=
  if y = 0 then Measure.dirac 1 else
    ENNReal.ofReal (1 - (y : ℝ)⁻¹) • Measure.dirac 0 +
      volume.withDensity fun x ↦ ENNReal.ofReal
        (Real.sqrt (((1 + Real.sqrt y) ^ 2 - x) * (x - (1 - Real.sqrt y) ^ 2)) /
          (2 * Real.pi * y * x))

/-- The circular law: Lebesgue measure on `ℂ` conditioned on the open unit disc, which is
`π⁻¹ 1_{|z| < 1} d(area)`; it is the two-dimensional uniform ball law of StandardDistributions,
target 12.1, transported to `ℂ`. -/
def circularLaw : Measure ℂ :=
  ProbabilityTheory.cond volume (Metric.ball (0 : ℂ) 1)

/-! ## Layer 4: Wigner and sample-covariance global laws -/

section Wigner

/-- Index set of the strictly upper-triangular positions of an infinite matrix. -/
abbrev StrictUpper := {ij : ℕ × ℕ // ij.1 < ij.2}

/-- The normalised Wigner matrix `Wₙ/√n` built from the top-left `n × n` corner of an infinite
array: complex entries `ξ` above the diagonal, their conjugates below it, and real entries `η` on
it. A real symmetric Wigner matrix is the case of real-valued `ξ`. -/
def wignerMatrix {Ω : Type*} (ξ : StrictUpper → Ω → ℂ) (η : ℕ → Ω → ℝ) (n : ℕ) (ω : Ω) :
    Matrix (Fin n) (Fin n) ℂ :=
  Matrix.of fun i j ↦ ((Real.sqrt n)⁻¹ : ℂ) *
    if h : i.val < j.val then ξ ⟨(i.val, j.val), h⟩ ω
    else if h' : j.val < i.val then star (ξ ⟨(j.val, i.val), h'⟩ ω)
    else (η i.val ω : ℂ)

/-- The normalised Wigner matrix is Hermitian for every sample point. -/
theorem wignerMatrix_isHermitian {Ω : Type*} (ξ : StrictUpper → Ω → ℂ) (η : ℕ → Ω → ℝ)
    (n : ℕ) (ω : Ω) : (wignerMatrix ξ η n ω).IsHermitian := by
  ext i j
  simp only [wignerMatrix, conjTranspose_apply, of_apply, star_mul', star_inv₀,
    Complex.star_def, Complex.conj_ofReal]
  rcases lt_trichotomy i.val j.val with h | h | h
  · simp [h, h.not_gt]
  · simp [Fin.ext h]
  · simp [h, h.not_gt]

variable {Ω : Type*} [MeasurableSpace Ω]

/-- **Semicircle law, almost surely** (Tao, Theorem 2.4.2; Bai 1999, Theorem 2.1). Let the
strictly upper entries `ξ` be i.i.d. complex with law `ν` of mean zero and `E|ξ|² = 1`, the
diagonal entries `η` i.i.d. real with law `ν₀` of finite second moment, all independent. Then
almost surely the empirical spectral measures of the normalised Wigner matrices converge weakly
to `semicircleReal 0 1`. -/
theorem wigner_semicircle_ae (P : Measure Ω) [IsProbabilityMeasure P]
    (ν : Measure ℂ) [IsProbabilityMeasure ν] (ν₀ : Measure ℝ) [IsProbabilityMeasure ν₀]
    (ξ : StrictUpper → Ω → ℂ) (η : ℕ → Ω → ℝ)
    (hξ : ∀ ij, HasLaw (ξ ij) ν P) (hη : ∀ i, HasLaw (η i) ν₀ P)
    (hindep : iIndepFun (fun k : StrictUpper ⊕ ℕ ↦ Sum.elim ξ (fun i ω ↦ (η i ω : ℂ)) k) P)
    (hmean : ∫ z, z ∂ν = 0) (hsecond : Integrable (fun z : ℂ ↦ ‖z‖ ^ 2) ν)
    (hvar : ∫ z, ‖z‖ ^ 2 ∂ν = 1) (hdiag : Integrable (fun x : ℝ ↦ x ^ 2) ν₀) :
    ∀ᵐ ω ∂P, ∀ f : ℝ →ᵇ ℝ,
      Tendsto (fun n : ℕ ↦ ∫ x, f x ∂spectralMeasure (wignerMatrix ξ η (n + 1) ω)
          (wignerMatrix_isHermitian ξ η (n + 1) ω))
        atTop (𝓝 (∫ x, f x ∂semicircleReal 0 1)) := by
  sorry

/-- **Bai–Yin theorem for Wigner matrices** (Bai 1999, Theorem 2.12, and its reflection
`W ↦ -W`). Under the hypotheses of `wigner_semicircle_ae` and a finite fourth moment of the
upper entries, almost surely the largest eigenvalue of the normalised Wigner matrix tends to `2`
and the smallest to `-2`. -/
theorem wigner_extreme_eigenvalues_ae (P : Measure Ω) [IsProbabilityMeasure P]
    (ν : Measure ℂ) [IsProbabilityMeasure ν] (ν₀ : Measure ℝ) [IsProbabilityMeasure ν₀]
    (ξ : StrictUpper → Ω → ℂ) (η : ℕ → Ω → ℝ)
    (hξ : ∀ ij, HasLaw (ξ ij) ν P) (hη : ∀ i, HasLaw (η i) ν₀ P)
    (hindep : iIndepFun (fun k : StrictUpper ⊕ ℕ ↦ Sum.elim ξ (fun i ω ↦ (η i ω : ℂ)) k) P)
    (hmean : ∫ z, z ∂ν = 0) (hfourth : Integrable (fun z : ℂ ↦ ‖z‖ ^ 4) ν)
    (hvar : ∫ z, ‖z‖ ^ 2 ∂ν = 1) (hdiag : Integrable (fun x : ℝ ↦ x ^ 2) ν₀) :
    ∀ᵐ ω ∂P,
      Tendsto (fun n : ℕ ↦ ⨆ i, (wignerMatrix_isHermitian ξ η (n + 1) ω).eigenvalues i)
        atTop (𝓝 2) ∧
      Tendsto (fun n : ℕ ↦ ⨅ i, (wignerMatrix_isHermitian ξ η (n + 1) ω).eigenvalues i)
        atTop (𝓝 (-2)) := by
  sorry

end Wigner

section Covariance

/-- The sample covariance matrix `S = XX*/n` of a `p × n` data matrix `X`. -/
def sampleCovariance {p n : ℕ} (X : Matrix (Fin p) (Fin n) ℂ) : Matrix (Fin p) (Fin p) ℂ :=
  ((n : ℝ)⁻¹ : ℝ) • (X * Xᴴ)

/-- A sample covariance matrix is Hermitian. -/
theorem sampleCovariance_isHermitian {p n : ℕ} (X : Matrix (Fin p) (Fin n) ℂ) :
    (sampleCovariance X).IsHermitian :=
  (isHermitian_mul_conjTranspose_self X).smul (IsSelfAdjoint.all _)

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
      Tendsto (fun n ↦ ∫ t, f t ∂spectralMeasure
          (sampleCovariance (Matrix.of fun (i : Fin (p n)) (j : Fin n) ↦ x (i, j) ω))
          (sampleCovariance_isHermitian _))
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
AGZ Theorem 4.3.20 with zero initial data). For `β ∈ {1, 2}` and a real polynomial `f`, write `f(2 cos θ) = a₀ + ∑ aₖ cos kθ`
with `aₖ = (2/π) ∫₀^π f(2 cos θ) cos kθ dθ`. Then `tr f(Hₙ) - E tr f(Hₙ)` converges in
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

/-! ## Layer 11: small singular values and the circular law -/

/-- **Least singular value of sub-Gaussian matrices** (Rudelson–Vershynin 2008, Theorem 1.2). For
each variance proxy `K` there are `C > 0` and `0 < c < 1` such that for every `N × N` matrix
`X` with i.i.d. real entries of variance one, each sub-Gaussian with proxy `K`, and every
`ε ≥ 0`, the smallest singular value satisfies `P(s_N(X) ≤ ε/√N) ≤ Cε + c^N`. -/
theorem least_singular_value (K : ℝ≥0) :
    ∃ C c : ℝ, 0 < C ∧ 0 < c ∧ c < 1 ∧
      ∀ {Ω : Type*} [MeasurableSpace Ω] (P : Measure Ω) [IsProbabilityMeasure P]
        (ν : Measure ℝ) (N : ℕ) [NeZero N] (ξ : Fin N × Fin N → Ω → ℝ),
        iIndepFun ξ P → (∀ ij, HasLaw (ξ ij) ν P) → (∀ ij, HasSubgaussianMGF (ξ ij) K P) →
        ∫ x, x ^ 2 ∂ν = 1 → ∀ ε : ℝ, 0 ≤ ε →
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
      Tendsto (fun n : ℕ ↦ ∫ z, f z ∂eigenvalueMeasure
          (Matrix.of fun (i : Fin n) (j : Fin n) ↦ ((Real.sqrt n)⁻¹ : ℂ) * ξ (i, j) ω))
        atTop (𝓝 (∫ z, f z ∂circularLaw)) := by
  sorry

end TauCetiRoadmap.RandomMatrices

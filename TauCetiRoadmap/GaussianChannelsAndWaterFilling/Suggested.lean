import Mathlib
import TauCeti.Probability.Moments.Covariance

/-!
# Gaussian channels and water-filling: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states its theorems
against the pinned Mathlib and Tau Ceti, each with `sorry`, with the definitions they need; every
definition has a real body.

Mutual information is the Kullback–Leibler divergence (Mathlib's `klDiv`, in nats, valued in
`ℝ≥0∞`) of a joint law from the product of its marginals. An additive noise channel with input
law `μ` and noise law `ν`, independent of each other, has the joint law `inputOutputLaw (μ.prod ν)`
of the input `X` and the output `X + Z`.
-/

noncomputable section

open MeasureTheory ProbabilityTheory InformationTheory Real
open scoped ENNReal NNReal RealInnerProductSpace

namespace TauCetiRoadmap.GaussianChannelsAndWaterFilling

/-! ## Layer 1: mutual information and Gaussian divergences -/

section MutualInformation

variable {α β : Type*} [MeasurableSpace α] [MeasurableSpace β]

/-- 1.1 The mutual information of a joint law `ρ` on `α × β`: the divergence of `ρ` from the
product of its two marginals. -/
def mutualInfo (ρ : Measure (α × β)) : ℝ≥0∞ :=
  klDiv ρ (ρ.fst.prod ρ.snd)

end MutualInformation

section AdditiveNoise

variable {E : Type*} [MeasurableSpace E] [Add E]

/-- 1.1 The joint law of the input and the output of an additive channel: for a joint law `γ`
of an input `X` and a noise `Z`, the law of `(X, X + Z)`. -/
def inputOutputLaw (γ : Measure (E × E)) : Measure (E × E) :=
  γ.map fun p ↦ (p.1, p.1 + p.2)

end AdditiveNoise

section GoldenFormula

variable {α β : Type*} [MeasurableSpace α] [MeasurableSpace β]

/-- 1.1 The golden formula: for an input law `μ` on a standard Borel space, a Markov kernel `κ`
(the channel) and every probability measure `Q` on the output space, the average divergence of
the output laws `κ x` from `Q` is the mutual information of the joint law `μ ⊗ₘ κ` plus the
divergence of the output law `κ ∘ₘ μ` from `Q`. -/
theorem lintegral_klDiv_eq_mutualInfo_add [StandardBorelSpace α] [Nonempty α] (μ : Measure α)
    [IsProbabilityMeasure μ] (κ : Kernel α β) [IsMarkovKernel κ] (Q : Measure β)
    [IsProbabilityMeasure Q] :
    ∫⁻ x, klDiv (κ x) Q ∂μ = mutualInfo (μ ⊗ₘ κ) + klDiv (κ ∘ₘ μ) Q :=
  sorry

end GoldenFormula

section Golden

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [MeasurableSpace E] [BorelSpace E]

/-- 1.1 The golden formula for an additive channel, the case of the shift kernel
`x ↦ ν.map (x + ·)`: for independent input `μ` and noise `ν` and every probability measure `Q`,
the average divergence of the shifted noise laws from `Q` is the mutual information plus the
divergence of the output law `μ ∗ ν` from `Q`. -/
theorem lintegral_klDiv_map_add_eq (μ ν Q : Measure E) [IsProbabilityMeasure μ]
    [IsProbabilityMeasure ν] [IsProbabilityMeasure Q] :
    ∫⁻ x, klDiv (ν.map fun z ↦ x + z) Q ∂μ =
      mutualInfo (inputOutputLaw (μ.prod ν)) + klDiv (μ ∗ ν) Q :=
  sorry

end Golden

/-- 1.2 The divergence between two nondegenerate Gaussian laws on the line. -/
theorem klDiv_gaussianReal_gaussianReal (a b : ℝ) {s t : ℝ≥0} (hs : s ≠ 0) (ht : t ≠ 0) :
    klDiv (gaussianReal a s) (gaussianReal b t) =
      ENNReal.ofReal (((a - b) ^ 2 / t + Real.log (t / s) + s / t - 1) / 2) :=
  sorry

section GaussianDivergence

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

/-- 1.3 The divergence between two nondegenerate Gaussian laws on `ℝ^ι`. -/
theorem klDiv_multivariateGaussian_multivariateGaussian (a b : EuclideanSpace ℝ ι)
    {S T : Matrix ι ι ℝ} (hS : S.PosDef) (hT : T.PosDef) :
    klDiv (multivariateGaussian a S) (multivariateGaussian b T) =
      ENNReal.ofReal ((⟪a - b, T⁻¹.toEuclideanLin (a - b)⟫ + Real.log (T.det / S.det) +
        (T⁻¹ * S).trace - Fintype.card ι) / 2) :=
  sorry

end GaussianDivergence

/-! ## Layer 2: the scalar channel -/

/-- 2.1 Gaussian input is best for Gaussian noise: for noise `N(0, N)` with `N > 0` and an input
with a finite second moment and variance at most `P`, the mutual information is at most
`(1/2) log (1 + P/N)`, with equality exactly for the Gaussian inputs of variance `P`. -/
theorem mutualInfo_gaussianNoise_le (μ : Measure ℝ) [IsProbabilityMeasure μ]
    (hμ : Integrable (fun x ↦ x ^ 2) μ) {P N : ℝ≥0} (hN : N ≠ 0) (hvar : variance id μ ≤ P) :
    mutualInfo (inputOutputLaw (μ.prod (gaussianReal 0 N))) ≤
        ENNReal.ofReal (Real.log (1 + P / N) / 2) ∧
      (mutualInfo (inputOutputLaw (μ.prod (gaussianReal 0 N))) =
          ENNReal.ofReal (Real.log (1 + P / N) / 2) ↔ ∃ m : ℝ, μ = gaussianReal m P) :=
  sorry

/-- 2.2 Gaussian noise is worst for Gaussian input: for an input `N(0, P)` and a noise with
second moment at most `N`, uncorrelated with the input but not necessarily independent of it,
the mutual information is at least `(1/2) log (1 + P/N)`; for `P, N > 0` equality holds exactly
when the noise is `N(0, N)` and independent of the input. -/
theorem le_mutualInfo_of_uncorrelated (γ : Measure (ℝ × ℝ)) [IsProbabilityMeasure γ]
    {P N : ℝ≥0} (hP : P ≠ 0) (hN : N ≠ 0) (hfst : γ.fst = gaussianReal 0 P)
    (hint : Integrable (fun p ↦ p.2 ^ 2) γ) (hcorr : ∫ p, p.1 * p.2 ∂γ = 0)
    (hsec : ∫ p, p.2 ^ 2 ∂γ ≤ N) :
    ENNReal.ofReal (Real.log (1 + P / N) / 2) ≤ mutualInfo (inputOutputLaw γ) ∧
      (mutualInfo (inputOutputLaw γ) = ENNReal.ofReal (Real.log (1 + P / N) / 2) ↔
        γ = (gaussianReal 0 P).prod (gaussianReal 0 N)) :=
  sorry

/-- 2.3 Ihara's bound: for a noise `ν` with a finite second moment and positive variance `σ²`,
and an independent input with a finite second moment and variance at most `P`, the mutual
information exceeds `(1/2) log (1 + P/σ²)` by at most the divergence of `ν` from the Gaussian law
with its mean and variance. -/
theorem mutualInfo_le_add_klDiv (μ ν : Measure ℝ) [IsProbabilityMeasure μ]
    [IsProbabilityMeasure ν] (hμ : Integrable (fun x ↦ x ^ 2) μ)
    (hν : Integrable (fun z ↦ z ^ 2) ν) (hσ : 0 < variance id ν) {P : ℝ≥0}
    (hvar : variance id μ ≤ P) :
    mutualInfo (inputOutputLaw (μ.prod ν)) ≤
      ENNReal.ofReal (Real.log (1 + P / variance id ν) / 2) +
        klDiv ν (gaussianReal (∫ z, z ∂ν) (variance id ν).toNNReal) :=
  sorry

/-! ## Layer 3: vector channels and water-filling -/

section Vector

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

/-- 3.1 The vector Gaussian channel under a covariance constraint: for noise `N(0, S)` with `S`
positive definite and an input with a finite second moment whose covariance matrix is at most
`K` in the Loewner order, the mutual information is at most
`(1/2) log (det (K + S) / det S)`, with equality exactly for the Gaussian input with the same
mean and covariance `K`. -/
theorem mutualInfo_multivariateGaussianNoise_le (μ : Measure (EuclideanSpace ℝ ι))
    [IsProbabilityMeasure μ] (hμ : Integrable (fun x ↦ ‖x‖ ^ 2) μ) {S K : Matrix ι ι ℝ}
    (hS : S.PosDef) (hK : (K - TauCeti.covMatrix μ).PosSemidef) :
    mutualInfo (inputOutputLaw (μ.prod (multivariateGaussian 0 S))) ≤
        ENNReal.ofReal (Real.log ((K + S).det / S.det) / 2) ∧
      (mutualInfo (inputOutputLaw (μ.prod (multivariateGaussian 0 S))) =
          ENNReal.ofReal (Real.log ((K + S).det / S.det) / 2) ↔
        μ = multivariateGaussian (∫ x, x ∂μ) K) :=
  sorry

end Vector

section WaterFilling

variable {ι : Type*} [Fintype ι]

/-- 3.2 `p` is the water-filling allocation of the total power `P` over noise levels `N`: it
uses the whole power and is `max (ν - N i) 0` for one water level `ν`. -/
def IsWaterFilling (N : ι → ℝ) (P : ℝ) (p : ι → ℝ) : Prop :=
  ∑ i, p i = P ∧ ∃ ν : ℝ, ∀ i, p i = max (ν - N i) 0

/-- 3.2 For every family of noise levels on a nonempty finite index set and every total power
`P ≥ 0` there is exactly one water-filling allocation. -/
theorem existsUnique_isWaterFilling [Nonempty ι] (N : ι → ℝ) {P : ℝ} (hP : 0 ≤ P) :
    ∃! p : ι → ℝ, IsWaterFilling N P p :=
  sorry

/-- 3.3 Water-filling is optimal: for positive noise levels on a nonempty finite index set and
every total power `P`, an allocation maximizes `∑ i, log (1 + p i / N i)` over the nonnegative
allocations of total at most `P` exactly when it is the water-filling allocation. -/
theorem isMaxOn_iff_isWaterFilling [Nonempty ι] {N : ι → ℝ} (hN : ∀ i, 0 < N i) (P : ℝ)
    (p : ι → ℝ) :
    (p ∈ {q : ι → ℝ | (∀ i, 0 ≤ q i) ∧ ∑ i, q i ≤ P} ∧
        IsMaxOn (fun q : ι → ℝ ↦ ∑ i, Real.log (1 + q i / N i))
          {q : ι → ℝ | (∀ i, 0 ≤ q i) ∧ ∑ i, q i ≤ P} p) ↔
      IsWaterFilling N P p :=
  sorry

end WaterFilling

/-- 3.4 Parallel Gaussian channels: for independent noises `N(0, N i)` with every `N i > 0` and
inputs whose second moments add up to at most `P`, the greatest mutual information is
`(1/2) ∑ i, log (1 + p i / N i)` for the water-filling allocation `p`. -/
theorem isGreatest_mutualInfo_parallel {n : ℕ} {N : Fin n → ℝ≥0} (hN : ∀ i, N i ≠ 0) {P : ℝ}
    {p : Fin n → ℝ} (hp : IsWaterFilling (fun i ↦ (N i : ℝ)) P p) :
    IsGreatest
      {r : ℝ≥0∞ | ∃ μ : Measure (Fin n → ℝ), IsProbabilityMeasure μ ∧
        (∀ i, Integrable (fun x ↦ x i ^ 2) μ) ∧ ∑ i, ∫ x, x i ^ 2 ∂μ ≤ P ∧
        r = mutualInfo (inputOutputLaw (μ.prod (Measure.pi fun i ↦ gaussianReal 0 (N i))))}
      (ENNReal.ofReal (∑ i, Real.log (1 + p i / N i) / 2)) :=
  sorry

end TauCetiRoadmap.GaussianChannelsAndWaterFilling

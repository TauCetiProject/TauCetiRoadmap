import Mathlib
import TauCeti.Probability.Distributions.Dirichlet.Basic
import TauCeti.Probability.Distributions.Multinomial.Basic
import TauCeti.MeasureTheory.MeasurableSpace.StdSimplex

/-!
# Conjugate priors and posterior updates: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the few
definitions they need, which have real bodies. Every headline theorem of the README is statable
at the pins and is stated here.
-/

noncomputable section

open MeasureTheory ProbabilityTheory Set Convexity TauCeti.Probability
open scoped ENNReal NNReal

namespace TauCetiRoadmap.ConjugatePriorsAndPosteriorUpdates

/-! ## Layer 1: the classical conjugate updates -/

section Layer1

/-- **1.1** Beta–binomial updating: with prior `Beta(a, b)` on the success probability and `n`
trials, the posterior after `k ≤ n` successes is `Beta(a + k, b + n − k)`. -/
theorem posterior_binomial_betaMeasure {a b : ℝ} (ha : 0 < a) (hb : 0 < b) (n : ℕ)
    (π : Measure ℝ) [IsProbabilityMeasure π] (hπ : π = betaMeasure a b)
    (κ : Kernel ℝ ℕ) [IsMarkovKernel κ]
    (hκ : ∀ p, κ p = binomial n (Set.projIcc 0 1 zero_le_one p)) :
    ∀ k ≤ n, (κ†π) k = betaMeasure (a + k) (b + (n - k : ℕ)) :=
  sorry

/-- **1.2** Dirichlet–multinomial updating: with prior `Dir(a)` on the cell probabilities and
`n` multinomial trials, the posterior after the counts `k` (with `∑ i, k i = n`) is
`Dir(a + k)`. -/
theorem posterior_multinomial_dirichletMeasure {ι : Type*} [Fintype ι] [Nonempty ι]
    {a : ι → ℝ} (ha : ∀ i, 0 < a i) (n : ℕ)
    (π : Measure (EuclideanSpace ℝ ι)) [IsProbabilityMeasure π] (hπ : π = dirichletMeasure a)
    (κ : Kernel (EuclideanSpace ℝ ι) (ι → ℕ)) [IsMarkovKernel κ]
    (hκ : ∀ x, κ x = multinomialMeasure n
      ((StdSimplex.single (Classical.arbitrary ι) : StdSimplex ℝ≥0 ι).extendWeights
        (fun i ↦ (x i).toNNReal))) :
    ∀ k : ι → ℕ, ∑ i, k i = n → (κ†π) k = dirichletMeasure (fun i ↦ a i + k i) :=
  sorry

/-- **1.3** Gamma–Poisson updating: with prior `Gamma(α, β)` (shape, rate) on the Poisson rate
and `n` independent counts `k`, the posterior is `Gamma(α + ∑ i, k i, β + n)`. -/
theorem posterior_poisson_gammaMeasure {α β : ℝ} (hα : 0 < α) (hβ : 0 < β) (n : ℕ)
    (π : Measure ℝ) [IsProbabilityMeasure π] (hπ : π = gammaMeasure α β)
    (κ : Kernel ℝ (Fin n → ℕ)) [IsMarkovKernel κ]
    (hκ : ∀ r, κ r = Measure.pi fun _ ↦ poissonMeasure r.toNNReal) :
    ∀ k : Fin n → ℕ, (κ†π) k = gammaMeasure (α + ∑ i, (k i : ℝ)) (β + n) :=
  sorry

/-- **1.4** Normal–normal updating with known variance `s ≠ 0`: with prior `N(m, v)` on the mean
and `n` independent observations `x`, the posterior is
`N(m + v / (n v + s) · ∑ i, (x i − m), v s / (n v + s))` for almost every `x`. -/
theorem posterior_gaussianReal_gaussianReal (m : ℝ) (v s : ℝ≥0) (hs : s ≠ 0) (n : ℕ)
    (π : Measure ℝ) [IsProbabilityMeasure π] (hπ : π = gaussianReal m v)
    (κ : Kernel ℝ (Fin n → ℝ)) [IsMarkovKernel κ]
    (hκ : ∀ θ, κ θ = Measure.pi fun _ ↦ gaussianReal θ s) :
    ∀ᵐ x ∂(κ ∘ₘ π), (κ†π) x =
      gaussianReal (m + (v : ℝ) / (n * v + s) * ∑ i, (x i - m)) (v * s / (n * v + s)) :=
  sorry

/-- **1.5** The normal–gamma law on (precision, mean): the precision `τ` has law
`Gamma(α, β)` and, given `τ`, the mean has law `N(m, (κ₀ τ)⁻¹)`. -/
def normalGammaMeasure (m κ₀ α β : ℝ) : Measure (ℝ × ℝ) :=
  (gammaMeasure α β).bind fun τ ↦ (Measure.dirac τ).prod (gaussianReal m ((κ₀ * τ)⁻¹).toNNReal)

/-- **1.5** Normal–gamma updating: for observations that are independent `N(μ, τ⁻¹)` given the
precision and mean `(τ, μ)`, and a normal–gamma prior, the posterior is normal–gamma with
`κ₀ + n`, mean `(κ₀ m + ∑ x) / (κ₀ + n)`, shape `α + n / 2` and rate
`β + (∑ x² + κ₀ m² − (κ₀ m + ∑ x)² / (κ₀ + n)) / 2`, for almost every `x`. -/
theorem posterior_normalGammaMeasure (m : ℝ) {κ₀ α β : ℝ} (hκ₀ : 0 < κ₀) (hα : 0 < α)
    (hβ : 0 < β) (n : ℕ)
    (π : Measure (ℝ × ℝ)) [IsProbabilityMeasure π] (hπ : π = normalGammaMeasure m κ₀ α β)
    (L : Kernel (ℝ × ℝ) (Fin n → ℝ)) [IsMarkovKernel L]
    (hL : ∀ p, L p = Measure.pi fun _ ↦ gaussianReal p.2 (p.1⁻¹).toNNReal) :
    ∀ᵐ x ∂(L ∘ₘ π), (L†π) x =
      normalGammaMeasure ((κ₀ * m + ∑ i, x i) / (κ₀ + n)) (κ₀ + n) (α + n / 2)
        (β + ((∑ i, x i ^ 2) + κ₀ * m ^ 2 - (κ₀ * m + ∑ i, x i) ^ 2 / (κ₀ + n)) / 2) :=
  sorry

end Layer1

/-! ## Layer 2: conjugate priors for natural exponential families -/

section CopiedFromMathematicalStatisticsFoundations

variable {X E : Type*} [MeasurableSpace X] [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/-- **2.1** The natural parameter space (copied verbatim from MathematicalStatisticsFoundations
3.1). -/
def naturalParameterSpace (ν : Measure X) (T : X → E) : Set E :=
  {η | Integrable (fun x ↦ Real.exp (inner ℝ η (T x))) ν}

/-- **2.1** The log partition function (copied verbatim from MathematicalStatisticsFoundations
3.1). -/
def logPartition (ν : Measure X) (T : X → E) (η : E) : ℝ :=
  Real.log (∫ x, Real.exp (inner ℝ η (T x)) ∂ν)

/-- **2.1** The law of the natural exponential family at `η` (copied verbatim from
MathematicalStatisticsFoundations 3.1). -/
def exponentialFamilyMeasure (ν : Measure X) (T : X → E) (η : E) : Measure X :=
  ν.tilted fun x ↦ inner ℝ η (T x)

end CopiedFromMathematicalStatisticsFoundations

section Layer2

variable {ι : Type*} [Fintype ι]

/-- **2.1** The unnormalized conjugate prior with hyperparameters `n₀` and `x₀`: Lebesgue measure
with density `exp (n₀ ⟪x₀, θ⟫ − n₀ M(θ))` on the natural parameter space and `0` off it. -/
def conjugatePriorMeasure (ν : Measure (EuclideanSpace ℝ ι)) (n₀ : ℝ)
    (x₀ : EuclideanSpace ℝ ι) : Measure (EuclideanSpace ℝ ι) :=
  volume.withDensity ((naturalParameterSpace ν id).indicator fun θ ↦
    ENNReal.ofReal (Real.exp (n₀ * inner ℝ x₀ θ - n₀ * logPartition ν id θ)))

/-- **2.2** Properness of the conjugate prior: for an open nonempty natural parameter space,
a nonempty interior of the convex hull of the support, and `n₀ > 0`, the conjugate measure is
finite iff `x₀` lies in that interior. -/
theorem conjugatePriorMeasure_lt_top_iff {ν : Measure (EuclideanSpace ℝ ι)}
    (hX : (interior (convexHull ℝ ν.support)).Nonempty)
    (hΘ : IsOpen (naturalParameterSpace ν id)) (hΘne : (naturalParameterSpace ν id).Nonempty)
    {n₀ : ℝ} (hn₀ : 0 < n₀) (x₀ : EuclideanSpace ℝ ι) :
    conjugatePriorMeasure ν n₀ x₀ univ < ∞ ↔ x₀ ∈ interior (convexHull ℝ ν.support) :=
  sorry

/-- **2.3** When the natural parameter space is the whole space (of positive dimension), a
finite conjugate measure has `n₀ > 0`. -/
theorem pos_of_conjugatePriorMeasure_lt_top [Nonempty ι] {ν : Measure (EuclideanSpace ℝ ι)}
    (hΘ : naturalParameterSpace ν id = univ) {n₀ : ℝ} {x₀ : EuclideanSpace ℝ ι}
    (h : conjugatePriorMeasure ν n₀ x₀ univ < ∞) : 0 < n₀ :=
  sorry

/-- **2.4** The prior mean of the mean parameter: under the normalized conjugate prior, the mean
map `θ ↦ ∫ x dP_θ` is integrable and its expectation is `x₀`. -/
theorem integral_mean_conjugatePrior {ν : Measure (EuclideanSpace ℝ ι)}
    (hΘ : IsOpen (naturalParameterSpace ν id)) (hΘne : (naturalParameterSpace ν id).Nonempty)
    {n₀ : ℝ} (hn₀ : 0 < n₀) {x₀ : EuclideanSpace ℝ ι}
    (hx₀ : x₀ ∈ interior (convexHull ℝ ν.support)) (π : Measure (EuclideanSpace ℝ ι))
    (hπ : π = (conjugatePriorMeasure ν n₀ x₀ univ)⁻¹ • conjugatePriorMeasure ν n₀ x₀) :
    IsProbabilityMeasure π ∧
      Integrable (fun θ ↦ ∫ x, x ∂exponentialFamilyMeasure ν id θ) π ∧
      ∫ θ, (∫ x, x ∂exponentialFamilyMeasure ν id θ) ∂π = x₀ :=
  sorry

/-- **2.5** Conjugate updating and the linear posterior mean: after `n` independent observations
`x`, the posterior of the conjugate prior `(n₀, x₀)` is the conjugate prior
`(n₀ + n, (n₀ x₀ + ∑ x) / (n₀ + n))`, and the posterior mean of the mean parameter is
`(n₀ x₀ + ∑ x) / (n₀ + n)`, for almost every `x`. -/
theorem posterior_conjugatePrior {ν : Measure (EuclideanSpace ℝ ι)}
    (hΘ : IsOpen (naturalParameterSpace ν id)) (hΘne : (naturalParameterSpace ν id).Nonempty)
    {n₀ : ℝ} (hn₀ : 0 < n₀) {x₀ : EuclideanSpace ℝ ι}
    (hx₀ : x₀ ∈ interior (convexHull ℝ ν.support)) (n : ℕ)
    (π : Measure (EuclideanSpace ℝ ι)) [IsProbabilityMeasure π]
    (hπ : π = (conjugatePriorMeasure ν n₀ x₀ univ)⁻¹ • conjugatePriorMeasure ν n₀ x₀)
    (κ : Kernel (EuclideanSpace ℝ ι) (Fin n → EuclideanSpace ℝ ι)) [IsFiniteKernel κ]
    (hκ : ∀ θ, κ θ = Measure.pi fun _ ↦ exponentialFamilyMeasure ν id θ) :
    ∀ᵐ x ∂(κ ∘ₘ π),
      (κ†π) x = (conjugatePriorMeasure ν (n₀ + n) ((n₀ + n)⁻¹ • (n₀ • x₀ + ∑ i, x i)) univ)⁻¹ •
        conjugatePriorMeasure ν (n₀ + n) ((n₀ + n)⁻¹ • (n₀ • x₀ + ∑ i, x i)) ∧
      ∫ θ, (∫ y, y ∂exponentialFamilyMeasure ν id θ) ∂(κ†π) x =
        (n₀ + n)⁻¹ • (n₀ • x₀ + ∑ i, x i) :=
  sorry

/-- **2.6** The Diaconis–Ylvisaker characterization: if the support of `ν` contains a nonempty
open set, the prior is not a point mass, and the posterior mean of the mean parameter after one
observation is `a x + b` almost surely, then `a ≠ 0` and the prior has, up to a constant factor,
the density `exp (a⁻¹ ⟪b, θ⟫ − a⁻¹ (1 − a) M(θ))` on the natural parameter space. -/
theorem conjugatePrior_of_posterior_mean_eq {ν : Measure (EuclideanSpace ℝ ι)}
    (hΘ : IsOpen (naturalParameterSpace ν id)) {U : Set (EuclideanSpace ℝ ι)} (hU : IsOpen U)
    (hUne : U.Nonempty) (hUν : U ⊆ ν.support)
    (π : Measure (EuclideanSpace ℝ ι)) [IsProbabilityMeasure π]
    (hπΘ : π (naturalParameterSpace ν id)ᶜ = 0) (hπ : ∀ θ, π ≠ Measure.dirac θ)
    (κ : Kernel (EuclideanSpace ℝ ι) (EuclideanSpace ℝ ι)) [IsFiniteKernel κ]
    (hκ : ∀ θ, κ θ = exponentialFamilyMeasure ν id θ) (a : ℝ) (b : EuclideanSpace ℝ ι)
    (hlin : ∀ᵐ x ∂(κ ∘ₘ π),
      Integrable (fun θ ↦ ∫ y, y ∂exponentialFamilyMeasure ν id θ) ((κ†π) x) ∧
        ∫ θ, (∫ y, y ∂exponentialFamilyMeasure ν id θ) ∂(κ†π) x = a • x + b) :
    a ≠ 0 ∧ ∃ c : ℝ≥0∞, π = c • volume.withDensity ((naturalParameterSpace ν id).indicator
      fun θ ↦ ENNReal.ofReal (Real.exp (a⁻¹ * inner ℝ b θ - a⁻¹ * (1 - a) *
        logPartition ν id θ))) :=
  sorry

end Layer2

end TauCetiRoadmap.ConjugatePriorsAndPosteriorUpdates

end

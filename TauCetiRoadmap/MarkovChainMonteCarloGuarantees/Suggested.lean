import Mathlib
import TauCeti.Probability.Kernel.Matrix
import TauCeti.Probability.Process.MarkovChain

/-!
# Error guarantees for Markov chain Monte Carlo on finite state spaces: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here. The README's remarks, API lists and Checks are not
restated.

The definitions `tvToStationary`, `mixingTime` (MarkovChainMixing 1.2, 1.3), `transitionMatrix`
(MarkovChainMixing 2.1), `dirichletForm` and `spectralGap` (MarkovChainMixing 2.4), and
`stationaryMatrix`, `fundamentalMatrix` (MCMCAsymptoticVariance 1.1) and `asymptoticVariance`
(MCMCAsymptoticVariance 2.1) are verbatim copies of those roadmaps' definitions, made in
this namespace because a roadmap's file cannot import another roadmap's module.

The state space is a finite type; a chain is a Markov kernel on it with Tau Ceti's path law
`TauCeti.Probability.markovChainLaw ν κ` on `ℕ → S` (product σ-algebra), and the filtration of
the path is Mathlib's `Filtration.piLE`.
-/

noncomputable section

open Filter Topology MeasureTheory ProbabilityTheory Finset
open scoped NNReal ENNReal Matrix RealInnerProductSpace

namespace TauCetiRoadmap.MarkovChainMonteCarloGuarantees

variable {S : Type*} [MeasurableSpace S] [MeasurableSingletonClass S]

/-! ## Definitions copied from MarkovChainMixing and MCMCAsymptoticVariance -/

/-- 1.2 (copied verbatim from MarkovChainMixing 1.2): the distance to stationarity
`d(t) = max_x ‖κ^t(x, ·) − π‖_TV`. -/
def tvToStationary [Fintype S] [Nonempty S] (κ : Kernel S S) (π : Measure S) (t : ℕ) : ℝ :=
  univ.sup' univ_nonempty fun x ↦ tvDist ((κ ^ t) x) π / 2

/-- 1.2 (copied verbatim from MarkovChainMixing 1.3): the mixing time `t_mix(ε)`, the least `t`
with `d(t) ≤ ε`, and `⊤` if there is none. -/
def mixingTime [Fintype S] [Nonempty S] (κ : Kernel S S) (π : Measure S) (ε : ℝ) : ℕ∞ :=
  ⨅ (t : ℕ) (_ : tvToStationary κ π t ≤ ε), (t : ℕ∞)

/-- 1.1 (copied verbatim from MarkovChainMixing 2.1): the real transition matrix
`P x y = κ x {y}`. -/
def transitionMatrix (κ : Kernel S S) : Matrix S S ℝ :=
  κ.toMatrix.map (↑)

/-- 1.3 (copied verbatim from MarkovChainMixing 2.4): the Dirichlet form
`E(f) = ½ Σ_{x,y} (f x − f y)² π(x) κ(x, {y})`. -/
def dirichletForm [Fintype S] (κ : Kernel S S) (π : Measure S) (f : S → ℝ) : ℝ :=
  2⁻¹ * ∑ x, ∑ y, (f x - f y) ^ 2 * π.real {x} * (κ x).real {y}

/-- 1.3 (copied verbatim from MarkovChainMixing 2.4): the spectral gap `γ`, the infimum of
`E(f) / Var_π(f)` over the functions of nonzero variance, and `0` if there is none. -/
def spectralGap [Fintype S] (κ : Kernel S S) (π : Measure S) : ℝ :=
  ⨅ f : {f : S → ℝ // Var[f; π] ≠ 0}, dirichletForm κ π f / Var[f; π]

/-- 1.2 (copied verbatim from MCMCAsymptoticVariance 1.1): the matrix `Π` all of whose rows are
the law `π`, `Π x y = π {y}`. -/
def stationaryMatrix (π : Measure S) : Matrix S S ℝ :=
  Matrix.of fun _ y ↦ π.real {y}

/-- 1.2 (copied verbatim from MCMCAsymptoticVariance 1.1): the fundamental matrix
`Z = (I − P + Π)⁻¹ − Π` of a chain with stationary law `π`. -/
def fundamentalMatrix [Fintype S] [DecidableEq S] (κ : Kernel S S) (π : Measure S) :
    Matrix S S ℝ :=
  (1 - transitionMatrix κ + stationaryMatrix π)⁻¹ - stationaryMatrix π

/-- 1.2 (copied verbatim from MCMCAsymptoticVariance 2.1): the asymptotic variance
`σ²(f) = 2 ⟨f̄, Z f̄⟩_π − ⟨f̄, f̄⟩_π`, where `f̄ = f − E_π f`. -/
def asymptoticVariance [Fintype S] [DecidableEq S] (κ : Kernel S S) (π : Measure S)
    (f : S → ℝ) : ℝ :=
  ∑ x, π.real {x} * (f x - ∫ y, f y ∂π) *
    (2 * (fundamentalMatrix κ π *ᵥ fun y ↦ f y - ∫ z, f z ∂π) x - (f x - ∫ y, f y ∂π))

/-! ## Layer 1: the Poisson martingale and the Poisson solution -/

/-- 1.1: the increment `D_j = g(X_{j+1}) − (P g)(X_j)` of the Poisson martingale along the
path `ω`. -/
def poissonIncrement [Fintype S] (κ : Kernel S S) (g : S → ℝ) (ω : ℕ → S) (j : ℕ) : ℝ :=
  g (ω (j + 1)) - (transitionMatrix κ *ᵥ g) (ω j)

/-- 1.1: the Poisson martingale. For every Markov kernel on a finite type, every initial
probability `ν` and every `g`, the sums `Σ_{j<n} D_j` form a martingale for the filtration of
the path under the law of the chain; together with `g(X_0)` they are Mathlib's martingale part
of `n ↦ g(X_n)`; and the conditional variance of `D_j` given the path up to `j` is
`P(g²)(X_j) − (P g)(X_j)²`. -/
theorem martingale_sum_poissonIncrement [Fintype S] (κ : Kernel S S) [IsMarkovKernel κ]
    (ν : Measure S) [IsProbabilityMeasure ν] (g : S → ℝ) :
    Martingale (fun n ω ↦ ∑ j ∈ range n, poissonIncrement κ g ω j) Filtration.piLE
        (TauCeti.Probability.markovChainLaw ν κ) ∧
      (∀ n, martingalePart (fun n (ω : ℕ → S) ↦ g (ω n)) Filtration.piLE
          (TauCeti.Probability.markovChainLaw ν κ) n
        =ᵐ[TauCeti.Probability.markovChainLaw ν κ]
          fun ω ↦ g (ω 0) + ∑ j ∈ range n, poissonIncrement κ g ω j) ∧
      ∀ j, (TauCeti.Probability.markovChainLaw ν κ)[fun ω ↦ poissonIncrement κ g ω j ^ 2 |
          Filtration.piLE (X := fun _ : ℕ ↦ S) j] =ᵐ[TauCeti.Probability.markovChainLaw ν κ]
        fun ω ↦ (transitionMatrix κ *ᵥ fun y ↦ g y ^ 2) (ω j) -
          (transitionMatrix κ *ᵥ g) (ω j) ^ 2 :=
  sorry

/-- 1.2: the Poisson solution under a mixing-time bound. If `π` is stationary,
`t_mix(1/4) ≤ T` and `|f x − f y| ≤ c` for all states, then `1 − P + Π` is invertible, the
series `Σ_t (P^t − Π)` converges to `Z`, `g = Z f` solves `g − P g = f − E_π f`, `|g x| ≤ 2 T c`
and `|g x − g y| ≤ 2 T c`, and `σ²(f) = E_π[g² − (P g)²]`. Neither irreducibility nor
aperiodicity is assumed. -/
theorem fundamentalMatrix_of_mixingTime_le [Fintype S] [DecidableEq S] [Nonempty S]
    (κ : Kernel S S) [IsMarkovKernel κ] (π : Measure S) [IsProbabilityMeasure π]
    (hπ : κ.Invariant π) {T : ℕ} (hT : mixingTime κ π (1 / 4) ≤ T) (f : S → ℝ) {c : ℝ}
    (hf : ∀ x y, |f x - f y| ≤ c) :
    IsUnit (1 - transitionMatrix κ + stationaryMatrix π) ∧
      HasSum (fun t : ℕ ↦ transitionMatrix κ ^ t - stationaryMatrix π) (fundamentalMatrix κ π) ∧
      (∀ x, (fundamentalMatrix κ π *ᵥ f) x -
          (transitionMatrix κ *ᵥ (fundamentalMatrix κ π *ᵥ f)) x = f x - ∫ y, f y ∂π) ∧
      (∀ x, |(fundamentalMatrix κ π *ᵥ f) x| ≤ 2 * T * c) ∧
      (∀ x y, |(fundamentalMatrix κ π *ᵥ f) x - (fundamentalMatrix κ π *ᵥ f) y| ≤ 2 * T * c) ∧
      asymptoticVariance κ π f = ∑ x, π.real {x} * ((fundamentalMatrix κ π *ᵥ f) x ^ 2 -
        (transitionMatrix κ *ᵥ (fundamentalMatrix κ π *ᵥ f)) x ^ 2) :=
  sorry

/-- 1.3: the Poisson solution and the spectral gap. If `π` is stationary and
`g − P g = f − E_π f`, then `γ² Var_π g ≤ Var_π f`, and `π(x) (g x − E_π g)² γ² ≤ Var_π f` for
every state `x`. Neither irreducibility nor reversibility is assumed. -/
theorem variance_le_of_poisson [Fintype S] (κ : Kernel S S) [IsMarkovKernel κ]
    (π : Measure S) [IsProbabilityMeasure π] (hπ : κ.Invariant π) (f g : S → ℝ)
    (hg : ∀ x, g x - (transitionMatrix κ *ᵥ g) x = f x - ∫ y, f y ∂π) :
    spectralGap κ π ^ 2 * Var[g; π] ≤ Var[f; π] ∧
      ∀ x, π.real {x} * (g x - ∫ y, g y ∂π) ^ 2 * spectralGap κ π ^ 2 ≤ Var[f; π] :=
  sorry

/-! ## Layer 2: non-asymptotic guarantees from every initial law -/

/-- 2.1: bias and mean-square error after burn-in. Let `π` be stationary with
`t_mix(1/4) ≤ T`, `ν` any initial probability, `g` a solution of `g − P g = f − E_π f` with
`|g x − g y| ≤ c`, and `S = Σ_{j<n} (f(X_{B+j}) − E_π f)`. Then `|E_ν S| ≤ 2 c d(B)` and
`E_ν S² ≤ (√(n σ²(f) + T c² / (2 · 2^⌊B/T⌋)) + c)²`. -/
theorem integral_sum_sub_sq_le [Fintype S] [DecidableEq S] [Nonempty S] (κ : Kernel S S)
    [IsMarkovKernel κ] (π : Measure S) [IsProbabilityMeasure π] (hπ : κ.Invariant π) {T : ℕ}
    (hT : mixingTime κ π (1 / 4) ≤ T) (ν : Measure S) [IsProbabilityMeasure ν] (f g : S → ℝ)
    (hg : ∀ x, g x - (transitionMatrix κ *ᵥ g) x = f x - ∫ y, f y ∂π) {c : ℝ}
    (hc : ∀ x y, |g x - g y| ≤ c) (B n : ℕ) :
    |∫ ω, ∑ j ∈ range n, (f (ω (B + j)) - ∫ y, f y ∂π)
        ∂(TauCeti.Probability.markovChainLaw ν κ)| ≤ 2 * c * tvToStationary κ π B ∧
      ∫ ω, (∑ j ∈ range n, (f (ω (B + j)) - ∫ y, f y ∂π)) ^ 2
          ∂(TauCeti.Probability.markovChainLaw ν κ) ≤
        (Real.sqrt (n * asymptoticVariance κ π f + T * c ^ 2 / (2 * 2 ^ (B / T))) + c) ^ 2 :=
  sorry

/-- 2.2: Hoeffding's inequality for finite Markov chains. For every Markov kernel on a finite
type, every initial probability `ν`, every `m` and every solution `g` of `g − P g = f − m` with
`|g x − g y| ≤ c`, the sum `S = Σ_{j<n} (f(X_{B+j}) − m)` satisfies
`P_ν(S ≥ t) ≤ exp(−2 (t − c)² / (n c²))` for every `t ≥ c`. -/
theorem measureReal_le_sum_sub_le [Fintype S] (κ : Kernel S S) [IsMarkovKernel κ]
    (ν : Measure S) [IsProbabilityMeasure ν] (f g : S → ℝ) (m : ℝ)
    (hg : ∀ x, g x - (transitionMatrix κ *ᵥ g) x = f x - m) {c : ℝ}
    (hc : ∀ x y, |g x - g y| ≤ c) (B n : ℕ) {t : ℝ} (ht : c ≤ t) :
    (TauCeti.Probability.markovChainLaw ν κ).real
        {ω | t ≤ ∑ j ∈ range n, (f (ω (B + j)) - m)} ≤
      Real.exp (-2 * (t - c) ^ 2 / (n * c ^ 2)) :=
  sorry

/-! ## Layer 3: asymptotic inference -/

/-- 3.1: the batch-means estimator of the asymptotic variance with `a` batches of length `b`:
with batch means `Y_k = b⁻¹ Σ_{i<b} f(ω(k b + i))`, it is `b/(a − 1) Σ_{k<a} (Y_k − Ȳ)²`,
`Ȳ` the mean of the `Y_k`. -/
def batchMeansVariance (f : S → ℝ) (a b : ℕ) (ω : ℕ → S) : ℝ :=
  let Y : ℕ → ℝ := fun k ↦ (∑ i ∈ range b, f (ω (k * b + i))) / b
  (b : ℝ) / ((a : ℝ) - 1) * ∑ k ∈ range a, (Y k - (∑ l ∈ range a, Y l) / a) ^ 2

/-- 3.1: consistency of batch means. For an irreducible chain with stationary law `π`, every
initial probability `ν` and numbers of batches `a m → ∞` and batch lengths `b m → ∞`, the
batch-means estimator converges in probability to `σ²(f)`. Aperiodicity is not assumed. -/
theorem tendstoInMeasure_batchMeansVariance [Fintype S] [DecidableEq S] (κ : Kernel S S)
    [IsMarkovKernel κ] [Kernel.IsIrreducible Measure.count κ] (π : Measure S)
    [IsProbabilityMeasure π] (hπ : κ.Invariant π) (ν : Measure S) [IsProbabilityMeasure ν]
    (f : S → ℝ) {a b : ℕ → ℕ} (ha : Tendsto a atTop atTop) (hb : Tendsto b atTop atTop) :
    TendstoInMeasure (TauCeti.Probability.markovChainLaw ν κ)
      (fun m ω ↦ batchMeansVariance f (a m) (b m) ω) atTop
      (fun _ ↦ asymptoticVariance κ π f) :=
  sorry

/-- 3.2: the batch-means confidence interval. Under the hypotheses of 3.1 and `σ²(f) > 0`, with
`n = a m · b m`, the probability that `|n⁻¹ Σ_{j<n} f(X_j) − E_π f| ≤ z √(σ̂² / n)` tends to the
standard Gaussian mass of `[−z, z]`, for every real `z`. -/
theorem tendsto_measureReal_abs_sub_le_mul_sqrt [Fintype S] [DecidableEq S] (κ : Kernel S S)
    [IsMarkovKernel κ] [Kernel.IsIrreducible Measure.count κ] (π : Measure S)
    [IsProbabilityMeasure π] (hπ : κ.Invariant π) (ν : Measure S) [IsProbabilityMeasure ν]
    (f : S → ℝ) (hσ : 0 < asymptoticVariance κ π f) {a b : ℕ → ℕ}
    (ha : Tendsto a atTop atTop) (hb : Tendsto b atTop atTop) (z : ℝ) :
    Tendsto (fun m ↦ (TauCeti.Probability.markovChainLaw ν κ).real
        {ω | |(∑ j ∈ range (a m * b m), f (ω j)) / (a m * b m : ℕ) - ∫ y, f y ∂π| ≤
          z * Real.sqrt (batchMeansVariance f (a m) (b m) ω / (a m * b m : ℕ))})
      atTop (𝓝 ((gaussianReal 0 1).real (Set.Icc (-z) z))) :=
  sorry

/-- 3.3: the asymptotic covariance matrix of `f : S → ℝ^k`, the polarisation
`Σ a b = (σ²(f_a + f_b) − σ²(f_a) − σ²(f_b)) / 2` of the asymptotic variance. -/
def asymptoticCovariance [Fintype S] [DecidableEq S] {k : ℕ} (κ : Kernel S S)
    (π : Measure S) (f : S → EuclideanSpace ℝ (Fin k)) : Matrix (Fin k) (Fin k) ℝ :=
  Matrix.of fun a b ↦ (asymptoticVariance κ π (fun x ↦ f x a + f x b) -
    asymptoticVariance κ π (fun x ↦ f x a) - asymptoticVariance κ π (fun x ↦ f x b)) / 2

/-- 3.3: the multivariate central limit theorem. For an irreducible chain with stationary law
`π`, every initial probability `ν` and `f : S → ℝ^k`, the asymptotic covariance matrix is
positive semidefinite and `n^{-1/2} Σ_{j<n} (f(X_j) − E_π f)` converges in law to the centred
Gaussian law with that covariance. Aperiodicity is not assumed. -/
theorem tendstoInDistribution_markovChainLaw_euclidean [Fintype S] [DecidableEq S]
    (κ : Kernel S S) [IsMarkovKernel κ] [Kernel.IsIrreducible Measure.count κ] (π : Measure S)
    [IsProbabilityMeasure π] (hπ : κ.Invariant π) (ν : Measure S) [IsProbabilityMeasure ν]
    {k : ℕ} (f : S → EuclideanSpace ℝ (Fin k)) {Ω' : Type*} [MeasurableSpace Ω']
    {μ' : Measure Ω'} [IsProbabilityMeasure μ'] {Z : Ω' → EuclideanSpace ℝ (Fin k)}
    (hZ : HasLaw Z (multivariateGaussian 0 (asymptoticCovariance κ π f)) μ') :
    (asymptoticCovariance κ π f).PosSemidef ∧
      TendstoInDistribution
        (fun (n : ℕ) ω ↦ (Real.sqrt n)⁻¹ • ∑ j ∈ range n, (f (ω j) - ∫ y, f y ∂π)) atTop Z
        (fun _ ↦ TauCeti.Probability.markovChainLaw ν κ) μ' :=
  sorry

end TauCetiRoadmap.MarkovChainMonteCarloGuarantees

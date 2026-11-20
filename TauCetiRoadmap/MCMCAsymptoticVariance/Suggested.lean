import Mathlib
import TauCeti.Probability.Kernel.Matrix
import TauCeti.Probability.MarkovChain.Period
import TauCeti.Probability.Process.MarkovChain

/-!
# Asymptotic variance of finite Markov chains: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here. The README's remaining targets, API lists and Checks are
not restated.

The definitions `transitionMatrix` (MarkovChainMixing 2.1) and `dirichletForm`, `spectralGap`
(MarkovChainMixing 2.4) are verbatim copies of that roadmap's definitions, made in this namespace because a roadmap's file
cannot import another roadmap's module.

Suppliers used by the statements: Mathlib `Kernel.Invariant`, `Kernel.IsReversible`,
`Kernel.IsIrreducible`, `Matrix.inv`, `Matrix.mulVec`, `variance`, `covariance`, `HasSum`;
Tau Ceti `Kernel.toMatrix`, `Kernel.IsAperiodic` and `TauCeti.Probability.markovChainLaw`.
-/

noncomputable section

open Filter Topology MeasureTheory ProbabilityTheory Finset
open scoped NNReal ENNReal Matrix

namespace TauCetiRoadmap.MCMCAsymptoticVariance

variable {S : Type*} [MeasurableSpace S] [MeasurableSingletonClass S]

/-! ## Layer 1: the fundamental matrix and the Poisson equation -/

/-- 1.1 (copied verbatim from MarkovChainMixing 2.1): the real transition matrix
`P x y = κ x {y}`. -/
def transitionMatrix (κ : Kernel S S) : Matrix S S ℝ :=
  κ.toMatrix.map (↑)

/-- 1.1: the matrix `Π` all of whose rows are the law `π`, `Π x y = π {y}`. -/
def stationaryMatrix (π : Measure S) : Matrix S S ℝ :=
  Matrix.of fun _ y ↦ π.real {y}

/-- 1.1: the fundamental matrix `Z = (I − P + Π)⁻¹ − Π` of a chain with stationary law `π`. -/
def fundamentalMatrix [Fintype S] [DecidableEq S] (κ : Kernel S S) (π : Measure S) :
    Matrix S S ℝ :=
  (1 - transitionMatrix κ + stationaryMatrix π)⁻¹ - stationaryMatrix π

/-- 1.2: for an irreducible chain with stationary law `π`, the Cesàro means
`Σ_{t<n} (1 − t/n) (P^t − Π)` of the partial sums of `Σ_t (P^t − Π)` converge to the
fundamental matrix; the chain may be periodic. -/
theorem tendsto_cesaro_fundamentalMatrix [Fintype S] [DecidableEq S] (κ : Kernel S S)
    [IsMarkovKernel κ] [Kernel.IsIrreducible Measure.count κ] (π : Measure S)
    [IsProbabilityMeasure π] (hπ : κ.Invariant π) :
    Tendsto (fun n : ℕ ↦ ∑ t ∈ range n,
        (1 - (t : ℝ) / n) • (transitionMatrix κ ^ t - stationaryMatrix π)) atTop
      (𝓝 (fundamentalMatrix κ π)) :=
  sorry

/-- 1.2: for an irreducible aperiodic chain the series `Σ_t (P^t − Π)` converges to the
fundamental matrix. -/
theorem hasSum_fundamentalMatrix [Fintype S] [DecidableEq S] (κ : Kernel S S)
    [IsMarkovKernel κ] [Kernel.IsIrreducible Measure.count κ] (hκ : κ.IsAperiodic)
    (π : Measure S) [IsProbabilityMeasure π] (hπ : κ.Invariant π) :
    HasSum (fun t : ℕ ↦ transitionMatrix κ ^ t - stationaryMatrix π) (fundamentalMatrix κ π) :=
  sorry

/-- 1.3: the Poisson equation. For an irreducible chain with stationary law `π`, the solutions
`g` of `g − P g = f − E_π f` are exactly the functions `Z f + c` with `c` a constant. -/
theorem poisson_iff [Fintype S] [DecidableEq S] (κ : Kernel S S) [IsMarkovKernel κ]
    [Kernel.IsIrreducible Measure.count κ] (π : Measure S) [IsProbabilityMeasure π]
    (hπ : κ.Invariant π) (f g : S → ℝ) :
    (∀ x, g x - (transitionMatrix κ *ᵥ g) x = f x - ∫ y, f y ∂π) ↔
      ∃ c : ℝ, g = fundamentalMatrix κ π *ᵥ f + fun _ ↦ c :=
  sorry

/-! ## Layer 2: the asymptotic variance -/

/-- 2.1: the asymptotic variance `σ²(f) = 2 ⟨f̄, Z f̄⟩_π − ⟨f̄, f̄⟩_π`, where `f̄ = f − E_π f`. -/
def asymptoticVariance [Fintype S] [DecidableEq S] (κ : Kernel S S) (π : Measure S)
    (f : S → ℝ) : ℝ :=
  ∑ x, π.real {x} * (f x - ∫ y, f y ∂π) *
    (2 * (fundamentalMatrix κ π *ᵥ fun y ↦ f y - ∫ z, f z ∂π) x - (f x - ∫ y, f y ∂π))

/-- 2.1: for every solution `g` of the Poisson equation, `σ²(f) = E_π[g² − (P g)²]`. -/
theorem asymptoticVariance_eq_of_poisson [Fintype S] [DecidableEq S] (κ : Kernel S S)
    [IsMarkovKernel κ] [Kernel.IsIrreducible Measure.count κ] (π : Measure S)
    [IsProbabilityMeasure π] (hπ : κ.Invariant π) (f g : S → ℝ)
    (hg : ∀ x, g x - (transitionMatrix κ *ᵥ g) x = f x - ∫ y, f y ∂π) :
    asymptoticVariance κ π f = ∑ x, π.real {x} * (g x ^ 2 - (transitionMatrix κ *ᵥ g) x ^ 2) :=
  sorry

/-- 2.2: for an irreducible chain and every initial law `ν`, the variance of
`S_n = Σ_{k<n} f(X_k)` grows like `n σ²(f)`; the chain may be periodic. -/
theorem tendsto_variance_sum_div [Fintype S] [DecidableEq S] (κ : Kernel S S)
    [IsMarkovKernel κ] [Kernel.IsIrreducible Measure.count κ] (π : Measure S)
    [IsProbabilityMeasure π] (hπ : κ.Invariant π) (ν : Measure S) [IsProbabilityMeasure ν]
    (f : S → ℝ) :
    Tendsto (fun n : ℕ ↦
        Var[fun ω : ℕ → S ↦ ∑ k ∈ range n, f (ω k); TauCeti.Probability.markovChainLaw ν κ] / n)
      atTop (𝓝 (asymptoticVariance κ π f)) :=
  sorry

/-- 2.3: for an irreducible aperiodic chain, `σ²(f) = Var_π f + 2 Σ_{k ≥ 1} Cov_π(f(X_0), f(X_k))`,
the covariances being those of the stationary chain. -/
theorem hasSum_covariance [Fintype S] [DecidableEq S] (κ : Kernel S S) [IsMarkovKernel κ]
    [Kernel.IsIrreducible Measure.count κ] (hκ : κ.IsAperiodic) (π : Measure S)
    [IsProbabilityMeasure π] (hπ : κ.Invariant π) (f : S → ℝ) :
    HasSum (fun k : ℕ ↦ 2 * cov[fun ω : ℕ → S ↦ f (ω 0), fun ω ↦ f (ω (k + 1));
        TauCeti.Probability.markovChainLaw π κ])
      (asymptoticVariance κ π f - Var[f; π]) :=
  sorry

/-- 2.4: for an irreducible chain, `σ²(f) = 0` exactly when `f − E_π f` is a coboundary along the
transitions: `f x − E_π f = u x − u y` whenever `κ` moves from `x` to `y` with positive
probability. -/
theorem asymptoticVariance_eq_zero_iff [Fintype S] [DecidableEq S] (κ : Kernel S S)
    [IsMarkovKernel κ] [Kernel.IsIrreducible Measure.count κ] (π : Measure S)
    [IsProbabilityMeasure π] (hπ : κ.Invariant π) (f : S → ℝ) :
    asymptoticVariance κ π f = 0 ↔
      ∃ u : S → ℝ, ∀ x y, 0 < κ x {y} → f x - ∫ z, f z ∂π = u x - u y :=
  sorry

/-! ## Layer 3: Dirichlet forms and the spectral bound -/

/-- 3.1 (copied verbatim from MarkovChainMixing 2.4): the Dirichlet form
`E(f) = ½ Σ_{x,y} (f x − f y)² π(x) κ(x, {y})`. -/
def dirichletForm [Fintype S] (κ : Kernel S S) (π : Measure S) (f : S → ℝ) : ℝ :=
  2⁻¹ * ∑ x, ∑ y, (f x - f y) ^ 2 * π.real {x} * (κ x).real {y}

/-- 3.1 (copied verbatim from MarkovChainMixing 2.4): the spectral gap `γ`, the infimum of
`E(f) / Var_π(f)` over the functions of nonzero variance, and `0` if there is none. -/
def spectralGap [Fintype S] (κ : Kernel S S) (π : Measure S) : ℝ :=
  ⨅ f : {f : S → ℝ // Var[f; π] ≠ 0}, dirichletForm κ π f / Var[f; π]

/-- 3.1: for a chain with stationary law `π`, `σ²(f) = 2 E(Z f) − Var_π f`. Irreducibility is not
needed: when `1 − P + Π` is singular, both sides are `−Var_π f`. -/
theorem asymptoticVariance_eq_two_mul_dirichletForm [Fintype S] [DecidableEq S]
    (κ : Kernel S S) [IsMarkovKernel κ] (π : Measure S)
    [IsProbabilityMeasure π] (hπ : κ.Invariant π) (f : S → ℝ) :
    asymptoticVariance κ π f =
      2 * dirichletForm κ π (fundamentalMatrix κ π *ᵥ f) - Var[f; π] :=
  sorry

/-- 3.2: the spectral bound. For a chain with stationary law `π`, reversible or not,
`σ²(f) ≤ (2/γ − 1) Var_π f`. Irreducibility is not needed: when `1 − P + Π` is singular, the left
side is `−Var_π f`. -/
theorem asymptoticVariance_le_spectralGap [Fintype S] [DecidableEq S] (κ : Kernel S S)
    [IsMarkovKernel κ] (π : Measure S)
    [IsProbabilityMeasure π] (hπ : κ.Invariant π) (f : S → ℝ) :
    asymptoticVariance κ π f ≤ (2 / spectralGap κ π - 1) * Var[f; π] :=
  sorry

/-- 3.3: the variational formula. For an irreducible chain reversible with respect to `π`,
`(σ²(f) + Var_π f) / 2` is the largest value of `2 ⟨f − E_π f, g⟩_π − E(g)` over all `g`. -/
theorem isGreatest_variational [Fintype S] [DecidableEq S] (κ : Kernel S S) [IsMarkovKernel κ]
    [Kernel.IsIrreducible Measure.count κ] (π : Measure S) [IsProbabilityMeasure π]
    (hrev : κ.IsReversible π) (f : S → ℝ) :
    IsGreatest (Set.range fun g : S → ℝ ↦
        2 * ∑ x, π.real {x} * (f x - ∫ y, f y ∂π) * g x - dirichletForm κ π g)
      ((asymptoticVariance κ π f + Var[f; π]) / 2) :=
  sorry

/-! ## Layer 4: orderings of chains -/

/-- 4.1: ordering by Dirichlet forms. If `π` is stationary for `κ₁`, `κ₂` is irreducible and
reversible with respect to `π`, and `E₂(g) ≤ E₁(g)` for every `g`, then
`σ²(κ₁, f) ≤ σ²(κ₂, f)`. -/
theorem asymptoticVariance_le_of_dirichletForm_le [Fintype S] [DecidableEq S]
    (κ₁ κ₂ : Kernel S S) [IsMarkovKernel κ₁] [IsMarkovKernel κ₂]
    [Kernel.IsIrreducible Measure.count κ₂] (π : Measure S) [IsProbabilityMeasure π]
    (h₁ : κ₁.Invariant π) (h₂ : κ₂.IsReversible π)
    (h : ∀ g, dirichletForm κ₂ π g ≤ dirichletForm κ₁ π g) (f : S → ℝ) :
    asymptoticVariance κ₁ π f ≤ asymptoticVariance κ₂ π f :=
  sorry

/-- 4.2: Peskun's theorem. If `π` is stationary for `κ₁`, `κ₂` is irreducible and reversible
with respect to `π`, and `κ₂(x, {y}) ≤ κ₁(x, {y})` for all `x ≠ y`, then
`σ²(κ₁, f) ≤ σ²(κ₂, f)`. -/
theorem asymptoticVariance_le_of_offDiag_le [Fintype S] [DecidableEq S]
    (κ₁ κ₂ : Kernel S S) [IsMarkovKernel κ₁] [IsMarkovKernel κ₂]
    [Kernel.IsIrreducible Measure.count κ₂] (π : Measure S) [IsProbabilityMeasure π]
    (h₁ : κ₁.Invariant π) (h₂ : κ₂.IsReversible π)
    (h : ∀ x y, x ≠ y → (κ₂ x).real {y} ≤ (κ₁ x).real {y}) (f : S → ℝ) :
    asymptoticVariance κ₁ π f ≤ asymptoticVariance κ₂ π f :=
  sorry

end TauCetiRoadmap.MCMCAsymptoticVariance

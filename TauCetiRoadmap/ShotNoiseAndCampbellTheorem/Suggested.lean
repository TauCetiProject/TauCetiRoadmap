import Mathlib
import TauCeti.Probability.Renewal.Basic

/-!
# Shot noise and Campbell's theorem: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
definitions they need; every definition has a real body.

The homogeneous Poisson process of rate `rate` on the line is built from gaps: the points on the
right of the origin are the arrival times `arrival` (Tau Ceti) of the gaps `G (.inl k)`, and the
points on the left are the negatives of the arrival times of the gaps `G (.inr k)`. Each point `i`
carries a mark `M i` in a measurable space `E`. The pairs `(G i, M i)` are independent with law
`expMeasure rate ⊗ ν`, so the gaps are independent exponential and the marks are independent with
law `ν`, independent of the gaps (`IsMarkedPoissonInput`). The sum of a function over the marked
points is `poissonSum`; the marked shot noise with kernel `g` is
`markedShotNoise g G M t = ∑' i, g (t - τᵢ, Mᵢ)`, a real `tsum` (zero where the series does not
converge absolutely). The number of customers present at time `t` in the infinite-server queue whose
customers arrive at the points and stay for the marks is `numberInSystem`.
-/

noncomputable section

open MeasureTheory ProbabilityTheory Filter Topology Complex
open scoped ENNReal NNReal

namespace TauCetiRoadmap.ShotNoiseAndCampbellTheorem

open TauCeti.Probability (arrival)

variable {Ω E : Type*} [MeasurableSpace Ω] [MeasurableSpace E]

/-- 1.1: the points of the two-sided process built from the gaps `G`: `τ (.inl n)` is the sum of
the gaps `G (.inl 0), …, G (.inl n)`, and `τ (.inr n)` is minus the sum of the gaps
`G (.inr 0), …, G (.inr n)`. -/
def twoSidedPoint (G : ℕ ⊕ ℕ → Ω → ℝ≥0) : ℕ ⊕ ℕ → Ω → ℝ
  | .inl n, ω => (arrival (fun k => G (.inl k)) (n + 1) ω : ℝ)
  | .inr n, ω => -(arrival (fun k => G (.inr k)) (n + 1) ω : ℝ)

/-- 1.1: the gaps `G` and marks `M` are a marked Poisson input of rate `rate` with mark law `ν`:
measurable, the pairs `(G i, M i)` independent, each with law `expMeasure rate ⊗ ν`. -/
structure IsMarkedPoissonInput (P : Measure Ω) (rate : ℝ≥0) (ν : Measure E)
    (G : ℕ ⊕ ℕ → Ω → ℝ≥0) (M : ℕ ⊕ ℕ → Ω → E) : Prop where
  measurable_gap : ∀ i, Measurable (G i)
  measurable_mark : ∀ i, Measurable (M i)
  iIndepFun_pair : iIndepFun (fun i ω => (G i ω, M i ω)) P
  hasLaw_pair : ∀ i, HasLaw (fun ω => ((G i ω : ℝ), M i ω)) ((expMeasure rate).prod ν) P

/-- 1.1: the sum `∑' i, f (τᵢ, Mᵢ)` of a real function over the marked points (a real `tsum`,
zero where the series does not converge absolutely). -/
def poissonSum (f : ℝ × E → ℝ) (G : ℕ ⊕ ℕ → Ω → ℝ≥0) (M : ℕ ⊕ ℕ → Ω → E) (ω : Ω) : ℝ :=
  ∑' i, f (twoSidedPoint G i ω, M i ω)

/-- 2.1: the marked shot noise `X t = ∑' i, g (t - τᵢ, Mᵢ)` with kernel `g`. -/
def markedShotNoise (g : ℝ × E → ℝ) (G : ℕ ⊕ ℕ → Ω → ℝ≥0) (M : ℕ ⊕ ℕ → Ω → E) (t : ℝ) :
    Ω → ℝ :=
  poissonSum (fun p => g (t - p.1, p.2)) G M

/-- 4.1: the number of customers present at time `t` when customer `i` arrives at `τᵢ` and stays
for the time `Mᵢ`: the number of `i` with `τᵢ ≤ t < τᵢ + Mᵢ`, possibly infinite. -/
def numberInSystem (G : ℕ ⊕ ℕ → Ω → ℝ≥0) (M : ℕ ⊕ ℕ → Ω → ℝ≥0) (t : ℝ) (ω : Ω) : ℕ∞ :=
  {i | twoSidedPoint G i ω ≤ t ∧ t < twoSidedPoint G i ω + M i ω}.encard

variable {P : Measure Ω} {rate : ℝ≥0} {ν : Measure E} {G : ℕ ⊕ ℕ → Ω → ℝ≥0}
  {M : ℕ ⊕ ℕ → Ω → E}

/-- 1.2: Campbell's formula. For measurable `f ≥ 0`, the expected sum of `f` over the marked points
is `rate` times the integral of `f` against Lebesgue measure times `ν`. -/
theorem lintegral_tsum_marked (h : IsMarkedPoissonInput P rate ν G M) {f : ℝ × E → ℝ≥0∞}
    (hf : Measurable f) :
    ∫⁻ ω, ∑' i, f (twoSidedPoint G i ω, M i ω) ∂P = rate * ∫⁻ p, f p ∂(volume.prod ν) := by
  sorry

/-- 1.3: the Laplace functional. For measurable `f ≥ 0`,
`E exp (-∑ f(τᵢ, Mᵢ)) = exp (-rate ∫ (1 - exp (-f)))`, with `exp (-∞) = 0` on both sides. -/
theorem lintegral_exp_neg_tsum_marked (h : IsMarkedPoissonInput P rate ν G M)
    {f : ℝ × E → ℝ≥0∞} (hf : Measurable f) :
    ∫⁻ ω, EReal.exp (-((∑' i, f (twoSidedPoint G i ω, M i ω) : ℝ≥0∞) : EReal)) ∂P =
      EReal.exp (-(((rate : ℝ≥0∞) *
        ∫⁻ p, (1 - EReal.exp (-((f p : ℝ≥0∞) : EReal))) ∂(volume.prod ν) : ℝ≥0∞) : EReal)) := by
  sorry

/-- 1.4: absolute convergence. For measurable real `f`, if `∫ min (|f|, 1) < ∞` then almost surely
`∑ f(τᵢ, Mᵢ)` converges absolutely, and if `∫ min (|f|, 1) = ∞` then almost surely it does not. -/
theorem summable_marked_dichotomy (h : IsMarkedPoissonInput P rate ν G M) {f : ℝ × E → ℝ}
    (hf : Measurable f) :
    (∫⁻ p, min ‖f p‖ₑ 1 ∂(volume.prod ν) < ∞ →
        ∀ᵐ ω ∂P, Summable fun i => f (twoSidedPoint G i ω, M i ω)) ∧
      (∫⁻ p, min ‖f p‖ₑ 1 ∂(volume.prod ν) = ∞ →
        ∀ᵐ ω ∂P, ¬ Summable fun i => f (twoSidedPoint G i ω, M i ω)) := by
  sorry

/-- 1.5: the characteristic functional. For measurable real `f` with `∫ min (|f|, 1) < ∞`,
`E exp (i ∑ f(τᵢ, Mᵢ)) = exp (rate ∫ (exp (i f) - 1))`. -/
theorem integral_cexp_poissonSum (h : IsMarkedPoissonInput P rate ν G M) {f : ℝ × E → ℝ}
    (hf : Measurable f) (hfin : ∫⁻ p, min ‖f p‖ₑ 1 ∂(volume.prod ν) < ∞) :
    ∫ ω, cexp (I * poissonSum f G M ω) ∂P =
      cexp ((rate : ℂ) * ∫ p, (cexp (I * f p) - 1) ∂(volume.prod ν)) := by
  sorry

/-- 2.1: Campbell's theorem, the mean. For an integrable kernel `g`, the shot noise at time `t` is
integrable with mean `rate * ∫ g`. -/
theorem integral_markedShotNoise (h : IsMarkedPoissonInput P rate ν G M) {g : ℝ × E → ℝ}
    (hg : Integrable g (volume.prod ν)) (t : ℝ) :
    Integrable (markedShotNoise g G M t) P ∧
      ∫ ω, markedShotNoise g G M t ω ∂P = rate * ∫ p, g p ∂(volume.prod ν) := by
  sorry

/-- 2.2: Campbell's theorem, the covariance. For a kernel `g` in `L¹ ∩ L²`, the shot noise is square
integrable and `Cov (X t, X (t + τ)) = rate * ∫ g (s, m) g (s + τ, m)`. -/
theorem covariance_markedShotNoise (h : IsMarkedPoissonInput P rate ν G M) {g : ℝ × E → ℝ}
    (hg₁ : Integrable g (volume.prod ν)) (hg₂ : MemLp g 2 (volume.prod ν)) (t τ : ℝ) :
    MemLp (markedShotNoise g G M t) 2 P ∧
      covariance (markedShotNoise g G M t) (markedShotNoise g G M (t + τ)) P =
        rate * ∫ p, g p * g (p.1 + τ, p.2) ∂(volume.prod ν) := by
  sorry

/-- 2.3: cumulants. For a bounded integrable kernel `g`, the cumulant generating function of the
shot noise is `θ ↦ rate * ∫ (exp (θ g) - 1)` and, for `n ≥ 1`, its `n`-th derivative at zero is
`rate * ∫ g ^ n`. -/
theorem cgf_markedShotNoise (h : IsMarkedPoissonInput P rate ν G M) {g : ℝ × E → ℝ}
    (hg : Integrable g (volume.prod ν)) (hb : ∃ C, ∀ p, |g p| ≤ C) (t : ℝ) :
    (∀ θ : ℝ, cgf (markedShotNoise g G M t) P θ =
        rate * ∫ p, (Real.exp (θ * g p) - 1) ∂(volume.prod ν)) ∧
      ∀ n : ℕ, 1 ≤ n → iteratedDeriv n (cgf (markedShotNoise g G M t) P) 0 =
        rate * ∫ p, g p ^ n ∂(volume.prod ν) := by
  sorry

/-- 3.1: strict stationarity. For every measurable kernel `g`, the path map `ω ↦ (t ↦ X t ω)` is
measurable and its law is invariant under every time shift. -/
theorem map_markedShotNoise_shift (h : IsMarkedPoissonInput P rate ν G M) {g : ℝ × E → ℝ}
    (hg : Measurable g) (s : ℝ) :
    Measurable (fun ω t => markedShotNoise g G M t ω) ∧
      P.map (fun ω t => markedShotNoise g G M (t + s) ω) =
        P.map (fun ω t => markedShotNoise g G M t ω) := by
  sorry

/-- 3.2: the Gaussian limit at high density. Along rates tending to infinity, for a kernel `g` in
`L¹ ∩ L²`, the finite-dimensional characteristic functions of the standardised shot noise
`(X t - rate ∫ g) / √rate` converge to those of the centred Gaussian process with covariance
`C τ = ∫ g (s, m) g (s + τ, m)`. -/
theorem tendsto_cexp_standardized_markedShotNoise {rates : ℕ → ℝ≥0}
    (hrates : Tendsto (fun n => (rates n : ℝ)) atTop atTop) {Gs : ℕ → ℕ ⊕ ℕ → Ω → ℝ≥0}
    {Ms : ℕ → ℕ ⊕ ℕ → Ω → E} (h : ∀ n, IsMarkedPoissonInput P (rates n) ν (Gs n) (Ms n))
    {g : ℝ × E → ℝ} (hg₁ : Integrable g (volume.prod ν)) (hg₂ : MemLp g 2 (volume.prod ν))
    {k : ℕ} (t u : Fin k → ℝ) :
    Tendsto (fun n => ∫ ω, cexp (I * ∑ j, (u j : ℂ) *
        (((markedShotNoise g (Gs n) (Ms n) (t j) ω - rates n * ∫ p, g p ∂(volume.prod ν)) /
          Real.sqrt (rates n) : ℝ) : ℂ)) ∂P) atTop
      (𝓝 (cexp (-(1 / 2 : ℂ) * ∑ j, ∑ l, (u j : ℂ) * (u l : ℂ) *
        ((∫ p, g p * g (p.1 + (t l - t j), p.2) ∂(volume.prod ν) : ℝ) : ℂ)))) := by
  sorry

/-- 4.1: the number in system of the infinite-server queue. If the service law `ν` on `ℝ≥0` has
finite mean `m`, the number of customers present at time `t` is Poisson of mean `rate * m`; if the
mean is infinite, infinitely many customers are present almost surely. -/
theorem numberInSystem_poisson {M : ℕ ⊕ ℕ → Ω → ℝ≥0} {ν : Measure ℝ≥0}
    (h : IsMarkedPoissonInput P rate ν G M) (t : ℝ) :
    (∫⁻ x, (x : ℝ≥0∞) ∂ν ≠ ∞ →
        HasLaw (numberInSystem G M t)
          ((poissonMeasure (rate * (∫⁻ x, (x : ℝ≥0∞) ∂ν).toNNReal)).map
            (fun n : ℕ => (n : ℕ∞))) P) ∧
      (∫⁻ x, (x : ℝ≥0∞) ∂ν = ∞ → ∀ᵐ ω ∂P, numberInSystem G M t ω = ⊤) := by
  sorry

end TauCetiRoadmap.ShotNoiseAndCampbellTheorem

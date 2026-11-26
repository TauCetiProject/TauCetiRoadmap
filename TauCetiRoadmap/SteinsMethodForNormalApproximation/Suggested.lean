import Mathlib
import TauCeti.MeasureTheory.OptimalTransport.Wasserstein.Basic

/-!
# Stein's method for normal approximation: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
two definitions they need (`steinSolution` and `steinClass`), which have real bodies. Every
headline theorem of the README is statable at the pins and is stated here. The README's proof
routes, API lists and Checks are not restated.

The standard normal law is Mathlib's `ProbabilityTheory.gaussianReal 0 1`. The distance is Tau
Ceti's `TauCeti.wassersteinEDist 1`, the infimum over couplings of the mean distance, with values
in `[0, ∞]`; for laws with a finite first moment it is the supremum of `∫ h dμ - ∫ h dν` over the
`1`-Lipschitz functions `h` (Tau Ceti's `TauCeti.wassersteinEDist_one_eq_iSup`), which is the
distance of the Stein's method literature. Everything is in dimension one.
-/

noncomputable section

open MeasureTheory ProbabilityTheory
open scoped ENNReal NNReal

namespace TauCetiRoadmap.SteinsMethodForNormalApproximation

/-! ## Layer 1: the Stein equation of the standard normal law -/

/-- 1.1 The solution of the Stein equation for a test function `h`:
`f_h(w) = e^(w²/2) ∫_{t ≤ w} (h(t) - E h(Z)) e^(-t²/2) dt`, with `Z` standard normal. -/
def steinSolution (h : ℝ → ℝ) (w : ℝ) : ℝ :=
  Real.exp (w ^ 2 / 2) *
    ∫ t in Set.Iic w, (h t - ∫ x, h x ∂gaussianReal 0 1) * Real.exp (-(t ^ 2) / 2)

/-- 1.1 The Stein equation. For a continuous `h` integrable against the standard normal law,
`steinSolution h` is differentiable and `f_h'(w) - w f_h(w) = h(w) - E h(Z)` at every `w`. -/
theorem hasDerivAt_steinSolution (h : ℝ → ℝ) (hc : Continuous h)
    (hi : Integrable h (gaussianReal 0 1)) (w : ℝ) :
    HasDerivAt (steinSolution h)
      (w * steinSolution h w + (h w - ∫ x, h x ∂gaussianReal 0 1)) w := by
  sorry

/-- 1.2 Stein's characterization. A probability measure `μ` on `ℝ` is the standard normal law if
and only if `∫ (f'(x) - x f(x)) dμ(x) = 0` for every continuously differentiable `f` with compact
support. -/
theorem eq_gaussianReal_iff_integral_stein (μ : Measure ℝ) [IsProbabilityMeasure μ] :
    μ = gaussianReal 0 1 ↔
      ∀ f : ℝ → ℝ, ContDiff ℝ 1 f → HasCompactSupport f →
        ∫ x, (deriv f x - x * f x) ∂μ = 0 := by
  sorry

/-! ## Layer 2: bounds on the Stein solution -/

/-- 2.1 For a `K`-Lipschitz test function `h`, the Stein solution is bounded by `K`. -/
theorem abs_steinSolution_le (h : ℝ → ℝ) (K : ℝ≥0) (hh : LipschitzWith K h) (w : ℝ) :
    |steinSolution h w| ≤ K := by
  sorry

/-- 2.1 For a `K`-Lipschitz test function `h`, the derivative of the Stein solution is bounded by
`√(2/π) K`. -/
theorem abs_deriv_steinSolution_le (h : ℝ → ℝ) (K : ℝ≥0) (hh : LipschitzWith K h) (w : ℝ) :
    |deriv (steinSolution h) w| ≤ √(2 / Real.pi) * K := by
  sorry

/-- 2.1 For a `K`-Lipschitz test function `h`, the derivative of the Stein solution is
`2K`-Lipschitz. -/
theorem lipschitzWith_deriv_steinSolution (h : ℝ → ℝ) (K : ℝ≥0) (hh : LipschitzWith K h) :
    LipschitzWith (2 * K) (deriv (steinSolution h)) := by
  sorry

/-- 2.2 Daly's bound for smooth test functions. If `h` is `k + 1` times differentiable (each
`iteratedDeriv m h` with `m ≤ k` is differentiable) and its `(k+1)`-st derivative takes values in
`[a, b]`, then the `(k+2)`-nd derivative of the Stein solution is bounded by `b - a`. -/
theorem abs_iteratedDeriv_steinSolution_le (h : ℝ → ℝ) (k : ℕ)
    (hh : ∀ m ≤ k, Differentiable ℝ (iteratedDeriv m h))
    (a b : ℝ) (hab : ∀ x, a ≤ iteratedDeriv (k + 1) h x ∧ iteratedDeriv (k + 1) h x ≤ b)
    (w : ℝ) :
    |iteratedDeriv (k + 2) (steinSolution h) w| ≤ b - a := by
  sorry

/-! ## Layer 3: the Wasserstein distance through the Stein class -/

/-- 3.1 The Stein class: differentiable functions `f` with `|f| ≤ 1`, `|f'| ≤ √(2/π)` and `f'`
`2`-Lipschitz. By 2.1 it contains the Stein solution of every `1`-Lipschitz test function. -/
def steinClass : Set (ℝ → ℝ) :=
  {f | Differentiable ℝ f ∧ (∀ x, |f x| ≤ 1) ∧ (∀ x, |deriv f x| ≤ √(2 / Real.pi)) ∧
    LipschitzWith 2 (deriv f)}

/-- 3.1 The Wasserstein distance from the standard normal law is at most the largest value of
`|∫ (f'(x) - x f(x)) dμ(x)|` over the Stein class, for every probability measure `μ` on `ℝ`. -/
theorem wassersteinEDist_le_iSup_steinClass (μ : Measure ℝ) [IsProbabilityMeasure μ] :
    TauCeti.wassersteinEDist 1 μ (gaussianReal 0 1) ≤
      ⨆ f ∈ steinClass, ENNReal.ofReal |∫ x, (deriv f x - x * f x) ∂μ| := by
  sorry

/-! ## Layer 4: sums of independent and of locally dependent variables -/

section Sums

variable {Ω : Type*} [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
  {ι : Type*} [Fintype ι]

/-- 4.1 The Wasserstein bound for sums of independent centred variables with finite third
moments. If `X i` are independent, centred, with `∑ E[X i ²] = 1`, then the law of `∑ X i` is
within `2 ∑ E[X i ²] E|X i| + ∑ E|X i|³` of the standard normal law; in particular within
`3 ∑ E|X i|³`. -/
theorem wassersteinEDist_map_sum_le (X : ι → Ω → ℝ) (hind : iIndepFun X P)
    (h3 : ∀ i, MemLp (X i) 3 P) (h0 : ∀ i, ∫ ω, X i ω ∂P = 0)
    (h1 : ∑ i, ∫ ω, X i ω ^ 2 ∂P = 1) :
    TauCeti.wassersteinEDist 1 (P.map fun ω => ∑ i, X i ω) (gaussianReal 0 1) ≤
      ENNReal.ofReal (2 * ∑ i, (∫ ω, X i ω ^ 2 ∂P) * ∫ ω, |X i ω| ∂P +
        ∑ i, ∫ ω, |X i ω| ^ 3 ∂P) := by
  sorry

/-- 4.2 The Wasserstein bound under dependency neighbourhoods. Let `X i` be centred with finite
fourth moments, and let each `X i` be independent of the family `(X j)_{j ∉ N i}`. Let
`σ² = Var(∑ X i) > 0`. Then the law of `(∑ X i)/σ` is within
`σ⁻³ ∑ᵢ E[|X i| (∑_{j ∈ N i} X j)²] + √(2/π) σ⁻² √(Var(∑ᵢ X i ∑_{j ∈ N i} X j))` of the standard
normal law. -/
theorem wassersteinEDist_map_sum_le_of_dependencyNeighbourhoods (X : ι → Ω → ℝ)
    (N : ι → Finset ι)
    (hind : ∀ i, IndepFun (X i) (fun ω (j : {j // j ∉ N i}) => X j ω) P)
    (h4 : ∀ i, MemLp (X i) 4 P) (h0 : ∀ i, ∫ ω, X i ω ∂P = 0) (σ : ℝ) (hσ : 0 < σ)
    (hvar : variance (fun ω => ∑ i, X i ω) P = σ ^ 2) :
    TauCeti.wassersteinEDist 1 (P.map fun ω => (∑ i, X i ω) / σ) (gaussianReal 0 1) ≤
      ENNReal.ofReal ((σ ^ 3)⁻¹ * ∑ i, ∫ ω, |X i ω| * (∑ j ∈ N i, X j ω) ^ 2 ∂P +
        √(2 / Real.pi) * (σ ^ 2)⁻¹ *
          √(variance (fun ω => ∑ i, X i ω * ∑ j ∈ N i, X j ω) P)) := by
  sorry

end Sums

end TauCetiRoadmap.SteinsMethodForNormalApproximation

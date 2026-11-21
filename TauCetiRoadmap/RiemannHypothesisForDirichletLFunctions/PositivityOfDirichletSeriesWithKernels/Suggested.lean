import Mathlib

/-!
# Positivity of Dirichlet series with kernels: target signatures

This file is not the roadmap. The definitive document for this folder is `README.md`. This file
states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti. The five listed
below are statable with Mathlib alone, and are stated; the sixth, the non-archimedean
stationary-phase formula 8.2 (d), is not statable at the pins (see the end of this docstring).

The one-sided Laplace transform of ArithmeticDirichletSeriesPartII §0.1 (the predicate
`HasLaplace`) is not in Mathlib or Tau Ceti at the pins. The statements below write it out: for a
measurable `g : ℝ → ℝ`, "the transform of `g` converges at `s` with value `Φ s`" is the
conjunction of the integrability of `u ↦ exp(−su)·g(u)` on `(0, ∞)` and the value of its integral
there, which is the definition of that predicate with the default measure. Poles, their orders
and leading coefficients are Mathlib's `meromorphicOrderAt` and `meromorphicTrailingCoeffAt`; a
pole of `Φ` is a point `ρ` with `meromorphicOrderAt Φ ρ < 0`.

* Landau's theorem for a function bounded above (6.4 (c)): `rightmost_pole_real_of_le`.
* The windowed Landau theorem (6.8): `windowedLandau`.
* Its Mellin form with windows of scales (6.9 (a), (b)): the predicate `HasWindows` and
  `windowedLandau_mellin`.
* Laplace's method in several variables with a uniform majorant (7.1 (a), (c), (d)):
  `tendsto_integral_of_laplaceMethod`.
* Stationary phase at a nondegenerate critical point on `ℂ^n` (8.1 (c)):
  `stationaryPhase_leadingTerm`.

The classical theorem 6.3, the positive-coefficient form 6.4 (b), the Dirichlet-series form
6.9 (c) and the agreement 6.10 are statable too; they are steps to the headlines or special cases
of them and are not stated here. Neither is the Gaussian integral 7.1 (b), a step of 7.1. In
Layer 8 the complex Gaussian integrals 8.1 (a), the non-stationary bound 8.1 (b), the critical data
of the phase `Σ x_k + D/∏ x_k` 8.1 (d), and the lattice Gaussian integrals, the Morse lemma and the
vanishing away from the critical points 8.2 (a)–(c) are the steps and computations around the two
stationary-phase formulas and are not stated here. The stationary-phase formula 8.2 (d) over a
finite product of finite extensions of the fields `ℚ_p` is not statable at the pins: its
coefficients are Weil indices of quadratic forms over local fields (MetaplecticAutomorphicForms
§2.1), which neither Mathlib nor Tau Ceti has.
-/

namespace TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.PositivityOfDirichletSeriesWithKernels

universe u

open MeasureTheory Filter Topology

/-! ## Layer 6: Landau's theorem for Laplace transforms, classical and windowed -/

/-- **Landau's theorem for a function bounded above** (6.4 (c)). Let `θ < A`, let `g : ℝ → ℝ` be
measurable with transform `Φ s = ∫₀^∞ g(u) e^(−su) du`, absolutely convergent, for `Re s > A`,
and let `Φ` be meromorphic on `Re s > θ`. If `g(u) ≤ C e^(θu)` for almost every `u ≥ u₀`, then
either `Φ` has no pole in `Re s > θ` and the transform of `g` converges absolutely on `Re s > θ`,
or `Φ` has a real pole `β > θ` with negative real leading coefficient, every pole of `Φ` in
`Re s > θ` has real part at most `β`, and the transform converges absolutely on `Re s > β`. The
two alternatives exclude each other. -/
theorem rightmost_pole_real_of_le {θ A C u₀ : ℝ} (hθA : θ < A) {g : ℝ → ℝ} (hg : Measurable g)
    {Φ : ℂ → ℂ} (hΦ : MeromorphicOn Φ {s : ℂ | θ < s.re})
    (hlap : ∀ s : ℂ, A < s.re →
      Integrable (fun u : ℝ ↦ Complex.exp (-s * u) * g u) (volume.restrict (Set.Ioi 0)) ∧
        ∫ u in Set.Ioi (0 : ℝ), Complex.exp (-s * u) * g u = Φ s)
    (hbound : ∀ᵐ u ∂volume, u₀ ≤ u → g u ≤ C * Real.exp (θ * u)) :
    ((∀ ρ : ℂ, θ < ρ.re → ¬ meromorphicOrderAt Φ ρ < 0) ∧
        ∀ s : ℂ, θ < s.re →
          Integrable (fun u : ℝ ↦ Complex.exp (-s * u) * g u) (volume.restrict (Set.Ioi 0))) ∨
      ∃ β : ℝ, θ < β ∧ meromorphicOrderAt Φ β < 0 ∧
        (∀ ρ : ℂ, θ < ρ.re → meromorphicOrderAt Φ ρ < 0 → ρ.re ≤ β) ∧
        (∃ c : ℝ, c < 0 ∧ meromorphicTrailingCoeffAt Φ β = c) ∧
        ∀ s : ℂ, β < s.re →
          Integrable (fun u : ℝ ↦ Complex.exp (-s * u) * g u) (volume.restrict (Set.Ioi 0)) := by
  sorry

/-- **The windowed Landau theorem** (6.8). Let `θ < A` and `δ > 0`, let `g : ℝ → ℝ` be measurable
with transform `Φ s = ∫₀^∞ g(u) e^(−su) du`, absolutely convergent, for `Re s > A`, and let `Φ` be
meromorphic on `Re s > θ`. Suppose that for every `η > 0` there are arbitrarily large `U` with
`∫_U^((1+δ)U) max(g, 0)(u) e^(−θu) du ≤ e^(ηU)`. Then either `Φ` has no pole in `Re s > θ`, or
`Φ` has a real pole `β > θ` whose leading coefficient is a negative real number, and every pole
of `Φ` in `Re s > θ` has real part at most `β`. -/
theorem windowedLandau {θ A δ : ℝ} (hθA : θ < A) (hδ : 0 < δ) {g : ℝ → ℝ} (hg : Measurable g)
    {Φ : ℂ → ℂ} (hΦ : MeromorphicOn Φ {s : ℂ | θ < s.re})
    (hlap : ∀ s : ℂ, A < s.re →
      Integrable (fun u : ℝ ↦ Complex.exp (-s * u) * g u) (volume.restrict (Set.Ioi 0)) ∧
        ∫ u in Set.Ioi (0 : ℝ), Complex.exp (-s * u) * g u = Φ s)
    (hwin : ∀ η : ℝ, 0 < η → ∀ U₀ : ℝ, ∃ U ≥ U₀,
      ∫ u in U..(1 + δ) * U, max (g u) 0 * Real.exp (-(θ * u)) ≤ Real.exp (η * U)) :
    (∀ ρ : ℂ, θ < ρ.re → ¬ meromorphicOrderAt Φ ρ < 0) ∨
      ∃ β : ℝ, θ < β ∧ meromorphicOrderAt Φ β < 0 ∧
        (∀ ρ : ℂ, θ < ρ.re → meromorphicOrderAt Φ ρ < 0 → ρ.re ≤ β) ∧
        ∃ c : ℝ, c < 0 ∧ meromorphicTrailingCoeffAt Φ β = c := by
  sorry

/-- **Windows of scales** (6.9 (a)). For `S ⊆ ℝ` and an exponent `κ > 1` (written `λ` in the
README), `HasWindows S κ` says that for every `Y₀` there is `Y ≥ max(Y₀, 1)` with
`[Y, Y^κ] ⊆ S`. -/
def HasWindows (S : Set ℝ) (κ : ℝ) : Prop :=
  ∀ Y₀ : ℝ, ∃ Y ≥ max Y₀ 1, Set.Icc Y (Y ^ κ) ⊆ S

/-- **The windowed Landau theorem, Mellin form** (6.9 (b)). Let `θ < A` and `κ > 1`, let
`G : ℝ → ℝ` be measurable with `∫₁^∞ |G(y)| y^(−σ−1) dy < ∞` for every real `σ > A`, and let `Ψ`
be meromorphic on `Re s > θ` with `Ψ(s) = ∫₁^∞ G(y) y^(−s−1) dy` for `Re s > A`. If the set
`{y ≥ 1 | G(y) ≤ C y^θ}` has windows of exponent `κ`, then either `Ψ` has no pole in `Re s > θ`,
or `Ψ` has a real pole `β > θ` whose leading coefficient is a negative real number, and every
pole of `Ψ` in `Re s > θ` has real part at most `β`. -/
theorem windowedLandau_mellin {θ A C κ : ℝ} (hθA : θ < A) (hκ : 1 < κ) {G : ℝ → ℝ}
    (hG : Measurable G)
    (hint : ∀ σ : ℝ, A < σ → IntegrableOn (fun y : ℝ ↦ G y * y ^ (-σ - 1)) (Set.Ioi 1))
    {Ψ : ℂ → ℂ} (hΨ : MeromorphicOn Ψ {s : ℂ | θ < s.re})
    (hΨeq : ∀ s : ℂ, A < s.re →
      ∫ y in Set.Ioi (1 : ℝ), (G y : ℂ) * (y : ℂ) ^ (-s - 1) = Ψ s)
    (hwin : HasWindows {y : ℝ | 1 ≤ y ∧ G y ≤ C * y ^ θ} κ) :
    (∀ ρ : ℂ, θ < ρ.re → ¬ meromorphicOrderAt Ψ ρ < 0) ∨
      ∃ β : ℝ, θ < β ∧ meromorphicOrderAt Ψ β < 0 ∧
        (∀ ρ : ℂ, θ < ρ.re → meromorphicOrderAt Ψ ρ < 0 → ρ.re ≤ β) ∧
        ∃ c : ℝ, c < 0 ∧ meromorphicTrailingCoeffAt Ψ β = c := by
  sorry

/-! ## Layer 7: Laplace's method in several variables -/

/-- **Laplace's method in several variables with a uniform majorant** (7.1 (a), (c), (d)). Let
`E` be a finite-dimensional real normed space of dimension `n` with a Haar measure `μ`, let
`B : E × E → ℂ` be real-bilinear, let `c, γ > 0`, and let `(f_t)_{t ∈ ℕ}` be complex functions on
`E`, almost everywhere strongly measurable for all large `t`. If `f_t(v/√t) → e^(−B(v,v))` as
`t → ∞` for every `v`, and `|f_t(v)| ≤ (1 + c‖v‖²)^(−γt)` for every `v` and all large `t`, then
`Re B(v, v) > 0` for every `v ≠ 0`; `f_t` is integrable for all large `t` and
`t^(n/2) ∫ f_t dμ → ∫ e^(−B(v,v)) dμ(v)`; and `∫ f_t dμ ≠ 0` for all large `t`. -/
theorem tendsto_integral_of_laplaceMethod {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [FiniteDimensional ℝ E] [MeasurableSpace E] [BorelSpace E] (μ : Measure E)
    [μ.IsAddHaarMeasure] (B : E →ₗ[ℝ] E →ₗ[ℝ] ℂ) {c γ : ℝ} (hc : 0 < c) (hγ : 0 < γ)
    {f : ℕ → E → ℂ} (hf : ∀ᶠ t in atTop, AEStronglyMeasurable (f t) μ)
    (hlim : ∀ v : E,
      Tendsto (fun t : ℕ ↦ f t ((Real.sqrt t)⁻¹ • v)) atTop (𝓝 (Complex.exp (-B v v))))
    (hmaj : ∀ᶠ t in atTop, ∀ v : E, ‖f t v‖ ≤ (1 + c * ‖v‖ ^ 2) ^ (-(γ * t))) :
    (∀ v : E, v ≠ 0 → 0 < (B v v).re) ∧
      (∀ᶠ t in atTop, Integrable (f t) μ) ∧
      Tendsto (fun t : ℕ ↦ (((t : ℝ) ^ ((Module.finrank ℝ E : ℝ) / 2) : ℝ) : ℂ) * ∫ v, f t v ∂μ)
        atTop (𝓝 (∫ v, Complex.exp (-B v v) ∂μ)) ∧
      ∀ᶠ t in atTop, ∫ v, f t v ∂μ ≠ 0 := by
  sorry

/-! ## Layer 8: Stationary phase over `ℂ^n` and over non-archimedean rings -/

/-- **Stationary phase at a nondegenerate critical point on `ℂ^n`** (8.1 (c); the case `k = n + 1`
of Hörmander, *The Analysis of Linear Partial Differential Operators I*, Theorem 7.7.5, in the
`2n` real coordinates). Let `β ≠ 0` and `r, Λ > 0`. There is a constant `C` such that the
following holds for every `x₀ ∈ ℂ^n` and every `g` holomorphic on the polydisc `B(x₀, 2r)` with
`|g| ≤ Λ` there, `∇g(x₀) = 0` and `‖x − x₀‖ ≤ Λ ‖∇g(x)‖` on the closed polydisc `B̄(x₀, r)`
(sup norms, `∇g = (∂g/∂x_k)_k`), and for every complex Banach space `V` and every `a : ℂ^n → V`
of class `C^(2n+2)`, zero outside `B̄(x₀, r)`, with `‖D^j a(x)‖ ≤ S` for `j ≤ 2n + 2` and all
`x`. The Hessian `H = (∂²g/∂x_i∂x_j (x₀))` has `det H ≠ 0` and, for every `t ≠ 0`,
`‖∫ ψ_β(g(x)/t) a(x) dμ_β^n(x) − ψ_β(g(x₀)/t) (|t|^n/|det H|) a(x₀)‖ ≤ C S |t|^(n+1)`, where
`ψ_β(w) = exp(i Re(βw))` and `μ_β^n` is `(|β|/2π)^n` times Lebesgue measure on `ℂ^n = ℝ^(2n)`. -/
theorem stationaryPhase_leadingTerm (n : ℕ) {β : ℂ} (hβ : β ≠ 0) {r Λ : ℝ} (hr : 0 < r)
    (hΛ : 0 < Λ) :
    ∃ C : ℝ, ∀ (x₀ : Fin n → ℂ) (g : (Fin n → ℂ) → ℂ),
      DifferentiableOn ℂ g (Metric.ball x₀ (2 * r)) →
      (∀ x ∈ Metric.ball x₀ (2 * r), ‖g x‖ ≤ Λ) →
      fderiv ℂ g x₀ = 0 →
      (∀ x ∈ Metric.closedBall x₀ r,
        ‖x - x₀‖ ≤ Λ * ‖fun k : Fin n ↦ fderiv ℂ g x (Pi.single k 1)‖) →
      ∀ (V : Type u) [NormedAddCommGroup V] [NormedSpace ℂ V] [CompleteSpace V]
        (a : (Fin n → ℂ) → V) (S : ℝ),
        ContDiff ℝ (2 * n + 2) a →
        (∀ x, x ∉ Metric.closedBall x₀ r → a x = 0) →
        (∀ j ≤ 2 * n + 2, ∀ x, ‖iteratedFDeriv ℝ j a x‖ ≤ S) →
        (Matrix.of fun i j : Fin n ↦
            iteratedFDeriv ℂ 2 g x₀ ![Pi.single i 1, Pi.single j 1]).det ≠ 0 ∧
        ∀ t : ℂ, t ≠ 0 →
          ‖((‖β‖ / (2 * Real.pi)) ^ n : ℝ) •
                (∫ x, Complex.exp (Complex.I * ((β * (g x / t)).re : ℂ)) • a x) -
              (Complex.exp (Complex.I * ((β * (g x₀ / t)).re : ℂ)) *
                ((‖t‖ ^ n / ‖(Matrix.of fun i j : Fin n ↦
                    iteratedFDeriv ℂ 2 g x₀ ![Pi.single i 1, Pi.single j 1]).det‖ : ℝ) : ℂ)) •
                a x₀‖ ≤ C * S * ‖t‖ ^ (n + 1) := by
  sorry

end TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.PositivityOfDirichletSeriesWithKernels

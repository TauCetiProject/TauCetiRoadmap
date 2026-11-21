import Mathlib

/-!
# Positivity of Dirichlet series with kernels: target signatures

This file is not the roadmap. The definitive document for this folder is `README.md`. This file
states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti. The six listed
below are statable with Mathlib alone, and are stated.

The one-sided Laplace transform of ArithmeticDirichletSeriesPartII §0.1 (the predicate
`HasLaplace`) is not in Mathlib or Tau Ceti at the pins. The statements below write it out: for a
measurable `g : ℝ → ℝ`, "the transform of `g` converges at `s` with value `Φ s`" is the
conjunction of the integrability of `u ↦ exp(−su)·g(u)` on `(0, ∞)` and the value of its integral
there, which is the definition of that predicate with the default measure. Poles, their orders
and leading coefficients are Mathlib's `meromorphicOrderAt` and `meromorphicTrailingCoeffAt`; a
pole of `Φ` is a point `ρ` with `meromorphicOrderAt Φ ρ < 0`.

* Landau's theorem for a function bounded above (6.4 (c)): `rightmost_pole_real_of_le`.
* The windowed Landau theorem (6.8): `windowedLandau_simplePole` (the form of the formal proof)
  and `windowedLandau` (the extension).
* Its Mellin form with windows of scales (6.9 (a), (b)): the predicate `HasWindows`,
  `windowedLandau_mellin_simplePole` (the form of the formal proof) and `windowedLandau_mellin`
  (the extension).
* Laplace's method in several variables with a uniform majorant (7.1 (a), (c), (d)):
  `tendsto_integral_of_laplaceMethod`.
* Stationary phase at a nondegenerate critical point on `ℂ^n` (8.1 (c)):
  `stationaryPhase_leadingTerm`.
* Stationary phase for `Σ x_k + D/∏ x_k` over a finite product of finite extensions of the fields
  `ℚ_p` (8.2 (d)): `stationaryPhase_nonarchimedean`. The product is `∀ i, F i` with each `F i` a
  nonarchimedean local field (Mathlib's `IsNonarchimedeanLocalField`) of characteristic zero, and
  the Haar measure is Mathlib's, normalised by `μ(𝔒) = 1`. The Gauss factor of 8.2 (a) and the
  module do not appear: by 8.2 (a), for small `t` the term of a critical point `z` is the Gaussian
  integral over `𝔒^m` of the phase `½ ξᵀH_m(zt)ξ`, which is how the statement writes it.

The classical theorem 6.3, the positive-coefficient form 6.4 (b), the Dirichlet-series form
6.9 (c) and the agreement 6.10 are statable too; they are steps to the headlines or special cases
of them and are not stated here. Neither is the Gaussian integral 7.1 (b), a step of 7.1. In
Layer 8 the complex Gaussian integrals 8.1 (a), the non-stationary bound 8.1 (b), the critical data
of the phase `Σ x_k + D/∏ x_k` 8.1 (d), and the lattice Gaussian integrals, the Morse lemma and the
vanishing away from the critical points 8.2 (a)–(c) are the steps and computations around the two
stationary-phase formulas and are not stated here.
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

/-- **The windowed Landau theorem, form of the formal proof** (6.8). Let `0 < θ < 1` and
`δ > 0`, let `g : ℝ → ℝ` be measurable with `|g(u)| ≤ C₀ e^(2u)` for `u ≥ 0`, and let `Φ` be
meromorphic on `Re s > 0` with `Φ s = ∫₀^∞ g(u) e^(−su) du` for `Re s > 2`, with simple poles only
in `Re s > 0` and a positive real residue at every real pole there. Suppose that for every
`η > 0` there are arbitrarily large `U` with `∫_U^((1+δ)U) max(g, 0)(u) e^(−θu) du ≤ e^(ηU)`.
Then `Φ` has no pole in `Re s > θ`.
This is the statement of the formal proof. For `θ < 2` it is the case `A = 2` of `windowedLandau`
(restrict `Φ` to `Re s > θ`; a real pole `β > θ` with negative leading coefficient contradicts the
positivity at `β`); for `θ ≥ 2` no pole lies in `Re s > θ`, where `Φ` is the transform. So
`θ < 1`, the bound `|g(u)| ≤ C₀ e^(2u)` (the integrability being part of the transform hypothesis)
and the simplicity of the poles are not needed for the conclusion.
See [FormalProof],
`Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/landauWindow.lean`
(`Deduction.landau_window`),
`Development/AutomorphicArithmetic/DedekindLFunctions/LandauZeroFreeCriterion.lean`
(`Deduction.PoleData`),
`Development/AutomorphicArithmetic/DedekindLFunctions/LandauZeroFreeCriterion.lean`
(`Deduction.WindowHypU`).
 -/
theorem windowedLandau_simplePole {θ δ : ℝ} (hθ : 0 < θ) (hθ1 : θ < 1) (hδ : 0 < δ) {g : ℝ → ℝ}
    (hg : Measurable g) (hgrowth : ∃ C₀ : ℝ, ∀ u : ℝ, 0 ≤ u → |g u| ≤ C₀ * Real.exp (2 * u))
    {Φ : ℂ → ℂ} (hΦ : MeromorphicOn Φ {s : ℂ | 0 < s.re})
    (hlap : ∀ s : ℂ, 2 < s.re →
      Integrable (fun u : ℝ ↦ Complex.exp (-s * u) * g u) (volume.restrict (Set.Ioi 0)) ∧
        ∫ u in Set.Ioi (0 : ℝ), Complex.exp (-s * u) * g u = Φ s)
    (hsimple : ∀ ρ : ℂ, 0 < ρ.re → meromorphicOrderAt Φ ρ < 0 →
      meromorphicOrderAt Φ ρ = ((-1 : ℤ) : WithTop ℤ))
    (hres : ∀ β : ℝ, 0 < β → meromorphicOrderAt Φ β < 0 →
      ∃ c : ℝ, 0 < c ∧ meromorphicTrailingCoeffAt Φ β = c)
    (hwin : ∀ η : ℝ, 0 < η → ∀ U₀ : ℝ, ∃ U ≥ U₀,
      ∫ u in U..(1 + δ) * U, max (g u) 0 * Real.exp (-(θ * u)) ≤ Real.exp (η * U)) :
    ∀ ρ : ℂ, θ < ρ.re → ¬ meromorphicOrderAt Φ ρ < 0 := by
  sorry

/-- **The windowed Landau theorem** (6.8). Let `θ < A` and `δ > 0`, let `g : ℝ → ℝ` be measurable
with transform `Φ s = ∫₀^∞ g(u) e^(−su) du`, absolutely convergent, for `Re s > A`, and let `Φ` be
meromorphic on `Re s > θ`. Suppose that for every `η > 0` there are arbitrarily large `U` with
`∫_U^((1+δ)U) max(g, 0)(u) e^(−θu) du ≤ e^(ηU)`. Then either `Φ` has no pole in `Re s > θ`, or
`Φ` has a real pole `β > θ` whose leading coefficient is a negative real number, and every pole
of `Φ` in `Re s > θ` has real part at most `β`.
This is the roadmap's extension of `windowedLandau_simplePole`, not a statement of the formal
proof. -/
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
`[Y, Y^κ] ⊆ S`. This is [FormalProof],
`Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/Window.lean`
(`Formalism.HC.HasWindows`). -/
def HasWindows (S : Set ℝ) (κ : ℝ) : Prop :=
  ∀ Y₀ : ℝ, ∃ Y ≥ max Y₀ 1, Set.Icc Y (Y ^ κ) ⊆ S

/-- **The windowed Landau theorem, Mellin form, form of the formal proof** (6.9 (b)). Let
`0 < θ < 1` and `κ > 1`, let `G : ℝ → ℝ` be measurable with `|G(y)| ≤ C₀ y²` for `y ≥ 1`, and let
`Ψ` be meromorphic on `Re s > 0` with `Ψ(s) = ∫₁^∞ G(y) y^(−s−1) dy` for `Re s > 2`, with simple
poles only in `Re s > 0` and a positive real residue at every real pole there. If the set
`{y ≥ 1 | G(y) ≤ C y^θ}` has windows of exponent `κ`, then `Ψ` has no pole in `Re s > θ`.
This is the statement of the formal proof. For `θ < 2` it is the case `A = 2` of
`windowedLandau_mellin`, whose integrability hypothesis the bound `|G(y)| ≤ C₀ y²` gives; for
`θ ≥ 2` no pole lies in `Re s > θ`, where `Ψ` is the absolutely convergent transform. So `θ < 1`
and the simplicity of the poles are not needed for the conclusion.
See [FormalProof],
`Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/landauWindow.lean`
(`Deduction.landau_window`),
`Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/poleData.lean`
(`Deduction.poleData_change`),
`Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/lemmaL.lean`
(`Deduction.lemmaL`).
 -/
theorem windowedLandau_mellin_simplePole {θ C κ : ℝ} (hθ : 0 < θ) (hθ1 : θ < 1) (hκ : 1 < κ)
    {G : ℝ → ℝ} (hG : Measurable G) (hgrowth : ∃ C₀ : ℝ, ∀ y : ℝ, 1 ≤ y → |G y| ≤ C₀ * y ^ 2)
    {Ψ : ℂ → ℂ} (hΨ : MeromorphicOn Ψ {s : ℂ | 0 < s.re})
    (hΨeq : ∀ s : ℂ, 2 < s.re →
      ∫ y in Set.Ioi (1 : ℝ), (G y : ℂ) * (y : ℂ) ^ (-s - 1) = Ψ s)
    (hsimple : ∀ ρ : ℂ, 0 < ρ.re → meromorphicOrderAt Ψ ρ < 0 →
      meromorphicOrderAt Ψ ρ = ((-1 : ℤ) : WithTop ℤ))
    (hres : ∀ β : ℝ, 0 < β → meromorphicOrderAt Ψ β < 0 →
      ∃ c : ℝ, 0 < c ∧ meromorphicTrailingCoeffAt Ψ β = c)
    (hwin : HasWindows {y : ℝ | 1 ≤ y ∧ G y ≤ C * y ^ θ} κ) :
    ∀ ρ : ℂ, θ < ρ.re → ¬ meromorphicOrderAt Ψ ρ < 0 := by
  sorry

/-- **The windowed Landau theorem, Mellin form** (6.9 (b)). Let `θ < A` and `κ > 1`, let
`G : ℝ → ℝ` be measurable with `∫₁^∞ |G(y)| y^(−σ−1) dy < ∞` for every real `σ > A`, and let `Ψ`
be meromorphic on `Re s > θ` with `Ψ(s) = ∫₁^∞ G(y) y^(−s−1) dy` for `Re s > A`. If the set
`{y ≥ 1 | G(y) ≤ C y^θ}` has windows of exponent `κ`, then either `Ψ` has no pole in `Re s > θ`,
or `Ψ` has a real pole `β > θ` whose leading coefficient is a negative real number, and every
pole of `Ψ` in `Re s > θ` has real part at most `β`.
This is the roadmap's extension of `windowedLandau_mellin_simplePole`, not a statement of the
formal proof. -/
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
`t → ∞` for every `v`, and `|f_t(v)| ≤ (1 + c‖v‖²)^(−γt)` for all large `t`, uniformly in `v`, then
`Re B(v, v) > 0` for every `v ≠ 0`; `f_t` is integrable for all large `t` and
`t^(n/2) ∫ f_t dμ → ∫ e^(−B(v,v)) dμ(v)`; and `∫ f_t dμ ≠ 0` for all large `t`.
It follows from [FormalProof],
`ReciprocityTheory/ReductiveGroups/DiscreteSeries/LaplaceOperators/
LaplaceFoundations/RaisingLoweringNormIdentities.lean`
(`ReciprocityTheory.ChartRestriction.DS.Lap.Base.GaussianLimitHaar`). -/
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
`ψ_β(w) = exp(i Re(βw))` and `μ_β^n` is `(|β|/2π)^n` times Lebesgue measure on `ℂ^n = ℝ^(2n)`.
It follows from [FormalProof], `Formalism/HermitianCurvature/StatementG.lean`
(`Formalism.FourierDecayAlt.G.StationaryPhase`),
`Formalism/HermitianCurvature/HermitianCurvatureProofs/StationaryPhaseModel.lean`
(`Formalism.FourierDecayAlt.P.stationary_phase_holomorphic`). -/
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

/-- **Stationary phase for `Σ x_k + D/∏ x_k` over a non-archimedean ring** (8.2 (d)). Let
`K = ∏_i F_i` be a finite product of nonarchimedean local fields of characteristic zero (finite
extensions of fields `ℚ_p`), `𝔒 ⊂ K` a compact open subring, `ψ : K → S¹` an additive character
with `{a ∈ K | ψ(a𝔒) = 1} = 𝔒`, and `μ` the Haar measure on `K` with `μ(𝔒) = 1`. Let `m ≥ 1`, let
`L₀`, `Λ₁` be lattices (compact open subgroups of `K`) and `Q ⊂ K^×` compact. There is a
neighbourhood `V` of `0` such that for every unit `t ∈ V`, every `D ∈ Q` and every `A : K^m → ℂ`
that vanishes unless every `x_k` is a unit with `x_k, x_k⁻¹ ∈ L₀` and is invariant under
translation by `Λ₁^m`,
`∫_{K^m} A(x) ψ((Σ_k x_k + D/∏_k x_k)/t) dx = Σ_{z^(m+1) = D} ψ((m + 1)z/t) A(z, …, z) I(zt)`,
where `I(a) = ∫_{𝔒^m} ψ(½ ξᵀH_m(a)ξ) dξ` and `½ ξᵀH_m(a)ξ = a⁻¹(Σ_k ξ_k² + (Σ_k ξ_k)²)/2`. By
8.2 (a), `𝔒` being admissible for `H_m(zt)` once `t` is small, `I(zt)` is
`γ(zt) |m + 1|^(−1/2) |z|^(m/2) |t|^(m/2)`, the Gauss-factor term of the README. -/
theorem stationaryPhase_nonarchimedean {ι : Type*} [Fintype ι] {F : ι → Type*}
    [∀ i, Field (F i)] [∀ i, ValuativeRel (F i)] [∀ i, TopologicalSpace (F i)]
    [∀ i, IsNonarchimedeanLocalField (F i)] [∀ i, CharZero (F i)]
    [MeasurableSpace (∀ i, F i)] [BorelSpace (∀ i, F i)]
    (𝔒 : Subring (∀ i, F i)) (h𝔒c : IsCompact (𝔒 : Set (∀ i, F i)))
    (h𝔒o : IsOpen (𝔒 : Set (∀ i, F i)))
    (ψ : AddChar (∀ i, F i) Circle) (hψ : ∀ a, (∀ x ∈ 𝔒, ψ (a * x) = 1) ↔ a ∈ 𝔒)
    (μ : Measure (∀ i, F i)) [μ.IsAddHaarMeasure] (hμ : μ (𝔒 : Set (∀ i, F i)) = 1)
    {m : ℕ} (hm : 1 ≤ m) (L₀ Λ₁ : AddSubgroup (∀ i, F i))
    (hL₀c : IsCompact (L₀ : Set (∀ i, F i))) (hL₀o : IsOpen (L₀ : Set (∀ i, F i)))
    (hΛ₁c : IsCompact (Λ₁ : Set (∀ i, F i))) (hΛ₁o : IsOpen (Λ₁ : Set (∀ i, F i)))
    {Q : Set (∀ i, F i)} (hQ : IsCompact Q) (hQu : ∀ D ∈ Q, IsUnit D) :
    ∃ V ∈ 𝓝 (0 : ∀ i, F i), ∀ t ∈ V, IsUnit t → ∀ D ∈ Q,
      ∀ A : (Fin m → ∀ i, F i) → ℂ,
        (∀ x, A x ≠ 0 → ∀ k, IsUnit (x k) ∧ x k ∈ L₀ ∧ (x k)⁻¹ ∈ L₀) →
        (∀ x y, (∀ k, y k ∈ Λ₁) → A (x + y) = A x) →
        ∫ x, A x * (ψ ((∑ k, x k + D * (∏ k, x k)⁻¹) * t⁻¹) : ℂ) ∂(Measure.pi fun _ ↦ μ) =
          ∑ᶠ z ∈ {z : ∀ i, F i | z ^ (m + 1) = D},
            (ψ (((m : ∀ i, F i) + 1) * z * t⁻¹) : ℂ) * A (fun _ ↦ z) *
              ∫ ξ in Set.univ.pi fun _ : Fin m ↦ (𝔒 : Set (∀ i, F i)),
                (ψ (2⁻¹ * (z * t)⁻¹ * (∑ k, ξ k ^ 2 + (∑ k, ξ k) ^ 2)) : ℂ)
                  ∂(Measure.pi fun _ ↦ μ) := by
  sorry

end TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.PositivityOfDirichletSeriesWithKernels

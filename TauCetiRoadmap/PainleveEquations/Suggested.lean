import Mathlib

/-!
# Painlevé equations: target signatures

The roadmap is `README.md`. This file states its scalar headline theorems against the
pinned library APIs. Their proofs are roadmap work.

The construction of the isomonodromic connection (§2.4) and the dimension theorem (§1.5)
require moduli of decorated meromorphic connections and analytic algebraic spaces.
Relative RH properness (§4.4) and geometric continuation (§4.6) also require the Betti
families and their transports. The comparison of initial-condition spaces (§5.2) requires
relative Okamoto–Painlevé pairs and compactifications. The tau theorems (§§6.1–6.5)
require holomorphic Fredholm determinant line bundles and their canonical sections.

The scalar targets use the DLMF normalization of §7.2. For PVI the holomorphic universal
cover is an input. Its construction, for instance via the modular lambda function,
requires an additional interface.
-/

namespace TauCetiRoadmap.PainleveEquations

open Set

/-- A holomorphic PI solution on a disk extends meromorphically to the time plane. -/
theorem painleveI_meromorphic_extension {q : ℂ → ℂ} {t₀ : ℂ} {r : ℝ}
    (hr : 0 < r) (hq : AnalyticOnNhd ℂ q (Metric.ball t₀ r))
    (hODE : ∀ t ∈ Metric.ball t₀ r, deriv (deriv q) t = 6 * q t ^ 2 + t) :
    ∃ f : ℂ → ℂ, MeromorphicOn f univ ∧ EqOn f q (Metric.ball t₀ r) := by
  sorry

/-- A holomorphic PII solution on a disk extends meromorphically to the time plane. -/
theorem painleveII_meromorphic_extension {α : ℂ} {q : ℂ → ℂ} {t₀ : ℂ} {r : ℝ}
    (hr : 0 < r) (hq : AnalyticOnNhd ℂ q (Metric.ball t₀ r))
    (hODE : ∀ t ∈ Metric.ball t₀ r, deriv (deriv q) t = 2 * q t ^ 3 + t * q t + α) :
    ∃ f : ℂ → ℂ, MeromorphicOn f univ ∧ EqOn f q (Metric.ball t₀ r) := by
  sorry

/-- A PIII solution of one of the primitive types extends on the logarithmic time plane. -/
theorem painleveIII_meromorphic_extension {α β γ δ : ℂ} {q : ℂ → ℂ}
    {t₀ s₀ : ℂ} {r : ℝ} (hr : 0 < r) (hlift : Complex.exp s₀ = t₀)
    (hprimitive : γ * δ ≠ 0 ∨ (γ = 0 ∧ α * δ ≠ 0) ∨
      (δ = 0 ∧ β * γ ≠ 0) ∨ (γ = 0 ∧ δ = 0 ∧ α * β ≠ 0))
    (hq : AnalyticOnNhd ℂ q (Metric.ball t₀ r))
    (hdom : ∀ t ∈ Metric.ball t₀ r, t ≠ 0 ∧ q t ≠ 0)
    (hODE : ∀ t ∈ Metric.ball t₀ r,
      deriv (deriv q) t = (deriv q t) ^ 2 / q t - deriv q t / t +
        (α * q t ^ 2 + β) / t + γ * q t ^ 3 + δ / q t) :
    ∃ f : ℂ → ℂ, MeromorphicOn f univ ∧
      f =ᶠ[nhds s₀] q ∘ Complex.exp := by
  sorry

/-- A holomorphic PIV solution in its scalar chart extends to the time plane. -/
theorem painleveIV_meromorphic_extension {α β : ℂ} {q : ℂ → ℂ} {t₀ : ℂ} {r : ℝ}
    (hr : 0 < r) (hq : AnalyticOnNhd ℂ q (Metric.ball t₀ r))
    (hdom : ∀ t ∈ Metric.ball t₀ r, q t ≠ 0)
    (hODE : ∀ t ∈ Metric.ball t₀ r,
      deriv (deriv q) t = (deriv q t) ^ 2 / (2 * q t) + 3 * q t ^ 3 / 2 +
        4 * t * q t ^ 2 + 2 * (t ^ 2 - α) * q t + β / q t) :
    ∃ f : ℂ → ℂ, MeromorphicOn f univ ∧ EqOn f q (Metric.ball t₀ r) := by
  sorry

/-- An ordinary or degenerate PV solution extends on the logarithmic time plane. -/
theorem painleveV_meromorphic_extension {α β γ δ : ℂ} {q : ℂ → ℂ}
    {t₀ s₀ : ℂ} {r : ℝ} (hr : 0 < r) (hlift : Complex.exp s₀ = t₀)
    (hprimitive : δ ≠ 0 ∨ γ ≠ 0)
    (hq : AnalyticOnNhd ℂ q (Metric.ball t₀ r))
    (hdom : ∀ t ∈ Metric.ball t₀ r, t ≠ 0 ∧ q t ≠ 0 ∧ q t ≠ 1)
    (hODE : ∀ t ∈ Metric.ball t₀ r,
      deriv (deriv q) t = (1 / (2 * q t) + 1 / (q t - 1)) * (deriv q t) ^ 2 -
        deriv q t / t + (q t - 1) ^ 2 * (α * q t + β / q t) / t ^ 2 +
        γ * q t / t + δ * q t * (q t + 1) / (q t - 1)) :
    ∃ f : ℂ → ℂ, MeromorphicOn f univ ∧
      f =ᶠ[nhds s₀] q ∘ Complex.exp := by
  sorry

/-- A PVI solution extends meromorphically on a supplied holomorphic universal cover. -/
theorem painleveVI_meromorphic_extension {α β γ δ : ℂ} {q p : ℂ → ℂ}
    {t₀ s₀ : ℂ} {r : ℝ} (hr : 0 < r)
    (hcover : IsCoveringMapOn p ({0, 1}ᶜ : Set ℂ))
    (hsimple : IsSimplyConnected (p ⁻¹' ({0, 1}ᶜ : Set ℂ)))
    (hp : AnalyticOnNhd ℂ p (p ⁻¹' ({0, 1}ᶜ : Set ℂ)))
    (hregular : ∀ s ∈ p ⁻¹' ({0, 1}ᶜ : Set ℂ), deriv p s ≠ 0)
    (hlift : p s₀ = t₀)
    (hq : AnalyticOnNhd ℂ q (Metric.ball t₀ r))
    (hdom : ∀ t ∈ Metric.ball t₀ r, t ≠ 0 ∧ t ≠ 1 ∧ q t ≠ 0 ∧ q t ≠ 1 ∧ q t ≠ t)
    (hODE : ∀ t ∈ Metric.ball t₀ r,
      deriv (deriv q) t =
        (1 / q t + 1 / (q t - 1) + 1 / (q t - t)) * (deriv q t) ^ 2 / 2 -
        (1 / t + 1 / (t - 1) + 1 / (q t - t)) * deriv q t +
        q t * (q t - 1) * (q t - t) *
          (α + β * t / (q t) ^ 2 + γ * (t - 1) / (q t - 1) ^ 2 +
            δ * t * (t - 1) / (q t - t) ^ 2) / (t ^ 2 * (t - 1) ^ 2)) :
    ∃ f : ℂ → ℂ, MeromorphicOn f (p ⁻¹' ({0, 1}ᶜ : Set ℂ)) ∧
      f =ᶠ[nhds s₀] q ∘ p := by
  sorry

end TauCetiRoadmap.PainleveEquations

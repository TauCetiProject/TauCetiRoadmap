import Mathlib
import TauCeti.MeasureTheory.OptimalTransport.Wasserstein.Basic

/-!
# Functional inequalities for strongly log-concave laws: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here: the integrability of `exp (-V)` for a strongly convex
`V` (1.1), the passage from the logarithmic Sobolev to the Poincaré inequality (1.2), Talagrand's
transport inequality for strongly log-concave laws (2.1), the HWI inequality (2.2), the
Bakry–Émery logarithmic Sobolev inequality (2.3), the Otto–Villani theorem (3.1), the entropy
dissipation identity along a classical solution of the Fokker–Planck equation (4.1) and the
exponential decay of the relative entropy along it (4.2). The Poincaré inequality with constant
`1 / κ` for a strongly log-concave law (2.4) is the theorem of 1.2 applied to that of 2.3 and is
not stated separately.

Laws are probability measures on `EuclideanSpace ℝ (Fin d)`. The law `π ∝ exp (-V)` is Mathlib's
tilted measure `volume.tilted (-V)`. The logarithmic Sobolev and Poincaré inequalities are the
definitions of RandomMatrices 2.2 (logarithmic Sobolev and Poincaré inequalities), in its
normalisation `Ent_μ(f²) ≤ 2 C ∫ ‖∇f‖² dμ`; RandomMatrices states them in prose without a class of
test functions and has no Lean definition, so they are written out here with the class of the
README's Conventions: the continuously differentiable functions that are bounded with a bounded
gradient. The Wasserstein distance is Tau Ceti's `TauCeti.wassersteinEDist 2` and the relative
entropy is Mathlib's `InformationTheory.klDiv`, both in `[0, ∞]`.
-/

noncomputable section

open MeasureTheory ProbabilityTheory InformationTheory Real Set Laplacian
open scoped ENNReal NNReal Gradient RealInnerProductSpace

namespace TauCetiRoadmap.LogConcaveFunctionalInequalities

variable {d : ℕ}

local notation "E" => EuclideanSpace ℝ (Fin d)

/-! ## Layer 1: Gibbs laws, the two inequalities and relative Fisher information -/

/-- 1.1 The Gibbs law `Z⁻¹ exp (-V) dx` of a potential `V`, with `Z = ∫ exp (-V) dx`: Mathlib's
tilted measure `volume.tilted (-V)`. It is a probability measure when `exp (-V)` is integrable
and the zero measure otherwise. -/
def gibbsMeasure (V : E → ℝ) : Measure E :=
  (volume : Measure E).tilted fun x ↦ -V x

/-- 1.1 A `κ`-strongly convex potential with `κ > 0` has an integrable `exp (-V)`, so its Gibbs
law is a probability measure. -/
theorem integrable_exp_neg_of_strongConvexOn {V : E → ℝ} {κ : ℝ} (hκ : 0 < κ)
    (hV : StrongConvexOn univ κ V) : Integrable (fun x ↦ Real.exp (-V x)) := by
  sorry

/-- 1.2 The logarithmic Sobolev inequality with constant `C`, the definition of RandomMatrices 2.2
written out with an explicit class of test functions: `Ent_μ(f²) ≤ 2 C ∫ ‖∇f‖² dμ`, where
`Ent_μ(g) = ∫ g log g dμ - (∫ g dμ) log (∫ g dμ)`, for every continuously differentiable `f` that
is bounded and has a bounded gradient. -/
def LogSobolevInequality (μ : Measure E) (C : ℝ) : Prop :=
  ∀ f : E → ℝ, ContDiff ℝ 1 f → (∃ M, ∀ x, |f x| ≤ M) → (∃ M, ∀ x, ‖∇ f x‖ ≤ M) →
    ∫ x, f x ^ 2 * Real.log (f x ^ 2) ∂μ -
        (∫ x, f x ^ 2 ∂μ) * Real.log (∫ x, f x ^ 2 ∂μ) ≤
      2 * C * ∫ x, ‖∇ f x‖ ^ 2 ∂μ

/-- 1.2 The Poincaré inequality with constant `C`, the definition of RandomMatrices 2.2 written out
with an explicit class of test functions: `Var_μ(f) ≤ C ∫ ‖∇f‖² dμ` for every continuously
differentiable `f` that is bounded and has a bounded gradient. -/
def PoincareInequality (μ : Measure E) (C : ℝ) : Prop :=
  ∀ f : E → ℝ, ContDiff ℝ 1 f → (∃ M, ∀ x, |f x| ≤ M) → (∃ M, ∀ x, ‖∇ f x‖ ≤ M) →
    variance f μ ≤ C * ∫ x, ‖∇ f x‖ ^ 2 ∂μ

/-- 1.2 A probability measure satisfying the logarithmic Sobolev inequality with constant `C`
satisfies the Poincaré inequality with the same constant (linearisation at `f = 1 + ε g`). -/
theorem LogSobolevInequality.poincareInequality {μ : Measure E} [IsProbabilityMeasure μ]
    {C : ℝ} (h : LogSobolevInequality μ C) : PoincareInequality μ C := by
  sorry

/-- 1.3 The relative Fisher information `I(h μ ‖ μ) = ∫ ‖∇h‖² / h dμ` of the law with density
`h` against `μ`, in `[0, ∞]`; it is meant for positive differentiable `h`. -/
def relativeFisherInformation (μ : Measure E) (h : E → ℝ) : ℝ≥0∞ :=
  ∫⁻ x, ENNReal.ofReal (‖∇ h x‖ ^ 2 / h x) ∂μ

/-! ## Layer 2: displacement convexity and the Bakry–Émery inequalities -/

/-- 2.1 Talagrand's transport inequality for a strongly log-concave law: if `V` is `κ`-strongly
convex with `κ > 0`, every probability measure `ν` satisfies
`W₂(ν, π)² ≤ (2 / κ) KL(ν ‖ π)` in `[0, ∞]`, where `π ∝ exp (-V)`. -/
theorem wassersteinEDist_sq_le_klDiv_gibbsMeasure {V : E → ℝ} {κ : ℝ} (hκ : 0 < κ)
    (hV : StrongConvexOn univ κ V) (ν : Measure E) [IsProbabilityMeasure ν] :
    TauCeti.wassersteinEDist 2 ν (gibbsMeasure V) ^ 2 ≤
      ENNReal.ofReal (2 / κ) * klDiv ν (gibbsMeasure V) := by
  sorry

/-- 2.2 The HWI inequality: let `V` be twice continuously differentiable and `κ`-strongly
convex for a real `κ` (possibly zero or negative), with `exp (-V)` integrable and its Gibbs law
`π` of finite second moment. For every nonnegative, twice continuously differentiable, compactly
supported `f` with `∫ f dπ = 1` and `ν = f π`,
`KL(ν ‖ π) ≤ W₂(ν, π) √I(ν ‖ π) - (κ / 2) W₂(ν, π)²`; all three quantities are finite. -/
theorem klDiv_le_hwi {V : E → ℝ} {κ : ℝ} (hV : ContDiff ℝ 2 V) (hκ : StrongConvexOn univ κ V)
    (hZ : Integrable (fun x ↦ Real.exp (-V x)))
    (hmom : Integrable (fun x ↦ ‖x‖ ^ 2) (gibbsMeasure V)) {f : E → ℝ} (hf : ContDiff ℝ 2 f)
    (hfc : HasCompactSupport f) (hf0 : ∀ x, 0 ≤ f x) (hf1 : ∫ x, f x ∂gibbsMeasure V = 1) :
    (klDiv ((gibbsMeasure V).withDensity fun x ↦ ENNReal.ofReal (f x)) (gibbsMeasure V)).toReal ≤
      (TauCeti.wassersteinEDist 2 ((gibbsMeasure V).withDensity fun x ↦ ENNReal.ofReal (f x))
          (gibbsMeasure V)).toReal *
          √(relativeFisherInformation (gibbsMeasure V) f).toReal -
        κ / 2 * (TauCeti.wassersteinEDist 2
          ((gibbsMeasure V).withDensity fun x ↦ ENNReal.ofReal (f x))
          (gibbsMeasure V)).toReal ^ 2 := by
  sorry

/-- 2.3 The Bakry–Émery criterion: if `V` is `κ`-strongly convex with `κ > 0`, the law
`π ∝ exp (-V)` satisfies the logarithmic Sobolev inequality with constant `1 / κ`. -/
theorem logSobolevInequality_gibbsMeasure {V : E → ℝ} {κ : ℝ} (hκ : 0 < κ)
    (hV : StrongConvexOn univ κ V) : LogSobolevInequality (gibbsMeasure V) (1 / κ) := by
  sorry

/-! ## Layer 3: from the logarithmic Sobolev inequality to transport -/

/-- 3.1 The Otto–Villani theorem: a probability measure `μ` satisfying the logarithmic Sobolev
inequality with a constant `C > 0` satisfies `W₂(ν, μ)² ≤ 2 C KL(ν ‖ μ)` in `[0, ∞]` for every
probability measure `ν`. -/
theorem wassersteinEDist_sq_le_klDiv_of_logSobolevInequality {μ : Measure E}
    [IsProbabilityMeasure μ] {C : ℝ} (hC : 0 < C) (h : LogSobolevInequality μ C)
    (ν : Measure E) [IsProbabilityMeasure ν] :
    TauCeti.wassersteinEDist 2 ν μ ^ 2 ≤ ENNReal.ofReal (2 * C) * klDiv ν μ := by
  sorry

/-! ## Layer 4: relative entropy along the Fokker–Planck equation -/

/-- 4.1 A classical solution, on an open set of times `I`, of the Fokker–Planck equation for the
potential `V`, written for the density `h t` of the law at time `t` against `π ∝ exp (-V)`:
`∂ₜ h = Δh - ⟪∇V, ∇h⟫`, with `h` jointly twice continuously differentiable and positive, each
`h t π` a probability measure, and the integrability conditions under which the relative entropy
may be differentiated under the integral and integrated by parts; the domination is required near
each time, not uniformly on `I`. -/
structure IsClassicalFokkerPlanckFlow (V : E → ℝ) (h : ℝ → E → ℝ) (I : Set ℝ) : Prop where
  isOpen : IsOpen I
  contDiffOn : ContDiffOn ℝ 2 (Function.uncurry h) (I ×ˢ univ)
  pos : ∀ t ∈ I, ∀ x, 0 < h t x
  integral_eq_one : ∀ t ∈ I, ∫ x, h t x ∂gibbsMeasure V = 1
  hasDerivAt : ∀ t ∈ I, ∀ x,
    HasDerivAt (fun s ↦ h s x) (Δ (h t) x - ⟪∇ V x, ∇ (h t) x⟫) t
  integrable_mul_log : ∀ t ∈ I,
    Integrable (fun x ↦ h t x * Real.log (h t x)) (gibbsMeasure V)
  integrable_flux : ∀ t ∈ I,
    Integrable (fun x ↦ ‖∇ (h t) x‖ * |Real.log (h t x) + 1|) (gibbsMeasure V)
  integrable_fisher : ∀ t ∈ I,
    Integrable (fun x ↦ ‖∇ (h t) x‖ ^ 2 / h t x) (gibbsMeasure V)
  dominated : ∀ t ∈ I, ∃ g : E → ℝ, Integrable g (gibbsMeasure V) ∧ ∀ᶠ s in nhds t, ∀ x,
    |(Δ (h s) x - ⟪∇ V x, ∇ (h s) x⟫) * (Real.log (h s x) + 1)| ≤ g x

/-- 4.1 Entropy dissipation: along a classical solution of the Fokker–Planck equation for a
continuously differentiable potential, `t ↦ KL(h t π ‖ π)` is differentiable on `I` with
derivative `-I(h t π ‖ π)`. -/
theorem hasDerivAt_klDiv_of_isClassicalFokkerPlanckFlow {V : E → ℝ} (hV : ContDiff ℝ 1 V)
    {h : ℝ → E → ℝ} {I : Set ℝ} (hh : IsClassicalFokkerPlanckFlow V h I) {t : ℝ} (ht : t ∈ I) :
    HasDerivAt
      (fun s ↦ (klDiv ((gibbsMeasure V).withDensity fun x ↦ ENNReal.ofReal (h s x))
        (gibbsMeasure V)).toReal)
      (-(relativeFisherInformation (gibbsMeasure V) (h t)).toReal) t := by
  sorry

/-- 4.2 Exponential decay of the relative entropy: if `V` is continuously differentiable and
`κ`-strongly convex with `κ > 0`, then along a classical solution of the Fokker–Planck equation
on `(0, ∞)`, `KL(h t π ‖ π) ≤ exp (-2 κ (t - s)) KL(h s π ‖ π)` for `0 < s ≤ t`. -/
theorem klDiv_le_exp_mul_klDiv_of_isClassicalFokkerPlanckFlow {V : E → ℝ} {κ : ℝ}
    (hV : ContDiff ℝ 1 V) (hκ : 0 < κ) (hVκ : StrongConvexOn univ κ V) {h : ℝ → E → ℝ}
    (hh : IsClassicalFokkerPlanckFlow V h (Ioi 0)) {s t : ℝ} (hs : 0 < s) (hst : s ≤ t) :
    klDiv ((gibbsMeasure V).withDensity fun x ↦ ENNReal.ofReal (h t x)) (gibbsMeasure V) ≤
      ENNReal.ofReal (Real.exp (-2 * κ * (t - s))) *
        klDiv ((gibbsMeasure V).withDensity fun x ↦ ENNReal.ofReal (h s x)) (gibbsMeasure V) := by
  sorry

end TauCetiRoadmap.LogConcaveFunctionalInequalities

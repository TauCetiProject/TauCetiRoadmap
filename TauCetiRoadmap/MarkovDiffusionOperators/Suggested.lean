module

public import Mathlib
import all TauCetiRoadmap.GaussianIsoperimetryAndClusters.Suggested

/-!
# Markov diffusion operators: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
This file prototypes the diffusion triple of Layer 1, the fundamental identity of §1.2, the
iterated carré du champ and its integrated identity on the test algebra (Layer 4), and the
Poincaré inequality of a triple (Layer 7), the Bobkov inequality of a triple and the
Gaussian isoperimetric inequalities of Gibbs measures (Layer 10), each with `sorry`. Full
triples, the extended algebra and the curvature-dimension condition, which is defined on
`A₀` and extended to the extended algebra on full triples, are specified in `README.md`,
Layer 4; the local Bobkov inequalities,
which need the semigroup, are specified in `README.md`, Layer 10.
-/
open MeasureTheory Filter
open scoped ENNReal NNReal Topology
open TauCetiRoadmap.GaussianIsoperimetryAndClusters (gaussianIsoperimetricProfile)

namespace TauCeti.MarkovDiffusionOperators

variable {E : Type*} [MeasurableSpace E]

/-- First partial derivative `∂ᵢψ(z)` of `ψ : ℝᵏ → ℝ` (junk value `0` where `ψ` is not
differentiable). Used in the diffusion property. -/
noncomputable def pderiv {k : ℕ} (ψ : (Fin k → ℝ) → ℝ) (i : Fin k) (z : Fin k → ℝ) : ℝ :=
  fderiv ℝ ψ z (Pi.single i 1)

/-- Exhaustion sequence (BGL Def. 3.1.1): an a.e. increasing sequence in `A₀` tending a.e.
to `1`. It gives a meaning to the constant `1` when `μ` is infinite (Def. 3.1.12). -/
def IsExhaustion (μ : Measure E) (A₀ : NonUnitalSubalgebra ℝ (E → ℝ)) (u : ℕ → E → ℝ) :
    Prop :=
  (∀ n, u n ∈ A₀) ∧ (∀ n, u n ≤ᵐ[μ] u (n + 1)) ∧
    ∀ᵐ x ∂μ, Tendsto (fun n => u n x) atTop (𝓝 1)

/-- Good measure (BGL §1.14, D1): the σ-algebra is countably generated up to `μ`-null sets. -/
def IsGoodMeasure (μ : Measure E) : Prop :=
  ∃ 𝒢 : Set (Set E), 𝒢.Countable ∧ (∀ s ∈ 𝒢, MeasurableSet s) ∧
    ∀ s, MeasurableSet s → ∃ t, MeasurableSet[MeasurableSpace.generateFrom 𝒢] t ∧
      μ (symmDiff s t) = 0

/-- A diffusion Markov triple (BGL Defs. 3.1.1, 3.1.3, 3.1.8; hypotheses D1–D8 of §3.4.1).
`Γ` and `L` are total functions, constrained only on the test algebra `A₀`; equalities between
functions are `μ`-a.e., membership statements are literal. The fundamental identity, the chain
rule for `L`, the linearity of `L` and the `L²` continuity D4 are theorems, not fields. -/
structure DiffusionTriple (E : Type*) [MeasurableSpace E] where
  μ : Measure E
  /-- D1. -/
  sigmaFinite : SigmaFinite μ
  /-- D1: a finite reference measure is normalized. -/
  finite_prob : IsFiniteMeasure μ → IsProbabilityMeasure μ
  /-- D1. -/
  good : IsGoodMeasure μ
  /-- D2: the non-unital test algebra. -/
  A₀ : NonUnitalSubalgebra ℝ (E → ℝ)
  measurable : ∀ f ∈ A₀, Measurable f
  bounded : ∀ f ∈ A₀, ∃ C : ℝ, ∀ x, |f x| ≤ C
  memLp : ∀ f ∈ A₀, ∀ p : ℝ≥0∞, 1 ≤ p → p ≠ ∞ → MemLp f p μ
  /-- D2: density in every `Lᵖ(μ)`, `1 ≤ p < ∞`. -/
  dense : ∀ p : ℝ≥0∞, ∀ _ : Fact (1 ≤ p), p ≠ ∞ →
    Dense {u : Lp ℝ p μ | ∃ f ∈ A₀, (u : E → ℝ) =ᵐ[μ] f}
  /-- D2: stability under smooth `ψ : ℝᵏ → ℝ` with `ψ 0 = 0`. -/
  comp_mem : ∀ (k : ℕ) (ψ : (Fin k → ℝ) → ℝ), ContDiff ℝ (⊤ : ℕ∞) ψ → ψ 0 = 0 →
    ∀ f : Fin k → (E → ℝ), (∀ i, f i ∈ A₀) → (fun x => ψ (fun i => f i x)) ∈ A₀
  /-- Def. 3.1.1. -/
  exhaustion : ∃ u : ℕ → E → ℝ, IsExhaustion μ A₀ u
  Γ : (E → ℝ) → (E → ℝ) → (E → ℝ)
  L : (E → ℝ) → (E → ℝ)
  /-- D3. -/
  Γ_mem : ∀ f ∈ A₀, ∀ g ∈ A₀, Γ f g ∈ A₀
  /-- D6. -/
  L_mem : ∀ f ∈ A₀, L f ∈ A₀
  /-- D3: symmetric bilinear, nonnegative. -/
  Γ_symm : ∀ f ∈ A₀, ∀ g ∈ A₀, Γ f g =ᵐ[μ] Γ g f
  Γ_add : ∀ f ∈ A₀, ∀ f' ∈ A₀, ∀ g ∈ A₀, Γ (f + f') g =ᵐ[μ] Γ f g + Γ f' g
  Γ_smul : ∀ (c : ℝ), ∀ f ∈ A₀, ∀ g ∈ A₀, Γ (c • f) g =ᵐ[μ] c • Γ f g
  Γ_nonneg : ∀ f ∈ A₀, 0 ≤ᵐ[μ] Γ f f
  /-- D3: the diffusion property (3.1.2): `Γ(ψ(f₁,…,f_k), g) = Σᵢ ∂ᵢψ(f) Γ(fᵢ, g)`. -/
  diffusion : ∀ (k : ℕ) (ψ : (Fin k → ℝ) → ℝ), ContDiff ℝ (⊤ : ℕ∞) ψ → ψ 0 = 0 →
    ∀ f : Fin k → (E → ℝ), (∀ i, f i ∈ A₀) → ∀ g ∈ A₀,
      Γ (fun x => ψ (fun i => f i x)) g =ᵐ[μ]
        fun x => ∑ i, pderiv ψ i (fun j => f j x) * Γ (f i) g x
  /-- D5: integration by parts, defining `L` on `A₀`. -/
  ibp : ∀ f ∈ A₀, ∀ g ∈ A₀, ∫ x, g x * L f x ∂μ = -∫ x, Γ f g x ∂μ
  /-- D8: invariance. -/
  integral_L : ∀ f ∈ A₀, ∫ x, L f x ∂μ = 0

namespace DiffusionTriple

attribute [instance] DiffusionTriple.sigmaFinite

/-- The fundamental identity (BGL (3.1.1)/(3.1.6)), polarized, on the test algebra.
Proof: the defect `F` lies in `A₀`; `ibp`, the diffusion property and `Γ_symm` give
`∫ h F = 0` for `h ∈ A₀`, and `h = F` gives `F = 0` a.e. The density field is not needed. -/
theorem fundamentalIdentity (T : DiffusionTriple E) {f g : E → ℝ}
    (hf : f ∈ T.A₀) (hg : g ∈ T.A₀) :
    T.L (f * g) =ᵐ[T.μ] f * T.L g + g * T.L f + (2 : ℝ) • T.Γ f g := by
  sorry

/-- Iterated carré du champ `Γ₂(f,g) = ½ (L Γ(f,g) − Γ(f, Lg) − Γ(Lf, g))` (BGL Def. 3.3.12).
Meaningful on `A₀` (stable under `Γ` and `L`); on a full triple the specification uses the
extended algebra `A` and its carré du champ. -/
noncomputable def gammaTwo (T : DiffusionTriple E) (f g : E → ℝ) : E → ℝ :=
  fun x => (T.L (T.Γ f g) x - T.Γ f (T.L g) x - T.Γ (T.L f) g x) / 2

/-- Integrated `Γ₂` identity on the test algebra (BGL (3.3.8)):
`∫ Γ₂(f) dμ = ∫ (Lf)² dμ`. All integrands lie in `A₀`, hence are integrable; D8 kills
`∫ L Γ(f)` and `ibp` turns `∫ Γ(f, Lf)` into `−∫ (Lf)²`. -/
theorem integral_gammaTwo (T : DiffusionTriple E) {f : E → ℝ} (hf : f ∈ T.A₀) :
    ∫ x, T.gammaTwo f f x ∂T.μ = ∫ x, T.L f x * T.L f x ∂T.μ := by
  sorry

/-- Poincaré inequality `P(C)` on the test algebra (BGL Def. 4.2.1). Elements of `A₀` are
bounded and in every `Lᵖ`, so no integrability side conditions are needed; the extension to
the Dirichlet domain is a theorem (density of `A₀` in the form domain). As in Tau Ceti's
`MeasureTheory.Measure.PoincareInequality`, `C` carries no sign condition. -/
def PI (T : DiffusionTriple E) (C : ℝ) : Prop :=
  IsProbabilityMeasure T.μ ∧
    ∀ f ∈ T.A₀, ProbabilityTheory.variance f T.μ ≤ C * ∫ x, T.Γ f f x ∂T.μ

/-- Bobkov inequality on the test algebra (BGL (8.5.9)), with constant `ρ > 0` and `I` the
Gaussian isoperimetric profile `gaussianIsoperimetricProfile` of GaussianIsoperimetryAndClusters §1.1:
`√ρ I(∫ f dμ) ≤ ∫ √(ρ I(f)² + Γ(f)) dμ` for `f ∈ A₀` with values in `[0, 1]`. Under `CD(ρ, ∞)`
with `ρ > 0`, a full triple with probability measure satisfies it (BGL Cor. 8.5.4). The
condition `0 < ρ` is part of the predicate: for `ρ ≤ 0`, `Real.sqrt ρ = 0` would make it
trivially true. -/
def Bobkov (T : DiffusionTriple E) (ρ : ℝ) : Prop :=
  0 < ρ ∧ IsProbabilityMeasure T.μ ∧
    ∀ f ∈ T.A₀, (∀ x, f x ∈ Set.Icc (0 : ℝ) 1) →
      Real.sqrt ρ * gaussianIsoperimetricProfile (∫ x, f x ∂T.μ) ≤
        ∫ x, Real.sqrt (ρ * gaussianIsoperimetricProfile (f x) ^ 2 +
          T.Γ f f x) ∂T.μ

end DiffusionTriple

/-! ### Gaussian isoperimetry for Gibbs measures (Layer 10) -/

section Gibbs

variable {d : ℕ}

/-- The Gibbs probability measure `μ_V = e^{−V} dx / Z` on `ℝᵈ` (Layer 9). It is a probability
measure when `e^{−V}` is integrable; otherwise the Bochner integral is `0`, its inverse is `∞`,
and the value is meaningless, so every statement about it assumes integrability. -/
noncomputable def gibbsMeasure (V : EuclideanSpace ℝ (Fin d) → ℝ) :
    Measure (EuclideanSpace ℝ (Fin d)) :=
  (ENNReal.ofReal (∫ x, Real.exp (-V x)))⁻¹ •
    volume.withDensity (fun x => ENNReal.ofReal (Real.exp (-V x)))

/-- Functional Bobkov inequality for a uniformly convex Gibbs measure (BGL Cor. 8.5.4 on the
Gibbs triple), for Lipschitz functions with values in `[0, 1]`, the class used in BGL §8.5. Such
`f` are differentiable a.e. (Rademacher, `LipschitzWith.ae_differentiableAt`), the junk value of
`fderiv` lives on a Lebesgue-null, hence `μ_V`-null, set, and `‖fderiv ℝ f x‖ ≤ K`, so the
right side is integrable. -/
theorem gibbs_bobkov (V : EuclideanSpace ℝ (Fin d) → ℝ) (hV : ContDiff ℝ (⊤ : ℕ∞) V)
    (hint : Integrable (fun x => Real.exp (-V x))) {ρ : ℝ} (hρ : 0 < ρ)
    (hconv : ∀ x v, ρ * ‖v‖ ^ 2 ≤ fderiv ℝ (fderiv ℝ V) x v v)
    (f : EuclideanSpace ℝ (Fin d) → ℝ) {K : ℝ≥0} (hf : LipschitzWith K f)
    (hf01 : ∀ x, f x ∈ Set.Icc (0 : ℝ) 1) :
    Real.sqrt ρ * gaussianIsoperimetricProfile (∫ x, f x ∂gibbsMeasure V) ≤
      ∫ x, Real.sqrt (ρ * gaussianIsoperimetricProfile (f x) ^ 2 +
        ‖fderiv ℝ f x‖ ^ 2) ∂gibbsMeasure V := by
  sorry

/-- Minkowski-content form of Gaussian isoperimetry for a uniformly convex Gibbs measure
(BGL (8.5.10)): `μ_V⁺(A) ≥ √ρ I(μ_V(A))`, stated without `liminf` junk values: for every
`c < √ρ I(μ_V(A))`, eventually `μ_V(A_r) − μ_V(A) ≥ c r` as `r ↓ 0`. -/
theorem gibbs_isoperimetric (V : EuclideanSpace ℝ (Fin d) → ℝ) (hV : ContDiff ℝ (⊤ : ℕ∞) V)
    (hint : Integrable (fun x => Real.exp (-V x))) {ρ : ℝ} (hρ : 0 < ρ)
    (hconv : ∀ x v, ρ * ‖v‖ ^ 2 ≤ fderiv ℝ (fderiv ℝ V) x v v)
    {A : Set (EuclideanSpace ℝ (Fin d))} (hA : IsClosed A) {c : ℝ}
    (hc : c < Real.sqrt ρ * gaussianIsoperimetricProfile ((gibbsMeasure V).real A)) :
    ∀ᶠ r in 𝓝[>] (0 : ℝ),
      c * r ≤ (gibbsMeasure V).real (Metric.thickening r A) - (gibbsMeasure V).real A := by
  sorry

/-- Enlargement form of Gaussian isoperimetry for a uniformly convex Gibbs measure
(BGL (8.5.11)), stated through `Φ` to avoid the quantile at `0` and `1`: if `Φ(a) ≤ μ_V(A)`,
then `Φ(a + √ρ r) ≤ μ_V(A_r)` for every `r > 0`. -/
theorem gibbs_enlargement (V : EuclideanSpace ℝ (Fin d) → ℝ) (hV : ContDiff ℝ (⊤ : ℕ∞) V)
    (hint : Integrable (fun x => Real.exp (-V x))) {ρ : ℝ} (hρ : 0 < ρ)
    (hconv : ∀ x v, ρ * ‖v‖ ^ 2 ≤ fderiv ℝ (fderiv ℝ V) x v v)
    {A : Set (EuclideanSpace ℝ (Fin d))} (hA : IsClosed A) {a r : ℝ} (hr : 0 < r)
    (ha : ProbabilityTheory.cdf (ProbabilityTheory.gaussianReal 0 1) a ≤ (gibbsMeasure V).real A) :
    ProbabilityTheory.cdf (ProbabilityTheory.gaussianReal 0 1) (a + Real.sqrt ρ * r) ≤
      (gibbsMeasure V).real (Metric.thickening r A) := by
  sorry

end Gibbs

end TauCeti.MarkovDiffusionOperators

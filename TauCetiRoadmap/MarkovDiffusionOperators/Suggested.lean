module

import Mathlib
import TauCeti.Analysis.Calculus.Morse.Linearization
import TauCeti.Probability.Quantile

/-!
# Markov diffusion operators: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
It is the roadmap's acceptance test: it states, against the pinned Mathlib and Tau Ceti, the
headline theorems that can be stated without the constructions of the roadmap, each with `sorry`,
together with the definitions those statements need.

Stated here:

* Layer 1: the diffusion triple and the fundamental identity (§1.2);
* Layer 4: the iterated carré du champ, its integrated identity, the curvature-dimension condition
  `CD(ρ, n)` on the test algebra and its integrated form;
* Layer 9: the Poincaré and logarithmic Sobolev inequalities with constant `1/ρ` of a Gibbs measure
  with `∇²V ≥ ρ > 0`, on compactly supported smooth functions;
* Layer 10: the Bobkov inequality of a triple implies its logarithmic Sobolev inequality, and the
  Bobkov inequality and the Gaussian isoperimetric inequalities of uniformly convex Gibbs measures;
* Layer 11: the Brascamp–Lieb inequality for Gibbs measures with positive-definite Hessian.

Not stated, because each needs the Markov semigroup of Layer 2 and the full triples of Layers 3–4,
which are constructions of the roadmap: the gradient bounds and mass conservation (Layer 6), the
extension of `Γ₂` and of the Hessian to the generator domain (Layer 5), the Poincaré and
logarithmic Sobolev inequalities of a full triple under `CD(ρ, n)` (Layers 7–8), and the local
Bobkov inequalities and the Bobkov inequality of a full triple (Layer 10). Their Gibbs instances
are stated.
-/
open MeasureTheory Filter
open scoped ENNReal NNReal Topology

namespace TauCetiRoadmap.MarkovDiffusionOperators

/-- The Gaussian isoperimetric profile `I = φ ∘ Φ⁻¹` on `(0, 1)`, and `0` elsewhere, owned by
GaussianIsoperimetryAndClusters §1.1 and implemented in Tau Ceti, after the pinned commit, as
`TauCeti.Probability.gaussianIsoperimetricProfile`, with the same formula. It is restated here
so that this file imports only `TauCeti.Probability.Quantile` for it. -/
noncomputable def gaussianIsoperimetricProfile (v : ℝ) : ℝ :=
  if 0 < v ∧ v < 1 then
    ProbabilityTheory.gaussianPDFReal 0 1 ((ProbabilityTheory.gaussianReal 0 1).quantile v)
  else 0

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

/-- Good measure (BGL §1.14, D1), weakened: the σ-algebra is countably generated up to `μ`-null
sets. BGL's good measure spaces also require the measure-decomposition and bi-measure
theorems; this specification never uses them, so they are dropped. -/
def IsGoodMeasure (μ : Measure E) : Prop :=
  ∃ 𝒢 : Set (Set E), 𝒢.Countable ∧ (∀ s ∈ 𝒢, MeasurableSet s) ∧
    ∀ s, MeasurableSet s → ∃ t, MeasurableSet[MeasurableSpace.generateFrom 𝒢] t ∧
      μ (symmDiff s t) = 0

/-- A diffusion Markov triple (BGL Defs. 3.1.1, 3.1.3, 3.1.8; properties D1–D9 of §3.4.1: the
fields cover D1–D3, D5, D6 and D8, D4 is a theorem, and D7 and D9 are the constructions of
`README.md`, Layer 2).
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
Meaningful on `A₀` (stable under `Γ` and `L`); on a triple with an extended algebra the
specification also uses it on `A`. -/
noncomputable def gammaTwo (T : DiffusionTriple E) (f g : E → ℝ) : E → ℝ :=
  fun x => (T.L (T.Γ f g) x - T.Γ f (T.L g) x - T.Γ (T.L f) g x) / 2

/-- Integrated `Γ₂` identity on the test algebra (BGL (3.3.8)):
`∫ Γ₂(f) dμ = ∫ (Lf)² dμ`. All integrands lie in `A₀`, hence are integrable; D8 kills
`∫ L Γ(f)` and `ibp` turns `∫ Γ(f, Lf)` into `−∫ (Lf)²`. -/
theorem integral_gammaTwo (T : DiffusionTriple E) {f : E → ℝ} (hf : f ∈ T.A₀) :
    ∫ x, T.gammaTwo f f x ∂T.μ = ∫ x, T.L f x * T.L f x ∂T.μ := by
  sorry

/-- Curvature-dimension condition `CD(ρ, n)` on the test algebra (BGL Def. 3.3.14, stated there
on the extended algebra, to which it extends by BGL Remark 3.3.15; `README.md`, Conventions).
The term `(Lf)²/n` is `(n⁻¹).toReal * (Lf)²`, which vanishes for `n = ∞`; `1 ≤ n` is part of
the predicate. -/
def CD (T : DiffusionTriple E) (ρ : ℝ) (n : ℝ≥0∞) : Prop :=
  1 ≤ n ∧ ∀ f ∈ T.A₀,
    (fun x => ρ * T.Γ f f x + (n⁻¹).toReal * T.L f x ^ 2) ≤ᵐ[T.μ] T.gammaTwo f f

/-- Integrated curvature-dimension inequality (`README.md`, Layer 4.2): under `CD(ρ, n)`,
`ρ ℰ(f) + (1/n) ‖Lf‖₂² ≤ ‖Lf‖₂²` for `f ∈ A₀`. Integrate `CD` and use `integral_gammaTwo`; every
integrand lies in `A₀`, hence is integrable. -/
theorem CD.integral_le {T : DiffusionTriple E} {ρ : ℝ} {n : ℝ≥0∞} (h : T.CD ρ n) {f : E → ℝ}
    (hf : f ∈ T.A₀) :
    ρ * ∫ x, T.Γ f f x ∂T.μ + (n⁻¹).toReal * ∫ x, T.L f x ^ 2 ∂T.μ ≤
      ∫ x, T.L f x ^ 2 ∂T.μ := by
  sorry

/-- Logarithmic Sobolev inequality `LS(C)` on the test algebra (BGL Def. 5.1.1):
`Ent_μ(f²) ≤ 2C ℰ(f)` for `f ∈ A₀`, with `Ent_μ(g) = ∫ g log g dμ − (∫ g dμ) log ∫ g dμ`
(Mathlib's `Real.log 0 = 0` gives `0 log 0 = 0`). The extension to the Dirichlet domain is a
theorem (`README.md`, Layer 8). -/
def LogSobolevInequality (T : DiffusionTriple E) (C : ℝ) : Prop :=
  IsProbabilityMeasure T.μ ∧
    ∀ f ∈ T.A₀,
      ∫ x, f x ^ 2 * Real.log (f x ^ 2) ∂T.μ -
          (∫ x, f x ^ 2 ∂T.μ) * Real.log (∫ x, f x ^ 2 ∂T.μ) ≤
        2 * C * ∫ x, T.Γ f f x ∂T.μ

/-- Bobkov inequality on the test algebra (BGL (8.5.9)), with constant `ρ > 0` and `I` the
Gaussian isoperimetric profile `gaussianIsoperimetricProfile`:
`√ρ I(∫ f dμ) ≤ ∫ √(ρ I(f)² + Γ(f)) dμ` for `f ∈ A₀` with values in `[0, 1]`. Under `CD ρ ⊤`
with `ρ > 0`, a full triple with probability measure satisfies it (BGL Cor. 8.5.4; `README.md`,
Layer 10). The condition `0 < ρ` is part of the predicate: for `ρ ≤ 0`, `Real.sqrt ρ = 0` would
make it trivially true. -/
def Bobkov (T : DiffusionTriple E) (ρ : ℝ) : Prop :=
  0 < ρ ∧ IsProbabilityMeasure T.μ ∧
    ∀ f ∈ T.A₀, (∀ x, f x ∈ Set.Icc (0 : ℝ) 1) →
      Real.sqrt ρ * gaussianIsoperimetricProfile (∫ x, f x ∂T.μ) ≤
        ∫ x, Real.sqrt (ρ * gaussianIsoperimetricProfile (f x) ^ 2 +
          T.Γ f f x) ∂T.μ

/-- The Bobkov inequality implies the logarithmic Sobolev inequality with constant `1/ρ`
(BGL §8.5.2; `README.md`, Layer 10): apply it to `ε g²` and let `ε → 0`, with the next-order
asymptotic of `I` at `0`. Only the test algebra is used. -/
theorem Bobkov.logSobolevInequality {T : DiffusionTriple E} {ρ : ℝ} (h : T.Bobkov ρ) :
    T.LogSobolevInequality (1 / ρ) := by
  sorry

end DiffusionTriple

/-! ### Gibbs measures (Layers 9–11) -/

section Gibbs

variable {d : ℕ}

/-- The Gibbs probability measure `μ_V = e^{−V} dx / Z` on `ℝᵈ` (Layer 9), Mathlib's tilted
measure `volume.tilted (−V)`. It is a probability measure when `e^{−V}` is integrable (Mathlib's
`isProbabilityMeasure_tilted`) and `0` otherwise, so every statement about it assumes
integrability. Under `∇²V ≥ ρ > 0` integrability follows from `V(x) ≥ V(0) + ⟨∇V(0), x⟩ +
ρ‖x‖²/2`; the hypothesis `hint` is kept in the uniformly convex statements for uniformity. In
`gibbs_brascampLieb` it is what makes `μ_V` a probability measure and the statement non-trivial:
a positive-definite Hessian does not imply integrability (`V = eˣ`), and without it
`gibbsMeasure V = 0` and the inequality reads `0 ≤ 0`. -/
noncomputable def gibbsMeasure (V : EuclideanSpace ℝ (Fin d) → ℝ) :
    Measure (EuclideanSpace ℝ (Fin d)) :=
  volume.tilted (fun x => -V x)

/-- Bakry–Émery Poincaré inequality `P(1/ρ)` for a Gibbs measure with `∇²V ≥ ρ > 0`
(`README.md`, Layer 9, from Layer 7), on compactly supported smooth functions, the class of
Tau Ceti's `MeasureTheory.Measure.poincareInequality_iff_forall_hasCompactSupport`. -/
theorem gibbs_poincare (V : EuclideanSpace ℝ (Fin d) → ℝ) (hV : ContDiff ℝ (⊤ : ℕ∞) V)
    (hint : Integrable (fun x => Real.exp (-V x))) {ρ : ℝ} (hρ : 0 < ρ)
    (hconv : ∀ x v, ρ * ‖v‖ ^ 2 ≤ fderiv ℝ (fderiv ℝ V) x v v)
    (f : EuclideanSpace ℝ (Fin d) → ℝ) (hf : ContDiff ℝ (⊤ : ℕ∞) f) (hfc : HasCompactSupport f) :
    ProbabilityTheory.variance f (gibbsMeasure V) ≤
      (1 / ρ) * ∫ x, ‖fderiv ℝ f x‖ ^ 2 ∂gibbsMeasure V := by
  sorry

/-- Bakry–Émery logarithmic Sobolev inequality `LS(1/ρ)` for a Gibbs measure with
`∇²V ≥ ρ > 0` (`README.md`, Layer 9, from Layer 8), on compactly supported smooth functions. -/
theorem gibbs_logSobolev (V : EuclideanSpace ℝ (Fin d) → ℝ) (hV : ContDiff ℝ (⊤ : ℕ∞) V)
    (hint : Integrable (fun x => Real.exp (-V x))) {ρ : ℝ} (hρ : 0 < ρ)
    (hconv : ∀ x v, ρ * ‖v‖ ^ 2 ≤ fderiv ℝ (fderiv ℝ V) x v v)
    (f : EuclideanSpace ℝ (Fin d) → ℝ) (hf : ContDiff ℝ (⊤ : ℕ∞) f) (hfc : HasCompactSupport f) :
    ∫ x, f x ^ 2 * Real.log (f x ^ 2) ∂gibbsMeasure V -
        (∫ x, f x ^ 2 ∂gibbsMeasure V) * Real.log (∫ x, f x ^ 2 ∂gibbsMeasure V) ≤
      2 * (1 / ρ) * ∫ x, ‖fderiv ℝ f x‖ ^ 2 ∂gibbsMeasure V := by
  sorry

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
    {A : Set (EuclideanSpace ℝ (Fin d))} {c : ℝ}
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
    {A : Set (EuclideanSpace ℝ (Fin d))} {a r : ℝ} (hr : 0 < r)
    (ha : ProbabilityTheory.cdf (ProbabilityTheory.gaussianReal 0 1) a ≤ (gibbsMeasure V).real A) :
    ProbabilityTheory.cdf (ProbabilityTheory.gaussianReal 0 1) (a + Real.sqrt ρ * r) ≤
      (gibbsMeasure V).real (Metric.thickening r A) := by
  sorry

/-- The inverse Hessian `(∇²V(x))⁻¹` of `V` at `x`, as an operator on `ℝᵈ`: Tau Ceti's Hessian
operator (the derivative of the gradient, `TauCeti.fderiv_gradient`), inverted
(`ContinuousLinearMap.inverse`, junk `0` when not invertible, which `hpos` excludes). -/
noncomputable def invHessian (V : EuclideanSpace ℝ (Fin d) → ℝ) (x : EuclideanSpace ℝ (Fin d)) :
    EuclideanSpace ℝ (Fin d) →L[ℝ] EuclideanSpace ℝ (Fin d) :=
  (TauCeti.hessianOperator V x).inverse

/-- Brascamp–Lieb inequality (BGL Thm 4.9.1; Brascamp–Lieb 1976, Theorem 4.1; `README.md`,
Layer 11): for smooth `V` with positive-definite Hessian and `e^{−V}` integrable, and smooth `f`
with `f, ‖∇f‖ ∈ L²(μ_V)`, `Var_{μ_V}(f) ≤ ∫ ⟨(∇²V)⁻¹ ∇f, ∇f⟩ dμ_V`. The right side may be
infinite, so it is a lower integral in `ℝ≥0∞`. -/
theorem gibbs_brascampLieb (V : EuclideanSpace ℝ (Fin d) → ℝ) (hV : ContDiff ℝ (⊤ : ℕ∞) V)
    (hint : Integrable (fun x => Real.exp (-V x)))
    (hpos : ∀ x v, v ≠ 0 → 0 < fderiv ℝ (fderiv ℝ V) x v v)
    (f : EuclideanSpace ℝ (Fin d) → ℝ) (hf : ContDiff ℝ (⊤ : ℕ∞) f)
    (hf2 : MemLp f 2 (gibbsMeasure V))
    (hdf2 : MemLp (fun x => ‖fderiv ℝ f x‖) 2 (gibbsMeasure V)) :
    ENNReal.ofReal (ProbabilityTheory.variance f (gibbsMeasure V)) ≤
      ∫⁻ x, ENNReal.ofReal (fderiv ℝ f x (invHessian V x (gradient f x))) ∂gibbsMeasure V := by
  sorry

end Gibbs

end TauCetiRoadmap.MarkovDiffusionOperators

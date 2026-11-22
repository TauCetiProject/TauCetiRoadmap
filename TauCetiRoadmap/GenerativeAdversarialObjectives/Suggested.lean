import Mathlib
import TauCeti.Analysis.Convex.Conjugate
import TauCeti.MeasureTheory.OptimalTransport.Wasserstein.Basic
import TauCeti.MeasureTheory.OptimalTransport.Wasserstein.InternalEnergy.Basic

/-!
# Generative adversarial objectives: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
few definitions they need; every definition has a real body. Every headline theorem of the README
is statable at the pins and is stated here.

Laws are probability measures on a measurable space. The Jensen–Shannon divergence is the mutual
information between a uniform index on two points and the observation, `mutualInfoUniform ![P, Q]`
(the definition is copied verbatim from MathematicalStatisticsNonparametric 2.4), so that it lies
in `[0, log 2]`. A discriminator is a measurable function with values in the open interval
`(0, 1)`, and the GAN loss is the sum of two lower Lebesgue integrals of nonnegative functions,
so that no junk value of `Real.log` at `0` or of the Bochner integral can enter. The statistical
distance is half of Mathlib's `tvDist`. The `1`-Wasserstein distance is Tau Ceti's
`TauCeti.wassersteinEDist 1`.

The `f`-divergence `D_f(P ‖ Q)` of Layer 2 is Tau Ceti's internal energy
`TauCeti.internalEnergy f Q P`, in `EReal`: the integral of `f` of the density `dP/dQ` against
`Q` plus the recession constant `TauCeti.recessionConstant f` (the upper limit of `f(x)/x` as
`x → ∞`, a limit for convex `f`) times the mass of the part of `P` singular to `Q`, with positive
and negative parts summed separately, so that it is `⊤` when the positive part is infinite. The
convex conjugate over `[0, ∞)` is Tau Ceti's Legendre–Fenchel
conjugate of the extension of `f` by `⊤` on the negative half-line.
-/

noncomputable section

open MeasureTheory ProbabilityTheory Filter Set Topology InformationTheory TauCeti
open scoped ENNReal NNReal

namespace TauCetiRoadmap.GenerativeAdversarialObjectives

/-! ## Layer 1: the GAN value and the Jensen–Shannon divergence -/

section Copied

variable {X Y : Type*} [MeasurableSpace X] [PseudoMetricSpace Y] [MeasurableSpace Y]

/-- 1.1 Copied verbatim from MathematicalStatisticsNonparametric 2.4: the uniform mixture of
finitely many laws. -/
def uniformMixture {M : ℕ} (P : Fin M → Measure X) : Measure X :=
  (M : ℝ≥0∞)⁻¹ • ∑ j, P j

/-- 1.1 Copied verbatim from MathematicalStatisticsNonparametric 2.4: the mutual information
between a uniform index and the observation. -/
def mutualInfoUniform {M : ℕ} (P : Fin M → Measure X) : ℝ≥0∞ :=
  (M : ℝ≥0∞)⁻¹ * ∑ j, klDiv (P j) (uniformMixture P)

end Copied

section Layer1

variable {X : Type*} [MeasurableSpace X]

/-- 1.1 The Jensen–Shannon divergence `½ KL(P ‖ M) + ½ KL(Q ‖ M)` with `M = (P + Q)/2`: the
mutual information of the uniform mixture of the two laws. -/
def jsDiv (P Q : Measure X) : ℝ≥0∞ :=
  mutualInfoUniform ![P, Q]

/-- 1.1 A discriminator is a measurable function with values in the open interval `(0, 1)`. -/
def IsDiscriminator (D : X → ℝ) : Prop :=
  Measurable D ∧ ∀ x, 0 < D x ∧ D x < 1

/-- 1.1 The GAN loss of a discriminator `D`: `∫ -log D dP + ∫ -log (1 - D) dQ` in `[0, ∞]`, the
negative of the value `V(D)` of the game. -/
def ganLoss (P Q : Measure X) (D : X → ℝ) : ℝ≥0∞ :=
  ∫⁻ x, ENNReal.ofReal (-Real.log (D x)) ∂P + ∫⁻ x, ENNReal.ofReal (-Real.log (1 - D x)) ∂Q

/-- 1.1 The binary relative entropy `a log (a/b) + (1 - a) log ((1 - a)/(1 - b))`. -/
def binKL (a b : ℝ) : ℝ :=
  a * Real.log (a / b) + (1 - a) * Real.log ((1 - a) / (1 - b))

/-- 1.2 The gap identity: for every discriminator, the GAN loss plus twice the Jensen–Shannon
divergence is `log 4` plus the integral, against `P + Q`, of the binary relative entropy of the
optimal discriminator `dP/d(P + Q)` from `D`. -/
theorem ganLoss_add_two_mul_jsDiv (P Q : Measure X) [IsProbabilityMeasure P]
    [IsProbabilityMeasure Q] {D : X → ℝ} (hD : IsDiscriminator D) :
    ganLoss P Q D + 2 * jsDiv P Q = ENNReal.ofReal (Real.log 4) +
      ∫⁻ x, ENNReal.ofReal (binKL (P.rnDeriv (P + Q) x).toReal (D x)) ∂(P + Q) := by
  sorry

/-- 1.2 A discriminator attains `log 4 - 2 JSD(P, Q)` exactly when it agrees with the optimal
discriminator `dP/d(P + Q)` almost everywhere for `P + Q` (Goodfellow et al., Proposition 1). -/
theorem ganLoss_add_two_mul_jsDiv_eq_iff (P Q : Measure X) [IsProbabilityMeasure P]
    [IsProbabilityMeasure Q] {D : X → ℝ} (hD : IsDiscriminator D) :
    ganLoss P Q D + 2 * jsDiv P Q = ENNReal.ofReal (Real.log 4) ↔
      D =ᵐ[P + Q] fun x ↦ (P.rnDeriv (P + Q) x).toReal := by
  sorry

/-- 1.2 The value of the game: the infimum of the GAN loss over discriminators is
`log 4 - 2 JSD(P, Q)`, and it is `log 4` exactly when the two laws are equal (Goodfellow et al.,
Theorem 1). -/
theorem iInf_ganLoss_add_two_mul_jsDiv (P Q : Measure X) [IsProbabilityMeasure P]
    [IsProbabilityMeasure Q] :
    (⨅ (D : X → ℝ) (_ : IsDiscriminator D), ganLoss P Q D) + 2 * jsDiv P Q =
        ENNReal.ofReal (Real.log 4) ∧
      ((⨅ (D : X → ℝ) (_ : IsDiscriminator D), ganLoss P Q D) = ENNReal.ofReal (Real.log 4) ↔
        P = Q) := by
  sorry

/-- 1.2 The infimum of the GAN loss is attained exactly when `P` and `Q` are mutually absolutely
continuous. -/
theorem exists_ganLoss_add_two_mul_jsDiv_eq_iff (P Q : Measure X) [IsProbabilityMeasure P]
    [IsProbabilityMeasure Q] :
    (∃ D, IsDiscriminator D ∧ ganLoss P Q D + 2 * jsDiv P Q = ENNReal.ofReal (Real.log 4)) ↔
      P ≪ Q ∧ Q ≪ P := by
  sorry

/-- 1.3 The Jensen–Shannon divergence between the two bounds of Polyanskiy–Wu (7.39), with
`δ = tvDist P Q / 2`: `log 2 - h((1 - δ)/2) ≤ JSD(P, Q) ≤ δ log 2`, `h` the binary entropy. -/
theorem jsDiv_mem_bounds (P Q : Measure X) [IsProbabilityMeasure P] [IsProbabilityMeasure Q] :
    ENNReal.ofReal (Real.log 2 - Real.binEntropy ((1 - tvDist P Q / 2) / 2)) ≤ jsDiv P Q ∧
      jsDiv P Q ≤ ENNReal.ofReal (tvDist P Q / 2 * Real.log 2) := by
  sorry

/-- 1.3 The Jensen–Shannon divergence equals its maximum `log 2` exactly for mutually singular
laws. -/
theorem jsDiv_eq_log_two_iff (P Q : Measure X) [IsProbabilityMeasure P]
    [IsProbabilityMeasure Q] :
    jsDiv P Q = ENNReal.ofReal (Real.log 2) ↔ P ⟂ₘ Q := by
  sorry

/-- 1.3 Convergence in Jensen–Shannon divergence is convergence in total variation. -/
theorem tendsto_jsDiv_iff_tendsto_tvDist {ι : Type*} {l : Filter ι} (P : ι → Measure X)
    [∀ i, IsProbabilityMeasure (P i)] (Q : Measure X) [IsProbabilityMeasure Q] :
    Tendsto (fun i ↦ jsDiv (P i) Q) l (𝓝 0) ↔ Tendsto (fun i ↦ tvDist (P i) Q) l (𝓝 0) := by
  sorry

end Layer1

/-! ## Layer 2: f-divergences and their variational representation -/

section Layer2

variable {X : Type*} [MeasurableSpace X]

/-- 2.1 The convex conjugate of `f` over `[0, ∞)`, `f*(y) = sup_{x ≥ 0} (x y - f x)`, possibly
`⊤`: Tau Ceti's Legendre–Fenchel conjugate, for the inner product of `ℝ`, of the extension of `f`
by `⊤` on `(-∞, 0)`. -/
def nonnegConjugate (f : ℝ → ℝ) (y : ℝ) : EReal :=
  fenchelConjugate (innerₗ ℝ) (fun x ↦ if 0 ≤ x then (f x : EReal) else ⊤) y

/-- 2.2 The variational representation of `f`-divergences (Polyanskiy–Wu, Theorem 7.26 (a)):
for `f` convex on `[0, ∞)` and continuous at `0`, `D_f(P ‖ Q)` (Tau Ceti's
`internalEnergy f Q P`) is the supremum of `E_P g - E_Q f*(g)` over the measurable functions `g`
with finitely many values, all in the domain of `f*`. -/
theorem internalEnergy_eq_iSup {f : ℝ → ℝ} (hf : ConvexOn ℝ (Ici 0) f)
    (hf0 : ContinuousWithinAt f (Ici 0) 0) (P Q : Measure X) [IsProbabilityMeasure P]
    [IsProbabilityMeasure Q] :
    internalEnergy f Q P = ⨆ (g : X → ℝ) (_ : Measurable g) (_ : (range g).Finite)
      (_ : ∀ x, nonnegConjugate f (g x) ≠ ⊤),
      ((∫ x, g x ∂P - ∫ x, (nonnegConjugate f (g x)).toReal ∂Q : ℝ) : EReal) := by
  sorry

/-- 2.2 The variational lower bound `E_P g - E_Q f*(g) ≤ D_f(P ‖ Q)` for an integrable `g` with
values in the domain of `f*`, and, when `P ≪ Q`, its equality case: equality holds exactly when
the Fenchel–Young inequality `f(r) + f*(g) ≥ r g` at `r = dP/dQ` is an equality `Q`-almost
everywhere. -/
theorem integral_sub_integral_le_internalEnergy {f : ℝ → ℝ} (hf : ConvexOn ℝ (Ici 0) f)
    (P Q : Measure X) [IsProbabilityMeasure P] [IsProbabilityMeasure Q] {g : X → ℝ}
    (hdom : ∀ x, nonnegConjugate f (g x) ≠ ⊤) (hgP : Integrable g P)
    (hgQ : Integrable (fun x ↦ (nonnegConjugate f (g x)).toReal) Q) :
    ((∫ x, g x ∂P - ∫ x, (nonnegConjugate f (g x)).toReal ∂Q : ℝ) : EReal) ≤
        internalEnergy f Q P ∧
      (P ≪ Q →
        (((∫ x, g x ∂P - ∫ x, (nonnegConjugate f (g x)).toReal ∂Q : ℝ) : EReal) =
            internalEnergy f Q P ↔
          ∀ᵐ x ∂Q, f (P.rnDeriv Q x).toReal + (nonnegConjugate f (g x)).toReal =
            (P.rnDeriv Q x).toReal * g x)) := by
  sorry

end Layer2

/-! ## Layer 3: the Wasserstein objective -/

section Layer3

/-- 3.1 On a space in which every distance is at most `R`, the `1`-Wasserstein distance is at
most `R` times the statistical distance `tvDist P Q / 2`. -/
theorem wassersteinEDist_one_le_ofReal_mul_tvDist {X : Type*} [PseudoMetricSpace X]
    [MeasurableSpace X] (P Q : Measure X)
    [IsProbabilityMeasure P] [IsProbabilityMeasure Q] {R : ℝ} (hR : ∀ x y : X, dist x y ≤ R) :
    wassersteinEDist 1 P Q ≤ ENNReal.ofReal (R * (tvDist P Q / 2)) := by
  sorry

/-- 3.1 The parallel lines of Arjovsky–Chintala–Bottou, Example 1: the law of `(θ, Z)` in `ℝ × ℝ`
for `Z` uniform on `[0, 1]`. -/
def parallelLine (θ : ℝ) : Measure (ℝ × ℝ) :=
  (volume.restrict (Icc (0 : ℝ) 1)).map fun z ↦ (θ, z)

/-- 3.1 Along the parallel lines the `1`-Wasserstein distance is `|θ|`, while for `θ ≠ 0` the
Jensen–Shannon divergence is `log 2`, both relative entropies are infinite and the statistical
distance is `1`. -/
theorem parallelLine_divergences :
    (∀ θ : ℝ, wassersteinEDist 1 (parallelLine 0) (parallelLine θ) = ENNReal.ofReal |θ|) ∧
      ∀ θ : ℝ, θ ≠ 0 →
        jsDiv (parallelLine 0) (parallelLine θ) = ENNReal.ofReal (Real.log 2) ∧
          klDiv (parallelLine 0) (parallelLine θ) = ∞ ∧
          klDiv (parallelLine θ) (parallelLine 0) = ∞ ∧
          tvDist (parallelLine 0) (parallelLine θ) = 2 := by
  sorry

variable {X Z : Type*} [PseudoMetricSpace X] [MeasurableSpace X] [BorelSpace X] [PolishSpace X]
  [MeasurableSpace Z]

/-- 3.2 Arjovsky–Chintala–Bottou, Theorem 1 (1), on a bounded Polish space: if the generator is
continuous in the parameter, the `1`-Wasserstein loss is continuous in the parameter. -/
theorem continuous_wassersteinEDist_one_map {Θ : Type*} [PseudoMetricSpace Θ]
    (μ : Measure Z) [IsProbabilityMeasure μ] (Pr : Measure X) [IsProbabilityMeasure Pr]
    {R : ℝ} (hR : ∀ x y : X, dist x y ≤ R) {g : Z → Θ → X}
    (hgm : ∀ θ, Measurable fun z ↦ g z θ) (hgc : ∀ z, Continuous (g z)) :
    Continuous fun θ ↦ wassersteinEDist 1 Pr (μ.map fun z ↦ g z θ) := by
  sorry

/-- 3.2 Arjovsky–Chintala–Bottou, Theorem 1 (2), with a Lipschitz bound uniform on an open set:
if `dist (g z θ) (g z θ') ≤ L z ‖θ - θ'‖` on `U` with `L` integrable and the loss is finite at
one point of `U`, then it is finite on `U`, `(∫ L)`-Lipschitz there, and differentiable at almost
every point of `U`. -/
theorem lipschitzOnWith_wassersteinEDist_one_map {E : Type*} [NormedAddCommGroup E]
    [NormedSpace ℝ E] [FiniteDimensional ℝ E] [MeasurableSpace E] [BorelSpace E]
    (ν : Measure E) [ν.IsAddHaarMeasure] (μ : Measure Z) [IsProbabilityMeasure μ]
    (Pr : Measure X) [IsProbabilityMeasure Pr] {U : Set E} (hU : IsOpen U) {g : Z → E → X}
    (hgm : ∀ θ ∈ U, Measurable fun z ↦ g z θ) {L : Z → ℝ} (hL : Integrable L μ)
    (hlip : ∀ z, ∀ θ ∈ U, ∀ θ' ∈ U, dist (g z θ) (g z θ') ≤ L z * ‖θ - θ'‖)
    (hfin : ∃ θ₀ ∈ U, wassersteinEDist 1 Pr (μ.map fun z ↦ g z θ₀) ≠ ∞) :
    (∀ θ ∈ U, wassersteinEDist 1 Pr (μ.map fun z ↦ g z θ) ≠ ∞) ∧
      LipschitzOnWith (∫ z, L z ∂μ).toNNReal
        (fun θ ↦ (wassersteinEDist 1 Pr (μ.map fun z ↦ g z θ)).toReal) U ∧
      ∀ᵐ θ ∂ν, θ ∈ U →
        DifferentiableAt ℝ (fun θ ↦ (wassersteinEDist 1 Pr (μ.map fun z ↦ g z θ)).toReal) θ := by
  sorry

end Layer3

section Layer3Critic

variable {X Z : Type*} [PseudoMetricSpace X] [MeasurableSpace X] [BorelSpace X] [MeasurableSpace Z]

/-- 3.3 Arjovsky–Chintala–Bottou, Theorem 3, on a bounded space: for an optimal `1`-Lipschitz
critic `f`, wherever the loss and the critic composed with the generator are differentiable, the
gradient of the loss is minus the average gradient of the critic along the generator. -/
theorem hasFDerivAt_wassersteinEDist_one_map {E : Type*} [NormedAddCommGroup E]
    [NormedSpace ℝ E] [FiniteDimensional ℝ E] (μ : Measure Z) [IsProbabilityMeasure μ]
    (Pr : Measure X) [IsProbabilityMeasure Pr] {R : ℝ} (hR : ∀ x y : X, dist x y ≤ R)
    {U : Set E} (hU : IsOpen U) {g : Z → E → X} (hgm : ∀ θ ∈ U, Measurable fun z ↦ g z θ)
    {L : Z → ℝ} (hL : Integrable L μ)
    (hlip : ∀ z, ∀ θ ∈ U, ∀ θ' ∈ U, dist (g z θ) (g z θ') ≤ L z * ‖θ - θ'‖)
    {θ₀ : E} (hθ₀ : θ₀ ∈ U) {f : X → ℝ} (hf : LipschitzWith 1 f)
    (hopt : ∫ x, f x ∂Pr - ∫ z, f (g z θ₀) ∂μ =
      (wassersteinEDist 1 Pr (μ.map fun z ↦ g z θ₀)).toReal)
    (hW : DifferentiableAt ℝ (fun θ ↦ (wassersteinEDist 1 Pr (μ.map fun z ↦ g z θ)).toReal) θ₀)
    (hfg : ∀ᵐ z ∂μ, DifferentiableAt ℝ (fun θ ↦ f (g z θ)) θ₀) :
    HasFDerivAt (fun θ ↦ (wassersteinEDist 1 Pr (μ.map fun z ↦ g z θ)).toReal)
      (-∫ z, fderiv ℝ (fun θ ↦ f (g z θ)) θ₀ ∂μ) θ₀ := by
  sorry

end Layer3Critic

section Layer3Gradient

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
  [MeasurableSpace E] [BorelSpace E]

/-- 3.4 Gulrajani et al., Proposition 1, for laws with finite first moments: an optimal critic
increases at unit rate along almost every pair of an optimal coupling, and its gradient at every
point of the segment where it is differentiable is the unit vector of the pair. -/
theorem gradient_eq_of_isOptimalCoupling (P Q : Measure E) [IsProbabilityMeasure P]
    [IsProbabilityMeasure Q] (hP : HasFiniteMoment 1 P) (hQ : HasFiniteMoment 1 Q)
    {π : Measure (E × E)} (hπ : IsOptimalCoupling (fun z ↦ edist z.1 z.2) π P Q) {f : E → ℝ}
    (hf : LipschitzWith 1 f)
    (hopt : ∫ x, f x ∂P - ∫ x, f x ∂Q = (wassersteinEDist 1 P Q).toReal) :
    ∀ᵐ z ∂π, f z.1 - f z.2 = ‖z.1 - z.2‖ ∧
      (z.1 ≠ z.2 → ∀ t ∈ Icc (0 : ℝ) 1, DifferentiableAt ℝ f (z.2 + t • (z.1 - z.2)) →
        gradient f (z.2 + t • (z.1 - z.2)) = ‖z.1 - z.2‖⁻¹ • (z.1 - z.2)) := by
  sorry

/-- 3.4 Gulrajani et al., Corollary 1: if the optimal coupling does not charge the diagonal, an
optimal critic has gradient of norm `1` at almost every point, for `P` and for `Q`, at which it is
differentiable. -/
theorem norm_gradient_eq_one (P Q : Measure E) [IsProbabilityMeasure P]
    [IsProbabilityMeasure Q] (hP : HasFiniteMoment 1 P) (hQ : HasFiniteMoment 1 Q)
    {π : Measure (E × E)} (hπ : IsOptimalCoupling (fun z ↦ edist z.1 z.2) π P Q)
    (hdiag : π {z | z.1 = z.2} = 0) {f : E → ℝ} (hf : LipschitzWith 1 f)
    (hopt : ∫ x, f x ∂P - ∫ x, f x ∂Q = (wassersteinEDist 1 P Q).toReal) :
    (∀ᵐ x ∂P, DifferentiableAt ℝ f x → ‖gradient f x‖ = 1) ∧
      ∀ᵐ y ∂Q, DifferentiableAt ℝ f y → ‖gradient f y‖ = 1 := by
  sorry

end Layer3Gradient

end TauCetiRoadmap.GenerativeAdversarialObjectives

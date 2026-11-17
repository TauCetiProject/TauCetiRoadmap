import Mathlib
import TauCeti.Probability.Distributions.Gaussian.Density

/-!
# Gaussian denoising diffusion: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
definitions they need. Every headline theorem of the README is statable at the pins and is stated
here.

Suppliers: MathematicalStatisticsNonparametric 1.3 (`klDiv_multivariateGaussian`); Tau Ceti
`multivariateGaussianPDFReal`, `multivariateGaussian_eq_withDensity`,
`multivariateGaussian_conv_multivariateGaussian`, `map_affine_multivariateGaussian`,
`condDistrib_multivariateGaussian`, `EuclideanSpace.gaussianCondKernel`,
`EuclideanSpace.map_snd_fst_multivariateGaussian`, `TauCeti.klDiv_compProd_right`,
`TauCeti.klDiv_compProd_eq_add_lintegral`, `TauCeti.heatKernel`, `TauCeti.contDiff_heatKernel`,
`TauCeti.exists_one_add_norm_pow_mul_norm_iteratedFDeriv_heatKernel_le`; Mathlib
`multivariateGaussian`, `stdGaussian`, `EuclideanSpace.sumEquivProd`, `klDiv`, `klDiv_map_le`,
`klDiv_compProd_eq_add`, `Kernel.partialTraj`, `condExp`, `condDistrib`, `gradient`,
`Laplacian.laplacian`, `hasFDerivAt_integral_of_dominated_of_fderiv_le`.
-/

noncomputable section

open MeasureTheory ProbabilityTheory InformationTheory Real TauCeti.Probability Finset
open scoped ENNReal NNReal Gradient

namespace TauCetiRoadmap.DenoisingDiffusion

variable {d : ℕ}

local notation "E" => EuclideanSpace ℝ (Fin d)

/-! ## Layer 1: isotropic Gaussian tools -/

/-- 1.1: the divergence between isotropic Gaussian laws with variances `u, v > 0`. -/
theorem klDiv_multivariateGaussian_smul_one (a b : E) {u v : ℝ} (hu : 0 < u) (hv : 0 < v) :
    klDiv (multivariateGaussian a (u • 1)) (multivariateGaussian b (v • 1)) =
      ENNReal.ofReal (d / 2 * (u / v - 1 - Real.log (u / v)) + ‖a - b‖ ^ 2 / (2 * v)) :=
  sorry

/-- The Gaussian observation kernel `x ↦ N(c • x, v)`. -/
def gaussianKernel (c v : ℝ) : Kernel E E :=
  (Kernel.id ×ₖ Kernel.const E (multivariateGaussian 0 (v • 1))).map (fun p ↦ c • p.1 + p.2)

/-- 1.2: the isotropic Gaussian Bayes update, as an equality of joint laws. -/
theorem compProd_gaussianKernel_eq_swap (m : E) {u v : ℝ} (hu : 0 ≤ u) (hv : 0 < v) (c : ℝ) :
    let w := c ^ 2 * u + v
    multivariateGaussian m (u • 1) ⊗ₘ gaussianKernel c v =
      ((multivariateGaussian (c • m) (w • 1)) ⊗ₘ
        ((Kernel.id ×ₖ Kernel.const E (multivariateGaussian 0 ((u * v / w) • 1))).map
          (fun p ↦ m + (c * u / w) • (p.1 - c • m) + p.2))).map Prod.swap :=
  sorry

/-! ## Layer 2: the forward noising chain -/

/-- The variance-preserving noising kernel `x ↦ N(√a • x, 1 - a)`. -/
def noiseKernel (a : ℝ) : Kernel E E :=
  (Kernel.id ×ₖ Kernel.const E (stdGaussian E)).map (fun p ↦ √a • p.1 + √(1 - a) • p.2)

/-- 2.1: the noising kernel is the isotropic Gaussian `N(√a • x, 1 - a)`. -/
theorem noiseKernel_apply {a : ℝ} (ha₀ : 0 ≤ a) (ha₁ : a ≤ 1) (x : E) :
    noiseKernel a x = multivariateGaussian (√a • x) ((1 - a) • 1) :=
  sorry

/-- 2.1: composition of noising kernels multiplies the signal levels. -/
theorem noiseKernel_comp {a b : ℝ} (ha₀ : 0 ≤ a) (ha₁ : a ≤ 1) (hb₀ : 0 ≤ b) (hb₁ : b ≤ 1) :
    noiseKernel (d := d) b ∘ₖ noiseKernel a = noiseKernel (a * b) :=
  sorry

/-- The cumulative signal level `ᾱ t = ∏_{s=1}^t (1 - β s)`. -/
def alphaBar (β : ℕ → ℝ) (t : ℕ) : ℝ := ∏ s ∈ Icc 1 t, (1 - β s)

/-- Evaluation of a path at time `i`. -/
def pathEval {n : ℕ} (i : ℕ) (hi : i ≤ n) (x : Π _ : Iic n, E) : E := x ⟨i, mem_Iic.2 hi⟩

/-- Evaluation of a path at a fixed time is measurable. -/
theorem measurable_pathEval {n : ℕ} (i : ℕ) (hi : i ≤ n) :
    Measurable (pathEval (d := d) (n := n) i hi) :=
  measurable_pi_apply _

/-- The forward step on paths: noise the state at time `n`. -/
def forwardStep (β : ℕ → ℝ) (n : ℕ) : Kernel (Π _ : Iic n, E) E :=
  (noiseKernel (1 - β (n + 1))).comap (pathEval n le_rfl) (measurable_pathEval n le_rfl)

/-- The law of the forward chain on paths up to time `T`. -/
def forwardPath (μ₀ : Measure E) (β : ℕ → ℝ) (T : ℕ) : Measure (Π _ : Iic T, E) :=
  Kernel.partialTraj (X := fun _ ↦ E) (forwardStep β) 0 T ∘ₘ μ₀.map (fun x (_ : Iic 0) ↦ x)

/-- The marginal of the forward chain at time `t`. -/
def forwardMarginal (μ₀ : Measure E) (β : ℕ → ℝ) (t : ℕ) : Measure E :=
  μ₀.bind (noiseKernel (alphaBar β t))

variable {β : ℕ → ℝ}

/-- 2.2: marginals of the path law, and the joint law of `(x 0, x t)`. -/
theorem forwardPath_map_eval (μ₀ : Measure E) [IsProbabilityMeasure μ₀]
    (hβ : ∀ t, 1 ≤ t → 0 < β t ∧ β t < 1) {T t : ℕ} (ht : t ≤ T) :
    (forwardPath μ₀ β T).map (pathEval t ht) = forwardMarginal μ₀ β t ∧
      (forwardPath μ₀ β T).map (fun x ↦ (pathEval 0 (Nat.zero_le T) x, pathEval t ht x)) =
        μ₀ ⊗ₘ noiseKernel (alphaBar β t) :=
  sorry

/-- 2.2: the divergence of a forward marginal from the standard Gaussian. -/
theorem klDiv_forwardMarginal_le (μ₀ : Measure E) [IsProbabilityMeasure μ₀]
    (hβ : ∀ t, 1 ≤ t → 0 < β t ∧ β t < 1) {M : ℝ} (hM : ∫ x, ‖x‖ ^ 2 ∂μ₀ ≤ M)
    (hint : Integrable (fun x ↦ ‖x‖ ^ 2) μ₀) {t : ℕ} (ht : 1 ≤ t) :
    klDiv (forwardMarginal μ₀ β t) (stdGaussian E) ≤
      ENNReal.ofReal ((alphaBar β t * M - d * alphaBar β t -
        d * Real.log (1 - alphaBar β t)) / 2) :=
  sorry

/-- The DDPM posterior variance `β̃ t`. -/
def postVar (β : ℕ → ℝ) (t : ℕ) : ℝ :=
  (1 - alphaBar β (t - 1)) * β t / (1 - alphaBar β t)

/-- The DDPM posterior mean `μ̃ t x₀ x`. -/
def postMean (β : ℕ → ℝ) (t : ℕ) (x₀ x : E) : E :=
  (√(alphaBar β (t - 1)) * β t / (1 - alphaBar β t)) • x₀ +
    (√(1 - β t) * (1 - alphaBar β (t - 1)) / (1 - alphaBar β t)) • x

/-- The DDPM posterior kernel `(x₀, x) ↦ N(μ̃ t x₀ x, β̃ t)`. -/
def postKernel (β : ℕ → ℝ) (t : ℕ) : Kernel (E × E) E :=
  (Kernel.id ×ₖ Kernel.const (E × E) (multivariateGaussian 0 (postVar β t • 1))).map
    (fun p ↦ postMean β t p.1.1 p.1.2 + p.2)

/-- 2.3: the DDPM posterior. -/
theorem ddpm_posterior (hβ : ∀ t, 1 ≤ t → 0 < β t ∧ β t < 1) {t : ℕ} (ht : 1 ≤ t) (x₀ : E) :
    noiseKernel (alphaBar β (t - 1)) x₀ ⊗ₘ noiseKernel (1 - β t) =
      ((noiseKernel (alphaBar β t) x₀) ⊗ₘ
        (postKernel β t).comap (fun x ↦ (x₀, x)) (by fun_prop)).map Prod.swap :=
  sorry

/-- 2.3: the noise-prediction form of the posterior mean. -/
theorem postMean_eq_noise (hβ : ∀ t, 1 ≤ t → 0 < β t ∧ β t < 1) {t : ℕ} (ht : 1 ≤ t)
    (x₀ ε : E) :
    postMean β t x₀ (√(alphaBar β t) • x₀ + √(1 - alphaBar β t) • ε) =
      (1 / √(1 - β t)) • (√(alphaBar β t) • x₀ + √(1 - alphaBar β t) • ε -
        (β t / √(1 - alphaBar β t)) • ε) :=
  sorry

/-! ## Layer 3: Tweedie's formula and score matching -/

/-- 3.1: the density of `c • X + s • Z` for `X ~ μ₀` and an independent standard Gaussian `Z`. -/
def smoothedDensity (μ₀ : Measure E) (c s : ℝ) (y : E) : ℝ :=
  ∫ x, multivariateGaussianPDFReal 0 ((s ^ 2) • (1 : Matrix (Fin d) (Fin d) ℝ)) (y - c • x) ∂μ₀

/-- 3.1: the score of the smoothed law. -/
def noisyScore (μ₀ : Measure E) (c s : ℝ) (y : E) : E :=
  ∇ (fun z ↦ Real.log (smoothedDensity μ₀ c s z)) y

section Observation

variable {Ω : Type*} [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
  {μ₀ : Measure (EuclideanSpace ℝ (Fin d))} [IsProbabilityMeasure μ₀]
  {X Z : Ω → EuclideanSpace ℝ (Fin d)} {c s : ℝ}

/-- 3.1: the smoothed density is a density of the observation. -/
theorem hasLaw_smoothedDensity (hXm : Measurable X) (hZm : Measurable Z) (hX : HasLaw X μ₀ P)
    (hZ : HasLaw Z (stdGaussian E) P) (hXZ : IndepFun X Z P) (hs : 0 < s) :
    HasLaw (fun ω ↦ c • X ω + s • Z ω)
      (volume.withDensity fun y ↦ ENNReal.ofReal (smoothedDensity μ₀ c s y)) P :=
  sorry

/-- 3.2: Tweedie's formula, noise form; no moment assumption on `μ₀`. -/
theorem tweedie_noise (hXm : Measurable X) (hZm : Measurable Z) (hX : HasLaw X μ₀ P)
    (hZ : HasLaw Z (stdGaussian E) P) (hXZ : IndepFun X Z P) (hs : 0 < s) :
    P[Z | MeasurableSpace.comap (fun ω ↦ c • X ω + s • Z ω) inferInstance] =ᵐ[P]
      fun ω ↦ -s • noisyScore μ₀ c s (c • X ω + s • Z ω) :=
  sorry

/-- 3.2: Tweedie's formula for the posterior mean. -/
theorem tweedie (hXm : Measurable X) (hZm : Measurable Z) (hX : HasLaw X μ₀ P)
    (hZ : HasLaw Z (stdGaussian E) P) (hXZ : IndepFun X Z P) (hs : 0 < s) (hc : c ≠ 0)
    (hXi : Integrable X P) :
    P[X | MeasurableSpace.comap (fun ω ↦ c • X ω + s • Z ω) inferInstance] =ᵐ[P]
      fun ω ↦ c⁻¹ • ((c • X ω + s • Z ω) + s ^ 2 • noisyScore μ₀ c s (c • X ω + s • Z ω)) :=
  sorry

/-- 3.2: Tweedie's formula for the posterior covariance. -/
theorem tweedie_covariance (hXm : Measurable X) (hZm : Measurable Z) (hX : HasLaw X μ₀ P)
    (hZ : HasLaw Z (stdGaussian E) P) (hXZ : IndepFun X Z P) (hs : 0 < s) (hc : c ≠ 0)
    (hXi : Integrable X P) :
    let mY := MeasurableSpace.comap (fun ω ↦ c • X ω + s • Z ω) inferInstance
    let W : Ω → E := fun ω ↦ X ω - P[X | mY] ω
    P[fun ω ↦ (innerSL ℝ (W ω)).smulRight (W ω) | mY] =ᵐ[P]
      fun ω ↦ (s ^ 2 / c ^ 2) • (ContinuousLinearMap.id ℝ E +
        s ^ 2 • fderiv ℝ (noisyScore μ₀ c s) (c • X ω + s • Z ω)) :=
  sorry

/-- 3.3: the score of the observation is square integrable, with second moment at most
`d / s²`. -/
theorem memLp_noisyScore (hXm : Measurable X) (hZm : Measurable Z) (hX : HasLaw X μ₀ P)
    (hZ : HasLaw Z (stdGaussian E) P) (hXZ : IndepFun X Z P) (hs : 0 < s) :
    MemLp (fun ω ↦ noisyScore μ₀ c s (c • X ω + s • Z ω)) 2 P ∧
      ∫ ω, ‖noisyScore μ₀ c s (c • X ω + s • Z ω)‖ ^ 2 ∂P ≤ d / s ^ 2 :=
  sorry

/-- 3.3: denoising score matching equals explicit score matching up to a constant independent
of the estimator. -/
theorem dsm_eq_esm_add (hXm : Measurable X) (hZm : Measurable Z) (hX : HasLaw X μ₀ P)
    (hZ : HasLaw Z (stdGaussian E) P) (hXZ : IndepFun X Z P) (hs : 0 < s) {f : E → E}
    (hf : Measurable f) (hf2 : Integrable (fun ω ↦ ‖f (c • X ω + s • Z ω)‖ ^ 2) P) :
    ∫ ω, ‖f (c • X ω + s • Z ω) + (s⁻¹ • Z ω : E)‖ ^ 2 ∂P =
      (∫ ω, ‖(f (c • X ω + s • Z ω) - noisyScore μ₀ c s (c • X ω + s • Z ω) : E)‖ ^ 2 ∂P) +
        ((d : ℝ) / s ^ 2 - ∫ ω, ‖(noisyScore μ₀ c s (c • X ω + s • Z ω) : E)‖ ^ 2 ∂P) :=
  sorry

/-- 3.3: noise prediction is minimized exactly by `-s` times the score. -/
theorem noisePrediction_minimizer (hXm : Measurable X) (hZm : Measurable Z) (hX : HasLaw X μ₀ P)
    (hZ : HasLaw Z (stdGaussian E) P) (hXZ : IndepFun X Z P) (hs : 0 < s) {g : E → E}
    (hg : Measurable g) (hg2 : Integrable (fun ω ↦ ‖g (c • X ω + s • Z ω)‖ ^ 2) P) :
    (∫ ω, ‖((-s) • noisyScore μ₀ c s (c • X ω + s • Z ω) - Z ω : E)‖ ^ 2 ∂P ≤
        ∫ ω, ‖(g (c • X ω + s • Z ω) - Z ω : E)‖ ^ 2 ∂P) ∧
      ((∫ ω, ‖(g (c • X ω + s • Z ω) - Z ω : E)‖ ^ 2 ∂P =
          ∫ ω, ‖((-s) • noisyScore μ₀ c s (c • X ω + s • Z ω) - Z ω : E)‖ ^ 2 ∂P) ↔
        g =ᵐ[P.map (fun ω ↦ c • X ω + s • Z ω)] fun y ↦ (-s) • noisyScore μ₀ c s y) :=
  sorry

end Observation

/-! ## Layer 4: the variational bound -/

/-- Time reversal of a path: `(reverseIndex T x) i = x (T - i)`. -/
def reverseIndex (T : ℕ) (x : Π _ : Iic T, E) : Π _ : Iic T, E :=
  fun i ↦ x ⟨T - i, mem_Iic.2 (Nat.sub_le _ _)⟩

/-- The path law of a reverse model: `x_T ~ π`, then `x_{t-1} ~ κ t x_t`. -/
def modelPath (prior : Measure E) (κ : ℕ → Kernel E E) (T : ℕ) : Measure (Π _ : Iic T, E) :=
  (Kernel.partialTraj (X := fun _ ↦ E)
      (fun n ↦ (κ (T - n)).comap (pathEval n le_rfl) (measurable_pathEval n le_rfl)) 0 T ∘ₘ
    prior.map (fun x (_ : Iic 0) ↦ x)).map (reverseIndex T)

variable {μ₀ : Measure (EuclideanSpace ℝ (Fin d))} [IsProbabilityMeasure μ₀] {T : ℕ}
  {rev κ : ℕ → Kernel (EuclideanSpace ℝ (Fin d)) (EuclideanSpace ℝ (Fin d))}

/-- The defining property of reverse kernels of the forward chain. -/
def IsReverseKernel (μ₀ : Measure E) (β : ℕ → ℝ) (T : ℕ) (rev : ℕ → Kernel E E) : Prop :=
  ∀ t (ht : 1 ≤ t) (htT : t ≤ T),
    (forwardPath μ₀ β T).map (fun x ↦ (pathEval t htT x, pathEval (t - 1) (by omega) x)) =
      forwardMarginal μ₀ β t ⊗ₘ rev t

/-- 4.1: read backwards, the forward chain is the Markov chain with kernels `rev t`. -/
theorem forwardPath_reverse (hβ : ∀ t, 1 ≤ t → 0 < β t ∧ β t < 1) [∀ t, IsMarkovKernel (rev t)]
    (hrev : IsReverseKernel μ₀ β T rev) :
    (forwardPath μ₀ β T).map (reverseIndex T) =
      Kernel.partialTraj (X := fun _ ↦ E)
          (fun n ↦ (rev (T - n)).comap (pathEval n le_rfl) (measurable_pathEval n le_rfl)) 0 T ∘ₘ
        (forwardMarginal μ₀ β T).map (fun x (_ : Iic 0) ↦ x) :=
  sorry

/-- 4.1: the chain rule for the path divergence. -/
theorem klDiv_forwardPath_eq (prior : Measure E)
    [IsProbabilityMeasure prior] [∀ t, IsMarkovKernel (rev t)] [∀ t, IsMarkovKernel (κ t)]
    (hβ : ∀ t, 1 ≤ t → 0 < β t ∧ β t < 1) (hrev : IsReverseKernel μ₀ β T rev) :
    klDiv (forwardPath μ₀ β T) (modelPath prior κ T) =
      klDiv (forwardMarginal μ₀ β T) prior +
        ∑ t ∈ Icc 1 T, klDiv (forwardMarginal μ₀ β t ⊗ₘ rev t) (forwardMarginal μ₀ β t ⊗ₘ κ t) :=
  sorry

/-- 4.1: the variational bound; this holds for every `β`. -/
theorem klDiv_le_klDiv_forwardPath (prior : Measure E)
    [IsProbabilityMeasure prior] [∀ t, IsMarkovKernel (κ t)] :
    klDiv μ₀ ((modelPath prior κ T).map (pathEval 0 (Nat.zero_le T))) ≤
      klDiv (forwardPath μ₀ β T) (modelPath prior κ T) :=
  sorry

/-- 4.2: the joint law of `((x 0, x t), x (t - 1))` is given by the DDPM posterior. -/
theorem forwardPath_map_posterior (hβ : ∀ t, 1 ≤ t → 0 < β t ∧ β t < 1) {t : ℕ} (ht : 1 ≤ t)
    (htT : t ≤ T) :
    (forwardPath μ₀ β T).map (fun x ↦ ((pathEval 0 (Nat.zero_le T) x, pathEval t htT x),
        pathEval (t - 1) (by omega) x)) =
      (μ₀ ⊗ₘ noiseKernel (alphaBar β t)) ⊗ₘ postKernel β t :=
  sorry

/-- 4.2: the conditional mutual information `Iₜ` is finite, with no moment assumption. -/
theorem klDiv_posterior_rev_le (hβ : ∀ t, 1 ≤ t → 0 < β t ∧ β t < 1)
    [∀ t, IsMarkovKernel (rev t)] (hrev : IsReverseKernel μ₀ β T rev) {t : ℕ} (ht : 2 ≤ t)
    (htT : t ≤ T) :
    klDiv ((μ₀ ⊗ₘ noiseKernel (alphaBar β t)) ⊗ₘ postKernel β t)
        ((μ₀ ⊗ₘ noiseKernel (alphaBar β t)) ⊗ₘ Kernel.prodMkLeft E (rev t)) ≤
      ENNReal.ofReal (d / 2 * Real.log ((1 - alphaBar β t) /
        ((1 - β t) * (1 - alphaBar β (t - 1))))) :=
  sorry

/-- 4.2: the posterior-conditioned divergence exceeds the reverse-kernel divergence by the
conditional mutual information, whatever the model kernel `κ`. Here `ρ` is the law of
`(x₀, x_t)`, `post` a posterior kernel and `rev` a reverse kernel. -/
theorem klDiv_posterior_eq_add (ρ : Measure (E × E)) [IsProbabilityMeasure ρ]
    (post : Kernel (E × E) E) [IsMarkovKernel post] (rev κ : Kernel E E)
    [IsMarkovKernel rev] [IsMarkovKernel κ]
    (hrev : (ρ ⊗ₘ post).map (fun p ↦ (p.1.2, p.2)) = ρ.map Prod.snd ⊗ₘ rev) :
    klDiv (ρ ⊗ₘ post) (ρ ⊗ₘ Kernel.prodMkLeft E κ) =
      klDiv (ρ.map Prod.snd ⊗ₘ rev) (ρ.map Prod.snd ⊗ₘ κ) +
        klDiv (ρ ⊗ₘ post) (ρ ⊗ₘ Kernel.prodMkLeft E rev) :=
  sorry

/-- The model kernel `x ↦ N((1/√α t)(x - (β t/√(1 - ᾱ t)) ε̂ x), σ²)`. -/
def epsModelKernel (β : ℕ → ℝ) (t : ℕ) (σ : ℝ) (εhat : E → E) : Kernel E E :=
  (Kernel.id ×ₖ Kernel.const E (multivariateGaussian 0 ((σ ^ 2) • 1))).map
    (fun p ↦ (1 / √(1 - β t)) • (p.1 - (β t / √(1 - alphaBar β t)) • εhat p.1) + p.2)

/-- 4.3: the Gaussian closed form of a posterior-conditioned term, pointwise. -/
theorem klDiv_postKernel_gaussian (hβ : ∀ t, 1 ≤ t → 0 < β t ∧ β t < 1) {t : ℕ} (ht : 2 ≤ t)
    {σ : ℝ} (hσ : 0 < σ) {εhat : E → E} (hε : Measurable εhat) (x₀ ε : E) :
    let x := √(alphaBar β t) • x₀ + √(1 - alphaBar β t) • ε
    klDiv (postKernel β t (x₀, x)) (epsModelKernel β t σ εhat x) =
      ENNReal.ofReal (d / 2 * (postVar β t / σ ^ 2 - 1 - Real.log (postVar β t / σ ^ 2)) +
        β t ^ 2 / (2 * σ ^ 2 * (1 - β t) * (1 - alphaBar β t)) * ‖ε - εhat x‖ ^ 2) :=
  sorry

/-- The noise recovered from `(x₀, x_t)`. -/
def noiseOf (β : ℕ → ℝ) (t : ℕ) (p : E × E) : E :=
  (1 / √(1 - alphaBar β t)) • (p.2 - √(alphaBar β t) • p.1)

/-- 4.3: the integrated closed form. -/
theorem klDiv_posterior_gaussian_integral (hβ : ∀ t, 1 ≤ t → 0 < β t ∧ β t < 1) {t : ℕ}
    (ht : 2 ≤ t) {σ : ℝ} (hσ : 0 < σ) {εhat : E → E} (hε : Measurable εhat)
    (hint : Integrable (fun p : E × E ↦ ‖εhat p.2‖ ^ 2) (μ₀ ⊗ₘ noiseKernel (alphaBar β t))) :
    klDiv ((μ₀ ⊗ₘ noiseKernel (alphaBar β t)) ⊗ₘ postKernel β t)
        ((μ₀ ⊗ₘ noiseKernel (alphaBar β t)) ⊗ₘ
          Kernel.prodMkLeft E (epsModelKernel β t σ εhat)) =
      ENNReal.ofReal (d / 2 * (postVar β t / σ ^ 2 - 1 - Real.log (postVar β t / σ ^ 2)) +
        β t ^ 2 / (2 * σ ^ 2 * (1 - β t) * (1 - alphaBar β t)) *
          ∫ p : E × E, ‖(noiseOf β t p - εhat p.2 : E)‖ ^ 2 ∂(μ₀ ⊗ₘ noiseKernel (alphaBar β t))) :=
  sorry

/-- 4.3: the integrated noise-prediction loss is minimized exactly by the rescaled score. -/
theorem posteriorLoss_minimizer (hβ : ∀ t, 1 ≤ t → 0 < β t ∧ β t < 1) {t : ℕ} (ht : 1 ≤ t)
    {εhat : E → E} (hε : Measurable εhat)
    (hint : Integrable (fun p : E × E ↦ ‖εhat p.2‖ ^ 2) (μ₀ ⊗ₘ noiseKernel (alphaBar β t))) :
    let εstar : E → E := fun y ↦
      (-√(1 - alphaBar β t)) • noisyScore μ₀ (√(alphaBar β t)) (√(1 - alphaBar β t)) y
    let ρ := μ₀ ⊗ₘ noiseKernel (alphaBar β t)
    (∫ p : E × E, ‖(noiseOf β t p - εstar p.2 : E)‖ ^ 2 ∂ρ ≤ ∫ p : E × E, ‖(noiseOf β t p - εhat p.2 : E)‖ ^ 2 ∂ρ) ∧
      ((∫ p : E × E, ‖(noiseOf β t p - εhat p.2 : E)‖ ^ 2 ∂ρ = ∫ p : E × E, ‖(noiseOf β t p - εstar p.2 : E)‖ ^ 2 ∂ρ) ↔
        εhat =ᵐ[forwardMarginal μ₀ β t] εstar) :=
  sorry

end TauCetiRoadmap.DenoisingDiffusion

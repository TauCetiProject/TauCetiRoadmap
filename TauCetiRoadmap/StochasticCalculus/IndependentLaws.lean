/-
Copyright (c) 2026 Kim Morrison. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib.Probability.Distributions.Uniform
import Mathlib.Probability.Independence.Integration
import Mathlib.Probability.ProbabilityMassFunction.Integrals
import Mathlib.Probability.Moments.Covariance
import Mathlib.Probability.Independence.InfinitePi
import Mathlib.Probability.Independence.Basic
import Mathlib.Probability.Density
import Mathlib.MeasureTheory.Group.Convolution

/-!
**This file is not the roadmap and is not exhaustive.** These are suggested native declarations;
the README is the definitive specification and source-coverage obligation.
-/

open MeasureTheory ProbabilityTheory
open scoped MeasureTheory ENNReal

namespace StochasticCalculusSuggested.IndependentLaws

variable {Ω : Type*} [MeasurableSpace Ω] {P : Measure Ω}

/-- Native alias: the law of a sum of independent real random variables is additive
convolution of their laws. This is Mathlib's `IndepFun.map_add_eq_map_conv_map₀`. -/
theorem independent_sum_law
    [IsFiniteMeasure P] {f g : Ω → ℝ}
    (hf : AEMeasurable f P) (hg : AEMeasurable g P)
    (hfg : IndepFun f g P) :
    Measure.map (fun ω => f ω + g ω) P = (Measure.map f P).conv (Measure.map g P) :=
  hfg.map_add_eq_map_conv_map₀ hf hg

/-- Native alias: a finite independent family has the product of its marginal laws.
This supplies the increment-vector law before the cumulative-sum coordinate change. -/
theorem independent_finite_vector_law
    {ι : Type*} [Fintype ι] [IsProbabilityMeasure P]
    {Z : ι → Ω → ℝ} (hZ : ∀ i, AEMeasurable (Z i) P)
    (hInd : iIndepFun Z P) :
    Measure.map (fun ω i => Z i ω) P = Measure.pi (fun i => Measure.map (Z i) P) :=
  hInd.map_fun_eq_pi_map hZ

/-- If each coordinate of the finite independent family has the stated density, the
joint increment-vector law is the product of those one-dimensional density measures. -/
theorem independent_finite_vector_density_law
    {ι : Type*} [Fintype ι] [IsProbabilityMeasure P]
    {Z : ι → Ω → ℝ} (hZ : ∀ i, AEMeasurable (Z i) P)
    (hInd : iIndepFun Z P) (ρ : ι → ℝ → ℝ≥0∞)
    (hDensity : ∀ i, Measure.map (Z i) P = volume.withDensity (ρ i)) :
    Measure.map (fun ω i => Z i ω) P =
      Measure.pi (fun i => volume.withDensity (ρ i)) := by
  rw [independent_finite_vector_law hZ hInd]
  exact congrArg Measure.pi (funext hDensity)

/-- The exact joint law underlying exercise 1(a): apply the measurable map `(x,y) ↦ (x+y,y)`
to the product of the independent marginal laws. -/
theorem independent_sum_second_joint_law
    [IsProbabilityMeasure P] {f g : Ω → ℝ}
    (hf : Measurable f) (hg : Measurable g)
    (hfg : IndepFun f g P) :
    Measure.map (fun ω => (f ω + g ω, g ω)) P =
      Measure.map (fun z : ℝ × ℝ => (z.1 + z.2, z.2))
        ((Measure.map f P).prod (Measure.map g P)) := by
  have hpair : Measure.map (fun ω => (f ω, g ω)) P =
      (Measure.map f P).prod (Measure.map g P) :=
    (indepFun_iff_map_prod_eq_prod_map_map hf.aemeasurable hg.aemeasurable).mp hfg
  calc
    Measure.map (fun ω => (f ω + g ω, g ω)) P =
        Measure.map (fun z : ℝ × ℝ => (z.1 + z.2, z.2))
          (Measure.map (fun ω => (f ω, g ω)) P) := by
      rw [Measure.map_map (by fun_prop) (by fun_prop)]
      rfl
    _ = _ := congrArg (Measure.map (fun z : ℝ × ℝ => (z.1 + z.2, z.2))) hpair

/-- Native density propagation for a sum. The convolution-density theorem is an alias of
Mathlib's `IndepFun.add_hasPDF` under addition, with its finite-probability and
translation-invariant reference-measure assumptions retained. -/
theorem independent_sum_hasPDF
    [IsFiniteMeasure P] {f g : Ω → ℝ}
    [HasPDF f P volume] [HasPDF g P volume]
    (hfg : IndepFun f g P) : HasPDF (fun ω => f ω + g ω) P volume :=
  hfg.add_hasPDF

/-- Desired general joint-event identity from source exercise 1(a). The left side is
written as a preimage event and the right side as the iterated law integral. This remains
a target: the proof must derive it from the joint product-law identity and Tonelli, with
measurability of the translated-set kernel established explicitly. -/
theorem independent_sum_joint_event
    [IsProbabilityMeasure P] {f g : Ω → ℝ}
    (hf : Measurable f) (hg : Measurable g)
    (hfg : IndepFun f g P) (A B : Set ℝ)
    (hA : MeasurableSet A) (hB : MeasurableSet B) :
    P {ω | f ω + g ω ∈ A ∧ g ω ∈ B} =
      ∫⁻ x in B, (Measure.map f P) {y | y + x ∈ A} ∂(Measure.map g P) := by
  sorry

end StochasticCalculusSuggested.IndependentLaws

/-! Elementary finite-law acceptance examples, using native probability and covariance. -/
noncomputable section
open scoped NNReal
namespace StochasticCalculusSuggested.IndependentLaws.ThreeAtomExample

abbrev Ω := Fin 3

def μ : Measure Ω := (PMF.uniformOfFintype Ω).toMeasure

def X (i : Ω) : ℝ := (i.val : ℝ) - 1

def Y (i : Ω) : ℝ := (X i) ^ 2

instance : IsProbabilityMeasure μ := by
  dsimp [μ]
  infer_instance

lemma integrable_bounded_one {f : Ω → ℝ} (hf : ∀ i, ‖f i‖ₑ ≤ 1) : Integrable f μ := by
  refine integrable_of_forall_fin_meas_le 1 (by norm_num) (by fun_prop) ?_
  intro s hs hfinite
  calc
    ∫⁻ i in s, ‖f i‖ₑ ∂μ ≤ ∫⁻ i in s, (1 : ℝ≥0∞) ∂μ := by
      apply lintegral_mono
      intro i
      exact hf i
    _ = μ s := by simp
    _ ≤ 1 := by
      calc μ s ≤ μ Set.univ := measure_mono (Set.subset_univ _)
        _ = 1 := measure_univ

lemma integrable_X : Integrable X μ := by
  apply integrable_bounded_one
  intro i
  fin_cases i <;> norm_num [X]

lemma integrable_Y : Integrable Y μ := by
  apply integrable_bounded_one
  intro i
  fin_cases i <;> norm_num [Y, X]

lemma integrable_X_sq : Integrable (fun i => X i ^ 2) μ := integrable_Y

lemma integrable_Y_sq : Integrable (fun i => Y i ^ 2) μ := by
  apply integrable_bounded_one
  intro i
  fin_cases i <;> norm_num [Y, X]

lemma integrable_XY : Integrable (fun i => X i * Y i) μ := by
  apply integrable_bounded_one
  intro i
  fin_cases i <;> norm_num [Y, X]

lemma memLp_X : MemLp X 2 μ := by
  apply MemLp.of_bound (p := 2) (by fun_prop) 1
  filter_upwards [] with i
  fin_cases i <;> norm_num [X]

lemma memLp_Y : MemLp Y 2 μ := by
  apply MemLp.of_bound (p := 2) (by fun_prop) 1
  filter_upwards [] with i
  fin_cases i <;> norm_num [Y, X]

lemma mean_X : ∫ i, X i ∂μ = 0 := by
  rw [show μ = (PMF.uniformOfFintype Ω).toMeasure by rfl, PMF.integral_eq_sum]
  norm_num [X, PMF.uniformOfFintype_apply, Fin.sum_univ_succ]

lemma mean_Y : ∫ i, Y i ∂μ = (2 : ℝ) / 3 := by
  rw [show μ = (PMF.uniformOfFintype Ω).toMeasure by rfl, PMF.integral_eq_sum]
  norm_num [Y, X, PMF.uniformOfFintype_apply, Fin.sum_univ_succ]

lemma mean_XY : ∫ i, X i * Y i ∂μ = 0 := by
  rw [show μ = (PMF.uniformOfFintype Ω).toMeasure by rfl, PMF.integral_eq_sum]
  norm_num [Y, X, PMF.uniformOfFintype_apply, Fin.sum_univ_succ]

lemma second_moment_Y : ∫ i, Y i ^ 2 ∂μ = (2 : ℝ) / 3 := by
  rw [show μ = (PMF.uniformOfFintype Ω).toMeasure by rfl, PMF.integral_eq_sum]
  norm_num [Y, X, PMF.uniformOfFintype_apply, Fin.sum_univ_succ]

lemma covariance_XY_zero :
    cov[X, Y; μ] = 0 := by
  rw [covariance_eq_sub memLp_X memLp_Y]
  change (∫ i, X i * Y i ∂μ) - (∫ i, X i ∂μ) * (∫ i, Y i ∂μ) = 0
  rw [mean_XY, mean_X, mean_Y]
  norm_num

lemma independent_covariance_eq_zero {α : Type*} [MeasurableSpace α]
    {ν : Measure α} [IsProbabilityMeasure ν] {f g : α → ℝ}
    (hf : MemLp f 2 ν) (hg : MemLp g 2 ν) (hfg : IndepFun f g ν) :
    cov[f, g; ν] = 0 := by
  rw [covariance_eq_sub hf hg]
  rw [hfg.integral_mul_eq_mul_integral hf.aestronglyMeasurable hg.aestronglyMeasurable]
  ring

lemma independent_product_integrable_generic {α : Type*} [MeasurableSpace α]
    {ν : Measure α} {f g : α → ℝ}
    (hfg : IndepFun f g ν) (hf : Integrable f ν) (hg : Integrable g ν) :
    Integrable (fun x => f x * g x) ν :=
  hfg.integrable_mul hf hg

lemma independent_integral_factorization_generic {α : Type*} [MeasurableSpace α]
    {ν : Measure α} {f g : α → ℝ}
    (hfg : IndepFun f g ν) (hf : Integrable f ν) (hg : Integrable g ν) :
    (∫ x, f x * g x ∂ν) = (∫ x, f x ∂ν) * (∫ x, g x ∂ν) :=
  hfg.integral_mul_eq_mul_integral hf.aestronglyMeasurable hg.aestronglyMeasurable

lemma variance_X : variance X μ = (2 : ℝ) / 3 := by
  rw [variance_eq_sub memLp_X]
  change (∫ i, X i ^ 2 ∂μ) - (∫ i, X i ∂μ) ^ 2 = (2 : ℝ) / 3
  rw [mean_X, show (fun i => X i ^ 2) = Y by rfl, mean_Y]
  norm_num

lemma variance_Y : variance Y μ = (2 : ℝ) / 9 := by
  rw [variance_eq_sub memLp_Y]
  change (∫ i, Y i ^ 2 ∂μ) - (∫ i, Y i ∂μ) ^ 2 = (2 : ℝ) / 9
  rw [second_moment_Y, mean_Y]
  norm_num

lemma not_indep_X_Y : ¬ IndepFun X Y μ := by
  intro h
  have hsets := h.measure_inter_preimage_eq_mul ({0} : Set ℝ) ({0} : Set ℝ)
    (measurableSet_singleton 0) (measurableSet_singleton 0)
  have hpre : X ⁻¹' ({0} : Set ℝ) = ({1} : Set Ω) := by
    ext i
    fin_cases i <;> norm_num [X]
  have hpreY : Y ⁻¹' ({0} : Set ℝ) = ({1} : Set Ω) := by
    ext i
    fin_cases i <;> norm_num [Y, X]
  have hleft : μ (X ⁻¹' ({0} : Set ℝ) ∩ Y ⁻¹' ({0} : Set ℝ)) = (3 : ℝ≥0∞)⁻¹ := by
    rw [hpre, hpreY]
    norm_num [μ, PMF.toMeasure_apply_singleton, PMF.uniformOfFintype_apply]
  have hx : μ (X ⁻¹' ({0} : Set ℝ)) = (3 : ℝ≥0∞)⁻¹ := by
    rw [hpre]
    norm_num [μ, PMF.toMeasure_apply_singleton, PMF.uniformOfFintype_apply]
  have hy : μ (Y ⁻¹' ({0} : Set ℝ)) = (3 : ℝ≥0∞)⁻¹ := by
    rw [hpreY]
    norm_num [μ, PMF.toMeasure_apply_singleton, PMF.uniformOfFintype_apply]
  rw [hleft, hx, hy] at hsets
  have hneq : (3 : ℝ≥0∞)⁻¹ ≠ (3 : ℝ≥0∞)⁻¹ * (3 : ℝ≥0∞)⁻¹ := by
    intro h
    have h' := congrArg ENNReal.toReal h
    norm_num at h'
  exact hneq hsets
end StochasticCalculusSuggested.IndependentLaws.ThreeAtomExample

namespace StochasticCalculusSuggested.IndependentLaws.FairCoinExample
noncomputable def μ : Measure (ℕ → Fin 2) :=
  Measure.infinitePi (fun (_ : ℕ) => (PMF.uniformOfFintype (Fin 2)).toMeasure)

instance : IsProbabilityMeasure μ := by
  dsimp [μ]
  infer_instance

/-- Every finite prescribed fair-coin outcome has its native product probability. -/
theorem cylinder_probability (S : Finset ℕ) (e : S → Fin 2) :
    μ {ω | S.restrict ω = e} = ((2 : ℝ≥0∞)⁻¹) ^ S.card := by
  change μ (S.restrict ⁻¹' ({e} : Set (S → Fin 2))) = _
  rw [← Measure.map_apply (by fun_prop) (measurableSet_singleton e)]
  simp [μ, Measure.infinitePi_map_restrict, Measure.pi_singleton,
    PMF.toMeasure_apply_singleton, PMF.uniformOfFintype_apply]

end StochasticCalculusSuggested.IndependentLaws.FairCoinExample

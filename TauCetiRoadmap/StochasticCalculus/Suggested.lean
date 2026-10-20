/-
Copyright (c) 2026 Kim Morrison. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib.MeasureTheory.Function.ConditionalLExpectation
import Mathlib.MeasureTheory.Function.FactorsThrough
import Mathlib.MeasureTheory.VectorMeasure.WithDensity
import Mathlib.MeasureTheory.VectorMeasure.WithDensityVec
import Mathlib.MeasureTheory.VectorMeasure.Variation.Basic
import Mathlib.MeasureTheory.Function.ConditionalExpectation.Real
import Mathlib.MeasureTheory.Function.UniformIntegrable
import Mathlib.MeasureTheory.Function.AEEqFun
import Mathlib.MeasureTheory.Function.ConvergenceInMeasure
import Mathlib.MeasureTheory.Integral.Bochner.Basic
import Mathlib.MeasureTheory.Integral.DivergenceTheorem
import Mathlib.MeasureTheory.Function.AbsolutelyContinuous
import Mathlib.Probability.BrownianMotion.Basic
import Mathlib.Probability.Process.LocalProperty
import Mathlib.Probability.Process.Adapted
import Mathlib.Topology.MetricSpace.Polish
import Mathlib.Probability.Process.Predictable
import Mathlib.Probability.Process.HittingTime
import Mathlib.Probability.Martingale.OptionalSampling
import Mathlib.MeasureTheory.Function.LpSpace.Complete
import Mathlib.MeasureTheory.Measure.Lebesgue.Basic
import Mathlib.Analysis.Calculus.IteratedDeriv.Defs
import Mathlib.Topology.Order.Cadlag
import TauCetiRoadmap.StochasticCalculus.RawLocalization

/-!
**This file is not the roadmap and is not exhaustive.** These are suggested forms;
the README is the definitive specification.

Representative construction interfaces for StochasticCalculus.
These are proposed targets, not completed proofs. The README specifies the full vector,
jump, localization, path-law, SDE and PDE APIs. Native objects are reused here. -/

noncomputable section
open MeasureTheory ProbabilityTheory
open scoped NNReal ENNReal ProbabilityTheory
namespace StochasticCalculusSuggested

variable {Ω : Type*} [mΩ : MeasurableSpace Ω]

/-! The source p184 countable-exception caveat follows from native FTC and
absolute continuity of indefinite Lebesgue integrals. -/
namespace CountableDerivative
open Set
open scoped Interval

theorem absolutelyContinuous_of_countable_exception
    {f f' : ℝ → ℝ} {a b : ℝ} {s : Set ℝ}
    (hab : a ≤ b) (hs : s.Countable) (hc : ContinuousOn f (Icc a b))
    (hd : ∀ x ∈ Ioo a b \ s, HasDerivAt f (f' x) x)
    (hi : IntervalIntegrable f' volume a b) :
    AbsolutelyContinuousOnInterval f a b := by
  have hp := hi.absolutelyContinuousOnInterval_intervalIntegral
    (c := a) left_mem_uIcc
  have hk : AbsolutelyContinuousOnInterval (fun _ : ℝ => f a) a b :=
    (LipschitzWith.const (f a)).lipschitzOnWith.absolutelyContinuousOnInterval
  apply (hp.add hk).congr
  intro x hx
  have hx' : x ∈ Icc a b := by simpa [uIcc_of_le hab] using hx
  have he := integral_eq_of_hasDerivAt_off_countable_of_le f f' hx'.1 hs
    (hc.mono (Icc_subset_Icc le_rfl hx'.2))
    (fun y hy => hd y ⟨⟨hy.1.1, hy.1.2.trans_le hx'.2⟩, hy.2⟩)
    (hi.mono_set (uIcc_subset_uIcc left_mem_uIcc hx))
  change (∫ v in a..x, f' v) + f a = f x
  linarith

theorem boundedVariation_of_countable_exception
    {f f' : ℝ → ℝ} {a b : ℝ} {s : Set ℝ}
    (hab : a ≤ b) (hs : s.Countable) (hc : ContinuousOn f (Icc a b))
    (hd : ∀ x ∈ Ioo a b \ s, HasDerivAt f (f' x) x)
    (hi : IntervalIntegrable f' volume a b) :
    BoundedVariationOn f (uIcc a b) :=
  (absolutelyContinuous_of_countable_exception hab hs hc hd hi).boundedVariationOn

end CountableDerivative

/-! S0.1 uses Mathlib's existing a.e.-equivalence carrier as the underlying data, but places
its L⁰ topology on a distinct wrapper. This prevents an L⁰ metric instance from changing the
ambient metric/topology of `AEEqFun` (including instances used internally by `Lp`). -/
namespace L0Metric

open Filter

variable (P : Measure Ω)

/-- A dedicated real L⁰ carrier. The field is Mathlib's existing a.e.-equivalence class;
this wrapper is intentionally a structure, not an abbreviation, so its metric cannot leak
onto `AEEqFun`. -/
structure RealL0 where
  toAEEqFun : Ω →ₘ[P] ℝ

namespace RealL0

def ofAEEqFun (f : Ω →ₘ[P] ℝ) : RealL0 (P := P) := ⟨f⟩

@[ext]
theorem ext {f g : RealL0 (P := P)} (h : f.toAEEqFun = g.toAEEqFun) : f = g := by
  cases f
  cases g
  cases h
  rfl

def equivAEEqFun : RealL0 (P := P) ≃ (Ω →ₘ[P] ℝ) where
  toFun := RealL0.toAEEqFun
  invFun := RealL0.ofAEEqFun P
  left_inv := by intro f; cases f; rfl
  right_inv := by intro f; rfl


end RealL0

/-- The bounded scalar kernel used for the L⁰ metric presentation. -/
noncomputable def kernel (x y : ℝ) : ℝ := |x - y| / (1 + |x - y|)

@[fun_prop]
theorem continuous_kernel : Continuous (Function.uncurry kernel) := by
  change Continuous (fun p : ℝ × ℝ => |p.1 - p.2| / (1 + |p.1 - p.2|))
  have hn : Continuous (fun p : ℝ × ℝ => |p.1 - p.2|) :=
    continuous_abs.comp (continuous_fst.sub continuous_snd)
  have hd : Continuous (fun p : ℝ × ℝ => 1 + |p.1 - p.2|) :=
    continuous_const.add hn
  exact hn.div hd (by intro p; positivity)

theorem kernel_nonneg (x y : ℝ) : 0 ≤ kernel x y := by
  simp only [kernel]
  positivity

theorem kernel_le_one (x y : ℝ) : kernel x y ≤ 1 := by
  simp only [kernel]
  rw [div_le_one₀ (by positivity)]
  linarith

/-- Scalar triangle inequality for the bounded absolute-difference kernel. -/
theorem kernel_triangle (x y z : ℝ) : kernel x z ≤ kernel x y + kernel y z := by
  simp only [kernel]
  have hxy : 0 ≤ |x - y| := abs_nonneg _
  have hyz : 0 ≤ |y - z| := abs_nonneg _
  calc
    |x - z| / (1 + |x - z|) ≤
        (|x - y| + |y - z|) / (1 + (|x - y| + |y - z|)) := by
      rw [div_le_div_iff₀ (by positivity) (by positivity)]
      nlinarith [abs_sub_le x y z]
    _ ≤ |x - y| / (1 + |x - y|) + |y - z| / (1 + |y - z|) := by
      have h1 : 0 < 1 + |x - y| := by positivity
      have h2 : 0 < 1 + |y - z| := by positivity
      have h3 : 0 < 1 + (|x - y| + |y - z|) := by positivity
      field_simp
      have hab : 0 ≤ |x - y| * |y - z| := mul_nonneg hxy hyz
      nlinarith [hab]

/-- The kernel applied to two AEEqFun representatives is integrable on a finite measure space. -/
theorem kernel_integrable [IsFiniteMeasure P] (f g : Ω →ₘ[P] ℝ) :
    Integrable (fun ω => kernel (f ω) (g ω)) P := by
  have hf : AEStronglyMeasurable (fun ω => kernel (f ω) (g ω)) P := by
    have hpair : Measurable (fun ω => (f ω, g ω)) :=
      (f.stronglyMeasurable.prodMk g.stronglyMeasurable).measurable
    exact (continuous_kernel.measurable.comp hpair).aestronglyMeasurable
  apply Integrable.mono' (integrable_const (1 : ℝ)) hf
  filter_upwards with ω
  have hk := kernel_le_one (f ω) (g ω)
  have hn := kernel_nonneg (f ω) (g ω)
  rw [Real.norm_eq_abs, abs_of_nonneg hn]
  exact hk

/-- The bounded integral distance on existing a.e.-equivalence classes. This auxiliary
function does not install a metric instance on `AEEqFun`. -/
noncomputable def distance (f g : Ω →ₘ[P] ℝ) : ℝ :=
  ∫ ω, kernel (f ω) (g ω) ∂P

theorem distance_nonneg (f g : Ω →ₘ[P] ℝ) : 0 ≤ distance P f g := by
  apply integral_nonneg
  intro ω
  exact kernel_nonneg _ _

theorem distance_self (f : Ω →ₘ[P] ℝ) : distance P f f = 0 := by
  simp [distance, kernel]

theorem distance_comm (f g : Ω →ₘ[P] ℝ) : distance P f g = distance P g f := by
  unfold distance
  apply integral_congr_ae
  filter_upwards with ω
  simp [kernel, abs_sub_comm]

theorem distance_le_one [IsProbabilityMeasure P] (f g : Ω →ₘ[P] ℝ) : distance P f g ≤ 1 := by
  have hi := kernel_integrable P f g
  calc
    distance P f g ≤ ∫ _ : Ω, (1 : ℝ) ∂P :=
      integral_mono_ae hi (integrable_const (1 : ℝ)) <| Filter.Eventually.of_forall fun ω => kernel_le_one (f ω) (g ω)
    _ = 1 := by simp

theorem distance_triangle [IsFiniteMeasure P] (f g h : Ω →ₘ[P] ℝ) :
    distance P f h ≤ distance P f g + distance P g h := by
  have hfg := kernel_integrable P f g
  have hgh := kernel_integrable P g h
  have hfh := kernel_integrable P f h
  calc
    distance P f h ≤ ∫ ω, (kernel (f ω) (g ω) + kernel (g ω) (h ω)) ∂P := by
      unfold distance
      exact integral_mono_ae hfh (hfg.add hgh) <| Filter.Eventually.of_forall fun ω => kernel_triangle (f ω) (g ω) (h ω)
    _ = distance P f g + distance P g h := by
      simp only [distance]
      exact integral_add hfg hgh

theorem kernel_eq_zero_iff (x y : ℝ) : kernel x y = 0 ↔ x = y := by
  simp only [kernel, div_eq_zero_iff, abs_eq_zero]
  constructor
  · rintro (h | h)
    · exact sub_eq_zero.mp h
    · exfalso
      have hn := abs_nonneg (x - y)
      linarith
  · intro h
    subst y
    left
    simp

theorem eq_of_distance_eq_zero [IsFiniteMeasure P] {f g : Ω →ₘ[P] ℝ}
    (h : distance P f g = 0) : f = g := by
  have hint := kernel_integrable P f g
  have hnonneg : 0 ≤ᵐ[P] fun ω => kernel (f ω) (g ω) :=
    Filter.Eventually.of_forall fun ω => kernel_nonneg (f ω) (g ω)
  have hzero := (integral_eq_zero_iff_of_nonneg_ae hnonneg hint).mp h
  apply AEEqFun.ext
  filter_upwards [hzero] with ω hw
  exact (kernel_eq_zero_iff (f ω) (g ω)).mp hw

/-- The L⁰ metric lives globally on the distinct wrapper, never on Mathlib's `AEEqFun`. -/
noncomputable instance metricSpaceRealL0 [IsFiniteMeasure P] : MetricSpace (RealL0 (P := P)) where
  toPseudoMetricSpace := {
    dist := fun f g => distance P f.toAEEqFun g.toAEEqFun
    dist_self := fun f => distance_self P f.toAEEqFun
    dist_comm := fun f g => distance_comm P f.toAEEqFun g.toAEEqFun
    dist_triangle := fun f g h => distance_triangle P f.toAEEqFun g.toAEEqFun h.toAEEqFun
  }
  eq_of_dist_eq_zero := by
    intro f g h
    apply RealL0.ext
    exact eq_of_distance_eq_zero P h

/-- Lp convergence controls the wrapper's L⁰ metric through native convergence in measure.
The finite-measure assumption also makes the bounded-integral metric well-defined. -/
theorem continuous_equivAEEqFun_symm_coe [IsFiniteMeasure P] {p : ℝ≥0∞}
    [Fact (1 ≤ p)] :
    Continuous ((RealL0.equivAEEqFun (P := P)).symm ∘
      (fun f : Lp ℝ p P => f.1)) := by
  sorry

/-- The distance between `mk` classes is the integral of the original representatives.
This is the explicit `coeFn_mk` almost-everywhere rewrite used by the convergence bridge. -/
theorem distance_mk_eq {f g : Ω → ℝ}
    (hf : AEStronglyMeasurable f P) (hg : AEStronglyMeasurable g P) :
    distance P (AEEqFun.mk f hf) (AEEqFun.mk g hg) = ∫ ω, kernel (f ω) (g ω) ∂P := by
  unfold distance
  apply integral_congr_ae
  have h_f := AEEqFun.coeFn_mk f hf
  have h_g := AEEqFun.coeFn_mk g hg
  filter_upwards [h_f, h_g] with ω hωf hωg
  rw [hωf, hωg]

/-- Metric convergence of measurable representatives, stated on the distinct L⁰ carrier. -/
theorem tendsto_iff_tendstoInMeasure [IsFiniteMeasure P] {ι : Type*} {l : Filter ι}
    (f : ι → Ω → ℝ) (hf : ∀ i, AEStronglyMeasurable (f i) P)
    (g : Ω → ℝ) (hg : AEStronglyMeasurable g P) :
    Tendsto (fun i => RealL0.ofAEEqFun P (AEEqFun.mk (f i) (hf i))) l
      (nhds (RealL0.ofAEEqFun P (AEEqFun.mk g hg))) ↔ TendstoInMeasure P f l g := by
  rw [tendsto_iff_dist_tendsto_zero]
  change Tendsto (fun i => distance P (AEEqFun.mk (f i) (hf i)) (AEEqFun.mk g hg)) l (nhds 0) ↔ _
  simp_rw [distance_mk_eq P (hf _) hg]
  sorry

end L0Metric

/-! Metric compatibility for the `Lp` subtype: `Lp.dist_eq_norm` identifies its ambient
normed-space distance with the subtype metric used by the Itô integral interfaces. -/
example (P : Measure Ω) [IsProbabilityMeasure P] (f g : Lp ℝ 2 P) :
    dist f g = ‖-f + g‖ := by
  exact Lp.dist_eq_norm f g

/-- Conditional expectations of one integrable terminal variable dominate a uniformly
integrable family, with no countability or ordering condition on the index. -/
theorem uniformIntegrable_of_condExp_dom {ι : Type*} (P : Measure Ω) [IsFiniteMeasure P]
    (F : ι → MeasurableSpace Ω) (hF : ∀ i, F i ≤ mΩ)
    (Z : Ω → ℝ) (hZ : Integrable Z P) (Y : ι → Ω → ℝ)
    (hY : ∀ i, AEStronglyMeasurable (Y i) P)
    (hdom : ∀ i, (fun ω => ‖Y i ω‖ₑ) ≤ᵐ[P] fun ω => ‖(P[Z | F i]) ω‖ₑ) :
    UniformIntegrable Y 1 P := by
  have hUI := hZ.uniformIntegrable_condExp hF
  refine ⟨hUI.1.ae_mono hY hdom, ?_⟩
  obtain ⟨C, hC⟩ := hUI.2
  refine ⟨C, fun i => ?_⟩
  exact (eLpNorm_mono_enorm_ae (hY i) (hdom i)).trans (hC i)

/-- S2.1 nonnegative tower law on the native conditional Lebesgue expectation. -/
theorem condLExp_tower (P : Measure Ω) [IsProbabilityMeasure P]
    (G H : MeasurableSpace Ω) (hGH : G ≤ H) (hHm : H ≤ mΩ)
    (X : Ω → ℝ≥0∞) :
    P⁻[P⁻[X | H] | G] =ᵐ[P] P⁻[X | G] := by
  apply ae_eq_condLExp (hGH.trans hHm) P X (measurable_condLExp G P _)
  intro s hs
  rw [setLIntegral_condLExp (hGH.trans hHm) P _ hs,
    setLIntegral_condLExp hHm P X (hGH s hs)]

/-- S2.1 signed conditional expectation by a measurable integrable exhaustion.
The conclusion uses actual native localized conditional expectations. -/
theorem exists_sigmaIntegrable_condExp (P : Measure Ω) [IsProbabilityMeasure P]
    (G : MeasurableSpace Ω) (hG : G ≤ mΩ) (X : Ω → ℝ) (hX : Measurable X)
    (A : ℕ → Set Ω) (hA : ∀ n, MeasurableSet[G] (A n)) (hmono : Monotone A)
    (hcover : ∀ᵐ ω ∂P, ∃ n, ω ∈ A n)
    (hInt : ∀ n, Integrable ((A n).indicator X) P) :
    ∃ Y : Ω → ℝ, Measurable[G] Y ∧
      ∀ n, (A n).indicator Y =ᵐ[P] P[(A n).indicator X | G] := by
  sorry

/-- The localized identities determine the signed conditional expectation a.e. -/
theorem sigmaIntegrable_condExp_unique (P : Measure Ω)
    (G : MeasurableSpace Ω) (X Y Z : Ω → ℝ) (A : ℕ → Set Ω)
    (hcover : ∀ᵐ ω ∂P, ∃ n, ω ∈ A n)
    (hY : ∀ n, (A n).indicator Y =ᵐ[P] P[(A n).indicator X | G])
    (hZ : ∀ n, (A n).indicator Z =ᵐ[P] P[(A n).indicator X | G]) :
    Y =ᵐ[P] Z := by
  have heq : ∀ᵐ ω ∂P, ∀ n, (A n).indicator Y ω = (A n).indicator Z ω := by
    rw [ae_all_iff]
    intro n
    exact (hY n).trans (hZ n).symm
  filter_upwards [hcover, heq] with ω hω he
  obtain ⟨n, hn⟩ := hω
  simpa [Set.indicator_of_mem hn] using he n

/-- Equality on one common full-measure set, stronger than equality of versions. -/
def Indistinguishable (P : Measure Ω) (X Y : ℝ≥0 → Ω → ℝ) : Prop :=
  ∀ᵐ ω ∂P, ∀ t, X t ω = Y t ω

/-- Brownian relative to a specified filtration, not merely Brownian marginal laws. -/
def IsFilteredBrownian (F : Filtration ℝ≥0 mΩ)
    (P : Measure Ω) (B : ℝ≥0 → Ω → ℝ) : Prop :=
  IsBrownianReal B P ∧ StronglyAdapted F B ∧
    ∀ s t, s ≤ t → Indep (MeasurableSpace.comap (fun ω => B t ω - B s ω)
      (borel ℝ)) (F s) P

/-- Native localization convention includes the indicator at initial time. -/
abbrev IsLocalMartingale (F : Filtration ℝ≥0 mΩ)
    (P : Measure Ω) (M : ℝ≥0 → Ω → ℝ) : Prop :=
  Locally (fun Y => Martingale Y F P) F M P

/-- Proposed stand-in for PointProcesses' single shared `nnvolume` declaration (Layer 4).
Consume that supplier and prove its restrictions to `Set.Ioc 0 T` agree with the
finite-horizon time-measure carrier used by these stochastic integrals. -/
def nnvolume : Measure ℝ≥0 := Measure.comap ((↑) : ℝ≥0 → ℝ) volume

/-- Lebesgue time measure on a finite positive-time interval. -/
def timeMeasure (T : ℝ≥0) : Measure ℝ≥0 := nnvolume.restrict (Set.Ioc 0 T)

/-- The predictable sigma algebra is a subalgebra of the ambient product algebra. -/
theorem predictable_le_prod (F : Filtration ℝ≥0 mΩ) :
    F.predictable ≤ (inferInstance : MeasurableSpace ℝ≥0).prod mΩ := by
  refine measurableSpace_le_predictable_of_measurableSet ?_ ?_
  · intro A hA
    exact (measurableSet_singleton (0 : ℝ≥0)).prod (F.le 0 A hA)
  · intro t A hA
    exact measurableSet_Ioi.prod (F.le t A hA)

/-- The actual measure on the predictable measurable space, obtained by trimming. -/
def predictableMeasure (F : Filtration ℝ≥0 mΩ)
    (P : Measure Ω) (T : ℝ≥0) : @Measure (ℝ≥0 × Ω) F.predictable :=
  ((timeMeasure T).prod P).trim (predictable_le_prod F)

abbrev PredictableL2 (F : Filtration ℝ≥0 mΩ)
    (P : Measure Ω) (T : ℝ≥0) :=
  @Lp (ℝ≥0 × Ω) ℝ F.predictable inferInstance 2 (predictableMeasure F P T)

/- Given a progressively measurable real process, produce a strongly predictable
representative on every finite horizon, equal almost everywhere for the ambient
Lebesgue-time × probability measure. The equality is deliberately not stated in the
trimmed predictable measure: an ambient-null set need not have a predictable null envelope.
This is only an almost-everywhere representative, not pointwise equality or
indistinguishability. L² integrability is a separate hypothesis when the representative is
used as a Brownian-integral class. -/
theorem exists_stronglyPredictable_ae_of_progressive
    (F : Filtration ℝ≥0 mΩ) (P : Measure Ω) [IsProbabilityMeasure P]
    (H : ℝ≥0 → Ω → ℝ) (hH : IsProgressive F H) :
    ∃ K : ℝ≥0 → Ω → ℝ, IsStronglyPredictable F K ∧
      ∀ T, Function.uncurry K =ᵐ[(timeMeasure T).prod P] Function.uncurry H := by
  sorry

/-- Constructed by completing elementary predictable integrands, with zero initial value. -/
def itoIntegralCLM (F : Filtration ℝ≥0 mΩ)
    (P : Measure Ω) [IsProbabilityMeasure P] (T : ℝ≥0)
    (B : ℝ≥0 → Ω → ℝ) (hB : IsFilteredBrownian F P B) :
    PredictableL2 F P T →L[ℝ] Lp ℝ 2 P := by
  sorry

theorem itoIntegralCLM_isometry (F : Filtration ℝ≥0 mΩ)
    (P : Measure Ω) [IsProbabilityMeasure P] (T : ℝ≥0)
    (B : ℝ≥0 → Ω → ℝ) (hB : IsFilteredBrownian F P B) :
    Isometry (itoIntegralCLM F P T B hB) := by
  sorry

/-- A jointly measurable selected version of the stopped/local integral process.
Its specification theorems below apply to predictable pathwise time-square-integrable H. -/
def itoIntegral (F : Filtration ℝ≥0 mΩ) (P : Measure Ω)
    (B H : ℝ≥0 → Ω → ℝ) : ℝ≥0 → Ω → ℝ := by
  sorry

/-- The Brownian integrability domain, explicitly on each finite horizon. -/
def BrownianIntegrable (F : Filtration ℝ≥0 mΩ)
    (P : Measure Ω) (H : ℝ≥0 → Ω → ℝ) : Prop :=
  IsStronglyPredictable F H ∧ ∀ T, MemLp (Function.uncurry H) 2 ((timeMeasure T).prod P)

/-- Predictable measurability transfers finite-horizon L² integrability to the trim. -/
theorem predictable_memLp (F : Filtration ℝ≥0 mΩ) (P : Measure Ω)
    (H : ℝ≥0 → Ω → ℝ) (hH : BrownianIntegrable F P H) (T : ℝ≥0) :
    @MemLp (ℝ≥0 × Ω) ℝ F.predictable _ _
      (Function.uncurry H) 2 (predictableMeasure F P T) := by
  change eLpNorm _ _ _ < ∞
  rw [predictableMeasure, eLpNorm_trim (predictable_le_prod F) hH.1]
  exact hH.2 T

/-- The predictable equivalence class, with its explicit representative theorem. -/
def predictableClass (F : Filtration ℝ≥0 mΩ) (P : Measure Ω)
    (H : ℝ≥0 → Ω → ℝ) (hH : BrownianIntegrable F P H) (T : ℝ≥0) :
    PredictableL2 F P T :=
  (predictable_memLp F P H hH T).toLp (Function.uncurry H)

theorem predictableClass_coe (F : Filtration ℝ≥0 mΩ) (P : Measure Ω)
    (H : ℝ≥0 → Ω → ℝ) (hH : BrownianIntegrable F P H) (T : ℝ≥0) :
    (predictableClass F P H hH T : (ℝ≥0 × Ω) → ℝ) =ᵐ[predictableMeasure F P T]
      Function.uncurry H := by
  exact MemLp.coeFn_toLp (predictable_memLp F P H hH T)

/-- Pin the process version to the completed L² construction. -/
theorem itoIntegral_eq_CLM (F : Filtration ℝ≥0 mΩ)
    (P : Measure Ω) [IsProbabilityMeasure P] (B H : ℝ≥0 → Ω → ℝ)
    (hB : IsFilteredBrownian F P B) (hH : BrownianIntegrable F P H) (T : ℝ≥0)
    (v : PredictableL2 F P T)
    (hv : (v : (ℝ≥0 × Ω) → ℝ) =ᵐ[predictableMeasure F P T] Function.uncurry H)
    (w : Lp ℝ 2 P)
    (hw : (v, w) ∈ (itoIntegralCLM F P T B hB).toLinearMap.graph) :
    itoIntegral F P B H T =ᵐ[P] (w : Ω → ℝ) := by
  sorry

/-- Elementary normalization prevents a zero/junk isometry construction. -/
theorem itoIntegral_const (F : Filtration ℝ≥0 mΩ)
    (P : Measure Ω) [IsProbabilityMeasure P] (B : ℝ≥0 → Ω → ℝ)
    (hB : IsFilteredBrownian F P B) (c : ℝ) :
    ∀ᵐ ω ∂P, ∀ t, itoIntegral F P B (fun _ _ => c) t ω = c * B t ω := by
  sorry

/-- Predictable rectangles fix the elementary integrals; density plus the isometry
then uniquely determines the completion on its entire domain. -/
theorem itoIntegral_rectangle (F : Filtration ℝ≥0 mΩ)
    (P : Measure Ω) [IsProbabilityMeasure P] (B : ℝ≥0 → Ω → ℝ)
    (hB : IsFilteredBrownian F P B) (s t : ℝ≥0) (hst : s ≤ t)
    (ξ : Ω → ℝ) (hξ : StronglyMeasurable[F s] ξ) (C : ℝ≥0)
    (hBound : ∀ ω, |ξ ω| ≤ C) :
    ∀ᵐ ω ∂P, ∀ r,
      itoIntegral F P B (fun v ω => if v ∈ Set.Ioc s t then ξ ω else 0) r ω =
        ξ ω * (B (min r t) ω - B (min r s) ω) := by
  sorry

theorem itoIntegral_martingale (F : Filtration ℝ≥0 mΩ)
    (P : Measure Ω) [IsProbabilityMeasure P] (B H : ℝ≥0 → Ω → ℝ)
    (hB : IsFilteredBrownian F P B) (hH : BrownianIntegrable F P H) :
    Martingale (itoIntegral F P B H) F P ∧
      IsStronglyProgressive F (itoIntegral F P B H) ∧
      (∀ᵐ ω ∂P, Continuous (fun t => itoIntegral F P B H t ω)) := by
  sorry

/-- Local domain: finite energy on every compact time interval, not expectation L². -/
def LocallyBrownianIntegrable (F : Filtration ℝ≥0 mΩ)
    (P : Measure Ω) (H : ℝ≥0 → Ω → ℝ) : Prop :=
  IsStronglyPredictable F H ∧
    ∀ᵐ ω ∂P, ∀ T, Integrable (fun t => (H t ω)^2) (timeMeasure T)

/-- Compatibility of actual stopped integral processes and local L² constructions. -/
theorem itoIntegral_local_spec (F : Filtration ℝ≥0 mΩ)
    (P : Measure Ω) [IsProbabilityMeasure P] (B H : ℝ≥0 → Ω → ℝ)
    (hB : IsFilteredBrownian F P B) (hH : LocallyBrownianIntegrable F P H) :
    IsLocalMartingale F P (itoIntegral F P B H) ∧
    IsStronglyProgressive F (itoIntegral F P B H) ∧
    (∀ᵐ ω ∂P, Continuous (fun t => itoIntegral F P B H t ω)) ∧
    ∃ τ : ℕ → Ω → WithTop ℝ≥0, IsLocalizingSequence F τ P ∧ ∀ n,
      BrownianIntegrable F P (fun t ω => if (t : WithTop ℝ≥0) ≤ τ n ω then H t ω else 0) ∧
      Indistinguishable P (stoppedProcess (itoIntegral F P B H) (τ n))
        (itoIntegral F P B (fun t ω => if (t : WithTop ℝ≥0) ≤ τ n ω then H t ω else 0)) := by
  sorry

theorem itoIntegral_congr (F : Filtration ℝ≥0 mΩ)
    (P : Measure Ω) [IsProbabilityMeasure P] (B H K : ℝ≥0 → Ω → ℝ)
    (hB : IsFilteredBrownian F P B) (hH : BrownianIntegrable F P H)
    (hK : BrownianIntegrable F P K)
    (hHK : ∀ T, Function.uncurry H =ᵐ[(timeMeasure T).prod P] Function.uncurry K) :
    Indistinguishable P (itoIntegral F P B H) (itoIntegral F P B K) := by
  sorry

/-- Local Itô integral independence of the predictable product-a.e. representative.
Use a common energy localizer for H and K before applying the L² congruence theorem. -/
theorem itoIntegral_local_congr (F : Filtration ℝ≥0 mΩ)
    (P : Measure Ω) [IsProbabilityMeasure P] (B H K : ℝ≥0 → Ω → ℝ)
    (hB : IsFilteredBrownian F P B) (hH : LocallyBrownianIntegrable F P H)
    (hK : LocallyBrownianIntegrable F P K)
    (hHK : ∀ T, Function.uncurry H =ᵐ[(timeMeasure T).prod P] Function.uncurry K) :
    Indistinguishable P (itoIntegral F P B H) (itoIntegral F P B K) := by
  sorry

/-- Continuous local-martingale quadratic variation, constructed by square compensation
and recovered as the UCP limit of partition sums. Not the jump predictable bracket. -/
def quadraticVariation (F : Filtration ℝ≥0 mΩ) (P : Measure Ω)
    (M : ℝ≥0 → Ω → ℝ) : ℝ≥0 → Ω → ℝ := by
  sorry

/-- Square decomposition pins QV for all continuous local martingales. On a raw filtration,
first obtain `exists_raw_bounded_localizer` for M and apply the bounded-martingale square
identity to each returned stopped martingale, then pass to the localized limit. This route
avoids flattening nested `Locally` predicates, whose native flattening API assumes
right-continuity. -/
theorem quadraticVariation_spec (F : Filtration ℝ≥0 mΩ)
    (P : Measure Ω) [IsProbabilityMeasure P] (M : ℝ≥0 → Ω → ℝ)
    (hM : IsLocalMartingale F P M) (hCont : ∀ᵐ ω ∂P, Continuous (fun t => M t ω)) :
    StronglyAdapted F (quadraticVariation F P M) ∧
    IsStronglyProgressive F (quadraticVariation F P M) ∧
    (∀ᵐ ω ∂P, Continuous (fun t => quadraticVariation F P M t ω) ∧
      Monotone (fun t => quadraticVariation F P M t ω) ∧ quadraticVariation F P M 0 ω = 0) ∧
    IsLocalMartingale F P (fun t ω => (M t ω)^2 - (M 0 ω)^2 -
      quadraticVariation F P M t ω) := by
  sorry

theorem brownian_quadraticVariation (F : Filtration ℝ≥0 mΩ)
    (P : Measure Ω) [IsProbabilityMeasure P] (B : ℝ≥0 → Ω → ℝ)
    (hB : IsFilteredBrownian F P B) :
    ∀ᵐ ω ∂P, ∀ t, quadraticVariation F P B t ω = (t : ℝ) := by
  sorry

/-- S5.5 original-process Lévy characterization on a raw filtration. Bare native
locality does not supply the literal strong-adaptation hypothesis. All time identities
and path continuity are on common full-measure events. -/
theorem levy_characterization_adapted (F : Filtration ℝ≥0 mΩ)
    (P : Measure Ω) [IsProbabilityMeasure P] (M : ℝ≥0 → Ω → ℝ)
    (hAdapt : StronglyAdapted F M) (hLocal : IsLocalMartingale F P M)
    (hCont : ∀ᵐ ω ∂P, Continuous (fun t => M t ω))
    (hZero : ∀ᵐ ω ∂P, M 0 ω = 0)
    (hQV : ∀ᵐ ω ∂P, ∀ t, quadraticVariation F P M t ω = (t : ℝ)) :
    IsFilteredBrownian F P M := by
  sorry

/-- S5.5 bare-locality interface: select an indistinguishable predictable Brownian
version via the adapted surrogate and lagged predictable approximation. This conclusion
does not assert adaptation of the arbitrary original representative. -/
theorem exists_predictable_brownian_of_localMartingale (F : Filtration ℝ≥0 mΩ)
    (P : Measure Ω) [IsProbabilityMeasure P] (M : ℝ≥0 → Ω → ℝ)
    (hLocal : IsLocalMartingale F P M)
    (hCont : ∀ᵐ ω ∂P, Continuous (fun t => M t ω))
    (hZero : ∀ᵐ ω ∂P, M 0 ω = 0)
    (hQV : ∀ᵐ ω ∂P, ∀ t, quadraticVariation F P M t ω = (t : ℝ)) :
    ∃ B, IsFilteredBrownian F P B ∧ IsStronglyPredictable F B ∧
      Indistinguishable P M B := by
  sorry

/-- The native Brownian law/continuity predicate plus locality and literal adaptation
implies the filtration-relative Brownian conclusion. Future independence is proved. -/
theorem filteredBrownian_of_brownianLaw_localMartingale (F : Filtration ℝ≥0 mΩ)
    (P : Measure Ω) [IsProbabilityMeasure P] (M : ℝ≥0 → Ω → ℝ)
    (hLaw : IsBrownianReal M P) (hLocal : IsLocalMartingale F P M)
    (hAdapt : StronglyAdapted F M) : IsFilteredBrownian F P M := by
  sorry

/-- Lagged predictable approximations select a predictable version even when the
raw Brownian predicate asserts continuity only almost surely. -/
theorem exists_predictable_brownian_version (F : Filtration ℝ≥0 mΩ)
    (P : Measure Ω) [IsProbabilityMeasure P] (B : ℝ≥0 → Ω → ℝ)
    (hB : IsFilteredBrownian F P B) :
    ∃ B', IsFilteredBrownian F P B' ∧ IsStronglyPredictable F B' ∧
      Indistinguishable P B B' := by
  sorry

/-- Final C² Itô target, not only a bounded C³ intermediate proof. The integral
is localized; no global L² assumption on f′(B) is necessary. This representative-level
signature uses `hPred`; the general README theorem first uses the S0.2 selected Brownian
version and the S3.2 product-a.e. integrand adapter, then transfers by indistinguishability. -/
theorem brownian_ito_C2 (F : Filtration ℝ≥0 mΩ)
    (P : Measure Ω) [IsProbabilityMeasure P] (B : ℝ≥0 → Ω → ℝ)
    (hB : IsFilteredBrownian F P B) (f : ℝ → ℝ) (hf : ContDiff ℝ 2 f)
    (hPred : IsStronglyPredictable F (fun s ω => deriv f (B s ω))) :
    ∀ᵐ ω ∂P, ∀ t, f (B t ω) = f 0 +
      itoIntegral F P B (fun s ω => deriv f (B s ω)) t ω +
      (1 / 2 : ℝ) * ∫ s, iteratedDeriv 2 f (B s ω) ∂timeMeasure t := by
  sorry

/-- A finite-horizon Cameron–Martin path together with its specified velocity. -/
def IsCameronMartinShift (T : ℝ≥0) (h u : ℝ≥0 → ℝ) : Prop :=
  StronglyMeasurable u ∧ MemLp u 2 (timeMeasure T) ∧
    ∀ t, t ≤ T → h t = ∫ s, u s ∂timeMeasure t

/-- The Cameron–Martin path starts at zero because the time-zero measure is empty. -/
theorem IsCameronMartinShift.initial_zero {T : ℝ≥0} {h u : ℝ≥0 → ℝ}
    (hh : IsCameronMartinShift T h u) : h 0 = 0 := by
  rcases hh with ⟨_, _, hpath⟩
  rw [hpath 0 bot_le]
  simp [timeMeasure, nnvolume]

/-- Candidate stochastic exponential; a true-density theorem requires additional criteria. -/
def stochasticExponential (F : Filtration ℝ≥0 mΩ) (P : Measure Ω)
    (B θ : ℝ≥0 → Ω → ℝ) (t : ℝ≥0) (ω : Ω) : ℝ :=
  Real.exp (itoIntegral F P B θ t ω -
    (1 / 2 : ℝ) * ∫ s, (θ s ω)^2 ∂timeMeasure t)

/-- Novikov is a sufficient condition; the stochastic exponential must not be assumed
integrable simply because it is a positive local martingale. -/
theorem novikov_expectation (F : Filtration ℝ≥0 mΩ)
    (P : Measure Ω) [IsProbabilityMeasure P] (B θ : ℝ≥0 → Ω → ℝ)
    (hB : IsFilteredBrownian F P B) (hθ : LocallyBrownianIntegrable F P θ)
    (T : ℝ≥0)
    (hN : Integrable (fun ω => Real.exp ((1 / 2 : ℝ) *
      ∫ s, (θ s ω)^2 ∂timeMeasure T)) P) :
    (∫ ω, stochasticExponential F P B θ T ω ∂P) = 1 := by
  sorry

/-- A nonzero Bochner integral cannot be the totalized value of a nonintegrable function. -/
theorem integrable_of_ne_zero_integral {P : Measure Ω} {f : Ω → ℝ}
    (h : (∫ ω, f ω ∂P) ≠ 0) : Integrable f P := by
  by_contra hfi
  exact h (integral_undef hfi)

/-- Filtration-relative Brownian laws on one declared horizon. -/
def IsBrownianOn (F : Filtration ℝ≥0 mΩ) (P : Measure Ω)
    (T : ℝ≥0) (B : ℝ≥0 → Ω → ℝ) : Prop :=
  (∀ᵐ ω ∂P, B 0 ω = 0) ∧
    (∀ᵐ ω ∂P, ContinuousOn (fun t => B t ω) (Set.Iic T)) ∧ StronglyAdapted F B ∧
    ∀ s t, s ≤ t → t ≤ T →
      HasLaw (fun ω => B t ω - B s ω) (gaussianReal 0 (t-s)) P ∧
      Indep (MeasurableSpace.comap (fun ω => B t ω - B s ω) (borel ℝ)) (F s) P

/-- Positive-sign density yields a minus-sign drift correction, only up to T. -/
theorem girsanov_on_horizon (F : Filtration ℝ≥0 mΩ)
    (P : Measure Ω) [IsProbabilityMeasure P] (B θ : ℝ≥0 → Ω → ℝ)
    (hB : IsFilteredBrownian F P B) (hθ : LocallyBrownianIntegrable F P θ) (T : ℝ≥0)
    (hZ : (∫ ω, stochasticExponential F P B θ T ω ∂P) = 1) :
    IsBrownianOn F
      (P.withDensity (fun ω => ENNReal.ofReal (stochasticExponential F P B θ T ω))) T
      (fun t ω => B t ω - ∫ s, θ s ω ∂timeMeasure t) := by
  have hInt : Integrable (stochasticExponential F P B θ T) P :=
    integrable_of_ne_zero_integral (P := P) (by rw [hZ]; norm_num)
  sorry

/-- Cameron–Martin pushforward dictionary on finite-horizon coordinates.
The path-space Borel upgrade is S8.2. Cutoff makes the integrand a genuine global
local-domain member without assumptions on u after T. -/
theorem cameronMartin_pushforward (F : Filtration ℝ≥0 mΩ)
    (P : Measure Ω) [IsProbabilityMeasure P] (B : ℝ≥0 → Ω → ℝ)
    (hB : IsFilteredBrownian F P B) (T : ℝ≥0) (h u : ℝ≥0 → ℝ)
    (hshift : IsCameronMartinShift T h u) :
    P.map (fun ω (t : Set.Iic T) => B t.val ω + h t.val) =
      (P.withDensity (fun ω => ENNReal.ofReal
        (stochasticExponential F P B (fun s _ => if s ≤ T then u s else 0) T ω))).map
        (fun ω (t : Set.Iic T) => B t.val ω) := by
  sorry

/-- Scalar strong-solution carrier with Borel coefficients and a predictable representative of
`t ↦ σ(t, X_t)` in the finite-horizon `dt × P` classes. Thus a progressive, a.s.-continuous
solution is not required to be literally strongly predictable. The S0.2/S3.2 adapter preserves
Borel coefficients and arbitrary F₀-measurable initial data. -/
def IsStrongSolution (F : Filtration ℝ≥0 mΩ) (P : Measure Ω)
    (B : ℝ≥0 → Ω → ℝ) (b σ : ℝ≥0 → ℝ → ℝ) (ξ : Ω → ℝ)
    (X : ℝ≥0 → Ω → ℝ) : Prop :=
  Measurable (Function.uncurry b) ∧ Measurable (Function.uncurry σ) ∧
    StronglyAdapted F X ∧ IsStronglyProgressive F X ∧
    (∀ᵐ ω ∂P, Continuous (fun t => X t ω)) ∧
    ∃ H : ℝ≥0 → Ω → ℝ,
      IsStronglyPredictable F H ∧
      (∀ T, Function.uncurry (fun t ω => σ t (X t ω)) =ᵐ[(timeMeasure T).prod P]
        Function.uncurry H) ∧
      (∀ᵐ ω ∂P, ∀ T,
        Integrable (fun t => b t (X t ω)) (timeMeasure T) ∧
        Integrable (fun t => (σ t (X t ω))^2) (timeMeasure T)) ∧
      ∀ᵐ ω ∂P, ∀ t, X t ω = ξ ω +
        (∫ s, b s (X s ω) ∂timeMeasure t) + itoIntegral F P B H t ω

/-- Global-Lipschitz scalar existence, with a genuine joint measurability hypothesis.
Here `L` is a uniform global Lipschitz bound and `K` a uniform bound at zero, hence the
usual linear-growth control. This is a global-constant special case of the broader
coefficient-general existence target, not its replacement. It allows arbitrary F₀-measurable
initial values; moment bounds require extra moment hypotheses. The vector and local/explosion
targets remain in S9. -/
theorem exists_strongSolution (F : Filtration ℝ≥0 mΩ)
    (P : Measure Ω) [IsProbabilityMeasure P] (B : ℝ≥0 → Ω → ℝ)
    (hB : IsFilteredBrownian F P B) (b σ : ℝ≥0 → ℝ → ℝ)
    (hb : Measurable (Function.uncurry b)) (hσ : Measurable (Function.uncurry σ))
    (L K : ℝ≥0)
    (hLip : ∀ t x y, |b t x - b t y| + |σ t x - σ t y| ≤ (L : ℝ) * |x-y|)
    (hBound : ∀ t, |b t 0| + |σ t 0| ≤ K)
    (ξ : Ω → ℝ) (hξ : StronglyMeasurable[F 0] ξ) :
    ∃ X, IsStrongSolution F P B b σ ξ X := by
  sorry

universe v

variable {E : Type v} [TopologicalSpace E] [MeasurableSpace E]
  [BorelSpace E] [PolishSpace E] [Nonempty E]

/-- Fixed-time equality is a modification, not indistinguishability. -/
def IsModification (P : Measure Ω) (X Y : ℝ≥0 → Ω → E) : Prop :=
  ∀ t, Y t =ᵐ[P] X t

def HasProgressiveModification (F : Filtration ℝ≥0 ‹MeasurableSpace Ω›)
    (P : Measure Ω) (X : ℝ≥0 → Ω → E) : Prop :=
  ∃ Y, IsProgressive F Y ∧ IsModification P X Y

/-- Arbitrary-filtration Polish-valued progressive modification. Requires ambient product
measurability and timewise adaptation; no usual conditions or path regularity. -/
theorem exists_progressive_modification
    (F : Filtration ℝ≥0 ‹MeasurableSpace Ω›) (P : Measure Ω)
    [IsProbabilityMeasure P] (X : ℝ≥0 → Ω → E)
    (h_joint : Measurable (Function.uncurry X))
    (h_adapted : Adapted F X) :
    HasProgressiveModification F P X := by
  sorry

/-- Fubini consequence on each finite horizon. This yields product-a.e. equality, not
indistinguishability or predictability. -/
theorem modification_eq_ae_prod_on_horizon
    (F : Filtration ℝ≥0 ‹MeasurableSpace Ω›) (P : Measure Ω)
    [IsProbabilityMeasure P] (X Y : ℝ≥0 → Ω → E)
    (hX : Measurable (Function.uncurry X))
    (hY : IsProgressive F Y)
    (hXY : IsModification P X Y) :
    ∀ T, Function.uncurry X =ᵐ[(timeMeasure T).prod P] Function.uncurry Y := by
  sorry

/-- Already present pinned Brownian API: this is a proof, not a new proposed target. -/
example (P : Measure Ω) (B : ℝ≥0 → Ω → ℝ) (hB : IsBrownianReal B P) (s : ℝ≥0) :
    IsBrownianReal (fun t ω => B (s+t) ω - B s ω) P := hB.shift s

end StochasticCalculusSuggested


/-! ## Elementary native measure and generator lemmas

These are proved lemmas for source-level interfaces. The generator bounds below are only
scalar inequalities; they do not prove global existence or nonexplosion of an SDE.
-/
namespace StochasticCalculusSuggested.ComplexMeasureBounds

/-- For an integrable complex density, the native vector-measure variation is exactly
Lebesgue measure with density `‖f‖`. -/
theorem complexDensity_variation_eq {α : Type*} [MeasurableSpace α]
    (μ : Measure α) (f : α → ℂ) (hf : Integrable f μ) :
    (μ.withDensityᵥ f).variation = μ.withDensity (fun x => ‖f x‖ₑ) := by
  exact MeasureTheory.Measure.variation_withDensityᵥ hf

/-- The corresponding domination follows from the native exact density identity. -/
theorem complexDensity_variation_le {α : Type*} [MeasurableSpace α]
    (μ : Measure α) (f : α → ℂ) (hf : Integrable f μ) :
    (μ.withDensityᵥ f).variation ≤ μ.withDensity (fun x => ‖f x‖ₑ) := by
  rw [complexDensity_variation_eq μ f hf]


end StochasticCalculusSuggested.ComplexMeasureBounds

namespace StochasticCalculusSuggested.SpecialCoefficientNonexplosion

/-- The logarithmic Lyapunov generator bound after setting `u = a/(1+x²)`.
This is an elementary scalar inequality and makes no claim about SDE existence. -/
theorem normalized_log_generator_le_two (x u : ℝ) (hx : 2 ≤ x ^ 2) :
    2 * x * u + (1 - x ^ 2) * u ^ 2 ≤ 2 := by
  have hprod : 0 ≤ (x ^ 2 - 2) * u ^ 2 :=
    mul_nonneg (sub_nonneg.mpr hx) (sq_nonneg u)
  nlinarith [sq_nonneg (x * u - 2)]

/-- The corresponding bound in the original coefficient `a`. -/
theorem log_generator_le_two (x a : ℝ) (hx : 2 ≤ x ^ 2) :
    2 * x * a / (1 + x ^ 2) + (1 - x ^ 2) * a ^ 2 / (1 + x ^ 2) ^ 2 ≤ 2 := by
  have hden : 1 + x ^ 2 ≠ 0 := ne_of_gt (by positivity)
  have h := normalized_log_generator_le_two x (a / (1 + x ^ 2)) hx
  convert h using 1
  field_simp


end StochasticCalculusSuggested.SpecialCoefficientNonexplosion

/-! The declared tent-map conditional-expectation acceptance example. -/
namespace StochasticCalculusSuggested.TentConditionalExample

def tent (x : ℝ) : ℝ := max 0 (min x (1 - x))

lemma continuous_tent : Continuous tent := by
  unfold tent
  fun_prop

lemma tent_reflection (x : ℝ) : tent (1 - x) = tent x := by
  unfold tent
  rw [show (1 : ℝ) - (1 - x) = x by ring, min_comm]

lemma tent_outside {x : ℝ} (hx : x ∉ Set.Icc (0 : ℝ) 1) : tent x = 0 := by
  unfold tent
  apply max_eq_left
  by_cases h0 : 0 ≤ x
  · have h1 : ¬ x ≤ 1 := fun h1 ↦ hx ⟨h0, h1⟩
    exact (min_le_right x (1 - x)).trans (by linarith)
  · exact (min_le_left x (1 - x)).trans (le_of_lt (lt_of_not_ge h0))

/-- Any integrable variable under any Borel probability has a tent-conditioned
version which is pointwise symmetric and constant outside the unit interval. -/
theorem conditional_tent_factor (P : Measure ℝ) [IsProbabilityMeasure P]
    (ξ : ℝ → ℝ) (_hξ : Integrable ξ P) :
    ∃ g : ℝ → ℝ, Measurable g ∧
      P[ξ | MeasurableSpace.comap tent (borel ℝ)] = g ∘ tent ∧
      (∀ x : ℝ, P[ξ | MeasurableSpace.comap tent (borel ℝ)] (1 - x) =
        P[ξ | MeasurableSpace.comap tent (borel ℝ)] x) ∧
      (∀ x : ℝ, x ∉ Set.Icc (0 : ℝ) 1 →
        P[ξ | MeasurableSpace.comap tent (borel ℝ)] x = g 0) := by
  obtain ⟨g, hg, heq⟩ :=
    (stronglyMeasurable_condExp (μ := P) (f := ξ)
      (m := MeasurableSpace.comap tent (borel ℝ))).exists_eq_measurable_comp
  refine ⟨g, hg.measurable, heq, ?_, ?_⟩
  · intro x
    rw [heq]
    simp only [Function.comp_apply, tent_reflection]
  · intro x hx
    rw [heq]
    simp only [Function.comp_apply, tent_outside hx]


end StochasticCalculusSuggested.TentConditionalExample

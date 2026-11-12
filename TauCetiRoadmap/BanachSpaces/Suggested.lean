/-
Copyright (c) 2026 Emiel Lorist. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Mathlib.Analysis.Convex.TotallyBounded
public import Mathlib.Analysis.Normed.Group.Completeness
public import Mathlib.Analysis.Normed.Module.Completion
public import Mathlib.Analysis.Normed.Module.FiniteDimension
public import Mathlib.Analysis.Normed.Module.RieszLemma
public import Mathlib.MeasureTheory.Function.Holder
public import Mathlib.MeasureTheory.Function.LpSpace.Complete
public import Mathlib.MeasureTheory.Function.LpSpace.ContinuousFunctions
public import Mathlib.MeasureTheory.Integral.Bochner.ContinuousLinearMap
public import Mathlib.MeasureTheory.Integral.IntervalIntegral.FundThmCalculus
public import Mathlib.MeasureTheory.VectorMeasure.Variation.Basic
public import Mathlib.Order.Partition.Finpartition
public import Mathlib.Topology.MetricSpace.UniformConvergence
public import Mathlib.Topology.UniformSpace.Ascoli
public import TauCeti.Analysis.Normed.Module.Quotient
public import TauCeti.Analysis.Normed.Operator.Dense
public import TauCeti.MeasureTheory.VectorMeasure.ScalarIntegral

/-!
# Banach spaces: suggested interfaces

The roadmap is `README.md`; this file is not the roadmap. These are representative suggested
interfaces, not an exhaustive checklist. Proofs admitted with `sorry` are mathematical targets,
not completed mathematics. Discharging this file does not complete the roadmap.

The first examples check existing Mathlib and Tau Ceti inputs directly. They are not requests
for duplicate library declarations. Subsequent signatures fix the remaining comparison and
example interfaces on native carriers. In particular, tagged sums use `Finpartition` and converge
to the native Bochner integral, and multiplication uses `ContinuousLinearMap.holderL`.

The total-variation Banach structure is specified in the README. Scalar finiteness is checked
against an existing instance; the remaining completeness target uses native vector measures and
variation before that norm structure exists. No placeholder norm or empty proposition is introduced.
The compact-set convergence example is proved using the existing equicontinuity API. Results owned
by BochnerSpaces and the newer Schur integral-operator implementation are inputs, not additional
admitted theorem targets here.
-/

@[expose] public section

noncomputable section

set_option autoImplicit false

open MeasureTheory Filter Set TopologicalSpace
open scoped ENNReal NNReal Topology BigOperators

namespace TauCetiRoadmap.BanachSpaces

universe u v w

variable {𝕜 : Type*} [RCLike 𝕜]
variable {X : Type v} [NormedAddCommGroup X] [NormedSpace 𝕜 X]
variable {Y : Type w} [NormedAddCommGroup Y] [NormedSpace 𝕜 Y]
variable {S : Type u} [MeasurableSpace S] {μ : Measure S}

/-! ## Existing inputs: no new proofs are requested for these statements -/

/-- BN1.2: the native completeness criterion uses initial partial sums. -/
example :
    (∀ x : ℕ → X, Summable (fun n => ‖x n‖) →
      ∃ a, Tendsto (fun n => ∑ i ∈ Finset.range n, x i) atTop (𝓝 a)) ↔
      CompleteSpace X :=
  NormedAddCommGroup.summable_imp_tendsto_iff_completeSpace

/-- BN4.4: Tau Ceti already supplies equality of the quotient operator norm. -/
example (D : Submodule 𝕜 X) (T : X →L[𝕜] Y) (hD : D ≤ T.ker) :
    ‖D.liftQL T hD‖ = ‖T‖ :=
  D.norm_liftQL T hD

/-- BN5.4: Mathlib already supplies the norm-one form of Riesz's lemma. -/
example (D : Submodule 𝕜 X) (hclosed : IsClosed (D : Set X))
    (hproper : ∃ x : X, x ∉ D) {r : ℝ} (hr : r < 1) :
    ∃ x ∉ D, ‖x‖ = 1 ∧ ∀ y ∈ D, r ≤ ‖x - y‖ :=
  riesz_lemma_of_lt_one hclosed hproper hr

/-- BN4.3: convergence to an already supplied operator extends from a dense set. -/
example {D : Set X} (hD : Dense D) (Tn : ℕ → X →L[𝕜] Y) (T : X →L[𝕜] Y)
    {C : ℝ} (hbound : ∀ n, ‖Tn n‖ ≤ C)
    (hconv : ∀ x ∈ D, Tendsto (fun n => Tn n x) atTop (𝓝 (T x))) (x : X) :
    Tendsto (fun n => Tn n x) atTop (𝓝 (T x)) :=
  ContinuousLinearMap.tendsto_apply_of_dense hD (Eventually.of_forall hbound) hconv x

/-! ## BN3. Scalar measures with their total variation -/

/-- BN3.4: scalar finiteness is already supplied by Tau Ceti at the pinned revision. -/
example (m : VectorMeasure S 𝕜) : IsFiniteMeasure m.variation := inferInstance

/-- BN3.4: completeness expressed intrinsically before installing the variation norm.
The limit is a native countably additive measure, not just a set function. -/
theorem exists_variation_limit (m : ℕ → VectorMeasure S 𝕜)
    (hCauchy : ∀ ε : ℝ, 0 < ε → ∃ N : ℕ, ∀ n ≥ N, ∀ k ≥ N,
      (m n - m k).variation univ < ENNReal.ofReal ε) :
    ∃ ν : VectorMeasure S 𝕜, ∀ ε : ℝ, 0 < ε → ∃ N : ℕ, ∀ n ≥ N,
      (m n - ν).variation univ < ENNReal.ofReal ε := by
  sorry

/-! ## BN4. Constructing a limit from a dense subspace -/

/-- BN4.3: existence of a bounded strong limit and the precise liminf estimate. -/
theorem exists_strongLimit_of_dense [CompleteSpace Y]
    (D : Submodule 𝕜 X) (hD : Dense (D : Set X)) (Tn : ℕ → X →L[𝕜] Y)
    {C : ℝ} (hbound : ∀ n, ‖Tn n‖ ≤ C)
    (hconv : ∀ x : D, ∃ y : Y, Tendsto (fun n => Tn n x) atTop (𝓝 y)) :
    ∃ T : X →L[𝕜] Y,
      (∀ x : X, Tendsto (fun n => Tn n x) atTop (𝓝 (T x))) ∧
      ‖T‖ ≤ Filter.liminf (fun n => ‖Tn n‖) atTop := by
  sorry

/-! ## BN6. Compactness and strong convergence -/

/-- BN6.1: approximation by relatively compact sets characterizes relative compactness. -/
theorem isCompact_closure_iff_approx [CompleteSpace X] (A : Set X) :
    IsCompact (closure A) ↔
      ∀ ε : ℝ, 0 < ε → ∃ K : Set X,
        IsCompact (closure K) ∧
        ∀ x ∈ A, ∃ y ∈ K, ‖x - y‖ < ε := by
  sorry

/-- BN6.3 is an existing equicontinuity specialization, with no new production declaration.
No completeness assumption is needed when the uniform bound is supplied. -/
example
    (Tn : ℕ → X →L[𝕜] Y) (T : X →L[𝕜] Y)
    {C : ℝ} (hbound : ∀ n, ‖Tn n‖ ≤ C)
    (hconv : ∀ x : X, Tendsto (fun n => Tn n x) atTop (𝓝 (T x)))
    {K : Set X} (hK : IsCompact (closure K)) :
    TendstoUniformlyOn (fun n x => Tn n x) T atTop K := by
  have hC : 0 ≤ C := (norm_nonneg (Tn 0)).trans (hbound 0)
  let L : ℝ≥0 := ⟨C, hC⟩
  have hLip : ∀ n, LipschitzWith L (Tn n) := fun n =>
    (Tn n).lipschitzWith.weaken (by exact_mod_cast hbound n)
  have hequi : EquicontinuousOn (fun n x => Tn n x) (closure K) :=
    (LipschitzWith.uniformEquicontinuous _ L hLip).equicontinuous.equicontinuousOn _
  have h := (EquicontinuousOn.tendsto_uniformOnFun_iff_pi'
    (F := fun n x => Tn n x) (𝔖 := {closure K})
    (by simpa using hK) (by simpa using hequi) atTop (T : X → Y)).2 <| by
      rw [sUnion_singleton]
      exact tendsto_pi_nhds.2 fun x => hconv x
  exact (UniformOnFun.tendsto_iff_tendstoUniformlyOn.1 h
    (closure K) rfl).mono subset_closure

/-! ## BN7.1. Tagged Borel partitions of a compact metric space -/

section RiemannSums

variable {K : Type*} [MetricSpace K] [CompactSpace K]
  [MeasurableSpace K] [BorelSpace K]
variable (ν : Measure K) [IsFiniteMeasure ν]
variable [NormedSpace ℝ X]

/-- The explicit sum uses native finite partitions. Tags are indexed by the actual cells,
so the empty compact space permits the empty tagged family. -/
def taggedSum (f : K → X) (P : Finpartition (univ : Set K))
    (tag : (A : P.parts) → K) : X :=
  ∑ A : P.parts, (ν (A : Set K)).toReal • f (tag A)

/-- BN7.1.1: existence of small Borel partitions is needed for uniqueness of the limit. -/
theorem exists_fine_borel_partition {δ : ℝ} (hδ : 0 < δ) :
    ∃ P : Finpartition (univ : Set K),
      (∀ A ∈ P.parts, MeasurableSet A) ∧
      ∀ A ∈ P.parts, Metric.diam A < δ := by
  sorry

variable [CompleteSpace X]

/-- BN7.1.2: the tagged-sum error is controlled by oscillation times total mass. -/
theorem norm_taggedSum_sub_integral_le (f : K → X) (hf : Continuous f)
    (P : Finpartition (univ : Set K)) (hP : ∀ A ∈ P.parts, MeasurableSet A)
    (tag : (A : P.parts) → K) (htag : ∀ A : P.parts, tag A ∈ (A : Set K))
    {η : ℝ} (hη : 0 ≤ η)
    (hosc : ∀ A : P.parts, ∀ x ∈ (A : Set K), ‖f (tag A) - f x‖ ≤ η) :
    ‖taggedSum ν f P tag - ∫ x, f x ∂ν‖ ≤ η * (ν univ).toReal := by
  sorry

/-- BN7.1.2: every sufficiently fine tagged Borel partition approximates the native integral.
No condition on measures of cell boundaries is imposed. -/
theorem taggedSums_converge (f : K → X) (hf : Continuous f) :
    ∀ ε : ℝ, 0 < ε → ∃ δ : ℝ, 0 < δ ∧
      ∀ (P : Finpartition (univ : Set K))
        (_ : ∀ A ∈ P.parts, MeasurableSet A)
        (tag : (A : P.parts) → K),
        (∀ A : P.parts, tag A ∈ (A : Set K)) →
        (∀ A ∈ P.parts, Metric.diam A < δ) →
        ‖taggedSum ν f P tag - ∫ x, f x ∂ν‖ < ε := by
  sorry

end RiemannSums

/-! ## BN7.3. The pointwise distance-test criterion -/

/-- The source's first Pettis criterion uses distances, with a closed separable linear range. -/
theorem stronglyMeasurable_iff_distance_tests (f : S → X) :
    StronglyMeasurable f ↔
      ∃ D : Submodule 𝕜 X, IsClosed (D : Set X) ∧ IsSeparable (D : Set X) ∧
        (∀ s, f s ∈ D) ∧
        ∀ x : D, Measurable (fun s => ‖f s - (x : X)‖) := by
  sorry

/-! ## BN8.2. Norm of scalar integration -/

/-- A finite positive-measure set witnesses norm one, even without sigma-finiteness. -/
theorem norm_scalarIntegral_eq_one
    (hμ : ∃ A : Set S, MeasurableSet A ∧ 0 < μ A ∧ μ A < ∞) :
    ‖L1.integralCLM' 𝕜 (E := 𝕜) (μ := μ)‖ = 1 := by
  sorry

-- The purely infinite / zero-Lp assertion is consumed from BochnerSpaces BS3.3.

/-! ## BN8.3. Pointwise multiplication uses the native Hölder map -/

section Multipliers

variable (𝕜 μ) (p : ℝ≥0∞) [Fact (1 ≤ p)]

/-- No new Lp carrier or pointwise multiplication implementation is introduced. -/
abbrev multiplier (m : Lp 𝕜 ∞ μ) : Lp 𝕜 p μ →L[𝕜] Lp 𝕜 p μ :=
  (ContinuousLinearMap.lsmul 𝕜 𝕜 : 𝕜 →L[𝕜] 𝕜 →L[𝕜] 𝕜).holderL μ ∞ p p m

variable {𝕜 μ p}

/-- The actual pointwise formula holds almost everywhere on the native quotient. -/
theorem multiplier_ae (m : Lp 𝕜 ∞ μ) (f : Lp 𝕜 p μ) :
    multiplier 𝕜 μ p m f =ᵐ[μ] fun s => m s * f s := by
  sorry

/-- The upper bound needs no finiteness condition on the measure. -/
theorem norm_multiplier_le (m : Lp 𝕜 ∞ μ) :
    ‖multiplier 𝕜 μ p m‖ ≤ ‖m‖ := by
  sorry

/-- Sigma-finiteness supplies norm equality at every exponent in the stated range. -/
theorem norm_multiplier [SigmaFinite μ] (m : Lp 𝕜 ∞ μ) :
    ‖multiplier 𝕜 μ p m‖ = ‖m‖ := by
  sorry

end Multipliers

/-- The infinity endpoint does not require sigma-finiteness. -/
theorem norm_multiplier_top (m : Lp 𝕜 ∞ μ) :
    ‖multiplier 𝕜 μ ∞ m‖ = ‖m‖ := by
  sorry

/-! ## BN8.4. Bounded integral kernels -/

section Kernels

variable {K : Type*} [MetricSpace K] [CompactSpace K]
  [MeasurableSpace K] [BorelSpace K]
variable (ν : Measure K) [IsFiniteMeasure ν]

/-- A continuous kernel gives a continuous-output operator with the finite-mass bound. -/
theorem exists_continuousKernelOperator (k : C(K × K, 𝕜)) :
    ∃ T : C(K, 𝕜) →L[𝕜] C(K, 𝕜),
      (∀ (f : C(K, 𝕜)) (s : K), T f s = ∫ t, k (s, t) * f t ∂ν) ∧
      ‖T‖ ≤ (ν univ).toReal * ‖k‖ := by
  sorry

-- The L∞ kernel operator is an adapter to TauCeti.integralOperatorLp at the newer
-- revision cited in the README. Its construction is not restated as a missing theorem.

/-- The square-integrable-kernel bound needs no positivity or symmetry of the kernel. -/
theorem exists_l2KernelOperator (k : Lp 𝕜 2 (ν.prod ν)) :
    ∃ T : Lp 𝕜 2 ν →L[𝕜] Lp 𝕜 2 ν,
      (∀ f : Lp 𝕜 2 ν, ∀ᵐ s ∂ν, T f s = ∫ t, k (s, t) * f t ∂ν) ∧
      ‖T‖ ≤ ‖k‖ := by
  sorry

end Kernels

/-! ## BN8.5. The Volterra examples and their exact norm -/

/-- Lebesgue endpoints are null, so this is also the source's L²(0,1) carrier. -/
abbrev unitIntervalMeasure : Measure ℝ :=
  volume.restrict (Icc (0 : ℝ) 1)

/-- The continuous-output Volterra map includes the uniform half-Hölder estimate. -/
theorem exists_volterra_continuous :
    ∃ V : Lp 𝕜 2 unitIntervalMeasure →L[𝕜] C(Icc (0 : ℝ) 1, 𝕜),
      (∀ (f : Lp 𝕜 2 unitIntervalMeasure) (s : Icc (0 : ℝ) 1),
        V f s = ∫ t in (0 : ℝ)..(s : ℝ), f t) ∧
      ‖V‖ ≤ 1 ∧
      ∀ (f : Lp 𝕜 2 unitIntervalMeasure) (s t : Icc (0 : ℝ) 1),
        ‖V f s - V f t‖ ≤ Real.sqrt |(s : ℝ) - (t : ℝ)| * ‖f‖ := by
  sorry

/-- BN8.5 proves the sharp norm of the supplied Volterra operator. The complex construction is
owned by BanachAlgebras Layer 3.1; its real-valued restriction is compared in the README. -/
theorem norm_volterra_l2
    (V : Lp 𝕜 2 unitIntervalMeasure →L[𝕜] Lp 𝕜 2 unitIntervalMeasure)
    (hV : ∀ f : Lp 𝕜 2 unitIntervalMeasure, ∀ᵐ s ∂unitIntervalMeasure,
      V f s = ∫ t in (0 : ℝ)..s, f t) :
    ‖V‖ = 2 / Real.pi := by
  sorry

end TauCetiRoadmap.BanachSpaces

/-
Suggested Lean signatures for the finite-volume programme.
The README is definitive; these suggestions are not an exhaustive checklist.
Hard theorem targets use explicit `sorry`.
-/
module

public import TauCeti.Geometry.Manifold.Riemannian.Hyperbolic.FiniteVolume
public import TauCeti.Geometry.Manifold.Riemannian.Hyperbolic.Volume
public import Mathlib.AlgebraicTopology.FundamentalGroupoid.FundamentalGroup

public section

open Bundle MeasureTheory Set Manifold TauCeti
open scoped ContDiff Manifold
noncomputable section


namespace GT7FiniteVolume

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  {M : Type*} [TopologicalSpace M] [T3Space M] [PreconnectedSpace M]
  [ChartedSpace H M] [IsManifold I ∞ M] [LindelofSpace M]
  [MeasurableSpace M] [BorelSpace M]

/-- Exactly the native Riemannian measure of the metric carried by `g`. -/
def metricVolume (g : HyperbolicMetric (I := I) (M := M)) : Measure M := by
  let : RiemannianBundle (fun x : M ↦ TangentSpace I x) :=
    ⟨g.metric.toRiemannianMetric⟩
  let : IsContinuousRiemannianBundle E (fun x : M ↦ TangentSpace I x) :=
    IsContMDiffRiemannianBundle.toIsContinuousRiemannianBundle
      (IB := I) (n := ∞) (F := E) (V := fun x : M ↦ TangentSpace I x)
  exact riemannianVolume I M

/-- Native finiteness is definitionally the finiteness of this same measure. -/
theorem hasFiniteVolume_iff (g : HyperbolicMetric (I := I) (M := M)) :
    g.HasFiniteVolume ↔ IsFiniteMeasure (metricVolume g) := by
  exact g.hasFiniteVolume_iff

/-- Real mass is exposed only with the actual metric's finite-volume witness. -/
def finiteVolume (g : HyperbolicMetric (I := I) (M := M))
    (_hg : g.HasFiniteVolume) : ℝ := (metricVolume g univ).toReal

theorem mass_ne_top (g : HyperbolicMetric (I := I) (M := M))
    (hg : g.HasFiniteVolume) : metricVolume g univ ≠ ⊤ := by
  let : IsFiniteMeasure (metricVolume g) := (hasFiniteVolume_iff g).mp hg
  exact measure_ne_top _ _

theorem finiteVolume_nonneg (g : HyperbolicMetric (I := I) (M := M))
    (hg : g.HasFiniteVolume) : 0 ≤ finiteVolume g hg := ENNReal.toReal_nonneg

theorem ofReal_finiteVolume (g : HyperbolicMetric (I := I) (M := M))
    (hg : g.HasFiniteVolume) :
    ENNReal.ofReal (finiteVolume g hg) = metricVolume g univ :=
  ENNReal.ofReal_toReal (mass_ne_top g hg)

/-- HARD TARGET: nonzero volume requires the native positive chart density,
not merely `IsFiniteMeasure`. Prove a nonempty coordinate ball has positive mass. -/
theorem finiteVolume_pos [Nonempty M] [BoundarylessManifold I M]
    (g : HyperbolicMetric (I := I) (M := M)) (hg : g.HasFiniteVolume) :
    0 < finiteVolume g hg := by
  sorry

/-- The extension agrees with the implemented compact metric-level volume. -/
theorem finiteVolume_eq_hypVolumeOfMetric [CompactSpace M]
    (g : HyperbolicMetric (I := I) (M := M)) (hg : g.HasFiniteVolume) :
    finiteVolume g hg = hypVolumeOfMetric g := by
  rw [hypVolumeOfMetric_def]
  let : RiemannianBundle (fun x : M ↦ TangentSpace I x) :=
    ⟨g.metric.toRiemannianMetric⟩
  let : IsContinuousRiemannianBundle E (fun x : M ↦ TangentSpace I x) :=
    IsContMDiffRiemannianBundle.toIsContinuousRiemannianBundle
      (IB := I) (n := ∞) (F := E) (V := fun x : M ↦ TangentSpace I x)
  rw [riemannianTotalVolume_def]
  rfl

/-- Compatibility with the implemented metric-chosen compact construction;
this statement does not claim Mostow rigidity has been proved natively. -/
theorem finiteVolume_chosen_eq_hypVolume [CompactSpace M]
    (h : IsHyperbolic (I := I) (M := M)) :
    finiteVolume (Classical.choice (isHyperbolic_iff.mp h))
      (Classical.choice (isHyperbolic_iff.mp h)).hasFiniteVolume_of_compactSpace =
      hypVolume h := by
  rw [hypVolume_def]
  exact finiteVolume_eq_hypVolumeOfMetric _ _

variable {H' : Type*} [TopologicalSpace H'] {J : ModelWithCorners ℝ E H'}
  {N : Type*} [TopologicalSpace N] [T3Space N] [PreconnectedSpace N]
  [ChartedSpace H' N] [IsManifold J ∞ N] [LindelofSpace N]
  [MeasurableSpace N] [BorelSpace N]

/-- The actual native Riemannian isometry, using each bundled metric's own
Riemannian bundle. Unlike the native same-manifold abbreviation, endpoints may differ. -/
abbrev MetricIsometry (g : HyperbolicMetric (I := I) (M := M))
    (g' : HyperbolicMetric (I := J) (M := N)) :=
  @RiemannianIsometry E _ _ H _ E _ _ H' _ I J M N _ _
    ⟨g.metric.toRiemannianMetric⟩ _ _ ⟨g'.metric.toRiemannianMetric⟩

theorem measurePreserving_metricVolume
    (g : HyperbolicMetric (I := I) (M := M))
    (g' : HyperbolicMetric (I := J) (M := N)) (Φ : MetricIsometry g g') :
    MeasurePreserving Φ (metricVolume g) (metricVolume g') := by
  let : RiemannianBundle (fun x : M ↦ TangentSpace I x) :=
    ⟨g.metric.toRiemannianMetric⟩
  let : IsContinuousRiemannianBundle E (fun x : M ↦ TangentSpace I x) :=
    IsContMDiffRiemannianBundle.toIsContinuousRiemannianBundle
      (IB := I) (n := ∞) (F := E) (V := fun x : M ↦ TangentSpace I x)
  let : RiemannianBundle (fun x : N ↦ TangentSpace J x) :=
    ⟨g'.metric.toRiemannianMetric⟩
  let : IsContinuousRiemannianBundle E (fun x : N ↦ TangentSpace J x) :=
    IsContMDiffRiemannianBundle.toIsContinuousRiemannianBundle
      (IB := J) (n := ∞) (F := E) (V := fun x : N ↦ TangentSpace J x)
  exact Φ.measurePreserving_riemannianVolume

theorem mass_eq_of_isometry
    (g : HyperbolicMetric (I := I) (M := M))
    (g' : HyperbolicMetric (I := J) (M := N)) (Φ : MetricIsometry g g') :
    metricVolume g univ = metricVolume g' univ := by
  have h := measurePreserving_metricVolume g g' Φ
  calc
    metricVolume g univ = ((metricVolume g).map Φ) univ := by
      rw [Measure.map_apply h.measurable MeasurableSet.univ, preimage_univ]
    _ = metricVolume g' univ := congrArg (fun μ : Measure N ↦ μ univ) h.map_eq

theorem hasFiniteVolume_of_isometry
    (g : HyperbolicMetric (I := I) (M := M))
    (g' : HyperbolicMetric (I := J) (M := N))
    (_hg : g.HasFiniteVolume) (Φ : MetricIsometry g g') : g'.HasFiniteVolume := by
  apply (hasFiniteVolume_iff g').mpr
  refine ⟨?_⟩
  rw [← mass_eq_of_isometry g g' Φ]
  exact lt_top_iff_ne_top.mpr (mass_ne_top g _hg)

theorem finiteVolume_eq_of_isometry
    (g : HyperbolicMetric (I := I) (M := M))
    (g' : HyperbolicMetric (I := J) (M := N))
    (hg : g.HasFiniteVolume) (hg' : g'.HasFiniteVolume) (Φ : MetricIsometry g g') :
    finiteVolume g hg = finiteVolume g' hg' :=
  congrArg ENNReal.toReal (mass_eq_of_isometry g g' Φ)

/-- The actual underlying continuous map, with both metric instances scoped. -/
abbrev isometryContinuousMap
    (g : HyperbolicMetric (I := I) (M := M))
    (g' : HyperbolicMetric (I := J) (M := N)) (Φ : MetricIsometry g g') : C(M, N) := by
  let : RiemannianBundle (fun x : M ↦ TangentSpace I x) :=
    ⟨g.metric.toRiemannianMetric⟩
  let : RiemannianBundle (fun x : N ↦ TangentSpace J x) :=
    ⟨g'.metric.toRiemannianMetric⟩
  exact ⟨Φ, Φ.toDiffeomorph.toHomeomorph.continuous⟩

/-- Arithmetic endpoint transport used only AFTER a genuine geometric interval
has been certified. It does not certify root existence or identify a link. -/
theorem enclosure_implies_truncation (v d lo hi : ℝ) (k : ℕ)
    (hlo : lo ≤ v) (hhi : v ≤ hi) (hd : d ≤ lo)
    (hu : hi < d + (10 : ℝ) ^ (-(k : ℤ))) :
    d ≤ v ∧ v < d + (10 : ℝ) ^ (-(k : ℤ)) :=
  ⟨hd.trans hlo, hhi.trans_lt hu⟩

end GT7FiniteVolume

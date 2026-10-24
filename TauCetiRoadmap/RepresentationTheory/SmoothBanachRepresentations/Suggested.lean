import Mathlib.RepresentationTheory.Continuous.Basic
import Mathlib.Geometry.Manifold.ContMDiffMap
import Mathlib.Geometry.Manifold.ContMDiff.NormedSpace
import Mathlib.Geometry.Manifold.Algebra.SMul
import Mathlib.Geometry.Manifold.Algebra.LieGroup
import Mathlib.MeasureTheory.Measure.Haar.Basic
import Mathlib.MeasureTheory.Integral.Bochner.Basic
import Mathlib.Analysis.Distribution.TestFunction
import TauCeti.Geometry.Lie.Exponential.Basic
import TauCeti.Analysis.Semigroups.Generator.SmoothVectors
import TauCeti.Analysis.Semigroups.Generator.Closed

/-!
# Smooth Banach representations: representative target signatures

The README is the complete specification. These signatures exhibit actual native
carriers for orbit smoothness, tests, integration, the one-parameter generator and
finite-sum factorization. `sorry` denotes a proof obligation, never an implementation
claim. The complex case below is representative; the README also requires the real
case and the complete seminorm/domain/functor/algebra APIs.
-/

open scoped Manifold ContDiff Topology
open MeasureTheory TauCeti.Semigroups

noncomputable section
namespace SmoothBanachRepresentations

variable {V H G E : Type*}
  [NormedAddCommGroup V] [NormedSpace ℝ V] [hFD : FiniteDimensional ℝ V]
  [TopologicalSpace H] {I : ModelWithCorners ℝ V H}
  [TopologicalSpace G] [ChartedSpace H G] [Group G]
  [hLie : LieGroup I ∞ G] [hManifold : IsManifold I 1 G] [hT2 : T2Space G]
  [hBoundary : BoundarylessManifold I G]
  [NormedAddCommGroup E] [NormedSpace ℂ E] [NormedSpace ℝ E]
  [IsScalarTower ℝ ℂ E] [hComplete : CompleteSpace E]

/-- Strong orbit continuity is explicit: the native representation does not include it. -/
def HasContinuousOrbits (π : ContRepresentation ℂ G E) : Prop :=
  ∀ v : E, Continuous (fun g : G => π g v)

/-- Smoothness in the original Banach norm, using native manifold calculus. -/
def IsSmoothLieVector (π : ContRepresentation ℂ G E) (v : E) : Prop :=
  ContMDiff I 𝓘(ℝ, E) ∞ (fun g : G => π g v)

/-- The algebraic smooth carrier; its stronger Fréchet topology is a README target. -/
def smoothLieVectors (π : ContRepresentation ℂ G E) : Submodule ℂ E where
  carrier := {v | IsSmoothLieVector (I := I) π v}
  zero_mem' := by
    simpa [IsSmoothLieVector] using
      (contMDiff_const : ContMDiff I 𝓘(ℝ, E) ∞ (fun _ : G => (0 : E)))
  add_mem' := by
    intro v w hv hw
    change ContMDiff I 𝓘(ℝ, E) ∞ (fun g : G => π g (v + w))
    exact (hv.add hw).congr (fun g => by simp)
  smul_mem' := by
    intro z v hv
    change ContMDiff I 𝓘(ℝ, E) ∞ (fun g : G => π g (z • v))
    have h : ContMDiff I 𝓘(ℝ, E) ∞ (fun g : G => z • π g v) :=
      (((z • ContinuousLinearMap.id ℂ E).restrictScalars ℝ).contMDiff).comp hv
    exact h.congr (fun g => by simp)

/-- A manifold test uses the native smooth-map carrier and compact support. -/
abbrev LieTestFunction :=
  {f : ContMDiffMap I 𝓘(ℝ, ℂ) G ℂ ∞ // HasCompactSupport (fun g => f g)}

variable [MeasurableSpace G] [hBorel : BorelSpace G]

/-- Pointwise Bochner integration; the following targets prove its integrability. -/
def smear (π : ContRepresentation ℂ G E) (μ : Measure G) (f : G → ℂ) (v : E) : E :=
  ∫ g, f g • π g v ∂μ

include hFD hLie hManifold hT2 hBoundary hComplete hBorel

/-- The constant depends on the compact set; there is no global L¹ assertion. -/
theorem exists_compact_operator_bound (π : ContRepresentation ℂ G E)
    (hπ : HasContinuousOrbits π) {K : Set G} (hK : IsCompact K) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ g ∈ K, ‖π g‖ ≤ C := by
  sorry

/-- Local compact support suffices, without separability of the entire E. -/
theorem integrable_compact_smul_orbit (π : ContRepresentation ℂ G E)
    (hπ : HasContinuousOrbits π) (μ : Measure G) [IsFiniteMeasureOnCompacts μ]
    {f : G → ℂ} (hf : Continuous f) (hfc : HasCompactSupport f) (v : E) :
    Integrable (fun g => f g • π g v) μ := by
  sorry

/-- Each local integrated operator has the support-dependent L¹ estimate. -/
theorem norm_smear_le (π : ContRepresentation ℂ G E)
    (hπ : HasContinuousOrbits π) (μ : Measure G) [IsFiniteMeasureOnCompacts μ]
    {K : Set G} (hK : IsCompact K) {C : ℝ} (hC : 0 ≤ C)
    (hbound : ∀ g ∈ K, ‖π g‖ ≤ C) {f : G → ℂ}
    (hf : Continuous f) (hsupp : tsupport f ⊆ K) (v : E) :
    ‖smear π μ f v‖ ≤ C * (∫ g, ‖f g‖ ∂μ) * ‖v‖ := by
  sorry

/-- Native real semigroups, with an explicit complex-to-real scalar adapter. -/
def oneParameterSemigroup (π : ContRepresentation ℂ G E)
    (hπ : HasContinuousOrbits π) (X : LeftInvariantDerivation I G) :
    StronglyContinuousSemigroup E where
  toFun t := (π (oneParameterSubgroup X (Multiplicative.ofAdd (t : ℝ)))).restrictScalars ℝ
  map_zero' := by
    sorry
  map_add' := by
    sorry
  continuousAt_zero' := by
    sorry

/-- The native generator has exactly the two-sided group derivative domain. -/
theorem mem_generator_domain_iff (π : ContRepresentation ℂ G E)
    (hπ : HasContinuousOrbits π) (X : LeftInvariantDerivation I G) (v : E) :
    v ∈ (oneParameterSemigroup π hπ X).generator.domain ↔
      DifferentiableAt ℝ
        (fun t : ℝ => π (oneParameterSubgroup X (Multiplicative.ofAdd t)) v) 0 := by
  sorry

variable [hLC : LocallyCompactSpace G]
include hLC

/-- Strongly continuous actions smooth under compactly supported smooth kernels. -/
theorem isSmoothLieVector_smear (π : ContRepresentation ℂ G E)
    (hπ : HasContinuousOrbits π) (μ : Measure G) [μ.IsHaarMeasure]
    (f : LieTestFunction (I := I)) (v : E) :
    IsSmoothLieVector (I := I) π (smear π μ (fun g => f.val g) v) := by
  sorry

/-- Density is weaker than, and separate from, the following exact finite-sum theorem. -/
theorem dense_smoothLieVectors (π : ContRepresentation ℂ G E)
    (hπ : HasContinuousOrbits π) :
    Dense (smoothLieVectors (I := I) π : Set E) := by
  sorry

/-- Full support-controlled Dixmier–Malliavin, with smooth inner vectors. -/
theorem dixmierMalliavin (π : ContRepresentation ℂ G E)
    (hπ : HasContinuousOrbits π) (μ : Measure G) [μ.IsHaarMeasure]
    {U : Set G} (hU : IsOpen U) (h1 : (1 : G) ∈ U)
    (v : E) (hv : IsSmoothLieVector (I := I) π v) :
    ∃ n : ℕ, ∃ f : Fin n → LieTestFunction (I := I), ∃ w : Fin n → E,
      (∀ j, tsupport (fun g => (f j).val g) ⊆ U) ∧
      (∀ j, IsSmoothLieVector (I := I) π (w j)) ∧
      v = ∑ j, smear π μ (fun g => (f j).val g) (w j) := by
  sorry

end SmoothBanachRepresentations

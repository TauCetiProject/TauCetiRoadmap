import Mathlib.Analysis.Distribution.TestFunction
import Mathlib.Analysis.Calculus.DifferentialForm.Basic
import Mathlib.Analysis.InnerProductSpace.Basic
import Mathlib.LinearAlgebra.Dimension.Finite
import Mathlib.MeasureTheory.Integral.IntervalIntegral.Basic

/-!
# Selected interfaces for geometric currents

**This file is not the roadmap and is not exhaustive.** `README.md` is definitive.
These flat prototypes use native LF test functions and continuous alternating
forms, with actual continuous linear functionals as currents. They do not replace
the manifold, rectifiability, integrality, homology or regularity constructions
specified in the README. Missing theorem proofs use honest `sorry`; no opaque
proposition field stands for any of those constructions.
-/

noncomputable section

namespace TauCetiRoadmap.GeometricCurrents

open MeasureTheory
open scoped ENNReal Distributions Topology

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/-- G1: the Euclidean test-form chart of the intrinsic manifold test-form carrier. -/
abbrev EuclideanTestForm (Ω : TopologicalSpace.Opens E) (k : ℕ) :=
  TestFunction Ω (E [⋀^Fin k]→L[ℝ] ℝ) ⊤

/-- G1: real currents act on k-forms, not on forms of complementary degree. -/
abbrev EuclideanCurrent (Ω : TopologicalSpace.Opens E) (k : ℕ) :=
  EuclideanTestForm Ω k →L[ℝ] ℝ

/-- G1: native LF differentiation followed by the native alternating sum. -/
def testExteriorDerivative (Ω : TopologicalSpace.Opens E) (k : ℕ) :
    EuclideanTestForm Ω k →L[ℝ] EuclideanTestForm Ω (k + 1) :=
  (TestFunction.postcompCLM
    (ContinuousAlternatingMap.alternatizeUncurryFinCLM ℝ E ℝ)).comp
      (TestFunction.fderivCLM ℝ ⊤ ⊤)

theorem testExteriorDerivative_apply (Ω : TopologicalSpace.Opens E) (k : ℕ)
    (ω : EuclideanTestForm Ω k) (x : E) :
    testExteriorDerivative Ω k ω x = extDeriv (ω : E → E [⋀^Fin k]→L[ℝ] ℝ) x := by
  simp [testExteriorDerivative, TestFunction.fderivCLM_apply, extDeriv]

/-- G1: native square-zero exterior differentiation gives square-zero test differentiation. -/
theorem testExteriorDerivative_squared (Ω : TopologicalSpace.Opens E) (k : ℕ)
    (ω : EuclideanTestForm Ω k) :
    testExteriorDerivative Ω (k + 1) (testExteriorDerivative Ω k ω) = 0 := by
  apply TestFunction.ext
  intro x
  have heq : (testExteriorDerivative Ω k ω : E → E [⋀^Fin (k + 1)]→L[ℝ] ℝ) =
      extDeriv (ω : E → E [⋀^Fin k]→L[ℝ] ℝ) :=
    funext (testExteriorDerivative_apply Ω k ω)
  rw [testExteriorDerivative_apply, heq]
  exact congrFun (extDeriv_extDeriv (𝕜 := ℝ) ω.contDiff (by simp)) x

/-- G1: boundary has no additional sign: ∂T(ω)=T(dω). -/
def boundary {Ω : TopologicalSpace.Opens E} {k : ℕ}
    (T : EuclideanCurrent Ω (k + 1)) : EuclideanCurrent Ω k :=
  T.comp (testExteriorDerivative Ω k)

@[simp] theorem boundary_apply {Ω : TopologicalSpace.Opens E} {k : ℕ}
    (T : EuclideanCurrent Ω (k + 1)) (ω : EuclideanTestForm Ω k) :
    boundary T ω = T (testExteriorDerivative Ω k ω) := rfl

@[simp] theorem boundary_squared {Ω : TopologicalSpace.Opens E} {k : ℕ}
    (T : EuclideanCurrent Ω (k + 1 + 1)) : boundary (boundary T) = 0 := by
  ext ω
  simp only [boundary_apply, testExteriorDerivative_squared, map_zero,
    zero_apply]

/-- G1: a genuine local order-zero bound; not a stand-in for rectifiability. -/
def HasLocallyFiniteMass {Ω : TopologicalSpace.Opens E} {k : ℕ}
    (T : EuclideanCurrent Ω k) : Prop :=
  ∀ K : TopologicalSpace.Compacts E, (K : Set E) ⊆ (Ω : Set E) →
    ∃ C : ℝ, 0 ≤ C ∧ ∀ ω : EuclideanTestForm Ω k,
      tsupport (ω : E → E [⋀^Fin k]→L[ℝ] ℝ) ⊆ K →
        |T ω| ≤ C * ‖(ω : BoundedContinuousFunction E (E [⋀^Fin k]→L[ℝ] ℝ))‖

/-- G1: extended global mass is meaningful even when it is infinite. -/
def mass {Ω : TopologicalSpace.Opens E} {k : ℕ}
    (T : EuclideanCurrent Ω k) : ℝ≥0∞ :=
  ⨆ ω : EuclideanTestForm Ω k, ⨆ (_ : ∀ x : E, ‖ω x‖ ≤ 1),
    ENNReal.ofReal |T ω|

@[simp] theorem mass_zero (Ω : TopologicalSpace.Opens E) (k : ℕ) :
    mass (0 : EuclideanCurrent Ω k) = 0 := by
  simp [mass]

/-- G1: local variational mass, used to characterize the measure even at infinite total mass. -/
def localMass {Ω : TopologicalSpace.Opens E} {k : ℕ}
    (T : EuclideanCurrent Ω k) (U : Set E) : ℝ≥0∞ :=
  ⨆ ω : EuclideanTestForm Ω k,
    ⨆ (_ : tsupport (ω : E → E [⋀^Fin k]→L[ℝ] ℝ) ⊆ U),
      ⨆ (_ : ∀ x : E, ‖ω x‖ ≤ 1), ENNReal.ofReal |T ω|

@[simp] theorem localMass_zero (Ω : TopologicalSpace.Opens E) (k : ℕ) (U : Set E) :
    localMass (0 : EuclideanCurrent Ω k) U = 0 := by
  simp [localMass]

section MassMeasure

variable [FiniteDimensional ℝ E] [MeasurableSpace E] [BorelSpace E]

/-- G1: local finiteness gives the mass measure on Ω, not across its frontier. -/
def massMeasure {Ω : TopologicalSpace.Opens E} {k : ℕ}
    (T : EuclideanCurrent Ω k) (hT : HasLocallyFiniteMass T) : Measure Ω := by
  sorry

theorem isLocallyFiniteMeasure_massMeasure {Ω : TopologicalSpace.Opens E} {k : ℕ}
    (T : EuclideanCurrent Ω k) (hT : HasLocallyFiniteMass T) :
    IsLocallyFiniteMeasure (massMeasure T hT) := by
  sorry

/-- G1: the open-set supremum characterizes local mass, not just its total value. -/
theorem massMeasure_open {Ω : TopologicalSpace.Opens E} {k : ℕ}
    (T : EuclideanCurrent Ω k) (hT : HasLocallyFiniteMass T)
    (U : TopologicalSpace.Opens E) :
    massMeasure T hT (Subtype.val ⁻¹' (U : Set E)) = localMass T (U : Set E) := by
  sorry

theorem massMeasure_univ {Ω : TopologicalSpace.Opens E} {k : ℕ}
    (T : EuclideanCurrent Ω k) (hT : HasLocallyFiniteMass T) :
    massMeasure T hT Set.univ = mass T := by
  sorry

theorem eval_le_lintegral_massMeasure {Ω : TopologicalSpace.Opens E} {k : ℕ}
    (T : EuclideanCurrent Ω k) (hT : HasLocallyFiniteMass T)
    (ω : EuclideanTestForm Ω k) :
    ENNReal.ofReal |T ω| ≤
      ∫⁻ x : Ω, ENNReal.ofReal ‖ω (x : E)‖ ∂massMeasure T hT := by
  sorry

end MassMeasure

/-- G1: degree-zero point currents use native empty alternating forms and evaluation. -/
def diracZeroCurrent (Ω : TopologicalSpace.Opens E) (x : Ω) :
    EuclideanCurrent Ω 0 :=
  let emptyFormEquiv := (ContinuousAlternatingMap.constOfIsEmptyLIE
    (𝕜 := ℝ) (E := E) (ι := Fin 0) (F := ℝ)).symm.toContinuousLinearEquiv
  emptyFormEquiv.toContinuousLinearMap.comp
    ((BoundedContinuousFunction.evalCLM ℝ (x : E)).comp
      (TestFunction.toBoundedContinuousFunctionCLM ℝ))

@[simp] theorem diracZeroCurrent_apply (Ω : TopologicalSpace.Opens E) (x : Ω)
    (ω : EuclideanTestForm Ω 0) : diracZeroCurrent Ω x ω = ω x ![] := by
  change ω x 0 = ω x ![]
  congr 1
  exact Subsingleton.elim _ _

/-- G1: the point current has positive unit mass on a finite-dimensional open chart. -/
theorem mass_diracZeroCurrent [FiniteDimensional ℝ E]
    (Ω : TopologicalSpace.Opens E) (x : Ω) : mass (diracZeroCurrent Ω x) = 1 := by
  sorry

/-- G2: the pointwise algebraic floor of tangential-rank-drop vanishing. -/
theorem alternatingPullback_zero_of_range_finrank_lt
    {F : Type*} [NormedAddCommGroup F] [NormedSpace ℝ F] [FiniteDimensional ℝ F]
    {k : ℕ} (ω : F [⋀^Fin k]→L[ℝ] ℝ) (L : E →L[ℝ] F)
    (h : Module.finrank ℝ (LinearMap.range L.toLinearMap) < k) :
    ω.compContinuousLinearMap L = 0 := by
  ext v
  let w : Fin k → LinearMap.range L.toLinearMap := fun i => ⟨L (v i), ⟨v i, rfl⟩⟩
  have hw : ¬ LinearIndependent ℝ w := by
    intro hi
    have hc := hi.fintype_card_le_finrank
    simp only [Fintype.card_fin] at hc
    exact (Nat.not_le_of_gt h) hc
  exact (ω.toAlternatingMap.compLinearMap
    (LinearMap.range L.toLinearMap).subtype).map_linearDependent w hw

/-- G2: the oriented interval current, including a>b and the zero-length case. -/
def intervalCurrent (a b : ℝ) : EuclideanCurrent (E := ℝ) ⊤ 1 := by
  sorry

theorem intervalCurrent_apply (a b : ℝ) (ω : EuclideanTestForm (E := ℝ) ⊤ 1) :
    intervalCurrent a b ω = ∫ x in a..b, ω x ![1] := by
  sorry

theorem boundary_intervalCurrent (a b : ℝ) :
    boundary (intervalCurrent a b) =
      diracZeroCurrent ⊤ ⟨b, Set.mem_univ b⟩ -
        diracZeroCurrent ⊤ ⟨a, Set.mem_univ a⟩ := by
  sorry

end TauCetiRoadmap.GeometricCurrents

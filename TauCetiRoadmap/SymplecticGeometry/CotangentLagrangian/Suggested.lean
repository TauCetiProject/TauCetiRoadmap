import Mathlib.Geometry.Manifold.VectorBundle.Hom
import TauCeti.Geometry.Symplectic.Manifold.TwoForm
import TauCeti.Geometry.Symplectic.Lagrangian.Basic
import TauCeti.Geometry.Symplectic.Cotangent.Liouville
import TauCeti.Geometry.Manifold.SmoothEmbedding.NormalSpace.Basic

/-!
These suggested forms are aids, not the specification. The README is definitive;
this file is neither exhaustive nor a required implementation plan. Missing constructions
are marked honestly with `sorry`; predicates below have actual mathematical content.
-/
noncomputable section
open scoped Manifold ContDiff
open Bundle
namespace TauCetiRoadmap.SymplecticGeometry
variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [TopologicalSpace H] (I : ModelWithCorners ℝ E H)
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]

abbrev Cotangent (I : ModelWithCorners ℝ E H) (M : Type*)
    [TopologicalSpace M] [ChartedSpace H M] := TotalSpace (E →L[ℝ] ℝ) (fun x : M ↦ TangentSpace I x →L[ℝ] ℝ)
abbrev cotangentModel := I.prod 𝓘(ℝ, E →L[ℝ] ℝ)

example : IsManifold (cotangentModel I) ∞ (Cotangent I M) := inferInstance

/-- The tautological covector evaluated on the derivative of projection. -/
def liouville (z : Cotangent I M) : TangentSpace (cotangentModel I) z →L[ℝ] ℝ :=
  z.2.comp (mfderiv (cotangentModel I) I (fun y : Cotangent I M ↦ y.1) z)

/-- The canonical smooth form, intrinsically minus the exterior derivative of Liouville. -/
def canonicalForm : TauCeti.SmoothTwoForm (cotangentModel I) (Cotangent I M) := by sorry

theorem canonicalForm_symplectic [FiniteDimensional ℝ E] :
    (canonicalForm (M := M) I).IsSymplectic := by sorry

/-- The canonical form agrees with the existing linear model in each cotangent chart. -/
theorem canonicalForm_inChart [FiniteDimensional ℝ E]
    (z₀ : Cotangent I M) (w : E × (E →L[ℝ] ℝ))
    (hw : w ∈ (extChartAt (cotangentModel I) z₀).target)
    (v : Fin 2 → (E × (E →L[ℝ] ℝ))) :
    (canonicalForm (M := M) I).1.inChartAt z₀ w v =
      TauCeti.strongDualCotangentSymplecticForm (v 0) (v 1) := by
  sorry

/-- Liouville read in cotangent chart coordinates is the existing linear Liouville form. -/
theorem liouville_inChart [I.Boundaryless] [FiniteDimensional ℝ E]
    (z₀ : Cotangent I M) (w : E × (E →L[ℝ] ℝ))
    (hw : w ∈ (extChartAt (cotangentModel I) z₀).target)
    (v : E × (E →L[ℝ] ℝ)) :
    liouville I ((extChartAt (cotangentModel I) z₀).symm w)
      (mfderiv 𝓘(ℝ, E × (E →L[ℝ] ℝ)) (cotangentModel I)
        (extChartAt (cotangentModel I) z₀).symm w v) =
      TauCeti.cotangentLiouvilleForm w (fun _ : Fin 1 ↦ v) := by
  sorry

variable {I}
/-- Embedded Lagrangians reuse the pinned embedding and tangent-range APIs. -/
def IsLagrangianEmbedding {F K Q : Type*} [NormedAddCommGroup F] [NormedSpace ℝ F]
    [TopologicalSpace K] (J : ModelWithCorners ℝ F K)
    [TopologicalSpace Q] [ChartedSpace K Q]
    (σ : TauCeti.SmoothTwoForm I M) (hσ : σ.IsNondegenerate)
    (i : TauCeti.SmoothEmbedding J I ∞ Q M) : Prop :=
  ∀ q, (hσ.symplecticFormAt (i q)).IsLagrangian (i.tangentRange q (by simp))

/-- Adapter to the degree-one `SmoothForm`/`ContMDiffSection` carrier; the equivalence
is a C1 target, not a second one-form library. -/
def IsSmoothOneForm (α : (x : M) → TangentSpace I x →L[ℝ] ℝ) : Prop :=
  ContMDiff I (cotangentModel I) ∞
    (fun x ↦ (TotalSpace.mk' (E →L[ℝ] ℝ) x (α x) : Cotangent I M))

/-- Pulling tautological Liouville back along a smooth section recovers its covector. -/
theorem liouville_section (α : (x : M) → TangentSpace I x →L[ℝ] ℝ)
    (hα : IsSmoothOneForm α) (x : M) (v : TangentSpace I x) :
    liouville I (TotalSpace.mk' (E →L[ℝ] ℝ) x (α x))
      (mfderiv I (cotangentModel I)
        (fun x ↦ (TotalSpace.mk' (E →L[ℝ] ℝ) x (α x) : Cotangent I M)) x v) = α x v := by
  sorry
end TauCetiRoadmap.SymplecticGeometry

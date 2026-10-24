import Mathlib.Analysis.Complex.Basic
import Mathlib.Algebra.Group.Equiv.Opposite
import Mathlib.Geometry.Manifold.Complex
import TauCeti.Geometry.Manifold.Basic
import TauCeti.Geometry.Manifold.Orientation
import TauCeti.Geometry.Symplectic.Manifold.AlmostComplex
import TauCetiRoadmap.ComplexKahlerGeometry.Suggested
import TauCeti.AlgebraicTopology.UniversalCover.Deck.FundamentalGroup.UniversalCover

/-!
**This file is not the roadmap and is not exhaustive.** The README is definitive.

The snippets reuse current smooth almost-complex and complex-geometric carriers. They are
interface sketches; the Teichmüller quotient, analytic slice, nonlinear uniformization,
and finite-cover loci are constructed by the roadmap targets.
-/

noncomputable section

namespace TauCetiRoadmap.TeichmullerGeometry

open scoped Manifold ContDiff

/- T1 begins with the existing smooth tangent-bundle endomorphism. -/
section TwoDimensionalIntegrability

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [FiniteDimensional ℝ E] [TopologicalSpace H]
  {I : ModelWithCorners ℝ E H} [TopologicalSpace M] [T2Space M]
  [ChartedSpace H M] [IsManifold I ∞ M]

/- Check the native explicit field formula, not the sorry-bearing tensor definition. -/
#check TauCetiRoadmap.ComplexKahlerGeometry.nijenhuisOnFields
#print axioms TauCetiRoadmap.ComplexKahlerGeometry.nijenhuisOnFields

theorem nijenhuisOnFields_eq_zero_of_finrank_two
    (J : TauCeti.SmoothAlmostComplexStructure I M)
    (hE : Module.finrank ℝ E = 2)
    (X Y : (x : M) → TangentSpace I x)
    (hX : ContMDiff I I.tangent ∞ (fun x ↦ (⟨x, X x⟩ : TangentBundle I M)))
    (hY : ContMDiff I I.tangent ∞ (fun x ↦ (⟨x, Y x⟩ : TangentBundle I M))) :
    ∀ x, TauCetiRoadmap.ComplexKahlerGeometry.nijenhuisOnFields J X Y x = 0 := by
  sorry

end TwoDimensionalIntegrability


/- The geometric surface group uses first-traverse multiplication. -/
abbrev GeometricSurfaceGroup (S : Type*) [TopologicalSpace S] (x₀ : S) :=
  (FundamentalGroup S x₀)ᵐᵒᵖ

def geometricToNative (S : Type*) [TopologicalSpace S] (x₀ : S) :
    GeometricSurfaceGroup S x₀ ≃* FundamentalGroup S x₀ :=
  (MulEquiv.inv' (FundamentalGroup S x₀)).symm

@[simp] theorem geometricToNative_op (S : Type*) [TopologicalSpace S] (x₀ : S)
    (p : FundamentalGroup S x₀) :
    geometricToNative S x₀ (MulOpposite.op p) = p⁻¹ := rfl

#check FundamentalGroup.mul_def
#check MulEquiv.inv'
#check TauCeti.UniversalCover.deckFundamentalGroupEquiv
#check TauCeti.UniversalCover.deckFundamentalGroupEquiv_symm_op

/- Existing closed connected surface carrier; genus and marking are extra data. -/
#check TauCeti.IsClosedConnectedSurface

/- Orientation is separate from the almost-complex endomorphism. -/
#check TauCeti.Orientable
#check TauCeti.IsOrientedAtlas

/- Existing almost-complex carrier. -/
#check TauCeti.SmoothAlmostComplexStructure

/- Existing CKG complex-to-real manifold interface. -/
#check TauCetiRoadmap.ComplexKahlerGeometry.realified_isManifold_analytic

end TauCetiRoadmap.TeichmullerGeometry

import Mathlib.Analysis.Calculus.DifferentialForm.Basic
import Mathlib.Analysis.Calculus.ContDiff.Basic
import Mathlib.Analysis.Calculus.Deriv.Basic
import Mathlib.Analysis.Normed.Module.Alternating.Curry

/-!
**This file is not the roadmap and is not exhaustive.** README5.4a is definitive.
These Euclidean signatures use the native alternating-form and derivative APIs.
The moving-pullback theorem is an admitted target; no extra form carrier is introduced.
-/

open scoped ContDiff

noncomputable section
namespace TauCetiRoadmap.DifferentialGeometry.MovingMaps

variable {E F G : Type*}
  [NormedAddCommGroup E] [NormedSpace ℝ E]
  [NormedAddCommGroup F] [NormedSpace ℝ F]
  [NormedAddCommGroup G] [NormedSpace ℝ G] {k : ℕ}

/-- First-slot insertion by a field along p, then pullback of the remaining slots. -/
def contractionAlongMap (p : E → F) (V : E → F)
    (form : F → F [⋀^Fin (k + 1)]→L[ℝ] G) (x : E) : E [⋀^Fin k]→L[ℝ] G :=
  ((form (p x)).curryLeft (V x)).compContinuousLinearMap (fderiv ℝ p x)

theorem contractionAlongMap_apply (p : E → F) (V : E → F)
    (form : F → F [⋀^Fin (k + 1)]→L[ℝ] G) (x : E) (v : Fin k → E) :
    contractionAlongMap p V form x v =
      form (p x) (Matrix.vecCons (V x) (fun i ↦ fderiv ℝ p x (v i))) := rfl

/-- The product is ordered as manifold variable followed by time. -/
def familyContraction (P : E × ℝ → F) (t : ℝ)
    (form : F → F [⋀^Fin (k + 1)]→L[ℝ] G) : E → E [⋀^Fin k]→L[ℝ] G :=
  contractionAlongMap (fun x ↦ P (x, t))
    (fun x ↦ fderiv ℝ P (x, t) (0, 1)) form

/-- No invertibility of the slices or completeness of the coefficient space is required. -/
theorem moving_pullback_hasDerivAt
    (P : E × ℝ → F) (form : F → F [⋀^Fin (k + 1)]→L[ℝ] G)
    (hP : ContDiff ℝ ∞ P) (hform : ContDiff ℝ ∞ form) (x : E) (t : ℝ) :
    HasDerivAt
      (fun s ↦ (form (P (x, s))).compContinuousLinearMap
        (fderiv ℝ (fun y ↦ P (y, s)) x))
      (extDeriv (familyContraction P t form) x +
        familyContraction P t (extDeriv form) x) t := by
  sorry

end TauCetiRoadmap.DifferentialGeometry.MovingMaps

import TauCeti.Geometry.Symplectic.StandardCompatible
import Mathlib.Analysis.Normed.Module.Alternating.Basic
import Mathlib.Analysis.InnerProductSpace.NormDet
import Mathlib.Analysis.InnerProductSpace.ExteriorPower
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.Analysis.SpecialFunctions.Exp
import Mathlib.Analysis.Calculus.ImplicitContDiff

/-!
# Selected interfaces for calibrated geometry

**This file is not the roadmap and is not exhaustive.** `README.md` is definitive.
The linear targets below use native continuous alternating maps, orthonormal
frames and norm determinants. Manifold integration and nonlinear deformation
interfaces follow their specified suppliers; they are not replaced by empty
proposition fields here. Unproved statements have honest `sorry` proofs.
-/

noncomputable section

namespace TauCetiRoadmap.CalibratedGeometry

open scoped BigOperators Topology ContDiff

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
  [FiniteDimensional ℝ E] {k : ℕ}

/-- C1: the volume of a frame uses the native rectangular norm determinant. -/
def frameVolume (v : Fin k → E) : ℝ :=
  LinearMap.normDet ((EuclideanSpace.basisFun (Fin k) ℝ).toBasis.constr ℝ v)

/-- C1: geometric equality includes the specified positive orientation. -/
def IsCalibratedFrame (φ : E [⋀^Fin k]→L[ℝ] ℝ) (v : Fin k → E) : Prop :=
  Orthonormal ℝ v ∧ φ v = 1

/-- C1: geometric characterization of the existing alternating-map norm. -/
theorem norm_eq_sSup_abs_orthonormal (φ : E [⋀^Fin k]→L[ℝ] ℝ) :
    ‖φ‖ = sSup {r | ∃ v : Fin k → E, Orthonormal ℝ v ∧ r = |φ v|} := by
  sorry

/-- C1: rank-deficient frames are included. -/
theorem abs_eval_le_norm_mul_frameVolume
    (φ : E [⋀^Fin k]→L[ℝ] ℝ) (v : Fin k → E) :
    |φ v| ≤ ‖φ‖ * frameVolume v := by
  sorry

omit [FiniteDimensional ℝ E] in
theorem calibratedFrame_of_neg
    (φ : E [⋀^Fin k]→L[ℝ] ℝ) (v : Fin k → E)
    (hv : Orthonormal ℝ v) (heq : φ v = -1) :
    IsCalibratedFrame (-φ) v := by
  exact ⟨hv, by simp [heq]⟩

section ComplexModels

/-- The native real doubled model has the pinned positive coordinate sign. -/
theorem native_standardSymplectic_sign :
    TauCeti.stdSymplecticForm (V := ℝ) (1, 0) (0, 1) = 1 := by
  simp


/-- C5: the determinant volume form on ℂⁿ restricted to real scalars. -/
def standardComplexVolume (n : ℕ) :
    (EuclideanSpace ℂ (Fin n)) [⋀^Fin n]→L[ℝ] ℂ := by
  sorry

theorem standardComplexVolume_apply (n : ℕ)
    (v : Fin n → EuclideanSpace ℂ (Fin n)) :
    standardComplexVolume n v = Matrix.det (fun i j => v j i) := by
  sorry

/-- C5: adapter of native stdSymplecticForm along z↦(Re z,Im z);
its conjugate-first Hermitian imaginary-part comparison pins the sign. -/
def standardKahlerForm (n : ℕ) :
    (EuclideanSpace ℂ (Fin n)) [⋀^Fin 2]→L[ℝ] ℝ := by
  sorry

theorem standardKahlerForm_apply (n : ℕ)
    (v : Fin 2 → EuclideanSpace ℂ (Fin n)) :
    standardKahlerForm n v = (inner ℂ (v 0) (v 1)).im := by
  sorry

/-- C5: the adapter evaluates on the native real doubled model. -/
theorem standardKahlerForm_apply_stdSymplecticForm (n : ℕ)
    (v : Fin 2 → EuclideanSpace ℂ (Fin n)) :
    standardKahlerForm n v =
      TauCeti.stdSymplecticForm (V := EuclideanSpace ℝ (Fin n))
        ((WithLp.toLp 2 (fun j => (v 0 j).re)),
          (WithLp.toLp 2 (fun j => (v 0 j).im)))
        ((WithLp.toLp 2 (fun j => (v 1 j).re)),
          (WithLp.toLp 2 (fun j => (v 1 j).im))) := by
  sorry

/-- C5: the phase convention is Re(exp(-iθ) Ω). -/
def standardSpecialLagrangianForm (n : ℕ) (θ : ℝ) :
    (EuclideanSpace ℂ (Fin n)) [⋀^Fin n]→L[ℝ] ℝ := by
  sorry

theorem standardSpecialLagrangianForm_apply (n : ℕ) (θ : ℝ)
    (v : Fin n → EuclideanSpace ℂ (Fin n)) :
    standardSpecialLagrangianForm n θ v =
      (Complex.exp (-(θ : ℂ) * Complex.I) * standardComplexVolume n v).re := by
  sorry

theorem norm_standardSpecialLagrangianForm (n : ℕ) (hn : 1 ≤ n) (θ : ℝ) :
    ‖standardSpecialLagrangianForm n θ‖ = 1 := by
  sorry

/-- C5: ordered orthonormal frames include the positive orientation test. -/
theorem specialLagrangianFrame_iff (n : ℕ) (hn : 1 ≤ n) (θ : ℝ)
    (v : Fin n → EuclideanSpace ℂ (Fin n)) (hv : Orthonormal ℝ v) :
    standardSpecialLagrangianForm n θ v = 1 ↔
      (∀ i j, (inner ℂ (v i) (v j)).im = 0) ∧
      (Complex.exp (-(θ : ℂ) * Complex.I) * standardComplexVolume n v).im = 0 ∧
      0 < (Complex.exp (-(θ : ℂ) * Complex.I) * standardComplexVolume n v).re := by
  sorry

end ComplexModels

section NonlinearShape

variable {X Y Z H : Type*}
  [NormedAddCommGroup X] [NormedSpace ℝ X] [CompleteSpace X]
  [NormedAddCommGroup Y] [NormedSpace ℝ Y] [CompleteSpace Y]
  [NormedAddCommGroup Z] [NormedSpace ℝ Z] [CompleteSpace Z]
  [NormedAddCommGroup H] [NormedSpace ℝ H] [CompleteSpace H]

/-- C6: instantiate d and harmonic projection on the specified Hölder carriers.
This intersection has actual equations; closedness makes it a Banach subspace. -/
def closedHarmonicOrthogonalTarget (d : X →L[ℝ] Y) (harmonic : X →L[ℝ] H) :
    Submodule ℝ X := d.ker ⊓ harmonic.ker

/-- Smooth here is ∞; ℕ∞ω's top element requests analyticity. The actual
C6 nonlinear map and harmonic projection supply this native IFT data. -/
theorem smooth_implicit_solution
    (φ : ImplicitFunctionData ℝ X Y Z)
    (hf : ContDiffAt ℝ ∞ φ.leftFun φ.pt)
    (hg : ContDiffAt ℝ ∞ φ.rightFun φ.pt) :
    ContDiffAt ℝ ∞ φ.implicitFunction.uncurry (φ.prodFun φ.pt) := by
  exact φ.contDiffAt_implicitFunction hf hg (by simp)

end NonlinearShape

end TauCetiRoadmap.CalibratedGeometry

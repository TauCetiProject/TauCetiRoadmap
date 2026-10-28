import Mathlib.LinearAlgebra.Prod

/-!
# Nonsymmetric torus Morse–Bott sign calibration

This file is not the roadmap and is not exhaustive. `README.md`, M.7, is
definitive. These native linear maps calibrate the degreewise chain shear;
they do not construct the metric, flow, rotation prism or current complex.
-/

namespace TauCetiRoadmap.HeegaardFloer.TorusBottShear

variable {R A B C : Type*} [Ring R]
  [AddCommGroup A] [AddCommGroup B] [AddCommGroup C]
  [Module R A] [Module R B] [Module R C]

/-- The change of coordinates induced by a degree-one nullhomotopy. -/
def shear (P : B →ₗ[R] A) : (A × B) ≃ₗ[R] (A × B) :=
  (LinearEquiv.prodComm R A B).trans
    (((LinearEquiv.refl R B).skewProd (LinearEquiv.refl R A) P).trans
      (LinearEquiv.prodComm R B A))

theorem shear_apply (P : B →ₗ[R] A) (x : A) (y : B) :
    shear P (x, y) = (x + P y, y) := by
  rfl

/-- With F = ∂P + P∂, Φ intertwines (∂x + Fy, −∂y) with (∂x, −∂y).
A, B and C stand for three consecutive degrees of the same chain complex.
The integral current application specializes R to ℤ. -/
theorem shear_intertwines (d : A →ₗ[R] B) (e : B →ₗ[R] C)
    (P : B →ₗ[R] A) (Q : C →ₗ[R] B) (F : B →ₗ[R] B)
    (hF : F = d.comp P + Q.comp e) (x : A) (y : B) :
    shear Q (d x + F y, -e y) =
      (d (shear P (x, y)).1, -e (shear P (x, y)).2) := by
  sorry

end TauCetiRoadmap.HeegaardFloer.TorusBottShear

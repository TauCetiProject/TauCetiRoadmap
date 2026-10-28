import Mathlib.Algebra.Module.LinearMap.Basic
import Mathlib.Basic.Real.Basic

/-!
Suggested forms are aids, not the specification; the README is definitive.
These algebraic formulas fix R1.2's normalization. The geometric application
uses the existing connection curvature tensor paired with the metric.
-/
noncomputable section
namespace TauCetiRoadmap.RiemannianGeometry.CurvaturePolarization

variable {V : Type*} [AddCommGroup V] [Module ℝ V]

def numerator (r : V →ₗ[ℝ] V →ₗ[ℝ] V →ₗ[ℝ] V →ₗ[ℝ] ℝ) (x y : V) : ℝ :=
  r x y y x

def mixed (Q : V → V → ℝ) (x w y z : V) : ℝ :=
  Q (x + w) (y + z) - Q (x + w) (y - z) -
    Q (x - w) (y + z) + Q (x - w) (y - z)

/-- Purely algebraic reconstruction, with no metric or independent-vector assumption. -/
theorem polarization
    (r : V →ₗ[ℝ] V →ₗ[ℝ] V →ₗ[ℝ] V →ₗ[ℝ] ℝ)
    (hskew : ∀ a b c d, r a b c d = -r b a c d)
    (hpair : ∀ a b c d, r a b c d = r c d a b)
    (hbianchi : ∀ a b c d, r a b c d + r b c a d + r c a b d = 0)
    (x y z w : V) :
    24 * r x y z w = mixed (numerator r) x w y z - mixed (numerator r) y w x z := by
  sorry

/-- Equal sectional numerators determine equal four-tensors, without division by a Gram determinant. -/
theorem eq_of_numerator_eq
    (r s : V →ₗ[ℝ] V →ₗ[ℝ] V →ₗ[ℝ] V →ₗ[ℝ] ℝ)
    (hrskew : ∀ a b c d, r a b c d = -r b a c d)
    (hrpair : ∀ a b c d, r a b c d = r c d a b)
    (hrbianchi : ∀ a b c d, r a b c d + r b c a d + r c a b d = 0)
    (hsskew : ∀ a b c d, s a b c d = -s b a c d)
    (hspair : ∀ a b c d, s a b c d = s c d a b)
    (hsbianchi : ∀ a b c d, s a b c d + s b c a d + s c a b d = 0)
    (hQ : numerator r = numerator s) : r = s := by
  sorry

end TauCetiRoadmap.RiemannianGeometry.CurvaturePolarization

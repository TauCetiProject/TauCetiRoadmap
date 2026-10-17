import Mathlib.AlgebraicGeometry.EllipticCurve.Weierstrass
import Mathlib.AlgebraicGeometry.EllipticCurve.VariableChange
import Mathlib.RingTheory.Localization.Away.Basic
import Mathlib.Algebra.MvPolynomial.Basic

/-!
These are suggested forms, not an exhaustive checklist. README.md is definitive.
The prototype uses the native coordinate atlas, not a private elliptic-curve
or spectral carrier. The sheaf and spectral interfaces need the explicit
prerequisite constructions in the README.
-/

noncomputable section
namespace TauCetiRoadmap.EllipticCohomology

private def translateX : WeierstrassCurve.VariableChange ℤ := ⟨1, 1, 0, 0⟩
private def shearY : WeierstrassCurve.VariableChange ℤ := ⟨1, 0, 1, 0⟩

/-- The u=1 coordinate-change subgroup is noncommutative; E1 uses the
native group law rather than an additive three-parameter group. -/
theorem unipotentCoordinateChanges_noncommute :
    translateX * shearY ≠ shearY * translateX := by
  intro h
  have ht := congrArg WeierstrassCurve.VariableChange.t h
  norm_num [translateX, shearY, WeierstrassCurve.VariableChange.mul_def] at ht

abbrev WeierstrassCoordinateRing := MvPolynomial (Fin 5) ℤ

/-- E1: the universal coordinate chart retains the native five coefficients. -/
def universalWeierstrass : WeierstrassCurve WeierstrassCoordinateRing :=
  ⟨MvPolynomial.X 0, MvPolynomial.X 1, MvPolynomial.X 2,
    MvPolynomial.X 3, MvPolynomial.X 4⟩

/-- E1: this is the discriminant-open coordinate atlas, before the stack quotient. -/
abbrev EllipticCoordinateRing := Localization.Away universalWeierstrass.Δ

def universalEllipticCoordinateCurve : WeierstrassCurve EllipticCoordinateRing :=
  universalWeierstrass.map (algebraMap WeierstrassCoordinateRing EllipticCoordinateRing)

/-- The coordinate atlas has invertible discriminant. Global Weierstrass
representability is a separate scheme/descent statement. -/
theorem universalEllipticCoordinateCurve_discriminant_isUnit :
    IsUnit universalEllipticCoordinateCurve.Δ := by
  change IsUnit (universalWeierstrass.map
    (algebraMap WeierstrassCoordinateRing EllipticCoordinateRing)).Δ
  rw [WeierstrassCurve.map_Δ]
  exact IsLocalization.Away.algebraMap_isUnit universalWeierstrass.Δ

instance universalEllipticCoordinateCurve_isElliptic :
    universalEllipticCoordinateCurve.IsElliptic :=
  ⟨universalEllipticCoordinateCurve_discriminant_isUnit⟩

/-- Existing native invariant identity pins the algebraic normalization. -/
theorem universal_c_relation :
    1728 * universalWeierstrass.Δ =
      universalWeierstrass.c₄ ^ 3 - universalWeierstrass.c₆ ^ 2 :=
  universalWeierstrass.c_relation

/-- E6's coordinate equation; the level structure and elliptic open are
constructed separately from this native Weierstrass carrier. -/
def gammaOneThreeCurve {R : Type*} [CommRing R] (a₁ a₃ : R) :
    WeierstrassCurve R := ⟨a₁, 0, a₃, 0, 0⟩

/-- Integral c₄ normalization before reduction mod 2. -/
theorem gammaOneThreeCurve_c₄ {R : Type*} [CommRing R] (a₁ a₃ : R) :
    (gammaOneThreeCurve a₁ a₃).c₄ = a₁ ^ 4 - 24 * a₁ * a₃ := by
  simp only [WeierstrassCurve.c₄, WeierstrassCurve.b₂,
    WeierstrassCurve.b₄, gammaOneThreeCurve]
  ring

/-- Native c₆ uses the sign fixed in E1. -/
theorem gammaOneThreeCurve_c₆ {R : Type*} [CommRing R] (a₁ a₃ : R) :
    (gammaOneThreeCurve a₁ a₃).c₆ =
      -a₁ ^ 6 + 36 * a₁ ^ 3 * a₃ - 216 * a₃ ^ 2 := by
  simp only [WeierstrassCurve.c₆, WeierstrassCurve.b₂,
    WeierstrassCurve.b₄, WeierstrassCurve.b₆, gammaOneThreeCurve]
  ring

/-- This discriminant is an integral polynomial, with no fourth-power
coordinate claim. -/
theorem gammaOneThreeCurve_discriminant {R : Type*} [CommRing R] (a₁ a₃ : R) :
    (gammaOneThreeCurve a₁ a₃).Δ = a₁ ^ 3 * a₃ ^ 3 - 27 * a₃ ^ 4 := by
  simp only [WeierstrassCurve.Δ, WeierstrassCurve.b₂,
    WeierstrassCurve.b₄, WeierstrassCurve.b₆, WeierstrassCurve.b₈,
    gammaOneThreeCurve]
  ring

end TauCetiRoadmap.EllipticCohomology

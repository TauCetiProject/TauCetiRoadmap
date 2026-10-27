import Mathlib

/-!
# Elliptic cohomology and topological modular forms: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, against
the pinned Mathlib, the algebraic normalizations that the roadmap's Layer E1
and Layer E6 coefficient statements are written in: the native
`WeierstrassCurve.VariableChange` group law, the discriminant-open
Weierstrass atlas, the `c₄`/`c₆`/`Δ` relation, and the integral Γ₁(3)
Tate-normal-form invariants.

Headline theorems not statable at the pins:
* `H⁰(Mbar_ell, ω^*) ≅ ℤ[c₄, c₆, Δ]/(c₄³ − c₆² − 1728Δ)` (E1): Mathlib has no
  moduli stack of stable genus-one curves and no Hodge line bundle on it.
* The sheaf `O^top`, the spectra `tmf`, `Tmf`, `TMF`, their descent spectral
  sequences, the Gap Theorem and `π_* tmf[1/6] ≅ ℤ[1/6][c₄, c₆]` (E2–E4):
  Mathlib has no structured ring spectra or sheaves of spectra.
* The Ando–Hopkins–Rezk orientation `MString → tmf` and its surjectivity on
  homotopy (E5): no Thom spectra or E∞ ring maps.
* `tmf_(2) ∧ DA(1) ≃ tmf₁(3)_(2)` and `π_* tmf₁(3)_(2) ≅ ℤ_(2)[a₁, a₃]` (E6):
  no spectra or level-structure moduli.
-/

noncomputable section
namespace TauCetiRoadmap.EllipticCohomology

/-- The coordinate change `x = x′ + 1`, `y = y′` (`u = 1`, `r = 1`). -/
def translateX : WeierstrassCurve.VariableChange ℤ := ⟨1, 1, 0, 0⟩

/-- The coordinate change `x = x′`, `y = y′ + x′` (`u = 1`, `s = 1`). -/
def shearY : WeierstrassCurve.VariableChange ℤ := ⟨1, 0, 1, 0⟩

/-- The u=1 coordinate-change subgroup is noncommutative; E1 uses the
native group law rather than an additive three-parameter group. -/
theorem unipotentCoordinateChanges_noncommute :
    translateX * shearY ≠ shearY * translateX := by
  intro h
  have ht := congrArg WeierstrassCurve.VariableChange.t h
  norm_num [translateX, shearY, WeierstrassCurve.VariableChange.mul_def] at ht

/-- E1: the coefficient ring `ℤ[a₁, a₂, a₃, a₄, a₆]` of the Weierstrass cubic stack. -/
abbrev WeierstrassCoordinateRing := MvPolynomial (Fin 5) ℤ

/-- E1: the universal coordinate chart retains the native five coefficients. -/
def universalWeierstrass : WeierstrassCurve WeierstrassCoordinateRing :=
  ⟨MvPolynomial.X 0, MvPolynomial.X 1, MvPolynomial.X 2,
    MvPolynomial.X 3, MvPolynomial.X 4⟩

/-- E1: this is the discriminant-open coordinate atlas, before the stack quotient. -/
abbrev EllipticCoordinateRing := Localization.Away universalWeierstrass.Δ

/-- E1: the universal Weierstrass curve base-changed to the discriminant-open atlas. -/
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

/-- The universal curve on the discriminant-open atlas is elliptic. -/
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

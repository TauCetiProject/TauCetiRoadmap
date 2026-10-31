import Mathlib
import TauCeti.KnotTheory.PDCode.Planar
import TauCeti.KnotTheory.PDCode.Kauffman

/-!
# Kauffman Λ, F and Q: suggested coefficient and specialization targets

This file is not the roadmap and is not exhaustive. The README is definitive.
The regular-isotopy construction, skein and curl producers remain geometric targets.
The rings, units, specializations and normalizations below use existing native APIs.
-/
noncomputable section
namespace KauffmanFQTargets
open TauCeti LaurentPolynomial

abbrev XCoeff := LaurentPolynomial ℤ
abbrev Coeff := LaurentPolynomial XCoeff

def aUnit : Coeffˣ :=
  ⟨T 1, T (-1), by rw [← T_add]; norm_num, by rw [← T_add]; norm_num⟩

def innerXUnit : XCoeffˣ :=
  ⟨T 1, T (-1), by rw [← T_add]; norm_num, by rw [← T_add]; norm_num⟩

def xUnit : Coeffˣ := Units.map (C : XCoeff →+* Coeff).toMonoidHom innerXUnit

def evaluate (S : Type*) [CommRing S] (a x : Sˣ) : Coeff →+* S :=
  eval₂ (eval₂ (Int.castRingHom S) x) a

def evalAone : Coeff →+* XCoeff := eval₂ (RingHom.id XCoeff) 1

def mirror : Coeff ≃ₐ[XCoeff] Coeff := LaurentPolynomial.invert

def loopValue : Coeff :=
  ((aUnit : Coeff) + ((aUnit⁻¹ : Coeffˣ) : Coeff)) * ((xUnit⁻¹ : Coeffˣ) : Coeff) - 1

def qLoopValue : XCoeff := 2 * T (-1) - 1

theorem evalAone_loop : evalAone loopValue = qLoopValue := by
  norm_num [evalAone, loopValue, qLoopValue, aUnit, xUnit, innerXUnit]

theorem mirror_involutive (P : Coeff) : mirror (mirror P) = P :=
  LaurentPolynomial.involutive_invert P

theorem evalAone_mirror (P : Coeff) : evalAone (mirror P) = evalAone P := by
  induction P using LaurentPolynomial.induction_on' with
  | add P Q hP hQ => simp only [map_add, hP, hQ]
  | C_mul_T k c => simp [mirror, evalAone]

theorem mirror_loop : mirror loopValue = loopValue := by
  simp [loopValue, aUnit, xUnit, innerXUnit, mirror, add_comm]

/-- This is the actual Laurent monomial a^(-w), including negative writhe. -/
def normalize (w : ℤ) (P : Coeff) : Coeff := T (-w) * P

theorem aUnit_zpow (k : ℤ) : ((aUnit ^ k : Coeffˣ) : Coeff) = T k := by
  cases k with
  | ofNat n => simp [aUnit]
  | negSucc n => simp [zpow_negSucc, aUnit]; congr 1; omega

theorem normalize_eq_unit (w : ℤ) (P : Coeff) :
    normalize w P = ((aUnit ^ (-w) : Coeffˣ) : Coeff) * P := by
  rw [aUnit_zpow]
  rfl

theorem normalize_curl (w : ℤ) (P : Coeff) :
    normalize (w + 1) ((aUnit : Coeff) * P) = normalize w P := by
  simp only [normalize, aUnit, ← mul_assoc, ← T_add]
  congr 1
  congr 1
  omega

theorem mirror_normalize (w : ℤ) (P : Coeff) :
    mirror (normalize w P) = normalize (-w) (mirror P) := by
  simp [mirror, normalize]

theorem evalAone_normalize (w : ℤ) (P : Coeff) :
    evalAone (normalize w P) = evalAone P := by
  simp [evalAone, normalize]

def unlinkF (components : ℕ) : Coeff := loopValue ^ (components - 1)
def unlinkQ (components : ℕ) : XCoeff := qLoopValue ^ (components - 1)

/-- The geometric unlink comparison is required only for components>=1. -/
theorem evalAone_unlink (components : ℕ) : evalAone (unlinkF components) = unlinkQ components := by
  simp [unlinkF, unlinkQ, map_pow, evalAone_loop]

def trefoilF : Coeff :=
  (T (-2) + T (-4)) * (xUnit : Coeff) ^ 2 +
    (T (-3) + T (-5)) * (xUnit : Coeff) - 2 * T (-2) - T (-4)

def trefoilQ : XCoeff := 2 * T 2 + 2 * T 1 - 3

theorem trefoil_at_one : evalAone trefoilF = trefoilQ := by
  norm_num [trefoilF, trefoilQ, evalAone, xUnit, innerXUnit, map_ofNat]; ring

def hopfF : Coeff :=
  (T (-1) + T (-3)) * ((xUnit : Coeff) - ((xUnit⁻¹ : Coeffˣ) : Coeff)) + T (-2)

def hopfQ : XCoeff := 2 * T 1 - 2 * T (-1) + 1

theorem hopf_at_one : evalAone hopfF = hopfQ := by
  norm_num [hopfF, hopfQ, evalAone, xUnit, innerXUnit, map_ofNat]; ring

abbrev JonesCoeff := RatFunc ℚ
def A : JonesCoeff := RatFunc.X

def AUnit : JonesCoeffˣ := Units.mk0 A RatFunc.X_ne_zero

def jonesAUnit : JonesCoeffˣ :=
  Units.mk0 (-(A ^ 3)) (neg_ne_zero.mpr (pow_ne_zero _ RatFunc.X_ne_zero))

theorem jonesX_ne_zero : A + A⁻¹ ≠ 0 := by sorry

def jonesXUnit : JonesCoeffˣ := Units.mk0 (A + A⁻¹) jonesX_ne_zero

def jonesInner : XCoeff →+* JonesCoeff := eval₂ (Int.castRingHom JonesCoeff) jonesXUnit
def jonesSpecialization : Coeff →+* JonesCoeff := eval₂ jonesInner jonesAUnit

theorem jones_loop : jonesSpecialization loopValue = -(A ^ 2 + A⁻¹ ^ 2) := by sorry

/-- Future regular-isotopy invariant on actual nonempty planar native diagrams. -/
def regularLambda {n : ℕ} (D : PDCode n) (hD : D.IsPlanar)
    (hne : 0 < D.componentCount) : Coeff := by sorry

def kauffmanF {n : ℕ} (D : OrientedPDCode n) (hD : D.IsPlanar)
    (hne : 0 < D.componentCount) : Coeff :=
  normalize D.writhe (regularLambda D.toPDCode hD hne)

def absoluteQ {n : ℕ} (D : OrientedPDCode n) (hD : D.IsPlanar)
    (hne : 0 < D.componentCount) : XCoeff := evalAone (kauffmanF D hD hne)

theorem lambda_jones {n : ℕ} (D : PDCode n) (hD : D.IsPlanar)
    (hne : 0 < D.componentCount) :
    jonesSpecialization (regularLambda D hD hne) = D.kauffmanBracket AUnit := by sorry

theorem F_jones {n : ℕ} (D : OrientedPDCode n) (hD : D.IsPlanar)
    (hne : 0 < D.componentCount) :
    jonesSpecialization (kauffmanF D hD hne) = D.normalizedKauffmanBracket AUnit := by sorry

end KauffmanFQTargets

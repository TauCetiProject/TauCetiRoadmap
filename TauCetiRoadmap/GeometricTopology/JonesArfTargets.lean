import TauCeti.KnotTheory.SeifertMatrix.SEquivalence
import TauCeti.KnotTheory.PDCode.Jones
import TauCeti.KnotTheory.PDCode.Planar
import Mathlib.LinearAlgebra.QuadraticForm.Radical
import Mathlib.LinearAlgebra.FiniteDimensional.Defs
import Mathlib.Basic.Complex.Basic

/-!
# Seifert Gauss sums and the integral Jones quotient: suggested targets

**This file is not the roadmap and is not exhaustive.** The README is definitive.
The matrices here use the native integral matrix and quadratic-map carriers. Their
geometric realization, boundary-radical dictionary and Clifford/Jones comparison
are required there, not asserted by arbitrary matrix input. Generic nonsingular
Arf theory remains with TangentialBordism B3.2.
-/

noncomputable section

namespace TauCetiRoadmap.GeometricTopology.JonesArf

open TauCeti LaurentPolynomial

abbrev F2 := ZMod 2
abbrev Coeff := LaurentPolynomial ℤ

variable {n : ℕ}

/-- Keep the raw matrix before forming xᵀVx in characteristic two. -/
def seifertQuadratic (S : Matrix (Fin n) (Fin n) ℤ) : QuadraticForm F2 (Fin n → F2) :=
  (S.map (Int.castRingHom F2)).toQuadraticForm'

def polarRadical (S : Matrix (Fin n) (Fin n) ℤ) : Submodule F2 (Fin n → F2) :=
  (seifertQuadratic S).polarBilin.ker

def sign (a : F2) : ℤ := (-1) ^ a.val

def gauss (S : Matrix (Fin n) (Fin n) ℤ) : ℤ :=
  ∑ x : Fin n → F2, sign (seifertQuadratic S x)

theorem polar_matrix (S : Matrix (Fin n) (Fin n) ℤ) (x y : Fin n → F2) :
    (seifertQuadratic S).polarBilin x y =
      dotProduct x (((S + S.transpose).map (Int.castRingHom F2)).mulVec y) := by
  sorry

theorem gauss_zero_of_radical (S : Matrix (Fin n) (Fin n) ℤ)
    (r : polarRadical S) (hr : seifertQuadratic S r = 1) : gauss S = 0 := by
  sorry

theorem gauss_quotient (S : Matrix (Fin n) (Fin n) ℤ)
    (hR : polarRadical S ≤ (seifertQuadratic S).radical) :
    gauss S = (Nat.card (polarRadical S) : ℤ) *
      @Finset.sum ((Fin n → F2) ⧸ polarRadical S) ℤ _
        (Finset.univ (α := (Fin n → F2) ⧸ polarRadical S))
        (fun x ↦ sign (((seifertQuadratic S).lift (polarRadical S) hR) x)) := by
  sorry

theorem polar_quotient_nondegenerate (S : Matrix (Fin n) (Fin n) ℤ)
    (hR : polarRadical S ≤ (seifertQuadratic S).radical) :
    (((seifertQuadratic S).lift (polarRadical S) hR).polarBilin).Nondegenerate := by
  sorry

theorem gauss_enlarge_column (S : Matrix (Fin n) (Fin n) ℤ) (v : Fin n → ℤ) :
    gauss (KnotTheory.enlargeColumnFin S v) = 2 * gauss S := by
  sorry

def squareSubstitution : Coeff →+* Coeff :=
  LaurentPolynomial.eval₂ LaurentPolynomial.C (isUnit_T (R := ℤ) 2).unit

def evaluate (u : ℂˣ) : Coeff →+* ℂ :=
  LaurentPolynomial.eval₂ (Int.castRingHom ℂ) u

def integerEvaluate (u : ℤˣ) : Coeff →+* ℤ :=
  LaurentPolynomial.eval₂ (RingHom.id ℤ) u

/-- The native variable for a diagram's Jones polynomial is u=t^(1/2). -/
theorem integral_jones_exists_unique (D : OrientedPDCode n)
    (hPlanar : D.toPDCode.IsPlanar) (hD : 0 < D.componentCount) :
    ∃! P : Coeff, D.jonesPolynomial =
      (if Even D.componentCount then T 1 else 1) * squareSubstitution P := by
  sorry

/-- Ordinary Laurent derivative: d(t^k)/dt=k t^(k-1), also for negative k. -/
def derivative (P : Coeff) : Coeff :=
  P.coeff.sum (fun k a ↦ C (k * a) * T (k - 1))

def denominator : Coeff := (1 - T 3) * (1 - T 1)

theorem W_exists_unique (P : Coeff) (w : ℂˣ)
    (hw : (w : ℂ) ^ 2 + (w : ℂ) + 1 = 0)
    (hOne : integerEvaluate 1 P = 1)
    (hDeriv : integerEvaluate 1 (derivative P) = 0)
    (hCube : evaluate w P = 1) :
    ∃! W : Coeff, denominator * W = 1 - P := by
  sorry

/-- The knot target is on actual planar native codes, with no assumed W quotient. -/
theorem native_knot_W_exists_unique (D : OrientedPDCode n)
    (hPlanar : D.toPDCode.IsPlanar) (hKnot : D.componentCount = 1) :
    ∃! W : Coeff, squareSubstitution (denominator * W) = 1 - D.jonesPolynomial := by
  sorry

theorem W_mirror (P W : Coeff) (hW : denominator * W = 1 - P) :
    denominator * (T (-4) * invert W) = 1 - invert P := by
  sorry

theorem W_connected_sum (P Q W X : Coeff)
    (hW : denominator * W = 1 - P) (hX : denominator * X = 1 - Q) :
    denominator * (W + X - denominator * W * X) = 1 - P * Q := by
  sorry

theorem W_arf_value (P W : Coeff) (a : F2) (u : ℂˣ)
    (hu : (u : ℂ) = Complex.I) (hW : denominator * W = 1 - P)
    (hArf : evaluate u P = (sign a : ℂ)) :
    evaluate u W = (a.val : ℂ) := by
  sorry

theorem signed_alexander_mod_eight (W : Coeff) (a : F2) (u : ℂˣ)
    (hu : (u : ℂ) = Complex.I) (hArf : evaluate u W = (a.val : ℂ)) :
    Int.ModEq 8 (1 - 4 * integerEvaluate (-1) W) (1 - 4 * (a.val : ℤ)) := by
  sorry

end TauCetiRoadmap.GeometricTopology.JonesArf

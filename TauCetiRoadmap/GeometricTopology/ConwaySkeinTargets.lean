import TauCeti.KnotTheory.SeifertMatrix.SEquivalence
import Mathlib

/-!
**This file is not the roadmap and is not exhaustive.** The README is definitive.
These are genuine polynomial, Laurent and Seifert-matrix interfaces. The realized
skein triples, Seifert-surface comparisons and link invariants remain its targets.
-/

noncomputable section
namespace TauCetiRoadmap.GeometricTopology.ConwaySkein
open LaurentPolynomial Matrix

abbrev HalfLaurent := LaurentPolynomial ℤ

/-- The ordinary Conway variable maps to s-s⁻¹ in the half-variable ring. -/
def conwayEmbedding : Polynomial ℤ →+* HalfLaurent :=
  Polynomial.eval₂RingHom C (T 1 - T (-1))

/-- This is not evaluation in the invariant subring of s↦s⁻¹. -/
theorem conwayEmbedding_injective : Function.Injective conwayEmbedding := by
  sorry

def squareSubstitution : HalfLaurent →+* HalfLaurent :=
  eval₂ C (isUnit_T (R := ℤ) 2).unit

/-- Balanced half-determinant for arbitrary matrix size, including odd rank.
Its comparison with an oriented link requires a realized Seifert form. -/
def halfDeterminant {n : ℕ} (V : Matrix (Fin n) (Fin n) ℤ) : HalfLaurent :=
  ((T (-1) : HalfLaurent) • V.map (C : ℤ →+* HalfLaurent) -
    (T 1 : HalfLaurent) • V.transpose.map (C : ℤ →+* HalfLaurent)).det

/-- Exact odd-rank phase and half-shift for the native floor-size formula. -/
theorem native_alexander_all_ranks {n : ℕ}
    (V : Matrix (Fin n) (Fin n) ℤ) :
    halfDeterminant V = (-1)^n * T (-((n % 2 : ℕ) : ℤ)) *
      squareSubstitution (TauCeti.KnotTheory.alexander V) := by
  sorry

theorem native_alexander_comparison {g : ℕ}
    (V : Matrix (Fin (2*g)) (Fin (2*g)) ℤ) :
    halfDeterminant V = squareSubstitution (TauCeti.KnotTheory.alexander V) := by
  simpa using native_alexander_all_ranks V

theorem halfDeterminant_enlarge {n : ℕ} (V : Matrix (Fin n) (Fin n) ℤ)
    (v : Fin n → ℤ) :
    halfDeterminant (TauCeti.KnotTheory.enlargeColumnFin V v) = halfDeterminant V ∧
    halfDeterminant (TauCeti.KnotTheory.enlargeRowFin V v) = halfDeterminant V := by
  sorry

def positiveHopfMatrix : Matrix (Fin 1) (Fin 1) ℤ := !![-1]

theorem hopf_halfDeterminant :
    halfDeterminant positiveHopfMatrix = conwayEmbedding Polynomial.X := by
  simp [halfDeterminant, positiveHopfMatrix, conwayEmbedding]
  ring

def trefoilConway : Polynomial ℤ := 1 + Polynomial.X ^ 2

def figureEightConway : Polynomial ℤ := 1 - Polynomial.X ^ 2

theorem trefoil_embedding :
    conwayEmbedding trefoilConway = T 2 - 1 + T (-2) := by
  simp [conwayEmbedding, trefoilConway, sub_sq]
  ring

theorem figureEight_embedding :
    conwayEmbedding figureEightConway = -T 2 + 3 - T (-2) := by
  simp [conwayEmbedding, figureEightConway, sub_sq]
  ring

/-- Source's positive i-substitution has negative Conway skein. -/
def negativeVariable : Polynomial ℤ →+* Polynomial ℤ :=
  Polynomial.eval₂RingHom Polynomial.C (-Polynomial.X)

theorem negativeVariable_X : negativeVariable Polynomial.X = -Polynomial.X := by
  simp [negativeVariable]

theorem negativeVariable_trefoil : negativeVariable trefoilConway = trefoilConway := by
  simp [negativeVariable, trefoilConway]

/-- Native half-Laurent link parity transports across s↦-s. -/
def negativeSUnit : HalfLaurentˣ :=
  ⟨-T 1, -T (-1), by rw [neg_mul_neg, ← T_add]; norm_num,
    by rw [neg_mul_neg, ← T_add]; norm_num⟩

def negativeHalfVariable : HalfLaurent →+* HalfLaurent :=
  eval₂ C negativeSUnit

theorem conway_embedding_negative (p : Polynomial ℤ) :
    negativeHalfVariable (conwayEmbedding p) = conwayEmbedding (negativeVariable p) := by
  have h : negativeHalfVariable.comp conwayEmbedding = conwayEmbedding.comp negativeVariable := by
    ext <;> simp [RingHom.comp_apply, negativeHalfVariable, negativeSUnit,
      conwayEmbedding, negativeVariable]
    ring
  exact DFunLike.congr_fun h p

end TauCetiRoadmap.GeometricTopology.ConwaySkein

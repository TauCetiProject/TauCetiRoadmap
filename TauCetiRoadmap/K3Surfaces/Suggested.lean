import Mathlib.Basic.Complex.Basic
import Mathlib.LinearAlgebra.Matrix.Defs
import Mathlib.LinearAlgebra.Projectivization.Basic

/-!
Illustrative, nonexhaustive finite-coordinate interfaces. The README is definitive.
The form, vectors, complex scalars and projective line are actual native objects.
No geometric K3 carrier is replaced by an arbitrary proposition record here.
-/

namespace TauCetiRoadmap.K3Surfaces

open scoped BigOperators

def complexPair {n : ℕ} (B : Matrix (Fin n) (Fin n) ℤ)
    (v w : Fin n → ℂ) : ℂ :=
  ∑ i, ∑ j, (B i j : ℂ) * v i * w j

def conjugateCoords {n : ℕ} (v : Fin n → ℂ) : Fin n → ℂ :=
  fun i => star (v i)

def positiveIsotropic {n : ℕ} (B : Matrix (Fin n) (Fin n) ℤ)
    (v : Fin n → ℂ) : Prop :=
  v ≠ 0 ∧ complexPair B v v = 0 ∧
    0 < (complexPair B v (conjugateCoords v)).re

def periodDomain {n : ℕ} (B : Matrix (Fin n) (Fin n) ℤ) :
    Set (Projectivization ℂ (Fin n → ℂ)) :=
  {p | ∃ (v : Fin n → ℂ) (hv : v ≠ 0),
    Projectivization.mk ℂ v hv = p ∧ positiveIsotropic B v}

def integralHyperplane {n : ℕ} (B : Matrix (Fin n) (Fin n) ℤ)
    (a : Fin n → ℤ) : Set (Projectivization ℂ (Fin n → ℂ)) :=
  {p | ∃ (v : Fin n → ℂ) (hv : v ≠ 0),
    Projectivization.mk ℂ v hv = p ∧
      complexPair B (fun i => (a i : ℂ)) v = 0}

theorem complexPair_smul_left {n : ℕ} (B : Matrix (Fin n) (Fin n) ℤ)
    (c : ℂ) (v w : Fin n → ℂ) :
    complexPair B (c • v) w = c * complexPair B v w := by
  sorry

theorem complexPair_conjugate_scale {n : ℕ}
    (B : Matrix (Fin n) (Fin n) ℤ) (c : ℂ) (v : Fin n → ℂ) :
    complexPair B (c • v) (conjugateCoords (c • v)) =
      (c * star c) * complexPair B v (conjugateCoords v) := by
  sorry

theorem positiveIsotropic_scale {n : ℕ} (B : Matrix (Fin n) (Fin n) ℤ)
    (c : ℂ) (hc : c ≠ 0) (v : Fin n → ℂ) :
    positiveIsotropic B (c • v) ↔ positiveIsotropic B v := by
  sorry

theorem periodDomain_zero_rank (B : Matrix (Fin 0) (Fin 0) ℤ) :
    periodDomain B = ∅ := by
  sorry

abbrev CoverCoords (R : Type*) :=
  (Fin 2 → R) × (Fin 2 → R) × (Fin 2 → R) × (Fin 8 → R) × (Fin 8 → R)

abbrev NumericalCoords (R : Type*) := (Fin 2 → R) × (Fin 8 → R)

abbrev AntiCoords (R : Type*) := (Fin 2 → R) × (Fin 2 → R) × (Fin 8 → R)

def coverInvolution {R : Type*} [CommRing R] (v : CoverCoords R) : CoverCoords R :=
  (-v.1, v.2.2.1, v.2.1, v.2.2.2.2, v.2.2.2.1)

def invariantEmbedding {R : Type*} [CommRing R]
    (v : NumericalCoords R) : CoverCoords R :=
  (0, v.1, v.1, v.2, v.2)

def antiEmbedding {R : Type*} [CommRing R]
    (v : AntiCoords R) : CoverCoords R :=
  (v.1, v.2.1, -v.2.1, v.2.2, -v.2.2)

def hyperbolicPair {R : Type*} [CommRing R] (v w : Fin 2 → R) : R :=
  v 0 * w 1 + v 1 * w 0

def eightPair {R : Type*} [CommRing R]
    (B : Matrix (Fin 8) (Fin 8) R) (v w : Fin 8 → R) : R :=
  ∑ i, ∑ j, B i j * v i * w j

def coverPair {R : Type*} [CommRing R]
    (B : Matrix (Fin 8) (Fin 8) R) (v w : CoverCoords R) : R :=
  hyperbolicPair v.1 w.1 + hyperbolicPair v.2.1 w.2.1 +
    hyperbolicPair v.2.2.1 w.2.2.1 +
    eightPair B v.2.2.2.1 w.2.2.2.1 + eightPair B v.2.2.2.2 w.2.2.2.2

theorem coverInvolution_involutive {R : Type*} [CommRing R] :
    Function.Involutive (@coverInvolution R _) := by
  sorry

theorem invariantEmbedding_fixed {R : Type*} [CommRing R]
    (v : NumericalCoords R) :
    coverInvolution (invariantEmbedding v) = invariantEmbedding v := by
  sorry

theorem antiEmbedding_negated {R : Type*} [CommRing R]
    (v : AntiCoords R) :
    coverInvolution (antiEmbedding v) = -antiEmbedding v := by
  sorry

theorem coverPair_involution {R : Type*} [CommRing R]
    (B : Matrix (Fin 8) (Fin 8) R) (v w : CoverCoords R) :
    coverPair B (coverInvolution v) (coverInvolution w) = coverPair B v w := by
  sorry

theorem invariant_pair_twice {R : Type*} [CommRing R]
    (B : Matrix (Fin 8) (Fin 8) R) (v w : NumericalCoords R) :
    coverPair B (invariantEmbedding v) (invariantEmbedding w) =
      2 * (hyperbolicPair v.1 w.1 + eightPair B v.2 w.2) := by
  sorry

theorem anti_pair {R : Type*} [CommRing R]
    (B : Matrix (Fin 8) (Fin 8) R) (v w : AntiCoords R) :
    coverPair B (antiEmbedding v) (antiEmbedding w) =
      hyperbolicPair v.1 w.1 +
        2 * (hyperbolicPair v.2.1 w.2.1 + eightPair B v.2.2 w.2.2) := by
  sorry

end TauCetiRoadmap.K3Surfaces

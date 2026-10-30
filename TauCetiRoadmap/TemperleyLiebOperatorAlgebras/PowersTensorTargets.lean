import TauCeti.Algebra.TemperleyLieb.MarkovTrace
import Mathlib.Analysis.Complex.Order
import Mathlib.LinearAlgebra.Matrix.PosDef
import Mathlib.LinearAlgebra.Matrix.Rank
import Mathlib.LinearAlgebra.Matrix.Notation

/-!
# Positive spin matrices and Powers-state trace: target signatures

**This file is not the roadmap and is not exhaustive.** The README is definitive.
These suggested finite-matrix interfaces use the existing native spin representation.
The infinite product, trace-GNS subspace and normal-comparison targets are also required
there. The admitted theorems do not assert that those constructions are implemented.

Parameterize by `r>0`, so the README's `t=r^2` and the native quantum parameter is `-r`.
The basis is false=0, true=1, and a configuration on two sites reads the first site at 0.
-/

noncomputable section

namespace TauCetiRoadmap.TemperleyLiebOperatorAlgebras.PowersTensor

open scoped ComplexOrder
open TauCeti

def loop (r : ℝ) : ℝ := r + r⁻¹

def negativeRoot (r : ℝ) (hr : 0 < r) : ℂˣ :=
  Units.mk0 (-(r : ℂ)) (by simp [ne_of_gt hr])

theorem loop_eq_native (r : ℝ) (hr : 0 < r) :
    (loop r : ℂ) = -((negativeRoot r hr : ℂ) + ((negativeRoot r hr)⁻¹ : ℂˣ)) := by
  simp [loop, negativeRoot, add_comm]

def spinModel (n : ℕ) (r : ℝ) (hr : 0 < r) :
    TemperleyLieb ℂ (loop r : ℂ) n →ₐ[ℂ]
      Matrix (Fin n → Bool) (Fin n → Bool) ℂ :=
  TemperleyLieb.spinRep (negativeRoot r hr) (loop_eq_native r hr)

def normalizedGenerator (n : ℕ) (r : ℝ) (hr : 0 < r) (i : Fin (n - 1)) :
    Matrix (Fin n → Bool) (Fin n → Bool) ℂ :=
  (loop r : ℂ)⁻¹ • spinModel n r hr (TemperleyLieb.e (loop r : ℂ) i)

def densityWeight (r : ℝ) (b : Bool) : ℂ :=
  (((if b then r ^ 2 else 1) / (1 + r ^ 2) : ℝ) : ℂ)

def density (n : ℕ) (r : ℝ) : Matrix (Fin n → Bool) (Fin n → Bool) ℂ :=
  Matrix.diagonal fun s ↦ ∏ j, densityWeight r (s j)

def productState (n : ℕ) (r : ℝ) (X : Matrix (Fin n → Bool) (Fin n → Bool) ℂ) : ℂ :=
  Matrix.trace (density n r * X)

def pairVector (r : ℝ) (s : Fin 2 → Bool) : ℂ :=
  if s 0 = false ∧ s 1 = true then 1
  else if s 0 = true ∧ s 1 = false then (r : ℂ) else 0

/-- This finite entry formula prototypes V2's second/last-site slice. -/
def lastWeightedSlice (r : ℝ) (X : Matrix (Fin 2 → Bool) (Fin 2 → Bool) ℂ) :
    Matrix Bool Bool ℂ :=
  fun a b ↦ ∑ c : Bool, densityWeight r c * X ![a, c] ![b, c]

/-- The first-site slice has a different scalarity formula. -/
def firstWeightedSlice (r : ℝ) (X : Matrix (Fin 2 → Bool) (Fin 2 → Bool) ℂ) :
    Matrix Bool Bool ℂ :=
  fun a b ↦ ∑ c : Bool, densityWeight r c * X ![c, a] ![c, b]

theorem parameter_dictionary (r : ℝ) (hr : 0 < r) :
    2 ≤ loop r ∧ (loop r)⁻¹ ^ 2 = r ^ 2 / (1 + r ^ 2) ^ 2 := by
  sorry

theorem local_projection_rank_one (r : ℝ) (hr : 0 < r) :
    normalizedGenerator 2 r hr 0 = (1 + (r : ℂ) ^ 2)⁻¹ •
      Matrix.vecMulVec (pairVector r) (fun s ↦ star (pairVector r s)) := by
  sorry

theorem projection_laws (n : ℕ) (r : ℝ) (hr : 0 < r) (i : Fin (n - 1)) :
    (normalizedGenerator n r hr i).IsHermitian ∧
      IsIdempotentElem (normalizedGenerator n r hr i) := by
  sorry

theorem adjacent_projection_law (n : ℕ) (r : ℝ) (hr : 0 < r)
    (i j : Fin (n - 1)) (hij : i.val + 1 = j.val ∨ j.val + 1 = i.val) :
    normalizedGenerator n r hr i * normalizedGenerator n r hr j *
      normalizedGenerator n r hr i =
        ((loop r : ℂ)⁻¹ ^ 2) • normalizedGenerator n r hr i := by
  sorry

theorem last_slice_projection (r : ℝ) (hr : 0 < r) :
    lastWeightedSlice r (normalizedGenerator 2 r hr 0) =
      ((loop r : ℂ)⁻¹ ^ 2) • (1 : Matrix Bool Bool ℂ) := by
  sorry

theorem first_slice_projection (r : ℝ) (hr : 0 < r) :
    firstWeightedSlice r (normalizedGenerator 2 r hr 0) =
      ((1 + (r : ℂ) ^ 2) ^ 2)⁻¹ •
        Matrix.diagonal (fun b : Bool ↦ if b then 1 else (r : ℂ) ^ 4) := by
  sorry

theorem productState_positive (n : ℕ) (r : ℝ) (hr : 0 < r)
    (X : Matrix (Fin n → Bool) (Fin n → Bool) ℂ) :
    0 ≤ productState n r (X.conjTranspose * X) := by
  sorry

theorem productState_faithful (n : ℕ) (r : ℝ) (hr : 0 < r)
    (X : Matrix (Fin n → Bool) (Fin n → Bool) ℂ) :
    productState n r (X.conjTranspose * X) = 0 ↔ X = 0 := by
  sorry

theorem density_commutes (n : ℕ) (r : ℝ) (hr : 0 < r)
    (x : TemperleyLieb ℂ (loop r : ℂ) n) :
    Commute (density n r) (spinModel n r hr x) := by
  sorry

theorem native_trace_product_state (n : ℕ) (r : ℝ) (hr : 0 < r)
    (x : TemperleyLieb ℂ (loop r : ℂ) n) :
    TemperleyLieb.markovTrace (negativeRoot r hr) (loop_eq_native r hr) x =
      (loop r : ℂ) ^ n * productState n r (spinModel n r hr x) := by
  sorry

end TauCetiRoadmap.TemperleyLiebOperatorAlgebras.PowersTensor

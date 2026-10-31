import TauCeti.Algebra.TemperleyLieb.MarkovTrace
import TauCeti.LinearAlgebra.CliffordAlgebra.Dimension
import Mathlib.LinearAlgebra.QuadraticForm.Basic
import Mathlib.Analysis.SpecialFunctions.Sqrt
import Mathlib.Basic.Complex.Basic

/-!
# The sqrt(2) Jones quotient and positive even Clifford model: suggested targets

**This file is not the roadmap and is not exhaustive.** The README is definitive.
The scalar coefficient below uses the actual native Clifford basis. Its equality to
SpinGeometry G1.3's scalar trace and its analytic-adjoint compatibility are roadmap
requirements, not assumed native star instances. No `Star` instance is installed here.
The quotient and positive finite-matrix comparisons are also required in the README.
-/

noncomputable section

namespace TauCetiRoadmap.TemperleyLiebOperatorAlgebras.CliffordJones

open TauCeti

local instance : Invertible (2 : ℂ) := invertibleOfNonzero (by norm_num)

/-- The complex bilinear sum of squares, not a Hermitian norm square. -/
def form (m : ℕ) : QuadraticForm ℂ (Fin m → ℂ) :=
  QuadraticMap.weightedSumSquares ℂ (fun _ : Fin m ↦ (1 : ℂ))

abbrev Cl (m : ℕ) := CliffordAlgebra (form m)

abbrev EvenCl (m : ℕ) := CliffordAlgebra.even (form m)

def majorana (m : ℕ) (j : Fin m) : Cl m :=
  CliffordAlgebra.ι (form m) (Pi.single j 1)

def leftSite (m : ℕ) (j : Fin (m - 1)) : Fin m := ⟨j.val, by omega⟩

def rightSite (m : ℕ) (j : Fin (m - 1)) : Fin m := ⟨j.val + 1, by omega⟩

def pairProduct (m : ℕ) (j : Fin (m - 1)) : Cl m :=
  majorana m (leftSite m j) * majorana m (rightSite m j)

def projection (m : ℕ) (j : Fin (m - 1)) : Cl m :=
  (2 : ℂ)⁻¹ • (1 + Complex.I • pairProduct m j)

def generator (m : ℕ) (j : Fin (m - 1)) : Cl m :=
  (Real.sqrt 2 : ℂ) • projection m j

theorem projection_mem_even (m : ℕ) (j : Fin (m - 1)) :
    projection m j ∈ CliffordAlgebra.even (form m) := by
  sorry

def evenProjection (m : ℕ) (j : Fin (m - 1)) : EvenCl m :=
  ⟨projection m j, projection_mem_even m j⟩

def evenGenerator (m : ℕ) (j : Fin (m - 1)) : EvenCl m :=
  (Real.sqrt 2 : ℂ) • evenProjection m j

theorem generator_square (m : ℕ) (j : Fin (m - 1)) :
    evenGenerator m j * evenGenerator m j =
      (Real.sqrt 2 : ℂ) • evenGenerator m j := by
  sorry

theorem generator_adjacent (m : ℕ) (i j : Fin (m - 1))
    (h : i.val + 1 = j.val ∨ j.val + 1 = i.val) :
    evenGenerator m i * evenGenerator m j * evenGenerator m i = evenGenerator m i := by
  sorry

theorem generator_distant (m : ℕ) (i j : Fin (m - 1))
    (h : i.val + 2 ≤ j.val ∨ j.val + 2 ≤ i.val) :
    evenGenerator m i * evenGenerator m j = evenGenerator m j * evenGenerator m i := by
  sorry

/-- The map is built from the existing TL universal property. -/
def model (m : ℕ) : TemperleyLieb ℂ (Real.sqrt 2 : ℂ) m →ₐ[ℂ] EvenCl m :=
  TemperleyLieb.lift (evenGenerator m) (generator_square m)
    (fun {_ _} h ↦ generator_adjacent m _ _ h)
    (fun {_ _} h ↦ generator_distant m _ _ h)

def scalarTrace (m : ℕ) (a : Cl m) : ℂ :=
  (CliffordAlgebra.basis (form m) (Pi.basisFun ℂ (Fin m))).repr a ∅

theorem model_surjective (m : ℕ) : Function.Surjective (model m) := by
  sorry

theorem projection_trace (m : ℕ) (j : Fin (m - 1)) :
    scalarTrace m (projection m j) = (2 : ℂ)⁻¹ := by
  sorry

/-- Append a zero coordinate, preserving the sum of squares. -/
def coordinateVector (m : ℕ) : (Fin m → ℂ) →ₗ[ℂ] (Fin (m + 1) → ℂ) where
  toFun v := Fin.snoc v 0
  map_add' v w := by
    ext i
    refine Fin.lastCases ?_ (fun j ↦ ?_) i <;> simp
  map_smul' a v := by
    ext i
    refine Fin.lastCases ?_ (fun j ↦ ?_) i <;> simp

theorem coordinateVector_isometry (m : ℕ) (v : Fin m → ℂ) :
    form (m + 1) (coordinateVector m v) = form m v := by
  sorry

def coordinateInclusion (m : ℕ) : Cl m →ₐ[ℂ] Cl (m + 1) :=
  CliffordAlgebra.map
    { toLinearMap := coordinateVector m
      map_app' := coordinateVector_isometry m }

theorem trace_inclusion (m : ℕ) (a : Cl m) :
    scalarTrace (m + 1) (coordinateInclusion m a) = scalarTrace m a := by
  sorry

theorem trace_markov (m : ℕ) (hm : 0 < m) (a : EvenCl m) :
    scalarTrace (m + 1)
      (coordinateInclusion m a * projection (m + 1) ⟨m - 1, by omega⟩) =
        (2 : ℂ)⁻¹ * scalarTrace m a := by
  sorry

theorem native_trace (m : ℕ) (q : ℂˣ)
    (hq : (Real.sqrt 2 : ℂ) = -((q : ℂ) + ((q⁻¹ : ℂˣ) : ℂ)))
    (a : TemperleyLieb ℂ (Real.sqrt 2 : ℂ) m) :
    TemperleyLieb.markovTrace q hq a =
      (Real.sqrt 2 : ℂ) ^ m * scalarTrace m (model m a) := by
  sorry

theorem kernel_trace_radical (m : ℕ) (q : ℂˣ)
    (hq : (Real.sqrt 2 : ℂ) = -((q : ℂ) + ((q⁻¹ : ℂˣ) : ℂ)))
    (a : TemperleyLieb ℂ (Real.sqrt 2 : ℂ) m) :
    model m a = 0 ↔ ∀ b, TemperleyLieb.markovTrace q hq (a * b) = 0 := by
  sorry

/-- The root convention is u=(1+i)/sqrt(2), t=i. -/
def braidGenerator (m : ℕ) (j : Fin (m - 1)) : Cl m :=
  (((1 + Complex.I) / (Real.sqrt 2 : ℂ)) : ℂ) •
    ((1 + Complex.I) • projection m j - 1)

theorem braid_phase (m : ℕ) (j : Fin (m - 1)) :
    braidGenerator m j = -((Real.sqrt 2 : ℂ)⁻¹ • (1 + pairProduct m j)) ∧
      braidGenerator m j ^ 2 = pairProduct m j ∧
      braidGenerator m j ^ 4 = -1 ∧ braidGenerator m j ^ 8 = 1 := by
  sorry

end TauCetiRoadmap.TemperleyLiebOperatorAlgebras.CliffordJones

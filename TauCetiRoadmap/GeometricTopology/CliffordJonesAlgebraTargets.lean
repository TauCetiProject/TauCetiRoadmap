import Mathlib
import TauCeti.Algebra.TemperleyLieb.MarkovTrace
import TauCeti.LinearAlgebra.CliffordAlgebra.Dimension

/-!
# Finite Clifford and scalar Jones specializations: suggested targets

**This file is not the roadmap and is not exhaustive.** The README is definitive.
The algebraic trace and Temperley-Lieb comparisons use the actual native Clifford basis
and universal properties. Analytic adjoints, C*-algebra realizations and positive quotients
are downstream applications. Mathlib's algebraic Clifford conjugation is not the analytic
adjoint; the finite trace statements below use only multiplication and the ordered basis.
-/

noncomputable section

namespace TauCetiRoadmap.GeometricTopology.CliffordJones

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

/-- Increasing ordered products are compared with the native transported basis. -/
def orderedMonomial (m : ℕ) (S : Finset (Fin m)) : Cl m :=
  ((S.sort (· ≤ ·)).map (majorana m)).prod

/-- This is specific to the standard orthogonal sum-of-squares form.
The general transported Clifford basis is not definitionally a product basis. -/
theorem orderedMonomial_eq_basis (m : ℕ) (S : Finset (Fin m)) :
    orderedMonomial m S =
      CliffordAlgebra.basis (form m) (Pi.basisFun ℂ (Fin m)) S := by
  sorry

/-- The exact algebraic Gram matrix; no analytic adjoint or positivity is used. -/
theorem scalarTrace_orderedMonomial_mul (m : ℕ) (S T : Finset (Fin m)) :
    scalarTrace m (orderedMonomial m S * orderedMonomial m T) =
      if S = T then (-1 : ℂ) ^ (S.card * (S.card - 1) / 2) else 0 := by
  sorry

/-- The even subalgebra has no coefficient on an odd ordered monomial. -/
theorem even_odd_coefficient_eq_zero (m : ℕ) (x : EvenCl m)
    (S : Finset (Fin m)) (hS : Odd S.card) :
    (CliffordAlgebra.basis (form m) (Pi.basisFun ℂ (Fin m))).repr (x : Cl m) S = 0 := by
  sorry

def scalarTraceLinear (m : ℕ) : Cl m →ₗ[ℂ] ℂ :=
  (CliffordAlgebra.basis (form m) (Pi.basisFun ℂ (Fin m))).coord ∅

@[simp] theorem scalarTraceLinear_apply (m : ℕ) (a : Cl m) :
    scalarTraceLinear m a = scalarTrace m a := rfl

def evenScalarTraceLinear (m : ℕ) : EvenCl m →ₗ[ℂ] ℂ :=
  (scalarTraceLinear m).comp (CliffordAlgebra.even (form m)).val.toLinearMap

def evenTracePairing (m : ℕ) : LinearMap.BilinForm ℂ (EvenCl m) :=
  (LinearMap.mul ℂ (EvenCl m)).compr₂ (evenScalarTraceLinear m)

@[simp] theorem evenTracePairing_apply (m : ℕ) (x y : EvenCl m) :
    evenTracePairing m x y = scalarTrace m ((x * y : EvenCl m) : Cl m) := rfl

theorem scalarTrace_one (m : ℕ) : scalarTrace m (1 : Cl m) = 1 := by
  let b := CliffordAlgebra.basis (form m) (Pi.basisFun ℂ (Fin m))
  have h : (1 : Cl m) = b ∅ := by
    have h0 : orderedMonomial m ∅ = b ∅ := orderedMonomial_eq_basis m ∅
    simpa only [orderedMonomial, Finset.sort_empty, List.map_nil, List.prod_nil] using h0
  change b.repr (1 : Cl m) ∅ = 1
  calc
    b.repr (1 : Cl m) ∅ = b.repr (b ∅) ∅ := congrArg (fun x : Cl m ↦ b.repr x ∅) h
    _ = 1 := by rw [Module.Basis.repr_self, Finsupp.single_eq_same]

theorem scalarTrace_mul_comm (m : ℕ) (x y : Cl m) :
    scalarTrace m (x * y) = scalarTrace m (y * x) := by
  sorry

/-- Nondegeneracy of s(xy), including m=0, follows from the even-monomial Gram matrix. -/
theorem evenTracePairing_nondegenerate (m : ℕ) :
    (evenTracePairing m).Nondegenerate := by
  sorry

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
  constructor
  · intro ha b
    rw [native_trace m q hq, map_mul, ha]
    simp [scalarTrace]
  · intro h
    apply (evenTracePairing_nondegenerate m).1 (model m a)
    intro z
    obtain ⟨b, rfl⟩ := model_surjective m z
    rw [evenTracePairing_apply]
    have ht := h b
    rw [native_trace m q hq, map_mul] at ht
    have hsqrt : (Real.sqrt 2 : ℂ) ≠ 0 := by
      exact_mod_cast (ne_of_gt (Real.sqrt_pos.2 (by norm_num : (0 : ℝ) < 2)))
    exact (mul_eq_zero.mp ht).resolve_left (pow_ne_zero m hsqrt)

/-- The root convention is u=(1+i)/sqrt(2), t=i. -/
def braidGenerator (m : ℕ) (j : Fin (m - 1)) : Cl m :=
  (((1 + Complex.I) / (Real.sqrt 2 : ℂ)) : ℂ) •
    ((1 + Complex.I) • projection m j - 1)

theorem braid_phase (m : ℕ) (j : Fin (m - 1)) :
    braidGenerator m j = -((Real.sqrt 2 : ℂ)⁻¹ • (1 + pairProduct m j)) ∧
      braidGenerator m j ^ 2 = pairProduct m j ∧
      braidGenerator m j ^ 4 = -1 ∧ braidGenerator m j ^ 8 = 1 := by
  sorry

/-- The full finite algebraic headline, with the existing canonical model as witness. -/
theorem exists_evenCliffordModel (m : ℕ) (q : ℂˣ)
    (hq : (Real.sqrt 2 : ℂ) = -((q : ℂ) + ((q⁻¹ : ℂˣ) : ℂ))) :
    ∃ F : TemperleyLieb ℂ (Real.sqrt 2 : ℂ) m →ₐ[ℂ] EvenCl m,
      (∀ j : Fin (m - 1),
        (F (TemperleyLieb.e (Real.sqrt 2 : ℂ) j) : Cl m) =
          (Real.sqrt 2 : ℂ) • projection m j) ∧
      Function.Surjective F ∧
      (∀ x, TemperleyLieb.markovTrace q hq x =
        (Real.sqrt 2 : ℂ) ^ m * scalarTrace m (F x)) ∧
      (∀ x, F x = 0 ↔ ∀ y, TemperleyLieb.markovTrace q hq (x * y) = 0) := by
  refine ⟨model m, ?_, model_surjective m, native_trace m q hq, kernel_trace_radical m q hq⟩
  intro j
  rw [model, TemperleyLieb.lift_e]
  rfl

/-- The delta-one scalar character is constructed by the native TL lift. -/
def deltaOneScalar (m : ℕ) : TemperleyLieb ℂ (1 : ℂ) m →ₐ[ℂ] ℂ :=
  TemperleyLieb.lift (fun _ : Fin (m - 1) ↦ (1 : ℂ))
    (by intro i; simp) (by intros i j h; simp) (by intros i j h; simp)

@[simp] theorem deltaOneScalar_e (m : ℕ) (j : Fin (m - 1)) :
    deltaOneScalar m (TemperleyLieb.e (1 : ℂ) j) = 1 := by
  exact TemperleyLieb.lift_e _ _ _ _ j

/-- At delta one the native unnormalized trace is already normalized. -/
theorem deltaOne_native_trace (m : ℕ) (q : ℂˣ)
    (hq : (1 : ℂ) = -((q : ℂ) + ((q⁻¹ : ℂˣ) : ℂ)))
    (a : TemperleyLieb ℂ (1 : ℂ) m) :
    TemperleyLieb.markovTrace q hq a = deltaOneScalar m a := by
  sorry

/-- Native Jones cube-root conventions use delta minus one and the character e_i↦-1. -/
def deltaMinusOneScalar (m : ℕ) : TemperleyLieb ℂ (-1 : ℂ) m →ₐ[ℂ] ℂ :=
  TemperleyLieb.lift (fun _ : Fin (m - 1) ↦ (-1 : ℂ))
    (by intro i; simp) (by intros i j h; simp) (by intros i j h; simp)

@[simp] theorem deltaMinusOneScalar_e (m : ℕ) (j : Fin (m - 1)) :
    deltaMinusOneScalar m (TemperleyLieb.e (-1 : ℂ) j) = -1 := by
  exact TemperleyLieb.lift_e _ _ _ _ j

/-- Dividing by delta^m is multiplication by (-1)^m in this specialization. -/
theorem deltaMinusOne_native_normalized_trace (m : ℕ) (q : ℂˣ)
    (hq : (-1 : ℂ) = -((q : ℂ) + ((q⁻¹ : ℂˣ) : ℂ)))
    (a : TemperleyLieb ℂ (-1 : ℂ) m) :
    (-1 : ℂ) ^ m * TemperleyLieb.markovTrace q hq a = deltaMinusOneScalar m a := by
  sorry

end TauCetiRoadmap.GeometricTopology.CliffordJones

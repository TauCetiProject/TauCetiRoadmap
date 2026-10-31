import Mathlib.Analysis.InnerProductSpace.Trace
import Mathlib.Analysis.InnerProductSpace.Adjoint
import Mathlib.Analysis.InnerProductSpace.Calculus

/-!
This file contains suggested target signatures to help implementors of the corresponding
application. The mathematical specification remains definitive; these signatures are aids,
not an exhaustive checklist.

The operator below lives in native continuous complex-linear endomorphisms. Its derivative
is real-linear, since rankOne is conjugate-linear in its second argument. No matrix carrier,
Clifford-to-two-form comparison, or bundle realization is introduced here.
-/

noncomputable section

namespace TauCetiRoadmap.SeibergWittenTheory

open scoped ComplexConjugate

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℂ E]
  [FiniteDimensional ℂ E]

local instance : CompleteSpace E := FiniteDimensional.complete ℂ E

/-- Trace-free rank-one spinor endomorphism in complex rank two. -/
def quadraticEnd (ψ : E) : E →L[ℂ] E :=
  InnerProductSpace.rankOne ℂ ψ ψ -
    ((‖ψ‖ : ℂ) ^ 2 / 2) • ContinuousLinearMap.id ℂ E

omit [FiniteDimensional ℂ E] in
theorem quadraticEnd_zero : quadraticEnd (0 : E) = 0 := by
  simp [quadraticEnd]

/-- The rank-two hypothesis enters trace cancellation, not the definition. -/
theorem trace_quadraticEnd (h₂ : Module.finrank ℂ E = 2) (ψ : E) :
    (quadraticEnd ψ).trace ℂ E = 0 := by
  change LinearMap.trace ℂ E
    ((InnerProductSpace.rankOne ℂ ψ ψ).toLinearMap -
      ((‖ψ‖ : ℂ) ^ 2 / 2) • LinearMap.id) = 0
  rw [map_sub, map_smul, InnerProductSpace.trace_rankOne,
    LinearMap.trace_id, h₂, inner_self_eq_norm_sq_to_K]
  simp only [Nat.cast_ofNat, smul_eq_mul]
  change (‖ψ‖ : ℂ) ^ 2 - ((‖ψ‖ : ℂ) ^ 2 / 2) * 2 = 0
  ring

theorem adjoint_quadraticEnd (ψ : E) :
    (quadraticEnd ψ).adjoint = quadraticEnd ψ := by
  simp [quadraticEnd, map_sub, map_smulₛₗ,
    ContinuousLinearMap.adjoint_id, map_ofNat]

omit [FiniteDimensional ℂ E] in
theorem quadraticEnd_apply_self (ψ : E) :
    quadraticEnd ψ ψ = ((‖ψ‖ : ℂ) ^ 2 / 2) • ψ := by
  simp only [quadraticEnd, sub_apply,
    InnerProductSpace.rankOne_apply, smul_apply,
    ContinuousLinearMap.id_apply, inner_self_eq_norm_sq_to_K]
  rw [← sub_smul]
  congr 1
  change (‖ψ‖ : ℂ) ^ 2 - (‖ψ‖ : ℂ) ^ 2 / 2 = (‖ψ‖ : ℂ) ^ 2 / 2
  ring

omit [FiniteDimensional ℂ E] in
theorem quadraticEnd_phase (ψ : E) (u : ℂ) (hu : ‖u‖ = 1) :
    quadraticEnd (u • ψ) = quadraticEnd ψ := by
  have hunit : conj u * u = 1 := by
    simpa [hu] using Complex.conj_mul' u
  have h : InnerProductSpace.rankOne ℂ (u • ψ) (u • ψ) =
      InnerProductSpace.rankOne ℂ ψ ψ := by
    ext v
    simp only [InnerProductSpace.rankOne_apply, inner_smul_left, smul_smul]
    change ((conj u * inner ℂ ψ v) * u) • ψ = (inner ℂ ψ v) • ψ
    have hc : (conj u * inner ℂ ψ v) * u = inner ℂ ψ v := by
      calc
        _ = (conj u * u) * inner ℂ ψ v := by ring
        _ = inner ℂ ψ v := by rw [hunit, one_mul]
    rw [hc]
  simp only [quadraticEnd, h, norm_smul, hu, one_mul]

/-- The real Fréchet derivative, with its actual endomorphism-valued formula. -/
theorem exists_real_derivative_quadraticEnd (ψ : E) :
    ∃ L : E →L[ℝ] (E →L[ℂ] E),
      HasFDerivAt (quadraticEnd : E → (E →L[ℂ] E)) L ψ ∧
      ∀ φ : E, L φ = InnerProductSpace.rankOne ℂ φ ψ +
        InnerProductSpace.rankOne ℂ ψ φ -
        (Complex.re (inner ℂ ψ φ) : ℂ) • ContinuousLinearMap.id ℂ E := by
  sorry

#check @quadraticEnd
#check @quadraticEnd_zero
#check @trace_quadraticEnd
#check @adjoint_quadraticEnd
#check @quadraticEnd_apply_self
#check @quadraticEnd_phase
#check @exists_real_derivative_quadraticEnd
#check InnerProductSpace.rankOne
#check InnerProductSpace.trace_rankOne
#check ContinuousLinearMap.adjoint
#check InnerProductSpace.adjoint_rankOne
#check LinearMap.trace

#print axioms quadraticEnd
#print axioms quadraticEnd_zero
#print axioms trace_quadraticEnd
#print axioms adjoint_quadraticEnd
#print axioms quadraticEnd_apply_self
#print axioms quadraticEnd_phase
#print axioms exists_real_derivative_quadraticEnd

end TauCetiRoadmap.SeibergWittenTheory

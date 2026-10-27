/-
Copyright (c) 2026 Kim Morrison. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib.LinearAlgebra.Complex.FiniteDimensional
import Mathlib.LinearAlgebra.TensorProduct.Basic

/-!
**This file is not the roadmap and is not exhaustive.**
These are suggested forms. The README is the definitive specification.
-/

noncomputable section
open scoped TensorProduct

namespace LocalVariationalFieldTheory

variable {V : Type*} [AddCommGroup V] [Module ℂ V]
    [StarAddMonoid V] [StarModule ℂ V]

/-- The canonical complexification map of the native fixed real subspace is an equivalence. -/
theorem realField_descent :
    ∃ e : (ℂ ⊗[ℝ] selfAdjoint V) ≃ₗ[ℂ] V,
      ∀ (z : ℂ) (v : selfAdjoint V), e (z ⊗ₜ[ℝ] v) = z • (v : V) := by
  sorry

/-- Conjugation-fixed real fields have the original complex dimension. -/
theorem realField_finrank [FiniteDimensional ℂ V] :
    Module.finrank ℝ (selfAdjoint V) = Module.finrank ℂ V := by
  sorry

end LocalVariationalFieldTheory

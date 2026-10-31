/-
Copyright (c) 2026 Kim Morrison. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import TauCeti.LinearAlgebra.CliffordAlgebra.Vectors
import TauCeti.LinearAlgebra.CliffordAlgebra.RealForm.Basic
import Mathlib.LinearAlgebra.Matrix.Notation

/-!
**This file is not the roadmap and is not exhaustive.** The README is the
specification. These signatures pin L0.Bogoliubov's native range/filtration
criteria and the real-plane counterexample to unrestricted automorphism
recovery. They consume the implemented Clifford injection and word filtration;
they do not construct another Clifford algebra. The admitted statements are
future theorem targets, not completed proofs of the full group comparison.
-/

noncomputable section

namespace SpinRepresentations.Bogoliubov

variable {K V : Type*} [Field K] [Invertible (2 : K)]
  [AddCommGroup V] [Module K V] [FiniteDimensional K V]

/-- Unique recovery on the native vector submodule, including degenerate forms. -/
theorem generator_range_iff (Q : QuadraticForm K V)
    (phi : CliffordAlgebra Q ≃ₐ[K] CliffordAlgebra Q) :
    Submodule.map phi.toLinearMap (LinearMap.range (CliffordAlgebra.ι Q)) =
        LinearMap.range (CliffordAlgebra.ι Q) ↔
      ∃! f : Q.IsometryEquiv Q, CliffordAlgebra.equivOfIsometry f = phi := by
  sorry

/-- The first WORD-filtration step, including scalars, suffices for recovery.
Preserving only the parity grading is a different condition. -/
theorem first_word_piece_iff (Q : QuadraticForm K V)
    (phi : CliffordAlgebra Q ≃ₐ[K] CliffordAlgebra Q) :
    Submodule.map phi.toLinearMap (CliffordAlgebra.filtration Q 1) =
        CliffordAlgebra.filtration Q 1 ↔
      Submodule.map phi.toLinearMap (LinearMap.range (CliffordAlgebra.ι Q)) =
        LinearMap.range (CliffordAlgebra.ι Q) := by
  sorry

abbrev planeForm : QuadraticForm ℝ (Fin 2 → ℝ) :=
  TauCeti.realCliffordForm 2 0

/-- This elementary model precedes the real periodicity classification. -/
theorem positive_plane_model :
    ∃ e : CliffordAlgebra planeForm ≃ₐ[ℝ] Matrix (Fin 2) (Fin 2) ℝ,
      ∀ v, e (CliffordAlgebra.ι planeForm v) = !![v 0, v 1; v 1, -v 0] := by
  sorry

def Z : Matrix (Fin 2) (Fin 2) ℝ := !![1, 0; 0, -1]
def X : Matrix (Fin 2) (Fin 2) ℝ := !![0, 1; 1, 0]
def D : Matrix (Fin 2) (Fin 2) ℝ := !![2, 0; 0, 1]
def Dinv : Matrix (Fin 2) (Fin 2) ℝ := !![1 / 2, 0; 0, 1]

/-- Conjugation by D is an algebra automorphism, but takes X outside the generator plane. -/
theorem matrix_counterexample :
    D * Dinv = 1 ∧ Dinv * D = 1 ∧
    D * Z * Dinv = Z ∧
    D * X * Dinv = !![0, 2; 1 / 2, 0] ∧
    D * X * Dinv ∉ Submodule.span ℝ ({Z, X} : Set (Matrix (Fin 2) (Fin 2) ℝ)) := by
  sorry

end SpinRepresentations.Bogoliubov

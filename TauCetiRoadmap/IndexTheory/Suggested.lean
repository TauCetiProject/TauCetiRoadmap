import Mathlib.Analysis.Normed.Operator.Fredholm.Open
import TauCeti.Analysis.Fredholm.Adjoint
import Mathlib.Topology.Path
import Mathlib.Analysis.InnerProductSpace.Adjoint
import Mathlib.Analysis.Normed.Operator.Compact.Basic

/-!
These are representative suggested interfaces, not an exhaustive checklist.
The README is the definitive specification. Existing native Fredholm/index
objects are consumed directly. Symbol K-groups and geometric index maps are
specified there against their named supplier carriers, rather than represented
by empty proposition fields before those carriers are available.
-/

open TopologicalSpace
open scoped InnerProduct

namespace IndexTheorySuggested

variable {E F : Type*} [NormedAddCommGroup E] [InnerProductSpace ℂ E]
  [CompleteSpace E] [NormedAddCommGroup F] [InnerProductSpace ℂ F] [CompleteSpace F]

/-- The native Fredholm locus carries its inherited operator-norm topology. -/
abbrev FredholmLocus (E F : Type*) [NormedAddCommGroup E] [NormedSpace ℂ E]
    [NormedAddCommGroup F] [NormedSpace ℂ F] :=
  {T : E →L[ℂ] F // T.IsFredholm}

/-- Rectangular compact parametrix data keeps each corner's identity. -/
structure CompactParametrix (T : E →L[ℂ] F) where
  inverse : F →L[ℂ] E
  left_error : IsCompactOperator (inverse.comp T - ContinuousLinearMap.id ℂ E)
  right_error : IsCompactOperator (T.comp inverse - ContinuousLinearMap.id ℂ F)

/-- A first-order graph/adjoint pair against specified Sobolev-to-L² embeddings.
In I4.4 the domains are the shared H¹ carriers, with dense smooth sections;
the equality is an actual formal-adjoint identity, not an unspecified condition. -/
structure OpOnePair
    (E₁ F₁ : Type*) [NormedAddCommGroup E₁] [NormedSpace ℂ E₁]
    [NormedAddCommGroup F₁] [NormedSpace ℂ F₁]
    (jE : E₁ →L[ℂ] E) (jF : F₁ →L[ℂ] F) where
  toMap : E₁ →L[ℂ] F
  formalAdjoint : F₁ →L[ℂ] E
  adjoint_identity : ∀ u v, inner ℂ (toMap u) (jF v) =
    inner ℂ (jE u) (formalAdjoint v)

/-- Solvability is orthogonality to the adjoint kernel, for every Fredholm map. -/
theorem range_iff_adjointKernel_compatibility (T : E →L[ℂ] F) (hT : T.IsFredholm)
    (y : F) :
    y ∈ LinearMap.range (T : E →ₗ[ℂ] F) ↔
      ∀ z ∈ LinearMap.ker (T† : F →ₗ[ℂ] E), inner ℂ z y = 0 := by
  have hClosed := T.isClosed_range_adjoint_of_isClosed_range hT.isClosed_range
  have hRange : LinearMap.range (T : E →ₗ[ℂ] F) =
      (LinearMap.ker (T† : F →ₗ[ℂ] E))ᗮ := by
    simpa using T.adjoint.range_adjoint_eq_orthogonal_ker_of_isClosed_range hClosed
  rw [hRange, Submodule.mem_orthogonal]

/-- The obstruction dimension is the cokernel dimension, with no index-zero restriction. -/
theorem adjointKernel_finrank_eq_coker (T : E →L[ℂ] F) (hT : T.IsFredholm) :
    Module.finrank ℂ (LinearMap.ker (T† : F →ₗ[ℂ] E)) =
      Module.finrank ℂ (F ⧸ LinearMap.range (T : E →ₗ[ℂ] F)) := by
  exact (T.cokerEquivKerAdjoint hT.isClosed_range).toLinearEquiv.finrank_eq.symm

/-- At index zero the obstruction dimension equals the original kernel dimension. -/
theorem adjointKernel_finrank_eq_kernel_of_index_zero (T : E →L[ℂ] F)
    (hT : T.IsFredholm) (hIndex : (T : E →ₗ[ℂ] F).index = 0) :
    Module.finrank ℂ (LinearMap.ker (T† : F →ₗ[ℂ] E)) =
      Module.finrank ℂ (LinearMap.ker (T : E →ₗ[ℂ] F)) := by
  have hDim := adjointKernel_finrank_eq_coker T hT
  have hFormula := ContinuousLinearMap.index_eq_finrank_sub T
  rw [ContinuousLinearMap.index_def, hIndex, ← hDim] at hFormula
  omega

/-- Equality of the two defect dimensions characterizes index zero. -/
theorem adjointKernel_finrank_eq_kernel_iff_index_zero (T : E →L[ℂ] F)
    (hT : T.IsFredholm) :
    Module.finrank ℂ (LinearMap.ker (T† : F →ₗ[ℂ] E)) =
      Module.finrank ℂ (LinearMap.ker (T : E →ₗ[ℂ] F)) ↔
        (T : E →ₗ[ℂ] F).index = 0 := by
  have hDim := adjointKernel_finrank_eq_coker T hT
  have hFormula := ContinuousLinearMap.index_eq_finrank_sub T
  rw [ContinuousLinearMap.index_def, ← hDim] at hFormula
  omega

omit [CompleteSpace E] [CompleteSpace F] in
/-- I1.3's minimality statement for a finite family of compatibility functionals. -/
theorem compatibility_count_minimal (T : E →L[ℂ] F)
    {n : ℕ} (φ : Fin n → F →ₗ[ℂ] ℂ)
    (hφ : ∀ y, y ∈ LinearMap.range (T : E →ₗ[ℂ] F) ↔ ∀ i, φ i y = 0) :
    Module.finrank ℂ (F ⧸ LinearMap.range (T : E →ₗ[ℂ] F)) ≤ n := by
  let L : F →ₗ[ℂ] (Fin n → ℂ) := LinearMap.pi φ
  have hKer : L.ker = LinearMap.range (T : E →ₗ[ℂ] F) := by
    ext y
    simpa [L, LinearMap.mem_ker, funext_iff] using (hφ y).symm
  calc
    Module.finrank ℂ (F ⧸ LinearMap.range (T : E →ₗ[ℂ] F)) =
        Module.finrank ℂ (F ⧸ L.ker) := by rw [hKer]
    _ = Module.finrank ℂ L.range := L.quotKerEquivRange.finrank_eq
    _ ≤ Module.finrank ℂ (Fin n → ℂ) := Submodule.finrank_le _
    _ = n := by simp

/-- This consumer comparison uses OperatorKTheory K4 and its rectangular corners. -/
theorem isFredholm_iff_compactParametrix (T : E →L[ℂ] F) :
    T.IsFredholm ↔ Nonempty (CompactParametrix T) := by
  sorry

/-- I1.6 proves the converse to native local constancy on every complex Hilbert pair. -/
theorem normPath_iff_index_eq (S T : FredholmLocus E F) :
    Nonempty (Path S T) ↔
      (S.val : E →ₗ[ℂ] F).index = (T.val : E →ₗ[ℂ] F).index := by
  sorry

end IndexTheorySuggested

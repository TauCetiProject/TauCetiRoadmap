/-
Copyright (c) 2026 Kim Morrison. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib.Analysis.InnerProductSpace.l2Space

/-!
**This file is not the roadmap and is not exhaustive.**
These are suggested forms. The README is the definitive specification.
-/

noncomputable section

namespace BanachSpaceTheory

variable {𝕜 H K ι κ : Type*} [RCLike 𝕜]
    [NormedAddCommGroup H] [InnerProductSpace 𝕜 H] [CompleteSpace H]
    [NormedAddCommGroup K] [InnerProductSpace 𝕜 K] [CompleteSpace K]

/-- Any two complete orthonormal bases of the same space have equivalent index types. -/
theorem hilbertBasis_indexEquiv
    (b : HilbertBasis ι 𝕜 H) (c : HilbertBasis κ 𝕜 H) : Nonempty (ι ≃ κ) := by
  sorry

/-- Equal Hilbert-basis cardinality classifies complete spaces over the same scalar field. -/
theorem hilbertBasis_unitary_iff
    (b : HilbertBasis ι 𝕜 H) (c : HilbertBasis κ 𝕜 K) :
    Nonempty (H ≃ₗᵢ[𝕜] K) ↔ Nonempty (ι ≃ κ) := by
  sorry

/-- The equivalence can realize any prescribed correspondence of Hilbert bases. -/
theorem hilbertBasis_unitary_map
    (b : HilbertBasis ι 𝕜 H) (c : HilbertBasis κ 𝕜 K) (e : ι ≃ κ) :
    ∃ U : H ≃ₗᵢ[𝕜] K, ∀ i, U (b i) = c (e i) := by
  sorry

end BanachSpaceTheory

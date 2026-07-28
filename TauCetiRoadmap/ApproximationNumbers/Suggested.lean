import Mathlib

/-!
# Approximation numbers and Hilbert-space singular values: suggested signatures

This file is not the roadmap and is not exhaustive.  The definitive
specification is `README.md`.  These declarations illustrate concrete Lean
shapes for the central milestones and prevent the roadmap from hiding an
unstated object behind prose.

The final implementation may adjust names to match Mathlib or Tau Ceti review.
In particular, active Mathlib PR #32126 must be reconciled before a competing
public definition is introduced.
-/

namespace TauCetiRoadmap.ApproximationNumbers

open Module (finrank)
open scoped InnerProductSpace
open Filter Topology

universe u v w x y

/-! ## Part A -- approximation numbers on normed spaces -/

section ApproximationNumbers

variable {𝕜 : Type u} [NontriviallyNormedField 𝕜]
variable {E : Type v} [SeminormedAddCommGroup E] [NormedSpace 𝕜 E]
variable {F : Type w} [SeminormedAddCommGroup F] [NormedSpace 𝕜 F]
variable {G : Type x} [SeminormedAddCommGroup G] [NormedSpace 𝕜 G]
variable {H : Type y} [SeminormedAddCommGroup H] [NormedSpace 𝕜 H]

/-- Zero-based approximation number: the operator-norm distance to maps of rank
at most `n`.  The intended public declaration extends
`ContinuousLinearMap`. -/
noncomputable def approximationNumber (T : E →L[𝕜] F) (n : ℕ) : ℝ :=
  ⨅ R : {R : E →L[𝕜] F // R.rank ≤ (n : Cardinal)}, ‖T - R.1‖

/-- A1 -- exposed defining infimum. -/
theorem approximationNumber_eq_iInf (T : E →L[𝕜] F) (n : ℕ) :
    approximationNumber T n =
      ⨅ R : {R : E →L[𝕜] F // R.rank ≤ (n : Cardinal)}, ‖T - R.1‖ :=
  rfl

/-- A1 -- every admissible approximation gives an upper bound. -/
theorem approximationNumber_le_norm_sub
    (T : E →L[𝕜] F) {R : E →L[𝕜] F} {n : ℕ}
    (hR : R.rank ≤ (n : Cardinal)) :
    approximationNumber T n ≤ ‖T - R‖ := by
  sorry

/-- A1 -- intrinsic lower-bound characterization. -/
theorem le_approximationNumber_iff
    (T : E →L[𝕜] F) {n : ℕ} {c : ℝ} :
    c ≤ approximationNumber T n ↔
      ∀ R : E →L[𝕜] F, R.rank ≤ (n : Cardinal) → c ≤ ‖T - R‖ := by
  sorry

/-- A1 -- the zeroth approximation number is the operator norm. -/
@[simp]
theorem approximationNumber_index_zero (T : E →L[𝕜] F) :
    approximationNumber T 0 = ‖T‖ := by
  sorry

/-- A1 -- approximation numbers decrease as more rank is allowed. -/
theorem approximationNumber_antitone (T : E →L[𝕜] F) :
    Antitone (approximationNumber T) := by
  sorry

/-- A1 -- approximation numbers are nonnegative. -/
theorem approximationNumber_nonneg (T : E →L[𝕜] F) (n : ℕ) :
    0 ≤ approximationNumber T n := by
  sorry

/-- A1 -- near-minimizers exist for every positive error tolerance. -/
theorem exists_rank_le_norm_sub_lt_approximationNumber_add
    (T : E →L[𝕜] F) (n : ℕ) {ε : ℝ} (hε : 0 < ε) :
    ∃ R : E →L[𝕜] F,
      R.rank ≤ (n : Cardinal) ∧
        ‖T - R‖ < approximationNumber T n + ε := by
  sorry

/-- A2 -- exact zero-based additive inequality. -/
theorem approximationNumber_add_le
    (S T : E →L[𝕜] F) (m n : ℕ) :
    approximationNumber (S + T) (m + n) ≤
      approximationNumber S m + approximationNumber T n := by
  sorry

/-- A2 -- perturbation by an arbitrary bounded map. -/
theorem approximationNumber_add_le_add_norm
    (S T : E →L[𝕜] F) (n : ℕ) :
    approximationNumber (S + T) n ≤ approximationNumber S n + ‖T‖ := by
  sorry

/-- A2 -- each approximation number is `1`-Lipschitz in operator norm. -/
theorem dist_approximationNumber_le
    (S T : E →L[𝕜] F) (n : ℕ) :
    dist (approximationNumber S n) (approximationNumber T n) ≤ ‖S - T‖ := by
  sorry

/-- A3 -- right ideal inequality. -/
theorem approximationNumber_comp_le_mul_norm
    (T : E →L[𝕜] F) (R : G →L[𝕜] E) (n : ℕ) :
    approximationNumber (T ∘L R) n ≤ approximationNumber T n * ‖R‖ := by
  sorry

/-- A3 -- left ideal inequality. -/
theorem approximationNumber_comp_le_norm_mul
    (L : F →L[𝕜] G) (T : E →L[𝕜] F) (n : ℕ) :
    approximationNumber (L ∘L T) n ≤ ‖L‖ * approximationNumber T n := by
  sorry

/-- A3 -- two-sided ideal inequality. -/
theorem approximationNumber_comp_comp_le
    (L : F →L[𝕜] G) (T : E →L[𝕜] F) (R : H →L[𝕜] E)
    (n : ℕ) :
    approximationNumber (L ∘L T ∘L R) n ≤
      ‖L‖ * approximationNumber T n * ‖R‖ := by
  sorry

/-- A3 -- absolute homogeneity. -/
@[simp]
theorem approximationNumber_smul
    (c : 𝕜) (T : E →L[𝕜] F) (n : ℕ) :
    approximationNumber (c • T) n = ‖c‖ * approximationNumber T n := by
  sorry

/-- A4 -- a map of rank at most `n` has vanishing `n`th approximation number. -/
theorem approximationNumber_eq_zero_of_rank_le
    (T : E →L[𝕜] F) {n : ℕ} (hT : T.rank ≤ (n : Cardinal)) :
    approximationNumber T n = 0 := by
  sorry

/-- A4 -- decay to zero is exactly norm approximability by finite-rank maps. -/
theorem tendsto_approximationNumber_zero_iff_exists_finiteRank_approximation
    (T : E →L[𝕜] F) :
    Tendsto (approximationNumber T) atTop (𝓝 0) ↔
      ∃ R : ℕ → E →L[𝕜] F,
        (∀ n, (R n).rank < Cardinal.aleph0) ∧ Tendsto R atTop (𝓝 T) := by
  sorry

end ApproximationNumbers

section Compactness

variable {𝕜 : Type u} [NontriviallyNormedField 𝕜]
variable {E : Type v} [NormedAddCommGroup E] [NormedSpace 𝕜 E]
variable {F : Type w} [NormedAddCommGroup F] [NormedSpace 𝕜 F]
  [CompleteSpace F]

/-- A4 -- norm-approximability by finite-rank maps implies compactness. -/
theorem isCompactOperator_of_tendsto_approximationNumber_zero
    (T : E →L[𝕜] F)
    (hT : Tendsto (approximationNumber T) atTop (𝓝 0)) :
    IsCompactOperator T := by
  sorry

end Compactness

/-! ## Part B -- Hilbert-space singular-value theory -/

section Adjoint

variable {𝕜 : Type u} [RCLike 𝕜]
variable {E : Type v} [NormedAddCommGroup E] [InnerProductSpace 𝕜 E]
  [CompleteSpace E]
variable {F : Type w} [NormedAddCommGroup F] [InnerProductSpace 𝕜 F]
  [CompleteSpace F]

/-- B1 -- approximation numbers are invariant under adjoint. -/
@[simp]
theorem approximationNumber_adjoint (T : E →L[𝕜] F) (n : ℕ) :
    approximationNumber T.adjoint n = approximationNumber T n := by
  sorry

/-- A4, Hilbert-space converse -- compact Hilbert-space operators are
approximable by finite-rank maps. -/
theorem tendsto_approximationNumber_zero_of_isCompactOperator
    (T : E →L[𝕜] F) (hT : IsCompactOperator T) :
    Tendsto (approximationNumber T) atTop (𝓝 0) := by
  sorry

end Adjoint

section ComplexModulus

variable {E : Type v} [NormedAddCommGroup E] [InnerProductSpace ℂ E]
  [CompleteSpace E]
variable {F : Type w} [NormedAddCommGroup F] [InnerProductSpace ℂ F]
  [CompleteSpace F]

/-- B2 -- rectangular modulus `|T| = (T⋆T)^(1/2)` on the source. -/
noncomputable def modulus (T : E →L[ℂ] F) : E →L[ℂ] E :=
  CFC.sqrt (T.adjoint ∘L T)

/-- B2 -- the modulus is nonnegative. -/
theorem modulus_nonneg (T : E →L[ℂ] F) : 0 ≤ modulus T := by
  sorry

/-- B2 -- the modulus squares to the Gram operator. -/
theorem modulus_mul_self (T : E →L[ℂ] F) :
    modulus T * modulus T = T.adjoint ∘L T := by
  sorry

/-- B2 -- pointwise norm identity. -/
@[simp]
theorem norm_modulus_apply (T : E →L[ℂ] F) (x : E) :
    ‖modulus T x‖ = ‖T x‖ := by
  sorry

/-- B2 -- equality of operator norms. -/
@[simp]
theorem norm_modulus (T : E →L[ℂ] F) :
    ‖modulus T‖ = ‖T‖ := by
  sorry

end ComplexModulus

section FiniteDimensional

variable {𝕜 : Type u} [RCLike 𝕜]
variable {E : Type v} [NormedAddCommGroup E] [InnerProductSpace 𝕜 E]
  [FiniteDimensional 𝕜 E]
variable {F : Type w} [NormedAddCommGroup F] [InnerProductSpace 𝕜 F]
  [FiniteDimensional 𝕜 F]

/-- B3 -- finite-dimensional Eckart--Young, zero-based and rectangular. -/
theorem approximationNumber_eq_singularValues
    (T : E →L[𝕜] F) (n : ℕ) :
    approximationNumber T n = T.singularValues n := by
  sorry

/-- The operator norm remaining after discarding a finite-dimensional source
subspace. -/
noncomputable def orthogonalTailNorm
    (T : E →L[𝕜] F) (V : Submodule 𝕜 E) : ℝ :=
  ‖T ∘L Vᗮ.starProjection‖

/-- B4 -- exact finite-dimensional min--max in orthogonal-tail form. -/
theorem approximationNumber_eq_iInf_orthogonalTailNorm
    (T : E →L[𝕜] F) (n : ℕ) :
    approximationNumber T n =
      ⨅ V : {V : Submodule 𝕜 E // finrank 𝕜 V ≤ n},
        orthogonalTailNorm T V.1 := by
  sorry

end FiniteDimensional

section InfiniteDimensionalLowerBound

variable {𝕜 : Type u} [RCLike 𝕜]
variable {E : Type v} [NormedAddCommGroup E] [InnerProductSpace 𝕜 E]
variable {F : Type w} [NormedAddCommGroup F] [InnerProductSpace 𝕜 F]

/-- B5 -- an `(n+1)`-dimensional lower-modulus test forces a lower bound on the
`n`th approximation number. -/
theorem le_approximationNumber_of_lt_rank
    (T : E →L[𝕜] F) (n : ℕ) (V : Submodule 𝕜 E) {c : ℝ}
    (hVrank : (n : Cardinal) < Module.rank 𝕜 V)
    (hV : ∀ x : V, c * ‖(x : E)‖ ≤ ‖T (x : E)‖) :
    c ≤ approximationNumber T n := by
  sorry

/-- B5 -- finite-dimensional unit-vector form. -/
theorem le_approximationNumber_of_finrank_lt
    (T : E →L[𝕜] F) (n : ℕ) (V : Submodule 𝕜 E)
    [FiniteDimensional 𝕜 V] {c : ℝ}
    (hVdim : n < finrank 𝕜 V)
    (hV : ∀ x : V, ‖(x : E)‖ = 1 → c ≤ ‖T (x : E)‖) :
    c ≤ approximationNumber T n := by
  sorry

end InfiniteDimensionalLowerBound

end TauCetiRoadmap.ApproximationNumbers

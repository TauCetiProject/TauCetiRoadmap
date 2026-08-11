/-
Copyright (c) 2026 Kitware, Inc. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib
import TauCetiRoadmap.OperatorTheory.PolarDecomposition.Suggested

/-!
# Matrix spectra, concentration, and the toolkit of spectral statistics: target signatures

**`README.md` is the definitive and exhaustive roadmap specification.** This file gives
suggested Lean forms for selected labeled obligations. The roadmap is complete when the
obligations in `README.md` are complete. `sorry` records target signatures in this human-owned
roadmap library.

-/

namespace TauCetiRoadmap.MatrixSpectralStatistics

open MeasureTheory InnerProductSpace
open scoped ENNReal Matrix ComplexOrder

/-! ## Part A -- rank factorization and positive-semidefinite Gram factorization -/

section RankFactorization

variable {𝕜 : Type*} [Field 𝕜] {m n : Type*} [Fintype n]

/-- Roadmap: MSS-A03.

Rank at most `r` is equivalent to factorization through `Fin r`. -/
theorem rank_le_iff_exists_eq_mul (M : Matrix m n 𝕜) (r : ℕ) :
    M.rank ≤ r ↔ ∃ (L : Matrix m (Fin r) 𝕜) (R : Matrix (Fin r) n 𝕜), M = L * R := sorry

/-- Roadmap: MSS-A07.

A square matrix is positive semidefinite of rank at most `d` exactly when it is the Gram
matrix of `n` points in `d` dimensions. -/
theorem posSemidef_and_rank_le_iff_exists_conjTranspose_mul_self
    {𝕜 : Type*} [RCLike 𝕜]
    {n d : ℕ} (B : Matrix (Fin n) (Fin n) 𝕜) :
    (B.PosSemidef ∧ B.rank ≤ d) ↔ ∃ A : Matrix (Fin d) (Fin n) 𝕜, B = Aᴴ * A := sorry

/-- Roadmap: MSS-A08.

Two factorizations through the exact rank differ by an invertible change of basis of the
intermediate space. -/
theorem exists_units_eq_mul_of_rank_factorization {r : ℕ} (M : Matrix m n 𝕜)
    (hr : M.rank = r) {L L' : Matrix m (Fin r) 𝕜} {R R' : Matrix (Fin r) n 𝕜}
    (h : M = L * R) (h' : M = L' * R') :
    ∃ g : (Matrix (Fin r) (Fin r) 𝕜)ˣ,
      L' = L * (g : Matrix (Fin r) (Fin r) 𝕜) ∧
        R' = ((g⁻¹ : (Matrix (Fin r) (Fin r) 𝕜)ˣ) : Matrix (Fin r) (Fin r) 𝕜) * R := sorry

end RankFactorization

section GramUniqueness

variable {𝕜 : Type*} [RCLike 𝕜]

/-- Roadmap: MSS-A09.

Two Gram factors of the same size differ by a left unitary. -/
theorem exists_unitary_mul_of_conjTranspose_mul_self_eq {n d : ℕ}
    {A A' : Matrix (Fin d) (Fin n) 𝕜} (h : Aᴴ * A = A'ᴴ * A') :
    ∃ U ∈ Matrix.unitaryGroup (Fin d) 𝕜, A' = U * A := sorry

end GramUniqueness

/-! ## Part B -- matrix spectra and spectral measurability -/

section MatrixSpectra

variable {n : ℕ} {Ω : Type*} [MeasurableSpace Ω]

/-- Roadmap: MSS-B01.

Matrices carry the entrywise product measurable structure. -/
instance instMeasurableSpaceMatrix {m n α : Type*} [MeasurableSpace α] :
    MeasurableSpace (Matrix m n α) :=
  inferInstanceAs (MeasurableSpace (m → n → α))

/-- Roadmap: MSS-B02.

For countable indices and a second-countable Borel entry space, the entrywise matrix
measurable structure is Borel. -/
instance instBorelSpaceMatrix {m n α : Type*} [Countable m] [Countable n]
    [TopologicalSpace α] [MeasurableSpace α] [SecondCountableTopology α] [BorelSpace α] :
    BorelSpace (Matrix m n α) :=
  inferInstanceAs (BorelSpace (m → n → α))

variable {𝕜 : Type*} [RCLike 𝕜]

/-- Roadmap: MSS-B03.

An entrywise `ε` bound on an `n × n` matrix gives the Euclidean operator bound `n ε`. -/
theorem norm_toEuclideanLin_le_of_entry_le {A : Matrix (Fin n) (Fin n) 𝕜}
    {ε : ℝ} (hentry : ∀ i j, ‖A i j‖ ≤ ε) (x : EuclideanSpace 𝕜 (Fin n)) :
    ‖Matrix.toEuclideanLin A x‖ ≤ (n : ℝ) * ε * ‖x‖ := sorry

/-- Roadmap: MSS-B04.

Entrywise closeness of Hermitian matrices gives the corresponding sorted-eigenvalue perturbation bound. -/
theorem abs_eigenvalues₀_sub_le_of_entry_le {A Ahat : Matrix (Fin n) (Fin n) 𝕜}
    (hA : A.IsHermitian) (hAhat : Ahat.IsHermitian)
    {ε : ℝ} (hentry : ∀ i j, ‖Ahat i j - A i j‖ ≤ ε) (k : Fin (Fintype.card (Fin n))) :
    |hAhat.eigenvalues₀ k - hA.eigenvalues₀ k| ≤ (n : ℝ) * ε := sorry

/-- Roadmap: MSS-B09.

A fixed continuous real spectral function depends continuously on a finite Hermitian matrix. -/
theorem continuous_cfc_on_hermitian (h : ℝ → ℝ) (hh : Continuous h) :
    Continuous fun A : {A : Matrix (Fin n) (Fin n) 𝕜 // A.IsHermitian} => cfc h A.1 := sorry

/-- Roadmap: MSS-B10.

A fixed continuous real spectral function of a measurable Hermitian random matrix is measurable. -/
theorem measurable_cfc_of_hermitian (h : ℝ → ℝ) (hh : Continuous h)
    {Bm : Ω → Matrix (Fin n) (Fin n) 𝕜} (hBmeas : Measurable Bm)
    (hherm : ∀ ω, (Bm ω).IsHermitian) :
    Measurable fun ω => cfc h (Bm ω) := sorry

/-- Roadmap: MSS-B11.

The fixed-threshold spectral projector onto the Hermitian eigenspaces with eigenvalue in `[c, ∞)`. -/
noncomputable def spectralProjectionIci (c : ℝ) (A : Matrix (Fin n) (Fin n) 𝕜)
    (hA : A.IsHermitian) : Matrix (Fin n) (Fin n) 𝕜 := by
  sorry

/-- Roadmap: MSS-B12.

The fixed-threshold spectral projector is Borel measurable in the Hermitian matrix. -/
theorem measurable_spectralProjectionIci (c : ℝ) :
    Measurable fun A : {A : Matrix (Fin n) (Fin n) 𝕜 // A.IsHermitian} =>
      spectralProjectionIci c A.1 A.2 := sorry

/-- Roadmap: MSS-B13.

A fixed-threshold spectral projector of a measurable Hermitian random matrix is measurable. -/
theorem measurable_spectralProjectionIci_of_hermitian (c : ℝ)
    {Bm : Ω → Matrix (Fin n) (Fin n) 𝕜} (hBmeas : Measurable Bm)
    (hherm : ∀ ω, (Bm ω).IsHermitian) :
    Measurable fun ω => spectralProjectionIci c (Bm ω) (hherm ω) := sorry

end MatrixSpectra

/-! ## Part C -- sample moments and matrix concentration

Chebyshev plus a union bound over `n²` entries, converted to a spectral bound
by Part B.  The elementary route is dimension-suboptimal by design: matrix
Bernstein would give `log n` in place of `n`, at the cost of Laplace-transform
machinery Mathlib does not have. -/

section Concentration

variable {n : ℕ} {Ω : Type*} [MeasurableSpace Ω]

/-- Roadmap: MSS-C15.

The uncentered empirical second-moment matrix `M̂ₖₗ = r⁻¹ ∑ᵢ Vᵢₖ Vᵢₗ`. -/
noncomputable def sampleSecondMoment {r d : ℕ}
    (V : Fin r → Ω → EuclideanSpace ℝ (Fin d)) (ω : Ω) : Matrix (Fin d) (Fin d) ℝ :=
  fun k l => (r : ℝ)⁻¹ * ∑ i, V i ω k * V i ω l

omit [MeasurableSpace Ω] in
/-- Roadmap: MSS-C16.

The empirical second-moment matrix is Hermitian. -/
theorem isHermitian_sampleSecondMoment {r d : ℕ}
    (V : Fin r → Ω → EuclideanSpace ℝ (Fin d)) (ω : Ω) :
    (sampleSecondMoment V ω).IsHermitian := by
  sorry

/-- Roadmap: MSS-C20.

Entrywise second-moment control gives simultaneous high-probability control of every sorted eigenvalue. -/
theorem measure_forall_abs_eigenvalues₀_sub_le_ge
    (P : Measure Ω) [IsProbabilityMeasure P]
    (Shat : Ω → Matrix (Fin n) (Fin n) ℝ) (A : Matrix (Fin n) (Fin n) ℝ)
    (hSherm : ∀ ω, (Shat ω).IsHermitian) (hAherm : A.IsHermitian)
    (hmeas : ∀ k l, Measurable fun ω => Shat ω k l)
    (hint : ∀ k l, Integrable (fun ω => (Shat ω k l - A k l) ^ 2) P)
    {v η : ℝ} (hη : 0 < η) (hmoment : ∀ k l, ∫ ω, (Shat ω k l - A k l) ^ 2 ∂P ≤ v) :
    P {ω | ∀ k, |(hSherm ω).eigenvalues₀ k - hAherm.eigenvalues₀ k|
        ≤ (n : ℝ) * η} ≥ 1 - ENNReal.ofReal ((n : ℝ) ^ 2 * v / η ^ 2) := sorry

/-- Roadmap: MSS-C06.

The arithmetic mean of a finite family, with the empty mean determined by total inversion. -/
noncomputable def finiteMean (𝕜 : Type*) [RCLike 𝕜] {E : Type*} [NormedAddCommGroup E]
    [InnerProductSpace 𝕜 E] {n : ℕ} (z : Fin n → E) : E :=
  ((n : 𝕜)⁻¹) • ∑ i, z i

/-- Roadmap: MSS-C09.

The unnormalized centered scatter operator `∑ᵢ (zᵢ-z̄) ⊗ (zᵢ-z̄)`. -/
noncomputable def centeredScatter (𝕜 : Type*) [RCLike 𝕜] {E : Type*} [NormedAddCommGroup E]
    [InnerProductSpace 𝕜 E] {n : ℕ} (z : Fin n → E) : E →L[𝕜] E :=
  ∑ i, rankOne 𝕜 (z i - finiteMean 𝕜 z) (z i - finiteMean 𝕜 z)

/-- Roadmap: MSS-C10.

Appending one point updates centered scatter by the exact rank-one correction. -/
theorem centeredScatter_append (𝕜 : Type*) [RCLike 𝕜] {E : Type*} [NormedAddCommGroup E]
    [InnerProductSpace 𝕜 E] {n : ℕ} (z : Fin n → E) (y : E) :
    centeredScatter 𝕜 (Fin.snoc z y) = centeredScatter 𝕜 z +
      ((n : 𝕜) / ((n : 𝕜) + 1)) •
        rankOne 𝕜 (y - finiteMean 𝕜 z) (y - finiteMean 𝕜 z) := sorry

/-- Roadmap: MSS-C22.

Entrywise second-moment control gives the corresponding high-probability Euclidean operator bound. -/
theorem measure_forall_norm_toEuclideanLin_sub_le_ge
    (P : Measure Ω) [IsProbabilityMeasure P]
    (Shat : Ω → Matrix (Fin n) (Fin n) ℝ) (A : Matrix (Fin n) (Fin n) ℝ)
    (hmeas : ∀ k l, Measurable fun ω => Shat ω k l)
    (hint : ∀ k l, Integrable (fun ω => (Shat ω k l - A k l) ^ 2) P)
    {v η : ℝ} (hη : 0 < η) (hmoment : ∀ k l, ∫ ω, (Shat ω k l - A k l) ^ 2 ∂P ≤ v) :
    P {ω | ∀ x : EuclideanSpace ℝ (Fin n),
        ‖Matrix.toEuclideanLin (Shat ω - A) x‖ ≤ (n : ℝ) * η * ‖x‖}
      ≥ 1 - ENNReal.ofReal ((n : ℝ) ^ 2 * v / η ^ 2) := sorry

end Concentration

end TauCetiRoadmap.MatrixSpectralStatistics

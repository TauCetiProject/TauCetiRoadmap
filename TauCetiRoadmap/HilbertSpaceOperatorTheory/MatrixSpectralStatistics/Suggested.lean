/-
Copyright (c) 2026 Kitware, Inc. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib

/-!
# Matrix spectra and spectral measurability: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a Part nor the roadmap. `sorry` is allowed in this human-owned roadmap
library — these are goals, not proofs.
-/

namespace TauCetiRoadmap.MatrixSpectralStatistics

open MeasureTheory InnerProductSpace
open scoped ENNReal Matrix

/-! ## Part A -- rank factorization and positive-semidefinite Gram factorization -/

section RankFactorization

variable {𝕜 : Type*} [Field 𝕜] {m n : Type*} [Fintype m] [Fintype n] [DecidableEq n]

/-- Rank at most `r` is exactly factorization through `Fin r`. -/
theorem rank_le_iff_exists_eq_mul (M : Matrix m n 𝕜) (r : ℕ) :
    M.rank ≤ r ↔ ∃ (L : Matrix m (Fin r) 𝕜) (R : Matrix (Fin r) n 𝕜), M = L * R := sorry

/-- **The multidimensional-scaling embedding step**, as an iff: a matrix is
positive semidefinite of rank at most `d` exactly when it is the Gram matrix of
`n` points in `d`-dimensional space. -/
theorem posSemidef_and_rank_le_iff_exists_conjTranspose_mul_self
    {𝕜 : Type*} [RCLike 𝕜] [PartialOrder 𝕜] [StarOrderedRing 𝕜]
    {n d : ℕ} (B : Matrix (Fin n) (Fin n) 𝕜) :
    (B.PosSemidef ∧ B.rank ≤ d) ↔ ∃ A : Matrix (Fin d) (Fin n) 𝕜, B = Aᴴ * A := sorry

/-- **Milestone A2, general factors.** At minimal rank the factorization is unique up to
the obvious `GL` action.  Stated as an existence over the group rather than through a
quotient object. `r = M.rank` is load-bearing -- above the rank the extra columns are
unconstrained and the statement is false. -/
theorem exists_units_eq_mul_of_rank_factorization {r : ℕ} (M : Matrix m n 𝕜)
    (hr : M.rank = r) {L L' : Matrix m (Fin r) 𝕜} {R R' : Matrix (Fin r) n 𝕜}
    (h : M = L * R) (h' : M = L' * R') :
    ∃ g : (Matrix (Fin r) (Fin r) 𝕜)ˣ,
      L' = L * (g : Matrix (Fin r) (Fin r) 𝕜) ∧
        R' = ((g⁻¹ : (Matrix (Fin r) (Fin r) 𝕜)ˣ) : Matrix (Fin r) (Fin r) 𝕜) * R := sorry

end RankFactorization

section GramUniqueness

variable {𝕜 : Type*} [RCLike 𝕜]

/-- **Milestone A2, Gram factorization.**  Unique up to a *left unitary*, at a fixed
factor size and with no rank hypothesis -- which is why this is not a corollary of the
rank-factorization statement above.  The group differs (`unitaryGroup`, not the
invertibles) because this one remembers an inner product.

The quantifier side matters: the unitary acts on the `d` side.  In the
multidimensional-scaling consumer that is exactly the rigid-motion indeterminacy of a
recovered configuration; a unitary on the `n` side would be false and would look
plausible. -/
theorem exists_unitary_mul_of_conjTranspose_mul_self_eq {n d : ℕ}
    {A A' : Matrix (Fin d) (Fin n) 𝕜} (h : Aᴴ * A = A'ᴴ * A') :
    ∃ U ∈ Matrix.unitaryGroup (Fin d) 𝕜, A' = U * A := sorry

end GramUniqueness

/-! ## Part C -- matrix spectra and spectral measurability -/

section MatrixSpectra

variable {n : ℕ} {Ω : Type*} [MeasurableSpace Ω]

/-- `Matrix` is a type-level `def`, so the pi `MeasurableSpace` instance does not fire
through it and the entrywise σ-algebra has to be registered; without it the measurability
statement below does not elaborate.

Stated for arbitrary index and entry types. Nothing about the σ-algebra needs finite
indices or real entries — it is the pi instance transported across a type-level `def` — and
a `Matrix (Fin n) (Fin n) ℝ` version would have to be widened before it could go to
Mathlib, which has no `MeasurableSpace` instance for `Matrix` at all. -/
instance instMeasurableSpaceMatrix {m n α : Type*} [MeasurableSpace α] :
    MeasurableSpace (Matrix m n α) :=
  inferInstanceAs (MeasurableSpace (m → n → α))

/-- The Borel companion, whose hypotheses are exactly `Pi.borelSpace`'s applied twice:
countability of each index and second countability of the entry type. Spectral functions of
a matrix are shown measurable entrywise, which needs this rather than the σ-algebra alone. -/
instance instBorelSpaceMatrix {m n α : Type*} [Countable m] [Countable n]
    [TopologicalSpace α] [MeasurableSpace α] [SecondCountableTopology α] [BorelSpace α] :
    BorelSpace (Matrix m n α) :=
  inferInstanceAs (BorelSpace (m → n → α))

/-- Sorted eigenvalues of a Hermitian matrix, the ordering every perturbation
statement below is stated against.

Spec: D1. -/
noncomputable def sortedEigenvalues {A : Matrix (Fin n) (Fin n) ℝ}
    (hA : A.IsHermitian) : Fin n → ℝ :=
  (Matrix.isSymmetric_toEuclideanLin_iff.mpr hA).eigenvalues finrank_euclideanSpace_fin

/-- **Weyl composed with the entrywise bridge**: an entrywise `ε`-perturbation
moves each sorted eigenvalue by at most `n·ε`.  The entrywise-to-operator-norm
comparison is one of the two Mathlib gaps this Part states precisely. -/
theorem abs_sortedEigenvalues_sub_le_of_entry_le {A Ahat : Matrix (Fin n) (Fin n) ℝ}
    (hA : A.IsHermitian) (hAhat : Ahat.IsHermitian)
    {ε : ℝ} (hentry : ∀ i j, |Ahat i j - A i j| ≤ ε) (k : Fin n) :
    |sortedEigenvalues hAhat k - sortedEigenvalues hA k| ≤ (n : ℝ) * ε := sorry

/-- The spectral `h`-transform of a Hermitian matrix.

Spec: D2. -/
noncomputable def specTransform (h : ℝ → ℝ) {A : Matrix (Fin n) (Fin n) ℝ}
    (hA : A.IsHermitian) : Matrix (Fin n) (Fin n) ℝ :=
  let hsym := Matrix.isSymmetric_toEuclideanLin_iff.mpr hA
  Matrix.of fun i j => ∑ k : Fin n, h (sortedEigenvalues hA k)
    * hsym.eigenvectorBasis finrank_euclideanSpace_fin k i
    * hsym.eigenvectorBasis finrank_euclideanSpace_fin k j

/-- **Spectral measurability**: the `h`-transform of a measurable Hermitian
random matrix is measurable — without which no probability statement about a
sample eigenspace is well-posed. -/
theorem measurable_specTransform (h : ℝ → ℝ) (hh : Continuous h)
    {Bm : Ω → Matrix (Fin n) (Fin n) ℝ} (hBmeas : Measurable Bm)
    (hsym : ∀ ω, (Bm ω).IsHermitian) :
    Measurable fun ω => specTransform h (hsym ω) := sorry

/-! ### The `RCLike` norm comparisons (open half of Milestone C1)

No new mathematics: Cauchy--Schwarz and the triangle inequality are field-generic, and the
work is replacing `|·|` and `Real`-specific order lemmas by `‖·‖`.  Two consequences are
decisions rather than bookkeeping -- the entrywise hypothesis becomes a bound on `‖A i j‖`,
so **complex Hermitian matrices are covered by the same statement**, and both constants
survive unchanged. -/

section RCLikeComparisons

variable {𝕜 : Type*} [RCLike 𝕜]

theorem sum_norm_le_sqrt_card_mul_norm {ι : Type*} [Fintype ι]
    (x : EuclideanSpace 𝕜 ι) :
    ∑ i, ‖x i‖ ≤ Real.sqrt (Fintype.card ι) * ‖x‖ := sorry

theorem norm_toEuclideanLin_le_of_entry_le {n : ℕ} {A : Matrix (Fin n) (Fin n) 𝕜}
    {ε : ℝ} (hε : 0 ≤ ε) (hentry : ∀ i j, ‖A i j‖ ≤ ε)
    (x : EuclideanSpace 𝕜 (Fin n)) :
    ‖Matrix.toEuclideanLin A x‖ ≤ (n : ℝ) * ε * ‖x‖ := sorry

end RCLikeComparisons

end MatrixSpectra

end TauCetiRoadmap.MatrixSpectralStatistics

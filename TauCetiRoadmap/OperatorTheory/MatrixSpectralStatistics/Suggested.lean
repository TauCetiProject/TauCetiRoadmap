/-
Copyright (c) 2026 Kitware, Inc. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib
import TauCetiRoadmap.OperatorTheory.PolarDecomposition.Suggested

/-!
# Matrix spectra, concentration, and the toolkit of spectral statistics: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a Part nor the roadmap. `sorry` is allowed in this human-owned roadmap
library — these are goals, not proofs.
-/

namespace TauCetiRoadmap.MatrixSpectralStatistics

open MeasureTheory InnerProductSpace
open scoped ENNReal Matrix ComplexOrder

/-! ## Part A -- rank factorization and positive-semidefinite Gram factorization -/

section RankFactorization

variable {𝕜 : Type*} [Field 𝕜] {m n : Type*} [Fintype n]

/-- Rank at most `r` is exactly factorization through `Fin r`. -/
theorem rank_le_iff_exists_eq_mul (M : Matrix m n 𝕜) (r : ℕ) :
    M.rank ≤ r ↔ ∃ (L : Matrix m (Fin r) 𝕜) (R : Matrix (Fin r) n 𝕜), M = L * R := sorry

/-- **The multidimensional-scaling embedding step**, as an iff: a matrix is
positive semidefinite of rank at most `d` exactly when it is the Gram matrix of
`n` points in `d`-dimensional space. -/
theorem posSemidef_and_rank_le_iff_exists_conjTranspose_mul_self
    {𝕜 : Type*} [RCLike 𝕜]
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

/-! ## Part B -- matrix spectra and spectral measurability -/

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

variable {𝕜 : Type*} [RCLike 𝕜]

/-- **Entrywise → Euclidean operator-norm bound.** If every entry of an `RCLike` square
matrix has norm at most `ε`, its Euclidean action is bounded by `n · ε`. -/
theorem norm_toEuclideanLin_le_of_entry_le {A : Matrix (Fin n) (Fin n) 𝕜}
    {ε : ℝ} (hentry : ∀ i j, ‖A i j‖ ≤ ε) (x : EuclideanSpace 𝕜 (Fin n)) :
    ‖Matrix.toEuclideanLin A x‖ ≤ (n : ℝ) * ε * ‖x‖ := sorry

/-- **Weyl composed with the entrywise bridge** over either real or complex Hermitian
matrices. -/
theorem abs_eigenvalues₀_sub_le_of_entry_le {A Ahat : Matrix (Fin n) (Fin n) 𝕜}
    (hA : A.IsHermitian) (hAhat : Ahat.IsHermitian)
    {ε : ℝ} (hentry : ∀ i j, ‖Ahat i j - A i j‖ ≤ ε) (k : Fin (Fintype.card (Fin n))) :
    |hAhat.eigenvalues₀ k - hA.eigenvalues₀ k| ≤ (n : ℝ) * ε := sorry

/-- For fixed continuous `h`, Mathlib's Hermitian continuous functional calculus depends
continuously on the Hermitian matrix.  This is the canonical deterministic statement; the roadmap uses Mathlib's generic `cfc` as the public construction. -/
theorem continuous_cfc_on_hermitian (h : ℝ → ℝ) (hh : Continuous h) :
    Continuous fun A : {A : Matrix (Fin n) (Fin n) 𝕜 // A.IsHermitian} => cfc h A.1 := sorry

/-- The measurable random-matrix form consumed by probability: a measurable Hermitian
random matrix remains measurable after applying a fixed continuous spectral function. -/
theorem measurable_cfc_of_hermitian (h : ℝ → ℝ) (hh : Continuous h)
    {Bm : Ω → Matrix (Fin n) (Fin n) 𝕜} (hBmeas : Measurable Bm)
    (hherm : ∀ ω, (Bm ω).IsHermitian) :
    Measurable fun ω => cfc h (Bm ω) := sorry

end MatrixSpectra

/-! ## Part C -- sample moments and matrix concentration

Chebyshev plus a union bound over `n²` entries, converted to a spectral bound
by Part B.  The elementary route is dimension-suboptimal by design: matrix
Bernstein would give `log n` in place of `n`, at the cost of Laplace-transform
machinery Mathlib does not have. -/

section Concentration

variable {n : ℕ} {Ω : Type*} [MeasurableSpace Ω]

/-- The uncentered empirical second moment
`M̂ₖₗ(ω) = n⁻¹ ∑ᵢ Vᵢ(ω)ₖ Vᵢ(ω)ₗ`.

Spec: D2. -/
noncomputable def sampleSecondMoment {r d : ℕ}
    (V : Fin r → Ω → EuclideanSpace ℝ (Fin d)) (ω : Ω) : Matrix (Fin d) (Fin d) ℝ :=
  fun k l => (r : ℝ)⁻¹ * ∑ i, V i ω k * V i ω l

omit [MeasurableSpace Ω] in
/-- The uncentered empirical second-moment matrix is Hermitian. -/
theorem isHermitian_sampleSecondMoment {r d : ℕ}
    (V : Fin r → Ω → EuclideanSpace ℝ (Fin d)) (ω : Ω) :
    (sampleSecondMoment V ω).IsHermitian := by
  sorry

/-- **Eigenvalue concentration of a sample matrix**: second moments of the
entries give, by Chebyshev and a union bound, simultaneous control of every
sorted eigenvalue with probability `1 − n²v/η²`. -/
theorem measure_forall_abs_eigenvalues₀_sub_le_ge
    (P : Measure Ω) [IsProbabilityMeasure P]
    (Shat : Ω → Matrix (Fin n) (Fin n) ℝ) (A : Matrix (Fin n) (Fin n) ℝ)
    (hSherm : ∀ ω, (Shat ω).IsHermitian) (hAherm : A.IsHermitian)
    (hmeas : ∀ k l, Measurable fun ω => Shat ω k l)
    (hint : ∀ k l, Integrable (fun ω => (Shat ω k l - A k l) ^ 2) P)
    {v η : ℝ} (hη : 0 < η) (hmoment : ∀ k l, ∫ ω, (Shat ω k l - A k l) ^ 2 ∂P ≤ v) :
    P {ω | ∀ k, |(hSherm ω).eigenvalues₀ k - hAherm.eigenvalues₀ k|
        ≤ (n : ℝ) * η} ≥ 1 - ENNReal.ofReal ((n : ℝ) ^ 2 * v / η ^ 2) := sorry

/-- The empirical mean of a finite family. -/
noncomputable def finiteMean (𝕜 : Type*) [RCLike 𝕜] {E : Type*} [NormedAddCommGroup E]
    [InnerProductSpace 𝕜 E] {n : ℕ} (z : Fin n → E) : E :=
  ((n : 𝕜)⁻¹) • ∑ i, z i

/-- The unnormalized centered scatter operator `∑ᵢ (zᵢ − mean z) ⊗ (zᵢ − mean z)`. -/
noncomputable def centeredScatter (𝕜 : Type*) [RCLike 𝕜] {E : Type*} [NormedAddCommGroup E]
    [InnerProductSpace 𝕜 E] {n : ℕ} (z : Fin n → E) : E →L[𝕜] E :=
  ∑ i, rankOne 𝕜 (z i - finiteMean 𝕜 z) (z i - finiteMean 𝕜 z)

/-- **The exact add-one update for the centered scatter operator**, the streaming
identity of the sample-moment layer.

`_snoc` would track the `Fin.snoc` in the statement more literally, but
`append` names the mathematics. -/
theorem centeredScatter_append (𝕜 : Type*) [RCLike 𝕜] {E : Type*} [NormedAddCommGroup E]
    [InnerProductSpace 𝕜 E] {n : ℕ} (z : Fin n → E) (y : E) :
    centeredScatter 𝕜 (Fin.snoc z y) = centeredScatter 𝕜 z +
      ((n : 𝕜) / ((n : 𝕜) + 1)) •
        rankOne 𝕜 (y - finiteMean 𝕜 z) (y - finiteMean 𝕜 z) := sorry

/-- **Milestone C2 -- the operator-norm deviation event**, on the same hypotheses as the
eigenvalue event above so that the two are visibly one event read two ways.

**A sibling of C1.**  Eigenvalue closeness does not bound an operator-norm
difference: two matrices can have identical spectra and differ by a rotation.  Both
descend from the same entrywise event, C1 through Weyl's inequality and this through
Part B's scalar-generic `norm_toEuclideanLin_le_of_entry_le`.

So the route is a refactor: factor the entrywise event
out of the eigenvalue theorem first, then compose it with the norm comparison here and
with Weyl there.

**C2 is stated without symmetry**: the operator-norm conclusion applies directly, while C1
carries Hermitian hypotheses for the eigenvalues. -/
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

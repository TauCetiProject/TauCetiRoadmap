import Mathlib
import TauCeti.Probability.Distributions.ChiSquared.Basic
import TauCeti.Probability.Distributions.Rademacher.Basic

/-!
# Random projections and sketching: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
few definitions they need; every definition has a real body. Every headline theorem of the README
is statable at the pins and is stated here. The README's remaining API, routes and Checks are not
restated.

Vectors are functions `Fin n → ℝ`, and the squared Euclidean norm of `v` is written `v ⬝ᵥ v`
(the sup norm that Mathlib puts on `Fin n → ℝ` is never used). Random matrices and random
vectors are functions on a probability space `(Ω, μ)`; their laws are fixed by `HasIIDEntries`.
Probabilities are `μ.real`.
-/

noncomputable section

open MeasureTheory ProbabilityTheory TauCeti.Probability
open scoped Matrix

namespace TauCetiRoadmap.RandomProjectionsAndSketching

variable {Ω : Type*} [MeasurableSpace Ω]

/-! ## Conventions -/

/-- Conventions. A family `X : Ω → ι → ℝ` has independent entries with common law `ν` under `μ`:
the coordinate functions are mutually independent and each has law `ν`. A random matrix
`R : Ω → Matrix (Fin k) (Fin d) ℝ` is used with `ι = Fin k × Fin d` through
`fun ω p ↦ R ω p.1 p.2`. -/
def HasIIDEntries {ι : Type*} (μ : Measure Ω) (X : Ω → ι → ℝ) (ν : Measure ℝ) : Prop :=
  iIndepFun (fun i ω ↦ X ω i) μ ∧ ∀ i, HasLaw (fun ω ↦ X ω i) ν μ

/-! ## Layer 1: Gaussian projections -/

/-- 1.1 The upper chi-squared tail in rate-function form: for `β ≥ 1`,
`P(Z ≥ βk) ≤ exp(-k(β - 1 - log β)/2)` for `Z` of law `χ²_k`. -/
theorem chiSquared_upper_tail (k : ℕ) {β : ℝ} (hβ : 1 ≤ β) :
    (chiSquaredMeasure k).real (Set.Ici (β * k)) ≤
      Real.exp (-(k : ℝ) * (β - 1 - Real.log β) / 2) := by
  sorry

/-- 1.1 The lower chi-squared tail in rate-function form: for `β ≤ 1`,
`P(Z ≤ βk) ≤ exp(-k(β - 1 - log β)/2)` for `Z` of law `χ²_k` (for `β ≤ 0` and `k ≥ 1` the left
side is `0`). -/
theorem chiSquared_lower_tail (k : ℕ) {β : ℝ} (hβ : β ≤ 1) :
    (chiSquaredMeasure k).real (Set.Iic (β * k)) ≤
      Real.exp (-(k : ℝ) * (β - 1 - Real.log β) / 2) := by
  sorry

/-- 1.2 The distributional Johnson–Lindenstrauss lemma for Gaussian matrices: if `R` has
independent standard Gaussian entries, then for every `x` and `ε > 0`,
`P(|‖Rx‖²/k - ‖x‖²| > ε‖x‖²) ≤ 2 exp(-k(ε²/2 - ε³/3)/2)`. -/
theorem gaussian_jl_tail {μ : Measure Ω} [IsProbabilityMeasure μ] {k d : ℕ}
    {R : Ω → Matrix (Fin k) (Fin d) ℝ}
    (hR : HasIIDEntries μ (fun ω (p : Fin k × Fin d) ↦ R ω p.1 p.2) (gaussianReal 0 1))
    (x : Fin d → ℝ) {ε : ℝ} (hε : 0 < ε) :
    μ.real {ω | ε * (x ⬝ᵥ x) < |(k : ℝ)⁻¹ * ((R ω *ᵥ x) ⬝ᵥ (R ω *ᵥ x)) - x ⬝ᵥ x|} ≤
      2 * Real.exp (-(k : ℝ) * (ε ^ 2 / 2 - ε ^ 3 / 3) / 2) := by
  sorry

/-- 1.3 The Johnson–Lindenstrauss lemma (Dasgupta–Gupta form): for `n` points in `ℝ^d`, `ε > 0`
and `k ≥ 4 log n / (ε²/2 - ε³/3)`, some linear map `ℝ^d → ℝ^k` distorts every squared distance
between the points by a factor in `[1 - ε, 1 + ε]`. -/
theorem exists_jl_embedding {n d k : ℕ} (x : Fin n → Fin d → ℝ) {ε : ℝ} (hε : 0 < ε)
    (hk : 4 * Real.log n / (ε ^ 2 / 2 - ε ^ 3 / 3) ≤ k) :
    ∃ L : Matrix (Fin k) (Fin d) ℝ, ∀ i j,
      (1 - ε) * ((x i - x j) ⬝ᵥ (x i - x j)) ≤ (L *ᵥ (x i - x j)) ⬝ᵥ (L *ᵥ (x i - x j)) ∧
      (L *ᵥ (x i - x j)) ⬝ᵥ (L *ᵥ (x i - x j)) ≤ (1 + ε) * ((x i - x j) ⬝ᵥ (x i - x j)) := by
  sorry

/-! ## Layer 2: sign and sparse projections -/

/-- 2.1 The sparse sign law: `√3` and `-√3` with probability `1/6` each and `0` with probability
`2/3`; it has mean `0`, variance `1` and fourth moment `3`. -/
def sparseSignMeasure : Measure ℝ :=
  (1 / 6 : ENNReal) • Measure.dirac (Real.sqrt 3) + (2 / 3 : ENNReal) • Measure.dirac 0 +
    (1 / 6 : ENNReal) • Measure.dirac (-Real.sqrt 3)

/-- 2.1 The three entry laws of this roadmap: standard Gaussian, Rademacher and sparse sign. -/
def IsJLEntryLaw (ν : Measure ℝ) : Prop :=
  ν = gaussianReal 0 1 ∨ ν = rademacherMeasure ∨ ν = sparseSignMeasure

/-- 2.2 Achlioptas' distributional bound: if `R` has independent entries, all Rademacher or all
sparse sign, then for every `x` and `ε > 0`,
`P(|‖Rx‖²/k - ‖x‖²| > ε‖x‖²) ≤ 2 exp(-k(ε²/2 - ε³/3)/2)`. -/
theorem sign_jl_tail {μ : Measure Ω} [IsProbabilityMeasure μ] {k d : ℕ} {ν : Measure ℝ}
    (hν : ν = rademacherMeasure ∨ ν = sparseSignMeasure) {R : Ω → Matrix (Fin k) (Fin d) ℝ}
    (hR : HasIIDEntries μ (fun ω (p : Fin k × Fin d) ↦ R ω p.1 p.2) ν)
    (x : Fin d → ℝ) {ε : ℝ} (hε : 0 < ε) :
    μ.real {ω | ε * (x ⬝ᵥ x) < |(k : ℝ)⁻¹ * ((R ω *ᵥ x) ⬝ᵥ (R ω *ᵥ x)) - x ⬝ᵥ x|} ≤
      2 * Real.exp (-(k : ℝ) * (ε ^ 2 / 2 - ε ^ 3 / 3) / 2) := by
  sorry

/-- 2.3 The finite-set Johnson–Lindenstrauss lemma for the three entry laws: for `n` points,
`0 < ε < 1`, every real `β` and `k ≥ (4 + 2β) log n / (ε²/2 - ε³/3)`, the map `x ↦ k^{-1/2} R x`
distorts every squared distance between the points by a factor in `[1 - ε, 1 + ε]` with
probability at least `1 - n^{-β}`. -/
theorem jl_finite_set {μ : Measure Ω} [IsProbabilityMeasure μ] {n k d : ℕ} {ν : Measure ℝ}
    (hν : IsJLEntryLaw ν) {R : Ω → Matrix (Fin k) (Fin d) ℝ}
    (hR : HasIIDEntries μ (fun ω (p : Fin k × Fin d) ↦ R ω p.1 p.2) ν)
    (x : Fin n → Fin d → ℝ) {ε β : ℝ} (hε₀ : 0 < ε) (hε₁ : ε < 1)
    (hk : (4 + 2 * β) * Real.log n / (ε ^ 2 / 2 - ε ^ 3 / 3) ≤ k) :
    1 - (n : ℝ) ^ (-β) ≤
      μ.real {ω | ∀ i j,
        |(k : ℝ)⁻¹ * ((R ω *ᵥ (x i - x j)) ⬝ᵥ (R ω *ᵥ (x i - x j))) -
            (x i - x j) ⬝ᵥ (x i - x j)| ≤ ε * ((x i - x j) ⬝ᵥ (x i - x j))} := by
  sorry

/-! ## Layer 3: trace estimators -/

/-- 3.1 Hutchinson's estimator is unbiased: for a Rademacher vector `z` with independent
coordinates and any square matrix `A`, `E[zᵀAz] = tr A`. -/
theorem integral_hutchinson {μ : Measure Ω} [IsProbabilityMeasure μ] {n : ℕ}
    {z : Ω → Fin n → ℝ} (hz : HasIIDEntries μ z rademacherMeasure)
    (A : Matrix (Fin n) (Fin n) ℝ) :
    μ[fun ω ↦ z ω ⬝ᵥ (A *ᵥ z ω)] = A.trace := by
  sorry

/-- 3.1 Hutchinson's variance: for a Rademacher vector `z` with independent coordinates and a
symmetric matrix `A`, `Var(zᵀAz) = 2(‖A‖_F² - ∑ᵢ Aᵢᵢ²)`. -/
theorem variance_hutchinson {μ : Measure Ω} [IsProbabilityMeasure μ] {n : ℕ}
    {z : Ω → Fin n → ℝ} (hz : HasIIDEntries μ z rademacherMeasure)
    {A : Matrix (Fin n) (Fin n) ℝ} (hA : A.IsSymm) :
    Var[fun ω ↦ z ω ⬝ᵥ (A *ᵥ z ω); μ] =
      2 * (∑ i, ∑ j, A i j ^ 2 - ∑ i, A i i ^ 2) := by
  sorry

/-- 3.2 The Gaussian trace estimator of a positive semidefinite matrix: with `M` independent
standard Gaussian probes `zₘ ∈ ℝⁿ` and `ε > 0`,
`P(|M⁻¹ ∑ₘ zₘᵀAzₘ - tr A| > ε tr A) ≤ 2 exp(-M(ε²/2 - ε³/3)/2)`. -/
theorem gaussian_trace_estimator_tail {μ : Measure Ω} [IsProbabilityMeasure μ] {M n : ℕ}
    {Z : Ω → Fin M → Fin n → ℝ}
    (hZ : HasIIDEntries μ (fun ω (p : Fin M × Fin n) ↦ Z ω p.1 p.2) (gaussianReal 0 1))
    {A : Matrix (Fin n) (Fin n) ℝ} (hA : A.PosSemidef) {ε : ℝ} (hε : 0 < ε) :
    μ.real {ω | ε * A.trace < |(M : ℝ)⁻¹ * ∑ m, Z ω m ⬝ᵥ (A *ᵥ Z ω m) - A.trace|} ≤
      2 * Real.exp (-(M : ℝ) * (ε ^ 2 / 2 - ε ^ 3 / 3) / 2) := by
  sorry

/-! ## Layer 4: CountSketch -/

/-- 4.1 The CountSketch matrix of a bucket map `h` and signs `σ`: column `j` has the single
entry `σ j` in row `h j`. -/
def countSketchMatrix {k d : ℕ} (h : Fin d → Fin k) (σ : Fin d → ℝ) :
    Matrix (Fin k) (Fin d) ℝ :=
  fun i j ↦ if h j = i then σ j else 0

/-- 4.1 `m`-wise independent Rademacher signs: each `σ j` has the Rademacher law, and any at
most `m` of them are mutually independent. -/
def HasKWiseIndepSigns {d : ℕ} (μ : Measure Ω) (σ : Ω → Fin d → ℝ) (m : ℕ) : Prop :=
  (∀ j, HasLaw (fun ω ↦ σ ω j) rademacherMeasure μ) ∧
    ∀ s : Finset (Fin d), s.card ≤ m → iIndepFun (fun (j : s) ω ↦ σ ω j) μ

/-- 4.1 Pairwise independent uniform buckets: each `h j` is uniform on `Fin k`, and any two
distinct `h j`, `h l` are independent. -/
def HasPairwiseUniformBuckets {d k : ℕ} (μ : Measure Ω) (h : Ω → Fin d → Fin k) : Prop :=
  (∀ j, HasLaw (fun ω ↦ h ω j) (uniformOn Set.univ) μ) ∧
    ∀ j l, j ≠ l → IndepFun (fun ω ↦ h ω j) (fun ω ↦ h ω l) μ

/-- 4.2 CountSketch preserves squared norms in expectation: with measurable buckets independent
of pairwise independent Rademacher signs, `E‖Sx‖² = ‖x‖²`. -/
theorem integral_countSketch {μ : Measure Ω} [IsProbabilityMeasure μ] {d k : ℕ}
    {h : Ω → Fin d → Fin k} {σ : Ω → Fin d → ℝ} (hh : AEMeasurable h μ)
    (hhσ : IndepFun h σ μ) (hσ : HasKWiseIndepSigns μ σ 2) (x : Fin d → ℝ) :
    μ[fun ω ↦ (countSketchMatrix (h ω) (σ ω) *ᵥ x) ⬝ᵥ (countSketchMatrix (h ω) (σ ω) *ᵥ x)] =
      x ⬝ᵥ x := by
  sorry

/-- 4.2 The variance of CountSketch: with pairwise independent uniform buckets independent of
4-wise independent Rademacher signs, `Var ‖Sx‖² = (2/k)(‖x‖⁴ - ∑ⱼ xⱼ⁴)`. -/
theorem variance_countSketch {μ : Measure Ω} [IsProbabilityMeasure μ] {d k : ℕ}
    {h : Ω → Fin d → Fin k} {σ : Ω → Fin d → ℝ} (hh : HasPairwiseUniformBuckets μ h)
    (hhσ : IndepFun h σ μ) (hσ : HasKWiseIndepSigns μ σ 4) (x : Fin d → ℝ) :
    Var[fun ω ↦ (countSketchMatrix (h ω) (σ ω) *ᵥ x) ⬝ᵥ (countSketchMatrix (h ω) (σ ω) *ᵥ x); μ] =
      2 / k * ((x ⬝ᵥ x) ^ 2 - ∑ j, x j ^ 4) := by
  sorry

/-! ## Layer 5: subspace embeddings and sketch-and-solve -/

/-- 5.1 `S` is an `ε`-subspace embedding for the subspace `V`: it multiplies the squared norm of
every vector of `V` by a factor in `[1 - ε, 1 + ε]`. -/
def IsSubspaceEmbedding {k n : ℕ} (S : Matrix (Fin k) (Fin n) ℝ) (V : Submodule ℝ (Fin n → ℝ))
    (ε : ℝ) : Prop :=
  ∀ y ∈ V, (1 - ε) * (y ⬝ᵥ y) ≤ (S *ᵥ y) ⬝ᵥ (S *ᵥ y) ∧ (S *ᵥ y) ⬝ᵥ (S *ᵥ y) ≤ (1 + ε) * (y ⬝ᵥ y)

/-- 5.2 Sketch-and-solve: if `S` is an `ε`-subspace embedding, `ε < 1`, for the span of the
columns of `A` and of `b`, and `x̃` minimises `‖S(Ax - b)‖²` over a set `C`, then
`‖Ax̃ - b‖² ≤ (1 + ε)/(1 - ε) ‖Ax - b‖²` for every `x ∈ C`. -/
theorem sketch_and_solve {n p k : ℕ} (A : Matrix (Fin n) (Fin p) ℝ) (b : Fin n → ℝ)
    (S : Matrix (Fin k) (Fin n) ℝ) {ε : ℝ} (hε : ε < 1)
    (hS : IsSubspaceEmbedding S (LinearMap.range A.mulVecLin ⊔ Submodule.span ℝ {b}) ε)
    (C : Set (Fin p → ℝ)) {xt : Fin p → ℝ}
    (hmin : IsMinOn (fun x ↦ (S *ᵥ (A *ᵥ x - b)) ⬝ᵥ (S *ᵥ (A *ᵥ x - b))) C xt) :
    ∀ x ∈ C, (A *ᵥ xt - b) ⬝ᵥ (A *ᵥ xt - b) ≤ (1 + ε) / (1 - ε) * ((A *ᵥ x - b) ⬝ᵥ (A *ᵥ x - b)) := by
  sorry

end TauCetiRoadmap.RandomProjectionsAndSketching

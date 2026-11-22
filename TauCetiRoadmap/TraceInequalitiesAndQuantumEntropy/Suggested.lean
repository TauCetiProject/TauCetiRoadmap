module

public import Mathlib
public import TauCeti.Analysis.Matrix.Entropy
public import TauCeti.Analysis.Matrix.FunctionalCalculus
public import TauCeti.InformationTheory.KullbackLeibler.Pinsker

/-!
# Trace inequalities and quantum entropy: target signatures

This file is not the roadmap: the roadmap is `README.md`, and this file is not an exhaustive
checklist. It states, against the pinned Mathlib and Tau Ceti and each with `sorry`, the
headlines of the README that carry a Lean name, each with every conclusion the README attaches
to it, together with the definitions their statements need. The README's other headlines are
targets of the same standing, stated there in prose with their locators or proof routes, and are
not stated here.

The conventions of the README are used throughout. Matrices are complex square matrices over a
finite index type, ordered by the Loewner order of `open scoped MatrixOrder`, so that `A ≤ B`
means `(B - A).PosSemidef`. A real function acts on a Hermitian matrix through Mathlib's
continuous functional calculus `cfc`; since the spectrum of a matrix is finite, `cfc f A` is the
spectral value for every `f`. Powers are `cfc (fun x : ℝ ↦ x ^ p) A` with Lean's `rpow`, so that
`A ^ 0 = 1` also for singular `A`; logarithms are natural, with `Real.log 0 = 0`. Entropies and
relative entropies are Tau Ceti's `Matrix.vonNeumannEntropy` and `Matrix.relativeEntropy`, with
the relative entropy in `EReal`, and the partial traces are Tau Ceti's `Matrix.partialTraceRight`
and `Matrix.partialTraceLeft`, all imported.

Every definition below is a verbatim local copy of a definition owned elsewhere, with a docstring
naming the owner: the matrix-convexity notions and the operator mean of the roadmap
OperatorMonotoneFunctionsAndMatrixMeans (its Sections 1.1 and 5.1); a roadmap cannot be imported.
The implementation namespace of the README is `TauCeti`; the prototypes live in this roadmap's
namespace.
-/

@[expose] public section

noncomputable section

open Filter Set Topology Matrix
open scoped MatrixOrder ComplexOrder Kronecker

namespace TauCetiRoadmap.TraceInequalitiesAndQuantumEntropy

attribute [local instance] Classical.propDecidable

/-! ## Local copies -/

/-- Complex square matrices of size `n`. Local copy of `Mat` from the roadmap
`OperatorMonotoneFunctionsAndMatrixMeans` (Conventions). -/
abbrev Mat (n : ℕ) := Matrix (Fin n) (Fin n) ℂ

/-- `f` is matrix convex of order `n` on `I`. Local copy of `IsMatrixConvexOn` from the roadmap
`OperatorMonotoneFunctionsAndMatrixMeans` (Section 1.1). -/
def IsMatrixConvexOn (n : ℕ) (f : ℝ → ℝ) (I : Set ℝ) : Prop :=
  ∀ ⦃A B : Mat n⦄, A.IsHermitian → B.IsHermitian → spectrum ℝ A ⊆ I → spectrum ℝ B ⊆ I →
    ∀ ⦃t : ℝ⦄, t ∈ Icc (0 : ℝ) 1 →
      cfc f ((1 - t) • A + t • B) ≤ (1 - t) • cfc f A + t • cfc f B

/-- `f` is operator convex on `I`: matrix convex of every order. Local copy of
`IsOperatorConvexOn` from the roadmap `OperatorMonotoneFunctionsAndMatrixMeans` (Section 1.1). -/
def IsOperatorConvexOn (f : ℝ → ℝ) (I : Set ℝ) : Prop :=
  ∀ n, IsMatrixConvexOn n f I

/-- The positive square root through the functional calculus. Local copy of `msqrt` from the
roadmap `OperatorMonotoneFunctionsAndMatrixMeans` (Section 5.1). -/
def msqrt {n : ℕ} (A : Mat n) : Mat n := cfc Real.sqrt A

/-- The inverse positive square root through the functional calculus. Local copy of `misqrt`
from the roadmap `OperatorMonotoneFunctionsAndMatrixMeans` (Section 5.1). -/
def misqrt {n : ℕ} (A : Mat n) : Mat n := cfc (fun x ↦ (Real.sqrt x)⁻¹) A

/-- The operator mean `A^{1/2} f(A^{-1/2} B A^{-1/2}) A^{1/2}`, meaningful for `A` positive
definite; for operator convex `f` it is the operator perspective of `f` at `(B, A)`. Local copy
of `opMean` from the roadmap `OperatorMonotoneFunctionsAndMatrixMeans` (Section 5.1). -/
def opMean {n : ℕ} (f : ℝ → ℝ) (A B : Mat n) : Mat n :=
  msqrt A * cfc f (misqrt A * B * misqrt A) * msqrt A

variable {ι κ : Type*} [Fintype ι] [DecidableEq ι] [Fintype κ] [DecidableEq κ]

/-! ## Layer 1: trace functions -/

/-- **Monotone trace functions.** -/
theorem re_trace_cfc_le_of_le {f : ℝ → ℝ} {I : Set ℝ} (hf : MonotoneOn f I)
    {A B : Matrix ι ι ℂ} (hA : A.IsHermitian) (hB : B.IsHermitian) (hAI : spectrum ℝ A ⊆ I)
    (hBI : spectrum ℝ B ⊆ I) (hAB : A ≤ B) :
    (cfc f A).trace.re ≤ (cfc f B).trace.re := sorry

/-- **Peierls's inequality**: for a convex `f` and every orthonormal basis, given as the columns
of a unitary `U`, `∑ᵢ f(⟨uᵢ, A uᵢ⟩) ≤ Tr f(A)`. -/
theorem sum_le_re_trace_cfc {f : ℝ → ℝ} {I : Set ℝ} (hf : ConvexOn ℝ I f)
    {A : Matrix ι ι ℂ} (hA : A.IsHermitian) (hAI : spectrum ℝ A ⊆ I)
    {U : Matrix ι ι ℂ} (hU : U ∈ Matrix.unitaryGroup ι ℂ) :
    ∑ i, f ((Uᴴ * A * U) i i).re ≤ (cfc f A).trace.re := sorry

/-- **Convex trace functions**: `A ↦ Tr f(A)` is convex on Hermitian matrices with spectra in
`I` when `f` is convex on `I`. -/
theorem convexOn_re_trace_cfc {f : ℝ → ℝ} {I : Set ℝ} (hf : ConvexOn ℝ I f) :
    ConvexOn ℝ {A : Matrix ι ι ℂ | A.IsHermitian ∧ spectrum ℝ A ⊆ I}
      (fun A ↦ (cfc f A).trace.re) := sorry

/-- **The generalized Klein inequality.** -/
theorem re_trace_sum_cfc_mul_cfc_nonneg {k : ℕ} {f g : Fin k → ℝ → ℝ} {I : Set ℝ}
    (hfg : ∀ a ∈ I, ∀ h ∈ I, 0 ≤ ∑ i, f i a * g i h)
    {A B : Matrix ι ι ℂ} (hA : A.IsHermitian) (hB : B.IsHermitian) (hAI : spectrum ℝ A ⊆ I)
    (hBI : spectrum ℝ B ⊆ I) :
    0 ≤ (∑ i, cfc (f i) A * cfc (g i) B).trace.re := sorry

/-- **Klein's inequality with a derivative**: `Tr (f(A) - f(B)) ≥ Tr ((A - B) f'(B))` for a
convex differentiable `f`. -/
theorem re_trace_mul_cfc_deriv_le {f f' : ℝ → ℝ} {I : Set ℝ} (hf : ConvexOn ℝ I f)
    (hd : ∀ x ∈ I, HasDerivAt f (f' x) x)
    {A B : Matrix ι ι ℂ} (hA : A.IsHermitian) (hB : B.IsHermitian) (hAI : spectrum ℝ A ⊆ I)
    (hBI : spectrum ℝ B ⊆ I) :
    ((A - B) * cfc f' B).trace.re ≤ (cfc f A - cfc f B).trace.re := sorry

/-- **The equality case of Klein's inequality**: for positive semidefinite `ρ` and `σ`,
`D(ρ ‖ σ) = Tr ρ - Tr σ` only for `ρ = σ`. -/
theorem relativeEntropy_eq_iff {ρ σ : Matrix ι ι ℂ} (hρ : ρ.PosSemidef) (hσ : σ.PosSemidef) :
    relativeEntropy ρ σ = ((ρ.trace.re - σ.trace.re : ℝ) : EReal) ↔ ρ = σ := sorry

/-- **The Gibbs variational principle**: for Hermitian `H` and a density matrix `ρ`,
`Tr (ρ H) + S(ρ) ≤ log Tr e^H`, with equality exactly at the Gibbs state `e^H / Tr e^H`. -/
theorem re_trace_mul_add_vonNeumannEntropy_le {H ρ : Matrix ι ι ℂ} (hH : H.IsHermitian)
    (hρ : ρ.PosSemidef) (htr : ρ.trace = 1) :
    (ρ * H).trace.re + vonNeumannEntropy ρ ≤ Real.log (cfc Real.exp H).trace.re ∧
      ((ρ * H).trace.re + vonNeumannEntropy ρ = Real.log (cfc Real.exp H).trace.re ↔
        ρ = ((cfc Real.exp H).trace.re)⁻¹ • cfc Real.exp H) := sorry

/-- **The Peierls–Bogoliubov inequality.** -/
theorem peierls_bogoliubov {H P : Matrix ι ι ℂ} (hH : H.IsHermitian) (hP : P.IsHermitian) :
    (cfc Real.exp H * P).trace.re / (cfc Real.exp H).trace.re ≤
      Real.log (cfc Real.exp (H + P)).trace.re - Real.log (cfc Real.exp H).trace.re := sorry

/-! ## Layer 2: perspectives and joint convexity -/

/-- **The Effros–Ebadian–Nikoufar–Gharakhanlu theorem**: `f` is operator convex on `(0, ∞)` iff its
operator perspective `(C, D) ↦ D^{1/2} f(D^{-1/2} C D^{-1/2}) D^{1/2} = opMean f D C` is jointly
convex on positive definite matrices of every size. -/
theorem isOperatorConvexOn_Ioi_iff_opMean {f : ℝ → ℝ} :
    IsOperatorConvexOn f (Ioi 0) ↔
      ∀ (n : ℕ) (C₀ C₁ D₀ D₁ : Mat n), C₀.PosDef → C₁.PosDef → D₀.PosDef → D₁.PosDef →
        ∀ t ∈ Icc (0 : ℝ) 1,
          opMean f ((1 - t) • D₀ + t • D₁) ((1 - t) • C₀ + t • C₁) ≤
            (1 - t) • opMean f D₀ C₀ + t • opMean f D₁ C₁ := sorry

/-- **The operator perspective under positive maps**: for `f` operator convex on `(0, ∞)`, a
positive linear map `Φ` and positive definite `A`, `B` with `Φ A` positive definite,
`opMean f (Φ A) (Φ B) ≤ Φ (opMean f A B)`. -/
theorem opMean_map_le_map_opMean {f : ℝ → ℝ} (hf : IsOperatorConvexOn f (Ioi 0)) {m n : ℕ}
    (Φ : Mat n →ₗ[ℂ] Mat m) (hΦ : ∀ X, X.PosSemidef → (Φ X).PosSemidef) {A B : Mat n}
    (hA : A.PosDef) (hB : B.PosDef) (hΦA : (Φ A).PosDef) :
    opMean f (Φ A) (Φ B) ≤ Φ (opMean f A B) := sorry

/-- **Lieb's concavity theorem, tensor form**: for `p, q ≥ 0` with `p + q ≤ 1`,
`(A, B) ↦ A^p ⊗ B^q` is jointly concave on positive semidefinite matrices. -/
theorem kronecker_rpow_jointly_concave {p q : ℝ} (hp : 0 ≤ p) (hq : 0 ≤ q) (hpq : p + q ≤ 1)
    {A₀ A₁ : Matrix ι ι ℂ} {B₀ B₁ : Matrix κ κ ℂ} (hA₀ : A₀.PosSemidef) (hA₁ : A₁.PosSemidef)
    (hB₀ : B₀.PosSemidef) (hB₁ : B₁.PosSemidef) {t : ℝ} (ht : t ∈ Icc (0 : ℝ) 1) :
    (1 - t) • (cfc (fun x : ℝ ↦ x ^ p) A₀ ⊗ₖ cfc (fun x : ℝ ↦ x ^ q) B₀) +
        t • (cfc (fun x : ℝ ↦ x ^ p) A₁ ⊗ₖ cfc (fun x : ℝ ↦ x ^ q) B₁) ≤
      cfc (fun x : ℝ ↦ x ^ p) ((1 - t) • A₀ + t • A₁) ⊗ₖ
        cfc (fun x : ℝ ↦ x ^ q) ((1 - t) • B₀ + t • B₁) := sorry

/-- **Ando's convexity theorem, tensor form**: for `α ∈ [-1, 0] ∪ [1, 2]`,
`(A, B) ↦ A^α ⊗ B^(1 - α)` is jointly convex on positive definite matrices. -/
theorem kronecker_rpow_jointly_convex {α : ℝ} (hα : α ∈ Icc (-1 : ℝ) 0 ∪ Icc 1 2)
    {A₀ A₁ : Matrix ι ι ℂ} {B₀ B₁ : Matrix κ κ ℂ} (hA₀ : A₀.PosDef) (hA₁ : A₁.PosDef)
    (hB₀ : B₀.PosDef) (hB₁ : B₁.PosDef) {t : ℝ} (ht : t ∈ Icc (0 : ℝ) 1) :
    cfc (fun x : ℝ ↦ x ^ α) ((1 - t) • A₀ + t • A₁) ⊗ₖ
        cfc (fun x : ℝ ↦ x ^ (1 - α)) ((1 - t) • B₀ + t • B₁) ≤
      (1 - t) • (cfc (fun x : ℝ ↦ x ^ α) A₀ ⊗ₖ cfc (fun x : ℝ ↦ x ^ (1 - α)) B₀) +
        t • (cfc (fun x : ℝ ↦ x ^ α) A₁ ⊗ₖ cfc (fun x : ℝ ↦ x ^ (1 - α)) B₁) := sorry

/-- **Lieb's concavity theorem, trace form**, with a rectangular `K`: for `p, q ≥ 0` with
`p + q ≤ 1`, `(A, B) ↦ Tr (Kᴴ A^p K B^q)` is jointly concave on positive semidefinite matrices. -/
theorem re_trace_lieb_jointly_concave {p q : ℝ} (hp : 0 ≤ p) (hq : 0 ≤ q) (hpq : p + q ≤ 1)
    (K : Matrix ι κ ℂ) {A₀ A₁ : Matrix ι ι ℂ} {B₀ B₁ : Matrix κ κ ℂ} (hA₀ : A₀.PosSemidef)
    (hA₁ : A₁.PosSemidef) (hB₀ : B₀.PosSemidef) (hB₁ : B₁.PosSemidef) {t : ℝ}
    (ht : t ∈ Icc (0 : ℝ) 1) :
    (1 - t) * (Kᴴ * cfc (fun x : ℝ ↦ x ^ p) A₀ * K * cfc (fun x : ℝ ↦ x ^ q) B₀).trace.re +
        t * (Kᴴ * cfc (fun x : ℝ ↦ x ^ p) A₁ * K * cfc (fun x : ℝ ↦ x ^ q) B₁).trace.re ≤
      (Kᴴ * cfc (fun x : ℝ ↦ x ^ p) ((1 - t) • A₀ + t • A₁) * K *
        cfc (fun x : ℝ ↦ x ^ q) ((1 - t) • B₀ + t • B₁)).trace.re := sorry

/-- **Ando's convexity theorem, trace form**: for `α ∈ [-1, 0] ∪ [1, 2]`,
`(A, B) ↦ Tr (Kᴴ A^α K B^(1 - α))` is jointly convex on positive definite matrices. -/
theorem re_trace_ando_jointly_convex {α : ℝ} (hα : α ∈ Icc (-1 : ℝ) 0 ∪ Icc 1 2)
    (K : Matrix ι κ ℂ) {A₀ A₁ : Matrix ι ι ℂ} {B₀ B₁ : Matrix κ κ ℂ} (hA₀ : A₀.PosDef)
    (hA₁ : A₁.PosDef) (hB₀ : B₀.PosDef) (hB₁ : B₁.PosDef) {t : ℝ} (ht : t ∈ Icc (0 : ℝ) 1) :
    (Kᴴ * cfc (fun x : ℝ ↦ x ^ α) ((1 - t) • A₀ + t • A₁) * K *
        cfc (fun x : ℝ ↦ x ^ (1 - α)) ((1 - t) • B₀ + t • B₁)).trace.re ≤
      (1 - t) * (Kᴴ * cfc (fun x : ℝ ↦ x ^ α) A₀ * K *
          cfc (fun x : ℝ ↦ x ^ (1 - α)) B₀).trace.re +
        t * (Kᴴ * cfc (fun x : ℝ ↦ x ^ α) A₁ * K *
          cfc (fun x : ℝ ↦ x ^ (1 - α)) B₁).trace.re := sorry

/-- **The Wigner–Yanase–Dyson skew information**
`Iₚ(ρ, K) = Tr (ρ K²) - Tr (ρ^p K ρ^(1 - p) K)` of a Hermitian `K` is nonnegative and convex in
the positive semidefinite `ρ`, for `p ∈ [0, 1]`. -/
theorem wignerYanaseDyson_nonneg_and_convexOn {p : ℝ} (hp : p ∈ Icc (0 : ℝ) 1)
    {K : Matrix ι ι ℂ} (hK : K.IsHermitian) :
    (∀ ρ : Matrix ι ι ℂ, ρ.PosSemidef →
      0 ≤ (ρ * K * K).trace.re -
        (cfc (fun x : ℝ ↦ x ^ p) ρ * K * cfc (fun x : ℝ ↦ x ^ (1 - p)) ρ * K).trace.re) ∧
    ConvexOn ℝ {ρ : Matrix ι ι ℂ | ρ.PosSemidef} (fun ρ ↦ (ρ * K * K).trace.re -
      (cfc (fun x : ℝ ↦ x ^ p) ρ * K * cfc (fun x : ℝ ↦ x ^ (1 - p)) ρ * K).trace.re) := sorry

/-- **Joint convexity of the relative entropy** on positive semidefinite matrices, in `EReal`. -/
theorem relativeEntropy_jointly_convex {ρ₀ ρ₁ σ₀ σ₁ : Matrix ι ι ℂ} (hρ₀ : ρ₀.PosSemidef)
    (hρ₁ : ρ₁.PosSemidef) (hσ₀ : σ₀.PosSemidef) (hσ₁ : σ₁.PosSemidef) {t : ℝ}
    (ht : t ∈ Icc (0 : ℝ) 1) :
    relativeEntropy ((1 - t) • ρ₀ + t • ρ₁) ((1 - t) • σ₀ + t • σ₁) ≤
      ((1 - t : ℝ) : EReal) * relativeEntropy ρ₀ σ₀ + (t : EReal) * relativeEntropy ρ₁ σ₁ :=
  sorry

/-- **Joint subadditivity of the relative entropy** on positive semidefinite matrices. -/
theorem relativeEntropy_sum_le {k : ℕ} {ρ σ : Fin k → Matrix ι ι ℂ}
    (hρ : ∀ j, (ρ j).PosSemidef) (hσ : ∀ j, (σ j).PosSemidef) :
    relativeEntropy (∑ j, ρ j) (∑ j, σ j) ≤ ∑ j, relativeEntropy (ρ j) (σ j) := sorry

/-- **The relative entropy as a derivative**:
`D(ρ ‖ σ) = lim_{ε ↓ 0} (Tr ρ - Tr ρ^(1 - ε) σ^ε) / ε`, in `EReal`, including the value `⊤`. -/
theorem tendsto_relativeEntropy {ρ σ : Matrix ι ι ℂ} (hρ : ρ.PosSemidef) (hσ : σ.PosSemidef) :
    Tendsto (fun ε : ℝ ↦ (((ρ.trace -
        (cfc (fun x : ℝ ↦ x ^ (1 - ε)) ρ * cfc (fun x : ℝ ↦ x ^ ε) σ).trace).re / ε : ℝ) : EReal))
      (𝓝[>] 0) (𝓝 (relativeEntropy ρ σ)) := sorry

/-! ## Layer 3: data processing -/

/-- **Isometric invariance** of the entropy and the relative entropy. -/
theorem relativeEntropy_conj_isometry {V : Matrix κ ι ℂ} (hV : Vᴴ * V = 1)
    {ρ σ : Matrix ι ι ℂ} (hρ : ρ.PosSemidef) (hσ : σ.PosSemidef) :
    relativeEntropy (V * ρ * Vᴴ) (V * σ * Vᴴ) = relativeEntropy ρ σ ∧
      vonNeumannEntropy (V * ρ * Vᴴ) = vonNeumannEntropy ρ := sorry

/-- **Additivity on Kronecker products**:
`D(ρ₁ ⊗ ρ₂ ‖ σ₁ ⊗ σ₂) = Tr ρ₂ · D(ρ₁ ‖ σ₁) + Tr ρ₁ · D(ρ₂ ‖ σ₂)`, with no nonvanishing hypothesis in
`EReal`. -/
theorem relativeEntropy_kronecker {ρ₁ σ₁ : Matrix ι ι ℂ} {ρ₂ σ₂ : Matrix κ κ ℂ}
    (hρ₁ : ρ₁.PosSemidef) (hσ₁ : σ₁.PosSemidef) (hρ₂ : ρ₂.PosSemidef) (hσ₂ : σ₂.PosSemidef) :
    relativeEntropy (ρ₁ ⊗ₖ ρ₂) (σ₁ ⊗ₖ σ₂) =
      (ρ₂.trace.re : EReal) * relativeEntropy ρ₁ σ₁ +
        (ρ₁.trace.re : EReal) * relativeEntropy ρ₂ σ₂ := sorry

/-- **Monotonicity of the relative entropy** under a channel in Kraus form
`X ↦ ∑ⱼ Kⱼ X Kⱼᴴ` with `∑ⱼ Kⱼᴴ Kⱼ = 1`. -/
theorem relativeEntropy_kraus_le {r : ℕ} (K : Fin r → Matrix κ ι ℂ)
    (hK : ∑ j, (K j)ᴴ * K j = 1) {ρ σ : Matrix ι ι ℂ} (hρ : ρ.PosSemidef) (hσ : σ.PosSemidef) :
    relativeEntropy (∑ j, K j * ρ * (K j)ᴴ) (∑ j, K j * σ * (K j)ᴴ) ≤ relativeEntropy ρ σ :=
  sorry

/-- **Monotonicity of the Petz–Rényi quasi-entropies, `α ∈ [0, 1]`**:
`Tr ρ^α σ^(1 - α)` does not decrease under a channel in Kraus form. -/
theorem re_trace_rpow_mul_rpow_le_kraus {r : ℕ} (K : Fin r → Matrix κ ι ℂ)
    (hK : ∑ j, (K j)ᴴ * K j = 1) {α : ℝ} (hα : α ∈ Icc (0 : ℝ) 1) {ρ σ : Matrix ι ι ℂ}
    (hρ : ρ.PosSemidef) (hσ : σ.PosSemidef) :
    (cfc (fun x : ℝ ↦ x ^ α) ρ * cfc (fun x : ℝ ↦ x ^ (1 - α)) σ).trace.re ≤
      (cfc (fun x : ℝ ↦ x ^ α) (∑ j, K j * ρ * (K j)ᴴ) *
        cfc (fun x : ℝ ↦ x ^ (1 - α)) (∑ j, K j * σ * (K j)ᴴ)).trace.re := sorry

/-- **Monotonicity of the Petz–Rényi quasi-entropies, `α ∈ [1, 2]`**:
`Tr ρ^α σ^(1 - α)` does not increase under a channel in Kraus form, for positive definite `σ`
with positive definite image. -/
theorem re_trace_rpow_mul_rpow_kraus_le {r : ℕ} (K : Fin r → Matrix κ ι ℂ)
    (hK : ∑ j, (K j)ᴴ * K j = 1) {α : ℝ} (hα : α ∈ Icc (1 : ℝ) 2) {ρ σ : Matrix ι ι ℂ}
    (hρ : ρ.PosSemidef) (hσ : σ.PosDef) (hΦσ : (∑ j, K j * σ * (K j)ᴴ).PosDef) :
    (cfc (fun x : ℝ ↦ x ^ α) (∑ j, K j * ρ * (K j)ᴴ) *
        cfc (fun x : ℝ ↦ x ^ (1 - α)) (∑ j, K j * σ * (K j)ᴴ)).trace.re ≤
      (cfc (fun x : ℝ ↦ x ^ α) ρ * cfc (fun x : ℝ ↦ x ^ (1 - α)) σ).trace.re := sorry

/-- **Contraction of the trace norm** `‖X‖₁ = Tr |X|` of a Hermitian `X` under a positive
trace-preserving linear map. -/
theorem re_trace_cfc_abs_map_le (Φ : Matrix ι ι ℂ →ₗ[ℂ] Matrix κ κ ℂ)
    (hΦ : ∀ X, X.PosSemidef → (Φ X).PosSemidef) (htr : ∀ X, (Φ X).trace = X.trace)
    {X : Matrix ι ι ℂ} (hX : X.IsHermitian) :
    (cfc (fun x : ℝ ↦ |x|) (Φ X)).trace.re ≤ (cfc (fun x : ℝ ↦ |x|) X).trace.re := sorry

/-- **The quantum Pinsker inequality**, natural logarithms: `‖ρ - σ‖₁² / 2 ≤ D(ρ ‖ σ)` for
density matrices. -/
theorem sq_traceNorm_le_two_mul_relativeEntropy {ρ σ : Matrix ι ι ℂ} (hρ : ρ.PosSemidef)
    (hσ : σ.PosSemidef) (hρ1 : ρ.trace = 1) (hσ1 : σ.trace = 1) :
    (((cfc (fun x : ℝ ↦ |x|) (ρ - σ)).trace.re ^ 2 / 2 : ℝ) : EReal) ≤ relativeEntropy ρ σ :=
  sorry

/-- **Mutual information as a relative entropy**: for a positive semidefinite `ρ` on a bipartite
system, `D(ρ ‖ ρ_A ⊗ ρ_B) = S(ρ_A) + S(ρ_B) - S(ρ)`; the trace is not used. -/
theorem relativeEntropy_kronecker_partialTrace {ρ : Matrix (ι × κ) (ι × κ) ℂ}
    (hρ : ρ.PosSemidef) :
    relativeEntropy ρ (partialTraceRight ρ ⊗ₖ partialTraceLeft ρ) =
      ((vonNeumannEntropy (partialTraceRight ρ) + vonNeumannEntropy (partialTraceLeft ρ) -
        vonNeumannEntropy ρ : ℝ) : EReal) := sorry

/-- **Monotonicity of the mutual information** under a channel on the second factor, in Kraus
form `1 ⊗ Kⱼ` with `∑ⱼ Kⱼᴴ Kⱼ = 1`. -/
theorem mutualInformation_kraus_le {μ : Type*} [Fintype μ] [DecidableEq μ] {r : ℕ}
    (K : Fin r → Matrix μ κ ℂ) (hK : ∑ j, (K j)ᴴ * K j = 1) {ρ : Matrix (ι × κ) (ι × κ) ℂ}
    (hρ : ρ.PosSemidef) (htr : ρ.trace = 1) :
    let ρ' : Matrix (ι × μ) (ι × μ) ℂ :=
      ∑ j, ((1 : Matrix ι ι ℂ) ⊗ₖ K j) * ρ * ((1 : Matrix ι ι ℂ) ⊗ₖ K j)ᴴ
    vonNeumannEntropy (partialTraceRight ρ') + vonNeumannEntropy (partialTraceLeft ρ') -
        vonNeumannEntropy ρ' ≤
      vonNeumannEntropy (partialTraceRight ρ) + vonNeumannEntropy (partialTraceLeft ρ) -
        vonNeumannEntropy ρ := sorry

/-- **Holevo's bound**: the classical mutual information between the label of an ensemble
`(pₐ, ρₐ)` and the outcome of a measurement `(M_b)` is at most the Holevo quantity
`χ = S(∑ₐ pₐ ρₐ) - ∑ₐ pₐ S(ρₐ)`. -/
theorem holevo_bound {k l : ℕ} {p : Fin k → ℝ} (hp : ∀ a, 0 ≤ p a) (hp1 : ∑ a, p a = 1)
    {ρ : Fin k → Matrix ι ι ℂ} (hρ : ∀ a, (ρ a).PosSemidef) (hρ1 : ∀ a, (ρ a).trace = 1)
    {M : Fin l → Matrix ι ι ℂ} (hM : ∀ b, (M b).PosSemidef) (hM1 : ∑ b, M b = 1) :
    let q : Fin k → Fin l → ℝ := fun a b ↦ p a * (M b * ρ a).trace.re
    ∑ a, ∑ b, q a b * Real.log (q a b / (p a * ∑ a', q a' b)) ≤
      vonNeumannEntropy (∑ a, p a • ρ a) - ∑ a, p a * vonNeumannEntropy (ρ a) := sorry

/-! ## Layer 4: purification and continuity -/

/-- **Unitary equivalence of purifications**: two vectors on `ι × κ` with the same reduced matrix
on `ι` differ by a unitary on `κ`. -/
theorem exists_unitary_of_partialTraceRight_eq {u v : ι × κ → ℂ}
    (h : partialTraceRight (vecMulVec u (star u)) = partialTraceRight (vecMulVec v (star v))) :
    ∃ U ∈ Matrix.unitaryGroup κ ℂ, v = ((1 : Matrix ι ι ℂ) ⊗ₖ U) *ᵥ u := sorry

/-- **Equal entropies of the two reductions of a pure state.** -/
theorem vonNeumannEntropy_partialTraceRight_vecMulVec (u : ι × κ → ℂ) :
    vonNeumannEntropy (partialTraceRight (vecMulVec u (star u))) =
      vonNeumannEntropy (partialTraceLeft (vecMulVec u (star u))) := sorry

/-- **The Araki–Lieb inequality** `|S(ρ_A) - S(ρ_B)| ≤ S(ρ)` for a density matrix `ρ`. -/
theorem abs_sub_vonNeumannEntropy_partialTrace_le {ρ : Matrix (ι × κ) (ι × κ) ℂ}
    (hρ : ρ.PosSemidef) (htr : ρ.trace = 1) :
    |vonNeumannEntropy (partialTraceRight ρ) - vonNeumannEntropy (partialTraceLeft ρ)| ≤
      vonNeumannEntropy ρ := sorry

/-- **Audenaert's continuity bound for the Shannon entropy**, natural logarithms:
`|H(p) - H(q)| ≤ λ log(n - 1) + h(λ)` with `λ = ‖p - q‖₁ / 2` and `h` the binary entropy. -/
theorem abs_sub_shannon_le {n : ℕ} {p q : Fin n → ℝ} (hp : ∀ i, 0 ≤ p i) (hq : ∀ i, 0 ≤ q i)
    (hp1 : ∑ i, p i = 1) (hq1 : ∑ i, q i = 1) :
    |∑ i, Real.negMulLog (p i) - ∑ i, Real.negMulLog (q i)| ≤
      (∑ i, |p i - q i|) / 2 * Real.log (n - 1) + Real.binEntropy ((∑ i, |p i - q i|) / 2) :=
  sorry

/-- **The Fannes–Audenaert inequality**, natural logarithms:
`|S(ρ) - S(σ)| ≤ δ log(d - 1) + h(δ)` with `δ = ‖ρ - σ‖₁ / 2`, `d = card ι`. -/
theorem abs_sub_vonNeumannEntropy_le {ρ σ : Matrix ι ι ℂ} (hρ : ρ.PosSemidef)
    (hσ : σ.PosSemidef) (hρ1 : ρ.trace = 1) (hσ1 : σ.trace = 1) :
    |vonNeumannEntropy ρ - vonNeumannEntropy σ| ≤
      (cfc (fun x : ℝ ↦ |x|) (ρ - σ)).trace.re / 2 * Real.log (Fintype.card ι - 1) +
        Real.binEntropy ((cfc (fun x : ℝ ↦ |x|) (ρ - σ)).trace.re / 2) := sorry

/-! ## Layer 5: products of positive matrices -/

section Products

open scoped Matrix.Norms.L2Operator

/-- **The Cordes inequality** `‖A^s B^s‖ ≤ ‖A B‖^s` in the operator norm, for positive
semidefinite `A`, `B` and `s ∈ [0, 1]`. -/
theorem norm_rpow_mul_rpow_le {A B : Matrix ι ι ℂ} (hA : A.PosSemidef) (hB : B.PosSemidef)
    {s : ℝ} (hs : s ∈ Icc (0 : ℝ) 1) :
    ‖cfc (fun x : ℝ ↦ x ^ s) A * cfc (fun x : ℝ ↦ x ^ s) B‖ ≤ ‖A * B‖ ^ s := sorry

end Products

/-- **The Araki–Lieb–Thirring inequality**: for positive semidefinite `A`, `B`, `s ≥ 0` and
`t ≥ 1`, `Tr (B^(1/2) A B^(1/2))^(s t) ≤ Tr (B^(t/2) A^t B^(t/2))^s`. -/
theorem araki_lieb_thirring {A B : Matrix ι ι ℂ} (hA : A.PosSemidef) (hB : B.PosSemidef)
    {s t : ℝ} (hs : 0 ≤ s) (ht : 1 ≤ t) :
    (cfc (fun x : ℝ ↦ x ^ (s * t))
        (cfc (fun x : ℝ ↦ x ^ (1 / 2 : ℝ)) B * A * cfc (fun x : ℝ ↦ x ^ (1 / 2 : ℝ)) B)).trace.re ≤
      (cfc (fun x : ℝ ↦ x ^ s)
        (cfc (fun x : ℝ ↦ x ^ (t / 2)) B * cfc (fun x : ℝ ↦ x ^ t) A *
          cfc (fun x : ℝ ↦ x ^ (t / 2)) B)).trace.re := sorry

/-- **The Lieb–Thirring inequality** `Tr (A B)^m ≤ Tr A^m B^m` for positive semidefinite `A`,
`B`. -/
theorem re_trace_mul_pow_le {A B : Matrix ι ι ℂ} (hA : A.PosSemidef) (hB : B.PosSemidef)
    (m : ℕ) :
    ((A * B) ^ m).trace.re ≤ (A ^ m * B ^ m).trace.re := sorry

/-! ## Supplier names cited in the README -/

#check @Matrix.IsHermitian.cfc_eq
#check @Matrix.IsHermitian.eigenvalues₀_antitone
#check @Matrix.IsHermitian.trace_cfc
#check @Matrix.IsHermitian.re_trace_cfc_mul_cfc
#check @Matrix.trace_kronecker
#check @Matrix.charpoly_mul_comm
#check @Matrix.unitaryGroup
#check @Real.negMulLog
#check @Real.binEntropy
#check @CompletelyPositiveMap
#check @TauCeti.etvDist_sq_le_two_mul_klDiv
#check @Matrix.vonNeumannEntropy
#check @Matrix.relativeEntropy
#check @Matrix.partialTraceRight
#check @Matrix.partialTraceLeft
#check @Matrix.PosSemidef.re_trace_sub_trace_le_relativeEntropy
#check @Matrix.PosSemidef.relativeEntropy_nonneg
#check @Matrix.PosSemidef.vonNeumannEntropy_nonneg
#check @Matrix.PosSemidef.vonNeumannEntropy_le_log_card
#check @Matrix.PosSemidef.vonNeumannEntropy_le_partialTraceRight_add_partialTraceLeft

end TauCetiRoadmap.TraceInequalitiesAndQuantumEntropy

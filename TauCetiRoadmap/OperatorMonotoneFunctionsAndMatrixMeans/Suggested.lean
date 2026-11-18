module

public import Mathlib
public import TauCeti.Analysis.Complex.Pick.Basic
public import TauCeti.Analysis.Complex.Pick.Nevanlinna
public import TauCeti.Analysis.Complex.Pick.Boundary
public import TauCeti.Analysis.SpecialFunctions.ContinuousFunctionalCalculus.GeometricMean
public import TauCeti.Analysis.Matrix.GeometricMean

/-!
# Operator monotone functions and matrix means: target signatures

This file is not the roadmap: the roadmap is `README.md`, and this file is not an exhaustive
checklist. It states, against the pinned Mathlib and Tau Ceti and each with `sorry`, the
headlines of the README that carry a Lean name, each with every conclusion the README attaches
to it, together with the definitions their statements need. The README's other headlines are
targets of the same standing, stated there in prose with their locators or proof routes, and are
not stated here.

The conventions of the README are used throughout. Matrices are complex square matrices
`Matrix (Fin n) (Fin n) ℂ`, ordered by the Loewner order of `open scoped MatrixOrder`, so that
`A ≤ B` means `(B - A).PosSemidef`. A real function acts on a Hermitian matrix through Mathlib's
continuous functional calculus `cfc`; since the spectrum of a matrix is finite, `cfc f A` is the
spectral value `U * diagonal (f ∘ eigenvalues) * Uᴴ` for every `f`, with no continuity side
condition. Matrix monotonicity and convexity quantify over a dimension `n`; the operator notions
quantify over every `n`.

The unitarily invariant seminorm is a local copy of the structure owned by
`OperatorTheory/Majorization` (its Part B), with a docstring naming the owner. The
implementation namespace of the README is `TauCeti`; the prototypes live in this roadmap's
namespace.
-/

@[expose] public section

noncomputable section

open MeasureTheory Filter Set Topology Matrix
open scoped MatrixOrder ComplexOrder

namespace TauCetiRoadmap.OperatorMonotoneFunctionsAndMatrixMeans

attribute [local instance] Classical.propDecidable

/-- Complex square matrices of size `n`. -/
abbrev Mat (n : ℕ) := Matrix (Fin n) (Fin n) ℂ

/-! ## Layer 1: the notions -/

/-- `f` is matrix monotone of order `n` on `I`: it preserves the Loewner order between
Hermitian `n × n` matrices with spectra in `I`. -/
def IsMatrixMonotoneOn (n : ℕ) (f : ℝ → ℝ) (I : Set ℝ) : Prop :=
  ∀ ⦃A B : Mat n⦄, A.IsHermitian → B.IsHermitian → spectrum ℝ A ⊆ I → spectrum ℝ B ⊆ I →
    A ≤ B → cfc f A ≤ cfc f B

/-- `f` is operator monotone on `I`: matrix monotone of every order. -/
def IsOperatorMonotoneOn (f : ℝ → ℝ) (I : Set ℝ) : Prop :=
  ∀ n, IsMatrixMonotoneOn n f I

/-- `f` is matrix convex of order `n` on `I`. -/
def IsMatrixConvexOn (n : ℕ) (f : ℝ → ℝ) (I : Set ℝ) : Prop :=
  ∀ ⦃A B : Mat n⦄, A.IsHermitian → B.IsHermitian → spectrum ℝ A ⊆ I → spectrum ℝ B ⊆ I →
    ∀ ⦃t : ℝ⦄, t ∈ Icc (0 : ℝ) 1 →
      cfc f ((1 - t) • A + t • B) ≤ (1 - t) • cfc f A + t • cfc f B

/-- `f` is operator convex on `I`: matrix convex of every order. -/
def IsOperatorConvexOn (f : ℝ → ℝ) (I : Set ℝ) : Prop :=
  ∀ n, IsMatrixConvexOn n f I

/-- `f` is operator concave on `I`: `-f` is operator convex there. -/
def IsOperatorConcaveOn (f : ℝ → ℝ) (I : Set ℝ) : Prop :=
  IsOperatorConvexOn (fun t ↦ -f t) I

/-- Composition: an operator monotone function of an operator monotone function. -/
theorem IsOperatorMonotoneOn.comp {f g : ℝ → ℝ} {I J : Set ℝ}
    (hf : IsOperatorMonotoneOn f J) (hg : IsOperatorMonotoneOn g I) (hgIJ : MapsTo g I J) :
    IsOperatorMonotoneOn (f ∘ g) I := sorry

/-- Pointwise limits of operator monotone functions are operator monotone. -/
theorem isOperatorMonotoneOn_of_tendsto {F : ℕ → ℝ → ℝ} {f : ℝ → ℝ} {I : Set ℝ}
    (hF : ∀ k, IsOperatorMonotoneOn (F k) I)
    (hlim : ∀ x ∈ I, Tendsto (fun k ↦ F k x) atTop (𝓝 (f x))) :
    IsOperatorMonotoneOn f I := sorry

/-- `-1/t` is operator monotone and `1/t` operator convex on `(0, ∞)`. -/
theorem isOperatorMonotoneOn_neg_inv :
    IsOperatorMonotoneOn (fun x ↦ -x⁻¹) (Ioi 0) ∧ IsOperatorConvexOn (fun x ↦ x⁻¹) (Ioi 0) :=
  sorry

/-- `t ^ 2` is operator convex on `ℝ` but not matrix monotone of order `2` on `[0, ∞)`. -/
theorem isOperatorConvexOn_sq_and_not_isMatrixMonotoneOn :
    IsOperatorConvexOn (fun x ↦ x ^ 2) univ ∧ ¬ IsMatrixMonotoneOn 2 (fun x ↦ x ^ 2) (Ici 0) :=
  sorry

/-- Neither `t ^ 3` on `[0, ∞)` nor `|t|` on `ℝ` is matrix convex of order `2`. -/
theorem not_isMatrixConvexOn_cube_abs :
    ¬ IsMatrixConvexOn 2 (fun x ↦ x ^ 3) (Ici 0) ∧ ¬ IsMatrixConvexOn 2 (fun x ↦ |x|) univ :=
  sorry

/-! ## Layer 2: Jensen-type characterizations -/

/-- **Davis's compression criterion.** On an interval, operator convexity is equivalent to the
inequality `f (Vᴴ A V) ≤ Vᴴ f(A) V` for every isometry `V`. -/
theorem isOperatorConvexOn_iff_isometry {f : ℝ → ℝ} {I : Set ℝ} (hI : I.OrdConnected) :
    IsOperatorConvexOn f I ↔
      ∀ (m n : ℕ) (V : Matrix (Fin m) (Fin n) ℂ) (A : Mat m), Vᴴ * V = 1 → A.IsHermitian →
        spectrum ℝ A ⊆ I → cfc f (Vᴴ * A * V) ≤ Vᴴ * cfc f A * V := sorry

/-- **The Jensen operator inequality** (Hansen–Pedersen). -/
theorem cfc_sum_conjTranspose_mul_le {f : ℝ → ℝ} {I : Set ℝ} (hI : I.OrdConnected)
    (hf : IsOperatorConvexOn f I) {k m n : ℕ} (K : Fin k → Matrix (Fin m) (Fin n) ℂ)
    (A : Fin k → Mat m) (hK : ∑ j, (K j)ᴴ * K j = 1) (hA : ∀ j, (A j).IsHermitian)
    (hspec : ∀ j, spectrum ℝ (A j) ⊆ I) :
    cfc f (∑ j, (K j)ᴴ * A j * K j) ≤ ∑ j, (K j)ᴴ * cfc f (A j) * K j := sorry

/-- **The Hansen–Pedersen contraction inequality.** -/
theorem cfc_conjTranspose_mul_le_of_contraction {f : ℝ → ℝ} {I : Set ℝ} (hI : I.OrdConnected)
    (h0 : (0 : ℝ) ∈ I) (hf : IsOperatorConvexOn f I) (hf0 : f 0 ≤ 0) {m n : ℕ}
    (K : Matrix (Fin m) (Fin n) ℂ) (hK : Kᴴ * K ≤ 1) {A : Mat m} (hA : A.IsHermitian)
    (hspec : spectrum ℝ A ⊆ I) :
    cfc f (Kᴴ * A * K) ≤ Kᴴ * cfc f A * K := sorry

/-- **The Choi–Davis–Jensen inequality** for a positive unital linear map. -/
theorem cfc_map_le_map_cfc {f : ℝ → ℝ} {I : Set ℝ} (hI : I.OrdConnected)
    (hf : IsOperatorConvexOn f I) {m n : ℕ} (Φ : Mat n →ₗ[ℂ] Mat m)
    (hΦ : ∀ X, X.PosSemidef → (Φ X).PosSemidef) (hΦ1 : Φ 1 = 1) {A : Mat n}
    (hA : A.IsHermitian) (hspec : spectrum ℝ A ⊆ I) :
    cfc f (Φ A) ≤ Φ (cfc f A) := sorry

/-- **Monotone equals concave on the half-line** for continuous nonnegative functions. -/
theorem isOperatorMonotoneOn_Ici_iff_isOperatorConcaveOn {f : ℝ → ℝ}
    (hc : ContinuousOn f (Ici 0)) (hpos : ∀ t, 0 ≤ t → 0 ≤ f t) :
    IsOperatorMonotoneOn f (Ici 0) ↔ IsOperatorConcaveOn f (Ici 0) := sorry

/-- **The Bendat–Sherman criterion.** -/
theorem isOperatorConvexOn_Ici_iff {f : ℝ → ℝ} (hc : ContinuousOn f (Ici 0)) :
    IsOperatorConvexOn f (Ici 0) ∧ f 0 ≤ 0 ↔
      IsOperatorMonotoneOn (fun t ↦ f t / t) (Ioi 0) := sorry

/-- The exact ranges of the operator monotone and the operator convex powers. -/
theorem isOperatorMonotoneOn_rpow_iff (r : ℝ) :
    (IsOperatorMonotoneOn (fun x ↦ x ^ r) (Ioi 0) ↔ r ∈ Icc (0 : ℝ) 1) ∧
      (IsOperatorConvexOn (fun x ↦ x ^ r) (Ioi 0) ↔ r ∈ Icc (-1 : ℝ) 0 ∪ Icc 1 2) := sorry

/-- The logarithm is operator monotone and operator concave, and `t log t` operator convex. -/
theorem isOperatorMonotoneOn_log :
    IsOperatorMonotoneOn Real.log (Ioi 0) ∧ IsOperatorConcaveOn Real.log (Ioi 0) ∧
      IsOperatorConvexOn (fun x ↦ x * Real.log x) (Ici 0) := sorry

/-! ## Layer 3: the differential theory -/

/-- The first divided difference, with the derivative on the diagonal. -/
def divDiff (f : ℝ → ℝ) (x y : ℝ) : ℝ :=
  if x = y then deriv f x else (f x - f y) / (x - y)

/-- The Loewner matrix of `f` at the points `x`. -/
def loewnerMatrix {n : ℕ} (f : ℝ → ℝ) (x : Fin n → ℝ) : Mat n :=
  Matrix.of fun i j ↦ (divDiff f (x i) (x j) : ℂ)

/-- **The Daleckii–Krein formula.** -/
theorem hasDerivAt_cfc_add_smul {f : ℝ → ℝ} {I : Set ℝ} (hI : IsOpen I)
    (hf : ContDiffOn ℝ 1 f I) {n : ℕ} {A H : Mat n} (hA : A.IsHermitian) (hH : H.IsHermitian)
    (hspec : spectrum ℝ A ⊆ I) :
    HasDerivAt (fun t : ℝ ↦ cfc f (A + t • H))
      ((hA.eigenvectorUnitary : Mat n) *
        (loewnerMatrix f hA.eigenvalues ⊙
          (star (hA.eigenvectorUnitary : Mat n) * H * (hA.eigenvectorUnitary : Mat n))) *
        star (hA.eigenvectorUnitary : Mat n)) 0 := sorry

/-- **Loewner's criterion**: matrix monotonicity of order `n` is positivity of the Loewner
matrices of size `n`. -/
theorem isMatrixMonotoneOn_iff_posSemidef_loewnerMatrix {f : ℝ → ℝ} {a b : ℝ}
    (hf : ContDiffOn ℝ 1 f (Ioo a b)) (n : ℕ) :
    IsMatrixMonotoneOn n f (Ioo a b) ↔
      ∀ x : Fin n → ℝ, (∀ i, x i ∈ Ioo a b) → (loewnerMatrix f x).PosSemidef := sorry

/-- A function that is matrix monotone of order `2` on an open interval is `C¹` there. -/
theorem contDiffOn_of_isMatrixMonotoneOn_two {f : ℝ → ℝ} {a b : ℝ}
    (hf : IsMatrixMonotoneOn 2 f (Ioo a b)) : ContDiffOn ℝ 1 f (Ioo a b) := sorry

/-! ## Layer 4: Loewner's theorem -/

/-- **Loewner's theorem on `(-1, 1)`**: integral representation, with a unique measure. -/
theorem isOperatorMonotoneOn_Ioo_iff {f : ℝ → ℝ} :
    IsOperatorMonotoneOn f (Ioo (-1) 1) ↔
      ∃! ν : Measure ℝ, IsFiniteMeasure ν ∧ ν (Icc (-1) 1)ᶜ = 0 ∧
        ∀ x ∈ Ioo (-1 : ℝ) 1, f x = f 0 + ∫ l, x / (1 + l * x) ∂ν := sorry

/-- **Loewner's theorem, Pick form**: on a bounded open interval, operator monotone functions
are the restrictions of Pick functions that continue analytically across the interval. -/
theorem isOperatorMonotoneOn_Ioo_iff_pick {f : ℝ → ℝ} {a b : ℝ} (hab : a < b) :
    IsOperatorMonotoneOn f (Ioo a b) ↔
      ∃ F : ℂ → ℂ, DifferentiableOn ℂ F ({z : ℂ | z.im ≠ 0} ∪ (ofReal '' Ioo a b)) ∧
        (∀ z : ℂ, 0 < z.im → 0 ≤ (F z).im) ∧ ∀ x ∈ Ioo a b, F x = f x := sorry

/-- **The half-line representation** of a nonnegative operator monotone function, with unique
data `(α, β, ρ)`. -/
theorem isOperatorMonotoneOn_Ioi_iff {f : ℝ → ℝ} (hpos : ∀ t, 0 < t → 0 ≤ f t) :
    IsOperatorMonotoneOn f (Ioi 0) ↔
      ∃! p : ℝ × ℝ × Measure ℝ, 0 ≤ p.1 ∧ 0 ≤ p.2.1 ∧ IsFiniteMeasure p.2.2 ∧
        p.2.2 (Ioi 0)ᶜ = 0 ∧
        ∀ t, 0 < t → f t = p.1 + p.2.1 * t + ∫ s, t * (1 + s) / (t + s) ∂p.2.2 := sorry

/-- Transfer to unital C⋆-algebras: a nonnegative operator monotone function on `(0, ∞)` is
monotone on the strictly positive elements. -/
theorem cfc_le_cfc_of_isOperatorMonotoneOn {𝒜 : Type*} [CStarAlgebra 𝒜] [PartialOrder 𝒜]
    [StarOrderedRing 𝒜] {f : ℝ → ℝ} (hf : IsOperatorMonotoneOn f (Ioi 0))
    (hpos : ∀ t, 0 < t → 0 ≤ f t) {a b : 𝒜} (ha : IsStrictlyPositive a) (hab : a ≤ b) :
    cfc f a ≤ cfc f b := sorry

/-! ## Layer 5: Kubo–Ando means -/

/-- The positive square root of a Hermitian matrix through the functional calculus. -/
def msqrt {n : ℕ} (A : Mat n) : Mat n := cfc Real.sqrt A

/-- The inverse positive square root of a Hermitian matrix through the functional calculus. -/
def misqrt {n : ℕ} (A : Mat n) : Mat n := cfc (fun x ↦ (Real.sqrt x)⁻¹) A

/-- A representing function of a mean: continuous, nonnegative and operator monotone on
`[0, ∞)`, with `f 1 = 1`. -/
def IsMeanFunction (f : ℝ → ℝ) : Prop :=
  ContinuousOn f (Ici 0) ∧ (∀ t, 0 ≤ t → 0 ≤ f t) ∧ IsOperatorMonotoneOn f (Ici 0) ∧ f 1 = 1

/-- The operator mean `A^{1/2} f(A^{-1/2} B A^{-1/2}) A^{1/2}`, meaningful for `A` positive
definite. -/
def opMean {n : ℕ} (f : ℝ → ℝ) (A B : Mat n) : Mat n :=
  msqrt A * cfc f (misqrt A * B * misqrt A) * msqrt A

/-- The operator mean of positive semidefinite matrices, as the limit of regularized means. -/
def opMeanPSD {n : ℕ} (f : ℝ → ℝ) (A B : Mat n) : Mat n :=
  limUnder (𝓝[>] (0 : ℝ)) fun ε ↦ opMean f (A + ε • 1) (B + ε • 1)

/-- A Kubo–Ando mean: a family over all dimensions of binary operations on positive
semidefinite matrices, jointly monotone, obeying the transformer inequality for rectangular
matrices, continuous along decreasing sequences, and normalized. -/
structure KuboAndoMean where
  /-- The mean in dimension `n`. -/
  mean : ∀ n : ℕ, Mat n → Mat n → Mat n
  posSemidef_mean : ∀ n (A B : Mat n), A.PosSemidef → B.PosSemidef → (mean n A B).PosSemidef
  mono : ∀ n (A A' B B' : Mat n), A.PosSemidef → B.PosSemidef → A ≤ A' → B ≤ B' →
    mean n A B ≤ mean n A' B'
  transformer : ∀ m n (C : Matrix (Fin m) (Fin n) ℂ) (A B : Mat m), A.PosSemidef →
    B.PosSemidef → Cᴴ * mean m A B * C ≤ mean n (Cᴴ * A * C) (Cᴴ * B * C)
  continuous_antitone : ∀ n (A B : ℕ → Mat n) (A₀ B₀ : Mat n), (∀ k, (A k).PosSemidef) →
    (∀ k, (B k).PosSemidef) → Antitone A → Antitone B → Tendsto A atTop (𝓝 A₀) →
    Tendsto B atTop (𝓝 B₀) → Tendsto (fun k ↦ mean n (A k) (B k)) atTop (𝓝 (mean n A₀ B₀))
  mean_one_one : ∀ n, mean n 1 1 = 1

/-- The regularized means converge, and their limit is `opMean` when `A` is positive definite. -/
theorem tendsto_opMean_add_smul_one {f : ℝ → ℝ} (hf : IsMeanFunction f) {n : ℕ} {A B : Mat n}
    (hA : A.PosSemidef) (hB : B.PosSemidef) :
    Tendsto (fun ε : ℝ ↦ opMean f (A + ε • 1) (B + ε • 1)) (𝓝[>] 0) (𝓝 (opMeanPSD f A B)) ∧
      (A.PosDef → opMeanPSD f A B = opMean f A B) := sorry

/-- Every representing function defines a Kubo–Ando mean. -/
theorem exists_kuboAndoMean {f : ℝ → ℝ} (hf : IsMeanFunction f) :
    ∃ σ : KuboAndoMean, ∀ n (A B : Mat n), A.PosSemidef → B.PosSemidef →
      σ.mean n A B = opMeanPSD f A B := sorry

/-- **The Kubo–Ando theorem**: every Kubo–Ando mean has a representing function, unique on
`[0, ∞)`. -/
theorem KuboAndoMean.exists_isMeanFunction (σ : KuboAndoMean) :
    ∃ f : ℝ → ℝ, IsMeanFunction f ∧
      (∀ n (A B : Mat n), A.PosSemidef → B.PosSemidef → σ.mean n A B = opMeanPSD f A B) ∧
      ∀ g : ℝ → ℝ, IsMeanFunction g →
        (∀ n (A B : Mat n), A.PosSemidef → B.PosSemidef → σ.mean n A B = opMeanPSD g A B) →
        EqOn g f (Ici 0) := sorry

/-- **The transpose of a mean**: exchanging the arguments replaces `f` by `t f(1/t)`. -/
theorem opMean_swap {f : ℝ → ℝ} {n : ℕ} {A B : Mat n} (hA : A.PosDef) (hB : B.PosDef) :
    opMean f B A = opMean (fun t ↦ t * f t⁻¹) A B := sorry

/-- A symmetric mean lies between the harmonic and the arithmetic mean. -/
theorem harmonic_le_opMean_le_arithmetic {f : ℝ → ℝ} (hf : IsMeanFunction f)
    (hsymm : ∀ t, 0 < t → t * f t⁻¹ = f t) {n : ℕ} {A B : Mat n} (hA : A.PosDef)
    (hB : B.PosDef) :
    (2 : ℝ) • (A⁻¹ + B⁻¹)⁻¹ ≤ opMean f A B ∧ opMean f A B ≤ (1 / 2 : ℝ) • (A + B) := sorry

/-- **Ando's inequality** for a positive linear map. -/
theorem map_opMeanPSD_le {f : ℝ → ℝ} (hf : IsMeanFunction f) {m n : ℕ}
    (Φ : Mat n →ₗ[ℂ] Mat m) (hΦ : ∀ X, X.PosSemidef → (Φ X).PosSemidef) {A B : Mat n}
    (hA : A.PosSemidef) (hB : B.PosSemidef) :
    Φ (opMeanPSD f A B) ≤ opMeanPSD f (Φ A) (Φ B) := sorry

/-- **Joint concavity** of every Kubo–Ando mean. -/
theorem opMeanPSD_jointly_concave {f : ℝ → ℝ} (hf : IsMeanFunction f) {n : ℕ}
    {A A' B B' : Mat n} (hA : A.PosSemidef) (hA' : A'.PosSemidef) (hB : B.PosSemidef)
    (hB' : B'.PosSemidef) {t : ℝ} (ht : t ∈ Icc (0 : ℝ) 1) :
    (1 - t) • opMeanPSD f A B + t • opMeanPSD f A' B' ≤
      opMeanPSD f ((1 - t) • A + t • A') ((1 - t) • B + t • B') := sorry

/-! ## Layer 6: the weighted geometric mean -/

/-- The weighted geometric mean `A #_t B`. -/
def wgm {n : ℕ} (t : ℝ) (A B : Mat n) : Mat n := opMean (fun x ↦ x ^ t) A B

/-- At `t = 1/2` the weighted geometric mean is Tau Ceti's geometric mean. -/
theorem wgm_half_eq_geometricMean {n : ℕ} {A B : Mat n} (hA : A.PosDef) (hB : B.PosSemidef) :
    wgm (1 / 2) A B = TauCeti.geometricMean A B := sorry

/-- Exchange, inversion and congruence: `A #_t B = B #_{1-t} A`,
`(A #_t B)⁻¹ = A⁻¹ #_t B⁻¹` and `Xᴴ (A #_t B) X = (Xᴴ A X) #_t (Xᴴ B X)` for invertible `X`. -/
theorem wgm_symm_inv_congr {n : ℕ} {A B : Mat n} (hA : A.PosDef) (hB : B.PosDef) (t : ℝ) :
    wgm t A B = wgm (1 - t) B A ∧ (wgm t A B)⁻¹ = wgm t A⁻¹ B⁻¹ ∧
      ∀ X : Mat n, IsUnit X → Xᴴ * wgm t A B * X = wgm t (Xᴴ * A * X) (Xᴴ * B * X) := sorry

/-- For commuting arguments the weighted geometric mean is `A ^ (1 - t) * B ^ t`, and its
determinant is always `det A ^ (1 - t) * det B ^ t`. -/
theorem wgm_of_commute_and_det {n : ℕ} {A B : Mat n} (hA : A.PosDef) (hB : B.PosDef)
    (t : ℝ) :
    (Commute A B → wgm t A B = cfc (fun x : ℝ ↦ x ^ (1 - t)) A * cfc (fun x : ℝ ↦ x ^ t) B) ∧
      (wgm t A B).det = ((A.det.re ^ (1 - t) * B.det.re ^ t : ℝ) : ℂ) := sorry

/-- **The harmonic–geometric–arithmetic mean inequality**; for `0 < t < 1` equality in either
comparison holds exactly at `A = B`. -/
theorem harmonic_le_wgm_le_arithmetic {n : ℕ} {A B : Mat n} (hA : A.PosDef) (hB : B.PosDef)
    {t : ℝ} (ht : t ∈ Icc (0 : ℝ) 1) :
    ((1 - t) • A⁻¹ + t • B⁻¹)⁻¹ ≤ wgm t A B ∧ wgm t A B ≤ (1 - t) • A + t • B ∧
      (t ∈ Ioo (0 : ℝ) 1 → (wgm t A B = (1 - t) • A + t • B ↔ A = B) ∧
        (((1 - t) • A⁻¹ + t • B⁻¹)⁻¹ = wgm t A B ↔ A = B)) := sorry

/-- **Block maximality**: `A # B` is the largest positive semidefinite `X` making the block
matrix `[[A, X], [X, B]]` positive semidefinite. -/
theorem isGreatest_geometricMean {n : ℕ} {A B : Mat n} (hA : A.PosDef) (hB : B.PosDef) :
    IsGreatest {X : Mat n | X.PosSemidef ∧ (Matrix.fromBlocks A X X B).PosSemidef}
      (TauCeti.geometricMean A B) := sorry

/-! ## Layer 7: the geometry of the positive definite cone -/

/-- The Frobenius norm, written out. -/
def frob {n : ℕ} (M : Mat n) : ℝ := Real.sqrt (∑ i, ∑ j, ‖M i j‖ ^ 2)

/-- The affine-invariant (trace) distance `‖log (A^{-1/2} B A^{-1/2})‖_F`. -/
def riemDist {n : ℕ} (A B : Mat n) : ℝ := frob (cfc Real.log (misqrt A * B * misqrt A))

/-- Invariance under congruence and inversion, and symmetry. -/
theorem riemDist_congr_inv_symm {n : ℕ} {A B X : Mat n} (hA : A.PosDef) (hB : B.PosDef)
    (hX : IsUnit X) :
    riemDist (Xᴴ * A * X) (Xᴴ * B * X) = riemDist A B ∧ riemDist A⁻¹ B⁻¹ = riemDist A B ∧
      riemDist B A = riemDist A B := sorry

/-- **The exponential metric increasing property.** -/
theorem frob_log_sub_log_le_riemDist {n : ℕ} {A B : Mat n} (hA : A.PosDef) (hB : B.PosDef) :
    frob (cfc Real.log A - cfc Real.log B) ≤ riemDist A B := sorry

/-- The triangle inequality, and vanishing exactly on the diagonal. -/
theorem riemDist_triangle {n : ℕ} {A B C : Mat n} (hA : A.PosDef) (hB : B.PosDef)
    (hC : C.PosDef) :
    riemDist A C ≤ riemDist A B + riemDist B C ∧ (riemDist A B = 0 ↔ A = B) := sorry

/-- The weighted geometric mean runs along a constant-speed geodesic, and it is the only point
at distances `t d` from `A` and `(1 - t) d` from `B`. -/
theorem riemDist_wgm {n : ℕ} {A B : Mat n} (hA : A.PosDef) (hB : B.PosDef) {t : ℝ}
    (ht : t ∈ Icc (0 : ℝ) 1) :
    riemDist A (wgm t A B) = t * riemDist A B ∧
      riemDist (wgm t A B) B = (1 - t) * riemDist A B ∧
      ∀ X : Mat n, X.PosDef → riemDist A X = t * riemDist A B →
        riemDist X B = (1 - t) * riemDist A B → X = wgm t A B := sorry

open scoped Matrix.Norms.L2Operator in
/-- The length of a path in the positive definite cone; the derivative is taken in the
operator-norm structure on matrices, which induces the usual topology. -/
def pathLength {n : ℕ} (γ : ℝ → Mat n) : ℝ :=
  ∫ t in (0 : ℝ)..1, frob (misqrt (γ t) * deriv γ t * misqrt (γ t))

open scoped Matrix.Norms.L2Operator in
/-- The distance is the least length of a `C¹` path in the cone, attained by `t ↦ A #_t B`. -/
theorem riemDist_le_pathLength_and_pathLength_wgm {n : ℕ} {A B : Mat n} (hA : A.PosDef)
    (hB : B.PosDef) :
    (∀ γ : ℝ → Mat n, ContDiff ℝ 1 γ → (∀ t ∈ Icc (0 : ℝ) 1, (γ t).PosDef) → γ 0 = A →
        γ 1 = B → riemDist A B ≤ pathLength γ) ∧
      pathLength (fun t ↦ wgm t A B) = riemDist A B := sorry

/-- **The semiparallelogram law** (nonpositive curvature). -/
theorem riemDist_wgm_sq_le {n : ℕ} {A B C : Mat n} (hA : A.PosDef) (hB : B.PosDef)
    (hC : C.PosDef) {t : ℝ} (ht : t ∈ Icc (0 : ℝ) 1) :
    riemDist C (wgm t A B) ^ 2 ≤
      (1 - t) * riemDist C A ^ 2 + t * riemDist C B ^ 2 - t * (1 - t) * riemDist A B ^ 2 :=
  sorry

/-- Completeness: Cauchy sequences of positive definite matrices converge in the cone. -/
theorem exists_tendsto_riemDist_of_cauchy {n : ℕ} {u : ℕ → Mat n} (hu : ∀ k, (u k).PosDef)
    (hcauchy : ∀ ε > 0, ∃ N, ∀ k ≥ N, ∀ l ≥ N, riemDist (u k) (u l) < ε) :
    ∃ A : Mat n, A.PosDef ∧ Tendsto (fun k ↦ riemDist (u k) A) atTop (𝓝 0) := sorry

/-- **The Karcher barycenter** of finitely many weighted points exists and is unique. -/
theorem existsUnique_barycenter {n m : ℕ} (A : Fin m → Mat n) (hA : ∀ i, (A i).PosDef)
    (w : Fin m → ℝ) (hw : ∀ i, 0 < w i) (hsum : ∑ i, w i = 1) :
    ∃! X : Mat n, X.PosDef ∧
      ∀ Y : Mat n, Y.PosDef → ∑ i, w i * riemDist X (A i) ^ 2 ≤ ∑ i, w i * riemDist Y (A i) ^ 2 :=
  sorry

/-! ## Layer 8: norm inequalities -/

/-- Local copy of `OperatorTheory/Majorization`'s unitarily invariant seminorm (its Part B):
a seminorm on linear maps between finite-dimensional inner product spaces, invariant under
independent unitary changes of source and target coordinates. The owner is
`OperatorTheory/Majorization`. -/
structure UnitarilyInvariantSeminorm (𝕜 E F : Type*) [RCLike 𝕜]
    [NormedAddCommGroup E] [InnerProductSpace 𝕜 E] [FiniteDimensional 𝕜 E]
    [NormedAddCommGroup F] [InnerProductSpace 𝕜 F] [FiniteDimensional 𝕜 F]
    extends Seminorm 𝕜 (E →ₗ[𝕜] F) where
  unitary_invariant' : ∀ (U : unitary (F →ₗ[𝕜] F)) (V : unitary (E →ₗ[𝕜] E)) (A),
    toFun ((U : F →ₗ[𝕜] F) ∘ₗ A ∘ₗ (V : E →ₗ[𝕜] E)) = toFun A

/-- The unitarily invariant seminorm of an `n × n` matrix, through its Euclidean operator. -/
def UnitarilyInvariantSeminorm.mat {n : ℕ}
    (N : UnitarilyInvariantSeminorm ℂ (EuclideanSpace ℂ (Fin n)) (EuclideanSpace ℂ (Fin n)))
    (M : Mat n) : ℝ :=
  N.toFun (Matrix.toEuclideanLin M)

/-- **Kittaneh's lemma**: if `AB` is Hermitian, its norm is at most that of `Re (BA)`. -/
theorem UnitarilyInvariantSeminorm.mat_mul_le_re {n : ℕ}
    (N : UnitarilyInvariantSeminorm ℂ (EuclideanSpace ℂ (Fin n)) (EuclideanSpace ℂ (Fin n)))
    {A B : Mat n} (h : (A * B).IsHermitian) :
    N.mat (A * B) ≤ N.mat ((1 / 2 : ℂ) • (B * A + (B * A)ᴴ)) := sorry

/-- **The matrix arithmetic–geometric mean inequality** of Bhatia and Kittaneh: for singular
values `s_j(A*B) ≤ s_j(AA* + BB*) / 2`, and hence in every unitarily invariant seminorm. -/
theorem singularValues_conjTranspose_mul_le {n : ℕ} (A B : Mat n) :
    (∀ j, (Matrix.toEuclideanLin (Aᴴ * B)).singularValues j ≤
      (1 / 2) * (Matrix.toEuclideanLin (A * Aᴴ + B * Bᴴ)).singularValues j) ∧
    ∀ N : UnitarilyInvariantSeminorm ℂ (EuclideanSpace ℂ (Fin n)) (EuclideanSpace ℂ (Fin n)),
      2 * N.mat (Aᴴ * B) ≤ N.mat (A * Aᴴ + B * Bᴴ) := sorry

/-- **The Heinz inequality.** -/
theorem UnitarilyInvariantSeminorm.mat_heinz_le {n : ℕ}
    (N : UnitarilyInvariantSeminorm ℂ (EuclideanSpace ℂ (Fin n)) (EuclideanSpace ℂ (Fin n)))
    {A B : Mat n} (hA : A.PosSemidef) (hB : B.PosSemidef) (X : Mat n) {t : ℝ}
    (ht : t ∈ Icc (0 : ℝ) 1) :
    N.mat (cfc (fun x : ℝ ↦ x ^ t) A * X * cfc (fun x : ℝ ↦ x ^ (1 - t)) B +
        cfc (fun x : ℝ ↦ x ^ (1 - t)) A * X * cfc (fun x : ℝ ↦ x ^ t) B) ≤
      N.mat (A * X + X * B) := sorry

/-- **Zhan's inequality** `4 ‖AB‖ ≤ ‖(A + B)²‖` for positive semidefinite `A`, `B`. -/
theorem UnitarilyInvariantSeminorm.four_mul_mat_mul_le {n : ℕ}
    (N : UnitarilyInvariantSeminorm ℂ (EuclideanSpace ℂ (Fin n)) (EuclideanSpace ℂ (Fin n)))
    {A B : Mat n} (hA : A.PosSemidef) (hB : B.PosSemidef) :
    4 * N.mat (A * B) ≤ N.mat ((A + B) ^ 2) := sorry

/-! ## Names cited by the README -/

#check @Matrix.le_iff
#check @Matrix.IsHermitian.cfc_eq
#check @Matrix.IsHermitian.eigenvectorUnitary
#check @Matrix.IsHermitian.eigenvalues
#check @Matrix.PosSemidef.hadamard
#check @Matrix.PosSemidef.kronecker
#check @Matrix.nonneg_iff_posSemidef
#check @Matrix.isStrictlyPositive_iff_posDef
#check @Matrix.charpoly_mul_comm
#check @Matrix.toEuclideanLin
#check @Matrix.fromBlocks
#check @LinearMap.singularValues
#check @CFC.monotone_rpow
#check @CFC.rpow_le_rpow
#check @CFC.concaveOn_rpow
#check @CFC.sqrt_le_sqrt
#check @CFC.log_monotoneOn
#check @CFC.concaveOn_log
#check @CFC.conjSqrt
#check @CStarAlgebra.inv_le_inv
#check @CStarAlgebra.convexOn_ringInverse
#check @Real.rpowIntegrand₀₁
#check @Real.exists_measure_rpow_eq_integral_rpowIntegrand₀₁
#check @cfc_integral
#check @cfc_comp
#check @closure_convexHull_extremePoints
#check @CStarMatrix
#check @TauCeti.geometricMean
#check @TauCeti.geometricMean_comm
#check @TauCeti.geometricMean_mul_ringInverse_mul_geometricMean
#check @TauCeti.eq_geometricMean_of_mul_ringInverse_mul
#check @TauCeti.geometricMean_add_geometricMean_le
#check @Matrix.PosDef.existsUnique_posSemidef_mul_mul
#check @Matrix.isHermitian_geometricMean
#check @TauCeti.nevanlinnaKernel
#check @TauCeti.exists_isFiniteMeasure_eq_nevanlinnaKernel_add
#check @TauCeti.exists_isFiniteMeasure_eq_nevanlinnaKernel_add_of_im_eq_zero
#check @TauCeti.measure_Icc_eq_zero_of_eq_nevanlinnaKernel_add

end TauCetiRoadmap.OperatorMonotoneFunctionsAndMatrixMeans

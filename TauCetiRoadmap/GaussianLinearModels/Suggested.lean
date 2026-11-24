import Mathlib
import TauCeti.Probability.Distributions.NoncentralT.Basic

/-!
# Gaussian linear models: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here. The README's remaining targets, API lists and Checks are
not restated.

The conventions of the README are used throughout: `E` is the parameter space and `F` the
observation space, both finite-dimensional real inner product spaces; a design is a linear map
`X : E →ₗ[ℝ] F`, of any rank; the orthogonal projection onto a subspace `K` is Mathlib's
`K.starProjection`; second-order noise is `IsCenteredWithCovariance`; Gaussian noise is `σ • Z`
with `Z` of law `stdGaussian F` and `σ ≠ 0`; and the chi-squared, noncentral chi-squared,
noncentral `t` and noncentral `F` laws are Tau Ceti's `chiSquaredMeasure`,
`noncentralChiSquaredMeasure`, `noncentralTMeasure` and `noncentralFMeasure`.
-/

noncomputable section

open MeasureTheory ProbabilityTheory Module
open scoped RealInnerProductSpace NNReal

namespace TauCetiRoadmap.GaussianLinearModels

/-! ## Layer 1: least squares -/

section LeastSquares

variable {E F G : Type*}
  [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
  [NormedAddCommGroup F] [InnerProductSpace ℝ F] [FiniteDimensional ℝ F]
  [NormedAddCommGroup G] [InnerProductSpace ℝ G] [FiniteDimensional ℝ G]

/-- 1.1: `b` is a least-squares solution for the design `X` and the observation `y`: it
minimizes the residual norm `‖y - X b‖` over the parameter space. -/
def IsLeastSquares (X : E →ₗ[ℝ] F) (y : F) (b : E) : Prop :=
  ∀ b' : E, ‖y - X b‖ ≤ ‖y - X b'‖

/-- 1.1: the normal equations. For a design of any rank, `b` is a least-squares solution exactly
when `X† (X b) = X† y`. -/
theorem isLeastSquares_iff_adjoint_apply (X : E →ₗ[ℝ] F) (y : F) (b : E) :
    IsLeastSquares X y b ↔ X.adjoint (X b) = X.adjoint y := by
  sorry

/-- 1.3: estimable functionals. For a design of any rank and any observation `y`, the functional
`⟪c, ·⟫` takes one value on all least-squares solutions exactly when `c` lies in the range of the
adjoint of the design. -/
theorem mem_range_adjoint_iff_forall_isLeastSquares (X : E →ₗ[ℝ] F) (y : F) (c : E) :
    c ∈ LinearMap.range X.adjoint ↔
      ∀ b b' : E, IsLeastSquares X y b → IsLeastSquares X y b' → ⟪c, b⟫ = ⟪c, b'⟫ := by
  sorry

/-- 1.4: least squares under the linear constraint `C b = d`, in multiplier form. If `bh` is a
least-squares solution and `u`, `w` solve `X† (X u) = C† w` and `C u = C bh - d`, then the least
constrained residual sum of squares is the unconstrained one plus `⟪w, C bh - d⟫`. No rank
assumption is made on `X` or `C`. -/
theorem isLeast_image_sq_norm_sub_of_adjoint_apply_eq (X : E →ₗ[ℝ] F) (C : E →ₗ[ℝ] G) (d : G)
    (y : F) {bh u : E} {w : G} (hbh : IsLeastSquares X y bh)
    (hu : X.adjoint (X u) = C.adjoint w) (hw : C u = C bh - d) :
    IsLeast ((fun b : E ↦ ‖y - X b‖ ^ 2) '' {b | C b = d})
      (‖y - X bh‖ ^ 2 + ⟪w, C bh - d⟫) := by
  sorry

end LeastSquares

/-! ## Layer 2: second-order theory -/

section SecondOrder

variable {F : Type*} [NormedAddCommGroup F] [InnerProductSpace ℝ F] [FiniteDimensional ℝ F]
  {Ω : Type*} [MeasurableSpace Ω]

/-- 2.1: the random vector `ε` is square integrable, has mean zero, and has covariance operator
`S`: `E ⟪u, ε⟫ = 0` and `E ⟪u, ε⟫ ⟪v, ε⟫ = ⟪u, S v⟫` for all `u`, `v`. White noise of variance
`σ²` is the case `S = σ ^ 2 • LinearMap.id`. -/
structure IsCenteredWithCovariance (ε : Ω → F) (S : F →ₗ[ℝ] F) (P : Measure Ω) : Prop where
  memLp : MemLp ε 2 P
  integral_inner : ∀ u : F, ∫ ω, ⟪u, ε ω⟫ ∂P = 0
  integral_inner_mul_inner : ∀ u v : F, ∫ ω, ⟪u, ε ω⟫ * ⟪v, ε ω⟫ ∂P = ⟪u, S v⟫

variable {P : Measure Ω} [IsProbabilityMeasure P] {ε : Ω → F}

/-- 2.2: the mean of a quadratic form. For noise with covariance operator `S`, a mean `μ` and
any linear `A`, `E ⟪Y, A Y⟫ = tr (A S) + ⟪μ, A μ⟫` with `Y = μ + ε`. -/
theorem integral_inner_apply_add {S : F →ₗ[ℝ] F} (hε : IsCenteredWithCovariance ε S P)
    (A : F →ₗ[ℝ] F) (μ : F) :
    ∫ ω, ⟪μ + ε ω, A (μ + ε ω)⟫ ∂P = LinearMap.trace ℝ F (A ∘ₗ S) + ⟪μ, A μ⟫ := by
  sorry

/-- 2.3: the Gauss–Markov theorem with its equality case. For white noise of variance `σ²` and a
subspace `L`, every `b` with `b - a ∈ Lᗮ` (a linear estimator `⟪b, Y⟫` unbiased for `⟪a, μ⟫` on
`L`) satisfies `Var ⟪b, Y⟫ = Var ⟪P_L a, Y⟫ + σ² ‖b - P_L a‖²`. -/
theorem variance_inner_eq_variance_inner_starProjection_add {σ : ℝ}
    (hε : IsCenteredWithCovariance ε (σ ^ 2 • LinearMap.id) P) (L : Submodule ℝ F) {a b : F}
    (hb : b - a ∈ Lᗮ) (μ : F) :
    Var[fun ω ↦ ⟪b, μ + ε ω⟫; P] =
      Var[fun ω ↦ ⟪L.starProjection a, μ + ε ω⟫; P] + σ ^ 2 * ‖b - L.starProjection a‖ ^ 2 := by
  sorry

/-- 2.4: Aitken's theorem. For noise with any covariance operator `S` there is a coefficient
vector `b₀`, unbiased for `⟪a, μ⟫` on `L` and with `S b₀ ∈ L`, such that every unbiased `b` has
`Var ⟪b, Y⟫ = Var ⟪b₀, Y⟫ + ⟪b - b₀, S (b - b₀)⟫`. -/
theorem exists_forall_variance_inner_eq_add {S : F →ₗ[ℝ] F}
    (hε : IsCenteredWithCovariance ε S P) (L : Submodule ℝ F) (a μ : F) :
    ∃ b₀ : F, b₀ - a ∈ Lᗮ ∧ S b₀ ∈ L ∧ ∀ b : F, b - a ∈ Lᗮ →
      Var[fun ω ↦ ⟪b, μ + ε ω⟫; P] =
        Var[fun ω ↦ ⟪b₀, μ + ε ω⟫; P] + ⟪b - b₀, S (b - b₀)⟫ := by
  sorry

end SecondOrder

/-! ## Layer 3: exact Gaussian theory -/

section Gaussian

/-- 3.1: Cochran's theorem, algebraic form. For endomorphisms `A i` of a finite-dimensional
vector space over a field of characteristic zero that sum to the identity, the following are
equivalent: every `A i` is idempotent; `A i * A j = 0` for `i ≠ j`; the ranks add up to the
dimension. -/
theorem tfae_isIdempotentElem_of_sum_eq_one {K V ι : Type*} [Field K] [CharZero K]
    [AddCommGroup V] [Module K V] [FiniteDimensional K V] [Fintype ι]
    (A : ι → Module.End K V) (hA : ∑ i, A i = 1) :
    List.TFAE [∀ i, IsIdempotentElem (A i),
      ∀ i j, i ≠ j → A i * A j = 0,
      ∑ i, finrank K (LinearMap.range (A i)) = finrank K V] := by
  sorry

variable {F : Type*} [NormedAddCommGroup F] [InnerProductSpace ℝ F] [FiniteDimensional ℝ F]
  [MeasurableSpace F] [BorelSpace F]
  {Ω : Type*} [MeasurableSpace Ω] {P : Measure Ω} {Z : Ω → F}

/-- 3.2: Cochran's theorem with a mean. For a standard Gaussian `Z`, a vector `v` and pairwise
orthogonal subspaces `K i`, the squared lengths `‖P_{K i} (v + Z)‖²` are independent, and the
`i`-th has the noncentral chi-squared law with `dim K i` degrees of freedom and noncentrality
`‖P_{K i} v‖²`. The subspaces need not span. -/
theorem hasLaw_pi_norm_sq_starProjection_add_stdGaussian (hZ : HasLaw Z (stdGaussian F) P)
    {ι : Type*} [Fintype ι] (K : ι → Submodule ℝ F) (hK : Pairwise fun i j ↦ K i ⟂ K j)
    (v : F) :
    HasLaw (fun ω i ↦ ‖(K i).starProjection (v + Z ω)‖ ^ 2)
      (Measure.pi fun i ↦ TauCeti.Probability.noncentralChiSquaredMeasure (finrank ℝ (K i))
        (‖(K i).starProjection v‖₊ ^ 2)) P := by
  sorry

/-- 3.3: a quadratic form `⟪Z, A Z⟫` in a standard Gaussian vector, with `A` symmetric, has the
chi-squared law with `r` degrees of freedom exactly when `A` is idempotent of rank `r`. -/
theorem hasLaw_inner_apply_chiSquared_iff (hZ : HasLaw Z (stdGaussian F) P) {A : F →ₗ[ℝ] F}
    (hA : A.IsSymmetric) (r : ℕ) :
    HasLaw (fun ω ↦ ⟪Z ω, A (Z ω)⟫) (TauCeti.Probability.chiSquaredMeasure r) P ↔
      IsIdempotentElem A ∧ finrank ℝ (LinearMap.range A) = r := by
  sorry

/-- 3.5: the studentized linear functional. Let `Y = μ + σ • Z` with `σ ≠ 0`, let `M` be a
subspace of positive dimension `ν` orthogonal to the mean `μ`, and let `a ≠ 0` be orthogonal to
`M`. Then `(⟪a, Y⟫ - t₀) / (‖a‖ √(‖P_M Y‖² / ν))` has the noncentral `t` law with `ν` degrees
of freedom and noncentrality `(⟪a, μ⟫ - t₀) / (|σ| ‖a‖)`. -/
theorem hasLaw_noncentralT_studentized (hZ : HasLaw Z (stdGaussian F) P) {σ : ℝ} (hσ : σ ≠ 0)
    (M : Submodule ℝ F) (hM : 0 < finrank ℝ M) {μ a : F} (hμ : μ ∈ Mᗮ) (ha : a ∈ Mᗮ)
    (ha0 : a ≠ 0) (t₀ : ℝ) :
    HasLaw
      (fun ω ↦ (⟪a, μ + σ • Z ω⟫ - t₀) /
        (‖a‖ * √(‖M.starProjection (μ + σ • Z ω)‖ ^ 2 / finrank ℝ M)))
      (TauCeti.Probability.noncentralTMeasure (finrank ℝ M) ((⟪a, μ⟫ - t₀) / (|σ| * ‖a‖)))
      P := by
  sorry

/-- 3.6: the variance ratio. Let `Y = μ + σ • Z` with `σ ≠ 0`, let `K` and `M` be orthogonal
subspaces of positive dimensions `k` and `ν` with `μ` orthogonal to `M`, and let `m₀` be any
vector. Then `(‖P_K (Y - m₀)‖² / k) / (‖P_M Y‖² / ν)` has the noncentral `F` law with degrees
`k` and `ν` and noncentrality `‖P_K (μ - m₀)‖² / σ²`. -/
theorem hasLaw_noncentralF_variance_ratio (hZ : HasLaw Z (stdGaussian F) P) {σ : ℝ}
    (hσ : σ ≠ 0) (K M : Submodule ℝ F) (hKM : K ⟂ M) (hK : 0 < finrank ℝ K)
    (hM : 0 < finrank ℝ M) {μ : F} (hμ : μ ∈ Mᗮ) (m₀ : F) :
    HasLaw
      (fun ω ↦ ‖K.starProjection (μ + σ • Z ω - m₀)‖ ^ 2 / finrank ℝ K /
        (‖M.starProjection (μ + σ • Z ω)‖ ^ 2 / finrank ℝ M))
      (TauCeti.Probability.noncentralFMeasure (finrank ℝ K) (finrank ℝ M)
        ((‖K.starProjection (μ - m₀)‖₊ / ‖σ‖₊) ^ 2)) P := by
  sorry

/-- 3.7: the Gaussian likelihood of mean `m` and variance `v` at the observation `y`, the
density `(2πv)^(-n/2) exp (-‖y - m‖² / (2v))` with `n = dim F`. -/
def gaussianLikelihood (m : F) (v : ℝ) (y : F) : ℝ :=
  (2 * Real.pi * v) ^ (-(finrank ℝ F : ℝ) / 2) * Real.exp (-‖y - m‖ ^ 2 / (2 * v))

/-- 3.7: for `σ ≠ 0`, the observation `μ + σ • Z` has density `gaussianLikelihood μ (σ ^ 2)`
with respect to the volume of `F`. -/
theorem hasLaw_add_smul_stdGaussian_withDensity (hZ : HasLaw Z (stdGaussian F) P) {σ : ℝ}
    (hσ : σ ≠ 0) (μ : F) :
    HasLaw (fun ω ↦ μ + σ • Z ω)
      (volume.withDensity fun y ↦ ENNReal.ofReal (gaussianLikelihood μ (σ ^ 2) y)) P := by
  sorry

omit [MeasurableSpace F] [BorelSpace F] in
/-- 3.7: maximum likelihood. For an observation `y` outside the subspace `L`, the likelihood is
maximal over means in `L` and positive variances at the fitted value `P_L y` and the variance
`‖y - P_L y‖² / n`. -/
theorem isMaxOn_gaussianLikelihood (L : Submodule ℝ F) {y : F} (hy : y ∉ L) :
    IsMaxOn (fun p : F × ℝ ↦ gaussianLikelihood p.1 p.2 y) {p | p.1 ∈ L ∧ 0 < p.2}
      (L.starProjection y, ‖y - L.starProjection y‖ ^ 2 / finrank ℝ F) := by
  sorry

end Gaussian

/-! ## Layer 4: classical layouts -/

section Layouts

variable {ι G : Type*} [Fintype ι] [DecidableEq G]

/-- 4.1: the mean of the observations `y` in group `j` of the one-way layout `g`. -/
def groupMean (g : ι → G) (y : ι → ℝ) (j : G) : ℝ :=
  (∑ i with g i = j, y i) / (Finset.univ.filter fun i ↦ g i = j).card

/-- 4.1: the within-group sum of squares `∑ᵢ (yᵢ - ȳ_{g i})²`. -/
def withinSS (g : ι → G) (y : ι → ℝ) : ℝ :=
  ∑ i, (y i - groupMean g y (g i)) ^ 2

/-- 4.1: the between-group sum of squares `∑ᵢ (ȳ_{g i} - ȳ)²`, with `ȳ` the grand mean. -/
def betweenSS (g : ι → G) (y : ι → ℝ) : ℝ :=
  ∑ i, (groupMean g y (g i) - (∑ l, y l) / Fintype.card ι) ^ 2

/-- 4.1: one-way analysis of variance. For observations `yᵢ = m (g i) + σ Zᵢ` with `σ ≠ 0`, at
least two nonempty groups and more observations than nonempty groups `k`, the ratio
`(betweenSS / (k - 1)) / (withinSS / (n - k))` has the noncentral `F` law with degrees `k - 1`
and `n - k` and noncentrality `betweenSS` of the mean vector divided by `σ²`. Group sizes are
arbitrary and empty groups are allowed. -/
theorem hasLaw_noncentralF_oneWay {Ω : Type*} [MeasurableSpace Ω] {P : Measure Ω}
    {Z : Ω → EuclideanSpace ℝ ι} (hZ : HasLaw Z (stdGaussian (EuclideanSpace ℝ ι)) P)
    (g : ι → G) (m : G → ℝ) {σ : ℝ} (hσ : σ ≠ 0)
    (hk : 2 ≤ (Finset.univ.image g).card) (hn : (Finset.univ.image g).card < Fintype.card ι) :
    HasLaw
      (fun ω ↦ betweenSS g (fun i ↦ m (g i) + σ * Z ω i) / ((Finset.univ.image g).card - 1 : ℝ) /
        (withinSS g (fun i ↦ m (g i) + σ * Z ω i) /
          (Fintype.card ι - (Finset.univ.image g).card : ℝ)))
      (TauCeti.Probability.noncentralFMeasure ((Finset.univ.image g).card - 1 : ℝ)
        (Fintype.card ι - (Finset.univ.image g).card : ℝ)
        (Real.toNNReal (betweenSS g (fun i ↦ m (g i)) / σ ^ 2))) P := by
  sorry

end Layouts

end TauCetiRoadmap.GaussianLinearModels

module

public import Mathlib
public import TauCeti.Analysis.Matrix.HoffmanWielandt
public import TauCeti.Analysis.OperatorIdeal.ApproximationNumber.EckartYoung
public import TauCeti.Analysis.InnerProductSpace.SingularValues
public import TauCeti.Analysis.InnerProductSpace.MoorePenrose
public import TauCeti.Probability.Distributions.Chi.Moments
public import TauCeti.Probability.Distributions.Chi.Gaussian
public import TauCeti.Probability.Distributions.Wishart.Inverse.Moments

/-!
# Low-rank, randomized and tensor approximation: suggested target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
This file states the headlines of `README.md` that carry a Lean name, each with every conclusion
the README attaches to it, against the pinned Mathlib and Tau Ceti, with `sorry` proofs and the
definitions they need. These are suggested forms; the README's other headlines are targets of the
same standing, stated in prose.

Conventions (README, Conventions). Matrices are `Matrix (Fin m) (Fin n) 𝕜` over an `RCLike`
field `𝕜`, acting on `EuclideanSpace 𝕜 (Fin n)` through `Matrix.toEuclideanLin`. Indices are
zero-based: the singular values of `A` are Mathlib's `LinearMap.singularValues` of
`Matrix.toEuclideanLin A`, decreasing from index `0` and zero beyond the rank, so the sources'
`σ_{k+1}` is index `k` here. The spectral norm is Mathlib's scoped `Matrix.Norms.L2Operator`
instance, opened where it is used; the Frobenius norm is the explicit `frobNorm`, equal to the
scoped Frobenius norm (`frobNorm_eq_norm`), so that statements mixing the two norms need one
instance only. Gaussian matrices are `toMatrix x` for `x` drawn from `stdGaussian` on
`EuclideanSpace ℝ (Fin m × Fin n)`, as in GaussianComparisonInequalities. Tensors are arrays
`(∀ p, Fin (n p)) → 𝕜` with Mathlib's product topology; squared Frobenius distances of tensors are
the explicit `sqDist`.

Definitions owned by other roadmaps appear as verbatim local copies with docstrings naming their
owners: `CoordTensor` and `tensorRank` (AsymptoticSpectra 3.1), `IsBorderDecomp` and
`borderRank` (BilinearComplexityAndBorderRank 2.1), `toMatrix` (GaussianComparisonInequalities
5.0) and `IsSubspaceEmbedding` (RandomProjectionsAndSketching 5.1).

Proved declarations are Checks, not targets: `frobNorm_eq_norm` and `gaussianWidth_def`. The
`#check` lines at the top of the namespace pin the Tau Ceti and Mathlib names the README consumes:
Tau Ceti's Eckart–Young identification, Hoffman–Wielandt inequality, compact SVD and singular
vectors, Moore–Penrose inverse, chi law and inverse Wishart mean.
-/

@[expose] public section

noncomputable section

open Matrix MeasureTheory ProbabilityTheory Filter Topology
open scoped NNReal ENNReal RealInnerProductSpace ContDiff

namespace TauCetiRoadmap.LowRankRandomizedAndTensorApproximation

#check @ContinuousLinearMap.singularValue_eq_linearMap_singularValues
#check @Matrix.sum_sq_singularValues_toEuclideanLin_sub_le_frobenius_norm_sub_sq
#check @LinearMap.leftSingularVector
#check @LinearMap.rightSingularBasis
#check @LinearMap.exists_orthonormal_eq_sum_singularValues_smul_rankOne
#check @LinearMap.norm_toContinuousLinearMap_eq_singularValues_zero
#check @Submodule.starProjection
#check @Matrix.rank
#check @LinearMap.moorePenroseInverse
#check @TauCeti.Probability.integral_id_chiMeasure
#check @TauCeti.Probability.stdGaussian_map_norm
#check @TauCeti.Probability.integral_id_inverseWishartMeasure

/-! ## Local copies of definitions owned elsewhere -/

/-- Copied verbatim from GaussianComparisonInequalities 5.0: the `m × n` matrix whose `(i, j)`
entry is the coordinate `(i, j)` of a vector of `EuclideanSpace ℝ (Fin m × Fin n)`; under
`stdGaussian` it has independent standard Gaussian entries. -/
def toMatrix {m n : ℕ} (x : EuclideanSpace ℝ (Fin m × Fin n)) : Matrix (Fin m) (Fin n) ℝ :=
  Matrix.of fun i j => x (i, j)

/-- Copied verbatim from RandomProjectionsAndSketching 5.1: `S` is an `ε`-subspace embedding
for `V` when it distorts every squared norm on `V` by a factor in `[1 - ε, 1 + ε]`. -/
def IsSubspaceEmbedding {k n : ℕ} (S : Matrix (Fin k) (Fin n) ℝ) (V : Submodule ℝ (Fin n → ℝ))
    (ε : ℝ) : Prop :=
  ∀ y ∈ V, (1 - ε) * (y ⬝ᵥ y) ≤ (S *ᵥ y) ⬝ᵥ (S *ᵥ y) ∧ (S *ᵥ y) ⬝ᵥ (S *ᵥ y) ≤ (1 + ε) * (y ⬝ᵥ y)

/-- Copied verbatim from AsymptoticSpectra 3.1: a coordinate tensor over `F` with parties `ι`,
a format `dim` and the array of coordinates. -/
structure CoordTensor (F : Type*) (ι : Type*) where
  /-- The dimension of the space of each party. -/
  dim : ι → ℕ
  /-- The coordinates. -/
  coeff : (∀ p, Fin (dim p)) → F

section Tensors

variable {F : Type*} [Field F] {ι : Type*} [Fintype ι] [DecidableEq ι]

/-- Copied verbatim from AsymptoticSpectra 3.1: tensor rank (CP rank), the least number of
columns of factor matrices whose column products sum to the tensor. -/
def tensorRank (t : CoordTensor F ι) : ℕ :=
  sInf {r : ℕ | ∃ A : ∀ p, Matrix (Fin (t.dim p)) (Fin r) F,
    t.coeff = fun x => ∑ i, ∏ p, A p (x p) i}

end Tensors

section Border

open Polynomial

variable (F : Type*) [Field F]

/-- Copied verbatim from BilinearComplexityAndBorderRank 2.1: an approximate decomposition of
degree `h` with `r` terms, by factor matrices with entries in `F[X]`. -/
def IsBorderDecomp {ι : Type*} [Fintype ι] (t : CoordTensor F ι) (h r : ℕ) : Prop :=
  ∃ A : ∀ p, Matrix (Fin (t.dim p)) (Fin r) F[X], ∀ x,
    (∑ i, ∏ p, A p (x p) i).coeff h = t.coeff x ∧ ∀ j < h, (∑ i, ∏ p, A p (x p) i).coeff j = 0

/-- Copied verbatim from BilinearComplexityAndBorderRank 2.1: the (algebraic) border rank. -/
def borderRank {ι : Type*} [Fintype ι] (t : CoordTensor F ι) : ℕ :=
  sInf {r : ℕ | ∃ h, IsBorderDecomp F t h r}

end Border

/-! ## Layer 1: best low-rank approximation of matrices -/

section Layer1

variable {𝕜 : Type*} [RCLike 𝕜]

/-- The Frobenius norm, written out so that statements mixing it with the spectral norm need
only the spectral instance. -/
def frobNorm {m n : Type*} [Fintype m] [Fintype n] (A : Matrix m n 𝕜) : ℝ :=
  √(∑ i, ∑ j, ‖A i j‖ ^ 2)

/-- Check: `frobNorm` is Mathlib's scoped Frobenius norm. -/
theorem frobNorm_eq_norm {m n : Type*} [Fintype m] [Fintype n] (A : Matrix m n 𝕜) :
    frobNorm A = @Norm.norm _ Matrix.frobeniusNormedAddCommGroup.toNorm A := by
  rw [frobNorm, Matrix.frobenius_norm_def, Real.sqrt_eq_rpow]
  simp only [Real.rpow_two]

/-- The squared tail `∑_{i ≥ k} σᵢ²` of the singular values of `A`, zero-based. The singular
values vanish from the number of columns on, so the sum is the full tail. -/
def tailSq {m n : Type*} [Fintype m] [Fintype n] [DecidableEq n] (A : Matrix m n 𝕜) (k : ℕ) :
    ℝ :=
  ∑ i ∈ Finset.Ico k (Fintype.card n), (toEuclideanLin A).singularValues i ^ 2

/-- 1.1 The truncated singular value expansion `∑_{i < k} σᵢ uᵢ vᵢᴴ`, built from Tau Ceti's
right singular basis and left singular vectors of `toEuclideanLin A`. -/
def truncSVD {m n : ℕ} (A : Matrix (Fin m) (Fin n) 𝕜) (k : ℕ) : Matrix (Fin m) (Fin n) 𝕜 :=
  Matrix.of fun a b ↦
    ∑ i ∈ Finset.univ.filter fun i : Fin (Module.finrank 𝕜 (EuclideanSpace 𝕜 (Fin n))) ↦
        (i : ℕ) < k,
      (((toEuclideanLin A).singularValues (i : ℕ) : ℝ) : 𝕜) *
        (toEuclideanLin A).leftSingularVector i a *
          star ((toEuclideanLin A).rightSingularBasis i b)

section L2

open scoped Matrix.Norms.L2Operator

/-- 1.1 The truncated expansion has rank at most `k`, spectral error `σ_k` and squared Frobenius
error the tail `∑_{i ≥ k} σᵢ²`. -/
theorem truncSVD_spec {m n : ℕ} (A : Matrix (Fin m) (Fin n) 𝕜) (k : ℕ) :
    (truncSVD A k).rank ≤ k ∧
      ‖A - truncSVD A k‖ = (toEuclideanLin A).singularValues k ∧
      frobNorm (A - truncSVD A k) ^ 2 = tailSq A k := by
  sorry

/-- 1.2 Eckart–Young in the spectral norm, for matrices: `σ_k` is the least spectral distance
from `A` to a matrix of rank at most `k`. -/
theorem isLeast_rankApproximation_l2 {m n : ℕ} (A : Matrix (Fin m) (Fin n) 𝕜) (k : ℕ) :
    IsLeast {t : ℝ | ∃ B : Matrix (Fin m) (Fin n) 𝕜, B.rank ≤ k ∧ t = ‖A - B‖}
      ((toEuclideanLin A).singularValues k) := by
  sorry

end L2

/-- 1.3 Eckart–Young–Mirsky in the Frobenius norm: the tail `∑_{i ≥ k} σᵢ²` is the least squared
Frobenius distance from `A` to a matrix of rank at most `k`. -/
theorem isLeast_rankApproximation_frobenius_sq {m n : ℕ} (A : Matrix (Fin m) (Fin n) 𝕜)
    (k : ℕ) :
    IsLeast {t : ℝ | ∃ B : Matrix (Fin m) (Fin n) 𝕜, B.rank ≤ k ∧ t = frobNorm (A - B) ^ 2}
      (tailSq A k) := by
  sorry

end Layer1

/-! ## Layer 2: the randomized range finder -/

section Layer2

variable {𝕜 : Type*} [RCLike 𝕜]

/-- 2.1 The orthogonal projector onto the range of `Y`, as a matrix. -/
def rangeProj {m l : ℕ} (Y : Matrix (Fin m) (Fin l) 𝕜) : Matrix (Fin m) (Fin m) 𝕜 :=
  Matrix.toEuclideanLin.symm
    ((LinearMap.range (Matrix.toEuclideanLin Y)).starProjection : _ →ₗ[𝕜] _)

/-- 2.3 The Moore–Penrose inverse of a matrix, from Tau Ceti's `LinearMap.moorePenroseInverse`. -/
def pinv {k l : ℕ} (A : Matrix (Fin k) (Fin l) 𝕜) : Matrix (Fin l) (Fin k) 𝕜 :=
  Matrix.toEuclideanLin.symm (Matrix.toEuclideanLin A).moorePenroseInverse

section L2

open scoped Matrix.Norms.L2Operator

/-- 2.1 The deterministic range-finder bound in the spectral norm, squared form: for a test
matrix `Ω` and any `R` with `A_k Ω R = A_k`, where `A_k = truncSVD A k`,
`‖A - P A‖² ≤ ‖A - A_k‖² + ‖(A - A_k) Ω R‖²` for the projector `P` onto the range of `A Ω`. -/
theorem rangeFinder_error_le {m n l : ℕ} (A : Matrix (Fin m) (Fin n) 𝕜) (k : ℕ)
    (Ω : Matrix (Fin n) (Fin l) 𝕜) (R : Matrix (Fin l) (Fin n) 𝕜)
    (hR : truncSVD A k * Ω * R = truncSVD A k) :
    ‖A - rangeProj (A * Ω) * A‖ ^ 2 ≤
      ‖A - truncSVD A k‖ ^ 2 + ‖(A - truncSVD A k) * Ω * R‖ ^ 2 := by
  sorry

/-- 2.2 Chevet's inequality for a standard Gaussian matrix `G`:
`E ‖S G T‖ ≤ ‖S‖ ‖T‖_F + ‖S‖_F ‖T‖`. -/
theorem integral_opNorm_mul_toMatrix_mul_le {p q m n : ℕ} (S : Matrix (Fin p) (Fin m) ℝ)
    (T : Matrix (Fin n) (Fin q) ℝ) :
    ∫ x, ‖S * toMatrix x * T‖ ∂stdGaussian (EuclideanSpace ℝ (Fin m × Fin n)) ≤
      ‖S‖ * frobNorm T + frobNorm S * ‖T‖ := by
  sorry

/-- 2.3 For a standard Gaussian `k × l` matrix `Γ` with `k + 2 ≤ l`, `‖Γ†‖` is integrable and
`E ‖Γ†‖ ≤ √(k / (l - k - 1))`. -/
theorem integral_opNorm_pinv_toMatrix_le {k l : ℕ} (hkl : k + 2 ≤ l) :
    Integrable (fun x ↦ ‖pinv (toMatrix x)‖) (stdGaussian (EuclideanSpace ℝ (Fin k × Fin l))) ∧
      ∫ x, ‖pinv (toMatrix x)‖ ∂stdGaussian (EuclideanSpace ℝ (Fin k × Fin l)) ≤
        √(k / ((l : ℝ) - k - 1)) := by
  sorry

/-- 2.4 The Gaussian range finder in the spectral norm: for `k + 2 ≤ l`,
`E ‖A - P A‖ ≤ (1 + √(k/(l-k-1))) σ_k + E ‖Γ†‖ · (∑_{i ≥ k} σᵢ²)^{1/2}`, where `P` projects onto
the range of `A Ω` for a standard Gaussian `n × l` test matrix `Ω` and `Γ` is a standard
Gaussian `k × l` matrix. -/
theorem rangeFinder_expected_l2_le {m n l : ℕ} (A : Matrix (Fin m) (Fin n) ℝ) (k : ℕ)
    (hkl : k + 2 ≤ l) :
    ∫ x, ‖A - rangeProj (A * toMatrix x) * A‖ ∂stdGaussian (EuclideanSpace ℝ (Fin n × Fin l)) ≤
      (1 + √(k / ((l : ℝ) - k - 1))) * (toEuclideanLin A).singularValues k +
        (∫ y, ‖pinv (toMatrix y)‖ ∂stdGaussian (EuclideanSpace ℝ (Fin k × Fin l))) *
          √(tailSq A k) := by
  sorry

end L2

/-- 2.1 The deterministic range-finder bound in the Frobenius norm, squared form, under the
hypothesis of `rangeFinder_error_le`. -/
theorem rangeFinder_error_le_frobenius {m n l : ℕ} (A : Matrix (Fin m) (Fin n) 𝕜) (k : ℕ)
    (Ω : Matrix (Fin n) (Fin l) 𝕜) (R : Matrix (Fin l) (Fin n) 𝕜)
    (hR : truncSVD A k * Ω * R = truncSVD A k) :
    frobNorm (A - rangeProj (A * Ω) * A) ^ 2 ≤
      tailSq A k + frobNorm ((A - truncSVD A k) * Ω * R) ^ 2 := by
  sorry

/-- 2.3 For a standard Gaussian `k × l` matrix `Γ` with `k + 2 ≤ l`,
`E ‖Γ†‖_F² = k / (l - k - 1)`, as a lower Lebesgue integral. -/
theorem lintegral_frobNorm_sq_pinv_toMatrix {k l : ℕ} (hkl : k + 2 ≤ l) :
    ∫⁻ x, ENNReal.ofReal (frobNorm (pinv (toMatrix x)) ^ 2)
        ∂stdGaussian (EuclideanSpace ℝ (Fin k × Fin l)) =
      ENNReal.ofReal (k / ((l : ℝ) - k - 1)) := by
  sorry

/-- 2.4 The Gaussian range finder in the Frobenius norm: for `k + 2 ≤ l`,
`E ‖A - P A‖_F² ≤ (1 + k/(l-k-1)) ∑_{i ≥ k} σᵢ²`. -/
theorem rangeFinder_expected_frobenius_sq_le {m n l : ℕ} (A : Matrix (Fin m) (Fin n) ℝ)
    (k : ℕ) (hkl : k + 2 ≤ l) :
    ∫ x, frobNorm (A - rangeProj (A * toMatrix x) * A) ^ 2
        ∂stdGaussian (EuclideanSpace ℝ (Fin n × Fin l)) ≤
      (1 + k / ((l : ℝ) - k - 1)) * tailSq A k := by
  sorry

end Layer2

/-! ## Layer 3: Gaussian widths and Gaussian embeddings -/

section Layer3

/-- 3.1 The Gaussian width `w(K) = E sup_{u ∈ K} ⟪g, u⟫` of a set `K` of `ℝⁿ`, with a supremum
over the subtype. Statements use it for nonempty `K` in the unit sphere or ball, where the
supremum is bounded; for empty `K` the value is `0`. -/
def gaussianWidth {n : ℕ} (K : Set (EuclideanSpace ℝ (Fin n))) : ℝ :=
  ∫ g, ⨆ u : K, ⟪g, (u : EuclideanSpace ℝ (Fin n))⟫ ∂stdGaussian (EuclideanSpace ℝ (Fin n))

/-- Check: `gaussianWidth` is the expression written inline in GaussianComparisonInequalities
5.2. -/
theorem gaussianWidth_def {n : ℕ} (K : Set (EuclideanSpace ℝ (Fin n))) :
    gaussianWidth K =
      ∫ g, ⨆ u : K, ⟪g, (u : EuclideanSpace ℝ (Fin n))⟫ ∂stdGaussian (EuclideanSpace ℝ (Fin n)) :=
  rfl

/-- 3.1 The mean of the chi law with `k ≥ 1` degrees of freedom lies strictly between `√(k-1)`
and `√k`. -/
theorem integral_norm_stdGaussian_mem_Ioo {k : ℕ} (hk : 1 ≤ k) :
    √((k : ℝ) - 1) < ∫ g, ‖g‖ ∂stdGaussian (EuclideanSpace ℝ (Fin k)) ∧
      ∫ g, ‖g‖ ∂stdGaussian (EuclideanSpace ℝ (Fin k)) < √(k : ℝ) := by
  sorry

/-- 3.1 The Gaussian width of the unit sphere of a subspace `L` of dimension `k ≥ 1` is the mean
of the chi law with `k` degrees of freedom. -/
theorem gaussianWidth_inter_sphere {n : ℕ} (L : Submodule ℝ (EuclideanSpace ℝ (Fin n)))
    (hL : 0 < Module.finrank ℝ L) :
    gaussianWidth ((L : Set (EuclideanSpace ℝ (Fin n))) ∩ Metric.sphere 0 1) =
      ∫ g, ‖g‖ ∂stdGaussian (EuclideanSpace ℝ (Fin (Module.finrank ℝ L))) := by
  sorry

/-- 3.1 The Gaussian width of a nonempty finite set in the unit ball is at most `√(2 log #K)`. -/
theorem gaussianWidth_le_sqrt_two_log_card {n : ℕ} (K : Finset (EuclideanSpace ℝ (Fin n)))
    (hK : K.Nonempty) (hK₁ : ∀ u ∈ K, ‖u‖ ≤ 1) :
    gaussianWidth (K : Set (EuclideanSpace ℝ (Fin n))) ≤ √(2 * Real.log K.card) := by
  sorry

/-- 3.2 Gaussian concentration above the mean: for an `L`-Lipschitz `f` with `L > 0` and
`t ≥ 0`, `P(f ≥ E f + t) ≤ exp(-t²/(2L²))` under the standard Gaussian measure. The hypothesis
`L > 0` keeps the exponent genuine; at `L = 0` the expression `-t²/(2L²)` is the junk value `0`. -/
theorem stdGaussian_add_le_le_exp {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    [FiniteDimensional ℝ E] [MeasurableSpace E] [BorelSpace E] {f : E → ℝ} {L : ℝ≥0}
    (hL : 0 < L) (hf : LipschitzWith L f) {t : ℝ} (ht : 0 ≤ t) :
    (stdGaussian E).real {x | (∫ y, f y ∂stdGaussian E) + t ≤ f x} ≤
      Real.exp (-t ^ 2 / (2 * (L : ℝ) ^ 2)) := by
  sorry

/-- 3.3 The upper Gaussian comparison: for nonempty `K` in the unit sphere and a standard
Gaussian `d × n` matrix `G`, `E sup_{u ∈ K} ‖G u‖ ≤ E ‖h‖ + w(K)` with `h` standard Gaussian in
`ℝᵈ`. -/
theorem integral_iSup_norm_toMatrix_le {d n : ℕ} (K : Set (EuclideanSpace ℝ (Fin n)))
    (hK : K.Nonempty) (hK₁ : K ⊆ Metric.sphere 0 1) :
    ∫ x, ⨆ u : K, ‖Matrix.toEuclideanLin (toMatrix x) u‖
        ∂stdGaussian (EuclideanSpace ℝ (Fin d × Fin n)) ≤
      (∫ h, ‖h‖ ∂stdGaussian (EuclideanSpace ℝ (Fin d))) + gaussianWidth K := by
  sorry

/-- 3.4 Gordon's lower tail for the minimum restricted singular value of `Γ = d^{-1/2} G`:
`P(inf_{u ∈ K} ‖Γ u‖ ≤ 1 - (w(K) + 1)/√d - t) ≤ exp(-d t²/2)` for `t > 0`. -/
theorem gordon_tail_lower {d n : ℕ} (hd : 0 < d) (K : Set (EuclideanSpace ℝ (Fin n)))
    (hK : K.Nonempty) (hK₁ : K ⊆ Metric.sphere 0 1) {t : ℝ} (ht : 0 < t) :
    (stdGaussian (EuclideanSpace ℝ (Fin d × Fin n))).real
        {x | ⨅ u : K, ‖Matrix.toEuclideanLin ((√(d : ℝ))⁻¹ • toMatrix x) u‖ ≤
          1 - (gaussianWidth K + 1) / √(d : ℝ) - t} ≤
      Real.exp (-(d : ℝ) * t ^ 2 / 2) := by
  sorry

/-- 3.4 The upper tail for the maximum restricted singular value of `Γ = d^{-1/2} G`:
`P(sup_{u ∈ K} ‖Γ u‖ ≥ 1 + w(K)/√d + t) ≤ exp(-d t²/2)` for `t > 0`. -/
theorem gordon_tail_upper {d n : ℕ} (hd : 0 < d) (K : Set (EuclideanSpace ℝ (Fin n)))
    (hK : K.Nonempty) (hK₁ : K ⊆ Metric.sphere 0 1) {t : ℝ} (ht : 0 < t) :
    (stdGaussian (EuclideanSpace ℝ (Fin d × Fin n))).real
        {x | 1 + gaussianWidth K / √(d : ℝ) + t ≤
          ⨆ u : K, ‖Matrix.toEuclideanLin ((√(d : ℝ))⁻¹ • toMatrix x) u‖} ≤
      Real.exp (-(d : ℝ) * t ^ 2 / 2) := by
  sorry

/-- 3.5 The Gaussian subspace embedding: for a subspace `V` of dimension `k`, `t > 0` and
`a = 1 - (1 + √k)/√d - t`, the matrix `d^{-1/2} G` fails to be an `ε`-subspace embedding for
`V`, with `ε = max ((1 + √k/√d + t)² - 1) (1 - a²)`, with probability at most `2 exp(-d t²/2)`.
For `a < 0` and `k ≥ 1` the first term exceeds `1`, so the lower inequality is vacuous. -/
theorem isSubspaceEmbedding_gaussian {d n : ℕ} (hd : 0 < d) (V : Submodule ℝ (Fin n → ℝ))
    {t : ℝ} (ht : 0 < t) :
    (stdGaussian (EuclideanSpace ℝ (Fin d × Fin n))).real
        {x | ¬ IsSubspaceEmbedding ((√(d : ℝ))⁻¹ • toMatrix x) V
          (max ((1 + √(Module.finrank ℝ V : ℝ) / √(d : ℝ) + t) ^ 2 - 1)
            (1 - (1 - (1 + √(Module.finrank ℝ V : ℝ)) / √(d : ℝ) - t) ^ 2))} ≤
      2 * Real.exp (-(d : ℝ) * t ^ 2 / 2) := by
  sorry

/-- 3.5 The Gaussian Johnson–Lindenstrauss embedding: for `N` points, `M = N(N-1)/2`, `t > 0`
and `(1 + √(2 log M))/√d + t ≤ ε`, the probability that `d^{-1/2} G` distorts some distance
`‖aᵢ - aⱼ‖` by a factor outside `[1 - ε, 1 + ε]` is at most `2 exp(-d t²/2)`. -/
theorem stdGaussian_bad_pair_le {d n N : ℕ} (hd : 0 < d) (a : Fin N → EuclideanSpace ℝ (Fin n))
    {ε t : ℝ} (ht : 0 < t)
    (hsize : (1 + √(2 * Real.log ((N : ℝ) * (N - 1) / 2))) / √(d : ℝ) + t ≤ ε) :
    (stdGaussian (EuclideanSpace ℝ (Fin d × Fin n))).real
        {x | ∃ i j, ¬ ((1 - ε) * ‖a i - a j‖ ≤
            ‖Matrix.toEuclideanLin ((√(d : ℝ))⁻¹ • toMatrix x) (a i - a j)‖ ∧
          ‖Matrix.toEuclideanLin ((√(d : ℝ))⁻¹ • toMatrix x) (a i - a j)‖ ≤
            (1 + ε) * ‖a i - a j‖)} ≤
      2 * Real.exp (-(d : ℝ) * t ^ 2 / 2) := by
  sorry

end Layer3

/-! ## Layer 4: tensor rank, border rank and non-closedness -/

section Layer4

variable {ι : Type*} [Fintype ι] {n : ι → ℕ}

/-- 4.1 The tensor `T` is a sum of at most `r` products: there are factor matrices with `r`
columns whose column products sum to `T`. -/
def IsRankLE {F : Type*} [CommSemiring F] (r : ℕ) (T : (∀ p, Fin (n p)) → F) : Prop :=
  ∃ A : ∀ p, Matrix (Fin (n p)) (Fin r) F, T = fun x ↦ ∑ i, ∏ p, A p (x p) i

/-- 4.2 The topological border rank over `𝕜 = ℝ` or `ℂ`: the least `r` such that `T` is a
limit of tensors of rank at most `r`. -/
def topBorderRank {𝕜 : Type*} [RCLike 𝕜] (T : (∀ p, Fin (n p)) → 𝕜) : ℕ :=
  sInf {r : ℕ | T ∈ closure {S | IsRankLE r S}}

/-- 4.2 The `W`-type tensor of two families `a, b` of vectors: the sum over the parties `q` of
the product with `b q` at party `q` and `a p` at every other party `p`. -/
def wTensorOf [DecidableEq ι] {F : Type*} [CommSemiring F] (a b : ∀ p, Fin (n p) → F) :
    (∀ p, Fin (n p)) → F :=
  fun x ↦ ∑ q, ∏ p, if p = q then b p (x p) else a p (x p)

/-- 4.1 With at least one party, `IsRankLE` is the sublevel set of AsymptoticSpectra's
`tensorRank`. -/
theorem isRankLE_iff_tensorRank_le [DecidableEq ι] [Nonempty ι] {F : Type*} [Field F]
    (r : ℕ) (T : (∀ p, Fin (n p)) → F) :
    IsRankLE r T ↔ tensorRank (⟨n, T⟩ : CoordTensor F ι) ≤ r := by
  sorry

/-- 4.2 Over every field, the `W`-type tensor of three parties with `a p, b p` linearly
independent at every party has tensor rank `3`. -/
theorem tensorRank_wTensorOf {F : Type*} [Field F] {n : Fin 3 → ℕ}
    (a b : ∀ p, Fin (n p) → F) (hab : ∀ p, LinearIndependent F ![a p, b p]) :
    tensorRank (⟨n, wTensorOf a b⟩ : CoordTensor F (Fin 3)) = 3 := by
  sorry

/-- 4.2 Over `ℝ` or `ℂ`, the same tensor has topological border rank `2`, lies in the closure of
the tensors of rank at most `2`, and is not of rank at most `2`. -/
theorem topBorderRank_wTensorOf {𝕜 : Type*} [RCLike 𝕜] {n : Fin 3 → ℕ}
    (a b : ∀ p, Fin (n p) → 𝕜) (hab : ∀ p, LinearIndependent 𝕜 ![a p, b p]) :
    topBorderRank (wTensorOf a b) = 2 ∧
      wTensorOf a b ∈ closure {S | IsRankLE 2 S} ∧ ¬ IsRankLE 2 (wTensorOf a b) := by
  sorry

/-- 4.3 The topological border rank is at most the algebraic border rank of
BilinearComplexityAndBorderRank, for at least one party. -/
theorem topBorderRank_le_borderRank [Nonempty ι] {𝕜 : Type*} [RCLike 𝕜]
    (T : (∀ p, Fin (n p)) → 𝕜) :
    topBorderRank T ≤ borderRank 𝕜 (⟨n, T⟩ : CoordTensor 𝕜 ι) := by
  sorry

/-- 4.4 The tensors of rank at most one form a closed set. -/
theorem isClosed_setOf_isRankLE_one {𝕜 : Type*} [RCLike 𝕜] :
    IsClosed {T : (∀ p, Fin (n p)) → 𝕜 | IsRankLE 1 T} := by
  sorry

/-- 4.4 With at least three parties and `2 ≤ r ≤ n p` for every party, the tensors of rank at
most `r` do not form a closed set. -/
theorem not_isClosed_setOf_isRankLE {𝕜 : Type*} [RCLike 𝕜] (hι : 3 ≤ Fintype.card ι) {r : ℕ}
    (hr : 2 ≤ r) (hn : ∀ p, r ≤ n p) :
    ¬ IsClosed {T : (∀ p, Fin (n p)) → 𝕜 | IsRankLE r T} := by
  sorry

/-- 4.5 Stable limits: a limit of tensors with `r`-term representations whose factor entries
are uniformly bounded has rank at most `r`. -/
theorem isRankLE_of_tendsto_of_bounded {𝕜 : Type*} [RCLike 𝕜] {r : ℕ} {C : ℝ}
    (T : ℕ → (∀ p, Fin (n p)) → 𝕜) (A : ℕ → ∀ p, Matrix (Fin (n p)) (Fin r) 𝕜)
    (hA : ∀ k, T k = fun x ↦ ∑ i, ∏ p, A k p (x p) i) (hC : ∀ k p a i, ‖A k p a i‖ ≤ C)
    {T₀ : (∀ p, Fin (n p)) → 𝕜} (hT : Tendsto T atTop (𝓝 T₀)) :
    IsRankLE r T₀ := by
  sorry

end Layer4

/-! ## Layer 5: Tucker format and the higher-order SVD -/

section Layer5

variable {𝕜 : Type*} [RCLike 𝕜] {d : ℕ} {n : Fin d → ℕ}

/-- 5.1 The squared Frobenius distance of two tensors. -/
def sqDist {ι : Type*} [Fintype ι] [DecidableEq ι] {n : ι → ℕ} (T u : (∀ p, Fin (n p)) → 𝕜) : ℝ :=
  ∑ x, ‖T x - u x‖ ^ 2

/-- 5.1 The mode-`j` unfolding: rows indexed by mode `j`, columns by the other modes. -/
def modeUnfold (T : (∀ i, Fin (n i)) → 𝕜) (j : Fin d) :
    Matrix (Fin (n j)) (∀ k : {k : Fin d // k ≠ j}, Fin (n k.val)) 𝕜 :=
  fun a b ↦ T fun k ↦ if h : k = j then h.symm ▸ a else b ⟨k, h⟩

/-- 5.1 The action of a matrix `M` along mode `j`. -/
def modeApply (j : Fin d) (M : Matrix (Fin (n j)) (Fin (n j)) 𝕜) (T : (∀ i, Fin (n i)) → 𝕜) :
    (∀ i, Fin (n i)) → 𝕜 :=
  fun x ↦ (M * modeUnfold T j) (x j) (fun k ↦ x k.val)

/-- 5.1 The Kronecker action `(P₀ ⊗ ⋯ ⊗ P_{d-1}) T` of one matrix per mode. -/
def kronApply (P : ∀ j, Matrix (Fin (n j)) (Fin (n j)) 𝕜) (T : (∀ i, Fin (n i)) → 𝕜) :
    (∀ i, Fin (n i)) → 𝕜 :=
  fun x ↦ ∑ y, (∏ j, P j (x j) (y j)) * T y

/-- 5.1 The Tucker format: `T` has a core of size `r` and one factor matrix per mode. -/
def IsTuckerLE (r : Fin d → ℕ) (T : (∀ i, Fin (n i)) → 𝕜) : Prop :=
  ∃ (C : (∀ j, Fin (r j)) → 𝕜) (U : ∀ j, Matrix (Fin (n j)) (Fin (r j)) 𝕜),
    T = fun x ↦ ∑ y, C y * ∏ j, U j (x j) (y j)

/-- 5.1 Tucker ranks are unfolding ranks: `T` is in the Tucker format `r` exactly when every
mode-`j` unfolding has rank at most `r j`. -/
theorem isTuckerLE_iff_rank_modeUnfold_le (r : Fin d → ℕ) (T : (∀ i, Fin (n i)) → 𝕜) :
    IsTuckerLE r T ↔ ∀ j, (modeUnfold T j).rank ≤ r j := by
  sorry

/-- 5.1 The Tucker format is closed. -/
theorem isClosed_setOf_isTuckerLE (r : Fin d → ℕ) :
    IsClosed {T : (∀ i, Fin (n i)) → 𝕜 | IsTuckerLE r T} := by
  sorry

/-- 5.1 Every tensor has a best approximation in the Tucker format. -/
theorem exists_isMinOn_sqDist_isTuckerLE (r : Fin d → ℕ) (T : (∀ i, Fin (n i)) → 𝕜) :
    ∃ u, IsTuckerLE r u ∧ ∀ w, IsTuckerLE r w → sqDist T u ≤ sqDist T w := by
  sorry

/-- 5.2 Simultaneous orthogonal projections: for frames `U j` with orthonormal columns and
`P j = U j (U j)ᴴ`, `‖T - (⊗ P j) T‖² ≤ ∑ⱼ ‖T - P j ×ⱼ T‖²`. -/
theorem sqDist_kronApply_le {r : Fin d → ℕ} (T : (∀ i, Fin (n i)) → 𝕜)
    (U : ∀ j, Matrix (Fin (n j)) (Fin (r j)) 𝕜) (hU : ∀ j, (U j)ᴴ * U j = 1) :
    sqDist T (kronApply (fun j ↦ U j * (U j)ᴴ) T) ≤
      ∑ j, sqDist T (modeApply j (U j * (U j)ᴴ) T) := by
  sorry

/-- 5.2 The HOSVD projection error: with the frames of leading left singular vectors of the
unfoldings, `‖T - (⊗ P j) T‖² ≤ ∑ⱼ ∑_{i ≥ r j} σᵢ(T_(j))²`. -/
theorem hosvd_projection_error_sq_le {r : Fin d → ℕ} (T : (∀ i, Fin (n i)) → 𝕜)
    (U : ∀ j, Matrix (Fin (n j)) (Fin (r j)) 𝕜) (hU : ∀ j, (U j)ᴴ * U j = 1)
    (hmode : ∀ j, modeUnfold T j * (modeUnfold T j)ᴴ * U j =
      U j * Matrix.diagonal (fun i : Fin (r j) ↦
        (((toEuclideanLin (modeUnfold T j)).singularValues i ^ 2 : ℝ) : 𝕜))) :
    sqDist T (kronApply (fun j ↦ U j * (U j)ᴴ) T) ≤ ∑ j, tailSq (modeUnfold T j) (r j) := by
  sorry

/-- 5.3 Quasi-optimality of the HOSVD: its squared error is at most the number of modes with
`r j` below the unfolding rank times the squared error of any tensor in the Tucker format. -/
theorem hosvd_quasi_optimal {r : Fin d → ℕ} (T : (∀ i, Fin (n i)) → 𝕜)
    (U : ∀ j, Matrix (Fin (n j)) (Fin (r j)) 𝕜) (hU : ∀ j, (U j)ᴴ * U j = 1)
    (hmode : ∀ j, modeUnfold T j * (modeUnfold T j)ᴴ * U j =
      U j * Matrix.diagonal (fun i : Fin (r j) ↦
        (((toEuclideanLin (modeUnfold T j)).singularValues i ^ 2 : ℝ) : 𝕜)))
    (w : (∀ i, Fin (n i)) → 𝕜) (hw : IsTuckerLE r w) :
    sqDist T (kronApply (fun j ↦ U j * (U j)ᴴ) T) ≤
      (Finset.univ.filter fun j ↦ r j < (modeUnfold T j).rank).card * sqDist T w := by
  sorry

end Layer5

/-! ## Layer 6: the tensor-train format -/

section Layer6

variable {𝕜 : Type*} [RCLike 𝕜] {d : ℕ} {n : Fin d → ℕ}

/-- 6.1 The unfolding at the cut between the first `k` modes and the others. -/
def cutUnfold {F : Type*} (T : (∀ i, Fin (n i)) → F) (k : ℕ) :
    Matrix (∀ j : {j : Fin d // j.val < k}, Fin (n j.val))
      (∀ j : {j : Fin d // k ≤ j.val}, Fin (n j.val)) F :=
  fun a b ↦ T fun j ↦ if hj : j.val < k then a ⟨j, hj⟩ else b ⟨j, Nat.le_of_not_gt hj⟩

/-- 6.1 The tensor-train format with bond dimensions `r`, trivial at both ends. -/
def HasTensorTrain {F : Type*} [CommSemiring F] (T : (∀ i, Fin (n i)) → F)
    (r : Fin (d + 1) → ℕ) : Prop :=
  r 0 = 1 ∧ r (Fin.last d) = 1 ∧
    ∃ G : ∀ j : Fin d, Fin (r j.castSucc) → Fin (r j.succ) → Fin (n j) → F,
      ∀ i, T i = ∑ b : (∀ j, Fin (r j)), ∏ j, G j (b j.castSucc) (b j.succ) (i j)

/-- 6.1 The action of a matrix on the row side of the cut `k`. -/
def cutApply (T : (∀ i, Fin (n i)) → 𝕜) (k : ℕ)
    (M : Matrix (∀ j : {j : Fin d // j.val < k}, Fin (n j.val))
      (∀ j : {j : Fin d // j.val < k}, Fin (n j.val)) 𝕜) : (∀ i, Fin (n i)) → 𝕜 :=
  fun x ↦ (M * cutUnfold T k) (fun j ↦ x j.val) (fun j ↦ x j.val)

/-- 6.2 TT truncation: the projections `U k (U k)ᴴ` at the inner cuts `k = d - 1, …, 1`,
applied in this order, the cut `d - 1` first. -/
def ttTruncate {r : Fin (d + 1) → ℕ}
    (U : ∀ k : Fin (d + 1), Matrix (∀ j : {j : Fin d // j.val < k.val}, Fin (n j.val))
      (Fin (r k)) 𝕜) (T : (∀ i, Fin (n i)) → 𝕜) : (∀ i, Fin (n i)) → 𝕜 :=
  ((List.finRange (d + 1)).filter fun k ↦ 0 < k.val ∧ k.val < d).foldr
    (fun k S ↦ cutApply S k.val (U k * (U k)ᴴ)) T

/-- 6.1 TT ranks are cut ranks: for `d ≥ 1` and trivial end ranks, `T` has a tensor train with
bond dimensions `r` exactly when every inner cut unfolding `k` has rank at most `r k`. -/
theorem hasTensorTrain_iff_cutRank_le {F : Type*} [Field F] (T : (∀ i, Fin (n i)) → F)
    (r : Fin (d + 1) → ℕ) (h : 0 < d) (h₀ : r 0 = 1) (hd : r (Fin.last d) = 1) :
    HasTensorTrain T r ↔ ∀ k : Fin (d + 1), 0 < k.val → k.val < d →
      (cutUnfold T k.val).rank ≤ r k := by
  sorry

/-- 6.1 The tensor-train format is closed. -/
theorem isClosed_setOf_hasTensorTrain (r : Fin (d + 1) → ℕ) :
    IsClosed {T : (∀ i, Fin (n i)) → 𝕜 | HasTensorTrain T r} := by
  sorry

/-- 6.1 For `d ≥ 1` and trivial end ranks, every tensor has a best approximation in the
tensor-train format. -/
theorem exists_isMinOn_sqDist_hasTensorTrain (r : Fin (d + 1) → ℕ) (h : 0 < d)
    (h₀ : r 0 = 1) (hd : r (Fin.last d) = 1) (T : (∀ i, Fin (n i)) → 𝕜) :
    ∃ u, HasTensorTrain u r ∧ ∀ w, HasTensorTrain w r → sqDist T u ≤ sqDist T w := by
  sorry

/-- 6.2 The TT truncation lies in the tensor-train format `r`, for any frames, when `d ≥ 1` and
the end ranks are trivial. -/
theorem hasTensorTrain_ttTruncate {r : Fin (d + 1) → ℕ} (h : 0 < d) (h₀ : r 0 = 1)
    (hd : r (Fin.last d) = 1)
    (U : ∀ k : Fin (d + 1), Matrix (∀ j : {j : Fin d // j.val < k.val}, Fin (n j.val))
      (Fin (r k)) 𝕜) (T : (∀ i, Fin (n i)) → 𝕜) :
    HasTensorTrain (ttTruncate U T) r := by
  sorry

/-- 6.2 The TT-SVD error: with frames of leading left singular vectors of the cut unfoldings of
`T`, `‖T - u‖² ≤ ∑_{0 < k < d} ∑_{i ≥ r k} σᵢ(T_[k])²`. -/
theorem sqDist_ttTruncate_le {r : Fin (d + 1) → ℕ}
    (U : ∀ k : Fin (d + 1), Matrix (∀ j : {j : Fin d // j.val < k.val}, Fin (n j.val))
      (Fin (r k)) 𝕜) (T : (∀ i, Fin (n i)) → 𝕜)
    (hU : ∀ k : Fin (d + 1), 0 < k.val → k.val < d → (U k)ᴴ * U k = 1)
    (hcut : ∀ k : Fin (d + 1), 0 < k.val → k.val < d →
      cutUnfold T k.val * (cutUnfold T k.val)ᴴ * U k = U k * Matrix.diagonal (fun i : Fin (r k) ↦
        (((toEuclideanLin (cutUnfold T k.val)).singularValues i ^ 2 : ℝ) : 𝕜))) :
    sqDist T (ttTruncate U T) ≤
      ∑ k : Fin (d + 1) with 0 < k.val ∧ k.val < d, tailSq (cutUnfold T k.val) (r k) := by
  sorry

/-- 6.3 Quasi-optimality of the TT-SVD: for `d ≥ 1`, its squared error is at most `d - 1` times
the squared error of any tensor in the tensor-train format `r`. -/
theorem ttTruncate_quasi_optimal {r : Fin (d + 1) → ℕ} (h : 0 < d)
    (U : ∀ k : Fin (d + 1), Matrix (∀ j : {j : Fin d // j.val < k.val}, Fin (n j.val))
      (Fin (r k)) 𝕜) (T : (∀ i, Fin (n i)) → 𝕜)
    (hU : ∀ k : Fin (d + 1), 0 < k.val → k.val < d → (U k)ᴴ * U k = 1)
    (hcut : ∀ k : Fin (d + 1), 0 < k.val → k.val < d →
      cutUnfold T k.val * (cutUnfold T k.val)ᴴ * U k = U k * Matrix.diagonal (fun i : Fin (r k) ↦
        (((toEuclideanLin (cutUnfold T k.val)).singularValues i ^ 2 : ℝ) : 𝕜)))
    (w : (∀ i, Fin (n i)) → 𝕜) (hw : HasTensorTrain w r) :
    sqDist T (ttTruncate U T) ≤ ((d : ℝ) - 1) * sqDist T w := by
  sorry

end Layer6

/-! ## Layer 7: separable approximation of asymptotically smooth kernels -/

section Layer7

variable {m : ℕ}

local notation "E" => EuclideanSpace ℝ (Fin m)

/-- 7.1 Asymptotic smoothness in directional form on `X × Y`: `κ` is smooth off the diagonal and
`|D^p_{t,x} κ(x, y)| ≤ C p! p^ρ γ^p ‖x - y‖^{-p-s}` for `p ≥ 1`, unit `t`, `x ∈ X`, `y ∈ Y`,
`x ≠ y`. -/
def IsAsymptoticallySmooth (κ : E → E → ℝ) (X Y : Set E) (C γ ρ s : ℝ) : Prop :=
  ContDiffOn ℝ ∞ (Function.uncurry κ) {z | z.1 ≠ z.2} ∧
    ∀ x ∈ X, ∀ y ∈ Y, x ≠ y → ∀ t : E, ‖t‖ = 1 → ∀ p : ℕ, 1 ≤ p →
      |iteratedFDeriv ℝ p (fun x' ↦ κ x' y) x (fun _ ↦ t)| ≤
        C * p.factorial * (p : ℝ) ^ ρ * γ ^ p * ‖x - y‖ ^ (-(p : ℝ) - s)

/-- 7.1 The Taylor polynomial of degree `q - 1` of `κ(·, y)` about `x₀`. -/
def taylorKernel (κ : E → E → ℝ) (x₀ : E) (q : ℕ) (x y : E) : ℝ :=
  ∑ p ∈ Finset.range q,
    (p.factorial : ℝ)⁻¹ * iteratedFDeriv ℝ p (fun x' ↦ κ x' y) x₀ (fun _ ↦ x - x₀)

/-- 7.1 The Taylor kernel is separable with `C(q - 1 + m, m)` terms. -/
theorem taylorKernel_separable (κ : E → E → ℝ) (x₀ : E) (q : ℕ) :
    ∃ φ ψ : Fin ((q - 1 + m).choose m) → E → ℝ,
      ∀ x y, taylorKernel κ x₀ q x y = ∑ i, φ i x * ψ i y := by
  sorry

/-- 7.2 The Taylor error for an asymptotically smooth kernel: on a convex `X ∋ x₀` within
distance `R` of `x₀` and at distance at least `δ > 0` from `Y`, for `q ≥ 1` and `q + s ≥ 0`,
`|κ - κ_q| ≤ C q^ρ (γ R/δ)^q δ^{-s}`. -/
theorem abs_sub_taylorKernel_le {κ : E → E → ℝ} {X Y : Set E} {C γ ρ s R δ : ℝ} {x₀ : E}
    {q : ℕ} (hκ : IsAsymptoticallySmooth κ X Y C γ ρ s) (hX : Convex ℝ X) (hx₀ : x₀ ∈ X)
    (hq : 1 ≤ q) (hqs : 0 ≤ (q : ℝ) + s) (hδ : 0 < δ) (hsep : ∀ x ∈ X, ∀ y ∈ Y, δ ≤ ‖x - y‖)
    (hR : ∀ x ∈ X, ‖x - x₀‖ ≤ R) :
    ∀ x ∈ X, ∀ y ∈ Y,
      |κ x y - taylorKernel κ x₀ q x y| ≤ C * (q : ℝ) ^ ρ * (γ * R / δ) ^ q * δ ^ (-s) := by
  sorry

/-- 7.3 The Galerkin block of an asymptotically smooth kernel on separated compact supports:
replacing `κ` by its Taylor kernel gives a block of rank at most `C(q - 1 + m, m)` whose entries
differ by at most the Taylor bound times `‖φᵢ‖₁ ‖ψⱼ‖₁`. -/
theorem galerkin_block_approx {κ : E → E → ℝ} {X Y : Set E} {C γ ρ s R δ : ℝ} {x₀ : E}
    {q I J : ℕ} (hκ : IsAsymptoticallySmooth κ X Y C γ ρ s) (hX : Convex ℝ X)
    (hXc : IsCompact X) (hYc : IsCompact Y) (hx₀ : x₀ ∈ X) (hq : 1 ≤ q)
    (hqs : 0 ≤ (q : ℝ) + s) (hδ : 0 < δ) (hsep : ∀ x ∈ X, ∀ y ∈ Y, δ ≤ ‖x - y‖)
    (hR : ∀ x ∈ X, ‖x - x₀‖ ≤ R) (φ : Fin I → E → ℝ) (ψ : Fin J → E → ℝ)
    (hφ : ∀ i, Integrable (φ i)) (hψ : ∀ j, Integrable (ψ j))
    (hφX : ∀ i, Function.support (φ i) ⊆ X) (hψY : ∀ j, Function.support (ψ j) ⊆ Y) :
    (Matrix.of fun i j ↦ ∫ x, ∫ y, φ i x * taylorKernel κ x₀ q x y * ψ j y).rank ≤
        (q - 1 + m).choose m ∧
      ∀ i j, |(∫ x, ∫ y, φ i x * κ x y * ψ j y) -
          ∫ x, ∫ y, φ i x * taylorKernel κ x₀ q x y * ψ j y| ≤
        C * (q : ℝ) ^ ρ * (γ * R / δ) ^ q * δ ^ (-s) * ((∫ x, |φ i x|) * ∫ y, |ψ j y|) := by
  sorry

end Layer7

/-- 7.4 The logarithmic kernel in one dimension: for `a < b < c`, `x ∈ [a, b]`, `y ≥ c`,
`x₀ = (a + b)/2`, `η = (b - a)/(c - b)` and `r ≥ 1`, the `r`-term Taylor expansion of
`log (y - x)` about `x₀` has error at most `(2 + η)/(2r) · (η/(2 + η))^r`. -/
theorem abs_log_sub_taylor_le {a b c : ℝ} (hab : a < b) (hbc : b < c) {r : ℕ} (hr : 1 ≤ r)
    {x y : ℝ} (hx : x ∈ Set.Icc a b) (hy : c ≤ y) :
    |Real.log (y - x) - (Real.log (y - (a + b) / 2) -
        ∑ l ∈ Finset.Ico 1 r, (x - (a + b) / 2) ^ l / (l * (y - (a + b) / 2) ^ l))| ≤
      (2 + (b - a) / (c - b)) / (2 * r) * ((b - a) / (c - b) / (2 + (b - a) / (c - b))) ^ r := by
  sorry

end TauCetiRoadmap.LowRankRandomizedAndTensorApproximation

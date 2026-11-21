import Mathlib

/-!
# Gaussian comparison inequalities: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib, each with `sorry`, together with the one definition
they need, which has a real body. Every headline theorem of the README is statable at the pins and
is stated here. The README's remaining targets, API lists and Checks are not restated.

A centred Gaussian vector with covariance matrix `S` is Mathlib's
`multivariateGaussian 0 S` on `EuclideanSpace ℝ ι`, for a positive semidefinite `S`; the index
type `ι` is `Fin n`, or `Fin m × Fin n` for the doubly indexed families of Gordon's inequality.
The squared increment `E (X i - X j)²` of the coordinates is written in terms of the covariance as
`S i i + S j j - 2 * S i j`. Maxima are `Finset.sup'` and minima `Finset.inf'` over the full index
set, which is assumed nonempty where they occur; tail events are written with quantifiers, so that
they need no such assumption. A standard Gaussian `m × n` matrix is the image of
`stdGaussian (EuclideanSpace ℝ (Fin m × Fin n))` under `toMatrix`, and its operator norm is the
`ℓ²` operator norm of the scope `Matrix.Norms.L2Operator`.
-/

noncomputable section

open MeasureTheory ProbabilityTheory Finset
open scoped RealInnerProductSpace

namespace TauCetiRoadmap.GaussianComparisonInequalities

/-! ## Layer 1: Gaussian interpolation -/

/-- 1.1 **Gaussian interpolation.** For positive semidefinite `S`, `T` and a `C²` function `f`
with bounded second derivative, the map `s ↦ ∫ f d N(0, s S + (1 - s) T)` has derivative
`(1/2) ∑ᵢⱼ (S i j - T i j) ∫ ∂ᵢ∂ⱼ f d N(0, t S + (1 - t) T)` at every `t ∈ (0, 1)` (Vershynin,
Lemma 7.2.7). -/
theorem hasDerivAt_integral_multivariateGaussian_interpolate {n : ℕ}
    {S T : Matrix (Fin n) (Fin n) ℝ} (hS : S.PosSemidef) (hT : T.PosSemidef)
    {f : EuclideanSpace ℝ (Fin n) → ℝ} (hf : ContDiff ℝ 2 f)
    (hf₂ : ∃ C, ∀ x, ‖iteratedFDeriv ℝ 2 f x‖ ≤ C) {t : ℝ} (ht : t ∈ Set.Ioo (0 : ℝ) 1) :
    HasDerivAt (fun s : ℝ => ∫ x, f x ∂multivariateGaussian 0 (s • S + (1 - s) • T))
      ((1 / 2) * ∑ i, ∑ j, (S i j - T i j) *
        ∫ x, iteratedFDeriv ℝ 2 f x ![EuclideanSpace.single i 1, EuclideanSpace.single j 1]
          ∂multivariateGaussian 0 (t • S + (1 - t) • T)) t := by
  sorry

/-- 1.2 **The comparison principle.** If `∑ᵢⱼ (S i j - T i j) ∂ᵢ∂ⱼ f ≥ 0` everywhere, for a `C²`
function `f` with bounded second derivative, then `∫ f d N(0, T) ≤ ∫ f d N(0, S)` (Vershynin,
Lemma 7.2.8, in the form of a sum condition; Kahane 1986). -/
theorem integral_le_integral_multivariateGaussian_of_sum_nonneg {n : ℕ}
    {S T : Matrix (Fin n) (Fin n) ℝ} (hS : S.PosSemidef) (hT : T.PosSemidef)
    {f : EuclideanSpace ℝ (Fin n) → ℝ} (hf : ContDiff ℝ 2 f)
    (hf₂ : ∃ C, ∀ x, ‖iteratedFDeriv ℝ 2 f x‖ ≤ C)
    (hpos : ∀ x, 0 ≤ ∑ i, ∑ j, (S i j - T i j) *
      iteratedFDeriv ℝ 2 f x ![EuclideanSpace.single i 1, EuclideanSpace.single j 1]) :
    ∫ x, f x ∂multivariateGaussian 0 T ≤ ∫ x, f x ∂multivariateGaussian 0 S := by
  sorry

/-! ## Layer 2: Slepian's lemma and the Sudakov–Fernique inequality -/

/-- 2.1 **Slepian's lemma.** If two centred Gaussian vectors have equal variances and the
increments of the first are dominated by those of the second, then for every real `τ` the
probability that some coordinate of the first reaches `τ` is at most the same probability for
the second (Vershynin, Theorem 7.2.1 and Theorem 7.2.9). -/
theorem slepian {n : ℕ} {S T : Matrix (Fin n) (Fin n) ℝ} (hS : S.PosSemidef)
    (hT : T.PosSemidef) (hdiag : ∀ i, S i i = T i i)
    (hinc : ∀ i j, S i i + S j j - 2 * S i j ≤ T i i + T j j - 2 * T i j) (τ : ℝ) :
    (multivariateGaussian 0 S).real {x | ∃ i, τ ≤ x i} ≤
      (multivariateGaussian 0 T).real {x | ∃ i, τ ≤ x i} := by
  sorry

/-- 2.2 **The Sudakov–Fernique inequality.** If the increments of a centred Gaussian vector are
dominated by those of another, its expected maximum is at most the other's; no condition on the
variances is needed (Vershynin, Theorem 7.2.11; Davidson–Szarek, Lemma II.9). -/
theorem sudakov_fernique {n : ℕ} [NeZero n] {S T : Matrix (Fin n) (Fin n) ℝ}
    (hS : S.PosSemidef) (hT : T.PosSemidef)
    (hinc : ∀ i j, S i i + S j j - 2 * S i j ≤ T i i + T j j - 2 * T i j) :
    ∫ x, univ.sup' univ_nonempty (fun i => x i) ∂multivariateGaussian 0 S ≤
      ∫ x, univ.sup' univ_nonempty (fun i => x i) ∂multivariateGaussian 0 T := by
  sorry

/-! ## Layer 3: Gordon's min–max comparison -/

/-- 3.1 **Gordon's inequality, tail form.** For centred Gaussian families indexed by
`Fin m × Fin n` with equal variances, increments within a row dominated by those of the second
family and increments across distinct rows dominating them, the probability that every row has a
coordinate at least `τ` is at most the same probability for the second family, for every real
`τ` (Vershynin, Exercise 7.2.14, stated there for `τ ≥ 0`). -/
theorem gordon {m n : ℕ} {S T : Matrix (Fin m × Fin n) (Fin m × Fin n) ℝ}
    (hS : S.PosSemidef) (hT : T.PosSemidef) (hdiag : ∀ p, S p p = T p p)
    (hrow : ∀ u t s, S (u, t) (u, t) + S (u, s) (u, s) - 2 * S (u, t) (u, s) ≤
      T (u, t) (u, t) + T (u, s) (u, s) - 2 * T (u, t) (u, s))
    (hcross : ∀ u v, u ≠ v → ∀ t s, T (u, t) (u, t) + T (v, s) (v, s) - 2 * T (u, t) (v, s) ≤
      S (u, t) (u, t) + S (v, s) (v, s) - 2 * S (u, t) (v, s)) (τ : ℝ) :
    (multivariateGaussian 0 S).real {x | ∀ u, ∃ t, τ ≤ x (u, t)} ≤
      (multivariateGaussian 0 T).real {x | ∀ u, ∃ t, τ ≤ x (u, t)} := by
  sorry

/-- 3.2 **Gordon's inequality for expectations.** Under the hypotheses of 3.1, with both index
sets nonempty, `E minᵤ maxₜ X (u, t) ≤ E minᵤ maxₜ Y (u, t)` (Vershynin, Exercise 7.2.14, (7.12)). -/
theorem gordon_integral {m n : ℕ} [NeZero m] [NeZero n]
    {S T : Matrix (Fin m × Fin n) (Fin m × Fin n) ℝ}
    (hS : S.PosSemidef) (hT : T.PosSemidef) (hdiag : ∀ p, S p p = T p p)
    (hrow : ∀ u t s, S (u, t) (u, t) + S (u, s) (u, s) - 2 * S (u, t) (u, s) ≤
      T (u, t) (u, t) + T (u, s) (u, s) - 2 * T (u, t) (u, s))
    (hcross : ∀ u v, u ≠ v → ∀ t s, T (u, t) (u, t) + T (v, s) (v, s) - 2 * T (u, t) (v, s) ≤
      S (u, t) (u, t) + S (v, s) (v, s) - 2 * S (u, t) (v, s)) :
    ∫ x, univ.inf' univ_nonempty (fun u => univ.sup' univ_nonempty (fun t => x (u, t)))
        ∂multivariateGaussian 0 S ≤
      ∫ x, univ.inf' univ_nonempty (fun u => univ.sup' univ_nonempty (fun t => x (u, t)))
        ∂multivariateGaussian 0 T := by
  sorry

/-! ## Layer 4: Sudakov's minoration -/

/-- 4.1 **Sudakov's minoration.** There is an absolute constant `c > 0` such that for every
centred Gaussian vector in `ℝⁿ`, `n ≥ 1`, whose coordinates are pairwise at `L²` distance at
least `ε`, the expected maximum is at least `c ε √(log n)` (Vershynin, Theorem 7.4.1). -/
theorem sudakov_minoration :
    ∃ c : ℝ, 0 < c ∧ ∀ (n : ℕ) [NeZero n] (S : Matrix (Fin n) (Fin n) ℝ), S.PosSemidef →
      ∀ ε : ℝ, (∀ i j, i ≠ j → ε ^ 2 ≤ S i i + S j j - 2 * S i j) →
        c * ε * √(Real.log n) ≤
          ∫ x, univ.sup' univ_nonempty (fun i => x i) ∂multivariateGaussian 0 S := by
  sorry

/-! ## Layer 5: Gaussian matrices -/

/-- 5.0 The `m × n` matrix whose `(i, j)` entry is the coordinate `(i, j)` of a vector of
`EuclideanSpace ℝ (Fin m × Fin n)`; under `stdGaussian` it has independent standard Gaussian
entries. -/
def toMatrix {m n : ℕ} (x : EuclideanSpace ℝ (Fin m × Fin n)) : Matrix (Fin m) (Fin n) ℝ :=
  Matrix.of fun i j => x (i, j)

section L2Operator

open scoped Matrix.Norms.L2Operator

/-- 5.1 **The norm of a Gaussian matrix.** For an `m × n` matrix with independent standard
Gaussian entries, `E ‖G‖ ≤ √m + √n` (Vershynin, Theorem 7.3.1; Davidson–Szarek, Theorem II.13). -/
theorem integral_opNorm_toMatrix_le (m n : ℕ) :
    ∫ x, ‖toMatrix x‖ ∂stdGaussian (EuclideanSpace ℝ (Fin m × Fin n)) ≤ √m + √n := by
  sorry

end L2Operator

/-- 5.2 **Gordon's bound for a subset of the sphere.** For a nonempty set `K` of unit vectors of
`ℝⁿ` and an `m × n` standard Gaussian matrix `G`, `E inf_{u ∈ K} ‖G u‖ ≥ E ‖h‖ - w(K)`, where
`h` is a standard Gaussian vector of `ℝᵐ` and `w(K) = E sup_{u ∈ K} ⟪g, u⟫` is the Gaussian width
of `K`. Proved here from 3.2; for `K` the whole sphere it is the bound in Davidson–Szarek's proof
of Theorem II.13, and the general form is attributed to Gordon. -/
theorem integral_norm_sub_gaussianWidth_le_integral_iInf {m n : ℕ}
    (K : Set (EuclideanSpace ℝ (Fin n))) (hK : K.Nonempty) (hK₁ : K ⊆ Metric.sphere 0 1) :
    (∫ h, ‖h‖ ∂stdGaussian (EuclideanSpace ℝ (Fin m))) -
        ∫ g, ⨆ u : K, ⟪g, (u : EuclideanSpace ℝ (Fin n))⟫ ∂stdGaussian (EuclideanSpace ℝ (Fin n)) ≤
      ∫ x, ⨅ u : K, ‖Matrix.toEuclideanLin (toMatrix x) u‖
        ∂stdGaussian (EuclideanSpace ℝ (Fin m × Fin n)) := by
  sorry

/-- 5.3 **The smallest singular value of a Gaussian matrix.** For `n ≥ 1` and an `m × n` matrix
with independent standard Gaussian entries, `E min_{‖u‖ = 1} ‖G u‖ ≥ √m - √n` (Vershynin,
Exercise 7.3.4; Davidson–Szarek, Theorem II.13). -/
theorem sqrt_sub_sqrt_le_integral_iInf_sphere {m n : ℕ} [NeZero n] :
    √m - √n ≤
      ∫ x, ⨅ u : Metric.sphere (0 : EuclideanSpace ℝ (Fin n)) 1,
          ‖Matrix.toEuclideanLin (toMatrix x) u‖
        ∂stdGaussian (EuclideanSpace ℝ (Fin m × Fin n)) := by
  sorry

end TauCetiRoadmap.GaussianComparisonInequalities

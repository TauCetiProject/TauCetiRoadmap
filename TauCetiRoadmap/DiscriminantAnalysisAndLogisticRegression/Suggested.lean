import Mathlib

/-!
# Discriminant analysis and logistic regression: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here. The README's API lists and Checks are not restated.

Features of a real feature space are points of `EuclideanSpace ℝ ι` for a finite type `ι`; labels
are Booleans, read as `±1` through `labelSign` and as the target `1` or `0` where a least-squares
or probability statement needs it. A labelled sample is `z : Fin n → EuclideanSpace ℝ ι × Bool`.
The labelled two-class model `classModel p Q` draws the label `true` with probability `p` and
then the feature from `Q true` or `Q false`. A function `η` is the posterior probability of the
label `true` exactly when `IsRegressionFunction P η` holds. `labelSign` and `IsRegressionFunction`
are copied verbatim from StatisticalLearningTheory 1.1 and 1.2. Matrices act on
`EuclideanSpace ℝ ι` through `Matrix.toEuclideanLin`, and the inverse is Mathlib's `Matrix.inv`.
-/

noncomputable section

open MeasureTheory ProbabilityTheory Real Set
open scoped RealInnerProductSpace

namespace TauCetiRoadmap.DiscriminantAnalysisAndLogisticRegression

section Copied

variable {X : Type*} [MeasurableSpace X]

/-- 3.1 (copied verbatim from StatisticalLearningTheory 1.1): the sign `±1` of a Boolean label:
`true ↦ 1`, `false ↦ -1`. -/
def labelSign (b : Bool) : ℝ := if b then 1 else -1

/-- 1.1 (copied verbatim from StatisticalLearningTheory 1.2): `η` is a version of the
regression function `x ↦ P(Y = true | X = x)`: measurable, with values in `[0, 1]`, and
integrating to `P(X ∈ A, Y = true)` over every measurable `A`. -/
def IsRegressionFunction (P : Measure (X × Bool)) (η : X → ℝ) : Prop :=
  Measurable η ∧ (∀ x, η x ∈ Icc (0 : ℝ) 1) ∧
    ∀ A : Set X, MeasurableSet A → P.real (A ×ˢ {true}) = ∫ x in A, η x ∂(P.map Prod.fst)

end Copied

/-! ## Layer 1: class-conditional models and their posteriors -/

section Layer1

variable {X : Type*} [MeasurableSpace X]

/-- 1.1 The labelled two-class model: the label is `true` with probability `p` and `false` with
probability `1 - p`, and given the label `b` the feature has law `Q b`. -/
def classModel (p : unitInterval) (Q : Bool → Measure X) : Measure (X × Bool) :=
  unitInterval.toNNReal p • (Q true).map (fun x ↦ (x, true)) +
    unitInterval.toNNReal (unitInterval.symm p) • (Q false).map (fun x ↦ (x, false))

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

/-- 1.2 The quadratic discriminant score of two Gaussian classes, `log (p f₁(x)) - log ((1 - p)
f₀(x))` for the Gaussian densities `f₀`, `f₁` with means `μ₀`, `μ₁` and covariances `S₀`, `S₁`. -/
def qdaScore (p : unitInterval) (μ₀ μ₁ : EuclideanSpace ℝ ι) (S₀ S₁ : Matrix ι ι ℝ)
    (x : EuclideanSpace ℝ ι) : ℝ :=
  log ((p : ℝ) / (1 - p)) - (log S₁.det - log S₀.det) / 2
    - ⟪x - μ₁, S₁⁻¹.toEuclideanLin (x - μ₁)⟫ / 2 + ⟪x - μ₀, S₀⁻¹.toEuclideanLin (x - μ₀)⟫ / 2

/-- 1.2 Quadratic discriminant analysis: for two Gaussian classes with positive definite
covariances and a prior strictly between `0` and `1`, the posterior probability of the label
`true` is the logistic sigmoid of the quadratic discriminant score. -/
theorem isRegressionFunction_sigmoid_qdaScore (p : unitInterval) (hp₀ : 0 < (p : ℝ))
    (hp₁ : (p : ℝ) < 1)
    (μ₀ μ₁ : EuclideanSpace ℝ ι) {S₀ S₁ : Matrix ι ι ℝ} (hS₀ : S₀.PosDef) (hS₁ : S₁.PosDef) :
    IsRegressionFunction
      (classModel p fun b ↦ multivariateGaussian (cond b μ₁ μ₀) (cond b S₁ S₀))
      (fun x ↦ Real.sigmoid (qdaScore p μ₀ μ₁ S₀ S₁ x)) := by
  sorry

/-- 1.3 Linear discriminant analysis: for two Gaussian classes with a common positive definite
covariance `S` and a prior strictly between `0` and `1`, the posterior probability of the label
`true` is `sigmoid (⟪w, x⟫ + w₀)` with `w = S⁻¹ (μ₁ - μ₀)` and
`w₀ = log (p / (1 - p)) - (⟪μ₁, S⁻¹ μ₁⟫ - ⟪μ₀, S⁻¹ μ₀⟫) / 2`. -/
theorem isRegressionFunction_sigmoid_linear (p : unitInterval) (hp₀ : 0 < (p : ℝ))
    (hp₁ : (p : ℝ) < 1)
    (μ₀ μ₁ : EuclideanSpace ℝ ι) {S : Matrix ι ι ℝ} (hS : S.PosDef) :
    IsRegressionFunction (classModel p fun b ↦ multivariateGaussian (cond b μ₁ μ₀) S)
      (fun x ↦ Real.sigmoid (⟪S⁻¹.toEuclideanLin (μ₁ - μ₀), x⟫ + (log ((p : ℝ) / (1 - p)) -
        (⟪μ₁, S⁻¹.toEuclideanLin μ₁⟫ - ⟪μ₀, S⁻¹.toEuclideanLin μ₀⟫) / 2))) := by
  sorry

/-- 1.4 Naive Bayes with binary features: if, given the label `b`, the features are independent
with `P(xⱼ = true) = θ b j` strictly between `0` and `1`, and the prior is strictly between `0`
and `1`, the posterior probability of the label `true` is the sigmoid of the linear function
`∑ⱼ xⱼ wⱼ + w₀` with `wⱼ = log (θ₁ⱼ (1 - θ₀ⱼ) / (θ₀ⱼ (1 - θ₁ⱼ)))` and
`w₀ = log (p / (1 - p)) + ∑ⱼ log ((1 - θ₁ⱼ) / (1 - θ₀ⱼ))`. -/
theorem isRegressionFunction_sigmoid_naiveBayes {d : ℕ} (p : unitInterval) (hp₀ : 0 < (p : ℝ))
    (hp₁ : (p : ℝ) < 1) (θ : Bool → Fin d → unitInterval) (hθ₀ : ∀ b j, 0 < (θ b j : ℝ))
    (hθ₁ : ∀ b j, (θ b j : ℝ) < 1) :
    IsRegressionFunction
      (classModel p fun b ↦ Measure.pi fun j ↦ bernoulliMeasure true false (θ b j))
      (fun x ↦ Real.sigmoid ((∑ j, if x j then
          log ((θ true j : ℝ) * (1 - θ false j) / ((θ false j : ℝ) * (1 - θ true j))) else 0) +
        (log ((p : ℝ) / (1 - p)) +
          ∑ j, log ((1 - (θ true j : ℝ)) / (1 - θ false j))))) := by
  sorry

end Layer1

/-! ## Layer 2: Fisher's linear discriminant -/

section Layer2

variable {ι : Type*} [Fintype ι] [DecidableEq ι] {n : ℕ}

/-- 2.1 The number of sample points with label `b`. -/
def classCount (z : Fin n → EuclideanSpace ℝ ι × Bool) (b : Bool) : ℕ :=
  (Finset.univ.filter fun i ↦ (z i).2 = b).card

/-- 2.1 The mean of the sample points with label `b` (`0` when there is none). -/
def classMean (z : Fin n → EuclideanSpace ℝ ι × Bool) (b : Bool) : EuclideanSpace ℝ ι :=
  ((classCount z b : ℝ)⁻¹) • ∑ i ∈ Finset.univ.filter (fun i ↦ (z i).2 = b), (z i).1

/-- 2.1 The within-class scatter matrix `S_W = ∑ᵢ (xᵢ - m_{yᵢ}) (xᵢ - m_{yᵢ})ᵀ`, the sum of the
scatter matrices of the two classes about their own means. -/
def withinClassScatter (z : Fin n → EuclideanSpace ℝ ι × Bool) : Matrix ι ι ℝ :=
  ∑ i, Matrix.vecMulVec (WithLp.ofLp ((z i).1 - classMean z (z i).2))
    (WithLp.ofLp ((z i).1 - classMean z (z i).2))

/-- 2.1 Fisher's criterion `J(w) = ⟪w, m₁ - m₀⟫² / ⟪w, S_W w⟫`, the generalised Rayleigh quotient
of the between-class matrix `(m₁ - m₀)(m₁ - m₀)ᵀ` and the within-class scatter matrix. -/
def fisherCriterion (z : Fin n → EuclideanSpace ℝ ι × Bool) (w : EuclideanSpace ℝ ι) : ℝ :=
  ⟪w, classMean z true - classMean z false⟫ ^ 2 /
    ⟪w, (withinClassScatter z).toEuclideanLin w⟫

/-- 2.1 Fisher's linear discriminant: if the within-class scatter matrix `S_W` is positive
definite and the feature space is nonzero, the largest value of Fisher's criterion over nonzero
directions is `⟪δ, S_W⁻¹ δ⟫` for `δ = m₁ - m₀`; if moreover `δ ≠ 0`, a nonzero `w` attains it
exactly when `w` is a nonzero multiple of `S_W⁻¹ δ`. -/
theorem fisherCriterion_isGreatest [Nonempty ι] (z : Fin n → EuclideanSpace ℝ ι × Bool)
    (hS : (withinClassScatter z).PosDef) :
    IsGreatest {r : ℝ | ∃ w : EuclideanSpace ℝ ι, w ≠ 0 ∧ fisherCriterion z w = r}
        ⟪classMean z true - classMean z false, (withinClassScatter z)⁻¹.toEuclideanLin
          (classMean z true - classMean z false)⟫ ∧
      (classMean z true - classMean z false ≠ 0 → ∀ w : EuclideanSpace ℝ ι, w ≠ 0 →
        (fisherCriterion z w = ⟪classMean z true - classMean z false,
          (withinClassScatter z)⁻¹.toEuclideanLin (classMean z true - classMean z false)⟫ ↔
          ∃ c : ℝ, c ≠ 0 ∧ w = c • (withinClassScatter z)⁻¹.toEuclideanLin
            (classMean z true - classMean z false))) := by
  sorry

/-- 2.2 Fisher's direction is the least-squares direction: with both classes nonempty, `S_W`
positive definite and the targets `n / n₁` for the label `true` and `-n / n₀` for `false`, the
pair `(w, w₀)` minimizes `∑ᵢ (⟪w, xᵢ⟫ + w₀ - tᵢ)²` exactly when `w = c S_W⁻¹ δ` with
`c = n / (1 + (n₀ n₁ / n) ⟪δ, S_W⁻¹ δ⟫)` and `w₀ = -⟪w, m⟫`, where `δ = m₁ - m₀` and `m` is the
mean of all sample points. -/
theorem leastSquares_isMin_iff (z : Fin n → EuclideanSpace ℝ ι × Bool)
    (h₀ : 0 < classCount z false) (h₁ : 0 < classCount z true)
    (hS : (withinClassScatter z).PosDef) (w : EuclideanSpace ℝ ι) (w₀ : ℝ) :
    (∀ (v : EuclideanSpace ℝ ι) (v₀ : ℝ),
        ∑ i, (⟪w, (z i).1⟫ + w₀ - cond (z i).2 ((n : ℝ) / classCount z true)
          (-(n : ℝ) / classCount z false)) ^ 2 ≤
        ∑ i, (⟪v, (z i).1⟫ + v₀ - cond (z i).2 ((n : ℝ) / classCount z true)
          (-(n : ℝ) / classCount z false)) ^ 2) ↔
      w = ((n : ℝ) / (1 + (classCount z false : ℝ) * classCount z true / n *
          ⟪classMean z true - classMean z false, (withinClassScatter z)⁻¹.toEuclideanLin
            (classMean z true - classMean z false)⟫)) •
          (withinClassScatter z)⁻¹.toEuclideanLin (classMean z true - classMean z false) ∧
        w₀ = -⟪w, ((n : ℝ)⁻¹) • ∑ i, (z i).1⟫ := by
  sorry

end Layer2

/-! ## Layer 3: the logistic log-likelihood -/

section Layer3

variable {ι : Type*} [Fintype ι] {n : ℕ}

/-- 3.1 The logistic log-likelihood of a weight vector `w` on a labelled sample,
`-∑ᵢ log (1 + exp (-yᵢ ⟪w, xᵢ⟫))` with `yᵢ = labelSign` of the label. -/
def logLikelihood (z : Fin n → EuclideanSpace ℝ ι × Bool) (w : EuclideanSpace ℝ ι) : ℝ :=
  -∑ i, log (1 + exp (-(labelSign (z i).2 * ⟪w, (z i).1⟫)))

/-- 3.1 The logistic log-likelihood is concave, and it is strictly concave exactly when the
sample points span the feature space. -/
theorem concaveOn_logLikelihood (z : Fin n → EuclideanSpace ℝ ι × Bool) :
    ConcaveOn ℝ univ (logLikelihood z) ∧
      (StrictConcaveOn ℝ univ (logLikelihood z) ↔
        Submodule.span ℝ (range fun i ↦ (z i).1) = ⊤) := by
  sorry

/-- 3.2 The score equations: the gradient of the log-likelihood at `w` is
`∑ᵢ (tᵢ - sigmoid ⟪w, xᵢ⟫) xᵢ` with `tᵢ = 1` for the label `true` and `0` for `false`, and `w`
is a maximizer exactly when this gradient vanishes. -/
theorem logLikelihood_score (z : Fin n → EuclideanSpace ℝ ι × Bool) (w : EuclideanSpace ℝ ι) :
    HasGradientAt (logLikelihood z)
        (∑ i, (cond (z i).2 1 0 - Real.sigmoid ⟪w, (z i).1⟫) • (z i).1) w ∧
      ((∀ v, logLikelihood z v ≤ logLikelihood z w) ↔
        ∑ i, (cond (z i).2 1 0 - Real.sigmoid ⟪w, (z i).1⟫) • (z i).1 = 0) := by
  sorry

/-- 3.3 Existence of the maximum-likelihood estimate: the log-likelihood attains its supremum
exactly when every direction `b` that classifies no sample point wrongly
(`0 ≤ yᵢ ⟪b, xᵢ⟫` for all `i`) is orthogonal to every sample point. -/
theorem exists_isMax_logLikelihood_iff (z : Fin n → EuclideanSpace ℝ ι × Bool) :
    (∃ w, ∀ v, logLikelihood z v ≤ logLikelihood z w) ↔
      ∀ b : EuclideanSpace ℝ ι, (∀ i, 0 ≤ labelSign (z i).2 * ⟪b, (z i).1⟫) →
        ∀ i, ⟪b, (z i).1⟫ = 0 := by
  sorry

/-- 3.4 Existence and uniqueness (Albert–Anderson): the maximum-likelihood estimate exists and is
unique exactly when the data overlap, that is, no nonzero `b` has `0 ≤ yᵢ ⟪b, xᵢ⟫` for all `i`.
Overlap forces the sample points to span the feature space. -/
theorem existsUnique_isMax_logLikelihood_iff (z : Fin n → EuclideanSpace ℝ ι × Bool) :
    (∃! w, ∀ v, logLikelihood z v ≤ logLikelihood z w) ↔
      ¬∃ b : EuclideanSpace ℝ ι, b ≠ 0 ∧ ∀ i, 0 ≤ labelSign (z i).2 * ⟪b, (z i).1⟫ := by
  sorry

/-- 3.5 Complete separation: the supremum of the log-likelihood is `0` exactly when some `b`
classifies every sample point strictly correctly (`0 < yᵢ ⟪b, xᵢ⟫` for all `i`); otherwise the
log-likelihood is at most `-log 2` everywhere. -/
theorem sSup_logLikelihood_eq_zero_iff (z : Fin n → EuclideanSpace ℝ ι × Bool) :
    ((∃ b : EuclideanSpace ℝ ι, ∀ i, 0 < labelSign (z i).2 * ⟪b, (z i).1⟫) ↔
        sSup (range (logLikelihood z)) = 0) ∧
      ((¬∃ b : EuclideanSpace ℝ ι, ∀ i, 0 < labelSign (z i).2 * ⟪b, (z i).1⟫) →
        ∀ w, logLikelihood z w ≤ -log 2) := by
  sorry

end Layer3

end TauCetiRoadmap.DiscriminantAnalysisAndLogisticRegression

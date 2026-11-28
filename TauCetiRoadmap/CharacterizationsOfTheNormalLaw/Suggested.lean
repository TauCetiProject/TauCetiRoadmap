import Mathlib

/-!
# Characterizations of the normal law: target signatures

The roadmap is `README.md`; this file states its theorems against the pinned Mathlib, each
proof being `sorry`. There are no definitions: "normal" is Mathlib's `HasGaussianLaw` for a
random variable and `IsGaussian` for a law on `ℝ`, which include the point masses.
-/

open MeasureTheory ProbabilityTheory Complex
open scoped ENNReal NNReal Real

namespace TauCetiRoadmap.CharacterizationsOfTheNormalLaw

variable {Ω : Type*} {mΩ : MeasurableSpace Ω} {P : Measure Ω}

/-- 1.1. Cramér's decomposition theorem: for independent `X` and `Y`, `X + Y` is normal if and
only if `X` and `Y` are normal. -/
theorem hasGaussianLaw_add_iff_of_indepFun {X Y : Ω → ℝ} (hX : AEMeasurable X P)
    (hY : AEMeasurable Y P) (hXY : IndepFun X Y P) :
    HasGaussianLaw (fun ω ↦ X ω + Y ω) P ↔ HasGaussianLaw X P ∧ HasGaussianLaw Y P := by
  sorry

/-- 2.1. A tail recursion `N(C x) ≤ q N(x)` for every `q ∈ (0, 1)` and large `x` gives finite
moments of every finite order. -/
theorem memLp_of_tail_le_mul {μ : Measure ℝ} [IsProbabilityMeasure μ] {C : ℝ} (hC : 1 < C)
    (h : ∀ q : ℝ, 0 < q → q < 1 → ∃ x₀ : ℝ, ∀ x, x₀ < x →
      μ.real {y | C * x ≤ |y|} ≤ q * μ.real {y | x ≤ |y|}) :
    ∀ p : ℝ≥0∞, p ≠ ∞ → MemLp id p μ := by
  sorry

/-- 2.2. A characteristic function that is `C^(2k)` near `0` gives a finite moment of order
`2k`. -/
theorem memLp_of_contDiffAt_charFun {μ : Measure ℝ} [IsProbabilityMeasure μ] (k : ℕ)
    (h : ContDiffAt ℝ ((2 * k : ℕ) : WithTop ℕ∞) (charFun μ) 0) :
    MemLp id ((2 * k : ℕ) : ℝ≥0∞) μ := by
  sorry

/-- 2.3. A characteristic function that agrees on `(−R, R)` with a function holomorphic on the
disc of radius `R` gives exponential moments of every order `a < R`, and the extension is
`z ↦ ∫ exp(i z x) dμ` on that disc. -/
theorem integrable_exp_mul_abs_of_charFun_eqOn {μ : Measure ℝ} [IsProbabilityMeasure μ] {R : ℝ}
    {f : ℂ → ℂ} (hf : DifferentiableOn ℂ f (Metric.ball 0 R))
    (hφ : ∀ t : ℝ, |t| < R → charFun μ t = f t) :
    (∀ a : ℝ, 0 ≤ a → a < R → Integrable (fun x ↦ Real.exp (a * |x|)) μ) ∧
      ∀ z : ℂ, ‖z‖ < R → f z = ∫ x, cexp (I * z * x) ∂μ := by
  sorry

/-- 2.4. Marcinkiewicz's theorem: if the characteristic function is `exp ∘ Q` near `0` for a
polynomial `Q`, then `Q` has degree at most two and the law is normal. -/
theorem isGaussian_of_charFun_eq_exp_polynomial {μ : Measure ℝ} [IsProbabilityMeasure μ]
    (Q : Polynomial ℂ) {ε : ℝ} (hε : 0 < ε)
    (h : ∀ t : ℝ, |t| < ε → charFun μ t = cexp (Q.eval (t : ℂ))) :
    Q.natDegree ≤ 2 ∧ IsGaussian μ := by
  sorry

section Probability

variable [IsProbabilityMeasure P]

/-- 3.1. Pólya's theorem: independent identically distributed `X₁, X₂` with `(X₁ + X₂)/√2`
distributed as `X₁` are centered normal. -/
theorem exists_hasLaw_gaussianReal_of_identDistrib_add_div_sqrt_two {X₁ X₂ : Ω → ℝ}
    (hind : IndepFun X₁ X₂ P) (hid : IdentDistrib X₁ X₂ P P)
    (hstab : IdentDistrib (fun ω ↦ (X₁ ω + X₂ ω) / √2) X₁ P P) :
    ∃ v : ℝ≥0, HasLaw X₁ (gaussianReal 0 v) P := by
  sorry

/-- 3.2. The Herschel–Maxwell theorem: for `n ≥ 2` and independent coordinates, the law of `X`
is invariant under all linear isometries if and only if the coordinates are centered normal
with a common variance. -/
theorem map_linearIsometryEquiv_comp_eq_iff {n : ℕ} (hn : 2 ≤ n)
    {X : Ω → EuclideanSpace ℝ (Fin n)} (hX : AEMeasurable X P)
    (hind : iIndepFun (fun i ω ↦ X ω i) P) :
    (∀ L : EuclideanSpace ℝ (Fin n) ≃ₗᵢ[ℝ] EuclideanSpace ℝ (Fin n),
        P.map (fun ω ↦ L (X ω)) = P.map X) ↔
      ∃ v : ℝ≥0, ∀ i, HasLaw (fun ω ↦ X ω i) (gaussianReal 0 v) P := by
  sorry

/-- 4.1. The Darmois–Skitovich theorem: if two linear forms with nonzero coefficients in
independent variables are independent, every variable is normal. -/
theorem hasGaussianLaw_of_indepFun_sum_mul {ι : Type*} [Fintype ι] {X : ι → Ω → ℝ}
    (hX : ∀ i, AEMeasurable (X i) P) (hind : iIndepFun X P) {a b : ι → ℝ}
    (ha : ∀ i, a i ≠ 0) (hb : ∀ i, b i ≠ 0)
    (h : IndepFun (fun ω ↦ ∑ i, a i * X i ω) (fun ω ↦ ∑ i, b i * X i ω) P) :
    ∀ i, HasGaussianLaw (X i) P := by
  sorry

/-- 4.2. The Kac–Bernstein theorem: for independent `X₁, X₂`, the sum and the difference are
independent if and only if both are normal with equal variances. -/
theorem indepFun_add_sub_iff {X₁ X₂ : Ω → ℝ} (h₁ : AEMeasurable X₁ P) (h₂ : AEMeasurable X₂ P)
    (hind : IndepFun X₁ X₂ P) :
    IndepFun (fun ω ↦ X₁ ω + X₂ ω) (fun ω ↦ X₁ ω - X₂ ω) P ↔
      HasGaussianLaw X₁ P ∧ HasGaussianLaw X₂ P ∧ Var[X₁; P] = Var[X₂; P] := by
  sorry

/-- 5.1. For `n ≥ 2` independent identically distributed observations, independence of the
sample mean and the sum of squared deviations forces a normal law. -/
theorem hasGaussianLaw_of_indepFun_sampleMean_sumSq {n : ℕ} (hn : 2 ≤ n) {X : Fin n → Ω → ℝ}
    (hind : iIndepFun X P) (hid : ∀ i j, IdentDistrib (X i) (X j) P P)
    (h : IndepFun (fun ω ↦ (∑ i, X i ω) / n)
      (fun ω ↦ ∑ i, (X i ω - (∑ j, X j ω) / n) ^ 2) P) :
    ∀ i, HasGaussianLaw (X i) P := by
  sorry

/-- 5.2. Lukacs' characterization: for independent positive `X, Y` with `X` not almost surely
constant, `X/(X + Y)` is independent of `X + Y` if and only if both are gamma laws with a
common rate. -/
theorem indepFun_div_add_add_iff {X Y : Ω → ℝ} (hX : AEMeasurable X P) (hY : AEMeasurable Y P)
    (hXpos : ∀ᵐ ω ∂P, 0 < X ω) (hYpos : ∀ᵐ ω ∂P, 0 < Y ω)
    (hXnd : ∀ c : ℝ, ¬ X =ᵐ[P] fun _ ↦ c) (hind : IndepFun X Y P) :
    IndepFun (fun ω ↦ X ω / (X ω + Y ω)) (fun ω ↦ X ω + Y ω) P ↔
      ∃ a b r : ℝ, 0 < a ∧ 0 < b ∧ 0 < r ∧
        HasLaw X (gammaMeasure a r) P ∧ HasLaw Y (gammaMeasure b r) P := by
  sorry

end Probability

end TauCetiRoadmap.CharacterizationsOfTheNormalLaw

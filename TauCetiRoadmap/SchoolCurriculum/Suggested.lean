import Mathlib

/-!
# Named theorems of the secondary-school curriculum: suggested signatures

**This file is not the roadmap and is not exhaustive.** `README.md` is definitive. It records
suggested Lean forms for particular milestones of Layers 1–6; discharging every statement here
does not finish a layer. Each statement is written with Mathlib's own vocabulary
(`Real.digits`, `ArithmeticFunction.carmichael`, `MeasureTheory.volume`, `ProbabilityTheory.binomial`,
`Metric.infDist`) and introduces no private predicate.
-/

noncomputable section

open MeasureTheory Filter Topology

namespace TauCetiRoadmap.SchoolCurriculum

/-! ### Layer 1: expansions of rationals in an integer base -/

/-- **Layer 1.** The digits of a nonnegative rational in base `b ≥ 2` are eventually periodic. -/
theorem digits_ratCast_eventually_periodic (b : ℕ) [NeZero b] (hb : 2 ≤ b) (q : ℚ) (hq : 0 ≤ q) :
    ∃ p > 0, ∃ n₀ : ℕ, ∀ n ≥ n₀, Real.digits (q : ℝ) b (n + p) = Real.digits (q : ℝ) b n := by
  sorry

/-! ### Layer 2: powers modulo a squarefree number, and RSA -/

/-- **Layer 2.** For a squarefree `n`, `a ^ (k * λ(n) + 1) ≡ a (mod n)` for every `a`, with no
coprimality hypothesis. -/
theorem pow_mul_carmichael_add_one_modEq {n : ℕ} (hn : Squarefree n) (a k : ℕ) :
    a ^ (k * ArithmeticFunction.carmichael n + 1) ≡ a [MOD n] := by
  sorry

/-- **Layer 2.** RSA decryption inverts encryption for every message, coprime to the modulus
or not. -/
theorem rsa_decrypt_encrypt {p q : ℕ} (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q) {e d : ℕ}
    (hed : e * d ≡ 1 [MOD (p - 1) * (q - 1)]) (m : ℕ) : (m ^ e) ^ d ≡ m [MOD p * q] := by
  sorry

/-! ### Layer 3: Lebesgue measure of solids in `ℝ × ℝ × ℝ` -/

/-- **Layer 3.** Disc method: a solid of revolution about the first axis of `ℝ × ℝ × ℝ`. -/
theorem volume_solidOfRevolution {f : ℝ → ℝ} {a b : ℝ} (hab : a ≤ b)
    (hf : ContinuousOn f (Set.Icc a b)) (hf₀ : ∀ x ∈ Set.Icc a b, 0 ≤ f x) :
    volume {p : ℝ × ℝ × ℝ | p.1 ∈ Set.Icc a b ∧ p.2.1 ^ 2 + p.2.2 ^ 2 ≤ f p.1 ^ 2} =
      ENNReal.ofReal (Real.pi * ∫ x in a..b, f x ^ 2) := by
  sorry

/-- **Layer 3.** A cone of base radius `R` and height `H`, axis along the last coordinate. -/
theorem volume_cone {R H : ℝ} (hR : 0 < R) (hH : 0 < H) :
    volume {p : ℝ × ℝ × ℝ | 0 ≤ p.2.2 ∧ p.2.2 ≤ H ∧
        p.1 ^ 2 + p.2.1 ^ 2 ≤ (R * (1 - p.2.2 / H)) ^ 2} =
      ENNReal.ofReal (Real.pi * R ^ 2 * H / 3) := by
  sorry

/-! ### Layer 4: adjacent sequences -/

/-- **Layer 4.** Adjacent sequences converge to a common limit. -/
theorem exists_tendsto_of_monotone_antitone {u v : ℕ → ℝ} (hu : Monotone u) (hv : Antitone v)
    (h : Tendsto (fun n => v n - u n) atTop (𝓝 0)) :
    ∃ l : ℝ, Tendsto u atTop (𝓝 l) ∧ Tendsto v atTop (𝓝 l) := by
  sorry

/-! ### Layer 5: the normal approximation of the binomial law -/

/-- **Layer 5.** de Moivre–Laplace: the standardised binomial law converges to `𝒩(0, 1)`. -/
theorem tendsto_binomial_cdf {p : unitInterval} (hp : 0 < (p : ℝ)) (hp1 : (p : ℝ) < 1) (x : ℝ) :
    Tendsto (fun n : ℕ => (ProbabilityTheory.binomial n p
        {k : ℕ | ((k : ℝ) - n * p) / Real.sqrt (n * (p : ℝ) * (1 - p)) ≤ x}).toReal)
      atTop (𝓝 (ProbabilityTheory.cdf (ProbabilityTheory.gaussianReal 0 1) x)) := by
  sorry

/-! ### Layer 6: distance from a point to an affine hyperplane -/

/-- **Layer 6.** The distance from `m` to `{x | ⟪n, x - a⟫ = 0}` is `|⟪n, m - a⟫| / ‖n‖`. -/
theorem infDist_setOf_inner_sub_eq_zero {E : Type*} [NormedAddCommGroup E]
    [InnerProductSpace ℝ E] {n : E} (hn : n ≠ 0) (a m : E) :
    Metric.infDist m {x : E | inner ℝ n (x - a) = (0 : ℝ)} = |inner ℝ n (m - a)| / ‖n‖ := by
  sorry

end TauCetiRoadmap.SchoolCurriculum

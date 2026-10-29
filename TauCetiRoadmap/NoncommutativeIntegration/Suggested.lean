/-
Copyright (c) 2026 Kim Morrison. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib

/-!
# Noncommutative integration and martingale inequalities: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, on the only carrier
available at the pins: the matrix algebra `CStarMatrix (Fin d) (Fin d) ℂ` with its unnormalized
trace, which is the Haagerup Lp space of `M_d(ℂ)`. The constants are uniform in `d` and in the
number of terms, which is the content of the finite-dimensional case of each theorem.

Stated here: the noncommutative Khintchine inequalities for `2 ≤ p` (README §7.5), for
`1 ≤ p < 2` (README §7.5) and at `p = 1` with the constant `(√3)⁻¹` (README §6.3), and the
Ball–Carlen–Lieb inequalities for `1 < p ≤ 2` and for `2 ≤ p` (README §5.5).

Not statable at the pins, because neither Mathlib nor Tau Ceti has a trace on a von Neumann
algebra, τ-measurable operators, or `Lp(M)` for a von Neumann algebra (Mathlib has only the
carriers `VonNeumannAlgebra` and `WStarAlgebra`): Haagerup's reduction theorem (§5.3), the
Lp–Lq duality and interpolation isomorphisms (§§2.1, 2.5), the Haagerup Lp construction and its
weight independence (§§3.1–3.5), Kosaki's interpolation theorem (§4.1), Burkholder–Gundy and
Stein's inequality (§7.3), the UMD property of `Lp(M)` (§8.3), and the H¹–BMO duality (§8.4).
-/

noncomputable section
open scoped BigOperators ComplexOrder NNReal CStarAlgebra

namespace TauCetiRoadmap.NoncommutativeIntegration

section Matrices
variable {d n : ℕ}

-- Explicitly use the existing real calculus when matrix scalar instances compete.
local instance (d : ℕ) :
    NonUnitalContinuousFunctionalCalculus ℝ (CStarMatrix (Fin d) (Fin d) ℂ)
      IsSelfAdjoint := IsSelfAdjoint.instNonUnitalContinuousFunctionalCalculus

local instance (d : ℕ) : NonnegSpectrumClass ℝ (CStarMatrix (Fin d) (Fin d) ℂ) :=
  CStarAlgebra.instNonnegSpectrumClass'

/-- The Schatten `p`-gauge `tr(|x|^p)^(1/p)` of a `d × d` matrix with the unnormalized trace
(README §1.5 and §6.1); `p` is positive in every theorem. -/
def matrixLpGauge (p : ℝ≥0) (x : CStarMatrix (Fin d) (Fin d) ℂ) : ℝ :=
  (Matrix.trace (CStarMatrix.ofMatrix.symm
    (CFC.nnrpow (CFC.sqrt (star x * x)) p))).re ^ (1 / (p : ℝ))

/-- The column square function `(∑ a_k* a_k)^(1/2)` of a finite sequence (README §6.1). -/
def columnSquare (a : Fin n → CStarMatrix (Fin d) (Fin d) ℂ) :
    CStarMatrix (Fin d) (Fin d) ℂ :=
  CFC.sqrt (∑ k, star (a k) * a k)

/-- The row square function `(∑ a_k a_k*)^(1/2)` of a finite sequence (README §6.1). -/
def rowSquare (a : Fin n → CStarMatrix (Fin d) (Fin d) ℂ) :
    CStarMatrix (Fin d) (Fin d) ℂ :=
  CFC.sqrt (∑ k, a k * star (a k))

/-- The random-sum norm `(E ‖∑ ε_k a_k‖_p^p)^(1/p)` for independent symmetric signs, with the
uniform measure on the finite sign cube (README §6.2). -/
def randomSumGauge (p : ℝ≥0) (a : Fin n → CStarMatrix (Fin d) (Fin d) ℂ) : ℝ :=
  ((∑ ε : Fin n → Bool,
      matrixLpGauge p (∑ k, (if ε k then (1 : ℂ) else -1) • a k) ^ (p : ℝ)) /
    (Fintype.card (Fin n → Bool) : ℝ)) ^ (1 / (p : ℝ))

/-- The sum norm `inf_(a = b + c) (C_p(b) + R_p(c))` of the row/column sum space
`Lp(M; ℓ²_C) + Lp(M; ℓ²_R)` (README §6.1), on finite sequences of matrices. -/
def rowColumnSumGauge (p : ℝ≥0) (a : Fin n → CStarMatrix (Fin d) (Fin d) ℂ) : ℝ :=
  sInf {r : ℝ | ∃ b c : Fin n → CStarMatrix (Fin d) (Fin d) ℂ, a = b + c ∧
    r = matrixLpGauge p (columnSquare b) + matrixLpGauge p (rowSquare c)}

/-- Noncommutative Khintchine for `2 ≤ p < ∞` (README §7.5; Pisier–Xu 1997, Theorem 2.8, and
Pisier, GT, Theorem 9.5 for the lower constant 1): one upper constant works for every number of
signs and every matrix size. -/
theorem matrix_khintchine_high {p : ℝ≥0} (hp : 2 ≤ p) :
    ∃ B : ℝ, 0 < B ∧ ∀ (d n : ℕ)
      (a : Fin n → CStarMatrix (Fin d) (Fin d) ℂ),
      let S := max (matrixLpGauge p (columnSquare a))
        (matrixLpGauge p (rowSquare a))
      S ≤ randomSumGauge p a ∧ randomSumGauge p a ≤ B * S := by
  sorry

/-- Noncommutative Khintchine for `1 ≤ p < 2` (README §7.5 for `1 < p < 2` and §6.3 at `p = 1`;
Pisier–Xu 1997, Theorem 2.8, and Pisier, GT, Theorem 9.5 for the upper constant 1): the
random-sum norm is equivalent to the row/column sum norm with a lower constant depending only
on `p`. -/
theorem matrix_khintchine_low {p : ℝ≥0} (hp₁ : 1 ≤ p) (hp₂ : p < 2) :
    ∃ A : ℝ, 0 < A ∧ ∀ (d n : ℕ)
      (a : Fin n → CStarMatrix (Fin d) (Fin d) ℂ),
      A * rowColumnSumGauge p a ≤ randomSumGauge p a ∧
        randomSumGauge p a ≤ rowColumnSumGauge p a := by
  sorry

/-- The `p = 1` Khintchine inequality with the explicit constant `3^(-1/2)` (README §6.3;
Haagerup–Musat 2007, Theorem 2.11; Pisier, GT, Theorem 9.1 and its proof). -/
theorem matrix_khintchine_one (d n : ℕ) (a : Fin n → CStarMatrix (Fin d) (Fin d) ℂ) :
    (Real.sqrt 3)⁻¹ * rowColumnSumGauge 1 a ≤ randomSumGauge 1 a ∧
      randomSumGauge 1 a ≤ rowColumnSumGauge 1 a := by
  sorry

/-- Ball–Carlen–Lieb for `1 < p ≤ 2` (README §5.5; Ricard–Xu, Theorem 2; Ball–Carlen–Lieb 1994
for the Schatten case): `(‖x+y‖_p² + ‖x−y‖_p²)/2 ≥ ‖x‖_p² + (p−1)‖y‖_p²`. -/
theorem matrix_ball_carlen_lieb_low {p : ℝ≥0} (hp₁ : 1 < p) (hp₂ : p ≤ 2) (d : ℕ)
    (x y : CStarMatrix (Fin d) (Fin d) ℂ) :
    matrixLpGauge p x ^ 2 + ((p : ℝ) - 1) * matrixLpGauge p y ^ 2 ≤
      (matrixLpGauge p (x + y) ^ 2 + matrixLpGauge p (x - y) ^ 2) / 2 := by
  sorry

/-- Ball–Carlen–Lieb for `2 ≤ p < ∞` (README §5.5; Ricard–Xu, Theorem 2): the inequality of
`matrix_ball_carlen_lieb_low` reversed, `(‖x+y‖_p² + ‖x−y‖_p²)/2 ≤ ‖x‖_p² + (p−1)‖y‖_p²`. -/
theorem matrix_ball_carlen_lieb_high {p : ℝ≥0} (hp : 2 ≤ p) (d : ℕ)
    (x y : CStarMatrix (Fin d) (Fin d) ℂ) :
    (matrixLpGauge p (x + y) ^ 2 + matrixLpGauge p (x - y) ^ 2) / 2 ≤
      matrixLpGauge p x ^ 2 + ((p : ℝ) - 1) * matrixLpGauge p y ^ 2 := by
  sorry

end Matrices
end TauCetiRoadmap.NoncommutativeIntegration

import Mathlib

/-!
# Nevanlinna–Pick interpolation: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here. The README's remaining API lists and Checks are not
restated.

A Schur function is a function `f : ℂ → ℂ` that is holomorphic on the open unit disc
`ball 0 1` and maps it into the closed unit disc; its values off the disc play no role, and every
conclusion about it is an equality on the disc. The Schur step of `f` is
`(f z - f 0) / (z * (1 - conj (f 0) * f z))` for `z ≠ 0`, with the value `f' 0 / (1 - |f 0|²)`
at `0`; with Lean's division by zero it is `0` on the disc when `|f 0| = 1`. Matrices are
positive definite or semidefinite in Mathlib's sense, which includes being Hermitian, and complex
numbers carry the order in which `0 ≤ z` means that `z` is real and nonnegative.
-/

noncomputable section

open Complex Metric Set Matrix ComplexConjugate
open scoped ComplexOrder

namespace TauCetiRoadmap.NevanlinnaPickInterpolation

/-! ## Layer 1: Schur functions and the Schur step -/

/-- 1.1 A Schur function: holomorphic on the open unit disc, with values in the closed unit
disc there. -/
def IsSchurFunction (f : ℂ → ℂ) : Prop :=
  DifferentiableOn ℂ f (ball 0 1) ∧ MapsTo f (ball 0 1) (closedBall 0 1)

/-- 1.2 The Schur step `f₁` of `f`, defined by `f z = (f 0 + z f₁ z) / (1 + conj (f 0) z f₁ z)`:
`(f z - f 0) / (z (1 - conj (f 0) f z))` for `z ≠ 0` and its limit `f' 0 / (1 - |f 0|²)` at `0`. -/
def schurStep (f : ℂ → ℂ) (z : ℂ) : ℂ :=
  if z = 0 then deriv f 0 / (1 - conj (f 0) * f 0)
  else (f z - f 0) / (z * (1 - conj (f 0) * f z))

/-- 1.3 The inverse Schur step `z ↦ (γ + z g z) / (1 + conj γ z g z)`. -/
def schurUnstep (γ : ℂ) (g : ℂ → ℂ) (z : ℂ) : ℂ :=
  (γ + z * g z) / (1 + conj γ * z * g z)

/-- 1.2 The Schur step of a Schur function is a Schur function. (When `|f 0| = 1`, `f` is constant
on the disc and its Schur step is `0` there.) -/
theorem isSchurFunction_schurStep {f : ℂ → ℂ} (hf : IsSchurFunction f) :
    IsSchurFunction (schurStep f) := by
  sorry

/-- 1.3 For `|γ| < 1` and a Schur function `g`, the inverse step `schurUnstep γ g` is a Schur
function with value `γ` at `0`, and its Schur step is `g` on the disc. -/
theorem isSchurFunction_schurUnstep {γ : ℂ} (hγ : ‖γ‖ < 1) {g : ℂ → ℂ}
    (hg : IsSchurFunction g) :
    IsSchurFunction (schurUnstep γ g) ∧ schurUnstep γ g 0 = γ ∧
      EqOn (schurStep (schurUnstep γ g)) g (ball 0 1) := by
  sorry

/-! ## Layer 2: Schur parameters and Schur's theorem -/

/-- 2.1 The `n`-th Schur parameter `γₙ(f)`: the value at `0` of the `n`-th Schur iterate. -/
def schurParam (f : ℂ → ℂ) (n : ℕ) : ℂ :=
  (schurStep^[n] f) 0

/-- 2.1 The sequences of Schur parameters: either every term lies in the open disc, or the terms
before some index `N` do, the term at `N` has modulus one, and every later term is `0`. -/
def IsSchurSequence (γ : ℕ → ℂ) : Prop :=
  (∀ n, ‖γ n‖ < 1) ∨ ∃ N, (∀ n < N, ‖γ n‖ < 1) ∧ ‖γ N‖ = 1 ∧ ∀ n, N < n → γ n = 0

/-- 2.4 `f` is a finite Blaschke product of degree `n` on the disc:
`f z = c ∏ (z - aᵢ) / (1 - conj aᵢ z)` there, with `|c| = 1` and `n` zeros `aᵢ` in the disc. -/
def IsFiniteBlaschkeProduct (f : ℂ → ℂ) (n : ℕ) : Prop :=
  ∃ (c : ℂ) (a : Fin n → ℂ), ‖c‖ = 1 ∧ (∀ i, ‖a i‖ < 1) ∧
    EqOn f (fun z ↦ c * ∏ i, (z - a i) / (1 - conj (a i) * z)) (ball 0 1)

/-- 2.1 The Schur parameters of a Schur function form a Schur sequence. -/
theorem isSchurSequence_schurParam {f : ℂ → ℂ} (hf : IsSchurFunction f) :
    IsSchurSequence (schurParam f) := by
  sorry

/-- 2.2 Schur's theorem, uniqueness: two Schur functions with the same Schur parameters agree on
the disc. -/
theorem eqOn_of_schurParam_eq {f g : ℂ → ℂ} (hf : IsSchurFunction f) (hg : IsSchurFunction g)
    (h : schurParam f = schurParam g) : EqOn f g (ball 0 1) := by
  sorry

/-- 2.3 Schur's theorem, existence: every Schur sequence is the sequence of Schur parameters of a
Schur function. -/
theorem exists_isSchurFunction_schurParam_eq {γ : ℕ → ℂ} (hγ : IsSchurSequence γ) :
    ∃ f, IsSchurFunction f ∧ schurParam f = γ := by
  sorry

/-- 2.4 A Schur function is a finite Blaschke product of degree `n` if and only if its Schur
parameters `γ₀, …, γₙ₋₁` lie in the open disc and `γₙ` has modulus one. -/
theorem isFiniteBlaschkeProduct_iff_schurParam {f : ℂ → ℂ} (hf : IsSchurFunction f) (n : ℕ) :
    IsFiniteBlaschkeProduct f n ↔ ‖schurParam f n‖ = 1 ∧ ∀ k < n, ‖schurParam f k‖ < 1 := by
  sorry

/-! ## Layer 3: Pick's theorem -/

/-- 3.1 The Pick matrix of nodes `z` and values `w`: entry `(1 - wᵢ conj wⱼ) / (1 - zᵢ conj zⱼ)`
in row `i` and column `j`. -/
def pickMatrix {n : ℕ} (z w : Fin n → ℂ) : Matrix (Fin n) (Fin n) ℂ :=
  Matrix.of fun i j ↦ (1 - w i * conj (w j)) / (1 - z i * conj (z j))

/-- 3.1 Pick's theorem. For nodes `z₁, …, zₙ` in the open disc (not necessarily distinct) and
values `w₁, …, wₙ`, a Schur function with `f zᵢ = wᵢ` exists if and only if the Pick matrix is
positive semidefinite. -/
theorem exists_isSchurFunction_interpolating_iff {n : ℕ} {z : Fin n → ℂ}
    (hz : ∀ i, ‖z i‖ < 1) (w : Fin n → ℂ) :
    (∃ f, IsSchurFunction f ∧ ∀ i, f (z i) = w i) ↔ (pickMatrix z w).PosSemidef := by
  sorry

/-- 3.2 For distinct nodes in the open disc, any two Schur interpolants agree on the disc if and
only if the Pick matrix is not positive definite. -/
theorem interpolant_unique_iff_not_posDef {n : ℕ} {z : Fin n → ℂ} (hz : ∀ i, ‖z i‖ < 1)
    (hinj : Function.Injective z) (w : Fin n → ℂ) :
    (∀ f g, IsSchurFunction f → IsSchurFunction g → (∀ i, f (z i) = w i) →
        (∀ i, g (z i) = w i) → EqOn f g (ball 0 1)) ↔
      ¬(pickMatrix z w).PosDef := by
  sorry

/-- 3.3 For distinct nodes in the open disc and a Pick matrix that is not positive definite, every
Schur interpolant is a finite Blaschke product whose degree is the rank of the Pick matrix. -/
theorem isFiniteBlaschkeProduct_rank_pickMatrix {n : ℕ} {z : Fin n → ℂ}
    (hz : ∀ i, ‖z i‖ < 1) (hinj : Function.Injective z) {w : Fin n → ℂ}
    (hP : ¬(pickMatrix z w).PosDef) {f : ℂ → ℂ} (hf : IsSchurFunction f)
    (hfw : ∀ i, f (z i) = w i) :
    IsFiniteBlaschkeProduct f (pickMatrix z w).rank := by
  sorry

/-- 3.4 A function is a Schur function if and only if its Pick matrix at every finite family of
points of the open disc is positive semidefinite. -/
theorem isSchurFunction_iff_forall_posSemidef_pickMatrix (f : ℂ → ℂ) :
    IsSchurFunction f ↔
      ∀ (n : ℕ) (z : Fin n → ℂ), (∀ i, ‖z i‖ < 1) → (pickMatrix z (f ∘ z)).PosSemidef := by
  sorry

/-! ## Layer 4: the Carathéodory–Fejér problem for Schur functions -/

/-- 4.1 The lower triangular Toeplitz matrix of `c₀, …, cₙ`: entry `c (i - j)` in row `i` and
column `j` when `j ≤ i`, and `0` above the diagonal. -/
def coeffToeplitz (c : ℕ → ℂ) (n : ℕ) : Matrix (Fin (n + 1)) (Fin (n + 1)) ℂ :=
  Matrix.of fun i j ↦ if j ≤ i then c ((i : ℕ) - j) else 0

/-- 4.1 The Carathéodory–Fejér theorem in Schur's form. A Schur function whose Taylor
coefficients at `0` of orders `0, …, n` are `c₀, …, cₙ` exists if and only if the lower triangular
Toeplitz matrix `T` of these numbers is a contraction, that is, `1 - Tᴴ T` is positive
semidefinite. -/
theorem exists_isSchurFunction_taylorCoeff_iff (c : ℕ → ℂ) (n : ℕ) :
    (∃ f, IsSchurFunction f ∧ ∀ k ≤ n, iteratedDeriv k f 0 / (k.factorial : ℂ) = c k) ↔
      (1 - (coeffToeplitz c n)ᴴ * coeffToeplitz c n).PosSemidef := by
  sorry

/-- 4.2 Any two Schur functions with Taylor coefficients `c₀, …, cₙ` agree on the disc if and only
if `1 - Tᴴ T` is not positive definite. -/
theorem taylorCoeff_interpolant_unique_iff_not_posDef (c : ℕ → ℂ) (n : ℕ) :
    (∀ f g, IsSchurFunction f → IsSchurFunction g →
        (∀ k ≤ n, iteratedDeriv k f 0 / (k.factorial : ℂ) = c k) →
        (∀ k ≤ n, iteratedDeriv k g 0 / (k.factorial : ℂ) = c k) → EqOn f g (ball 0 1)) ↔
      ¬(1 - (coeffToeplitz c n)ᴴ * coeffToeplitz c n).PosDef := by
  sorry

/-- 4.3 If `1 - Tᴴ T` is not positive definite, every Schur function with Taylor coefficients
`c₀, …, cₙ` is a finite Blaschke product whose degree is the rank of `1 - Tᴴ T`. -/
theorem isFiniteBlaschkeProduct_rank_coeffToeplitz {c : ℕ → ℂ} {n : ℕ}
    (hP : ¬(1 - (coeffToeplitz c n)ᴴ * coeffToeplitz c n).PosDef) {f : ℂ → ℂ}
    (hf : IsSchurFunction f) (hc : ∀ k ≤ n, iteratedDeriv k f 0 / (k.factorial : ℂ) = c k) :
    IsFiniteBlaschkeProduct f (1 - (coeffToeplitz c n)ᴴ * coeffToeplitz c n).rank := by
  sorry

end TauCetiRoadmap.NevanlinnaPickInterpolation

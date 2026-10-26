import Mathlib
import TauCeti.Analysis.Sobolev.Wkp.Basic

/-!
# Polynomial approximation in Sobolev spaces: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular items, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a milestone nor the roadmap.
-/

noncomputable section

open MeasureTheory TopologicalSpace TauCeti
open scoped ENNReal ContDiff

namespace TauCetiRoadmap.SobolevPolynomialApproximation

/-- The Euclidean space `ℝⁿ` of the roadmap. -/
abbrev E (n : ℕ) := EuclideanSpace ℝ (Fin n)

/-! ### Polynomials (Standing setting) -/

/-- Evaluation of multivariate polynomials as functions on `ℝⁿ`. -/
def evalₗ (n : ℕ) : MvPolynomial (Fin n) ℝ →ₗ[ℝ] (E n → ℝ) where
  toFun q x := MvPolynomial.eval (fun i => x i) q
  map_add' q r := by ext x; simp
  map_smul' c q := by ext x; simp

/-- Polynomial functions of total degree `≤ m` on `ℝⁿ`. -/
def polynomialsDegLE (n m : ℕ) : Submodule ℝ (E n → ℝ) :=
  (MvPolynomial.restrictTotalDegree (Fin n) ℝ m).map (evalₗ n)

theorem injective_evalₗ (n : ℕ) : Function.Injective (evalₗ n) := sorry

theorem finrank_polynomialsDegLE (n m : ℕ) :
    Module.finrank ℝ (polynomialsDegLE n m) = (n + m).choose n := sorry

/-- Euler's identity route to the polynomial Poincaré lemma (README, item 2). -/
theorem homogeneousComponent_pderiv {n : ℕ} (d : ℕ) (i : Fin n) (R : MvPolynomial (Fin n) ℝ) :
    MvPolynomial.homogeneousComponent d (MvPolynomial.pderiv i R) =
      MvPolynomial.pderiv i (MvPolynomial.homogeneousComponent (d + 1) R) := sorry

/-- **Polynomial Poincaré lemma** (README, item 2). -/
theorem exists_pderiv_eq {n m : ℕ} (P : Fin n → MvPolynomial (Fin n) ℝ)
    (hP : ∀ i, P i ∈ MvPolynomial.restrictTotalDegree (Fin n) ℝ m)
    (hclosed : ∀ i j, MvPolynomial.pderiv j (P i) = MvPolynomial.pderiv i (P j)) :
    ∃ Q ∈ MvPolynomial.restrictTotalDegree (Fin n) ℝ (m + 1),
      ∀ i, MvPolynomial.pderiv i Q = P i := sorry

/-! ### Derivatives, seminorms and change of exponent (Milestone 1) -/

variable {n : ℕ} {Ω : Opens (E n)} {p : ℝ≥0∞} [Fact (1 ≤ p)]

/-- The iterate of `Wkp.lowerOrderL` (README, item 1). -/
def Wkp.toOrderL {j k : ℕ} (h : j ≤ k) : Wkp volume Ω p k →L[ℝ] Wkp volume Ω p j := sorry

/-- The seminorms `|u|_{j,p}`, `j ≤ k`, on `W^{k,p}(Ω)` (README, item 1). -/
def seminorm (k : ℕ) : (j : ℕ) → j ≤ k → Wkp volume Ω p k → ℝ
  | 0, _, u => ‖Wkp.value k u‖
  | j + 1, h, u => ‖Wkp.iteratedGradient j (Wkp.toOrderL h u)‖

/-- The comparison with Tau Ceti's norm (README, item 1). -/
theorem norm_le_sqrt_two_mul {k : ℕ} (hk : 1 ≤ k) (u : Wkp volume Ω p k) :
    ‖u‖ ≤ √2 * √(∑ j : Fin (k + 1), seminorm k j j.is_le u ^ 2) := sorry

theorem sqrt_le_sqrt_two_mul_norm {k : ℕ} (hk : 1 ≤ k) (u : Wkp volume Ω p k) :
    √(∑ j : Fin (k + 1), seminorm k j j.is_le u ^ 2) ≤ √2 * ‖u‖ := sorry

/-- Change of exponent on a domain of finite measure, generalizing `TauCeti.W1p.ofExponentLE`
(README, item 1). -/
def Wkp.ofExponentLE {q : ℝ≥0∞} [Fact (1 ≤ q)] [IsFiniteMeasure (volume.restrict (Ω : Set (E n)))]
    (hpq : p ≤ q) {k : ℕ} : Wkp volume Ω q k →L[ℝ] Wkp volume Ω p k := sorry

/-- Polynomials of degree `≤ m` as elements of `W^{k,p}(Ω)` on a bounded domain. -/
def Wkp.ofPolynomialL (hΩ : Bornology.IsBounded (Ω : Set (E n))) (k m : ℕ) :
    polynomialsDegLE n m →L[ℝ] Wkp volume Ω p k := sorry

/-- **Kernel of the top seminorm** (README, item 3). -/
theorem seminorm_top_eq_zero_iff (hΩ : IsPreconnected (Ω : Set (E n))) {m : ℕ}
    (u : Wkp volume Ω p (m + 1)) :
    seminorm (m + 1) (m + 1) le_rfl u = 0 ↔
      ∃ q ∈ polynomialsDegLE n m, (Wkp.value (m + 1) u : E n → ℝ) =ᵐ[volume.restrict Ω] q :=
  sorry

/-! ### The averaged Taylor polynomial and Bramble–Hilbert (Milestones 3 and 4) -/

/-- The averaged Taylor polynomial of degree `≤ m` with cutoff `φ` (README, item 9). -/
def averagedTaylorL (φ : E n → ℝ) (m : ℕ) :
    Wkp volume Ω p m →L[ℝ] polynomialsDegLE n m := sorry

/-- **Bramble–Hilbert** (README, item 11): the constant depends only on `n, m, p` and a bound
`γ` for the chunkiness `diam Ω / ρ`, and on the cutoff only through `∫ φ = 1` and its sup bound. -/
theorem exists_bramble_hilbert (n m : ℕ) (p : ℝ≥0∞) [Fact (1 ≤ p)] (γ C₀ : ℝ) :
    ∃ C : ℝ, ∀ (Ω : Opens (E n)) (hΩ : Bornology.IsBounded (Ω : Set (E n))) (x₀ : E n) (ρ : ℝ)
      (φ : E n → ℝ), 0 < ρ → (∀ y ∈ Metric.ball x₀ ρ, StarConvex ℝ y (Ω : Set (E n))) →
      Metric.diam (Ω : Set (E n)) ≤ γ * ρ → ContDiff ℝ ∞ φ → tsupport φ ⊆ Metric.ball x₀ ρ →
      ∫ x, φ x = 1 → (∀ x, |φ x| ≤ C₀ * ρ ^ (-(n : ℤ))) →
      ∀ (u : Wkp volume Ω p (m + 1)) (j : ℕ) (hj : j ≤ m),
        seminorm (m + 1) j (hj.trans m.le_succ)
            (u - Wkp.ofPolynomialL hΩ (m + 1) m
              (averagedTaylorL φ m (Wkp.toOrderL m.le_succ u))) ≤
          C * Metric.diam (Ω : Set (E n)) ^ (m + 1 - j) * seminorm (m + 1) (m + 1) le_rfl u :=
  sorry

end TauCetiRoadmap.SobolevPolynomialApproximation

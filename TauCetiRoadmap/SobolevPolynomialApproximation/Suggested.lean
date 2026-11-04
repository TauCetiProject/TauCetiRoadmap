import Mathlib
import TauCeti.Analysis.Sobolev.Wkp.Basic

/-!
# Polynomial approximation in Sobolev spaces: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. This file states the roadmap's headline theorems against the pinned Mathlib and
Tau Ceti, so that contributors and reviewers converge on names and signatures.

The headline statements below use existential Sobolev representatives where the bundled operator
is a target of the README. These headlines are stated in `README.md` alone:

* the averaged Taylor polynomial (§3.3) and the representation formula (§3.5): they need the
  contractions of §1.1 and the kernel of §3.3; `exists_bramble_hilbert` records the approximating
  polynomial without its construction;
* Rellich–Kondrachov in `W^{k,p}` (§4.3) and Deny–Lions (§4.4): they need
  `Set.IsLipschitzDomainWith` and its first-order Rellich theorem, which are not in the pinned
  Tau Ceti.

The functional forms of §4.2 are corollaries of `exists_bramble_hilbert` and are not restated.
-/

noncomputable section

open MeasureTheory TopologicalSpace TauCeti
open scoped ENNReal ContDiff

namespace TauCetiRoadmap.SobolevPolynomialApproximation

/-- The Euclidean space `ℝⁿ` of the roadmap. -/
abbrev E (n : ℕ) := EuclideanSpace ℝ (Fin n)

/-! ## Layer 1: seminorms, derivatives and the polynomial kernel -/

/-- Evaluation of multivariate polynomials as functions on `ℝⁿ`. -/
def evalₗ (n : ℕ) : MvPolynomial (Fin n) ℝ →ₗ[ℝ] (E n → ℝ) where
  toFun q x := MvPolynomial.eval (fun i => x i) q
  map_add' q r := by ext x; simp
  map_smul' c q := by ext x; simp

/-- Polynomial functions of total degree `≤ m` on `ℝⁿ`. -/
def polynomialsDegLE (n m : ℕ) : Submodule ℝ (E n → ℝ) :=
  (MvPolynomial.restrictTotalDegree (Fin n) ℝ m).map (evalₗ n)

/-- The dimension of the polynomials of total degree `≤ m` in `n` variables (§1.2). -/
theorem finrank_polynomialsDegLE (n m : ℕ) :
    Module.finrank ℝ (polynomialsDegLE n m) = (n + m).choose n := sorry

/-- **Polynomial Poincaré lemma** (§1.6). -/
theorem exists_pderiv_eq {n m : ℕ} (P : Fin n → MvPolynomial (Fin n) ℝ)
    (hP : ∀ i, P i ∈ MvPolynomial.restrictTotalDegree (Fin n) ℝ m)
    (hclosed : ∀ i j, MvPolynomial.pderiv j (P i) = MvPolynomial.pderiv i (P j)) :
    ∃ Q ∈ MvPolynomial.restrictTotalDegree (Fin n) ℝ (m + 1),
      ∀ i, MvPolynomial.pderiv i Q = P i := sorry

variable {n : ℕ} {Ω : Opens (E n)} {p : ℝ≥0∞} [Fact (1 ≤ p)]

/-- Forget the derivatives above order `j`: the iterate of `Wkp.lowerOrderL`, the identity at
`j = k` (§1.3). -/
def toOrderL {j k : ℕ} (h : j ≤ k) : Wkp volume Ω p k →L[ℝ] Wkp volume Ω p j :=
  Nat.leRec (motive := fun k _ => Wkp volume Ω p k →L[ℝ] Wkp volume Ω p j)
    (ContinuousLinearMap.id ℝ _) (fun k _ ih => ih.comp (Wkp.lowerOrderL k)) h

/-- The seminorms `|u|_{j,p}`, `j ≤ k`, on `W^{k,p}(Ω)` (§1.3). -/
def seminorm (k : ℕ) : (j : ℕ) → j ≤ k → Wkp volume Ω p k → ℝ
  | 0, _, u => ‖Wkp.value k u‖
  | j + 1, h, u => ‖Wkp.iteratedGradient j (toOrderL h u)‖

/-- The upper comparison of Tau Ceti's norm with the seminorms (§1.3). -/
theorem norm_le_sqrt_two_mul {k : ℕ} (hk : 1 ≤ k) (u : Wkp volume Ω p k) :
    ‖u‖ ≤ √2 * √(∑ j : Fin (k + 1), seminorm k j j.is_le u ^ 2) := sorry

/-- The lower comparison of Tau Ceti's norm with the seminorms (§1.3). -/
theorem sqrt_le_sqrt_two_mul_norm {k : ℕ} (hk : 1 ≤ k) (u : Wkp volume Ω p k) :
    √(∑ j : Fin (k + 1), seminorm k j j.is_le u ^ 2) ≤ √2 * ‖u‖ := sorry

/-- **Kernel of the top seminorm** (§1.7). -/
theorem seminorm_top_eq_zero_iff (hΩ : IsPreconnected (Ω : Set (E n))) {m : ℕ}
    (u : Wkp volume Ω p (m + 1)) :
    seminorm (m + 1) (m + 1) le_rfl u = 0 ↔
      ∃ q ∈ polynomialsDegLE n m, (Wkp.value (m + 1) u : E n → ℝ) =ᵐ[volume.restrict Ω] q :=
  sorry

/-! ## Layer 2: change of variables -/

/-- **Composition with a `C^k` diffeomorphism** (§2.1): the constant depends only on
`n, k, p` and the derivative bound `L`. -/
theorem exists_norm_comp_le (n k : ℕ) (hk : 1 ≤ k) (p : ℝ≥0∞) [Fact (1 ≤ p)] (L : ℝ) :
    ∃ C : ℝ, ∀ (Ω Ω' : Opens (E n)) (Φ Ψ : E n → E n),
      ContDiffOn ℝ k Φ (Ω' : Set (E n)) → ContDiffOn ℝ 1 Ψ (Ω : Set (E n)) →
      Set.MapsTo Φ (Ω' : Set (E n)) (Ω : Set (E n)) →
      Set.MapsTo Ψ (Ω : Set (E n)) (Ω' : Set (E n)) →
      Set.LeftInvOn Ψ Φ (Ω' : Set (E n)) → Set.RightInvOn Ψ Φ (Ω : Set (E n)) →
      (∀ j, 1 ≤ j → j ≤ k → ∀ x ∈ Ω', ‖iteratedFDeriv ℝ j Φ x‖ ≤ L) →
      (∀ x ∈ Ω, ‖fderiv ℝ Ψ x‖ ≤ L) →
      ∀ u : Wkp volume Ω p k, ∃ v : Wkp volume Ω' p k,
        (Wkp.value k v : E n → ℝ) =ᵐ[volume.restrict (Ω' : Set (E n))]
          (fun x => (Wkp.value k u : E n → ℝ) (Φ x)) ∧
        ‖v‖ ≤ C * ‖u‖ := sorry

/-- **Affine scaling of seminorms** (§2.2). At `p = ∞`, `p.toReal = 0` and the determinant
exponent is `0`. The reverse bound is this statement for the inverse map. -/
theorem exists_affine_scaling (B : E n ≃L[ℝ] E n) (b : E n) (Ω Ω' : Opens (E n))
    (hΩ' : (Ω' : Set (E n)) = (fun x => B x + b) ⁻¹' (Ω : Set (E n))) {k : ℕ}
    (u : Wkp volume Ω p k) :
    ∃ v : Wkp volume Ω' p k,
      (Wkp.value k v : E n → ℝ) =ᵐ[volume.restrict (Ω' : Set (E n))]
        (fun x => (Wkp.value k u : E n → ℝ) (B x + b)) ∧
      ∀ (j : ℕ) (hj : j ≤ k), seminorm k j hj v ≤
        ‖(B : E n →L[ℝ] E n)‖ ^ j *
          |LinearMap.det ((B : E n →L[ℝ] E n) : E n →ₗ[ℝ] E n)| ^ (-1 / p.toReal) *
            seminorm k j hj u := sorry

/-! ## Layer 4: Bramble–Hilbert and Deny–Lions -/

/-- **Bramble–Hilbert** (§4.1): the constant depends only on `n, m, p` and a bound `γ` for the
chunkiness `diam Ω / ρ`. -/
theorem exists_bramble_hilbert (n m : ℕ) (p : ℝ≥0∞) [Fact (1 ≤ p)] (γ : ℝ) :
    ∃ C : ℝ, ∀ (Ω : Opens (E n)) (x₀ : E n) (ρ : ℝ),
      Bornology.IsBounded (Ω : Set (E n)) → 0 < ρ →
      (∀ y ∈ Metric.ball x₀ ρ, StarConvex ℝ y (Ω : Set (E n))) →
      Metric.diam (Ω : Set (E n)) ≤ γ * ρ →
      ∀ u : Wkp volume Ω p (m + 1), ∃ q ∈ polynomialsDegLE n m, ∃ w : Wkp volume Ω p (m + 1),
        (Wkp.value (m + 1) w : E n → ℝ) =ᵐ[volume.restrict (Ω : Set (E n))]
          (fun x => (Wkp.value (m + 1) u : E n → ℝ) x - q x) ∧
        ∀ (j : ℕ) (hj : j ≤ m), seminorm (m + 1) j (hj.trans m.le_succ) w ≤
          C * Metric.diam (Ω : Set (E n)) ^ (m + 1 - j) * seminorm (m + 1) (m + 1) le_rfl u :=
  sorry

/-! ## Layer 5: higher-order embedding and point evaluation -/

/-- **`W^{k,p} ⊆ C⁰`** (§5.1): a continuous bounded representative, with the constant explicit in
`n, k, p` and the chunkiness bound `γ`. At `p = ∞`, `p.toReal = 0` and `n / p.toReal = 0`. -/
theorem exists_continuous_representative (n k : ℕ) (p : ℝ≥0∞) [Fact (1 ≤ p)] (γ : ℝ)
    (hkp : (n : ℝ≥0∞) < k * p ∨ (p = 1 ∧ n ≤ k)) :
    ∃ C : ℝ, ∀ (Ω : Opens (E n)) (x₀ : E n) (ρ : ℝ),
      Bornology.IsBounded (Ω : Set (E n)) → 0 < ρ →
      (∀ y ∈ Metric.ball x₀ ρ, StarConvex ℝ y (Ω : Set (E n))) →
      Metric.diam (Ω : Set (E n)) ≤ γ * ρ →
      ∀ u : Wkp volume Ω p k, ∃ f : E n → ℝ, ContinuousOn f (Ω : Set (E n)) ∧
        (Wkp.value k u : E n → ℝ) =ᵐ[volume.restrict (Ω : Set (E n))] f ∧
        ∀ x ∈ Ω, |f x| ≤ C * ∑ j : Fin (k + 1),
          Metric.diam (Ω : Set (E n)) ^ ((j : ℝ) - n / p.toReal) * seminorm k j j.is_le u := sorry

/-- **Density of functions smooth up to the boundary** (§5.2). -/
theorem dense_contDiff_restrict (hp : p ≠ ⊤) (k : ℕ) {x₀ : E n} {ρ : ℝ}
    (hΩ : Bornology.IsBounded (Ω : Set (E n))) (hρ : 0 < ρ)
    (hstar : ∀ y ∈ Metric.ball x₀ ρ, StarConvex ℝ y (Ω : Set (E n))) :
    Dense {u : Wkp volume Ω p k | ∃ f : E n → ℝ, ContDiff ℝ ∞ f ∧ HasCompactSupport f ∧
      (Wkp.value k u : E n → ℝ) =ᵐ[volume.restrict (Ω : Set (E n))] f} := sorry

end TauCetiRoadmap.SobolevPolynomialApproximation

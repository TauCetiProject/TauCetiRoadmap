import Mathlib
import TauCeti.LinearAlgebra.IntegralLattice.PosDef.Minimum

/-!
# Spherical codes and kissing numbers: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here. The README's routes, the explicit polynomials and their
expansions, and the Checks are not restated.

Points live in `EuclideanSpace ℝ (Fin n)`. A spherical code with inner-product bound `s` is a
finite set of unit vectors whose distinct members have inner product at most `s`; the angular
form "minimal angle at least `θ`", `0 ≤ θ ≤ π`, is the case `s = cos θ`. A kissing configuration
is the set of centres of unit balls that touch the unit ball about the origin and have disjoint
interiors.
The kissing numbers are stated as `IsGreatest` of the set of sizes of kissing configurations, so
no supremum of a possibly unbounded set is taken.

`zonalPolynomial` is copied verbatim from SpecialFunctionsHigherSpheres 3.1, which owns it, with
its addition theorem and reproducing property; the linear programming bound is stated in its
normalisation `ω_{n,k}(1) = 1`. The lattice kissing number is Tau Ceti's
`TauCeti.IntegralLattice.kissingNumber`.
-/

noncomputable section

open scoped InnerProductSpace

namespace TauCetiRoadmap.SphericalCodesAndKissingNumbers

section ZonalCopy

open Polynomial
open scoped Nat

/-- 2.1 (copied verbatim from SpecialFunctionsHigherSpheres 3.1) The normalized zonal polynomial
`ω_{n,l}(t) = ₂F₁(-l, l + n - 2; (n - 1)/2; (1 - t)/2)`, a terminating sum. For `n ≥ 3` it is
`C_l^{(n-2)/2}(t) / C_l^{(n-2)/2}(1)`; for `n = 2` it is the Chebyshev polynomial `T_l`. -/
def zonalPolynomial (n l : ℕ) : ℝ[X] :=
  ∑ k ∈ Finset.range (l + 1),
    C ((ascPochhammer ℝ k).eval (-(l : ℝ)) * (ascPochhammer ℝ k).eval ((l : ℝ) + n - 2) /
      ((ascPochhammer ℝ k).eval (((n : ℝ) - 1) / 2) * k !)) * (C (1 / 2) * (1 - X)) ^ k

end ZonalCopy

/-! ## Layer 1: spherical codes, kissing configurations and lattice shells -/

/-- 1.1 A spherical code in `ℝⁿ` with inner-product bound `s`: a finite set of unit vectors any two
distinct members of which have inner product at most `s` (for `-1 ≤ s ≤ 1`: minimal angle at
least `arccos s`). -/
def IsSphericalCode {n : ℕ} (C : Finset (EuclideanSpace ℝ (Fin n))) (s : ℝ) : Prop :=
  (∀ x ∈ C, ‖x‖ = 1) ∧ ∀ x ∈ C, ∀ y ∈ C, x ≠ y → ⟪x, y⟫_ℝ ≤ s

/-- 1.1 A kissing configuration in `ℝⁿ`: the centres of unit balls that touch the unit ball about
the origin (centre at distance `2`) and whose interiors are pairwise disjoint (distinct centres at
distance at least `2`). -/
def IsKissingConfiguration {n : ℕ} (C : Finset (EuclideanSpace ℝ (Fin n))) : Prop :=
  (∀ x ∈ C, ‖x‖ = 2) ∧ ∀ x ∈ C, ∀ y ∈ C, x ≠ y → 2 ≤ ‖x - y‖

/-- 1.2 The minimal vectors of a positive definite integral lattice of rank `n`, realised
isometrically in `ℝⁿ` and rescaled to unit length, form a spherical code with inner-product bound
`1/2` whose size is the lattice kissing number. -/
theorem exists_isSphericalCode_card_eq_kissingNumber {V : Type*} [AddCommGroup V] [Module ℚ V]
    (L : TauCeti.IntegralLattice V) (hL : L.IsPosDef) {n : ℕ} (hn : Module.finrank ℚ V = n) :
    ∃ C : Finset (EuclideanSpace ℝ (Fin n)), IsSphericalCode C (1 / 2) ∧
      C.card = L.kissingNumber := by
  sorry

/-! ## Layer 2: the linear programming bound -/

/-- 2.1 **Delsarte–Goethals–Seidel linear programming bound.** Let `n ≥ 2` and
`h = ∑_{k ≤ d} c_k ω_{n,k}` with `c_k ≥ 0`, `c_0 > 0` and `h ≤ 0` on `[-1, s]`. Then every
spherical code in `ℝⁿ` with inner-product bound `s` has at most `h(1)/c_0` points. -/
theorem IsSphericalCode.card_le_eval_one_div {n : ℕ} (hn : 2 ≤ n) {s : ℝ} {d : ℕ} {c : ℕ → ℝ}
    {h : Polynomial ℝ}
    (hh : h = ∑ k ∈ Finset.range (d + 1), Polynomial.C (c k) * zonalPolynomial n k)
    (hc : ∀ k ≤ d, 0 ≤ c k) (hc0 : 0 < c 0) (hneg : ∀ t ∈ Set.Icc (-1 : ℝ) s, h.eval t ≤ 0)
    {C : Finset (EuclideanSpace ℝ (Fin n))} (hC : IsSphericalCode C s) :
    (C.card : ℝ) ≤ h.eval 1 / c 0 := by
  sorry

/-- 2.2 **Equality in the linear programming bound.** Under the hypotheses of 2.1, a code with
exactly `h(1)/c_0` points has every inner product of two distinct points at a zero of `h`, and
for every `1 ≤ k ≤ d` with `c_k > 0` and every unit vector `z`, `∑_{y ∈ C} ω_{n,k}(⟪z, y⟫) = 0`. -/
theorem IsSphericalCode.eval_eq_zero_of_card_eq {n : ℕ} (hn : 2 ≤ n) {s : ℝ} {d : ℕ}
    {c : ℕ → ℝ} {h : Polynomial ℝ}
    (hh : h = ∑ k ∈ Finset.range (d + 1), Polynomial.C (c k) * zonalPolynomial n k)
    (hc : ∀ k ≤ d, 0 ≤ c k) (hc0 : 0 < c 0) (hneg : ∀ t ∈ Set.Icc (-1 : ℝ) s, h.eval t ≤ 0)
    {C : Finset (EuclideanSpace ℝ (Fin n))} (hC : IsSphericalCode C s)
    (hcard : (C.card : ℝ) = h.eval 1 / c 0) :
    (∀ x ∈ C, ∀ y ∈ C, x ≠ y → h.eval ⟪x, y⟫_ℝ = 0) ∧
      ∀ k, 1 ≤ k → k ≤ d → 0 < c k → ∀ z : EuclideanSpace ℝ (Fin n), ‖z‖ = 1 →
        ∑ y ∈ C, (zonalPolynomial n k).eval ⟪z, y⟫_ℝ = 0 := by
  sorry

/-! ## Layer 3: the kissing numbers of `ℝ²`, `ℝ⁸` and `ℝ²⁴` -/

/-- 3.1 The kissing number of the plane is `6`: some kissing configuration in `ℝ²` has `6` points
and none has more. -/
theorem isGreatest_card_kissingConfiguration_two :
    IsGreatest {k : ℕ | ∃ C : Finset (EuclideanSpace ℝ (Fin 2)),
      IsKissingConfiguration C ∧ C.card = k} 6 := by
  sorry

/-- 3.2 **Kissing number in dimension 8** (Levenshtein; Odlyzko–Sloane): some kissing
configuration in `ℝ⁸` has `240` points and none has more. -/
theorem isGreatest_card_kissingConfiguration_eight :
    IsGreatest {k : ℕ | ∃ C : Finset (EuclideanSpace ℝ (Fin 8)),
      IsKissingConfiguration C ∧ C.card = k} 240 := by
  sorry

/-- 3.3 **Kissing number in dimension 24** (Levenshtein; Odlyzko–Sloane): some kissing
configuration in `ℝ²⁴` has `196560` points and none has more. -/
theorem isGreatest_card_kissingConfiguration_twentyFour :
    IsGreatest {k : ℕ | ∃ C : Finset (EuclideanSpace ℝ (Fin 24)),
      IsKissingConfiguration C ∧ C.card = k} 196560 := by
  sorry

/-! ## Layer 4: the inner products of the optimal codes -/

/-- 4.1 In a spherical code in `ℝ⁸` with inner-product bound `1/2` and `240` points, every inner
product of two distinct points is `-1`, `-1/2`, `0` or `1/2`, and every point has exactly
`1`, `56`, `126` and `56` points of the code at these inner products. -/
theorem IsSphericalCode.inner_of_card_eq_240 {C : Finset (EuclideanSpace ℝ (Fin 8))}
    (hC : IsSphericalCode C (1 / 2)) (hcard : C.card = 240) :
    (∀ x ∈ C, ∀ y ∈ C, x ≠ y →
      ⟪x, y⟫_ℝ = -1 ∨ ⟪x, y⟫_ℝ = -1 / 2 ∨ ⟪x, y⟫_ℝ = 0 ∨ ⟪x, y⟫_ℝ = 1 / 2) ∧
      ∀ x ∈ C, (C.filter fun y => ⟪x, y⟫_ℝ = -1).card = 1 ∧
        (C.filter fun y => ⟪x, y⟫_ℝ = -1 / 2).card = 56 ∧
        (C.filter fun y => ⟪x, y⟫_ℝ = 0).card = 126 ∧
        (C.filter fun y => ⟪x, y⟫_ℝ = 1 / 2).card = 56 := by
  sorry

/-- 4.2 In a spherical code in `ℝ²⁴` with inner-product bound `1/2` and `196560` points, every
inner product of two distinct points is `-1`, `±1/2`, `±1/4` or `0`, and every point has exactly
`1`, `4600`, `47104`, `93150`, `47104` and `4600` points of the code at inner products
`-1`, `-1/2`, `-1/4`, `0`, `1/4` and `1/2`. -/
theorem IsSphericalCode.inner_of_card_eq_196560 {C : Finset (EuclideanSpace ℝ (Fin 24))}
    (hC : IsSphericalCode C (1 / 2)) (hcard : C.card = 196560) :
    (∀ x ∈ C, ∀ y ∈ C, x ≠ y →
      ⟪x, y⟫_ℝ = -1 ∨ ⟪x, y⟫_ℝ = -1 / 2 ∨ ⟪x, y⟫_ℝ = -1 / 4 ∨ ⟪x, y⟫_ℝ = 0 ∨
        ⟪x, y⟫_ℝ = 1 / 4 ∨ ⟪x, y⟫_ℝ = 1 / 2) ∧
      ∀ x ∈ C, (C.filter fun y => ⟪x, y⟫_ℝ = -1).card = 1 ∧
        (C.filter fun y => ⟪x, y⟫_ℝ = -1 / 2).card = 4600 ∧
        (C.filter fun y => ⟪x, y⟫_ℝ = -1 / 4).card = 47104 ∧
        (C.filter fun y => ⟪x, y⟫_ℝ = 0).card = 93150 ∧
        (C.filter fun y => ⟪x, y⟫_ℝ = 1 / 4).card = 47104 ∧
        (C.filter fun y => ⟪x, y⟫_ℝ = 1 / 2).card = 4600 := by
  sorry

end TauCetiRoadmap.SphericalCodesAndKissingNumbers

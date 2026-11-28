import Mathlib

/-!
# Consumer theory and duality: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib, each with `sorry`, together with the few
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here. The README's Checks and worked examples are not
restated.

A consumer is a function `u : (Fin ℓ → ℝ) → ℝ`; only its values on the nonnegative orthant
`0 ≤ x` enter. Prices are vectors `p : Fin ℓ → ℝ`, and most statements assume `∀ i, 0 < p i`.
The indirect utility is a supremum and the expenditure function an infimum of a set of reals, so
Mathlib's conventions `sSup ∅ = 0`, `sInf ∅ = 0` and value `0` on unbounded sets apply off the
hypotheses stated; derivatives are `fderiv`, which is `0` where the function is not
differentiable.
-/

noncomputable section

open Matrix Filter Topology

namespace TauCetiRoadmap.ConsumerTheoryDuality

variable {ℓ : ℕ}

/-! ## Layer 1: budget sets and demand -/

/-- 1.1 The budget set at prices `p` and income `m`: the nonnegative bundles that cost at most
`m`. -/
def budgetSet (p : Fin ℓ → ℝ) (m : ℝ) : Set (Fin ℓ → ℝ) :=
  {x | 0 ≤ x ∧ p ⬝ᵥ x ≤ m}

/-- 1.1 Local nonsatiation on the orthant: arbitrarily close to every nonnegative bundle there is
a nonnegative bundle of strictly higher utility. -/
def LocallyNonsatiated (u : (Fin ℓ → ℝ) → ℝ) : Prop :=
  ∀ x, 0 ≤ x → ∀ ε > 0, ∃ z, 0 ≤ z ∧ dist z x < ε ∧ u x < u z

/-- 1.2 The Marshallian demand at `(p, m)`: the set of maximizers of `u` on the budget set. -/
def marshallianDemand (u : (Fin ℓ → ℝ) → ℝ) (p : Fin ℓ → ℝ) (m : ℝ) : Set (Fin ℓ → ℝ) :=
  {x | x ∈ budgetSet p m ∧ ∀ y ∈ budgetSet p m, u y ≤ u x}

/-- 1.2 The indirect utility at `(p, m)`: the supremum of `u` over the budget set. -/
def indirectUtility (u : (Fin ℓ → ℝ) → ℝ) (p : Fin ℓ → ℝ) (m : ℝ) : ℝ :=
  sSup (u '' budgetSet p m)

/-- 1.2 For an upper semicontinuous `u` on the orthant, prices with positive coordinates and
nonnegative income, the Marshallian demand is nonempty, and the indirect utility is the utility
of any demanded bundle. -/
theorem marshallianDemand_nonempty {u : (Fin ℓ → ℝ) → ℝ} (hu : UpperSemicontinuousOn u (Set.Ici 0))
    {p : Fin ℓ → ℝ} (hp : ∀ i, 0 < p i) {m : ℝ} (hm : 0 ≤ m) :
    (marshallianDemand u p m).Nonempty ∧
      ∀ x ∈ marshallianDemand u p m, indirectUtility u p m = u x := by
  sorry

/-- 1.2 Budget exhaustion: under local nonsatiation every demanded bundle spends the whole
income. -/
theorem dotProduct_eq_of_mem_marshallianDemand {u : (Fin ℓ → ℝ) → ℝ}
    (hlns : LocallyNonsatiated u) {p : Fin ℓ → ℝ} {m : ℝ} {x : Fin ℓ → ℝ}
    (hx : x ∈ marshallianDemand u p m) : p ⬝ᵥ x = m := by
  sorry

/-- 1.3 The Hicksian demand at `(p, ū)`: the nonnegative bundles of utility at least `ū` that
cost least among all such bundles. -/
def hicksianDemand (u : (Fin ℓ → ℝ) → ℝ) (p : Fin ℓ → ℝ) (ū : ℝ) : Set (Fin ℓ → ℝ) :=
  {x | 0 ≤ x ∧ ū ≤ u x ∧ ∀ y, 0 ≤ y → ū ≤ u y → p ⬝ᵥ x ≤ p ⬝ᵥ y}

/-- 1.3 The expenditure function at `(p, ū)`: the infimum of the cost of the nonnegative bundles
of utility at least `ū`. -/
def expenditure (u : (Fin ℓ → ℝ) → ℝ) (p : Fin ℓ → ℝ) (ū : ℝ) : ℝ :=
  sInf ((fun x => p ⬝ᵥ x) '' {x | 0 ≤ x ∧ ū ≤ u x})

/-- 1.3 For an upper semicontinuous `u` on the orthant, prices with positive coordinates and a
level `ū` reached by some nonnegative bundle, the Hicksian demand is nonempty, and the
expenditure is the cost of any bundle in it. -/
theorem hicksianDemand_nonempty {u : (Fin ℓ → ℝ) → ℝ} (hu : UpperSemicontinuousOn u (Set.Ici 0))
    {p : Fin ℓ → ℝ} (hp : ∀ i, 0 < p i) {ū : ℝ} (hū : ∃ y, 0 ≤ y ∧ ū ≤ u y) :
    (hicksianDemand u p ū).Nonempty ∧ ∀ x ∈ hicksianDemand u p ū, expenditure u p ū = p ⬝ᵥ x := by
  sorry

/-! ## Layer 2: the duality between utility maximization and expenditure minimization -/

/-- 2.1 Spending the indirect utility costs the whole income: `e(p, v(p, m)) = m`, for an upper
semicontinuous, locally nonsatiated `u`, prices with positive coordinates and `m ≥ 0`. -/
theorem expenditure_indirectUtility {u : (Fin ℓ → ℝ) → ℝ}
    (hu : UpperSemicontinuousOn u (Set.Ici 0)) (hlns : LocallyNonsatiated u)
    {p : Fin ℓ → ℝ} (hp : ∀ i, 0 < p i) {m : ℝ} (hm : 0 ≤ m) :
    expenditure u p (indirectUtility u p m) = m := by
  sorry

/-- 2.1 Under the same hypotheses the Marshallian demand at `(p, m)` is the Hicksian demand at
the level `v(p, m)`. -/
theorem marshallianDemand_eq_hicksianDemand {u : (Fin ℓ → ℝ) → ℝ}
    (hu : UpperSemicontinuousOn u (Set.Ici 0)) (hlns : LocallyNonsatiated u)
    {p : Fin ℓ → ℝ} (hp : ∀ i, 0 < p i) {m : ℝ} (hm : 0 ≤ m) :
    marshallianDemand u p m = hicksianDemand u p (indirectUtility u p m) := by
  sorry

/-- 2.2 The indirect utility at the expenditure income is the level: `v(p, e(p, ū)) = ū`, for
`u` continuous on the orthant, prices with positive coordinates and a level `ū` with
`u 0 ≤ ū` that some nonnegative bundle reaches. No nonsatiation is assumed. -/
theorem indirectUtility_expenditure {u : (Fin ℓ → ℝ) → ℝ} (hu : ContinuousOn u (Set.Ici 0))
    {p : Fin ℓ → ℝ} (hp : ∀ i, 0 < p i) {ū : ℝ} (h0 : u 0 ≤ ū)
    (hū : ∃ y, 0 ≤ y ∧ ū ≤ u y) :
    indirectUtility u p (expenditure u p ū) = ū := by
  sorry

/-- 2.2 The Hicksian demand at `(p, ū)` is the Marshallian demand at the income `e(p, ū)`, for
`u` continuous on the orthant, prices with positive coordinates and a level `ū` that some
nonnegative bundle reaches. -/
theorem hicksianDemand_eq_marshallianDemand {u : (Fin ℓ → ℝ) → ℝ}
    (hu : ContinuousOn u (Set.Ici 0)) {p : Fin ℓ → ℝ} (hp : ∀ i, 0 < p i) {ū : ℝ}
    (hū : ∃ y, 0 ≤ y ∧ ū ≤ u y) :
    hicksianDemand u p ū = marshallianDemand u p (expenditure u p ū) := by
  sorry

/-! ## Layer 3: properties of the expenditure and indirect utility functions -/

/-- 3.1 For every `u` and every level `ū`, the expenditure function is concave, positively
homogeneous of degree one and monotone in the prices on the closed orthant of prices. -/
theorem expenditure_concaveOn_homogeneous_monotone (u : (Fin ℓ → ℝ) → ℝ) (ū : ℝ) :
    ConcaveOn ℝ (Set.Ici 0) (fun p => expenditure u p ū) ∧
      (∀ p, 0 ≤ p → ∀ t : ℝ, 0 ≤ t → expenditure u (t • p) ū = t * expenditure u p ū) ∧
      (∀ p q, 0 ≤ p → p ≤ q → expenditure u p ū ≤ expenditure u q ū) := by
  sorry

/-- 3.2 The indirect utility is homogeneous of degree zero in `(p, m)`, antitone in the prices and
monotone in the income, for an upper semicontinuous `u`, prices with positive coordinates and
`m ≥ 0`; under local nonsatiation it is strictly increasing in the income. -/
theorem indirectUtility_homogeneous_monotone {u : (Fin ℓ → ℝ) → ℝ}
    (hu : UpperSemicontinuousOn u (Set.Ici 0)) {p : Fin ℓ → ℝ} (hp : ∀ i, 0 < p i) {m : ℝ}
    (hm : 0 ≤ m) :
    (∀ t : ℝ, 0 < t → indirectUtility u (t • p) (t * m) = indirectUtility u p m) ∧
      (∀ q, p ≤ q → indirectUtility u q m ≤ indirectUtility u p m) ∧
      (∀ m', m ≤ m' → indirectUtility u p m ≤ indirectUtility u p m') ∧
      (LocallyNonsatiated u → ∀ m', m < m' → indirectUtility u p m < indirectUtility u p m') := by
  sorry

/-- 3.3 The indirect utility of an upper semicontinuous `u` is quasiconvex in `(p, m)` on the
set of prices with positive coordinates and nonnegative incomes. -/
theorem quasiconvexOn_indirectUtility {u : (Fin ℓ → ℝ) → ℝ}
    (hu : UpperSemicontinuousOn u (Set.Ici 0)) :
    QuasiconvexOn ℝ {pm : (Fin ℓ → ℝ) × ℝ | (∀ i, 0 < pm.1 i) ∧ 0 ≤ pm.2}
      (fun pm => indirectUtility u pm.1 pm.2) := by
  sorry

/-! ## Layer 4: Shephard's lemma and Roy's identity -/

/-- 4.1 Shephard's lemma. For an upper semicontinuous `u` on the orthant and prices with positive
coordinates, if the Hicksian demand at `(p, ū)` is a single bundle `h`, then the expenditure
function is differentiable in the prices at `p` with derivative `q ↦ q ⬝ᵥ h`. No
differentiability or convexity of `u` is assumed. -/
theorem hasFDerivAt_expenditure {u : (Fin ℓ → ℝ) → ℝ} (hu : UpperSemicontinuousOn u (Set.Ici 0))
    {p : Fin ℓ → ℝ} (hp : ∀ i, 0 < p i) {ū : ℝ} {h : Fin ℓ → ℝ}
    (hh : hicksianDemand u p ū = {h}) :
    HasFDerivAt (fun q => expenditure u q ū)
      (∑ i, h i • ContinuousLinearMap.proj (R := ℝ) (φ := fun _ : Fin ℓ => ℝ) i) p := by
  sorry

/-- 4.1 The converse of Shephard's lemma, for every `u`: at prices with positive coordinates
where the expenditure function is differentiable, the Hicksian demand has at most one element. -/
theorem subsingleton_hicksianDemand_of_differentiableAt {u : (Fin ℓ → ℝ) → ℝ}
    {p : Fin ℓ → ℝ} (hp : ∀ i, 0 < p i) {ū : ℝ}
    (hd : DifferentiableAt ℝ (fun q => expenditure u q ū) p) :
    (hicksianDemand u p ū).Subsingleton := by
  sorry

/-- 4.2 Roy's identity, for every `u`. Let `V (q, m') = v(q, m')` and let `x` be in the
Marshallian demand at `(p, m)`. Then `∂V/∂pⱼ + xⱼ ∂V/∂m = 0` at `(p, m)`, and where `∂V/∂m` does
not vanish, `xⱼ = -(∂V/∂pⱼ) / (∂V/∂m)`. The partial derivatives are those of the Fréchet
derivative of `V` at `(p, m)`, which is `0` where `V` is not differentiable. -/
theorem roy_identity {u : (Fin ℓ → ℝ) → ℝ} {p : Fin ℓ → ℝ} {m : ℝ} {x : Fin ℓ → ℝ}
    (hx : x ∈ marshallianDemand u p m) (j : Fin ℓ) :
    let V : (Fin ℓ → ℝ) × ℝ → ℝ := fun pm => indirectUtility u pm.1 pm.2
    fderiv ℝ V (p, m) (Pi.single j 1, 0) + x j * fderiv ℝ V (p, m) (0, 1) = 0 ∧
      (fderiv ℝ V (p, m) (0, 1) ≠ 0 →
        x j = -fderiv ℝ V (p, m) (Pi.single j 1, 0) / fderiv ℝ V (p, m) (0, 1)) := by
  sorry

/-! ## Layer 5: the Slutsky matrix -/

/-- 5.1 The Slutsky matrix of a demand function `x` at `(p, m)`: the entry `(i, j)` is
`∂xᵢ/∂pⱼ + xⱼ ∂xᵢ/∂m`, with the partial derivatives taken from the Fréchet derivative of
`(q, m') ↦ x q m'` at `(p, m)`. -/
def slutskyMatrix (x : (Fin ℓ → ℝ) → ℝ → Fin ℓ → ℝ) (p : Fin ℓ → ℝ) (m : ℝ) :
    Matrix (Fin ℓ) (Fin ℓ) ℝ :=
  fun i j => fderiv ℝ (Function.uncurry x) (p, m) (Pi.single j 1, 0) i +
    x p m j * fderiv ℝ (Function.uncurry x) (p, m) (0, 1) i

/-- 5.1 The Slutsky equation. Let `u` be continuous on the orthant, let the Marshallian demand
be a single bundle `x q m'` at all prices with positive coordinates and all `m' ≥ 0`, let `p`
have positive coordinates and let some nonnegative bundle reach the level `ū`. Then the Hicksian
demand at `(q, ū)` is the single bundle `x q (e(q, ū))` for all such `q`, and if `x` is
differentiable at `(p, e(p, ū))`, this Hicksian demand function has at `p` the derivative given
by the Slutsky matrix at `(p, e(p, ū))`. -/
theorem hasFDerivAt_hicksian_slutskyMatrix {u : (Fin ℓ → ℝ) → ℝ}
    (hu : ContinuousOn u (Set.Ici 0)) {x : (Fin ℓ → ℝ) → ℝ → Fin ℓ → ℝ}
    (hx : ∀ q m', (∀ i, 0 < q i) → 0 ≤ m' → marshallianDemand u q m' = {x q m'})
    {p : Fin ℓ → ℝ} (hp : ∀ i, 0 < p i) {ū : ℝ} (hū : ∃ y, 0 ≤ y ∧ ū ≤ u y)
    (hd : DifferentiableAt ℝ (Function.uncurry x) (p, expenditure u p ū)) :
    (∀ q, (∀ i, 0 < q i) → hicksianDemand u q ū = {x q (expenditure u q ū)}) ∧
      HasFDerivAt (fun q => x q (expenditure u q ū))
        (LinearMap.toContinuousLinearMap
          (Matrix.toLin' (slutskyMatrix x p (expenditure u p ū)))) p := by
  sorry

/-- 5.2 Under the hypotheses of 5.1 on `u` and `x`, at prices with positive coordinates and any
level `ū`, the Slutsky matrix at `(p, e(p, ū))` is symmetric and negative semidefinite and has
`p` in its kernel. No differentiability is assumed: where `x` is not differentiable the matrix
is `0`. -/
theorem slutskyMatrix_isSymm_negSemidef {u : (Fin ℓ → ℝ) → ℝ}
    (hu : ContinuousOn u (Set.Ici 0)) {x : (Fin ℓ → ℝ) → ℝ → Fin ℓ → ℝ}
    (hx : ∀ q m', (∀ i, 0 < q i) → 0 ≤ m' → marshallianDemand u q m' = {x q m'})
    {p : Fin ℓ → ℝ} (hp : ∀ i, 0 < p i) (ū : ℝ) :
    (slutskyMatrix x p (expenditure u p ū)).IsSymm ∧
      (∀ w, w ⬝ᵥ (slutskyMatrix x p (expenditure u p ū) *ᵥ w) ≤ 0) ∧
      slutskyMatrix x p (expenditure u p ū) *ᵥ p = 0 := by
  sorry

end TauCetiRoadmap.ConsumerTheoryDuality
